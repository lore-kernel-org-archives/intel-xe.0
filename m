Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92169D6AAE6
	for <intel-xe@archiver.kernel.org>; Thu,  2 Apr 2026 15:57:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51ECD10E11E;
	Thu,  2 Apr 2026 15:57:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G8B/kmgT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9E2C10E11E
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Apr 2026 15:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775145438; x=1806681438;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=qsQfUtRNzqJRAQeeqDTsS3ExHW8XaSXJshvaSEq4Qlw=;
 b=G8B/kmgTjXuMwPReS+SK4uuETHNvmHvoJXDsdaV83vlIZr7lY2HMVPAo
 rl/GYeEUwLqx+/0Xkq830mPZYCQ70U4jVQU68Q3WlClgBoGB+OCf3xvsh
 dEeVbqHq7AI0JpJThXvam37qJniDzXjkWh1UIShyClgBSgBmGfKqLxevL
 W0Ke0vF/UWEBAeHfDvi/5UPOXKQIfP3X4ZSff0Apwd/IfqpxtiCZ2sXsX
 YZuXEdRhT0YGErZEugZPwJ7Bt5ejKRIA/JNJtPtGZcy4ubhaaQqpq9E5E
 QD+YG+HsTRlZzvfjZ8V45sesYANVuvCUxmPmG5B1+kY/sKdkBLKQ6O8Ei g==;
X-CSE-ConnectionGUID: jk/Xs/iESbOMNUc5uTQ6eA==
X-CSE-MsgGUID: HIYabEvNRxWUWm/slc3kWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="87602586"
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="87602586"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 08:57:18 -0700
X-CSE-ConnectionGUID: kxHXaJoBQoy5vI5mDIPj3g==
X-CSE-MsgGUID: MvFw3oX/SJiZ9AXe9KmctQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="231056384"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 08:57:18 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 2 Apr 2026 08:57:17 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 2 Apr 2026 08:57:17 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.5) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 2 Apr 2026 08:57:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CNthvEEJqqT4VtN8uBnjoexEN8jJ1ELzUJFdItOOReXw2e3wfxp4nAKWjZ1A4mYaKn9Fal7J87kpouj9Zf6MGKEuAU+EZywiykK/fYUnnYCmjzlrcpnGOKuYHQJ6QyZ4kTHLqQ3yCKw5BJpSlpYT6kZhh7weKQXwXQi3whF5aF2pSCTrBKwFQHiWz1sH0szwa8fJ2iAC5dM1ZVrgyqhWP5NyIzXAVbuelAM0C2ZPN17fZcNbXs6PTYeD6OvIPhR2+gL+azeqHeT1IU3wXGUUhDBuswFhg01HcE4Ed0UFD+t7VU0ecUSsjJogvj2SXCJbgPgLHfxPrXBtbcuklNQ/2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UgvZvc+XrDnEuBd+YeWzqlKDGREs7wMnmE+KFS441Rg=;
 b=QEwcjPxGLy5hepV5LMQIGjUvTnKYhvSaO+o4S7NBVQM0mIkp3+muMFVEK2ZZz6Xy5aSy3xww7qBCIuh8MmNdvcyhJdX+1gWvUyDdc6Aha6qX3ZlPsr8OjSP0ggIjmFX+ZqnjEX7a4Jxmu7mhguuH2E28LeOeGZDjmAesi/dSIbF94bcFgAQQPUfGlESBJs4a4+beqsgngF76TQR+cD2ZAA8iQozdOSKFXbATO0isc4kai5FEAghvT+JKRrtNzEvPFI6Swj2dK/El3cUFs6O42loWs1rYddhIqyZNNRVR/bv5CrqZUORYIDDy1emhfVlwe1VdLtQzq1QU/4MMHzdqxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by SA3PR11MB7555.namprd11.prod.outlook.com (2603:10b6:806:311::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Thu, 2 Apr
 2026 15:57:15 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%5]) with mapi id 15.20.9769.017; Thu, 2 Apr 2026
 15:57:14 +0000
Date: Thu, 2 Apr 2026 17:57:11 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 12/13] drm/xe/pf: Extract helpers for bulk EQ/PT
 provisioning
