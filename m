Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01133E9A02C
	for <intel-xe@archiver.kernel.org>; Wed, 18 Feb 2026 22:32:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF6C910E63E;
	Wed, 18 Feb 2026 22:32:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OudkehF9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84EC310E63E
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Feb 2026 22:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771453926; x=1802989926;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=BYGFV7JkUJc01yBcuHG77+j5XWv9nqk7tZq3H2yTeiQ=;
 b=OudkehF9NXAsqLd/MKBYr664Z+kjyITTygugrd6mvMqnKC+5vc9IXgGc
 drbLIfeZuoMZGfcRmCHeXpd/hCBFVhn2yq2pGYLMQ+NqEwq7vmXGBJnuC
 S9Yf3olFZHsbYlWbEnq5mOgWSVjglB4yuy3+BAK3csa0ybchsuAzpc5Vr
 LQTgWmkImDokP6Mwaq+BfiWd3+x4cFW/FugPf/7RXdK2Z6CMKGoXmcvrO
 ISTQ6ruqBGTfT1BkN0uV+IUI7QA02IztniBkFpUzOF9O/5bu865ADE9wM
 fzh5sDxiH30oswhC+xsGGaPe4w9ar+mRFTlYUQEIh6LyVcl2z4EjVHcqu g==;
X-CSE-ConnectionGUID: Bwe3RplhS7enN0T4U8rsow==
X-CSE-MsgGUID: IJaeEbduQ8y7SMyJ6RdTPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="60117004"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="60117004"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 14:32:06 -0800
X-CSE-ConnectionGUID: qxH1qBcSS9OhWR929ywQhQ==
X-CSE-MsgGUID: W2mxR2/4RRSx/wVdRc/nBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="213484625"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 14:32:06 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 18 Feb 2026 14:32:05 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 18 Feb 2026 14:32:05 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.22) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 18 Feb 2026 14:32:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gtsd+oa91aN8yQvtQLIeAJuvvbsPT5vFrYCnrR/ZBGKszwe1xTW2jwgdXOQNPoENpfizvoKFf1Iy82ZDfOSP2b5DMA4dZoVwyroOSZ9JnKnUatCFFxJsT4rCjivcYrfeIgqEn17yM+4ejG4slGj5JmF0QOP9/A8kRbYzxy6rwTI/hCMmzS1C5JFmZeJ3ucDF+VhV6AJ8M7Rv4eh0JnaPrLGLwwxDQxRHtzhrp3ZwN9+4XPik5kZO07xpaPsTqJ3akCkm5yxLEKlnIF1NJ4xh/NOum1PRHDpyTFCv8HWic87WUAvblJMVSpmPk1WQBQgx+1OlUM4IgniyPkHZaZtiqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9xEzgj2XlzY4f4yOxjQLJw4zavSvqm673Lm6lDPG/Gk=;
 b=Z4wQc7J928X43iQbzI7NP9dFuNqrOIzKuRLr0ZMBglrTt9bgFr77zh6rbgNGW9Z6QhySkK70bGmPYahb3JJtI1rfb1hIdiQHf6xUpUEkD+9Hu4OiRvU1u3DtrrFvxyDIFOoe5SH48AO3TU4jTJ7HBJQdOZgdwSh9XVLvVcQOcxbG4qXSGeOuZ8jGar2+A16Md+kwPMbtKz4VrlkRrBiK5ZQ7m7C3k0JvuABtEF9ZUbKAvS+KuJouYh0ShkSiHcOU4SdGtuQmN+goBMpRGtyka4bHDY2f91kLWadD9GVTfU4ExdU3HZDdGIDWsGCRQ7rj53lEWAr9dzVOYNol5Manww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by LV8PR11MB8606.namprd11.prod.outlook.com (2603:10b6:408:1f7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Wed, 18 Feb
 2026 22:32:03 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 22:32:03 +0000
Date: Wed, 18 Feb 2026 14:32:00 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Harish Chegondi <harish.chegondi@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/xe: Do not process GT WAs and tunings for SRIOV VF
Message-ID: <20260218223200.GY4694@mdroper-desk1.amr.corp.intel.com>
References: <e883c0cd98609066e7f7904128163a02105daf33.1770852521.git.harish.chegondi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <e883c0cd98609066e7f7904128163a02105daf33.1770852521.git.harish.chegondi@intel.com>
X-ClientProxiedBy: BYAPR05CA0060.namprd05.prod.outlook.com
 (2603:10b6:a03:74::37) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|LV8PR11MB8606:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b8aab71-7cbc-4610-10a4-08de6f3d89bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?P7bwFjq8fRg533iyXh7oNyZH+78cfnHyqnJjuupKXDjao7Rk0+Ons8qK97Z7?=
 =?us-ascii?Q?n7rVSJ/jCG42m9iYHdarXV6Dye1UELncBiJ7pCH2PfiiEVk+ufTIyYLXd4qa?=
 =?us-ascii?Q?Yze5QWH1Ru7GflmnwsZmXElV8+mWqSVkJzRYcuvoXp6UB84hxtOdhjvylNVw?=
 =?us-ascii?Q?JxLu/YnDg3NdsOolEFoc6TOdZrNHK5nE1FXO9DVACWW6C9sQm/iLd8nkqqZ4?=
 =?us-ascii?Q?04TVnShgjvnKnvG7LtKvZHBQJ/D1vrqXUK9xbdsmPG9KLZHS9YeJmt6HysO9?=
 =?us-ascii?Q?f1Np86zui0Z6gkzA2qA1+QtbK9wGyi9oGcYYmMEzopRnhCIjSusg6A3QPL6+?=
 =?us-ascii?Q?by24RLGzNdLCUKNliRc2iVsvvNplIs3dndw/uakYpXXxlGDhtwws2TAssbyc?=
 =?us-ascii?Q?pArV6ecAwz+vulfIRgbQ6e7sgzEXR4xHN8PJ7T1cKPq5gZXN5qfthXAxiOJ7?=
 =?us-ascii?Q?MhL0M3hqMhk9KULeGkc1b1L2ixd6xg523v6/Tp38q4XUGvQusqRKW/kIdNUv?=
 =?us-ascii?Q?iwiweY+9AOlMQY+p+83sHuQplZvI/u2wY2dcirs4pmUnQ3aEFgetv6pAAa/5?=
 =?us-ascii?Q?DNdnSF9A21u4knwqTYsSZla31FQgIY0eKtea3comapKYL+ZnwR+L26OzCULf?=
 =?us-ascii?Q?dzzj6+I3q05wfw1Ot6DD7UzmY6W63OFKGdz9r273NCVeqy/Yke90kPnelO1F?=
 =?us-ascii?Q?G3SGNvXlbJED4O2a6K7MeICFngRZaBjUC5Wg8UMV8NkXH8UbM/VJLFSWn008?=
 =?us-ascii?Q?LMbRjRdjkAEw0XojXlH4+ojwCWPdG7rxpM9rVINf2/N5e8dz1Fd+Xz3Qty9r?=
 =?us-ascii?Q?Aowxf4kF4Escj2AVRva7UrioVU06Sg4FOPvvQw+CAG3z3KwLp6fBI+T0i3Pu?=
 =?us-ascii?Q?NIHnYVdd/mso7jJj8U+eJa6GJp/WQ1adDIFIcEKgmoMxmTYVWk8z7A20Ngz/?=
 =?us-ascii?Q?e7viCw4Lol6M5mnqIKmBNyP/bqI0yz3/xGa3g0cJo/+gqCzh0N83aYOixP/M?=
 =?us-ascii?Q?bu7bjUzikuDf0PwZVAeI/r+6BLzabvjAu4ahRNoex4ARH9nCYW5bPwgN0F9q?=
 =?us-ascii?Q?P8iRPw/usC2ATkFlxJ84xtOb2cGLu2Jx5xBbIDbRe15QmcatxHfgZjEpk5Fn?=
 =?us-ascii?Q?EJixIDXO8fetViDbl9R8wCUoV+iTTiJH4HL6c6rAkULrYN1zsSO169oM1K1j?=
 =?us-ascii?Q?9VVh+lkqxYPNHMkKEpZfuP3ydx2le4YGDNaf4qJCGc/W4Ln+Dt28ZbuWmgoL?=
 =?us-ascii?Q?SUhQ0LQTjqcUFYSM0RewV6E+Eey7SlyWasj0nZvpjZrid4i88lipL3yb5DFo?=
 =?us-ascii?Q?fqThF6uONlPaMe0t0WI1NpsjQ435tm9XeVHGKjJD5wHlT/KtkfaQmlXGD0Di?=
 =?us-ascii?Q?dJ8irRo+/v2wMXTXuyjGj5ZMkCDBWOudK3eGVsV+gWCH3bzCRiH+JRvm5oie?=
 =?us-ascii?Q?8XwQFlz9QRPlTDsaM7g7T8gyIJPMgVsSlATF6neZyBQHr9NkgF7rMjGarGtV?=
 =?us-ascii?Q?ILAWbGM2EGpkEgd+mnj2d5Syan8h1/Rs6sLyO2oRA/vNds6BHqTcgacRClmj?=
 =?us-ascii?Q?d66Ox24fFOFMPF/zQK8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2YCPc2NLw4Gu7qsRdJYzURa28v94/3AzjdSaF9VBb+uhuXLhGGbNkmLvrTKi?=
 =?us-ascii?Q?zEXIFZrVBcHoj84isQCF7QLQKTdj7Np0uEeuxXl3CGVEkslWqfLZlLWFokCp?=
 =?us-ascii?Q?DPzdzmgJ66K9QPAbGhBGEGW7C7K4z/qjqUSGT7DBCieSKWS7NAB074hnk7Up?=
 =?us-ascii?Q?ZMTGW3+hJvrfueW/QRHHboHsJJdQK2ZpbuoLIIRgQ5/sEyDqX1ad8PiA9W8D?=
 =?us-ascii?Q?T0DJlEIFOAC6lw6nGWx0nhxEPijiD7DLUBDQ4Zkd5+YEVizGMrpA/FKHF+Vk?=
 =?us-ascii?Q?JFLmYgdj5N3N/ULtYSUZrGeJa+SXgX8+zBQ6+m+a1lnUqiz9kC/P4eE8NI83?=
 =?us-ascii?Q?a1TV91rJuypw1+czeQIIanaG2iGgl2SYLeEucwzwCqCNEugFiMRY1m5dO6gE?=
 =?us-ascii?Q?eg+ZZU7NfbFey/o9tub3xxWDb/yE7qizAyUHy7AqMrYrys+iPUrw+dK+PPSD?=
 =?us-ascii?Q?h+G7WWUNfIhOtRnOdwbEJcF5CtD6LY6GpJRJ2UQGH/y9hEZpzXvzAhQ0T9PV?=
 =?us-ascii?Q?h7tUqxLugx0YejQQdkCD6Rn7olyckAmdgksQ0wB08GFyRV4BPxYzBz9AUKLs?=
 =?us-ascii?Q?G3WREtbdqFOf8CZ3LjiZP2uJOfHpB+0ts1YPI1bfio8IBfgEnu8QZJ5zCKi9?=
 =?us-ascii?Q?cBVu5jWyEUyz9gJNssIb4iJtbJNhNSil/Tmowvb4iF1tgwTE8UGgj6yeg5p4?=
 =?us-ascii?Q?zXmShrLn5xdodWUM25VVuqTaxM1P+6ElcCjnqaCikZwoKNE1dO+V6VzaGo+d?=
 =?us-ascii?Q?Kl9tXlhlICHLzMxb6g/tnpNAcEAEXx8XS97HLjuZIWtFSCw7Bbqe8aEbNEfF?=
 =?us-ascii?Q?yV4uRj8HnmKV1tYkhV8URyTIQzMsUekeRukS85mrrhc4EHcgDz5+Qv45zRsp?=
 =?us-ascii?Q?kqucIEaHfs2vtnA5JPdSZo/3R6Ber57Woo+6hqXpDactrajw88x+y3H+2/EF?=
 =?us-ascii?Q?OcsC6UC2qQbG4N7unB/Neu9clfTMk9wKtdYKqGUaGZ5hChfQHlg+hjc2GHLC?=
 =?us-ascii?Q?GLFyp1TZ6KXOm4YS8LzsbO65yiPPz6wZFTzINhFEoCNIhZ/AYRRAZsK12km3?=
 =?us-ascii?Q?qf+a7BuG+vcZotUq/rh+1k4MH2ZFi/zJuzALE9GGUQ8WUBI3TQMpbNiK1rxh?=
 =?us-ascii?Q?pJHVtnADv2OeO9lDziMjqbxYivkLEarj1I9iLqMH8G10P61Vk2DJDGjFiKXX?=
 =?us-ascii?Q?Qq9m8V0DtnKcnOutoX1qLbVWrUBhXvh5tKtZYKrblLnjaBsd5QHxVmixAi+n?=
 =?us-ascii?Q?RdcvSpX+Ui2K3zTJVjrOWpfH1+sJbSkxLyME1CeVj1FzsFGiH+PC0kG618XN?=
 =?us-ascii?Q?FZ5ZForoQMxPPbqJpQBbb5X5uH9g3nFBQ7GXPv+P1X2LfVP5PUsOhastBcds?=
 =?us-ascii?Q?+wrI8oeHvoHDgPkobEvjtU+TUv6gxnbwKCDGS1ErrF0aJWEiBEGEgbSGHavb?=
 =?us-ascii?Q?79JWXVx90juVvrFMny1MlDTqv7xBbI5lUI4rYNQKb21HmtcBSXronudUdNyD?=
 =?us-ascii?Q?erNHc2HsWP9wAt/4sEpjyB6/u7CE4Fx13JNY9W2yDCiY0E7ZLLuLVrMlUp53?=
 =?us-ascii?Q?/uSIr/07VmF+0/+HxEiFEFvabTURJf6GfVQGrEMqVodM+Dr15lNaclF5RO/o?=
 =?us-ascii?Q?ocFJLDwxMhjAjv8n9P7+tCIohEcwoxz8y8ZL71Vh+udBiHo1nXxB044HQ2BB?=
 =?us-ascii?Q?IlziHipOQc9UvUoG5skOl0ZQanqtQ132AcwrKTEevwIn1Bwl4+keNZ+xHcz/?=
 =?us-ascii?Q?OzEJcu5WhLdXqf05QKIzcsVSpjqXc8Y=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b8aab71-7cbc-4610-10a4-08de6f3d89bd
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 22:32:03.2474 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s+rfagcUIIKb1IsYw5G2oUpl3qUCWpSgq0mvU0yDw+xsfIPGCpaRu3fLXtjF2Joa/ZmpntgJS6hdmtzf31pCVA9my/kHweQTZfs04oXaU0w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8606
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

On Wed, Feb 11, 2026 at 03:33:03PM -0800, Harish Chegondi wrote:
> GT workarounds and tunings are not applied for SRIOV VF, so do not
> process them.

I've got a patch that does something similar here:

https://lore.kernel.org/all/20260218-sr_verify-v4-1-35d6deeb3421@intel.com/

In addition to the workaround and tuning lists, that also ensures that
the general engine programming RTP and the whitelist are also skipped in
for VF devices.


Matt

> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 68c4771de040..2c646448f7b0 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -540,8 +540,10 @@ static int gt_init_with_all_forcewake(struct xe_gt *gt)
>  		return -ETIMEDOUT;
>  
>  	xe_gt_mcr_set_implicit_defaults(gt);
> -	xe_wa_process_gt(gt);
> -	xe_tuning_process_gt(gt);
> +	if (!IS_SRIOV_VF(gt_to_xe(gt))) {
> +		xe_wa_process_gt(gt);
> +		xe_tuning_process_gt(gt);
> +	}
>  	xe_reg_sr_apply_mmio(&gt->reg_sr, gt);
>  
>  	err = xe_gt_clock_init(gt);
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
