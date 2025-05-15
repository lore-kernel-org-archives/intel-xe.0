Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E24E5C3ABDD
	for <intel-xe@archiver.kernel.org>; Thu, 15 May 2025 17:36:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D12A10E92F;
	Thu, 15 May 2025 17:36:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TOg5QQXS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4175A10E92F
 for <intel-xe@lists.freedesktop.org>; Thu, 15 May 2025 17:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747330591; x=1778866591;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=TpDQ9JgQyG6jF1miP7JO/E1h+QK0Yssc6Log8eQFGTs=;
 b=TOg5QQXSVsYTcAXZ9yqir583AzE0Vo4luyj8/qHx0/EHSVYY2jANuYGj
 Z+2rKIcVeVHIeZjZhpQEtbe9w+vpQG4yqRcfYgcBsYBuZVrQIEomVVhVF
 bvctUcZY/tQcoifyX2RqAl+gwp5umt1zT5PfWhFcdlsEnVD1V9MRN5sUk
 4+kTjrsUcGWLYuRR83VS7xewFd7JIZvv28HcvzCpC5D3u0NgJQ4+7E77M
 6F7PRpLPQXfcib6Nw0LwvSKFQ2iyAu/DskIXFaB3ePmsC6rbA4gch+t49
 k02qdQ0Q3mIgCNCHFxkOYSB2MdE9C234QtUfNEg2pwyvSakIql99N3XzB w==;
X-CSE-ConnectionGUID: Za7IzPHCTgG8605dhVHnSw==
X-CSE-MsgGUID: GtxMN4LcSa+YPjMmWJ6pOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="36899866"
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; d="scan'208";a="36899866"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 10:36:30 -0700
X-CSE-ConnectionGUID: x0VK+eMYQLK0f3/aLDp2CA==
X-CSE-MsgGUID: mLvNSYD0Rpuy/N4oydddHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; d="scan'208";a="143560121"
Received: from sswami-mobl.amr.corp.intel.com (HELO [10.247.245.19])
 ([10.247.245.19])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 10:36:30 -0700
Message-ID: <53969660-e48b-4467-9d3c-053fa7ceca9c@intel.com>
Date: Thu, 15 May 2025 23:06:26 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc: Make creation of SLPC debugfs files
 conditional
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "Roper, Matthew D" <matthew.d.roper@intel.com>
Cc: Intel XE List <intel-xe@lists.freedesktop.org>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
References: <20250515094913.2437-1-aradhya.bhatia@intel.com>
 <SJ1PR11MB6204CD374CDB31981218C7308190A@SJ1PR11MB6204.namprd11.prod.outlook.com>
Content-Language: en-US
From: Aradhya Bhatia <aradhya.bhatia@intel.com>
In-Reply-To: <SJ1PR11MB6204CD374CDB31981218C7308190A@SJ1PR11MB6204.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Hi Tejas,

Thank you for reviewing the patch.

