Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A67C2C4332F
	for <intel-xe@archiver.kernel.org>; Wed, 13 Dec 2023 18:15:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 540BC10E144;
	Wed, 13 Dec 2023 18:15:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44F6810E144
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Dec 2023 18:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702491328; x=1734027328;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=wBw6bF3I3b76nCE1HpwERqDsVCZwcfjxuIxf6QCQtL0=;
 b=OX5GMVMaTMiiQOGYDt1Boz8x3lJeVQhjibFG4x/zI9wErVmgPp8upw62
 0jHHBa+BUCwC4DHMbe1A7WcaRfKBwLD1/3vtwXPZzEWzZ+3a++bih7LdO
 cG9TXHaOgoOXAmUcfVKYbTo7t4SG6maRxZ5NQuTIsAK1LQaS7OFL2/EGG
 W7eo6zSOTNYtAzW6ecxsWhR6IpGBnWWmSHnc1+LSnm4/S26ZZ1GGSXUKj
 357kkNktXt3RbZSgqKsP5oZotXokyGckG5NmzX1qQgFhUcbwqAeCR1r7R
 qczpZNe2HLzrYXryQVa14kFxDG9KxtM2tLRpNBJYD5xiWWqszmo0KTqjy g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="8397876"
X-IronPort-AV: E=Sophos;i="6.04,273,1695711600"; 
   d="scan'208";a="8397876"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2023 10:15:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="777594233"
