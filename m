Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC6D2C3DA6E
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jan 2024 18:45:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7440F10E2DF;
	Mon,  8 Jan 2024 18:45:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5538510E2DF
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jan 2024 18:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704739529; x=1736275529;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=3DwPBTYaBg/WXvQJl9OkmyAN9sODHPr+1HJqLI5uHUQ=;
 b=GwA5qNh+/HYWQplod+Fcs67sgCcUFfQm0J3x/GX/oG9ELUTstB7MdbKL
 orWNCNhVNZ14mK76w3DHhy0SRrG8gdTe5hVqX96hGynIHn39WZFpNgpi/
 xnLrnEzswJFd9o5E+vdp/AELO7Z2XrJP0GOXgw6in/qAW+1F8/m9w8LMv
 clkhT/YbD0TEJoF3MmA6WuKggrqF5BP9XT4A4sdjtW1W2BXxeAKNKHznK
 LUcp8yRgoTScz9eCLcFqO86aJUDPJEXKZ44APMnOztVbqMuNj4/ecfd5C
 4+mkaWsOvC4nFkjxVsMRQEmG30U5/IP91df6G/UPKVlapi9RwS97OntlD A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="5324792"
X-IronPort-AV: E=Sophos;i="6.04,180,1695711600"; 
   d="scan'208";a="5324792"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2024 10:45:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="774585795"
