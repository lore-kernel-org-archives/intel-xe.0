Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05067C197A0
	for <intel-xe@archiver.kernel.org>; Thu, 16 Nov 2023 20:57:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2D4010E6F5;
	Thu, 16 Nov 2023 20:57:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D25A10E6F5
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Nov 2023 20:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700168266; x=1731704266;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=tozbjzvY0IjWhNCvvMuSeRWyISAd5JpWjfb7gkQFri0=;
 b=fvcUdYjFlWQvg72Wsdr649plCl4xIDwP5QYq+T7ZVdZNEjHoiAFIcWOz
 iajdM7KiZJQ8s2YBF6Qy1HXHxvHE0DleNw9LtWPPh46HCbDSEMDe7OVE6
 aydodTznFd+ixtFirRSyWaKhRP3KqTtIIrpZ3BcXKnm5/oyGnDX4d3kSI
 iT63KZG/vh59Yh5DOtIm063eUxBEZr5ajIWHgq0mkfa1/qDNEdh5DO+Hg
 tPo2/+9YsNU1VPB5udxTjP61H0ZDdXFaKfnd3cV+hN1HRd8YrFlBLGRtU
 2/ftiw71/YxtkbnuxMoYFtpFmcmBhjkp0IiqLqBrr+Lks5SRgo+JlspX6 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="390036502"
