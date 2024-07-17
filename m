Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6922C3DA42
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jul 2024 04:27:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48F3610E896;
	Wed, 17 Jul 2024 04:27:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U534PU/F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E24410E896
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jul 2024 04:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721190475; x=1752726475;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=qToS6vIcTQp9e28mG/KMvFH387LEtItZuPduDyZDM/0=;
 b=U534PU/Fpwu/p5xLHGHFuGuw+pSVHClki06Ve5fZ72U8igQjFw3N43uf
 4wzO/6SFV6g3Gj0etG/cdVuWMAwprYq5idl6HN4r009dtkm8aCmK+FfPD
 1pBz6stUF+QWw7Wwg03fuZmeH9fs7hqYZShF1O4GE2wQSMrtAsUu9/jo7
 9LGeZgp43RA0Kx9r7aYhNoutyXLKhONye4I9y9IgoPBmBKdzl5gPntrNY
 IHHylQtLCg3Y6BS8vxLtAUShJA+AHiwz7A7x/sdalWsfxs1rfuopuUJp5
 dK9zdZZSUBKWv8QPfImcsVZYCPNSmoP2+FdEoBQA/TbLJj4QgyOR51xqW w==;
X-CSE-ConnectionGUID: ucxZfTbUTr6aMMzs8byBow==
X-CSE-MsgGUID: 3KphntPzQYemeIOH6OkCdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11135"; a="29255494"
X-IronPort-AV: E=Sophos;i="6.09,213,1716274800"; d="scan'208";a="29255494"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2024 21:27:54 -0700
X-CSE-ConnectionGUID: kBU8ocKsQJmvNNrX8PQtQg==
X-CSE-MsgGUID: HDmyQ3FjSaylhsjkrFHmTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,213,1716274800"; d="scan'208";a="80917134"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Jul 2024 21:27:53 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 16 Jul 2024 21:27:53 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 16 Jul 2024 21:27:52 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 16 Jul 2024 21:27:52 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 16 Jul 2024 21:27:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hP6pUIy10iW3loAh71Zz6kb/v5aF5IPjOTbGPg5f7S3Z87Ubh11TwZijfN3IDjUhkQ3B37hLlvM9LIOxpPo6XtR0NGm95txzt1iftW9o4I3qA+29aGLEXHX/eHQ8Xmd4BRHOoSJFNLqIeg0zc/aavoXdt9B8KD7Zubjz+Sy9T+Oa2YDxurR3PCSaOXoocS2fy2SJy2folvcgOmAQxXs3Ygw27GPW2PcGAa6fEkGzozzUxXAofGtGQqNqgRRpco/13L0OGA4i6H+ZcwJrAEk7qTQFCDyDxvxYpKNvxAPwtqW8WA0r9aqHSQjOTRsZM7AIT8lkg0S43B5fKarP8UikfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sNGH8ALFQD4kmqnvm6m2K4cr3nh9r5XYsTKR5s8ycc4=;
 b=dwXQdlDwO3MSut+3e9LhXXfZukIjg+pk8hIa5IwY4QneakMEJqgqzYVR6FGzUHLnlYE4tqpUXamQ49yEL6UkIFabzW5gjIiW3uzzpqiXRrse9/inLqJLNFJP8JBf3uuXT8D6joePy4SUNGjLtEpGg/IJoYfTgS9DZOMTI0v+ClpDFkTSexu3CecsW2yhHaPr1Q8+RWNvr03pPeEhyKsH4XJKJoxEBCgpEV0TQWXelUzePNykN/cp9hclluMwY8+t1Kt5es+nKIkQFUhFd3dizi45FAEmA/fdd5DsbhDsLBEdgbvxoo4eaYgATqaryIRSlQ9UqJttkQVpNCdGxuwCDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA1PR11MB6565.namprd11.prod.outlook.com (2603:10b6:806:250::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.27; Wed, 17 Jul
 2024 04:27:50 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.7784.013; Wed, 17 Jul 2024
 04:27:49 +0000
Date: Tue, 16 Jul 2024 23:27:46 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v2] drm/xe: Wedge the entire device
Message-ID: <iltzke4nifu4uzt4yphxmxxt4lfoq2tklkihdzhuqumqcqoktv@7mkpalgxn4ej>
References: <20240716060343.1310088-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240716060343.1310088-1-matthew.brost@intel.com>
X-ClientProxiedBy: MW4P223CA0028.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::33) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA1PR11MB6565:EE_
X-MS-Office365-Filtering-Correlation-Id: 3199eb7a-b512-45e2-4c74-08dca618d10e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?j/Ojn2X47m9XVV54gB7k/kQkkQLs3ZHSETrG9GweLlJtEHlefOyjD50Krgp3?=
 =?us-ascii?Q?lfgXnnLj6nSLyzsuDK4wS25jJXpmfatrOqTwkJW07W/yhA1b4FS1duwDQsTh?=
 =?us-ascii?Q?7UHLWh08hodVNBA5M0pe9RkO0ajmJxaS4rzBrtomTytjQTpJIPKVOmeep3F3?=
 =?us-ascii?Q?uQlepA6fyLMPC6A0AJbMcInL3hjx8ga8O/oCg3ulZKNLSP4dXLWmM7gfAUNu?=
 =?us-ascii?Q?+fSS6HCYOY9DyFmXmxElC5xHVtmWlKo/RY4FzAr2Hgutpd857boUTn7AAg10?=
 =?us-ascii?Q?ObPB9XIALotEj9EN0xu0adV8g7jc/wHVWvbLQH2KiR9nBNHAVdjL+j+3OFsl?=
 =?us-ascii?Q?h7LPIPTxIbCLaUoUN5BDeDzAWWEbzIUKFtv14nLUiu1T+xs2Cf41qE7W/SHR?=
 =?us-ascii?Q?DEIeZcrw6qckxrdvTuefM+9vbiEiaG2/M1OZ8dLqiSuvSBhUA8eBI5efEnuZ?=
 =?us-ascii?Q?ZgMY2Prvj6l0k/8GuoxUeKbI9TtHGEPt4ksunEDgcPaadEpcyUg7XrP1VD8Z?=
 =?us-ascii?Q?/h6g9x+7y8k2QGHjsqu0QF6wuUa49iS8Y79JmGjjJ1A8NpdjaOQuKPcIrPpS?=
 =?us-ascii?Q?qSFWVvjeBnxFIaolI2kLAvfVZ1UAeJVMoX3M7kuoPRPE5Um/wa38wo1TsP6z?=
 =?us-ascii?Q?fXxJVOs+icCpyz1mRLAeCTNmrveDLoNE29u7VD9XTMROwLE4YnEOkt373l81?=
 =?us-ascii?Q?NtCX4zecY7+q0dn5pqAHk5k58N7i6pqmMyOO+zGqgo+S/3zft7ctRDqF5w2X?=
 =?us-ascii?Q?ZAPC1YfoZkuC8ZrlGQKSDfIyggdVINvWvb5gxhJLZRrI9QZ9cMPsRbHri/yK?=
 =?us-ascii?Q?WFaSdLe11LnykpTQLZEDm4YCpKjQIMiBkbmuHQGUHpJwVnd0Qgwf9++PaNYy?=
 =?us-ascii?Q?z81QH76dq08M40IpMfvw3kHRHNca8FXpQz6aRzK8LL7fLjaMKQI/EFya9a+P?=
 =?us-ascii?Q?USpLudrtsvNBXRQkQOJSOyeAchz95jO9nR1wiq3Avkp8rtUK6MGs0hDuPmtt?=
 =?us-ascii?Q?wt3g4YMcLM0eK+1t+LKoaAZcvZERaNC9T72YBimqnL9pTWXIsNxJup8BjJ6X?=
 =?us-ascii?Q?WqFqQbXpQpQO4X+p7XFyjedbjKueP0SzCtm6joqz6bwsZaVBWMeVMsYZ2mIb?=
 =?us-ascii?Q?tDvKkSTBeJUJzv86ds5DqWbrtPg40UoJrvdX7VlT63YihYdfH7y8tku++b83?=
 =?us-ascii?Q?/szjQLTo8eMWP12M3+yVoVQ69jQZKvtmdYStfozYFmjPLRP48P+ZYkXSaHr8?=
 =?us-ascii?Q?79SInE1wCSYK12HqDGK8RDv8pMPfjZVRcRLWlQGeXKn6tw5lKXB3+wBbbPyP?=
 =?us-ascii?Q?XQE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vOw0dF4OUqpzCXQUxdA541WAiE2kpofYNGf7PnRUKpw1mrvHPPQ9SGNYEuN3?=
 =?us-ascii?Q?J/dxynVpq165FJWdiXiN1ntEf2knZ+gK3+P1f68hqx3m75EMqMTzwnAs1Tkm?=
 =?us-ascii?Q?kyuK8LsL+QrNhnxABquKMPA8gTWsX/HYH/LpPaWCsWPGmObu/63cW/O7CcS2?=
 =?us-ascii?Q?+ZXO8udr6dfTp7IJ8b6q1+aySNd5f8ySvStYCMJnOQXLO+B1EKvj8kwKp73Q?=
 =?us-ascii?Q?XEfUHj7A4vPVKwTnkzEKSYusMCY+iC3simrYlYvhyqHgbA/HJqnb2Oex0Gn6?=
 =?us-ascii?Q?K7rEu1gxeKTdmwc4j3nXy4kwpWFg+UDWDKI8bQPtZQHpBgv/TfyjbcG16R0r?=
 =?us-ascii?Q?6ikiaIGakh3KojvTbT2ZCLA99UbSzMGHy3uvN27NtbBjI0YjvBbWocZG3FGg?=
 =?us-ascii?Q?L6PRw4IiJUTvZ9Jtwy4B8P/fq3FVCScva4dpA2KtibJ/ax2i7FOx5RhEWrMe?=
 =?us-ascii?Q?P6+EUdhMgKDVKasoNU64rZtE52aNjn++SdCQKPxOCqzDM4BKn+sfC+ygyD62?=
 =?us-ascii?Q?uTNoGIy6HQ5HShpW6KsAmYSnx7BF1rEBWDUYkmNwMXx5yc2gc/xd95YN+6Qs?=
 =?us-ascii?Q?s8IRaqcJXNt77J9VtbpF539impc/NWfxWsdkS5OpMTuK9fMsy/voMu7tKgPo?=
 =?us-ascii?Q?FBtaQO+VGcr0lFmqjY+PTof2tAA921QqE3K9vJ7JeZHkIhDIbxaWLMr7EMat?=
 =?us-ascii?Q?vQYsJEqVJf3dZt9fczRfTevW5Wtmq7szlmeMasqCAfXv+F+SjoR38fF2HwHL?=
 =?us-ascii?Q?1MSwnjyFoGziEBmSQfTLSwM4nWTEHkUyiN9gjJoSp9rol2kG39ySzjMAn4z9?=
 =?us-ascii?Q?W6FjVRsI4NjL5fxzxYjVsTDODjrLeTQZrY/OtLm2T9ka6JbsQqzqWpN+eAaT?=
 =?us-ascii?Q?Juoh/pciuWmSkczFzCFuXLH7jYV2DGZb0Z80oCWtvxX09dkltBJQPoyZHOOl?=
 =?us-ascii?Q?Nt+vmFsvWA5YmZXeco+RtdOXmEiXhOrcBQXEdJ6klCESAldkljyYc6OiBbfi?=
 =?us-ascii?Q?rm53nnZDc2pdv12U91Fi3X0vlcnB8jFNjJxpwj0uvwZTVkYeKU6P/tIpCqhd?=
 =?us-ascii?Q?PomeNEGIbM1MhOk+lZRkBwHjcyHebtsKQUa+pmZN5pe7TWQC9TM4fJMpHxqy?=
 =?us-ascii?Q?eHc+I5Gz/HNcN+FrXnWZjmcj38Qd5gLg4BUFVUNbWXBrn6q+tj6kpMaLWQ8E?=
 =?us-ascii?Q?ia8K1CynLezwIX6Akq7YrjVRmAAkUzIs6DxmjolcBQNoVs55yq8MRmJqSD5C?=
 =?us-ascii?Q?SQ8Q8LzCZKW/Q4w7zV9+yPG5uO921HOG6tXmgRKfFUkBZjJyQMyzpG5FmNFe?=
 =?us-ascii?Q?pQwv3DCK0/aXZJghk8BBvE+NQeo/i2meyGn06lRMtYPG0KPK4KHLkyN1D0ev?=
 =?us-ascii?Q?SkqSV/Hd0F9HVB9e0nKBJRTWljSPnENGRq0l6OEyXsL7ICK2oceMP7JgJlpf?=
 =?us-ascii?Q?/iWMGuY5ohHTB2VNb0OUkuOTKICenzDQeN5jC5/5+vM5+EUkfymmMxPGEUen?=
 =?us-ascii?Q?50/0IjRSvEDpqtVFKrYEtaJzALGcz5Ir8d+KpMXHZFrXhae77ks1ztD0Sbzp?=
 =?us-ascii?Q?OtdZ1KQDIrqEOUqxF7X+t+PJhXCmeHSxwQd8pFHKbfD9Ats817iNLqn+9bQY?=
 =?us-ascii?Q?vA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3199eb7a-b512-45e2-4c74-08dca618d10e
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2024 04:27:49.9023 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +5s8kLnLrsWDzxy2ZaPE/LyjvtV7tpg1pMrTGpSU5L+ieTOmfuVPDaoplH6een8bTddTJBeQQk3CAQjZpoUXvQk7uZcotGHAVcOTJrOkWjQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6565
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

