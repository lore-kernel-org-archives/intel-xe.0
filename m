Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 367E9D262AB
	for <intel-xe@archiver.kernel.org>; Wed, 21 Jan 2026 00:08:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8D2510E0CA;
	Wed, 21 Jan 2026 00:08:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bdk7iAVS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD42810E0CA
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Jan 2026 00:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768954129; x=1800490129;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=oYPF/XTYQvQEyLS4plk4Akf6Ba2azHEiphFAXQzvMro=;
 b=bdk7iAVSHBV3xpMua6KpHE+NrcSZ8YlTTon/Lt0cgvXKwbLf52NmfaTz
 uWn4HuArcjfk73sVbdt33GtK672FGLRZRNA/yaxM+th8DbBnh/sPU0gq5
 dAU/WnPCnIYWpor4U4rejFvhoBPsYln3QIFP6FtDoY0nyflTdPkD+zN+0
 4i5QpRLU08pm1M3uuDVS3JqQGuXHnHf7+AheFnGd3CKMKEvtMu9Yx8o0Y
 iT7he/zQkY6aUb5gf8A5oMNKkVgyFIU3qkiEI/uWma8344KMTcja2p/ep
 +uNhh56lOIfCKYDtTpGgR5eX4CyfBIoiWoH3UE396tvLAnbxwd8EZueCl A==;
X-CSE-ConnectionGUID: HBgniUEiSAKfJNT268FooQ==
X-CSE-MsgGUID: x0uu0m9zSGaL+k8kaW4a4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="70341222"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="70341222"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 16:08:43 -0800
X-CSE-ConnectionGUID: FmgnuKktQmSu3a6WfMTZeA==
X-CSE-MsgGUID: 6Z5hdDEzQve/H8niOE+7AQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="206182998"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 16:08:39 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 16:08:39 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 20 Jan 2026 16:08:39 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.15)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 16:08:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bhwHPUpY/7iWCvcefhYtdBGTXjQe7izVdIu74M/2yxduxcf+JIQEVYAkK1CJFMSt0cEHeFEmn0HXsxYXqzXS9Bfwk9g/1aZZD+n5P6xSdn7BXjFBLDQyMvSxQXNEah74xFTSkDaPPu9nlL3raINHEQQNQJaETyy48WoMm70WyrWH6idNaKZWK5NW92SJuWchAfroNMpuOtvU8ZzjXBWPx4EuZ0Rs+WnUel6KIrCpxwmICra1SDEkfdYTPgAEyVwMmqzCMOOEgVoOKDKM5DS5tGMgN616BZUAuQcRIf31KrDSj9y4I7lcpDr0aqPiYLV6MeuGKrzBZo+GdIEqxrB5Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xq76gOvxuy17OFF1XQLOfHD70OrbVQujvKWb2wko6jQ=;
 b=sOzVVkSDMoxFCEPdHPmZjog8TL57fgDWoej97fpt5W4Wy49SaemXi72snDPpcoy/QxC+RZcDqGodY2GH08NlSOdBTUeS1p/OAJoRvZL/gkFDypwAFdpq7UGWQ6Wu+ByPkdMmQNJ9ZEno1NyJPIf3XCcy8+W7m7GPijIaopBlUiC3P09Ba5SARNgSF8OWP1U199EFp0v5BjXfsIhnXv3fxCcI6z71mmGSxLS5jouRbSMdwhftCDG6VT3PtlpgUlKR8O8aVHoLxLjKSyKfDH3ZXzxMGz6eBY/+1EEWiDGAn0SZoHjDWkcbV9wDUdc+HXLXq5IjJkpcqgIa4XYSxBjw9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by LV3PR11MB8694.namprd11.prod.outlook.com (2603:10b6:408:21b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Wed, 21 Jan
 2026 00:08:29 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9520.011; Wed, 21 Jan 2026
 00:08:27 +0000
Date: Tue, 20 Jan 2026 16:08:24 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 03/12] drm/xe: Define and use MCR version of
 COMMON_SLICE_CHICKEN4
Message-ID: <20260121000824.GO458797@mdroper-desk1.amr.corp.intel.com>
References: <20260116-rtp-mcr-check-v1-0-d420b9c1a327@intel.com>
 <20260116-rtp-mcr-check-v1-3-d420b9c1a327@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260116-rtp-mcr-check-v1-3-d420b9c1a327@intel.com>
