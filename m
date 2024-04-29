Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 596F7C4345F
	for <intel-xe@archiver.kernel.org>; Mon, 29 Apr 2024 20:25:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BFB310E9FE;
	Mon, 29 Apr 2024 20:25:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IuPf6hbx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 711AF10E9FE
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Apr 2024 20:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714422329; x=1745958329;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=0/A/u+URHJEcQ8FM9KlTQEJUbQVbRZhtWgQbGoER4vc=;
 b=IuPf6hbxSLqSuXMEXfUATD82hT5alRY2nfZZRA5yV0gXsmRBXH7jkg+Z
 TR6tSPdpZp8q5mgjolCLZ/r8Ps6M3MwQ9EyrIDWw91/ZwgfLVVX+g+Rpk
 cMK5Vjp4Oz1dyqRi294Ig7Xz8BZ/smR5QiMlPbHHUgmYcdzVtXg2UZ9oB
 qa4X+6Dc02i0dglOO2GYtl+Bn1zdd7MCGCl2Nf597lS4pkoub9JU7lBiU
 n7ZcProR+dpBb9gfhaCmCU7Gj8DIG2EwOI5Jo0bcXjHqr47D4Pjy8XXWw
 dKAT3SsFTfeGTCnsVQrGCMzh5EWSWSICKGiEqJSfyGFg74B/nACueMDz4 A==;