X-IronPort-AV: E=Sophos;i="6.04,180,1695711600"; d="scan'208";a="774585795"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Jan 2024 10:45:28 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 8 Jan 2024 10:45:28 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 8 Jan 2024 10:45:28 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 8 Jan 2024 10:45:28 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 8 Jan 2024 10:45:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MDC9osT+U8kXFn3Hy/AhUMurXnYckigNXavr6fvIRceYXLAr/s/gr5/FyVVtzUNcd0WsDUQv4pb/4PJgizN4tdTSKFFk5RX0GaLkMd6R4I1Agyq7PScWp5tRZOn7De3SNIrnR3Jht/jKUiV1s3P6WQcxykpjefgJpgi+MF3zt8Ble16EwCEQH2HBH9SlN9v0rmljhNEJRjPpTwu+0VIMNedRbQVfLFd1YuhECOA2xee00FT4+PR+3Ni/3GZy80ICB2cX/+u7Mk1F7jKfaZMN/CiDdn32MbikpK0QsBWPNwEoEPrQLNzT3wxCuth1YcpOxrGpb5LM9H399utE+ho8zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N3ry7Uon3WlxVSvHMv0Xtwj+IQJh2fV3ooa8FV+/x7g=;
 b=nKzx74eyRBHwa6tm73AG8urt0RMmvVg2J6HNecpwHtDLXBhNjLfVeoA8f2b2aqC6dKcUE0Bon+bWvwb8tDl2W986OFnEqqX8WxfwzLQfdXpAW9xYxV58ufGMZD8gOthgs4DTTP6aPu9Ep5Phs02O96cYiNmcFqlrXIu+uaajroh72CPkPSfoCS51sjh+7rWfJC4PXcYF8yl4ZPNhSpxTZoJdG4dDvIDcTrK7Aa2C/eCGLNR8j5YwL7C2Zr2uRV/YPGyEnt4kA1vh6JNWTj4E05Q5KqNY7nwws6JOod+4DjAMppirOKrntuZ0Cxklry69HNleEPtzJgB4TLssvIePeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB6355.namprd11.prod.outlook.com (2603:10b6:510:1fd::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.21; Mon, 8 Jan
 2024 18:45:25 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7159.020; Mon, 8 Jan 2024
 18:45:25 +0000
Date: Mon, 8 Jan 2024 12:45:20 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH] drm/xe/kunit: Drop xe_wa tests for pre-production DG2
Message-ID: <ooeokzfwgtyekojzktl33sseggjzh6veuc5t2lijzj7poowfo7@gi7ohp6bgqrm>
References: <20231221163213.3849523-1-lucas.demarchi@intel.com>
 <20231221163520.GN1327160@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20231221163520.GN1327160@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: SJ0PR03CA0280.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::15) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB6355:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e4226c5-22c3-4641-cadb-08dc1079f9fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Drn79/20CzpRWnQR0zxm5uLHZIhI1U9C3nkKmirshRHcNHbGeYInU17Mrzgm4858vB0KKZ/3la2qz9QdthLSwAJBBN/DdFZCioo3or5Ubg3veGu6ZZN2OPBZt4GgHqJr2MK27f/ChiCACrKnieBvnm2pzTO8k+tEk/viZbrmUHyk6r0dG1LR8OikKlxkY4Pe3JhEIHnZOcG686Cf0GBUYV+IHFl4ygXVXEhqFsDBlsq1JA+CyLyy2iETN3DdswzMehtRflYM64RYFQ3DeBkAbutx+YR8TS9NJCVlOnQ0O61zR9nrVm8ch2wKcanardMnvux27GUyk4mZqU3D7DHcBReQ4Ki8wjfWQCkBkZAyufVQxPEpVvRvjJG9sClFOvJ2bDOrW68S0qeLs4dLL6Bp9p7JsfP/ALtyDP//Wj9+xn02l099U3+3Mtk3bPZpbZnHDzgy1x4HBqpLZm5sf7urKNhdhs5GSCx/7/1deSVkKHhNRQ7OhookGjNo3mHCagHFeAEfLD/O1AwoWoZnpRSu1uBSkB4d+HF3HxPxKuIm+nTwsihr4V8bDlR8jx1b8YuI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(39860400002)(346002)(376002)(136003)(366004)(396003)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(82960400001)(41300700001)(86362001)(33716001)(8936002)(6486002)(8676002)(2906002)(5660300002)(26005)(6636002)(66556008)(316002)(66476007)(66946007)(6506007)(6512007)(478600001)(9686003)(83380400001)(6862004)(6666004)(4326008)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WxWC2frrG3l9VCPTvKKM+ZGKooUF0367MffpvS0FdIG1jXOgA9xyOih6+NWq?=
 =?us-ascii?Q?b8NGXs5vyw/nz7oAgsZsDGOr51oKfYLLmyCew72jzdVHhCkXjjwlYl6Mb5zq?=
 =?us-ascii?Q?XdECbJCH8uaVzciH/yUu1wC6PH/NHgDyWjXqWMro2MDebx0+8M+yCxLasU1V?=
 =?us-ascii?Q?IW/BDV/JAquqiXiDEHMHZ4rsFdWdACxagx8AgH46EduBXqVHcQPGfKcDw3md?=
 =?us-ascii?Q?HWScaIrvXDQuWQdbQyP0McR2Is5tK1oVjjNhcz62WcC1zGSwAYCmf9MEUvDp?=
 =?us-ascii?Q?U37ti5dnJynxBbIiicc0bAVKDAC/krOrstHyM72oaYd7nQchJYxbZ3OyvEF6?=
 =?us-ascii?Q?l8ISlPQRiZPhO1f3jbKw6wP3oZqCMvxOcg4A9wSMrJeyCHSKwOXCcZfFEI+f?=
 =?us-ascii?Q?2dxTABNs9jAaCsHLbRU+dA0js/4UPDBmJs6Bj5BqvoU2Vgv3CLnm2+nHKlhv?=
 =?us-ascii?Q?sgfpYWH5nqs2O6pJ2YYpPxKf+18FYg6GEU/ktUqjTYaT2XS/JO1c8UQ/vp+c?=
 =?us-ascii?Q?mKFWWR4Cd0gBJS5xqR78MjmKaba54XZzkbXs3jpyKMateXDCK1vbn/g8HYNU?=
 =?us-ascii?Q?NBN3J+ZXg7Q2IogagGC0O2iX+IgDKGbhxPvg7aQu5USmn3HQ3sOJdZ1v5qrb?=
 =?us-ascii?Q?IO1gkeMUF0oa2dvFoGN5SlGK9nMBFPVN1j3u7rwg+qE+HAG/QO4ollAzAFj4?=
 =?us-ascii?Q?aSqZ+IqxEKJwglg4Rkjt4DXzlpjvOvYe2VY5rmy+GySoUhKCYlP8vFk3x7Fq?=
 =?us-ascii?Q?Wi/es3Ey6QRD61AwZzL2X57RuRu64Dj0NycpEcZG5tUUJE8GF+ZfH2p6dMYH?=
 =?us-ascii?Q?4Ic/3OQPrAM2Lqj8SDid/hX2jD15DMjEu15rFbhQ01i0nqH4A3X/38bCpR+8?=
 =?us-ascii?Q?RpV2zw1Ln38HrGMPHfYKXkPxHZzbWih4r7n+PauTv9qIoTL2RKiU/pvPetnR?=
 =?us-ascii?Q?KZjUizKOJzhPhzOPHXpehlTotolnSGHaTXMcetbvJOuTG7UFbuI0T+dtzknU?=
 =?us-ascii?Q?F9EgKn4dfO4wSI+f0JAdUJolUtOGe9F1fnkaXu6bpziliPQcMRcRJdZWI6LT?=
 =?us-ascii?Q?ylP291LITFvpE3ee/LFw8qivoN+oGl8dyOWpBvp5qKi5p+WmFIHSr8zdfe1y?=
 =?us-ascii?Q?Br0ytWjuRe3EomWQ4MWdWXyCX34QZsZLZsSeKKn+WgMjlEC1BOYdRAbZhlxi?=
 =?us-ascii?Q?ubUGRAipvcd0o/1/rFqqFBd8mEo9//0/Xo/OMBiC9niPv2/3aqp9neOW8UnA?=
 =?us-ascii?Q?bRx9I+9vAEdsUYms4rFqSVLjENQ1BQEBn2csts7Apx4NxDLssbQ8hz5UqM+f?=
 =?us-ascii?Q?zzaxbIOuAKzce7tBVPrA94h+Jc8+L0yiWeKOrEDUOxzBBki/0kTUEEe/lOm1?=
 =?us-ascii?Q?Poz+ZnVuFvJRB6vIVHkLDuBdNvARzKO367FtIAX/mnimEXIF+eLefZYE3/oz?=
 =?us-ascii?Q?zdcSWTIHYKYK1jYaujOuAhkwxH6EdLl5JQLOB901pRdF6bFnM429rCf7Xn9X?=
 =?us-ascii?Q?MtKpT+wqFW0Ni09H4Tg3GXVZbPNjtiDGiryDMhyAEkydVB80d43KfG5KpW4E?=
 =?us-ascii?Q?p8T7Qkx/WKtBtS1us5WpYupgmuPHiZROavSiy45xq9926byYshduMce0XO0n?=
 =?us-ascii?Q?HA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e4226c5-22c3-4641-cadb-08dc1079f9fe
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2024 18:45:25.3618 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R75rija509myXWjY/9gN8EHH699TOB2htMAjmASgx3L0NLzmf/NWvRabPIB5uoRUmHvJsVyqa9eYZAv8fGcpmDLn+wY1RI7v8pLcbGHFgME=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6355
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

