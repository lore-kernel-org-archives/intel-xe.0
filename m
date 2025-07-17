Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56DEEC83F1A
	for <intel-xe@archiver.kernel.org>; Thu, 17 Jul 2025 19:48:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16DA910E893;
	Thu, 17 Jul 2025 19:48:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mtcYFSQ5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E3BD10E893
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Jul 2025 19:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752781684; x=1784317684;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=kwxVPjIpUvlrLF/tmsQbbMeT/Ty56TqLr9ytoJkufxs=;
 b=mtcYFSQ5r1TSdOKn2tQQew1G067PPu9R3skcslAoYh5HTwUCaYlJwtPq
 12n8/Sn178IV9shOQE4e6De3/sA5bsuXGRhiLkX7CRZdJfNU82iAqFYsP
 vfieeskxjNEFpPEtmknIURUFyyEeEwrEUaly2satKDX1uPtzzShOricz/
 vZYTqSYfKuMUK78ep++HazaSSqe0wrCBxPE0dLE91ZvzKAY/9Xnm5BrXT
 Hs/gaTxDuxIkNpfHuLB2WjA7OEaP0NcBUo28D6DLgjEjMUCBxBkH51BPz
 E1E0qQA3ILy70KaviS2dAYM5WFBY9LJLoU5BBgo9dNJOzoBrLI9oCDx+l g==;
