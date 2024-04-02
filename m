Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAAAACD128D
	for <intel-xe@archiver.kernel.org>; Tue,  2 Apr 2024 13:22:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38BE710FD1D;
	Tue,  2 Apr 2024 13:22:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aEWhxIjy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8ABB10FD23
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Apr 2024 13:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712064160; x=1743600160;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=PF+u0EB8fJwGFIYQncgwxr7ebuIgdOmkEzWmvkXXeMU=;
 b=aEWhxIjyLnCgQKbKkHbwFD5EjaoptWui2xo4nwb1xSASsLISvyKIgeHh
 STnY7D9O34VwQH839ZoJ3FwL2hjTHOLoKjSZZ1wrkzJmXjLEe6cfABSaK
 vHiG/lsGNnnVXyk0fP0llfsGR8MgpR6F2XMWhmfkiq/B1coNnqc6I307h
 u0ooNLjBkFiwB1HNbY+GeSp1bvx28Fy/m/1mR3W1h7MWawBo/Scv4Ptlz
 ECzYAd5e9AsyDWU1tss1VW50/Dnq2CX3OE1+sWaToT+X0AT9HxpQGasyT
 umvc+oBbFDfFLwJtzpCwZtyEzbWMt3B6YWy6jW0KlXzcE2IZi3QOOorgl Q==;
X-CSE-ConnectionGUID: oQ6Eo4nmQPi9Ror9Bnmu6Q==
X-CSE-MsgGUID: BpHwc02JQ+iMUTXbAyKi0g==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="10196076"
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; d="scan'208";a="10196076"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 06:22:39 -0700
X-CSE-ConnectionGUID: ho3vC0eTQmC4iQLjRuuHLw==
X-CSE-MsgGUID: OTTVbefHS0KAKoUkoZReLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; d="scan'208";a="18098455"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Apr 2024 06:22:38 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 2 Apr 2024 06:22:37 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 2 Apr 2024 06:22:36 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 2 Apr 2024 06:22:36 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 2 Apr 2024 06:22:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AsFgHe+qFxGXOnqaBtiz6yMFKyqmH890BAzEeHDSi+Po3UD3dsUAz9Sa1x8Hrl07S+NOwV+I2oysH2y/k2p+5RIvvi66IKcclWDYXqkr2qqqTET+FPlig5tDAXv3zJzvzrPjp5khWCDE9ojg1++k4Oz44Eec9+IY4alsIwUURD9tl8l+/tDFv37DKK4ZVZIRD6uAft7/m42nhdu3UGlfQY5KYoS6AscYg4Y3md5++NXaGqFtNmj29nyka6mlgKJ9SqQFScfqfBPSux+3YXlpjm25HLgOrYyxLu6BotSdALMuaUq961JAY7lJmCmSEgFvDrL6tFdFocmsMFGrIjw96w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yAwRYlDoIpkbaYb55ZhTyyrXV3NxDNo4zJIPMGhD2Bg=;
 b=Si96b6h0e/TDmvZzbKSabdkRrPdkipy0Ac8WzSXzcKtfoPB1xsW57vSIVma+NEqb8F3YDQDYTMJPq/e/xfteLgkNdiIwcEhGtqccF8pWi2TxYB+QJfqJZTlAlG8nSGcW1JUbRcJayzKBgWrzaH0bUQDxpMAocTZFg6AuaX68r1b7WjoGBd/Z15dzaevx/BV2GqF8q0FthraBAsRsD742KaQSm7AtpBCDnTnKuajw5/V7Dls6+zWgwxZAlPbLU3gIYWi8CwAhz2h8Br2TqcLle+GbS17/pbYzNUZ1e36dAF/V2Gg/kTOfKByYl/82gOMPgPEukDSFRx1nzYN+R5Hqew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ2PR11MB7715.namprd11.prod.outlook.com (2603:10b6:a03:4f4::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.33; Tue, 2 Apr
 2024 13:22:35 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7452.019; Tue, 2 Apr 2024
 13:22:35 +0000
Date: Tue, 2 Apr 2024 08:22:26 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH 02/11] drm/xe/xe2: Recognize Xe2_HPM IP
Message-ID: <xxqzxnugfel2myuygmiwtnpq7ciqffun3h4laedecnv77tlstl@sxalydrxzioy>
References: <20240402124724.1238122-1-balasubramani.vivekanandan@intel.com>
 <20240402124724.1238122-3-balasubramani.vivekanandan@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240402124724.1238122-3-balasubramani.vivekanandan@intel.com>
