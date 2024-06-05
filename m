Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 005BFC25B76
	for <intel-xe@archiver.kernel.org>; Wed,  5 Jun 2024 17:28:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F44C10E05D;
	Wed,  5 Jun 2024 17:28:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DZvW4hQN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFD6D10E05D
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Jun 2024 17:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717608498; x=1749144498;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=3LV9lQE85V+7yMp6dHhFgrj2/7Kmsu8jAuyEID01mrI=;
 b=DZvW4hQN0FD8aLSR6ydzKwt7f7D8T2lx2Ez92RW79bSa4QnFSnZAr3oj
 nC+NZUS7M9TGbKqVre3twN/M9uwej16Wv4v+sbHqBkxgrDoH366AtM5VG
 XdFXWRPe8Z3F+NVOgvhz6G/vusOO2ZdMMqvx35GpPfnmeGAfAxwIvh0DS
 UkW0IHRPmAkAdt9wIO7vCtgeUlTfk2PxyU6WrstRDy1245kkuUcAiMsnG
 FeB0VgfKp42GflWAhkA/4V0rfChM9bRbNAQQjr8+Ejtcr5dkpSuRB4XBI
 QkUPXAIkZMLyK2IlcLmm/i2TVSndCwflMMJk/3T0am2dl0kPdEFTHe6HP Q==;
