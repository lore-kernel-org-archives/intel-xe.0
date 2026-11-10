Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC095606A32A
	for <intel-xe@archiver.kernel.org>; Tue, 10 Nov 2026 10:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Mxh9m3G6
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A619610E093;
	Tue, 10 Nov 2026 10:46:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 252F610E093
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Nov 2026 10:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794307574; x=1825843574;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=KAFd7gq2I3X8ugYXIwbRLn0BU00q9RTshhe064yLtwY=;
 b=Mxh9m3G64ne9xtXeOiHQRwt/Ej9GtDlCzb6brzmeBfbIcGJufpK7SxVy
 tPdMwg/dr6IK6tgcSSgZUoxWEWejNZhIVhUK2FPW7BVt3MNMQnAJQ56sH
 UZKkOi6ioPGePWIh7FUAdYDQtTrpPsJYf3h/toYI4MEBTnYuq1AJTQYR1
 tDJX9RwZZhdLbl5W0chnQeEThURUOrYRFl09z6rifwi0h3iPJTK33HhNn
 0eGyttglChY/fTCQIbSdoAuOcRGoWS1e4G20yYEzVNHUiugH3m3uPUAaV
 AIxae6jD39HnJ00QZOU/ZL46WihRl+yxDKH7JPoEaGbwURCD1QNuxbQJJ A==;
X-CSE-ConnectionGUID: kTmI0IlISRWwhvuQHE2pQw==
X-CSE-MsgGUID: C8Yi0GZaSGSOMURnFakwMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="3082980"
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="3082980"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 02:46:14 -0800
X-CSE-ConnectionGUID: lyjxJCkTQ7ufGfzyd7XhQQ==
X-CSE-MsgGUID: L5xxt82tS/WO95WR2RKjtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="7992363"
Received: from soc-5cg43972f8.clients.intel.com (HELO [172.28.182.154])
 ([172.28.182.154])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 02:46:12 -0800
Message-ID: <9e2a7049-bfc4-4016-90e1-fa8f2ba9509a@linux.intel.com>
Date: Tue, 10 Nov 2026 11:46:10 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/5] drm/xe/pf: Change provisioning mode under mutex
To: =?UTF-8?Q?Pi=C3=B3rkowski=2C_Piotr?= <piotr.piorkowski@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20261027103009.1259199-1-piotr.piorkowski@intel.com>
 <20261027103009.1259199-3-piotr.piorkowski@intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20261027103009.1259199-3-piotr.piorkowski@intel.com>
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
> From: Michal Wajdeczko <michal.wajdeczko@intel.com>
>
> The provisioning mode is changed from the debugfs handlers, but it is
> also checked when VFs are disabled, without any locking. Since we now
> have xe_gt_sriov_pf_config_release_locked(), we can release the VFs
> configuration while holding the master mutex, and do a proper locking
> while changing the provisioning mode and while unprovisioning the VFs.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_sriov_pf_provision.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_provision.c b/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
> index 91670063f706..e713a24b8864 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
> @@ -56,9 +56,11 @@ static void pf_unprovision_vfs(struct xe_device *xe, unsigned int num_vfs)
>   	unsigned int id;
>   	unsigned int n;
>   
> +	lockdep_assert_held(xe_sriov_pf_master_mutex(xe));
> +
>   	for_each_gt(gt, xe, id)
>   		for (n = 1; n <= num_vfs; n++)
> -			xe_gt_sriov_pf_config_release(gt, n, true);
> +			xe_gt_sriov_pf_config_release_locked(gt, n, true);
>   }
>   
>   static void pf_unprovision_all_vfs(struct xe_device *xe)
> @@ -98,6 +100,8 @@ int xe_sriov_pf_unprovision_vfs(struct xe_device *xe, unsigned int num_vfs)
>   {
>   	xe_assert(xe, IS_SRIOV_PF(xe));
>   
> +	guard(mutex)(xe_sriov_pf_master_mutex(xe));
> +
>   	if (!pf_auto_provisioning_mode(xe))
>   		return 0;
>   
> @@ -166,6 +170,8 @@ int xe_sriov_pf_provision_set_mode(struct xe_device *xe, enum xe_sriov_provision
>   {
>   	xe_assert(xe, IS_SRIOV_PF(xe));
>   
> +	guard(mutex)(xe_sriov_pf_master_mutex(xe));
> +
>   	if (mode == xe->sriov.pf.provision.mode)
>   		return 0;
>   
