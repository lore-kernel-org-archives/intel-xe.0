Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0BB4C10F15
	for <intel-xe@archiver.kernel.org>; Thu, 25 Apr 2024 20:31:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72C5711A8B1;
	Thu, 25 Apr 2024 20:31:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TyD0dQ1Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEA9611A8B1
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Apr 2024 20:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714077106; x=1745613106;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=XFACxdO9vpKJ7nWGKiqBcTTqeSXCJpWe9aJPzOgziKs=;
 b=TyD0dQ1YaoSjjLhCT8u6SxCiNVDdtMFklu9/YbaGEVXLPxJkiHbLb6/B
 7/iMa3XqKQI3tt2+reIsi1X6mdDZ4rLxExfWfdgam4Xoh2BB847yNgHjA
 WNm59ScJ6itCvLGui14jVezwBVgjO6pPyzR7ploPxvHbGVMhTy6t+RY6t
 Te3ABYMk/Jy9ew0JyNEeLH3/E4eUJO3xFJnSE1piqOCCujfcsDSJcChq5
 UhlSDPTB1JcVw0BF8f2iuLlkAKSLmlV9E6kgkPGXlif7ycK5DeOme9CAt
 T0igd6BmxVod6lG4UuUBxyfGxAGBTGmJl9y0QYAkjb+nfnZU7W40YpwiQ g==;