X-CSE-ConnectionGUID: hprSo9HlT2GmrsOXh7QijQ==
X-CSE-MsgGUID: gaTKtH/qSniifhG0Ew0xlA==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="31733891"
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; d="scan'208";a="31733891"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 10:28:18 -0700
X-CSE-ConnectionGUID: bqZl6l2kQ+e4PfrtUriqXQ==
X-CSE-MsgGUID: DX2lGmtCRJijpOPZ60J9HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; d="scan'208";a="42121926"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Jun 2024 10:28:18 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 5 Jun 2024 10:28:17 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 5 Jun 2024 10:28:16 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 5 Jun 2024 10:28:16 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 5 Jun 2024 10:28:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q1i7kbGKYpiyadDSiwpGk4XzVa8znB6SWT9ebK2j7NM8a9iitUXNkupr7+aUsV9+21w1ZRfMK48HgW8Fva5oruSF22vK/VtR8We623dg+dDdOAuFBtclatRqMppFkM1adM6+3AoTDSeamQdaaTn1mV9YW4nxreEaAfvhK429qTPZ4vOIOW+qNHerz43iuBkj9F4Yuj5fse4hA650Pe3EetXM0DqFT882Gj0j9R4VFyO5MnuG09vTTCPjkgn4nHK/T6M70s9P0eJJg6GmT5LGGSTtmICNxqiAVqpAsCjdFu3ALqak/JwQyKpcrjYXh2aXpq1CbBXxS1xzUsl8EIgVlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7u0VK+pqRaMoF8cf6g8aRH9OaKhzXD8SF54jLi7faoE=;
 b=Bw/E65mBqm0u+MTdS24Ao5DKpXECIdZYJpaaEzbkEpS6z3P7nvnyQ37KM/VZlJf+OMHK1Dn4FXyDS5qG8+ULjZkb75p16hHKHt5gvkcuWgEgCxVGHlQ2QEyOFqrgTwHqm1OzdD3eLQifHtMZPekLPU0rOPZq2O2bQGy88ItT+FRAPA1gH8FO+xBc39qDnmilA+H9JKRXz2UJzSAjNsFWzy14QPRV3TLcjH6hNKzw8vKriWGauIs9Kh2j0r0wXwSCXZw9ZHWYLjRWWE9b1+k5cqjOIxaB+raanvyPucXDjTCmgFEbqqTtkTJtHWsZCd1v5Hh0VvEQtBmEHw9irqDf+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by IA0PR11MB7816.namprd11.prod.outlook.com (2603:10b6:208:407::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.27; Wed, 5 Jun
 2024 17:28:09 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7633.021; Wed, 5 Jun 2024
 17:28:09 +0000
Date: Wed, 5 Jun 2024 13:28:06 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Badal Nilawar <badal.nilawar@intel.com>
Subject: Re: [PATCH v3 1/3] drm/xe: Cleanup force wake registers bit
 definitions
Message-ID: <ZmCgJoLGcLLUqInY@intel.com>
References: <20240605095005.1261268-1-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240605095005.1261268-1-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: SJ0PR03CA0246.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::11) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|IA0PR11MB7816:EE_
X-MS-Office365-Filtering-Correlation-Id: 868b1075-e5f3-4516-eb55-08dc8584de27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9gg6Dp3K0M3lT9Svrm44YPfakAR+CQcCpHwvBrkwW4Pa2DNkagdXlfUFKUk1?=
 =?us-ascii?Q?eXsgNROLjDPp6EvveWhGN7R8kQfPU/WT03NHa5XZWAU7Zg0x5a5oBfA9g4S/?=
 =?us-ascii?Q?sJj3B90AGPoLlh4o2Hm/3rsUfn8aieNEW4zxgU5u498AHiB1ZerxJIXwzu7I?=
 =?us-ascii?Q?Q/Ki3FMavdUTLkpJGyOM4f2SJ/N44Kwqvxie2KiCA1ptTHV2K3DiKLDg8Zj2?=
 =?us-ascii?Q?qkL1smGCjaEyhy4UZjSeJzkAnaRH8Sum0Uuj7ENk+lrIyervmV1UXTWY8WnR?=
 =?us-ascii?Q?ChE0KS17pC/CjQcUv8JPyKTy4ueWMC46ZVXufku8DDuh0MtLStVMFM0r+ktx?=
 =?us-ascii?Q?iZtZMM+nE3oq0JSY5esQ+RZB2HW708cQbHsSkBiqJTY+0ZdPaPgnxq/QxLjZ?=
 =?us-ascii?Q?3ppCzGMDX1fYjbvM5/txxZRsxr6gE68Ga8/KTbe2dfp1B2UBWc/k/LGfm74r?=
 =?us-ascii?Q?G6+SA6WBGCi6XbmcbGEZjtF+CnL/Eo86vzPVsnkC/BpuUh1scElDpmct87Ua?=
 =?us-ascii?Q?DHC2lXHYSOUrpVpmvDk8NXLxcvzpobkc2zdoyFe6f7tHPm7EeeVupZ/3oqyG?=
 =?us-ascii?Q?kqt0JXlEhLHpYz28le1OVYjwHv3Wa7sfE6npzdEs3LjWmle4248mAcWN4io2?=
 =?us-ascii?Q?YUdR09bWbQ45vTGTyFLBAME96Vd6LlYs/25nDPCcsWJRbPN+wa3w68ToDsNq?=
 =?us-ascii?Q?HD8457YQUq4Ng22ZOtP553DcSj8ccdA5txYc0+5DnbmcQcYULbwyqC64rtvS?=
 =?us-ascii?Q?PiRSFxJi8yH32QHC8rEE6dZZrmG1c3lnn5htpAxhBw5WTeitq9UTARycqGQx?=
 =?us-ascii?Q?kM3/Zhqdu9tb9JU2R13NP5Q8AQO7bm2nE+fgqtFvXvpX9ubehZPLCHza8sFn?=
 =?us-ascii?Q?AY0w1wnS26LSl6qfvVIOihhn+UZWdyLzQx3AN7Iy+384pZQGqHCfMFah111e?=
 =?us-ascii?Q?paVCrcf7OedL3HBy2TdmWZxGeiIR2bIyoSMJRGC/x88Q1WvKQ4UCPjdGAwoI?=
 =?us-ascii?Q?GZeSAZ3/8hW8YIRxogPJ5ho8LJj6U1wH2L3Ckph32lqqFlS0SMcLTUyR06Yo?=
 =?us-ascii?Q?5kGdCrB1ngjCI/EhgXzMevrKRKo/0TixxaINzrjxWIdqPil2gy8O++DeiY26?=
 =?us-ascii?Q?zX2hOvwic7i0YARGrn7LNqeAXRNNBuFTMH1gPJkOn7kO+WaGkH+7yzuJKuog?=
 =?us-ascii?Q?GtghMCBWoqtiIf/7to3QCvg+G/BLSQctMCaFB0j94bAh2UQDefXqf7fEvZN0?=
 =?us-ascii?Q?v5eOTFwCTvS20GpImsnWzvi+f1f3BrXI9cJcQyo96c4hVX1vQ2N7SyxWMEnf?=
 =?us-ascii?Q?K/gyj35TCgeAWpAva6lFGEht?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zejn9Y8O3NRT6OqeD74Np8NDiw7xgqkASYfnuCcH94e+sXcFy6/7ThP4zCfB?=
 =?us-ascii?Q?SBfQ7jFde/TmTPjhTz32BgT63yYhCEmPIciSGKYVjt9VrqC3NqvBb3ucPPE7?=
 =?us-ascii?Q?g8e9Pb4oEDrId8yWAIzxwAjptZdnJoo82RM3vBIDOt2fQh6hCQb+SlUEp2rn?=
 =?us-ascii?Q?HjB/l8JUKjbE0vGRgDVlYEjT/YK4vA+7YgXCqF3Gchhz1UaJTQiIJWSC7N9h?=
 =?us-ascii?Q?CDaTv9tS8OQFVISuZL7wrcDvpPVPcXudwZeMXAi5W+SmjT72A6DRZmvb2DBM?=
 =?us-ascii?Q?4Ue2RRAR1sYsOn/LYHVmR2LL7lw9RSth8C0/eW02oTC4WBUwB/yvZ/4qMyZ6?=
 =?us-ascii?Q?62H+KLOB2mRZ/K4futt+sQs1Tqzpol4V3zFy5IAyZfQI0KyKwwYvd3793XG1?=
 =?us-ascii?Q?IUzOXWmeFk7JIzToh9AdJ9m1pze+SYGn0ZTCpB/S0jDL+LT26zOJd+TmK4Zw?=
 =?us-ascii?Q?jzVG/RNj5/TxDYfb+kpCJ1Vn7eUG2LafAF7ugtmyftfsjJzXs0o95hKdDjLg?=
 =?us-ascii?Q?APLlikBCWa1xVtdhqnqLoxuodfJAaGTOgt/aZ99ZDcWtavNzZSYElVUFnaJ7?=
 =?us-ascii?Q?2nvuov9i/TSPpJOX1/79NHzclHT1iEufhg1ZiKgyD+qdenC3MeMTVgw56BU3?=
 =?us-ascii?Q?AnGkVDcznp58FSBNvRFPRIB9NxMnKYCY5pw1SOXAH3XN0f+dAA563/Aq/3EJ?=
 =?us-ascii?Q?WJd36Bro8JOQ3kczHZMui85qd3mqqwgdF4UKTUYauYr7vxzFf2CCMMRl1rzD?=
 =?us-ascii?Q?q6iWL3JcsO3NraGMrX6PiL7K63Y3SZGmkIEX5wa1N6QD0QlqhmPdl2pBJ/AL?=
 =?us-ascii?Q?THAgmk7kjJy21FB5hZSHMb855zmzCcLUA+Hf+WPnFy3S4dVh74H7syEmQvsP?=
 =?us-ascii?Q?6OklPUab08rtY4j49Efx8o6OrNb4+WT3vFfKQ4Q9t6jdWWN6wl/I0zHPUUSb?=
 =?us-ascii?Q?vF0C/TNAFDAU6Bmy/lGh4rFLdVRuw3A7A1+rFUtd3iBvKPEUE7b8pcaDFw3h?=
 =?us-ascii?Q?J83HsjuuLKciSjTQ9kt/biro3G69BXqmtiT95JNwNIoR5KBBHlhEuSm9lRLO?=
 =?us-ascii?Q?43amNQsDh2rXTPdcWNaAWXvEmo+Vrk1M5ep6dp1wFRjnwLcByqj8KGCh0xN+?=
 =?us-ascii?Q?u7zybTpE4pJGbtxr+7SJXUuQn96PlUneBl1YlE9cgT1MB4HlIa0XdEPfMxZQ?=
 =?us-ascii?Q?iY6jiJknI/MAajnDr1rdriFYzM8WTNEV4Nyq8muUAd+vfWm5r76wfkJeBCF1?=
 =?us-ascii?Q?Kkdz4ygOXKRHw8MnYbAjOkcHU6XJSzlIaSHpooq8CB9jC8IpCuZ48UHxdudj?=
 =?us-ascii?Q?UIZEAS6Ehiy/M2zWhctL7aqyQLM8/rt3VFdyzRRvS03aJ2ikpXkXj7u/oPH/?=
 =?us-ascii?Q?vB4MXprA1o28rVrpmPbi+clcCNmjIybrpNtmBEdr4Vedj+s34/qXL6Bxg9vi?=
 =?us-ascii?Q?Z68cXbTPrsIlm16bU7vZegdWsiz7eP4Lqfafk424NgswXKtdgleu5w5yq4KE?=
 =?us-ascii?Q?0oT9khBERiAZujLgqAFNoB3ZSlk4qyMzHbwUfni72joRX+Os1vXwvXS2lR/P?=
 =?us-ascii?Q?7TaEC3tPIPUF9hnUX34/CqQVNvPWa4xPDQw4ccVP?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 868b1075-e5f3-4516-eb55-08dc8584de27
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2024 17:28:09.1425 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VqrhxX8BIHTe/ngClDNTbL3UW49wyRkyi4m7Mj7kFygRTyJhTGqtGdHXd+P8+RM6c8f1/3r192gLl44vvdtTrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7816
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

