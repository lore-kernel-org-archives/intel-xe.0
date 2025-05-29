Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A496EC54FB3
	for <intel-xe@archiver.kernel.org>; Thu, 29 May 2025 20:35:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 895A810E767;
	Thu, 29 May 2025 20:35:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lkKnRk/4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E08B10E241
 for <intel-xe@lists.freedesktop.org>; Thu, 29 May 2025 20:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748550914; x=1780086914;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=SZiZEtUG5RZoSu6oe6KUF8lnqrF0ozcdUnmN76HVcJk=;
 b=lkKnRk/4LPGImYR5fk15rbCmp6FjMclF73XisrPJojpe+XVNXCeksPvf
 Yy3fy3BG/KFbxPSc10yQYRvsW5n9RnyNVFvhvcX5uXlIywJpREaHdzvnF
 h0wV9am2lVbCD7BQiDFpaf/X+wBemqOMLA+y2ae5cyq4G4khSvrBmTaW2
 FWMdCoLWk2D1chpyNLO5xA1ku4/6cZxY1r2ux+O/+ZStz0oDGK6uM1kYT
 HyEuSvq7e8BKatGepltaCDIRmhC0idnnNxGmQgaoswWXj1dTKfnW5uy5U
 vyP29PUbuVWLv3tZy9tZp8Ebyo3vwZPuW2DMv8WFAPt7cw0x+4+5Fd+Oj A==;
X-CSE-ConnectionGUID: ynXgSt4gTN6b1A+S+cgDcw==
X-CSE-MsgGUID: AvGOVa+uS8usUTUjJtMnSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="62036391"
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; d="scan'208";a="62036391"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 13:35:13 -0700
X-CSE-ConnectionGUID: f3eH4G5URz6t9Q9iee+8BQ==
X-CSE-MsgGUID: CzlbfUnKShi3EVb8Wfbezw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; d="scan'208";a="180877097"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa001.jf.intel.com with ESMTP; 29 May 2025 13:35:12 -0700
Received: from [10.245.113.199] (unknown [10.245.113.199])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 7D36B3496A;
 Thu, 29 May 2025 21:35:11 +0100 (IST)
Message-ID: <4e0e59e2-06d6-4d79-9aa2-6b78f039e5f1@intel.com>
Date: Thu, 29 May 2025 22:35:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] drm/xe/uc: Prepare uc_fw_version for storing the
 VF ABI version
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20250528234229.4185039-6-daniele.ceraolospurio@intel.com>
 <20250528234229.4185039-7-daniele.ceraolospurio@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250528234229.4185039-7-daniele.ceraolospurio@intel.com>
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



On 29.05.2025 01:42, Daniele Ceraolo Spurio wrote:
> The VF ABI version has a branch field, so to store it inside the
> uc_fw_version we need to add a new branch variable to the latter.
> Existing code needs to be updated to handle the fact that we have the
> new field.
> 
> v2: split out to its own patch (Michal)
> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc_engine_activity.c | 2 +-
>  drivers/gpu/drm/xe/xe_uc_fw_types.h         | 2 ++
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity.c b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
> index 0fb48f8f05d8..92e1f9f41b8c 100644
> --- a/drivers/gpu/drm/xe/xe_guc_engine_activity.c
> +++ b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
> @@ -124,7 +124,7 @@ static void free_engine_activity_buffers(struct engine_activity_buffer *buffer)
>  static bool is_engine_activity_supported(struct xe_guc *guc)
>  {
>  	struct xe_uc_fw_version *version = &guc->fw.versions.found[XE_UC_FW_VER_COMPATIBILITY];
> -	struct xe_uc_fw_version required = { 1, 14, 1 };
> +	struct xe_uc_fw_version required = { .major = 1, .minor = 14, .patch = 1 };
>  	struct xe_gt *gt = guc_to_gt(guc);
>  
>  	if (IS_SRIOV_VF(gt_to_xe(gt))) {
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw_types.h b/drivers/gpu/drm/xe/xe_uc_fw_types.h
> index ad3b35a0e6eb..914026015019 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw_types.h
> +++ b/drivers/gpu/drm/xe/xe_uc_fw_types.h
> @@ -65,6 +65,8 @@ enum xe_uc_fw_type {
>   * struct xe_uc_fw_version - Version for XE micro controller firmware
>   */
>  struct xe_uc_fw_version {
> +	/** @branch: branch version of the FW (not always available) */
> +	u16 branch;
>  	/** @major: major version of the FW */
>  	u16 major;
>  	/** @minor: minor version of the FW */

