Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B725C71148
	for <intel-xe@archiver.kernel.org>; Fri, 13 Jun 2025 20:03:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CB9210EA4C;
	Fri, 13 Jun 2025 20:03:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UWENKIH/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB63B10EA4C
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Jun 2025 20:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749844995; x=1781380995;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=XnmEB0pF6vwml7NRE27+DBtaQeNOqPJH5PX2Vix/6m0=;
 b=UWENKIH/dy3H3gprfQnRrQWzxK1M/1gkSK3/s+0pUlqKzv2h2uN9PJCU
 0PRgpm5QIkYFhlgkh5NKQCVxNdQwgWJYEnb5RTElox1V4TWdGVUYAdhHW
 zWlo2ZEq9dmvP1z2LV76ekxRNdvJP/Y+lc9Q+3+BmFUqXaZoi5IyY5NXj
 UFUEuZShU0fpC/8KA8fMXP5RlQl7w40dIrq0HAD+GWPO1QuFNd1yiTUf5
 ZPpRbXfMzaeXA6Z5isAyMt22PSwA1Mjlgv7t3GNAFrAH+KF48xdslm4Cj
 z968qa76SwLVpxp7KdFSCucDHF8i29WUi7i8eKt6L2pVR4hbWdqqrOzLf g==;
X-CSE-ConnectionGUID: R2wupubxQGa0nYNYvMc+4w==
X-CSE-MsgGUID: KOhLuxdCTvGkuT0NExQXBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="52054671"
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; d="scan'208";a="52054671"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 13:03:14 -0700
X-CSE-ConnectionGUID: QaM5O//VTpeyoxpDndA8yA==
X-CSE-MsgGUID: WxOZuBgAR8uSIzJUmFytrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; d="scan'208";a="185154727"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 13:03:14 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 13 Jun 2025 13:03:13 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 13 Jun 2025 13:03:13 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.46)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 13 Jun 2025 13:03:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RsXWPDwCLYoIAbX4S6gqXyCbwFSc5NX4dR3iTrGDEQwscKwidHyo1+h2fXVX8mqDObx8fGiigSyYW8wPt0RG9QKkZJNebkps61HyWfm7K8eYPZDVxITbCFrm0pJH3PekXRSlyl/90unRoPz+FZkZuWLZOYjC9qSKJlU/SHMeZZRsKYL7fG2TOA9nqonVw7qPIt04zohQ0gC9f53oaVC4pNQi0+uo+RuwT01bm8s3rHLE7wbKkLm6GsQk2DpZ1dZwsNw+ZPv1ESxLK6jcjJDSFJL7m0jX911F51OfdDz/ohlTG6Nz1+1vpPNkT7vljgnhJE6X1+YcSabWUhL61PrPgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PhVTnrC3RZ3zEM5NqpenG2MEZuxyKLkXOdpPXNANSZA=;
 b=h3fbtEY09KSoMDHyzzKLS5y8lKId43UCFjnlMVc74T24UL+pEkBiTSbizpViBf9CCyiksRlzSJf2q76Rn9d7b73IDbi8UwsUWTNZk6TpKeLRHja9vmx6u6Qawot9R1t5fXpMaZa+6JW6yaPcyEdUrPb3fNDIK8TCnTQ3bF+mgeUKBG+6pSEcyB49FVQoTmgaJUyQAyvDP0VpvWeyLn5gI2rsPPPe759ITFmlZ/BeNocD596DiWh/2GQSRoEH9mBdW43OGt/TM1w9w1OnpunouGQfHzu2uzKJS+lzpFbhnHM+NAkpQ0FH0aa/fR8+iroQxwxul2Vzx2BENyiN0sphMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CH2PR11MB8867.namprd11.prod.outlook.com (2603:10b6:610:285::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.23; Fri, 13 Jun
 2025 20:03:10 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.8835.018; Fri, 13 Jun 2025
 20:03:10 +0000
Date: Fri, 13 Jun 2025 13:03:07 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH 2/2] drm/xe/tests: Convert xe_pci tests to parametrized
 tests
