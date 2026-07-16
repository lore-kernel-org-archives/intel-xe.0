Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69342C43458
	for <intel-xe@archiver.kernel.org>; Thu, 16 Jul 2026 05:52:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1907410E296;
	Thu, 16 Jul 2026 05:52:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LpGslR3O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 978B110E296
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Jul 2026 05:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784181144; x=1815717144;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=qW9IaRHnoC7ZPNNLoYwWK/CsP9tqSgJngyQ6zb+qRhk=;
 b=LpGslR3OwCGmT9tN5iHvRhSbUNn8bYJxAenkcVWCCWGmlZQMnhiZTLMu
 HZTr4TD4dIyQxIr438nLUc/gagKipyMFBT7Ai/Pf2R6/fztuUjAee8iJz
 NWzZruc3Me0MzkDxRlfYZ7eAL5r54u7UtRLgQzR5gXn+Xl0BsWX5v0Rey
 xDrzd1xUU3R+/KdtvVfxtqtPwvx38z3EWRdWh1ykwPSf4dnkUQFre/5an
 jSlTeC8baz2YRHNDoUGLZGAoGJtGemSY6gPNQNKMJ2aOYN0zgdAJSpBxU
 2fe/cQ4zwfHgzvebzvHSA6n86VNJkLbLFLPd8/y1aYFkhkFXCp9rzPAQM w==;
