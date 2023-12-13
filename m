Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 421E5C4332F
	for <intel-xe@archiver.kernel.org>; Wed, 13 Dec 2023 18:17:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D952010E285;
	Wed, 13 Dec 2023 18:17:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5406A10E285
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Dec 2023 18:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702491471; x=1734027471;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=XfoFLgLY2wutxitfItxG535kOFJ2Yt3UxVHH+BvON0c=;
 b=mu7FtjUUL4dNZLn5gqZ4W6+q0Fv8WDtAOuxgGxqMy557oi/P2ZR/P7sR
 hGqtPYgTDU/84BMjXL3FgsGWsMZCJ4Gu7Jl4/YTY9cpHyaYTZ+4jqq/CY
 jbTHvo5TgNqV3NMlTm2bptPzRop/lCSIZRNYtUCT8O/aeP2j8n4BmJfHD
 G473WVdZhJ3aI9XhKUlHH4HBjQyUsW81gJV+Xa9caEoFz+1FncMtJz8G+
 bo0W82qsgM2J8fk2lIxEAKHpLUa0ICXalUBQlqC/KkkMQVWU9OEnaqCIw
 3+fJNs7TEWj+fX2j57FJn2JAU9n3qzYLOpC3nzGMXYh+NHrdtzibpz5dT Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="398845261"
