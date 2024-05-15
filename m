Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C19AC04FFE
	for <intel-xe@archiver.kernel.org>; Wed, 15 May 2024 03:11:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58E0E10E04A;
	Wed, 15 May 2024 03:11:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iEmeIxWk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82F7110E04A
 for <intel-xe@lists.freedesktop.org>; Wed, 15 May 2024 03:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715742696; x=1747278696;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=gNi1GWSppSW4dfssd1oOZYTvVhggYXAmAChXaJ94UkA=;
 b=iEmeIxWkjPKNZgCJ+eXam6Xx3EKAD+5jKRGISTGnVbQfndTxbvgzeicl
 c22l004K+AUTWsWub8qPDWUF13O+IEUvKATakwUJ3w57KoE+K+EuY7ukF
 8j9XVEhZf5N1sdzblmc005Zp28ru2BQgzp0OMWN+n/ZL2wV/Anhm3ZdAk
 iOzF61Y6xMb7xjHZB+Noz+Nx5qKpdey4leCtL7WXHjCx7WU3aoZeydJ3P
 +QjU36X/IISMbJkQ5W6A9sfCUipqjQLBYGp7VQlg6aQ1ZYH+bsBxU1sRh
 iaUDk837ZyLrPAYM4aBnmDLKBkjJjUgqRoYtuMydv8Lro+eqaQQltUWAP A==;
