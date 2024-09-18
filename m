Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7B59CDD55C
	for <intel-xe@archiver.kernel.org>; Wed, 18 Sep 2024 21:27:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A31510E641;
	Wed, 18 Sep 2024 21:27:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XH6p4NDS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A612A10E641
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Sep 2024 21:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726694835; x=1758230835;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=4GQXFXyxboYzep+BCS9QwFwETWkGaM/OcheMsM3LB1I=;
 b=XH6p4NDSYicB9zVHga00bqs1osiqJLtTihRkB5Jja0L4EsnAeB5xBEF1
 z+dwumtZauCsyixyfub82BxmO1oVshr0NWi0c3XI3kamxvRBFOf1lI+h6
 TUglwuXkPKan9z7MyIOdDZWdLPyI3N/r8vSIpMoXHaoiyVRrYdz2S3E8n
 OtKAz9CvCBKgqohNyGytqFkd8WS1qtOG7a+N1dhgvOHF5zZRshn50i3gR
 zadRkDZW1Fx+oKnpVxWUVKDYtbq2ptBlR28Vwv8aMVpZtXqErl/85biQr
 oC9TjNMY8W01VaSYPfBtN/ldLjcCM70jU6GTZVItAe59ChfhrdNW83aCq Q==;
X-CSE-ConnectionGUID: vE/CHB0KRBSN89TLtmm5LQ==
X-CSE-MsgGUID: vG0nVdiVQl+nAQFdCCTl5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="25457968"
X-IronPort-AV: E=Sophos;i="6.10,239,1719903600"; d="scan'208";a="25457968"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 14:27:15 -0700
X-CSE-ConnectionGUID: I5aIB6LMR2iM17hW/64Ryg==
X-CSE-MsgGUID: S3LK9PQJRvKF3Ry51tAelw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,239,1719903600"; d="scan'208";a="69590230"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Sep 2024 14:27:15 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 18 Sep 2024 14:27:15 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 18 Sep 2024 14:27:14 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 18 Sep 2024 14:27:14 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 18 Sep 2024 14:27:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i8awHcugAd4zDZ1/p8jkMyMKqgLttnYqRa2ZeVtMQxmFCyJOCZ3v48QrCFy1krIrmF5u1IfvCEeQ3QUjnMQujTVnidYEwk9MLi+c6xxOwtfwY3dkUnqJtYRuI7jh37NSLiCATPccEdff4yZmUocEw1CDrWOBcSG2GkInFWr05CjL6p/7QhPN2t42luVNsp2TSieN2OrwvegA6ZT1VHlaPZfoDIfcjNNs7ekz2VfGbDP618imlJtWe2Bw1+LISiTE2m54pE0Xm5QyK1sThHbjXpHrl4h8npl4yWK/bUXSCoH4uIlRao6obTc1gfFECBG5H5qtOIdyiyrMeIB2LTH0ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=igQFvMAtfTmMg2EpRCmXb0o+xlWy9Cb2vB7CYxVrHMc=;
 b=JoD6SNywQQWDpC83oZaj1OoEolYesXp+1VW530aqBDfzfqBxKZkqQpqj1NUEcmMx35zkBiWIlc32UtKZ8PuCA8kT8m9hz7vkoQeaHi07kCI91cZkqQLV2lIk7ciVtPRL3fe7jAIGEwNzjeHiEdCByJ/JvCQMFZ47HdVl4+QRssb4HDcpOyJmHyh7l/la3cGiQbkOJf2Zm1CTjS6EQ/WKR7IYWigUpWfPMy2c4Vh6zbZiqCi1R35wHHEZKVMD1vPyAPcy7ZyJAmisCxrU85Zr1HgnFjG6pG2bDESdLW6fxGJWkq+UgSQLMNrkyLUbU+74k3LQnW1UfxqCBM05b2w6kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA0PR11MB8398.namprd11.prod.outlook.com (2603:10b6:208:487::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.16; Wed, 18 Sep
 2024 21:27:03 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.7982.016; Wed, 18 Sep 2024
 21:27:03 +0000
Date: Wed, 18 Sep 2024 16:27:00 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 2/3] drm/xe: Don't try to derive GT clock freq from
 display register on Xe2
Message-ID: <ss6pqbnp7irqgm565e7myfc4vjflxaohchar6kxdtzis6bzcij@zxst7om7m5zn>
References: <20240913162910.4145142-4-matthew.d.roper@intel.com>
 <20240913162910.4145142-5-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240913162910.4145142-5-matthew.d.roper@intel.com>
