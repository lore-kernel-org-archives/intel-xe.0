Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA0B7CEACD6
	for <intel-xe@archiver.kernel.org>; Fri, 14 Nov 2025 21:56:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70D5610EB41;
	Fri, 14 Nov 2025 21:56:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GMxSjGGc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3315610EB41
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Nov 2025 21:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763157387; x=1794693387;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=oM8H4SnrmLdJF19K40I2KoNMgPx/Bxn4CMw/SC4+q/Q=;
 b=GMxSjGGcFCVY1ihlaq1zLw9WzkO95vZBrY5cbJoD2ml7PbmoYY+d8gX4
 zSKIUg/wp+E6MkN4Y1Oa1vqtV/Qb3XsfJImJcO1xK5Zuf8QIJ4465d1OI
 5kXOfs4EIfeJD+ShYKS4BLoh2n12kt14amFFxkZuLZFtGdbHIT6pUvabC
 8tzPHcXQ0TD1kixbI3FwzrOdD8ppdobR6RxBu2WHb3K5mkIvyWLpyqlJH
 LkTCjriH//krmzItyqSvo6Ifm8LJq06Q10Cpe4P3eoUOBw8gy+V0oWihC
 7ocR9iW5QUyje293s9NcIPMBmzwUf/GhogKjejE4kswuNd5vRwWkxY9F3 w==;