X-CSE-ConnectionGUID: Itw4uWC0T+C0m2oyTLdDdQ==
X-CSE-MsgGUID: 1FYlzwQVS3m6bwU+NOeraw==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84685441"
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; d="scan'208";a="84685441"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 22:52:23 -0700
X-CSE-ConnectionGUID: q5Ca269eSDqJ0k/kl6hVEw==
X-CSE-MsgGUID: /WLc+To/Qaq3cEuYdMsOtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; d="scan'208";a="252999281"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 22:52:23 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 22:52:22 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 15 Jul 2026 22:52:22 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.37) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 22:52:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jZplQoEicBjVwhVfRnCbkLElVRDeBJ+lcX9/SYl3DPyKiKUzqzkYzWJ6LirLwGEQ4W3BCQsNNGdizBp5m7DupTQeQqWhetf6oHq03s2MVHkBUyNWr1k08PVptjobgsmTNh13QLlTnI3NZvZNS8iQ4EWGSdfebbQNn2i3nJi7CENmpVxARSspPvVh4Q66M8v0cmPJwXyjY1bnj2seSSc1wBvHcZ/4ZOHIVPy8341ro3Wrlrsw4R5cs64eU7YFkSfwmbf9UAeAjb4SZdtKMIBEO6FXpQKBrwnybBs5iApn80sathrCUPA61raykCNZduUye1s6wVYq5MToyLIMjVc71w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EOMwWAhJggy5PCLVsgU2xJKx4nf1aTm06Sfn57SRfj4=;
 b=Vlm0lKVIp7p6VBlhvIstZz7AiIYQGhBt2F/gVm77RXW4Gqx/UqLK4RAKvQlp/USyVaJVUA8GCnjw1YnvZxnIFjSPPRDQ4rNnU7zwBYEzlSa7+5nzcTZyazMwfKWZgqSny0ZDYxj9dxhGO1zqrAEsK9DKJ28MHbc4XwKj4JPyk2kr8sNTxHqBp/myh602/JRhVB9SiPByZfZFo43STLlsBBexqZTD4j8BVu7501ALqVoHoUkTWyYUw/w/1HCL+UWtQJAyuzCKzFKtOOYl+kwFqPTdq3h1CJ4prvkcaTse8uAqKKtoGcAN86mayteHOfXw++AS+fMa2XyqtXDmUFISBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN2PR11MB4552.namprd11.prod.outlook.com (2603:10b6:208:263::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 05:52:14 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0223.008; Thu, 16 Jul 2026
 05:52:14 +0000
Date: Wed, 15 Jul 2026 22:52:12 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Arvind Yadav <arvind.yadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <tejas.upadhyay@intel.com>
Subject: Re: [PATCH] drm/xe/debugfs: Add knob to wedge on first page fault
Message-ID: <alhxjBaQ4HBIea3y@gsse-cloud1.jf.intel.com>
References: <20260716051413.3626570-1-arvind.yadav@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260716051413.3626570-1-arvind.yadav@intel.com>
X-ClientProxiedBy: SJ0PR03CA0279.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::14) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN2PR11MB4552:EE_
X-MS-Office365-Filtering-Correlation-Id: 8517a938-af37-402a-c97b-08dee2fe62ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|10086099003|22082099003|18092099006|18002099003|6133799003|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info: Wt/DnZgq6JQDaOUBrIbJJFbmr6ukMfjBCjaAfpQxMzhLsbWDJoi472Sr2pIXqCD0pVyEPREyer6b77OEVHAYZP9HzfIIJdTdvMyaEbtrVHfB/eyHzpx7+BRblgwCfICfWXQ+qg8JHn+bvjFoXhXEXyAhWBfjWLck2cGbo1PSscAyWEYsyj6PcxAGA+yNm5egATxA2WOlx8vz9gBNqrSO1Sow2WG4d7y+y0Cj/wCdvHHJ97h94QG78Lkte/RR6L2Vh4dWDY5SIm3fyd9c3BMsj1IMsiPYXV0t+HaXpjVizhrT49G1o55bUvs0dz7UI3resAshfnsjkOEyiMp0IWq+Pb3+PXmpJFiyjJ8C0ajhadi23HQ3BmwoXqDAKAxXUDe6wA75jx0PG9KTrDzi1KN4Xkyf6/TgfGY54bR6b9JvqFgNpNph4sBxh1h0xdgwoYLrE5FymPeq4HcHbFahFC8gWDXrfZEaVSx99FSbwQhBZQWB+LIbHCd+0rliIcZCIQD2y1yPF+2wRed+ruyPRF2H/tHVWTCV2pu9HMVp23uYdd0sgJfGAHKW/zCGjxiEUhtPv2T8cFnJRA7vp+pqN5cZAxJvcidKwG2+19NraIwYar342hAoj0V46R5xQUAV4JXeiybbm6ok7pCH7smeZnwHpDFwK5w3z+ngiQOByLx9HOs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(10086099003)(22082099003)(18092099006)(18002099003)(6133799003)(56012099006)(10067099003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?wEkBKeuy/XKIPKzsFmv5jiUru2+tFo5IuMnlvzLkirR0RKFGrweGbyoBC8?=
 =?iso-8859-1?Q?0Pd9CgtGiU3zVc3iX1/UrtWj/0EKoJ29ETXu0T6JceNm6DjT+ZSgBxhhz7?=
 =?iso-8859-1?Q?GidcTYau2GS3pid655cU4Q77wjJrWpxayDXyxDcfc1j5tlF0vWCbYyUEOk?=
 =?iso-8859-1?Q?0zJWHiPCFD0J/GBIwJW8DlbGaZxbxoSG93917fLbc/+EOV2v3NTKou13Il?=
 =?iso-8859-1?Q?H0+2tbd8bhdpgCl9CgtIrWisGjRLd/XCK9PcKAE2AIzN+UvHR4Gbfca1g3?=
 =?iso-8859-1?Q?0liJ0sOcAd3EZ2YMvD85kF8Yd7qRhuquPRO4aZA+761dA/fq7E+iCzquBx?=
 =?iso-8859-1?Q?Sae2UwVHtYMZnNBgVVV6ujNNCA157QglVxK98zZVYi7b+Ygwj6yqBAG8yE?=
 =?iso-8859-1?Q?vnwSg9sAR4kFChPiaAI4hMKqfQQXah2Ubd1yBivMfbtEADTHN3QtD9HIvq?=
 =?iso-8859-1?Q?+LCv2C5Cm9aJH4w3M0llpuYawrmq/Lj3zWtIVwve0DeBZhYVsNi0zi1Jnc?=
 =?iso-8859-1?Q?qBdJNE9I7KV1TEuI1CWTSz6nXWhc4RizNFlTcoqefHhyn1Ab+dvVvJ+lDo?=
 =?iso-8859-1?Q?Mn4nN7eQzOIQct/vCr88tcdHo2Qqk1rsWJ2ZozXUIU+lUTTu9+tSEw++Qj?=
 =?iso-8859-1?Q?63GCuDwZ2ANJQR+umU1ewu70pRo3BCDgbonhqY/QuLpgkUNx6LLfCTOV9F?=
 =?iso-8859-1?Q?5Ql7H+kk9MEwxKcIPuWd0Vck71V8y7u+fClrxrW9RSUUd+ajgqN/oZKdVX?=
 =?iso-8859-1?Q?bCvPLU2mvwdbNpGmkNw4THqQyFSQ6cIHUfITRpnB94XPOQ83Oa4g+V4TCz?=
 =?iso-8859-1?Q?ivwLTcyDInZYC/fxuiFwuSHTJFQn/uqTdILXVKqhDjDHIP+462QvRjWb9h?=
 =?iso-8859-1?Q?/6HGa7A7mt8Is3yta3QIFDSn/jsojJM+NSMnRC8115/aEWDVod3ijUYr6s?=
 =?iso-8859-1?Q?RF1XuIMK/LMmyocsMjrlUiKi6mGyU8oiXse6q9p25Fo4hI/I5L35/NPwFP?=
 =?iso-8859-1?Q?kKnkPhtyz1wRUNO4LIJ2E/auB4u7otO2YGsVkOHkIdY1RXxEIp4AxoW2t3?=
 =?iso-8859-1?Q?kj+RlacSF21rqtuICIiHFElCIztvywDZF1EK2oKXAr3jgtDlA7o4yyZuSy?=
 =?iso-8859-1?Q?/hlQCnsTfDsAByk8slXoMXLAAHplxp3KWMlmFb4wzH7uMcuowWEXy1tiuh?=
 =?iso-8859-1?Q?oP56ZuMGPnERy0V9n6YTJrbGkrMFMoibbfKdA/8vJ8+jPAGergdh+CGRe2?=
 =?iso-8859-1?Q?klFWZOALj7xRerIlb1UZ5e6G0tmUeNpOtaUmHmQDWYMrXL0bxsLb+H0zTO?=
 =?iso-8859-1?Q?c2HeW97mTzQ3X6Ixx+HXdbxnIusZPNVNQoAzBc7s3alNX4xE44YRIF6Ywr?=
 =?iso-8859-1?Q?Quvomrx+gGOtb/ukCrAs3CMvk7CO9EdMNzOJYJPehUy+7vrd0FvpKZRETu?=
 =?iso-8859-1?Q?XaspIv7M054FiCUiQGUhqyKSHDMZm62U5WnHzpDZ45wv6WMiaFgDIo8ny+?=
 =?iso-8859-1?Q?YSbZQM8ubq+MRPr+hM0pFi7waWNQCWDZ93TGHMdI3m9HGjynJ2Kaxt09FU?=
 =?iso-8859-1?Q?DMJIC3BUmtkJaQRKCN3Hqy4O4EKyBiSPzU50Jeukv8oHKziXg4h4Ck8Yun?=
 =?iso-8859-1?Q?0FWu29wkNaZ1ICFp/PrFMGhMSyj3Zr9owTuev2s1KueXxpMATteOJ81AW+?=
 =?iso-8859-1?Q?K3YmXtYdMQqdDl0o9mh31hxn5AGy716Dt2HgqzGyZwteOVz5AB2xhxJB4u?=
 =?iso-8859-1?Q?y6arWMtM1XXu+wHfqEWZE392l/XW14PkS1a6y7ZY7QUnzZ1fWcY7iGuX2T?=
 =?iso-8859-1?Q?KRJLOSJCZA=3D=3D?=
X-Exchange-RoutingPolicyChecked: n2WyIvFYj/1VgIJ9G23i+4lqwEHilQR09Ey/rgca5Hpx4/zCOOJWGyD9wj7j5zzcVESuHPZS9X5GC7gyegNSuXjqrvKjf2MtEZaPNAcEssz+n1K1Jw2rQmaNJPBJPmNIK8l+eGOtkZwCHcx6BkJ1G5S91OIt3en+wci0vCAqYA2qwGBmH/wcuvS/eb8/mKWK0SCCOUHiGiRQosgRIGOh76K9+nV85ndn8oGZifYz1n2VcfbKAPvaqWb54VhVHlRpjybr00cvtsBHOeOKMfgd4kPXeLQPTzQ8QGrqWVdxcTOlLdDv5CQTes0La0kOLr3JNxmJqQ3Ybd9t2NtCiCt3MA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8517a938-af37-402a-c97b-08dee2fe62ef
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 05:52:14.4239 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lSvMcMBmhholTIc9Nt43nfLKdZoHOPKwZ6IvkLYzBYB+34dslhjkFeuWw2ANflOXrx80FZhexkIKeZ9jWbtGqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4552
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

On Thu, Jul 16, 2026 at 10:44:13AM +0530, Arvind Yadav wrote:
> Add a debugfs knob to wedge the device on the first GPU page fault.
> 
> This is intended for debug where preserving the faulting HW
> state is more useful than servicing the fault. When enabled,
> the first page fault is printed, saved to the VM fault list,
> and the device is declared wedged without servicing or acknowledging
> the fault.
> 
>   echo 1 > /sys/kernel/debug/dri/<card>/wedge_on_first_pagefault
> 
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_debugfs.c      | 42 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_device_types.h | 12 ++++++++
>  drivers/gpu/drm/xe/xe_pagefault.c    | 23 +++++++++++++++
>  3 files changed, 77 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index 8c391c7b017a..d22f73241d89 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -564,6 +564,43 @@ static const struct file_operations disable_late_binding_fops = {
>  	.write = disable_late_binding_set,
>  };
>  
> +static ssize_t wedge_on_first_pagefault_show(struct file *f, char __user *ubuf,
> +					     size_t size, loff_t *pos)
> +{
> +	struct xe_device *xe = file_inode(f)->i_private;
> +	char buf[8];
> +	int len;
> +
> +	len = scnprintf(buf, sizeof(buf), "%d\n",
> +			READ_ONCE(xe->wedge_on_first_pagefault) ? 1 : 0);
> +
> +	return simple_read_from_buffer(ubuf, size, pos, buf, len);
> +}
> +
> +static ssize_t wedge_on_first_pagefault_set(struct file *f,
> +					    const char __user *ubuf,
> +					    size_t size, loff_t *pos)
> +{
> +	struct xe_device *xe = file_inode(f)->i_private;
> +	bool val;
> +	int ret;
> +
> +	ret = kstrtobool_from_user(ubuf, size, &val);
> +	if (ret)
> +		return ret;
> +
> +	WRITE_ONCE(xe->wedge_on_first_pagefault, val);
> +	atomic_set(&xe->pf_wedge_triggered, 0);
> +
> +	return size;
> +}
> +
> +static const struct file_operations wedge_on_first_pagefault_fops = {
> +	.owner = THIS_MODULE,
> +	.read = wedge_on_first_pagefault_show,
> +	.write = wedge_on_first_pagefault_set,
> +};
> +
>  void xe_debugfs_register(struct xe_device *xe)
>  {
>  	struct ttm_device *bdev = &xe->ttm;
> @@ -617,6 +654,11 @@ void xe_debugfs_register(struct xe_device *xe)
>  	debugfs_create_file("disable_late_binding", 0600, root, xe,
>  			    &disable_late_binding_fops);
>  
> +	/* Debug: wedge on first page fault to freeze HW state for inspection. */
> +	if (xe->info.has_usm)
> +		debugfs_create_file("wedge_on_first_pagefault", 0600, root, xe,
> +				     &wedge_on_first_pagefault_fops);
> +
>  	/*
>  	 * Don't expose page reclaim configuration file if not supported by the
>  	 * hardware initially.
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 022e08205897..c208b99fc577 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -530,6 +530,18 @@ struct xe_device {
>  	/** @min_run_period_pf_ms: LR VM (page fault mode) timeslice */
>  	u32 min_run_period_pf_ms;
>  
> +	/**
> +	 * @wedge_on_first_pagefault: Debug knob to wedge device on first GPU
> +	 * page fault instead of recovery, freezing HW state for inspection.
> +	 */
> +	bool wedge_on_first_pagefault;
> +
> +	/**
> +	 * @pf_wedge_triggered: One-shot latch preventing repeated wedge
> +	 * handling.
> +	 */
> +	atomic_t pf_wedge_triggered;

I'd scope these variables in sub-struct somewhere.

We already have this in xe_device:

546         /** @wedged: Struct to control Wedged States and mode */
547         struct {
548                 /** @wedged.flag: Xe device faced a critical error and is now blocked. */
549                 atomic_t flag;
550                 /** @wedged.mode: Mode controlled by kernel parameter and debugfs */
551                 enum xe_wedged_mode mode;
552                 /** @wedged.method: Recovery method to be sent in the drm device wedged uevent */
553                 unsigned long method;
554                 /** @wedged.inconsistent_reset: Inconsistent reset policy state between GTs */
555                 bool inconsistent_reset;
556         } wedged;

Seems like a good place.

> +
>  #ifdef TEST_VM_OPS_ERROR
>  	/**
>  	 * @vm_inject_error_position: inject errors at different places in VM
> diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
> index dd3c068e1a39..82496c5511b3 100644
> --- a/drivers/gpu/drm/xe/xe_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> @@ -299,11 +299,34 @@ static void xe_pagefault_queue_work(struct work_struct *w)
>  	threshold = jiffies + msecs_to_jiffies(USM_QUEUE_MAX_RUNTIME_MS);
>  
>  	while (xe_pagefault_queue_pop(pf_queue, &pf)) {
> +		struct xe_device *xe;
>  		int err;
>  
>  		if (!pf.gt)	/* Fault squashed during reset */
>  			continue;
>  
> +		xe = gt_to_xe(pf.gt);
> +
> +		/*
> +		 * Debug mode: if armed via debugfs, wedge on first fault instead of
> +		 * servicing. Dumps fault info and freezes HW for inspection.
> +		 */
> +		if (unlikely(READ_ONCE(xe->wedge_on_first_pagefault))) {
> +			if (!atomic_xchg(&xe->pf_wedge_triggered, 1)) {

Do we want want a devcoredump too?

> +				xe_pagefault_print(&pf);
> +				xe_gt_err(pf.gt,
> +					"wedge_on_first_pagefault: freezing HW after first fault\n");
> +				xe_pagefault_save_to_vm(xe, &pf);

xe_pagefault_save_to_vm isn't particularly useful, as it attaches a
fault to the VM that can be retrieved via an ioctl, but wedging disables
all ioctls, iirc.

> +				xe_device_declare_wedged(xe);

xe_device_declare_wedged has some issues with directly stopping and
starting queues in the GuC backend. Those should probably be fixed as
part of this series, as this change will likely make that bug more
noticeable.

See xe_guc_submit_wedge():

1353         } else {
1354                 /* Forcefully kill any remaining exec queues, signal fences */
1355                 guc_submit_reset_prepare(guc);
1356                 xe_guc_submit_stop(guc);
1357                 xe_guc_softreset(guc);
1358                 xe_uc_fw_sanitize(&guc->fw);
1359                 xe_guc_submit_pause_abort(guc);
1360         }


The above code is only safe to run on the GT ordered workqueue. I have a
Jira somewhere to clean this up and add some lockdep checks so we can
catch cases where someone incorrectly stops or starts queues.

As a quick fix, we could simply move this code into a work item and
schedule it asynchronously on the GT ordered workqueue.

Matt

> +			}
> +
> +			/*
> +			 * Do not service or ack. Stop processing this queue so the
> +			 * captured state stays close to the first fault.
> +			 */
> +			return;
> +		}
> +
>  		err = xe_pagefault_service(&pf);
>  		if (err) {
>  			xe_pagefault_save_to_vm(gt_to_xe(pf.gt), &pf);
> -- 
> 2.43.0
> 
