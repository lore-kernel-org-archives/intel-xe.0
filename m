Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6198BC74A5B
	for <intel-xe@archiver.kernel.org>; Tue, 21 Mar 2023 15:34:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D5F310E7BD;
	Tue, 21 Mar 2023 15:34:57 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C85710E7BD
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Mar 2023 15:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679412895; x=1710948895;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=BVnamdJuzxAn3oQ2FB0Ll+JAkU4uhPJUEFmPEID/pto=;
 b=T8KlVIoknrCLRCDYFu7l3P0A14maY474v62FS2pmG1oahM3EwHG8tTgW
 uNQuOfwBCI3b1k7SBWB/rY+BF3eU5T8wKA2z1931uUisEIVR8dZhKIUNI
 yZcJsJaimwkSS2KM4ULHGcUoYfeJlA9Z2r8uJW2p7nWc2halzjApR029N
 w118KI5UVNi19g02RxUllY4aV0igqGa/2XvsIjk/hh6s8GJ21psEAs+4A
 +Z2Qyk9Ay7RStjuEnMiU6UoJI4CNDoK34uH94kqZZR7HAWCTbcA7/6aCd
 WXZQF36lHzNlLvC8C7yJ3hljirs0GsqS8p6qaI0zWIp8RICf1XMMa5D1X w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="322816219"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; d="scan'208";a="322816219"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 08:34:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="658811959"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; d="scan'208";a="658811959"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga006.jf.intel.com with ESMTP; 21 Mar 2023 08:34:54 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 21 Mar 2023 08:34:54 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 21 Mar 2023 08:34:53 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 21 Mar 2023 08:34:53 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 21 Mar 2023 08:34:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FE3YbOv4YwphEI/lFhA69e4mtPhXLCRt/03puadaRZY1j4eQRj3UM4faZ6MWkQp5MxQrIm26XlooRUw4hiR9cH0OkU8h2Cyi9h7MMDyXUgl1vtR3bC4ctJwxbU2213mL3MnFeB9rEsYSt6iyBrFarYnMa+fVLP5kdMeWiHGwSup94Pvpp7ClklFnDWjTeueatp8Y+AUkcRLCWJWPoXxECTC+QQgt96PI4wFrsSmoQtTruWpfBjsRZ9PEAmdrFaVJEP1bQN0BNk+GAdyOP5iCmZcJ9FeEEOXpmOTEdDn7ZiNaVqGBlxkaWwF/zFHKI0SZEhVbaAMboUcatWsAz/rHyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PNMNTrFyU7mKXLgXccSTMbHKNx0/2w90PWqOf0f9seA=;
 b=Ax6BfwqAwWF68Sa7l9Y4cN8q8a5hQKe7Bgto1z6Q9/CGEiYJlsRkKdR5RtGsixaI1lUXQJsS4R/qUENpFfgGBNYbESLZMXfPrO5w9Z/nWTju6O8hbLqKXVWVGU0LAKgCY10G2YzewLLc5VE4xYll6p+CBgBGjNhugf25bcoitv9QnyzBlKWieTzRjrVg7fxOx2l2zmW37wsmv1G1OA2HRUKx/g/Z5Yo+BpcXAIRjq8/CmFOtD7AmPlEpkJqqU3lQHwaaogpHokpqE6dvPUMeTradhWwkGYeZ9dUg0Z41pQs2l5bHrby+7UE78lN0rApK9ez9inyhzu4eP/cj9zzmKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SA1PR11MB5876.namprd11.prod.outlook.com (2603:10b6:806:22a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 15:34:51 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%7]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 15:34:50 +0000
