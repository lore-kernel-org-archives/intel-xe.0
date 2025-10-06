Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FBFCCAC5B8
	for <intel-xe@archiver.kernel.org>; Mon,  6 Oct 2025 18:35:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F229310E321;
	Mon,  6 Oct 2025 18:35:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ig4J5xKj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD95A10E321
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Oct 2025 18:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759775749; x=1791311749;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=9z0c7k7E7+Yfc780FCmzFHKNrreMXbceS3DHOY46VpU=;
 b=Ig4J5xKj0q05pzmSeNAKboCEgyknMgYzq0XlUHsUDQ7DEN5LILKygo/C
 xSUy2+d2DoCqKtq9vCmufJ1i2R5uc1lHdNRMRjC3lY1an30bj05a1vgjK
 HCaOVavYynOAcO8hvGnS1/ksCYl3SarYDcaNVoDSYOgGLNKykZ3gt1C5V
 +D/GpYY3XtHfANrxPsOYW5o+4ui+dl8NIukm+8LTNra0JC+TFInchLe29
 hemqpXpZGw/+D9mICTT6po59B4lhAOIRoxvU4IAGoETo6htO3EmWJ1VG9
 hGf89Lo1Ev1zCP3fKoZd9RAbrPqq0PfsvdThcweJ7QugWIabL5W6a7vgb g==;
