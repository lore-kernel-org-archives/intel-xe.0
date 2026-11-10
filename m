Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93DE0606A31C
	for <intel-xe@archiver.kernel.org>; Tue, 10 Nov 2026 10:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bLHc4uBm
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CF5410EFAE;
	Tue, 10 Nov 2026 10:47:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EEEC10E093
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Nov 2026 10:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794307637; x=1825843637;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=1WevxG6O3+BCn6B4PgqtaCCQskllvWZGzXizH5/S5/8=;
 b=bLHc4uBmEdm4Ev43/7Kj8rKn2LE+Jz6MeSHadVqA6corzCmOLXJhOQny
 P086XFU6H2IAsef6NTUaHL+mv/yGQ2H18JrpXzreBLRsz8VXmkCqVEIjt
 YLuMd7b9FE6IOVKuWEy6MbQ2uv9OCbGROu9KtYNS0THrYY2g43gLF9q25
 w2gzE5G7bWAVZpUW+RntO1XqjhgQD0x2QFssnetA4ZelI2zsWEHSiF+rB
 7UF3Adt0+ZXu3gf2Pi/39YxBmrCsWTSJLdIr73ka2J47XY03A1cvGetpn
 lbV0x1vW6p/SevsvX6iCYMH8LKPPx9ouxsXDUipcADodO9KWH/rv61Ppv Q==;
X-CSE-ConnectionGUID: omYOKH0ZS+iwSDN7zS5pCA==
X-CSE-MsgGUID: yKmFA1YaQtiUjUpHH64nuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="3150390"
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="3150390"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 02:47:17 -0800
X-CSE-ConnectionGUID: gEG5CnPjRzePQ5aNonw5sA==
X-CSE-MsgGUID: J8BDHWp/RcuqEt2mbGLsOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="7984412"
Received: from soc-5cg43972f8.clients.intel.com (HELO [172.28.182.154])
 ([172.28.182.154])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 02:47:16 -0800
Message-ID: <0ec4bf5a-ef46-485f-89f0-9cc5073817f3@linux.intel.com>
Date: Tue, 10 Nov 2026 11:47:13 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/5] drm/xe/pf: Add locked variant of the fair VFs
 provisioning
