Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B31B8C27C55
	for <intel-xe@archiver.kernel.org>; Mon, 10 Jun 2024 19:47:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F5F310E272;
	Mon, 10 Jun 2024 19:47:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eLb4cWkk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8651D10E53F
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Jun 2024 19:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718048836; x=1749584836;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=AwOMWtmtYlqswhST1CZ7hRPIz6B/f39Bb2mWCcjhKZ4=;
 b=eLb4cWkkslFdE/FQwcI9okae8br8FWhgbAYHjatgdmjnqQ/zw14fthJB
 B5bhImECYOZHdrKlL7Wr6RJYdsdVoCR+pWSOxDGc4ArTtBjcyqhxbteYN
 tzwP0LJUTRkk8tK/IJVDTvd+KJG3EBPtZlx0j9HdtH04yxu3bNGU2Ke6p
 yDaIvcN+8i19zyrheCsT1vDkMhhcddZywtqPQj8awPw4uSAyIQ+lp+M1K
 hz0GVmd6TAJ/LheMpLXO9yL6DIusZ8QdxN711LNzkaUqdIxIoyu3XCHb4
 D9Oh28JOoPIC17TEgNxYZkRANa+KHRT4kRImPuhpbIG3sbicSHq9TQiXe g==;
X-CSE-ConnectionGUID: EbuLwF2sRYeEGdWJxlhSFw==
X-CSE-MsgGUID: E2pkWWYzSqiPA4BlKzxHJg==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="14455862"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="14455862"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 12:47:15 -0700
X-CSE-ConnectionGUID: kV5RIpSLT1CUFZdaecdbzQ==
X-CSE-MsgGUID: LWHGA1a/QO+VfbRKm+MB/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="76627812"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Jun 2024 12:47:15 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 10 Jun 2024 12:47:14 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 10 Jun 2024 12:47:14 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 10 Jun 2024 12:47:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LSjCRUsA6G4RsGeBdlUxoBaRSsnOLQHkRPMLJqtkDz8zQ2W1m+GCn5Y/xtppAIbRunroQyduTVu9QvhjAk9++B7L95h8MkD4rXR3Cvc3OhQqGOyCNIj0MxgBaYVyTTF2nkL3sKKY2+LZ03YOYmW//3YriskWZH4jwPuP9GCkd9aEDKQ7FyDUsnyXBc8O2U103RJgwhZj/dIGoz484xzt6wyZADcnFGcJL82ns13QDRoo5Xii8+KCQIK7yqxU5LBqAoUH2OzvYS6UDZrfd5MK98InCJu5jfTT84l69foSvReUgXdmEkOYeRiCmqrV3ACtJAKYErVck7eHMPpNx556hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MwBEfIqMZnWULjyyuBz2nrr5AHnQYydLYYGSrVsdfxQ=;
 b=Opmv0YRg5JSusX3uPqZ1dOg3oXuC7d0rDllWGf9WYw7AegG9CmSwxEDIKSHz/Tyk++K1z2PEdEzjxpLtbNR8pwRAnsQa/JfGxlN6FTwjAzbLSgP8JtXdvatyy6QZywaAlCqZiY1fluQLLBgArcyXmWFM96H9T1X1TPoq2CiggYQwkYe9aayZgpZz4l2Mp0z3nZPr3KFUg0EoLgedcal5aAr0lkDQ238jVcxVWUwtFVeSbUDTqfwYu0O9B+bctKu/Au7Tl3dtRYoJTSSJJqEkeS3gkORgngrO7NYLtD+uAkQCtFpNaG6yonDV5U3TfCsUcw+pWE+ToqLbhfi3o7LdGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by BN9PR11MB5257.namprd11.prod.outlook.com (2603:10b6:408:132::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Mon, 10 Jun
 2024 19:47:12 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7633.036; Mon, 10 Jun 2024
 19:47:12 +0000
Date: Mon, 10 Jun 2024 15:47:10 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/4] drm/xe: Include additional info on failed force-wake
 operation
Message-ID: <ZmdYPoZWIplWix-8@intel.com>
References: <20240610183757.1812-1-michal.wajdeczko@intel.com>
 <20240610183757.1812-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240610183757.1812-3-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BYAPR07CA0053.namprd07.prod.outlook.com
 (2603:10b6:a03:60::30) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|BN9PR11MB5257:EE_