X-CSE-ConnectionGUID: OfL3mSjJTouOnN3b2BZ/8Q==
X-CSE-MsgGUID: 6ZS+gHR1TEazyD7irZJo8A==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="14713272"
X-IronPort-AV: E=Sophos;i="6.08,160,1712646000"; d="scan'208";a="14713272"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 20:11:36 -0700
X-CSE-ConnectionGUID: CGCUGd8jRnCd8GdQq6p0PQ==
X-CSE-MsgGUID: o2klPSIUS9i6RuQODrDh9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,160,1712646000"; d="scan'208";a="68360609"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 May 2024 20:11:37 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 14 May 2024 20:11:35 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 14 May 2024 20:11:35 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 14 May 2024 20:11:35 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 14 May 2024 20:11:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DGp/2PaQistnqeX5iNh7jbHQ45v7cp4sSsPsITtDJzK8RF+xZPGhUQMMeEBuosExEBnOWpEtt9f9mRxLTb9AHmU/uQ3sFfwcHuyTc1/7O6VKLzSLY+KhhTfW18Rx2G/zr6kVw1Uhl19+aczQ+VqMemPN0kMiBDyqokC/6Rc1mndkW3vnmt1CBvxRwNtbkG9zbZA61HXfZFIl5Us6TmYtH8vSQeaiO5QZruDeHey+yJwQD3sBWymzpaIMY7Ai4+RYKRze4zKhHcbwYwE5Y8MPDXj4W6aiED3U9plUoRDWjDf/m4RXGrH/KJ2SrLX6/yYiVMo0q7MeOTwscGZZ85qb9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jHSZ94oSBRqLa1O3nHNtpZHnoe/SIrCYZcR0B11DVpU=;
 b=C4tFQxKmr7xBDePAcvpSgFPYqCJjCq+yB68yldvhoo9rBGM7/pFxaIEy03K0mUXOHHUXQ1ZDwOGWU2N76kMhaf5yDuuehtofiRJADdHp4qZ0BamSGIyBICk/AbUC5+v6rrFKwOWkDX/98fPeOYMO8qBPC+5N1ifv+N/qUM0JZVuFomd1fEh74Woru77gboxNrw0uYAeJ8UAu+FFigJpLVILz0KYEq1Gpvm2ho47L7fZWUzgqu83sZI3OQwHzDQz4wtZ6ysyOdfbsyaTwYit7QX5FzZAm/vkJ0aJaS9y7GFhKcZn32jV2Zw6iUsD3PmIpU07qI8vWt9GSGVx+E1BWyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM4PR11MB5293.namprd11.prod.outlook.com (2603:10b6:5:390::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.25; Wed, 15 May
 2024 03:11:28 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7544.052; Wed, 15 May 2024
 03:11:28 +0000
Date: Tue, 14 May 2024 23:11:16 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <vinay.belgaumkar@intel.com>
Subject: Re: [PATCH 2/2] RFC drm/xe: Enable Coarse Power Gating
Message-ID: <ZkQn1MQiOKRR5c36@intel.com>
References: <20240514064309.3819722-1-riana.tauro@intel.com>
 <20240514064309.3819722-3-riana.tauro@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240514064309.3819722-3-riana.tauro@intel.com>
X-ClientProxiedBy: SJ0PR03CA0276.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::11) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM4PR11MB5293:EE_
X-MS-Office365-Filtering-Correlation-Id: 758ce959-7ee6-4193-3573-08dc748cb609
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jQsdSOv+3pFexYdkE+spwQscoLMNRcv2lX68in759lxl8AiAlJJLRbeRBCIg?=
 =?us-ascii?Q?e4UaQOoUMZlO8F3OQV6K5zS4/RCsRpOQrWG4AT7muKwK48tD7Z6cLP9HB8Hd?=
 =?us-ascii?Q?AMt8hjTV86witZsArK36BzQH8OVf7qY9OcOMRD0W2gTLX6IiI6O3Gqp0IGR6?=
 =?us-ascii?Q?+ZdSNz2vb1vyr+8x8WxO3/FJXTTxv6EdURth6kHz8u4eK99A8Tf4eJGKrn2F?=
 =?us-ascii?Q?pc8gOwwsF7lXx6Rxp+dIilqNMj5N0K8bHHXSutrI6P6VRVcij4TIUPeS71yX?=
 =?us-ascii?Q?QviLbTS718gLlmvDMDIlu9D7aNS1QRsW7KtdiJXsOF6OnmC8Rg9BIMzSAanT?=
 =?us-ascii?Q?QwCr3KpId3ezDmDMuoy0aeg/4b1jjrmyzTVQU2Mcb2j79oH8/UwWuxDpC5GG?=
 =?us-ascii?Q?bnJSQllNsZsp8Yu5CPgArPbZ6f2puAViLeGgkVwYZw6RJoMIeLEv9SLjx1Xn?=
 =?us-ascii?Q?+PvLN4+dJJ78BLp3LjYiXZNNecPQkbrEUOZip/t6Su32JgphfWrm/b7RENjG?=
 =?us-ascii?Q?Z01qbpje9RTkS7Ry257F4snaOkp/A1Izgv3LT9L6Ajzamzo1fSe3gmNt9dsQ?=
 =?us-ascii?Q?lzTV3ihhU+T4n7tCC9RzOAzVI1CZQZA7mW8LyKS5W+/YOMpviuCvccyBnx8B?=
 =?us-ascii?Q?eK7r+erHQ2YfLJXeox5dBGSJuJDG6iRBCr+I5zZyJvWS29kSZLOfT9PJFyEN?=
 =?us-ascii?Q?0lUsf/Gzfn+7xPmh4QfMQe3SEPY7+7C1aoWIcuPa+yfykvc8ddekDvih4kib?=
 =?us-ascii?Q?GtI8xID91dBFjrahCfKY+z+SQG6BY1VmQ1EcvU4GXLG7rKBtLo5av7s1nA+j?=
 =?us-ascii?Q?yC12mPLr++ylu8XN4XqeDyQFRKsdEms0Ar6iCBnPwZaSis2Ch1PxTbq+li7n?=
 =?us-ascii?Q?d7XZv9ZOe1mmTufAVgm4WPVae/gf9tac1GqVSzLXAfLPmlOK8tJbJbnNk0z8?=
 =?us-ascii?Q?g/bM0s71KNHULo9CeLkW6VqXdy19nUatE1qflsYbDy4e7+WBN6l8XpwM+RLU?=
 =?us-ascii?Q?snlIfcA1K4lJQM4vbZtOtew+0gFgltU7GiK7N8PPK0V+PHYb7x+L1fwZEQuQ?=
 =?us-ascii?Q?KasjIWcnsg5PJKrVj7BhWO5HxjJg1gmFGwo9Ld1FMy9lmJHeV6K922BJX1IN?=
 =?us-ascii?Q?qaVAXQ6Xrb31ZTaJKAzG5foDpZdVMAnXIwDPqkAVS+5x0jtsNch10aD8rxne?=
 =?us-ascii?Q?EtfrUXDpbuDPoLkNsdgZb4ehTruV5DQW87SkJgiORaQwaByh7TyaGBpyt28j?=
 =?us-ascii?Q?C2KlbC+BUyU5zF9TgdWDmNGk07ssNv9U1jLsk6n4AA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?53rq8a0oOdYpd7mCK1+ae+BQVPhbzojCel6PAKqP5o/gOxX1lWG9y86Gqf0b?=
 =?us-ascii?Q?lNCQhyyqAQ9vjCKwkthOURSXMe6S/48fRrK+0ZRgS6hjIhtMt+TfMmNuFIE1?=
 =?us-ascii?Q?II/nMfEREUJZr4xTxcI7Q+BkWDDVKIbKzJVcJS5BBl9UF4HiY0HxVLcHw8AQ?=
 =?us-ascii?Q?n+y3tncVlbWm+WKTmjsXZH1RBKKfjArLgRjRRMXXTL7jJTZ6nP8CaANVOyYV?=
 =?us-ascii?Q?yCDO7gunjRvMGNeW7QBdriqmdmfW7fYVmhX+9kW8uowPhLtGj4KUUAnMSrpS?=
 =?us-ascii?Q?1JRm3kwuZ0yx0r02zkd1gu9KS5fzOnHmX0mqsMwB/dfqjas1eS55PdE0ZoSE?=
 =?us-ascii?Q?AVNX0jR8c8Rt1VFP1Obql8Xz7A/AR5YAP93joTD9PvzFkTNNoDihk8w5O67F?=
 =?us-ascii?Q?vuU4wnndAhAQ4T0KZ/ltYPZonJWd/8VTu3FHqGDMs0MHjHvwiUziLvOmAyH3?=
 =?us-ascii?Q?+fyIXjDPb0xGyV9uMojCOKpeeqOXLPsUVijou8PDgcuLNsQ6rCyfcepJ1Kf8?=
 =?us-ascii?Q?ud/TShxTTLSO8E4FnUy+I/O/OkCh91/bgXE8no7978uuGj75gombrL/2IRrb?=
 =?us-ascii?Q?6cca4AinUS/iZrUlCQrr6Gw+rf7oXgh6+t1rFQEH9EgCuiqiDFY6/XaElotz?=
 =?us-ascii?Q?/0aS9I77EYp/7jFU7zW/AAUX3LpGPilpDMtdZocXTvb0glmDzfdNpIGRFZsY?=
 =?us-ascii?Q?tWapyoI777r+F9+kO0nG+ifZppeXMSRwbfrQ89x4p+acz0UgRW3xbTn2MH5J?=
 =?us-ascii?Q?LabeSN8WScT8C3fZwLT92ewsxjLgxKXH/Rhg0/hhK52pQkhG9pL9ksRBVUlO?=
 =?us-ascii?Q?F80OJJ8nDbKYDZhiIwzr5dX++2c0TOxXn589oKEwciOVhsEsp6I3Gyja8MEt?=
 =?us-ascii?Q?5sAJRvetAOhCZ0M3wCxlqD68snNTRuFTlKtKRJOfTD01kN0UWWtS1k+ryXj/?=
 =?us-ascii?Q?iGoez0MSeRvo3bZRDp2g+S4IY+Y37ZBr2nKJfDxsnhBQwPIN76xjT0wn2cWy?=
 =?us-ascii?Q?dKw/aO41NV7V8J+XqMxMd+Al/C8k+kEjO6fEWv2ES/QkoWwBl01iUjO/oFS1?=
 =?us-ascii?Q?rP8s5Y/9ocKkh649KXB8BJeenhcXxGlXtQZc6ImVhOxMKc5hTxPQ4ukqO5dm?=
 =?us-ascii?Q?59qV3pr4dqrtJLU4fVbiEX0pwj8w8pgfQZHOaeIxaQFKZPSsPfbavttFrYTM?=
 =?us-ascii?Q?KhEDla7os3owalJ/GlC8Vj4E2v2+yrhm/4Frw9zuNmfZJvBmgoyXbA9nfDvM?=
 =?us-ascii?Q?kOJJTw9Rx2sSf/x7kfBxMNJad2AUeauaFLIAWrxNXZs6DNthIQjBFySWITwL?=
 =?us-ascii?Q?8QJWUZ5wz8dNouL0mU1ZiMp1Z/eNMRup8OQdXBuDECi1/wgwiVF+LknP8TsA?=
 =?us-ascii?Q?MKn09OXH9vnZWEkk5ORQE5fxmnhWSK4zKCnvAhVfNTLOzM3eKN/15WlaqHci?=
 =?us-ascii?Q?tQ5AEF/iN+3nnB/HehSyMUV5nV9BIYvc2IfFrgbq3TMLJV8gbyWVQSMl/aH/?=
 =?us-ascii?Q?A4op6ZqXNIdxbaQ5D/iH3EE0sRrw518q9jZFIWv5P7mYVKHuiJSqCGloUvqC?=
 =?us-ascii?Q?f1B70AKl1x8fgs5pGAGaPQE+BGgEutsS9spntfDI?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 758ce959-7ee6-4193-3573-08dc748cb609
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2024 03:11:28.1352 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y39djzSdaxKKQoZaKFC07emEpNOc9vDG3aArNEaCS4hU5Ok2fo16b7rnPxWwkkai54XcdXUKyGzLEtothtlf+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5293
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