Message-ID: <20260402155711.fmnsw2iuovea2xjd@intel.com>
References: <20260330204046.567-1-michal.wajdeczko@intel.com>
 <20260330204046.567-13-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260330204046.567-13-michal.wajdeczko@intel.com>
X-ClientProxiedBy: VI1PR03CA0051.eurprd03.prod.outlook.com
 (2603:10a6:803:50::22) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|SA3PR11MB7555:EE_
X-MS-Office365-Filtering-Correlation-Id: e0ba14d5-6424-4fb9-a41b-08de90d08256
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: 8kRp39y6V61dzjovAUeG9OlfQYKaIqfZTuPYNDe9LiGuH8smrbcStHmiFA7n7fz5pAFO5bu5kYIbZwvHg+hoZ81h3kKY8xkyqDoDaIKMobFSek61Wp+lyPWr0S+YyAiGfO6NEBhUoLm5k/FbWUQ1GQVSwsK712hLES0xCcd+q3WivSB3RRJ1Q31SAltVy77Rz8tJ4TP4cVBn9BfbxyuysFSop9Mv7ouIFFZDkrRQAsdIcge70UcAgAmbKZz9lU9A+SYTkkBVrmx1sLq8AcSmPOqK+IclOyGMx/504cx01gx/7wzyEBitDSbwKB2e97YVGQrY8FtuBtyNQ3+09BBOl7C/r9xYfG3hQgAqRQfrYf9NkeEm25nrP965JRIvjFNCOrEMc5jGwTs63avw1hIYoBydeFiiAqA8KsFHgnhiFUZ/ZtCJpCbE2RDYnDjoAzxqLcgWnjzisEvpHVZpYu6OTKT0ZpMhWls2wl2rZWykf0jQ758sT/ylC6EQXlQZMf9WXbowUzTvacmYysNF3uQekGY/yWqgt+ViAw7WpUcsElUFuprtB0Qsy3lRZQrzAjGA11P7r0+DF0uQJEfeGTEMLJtBaLk390N7Y9a6D6/bcr3ZzyWYXAiN04z0nQ7/cPQJ1K5KD5Y9zvBKtXDxYXZxibqh/AMgA+155mjjZXAIG1PU8hSZOe30p4UaHL9QMF/EGOx4exCT025PBMH+kpkyaGIHoFPzrgUZUmSvfDPxJGw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZmJxd3ZwR0haNXFvM3Nub1FwdDVpK3p2QmxsZW1Vd0Z0dFZXclFNUEJUenY0?=
 =?utf-8?B?TXBnczNSU3hkVmhwYktsMUF5TXZUT0ZSZHJTU2xTdkZ5OU1tYTFxRk80RS81?=
 =?utf-8?B?d3YycWNrRGlwek1wdDNuVm5mR0x2dXJDeGppUGtEMDVnRVVqY1BzRWViSHcv?=
 =?utf-8?B?K1pvbFNUQ2hIZGZzUmZ5UnYwVFpQZDUxakl6OERvbDQ0WWxRM2lSeWRMMXRT?=
 =?utf-8?B?QmMwYjlsOFBRTGFyNDlDbzkyTWN6Rkg4OWc2SkJlR0dDWklpQW9sMnZWL2Nv?=
 =?utf-8?B?MHZ2TGpvcWQzaG9OMFRpR29aS3pCbVRPaWxzQTk3c1RObnVLZERNaVZuR2lX?=
 =?utf-8?B?Y0gwU1hYRGZ5VGZxMVlLUlFXc0QzQnZzTHUxQzJXaXJiZFJHek5WbnhHN0pP?=
 =?utf-8?B?aTFxNzhKMm0rdG9YbHpHbHhpT1pOZ0EraU9oT1l2N1FMeGdyQVpFK2lmVzRu?=
 =?utf-8?B?Vm9JeHF3MWdUL3hQMDhpNzU1c2JzS09lMjRPTW5tclo5d3RLVmZHYmpsRmlM?=
 =?utf-8?B?TC9WamFsSW5EOHVIYVF5NVM5K1c4d2NMOU4xZ00xcnpvYzdKcEF5cjVOb2Vl?=
 =?utf-8?B?RlIwb2FJcEw0UzBOa0hGREJ3WXlDRVdTLzZMbS9md1NnalBxdXlMTElRREZV?=
 =?utf-8?B?TDRTeTYvTDQveEsyWW9ZR2VUVmRGRG0yK3F5bFNlOVN5WS9GN2pZUnhmTloz?=
 =?utf-8?B?NHgwSFNkL3Z0SlNDM2xZckdPQW5KVjBmL0lQdllJN3RYMjBKWnptTTRhTVox?=
 =?utf-8?B?V3N3TXYrQWt1S3pXQ3NKalFUWE9GL3ZrclNvbWo2elhtcXJSaDM3VWE1RjQr?=
 =?utf-8?B?dnpFVTErTU8vR1Jld2lZUkJ3QlVmQTRNbUxYaDB0KzQ5Qi9IbVhJdDBNUmxB?=
 =?utf-8?B?OTlUd1B1TkdSaVExZzd4dUlKazlDYnY2alFjSzFUSlFTTUx6ZWlKY0NxaGo4?=
 =?utf-8?B?eUhhZzhhWWsxaEZoWUhSMzYreFNkTmgxWkRRb0VvVXpxeUxUNGM4N3RkNys2?=
 =?utf-8?B?NTBEWCtjWncvUGZSbHFhVzNhNnBCYXNMa0lDWnVUZ3pPTGJBa2JkSjZlTzBT?=
 =?utf-8?B?ekRRQWtBYnJYejFZcFhhKzM4NmYrUHN3KzY2K0tCZmVmL3FsOXFVdVNpd1E1?=
 =?utf-8?B?RGU3ME5ZamtNb3RZSmRDMm5leGxGS1Jhb1dFVFBYRGRPS01HT0ZGKzl6ZHp0?=
 =?utf-8?B?MXdsR2hwK25aandLbDRhRGFTTHlGWkV5clZxeWt6TkNpOERqZTZJc0JjeWx0?=
 =?utf-8?B?VU5QNmhNZnVSNENzUkFjbHBRUld3b1FEZFJVWmNYYTlEYUl0eURrTzdCMVZ4?=
 =?utf-8?B?Q243OWhYbVBuckhqQTUzcGVHZlBwNW1JODV3QUVvdU83ZEt2M3J0czRrUDMy?=
 =?utf-8?B?NWhzNGVWbFpEWGVOdU14R0tDQWJqa0VEdTlLbjk0WFdyYVNsY2FLblhEaEJ1?=
 =?utf-8?B?UjZuWXNFbE9CUUdwM3EySHd5ZWRDYzB1UFhyVCs5am52YkY3dldzeHpDTW83?=
 =?utf-8?B?VU1LZjJCOHFtTXAwQkl3bExIck4zc1lYaXBUcGdwWlR0M2xVYXBLTzhqU3VG?=
 =?utf-8?B?dklNbmkvaEdWaGJHQnVrOGdUTjd5NFhCcUJmMmJydFhzR3h5Lyt0SE80ai9H?=
 =?utf-8?B?ZmZWcWdZeUhCZElPVm9QTGUvT0FKd2lQdnpNOXg1UnBGOE5Xd0p0d1AvdWFY?=
 =?utf-8?B?b2U5eTNIeGw5QWFZalN1N0pEODNnOVJIclFzaGNScEllbG9GMTRlN1MvQXY2?=
 =?utf-8?B?c2xiaXpaaEJIQlpwSy9xREFHdUNvUmI1R2F6NXZiem4zMmRGRm5EVU5STEpQ?=
 =?utf-8?B?blFoQVp3dWIwZEc1NXNLOWhiUnk0TDJwaUpwQnJsaGNLaFRYMUpFRjFkT21l?=
 =?utf-8?B?MWFFUVUzQXdIZ1I4TXQrODFLRVg1c29qSjNsL3lBV2RXNG1vKzBZL2lvOUNr?=
 =?utf-8?B?VGM3NFc4ZmQ4ZVd2bjdGUTdzaGdoNjg2ZTkrUHp3ZkM5dnBSR0dCWHh6dllH?=
 =?utf-8?B?UERUNHJFcVFlRDlVS0w4bTIwNnRVMXdGNHEyNnd3RXd0QkIrVGZsUVYrdUFB?=
 =?utf-8?B?ZmdEYm90ODFrZk83aEJKVXJXRll2L3VtakJjMU40SnRyOUlEZ0JXK05TMzRZ?=
 =?utf-8?B?d3dKcTBxc0tIWHh1TWJNaHdLdTl0OEpnZUJhYUtLSDEwcWViZ1lPNmt2Mzhs?=
 =?utf-8?B?RmcvaFNhc2lMait5NGxDVFQvL2hHUUdHMDBUdis5am4vSVdWOUdpTHZtTW5C?=
 =?utf-8?B?RjlFVEhlQzU3MmZHcE1wN25kS1Q4N2thek40ZC9CY2NUZ1BDQlFJZ3lna3gx?=
 =?utf-8?B?c0c1eDBGRHlsbjRhYSttU2RwaForb1dWKzlrU3MzZFVPKy9vVGVmZzZydTVv?=
 =?utf-8?Q?pRaNEn78ybBidNbk=3D?=
