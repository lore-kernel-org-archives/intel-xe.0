Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECE83CCA476
	for <intel-xe@archiver.kernel.org>; Tue,  7 Oct 2025 20:37:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98A3E10E386;
	Tue,  7 Oct 2025 20:37:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Noz+bIdE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DF7510E386
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Oct 2025 20:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759869432; x=1791405432;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=jSX3WX5D7tmHcBOTL7oaumOM3c7elbvDULQEqM7mSpA=;
 b=Noz+bIdEe/e+CYldsA1Fna6ZNyLFP7LVIjVN2XzSP6tPxR6+dtti2GYe
 OhslUIvLZNgR5zj5Bsxb2sdJwK/WzRLp0U2MLoa87Jnl0fn2BSfxazNPK
 gCPDiS+EYGzDwa3l/M80Zlohnu4TgBS0DdFawy7ipJBT1lDZ/GwahmSi9
 UB/VRP75SWxX8AQTjEo2j/SQLsVIUz6G6wKL7uuft5zz+LSSvZ3+jMvAw
 RwuezvpUSE0MYI+kVrfALntmLxUYlLbrjjTD9ZQLQRKw4sf7ZSK0R/09P
 BTgBu7+oDnIf2ORC7Yjb2p+NSG181M5KMRjDqopadeTjZMtGOJUBpBKe2 A==;
X-CSE-ConnectionGUID: bLfk+MXwR7OikD15yTCB8Q==
X-CSE-MsgGUID: +dandL3uSN+KwJ3dhoKAZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11575"; a="73484517"
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="73484517"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 13:37:11 -0700
X-CSE-ConnectionGUID: +Rdr3BVHRoK/S1BDdyCq2Q==
X-CSE-MsgGUID: GgZ+gfrQSoq+0O2VP0kMzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="179923173"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 13:37:11 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 7 Oct 2025 13:37:10 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 7 Oct 2025 13:37:10 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.45) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 7 Oct 2025 13:37:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LSF64QUOl2zpNXPQMYwfsSg/5PqKOCS69qeWCkcS6TcXCaEfD3Iqc3BC0qx+TImDfvRFyMOR9whQ19DQoIT/bLf+TA442r/yWZcGoITWtX4m1GfWRCAMxxNmbspNO9OvFGgr99hQou0oAbktJ9L0jkVtruO4oMjVsUR777TjZ2sfrPeXZk4EXP5ARG4/Aev/DnsjvlNR6yhhO+9u8tHzUtOF24H7CPjVqG9tLsuSeN1Lvb+dv/jF6kEnUoiC/lrFWfjkgPCWm1t3nTesfJ7nUp3WSd4Whhdbt2ndk2cgvqvBJRE6Vnh2LkLzf2ylPB1DCyLCzyNxW6SqvAa+DjDrUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xGWB6ApfCyXNXoZqxH3HOowj2TNeK64P8Ve9DqRpAzk=;
 b=ZMe2kox/LmrckNTKVTUUD1sdC4Zicg1yL8ycloOnhF17t6zqPJlzTaz0BXWXdQe3jWhCSjdBn/jm0u83qsfRxSJITmLKjrPDTqkmQ+YyO5VaJQzQdMhlcCPgJ3ctjVm6SGe7JgkvdovJJVvhzyskHr6agOdA1HTdsgwPKmqmWP4LPJIM/n0xzcxKnVCoSyDPbwJ2XOmsI76Qh60QIhdJePwAoCs+HF0PvYcZ+EmuK9O/E734F1lXwVltu7lj5n2uJJtKgMviihx4eiHpNQe293Sd63Fjs/61MEUqqeZitYShbBAJQf7LB7iAFEanUEM27AGZiMNstcJWbslOetF7+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA1PR11MB6735.namprd11.prod.outlook.com (2603:10b6:806:25e::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Tue, 7 Oct
 2025 20:37:01 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9182.017; Tue, 7 Oct 2025
 20:37:01 +0000
Date: Tue, 7 Oct 2025 15:36:55 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH v6 27/30] drm/xe/vf: Use primary GT ordered work queue on
 media GT on PTL VF
