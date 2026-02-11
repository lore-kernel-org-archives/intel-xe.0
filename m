Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02AA5ECD6D6
	for <intel-xe@archiver.kernel.org>; Wed, 11 Feb 2026 20:08:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A773610E0E8;
	Wed, 11 Feb 2026 20:08:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QRSoAKif";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5B6C10E0E8
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Feb 2026 20:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770840482; x=1802376482;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=XZkyBnaqglL5qN8RnLYg6vEF026X2HqwdqElsdaqWkw=;
 b=QRSoAKif7fyPGONK+9p4MqtVtJB01VvZDpfgnqScpKlhcff/ZyUaZGS7
 FTy0w9dSX4DRFwML9tSfwU6NT/VRoxZvpZK8asqo+HX4FtYBIMcrzwLZc
 s0/7ISdOn3wG/x3YGva7Kc1Tr4n90yp1C7t4zOwvYXFC6CEpyrGQHch7a
 t2d9OPX2O8+pSOxGSe2+E62g7r9srG2T023fd+CqIiXaqidFz02k2Ifsy
 ssy3MXaYpUbrmWfPojwX85OrVC9nhM1QS4gWiZXTJHMt/8Jf9C8np8CYv
 2v6mH1nGJPV+msnteBmvDolK3z7oqw39e3V1/2KMYMjDTt0BB31+QMQId w==;
