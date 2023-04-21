Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7BFEC7618E
	for <intel-xe@archiver.kernel.org>; Fri, 21 Apr 2023 23:46:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FEDF10E107;
	Fri, 21 Apr 2023 23:46:03 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C5F510E107
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Apr 2023 23:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682120761; x=1713656761;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=4ahSUkGZSoJfVadfU4Ab5xA/1PRxnsZXQsrajc6dolQ=;
 b=ZsBbuFAEh/WHvEWCsMF2QwR++1VEXtMaIkv5MQqA/hBtAHA0uMu1KRb3
 jP5ppYkza8be9RwosqjlB5r9Ow4XE2w1H57xInGysZT9sKUkIdbujS7U0
 QTcBEczArLDl/glM2UyOpbr+qiAF4mNfrgrtoSno2tslGyPyybK5H0W5l
 jt/fYTb1n4NeCFPdh7K4M4BErMeP2+Og1QS1BAsGNIqZg7RbY3uSOJjkn
 RyWEIz94iNLm5sBeZC0BGwqv9SyqppUEcG01EfOq8lqCv2Yx23jWqSEJt
 +pfgTbFsC0I9wFamoQz9IRTGBppFqO9nuPUJRjZnv41dehxHpEgzpK2RT w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="344856759"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; d="scan'208";a="344856759"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2023 16:46:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="725014617"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; d="scan'208";a="725014617"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga001.jf.intel.com with ESMTP; 21 Apr 2023 16:46:00 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 21 Apr 2023 16:45:59 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 21 Apr 2023 16:45:59 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.102)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 21 Apr 2023 16:45:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MQS6ZFDiMjqdVmn+f/FjyS6V/kbExfAsDa0uNLzYC2yPMi4bnMBTHkLB7x83I3MKnSfgekR2tHRTE+AN1gpfS7q1lOYC7SGfKK4XfpUqUzNWuy59O82fgXCXFp4b0Ps+oVg2Wau8VSD9x3ydZmOkS9hFH0dIMus4kv6+D+pSWGAB3RF3Yi7L0CVRKPXVfSRe0napYQtUbWfphWHe08n3f1Aw+JRPNEKxHQiKBRC3o/esdGn2dCVOKl6nfKK/mP04LUpfmT2K8c38zELHlVL0lUjD3HB9wARyUm7tztZ0IQGmMGDPrwS4/758vRcFGcgTDOfgeoOgxmkIKe3VOZJ1ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3BXhiCjxmxIGSJKjtJXkQ/N6W3JneO6fnwQhw2O+/ZA=;
 b=CZd3I04Sr3WeSJNe6Wyls9N1LcauRztyCA4nEWBznivY+RVvHfM5UoPrQ4OCI5NDm+kMtxI7QqU+KtIfKuo7iT9baT5GdPuttpgmAN2q2dBbb/BSBPp9AzrawWF2+h1RJWluBrvH7FXt8Y8lX4UF4gOyC0OVImp+km/535dga1dukwnVhvGcy2VxeikbDlhYZzgv2nlbTEYyXYji9xop3vrcEMn780jPFYscL/yqCRt3j3e5Pl77iP8dvGlQ0C5fvIaEcnox3Lairv2+LdFhFozMHIt4vWTvhPyW+V2W2nkdhF2i9pJ/cOol3NXe2rzfZP94ep5Df6ho97Bo87Bo1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SJ0PR11MB4797.namprd11.prod.outlook.com (2603:10b6:a03:2d4::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Fri, 21 Apr
 2023 23:45:58 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%8]) with mapi id 15.20.6298.030; Fri, 21 Apr 2023
 23:45:57 +0000
Date: Fri, 21 Apr 2023 16:45:54 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230421234554.GQ2825255@mdroper-desk1.amr.corp.intel.com>
References: <20230421223258.128781-1-lucas.demarchi@intel.com>
 <20230421223258.128781-7-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230421223258.128781-7-lucas.demarchi@intel.com>