Message-ID: <ux3zete2u3t22wqzjugztc7ijkbgsgznrthfos7pyxczzklhos@256zc7fujlnf>
References: <20251006111038.2234860-1-matthew.brost@intel.com>
 <20251006111038.2234860-28-matthew.brost@intel.com>
 <t6aytzfw5frhua2ojrz3xyrobi25p424exjagpmovtvif5jwhw@ocmceysqldql>
 <aORH4NrjGSNcCxi/@lstrano-desk.jf.intel.com>
 <h4mwspqv5chueicgkrvd4grucstgev3vfkuavaeqbweqecvznc@wjpe5lk7tkr3>
 <aOVMXzdQCB1e7LoV@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aOVMXzdQCB1e7LoV@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: SJ0PR13CA0086.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::31) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA1PR11MB6735:EE_
X-MS-Office365-Filtering-Correlation-Id: d8be272c-8113-431d-2db4-08de05e14494
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VjVmcnIxR0U4M3RvQnpHNnpsZEcrdU9GQjNFN08zN29KeE8yS0VyZUdsUGF6?=
 =?utf-8?B?MER6SDh4SWFWbzRKVHlncERUemsxVFlkeStjN21iMlozcFdwV2I4QjFRakVn?=
 =?utf-8?B?VGhqVmRLRWV1MTIvUEd1OGRxdmxla1NNT0RHeTZKVnF1S0tuc0VBeGJ3a2hD?=
 =?utf-8?B?ZnhETTIzVTl1WDluS2ZCR0U3THU3KzV3YlgyY0JvanZvMkxxenFBKzVublNB?=
 =?utf-8?B?bm1mMHJ0M2lzNzh0LzI3L0x5TXlhcjdHRFo2TUUxUFZQUlM2azUxVHNucGkv?=
 =?utf-8?B?Lzd5ZktlRzdMUWFQaE5hV3hNSFdDU3Y1SlAzM2tNODVJdHJzVVRKNWRoVXNy?=
 =?utf-8?B?TGcwMlhwOTByZHhOTTlra0JvbWowRVJVM2JBQmdSOE5nVVVQTjc1MUlIRXpl?=
 =?utf-8?B?VGFSWC9ZelcycGM0VklETGJmRHh5NmoraFZKb0NxaEg4SmliNTNjek5nMThY?=
 =?utf-8?B?L2pmSllNaEZRYTc4TTJIZUVjR2NQSUw1WmxUWElLckkvdVRCN0Faam9udndr?=
 =?utf-8?B?Q1lpTUtYNUZPSXJBTmtPTE94SDNDVm9ST1c3b3lRZFA4Rm56c2NnYXpETGJQ?=
 =?utf-8?B?L1habEpxVTl0QXRKQUZSeVA5aE9ibktpN3FnOFlsVDAyYWtjOEJ6K1E3cWdQ?=
 =?utf-8?B?eXFDdURQejBRL1JjQlFndkJEejFEZlRPS0JscHY4eEhiTHZpalcyb2YzM2NU?=
 =?utf-8?B?Nmp3QS9BbGJTMGhXYzFJZ1ZDajVodUdvcjdXMUQ1TDk1OXNaK0dhdVBvUW1i?=
 =?utf-8?B?NGNHdmo3TFZhZyttdUY4U3lKT3NIVFJVT0NYaDdVcXZ3cEdhTzE3U21EbVho?=
 =?utf-8?B?VXQ3bWRVSmJsVG1EeTNseFV5eHVKTnAzaGVqMkxUQ0xwaTN3dmsxY0F2clZj?=
 =?utf-8?B?NWRmVlYvdUhqb0lXOWEvVWpISlpEMWJyTU9KSlg1cHpDTWdPcFUvZm1jZFVY?=
 =?utf-8?B?bFNRb0YwbDdsTGJUS3Q0VmN5dG1wMk80ZHN3MjZuTGFHMlJLZjJ2ZFFXeUlX?=
 =?utf-8?B?SXVPdVNnQWxLeExIM3ZiUmlGaFdYY0RXS1BtR21HMzZVV3dDT25iendPS3Q1?=
 =?utf-8?B?eThVUzhvSENndWRQOHZwYWJWOGdoVXFjdHZ2RWFVdVl5M0tBbkp5SFNiN0hs?=
 =?utf-8?B?WCtxZ25MS0F2ZktITlFSQWQrYnM4cVhtQUEzNm1oS0MzYUJLNkRHRXZSRjlC?=
 =?utf-8?B?NC9RVU9vdTBiVzVLL3ZGSHhnMk1QT1p2M0hkRWlPMEtVQVI2eXQ1bFUxL0NJ?=
 =?utf-8?B?b3liL1llY1pNTHVLNXV1d2RxeUNsSzc4eEZyWmRnbWhYZ2NveDBnWGlqSXZV?=
 =?utf-8?B?V3kvdm43ajIyVXdPcUNGbXJqNytZK29zV3lPWUJLOTVsVGtIa0F0cnFONlJL?=
 =?utf-8?B?TWVjU056dnNhNFpwTVhqNWFHTmJTanR4RUVsYnkvNXZocUdrNGNnWHFRelVx?=
 =?utf-8?B?SjZQVmgrcldnVVdQRjBvdjVjdWxLaFFFdGpYY3B0U3hReTRrZnNGSFcyZ0VF?=
 =?utf-8?B?MWJmUnFwQ1h5WWtxQ0UvQjVkQ1BvYW5tZmhrRWhLV0tRSjkxTjduY2JLbUVY?=
 =?utf-8?B?RHJGUDZLUVFVUUQ0WWkybzFSRjFocE9DUFROMG12aVMxS0RpZ3FTVnI0bVlY?=
 =?utf-8?B?djJ3UnBjWnhvVGM1aHVOdGNSVHE0NVo4SUJXUmowbDZSeUhvMXFtNTVXV1dy?=
 =?utf-8?B?TEtLNDdBTDc4R2tmVFNtNmhFRUdFOHV5ODB1QnhoU09vNGQwUVkvZGRQQ2J5?=
 =?utf-8?B?a3BPanhCZ2VjRGh5Zml2emphS3YrazZyVjN5SjQzY3AwMTdJUTk5Mk1rb0lK?=
 =?utf-8?B?RjZ5MFV3ckMySlI1NVF3RlVMNTJNV1J5cDlycFovZGFqWE5qSDF6WHd6aFJJ?=
 =?utf-8?B?cmw3WUd1azlRbDNma0psWHdPSTViejUvaFRnN3UwbzI5UVE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NUdpWWNjMUtXU0FTQis2czd2enBJNmxiN3ljdmNoV3VPdnVhQmEwam1CNHEv?=
 =?utf-8?B?WlZ2MEs3Sk54R2FIUitadWJzRCt4WElGWnZna0FwWGhKRGRYalBuTjErejJz?=
 =?utf-8?B?c1BiWkg4eDYxUzBLOUVHY2QyQnFOWWxvNnVKbHJSK2g4aDkwVGllUVFsRnFW?=
 =?utf-8?B?T3ZSMFc2SVVZSS9LSmpMTXVJdk1SZmpUejArSDJjczJMT2tGYWU5OWFDSFF5?=
 =?utf-8?B?NlJ5aGRLcE9jRWFCWG9LYzArblNqbGFoRWNTelloNFBrRGc4Q29WSklvTHUy?=
 =?utf-8?B?QmU3eDlla09JTy84ZWI4bFp3b0o4ZitCRGpqYjFnblR6RGNjeHRwN1hWeWFW?=
 =?utf-8?B?cUNrZE14b0pGaTdXai9pRGRVbnVSMXFXKzJyN1E1RWNXNndlMTkyTXZ4NUpj?=
 =?utf-8?B?cmdIWndCd2NnOFVMaE1ieTZKbks0cWI5QU8zN21BZW9nZUJKMXhranhjaStm?=
 =?utf-8?B?dWx4VU1JVGxtRUlKQkdOZVp2aVJOemNnOEF5Yk84MmNTSFhGK3dPMm5xREtN?=
 =?utf-8?B?TjRHb2JhcUI5SkVudVpqcFNSc3lIT3A5NVdUcnFtRGplcjN6ei8yWVROTmJ3?=
 =?utf-8?B?WldveGxYQTYvSGtvQW5teDM3b3lRLzdxUUMrcnNFTUtPTXh0N3ZjZU1TQ3BS?=
 =?utf-8?B?WjFvalFrRUVoU1R4ZGN0SXYvenB3akR1OS9jRkliU3hHNGo0aktQMW85blJL?=
 =?utf-8?B?eDVDR1VWODVZZ3o0a2FYYkYxcWdicFZidzcrd0Z1ZW9OYkRuOSswSVlvdlBa?=
 =?utf-8?B?aWpWUzExdTVSZSs0anYvS2ZQdHg0eVJjanJzMUVBRXZLMTlqVXA1djIvSDRG?=
 =?utf-8?B?OEpNbTFPOWtVTTFoNFI2TEgyVnlpZTNXdE00ZytldnE2S0R2OWpReXd0WGhI?=
 =?utf-8?B?NVV3bEVvakxBY3h5UmJLUUJVZlFRM2xVTWlGUnZ3aHRvSXdNNHhkc1Q0Y1lE?=
 =?utf-8?B?U2xGblhaMFBQVm9YVW9oS3FiRWI1am1MNk02c3FCVklHa1hjR21nN3dySVZ4?=
 =?utf-8?B?UVRjSDBtdDErbXVWU1Y3TEtHNllrOXF0UHBvUnl0NjRkellTSFFSQzRINlcy?=
 =?utf-8?B?UDJCT0tOVnVtUmhkZExxTy9IcU1KTHVrRE5jdy95TzZwdUR5a1JQZ08renZ5?=
 =?utf-8?B?SnB0SElrVnZzNW56MkNFcVJNTWxsTmtwaEtFdDN2NUdnVm12WkJHMkdrZEFZ?=
 =?utf-8?B?dXFkbENzMDg1WWtrM3lkTGlXRklMUll2SHRyT1NrR05HOXY2b3FmazJmRUN4?=
 =?utf-8?B?K2N5cE5GTUUzaVNSeUNya3dySW55VVZHQ1hXVkx4YXVENUwyeGlSYzkySjdV?=
 =?utf-8?B?aW9rdC9DRHYzTnZUVUp3a0xaWVhpY1BkYitLWm5tYVpwZC9iVXozUnFEdmJ4?=
 =?utf-8?B?U20rTm1OSEJTNHVTUy85dGxGZ2w2ZVNFc2h5a2xZb2RiSi8zVjBVYVhLcVJK?=
 =?utf-8?B?ajcxOWFwMmR1d1QzdnprdW1hMVo0SGJ5bE0yeGRqejhTNmVxRlJyMVN3dVBr?=
 =?utf-8?B?dXRZMzdKQnNFUzg0K2ZiTC9sVU9qdXVxR2NYOUI3VTdVdm5qdThJVlZCZGV5?=
 =?utf-8?B?andBU21RM0p3U0hrNkFwZVV5Rm9OakFncXA5dVFwMENtSlBxbk5Qc3M2dThF?=
 =?utf-8?B?NWhySlFMaTYrZWR3NzYxSkVKSGxkdFVBcHNpZ1JXazNEbGVFNFRRWUdJaXk3?=
 =?utf-8?B?WmJZQy9EU2FmVmlpR2RFWlA5RGJaVWpJZGhkWGpaWkMzK1lvdzRRTHRHck9F?=
 =?utf-8?B?blNzYTM4a3ZoQUNGYStUZG1MdW5IRWoxemxpMHRvelNlRDQ0MDRSM0JSYUpo?=
 =?utf-8?B?VitMbVQ5L1U3bXVpUlpZdDllSEFDU1VvbVpqM0tZaTUxbUphVUowdkxvdzJH?=
 =?utf-8?B?MGFqNk15M1hIak9KaFFqcklQWCtlbktIdXJWYlFFSDdzdk9qTHZ3Uy9BVjc1?=
 =?utf-8?B?T1hTcXpsbFhrRXVHWGJldlhxcys3Ujc3d3J1R01SNDVRRXgrZW5Gakl2d0d5?=
 =?utf-8?B?T0VYQmJXWEJmZUgvM0xaV1NnSUZjN3o1TE84WDFQRzlPdkJjQ2U0UlBFdlBC?=
 =?utf-8?B?OE53UXB3dmdzYk52VWZabEhNOUloSldTQmJIeTI0Y1lhRTlNdkx2eTVRRlNj?=
 =?utf-8?B?eUdvWWRsUmJueU1rVVp5cU90NEhUOFhENUllSnlQUGpXajhNSEMraFZuM04r?=
 =?utf-8?B?Q2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d8be272c-8113-431d-2db4-08de05e14494
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2025 20:37:01.3301 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UwWuRE1Nfl7G2XDcPh/ga88wGDgRypvpjX4SWK0B01nNzHKlM4f2LgkaGoXUd+CdAmkodI219AUCWSDTPD1vt+KOHamlLYQrPVRk/+ofXVA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6735
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