X-CSE-ConnectionGUID: sU8blC5QSe622DASvGuDVA==
X-CSE-MsgGUID: Jz7M7N1eQFWvF0QMmBR+ZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11574"; a="61997576"
X-IronPort-AV: E=Sophos;i="6.18,320,1751266800"; d="scan'208";a="61997576"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 11:35:48 -0700
X-CSE-ConnectionGUID: CpuSRbVFTxGvopa4hQH+fg==
X-CSE-MsgGUID: dmf26R3VSgiC+Hjq0/76rA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,320,1751266800"; d="scan'208";a="180384084"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 11:35:47 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 6 Oct 2025 11:35:46 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 6 Oct 2025 11:35:46 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.63) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 6 Oct 2025 11:35:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r3sVhe89oFeSuL6Ki5CJAqgsWFId4NbdgROMyDT2DuMVoZFJcJVZmKuGsVEIB8KsM1eNfmV4NAMplJ0MHeJaKDitP5Q3ipBFOkKa1ZDINgWjA7KQIqquu7WTPECIV1uJa/amn/MtkcnY0jbIJm3p35fk5+Zd48aE4eXKVDUPcEN+Xf85YzDBh5DUTgXc6gSwDaMcprbW+N6GvY7kouAJH7P6+Gnsrz0+fXzqPQWY2uh3WMXMXS5bDnrGSGdmxBz7Qsaa0duusCPuKjUEb7U7Qis/x0Lb3L7JKLjpnbFdcvfb0TmJIfAvosVc/mpigxpXYkMcd87OpV0CXtiKFHsJHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FtYQcTkyBJPuHBAueghE2I6C3/16ptDM+4AkovbPxP8=;
 b=RghRluykvPTL4p7zEoUiRd0Mr7VKGEnoPZ1dLIee9Li1cQmuriopzaaeaqlJIL4bo8t7mRkhR0z2NcSRlO1WL8DDvIbFSCVH69xQNB9W1yVChAXnrdzUnf0D+z4keMbAQOk4dPeuoLAjWahHvheF7S65dkpotWo1h2zql2m/fuiEka5oeI7TZx6gVAkwKspxof/T+6ZYFGAU+IhIQRBrlPEs37OVFULNszF5BZUK6sdli0XXKNMf4ljVOPyyrfY8n3K0466nIvRT8/Z2y2sUlLw+6tnjvOsxQCKIZ1Jwt9iirOlSUIgD7gqNevz3pW89X9cpkD+qGWMkWfIOnneHqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB8228.namprd11.prod.outlook.com (2603:10b6:8:180::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Mon, 6 Oct
 2025 18:35:44 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9182.017; Mon, 6 Oct 2025
 18:35:44 +0000
Date: Mon, 6 Oct 2025 11:35:41 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <simona.vetter@ffwll.ch>,
 <christian.koenig@amd.com>, <thomas.hellstrom@linux.intel.com>,
 <joonas.lahtinen@linux.intel.com>, <christoph.manszewski@intel.com>,
 <rodrigo.vivi@intel.com>, <lucas.demarchi@intel.com>,
 <andrzej.hajda@intel.com>, <matthew.auld@intel.com>,
 <maciej.patelczyk@intel.com>, <gwan-gyeong.mun@intel.com>, Dominik Grzegorzek
 <dominik.grzegorzek@intel.com>
Subject: Re: [PATCH 16/20] drm/xe/eudebug: Mark guc contexts as debuggable
Message-ID: <aOQL/Qz32Jwkh6J5@lstrano-desk.jf.intel.com>
References: <20251006111711.201906-1-mika.kuoppala@linux.intel.com>
 <20251006111711.201906-17-mika.kuoppala@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251006111711.201906-17-mika.kuoppala@linux.intel.com>
X-ClientProxiedBy: BYAPR06CA0032.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::45) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB8228:EE_
X-MS-Office365-Filtering-Correlation-Id: c5984d67-2cae-4b3f-2ddd-08de050728ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?46fYX+PdGPO05i5DrVacyiDl6PT78Agf3MvYuyYDkjJmZajGCxhDv6PxpP0s?=
 =?us-ascii?Q?oK7lId6ziqv5FuGNHLBk9ybNLjwVUGGaxKkZdPEakgGNVPkTIMLMi0aQ/PQj?=
 =?us-ascii?Q?FLTq2hBtgVZ4a68e0A/jMd5p+2FcKZ2tsrFZz3YAIcGSSrVrAGdRG2UAwkPJ?=
 =?us-ascii?Q?JfcdBDs3Wiw9xMigFMti8bW47dEbjqZRMhjulGgZyytzIWdkaBblZNLul84a?=
 =?us-ascii?Q?LpDqHTMzG0BEj2yVszHwDjh4dXSL6tf4nvul6uH1P0uM/YXPuMicuscRzMi9?=
 =?us-ascii?Q?IDPZuuT95ayMtKzExCUcdaZTtPNA5VS5Wt/55TFaI4te9GXk5jMX0J5fK8nv?=
 =?us-ascii?Q?3A8ACaNCMgZyvpWH+Fp/cfpyq1o8sS9eoz3DsPKLLJV/PnygTXhx/TBV0f/C?=
 =?us-ascii?Q?POfqaenp6vh3gTLRRm6B/dtwaLwQPX4hugMvWduSxRuCs6yfzTXGG/TeoVZH?=
 =?us-ascii?Q?j61pR2RecFwkOrA2CWp3PdKYXr8cGoBAM06LO1tw8X2VeVbm1tz/g11P2DI2?=
 =?us-ascii?Q?lDu6JChK6QQCPeT1LyTEe9ZGPrrdbUUv7X1sZfruQf04/kuuvmsPti5ykCfK?=
 =?us-ascii?Q?6afnyBFZi+CVXNaRnqxMftJ/nkNEEvvYSUZ5k3bJWB4SqDbtLoARk98cIcyF?=
 =?us-ascii?Q?H9qipUE//nMQtcZe0/Cs4XFu7ElNKq4CAsmNvSJB0aZyTvVnakfvY0ALunAo?=
 =?us-ascii?Q?/HaGdR4NnOOuRmlwjJa5W11Lx4JXhwVceVXfSRxs84oRAACWPHfPUQOOlkgf?=
 =?us-ascii?Q?A50yxYVOzMEBpWD6OUWluzGXWyssXTF2tIFYd+N/PNSoDanCEZrVlNzqTz0Y?=
 =?us-ascii?Q?5o1BToyx7rOaDfZwmANC3SKlFJ7rlNpuo9nOHlx65g1vhKl2rqfXKmtPB9Ql?=
 =?us-ascii?Q?G5DKIMECvXg5yX1uupT+FSTDoVptel0g+xdgyh3Q4w5ibdYzWqcC/5zsjJFi?=
 =?us-ascii?Q?5F+ye3AOGA4Zz3jw3CSpVid+usvcUqjIRnXzhA8OD1XqK/xgmIoaeFswd4O4?=
 =?us-ascii?Q?KYtVBPInTen5CXz9bgc5o5kjncc6RwHkFvTkBRFNVD5czVZx9ZGu+uNU8Xrj?=
 =?us-ascii?Q?lc6jp/WQFNxXp0fzhjf+pLFF8ZoIfZZ6dK9tYm2s/b/r7VRzEAmf/J4HFmg/?=
 =?us-ascii?Q?mtqoOu/TXtOHdbGbFbfYU1jFJ1qEfnmisNrSoWFMWqXOXGfTpHFDl5oBeVxJ?=
 =?us-ascii?Q?dUQRlYZ36owu4aos3M3zmcDPqCtufgGFwNJFRyr4oSo6sh44mfr78Hua+Gr5?=
 =?us-ascii?Q?r6eZTDnb6xYYRCWuR+ArowM/q7E/ip4SP17vLspy3MRyV06kZO36A+Qu/f/T?=
 =?us-ascii?Q?nxyIsHwQN5Ny0r0VYQj39NCtzgLvLwVIb0LBKu//dEaRpbNyc9d9y+qv7QwW?=
 =?us-ascii?Q?8BgVKhAUQFFGTisOy0gS8JUv5ezR+ku6yX7wBvDJNFY73BiMLqsGxTqJs5aZ?=
 =?us-ascii?Q?kQdDtI1sMpSVNd+QilFhBFCoZdrdOcJS?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lEpGXo0xraoMn9/Up7kJxymAMD3feXMbeIPUvE4Nsy/fCGuiYjIqYgZPgl0C?=
 =?us-ascii?Q?ob+Z/KRlFGTFkS8J9Uj55zEVL5f0pUUMB2+O2lbEisu6CQc/R9yaRVECNzYO?=
 =?us-ascii?Q?U5CDJa4kbQrk4Ak+5RC2tjgHeXATVOW+aIp++68z3EN7M3/0uw4g+KjtkqyT?=
 =?us-ascii?Q?reVGTJmHQVgXLtBXSuSn0IvwxTCwX4qGST4gXsPHPdlNkWW57mSxqAQQvUYn?=
 =?us-ascii?Q?MqahmCbkATDMoDwpywa1Mc/fzMeb7mbxiSKvwGjmp4GVVYOV9mP5NExRWDDU?=
 =?us-ascii?Q?sTVZvNvsqgHII+na0sGolYVQAl3qwQgW1qe6DQKdKm93okMrLtlf5YwZuGEl?=
 =?us-ascii?Q?Jw3F7AnSS6i2DhPdfJV+j/3e2GkV4oCT7ibUiAWRoKHhi/5bmjdYsczS/NZT?=
 =?us-ascii?Q?BqJNyYbMDLDjdqTt2VcwPa5ZjUmgC4Ve5vpKLVTGauRwa54kXEkvICwBz/K8?=
 =?us-ascii?Q?j7wiC7W4jr1hsKVoyh1GvUmQTtjQB0UalJ5T51kDuIFGAKzYqZzCjeeDbyAk?=
 =?us-ascii?Q?4Jkxfsh2AjvZSit/GQqVjki+a5lP8B3CAURUKeijIuVFEseDA70uDBNHfBjl?=
 =?us-ascii?Q?uxziJEAwcbcdn5vbwdxNmXPPxzMGXah885qU6ej889/PmizZOia6R5zkCGE/?=
 =?us-ascii?Q?FlRttDEYv4n3vCeTUskmH6jFSj1q9Me+EbIRko5ZwLFthFUJEULa6e8MK68i?=
 =?us-ascii?Q?30c4RTVrCw7zUyvehFlwEbFiTOwyLFdO41hYFsNsA4561+eoWc2CdO0Ttow3?=
 =?us-ascii?Q?b+CITuWPxLnDIHiSYevckOMNCU/foUkKWvuB0jzLf/NCExP9MpBpMXEz3lfH?=
 =?us-ascii?Q?GXt7yowaOKVHIgJnNf6LVcD7Bc7mKcnWfAKIQ3oAaHG1nmCzQriNzZZp4Lso?=
 =?us-ascii?Q?5CqdVix284Xn7rKtsQyijcnCa/O8Xnh2rDWPZcAgJOVh6kF8MK9GLL7b/vsm?=
 =?us-ascii?Q?WiIPvMKXqMZE2A6m6lUEWrpLAygcKTdJ7tt+LG8IXmMVbFTi1U1goLKAxsOo?=
 =?us-ascii?Q?q0SZpTGIN9430a6Wb45GI9HZc2/bKqK1UKUMo3hqrtaTa38/gaaXpoVW3p7U?=
 =?us-ascii?Q?s3K8lT36dzTzmhuqXGfqCxyx819KcxOMTxh/GC8g3H52WA9imYjWivopTSys?=
 =?us-ascii?Q?alcPSR/mf37Ice/8SCIsUBON6tfOsBplL+OS6/Ly4hCJS1KKUAog+iuAB/WF?=
 =?us-ascii?Q?UD/n7EL+gVzm92P9t8bOWEW0Bp/+YILj1oelSiFBZodIAtxXmpZnsx8AOhdF?=
 =?us-ascii?Q?lTeCkzU5HDTXw+FfFwezpoU47+kEbwk22U7I4PP1j20xfRyd+Kqiv2aHkT3t?=
 =?us-ascii?Q?9avWOmgMUh2F6Jak0xa7Jvc36g+5MkUEB0pq7YJH2FhsFybJJ0j9h0H5EwGv?=
 =?us-ascii?Q?J80/Bzb7zoQpqqwijMmzM8wAD1D6GTBpQx5ucCFIACSW5tBqF1+RkxkLHqYH?=
 =?us-ascii?Q?ziRetK8s0NLC2ZZO79NVjhFjLWxdYTp7xxynxhnPWTh8iBvGXQWFcQTaWOU7?=
 =?us-ascii?Q?dxn44TqLn6Yy8GtT4RIVmMOBdPsJetftR8yWw2pC5xsBIIwmy3kscLROIlXR?=
 =?us-ascii?Q?PHW5i+QPrmrY8YkdamWxI9fXLVVhHNpmwv23SQ77z0Ri2SkmaN5VH/p25ZtX?=
 =?us-ascii?Q?vQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c5984d67-2cae-4b3f-2ddd-08de050728ba
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2025 18:35:44.2513 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 92clwH30RAHJhWEUjkRBsO8ZoXV4ch+xvnYK9jFppxqvqdk8qf2ByPN0BZYhMqzainhqgCLzaxkWEhneMbyz2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8228
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

