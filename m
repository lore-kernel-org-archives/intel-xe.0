Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00DFAC71157
	for <intel-xe@archiver.kernel.org>; Wed, 18 Jun 2025 23:49:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ACB810E3C9;
	Wed, 18 Jun 2025 23:49:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E+hms7S5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08B3710E3C9
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Jun 2025 23:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750290586; x=1781826586;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=F0QUpw/K9h5jg6FYiF0r/lhze+4/SV43LjpUGdOnNZM=;
 b=E+hms7S52oreYUHc3M4kBlTaCEf3gq5ua37k+3RXlmKNO4zu/Y58Ph8M
 EGmeWQQGtywYVgOwJ2uV/aY5IWrBehO8RagvxEc/3uQY+IjggKWZar/LP
 ygtTUWBf2HHAw+4T3A6dCjLCyBly7jucPztgB9ujQ7QhKqr/Lr5H5QMhd
 k12Q8HtLPs923RoShUSWvbciUlOhjEttij6FW7eofGwl8Urs1b/u8GVCR
 9SHfbSd+InqjveSC9AAyPUjHOqakffugZHpiHn7wfCB49RlINee8NlzCg
 eVmBsuz7WcEsc9ahEVL60jeX1Tr3w6RMTa8j5n6YS2wlCnXPYReQJnqOD g==;
