Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2B2AC7618E
	for <intel-xe@archiver.kernel.org>; Fri, 21 Apr 2023 23:28:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9063910E107;
	Fri, 21 Apr 2023 23:28:43 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C152B10E107
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Apr 2023 23:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682119721; x=1713655721;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=3rhNNAIlNqazliXTLBWUWPi0XqiWBfE85r3GTQBj79w=;
 b=OukZwIfockU7RsVw/PRoxTkd1CL8GEjpbrdyW8l17c1htkoXzMyd8qAU
 YrLdN3TdaNNGKzLOBtr7UX1lp9gLSWgMyxszBlUlZeEHaQp2BFm+S3SFy
 T/zqXwBorsui0RfpvzVX8A26aZbYOtnrDYqJczwGcE0l0+KvwWq2ipDyr
 LtBm9lmtMflxIBewVBs0gS5si0vTbZ2I7Y/xjYmYVnRFG2n7b1VLc1wRP
 XGvfg5SAN92zgBoQhQxz1L4c7o2GoGyJq2+UGlvHtS5xCf+O5gos4QuBT
 ObQzEeD0hzwRwH5QR/lTcQnRCs7Q3YhJ2GRrMvSsOTHGYThH5DG1/vuOI g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="411374591"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; d="scan'208";a="411374591"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2023 16:28:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="642676099"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; d="scan'208";a="642676099"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga003.jf.intel.com with ESMTP; 21 Apr 2023 16:28:40 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 21 Apr 2023 16:28:40 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 21 Apr 2023 16:28:40 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.47) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 21 Apr 2023 16:28:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nr9yLfvddXPRse89y28L8VCx4Hn3xq08Kqgdo61ocsTL07ltoNJzT5vNyOkHILE1m+lV6f1I6w4gunVVN6gBpR1KgTObZuMBN6YKV1W+6YwfirSV2Q/EHEwDMvCHIgd8EW44AoJRBLkKKy15u0D40vRENVRwulnj5NVZUja6FZvfETMksPXuaGSCuUIkpFu/v8rDohIk35PPCnBkGbSanJdmLhTskVcTQFWHoPJP3AvSE/yGqx1Hvpk8bJ/DhtmQMuD8kU+c4WB5qf0r2oEZ6F2szW4xUy9LNBgawBGTJ8yXXMHExO7Oibfq9C6KW8/HlEVGdbWAmAHwpEplwP3OZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jYhQKIDPk1+fkVUlW5Wd/h8O9z84ysUWzUrE69x0zaY=;
 b=OBrsduufFHrobBbLLljw+i+T6WJ24JECQPHk/q/4zRNaPXD3D19Z6GS5J/jBW4YhSqFWt0vFHYhA81p5AbTg83aGMwyVBtcUvhhpX0N7tG7czZ8es2X+Ixkv87GbBi6mEXBMVFyjpknIwzvhrKfGlBC+CPUk9qQRyErCi29ENk3jTWEfn+Hfk3BQPU9P4FjXiR2peQ8dArtwfWrkko6e7/O/7BX1YNpjG68u6mLQmPJRz2lOSe4DwuYo8QijzC6uKSosPQQ/SEAMVNriBbViVMuccRbMDSX1jKEv7uFvFGI+PRaRFCz1yGq535T6rrUBhGesroZ1OXAA+7RYCdJ1RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 PH7PR11MB6857.namprd11.prod.outlook.com (2603:10b6:510:1ed::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Fri, 21 Apr
 2023 23:28:38 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%8]) with mapi id 15.20.6298.030; Fri, 21 Apr 2023
 23:28:38 +0000
Date: Fri, 21 Apr 2023 16:28:34 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230421232834.GM2825255@mdroper-desk1.amr.corp.intel.com>
References: <20230421223258.128781-1-lucas.demarchi@intel.com>
 <20230421223258.128781-3-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230421223258.128781-3-lucas.demarchi@intel.com>
X-ClientProxiedBy: BY3PR04CA0029.namprd04.prod.outlook.com
 (2603:10b6:a03:217::34) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|PH7PR11MB6857:EE_
