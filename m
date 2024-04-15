Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA5C0C4345F
	for <intel-xe@archiver.kernel.org>; Mon, 15 Apr 2024 17:06:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F6FD11271E;
	Mon, 15 Apr 2024 17:06:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y66NCXeW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D815B11271E
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Apr 2024 17:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713200807; x=1744736807;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=+72IQvLuMN5nJ6hRxr1Wyy5JzpTjLN8x6P3aWfvreW0=;
 b=Y66NCXeWq0GqaWCP+IpTN10cjP82oax3CytA1YCXtisoooPmPL3CaqX/
 b82VRh9QGEgfuQmgq1vpQ8qsyW+7m5Sz1W0qe15avnclWrwx2/R2+TRVQ
 nMPuZs6FyjT+Df10brT3UMQPb838bqNgcdO0oE7fBQpjwMT3dPCv4esnR
 5XD4ywE+MMpi6pG9GdlUvvEyln4+xirMHme3dOA3DqnBwHTyGm45yVFiP
 LCHBLuAij9vwOyz2qJ9UWGLQkMndvQIa0bFHhF+XborJFfqdt6ZCcqAEf
 0NViAhOV/xNaQl2QLB1c+He1cHyKi9fhnIA2AymbkaeUl+KVd8WscXXMY g==;
X-CSE-ConnectionGUID: z5NTxE+vRgmDyi3M2bYwnA==
X-CSE-MsgGUID: TqpoTzx4QK6K422XCDvTDQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="12451971"
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; d="scan'208";a="12451971"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 10:06:46 -0700
X-CSE-ConnectionGUID: 6cuGecvjQTKmDql+4txfMw==
X-CSE-MsgGUID: a9pcQxo2RM6Ns7/U2rpIYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; d="scan'208";a="26627189"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa004.fm.intel.com with ESMTP; 15 Apr 2024 10:06:45 -0700
Received: from [10.252.45.29] (unknown [10.252.45.29])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 4A5EF33729;
 Mon, 15 Apr 2024 18:06:42 +0100 (IST)
Message-ID: <a46e00bc-6274-4d05-a4ea-45569b6ec821@intel.com>
Date: Mon, 15 Apr 2024 19:06:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] drm/xe/pf: Add support to configure SR-IOV VFs
Content-Language: en-US
To: =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Cc: intel-xe@lists.freedesktop.org
References: <20240414190137.1243-1-michal.wajdeczko@intel.com>
 <20240414190137.1243-7-michal.wajdeczko@intel.com>
 <20240415142957.2tmcl7n6xyovbnia@intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240415142957.2tmcl7n6xyovbnia@intel.com>
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



On 15.04.2024 16:29, Piotr Piórkowski wrote:
> Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on nie [2024-kwi-14 21:01:37 +0200]:

...

>> +static int pf_push_full_vf_config(struct xe_gt *gt, unsigned int vfid)
>> +{
>> +	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
>> +	u32 max_cfg_dwords = SZ_4K / sizeof(u32);
>> +	u32 num_dwords;
>> +	int num_klvs;
>> +	u32 *cfg;
>> +	int err;
>> +
>> +	cfg = kcalloc(max_cfg_dwords, sizeof(u32), GFP_KERNEL);
>> +	if (!cfg)
>> +		return -ENOMEM;
>> +
>> +	num_dwords = encode_config(cfg, config);
>> +	xe_gt_assert(gt, num_dwords <= max_cfg_dwords);
>> +
> 
> NIT: I would add some commentary as to why in the case of media GT we do GGTT provisioning
> with values from primary GT.
> At first glance, it looks like we are adding KLV twice for GGTT - at least I caught myself
> doing that.

sure, will add small comment there (maybe also together with an assert
to enforce that there shall be no GGTT config on the media-GT that could
have been emitted by the encode_config()

...

>> +int xe_gt_sriov_pf_config_bulk_set_ggtt(struct xe_gt *gt, unsigned int vfid,
>> +					unsigned int num_vfs, u64 size)
>> +{
>> +	unsigned int n;
>> +	int err = 0;
>> +
>> +	xe_gt_assert(gt, vfid);
>> +	xe_gt_assert(gt, !xe_gt_is_media_type(gt));
>> +
> 
> NIT: Maybe you should add an assert here to check if vfid + num_vfs <= total_vfs

no really needed as there is an existing assert in pf_pick_vf_config()
helper which is called by most of the functions including the
pf_provision_vf_ggtt() from the loop below

> 
>> +	if (!num_vfs)
>> +		return 0;
>> +
>> +	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
>> +	for (n = vfid; n < vfid + num_vfs; n++) {
>> +		err = pf_provision_vf_ggtt(gt, n, size);
>> +		if (err)
>> +			break;
>> +	}
>> +	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
>> +
>> +	return pf_config_bulk_set_u64_done(gt, vfid, num_vfs, size,
>> +					   xe_gt_sriov_pf_config_get_ggtt,
>> +					   "GGTT", n, err);
>> +}

...

>> +static u64 pf_estimate_fair_ggtt(struct xe_gt *gt, unsigned int num_vfs)
>> +{
>> +	u64 available = pf_get_max_ggtt(gt);
>> +	u64 alignment = pf_get_ggtt_alignment(gt);
>> +	u64 fair;
>> +
>> +	fair = div_u64(available, num_vfs);
>> +	fair = ALIGN_DOWN(fair, alignment);
>> +	xe_gt_sriov_dbg_verbose(gt, "GGTT available(%lluK) fair(%u x %lluK)\n",
>> +				available / SZ_1K, num_vfs, fair / SZ_1K);
>> +	return fair;
>> +}
> NIT: This is not the most optimal solution in any case.
> Perhaps it is worth noting here in the comment that it is a conscious decision

well, it's still the best solution for 1 VF

note that 'fair' allocations used by auto-provisioning are best-effort,
as we aim to expose some kind of uabi that will allow to setup specific
predefined configuration that could provide some SLA

anyway, added some comment in v2

> 
>> +
>> +/**
>> + * xe_gt_sriov_pf_config_set_fair_ggtt - Provision many VFs with fair GGTT.
>> + * @gt: the &xe_gt (can't be media)
>> + * @vfid: starting VF identifier (can't be 0)
>> + * @num_vfs: number of VFs to provision
>> + *
>> + * This function can only be called on PF.
>> + *
>> + * Return: 0 on success or a negative error code on failure.
>> + */
>> +int xe_gt_sriov_pf_config_set_fair_ggtt(struct xe_gt *gt,
>> +					unsigned int vfid, unsigned int num_vfs)
> 
> NIT: In my opinion strangely divided into a new line these parameters
> 

fixed in v2

...

>> +static const char *exec_quantum_unit(u32 exec_quantum)
>> +{
>> +	return exec_quantum ? "ms" : "(inifinity)";
> 
> typo

oops

...

> 
> Several NITs, 2 typo (in the same word).
> But the functionality seems to be ok.
> After the necessary fixes (I mean mainly typo, but also pls consider my comments):
> 
> Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

thanks!

Michal