On Mon, Jul 15, 2024 at 11:03:43PM GMT, Matthew Brost wrote:
>Wedge the entire device, not just GT which may have triggered the wedge.
>To implement this, cleanup the layering so xe_device_declare_wedged()
>calls into the lower layers (GT) to ensure entire device is wedged.

cool, I like the layering.

>
>While we are here, also signal any pending GT TLB invalidations upon
>wedging device.
>
>Lastly, short circuit reset wait if device is wedged.
>
>v2:
> - Short circuit reset wait if device is wedged (Local testing)
>
>Fixes: 8ed9aaae39f3 ("drm/xe: Force wedged state and block GT reset upon any GPU hang")
>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>---
> drivers/gpu/drm/xe/xe_device.c     |  6 +++++
> drivers/gpu/drm/xe/xe_gt.c         | 15 ++++++++++++
> drivers/gpu/drm/xe/xe_gt.h         |  1 +
> drivers/gpu/drm/xe/xe_guc.c        | 16 +++++++++++++
> drivers/gpu/drm/xe/xe_guc.h        |  1 +
> drivers/gpu/drm/xe/xe_guc_submit.c | 38 ++++++++++++++++++++----------
> drivers/gpu/drm/xe/xe_guc_submit.h |  1 +
> drivers/gpu/drm/xe/xe_uc.c         | 14 +++++++++++
> drivers/gpu/drm/xe/xe_uc.h         |  1 +
> 9 files changed, 80 insertions(+), 13 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>index 64aea962afd5..1e3d3a7e74d5 100644
>--- a/drivers/gpu/drm/xe/xe_device.c
>+++ b/drivers/gpu/drm/xe/xe_device.c
>@@ -909,6 +909,9 @@ u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address)
>  */
> void xe_device_declare_wedged(struct xe_device *xe)
> {
>+	struct xe_gt *gt;
>+	u8 id;
>+
> 	if (xe->wedged.mode == 0) {
> 		drm_dbg(&xe->drm, "Wedged mode is forcibly disabled\n");
> 		return;
>@@ -922,4 +925,7 @@ void xe_device_declare_wedged(struct xe_device *xe)
> 			"Please file a _new_ bug report at https://gitlab.freedesktop.org/drm/xe/kernel/issues/new\n",
> 			dev_name(xe->drm.dev));
> 	}
>+
>+	for_each_gt(gt, xe, id)
>+		xe_gt_declare_wedged(gt);
> }
>diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>index b04e47186f5b..a4fd3665c1b8 100644
>--- a/drivers/gpu/drm/xe/xe_gt.c
>+++ b/drivers/gpu/drm/xe/xe_gt.c
>@@ -957,3 +957,18 @@ struct xe_hw_engine *xe_gt_any_hw_engine(struct xe_gt *gt)
>
> 	return NULL;
> }
>+
>+/**
>+ * xe_gt_declare_wedged() - Declare GT wedged
>+ * @gt: the GT object
>+ *
>+ * Wedge the GT which stops all submission, saves desired debug state, and
>+ * cleans up anything which could timeout.
>+ */
>+void xe_gt_declare_wedged(struct xe_gt *gt)
>+{
>+	xe_gt_assert(gt, gt_to_xe(gt)->wedged.mode);

this and the other one(s) look more like an xe assert rather than gt
assert...

	struct xe_device *xe = gt_to_xe(gt);

	xe_assert(xe, xe->wedged.mode);

>+
>+	xe_uc_declare_wedged(&gt->uc);
>+	xe_gt_tlb_invalidation_reset(gt);

this line could had been left to a separate patch

>+}
>diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
>index 1123fdfc4ebc..8b1a5027dcf2 100644
>--- a/drivers/gpu/drm/xe/xe_gt.h
>+++ b/drivers/gpu/drm/xe/xe_gt.h
>@@ -37,6 +37,7 @@ struct xe_gt *xe_gt_alloc(struct xe_tile *tile);
> int xe_gt_init_hwconfig(struct xe_gt *gt);
> int xe_gt_init_early(struct xe_gt *gt);
> int xe_gt_init(struct xe_gt *gt);
>+void xe_gt_declare_wedged(struct xe_gt *gt);
> int xe_gt_record_default_lrcs(struct xe_gt *gt);
>
> /**
>diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>index eb655cee19f7..de0fe9e65746 100644
>--- a/drivers/gpu/drm/xe/xe_guc.c
>+++ b/drivers/gpu/drm/xe/xe_guc.c
>@@ -1178,3 +1178,19 @@ void xe_guc_print_info(struct xe_guc *guc, struct drm_printer *p)
> 	xe_guc_ct_print(&guc->ct, p, false);
> 	xe_guc_submit_print(guc, p);
> }
>+
>+/**
>+ * xe_guc_declare_wedged() - Declare GuC wedged
>+ * @guc: the GuC object
>+ *
>+ * Wedge the GuC which stops all submission, saves desired debug state, and
>+ * cleans up anything which could timeout.
>+ */
>+void xe_guc_declare_wedged(struct xe_guc *guc)
>+{
>+	xe_gt_assert(guc_to_gt(guc), guc_to_xe(guc)->wedged.mode);
>+
>+	xe_guc_reset_prepare(guc);
>+	xe_guc_ct_stop(&guc->ct);
>+	xe_guc_submit_wedge(guc);
>+}
>diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
>index af59c9545753..e0bbf98f849d 100644
>--- a/drivers/gpu/drm/xe/xe_guc.h
>+++ b/drivers/gpu/drm/xe/xe_guc.h
>@@ -37,6 +37,7 @@ void xe_guc_reset_wait(struct xe_guc *guc);
> void xe_guc_stop_prepare(struct xe_guc *guc);
> void xe_guc_stop(struct xe_guc *guc);
> int xe_guc_start(struct xe_guc *guc);
>+void xe_guc_declare_wedged(struct xe_guc *guc);
>
> static inline u16 xe_engine_class_to_guc_class(enum xe_engine_class class)
> {
>diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>index 6392381e8e69..eef671db2f0b 100644
>--- a/drivers/gpu/drm/xe/xe_guc_submit.c
>+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>@@ -861,29 +861,27 @@ static void xe_guc_exec_queue_trigger_cleanup(struct xe_exec_queue *q)
> 		xe_sched_tdr_queue_imm(&q->guc->sched);
> }
>
>-static bool guc_submit_hint_wedged(struct xe_guc *guc)
>+/**
>+ * xe_guc_submit_wedge() - Wedge GuC submission
>+ * @guc: the GuC object
>+ *
>+ * Save exec queue's registered with GuC state by taking a ref to each queue.
>+ * Register a DRMM handler to drop refs upon driver unload.
>+ */
>+void xe_guc_submit_wedge(struct xe_guc *guc)
> {
> 	struct xe_device *xe = guc_to_xe(guc);
> 	struct xe_exec_queue *q;
> 	unsigned long index;
> 	int err;
>
>-	if (xe->wedged.mode != 2)
>-		return false;
>-
>-	if (xe_device_wedged(xe))
>-		return true;
>-
>-	xe_device_declare_wedged(xe);
>-
>-	xe_guc_submit_reset_prepare(guc);
>-	xe_guc_ct_stop(&guc->ct);
>+	xe_gt_assert(guc_to_gt(guc), guc_to_xe(guc)->wedged.mode);
>
> 	err = drmm_add_action_or_reset(&guc_to_xe(guc)->drm,
> 				       guc_submit_wedged_fini, guc);
> 	if (err) {
> 		drm_err(&xe->drm, "Failed to register xe_guc_submit clean-up on wedged.mode=2. Although device is wedged.\n");
>-		return true; /* Device is wedged anyway */
>+		return;
> 	}
>
> 	mutex_lock(&guc->submission_state.lock);
>@@ -891,6 +889,19 @@ static bool guc_submit_hint_wedged(struct xe_guc *guc)
> 		if (xe_exec_queue_get_unless_zero(q))
> 			set_exec_queue_wedged(q);
> 	mutex_unlock(&guc->submission_state.lock);
>+}
>+

