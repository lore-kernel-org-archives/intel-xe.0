Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D48F9CC6B1A
	for <intel-xe@archiver.kernel.org>; Wed, 14 Oct 2026 18:09:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92C0E10EA81;
	Wed, 14 Oct 2026 18:09:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD1FF10EA90
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Oct 2026 18:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792001359; x=1823537359;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=IAOVxYplGaWCL/jMoWsnO2MtZ6QfGKnfUZddng2Quz4=;
 b=aChQGc/oYbdqc42syda43TVXjBV2eraYpdyiS0zOS5YiSkugJOj7Hjw5
 0EwYRiM4Shydg84101u3cSbapd1+RQ/ALVtdbPF1LYiHBbp7ndfhytQNk
 Li5SxzK1g3IO8oc1iZVeYRn4G7kwhMVfkZEUICTJNCwo1ogtL+7WEyhRc
 tlrtWaHNG3FnBIKftIgKYPRrfH/959ghJT1Gn7R2148X1l7QYdKgNqxnl
 r4Ao0mWE1eivbDtbuG5qu7xWCpSDI5fjaoIf88OPo8b3x/lpJ/DgEi4pu
 qyIkAwyfeWzNVMolAEPOOAPR3PuyUfoR0yDHigwroxgsFB37FsFzC/gvM w==;
X-CSE-ConnectionGUID: m4YBw4kXQ+iV+J7lvxpPJg==
X-CSE-MsgGUID: 9LJ8u/gFSZarXiKPwLgXng==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="762671"
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="762671"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 11:09:18 -0700
X-CSE-ConnectionGUID: l4mjLigaSF2ttpXsq8fRbg==
X-CSE-MsgGUID: 54czb1lgRHiqlDJa2G46BA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="3251615"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa013.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 11:09:18 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 11:09:17 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 14 Oct 2026 11:09:17 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.2) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 11:09:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LWgEh+aBj02NmLwVlJi5mv0VczX1HvkjpA4kLumOBSIqIRYdKJjU+jphfizT/EGzPxeIFqgUbV7b7mR/NskAD8pzqn9WiLlCgITc8Vq6d9bc4e4RXItU40hivJIk5pinvVJM5efN6NqfLCwgxhSPT4tSrrhN1pszuVbbUgTUnjGw0FqU2Rh74OtWPAf5h27y0YGlkyt5Ws610wbl2Zh8/vvZi1LooncWq2Rb01/QZOq5Ejk/Jieofel3al34i2/FCiwfxYufj2p0hsJhIyCi/0ZZPH38Hp8FsEqEK03qdEnU+ClKs7apGfEXcp2B2w7Wx6cJ42hFeLhrT8qf/FKhog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xF+pyf7+R2Tn1KWLdLBq+cJqAFX8whfbr7OZGVNv074=;
 b=absRZ0UAaYsccIQaj56CzWLHwCt34BtiDzd+MdHx2A0j4MIoGf9HU76fItAfGE7BDDS0P+u9J4Kt+3wPLZsZFIWGhxb0+B1MfCjpXLVkEJvdcIrUwlHvzkPzCrfb+HQoqhPSucbWXb6bewsTqoDxaJxZCUgGaoB2SRBQpMu6nGa97ajJzg3g9PnGYDIM4Ivw7UXSXAPRnw/XLZFm67lnY/KHMKjhu9lWVxR7yK9Ik6LvRmUMPobbrKBhiMDeyseBdBYZFNDMKEITxC2tRX2XqbtSn3KoJX+fxhSdqGmdMOJ4pygYf5npsUzqLRC4rorFIMGJ6r/kXLjKqlIOWhEr8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB7180.namprd11.prod.outlook.com (2603:10b6:610:148::5)
 by SJ5PPF3D06B1BFF.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::822) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Wed, 14 Oct
 2026 18:09:09 +0000