X-IronPort-AV: E=Sophos;i="6.04,273,1695711600"; d="scan'208";a="777594233"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Dec 2023 10:15:10 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 13 Dec 2023 10:15:10 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 13 Dec 2023 10:15:10 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 13 Dec 2023 10:15:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UKZ1lejVJLanQCe2N7MSc5JlVWlTIlKKONtsxBqf9xrdVwGKsO2oCQVZbHi/vdeayEsRLCD5U53i3rsta9/p0Xj4Qzuj4wRscxZ2cwOIwG04h8D1DZj5zcTcOozvZYDMmeIx+h8T51Xd5BhzhJY3VCmI/8csr5lp7PrrlCmSCFgJX70yyu6RcoBMfhYo5gRRdp3fE8/Qu69FNz34j+g2JI8Vd2Ym6wBvCgrSgYwMTlKkUk9qiG+BaXYhUwKuMsB/ncr0s2RY/F8KoRa0I3iUkHMx3Kwa69mzao0xEzVGvyzeGG0J6RITQvjZG51amcm50rGnoQxuW6Hc4JMyzrkP+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/+HiQ5e52Vd8nVNBY7AI9S65XjXWGwR788T3gvcfSKs=;
 b=IMRqw64dWI7uN+Q/sa3ynmnTXblBbyyC+5BlrMzQSvGXO0L3JETcWV78KyVNkS5Ig4pMHmSgO16BsxICVaj6rsn1KcVjsETsbsPEGrycEseBve6I3mIqKGzLEFGjJDPkh9OVTgAz4gPY+ItXXFyCyG0QkFzF1nHzbo5aVH2nmIcdFAttqowiTXNgwtrYeTvcZ+G0IviXon4YenQlIKG35Iz7nDantXPMCcR0BSN5XJnGkN4h4GBXbkjSBrzLLn/ytfOFj1HsmVaFqpUvPIXQIR3EuioqBpLy32MjnJYTyWbmre07e5cDULzMFM7QFOWG8w6yCbI+tz4vy9z1bKw8Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DS0PR11MB7630.namprd11.prod.outlook.com (2603:10b6:8:149::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.26; Wed, 13 Dec
 2023 18:15:03 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7091.022; Wed, 13 Dec 2023
 18:15:03 +0000
Date: Wed, 13 Dec 2023 13:14:59 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Subject: Re: [PATCH v1 05/14] drm/xe/uapi: Document
 DRM_XE_DEVICE_QUERY_HWCONFIG
Message-ID: <ZXn0o9qRdZitltiQ@intel.com>
References: <20231207135009.7-1-francois.dugast@intel.com>
 <20231207135009.7-6-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231207135009.7-6-francois.dugast@intel.com>
X-ClientProxiedBy: BYAPR11CA0082.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::23) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DS0PR11MB7630:EE_
X-MS-Office365-Filtering-Correlation-Id: 59b5a0b2-18d3-4948-3eaf-08dbfc076d02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 71RMXXfweyDqYzQ2S2WNPtirmDKOk5Tf6YIIOePnH468NUANdh+Xsc3ZlzAm5XPGGpsUC5vk6B0scaa///J41nM9eDiqRrKRVrVin5HUfidKJp9NS2M6o5JOarMgkPlLSJcRdGfnDDBjsxgYOEAktvvlcuJpwCEvKfpeypxqNG+cs6HoTulsTreUdYuSXfI07lt7EsnWR0/qVSWkVY2FXIYGeFQ/FFS1pb/5QTARoVVsLHO/Ov0r+zho9BBNhX6xAWTNI6R7OAMXFK6oHqwyq4JeE+/jid9v9wmXwxXjFtcbtXxAk5CihQfE97dxpjwZwpGE+HSyoGowo47mGagWmy3Iitjo3wHuxP3F0HmTsTw7quRb3r0s5pHhmzuQU6/Vym8HmMjxfxRby3IUCMBr8Al4ks/dW0/pezO7e5kALW++rp/VE9s6wGAHXqNVrcGA2IlaeGrR4JIqLzTR2c72VLEt1e+xcSr2oHnovJuSx0ck4wV4uVA+M4AjyBSipvrfXTv7YXadPDVR9m5JkuiHo1Jl3dDGBWFZyXoyK7wp3d817NsTnfrin+kFnG5L2/p2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(39860400002)(366004)(136003)(396003)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(86362001)(6506007)(26005)(2616005)(6512007)(38100700002)(44832011)(5660300002)(4326008)(8936002)(8676002)(41300700001)(2906002)(6486002)(6862004)(478600001)(6666004)(37006003)(316002)(6636002)(66556008)(66476007)(66946007)(36756003)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?emUg5CnjsgHfVl/bOive6/ppjkJpVqTwxZjUyf8Lf1BRMDPWL2Eah2Yjv1qG?=
 =?us-ascii?Q?vBlWaWzDp+8Mg297bTvi3KnzRgH+LD94aX5L2wOoAztOoSbkrTlJw1mMEgtm?=
 =?us-ascii?Q?Y2F4QR00giBJof2XohcRRwCeQ+S7PVICpNBWzyv8FneI6P+KxcU8eXVnTBRl?=
 =?us-ascii?Q?YZ1v1tijaO5Go+2//xTaE8ffr15XMFwqOu4nuS1rwfXnRtoqFCKVKmbwHDOx?=
 =?us-ascii?Q?m1WlfsFjDcyw1wBFybEnldoHSfC2qOQxMaoxLBn1g/CLbTkpEcJIOsJZLUZb?=
 =?us-ascii?Q?RBh8rvV7O9OlC2lLhuFelI/VhaUCG9hloLNmrQQnsTbHAwvtTxOtUrKYlUtV?=
 =?us-ascii?Q?7zlA7dh8aY7GcKLzjthjboijAbbSFIhPte1IUkmgvEYAdKkQgW3OG73m9uU4?=
 =?us-ascii?Q?STzdvHPeta4mxxYl8s6jlVES8qGkEatfk/nXQPpW/iuzfgO4Iab+P5v//JrP?=
 =?us-ascii?Q?XnDHUWWFRH9BsbNucwphZZnKM+CWwxgmVNsSS8H6y+lGBcDl+wbLD75EwgJ8?=
 =?us-ascii?Q?tRdKaLTCFVVc93v+gihUS8yh5R48oUtQbS6qg3t6RPmOpSr9BazeYpFlD9nL?=
 =?us-ascii?Q?NktdqfXvn2MDN0X2fiMgWo6L2iKAE/IuGLuhgTMlzlmNmnCM+hlv9Pwju2vS?=
 =?us-ascii?Q?gRyZoID7x7rKGHUs2lzosohXE2y8liE3n/DNUaOQr1S34oK2HZKr0MFRIWWU?=
 =?us-ascii?Q?90qI4zHjWu9CNfdZuSboJPBnCmsFDsR1NYfH8cZ7uYCVhRKQ3WAaXiQ5ZZOA?=
 =?us-ascii?Q?b5XbL+U1InKiqHPfAj1+fsd0xwlYFK12wSI2DFnUYG8Ztt16clTVVsJq2BpB?=
 =?us-ascii?Q?amLdNhE2sAMeB9YqmUowzMj71uhxiJ8V+Jf+z9K9FMMnoKsuG4OZJi9ZIjRs?=
 =?us-ascii?Q?AmNtaHyg86gsPOJbWKn9+Ak8fiX2nU12K1YmkqsAC5o1ixhdJjLRHyP7llmT?=
 =?us-ascii?Q?uNdEdCy6VSxVRr+E1bAWYrbZVivVC7KuBPhoBaPcV6oru1UD0qCTrXVwvfYV?=
 =?us-ascii?Q?uNT67Yx8E2EjfAlPrGWUgB6/Nlrq5JiRM432gGpKhp8E0E/U8yP6GaFzamW4?=
 =?us-ascii?Q?LXX7xMi1DxTiiSBwjBcKAhZXeXAdpS1tdMIWnt3Aiy7JJBxsINJ8ksNuBlD6?=
 =?us-ascii?Q?JJNnRrgtj962MDDwe/zeXmtIp7k/3ryc0gMeSKvqZ4Gk0JsG316qCiWfST89?=
 =?us-ascii?Q?QELLLCuwuY6pemKWHAxO11pBiHyC4iJEVLqu3bx+ueq6W6T04Ji2qV7SonQc?=
 =?us-ascii?Q?qnAth6nHtEYizW0i4GREGV7AgR/nZNk8Hm2IX4F7gw7dY5aCROo5CuRHUnZk?=
 =?us-ascii?Q?sFLwtavYrKRIjCdPBZvhR7Q3l7gKVL19aZPXZq0zKpAPKoji64bXqCzxs+qY?=
 =?us-ascii?Q?y8QrOtXTeZOjK8BOYA9PZXWqwifU0ZJGn0eIAxrOkSAylnAN9vsBS1daXhX4?=
 =?us-ascii?Q?XYodhXhgv1E0AsuDViZWt05v3ja1sktHC0y+0DF8rqTVHX6UYsqEU08DpdDB?=
 =?us-ascii?Q?9HNV9ifYjbfiDOv1Hkt6DHQbslfA0OZzLHJDX3pTfbXvvUkptHRrV7113YA/?=
 =?us-ascii?Q?zXcDx9hmPi4yMmoQdIazwmbHvBz3ivWb1dhUOAPFcJM54O58XAFqehDI1KRr?=
 =?us-ascii?Q?wQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 59b5a0b2-18d3-4948-3eaf-08dbfc076d02
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2023 18:15:02.9286 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FkYwujHq/eMUytVilfS5BFZAyxYJEMPzJYsU1wGJSx6CJIVNq2h8XxBx3NJK0O/qpbiCV/Z/Khmo6oHZpcepKA==
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

On Thu, Dec 07, 2023 at 01:50:00PM +0000, Francois Dugast wrote:
> Add a documentation on the content and format of when using query type
> DRM_XE_DEVICE_QUERY_HWCONFIG. The list of keys can be found in IGT
> under lib/intel_hwconfig_types.h.
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  include/uapi/drm/xe_drm.h | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index cc1c6c5d594c..492f3c240e87 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -539,6 +539,11 @@ struct drm_xe_device_query {
>  #define DRM_XE_DEVICE_QUERY_MEM_REGIONS		1
>  #define DRM_XE_DEVICE_QUERY_CONFIG		2
>  #define DRM_XE_DEVICE_QUERY_GT_LIST		3
> +	/*
> +	 * Query type to retrieve the hardware configuration of the device
> +	 * such as information on slices, memory, caches, and so on. It is
> +	 * provided as a table of attributes (key / value).
> +	 */
>  #define DRM_XE_DEVICE_QUERY_HWCONFIG		4
>  #define DRM_XE_DEVICE_QUERY_GT_TOPOLOGY		5
>  #define DRM_XE_DEVICE_QUERY_ENGINE_CYCLES	6
> -- 
> 2.34.1
> 
