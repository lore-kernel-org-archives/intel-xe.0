Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45849E7716E
	for <intel-xe@archiver.kernel.org>; Thu,  5 Dec 2024 21:04:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 019FA10EFA8;
	Thu,  5 Dec 2024 21:04:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EwqU8U1N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 034B610E5CA
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Dec 2024 21:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733432688; x=1764968688;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=byZNLdKeQx96dw6RQmYT+hxPfKZvAw6kJoZcWjhQds4=;
 b=EwqU8U1NGay/PUuSOkEGEJWuhOMDI+ZR5tqSTzduq929zJsa1M2yW0bY
 hijSbdbPdYjapbKJtaqT07V7l0YhaD+NpZgp9WGT/BqMhB1BdHXOZUErq
 M7ycqi384AUDcNVE8IFG8c+1TiOLTgYklvg9A+WoWW56gcSapi0iG92HY
 YCyEpnE/TfpSIlJZrwCxpQMrvQmI15EsQX0d5o+DCHyVt27UM57o/XCWQ
 2dlXOG2hw0A0mpvwh+R+N7zzWUssNSIfg8OYOZRUYvjgoW3f/+NO+YVC+
 4ACBjkJB8C+Azqovvjke34PeVjoyEmLw9YItYEX8M5e9ABnRa3vNRDuaj w==;
X-CSE-ConnectionGUID: Z2KSgjsyTMqXgYN+Oy7bog==
X-CSE-MsgGUID: S7+gGcZfRjejuQMK3Y/dxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="44797174"
X-IronPort-AV: E=Sophos;i="6.12,211,1728975600"; d="scan'208";a="44797174"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 13:04:46 -0800
X-CSE-ConnectionGUID: fMEVHcpZSGaLIo7aDLqBUg==
X-CSE-MsgGUID: pCa8rzq2SxO43BVoXXTVHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,211,1728975600"; d="scan'208";a="94655117"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Dec 2024 13:04:46 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 5 Dec 2024 13:04:45 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 5 Dec 2024 13:04:45 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 5 Dec 2024 13:04:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RcZjcHweNAAHgR5gRBmlSXtd51RTHQQ3nofrWokfWRMlq6Jl+7Zu7aBvaAe17JxdRt9T0180TXCHtBuII4VVFU74YOD8nl1H6mra5aP4dMEZP1VklFNd9N0j2PLZ9St587p9UBGNAC6kGm9cLQWcXYDsbOWRpOyRWETvsvfUP4wm6pahPxVqQ0s11ZnBwOO7bXBZsUmJW6FmGGMsCrTVomKwsSAPLQNh2qaJF1Ftht8JWJfaf5chT70mZyuE9IIVRliJ8y1SMe1Yu5/X1wx9KhRpLK/GSKK2/4qOCuLr2HX261Kh/113dAZMPV7k1jjd4dnaWieUFTDVWoUllmCaGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JmQqwkO6gEpLw/d+t2SSHupZP5qnIhLi/mcmCcDqp/8=;
 b=sISv/vL+WczWNdv8c4FG+eF7rbeh/7wrI/FyrJZU2dzOGnt2MAQqcH68zZrvacgMT3ERYb+83KmfjnJpw4IG7yeewoRCBMCU8u4mQfSfXm5ouuWDZewuF4bjGtXah5vilK1gqhYadKB5O2o5lLeYwStdmkfo8g39GoycMF5EZv8ZhjDSngaH5g6jVt6avmeIoHQlVvyJnEKSAMsCThTmv9XKdZSFiUrJmlKGixa/7StHIFLi3TLZM2lw6iwr37JsNIqs1nypUq03SGohKQsk7XnOHEWKuZNQMHtbTkKqLoY8GksdP8TFoz/BUMHEAwH2VWOQYGP1wtubtYtCjjmqZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by IA1PR11MB7869.namprd11.prod.outlook.com (2603:10b6:208:3f6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Thu, 5 Dec
 2024 21:04:39 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%5]) with mapi id 15.20.8230.010; Thu, 5 Dec 2024
 21:04:39 +0000
