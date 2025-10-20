Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 144A3CCD1A2
	for <intel-xe@archiver.kernel.org>; Mon, 20 Oct 2025 22:05:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF33110E530;
	Mon, 20 Oct 2025 22:05:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NHhxkQD9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9572410E530
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Oct 2025 22:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760997920; x=1792533920;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=iSyUAD1aWB5qL1+dVNPVoxT55ox5HCmJIZNjKP6nl1s=;
 b=NHhxkQD9aOAoE5b8Tr6U99mlWKh/Y7l+Nj4SgQ/2J4wYODDFTDfRL7tB
 aXVYKqhUUvfHvwjO/emFxDJUsS0/PsHrDP1+LEMzu6KCMFalBkKLDsEgy
 IABSvEM0by+U/ISiYkmX6cg+sEb2f6psQawqEfQa7QcDg2vYnd9XEfui3
 ScHA2HcnJvUM56sf7y4XO0H2jkF4Z3RI/Jk88Xyct4XIJ6MriP6QkOCN8
 Dti5R6+S1FSLii1TglJR1+gle1iZ/BWD4z5l2DoR3MhPuP0mJL5/Sr9SZ
 Advw5Q6/2ctIUfam3SKp9p/qhMgiKtYvfEEcOO2+9CcY6HAVENTMXK24x w==;
