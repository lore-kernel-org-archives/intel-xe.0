Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C386C4332F
	for <intel-xe@archiver.kernel.org>; Wed, 13 Dec 2023 18:16:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D255910E285;
	Wed, 13 Dec 2023 18:16:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D04F10E285
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Dec 2023 18:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702491407; x=1734027407;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=LumSk51Em2TAtnpdSsPhIWbeWFGq+S0TfXMVaB9b4PU=;
 b=PRN02uk+2dv6n+rLKZhciLquWxQQQuHqL6GWoGfB2UdcUKafDg669hO2
 Z25DPGXJfsBXwFoYOeWErM8K8F305JHALsM5NP+ABI0j/T62Ycats6lua
 08+DlqzCWpMePU4G5O52djBToGEjB/v0ly8PUS6KjE7/JwUj1jgk1bkwv
 akhssuBMCf7mu4OcIWQ0BiHpjmo8vW1uraupMez9kWxRIoI8a1l8pEIki
 +iRvRxQIFfVRJWt8AQaPjnRd4zSqyy4e36KIQ4iRUY01GWNSHGIH4RDvq
 LTzasIdNXX0uVvaa4YoIHRye9O1deJWaPuomKvs6HSXuOyOxHRXO/FBP7 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="1861472"
X-IronPort-AV: E=Sophos;i="6.04,273,1695711600"; 
   d="scan'208";a="1861472"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2023 10:16:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="844411311"