X-ClientProxiedBy: BYAPR11CA0102.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::43) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SJ0PR11MB4797:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a20d0c5-bacc-4794-0b42-08db42c28da1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6sHs/JZ5pp5Ttv1x6tNLZDa0rkh6r3euh7s+JY2WwqeykrmS5ouB0uuBmH2pg+VPKzO0tjixHby4SpiCNgmY5586zmawcav5OihIUgwV/YyVTxJGTdEcw4GHBdqXUQJ6vYFsi7lBH3DZPNk3plh8vO6CvLuvTNMNAmglAi48OlgcIMBe1LBaYTyvPFisf4DqJJR1hT+iwgInsS1R9CKDPnUPDMJgQwKNISMVVAF6DBuO20HF6fMgneJA2/O3dGDKv3iQyGhJoR0qNZCvZU7wd9tfFj0bTFhsawynMGHM6SLXEdxiXn3Vb9m0RfBVjZw6tVG1Jsnozhh+GL59QB91eWLb+PfMi3R4puPuMWskVfe/+tgUCmiLQ62JWqLEw3xP9BN+i+KrL3FL1u/t0ndfMoUSkk106FKI8IzDWZfROiXgVIGK7v69NUOv2T5oupjZ45nFy+sQQ93JvNcf2oJrlnLiYnu4cYjGG6oHQLI2Orzsd/zTN3n+NZFeklAwnGRx6trr1YvK/HnBwQGZ4w/o89IWXs7yyLJv5jesD+NR2WQj+jQ2zijUm7Rnic/7gzEW
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(376002)(346002)(136003)(39860400002)(396003)(451199021)(2906002)(8936002)(8676002)(38100700002)(6862004)(5660300002)(33656002)(86362001)(6506007)(6486002)(6666004)(6512007)(1076003)(26005)(54906003)(6636002)(83380400001)(478600001)(4326008)(186003)(316002)(82960400001)(66556008)(66476007)(66946007)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?D+8XrfVXoTLrhjsoalm5BTzbYQ04y9kum7bcoKhCgQCdpVQbTJReubgfvtya?=
 =?us-ascii?Q?ZNsbgJ8K7b02tkKN46Y2fhtsSCdKg9NWD0DPpNjOFs8Ti0w8sBL+SRywuZ1c?=
 =?us-ascii?Q?r0M5+fNLnpDalBuLV/2SjJGO1X1hFE5dU1Y7goil1jxo5CrnKfgH7ZuwII/5?=
 =?us-ascii?Q?0ir8E9n9MYVOu7P6Ri6uSmj2oTDuj5bm/MUO6ndJYnEKwFQYSrttv2hNFsbT?=
 =?us-ascii?Q?FlFFCn/P/X11tGqJJlgQu3w5seILBsxgEmaEry9t/AUTy8jOXVkDaIDhoyRH?=
 =?us-ascii?Q?Jv0FqVRdzl6gpjGro/1ZZ3NfCnAYmfieoue/e5k8rXZGEvzjo76Ull+PsAdG?=
 =?us-ascii?Q?Qd/8ZB0Rw0z9xlZyI0249hHFjIidI4HpCOsC/stJ4AWck2o04yFEkHGY5I/K?=
 =?us-ascii?Q?VZQmIGCrD+fUbVgAjnAUcagJuGIp5VYN/aphSscmLV7O5DijsOgmqWSjyuW1?=
 =?us-ascii?Q?grEoht4YzWf3oxhpKSHBZeAqNSGcdNUZZkpyiDvgArTQKtprd3gHImEs/QWr?=
 =?us-ascii?Q?y1I9Sy2zd/HWVBRkefywzRb8bhVKw+oQdJc/iceFQ4TpUC2w3WAtNaRhozmV?=
 =?us-ascii?Q?SAPU7o7Yx4QptImgEuRZknlMVReAR65aKMkaP5lglaON2bfAOk/gq01Uey38?=
 =?us-ascii?Q?tZvuvfUw6t0tTIvOFJXymo2hZ4krv7Rl03nhtLWtJyKPLApRlWxoXPNh32R0?=
 =?us-ascii?Q?AM6s6t3jlzfzEoBjcw1sW7x9jvZIQhl2iOhTlUDHHRAXhM0QznvPlP4zAqRn?=
 =?us-ascii?Q?MXhGDKBuI3WS51t4ZNHLPWcC7FvqXvE/0OCTKyeoOeV4c1hQu+yP/lACO2dD?=
 =?us-ascii?Q?xKT1BPvQ4N5o1P59jyHHb2s5PvxoRBbF3wIo5g9aahDoLm9TlEKO17ZeqaM+?=
 =?us-ascii?Q?CbfWHEN/ipbjQptRMYaeiWEQj1E4ZXtnDWXsFYubhO5KC6d1tx6d19NM1QUr?=
 =?us-ascii?Q?UTOJbb9yJkctsdqMwjBatLyMW8I2+Lc328Cujdt9WRqwVSjtCDIoOfMM0Re/?=
 =?us-ascii?Q?R79R2oXEVFFqrqvqryCrxk9YNd2JEB+xbSHhqjYKLLPW+mTvL4ufIG+c6KFh?=
 =?us-ascii?Q?yHk96whahhADDjTcNlEdQqo8gHcqIE92QvOqMiOFjV+cRQKH7xu5kk1Xl+KJ?=
 =?us-ascii?Q?6AV/sReJ2FvEsq6Pn9HKmiZHesbPoCY4MyOjZJkSZ4bhI6ViWIb5Y7B0hJG1?=
 =?us-ascii?Q?ezfU9Mn3iUdruXg7KQs8lMiMr1OtNEBhaiyde2R/xETvDXuYeNMgdBh9c5ox?=
 =?us-ascii?Q?pOkRoKA1ZXtlIPaC4ergZw0Qreg+fAuIfli9yuN2RWH7daZLmYghzPSJ4w+9?=
 =?us-ascii?Q?xAD9wkdWDbXjqOvmqYZ+Zi6kkDsSHNCTebo/W16GiGM7RmJI0uSWqMsng1VP?=
 =?us-ascii?Q?4aFDB3jF+WjM8jGal28X5bkqasVel9rpEVof3PUzNfz//USEr92j7+EXLRz+?=
 =?us-ascii?Q?HboNW9EfsYZI0jqG01Ryg4cQS2IN+XF4cjKScivH06gqVE+v4IC+SybWY8ou?=
 =?us-ascii?Q?fZVmeSSddp4bAKpcuzPLhG3EaNzrWdSk2ayYa+0RGhOJxKtY+z9akaOCssXl?=
 =?us-ascii?Q?/wxKW5Oa9RduEkoWlw2yrtosvg/51E1Nl57HJnjbtefjcVGjosMHc0XEkYRx?=
 =?us-ascii?Q?Yg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a20d0c5-bacc-4794-0b42-08db42c28da1
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2023 23:45:57.3427 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y/xGpq6hjBCvQFB/B1sQSCKLyZbK+Wb3tOOJGR/h/0j4TsFBXOdRuRFiJSXhi7DzbMi07AU14juNhRLliK2PYwyvf+0gjo+sjLlj0aaBX00=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4797
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 06/17] drm/xe/guc: Rename
 GEN11_SOFT_SCRATCH for clarity
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

