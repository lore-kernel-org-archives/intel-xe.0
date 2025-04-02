Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD736C28B20
	for <intel-xe@archiver.kernel.org>; Wed,  2 Apr 2025 16:29:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72860891C0;
	Wed,  2 Apr 2025 16:29:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nX9GK9cA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01ED0891C0
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Apr 2025 16:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743611352; x=1775147352;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=sOmZF+eaad7GYXr1MIgxsb6F3qb+Liq2eH8YIpYaWFw=;
 b=nX9GK9cARDcSF/Whmi8MCwLJ6dktbKRlWOGk7xmHI4xG+Xwc9hjNu1tY
 4G8pv0PHtq/l2LuP6/+xF10nM5hCVZ/43+RBD7L60RtmvI0XJoqHRqgss
 UB/YpFWcXct7JyCBLf4ahIjG/E1c4UFA8vcLN+unbyTYT4uDy8ymFhY9F
 ksycZsRs5wQfccktQP0zHBi1Zw7r6J2MYQcyzDOsAdIs4FygC0DOEhYeR
 ww84hZXxjHH0w3WNBP70ELyFR5IjRZnHnHbBVZLoCGlJy74pDqa7HNBct
 Nu6q5Yz54PhfNO1PTmg4pRYkJV2Aoa74cI5SJvYBNtB1mwqTuJR0VOJsK A==;
X-CSE-ConnectionGUID: UDUQO2aJTT+sHY+NqRJhMg==
X-CSE-MsgGUID: mF1WTTMNRwqilf9z4Lrvwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="55618837"
X-IronPort-AV: E=Sophos;i="6.15,182,1739865600"; d="scan'208";a="55618837"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 09:29:11 -0700
X-CSE-ConnectionGUID: ucHuDyjJQdGdJlHMBkU5gA==
X-CSE-MsgGUID: he4gXgaxSUa+orinDMjILQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,182,1739865600"; d="scan'208";a="127258982"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa007.jf.intel.com with ESMTP; 02 Apr 2025 09:29:09 -0700
Received: from [10.245.83.29] (unknown [10.245.83.29])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 0421133BDA;
 Wed,  2 Apr 2025 17:29:07 +0100 (IST)
Message-ID: <c6b91e82-2c13-4846-811c-baa94fb80df1@intel.com>
Date: Wed, 2 Apr 2025 18:29:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe/vf: Store the VF GuC version in the
 compatibility struct
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
References: <20250228200246.3117410-1-daniele.ceraolospurio@intel.com>
 <d5ca7fe9-aa20-402b-85b5-4f4832c0a0af@intel.com>
 <3191c065-1977-4a03-9693-d7622cea81f9@intel.com>
 <3908de67-0a91-4e94-a98a-e94879c0d53d@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <3908de67-0a91-4e94-a98a-e94879c0d53d@intel.com>
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



