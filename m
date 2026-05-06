Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA82ACD342C
	for <intel-xe@archiver.kernel.org>; Wed,  6 May 2026 15:54:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F6AF10EE0C;
	Wed,  6 May 2026 15:54:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tt2s6/fA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CF0810EE0C
 for <intel-xe@lists.freedesktop.org>; Wed,  6 May 2026 15:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778082863; x=1809618863;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=JCQwcskx8e45JJVFWeEshIZRCRWZwF4jAZW/q9mrWrE=;
 b=Tt2s6/fAP9jYy0tt/LuUnTZBEec4Sh5ccjpRr/nIR0zfDY7cSxdDT/uw
 t/WSVdhg6EajTSVWSD1UXmPYPMv+6yvFMC6nkgbwNAQVUm9xOCKV6TloA
 jRgFCl19Cjp3vtoEHLE62X8QNy9OdRpI8/ePUJfPreZAZc/fp2wBL7dYC
 0M+u4yaXAxG7dYtZ/4i3gOHUB6Xtp3XChUXPbjyYplGAzmdhIfSkBVeTl
 lUWcdKRKEo6AONWJ48hp9uuQIbBodDF1I6KJ/bYGfglme9Qrd8HIyBeqs
 +1XAeR/3DzaofqkrJN7REaBBU9yJAF3Bejv4BzZPVDTr01eAjOgZlCcrt A==;
X-CSE-ConnectionGUID: qbas29ImTdWT4Vhyr9qFxA==
X-CSE-MsgGUID: +jjU84DERPSFxJQGLlK5KQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="96447470"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; d="scan'208";a="96447470"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 08:54:22 -0700
X-CSE-ConnectionGUID: ajzkzrsvQsufZrAHrvDdSA==
X-CSE-MsgGUID: HVNnaEsVRx6a+Z1FPtlkCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; d="scan'208";a="240167262"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 08:54:21 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 6 May 2026 08:54:21 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 6 May 2026 08:54:21 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.53) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 6 May 2026 08:54:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lTo2huMPLq0to0QvuefxSARFQHEhsTsX48tytguA3ASuJfNjMjZ/vzHn+56S4/v54iB87MUJMGB930rE3JS9G7M57927CRPOeEa0eYg7f0/I5TMP3NbdCrvgyAlWV23n2D0HEbz40iJoo9voUv0X+WwLILcOeGBPap6as0T4mYrMrq/lBPs4PPeuCEROUm8wWEIrfu2x3BamilYqTxqvdtSZxdbmu3F19XXHbSxmrxwQuNo3PoCPPIT/MvfH9fnfIYII3RTEo0xgXCRlZoOFQ6EOVDdSxgVDk/K2QUh7b1lr+KJ4dlq19V46+SYItz2e/74rslylfKUUopp3+Nrggw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kgveV51+Y4RMEQtEMhOxH4F11dSfe+OPtuLWMLT7ETw=;
 b=HSKp9L5eT9yERNMpPJ6TUWWe1oZqNKV3dq03nbsWJS2+61InS2M/CGmjYUCEIKgwt5QC/B7mbqRDvlRJYGzzU0Dk+sGmWHsS+0nzQXoFROtU4IwP7l0hPnViIqKh344Sox574KZ7MSgOdhcyWv0CXyTZTkj1DDvnSg1zom3l5gEqQzIc0qDlQ2Hp2gAzueVBLsplRD+9lIVHLKykPhC8MolHSVWwp7vfHGiW0Ebyaxz01SinDrp7lr2VZK2Rguh6/nG0ZcsIjfdLkGxcuHE20qlYuddZl24he+T7G2v4YgNdTXcGXBspbLXyEJF4sohO+9Nsz4affhORepUWfL8Ppg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH8PR11MB7117.namprd11.prod.outlook.com (2603:10b6:510:217::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.16; Wed, 6 May
 2026 15:54:17 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%7]) with mapi id 15.20.9891.008; Wed, 6 May 2026
 15:54:17 +0000
Date: Wed, 6 May 2026 08:54:15 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Arvind Yadav <arvind.yadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <tejas.upadhyay@intel.com>
Subject: Re: [PATCH v3] drm/xe/madvise: Track purgeability with BO-local
 counters
Message-ID: <aftkJ4+5iGRMt07c@gsse-cloud1.jf.intel.com>
References: <20260506132027.2556046-1-arvind.yadav@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260506132027.2556046-1-arvind.yadav@intel.com>
X-ClientProxiedBy: MW3PR06CA0022.namprd06.prod.outlook.com
 (2603:10b6:303:2a::27) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH8PR11MB7117:EE_