X-IronPort-AV: E=Sophos;i="6.04,273,1695711600"; d="scan'208";a="844411311"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Dec 2023 10:16:45 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 13 Dec 2023 10:16:45 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 13 Dec 2023 10:16:45 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 13 Dec 2023 10:16:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FF95Onvh8+LDsUT8eW9+vka85verfyei55mYdOogrYrnMHUWSARl72GRVVJzdKhhZM7p6WsXejQCrEB+CwC+fgjszBkip0QLRvl/oYJn9Lyp5iD9DCIZviqBJFNLzHZQBLLS8qRLKVyl//DGzPclT8as8i/7BX5aEj9SkaPI5p1XZHSWeU05mha4nxK3yKGS6OfmNRzdS0G0rvrvtgra1i6wCdbxTIBymcanwplI7dpFxqB7BCdbJHTqa/jckGqLI0PEUQTFxev93BXzae4YJztYXA+GR9b6di8EAkK4A6uEUR9ZN7M6DeMyRqBeZzLPbHBUd/5clN9ipf24okJhsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EugP+/+aXgPMrTYPhfyzs2Hnc0TLcb5rN+Scs+8WVns=;
 b=kGhiDSTtWCfk4bYrlpFFx+BoJdr0KJj92mhV0aR97IZr/t5meH3xohbqQsl44FAZe/o95/jXIdZFPfAFFTzJ3nsgrEvF3c0olbj9TCJks5IV3P+AUSte76GBPI3ArI7LXUgggtr7kbSPjzte9dF6gr4H3PJlQUtL1soVwZpIek7W3lgbP9HLuP6m/ed4mN2Yh+CjT74X7L5QesUztamVx+6bRm/OYIK2cbpxrjCfiQmo+63L1azlKGWGCoaqnfHPEcPtBRaz5k0bcR/bIK2gGelBF9YdHsJsa7djNI0cJ0QqTjDB3A+I86djQlxfrNIv+zS7N0Ncpz3L8iSd1fUrgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DS0PR11MB7630.namprd11.prod.outlook.com (2603:10b6:8:149::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.26; Wed, 13 Dec
 2023 18:16:43 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7091.022; Wed, 13 Dec 2023
 18:16:43 +0000
Date: Wed, 13 Dec 2023 13:16:39 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Subject: Re: [PATCH v1 03/14] drm/xe/uapi: Document use of size in
 drm_xe_device_query
Message-ID: <ZXn1B2TaObIal-mV@intel.com>
References: <20231207135009.7-1-francois.dugast@intel.com>
 <20231207135009.7-4-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231207135009.7-4-francois.dugast@intel.com>
X-ClientProxiedBy: BYAPR08CA0070.namprd08.prod.outlook.com
 (2603:10b6:a03:117::47) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DS0PR11MB7630:EE_
X-MS-Office365-Filtering-Correlation-Id: 90be6a2d-804e-4777-3029-08dbfc07a8d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ms3rh+2z14k2NZ2/GpfeidINjHi2cctA/JZelhH6SsnVK5eVtxds5Ku4j2wU6AczqmepVeX1+MOp1LNqZONVl6+i8NevQ3MzZpKRoBSEJwSdmIH4vA7mIyUrZ9na+SPW6l8kLYwAM+rN15pMQv0IuxwX2EOGcOD1XuaRruD3ex0gHMiptWzhKVurRcd1S5Ufrc2sJKG0qO0zziO7OquYuUo2/MHhTHOW0/Xy8vdM2qbL9bkbeuTulBTkSWmddsllh4ngNIJ7XvKyC9ENhfP3WnM6EMey9/FqUNmFMu77S5Sw83RUeO/IJXxb69p85Nv+lEH1hcC2fdrzPpTQJNK9mEG28Z4K8acJv27mZzruNhw4thfs1ZbugdNOjO05ql9BkPsFU1QV+/+Srozj30Kx02kEob3lZmGy7tf/j1HSgFlYpUhJnIG82JDqrhs2b0FH4p8tc6mFb0oSFnnzQ2glIJ/Y76ZElagjs66uXrRSsJTjIArtejoQvhyWH6lkEiecaBuT8YMH9/LnSW4u2tY9u5UkQlZ0Ya52knulkSoatmhmOBinz8XRwvRPmYhuyhBQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(39860400002)(366004)(136003)(396003)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(83380400001)(86362001)(6506007)(26005)(2616005)(6512007)(38100700002)(44832011)(5660300002)(4326008)(8936002)(8676002)(41300700001)(2906002)(6486002)(6862004)(478600001)(6666004)(37006003)(316002)(6636002)(66556008)(66476007)(66946007)(36756003)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gsYqEtIaW7w5WU5TbCeA9gYfedy2+e+17JU+wbxTKZZxj79rcEp91Piv1lvZ?=
 =?us-ascii?Q?af/5Wyco8Nk5QfRZgVshmlBCdsveBvUSCfCJXhyxTT7Xy9RsSO1MVZOVer/4?=
 =?us-ascii?Q?JE9+SiKd2hpxwtLS1VbLOn/RZYdDtRnLFcErUDgkU0+HUG85kul8oDdjJGX+?=
 =?us-ascii?Q?0+ADZXBfOkvPBwRWbD2WZYE5/8yGiEGgNzKN/YGvjz60iCIMbnoxMqSg8N2J?=
 =?us-ascii?Q?/pZ0AZDcnE7uk9XfkeRsAb4GUOCRt3F7tgCm3+xlWqNfYmdMn4RyBpO2kmQ8?=
 =?us-ascii?Q?CYLhZbTrCNUfnGxg7/49C/LkhWnqnEhbIiLXaclF+BKx64BIg5l37UWF2jEO?=
 =?us-ascii?Q?IQ3j8QdtfQ1DM7gXNfjBzEzhpeiHBwlS6hICCuC9rNnSfGlGEVy3CICfl0Ar?=
 =?us-ascii?Q?3/fsxPK7dxmPNiBySzupVzK/D2z+gkT/jSmVUK6UInHRoAi+2hWrhwtJv1pH?=
 =?us-ascii?Q?ajF6adNXd0ZrVqBGTPB4MAGsAnlesWnSEAUxdfXEF85UuiQ3LsmubS0JxChF?=
 =?us-ascii?Q?kU1rpkjFwPTRNIPHpqsR+Pv2PvutQJ36V+25wzfmIla6DvxmcnA6hViz/srQ?=
 =?us-ascii?Q?rjqeNaK14O9T1no2+QOAgQ0PY1jWBNvpW/11D+XjgX/J9Kj2kYcKI68SZ73Q?=
 =?us-ascii?Q?y2csBwG9OA8s/90wYb1yA288EVcIvzciU25qOswmw73wqpeYJJ1HJPqtV/va?=
 =?us-ascii?Q?REz54/2yd+qbMtz0tRh1KOFT6H3AyGxyD/nsCU9XQVZ0Kn+8EiFaJuelzEY6?=
 =?us-ascii?Q?O8MzmEwplc1Z3004Y2RSMGjxFrtILBaA7J4dYep6naV2xcMzz8bWRG7kzYjc?=
 =?us-ascii?Q?a6v8A+Yr1p2B8/kFK4r92MP4oFZJfAKH36VJHgVKs3z2+0brHqVlUi7iperL?=
 =?us-ascii?Q?vG+axVAd79hQcoWgLbERCsVyAoW7zQUUOLl1u/zpkm+3zruc5QHuFlq97+Ue?=
 =?us-ascii?Q?p2BXH0icyhcuTN0B0x6FPEDrXJLBGGj4F0yE54VpmAqtdDljPYOFvU8HLZub?=
 =?us-ascii?Q?Gf1zAMfG0DIX7rN7O3CFZCPXf78IWCi7KoFqXGuu3o/PHduBu5JqlicjjE/P?=
 =?us-ascii?Q?hQ1j2V5CJYChx0a/VZOokeFL1tGLcIeT4TgNmy/FqeKrw9yHjXE9wi0gqZ8Y?=
 =?us-ascii?Q?CMyO5WHg6XzF3tJRe/dwLGQgQaTC6bVXee1MDMJAL/F240cClcF45qQWlgBY?=
 =?us-ascii?Q?ZOEhjtC0bgA+tTw6I0OVq4YlwEdsSBkiES6mSQhFSD7mlfG3UeK/m8MIwn40?=
 =?us-ascii?Q?01GpCRaRV07Y2IZuPJpFs722eGOtlg5A2cwAV2CZFHhXZ3B6NbRndm4nfEkg?=
 =?us-ascii?Q?LEiBemisBPrfXT8PvHyOeGtmkvn5FgCdOkvR0hZ9Qy7BHHtlFLOted+fUcmK?=
 =?us-ascii?Q?G8fr26LC+YmJoW/2jIm3HPdBYkmzGBwYLgXJGJ2QEqTlt/Bfg6JMpmcY1bMM?=
 =?us-ascii?Q?y3mGUfN2qhG2Km809B6aPa3skfB3j1BMmvn+7ZqGrrgOfqNGUHI+3nMeO40L?=
 =?us-ascii?Q?OuFtRMegMkfRU2JhanRjxul9Dwt2HwnUJpy0xqABlnJEjKHSY+L5j2t5w5vK?=
 =?us-ascii?Q?rZ10QEDmGVoJMfM+H5HYPTr50JSK0u9tO6USyGzJzqvTNp7WU0iqc0CVsw35?=
 =?us-ascii?Q?oQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 90be6a2d-804e-4777-3029-08dbfc07a8d4
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2023 18:16:43.2608 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QR4GKA7gP6bqFSa+4jq1am6iF4x1x9Qq94Vzbu6oyezrQIBr+H6N+J7ZtNGMx27h87b3jxrn/s7ndIpWKX6y5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7630
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

On Thu, Dec 07, 2023 at 01:49:58PM +0000, Francois Dugast wrote:
> Document the behavior of the driver for IOCTL DRM_IOCTL_XE_DEVICE_QUERY
> depending on the size value provided in struct drm_xe_device_query.
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  include/uapi/drm/xe_drm.h | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index d6cd76385e2c..7b18844401fd 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -469,9 +469,15 @@ struct drm_xe_query_topology_mask {
>   * struct drm_xe_device_query - Input of &DRM_IOCTL_XE_DEVICE_QUERY - main
>   * structure to query device information
>   *
> - * If size is set to 0, the driver fills it with the required size for the
> - * requested type of data to query. If size is equal to the required size,
> - * the queried information is copied into data.
> + * The user selects the type of data to query among DRM_XE_DEVICE_QUERY_*
> + * and sets the value in the query member. This determines the type of
> + * the structure provided by the driver in data, among struct drm_xe_query_*.
> + *
> + * If size is set to 0, the driver fills it with the required size for
> + * the requested type of data to query. If size is equal to the required
> + * size, the queried information is copied into data. If size is set to
> + * a value different from 0 and different from the required size, the
> + * IOCTL call returns -EINVAL.
>   *
>   * For example the following code snippet allows retrieving and printing
>   * information about the device engines with DRM_XE_DEVICE_QUERY_ENGINES:
> -- 
> 2.34.1
> 
