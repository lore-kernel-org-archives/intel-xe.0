Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A28E0C369D5
	for <intel-xe@archiver.kernel.org>; Mon, 28 Apr 2025 21:47:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66CB710E2BB;
	Mon, 28 Apr 2025 21:47:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hEZvf2xg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8385C10E2BB
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Apr 2025 21:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745876820; x=1777412820;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=xTumbrPI/+WLlJtnTvtM4RHrtONgB8iwrr8eIyl+7+o=;
 b=hEZvf2xgl1m31jaVaEYPavFxwfub/2+QC10rWrCKuVMi0mliWzcR95Vw
 Ke0mzAYU6A55Unhm/qTPuPQNeJ/aoxIqo3z9eKVR3abA92bChI930/yDX
 DVzYLQvhwZs6YEvziqzncsDtMBxL7RduZY/Iq5VTYuTEi6TrL+yLev9z7
 WW8Cz9RurP+mYnhSFbFichY3hxCE9VD5EKTXmGj+vNvh2X+Gi93eacDRZ
 9sA6lgo+6zbiRS5V3HX/ORUe/TiQjXI6GtbyQJWxhKaWGP2N9ZYKsY+7T
 O/Xlzp1zRGsv0bCTUpHqxHEc1VyJdT9UXP8c6Kkh1gGrFYPV4g+ssMJuF w==;
X-CSE-ConnectionGUID: igdn/RO2QHW7goLnEUwxxw==
X-CSE-MsgGUID: n2WCyzR1SAqGyPyDOjOnxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="58854424"
X-IronPort-AV: E=Sophos;i="6.15,247,1739865600"; d="scan'208";a="58854424"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2025 14:46:57 -0700
X-CSE-ConnectionGUID: X0qY5XVEQlCyic5dhIplKg==
X-CSE-MsgGUID: a6qnYmB6Sh++n2ZE1vTikA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,247,1739865600"; d="scan'208";a="133589952"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2025 14:46:56 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 28 Apr 2025 14:46:55 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 28 Apr 2025 14:46:55 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 28 Apr 2025 14:46:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eiQHEPASABkOyWRdqLJ5pLJuvcvIbX+CifTYewPqzsoIAC2l81F5Z+Af47efRK9Os8WHqzxXKvrao/1GLXwxo36KRRij+aLf1rGX0yuZHd6h/nEahIipiB9OHRJItWNoFJ527lcJMuoBWJ4oBTVqNYVcFyY03k8HmaAiCJmKB+BMdTrsnbBHFqJabyybfBnRmXBb61u0UHuLN+5rsX8sjoPYASxD/4WNiEUneFkiQIeYlx9ClUGF0vlQLl31J6+1+5IpdDTaVMsAfEz3falosX23l7C01DS0hY0TYG3nJud0ZSOG4Cbar9veeRaX6SaSc+uUXML83q9QNob/M9fXKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WrJJasD0KAlhkQ58KtAzSizeaRygTxbJa7orZ5ZyZok=;
 b=p3WwbneCjWFR+q2mD4BRw929VgmOXxmTDuwxvL7CAylEiKNzP9QtqGjlgIiHQdIrEhF7SpqmNNb7CX/QMf7EYtc2+AmmCWcFAfny6GuiOaeQ8dLgYM8Yvvc+eMMYClGm3aWYKQVYzDhqlY/MdF9DFicrsPBhI6cCWisJafLizJpE4zgA3rLcLGNS9MbNogMFxGCfUj1KcuEckMgCZ/s2JMTJ2us7yeZ1CJAymVfgdh0KUtVUw4rVgyRursTICa7555Web0kB8EW5fxNd331/66z4sNA/xQsZV4HtObR2wzP4Sz0zDRp94RCQD0C8OAkfyZ9qoY4jx8ns82l9HN7GuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY5PR11MB6486.namprd11.prod.outlook.com (2603:10b6:930:32::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Mon, 28 Apr
 2025 21:46:52 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 21:46:52 +0000
Date: Mon, 28 Apr 2025 14:48:14 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v4 17/18] drm/xe/svm: Implement prefetch support for SVM
 ranges