On Thu, Dec 21, 2023 at 08:35:20AM -0800, Matt Roper wrote:
>On Thu, Dec 21, 2023 at 08:32:13AM -0800, Lucas De Marchi wrote:
>> As workarounds for pre-production DG2 were dropped in
>> commit 707d1b992cfe ("drm/xe/dg2: Drop pre-production workarounds"),
>> there's no point running the kunit tests for them. Drop
>> those steppings from kunit.
>>
>> Cc: Gustavo Sousa <gustavo.sousa@intel.com>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
>Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

applied to drm-xe-next, thanks.

Lucas De Marchi

>
>> ---
>>  drivers/gpu/drm/xe/tests/xe_wa_test.c | 6 ------
>>  1 file changed, 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/tests/xe_wa_test.c b/drivers/gpu/drm/xe/tests/xe_wa_test.c
>> index 2e39acebbba4..439477593faf 100644
>> --- a/drivers/gpu/drm/xe/tests/xe_wa_test.c
>> +++ b/drivers/gpu/drm/xe/tests/xe_wa_test.c
>> @@ -66,14 +66,8 @@ static const struct platform_test_case cases[] = {
>>  	PLATFORM_CASE(ALDERLAKE_P, C0),
>>  	SUBPLATFORM_CASE(ALDERLAKE_S, RPLS, D0),
>>  	SUBPLATFORM_CASE(ALDERLAKE_P, RPLU, E0),
>> -	SUBPLATFORM_CASE(DG2, G10, A0),
>> -	SUBPLATFORM_CASE(DG2, G10, A1),
>> -	SUBPLATFORM_CASE(DG2, G10, B0),	
>>  	SUBPLATFORM_CASE(DG2, G10, C0),
>> -	SUBPLATFORM_CASE(DG2, G11, A0),
>> -	SUBPLATFORM_CASE(DG2, G11, B0),
>>  	SUBPLATFORM_CASE(DG2, G11, B1),
>> -	SUBPLATFORM_CASE(DG2, G12, A0),
>>  	SUBPLATFORM_CASE(DG2, G12, A1),
>>  	PLATFORM_CASE(PVC, B0),
>>  	PLATFORM_CASE(PVC, B1),
>> --
>> 2.40.1
>>
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