X-ClientProxiedBy: SJ0PR03CA0134.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::19) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|LV3PR11MB8694:EE_
X-MS-Office365-Filtering-Correlation-Id: bf6fdee6-fe9c-4c7a-c1e1-08de58813372
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?oxY3MPVyJrfHkqZOkT/cxCaiHdjInEQdtuX0e8PdlEzZipPzVQZ7Mk3EElzo?=
 =?us-ascii?Q?HZXhoSSBEJ0gZG8FUokxDZTE2Pamcd6tjVQDWA0XqehAzp5UkfIe/fjflN87?=
 =?us-ascii?Q?b4kmVcgJRiWX6ybsL21YNu8xizRvw31imOh8pTcAYUXyw147FZIFAAF17qhw?=
 =?us-ascii?Q?73FQJ5sGyfmE+pYfEgZrJM6kOBITxAgGTPplRZupQ3vfxC9D9qg7ovgztbuU?=
 =?us-ascii?Q?DiyW56tm0geSQFQRBSe5XQUXGrxVL0LjNth5XmiS4eZUGNatG92tQM5aQGiC?=
 =?us-ascii?Q?QtlmK37qKsIpvsey706YG19Yw/NENI/qQgxaz2U0D8AxuTOmZKkRXLbaMv3h?=
 =?us-ascii?Q?2SWR8qGsqKDySEgd3Q6EpKcm2f3GErK6DeWfZMFZ7cfEVMNz0v/JgShjoPcS?=
 =?us-ascii?Q?uVfXUAwEfcWp/8ec/3juO0CnUUNu04icxAohfWea8XmjMX4GsyR38/3owakc?=
 =?us-ascii?Q?AQW+LocTghThkE4uBJ0iqBGR82KDbT9WRnTacCbPn+Dh0x+E+6sq+wfEqwTK?=
 =?us-ascii?Q?BMDAJ6XvQy++00zm5Dy3sc2pST2ftkqBnMwyFHdkO5dLHbfI2QskwdQJE4rx?=
 =?us-ascii?Q?2vn4GtFU+HXMi6lqS002NjfIMcc+rppqEc2lLHk1dXdakzDXy5A1YHuvxZ/6?=
 =?us-ascii?Q?o+m6e+AlrCqd74CUpne09l7AXeqYOGQ/BSPA6Nq+ahr0XlrG2CewLGh4iRs9?=
 =?us-ascii?Q?zMCrpD/06NnhSh3Ia5mYNnb5AJ976Z/Rd9Ye3AhciiZsveyWEtJbKL84nUqI?=
 =?us-ascii?Q?zGU/6AshcQfNA/MCFHObvI65uaHMdnH7FESxkEXPGFnN3N75zXCYgMzfoIa6?=
 =?us-ascii?Q?FgCbP3ItghuR/TXLLegnuxQbX/3yTG1crAqZ0P2eXYsuRWGGVUuspOvSKQjf?=
 =?us-ascii?Q?VTgWC/ah7mmA+2tokDZXUKsBMwCU+MpRGrNjML1Q7dxw0o5waXjYDunIAPHC?=
 =?us-ascii?Q?I56a62QKgfp00Y1ExX+YZ9bTuZWZqxW8yV2QNc2QGTMKcoQ1z5vT4gIJAfVR?=
 =?us-ascii?Q?8ku9JooUVnUcuuR21u7RFLGxmdOiE+btFmh2F9WX5LUEqhsYz5R6y/gUayH5?=
 =?us-ascii?Q?4OvXjvIqUUMoX3gxQls/myJ7gSg3c3XpApJp7IMvs5pVHKo9FvPnAKHHPo61?=
 =?us-ascii?Q?SzGU17N/F2y/W2Az2jYo71iEaDAfm/4Kf/+j5NA9LLME+jxnokaUlViZFN4P?=
 =?us-ascii?Q?ZA1Vqz70l2nTN4AoQX+Wq4MQBZA+04e8yyFjyWH2HY8d3pjVSMCzzPI5tjA1?=
 =?us-ascii?Q?T0E7FdTeadGcm7PquTiwC5RYikAe7NI+0E6IbliEAFvcdb7upTYOVaX9yb6N?=
 =?us-ascii?Q?WO5yt/yVqUFt+Nm8TtXwGNteC75sy1fTVsicmMsC8LhUMHLakCmlFsmb4TsJ?=
 =?us-ascii?Q?0HSVL1+74cjddI50F1wonxGylhgNWcHl2f3oMjS2PUl0HWdyZUUkXBp9dDos?=
 =?us-ascii?Q?ZD4gD3fd9bL2kwAEbU38KG8Q1YiYzY7IOHDC4QhSGe2vM1A+doZyYzLrlKvR?=
 =?us-ascii?Q?jYnZsnslaY4TTaM9V80rCY534CMt4cH/iyaLFh2PJ+g0oBsioORC6SVBkxq0?=
 =?us-ascii?Q?0HFFR7a9/dlL7JxXIqk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?L+clUzK6EzKroTwmFKcbafjRKQXVZa9A0nteLg/bTvInl6EukrxoG3vf8G2J?=
 =?us-ascii?Q?oGzQ7PKHiib3NRyI8iONSoYQd6QkL5HQI4MJSZV4XSeJ98QXhEwMUBRWxOHA?=
 =?us-ascii?Q?j4d8K++JupY5yK4J9FshmToXgmbX215gOFgFV9563pDW7uFepK4jKgyolHUC?=
 =?us-ascii?Q?52zKuaj+7t9j94alaig0dyS1y9LF8xE2hNt4rEWiMtxxHQyOcI1UMR41UzlQ?=
 =?us-ascii?Q?F3rpF4Q/YypUFiuiCzZU0ZuWAtFI/tcgB0EqbV1fTe7WwsF+6CsP4LJ5q9Jf?=
 =?us-ascii?Q?uVmPUgiAikLpbfKtH7Ol5aSJphao3o54+4738h/BEXUVMAKW7mk97fvm97+1?=
 =?us-ascii?Q?owO8Iy5EN5CX3N+HsUpe7GHKlWyt1XYa0WW3v662WiIc07P9+Z67PT1R59RT?=
 =?us-ascii?Q?teJ3pmX3NPZbfLxtL8766beaNcIS78iN0rgaPM8cCXTPEmkV2hE+nI3Ig0b3?=
 =?us-ascii?Q?260XuNJFzcfWBHEgTZeMfzc44cGSAsQOSQ9ceWsBcNFg0XLM1ktcsOh5XgjC?=
 =?us-ascii?Q?/gPS29B9VdM/Md7JsNakGK700l2zdUYvzBR0DcdOdf3wKDFQ8628ro0khUne?=
 =?us-ascii?Q?7bGbMa1gcKwzfFW01XDQjHIqa2Lzg7Z0qnkju1uktOo1h1AZR3lpsZ4nRjw4?=
 =?us-ascii?Q?30x3CjmVO37/Qh50d5rkTsAVSKlqRlaygMgjhnOTETnovY/TQ4TR9bEp7zPl?=
 =?us-ascii?Q?QPHRg1Q7yaStJEYZMXJL2ezyWJnBwjQ2H9T6awSRybQLBiGoV6Bltv12V1hp?=
 =?us-ascii?Q?gtsBINFhk5Ab/kLnivGUUCC3DHHdrqxD+0OtU2wf2obrY5gJl1ilWHJI7uIg?=
 =?us-ascii?Q?5RUu0q8cQ14/PeuBvvnwiasXFRbGhiUFB57MPmUcEA7V7NBpCkg4/xlyR2v0?=
 =?us-ascii?Q?RBhyqCU++IbMpb68C9Vvd2vMCMpGHNhipxUmO1npWvgPNm7dXyF74izOxfir?=
 =?us-ascii?Q?z5weaqCkyXaWW1JSRj7pphYVak4ouPQDEHjWvF2fEY4gyG8Klf+V5biuz1UA?=
 =?us-ascii?Q?Y5ZedEafo9mTr0gocIXi2us/7zjiJM9s/iQiBqp+wKZpHIHdcxpW+0lEV7xI?=
 =?us-ascii?Q?vzfKeBaU2XBf2QG3+Wg6ZNR0Lr7fNiHtJWzfnt55KQ4/aEQkqCjteRmAKXC2?=
 =?us-ascii?Q?rEdrBhiE5ymYddVHqAmiHOuCfW9CPAFfMtqr7uQdc0jnEvxspi0akYd+MPCZ?=
 =?us-ascii?Q?JFiFMd0RYXPKUVFcP3Iqj8JX0QCRcJSpTE2/60WFLjM999p6zqyfSPO/WGmc?=
 =?us-ascii?Q?amZ4lF9ZIJT7wSngfpupI2QRQ53bWpX6Mjbz5J9hb06tdRXCFBHq7uFheNDq?=
 =?us-ascii?Q?JkjSA6MAu5nXo3UbBTxISW0a9IyICtk1HmryzRZKkU7WzLKHHlGgOZ12KlV3?=
 =?us-ascii?Q?rfVKLXZI6FWkC5zPBwV+1sasquDQCxLVfq7dVQBFhR1hLMj8PFZS9Np6AYTn?=
 =?us-ascii?Q?6VQqGz0DO265UnvREfmmapT6cr1AxpL/mgbNH+79y/m8nfhOOuQLg7yQxm/J?=
 =?us-ascii?Q?djhUVeg/GReO3XswxY5YOsZXCoB5lpVdv+5ieVy+IXhyqJxtMCrDvWAOvnjb?=
 =?us-ascii?Q?TAmYJ+OGYGrN+RXSXlqhV3Vsu0KWFVKVf9Km5AiYPOfgxh8JuAHWa3uF+sUO?=
 =?us-ascii?Q?+M29EbWjXWuLbrDmas7fT1gMdzWdnace+QckU0m3/vUprveV4v0AtW/txjGF?=
 =?us-ascii?Q?Trh0N6b5NHe4secnZSRelNiRcpjmPzKX3BQOkBSrsCqWbJLngUd0sLLnBa0Z?=
 =?us-ascii?Q?parYG4X0uUdlGMogYqVZf0+OcS3OJik=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bf6fdee6-fe9c-4c7a-c1e1-08de58813372
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 00:08:27.2380 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DfYEnmsQwxzANBAzEbQDK3ypxxpXC+nZVrWcYDQJUVDZbwPIWvsgLkHkL7RwaJtTPOusN8VZ3GMTnGRRqo2+tYreWeQAGYKEgdB5gnDEc80=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8694
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