Date: Tue, 21 Mar 2023 08:34:47 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Anusha Srivatsa <anusha.srivatsa@intel.com>
Message-ID: <20230321153447.GJ4085390@mdroper-desk1.amr.corp.intel.com>
References: <20230320235254.3288679-1-anusha.srivatsa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230320235254.3288679-1-anusha.srivatsa@intel.com>
X-ClientProxiedBy: SJ0PR05CA0149.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::34) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SA1PR11MB5876:EE_
X-MS-Office365-Filtering-Correlation-Id: ae207978-eec8-4a19-fc4a-08db2a21cf18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fnC2LDjauIfY1gNHeRUH12Nl96t5zOjqEyoSule+eqD3Boe0bQQuzaViTgzpLuiZ1KLAHniY+MQRKxQYCZ8B60vruT282Y7bXYu0Xf6ampGXvuK2pHxGDjn9qZF35huGMMc5OOxqRO7E9Ej6ZkoR3rtUamdZiybfo/HuRrxhjP3HXvYlawlQeK48vhIwweWQwaMa4HH7/RKdk961fsmlIzXps15PcAdcnmD+onTYHRbcHoQ9zByvZonenbvbnc+LeU4dERj8sKwwckq6uhohrtlp6s/DnaLuhvg0AQ//qPndrCfha14eUf0njSe+y1jEpXpQiimolcL9Gnl/4j9tRtoXA0gad8d/Rx5oSE75QEhSNRox7XUfrIMD4xZuxKSiKh3tnjJ6hmZl9rAwI0YglBljlPo6tw7nFMWoxLDW2kae7rJEplJ7Mt+DQZvqkrXYNt0+zmvF6LFJ7kBPEGlOj7MJN0mN/QtWSBCmvvCsF9TdyveCpfdHmBggR8ISo4jl64GGRtE/nH07KZgvivmnYs8UuqhzUsa5v4wXdxPAKNS5cAWRxm75hpUGHq5Egz9/CikS7Hvzx8AMgn55X3iBgQ+zEHzaGamV8aUfIMXtDVCSp7xiRJ3gKXAwFrqf1xQ3MFSFQeN20klIDYwvBTjJe/Q7tH0eyqE3INfqEmgNW3O7rOLGZUU+oIG8FFFO/Kzz
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(136003)(376002)(366004)(39860400002)(346002)(451199018)(38100700002)(86362001)(82960400001)(33656002)(4326008)(6862004)(41300700001)(2906002)(8936002)(5660300002)(8676002)(6512007)(6506007)(186003)(1076003)(6636002)(54906003)(26005)(83380400001)(316002)(66946007)(6666004)(66476007)(6486002)(107886003)(478600001)(66556008)(66899018)(87944009);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rEJfafqwPHmQ3wYFUL7zTPUaMW/YEjDHksBj9t+Z7rpVJ68T2GuMTaoUFwgQ?=
 =?us-ascii?Q?sclK42GPcm9e2eqdY3kfTXJ0W0DRlYjIdYYCtP2bdelk6cK8hCQcAbA3jrzR?=
 =?us-ascii?Q?SmWktzi4i5DTYAxjSb6KoCQzBySNrmZb5EnskzzKZLZvzAwL90L9nyL/RG9l?=
 =?us-ascii?Q?9aNuus7CMCOpo1tp8WjDW8+3gztjMlBnH6zQUN8llg1AWkxGl7Sa2zvaaPGn?=
 =?us-ascii?Q?+ocP/kDqqPkk5QPtBqZKuv8XHoZXB65KYV/gQ37xnSPS8AO345b6s8A/uqBb?=
 =?us-ascii?Q?xE8Bt2jgy06DdW9SCq68AyFEGByrhU8QJ+Uu7doz2SqWLwI9fW6rKh3utbpJ?=
 =?us-ascii?Q?yr8BO4M03KmhUyBTkz/RX7gT3xA0tfAUCEAzmamkkmKIKsf+u8D7roaaNP/5?=
 =?us-ascii?Q?RS60ZnfHtQSlDVUxWlsfCw4ACM8tksQLI4YLcwJ0olpmP/haxTkV0qPkWbIH?=
 =?us-ascii?Q?sxAOabnMtK1IDOG6ZA+q7Gm9Uiz5vhBDOGz7mYGqk8ZsZhbFQQkl6jIi9rkd?=
 =?us-ascii?Q?i960fP0TIGawGUMwxWcJGaJuqU/xUd2Kg4upYOyRjLO3ktTrd7AQaALn8tTa?=
 =?us-ascii?Q?9GTq+q/1ATxAVKhha5iT822qGVNVdtbkqb+cIYskZTPuINejKdGsBf5aBUYC?=
 =?us-ascii?Q?KVOBdpNtyYD/50GvN7ZiNukb/WNksTkadR5ZFVtyniLy/nj1eov3/pVhCuXw?=
 =?us-ascii?Q?3zfmrzGEN9Ik7NNBbmoAC0qgj1prMy9B8TCpq5wM7ADuSZc6/1RJlKYUnLCi?=
 =?us-ascii?Q?RfuuYoQRgMx89y9zr8v6IsYyAJx1M4W2AlWYkW119Wl+8mDDpkhpczuJIM7P?=
 =?us-ascii?Q?jyYcdZV2S3+TvHT+1Sz10UahhZ1kDTQ1tqI+K5IuMDWMTdgNLF2uniyvYvDG?=
 =?us-ascii?Q?wzUCzHK/Sl/KtBdfox0XyQ+VtHIP1FGwlGUF3RtXncjLuwh0QLZFeQ5uHC3D?=
 =?us-ascii?Q?ZxU8U3Nyrlxhg2sVooEojgGrduWhWIQVGsViKrnSg2qlV5FcYEDayqISxXfj?=
 =?us-ascii?Q?VKVDGM6kE4sAWaRHQpRfvnZaEhqpuabn1xwAnWFFxAn5koX/qoWJcn+8cFsQ?=
 =?us-ascii?Q?i/vvLdQwMJ7SWORIdDGST24uu+EklCw9GHkLowM+WJ0nIgAB+wRBJy6OtYjA?=
 =?us-ascii?Q?mJw2Co8C/AR8Vd2d5KNDw2fi9MIqK28qam+/e65MVceXYUG3tUmaY4zuSFPJ?=
 =?us-ascii?Q?yR8FG9qDEQUk2fbGGhcTfEna/IMCihikcpdPR6OZkuqKANaIIVR59nMLZRNn?=
 =?us-ascii?Q?WnS4znRQFvIUaU/UzAs+BLgcYb8/B1UwLKjn+BeWKg1YvBMIkVV6/rQklo9a?=
 =?us-ascii?Q?EKyvvygEjdxcTNxICj9jsIj8rxZiPIYBJICubE38YGsc0xhIB7iY7VqvAQuF?=
 =?us-ascii?Q?fuel1E/3RWViWdnLRDAobfm5thXmZpZPVOVU8ZIuCDQq19zLXzpzXftbYPCR?=
 =?us-ascii?Q?NAwGPSjquAnWDFQx8lUeEzVT6gDRqijXMuFj2uV2pLQ1h3S6aNvmDwKl8oZ8?=
 =?us-ascii?Q?nOwaCOWx5OTvIcyurDZ373wwRICSYdHjS2ugL9svnx81O9aM5U2wUSNkmtkN?=
 =?us-ascii?Q?q6K3OFAJD939/wnreEZcF7mOhkIg1gHWRmfwo+IAaSJxlJqR/Rv80K20dx8h?=
 =?us-ascii?Q?5w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ae207978-eec8-4a19-fc4a-08db2a21cf18
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 15:34:50.2209 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nX/AuiolbCPoeiSMVjrngnBx8cldS4DGUX7cFofB2V+EstmLINrD6xd740x6olH/8AgGWsquWb3IsxWQYt1S6xt9B+DEgik0aunzwOlp+s0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5876
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe: Add checks to load huc from a
 previous platform
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
Cc: Matt Atwood <matthew.s.atwood@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Mar 20, 2023 at 04:52:53PM -0700, Anusha Srivatsa wrote:
> Platforms like ADL-S use TGL HuC. Add suitable condition
> so driver does not disable HuC.
> 
> Cc: Matt Atwood <matthew.s.atwood@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Anusha Srivatsa <anusha.srivatsa@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_uc_fw.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> index 00408f1b73e1..e2e5f7fbe9db 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> @@ -139,7 +139,7 @@ uc_fw_auto_select(struct xe_device *xe, struct xe_uc_fw *uc_fw)
>  	fw_count = blobs_all[uc_fw->type].count;
>  
>  	for (i = 0; i < fw_count && p <= fw_blobs[i].p; i++) {
> -		if (p == fw_blobs[i].p && rev >= fw_blobs[i].rev) {
> +		if (p >= fw_blobs[i].p && rev >= fw_blobs[i].rev) {

Isn't this going to make various platforms pick up firmwares that we
don't want it to?  I.e., how do you deal with platforms that don't
want/need a HuC now if they automatically just start picking up a HuC
for the next older platform?

It's not clear to me why this is needed either; once you pass the code
through the preprocessor ("make drivers/gpu/drm/xe/xe_uc_fw.i"), the GuC
firmware table looks like:

static const struct uc_fw_platform_requirement blobs_guc[] = {
  { .p = XE_METEORLAKE, .rev = 0, .blob = { .major = 70, .minor = 5, .path = "i915/" "mtl" "_" "guc" "_" "70" ".bin" }, },
  { .p = XE_ALDERLAKE_P, .rev = 0, .blob = { .major = 70, .minor = 5, .path = "i915/" "adlp" "_" "guc" "_" "70" ".bin" }, },
  { .p = XE_ALDERLAKE_S, .rev = 0, .blob = { .major = 70, .minor = 5, .path = "i915/" "tgl" "_" "guc" "_" "70" ".bin" }, },
  { .p = XE_PVC, .rev = 0, .blob = { .major = 70, .minor = 5, .path = "i915/" "pvc" "_" "guc" "_" "70" ".bin" }, },
  { .p = XE_DG2, .rev = 0, .blob = { .major = 70, .minor = 5, .path = "i915/" "dg2" "_" "guc" "_" "70" ".bin" }, },
  { .p = XE_DG1, .rev = 0, .blob = { .major = 70, .minor = 5, .path = "i915/" "dg1" "_" "guc" "_" "70" ".bin" }, },
  { .p = XE_TIGERLAKE, .rev = 0, .blob = { .major = 70, .minor = 5, .path = "i915/" "tgl" "_" "guc" "_" "70" ".bin" }, },
};

so it seems like the direct == test would still be what we want?  The
only platform missing from the table today is RKL, but we can add that.

As an aside, the platform ordering here and in the definition of 'enum
xe_platform' seems incorrect.  Since they're both incorrect in the same
way, I don't think it causes a problem, but we should probably clean
that up at some point too.



Matt

>  			const struct uc_fw_blob *blob = &fw_blobs[i].blob;
>  
>  			uc_fw->path = blob->path;
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