X-CSE-ConnectionGUID: EcZ8bRh7TyeHwiXWwTBJSA==
X-CSE-MsgGUID: SB5fCr9pRWqHJ5KjaGsymw==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="21520450"
X-IronPort-AV: E=Sophos;i="6.07,240,1708416000"; d="scan'208";a="21520450"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 13:25:28 -0700
X-CSE-ConnectionGUID: 4WM92g34Tbq0ExP19BKNyw==
X-CSE-MsgGUID: TzWQXikZRf+HGfVFSwSBLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,240,1708416000"; d="scan'208";a="30674469"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Apr 2024 13:25:27 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 29 Apr 2024 13:25:27 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 29 Apr 2024 13:25:26 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 29 Apr 2024 13:25:26 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 29 Apr 2024 13:25:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cBysEAT4zZHg9DOCntZI1g8wRuJB2MQeHrXOPAbmzYGZG8gZhau9d9gCMhWqWJwtpH+yN7Ab8tLYyJcgkH3pyuHYSz1Sh3FNf2bUR/u+IulfcJwUjtgi93ZJM1sGEf3l7umnrMqwRcj5G9tP4J2dSPwXPJIt/nrcFCVFumJmYpRR38QT2OYQmNC310XC4hQZvAlskhKpT/yocZ09q+JwNYMhjXTCQykIBN3la6g5l1nxypwKyu+8Gv7NZTYmAMrw72a9FejaOuN5Mnt72lV9rICdoAccFJfSTFGpGLoKQLSclgODIdqnfP8L1S6Nh1zts+iZBjDd49vR3fIM+81QUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9BsuagNdC954uf0hpuCKHj23U5HS5vj3bukZMBO7iYI=;
 b=Rz4ezLWZAhwDfogj8+fcrAgNa/hoyMWIyyRBa06Yupwic3gqGF3r0EcQp5N3ayoq9HSe93LWziIBuo95TGlqn8fvzpRIk0LYtfmICMve5K2pZLPtiCg3Jtkq2VuzP/bdTiS4FcIuRbRXPL6M+uxYm6v9N6F9GSUTqWWUl0Q/S7PDh6+pZ/lyZvemzKZKPOLL8Z8H/5xCCBM0xckZTUGGvQJ/LsyUB0mygzbHK3/FBSklvUOMDvZK0egpWRipWI5HrR5oG7u3GHvlqdUoC+TxizkP1ItHtbT5j53axOZZbfuYWy00r3Q1TrFcuPwYDsTdQ7gVIKvJuvvwD00sTXY+VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CO1PR11MB5058.namprd11.prod.outlook.com (2603:10b6:303:99::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Mon, 29 Apr
 2024 20:25:24 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7519.031; Mon, 29 Apr 2024
 20:25:20 +0000
Date: Mon, 29 Apr 2024 16:25:15 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <vinay.belgaumkar@intel.com>,
 <michal.winiarski@intel.com>, <matthew.brost@intel.com>
Subject: Re: [PATCH 4/5] drm/xe: Move xe_force_wake_init_gt() inside gt
 initialization
Message-ID: <ZjACK96eXXS_Uul-@intel.com>
References: <20240425182410.2705061-1-lucas.demarchi@intel.com>
 <20240425182410.2705061-5-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240425182410.2705061-5-lucas.demarchi@intel.com>
X-ClientProxiedBy: MW3PR05CA0013.namprd05.prod.outlook.com
 (2603:10b6:303:2b::18) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CO1PR11MB5058:EE_
X-MS-Office365-Filtering-Correlation-Id: 20ba68c0-5390-4afa-c915-08dc688a7d4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ypOHrQ/KL7Xkn/D1zJsvMZGrbmTHF051hdOByBGCoxK7G2BoSJmsS7eMSc/j?=
 =?us-ascii?Q?/spDcWje4VNfLh9k2V4wDgFHjvuzzFdqjgMDi8mroC7Iuskeq8c/yDxUxYvp?=
 =?us-ascii?Q?uFE2wh9AQV37ePQmq81sS35/tqTN3KVwS1El5UKDten6yHHTxLzGYXK90YDp?=
 =?us-ascii?Q?a8PP5Y27KSpsbrs4LN5RecGwVaJ6wGvkkOI2ZlHKLmVX68lB+4N1xXF9iPfB?=
 =?us-ascii?Q?r04A9m3UX0KMIc0Dys71CXFOS6b43+pYKhDuUauIZLNOzvdTCr+16ma0Nl9Y?=
 =?us-ascii?Q?jJa5GuEEpvB7ggr3rtxa4Rl9emsJGxtBPRIukj51m7yuj7FfQvj4Bis/4W7m?=
 =?us-ascii?Q?Xxqph1YQHSx1lFWa5dPjASjmP40zTiVVf4lRKTF5QeodVM1Y/ChGO7b9e0i9?=
 =?us-ascii?Q?9Nb+MK7S7t42/61EHCOKNcIH9z3myfEycfVUGgYd8M8pYZDCMpy+xhdujOMZ?=
 =?us-ascii?Q?RZMSaCOvImsNXfSI1ymxt1LZafJbQ8RRh2hGr6H4j2mbiLTeBPVT38JKmqLM?=
 =?us-ascii?Q?UA10lUV1OlC0+fCYe8ItKTF5DCri7tktJA81U2HeUvr4exeE1OmF0Zvn/9Oz?=
 =?us-ascii?Q?FOT63nNydBq+UldvsMA7sO11CB5l6hArfZOmHNELKOzWhEqtHrsLDiuFbjxJ?=
 =?us-ascii?Q?5GHdDyJ4YF6Lin1RsQcDxD10Yrqh7APKYSJqzEiRW4uZhCGirsPPhYkkDqDN?=
 =?us-ascii?Q?diSwR5U7jmctax+MvgdX6/GPXpKA1mzaclK4e6KrX55yj8kNUJiKauH0mEhY?=
 =?us-ascii?Q?9xqbNKrtA6nFMTLHdRGLwS5/0RvgDn/2db/0qX9r8EfHwX10j8upq2wqn9uM?=
 =?us-ascii?Q?yenuQ6yfEEruXaXNwYhGHGANzHsFa6X1CvSiqXlqDmGZt01ttcA5AQNG6vOj?=
 =?us-ascii?Q?a2VxrlvYCdN2aT8CiY5yQou4c0E2ynexwERCCzlF4zjJGzF43Hd3uavwmpiZ?=
 =?us-ascii?Q?cVqTLNpRJPRvnWG8UUbGhZhFkLx5UCWZfvxrpfOLdi7lzWUM1beaeC7BYpKN?=
 =?us-ascii?Q?7WNnSFRmbalVfNqR3wgl7k0tyd0mavQ8WwRXnCxQBk2HHt5SL31fSdStSnS6?=
 =?us-ascii?Q?kWfVahACM8EpdM7nHp7Bv2s7qhdtquBjUVgAZhpXcKQxE1uTLIfPqBmQgDr2?=
 =?us-ascii?Q?RpA0Fv11alH187dGQMppLSZmv2HkbN+k5T9ZlhzuRqAfHqs5LQq/+Q0mEq3P?=
 =?us-ascii?Q?1tQVpduUo2lrOd2st208PuPnMovGkxCaGfba9TvsHtIQ7VQpWFthqJOgE0Av?=
 =?us-ascii?Q?FzRQq96Jd9K5e576pwxyIonXXcbAvuDgwHjUb9wiTQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dIYMDXQnZgMLL3b3Jq7aLCIrvwUW7m8fkxYvd9R0SugtcTD2qn0Z9rTEQ0eZ?=
 =?us-ascii?Q?RcMKF0/VVTAeCMX20TneHJz9BdEkd+vAsEp6x4vEd1ebOx1KSWzaD7/alyHu?=
 =?us-ascii?Q?vtFgw9FUlcQpsvyZFgEL3auzVI9KV3Lbx1H1wH3bi5Xou1THdMyALMvK4mxz?=
 =?us-ascii?Q?WALLGS45mCYYEtozF0MZUVq2VOeunx+a+AnJT0E67SQVF8bUwvBFwHsaYg6x?=
 =?us-ascii?Q?q3UpDQHDIlNMOoDjZ26bY4wye1Fpgy7+wBZYGy32w/ZimCupZ+JTZ9aMsh3I?=
 =?us-ascii?Q?9/tYdjqED1Y4EXH0ZpUcnR2tHtvx2a/PZ+f5cXVbj4BKOk+/SKpFTQZXel2c?=
 =?us-ascii?Q?d8+7skIiHup+ndinwPxIihGDgLpykQ7Wi9pJDeLxfdBjRPQARfbd5EYkyzIK?=
 =?us-ascii?Q?oEdwpsRofEvyg5l0rQsWK40FqD4yLmP6bAV0S/95T+h5hYQWxsIRcXZZp9cm?=
 =?us-ascii?Q?tLmOjXkXoqRXjXgvjZCzoDlz+BSmcXxSqKLsgIVwhcwXVmVhbb24cxCM0Obs?=
 =?us-ascii?Q?gpS1a4PBRBZPRB5Ue//nrMFE3mz+9Z6AEe5upIl033vTV5IthUJwTpClOFec?=
 =?us-ascii?Q?MvGltBOnyLp/Jgc9/sNlJsLFdK8j8Mmvo+LTi2buSleW4ARXYzcVREolRAKT?=
 =?us-ascii?Q?RSf1LEeJy7hL8DR1EZV1KmpmN/1+YhFmC7qgTZp6uTta7kLdBtkfY/86vdSa?=
 =?us-ascii?Q?JwRn6iVsYkJp1p2BMobH6IgszOi+QqMbb9GlupMTKd50ekrGQdevGVBj1e0P?=
 =?us-ascii?Q?OI/5QHxfHMZ69hlZ9+Z2XlZIrjV9TCKgDA6A2EzUypNOcpwQjDAMQKOHnarT?=
 =?us-ascii?Q?twaJI28yytMG04Lrn2VQOF9n5mGQJEQPuq3dKnR72dXc+HfaUNs+4wZs1STV?=
 =?us-ascii?Q?Al2NPOP9tGSyKbN6QlD/dIKIqYfnUyLqfKT/EmYnIuPd5maHfecMMZMwWGyu?=
 =?us-ascii?Q?JxYXn/dkaB2BQS/wIChmbqycAiQeZp6AHU+UnU11oHsHbWhmnrGFVGAG2y4b?=
 =?us-ascii?Q?6ONPFlOqkUWJCPVjIRIYpw06E3o5Bqf3zeeg71oZwXF18EjmXefwM1yurilQ?=
 =?us-ascii?Q?kGXtJd465ETyNIYaPBKcWlD86iZPODG4WsulA5tFJvYE3YyD/InO+FC7+ANd?=
 =?us-ascii?Q?kHLypTNt/yRQ/oGqphu4fgx1geBxYLJIzQS58rV0PbOstL5eUsKg9HZ5L47b?=
 =?us-ascii?Q?t/nf5BEAzH9lUlqSKSFhCnd6yiy2tmIclsfIB1Yo0J/1MtCwNI8onNzStG7J?=
 =?us-ascii?Q?ctzm97FbNcjLP5PQlJYfBeTUQk81cU3SAs+8W8OrTirQB4rI5sjoIo3QOS/m?=
 =?us-ascii?Q?h1r2S6o+KtbDC4d6O6vyrdWUo38QnRoRq+rc27sR/5V39WaKPHIenUzFg72s?=
 =?us-ascii?Q?MpHCl7cLl7GmposeXR6nr9h+rqdXdZMImMNXIlHt3xC2JFcbYtAbVBYAzCn1?=
 =?us-ascii?Q?snKy/OO4ClZpBDA23R021Y4lUKm/3ZuqVDEEefav7h2VYQ8AXv8/sYBDzIwT?=
 =?us-ascii?Q?aHV7e6KqylXKceAJ5pLc377E5dOiIQTpmc5YwkNl76W8h9oI9Mfpzg+isE/i?=
 =?us-ascii?Q?9O0KAo2QnKKWCi1GHaP1gfWnMn9CsPEDKduLViEILg/cYnPuS1XJ7vUfVMZX?=
 =?us-ascii?Q?MA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 20ba68c0-5390-4afa-c915-08dc688a7d4f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2024 20:25:19.9843 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b8GwpqMNCR9a9EW9JUxbYUXelgKa5z3wcdKUqqSYgOuJYdSPc2h4V4UgxJM/bS1bYgjUI2wmaUYpPpgpWAbDMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5058
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Apr 25, 2024 at 11:24:09AM -0700, Lucas De Marchi wrote:
> xe_force_wake_init_gt() is a software-only initialization and doesn't
> need to be called from xe_device_probe(). Move it to initialize
> together with the gt.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_device.c | 3 ---
>  drivers/gpu/drm/xe/xe_gt.c     | 2 ++
>  2 files changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 8d04283b3617..d090c4e7d57a 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -572,9 +572,6 @@ int xe_device_probe(struct xe_device *xe)
>  			return err;
>  	}
>  
> -	for_each_gt(gt, xe, id)
> -		xe_force_wake_init_gt(gt, gt_to_fw(gt));
> -
>  	for_each_tile(tile, xe, id) {
>  		err = xe_ggtt_init_early(tile->mem.ggtt);
>  		if (err)
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 805fd0acfc03..2e8efce2799a 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -328,6 +328,8 @@ int xe_gt_init_early(struct xe_gt *gt)
>  	xe_wa_process_oob(gt);
>  	xe_tuning_process_gt(gt);
>  
> +	xe_force_wake_init_gt(gt, gt_to_fw(gt));
> +
>  	return 0;
>  }
>  
> -- 
> 2.43.0
> 
