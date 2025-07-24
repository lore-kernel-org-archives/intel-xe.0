Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4353C87FC5
	for <intel-xe@archiver.kernel.org>; Thu, 24 Jul 2025 21:10:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE43B10E0A9;
	Thu, 24 Jul 2025 21:10:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hV5KrnoS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 899EC10E0A9
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Jul 2025 21:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753391444; x=1784927444;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=V+2+trIuTz1BY3PwHrzpF8xrCy2W6hFs6jU6zbdT8xg=;
 b=hV5KrnoSn2FVLXqIAAzO3SlBjBObATtwh43JTwRewCRbMi5pA5xX4Tpb
 oF2DyikI6BEqMBWCW225Sic7wHbq/Hk4Bp1jvCWj9ZCs8s/TmhEMZMtbz
 G6H6CN4TUWIbXS5gtPS7WlUCvQHkcYmGeFyD6oO6WWJTC6HGkbwOO82ZZ
 NQY/KpMcHwx4/VW3byoxYCqtZOdT9GXqnlD1i4/SYbRQe9mJmqfF07yBd
 uXXKEL2pbabTaZrKnp7nd1uiwKm5Bb4D2LzkvasW2yJmCEg7BJVHikHbW
 cr9c45TnYdtHVBEJffpCJIk1zRvLoZfVf8lox9Ys75v1ckBsFi3TcZa3Q g==;
X-CSE-ConnectionGUID: je4jCta4TE2QQRN7Pbq3og==
X-CSE-MsgGUID: ovJqhbpPQASoG/eKiOOkjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="55579574"
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; d="scan'208";a="55579574"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 14:10:44 -0700
X-CSE-ConnectionGUID: eltkVgoERhKmmkVsk/G9/w==
X-CSE-MsgGUID: 61FP0TJCQu2etkC/7W+9xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; d="scan'208";a="164704485"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 14:10:44 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 24 Jul 2025 14:10:43 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 24 Jul 2025 14:10:43 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.40)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 24 Jul 2025 14:10:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wiXfhkP/q0Vh13BP+crrkvDZiszYfQvhXFSgwV1nyKRGxbT1Ve+VGGVE5/xGvsHF9z5Tv1d9c3dISc+juF8Xjta9CEOlulS0Ic/bL9/uscpJox/Xt4afRMNhes/kgSl4QrM9ktJJFACOokGzPw+sT5ap7W3Hr6tO/mPld6FDUKA49DnrsMSxrXkA4frsD1tD7Y5wjf8ebQEyOnwonFKbjPFcx9K6b89VJQ6ASL0cMhoCv97rGshNNl3ULyuMUI/CoCh/D7UG9wXszXyn7ZB3lfxrgHZdBY9o/pRMmJQV2rMlISuprwKulrHWaP4p8KkuhgZ/PJ1y3mkNxT2fZzFGig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xWDTgrfGylJXQYWtmXwq3u0+6d1yh3BcHOuJFoOveKY=;
 b=bowuA//agupEkeEXSLCUQc5kLg3SXAR4GnYUWfbOVIZu0Jp3+t/j41GBHyp+gd2UD36k0BBck7Pcxf3jKyeMDY22F26DQHzFtcmmmLaLlTkPPZOQsqRSj3IRx0CiF3wo+72c+IXjpRq1YWfDvL3xvMoBDWOUDZBtPhty3n6tktxyd2Ny+13PlvQlGc4WleItGJ9L4kLkQYCDCAuJtwH8Cf3DCGMat/MJ+S5Apv4VMUcr3C385WygulWFq27OusKCaJRaI9Euq34GEt12/0e3jxrA+4KwezI4PFgWzx/wpPc82LxJkxQryaPriQ/jPDhKtRG+UlZIWkHh3vFlDd1BDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW4PR11MB6935.namprd11.prod.outlook.com (2603:10b6:303:228::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.29; Thu, 24 Jul
 2025 21:10:41 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8964.021; Thu, 24 Jul 2025
 21:10:41 +0000