X-CSE-ConnectionGUID: waEXSCfJTwiKz3LW5hWAzQ==
X-CSE-MsgGUID: +XkcCBYdSxiMQ54bi02ZLA==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="12731305"
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; d="scan'208";a="12731305"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 13:31:45 -0700
X-CSE-ConnectionGUID: KaPV6eReTd6T7yuGAS5T2A==
X-CSE-MsgGUID: WA+qMQ05TYm5xwZccKh4oQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; d="scan'208";a="25607131"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Apr 2024 13:31:45 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 25 Apr 2024 13:31:44 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 25 Apr 2024 13:31:44 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 25 Apr 2024 13:31:44 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 25 Apr 2024 13:31:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bKxBEiLHQsPxZV/VzMudPfq/MY/S43rBH0A6Oq99vFxrFiXxAbETU1nLjqzODw/LEoudWcZDAi//Q//DB6lsKW31vOHlU1WxV9aD51SfFnq810shr+8thB2uzI7gmseS1wvZfTyvYu2y7khUOcm9qGmL8+8VJyWQ9tRuIqP4JPAwOyKwM6+s5+l6fxq0KALZpE2zDILbVrq3lDf9FzWvJlwaNoQpi+Bvl9EyJhBpxjfQXxP9fY/fJCuimLk07TWPy//PUD52a3h+y55gZHDT05t9kNRdYAYqQ3Lg9uF8ohELfzuCA2luYtq6omIDVuWduo4WVZrvy9TJLgPio/vYYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g//Q8Ksu2DOLyPoYbzGsGiOi7DFygFxlLvSNvjjmOyA=;
 b=DPTa42M+kSmQK91qrn8CcHd3++XQu9NuGm0oyulkqTcDgatWbCofifxnh8uka0heCMxzlTGd5PgEneVEYUlZIR2eR9kM8FfAQOeoCJBK8E9so9LHsKGjvWiAlfpiHHczq0Bh/VDPwJ9Nbl8Kw/rPHBurJU9ejlQEqYzB79vLiLkxcHDcLeBqGGOts+J91StMyVMcQ2rWgaa9ymFzfkF+i9V/0urEMIsBXwBwiAbVKTY6IMjsKffS86z+yplzkFkas9FqFnuhzJN6AXg3aICBGLBiahRFyYIFWIUCRl820CWorf3vl+rucyBiep4qJPUXtu58EeprmVRm8Z9ljidZog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CO1PR11MB4963.namprd11.prod.outlook.com (2603:10b6:303:91::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.24; Thu, 25 Apr
 2024 20:31:38 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7519.020; Thu, 25 Apr 2024
 20:31:38 +0000
Date: Thu, 25 Apr 2024 20:31:27 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Add engine name to the engine reset and cat-err
 log
Message-ID: <Ziq9n0f24pKHCQTN@DUT025-TGLU.fm.intel.com>
References: <20240425121856.4500-1-nirmoy.das@intel.com>
 <ZiqW68FPS+vJ8TtR@DUT025-TGLU.fm.intel.com>
 <e2c55678-55f8-4ee8-9be9-f941f29f7724@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <e2c55678-55f8-4ee8-9be9-f941f29f7724@intel.com>
X-ClientProxiedBy: BYAPR08CA0062.namprd08.prod.outlook.com
 (2603:10b6:a03:117::39) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CO1PR11MB4963:EE_
X-MS-Office365-Filtering-Correlation-Id: 14566eb4-d039-4e40-e674-08dc6566b594
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sKVAPY3Sms/N5kcT8s+3Yxo6oF7I3PAWyoKcwyU58dB/wRXAcysoDwljv8Zb?=
 =?us-ascii?Q?zV9sd5LwKvcHSweKy3U/WPAQT2LXBnmIt2k4pSDWh5bnjuVMCx0iV8ZZIFP5?=
 =?us-ascii?Q?/tbHexgO15s98gz6BNkFup3jjXQtS06UKZZg4CSN0D2jKh4bEMQQ2M+7IZHn?=
 =?us-ascii?Q?yhp9UGM/9kkJGQ+REzkY/4UmADD3L2EMUGjqRu6FscZmpHr7f0Ju9VL4YvBK?=
 =?us-ascii?Q?NYouMAMyLKHCihlTmeKzo0UvclTJmShP+DluShUIMiKdqYBfUYYbXCAjMiD4?=
 =?us-ascii?Q?WKojNERYARwCst648ItgJDq+aPzF0z7Q2TUZBxxLFrpHslebLiTV3s3/uCI8?=
 =?us-ascii?Q?qY3dbvLTFKHfD0+kyhKO/TcISb9Romm6v0q732XsPvIWhY6JsOCrgZNm6u8T?=
 =?us-ascii?Q?0d7rChAT0O3HIx5t/W9e0TvfRjBJKNaJ09y7Y2YQfjIGTEb6AzvgxpAenq9r?=
 =?us-ascii?Q?ii9iXh/bFg5i8SsHPsHhYzdBc6yIRkrJkPrsKAPwGaWm6iL4fCk8ttKuCfL2?=
 =?us-ascii?Q?vYh5yi2UCvTE+Xnyxzz3FVU6EWw98309zzZ8GEuDa3RrBLCwdy/mSxdmnNvm?=
 =?us-ascii?Q?tkTCHA1swtnUpkCq30wwE1gneeqVIur74OfelkyWhbvZSaq5pIpBJkuAd8kC?=
 =?us-ascii?Q?Xm194Jlns/xVoNzk+uI+Kgdv6+FoFZqG/9HxhwL9mfaOTW5Wei2XbjWhukft?=
 =?us-ascii?Q?ikf2K/Gxos/gMmM7CuY8pLQLXlpPpuhEqjMGScnywTtivpLT8EIaR1gJ0nI3?=
 =?us-ascii?Q?8l6x6LN9OFuxD0yXow2QePq2zDjrTzVQo/UvoN4pDnp18vGPrRGsxS4JMgJQ?=
 =?us-ascii?Q?MUA/DvcVTs6xQjYz/nEdxOPexLKEerTBUmX9MeKA8LbPG0OdDMxCMzhkTa0s?=
 =?us-ascii?Q?+DZGcp1SqVC6z9A2pOLuypt0r2k1txDGgpyI+75iTfj1bbpqKTh/CXY9qLmF?=
 =?us-ascii?Q?R/H1MjMO9+E5ohAF2pLFQZSkzF3HPTixr6BIq9VeY6Yk3DDdBdlxRRXgdm/+?=
 =?us-ascii?Q?NhR/5mwvZk10sAeAI36mKXJEaZsGbh+Zj+zGQjbRnug5d3hnlx8pzjIXaO/f?=
 =?us-ascii?Q?x48fdwdvSzzmKa6P/Ne2hTgshlYdVGrum8jAPeHeH+RCqLUpfZxpRwccJ5IY?=
 =?us-ascii?Q?bVoyAYM5mcrqjibnHU5x9jDWaoPITZw/L93rly7u1ww1e91LRuW9MwWrWuOF?=
 =?us-ascii?Q?Q+kghaUZcen5KgKGmwYkwJVuDNpGTaeFLC9tVADjbL7DIOSuNmhZt/V1+3O9?=
 =?us-ascii?Q?U/qJ7OGsNNAcEWyV2HpWZ5joeifSSbh4XWmMkCtlrw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?y2IAZFlgs4OHJgAnGjZd+9cJf2UYtC3BKAhCaAfexrC4TPsz8qbiMNFCyU5L?=
 =?us-ascii?Q?8DrvV+tyOiFt5t61+YmV/q6sELefucSkXvPYMrBOoG54NMKCY5jQ5YN2tZu3?=
 =?us-ascii?Q?TvangTfsnMSt+9N8l/rDCTB5qrO7lcWgbQypFMnzEtRgUL05vHHE++spAjUe?=
 =?us-ascii?Q?XfpLelWtir9oai2Oq0FzykShCe0JU1pB+ch/0jQ79EtSaO4Wwzdlk4n3SwAc?=
 =?us-ascii?Q?bgt3/fB2cXnovpSA9NzPICuqEi6SLDOFbhbR4/lPiBgY014qFEMQSJJjyL/Q?=
 =?us-ascii?Q?n5e08+s9cqNkVdF5WUR9KV34YnMqhxqWsnIzuwc7rtXOCLZDk2L3ZqNn2Vtu?=
 =?us-ascii?Q?Hh7FyQ7xI8Lp/LS37rDwREeL5aAvyTGHB1Bb+amptQEkoCVzXvi+WG4uBm5J?=
 =?us-ascii?Q?Uutbb7wc9pugGkUa5AVT4xMwcnRBxvxoWF97AJEQuCfsudmH00/tNGWQElS3?=
 =?us-ascii?Q?hoi+oYNUjJpGtilLci4qHD1Z2BrLdi0SisIkU3jvewEmgh447DRD1Rp7s3sQ?=
 =?us-ascii?Q?AxtC/cLt//0nHG96GyiR+EGYTvRrPlxh/308bThjzPRAF+ugdpvU2R4kVaA7?=
 =?us-ascii?Q?j4UqKGL+PsNojYyYSQ50CFrxhSoa0OTG2obSKFZY+g3kRRIs0pemxtnzYOlY?=
 =?us-ascii?Q?sImgy65fAgAxQjCDwh7mdQTxaO9dp2Qx+3CxYUCMOssYuZK5I8I8Umk04twR?=
 =?us-ascii?Q?z/lyhM0ocMuvx34a5lEnoxQO69oeGn2zsDgOXREx83FogYNonYX+UIz4BJaU?=
 =?us-ascii?Q?weY2FPqossynSooo6PeKj7bR09kvEhD0Mf2M90kRRbBgra4yWmMB4jFbm/TA?=
 =?us-ascii?Q?n6t0t1vh0/Sv8uqIBTtQduqjheSgPmlnl3DyS50dcqbAeygtr4mTn3tt1vkH?=
 =?us-ascii?Q?++XzRZDNWZmK6GwiESMM6+lbVCvZZj00bl6trnbYpM5JMzLTFBM1FnnBJS/Q?=
 =?us-ascii?Q?tYajUZAVpHJ71v8aM02XiHRSgj31FVoQaS1L2kL3X9u0NnjTdDhR3whquOuB?=
 =?us-ascii?Q?4Xba0vqkBUVxqT0CHw65aJk2Xsm+mKhTfCLlSRboMulYsUDecgTfoUmgimJq?=
 =?us-ascii?Q?I1sUzN+fi/ofQOLelB8xPJm2B5FodnOXXX+MzkqTaJQz4+IrTNYyH4ppOp+Z?=
 =?us-ascii?Q?l64SbFKM46Fd6RlPrvKHS3O6f7VzYH0ijeNmlVrsclnQQ7iGAxWc4aZZnjI7?=
 =?us-ascii?Q?CKPYduZyHV4ashWYlNCAwbwr+zqTX6ZJA5Batr9dSCO7lqaIEpJQtPZTxUqo?=
 =?us-ascii?Q?l5jZKcF816DF/0Jl4U1AKX815DJLgWpS1Fc5/dSsfgXvDyZvk35UP7kfYncR?=
 =?us-ascii?Q?mtpGEN1jpFhGKMn+XvkpkFNl3npEbJUqUZFkmIBdJujT0688Ehgvmqv6Y8i3?=
 =?us-ascii?Q?eFl32hRQcne41/sz6WHnFD50A5OCUHkv2hXSKR6Dnh9esE7exoLIvq29mPcn?=
 =?us-ascii?Q?7J9LrfUzjaMziYDQ/gXYnLE10Ha8R6q3mCixP7BiBxxUoGUVAOTKvKKtL2hz?=
 =?us-ascii?Q?gXgj0pLwNc2Teg+FO1PURSH3HOagNXa4nl3RV6V4eE4NPrccanR+TLqXF7oW?=
 =?us-ascii?Q?cm7nHwYylpO4Fnr/sGJ9eSAPqRH2btV+9Mcuo7Y8hLMfCrR9ipsGyi8QXiVF?=
 =?us-ascii?Q?+Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 14566eb4-d039-4e40-e674-08dc6566b594
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2024 20:31:38.8383 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sPLHEvtJmxK5sRM7ZXWXXVmx2jSsWl9jgtfhjb5Nnfh+5ApBGnxOEVVYyFLYgPNDxkKDhZsa4oNZii5fZFzIwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4963
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

On Thu, Apr 25, 2024 at 09:11:22PM +0200, Nirmoy Das wrote:
> Hi Matt,
> 
> On 4/25/2024 7:46 PM, Matthew Brost wrote:
> > On Thu, Apr 25, 2024 at 02:18:56PM +0200, Nirmoy Das wrote:
> > > Add engine name to the engine reset and cat error log
> > > which should be useful while debugging.
> > > 
> > > Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/xe_guc_submit.c | 5 +++--
> > >   1 file changed, 3 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > index c7d38469fb46..245e29d095c0 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > @@ -1655,7 +1655,7 @@ int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
> > >   	if (unlikely(!q))
> > >   		return -EPROTO;
> > > -	drm_info(&xe->drm, "Engine reset: guc_id=%d", guc_id);
> > > +	drm_info(&xe->drm, "Engine reset: name=%s, guc_id=%d", q->hwe->name, guc_id);
> > I don't think q->hwe->name name is useful as it might not actually be
> > exec queue is running. I'd drop that, and replace with string indicating
> > the hardware engine class.
> 
> I will resend with engine class instead.
> 

Maybe include the logical mask of exec queue too.

Matt

> Thanks,
> 
> Nirmoy
> 
> > >   	/* FIXME: Do error capture, most likely async */
> > > @@ -1690,7 +1690,8 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
> > >   	if (unlikely(!q))
> > >   		return -EPROTO;
> > > -	drm_dbg(&xe->drm, "Engine memory cat error: guc_id=%d", guc_id);
> > > +	drm_dbg(&xe->drm, "Engine memory cat error: name=%s, guc_id=%d",
> > > +		q->hwe->name, guc_id);
> > Same here.
> > 
> > Matt
> > 
> > >   	trace_xe_exec_queue_memory_cat_error(q);
> > >   	/* Treat the same as engine reset */
> > > -- 
> > > 2.42.0
> > > 