X-ClientProxiedBy: SJ0PR13CA0178.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::33) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ2PR11MB7715:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q1zUbvmY8INWhpZ3rqIm/rGIIgLmaOSS5zW8OP096HidZthiCV9eU6kx/UoGRs2mzZ85+ccy8B+fkNK9ZrS/a0wV/QkxTDhaSNn0dLOUX7wLRM6k0Nh/YTvh6B9jLIqQl/jjP+nK75La6izy+h30AqYw+JVi2WEUPShYmH1PCTQsSUKrLhkQYsxhKvG5L99omgoaVrBCsJkQCGcdSjYPnhKRrtGYr1etDTbmVWG9yBZaunsrgk1FTtlIf9bu/l0PFXBlzcwA9NjiXC+hbTlJAE7bEp1sWuvkZBG45+t3gG/s7Nm3fgd4tjh9jzLS5V14Bcf8GWC/ewjOWZ155Nn4qhIdt+fkXoSdLa8iZricz80fI0RS0uWjzGvJq1lyzjIa9Fw/mxMUv8uFuk6bH+OrSJr20M3Wr3iCwYxBXBsGJQWQ+Kxdmq8cCGyljjNP97WZFKJzZeqmjUdlLcugOsuhEO5MaUH0QfKIR/EJfDXOot9zzMswpzfo2gtnG1q6mOGG0xYRljFEAAm8oR7BakO+/2o+06d2PuL8U9xm9XCgAEiBL1Cz2s1XhJ2DmRAdomcUjYpQS2j9KSWWhTCYMCaxxTBr+BtjpavG/nJglN+BWu6LJY+ohOGCjGaZcI+DzOPvCwqpSHwVDgqM5VD6/xSh3Csq9Mfd+78Xpf+GQJImnytZhsuIdP8ljgFslkIS+i1tkr8UlfHof0j0jUrSzRzHiA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005)(27256008); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?C/bq1L4Pj8Y4IUw9AXGpKiWMW02niypxFT2YxzCy8dBjCD10tQabpohf3xxn?=
 =?us-ascii?Q?WeD4SgH4e86Mxz3fga8zkgb4aEF88V77255lnydbsmtWv+rkD/B9VGdEj4od?=
 =?us-ascii?Q?hiJTVc1eW4Q5i58wc0NtWjbLMEBRdV5llauFhE9Ln3fcShRB9NpZjbzQ+uaD?=
 =?us-ascii?Q?G92NYft7oqo++EtpvubLvoV+UoFeb/+I/UMbFiEghHSPzZcFPdrK8+deqw+c?=
 =?us-ascii?Q?A+5NoghQEfKCLOtjrQfise7aq2/O58Zuds88rqp75ab6i6Mlkon0F3ZyvgWL?=
 =?us-ascii?Q?vIHqN7KQ1bICNuLqBZB05kTeZuTYk0pJONl9weGX9KObS84XWzRBTbFFf18m?=
 =?us-ascii?Q?1iPjOAsgG63Cli1/C5HjYCP00YCM9fgqUXCrLETf6MgEIJYuurt99FWhE0X5?=
 =?us-ascii?Q?W6EABrOdDVUrgTwAYaNyhaktzO3goo5Znb8IH4S4VSQBg3eLvAiwH/wRlcEr?=
 =?us-ascii?Q?uf9HyMo3g2Wtsynm8cybnd2BGLIROfGcFaJzQ+cOQxHPi1L/T0LRrOP1sfgt?=
 =?us-ascii?Q?QuzbKxdw99BEUEAoATOim7faLqFinNwS1Eo5+334uNhOKpRE5EM5i0qjypb8?=
 =?us-ascii?Q?EiLVa6tBpLLl2VithCFYfuPFOM9sSOsoW7L139rnleRHBwYVGoXsxlbw6hrF?=
 =?us-ascii?Q?xklUHlDOvOTRwoFRubK50KrX7HMnhK6kczJ6OIDYoBuZ7AuxBaeoFhG/jQys?=
 =?us-ascii?Q?WguWkfmySdOWlsIJWnIKQXiMXYhXTsbcjlnrhApAinrK4K5VkCZDWzi+E0E+?=
 =?us-ascii?Q?bTF52sKI67Xt66TPI303mTHCCfPjOWoKIq/pcVVFu/SOrWQmYR79lnTn2bF2?=
 =?us-ascii?Q?ZMlWoxCfe3bPoaCg1gKS+ECzJhqbcnBixll6dVEp0PFL4D79Hua0AM5k9UT4?=
 =?us-ascii?Q?bxe/TCy71foxEMkooqBj/0ij2mYufb6IgsI3EkdyavNLBLcROcRmHstGLaIM?=
 =?us-ascii?Q?4fwFWBXP1yhTthyVJebd3Vi+UZt577/cbBOa3kFXpc5AWbliHlGjj6OJEkqR?=
 =?us-ascii?Q?BMIKGyvKUZVvVsq8sF4AGCEdgiD48r6Ajn/wW4Aix5YPq5WI/TNoAd/+8HDO?=
 =?us-ascii?Q?VG2rN4ldJ0mdNSbPbToOLmSwjF1o+gMI73ERhV3oYl3e2JiBAZ1FodF/Srl9?=
 =?us-ascii?Q?eqHBpXLgtH+ebqgo1d4YlOkQarNHN01h1vKTNEqEAvNSHmMK+10tLwH/G+H+?=
 =?us-ascii?Q?XFexf0ZED7uwrv/gSHOcB97q8WNTYksYamtO//wo4Jiqp+r+Nvj63BptVbMu?=
 =?us-ascii?Q?4kqLNYadFcaBynaJ7ku3C5FAQe732771C1HRgDKxvhKW9LU7XUUdt4LPU4mw?=
 =?us-ascii?Q?fU6+nt4VZ4ah+Tr8/3YiCNMwXKmWnlEBybEpkHIM9uq7wkEhXMgPDa3FeJYJ?=
 =?us-ascii?Q?lS2ufO77F5fqAAweDBpMxdlRiibkrzcRRpJyHGTvD0hjMUFvbRiTu6qWmC9D?=
 =?us-ascii?Q?pYtGdgizW9lCRiEL3Yp7g01Pq1Jig8yuxCPDB0LFtvCJJM0MzmPKXq2yKxOH?=
 =?us-ascii?Q?QwehjXJ78gTz5ZsypkGykooqW1XN7BJ+Rf/A7PZxgugbTjgPzM8YAlS2nZPq?=
 =?us-ascii?Q?cBD544MebebDogjdoDZ+QV974RbV95rtX2fVjvxiyBRsrAARGQE+ME9vyDuv?=
 =?us-ascii?Q?kg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fd446f95-0873-4679-e5c5-08dc5317f5a4
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2024 13:22:35.1967 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C79volCI52hcO/Vus50yDccyxljrVIU/CZPmgCfrXahhBq8rLlwdEv8sgM8ScLZacpmzCarZco1GW9EnT/ZPakdh0OjzHHRWBVEH2sJWkDc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7715
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