Date: Thu, 24 Jul 2025 18:10:35 -0300
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
CC: Sk Anirban <sk.anirban@intel.com>, <intel-xe@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <vinay.belgaumkar@intel.com>
Subject: Re: [PATCH] drm/xe/ptl: Apply Wa_16026007364
Message-ID: <bp3lfzfatiy2ugw3d23zxlfd3xpmvmxokb3rtxrod3yjr3guju@jsgmrbazj2b4>
References: <20250716101622.3421480-2-sk.anirban@intel.com>
 <340414e8-1e0d-4774-ae82-9b75dfcee015@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <340414e8-1e0d-4774-ae82-9b75dfcee015@intel.com>
X-ClientProxiedBy: SJ0PR03CA0146.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::31) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW4PR11MB6935:EE_
X-MS-Office365-Filtering-Correlation-Id: ba44a7d2-a5d1-43a8-9f89-08ddcaf68bba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CGaPuSRW8u8EneFWqE2JrJv7Do5VXNAymk0rx0NIhfdc393hnXDv6feknw4k?=
 =?us-ascii?Q?v5/YyUzHahsscfAPGFWxnh/ADRGze+xZWF7m1dBIjUQFFqx2vPcBhFvXj1MS?=
 =?us-ascii?Q?xinRHI7ZtQ8b5sR+UYRr590bAA0WsR+fuSplqdMh2d/PsBLQ/csKpUk27Bv9?=
 =?us-ascii?Q?V/bBxH3sp8XbTCAdHJqiEpOCvV1F94ce5y/26iCADiaocFQdrwv7jl98Mdug?=
 =?us-ascii?Q?x6K0J1llFGnuTkDmJ039W2uBbZxfR9z6iQp9Djao0rPhKDDVr1cTj51p2zGu?=
 =?us-ascii?Q?cYQAlEI0dvOpWbkou/7zhJm/PZEhxGChMdzsgVqaOaqhrrRhw58xfeVfX9pB?=
 =?us-ascii?Q?jRmX+mP02BODKjMQLRZYq1oBgEjaDtrsjaJbaSRBQnYIbSFZ5zmmjW8nVDA8?=
 =?us-ascii?Q?01jvP0XlZgce1o2VR4385xrE6vmRXV0embIsfBX5Qw0B/2JrXUkk0O39pSaI?=
 =?us-ascii?Q?GaRjyvhBlSU4DvYfl4RHZHPTCb4+ZrRWbmiCG+oABUh93VvCDHrtfJVsmCsT?=
 =?us-ascii?Q?3cbzFGi8KbyRW4vgEvW40/XngCiWs7wdbjTU1bk5X+dfJ0lMpKko7A3y4fNx?=
 =?us-ascii?Q?577+95KygJkvrmtQlR4hW0TO3zK1M509UUPix4RBACvasyp+dbAMuGaZxEyA?=
 =?us-ascii?Q?8BJgFqbEZEfOjttz6Ufmweuj6503L2m7WG9b1c7NcYWFY4rBG08wWwFsp5T7?=
 =?us-ascii?Q?8AW142km/Sl6HrjWqkONXHahDGYuC8Ow19+5Zc1/nJAng9Vr8d8S7qlNkXlA?=
 =?us-ascii?Q?EOvunkUAxJyOCFPiJ0TNjFj6i/O/hutJ0Nkhm9pN1T61uOg4la2xPwddC71P?=
 =?us-ascii?Q?W/GhXmyz+3kvqDpWgTijybLcZFLy0qWq8jP9sGGHPBL6NtG2i7rvg5a9bqO4?=
 =?us-ascii?Q?EmiwffVIiQyWzjKuhrxaU15T5LkknNRuesTBOxbg+OUYd9Q47mHA0LUWmsnu?=
 =?us-ascii?Q?HF2J5/2gCQoanJmHK938T7UuSio/FW++mZSxEQtGS9CykTH4Z4GVw9Gan4tq?=
 =?us-ascii?Q?ghunAqmLCHqcB8tJH5iFG3J0VGoe1MU1qu1O6dZLvs6WMmsYZmX8poYlGo+Q?=
 =?us-ascii?Q?LmB89ygL8JSYw8QTXCOGHQayIkfdR9fZU9QhYxjQgNK2ljRTfpk+IzAnmfQN?=
 =?us-ascii?Q?4GMnxDxqF4jtRLmsULUHgx9/el6c5hpcZzWLpFGqdPy2sFaEh3eAzJhLf6g3?=
 =?us-ascii?Q?EDJAlIfM+wuzHJRdfswK4Wsr6m8IKSZkVDZWcoImmtlpydt9j9w6h8oagyxJ?=
 =?us-ascii?Q?yIbEP6eRReLnpgzra5yrrPv3DK+MKeqvqYsRXmj/ccJ6xY2m+YtWBJ3M4tHd?=
 =?us-ascii?Q?JEnicjMlBaXLU0xVG7Xt6huAuw12R8i5txnww/0TXCE1bf6X5VTL4YXSqb6k?=
 =?us-ascii?Q?oWMm+0Hdre9T+mSN+317XYbknTAp8TeXEZPNHTff2xqnPt7/lvE/lJRBiBCj?=
 =?us-ascii?Q?nNSui61MWwY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9CqGolHlb9suf24eAf5x1SFHqNMJG29s+eVMsURq7g274FMBHQXSGltr5xWY?=
 =?us-ascii?Q?bF/GLIpvn14lal++eIKvriIwQFt4k+nuYhrJGkPBDyK+m6WsZJZ3UxvbcP8n?=
 =?us-ascii?Q?fnrAhjcfGbgX3Uco7oTv3x5RpgnH33vVSbG97cDft69wI09ZhR4d8f1a7ywc?=
 =?us-ascii?Q?fqa+vSfAub3RSVYercebwhcy9tSGx0+yFo7QH6DpiTTIcLZReYRNiLdGmLi+?=
 =?us-ascii?Q?prk0v8dKQKg/tLPPINjW08B3w0BkL3AelpmBKgwsb7KcE4pisGNzvNJowil6?=
 =?us-ascii?Q?sDdOPQwGdVBAOejXOrcyxKIc47vyQ/yqvMiSoq71SV/i8PLKyDTdZwYFl1se?=
 =?us-ascii?Q?txinRYTb4UvBgI7t636FnRZUE+l4CsvdcVW6qyaVYXLMqauUiVy8WC4autju?=
 =?us-ascii?Q?yWQGXU9Dvajisb2NI1ilCHY2oCLrfesn8xdvLQzC5TIoFvhePQaF+p7ljPPC?=
 =?us-ascii?Q?wT0WvvzqwIj/x1hpnjQWO+VZ/aHnC7fnFASWgOoUu/aYfibbFScp2X5zPEp6?=
 =?us-ascii?Q?G2HvT58u1jvQR90VKyfFAJ0s/RyIHE/jpByMRsVce6OdxSfaGLx1hHwzw8qX?=
 =?us-ascii?Q?wZ7SCMfJW6VPfOOAUCup9onBJvtiB+Lk45BLB6x6NsCnNTyqfg89+3WDY1TR?=
 =?us-ascii?Q?BvMsKumOk6Vv8CbCmUz7/+SjN/qY1/6KCf7/ebQAwzpzTGa5lkekjekQ8jX8?=
 =?us-ascii?Q?B2Cj0h6QGzSYVV2GUWl0ypCZadGJvJ5ydeTYf9SEuYHTLu1H8jJ/cQ/HeupO?=
 =?us-ascii?Q?gB/ruR6OHxqigHeaP5L4ObMR4mirB7QBFqgPtvbOvmQSt3LcTOI3U3xNOczW?=
 =?us-ascii?Q?R2sTMuff6FQBhqj3doXQ21o4d0eWzD/nmIY+2tN/6M4dv1Njwv/EmOWIHi56?=
 =?us-ascii?Q?XB7571TDlECnAb+KXYNoeWvf2VKlNuEGdxmLLnLMu9a1OpJKc1lPdK6Mu2Pq?=
 =?us-ascii?Q?wu3BFYYR4FahBncerXtRnpK+PWvTbnqLValMc02wmNRi5uHV/dath+5znhLY?=
 =?us-ascii?Q?ZuD+vWd63S0kOQCXHYleOXm2isZPqdUN1Fi/TtXn8lhU2zJeRw8tY/HFxrBm?=
 =?us-ascii?Q?HMXprqfMNGG9v3APOea8uCuO1+OOVhzfcF833aFqu2EX+ltqbj6arzb5Dn3V?=
 =?us-ascii?Q?4yfvqMz/QNA5INXqiMXxeVEJNAKrLrMlhWF0UEC2Nl/1qvp+SaiynpSxfR6B?=
 =?us-ascii?Q?Rrw1WKiuly0V9IKTEdBwZLG9SpyRIBig+7NtzOnhvyhfrqYPwWGckglefW/D?=
 =?us-ascii?Q?ln3OW13wdg49f1LNGuS448BQ4ix20QwmYyGftgYJryazz8ZAbjD1XTzZE1Im?=
 =?us-ascii?Q?3fLsSumzoBGTI78mi+hGh8Gj/POzexbKSsN7i7f6u4LS+9sO8yiBh6asEm14?=
 =?us-ascii?Q?A/mG5ujx+qB+ASoDuDdPt9gXNThCEkhELqrWDkmGZMddbTlJWjOPGe4y2zXf?=
 =?us-ascii?Q?VQVPy9cSWfX9QbUXG62IcXBL3eXCstFJZQVWvQGNxWrqL6hBJgIoINOSLx+k?=
 =?us-ascii?Q?BaIkwRCGnsBPOgNIeFTfqGF0sYN+u5CA6l7eFYAXdm2+pDyshrx63Do7p0pn?=
 =?us-ascii?Q?jo5JMsCoVlRW0EFnMJX8FxDdHNOJBjLRSqu4PvmwM+UFxMfAlQCrH9dUDINk?=
 =?us-ascii?Q?qw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ba44a7d2-a5d1-43a8-9f89-08ddcaf68bba
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2025 21:10:41.5331 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FRbBC8ab17D88M9gI1kXHz6y0j59RdJAaw6CIBGRi4PTzefI2kmypaGP/Uw+ekP7vn9tdbpYHgbtuyfOvemPKwThv0wOStrHuWzCK1Su6R8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6935
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