On 15-05-2025 18:46, Upadhyay, Tejas wrote:
> 
> 
>> -----Original Message-----
>> From: Bhatia, Aradhya <aradhya.bhatia@intel.com>
>> Sent: 15 May 2025 15:19
>> To: Roper, Matthew D <matthew.d.roper@intel.com>
>> Cc: Intel XE List <intel-xe@lists.freedesktop.org>; Upadhyay, Tejas
>> <tejas.upadhyay@intel.com>; Ghimiray, Himal Prasad
>> <himal.prasad.ghimiray@intel.com>; Bhatia, Aradhya
>> <aradhya.bhatia@intel.com>
>> Subject: [PATCH] drm/xe/guc: Make creation of SLPC debugfs files conditional
>>
>> Platforms that do not support SLPC are exempted from the GuC PC support.
>> The GuC PC does not get initialized, and neither do its BOs get created.
>>
>> This causes a problem because the GuC PC debugfs file is still being created.
>> Whenever the file is attempted to read, it causes a NULL pointer dereference
>> on the supposed BO of the GuC PC.
>>
>> So, make the creation of SLPC debugfs files conditional to when SLPC features
>> are supported.
>>
>> Suggested-by: Matt Roper <matthew.d.roper@intel.com>
>> Signed-off-by: Aradhya Bhatia <aradhya.bhatia@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_guc_debugfs.c | 17 ++++++++++++++---
>>  1 file changed, 14 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_debugfs.c
>> b/drivers/gpu/drm/xe/xe_guc_debugfs.c
>> index f33013f8a0f3..0b102ab46c4d 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_debugfs.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_debugfs.c
>> @@ -113,23 +113,34 @@ static const struct drm_info_list
>> vf_safe_debugfs_list[] = {
>>  	{ "guc_ctb", .show = guc_debugfs_show, .data = guc_ctb },  };
>>
>> +/* For GuC debugfs files that require the SLPC support */ static const
>> +struct drm_info_list slpc_debugfs_list[] = {
>> +	{ "guc_pc", .show = guc_debugfs_show, .data = guc_pc }, };
>> +
>>  /* everything else should be added here */  static const struct drm_info_list
>> pf_only_debugfs_list[] = {
>>  	{ "guc_log", .show = guc_debugfs_show, .data = guc_log },
>>  	{ "guc_log_dmesg", .show = guc_debugfs_show, .data =
>> guc_log_dmesg },
>> -	{ "guc_pc", .show = guc_debugfs_show, .data = guc_pc },
> 
> You need fixes tag here it seems. With that,

About this, there is a slight complication.

The original patch that introduced this issue is this commit,

aaab5404b16f ("drm/xe: Introduce GuC PC debugfs") [0]

This is the patch that introduced GuC PC debugfs file but didn't account
for the case when "skip_guc_pc" is set.


But, the guc debugfs has had other commits _after_ the above patch,
which refactor in various ways how guc debugfs is being handled in Xe
driver.


e15826bb3c2c ("drm/xe/guc: Refactor GuC debugfs initialization") [1]
387444984d7b ("drm/xe/guc: Don't expose GuC privileged debugfs files if
VF") [2]

Since my patch is based after patches [1], and [2] (which are not
"fixes", and hence were not backported to any previous kernel version),
my patch will not be "backport-able" to the original patch that needs
the fix [0].


So, what should be done in this situation?


Regards
Aradhya


[0]:
https://lore.kernel.org/all/20250114232443.1135355-1-rodrigo.vivi@intel.com/

[1]:
https://lore.kernel.org/all/20250403142635.1821-2-michal.wajdeczko@intel.com/

[2]:
https://lore.kernel.org/all/20250403142635.1821-3-michal.wajdeczko@intel.com/



> Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> 
> Tejas
>>  };
>>
>>  void xe_guc_debugfs_register(struct xe_guc *guc, struct dentry *parent)  {
>> -	struct drm_minor *minor = guc_to_xe(guc)->drm.primary;
>> +	struct xe_device *xe =  guc_to_xe(guc);
>> +	struct drm_minor *minor = xe->drm.primary;
>>
>>  	drm_debugfs_create_files(vf_safe_debugfs_list,
>>  				 ARRAY_SIZE(vf_safe_debugfs_list),
>>  				 parent, minor);
>>
>> -	if (!IS_SRIOV_VF(guc_to_xe(guc)))
>> +	if (!IS_SRIOV_VF(xe)) {
>>  		drm_debugfs_create_files(pf_only_debugfs_list,
>>  					 ARRAY_SIZE(pf_only_debugfs_list),
>>  					 parent, minor);
>> +
>> +		if (!xe->info.skip_guc_pc)
>> +			drm_debugfs_create_files(slpc_debugfs_list,
>> +
>> ARRAY_SIZE(slpc_debugfs_list),
>> +						 parent, minor);
>> +	}
>>  }
>>
>> base-commit: 3d6670fab64cb00b5e6ed80d2517147db533faf1
>> --
>> 2.43.0
> 