On Tue, Oct 07, 2025 at 10:22:39AM -0700, Matthew Brost wrote:
>On Tue, Oct 07, 2025 at 12:00:32PM -0500, Lucas De Marchi wrote:
>> On Mon, Oct 06, 2025 at 03:51:12PM -0700, Matthew Brost wrote:
>> > On Mon, Oct 06, 2025 at 05:24:55PM -0500, Lucas De Marchi wrote:
>> > > On Mon, Oct 06, 2025 at 04:10:35AM -0700, Matthew Brost wrote:
>> > > > VF CCS restore is a primary GT operation on which the media GT depends.
>> > > > Therefore, it doesn't make much sense to run these operations in
>> > >
>> > > I'd need to double check the previous patches to see the entire
>> > > picture, but this seems weird at a first glance. The VF CCS restore is
>> > > not the single work we queue in gt->ordered_wq.  To me it seems more
>> > > like "in what ordered queue we are going to queue the VF CCS restore. If
>> > > it's global per device, why are we not using the device wq rather than
>> > > making all the GT wq point to the same thing?
>> > >
>> >
>> > This is where things get convoluted. Four mechanisms manipulate the
>> > scheduling state by starting or stopping the DRM scheduler:
>> >
>> > - Job timeouts
>> > - GT resets
>> > - VF restore
>> > - PM resume
>> >
>> > All of these paths require mutual exclusion, or the scheduler design
>> > breaks.
>> >
>> > The first three ensure ordering by scheduling on the same ordered work
>> > queue (GT-ordered WQ). The last one is guaranteed by holding PM
>> > references in all the right places.
>> >
>> > Another issue is that the first three items are all in the reclaim path
>> > — the GT-ordered work queue is designed to handle this.
>> >
>> > This patch [1] explains the entire scheduler design in detail.
>> >
>> > Only PTL has the cross-VF/GT restore ordering requirement, so I figured
>> > the path of least resistance is to just point all GTs to the primary
>> > work queue.
>> >
>> > [1] https://patchwork.freedesktop.org/patch/677980/?series=154627&rev=4
>> >
>> > > > parallel. To address this, point the media GT's ordered work queue to
>> > > > the primary GT's ordered work queue on platforms that require (PTL VFs)
>> > > > CCS restore as part of VF post-migration recovery.
>> > > >
>> > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>> > > > ---
>> > > > drivers/gpu/drm/xe/xe_device_types.h | 2 ++
>> > > > drivers/gpu/drm/xe/xe_gt.c           | 7 +++++--
>> > > > drivers/gpu/drm/xe/xe_gt.h           | 2 +-
>> > > > drivers/gpu/drm/xe/xe_pci.c          | 6 +++++-
>> > > > drivers/gpu/drm/xe/xe_pci_types.h    | 1 +
>> > > > drivers/gpu/drm/xe/xe_tile.c         | 2 +-
>> > > > 6 files changed, 15 insertions(+), 5 deletions(-)
>> > > >
>> > > > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>> > > > index c66523bf4bf0..02c04ad7296e 100644
>> > > > --- a/drivers/gpu/drm/xe/xe_device_types.h
>> > > > +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> > > > @@ -334,6 +334,8 @@ struct xe_device {
>> > > > 		u8 skip_mtcfg:1;
>> > > > 		/** @info.skip_pcode: skip access to PCODE uC */
>> > > > 		u8 skip_pcode:1;
>> > > > +		/** @info.needs_shared_vf_gt_wq: needs shared GT WQ on VF */
>> > > > +		u8 needs_shared_vf_gt_wq:1;
>> > > > 	} info;
>> > > >
>> > > > 	/** @wa_active: keep track of active workarounds */
>> > > > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> > > > index cf484a2da35e..05465f358c96 100644
>> > > > --- a/drivers/gpu/drm/xe/xe_gt.c
>> > > > +++ b/drivers/gpu/drm/xe/xe_gt.c
>> > > > @@ -65,7 +65,7 @@
>> > > > #include "xe_wa.h"
>> > > > #include "xe_wopcm.h"
>> > > >
>> > > > -struct xe_gt *xe_gt_alloc(struct xe_tile *tile)
>> > > > +struct xe_gt *xe_gt_alloc(struct xe_tile *tile, bool use_primary_wq)
>> > >
>> > > If using the device wq is not an option (possibly because it would queue
>> > > with other undesired work going on there), then I'd rather drop this
>> > > bool passing here and make the decision inside this function:
>> > >
>> > > > {
>> > > > 	struct drm_device *drm = &tile_to_xe(tile)->drm;
>> > > > 	struct xe_gt *gt;
>> > > > @@ -75,7 +75,10 @@ struct xe_gt *xe_gt_alloc(struct xe_tile *tile)
>> > > > 		return ERR_PTR(-ENOMEM);
>> > > >
>> > > > 	gt->tile = tile;
>> > >
>> > > 	if (!xe->info.needs_shared_gt_wq || !tile->primary_gt->ordered_wq)
>> > > 		ordered_wq = drmm_alloc_ordered_workqueue(drm, "gt-ordered-wq", WQ_MEM_RECLAIM);
>> > > 	else
>> > > 		ordered_wq = tile->primary_gt->ordered_wq;
>> > > 	if (IS_ERR_OR_NUL(ordered_wq))
>> > >  		return ordered_wq ? ERR_CAST(gt->ordered_wq) : ERR_PTR(-EINVAL);
>> > >
>> > > 	gt->ordered_wq = ordered_wq;
>> > > 	
>> > > ... or something like that so you use the xe info to decide it here
>> > > rather than passing it down as a function arg.
>> > >
>> >
>> > Sure can refactor this as you suggest.
>>
>>
>> another option that would avoid a bool arg would be to actually pass the
>> wq from the caller.
>>
>> 	wq = NULL;
>>
>> 	if (xe->info.needs_shared_gt_wq)
>> 		wq = tile->primary_gt->ordered_wq;
>>
>> 	xe_gt_alloc(tile, wq);
>>

>I posted a v7/v8 which did it like you suggest.

good, will take a look

>
>> >
>> > >
>> > > > -	gt->ordered_wq = drmm_alloc_ordered_workqueue(drm, "gt-ordered-wq", WQ_MEM_RECLAIM);
>> > > > +	if (use_primary_wq)
>> > > > +		gt->ordered_wq = tile->primary_gt->ordered_wq;
>> > > > +	else
>> > > > +		gt->ordered_wq = drmm_alloc_ordered_workqueue(drm, "gt-ordered-wq", WQ_MEM_RECLAIM);
>> > > > 	if (IS_ERR(gt->ordered_wq))
>> > > > 		return ERR_CAST(gt->ordered_wq);
>> > > >
>> > > > diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
>> > > > index 5df2ffe3ff83..9545c0c93ab6 100644
>> > > > --- a/drivers/gpu/drm/xe/xe_gt.h
>> > > > +++ b/drivers/gpu/drm/xe/xe_gt.h
>> > > > @@ -28,7 +28,7 @@ static inline bool xe_fault_inject_gt_reset(void)
>> > > > 	return IS_ENABLED(CONFIG_DEBUG_FS) && should_fail(&gt_reset_failure, 1);
>> > > > }
>> > > >
>> > > > -struct xe_gt *xe_gt_alloc(struct xe_tile *tile);
>> > > > +struct xe_gt *xe_gt_alloc(struct xe_tile *tile, bool use_primary_wq);
>> > > > int xe_gt_init_early(struct xe_gt *gt);
>> > > > int xe_gt_init(struct xe_gt *gt);
>> > > > void xe_gt_mmio_init(struct xe_gt *gt);
>> > > > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>> > > > index 3f42b91efa28..25a1d96a68e7 100644
>> > > > --- a/drivers/gpu/drm/xe/xe_pci.c
>> > > > +++ b/drivers/gpu/drm/xe/xe_pci.c
>> > > > @@ -347,6 +347,7 @@ static const struct xe_device_desc ptl_desc = {
>> > > > 	.has_sriov = true,
>> > > > 	.max_gt_per_tile = 2,
>> > > > 	.needs_scratch = true,
>> > > > +	.needs_shared_vf_gt_wq = true,
>> > >
>> > > as per above... I think this needs to be detached from vf. There may be
>> > > other reasons the wq needs to be shared.
>> > >
>> >
>> > I’d prefer to share the work queue only when absolutely necessary — such
>> > as when PTL is on a VF and migration is supported.
>>
>>
>> I missed that you left the VF condition out as an && for the allocation:
>>
>
>Yes.
>
>> > > > +                                       xe->info.needs_shared_vf_gt_wq &&
>> > > > +                                       IS_SRIOV_VF(xe));
>>
>> IMO a better way would be to call it `needs_shared_gt_wq` and then
>> override the condition in the vf-specific function:
>>
>> sriov_update_device_info()
>>
>
>I'm trying to follow this one.
>
>This a platform (static) and VF (dynamic) condition combination.
>
>Are you suggesting removing platform information from xe_pci.c and just
>have info bit in the device which the sriov code sets? I think we'd need
>a platform check then in the sriov code which I thought in general we
>want to avoid inline platform checks.