On Wed, Jun 05, 2024 at 03:20:03PM +0530, Himal Prasad Ghimiray wrote:
> - Remove unused bit definitions.
> - Driver uses BIT(0) for waking/sleeping the domain and since the
> registers are masked respective mask bit BIT(16) needs to be set. Use
> defines for these bits and use them in domain initialization.
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Suggested-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h |  8 +++++---
>  drivers/gpu/drm/xe/xe_force_wake.c   | 18 ++++++++++++------
>  2 files changed, 17 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index d09b2473259f..47c26c37608d 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -487,9 +487,11 @@
>  	((ccs) << ((cslice) * CCS_MODE_CSLICE_WIDTH))
>  
>  #define FORCEWAKE_ACK_GT			XE_REG(0x130044)
> -#define   FORCEWAKE_KERNEL			BIT(0)
> -#define   FORCEWAKE_USER			BIT(1)
> -#define   FORCEWAKE_KERNEL_FALLBACK		BIT(15)
> +
> +/* Applicable for all FORCEWAKE_DOMAIN and FORCEWAKE_ACK_DOMAIN regs */
> +#define   FORCEWAKE_KERNEL			0
> +#define   FORCEWAKE_MT(bit)			BIT(bit)
> +#define   FORCEWAKE_MT_MASK(bit)		BIT((bit) + 16)
>  
>  #define MTL_MEDIA_PERF_LIMIT_REASONS		XE_REG(0x138030)
>  #define MTL_MEDIA_MC6				XE_REG(0x138048)
> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
> index 9bbe8a5040da..54279c3814af 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake.c
> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
> @@ -52,13 +52,15 @@ void xe_force_wake_init_gt(struct xe_gt *gt, struct xe_force_wake *fw)
>  			    XE_FW_DOMAIN_ID_GT,
>  			    FORCEWAKE_GT,
>  			    FORCEWAKE_ACK_GT_MTL,
> -			    BIT(0), BIT(16));
> +			    FORCEWAKE_MT(FORCEWAKE_KERNEL),
> +			    FORCEWAKE_MT_MASK(FORCEWAKE_KERNEL));

