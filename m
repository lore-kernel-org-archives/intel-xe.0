Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 609BCC369C9
	for <intel-xe@archiver.kernel.org>; Thu, 17 Apr 2025 19:32:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24CA510E3AF;
	Thu, 17 Apr 2025 19:32:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ni0aFuCv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0423810E3AF
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Apr 2025 19:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744918364; x=1776454364;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=2ib/+dpxR3kHMKsYbjSYIn5rWG7nJm6X8bTrkmmZXDg=;
 b=Ni0aFuCv5H8ih2Q47i94v0wh7c5uUYtDwDE2aW3o01OP4UjpUJA0scdw
 Yh5mWiwOmmN2LRmpp21T861RRQ/G19YhtikD0Jjdx975qhLsUmPQzZmrZ
 tF4Kek+J35YpJjjAX4xuP653r8astkB2XNw0iR5w2Kghd3CgCTEOzHIpV
 SrphH9NIuG8gx37AJ89hossaL9DG+nX+6WnsPIH6lQJpOOENNW5GJikV2
 DlRh/JqQrbSjtt+jLzSPAYKjT+gkTPQ0B2pIfpdoydlXRuQXMBXK8ezVd
 1eBiZYHFzgxyomFwNCUujXbig/8gQJqOtCIUw6tMQvD3EdMHKWwTnT9+g w==;
X-CSE-ConnectionGUID: Vsu7fVi6TWq4kSb+QVnJWg==
X-CSE-MsgGUID: 4IZCi1UeT+ieUKbENDoCvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="64071465"
X-IronPort-AV: E=Sophos;i="6.15,220,1739865600"; d="scan'208";a="64071465"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 12:32:43 -0700
X-CSE-ConnectionGUID: psdom6MwSf+baIuMjizOww==
X-CSE-MsgGUID: oRXFzCZYS9KS0lH5r9fm3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,220,1739865600"; d="scan'208";a="131215872"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa008.fm.intel.com with ESMTP; 17 Apr 2025 12:32:42 -0700
Received: from [10.245.81.148] (nowickik-mobl5.ger.corp.intel.com
 [10.245.81.148])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 2EEF43497C;
 Thu, 17 Apr 2025 20:32:41 +0100 (IST)
Message-ID: <87056576-65f5-4106-878e-7d1701e554ab@intel.com>
Date: Thu, 17 Apr 2025 21:32:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/xe/pf: Don't allow LMEM provisioning if LMTT isn't
 available on the device
To: "Summers, Stuart" <stuart.summers@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Piorkowski, Piotr" <piotr.piorkowski@intel.com>
References: <20250417142147.278727-1-piotr.piorkowski@intel.com>
 <0b9ac8787dc00ed191b8cea981a56c6b29dc9e85.camel@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <0b9ac8787dc00ed191b8cea981a56c6b29dc9e85.camel@intel.com>
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



On 17.04.2025 20:18, Summers, Stuart wrote:
> On Thu, 2025-04-17 at 16:21 +0200, Piórkowski, Piotr wrote:
>> From: Piotr Piórkowski <piotr.piorkowski@intel.com>
>>
>> The LMEM provisioning is applicable only on platforms with LMTT.
>>
>> v2:
>>  - new commit description
>>  - use xe_gt_assert in xe_gt_sriov_pf_config_set_lmem instead return
>>    error,
>>  - disable pf_lmem_info if LMTT is not available
>> v3: fix condition in xe_gt_assert
>>
>> Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c  | 6 ++++--
>>  drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c | 4 ++--
>>  2 files changed, 6 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
>> b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
>> index 2420a548cacc..3556c41c041b 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
>> @@ -1520,6 +1520,8 @@ int xe_gt_sriov_pf_config_set_lmem(struct xe_gt
>> *gt, unsigned int vfid, u64 size
>>  {
>>         int err;
>>  
>> +       xe_gt_assert(gt, xe_device_has_lmtt(gt_to_xe(gt)));
>> +
>>         mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
>>         if (vfid)
>>                 err = pf_provision_vf_lmem(gt, vfid, size);
>> @@ -1629,7 +1631,7 @@ int xe_gt_sriov_pf_config_set_fair_lmem(struct
>> xe_gt *gt, unsigned int vfid,
>>         xe_gt_assert(gt, num_vfs);
>>         xe_gt_assert(gt, !xe_gt_is_media_type(gt));
>>  
>> -       if (!IS_DGFX(gt_to_xe(gt)))
>> +       if (!xe_device_has_lmtt(gt_to_xe(gt)))
>>                 return 0;
>>  
>>         mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
>> @@ -2163,7 +2165,7 @@ static int pf_validate_vf_config(struct xe_gt
>> *gt, unsigned int vfid)
>>         valid_all = valid_all && valid_ggtt;
>>         valid_any = valid_any || (valid_ggtt && is_primary);
>>  
>> -       if (IS_DGFX(xe)) {
>> +       if (xe_device_has_lmtt(xe)) {
> 
> I see a few other calls like pf_sanitize_vf_resources() and

from old offline discussion - there is/was a plan to reuse lmem_obj also
when we will not let to configure LMEM manually, not sure if that stands
still, though

> pf_validate_vf_config() 

it's touched in this patch right here ;)

> and pf_restore_vf_config_klv() and
> pf_get_ggtt_alignment() in this same file. Is there a reason not to
> just change all these at once?

if we want to allow the LMEM configuration only with LMTT then agree

then maybe we should drop new explicit assert in:

	xe_gt_sriov_pf_config_set_lmem

and instead replace legacy IS_DGFX in:

	pf_release_vf_config_lmem
	pf_provision_vf_lmem
	pf_release_vf_config

but let Piotr speak here

> 
> Also right now has_lmtt just calls IS_DGFX, and I confirmed this looks
> right from the specs, so at a high level:
> Reviewed-by: Stuart Summers <stuart.summers@intel.com>

I'll wait with my r-b until Piotr reply

> 
> Thanks,
> Stuart
> 
>>                 bool valid_lmem = pf_get_vf_config_lmem(primary_gt,
>> vfid);
>>  
>>                 valid_any = valid_any || (valid_lmem && is_primary);
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
>> b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
>> index 0fe47f41b63c..13970d5a2867 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
>> @@ -308,7 +308,7 @@ static void pf_add_config_attrs(struct xe_gt *gt,
>> struct dentry *parent, unsigne
>>         if (!xe_gt_is_media_type(gt)) {
>>                 debugfs_create_file_unsafe(vfid ? "ggtt_quota" :
>> "ggtt_spare",
>>                                            0644, parent, parent,
>> &ggtt_fops);
>> -               if (IS_DGFX(gt_to_xe(gt)))
>> +               if (xe_device_has_lmtt(gt_to_xe(gt)))
>>                         debugfs_create_file_unsafe(vfid ?
>> "lmem_quota" : "lmem_spare",
>>                                                    0644, parent,
>> parent, &lmem_fops);
>>         }
>> @@ -558,7 +558,7 @@ void xe_gt_sriov_pf_debugfs_register(struct xe_gt
>> *gt, struct dentry *root)
>>                 drm_debugfs_create_files(pf_ggtt_info,
>>                                          ARRAY_SIZE(pf_ggtt_info),
>>                                          pfdentry, minor);
>> -               if (IS_DGFX(gt_to_xe(gt)))
>> +               if (xe_device_has_lmtt(gt_to_xe(gt)))
>>                         drm_debugfs_create_files(pf_lmem_info,
>>                                                 
>> ARRAY_SIZE(pf_lmem_info),
>>                                                  pfdentry, minor);
> 