Date: Thu, 5 Dec 2024 13:04:36 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Jakub Kolakowski <jakub1.kolakowski@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Adam Miszczak
 <adam.miszczak@linux.intel.com>, Lukasz Laguna <lukasz.laguna@intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Michal Winiarski <michal.winiarski@intel.com>,
 Narasimha C V <narasimha.c.v@intel.com>, Piotr Piorkowski
 <piotr.piorkowski@intel.com>, Satyanarayana K V P
 <satyanarayana.k.v.p@intel.com>, Tomasz Lis <tomasz.lis@intel.com>
Subject: Re: [PATCH 2/2] drm/xe/vf: Don't apply Wa_22019338487 for VF
Message-ID: <20241205210436.GH3224633@mdroper-desk1.amr.corp.intel.com>
References: <20241205181814.1484975-1-jakub1.kolakowski@intel.com>
 <20241205181814.1484975-3-jakub1.kolakowski@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241205181814.1484975-3-jakub1.kolakowski@intel.com>
X-ClientProxiedBy: BY3PR03CA0027.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::32) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|IA1PR11MB7869:EE_
X-MS-Office365-Filtering-Correlation-Id: 65f15c41-0ba0-4936-3bdf-08dd15706ec8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LSJwJYzzY5G0TFbPMsYvWQA1RR6/EuaUm3rfQFZ3+bFwO0bMMJ4JsiAdl64q?=
 =?us-ascii?Q?O/wT69tzzaU+4Pnn+SJehQ/0t1hmxnSxmVR8Qs5n/NYZID+5d928FRDM/aDZ?=
 =?us-ascii?Q?kZp2XGyPAEVq0cib+/VfiGZ7aq+4gi2P5onF/Eszoj2OmzknrqBjDzjGC+Jf?=
 =?us-ascii?Q?rG5yb+8NyFkTHssQGSc1Ub93OXOVaktOr0s3kNXhXVWkBLKEZVi0fMLIEw7L?=
 =?us-ascii?Q?eu8RNr6IdnCK+NmOVu537UxfSunXnzWRZbw+58cXcb5AXABdgBMhwda4WpHh?=
 =?us-ascii?Q?D1BdfELzDyK6qZzib/KZQy0mSt50EpzGOpxusH7dE8dELF6yhoPKkMLr32+d?=
 =?us-ascii?Q?ibAGTth+t4r1RkLyeIEs2ublGz4xHDM+Td5J3a8xoD1HyKUnGfZna3xaHLp7?=
 =?us-ascii?Q?O/hng7xyNbzVJW1rWGbfsXXb6PoL7Xoq+hnUnEmBhnoa3ud7GPvZTy19D5Rv?=
 =?us-ascii?Q?85wHvYXIHd12smQNDWHB6bmTANFvZ3N1/s9xNxktOUrczZ9lZungUt7gJUfz?=
 =?us-ascii?Q?NrA+jew6m5WIYZyg76IMc8czyl/18mM4/UvgTxCKBaB9J97a0OQDwxROeHvd?=
 =?us-ascii?Q?xKeTx6vRF/079bxRqJ6h4Dbkwc7uXqS8GBcavB02kJlVnhQLgGJSm+4HH/zd?=
 =?us-ascii?Q?4kFwciLWexi+1osZeKV4RV1orm0euPva3kmpFU+uJ1oUXY6ylE/hlGuMZlwx?=
 =?us-ascii?Q?VVbccTBycbld+22qN3KuBK10/0Uc5gAQU81CI7VNuMl89TcH3593DYEKEbsG?=
 =?us-ascii?Q?SQnXr5PiWWgV7qWW0X3KlBKi26jzKhMGEFwnv7D+UKE9t5QhARWuAH7idmv6?=
 =?us-ascii?Q?jJnNiec0D6K6wVVCJyn0pMcZBZzjDPzNVY/R4z9ydKoY2i+LY+M8w9OA5bHJ?=
 =?us-ascii?Q?TnA90DFek6ceIdt6/0KXmB5F8fjPX+00YL4MJULaO7v/JzRud5ItmpTzjd4B?=
 =?us-ascii?Q?xHVkvuYy0/deO6J7jMNhyQEzZQQ5uXiRzNcfI9tWh02H7WSE6A8z5CpFlVZS?=
 =?us-ascii?Q?eZIu76ijpd3rc1BlRJSkGanOUUzh4qSVKu2f37j3LaN9iqne+5uiahnpFHqf?=
 =?us-ascii?Q?mCmcAxSLfZ+weGFtU0BxPgodtmOx+dDF/ZT1UQN4wqzAfLtTtIzur2e0zSB3?=
 =?us-ascii?Q?vthb6B9G9tPZacd9+1LIoVPJDZxbYViANerDA+Aqg45Nz6p6ylLTw6+j9Q8m?=
 =?us-ascii?Q?/T44asCR1vwEab6ECgG4xMqU+AqdW3jqR3M80CLno2j0GwVztsTswBkzjVp2?=
 =?us-ascii?Q?zBryO0iLUs3voY+Xkd+Swa7ReQhe5ZQj37RntQowS/do5qoyORLE8jBAU2lA?=
 =?us-ascii?Q?vEDJg10/N3HY/av3TCN4ia13Pw1gq/9bfFtv0j1v0mcH7Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FSmv717tQBoYkeEKGOVrXQ8sG0Z3CLEvIoR1gsV+645UpMPdXIdfjGLS0Q6+?=
 =?us-ascii?Q?RVzCPhHAGtfRIxioKSx8Vw8B4XVJUcLzqSFVaWwuXbwm8LPw3wWYifDLWeBA?=
 =?us-ascii?Q?0rDNJZ+bo6jQAHTRlFJG+bYIF1epBZcz6VsH9/ouuL3OgMpKMsK/IjlmKBWl?=
 =?us-ascii?Q?OBSZSvLUw82ygXoOjCxPplA0/Vpgqcj0kekWBQ70wr+qChlVaTAwQ06tGckD?=
 =?us-ascii?Q?5wc579NdCQp2F0lxc7IQEISECnQUSEwQ4Q8nzZBxfRynChHiJB5I3H8Vtj84?=
 =?us-ascii?Q?n7Fiyby+hfSLvZe3TJvPbTJbqZc++Jdf5hkuCSIGanMJjOAcg1dVcelcoUk/?=
 =?us-ascii?Q?2ymg/ZX3R7pNXowCVtbqZooZzDup5zcb03+KIXZMdY4/ni739wgwQHk1m0JN?=
 =?us-ascii?Q?rn91zLntLDQ1gD1pdMya0N1zktvh/SZw1YlXegygZSMNyuHA5cwr5QY9y0/v?=
 =?us-ascii?Q?8Rq8cLGnBXoiz9wHhuz43ghtwgdj+HUlj08qQeyXxiLq63M2QB5v04rbZy/U?=
 =?us-ascii?Q?jgtLHpxb9dnsXV2rZvk+evIK+jXyngK/aV6kevxbDRf4SlEKCpDbVRSQtc5H?=
 =?us-ascii?Q?QXkYJtCdsabAxJIK5ESZdZYYDZyHzNJsmm9gmzfZEVVGcGP60PtxNc1pkrT3?=
 =?us-ascii?Q?+ok2l25hBxKEnJh2YS21EVH+ru0LbvdgScAziJ8uECeZd7zFtHPvFleO0Re/?=
 =?us-ascii?Q?jWQYn7YvcZcF4sW7km6YcNkONJsteiQl3JxABhTio+MSHWdfw7MxtLLGAJW7?=
 =?us-ascii?Q?tfUpfqEMw0R/syznuZLpZcn0Yz9Bu/q4x0zt/6oDEk17bD5EHWns0GgE0Nq3?=
 =?us-ascii?Q?rHELYuXaW7quDUkTX+R2+WZWhkWJdH4PX+psP6bgY0l75xUn1Sg5hJvbKDRY?=
 =?us-ascii?Q?xehvlSmwszOc3418RELc3j7tQtx5JvYmmt7AYQ66z3zrUNrzDNgNrWlKC2Pu?=
 =?us-ascii?Q?qXWVyBcv09EZwIb1uzheSdQ3EQ0UDkiqB3CUTLS2+Sfbke2hZIfFpUbaMXyZ?=
 =?us-ascii?Q?gTIq5Ypn2sHcdIXgoATHHFY0mD39Aq8lDahBq5EEsTVvavecLFHvczTlvn4q?=
 =?us-ascii?Q?TX53m20KICX/pTPSIipyEsr0raol7JtynuD20HMmAUsiF6OrhgqZCyEoe2tm?=
 =?us-ascii?Q?70+XU0DrkLAmkDnvlXdE8z5SHRY6yo2Kph/eUykuwEyRD9V8xE7pSe+RK2RY?=
 =?us-ascii?Q?5FQpDOJMvhlg5ER/GfFwwHGDtI/xi3RrSUntv7KN0NdhCmOBP/P5QgyeABo4?=
 =?us-ascii?Q?vrFtk6OmLd5cTGX1vYMoZPl78CsvbPNBQboSOnnPE2LnhbSMmmExSbQfrMwL?=
 =?us-ascii?Q?r2PeNf9yMH8y8EU+gWJc8sPkLXGrezRb0ba6bOuT5CgcHz6cXQJrwDSmqeIf?=
 =?us-ascii?Q?7aMMcxx/wn6HA9rO2psg/ig1JVPd17PUQ8/wdmJ0GiEQ/Nm2imgmxJshbfR9?=
 =?us-ascii?Q?Q6GUn81m5LoT6UO7UPqqbU+gHeIwGBkd0yj35WD3M1lYVFE4m2hWf9RREBQF?=
 =?us-ascii?Q?4DBgxMwh2xyVZPcuxS6fS8BoV1kTbKJyhlDopvz8aVPcRes0xpUi+4God3B/?=
 =?us-ascii?Q?9fl2qWLTUeo6KhrZwmv8Dvsc/f/nuFyFIBOTE2GrmP48T8K5YTWSRNdAoSSt?=
 =?us-ascii?Q?Pg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 65f15c41-0ba0-4936-3bdf-08dd15706ec8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2024 21:04:39.7283 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yFeGWLBTdiMCC5q/ZoXFwvAMlPYC7zU2F3dficCkV4oCNG0C16LATg/T5yo3qKfbvbSiRBTUrDCbQwsahm6++EzVPW9ycrSXgFKkfXA0Dew=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7869
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

