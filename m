Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B15B606A330
	for <intel-xe@archiver.kernel.org>; Tue, 10 Nov 2026 10:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=k1/e9Ioa
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C781710E093;
	Tue, 10 Nov 2026 10:48:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71CC310E093
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Nov 2026 10:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794307698; x=1825843698;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=UJKVRqwLFQ7+KYs9/VovZFTK/X6jRYwEHKYnHLBgAHU=;
 b=k1/e9IoaIiaNYJdfexGTMpfEtI9vL+XIvufVtoBLBRWnPSDrFSUfsWgC
 R+DguoWUIQ/JjSHj0Y5SwYkhZqlNBauuJuYwiwQpTlb7QbmG+39+7DqCF
 jjaHizpmJ03I7DPfG5tVF92ooEBgW6p7FRc+6cHO6OwPvEs0mh8QyXEF8
 raZtanOZvR5RdDSnb5SIct2fHTrUEwf3s91F7PNFMcz9PKSdzJdEv/++K
 nXdf4/hWBoDnFn0IOM5Rb9FZHJaWT8GVh3fPNmXSlf2ydDngYaoDDc57h
 uxPPPvDWIt9UYC8s8quxmvx5OO4cVu5iSiWgQafr/BE1Us2GX7tc/SZZ/ Q==;
X-CSE-ConnectionGUID: ZhEHY7erQ5mpX2uYvV63OA==
X-CSE-MsgGUID: mxUliQb9RKKOCh3TrybJZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="3064016"
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="3064016"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 02:48:18 -0800
X-CSE-ConnectionGUID: deLnQD5dTXaU0CdCdtQarA==
X-CSE-MsgGUID: nl3kmnq8QKmGcHMHHHdS0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="8444116"
Received: from soc-5cg43972f8.clients.intel.com (HELO [172.28.182.154])
 ([172.28.182.154])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 02:48:17 -0800
Message-ID: <78cd3df5-90a2-4dbe-90c9-73a992700964@linux.intel.com>
Date: Tue, 10 Nov 2026 11:48:14 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/5] drm/xe/pf: Provision VFs under mutex
To: =?UTF-8?Q?Pi=C3=B3rkowski=2C_Piotr?= <piotr.piorkowski@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20261027103009.1259199-1-piotr.piorkowski@intel.com>
 <20261027103009.1259199-5-piotr.piorkowski@intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20261027103009.1259199-5-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

LGTM,

Reviewed-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>

On 10/27/2026 11:30 AM, Piórkowski, Piotr wrote:
> From: Piotr Piórkowski <piotr.piorkowski@intel.com>
>
> The provisioning mode is now changed under the master mutex, but it
> is still checked without any locking when VFs are being provisioned,
> so the mode could change between the check and the provisioning.
>
> Use the locked variants of the fair provisioning functions and hold
> the master mutex while checking the mode and provisioning the VFs.
>
> This was the last user of the unlocked fair provisioning functions,
> so remove them.
>
> Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 34 ----------------------
>   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h |  2 --
>   drivers/gpu/drm/xe/xe_sriov_pf_provision.c |  8 +++--
>   3 files changed, 6 insertions(+), 38 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index c8ab4138f6a8..cca2f837e90b 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -2142,24 +2142,6 @@ int xe_gt_sriov_pf_config_set_fair_locked(struct xe_gt *gt, unsigned int vfid,
>   	return result;
>   }
>   
> -/**
> - * xe_gt_sriov_pf_config_set_fair - Provision many VFs with fair resources.
> - * @gt: the &xe_gt
> - * @vfid: starting VF identifier (can't be 0)
> - * @num_vfs: number of VFs to provision (can't be 0)
> - *
> - * This function can only be called on PF.
> - *
> - * Return: 0 on success or a negative error code on failure.
> - */
> -int xe_gt_sriov_pf_config_set_fair(struct xe_gt *gt, unsigned int vfid,
> -				   unsigned int num_vfs)
> -{
> -	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));
> -
> -	return xe_gt_sriov_pf_config_set_fair_locked(gt, vfid, num_vfs);
> -}
> -
>   static const char *exec_quantum_unit(u32 exec_quantum)
>   {
>   	return exec_quantum ? "ms" : "(infinity)";
> @@ -2855,22 +2837,6 @@ int xe_gt_sriov_pf_config_set_fair_sched_locked(struct xe_gt *gt, unsigned int n
>   	return result;
>   }
>   
> -/**
> - * xe_gt_sriov_pf_config_set_fair_sched() - Provision PF and VFs with fair scheduling.
> - * @gt: the &xe_gt
> - * @num_vfs: number of VFs to provision (can't be 0)
> - *
> - * This function can only be called on PF.
> - *
> - * Return: 0 on success or a negative error code on failure.
> - */
> -int xe_gt_sriov_pf_config_set_fair_sched(struct xe_gt *gt, unsigned int num_vfs)
> -{
> -	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));
> -
> -	return xe_gt_sriov_pf_config_set_fair_sched_locked(gt, num_vfs);
> -}
> -
>   static int pf_provision_threshold(struct xe_gt *gt, unsigned int vfid,
>   				  enum xe_guc_klv_threshold_index index, u32 value)
>   {
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
> index 69841b0fcddb..0d45dc9672e7 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
> @@ -89,9 +89,7 @@ u32 xe_gt_sriov_pf_config_get_threshold(struct xe_gt *gt, unsigned int vfid,
>   int xe_gt_sriov_pf_config_set_threshold(struct xe_gt *gt, unsigned int vfid,
>   					enum xe_guc_klv_threshold_index index, u32 value);
>   
> -int xe_gt_sriov_pf_config_set_fair_sched(struct xe_gt *gt, unsigned int num_vfs);
>   int xe_gt_sriov_pf_config_set_fair_sched_locked(struct xe_gt *gt, unsigned int num_vfs);
> -int xe_gt_sriov_pf_config_set_fair(struct xe_gt *gt, unsigned int vfid, unsigned int num_vfs);
>   int xe_gt_sriov_pf_config_set_fair_locked(struct xe_gt *gt, unsigned int vfid,
>   					  unsigned int num_vfs);
>   int xe_gt_sriov_pf_config_sanitize(struct xe_gt *gt, unsigned int vfid, long timeout);
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_provision.c b/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
> index e713a24b8864..6ea2a24fef6e 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
> @@ -40,10 +40,12 @@ static int pf_provision_vfs(struct xe_device *xe, unsigned int num_vfs)
>   	int result = 0;
>   	int err;
>   
> +	lockdep_assert_held(xe_sriov_pf_master_mutex(xe));
> +
>   	for_each_gt(gt, xe, id) {
> -		err = xe_gt_sriov_pf_config_set_fair_sched(gt, num_vfs);
> +		err = xe_gt_sriov_pf_config_set_fair_sched_locked(gt, num_vfs);
>   		result = result ?: err;
> -		err = xe_gt_sriov_pf_config_set_fair(gt, VFID(1), num_vfs);
> +		err = xe_gt_sriov_pf_config_set_fair_locked(gt, VFID(1), num_vfs);
>   		result = result ?: err;
>   	}
>   
> @@ -81,6 +83,8 @@ int xe_sriov_pf_provision_vfs(struct xe_device *xe, unsigned int num_vfs)
>   {
>   	xe_assert(xe, IS_SRIOV_PF(xe));
>   
> +	guard(mutex)(xe_sriov_pf_master_mutex(xe));
> +
>   	if (!pf_auto_provisioning_mode(xe))
>   		return 0;
>   
