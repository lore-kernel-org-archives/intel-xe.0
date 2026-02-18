Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B116E9A02C
	for <intel-xe@archiver.kernel.org>; Wed, 18 Feb 2026 22:26:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CB0610E643;
	Wed, 18 Feb 2026 22:26:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lWrOVroJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 979F410E674
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Feb 2026 22:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771453581; x=1802989581;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=jtk0RQHltwyO4X5mYtOazu6hr6OhK+1bmk5aIgKH0Cs=;
 b=lWrOVroJg2nomA9DTZ1pzq/5Nhgihrmseoy7+piSOHumDatGr88tE+KV
 C4wz0REXiwTkq6sOL0jp4FqB96Woyw9+jB7KhAbNIVQMTmz0dh1BqoZOm
 CcrQ227ndpYER23yPiXo8T9vEbTymJPxMk+XH2aBmKPevFnK3npebcB1A
 /FRY3q38gPuIpTYXFICvlUth/ba6sOTsVdJO3yugbVsuzn3kIbSXtxiap
 n0Nn1zV56gw6/rKqpzJqah2mxOuWI+9aufsPPVaE+EbXQy1RbvvO3FSIe
 FObT9qgk5SPSJ93hY0tFfkqk0cY5VxTKIOMKmkHMiQIAdTiMsbZiYrcJY Q==;
