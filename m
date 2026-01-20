Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A94E4D262A0
	for <intel-xe@archiver.kernel.org>; Tue, 20 Jan 2026 20:57:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68D8B10E654;
	Tue, 20 Jan 2026 20:57:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aIk0mIer";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84EB910E0FE
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Jan 2026 20:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768942643; x=1800478643;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=HFm8SeUKC5VZkpm1yDK8s1XAS1oN8gZ4YR77T8+yMgc=;
 b=aIk0mIerEH2LhE/YnO+DIIMloIUMgviE2AoZ7pfdS+hIKhSMXKNZG7MM
 2+2z1FLNiz2ZCwjDZpzoPBUpTPDvDk3b3HZZtimu+asMfMFpTlQ+vymqu
 n3CIaEoueERRpcjywImz8IXh7ywahHi1yb3gr5EPDIpUck77I30TvoNIR
 UokRqoe3WE23OdJLZe1I8VYs+Rud0M+l8INx82Recj09I+QCw7LGuPUP+
 Q1hQzspbHAUcfjrCkuUAjqJnfd/QfxZe7FTFIiNuGOba+z88pV4a+g48q
 drCR6CBzz0YUz4F82AtCDe51cVg/TTQocj+ppXQFIZki0wyBJ29t3OGy0 w==;
X-CSE-ConnectionGUID: j/hiEyrfS7yGuf2eR7UZlQ==
X-CSE-MsgGUID: 5grnCntLQDKqL0iGPqIiig==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="69182698"
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="69182698"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 12:57:23 -0800
X-CSE-ConnectionGUID: URq99O8sQCS/3xqnLF6ncA==
X-CSE-MsgGUID: Sf/z5nCWSimBsWEvRxUJOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="206031862"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 12:57:23 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 12:57:22 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 20 Jan 2026 12:57:22 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.55) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 12:57:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iAn9xPepOCzbOV9LAsEkC+QBiM97yU2Bu31r3a3FOcV3gCzNvJZtf4es2bV00jn8nPD+J+mIWTc8Dpper1IVXZAUg7bZ8aXXGzxbq/IUq5auajWjo5M1OL87EGWAbm/g3syPpkTOXNHMoA1Ze/IsSMDruloROIDv0J3KoDW6duqyz1arEZurgph1oS1BXHN0k1brptoSZrsohy7hQA7TXMcochATZg0QgqBK4KXkusvSMwFKBDwxVFAQGlMXncGYkj9kH526ec3uczjzdd23tIpsYhCNykcTYHnAndUn/bzqImq9buqv3o53lKWus9hY1ipo0WCd2Q25vE+LL/AMpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DMdZIOMj/bfv4KnAebGTzXiv/HqwQ5bZJvrXnF4voW4=;
 b=nmeLorD3qodBP5cYqvZ3Yqf3I+R7JvR4Ar/Qjz+3IXt+eeYf6cifB5FbxJtlHaqEeoIn81z1u0YvDzwneH5IOz+JiT/cwFlC8iaYpaE+fr7IAEK9SWye5QnKDZhZtbB7WyjgvW9sIcXBYloZS94SeKyvCkDZaAL8EiGmILKOZ+ktuGlxaaCJQ5oY002zVkdYpZpO/M3pt0JF9+J58576g0qsjILEGdx3W4EOpRvSQybpvaJIHW3wxI3tE2bO49gRLzUaYzw3DGrbcaB7VWqdIxdU56v5rLyvnqte4Ca/lSFsmdmLZJq22+ZBCD4AjXQbLYaQtHnwS423iF+Z9GfPXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA4PR11MB9299.namprd11.prod.outlook.com (2603:10b6:208:565::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 20:57:19 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Tue, 20 Jan 2026
 20:57:19 +0000
Date: Tue, 20 Jan 2026 12:57:17 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/3] drm/xe/guc: Drop redundant register read
Message-ID: <aW/sLcOou1z5YKzh@lstrano-desk.jf.intel.com>
References: <20260120185047.593-1-michal.wajdeczko@intel.com>
 <20260120185047.593-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260120185047.593-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MW4PR03CA0141.namprd03.prod.outlook.com
 (2603:10b6:303:8c::26) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA4PR11MB9299:EE_
