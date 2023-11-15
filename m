Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9158C072A2
	for <intel-xe@archiver.kernel.org>; Wed, 15 Nov 2023 19:03:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CCFC10E17E;
	Wed, 15 Nov 2023 19:03:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A687E10E17E
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Nov 2023 19:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700075006; x=1731611006;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=uYXR3S+L0L+l5weP8N063pddqzL1dq09CeraIecWx6o=;
 b=Tf8kIrkp0FwEivMVQxg5q+OaJP9WX+V5fxcmyCdTV3oy2xxtGtbsTjHp
 aopUBeInAkoSbkX1FBfedr/UOr+WHN45mCoktrQcKv9q0XNDv/2fm7k8a
 D8LJaDaO+uFBrvaBifSuNwQ5uWiW4HAwxhQe040r+XxTfDcreV3QYb4Wo
 gPadnIT386Rps41rO8HzpEwu7wojZcLvHD8MT+Fg8amjPOMx0DW7hfUaL
 n6f7Oe1uyB0yhT9NUyCh4hXU6EyGPFFb/AMmd0NopHxZxwCN1a/EONd+O
 2RAUC04SZbj8pxr8n3YoxPs5+3vmsnzRW720EfENVr0RjS7GUwsoNXKsX Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="457430167"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; d="scan'208";a="457430167"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2023 11:03:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="831023063"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; d="scan'208";a="831023063"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Nov 2023 11:03:24 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 15 Nov 2023 11:03:24 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 15 Nov 2023 11:03:23 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 15 Nov 2023 11:03:23 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 15 Nov 2023 11:03:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AwZPnjGAqsl1RwtS/ufal7DMUCuVU/AI6ucio5wekAT7aSF/iCbkxSowkqeg11wz0e2uIyrhPAkUnp0MW3/zBzEG7pKgCZFKujqWQNuyOuBtSqu2uwOzVL50OYLP8OSFqgI86LFZbwRRcyI4tH1YloWd/Lk03X+flv6xbDNJ7vm8hhL5Tdc71zsdEO72nAbifKF8172UrsBBnft9FGMW4F3c5abSzex7MpEcPVzpyk4VSjEsce4u95ZJucjJ9kHoG+jbAj6g4UqGEIihbdvAOIPiqsQJLrkS097rvaRmaJrtqagAjQiyyxgMgE+VsZsh4GqKKLxga/nz7GdYM6jk4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z//beTY6ZB8n/tjHIwk/fyT2X4aQYzRoqKNbwTq66H8=;
 b=Sxobzn4haTVxrQXnqhPFsRt2tU3qOtZU1oUy6OhCQ0tw7WxQ73XFYCMSE/XXUGcjLnM1WDdTLhBeQeSq/mvUea6IaB6yk4rcPcIbo498N7yXWaESnG+PfMX4bEC25HfjjQhSd+n8fXiF1zUXJsavExWTAdkEUWZVAr36RAwP2oU6kWiOgjYN+DwhbkeRVOywdsaa9tSFrFQ3ZL+shN5OeQPfoLvEccYA5nUM7aNIZyecOwpCRfr8A1mGGA7Cjc8ynx/VMJHxBt6vHpCETPyHoiwJW23guHjx2djcDJ6HNdKhn0iAfMHkYYTWAzWfmYsfEXh72xShrwR8yZEbimo1qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SA1PR11MB7699.namprd11.prod.outlook.com (2603:10b6:806:338::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.29; Wed, 15 Nov
 2023 19:03:06 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0%7]) with mapi id 15.20.7002.015; Wed, 15 Nov 2023
 19:03:06 +0000
Date: Wed, 15 Nov 2023 11:03:03 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Message-ID: <20231115190303.GI1327160@mdroper-desk1.amr.corp.intel.com>
References: <20231114133434.7-1-francois.dugast@intel.com>
 <20231114133434.7-8-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231114133434.7-8-francois.dugast@intel.com>