X-IronPort-AV: E=Sophos;i="6.04,273,1695711600"; d="scan'208";a="398845261"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2023 10:17:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="917745936"
X-IronPort-AV: E=Sophos;i="6.04,273,1695711600"; d="scan'208";a="917745936"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Dec 2023 10:17:50 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 13 Dec 2023 10:17:49 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 13 Dec 2023 10:17:49 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 13 Dec 2023 10:17:49 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 13 Dec 2023 10:17:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RwVQOJR49zAt9w7zHx677caud/cTDsQxkV0on5aW43vSlCJbwbypyFnZGHUHmJK5lVSeHTKqqM/uqbiQlCT3dT6SKlrd0w+tXbMXhfQ0M3AraYTvIfIwad7izXcfuHi9jCtlKZ6+DgJdGpU4slia4UMoPK88wA0r+amMKgozeQZflPfpI5X6bbyDf0jdX2yguzZZLupqoSIBVKtdmVbzpOHoG/j6KtIxCWzZbMM99zQ+AgwlZSmhl3iesBc/X3nST1+oiEjQG6AO/iFMmuO+HzVq8ZoDDFitvw2OTnhq2rTzsHzdBXCFY4M/GQvcGhV4bKI0Xq2m/zr3TIc4O7fh5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=filbosREeyuFONPHpYFc4UiO2YCnjfQuaECZN6fyfRA=;
 b=HeYDtWBj3a8YDNaent1bXs3rGEAjlf34gNrcEDeez3YjjE+PuJOXxj1aZw3Mez95hZ3/wpn3KJrV/4MaBXS2Xh3lGDx0iSTk1Co6QbCf5ttTqwbNJBAq6TCypYaw+E85OKcbq0An33HAT9/Qt2CQC3Pb3jVwdHbL2RPVVcOGdYAldXX6LFYOlof/l0+n8Dg2hDDybBKBJFmUoMz1ppjH2uCGaesHytqaxLrrIMGn0uMODArxlqqR+FiwUuzag4elmXUva9fgZoMaDNfO/0qr6XjBtEEiBcSaPyL7Vzr5di/5OOIjaHByUAQVH/STVHW3WNlV4ug6A7cP4O3COeSJSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH3PR11MB8314.namprd11.prod.outlook.com (2603:10b6:610:170::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.26; Wed, 13 Dec
 2023 18:17:47 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7091.022; Wed, 13 Dec 2023
 18:17:47 +0000
Date: Wed, 13 Dec 2023 13:17:42 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Subject: Re: [PATCH v1 14/14] drm/xe/uapi: Move DRM_XE_ACC_GRANULARITY_*
 where they are used
Message-ID: <ZXn1Rlirt9FzFD9b@intel.com>
References: <20231207135009.7-1-francois.dugast@intel.com>
 <20231207135009.7-15-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231207135009.7-15-francois.dugast@intel.com>
X-ClientProxiedBy: SJ0PR13CA0223.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::18) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH3PR11MB8314:EE_
X-MS-Office365-Filtering-Correlation-Id: d18dc9e0-f8e2-461a-5293-08dbfc07cee9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TGzDXQ9902PLmO7j44wNO6QJKhtYzfX0VYA2T0s06kyzh0Yp17+C4Omp/VMyv4bJDTTyXIzzSgtaMVhCt6vG9kbqTq6zw6begQWKxuufPhfPL3uZ8S2+xQI2ZxjQdfn7GS2Jvpip5e7g/Or8oo/tZxg1Ba4PAKgfzMTvx46kyRDca4nlZUIQ8jA14TRYPUsBpZxmOT/RHh4UBxIl/yAx92KQjObRpEgDKJF4legUJs6Bj0Jx7cFIWLhKf2B0ZnFHGsus5v1Ieixf0ZZwYC+lhGS6u1BLGqMT9/pKTagmz0xa4gf1lBZQ5oamqGvrymJyejf67H7PMCRIczJc5H/UejzT+4dw+JlQwPkvgl3JDbPtjO23XOiBPGsWOFDAo7O/HAYJZtQ3+qOIWQsc2hekkfVmh5F/02ykBpw8KevaLdfo7go1xk8QuZcSTIewXhB70FCvkGEL1OVbtF/OZNU7wwlf3hItYrqRjscZYTKw8jFSriB2I9vS9+eUtsLwIm6ESn+33SUldOvY5yQhkNz3mg2zrZ41b8nvKGwp3Y88PdHmmfH3gFabWxHTM/h+/4hR
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(366004)(346002)(376002)(396003)(39860400002)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(66946007)(66556008)(66476007)(82960400001)(86362001)(36756003)(38100700002)(83380400001)(26005)(6512007)(2616005)(6506007)(6486002)(2906002)(316002)(6636002)(37006003)(478600001)(6666004)(4326008)(5660300002)(6862004)(44832011)(8676002)(41300700001)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YQ+Cmvv+fzZwAZ4NB2etX4SN0Fs//BSNnh3wgRfiKwcIqjqnSJ3w1pqb2DEW?=
 =?us-ascii?Q?Cs8JeLrC7OEqQZeMXzdiCQwAVKgQhAILUTaeQGX6zQHNKtrOqH8a+5i7h0Rd?=
 =?us-ascii?Q?IX1bEyZ2IeviTDis0IAoTZnjPM8F1oL23vPMb1fdgWgPYkTi12r0edsUskFB?=
 =?us-ascii?Q?Hi+2PbTmqz2zKHYUa+AKbb+IYISP1olsyiamCLEbs6kxBrrKyfmmH9YnGt+i?=
 =?us-ascii?Q?qeuvt5Hd4JXGwQ5Lm3tm0O7HfYc+bArqO0d/p7+Jx6Cs64iK9fZClj6o4Tsv?=
 =?us-ascii?Q?2US9VoDTPs/ZKBumqdeoSXJ8X2uSZRrz6na2iGA3Tyvzdup5HsWvhCONAbAP?=
 =?us-ascii?Q?VL7AunTsoc/9xs+Qdcj7fJv6Ecywv7OWa72nNayFYjiN/y/rnvf5yqnIxPUR?=
 =?us-ascii?Q?lqqa67NLpLfRmFKKUxJ1Va2hoG38t5YbBzwNC84NsWn0ayNFmt8iE96wNJDK?=
 =?us-ascii?Q?xLAGAYnOlRrhNaKn6TQWPD9+dXMqhdQz8/p3ofdHVFEFlKqCapW8L3aZtC72?=
 =?us-ascii?Q?hH6J9V2BtHJqivV10LdQ/mW3VC1G0vdjliz9y24pVMsYhfAHyLdRvNngFGZe?=
 =?us-ascii?Q?0PS3Sd3VhfzDQ+1a2fZLEPeljnMBZQAnvYh3bll3ZIbzTM+k6lvTYyr6MaVg?=
 =?us-ascii?Q?Gsa3WSMAMNtDVM6VM6yuewea/Vs4hh2UFh5OG38hmfNU0jV+RBE96gpLq8w7?=
 =?us-ascii?Q?djycBIxR0jXyqJXdI4ttvM4zyt0ttvlJOn2drBfB58Dn1xfRuXVkd5+E2TNy?=
 =?us-ascii?Q?OUndKYQIoGi4ANOE3yH4eW8uttfwgFsOhgJxN3qijQrl5JmHovqFUNwQi3N6?=
 =?us-ascii?Q?GVWXT/tWR50vKVIzqQYGPBNytZtANK+l+4Q+bYqY0tU92dv/liyx/oqZkYLh?=
 =?us-ascii?Q?aGYqZXbvPDxT3/MButpCFZWh1uUsBC70E2HBVqwdnuHGzulVroQI1wI3S5ru?=
 =?us-ascii?Q?P5cnIQd6JHWGEtbt4uyzZRFeHj5bEa2nHEnUg8pHZZz+r87MNnz2V2bsPBjA?=
 =?us-ascii?Q?ItOXQXC7IhE59VnkbE/Fp9Fq+H9IrGD6pVd9Lg9RXfeAAalLN6U3VFwi1ECx?=
 =?us-ascii?Q?trid1Cyt0lmA9MulAY8elDN+pR4cWsI5xvA3Hvr3nejhI9xOz07XiNYonBvv?=
 =?us-ascii?Q?O2pwW3IAUeKSvlDMy08RqEItnbjeL68DMGYIQRO71UKLtUYGZn4ucObGG0z5?=
 =?us-ascii?Q?uLwS3fA+Dap3HRMShc448tRvncT2ZODUsJ5mcDzjf9d4H4X4FCudD4M/oPj0?=
 =?us-ascii?Q?lmfQcAmYeffQ8zg16/JWx66aJ+vm5N/4XbIwB6SOIbN2zVC1EKUr9SSjxf33?=
 =?us-ascii?Q?hn3QNnL+4LeuUj1SQU1Z+0FcBgzxE+60dAnFH/Te2nUKYLwOd8npqRHV7Ja+?=
 =?us-ascii?Q?htFcMlsrZ1nSCvuASqv5BYTlozIgO9/4faJ4guh/AvW326wbUh2gjsaw2bze?=
 =?us-ascii?Q?Juev1OAr3FKoLcP6uFCZjtKNqyPQmNn6k2dF1+hh31WBEczzp4chc5iXzuPz?=
 =?us-ascii?Q?JohmWod6pHDZY2LneNExR+mxIIjppp2YmGfTR6ogyp1kcoa+kYPmibijYDG7?=
 =?us-ascii?Q?Gs1fdas8NSPD35rTrRb+nIzb/DeK912+NvVn4G+roDoU8AvhhUwUk82N4ASZ?=
 =?us-ascii?Q?3w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d18dc9e0-f8e2-461a-5293-08dbfc07cee9
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2023 18:17:47.2485 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gO77/OowDutVgdeSaUvoE/l8hGnnL6fdPIL3oi9+mNRedT5aE0vZ96mXgiV4eh/RdC0pOqbPDTGMu8zSIr8t/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8314
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