X-MS-Office365-Filtering-Correlation-Id: d5900cd6-9836-43e4-5777-08db42c02247
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: trIGzPyZuJJT3mMoIewEWh9iY+jlU0zKozjTp97Da2E6l0Dl6EnDwJ1XchPnj4btoim9tQcHlwmAQL3xQWih9gYdju2mmhoTAeSoV+/vHObhprb/xYMbTzpivx2UPgiv5HpoJFLf9sZDTAHU4mEAeSVQbUKsPXix6SQQXtBPbZSDaSd7gkAKrzu+8EtvNQIgu5ln6l9nz3kIDBhP8AzXTGPhpLl9vnY6Zy33xI7PoDsx4Z+XYpRxHwrBPdMKbMiGP+eS9nUdz7YvnS4hXuZRAFeESeAnHIEwkTZNfm34MeGu+67luqfpUVv1XYEqdRAd6ShXCzZZfK4uuqmWhm7C/jZxXrcxi8S+eS7uPHmT5bvcuKJwisGcSa+tQmBi/GSWX6xYUWvsNDCfLZuX8AFEugBdIAimOuzHVy19+wJXDifqE1pVVUaxPrNRAiUb2MXqsnaRTW5N6gyvksGqGRQS+zYtypjgrxuXStifmaf9vWH+LaZZPN7AQk7TUDEm72ca9ydRYeFuSejr2mu4A6jaJh00iYuYHMEnR1tyjAgdWWK3y0oF+xJoy/jA64xWrsvO
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(346002)(136003)(376002)(396003)(366004)(451199021)(6512007)(1076003)(6506007)(26005)(8936002)(8676002)(6862004)(6636002)(54906003)(5660300002)(33656002)(86362001)(41300700001)(82960400001)(316002)(186003)(4326008)(38100700002)(66476007)(66556008)(66946007)(6666004)(6486002)(478600001)(2906002)(4744005)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sdMnnSb2tRNamrzq4Gps8E0LDD6LvJfDD3e4nczPuZre5ABiYzRS8OURNfpv?=
 =?us-ascii?Q?QnxZqmsIpUEkK3tRxeMURAM01hKzAkSOSFRp3f/+0FipRJkijn8aGvrTsFCD?=
 =?us-ascii?Q?v/ZOXuu4FY8iIwqDU+dFxaLS92OC9TBKPCHE1Lva3XcEflxd/pQ8iSvtn5wm?=
 =?us-ascii?Q?thpUP6+8nU1jYWSHyz1wRwxHHlXzzFMV5FHzSDmZI+JhDtdqpr31UgYxO1ig?=
 =?us-ascii?Q?A0LOPTzX8tweGXIfx5/piP66VQnnIfQXIrVWGl9Qk4maWlvdUbw04CPMxmiV?=
 =?us-ascii?Q?O5E+SnTUD6L6sQDLe5LSXKUlj8HPCqRQ29DYzlk3DoFqUr99Qs8yvPb9NKNX?=
 =?us-ascii?Q?D9UaxXTPihVWYfPDU3o9FcgpWz2WVKF5MQhVu42rmwe76ezZJW8BYugNuYQA?=
 =?us-ascii?Q?clnlq+gymyfZ92z7xQLmxvKcp3zYBrpZbUE7xyoDmXRclLuadZADJNknfT3Z?=
 =?us-ascii?Q?pe7JDQDa78+b8frYHgV/5G+F90dvh7//iHi96RDpfxXcVqh66ZNGuGo+etIw?=
 =?us-ascii?Q?tMtXDuXiAceqM5CtwJIBVybaZ7cWirMCv97A5qKDQGAGZlGQlv6St7Fg6eC8?=
 =?us-ascii?Q?l6AwEsmAP7WBEufyGqZTBKxqhdGjfItms5oPZ4Ws3Z62FN1IISt2zw/qCRdA?=
 =?us-ascii?Q?bl+peqMKrP60eW4ZD0MPXVPFtY8Z9ZSGrZfx5+hcqWXQSf9IH7oy7/ly52Ws?=
 =?us-ascii?Q?mls2q/4XxLGORvWDmM60JJTH38n3qoK1d/jo/nIbJViyLDcLwf0JRVZCdVEP?=
 =?us-ascii?Q?AvZTUEFcUlD4QLJiJ7TziyuvzEVldvAC5nPt1LNkUtMUfeJiO6bQovLLHGLg?=
 =?us-ascii?Q?fNLzPUq1ZsylGtzjzU5p05ARkxNxPs3eyXVyoo48mntgbxSaCeYPyr9np0lm?=
 =?us-ascii?Q?bklYy6hjtQ+Bdz0mVsFr7kxOhkR05sCxmuWXq7h9e86wy46ougaNCDKwf3mi?=
 =?us-ascii?Q?fvskJ3LY2rFT8nt5Zan18ijD2eHrus0GXKjptn0+Qr0lSU81INHe80kk+q5g?=
 =?us-ascii?Q?FnanpSnwEZT9iqJBrxFxV2n7f6SSaW2fHE91z2v4ffR5VLQv8mfMBAZHp5wj?=
 =?us-ascii?Q?Q3sb4HSTFQ5M2qj7BXruAbqXcH6b6s3fLDmeeZZ/i/fOx50hS8VnCH6Vny8u?=
 =?us-ascii?Q?gEcaG1d1vniGZWcz2ijaBBZiTjL65Bmpv4WGCB8xRpnfKLCH0cRf1Q/h+lcC?=
 =?us-ascii?Q?5wZAXEfCanzIPA5Ba+fAQqbOFnp1F/t01sjPKJkIBijHMeUYIaxL1MhCXbdQ?=
 =?us-ascii?Q?lJtJCFvWJxNA8ousmnJCNmm4EkYQY36aXhuqZiI455SfCGgk/CahYWUySJOx?=
 =?us-ascii?Q?cp0xQ4xdClCSQRXlSB2ffZR2mGCXRFPAzb+T+158vkzPnwqL3TD1myMy5i1/?=
 =?us-ascii?Q?s74noM1OcTu5w3S7ZU/U6uSr7tAXMTr9TmHIUoVeE8DA73uiuXi7laDAC8wH?=
 =?us-ascii?Q?JPF7DApDF2cP6HscUe7MNbkKsKleX2IvTs7w/Vg/cSrdANGwGsIveNuBJ5Kh?=
 =?us-ascii?Q?QIpka2Cv/QMp9o5LH+BV1nxd0svZTODHQWAOUdWZDyAfw2Tso7bDt+cquS8K?=
 =?us-ascii?Q?gxjlqMGHFj8cmyNPOUdgeQdSe7q6lA6MRcdJfed1YnMVUVe8GDZagGlNrWbx?=
 =?us-ascii?Q?WA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d5900cd6-9836-43e4-5777-08db42c02247
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2023 23:28:38.1000 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7b4NEOTFC0GZh/eYJOkKVHMGHOImFSqJI0hyKfOaFWyPmUVWQEpLDOyEs4I2eE9tsBowlHqn2J9k5f6Vc0fDk6LztqqNq+V2Q58ulyIDXQI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6857
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 02/17] fixup! drm/i915/display: Remaining
 changes to make xe compile
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

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

On Fri, Apr 21, 2023 at 03:32:43PM -0700, Lucas De Marchi wrote:
> ---
>  drivers/gpu/drm/i915/display/intel_fbdev.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
> index ed996546edfc..46447dd58f3f 100644
> --- a/drivers/gpu/drm/i915/display/intel_fbdev.c
> +++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
> @@ -165,7 +165,7 @@ static int intelfb_alloc(struct drm_fb_helper *helper,
>  				    DIV_ROUND_UP(sizes->surface_bpp, 8), 64);
>  #else
>  	mode_cmd.pitches[0] = ALIGN(mode_cmd.width *
> -				    DIV_ROUND_UP(sizes->surface_bpp, 8), GEN8_PAGE_SIZE);
> +				    DIV_ROUND_UP(sizes->surface_bpp, 8), XE_PAGE_SIZE);
>  #endif
>  	mode_cmd.pixel_format = drm_mode_legacy_fb_format(sizes->surface_bpp,
>  							  sizes->surface_depth);
> -- 
> 2.39.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