X-MS-Office365-Filtering-Correlation-Id: ac771bdc-d6d8-4e53-0d41-08deab87baae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: FBLifLOkudQVgXLkG/OpCMbHRHsuzTlHYYVT0OzB1EfpicC+FveUxQ/6R8Mpuin13IbKagEWWMk4omjQ5JQvYbeRWVJi9Trr0vKx3x9/R/Vr1JAuFIlhME2kg/oCLwwU92A4P+VjqxAkO8H9IThla4QCuiok9CGYcKsHsZqY4ceEjSrjdTwGtlougYTlCiKhcyLj0kiFphxLfBsm72gIB8uMDdbc6Dgn7RcASEBmcSGQjRTl/g3DhtY6B4fPF5akE0BgFUcr7/MqIJByKJi2f3GCFyfEWHonZ0P3dHFL95N7C31nMMeyr6E22a10kUWpPYLRrDNzVyZ8oB1ejU+bgpIVcUSJbRhgYRC0AjhUkhA/IqXm1VBnsNoVnrC+XBVba2DlQA1+skMwwUSVvtGX8dtcClZuAIxcJagRDAximsfDT+wZslXE7oPY4agS+8qnR0J/y14xpKPHIaCzp7F1pxIso2Z7mZd9MPn4bXp189EmqzMqXmb7PWTcIqvjHohF8RD4xH/yUdECwp2pzMruRtknXXv+Vhf4x49Nlm/qmia+mbPIizhrHNoh6Swk1D7njIdljGtbZgtmkEepMJV3UV+GvIY3y+keY/6ac2oD+0PogT+qXDTmwPOcG1zqRFFdLBzfEmjBuMDNYSS2HwnLUkjW5w3UBVXRLt1QcBT0dDT8YNuXPmvN6kfqjC0aI5he
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?GYeNlHyGt+3h6SzlDACdIotKn9zD8MkUjxNSridqcxo8UuRcBPMXqtqkc0?=
 =?iso-8859-1?Q?xdtoALTobpZ7G+FenlRzap0chYRFQmUmZkTJHEVLRKIDZ5ccCXDCJd/yvY?=
 =?iso-8859-1?Q?CANmbCERa0QSPXEGPGsxRFvphLA5an+/PdgScZw5My7MONmfuPRk0KdyQ4?=
 =?iso-8859-1?Q?7OJoG1wvltq8dYJLnMi8hoh4H/SoIJr26ZQYzB73A7JA5HWviUCafhi6H2?=
 =?iso-8859-1?Q?l9PAZQFGqR2NRlJp8VQL3mqIDaruajVB0DKMtdnFs0qDTBW/uj1+YMEx3c?=
 =?iso-8859-1?Q?Cwiud07b6lUPUjMv2UsZSN2IhYNCjoUKTPIr9Wfe9Gc+er6tXbB24J0JxM?=
 =?iso-8859-1?Q?8F4xEHY/CoU2C5pIcNU20YsAeatN89ubobINCX8ikETNCgp4+V+TJY57sI?=
 =?iso-8859-1?Q?CFAKurrG6bI5a4N5xb6yBd5jqDqFuIicCB9LdQ9vQhqLrXGiQmDuDR10iX?=
 =?iso-8859-1?Q?vZJ/H5BEqFnrii0ygk50GwkMMlvJFfNyk65EwX1P5AYnDk6x21u7gS7qFD?=
 =?iso-8859-1?Q?q0duthbWizcyGl0YudfMjW1fZ017uIdey1xq2LmRxCyye6ANAv3EeEwLtd?=
 =?iso-8859-1?Q?9T4lv2yR2ThvOSZPPn5KRGMYXXQZKDcDOcXDQ6wfruH/hGgIAXMEql++Nb?=
 =?iso-8859-1?Q?SrYMtaAFM2tcrcoLqibW6fwx9PvHGr8GUbxLDu0uHntH0tdS5ZEOnzZXM6?=
 =?iso-8859-1?Q?gboMYKhmJkdF3eJNv16v0I3UpuT9Glxq813nc9bC14YFj9T7UkTxkVEkGh?=
 =?iso-8859-1?Q?DIV/CLP+gkX+Vm3lROFugFRogd5eMrVKMCCAJ5BaoEdAK5OERcRbGl1pq7?=
 =?iso-8859-1?Q?FiDJz1EUraxQnHbVGKhYI2DrJqcsnfH3o3pxXH/HPjNMvFYvsSPkUNd6nl?=
 =?iso-8859-1?Q?XeA5pIxiO8LtioZDHcrEb6tMB+Rfye2xWTR650i68/GXs3sAG9nsRNVvLN?=
 =?iso-8859-1?Q?pwP6lCMqviapDn71WooxDkodeGZzP9cLC8mCM065BqkcO+xE8y26WBiu6u?=
 =?iso-8859-1?Q?Cu6F8tH6qQHvaGVSsYt+frxXrjESljXeJtqHf3ju9xMqlCviNpdjG/AQVA?=
 =?iso-8859-1?Q?R0GWgfCiBM+MMDPs9XIVLj5X9tmYK06HVhzIveqwI26FoWzHycNynk3zIv?=
 =?iso-8859-1?Q?ggbHxBP9ctqvzogNjKWZmEPf5CFdv4rUkxd4jdkRYDFbbt0y5ynvr6Qm8P?=
 =?iso-8859-1?Q?5wdYs8Rr5uG01xZRHGjzG7E0C2vb50CBUFCmqGoUDsCj1JvggYw6wuc+nu?=
 =?iso-8859-1?Q?5EPw8vKXa1yJWZ8txQ0sbrvWqcbY6pIHbU8j0KU6OHVcgSSm3nH6+/jEJt?=
 =?iso-8859-1?Q?Yg8K0F/s3wHeP4O4Xh/7QNuH3ORMA2hSwmmKEgCwtDlbU3tx3Jr7ma7Bvj?=
 =?iso-8859-1?Q?MHJzigFAgiFIE+ylDnc3dBaZYLGA2jNNSURpnVme8uNNFeoPeoBkQf5XiS?=
 =?iso-8859-1?Q?hPCMPG4Mfpa7EWyYChiPPnAcAHGaZxCtRZzAoWFy84qLIH2o/y/pJ3vNM6?=
 =?iso-8859-1?Q?oom6yoLQcyRKG17csLlo3vVY7tyxPI/h4+H8rHtZaozpDGuOUxvs31SC8X?=
 =?iso-8859-1?Q?vWVBuP2fjDifeyuXM5OXcJ92k29yR9dYs1snYgc5vbaKyRgGcraK1jurXB?=
 =?iso-8859-1?Q?LNgh68z+ACyDTr5nF2+Avcb6XLNEB71o1P4rFCLLVUlmmebEwNS0eYDz6W?=
 =?iso-8859-1?Q?BC5M1Vx31mnzaQcEGGcJ9oevV1lgyNHeaqCRMBFGVLpffNRpiSI5ZL6cSt?=
 =?iso-8859-1?Q?DAl+oXeJpJXHycn5hvC+Tyln1TTxFRKa7Qm2KXUI4n0yqz633ev64aZrBZ?=
 =?iso-8859-1?Q?kiYY1mNAhQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: bOWHn9b1jYS/YE+krgmk443BOsczWfbmT9FFE1i580rfrhSdtixtL6QMx7J5LKrboJTSMOyPdxIWhO/BI+cr64QEisJL0fBbdV4bPwrADYNIY0aWmbKxl11bVKZ/NhV1ekygkzi6Qz1V6jtRw9IGdd5IEOyZQ3P74ydP7OwnwSOUi6w7M/9eyO5F7lI8C0YffIcoQsSYeRE1yan1+3lGW1UushrvfT91i2KDZuOszlp/C+FMqsOO9nzPCZqEhnHbn6qrFzgNtk2d2lfn3MJFTLZqrbcjLtXe12kPvrMKxSwk/yU0WaI4Gna2dMmhvw3+v7CFkfjFOf4TU4Bj87hfSg==
