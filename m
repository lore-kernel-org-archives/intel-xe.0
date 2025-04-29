Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8A24C369DC
	for <intel-xe@archiver.kernel.org>; Tue, 29 Apr 2025 18:43:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8742A10E0A9;
	Tue, 29 Apr 2025 18:43:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ALWFh7/D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 633A010E519
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Apr 2025 18:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745952182; x=1777488182;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=sOI6UvfoeKJ6OeaLJ0gBNS5xlq+mFgy4BNAn/G12RjI=;
 b=ALWFh7/DZYsYJjkwYJwg2pMiqtL2bXEhEDRgxiHc1k4bSPgBzIe7gPd5
 Oo5bJyYCZy0WQ0u1yu8AA778GMYyQGZmNPYLBYR6llztPmAumT0XAhMmd
 zgcONLy/NFwKomeRP1U7zHT/9ciUWH6ycAmVXi+am/96Wo54Uuav57QHB
 UvcHmlChrfaT0fSSUnkaoveEMd73/U21yNmHXNrPhAQb1dKDaFKmNJMo5
 CnEYh6faWrJdxAfgNQyFMwnT6fD2r28DtD2bSu7YrFJE+140Nkzv2h/Sj
 sdgwVzOdI8a2hzS31t3j/pvhBBwsWuK3fUrzTe4VcMTEiZQyZoVNj0Tf7 Q==;
X-CSE-ConnectionGUID: HrR+7XKgTKaV9hJOTB5HwA==
X-CSE-MsgGUID: Jmfs1Aj1SO2RyZGD9FwU+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="72974395"
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; d="scan'208";a="72974395"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 11:42:13 -0700
X-CSE-ConnectionGUID: K40qw7fJSIiDdjd6fWS9FQ==
X-CSE-MsgGUID: RSi65MMZT7OsiQu//j6LOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; d="scan'208";a="138715301"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 11:42:13 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 29 Apr 2025 11:42:12 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 29 Apr 2025 11:42:12 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 29 Apr 2025 11:42:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FCnI+tM2rXWUV2m99xXjLWvo1WqHk5eIF7lm2qsV7l8nO4tZhwzw9LSnrRcCGVTCNLdZ6eIKuF0r8z/s7b+lBvg/kPuroPxpmmywLp61pYQXMLYN7gxba5b7bTHSKTDqYR9R3fMukvsWksx4RW6z6HDAEdV21oCQFb6P8hRsXFaVIaH2Tg2e8MZmJoVUdAFk3U2Z0jEb5vovSNa62yhxCf5UbgIq01WQDe9X98h6LNkEgyKudVemEaO8CcY7wxHzgxsmD4rANr+wUFiusR3ywvXcCsIhR9jtG1z7v8bWEbfqwPrAtrqboSLm3eQ5FNRv3oOe3ok9B1o2amRcKCtjhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5CVAVSVGb36+VwUBki2lB91WqZDDl1rPxsdPdAVn1gM=;
 b=Hku0bTjv8IpPNT7FkDGGB14Fm8w5SmhNJ1NcYE4y2btvu3/YsSrQDqq21qotZuafqtnT7ECDTPxUrWVd33U3sB4C8PahGFeAikjKpjUxcwH7Y1U57mPeacvhoCKtJXI40bb5oVUUC4jTh8CQWdyNcpL94mfAxoIIueBuZLukM6tCBo0wGJoCVPsx3gBYuPEcppKOJTp+XVa/uTSmF9itHSfy9J3I3ZQrvCUTvp7Kxhf9MMwWTnV7pplEW7dpPanZSvyqLC5Ep9lBWy+c84kMTP9/kvM6iyM1fkhoefvDbgl0BAFn2+Tj9neHcaTxoDZT5C+zrAmSz6p47oRrai7drA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB5804.namprd11.prod.outlook.com (2603:10b6:806:237::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Tue, 29 Apr
 2025 18:41:27 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8699.012; Tue, 29 Apr 2025
 18:41:27 +0000
Date: Tue, 29 Apr 2025 11:42:50 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v5 16/20] drm/xe/svm: Add
 xe_svm_range_validate_and_evict() function
Message-ID: <aBEdqtL8XqbUI+Bq@lstrano-desk.jf.intel.com>
References: <20250429104233.215602-1-himal.prasad.ghimiray@intel.com>
 <20250429104233.215602-17-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250429104233.215602-17-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4PR04CA0264.namprd04.prod.outlook.com
 (2603:10b6:303:88::29) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB5804:EE_