On Tue, May 14, 2024 at 12:13:09PM +0530, Riana Tauro wrote:
> Coarse Power Gating (CPG), where Render and Media can enter C6
> independent of the remaining GT. Enable render and media
> power gating.

Something strange with this phrase...

> 
> Also enable VD HCP/MFX sub-pipe power gating.
> HCP/MFX power gating is disabled by default, turn it on for
> the vd units available

Could be simplified to something like:
"Enable every power gating that are disabled by default,
for every unit and sub-pipe available"
(or something like that).

> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h |  2 ++
>  drivers/gpu/drm/xe/xe_gt.c           | 10 +++++++
>  drivers/gpu/drm/xe/xe_gt_idle.c      | 45 ++++++++++++++++++++++++++--
>  drivers/gpu/drm/xe/xe_gt_idle.h      |  2 ++
>  4 files changed, 56 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 7c173db7d585..1cb0343ab581 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -317,6 +317,8 @@
>  #define FORCEWAKE_GT				XE_REG(0xa188)
>  
>  #define POWERGATE_ENABLE			XE_REG(0xa210)
> +#define   RENDER_POWERGATE_ENABLE		REG_BIT(0)
> +#define   MEDIA_POWERGATE_ENABLE		REG_BIT(1)
>  #define   VDN_HCP_POWERGATE_ENABLE(n)		REG_BIT(3 + 2 * (n))
>  #define   VDN_MFXVDENC_POWERGATE_ENABLE(n)	REG_BIT(4 + 2 * (n))
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 36c7b1631fa6..8a09630f5f38 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -567,6 +567,10 @@ int xe_gt_init(struct xe_gt *gt)
>  	if (err)
>  		return err;
>  
> +	err = xe_gt_idle_enable_pg(gt);
> +	if (err)
> +		return err;
> +
>  	return drmm_add_action_or_reset(&gt_to_xe(gt)->drm, gt_fini, gt);
>  }
>  
> @@ -624,6 +628,10 @@ static int do_gt_restart(struct xe_gt *gt)
>  	if (err)
>  		return err;
>  
> +	err = xe_gt_idle_enable_pg(gt);
> +	if (err)
> +		return err;
> +
>  	for_each_hw_engine(hwe, gt, id) {
>  		xe_reg_sr_apply_mmio(&hwe->reg_sr, gt);
>  		xe_reg_sr_apply_whitelist(hwe);
> @@ -720,6 +728,8 @@ void xe_gt_suspend_prepare(struct xe_gt *gt)
>  {
>  	XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL));
>  
> +	xe_gt_idle_disable_pg(gt);
> +