X-MS-Office365-Filtering-Correlation-Id: 10fed1ba-5744-4c4a-92ca-08dc89861f04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?iCvJ/In/zYzsq1ea9P2sdYTuuOJvIADyZWySlU0rgFShP/c5AufEdKGE+MsW?=
 =?us-ascii?Q?QBjHXoRMYFQDbf61aQujwLFYztiUvDOLhUbipkHEzwsw/JMDzRgLW7DpXSxp?=
 =?us-ascii?Q?eNqfgcjynO4QyFt5qdRp04Cy8hDWRwjrKx6yxC49yE5VDfwnIN5zRL3vqBTm?=
 =?us-ascii?Q?2wAHP6D9LlnbtkpANnM89wE8WoLuC2YXJkE5lOvElJsDLx4yTku8Ry+HzLYK?=
 =?us-ascii?Q?Eu8evb5CscBnb7uOtdme0TSDvvfGAVeNcvucUI2lEPQt1cQCJsL43pNBhOV9?=
 =?us-ascii?Q?TaBR/B9E7oTtDMzmTGY3H9UI5TGT1htZ/tJjd0PPkGkWu0em8ObP1Gcbbzno?=
 =?us-ascii?Q?66osX7aWHSpI7IjRk5GJz5AWwkW1aq0NCcaXRfmVckXggwz9GM3/XUReAh1p?=
 =?us-ascii?Q?nOQw0XJMSYxLEITO9TXrFvQ1K8XUUT7otgep1DbeqNB9rprNaTgZkIj9VcFp?=
 =?us-ascii?Q?GtPv8utYeYHLCcXht+RjiBKJaTvJCzYaOLqd2QEbe8eB90a2Cq7TGLP6iNb0?=
 =?us-ascii?Q?hBUga8TVTuK8SByoEQCLcXP9BIZ2m3BuCUiIf78pV3/K2Iu6+l6XKsNbSnV/?=
 =?us-ascii?Q?ekt6MuBfaGXs5QEqi5y9Svm/OoDZs0SGe33SuKoGXLCo2p7R8h8VT/kkC5o+?=
 =?us-ascii?Q?4onkzmNnlHQTCtG3Cc05np9rOcF06ei3d/9HKZjj53PS35k9SfpBaf3Q3deW?=
 =?us-ascii?Q?C/Ribv3+KvN/IcvXiO47N+lMovpuUoixo9/VxooKnNR+XPsF+DOd35I9+fEC?=
 =?us-ascii?Q?DybYcVsIJxYmF1ATCEgi9g1PDd10lsA937xIpiAuNBUOHqr+/KOpcyug0qsD?=
 =?us-ascii?Q?f/ROYBGAlE7A4wrsoeOwDlIYRVwOTKOQReEZAZXEtELqDTgc+ghEYktJvNL9?=
 =?us-ascii?Q?21bQ3hPRJMxD5cYCNQyMpfuYZIkRrZ51bsZSvnm8MLSPEdzSFPuHDwn/TUrF?=
 =?us-ascii?Q?V4VhQr//TjjFY/Hse/+k6zHmdJrhL5KyP7PdUr2AM7JNjYURz9reLH/8Laz2?=
 =?us-ascii?Q?VeauBbOvD7M3fiN7LHpRj9fsR6eE6cuhNZk8uWuoAqx10plBNSyj6Jpxvev3?=
 =?us-ascii?Q?at1twri0qj8RzUNzAt/RzVexARtUopZfXnvTTgbbRUqytB18Oqsl/kKpHqHV?=
 =?us-ascii?Q?QLJGwFOCJyLy0L3cN9cc+Ay45/t8lKTeBC8eoLhy0OrQbog5wZy/V44sbfpO?=
 =?us-ascii?Q?c81XQM+VGVZAAaT5piYZf0uElt4OkefwI46NuZQzDnRRolI92v7eiH963e46?=
 =?us-ascii?Q?H0j9koiy7KCNcyKE8n3DHrpJgi6mj8+GZMZYLNSU4QIiKWcQOU0k7qP4hjco?=
 =?us-ascii?Q?dFh23Eao8Ia2OHSYdQDuzxIk?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vGD+MOU6+2CnPoetId75+HvxuhPnEY4JQAGqbKCIwxuU2zVa94ya+8OsBytD?=
 =?us-ascii?Q?svGcFEMV7HYGqnmaxBFdL+sEb1VxAWoZlVkQuiIDRIZFBSWQULml3jfxtnAZ?=
 =?us-ascii?Q?kcM46Ufw3HmhIxuCCmqLd3xhecbYW6/5D1IdKLtHsHS4pkFInfMa4epftAM6?=
 =?us-ascii?Q?myPj6y9CyoM66N4XpDkQxJyyVHR26xgDwAGBZNzxK9ordHNy3Cly8pbpW9ZE?=
 =?us-ascii?Q?Eu0DMT3vzB3k+GBv+WK24yU42QqEjckn1fn4NdKn7+9JLF5Bjkd42b58tYrU?=
 =?us-ascii?Q?8sYP6f4cb9KwI1kNBhcI/jQHllhjHk8tVvxBbRhrKDNw+Dkk4mjvaI0hQFsA?=
 =?us-ascii?Q?9bWwl8cyIFMpAbpme2s21PxG8KVxFfot168ob+/c1doyWXoWUF639G62XIdn?=
 =?us-ascii?Q?iGNUbgMrwD9BIzYaAzcHyXnCGMgkp6cPI4vqUpXErRGlLpq/ukt4MlDPVjFo?=
 =?us-ascii?Q?yqlB2yFMP3GbH1YujkAm9gxP5Fkiq7totN7y16RTDnwPqFx/qRp7vnXr/22J?=
 =?us-ascii?Q?3xzADuwgWQGiohfEyyvfAgeR1bT8INpNGwXaM3NgbXBpWu0SJTSNKnMWbNWr?=
 =?us-ascii?Q?nFvY027151Rs1img4NDaGicb1a3Tsv1uKNfBu+we9GLkUs/3eQeRhTnwDMD4?=
 =?us-ascii?Q?ogTz84vdT3+yJ9Uc2eAzq1F5bmG37yk2s4IUT8WhDQCRyuy4MS5biqj9Qyxx?=
 =?us-ascii?Q?63CcgfMVa1Kb9Tb75qvNx7q4qVZOHnslUDWNGATDRdj1KHC97rGWubUbk7YA?=
 =?us-ascii?Q?nqkf89c8ZeMyKCd0AwtVyEaQ24Lueky1Y4cWWpqgJ5kauqCFVofoBegrasLL?=
 =?us-ascii?Q?+GtNrDDLtXa/y3psoOfBm/9X/OS/OXmoyl7pKGedNKuHAVLhJO4Aj18zhNE/?=
 =?us-ascii?Q?kWj/wi6PgQOxRNPr9UgDvqftYH4bMfdgPdSRQdylNIJVoJwDPw/F5f4VuiZp?=
 =?us-ascii?Q?GsjIzuzT4+nWfqb8xH7NZNBm6HbxQgSzACtP/8hK0A7BrRECVTnnZuY2+SES?=
 =?us-ascii?Q?ihkR4kcAgs+g00fadqjCJAYIptJwqI1up8voYDnrst3DkCDPKEFMf1I4hzhN?=
 =?us-ascii?Q?BuAd2WFhiGYuPUj6v9NTVBT62pVV4KWewRIwIR2z9PYFLLtjHiym5s1oEbi0?=
 =?us-ascii?Q?DMbHiqvsV7Goo/slIJEH+KSUdTAjkcZKw2VtCYl9zh4JFTDMbHbSVU131BbZ?=
 =?us-ascii?Q?1omsWF1o0LSXYu1+kwB2pCptoOxUH+N/P8cBaUCZYycZloGgvJYUKdngOiPz?=
 =?us-ascii?Q?JUwswWMwMs1xMK5QP2cVsugwx0dVXKikBYMoH50Dg06KI+IkDJNJPvLzAi6C?=
 =?us-ascii?Q?M+RIKNuekWD77iM142fO4EFZ2j1z803koaMANalLcTeD993L2jyueFFjv3lt?=
 =?us-ascii?Q?zGOb5AIqxa4OW0Go0xbSkbEsq5e/S+pG0fD3YeLEAZ0Ej8km4aA6+Wcw7bj0?=
 =?us-ascii?Q?iREscZZZ5i0yUuz8dSW4SYL1UB/JoJ/LGyIXIJhpNT9aM5i/BUXmBdBNRcIZ?=
 =?us-ascii?Q?kd+c/ENJiA/ne446FS5XVgj6Nk1aOomSzmbPm+Cke1fltNb4G1LmLpXNI2KA?=
 =?us-ascii?Q?a8Fh0tIcIBRf54vWPbOll9cJrO3MJAUY4ewXS/ut?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 10fed1ba-5744-4c4a-92ca-08dc89861f04
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2024 19:47:12.0374 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bPdSWDfo/i9vJ4YHFhC6m1hHpr8Wv+Cog4eDjdV6XJb8Pdbt5C3D1y2wig7KRNA4QGH/3E2C2WNV610ZJvMziQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5257
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