X-CSE-ConnectionGUID: EeAeGlCjRQSoU2FTIDTTkw==
X-CSE-MsgGUID: 2QLlSg7qQg6GIw97hHCIzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="63886606"
X-IronPort-AV: E=Sophos;i="6.16,247,1744095600"; d="scan'208";a="63886606"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 16:49:41 -0700
X-CSE-ConnectionGUID: 0xcRGB/fSZmGjdrL+keHTw==
X-CSE-MsgGUID: l22B7/MTTi6QCz2v3/vCGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,247,1744095600"; d="scan'208";a="155016897"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 16:49:41 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 18 Jun 2025 16:49:40 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 18 Jun 2025 16:49:40 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.85)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 18 Jun 2025 16:49:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YAkFcGOBYGLJsEWRJPVsA/8mLYuHkUqQUh8db4CPOGtOgOorxfFEnFBLkyhINhawgehE9S/x3oq6UBDzBPhulfpmzgFz4oKj9uL+DOIQo0WOdWb52mjnTGm679ZZtYL+PK6Lic9JT2Q9gbAjsAtCMD+CEh74V7+qzUsPKI8N4teDbZOdDVrPbIN1KKihdH2jUIAx1JSfRcgfW7guNop/2DkSXNWOmxhoUoaluoackB1w19mpemykGXUYkEOfWeqqz66z/XGZcwN84f92zggXlAO1LOwLE2vxco6aEvZYU9YtYM2AoSIerl6LqVG5+XHDY6ccbhw9XKE6Fr4HHeIAyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bAQ6+QnnwGigFD483vxknFZKGUQlOpA1JKyb9ILV9+4=;
 b=lJFciz6+9G5lefrP+mFlWw4yWyS/6QzxHF+cc+fLWSpGcVKOM4wCpra6nbiFgyDfHxWMJULen0oEMz6dB3eoDBZcm/eQX/FI5Nf6X2bdlWFhsKdNjNGnjni4jbq6wBiUPex7VnS95pPdN2ywhc0qHBW3V2EHKwdwhHqDQkIRj0A8u0W81XFXqz/fRU1ILbMil9Sl3VtA6RTCfwd/p6LTVxZ5GMDWSaKGINyZR9cNdwHbs6fx5MDMUjENh/7Rqy3xmWncTl3JXUy3pd79raxL3/pZ2PfdYZA93wgFDnf2JLe4S2l96eV+LAIN4xYh7qWYnCD3T8mC6d1D5mB37a104Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH3PR11MB8415.namprd11.prod.outlook.com (2603:10b6:610:17b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Wed, 18 Jun
 2025 23:49:36 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8857.016; Wed, 18 Jun 2025
 23:49:35 +0000
Date: Wed, 18 Jun 2025 16:51:13 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <thomas.hellstrom@linux.intel.com>, <himal.prasad.ghimiray@intel.com>,
 <matthew.auld@intel.com>
Subject: Re: [PATCH 6/6]  drm/xe: Use GT TLB invalidation jobs in PT layer
Message-ID: <aFNQ8d7++Vao2R0q@lstrano-desk.jf.intel.com>
References: <20250617153730.2136174-1-matthew.brost@intel.com>
 <20250617153730.2136174-7-matthew.brost@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250617153730.2136174-7-matthew.brost@intel.com>
X-ClientProxiedBy: SJ2PR07CA0010.namprd07.prod.outlook.com
 (2603:10b6:a03:505::27) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH3PR11MB8415:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e87cfff-4b00-479f-d442-08ddaec2c7c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?3aG+MrUDUTl1vdSsN4mGky1MbjOndq8ESjujc4dty8SafAUJv6sQLXmtPy?=
 =?iso-8859-1?Q?CTLZ/AC6ULIBdlBch/DaX2XIfOG2ofLfB01pMrBLxnx/W2sYlmlMOuUZ7p?=
 =?iso-8859-1?Q?npsxO6BqMqlfnifBhQYuGpgpWvzNZ+GExSJvVshjtAn5v3U0wmPhP6PzK9?=
 =?iso-8859-1?Q?Btf4F2+VFt8l0st/LlzzdqYGEPayqm/pEmvv7cbKghMlRfLbr95QJJqEcS?=
 =?iso-8859-1?Q?K2r7fP6tpyIohusHi9D3PLU3OJa+j5yCJag8vDpZCRVX5aqiZAP5V6fkAQ?=
 =?iso-8859-1?Q?7D50I4jqtiAcg+Tn6Z6TMaVjz8+K8UccvclZtClE3h+vRiFdbh27sabsuj?=
 =?iso-8859-1?Q?2CnDHzo8Y8e9xGG3rDDxisraXJcvg7UWmMjBUr7HnkszpUQSdlKQc/PaMf?=
 =?iso-8859-1?Q?0G5PbgZBuC1C8F6xFu8K90KiBPCjsk1ZLLOH6aeBTvaXcwzk9z+kO3KroR?=
 =?iso-8859-1?Q?WcizMtAIpGygtUJwu3HBoNH5pw9IjIKVGeXOFDWq3KSs8vcfFcgQ+uCZLq?=
 =?iso-8859-1?Q?rXXrX/51tk0ASZRGxPr2Dyp3tRorHY9b+N9IJN2cPPrmSfuFY+zM4PdjZc?=
 =?iso-8859-1?Q?RKrdxH9nZ3hguKLAGWsb1LPwBJdLkuyeq1MkQwqcIKa2HHucmJ8WXR/qgs?=
 =?iso-8859-1?Q?/akMPRJLt+yfl9KxjibuNUFKCigcef6VaVYNgHDqV/fzGv+mZ/BMAPFqJL?=
 =?iso-8859-1?Q?AR70wm2rMWQVBaLS9oabJXtd3y9gUTiDaMofBdzb1j219CW977YK8CwFUW?=
 =?iso-8859-1?Q?DGrI6uesScMtC3bp9P0PWppqA1Ay34AZnEog9ulN6Ejd0jc4xLXyWQvMPA?=
 =?iso-8859-1?Q?ScloGykqeP+QvoVBvzWqb2aextCilpfrXQ1IA0yDmZrBnpDtlQOxUhPJ+/?=
 =?iso-8859-1?Q?xd+5l/ebHpw733KZtlblb9zaJLOowhKuJk441CHA+O8ZTlF7fKKnR+RoEC?=
 =?iso-8859-1?Q?9S8t3kwmmiOBjQKtuhfT/9gb+jxGxGgM1xQgzVOc+qV4WrgrcRrqbJ4HCy?=
 =?iso-8859-1?Q?RsusWhUDmbXC3y1cqYmPQajyOQT5dIiDOFWclxbndLlrjDeO/h8oViaYfX?=
 =?iso-8859-1?Q?hlx6p/ng81SU1u0L1UEN/Dn4ToBhfAMpk/TfvUI79soCeRUfxVf/P/ijzm?=
 =?iso-8859-1?Q?P7CefYy79deim1SXA03edxdRR0QPFDLPHQSPZCmMH8uiV5A0lcHUpVMuqQ?=
 =?iso-8859-1?Q?JiwRLhRV00/pa8sa8dc2kRqMsdEn+9Kq0rfl1y/JqL7y470J1l7zRC3+sp?=
 =?iso-8859-1?Q?BQshj8u76EKsgNH9K3RDOK69HXV3XcAdD22JMGDqQqM5apQELYd5zCc06n?=
 =?iso-8859-1?Q?95dCuydtk3nUagDfynva1PQXC8Gf6UcjPFm6fe/sdY6B0od4lMKaS1zFh5?=
 =?iso-8859-1?Q?KIX027Bnfua6rn4Joe26OvMCOfTxkHc7TshvrfW+E+4YUhxIlRvy0dG0Ss?=
 =?iso-8859-1?Q?pWkYSuynsicj2tfGcsYK5mFxki3mQ0rHjpxXynHi/A/pXRbWL2OtPOIMQC?=
 =?iso-8859-1?Q?s=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?x9O4vSzfN3A2bikiKOYytHCVrRLImEuDsIOlX/3Isw4YG4a3e7/YBU9baV?=
 =?iso-8859-1?Q?zxrF/u38zv5vxtW6orTHhGFCvgoXyXT6IAzvb3hvFY9BLrWiIu5AOnz1g+?=
 =?iso-8859-1?Q?A9M37tjf7+bC3JuA+00vGnwoLRMs2Kr2G2YkgfLuaq0ywJdpo5DvydxAy1?=
 =?iso-8859-1?Q?SWlrio439bPFalyzq0DItSxF7582ncnmfvKIFRdhkeFjhj4F3prdBHQJn4?=
 =?iso-8859-1?Q?v1PtQjsdKI1oysZZi2HzMayuojyM/OwfVbtKk6xIraYW4dqHGm1/wbZ8dC?=
 =?iso-8859-1?Q?q2Vi44nSIFabYCs/7Rtovzn9+i+VHISPRCM/3vEq5sV44k4Sxj0gZ91TQJ?=
 =?iso-8859-1?Q?7/Lsqm7rbxFolTdy7dbXJlxwYyy4UcjZ7QtbjpWdyVnovCVpVLxmdr8vqp?=
 =?iso-8859-1?Q?2z1jr18Tctx/VvgfGgBDcbRTAruBho1LHKqf6Cb+0B9aZs8xu60bjSrrWn?=
 =?iso-8859-1?Q?rS/ULDx6N/dcQnkcxA8X/RRyuP9SbKZCu9X113DYrIVhLLaE2LFDL08L08?=
 =?iso-8859-1?Q?G6JfQIoNWiYn7zjk8N/UxqRvCmq2FH0j5NpgzARTg04T4N3YjDdXdak1UL?=
 =?iso-8859-1?Q?Nc0TguDjgcWpJog7UrnSJa6TnT6hpkzMpTeOXNsc4A5uZywaZ38HJYs+NC?=
 =?iso-8859-1?Q?9o3TxRUz0bUazB/ULOcdRaC/LiqLNdXnyqme6Rbw6twMXaYDOPB43dPIsi?=
 =?iso-8859-1?Q?KZysW9LDLGQUNls/SAGiympEElKQd1BIuVaqZ1JLI3UuV9PsDoU1b38Dhv?=
 =?iso-8859-1?Q?JK2dQQ1EmHItNX6GqC7T64u+tHak5rl7d7O7Ls5ueC8d+OE09BbNj/zSkX?=
 =?iso-8859-1?Q?Tr6655+1Y1lQXOWQT0qcDnVriul2INl9GWyaTCZmizaM8lM4TVtki0JXxS?=
 =?iso-8859-1?Q?XHzTHxqWf3yvk15HQlfnIS2UNhPWJ9UBLBqIkXEQ9OO+UUpOByHKJoV7VM?=
 =?iso-8859-1?Q?zTIzupCt0n0TdlxwR5rU6MAlkn/RfTUvdZwves60ey2sazkG/95oEwwwJg?=
 =?iso-8859-1?Q?/+qrFhAC21OtDKQvh1BoCye2IdVidU1GgoYD+OcwzpmdvNNeIolPn2Pp3Q?=
 =?iso-8859-1?Q?YjD1mO20jpaBYvDDV0LMT9mBc6oqecgBcXRAey4fH1O8POcjkVUlEkUjtS?=
 =?iso-8859-1?Q?LLKmzTpzolEH/ytIEVLO8Ne6T5Nweli+tKaMH47Wrwdgnn0cIwGBhUrM9P?=
 =?iso-8859-1?Q?Rg4sSqbN56uFjySpY/Lpk7Tq2l56eF/m1BeESxjIEqnGNWV7DwydrUTAI9?=
 =?iso-8859-1?Q?rEYEFenAg3kityChv4oyXBIamdE0zP41hOi0dk43cIGrAWbsXvVLoiXdbM?=
 =?iso-8859-1?Q?fQJ4307ACmdP5y040EgGSpt3vqbFZmnd16ZY6xNy8rg7osbiv16XosphV3?=
 =?iso-8859-1?Q?/jXE65EpY17pnDa3EOdmoRJQrgu7lgpsbst1rElejAaAB+4sp0l1oen9h8?=
 =?iso-8859-1?Q?6qQLwu7bUxMulDdgIx0ZEVnW9XxKL48EhcV9qv2oQa6ShRWUPTU3PFMGLY?=
 =?iso-8859-1?Q?udKIyaV2H8LmC8XoZArNWl9c2izezxN8s3xkw2nZQ2TyzwZwOi9r2GcS/m?=
 =?iso-8859-1?Q?rScZqEypmWrFdeWlK5G0r7+yDMTY7w+PfxO4Vxm2bZpt0LfPUJGlNn6UCJ?=
 =?iso-8859-1?Q?LD0eCPq3Ry01NcxRge8gen9IjxmKRqs6L1JqjN3LammnXMJHV0rblg0Q?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e87cfff-4b00-479f-d442-08ddaec2c7c4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 23:49:35.6894 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WaZzqqD0uLrtT+HlFmkh1tufpjXTFN1arjEy8VRb0+fQ5kv4ALueT1au0S+Fe9wV2uOe1wr1/64b3FfEJaPMHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8415
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

On Tue, Jun 17, 2025 at 08:37:30AM -0700, Matthew Brost wrote:
> Rather than open-coding GT TLB invalidations in the PT layer, use GT TLB
> invalidation jobs. The real benefit is that GT TLB invalidation jobs use
> a single dma-fence context, allowing the generated fences to be squashed
> in dma-resv/DRM scheduler.
> 
> Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_migrate.h |   9 ++
>  drivers/gpu/drm/xe/xe_pt.c      | 193 +++++++++++++-------------------
>  2 files changed, 88 insertions(+), 114 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
> index e9d83d320f8c..605398ea773e 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.h
> +++ b/drivers/gpu/drm/xe/xe_migrate.h
> @@ -14,6 +14,7 @@ struct ttm_resource;
>  
>  struct xe_bo;
>  struct xe_gt;
> +struct xe_gt_tlb_inval_job;
>  struct xe_exec_queue;
>  struct xe_migrate;
>  struct xe_migrate_pt_update;
> @@ -89,6 +90,14 @@ struct xe_migrate_pt_update {
>  	struct xe_vma_ops *vops;
>  	/** @job: The job if a GPU page-table update. NULL otherwise */
>  	struct xe_sched_job *job;
> +	/**
> +	 * @ijob: The GT TLB invalidation job for primary tile. NULL otherwise
> +	 */
> +	struct xe_gt_tlb_inval_job *ijob;
> +	/**
> +	 * @mjob: The GT TLB invalidation job for media tile. NULL otherwise
> +	 */
> +	struct xe_gt_tlb_inval_job *mjob;
>  	/** @tile_id: Tile ID of the update */
>  	u8 tile_id;
>  };
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 971e55fd0061..8113223de61f 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -13,7 +13,7 @@
>  #include "xe_drm_client.h"
>  #include "xe_exec_queue.h"
>  #include "xe_gt.h"
> -#include "xe_gt_tlb_invalidation.h"
> +#include "xe_gt_tlb_inval_job.h"
>  #include "xe_migrate.h"
>  #include "xe_pt_types.h"
>  #include "xe_pt_walk.h"
> @@ -1261,6 +1261,8 @@ static int op_add_deps(struct xe_vm *vm, struct xe_vma_op *op,
>  }
>  
>  static int xe_pt_vm_dependencies(struct xe_sched_job *job,
> +				 struct xe_gt_tlb_inval_job *ijob,
> +				 struct xe_gt_tlb_inval_job *mjob,
>  				 struct xe_vm *vm,
>  				 struct xe_vma_ops *vops,
>  				 struct xe_vm_pgtable_update_ops *pt_update_ops,
> @@ -1328,6 +1330,20 @@ static int xe_pt_vm_dependencies(struct xe_sched_job *job,
>  	for (i = 0; job && !err && i < vops->num_syncs; i++)
>  		err = xe_sync_entry_add_deps(&vops->syncs[i], job);
>  
> +	if (job) {
> +		if (ijob) {
> +			err = xe_gt_tlb_inval_job_alloc_dep(ijob);
> +			if (err)
> +				return err;
> +		}
> +
> +		if (mjob) {
> +			err = xe_gt_tlb_inval_job_alloc_dep(mjob);
> +			if (err)
> +				return err;
> +		}
> +	}
> +
>  	return err;
>  }
>  
> @@ -1339,7 +1355,8 @@ static int xe_pt_pre_commit(struct xe_migrate_pt_update *pt_update)
>  	struct xe_vm_pgtable_update_ops *pt_update_ops =
>  		&vops->pt_update_ops[pt_update->tile_id];
>  
> -	return xe_pt_vm_dependencies(pt_update->job, vm, pt_update->vops,
> +	return xe_pt_vm_dependencies(pt_update->job, pt_update->ijob,
> +				     pt_update->mjob, vm, pt_update->vops,
>  				     pt_update_ops, rftree);
>  }
>  
> @@ -1509,75 +1526,6 @@ static int xe_pt_svm_pre_commit(struct xe_migrate_pt_update *pt_update)
>  }
>  #endif
>  
> -struct invalidation_fence {
> -	struct xe_gt_tlb_invalidation_fence base;
> -	struct xe_gt *gt;
> -	struct dma_fence *fence;
> -	struct dma_fence_cb cb;
> -	struct work_struct work;
> -	u64 start;
> -	u64 end;
> -	u32 asid;
> -};
> -
> -static void invalidation_fence_cb(struct dma_fence *fence,
> -				  struct dma_fence_cb *cb)
> -{
> -	struct invalidation_fence *ifence =
> -		container_of(cb, struct invalidation_fence, cb);
> -	struct xe_device *xe = gt_to_xe(ifence->gt);
> -
> -	trace_xe_gt_tlb_invalidation_fence_cb(xe, &ifence->base);
> -	if (!ifence->fence->error) {
> -		queue_work(system_wq, &ifence->work);
> -	} else {
> -		ifence->base.base.error = ifence->fence->error;
> -		xe_gt_tlb_invalidation_fence_signal(&ifence->base);
> -	}
> -	dma_fence_put(ifence->fence);
> -}
> -
> -static void invalidation_fence_work_func(struct work_struct *w)
> -{
> -	struct invalidation_fence *ifence =
> -		container_of(w, struct invalidation_fence, work);
> -	struct xe_device *xe = gt_to_xe(ifence->gt);
> -
> -	trace_xe_gt_tlb_invalidation_fence_work_func(xe, &ifence->base);
> -	xe_gt_tlb_invalidation_range(ifence->gt, &ifence->base, ifence->start,
> -				     ifence->end, ifence->asid);
> -}
> -
> -static void invalidation_fence_init(struct xe_gt *gt,
> -				    struct invalidation_fence *ifence,
> -				    struct dma_fence *fence,
> -				    u64 start, u64 end, u32 asid)
> -{
> -	int ret;
> -
> -	trace_xe_gt_tlb_invalidation_fence_create(gt_to_xe(gt), &ifence->base);
> -
> -	xe_gt_tlb_invalidation_fence_init(gt, &ifence->base, false);
> -
> -	ifence->fence = fence;
> -	ifence->gt = gt;
> -	ifence->start = start;
> -	ifence->end = end;
> -	ifence->asid = asid;
> -
> -	INIT_WORK(&ifence->work, invalidation_fence_work_func);
> -	ret = dma_fence_add_callback(fence, &ifence->cb, invalidation_fence_cb);
> -	if (ret == -ENOENT) {
> -		dma_fence_put(ifence->fence);	/* Usually dropped in CB */
> -		invalidation_fence_work_func(&ifence->work);
> -	} else if (ret) {
> -		dma_fence_put(&ifence->base.base);	/* Caller ref */
> -		dma_fence_put(&ifence->base.base);	/* Creation ref */
> -	}
> -
> -	xe_gt_assert(gt, !ret || ret == -ENOENT);
> -}
> -
>  struct xe_pt_stage_unbind_walk {
>  	/** @base: The pagewalk base-class. */
>  	struct xe_pt_walk base;
> @@ -2378,8 +2326,8 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
>  	struct xe_vm *vm = vops->vm;
>  	struct xe_vm_pgtable_update_ops *pt_update_ops =
>  		&vops->pt_update_ops[tile->id];
> -	struct dma_fence *fence;
> -	struct invalidation_fence *ifence = NULL, *mfence = NULL;
> +	struct dma_fence *fence, *ifence, *mfence;
> +	struct xe_gt_tlb_inval_job *ijob = NULL, *mjob = NULL;
>  	struct dma_fence **fences = NULL;
>  	struct dma_fence_array *cf = NULL;
>  	struct xe_range_fence *rfence;
> @@ -2411,34 +2359,47 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
>  #endif
>  
>  	if (pt_update_ops->needs_invalidation) {
> -		ifence = kzalloc(sizeof(*ifence), GFP_KERNEL);
> -		if (!ifence) {
> -			err = -ENOMEM;
> +		ijob = xe_gt_tlb_inval_job_create(pt_update_ops->q,
> +						  tile->primary_gt,
> +						  pt_update_ops->start,
> +						  pt_update_ops->last,
> +						  vm->usm.asid);
> +
> +		if (IS_ERR(ijob)) {
> +			err = PTR_ERR(ijob);;
>  			goto kill_vm_tile1;
>  		}
> +
>  		if (tile->media_gt) {
> -			mfence = kzalloc(sizeof(*ifence), GFP_KERNEL);
> -			if (!mfence) {
> -				err = -ENOMEM;
> -				goto free_ifence;
> +			mjob = xe_gt_tlb_inval_job_create(pt_update_ops->q,
> +							  tile->media_gt,
> +							  pt_update_ops->start,
> +							  pt_update_ops->last,
> +							  vm->usm.asid);
> +			if (IS_ERR(mjob)) {
> +				err = PTR_ERR(mjob);
> +				goto free_ijob;
>  			}
>  			fences = kmalloc_array(2, sizeof(*fences), GFP_KERNEL);
>  			if (!fences) {
>  				err = -ENOMEM;
> -				goto free_ifence;
> +				goto free_ijob;
>  			}
>  			cf = dma_fence_array_alloc(2);
>  			if (!cf) {
>  				err = -ENOMEM;
> -				goto free_ifence;
> +				goto free_ijob;
>  			}
>  		}
> +
> +		update.ijob = ijob;
> +		update.mjob = mjob;
>  	}
>  
>  	rfence = kzalloc(sizeof(*rfence), GFP_KERNEL);
>  	if (!rfence) {
>  		err = -ENOMEM;
> -		goto free_ifence;
> +		goto free_ijob;
>  	}
>  
>  	fence = xe_migrate_update_pgtables(tile->migrate, &update);
> @@ -2448,6 +2409,30 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
>  	}
>  
>  	/* Point of no return - VM killed if failure after this */

The below if statement is in the wrong spot, should be after range fence
install like in the original code.

Matt

> +
> +	if (ijob) {
> +		struct dma_fence *__fence;
> +
> +		ifence = xe_gt_tlb_inval_job_push(ijob, tile->migrate, fence);
> +		__fence = ifence;
> +
> +		if (mjob) {
> +			fences[0] = ifence;
> +			mfence = xe_gt_tlb_inval_job_push(mjob, tile->migrate,
> +							  fence);
> +			fences[1] = mfence;
> +
> +			dma_fence_array_init(cf, 2, fences,
> +					     vm->composite_fence_ctx,
> +					     vm->composite_fence_seqno++,
> +					     false);
> +			__fence = &cf->base;
> +		}
> +
> +		dma_fence_put(fence);
> +		fence = __fence;
> +	}
> +
>  	for (i = 0; i < pt_update_ops->current_op; ++i) {
>  		struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->ops[i];
>  
> @@ -2462,30 +2447,7 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
>  				  pt_update_ops->last, fence))
>  		dma_fence_wait(fence, false);
>  
> -	/* tlb invalidation must be done before signaling rebind */
> -	if (ifence) {
> -		if (mfence)
> -			dma_fence_get(fence);
> -		invalidation_fence_init(tile->primary_gt, ifence, fence,
> -					pt_update_ops->start,
> -					pt_update_ops->last, vm->usm.asid);
> -		if (mfence) {
> -			invalidation_fence_init(tile->media_gt, mfence, fence,
> -						pt_update_ops->start,
> -						pt_update_ops->last, vm->usm.asid);
> -			fences[0] = &ifence->base.base;
> -			fences[1] = &mfence->base.base;
> -			dma_fence_array_init(cf, 2, fences,
> -					     vm->composite_fence_ctx,
> -					     vm->composite_fence_seqno++,
> -					     false);
> -			fence = &cf->base;
> -		} else {
> -			fence = &ifence->base.base;
> -		}
> -	}
> -
> -	if (!mfence) {
> +	if (!mjob) {
>  		dma_resv_add_fence(xe_vm_resv(vm), fence,
>  				   pt_update_ops->wait_vm_bookkeep ?
>  				   DMA_RESV_USAGE_KERNEL :
> @@ -2494,19 +2456,19 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
>  		list_for_each_entry(op, &vops->list, link)
>  			op_commit(vops->vm, tile, pt_update_ops, op, fence, NULL);
>  	} else {
> -		dma_resv_add_fence(xe_vm_resv(vm), &ifence->base.base,
> +		dma_resv_add_fence(xe_vm_resv(vm), ifence,
>  				   pt_update_ops->wait_vm_bookkeep ?
>  				   DMA_RESV_USAGE_KERNEL :
>  				   DMA_RESV_USAGE_BOOKKEEP);
>  
> -		dma_resv_add_fence(xe_vm_resv(vm), &mfence->base.base,
> +		dma_resv_add_fence(xe_vm_resv(vm), mfence,
>  				   pt_update_ops->wait_vm_bookkeep ?
>  				   DMA_RESV_USAGE_KERNEL :
>  				   DMA_RESV_USAGE_BOOKKEEP);
>  
>  		list_for_each_entry(op, &vops->list, link)
> -			op_commit(vops->vm, tile, pt_update_ops, op,
> -				  &ifence->base.base, &mfence->base.base);
> +			op_commit(vops->vm, tile, pt_update_ops, op, ifence,
> +				  mfence);
>  	}
>  
>  	if (pt_update_ops->needs_svm_lock)
> @@ -2514,15 +2476,18 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
>  	if (pt_update_ops->needs_userptr_lock)
>  		up_read(&vm->userptr.notifier_lock);
>  
> +	xe_gt_tlb_inval_job_put(mjob);
> +	xe_gt_tlb_inval_job_put(ijob);
> +
>  	return fence;
>  
>  free_rfence:
>  	kfree(rfence);
> -free_ifence:
> +free_ijob:
>  	kfree(cf);
>  	kfree(fences);
> -	kfree(mfence);
> -	kfree(ifence);
> +	xe_gt_tlb_inval_job_put(mjob);
> +	xe_gt_tlb_inval_job_put(ijob);
>  kill_vm_tile1:
>  	if (err != -EAGAIN && err != -ENODATA && tile->id)
>  		xe_vm_kill(vops->vm, false);
> -- 
> 2.34.1
> 
