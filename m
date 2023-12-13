Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45549C4332F
	for <intel-xe@archiver.kernel.org>; Wed, 13 Dec 2023 18:14:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA73710E285;
	Wed, 13 Dec 2023 18:14:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B70A10E285
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Dec 2023 18:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702491282; x=1734027282;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=79AfNW28KVfkIqkjLw8mm/uB9sddTYj6c2sYYFJnqdY=;
 b=Ljo0mGdkEgROmYK4CH0RpwCM6OIauNyEVNOXPDZSkN/fFVmBEeeR7cbn
 mIlwkai/MAFnDg6Vymx/wc1KdiV2t2cgp3XK+ZYrhSk5Ud/+vfIkdUzvZ
 EXL5kEy1hKy7XY7Lp8UNxTVu+sKcpKwQQe+o3a0arRAmBOai0YvWV16OO
 gM58TrO/KHz1evw0jv214RfYcK/awNbixnEnvsztRtVBygTv3J6IYKuuz
 fzshzV7e+y8KHc4zCpQ5x3O9yEXh2heTAvfiBzIWQTVjCYVdu5E+vUYd/
 qQJqGUDUEYzSVuKDrI5kYbyztri2DL/p3PZ2ihfERzWQM+usJSD3gLGWy Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="1861220"
X-IronPort-AV: E=Sophos;i="6.04,273,1695711600"; 
   d="scan'208";a="1861220"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2023 10:14:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="947264853"
