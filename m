Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 701AAC4332F
	for <intel-xe@archiver.kernel.org>; Wed, 13 Dec 2023 18:18:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ECFE10E2A3;
	Wed, 13 Dec 2023 18:18:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26D0310E2A3
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Dec 2023 18:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702491502; x=1734027502;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=md64aFZPmVpM3/N4tcszx9/VFfqscib+IgTlSO9uG/w=;
 b=J53vT8WiOr1q5tnHLzz+leG97ZjSYypv8ojWqGeODyyKq9LvGlk6sWVS
 3x4gYQ1G380mrC0Fd7TfGcirKVPXw/W4Wj6FxBdRlsiJWou0Chf21zn5f
 vBwfDyoolKhLvvnNAoN6Fff5ajekpggTYUdDWcllbK4bUM+R7+4XMMC+x
 C6KXXp4fcfVdnoXXvPpWiWH+lmKiRazf7/3Prh5lCXYmNiJFVjc75hJr3
 CKUA9vazl/3TYSywT1PTVTJ5VyRIFg1HaiZRV4HAnX2Woc8IK526PB+xi
 VkHNCCOn736N+Wt1H1y3KRvd9JHVYQQbpma9G2eGqkzD4djFUCdVInNIm g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="398845326"
X-IronPort-AV: E=Sophos;i="6.04,273,1695711600"; d="scan'208";a="398845326"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2023 10:18:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="917746117"
X-IronPort-AV: E=Sophos;i="6.04,273,1695711600"; d="scan'208";a="917746117"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Dec 2023 10:18:21 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 13 Dec 2023 10:18:21 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 13 Dec 2023 10:18:20 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 13 Dec 2023 10:18:20 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 13 Dec 2023 10:18:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n6Xv5UoZiJpkj/HVEQs1YPjzt3U9alsdfoen272jGtHpsZkFtx+YlYT5OYiWPIbHuYZR6EkxYZ423w/3Maki3qIdjeGvziCR/gBcHVSlDiSkRo15fnMCm10+MojBwFTp5Now1wa2mQhmr7JH9+Pq2nmW2CgVgIoKJ0w9HnQ8mxtU/EWaHNmg+0AS612S1odt/5OWKHUR68Vnn3+jU0wjJInJImxzCHp1U+YLKmDlKpADqWWs8vfkC2SMDdfVKKgDJZjf36tw3J9xw6vn6fOIvlvZvBBulpDLBDJ922+XU8jWkbRRkV4ZlRpOFsxtM7+E4WSQc7dZ3dzsdDmnH33aHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EJggjvXfh5nmIpXWMWi1L6zWz5nHsqNPA9W6gZ1HhCQ=;
 b=fL7uDuaQNdm74wL2ztcNE8vfTnvvF2RpOcTMYboQjm+yDN6Q7cIhLGTaxui0GWPsfZVLwmnetvFzLYOSJ+CjLBiSmrwHilDi8aZ/yAZCtQ1/uwMgB1p7+W01hXUFP8C+SyuwxgIm7UlVDhwPsLN1AzkTQsivd5t/EoK8kzy0RZIjuSoqLtnGui841aAHV6nqH2mN2TvNOiLw4vmSxi+g2zFqNFCkBxMO/WSotPhk15V2ekZWrR6gKL9n9SCFaFuz+iu1vGpxOB43+PO175pBeRaUeQbUO3bG6YoRyH00PusEADykxwO77F0jI/0AGsY9Ubfl8f0LL6iDbaZ2XhYnAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by LV3PR11MB8602.namprd11.prod.outlook.com (2603:10b6:408:1b3::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.26; Wed, 13 Dec
 2023 18:18:19 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7091.022; Wed, 13 Dec 2023
 18:18:19 +0000
Date: Wed, 13 Dec 2023 13:18:15 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Subject: Re: [PATCH v1 13/14] drm/xe/uapi: Move CPU_CACHING defines before doc
Message-ID: <ZXn1Z01z7ZJnlePM@intel.com>
References: <20231207135009.7-1-francois.dugast@intel.com>
 <20231207135009.7-14-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231207135009.7-14-francois.dugast@intel.com>
X-ClientProxiedBy: BY3PR05CA0011.namprd05.prod.outlook.com
 (2603:10b6:a03:254::16) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|LV3PR11MB8602:EE_
X-MS-Office365-Filtering-Correlation-Id: 048fec5f-9382-4a1c-da63-08dbfc07e1da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pmrOQ0w5d6fE4NPbH4PERgQUzRpKp7KUjfuwOCVuAJh4CBEXroyu+6LiIoRb8yYaUoT4ZuM0j5h/xcy1bx1KBx90fQtShBQb0pr1RLP42zQt2dLbHqnB4uMXG7rVsvwSTkDaUDqLrLjM6ucza8TMLYpDE+nBUU6p1heCAdv11hI4Pfg9PNdsIEJ2XN+3udD6wFgky2fozQZ9JGs/cnQ3K53J4RBoawMO+O7Zmnkerfy4C/BlgHSl1i5UZtuAIAYAkh1DLP0ejoqkr/4kFUUBv+KLqqAru2+vws3VLRMhF7gVmmw+f5QWRkNSkvjBjVYYUFkKARvWwXJWrLrayzCU0CcDnFNvGxW9mW7rAQjH0xZ5GqnaUu47xXMUXh628yxqKXadAU8frwUYa+4pslOLjukBgryKhPZhR/pGsbP3hGCpxuzxrY7m/Hivzo+L0lPx+MdHO914xSmxq+zJZv5anOnO87Lb5yhknvI+KRajOi20NSjvRAPWT+BrkfFqlcyA58bJuSVJ1evC1C3tvjl/2dmMWvUid1eDpco603DxaMMAQQpc5ZDdVhAW7mXAjA00
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(366004)(39860400002)(346002)(376002)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(41300700001)(36756003)(5660300002)(2906002)(82960400001)(6506007)(83380400001)(6666004)(2616005)(6512007)(6486002)(478600001)(6636002)(26005)(44832011)(8936002)(8676002)(6862004)(4326008)(37006003)(316002)(66556008)(66946007)(66476007)(86362001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?C43F4yOy93r70lmKjZe8IwXcgvAnfxfDnPRHNLuwM1emQP0562MA5wg9/1Z/?=
 =?us-ascii?Q?Bkh1lk+lHQwNYZIkOhFhZJvkeMPejy8YVjJ/0zTsJ0sIzUAUqxJ7v8vQ/Spp?=
 =?us-ascii?Q?+RIm1TiJXM38oGIEV0Dpi0WyPG3++byWDijiwiXmqoOcUWFcIIt5up3JvtiW?=
 =?us-ascii?Q?BiHVKu3zHNPK9VzeDji5S0Kdp+OD/cIB9OhCMe23GYLGO3HbsOQValBJ897Y?=
 =?us-ascii?Q?HV5JWYLV5542PQ/ECH0I5je8r0e9qPmpQAwEVLTP66Qb+YxtA4hXTNZEimUP?=
 =?us-ascii?Q?brdJp3OX0czmmTmTnVDjGuO10BgPamAb0KDWGvUKz+oV7HndU9JJG2O8gCGl?=
 =?us-ascii?Q?Krl5YSrFXFD4130P6hKqepkR1DMvTHWl87QGhj7jDoovQIxTnItcBxIoYVMZ?=
 =?us-ascii?Q?4gJU2hXvg5ZVvRjb+XXW15XoReUneDuyYRk1bh7nMEB7ma3iuTSVCuFVguNI?=
 =?us-ascii?Q?4RBTTvCV+PbFBawt2T4PaWFDim1Wmrr1ry/dYOW4J9XS117+jPZTVMAHN+v3?=
 =?us-ascii?Q?hypKOIO+LEE2mGhpCQasDrxYvArmw8W1Pr+SXjsfis8awhmk5OH9SRe2hqWy?=
 =?us-ascii?Q?+W20Yv1dAl839f88VTWrEFH4zTtjG+e4gUl1YK0jbUfUJ+LwKvFh0UOPulNI?=
 =?us-ascii?Q?NO6ho31EviBlle/7THfbqQLcPpoG65FuiPVwds4BSBWhbkKnuT7pUAZ902Gb?=
 =?us-ascii?Q?EGTn5ae9xAAO47CXkWglWUmMsFrs6EiOoVe5fDbLYpCHOm9Olt0CKulBq9VP?=
 =?us-ascii?Q?XXuGA99S+TpP6cnZYYIkGPEhIXwkBqruL8zZx9dU8rip10KCnZvKEj+cMh14?=
 =?us-ascii?Q?13CibmH8FySpQO08aatqhZ3IDyaQ27fVOhHrr6Bz+Rta+9RKvpy40uMOKUAW?=
 =?us-ascii?Q?trmoNuseG3Z1wInRZJC4cuG1H6G+mLyQfjMmzWCkHl/+P5jf7fUtRs8E5zGm?=
 =?us-ascii?Q?ZElM9qvUrOXTHhmueL28T5uFqIxTPTehGrAhDU3v1yjHwIwYO8tNRwAoRA+D?=
 =?us-ascii?Q?22YTRy7L+S959Im1S+4Wpd8P8bHPxnYMyFd+lvVHR7Mh2hSYjOLkaiuQYliv?=
 =?us-ascii?Q?YlWRW5kEO980/catcXiqARATXXbxfqWZDpb/UMM0azCzWz8CGufGEhhd5VA5?=
 =?us-ascii?Q?xyeW+z9ysrm1erBf06PYxw5p+cNWmHV+Ganio2Cgrn/qQTU837AOq+/9HkiG?=
 =?us-ascii?Q?z1GCkIgSp7WXoG6tpnTEv5XeG914wLB6R8bq+1SDXkOaDqRpfxDjTBNSDYdt?=
 =?us-ascii?Q?PrXUCKltYEOSobf4rB/vE7oVh7HE2Cz0V9E9GBjszlLLrqoR9TV4vF0/koAP?=
 =?us-ascii?Q?IM0MIS9riDnVTUeYcCU0wZJmnOnf+PgmCBD4uEc79aOJU/TjwIDUwAjpDTBD?=
 =?us-ascii?Q?EAmig5KEALQJ1kQTmJX6Ipgo2l6QN+9wZ/wCUsQiBTiul4O+Hr/P9Cj6Cl77?=
 =?us-ascii?Q?Zr230hVg5Vc4TSsf6DrgbZB2qLp7CEZlhsKMWoXb9AEaqeQGxL9ZZZGuc53e?=
 =?us-ascii?Q?sG7Vmz9F9U/bEBrIUduAdaFbZlu5hL9Z3ip/I6D0rJx443SgINr9NjVOeaqa?=
 =?us-ascii?Q?iQK3FfNRHPFt8J6pp4TUGU4qcHUeiz67yLAZyphqDMJOgmIMga9EaqRm63wJ?=
 =?us-ascii?Q?qA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 048fec5f-9382-4a1c-da63-08dbfc07e1da
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2023 18:18:18.9676 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JFqEbeJoyODva8ZSDCK9GxrV3z1tIa48X9G6enN57qkGwaA7zLOIv152kEwpQhdtiAjMKQd2rwgDCpBfIhYoAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8602
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

On Thu, Dec 07, 2023 at 01:50:08PM +0000, Francois Dugast wrote:
> Move those defines to align on the rule used elsewhere in the file which
> was introduced by commit ("drm/xe: Move defines before relevant fields").
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  include/uapi/drm/xe_drm.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 6811a1c96078..7733c5a3659b 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -741,12 +741,12 @@ struct drm_xe_gem_create {
>  	 */
>  	__u32 handle;
>  
> +#define DRM_XE_GEM_CPU_CACHING_WB                      1
> +#define DRM_XE_GEM_CPU_CACHING_WC                      2
>  	/**
>  	 * @cpu_caching: The CPU caching mode to select for this object. If
>  	 * mmaping the object the mode selected here will also be used.
>  	 */
> -#define DRM_XE_GEM_CPU_CACHING_WB                      1
> -#define DRM_XE_GEM_CPU_CACHING_WC                      2
>  	__u16 cpu_caching;
>  	/** @pad: MBZ */
>  	__u16 pad[3];
> -- 
> 2.34.1
> 
