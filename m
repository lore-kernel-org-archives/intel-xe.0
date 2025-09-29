Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51A6DCAC5B0
	for <intel-xe@archiver.kernel.org>; Mon, 29 Sep 2025 23:26:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15AE510E4B6;
	Mon, 29 Sep 2025 23:26:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CA7f65Wi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EB3210E4B1
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Sep 2025 23:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759188373; x=1790724373;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=il7JNy6nufWzJbrB3NnBZxQqeyZoSnxABAfjoPoUS0o=;
 b=CA7f65WiVh3Jny/nR3aXtSxsz/O7A4BveaxLNZfTS1KhEbPJA1xbN0tc
 F0s8qaV6TF7+G4f4VsGUQ55cBpL5fWqCJ4QRSg80jsegw5Tut/J9jzJgS
 7WgGPXegpsbMhCcZc13nv1XQwpEAr1pgRP2KMONLP91/D0/6jAKWJGeMK
 LbFO0wLbpZGzvpU51tsEHz80XuI0YaHybvvkrW/Rr9xsDP33NhXa0B0cJ
 UEfvW41GSQoeqqGYEm+t4Ux8HYSVokY3ef9PsECDtKckq709OexcZHZVM
 5kJtwoIdIMF5lE4EG8b+RiLrvAmETtxBoiZnlcXBEOXmcAZvRFW/e5icB A==;
X-CSE-ConnectionGUID: qTXGeyTvSy+QyMxfVwINng==
X-CSE-MsgGUID: kXvjdocORwWOjB9vxFPKdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="61325469"
X-IronPort-AV: E=Sophos;i="6.18,302,1751266800"; d="scan'208";a="61325469"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 16:26:12 -0700
X-CSE-ConnectionGUID: 0FdMVI1PR7GWKMzqzEkPeA==
X-CSE-MsgGUID: sL8vljB3RR2XYMn+A2V5oA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,302,1751266800"; d="scan'208";a="182382206"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 16:26:13 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 16:26:12 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 29 Sep 2025 16:26:12 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.49) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 16:26:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hbh1FXJhJ+sIniN15EoPgM/E3bL79ay7fCC7b2DxMMJtqjrD9KcYamlkYvCvlyebiqLyTbD8OKdXpJNmNj4Qw5sE+D8eNCFNkHIOfhN2vnBqhLn4JSOaoC48x9VHcXlE4Mll77KJ8pLS5EdcqtMkMweQAdMedAFsEZc+YgQoRbY0qNZmpijdH3OL5i2vIml4Mkv23huQGJAT9gv3rd6fh2XlxW+YVk0QaR9mSM1SEa4seITzGrzbD1rMD4bOuV8hYcx5O/Ysu5Bb2o6LZqV4BhrphFThHvLocHGmV6+ZJP10dmQTkgBwGMElgyJK5pxruYjqo64mE8Q3idZ4HXfLdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zz8BrVy3Ln/l3vSuE8xiZ2arLhvj2d/nWSIlDPZexUs=;
 b=HtOY+/tsWvqQj6cZgEtCCCJUKg4Hbt7PZKLRgkDLP0+M61AVAEq16n3mHYhE/NHnu84ziemNrzzTNbB1Rne9Q2BN3l+f2uiHdL9l1OFG+azsd14cEBhdEiZNYkTu0Y/CBV7CUNdKv6jeAg0tE47RbvgloHdOb5uPZf3LEkXCPFeUBNL/pR/HMdSGKYVUhpg2kELD1tLVgFsVTd/WC5BeLGHiDFE763FBydLgCMFPZl434/T7ZRnAtPt9PaJZPRnltZZ/TjfBTbkChawME23Tx2uGackNm0MMQNOXoQHvy4F9cRQZOIfrMuqVmn3Ni+PRmPWrm3G4NlAJYT6dUcOI7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by MN2PR11MB4664.namprd11.prod.outlook.com (2603:10b6:208:26e::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Mon, 29 Sep
 2025 23:26:10 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 23:26:10 +0000
Date: Mon, 29 Sep 2025 19:26:06 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 3/5] drm/xe/debugfs: Update xe_tuning_dump signature
Message-ID: <aNsVjhA0oskzJIsp@intel.com>
References: <20250923211613.193347-1-michal.wajdeczko@intel.com>
 <20250923211613.193347-4-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250923211613.193347-4-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BYAPR05CA0036.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::49) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|MN2PR11MB4664:EE_