On Mon, Oct 06, 2025 at 02:17:06PM +0300, Mika Kuoppala wrote:
> We need to inform to guc which contexts are debuggable
> as their handling is different from ordinary contexts.
> 
> Co-developed-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> Co-developed-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/abi/guc_actions_abi.h |  5 +++
>  drivers/gpu/drm/xe/xe_eudebug_hw.c       | 55 ++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_eudebug_hw.h       |  4 ++
>  drivers/gpu/drm/xe/xe_guc_submit.c       |  4 ++
>  4 files changed, 68 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> index 47756e4674a1..32a5f680a6d2 100644
> --- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> @@ -155,6 +155,7 @@ enum xe_guc_action {
>  	XE_GUC_ACTION_NOTIFY_FLUSH_LOG_BUFFER_TO_FILE = 0x8003,
>  	XE_GUC_ACTION_NOTIFY_CRASH_DUMP_POSTED = 0x8004,
>  	XE_GUC_ACTION_NOTIFY_EXCEPTION = 0x8005,
> +	XE_GUC_ACTION_EU_KERNEL_DEBUG = 0x8006,
>  	XE_GUC_ACTION_TEST_G2G_SEND = 0xF001,
>  	XE_GUC_ACTION_TEST_G2G_RECV = 0xF002,
>  	XE_GUC_ACTION_LIMIT
> @@ -278,4 +279,8 @@ enum xe_guc_g2g_type {
>  /* invalid type for XE_GUC_ACTION_NOTIFY_MEMORY_CAT_ERROR */
>  #define XE_GUC_CAT_ERR_TYPE_INVALID 0xdeadbeef
>  
> +enum  xe_guc_eu_kernel_debug_request_type {
> +	XE_GUC_EU_KERNEL_DEBUG_ENABLE = 0x3,
> +};
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_eudebug_hw.c b/drivers/gpu/drm/xe/xe_eudebug_hw.c
> index a62c4b439888..cd4627705b56 100644
> --- a/drivers/gpu/drm/xe/xe_eudebug_hw.c
> +++ b/drivers/gpu/drm/xe/xe_eudebug_hw.c
> @@ -12,6 +12,7 @@
>  #include "regs/xe_gt_regs.h"
>  #include "regs/xe_engine_regs.h"
>  
> +#include "abi/guc_actions_abi.h"
>  #include "xe_eudebug.h"
>  #include "xe_eudebug_types.h"
>  #include "xe_exec_queue.h"
> @@ -20,6 +21,9 @@
>  #include "xe_gt.h"
>  #include "xe_gt_debug.h"
>  #include "xe_gt_mcr.h"
> +#include "xe_guc.h"
> +#include "xe_guc_ct.h"
> +#include "xe_guc_exec_queue_types.h"
>  #include "xe_hw_engine.h"
>  #include "xe_lrc.h"
>  #include "xe_macros.h"
> @@ -675,6 +679,57 @@ static int xe_eu_control_stopped(struct xe_eudebug *d,
>  	return xe_gt_eu_attention_bitmap(q->gt, bits, bitmask_size);
>  }
>  
> +static int xe_guc_action_eu_kernel_debug(struct xe_device *xe,
> +					 struct xe_exec_queue *q,
> +					 struct xe_lrc *lrc, u32 cmd)
> +{
> +	u32 action[] = {
> +		XE_GUC_ACTION_EU_KERNEL_DEBUG,
> +		q->guc->id,
> +		cmd,
> +		0, /* reserved */
> +	};
> +	int ret, i;
> +
> +	if (cmd != XE_GUC_EU_KERNEL_DEBUG_ENABLE)

Maybe an xe_gt_assert here instead.

> +		return -EINVAL;
> +
> +	ret = -EINVAL;
> +	for (i = 0; i < q->width; i++) {

I would double check with the GuC team if you have have enable EU
debugging on each guc_id in multi-lrc contexts. I suspect not given
register, scheduling toggles, and deregister H2G operate only on the
main GuC ID. I'm am however unsure as H2G 8006 is not in GuC spec I'm
looking at.

> +		if (lrc && q->lrc[i] != lrc)
> +			continue;
> +

The above code looks unused as LRC is always NULL.

> +		action[1] = q->guc->id + i;
> +		drm_dbg(&xe->drm, "Guc action[%u] for ctx=%d",
> +			cmd, action[1]);

Prefer xe_gt_dbg.

> +
> +		ret = xe_guc_ct_send(&q->gt->uc.guc.ct,
> +				     action, ARRAY_SIZE(action), 0, 0);
> +
> +		if (ret)
> +			drm_dbg(&xe->drm, "eudebug guc cmd %u failed with %d\n",
> +				cmd, ret);

Prefer xe_gt_dbg.

> +	}
> +
> +	return ret;
> +}
> +
> +static bool xe_guc_has_debug_contexts(struct xe_gt *gt)
> +{
> +	return GUC_FIRMWARE_VER(&gt->uc.guc) >=	MAKE_GUC_VER(70, 49, 0);
> +}
> +
> +int xe_eudebug_exec_queue_enable(struct xe_exec_queue *q)
> +{

The return value is not checked at the caller, so NULL return would be
better choice.

> +	struct xe_device *xe = gt_to_xe(q->gt);
> +
> +	if (!xe_guc_has_debug_contexts(q->gt))
> +		return 0;
> +
> +	return xe_guc_action_eu_kernel_debug(xe, q, NULL,
> +					     XE_GUC_EU_KERNEL_DEBUG_ENABLE);
> +}
> +
>  static struct xe_eudebug_eu_control_ops eu_control = {
>  	.interrupt_all = xe_eu_control_interrupt_all,
>  	.stopped = xe_eu_control_stopped,
> diff --git a/drivers/gpu/drm/xe/xe_eudebug_hw.h b/drivers/gpu/drm/xe/xe_eudebug_hw.h
> index 8f59ec574e4e..5d1df5d7dc46 100644
> --- a/drivers/gpu/drm/xe/xe_eudebug_hw.h
> +++ b/drivers/gpu/drm/xe/xe_eudebug_hw.h
> @@ -23,10 +23,14 @@ long xe_eudebug_eu_control(struct xe_eudebug *d, const u64 arg);
>  
>  struct xe_exec_queue *xe_gt_runalone_active_queue_get(struct xe_gt *gt, int *lrc_idx);
>  
> +int xe_eudebug_exec_queue_enable(struct xe_exec_queue *q);
> +

I'd probably stick this implementation xe_guc_submit.c as even though
this EU debug specific, IMO you don't really need to compile this part
out as surely if EU kconfig is unset EXEC_QUEUE_EUDEBUG_FLAG_ENABLE
would be clear. Maybe ask others about where to stick this, as my
opinion on this isn't strong either way.

Matt

>  #else /* CONFIG_DRM_XE_EUDEBUG */
>  
>  static inline void xe_eudebug_init_hw_engine(struct xe_hw_engine *hwe, bool enable) { }
>  
> +static inline int xe_eudebug_exec_queue_enable(struct xe_exec_queue *q) { return 0; }
> +
>  #endif /* CONFIG_DRM_XE_EUDEBUG */
>  
>  #endif /* _XE_EUDEBUG_HW_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 16f78376f196..da264c1cfe76 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -21,6 +21,7 @@
>  #include "xe_assert.h"
>  #include "xe_devcoredump.h"
>  #include "xe_device.h"
> +#include "xe_eudebug_hw.h"
>  #include "xe_exec_queue.h"
>  #include "xe_force_wake.h"
>  #include "xe_gpu_scheduler.h"
> @@ -655,6 +656,9 @@ static void register_exec_queue(struct xe_exec_queue *q, int ctx_type)
>  	if (xe_exec_queue_is_lr(q))
>  		xe_exec_queue_get(q);
>  
> +	if (q->eudebug_flags & EXEC_QUEUE_EUDEBUG_FLAG_ENABLE)
> +		xe_eudebug_exec_queue_enable(q);
> +
>  	set_exec_queue_registered(q);
>  	trace_xe_exec_queue_register(q);
>  	if (xe_exec_queue_is_parallel(q))
> -- 
> 2.43.0
> 
