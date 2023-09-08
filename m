Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A884EE57EE
	for <intel-xe@archiver.kernel.org>; Fri,  8 Sep 2023 10:11:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 256E710E04B;
	Fri,  8 Sep 2023 10:11:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1A0E10E04B
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Sep 2023 10:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694167890; x=1725703890;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=c4rtocTN1WJT8o+/EVktYt83qoNzSY1VSE+rD6CKyhE=;
 b=QI6IuxlmPEaN69BYMZwD8jI4NQdo/yUTiptFVvrVRtGwn1kKN7S7sg2s
 ngNObLh13fl9jnfGIMda1TjircdWCJtaHvRVgcVGokMI5p1ztvIIk5Qp+
 0BJTo9qsjFtlsaEN+yzYmtlWIDV7XfizoFfw/rz9bKh/VQYiNg4cS3yb2
 yqrbduEvle1M6G1hI4iKaYVWzXmpbQhgACKS2TQMXr+e8rymZ1Z8hIfIt
 g3/Wzs67XZGpupr+COUYv1rm5r6jGdgckfcV5yjuknG4CYcXPjnTnvHjZ
 hAc8qJEWUdaRawkS2DAKOHtsVv0vmyFFv4fzQyZDHushaG8hSgMGhyXRJ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="357916685"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; d="scan'208";a="357916685"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2023 03:11:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="916123109"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; d="scan'208";a="916123109"
Received: from hieule-mobl2.amr.corp.intel.com (HELO localhost)
 ([10.252.34.174])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2023 03:11:28 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, Balasubramani Vivekanandan
 <balasubramani.vivekanandan@intel.com>
In-Reply-To: <ZPjHWcv10MhWgnYf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230906060400.4144425-1-balasubramani.vivekanandan@intel.com>
 <ZPjHWcv10MhWgnYf@intel.com>
Date: Fri, 08 Sep 2023 13:11:23 +0300
Message-ID: <874jk5gek4.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH] drm/xe/display: Print display ip version
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

On Wed, 06 Sep 2023, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
> On Wed, Sep 06, 2023 at 11:34:00AM +0530, Balasubramani Vivekanandan wrote:
>> Print display ip version during module load
>
> Isn't this useful on i915 side as well?

https://lore.kernel.org/r/87r0nbheil.fsf@intel.com

>
>> 
>> Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_pci.c | 5 +++++
>>  1 file changed, 5 insertions(+)
>> 
>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>> index 60f3474844e2..fc01544346d5 100644
>> --- a/drivers/gpu/drm/xe/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>> @@ -844,6 +844,11 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>>  		str_yes_no(xe->info.enable_display),
>>  		xe->info.dma_mask_size, xe->info.tile_count);
>>  
>> +	if (xe->info.enable_display)
>> +		drm_dbg(&xe->drm, "Display: %d.%02d\n",
>> +			xe->info.display_runtime.ip.ver,
>> +			xe->info.display_runtime.ip.rel);
>> +
>>  	drm_dbg(&xe->drm, "Stepping = (G:%s, M:%s, D:%s, B:%s)\n",
>>  		xe_step_name(xe->info.step.graphics),
>>  		xe_step_name(xe->info.step.media),
>> -- 
>> 2.25.1
>> 

-- 
Jani Nikula, Intel Open Source Graphics Center