hmm.... looking at this now I believe it would be better to just pass the FORCEWAKE_KERNEL bit
number as param and then use the MT and MT_MASK inside the domain_init function...

but up you... my rv-b remains whatever you decide.

>  	} else {
>  		domain_init(&fw->domains[XE_FW_DOMAIN_ID_GT],
>  			    XE_FW_DOMAIN_ID_GT,
>  			    FORCEWAKE_GT,
>  			    FORCEWAKE_ACK_GT,
> -			    BIT(0), BIT(16));
> +			    FORCEWAKE_MT(FORCEWAKE_KERNEL),
> +			    FORCEWAKE_MT_MASK(FORCEWAKE_KERNEL));
>  	}
>  }
>  
> @@ -74,7 +76,8 @@ void xe_force_wake_init_engines(struct xe_gt *gt, struct xe_force_wake *fw)
>  			    XE_FW_DOMAIN_ID_RENDER,
>  			    FORCEWAKE_RENDER,
>  			    FORCEWAKE_ACK_RENDER,
> -			    BIT(0), BIT(16));
> +			    FORCEWAKE_MT(FORCEWAKE_KERNEL),
> +			    FORCEWAKE_MT_MASK(FORCEWAKE_KERNEL));
>  
>  	for (i = XE_HW_ENGINE_VCS0, j = 0; i <= XE_HW_ENGINE_VCS7; ++i, ++j) {
>  		if (!(gt->info.engine_mask & BIT(i)))
> @@ -84,7 +87,8 @@ void xe_force_wake_init_engines(struct xe_gt *gt, struct xe_force_wake *fw)
>  			    XE_FW_DOMAIN_ID_MEDIA_VDBOX0 + j,
>  			    FORCEWAKE_MEDIA_VDBOX(j),
>  			    FORCEWAKE_ACK_MEDIA_VDBOX(j),
> -			    BIT(0), BIT(16));
> +			    FORCEWAKE_MT(FORCEWAKE_KERNEL),
> +			    FORCEWAKE_MT_MASK(FORCEWAKE_KERNEL));
>  	}
>  
>  	for (i = XE_HW_ENGINE_VECS0, j = 0; i <= XE_HW_ENGINE_VECS3; ++i, ++j) {
> @@ -95,7 +99,8 @@ void xe_force_wake_init_engines(struct xe_gt *gt, struct xe_force_wake *fw)
>  			    XE_FW_DOMAIN_ID_MEDIA_VEBOX0 + j,
>  			    FORCEWAKE_MEDIA_VEBOX(j),
>  			    FORCEWAKE_ACK_MEDIA_VEBOX(j),
> -			    BIT(0), BIT(16));
> +			    FORCEWAKE_MT(FORCEWAKE_KERNEL),
> +			    FORCEWAKE_MT_MASK(FORCEWAKE_KERNEL));
>  	}
>  
>  	if (gt->info.engine_mask & BIT(XE_HW_ENGINE_GSCCS0))
> @@ -103,7 +108,8 @@ void xe_force_wake_init_engines(struct xe_gt *gt, struct xe_force_wake *fw)
>  			    XE_FW_DOMAIN_ID_GSC,
>  			    FORCEWAKE_GSC,
>  			    FORCEWAKE_ACK_GSC,
> -			    BIT(0), BIT(16));
> +			    FORCEWAKE_MT(FORCEWAKE_KERNEL),
> +			    FORCEWAKE_MT_MASK(FORCEWAKE_KERNEL));
>  }
>  
>  static void domain_wake(struct xe_gt *gt, struct xe_force_wake_domain *domain)
> -- 
> 2.25.1
> 