Message-ID: <aA/3nrQgNq8uGaFZ@lstrano-desk.jf.intel.com>
References: <20250428103224.69534-1-himal.prasad.ghimiray@intel.com>
 <20250428103224.69534-18-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250428103224.69534-18-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: SJ2PR07CA0012.namprd07.prod.outlook.com
 (2603:10b6:a03:505::13) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY5PR11MB6486:EE_
X-MS-Office365-Filtering-Correlation-Id: 8eb368b7-aba3-4b35-9a39-08dd869e2fcc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8+I21yRTJkK2rPKuSZhLckHX64Jc1ZEagMASP/lh9wQKTU81ZnIPfPHK1Nk2?=
 =?us-ascii?Q?FHYN13RzzDZ/wcTQP4B70MhZeC4nssw+mi8xxRvupHEqxd8DFeXS+fcTtFxK?=
 =?us-ascii?Q?Q5APUUDBwP4lA9Y4/7BlRIjwHjHLxqwV2qS9fyQqokjfwHn5LZhVeJzYnmRt?=
 =?us-ascii?Q?fR+JPpUgc7z1xaDTd7C9eILyEUlpPprcbm/XFaBXXopn58F3lbwXoKf3lKVx?=
 =?us-ascii?Q?SjXXYu2uf1S/2FA997k6vfet5uLNeSP9sowwd7K74LJd9yItqhFUAKlZjlsb?=
 =?us-ascii?Q?k8z/MRs283y62ZDcEvMDviwtQvABjyTvUBUgkTckAcC+Chqt2+rDMY34yVx/?=
 =?us-ascii?Q?BrDXWjDlxiY17Le2BW54OmJCsKEvTJmxrJjB0Z4UYXpGTyrJywffuTJI74l/?=
 =?us-ascii?Q?72OR8V7xbvHn2dDvZtk93SP2cZFPhctP6C98mXlCjgXKqq8p1eWdb4R/lgEM?=
 =?us-ascii?Q?VUlbUeXZX1OlHrFTfXt2YrZ6h+Z30r3i0NH8NUPdjI60ddcJklwNFsVO7IiN?=
 =?us-ascii?Q?obiwwE/DUsswdHquVYwHX5jwHaylFKS5fzUZ3tEMKnUWYMIUInurGYE62eT7?=
 =?us-ascii?Q?E85/lCta/ynJMv9BrjuAFNtiENt9OAAa/O/zyNMoro5+Tpghi1amxCItD3lJ?=
 =?us-ascii?Q?VPGmI15gAtsoJbs30xj8Ed7lZXiTSDAkte89cU75wiUntSbFRcPNRhU9G0sy?=
 =?us-ascii?Q?8+YseH57AGt+tTly7zXGLW/2MYf/w4bKgagmUyFE/y/K3tBM8H0sTSIyA+Kg?=
 =?us-ascii?Q?RPtFluFHEHaejnp82H+4Mhoq0oKku9pHxIB+PJHhCOREGc4yV4UDne9COaUl?=
 =?us-ascii?Q?l1GMYhigRj1yGSRBbPPnFQxgWaenT9ZddK4kSQJxoCF4qZsyGk/nrSSoWBRl?=
 =?us-ascii?Q?//9j6a8z56rKrQPA44SfQrLfGF62aSA1XY/uUn87hsVIZxNVRqOoLi5oNwPB?=
 =?us-ascii?Q?r+czwhxjokYqgwYNslnGkBRjb7QfgC2XIXFDdDV6UNE5KAxzGmUGNTUSdhMx?=
 =?us-ascii?Q?lQ8INb1slUGgX3/GHOysGfavag6xWu8/cBMkyb8ghdcbHvvUV0f5qPvQwqvR?=
 =?us-ascii?Q?4TKBhwbSkn+NQlrnWouh7DcfgiiXfCffEaO2cxPGCxOg2QrdAJnVrUxK/zfb?=
 =?us-ascii?Q?9es7FK0EtbewYHJAf0gnrq+VYvDzNh4ZQ70KcfJDQfu0mjmmr4EWCWmgLNZv?=
 =?us-ascii?Q?1Sf9ghig3KiITlYJj5fAs1K+/LXNcKu7tBFi/GdMjeFT58cC9NyoU7a16JGF?=
 =?us-ascii?Q?+LBqRCXI3FVKE/TadKesuF3I+4BEX8Qop+Yg5WyswRxlEGockm/jngr11NEc?=
 =?us-ascii?Q?A97/HVdmdEmYH7HF9WfZff1dHxsT6OiwIc98JQdmY3rKYPnouP+zhk/sSkOW?=
 =?us-ascii?Q?fW8og8ZrMTmcm11Yq7HDcnJoU3YZFJ83EZsLJTco2P60NBTCRsdYLk3wC7Ma?=
 =?us-ascii?Q?/4o6+AtW53I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9L0XObehm7q0utakf2k6xknB2nNleY2vaqALZABd40O06BGfYzXmm/rIHghj?=
 =?us-ascii?Q?9Ju4P6ZAOTFXXFS1ISSAepzM+NUxBZ96dLTafADTKBdYPwDrhrnh5N+UxWou?=
 =?us-ascii?Q?kdAODIBPp5lJsEkqzuEDXPH9CGsi/LtsqaX/1dxeag4tYwXbyZayG5NfLv7+?=
 =?us-ascii?Q?3ZwqhWuIAL7O+aqLYkn2m2to05T6A4E5C7AJsRsjBWBRpuLmtHh5Szxak9mC?=
 =?us-ascii?Q?cTcfON+skLrAzMcQjlnpzL9LXhuvOTPVIW8y1yU0IA/Hf0ryfkQc/V++3gRI?=
 =?us-ascii?Q?TeEMHzmd2GJ2w+7GXl/YNJehI00yED07VtzPyblhQeXt2+N3k4TPkxjt9+F7?=
 =?us-ascii?Q?qEY20FOZPNJ6jYtaNqVc92Nqh8B5c+lULm3+gp5MJOBgIV0xPLPjDY1sOOM8?=
 =?us-ascii?Q?e0EbDqTA4hG2KZjGv0UnloxCA0AL72V+1HiBpOamdJkLpoOnvWpHOhZzrdGM?=
 =?us-ascii?Q?cAeCDwnJLTKruJflNboR92IjpXy7zsSiUwBmlY3kajTlzS2CtjB6uHKbsKde?=
 =?us-ascii?Q?m0ge7f7Ye3ct05+Y1knGLt8LYUlI4w9UBFKozzPfCKczrdWw304V6lT47Kpv?=
 =?us-ascii?Q?p7gLPKT5X3Ebf1r59i5+w/bmCpZu/nAtevCTE58m+r9BHXsuUPwlI07tLh4E?=
 =?us-ascii?Q?Wt/wwxBhr/MP3vmZHyK82vjP2mYYQpvb9T38TX67SfLddeGPGI3dyvFtITXL?=
 =?us-ascii?Q?9kupB6LJuCYkWLFwGwF8+mH9kHmwJ7KWLZnsQeOz32ZoFU0VtvVlmSvdrPFy?=
 =?us-ascii?Q?kW4I9JGXAy/RWiEXS9YiArJMqDcNzt3OtnninuRV7DvKXYX1DFk9nBi7adU9?=
 =?us-ascii?Q?oFBw8ferUP6tJlMP/MCZ1dhmaE3wDY8Fp42/83PUPV0rNDw5j5e6rWOkfT/m?=
 =?us-ascii?Q?hWxt8Wavvc8zMW+iJi3rkq8Vz8Lb9gGxaM4ncrhb4k+0U0eLz+LVbpVaD8Tz?=
 =?us-ascii?Q?NX+m/KB7ihJnbyRAGqVo1gIEkUzJBuib/PGz48QhxC1I+dob1E6wLL4izQRM?=
 =?us-ascii?Q?jQr2mm+on8/GHqDsBd9eUNWMvNoiy+i3HGqmTKvgLRH6nm+VyXk4Bq+GdpKL?=
 =?us-ascii?Q?JtcvVy+sZ/g3JmSjqg3hM7dl11sMzaZHWKTIfD0S8xEdNcOaMvIb3BiFwzaG?=
 =?us-ascii?Q?uUBR6/yhy1fya+axqizCQcW5YbSlea2mBRxHNN9XjnQuCheI1ep2P7wE/kg8?=
 =?us-ascii?Q?5TpwrJCdurvv4VdSVTTGM8NGUEevyMpM/6OpUBSTQz0VlhDkRcfgrzFNe02M?=
 =?us-ascii?Q?teN/Q+TPV2Tz2ZIgDeq2J8V4sTjxg6JRSQuG/sHWEUNfe+hJ8xl1I8q2C2QG?=
 =?us-ascii?Q?FKZ+MCRZl4hP3evNYLlCc6spCnumKUwFKsCmy4EflZDoAdmpzXcrQacEAg02?=
 =?us-ascii?Q?XWuzMZfdvQvmYu/pFmxYWmA+0iE/y0wCq+4RXJoGbu7TDBNDf6dghdhokp0L?=
 =?us-ascii?Q?cfRjnW0A9uU1hNyUCGPqfWsPNm8/ZN2bBusQ9ORWQ6xvf2pv2l3MHre0J5++?=
 =?us-ascii?Q?95xIAUKP41KpxJZWMQd2nlI0DjIFyRHVXB+zOovJEtTEMgBHSgk91/znOxWc?=
 =?us-ascii?Q?95OjADZf9G7G6q9zQoF2E7+hAfScvCSW7O3ZE/dNtQT9AMYeVK2nwVlJdjlP?=
 =?us-ascii?Q?Qg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8eb368b7-aba3-4b35-9a39-08dd869e2fcc
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 21:46:52.2892 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yj/wAbOGGJXPpr82jKg7rmIAWE212b2DEQUmmjOZ2AuJjvgAVjD0jFUvt5R4E+roLFVXxpiNH+sQU8NCI3+REQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6486
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

