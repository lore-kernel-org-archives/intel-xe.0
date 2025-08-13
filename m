Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C36AC87FCF
	for <intel-xe@archiver.kernel.org>; Wed, 13 Aug 2025 21:33:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AE0F10E06E;
	Wed, 13 Aug 2025 21:33:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jnu/DUJW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25F6610E06E
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Aug 2025 21:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755120812; x=1786656812;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=mGWp9wI7wUHtSFQQnTGiJikZADmlfL5n3VoEfuP8ioc=;
 b=jnu/DUJWQ8qdkitMIZqAGLDcb+vPwCRiqQ73l1WqApnfvwH3I8FhWOgP
 VZyauZfKtQPn7pO3Pl1Nefq5tc4W1ot3dS3FABucWuMEI9s24siia+Qpb
 u3WPQr2yMxdBceKMBihFjxeMhX9NuYw+q8rXOGdE4geuWe7T/gkl+2vLW
 nLdObwvV4yFuxRwnLUA74ATOKmfFycDfsV201ouPhgmjvETCVWDJC/Jxj
 UqtVmTJaOXkwi8T9mu/qLVddz0wAoV4NOWsovJjNd+EZadUsGgbatiAMV
 +/sGkvEAPqFJ1FtSxDlW2qruGO5tlaY5B1FH4LTHfaPTySqzigxZBf/At w==;
X-CSE-ConnectionGUID: wSsL0DRSSO+zjTI4lFu5AQ==
X-CSE-MsgGUID: qjjxlZNAQEy2C8e/0sXiqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="61234483"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="61234483"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 14:33:31 -0700
X-CSE-ConnectionGUID: y526Wag5SjG8xzmAV/FZUQ==
X-CSE-MsgGUID: V6l0Pz03Q0OJxLpO7uqjjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="166945179"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 14:33:31 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 13 Aug 2025 14:33:31 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 13 Aug 2025 14:33:31 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.80)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 13 Aug 2025 14:33:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pw/ICBwD+Q+GD4y2aM0g7GJBHSIme3P0t3M79gyzpry/od5tcPVKNSUmrF63q7lUmdYf6BEbpY58qiE7EdfuqrFYXkdjxcjgpqEYNrpTdg4GOdxhTiXzrvjNPsk6Zk+n8FzMRlBLp84A94ZppdbjhtSFOnNZz8++io4Kqh+9ARzyJuplY6l1wTw40O96CrWUjep4yrZ4i4Gl+/lvkWsY3yzSRavVj0OZad2KtBgdy8ySCrWnYGlLZbIna8u7/cCcV91suzzGGxwmjdEp2ODsI3fXSgzFOvpzqnik6XqatdAraAVTm3m0/KtXbu1GpW83BK8CvqYjwUdmgZp7+PdHkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qcH48LEIfnIdIvl+zMEccAgXDhIUOO9sga4DS5+MGI0=;
 b=mRayuTQ4kxafbsWvwJRXCYW5gYFTWcBXGLPT9lbXyjOtsre6qbdOkur3OOeJoMBlG8IxdbmRbnZS2u9o04kH3Cl7/pAdF0X41GeLOf52W9Idt9RKmLVyyT1rJJ/3CPsShnlGCGKHdyrHuzvgaNnxFWHwAEqhLAflHfjcE6LKxFIAcqG2hTxfS05j56meFlkY8gJl1gkb9NEZs8a57DFtJ/A/kVncZRWu2AE5J2Rua2wrHbeeU/+g4HvUrAuLTm5ig4egj/mIRtRVArjqO5yCn6lirZc9iqlCu2ToF4lXgCKpJ/DmUKL7QSAdKSfg/MTaJb4KA8jCr/Hm211uwQKUrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB5768.namprd11.prod.outlook.com (2603:10b6:510:131::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.15; Wed, 13 Aug
 2025 21:33:29 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9031.014; Wed, 13 Aug 2025
 21:33:29 +0000
Date: Wed, 13 Aug 2025 14:33:27 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Jani Nikula <jani.nikula@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Subject: Re: [PATCH 12/15] drm/xe: Rename ___xe_bo_create_locked()
Message-ID: <aJ0EpymEvuUVCORY@lstrano-desk.jf.intel.com>
References: <20250813105121.5945-1-thomas.hellstrom@linux.intel.com>
 <20250813105121.5945-13-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250813105121.5945-13-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: BY5PR20CA0031.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::44) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB5768:EE_
