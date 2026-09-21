Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24417C982DE
	for <intel-xe@archiver.kernel.org>; Mon, 21 Sep 2026 08:28:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C042110E359;
	Mon, 21 Sep 2026 08:28:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gp8Jiwt7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8924E10E359
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Sep 2026 08:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789979284; x=1821515284;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ahmosaKGKQuCQ+2AOM539xH89cj544jTCXuRxfV0N70=;
 b=Gp8Jiwt7xImVMon8i/Lhbo4fGYcKFeg2ZlkGXZNNzVARLExottIayHqC
 x3xi5eeAzozmOWY0aoXgmm2sUu85M1+aG3h9hnntrSoc3aFTPpXrwqnQZ
 rOBtn/hqPBkm+MTdQbtjHwHEr92YVvzszYRoOAIo9H8Zr8onSXqcSR/fc
 wIsgLp+DF8wYIdBXXY0l4tRjeLtnwRJSOhCFs8Aj6JwD3O733j+dhv9IH
 uw7xbhu84V4Z1/cpVHYfUn7lir6+2osAwRHSQEwMXMU8lZQAA0IXnY3pq
 jm+EYaysk+nvHqw48ALSCm37VldaSabjtm0+0r1ohY+7os5IYl5OlC5f2 Q==;
X-CSE-ConnectionGUID: LS7zk1PpQ9qACDokgGZkpg==
X-CSE-MsgGUID: 6qzkWjbdS2a4LI3sB+ITMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11911"; a="94303479"
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; d="scan'208";a="94303479"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 01:28:04 -0700
X-CSE-ConnectionGUID: LQPxBTuHRv+5Y2rvIWFrRQ==
X-CSE-MsgGUID: Kqph4SjlTPuxkyyae1hBKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; d="scan'208";a="298816951"
Received: from soc-5cg43972f8.clients.intel.com (HELO [172.28.182.3])
 ([172.28.182.3])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 01:28:03 -0700
Message-ID: <fe338ca4-ab57-4adb-9bb5-d81c70467466@linux.intel.com>
Date: Mon, 21 Sep 2026 10:28:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/pf: Keep VF LMEM BAR size low if no VFs enabled
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org,
 =?UTF-8?Q?Micha=C5=82_Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>
References: <20260918110130.700332-1-marcin.bernatowicz@linux.intel.com>
 <aq1PtZBFIVB4ORrZ@intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <aq1PtZBFIVB4ORrZ@intel.com>
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


On 9/18/2026 4:50 PM, Rodrigo Vivi wrote:
> On Fri, Sep 18, 2026 at 01:01:30PM +0200, Marcin Bernatowicz wrote:
>> When VFs are enabled on dGFX the driver resizes the PF VF_LMEM_BAR to
>> fit the requested layout. After VFs are disabled the PF VF BAR
>> size is left as-is. On platforms with tight MMIO apertures a
>> subsequent unplug/rescan followed by another enable may fail with:
>>
>>    "VF BAR …: can't assign; no space"
>>
>> because the PCI core reserves address space based on the (now large) VF
>> template, often multiplied by totalvfs.
>>
>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5937
>> Fixes: 94eae6ee4c2d ("drm/xe/pf: Set VF LMEM BAR size")
>> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
>> Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Michał Winiarski <michal.winiarski@intel.com>
>> ---
>> v4:
>>   - use directly pf_resize_vf_vram_bar helper with device_total_vfs value.
>> v3:
>>   - rebased to resolve conflicts, no other functional changes were done
>> v2:
>>   - Rename helper to restore_vf_vram_bar_size() (Michal)
>>   - Use xe->sriov.pf.device_total_vfs instead of pci_sriov_get_totalvfs(),
>>     which may be capped (Michal)
>>   - Switch logging to %pe (Michal)
>>   - Call restore unconditionally on enable-fail path (Michal)
>>     (drop vf_vram_bar_resized flag)
>> ---
>> ---
>>   drivers/gpu/drm/xe/xe_pci_sriov.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.c b/drivers/gpu/drm/xe/xe_pci_sriov.c
>> index c023a2a1fc17..31abcee55211 100644
>> --- a/drivers/gpu/drm/xe/xe_pci_sriov.c
>> +++ b/drivers/gpu/drm/xe/xe_pci_sriov.c
>> @@ -177,6 +177,7 @@ static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
>>   	return num_vfs;
>>   
>>   failed:
>> +	pf_resize_vf_vram_bar(xe, xe->sriov.pf.device_total_vfs);
> should we resize before unprovisioning?
> or it doesn't even matter at this point?!

The BAR size is independent of Xe/GuC provisioning, so resizing before 
unprovisioning is safe. It only requires SR-IOV memory decoding to be 
disabled.

>
>>   	xe_sriov_pf_unprovision_vfs(xe, num_vfs);
>>   	xe_pm_runtime_put(xe);
>>   	pf_finish_vfs_enabling(xe);
>> @@ -204,6 +205,8 @@ static int pf_disable_vfs(struct xe_device *xe)
>>   
>>   	pci_disable_sriov(pdev);
>>   
>> +	pf_resize_vf_vram_bar(xe, xe->sriov.pf.device_total_vfs);
> I just noticed that no users of this function handles the error.
> Should we convert it to void? (I see it already prints some messages,
> so not needed to duplicate anywhere)
>
> this is not a blocker and if the order above is okay:
The helper’s return type is unrelated to this fix, so I prefer to keep 
its interface unchanged here; it can be converted to void separately.
>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Thanks for the review.

marcin

>> +
>>   	xe_sriov_pf_reprovision_default(xe);
>>   
>>   	pf_reset_vfs(xe, num_vfs);
>> -- 
>> 2.43.0
>>