X-IronPort-AV: E=Sophos;i="6.04,273,1695711600"; d="scan'208";a="947264853"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Dec 2023 10:14:41 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 13 Dec 2023 10:14:40 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 13 Dec 2023 10:14:40 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 13 Dec 2023 10:14:40 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 13 Dec 2023 10:14:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y80Ry36SrW11VgwwXnQAK9yv0xRL9e12dYA7Lb31nrZ3AhV3b/UzrhvMwN3AGJLVki/RWK3sFpqi+HbuN1Ok7h3zpYDAnzqZf62hQiL7KXKY6Scdt0CKYYAzPbjkKQxBqeYVsmSnGx+nG8leES43FeaHEfU28KDMYefe92o1tOaSO1ctcZANqoZYvpxOBGw97APYA4l4QUymS7RcdzDhU4FNKDhFjlyimk1HutEz/u97P4trdPcHyd9ZzeDGRfIVxHD5jogfhRL3wEwUlmZVbKG/x8zRwLNNEKAgqFuGJ4Jp3RQuEVQbpsaIzzkG7oz6bpOUrsoig6X8vKCjGKEg8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wz0MxD1CuXXVPrwu7DfbSNin2LCdGFZvWAwmhEkosWI=;
 b=W8bbwka9rSPiaaCsyXrsf9sshh++zIYSnaa0p3IIY0jhosxCD9xbUQbav+3C35xqzMFGHnn3OL2cz8ENbUt+NX53fZ49o0nECL72QYJzt1LG56ldjS6vktx943/WGFjNyHhb4FCzGaC4dkhpL8pE77aZnmLXel+2ei2xB+IyDuxhESXWuHEpDidFu95kN149JoWklJ5r0F6uDoyaB4jovlXcv9JTzHrZq2SMZlqELihgAyr1hQS1HhiY6eJUhLzxuVxksJTI90DXMW+InbOykysz47yboXoNm6IWqTS8r2E+oZwD5dShlfKTXy5Dh0i5ojyl+2AKUbE+QHw7kdz4mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SN7PR11MB6923.namprd11.prod.outlook.com (2603:10b6:806:2aa::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.26; Wed, 13 Dec
 2023 18:14:32 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7091.022; Wed, 13 Dec 2023
 18:14:32 +0000
Date: Wed, 13 Dec 2023 13:14:28 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Subject: Re: [PATCH v1 04/14] drm/xe/uapi: Document drm_xe_query_config keys
Message-ID: <ZXn0hK_TKImEx28x@intel.com>
References: <20231207135009.7-1-francois.dugast@intel.com>
 <20231207135009.7-5-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231207135009.7-5-francois.dugast@intel.com>
X-ClientProxiedBy: BY3PR04CA0011.namprd04.prod.outlook.com
 (2603:10b6:a03:217::16) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SN7PR11MB6923:EE_
X-MS-Office365-Filtering-Correlation-Id: 2903d270-8a81-4efc-4c29-08dbfc075aa9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s+MDTJhK/2m3y5lJwT/Qr2b1EkurIY94ShCU3DL31ke2WBJQ1jjMqAeFi6VR4qYZ6UeJXxen1+GWWdx/6qw49GpQb6x40DzYg8y4L2Ret2M1el8TN92wVzQsibTslRembkLFbfzd9Q7PTL5MMlnqSag2bRqpiYic0S0hEKeTOYFBz4kHWg7d81zgCuwzQ9d7UeRMKQcTj7oJCtOn3vtrDekMTClxV3ihciJC56zF5lnf+1pvgVKsjidF8nHBJMW7bLRX79GwUfBCSPHFTxXS4QSFvH+hZ81CQiBW6zP4hvuxw0m8QCUgwCsS0+COiPAHKLJQCNaumKQH803OGvCTqFc9iiFRE1vNj+qk+3Zg0z2V4gCyZ29+DWFLMRdEm54LH+1iT6S0apXy/EwFydUBQKcOQjjXOO0VSye2aBEt0foerS5S2r8xcIY0H/Fk13aJ9DBc1S0fzUR5tYVXBmycHmYLdq+DUJByzpMVaF144nPqU64OLwX4eWCrto9dkNVYN1TlPzvvf1WeNcjCl0T8fbWPmU4fnV5WMPrsCXQdazZdGG12BJGQXTUXQ/uw1NdqIi7vw8sm66jNuNb+sXA0WVjAEqO+6+xCipxGIqTwzos=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(39860400002)(376002)(346002)(396003)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(82960400001)(86362001)(36756003)(5660300002)(83380400001)(41300700001)(38100700002)(44832011)(2906002)(316002)(6636002)(37006003)(66476007)(66556008)(66946007)(6512007)(6506007)(2616005)(478600001)(6666004)(6486002)(966005)(26005)(8676002)(8936002)(4326008)(6862004)(25096002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IKe1Z1u1WQuGkjWcAO59/c7tz3lZkWNei+quZ7Sdt2mW9HDReMyt/UA8jYTI?=
 =?us-ascii?Q?pavRCX/HlXO7IPu5k6wk9yW2zWtWkqVB4T6LlkrG14j7T5lndkC3VYcggGMH?=
 =?us-ascii?Q?leuRq8Y5DhlJKs6Ul4umeq3OOPJyaMcsYGOHbP8rgvfQjlyHF8PT5YgKkytn?=
 =?us-ascii?Q?8H3trB7hMkFCBPLGFzS7upL5cMwlH13L2Ic1BaCju7x56srViKPpCdzHF1mr?=
 =?us-ascii?Q?49v6V8YVx02lpUlPK27AYX9pfhrQicdla0eNRNH5jSdrab/UIITwCRfXCQvD?=
 =?us-ascii?Q?OeXTc/yIWPrWQWmlI03yunsbQg10xgObBE9333mL7voSNPHWsJpmpEFjYgUH?=
 =?us-ascii?Q?jUXJxQJi5zHM2fupwWDCSVWmyp8dRNkykUA1JbPMP/Y3dxv6EX5pwctJki3y?=
 =?us-ascii?Q?NLy5xo2yTEdUZJDuciRX3Pdy2t9R/5bJ4OSv3pC6vIgbVsB/pvL3HDnolnc8?=
 =?us-ascii?Q?vR/MhReBqox+o0z+WwR6Am1AwvUKzl45tCQj0tEINDmna1nG/LESaFFbfaBn?=
 =?us-ascii?Q?SIMT1TR85LhBiZbLKVuYNRntPkqgGS1fsS4p8GO1I/t4QTf4T0rRtEU3DjUW?=
 =?us-ascii?Q?30JBxiOtOBnOiGGClJD4bnQlbh2E7daintGdoXfg8NCVVHztgaygHOUmE82v?=
 =?us-ascii?Q?1kmeWCRi/63PCs/prLqFoyyY7qshnnTcP1CuENaFuL86fNvm0SnCR0Z6cPrz?=
 =?us-ascii?Q?Py/aNLsTJEgMzynhPFP3VOn4+Lmq+3KbzG0shF7aTU7Hdpn8U337oCWbM2aW?=
 =?us-ascii?Q?s/TpVuZvw54PZyausiG1Ty4NJ14u6Kn5hYPjhduKzpK74cVDNDvJ4wIUEYL/?=
 =?us-ascii?Q?dEQ6haAy1xVsZUVsdLR/NTogoek9RZgeEwv91kvbkm8mSjTu27cnaOdbnhKS?=
 =?us-ascii?Q?qHfP27K6L8Vg9sz3rFT36BpIkhhHC0aYtOg13Y+BDMgLRn5mHRVsnV126pgc?=
 =?us-ascii?Q?pt4P33QagLSvp5bPBcSZLtySZoUwfaq0gckPzDFfLsvekW9rx9eos8qrW3uo?=
 =?us-ascii?Q?i0MOQHYNW0CWDyxt8g5mSZD6y+Og8nssIMH8yMEjS7jDVGj8qHtc9csKhgEk?=
 =?us-ascii?Q?n3ahoL2l3bF5nqUdIlfr4BgrytsszRJ96lDy+0Oq2sthXHAIpxJvXPH2XZnG?=
 =?us-ascii?Q?QMWyrTiisMTXW4wt2tvAxU94e+ym+phh9OuK0KsmFN4DKk2Ot+Dn1lhRBt0E?=
 =?us-ascii?Q?W782GsqNW2wRteXPFsj/XA0TkAGy6dLCS0ISq3rXwdKhfXK05rD9BzcRafbn?=
 =?us-ascii?Q?pRgfeXPFDU1bQlVynmnBkuSGNcyFMkGoZQy7CUHkVxDtZumIEU60TwqqWZ8v?=
 =?us-ascii?Q?+1IQGViAxRPIJNzXYpSH7sEZnJh4Qm6jKtNS0tu6qDdk5ci3y4tknMxK7w6R?=
 =?us-ascii?Q?utM+J9Yu1uHbeHm+GFtz+zSa495wVgWbPjDf3EDqIjcwMmCFatqpJWjTty22?=
 =?us-ascii?Q?jOuSAIesbgHb6B2tr+GASs/nuyt9kbnDkd1tBP1tdfrZmq7owtf/jJpF/Llv?=
 =?us-ascii?Q?8NRCPn9ilAxscLGXioyd1H4By6Z+CaURdxj7hiFOkt6awvQmZtilpNd435yd?=
 =?us-ascii?Q?mBCwqKmcVnPuM+zxMiFsYQJFdiMgpIum+kVZaJ61TgPvz9idsEh65yLLfqoM?=
 =?us-ascii?Q?2Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2903d270-8a81-4efc-4c29-08dbfc075aa9
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2023 18:14:32.1290 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Kp42tDbcVevuWKT2xgA9S3dQQfoBfCS0oRrrkcNgNCg9c3JOjCq3tnGHpcnRPawU8/22bB5tNSxCO384hIdDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6923
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

On Thu, Dec 07, 2023 at 01:49:59PM +0000, Francois Dugast wrote:
> Provide a description of the keys used the struct
> drm_xe_query_config info array.
> 
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/637
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  include/uapi/drm/xe_drm.h | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 7b18844401fd..cc1c6c5d594c 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -352,11 +352,31 @@ struct drm_xe_query_config {
>  	/** @pad: MBZ */
>  	__u32 pad;
>  
> +	/*
> +	 * Device ID (lower 16 bits) and the device revision (next
> +	 * 8 bits)
> +	 */
>  #define DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID	0
> +	/*
> +	 * Flags describing the device configuration, see list below
> +	 */
>  #define DRM_XE_QUERY_CONFIG_FLAGS			1
> +	/*
> +	 * Flag is set if the device has usable VRAM
> +	 */
>  	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM	(1 << 0)
> +	/*
> +	 * Minimal memory alignment required by this device,
> +	 * typically SZ_4K or SZ_64K
> +	 */
>  #define DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT		2
> +	/*
> +	 * Maximum bits of a virtual address
> +	 */
>  #define DRM_XE_QUERY_CONFIG_VA_BITS			3
> +	/*
> +	 * Value of the highest available exec queue priority
> +	 */
>  #define DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	4
>  	/** @info: array of elements containing the config info */
>  	__u64 info[];
> -- 
> 2.34.1
> 
