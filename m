Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CC1FC3ABD8
	for <intel-xe@archiver.kernel.org>; Fri, 16 May 2025 05:08:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D168B10E109;
	Fri, 16 May 2025 05:07:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Px+ke4p5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBB5310E109
 for <intel-xe@lists.freedesktop.org>; Fri, 16 May 2025 05:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747372079; x=1778908079;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=c7JWX5630Ukj08sctOmzxE+/FnYddrIPNVYfBZvDQR4=;
 b=Px+ke4p5KHTmRDozPQCywdHRVsjWar2fG7n1wGR+M+ZPOu6ceEGu6WfX
 IjDvj9/NAWdp4PJ5ZkFpgO+HjG2BPO4+Bl5IbRgp+s/olDzjL+qXNxOFS
 77xK5/qUO9lQp9/Id/ZSLP7JbtVPrzDmKO01O6Z2mG3q6I/0OPMXIig58
 xaLXdCDpEi/c8EUO98+u8jqCeatJ3iiK4Cq2x8wIpe2sCi3VvMY99QpZC
 AkGXS/2Un8AANCdywiwnTkYnAAKwpAa5TvZcPkroGMlbsXHcdeofOrkl/
 JiapapbBfFn02s2DNjKhEfRMwf0zbesxySwRvaDhFzB4I6Wa62N7RG+ns w==;
X-CSE-ConnectionGUID: zLhVbMFbT4y3WembS0+3yQ==
X-CSE-MsgGUID: Z4FK4ZRJSxGtMDlnZvEsDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="49318478"
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; d="scan'208";a="49318478"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 22:07:54 -0700
X-CSE-ConnectionGUID: RJLH9vHQTpS4mtPLrzBSPQ==
X-CSE-MsgGUID: iRikJeTKRFaXNrE3Z4iu5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; d="scan'208";a="143536644"
Received: from jpdhasha-mobl.gar.corp.intel.com (HELO [10.247.153.35])
 ([10.247.153.35])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 22:07:52 -0700
Message-ID: <23c3d2c4-de75-4f17-bc5a-f593d06a99a1@intel.com>
Date: Fri, 16 May 2025 10:37:49 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc: Make creation of SLPC debugfs files
 conditional
To: "Summers, Stuart" <stuart.summers@intel.com>,
 "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "Roper, Matthew D" <matthew.d.roper@intel.com>
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
References: <20250515094913.2437-1-aradhya.bhatia@intel.com>
 <SJ1PR11MB6204CD374CDB31981218C7308190A@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <53969660-e48b-4467-9d3c-053fa7ceca9c@intel.com>
 <e7ea4de877f65babac4b89f2206cb18eac3ec648.camel@intel.com>
Content-Language: en-US
From: Aradhya Bhatia <aradhya.bhatia@intel.com>
In-Reply-To: <e7ea4de877f65babac4b89f2206cb18eac3ec648.camel@intel.com>
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

Hi Stuart,

Thank you for reviewing the patch.