yeah, true... for that to be done without hardcoding the vf it would be
more verbose and there isn't much need if the VF is the only expected
one.


>
>Maybe I'm misunderstanding here.
>
>Matt
>
>> Lucas De Marchi
>>
>> >
>> > > If we just make them point to a device wq as suggested above, then
>> > > there's no extra issue with the ongoing work to disable GTs that Matt
>> > > Roper is doing (https://patchwork.freedesktop.org/series/154739/).
>> > > Otherwise we will need to think on how to reconciliate them.
>> > >
>> >
>> > I don’t see how it would ever be possible to disable the primary GT and
>> > still do anything meaningful. You can’t allocate memory (e.g., for
>> > clears), perform VM binds, or handle page faults without a copy engine.

it's actually useful for platform bringup as we can enable the
individual pieces in parallel. We know what should and shouldn't
work and workloads we can execute in this case.

Lucas De Marchi

>> >
>> > Matt
>> >
>> > > Lucas De Marchi
>> > >
>> > > > };
>> > > >
>> > > > #undef PLATFORM
>> > > > @@ -598,6 +599,7 @@ static int xe_info_init_early(struct xe_device *xe,
>> > > > 	xe->info.skip_mtcfg = desc->skip_mtcfg;
>> > > > 	xe->info.skip_pcode = desc->skip_pcode;
>> > > > 	xe->info.needs_scratch = desc->needs_scratch;
>> > > > +	xe->info.needs_shared_vf_gt_wq = desc->needs_shared_vf_gt_wq;
>> > > >
>> > > > 	xe->info.probe_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
>> > > > 				 xe_modparam.probe_display &&
>> > > > @@ -766,7 +768,9 @@ static int xe_info_init(struct xe_device *xe,
>> > > > 		 * Allocate and setup media GT for platforms with standalone
>> > > > 		 * media.
>> > > > 		 */
>> > > > -		tile->media_gt = xe_gt_alloc(tile);
>> > > > +		tile->media_gt = xe_gt_alloc(tile,
>> > > > +					     xe->info.needs_shared_vf_gt_wq &&
>> > > > +					     IS_SRIOV_VF(xe));
>> > > > 		if (IS_ERR(tile->media_gt))
>> > > > 			return PTR_ERR(tile->media_gt);
>> > > >
>> > > > diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
>> > > > index 9b9766a3baa3..b11bf6abda5b 100644
>> > > > --- a/drivers/gpu/drm/xe/xe_pci_types.h
>> > > > +++ b/drivers/gpu/drm/xe/xe_pci_types.h
>> > > > @@ -48,6 +48,7 @@ struct xe_device_desc {
>> > > > 	u8 skip_guc_pc:1;
>> > > > 	u8 skip_mtcfg:1;
>> > > > 	u8 skip_pcode:1;
>> > > > +	u8 needs_shared_vf_gt_wq:1;
>> > > > };
>> > > >
>> > > > struct xe_graphics_desc {
>> > > > diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
>> > > > index 6edb5062c1da..e9bcff2de563 100644
>> > > > --- a/drivers/gpu/drm/xe/xe_tile.c
>> > > > +++ b/drivers/gpu/drm/xe/xe_tile.c
>> > > > @@ -157,7 +157,7 @@ int xe_tile_init_early(struct xe_tile *tile, struct xe_device *xe, u8 id)
>> > > > 	if (err)
>> > > > 		return err;
>> > > >
>> > > > -	tile->primary_gt = xe_gt_alloc(tile);
>> > > > +	tile->primary_gt = xe_gt_alloc(tile, false);
>> > > > 	if (IS_ERR(tile->primary_gt))
>> > > > 		return PTR_ERR(tile->primary_gt);
>> > > >
>> > > > --
>> > > > 2.34.1
>> > > >