X-IronPort-AV: E=Sophos;i="6.04,205,1695711600"; d="scan'208";a="390036502"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 12:57:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="769027684"
X-IronPort-AV: E=Sophos;i="6.04,205,1695711600"; d="scan'208";a="769027684"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Nov 2023 12:57:45 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 16 Nov 2023 12:57:45 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 16 Nov 2023 12:57:44 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 16 Nov 2023 12:57:44 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 16 Nov 2023 12:57:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y/qsdpvoq7cMa9ZW/QkN2lfDDGz+GCD9do/1Rwhn8YEZX9Yi7DAeExbkVDs8kgMEAKo5r2V+H+mVBR3309V75p6pHQcozBbO4uGaIeddwwPWk7GPmFoiIN9S+/fXUgdo0nPYzpBmliiOL9XkVHDNKFyX4i3lpq7cAWwAH73uW5npSb8Xx+cDblM7mm8PAzMQiUBeR4lKZE263mABVfHjtNZvFUCNT29SfJ5FIDGxPswBKDR2JqahSGKVvgJynXKUmh3iKCZlxnknWAV+r72KSrOUjXzbahqLwH5SVAqiVvlOocBlzAmE2nZbbDpj2SFH4GGDxL3x05PJkc/XV/C04Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SbAkzwlPB8BlFCW8gamKOYf8DvnM2vuqq2lmbpJSifA=;
 b=TvHD9nG+HjgBGIVJfQO7J4MkjwMrn5HS8BKNgtVCJJtwcMxqyqafstyQgwKBOBLJvdqmvEgqn/ftG4+/+TMSIz/b7bAIkFfMl/nyZSeTjRaML+ZXsh/ZfRhoTzBS5kDMVO4dsuJVgpzKAViBZSga64PqV6+hLh7Oh+ozDIDEx9Hu3DChzD4wKHOJ7VrSInSpvYdSTxMJ9DLoBSfQhiWiaA1DZ16j+VohsAAi74tvL1lcusqHqeEAWQoWLDuf1xdGOO+M5CIfRIiFNhI/rVkjdhGYN7hU9t6rWWvU+KiL3fDjOISYOXu5zDO6VFyZnzIH2h+4KkSpknuzalG1dqyHzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CY5PR11MB6344.namprd11.prod.outlook.com (2603:10b6:930:3b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.17; Thu, 16 Nov
 2023 20:57:42 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7002.015; Thu, 16 Nov 2023
 20:57:42 +0000
Date: Thu, 16 Nov 2023 15:57:38 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Message-ID: <ZVaCQlfHCfblg8ux@intel.com>
References: <20231116144316.7-1-francois.dugast@intel.com>
 <20231116144316.7-2-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231116144316.7-2-francois.dugast@intel.com>
X-ClientProxiedBy: BY3PR05CA0038.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::13) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CY5PR11MB6344:EE_
X-MS-Office365-Filtering-Correlation-Id: 5eb9a787-279b-4b58-8923-08dbe6e6acc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0+kkz/QumSvhwqRXGxZ7Gg32eOXT833cziN659CjNh7Peme6t80yWKkZPM29hioJSomSm9RQ+gsjBHI2mvOAixxbDy2JQ4A2yhF19H5pW3BlvMXtSUkjlBSayneXSjfTc1xnog8u0HOzp7iY5/kkf6uSpPGLiuXeeY7GQMQ7E3O1DNGw5yA6ro0OmD3mloXg09eysywIdEdqwCD348cWxy1GXizZjyziOb13XWiFioMjW64UlmPqDoEWvsCEpqdTb2C8/b0RGR+EAVHnJVBKR+v/RALZjZZR98qR4bKvPDL4iL4UTwHEiQKaL3RIhP9YxfwFPYDCWcc6nZ33zBF43V64MFs6ShLDy28Fa4yeFt1DLU16+1ExCfeP4Xs3cYY91IhfJHyS/QuS/7t/PWu0OTIwBkXBWQOcG3qDiEcrN+l7EDTXE4S+KWGLVnl3q2ecjuS6LxhiNUs2MzUEoDmjdZ3uQkM/7gfJk6s0oXKovxo+orVdeBLYVEg4HPzaSCMJ8CPxmGvtraGZtJyRKGbK00dLL4lIzywidlWg4twyG01RZLdmWTva6vOp3qhpSAYD
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39860400002)(376002)(396003)(346002)(366004)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(6512007)(6666004)(26005)(2616005)(6506007)(6862004)(41300700001)(4326008)(8676002)(2906002)(6636002)(316002)(5660300002)(44832011)(8936002)(6486002)(478600001)(66556008)(107886003)(66476007)(37006003)(66946007)(86362001)(38100700002)(82960400001)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EQPxj8P2MTPw7PoYa+l5rKUBYb38OlqGLEIbUWBUJu23sMPXx6SAw8mCajL+?=
 =?us-ascii?Q?Mkz1RmpAIpNnmmplCe9byhdpjzMUtKmapsNu0LBAjluwgcoy52gHbtMxzaC8?=
 =?us-ascii?Q?w7hqrx1jYe2Wu5dACXLK2WzcAVvlcl1R7bhLUROAiDcYjqKIySMPMQ4RaCts?=
 =?us-ascii?Q?IqAblcB57V5Ks4mMmEiVI5fwCj0Lxf8QHPohmoluTyfKDpnSn9I7OGGBCFia?=
 =?us-ascii?Q?oKGE1y3qd37PQ6yyRe68kEC8KP2Ty5FdNSp3sfYSg4o8CgU7byLYmDgh/FfE?=
 =?us-ascii?Q?MDf12x1uiRmN/rqTV4sE/5De+Iqu/OU4JCzoW6ECwQ+q8PSjP1K5MqB+wLuV?=
 =?us-ascii?Q?EWcXM4XQJhRo2PRokoyHMH+nsYigZdZmc9CX9cgrqXDbXm0lxm00SLm3FJMJ?=
 =?us-ascii?Q?kQxMfiDlrMRZqfhFL7Rrdd3k5AuTcKj5SIPasUdfeKm1QHTuDaP0Qt7Gwu0Q?=
 =?us-ascii?Q?9eqgx3iHus5kRnVMt6y0DnxG1nAOFtthE72YjkyLs6SAlYqXV2cskRVq83ZU?=
 =?us-ascii?Q?kOeRLRmoVTAOb1lETVtY/pEso6WZ1zcJKT8bCg09Axrngllp3KAzf5N3T3Qa?=
 =?us-ascii?Q?XFgBdCWXCQo0eCldFaK75XNRfwyPlXdgLK9kyejQbyEYiUfUvS82gd6hYp6W?=
 =?us-ascii?Q?IwKHmUhhEbL5g96J39lLtMx+TsjaYCS2a5xVtx40xrONbn1YUHDKBMPbpUMf?=
 =?us-ascii?Q?LjfDyr1Ov4BfOors/sycPI+2gMWzf5RgViGpNCZVz+9Kh1mC4DmoedqIpmjL?=
 =?us-ascii?Q?i/WOaYwyn4pNHdj0y8asWJCf5LiuddGVu7fYEn9LX/l9jHuzpn/s2ClFkDDL?=
 =?us-ascii?Q?aUh/MgUxp6YEq1CxR+JpO+n8i+FZ712I5xPojfmtRHhPW2Y9bZncVomp5/kP?=
 =?us-ascii?Q?XNGD68ukjRK/dA/qUgXqmOEKS3zYqvJgdtYkHiic4+R5HeViAJc1o3fqY4ui?=
 =?us-ascii?Q?e6vA3Zgwz/xXnKnGubKEZJLRTtc7ee4rID60GpLm3Cl9bJUeqY9ZHlix8qAL?=
 =?us-ascii?Q?Dedqrvybf56XW0PzZqYMwmw078fJtK6HKJq8shuFmo4233IAX3mxWz6b1sA5?=
 =?us-ascii?Q?I9+97pXwHVFDkeSZ3Z5vF6FpxkTIXDM/jt4bRKodWKek0p6hUhrB0qAsXB8b?=
 =?us-ascii?Q?qR2RA58JkZXfN+bF+m2SdyYZjM9S6jUDXq6iQQN8i6GvELnkt4olQhasScWi?=
 =?us-ascii?Q?TifZkIpgiZUq/iarpRhK1sBS8WnJa8poX/n8/clyTQBiwHuQRBUW69YPpaIG?=
 =?us-ascii?Q?VKOwpsfmCoU/IdzRrxQX4uN/KdBkI8U0U3MF3eDMlmkTveF0ZiEoG1wtnR5m?=
 =?us-ascii?Q?kEgeXXAtyEyiua8vHi9FLcLsjepSljOK9IIpB4sqsvQKhC6KVFMY+6TQkFDP?=
 =?us-ascii?Q?v7Zyp8UBvQ4FvpRPclLA/72VdJwmfwgp7B/bDEXz/pRc0+RqYlfA3qjg1ev4?=
 =?us-ascii?Q?PA/UhOmx8qYqGiXheIapyaOyiSHrQC8UVT0S5hOY9SBZ0zk/VknbTtpoBXuw?=
 =?us-ascii?Q?YW2ZR1GMorJ2Q9xi91s898NViW4x490WbK0p8x2LRwvF0PZhUNgzeOR931nj?=
 =?us-ascii?Q?iGNwTuLLy6TFvHmbolK3ozY2MSgfiK/X/imzo17O?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5eb9a787-279b-4b58-8923-08dbe6e6acc2
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2023 20:57:42.0718 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VAaOlgqoYSgPB25lCdi0SCUkp5Rlvw8cOwla5bJkWE57hShnr778lpJiWDKXbPC2qaEvhDVF182EiX65v5TbGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6344
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v1 1/8] drm/xe: Extend drm_xe_vm_bind_op
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Nov 16, 2023 at 02:43:09PM +0000, Francois Dugast wrote:
> From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> 
> The bind api is extensible but for a single bind op, there
> is not a mechanism to extend. Add extensions field to
> struct drm_xe_vm_bind_op.
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  include/uapi/drm/xe_drm.h | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index d66e8dc72e96..eb53c7a367a1 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -613,6 +613,9 @@ struct drm_xe_vm_destroy {
>  };
>  
>  struct drm_xe_vm_bind_op {
> +	/** @extensions: Pointer to the first extension struct, if any */
> +	__u64 extensions;
> +
>  	/**
>  	 * @obj: GEM object to operate on, MBZ for MAP_USERPTR, MBZ for UNMAP
>  	 */
> -- 
> 2.34.1
> 
