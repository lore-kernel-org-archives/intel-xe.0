Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC8EAE6BF0A
	for <intel-xe@archiver.kernel.org>; Fri, 30 Jan 2026 18:50:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A8C710EA56;
	Fri, 30 Jan 2026 18:50:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bvBWWGAX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73AE310EA55
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Jan 2026 18:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769799051; x=1801335051;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2AQIiwK/vpSleByvzAFrsJ1U8jD2enUv3YtB1VGlQ/Q=;
 b=bvBWWGAXtk0Wxdcr+99YFC8yi2y8XZM7Ktpndzy/nDXft+AWq2MChLNY
 O7W504rQ88Saw90oQ1KKAU2mO3s/gsZADQZvFmYrI4EfpqfsFUOGxhJeI
 bQVPSvUAu7cLcAMZFmAKy2449oc2N6p5oW4TLM15Ghw6zWrwyG7Jrzgm4
 z5tmqkZRHceezCbOP3RRNdxCitwBhliLT9PHuBcJdCp8qUB9ODxahd7Vc
 GZ9BskkxnfI0xff0EB9+TigY7n3KNkXURdKYD0jRJZcPdhBn0CR/waixC
 wCOYhXRoRglOXLnX/5IVTUEwdE7pauSeH4VClAFo7CmMzrwe+uwjKgjjF A==;