On Fri, Apr 21, 2023 at 03:32:47PM -0700, Lucas De Marchi wrote:
> That register is a completely different register, it's not the same as
> SOFT_SCRATCH for GEN11 and beyond. Rename to to the same name as the
> bspec uses, including the new variant for media. Also, move the
> definitions to the guc header.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc.c     | 26 +++++++++++---------------
>  drivers/gpu/drm/xe/xe_guc_reg.h |  9 ++++++---
>  2 files changed, 17 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index ee71b969bcbf..ff2df4f30e97 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -622,9 +622,6 @@ int xe_guc_auth_huc(struct xe_guc *guc, u32 rsa_addr)
>  	return xe_guc_ct_send_block(&guc->ct, action, ARRAY_SIZE(action));
>  }
>  
> -#define MEDIA_SOFT_SCRATCH(n)           _MMIO(0x190310 + (n) * 4)
> -#define MEDIA_SOFT_SCRATCH_COUNT        4
> -
>  int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
>  			  u32 len, u32 *response_buf)
>  {
> @@ -632,15 +629,17 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
>  	struct xe_gt *gt = guc_to_gt(guc);
>  	u32 header, reply;
>  	u32 reply_reg = xe_gt_is_media_type(gt) ?
> -		MEDIA_SOFT_SCRATCH(0).reg : GEN11_SOFT_SCRATCH(0).reg;
> +		MED_VF_SW_FLAG(0).reg : VF_SW_FLAG(0).reg;
> +	const u32 LAST_INDEX = VF_SW_FLAG_COUNT;
>  	int ret;
>  	int i;
>  
> -	BUILD_BUG_ON(GEN11_SOFT_SCRATCH_COUNT != MEDIA_SOFT_SCRATCH_COUNT);
> +	BUILD_BUG_ON(VF_SW_FLAG_COUNT != MED_VF_SW_FLAG_COUNT);
> +
>  	XE_BUG_ON(guc->ct.enabled);
>  	XE_BUG_ON(!len);
> -	XE_BUG_ON(len > GEN11_SOFT_SCRATCH_COUNT);
> -	XE_BUG_ON(len > MEDIA_SOFT_SCRATCH_COUNT);
> +	XE_BUG_ON(len > VF_SW_FLAG_COUNT);
> +	XE_BUG_ON(len > MED_VF_SW_FLAG_COUNT);
>  	XE_BUG_ON(FIELD_GET(GUC_HXG_MSG_0_ORIGIN, request[0]) !=
>  		  GUC_HXG_ORIGIN_HOST);
>  	XE_BUG_ON(FIELD_GET(GUC_HXG_MSG_0_TYPE, request[0]) !=
> @@ -650,17 +649,14 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
>  	/* Not in critical data-path, just do if else for GT type */
>  	if (xe_gt_is_media_type(gt)) {
>  		for (i = 0; i < len; ++i)
> -			xe_mmio_write32(gt, MEDIA_SOFT_SCRATCH(i).reg,
> +			xe_mmio_write32(gt, MED_VF_SW_FLAG(i).reg,
>  					request[i]);
> -#define LAST_INDEX	MEDIA_SOFT_SCRATCH_COUNT - 1
> -		xe_mmio_read32(gt, MEDIA_SOFT_SCRATCH(LAST_INDEX).reg);
> +		xe_mmio_read32(gt, MED_VF_SW_FLAG(LAST_INDEX).reg);
>  	} else {
>  		for (i = 0; i < len; ++i)
> -			xe_mmio_write32(gt, GEN11_SOFT_SCRATCH(i).reg,
> +			xe_mmio_write32(gt, VF_SW_FLAG(i).reg,
>  					request[i]);
> -#undef LAST_INDEX
> -#define LAST_INDEX	GEN11_SOFT_SCRATCH_COUNT - 1
> -		xe_mmio_read32(gt, GEN11_SOFT_SCRATCH(LAST_INDEX).reg);
> +		xe_mmio_read32(gt, VF_SW_FLAG(LAST_INDEX).reg);
>  	}
>  
>  	xe_guc_notify(guc);
> @@ -724,7 +720,7 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
>  	if (response_buf) {
>  		response_buf[0] = header;
>  
> -		for (i = 1; i < GEN11_SOFT_SCRATCH_COUNT; i++)
> +		for (i = 1; i < VF_SW_FLAG_COUNT; i++)
>  			response_buf[i] =
>  				xe_mmio_read32(gt, reply_reg + i * sizeof(u32));
>  	}
> diff --git a/drivers/gpu/drm/xe/xe_guc_reg.h b/drivers/gpu/drm/xe/xe_guc_reg.h
> index efd60c186bbc..0cd38d51cc60 100644
> --- a/drivers/gpu/drm/xe/xe_guc_reg.h
> +++ b/drivers/gpu/drm/xe/xe_guc_reg.h
> @@ -35,9 +35,6 @@
>  #define SOFT_SCRATCH(n)			_MMIO(0xc180 + (n) * 4)
>  #define SOFT_SCRATCH_COUNT		16
>  
> -#define GEN11_SOFT_SCRATCH(n)		_MMIO(0x190240 + (n) * 4)
> -#define GEN11_SOFT_SCRATCH_COUNT	4
> -
>  #define UOS_RSA_SCRATCH(i)		_MMIO(0xc200 + (i) * 4)
>  #define UOS_RSA_SCRATCH_COUNT		64
>  
> @@ -130,6 +127,12 @@ struct guc_doorbell_info {
>  #define GUC_WD_VECS_IER			_MMIO(0xC558)
>  #define GUC_PM_P24C_IER			_MMIO(0xC55C)
>  
> +#define VF_SW_FLAG(n)			_MMIO(0x190240 + (n) * 4)
> +#define VF_SW_FLAG_COUNT		4
> +
> +#define MED_VF_SW_FLAG(n)		_MMIO(0x190310 + (n) * 4)
> +#define MED_VF_SW_FLAG_COUNT		4
> +
>  /* GuC Interrupt Vector */
>  #define GUC_INTR_GUC2HOST		BIT(15)
>  #define GUC_INTR_EXEC_ERROR		BIT(14)
> -- 
> 2.39.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