X-MS-Office365-Filtering-Correlation-Id: dc56aa50-c637-4335-5e89-08dd874d7354
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1tlgRRtRqgTdoZlDCqBpOSlC0mm1PifKxCv1m5DUgoNPioNvHUG6XVGZiYa6?=
 =?us-ascii?Q?KfG8Cpr+505cStEXaetkIAuw85x+EhwcLNvzhtZ9K924T72vNPWbuQDc3o5P?=
 =?us-ascii?Q?vxsUAdIqZj9Q3kxli6FEkjjvVN0x79aJIgozw2RK6kOIdajQt3/vuJ7iBSU1?=
 =?us-ascii?Q?HFExp3atEzTGUmue3Mbgeh4S5oLtSIEoi7mQVdmsOeqbB3XFZcwYbsYk2766?=
 =?us-ascii?Q?u/Os2ebTfOWrYgDxT9wqLj27UKPa4VTHAs+G/QFNKEzynFfUsyH9VgFGR36A?=
 =?us-ascii?Q?TbCnIBwINu5m0rZIBiQpnSVgEMozFf2OiODao+gfEVvRkmVaAYHkDx9nLp55?=
 =?us-ascii?Q?a1PlpFSNyZW8Sfh35uqZgAHpv/qrWBi0G5B2TPW5kgjUuBFdKMmEPg2mqb3e?=
 =?us-ascii?Q?pqS9DZE7vOv5g796bw3qW9SMZbj2CWi283O9W0gQfsM/15o2G7jJsnzKVjzo?=
 =?us-ascii?Q?80FxPkA3wRck3KfgrfDMRz64B2rvR3fP6es6emxFJAbzCAo+79IHGFIlqMdh?=
 =?us-ascii?Q?862h8s4EnE75/FjGTuKUcveFJwDXYtHG5PBr+PV96rKeUPKreWVxohPNUxhh?=
 =?us-ascii?Q?V0zgwP97d7NFkNlgvtKOCL9bcE+ey2COKBpeOs9nz/MMdA+BCOpWiWbAS1Ro?=
 =?us-ascii?Q?aWD7IjcVF90suV1QZZYxWyD8Sn7bhwBXhv402A0q9zKlrAtT90KWHwswWYpl?=
 =?us-ascii?Q?e84vDmJpuCGAwzJUNai0ErpjcGZYn/E7cBZ7czRy9S58873dVdLP8JDGL4al?=
 =?us-ascii?Q?9K9qF/W/lOilcT9NNVZLAnxnGhC21NJVvJ50GP5YaZz0V8KLFACz1qNUrAWG?=
 =?us-ascii?Q?0jbdUHH07s/i0Ynw7E0AmZv25LjMmJaJBYWbcUF0pvIJI7KXERc/i+/TY81j?=
 =?us-ascii?Q?UNSlT4d41XUKcJAVcw6L3PnCDaeI03O3uIjF+PCaUkzCi/0zmGoxD3zOHePx?=
 =?us-ascii?Q?AkmhbE2Tc8Qx7OcXuRxiDB2l9pfFxcQr8CpjR3MgXkThav4e+a4d0TvTPyNT?=
 =?us-ascii?Q?Ux3QgXgSOGfHIPMEYJB98KCTt/82fXhDER7iKdUI45ysu9Wx9wvl9RCKH0f3?=
 =?us-ascii?Q?LmRYRSgbSORPlzmyFQMzljXv8DwuV7Q5LaMMZr8xB5T7kuY/HPQeZU41PkTQ?=
 =?us-ascii?Q?gRqZhXUr6tn0eSNPycKhbhzwI8DCRXQYywUI2NASYyFKpWHqcAybYSPHAJYf?=
 =?us-ascii?Q?iZM5DOrdexCW8MViIjfuB8HJlqydJN9g9OMgxrWbpI6+/nPM087pFtaOTwoT?=
 =?us-ascii?Q?7uQbUhr1Q3Dzzllf6T05IHD6QEV8gbfqpJrVccOPsso3xhPm1a2OajUOoano?=
 =?us-ascii?Q?+94bUf0GEy4lXpcNYk+ZDwPJ6DVxMeaOvYoomA4YYw9Qu21q48vd1zDX13Ky?=
 =?us-ascii?Q?mI4AeuzNzpG3bw47raBSi4KznQD/7/XZWtqBGTypIIeImLGHPfhuY1w77cbe?=
 =?us-ascii?Q?+HGKjSiPons=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GFRNNUAGXDkCh7E074IM3KMzrElmM4z76689pdV6EIYz0GsVeKleGIhGWYjf?=
 =?us-ascii?Q?I/2yy6TkoGHeuX9Wf4nDDB0/tIpoO5Dt9LOYSG8H4DR/AF9qMAWJIhIFj2mc?=
 =?us-ascii?Q?NSwZvZUSex8Zfz2NpyY9IdFfvMZClgvZ1rMbZXwOJCzJ1uIPCm7r/5+n37ip?=
 =?us-ascii?Q?ZOua5vsbgCKPLJIVSp+FBDnYKdMJkYb2QKazPi4RvsRHV6yatLTdM/HufGtq?=
 =?us-ascii?Q?Sp+0rhBWoAg72qnV6dzxjt5cr6TIwSz3FsJXngzjINRUN23F8NOHSW7UKVYN?=
 =?us-ascii?Q?O+YqLYvI9fikF699xvR+TpiDOQUyiD9i6Knt/xszZnCALr/NZYRPqTB1KPMP?=
 =?us-ascii?Q?+5UCZ3p2SNLcGV3afo9QdOuig7UJBcP2lMCQWl0oTJqpFjRsUUPpW+BdxBSO?=
 =?us-ascii?Q?F6HddPVfRF+r+Ws9t6icJeDnY9McoIrJ+w1eJIAXslk28RaMRWEcKVD1HS9h?=
 =?us-ascii?Q?EMktNBtXZj3OqzmWuf7z4bwj/zxXQNvDLuTSve0Co9EBMgA0agWPOHAu1dyf?=
 =?us-ascii?Q?QkNW26JtLBgmUN5j6J9++MGZ6UfmlD3A+oJqYInKu8B/39XdmNwaZjC+ohja?=
 =?us-ascii?Q?uT8fZlnQif6M5J7bJtuyflglpITG3upesWW5HH5FYmIe/lw5i+LZjd3tESqY?=
 =?us-ascii?Q?7Fa6a1jNHdn3TkkckKYDd9TpiWmK9SGowqIPEgrB27HwVxhMgiawB+FsqP4j?=
 =?us-ascii?Q?tC2VhAaHyz6Xbem6NK53XfyjTbSoC+OxHewkcT0Clav/B27wUYpRkSNkH1zB?=
 =?us-ascii?Q?dggnjEXXPB/RS8RIy+LLWNB5O0snaRpzUBxMWZHK09iSV0GcqxyvOH1c3OO4?=
 =?us-ascii?Q?xENRw4X2NDXXSOwK7BuR6AR0vVaBgiQleUjU9gpQmOaGL9JoM6KPkFjRAaAR?=
 =?us-ascii?Q?hCwtORSiE/93Yj3iIeUlw9IoVnpZhcGCZfN429Qfcm6vABx75IXhYI/BpB59?=
 =?us-ascii?Q?sf1pW6p0srKiJt54TrSmz7ZZHv1pdGvRokBn17+ohyFAk7jA+U5NnhKzCWpz?=
 =?us-ascii?Q?Kdt7Szr7GTjFT7AXMsxMa4MLoisPRSAj3iGfrluytA3vr3hyGSo73JGQ5ft/?=
 =?us-ascii?Q?23R73XMsdjNF+bhZfLMJnaBUctA8qM5j3WtXEzaobIebwFwgHAFRzKTysnsV?=
 =?us-ascii?Q?iMrjvrYQt61kDOu15e/GwggAsi6/9T7nxVHhs4Kzzho9uuo+nXFr5SFZPQ45?=
 =?us-ascii?Q?Jqj89A7Dq4t6P+WjmCSW5CAtgFbZIPgrC2iMlfzTMUMLebjCVFwZjcts5JB7?=
 =?us-ascii?Q?+o0g0993zTxkwA4pKOie57jOKifYbeL44YHjY4mDNNtWK9b+4BJ0AAF0vSYZ?=
 =?us-ascii?Q?C2VzuVsGWNeZb4FPP1PmUCwepwcXcCGyMuHBWPyoxONHpod4aTGYwZntN1n+?=
 =?us-ascii?Q?ZURcJ9XFFv7QwOSBoDml312hlSPA3D0Uhy8yzZn6jS3KbAC1+NxifqJkw7c9?=
 =?us-ascii?Q?eCE+QqLDyZGjX8q2CY4gPp11XzceS2IPBdL1j4PNqddnreI5qB2xiFmOReQ3?=
 =?us-ascii?Q?SKMb3aSI/Wm4rt7y+cQimg0Z+Nq/D43XwP7NMIXYH4/O/xS9/k2RDypWF24R?=
 =?us-ascii?Q?soP3ikmD65DLsDkFyilwZU/KnM1ToD5c7GolPR9iFGhw6mEsk0VTuDxMRwqb?=
 =?us-ascii?Q?/A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dc56aa50-c637-4335-5e89-08dd874d7354
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 18:41:27.5207 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qwGXqi9wmvRLa7yUVsXNnqDo4Bmn9MYHyeaKzRlHSqVVzYN5Jd5orBbIj9q+grV1a3TVCZdyFgyZrhHrSJuDTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5804
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