X-CSE-ConnectionGUID: KWRBX6BIS1an57ozExc2RQ==
X-CSE-MsgGUID: 1nPTsKroS1qeg/I5o1F4rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="65291385"
X-IronPort-AV: E=Sophos;i="6.19,306,1754982000"; d="scan'208";a="65291385"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 13:56:27 -0800
X-CSE-ConnectionGUID: bPM0TgJFSu6+7bAweOKOnA==
X-CSE-MsgGUID: DkLPUewnSbyE/uHLhcTq+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,306,1754982000"; d="scan'208";a="213290716"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 13:56:27 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 14 Nov 2025 13:56:26 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 14 Nov 2025 13:56:26 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.3) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 14 Nov 2025 13:56:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xYMZwAcPEslR+TjKLv3LdpcZpInh2i5QWAVNJA7x6byGfjnrAs3kBWfxYGhXoxq8DWc2jeo39zoTPN2VejGRXmEn2wRG4c1M6idfaQl6X4ZRU3MvGj2Uj4rIIoCSGPg5ZNpprsvg4HVAERApiqcUJw1QmJ94E0PycVC/4DbUGynHWtMr9Co+cb3OYfkjt7bw/p3BoWIdhhReYFCsjT1z5xLjJSpPGwwUq3CjbCXLH/3Y6gY37zj4I/JCRHI67fEzq/bqogUsJ3dy76+fiB8lHI6H3n2FB7TF1KVGCyMTWFUymS7QaM6WFWY/Jp8vdgF3KZTSpAl3sSpXYDb8hbSDAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uDV23YStP7trlWPSZvmKWqNqtNUFDAOGrcMaVW9K708=;
 b=y2w8+YBnYzf1Zogd2EstGJf/FAMC5l/WJiENhft9ALRNTtH+3hGi/9wSQZEOLxKcPltFraDomDb3OWpRvijngV0EeJ07pkzx9ai9fS45KHbHOIQ33nVHkJQbFPhwEi0xl+jrR1/GXC5A4xuDxj/oHfTrZEEYy73ZXKKwvVDY/xbS+MbnhyjME+dgGuxRH92NxseifA8iew0TCoREU/9l2cMV7O4fLeJbLX+cHm2+8BKe/dueprrNgnvlUSAjwtif0gSar5hTopJTv67MCYygNTRkaaiq8MT8YuGPgTD6BmNX5p5gPSgyrCYj8IiXkceW1bp0a2pPhn7E/mSXlf2KlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by MN6PR11MB8103.namprd11.prod.outlook.com (2603:10b6:208:473::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.18; Fri, 14 Nov
 2025 21:56:24 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 21:56:23 +0000
Date: Fri, 14 Nov 2025 13:56:21 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Ilpo =?iso-8859-1?Q?J=E4rvinen?=
 <ilpo.jarvinen@linux.intel.com>
Subject: Re: [PATCH 2/2] drm/xe: Improve rebar log messages
Message-ID: <20251114215621.GT3905809@mdroper-desk1.amr.corp.intel.com>
References: <20251031-xe-pci-rebar-2-part-2-v1-0-c4a794a39041@intel.com>
 <20251031-xe-pci-rebar-2-part-2-v1-2-c4a794a39041@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251031-xe-pci-rebar-2-part-2-v1-2-c4a794a39041@intel.com>
X-ClientProxiedBy: BYAPR02CA0008.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::21) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|MN6PR11MB8103:EE_
X-MS-Office365-Filtering-Correlation-Id: 68f4abc0-83ce-407b-5e19-08de23c8a6af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?4OhorwFIdatCtGIGQzkO4334+tD/BQPq8t+sfdxLqcqp7xUaUrdrSIGk7E?=
 =?iso-8859-1?Q?pOLfHcF313zfVqR9opy6VJs/p+ldUta387kCfFQP7qnPIkY/+nB/usndRP?=
 =?iso-8859-1?Q?12iQ50elQgNbDSIdae6FrHLLH40z0nZhIaVeXn4CxSE9kBLDNpNlZUwTjh?=
 =?iso-8859-1?Q?d3f/DPpijJxpZAJEZazCJNnfwUs+lQXIVGW6yNhyxtQa1P17ovu5US+caA?=
 =?iso-8859-1?Q?J6gPNjt3V1bxOlQZAVy/cTQdPVU0Vh9GI5FJFF+kmsyKXs1rholKugNgAQ?=
 =?iso-8859-1?Q?mJ2Rxqmw9c1tWM6F3/gk9s4a5ladbmMJaoxDSsd7s+FHAG9nm9cadm5gxn?=
 =?iso-8859-1?Q?O5v2a8uGTemtCN8BaSKm2XYSNFa/jOPdwhy6opZmjIoYOegZtgyStK7zFq?=
 =?iso-8859-1?Q?L8OJOVsy2NNxkTTkhouZ4oAaS4gJMfAlOlaa3Q5G+3PlHsXsGNxlh8tyOA?=
 =?iso-8859-1?Q?N0HpWYQ8sIuYuJAsbZDb9mBrlM+0UIqMw2hZBCx4ZvhS6zYm/TuHf5cDBe?=
 =?iso-8859-1?Q?civX+0o/7ES6TJPAwQEIbA5fbXICa1L2FPcrVM1DT4kbMqy6kZRuhbiFg9?=
 =?iso-8859-1?Q?9pm7/BOIsggjHPJ122k8OuK+WzQt99eC2Hu7ILiD97HiSUQ3tMw0SjVL4L?=
 =?iso-8859-1?Q?C1e40LZZqp5sEaGcnAlqXWhSrM2/8QH6XxT+fkhhb9UkyNwogK1SG649EF?=
 =?iso-8859-1?Q?3fsX8MyN8Qu//cJSL+WAaVOzcWMIrqvPskidCLoBJJ1tuv6BPxpB373kbR?=
 =?iso-8859-1?Q?bOzd6AJp3U9CauGDxqNTfnkY7roH2+g+UsqFkbaBQTak/8QkXeHJBwR42s?=
 =?iso-8859-1?Q?SlJK/+Tg4Mi3mUKiEPM6Sib171qIOD4XwJWzhZVSNzeHmPsT6JZz0+stFq?=
 =?iso-8859-1?Q?/dRAldN5DnRamWQqo3lyf4kgRQSCmMuo5SfN6ltQT9o/fQlshRJ0u3NS2q?=
 =?iso-8859-1?Q?xatDyc29PqtBnCib+2iF3z6FA36bXD99/5xKvrDptFAK/doISH64vcW0QR?=
 =?iso-8859-1?Q?dc16NabqXsojRSgNTIVeZgipMjUUvpJLpGc+jSR5gdNY4DEc3SxLrWHtk4?=
 =?iso-8859-1?Q?R1bsh5LlvAezKOFoyqNMGFFGHho1z8oU+eoH5Fwl7QeKs22vLmzoUrAKC3?=
 =?iso-8859-1?Q?BiL+j5UkUbGRKsSkbGc6ONpdr4x29Oyo0LeKkIhH+bGDZNcBEmRS6CEyL4?=
 =?iso-8859-1?Q?U8HMfO0DM6bmTxXQk4bBd9cfd4oBPXqGSEzYvy3yeOxF+DHbhSLHhivoAG?=
 =?iso-8859-1?Q?ae3Ov9Umv7wR3/jeaeEWOVLMJ5pRjXfnHbAmEV5A0jzZIjcusMBGukb1P7?=
 =?iso-8859-1?Q?sjM9Ei7LGbdzXU1qfRzNUrQmcPOVYNY9RH1ogPHF7WslPmfCY/eKA5yu/V?=
 =?iso-8859-1?Q?46PAWhmioGDyi0xQtZ3s02RYcd3RGdP2EHsh25nxXY9fKSenn5bWsNbIvI?=
 =?iso-8859-1?Q?KBIH98T0vaEdETdanBMB0RNHHXQINLfE5NRbOUlnnKwPgL6c3ThPNWWk0C?=
 =?iso-8859-1?Q?WspBqj5L9M0oQHDRmKiJoe?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?2AOXrOlyzIy3bp9P4OlzMjiC8OtIp709z4sJU5kJvJkLN3IaNmbFyAtOrQ?=
 =?iso-8859-1?Q?03G4oFLJ2hqASPho5sSSO9MnauZsluJvUEOE2ZAB6uIEoHjh2dNksfJx6u?=
 =?iso-8859-1?Q?xE3OqmtRBOZ8sHUupWdFdlIIvk3rir9CQukSYwDt31rXnchomhwya59p5q?=
 =?iso-8859-1?Q?bjS1g84saS60bFs6T6TywDM7YYOKR+D0brn8njKGJSLsTh2EtKTfPU2zSd?=
 =?iso-8859-1?Q?Q9dYXfFEUzXyHJY+b9oq8apJuDRpEhuUouuak6Nwvgp0VX3HaZTJMJfifM?=
 =?iso-8859-1?Q?FILGRnND5YNAFfbxkjnLU2Rj3QemAtZWv6ThuVfTT6p1FytxPdGeT8hFMT?=
 =?iso-8859-1?Q?RGe0ZM/0wuEfZkYt1hLlU8yXnbb+i0urGKHnO0FJc+OuMirGf5iFC2+c0J?=
 =?iso-8859-1?Q?IL7CIV6LGvJD+GzPEUa63Ah8v3HbYSO731x84LUoDQipFNKl4Wl1OlBkJ4?=
 =?iso-8859-1?Q?PFkeer9gcfprzGzkox2pF+qOVaxxzoubnR1hsS312SIpamTizsJlGQaWYu?=
 =?iso-8859-1?Q?2d94vPCctRXeeWRoA/cB2KghwRv/xTL/FG62jhpYbSZXWNCNV1a+4BPby5?=
 =?iso-8859-1?Q?Tp+XeVfDwm460+aHESJuBjq4SHJuksZN7m9L+9q8GSOH4hQ8GXywWkrdEt?=
 =?iso-8859-1?Q?i+2tYWOFm7ZSJ+gtWAS6sn4O2MVJqua44JcW/tvLV/6p4sktLplVz0j6RF?=
 =?iso-8859-1?Q?Aqftnp2MjL97FNl9Tn5T3myhi2SmbWH9cGWqQzf8ePia+GeW0Z3y4PWozH?=
 =?iso-8859-1?Q?1qndhdjorhc9wGYzQbEJC/9ZmrWw9K3OUuRN6VKGrxgsENTtF59nG1ye1U?=
 =?iso-8859-1?Q?NbxChJDK7NHv4+nix2nIXKDxZlslj+znFulf8tpQi49iEZE0sYVfYMrwK/?=
 =?iso-8859-1?Q?FWnHBkaNfaxNSH7crVKwzeJGgiuW7qJ8KZAMX8K2WbnIOVv/hGD8gnXL2e?=
 =?iso-8859-1?Q?5qqiPhV3sLplmgM9TPjWUZI2nr6BjEl1DVTZUx56t4Bha2rbU2Bb048Zwb?=
 =?iso-8859-1?Q?gu1CO5doDOt+HL9hpxUhlWcaPZ2JpUsel92uUEDO7PkzBVYuIlD46FBzcY?=
 =?iso-8859-1?Q?24/smp2NlXOIUFsByEuCwlncfpLGvL0sH8KM05SgGMjCseMFRZod0GqVs6?=
 =?iso-8859-1?Q?j771t6Sdv/Gi6tMW3AVTda67Xu9lnrnRpA+c27g4JmaqP45P77wNhkz5xc?=
 =?iso-8859-1?Q?DrRAbSD5iQS5zT8kN/lm7b8Dyc3huSPBNbZwX+Qo4TBIra/WhTAEDjvBpB?=
 =?iso-8859-1?Q?CQJIlvxmtgiGHs7IX2//t97AXkUvvzpQ63guKFryFNZ3NOyToqmKC45whg?=
 =?iso-8859-1?Q?pyuNWqCF/HvoKDM17QkYPE+VNpnRRD27KBSAOZlbdidWWktBc5ELA++bnM?=
 =?iso-8859-1?Q?j3e0nCAaVkFoR5mYh84u2jirJZQVK64p5d+R+ZrtKF1FXYYZV5xDAuCaCl?=
 =?iso-8859-1?Q?vS5jiH1vJevGLGeOwZMPN+oqOOSocEdnrF1NqBluASAegdetGRcwCZwtUD?=
 =?iso-8859-1?Q?zwqeOQfGb5O6SAj11haK+5Zu4KQ/w0trzX0h7IGtBhht/z3sTichRWNu8U?=
 =?iso-8859-1?Q?oPaEinHvIUnongiskHhGaIHMwPTZPrdo5+GiMasbotbzPWMBkBZfntVRs7?=
 =?iso-8859-1?Q?/RGdIUbrXVAqMtbBQf2ocdXLmMCVghoSsLQt58m9V7SRqZUKnw++ZW9A?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 68f4abc0-83ce-407b-5e19-08de23c8a6af
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 21:56:23.1130 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qYFxSqbYk7AawNy3F+HWqvhswAeLtX/Y7OihMS/fRPVZObLTxD8nW1ZOw0L0Mc2izqodyN9dsCpBjaZXmI9ssEW+xnSDzWpGGea/NKinUow=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8103
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