X-MS-Exchange-CrossTenant-Network-Message-Id: ac771bdc-d6d8-4e53-0d41-08deab87baae
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 15:54:17.5839 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5P1erhQXSB3m9Dhnfa+n9JEWRN54r5SpTrKyBACW8NLt8vfplY22Lj0obMJBwr0Wqi4p9hg9DgSoKExWuS3yig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7117
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

On Wed, May 06, 2026 at 06:50:27PM +0530, Arvind Yadav wrote:
> xe_bo_recompute_purgeable_state() walks all VMAs of a BO to determine
> whether the BO can be made purgeable. This makes VMA create/destroy and
> madvise updates O(n) in the number of mappings.
> 
> Replace the walk with BO-local counters protected by the BO dma-resv
> lock:
> 
>   - vma_count tracks the number of VMAs mapping the BO.
>   - willneed_count tracks active WILLNEED holders, including WILLNEED
>     VMAs and active dma-buf exports for non-imported BOs.
> 
> A DONTNEED BO is promoted back to WILLNEED on a 0->1 transition of
> willneed_count. A BO is demoted to DONTNEED on a 1->0 transition only
> when it still has VMAs, preserving the previous behaviour where a BO
> with no mappings keeps its current madvise state.
> 
> PURGED remains terminal, preserving the existing "once purged, always
> purged" rule.
> 
> Fixes: 4f44961eab84 ("drm/xe/vm: Prevent binding of purged buffer objects")
> 

Nit: Move the Fixes tag down by other tags. This can fixed when merging.

Also I assume you have test case showing the current issue with partial
unbinds of DONTNEED?

Anyways patch LGTM:
Reviewed-by: Matthew Brost <matthew.brost@intel.com> 