X-ClientProxiedBy: MW4PR04CA0308.namprd04.prod.outlook.com
 (2603:10b6:303:82::13) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA0PR11MB8398:EE_
X-MS-Office365-Filtering-Correlation-Id: 32647afd-60ab-4b49-3952-08dcd828a397
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HcCRkcCzzlG0/+lg9yO4O5KakoY09crCXm9xbyr3E+XRuYTg4ZCSPC5l8LT3?=
 =?us-ascii?Q?CWXd9QQuak8lMGpx9e8CZYUQDxRqHbb1UTHzt908nyyk9JFcETFP0k0+o0hL?=
 =?us-ascii?Q?wSRDPNbVjt2yDEGQYcGG1O55a2pog6BRSJxcXFd6CJfsQywx+CXvQom0nE+u?=
 =?us-ascii?Q?Pz+pNTfxdHBEbeF+CkYit6dSKLS5dIWGxkEZFrBqgZU3DvpaOck+gIR6Qftu?=
 =?us-ascii?Q?un4cwUhW3N8PnTpZktLWh/QuUj0CXSeaXlMmv6oHCX9kAoFJSWJHNX9ImCv4?=
 =?us-ascii?Q?wS26KgOPOz73wJ1ao6lGGlmgPPVDUH19JQamWfDGsXnrYijVdMvf20yCbG9+?=
 =?us-ascii?Q?kfHW64rCDxFF72bWdwpHppwxNyRZvj30cwamj+wIqirJzGf7p1FrGS44NIxy?=
 =?us-ascii?Q?FEqmPWidVYMlYmldR+vh9G4unT4vd7/RvU0macka1fHDyoEYZNlNyCRGKkMy?=
 =?us-ascii?Q?0Oj22NFGlKN0FXKwZAOD7+TT+WKjt281BKoy41BZXX5A+rwL7FpH54lIa4p9?=
 =?us-ascii?Q?SatgXaNPU4/t+Awm9BB/ZHyeB8jbtfef7a6ct9NRh68RBCiMHjochXy1irG+?=
 =?us-ascii?Q?H9AMOUp9jkc7H7WzrI3UulUHAIFLGUjC+pMA0dJpiXBLR9L+GazuQWFHSSoc?=
 =?us-ascii?Q?kyv4mbQniLhWmq8kP+Cvoe0EzWxTipXQoIOLLwjAYZE4FLfC0cVmiqTBkcGb?=
 =?us-ascii?Q?y4KzpN7v2pkw6NwGxvI7bEhWPXCAlseLSn+nN1haVkpQDEcrxL+JpyuyroGB?=
 =?us-ascii?Q?AMZtHhkOtNbKH1CHvtk21YLBNrfM1OzeMRr3rJrBWDPcoLH2YJM2RlMc+5/Y?=
 =?us-ascii?Q?t5SqVwXR1ESfZv8PbhxkVWrOgRQbQWImB6tmClUpGbggrt0jSccOB0HVWfWe?=
 =?us-ascii?Q?CTpWxlF50h7sv419iOf+zloeRK8NZx+zAr6mDp8hwsYTs1uqHrhMOhe/A8jD?=
 =?us-ascii?Q?7mgFS+Yf4CPDAOnTE4xHRF2sxc9QBttFnrcvtrb1twHQJabYyURA3+7GxBih?=
 =?us-ascii?Q?war1MQSTBFxeTWq1cen572YDOYkURdfnvsnAi7oVe36xmNkECnt5JtN0KE9v?=
 =?us-ascii?Q?P5FjYG5jEy+2BPahO6SJUlivmRhFrzVVLqyWQpvFq1djFsR40uGaVKXzN6Df?=
 =?us-ascii?Q?/1i2F3aCE1mNc5emrR/RFGkcCHO24xNcKF57JnQ0lHB5+QhaCrlRrB8fLAYW?=
 =?us-ascii?Q?gv0QQw0JQpYNFEBbuB8m6zs0Qb4L9/nKQql7ew3raLZXrS4gcG22idbNPdbm?=
 =?us-ascii?Q?unR2TGW15PFyDkgCS1mOrBa0dbhj6+5wFWfgWsFbplFxljwMVYm6lo5fR9No?=
 =?us-ascii?Q?keU1z810oYl1jCVWB9hNLj0Y2PUBHzK1xKCthG0ouSIEfw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SRKeqTfb+SU3fq8TMHU2egxRyyw6ri3zWVUodlB8nkD+obUYdCnu+ehJscZh?=
 =?us-ascii?Q?NIJiAvJygH/oVgN12dsDhhxC/Cy2UySIESKhbSaDlA4Xg3nmpgVAIyOS3fGa?=
 =?us-ascii?Q?U7Uh8kxUjvZG9oSQ75Bds18yeuIP8xpJ0CXSaajbQzR2IbQAtqpjqseyKdbp?=
 =?us-ascii?Q?qNhIuInuWOqYral8jl7093llqqH2VSfwcd32JqlWE66xsM4Q6g/ggc7Gz9k0?=
 =?us-ascii?Q?ttiifQnKxXhqkMoCb511RHWBV5+UCz6lUL1W8o2yEHndbTmClXjjGq4XdNfg?=
 =?us-ascii?Q?JEd/veRXdtGpYhKlhxGZGjWJGLeS1mZky07G/ULQHwV6DbS2v+UCilB4X4/C?=
 =?us-ascii?Q?Lqf8GiyZj7XIqXdx+9hJKLlQyEA7iPYDHvCeobaz2A1aEQkZTXZLDGE+nHlT?=
 =?us-ascii?Q?wLcd3Nbryi6BQeEpSI11TYPhCpMfd1Iz2odUAVG5KzDyjdvfsZd7AkR1NF9t?=
 =?us-ascii?Q?DuxRtR6cHs7Ujsbvz8XkuXNxQ8UDihesOp6vsnLJqjDfcWA0cZJle8WJh+Y3?=
 =?us-ascii?Q?/UTrqsIls2KGe/RQsdSnC3PIzh/3DTaN1zdsbb/SZnHfZxpWOdNeZfEwel6E?=
 =?us-ascii?Q?hCifgsQJ7BqvuKvmuw8784ogqAXrKrTrF4lh/L5spxuDlXXez79NYSIU9jdU?=
 =?us-ascii?Q?wYon7A8fGTbB8tnGHUObe1x43XcVRX67WWfPdRpjkvNd9epLk3hOKXEbqDLM?=
 =?us-ascii?Q?fE3VyAzQFys4T2T7jX+vd2p7mfBn+vuuTijYV2UdNaEaHWsyKhtaCtQH5tXa?=
 =?us-ascii?Q?JL4WdGGi/EXz/Follyq4/85JGFCxrv4GZ3jwXEoocMhimpzMyPyCXC3/thnc?=
 =?us-ascii?Q?QnIQ677ggOzdl/GjvL9SHV4nNjg0wj+v3f556LnOT7UzUuXXDyHZoiFc0Ak6?=
 =?us-ascii?Q?Rtwa//68XodlfHuq8wR/s21F+2X5yjRLEgJCk4ao996fn0ureu/CQvlhGCMk?=
 =?us-ascii?Q?ltwnPnD76kySfdJWX0Bo5uINwaHIwoXZrgxtn8nNx4DfwF7VGL9QzW0I3GHh?=
 =?us-ascii?Q?c93ikoZf1nwp5V4GaLLpMieXDW6duZer35t2nnkyCf0vZDB+y96izhdzfQ87?=
 =?us-ascii?Q?WVjeMiNl8IjdAZeN/eWxYY14bw3e3a3aSzrgLkf0Ntr9IkiRFmoPpIwglaEK?=
 =?us-ascii?Q?g/yg2OP4ZlZHS+1tqo04wDMZJx/TOke2F209C5wwMe2+qS35tTnpQUVWuE8Y?=
 =?us-ascii?Q?+mtwKJ+7B5RCimgRGnPfYnVt2J7NmE189r4E+07TBi5lmBO7nRU1jY3Gx1/Y?=
 =?us-ascii?Q?3QSIWGcP7pHqIw1MPZzRmVZoy32XHFam5WY4RZIu0b/QJ7a6jKF342ikR71D?=
 =?us-ascii?Q?GhL41UE3S4vEb+OewqQCyGCXbo9mhq+jQ7X4TkQBh611e276lmAD/wN9PlN0?=
 =?us-ascii?Q?ISvxmmH/vwvc1mQsVM/aNJgIQ8CbbOWMZ44Eo7GlNMzdE5aVV1Q6Yr0AKcjB?=
 =?us-ascii?Q?xmY736jcC7iZ3r6gyNZhluoR9O56BO0+ZeeS3kYmHC+vk/E/5UPIz3b/Ek2O?=
 =?us-ascii?Q?Ck+jbHy6q6IPgbeQXwG80n874ClTYWcdU7ZTg1y3BRg2Kr7qg/y0laUEXFGo?=
 =?us-ascii?Q?W6saoBZhbZIuFgOX6hMQ/6B9E7u9jjDRT/l1hOoWJgcmAUUtR2qBxL9a0qjQ?=
 =?us-ascii?Q?Mw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 32647afd-60ab-4b49-3952-08dcd828a397
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2024 21:27:03.6076 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MrGdyFpkVWWqf5h6Dw7jg3Esp7yyQSzUwIi2liusNcGrOvKN+mx5EliieOJutlw6jOegEYPeKA7LAszmK8BCTEywyoWGKbfWAvtvaHHFFSM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8398
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

