Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C5DDE77180
	for <intel-xe@archiver.kernel.org>; Wed, 11 Dec 2024 18:52:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4319110E60B;
	Wed, 11 Dec 2024 18:52:52 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 078C510E60B
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Dec 2024 18:52:51 +0000 (UTC)
Message-ID: <c93091af-6337-4e0e-a83c-18e2fea6988b@lankhorst.se>
Date: Wed, 11 Dec 2024 19:52:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/11] drm/xe: Split init of xe_gt_init_hwconfig to
 xe_gt_init and *_early
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
References: <20241210083111.230484-1-dev@lankhorst.se>
 <20241210083111.230484-11-dev@lankhorst.se>
 <cfyy7aff2eavdf4wisztvev6vkuuajngxe53ekh2pkcoa36gtf@3xzilixxu5qm>
Content-Language: en-US
From: Maarten Lankhorst <dev@lankhorst.se>
In-Reply-To: <cfyy7aff2eavdf4wisztvev6vkuuajngxe53ekh2pkcoa36gtf@3xzilixxu5qm>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Den 2024-12-10 kl. 16:25, skrev Lucas De Marchi:
> On Tue, Dec 10, 2024 at 09:31:10AM +0100, Maarten Lankhorst wrote:
>> static void dump_pat_on_error(struct xe_gt *gt)
>> @@ -419,6 +438,18 @@ static int gt_fw_domain_init(struct xe_gt *gt)
>>         goto err_hw_fence_irq;
>>     }
>>
>> +    err = xe_uc_init(&gt->uc);
> 
> what does this have to do with gt_fw_domain_init()?  We should look at
> removing unrelated stuff from this function rather than stashing more.
> 
> Lucas De Marchi

It just needs to be called with FW and during that point of init, can 
perhaps create separate functions all called with fw instead?

Cheers,
Maarten

