Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9989BCD11C2
	for <intel-xe@archiver.kernel.org>; Wed, 10 Apr 2024 16:24:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B046910EBA9;
	Wed, 10 Apr 2024 16:24:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GBSLZwYn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F156710F84E
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Apr 2024 16:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712766252; x=1744302252;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=d7afetui01GHMA/djUyyM/McCCzGO8u8R3qPfyHwd20=;
 b=GBSLZwYndSuC0qudS6S8+KFkKv8+RDODW8tl0/FWwI6i0+k+ZR0QrBtd
 aKYdkPPxWj2CkmtypOzpkb4/vgHSVqhG8jK4hDVmMAQzfEK56eYPqbrST
 Lh1dIcS2wW6eGr7RC449+WPGQHRWYjDzjw2CPOW7IGWewE65ncsgSa5Ah
 hVEJZbphw59n4WyfNMYWMltubxZsimvBh/UFyoNpHB6DfNODWYjWjmHi+
 sRWbv/ywrJ+xNWV0/tyOEHrfWPpIebAj27zuKHlJLyWvihUfG+b/poslC
 EU4zezqVzJkl61uG+f8HdGUCkFs6Xr8eK9j50/fWxyk2ohnWFInluCKt9 g==;
X-CSE-ConnectionGUID: WHwhnJuwRI+TjwK/wyVXNg==
X-CSE-MsgGUID: cHY/CcpASauZjxYDGUklkQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="25590197"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="25590197"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 09:24:11 -0700
X-CSE-ConnectionGUID: QNGyaDj/QHqhowZG0HmHmg==
X-CSE-MsgGUID: IvlSb0twRfyFtY1x5ivUUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="20500581"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Apr 2024 09:24:08 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 10 Apr 2024 09:24:08 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 10 Apr 2024 09:24:08 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 10 Apr 2024 09:24:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q6K/FxTVEy2whGVEA7KHbBKuAxYCd1Sns+Gc4DugeARlIqIyRiAQRYCA5z3wxklISh/lwNX8pdSU/SdcNiJfY76hRisGHyitSpc1Jwh9pZEtz67AbuF92V6dS5x2L1L5AgKN6tA6Zr3xey0dTIekPZ9p07FwW1/ZV8LyzF7dSVGc8bBzyRUk2e7CJvCDjl6T+0r2IFjIYmZCfQLi0k1pyoBH5FUW0hDg1nN7jrWnqv0rZYwOf7l/kQzMjh5g6nNTUZ5Pkm1uf/rQ3xfunK8CeMEycOy3OKIqAE/QwNdJW+suc9oaaC2NErDdtNv53eH65eh5f8/oSpctD3b7soYL4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LBTXcV0cGPEF6tAcJxR+9UItM5KSU5if333V7kE1UCY=;
 b=UeGlEeLY4xZsKzh/wDXllh26lE0BcW75+OVx1AlNy1OVr96jN1tphwjXgauGYAad2q+WTbuUCDWXl1GDDpMPVC8C9WhQCdBkSjhgmGRAPFDd03OZKpLH/KYQoI5n37roOA5MJ/K/7LczkhItucmQ6gnrAwqxhOtyNPtXFCs7PUe/FqgEiAdIMBsRNSl2ax82wCw4WdphhqmehJEGRmuRlp4mqOXZizqaoBErsB94itqUrTz6UoEvg6jPuejFHM+RdxliHjeokB8MIcuXWZtutYUOx19gFxcixv7aV0vAEZ+uEaLvch9/QfRZJVGzujFlItw9LRwTpzytoMMpRxRoEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB8296.namprd11.prod.outlook.com (2603:10b6:a03:47a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.25; Wed, 10 Apr
 2024 16:24:05 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7452.019; Wed, 10 Apr 2024
 16:24:05 +0000
Date: Wed, 10 Apr 2024 16:22:59 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/3] drm/xe/guc: Prefer GT oriented logs in GuC CTB code
Message-ID: <Zha8484g7M9w+RBD@DUT025-TGLU.fm.intel.com>
References: <20240404193647.759-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240404193647.759-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR13CA0087.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::32) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB8296:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Pjg6QYd4pjR1R14igZyYSFLGIEO+JbIzt7DnUnAlUnl2i9CsxQ7RQtDETrkT6dXbzqowfI8Me9I8thVvgqVgEuXi5fHbHuUjzcIDH4E9a9aMu1OTAGHOh8+YAhtBN8zcK0aQcEhXg2KCi2hGuCr5/GgSEs2ycf93vGLygua5XakSDzl/F5aGBpoZTjekXFUQKkXDDZD0clvSIOEYn/CgI8ddicPGbb8ig00xBadHzlZVGmJFjuw3wUiM7w1OErHpyr+aMb/sVErt6F7cbvcaeHb9dkIs5mRXQlwzrV2mkhNJ9LuAuGqh756r2pvso4og/OUrob7zt2/wXHH9uL9wJ1+EtrrT22uq1kLHgJODQXtjVxumyhLYu7SES1ofE83RigmnY/3J2/gObh8F4UfF5/iIGtUi7kcmBSSCpyErLvkOEtKx2D9jQ5/2uX2Jp+mxp+O3y73dVXgD8kWicioIIP3CDqJp/BUDbqwaFHIsKN8fKq2yANvqjdmyCERQOo4BpOgVev6NzOmLHNuATRFPyszO3+04tU3LEPnXj7oUcSXDNt2XvPgQDjNLg8TiuDqnmi/SApU4co9cclYrm1luSrTEEBpYA6cVcYNt7eSNR8xQADGFISEpk0i+CXPlnP4m23uk2ZMCIF0JBFLi1DtjenCyjuy6X4h0JJvufZTy5Qk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XfrsdKSyzAubCpfaX+ZVB8m+oOnIIIfCanoxPvnJBRYnVeTrJ03a02enjWHW?=
 =?us-ascii?Q?1mFyuatrkCd9+LAERQO5uEoTeGUYMfUdj9NmJM3ljui2J8WneVSJQ4J7SCF4?=
 =?us-ascii?Q?SPGlojisVApIRFCbrFXM/HfHLbKk6j1MZEg8JYasrQCIa+0axuqXc3hjVALJ?=
 =?us-ascii?Q?PKcBJOGEIOXr0iB+FQat3dYTx1dz4eJfBIjpeJu3n85xEo4K7SfJYwVBrOZ7?=
 =?us-ascii?Q?Brq9ZufLooKgXdisKlu2BYkBGHqhbnpOe3Av6uI6fLNbkO46HC0u7J87Lbuq?=
 =?us-ascii?Q?hkL/qtg+QjszL7K+zRxPLbdckOWbVllGgRyNnXTP9pIe0CCPFTNby/t1vk8K?=
 =?us-ascii?Q?87zIV79iY78tZxEd1Dr5MgATBS4EzQri8g2l/Pe+MKoodIQIjonny02MX3Zh?=
 =?us-ascii?Q?Etgfm8JxP7f+rtedyG2m1xblT7Hu7Y2jh8Ir74hn8Nper0J10sOPgj7aGzu4?=
 =?us-ascii?Q?9XUOzG+5rMEGqIvfudhNDZm7vyFbPF5JrNGV0oFCeUUO3jdiUCM5pc7hkjnZ?=
 =?us-ascii?Q?Got6LDgxbuY1BteLC701TTbUBKPJeeek+w++ymhM6msqCxOf+togWbhdaUKC?=
 =?us-ascii?Q?v4sybZVVMUD0hQgiL1afxDY+YiKt2PZkvSvq2xCpCMELry3Kv7hR32d1gyrn?=
 =?us-ascii?Q?xjjkpdqCSKvJNGIDgVGxXpFMYLYBZJUJwjpbyY9JyTDBmXpjNebo04pZ7i4m?=
 =?us-ascii?Q?jOi2ERUKsdqE+Cyx7mx+a4cs7enqpJ5PD0vstuFkY1eVBQp9sM2V+s7L9sur?=
 =?us-ascii?Q?A1MEVamkuCyJI1YS8lPswObQ7rt0JfzbSpTyTq8VujsAbPokzLkcihkxY1UQ?=
 =?us-ascii?Q?4f7/0us4LVQSfs5IILdO8t4AJQfEtSOBUvmsj7ATJrN4bp35UNDwXHt4CjKt?=
 =?us-ascii?Q?Po4ykITv70I6a7uSYKddVqIssK5sVt2SsUtwC9KNDuimJwyUeb51fWU5s7+q?=
 =?us-ascii?Q?ocFcD7vVGZMMsCqUtgyiBWjMlGhztaEDBbhtpiqlaO/7Gz/9ZvmYdcjvcac/?=
 =?us-ascii?Q?pwGiVYC83K7cpc/ST1jchHakfxNsSGLRe5DHDAuvXU7vgJGSdWB7VCIyonYx?=
 =?us-ascii?Q?gonnmDDYnLZ1yhyrLruDj5lUlRQLqcLN0kTho0HW1a4fs/LPnCzkHeiMgbQ3?=
 =?us-ascii?Q?ykOxhGunuYBvxhk4eyesVm9glgAK5TSNH9WTB02AEzOQwE3fhS/vuG37vriU?=
 =?us-ascii?Q?0dQcjhivGPozNj6r4p1F1Fp2fGlEbCSR4fMt0o8eUii+YtloB3znhE8ZN8W3?=
 =?us-ascii?Q?ZxSG3V3Q6vt1cE3u8l9QqVl2woybumuWUPnpih2NX9SUNBOP3yn8OaNP06in?=
 =?us-ascii?Q?5lnH01gkikfsuxgnWdcR3O+ETpib7AtfI/P/rAWbh9EfDo6WyarP4n4SORsU?=
 =?us-ascii?Q?u6BuQ/7jYd7KFPFQPvN0BWMTcXTxxjGtSL6DgwUbEVVSpsgedB7xE8zqQGHB?=
 =?us-ascii?Q?/roEdBOEXssCPV1fWoFKCbQk2iaVUi1jQpfl8VAXWQkrGo3Uc2Vvt4Jt5jCe?=
 =?us-ascii?Q?4hzkQgJqSHTSr0YAwJGN1WXKoiasAEAkkma5gkpP59+yMkFlLn5bMP6wwEOr?=
 =?us-ascii?Q?wzX84XDJnV4QtEfgGcTJX/yeoW32cEM8fCgvS+zA/508U2c5A2koBWlmRQ65?=
 =?us-ascii?Q?zw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 416c16e6-2352-4892-dce0-08dc597aa437
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2024 16:24:05.7068 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KFoxQanrzMlAtERZzHe12zk3Ikz9ysRI/7ArT/V+Xo6aK78zmlqsSJXGqDLMQ7M6vfClQTnEA4x6WPTDF0XOVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB8296
X-OriginatorOrg: intel.com
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

