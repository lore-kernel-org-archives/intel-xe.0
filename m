Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E86EDC77B6E
	for <intel-xe@archiver.kernel.org>; Wed, 12 Apr 2023 07:40:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8825B10E24E;
	Wed, 12 Apr 2023 07:40:20 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B17A10E24E
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Apr 2023 07:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681285218; x=1712821218;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=S4kN6MqG4506gyeMJZQdBMpr399zJDbwU+pfU8apAqk=;
 b=IYmvTx6CbRiXpCFlwBYbcAyyhH1q3NOH3Y0Q2XWO2re38pstk0Qv4A96
 wf3q6Cyf4x3OHLiZBjmH3gQOECK3WUbaUt/L+hConT7rpyDeuczMsGDYW
 QDIiUEUeNRhWiVvsweEQVODXnwYnbQ1VSphI9ZkbUI42X1neUxBrITtnz
 twdm1hVkL1ZH3sw0HWkE6I+BbpoDWETSZKstic6n7/gNciV7PUrPBkoNb
 OZvPxFV51hWybn6zLmpI2Zsr2BHac6eZN6YxtL83eFsaaBTLj7As5E8c7
 0K06muCtPsHbE6JI0SDrt+VaqUUt74JCxcSkUJgFB3dcv4uuLF7QA8UeN w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="346505307"
X-IronPort-AV: E=Sophos;i="5.98,338,1673942400"; d="scan'208";a="346505307"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 00:40:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="1018652996"
X-IronPort-AV: E=Sophos;i="5.98,338,1673942400"; d="scan'208";a="1018652996"
Received: from wjanjua-mobl.ger.corp.intel.com (HELO [10.252.30.36])
 ([10.252.30.36])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 00:39:59 -0700
Message-ID: <caf921fa-a2e7-7b3b-ae1a-ad1ecba23747@intel.com>
Date: Wed, 12 Apr 2023 08:39:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.8.0
Content-Language: en-GB
To: Lucas De Marchi <lucas.demarchi@intel.com>
References: <20230411100458.24314-1-matthew.auld@intel.com>
 <20230411183134.vbq4if6lh72fc2xv@ldmartin-desk2.lan>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20230411183134.vbq4if6lh72fc2xv@ldmartin-desk2.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH] drm/xe/mmio: stop incorrectly triggering
 drm_warn
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 11/04/2023 19:31, Lucas De Marchi wrote:
> On Tue, Apr 11, 2023 at 11:04:58AM +0100, Matthew Auld wrote:
>> CI keeps triggering:
>>
>> xe 0000:03:00.0: [drm] Restricting VRAM size to PCI resource size
>> (0x400000000->0x3fa000000)
>>
>> Due to usable_size vs vram_size differences. However, we only want to
>> trigger the drm_warn() to let developers know that the system they are
>> using is going clamp the VRAM size to match the IO size, where they can
>> likely only use 256M of VRAM. Once we properly support small-bar we can
>> drop this.
>>
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
>> ---
>> drivers/gpu/drm/xe/xe_mmio.c | 4 ++--
>> 1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
>> index 5cacaa05759a..7d62fae25bb4 100644
>> --- a/drivers/gpu/drm/xe/xe_mmio.c
>> +++ b/drivers/gpu/drm/xe/xe_mmio.c
>> @@ -228,9 +228,9 @@ int xe_mmio_probe_vram(struct xe_device *xe)
>>     else if (xe->mem.vram.io_size < usable_size && 
>> !xe_force_vram_bar_size)
>>         drm_info(&xe->drm, "Using a reduced BAR size of %lluMiB. 
>> Consider enabling 'Resizable BAR' support in your BIOS.\n",
>>              (u64)xe->mem.vram.size >> 20);
>> -    if (xe->mem.vram.size < vram_size)
>> +    if (usable_size > xe->mem.vram.io_size) /* TODO: remove once we 
>> properly support small-bar */
> 
> The fix looks good,  but I don´t think the TODO makes sense as it has
> perf and uapi implications. Maybe we could downgrade to a info/notice
> when small-bar is fully supported, but not dropping.

We also have the above drm_info "Using a reduced BAR size.." message, 
which will appear for the user.

> 
> For now, I'd merge this without this comment:
> 
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Thanks. I'll also drop the comment for now.

> 
> Lucas De Marchi
> 
>>         drm_warn(&xe->drm, "Restricting VRAM size to PCI resource size 
>> (0x%llx->0x%llx)\n",
>> -             vram_size, (u64)xe->mem.vram.size);
>> +             usable_size, xe->mem.vram.io_size);
>>
>>     xe->mem.vram.mapping = ioremap_wc(xe->mem.vram.io_start, 
>> xe->mem.vram.io_size);
>>     xe->mem.vram.size = min_t(u64, xe->mem.vram.size, usable_size);
>> -- 
>> 2.39.2
>>
