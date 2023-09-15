Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C7C4EED61A
	for <intel-xe@archiver.kernel.org>; Fri, 15 Sep 2023 17:26:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F33B10E651;
	Fri, 15 Sep 2023 17:26:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E13010E651;
 Fri, 15 Sep 2023 17:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694798778; x=1726334778;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=BIDfbgln5XThPraOfGDCWsYneacWDvL55hAsGONkarc=;
 b=EBQHa3j8RkQEeINd8P9wK5s4erxcAsXegNNUpzbv/DmBszMUH7z9RIEz
 bGS5WZrNe1L+orADarUXQFbd3BLG0wWiYVivCy7G9T5p4lu5YWpDA+xH1
 2FSwXif+WIDiyvdJKRQ1wSITb98t6HA00ehQ7x26OZUtmkt7xw3Mly5B1
 ZnRf56IS8cf75UJXMb6cDTUNl0TaduBigrVrxKYndO0vj+LhCG6N9Ja3n
 n7PPaPx9MQ7UoZeKF2QGWhErSRMIHjXcCHjQviAQEpxtwJnimFC4M0L84
 B4S6hd/8hd6bskqnqHZYorQ4a9aZvxG1k7/Q0st38IzFGHzK2LCtniRZP g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="410245541"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; d="scan'208";a="410245541"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 10:26:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="694790998"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; d="scan'208";a="694790998"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Sep 2023 10:26:17 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 15 Sep 2023 10:26:16 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 15 Sep 2023 10:26:16 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 15 Sep 2023 10:26:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mysWESpw/xbTbNKVQrHbD74onR+CIqIkxAASJpmPImcqejbAPY5pzCfaV0MLhd+1COQnSZLFsodkt5H13SU6mP38s6uW9DJoO37sRrSqHOlikjVNHy+1D2QRdC8xsLPiKsQD5tAiODXMq5DWQOnxXZHmVFgIrNLTnJhsJjwboVPLYN0Ue+av93Rx2o78WEwcGVtBZEvTmzeUQh0Pcx1HFR6NVHWFAxj8oaRcPeXuvqLbXeiwRyXSTIIsWPYG2kdbsX5/bIn0y4oCq469CY1r/tn1NGP8ZZn0/0Ki3z5YrzcXzjCjCTglv5t7KcJherXDKvPMt5RrXQaAcMU/SpYfww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mbyt1GdNyCnX6EXSlu9X+z6UuXKU/RUgyFntZGUpxvo=;
 b=efQ38H/n0FmPIQrnXhGXNADigKmH2zTV3aOo/UeX5RfynKh3aj1EyUXDx3XQLviXSO8GseEbOiWWeZMn7aoLKvvwYgI5Nu8CGH21atsnl8bTMXtH8/acPALBHm0WiGzLIiVsV26Yqcz3z8BMgxlfRxoRQBd1M0hhDB2O0u/DJqY6CSOgzIJtUwnM+eNlOTd7vAIrkbraDxwtNw9tjuq5aJxuzuMhFLuJ+KM2G/hAW7w/ejAVfmj1vWwT+vB4DCC1dr/MMMhlzYFei5sBtUq0sKZqRT8WUsdUjr8cQe+Y92044nMP6sfa162Me5ucMIDjhQrz7EEDGwoUfeUN8ceyCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SN7PR11MB7705.namprd11.prod.outlook.com (2603:10b6:806:32f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.19; Fri, 15 Sep
 2023 17:26:14 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66%4]) with mapi id 15.20.6768.029; Fri, 15 Sep 2023
 17:26:14 +0000
Date: Fri, 15 Sep 2023 10:26:10 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230915172610.GB2706891@mdroper-desk1.amr.corp.intel.com>
References: <20230915132346.1845909-1-lucas.demarchi@intel.com>
 <20230915132346.1845909-2-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230915132346.1845909-2-lucas.demarchi@intel.com>