On Wed, Jul 23, 2025 at 01:16:01PM -0700, Daniele Ceraolo Spurio wrote:
>
>
>On 7/16/2025 3:16 AM, Sk Anirban wrote:
>>As part of this WA GuC will save and restore value of two XE3_Media
>>control registers that were not included in the HW power context.
>>
>>Signed-off-by: Sk Anirban <sk.anirban@intel.com>
>>---
>>  drivers/gpu/drm/xe/abi/guc_klvs_abi.h |  1 +
>>  drivers/gpu/drm/xe/xe_guc_ads.c       | 35 +++++++++++++++++++++++++++
>>  drivers/gpu/drm/xe/xe_wa_oob.rules    |  1 +
>>  3 files changed, 37 insertions(+)
>>
>>diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>>index 0366a9da5977..31dbfeee289e 100644
>>--- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>>+++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>>@@ -396,6 +396,7 @@ enum xe_guc_klv_ids {
>>  	GUC_WORKAROUND_KLV_ID_BACK_TO_BACK_RCS_ENGINE_RESET				= 0x9009,
>>  	GUC_WA_KLV_WAKE_POWER_DOMAINS_FOR_OUTBOUND_MMIO					= 0x900a,
>>  	GUC_WA_KLV_RESET_BB_STACK_PTR_ON_VF_SWITCH					= 0x900b,
>>+	GUC_WA_KLV_RESTORE_UNSAVED_MEDIA_CONTROL_REG					= 0x900c,
>>  };
>>  #endif
>>diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
>>index 131cfc56be00..8ff8626227ae 100644
>>--- a/drivers/gpu/drm/xe/xe_guc_ads.c
>>+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
>>@@ -284,6 +284,35 @@ static size_t calculate_golden_lrc_size(struct xe_guc_ads *ads)
>>  	return total_size;
>>  }
>>+static void guc_waklv_enable_two_word(struct xe_guc_ads *ads,
>>+				      enum xe_guc_klv_ids klv_id,
>>+				      u32 value1,
>>+				      u32 value2,
>>+				      u32 *offset, u32 *remain)
>>+{
>>+	u32 size;
>>+	u32 klv_entry[] = {
>>+			/* 16:16 key/length */
>>+			FIELD_PREP(GUC_KLV_0_KEY, klv_id) |
>>+			FIELD_PREP(GUC_KLV_0_LEN, 2),
>>+			value1,
>>+			value2,
>>+			/* 2 dword data */
>>+	};
>>+
>>+	size = sizeof(klv_entry);
>>+
>>+	if (*remain < size) {
>>+		drm_warn(&ads_to_xe(ads)->drm,
>>+			 "w/a klv buffer too small to add klv id %d\n", klv_id);
>>+	} else {
>>+		xe_map_memcpy_to(ads_to_xe(ads), ads_to_map(ads), *offset,
>>+				 klv_entry, size);
>>+		*offset += size;
>>+		*remain -= size;
>>+	}
>>+}
>
>This is now the 3rd version of this function, with the only difference 
>being the length of the array. I think it is time to rework this to 
>have a single function to handle all cases.
>Since this is a WA, I don't want to block this getting merged on 
>having to rework the guc_waklv_enable_* functions, but please follow 
>up with a cleanup to reduce the code duplication.