X-CSE-ConnectionGUID: tSIvRTvSR5mTekGibx1WwA==
X-CSE-MsgGUID: nErOP7fcQsCrUoIynUFznQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="55012537"
X-IronPort-AV: E=Sophos;i="6.16,319,1744095600"; d="scan'208";a="55012537"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2025 12:48:01 -0700
X-CSE-ConnectionGUID: HLcNeQ/TTWqVWzZeQywXZQ==
X-CSE-MsgGUID: ZE96RVXhRkqO2uJHSmA7JA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,319,1744095600"; d="scan'208";a="162179459"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2025 12:47:54 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 17 Jul 2025 12:47:48 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 17 Jul 2025 12:47:48 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.41)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 17 Jul 2025 12:47:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sRdoZTwtErm7Rt+95CphNwSKlDDmnoJxP7Q6MfuCrV5lLsZ1ocsJvm9tBfEizKJ9qBaWW5tSw0Z7en7XKQeM99fIcR0PPnit044n5A7YZPoot6hEX0B6Kkgzm+46uwFBJu/8E1Ox4/YFDo4MN6dheuLrfSWRXmLJQ1uiX8qWzYicruDMVomoiu8WREa8nG/b9VtK3itxG6JTuNUp1jjHa6hhOYdIlGYnt0+PXvrLKqkUEWc/r1FjrmJyp5DAkdtPUEQF7ia/fbEZqSvy9WuRFXr+KyYgj5AwwYd2BlrjYvMpnvlqk7LlbvnaC+d2k6q315FKVfYvNxZvZ2zavYJ+Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bHftNzDZHJ+nTSeXdGeiObFQaIhBARYaOG3DnLo00CM=;
 b=pINu/9bMBuY1IPN95ZpuTSXdz/N4lobEkAHdBu22UY0FYovN29wdMKaAqqecYuSHcosOjdHwp0p3U/cj6UawghlKI/ZqS8FkYIKvxMj2fjiRMU4/1P5JkBYNz2uZMBpbRjt3hBnjpfBqO8unJ9jBbqE27x6fd0uMo2nQR2S19uySaBolaSozM/lA4xeP97AYTEAL+ryX0CjPttYhTyStp+liVIUum7lha98k5TxyvlBP1gWbXYmxNj0uJJ0Vkfg/lTPw1REXQsR9tscjSvrf7XHgXyApH2MOAXbEoP7/4xNQVyhXBS4I2nS9jS5wFADiOEvZqJuV3p4tcWMdhi+sXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SJ0PR11MB5037.namprd11.prod.outlook.com (2603:10b6:a03:2ac::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Thu, 17 Jul
 2025 19:47:17 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8922.037; Thu, 17 Jul 2025
 19:47:17 +0000
Date: Thu, 17 Jul 2025 15:47:12 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matt Roper <matthew.d.roper@intel.com>, 
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>, John Harrison
 <John.C.Harrison@intel.com>, Brian Welty <brian.welty@intel.com>, "Vinay
 Belgaumkar" <vinay.belgaumkar@intel.com>, Badal Nilawar
 <badal.nilawar@intel.com>, Sai Teja Pottumuttu
 <sai.teja.pottumuttu@intel.com>
Subject: Re: [PATCH 0/4] drm/xe: Add psmi support
Message-ID: <aHlTQBDnu5ZdfSgi@intel.com>
References: <20250716-psmi-v1-0-674c13d7028e@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250716-psmi-v1-0-674c13d7028e@intel.com>
X-ClientProxiedBy: SJ0PR03CA0086.namprd03.prod.outlook.com
 (2603:10b6:a03:331::31) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SJ0PR11MB5037:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fa030db-bf2e-4a0e-2449-08ddc56abc22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4DzmVkEwqYjp/uGqs6ctdCduqQVtvb8qQexoXMAzkf0worsYk9vE6eU84tMF?=
 =?us-ascii?Q?uuiBpG/ugPF3OVpVvJNSPjNgoViWIdfUYav1PcYsUmgksdZ7bqRZ5Bf01Ljb?=
 =?us-ascii?Q?VkS/CcNp+//w+tm/Cz2O5mjt+R6cVYqdVhh7kBTeB03MhIafF8F0nSWXGH2L?=
 =?us-ascii?Q?CiLmDfM+adHYIDoNDS+JsoLpAL7OyK/hdEeWQc/w7P15YF4wK00SRnp1C75+?=
 =?us-ascii?Q?eMv0QChfhF+7dQgN23vbPkZRQ5DGn3sC/Hcm3z7+NOmbW4dOSY39RLXbrTHz?=
 =?us-ascii?Q?Jf0Lmop4KRY06FB1tCIqJrqB5O8oXBpeiemuBQY4mNwsRiW4drBgBCIqdtRE?=
 =?us-ascii?Q?ety1Io1yixtqf+8Kh18MgGEBllDiyB/qNGm6VPDoSrPvQyhF1ccgJFbyV7zw?=
 =?us-ascii?Q?T+KJJlaAQRg8U6V5LpmiLg9dl2KHokjwOnYmNW1dMGlGEvtNaEu+5hLKA2A4?=
 =?us-ascii?Q?Vt3qLlO8nWzYu7Y3ipt/9By2+r1jIejKdJlXmqvct6m9YUoVpG6/M/x7BY5C?=
 =?us-ascii?Q?UZUEOBxUqgksTpyXXBOMCaNQtSDdew4EDgGNUv2IVSk8wiwOJF1gwrht8FIE?=
 =?us-ascii?Q?eyoWxbh1TUTdasOYEsY66FqO8HtDyfE8EGPM6xb80BEjOWywzpuEqlDWvuRj?=
 =?us-ascii?Q?k9JnxGteKcvWZqYpsxP2Lqtx8DH1lJqqCg1zFGdksqxbXodpggh9hz0rRNQV?=
 =?us-ascii?Q?L7yO38rH/ydxAANIayzAMISoHY+kewBuJkfRInYOxD5+Vxe2oegWZZ+lVN5z?=
 =?us-ascii?Q?dufCljkA3hH1B6pYuH/xgHgZ000/aqokDmC7AWD7f5V7S30Rvb6arBrdVToc?=
 =?us-ascii?Q?PZEmMAYIP3TBbtpW7YDMO4lbgfEcUzL32ndoHuzTZc6UkGGpKeSN0eLfAuOh?=
 =?us-ascii?Q?16VNuaSSSTTWDTo6P3N0ST08M/aG3EwvLMIH0Gl6AoLAR0b+b2H8rhQEOGor?=
 =?us-ascii?Q?pa+gRyyUJAsKhfFK6JFSUCktyEcFUiKL80heK/pArFWhja3p6qBcdemSQ0sp?=
 =?us-ascii?Q?OEoo3ebNDv/gqVZWaHmyXGcH+u86jHgNBpY9+iVm4G0B/9tfW2uEoc7R3S5H?=
 =?us-ascii?Q?W7jFaf74mJUTeS7jbq3GAo7QQj5yHtayf1qoH8ajg8jXgF8CfVLM9mi+jnER?=
 =?us-ascii?Q?c3ny3KXqy4laYLNQ7MT19POKNu2KHVs6wvAGmKrwBAALzhEN7R6Hhkydtg6c?=
 =?us-ascii?Q?mJPW0A25aLQnVJ+LgwgTXgYWt5cV27otHaITRpd6GNpji6xHEmNQBvWvmmAa?=
 =?us-ascii?Q?cSk9H5a7puIGlzrzbeO6fTDeXqPGW3UwxQhZkQLOPdl2voWHdppiHjzEARGF?=
 =?us-ascii?Q?exytMYDi8Ooj4S7lrkX9rC98JE8aD2m2eJyqqR5M0J9Qr1eQV8jukXNSIEub?=
 =?us-ascii?Q?zrlBn8TpEEaYR30WBddCoYVV7eXCHTkgbVwtC9NoeJY68bL5UL1AHIwAAcUN?=
 =?us-ascii?Q?4tz757k0hfw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7P7mfwP9SpdQvRwbgC6RaTcAzlJ6a0ujiTCKaf/G6Aa8Hwf80di/KE1d9RQb?=
 =?us-ascii?Q?AKvawMwG9SJfinaDlbl9H78THrnlXYhIXeduJ3JYjrk3MXZ5RjJsdo+KjRSP?=
 =?us-ascii?Q?LZ85UgnqSgiSFcQCi1I/+84uY+0NIbb21SWneCG2Yr0hPcVrZuUoELeOeroA?=
 =?us-ascii?Q?a6o1IgywZPj+R3i+4P55q2D8tiwt+mEcm6YE7jL2bt0Fo8UuxvdLMjiD3HPW?=
 =?us-ascii?Q?UhQiPBwylESDTT4Wj57euxSXY3KTDsGtFDd8OWURki60ck3qc9jICNeSAFb6?=
 =?us-ascii?Q?5Nxh1Bi/ndwzR6tdYS4FQ4RDFB8NSq29kjuIBxBJctg4VTnHBoRSrLN+R/9V?=
 =?us-ascii?Q?2fCg4qCG68ItmwPc1dQUGWUWW8f4oVfJSLGc3QAI+6UT2ZqewXJt6Dh+MJsH?=
 =?us-ascii?Q?YhBc8cJr6KQFw2/+CiTkTP2ujVIjld7aMk6iXlwNt0YqS9AnFaeF96O71fIg?=
 =?us-ascii?Q?/ufl1vOmvcv8Tk/fU9xCpugHr3hOYfTzXQg+si/NFriWRB2LjB6h6H7NnP7Y?=
 =?us-ascii?Q?wxwNIIfu3jRJ+c7ei3VQex7Y7iAvO+VG5zfUi/2XVtz+hdEeOt3zufWPA7i9?=
 =?us-ascii?Q?i0y4fUuySHcG2xcjXMnfMZ9qZPZYMCx/Xj2G2YMnST0GfEcDZGJd4aRwMmCA?=
 =?us-ascii?Q?3lzo28nt6BLx3NecUiqZvEGHGW1h2LFiCPX9eOXf27tZVyfLRoZfwNaZpDlA?=
 =?us-ascii?Q?/ZYUsmiKwTQeheyXRpxOD9unGLkOhojvMLTXKboYDA13baOvNmEqH6rsDCNV?=
 =?us-ascii?Q?08IAMmR4nKLTZtjhHBubFzy2eGtVm9WUU+QG+YsVjpIa9uDD4DMrveiF1I/G?=
 =?us-ascii?Q?rBaEW6Hth2FWxGLaYJzL9i409pVhGLofQp3TvfaojLTfagWYb54eJSACJrhT?=
 =?us-ascii?Q?IZS8k3BYNYx/Ta4m5jmc/2QWZv/sPn04WbSomTNQx9B9ap32yOixgQZX/anU?=
 =?us-ascii?Q?rlxxE+qt2VcjWrV993pCaCL/pJpC2bk2my6QbT2SLlrknxPtJDSjLfx8waTh?=
 =?us-ascii?Q?cyhcZwBf0WIBDH9bfGXAfujF/f74OIcbxU7FthF8fi+46HRnQkl7oH1rc6L3?=
 =?us-ascii?Q?VbK44gHM3b7xhK7rOOQHM+Dx9KGXTrPYPNinxTWi9BITy4eHdIrpy81MiIVs?=
 =?us-ascii?Q?Df6wqhNSXpEc+PmXoxGLf5diQjAZ4a88o0XZf7lacQC3AV8ttO7LtyittKOH?=
 =?us-ascii?Q?lVXzgTIdKQkaw4ghMKOYqgIBW7EUNtU7u50ywo8aS+qva4YpZ5wiGUgMQrTq?=
 =?us-ascii?Q?V73Wzp/4FGDfioBpaRueleS1IVX/KnHitSqkrb2ilaGldM7rnMoYpsZjG1Md?=
 =?us-ascii?Q?tyePi2QsrChPt6re5GTL0cX/rVKiTOYQLShsXxujzHUJnF+BqT0h9YblhvGf?=
 =?us-ascii?Q?AaybnZ4t20/eP5NS54CxQYJc1fwN03Os0B+QEZUGIE54ImO45RZD7IdFhrho?=
 =?us-ascii?Q?p8y/+2/td2ULRDXT0g6fpcBtTSbhEZLHzpe9Ssc6vg30RvRqqYqBmjhkCYvg?=
 =?us-ascii?Q?zFYZZTu0gYKWIhFLqpnRTfFyEnvG1WydHxz3/nr3DXSW5MvSmrHesswuooWW?=
 =?us-ascii?Q?MOydBRnGWXoLyARTau8xdam+AIZMSkbcwASAJZy7?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fa030db-bf2e-4a0e-2449-08ddc56abc22
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 19:47:17.3399 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EZ3I59Q/EW9jc8gJatWl0IWbGwkdWMrNxxhWR1zuUlcOFFaPvVziU1lyXYE78bw/hAbn/jiEGbYyUdkSBBdLtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5037
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

On Wed, Jul 16, 2025 at 01:55:43PM -0700, Lucas De Marchi wrote:
> Add PSMI support to aid debugging. More information about PSMI is in the
> second patch. This brings the initial implementation to drm-tip so it's
> also easy to debug and enable things early directly upstream.
> 
> Opens:
>  - Expose the toggle via configfs rather than module param? I'm leaning
>    towards this for v2 as we may have multiple cards and want to debug a
>    single one. It also matches nicely with the latest configurations we
>    added there.

yeap, configfs seems better here.

>  - Expose the allocation request via configs rather than debugfs: this
>    would part ways with configfs being for early-init things. I'm
>    leaning against this and just leave that in debugfs

I agree , debugfs seems better here.

>  - Add match for RTP to enable WA only if certain feature is enabled
>    (like psmi): I'm leaning towards this so we don't enable WAs that are
>    not necessary in normal non-debugging scenarios

good idea!

> 
> I will start preparing a v2 soon with the items above. Opinions on those
> are appreciated.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
> Badal Nilawar (1):
>       drm/xe/psmi: Enable GuC Wa_14020001231
> 
> Lucas De Marchi (2):
>       drm/xe/psmi: Add setting of PSMI feature flag
>       drm/xe/psmi: Add debugfs interface for allocation of PSMI capture buffers
> 
> Vinay Belgaumkar (1):
>       drm/xe/psmi: Add Wa_16023683509
> 
>  drivers/gpu/drm/xe/Makefile           |   1 +
>  drivers/gpu/drm/xe/abi/guc_klvs_abi.h |   1 +
>  drivers/gpu/drm/xe/xe_debugfs.c       |   3 +
>  drivers/gpu/drm/xe/xe_device.c        |   3 +
>  drivers/gpu/drm/xe/xe_device_types.h  |   7 +
>  drivers/gpu/drm/xe/xe_guc.c           |   7 +
>  drivers/gpu/drm/xe/xe_guc_ads.c       |   5 +
>  drivers/gpu/drm/xe/xe_guc_fwif.h      |   2 +
>  drivers/gpu/drm/xe/xe_module.c        |   3 +
>  drivers/gpu/drm/xe/xe_module.h        |   1 +
>  drivers/gpu/drm/xe/xe_psmi.c          | 297 ++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_psmi.h          |  15 ++
>  drivers/gpu/drm/xe/xe_wa_oob.rules    |   6 +
>  13 files changed, 351 insertions(+)
> 
> base-commit: cd8f387cae3dc97c924db689b4849c83249c3b9d
> change-id: 20250618-psmi-9f270bf67895
> 
> Lucas De Marchi
> 