On Thu, Dec 07, 2023 at 01:50:09PM +0000, Francois Dugast wrote:
> Bring those defines close to the context where they can be used. Also
> apply indentation as it is done for other subsets of defines.
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>


Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  include/uapi/drm/xe_drm.h | 22 ++++++++--------------
>  1 file changed, 8 insertions(+), 14 deletions(-)
> 
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 7733c5a3659b..0e22b0ceac4d 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -1031,20 +1031,6 @@ struct drm_xe_vm_bind {
>  	__u64 reserved[2];
>  };
>  
> -/* For use with DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_GRANULARITY */
> -
> -/* Monitor 128KB contiguous region with 4K sub-granularity */
> -#define DRM_XE_ACC_GRANULARITY_128K 0
> -
> -/* Monitor 2MB contiguous region with 64KB sub-granularity */
> -#define DRM_XE_ACC_GRANULARITY_2M 1
> -
> -/* Monitor 16MB contiguous region with 512KB sub-granularity */
> -#define DRM_XE_ACC_GRANULARITY_16M 2
> -
> -/* Monitor 64MB contiguous region with 2M sub-granularity */
> -#define DRM_XE_ACC_GRANULARITY_64M 3
> -
>  /**
>   * struct drm_xe_exec_queue_create - Input of &DRM_IOCTL_XE_EXEC_QUEUE_CREATE
>   *
> @@ -1077,6 +1063,14 @@ struct drm_xe_exec_queue_create {
>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_TRIGGER		5
>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_NOTIFY		6
>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_GRANULARITY	7
> +/* Monitor 128KB contiguous region with 4K sub-granularity */
> +#define     DRM_XE_ACC_GRANULARITY_128K				0
> +/* Monitor 2MB contiguous region with 64KB sub-granularity */
> +#define     DRM_XE_ACC_GRANULARITY_2M				1
> +/* Monitor 16MB contiguous region with 512KB sub-granularity */
> +#define     DRM_XE_ACC_GRANULARITY_16M				2
> +/* Monitor 64MB contiguous region with 2M sub-granularity */
> +#define     DRM_XE_ACC_GRANULARITY_64M				3
>  
>  	/** @extensions: Pointer to the first extension struct, if any */
>  	__u64 extensions;
> -- 
> 2.34.1
> 
