Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4B9BC47077
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jan 2024 16:44:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FCEC10E930;
	Thu, 11 Jan 2024 16:44:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B081910E930
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jan 2024 16:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704991469; x=1736527469;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=L7qQFadX0WO5ZsGbbjRqj3ogwe8t9596MOrLsZA4GQk=;
 b=bOeA2b0hwCKuqHhFza9LRfVUcbf41CWvoR+uPrfv7zIzuGrwf9dMZoWE
 +3tOBT9V9T1ZAAxZSMR4Ggzl0sViaxNe/GKJAkU6ifKg1q5NKbVMvKMMA
 vnhtuurvQSYx3I0Q7WHs3+TSjtthCTABINOqTToGVpLfm0NSTse+SnNOO
 OS+S/BsMOwCgMJcAjE+PPX+sawSdIKpv7cSlqYOhi2pYKX5ZNXNCmVzeT
 fSAhkv8E1FnhEqP+zhGyw+gg9IOUrQyuztqVP2lDgHgwUTzHg+diDdoej
 ZzamIc9SZBUEdSKEa6f4uxb5zLSexd0RsXp7H1/0V8hP38tVyiURPattt g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="397784899"
X-IronPort-AV: E=Sophos;i="6.04,186,1695711600"; d="scan'208";a="397784899"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2024 08:44:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,186,1695711600"; d="scan'208";a="17097821"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Jan 2024 08:44:29 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 11 Jan 2024 08:44:28 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 11 Jan 2024 08:44:28 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 11 Jan 2024 08:44:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QyKKdzgUs3Qdn6ZsdP61zMyqgkZLCAHcVpb+4WYc9ud4VHJNqdp68q6obOeWJV79qzzZuhW2RH7FntrQ2FwVju7jVVP5rgtwGEdmzZT4lKFJgHxklxZFG6dxYBlwDiV2/TSZGAOxwIgbC+mpQPyt6vMBbTxMKtFjJP5mFBhUYuktbdyKPqD5k+f5fZWzHXHcQGmz4vFLo+tqHbGcqZ5/DpBlgUa7SbLGJSMJIsI0k9XGGAEKvPt9Bit54ph2PsOaMi2TfnJtEKAYVkwSI3mdl1r11kYomrzvuXdUQBri1FntpjzFH9cNvQf75N941eBPf1oFeHh8ScH7kL6+rkXNBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m9r+aCAVYQDdpiIIOP/y+O56zL9QWWQyq54/6KlliBE=;
 b=ZkKi/CR6SqHFZPNUoYr7oV+9wn7mx8ZRx4JlAv3TT8YKmc2rcWmppwtJf6Uc0x10SEECJYN8B3OexrhZ3zJ6bVkhHFIMpG+mVdk2d8vK2stho7PbFHJxNjxNdoELr0u3v6VyQnR48OKxAG1uKBnIBsqXQXnr1U4Y7EdSAWNfrNY3rvJjKlXmOPtdN4in37vdPzlVSX8DMfGNb9kPe0hmCvGgamvvCiH24XPVrsV2w6ME5yzz94NQuiEvD3r+JwSq4cZeasjkout842CDAYldnqzuIF4OlwTglZzNRvCMr+VqGrjpwfYTwZyZNhRg4zLZL7Kow/DWOAatmvq4DJHV2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM3PR11MB8672.namprd11.prod.outlook.com (2603:10b6:0:44::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Thu, 11 Jan
 2024 16:44:26 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7181.019; Thu, 11 Jan 2024
 16:44:26 +0000
Date: Thu, 11 Jan 2024 16:43:09 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH] drm/xe: Split GuC communication initialization
Message-ID: <ZaAanbaUDat36k36@DUT025-TGLU.fm.intel.com>
References: <20240111162051.585-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240111162051.585-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR05CA0185.namprd05.prod.outlook.com
 (2603:10b6:a03:330::10) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM3PR11MB8672:EE_