On Thu, Dec 05, 2024 at 06:18:14PM +0000, Jakub Kolakowski wrote:
> Don't use Wa_22019338487 for VF.

Would it make sense to add some kind of "PFONLY" RTP action that can be
applied to workaround definitions that should only apply when running on
the PF and not on the VF?  Then we could just add that flag to this
workaround in xe_wa_oob.rules and we wouldn't need to change the
callsite(s) where XE_WA is invoked.

I'm not sure how common PF-only (or VF-only for that matter) workarounds
are going to be going forward.


Matt

> 
> Signed-off-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Michal Winiarski <michal.winiarski@intel.com>
> Cc: Narasimha C V <narasimha.c.v@intel.com>
> Cc: Piotr Piorkowski <piotr.piorkowski@intel.com>
> Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Tomasz Lis <tomasz.lis@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_ggtt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 05154f9de1a6..11aba2437818 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -238,7 +238,7 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
>  	if (ggtt->size > GUC_GGTT_TOP)
>  		ggtt->size = GUC_GGTT_TOP;
>  
> -	if (GRAPHICS_VERx100(xe) >= 1270)
> +	if (GRAPHICS_VERx100(xe) >= 1270 && !IS_SRIOV_VF(xe))
>  		ggtt->pt_ops = (ggtt->tile->media_gt &&
>  			       XE_WA(ggtt->tile->media_gt, 22019338487)) ||
>  			       XE_WA(ggtt->tile->primary_gt, 22019338487) ?
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