On Mon, Apr 28, 2025 at 04:02:23PM +0530, Himal Prasad Ghimiray wrote:
> This commit adds prefetch support for SVM ranges, utilizing the
> existing ioctl vm_bind functionality to achieve this.
> 
> v2: rebase
> 
> v3:
>    - use xa_for_each() instead of manual loop
>    - check range is valid and in preferred location before adding to
>      xarray
>    - Fix naming conventions
>    - Fix return condition as -ENODATA instead of -EAGAIN (Matthew Brost)
>    - Handle sparsely populated cpu vma range (Matthew Brost)
> 
> v4:
>    - fix end address to find next cpu vma in case of -ENOENT
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pt.c |  58 ++++++++---
>  drivers/gpu/drm/xe/xe_vm.c | 208 +++++++++++++++++++++++++++++++++++--
>  2 files changed, 245 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index de4e3edda758..f3a99ee4f733 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -1458,6 +1458,7 @@ static int xe_pt_svm_pre_commit(struct xe_migrate_pt_update *pt_update)
>  	struct xe_vm *vm = pt_update->vops->vm;
>  	struct xe_vma_ops *vops = pt_update->vops;
>  	struct xe_vma_op *op;
> +	unsigned long i;
>  	int err;
>  
>  	err = xe_pt_pre_commit(pt_update);
> @@ -1467,20 +1468,35 @@ static int xe_pt_svm_pre_commit(struct xe_migrate_pt_update *pt_update)
>  	xe_svm_notifier_lock(vm);
>  
>  	list_for_each_entry(op, &vops->list, link) {
> -		struct xe_svm_range *range = op->map_range.range;
> +		struct xe_svm_range *range = NULL;
>  
>  		if (op->subop == XE_VMA_SUBOP_UNMAP_RANGE)
>  			continue;
>  
> -		xe_svm_range_debug(range, "PRE-COMMIT");
> +		if (op->base.op == DRM_GPUVA_OP_PREFETCH) {
> +			xe_assert(vm->xe,
> +				  xe_vma_is_cpu_addr_mirror(gpuva_to_vma(op->base.prefetch.va)));
> +			xa_for_each(&op->prefetch_range.range, i, range) {
> +				xe_svm_range_debug(range, "PRE-COMMIT");
>  
> -		xe_assert(vm->xe, xe_vma_is_cpu_addr_mirror(op->map_range.vma));
> -		xe_assert(vm->xe, op->subop == XE_VMA_SUBOP_MAP_RANGE);
> +				if (!xe_svm_range_pages_valid(range)) {
> +					xe_svm_range_debug(range, "PRE-COMMIT - RETRY");
> +					xe_svm_notifier_unlock(vm);
> +					return -ENODATA;
> +				}
> +			}
> +		} else {
> +			xe_assert(vm->xe, xe_vma_is_cpu_addr_mirror(op->map_range.vma));
> +			xe_assert(vm->xe, op->subop == XE_VMA_SUBOP_MAP_RANGE);
> +			range = op->map_range.range;
>  
> -		if (!xe_svm_range_pages_valid(range)) {
> -			xe_svm_range_debug(range, "PRE-COMMIT - RETRY");
> -			xe_svm_notifier_unlock(vm);
> -			return -EAGAIN;
> +			xe_svm_range_debug(range, "PRE-COMMIT");
> +
> +			if (!xe_svm_range_pages_valid(range)) {
> +				xe_svm_range_debug(range, "PRE-COMMIT - RETRY");
> +				xe_svm_notifier_unlock(vm);
> +				return -EAGAIN;
> +			}
>  		}
>  	}
>  
> @@ -2065,11 +2081,20 @@ static int op_prepare(struct xe_vm *vm,
>  	{
>  		struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
>  
> -		if (xe_vma_is_cpu_addr_mirror(vma))
> -			break;
> +		if (xe_vma_is_cpu_addr_mirror(vma)) {
> +			struct xe_svm_range *range;
> +			unsigned long i;
>  
> -		err = bind_op_prepare(vm, tile, pt_update_ops, vma, false);
> -		pt_update_ops->wait_vm_kernel = true;
> +			xa_for_each(&op->prefetch_range.range, i, range) {
> +				err = bind_range_prepare(vm, tile, pt_update_ops,
> +							 vma, range);
> +				if (err)
> +					return err;
> +			}
> +		} else {
> +			err = bind_op_prepare(vm, tile, pt_update_ops, vma, false);
> +			pt_update_ops->wait_vm_kernel = true;
> +		}
>  		break;
>  	}
>  	case DRM_GPUVA_OP_DRIVER:
> @@ -2273,9 +2298,16 @@ static void op_commit(struct xe_vm *vm,
>  	{
>  		struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
>  
> -		if (!xe_vma_is_cpu_addr_mirror(vma))
> +		if (xe_vma_is_cpu_addr_mirror(vma)) {
> +			struct xe_svm_range *range = NULL;
> +			unsigned long i;
> +
> +			xa_for_each(&op->prefetch_range.range, i, range)
> +				range_present_and_invalidated_tile(vm, range, tile->id);
> +		} else {
>  			bind_op_commit(vm, tile, pt_update_ops, vma, fence,
>  				       fence2, false);
> +		}
>  		break;
>  	}
>  	case DRM_GPUVA_OP_DRIVER:
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 555ed10dac85..14c01e155cb7 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -798,10 +798,33 @@ static int xe_vma_ops_alloc(struct xe_vma_ops *vops, bool array_of_binds)
>  }
>  ALLOW_ERROR_INJECTION(xe_vma_ops_alloc, ERRNO);
>  
> +static void xe_vma_svm_prefetch_op_fini(struct xe_vma_op *op)
> +{
> +	struct xe_vma *vma;
> +
> +	vma = gpuva_to_vma(op->base.prefetch.va);
> +
> +	if (op->base.op == DRM_GPUVA_OP_PREFETCH && xe_vma_is_cpu_addr_mirror(vma))
> +		xa_destroy(&op->prefetch_range.range);
> +}
> +
> +static void xe_vma_svm_prefetch_ops_fini(struct xe_vma_ops *vops)
> +{
> +	struct xe_vma_op *op;
> +
> +	if (!(vops->flags & XE_VMA_OPS_FLAG_HAS_SVM_PREFETCH))
> +		return;
> +
> +	list_for_each_entry(op, &vops->list, link)
> +		xe_vma_svm_prefetch_op_fini(op);
> +}
> +
>  static void xe_vma_ops_fini(struct xe_vma_ops *vops)
>  {
>  	int i;
>  
> +	xe_vma_svm_prefetch_ops_fini(vops);
> +
>  	for (i = 0; i < XE_MAX_TILES_PER_DEVICE; ++i)
>  		kfree(vops->pt_update_ops[i].ops);
>  }
> @@ -2248,13 +2271,40 @@ static bool __xe_vm_needs_clear_scratch_pages(struct xe_vm *vm, u32 bind_flags)
>  	return true;
>  }
>  
> +static void xe_svm_prefetch_gpuva_ops_fini(struct drm_gpuva_ops *ops)
> +{
> +	struct drm_gpuva_op *__op;
> +
> +	drm_gpuva_for_each_op(__op, ops) {
> +		struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
> +
> +		xe_vma_svm_prefetch_op_fini(op);
> +	}
> +}
> +
> +static u64 find_cpu_vma_start_in_range(struct mm_struct *mm, u64 start, u64 end)

Ideally we should move this to GPU SVM as we shouldn't be looking CPU
VMAs in driver code rather the common DRM code.

With that, then a xe_svm layer wrapper too.

> +{
> +	struct vm_area_struct *vma;
> +	u64 addr = 0;
> +
> +	mmap_read_lock(mm);
> +
> +	vma = find_vma_intersection(mm, start, end);
> +	if (vma)
> +		addr =  max(start, vma->vm_start);
> +
> +	mmap_read_unlock(mm);
> +	return addr;
> +}
> +
>  /*
>   * Create operations list from IOCTL arguments, setup operations fields so parse
>   * and commit steps are decoupled from IOCTL arguments. This step can fail.
>   */
>  static struct drm_gpuva_ops *
> -vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
> -			 u64 bo_offset_or_userptr, u64 addr, u64 range,
> +vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
> +			 struct xe_bo *bo, u64 bo_offset_or_userptr,
> +			 u64 addr, u64 range,
>  			 u32 operation, u32 flags,
>  			 u32 prefetch_region, u16 pat_index)
>  {
> @@ -2262,6 +2312,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
>  	struct drm_gpuva_ops *ops;
>  	struct drm_gpuva_op *__op;
>  	struct drm_gpuvm_bo *vm_bo;
> +	u64 range_end = addr + range;
>  	int err;
>  
>  	lockdep_assert_held_write(&vm->lock);
> @@ -2323,14 +2374,79 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
>  			op->map.invalidate_on_bind =
>  				__xe_vm_needs_clear_scratch_pages(vm, flags);
>  		} else if (__op->op == DRM_GPUVA_OP_PREFETCH) {
> -			op->prefetch.region = prefetch_region;
> -		}
> +			struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
> +
> +			if (!xe_vma_is_cpu_addr_mirror(vma)) {
> +				op->prefetch.region = prefetch_region;
> +				break;
> +			}
>  
> +			struct drm_gpusvm_ctx ctx = {
> +			.read_only = xe_vma_read_only(vma),
> +			.devmem_possible = IS_DGFX(vm->xe) &&
> +					   IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR),
> +			};
> +