X-MS-Office365-Filtering-Correlation-Id: ce80cd07-f008-43d5-dfd1-08dc12c492a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0VkT+JwXD3FGH4Xb0aDXfizgkd4yaleDBzXoSJuNlE+RI/nFR1BX6ENJaqhAF5QCPmQvruajb3kLVMaaq8gfR/9ETx1JAqVvtMO6To5HgsZ4aYoBVRAq+hw3lNoBvKWvxpSaxKTXsIu5DPR+IXkJf3VPKHS3qb+hJ6B8r56yd0aj2N+0PKEtSoEwObANq7KMCVpxSk8D9AtfNP4zQTqnHNf4q2GiQU8M97vRKL0OwRK1xaTEu+pcny4XCRKkgbz96iZhsC5vsE/btZEpH9Mkncmu4T+9nHwLEHTuuSVyqBlARdjtfq6styqAYXyhIHXe7LhWWubyzc/q3XDebVdWmVrTHZvVosobNLmwtymZGRDgs1TaQpzhIGsILGLm2IUMdd5ZiBddekOgMbfcC0Dx/JHYKHenaz2MXJnGn8X8y6YCeLjpm3FmLVkT76i0zQ0sGM1FfheV7x0/WHxKy1O0Ub0/P6Il/RepKZ3pJ584Wc2po59pLaWEWrcRfhimWpxxdkWio6eChkq9V21D5HULl1iLzLyrL8zxDK/dy1d/OH2xhFV7ULiJaXnE1NE1dcdI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(136003)(39850400004)(396003)(366004)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(2906002)(5660300002)(4326008)(41300700001)(316002)(6636002)(66556008)(8936002)(66476007)(66946007)(6862004)(82960400001)(6486002)(86362001)(6506007)(6666004)(478600001)(6512007)(26005)(83380400001)(44832011)(38100700002)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WBGjjwvz76QSdDS9TDgPv23G2vJ3Vcjzoq1IgTuP9tJHcF9KWJFOEIWsyHDn?=
 =?us-ascii?Q?RrWKoO2F0foutZ3yl8O7JrBeUoH6T/Z5kn2QCKQTnnCWvn9hfIapw9ipzzBW?=
 =?us-ascii?Q?t7LM/zWnH4O1cjUUJFilwZUHDNzvk/FkL5aYy3s1VKFfLU5Ih4V7n8piYX/u?=
 =?us-ascii?Q?ySF6KBZ5UpKgcqEO7CAWVd2ctLwRJwoepDtsASXJ0+lH33iDlPmS5iV1DzeX?=
 =?us-ascii?Q?nBZrStJEUKrFZbjWofxoED8fOqq+Uljzz8H1dGAxGKzIk+Nbe6UaM8QcFY41?=
 =?us-ascii?Q?GwqvtG4SfjJkMrO09ib3xDjToScGIs07VmcI+/l+10AijpSAjdrqBE2dhHk3?=
 =?us-ascii?Q?0NxJxxMeHYxVY8V9b6oqpAZYazVpgDXDlmz5OioZZTPweBdfatmmpMAoMEFV?=
 =?us-ascii?Q?WE6jaLt67yip8BROqEMyJmdVkJGLGt8q5s32bBxMMyKYYNJNfGcL8YUAKbuT?=
 =?us-ascii?Q?HZYEHjH9zUBVRzRKajSEQak5x7eFGzEYAsunkXJZZUKkrx+ZlvSb1pHOZ9oD?=
 =?us-ascii?Q?7CmWxDB4F8DFA/E3iNZ80KDY9096nlrx8J0NrMQo3Pp+7xwiMk+7+lH/TKBt?=
 =?us-ascii?Q?ys6FntgWFMxy3p4EfUb/wHRXTIAkRhka209AFKo5p+qLwZY4yLm4Xbsw4LVs?=
 =?us-ascii?Q?1EVwLg1//NFPzF48Tc2DgsmGDY7UztFFNxOMvOCI7bPmSQ527xJUVKkZa8IF?=
 =?us-ascii?Q?McZ2x3ZB3uFrTOmrQOsOZNLQ69s64+FsbH60AzS3n8SdLSh5B2NfJ3Nb3K83?=
 =?us-ascii?Q?GXaqH6C4rWqEcyd02mETM7i1zn8B6Tk2zioOrzS/XljQgDnmqzCp/G2rMxvo?=
 =?us-ascii?Q?V7aZfzsANqaXx11QDJ76D1+DkUvyUuJ4pq/i/Yjo35jHVnQ08KnVY2qNawlV?=
 =?us-ascii?Q?BiBvt7JCCZ0VkA6C9ZrVvy/lT9VuMmvLjTum7WNamih6IIuFulvQUrll7WB7?=
 =?us-ascii?Q?KwuklcKWWfQ7rBP6hYgvyoxwFula95D7H/Dgw34BEDPA8n9e1GuwMhECoazy?=
 =?us-ascii?Q?GnlQhbT4KPXZoJMNWA3n6DQAbhaoQIlQKzEL8dyMSWZ46rWAeY6IkNvgyglt?=
 =?us-ascii?Q?aFysUPEebX4gjNwZO8FkY+3yvIwlQzWYeTOcTfBgIWFe2qr1XqPOkbV2OkYQ?=
 =?us-ascii?Q?wyLDzRMhTuu+EGzFQgIGwreII+6wnWEZd56TJOpwhMYxo0JT8aMnb07I7DGT?=
 =?us-ascii?Q?5XJE4HCHu58vb4bnhCUH5hOpE3DCpKiSMe4ycVjW7j4ou813ooJfVNbNsvy7?=
 =?us-ascii?Q?HWYz7W1BUarv9QZ1k2ayoEW5LjYtOwAd2RmvQadIjnBUx6B9T0HRH1hP4Fai?=
 =?us-ascii?Q?nIyYHuSHeArFPnc5i9rOpdGTfFTeTB26YIGIeyDAgq3eYBtieJqsI8hfOHu9?=
 =?us-ascii?Q?NEPiI2l9GgW366GVP7rrepX9SL0wCciUMxQxhc3F/FXRz1L3hCl/0wVddK1+?=
 =?us-ascii?Q?ErAmoipQDSFRAos3QhV0TlgaobYz3Nh5ttJvN40/gyz6EoV9MO+8wCO68rxn?=
 =?us-ascii?Q?k4c68Jio6u0muQFZOAhe5wFixlmXZMrryfCF8piZ30Nob02rrq5e3y7xlZ+4?=
 =?us-ascii?Q?SaPg7ZTIIBvE0J5c8GLNmtO4p2KWTsdI1GgNW2adyNP654VFQtF5Kl8oYspy?=
 =?us-ascii?Q?5w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ce80cd07-f008-43d5-dfd1-08dc12c492a4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2024 16:44:26.4076 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cuT1jlIRds9hs8vGMFEvMIjEJ0jzp/iCB+IIPi9JJJHp/MUjya+XXU3Fx248gbUgIAdfSYIVE7B4/4NsNnkLKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8672
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Jan 11, 2024 at 05:20:51PM +0100, Michal Wajdeczko wrote:
> Soon we will be trying to communicate with the GuC firmware very
> early during VF driver probe, before we finish normal init steps.
> Split GuC communication initialization code so the GuC MMIO based
> communication xe_guc_mmio_send() functions will work where needed.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc.c | 21 +++++++++++++++++----
>  drivers/gpu/drm/xe/xe_guc.h |  1 +
>  2 files changed, 18 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 6e73ebf67251..0fd9b5efe4c2 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -243,6 +243,22 @@ static void guc_fini(struct drm_device *drm, void *arg)
>  	xe_force_wake_put(gt_to_fw(guc_to_gt(guc)), XE_FORCEWAKE_ALL);
>  }
>  
> +/**
> + * xe_guc_comm_init_early - early initialization of GuC communication
> + * @guc: the &xe_guc to initialize
> + *
> + * Must be called prior to first MMIO communication with GuC firmware.
> + */
> +void xe_guc_comm_init_early(struct xe_guc *guc)
> +{
> +	struct xe_gt *gt = guc_to_gt(guc);
> +
> +	if (xe_gt_is_media_type(gt))
> +		guc->notify_reg = MED_GUC_HOST_INTERRUPT;
> +	else
> +		guc->notify_reg = GUC_HOST_INTERRUPT;
> +}
> +
>  int xe_guc_init(struct xe_guc *guc)
>  {
>  	struct xe_device *xe = guc_to_xe(guc);
> @@ -283,10 +299,7 @@ int xe_guc_init(struct xe_guc *guc)
>  
>  	guc_init_params(guc);
>  
> -	if (xe_gt_is_media_type(gt))
> -		guc->notify_reg = MED_GUC_HOST_INTERRUPT;
> -	else
> -		guc->notify_reg = GUC_HOST_INTERRUPT;
> +	xe_guc_comm_init_early(guc);
>  
>  	xe_uc_fw_change_status(&guc->fw, XE_UC_FIRMWARE_LOADABLE);
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
> index d3e49e7fd7c3..94f2dc5f6f90 100644
> --- a/drivers/gpu/drm/xe/xe_guc.h
> +++ b/drivers/gpu/drm/xe/xe_guc.h
> @@ -13,6 +13,7 @@
>  
>  struct drm_printer;
>  
> +void xe_guc_comm_init_early(struct xe_guc *guc);
>  int xe_guc_init(struct xe_guc *guc);
>  int xe_guc_init_post_hwconfig(struct xe_guc *guc);
>  int xe_guc_post_load_init(struct xe_guc *guc);
> 
> base-commit: 79184e72263e91528195db01783148435c7e4fad
> -- 
> 2.25.1
> 
