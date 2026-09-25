Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E24B1C9830D
	for <intel-xe@archiver.kernel.org>; Fri, 25 Sep 2026 09:51:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A011D10E9EB;
	Fri, 25 Sep 2026 09:51:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E7f0qBfW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87E7410E9EB
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Sep 2026 09:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790329878; x=1821865878;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ekfIQ5kPyrBOpEVCDrJuj/EW9QIKPAGEoDuNiHfedk8=;
 b=E7f0qBfWzTUkpVxvMNJAwJCx0Fmz86YF9ZkQkJ03GnnQv+s68kjsCEYI
 0CvQhf3tEPIuJW+djlqy3SlOAVTmYpvIOrxQjM+eLjDKGOEcuVFYKm2lK
 cErEPCB+vxarKcJkpzQWXDntjRFjmH1h5x4JouEg8QNaRW5TJ3s69nE4P
 soB6SnuQ/ii+CDY6sHG+r/vdo4rTrA6O4EoJr7Q/V84CfK0jWOSszPtRg
 HA4Ib+LCN5Gyf9t/8cSdpfn58ma/1/QkP5QhOF9dsSs02sq0KmH1bgzvY
 fDmxDfXx9wQ2V9TE8WI71jFZlvSnBA0toWNewG7Ms10hAY10Ylbxd+A36 Q==;
X-CSE-ConnectionGUID: 4+g/VLmeR4u1cNcQ0MvwdA==
X-CSE-MsgGUID: k89bD3hASPmxICcewaS+PQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="90239514"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; d="scan'208";a="90239514"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 02:51:18 -0700
X-CSE-ConnectionGUID: NxjU1pKaTXyBRxO+72ZKkQ==
X-CSE-MsgGUID: JfL0h/KHR5C1656rAFD/TQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; d="scan'208";a="273383740"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 02:51:18 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 25 Sep 2026 02:51:17 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 25 Sep 2026 02:51:17 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.40) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 25 Sep 2026 02:51:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bYtzEnjNT0I3n0GhOtPB7z4vf3aGtQ1HQgmu+eZpoQHFc/T+UbN6jmYocB1qMu/G6kAgW6UYZP0F8nZ/xHmsT9z7IOvyJJsTtQm/S5PKo98/DuixGnKuUYbQZwBTpRI5nVRnGBRUAiu8Flum1y1WiwE1ykfEdM/XhkDbt//1m+OYcuqv01PbQG6dZZdfyzd/8F4JwtvmO7bvCrARu0TZ2sb1BntjXVau0NkQ2NPe6aRpzAVvgkueOeoIWHxQSRpl/uKelHHF/E0NWAZREYkeJ04j0BSAmPkKOTeQuASrn8niHOIkh0iyOV2sEx+cWjpi8IGeUqoRlIyP6x23iCzfQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iQ1CRLT1wyz/XHeSW6jq3rR+c4g58pQsDaRe99jRWAw=;
 b=o9oJWeHieQM2sAuH26LoL6hgpiclYM46/H8si+jIurD8ps2kzzMcyO4hPFSDHsifXByF2MLlfMk+aIr48clo3weGN97bQI4wPhRO5qSF50VUc1Vhf7ut7FnTJru24zhxsTsIlnrv6gGBlbVU0l5AOCDhdzJ+d8VAR9bzP+MDABet5DpBpsbLU5e4J/tWzYNjO4byJcnrHAFtmNZKolH+ZgpqmdbvOqkWLOefR1xUDSQhfAu9eWbK8j5xfHzJLcELDBHTErCv6I79xHII356eUl+fpTviOlCZR4PHTaVgwM8e/rjjzpFFNaH3T8diyRs3Gk8xYums4NEU+VA/XMYKqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB9534.namprd11.prod.outlook.com (2603:10b6:510:39f::22)
 by DS0PR11MB6423.namprd11.prod.outlook.com (2603:10b6:8:c5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Fri, 25 Sep
 2026 09:51:13 +0000
Received: from PH8PR11MB9534.namprd11.prod.outlook.com
 ([fe80::16ca:6958:c9e9:a266]) by PH8PR11MB9534.namprd11.prod.outlook.com
 ([fe80::16ca:6958:c9e9:a266%5]) with mapi id 15.21.0451.014; Fri, 25 Sep 2026
 09:51:13 +0000
Date: Fri, 25 Sep 2026 11:51:06 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v7 17/24] drm/xe: Add device flag to enable PT mirroring
 across tiles