X-ClientProxiedBy: SJ0PR03CA0231.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::26) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SA1PR11MB7699:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f448aca-9076-4e9c-fc65-08dbe60d7ff8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eWm5JRMPZFbylM/DNrNiwOUp2cyRL0hIlL+x8E7eKXd4gEarl1Q2HHt9NKLEkwlhuL9NgsUyB8DvllfI5yVPM1bNIEpaCQ75qGKnkGJk4nWcuOryHqGypzUUmguuk0t1JEwLZX5QLpj/ulzI7vUVcGcKD5Vutc2wVHgq0DtdKp7uHv7EHPDOHOzI5xzFYmac77Eibjc80CjYijCFTojwqBe/BrQitBesKanBwpvKiaHXXXHgRBZtvSWqnIZPCnfSG+4PypAiQq1v+BJR7l3WOJzvWaIj9vrUKidtRbwG5+VOfSSmcbLFSx/IQ/H1Ure7hkBIboMpFDfVMTG04G/x3GBkZ3mSyFPIraxarOj8YFMqgL5yiQFf1c9psUSazwIMHrksRYz0GQ3THITlOH5QHPgY5EiJbuyVRx6ndXe3Rsms34UuU3w/eK5Bay1+UYmtIow3hxI7KAe8T40+N2scu1LZe5jpVrp8R5PCrzph9uJ43hePyIw1eLjJLT9aOWl4NYitrYZytXxQH3+5ISzQ/877f43vG7xXbpIVU9V3nWM+y/d4bcM0iKHDMfa6REe1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(366004)(376002)(396003)(136003)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(26005)(107886003)(1076003)(82960400001)(38100700002)(83380400001)(86362001)(5660300002)(6512007)(6506007)(478600001)(6486002)(6666004)(66946007)(8676002)(6636002)(4326008)(66476007)(66556008)(2906002)(6862004)(8936002)(316002)(33656002)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bAfjIuckPG9oGJ9EbZZ+ApZQsZaYB0Of/koqTazRndHGNvIsq/UdUQpK0dZ2?=
 =?us-ascii?Q?Lb6NEDGRrlw7oXRYEgqDgsRlNjFtV0pDshZPZBg98xAz64qoVp6F4jZ1jlwQ?=
 =?us-ascii?Q?Mo3NGPDM+40ECVXEO411t2ZfBT/F3jer9YBDiWA+2uxP7EnEYklutIFQP7CN?=
 =?us-ascii?Q?yfKnVSYPXzrxLpaQ5SG2kBhPakdqE1BQCbsD9s3GAWErfUTJThHDec/P0TQU?=
 =?us-ascii?Q?COMVVjclRbEQ5Gq40opJqhB+s4hT5r5O9wV0ngiCSu0Qn01h9L3UxtjEFCgK?=
 =?us-ascii?Q?2BxjR7rTwQ2fD2vd1CMsFtCCULIAHNzfPKvuKk/Gi9dqiOgtBMF4hSryTVLj?=
 =?us-ascii?Q?H23eE5accUwKKBLVIPspZ3WB7YHYp1yY6r4AMjIN8h4jq0VB9Fddd707tsYD?=
 =?us-ascii?Q?zDFESanFLv6TMzIgDudZ8EheGX1+CufuXgOQXl/jJGikYNSJYdv/6s0rKky3?=
 =?us-ascii?Q?O0YHqMx4chB/MFNkxS1Si4ctGg18xVSM+QiruFDPUhO86oP5e/uyioG6x9Pl?=
 =?us-ascii?Q?lzlvaU6Y/ga/MRuinzzRScBRbtVfI3lFxprJz5Y1SYjaZ+I9GRr5UtinGzPf?=
 =?us-ascii?Q?70yXIpjmDEuNnBBFGavUwz0OW8I5KSZfUHgsQGcJC86+FkyLqbd/18ITRrrk?=
 =?us-ascii?Q?jf805hWkh5ESVkydDo908MM8YDbuAHtSva1yJDYkmRVKT47O0OJE/8UwSTbh?=
 =?us-ascii?Q?j0yseTlpmFyLQgiIaIj/paiEvEB3cRTGpkNp+gEoHn+FX5qUhPU0MU+iWTuG?=
 =?us-ascii?Q?QwN4MiJo8xMKWPOhckW3FO/tysHuI8vxinaRXSKgIiZt2j4ICFaUbzKH4V84?=
 =?us-ascii?Q?b+RUYLZ+72ZAHL/5Pw8JE3fTkk1WCAFcPzWgjlSjXRXb5FuF3uUbT4wJ5GXT?=
 =?us-ascii?Q?eL85ozfv2c7XR/chcNBgfE+aAMXcEm/uzGNi63Bpwcd/c23v5ltYXip4lbF3?=
 =?us-ascii?Q?yDMZhRRYfs3RByYbXRNFWAlbW6161tX5ibUGjscfGbXIgsb2IkkYXXBoMB5B?=
 =?us-ascii?Q?xPf0bsPaEuZb5AV2sbJgq0hmteLs5OqhrnH2fHWMqa8VRWRtXXvaJYALQt4F?=
 =?us-ascii?Q?0bd5YJepbi981UCRaYE5VNz7Ke1FJy93crrKBIpNb+TOgij+3QsEcohfh1XJ?=
 =?us-ascii?Q?M8XEgVtDh6pykR4yn2qaHhcRXUkNCjjwueLE7LNrwTU/1ltsEQT2JfhEGU+A?=
 =?us-ascii?Q?B3M6b1LAGrJwLVb3oglf23HahJhf9QUqMPBUG/0VQUXIWWPI2olP9kaqG0Ic?=
 =?us-ascii?Q?wCWwGIKIXiikx7oQwdhk6b//yCeQqkoQEVhWHrclgruSvN+H+Szj6WGzAsTG?=
 =?us-ascii?Q?jatO+s8o059JF7U0UNOxYo3mUtRhl7NlFuQe0tKRLzcXfAsAG1mMFjFSfSco?=
 =?us-ascii?Q?N27am3ptRikKO3VTrs33U33FJzsaVpH/bds21E4zCI6lyupT8Qg9yZY4xSTR?=
 =?us-ascii?Q?hV9zdaBkWb0d7Z9eo4r/ma4aih5DjXy50kBFO2hk9qvhhJWeIGo/p3t++SNE?=
 =?us-ascii?Q?14pf4fJkQ6ejU1niurCb/7HN6ozQB4mzED+uvSnS9fFlO/2YDZYsvB6bmu9M?=
 =?us-ascii?Q?79NoJ+EvVvZy/mr0GgS3XU7avhJDuNVIlJckT+f62dJjVIEp5XONcphTf9MF?=
 =?us-ascii?Q?xw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f448aca-9076-4e9c-fc65-08dbe60d7ff8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2023 19:03:06.0298 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D3WML5Q0T9yqz1yPXmbop7lYa1NAt2O0LY3cm+xGUD7d2G2qRMOjhoZxtAiUFfF6ET/zYuhoDft8yMK7c4D6FIVASvZOSzSGJw8IB0SA9Cg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7699
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v1 7/8] drm/xe/uapi: Differentiate WAIT_OP
 from WAIT_MASK
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Nov 14, 2023 at 01:34:33PM +0000, Francois Dugast wrote:
> From: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> On one hand the WAIT_OP represents the operation use for waiting such
> as ==, !=, > and so on. On the other hand, the mask is applied to the
> value used for comparision. Split those two to bring clarity to the uapi.
> 
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_wait_user_fence.c | 14 +++++++-------
>  include/uapi/drm/xe_drm.h               | 21 +++++++++++----------
>  2 files changed, 18 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_wait_user_fence.c b/drivers/gpu/drm/xe/xe_wait_user_fence.c
> index 13562db6c07f..4d5c2555ce41 100644
> --- a/drivers/gpu/drm/xe/xe_wait_user_fence.c
> +++ b/drivers/gpu/drm/xe/xe_wait_user_fence.c
> @@ -25,22 +25,22 @@ static int do_compare(u64 addr, u64 value, u64 mask, u16 op)
>  		return -EFAULT;
>  
>  	switch (op) {
> -	case DRM_XE_UFENCE_WAIT_EQ:
> +	case DRM_XE_UFENCE_WAIT_OP_EQ:
>  		passed = (rvalue & mask) == (value & mask);
>  		break;
> -	case DRM_XE_UFENCE_WAIT_NEQ:
> +	case DRM_XE_UFENCE_WAIT_OP_NEQ:
>  		passed = (rvalue & mask) != (value & mask);
>  		break;
> -	case DRM_XE_UFENCE_WAIT_GT:
> +	case DRM_XE_UFENCE_WAIT_OP_GT:
>  		passed = (rvalue & mask) > (value & mask);
>  		break;
> -	case DRM_XE_UFENCE_WAIT_GTE:
> +	case DRM_XE_UFENCE_WAIT_OP_GTE:
>  		passed = (rvalue & mask) >= (value & mask);
>  		break;
> -	case DRM_XE_UFENCE_WAIT_LT:
> +	case DRM_XE_UFENCE_WAIT_OP_LT:
>  		passed = (rvalue & mask) < (value & mask);
>  		break;
> -	case DRM_XE_UFENCE_WAIT_LTE:
> +	case DRM_XE_UFENCE_WAIT_OP_LTE:
>  		passed = (rvalue & mask) <= (value & mask);
>  		break;
>  	default:
> @@ -81,7 +81,7 @@ static int check_hw_engines(struct xe_device *xe,
>  
>  #define VALID_FLAGS	(DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP | \
>  			 DRM_XE_UFENCE_WAIT_FLAG_ABSTIME)
> -#define MAX_OP		DRM_XE_UFENCE_WAIT_LTE
> +#define MAX_OP		DRM_XE_UFENCE_WAIT_OP_LTE
>  
>  static long to_jiffies_timeout(struct xe_device *xe,
>  			       struct drm_xe_wait_user_fence *args)
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index b3df99dd1023..675194886851 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -914,12 +914,12 @@ struct drm_xe_wait_user_fence {
>  	 */
>  	__u64 addr;
>  
> -#define DRM_XE_UFENCE_WAIT_EQ	0
> -#define DRM_XE_UFENCE_WAIT_NEQ	1
> -#define DRM_XE_UFENCE_WAIT_GT	2
> -#define DRM_XE_UFENCE_WAIT_GTE	3
> -#define DRM_XE_UFENCE_WAIT_LT	4
> -#define DRM_XE_UFENCE_WAIT_LTE	5
> +#define DRM_XE_UFENCE_WAIT_OP_EQ	0x0
> +#define DRM_XE_UFENCE_WAIT_OP_NEQ	0x1
> +#define DRM_XE_UFENCE_WAIT_OP_GT	0x2
> +#define DRM_XE_UFENCE_WAIT_OP_GTE	0x3
> +#define DRM_XE_UFENCE_WAIT_OP_LT	0x4
> +#define DRM_XE_UFENCE_WAIT_OP_LTE	0x5
>  	/** @op: wait operation (type of comparison) */
>  	__u16 op;
>  
> @@ -934,12 +934,13 @@ struct drm_xe_wait_user_fence {
>  	/** @value: compare value */
>  	__u64 value;
>  
> -#define DRM_XE_UFENCE_WAIT_U8		0xffu
> -#define DRM_XE_UFENCE_WAIT_U16		0xffffu
> -#define DRM_XE_UFENCE_WAIT_U32		0xffffffffu
> -#define DRM_XE_UFENCE_WAIT_U64		0xffffffffffffffffu
> +#define DRM_XE_UFENCE_WAIT_MASK_U8	0xffu
> +#define DRM_XE_UFENCE_WAIT_MASK_U16	0xffffu
> +#define DRM_XE_UFENCE_WAIT_MASK_U32	0xffffffffu
> +#define DRM_XE_UFENCE_WAIT_MASK_U64	0xffffffffffffffffu

Do we even really need these mask defines in the uapi?  It's not that
these are the only mask values accepted by the ioctl, and it should be
easy enough for userspace to figure out how to build an appropriate mask
without these defines.

Regardless, the renames look fine so

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>


Matt

>  	/** @mask: comparison mask */
>  	__u64 mask;
> +
>  	/**
>  	 * @timeout: how long to wait before bailing, value in nanoseconds.
>  	 * Without DRM_XE_UFENCE_WAIT_FLAG_ABSTIME flag set (relative timeout)
> -- 
> 2.34.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