agreed,

>
>Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

applied to drm-xe-next. 

Thanks
Lucas De Marchi

>
>Daniele
>
>>+
>>  static void guc_waklv_enable_one_word(struct xe_guc_ads *ads,
>>  				      enum xe_guc_klv_ids klv_id,
>>  				      u32 value,
>>@@ -381,6 +410,12 @@ static void guc_waklv_init(struct xe_guc_ads *ads)
>>  		guc_waklv_enable_simple(ads,
>>  					GUC_WA_KLV_RESET_BB_STACK_PTR_ON_VF_SWITCH,
>>  					&offset, &remain);
>>+	if (GUC_FIRMWARE_VER(&gt->uc.guc) >= MAKE_GUC_VER(70, 47, 0) && XE_WA(gt, 16026007364))
>>+		guc_waklv_enable_two_word(ads,
>>+					  GUC_WA_KLV_RESTORE_UNSAVED_MEDIA_CONTROL_REG,
>>+					  0x0,
>>+					  0xF,
>>+					  &offset, &remain);
>>  	size = guc_ads_waklv_size(ads) - remain;
>>  	if (!size)
>>diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
>>index e990f20eccfe..46ad72bb1f8d 100644
>>--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
>>+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
>>@@ -72,3 +72,4 @@ no_media_l3	MEDIA_VERSION(3000)
>>  14022085890	GRAPHICS_VERSION(2001)
>>  15015404425_disable	PLATFORM(PANTHERLAKE), MEDIA_STEP(B0, FOREVER)
>>+16026007364    MEDIA_VERSION(3000)
>