On 16-05-2025 00:07, Summers, Stuart wrote:
> On Thu, 2025-05-15 at 23:06 +0530, Aradhya Bhatia wrote:
>> Hi Tejas,
>>
>> Thank you for reviewing the patch.
>>
>> On 15-05-2025 18:46, Upadhyay, Tejas wrote:
>>>
>>>
>>>> -----Original Message-----
>>>> From: Bhatia, Aradhya <aradhya.bhatia@intel.com>
>>>> Sent: 15 May 2025 15:19
>>>> To: Roper, Matthew D <matthew.d.roper@intel.com>
>>>> Cc: Intel XE List <intel-xe@lists.freedesktop.org>; Upadhyay,
>>>> Tejas
>>>> <tejas.upadhyay@intel.com>; Ghimiray, Himal Prasad
>>>> <himal.prasad.ghimiray@intel.com>; Bhatia, Aradhya
>>>> <aradhya.bhatia@intel.com>
>>>> Subject: [PATCH] drm/xe/guc: Make creation of SLPC debugfs files
>>>> conditional
>>>>
>>>> Platforms that do not support SLPC are exempted from the GuC PC
>>>> support.
>>>> The GuC PC does not get initialized, and neither do its BOs get
>>>> created.
>>>>
>>>> This causes a problem because the GuC PC debugfs file is still
>>>> being created.
>>>> Whenever the file is attempted to read, it causes a NULL pointer
>>>> dereference
>>>> on the supposed BO of the GuC PC.
>>>>
>>>> So, make the creation of SLPC debugfs files conditional to when
>>>> SLPC features
>>>> are supported.
>>>>
>>>> Suggested-by: Matt Roper <matthew.d.roper@intel.com>
>>>> Signed-off-by: Aradhya Bhatia <aradhya.bhatia@intel.com>
>>>> ---
>>>>  drivers/gpu/drm/xe/xe_guc_debugfs.c | 17 ++++++++++++++---
>>>>  1 file changed, 14 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_debugfs.c
>>>> b/drivers/gpu/drm/xe/xe_guc_debugfs.c
>>>> index f33013f8a0f3..0b102ab46c4d 100644
>>>> --- a/drivers/gpu/drm/xe/xe_guc_debugfs.c
>>>> +++ b/drivers/gpu/drm/xe/xe_guc_debugfs.c
>>>> @@ -113,23 +113,34 @@ static const struct drm_info_list
>>>> vf_safe_debugfs_list[] = {
>>>>         { "guc_ctb", .show = guc_debugfs_show, .data = guc_ctb
>>>> },  };
>>>>
>>>> +/* For GuC debugfs files that require the SLPC support */ static
>>>> const
>>>> +struct drm_info_list slpc_debugfs_list[] = {
>>>> +       { "guc_pc", .show = guc_debugfs_show, .data = guc_pc },
>>>> };
>>>> +
>>>>  /* everything else should be added here */  static const struct
>>>> drm_info_list
>>>> pf_only_debugfs_list[] = {
>>>>         { "guc_log", .show = guc_debugfs_show, .data = guc_log },
>>>>         { "guc_log_dmesg", .show = guc_debugfs_show, .data =
>>>> guc_log_dmesg },
>>>> -       { "guc_pc", .show = guc_debugfs_show, .data = guc_pc },
>>>
>>> You need fixes tag here it seems. With that,
>>
>> About this, there is a slight complication.
>>
>> The original patch that introduced this issue is this commit,
>>
>> aaab5404b16f ("drm/xe: Introduce GuC PC debugfs") [0]
>>
>> This is the patch that introduced GuC PC debugfs file but didn't
>> account
>> for the case when "skip_guc_pc" is set.
>>
>>
>> But, the guc debugfs has had other commits _after_ the above patch,
>> which refactor in various ways how guc debugfs is being handled in Xe
>> driver.
>>
>>
>> e15826bb3c2c ("drm/xe/guc: Refactor GuC debugfs initialization") [1]
>> 387444984d7b ("drm/xe/guc: Don't expose GuC privileged debugfs files
>> if
>> VF") [2]
>>
>> Since my patch is based after patches [1], and [2] (which are not
>> "fixes", and hence were not backported to any previous kernel
>> version),
>> my patch will not be "backport-able" to the original patch that needs
>> the fix [0].
>>
>>
>> So, what should be done in this situation?
> 
> I'd just add the fixes to the original patch. The refactors will have
> to take that into consideration if these get merged down the road.

Please help me understand, what do you meany by "if these get merged
down the road".

drm-xe-next(-fixes) (the branch this patch is based on top of) has both
those refactoring patches merged.

However, the v6.15-rc6 (and drm-xe-fixes) do not.

Please correct me if I am wrong, but the only way I understand that the
fix patch can be merged _before_ the refactoring patches, is to go
through drm-xe-fixes.

Is that what you meant?

> 
> Reviewed-by: Stuart Summers <stuart.summers@intel.com>
> 
> Thanks,
> Stuart
> 
>>
>>
>> Regards
>> Aradhya
>>
>>
>> [0]:
>> https://lore.kernel.org/all/20250114232443.1135355-1-rodrigo.vivi@intel.com/
>>
>> [1]:
>> https://lore.kernel.org/all/20250403142635.1821-2-michal.wajdeczko@intel.com/
>>
>> [2]:
>> https://lore.kernel.org/all/20250403142635.1821-3-michal.wajdeczko@intel.com/
>>
>>
>>
>>> Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>>>
>>> Tejas
>>>>  };
>>>>
>>>>  void xe_guc_debugfs_register(struct xe_guc *guc, struct dentry
>>>> *parent)  {
>>>> -       struct drm_minor *minor = guc_to_xe(guc)->drm.primary;
>>>> +       struct xe_device *xe =  guc_to_xe(guc);
>>>> +       struct drm_minor *minor = xe->drm.primary;
>>>>
>>>>         drm_debugfs_create_files(vf_safe_debugfs_list,
>>>>                                 
>>>> ARRAY_SIZE(vf_safe_debugfs_list),
>>>>                                  parent, minor);
>>>>
>>>> -       if (!IS_SRIOV_VF(guc_to_xe(guc)))
>>>> +       if (!IS_SRIOV_VF(xe)) {
>>>>                 drm_debugfs_create_files(pf_only_debugfs_list,
>>>>                                         
>>>> ARRAY_SIZE(pf_only_debugfs_list),
>>>>                                          parent, minor);
>>>> +
>>>> +               if (!xe->info.skip_guc_pc)
>>>> +                       drm_debugfs_create_files(slpc_debugfs_lis
>>>> t,
>>>> +
>>>> ARRAY_SIZE(slpc_debugfs_list),
>>>> +                                                parent, minor);
>>>> +       }
>>>>  }
>>>>
>>>> base-commit: 3d6670fab64cb00b5e6ed80d2517147db533faf1
>>>> --
>>>> 2.43.0
>>>
>>
> 