On Thu, Apr 04, 2024 at 09:36:45PM +0200, Michal Wajdeczko wrote:
> A platform can have more than one GuC, so we should use GT-oriented
> logs to refer to specific GuC.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc_ct.c | 62 ++++++++++++++++------------------
>  1 file changed, 30 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 6c37f4f9bddd..74acc4784a37 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -318,6 +318,7 @@ static void xe_guc_ct_set_state(struct xe_guc_ct *ct,
>  int xe_guc_ct_enable(struct xe_guc_ct *ct)
>  {
>  	struct xe_device *xe = ct_to_xe(ct);
> +	struct xe_gt *gt = ct_to_gt(ct);
>  	int err;
>  
>  	xe_assert(xe, !xe_guc_ct_enabled(ct));
> @@ -341,12 +342,12 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
>  
>  	smp_mb();
>  	wake_up_all(&ct->wq);
> -	drm_dbg(&xe->drm, "GuC CT communication channel enabled\n");
> +	xe_gt_dbg(gt, "GuC CT communication channel enabled\n");
>  
>  	return 0;
>  
>  err_out:
> -	drm_err(&xe->drm, "Failed to enable CT (%d)\n", err);
> +	xe_gt_err(gt, "Failed to enable GuC CT (%pe)\n", ERR_PTR(err));
>  
>  	return err;
>  }
> @@ -633,8 +634,8 @@ static int guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  			      u32 g2h_len, u32 num_g2h,
>  			      struct g2h_fence *g2h_fence)
>  {
> -	struct drm_device *drm = &ct_to_xe(ct)->drm;
> -	struct drm_printer p = drm_info_printer(drm->dev);
> +	struct xe_gt *gt = ct_to_gt(ct);
> +	struct drm_printer p = xe_gt_info_printer(gt);
>  	unsigned int sleep_period_ms = 1;
>  	int ret;
>  
> @@ -696,7 +697,7 @@ static int guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  	return ret;
>  
>  broken:
> -	drm_err(drm, "No forward process on H2G, reset required");
> +	xe_gt_err(gt, "No forward process on H2G, reset required\n");
>  	xe_guc_ct_print(ct, &p, true);
>  	ct->ctbs.h2g.info.broken = true;
>  
> @@ -776,7 +777,7 @@ static bool retry_failure(struct xe_guc_ct *ct, int ret)
>  static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  			    u32 *response_buffer, bool no_fail)
>  {
> -	struct xe_device *xe = ct_to_xe(ct);
> +	struct xe_gt *gt = ct_to_gt(ct);
>  	struct g2h_fence g2h_fence;
>  	int ret = 0;
>  
> @@ -818,20 +819,20 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  
>  	ret = wait_event_timeout(ct->g2h_fence_wq, g2h_fence.done, HZ);
>  	if (!ret) {
> -		drm_err(&xe->drm, "Timed out wait for G2H, fence %u, action %04x",
> -			g2h_fence.seqno, action[0]);
> +		xe_gt_err(gt, "Timed out wait for G2H, fence %u, action %04x",
> +			  g2h_fence.seqno, action[0]);
>  		xa_erase_irq(&ct->fence_lookup, g2h_fence.seqno);
>  		return -ETIME;
>  	}
>  
>  	if (g2h_fence.retry) {
> -		drm_warn(&xe->drm, "Send retry, action 0x%04x, reason %d",
> -			 action[0], g2h_fence.reason);
> +		xe_gt_warn(gt, "H2G retry, action 0x%04x, reason %u",
> +			   action[0], g2h_fence.reason);
>  		goto retry;
>  	}
>  	if (g2h_fence.fail) {
> -		drm_err(&xe->drm, "Send failed, action 0x%04x, error %d, hint %d",
> -			action[0], g2h_fence.error, g2h_fence.hint);
> +		xe_gt_err(gt, "H2G send failed, action 0x%04x, error %d, hint %u",
> +			  action[0], g2h_fence.error, g2h_fence.hint);
>  		ret = -EIO;
>  	}
>  
> @@ -966,7 +967,7 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
>  
>  static int parse_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
>  {
> -	struct xe_device *xe = ct_to_xe(ct);
> +	struct xe_gt *gt = ct_to_gt(ct);
>  	u32 *hxg = msg_to_hxg(msg);
>  	u32 origin, type;
>  	int ret;
> @@ -975,9 +976,8 @@ static int parse_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
>  
>  	origin = FIELD_GET(GUC_HXG_MSG_0_ORIGIN, hxg[0]);
>  	if (unlikely(origin != GUC_HXG_ORIGIN_GUC)) {
> -		drm_err(&xe->drm,
> -			"G2H channel broken on read, origin=%d, reset required\n",
> -			origin);
> +		xe_gt_err(gt, "G2H channel broken on read, origin=%u, reset required\n",
> +			  origin);
>  		ct->ctbs.g2h.info.broken = true;
>  
>  		return -EPROTO;
> @@ -994,9 +994,8 @@ static int parse_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
>  		ret = parse_g2h_response(ct, msg, len);
>  		break;
>  	default:
> -		drm_err(&xe->drm,
> -			"G2H channel broken on read, type=%d, reset required\n",
> -			type);
> +		xe_gt_err(gt, "G2H channel broken on read, type=%u, reset required\n",
> +			  type);
>  		ct->ctbs.g2h.info.broken = true;
>  
>  		ret = -EOPNOTSUPP;
> @@ -1007,7 +1006,6 @@ static int parse_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
>  
>  static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
>  {
> -	struct xe_device *xe = ct_to_xe(ct);
>  	struct xe_guc *guc = ct_to_guc(ct);
>  	struct xe_gt *gt = ct_to_gt(ct);
>  	u32 hxg_len = msg_len_to_hxg_len(len);
> @@ -1069,12 +1067,12 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
>  		ret = xe_gt_sriov_pf_control_process_guc2pf(gt, hxg, hxg_len);
>  		break;
>  	default:
> -		drm_err(&xe->drm, "unexpected action 0x%04x\n", action);
> +		xe_gt_err(gt, "unexpected G2H action 0x%04x\n", action);
>  	}
>  
>  	if (ret)
> -		drm_err(&xe->drm, "action 0x%04x failed processing, ret=%d\n",
> -			action, ret);
> +		xe_gt_err(gt, "G2H action 0x%04x failed (%pe)\n",
> +			  action, ERR_PTR(ret));
>  
>  	return 0;
>  }
> @@ -1082,6 +1080,7 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
>  static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>  {
>  	struct xe_device *xe = ct_to_xe(ct);
> +	struct xe_gt *gt = ct_to_gt(ct);
>  	struct guc_ctb *g2h = &ct->ctbs.g2h;
>  	u32 tail, head, len;
>  	s32 avail;
> @@ -1116,9 +1115,8 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>  			   sizeof(u32));
>  	len = FIELD_GET(GUC_CTB_MSG_0_NUM_DWORDS, msg[0]) + GUC_CTB_MSG_MIN_LEN;
>  	if (len > avail) {
> -		drm_err(&xe->drm,
> -			"G2H channel broken on read, avail=%d, len=%d, reset required\n",
> -			avail, len);
> +		xe_gt_err(gt, "G2H channel broken on read, avail=%d, len=%d, reset required\n",
> +			  avail, len);
>  		g2h->info.broken = true;
>  
>  		return -EPROTO;
> @@ -1171,7 +1169,7 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>  
>  static void g2h_fast_path(struct xe_guc_ct *ct, u32 *msg, u32 len)
>  {
> -	struct xe_device *xe = ct_to_xe(ct);
> +	struct xe_gt *gt = ct_to_gt(ct);
>  	struct xe_guc *guc = ct_to_guc(ct);
>  	u32 hxg_len = msg_len_to_hxg_len(len);
>  	u32 *hxg = msg_to_hxg(msg);
> @@ -1190,12 +1188,12 @@ static void g2h_fast_path(struct xe_guc_ct *ct, u32 *msg, u32 len)
>  							   adj_len);
>  		break;
>  	default:
> -		drm_warn(&xe->drm, "NOT_POSSIBLE");
> +		xe_gt_warn(gt, "NOT_POSSIBLE");
>  	}
>  
>  	if (ret)
> -		drm_err(&xe->drm, "action 0x%04x failed processing, ret=%d\n",
> -			action, ret);
> +		xe_gt_err(gt, "G2H action 0x%04x failed (%pe)\n",
> +			  action, ERR_PTR(ret));
>  }
>  
>  /**
> @@ -1256,6 +1254,7 @@ static int dequeue_one_g2h(struct xe_guc_ct *ct)
>  static void g2h_worker_func(struct work_struct *w)
>  {
>  	struct xe_guc_ct *ct = container_of(w, struct xe_guc_ct, g2h_worker);
> +	struct xe_gt *gt = ct_to_gt(ct);
>  	bool ongoing;
>  	int ret;
>  
> @@ -1292,8 +1291,7 @@ static void g2h_worker_func(struct work_struct *w)
>  		mutex_unlock(&ct->lock);
>  
>  		if (unlikely(ret == -EPROTO || ret == -EOPNOTSUPP)) {
> -			struct drm_device *drm = &ct_to_xe(ct)->drm;
> -			struct drm_printer p = drm_info_printer(drm->dev);
> +			struct drm_printer p = xe_gt_info_printer(gt);
>  
>  			xe_guc_ct_print(ct, &p, false);
>  			kick_reset(ct);
> -- 
> 2.43.0
> 