Message-ID: <20250613200307.GX5080@mdroper-desk1.amr.corp.intel.com>
References: <20250613191938.1980-1-michal.wajdeczko@intel.com>
 <20250613191938.1980-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250613191938.1980-3-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR03CA0233.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::28) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CH2PR11MB8867:EE_
X-MS-Office365-Filtering-Correlation-Id: 37ba899b-ccdd-45f0-380a-08ddaab55248
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OW16UApTeWS9MdR/a8Kwm8K7N3CrZWR7ToCSARL4XcSEB4GQmR4bkrGz6lHH?=
 =?us-ascii?Q?80NImwajprbaR7cNTBdhki33Ib/zzuog55Yr52V3YDYzI3V1udHlnfJpqTo7?=
 =?us-ascii?Q?sM/wmtEjl4ZCvKjgnPrgSAyiNd9YEmXW3RQwx50STuSC+OWc86bfRXxV1mkc?=
 =?us-ascii?Q?Hn5GUYg2Zz9lyzloNimial8S6KP4150GSM1lUrGyjcqk+DgR/mFu6rDhYEWR?=
 =?us-ascii?Q?2lMbj0PjwrpbMIOyy0vBlN5PDI4r/ASSlCDKtSX8onleoCaUF3hT9YOQGVeB?=
 =?us-ascii?Q?2AWFj9ImG9SRhfKNFt1kBhFT3vJY7sDIE8yrNhjEPFx5R2NyBkhC8VGKKLSF?=
 =?us-ascii?Q?uSk9XHSgtRyNhph9kjWFOIHcqV+8VRAJbDoiEVGtn0QFEaOs4YTI8aqyu3n0?=
 =?us-ascii?Q?BNjUg7jInYYdVfHwS7XdGsUZJN2ueQtS3rWSESk40azvRgffE2Oq+y+tbQ71?=
 =?us-ascii?Q?hr/5aFdvl9DdudFEQQJ7tzD/mO1eSMo4xmXQz19QQ0k0KDJIUkNdD9f9Lje2?=
 =?us-ascii?Q?ncZubuINYYCOzdAri99FXgjYcmjMIy3lZNuAB5a3HhE8J6b0TpbySIx6yBxj?=
 =?us-ascii?Q?u7eDrzHXpARTAqqpST3Ya9e872mUqXkisktPcFGZhyztuhsbxOWsNRgxewxw?=
 =?us-ascii?Q?6SmhH2TCxFu9FkOWkICj/svmhf9xT4oM7OZKXkt+cOwekdMo/OXFEQEH9l3y?=
 =?us-ascii?Q?DK5mBSoAZqY77yz3B3c1fbOj2IfpSrvs8WtFSKxkDdoZTuP0wvP6/3p10DhF?=
 =?us-ascii?Q?CEjw1d883BRKqVNzMbmrm7u1lZyMxwe+DU4x6r0C91T6sfEb+/M1EhUKKHGf?=
 =?us-ascii?Q?PHD5v+eXzBioZtuqRDzxgaltdpwivjHRLYOJ9n0ct8bkkj1dJWELuGR1Xumx?=
 =?us-ascii?Q?0RyIBBr0BZ+b10tjUYOImyp5kmc7EzKxW1htV7N6J5iUdcPKXFo9YDlnUuAf?=
 =?us-ascii?Q?MhIfCn2lAZ40asHMFxl3XQEKBgElz4NnZUVOt/xt7pPHnLII9dCWWEgPNnmW?=
 =?us-ascii?Q?C51tw8WM0qBp4ePyLvjfFQa3rbM0N0WwDdBXakOKNj1Cw8sTsrYw9+jLAeWL?=
 =?us-ascii?Q?fDET/MCpnVvde8es/9rd96xMakDEFMMMDu1Otlz0T5t9OHHaI+A9Bwruerqn?=
 =?us-ascii?Q?s2DcioMGLXOZRHu6vCjUqMFwPU54/2OKupnk3H7x6EBuDtUOYyWVpuxQFmrG?=
 =?us-ascii?Q?QFVy97dZHWlr5oucYC08ceZYG4eT5bWMTfTCROngUipK7bcJ5dxSXa8jiBuO?=
 =?us-ascii?Q?WqudTIhc0FzsPsmJn8i+59eECqPcAcCSJK491XXjKNoxA8elusvuJ4XkFFTZ?=
 =?us-ascii?Q?fciz/1NdDSjXlGxgRFN5xYtutnYdF+sG2hLzixaRaXBa+gjKREA0A0O25FTB?=
 =?us-ascii?Q?PD6KvqA63ttWr7OrO+9bQ9Id1j9cNdy+pn54Oc4oKKA6Em8rqPzU/fuqIe8o?=
 =?us-ascii?Q?sJG2LvlSwIE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7oT2IufSQoCSUQUaYGOcPeGnOBVLtU04Bg//fn7y7uzQWHBlIGLW/xLKhRQ+?=
 =?us-ascii?Q?cg7bQOGT/NmAg+gEeF+QJ9eZfVu5aRZ4iZFzJt2vKRJsCea4griGeYTVZkA6?=
 =?us-ascii?Q?aBJWRAzdvWccJSbVK9N1uAmo1PZ1rSakeCFM7+leShOkEvsZr5SspxwXZAzn?=
 =?us-ascii?Q?Pgp4zjxGolHlieTu7BOd0b1tJ8H8OX32Utyr9c3tn0S4xAd/6WgzZ2h6rfzo?=
 =?us-ascii?Q?6vsEm1xvDtiBSl9Zh34590PQpIuZFSKEWIPl+dPPKnnPrqDgdi6U01fyy10z?=
 =?us-ascii?Q?nMbeWoqPuQt2C8wQJu2+VHGi/NgL/KWAxtCdllodfrOgt5LEwXkysRQyy657?=
 =?us-ascii?Q?xXh7cqLbLKDW8ntiWR18V76aps5q51FgR+giT6P8yUAY4JgEV3pPlYabxvqT?=
 =?us-ascii?Q?uYOahY60Lg5HDNa3Wpyma/5buhXUSJrEJVpfXsgMgjSOj+crNqkDaZvFKJ/+?=
 =?us-ascii?Q?ee1AP8klhgAXdCzoXEN7r56gZdn8tLa7sxYHciLvhPFmiRYSadIjJxOZmJnS?=
 =?us-ascii?Q?MTXEB1iKCUX32/RY4u6dw4x7CZ+1iZhLNJZVZNdRODDxNoUuDCrL3s2rLVdj?=
 =?us-ascii?Q?nmwhORxuOXpeYGo7S4Q8rlb0B7B1qVi9bCxuqKLWWYuFtVHa2XHZxE7VQeed?=
 =?us-ascii?Q?bwXb4XAtHBmNSR56rDczCAC1OUXkzxilUUMoJlSxzsgf5sPkglAmX4YBKd71?=
 =?us-ascii?Q?Yv8k8aAE483v9oQg4yhTivGjE90mT36ZVFkLUqUrv5QPN/zW4OfkzxpeTw5Q?=
 =?us-ascii?Q?pL5jn1ik2zzqLY6rBVSJe8bYxYtH5gb8QndpRwAd/Ri/70vrOjExG7BbFbo1?=
 =?us-ascii?Q?Wnoh0Kbi5w7woXGeo1mnINmojTLr4C2L+5GjLkEZ+E/Px0XSVmlbsnGd0ukW?=
 =?us-ascii?Q?Qgrxfpj7wd6Qn+ap/udH2zKqkbXWyd8qTRmwIgPYKibsk5sNPJv+eiw/ZGTT?=
 =?us-ascii?Q?6XOukqKqI4grb1Q0ksZg270zblaW4r9AYkmSE6WEqoEZn4msCXaxOyy2BWPj?=
 =?us-ascii?Q?3gCbHo6oWeAvB1Ez5OC0osYSIAIDE1OMPDnNplSek8kR08/zyq8Y3GTtrygs?=
 =?us-ascii?Q?D2sGAnhSJz5lUpUjtXMamy0EHL+5Vlxgm5CO9ITZ55q29ZKnF7vmx/vXZPs3?=
 =?us-ascii?Q?xhdTW76JlJBlmwgA/aL95SeiaJPoJzH7hOo00BsrFVg8uYammvRub+g/76cr?=
 =?us-ascii?Q?N3ZK4TzDK23OHdZjBLZsUHTNRm4i7KfniXDnE/v1qxah7/CHJQQ7YfZxL7kD?=
 =?us-ascii?Q?jTYs0v4OqZLWQ+eOc3Ej4rd3LO1ugZXA6M/qaWcQusTe09ZN75NboeCZAdOY?=
 =?us-ascii?Q?dQGM1S+DalS2EQjU7yrnjvqLBuM4qXs63SxZaRqlJem+0fGzTBjatVEmAE+a?=
 =?us-ascii?Q?reqwDNVPiettgw0Zip0gRJZ8MNWxe3xEb82D164QEAXsbJi/TlfMLckAVks7?=
 =?us-ascii?Q?H9WUstaflptt/dTJMCAVoEuG8zRlBK42CIX9WghnwCy7YrvDndZxYH9HJBya?=
 =?us-ascii?Q?ZPpiRVJS2JRJxaB7gIqJyR/Wq320HQeE7LFJRQVt7TsMG00mrIqtG9O5hhzk?=
 =?us-ascii?Q?QZspl3sttPuX45drN0LBTPiYDvcxhhcACVxIqdARvWyPytkkoC1w/tU5UvEM?=
 =?us-ascii?Q?Kw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 37ba899b-ccdd-45f0-380a-08ddaab55248
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 20:03:10.3910 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nv/vT/g05eJT+qvhcNL31athtmj7HC3narjKM32juj+0DRqz8LgZWTOaBd0mLzgcl+S7NHiDt2virJ/TT2NdKsyaYlIkju3AjU2bvI1eaWc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB8867
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