On Tue, Apr 02, 2024 at 06:17:15PM +0530, Balasubramani Vivekanandan wrote:
>From: Matt Roper <matthew.d.roper@intel.com>
>
>Xe2_HPM uses the same general feature flags as Xe2_LPM.  Xe2_HPM is
>identified as version 13.01 in the GMD_ID register.
>
>Bspec: 68090, 67163
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

same as patch #1. Drop my s-o-b.

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_pci.c | 3 ++-
> 1 file changed, 2 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>index 6fd0f4258ba2..2d3b18d6404e 100644
>--- a/drivers/gpu/drm/xe/xe_pci.c
>+++ b/drivers/gpu/drm/xe/xe_pci.c
>@@ -207,7 +207,7 @@ static const struct xe_media_desc media_xelpmp = {
> };
>
> static const struct xe_media_desc media_xe2 = {
>-	.name = "Xe2_LPM",
>+	.name = "Xe2_LPM / Xe2_HPM",
> 	.hw_engine_mask =
> 		BIT(XE_HW_ENGINE_VCS0) | BIT(XE_HW_ENGINE_VECS0), /* TODO: GSC0 */
> };
>@@ -352,6 +352,7 @@ static const struct gmdid_map graphics_ip_map[] = {
> /* Map of GMD_ID values to media IP */
> static const struct gmdid_map media_ip_map[] = {
> 	{ 1300, &media_xelpmp },
>+	{ 1301, &media_xe2 },
> 	{ 2000, &media_xe2 },
> };
>
>-- 
>2.25.1
>