X-MS-Office365-Filtering-Correlation-Id: cc051b6c-5573-42af-bfff-08ddffaf9270
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7Ito4vBrCJNYmqpD6v/GS+kAAPQLuEVvh8ZiKGezRRS/zbmxT/E9QO8CK3KV?=
 =?us-ascii?Q?uHAOuTxzLazQatArkv58ojK78pUGOKYS9pNjzpf2pOrabuTOYNJ8ejMHZTX+?=
 =?us-ascii?Q?YfrbCbh+YUTYwI+TWsORYSjssiEtlruokvpjpVEWxZWdyKAHn8OTlDnhwhQD?=
 =?us-ascii?Q?iDz4MA4oout28LMiGjpx5bNuSlkvOTZ+/zUe++PhkhF8WpVJBL3Xi5Ds+6gz?=
 =?us-ascii?Q?LJ5aM+FZOsszkBhWs71R55mE+/crvFa1jxZBlr7H/YZ/tEBmabxAXROkfWBl?=
 =?us-ascii?Q?MiyIwI7evn36kSCj3/S7ZzXMibVlhEpFv2/JMPB2Pawk5z+x5jmpXo1A70kE?=
 =?us-ascii?Q?v52mZHfqMFBx/htaPZFLANWTMFBkMVqlhyd42IIHH5KHNchkV098uwxkL3QJ?=
 =?us-ascii?Q?8vqAEnle0jnRDFxH66qIOFVDDGZ4FUYuK5qJA69oCAjrDlUKgrSqT6bZWRsI?=
 =?us-ascii?Q?oxrPZGYIavropt+gXkuwQ3K78zOoxx+MGF0Ye99qgghoMwXkguj00IoDrNX2?=
 =?us-ascii?Q?UE98ysmfJvVvokxNC2d0tfHDXPqSXo9I7TNwm0O2cLb/SX1ytCWcEztxgjyK?=
 =?us-ascii?Q?4x0/G0/QxdfzAiWXs4Keh62U/3z5ngrDKltc3Sn8bey2fuiPw1iYMLrEKn+L?=
 =?us-ascii?Q?SqtqwN6cVCOdxqllcphu4bgnspdwZ1TK6eyf2EKzJa41IwineB+m1BP9DcAr?=
 =?us-ascii?Q?Z1YbFwaMXauTkBuhqaOhqe44CY6erzUztR/wVZJ7vk71+a9s1XkVO1Rh49ho?=
 =?us-ascii?Q?cNrsYOm7xZdNkKUqODMgr6vBP/KwZyEYhWxv+eEssAbk7ddeH68HI41UyoPM?=
 =?us-ascii?Q?0EvKGVxmq75nqpMRowQKCHYjSR/YbTiZosyi3gLhtwkKKeNWcudlHg+Gz/pk?=
 =?us-ascii?Q?8aJSIh1hExTwZWuJPS35A9m6GTi6C/kyK7mPmlzer36uBxwrIsw7ZGJYDDVn?=
 =?us-ascii?Q?1IHSwGQxJaAyqHCOibDamaV3DKz6HgmS8ZUAHd0Jjd7OMvu9zOfaAc5fdvK9?=
 =?us-ascii?Q?NmBghQbe8uHrORHdJQNauSU/Nm0c7BxtsCpCEUVU5FV+XbnHT3UtRo0V8+nw?=
 =?us-ascii?Q?3+NdJ/T+hBhbAzRARrurXfDy6tCBoSUC710Lftsdl7hJ+/J9vWjtbpOa30hl?=
 =?us-ascii?Q?4mITiEkMAYHT8gvWFQntUN1iUAx436YouqUdSU7U0hRcYSgvTCkArL0GeqBJ?=
 =?us-ascii?Q?hLR+qvrU6zOzALrCHBwWQunURUbqNfUX66iGybgRLLOfzmr0RqeaOxvakG2x?=
 =?us-ascii?Q?9a+BfzjQtfWsKNzUYHTwHbNv1+ybseHne4l5cb2f64WStCZECnSkS58t061+?=
 =?us-ascii?Q?P/PY//7UxuxA+sK2DWwAYyFndm2Xwi4dp2tp946f3f/6ooZy6ai7piH0sjXj?=
 =?us-ascii?Q?Lw6TK7iNTrj32FJJlrGCzWSitN0AfK6/o0/OEZ/2pG4nmv75AHH07SQUnQzQ?=
 =?us-ascii?Q?FrZltjEEwVu3zDRKctRhZ+6XfYpzGz3M?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hVGEopCPIjKiQfURfsFYfvqK1AJvxfwBFenjfbO/tBSLz1wu4uXrPg95+zO3?=
 =?us-ascii?Q?ysRHsQT277ryLhgGFw554DOSyLLO0gRrR1iBWRrBau1pArOu3ooeF14SkPg9?=
 =?us-ascii?Q?v7r+QOu6oMTIIALqW4j2AmbK5S1x2fqDIxW6YQPaI5ZN0KsHVrebnnXbCoKB?=
 =?us-ascii?Q?PZd8iWI6unKb3MdNKTTm/VKf8eAZ3LQIHFWM1kmdpxeatcRCGUkKN5w1FCAB?=
 =?us-ascii?Q?V3OBFpLWUUnSlJzWlejPWTjgbYzYnbwoiNL6DhBDTXQtD+INhi6QZicH2KKt?=
 =?us-ascii?Q?PL7Tc/w+isa9CjxW2JAacgo4cLahJ2OrKuMB+A2zaBLM2ZS6E1pHvgvW10Sv?=
 =?us-ascii?Q?xR1phX95Ao6dInOwfD2Rr1ynHTTOr4qt44zl3/agCnF0Q8AcBJWzsbC+pVcO?=
 =?us-ascii?Q?ac+4ZfAUjuqWwzHPH7xFW3c+gWh6OhXsufkgC6QMTDlsPv2Qm9TzVIRd1pj0?=
 =?us-ascii?Q?Q7F6/Tbq2dxnMNvCPLIwe1WDVjXS4c1cSCmiChoU9kBuOq/EdwsIf5DnN2PN?=
 =?us-ascii?Q?1CjRQPAPrLgBaYv69lR3nBF9SGKnmtehjAjLd/4vASIzmu8OqJ38fC656sdZ?=
 =?us-ascii?Q?qs1YXkg1NVkIPLaNXCqXu7QYV7iV42COLQ6IRe7dY8sPxm02hujqXymf5m7i?=
 =?us-ascii?Q?GO6FK5OlzWnIM4lSd0i/y1u1D+qBj2GIrDIGIzX1ie9ZurcKZRYzCZSSoYOC?=
 =?us-ascii?Q?7v2aFdszgVKmFoXdNxyDo8gvzSW4DqVxci724j9tDcymUu+bV5nCNvu+oAbj?=
 =?us-ascii?Q?ZfHkhNO5vjWseXHofjG9gf5ZfFuDf3gXrrcpAuj5DojTzLfw9A7peXGGVfUT?=
 =?us-ascii?Q?PBWI4YVOVpcqQnLNSUzjYq9qNxAIKYHPAdG55sR1qvAw+13HBAmq/akBrh21?=
 =?us-ascii?Q?T1b8EM65cm85T6HlpT6cz0WG6+exM1UD9x1S9ysuiThD/VGG+yoHfdlsX70f?=
 =?us-ascii?Q?8BuZgdy/2usKklAzC+ZkbKG9ghcKFB88o3UDJr7Btxab+JIKzgdW/7zQqGNG?=
 =?us-ascii?Q?g+H5u+rpM82l+aI4H+RziMBfJjWS/186MUd6qdvPIhFN71dyEHOBqyXwHom8?=
 =?us-ascii?Q?v6bDTygyz3qMsXK9r34rT7M5LNgkombPJZUv3msvNgjkDQ8W0hlXZfqB54sS?=
 =?us-ascii?Q?pP9KPooI/pdpe7tiV750A7SN1uqb86HBm440dBeRFmr5UvTeT/YHhPrNbXoU?=
 =?us-ascii?Q?NC7LW1nqifn/1N7aENhnvVUlaf3qforULTc88lYQmLuiSafov247wAN1hK08?=
 =?us-ascii?Q?cnnfpSKNxWjoueJ4E4j3DszSNk4+idef5CV8j8klNYzP6/yJGU9RkqxcQijI?=
 =?us-ascii?Q?AXy4bQhIsRZNo+apbOkHDQxyv0oMkPY0YGhLzzbFquvrGT55olevHh+BzGyN?=
 =?us-ascii?Q?4t3sGy824MgaMLi97eSBMF6FZW03L2aIcuM4xDlgZioSqqoFz/x9afbNKTgu?=
 =?us-ascii?Q?oqMFgzF5lBw/gac5j4Cv33J7A2/+qmQueFtBwOh5wkOKnvGSY/72AwfF13Gu?=
 =?us-ascii?Q?lj6wim+YNVRgnGTrkvSnT+GLcx6fxOSNeI0huVRZsnSyjjci8s0epcylA20U?=
 =?us-ascii?Q?lA4EgAp4u1N1jIP7x8ryYpS3kia52bNnahox0QeHJRXTSKVuI3hUqcPUdITr?=
 =?us-ascii?Q?bg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cc051b6c-5573-42af-bfff-08ddffaf9270
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 23:26:09.9584 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KTuE4M69aNotl6w0M00fEH17Zp1l3WeLOLQ4zODsuzOhnvjYTKC1vdZ0CCqCt2EG4+pwLeoXpTFZ0GInOaVmbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4664
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