On Fri, Oct 31, 2025 at 02:17:43PM -0700, Lucas De Marchi wrote:
> Some minor improvements to the log messages in the rebar logic:
> use xe-oriented printk, switch unit from M to MiB in a few places for
> consistency and us ilog2(SZ_1M) for clarity.
> 
> Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Suggested-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_pci_rebar.c | 20 +++++++++-----------
>  1 file changed, 9 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci_rebar.c b/drivers/gpu/drm/xe/xe_pci_rebar.c
> index d21e29c95ca33..378447a3be0ca 100644
> --- a/drivers/gpu/drm/xe/xe_pci_rebar.c
> +++ b/drivers/gpu/drm/xe/xe_pci_rebar.c
> @@ -6,12 +6,11 @@
>  #include <linux/pci.h>
>  #include <linux/types.h>
>  
> -#include <drm/drm_print.h>
> -
>  #include "regs/xe_bars.h"
>  #include "xe_device_types.h"
>  #include "xe_module.h"
>  #include "xe_pci_rebar.h"
> +#include "xe_printk.h"
>  
>  #define BAR_SIZE_SHIFT 20
>  
> @@ -47,12 +46,12 @@ static void resize_bar(struct xe_device *xe, int resno, resource_size_t size)
>  
>  	ret = pci_resize_resource(pdev, resno, bar_size);
>  	if (ret) {
> -		drm_info(&xe->drm, "Failed to resize BAR%d to %dM (%pe). Consider enabling 'Resizable BAR' support in your BIOS\n",
> -			 resno, 1 << bar_size, ERR_PTR(ret));
> +		xe_info(xe, "Failed to resize BAR%d to %dMiB (%pe). Consider enabling 'Resizable BAR' support in your BIOS\n",
> +			resno, 1 << bar_size, ERR_PTR(ret));
>  		return;
>  	}
>  
> -	drm_info(&xe->drm, "BAR%d resized to %dM\n", resno, 1 << bar_size);
> +	xe_info(xe, "BAR%d resized to %dMiB\n", resno, 1 << bar_size);
>  }
>  
>  /*
> @@ -93,9 +92,8 @@ void xe_pci_rebar(struct xe_device *xe)
>  		bar_size_bit = bar_size_mask & BIT(pci_rebar_bytes_to_size(rebar_size));
>  
>  		if (!bar_size_bit) {
> -			drm_info(&xe->drm,
> -				 "Requested size: %lluMiB is not supported by rebar sizes: 0x%x. Leaving default: %lluMiB\n",
> -				 (u64)rebar_size >> 20, bar_size_mask, (u64)current_size >> 20);
> +			xe_info(xe, "Requested size: %lluMiB is not supported by rebar sizes: 0x%x. Leaving default: %lluMiB\n",
> +				(u64)rebar_size >> ilog2(SZ_1M), bar_size_mask, (u64)current_size >> ilog2(SZ_1M));
>  			return;
>  		}
>  
> @@ -111,8 +109,8 @@ void xe_pci_rebar(struct xe_device *xe)
>  			return;
>  	}
>  
> -	drm_info(&xe->drm, "Attempting to resize bar from %lluMiB -> %lluMiB\n",
> -		 (u64)current_size >> 20, (u64)rebar_size >> 20);
> +	xe_info(xe, "Attempting to resize bar from %lluMiB -> %lluMiB\n",
> +		(u64)current_size >> ilog2(SZ_1M), (u64)rebar_size >> ilog2(SZ_1M));
>  
>  	while (root->parent)
>  		root = root->parent;
> @@ -124,7 +122,7 @@ void xe_pci_rebar(struct xe_device *xe)
>  	}
>  
>  	if (!root_res) {
> -		drm_info(&xe->drm, "Can't resize VRAM BAR - platform support is missing. Consider enabling 'Resizable BAR' support in your BIOS\n");
> +		xe_info(xe, "Can't resize VRAM BAR - platform support is missing. Consider enabling 'Resizable BAR' support in your BIOS\n");
>  		return;
>  	}
>  
> 
> -- 
> 2.51.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