X-MS-Office365-Filtering-Correlation-Id: bd0f35a8-094a-480a-1e15-08dddab10b85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?kGcriXAZsGtCbm0+QLNbfmPTSv7Sns3o3xW3MlXv5zXv/3v+/izw0VN9tm?=
 =?iso-8859-1?Q?y5NKENdB0iIYMRmVfmzYfArSLmxyQjHI3e7ImreKkseOINNbNsnPQ1Pqs6?=
 =?iso-8859-1?Q?fdzgDjxMosOrEn+G++6D1+rLX1HPMdRJXU+dFfHgnikayK1GlZzWL9ER0R?=
 =?iso-8859-1?Q?6EDTF6hSuy+lxxs3PXXfd7DH3O7GMW8tsNxsoHvYBGfc6BkEGODS/kDUiM?=
 =?iso-8859-1?Q?g8DIrgX/6jglMd5Tl/4+pvd/IePF5vwGa6MmJ6dlOf+cEEa0ygcniNdmNH?=
 =?iso-8859-1?Q?d+JIEyQKvtzWgP+Sgiw3fjlLkV3DvqOL6p8TgiImseYYtfUyPpCJcCVFE6?=
 =?iso-8859-1?Q?7O2nnPlgBbuyN24/cgNt+cAXekTTEQXhyO3SfQypuAq4V8hAWasyuiR0Hg?=
 =?iso-8859-1?Q?fdN6gcDn6wMob425VMB8QvhcrGsV5xQbUz9qWejc0PxakQu14+C6p0GJ5+?=
 =?iso-8859-1?Q?PGuO3V+wP73kZhPFjNRNaRQaMpe/QjKu8uyZ1N0is9dYejxMqB8MgdUMo6?=
 =?iso-8859-1?Q?SqOpAUpU7SHpQSt9KyK0Ee+0NDl2/sMSFhNWFXMcCe1yb8W3BC/3FzyH2x?=
 =?iso-8859-1?Q?3+xRpa2B4M4ybPM2r5gkF1dYlT8p8d3kM06ukRhUsKUbzWmSkRAenMvpnF?=
 =?iso-8859-1?Q?RytSJsNTnwu5A/rThGxlctNJuRXgInWP0ZcxGWy8KQOzPRM6TrXI7zepm8?=
 =?iso-8859-1?Q?+QIk27PLjgtDNYmJcFnxQ3XvrRr9bTtKxtVgY7MN/O7WJuM1VyqcaJ19kZ?=
 =?iso-8859-1?Q?hRW9Mf2QbwKE+64wWB/7R5TCpPZuYFAQpNvpNpMMxyhFDlRYfSDQKavzgt?=
 =?iso-8859-1?Q?Y5fyIeueLwP2z5fLBGKNkB/380ebGBj8IgHoOZwQCzFQaEFnLrjzDMBvSF?=
 =?iso-8859-1?Q?paAflYZi/VaiZbISbd1wNU8rS0dqpUTswIVHb6THYo3eA3nGqTQGcFcUoX?=
 =?iso-8859-1?Q?l3E+kqn9FsmGuxGU3864ELrt5m3Jc4QhDDTHP3dw2+LGpVEffAVKYf+y6O?=
 =?iso-8859-1?Q?0aaMj2ulZYd0Q6BmKantGY+EjD40ba/zCsLNI5AwyUbR1XIvDJRXTTT9ez?=
 =?iso-8859-1?Q?S5/PLx0ObsFGUFpaClVMZGRH2tKFSz5CVETT21ZNqXD0iGdLvaHbiz7+hS?=
 =?iso-8859-1?Q?8qCg38NsjEQCMjQIvnnwZ8bwTTjc/7gP+agtWCmltyrKaa25dIU+RPV/ce?=
 =?iso-8859-1?Q?yE+J9P0DMGXlXv1gDr5skSsx+nx4+gu014lwG4Xol+ghaywZJ9YFmeXpsd?=
 =?iso-8859-1?Q?BLmgqmrhdI7eY7V3xIvTgILZZ1m9wZdkV0aiW1ApAadcxSr+7+ZZmBOQKc?=
 =?iso-8859-1?Q?O4wDELin7fg1r1yAqZnitiwCqsN/r+NWBjPqTGOi0lLf0SadinYUXpncdb?=
 =?iso-8859-1?Q?RgzGWyUPm7Qik5Rhy+KfX38N8Di/MxhKx1NLBwNQn7cb93ckK3ni7nF76a?=
 =?iso-8859-1?Q?rbYP8YUF4kENNrJzp3NuK/HnvaCDlWMKbwVInuuPykbHaKgnFb+pc1dytk?=
 =?iso-8859-1?Q?c=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?GPAPtUCxu4erjSXDDNbwQZyXQkFq6EOoN4lr/KWS8/I/FQqOqEB10ayF+d?=
 =?iso-8859-1?Q?x7DSgmZGSALDtss0153FYDk2tVl8cfvsxs64cLT81Zyx95OCYS1+9WM4RH?=
 =?iso-8859-1?Q?FLxOQ/mpXKgGDVlpdou2o1ZS33XOsmBVoTOiuHG4UuXwFkZ0hyfxCYD2Dp?=
 =?iso-8859-1?Q?XjF7Rv0RaxxOP6O/8U7d/HWRXKA6/q4ubsQ9MpUAs1PJ4528hx0zF2u4Cd?=
 =?iso-8859-1?Q?zj4khrPOFWiBRV4wStMFVYO321SzvzqRE7Sa8Gy9GLApgcPTOltdtC2HeW?=
 =?iso-8859-1?Q?JhnujBRTR1jsVMg74Ljv1eQwz8X2Yc7Wh6uADZcJthR9MmP5U/l6at55/7?=
 =?iso-8859-1?Q?pZ6Gb1zkMrPs7D65g+LGYUpeq/QcdtGoS+Lh3dzXpl4kyVlfh4JPLqibTj?=
 =?iso-8859-1?Q?knfYqoO5rANsPkgLwQHTySDSnZZxVg6t3QHOYOthFquzjooS+t+xekKSlx?=
 =?iso-8859-1?Q?dFtaMcb+DtK+j+TGu6RGms6l259u+Ry65A2SwDeNRAe5mbvEQEmpA/nHv9?=
 =?iso-8859-1?Q?G1le8QhYHZ0kiiWAg4QWv3Q5I5dwfGfG7cDVWkFUTZCNcuaqKqblLHH2Po?=
 =?iso-8859-1?Q?ahzB1SuWoe/mrhshxkJjJMfgcN7ZvP3p3rhe19wwtMPCX0W3BLUXpDA7kA?=
 =?iso-8859-1?Q?KuOHL32gh9Gd+7/Ipk07lbQgm67hm8YdU0Sp1WZ8YuEkhUi47p3FkrYERa?=
 =?iso-8859-1?Q?3c9Kxo1Q3mRYsCCDAlHvuDFLBmVM++Z3RaX2Y46lbI2NPQ1Yuyi+1At+7N?=
 =?iso-8859-1?Q?3raT9qiW5mGvH2PgY3cmW4wCkMg/4UOgi2/hxw85CaGYYpn/rnnBc+ePH5?=
 =?iso-8859-1?Q?e5MRWHXbl4pFaXxw3zxSuvN4vrF6F0b/uVrCo3ft4QY6dbs6zG4MEDUcQk?=
 =?iso-8859-1?Q?+/yDFA7EqYbqLCIgI+4W+RgDlE2SyLWZqUKUYrPGbovxZIuunnxI+bRlxt?=
 =?iso-8859-1?Q?QVD4HnU4eEuU1A4DDh/tQOpdP8OW/FBpxeJUEYQPoBL58jRe15FExTIw4D?=
 =?iso-8859-1?Q?i08TuX0Wa9EFDmwuqnhj11oUgt56towafMI9bAGBo2d5F8bwe0o3q2lRUo?=
 =?iso-8859-1?Q?uUbZtfjTFSq+kT3vEKMAbeaYJr1xbSrN4ffbZ+KmeRtA25F8kVKPddCn4V?=
 =?iso-8859-1?Q?dDJTd9gqkBj63T3Xbuqh54xg+2KfyVdx34hqAfbnHRgakE4PT5lobBEvuq?=
 =?iso-8859-1?Q?7jYivJ80l0980wTBj7Rv9PfPb7gZ50oDADJiYDl8tIGna98V4M3SofMUF8?=
 =?iso-8859-1?Q?s3mZMfmLy82gDFBJLvKbpYm+z6pV9pIWQ9PDbUdO3pwRB3jQrpcN31H9w7?=
 =?iso-8859-1?Q?xutfx2rZDkxZzioBZ6lAyHhEZHJF0if974itvUTOx9T21qUy6izMnThnA5?=
 =?iso-8859-1?Q?j0UX7NJjV/7cdwUAxPkqL8EBl35qxhETsFQ+8TR46ukkj5Oxz3Ut4uZ8ho?=
 =?iso-8859-1?Q?YsfqzK7jnLtPZI31y7ahBo1CaG/zPinNp66p9ZFIYocNj9P0bH6efn0o/7?=
 =?iso-8859-1?Q?JeX1B/j6Lj9CTG5OUM7V1UUjevyqC1AJbecW9J1wwM6xbpf6FpX62x4b/0?=
 =?iso-8859-1?Q?MEOhHu3SyJrZAdRh0DTVJL69Wwe//4gsSNG1Y3os+6VXrMjBG6670Oa/Kc?=
 =?iso-8859-1?Q?7EZBDdzwNsm+CC9cz79/OrHxzU9rOxXEnizbGyrc+jmPcyY/fBP3sYTw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bd0f35a8-094a-480a-1e15-08dddab10b85
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2025 21:33:29.5485 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aO/tUi/LL46ZlvIP/VvFOzPw/wxubV/xO0xTQeHHx3Xl1SPCOG0vsmZlK8u1o1oxXoi0kliPMdlWhi4g7GrdnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5768
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