Message-ID: <arZEAWldjKQXDjsy@fdugast-desk>
References: <20260925045320.1325860-1-matthew.brost@intel.com>
 <20260925045320.1325860-18-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260925045320.1325860-18-matthew.brost@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DUZPR01CA0253.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b5::7) To PH8PR11MB9534.namprd11.prod.outlook.com
 (2603:10b6:510:39f::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB9534:EE_|DS0PR11MB6423:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e93ccf0-10c4-47b0-52ad-08df1aea8908
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|10067099003|4143699003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: yvCICL1MFwK3cjoejJ4mzRQULAOyjVgJmop+5Hlq5ICOIX1HvqJufdexe+1CX4/W/culEBchGAgBPfb86PwDXO9yunoJzyqhjwIKWbv46xx9bC2ct+xgmVhzrbfQQ2N12xHP+FFVdYALSEeZjOcfr+UchyldtXPldH9PIw556KGZPtu2wU0p+5fON3IMCxxghtHYxjYerBvLjEVcEa3ZEoTq8Hb1n/4/htrGGeZmmDwtssgUbGKCG/Hwhj4O62kR5VDHXIBDNU0/UajE4dSr5K63xbXW1tbOsfjwQL8uzC4Km4QWDqm0Oxlj1yhOcin9WCMPv2fE4XO4NUePL6IepsCFRuCLKdxX+RVn890i1rF6Fvo2jpbhD5TOaBQxiGt5K/DExGX6sLvKI8b75MEauCk1z8MS0998/15Lfg/mKNbs9Dgpz7d/t2IWyTxzX8B+jWsPjQXPr5Ll0VBaaSwivb0tIDEv6exLr0dAh4M3Ubw4wgnV7Wlp6wq04HyLy4R1pOT7SQqmAe1YHC8s6ug/tqu2d4qKxbQVoS8ufe8MzJdpe1Ou+x1TSe4uOKBk4RqA2vAe+daMOR3v0Osd75g7zKXHFLJvhUuLs08yg4hY3eOq5vq1q6LLKhAaJW1K7KAPQki2OK4+IFneD5wCb0mdPqdJfPfyjNy5bywjDGsBB1E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB9534.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(10067099003)(4143699003)(56012099006)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qtDbKcpDEjjEl1SuEgI0/Q3/8IJcbn2ktnDLQzbrhKRQDBlzaSREW1Gi6HbL?=
 =?us-ascii?Q?1JPDm/sKTeooGyP6KGF+xmEF3szRuO/pqdUW/6tRe3GagMPr249nIWAOCWxX?=
 =?us-ascii?Q?y0Kum4r8B+5Sd2CY+ahunHYZdyQd3RTz7KD3+nsdleUoBNRS5wFNOt7jnRts?=
 =?us-ascii?Q?ABWKCgTGnHF31eW7UWuUDrSpBjiq4oJGyEzjMXo5ZwhGFgMnJaXUG/QoSkl8?=
 =?us-ascii?Q?3pBfQZa18t5ETw0CQr3OmwQmGTN/1N+ifoU6zwCf+EfasFV1z+lljInlOvCX?=
 =?us-ascii?Q?Jo6amQR+P4feg2jyfg+oQ6s6VL+eWXd1xxbat7IdyIG8vdlBvwkrZnzrsLER?=
 =?us-ascii?Q?Wrx2VAxPb64J7xqIFRnDStHh74KCNdvXL9a2wtNf5AAT3/lq2ouDnjiybXiS?=
 =?us-ascii?Q?6l3wybL5qrLOCSqlDOWg6hempfn2FvWn//bTKmsHuc9avEebHUQvy8scIufi?=
 =?us-ascii?Q?OSSwg2vPgJhtJYYJ/CWHFwjpDof1SYr9AhM0G5Cy0+x1SEDkVlesnXvnNwRH?=
 =?us-ascii?Q?h+Ifpyel6zdQ7w4lLEPKd0juLGj0ipeWjhyWvil7er7+IywFBDGWiGk02rp2?=
 =?us-ascii?Q?1JpKshEhyKzI/2pHVNXpxZGvg+3BVxxAh4Rw/wtnRbV4RUZuLwZ+zDY5jiPa?=
 =?us-ascii?Q?XS3QmmNRPpd1wwUpntGS//TfjoHHKgp9olKc+ngW4L5m6vphpSnodY9LQnjc?=
 =?us-ascii?Q?vbhR6NBDZxAqv4avZhWi1mxdWkIIF95lnLPVxJ1KaTrEXdtQR9M1MNaaCt8u?=
 =?us-ascii?Q?tAqsZy6wgln7x0sEcgFfJr70dTLlm+MiDISzQcGkXNkcw/ra/F/ekemK/ery?=
 =?us-ascii?Q?lWHxYwN7Ce+9n85us6YsPjCcmPAyQ9zWgjvaPdB7UQI/rkFtfnHnfjpE4pop?=
 =?us-ascii?Q?0NI42O5w+R0i8Rqbro0qn0Onne8WMeaW+o3pnWktwzx5ROD00UB/mGqguh9v?=
 =?us-ascii?Q?beSsKNNj1zLc+hDIry1ffHQGOmdAAMgCwh+wtNeT44XToYizy/Vqa1W+fgez?=
 =?us-ascii?Q?/GnnThTsch+jGeITZzzUSTRFsX57TzFh9BdYagbOR8oW82IsmxJ66NahKnuT?=
 =?us-ascii?Q?oZbcReBbYDhCQ2SbtooL/zDJSQf99taKkQMAipdYZkzS5DvweVbVZk7lmNNv?=
 =?us-ascii?Q?/jdCelA+qLSveAs6lVjOUL/IXifWVpoYXBLwKFRtwmSQ73sKIr89pHRsbetu?=
 =?us-ascii?Q?LR0OUdT3pEI8jno+dlt2tLvX+1DLXvnZXC9CkDOFhUgTt85+KLReHtooqO9B?=
 =?us-ascii?Q?w4GRcRZeny0Eb9M5hLiZYoduR05PVZ4XmEV+OatPHrA5LHx40CQS63SImcQd?=
 =?us-ascii?Q?g34AVT3Q4VAvCANKJ8kEKKlaUJUvex14y5LeuR1Tf12VGO5iReuSvt7XA0aj?=
 =?us-ascii?Q?0BINw9SIh3ENlxzxHO8vRPoRiK4LAhd1XpOsmRftrChah76ttBfe3LukHVyR?=
 =?us-ascii?Q?q/6486Q8TeqvRLIB9r09CPEEdwRP+BqW4UwXToE41cCfUdBvsAh9M5Hk6J9m?=
 =?us-ascii?Q?YyqomaaG485+GVdmMYftqSlTmdHGyXIZitywvQpv0VDAaTN8R3iH4Ser/GVN?=
 =?us-ascii?Q?ayE6q3ZnJ84nN4setXf88lMZ2Md8Grn9iqKzZw2iQRLsc9pwES5Njqo+LIpo?=
 =?us-ascii?Q?8mb8O402tglqejOpL0jViF39XcoJhgxhhatAsAaMezCv4tFrWkZKJjEru2F5?=
 =?us-ascii?Q?pygWLkBumSo77eCIsYXyMl0lNqbuamsYRg3mkYRZLDSLkhafP26X6ss23WsT?=
 =?us-ascii?Q?mr00jvP72I0IcxfJP/OV4GtpyHw8LTM=3D?=
X-Exchange-RoutingPolicyChecked: rjy4yKYhF07wRixwB6Vv5ETErl7UAxtkC7sFxgExDwZE5S+uWJo9xeu2UsjTxjMCaJyqKM88Px8jupVSDK8hntcqb42uXsUdL8gjizXUFmqt9kTIKSkupObhWgB1vDPEFY0z1Qgbu2AOMUWj1YAR0vHw7HtJN+/O4gBWxhsOCIfekjIBFfTVAVP7o6dM43ekCM6lWKgc8FQFbvhZYVejkRgV7mkgLzM1tkSOt3/DBcP2clmB97mxHH99eGTKWOGZ3PQXc1h0xaXYq0IhzTmrC7a9bJm5AwJb7Yqbl/1WFPvrOLbOwQGmW38+dR1TPGY45mfFV6pZQ2bFNTBAdjVc2A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e93ccf0-10c4-47b0-52ad-08df1aea8908
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB9534.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 09:51:13.4455 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1uJbkXFOJqeYlbUz47/EWtVAiBIR7WZ4c/ao+K/ho9+XxPYxvM249mcy3GEPb5UPBBuvN1CbCT11xE4OoH9TmOjSVgIVNiohGXMmUXvlIoU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6423
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

On Thu, Sep 24, 2026 at 09:53:13PM -0700, Matthew Brost wrote:
> Some multi-tile devices may want to mirror page tables across tiles for
> memory-bandwidth reasons, while others may not. Add a device flag that
> allows enabling or disabling page-table mirroring across tiles.
> 
> Setting the flag to true (the existing behavior) on PVC, but both modes
> have been tested and are working on PVC.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> 
> ---
> v7:
>  - Rework pt_mirroring_disabled_for_tile (Himal)
> ---
>  drivers/gpu/drm/xe/xe_device_types.h |  2 ++
>  drivers/gpu/drm/xe/xe_migrate.c      |  5 ++--
>  drivers/gpu/drm/xe/xe_pci.c          |  2 ++
>  drivers/gpu/drm/xe/xe_pci_types.h    |  3 ++-
>  drivers/gpu/drm/xe/xe_pt.c           | 36 +++++++++++++++++++++++++--
>  drivers/gpu/drm/xe/xe_vm.c           | 37 +++++++++++++++++++++++++---
>  drivers/gpu/drm/xe/xe_vm.h           |  3 +++
>  7 files changed, 79 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index aff2e5c8b656..cd9ed8ff2940 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -229,6 +229,8 @@ struct xe_device {
>  		u8 has_usm:1;
>  		/** @info.has_64bit_timestamp: Device supports 64-bit timestamps */
>  		u8 has_64bit_timestamp:1;
> +		/** @info.has_pt_mirror: Device has PT mirroring across tiles */
> +		u8 has_pt_mirror:1;
>  		/** @info.is_dgfx: is discrete device */
>  		u8 is_dgfx:1;
>  		/** @info.needs_scratch: needs scratch page for oob prefetch to work */
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index f7e1a81434b2..471ae5741836 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -246,7 +246,8 @@ static void xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
>  	struct xe_device *xe = tile_to_xe(tile);
>  	u16 pat_index = xe_cache_pat_idx(xe, XE_CACHE_WB);
>  	u8 id = tile->id;
> -	u32 num_entries = NUM_PT_SLOTS, num_level = vm->pt_root[id]->level;
> +	u32 num_entries = NUM_PT_SLOTS, num_level =
> +		xe_vm_pt_root(vm, id)->level;
>  #define VRAM_IDENTITY_MAP_PT_COUNT	4
>  	u32 num_setup = num_level + VRAM_IDENTITY_MAP_PT_COUNT;
>  #undef VRAM_IDENTITY_MAP_PT_COUNT
> @@ -258,7 +259,7 @@ static void xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
>  	u64 l1_pt_ofs = xe_bo_size(bo) - 5 * XE_PAGE_SIZE;
>  
>  	entry = vm->pt_ops->pde_encode_bo(bo, l1_pt_ofs);
> -	xe_pt_write(xe, &vm->pt_root[id]->bo->vmap, 0, entry);
> +	xe_pt_write(xe, &xe_vm_pt_root(vm, id)->bo->vmap, 0, entry);
>  
>  	map_ofs = (num_entries - num_setup) * XE_PAGE_SIZE;
>  
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index d64e873d9e71..28f37e034e02 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -371,6 +371,7 @@ static const __maybe_unused struct xe_device_desc pvc_desc = {
>  	.has_display = false,
>  	.has_drm_ras = true,
>  	.has_gsc_nvm = 1,
> +	.has_pt_mirror = 1,
>  	.has_heci_gscfi = 1,
>  	.max_gt_per_tile = 1,
>  	.max_remote_tiles = 1,
> @@ -807,6 +808,7 @@ static int xe_info_init_early(struct xe_device *xe,
>  	xe->info.has_mert = desc->has_mert;
>  	xe->info.has_page_reclaim_hw_assist = desc->has_page_reclaim_hw_assist;
>  	xe->info.has_pre_prod_wa = desc->has_pre_prod_wa;
> +	xe->info.has_pt_mirror = desc->has_pt_mirror;
>  	xe->info.has_pxp = desc->has_pxp;
>  	xe->info.has_soc_remapper_sysctrl = desc->has_soc_remapper_sysctrl;
>  	xe->info.has_soc_remapper_telem = desc->has_soc_remapper_telem;
> diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
> index fed509ff601e..71068cdb3558 100644
> --- a/drivers/gpu/drm/xe/xe_pci_types.h
> +++ b/drivers/gpu/drm/xe/xe_pci_types.h
> @@ -52,8 +52,9 @@ struct xe_device_desc {
>  	u8 has_mbx_power_limits:1;
>  	u8 has_mbx_thermal_info:1;
>  	u8 has_mert:1;
> -	u8 has_pre_prod_wa:1;
>  	u8 has_page_reclaim_hw_assist:1;
> +	u8 has_pre_prod_wa:1;
> +	u8 has_pt_mirror:1;
>  	u8 has_pxp:1;
>  	u8 has_soc_remapper_sysctrl:1;
>  	u8 has_soc_remapper_telem:1;
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index fbefcfc52dca..dcef29b56d63 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -804,7 +804,7 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
>  		.wupd.entries = entries,
>  		.clear_pt = clear_pt,
>  	};
> -	struct xe_pt *pt = vm->pt_root[tile->id];
> +	struct xe_pt *pt = xe_vm_pt_root(vm, tile->id);
>  	int ret;
>  	bool is_purged = false;
>  
> @@ -1005,6 +1005,11 @@ static int xe_pt_zap_ptes_entry(struct xe_ptw *parent, pgoff_t offset,
>  	return 0;
>  }
>  
> +static bool pt_mirroring_disabled_for_tile(struct xe_vm *vm, u8 tile_id)
> +{
> +	return !vm->xe->info.has_pt_mirror && tile_id;
> +}
> +
>  static const struct xe_pt_walk_ops xe_pt_zap_ptes_ops = {
>  	.pt_entry = xe_pt_zap_ptes_entry,
>  };
> @@ -1046,6 +1051,9 @@ bool xe_pt_zap_ptes(struct xe_tile *tile, struct xe_vma *vma)
>  	if (!(pt_mask & BIT(tile->id)))
>  		return false;
>  
> +	if (pt_mirroring_disabled_for_tile(xe_vma_vm(vma), tile->id))
> +		return true;
> +
>  	(void)xe_pt_walk_shared(&pt->base, pt->level, xe_vma_start(vma),
>  				xe_vma_end(vma), &xe_walk.base);
>  
> @@ -1098,6 +1106,9 @@ bool xe_pt_zap_ptes_range(struct xe_tile *tile, struct xe_vm *vm,
>  	if (!(pt_mask & BIT(tile->id)))
>  		return false;
>  
> +	if (pt_mirroring_disabled_for_tile(vm, tile->id))
> +		return true;
> +
>  	(void)xe_pt_walk_shared(&pt->base, pt->level, xe_svm_range_start(range),
>  				xe_svm_range_end(range), &xe_walk.base);
>  
> @@ -1987,7 +1998,7 @@ static unsigned int xe_pt_stage_unbind(struct xe_tile *tile,
>  		.wupd.entries = entries,
>  		.prl = pt_update_op->prl,
>  	};
> -	struct xe_pt *pt = vm->pt_root[tile->id];
> +	struct xe_pt *pt = xe_vm_pt_root(vm, tile->id);
>  
>  	(void)xe_pt_walk_shared(&pt->base, pt->level, start, end,
>  				&xe_walk.base);
> @@ -2539,9 +2550,21 @@ int xe_pt_update_ops_prepare(struct xe_device *xe, struct xe_vma_ops *vops)
>  	int id, err;
>  
>  	for_each_tile(tile, xe, id) {
> +		struct xe_vm_pgtable_update_ops *pt_update_ops =
> +			&vops->pt_update_ops[id];
> +
>  		if (!vops->pt_update_ops[id].num_ops)
>  			continue;
>  
> +		if (pt_mirroring_disabled_for_tile(vops->vm, id)) {
> +			struct xe_page_reclaim_list *prl = &pt_update_ops->prl;
> +
> +			/* Transfer root PT update ops PRL to current */
> +			*prl = vops->pt_update_ops[0].prl;
> +			xe_page_reclaim_entries_get(prl->entries);
> +			continue;
> +		}
> +
>  		err = __xe_pt_update_ops_prepare(tile, vops);
>  		if (err)
>  			return err;
> @@ -2833,6 +2856,12 @@ xe_pt_update_ops_run(struct xe_device *xe, struct xe_vma_ops *vops)
>  		struct xe_vm_pgtable_update_ops *pt_update_ops =
>  			&vops->pt_update_ops[j];
>  
> +		if (pt_mirroring_disabled_for_tile(vm, j)) {
> +			xe_tile_assert(tile, !get_current_op(pt_update_ops));
> +			tile_mask |= BIT(tile->id);
> +			continue;
> +		}
> +
>  		for (i = 0; i < get_current_op(pt_update_ops); ++i) {
>  			struct xe_vm_pgtable_update_op *pt_op =
>  				to_pt_op(pt_update_ops, i);
> @@ -2946,6 +2975,9 @@ void xe_pt_update_ops_abort(struct xe_device *xe, struct xe_vma_ops *vops)
>  			&vops->pt_update_ops[id];
>  		int i;
>  
> +		if (pt_mirroring_disabled_for_tile(vops->vm, id))
> +			continue;
> +
>  		for (i = pt_update_ops->num_ops - 1; i >= 0; --i) {
>  			struct xe_vm_pgtable_update_op *pt_op =
>  				to_pt_op(pt_update_ops, i);
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 0f542f47b9a8..f450e1c6f750 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -846,6 +846,14 @@ int xe_vm_rebind(struct xe_vm *vm, bool rebind_worker)
>  	return err;
>  }
>  
> +static u8 adjust_rebind_tile_mask(struct xe_vm *vm, u8 tile_mask)
> +{
> +	if (vm->xe->info.has_pt_mirror)
> +		return tile_mask;
> +
> +	return (0x1 << vm->xe->info.tile_count) - 1;
> +}
> +
>  struct dma_fence *xe_vma_rebind(struct xe_vm *vm, struct xe_vma *vma, u8 tile_mask)
>  {
>  	struct dma_fence *fence = NULL;
> @@ -862,7 +870,8 @@ struct dma_fence *xe_vma_rebind(struct xe_vm *vm, struct xe_vma *vma, u8 tile_ma
>  	vops.flags |= XE_VMA_OPS_FLAG_SKIP_TLB_WAIT |
>  		XE_VMA_OPS_FLAG_WAIT_VM_BOOKKEEP;
>  
> -	err = xe_vm_ops_add_rebind(&vops, vma, tile_mask);
> +	err = xe_vm_ops_add_rebind(&vops, vma,
> +				   adjust_rebind_tile_mask(vm, tile_mask));
>  	if (err)
>  		return ERR_PTR(err);
>  
> @@ -949,7 +958,8 @@ struct dma_fence *xe_vm_range_rebind(struct xe_vm *vm,
>  	vops.flags |= XE_VMA_OPS_FLAG_SKIP_TLB_WAIT |
>  		XE_VMA_OPS_FLAG_WAIT_VM_BOOKKEEP;
>  
> -	err = xe_vm_ops_add_range_rebind(&vops, vma, range, tile_mask);
> +	err = xe_vm_ops_add_range_rebind(&vops, vma, range,
> +					 adjust_rebind_tile_mask(vm, tile_mask));
>  	if (err)
>  		return ERR_PTR(err);
>  
> @@ -1739,7 +1749,8 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags, struct xe_file *xef)
>  
>  		for_each_tile(tile, xe, id) {
>  			if (flags & XE_VM_FLAG_MIGRATION &&
> -			    tile->id != XE_VM_FLAG_TILE_ID(flags))
> +			    tile->id != XE_VM_FLAG_TILE_ID(flags) &&
> +			    (vm->xe->info.has_pt_mirror || id))
>  				continue;
>  
>  			vm->pt_root[id] = xe_pt_create(vm, tile, xe->info.vm_max_level,
> @@ -2049,7 +2060,7 @@ struct xe_vm *xe_vm_lookup(struct xe_file *xef, u32 id)
>  
>  u64 xe_vm_pdp4_descriptor(struct xe_vm *vm, struct xe_tile *tile)
>  {
> -	return vm->pt_ops->pde_encode_bo(vm->pt_root[tile->id]->bo, 0);
> +	return vm->pt_ops->pde_encode_bo(xe_vm_pt_root(vm, tile->id)->bo, 0);
>  }
>  
>  static struct xe_exec_queue *
> @@ -5074,3 +5085,21 @@ void xe_vm_remove_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
>  	}
>  	up_write(&vm->exec_queues.lock);
>  }
> +
> +/**
> + * xe_vm_pt_root() - Retrieve VM page-table root
> + * @vm: The VM.
> + * @tile_id: Tile ID
> + *
> + * Retrieve VM page-table root for a tile ID, used to abstract if PT mirroring is
> + * enabled across tiles.
> + *
> + * Return: VM page-table root for a tile ID
> + */
> +struct xe_pt *xe_vm_pt_root(struct xe_vm *vm, u8 tile_id)
> +{
> +	if (vm->xe->info.has_pt_mirror)
> +		return vm->pt_root[tile_id];
> +
> +	return vm->pt_root[0];
> +}
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index c5b900f38ded..89c4f95984a2 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -436,4 +436,7 @@ static inline struct drm_exec *xe_vm_validation_exec(struct xe_vm *vm)
>  	((READ_ONCE(tile_present) & ~READ_ONCE(tile_invalidated)) & BIT((tile)->id))
>  
>  void xe_vma_mem_attr_copy(struct xe_vma_mem_attr *to, struct xe_vma_mem_attr *from);
> +
> +struct xe_pt *xe_vm_pt_root(struct xe_vm *vm, u8 tile_id);
> +
>  #endif
> -- 
> 2.34.1
> 