X-CSE-ConnectionGUID: hlnwCHjBRNesZCbkEt4O/A==
X-CSE-MsgGUID: dVKmQVyVRJ23uzIE/+tuwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="82864095"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="82864095"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 14:26:21 -0800
X-CSE-ConnectionGUID: A8c1Gqk+TOy89rxk9nf0yw==
X-CSE-MsgGUID: zc496jwXRn+H0gqptOERwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="252023836"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 14:26:21 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 18 Feb 2026 14:26:20 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 18 Feb 2026 14:26:20 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.1) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 18 Feb 2026 14:26:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QSQsJzNrhcoDCnnLfp84HgdzKD0uwbLyVU21kuHTM+k15S50XPxR+6uCpDTofqKqO1aAs+BXlBV/1DXY3X2KQtj2aHSTmi42CE9gpwTdxlfQ4GOZxVGNZAdU7ob53LVckgA2JTnOL8RvlAqeI4cJFn7OL26l29vcp/IslXa2V/C4rh9IwyC7T2QqHKw4VThs/3njjIdGDQ95CgPpUAntWP+FRwVcrVCNdXUj7Cm8qICJuoxdu3s0AZsMixQSBLfa++1L3h4jh4H5NHrBnyu0FEhRR9u4uutpyCUhB4o1LkL/ZSaalRI0Y4MdnGsVSWvr/HtcayL7UpzlfwRbhNYJ5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ymggaxU9WcP0kO0d5Yg3ynA8OOPfROw95YCaJubc3Vc=;
 b=v77VMTlyTh7lw3mXgvRR3Rg8e0cthP+4mAIy4ft12IJMNzp2E2sEjAGAFc+qzLVm8oSSoG0Kka0HNtHWX/xH+jTem2otQVDrqWfbcK6uxRCnqxGwrdzonYzzp+UzOYMIWVIE02M8qz2rZqxfy4cFY6ofTh0ThuYoj1NXy2vN/N/9g6Bdezut7ycWzZEvzj/+IrXd008ayBr/V3FzqGOse9E/kwGnmSlr1dpApg8HYOkZ8SOk1bHGGvTW4mmSiJDnH+Hd8RUZE+O8VfEhk5dU6cPNpZ9PCU6UJiG4q9E0bXQ7Be7DshgSvV4yCDmSISL00OuFJ8V84W53T9++zQl+ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by BL4PR11MB8871.namprd11.prod.outlook.com (2603:10b6:208:5a8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Wed, 18 Feb
 2026 22:26:13 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 22:26:12 +0000
Date: Wed, 18 Feb 2026 14:26:10 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Harish Chegondi <harish.chegondi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Dnyaneshwar Bhadane
 <dnyaneshwar.bhadane@intel.com>
Subject: Re: [PATCH 3/3] drm/xe/xe2lpg: Extend Wa_18041344222 to graphics IP
 20.04
Message-ID: <20260218222610.GX4694@mdroper-desk1.amr.corp.intel.com>
References: <4043a30d6a971cda3c13145e081e4eed7cc4e440.1770760591.git.harish.chegondi@intel.com>
 <6e66746246439249a278f3d157f06071d83504b6.1770760591.git.harish.chegondi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <6e66746246439249a278f3d157f06071d83504b6.1770760591.git.harish.chegondi@intel.com>
X-ClientProxiedBy: BYAPR02CA0056.namprd02.prod.outlook.com
 (2603:10b6:a03:54::33) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|BL4PR11MB8871:EE_
X-MS-Office365-Filtering-Correlation-Id: 60564807-301c-4297-d172-08de6f3cb918
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?B6Uo8M+cycD6vQfLdwrGH9sTZuCLBtU9e1uEB+IotFd0Y7/cE7WiU4tcLjzv?=
 =?us-ascii?Q?F0/8TsO/UwIM2EE5xZYfbJaRnRLKcsfiBcHaksZYBqZ2mFstjBJK8YaqhGyy?=
 =?us-ascii?Q?nbMRGI3fqIh7IVqBQgYVMC8nCEXukWXlsIzt3OQ5xh2eTI4q6OeFzVv+Br9Y?=
 =?us-ascii?Q?coZUYcLeTwRivUsqG7zho40+1UZ9T5FgedNctJ741RGWCR9ukTaEljbdKQDd?=
 =?us-ascii?Q?OlcOJsgptGiSaRd6/NDZnfvfnBgPUH7DveRC56Okjo5cJxos1Xw9zNJ4UA61?=
 =?us-ascii?Q?Z/IeHRPAcLCIY59MogTGPdWuw0CUZh3RQENmIiZr58D1OXwFIHdISv4yP2I9?=
 =?us-ascii?Q?oHIerPQ2IAqZzjN+lscLhjdLBkFzA5ip5kYREZJmANpm9dFL9EEgPHNJGf9P?=
 =?us-ascii?Q?2HQuNw+8QQgYOGJZYJJvAVzQvBB8frviRnEwoVbBLZqtfAk42lH+N51XTjIM?=
 =?us-ascii?Q?2MPTGwoDIrLJ5rIQ34M//FenVjBPEG95B1lmD0dz/UugTzkBVHgwL9yMDegz?=
 =?us-ascii?Q?VkhKOgqIKIVM4Ruxh297jeEYbPY5S6cWk3cQDrZAWgqOKaNa48mqUIwt2fsp?=
 =?us-ascii?Q?YNVrjyuw/s2rBKESGKjnZAkhKjL0LSW5DP6ralTZroJ78yn6qZjpFZXjzXIZ?=
 =?us-ascii?Q?YV24F+wFBh7CgCeosgY8qze/3HMPlofn+D7ym4bxTHuCN4SfHxhzOc/tr9pB?=
 =?us-ascii?Q?aEOEalxpqvyTkaO29Q/DUxG5tf8mkwTX0PlBoFLU2EUE0/w7AkHoPVgtkwZX?=
 =?us-ascii?Q?lXKFT8pKz/vxQef4XGSdvajinRJyXCwTZWpSaXExlyrOpfJ2zZ2FDNLbkoSy?=
 =?us-ascii?Q?k7w8lIj69pY0j7H/2vPWOPWlqBuew3y3tjG4hbXTxGZpkEDRa9jdxK4jq979?=
 =?us-ascii?Q?Ns5NbV9F8cFL9vOMsUDl1dWJpe2qgh6IMK3RS0rW20LEA9J0en4Yl1O5WUKP?=
 =?us-ascii?Q?PfK6Cg8nVkP4YKxd7OQZVPNyhv4wX6ZBPssLzpykOjkznxtsI3QZll/bHx+1?=
 =?us-ascii?Q?4yue6cABMZFh186qcU3T0J9cPK5M19S/u9bUTS9jgzZFTG7ew/yDSdrEu4fs?=
 =?us-ascii?Q?D//zDlp9Veek8rNKdzUaCIOl/2ALx4dfzEghI6xEF1dmCgdWYYFHaYFy68e2?=
 =?us-ascii?Q?ZtcMeBZD/qrhKfsyMS5xf5uiuW3G3kjoCCmdJceBBRDw5H79ytJTnvlwXHUf?=
 =?us-ascii?Q?eYRqaeOQmHGtQjdjhAfcR2tYO+OH9VN65RYoouo0xt4Hvkk5CcHW4Z5PjXbZ?=
 =?us-ascii?Q?kl0HbJit59gzoMAy/ErA4UIMw/z9n4ll3lfwxSayWqNopw3qnomPDJa+PvEC?=
 =?us-ascii?Q?QD1nqxqohjeLAkWtLWvPi6bySy5IErY7G1qJIL0FrKLjrx6YHiewZcBf6fgw?=
 =?us-ascii?Q?BKphyZawQeoW/1PcEHoY3QUNoB1v62zg62Yjh3g6P8NCo24KKiDLyav+L4z2?=
 =?us-ascii?Q?YKMlpuM7u/0O98E//nMT9E6OSWEK+541/l3gjNF43kTSoP2N7vkHdhwSo1SR?=
 =?us-ascii?Q?AN2dmCqYc9diuBAong18zSRpWkAcXz/xc+OOs/tB/xOSIdUk0cN3AA+fJrUN?=
 =?us-ascii?Q?Byh3QniZZa1uAxfMT9s=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?R7qctwNaW8o2eLJhaqUxVW+ST+KD8s3/zKDxgPTGDDHuq9z2vEBKPPTOHkf4?=
 =?us-ascii?Q?/taAcfIgepiIb8M9ZLfa1d/TLEWILGW5eUdmijpgBIAw1TL52X4xn7Visu9A?=
 =?us-ascii?Q?zhX5uc4EKJxuLcydFdwCbxVnbSFAtNTRzrlcIJCUyPH6Ze5vM2oXQI9Tc+Gi?=
 =?us-ascii?Q?jwunlq9fQoSIxyHcvuxpx6O2/yTzxtWJSWp5XvEGwBa6Z32M7uDmoa2K6AY4?=
 =?us-ascii?Q?rv3gwwVzZVk9re2KSXtF7us0LDfM+sIXNt7sQXxcZr/hADmf5bndMbQPhMUj?=
 =?us-ascii?Q?CwthVHcoZXwr1UA4UIPh03hTZig9BmTsWvvFyi814xVXPhvGYixeCPyhoroR?=
 =?us-ascii?Q?S5Gz3QcOY4h4GlRrzACNQfGERqk3IpPAl1g+o+uMdUoWPc+2zaLyMmxq+QsI?=
 =?us-ascii?Q?dq+9TfcXwRRlHlKcmGZZ8WVi/oHsw+a5exjQ/qAsaaudbGUyILREwOh59vSi?=
 =?us-ascii?Q?MNtbTXdJ2qpgCkBY/Dlf/SZ14SpFbN+D9+PhMwCkV24OMPpi1FVwF/RU2BVY?=
 =?us-ascii?Q?rPF1dGRBb7k/UyOYH8LVGJUy8xJCTFN4SIGDBMdtIzqQtUpnwsTOjrk0o5KL?=
 =?us-ascii?Q?CTcFEvDqCF+uyGa4wCV8oUOVGwfbtf0osgk5y/+qw+QTTIDVzK69++bKnin4?=
 =?us-ascii?Q?8RslO42kaMtrMo+EWEiAJCHmUSw0RL91ojiOf2Etw0nKAbPOBZMikVc5FumY?=
 =?us-ascii?Q?EX/1KbbhGmCkylVC78Qe5m6WwlbWdHkPkB67jDgad8jh8M8XVKFH35pPKR93?=
 =?us-ascii?Q?kIbQblIbm4VDRa9XRBrHxKIBQGOEWMjrytYFusHtCqiNcBSYwyzwcSmee88F?=
 =?us-ascii?Q?78dW/tq4npRqD+H2sW9BrsOzvMNFacxaT5wCjhvCIOnYUD+5KCj/ctvDO2og?=
 =?us-ascii?Q?9iRko+IO/bRupTkO0YwWWYd+oeEomu2UElpAwv7HVlC2Gtp0dQVTZ9BTXh5P?=
 =?us-ascii?Q?NNZqk47LtlZMWJtSWs+W9VDwb0d2ejlxLy/fUV0i8LmxeUuN0oh+6H5a46sw?=
 =?us-ascii?Q?FO6viZ7bwJLpwEIXyOYizeFpK4f3XNiBmGKgTG0H9qXTTUP9dSuzGPfRafIO?=
 =?us-ascii?Q?SoASU2HMi26E3btLDYvilzKAP2xtBCziuHhfPape9A7ZdRR6W7tIOjPnn+PA?=
 =?us-ascii?Q?qaVmKdh0qmLRRmn8o8J7J6hA7Exi3gRtHIxIjv5Vrlt6to4X5Z35aTO/2rOR?=
 =?us-ascii?Q?rL/CK+JSWnTNYH7dm/0azS3o9y0S8Bw3n5wyvU4USy4Cak2Fe5Ee9a1HtLRM?=
 =?us-ascii?Q?xz0OpIGamKLKsstJOTOSWjlUAZQ7f4qesCaQnweHUAHEgUOycCgBdgc0D0U1?=
 =?us-ascii?Q?eqOgipTGJ6USWP7Z73yMvig5FEqIFbAcwvlfD1QlhjrA3ylDFFZ3n/hdTPEu?=
 =?us-ascii?Q?q1xh3gF9c3qFiAUSxkmWE7fGtnw/+hjQ7SCjH+z28D9IZHq7GgcgBq5rg6mh?=
 =?us-ascii?Q?lD3zrLi9Km2TOLjMrsWJfQYARd3jE6MQQJ+qT/Vvi1FQRhI4Mxb9bQXsezc4?=
 =?us-ascii?Q?wR61pWXZXnSqwo3Hgr4TEf6KIUM+GMeeAb9agsZGpQDNTQjgXjgmvpHDqnq5?=
 =?us-ascii?Q?4uMALqbZUaVZoUztKEkTBWGC46IEpAZFHyLmCLEGQPaDtiI29CaoYm0Usws0?=
 =?us-ascii?Q?i2xBgeJdYbNe2nm3iVWxW7B+JYuGUt1I0XM5x04t5foaaqgWhFn2mHQS/EJl?=
 =?us-ascii?Q?fx+0YLvluHrxDjAIR7IF6lBIppWjRgV2YTeuuAVqOgstB6ZdCPUzdRHe55l2?=
 =?us-ascii?Q?0AyWhzq0tMG1UI+ghJRQtwFucXHh1DA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 60564807-301c-4297-d172-08de6f3cb918
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 22:26:12.8775 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8CwcscYDh0lMnpjehe/8ZuyCqPeLaXdNRpVyOkHaWXZnHBOrXPChpxvySQ3MbjfJaBhu3uNbdA8gWjcJPWYs+vOA8jO4crIeJudJmQHoh+c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR11MB8871
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

On Tue, Feb 10, 2026 at 01:58:27PM -0800, Harish Chegondi wrote:
> Apply WA 18041344222 to Xe2 LPG graphics IP version 20.04 too.
> 
> Bspec: 56024
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
> Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_wa.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index d512a9ca82fc..4360015c1abd 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -554,6 +554,12 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>  		       FUNC(xe_rtp_match_first_render_or_compute)),
>  	  XE_RTP_ACTIONS(SET(TDL_TSL_CHICKEN, RES_CHK_SPR_DIS))
>  	},
> +	{ XE_RTP_NAME("18041344222"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(2004),
> +		       FUNC(xe_rtp_match_first_render_or_compute),
> +		       FUNC(xe_rtp_match_gt_has_discontiguous_dss_groups)),
> +	  XE_RTP_ACTIONS(SET(TDL_CHICKEN, EUSTALL_PERF_SAMPLING_DISABLE))
> +	},
>  
>  	/* Xe2_HPG */
>  
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