On Fri, Jun 13, 2025 at 09:19:38PM +0200, Michal Wajdeczko wrote:
> Instead of looping over known IP descriptors within single test
> case, without any diagnostics which IP descriptor is eventually
> broken, define kunit parameter generators with IP descriptors,
> and make existing xe_pci tests fully parametrized:
> 
>  [ ] =================== xe_pci (2 subtests) ====================
>  [ ] ==================== check_graphics_ip  ====================
>  [ ] [PASSED] 12.70 Xe_LPG
>  [ ] [PASSED] 12.71 Xe_LPG
>  [ ] [PASSED] 12.74 Xe_LPG+
>  [ ] [PASSED] 20.01 Xe2_HPG
>  [ ] [PASSED] 20.04 Xe2_LPG
>  [ ] [PASSED] 30.00 Xe3_LPG
>  [ ] [PASSED] 30.01 Xe3_LPG
>  [ ] ================ [PASSED] check_graphics_ip ================
>  [ ] ===================== check_media_ip  ======================
>  [ ] [PASSED] 13.00 Xe_LPM+
>  [ ] [PASSED] 13.01 Xe2_HPM
>  [ ] [PASSED] 20.00 Xe2_LPM
>  [ ] [PASSED] 30.00 Xe3_LPM
>  [ ] ================= [PASSED] check_media_ip ==================
>  [ ] ===================== [PASSED] xe_pci ======================
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/tests/xe_pci.c      | 63 +++++++++++++-------------
>  drivers/gpu/drm/xe/tests/xe_pci_test.c | 24 ++++------
>  drivers/gpu/drm/xe/tests/xe_pci_test.h | 12 +----
>  3 files changed, 41 insertions(+), 58 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
> index 1d3e2e50c355..baccb657bd05 100644
> --- a/drivers/gpu/drm/xe/tests/xe_pci.c
> +++ b/drivers/gpu/drm/xe/tests/xe_pci.c
> @@ -12,49 +12,48 @@
>  #include <kunit/test-bug.h>
>  #include <kunit/visibility.h>
>  
> +static void xe_ip_kunit_desc(const struct xe_ip *param, char *desc)
> +{
> +	snprintf(desc, KUNIT_PARAM_DESC_SIZE, "%u.%02u %s",
> +		 param->verx100 / 100, param->verx100 % 100, param->name);
> +}
> +
> +KUNIT_ARRAY_PARAM(graphics_ip, graphics_ips, xe_ip_kunit_desc);
> +KUNIT_ARRAY_PARAM(media_ip, media_ips, xe_ip_kunit_desc);
> +
>  /**
> - * xe_call_for_each_graphics_ip - Iterate over all recognized graphics IPs
> - * @xe_fn: Function to call for each device.
> + * xe_pci_graphics_ip_gen_param - Generate graphics struct xe_ip parameters
> + * @prev: the pointer to the previous parameter to iterate from or NULL
> + * @desc: output buffer with minimum size of KUNIT_PARAM_DESC_SIZE
> + *
> + * This function prepares struct xe_ip parameter.
> + *
> + * To be used only as a parameter generator function in &KUNIT_CASE_PARAM.
>   *
> - * This function iterates over the descriptors for all graphics IPs recognized
> - * by the driver and calls @xe_fn: for each one of them.
> + * Return: pointer to the next parameter or NULL if no more parameters
>   */
> -void xe_call_for_each_graphics_ip(xe_graphics_fn xe_fn)
> +const void *xe_pci_graphics_ip_gen_param(const void *prev, char *desc)
>  {
> -	const struct xe_graphics_desc *desc, *last = NULL;
> -
> -	for (int i = 0; i < ARRAY_SIZE(graphics_ips); i++) {
> -		desc = graphics_ips[i].desc;
> -		if (desc == last)
> -			continue;
> -
> -		xe_fn(desc);
> -		last = desc;
> -	}
> +	return graphics_ip_gen_params(prev, desc);
>  }
> -EXPORT_SYMBOL_IF_KUNIT(xe_call_for_each_graphics_ip);
> +EXPORT_SYMBOL_IF_KUNIT(xe_pci_graphics_ip_gen_param);
>  
>  /**
> - * xe_call_for_each_media_ip - Iterate over all recognized media IPs
> - * @xe_fn: Function to call for each device.
> + * xe_pci_media_ip_gen_param - Generate media struct xe_ip parameters
> + * @prev: the pointer to the previous parameter to iterate from or NULL
> + * @desc: output buffer with minimum size of KUNIT_PARAM_DESC_SIZE
> + *
> + * This function prepares struct xe_ip parameter.
>   *
> - * This function iterates over the descriptors for all media IPs recognized
> - * by the driver and calls @xe_fn: for each one of them.
> + * To be used only as a parameter generator function in &KUNIT_CASE_PARAM.
> + *
> + * Return: pointer to the next parameter or NULL if no more parameters
>   */
> -void xe_call_for_each_media_ip(xe_media_fn xe_fn)
> +const void *xe_pci_media_ip_gen_param(const void *prev, char *desc)
>  {
> -	const struct xe_media_desc *desc, *last = NULL;
> -
> -	for (int i = 0; i < ARRAY_SIZE(media_ips); i++) {
> -		desc = media_ips[i].desc;
> -		if (desc == last)
> -			continue;
> -
> -		xe_fn(desc);
> -		last = desc;
> -	}
> +	return media_ip_gen_params(prev, desc);
>  }
> -EXPORT_SYMBOL_IF_KUNIT(xe_call_for_each_media_ip);
> +EXPORT_SYMBOL_IF_KUNIT(xe_pci_media_ip_gen_param);
>  
>  static void fake_read_gmdid(struct xe_device *xe, enum xe_gmdid_type type,
>  			    u32 *ver, u32 *revid)
> diff --git a/drivers/gpu/drm/xe/tests/xe_pci_test.c b/drivers/gpu/drm/xe/tests/xe_pci_test.c
> index 744a37583d2d..95fed41f7ff2 100644
> --- a/drivers/gpu/drm/xe/tests/xe_pci_test.c
> +++ b/drivers/gpu/drm/xe/tests/xe_pci_test.c
> @@ -14,9 +14,10 @@
>  #include "xe_pci_test.h"
>  #include "xe_pci_types.h"
>  
> -static void check_graphics_ip(const struct xe_graphics_desc *graphics)
> +static void check_graphics_ip(struct kunit *test)
>  {
> -	struct kunit *test = kunit_get_current_test();
> +	const struct xe_ip *param = test->param_value;
> +	const struct xe_graphics_desc *graphics = param->desc;
>  	u64 mask = graphics->hw_engine_mask;
>  
>  	/* RCS, CCS, and BCS engines are allowed on the graphics IP */
> @@ -28,9 +29,10 @@ static void check_graphics_ip(const struct xe_graphics_desc *graphics)
>  	KUNIT_ASSERT_EQ(test, mask, 0);
>  }
>  
> -static void check_media_ip(const struct xe_media_desc *media)
> +static void check_media_ip(struct kunit *test)
>  {
> -	struct kunit *test = kunit_get_current_test();
> +	const struct xe_ip *param = test->param_value;
> +	const struct xe_media_desc *media = param->desc;
>  	u64 mask = media->hw_engine_mask;
>  
>  	/* VCS, VECS and GSCCS engines are allowed on the media IP */
> @@ -42,19 +44,9 @@ static void check_media_ip(const struct xe_media_desc *media)
>  	KUNIT_ASSERT_EQ(test, mask, 0);
>  }
>  
> -static void xe_gmdid_graphics_ip(struct kunit *test)
> -{
> -	xe_call_for_each_graphics_ip(check_graphics_ip);
> -}
> -
> -static void xe_gmdid_media_ip(struct kunit *test)
> -{
> -	xe_call_for_each_media_ip(check_media_ip);
> -}
> -
>  static struct kunit_case xe_pci_tests[] = {
> -	KUNIT_CASE(xe_gmdid_graphics_ip),
> -	KUNIT_CASE(xe_gmdid_media_ip),
> +	KUNIT_CASE_PARAM(check_graphics_ip, xe_pci_graphics_ip_gen_param),
> +	KUNIT_CASE_PARAM(check_media_ip, xe_pci_media_ip_gen_param),
>  	{}
>  };
>  
> diff --git a/drivers/gpu/drm/xe/tests/xe_pci_test.h b/drivers/gpu/drm/xe/tests/xe_pci_test.h
> index 65ac0295d435..7e4cf6dad664 100644
> --- a/drivers/gpu/drm/xe/tests/xe_pci_test.h
> +++ b/drivers/gpu/drm/xe/tests/xe_pci_test.h
> @@ -11,16 +11,6 @@
>  #include "xe_platform_types.h"
>  #include "xe_sriov_types.h"
>  
> -struct xe_device;
> -struct xe_graphics_desc;
> -struct xe_media_desc;
> -
> -typedef void (*xe_graphics_fn)(const struct xe_graphics_desc *);
> -typedef void (*xe_media_fn)(const struct xe_media_desc *);
> -
> -void xe_call_for_each_graphics_ip(xe_graphics_fn xe_fn);
> -void xe_call_for_each_media_ip(xe_media_fn xe_fn);
> -
>  struct xe_pci_fake_data {
>  	enum xe_sriov_mode sriov_mode;
>  	enum xe_platform platform;
> @@ -33,6 +23,8 @@ struct xe_pci_fake_data {
>  
>  int xe_pci_fake_device_init(struct xe_device *xe);
>  
> +const void *xe_pci_graphics_ip_gen_param(const void *prev, char *desc);
> +const void *xe_pci_media_ip_gen_param(const void *prev, char *desc);
>  const void *xe_pci_live_device_gen_param(const void *prev, char *desc);
>  
>  #endif
> -- 
> 2.47.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