On Mon, Jun 10, 2024 at 08:37:55PM +0200, Michal Wajdeczko wrote:
> For debug purposes it might be useful to look at the values of the
> force-wake ack registers in case wake/sleep operations failures.
> 
> Move xe_gt_notice() from the caller to the helper function, where
> we have the latest value of force-wake ack register available.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_force_wake.c | 35 ++++++++++++++++++++----------
>  1 file changed, 23 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
> index 2497f0f65aa0..a1d97cce3d56 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake.c
> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
> @@ -102,9 +102,17 @@ static void domain_wake(struct xe_gt *gt, struct xe_force_wake_domain *domain)
>  static int domain_wake_wait(struct xe_gt *gt,
>  			    struct xe_force_wake_domain *domain)
>  {
> -	return xe_mmio_wait32(gt, domain->reg_ack, domain->val, domain->val,
> -			      XE_FORCE_WAKE_ACK_TIMEOUT_MS * USEC_PER_MSEC,
> -			      NULL, true);
> +	u32 value;
> +	int ret;
> +
> +	ret = xe_mmio_wait32(gt, domain->reg_ack, domain->val, domain->val,
> +			     XE_FORCE_WAKE_ACK_TIMEOUT_MS * USEC_PER_MSEC,
> +			     &value, true);
> +	if (ret)
> +		xe_gt_notice(gt, "Force wake domain %d failed to ack wake (%pe) reg[%#x] = %#x\n",
> +			     domain->id, ERR_PTR(ret), domain->reg_ack.addr, value);
> +
> +	return ret;
>  }
>  
>  static void domain_sleep(struct xe_gt *gt, struct xe_force_wake_domain *domain)
> @@ -115,9 +123,18 @@ static void domain_sleep(struct xe_gt *gt, struct xe_force_wake_domain *domain)
>  static int domain_sleep_wait(struct xe_gt *gt,
>  			     struct xe_force_wake_domain *domain)
>  {
> -	return xe_mmio_wait32(gt, domain->reg_ack, domain->val, 0,
> -			      XE_FORCE_WAKE_ACK_TIMEOUT_MS * USEC_PER_MSEC,
> -			      NULL, true);
> +	u32 value;
> +	int ret;
> +
> +	ret = xe_mmio_wait32(gt, domain->reg_ack, domain->val, 0,
> +			     XE_FORCE_WAKE_ACK_TIMEOUT_MS * USEC_PER_MSEC,
> +			     &value, true);
> +
> +	if (ret)
> +		xe_gt_notice(gt, "Force wake domain %d failed to ack sleep (%pe) reg[%#x] = %#x\n",
> +			     domain->id, ERR_PTR(ret), domain->reg_ack.addr, value);
> +
> +	return ret;
>  }
>  
>  #define for_each_fw_domain_masked(domain__, mask__, fw__, tmp__) \
> @@ -145,9 +162,6 @@ int xe_force_wake_get(struct xe_force_wake *fw,
>  	for_each_fw_domain_masked(domain, woken, fw, tmp) {
>  		ret = domain_wake_wait(gt, domain);
>  		ret2 |= ret;
> -		if (ret)
> -			xe_gt_notice(gt, "Force wake domain (%d) failed to ack wake, ret=%d\n",
> -				     domain->id, ret);
>  	}
>  	fw->awake_domains |= woken;
>  	spin_unlock_irqrestore(&fw->lock, flags);
> @@ -174,9 +188,6 @@ int xe_force_wake_put(struct xe_force_wake *fw,
>  	for_each_fw_domain_masked(domain, sleep, fw, tmp) {
>  		ret = domain_sleep_wait(gt, domain);
>  		ret2 |= ret;

with this change in place I believe we can remove ret2 and simply
go with ret |= domain_sleep_wait

no?!

> -		if (ret)
> -			xe_gt_notice(gt, "Force wake domain (%d) failed to ack sleep, ret=%d\n",
> -				     domain->id, ret);
>  	}
>  	fw->awake_domains &= ~sleep;
>  	spin_unlock_irqrestore(&fw->lock, flags);
> -- 
> 2.43.0
> 