Does the compiler not complain for this declaration after an if
statement. I though C rules were all declartions before logic.

> +			struct xe_svm_range *svm_range;
> +			struct xe_tile *tile;
> +			u8 id, tile_mask = 0;
> +			u32 i;
> +
> +			for_each_tile(tile, vm->xe, id)
> +				tile_mask |= 0x1 << id;
> +
> +			xa_init_flags(&op->prefetch_range.range, XA_FLAGS_ALLOC);
> +			op->prefetch_range.region = prefetch_region;
> +			op->prefetch_range.ranges_count = 0;
> +alloc_next_range:
> +			svm_range = xe_svm_range_find_or_insert(vm, addr, vma, &ctx);
> +
> +			if (PTR_ERR(svm_range) == -ENOENT) {
> +				addr = find_cpu_vma_start_in_range(vm->svm.gpusvm.mm,
> +								   max(addr, xe_vma_start(vma)),
> +								   min(range_end, xe_vma_end(vma)));
> +				if (addr)
> +					goto alloc_next_range;

Won't this cause a problem in xe_svm_range_end(svm_range) below as
svm_range is PTR_ERR?

> +				else
> +					continue;

s/continue/goto print_op_label/

> +			}
> +
> +			if (IS_ERR(svm_range)) {
> +				err = PTR_ERR(svm_range);
> +				goto unwind_prefetch_ops;
> +			}
> +
> +			if (xe_svm_range_validate_and_evict(vm, svm_range,
> +							    tile_mask, !!prefetch_region))
> +				goto check_next_range;
> +
> +			err = xa_alloc(&op->prefetch_range.range,
> +				       &i, svm_range, xa_limit_32b,
> +				       GFP_KERNEL);
> +
> +			if (err)
> +				goto unwind_prefetch_ops;
> +
> +			op->prefetch_range.ranges_count++;
> +			vops->flags |= XE_VMA_OPS_FLAG_HAS_SVM_PREFETCH;
> +check_next_range:
> +			if (range_end > xe_svm_range_end(svm_range) &&
> +			    xe_svm_range_end(svm_range) < xe_vma_end(vma)) {
> +				addr = xe_svm_range_end(svm_range);
> +				goto alloc_next_range;
> +			}
> +		}