X-MS-Office365-Filtering-Correlation-Id: a8b315ac-495e-4b55-f706-08de5866804c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1t4gd6cdUgE7uwD6J4h5pzdX8rLAGaq51At2LCKC8cJpfZla4gIVDqNqXiv7?=
 =?us-ascii?Q?wtyjp9r2TeuLSrQNp8DO3GvzE6jZzaQFmsRUjeCNqx1SbOSVogWSkBDO3WLt?=
 =?us-ascii?Q?m7jxd/lOQAa1HYxxlYW8IW+oqKnjC+PN1HUu50/o7Toemf5/fyZ5zh2ntdQp?=
 =?us-ascii?Q?AV6TS28tefM5qW3fgpUtlasOMjYENcMBdn4TQU8K2jvsFIrm1n0SfNfzPy3J?=
 =?us-ascii?Q?IJ5Oarf3beSpG327GMNpXMdF2agKWUOKbXVMbAnjQzfWeKbClipSVSiZKX3K?=
 =?us-ascii?Q?Mlxx+9U4FSk0sOCerWfEK39M/EpfKeojgSfov/rpM6thqj+2L16q/AGsPSln?=
 =?us-ascii?Q?S0g3ryenNxYlWNO4AdnAUbQf7wgEoRvWEMA9C+aQ6nXpOZiwA7KLsmHAkCMp?=
 =?us-ascii?Q?Xwmg9hEqRTl54Tk2NHTEKsAq304EptnN/R0Ux6QZHGlLgj0xc07MStErKkyt?=
 =?us-ascii?Q?Za8s0JN0GAN1wcNWukEuHxyJz2imEOvqsQomg+1yvdPTA8Yd/tWLAplWWJ0y?=
 =?us-ascii?Q?f273I/6OLdm0rNcJvladP23TZdy6tPz8Hvc4fU9HNl3sIbNzpo2/zha5KPye?=
 =?us-ascii?Q?YgPf9XC6UIqKFwoVgu4WsRUoJMljoWDLmEfvHX8pqYNTXpvTQ1YmL/FsleQY?=
 =?us-ascii?Q?DDV14ITkhllPgczLNQTWUtPkvOY0nZhXbKTjyE0wT3TsKag9mD+30M94wSAr?=
 =?us-ascii?Q?mEigmq3RwsqwJLWqll1M0dI8CgQoC3yG7HlGKSlpBxhl+KnMT1VzmgTmZhmc?=
 =?us-ascii?Q?Hcx4YbetSYoxtNJHm/aGWz9I8bEQhPDf5AvK7pxO/Wjmbfs7fpir1E32L3Ks?=
 =?us-ascii?Q?B7XzUDLg6BUwlNOu4IXkcKf2MX/BNvBBTnj0MJLt3axgQJAEdJs1sMXnrXp8?=
 =?us-ascii?Q?vT2hErOzOqdn2WLAgAYBgMEqJAoFqhUshnWqZGEtAZ102kMYwFGOSOOvtPwR?=
 =?us-ascii?Q?Z37ba7jc2dt/dyEAFQF8Tbw1cP/Xn/WSVyR5axjKzVovw0d+dSlTwmoTCD5C?=
 =?us-ascii?Q?YI5BD3b8DdLNJCZsXow2YsM42oQE/0wVCb3UrEFgU3H3BKSEp6IMq1Gja6Pj?=
 =?us-ascii?Q?gNIQTstvO7EOCM289OHLpIf0V0Dd8sw08sqMPrp/ASavpE6fOwTJHfGfwzNq?=
 =?us-ascii?Q?Ulm0mGc/oqI5zdWsCm9FpETnBavCl7uKS/pdF3oTJ/IXgskTzsPeWB2SFSUw?=
 =?us-ascii?Q?FPmqAibUc6NNs7e+OMZofbf/PMTUCDYVBcX7d2zJ/DNW3aPwKA5WZISEnZQY?=
 =?us-ascii?Q?U71KLcMq4ptx/qLNKPopF5usnEfPhQWqI2RJcEcjL55k21PvuN7Np0WtNOhz?=
 =?us-ascii?Q?XVk/h9j38P5haf04PFdF7b4mPVSSXY9BAiiFFsJUY9BZ88ioVp1/wWVMpTZa?=
 =?us-ascii?Q?oCuopik/dDirQtLr/qQ9GybQqD0lxLJgpFmKXRigZqHHw5jLVEBSYNwU5Odd?=
 =?us-ascii?Q?2NDLoje9H87PYzT95v+KI/4i5Kp4+GRwqCXpLpJKzIz9Gmj0iJSnUd2b78lR?=
 =?us-ascii?Q?FldzgLXCzVRsJLYQe24vLGmExin57go5NPdVqyAr0SP8eys4aQMKPVHoGxpY?=
 =?us-ascii?Q?RvW1oMrit5eAw7+locI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yd1h2lZEZNbMnQSb757Uub5AfESRp3tfCZnyjZAgyeeH+rxP2xlxE/xXfi0O?=
 =?us-ascii?Q?5PoUFmruwjGNWmZW6V/LdcsBxEmFcAnVRq9df96jIPFBKIecGUR7HJNnmdqN?=
 =?us-ascii?Q?hIbrpukylgblNImlIEKIxEAxl3gvzJD1glmqLLndbB4N8LtN8FOCo27NUfjN?=
 =?us-ascii?Q?xegdHrk2EQTwpIRiG/IQgW4M+SnSnUCXqDpGmYsO/UC1VhkdcoifagJKXvHo?=
 =?us-ascii?Q?8F9hSjteho2lnXy6gx2LG5QwfUC3wuPOvPJ0EFYJ3BM3gEtl4A7ReM6MQw+u?=
 =?us-ascii?Q?GT+3jQavetnUpJ/usr2nAIIwsMy+uKebOwIFQ9y/PgCvO3npEuoZFU93eGG+?=
 =?us-ascii?Q?emUHe+Yo+T7gdlt3ex3XSWVNIRkoPtbGonsvQBNONEghBaatYMoMXLFX8AV1?=
 =?us-ascii?Q?m3KYIQ2cxXgnn4rMwXutDuqxYBI9Qwng3oM47LW5jcsx4tsqwVnxpqweei6S?=
 =?us-ascii?Q?N+XUg+a0dG9xS2Cy0hrP4rj7ZPwq/5rknOBPyaERrPJKHzK3uCoGy3kpNgys?=
 =?us-ascii?Q?kVeqhQ8RBKeBFFUQptlQomjmaUDb2dv2+R4gklMRqliOGqPHNJcyu9mdNhMc?=
 =?us-ascii?Q?rXum7hcq23zuwn8AnvTY1Y0QIvN9QXK2nDSwoPlwMf6ANfR6zbIVSTk3gOKx?=
 =?us-ascii?Q?1BJMcjrz2ImKFC72E8pD6xCDcmcOCxNwnOH2eiA1aW1jGK0Wglas+gZLhW/N?=
 =?us-ascii?Q?ZbtSPUN2+4MNtCuNdtdS3Rx2771Oo3MG8YvPWveSeknBDF2OGDmPuSw5ovMt?=
 =?us-ascii?Q?US7n/H45cQrV8NaNOXU+NIZVwdoP9FTMh5z8caHC7nLYEH9uvk01F+e8i7gK?=
 =?us-ascii?Q?nHtARfGpEjTvel41mAcLYYFnhVGEqOeY831oguPzVGP4WMVZvbGMCrEqkZYk?=
 =?us-ascii?Q?wrVLsJI/mmCo9/7t9Ho5Thu4f2C1N7AjcrEv+qLcB8NCLV5e+iKS6N7JV5hP?=
 =?us-ascii?Q?hyy9caht7Mbw3B2NGt2OgAC5MfFYv4Pp3put2aM968/vJ9xDL0tcetmT0YNc?=
 =?us-ascii?Q?Nx2wxQjKrHBlFB7JG7owQWgaom/KX/nIj4NKwxciDQG+wCoRlNdfjaO3uWzf?=
 =?us-ascii?Q?DDvrLBg2xtDSQkeqff3BNYQ14NR9iUKd6r/nBxLQlr/NUjARoA6Ylvyc8p1C?=
 =?us-ascii?Q?LYqSwHkmi+/mY8itHzjsu2AjswZcikLcx3KWFqXAGm6SsPrkiYYYkO314Uug?=
 =?us-ascii?Q?nF51KeuWQKMh1C6otGx8xS4vUnyorGdLcq1ai8L8L3lCfXrSHK2S4T20O7yp?=
 =?us-ascii?Q?tfhU/NMwr4fPk0IGx9DKgdcPLR/hS2khVLKzvwHpGrYOPLdnxCF97k/khE5Y?=
 =?us-ascii?Q?SrUEiVT894XItfh2eUQwT2MUd7anFnLBSaI/lgkoVRaiqUnJ0rB8YPWYWPOA?=
 =?us-ascii?Q?el/AgUyMOmcBfNW+kI657nzsV+JZpAYa/MIBBsW6DrL3d8E8grF6qv615jdX?=
 =?us-ascii?Q?0QGeP00vCZCQO7bYGXl2YrHGMJ3znhndNwNgxc6Vf4uMvcGKz2vRL82ilBaW?=
 =?us-ascii?Q?EKvb/GB5dwL//VJ14nXmczu12nRs9v7oqGqlZj09dnyPdE3dP9lBUU4WruHe?=
 =?us-ascii?Q?0hKS1XAcuiGjnxfEpbdFzZ2fJtSDuhxMFr0k/HeYyTTHSdTrzeGW5dWp2sqC?=
 =?us-ascii?Q?O8MOtwx8vgtlhZk3goQqZPsnJzh47WXNaRRyVl3AZPYxMZGYzM4hvdPX/XGH?=
 =?us-ascii?Q?v01efI9BwwGtnOeyKG8wy1Z6QufDnZ7wjZshatP0O8cZaKOTOh3LtqCgfHq4?=
 =?us-ascii?Q?+T7dld1hy0m+LthUGLoR8RsrXEWvnbk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a8b315ac-495e-4b55-f706-08de5866804c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 20:57:19.6846 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0sSlktTau8phTfRkmJV1girCnACLswMrIBLZve+M4bOpCS26pZSb+D3j4puYy64ghP2ArJpR3TxhmwWKVPKY4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9299
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