Received: from CH3PR11MB7180.namprd11.prod.outlook.com
 ([fe80::70dc:90b2:50b4:31a8]) by CH3PR11MB7180.namprd11.prod.outlook.com
 ([fe80::70dc:90b2:50b4:31a8%7]) with mapi id 15.21.0496.021; Wed, 14 Oct 2026
 18:09:09 +0000
Date: Wed, 14 Oct 2026 14:09:05 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <riana.tauro@intel.com>,
 <michal.wajdeczko@intel.com>, <lukasz.laguna@intel.com>,
 <matthew.d.roper@intel.com>, <matthew.brost@intel.com>,
 <mallesh.koujalagi@intel.com>
Subject: Re: [PATCH v6 1/7] drm/xe/gt: Use GT ordered workqueue for wedging
Message-ID: <as_FQco3uDMKqOup@intel.com>
References: <20261014055215.330408-1-raag.jadav@intel.com>
 <20261014055215.330408-2-raag.jadav@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261014055215.330408-2-raag.jadav@intel.com>
X-ClientProxiedBy: PH8PR02CA0002.namprd02.prod.outlook.com
 (2603:10b6:510:2d0::11) To CH3PR11MB7180.namprd11.prod.outlook.com
 (2603:10b6:610:148::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB7180:EE_|SJ5PPF3D06B1BFF:EE_
X-MS-Office365-Filtering-Correlation-Id: fe059f13-b6e5-4684-b035-08df2a1e3e28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|366016|376014|10067099003|261009223027099003|4143699003|11063799006|6133799003|18002099003|56012099006|22082099003;
X-Microsoft-Antispam-Message-Info: A6VpFe6tOHSbQP3V0C2a0+aMGlhc96mQZEmAMkT39bG8QbXcTptj+JoOWPzW6ANNrPb012Ofy7ly6wXrLMTTQn+9D5l2WcjmGisjbM8xAzsSYn82xUnTNkvPIdCxOYamEPZOf6ULUnKQ5ESMmkQKJyACCE8IQHQObuEOVArti6/XWlqrJyOAzUkXgZYbjQUAo8v5f5HlNXAkwr/2NdSjgn4MpYvIplqDUKna9fEuYGoC67+v7kdEzywg6kp1Au5BA1iNGG8c7S/LLgRTT0cFaR5X27jhoyGc3+Uqoi3E+Wfyks2AT8DUVLcN5l1PT7pLvZZtM0HpS+1r1ggD4bVdvRI8kqFB1MRHQHSj0dZSDYK5nuAnfBXM29JwzlM1oLTYlc98SFRu3BUJI1DE448VTG9uxMr0O/lqKZST4Tvqsg/JSf5ojcj7Um0TdSVh0zZiQv0eGe24wnl0SSkJQOm4/v8fHODSDzQNQQ6evYOwv77KZM1TN0wPs+EyA83p7/Vbs60soxGKihZGZjerTIzG8Y4eYpqDC4kh1/ZjEwscGQYKmu22f1MDJuwxBQ2wB1YaCaT7BGP50+ac8IGwc2iBKzhxIr5iyOpzf54k5cImJ8lLGzC5fn0iQC1Pgpz19mZy/jN1JON7mrzB362AYFHL/fRoOxbsRus8PaDsaRZwpYQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB7180.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(10067099003)(261009223027099003)(4143699003)(11063799006)(6133799003)(18002099003)(56012099006)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NBjMvLG2Gv/6cC9w+EnVVo4CKcFhKXqcXZNyipOwzoI0w7BwWWwr6ZQsOSnI?=
 =?us-ascii?Q?RTWP6/wHNW85ayEdvpjLMFKjlFZGU2JksHkqgbTiVA0B0ZyWRRM6H/7bm8Xr?=
 =?us-ascii?Q?2VUZbwtMDCakDi+7vSxtYjHLjBnDufmqVgGOM84GgpRW31wCIo4O7i+UP3y1?=
 =?us-ascii?Q?LWxH1twDVHUZLZWCFWA00/n7uJVFoqCF2cTxWsD3jxoaf5zQ1CawwgS9n/Wl?=
 =?us-ascii?Q?A1GXu2RViMglRqBNWR+Hgnz5JifmmetiELcr4MnO/RFIQ0RSXLlpUlZ9bU+y?=
 =?us-ascii?Q?5M8ZdyqyUTNw9+4jFih5baD/jBogzevX3cmc3TOJtrAp2s0uGF1M3W+7wDB3?=
 =?us-ascii?Q?T0RoxDzK7SNPiF59P+WcQbzgJh3fLAArJyRiSn2AhIgq1uCEjMaDUuBWkNq2?=
 =?us-ascii?Q?h9zoNZukd7jKobVf5Vgp1JHE53lRQItFalpyxRxUMLth7SiZMCabKnjAos24?=
 =?us-ascii?Q?b4jKmEw+jNGHnLHM7n2GIAvjLJuBmFdSZFUmqJ9J0JTtSEvlRZcUEqQJi/bO?=
 =?us-ascii?Q?RrYaFUl63uM5GVcHkf/UbVO7WNSejqkYIngSXANaOZdblfbaj0wNoEsLoJZB?=
 =?us-ascii?Q?+COjPUeWP1HZAGfgpuqkUQKAdYhtwXfUd4AWFpkspW31d7nak2u28akXLJf3?=
 =?us-ascii?Q?7SrbveLpaBlwsinebZwgxm13dxU+JWzpPda4nvs5r/u/+7M5A7pX2xwNuzdA?=
 =?us-ascii?Q?qeItfbxYoBcoFU4Sptq2IJrAEK4ixhjL0Hn0V85GSRq1Bs7dDlDivmc6zvjT?=
 =?us-ascii?Q?OKTzvhFGtwn4GqL9WX0+zqWh7Ej/zCI30CCaaGn64ul3U/GeGm1ms5RkOCzs?=
 =?us-ascii?Q?adpkYYEmlR/qJ2208WPFZYIyIqf3kWUcA9hjppLUBmaZmBsbWFl/znr3Ps+M?=
 =?us-ascii?Q?R6SDqOwrLTru0JdZRoMUedwzrebQcBUdlN83zbDs7apfnve43thMGNitEzXv?=
 =?us-ascii?Q?sb1Ip63q9NgJ0BxvMovmgyK7wX00R8c3F8hUCPFumtrMArDfhcmUzmFQmX9f?=
 =?us-ascii?Q?qccZD5PPzieU7OepAbWxgUSkWIps3nyl9hnlpe15Hi0Ivh4tzdyEiMTgTC8B?=
 =?us-ascii?Q?of4JtRKKwCg3iAOZoWeud531z72fuqaDjrz0lnugoi3nL5uXAvboScbvObOU?=
 =?us-ascii?Q?1luZ6DsqApJ8fEg1M0UQSYuBl+4QSAIW4PIMSFbDb+pkin87/OZIGsnHrFOX?=
 =?us-ascii?Q?CHEd7Nndx2iMVQSr0cIRnpKPJNmMD2vrN7cu4EJtN249470a9ncbBgEBefNJ?=
 =?us-ascii?Q?VvurDAuhZgFwWBWjYo/r4ULrG4wm2YtDyQ1mOwDa2EKc/+i6ZZ4u3XaLN3UR?=
 =?us-ascii?Q?B3tybmVEkTUoP8jIAcPnhSrR74VmfPQjAOx+ka9d0XI4db5yHDpDW3vKahBo?=
 =?us-ascii?Q?MLLQfiyy/Eu3JFMyA/YNeHNB2qLv6sfTwsWBCBZ5WYUavS3M+BVSE0XFHAYu?=
 =?us-ascii?Q?YpYYS0xEV/ANYmt/9mXgEXFfhCHD8VModr5RbWMta7MyX1aGwAfFzZCGmAII?=
 =?us-ascii?Q?lXrLlmHuL7DaWh6sa6WjJcfzo4A+l17o0XVBuZqdblMJPNAu7Zket7vySrCn?=
 =?us-ascii?Q?C1ZD4fAMdr24Qf+V7OSTakDcNVKd4Q0ckGUMEO9l4ku5SGjSGiMx4iVFZpco?=
 =?us-ascii?Q?76Ga76tspypcU921URMBFqi/N+yDorvhY7xNJ9vI73UoLE5v/pPZatt+hHwi?=
 =?us-ascii?Q?WX9n0tOFrke1mnZEov7jpqCaOGxX+OkWfrbwWzpDl4SFj16nKJDZMSCH9jjb?=
 =?us-ascii?Q?7hIHLnRXPg=3D=3D?=
X-Exchange-RoutingPolicyChecked: g0MBdy+VtnFU+otPOzMrI33DEo7mNz5zucDrWLuQ+GCwOVVMDJbKA1tf+/o1xpDMG07oROnMitss8sg2AiMzmYzBKhc8hmGJTyHsS+Ig25cdlLraq5FO3tHpEC1RGLupgat3ZLMSQGqb+Y++TOUBUpres3mTKxiGgfqt7FFSYYkgO2zUtybzQLwYlpVWto9WlHNcX3Z0HbFnXVGR29s4lWikozSSkhaarsiaxL1EjsV1gZy5H1o3JaH+aCCxTp0+EtX0+Oq06TPul7g6jmVfPB4upVRm8mkmYH3QEvRquFThHmP51kklZLg/II0X91iGHvovX6NkKHK9zNBrwSMtSA==
X-MS-Exchange-CrossTenant-Network-Message-Id: fe059f13-b6e5-4684-b035-08df2a1e3e28
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB7180.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 18:09:09.3515 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /F05DDz8dnmsMBCW8E8TSn9V1a8kZ0ukTy1RJ4vFSLJL50/KzK7hE4PjT7SEHfxaA8oT2H6aHI3YAh7YvASlPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF3D06B1BFF
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

On Wed, Oct 14, 2026 at 11:21:18AM +0530, Raag Jadav wrote:
> Currently, xe_gt_declare_wedged() stops GuC CT and initiates exec queue
> teardown synchronously. This can result in tdr timeout in cases where
> the device is declared wedged while jobs are still in-flight.
> 
> Introduce a worker for GT specific wedge handling and queue the teardown
> on GT ordered workqueue, so we don't disrupt the scheduler while jobs
> are still in-flight.
> 
> While at it, introduce for_each_initialized_gt() macro and use it for
> wedging GT. This helps avoid races in case the device is declared wedged
> in probe sequence before GT is initialized.
> 
> Fixes: c9474b726b93 ("drm/xe: Wedge the entire device")
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> ---
> v2: Split fixes into separate patches (Rodrigo, Michal)
> v4: Introduce for_each_initialized_gt() (Michal)
> v5: Flush GT wedge worker to avoid races (Sashiko)
> v6: Move wedge worker initialization to xe_gt_init_early() (Rodrigo)
>     Don't flush GT wedge worker to avoid deadlock (Sashiko)
> ---
>  drivers/gpu/drm/xe/xe_device.c   |  2 +-
>  drivers/gpu/drm/xe/xe_device.h   |  4 ++++
>  drivers/gpu/drm/xe/xe_gt.c       | 17 +++++++++++++++--
>  drivers/gpu/drm/xe/xe_gt_types.h |  9 +++++++++
>  4 files changed, 29 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 8392c9fad3c4..22ae10958d7f 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -1432,7 +1432,7 @@ void xe_device_declare_wedged(struct xe_device *xe)
>  			    WEDGED_URL, XE_BUG_URL);
>  	}
>  
> -	for_each_gt(gt, xe, id)
> +	for_each_initialized_gt(gt, xe, id)
>  		xe_gt_declare_wedged(gt);
>  
>  	if (xe_device_wedged(xe)) {
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index 83d6dafab53c..80bda9b548d5 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -139,6 +139,10 @@ static inline bool xe_device_uc_enabled(struct xe_device *xe)
>  	for_each_gt((gt__), (tile__)->xe, (id__)) \
>  		for_each_if((gt__)->tile == (tile__))
>  
> +#define for_each_initialized_gt(gt__, xe__, id__) \
> +	for_each_gt((gt__), (xe__), (id__)) \
> +		for_each_if(READ_ONCE((gt__)->initialized))
> +
>  static inline struct xe_force_wake *gt_to_fw(struct xe_gt *gt)
>  {
>  	return &gt->pm.fw;
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 775c826b68b4..d8bf538ceaff 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -175,6 +175,7 @@ static void xe_gt_enable_comp_1wcoh(struct xe_gt *gt)
>  }
>  
>  static void gt_reset_worker(struct work_struct *w);
> +static void gt_wedge_worker(struct work_struct *w);
>  
>  static int emit_job_sync(struct xe_exec_queue *q, struct xe_bb *bb,
>  			 long timeout_jiffies, bool force_reset)
> @@ -546,6 +547,7 @@ int xe_gt_init_early(struct xe_gt *gt)
>  	xe_gt_mcr_init_early(gt);
>  	xe_pat_init(gt);
>  
> +	INIT_WORK(&gt->wedge.worker, gt_wedge_worker);
>  	return 0;
>  }
>  
> @@ -706,6 +708,8 @@ static void xe_gt_fini(void *arg)
>  	struct xe_gt *gt = arg;
>  	int i;
>  
> +	disable_work_sync(&gt->wedge.worker);
> +
>  	if (disable_work_sync(&gt->reset.worker))
>  		/*
>  		 * If gt_reset_worker was halted from executing, take care of
> @@ -769,6 +773,8 @@ int xe_gt_init(struct xe_gt *gt)
>  			return err;
>  	}
>  
> +	/* Must be last */
> +	WRITE_ONCE(gt->initialized, true);
>  	return 0;
>  }
>  
> @@ -1189,6 +1195,14 @@ struct xe_hw_engine *xe_gt_any_hw_engine(struct xe_gt *gt)
>  	return NULL;
>  }
>  
> +static void gt_wedge_worker(struct work_struct *w)
> +{
> +	struct xe_gt *gt = container_of(w, typeof(*gt), wedge.worker);

and about the runtime_pm, here we should be taking the runtime_pm:
guard(xe_pm_runtime)(gt_to_xe(gt))

> +
> +	xe_uc_declare_wedged(&gt->uc);
> +	xe_tlb_inval_reset(&gt->tlb_inval);
> +}
> +
>  /**
>   * xe_gt_declare_wedged() - Declare GT wedged
>   * @gt: the GT object
> @@ -1200,6 +1214,5 @@ void xe_gt_declare_wedged(struct xe_gt *gt)
>  {
>  	xe_gt_assert(gt, gt_to_xe(gt)->wedged.mode);
>  
> -	xe_uc_declare_wedged(&gt->uc);
> -	xe_tlb_inval_reset(&gt->tlb_inval);
> +	queue_work(gt->ordered_wq, &gt->wedge.worker);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index 628911346455..c00a7c171f80 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -233,6 +233,12 @@ struct xe_gt {
>  		struct work_struct worker;
>  	} reset;
>  
> +	/** @wedge: state for GT wedge */
> +	struct {
> +		/** @wedge.worker: worker for GT wedge to be done async */
> +		struct work_struct worker;
> +	} wedge;
> +
>  	/** @tlb_inval: TLB invalidation state */
>  	struct xe_tlb_inval tlb_inval;
>  
> @@ -419,6 +425,9 @@ struct xe_gt {
>  
>  	/** @eu_stall: EU stall counters subsystem per gt info */
>  	struct xe_eu_stall_gt *eu_stall;
> +
> +	/** @initialized: GT is initialized */
> +	bool initialized;
>  };
>  
>  #endif
> -- 
> 2.43.0
> 