X-CSE-ConnectionGUID: ERbp2CVaQqOJXJ5R6vELCw==
X-CSE-MsgGUID: TaO1DOlUQ9uifizSrTAUAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="72045484"
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; d="scan'208";a="72045484"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 12:08:02 -0800
X-CSE-ConnectionGUID: WtAqObxmR2imVbxbUgBp6w==
X-CSE-MsgGUID: fRBUatBURdyyRNVMLsAZzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; d="scan'208";a="250018093"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 12:08:01 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 11 Feb 2026 12:08:00 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 11 Feb 2026 12:08:00 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.67) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 11 Feb 2026 12:08:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HDB8HBg/1Dvm1ia+c7xRC7eCQ9lKP/6WkktTVCSogSF8WsAziUhgvFR/LjmohS23JAYz03z/L9tWK3vO+rQr7aYZ1v2P3Jx65jfjeR+GHCkiY2aCk5P1hBPxX+WAWjFHZwGhJZo2GlGN0fj5kF0eGlZ5dFavc+4frYMD8YXlb0DbIvpFmXzP7sq8i530ORVhDbBq2dkF02tJkUlLa1rXxt5f/ErXMntZ2dfwQX5ulwa5WpI+ejJ9YkRM8mZt+nmtdK4CC7X307UgOkJ04HHQ73mRRluYkmZV5ESLSYB+eLWHudOoqiQNxq6f+ZxzEj1EqFCCwI3fMEskyRpCHDjWBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B1pj9QWJvRO/SdB+Z0t+mMScahcrgot5B722q3MpIt8=;
 b=EGYREHrl4BHFbuYnfcS/YXPlJteH8gEJML6XDvgPH7OMQ7qt5ry11QM1ACaw6cmwN79RXX/1yadaUYjGedCfpRG1cELALN5cGNsMNg3keB8Qb2T/qGfQMxWMwSnGX4ljM4g8yW/A5ypr7MtM6Xl4DQtbV9OoIyvzG6bwg3e2QP8qGXvyid8m3wWlsNGgw8lKU6SfvJ6ITjUDQG5Im3F6CwnqW1DI+9L00C89FcXHjc1cHQmJFrp09c8gxc6TffdB1oey0WgIfRVi4/tIdIK9/D+FzLUCf98CWRRWJGGkl9YyJZsbSbpeTkOWYAoX8sJBjEQrGQs60BGU7APdtkJSDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CYYPR11MB8307.namprd11.prod.outlook.com (2603:10b6:930:ba::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Wed, 11 Feb
 2026 20:07:51 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9587.017; Wed, 11 Feb 2026
 20:07:51 +0000
Date: Wed, 11 Feb 2026 12:07:49 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>,
 <himal.prasad.ghimiray@intel.com>, <rodrigo.vivi@intel.com>,
 <riana.tauro@intel.com>
Subject: Re: [PATCH v1] drm/xe/bo: Redirect faults to dummy page for wedged
 device
Message-ID: <aYzhla3uZek8hKp1@lstrano-desk.jf.intel.com>
References: <20260211195109.2053038-1-raag.jadav@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260211195109.2053038-1-raag.jadav@intel.com>
X-ClientProxiedBy: MW4P221CA0024.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::29) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CYYPR11MB8307:EE_
X-MS-Office365-Filtering-Correlation-Id: a96853fe-8ba3-4ee9-8dae-08de69a93c60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WU8WHI2/ZTIk5U7fXcqcppfDTdrfvBBTJqFobcsFo7WYa0kkfjvRn7ArS6E/?=
 =?us-ascii?Q?kBl9Px6lmovzErckks3Kz+j3v6ZbJ1KtRnAWnTapzDh6RQda0KBRaVLpdCfQ?=
 =?us-ascii?Q?MjIvM7PTlHLU9exanz1JtVqJIn5sZwD8sahixqdbcLX9HpTmztoHVOxzlV6E?=
 =?us-ascii?Q?0Du4+hnq/GQHC96SpqvV4zIEkd3d0Iz7xpxcvHJl59m4iJcpL4cDRZP9SHUt?=
 =?us-ascii?Q?H1odcDnBTsiDMOAQRIjURQOBe4x8WaPVAN1v0YKN0qRDgowRBpDTfvqLNP6r?=
 =?us-ascii?Q?OSdKTmrNwPYF1F2fD/Y9d4m09jTty2Kw/XeAl24IZSbCBCK7ie5ClT0uVj+B?=
 =?us-ascii?Q?fdZUj5ZQhrFB/gbU+izaANdbFybhT3TzEatnauJso1yTEGjRu9/gGlfLJGaa?=
 =?us-ascii?Q?QZyOVsfX/QoFvgfsGoO25RXxLRXLK3Az7+HyWjFNijdU6v5M7+x5Mu+X4M/+?=
 =?us-ascii?Q?/zwP+qayNEQmtWAx4WIS8YXv0/0ZzbTMQLzjyI8hqiOZLuAaaKcZc3b7CfdE?=
 =?us-ascii?Q?XjeScTLcmB0qtG+a0ab88IuaHt4x117yOkZ28b3Ba4S4xFHKWd9AiwRUu1+1?=
 =?us-ascii?Q?f7Ahqtrfk6MX4+OeMdc0pteyfaIWsmoHLzU71kH/If9Ha4TGLrD3EA77wZAe?=
 =?us-ascii?Q?X2adubwi/ptidUU/unmQI3d55Lyed23RKcsPd8XegIWzU4dQuFA2+zkTBCcP?=
 =?us-ascii?Q?f5jcF5OBS970nF/PmXbYlDz62oshlE0ByN07e0JoBfRH5equchJUtSXkDELK?=
 =?us-ascii?Q?A7H2j1YLknt7fzI/724mX0CnrggRTglKfOjqha7m1bY83SAYXsdWzE/3CCU4?=
 =?us-ascii?Q?OEJXLzG3ES5qjWqICTuu58EvnPp/tVng/y3EpEge3eurwIqtuiLmHbXSxbqU?=
 =?us-ascii?Q?GObUx7goZSkV0BA2zWFSxoHDUaOQVs44GFGZVQcizzDShkVI/Gv+jQ73/zJJ?=
 =?us-ascii?Q?0Lo2yfAEjociOFjIhyU0TfbcE6cBX9m3AsIhmF9ms29n7j1K/Bkx2FdtEDIs?=
 =?us-ascii?Q?QaNcvVD1yNiH4cCvdrIChlsYe+s3yj/6hFu2THQ6B1piQaPi6tcy/vm5VKz7?=
 =?us-ascii?Q?5/OCFKYoWUaOW3AuuPwHhDiNelbKoyuwWSNJbbvyWesw+iErpa472v1Vf90x?=
 =?us-ascii?Q?fDqiFiS0lDe0NEtd1W6jpvShRQ2hYg8HEVUlJQx5pZ4e93Hysnq9kDQmIHK0?=
 =?us-ascii?Q?NehEB1+eVV1o04kMkM2qBh02qy3Vn21EGvGy0y9zMhAUqZI2gtdix4fMA23O?=
 =?us-ascii?Q?Em2NAuyFPpznAV/BaqDI5n+fJVKkNX8kCGMAbyWMaNcQiYCJ22P+9y8hbtDv?=
 =?us-ascii?Q?CvGsiLhf7P2O7xqxR4qVUPXK18t/qLgJtu+49vXWFf12gXNVnw6RyKjCTyBm?=
 =?us-ascii?Q?QjKbjwJ83WL2PwoGV6tHxkdRpZ3jN3nl+j5/Qx35P7hh2ooqaA9j1FWo2tEj?=
 =?us-ascii?Q?RZ0DRIzLnl8uB+Y2ttQfjnqTxRImnuE9r5EfD8/fJ9ob5q3J7qFHBlnaGveF?=
 =?us-ascii?Q?xUQLlBwjUUfCunrDIpBD/j4SY17vCun87n4cBGVJN/cCdVzWgyO8FzAe/Qxv?=
 =?us-ascii?Q?/0CWjpmMpqQNDfdzN6g=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eiZOJ4EZxlCHvBYB2SJ3+UtNMD1FjFSfXPx85dMblkMUTZ6KEp0th55HO/yc?=
 =?us-ascii?Q?8qmXu9xEmClOfNvFAKKCfFb5kLMw19ns1KUTl5d6Rcm/TY/WNwr3i8pQ9JLV?=
 =?us-ascii?Q?XVgqcCQXRJvpU0diFjBpesRk66EQi/CqqYnkuV6bl7QGBi5pRuWNgzChuZxM?=
 =?us-ascii?Q?MKVJQDMIrB3P3PoFZVvKHWnXgbSOJ37Mu4Ei/XkcmvfBFBAemju3j81GStyU?=
 =?us-ascii?Q?A90fOr0CN1OLoBPtxdJKXnIwa+YtSvRNYwtlkFfeBLErJsHX6bcqAR9KhR7p?=
 =?us-ascii?Q?siVC2jvTvZjpLdfPZkBfZzBZJbXWUYJZFApPX2z71FYiqJwmDmRcNBJnJgSv?=
 =?us-ascii?Q?CkEGNZdrbcEntUWs7bThSBUQjK82mygRItnYP+dpkzgvNSfe11oblue1dA+9?=
 =?us-ascii?Q?zGGX4CxJE58R23ZuRw3GM5Y7U0jyQiV+/dPUq3MBakjevsgvCicMU/24V7hl?=
 =?us-ascii?Q?otLRCc9TlxDGpGEXXg8NKYdIwsogXoX8dBDnlK/nrQh6cL+qYbhEyJM3qcqY?=
 =?us-ascii?Q?SKaPMEDNKAZaDXOLJ58/NM4rF99/WgkB+PqAfjmAWZxMHyLBO9uHHT/JW8wH?=
 =?us-ascii?Q?ehgvQcB65mf9w7TN3yOUoqiVlLaDWtmDgWQ/Nf3PtyjRdU5cdwh1uICFDa1L?=
 =?us-ascii?Q?nH+suIActS3AJ2cvx5kSlfRc5srJ6bh39oJr5dPCYU/sjaDOSPpDFYhHF0yT?=
 =?us-ascii?Q?um2txwlPrUoK0AtBXZHuLpDEuDPsorMmkaIfECVTSuRKz/2eqLz09x72Eb2p?=
 =?us-ascii?Q?6NRfyTY2NKyaZYz2cWyCBdm8oq/BevHyGzOWX68titfV9dpJhvo48nYQLjOf?=
 =?us-ascii?Q?1NFa5R8dRs88BhrO6yjQRIWD5vK6UBPEp1WLdBV+fLi8llsdEwgFshw6/FLy?=
 =?us-ascii?Q?yAe2zcztdMBtkEYAEIZohr/k6cK574zC3wFRSASMD3OJ1f9hYO5r7FxuagNj?=
 =?us-ascii?Q?v/TIHyPhCKN3lqo1AgdjHMsvVYqW0qetwysPAfDU5m2yAt64ZmEPTVi9rxd8?=
 =?us-ascii?Q?E66PSywkorm9/mpsBnkLMI0l+bGmreMhynL8IIr7Lj2V/QRO/rYFpxFWV/RT?=
 =?us-ascii?Q?58q2j7sLZqVRugtX20W1EBWizwF+Uf+54SshITtHwAHC/pFF8dECgPyTDMUS?=
 =?us-ascii?Q?K0VXM3nBKEKrU/TgBN1+6OvGaRekGBzjW8MsSXohgEA3Ne/NWJgY6qjaHQXP?=
 =?us-ascii?Q?UfgZ/JSwGM17QnuJ05CxIbhdA4OYEuZl2XC5opsysQrgt1ocO+p4PmGGs9Xs?=
 =?us-ascii?Q?azwKnehzqPvQ2pBEjSwyJ4s5PeSTGI22XhE0f0LPRUbMKSw2vu22KXRMqiS2?=
 =?us-ascii?Q?5h8w29ahETMCLm9Q0xSKUY+V8GtDpSNLdPhtCv2RZTbmKCe8+xpFVC7S1yFW?=
 =?us-ascii?Q?FkQYCFWqIeXMZxf2wOx4yVSIqLVqaMCIzVi0WHGSawE5GDoJIQfzNEFHGbAd?=
 =?us-ascii?Q?tgyqUNwQ1XJWeYPNEUNGQI6WkxkAOLQn1BfKeCF61yyGc2JZSEfODm9P4Tfk?=
 =?us-ascii?Q?aH8Yj4wznpRA8aTXUIT3ihen2gtoRnnwGwPU1BBtgFImysPXufXvhT6p74CV?=
 =?us-ascii?Q?MhMLUlFyRq5DS6Gn9KzllsRd6re6ykEN3mmSuHzaq7+PUGY/NEx7/5bFSu4d?=
 =?us-ascii?Q?/X9ZLWvSyd4urr23a0t5b1drbO+PaoRBBnJDQDeoNgwISbNnm5rMdKe3Gazi?=
 =?us-ascii?Q?oIgevYjbkFhuBVkE4VfXypSpG/q9NLWtKMq99MY2hBXPtZcLPqSRLNOv7eYM?=
 =?us-ascii?Q?pwdATFmziY7c+ldXBw5Ilj/Ri5nkB4Q=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a96853fe-8ba3-4ee9-8dae-08de69a93c60
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 20:07:51.7593 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XqteAigOtVqgYiYycA1ndG/2IAK5a2mNCNupaxRUfwVQ7hnKTpq9Sp2Yyf44soOYuVzWeSlzZAK4Oxl9Kd66fA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8307
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

On Thu, Feb 12, 2026 at 01:21:09AM +0530, Raag Jadav wrote:
> The prerequisite for wedged device is to redirected page faults to a

'The prerequisite' in the DRM wedged documentation? If so, mention that.

> dummy page. Follow it.
> 

Fixes?

Otherwise LGTM.

Matt

> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index cb8a177ec02b..d6c2cb959cdd 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1941,7 +1941,7 @@ static vm_fault_t xe_bo_cpu_fault(struct vm_fault *vmf)
>  	int err = 0;
>  	int idx;
>  
> -	if (!drm_dev_enter(&xe->drm, &idx))
> +	if (xe_device_wedged(xe) || !drm_dev_enter(&xe->drm, &idx))
>  		return ttm_bo_vm_dummy_page(vmf, vmf->vma->vm_page_prot);
>  
>  	ret = xe_bo_cpu_fault_fastpath(vmf, xe, bo, needs_rpm);
> -- 
> 2.43.0
> 