print_op_label:

>  		print_op(vm->xe, __op);
>  	}
>  
>  	return ops;
> +
> +unwind_prefetch_ops:
> +	xe_svm_prefetch_gpuva_ops_fini(ops);
> +	drm_gpuva_ops_free(&vm->gpuvm, ops);
> +	return ERR_PTR(err);
>  }
> +
>  ALLOW_ERROR_INJECTION(vm_bind_ioctl_ops_create, ERRNO);
>  
>  static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
> @@ -2645,8 +2761,12 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
>  					return err;
>  			}
>  
> -			if (!xe_vma_is_cpu_addr_mirror(vma))
> +			if (xe_vma_is_cpu_addr_mirror(vma))
> +				xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask,
> +							      op->prefetch_range.ranges_count);
> +			else
>  				xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask, 1);
> +
>  			break;
>  		default:
>  			drm_warn(&vm->xe->drm, "NOT POSSIBLE");
> @@ -2772,6 +2892,50 @@ static int check_ufence(struct xe_vma *vma)
>  	return 0;
>  }
>  
> +static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_op *op)
> +{
> +	struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
> +	int err = 0;
> +
> +	struct xe_svm_range *svm_range;
> +	struct xe_tile *tile;
> +	unsigned long i;
> +	u32 region;
> +
> +	if (!xe_vma_is_cpu_addr_mirror(vma))
> +		return 0;
> +	region = op->prefetch_range.region;
> +	struct drm_gpusvm_ctx ctx = {
> +		.read_only = xe_vma_read_only(vma),
> +		.devmem_possible = IS_DGFX(vm->xe) && IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR),
> +		.check_pages_threshold = IS_DGFX(vm->xe) &&
> +					 IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR) ? SZ_64K : 0,
> +		.devmem_only = region && IS_DGFX(vm->xe) && IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR),
> +	};