X-Exchange-RoutingPolicyChecked: k2oy3VSEjuX3PnzS2GOD05SevlmUa9uqBTGxB26fvnA1/6yLXwDVv4vH5TlUMMcDnCqCi/cuBV5WCLlGfYaMmaNi6QcTeDdLuuR5RzCi9XA0ZpLvMeJrn8xDF98KsDwwSyMFD5uWm2LbKh0zB/c8ZBZHHEnTLP0qZscnad9w6N5LzlVnPO1tT/JTb6IqCsirMLl2sbuKdWTbkr8bv54X35rkoT8oFC5UhEL6ratFGUj77QxqBr3gjITzUcQjqQf9kC4LR4SR83sAUNYEwXM/55x6lOmOAcSPBGON8H54AaHMhGiGC4vQmr0BotR9xp83ru6FDGOhaL5BofPmwysyiQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: e0ba14d5-6424-4fb9-a41b-08de90d08256
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 15:57:14.8779 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MYIo1cRwJZ8D3TUk3aG9Pup/A3UgXP6i7MOCh2Mn0dGycJE4tT6Snvir2sTFNqGRU50shRXgQBpammwsNmU3faTp5WhAJhBsFP9iS1DO3rM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7555
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on pon [2026-mar-30 22:40:43 +0200]:
> We already have functions to bulk provision execution quantum and
> preemption timeout, but they are applying changes to all possible
> VFs, while in upcoming patch we would like to provision only subset
> of available VFs.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 66 +++++++++++++---------
>  1 file changed, 40 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index 680ea73d1ce3..7f85d6629fec 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -2193,34 +2193,41 @@ u32 xe_gt_sriov_pf_config_get_exec_quantum(struct xe_gt *gt, unsigned int vfid)
>  	return pf_get_exec_quantum(gt, vfid);
>  }
>  
> -/**
> - * xe_gt_sriov_pf_config_bulk_set_exec_quantum_locked() - Configure EQ for PF and VFs.
> - * @gt: the &xe_gt to configure
> - * @exec_quantum: requested execution quantum in milliseconds (0 is infinity)
> - *
> - * This function can only be called on PF with the master mutex hold.
> - *
> - * Return: 0 on success or a negative error code on failure.
> - */
> -int xe_gt_sriov_pf_config_bulk_set_exec_quantum_locked(struct xe_gt *gt, u32 exec_quantum)
> +static int pf_bulk_set_exec_quantum(struct xe_gt *gt, u32 exec_quantum,
> +				    unsigned int first_vf, unsigned int num_vfs)
>  {
> -	unsigned int totalvfs = xe_gt_sriov_pf_get_totalvfs(gt);
>  	unsigned int n;
>  	int err = 0;
>  
>  	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
>  
> -	for (n = 0; n <= totalvfs; n++) {
> +	for (n = first_vf; n < first_vf + num_vfs; n++) {
>  		err = pf_provision_exec_quantum(gt, VFID(n), exec_quantum);
>  		if (err)
>  			break;
>  	}
>  
> -	return pf_config_bulk_set_u32_done(gt, 0, 1 + totalvfs, exec_quantum,
> +	return pf_config_bulk_set_u32_done(gt, first_vf, num_vfs, exec_quantum,
>  					   pf_get_exec_quantum, "execution quantum",
>  					   exec_quantum_unit, n, err);
>  }
>  
> +/**
> + * xe_gt_sriov_pf_config_bulk_set_exec_quantum_locked() - Configure EQ for PF and VFs.
> + * @gt: the &xe_gt to configure
> + * @exec_quantum: requested execution quantum in milliseconds (0 is infinity)
> + *
> + * This function can only be called on PF with the master mutex hold.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_gt_sriov_pf_config_bulk_set_exec_quantum_locked(struct xe_gt *gt, u32 exec_quantum)
> +{
> +	unsigned int totalvfs = xe_gt_sriov_pf_get_totalvfs(gt);
> +
> +	return pf_bulk_set_exec_quantum(gt, exec_quantum, PFID, 1 + totalvfs);
> +}
> +
>  static int pf_provision_groups_exec_quantums(struct xe_gt *gt, unsigned int vfid,
>  					     const u32 *exec_quantums, u32 count)
>  {
> @@ -2418,34 +2425,41 @@ u32 xe_gt_sriov_pf_config_get_preempt_timeout(struct xe_gt *gt, unsigned int vfi
>  	return pf_get_preempt_timeout(gt, vfid);
>  }
>  
> -/**
> - * xe_gt_sriov_pf_config_bulk_set_preempt_timeout_locked() - Configure PT for PF and VFs.
> - * @gt: the &xe_gt to configure
> - * @preempt_timeout: requested preemption timeout in microseconds (0 is infinity)
> - *
> - * This function can only be called on PF with the master mutex hold.
> - *
> - * Return: 0 on success or a negative error code on failure.
> - */
> -int xe_gt_sriov_pf_config_bulk_set_preempt_timeout_locked(struct xe_gt *gt, u32 preempt_timeout)
> +static int pf_bulk_set_preempt_timeout(struct xe_gt *gt, u32 preempt_timeout,
> +				       unsigned int first_vf, unsigned int num_vfs)
>  {
> -	unsigned int totalvfs = xe_gt_sriov_pf_get_totalvfs(gt);
>  	unsigned int n;
>  	int err = 0;
>  
>  	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
>  
> -	for (n = 0; n <= totalvfs; n++) {
> +	for (n = first_vf; n < first_vf + num_vfs; n++) {
>  		err = pf_provision_preempt_timeout(gt, VFID(n), preempt_timeout);
>  		if (err)
>  			break;
>  	}
>  
> -	return pf_config_bulk_set_u32_done(gt, 0, 1 + totalvfs, preempt_timeout,
> +	return pf_config_bulk_set_u32_done(gt, first_vf, num_vfs, preempt_timeout,
>  					   pf_get_preempt_timeout, "preemption timeout",
>  					   preempt_timeout_unit, n, err);
>  }
>  
> +/**
> + * xe_gt_sriov_pf_config_bulk_set_preempt_timeout_locked() - Configure PT for PF and VFs.
> + * @gt: the &xe_gt to configure
> + * @preempt_timeout: requested preemption timeout in microseconds (0 is infinity)
> + *
> + * This function can only be called on PF with the master mutex hold.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_gt_sriov_pf_config_bulk_set_preempt_timeout_locked(struct xe_gt *gt, u32 preempt_timeout)
> +{
> +	unsigned int totalvfs = xe_gt_sriov_pf_get_totalvfs(gt);
> +
> +	return pf_bulk_set_preempt_timeout(gt, preempt_timeout, PFID, 1 + totalvfs);
> +}
> +
>  static int pf_provision_groups_preempt_timeouts(struct xe_gt *gt, unsigned int vfid,
>  						const u32 *preempt_timeouts, u32 count)
>  {

LGTM:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

> -- 
> 2.47.1
> 

-- 