they are not the symmetric equivalents... we should probably find
a more suitable symmetric place for that.

>  	xe_uc_stop_prepare(&gt->uc);
>  
>  	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
> index 4384f7e80258..f549bbb0e110 100644
> --- a/drivers/gpu/drm/xe/xe_gt_idle.c
> +++ b/drivers/gpu/drm/xe/xe_gt_idle.c
> @@ -12,6 +12,7 @@
>  #include "xe_gt_sysfs.h"
>  #include "xe_guc_pc.h"
>  #include "regs/xe_gt_regs.h"
> +#include "xe_macros.h"
>  #include "xe_mmio.h"
>  #include "xe_pm.h"
>  
> @@ -93,6 +94,42 @@ static u64 get_residency_ms(struct xe_gt_idle *gtidle, u64 cur_residency)
>  	return cur_residency;
>  }
>  
> +int xe_gt_idle_enable_pg(struct xe_gt *gt)
> +{
> +	int ret, i;
> +	u32 pg_enable;
> +
> +	xe_device_assert_mem_access(gt_to_xe(gt));
> +
> +	pg_enable = RENDER_POWERGATE_ENABLE | MEDIA_POWERGATE_ENABLE;
> +
> +	for (i = XE_HW_ENGINE_VCS0; i <= XE_HW_ENGINE_VCS7; i++) {
> +		if ((gt->info.engine_mask & BIT(i)))
> +			pg_enable |= (VDN_HCP_POWERGATE_ENABLE(i) |
> +				      VDN_MFXVDENC_POWERGATE_ENABLE(i));
> +	}
> +
> +	ret = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +	if (ret)
> +		return ret;
> +
> +	xe_mmio_write32(gt, POWERGATE_ENABLE, pg_enable);
> +
> +	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
> +
> +	return 0;
> +}
> +
> +void xe_gt_idle_disable_pg(struct xe_gt *gt)
> +{
> +	xe_device_assert_mem_access(gt_to_xe(gt));
> +	XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
> +
> +	xe_mmio_write32(gt, POWERGATE_ENABLE, 0);
> +
> +	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
> +}
> +
>  static ssize_t name_show(struct device *dev,
>  			 struct device_attribute *attr, char *buff)
>  {
> @@ -145,9 +182,12 @@ static const struct attribute *gt_idle_attrs[] = {
>  	NULL,
>  };
>  
> -static void gt_idle_sysfs_fini(struct drm_device *drm, void *arg)
> +static void gt_idle_fini(struct drm_device *drm, void *arg)
>  {
>  	struct kobject *kobj = arg;
> +	struct xe_gt *gt = kobj_to_gt(kobj->parent);
> +
> +	xe_gt_idle_disable_pg(gt);
>  
>  	sysfs_remove_files(kobj, gt_idle_attrs);
>  	kobject_put(kobj);
> @@ -182,7 +222,7 @@ int xe_gt_idle_sysfs_init(struct xe_gt_idle *gtidle)

we should perhaps also change the name of the init function
to ensure symmetry?

>  		return err;
>  	}
>  
> -	return drmm_add_action_or_reset(&xe->drm, gt_idle_sysfs_fini, kobj);
> +	return drmm_add_action_or_reset(&xe->drm, gt_idle_fini, kobj);
>  }
>  
>  void xe_gt_idle_enable_c6(struct xe_gt *gt)
> @@ -202,7 +242,6 @@ void xe_gt_idle_disable_c6(struct xe_gt *gt)
>  	xe_device_assert_mem_access(gt_to_xe(gt));
>  	xe_force_wake_assert_held(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>  
> -	xe_mmio_write32(gt, POWERGATE_ENABLE, 0);
>  	xe_mmio_write32(gt, RC_CONTROL, 0);
>  	xe_mmio_write32(gt, RC_STATE, 0);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.h b/drivers/gpu/drm/xe/xe_gt_idle.h
> index 75bd99659b1b..ba7aa36348fc 100644
> --- a/drivers/gpu/drm/xe/xe_gt_idle.h
> +++ b/drivers/gpu/drm/xe/xe_gt_idle.h
> @@ -13,5 +13,7 @@ struct xe_gt;
>  int xe_gt_idle_sysfs_init(struct xe_gt_idle *gtidle);
>  void xe_gt_idle_enable_c6(struct xe_gt *gt);
>  void xe_gt_idle_disable_c6(struct xe_gt *gt);
> +void xe_gt_idle_disable_pg(struct xe_gt *gt);
> +int  xe_gt_idle_enable_pg(struct xe_gt *gt);
>  
>  #endif /* _XE_GT_IDLE_H_ */
> -- 
> 2.40.0
> 
