Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3390DC74A5B
	for <intel-xe@archiver.kernel.org>; Tue, 21 Mar 2023 15:51:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFAC010E7C5;
	Tue, 21 Mar 2023 15:51:27 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B860610E7C5
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Mar 2023 15:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679413886; x=1710949886;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=HU7RMbkJjBXR7GRKbH56/RU8ZjbpWKeMC27AIJbzNVo=;
 b=Atz456R5saqftoRVCoZEALFEXPUYu3HXMzhHUrOhXHgbmboW3JFFCZUu
 wJhrI9jb5AwcOyq/DngxIf/1u1LzqTQgjyQv7L6FnBpwmXHo8f6j/ezfz
 R+XGHwSgyzgl2HIEK4QrARIAwE2oVBongsG/TXd5nMT4d/G2EKIyMYQ42
 +Bc4UtIw/VDq6u84ckSTm3MC4vv/I/4fs6Ochgkcx7ycJRvbPpmx58sXW
 B0o4tCHgVCAwcQwlcr49itMceghlPl/NFgzCS0ezWPBNBQ+z2CMBFnPrO
 F9uGeDZKOF+rnsaIOL1CR75L9KZ7crNIKteqBhAHyKizx7UrtmVYGVAsU g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="327356801"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; d="scan'208";a="327356801"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 08:51:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="805423479"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; d="scan'208";a="805423479"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga004.jf.intel.com with ESMTP; 21 Mar 2023 08:51:05 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 21 Mar 2023 08:51:04 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 21 Mar 2023 08:51:04 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 21 Mar 2023 08:51:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nDDDJTWF0wSSJuBgVceZCSjPU8MgZvQTsZ7DdBqwYd9e+/fZeOSWc1coJZ72MMn8v34aPDdbS334/1U8qfkeoO1+7ru4rPjwgmOk6EP1SGzpwkpgv581pm/HlKZLDi5haUH4Zda1Q/s4l061toE0acGTaUTfjfaLvzab91hPTVRduvQCIVJA3tnl7hLHrD+UHDnM7Jl02wchYUa70bme4bwqeBMM+uHI7DyqKdEgEmGfCsRZn1QQfgX+t84I7Y2yCdT/U92X93ScmKSHXqHsqB1Kky0x0uYmD3CkYNkTP78KMEX1pVcJFMsYtlnwEykHTPjjKa0HBvKdxA10AebGDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GKHMwMptYFmcfIY89kZHw7LyFbNQR5OKMRikNf/ldBU=;
 b=jZasud6NqEWimWVIWyvc74PVaW8BnDcqjhwLzZYjKSMuXN7krBr6rbovabJdfLIvBqWHxLlPOGQTFP/keq8AB72Q+fts7fvs7PSI6JZyAX4kKmvAnDabzw75qopMBS9S5mZVMvyO4+axsPt2R5k/LfeFucarrNbcDET0aMKLnnnfcDqekL/P0kUEDpIJnAI4Ie6X47wb2vrmaWo3r/uzk6PJPK3MCBsKcRmF78hFl0z56JAdcWe8uXL6oGROuEglq1tjfHm5yEAfUSLzd6NcaCGIdOK3YYn58Tazr9XOgB/4p5qIaByLbQBGGChIfB0TulYdXkA3pKPRySc9LX1lzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 CH3PR11MB7275.namprd11.prod.outlook.com (2603:10b6:610:14c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 15:51:02 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%7]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 15:51:02 +0000
Date: Tue, 21 Mar 2023 08:50:59 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Anusha Srivatsa <anusha.srivatsa@intel.com>
Message-ID: <20230321155059.GK4085390@mdroper-desk1.amr.corp.intel.com>
References: <20230320235254.3288679-1-anusha.srivatsa@intel.com>
 <20230320235254.3288679-2-anusha.srivatsa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230320235254.3288679-2-anusha.srivatsa@intel.com>
