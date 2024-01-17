Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF347C47258
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jan 2024 13:49:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86F8F10E6CA;
	Wed, 17 Jan 2024 13:49:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65F6910E6CA
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jan 2024 13:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705499341; x=1737035341;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=W4v7BWZr6N0ubEFLYIDl/c7yjcIc1m0OFf2FkU47c6Q=;
 b=WWL3xEx7fnYwx1r8TVh5rZB7W+iuAVCXh9hZj4EN3ZrgBWtov4j4aaDG
 4MDIbbW+Qf6Rl/a+h0JISwQW3EZ+1TCO8sYHwiSYi/faEwtAd4QvddWcF
 50nzaF3UYhFP8TpJFEaRmQQsgQzsCm1sxZYtcM1/GnL4P6NE0n5cE/yKo
 G935eKJAzMOVxDPdMvCgSbSnP0eU2W2D+QYGdqoeMd0TrwtKuFxmQjich
 c5DQ6Y1EOfgYtkJjHcZpuWrESlWMz/cZklOSziE70U81IGWXMfhZy8Oc6
 0KXSmHNTiTdwyqzRuK3NRdAKcnR03rJTQIdt8MOvlx91E2k04ffQE0Zz0 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="6885683"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; 
   d="scan'208";a="6885683"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2024 05:49:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; 
   d="scan'208";a="36975"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jan 2024 05:49:01 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 17 Jan 2024 05:49:00 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 17 Jan 2024 05:48:59 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 17 Jan 2024 05:48:59 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 17 Jan 2024 05:48:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CIzoE0JMj694MPxIVJFxcHByHADc6fsFY1OgYSO78ISkrLjxH1T/o2yyFWsa8e79D/srptzt06s6ZSw7Qcw0mG7MKsK43WuooZmI0NxCYzqha4N/A2t+5o8tNK1XP1p9hKR8OaU0ruZj+e5y/uVEoL70qx6BGHdnUWFewHmoGUY/tOylKE5srmd6kpZl5JTwQZIR6SiuC4QwJUa3wCh2LGe1Y7yVft+plzP9NtELWTaRZSUeeDnwyLQvog5x4Nxpezs/1hn1Bsxq6KU1q6UYA9D7MIXYzOokBMkvF6BVutdc6tlJtiovYWSlm7boWHq4Xo+jKF9qysrEyD6ekchEfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7pOk8a37x9ctb6B7qM3IrimCyslahXjc7bIcefiTQoc=;
 b=ZxPa1XmPTsM/4JqTjH5XcrAE0OiARlZr0g3os1EyAcoD/BhXYnrPrvNM9xEVEWvWzL4D+HKMZau4bjwkocauqg4eb+rthhz4Uy9hcCSZiOp80EOFN+vozLazEGnmChGxMal1OGRS+iYO5Lbp9/a075ykvNV3UvNJMUZ0L3FH9io10N/wqmTpVx5R6W+U4kmzopsbRjXceLneb8D1l+tGHwWKGKexQQS2gmJFbV5tJePXi277bUNo7pPvj/TdF9lOQ8064k0nlO1PLbmQTleEjC9sYjQDFhBOVK+4bChNVj6G36mayKb0NVdPdzEIr4Xf2BY8TkMvGdO4h3zY7hzD2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by DS7PR11MB7808.namprd11.prod.outlook.com (2603:10b6:8:ee::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7202.23; Wed, 17 Jan 2024 13:48:57 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::7d36:1951:b896:cb37]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::7d36:1951:b896:cb37%7]) with mapi id 15.20.7181.019; Wed, 17 Jan 2024
 13:48:57 +0000
Date: Wed, 17 Jan 2024 14:48:49 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH 1/5] drm/xe/dmabuf: Make xe_dmabuf_ops static
Message-ID: <ZafawfBlN8om48GE@fdugast-desk.home>
References: <20240117134048.165425-1-thomas.hellstrom@linux.intel.com>
 <20240117134048.165425-2-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240117134048.165425-2-thomas.hellstrom@linux.intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DU2PR04CA0187.eurprd04.prod.outlook.com
 (2603:10a6:10:28d::12) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|DS7PR11MB7808:EE_