On Fri, Sep 13, 2024 at 09:29:12AM GMT, Matt Roper wrote:
>Driver initialization has two approaches for calculating the GT clock --
>it either derives it from the crystal clock frequency as read from a GT
>register, or it derives it from the display's TIMESTAMP_OVERRIDE
>register.  The driver is informed of which approach needs to be used by
>a bit setting in the CTC_MODE register.
>
>Use of a display register to initialize the GT frequency seems a bit
>suspicious and doesn't seem to really be documented clearly in the
>bspec.  However there is a note on the CTC_MODE register indicating that
>the setting that corresponds to use of the display register (which the
>bspec simply describes as "Broadwell Divide logic") is no longer
>supported on Xe2 and beyond.  Furthermore, the TIMESTAMP_OVERRIDE
>register itself was removed in display version 20.  Rework the GT clock
>init function to only consider CTC_MODE (and then possibly use display's
>TIMESTAMP_OVERRIDE) on pre-Xe2 platforms.
>
>Bspec: 62395
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/xe/xe_gt_clock.c | 30 +++++++++++++++---------------
> 1 file changed, 15 insertions(+), 15 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_gt_clock.c b/drivers/gpu/drm/xe/xe_gt_clock.c
>index 886c071c10f5..93940dc2c146 100644
>--- a/drivers/gpu/drm/xe/xe_gt_clock.c
>+++ b/drivers/gpu/drm/xe/xe_gt_clock.c
>@@ -43,29 +43,29 @@ static u32 get_crystal_clock_freq(u32 rpm_config_reg)
> int xe_gt_clock_init(struct xe_gt *gt)
> {
> 	struct xe_device *xe = gt_to_xe(gt);
>-	u32 ctc_reg = xe_mmio_read32(&gt->mmio, CTC_MODE);
>-	u32 freq = 0;
>+	u32 c0, freq = 0;
>
> 	/* Assuming gen11+ so assert this assumption is correct */
> 	xe_gt_assert(gt, GRAPHICS_VER(xe) >= 11);
>
>-	if (ctc_reg & CTC_SOURCE_DIVIDE_LOGIC) {
>+	if (GRAPHICS_VER(gt_to_xe(gt)) < 20 &&
>+	    xe_mmio_read32(&gt->mmio, CTC_MODE) & CTC_SOURCE_DIVIDE_LOGIC) {
> 		xe_gt_assert(gt, xe->info.probe_display);
>+		gt->info.reference_clock = xe_display_read_ref_ts_freq(xe);

I'd have left the assigment to gt->info.reference_clock in just one
place, at the end of this function... and use the convention "latest
platforms first). But that's a nit.

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>


thanks
Lucas De Marchi

>
>-		freq = xe_display_read_ref_ts_freq(xe);
>-	} else {
>-		u32 c0 = xe_mmio_read32(&gt->mmio, RPM_CONFIG0);
>-
>-		freq = get_crystal_clock_freq(c0);
>-
>-		/*
>-		 * Now figure out how the command stream's timestamp
>-		 * register increments from this frequency (it might
>-		 * increment only every few clock cycle).
>-		 */
>-		freq >>= 3 - REG_FIELD_GET(RPM_CONFIG0_CTC_SHIFT_PARAMETER_MASK, c0);
>+		return 0;
> 	}
>
>+	c0 = xe_mmio_read32(&gt->mmio, RPM_CONFIG0);
>+	freq = get_crystal_clock_freq(c0);
>+
>+	/*
>+	 * Now figure out how the command stream's timestamp
>+	 * register increments from this frequency (it might
>+	 * increment only every few clock cycle).
>+	 */
>+	freq >>= 3 - REG_FIELD_GET(RPM_CONFIG0_CTC_SHIFT_PARAMETER_MASK, c0);
>+
> 	gt->info.reference_clock = freq;
> 	return 0;
> }
>-- 
>2.45.2
>