X-ClientProxiedBy: SJ0PR13CA0177.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::32) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|CH3PR11MB7275:EE_
X-MS-Office365-Filtering-Correlation-Id: 16890b6a-0b63-4be0-ca34-08db2a241252
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iYsSinlsKGGxBtkTEXpiHyLu3DWgg+EBKgUI4prtQHTeKmmrwWjQN6upmxU4lSfSwCr4LBckY8/2lnEXIlEgKG+Vx95vkZddKCl3gWs/qEPbMqwECO/TdGPrDzF4fMTpgQaM0pp4Un9XAUYeUmVKHw1QFfbrTBkYMJLUuOS+ftCaoFUf3rZeWW9Q6Ku0GzYrKRssj/9rGO0b3171bVhtP1jjcD2Lfs0yqaWOU7Oa37Qi0L95iq1yfPriZAGTj2H4LgTPpaJ8Pa/t+n8MHKSRQA+VdM8KDkQcGL24Z4qpipmMekgSfBID9cE2/LGqmaZ3qM2JsMAxc6FAScUsfeRzDR7b58U7UDThrwo4H6QmMSc5ToEQGaQTD9qCNnnICvo6qH96wvkCqfF92XRikgXVWs0PYhw0XwAQP8+TzqWSDjiJt3ZTVIonAT1sX+gHB4fMxYHlmXgVI0oDK2cQUKCZEFxy8v6/sp0JE94TFQ+v45v+N4e2RPNBJHwn2Ooubq6JWJ8ApFK1lxThj83P2CbAQmylZLUP8VYDVg4QGIph6BEbodBJ0zjBxS5PZNunqdEDigjMTlBv4I1JIUG7cQ8DtT955d41Xw+0yOMIdQ+8A3hyrWNIrt/vcfvw4yQf9A6u+5BP5RqOtrGOQp2x1/iZAw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(136003)(376002)(346002)(366004)(39860400002)(451199018)(8936002)(6862004)(5660300002)(83380400001)(2906002)(478600001)(6486002)(38100700002)(6636002)(316002)(33656002)(86362001)(41300700001)(26005)(1076003)(6506007)(6512007)(66946007)(66556008)(8676002)(66476007)(4326008)(107886003)(82960400001)(6666004)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TV4W59/zRvFrEpzZb1aOSNZkJ2XMjY0TEQuleUIP2+JqIVaygInMxjCO4jqy?=
 =?us-ascii?Q?gNyHiJrd4ZS1X5i3ZzRdjEuYW1IAkX2PFStXvs5MGSGeghqyoVp9J178340L?=
 =?us-ascii?Q?WULLNo8LUk+yUCqQGEjVTfKw49VF+zgQHn35iLBi1IIZ38F+ZhQkDAme+S3H?=
 =?us-ascii?Q?sq8NVZfNizYc27VsNHnY+B+7XIJmOSLnWW2yDUu7Bbo6gG6Tl2mY5n9EyFvD?=
 =?us-ascii?Q?4xaFgyHNtH6s3ESRBq2xlSp8C5LBrjTsO1SbvwU4wWgbCDqEOUsybPe1p5Zo?=
 =?us-ascii?Q?9OYTx4nt+AnIGMp8pLFFy4Kmx1kz++/J90WfxRw4qwSC6Sb9xp6+GxmV9PXS?=
 =?us-ascii?Q?FN8j2cLyWDtR94SeDrIu5qBZ6xYcRcuT1vAracpjyOXfVNALYn91me1qdmgM?=
 =?us-ascii?Q?GlD/ykjwOewpJkKm8F36Wb8WH6GmsHqp2QpOUXR3UOS73+1GmFsOZvc6HWCO?=
 =?us-ascii?Q?+IQSciX8Q9EGrmzCSyGCI3lrBO9wbkwaGTZRvg88jrR8fbqlNiYri6SpyHXm?=
 =?us-ascii?Q?mAQu4Hb/GoVJKnVvpK2j3EwuMA+6tfvEoY9LoEnKa9OoJM+WdQPgMR09wEpa?=
 =?us-ascii?Q?elbzhZ8YZztvyalbZ0enuCyix6uuyt30lM/b6pACjF270CX4TDP+3gS93ppM?=
 =?us-ascii?Q?TpLayMdaRdmja6MddUZuEKqG9Ix46puy/fGhp8wmqDuDV5nM8gLTjpo5zTc/?=
 =?us-ascii?Q?aI8wG5D+s55G12g7jiVKJ56pHkMQ6k0fTSHm1b9qkabAuSoTIA1+N2KJoWZq?=
 =?us-ascii?Q?Bedsb7L7CYKjy5ZUEcfJk5LBb+zcWTFfN5Tmxxm/qDvxneBqym3n2/zWe2zF?=
 =?us-ascii?Q?AdKceFJwct9iSzELwaH8iABYEdhJShNVUr1ECFEOl67dSp8Yi7ANJXpgJvW6?=
 =?us-ascii?Q?Rko4NNQh/bork/wxNVT3y4rh5NB+T2r1BGSxuUKRhnAfvSWIS25tIp9q+BOG?=
 =?us-ascii?Q?8XiQz7NFbwvQUnyp09inBBbiH44CejaABXcz/ayOKrGkkpqgVGxQaFk/fuPl?=
 =?us-ascii?Q?8sUACLiteXOxqEXfkq340pDbPqdNeUf41/o5zK+7ZPsYKE8NcpdzY8J3XYFN?=
 =?us-ascii?Q?98zlfESXg1ow1ggJMSPo2zMCev6odKasDymDiES7OtDcdPnrr9aGDTnhHxQ1?=
 =?us-ascii?Q?AfS4cHkZ/NYHGOzpWkHYr46Op0fdtiMudwDF6mwyJOA11TSL1/stxIM3b+wG?=
 =?us-ascii?Q?tSN8VBAGvHlr6mNJg0zY+OT9hLx5CL0L63lQKOeUgdWrhV5GxxUwPBlCDtIy?=
 =?us-ascii?Q?c2XDoISpZO77ZRpe/MM1NI4/CbtAWuX5UbUlCnFcmKvlmVcc4x4ZRi+OH9iY?=
 =?us-ascii?Q?hxJ1b+zQJK/ol5/XBoG7Di5rtJNX52bVXiCEBnEwYnefDGAszfmR3el6HT/q?=
 =?us-ascii?Q?keD8565Zy1BkNk4HLIgbQ9JQXKu1uln66m/cMJ7LMESPLFNITOykTP4nE9lE?=
 =?us-ascii?Q?Ze0TQNqH7JrbxWEDB59HtCjuXm0YbufwLe2zsHlj0LcQXSgVcClKkt8IPXkX?=
 =?us-ascii?Q?rVmI8wxHwsptUZXbo2IyHJmeFs+9lREp0vGEX+w4q8eDP1kvxvCkJn1mmHV6?=
 =?us-ascii?Q?JSs2pojmdxl+2yNz2O3z7B5UsVxrxHymufPG5Kxcwk6HS+rYVDPAH/6OqMTg?=
 =?us-ascii?Q?zQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 16890b6a-0b63-4be0-ca34-08db2a241252
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 15:51:02.1737 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BV7w2583xIZYLh/eI1W31R1fyRlz4LvMEclyqleSvM8cRFNosfF90Nq5z5FHNJAB3E9N0yr/AAKeO/ddSjhXaUafP5osycujd2NpWNJFQiY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7275
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe/huc: Macro support for loading
 unversiond HuC
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