> v2:
>   - Use early return for imported BOs in all four helpers to avoid
>     nesting (Matt B).
>   - Group purgeability state into a purgeable sub-struct on struct
>     xe_bo (Matt B).
>   - Reword xe_bo_willneed_put_locked() kernel-doc to explain that a 1->0
>     transition means all remaining active VMAs are DONTNEED (Matt B).
> 
> v3:
>   - Move DONTNEED/PURGED reject from vma_lock_and_validate() into
>     xe_vma_create(), gated on attr->purgeable_state == WILLNEED.
>     Fixes vm_bind bypass and partial-unbind rejection on DONTNEED
>     BOs (Matt B).
>   - Drop .check_purged from MAP and REMAP; keep it for PREFETCH and
>     add a comment why (Matt B).
>   - Skip BO validation in vma_lock_and_validate() for non-WILLNEED
>     VMA remnants so cleanup/remap paths do not repopulate
>     DONTNEED/PURGED BOs.
> 
> Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.c         |   6 +-
>  drivers/gpu/drm/xe/xe_bo.h         |  88 +++++++++++++++-
>  drivers/gpu/drm/xe/xe_bo_types.h   |  28 ++++-
>  drivers/gpu/drm/xe/xe_dma_buf.c    |  28 ++++-
>  drivers/gpu/drm/xe/xe_vm.c         |  51 +++++++--
>  drivers/gpu/drm/xe/xe_vm_madvise.c | 162 ++---------------------------
>  drivers/gpu/drm/xe/xe_vm_madvise.h |   2 -
>  7 files changed, 190 insertions(+), 175 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 5ce60d161e09..eaa3a4ee9111 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -884,10 +884,10 @@ void xe_bo_set_purgeable_state(struct xe_bo *bo,
>  		  new_state == XE_MADV_PURGEABLE_PURGED);
>  
>  	/* Once purged, always purged - cannot transition out */
> -	xe_assert(xe, !(bo->madv_purgeable == XE_MADV_PURGEABLE_PURGED &&
> +	xe_assert(xe, !(bo->purgeable.state == XE_MADV_PURGEABLE_PURGED &&
>  			new_state != XE_MADV_PURGEABLE_PURGED));
>  
> -	bo->madv_purgeable = new_state;
> +	bo->purgeable.state = new_state;
>  	xe_bo_set_purgeable_shrinker(bo, new_state);
>  }
>  
> @@ -2355,7 +2355,7 @@ struct xe_bo *xe_bo_init_locked(struct xe_device *xe, struct xe_bo *bo,
>  	INIT_LIST_HEAD(&bo->vram_userfault_link);
>  
>  	/* Initialize purge advisory state */
> -	bo->madv_purgeable = XE_MADV_PURGEABLE_WILLNEED;
> +	bo->purgeable.state = XE_MADV_PURGEABLE_WILLNEED;
>  
>  	drm_gem_private_object_init(&xe->drm, &bo->ttm.base, size);
>  
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index 68dea7d25a6b..6340317f7d2e 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -251,7 +251,7 @@ static inline bool xe_bo_is_protected(const struct xe_bo *bo)
>  static inline bool xe_bo_is_purged(struct xe_bo *bo)
>  {
>  	xe_bo_assert_held(bo);
> -	return bo->madv_purgeable == XE_MADV_PURGEABLE_PURGED;
> +	return bo->purgeable.state == XE_MADV_PURGEABLE_PURGED;
>  }
>  
>  /**
> @@ -268,11 +268,95 @@ static inline bool xe_bo_is_purged(struct xe_bo *bo)
>  static inline bool xe_bo_madv_is_dontneed(struct xe_bo *bo)
>  {
>  	xe_bo_assert_held(bo);
> -	return bo->madv_purgeable == XE_MADV_PURGEABLE_DONTNEED;
> +	return bo->purgeable.state == XE_MADV_PURGEABLE_DONTNEED;
>  }
>  
>  void xe_bo_set_purgeable_state(struct xe_bo *bo, enum xe_madv_purgeable_state new_state);
>  
> +/**
> + * xe_bo_willneed_get_locked() - Acquire a WILLNEED holder on a BO
> + * @bo: Buffer object
> + *
> + * Increments willneed_count and, on a 0->1 transition, promotes the BO
> + * from DONTNEED to WILLNEED. PURGED is terminal and is never modified.
> + *
> + * Caller must hold the BO's dma-resv lock.
> + */
> +static inline void xe_bo_willneed_get_locked(struct xe_bo *bo)
> +{
> +	xe_bo_assert_held(bo);
> +
> +	/* Imported BOs are owned externally; do not track purgeability. */
> +	if (drm_gem_is_imported(&bo->ttm.base))
> +		return;
> +
> +	if (bo->purgeable.willneed_count++ == 0 && xe_bo_madv_is_dontneed(bo))
> +		xe_bo_set_purgeable_state(bo, XE_MADV_PURGEABLE_WILLNEED);
> +}
> +
> +/**
> + * xe_bo_willneed_put_locked() - Release a WILLNEED holder on a BO
> + * @bo: Buffer object
> + *
> + * Decrements willneed_count and, on a 1->0 transition, marks the BO
> + * DONTNEED only if it still has VMAs (implying all active VMAs are
> + * DONTNEED). If the last VMA is being removed, preserve the current BO
> + * state to match the previous VMA-walk semantics.
> + *
> + * PURGED is terminal and the BO state is never modified.
> + *
> + * Caller must hold the BO's dma-resv lock.
> + */
> +static inline void xe_bo_willneed_put_locked(struct xe_bo *bo)
> +{
> +	xe_bo_assert_held(bo);
> +
> +	if (drm_gem_is_imported(&bo->ttm.base))
> +		return;
> +
> +	xe_assert(xe_bo_device(bo), bo->purgeable.willneed_count > 0);
> +	if (--bo->purgeable.willneed_count == 0 && bo->purgeable.vma_count > 0 &&
> +	    !xe_bo_is_purged(bo))
> +		xe_bo_set_purgeable_state(bo, XE_MADV_PURGEABLE_DONTNEED);
> +}
> +
> +/**
> + * xe_bo_vma_count_inc_locked() - Account a new VMA on a BO
> + * @bo: Buffer object
> + *
> + * Increments vma_count.
> + *
> + * Caller must hold the BO's dma-resv lock.
> + */
> +static inline void xe_bo_vma_count_inc_locked(struct xe_bo *bo)
> +{
> +	xe_bo_assert_held(bo);
> +
> +	if (drm_gem_is_imported(&bo->ttm.base))
> +		return;
> +
> +	bo->purgeable.vma_count++;
> +}
> +
> +/**
> + * xe_bo_vma_count_dec_locked() - Account a VMA removal on a BO
> + * @bo: Buffer object
> + *
> + * Decrements vma_count.
> + *
> + * Caller must hold the BO's dma-resv lock.
> + */
> +static inline void xe_bo_vma_count_dec_locked(struct xe_bo *bo)
> +{
> +	xe_bo_assert_held(bo);
> +
> +	if (drm_gem_is_imported(&bo->ttm.base))
> +		return;
> +
> +	xe_assert(xe_bo_device(bo), bo->purgeable.vma_count > 0);
> +	bo->purgeable.vma_count--;
> +}
> +
>  static inline void xe_bo_unpin_map_no_vm(struct xe_bo *bo)
>  {
>  	if (likely(bo)) {
> diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
> index 9c199badd9b2..fcc63ae3f455 100644
> --- a/drivers/gpu/drm/xe/xe_bo_types.h
> +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> @@ -111,10 +111,32 @@ struct xe_bo {
>  	u64 min_align;
>  
>  	/**
> -	 * @madv_purgeable: user space advise on BO purgeability, protected
> -	 * by BO's dma-resv lock.
> +	 * @purgeable: Purgeability state and accounting.
> +	 *
> +	 * All fields are protected by the BO's dma-resv lock.
>  	 */
> -	u32 madv_purgeable;
> +	struct {
> +		/**
> +		 * @purgeable.state: BO purgeability state
> +		 *                   (WILLNEED/DONTNEED/PURGED).
> +		 */
> +		u32 state;
> +
> +		/**
> +		 * @purgeable.vma_count: Number of VMAs currently mapping this BO.
> +		 */
> +		u32 vma_count;
> +
> +		/**
> +		 * @purgeable.willneed_count: Number of active WILLNEED holders.
> +		 *
> +		 * Counts WILLNEED VMAs plus active dma-buf exports for
> +		 * non-imported BOs. The BO flips to DONTNEED on a 1->0
> +		 * transition only when VMAs still exist; if the last VMA is
> +		 * removed, the previous BO state is preserved.
> +		 */
> +		u32 willneed_count;
> +	} purgeable;
>  };
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
> index b9828da15897..855d32ba314d 100644
> --- a/drivers/gpu/drm/xe/xe_dma_buf.c
> +++ b/drivers/gpu/drm/xe/xe_dma_buf.c
> @@ -193,6 +193,18 @@ static int xe_dma_buf_begin_cpu_access(struct dma_buf *dma_buf,
>  	return 0;
>  }
>  
> +static void xe_dma_buf_release(struct dma_buf *dmabuf)
> +{
> +	struct drm_gem_object *obj = dmabuf->priv;
> +	struct xe_bo *bo = gem_to_xe_bo(obj);
> +
> +	xe_bo_lock(bo, false);
> +	xe_bo_willneed_put_locked(bo);
> +	xe_bo_unlock(bo);
> +
> +	drm_gem_dmabuf_release(dmabuf);
> +}
> +
>  static const struct dma_buf_ops xe_dmabuf_ops = {
>  	.attach = xe_dma_buf_attach,
>  	.detach = xe_dma_buf_detach,
> @@ -200,7 +212,7 @@ static const struct dma_buf_ops xe_dmabuf_ops = {
>  	.unpin = xe_dma_buf_unpin,
>  	.map_dma_buf = xe_dma_buf_map,
>  	.unmap_dma_buf = xe_dma_buf_unmap,
> -	.release = drm_gem_dmabuf_release,
> +	.release = xe_dma_buf_release,
>  	.begin_cpu_access = xe_dma_buf_begin_cpu_access,
>  	.mmap = drm_gem_dmabuf_mmap,
>  	.vmap = drm_gem_dmabuf_vmap,
> @@ -241,18 +253,26 @@ struct dma_buf *xe_gem_prime_export(struct drm_gem_object *obj, int flags)
>  		ret = -EINVAL;
>  		goto out_unlock;
>  	}
> +
> +	xe_bo_willneed_get_locked(bo);
>  	xe_bo_unlock(bo);
>  
>  	ret = ttm_bo_setup_export(&bo->ttm, &ctx);
>  	if (ret)
> -		return ERR_PTR(ret);
> +		goto out_put;
>  
>  	buf = drm_gem_prime_export(obj, flags);
> -	if (!IS_ERR(buf))
> -		buf->ops = &xe_dmabuf_ops;
> +	if (IS_ERR(buf)) {
> +		ret = PTR_ERR(buf);
> +		goto out_put;
> +	}
>  
> +	buf->ops = &xe_dmabuf_ops;
>  	return buf;
>  
> +out_put:
> +	xe_bo_lock(bo, false);
> +	xe_bo_willneed_put_locked(bo);
>  out_unlock:
>  	xe_bo_unlock(bo);
>  	return ERR_PTR(ret);
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 43a578d9c067..b01f31ed4417 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1120,6 +1120,25 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>  
>  		xe_bo_assert_held(bo);
>  
> +		/*
> +		 * Reject only WILLNEED mappings on DONTNEED/PURGED BOs. This
> +		 * gates new vm_bind ioctls (user supplies WILLNEED) while
> +		 * still allowing partial-unbind / remap splits whose new VMAs
> +		 * inherit the parent's DONTNEED attr. It must also run before
> +		 * xe_bo_willneed_get_locked() below so a 0->1 holder bump
> +		 * cannot silently promote DONTNEED back to WILLNEED.
> +		 */
> +		if (vma->attr.purgeable_state == XE_MADV_PURGEABLE_WILLNEED) {
> +			if (xe_bo_madv_is_dontneed(bo)) {
> +				xe_vma_free(vma);
> +				return ERR_PTR(-EBUSY);
> +			}
> +			if (xe_bo_is_purged(bo)) {
> +				xe_vma_free(vma);
> +				return ERR_PTR(-EINVAL);
> +			}
> +		}
> +
>  		vm_bo = drm_gpuvm_bo_obtain_locked(vma->gpuva.vm, &bo->ttm.base);
>  		if (IS_ERR(vm_bo)) {
>  			xe_vma_free(vma);
> @@ -1131,6 +1150,10 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>  		vma->gpuva.gem.offset = bo_offset_or_userptr;
>  		drm_gpuva_link(&vma->gpuva, vm_bo);
>  		drm_gpuvm_bo_put(vm_bo);
> +
> +		xe_bo_vma_count_inc_locked(bo);
> +		if (vma->attr.purgeable_state == XE_MADV_PURGEABLE_WILLNEED)
> +			xe_bo_willneed_get_locked(bo);
>  	} else /* userptr or null */ {
>  		if (!is_null && !is_cpu_addr_mirror) {
>  			struct xe_userptr_vma *uvma = to_userptr_vma(vma);
> @@ -1208,7 +1231,10 @@ static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
>  		xe_bo_assert_held(bo);
>  
>  		drm_gpuva_unlink(&vma->gpuva);
> -		xe_bo_recompute_purgeable_state(bo);
> +
> +		xe_bo_vma_count_dec_locked(bo);
> +		if (vma->attr.purgeable_state == XE_MADV_PURGEABLE_WILLNEED)
> +			xe_bo_willneed_put_locked(bo);
>  	}
>  
>  	xe_vm_assert_held(vm);
> @@ -3016,7 +3042,7 @@ static void vm_bind_ioctl_ops_unwind(struct xe_vm *vm,
>   * @res_evict: Allow evicting resources during validation
>   * @validate: Perform BO validation
>   * @request_decompress: Request BO decompression
> - * @check_purged: Reject operation if BO is purged
> + * @check_purged: Reject operation if BO is DONTNEED or PURGED
>   */
>  struct xe_vma_lock_and_validate_flags {
>  	u32 res_evict : 1;
> @@ -3030,6 +3056,7 @@ static int vma_lock_and_validate(struct drm_exec *exec, struct xe_vma *vma,
>  {
>  	struct xe_bo *bo = xe_vma_bo(vma);
>  	struct xe_vm *vm = xe_vma_vm(vma);
> +	bool validate_bo = flags.validate;
>  	int err = 0;
>  
>  	if (bo) {
> @@ -3044,7 +3071,11 @@ static int vma_lock_and_validate(struct drm_exec *exec, struct xe_vma *vma,
>  				err = -EINVAL; /* BO already purged */
>  		}
>  
> -		if (!err && flags.validate)
> +		/* Don't validate the BO for DONTNEED/PURGED remap remnants. */
> +		if (vma->attr.purgeable_state != XE_MADV_PURGEABLE_WILLNEED)
> +			validate_bo = false;
> +
> +		if (!err && validate_bo)
>  			err = xe_bo_validate(bo, vm,
>  					     xe_vm_allow_vm_eviction(vm) &&
>  					     flags.res_evict, exec);
> @@ -3152,7 +3183,7 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
>  								    op->map.immediate,
>  							.request_decompress =
>  							op->map.request_decompress,
> -							.check_purged = true,
> +							.check_purged = false,
>  						    });
>  		break;
>  	case DRM_GPUVA_OP_REMAP:
> @@ -3174,7 +3205,7 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
>  							    .res_evict = res_evict,
>  							    .validate = true,
>  							    .request_decompress = false,
> -							    .check_purged = true,
> +							    .check_purged = false,
>  						    });
>  		if (!err && op->remap.next)
>  			err = vma_lock_and_validate(exec, op->remap.next,
> @@ -3182,7 +3213,7 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
>  							    .res_evict = res_evict,
>  							    .validate = true,
>  							    .request_decompress = false,
> -							    .check_purged = true,
> +							    .check_purged = false,
>  						    });
>  		break;
>  	case DRM_GPUVA_OP_UNMAP:
> @@ -3211,9 +3242,11 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
>  		}
>  
>  		/*
> -		 * Prefetch attempts to migrate BO's backing store without
> -		 * repopulating it first. Purged BOs have no backing store
> -		 * to migrate, so reject the operation.
> +		 * PREFETCH is the only op that still gates on BO purge state.
> +		 * MAP/REMAP handle this inside xe_vma_create() so partial
> +		 * unbind on a DONTNEED BO still works. PREFETCH skips
> +		 * xe_vma_create() and would migrate a BO with no backing
> +		 * store, so reject DONTNEED/PURGED here.
>  		 */
>  		err = vma_lock_and_validate(exec,
>  					    gpuva_to_vma(op->base.prefetch.va),
> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
> index c78906dea82b..c4fb29004195 100644
> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> @@ -185,147 +185,6 @@ static void madvise_pat_index(struct xe_device *xe, struct xe_vm *vm,
>  	}
>  }
>  
> -/**
> - * xe_bo_is_dmabuf_shared() - Check if BO is shared via dma-buf
> - * @bo: Buffer object
> - *
> - * Prevent marking imported or exported dma-bufs as purgeable.
> - * For imported BOs, Xe doesn't own the backing store and cannot
> - * safely reclaim pages (exporter or other devices may still be
> - * using them). For exported BOs, external devices may have active
> - * mappings we cannot track.
> - *
> - * Return: true if BO is imported or exported, false otherwise
> - */
> -static bool xe_bo_is_dmabuf_shared(struct xe_bo *bo)
> -{
> -	struct drm_gem_object *obj = &bo->ttm.base;
> -
> -	/* Imported: exporter owns backing store */
> -	if (drm_gem_is_imported(obj))
> -		return true;
> -
> -	/* Exported: external devices may be accessing */
> -	if (obj->dma_buf)
> -		return true;
> -
> -	return false;
> -}
> -
> -/**
> - * enum xe_bo_vmas_purge_state - VMA purgeable state aggregation
> - *
> - * Distinguishes whether a BO's VMAs are all DONTNEED, have at least
> - * one WILLNEED, or have no VMAs at all.
> - *
> - * Enum values align with XE_MADV_PURGEABLE_* states for consistency.
> - */
> -enum xe_bo_vmas_purge_state {
> -	/** @XE_BO_VMAS_STATE_WILLNEED: At least one VMA is WILLNEED */
> -	XE_BO_VMAS_STATE_WILLNEED = 0,
> -	/** @XE_BO_VMAS_STATE_DONTNEED: All VMAs are DONTNEED */
> -	XE_BO_VMAS_STATE_DONTNEED = 1,
> -	/** @XE_BO_VMAS_STATE_NO_VMAS: BO has no VMAs */
> -	XE_BO_VMAS_STATE_NO_VMAS = 2,
> -};
> -
> -/*
> - * xe_bo_recompute_purgeable_state() casts between xe_bo_vmas_purge_state and
> - * xe_madv_purgeable_state. Enforce that WILLNEED=0 and DONTNEED=1 match across
> - * both enums so the single-line cast is always valid.
> - */
> -static_assert(XE_BO_VMAS_STATE_WILLNEED == (int)XE_MADV_PURGEABLE_WILLNEED,
> -	      "VMA purge state WILLNEED must equal madv purgeable WILLNEED");
> -static_assert(XE_BO_VMAS_STATE_DONTNEED == (int)XE_MADV_PURGEABLE_DONTNEED,
> -	      "VMA purge state DONTNEED must equal madv purgeable DONTNEED");
> -
> -/**
> - * xe_bo_all_vmas_dontneed() - Determine BO VMA purgeable state
> - * @bo: Buffer object
> - *
> - * Check all VMAs across all VMs to determine aggregate purgeable state.
> - * Shared BOs require unanimous DONTNEED state from all mappings.
> - *
> - * Caller must hold BO dma-resv lock.
> - *
> - * Return: XE_BO_VMAS_STATE_DONTNEED if all VMAs are DONTNEED,
> - *         XE_BO_VMAS_STATE_WILLNEED if at least one VMA is not DONTNEED,
> - *         XE_BO_VMAS_STATE_NO_VMAS if BO has no VMAs
> - */
> -static enum xe_bo_vmas_purge_state xe_bo_all_vmas_dontneed(struct xe_bo *bo)
> -{
> -	struct drm_gpuvm_bo *vm_bo;
> -	struct drm_gpuva *gpuva;
> -	struct drm_gem_object *obj = &bo->ttm.base;
> -	bool has_vmas = false;
> -
> -	xe_bo_assert_held(bo);
> -
> -	/* Shared dma-bufs cannot be purgeable */
> -	if (xe_bo_is_dmabuf_shared(bo))
> -		return XE_BO_VMAS_STATE_WILLNEED;
> -
> -	drm_gem_for_each_gpuvm_bo(vm_bo, obj) {
> -		drm_gpuvm_bo_for_each_va(gpuva, vm_bo) {
> -			struct xe_vma *vma = gpuva_to_vma(gpuva);
> -
> -			has_vmas = true;
> -
> -			/* Any non-DONTNEED VMA prevents purging */
> -			if (vma->attr.purgeable_state != XE_MADV_PURGEABLE_DONTNEED)
> -				return XE_BO_VMAS_STATE_WILLNEED;
> -		}
> -	}
> -
> -	/*
> -	 * No VMAs => preserve existing BO purgeable state.
> -	 * Avoids incorrectly flipping DONTNEED -> WILLNEED when last VMA unmapped.
> -	 */
> -	if (!has_vmas)
> -		return XE_BO_VMAS_STATE_NO_VMAS;
> -
> -	return XE_BO_VMAS_STATE_DONTNEED;
> -}
> -
> -/**
> - * xe_bo_recompute_purgeable_state() - Recompute BO purgeable state from VMAs
> - * @bo: Buffer object
> - *
> - * Walk all VMAs to determine if BO should be purgeable or not.
> - * Shared BOs require unanimous DONTNEED state from all mappings.
> - * If the BO has no VMAs the existing state is preserved.
> - *
> - * Locking: Caller must hold BO dma-resv lock. When iterating GPUVM lists,
> - * VM lock must also be held (write) to prevent concurrent VMA modifications.
> - * This is satisfied at both call sites:
> - * - xe_vma_destroy(): holds vm->lock write
> - * - madvise_purgeable(): holds vm->lock write (from madvise ioctl path)
> - *
> - * Return: nothing
> - */
> -void xe_bo_recompute_purgeable_state(struct xe_bo *bo)
> -{
> -	enum xe_bo_vmas_purge_state vma_state;
> -
> -	if (!bo)
> -		return;
> -
> -	xe_bo_assert_held(bo);
> -
> -	/*
> -	 * Once purged, always purged. Cannot transition back to WILLNEED.
> -	 * This matches i915 semantics where purged BOs are permanently invalid.
> -	 */
> -	if (bo->madv_purgeable == XE_MADV_PURGEABLE_PURGED)
> -		return;
> -
> -	vma_state = xe_bo_all_vmas_dontneed(bo);
> -
> -	if (vma_state != (enum xe_bo_vmas_purge_state)bo->madv_purgeable &&
> -	    vma_state != XE_BO_VMAS_STATE_NO_VMAS)
> -		xe_bo_set_purgeable_state(bo, (enum xe_madv_purgeable_state)vma_state);
> -}
> -
>  /**
>   * madvise_purgeable - Handle purgeable buffer object advice
>   * @xe: XE device
> @@ -359,12 +218,6 @@ static void madvise_purgeable(struct xe_device *xe, struct xe_vm *vm,
>  		/* BO must be locked before modifying madv state */
>  		xe_bo_assert_held(bo);
>  
> -		/* Skip shared dma-bufs - no PTEs to zap */
> -		if (xe_bo_is_dmabuf_shared(bo)) {
> -			vmas[i]->skip_invalidation = true;
> -			continue;
> -		}
> -
>  		/*
>  		 * Once purged, always purged. Cannot transition back to WILLNEED.
>  		 * This matches i915 semantics where purged BOs are permanently invalid.
> @@ -377,13 +230,14 @@ static void madvise_purgeable(struct xe_device *xe, struct xe_vm *vm,
>  
>  		switch (op->purge_state_val.val) {
>  		case DRM_XE_VMA_PURGEABLE_STATE_WILLNEED:
> -			vmas[i]->attr.purgeable_state = XE_MADV_PURGEABLE_WILLNEED;
>  			vmas[i]->skip_invalidation = true;
> -
> -			xe_bo_recompute_purgeable_state(bo);
> +			/* Only act on a real DONTNEED -> WILLNEED transition. */
> +			if (vmas[i]->attr.purgeable_state == XE_MADV_PURGEABLE_DONTNEED) {
> +				vmas[i]->attr.purgeable_state = XE_MADV_PURGEABLE_WILLNEED;
> +				xe_bo_willneed_get_locked(bo);
> +			}
>  			break;
>  		case DRM_XE_VMA_PURGEABLE_STATE_DONTNEED:
> -			vmas[i]->attr.purgeable_state = XE_MADV_PURGEABLE_DONTNEED;
>  			/*
>  			 * Don't zap PTEs at DONTNEED time -- pages are still
>  			 * alive. The zap happens in xe_bo_move_notify() right
> @@ -391,7 +245,11 @@ static void madvise_purgeable(struct xe_device *xe, struct xe_vm *vm,
>  			 */
>  			vmas[i]->skip_invalidation = true;
>  
> -			xe_bo_recompute_purgeable_state(bo);
> +			/* Only act on a real WILLNEED -> DONTNEED transition. */
> +			if (vmas[i]->attr.purgeable_state == XE_MADV_PURGEABLE_WILLNEED) {
> +				vmas[i]->attr.purgeable_state = XE_MADV_PURGEABLE_DONTNEED;
> +				xe_bo_willneed_put_locked(bo);
> +			}
>  			break;
>  		default:
>  			/* Should never hit - values validated in madvise_args_are_sane() */
> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.h b/drivers/gpu/drm/xe/xe_vm_madvise.h
> index 39acd2689ca0..a3078f634c7e 100644
> --- a/drivers/gpu/drm/xe/xe_vm_madvise.h
> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.h
> @@ -13,6 +13,4 @@ struct xe_bo;
>  int xe_vm_madvise_ioctl(struct drm_device *dev, void *data,
>  			struct drm_file *file);
>  
> -void xe_bo_recompute_purgeable_state(struct xe_bo *bo);
> -
>  #endif
> -- 
> 2.43.0
> 