can we have a comment above this function on the layering flow?
Something related to this being the "bottom entrypoint", then delegating
to xe_device_declare_wedged() to wedge all the layers from top to
bottom?

>+static bool guc_submit_hint_wedged(struct xe_guc *guc)
>+{
>+	struct xe_device *xe = guc_to_xe(guc);
>+
>+	if (xe->wedged.mode != 2)
>+		return false;
>+
>+	if (xe_device_wedged(xe))
>+		return true;
>+
>+	xe_device_declare_wedged(xe);
>
> 	return true;
> }
>@@ -1704,7 +1715,8 @@ int xe_guc_submit_reset_prepare(struct xe_guc *guc)
>
> void xe_guc_submit_reset_wait(struct xe_guc *guc)
> {
>-	wait_event(guc->ct.wq, !guc_read_stopped(guc));
>+	wait_event(guc->ct.wq, xe_device_wedged(guc_to_xe(guc)) ||
>+		   guc_read_stopped(guc));

another thing that could had been done in a separate patch.


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

but I'd like Rodrigo to also take a look before merging.

thanks
Lucas De Marchi

> }
>
> void xe_guc_submit_stop(struct xe_guc *guc)
>diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
>index 4ad5f4c1b084..bdf8c9f3d24a 100644
>--- a/drivers/gpu/drm/xe/xe_guc_submit.h
>+++ b/drivers/gpu/drm/xe/xe_guc_submit.h
>@@ -18,6 +18,7 @@ int xe_guc_submit_reset_prepare(struct xe_guc *guc);
> void xe_guc_submit_reset_wait(struct xe_guc *guc);
> void xe_guc_submit_stop(struct xe_guc *guc);
> int xe_guc_submit_start(struct xe_guc *guc);
>+void xe_guc_submit_wedge(struct xe_guc *guc);
>
> int xe_guc_sched_done_handler(struct xe_guc *guc, u32 *msg, u32 len);
> int xe_guc_deregister_done_handler(struct xe_guc *guc, u32 *msg, u32 len);
>diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
>index 0f240534fb72..0d073a9987c2 100644
>--- a/drivers/gpu/drm/xe/xe_uc.c
>+++ b/drivers/gpu/drm/xe/xe_uc.c
>@@ -300,3 +300,17 @@ void xe_uc_remove(struct xe_uc *uc)
> {
> 	xe_gsc_remove(&uc->gsc);
> }
>+
>+/**
>+ * xe_uc_declare_wedged() - Declare UC wedged
>+ * @uc: the UC object
>+ *
>+ * Wedge the UC which stops all submission, saves desired debug state, and
>+ * cleans up anything which could timeout.
>+ */
>+void xe_uc_declare_wedged(struct xe_uc *uc)
>+{
>+	xe_gt_assert(uc_to_gt(uc), uc_to_xe(uc)->wedged.mode);
>+
>+	xe_guc_declare_wedged(&uc->guc);
>+}
>diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
>index 11856f24e6f9..506517c11333 100644
>--- a/drivers/gpu/drm/xe/xe_uc.h
>+++ b/drivers/gpu/drm/xe/xe_uc.h
>@@ -21,5 +21,6 @@ int xe_uc_start(struct xe_uc *uc);
> int xe_uc_suspend(struct xe_uc *uc);
> int xe_uc_sanitize_reset(struct xe_uc *uc);
> void xe_uc_remove(struct xe_uc *uc);
>+void xe_uc_declare_wedged(struct xe_uc *uc);
>
> #endif
>-- 
>2.34.1
>