On Mon, Mar 20, 2023 at 04:52:54PM -0700, Anusha Srivatsa wrote:
> Follow the new direction of firmware and add macro
> support for loading unversioned HuC.
> 
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Anusha Srivatsa <anusha.srivatsa@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_uc_fw.c | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> index e2e5f7fbe9db..3c522d970228 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> @@ -50,7 +50,7 @@ static struct xe_device *uc_fw_to_xe(struct xe_uc_fw *uc_fw)
>  	fw_def(DG1,          0, guc_def(dg1,  70, 5, 2)) \
>  	fw_def(TIGERLAKE,    0, guc_def(tgl,  70, 5, 2))
>  
> -#define XE_HUC_FIRMWARE_DEFS(fw_def, huc_def) \
> +#define XE_HUC_FIRMWARE_DEFS(fw_def, huc_raw, huc_def) \

Why do we still need the old versioned filename?  Can't we get rid of it
completely?  There's no backwards compatibility necessary on Xe yet so
this is our chance to eliminate the version numbers on HuC completely.
It's not clear to me why we're still using huc_def instead of huc_raw
below either.

>  	fw_def(DG1,          0, huc_def(dg1,  7, 9, 3)) \
>  	fw_def(TIGERLAKE,    0, huc_def(tgl,  7, 9, 3))
>  
> @@ -59,6 +59,10 @@ static struct xe_device *uc_fw_to_xe(struct xe_uc_fw *uc_fw)
>  	__stringify(prefix_) "_" name_ "_" \
>  	__stringify(major_) ".bin"
>  
> +#define __MAKE_UC_FW_BLANK_PATH(prefix_, name_) \

