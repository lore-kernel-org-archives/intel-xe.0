Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8047CA0FF6
	for <intel-xe@archiver.kernel.org>; Thu, 28 Aug 2025 20:58:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8618410EACB;
	Thu, 28 Aug 2025 20:58:47 +0000 (UTC)
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BA9B10EACB;
 Thu, 28 Aug 2025 20:58:46 +0000 (UTC)
Message-ID: <a85dd557-9dd8-472d-806c-3606b053cfdb@lankhorst.se>
Date: Thu, 28 Aug 2025 22:58:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 0/3] cgroups: Add support for pinned device memory
To: =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?=27Thomas_Hellstr=C3=B6m=27?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Maxime Ripard <mripard@kernel.org>,
 Natalie Vock <natalie.vock@gmx.de>, Tejun Heo <tj@kernel.org>,
 Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "'Liam R . Howlett'" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Michal Hocko <mhocko@suse.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, linux-mm@kvack.org
References: <20250819114932.597600-5-dev@lankhorst.se>
 <qd3ioegpvmrrrwdy2qntxznyrnwq3bhe74lmuxio7sy4sjggtt@tm6nqds3pyvj>
Content-Language: en-US
From: Maarten Lankhorst <dev@lankhorst.se>
In-Reply-To: <qd3ioegpvmrrrwdy2qntxznyrnwq3bhe74lmuxio7sy4sjggtt@tm6nqds3pyvj>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hey,

Den 2025-08-26 kl. 16:20, skrev Michal Koutný:
> Hello Maarten.
> 
> On Tue, Aug 19, 2025 at 01:49:33PM +0200, Maarten Lankhorst <dev@lankhorst.se> wrote:
>> Implementation details:
>>
>> For each cgroup up until the root cgroup, the 'min' limit is checked
>> against currently effectively pinned value. If the value will go above
>> 'min', the pinning attempt is rejected.
> 
> How is pinning different from setting a 'min' limit (from a user
> perspective)?
It's related, in fact you have to set the 'min' limit first.

The 'pinned' allows you to pick /which/ memory falls under the 'min' limit.

>>
>> Pinned memory is handled slightly different and affects calculating
>> effective min/low values. Pinned memory is subtracted from both,
>> and needs to be added afterwards when calculating.
>>
>> This is because increasing the amount of pinned memory, the amount of
>> free min/low memory decreases for all cgroups that are part of the
>> hierarchy.
> 
> What is supposed to happen with pinned memory after cgroup removal?
I think for accounting purposes pinned memory stays pinned,
otherwise the idea of pinning is lost. However when you kill all
processes in the cgroup, that should solve itself eventually.

> I find the page_counter changes little bit complex without understanding
> of the difference between min and pinned. Should this be conceptually
> similar to memory.stat:unevictable? Or rather mlock(2)? So far neither
> of those needed interaction with min/low values (in memcg).
You could in theory implement mlockall using the 'min' values too.

The page counter changes implement the following:

Lets say you have this tree with 'min' values.

      / '5' A
X'6' -- '5' B
      \ '5' C

Effective min without pinned pages:
      / '2' A
X'6' -- '2' B
      \ '2' C

Now 'B' pins 3 pages:

Effective min:
         / '1' A
X'3+3p' -- '1' B (1 + 3 pinned pages makes effective min 4)
         \ '1' C

Same for applies to effective 'low' calculations.

Kind regards,
~Maarten