On Tue, Sep 23, 2025 at 11:16:11PM +0200, Michal Wajdeczko wrote:
> Our debugfs helper xe_gt_debugfs_show_with_rpm() expects print()
> functions to return int. New signature allows us to drop wrapper.
> 
> While around, print additional separation lines using puts() to
> avoid output with leading \n which might confuse some printers.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt_debugfs.c |  8 +-------
>  drivers/gpu/drm/xe/xe_tuning.c     | 17 ++++++++++++++---
>  drivers/gpu/drm/xe/xe_tuning.h     |  2 +-
>  3 files changed, 16 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> index e6a7684d571a..bcf234e74471 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> @@ -167,12 +167,6 @@ static int register_save_restore(struct xe_gt *gt, struct drm_printer *p)
>  	return 0;
>  }
>  
> -static int tunings(struct xe_gt *gt, struct drm_printer *p)
> -{
> -	xe_tuning_dump(gt, p);
> -	return 0;
> -}
> -
>  static int pat(struct xe_gt *gt, struct drm_printer *p)
>  {
>  	xe_pat_dump(gt, p);
> @@ -231,7 +225,7 @@ static const struct drm_info_list vf_safe_debugfs_list[] = {
>  	{ "register-save-restore",
>  		.show = xe_gt_debugfs_show_with_rpm, .data = register_save_restore },
>  	{ "workarounds", .show = xe_gt_debugfs_show_with_rpm, .data = xe_wa_gt_dump },
> -	{ "tunings", .show = xe_gt_debugfs_show_with_rpm, .data = tunings },
> +	{ "tunings", .show = xe_gt_debugfs_show_with_rpm, .data = xe_tuning_dump },
>  	{ "default_lrc_rcs", .show = xe_gt_debugfs_show_with_rpm, .data = rcs_default_lrc },
>  	{ "default_lrc_ccs", .show = xe_gt_debugfs_show_with_rpm, .data = ccs_default_lrc },
>  	{ "default_lrc_bcs", .show = xe_gt_debugfs_show_with_rpm, .data = bcs_default_lrc },
> diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
> index a524170a04d0..fd58ea5e78bf 100644
> --- a/drivers/gpu/drm/xe/xe_tuning.c
> +++ b/drivers/gpu/drm/xe/xe_tuning.c
> @@ -214,7 +214,14 @@ void xe_tuning_process_lrc(struct xe_hw_engine *hwe)
>  	xe_rtp_process_to_sr(&ctx, lrc_tunings, ARRAY_SIZE(lrc_tunings), &hwe->reg_lrc);
>  }
>  
> -void xe_tuning_dump(struct xe_gt *gt, struct drm_printer *p)
> +/**
> + * xe_tuning_dump() - Dump GT tuning info into a drm printer.
> + * @gt: the &xe_gt
> + * @p: the &drm_printer
> + *
> + * Return: always 0.
> + */
> +int xe_tuning_dump(struct xe_gt *gt, struct drm_printer *p)
>  {
>  	size_t idx;
>  
> @@ -222,11 +229,15 @@ void xe_tuning_dump(struct xe_gt *gt, struct drm_printer *p)
>  	for_each_set_bit(idx, gt->tuning_active.gt, ARRAY_SIZE(gt_tunings))
>  		drm_printf_indent(p, 1, "%s\n", gt_tunings[idx].name);
>  
> -	drm_printf(p, "\nEngine Tunings\n");
> +	drm_puts(p, "\n");
> +	drm_printf(p, "Engine Tunings\n");
>  	for_each_set_bit(idx, gt->tuning_active.engine, ARRAY_SIZE(engine_tunings))
>  		drm_printf_indent(p, 1, "%s\n", engine_tunings[idx].name);
>  
> -	drm_printf(p, "\nLRC Tunings\n");
> +	drm_puts(p, "\n");
> +	drm_printf(p, "LRC Tunings\n");
>  	for_each_set_bit(idx, gt->tuning_active.lrc, ARRAY_SIZE(lrc_tunings))
>  		drm_printf_indent(p, 1, "%s\n", lrc_tunings[idx].name);
> +
> +	return 0;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_tuning.h b/drivers/gpu/drm/xe/xe_tuning.h
> index dd0d3ccc9c65..c1cc5927fda7 100644
> --- a/drivers/gpu/drm/xe/xe_tuning.h
> +++ b/drivers/gpu/drm/xe/xe_tuning.h
> @@ -14,6 +14,6 @@ int xe_tuning_init(struct xe_gt *gt);
>  void xe_tuning_process_gt(struct xe_gt *gt);
>  void xe_tuning_process_engine(struct xe_hw_engine *hwe);
>  void xe_tuning_process_lrc(struct xe_hw_engine *hwe);
> -void xe_tuning_dump(struct xe_gt *gt, struct drm_printer *p);
> +int xe_tuning_dump(struct xe_gt *gt, struct drm_printer *p);
>  
>  #endif
> -- 
> 2.47.1
> 