To: =?UTF-8?Q?Pi=C3=B3rkowski=2C_Piotr?= <piotr.piorkowski@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20261027103009.1259199-1-piotr.piorkowski@intel.com>
 <20261027103009.1259199-4-piotr.piorkowski@intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20261027103009.1259199-4-piotr.piorkowski@intel.com>
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
> We will want to provision the VFs with fair resources while already
> holding the master mutex, to make the provisioning mode check and the
> actual provisioning atomic.
>
> Convert the per-resource fair provisioning functions, which are only
> called from xe_gt_sriov_pf_config_set_fair(), into the _locked variants
> and add xe_gt_sriov_pf_config_set_fair_locked(). The existing function
> now takes the master mutex once for all resources, instead of taking
> it separately for each resource.
>
> Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 71 +++++++++++++++-------
>   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h | 15 +++--
>   2 files changed, 58 insertions(+), 28 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index 0a47458e5bf2..c8ab4138f6a8 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -774,17 +774,18 @@ static u64 pf_profile_fair_ggtt(struct xe_gt *gt, unsigned int num_vfs)
>   }
>   
>   /**
> - * xe_gt_sriov_pf_config_set_fair_ggtt - Provision many VFs with fair GGTT.
> + * xe_gt_sriov_pf_config_set_fair_ggtt_locked - Provision many VFs with fair GGTT.
>    * @gt: the &xe_gt (can't be media)
>    * @vfid: starting VF identifier (can't be 0)
>    * @num_vfs: number of VFs to provision
>    *
> + * The caller must hold the master PF mutex.
>    * This function can only be called on PF.
>    *
>    * Return: 0 on success or a negative error code on failure.
>    */
> -int xe_gt_sriov_pf_config_set_fair_ggtt(struct xe_gt *gt, unsigned int vfid,
> -					unsigned int num_vfs)
> +int xe_gt_sriov_pf_config_set_fair_ggtt_locked(struct xe_gt *gt, unsigned int vfid,
> +					       unsigned int num_vfs)
>   {
>   	u64 profile = pf_profile_fair_ggtt(gt, num_vfs);
>   	u64 fair;
> @@ -793,7 +794,7 @@ int xe_gt_sriov_pf_config_set_fair_ggtt(struct xe_gt *gt, unsigned int vfid,
>   	xe_gt_assert(gt, num_vfs);
>   	xe_gt_assert(gt, xe_gt_is_main_type(gt));
>   
> -	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));
> +	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
>   
>   	fair = pf_estimate_fair_ggtt(gt, num_vfs);
>   	if (!fair)
> @@ -1205,17 +1206,18 @@ static u32 pf_estimate_fair_ctxs(struct xe_gt *gt, unsigned int num_vfs)
>   }
>   
>   /**
> - * xe_gt_sriov_pf_config_set_fair_ctxs - Provision many VFs with fair GuC context IDs.
> + * xe_gt_sriov_pf_config_set_fair_ctxs_locked - Provision many VFs with fair GuC context IDs.
>    * @gt: the &xe_gt
>    * @vfid: starting VF identifier (can't be 0)
>    * @num_vfs: number of VFs to provision (can't be 0)
>    *
> + * The caller must hold the master PF mutex.
>    * This function can only be called on PF.
>    *
>    * Return: 0 on success or a negative error code on failure.
>    */
> -int xe_gt_sriov_pf_config_set_fair_ctxs(struct xe_gt *gt, unsigned int vfid,
> -					unsigned int num_vfs)
> +int xe_gt_sriov_pf_config_set_fair_ctxs_locked(struct xe_gt *gt, unsigned int vfid,
> +					       unsigned int num_vfs)
>   {
>   	u32 profile = pf_profile_fair_ctxs(gt, num_vfs);
>   	u32 fair;
> @@ -1223,7 +1225,7 @@ int xe_gt_sriov_pf_config_set_fair_ctxs(struct xe_gt *gt, unsigned int vfid,
>   	xe_gt_assert(gt, vfid);
>   	xe_gt_assert(gt, num_vfs);
>   
> -	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));
> +	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
>   
>   	fair = pf_estimate_fair_ctxs(gt, num_vfs);
>   	if (!fair)
> @@ -1487,17 +1489,18 @@ static u32 pf_estimate_fair_dbs(struct xe_gt *gt, unsigned int num_vfs)
>   }
>   
>   /**
> - * xe_gt_sriov_pf_config_set_fair_dbs - Provision many VFs with fair GuC doorbell  IDs.
> + * xe_gt_sriov_pf_config_set_fair_dbs_locked - Provision many VFs with fair GuC doorbell  IDs.
>    * @gt: the &xe_gt
>    * @vfid: starting VF identifier (can't be 0)
>    * @num_vfs: number of VFs to provision (can't be 0)
>    *
> + * The caller must hold the master PF mutex.
>    * This function can only be called on PF.
>    *
>    * Return: 0 on success or a negative error code on failure.
>    */
> -int xe_gt_sriov_pf_config_set_fair_dbs(struct xe_gt *gt, unsigned int vfid,
> -				       unsigned int num_vfs)
> +int xe_gt_sriov_pf_config_set_fair_dbs_locked(struct xe_gt *gt, unsigned int vfid,
> +					      unsigned int num_vfs)
>   {
>   	u32 profile = pf_profile_fair_dbs(gt, num_vfs);
>   	u32 fair;
> @@ -1505,7 +1508,7 @@ int xe_gt_sriov_pf_config_set_fair_dbs(struct xe_gt *gt, unsigned int vfid,
>   	xe_gt_assert(gt, vfid);
>   	xe_gt_assert(gt, num_vfs);
>   
> -	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));
> +	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
>   
>   	fair = pf_estimate_fair_dbs(gt, num_vfs);
>   	if (!fair)
> @@ -2062,17 +2065,18 @@ static bool pf_needs_provision_lmem(struct xe_gt *gt, unsigned int first_vf,
>   }
>   
>   /**
> - * xe_gt_sriov_pf_config_set_fair_lmem - Provision many VFs with fair LMEM.
> + * xe_gt_sriov_pf_config_set_fair_lmem_locked - Provision many VFs with fair LMEM.
>    * @gt: the &xe_gt (can't be media)
>    * @vfid: starting VF identifier (can't be 0)
>    * @num_vfs: number of VFs to provision (can't be 0)
>    *
> + * The caller must hold the master PF mutex.
>    * This function can only be called on PF.
>    *
>    * Return: 0 on success or a negative error code on failure.
>    */
> -int xe_gt_sriov_pf_config_set_fair_lmem(struct xe_gt *gt, unsigned int vfid,
> -					unsigned int num_vfs)
> +int xe_gt_sriov_pf_config_set_fair_lmem_locked(struct xe_gt *gt, unsigned int vfid,
> +					       unsigned int num_vfs)
>   {
>   	u64 profile;
>   	u64 fair;
> @@ -2084,7 +2088,7 @@ int xe_gt_sriov_pf_config_set_fair_lmem(struct xe_gt *gt, unsigned int vfid,
>   	if (!xe_device_has_lmtt(gt_to_xe(gt)))
>   		return 0;
>   
> -	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));
> +	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
>   
>   	if (!pf_needs_provision_lmem(gt, vfid, num_vfs))
>   		return 0;
> @@ -2103,17 +2107,18 @@ int xe_gt_sriov_pf_config_set_fair_lmem(struct xe_gt *gt, unsigned int vfid,
>   }
>   
>   /**
> - * xe_gt_sriov_pf_config_set_fair - Provision many VFs with fair resources.
> + * xe_gt_sriov_pf_config_set_fair_locked() - Provision many VFs with fair resources.
>    * @gt: the &xe_gt
>    * @vfid: starting VF identifier (can't be 0)
>    * @num_vfs: number of VFs to provision (can't be 0)
>    *
> + * The caller must hold the master PF mutex.
>    * This function can only be called on PF.
>    *
>    * Return: 0 on success or a negative error code on failure.
>    */
> -int xe_gt_sriov_pf_config_set_fair(struct xe_gt *gt, unsigned int vfid,
> -				   unsigned int num_vfs)
> +int xe_gt_sriov_pf_config_set_fair_locked(struct xe_gt *gt, unsigned int vfid,
> +					  unsigned int num_vfs)
>   {
>   	int result = 0;
>   	int err;
> @@ -2121,20 +2126,40 @@ int xe_gt_sriov_pf_config_set_fair(struct xe_gt *gt, unsigned int vfid,
>   	xe_gt_assert(gt, vfid);
>   	xe_gt_assert(gt, num_vfs);
>   
> +	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
> +
>   	if (xe_gt_is_main_type(gt)) {
> -		err = xe_gt_sriov_pf_config_set_fair_ggtt(gt, vfid, num_vfs);
> +		err = xe_gt_sriov_pf_config_set_fair_ggtt_locked(gt, vfid, num_vfs);
>   		result = result ?: err;
> -		err = xe_gt_sriov_pf_config_set_fair_lmem(gt, vfid, num_vfs);
> +		err = xe_gt_sriov_pf_config_set_fair_lmem_locked(gt, vfid, num_vfs);
>   		result = result ?: err;
>   	}
> -	err = xe_gt_sriov_pf_config_set_fair_ctxs(gt, vfid, num_vfs);
> +	err = xe_gt_sriov_pf_config_set_fair_ctxs_locked(gt, vfid, num_vfs);
>   	result = result ?: err;
> -	err = xe_gt_sriov_pf_config_set_fair_dbs(gt, vfid, num_vfs);
> +	err = xe_gt_sriov_pf_config_set_fair_dbs_locked(gt, vfid, num_vfs);
>   	result = result ?: err;
>   
>   	return result;
>   }
>   
> +/**
> + * xe_gt_sriov_pf_config_set_fair - Provision many VFs with fair resources.
> + * @gt: the &xe_gt
> + * @vfid: starting VF identifier (can't be 0)
> + * @num_vfs: number of VFs to provision (can't be 0)
> + *
> + * This function can only be called on PF.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_gt_sriov_pf_config_set_fair(struct xe_gt *gt, unsigned int vfid,
> +				   unsigned int num_vfs)
> +{
> +	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));
> +
> +	return xe_gt_sriov_pf_config_set_fair_locked(gt, vfid, num_vfs);
> +}
> +
>   static const char *exec_quantum_unit(u32 exec_quantum)
>   {
>   	return exec_quantum ? "ms" : "(infinity)";
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
> index 3e10697d2174..69841b0fcddb 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
> @@ -14,8 +14,8 @@ struct xe_gt;
>   
>   u64 xe_gt_sriov_pf_config_get_ggtt(struct xe_gt *gt, unsigned int vfid);
>   int xe_gt_sriov_pf_config_set_ggtt(struct xe_gt *gt, unsigned int vfid, u64 size);
> -int xe_gt_sriov_pf_config_set_fair_ggtt(struct xe_gt *gt,
> -					unsigned int vfid, unsigned int num_vfs);
> +int xe_gt_sriov_pf_config_set_fair_ggtt_locked(struct xe_gt *gt,
> +					       unsigned int vfid, unsigned int num_vfs);
>   int xe_gt_sriov_pf_config_bulk_set_ggtt(struct xe_gt *gt,
>   					unsigned int vfid, unsigned int num_vfs, u64 size);
>   int xe_gt_sriov_pf_config_bulk_set_ggtt_locked(struct xe_gt *gt,
> @@ -23,7 +23,8 @@ int xe_gt_sriov_pf_config_bulk_set_ggtt_locked(struct xe_gt *gt,
>   
>   u32 xe_gt_sriov_pf_config_get_ctxs(struct xe_gt *gt, unsigned int vfid);
>   int xe_gt_sriov_pf_config_set_ctxs(struct xe_gt *gt, unsigned int vfid, u32 num_ctxs);
> -int xe_gt_sriov_pf_config_set_fair_ctxs(struct xe_gt *gt, unsigned int vfid, unsigned int num_vfs);
> +int xe_gt_sriov_pf_config_set_fair_ctxs_locked(struct xe_gt *gt, unsigned int vfid,
> +					       unsigned int num_vfs);
>   int xe_gt_sriov_pf_config_bulk_set_ctxs(struct xe_gt *gt, unsigned int vfid, unsigned int num_vfs,
>   					u32 num_ctxs);
>   int xe_gt_sriov_pf_config_bulk_set_ctxs_locked(struct xe_gt *gt, unsigned int vfid,
> @@ -31,7 +32,8 @@ int xe_gt_sriov_pf_config_bulk_set_ctxs_locked(struct xe_gt *gt, unsigned int vf
>   
>   u32 xe_gt_sriov_pf_config_get_dbs(struct xe_gt *gt, unsigned int vfid);
>   int xe_gt_sriov_pf_config_set_dbs(struct xe_gt *gt, unsigned int vfid, u32 num_dbs);
> -int xe_gt_sriov_pf_config_set_fair_dbs(struct xe_gt *gt, unsigned int vfid, unsigned int num_vfs);
> +int xe_gt_sriov_pf_config_set_fair_dbs_locked(struct xe_gt *gt, unsigned int vfid,
> +					      unsigned int num_vfs);
>   int xe_gt_sriov_pf_config_bulk_set_dbs(struct xe_gt *gt, unsigned int vfid, unsigned int num_vfs,
>   				       u32 num_dbs);
>   int xe_gt_sriov_pf_config_bulk_set_dbs_locked(struct xe_gt *gt, unsigned int vfid,
> @@ -39,7 +41,8 @@ int xe_gt_sriov_pf_config_bulk_set_dbs_locked(struct xe_gt *gt, unsigned int vfi
>   
>   u64 xe_gt_sriov_pf_config_get_lmem(struct xe_gt *gt, unsigned int vfid);
>   int xe_gt_sriov_pf_config_set_lmem(struct xe_gt *gt, unsigned int vfid, u64 size);
> -int xe_gt_sriov_pf_config_set_fair_lmem(struct xe_gt *gt, unsigned int vfid, unsigned int num_vfs);
> +int xe_gt_sriov_pf_config_set_fair_lmem_locked(struct xe_gt *gt, unsigned int vfid,
> +					       unsigned int num_vfs);
>   int xe_gt_sriov_pf_config_bulk_set_lmem(struct xe_gt *gt, unsigned int vfid, unsigned int num_vfs,
>   					u64 size);
>   u64 xe_gt_sriov_pf_config_get_lmem_locked(struct xe_gt *gt, unsigned int vfid);
> @@ -89,6 +92,8 @@ int xe_gt_sriov_pf_config_set_threshold(struct xe_gt *gt, unsigned int vfid,
>   int xe_gt_sriov_pf_config_set_fair_sched(struct xe_gt *gt, unsigned int num_vfs);
>   int xe_gt_sriov_pf_config_set_fair_sched_locked(struct xe_gt *gt, unsigned int num_vfs);
>   int xe_gt_sriov_pf_config_set_fair(struct xe_gt *gt, unsigned int vfid, unsigned int num_vfs);
> +int xe_gt_sriov_pf_config_set_fair_locked(struct xe_gt *gt, unsigned int vfid,
> +					  unsigned int num_vfs);
>   int xe_gt_sriov_pf_config_sanitize(struct xe_gt *gt, unsigned int vfid, long timeout);
>   int xe_gt_sriov_pf_config_release(struct xe_gt *gt, unsigned int vfid, bool force);
>   int xe_gt_sriov_pf_config_release_locked(struct xe_gt *gt, unsigned int vfid, bool force);
