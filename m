Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16510D1CDA8
	for <intel-xe@archiver.kernel.org>; Wed,  3 Dec 2025 22:56:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C19B188A27;
	Wed,  3 Dec 2025 22:56:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cNwGA0U6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8273D88A27
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Dec 2025 22:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764802567; x=1796338567;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=/kx2eznGK4HDxPyxG4p8/GD60PbvW6dZMKz4/EF2iXI=;
 b=cNwGA0U6wYV6EQp0ZnEECUcu2Q+VsHflUTZ8S8nUSXwL3ZeZul/0qyW6
 jQMTCiG2FNVw6jrV5rAApmrcnbj1G3V27xPxbzFxI11IIZPt0AELLsBK6
 KVPMY5UcuoxXCq7LlGfqUsgOm7YudFx6ZnNXQ7eYN78a0/ihoXFy4vvjU
 Naul9J2s6rRa1pQnongh7uHl3p5s/zyEsUVYCw1fC7t/e2aTvrrrDvMTW
 4be4F+Fav72TbMmARvyYQO5FPoG/gh8yijdf5dFn2RcwqcH0qMjgioDus
 PsM4pGDinfv6vt6bT9Sfclo1GM4anbDgytYa8ys7+vV0YscZpNOkcDSq7 w==;
X-CSE-ConnectionGUID: G4xtLck0SUqe3LKI2jDEgQ==
X-CSE-MsgGUID: 2h/BRUY7SNmAs7S3yHDS2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66888256"
X-IronPort-AV: E=Sophos;i="6.20,247,1758610800"; d="scan'208";a="66888256"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 14:56:06 -0800
X-CSE-ConnectionGUID: dnzSz561RjCoZ0WXnSQJpg==
X-CSE-MsgGUID: 6WBwgkF3RJCQGfvXy1qe0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,247,1758610800"; d="scan'208";a="225758796"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 14:56:06 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 3 Dec 2025 14:56:05 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 3 Dec 2025 14:56:05 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.39) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 3 Dec 2025 14:56:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=txP/YHsfwfRwxSc+Mdy194uyjcugxdtafQ7hIKlanXV0WREx+vZxWegRkjSkjIaQQYacQAaNuSAFHpSNMDSSFrBT8NfgCFLw7uGxdL0kyuI2p9LAyJLZXR5lg2u6tKPXUigdoEE58wfUHjCq79VDRcfWH06WFvKG62S0iVmtZows+diWbyRYq3yz54poz13ATwI4jkYSK2MTx1TZVlznapmXPDidmOr3FnNhWkVsB5U/bVJ1cXnNa7JakCqCyK2BQ8wTXgqh7LO3dBwLN2bxbW6qcP9vzVUozqF6qMWIsdMoVTIOFqmjkP34Qa80aH0e79Qd4l70P0LXDAaN0JOH+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3/y44v6JYg83M+1tqYg/MBn45ymQ8qhgkTxKWQGjZS4=;
 b=Bk20Itb5hpwEM1N0jaC4nWgAcb48479A0miyMrkcTS4byhXpCzG88eIjq6q6o80qRQdW2NwKubElmgQSdIftBFDB/dPmfNkhB4NgDpiAsbBXw8CCmKCVqm5rhwpuiS1g4exsMZm2vnCuPYehZQo/lg5AXYwbvPcKWkKW6lmCwt+Nf17DnlG5KxOpuynZsRRpyrnfJ8QZbiZTozzKNKas1u/OUgGm4E8Wsp3e9syODSxGbQY/X5E0tpHv1PQbVc0CGmXh244MrGTf8hoyIIjru0vY+2AbpKu41EHc15H+5JoGh7wy7nRowO3QGqwMF2zCNrLCzzbUsA/vdw+w6bCBVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH0PR11MB8085.namprd11.prod.outlook.com (2603:10b6:610:183::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Wed, 3 Dec
 2025 22:56:03 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9388.003; Wed, 3 Dec 2025
 22:56:03 +0000
Date: Wed, 3 Dec 2025 14:56:00 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Brian Nguyen <brian3.nguyen@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <tejas.upadhyay@intel.com>,
 <shuicheng.lin@intel.com>, <stuart.summers@intel.com>
Subject: Re: [PATCH v2 06/11] drm/xe: Create page reclaim list on unbind
Message-ID: <aTDAALlkzefO8NqO@lstrano-desk.jf.intel.com>
References: <20251126230201.3782788-13-brian3.nguyen@intel.com>
 <20251126230201.3782788-19-brian3.nguyen@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251126230201.3782788-19-brian3.nguyen@intel.com>
X-ClientProxiedBy: MW4PR04CA0080.namprd04.prod.outlook.com
 (2603:10b6:303:6b::25) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH0PR11MB8085:EE_
X-MS-Office365-Filtering-Correlation-Id: 6576dec5-0f04-4125-4a7b-08de32bf2281
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?veT5+gFEgusWUW/JNys6pTLfkjc+Ifyrae/Wnu/IS7pZvhA3rudY8a01w2?=
 =?iso-8859-1?Q?hXw2Uj/NdEkIFC2MnVH7SJUoqpF6b9eBct4hM0nfFZv8TlDzHa+PdCr5c6?=
 =?iso-8859-1?Q?CWKAfVGAljDjWG0UPibQIBnPJJwnEE5OUfJgaZvI60p4OPkJNNgwEFLTPN?=
 =?iso-8859-1?Q?cNgzvLzkFwdUQp0Zbip0Z+EupnAttfszYudXILLpG1peObsxO1uTd4hZG8?=
 =?iso-8859-1?Q?qVPsMwUO2sc5W9ERVfdMAEEcnvw1h//dOQnA58w5BqlXNjmuwIocjB02tk?=
 =?iso-8859-1?Q?hdVD6KrVNv23Pah9M4k1eNsnOUjc8EpforoZe764DZhBwg4c5qO47T+XQu?=
 =?iso-8859-1?Q?fBY3rPGVLwFEUoW6z9lE0RIK7XkPaINc2zTR+d2yW+roP17Xqm7zWN3m+O?=
 =?iso-8859-1?Q?KHI5zph+UgcX2pX3To/D01yKruskAp7l3BPFaYESH7XDb140yuSRTo7v16?=
 =?iso-8859-1?Q?7V1Eyuu1N/1/ImDJedS5rFmpUao8tu0AnkB9PuzgXJLIui111nb82ZXhVV?=
 =?iso-8859-1?Q?nVVlo1VXsqXhb72k+KxWdmQU/VNO9QqoDQDzyOHglQUWOVHgR9U+EAp82n?=
 =?iso-8859-1?Q?LhDMvAsuhJHPxlrb1B4mtr/5LR5wlipw9upNsFkPT+So6gVyIumClPsqRU?=
 =?iso-8859-1?Q?dTsvaPSN9fMqvBadzlKgwH9ylZqvrVTUdPtSZGMX4N7XAXP8mhYKjm+sPb?=
 =?iso-8859-1?Q?LeAYqA/l+er5aD/mzlHa7fB9qlOKj4nPtyOhH3Yofj7bhrOcfcRKKnfOlQ?=
 =?iso-8859-1?Q?m2/PDk/DcM/6221rUiRzh5gxktJJs5N3npO9UpxQs+ihHIc/PBuvRu+zg3?=
 =?iso-8859-1?Q?LRhEvV/3HL8hmJvmtXue1ROLSMfFe99dbJwtZ7np2PXYOUeIV3c2urgI/r?=
 =?iso-8859-1?Q?ZqmnRKgy9G0m13jztpSLQ5lQu9DSA3GMfYKqskXaUNS4GKsmiaJXVWMeSY?=
 =?iso-8859-1?Q?yrWNJyWI1+M6MZ5P8BUmF7qpARt10uEyYZafmiC7lBn3kJAWOtd8D1PgZY?=
 =?iso-8859-1?Q?dgYsln6tjxEkCUd1mRV7/h3nT5obwopP1y+YC/mpmY27835EfQOja7EIkg?=
 =?iso-8859-1?Q?xvi3zOWOpJaoTqlEOf6LGhTWg+pZ/Vvp5hpcVgQ6XefGX+CrDHaM2t6LE6?=
 =?iso-8859-1?Q?p9lURBk3lqoVzyiysCMYFb7mJ3yY6zSCJGryi01HUeVBf9CmIqJrGFt3yo?=
 =?iso-8859-1?Q?97FF4J15t5gi2a/vTlO/yaLhw0LXdN4K3HdeosgzniFqytAYxAnT/kSW+7?=
 =?iso-8859-1?Q?aS6ydm9DnBYNqAb1uOgXEW3F4iRJ6UUn1bqfhS5HI0K1wz7TSYu0MhxPLC?=
 =?iso-8859-1?Q?qtMrq7R3QTTRXeUESLbDyGDq5QK/Cn45pxeXDJD68/x7ypHCWuHTAirXl7?=
 =?iso-8859-1?Q?WUdAlFTXL+VqbvediHpvEa9dPEpSEIKvg6GmjG5wZy5qh1nYfRQdEE2fdN?=
 =?iso-8859-1?Q?j+0mwuYQEj5ceTn66J+NnqQyp7TMxgQiisU6dkSEoQ7GuXVr7fdAEhWrDs?=
 =?iso-8859-1?Q?IrfQd8IrYUD94V0KXBUGTB?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?19ABqWXEWH22DCdi3AkyDPR8Dl/ZPY4u7jxtZaB8SM48OYkyiBO6anHa1c?=
 =?iso-8859-1?Q?3aJH9pTP7hhXeZ1rOx/AHnELeEhDx1189lyAwDyljpY8CRKVsfBHr4kAWl?=
 =?iso-8859-1?Q?PDEFkVdSI6CtMB8RMR7HXmnT5AEFOPAmUKW+SWUTaOl39yoYuEwz3KBsWq?=
 =?iso-8859-1?Q?chq8llnqiZN98khkLM9AUO5BSk+s8oaRFQgV9IjA8tWcabM4zkvaEjGJdC?=
 =?iso-8859-1?Q?TjhL9/yCRizYx7mCm9E0axVZ6I7OU93OqzjU4c/6mjrAuoe9G4ikhzsnBj?=
 =?iso-8859-1?Q?oo7N+G7KPKDghJsKjihOhpFsMdw7bpnjZqO6VlWTpSdj7EUjm+A3v9RAE5?=
 =?iso-8859-1?Q?2kc5/O5+xxqS7rXGVGBBxHps3BeXm+j3vwpXFavAsaUSokzQAfP/cYp0gj?=
 =?iso-8859-1?Q?JUzCf01mw/2MenQlK3FqULIFY22dN74/S4z/eGGHt8K7zDPbWd9kBUIliA?=
 =?iso-8859-1?Q?f3ZOiyoyKNfj0pfC7IMeivZVlJd2svskdqX/F9RJma7C5xxVsqJK8tr7cs?=
 =?iso-8859-1?Q?2PD6o91+AyxEjBa+Jf0L1gz1E+IADjyHBVOlcGZRlcwLr5cL9cdRNmqq8u?=
 =?iso-8859-1?Q?sG0guKWzSn13NVnJiH+i+/54YMjEDi4RFRe06FYrnHn9jE98O8vO/xfcEb?=
 =?iso-8859-1?Q?RDX07kJqsSFRoDUSPGHaBvEGYsE62bPeyUVPeOHrIXRCJMoi2dDLcLqLYq?=
 =?iso-8859-1?Q?M4v1HZZquxKdPdwIro+LaEYgwSbt78QusxJCi18cGMVE4qlHk09Iy7HnmK?=
 =?iso-8859-1?Q?XD6bz1xE/Jqm333eWQzdr/yhvKtK+snQ96dFvR2iM91PJilVc02fX3k+As?=
 =?iso-8859-1?Q?p9LDjO614fPuSgIyrGsy8MxA4+hgdYlDPVF4npl7k8F0NGoz6G7tBSgl2Q?=
 =?iso-8859-1?Q?MIg6RbuPkjAJ7KkK8duknIgJ7XTzdSrC2UUeKWFn0LFLdSNlSLjCojAMMR?=
 =?iso-8859-1?Q?jGY2Hl8ci4uaxHMLUigVikInNwWmzc86VLqNmTaMBrMv3FNUjY1jqLdjGb?=
 =?iso-8859-1?Q?sPHSYHxAdaPWzLpGOZWDhnbPuj6o8EBzhzRAOgtScB7QQbRO3JeAcZL10J?=
 =?iso-8859-1?Q?pGx5ru8Yt2b9UrN+Lgfw4jhrKleGZ5LwKfxebFpxz+onHbjeFgmTXXBDNw?=
 =?iso-8859-1?Q?Ks4yb3/VFxhh6rMyX3eNPQNRCkdXz8izkyhwQZUn3+S9zOHehF1n4Qo5HD?=
 =?iso-8859-1?Q?6Y/fufZ4VtY03BLsj/Tg8gKjQGjh7i3sVVtmjF6wpxhwdtLuUTGvLRLrL6?=
 =?iso-8859-1?Q?riHezo0R4UpQlBL1AtObaH7rbt6/4YnEzfsCEWj3T3vkw2aPRv7CCB3cbR?=
 =?iso-8859-1?Q?a3jTviXo5uuzXQSKQ+EnxlqSnb7y/+XKEoOyZGT+Jvn3BITS+UupptpMdx?=
 =?iso-8859-1?Q?iQVAlvqsiGHEYHtP1tlXLN3I61KVKZtmePeC0HUVJiNjN73BVyywEGJTVq?=
 =?iso-8859-1?Q?+SW0a39PiYytE1D8fa/iZOzIY8RRRTcOiksDWZk3rkHdpSpZJdAXRm3SqY?=
 =?iso-8859-1?Q?P1R0qBo0Iduq0O95kQD/L8MEmuGYdV/0p6zqgPuenccSV4YgBeXU2w5ZsB?=
 =?iso-8859-1?Q?zFDPg1H+0Mgpime/zvE+gZrlgRXtxR1N0SF+mg7rOCJNrHe0/mMXXxKbTi?=
 =?iso-8859-1?Q?iqQCGIXvTrjt7aNG80ise8rwILAR6Mx/y2wOfDQ5xKs2CKOHZ3GaXjCw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6576dec5-0f04-4125-4a7b-08de32bf2281
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 22:56:03.4220 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rqg7q2Wfe0jeHfRt7kyGJ6hC6ik+Fx9TUUlx+FA7xjspaK2yyqt6vOHyMYxIvN9eq53ao9DMV2GlJGIDHkNOwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8085
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

On Thu, Nov 27, 2025 at 07:02:07AM +0800, Brian Nguyen wrote:
> Page reclaim list (PRL) is preparation work for the page reclaim feature.
> The PRL is firstly owned by pt_update_ops and all other page reclaim
> operations will point back to this PRL. PRL generates its entries during
> the unbind page walker, updating the PRL.
> 
> This PRL is restricted to a 4K page, so 512 page entries at most.
> 
> v2:
>  - Removed unused function. (Shuicheng)
>  - Compacted warning checking, update commit message,
>    spelling, etc. (Shuicheng, Matthew B)
>  - Fix kernel docs
>  - Moved PRL max entries overflow handling out from
>    generate_reclaim_entry to caller (Shuicheng)
>  - Add xe_page_reclaim_list_init for clarity. (Matthew B)
>  - Modify xe_guc_page_reclaim_entry to use macros
>    for greater flexbility. (Matthew B)
>  - Add fallback for PTE outside of page reclaim supported
>    4K, 64K, 2M pages (Matthew B)
>  - Invalidate PRL for early abort page walk.
>  - Removed page reclaim related variables from tlb fence
>    (Matthew Brost)
>  - Remove error handling in *alloc_entries failure. (Matthew B)
> 
> Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile           |   1 +
>  drivers/gpu/drm/xe/regs/xe_gtt_defs.h |   1 +
>  drivers/gpu/drm/xe/xe_page_reclaim.c  |  62 ++++++++++++++
>  drivers/gpu/drm/xe/xe_page_reclaim.h  |  73 +++++++++++++++++
>  drivers/gpu/drm/xe/xe_pt.c            | 112 +++++++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_pt_types.h      |   5 ++
>  6 files changed, 253 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_page_reclaim.c
>  create mode 100644 drivers/gpu/drm/xe/xe_page_reclaim.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index c9b60e19cecc..cbce647f2f01 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -95,6 +95,7 @@ xe-y += xe_bb.o \
>  	xe_oa.o \
>  	xe_observation.o \
>  	xe_pagefault.o \
> +	xe_page_reclaim.o \
>  	xe_pat.o \
>  	xe_pci.o \
>  	xe_pcode.o \
> diff --git a/drivers/gpu/drm/xe/regs/xe_gtt_defs.h b/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
> index 4389e5a76f89..4d83461e538b 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
> @@ -9,6 +9,7 @@
>  #define XELPG_GGTT_PTE_PAT0	BIT_ULL(52)
>  #define XELPG_GGTT_PTE_PAT1	BIT_ULL(53)
>  
> +#define XE_PTE_ADDR_MASK	GENMASK_ULL(51, 12)
>  #define GGTT_PTE_VFID		GENMASK_ULL(11, 2)
>  
>  #define GUC_GGTT_TOP		0xFEE00000
> diff --git a/drivers/gpu/drm/xe/xe_page_reclaim.c b/drivers/gpu/drm/xe/xe_page_reclaim.c
> new file mode 100644
> index 000000000000..63facea28213
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_page_reclaim.c
> @@ -0,0 +1,62 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/kref.h>
> +#include <linux/mm.h>
> +#include <linux/slab.h>
> +
> +#include "xe_page_reclaim.h"
> +
> +#include "regs/xe_gt_regs.h"
> +#include "xe_assert.h"
> +#include "xe_macros.h"
> +
> +/**
> + * xe_page_reclaim_list_invalidate() - Mark a PRL as invalid
> + * @prl: Page reclaim list to reset
> + *
> + * Clears the entries pointer and marks the list as invalid so
> + * future use knows PRL is unusable. It is expected that the entries
> + * have already been released.
> + */
> +void xe_page_reclaim_list_invalidate(struct xe_page_reclaim_list *prl)
> +{
> +	prl->entries = NULL;
> +	prl->num_entries = XE_PAGE_RECLAIM_INVALID_LIST;
> +}
> +
> +/**
> + * xe_page_reclaim_list_init() - Initialize a page reclaim list
> + * @prl: Page reclaim list to initialize
> + *
> + * Invalidates the list to prepare on initalization.
> + */
> +void xe_page_reclaim_list_init(struct xe_page_reclaim_list *prl)
> +{
> +	xe_page_reclaim_list_invalidate(prl);
> +}
> +
> +/**
> + * xe_page_reclaim_list_alloc_entries() - Allocate page reclaim list entries
> + * @prl: Page reclaim list to allocate entries for
> + *
> + * Allocate one 4K page for the PRL entries, otherwise assign prl->entries to NULL.
> + */
> +int xe_page_reclaim_list_alloc_entries(struct xe_page_reclaim_list *prl)
> +{
> +	struct page *page;
> +
> +	if (XE_WARN_ON(prl->entries))
> +		return 0;
> +
> +	page = alloc_page(GFP_KERNEL | __GFP_ZERO);
> +	if (page) {
> +		prl->entries = page_address(page);
> +		prl->num_entries = 0;
> +	}
> +
> +	return page ? 0 : -ENOMEM;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_page_reclaim.h b/drivers/gpu/drm/xe/xe_page_reclaim.h
> new file mode 100644
> index 000000000000..5ccff46d1b4e
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_page_reclaim.h
> @@ -0,0 +1,73 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _XE_PAGE_RECLAIM_H_
> +#define _XE_PAGE_RECLAIM_H_
> +
> +#include <linux/kref.h>
> +#include <linux/mm.h>
> +#include <linux/slab.h>
> +#include <linux/types.h>
> +#include <linux/workqueue.h>
> +#include <linux/bits.h>
> +
> +#define XE_PAGE_RECLAIM_MAX_ENTRIES	512
> +#define XE_PAGE_RECLAIM_LIST_MAX_SIZE	SZ_4K
> +
> +struct xe_guc_page_reclaim_entry {
> +	u32 dw0;
> +/* valid reclaim entry bit */
> +#define XE_PAGE_RECLAIM_VALID		BIT(0)
> +/*
> + * offset order of page size to be reclaimed
> + * page_size = 1 << (XE_PTE_SHIFT + reclamation_size)
> + */
> +#define XE_PAGE_RECLAIM_SIZE		GENMASK(6, 1)
> +#define XE_PAGE_RECLAIM_RSVD_0		GENMASK(11, 7)
> +/* lower 20 bits of the physical address */
> +#define XE_PAGE_RECLAIM_ADDR_LO		GENMASK(31, 12)
> +	u32 dw1;
> +/* upper 20 bits of the physical address */
> +#define XE_PAGE_RECLAIM_ADDR_HI		GENMASK(19, 0)
> +#define XE_PAGE_RECLAIM_RSVD_1		GENMASK(31, 20)
> +} __packed;
> +
> +struct xe_page_reclaim_list {
> +	/** @entries: array of page reclaim entries, page allocated */
> +	struct xe_guc_page_reclaim_entry *entries;
> +	/** @num_entries: number of entries */
> +	int num_entries;
> +#define XE_PAGE_RECLAIM_INVALID_LIST	-1
> +};
> +
> +void xe_page_reclaim_list_invalidate(struct xe_page_reclaim_list *prl);
> +void xe_page_reclaim_list_init(struct xe_page_reclaim_list *prl);
> +int xe_page_reclaim_list_alloc_entries(struct xe_page_reclaim_list *prl);
> +/**
> + * xe_page_reclaim_entries_get() - Increment the reference count of page reclaim entries.
> + * @entries: Pointer to the array of page reclaim entries.
> + *
> + * This function increments the reference count of the backing page.
> + */
> +static inline void xe_page_reclaim_entries_get(struct xe_guc_page_reclaim_entry *entries)
> +{
> +	if (entries)
> +		get_page(virt_to_page(entries));
> +}
> +
> +/**
> + * xe_page_reclaim_entries_put() - Decrement the reference count of page reclaim entries.
> + * @entries: Pointer to the array of page reclaim entries.
> + *
> + * This function decrements the reference count of the backing page
> + * and frees it if the count reaches zero.
> + */
> +static inline void xe_page_reclaim_entries_put(struct xe_guc_page_reclaim_entry *entries)
> +{
> +	if (entries)
> +		put_page(virt_to_page(entries));
> +}
> +
> +#endif	/* _XE_PAGE_RECLAIM_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 884127b4d97d..347b111dc097 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -12,6 +12,7 @@
>  #include "xe_exec_queue.h"
>  #include "xe_gt.h"
>  #include "xe_migrate.h"
> +#include "xe_page_reclaim.h"
>  #include "xe_pt_types.h"
>  #include "xe_pt_walk.h"
>  #include "xe_res_cursor.h"
> @@ -1535,6 +1536,9 @@ struct xe_pt_stage_unbind_walk {
>  	/** @modified_end: Walk range start, modified like @modified_start. */
>  	u64 modified_end;
>  
> +	/** @prl: Backing pointer to page reclaim list in pt_update_ops */
> +	struct xe_page_reclaim_list *prl;
> +
>  	/* Output */
>  	/* @wupd: Structure to track the page-table updates we're building */
>  	struct xe_walk_update wupd;
> @@ -1572,6 +1576,61 @@ static bool xe_pt_check_kill(u64 addr, u64 next, unsigned int level,
>  	return false;
>  }
>  
> +/* Huge 2MB leaf lives directly in a level-1 table and has no children */
> +static bool is_2m_pte(struct xe_pt *pte)
> +{
> +	return pte->level == 1 && !pte->base.children;
> +}
> +
> +/* page_size = 2^(reclamation_size + XE_PTE_SHIFT) */
> +#define COMPUTE_RECLAIM_ADDRESS_MASK(page_size)				\
> +({									\
> +	BUILD_BUG_ON(!__builtin_constant_p(page_size));			\
> +	ilog2(page_size) - XE_PTE_SHIFT;				\
> +})
> +
> +static void generate_reclaim_entry(struct xe_tile *tile,
> +				   struct xe_page_reclaim_list *prl,
> +				   u64 pte, struct xe_pt *xe_child)
> +{
> +	struct xe_guc_page_reclaim_entry *reclaim_entries = prl->entries;
> +	u64 phys_addr = pte & XE_PTE_ADDR_MASK;
> +	int num_entries = prl->num_entries;
> +	u32 reclamation_size;
> +
> +	xe_tile_assert(tile, xe_child->level <= MAX_HUGEPTE_LEVEL);
> +	xe_tile_assert(tile, reclaim_entries);
> +	xe_tile_assert(tile, num_entries < XE_PAGE_RECLAIM_MAX_ENTRIES - 1);
> +
> +	if (num_entries == XE_PAGE_RECLAIM_INVALID_LIST)
> +		return;
> +
> +	/**
> +	 * reclamation_size indicates the size of the page to be
> +	 * invalidated and flushed from non-coherent cache.
> +	 * Page size is computed as 2^(reclamation_size + XE_PTE_SHIFT) bytes.
> +	 * Only 4K, 64K (level 0), and 2M pages are supported by hardware for page reclaim
> +	 */
> +	if (xe_child->level == 0 && !(pte & XE_PTE_PS64))
> +		reclamation_size = COMPUTE_RECLAIM_ADDRESS_MASK(SZ_4K);  /* reclamation_size = 0 */
> +	else if (xe_child->level == 0)
> +		reclamation_size = COMPUTE_RECLAIM_ADDRESS_MASK(SZ_64K); /* reclamation_size = 4 */
> +	else if (is_2m_pte(xe_child))
> +		reclamation_size = COMPUTE_RECLAIM_ADDRESS_MASK(SZ_2M);  /* reclamation_size = 9 */
> +	else {
> +		prl->num_entries = XE_PAGE_RECLAIM_INVALID_LIST;
> +		return;
> +	}
> +
> +	reclaim_entries[num_entries].dw0 =
> +		FIELD_PREP(XE_PAGE_RECLAIM_VALID, 1) |
> +		FIELD_PREP(XE_PAGE_RECLAIM_SIZE, reclamation_size) |
> +		FIELD_PREP(XE_PAGE_RECLAIM_ADDR_LO, (u32)(phys_addr & 0xFFFFF));
> +	reclaim_entries[num_entries].dw1 =
> +		FIELD_PREP(XE_PAGE_RECLAIM_ADDR_HI, (u32)((phys_addr >> 20) & 0xFFFFF));

The phys_addr math looks off wrt to shifting. I think in the first case
you'd want shift phys_addr by 12 first and 32 in second.

Can you make xe_guc_page_reclaim_entry a qw and just do...

reclaim_entries[num_entries].qw = phys_addr |
	FIELD_PREP(XE_PAGE_RECLAIM_VALID, 1) |
	FIELD_PREP(XE_PAGE_RECLAIM_SIZE, reclamation_size);

> +	prl->num_entries++;
> +}
> +
>  static int xe_pt_stage_unbind_entry(struct xe_ptw *parent, pgoff_t offset,
>  				    unsigned int level, u64 addr, u64 next,
>  				    struct xe_ptw **child,
> @@ -1579,11 +1638,39 @@ static int xe_pt_stage_unbind_entry(struct xe_ptw *parent, pgoff_t offset,
>  				    struct xe_pt_walk *walk)
>  {
>  	struct xe_pt *xe_child = container_of(*child, typeof(*xe_child), base);
> +	struct xe_pt_stage_unbind_walk *xe_walk =
> +		container_of(walk, typeof(*xe_walk), base);
> +	struct xe_device *xe = tile_to_xe(xe_walk->tile);
>  
>  	XE_WARN_ON(!*child);
>  	XE_WARN_ON(!level);
> +	/* Check for leaf node */
> +	if (xe_walk->prl && xe_walk->prl->num_entries != XE_PAGE_RECLAIM_INVALID_LIST &&
> +	    !xe_child->base.children) {
> +		struct iosys_map *leaf_map = &xe_child->bo->vmap;
> +		pgoff_t first = xe_pt_offset(addr, 0, walk);
> +		pgoff_t count = xe_pt_num_entries(addr, next, 0, walk);
> +
> +		for (pgoff_t i = 0; i < count; i++) {
> +			u64 pte = xe_map_rd(xe, leaf_map, (first + i) * sizeof(u64), u64);
> +
> +			/* Account for NULL terminated entry on end (-1) */
> +			if (xe_walk->prl->num_entries < XE_PAGE_RECLAIM_MAX_ENTRIES - 1) {
> +				generate_reclaim_entry(xe_walk->tile, xe_walk->prl,
> +						       pte, xe_child);
> +			} else {
> +				/* overflow, mark as invalid */
> +				xe_walk->prl->num_entries = XE_PAGE_RECLAIM_INVALID_LIST;
> +				break;
> +			}
> +		}
> +	}
>  
> -	xe_pt_check_kill(addr, next, level - 1, xe_child, action, walk);
> +	/* If aborting page walk early, invalidate PRL since PTE may be dropped from this abort */
> +	if (xe_pt_check_kill(addr, next, level - 1, xe_child, action, walk) &&
> +	    level > 1 && xe_child->base.children && xe_child->num_live != 0) {
> +		xe_walk->prl->num_entries = XE_PAGE_RECLAIM_INVALID_LIST;
> +	}
>  

I think everything in this function is right but it really hard to
reason with absolutely certainly without running some tests where we
know the type of memory being allocated / free (e.g., 1 GB pages, things
getting pruned out at the root, 2M pages + 4k pages, etc...) and then
look at some debug outputs from the kernel to make it is doing what we
think it should doing.

Can you put in some vm_dbg messages in this function and maybe
generate_reclaim_entry which show PRL entries being added and cases
where it gets invalidated? vm_dbg usually compiles out so if is verbose
not a huge deal.

Matt

>  	return 0;
>  }
> @@ -1654,6 +1741,8 @@ static unsigned int xe_pt_stage_unbind(struct xe_tile *tile,
>  {
>  	u64 start = range ? xe_svm_range_start(range) : xe_vma_start(vma);
>  	u64 end = range ? xe_svm_range_end(range) : xe_vma_end(vma);
> +	struct xe_vm_pgtable_update_op *pt_update_op =
> +		container_of(entries, struct xe_vm_pgtable_update_op, entries[0]);
>  	struct xe_pt_stage_unbind_walk xe_walk = {
>  		.base = {
>  			.ops = &xe_pt_stage_unbind_ops,
> @@ -1665,6 +1754,7 @@ static unsigned int xe_pt_stage_unbind(struct xe_tile *tile,
>  		.modified_start = start,
>  		.modified_end = end,
>  		.wupd.entries = entries,
> +		.prl = pt_update_op->prl,
>  	};
>  	struct xe_pt *pt = vm->pt_root[tile->id];
>  
> @@ -1897,6 +1987,7 @@ static int unbind_op_prepare(struct xe_tile *tile,
>  			     struct xe_vm_pgtable_update_ops *pt_update_ops,
>  			     struct xe_vma *vma)
>  {
> +	struct xe_device *xe = tile_to_xe(tile);
>  	u32 current_op = pt_update_ops->current_op;
>  	struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->ops[current_op];
>  	int err;
> @@ -1914,6 +2005,11 @@ static int unbind_op_prepare(struct xe_tile *tile,
>  	pt_op->vma = vma;
>  	pt_op->bind = false;
>  	pt_op->rebind = false;
> +	/* Maintain one PRL located in pt_update_ops that all others in unbind op reference */
> +	if (xe->info.has_page_reclaim_hw_assist && !pt_update_ops->prl.entries)
> +		xe_page_reclaim_list_alloc_entries(&pt_update_ops->prl);
> +
> +	pt_op->prl = (pt_update_ops->prl.entries) ? &pt_update_ops->prl : NULL;
>  
>  	err = vma_reserve_fences(tile_to_xe(tile), vma);
>  	if (err)
> @@ -1921,6 +2017,13 @@ static int unbind_op_prepare(struct xe_tile *tile,
>  
>  	pt_op->num_entries = xe_pt_stage_unbind(tile, xe_vma_vm(vma),
>  						vma, NULL, pt_op->entries);
> +	/* Free PRL if list declared as invalid */
> +	if (pt_update_ops->prl.entries &&
> +	    pt_update_ops->prl.num_entries == XE_PAGE_RECLAIM_INVALID_LIST) {
> +		xe_page_reclaim_entries_put(pt_update_ops->prl.entries);
> +		xe_page_reclaim_list_invalidate(&pt_update_ops->prl);
> +		pt_op->prl = NULL;
> +	}
>  
>  	xe_vm_dbg_print_entries(tile_to_xe(tile), pt_op->entries,
>  				pt_op->num_entries, false);
> @@ -1979,6 +2082,7 @@ static int unbind_range_prepare(struct xe_vm *vm,
>  	pt_op->vma = XE_INVALID_VMA;
>  	pt_op->bind = false;
>  	pt_op->rebind = false;
> +	pt_op->prl = NULL;
>  
>  	pt_op->num_entries = xe_pt_stage_unbind(tile, vm, NULL, range,
>  						pt_op->entries);
> @@ -2096,6 +2200,7 @@ xe_pt_update_ops_init(struct xe_vm_pgtable_update_ops *pt_update_ops)
>  	init_llist_head(&pt_update_ops->deferred);
>  	pt_update_ops->start = ~0x0ull;
>  	pt_update_ops->last = 0x0ull;
> +	xe_page_reclaim_list_init(&pt_update_ops->prl);
>  }
>  
>  /**
> @@ -2518,6 +2623,11 @@ void xe_pt_update_ops_fini(struct xe_tile *tile, struct xe_vma_ops *vops)
>  		&vops->pt_update_ops[tile->id];
>  	int i;
>  
> +	if (pt_update_ops->prl.entries) {
> +		xe_page_reclaim_entries_put(pt_update_ops->prl.entries);
> +		xe_page_reclaim_list_invalidate(&pt_update_ops->prl);
> +	}
> +
>  	lockdep_assert_held(&vops->vm->lock);
>  	xe_vm_assert_held(vops->vm);
>  
> diff --git a/drivers/gpu/drm/xe/xe_pt_types.h b/drivers/gpu/drm/xe/xe_pt_types.h
> index 881f01e14db8..88fabf8e2655 100644
> --- a/drivers/gpu/drm/xe/xe_pt_types.h
> +++ b/drivers/gpu/drm/xe/xe_pt_types.h
> @@ -8,6 +8,7 @@
>  
>  #include <linux/types.h>
>  
> +#include "xe_page_reclaim.h"
>  #include "xe_pt_walk.h"
>  
>  struct xe_bo;
> @@ -79,6 +80,8 @@ struct xe_vm_pgtable_update_op {
>  	struct xe_vm_pgtable_update entries[XE_VM_MAX_LEVEL * 2 + 1];
>  	/** @vma: VMA for operation, operation not valid if NULL */
>  	struct xe_vma *vma;
> +	/** @prl: Backing pointer to page reclaim list of pt_update_ops */
> +	struct xe_page_reclaim_list *prl;
>  	/** @num_entries: number of entries for this update operation */
>  	u32 num_entries;
>  	/** @bind: is a bind */
> @@ -95,6 +98,8 @@ struct xe_vm_pgtable_update_ops {
>  	struct llist_head deferred;
>  	/** @q: exec queue for PT operations */
>  	struct xe_exec_queue *q;
> +	/** @prl: embedded page reclaim list */
> +	struct xe_page_reclaim_list prl;
>  	/** @start: start address of ops */
>  	u64 start;
>  	/** @last: last address of ops */
> -- 
> 2.52.0
> 