On 31.03.2025 18:34, Daniele Ceraolo Spurio wrote:
> 
> 
> On 2/28/2025 2:28 PM, Daniele Ceraolo Spurio wrote:
>>
>>
>> On 2/28/2025 1:26 PM, Michal Wajdeczko wrote:
>>>
>>> On 28.02.2025 21:02, Daniele Ceraolo Spurio wrote:
>>>> The GuC compatibility version that we read from the CSS header in
>>>> native/PF and the GuC VF version that we get when a VF handshakes with
>>>> the GuC are the same version number, so we should store it into the
>>>> same
>>>> structure. This makes all the checks based on the compatibility version
>>>> automatically work for VFs without having to copy the value over.
>>>>
>>>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>>> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
>>>> ---
>>>>   drivers/gpu/drm/xe/xe_gt_sriov_vf.c         | 121 ++++++++++
>>>> +---------
>>>>   drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h   |  16 ---
>>>>   drivers/gpu/drm/xe/xe_guc.h                 |   2 +-
>>>>   drivers/gpu/drm/xe/xe_guc_engine_activity.c |   8 +-
>>>>   drivers/gpu/drm/xe/xe_uc_fw_types.h         |   2 +
>>>>   5 files changed, 71 insertions(+), 78 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/
>>>> xe/xe_gt_sriov_vf.c
>>>> index a439261bf4d7..eeccbf4cb4b4 100644
>>>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>>>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>>>> @@ -82,17 +82,17 @@ int xe_gt_sriov_vf_reset(struct xe_gt *gt)
>>>>   }
>>>>     static int guc_action_match_version(struct xe_guc *guc,
>>>> -                    u32 wanted_branch, u32 wanted_major, u32
>>>> wanted_minor,
>>>> -                    u32 *branch, u32 *major, u32 *minor, u32 *patch)
>>>> +                    struct xe_uc_fw_version *wanted,
>>>> +                    struct xe_uc_fw_version *found)
>>>>   {
>>>>       u32 request[VF2GUC_MATCH_VERSION_REQUEST_MSG_LEN] = {
>>>>           FIELD_PREP(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_HOST) |
>>>>           FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_REQUEST) |
>>>>           FIELD_PREP(GUC_HXG_REQUEST_MSG_0_ACTION,
>>>>                  GUC_ACTION_VF2GUC_MATCH_VERSION),
>>>> -        FIELD_PREP(VF2GUC_MATCH_VERSION_REQUEST_MSG_1_BRANCH,
>>>> wanted_branch) |
>>>> -        FIELD_PREP(VF2GUC_MATCH_VERSION_REQUEST_MSG_1_MAJOR,
>>>> wanted_major) |
>>>> -        FIELD_PREP(VF2GUC_MATCH_VERSION_REQUEST_MSG_1_MINOR,
>>>> wanted_minor),
>>>> +        FIELD_PREP(VF2GUC_MATCH_VERSION_REQUEST_MSG_1_BRANCH,
>>>> wanted->branch) |
>>>> +        FIELD_PREP(VF2GUC_MATCH_VERSION_REQUEST_MSG_1_MAJOR,
>>>> wanted->major) |
>>>> +        FIELD_PREP(VF2GUC_MATCH_VERSION_REQUEST_MSG_1_MINOR,
>>>> wanted->minor),
>>>>       };
>>>>       u32 response[GUC_MAX_MMIO_MSG_LEN];
>>>>       int ret;
>>>> @@ -106,71 +106,84 @@ static int guc_action_match_version(struct
>>>> xe_guc *guc,
>>>>       if
>>>> (unlikely(FIELD_GET(VF2GUC_MATCH_VERSION_RESPONSE_MSG_0_MBZ,
>>>> response[0])))
>>>>           return -EPROTO;
>>>>   -    *branch =
>>>> FIELD_GET(VF2GUC_MATCH_VERSION_RESPONSE_MSG_1_BRANCH, response[1]);
>>>> -    *major = FIELD_GET(VF2GUC_MATCH_VERSION_RESPONSE_MSG_1_MAJOR,
>>>> response[1]);
>>>> -    *minor = FIELD_GET(VF2GUC_MATCH_VERSION_RESPONSE_MSG_1_MINOR,
>>>> response[1]);
>>>> -    *patch = FIELD_GET(VF2GUC_MATCH_VERSION_RESPONSE_MSG_1_PATCH,
>>>> response[1]);
>>>> +    memset(found, 0, sizeof(struct xe_uc_fw_version));
>>>> +    found->branch =
>>>> FIELD_GET(VF2GUC_MATCH_VERSION_RESPONSE_MSG_1_BRANCH, response[1]);
>>>> +    found->major =
>>>> FIELD_GET(VF2GUC_MATCH_VERSION_RESPONSE_MSG_1_MAJOR, response[1]);
>>>> +    found->minor =
>>>> FIELD_GET(VF2GUC_MATCH_VERSION_RESPONSE_MSG_1_MINOR, response[1]);
>>>> +    found->patch =
>>>> FIELD_GET(VF2GUC_MATCH_VERSION_RESPONSE_MSG_1_PATCH, response[1]);
>>>>         return 0;
>>>>   }
>>>>   -static void vf_minimum_guc_version(struct xe_gt *gt, u32 *branch,
>>>> u32 *major, u32 *minor)
>>>> +static int guc_action_match_version_any(struct xe_guc *guc,
>>>> +                    struct xe_uc_fw_version *found)
>>>> +{
>>>> +    struct xe_uc_fw_version wanted = { GUC_VERSION_BRANCH_ANY,
>>>> +                       GUC_VERSION_MAJOR_ANY,
>>>> +                       GUC_VERSION_MINOR_ANY,
>>>> +                       0 };
>>> better to use designated initializers (as we don't know when someone
>>> will make yet another changes to the struct xe_uc_fw_version layout):
>>>
>>> struct xe_uc_fw_version wanted = {
>>>     .branch = GUC_VERSION_BRANCH_ANY,
>>>     .major = GUC_VERSION_MAJOR_ANY,
>>>         .minor = GUC_VERSION_MINOR_ANY,
>>> };
>>
>> Good point.
>>
>>>> +
>>>> +    return guc_action_match_version(guc, &wanted, found);
>>>> +}
>>>> +
>>>> +static void vf_minimum_guc_version(struct xe_gt *gt, struct
>>>> xe_uc_fw_version *ver)
>>>>   {
>>>>       struct xe_device *xe = gt_to_xe(gt);
>>>>   +    memset(ver, 0, sizeof(struct xe_uc_fw_version));
>>>> +
>>>>       switch (xe->info.platform) {
>>>>       case XE_TIGERLAKE ... XE_PVC:
>>>>           /* 1.1 this is current baseline for Xe driver */
>>>> -        *branch = 0;
>>>> -        *major = 1;
>>>> -        *minor = 1;
>>>> +        ver->branch = 0;
>>>> +        ver->major = 1;
>>>> +        ver->minor = 1;
>>>>           break;
>>>>       default:
>>>>           /* 1.2 has support for the GMD_ID KLV */
>>>> -        *branch = 0;
>>>> -        *major = 1;
>>>> -        *minor = 2;
>>>> +        ver->branch = 0;
>>>> +        ver->major = 1;
>>>> +        ver->minor = 2;
>>>>           break;
>>>>       }
>>>>   }
>>>>   -static void vf_wanted_guc_version(struct xe_gt *gt, u32 *branch,
>>>> u32 *major, u32 *minor)
>>>> +static void vf_wanted_guc_version(struct xe_gt *gt, struct
>>>> xe_uc_fw_version *ver)
>>>>   {
>>>>       /* for now it's the same as minimum */
>>>> -    return vf_minimum_guc_version(gt, branch, major, minor);
>>>> +    return vf_minimum_guc_version(gt, ver);
>>>>   }
>>>>     static int vf_handshake_with_guc(struct xe_gt *gt)
>>>>   {
>>>> -    struct xe_gt_sriov_vf_guc_version *guc_version = &gt-
>>>> >sriov.vf.guc_version;
>>>>       struct xe_guc *guc = &gt->uc.guc;
>>>> -    u32 wanted_branch, wanted_major, wanted_minor;
>>>> -    u32 branch, major, minor, patch;
>>>> +    struct xe_uc_fw_version *guc_version = &guc-
>>>> >fw.versions.found[XE_UC_FW_VER_COMPATIBILITY];
>>> I'm not sure that we should go so deep into guc internal structures ...
>>>
>>> maybe we could add some small helper to hide where this GuC ABI version
>>> is maintained within xe_guc
>>>
>>>     xe_guc_get_compatibility_ver(guc, *ver)
>>>     xe_guc_set_compatibility_ver(guc, const *ver)
>>
>> ok
> 
> Looking at implementing this, I think it is easier to have just the
> getter function return the actual live version of the structure and fill
> it in, instead of getting a copy and having a setter. i.e.:
> 
> xe_uc_fw_get_compatibility_ver(struct xe_uc_fw *uc_fw)
> {
>     return &uc_fw->versions.found[XE_UC_FW_VER_COMPATIBILITY];
> }
> 
> It makes the code simpler and cleaner IMO, because it can also be used
> by all the low-level functions where we want to do the filling of the
> structure and where having a copy would be overkill.
> Any objection to going this way?

ok, lets try this way

but maybe we can still have GuC specialized variant?

struct xe_uc_fw_version*
xe_guc_get_compatibility_ver(struct xe_guc *guc)
{
    return xe_uc_fw_get_compatibility_ver(&guc->fw);
}

> 
>>
>>>
>>> btw, maybe it's time to s/guc_version/actual
>>>
>>>> +    struct xe_uc_fw_version wanted = {0};
>>>> +    struct xe_uc_fw_version found;
>>>>       int err;
>>>>         xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>>>>         /* select wanted version - prefer previous (if any) */
>>>>       if (guc_version->major || guc_version->minor) {
>>>> -        wanted_branch = guc_version->branch;
>>>> -        wanted_major = guc_version->major;
>>>> -        wanted_minor = guc_version->minor;
>>>> +        wanted.branch = guc_version->branch;
>>>> +        wanted.major = guc_version->major;
>>>> +        wanted.minor = guc_version->minor;
>>> then:
>>>         wanted = actual;
>>
>> I purposely avoided a direct assignment here because the patch value
>> wasn't being copied over in the original code. If it's ok to copy that
>> as well I'll switch.
>>
>>>
>>>>       } else {
>>>> -        vf_wanted_guc_version(gt, &wanted_branch, &wanted_major,
>>>> &wanted_minor);
>>>> -        xe_gt_assert(gt, wanted_major != GUC_VERSION_MAJOR_ANY);
>>>> +        vf_wanted_guc_version(gt, &wanted);
>>>> +        xe_gt_assert(gt, wanted.major != GUC_VERSION_MAJOR_ANY);
>>>>       }
>>>>   -    err = guc_action_match_version(guc, wanted_branch,
>>>> wanted_major, wanted_minor,
>>>> -                       &branch, &major, &minor, &patch);
>>>> +    err = guc_action_match_version(guc, &wanted, &found);
>>>>       if (unlikely(err))
>>>>           goto fail;
>>>>         /* we don't support interface version change */
>>>>       if ((guc_version->major || guc_version->minor) &&
>>>> -        (guc_version->branch != branch || guc_version->major !=
>>>> major ||
>>>> -         guc_version->minor != minor)) {
>>>> +        (guc_version->branch != found.branch || guc_version-
>>>> >major != found.major ||
>>>> +         guc_version->minor != found.minor)) {
>>>>           xe_gt_sriov_err(gt, "New GuC interface version detected:
>>>> %u.%u.%u.%u\n",
>>>> -                branch, major, minor, patch);
>>>> +                found.branch, found.major, found.minor, found.patch);
>>>>           xe_gt_sriov_info(gt, "Previously used version was: %u.%u.
>>>> %u.%u\n",
>>>>                    guc_version->branch, guc_version->major,
>>>>                    guc_version->minor, guc_version->patch);
>>>> @@ -179,47 +192,43 @@ static int vf_handshake_with_guc(struct xe_gt
>>>> *gt)
>>>>       }
>>>>         /* illegal */
>>>> -    if (major > wanted_major) {
>>>> +    if (found.major > wanted.major) {
>>>>           err = -EPROTO;
>>>>           goto unsupported;
>>>>       }
>>>>         /* there's no fallback on major version. */
>>>> -    if (major != wanted_major) {
>>>> +    if (found.major != wanted.major) {
>>>>           err = -ENOPKG;
>>>>           goto unsupported;
>>>>       }
>>>>         /* check against minimum version supported by us */
>>>> -    vf_minimum_guc_version(gt, &wanted_branch, &wanted_major,
>>>> &wanted_minor);
>>>> -    xe_gt_assert(gt, major != GUC_VERSION_MAJOR_ANY);
>>>> -    if (major < wanted_major || (major == wanted_major && minor <
>>>> wanted_minor)) {
>>>> +    vf_minimum_guc_version(gt, &wanted);
>>>> +    xe_gt_assert(gt, found.major != GUC_VERSION_MAJOR_ANY);
>>>> +    if (MAKE_GUC_VER_STRUCT(found) < MAKE_GUC_VER_STRUCT(wanted)) {
>>>>           err = -ENOKEY;
>>>>           goto unsupported;
>>>>       }
>>>>         xe_gt_sriov_dbg(gt, "using GuC interface version %u.%u.%u.
>>>> %u\n",
>>>> -            branch, major, minor, patch);
>>>> +            found.branch, found.major, found.minor, found.patch);
>>>>   -    guc_version->branch = branch;
>>>> -    guc_version->major = major;
>>>> -    guc_version->minor = minor;
>>>> -    guc_version->patch = patch;
>>>> +    memcpy(guc_version, &found, sizeof(struct xe_uc_fw_version));
>>> better:
>>>     xe_guc_set_compatibility_ver(guc, found);
>>
>> ok.
>>
>>>
>>>>       return 0;
>>>>     unsupported:
>>>>       xe_gt_sriov_err(gt, "Unsupported GuC version %u.%u.%u.%u
>>>> (%pe)\n",
>>>> -            branch, major, minor, patch, ERR_PTR(err));
>>>> +            found.branch, found.major, found.minor, found.patch,
>>>> +            ERR_PTR(err));
>>>>   fail:
>>>>       xe_gt_sriov_err(gt, "Unable to confirm GuC version %u.%u
>>>> (%pe)\n",
>>>> -            wanted_major, wanted_minor, ERR_PTR(err));
>>>> +            wanted.major, wanted.minor, ERR_PTR(err));
>>>>         /* try again with *any* just to query which version is
>>>> supported */
>>>> -    if (!guc_action_match_version(guc, GUC_VERSION_BRANCH_ANY,
>>>> -                      GUC_VERSION_MAJOR_ANY, GUC_VERSION_MINOR_ANY,
>>>> -                      &branch, &major, &minor, &patch))
>>>> +    if (!guc_action_match_version_any(guc, &found))
>>>>           xe_gt_sriov_notice(gt, "GuC reports interface version %u.
>>>> %u.%u.%u\n",
>>>> -                   branch, major, minor, patch);
>>>> +                   found.branch, found.major, found.minor,
>>>> found.patch);
>>>>       return err;
>>>>   }
>>>>   @@ -376,7 +385,7 @@ u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt)
>>>>         xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>>>>       xe_gt_assert(gt, !GRAPHICS_VERx100(gt_to_xe(gt)) ||
>>>> has_gmdid(gt_to_xe(gt)));
>>>> -    xe_gt_assert(gt, gt->sriov.vf.guc_version.major > 1 || gt-
>>>> >sriov.vf.guc_version.minor >= 2);
>>>> +    xe_gt_assert(gt, GUC_COMPATIBILITY_VER(guc) >= MAKE_GUC_VER(1,
>>>> 2, 0));
>>>>         err = guc_action_query_single_klv32(guc,
>>>> GUC_KLV_GLOBAL_CFG_GMD_ID_KEY, &value);
>>>>       if (unlikely(err)) {
>>>> @@ -537,7 +546,7 @@ int xe_gt_sriov_vf_query_config(struct xe_gt *gt)
>>>>   u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt)
>>>>   {
>>>>       xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>>>> -    xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
>>>> +    xe_gt_assert(gt, GUC_COMPATIBILITY_VER(&gt->uc.guc));
>>>>       xe_gt_assert(gt, gt->sriov.vf.self_config.num_ctxs);
>>>>         return gt->sriov.vf.self_config.num_ctxs;
>>>> @@ -554,7 +563,7 @@ u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt)
>>>>   u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt)
>>>>   {
>>>>       xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>>>> -    xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
>>>> +    xe_gt_assert(gt, GUC_COMPATIBILITY_VER(&gt->uc.guc));
>>>>       xe_gt_assert(gt, gt->sriov.vf.self_config.lmem_size);
>>>>         return gt->sriov.vf.self_config.lmem_size;
>>>> @@ -1079,19 +1088,19 @@ void xe_gt_sriov_vf_print_runtime(struct
>>>> xe_gt *gt, struct drm_printer *p)
>>>>    */
>>>>   void xe_gt_sriov_vf_print_version(struct xe_gt *gt, struct
>>>> drm_printer *p)
>>>>   {
>>>> -    struct xe_gt_sriov_vf_guc_version *guc_version = &gt-
>>>> >sriov.vf.guc_version;
>>>> +    struct xe_uc_fw_version *guc_version = &gt-
>>>> >uc.guc.fw.versions.found[XE_UC_FW_VER_COMPATIBILITY];
>>>> +    struct xe_uc_fw_version ver;
>>>>       struct xe_gt_sriov_vf_relay_version *pf_version = &gt-
>>>> >sriov.vf.pf_version;
>>>> -    u32 branch, major, minor;
>>>>         xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>>>>         drm_printf(p, "GuC ABI:\n");
>>>>   -    vf_minimum_guc_version(gt, &branch, &major, &minor);
>>>> -    drm_printf(p, "\tbase:\t%u.%u.%u.*\n", branch, major, minor);
>>>> +    vf_minimum_guc_version(gt, &ver);
>>>> +    drm_printf(p, "\tbase:\t%u.%u.%u.*\n", ver.branch, ver.major,
>>>> ver.minor);
>>>>   -    vf_wanted_guc_version(gt, &branch, &major, &minor);
>>>> -    drm_printf(p, "\twanted:\t%u.%u.%u.*\n", branch, major, minor);
>>>> +    vf_wanted_guc_version(gt, &ver);
>>>> +    drm_printf(p, "\twanted:\t%u.%u.%u.*\n", ver.branch, ver.major,
>>>> ver.minor);
>>>>         drm_printf(p, "\thandshake:\t%u.%u.%u.%u\n",
>>>>              guc_version->branch, guc_version->major,
>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/
>>>> gpu/drm/xe/xe_gt_sriov_vf_types.h
>>>> index a57f13b5afcd..e3d3eadbba8c 100644
>>>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>>>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>>>> @@ -8,20 +8,6 @@
>>>>     #include <linux/types.h>
>>>>   -/**
>>>> - * struct xe_gt_sriov_vf_guc_version - GuC ABI version details.
>>>> - */
>>>> -struct xe_gt_sriov_vf_guc_version {
>>>> -    /** @branch: branch version. */
>>>> -    u8 branch;
>>>> -    /** @major: major version. */
>>>> -    u8 major;
>>>> -    /** @minor: minor version. */
>>>> -    u8 minor;
>>>> -    /** @patch: patch version. */
>>>> -    u8 patch;
>>>> -};
>>>> -
>>>>   /**
>>>>    * struct xe_gt_sriov_vf_relay_version - PF ABI version details.
>>>>    */
>>>> @@ -71,8 +57,6 @@ struct xe_gt_sriov_vf_runtime {
>>>>    * struct xe_gt_sriov_vf - GT level VF virtualization data.
>>>>    */
>>>>   struct xe_gt_sriov_vf {
>>>> -    /** @guc_version: negotiated GuC ABI version. */
>>>> -    struct xe_gt_sriov_vf_guc_version guc_version;
>>> we may still want to keep local copy of xe_uc_fw_version to hold what we
>>> actually negotiated with guc, even if we had to reject that (and thus
>>> not set up in the guc submit code as found compatibility version)
>>
>> ok
> 
> Thinking about this again, should I just set the compatibility version
> anyway, even if we fail the negotiation? that way the info is always in
> the same place.

to possible extend I would like to keep what VF has obtained or
negotiated in the VF's structures, see xe_gt_sriov_vf_selfconfig, and
then use data from there to setup other components (GGTT, DBM, IDM)

regarding negotiated GuC version, maybe it's ok to reuse
	guc->fw.version
and always set what we get, but I'm not sure if submit code is prepared
to deal with such random different versions that we can "negotiate"

btw, wouldn't be confusing if we will print in debugfs such possible
strange version under GuC submit version?

by keeping two entries, VF specific debugfs will print whatever was
negotiated, and submit code, what is actually in use (could be 0.0 if no
agreement)

> 
> Daniele
> 
>>
>>>
>>>>       /** @self_config: resource configurations. */
>>>>       struct xe_gt_sriov_vf_selfconfig self_config;
>>>>       /** @pf_version: negotiated VF/PF ABI version. */
>>>> diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
>>>> index 58338be44558..c81544ff1cb4 100644
>>>> --- a/drivers/gpu/drm/xe/xe_guc.h
>>>> +++ b/drivers/gpu/drm/xe/xe_guc.h
>>>> @@ -18,7 +18,7 @@
>>>>    */
>>>>   #define MAKE_GUC_VER(maj, min, pat)    (((maj) << 16) | ((min) <<
>>>> 8) | (pat))
>>>>   #define MAKE_GUC_VER_STRUCT(ver) MAKE_GUC_VER((ver).major,
>>>> (ver).minor, (ver).patch)
>>>> -#define GUC_SUBMIT_VER(guc) \
>>>> +#define GUC_COMPATIBILITY_VER(guc) \
>>>> MAKE_GUC_VER_STRUCT((guc)-
>>>> >fw.versions.found[XE_UC_FW_VER_COMPATIBILITY])
>>>>   #define GUC_FIRMWARE_VER(guc) \
>>>> MAKE_GUC_VER_STRUCT((guc)->fw.versions.found[XE_UC_FW_VER_RELEASE])
>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity.c b/drivers/
>>>> gpu/drm/xe/xe_guc_engine_activity.c
>>>> index 2a457dcf31d5..e7aeb530715b 100644
>>>> --- a/drivers/gpu/drm/xe/xe_guc_engine_activity.c
>>>> +++ b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
>>>> @@ -98,7 +98,6 @@ static void free_engine_activity_buffers(struct
>>>> engine_activity_buffer *buffer)
>>>>   static bool is_engine_activity_supported(struct xe_guc *guc)
>>>>   {
>>>>       struct xe_uc_fw_version *version = &guc-
>>>> >fw.versions.found[XE_UC_FW_VER_COMPATIBILITY];
>>>> -    struct xe_uc_fw_version required = { 1, 14, 1 };
>>>>       struct xe_gt *gt = guc_to_gt(guc);
>>>>         if (IS_SRIOV_VF(gt_to_xe(gt))) {
>>>> @@ -107,11 +106,10 @@ static bool
>>>> is_engine_activity_supported(struct xe_guc *guc)
>>>>       }
>>>>         /* engine activity stats is supported from GuC interface
>>>> version (1.14.1) */
>>>> -    if (GUC_SUBMIT_VER(guc) < MAKE_GUC_VER_STRUCT(required)) {
>>>> +    if (GUC_COMPATIBILITY_VER(guc) < MAKE_GUC_VER(1, 14, 1)) {
>>>>           xe_gt_info(gt,
>>>> -               "engine activity stats unsupported in GuC interface
>>>> v%u.%u.%u, need v%u.%u.%u or higher\n",
>>>> -               version->major, version->minor, version->patch,
>>>> required.major,
>>>> -               required.minor, required.patch);
>>>> +               "engine activity stats unsupported in GuC interface
>>>> v%u.%u.%u, need v1.14.1 or higher\n",
>>>> +               version->major, version->minor, version->patch);
>>> little unrelated
>>
>> This is because of adding the branch variable to xe_uc_fw_version,
>> which breaks the way the "required" variable is defined, so I had to
>> do something here.
>> If you want to make it minimal I can instead do:
>>
>> struct xe_uc_fw_version required = { .major = 1, .minor = 14, .patch =
>> 1 };
>>
>> But the change is small enough that IMO is worth keeping as it cleans
>> the code a bit.
>>
>> Daniele
>>
>>>
>>>>           return false;
>>>>       }
>>>>   diff --git a/drivers/gpu/drm/xe/xe_uc_fw_types.h b/drivers/gpu/
>>>> drm/xe/xe_uc_fw_types.h
>>>> index ad3b35a0e6eb..914026015019 100644
>>>> --- a/drivers/gpu/drm/xe/xe_uc_fw_types.h
>>>> +++ b/drivers/gpu/drm/xe/xe_uc_fw_types.h
>>>> @@ -65,6 +65,8 @@ enum xe_uc_fw_type {
>>>>    * struct xe_uc_fw_version - Version for XE micro controller firmware
>>>>    */
>>>>   struct xe_uc_fw_version {
>>>> +    /** @branch: branch version of the FW (not always available) */
>>>> +    u16 branch;
>>> yeah, lack of this field was one of the main blocker to use uc/guc
>>> version structures, that's why I bed on local definition that was
>>> aligned with VF GuC ABI, but I didn't imagine that it's so simple (and
>>> let's hope harmless) to just add it here as yet another extra field and
>>> it will not break any existing macros!
>>>
>>>>       /** @major: major version of the FW */
>>>>       u16 major;
>>>>       /** @minor: minor version of the FW */
>>
> 