On Tue, Apr 29, 2025 at 04:12:29PM +0530, Himal Prasad Ghimiray wrote:
> The xe_svm_range_validate_and_evict() function checks if a range is
> valid and located in the desired memory region. Additionally, if the
> range is valid in VRAM but the desired region is SMEM, it evicts the
> ranges to SMEM.
> 
> v2
> - Fix function stub in xe_svm.h
> - Fix doc
> 
> v3 (Matthew Brost)
> - Remove extra new line
> - s/range->base.flags.has_devmem_pages/xe_svm_range_in_vram
> 
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_svm.c | 37 +++++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_svm.h | 12 ++++++++++++
>  2 files changed, 49 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 90fae13b77ae..55c5373b7989 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -637,6 +637,43 @@ static bool xe_svm_range_is_valid(struct xe_svm_range *range,
>  		&& (!devmem_only || range->base.flags.migrate_devmem);
>  }
>  
> +/**
> + * xe_svm_range_validate_and_evict() - Check if the SVM range is valid
> + * @vm: xe_vm pointer
> + * @range: Pointer to the SVM range structure
> + * @tile_mask: Mask representing the tiles to be checked
> + * @devmem_only: if true range needs to be in devmem
> + *
> + * The xe_svm_range_validate_and_evict() function checks if a range is
> + * valid and located in the desired memory region. Additionally, if the
> + * range is valid in VRAM but the desired region is SMEM, it evicts the
> + * ranges to SMEM.
> + *
> + * Return: true if the range is valid, false otherwise
> + */
> +bool xe_svm_range_validate_and_evict(struct xe_vm *vm,
> +				     struct xe_svm_range *range,
> +				     u8 tile_mask, bool devmem_only)