X-MS-Office365-Filtering-Correlation-Id: 84fd2a8a-ac43-42d6-fe24-08dc17630d3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eyFuGeZs2jpBu7lyHsoB2rvtiNyuOsXG8N8hJmSxB8MWODO/HU8a5RUN5H28c3vK4F+QzdWuuidcMvqJ1PILecEG72iefUFxdafKrj+KcjGY9f3W8c1uVcOfaFjjC3kEnrRbS5GsecyrBV+scVlm7q93Q7q8zNQtp/02LPkOlkE8mQKLEKpb8VGKRPhIQeyESNdyNkcE9iUPuxw+GeDYq/3oZe51WYJpYTk1bZHbTCnzfrLgkhFt7jzijF4sGl0mkueIDKbhh2eipDoMZ8F1tBQQWDXKK14dvFSVk+g7I/x40HNekM29p4JDuPiYYqslAZ3peuDmaSEm+YMGFibZZ29+yEj/6P9FENuF/8IyMjNWSyrklDkcXMinI3VPoNPZz5ASRPlGLwLPx2P7+1TlMKvlgI2GIB04gwyo6gFfqR6wgPo2QbCJiFn6XjqOMATmpcIa5hns6T9ngt1q8ajlO+cCTUJbVHn2MVNx04l43YEAnLzUuLimsNY9efYwem5oMBEhOLxMgI7yiDRM0voC5TpuWnw9M/9ylgL5Q/sLMxnbp1cO/wKd7tTqthzPnzjI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(366004)(39860400002)(376002)(396003)(346002)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(5660300002)(2906002)(4326008)(8676002)(8936002)(44832011)(66946007)(316002)(66556008)(66476007)(6916009)(478600001)(6506007)(36916002)(6486002)(6666004)(6512007)(9686003)(83380400001)(66574015)(26005)(41300700001)(86362001)(36756003)(38100700002)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?wj1UpM8HAyYOfZmG8LseqiNWPqOZGfIDi+csKl3Dw8M7JY3+YWLa5Y0ytC?=
 =?iso-8859-1?Q?p7J5FBeJqDZTb6kQ0lHszxwYod/csl/EiySOXO7MekIzGSaslRNoG7XHS3?=
 =?iso-8859-1?Q?Twp9IOyml2EFbDpWRTk3wJ161sN/MRB5ZnhASQDptT069n0xu/96Ek5qmh?=
 =?iso-8859-1?Q?YatvIM3345Cr1ROXq07wue477a4+XN6SZ8X/wRc1NZGZupNvQO0muoRlZk?=
 =?iso-8859-1?Q?w5D/WyKNpkWrRlZ2BkmC7Hw33+yxTl5JUylennd6WwqPquMrWHZKzr4IZP?=
 =?iso-8859-1?Q?psCoKnb3bnmYbvrlQ7sr22JIxFbyCbQHPxXGA4T78XSGRQG4Secvr5uHhB?=
 =?iso-8859-1?Q?N8nzAjoNFYkfSav66JelyW0GxdPm9ff8Drk5kLxWV/co/IeH2nuHZOCGiA?=
 =?iso-8859-1?Q?ax+HPDj7nhO5YdgU/SHkclGeorLSadR8EqXhc+BkSA+XqBK4gp+/5Q6Iah?=
 =?iso-8859-1?Q?1Qq4VbD0ZLIj+DFbkxL5/VnE5bC9wSD+A7Y7lPccrP7WMwz48x8Xon2cdw?=
 =?iso-8859-1?Q?Tl4Jq6u0NLWMvlzyA7nN3iEdWwXQUzLGGWAMq3tTAMD48rvxq9WxBWaE0a?=
 =?iso-8859-1?Q?7H9M64PH3Kv3R2qP7S7fO9xF1lHD3tlACfQa9+lQo3PqfJfpPrRN6Ejtph?=
 =?iso-8859-1?Q?g/Gq9eEmNHDsHJ4ciXirlLNUPtsoAd4cB4lO92RfUyH7GcIV9pjMuP7g83?=
 =?iso-8859-1?Q?z7cxYoj/17FoUJ3sN2jM7tL9HwwMOX+gNFIIK9asJ8XNLHdUe6Oye3y6Au?=
 =?iso-8859-1?Q?DF7dmTnBps+Zyo9oZ57smjY7nCXwCxplvuCGc/6DXB2J38xKRd17tm6PGg?=
 =?iso-8859-1?Q?gdGCxPN1J0leJNKfLthB2qZUQCxqfXXL+UjQs0DJf8icpfTnCTyFlZRP4I?=
 =?iso-8859-1?Q?s5xxLG3kM4nxl76MeSgf/xBwGSzBQv2J3PzUyKtYRuK0IjY4jYzTDTQtxN?=
 =?iso-8859-1?Q?TeD9zJHbHZLJk6Rjeb53hqzffOSGKL+tCyzsTS/FswVfaeU3xP2uaVHEn2?=
 =?iso-8859-1?Q?sTVC0doapafNMnCfr+JMEb4zno/qypvTaHu8cZfqbwbyTii7HyDRwHIyHD?=
 =?iso-8859-1?Q?/CQRr4wD8RzW+1yzK2rqCNF0SzVddptB60IeF4HcwjHq6OoWGnpkVFD6j2?=
 =?iso-8859-1?Q?Pa0Dwg8zZg6+pKhw079LYEHhD1UYFfmM+hiyUZ/kkByza+4K+mGLnOL53F?=
 =?iso-8859-1?Q?oPkrCk8o0F6m8Gv7rjd96hF4dkrUUhHYZUPRMSHSiiTbVTJMuSCuwLcn/h?=
 =?iso-8859-1?Q?Xe0q4AJProH6khhNyoBGXTmP7/3TxMUDcbgmyEpYQA8mXgfROsQi8xfzEy?=
 =?iso-8859-1?Q?3sbmXjHgxXzzgUFS/GVzC8PVFWHY0cz1Q7RPYFUnjjBZCCoxG0c3M4614n?=
 =?iso-8859-1?Q?Q4wbyQz0EgZQv1/eszKaCvs70O3JVnBrtnRKhG6QqhD6Mxgkx2gAXHv1+R?=
 =?iso-8859-1?Q?65mOnShrRKsmSxfir1XzRJckWkvZmiKdu8Y9oDXwpQRlP1+1oFfpFE7ufe?=
 =?iso-8859-1?Q?lC1kf4tRwRCzdyKks4yPbRDcq6oZr0N9xOzJ7sgvbmkZh7zLOPzy3jnK5e?=
 =?iso-8859-1?Q?+JCUZyDnN3tKgooHxKzDumC5QjkpyuIPbsXEuF0NbK2Ohf2zGvaG+VEZS0?=
 =?iso-8859-1?Q?5eP3cl5xV2WxBCagXJ0eCFuRsV7iQFdWL60g+TglLN/e7AyJge79+sCQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 84fd2a8a-ac43-42d6-fe24-08dc17630d3d
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2024 13:48:57.2267 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q35VPGrArwMwiBn5I9UbiMsLW2DY1rjqX7vfE9wGNO+AUT1YTuGIKSTZ9PjXFtqiiq6+pV+8v/z3OjWAms6hr9EFY+b5JKiWC5vJRDUCvqM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7808
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Jan 17, 2024 at 02:40:44PM +0100, Thomas Hellström wrote:
> It is not referenced outside of the xe_dma_buf.c source file.
> 
> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_dma_buf.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
> index 64ed303728fd..da2627ed6ae7 100644
> --- a/drivers/gpu/drm/xe/xe_dma_buf.c
> +++ b/drivers/gpu/drm/xe/xe_dma_buf.c
> @@ -175,7 +175,7 @@ static int xe_dma_buf_begin_cpu_access(struct dma_buf *dma_buf,
>  	return 0;
>  }
>  
> -const struct dma_buf_ops xe_dmabuf_ops = {
> +static const struct dma_buf_ops xe_dmabuf_ops = {
>  	.attach = xe_dma_buf_attach,
>  	.detach = xe_dma_buf_detach,
>  	.pin = xe_dma_buf_pin,
> -- 
> 2.43.0
> 
