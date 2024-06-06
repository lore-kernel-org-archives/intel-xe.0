Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06928C27C54
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jun 2024 16:11:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE97710E9FA;
	Thu,  6 Jun 2024 16:11:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m/QeQZLs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7670C10E9FA
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Jun 2024 16:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717690275; x=1749226275;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=MRUo4fr4z9gTj6VEiKWhBaSEigXu/v6MzY8XGVkir2U=;
 b=m/QeQZLs9QrWptp092IDbwUfTrEX6LfhuT/T+kexcxs+b+o/tZYtmLch
 DqNSfWQeIa+GZwGywq/jD7rV29YhEC4W7A11ChpqYEHflvg1zLfIJ5LzW
 nrVaip3a2LW28CYYy6uB3SOpzaSrxqZThLOHAExARiA692I1wkgQKCsRo
 d45htgXzAoQ2t8MSRUjl22SqYPv3C6tpOthsQTS/8NTgH8vQtz8QLvfV3
 eKWj31zaVGdyvxg0Lz7gnIfn5ax3lNE5Z9ohcHwOvnIylZ21XvJT6eUJl
 ei2O2ViJFypx+D+xCbsmXBEwLmph2tWnL3zMGdXH1uh7hqotOQ/gPQZdv g==;
X-CSE-ConnectionGUID: Z1xXADLkT0moL3aNgCoctQ==
X-CSE-MsgGUID: 7td6YiLHS0yboBRYnRP1Vw==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="14493109"
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; d="scan'208";a="14493109"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2024 09:11:15 -0700
X-CSE-ConnectionGUID: VR7MvNvGRlC0JqDML9Pa4g==
X-CSE-MsgGUID: i641wMoVSE2ofvPH5Wa2KA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; d="scan'208";a="42944646"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Jun 2024 09:11:14 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 6 Jun 2024 09:11:13 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 6 Jun 2024 09:11:13 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.47) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 6 Jun 2024 09:11:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ek18s0+AxGxIw7FIvUSs/XYhOv7eJn5TVBuMcg1DmTCeLAPvC3IQ0ochshL6EqJ6teVi0BkHSfteybEdphpw7uEggg7vV1zsuyDI0mC5DqKcwXPx6v6clRSTxxnW7jSJHM8VMq3fGAWT7iHGzPFJ71rhyqdiLUZEQDMbpX7TPEg/2OU2bQrJlpWsdgPtk+VPgNSQWW66vFmh4wq/o4Gv21jX3AX1LGzLzcB9g2WFtOnyrXSaTRBSjaxHfA3p/lbZaZpmv4P2lfOlvpiW1+6B5rzdLf5kAu9gXVHu8MMBR1OQXLE0PPonLlniy27ePa/vd18tjwuP++3Wd/P5l/h0mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ApHKamPuc/6FRujHM3UoNAkz6s0icffW4mk+xjf5lEE=;
 b=LE7HRliYn8Vyp2907ElmAUwYSOTgaiw0Z4G87ADK8PNK+qManQvEdrZZTsZ0gyl3jcSl+BpWcML6y3fXaFqYGbimZYdIL2RK8JRLoHrKi6j1gXdRzeiELfhuUwXuWWlvYefQaIzfIkufys2GJxaPpsnm1NzGUuP6UpaFeaHLMmcSZQNXkZOLWgC+ZDXKVRyMCoCJYr0QhORTU+VHePFRCKkbwkrTaTqQwLkyXxwpOsjRtnaMJn/rXgIuPyGKCXp3lFRSV+qMQjG6EYuV5C468ZIXEjPYr1/n+i7S0b8Zg6iFXBHq8vBDK3g615iXSQnDW8YREdQWlC958kX1YATQMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6527.namprd11.prod.outlook.com (2603:10b6:8:8e::19) by
 PH8PR11MB6998.namprd11.prod.outlook.com (2603:10b6:510:222::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.27; Thu, 6 Jun
 2024 16:11:10 +0000
Received: from DM4PR11MB6527.namprd11.prod.outlook.com
 ([fe80::5a48:57be:974b:8ee0]) by DM4PR11MB6527.namprd11.prod.outlook.com
 ([fe80::5a48:57be:974b:8ee0%4]) with mapi id 15.20.7633.021; Thu, 6 Jun 2024
 16:11:10 +0000
Date: Thu, 6 Jun 2024 16:10:17 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 1/2] drm/xe/guc: Split g2h worker function
Message-ID: <ZmHfaRIwhs1L3dXr@DUT025-TGLU.fm.intel.com>
References: <20240606130639.1504-1-michal.wajdeczko@intel.com>
 <20240606130639.1504-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240606130639.1504-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BYAPR02CA0060.namprd02.prod.outlook.com
 (2603:10b6:a03:54::37) To DM4PR11MB6527.namprd11.prod.outlook.com
 (2603:10b6:8:8e::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6527:EE_|PH8PR11MB6998:EE_
X-MS-Office365-Filtering-Correlation-Id: 05ed5cf9-5520-4984-845a-08dc864347de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WuqYHfQsEOLTcP3Eb098FNDJpfJ4994duoMJM7qMjSgAT5oa8eDCwIx0cU7f?=
 =?us-ascii?Q?kk5o+gG9lNHNhFnGqyIRXpp/Jwvu1cx6/xMPTpKpopHd1nomwjX5K9xgEqXk?=
 =?us-ascii?Q?SUlcUfq7C35YpH2VuJ5ixkXMdAm3iCteNEvCD52nkJHGZLCfz+L4ltrfaSJf?=
 =?us-ascii?Q?iDYmiZhbcYrbtkJ/MblwOYkfAUG2apiaLKPhmCGhLiUXIAOT5TjK1qH2Esny?=
 =?us-ascii?Q?Qnn+kQiA14EuRwDHtQ7TqfDkiCKf0AsZthW4J6HOg4qGM8jtQxtuBa+o94+c?=
 =?us-ascii?Q?G6vBdsoTSU062GisjqylGilJ1PJIRtagmhzpBhE96vhh2LWaWxA2bR1vGpNQ?=
 =?us-ascii?Q?lqmO4COydl/oiNB0JYzOjhGCmHc7qEoc+FA1z0YK9vzAThsrbAzeY+aPzq4H?=
 =?us-ascii?Q?l9hdBhDejcc7vQNfuOct4BFpuCVn73VoFQrO9UeX0ohUdAFhAeKG44PhuR+X?=
 =?us-ascii?Q?bfNn7ANRV3KoWuX6087C5yoNgWiVeK8nCNjOaGDG7RVQw1lcFZ9R4MnGzjVm?=
 =?us-ascii?Q?E6BKtWWG/2myqxhfqcqydqe3/LdOb/nHKnQrXFC9RtiYm3lXsOBc2n/p8R6u?=
 =?us-ascii?Q?JfepDkR4dAw04yBDj7ARqPiwO1j0FORnctE18OVmbkpBgrdFt8MhAd/eoSNZ?=
 =?us-ascii?Q?LCYryYeHnXelXlA8frMcI5+D/tdnRx99qCsrziYQmucDTt66WQ/GgBYiMCnR?=
 =?us-ascii?Q?iolF5t7OCHG0nWRAK6oYO9uHROIoo+btwlKSLAklO2rs1Ryr2AUa7NptzjHK?=
 =?us-ascii?Q?aTsjw2sfUoayucna+Wfno2umnW5A6Pe+4FGcnLbAry1yfHSrVWzEpwTphMJe?=
 =?us-ascii?Q?jDQqKjMDEmMgToIKLsrYj008L2VFqq2klYjwu6XpxELXpGIsPZOre1+gAMKq?=
 =?us-ascii?Q?Qp/wfuMJnSfGGApYlirXURzGouXJYtuLrgPd7djx4muqBcxCC+Xcm67zHX+4?=
 =?us-ascii?Q?Lqkzi2bdELEb+0BCYh2hTq8D7DSzR2sEf17uInCxgp9kb96A5ROZaNU2o/rR?=
 =?us-ascii?Q?rSqamcEgJecXLTZ/T70k1FF/i8GYYeQNndoVWmis4sAPBEsTkHKQb+ixlSfe?=
 =?us-ascii?Q?vJ8KF4Qh1b0D1W3HA1VIyZcd294GDQ17HZQO5i7ZM1ljR2uOzkqHa5wlQDQB?=
 =?us-ascii?Q?apFDEIiq6EnkqwgYSO8Z2IKWnnrExIgu4MUGOJw9rtVcwJ/I9g9DMDTPEp92?=
 =?us-ascii?Q?d7LgkDTYBdTqN7+RFvrJEMq2hCMluLUdMOD2LyTxwpP0S3aXKIkRPmLfnrpT?=
 =?us-ascii?Q?iWs4Q5Wk+7HTO0FaQ9u0w6wTb6oNSAyJh9IfPLmVSbpmZjbJksQHwOCPztyd?=
 =?us-ascii?Q?uCMdVr/e2pTB8DTzrdM80Td7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6527.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XUjKfG2nCjogMKrE4PjycRX4pUIZPUK0M8ArBrXdWcTcNfOoPqW5hCgytk6Y?=
 =?us-ascii?Q?nsct5BEG5LamxTOF+/EeoRr51OymRdDsR59usQt78HtzVu7EXMJ87mSgqpyy?=
 =?us-ascii?Q?HDTUZLNNdYLCYBxB5JdJ6zXm64wp8OfFvKcGzuwdePj6CRMTQ3rE0RMKGnqu?=
 =?us-ascii?Q?JEW6ibAaJRBZ2iiXPksq8nrdjfVcTmyPRaW6iotar6hQw0oq3Fr2EowkUcd8?=
 =?us-ascii?Q?WmbaE2YPxePrN5luEYAl5PdKkXN/AKgTassljkZue3R6O800Ioase5CnLJar?=
 =?us-ascii?Q?W5HAieBQInKpZzHeHA+GepWiKGCgq06++DGZFD867E8+xCtyqphuxPSjgZhb?=
 =?us-ascii?Q?vUr9GHYh3tWfIvPJNnNVNT8HISn/6NvMS/K6hzFuQV78by08/EoNM5VySLeU?=
 =?us-ascii?Q?zWSPoBCrWuDIMuXXVQjGok8+0DjpKrFsnDhFH9/4wBbYuYiPXYuzLYr4zfL2?=
 =?us-ascii?Q?pO5Js0+3WR2onayWGy2bqnjIWnwY/A4QrlGQGKAUjDc7KPpry/0BVgvo5NDT?=
 =?us-ascii?Q?9htvVGyy7AD92qwTfSbzdKbhSq07xzv3ic0dTaoURIyoPjJMccPF2e/0JpzY?=
 =?us-ascii?Q?6GERsHU4O49A9pTn2Vauko9Fqf8Hx0RWg+FacZ5aIj6IX4aMWxDJAt24RIzW?=
 =?us-ascii?Q?YVFt1uaHX6bBJMw0DGuZW1Lq3k++a5Smg7s0zk4Umt/Z9aGIUQhvqO+uQqGD?=
 =?us-ascii?Q?r7tIZDUa7twRm/z35CCWZ/YszY+D1SmK2pqnhfhfbnBN0IbMzqH3rse879YT?=
 =?us-ascii?Q?ZaoG36Yu2V+qJRDDgIj9SwQ/h7wbpYJw5n//eYEmYn1xl0ASOcyTxr763K8e?=
 =?us-ascii?Q?qiAUByKXgmtb0PaWQZtIAlr7AB6eNCPk4x3YLk79rKgBD3YHzoeqm6cnAlfl?=
 =?us-ascii?Q?KqzACQme+IBwzw1GGyeCx9pc6lRTVhSOhMVduGTgT8T/nlyFTzQSCWYwiWDN?=
 =?us-ascii?Q?QxieuuCkBukDRIod/cR7d5A2wILZRRCpT0Bu+thpaSE5VBG3jAe1hkTBfOp2?=
 =?us-ascii?Q?XMDzNAPOg5vbsRUV4D5rbHUbtbO8YbmDHSlfrZ3cnTPbuqkn16yCTIFPv6iK?=
 =?us-ascii?Q?2WPX4ButZat4ahLMBdOzqBEWHgvxhDkY2S1N0e28XPNBY6je6iBdDGkCk4HL?=
 =?us-ascii?Q?pgdVlkhwDyOWPUrp1cRMt64anGProgR3DsFtbD1NTtWhYhOVP7EackNDbRjI?=
 =?us-ascii?Q?HUw6jDYwncoDzqtn9qVO9nBWhpZWTxX1rts6ggx2FsPzl8bB5d81HLhIybdl?=
 =?us-ascii?Q?VFIa+k85jfVl2ltgjlue8Yo+P37oGPkw2lE6XL1FaSiZVEUkroxJRWB1ExHo?=
 =?us-ascii?Q?tyT6jFvZvcUup4uZvL4uzCodu4LwTH3AoEOz6oCphPsUisAjPKRYVGyCCgiq?=
 =?us-ascii?Q?oFvpdmeSpLEh6eiVBt3MRYNAC9TWZoo6eeXVgN3HJRA52VF2yq8UoCgjHJMa?=
 =?us-ascii?Q?BturGDVSpN0xX4nlk3KZMPPOSYi646/yYRImRp/e7V8uyLOEPsKtYJFuWQyf?=
 =?us-ascii?Q?iUh6jTms0/Av8nQhoByVHqkmaiVTfIde4YKR6gk5bgkHUU6TxS/tmuVh9FtL?=
 =?us-ascii?Q?+9GZ5bOzhkn7H6BNOsmXeqRK7Bw9mX1ya3l8z370Waoa7AU1dPgIT218MCs0?=
 =?us-ascii?Q?Jw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 05ed5cf9-5520-4984-845a-08dc864347de
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6527.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2024 16:11:10.7954 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wCknZRqk2GgWL5xudfIs3oc+do531N27ewnPkrQsmFkxDFMQeVf9paSLGo2c2dxL+VAt7/AcDJiBiHC4ZHictw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6998
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

On Thu, Jun 06, 2024 at 03:06:38PM +0200, Michal Wajdeczko wrote:
> In the next patch we will want to perform the same steps that
> g2h worker function is doing but from the different worker.
> 
> Suggested-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_ct.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index c1f258348f5c..08cf355e2e56 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -1260,9 +1260,8 @@ static int dequeue_one_g2h(struct xe_guc_ct *ct)
>  	return 1;
>  }
>  
> -static void g2h_worker_func(struct work_struct *w)
> +static void receive_g2h(struct xe_guc_ct *ct)
>  {
> -	struct xe_guc_ct *ct = container_of(w, struct xe_guc_ct, g2h_worker);
>  	struct xe_gt *gt = ct_to_gt(ct);
>  	bool ongoing;
>  	int ret;
> @@ -1311,6 +1310,13 @@ static void g2h_worker_func(struct work_struct *w)
>  		xe_pm_runtime_put(ct_to_xe(ct));
>  }
>  
> +static void g2h_worker_func(struct work_struct *w)
> +{
> +	struct xe_guc_ct *ct = container_of(w, struct xe_guc_ct, g2h_worker);
> +
> +	receive_g2h(ct);
> +}
> +
>  static void guc_ctb_snapshot_capture(struct xe_device *xe, struct guc_ctb *ctb,
>  				     struct guc_ctb_snapshot *snapshot,
>  				     bool atomic)
> -- 
> 2.43.0
> 