X-CSE-ConnectionGUID: wTpx7Z5PT8SFXqJXaN4lzA==
X-CSE-MsgGUID: 3wdqMQ25SEmekrsZwVxwAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="82164105"
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="82164105"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 10:50:50 -0800
X-CSE-ConnectionGUID: HA6pLTgdTIOULf5erFs3Gw==
X-CSE-MsgGUID: 1AUmiUVbRVGVUisD9RYq7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="213866925"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 10:50:50 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 30 Jan 2026 10:50:49 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 30 Jan 2026 10:50:49 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.4) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 30 Jan 2026 10:50:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EwRbzumDhaDu6PMuBGQ8+VMZawze/l3KCeml1CbMM763oevc13/pPfsvAem+AAd7WAYPM1YoRtDx1TzIaEdhcTLsNY/xFPYG0A1RcIapgcErGnksCaMqpFLKmnVvuQjTbGQNxvcY1ss/9InGsfrA/GZDlEbvSdDeY3nEhQC4GFA4vZK0hyZRStVfATsn4j3FY/6qWnoCBrDes5u9eLSBEUKZ8GUpBYk14vYvQieldOdTTI8oTTWo5ifQQmNxhjgg0avzPnPvjHZsLeNzLgd5IrxfrzCoy+aVze+AcGU8kz8+GEhjw6sYbXMaQ2a0e1HGXnSLD5tMbJF5nOZCepKkrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/rEWuAH08xmb3mzxc51NKL4rrUFaxx8W+hZgYaxjn90=;
 b=fFYrOoo6fqAjzrI7xN1ZKcELvNYHCuqt738NRqHcOl6Xq0NVsNJ1OZDgTaoBovZhPGis5PPaOs31sG7ZfD9SJ/4ED1uW4A8id5PqRNIOpIb5lRH8OlPjt5S8yw8njGzoBDdvrfS1zjd+2ycX3BehZdsP2KuCl/kPAHHiHeQswqiAHxEeFSGi86kssiwPDGk6tjbb4f8R+C5aJfewQuWT16Hh2sCoaVBp8f8fMydjN8qWnikknAb9eAxrFcofzTICDDlDlBDHaFYKjGQBeHgfaAlP6lM/fK8TRz25tHyMc6jkviHVBphrkkuGMlSaDQdSaY5l99JB0HAPy2oB2HxFIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SA1PR11MB6568.namprd11.prod.outlook.com (2603:10b6:806:253::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.8; Fri, 30 Jan
 2026 18:50:45 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9564.007; Fri, 30 Jan 2026
 18:50:45 +0000
Date: Fri, 30 Jan 2026 10:50:43 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Shuicheng Lin <shuicheng.lin@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/query: Fix topology query pointer advance
Message-ID: <20260130185043.GE458797@mdroper-desk1.amr.corp.intel.com>
References: <20260130043907.465128-2-shuicheng.lin@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260130043907.465128-2-shuicheng.lin@intel.com>
X-ClientProxiedBy: BYAPR08CA0036.namprd08.prod.outlook.com
 (2603:10b6:a03:100::49) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SA1PR11MB6568:EE_
X-MS-Office365-Filtering-Correlation-Id: ab4564b5-3e39-434d-b0cf-08de603079da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FFF2K52J1XsZ3aZSl9sXCC0zt5MNgSLv0NnngVwc8ThX1cnsEs4njIzSSOG8?=
 =?us-ascii?Q?EXWpT6OU8LSnDZJyvpis9Z+xMYp/IUQQG5XXU/7CLLFO1NZBnPJzhsxrY+kW?=
 =?us-ascii?Q?X1FrFECH/KJtjUvFAIndnQkqJMw55Qzm7+vCYtZxzK7d6oITRjzUgo6nz94A?=
 =?us-ascii?Q?i91IrwSS4NdOoF1jic91juUOVesxDxBPwrFEWCTWOk5+OpborXI+XOtERaIU?=
 =?us-ascii?Q?/JjMh/GKMvgf+G9DAcyep4sAdnfrjmMdhXWiOnp3BWpw2DLMMSP7Ja6labh4?=
 =?us-ascii?Q?QLPLbbHPQyBAHCpOYdjNvUjIzFj8jboB0czz2WNm2GFb/PnKRAoj2CjWp4c4?=
 =?us-ascii?Q?uG19tBdEpTiIJDz4AgCvTyDKIqvFoh9bk/xGNxRAgdO1NZAieYg3t8fi7tu7?=
 =?us-ascii?Q?IeI3AEll1uzZF0BqJMQdMuxtD54JtPvU6p89f49iEAShi0g9hMUky8gdyNM3?=
 =?us-ascii?Q?ZXHYh/S+CbdUCRjx37Cdh1se6rs3TpThk2lydhyi08L3R+Xp4YD9Y8BaYt5I?=
 =?us-ascii?Q?mxIq+J93Cn3yiN8DOUll/lmGo8jSqv1OGBM+3rxmeTOk3KPkiu/w/z4FjBnt?=
 =?us-ascii?Q?zBmB4RXc3LOn07ZVmp3xHg9dRlZfOzNucT+7xMB/E61Xk2m5QlZt9bj8Wp/a?=
 =?us-ascii?Q?pQN6APn5IhNIJXm5Q+p9lul7zqFQiWIr68NQ5bG3HdfVwyo/Qm22mOuLEq7t?=
 =?us-ascii?Q?U6B/HHKEXOu0zPEHekF0vG83Odgbhb1V6KrvVflWU8z22mPer5jvGudxH7Gi?=
 =?us-ascii?Q?ieLbI1TXA8nR4px3R/+mDkgAYcNvnE+7KrnH+QqEDdAQwrqH1uwOhV2x4A7T?=
 =?us-ascii?Q?DaZD8beGuTcNzlHBmptJSb06h8GJ/f+7lLAIzSc64Yl8xRqP6JiGq224eOGV?=
 =?us-ascii?Q?6gmhVTAWtYjKuYCZbzsWr9chktz+RRBFjjugerTmb9M/ruMELOzb4m8GGQtX?=
 =?us-ascii?Q?16/bGPdcnzAlJGwN7OtB2sj0+rgj4J7414dL6Ev35jbbWOjF6KaoXd20CWPO?=
 =?us-ascii?Q?Pge2nXU0Fk7rqSoia+az/60TbtxR6N0+W9nCTAHHTcmGMK8Nn3IXxO0twWWe?=
 =?us-ascii?Q?iRBXofGLhl6FJjsaV8kjTlEr6ssqM4QiaKwn7CrbjElzvSU5wPdmsla/LBVH?=
 =?us-ascii?Q?wPUFLhpU8rMewV/IYZ3NyAGB/kvnusU6RJPerIkfeFgvXaGsP34NLqjG0RBy?=
 =?us-ascii?Q?i7iKzeoZ2Q1OyvCD5uC7sreL52T1jZDKTJagpc8Lqk8VknFBnY55V/Vjdens?=
 =?us-ascii?Q?inrWFAxtGZ4jrI6TmeGslbXWGGnStZ8rNm/zgMSSoxVrCZCDTQLd98BOe3Hd?=
 =?us-ascii?Q?HlpISHO/NvvVAMhQ08Fb76GMZtxEripF1FedV50CDYtJOwfiIL7/WnowJSh4?=
 =?us-ascii?Q?t5ZKVT6DR6v65idDQBxCmQS3xwCtjO9G3IIuBJ0CC1ykYkcpQvbRv5p1E0KZ?=
 =?us-ascii?Q?gBIzHQaO8T5ZgZpXRCZvtX0j8jP8z2o9UitLDNmqMnhZKITFMx5ooP2W/yEj?=
 =?us-ascii?Q?Q00dO7n9baVX9MNS98FNbNkF78rxuKdmYyJ2/WTfdJosS03IsNLymsHzVlO+?=
 =?us-ascii?Q?6a7PvdZiKBLvFAnaFvU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BJKOj/13R7ARrU4+7WhI9i5fh3y12kEIOZYmM7cTzePWNCQRLkgSv/5rmF3D?=
 =?us-ascii?Q?oWxH44keifovYxNjCjkVphB96W+EpQcmXH1+NcvHWciUQ8X/S2fGjgh8ct2z?=
 =?us-ascii?Q?Zs0gF+zLw9w/fQJ9aiNemnsHZVoQllA9Z3EoKPv0Ijl4sHStHu+5OyxWUoLv?=
 =?us-ascii?Q?aSg27Z90jDnDRUu47ABGsJHK3saKuTdIGlpyUGeCdkljRFzoW/PsvcgY2EHa?=
 =?us-ascii?Q?8DCWmT2bbf6eDUZba6JKm2Ya17PffyoRkXXXtD4aNkbikVNNn/D42GtVTRdW?=
 =?us-ascii?Q?OfuNnAYnJd4YTyM+4551j48IbLS87MyEgB27CIctaY6reia/9PSgZ7BFwHj7?=
 =?us-ascii?Q?gOW2ug8GSxmkAJgfWDF+DxAwQDXy4noJW75SRA+nFnaVsYt8Sj/87k/2oAoh?=
 =?us-ascii?Q?ejlbKhuaQ7y9ImuA7Zs2TR0Jk+qyoddeKYHIOQQU+Zw/f4TvsDDINtMEShlJ?=
 =?us-ascii?Q?1HhrZqjVt8snB80IFM3imWU9m9VNGMPfbUPinjxidzqgYA8WnP3hilNfnWLn?=
 =?us-ascii?Q?kRdBTk37k+wObEY72lneyURizuQeUxO/Rk/Vo97bVXlbpLa8EmwlsiT2M1g8?=
 =?us-ascii?Q?KC678Gl+f7o9Em8sS1YGCEbiP7UE7bVaKcVk01CwQ2RiY8JKynR+BR3DCkrW?=
 =?us-ascii?Q?7wM55YeyGblthfwxTBLmSaKEngW2Xh3Ou+gSVT9nG/cIuoFn9xXO8SGhInrC?=
 =?us-ascii?Q?9ALUbdX5VIoYGuICTyK2J7g1H2I3poy5BiDMTZfFKHhR8zAFEW5UeMvsi/mx?=
 =?us-ascii?Q?tyrhJzOJCBpGQT3ccgT0l5lXXZbv2K7yzdtftsxFtEsvi52OTJhYDWeNMk03?=
 =?us-ascii?Q?ACGLgDKQku9s+ZY0E+xxDK5N0T0t4U01EKH5m/6cn9bhR2Zu+J5Ew6mZ2/qI?=
 =?us-ascii?Q?YhAs6DncaoRlzgFOxzxu564veB+MY818LDTqozPWTH7SqaX3QuZFFpikUYPH?=
 =?us-ascii?Q?+eiFryuTaWg21yn6H4jxetjBDfA6Gsh47F9AYzrnoVSA8WYFdcJ+c0Qdipw9?=
 =?us-ascii?Q?bp1xXA3BrCTJhA2KO1Dq0oTeYZ07iBAOhz0mO585v/NfqCSRH+ssrzp9ZUwt?=
 =?us-ascii?Q?quOIw0fi6GxQifgnPX7SclFPpd4NOB9zLdp018wrNFOre0gzQUpOXEQ1ndfF?=
 =?us-ascii?Q?hJbsteSTvrhz5XBUZEqIZSC498whVp6s32ppdux359fOXBvcmv5iMVlGW6Bb?=
 =?us-ascii?Q?Q2A7bBzHydlYryq1MlbenthefbOj2Gf1UOddr4S5LdxE8JWQLCe3zl8LTw/2?=
 =?us-ascii?Q?veNkA7EsOYPpyFJzdGd54PySjRfOGD0z1rimfz3kRD0L/5vOlmX0q3h6Eecw?=
 =?us-ascii?Q?pT1y7oX2S/4MnJIdsO7qtVoIJHfrJ+caysjDbGR/yZO9Qet87p3T2VEquJeV?=
 =?us-ascii?Q?FlzxAaFFJK17E99TsDA7JL9JVueDNjwWqeBlU66ksz2nxEDC3xX9+k+rmDiZ?=
 =?us-ascii?Q?+MGTP+Nd8f1bJIfk0g/frlvpVsL2nSr+iRtXzzSpj3AqfCd8bHpZl6cDSFYz?=
 =?us-ascii?Q?vCMKhUeFGzzDgclEpErrTIVMZfcPSBsdO/d6/04OijcBhOITUgRLO9NwsKVo?=
 =?us-ascii?Q?BuwWVYiz4SPV/dpoYnfoohD0+pPouT6KXMXuYusX+kkq2bRdIhQMKDKZJSoX?=
 =?us-ascii?Q?1En+5UFF1ZOTDycmspN6SlsExlwObeKZ2VuPNyWIl0PVFo/69Vrhc/prHyd0?=
 =?us-ascii?Q?4yqp/b+NUMl6TQ4ONSsLAf25FcO34Gf4TAVqk3zAbLGraiMrSP8DKgSThAKA?=
 =?us-ascii?Q?eSEwdJD4s2+GhPoBG8L3oy9UKgusp8w=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ab4564b5-3e39-434d-b0cf-08de603079da
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 18:50:45.4913 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dtrQ/fh9qEm3fTUoxjPKyeQHbYDzLFu85iWW6XDdTkHC0bjcJCgLM2NHzwkalF/Ijdl2uDiBCWHpa5hx+9VfG08D7hOnOG80vrCymgfztwo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6568
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

On Fri, Jan 30, 2026 at 04:39:08AM +0000, Shuicheng Lin wrote:
> The topology query helper advanced the user pointer by the size
> of the pointer, not the size of the structure. This can misalign
> the output blob and corrupt the following mask. Fix the increment
> to use sizeof(*topo).
> There is no issue currently, as sizeof(*topo) happens to be equal
> to sizeof(topo) on 64-bit systems (both evaluate to 8 bytes).
> 
> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_query.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index b7b4261968e0..34db266b723f 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -487,7 +487,7 @@ static int copy_mask(void __user **ptr,
>  
>  	if (copy_to_user(*ptr, topo, sizeof(*topo)))
>  		return -EFAULT;
> -	*ptr += sizeof(topo);
> +	*ptr += sizeof(*topo);
>  
>  	if (copy_to_user(*ptr, mask, mask_size))
>  		return -EFAULT;
> -- 
> 2.50.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