X-ClientProxiedBy: BYAPR02CA0018.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::31) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SN7PR11MB7705:EE_
X-MS-Office365-Filtering-Correlation-Id: 35e0e0a4-cfe9-433d-d32f-08dbb610dc84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JR+j4LfleX2f4EyAdVTkwtN6KAvxySKGUeWo7UCd1p+qo+C4G5J0Ho/ZiERAbCbnA9zwqjJWUnp5qU7tGBvvqN7cNuFlmjvpcGvDVdWQMe5Fv5a7mwKLy3/l3AJxm8GC7m8D3cPBMcrnbPNzN+P7ey0CrnB1IVjxvbQj8W97mGmNvH08IHgz5srED8d1fcXjncfM7obUtqPakD1lHn4DNdBrJLpgif8eaIECK1SGLcL+NMoQKB0D6OIhtmaU8MqDRKILPcqGdQrGfZnYEk5BzIY0ygxRROgn7Qx3P0t7ubU4xlmS2tbkVSeZZNTBi/Di8til7deuvwkSnaJgYSVXoouq9Ud3/G1crZQryH/WiWmUcgpam9QAVSdNQaxEwY8w9AQGd4Gpk19tD9OMulYQgjUMZqv960SEDsRzG0oM90KIiwYsT1H2eGJxrEud7VPnwc9ldB2EAGMVHj8rnfk3jULNIKhBL/mBmF5fRqEb9DcYml80DkmF0cOoct0J344SFGPzUImGEf8KPYzjoKUHgT50kkd6C07PmM5Rb7sS7M5/ng5iIsDJa3IqHo/6vaqi
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(346002)(396003)(366004)(39860400002)(186009)(1800799009)(451199024)(82960400001)(478600001)(1076003)(6512007)(26005)(6506007)(6486002)(5660300002)(83380400001)(6666004)(2906002)(8936002)(41300700001)(66556008)(66476007)(6862004)(450100002)(66946007)(6636002)(316002)(8676002)(4326008)(86362001)(33656002)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wVdXGKf29Rkqz9FGTCZJrsKnovs64ijGFquYyhws3RW1fvFiOGVsP86jamtr?=
 =?us-ascii?Q?B4bAhAUe03vyK6FgIwOoPqZPO/NatJKLWZj5qUkyhOzh+lImaIOuRHj8V1VH?=
 =?us-ascii?Q?5TEAgBhO3vG5uaEw25UA8/HAm3znqDO2iOGxMqL2EVUFdtXHw50Choh8VaRm?=
 =?us-ascii?Q?kNe8GNctFjYfv/cJ+JJCFpwmKzXX7WNiUgfwpYE/1PfECbNW0tE3PYIjEipw?=
 =?us-ascii?Q?fsnOcXj7lZnVQhQ6u1CpjsoEcOg6vP1s3dwN6RhRfg33xi/j+NWxHPVnJXhP?=
 =?us-ascii?Q?S0wmQzYZX+x8TlH6Sm4YD3CrTzj0I+p1O77EEej56jS6BlbIjjrZBojOVz/r?=
 =?us-ascii?Q?qDgoyPX6QO4lGKwvHQEphgKHRnly5J1LqjmZUpySSRohOA0s4hnVjR1v9rWi?=
 =?us-ascii?Q?P98jPd+xcmr59EzozIG8xN1IUF/OVWc5Rm6u4SgJ7CswZNOhndk+lVJJufLI?=
 =?us-ascii?Q?Tlti1V21DmXzcGKkCZ9DI/GOQe2k9PFuA2SfslE/W8l+sgM4aCaAXBpMO9lR?=
 =?us-ascii?Q?fp6AEQHB8TokE+eN3qeLApuCXhLTpSSuqY2gX5g8Vd/mPliySjfihgEHWRsT?=
 =?us-ascii?Q?XHj7cD/1Xh6Txt/hjGNMlBfj2GKwwxSqSUlGuhKst3iCmy9/Dg8xuP4krq4K?=
 =?us-ascii?Q?Wbt3BtDiaxWo/S/gqZ7trMXzjzqdvM/4tXp7SpoT1YFfoddZwpGYWl7qCX+0?=
 =?us-ascii?Q?kbrSlFZBRvX8uuwGHA5qKiL29LZWUIoKHvvE/QgNIbmTt0NMo+gJ0qtm/71Y?=
 =?us-ascii?Q?KuCmeaHMvVzQhSU0/xNIUeZRnMU9R9YV4si0LET5V41396QZ//dDmypJF/5X?=
 =?us-ascii?Q?5+E8ihiZ1MM+0t6l3CQ39dTu6TBWw+noX4nqCWgAuTxMWx+dX6p0zHIYYHkR?=
 =?us-ascii?Q?Kx2ECX4kFqjfl+BdP2ltd7sSjQ6u4V/LHBTI8vf/0zk+AK3po+jLAqpjfHRk?=
 =?us-ascii?Q?vIB6TGVEKy9WgCzn8JY2mh0C+lqCWisOIb/vBhIMUE8gIN+3xwfmlkB0/NSd?=
 =?us-ascii?Q?jjCvgfko79Jkhs9ZpCqQJixn2GPzuz7dX26ziVZ9iyFl05P6c6OIQhwizLbd?=
 =?us-ascii?Q?5+/qDcUrjT87VvpLiaw7xAnEhcl9xeMnx/GEJ7KlpObZ4LBz7ECKzRD2jI1Q?=
 =?us-ascii?Q?E83u0BWpwa5+I7v5zuLGPPUKoAI5ZUXrqv/unAbtNbLS9QiAx7JwVI8hUAK5?=
 =?us-ascii?Q?OGFmXaalCrJCsTPQEqCLWEdP0llwdtt+/2lYNhFAokMcfvqzHzGCk7PEjyiN?=
 =?us-ascii?Q?KPO22iYGSNMK3ci3+qt4GgByqgw3mA3VkiQZQM+F7upkrWX2RR5TVIQdHi/O?=
 =?us-ascii?Q?Z/D02PU6a1uGY4H7KYKKl/xCXCH4JfaLSQE8j7xrk38uXtnU91riKpl1ZGST?=
 =?us-ascii?Q?rqBHr8u9EB72k+3x8B/t2c01Rped7CVAvbtZkvcoaAhNcelc1iGxpHATwl/f?=
 =?us-ascii?Q?Iu+w3fOQ4xHyvkOnJ/QuY9F8lsG3hSLT9VrMl4X1XO11UpOGg/5iksnlm90+?=
 =?us-ascii?Q?CbRmzQnCJS8/q9ZFWpv/fKGjSdhU0fgtsHCbg9ShoHixkrVt99MkLIgXo5dt?=
 =?us-ascii?Q?hNxkrxipMYO9dRw6YltiQP/40sitJI9XJdLKv3y5Lydk2YlNuoja61SljL8Z?=
 =?us-ascii?Q?SA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 35e0e0a4-cfe9-433d-d32f-08dbb610dc84
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2023 17:26:14.0079 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M92NuAaCD8dCSvRhAlYCIgHoV8WuGS5L6UuHtoMmCKVc2OVZJELZ2Kdp14eOZ+Nua0MmRakEIgUW8F8QcxiP9g/rQDZfM5D+8W6NrcgKq1U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7705
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH i-g-t 01/14] lib/rendercopy: Use common mocs
 function
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
Cc: igt-dev@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Sep 15, 2023 at 06:23:33AM -0700, Lucas De Marchi wrote:
> Do not duplicate what is done by lib/intel_mocs.[ch], just reuse it.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  lib/rendercopy_gen9.c | 29 +----------------------------
>  1 file changed, 1 insertion(+), 28 deletions(-)
> 
> diff --git a/lib/rendercopy_gen9.c b/lib/rendercopy_gen9.c
> index db67b5ee3..b8959d073 100644
> --- a/lib/rendercopy_gen9.c
> +++ b/lib/rendercopy_gen9.c
> @@ -19,6 +19,7 @@
>  #include "intel_bufops.h"
>  #include "intel_batchbuffer.h"
>  #include "intel_io.h"
> +#include "intel_mocs.h"
>  #include "rendercopy.h"
>  #include "gen9_render.h"
>  #include "intel_reg.h"
> @@ -135,34 +136,6 @@ static const uint32_t gen12p71_render_copy[][4] = {
>  	{ 0x80041131, 0x00000004, 0x50007144, 0x00c40000 },
>  };
>  
> -/*
> - * Gen >= 12 onwards don't have a setting for PTE,
> - * so using I915_MOCS_PTE as mocs index may lead to
> - * some undefined MOCS behavior.
> - * Correct MOCS index should be referred from BSpec
> - * and programmed accordingly.
> - * This helper function is providing appropriate UC index.
> - */
> -static uint8_t
> -intel_get_uc_mocs(int fd) {
> -
> -	uint16_t devid = intel_get_drm_devid(fd);
> -	uint8_t  uc_index;
> -
> -	if (IS_DG1(devid))
> -		uc_index = 1;
> -	else if (IS_GEN12(devid))
> -		uc_index = 3;
> -	else
> -		uc_index = I915_MOCS_PTE;
> -
> -	/*
> -	 * BitField [6:1] represents index to MOCS Tables
> -	 * BitField [0] represents Encryption/Decryption
> -	 */
> -	return uc_index << 1;
> -}
> -
>  /* Mostly copy+paste from gen6, except height, width, pitch moved */
>  static uint32_t
>  gen8_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst,
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