On Fri, Jan 16, 2026 at 07:12:11PM -0300, Gustavo Sousa wrote:
> The register COMMON_SLICE_CHICKEN4 is a MCR register on both Xe2 and
> Xe3. Let's make sure to define a MCR version of it and use it for the
> relevant IP versions.
> 
> Use XEHP_ as prefix for the register name, since it is MCR as of Xe_HP.
> 
> Fixes: 8d6f16f1f082 ("drm/xe: Extend Wa_22021007897 to Xe3 platforms")
> Fixes: e5c13e2c505b ("drm/xe/xe2hpg: Add Wa_22021007897")
> Bspec: 66534, 71185, 74417
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 1 +
>  drivers/gpu/drm/xe/xe_wa.c           | 4 ++--
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index d4a1bb1edc9c..f129210e8e48 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -168,6 +168,7 @@
>  #define XEHPG_SC_INSTDONE_EXTRA2		XE_REG_MCR(0x7108)
>  
>  #define COMMON_SLICE_CHICKEN4			XE_REG(0x7300, XE_REG_OPTION_MASKED)
> +#define XEHP_COMMON_SLICE_CHICKEN4		XE_REG_MCR(0x7300, XE_REG_OPTION_MASKED)
>  #define   SBE_PUSH_CONSTANT_BEHIND_FIX_ENABLE	REG_BIT(12)
>  #define   DISABLE_TDC_LOAD_BALANCING_CALC	REG_BIT(6)
>  
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index a91db59a3d0a..58c37250479f 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -848,7 +848,7 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
>  	},
>  	{ XE_RTP_NAME("22021007897"),
>  	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002), ENGINE_CLASS(RENDER)),
> -	  XE_RTP_ACTIONS(SET(COMMON_SLICE_CHICKEN4, SBE_PUSH_CONSTANT_BEHIND_FIX_ENABLE))
> +	  XE_RTP_ACTIONS(SET(XEHP_COMMON_SLICE_CHICKEN4, SBE_PUSH_CONSTANT_BEHIND_FIX_ENABLE))
>  	},
>  	{ XE_RTP_NAME("18033852989"),
>  	  XE_RTP_RULES(GRAPHICS_VERSION(2001), ENGINE_CLASS(RENDER)),
> @@ -868,7 +868,7 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
>  	},
>  	{ XE_RTP_NAME("22021007897"),
>  	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3005), ENGINE_CLASS(RENDER)),
> -	  XE_RTP_ACTIONS(SET(COMMON_SLICE_CHICKEN4, SBE_PUSH_CONSTANT_BEHIND_FIX_ENABLE))
> +	  XE_RTP_ACTIONS(SET(XEHP_COMMON_SLICE_CHICKEN4, SBE_PUSH_CONSTANT_BEHIND_FIX_ENABLE))
>  	},
>  	{ XE_RTP_NAME("14024681466"),
>  	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3005), ENGINE_CLASS(RENDER)),
> 
> -- 
> 2.52.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