On Tue, Jan 20, 2026 at 07:50:45PM +0100, Michal Wajdeczko wrote:
> The xe_mmio_wait32() already returns the last value of the register
> for which we were waiting, there is no need read it again.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 44360437beeb..2a3b057fc828 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -1394,11 +1394,11 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
>  	struct xe_device *xe = guc_to_xe(guc);
>  	struct xe_gt *gt = guc_to_gt(guc);
>  	struct xe_mmio *mmio = &gt->mmio;
> -	u32 header, reply;
>  	struct xe_reg reply_reg = xe_gt_is_media_type(gt) ?
>  		MED_VF_SW_FLAG(0) : VF_SW_FLAG(0);
>  	const u32 LAST_INDEX = VF_SW_FLAG_COUNT - 1;
>  	bool lost = false;
> +	u32 header;
>  	int ret;
>  	int i;
>  
> @@ -1430,21 +1430,20 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
>  
>  	ret = xe_mmio_wait32(mmio, reply_reg, GUC_HXG_MSG_0_ORIGIN,
>  			     FIELD_PREP(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_GUC),
> -			     50000, &reply, false);
> +			     50000, &header, false);
>  	if (ret) {
>  		/* scratch registers might be cleared during FLR, try once more */
> -		if (!reply && !lost) {
> +		if (!header && !lost) {
>  			xe_gt_dbg(gt, "GuC mmio request %#x: lost, trying again\n", request[0]);
>  			lost = true;
>  			goto retry;
>  		}
>  timeout:
>  		xe_gt_err(gt, "GuC mmio request %#x: no reply %#x\n",
> -			  request[0], reply);
> +			  request[0], header);
>  		return ret;
>  	}
>  
> -	header = xe_mmio_read32(mmio, reply_reg);
>  	if (FIELD_GET(GUC_HXG_MSG_0_TYPE, header) ==
>  	    GUC_HXG_TYPE_NO_RESPONSE_BUSY) {
>  		/*
> -- 
> 2.47.1
> 