X-CSE-ConnectionGUID: kxy2OVVVTHmfAXAraLMHBg==
X-CSE-MsgGUID: WxRMTA4MQfGW7FO7fM4IeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63161737"
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="63161737"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 15:05:20 -0700
X-CSE-ConnectionGUID: dbsYja7KRWOsccv6Orwy/A==
X-CSE-MsgGUID: FZIBUdhgTr+rAVAmjALtog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="182988710"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 15:05:20 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 15:05:19 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 20 Oct 2025 15:05:19 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.17) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 15:05:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aA+4VCRsqZ4bfR0vkKyk/Bm/5iQI3wF02KfxuTgGttyuEzuxUoigHjh0uMU5MWlqNZ21S9pO8AoDGbQOsJFw7RGb2fi7//AnR7VQG/BHCRlgo/GLNweKZLr+6XckN95BTae1tRh4Lr2qYwCo3+nX9nVTDVDEBg2XGvl1zd/W3N6/FCgXJt+wSBS/8VbJ2mrvdm4fdkbWDSMZSqj0EUh36P6SqiYldpqVVxw3W388JGOJosTAVbeWveYiliPlosw1LfMOTgiIJYcxS3XwA328y3rIenBAhMhHwhqXQ+T4gdAikNcOOglu+eoLHn2+mdyshjPg6MDJpbd9/sAVifgTwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Wzkyjog1XqY+jSEIHOn1deh0IIhMKh5r9OcLpJCan0=;
 b=RjdFmF+BzRDhaSY9Q0SMtJo3kNm+3/fQeYQTuQv+WNUt9L0WSHfZT3Ue6vlUtRZIqCOqRmWYdrkLfsYaxsOOpyQ/bb5XtEpZhwZjYyfZU2HEpblsgXLAkxuhBCHaIjQjQXJTa3aBw+jQtXnHVvkG/ziW7JriNL4BxV4a7PvroNgQqtmLPmVPQL5nkQZaf3L8sMm1xrxxZ1Jbc6y9iEfOiaeSNCXofB1i++DztTeRLpMJV31ivXZHM7P689NpvrrB/ST8Y88m0By641NVN1GrUsDQ5fl5M2jExhBP35CzN2EOLsdm3NvP23VZX0AgvjUhYMoxjCFAKZRXzlWQygCLtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH8PR11MB6831.namprd11.prod.outlook.com (2603:10b6:510:22d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Mon, 20 Oct
 2025 22:05:17 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9228.015; Mon, 20 Oct 2025
 22:05:17 +0000
Date: Mon, 20 Oct 2025 15:05:14 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Stuart Summers <stuart.summers@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <niranjana.vishwanathapura@intel.com>,
 <zhanjun.dong@intel.com>, <shuicheng.lin@intel.com>
Subject: Re: [PATCH 7/7] drm/xe/doc: Add GuC submission kernel-doc
Message-ID: <aPayGrFBqHV/J5zP@lstrano-desk.jf.intel.com>
References: <20251020214529.354365-1-stuart.summers@intel.com>
 <20251020214529.354365-8-stuart.summers@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251020214529.354365-8-stuart.summers@intel.com>
X-ClientProxiedBy: MW4PR04CA0075.namprd04.prod.outlook.com
 (2603:10b6:303:6b::20) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH8PR11MB6831:EE_
X-MS-Office365-Filtering-Correlation-Id: 460bc661-e4f2-4d4b-af77-08de1024c088
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4BtX8W16FmDjAxT45SGnCw6tTxx+ajJF8OA/jIf6j2cqihzIYHm5GkOAOLWH?=
 =?us-ascii?Q?SxNsWDWkB7jOMlNcItybIk3O786gJPfX6410NG5+RJ/8OM48NrsA+FBUmbqD?=
 =?us-ascii?Q?vj5Lcm3cl9YWzOqBM35P6bz3G21HdrATzU8u17ibylPzZhH/hIuSGMxGEG40?=
 =?us-ascii?Q?3LaH/b5qrUIDed6neeYPfGNcPWC3TZ13HQuakwH5BkBkHXtnJT7uyakLNoo4?=
 =?us-ascii?Q?03zo2SCk9mnKgDFr2/p0v0Doxwwd9jYNkHiPIuRLio3SziR15GFVH1+OMp9A?=
 =?us-ascii?Q?XXkWaUd6SCfMyfDDjVZeuIPcP1+8wmvGnTgGbrMAP1nP7zeB+0AiOZNPMPz2?=
 =?us-ascii?Q?e7z4sE0moHteDh4cjllqqhgZaGzfSgrz5wiyAYkT7gtucguk51KRfuFdpeof?=
 =?us-ascii?Q?17xN4VEbC8MuPsc3f51RJPopmeeqiVOFidkPwA9O9/zy4goTnMpPtBbL/imw?=
 =?us-ascii?Q?jNr+aqCNKxCSQYOikOmNzSaw5tvTZSts+1gn1FW+fewGYBSQIBLRyH6fl1Yl?=
 =?us-ascii?Q?EY3BaepqNSZnokQQI2pRLOsdL5PQB36xvxyhVHhc7INt/r9DhIWNnNTB56uY?=
 =?us-ascii?Q?RCaIg6xGxVdgSa4JPjjK0H8XhSZLWa1Q3LjQFi66HvBsZk11WsanhdZtFT4p?=
 =?us-ascii?Q?WYH071FgiUVpgNMmoDkBkc7x76tGGRPHiwJbiTV7waIEX8P5y3fZ7nziphQh?=
 =?us-ascii?Q?5xL3kmXMH2/W0xLhvcweXSzQlWlP6XKZx1ixqO14oNJ61KqFOzIAImE8KHip?=
 =?us-ascii?Q?0huHp6xmM+VWcGMjR7sAeFBlh9yQ6EfNKZod+aHhzgrUAmvktEL37uYtWsfK?=
 =?us-ascii?Q?AWbDNrFHJEAmL67PTFZrB7XVv8wz87EiqOSnivF/9r+R2+lXQ1N65fxniIbo?=
 =?us-ascii?Q?6cUKs3QWDDAu6ENAT4ranQvTR6FDJoKVrXD6P47JVnKPtdplxr788xuqSV5w?=
 =?us-ascii?Q?5kuEBr33IkV0Wuj0BFhxsTlGQHHvOPflpFeOnwx3LIPgl7T8EybNflMt2OMn?=
 =?us-ascii?Q?4fHX0IEnN65hLZoexuocc/tN+zPwEoP13OOP0J9pirU/64VRbblBvB333pch?=
 =?us-ascii?Q?E2jlKzfclDscko50RkM7ppbPZu6B4dEctzhxEaVnEFczGHnQUhoYjwDjGBjL?=
 =?us-ascii?Q?gEqNJ59pScrWDGRxA09FH6+kHmWq4yIPU9q13Leb+IYQInWCCi+kM/5tPaIN?=
 =?us-ascii?Q?Jh3zNTEBIxQPo+VfIrnuyvW2dkG9CrOMa6fVR31lzrfinlZJCKIUS838JPnV?=
 =?us-ascii?Q?0vyLmEqz8b+2Gl8w2JWjA0m6Ur6RTv5vDV2pGW7NtMpsVEJAwXdFKKPoYTPi?=
 =?us-ascii?Q?Z4WueyaATFy00kHa0F7BlApk7LAHuTseuJ1jBJxfsVBpegLmthxuMpneuz8g?=
 =?us-ascii?Q?+HlSxj1yyuQTZLUExcTbDQpBAJkm748pcwJCOa1kSZ+eH+BEag=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NMFWpGdyhPNuYRwbc4GsTAQIelHGyUnOhfLttsDrveoW6+VG4k0zcwO+peoP?=
 =?us-ascii?Q?yOGFu++A5TF3OzqWHW9pwTDI3BEofU7Tj+i+tHYMiqNnpYOh4/zQwY8i+Arg?=
 =?us-ascii?Q?t21f8y3diWUPeAiqY7/Of31I8Pi49yQue/KWcsXH/5j6pbuedw7Sq6hhAC5f?=
 =?us-ascii?Q?0PkvGpmwYo7FQYSVKpM257U9tjgDE1/x4T17Qe9phTflcvIUo/YeznwpdTw8?=
 =?us-ascii?Q?mng1K1/tR25A30K+Cukm05/TgofVR8F9D0mFEpDzZfKpnxmyJlOn5n6WsPEH?=
 =?us-ascii?Q?BClP7cPRj/CbSaZiXFs0/bWHmDcqgcmXC4MWxd00RgCFIEtU4TziMrV2vJ+6?=
 =?us-ascii?Q?Eni44GGueqZVGVsMU4j64u+mnlZi0cjpYWuD1e/29mBY5jd5/j9SjapftC06?=
 =?us-ascii?Q?vdNPebVi4AGn7RtRmamwbFqj2dX35T9AZl4gheww1JB6vT7tsgPM1r5nwJLQ?=
 =?us-ascii?Q?DgMzanVjAjmbF6YyOLUZg+AoLYIyS+IPLVrfx+HD3m2xaWo0H7xt15PiQ3xh?=
 =?us-ascii?Q?0Mnrc1bAKZZEF2r1emKUwjxb+u8gpLiAUwrEWxpW4i3DF8neXU8R7rmxo+fO?=
 =?us-ascii?Q?aA3nIjmo1Y0IlZcOR0708TVY+OewmknUux+Y6iecYsfrxojPuzVJi1KtHbSu?=
 =?us-ascii?Q?gqynAPfmIbbU6nE/kQhY4SfekjJ4ntDODU0E2v/yhXmHNuVq30HSzSW/vbQM?=
 =?us-ascii?Q?YRh+MT5yWe1rCOGovkjfpCKamiMHGXKBOjy9iQ6t1VRcR5ffiQs5Dzy2cmNn?=
 =?us-ascii?Q?d+l697s6RlIBafk3cazWIyKSFeeIcC4qbDGuCmQKp6BkeKBqUnAzZLWGlaEi?=
 =?us-ascii?Q?Znxc/YfuPuQhT9kEn1BxLWhgzOh5le4OhaQ0l+JTCxrBMflkFyJvW4ZRrchj?=
 =?us-ascii?Q?Pwo9KdSG2yQEKaQMwQtw7z7QOGhyZIHL0Vz51eFTnmtmtko7mhdbEjVBzDGp?=
 =?us-ascii?Q?SbnUS+Uxghssx7T1C5zSx9+elrmt7gx1E6E7UY7jhVJrMTUenK928cpzZcXm?=
 =?us-ascii?Q?236GoWtavokThW1njBQsVaXTCU7vg0zFW1HwpQeL8/+abBWeBnO7t2r1ItcT?=
 =?us-ascii?Q?W1vn2Ue2dVAdpBKvEOcDxCnem/RMzau9pcHTbgoC4QEbDSZZLvX6kl89N8BE?=
 =?us-ascii?Q?BwjkEH1AXiHgin2R1mwbj81k0A14Gm39I+hCEUbc91KD3dZgyxgexlbgYxox?=
 =?us-ascii?Q?iRJUW5X8xnmI6PzOzYc5V3JhMRCltjJPPD+6OFxUqBHtS3xsHXTj4tXZDcNR?=
 =?us-ascii?Q?wmX9ywuYRzl6240EOO0J6siKhdMtZGjGc/oxKngkn/bnWJJcCahpLMVL7AhY?=
 =?us-ascii?Q?HS3RbAvuI3CGUlCYwMbZdxaG6FEILZTDQ5Cbql29Sl80CHz7tFJ378nnc+zp?=
 =?us-ascii?Q?U4xdfAD2x0S3/jULGaIsCNK6I1V0LV01Lh66QqjF3f0LXq/xC0azqFuHpkej?=
 =?us-ascii?Q?eCVC1gSpHqKdjA3Ey8WP9b8ljbhf4rb+IJ/1djeqDGgsNnttavNvnAh5wwq8?=
 =?us-ascii?Q?nRzPQqOtS71852T2uGSGX9BV2Qfy7HqI1CN9EJVG2kDg2ZLe2PyHlAc5M9fm?=
 =?us-ascii?Q?PWPo+iM0sYeqV50yFaNOgT8xbhYEtZgGYIA+JwbTJx+a11tDIw748Tk5bs/J?=
 =?us-ascii?Q?7w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 460bc661-e4f2-4d4b-af77-08de1024c088
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 22:05:16.9624 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jiP7fhWeX0W/OH+bI4EDYJLnqcOp+Pspz87Ci8E+txAKo34/glLCl6Lv4DxH0FDjW71JtiyCXeiOtKZeaF21tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6831
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

On Mon, Oct 20, 2025 at 09:45:29PM +0000, Stuart Summers wrote:
> Add some documentation for the different roles played by the XeKMD
> in communication with the GuC through exec queue management and
> the DRM scheduler.
> 

I've written fairly detailed GuC submission documentation but it stuck
in review purgatory. Here is the most recent post [1].

Matt

[1] https://patchwork.freedesktop.org/patch/677980/?series=154627&rev=4 

> Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> ---
>  Documentation/gpu/xe/index.rst         |  1 +
>  Documentation/gpu/xe/xe_guc_submit.rst |  8 +++
>  drivers/gpu/drm/xe/xe_guc_submit.c     | 70 ++++++++++++++++++++++++++
>  3 files changed, 79 insertions(+)
>  create mode 100644 Documentation/gpu/xe/xe_guc_submit.rst
> 
> diff --git a/Documentation/gpu/xe/index.rst b/Documentation/gpu/xe/index.rst
> index bc432c95d1a3..030268ddba87 100644
> --- a/Documentation/gpu/xe/index.rst
> +++ b/Documentation/gpu/xe/index.rst
> @@ -15,6 +15,7 @@ DG2, etc is provided to prototype the driver.
>     xe_map
>     xe_migrate
>     xe_exec_queue
> +   xe_guc_submit
>     xe_cs
>     xe_pm
>     xe_gt_freq
> diff --git a/Documentation/gpu/xe/xe_guc_submit.rst b/Documentation/gpu/xe/xe_guc_submit.rst
> new file mode 100644
> index 000000000000..a82b5d57ee6a
> --- /dev/null
> +++ b/Documentation/gpu/xe/xe_guc_submit.rst
> @@ -0,0 +1,8 @@
> +.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +
> +==============
> +GuC Submission
> +==============
> +
> +.. kernel-doc:: drivers/gpu/drm/xe/xe_guc_submit.c
> +   :doc: GuC Submission
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index a11ae4e70809..fd05f73cd96b 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -46,6 +46,76 @@
>  #include "xe_trace.h"
>  #include "xe_vm.h"
>  
> +/**
> + * DOC: GuC Submission
> + *
> + * The primary submission vehicle for the XeKMD is the GuC firmware.
> + * This includes creating, registering, and submitting exec queues
> + * (see :ref:`execution-queue`). Once submitted, actual hardware scheduling
> + * is handled fully by the GuC.
> + *
> + * To facilitate these operations, XeKMD makes use of the DRM scheduler
> + * to handle state changes and determine when jobs should be scheduled
> + * with the GuC.
> + *
> + * Queue Registration
> + * ==================
> + *
> + * Registration and deregistration of exec queues with the GuC involves
> + * creation of the ring (LRC) for that context. These are asynchronous
> + * actions by the XeKMD which completes that registration/deregistration
> + * process once the GuC responds that the hardware registration has
> + * completed.
> + *
> + * Queue Submission
> + * ================
> + *
> + * The GuC has a parameter for each context indicating whether that
> + * context can be scheduled with the associated engine. After registration
> + * has completed, the KMD, typically as a reaction to a request from
> + * the user exec IOCTL call, will issue a schedule request with the
> + * GuC. The GuC will then add that to its schedule for contexts
> + * and will in turn schedule this with the command streamer based
> + * on time slice availability.
> + *
> + * Queue Destruction
> + * =================
> + *
> + * As mentioned above, before destroying a queue, it must first be
> + * deregistered. In the typical case, this happens first by sending
> + * a schedule disable request, then on confirmation from the GuC,
> + * a deregistration request. Only after that deregistration response
> + * will the XeKMD free resources associated with that queue such as
> + * the LRC.
> + *
> + * Engine Resets
> + * =============
> + *
> + * Any time more than one context is being scheduled by the GuC, the GuC
> + * will give each context a certain configurable time slice. If a context
> + * exceeds this time slice, the GuC will reset the engine and notify the XeKMD
> + * along with an engine state at the time of the reset. The XeKMD will then
> + * resubmit any outstanding jobs to that engine. If a particular job has been
> + * resubmitted in this way more than once, the associated exec queue will be
> + * marked banned and will no longer be schedulable on that engine.
> + *
> + * Queue Wedging
> + * =============
> + *
> + * On device wedging (see :ref:`device-wedging`), each exec queue is also marked
> + * as wedged. This includes taking a reference to that device and adding a
> + * dereference on driver teardown. This additional reference allows a user
> + * to collect certain debug information about the exec queue prior to driver
> + * unbind.
> + *
> + * There are some instances where the device wedge might not take a reference
> + * in this way, for instance, if the context is in the process of being
> + * deregistered with the GuC at the time of the wedge. In this case, a
> + * reference to that exec queue should already be available and any
> + * associated data structures will be cleaned up later in the teardown
> + * sequence.
> + */
> +
>  static struct xe_guc *
>  exec_queue_to_guc(struct xe_exec_queue *q)
>  {
> -- 
> 2.34.1
> 