Same question here about a declartion after logic, pretty sure some
compilers will complain.

Matt

> +	/* TODO: Threading the migration */
> +	xa_for_each(&op->prefetch_range.range, i, svm_range) {
> +		if (xe_svm_range_needs_migrate_to_vram(svm_range, vma, region)) {
> +			tile = &vm->xe->tiles[region_to_mem_type[region] - XE_PL_VRAM0];
> +			err = xe_svm_alloc_vram(vm, tile, svm_range, &ctx);
> +			if (err) {
> +				drm_dbg(&vm->xe->drm, "VRAM allocation failed, retry from userspace, asid=%u, gpusvm=%p, errno=%pe\n",
> +					vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
> +				return -ENODATA;
> +			}
> +		}
> +
> +		err = xe_svm_range_get_pages(vm, svm_range, &ctx);
> +		if (err) {
> +			if (err == -EOPNOTSUPP || err == -EFAULT || err == -EPERM)
> +				err = -ENODATA;
> +			drm_dbg(&vm->xe->drm, "Get pages failed, asid=%u, gpusvm=%p, errno=%pe\n",
> +				vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
> +			return err;
> +		}
> +	}
> +	return err;
> +}
> +
>  static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
>  			    struct xe_vma_op *op)
>  {
> @@ -2809,7 +2973,12 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
>  	case DRM_GPUVA_OP_PREFETCH:
>  	{
>  		struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
> -		u32 region = op->prefetch.region;
> +		u32 region;
> +
> +		if (xe_vma_is_cpu_addr_mirror(vma))
> +			region = op->prefetch_range.region;
> +		else
> +			region = op->prefetch.region;
>  
>  		xe_assert(vm->xe, region <= ARRAY_SIZE(region_to_mem_type));
>  
> @@ -2828,6 +2997,25 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
>  	return err;
>  }
>  
> +static int vm_bind_ioctl_ops_prefetch_ranges(struct xe_vm *vm, struct xe_vma_ops *vops)
> +{
> +	struct xe_vma_op *op;
> +	int err;
> +
> +	if (!(vops->flags & XE_VMA_OPS_FLAG_HAS_SVM_PREFETCH))
> +		return 0;
> +
> +	list_for_each_entry(op, &vops->list, link) {
> +		if (op->base.op  == DRM_GPUVA_OP_PREFETCH) {
> +			err = prefetch_ranges(vm, op);
> +			if (err)
> +				return err;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>  static int vm_bind_ioctl_ops_lock_and_prep(struct drm_exec *exec,
>  					   struct xe_vm *vm,
>  					   struct xe_vma_ops *vops)
> @@ -3478,7 +3666,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  		u32 prefetch_region = bind_ops[i].prefetch_mem_region_instance;
>  		u16 pat_index = bind_ops[i].pat_index;
>  
> -		ops[i] = vm_bind_ioctl_ops_create(vm, bos[i], obj_offset,
> +		ops[i] = vm_bind_ioctl_ops_create(vm, &vops, bos[i], obj_offset,
>  						  addr, range, op, flags,
>  						  prefetch_region, pat_index);
>  		if (IS_ERR(ops[i])) {
> @@ -3511,6 +3699,10 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  	if (err)
>  		goto unwind_ops;
>  
> +	err = vm_bind_ioctl_ops_prefetch_ranges(vm, &vops);
> +	if (err)
> +		goto unwind_ops;
> +
>  	fence = vm_bind_ioctl_ops_execute(vm, &vops);
>  	if (IS_ERR(fence))
>  		err = PTR_ERR(fence);
> @@ -3580,7 +3772,7 @@ struct dma_fence *xe_vm_bind_kernel_bo(struct xe_vm *vm, struct xe_bo *bo,
>  
>  	xe_vma_ops_init(&vops, vm, q, NULL, 0);
>  
> -	ops = vm_bind_ioctl_ops_create(vm, bo, 0, addr, bo->size,
> +	ops = vm_bind_ioctl_ops_create(vm, &vops, bo, 0, addr, bo->size,
>  				       DRM_XE_VM_BIND_OP_MAP, 0, 0,
>  				       vm->xe->pat.idx[cache_lvl]);
>  	if (IS_ERR(ops)) {
> -- 
> 2.34.1
> 