s/devmem_only/devmem_preferred

> +{
> +	bool range_evict = false;
> +	bool ret;
> +
> +	xe_svm_notifier_lock(vm);
> +
> +	ret = (range->tile_present & ~range->tile_invalidated & tile_mask) == tile_mask &&
> +	       (devmem_only == xe_svm_range_in_vram(range));
> +
> +	if (!ret && !devmem_only && xe_svm_range_in_vram(range))
> +		range_evict = true;
> +
> +	xe_svm_notifier_unlock(vm);
> +
> +	if (range_evict)
> +		drm_gpusvm_range_evict(&vm->svm.gpusvm, &range->base);

Sorry missed this eariler. I think this step should be left to latter in
the software pipeline - e.g., In prefetch_ranges in the following patch.

Migration are costly and this is the step we'd want to thread for
performancd. So if some migrations are done in vm_bind_ioctl_ops_create
and other in prefetch_ranges it would make the threading logic tricky
comapred all migrations being done in prefetch_ranges.

Matt

> +
> +	return ret;
> +}
> +
>  #if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
>  static struct xe_vram_region *tile_to_vr(struct xe_tile *tile)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> index 9be7bb25725c..e6f71ad0b17b 100644
> --- a/drivers/gpu/drm/xe/xe_svm.h
> +++ b/drivers/gpu/drm/xe/xe_svm.h
> @@ -83,6 +83,10 @@ int xe_svm_range_get_pages(struct xe_vm *vm, struct xe_svm_range *range,
>  bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range, struct xe_vma *vma,
>  					bool preferred_region_is_vram);
>  
> +bool xe_svm_range_validate_and_evict(struct xe_vm *vm,
> +				     struct xe_svm_range *range,
> +				     u8 tile_mask, bool devmem_only);
> +
>  /**
>   * xe_svm_range_has_dma_mapping() - SVM range has DMA mapping
>   * @range: SVM range
> @@ -276,6 +280,14 @@ bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range, struct xe_vm
>  	return false;
>  }
>  
> +static inline
> +bool xe_svm_range_validate_and_evict(struct xe_vm *vm,
> +				     struct xe_svm_range *range,
> +				     u8 tile_mask, bool devmem_only)
> +{
> +	return false;
> +}
> +
>  #define xe_svm_assert_in_notifier(...) do {} while (0)
>  #define xe_svm_range_has_dma_mapping(...) false
>  
> -- 
> 2.34.1
> 