On Wed, Aug 13, 2025 at 12:51:18PM +0200, Thomas Hellström wrote:
> Don't start external function names with underscores.
> Rename to xe_bo_init_locked().
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_bo.c      | 39 ++++++++++++++++-----------------
>  drivers/gpu/drm/xe/xe_bo.h      | 10 ++++-----
>  drivers/gpu/drm/xe/xe_dma_buf.c |  6 ++---
>  3 files changed, 27 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index dd1e0e9957e0..23b28eeef59f 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1161,10 +1161,10 @@ int xe_bo_notifier_prepare_pinned(struct xe_bo *bo)
>  	if (bo->flags & XE_BO_FLAG_PINNED_NORESTORE)
>  		goto out_unlock_bo;
>  
> -	backup = ___xe_bo_create_locked(xe, NULL, NULL, bo->ttm.base.resv, NULL, xe_bo_size(bo),
> -					DRM_XE_GEM_CPU_CACHING_WB, ttm_bo_type_kernel,
> -					XE_BO_FLAG_SYSTEM | XE_BO_FLAG_NEEDS_CPU_ACCESS |
> -					XE_BO_FLAG_PINNED, exec);
> +	backup = xe_bo_init_locked(xe, NULL, NULL, bo->ttm.base.resv, NULL, xe_bo_size(bo),
> +				   DRM_XE_GEM_CPU_CACHING_WB, ttm_bo_type_kernel,
> +				   XE_BO_FLAG_SYSTEM | XE_BO_FLAG_NEEDS_CPU_ACCESS |
> +				   XE_BO_FLAG_PINNED, exec);
>  	if (IS_ERR(backup)) {
>  		ret = PTR_ERR(backup);
>  		goto out_unlock_bo;
> @@ -1240,11 +1240,10 @@ int xe_bo_evict_pinned(struct xe_bo *bo)
>  		goto out_unlock_bo;
>  
>  	if (!backup) {
> -		backup = ___xe_bo_create_locked(xe, NULL, NULL, bo->ttm.base.resv,
> -						NULL, xe_bo_size(bo),
> -						DRM_XE_GEM_CPU_CACHING_WB, ttm_bo_type_kernel,
> -						XE_BO_FLAG_SYSTEM | XE_BO_FLAG_NEEDS_CPU_ACCESS |
> -						XE_BO_FLAG_PINNED, exec);
> +		backup = xe_bo_init_locked(xe, NULL, NULL, bo->ttm.base.resv, NULL, xe_bo_size(bo),
> +					   DRM_XE_GEM_CPU_CACHING_WB, ttm_bo_type_kernel,
> +					   XE_BO_FLAG_SYSTEM | XE_BO_FLAG_NEEDS_CPU_ACCESS |
> +					   XE_BO_FLAG_PINNED, exec);
>  		if (IS_ERR(backup)) {
>  			ret = PTR_ERR(backup);
>  			goto out_unlock_bo;
> @@ -1861,7 +1860,7 @@ void xe_bo_free(struct xe_bo *bo)
>  }
>  
>  /**
> - * ___xe_bo_create_locked() - Initialize or create an xe_bo.
> + * xe_bo_init_locked() - Initialize or create an xe_bo.
>   * @xe: The xe device.
>   * @bo: An already allocated buffer object or NULL
>   * if the function should allocate a new one.
> @@ -1881,11 +1880,11 @@ void xe_bo_free(struct xe_bo *bo)
>   *
>   * Return: The buffer object on success. Negative error pointer on failure.
>   */
> -struct xe_bo *___xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
> -				     struct xe_tile *tile, struct dma_resv *resv,
> -				     struct ttm_lru_bulk_move *bulk, size_t size,
> -				     u16 cpu_caching, enum ttm_bo_type type,
> -				     u32 flags, struct drm_exec *exec)
> +struct xe_bo *xe_bo_init_locked(struct xe_device *xe, struct xe_bo *bo,
> +				struct xe_tile *tile, struct dma_resv *resv,
> +				struct ttm_lru_bulk_move *bulk, size_t size,
> +				u16 cpu_caching, enum ttm_bo_type type,
> +				u32 flags, struct drm_exec *exec)
>  {
>  	struct ttm_operation_ctx ctx = {
>  		.interruptible = true,
> @@ -2077,11 +2076,11 @@ __xe_bo_create_locked(struct xe_device *xe,
>  		}
>  	}
>  
> -	bo = ___xe_bo_create_locked(xe, bo, tile, vm ? xe_vm_resv(vm) : NULL,
> -				    vm && !xe_vm_in_fault_mode(vm) &&
> -				    flags & XE_BO_FLAG_USER ?
> -				    &vm->lru_bulk_move : NULL, size,
> -				    cpu_caching, type, flags, exec);
> +	bo = xe_bo_init_locked(xe, bo, tile, vm ? xe_vm_resv(vm) : NULL,
> +			       vm && !xe_vm_in_fault_mode(vm) &&
> +			       flags & XE_BO_FLAG_USER ?
> +			       &vm->lru_bulk_move : NULL, size,
> +			       cpu_caching, type, flags, exec);
>  	if (IS_ERR(bo))
>  		return bo;
>  
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index c6bb90ca5c2e..a625806deeb6 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -89,11 +89,11 @@ struct sg_table;
>  struct xe_bo *xe_bo_alloc(void);
>  void xe_bo_free(struct xe_bo *bo);
>  
> -struct xe_bo *___xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
> -				     struct xe_tile *tile, struct dma_resv *resv,
> -				     struct ttm_lru_bulk_move *bulk, size_t size,
> -				     u16 cpu_caching, enum ttm_bo_type type,
> -				     u32 flags, struct drm_exec *exec);
> +struct xe_bo *xe_bo_init_locked(struct xe_device *xe, struct xe_bo *bo,
> +				struct xe_tile *tile, struct dma_resv *resv,
> +				struct ttm_lru_bulk_move *bulk, size_t size,
> +				u16 cpu_caching, enum ttm_bo_type type,
> +				u32 flags, struct drm_exec *exec);
>  struct xe_bo *
>  xe_bo_create_locked_range(struct xe_device *xe,
>  			  struct xe_tile *tile, struct xe_vm *vm,
> diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
> index 56df1d84df21..ca6e397828ad 100644
> --- a/drivers/gpu/drm/xe/xe_dma_buf.c
> +++ b/drivers/gpu/drm/xe/xe_dma_buf.c
> @@ -239,9 +239,9 @@ xe_dma_buf_init_obj(struct drm_device *dev, struct xe_bo *storage,
>  		if (ret)
>  			goto error;
>  
> -		bo = ___xe_bo_create_locked(xe, storage, NULL, resv, NULL, dma_buf->size,
> -					    0, /* Will require 1way or 2way for vm_bind */
> -					    ttm_bo_type_sg, XE_BO_FLAG_SYSTEM, &exec);
> +		bo = xe_bo_init_locked(xe, storage, NULL, resv, NULL, dma_buf->size,
> +				       0, /* Will require 1way or 2way for vm_bind */
> +				       ttm_bo_type_sg, XE_BO_FLAG_SYSTEM, &exec);
>  		drm_exec_retry_on_contention(&exec);
>  		if (IS_ERR(bo)) {
>  			ret = PTR_ERR(bo);
> -- 
> 2.50.1
> 