Nit:  "UNVERSIONED" may be better than "BLANK."


Matt

> +        "i915/" \
> +        __stringify(prefix_) "_" name_ ".bin"
> +
>  #define __MAKE_UC_FW_PATH(prefix_, name_, major_, minor_, patch_) \
>          "i915/" \
>         __stringify(prefix_) name_ \
> @@ -72,12 +76,15 @@ static struct xe_device *uc_fw_to_xe(struct xe_uc_fw *uc_fw)
>  #define MAKE_HUC_FW_PATH(prefix_, major_, minor_, bld_num_) \
>  	__MAKE_UC_FW_PATH(prefix_, "_huc_", major_, minor_, bld_num_)
>  
> +#define MAKE_HUC_FW_BLANK_PATH(prefix_) \
> +	__MAKE_UC_FW_BLANK_PATH(prefix_, "huc")
> +
>  /* All blobs need to be declared via MODULE_FIRMWARE() */
>  #define XE_UC_MODULE_FW(platform_, revid_, uc_) \
>  	MODULE_FIRMWARE(uc_);
>  
>  XE_GUC_FIRMWARE_DEFS(XE_UC_MODULE_FW, MAKE_GUC_FW_PATH)
> -XE_HUC_FIRMWARE_DEFS(XE_UC_MODULE_FW, MAKE_HUC_FW_PATH)
> +XE_HUC_FIRMWARE_DEFS(XE_UC_MODULE_FW, MAKE_HUC_FW_BLANK_PATH, MAKE_HUC_FW_PATH)
>  
>  /* The below structs and macros are used to iterate across the list of blobs */
>  struct __packed uc_fw_blob {
> @@ -93,6 +100,9 @@ struct __packed uc_fw_blob {
>  	UC_FW_BLOB(major_, minor_, \
>  		   MAKE_GUC_FW_PATH(prefix_, major_, minor_, patch_))
>  
> +#define HUC_FW_BLOB_BLANK(prefix_) \
> +	UC_FW_BLOB(0, 0, MAKE_HUC_FW_BLANK_PATH(prefix_))
> +
>  #define HUC_FW_BLOB(prefix_, major_, minor_, bld_num_) \
>  	UC_FW_BLOB(major_, minor_, \
>  		   MAKE_HUC_FW_PATH(prefix_, major_, minor_, bld_num_))
> @@ -122,7 +132,7 @@ uc_fw_auto_select(struct xe_device *xe, struct xe_uc_fw *uc_fw)
>  		XE_GUC_FIRMWARE_DEFS(MAKE_FW_LIST, GUC_FW_BLOB)
>  	};
>  	static const struct uc_fw_platform_requirement blobs_huc[] = {
> -		XE_HUC_FIRMWARE_DEFS(MAKE_FW_LIST, HUC_FW_BLOB)
> +		XE_HUC_FIRMWARE_DEFS(MAKE_FW_LIST, HUC_FW_BLOB_BLANK, HUC_FW_BLOB)
>  	};
>  	static const struct fw_blobs_by_type blobs_all[XE_UC_FW_NUM_TYPES] = {
>  		[XE_UC_FW_TYPE_GUC] = { blobs_guc, ARRAY_SIZE(blobs_guc) },
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
