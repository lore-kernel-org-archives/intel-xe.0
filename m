Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 081A0CA0FF9
	for <intel-xe@archiver.kernel.org>; Fri, 29 Aug 2025 11:21:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B76CA10EB88;
	Fri, 29 Aug 2025 11:21:18 +0000 (UTC)
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A017D10EB88
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Aug 2025 11:21:17 +0000 (UTC)
Message-ID: <343ef596-0d4b-4554-874e-a40c2e61ee08@lankhorst.se>
Date: Fri, 29 Aug 2025 13:21:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Attempt to bring bos back to VRAM after eviction
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, stable@vger.kernel.org
References: <20250828154219.4889-1-thomas.hellstrom@linux.intel.com>
 <e8a176ab-a24c-4b9d-a046-ae386f08f129@lankhorst.se>
 <692711fadc25a6c85c19ae16e9c04e50f1eaa3a9.camel@linux.intel.com>
Content-Language: en-US
From: Maarten Lankhorst <dev@lankhorst.se>
In-Reply-To: <692711fadc25a6c85c19ae16e9c04e50f1eaa3a9.camel@linux.intel.com>
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

Den 2025-08-29 kl. 12:55, skrev Thomas Hellström:
> On Fri, 2025-08-29 at 09:42 +0200, Maarten Lankhorst wrote:
>> Hey,
>>
>> Den 2025-08-28 kl. 17:42, skrev Thomas Hellström:
>>> VRAM+TT bos that are evicted from VRAM to TT may remain in
>>> TT also after a revalidation following eviction or suspend.
>>>
>>> This manifests itself as applications becoming sluggish
>>> after buffer objects get evicted or after a resume from
>>> suspend or hibernation.
>>>
>>> If the bo supports placement in both VRAM and TT, and
>>> we are on DGFX, mark the TT placement as fallback. This means
>>> that it is tried only after VRAM + eviction.
>>>
>>> This flaw has probably been present since the xe module was
>>> upstreamed but use a Fixes: commit below where backporting is
>>> likely to be simple. For earlier versions we need to open-
>>> code the fallback algorithm in the driver.
>>>
>>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5995
>>> Fixes: a78a8da51b36 ("drm/ttm: replace busy placement with flags
>>> v6")
>> I'd say it this closes a bug in the original driver, although
>> effectively v6.8 is no longer supported anyway.
>>
>> Should DESIRED also be set on the add_vram flags?
> 
> It looks for me from the TTM code that TTM then *skips* the placement
> when doing a second pass with evictions.
> 
> So that's not really what we want IMO.
> Yeah, seems the flag name is a bit misleading, it's more of an opportunistic placement
when space is available.

Kind regards,
~Maarten Lankhorst
