Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00BE1CAC5B0
	for <intel-xe@archiver.kernel.org>; Fri,  3 Oct 2025 15:22:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A345B10E126;
	Fri,  3 Oct 2025 15:22:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XDyFpRUf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0392D10E126
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Oct 2025 15:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759504931; x=1791040931;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=dHr9fH01ZrrvxwJi4LVgc9PC3Sh92eB/D2l6fRAYyQ4=;
 b=XDyFpRUfI4yILAUKQhdUF/jbxug3oDllzICGHl34FbaRcVbAyDQmH3fp
 oDqOCx1XMWLLWfjSQp6jKIAFleXMc6eeGCxhtLVtm+pcCdfmwSMiL+cGQ
 hfJxKZEzECiXYIqkQerQb6gpeXFu6Nm7qUTaBdMTwkN09J6R+ubAmG0K5
 QK+UBCrMO7nSNJ/0xWfO+XAq5noCrcukeH1gTV6WbmbgPUDw4JBgP5SpN
 9hJADN/6AonhfOgqjv42GmORJbrJyZx9tGWv0ySeZ4KCdHVFxOKriTgo9
 iav/PH70UVIb7fjKcPUAYZ/zmotUB2lrm8PTveuyBTpx/i//CLnRt0AsA w==;
X-CSE-ConnectionGUID: 3JPC3G/ZSYm7O/s8WS7Cvw==
X-CSE-MsgGUID: U8bM79zkTxehf9Xna0uSBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11571"; a="73141933"
X-IronPort-AV: E=Sophos;i="6.18,312,1751266800"; d="scan'208";a="73141933"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 08:22:10 -0700
X-CSE-ConnectionGUID: qCkVCWqNQrOiQoEyqDcpYA==
X-CSE-MsgGUID: ALgkywPiT8+FCvsQ+zp3OQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,312,1751266800"; d="scan'208";a="178438716"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 08:22:10 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 3 Oct 2025 08:22:09 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 3 Oct 2025 08:22:09 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.10) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 3 Oct 2025 08:22:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cRUxINTGxxk0VH10AC6DqQOgiljW4D5cl/uo+6tAuLd4W8StH4yzvMY4zMuj3dRKFoqy9iKPnnxFPrm6TI72S5brIuvcNc/d+GQTan9NHO4rcG+18cF+4hTxKdyWmRz+PJrTrNcciZiezBL3ZFr19qF1D5ZEFZtVD0FHoQPYLs6e8uvHrWgyVd5oyeWOLKqgPCYwluECeh9D6Tk68EycyDTjc+a7PWSFHE5PasqvrimuqJoC1o1ao0S7i6kGzCNQZhpQuW5i+Xon2zUeONT1rP5/U+WMt5IFnp3knoK6NTb6wEVflo0KgEerh3K7FAzvqagZyH/f1XhPcpii3pE93Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eedesg8BQubt58XqbBLcHJGECc3XTyH/akRpNzJzRq0=;
 b=MLGigIJQ/EJp9eNC9I42y566JH/6QhIATyO9TiDe3jHrrvEe7WZ3TsAoHPsLQ6LzNyBvAmi884vQoyUDYQFp6fA7l1qet4pDyaQgbyoDrmhqlP6l0+XNDyed5CF+Zfub/9b0h8c9prynbHaL3RVMR+3JTz0wuNIvC3AeybgeUfRDPoLPi9HoeCNQ1F4HTT2R7a7GbCQRPxDq924rTYUkvsdDTbQC2Nz7l0IeJZjnM0JoAZeAlc1owT/n4Q+phgB/c8VYFVi7Uopx+z8d2NKiz+7IGtYduzMwlu9g8Iub2XpUQsESiM4w0Agrw3y7ZGPinV+IgsxvUVwPzO4gPnvnIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by SA1PR11MB8837.namprd11.prod.outlook.com (2603:10b6:806:468::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.16; Fri, 3 Oct
 2025 15:22:03 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.9182.015; Fri, 3 Oct 2025
 15:22:02 +0000
Date: Fri, 3 Oct 2025 17:21:59 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v4 1/5] drm/xe: Add initial support for separate kernel
 VRAM region on the tile
Message-ID: <20251003152159.lb5huif3f4vcwrrg@intel.com>
References: <20250922170707.1556781-1-piotr.piorkowski@intel.com>
 <20250922170707.1556781-2-piotr.piorkowski@intel.com>
 <38196129-26e3-46c1-aa5d-1a5cee11ccd9@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <38196129-26e3-46c1-aa5d-1a5cee11ccd9@intel.com>
X-ClientProxiedBy: DUZPR01CA0067.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c2::6) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|SA1PR11MB8837:EE_
X-MS-Office365-Filtering-Correlation-Id: 1dcc0f76-fc39-444c-8545-08de02909a6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Si9qTktsYUhpUXN0bmhmK2ttb2RtdjZZM0VLLzZzSEJXcmVtMzYxWFBiOUdG?=
 =?utf-8?B?OVZVTzBSUUxxUTJ4WWt6RmJyU0VrR2dWOWNmVjRXKzVQUlBzY052TmJ4MGRj?=
 =?utf-8?B?UmNEK3dSaGtBQ3dtRWh1aHJYOVFnS0czeFBwaE1WNkpPdTM0TjYraFZwbUpx?=
 =?utf-8?B?aUtKejBvU0tjKzJQeXBuQjBIWkg2dDB6WWJFUGs2QXVKblUyNVpIVDdWYWZu?=
 =?utf-8?B?QmZoVnZJNFVTdHIwcVBtVlJFVnZHcFdsK2ZwVkFmRUdWWDRacXpiSVA5ODFH?=
 =?utf-8?B?bkprWW1VWWZrdlZQRmw3MjN6ajlIQVBBSFovQXYyL0NHbEtCNlR4M3VFZS92?=
 =?utf-8?B?cG9tTVN4RzdJbjRkMzNOTGlLUzRlTWNDT0dXODVncjVDMW1ta1ZNMmlheGY2?=
 =?utf-8?B?Sys1MnllTkJyUEFnTXAxT3RuYkVLNGNLeHd1SVZWQ1R4alZLQThaQ0NhRGRR?=
 =?utf-8?B?bmV0RUJ2Zlo0NVhqWDUwK1ZGbXZhOFVPbmVyK2cvR2NOMUxYWVlENS9UWWlw?=
 =?utf-8?B?UHpvVDZpTkhJKzJqV3diVkhjVWUxSGlSeGJVcWRWaGMyWElUTitxWE1QYWVV?=
 =?utf-8?B?cDBnSFpRUWhiT2g4RUkwZ2ppZWZaTWxFWEYvcmxEUEU2MWIyTjAvTkNCbW9j?=
 =?utf-8?B?V0Fta2x3WjEzMFVoY1U5WVI5RU52YmtnUDFTMGxLMzVoY29EYnlyek83UTNZ?=
 =?utf-8?B?dlFmbDVzanlaSFpmOWZTRDhBRnRCN2JrY0l4OS9UajVYR2lDclkrSE90M0J5?=
 =?utf-8?B?SjBCN2JNcFhqOW1RREVhM3crZzdwTUdFUWF4RitremlPREdUcDBOVUhQaENK?=
 =?utf-8?B?ZmhzaXljUldwVk0vSDlYZ1pYaTdITGNwaUQyUlNJYkNHMU03WnYycHhZTTBG?=
 =?utf-8?B?Y2lrUXZZNktGRElJdGVJLzdCVEl2M09rTitXaURaKzZLZHR5RHRFV2p2WDBJ?=
 =?utf-8?B?bS9xRGRPc2ZyWkJoVWtQblNzaExrbkpMQWU2VURvK01Bcmt4ak5YS2k1emp0?=
 =?utf-8?B?ODRVS2g2M2o0bDdpL3JIUzhYa0R2a0swV2RJaUdFSUkvQjN4cG9mN0NNYnlu?=
 =?utf-8?B?TWJEK1ltVXJyVFVaRFVOZGtta2NrbHh2bERTaUdzWnM3OWh0Y2luQ2FtbU1u?=
 =?utf-8?B?cHlDMXFIeVJNOE55ODlMei93SFZ2NkdqSDRQRENqRFU5bWE2bGNra01xNUd4?=
 =?utf-8?B?T2xBRXNXelR6dk95aXNTVWpTVGdrbkxYQmpvOGRlRUdjVFdvSUVMVlZsY3Jx?=
 =?utf-8?B?MGlmblBYNXRYTmc5UVhjV1MwTUcrRVdrMnRzZ0MvYXBMOXlwR0EzNC9TVmpj?=
 =?utf-8?B?L1FEMmdtZUw3a3BldjY3aHc4cVpKdHovWm80VGx5Vm5CaEQrcWdlTEJZQzE5?=
 =?utf-8?B?UTAxTUpZNk5MN2pxZnpOdWZSVEQ3cndnbjFSQXZEK0xXak1SWG9SRktvTHpP?=
 =?utf-8?B?c2JqVlZjTm94bU1wOUw2Um9VakN4N3h6bkFFdWlNN2F6N0ZEK2g3TkYyVWFC?=
 =?utf-8?B?M2RJUUVNTlJ4NzdpUnMvd0Fwa3dlYzRZRDdlak84VW9KSGR5MEtvVG10bnVp?=
 =?utf-8?B?cmVoVmMvV1FiL2VwZUdtSEVqTllNMExiSENiRkFZd0tHZ0NPSXkzdElRdW0w?=
 =?utf-8?B?eEQwVXBWRGF1OVJUMW0xcnBvVXNUT1Zua1pKV3hHMnJadFNUYWUxQ1Mxd1dt?=
 =?utf-8?B?Vzk4dVpGVTFPRmFwRTVCSlpMM1JkNm16MXBVY01NZkNWWUxscmtIc2U2Wm1S?=
 =?utf-8?B?dXUwdkVJUEJLRE0zY0FiYUQ1UFlEVVRNd0h6b0gwbjVVcHlxSWtkTE9ya1lG?=
 =?utf-8?B?Z3g4TzgrajNBTy9CNXNKZ04rYVNFZSs1YjhXOWdzUER5SkppOCtOdFRTVitv?=
 =?utf-8?B?MnlINUJ5bmhYUWVseTZiQ2xmaENmQUpybkt5c0tRckNMK2NhcWtWYndocHNK?=
 =?utf-8?Q?Bft+ZyEM0KoJyLe0XG5Lx0FrU5ZB9V4r?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TjcvKzR5U2s3UjE4YmM1TjFOdm9KVStkbkZzV1ZZcWZ3RHpBeGlVRTdXV3FB?=
 =?utf-8?B?M0lpREdlVDl0c01rekxKV1dHYUJjT3J6TVEvZTJzeXFIV0lIZ3JnVTQrVmRP?=
 =?utf-8?B?QWd6a1lpb3NIeEdlUW9mWkdvWnpUNXRRelZoUTRSaTNWSkQvUnlldVMzS2lF?=
 =?utf-8?B?QkNsOWwxTWpHWC9KQ1F2TytJWVlGSHk2WUJJUHNFY09NQTRaSE5UWGZkT2Jk?=
 =?utf-8?B?S2R1VTBKWTR0Um41clhwT3hPNFBMaUhQR3FGTURHY3pIRzFmY0ZqVmx0bmp1?=
 =?utf-8?B?aXVqay9NVUVNQzRKbXRFRC9iWHU3aGhxNW5RaEQydjV2TzFoR1V5Zy9DeHE5?=
 =?utf-8?B?a0R3SkZoTHhKa3JHTGxtUzJxd1hYa3d1M1lKdStTTWJZaUlYTUV4YWphcW93?=
 =?utf-8?B?cnpOQ2duY3VOVWFZSmVTWEw3VVBvSXJqWnBjRldjYVMyNitBZ01oaFA5TGYw?=
 =?utf-8?B?S2RUNGNJS2l4TTk1cTZpZDhNMElsT3BFSGV3NC80MUVGc0RTVDZzanpQdnJ4?=
 =?utf-8?B?SXdNVGhwRzRJd1p5dkRnTVlUSzNJU3lxMk90LzZscEdpU3BJVklUVElHVUlu?=
 =?utf-8?B?RUwxOEwzcTVMdjV5ZXBzbjFOa1ZmWGluejlGTFRDcklOU2hGVmxXS3VqZ0N3?=
 =?utf-8?B?aEYrWFBVajRRc3BnalZWZ25yS0VNSmQ0b1ozbzhTTmVQd3hBdmZlbjNXNWlP?=
 =?utf-8?B?aDZVZDBOTmNCYm5TakZxQlpYR0JGeDB6clphQjdXTmZEVHhDcU5lbVkzOXdP?=
 =?utf-8?B?ZVIySUUyUVNzNHRGYVZWMXowNisvcVl6TjIwUVhyR3NOdktXZVhOU0drTXI3?=
 =?utf-8?B?U3RYb0dZSHZTcEtiZlUwTHNEdjlCVWhIM1gxSC9kRWlrNVVVU1AvRjE4WXRB?=
 =?utf-8?B?UjhxMENESFRhbm13Q3RybUNwWmhUQzlUL2V0dmd4RUxWNXkxdGVFempyR05E?=
 =?utf-8?B?Wk8rWVZWVE5jN3U2VndHM0RUcWJUM1Zoall3L1Y3dEprU3NJYm1DdnVUV2Nr?=
 =?utf-8?B?UndsYWRHRkdmYnZjemk0QnROTjRXQzNPSEI3d2R4M2c5Y3ovdlRwRWt4WE16?=
 =?utf-8?B?VWZ5VHloTjJ2OFlrTmh4bERaVDBsWElMa1dNVEJSUU96THByYTZHWlk1ZGtk?=
 =?utf-8?B?RTh2Q0ZmcWw1cEtRZy8yTUlqWmxnd0V2ZHZ3UXhyTmhpVitId1lpek00ZHNz?=
 =?utf-8?B?YWI4M3hqUFAxdzVkc0k2ZE85elhiMUlSNUY2SnBSQ3ZuVlA5NFRXSUVISGd4?=
 =?utf-8?B?VHc5UEtHcnUySnhnMHZOb1dhSk1aazUrZVNxYzY4YU1MMHRTbThleVViMjZ4?=
 =?utf-8?B?WGl0OGpYVXhnRmxZcXZiV1RDQ2JreWhPbVJuL3VZZ1p1RHJzVUV4V3FObVlS?=
 =?utf-8?B?Q0tqNGVrUmVibklMY1FTNzJncURTbFNOL0s2a1N2V2tGSG1BS1pvYytycXNp?=
 =?utf-8?B?OFFmL001TFNkUDdxb3J1REFqQkozb3ppMW5rOVdMdC9iUEszUzBRbGNEOExu?=
 =?utf-8?B?OUEyUmthLzZTVjBONk83VlhaWjRSTHJJTnI3Sno5eXZjQ043WU5NMFRsUE1n?=
 =?utf-8?B?WDNrSVEvdGNOSjRIUkNIZFArT3NNK2QwQU4xejIvQVhIYjV6ZkRSc2NUd2xN?=
 =?utf-8?B?Q29zSnVQcXlYelVMQllNMHBiVEhRME9DcTYxajArZE9kMGxSazZ0cHhkUjZE?=
 =?utf-8?B?bHUyVHErRzEzZ3ErZ25xVXpHNWFYOUx1ZzRYSkExaWpFN09mVGx1OFNyUjZC?=
 =?utf-8?B?c1lCdjY0NThaQkthM0ZCZ3N3NkRlQTVhZlEwNkxEZGFiOTNzZW81b2daN01E?=
 =?utf-8?B?Ty9KM05sMUU0UDh6cHczMHZwc1E5K2JvRlhaaGw2OHlSTDliaWpHY2xDSGdv?=
 =?utf-8?B?SGR3MG4vOVB1L3BPQWZmRm1TdHFiR2xCbVFvQjR6MUxiSSthZ1FrRUFVRURl?=
 =?utf-8?B?eWFrMVlyajNLdC9ZenltQzNNT2JzbHhETDNUT3JXSE1qS1BSeVZEdzA3blY5?=
 =?utf-8?B?WGI0L1pxalJweFhyV1hLREUxbVp1KzFHZUhHMm5xdXM1M0JTa2xKQmU3K0ZN?=
 =?utf-8?B?S2pieFk3cjFNOXh5M0tqamVKbFVwcmdiNkZPTDhuYTdCRWsyU1hCK2FNY3BI?=
 =?utf-8?B?SWV6dHNJT0kvT1NXMis4UzBSdzZoSkd2dmN6SE1GWVlHUWZBTzZRME9OMy9I?=
 =?utf-8?B?S1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dcc0f76-fc39-444c-8545-08de02909a6d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2025 15:22:02.5843 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wP7aielTwO020SqUwu8M8qydHKbUxOfoGFlQ+0MpqYXDhvSynYfJqrvINuiB28moarhla8/uoeCUScNywz3KdwbdqOrZ4LeDNaDAN3MkuUg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8837
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

Matthew Auld <matthew.auld@intel.com> wrote on pią [2025-paź-03 12:15:39 +0100]:
> On 22/09/2025 18:07, Piórkowski, Piotr wrote:
> > From: Piotr Piórkowski <piotr.piorkowski@intel.com>
> > 
> > So far, kernel and userspace allocations have shared the same VRAM region.
> > However, in some scenarios, it may be necessary to reserve a separate
> > VRAM area exclusively for kernel allocations.
> > Let's add preliminary support for such a configuration.
> > 
> > v2:
> > - replaced for_each_bo_flag_vram with the improved
> >    for_each_set_bo_vram_flag helper (Matthew)
> > - moved the VRAM flag iteration macro definition into xe_bo.c (Matthew)
> > - drop unused bo_flgas from bo_vram_flags_to_vram_placement (Matthew)
> > - use hweight32 helper in __xe_bo_fixed_placement for readability
> >    (Matthew)
> > v3: remove unnecessary VRAM fixup id
> > 
> > Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> > Cc: Matthew Auld <matthew.auld@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_bo.c           | 78 +++++++++++++++++++---------
> >   drivers/gpu/drm/xe/xe_bo.h           |  2 +-
> >   drivers/gpu/drm/xe/xe_device_types.h | 10 +++-
> >   drivers/gpu/drm/xe/xe_tile.c         |  8 +++
> >   drivers/gpu/drm/xe/xe_tile.h         |  5 ++
> >   drivers/gpu/drm/xe/xe_vram.c         |  6 ++-
> >   6 files changed, 81 insertions(+), 28 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > index edc6e29f0cc1..0fe7ce1f15f3 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -34,6 +34,7 @@
> >   #include "xe_res_cursor.h"
> >   #include "xe_shrinker.h"
> >   #include "xe_sriov_vf_ccs.h"
> > +#include "xe_tile.h"
> >   #include "xe_trace_bo.h"
> >   #include "xe_ttm_stolen_mgr.h"
> >   #include "xe_vm.h"
> > @@ -81,6 +82,10 @@ static struct ttm_placement tt_placement = {
> >   	.placement = tt_placement_flags,
> >   };
> > +#define for_each_set_bo_vram_flag(bit__, bo_flags__) \
> > +	for (unsigned int __bit_tmp = BIT(0); __bit_tmp <= XE_BO_FLAG_VRAM_MASK; __bit_tmp <<= 1) \
> > +		for_each_if(((bit__) = __bit_tmp) & (bo_flags__) & XE_BO_FLAG_VRAM_MASK)
> > +
> >   bool mem_type_is_vram(u32 mem_type)
> >   {
> >   	return mem_type >= XE_PL_VRAM0 && mem_type != XE_PL_STOLEN;
> > @@ -213,6 +218,27 @@ static bool force_contiguous(u32 bo_flags)
> >   	       bo_flags & XE_BO_FLAG_PINNED;
> >   }
> > +static u8 vram_bo_flag_to_tile_id(struct xe_device *xe, u32 vram_bo_flag)
> > +{
> > +	xe_assert(xe, vram_bo_flag & XE_BO_FLAG_VRAM_MASK);
> > +	xe_assert(xe, (vram_bo_flag & (vram_bo_flag - 1)) == 0);
> > +
> > +	return __ffs(vram_bo_flag >> (__ffs(XE_BO_FLAG_VRAM0) - 1)) - 1;
> > +}
> > +
> > +static u32 bo_vram_flags_to_vram_placement(struct xe_device *xe, u32 vram_flag,
> > +					   enum ttm_bo_type type)
> > +{
> > +	u8 tile_id = vram_bo_flag_to_tile_id(xe, vram_flag);
> > +
> > +	xe_assert(xe, tile_id < xe->info.tile_count);
> > +
> > +	if (type == ttm_bo_type_kernel)
> > +		return xe->tiles[tile_id].mem.kernel_vram->placement;
> > +	else
> > +		return xe->tiles[tile_id].mem.vram->placement;
> > +}
> > +
> >   static void add_vram(struct xe_device *xe, struct xe_bo *bo,
> >   		     struct ttm_place *places, u32 bo_flags, u32 mem_type, u32 *c)
> >   {
> > @@ -245,12 +271,15 @@ static void add_vram(struct xe_device *xe, struct xe_bo *bo,
> >   }
> >   static void try_add_vram(struct xe_device *xe, struct xe_bo *bo,
> > -			 u32 bo_flags, u32 *c)
> > +			 u32 bo_flags, enum ttm_bo_type type, u32 *c)
> >   {
> > -	if (bo_flags & XE_BO_FLAG_VRAM0)
> > -		add_vram(xe, bo, bo->placements, bo_flags, XE_PL_VRAM0, c);
> > -	if (bo_flags & XE_BO_FLAG_VRAM1)
> > -		add_vram(xe, bo, bo->placements, bo_flags, XE_PL_VRAM1, c);
> > +	u32 vram_flag;
> > +
> > +	for_each_set_bo_vram_flag(vram_flag, bo_flags) {
> > +		u32 pl = bo_vram_flags_to_vram_placement(xe, vram_flag, type);
> > +
> > +		add_vram(xe, bo, bo->placements, bo_flags, pl, c);
> > +	}
> >   }
> >   static void try_add_stolen(struct xe_device *xe, struct xe_bo *bo,
> > @@ -269,11 +298,11 @@ static void try_add_stolen(struct xe_device *xe, struct xe_bo *bo,
> >   }
> >   static int __xe_bo_placement_for_flags(struct xe_device *xe, struct xe_bo *bo,
> > -				       u32 bo_flags)
> > +				       u32 bo_flags, enum ttm_bo_type type)
> >   {
> >   	u32 c = 0;
> > -	try_add_vram(xe, bo, bo_flags, &c);
> > +	try_add_vram(xe, bo, bo_flags, type, &c);
> >   	try_add_system(xe, bo, bo_flags, &c);
> >   	try_add_stolen(xe, bo, bo_flags, &c);
> > @@ -289,10 +318,10 @@ static int __xe_bo_placement_for_flags(struct xe_device *xe, struct xe_bo *bo,
> >   }
> >   int xe_bo_placement_for_flags(struct xe_device *xe, struct xe_bo *bo,
> > -			      u32 bo_flags)
> > +			      u32 bo_flags, enum ttm_bo_type type)
> >   {
> >   	xe_bo_assert_held(bo);
> > -	return __xe_bo_placement_for_flags(xe, bo, bo_flags);
> > +	return __xe_bo_placement_for_flags(xe, bo, bo_flags, type);
> >   }
> >   static void xe_evict_flags(struct ttm_buffer_object *tbo,
> > @@ -2152,7 +2181,7 @@ struct xe_bo *xe_bo_init_locked(struct xe_device *xe, struct xe_bo *bo,
> >   	xe_validation_assert_exec(xe, exec, &bo->ttm.base);
> >   	if (!(flags & XE_BO_FLAG_FIXED_PLACEMENT)) {
> > -		err = __xe_bo_placement_for_flags(xe, bo, bo->flags);
> > +		err = __xe_bo_placement_for_flags(xe, bo, bo->flags, type);
> >   		if (WARN_ON(err)) {
> >   			xe_ttm_bo_destroy(&bo->ttm);
> >   			return ERR_PTR(err);
> > @@ -2210,34 +2239,33 @@ struct xe_bo *xe_bo_init_locked(struct xe_device *xe, struct xe_bo *bo,
> >   }
> >   static int __xe_bo_fixed_placement(struct xe_device *xe,
> > -				   struct xe_bo *bo,
> > +				   struct xe_bo *bo, enum ttm_bo_type type,
> >   				   u32 flags,
> >   				   u64 start, u64 end, u64 size)
> >   {
> >   	struct ttm_place *place = bo->placements;
> > +	u32 vram_flag, vram_stolen_flags;
> >   	if (flags & (XE_BO_FLAG_USER | XE_BO_FLAG_SYSTEM))
> >   		return -EINVAL;
> > +	vram_flag = flags & XE_BO_FLAG_VRAM_MASK;
> > +	vram_stolen_flags = (flags & (XE_BO_FLAG_STOLEN)) | vram_flag;
> 
> Nit: Can drop the extra parens around XE_BO_FLAG_STOLEN?

drivers/gpu/drm/xe/xe_bo.c:2266:35: error: suggest parentheses around arithmetic in operand of ‘|’ [-Werror=parentheses]
 2266 |         vram_stolen_flags = flags & (XE_BO_FLAG_STOLEN) | vram_flag;

The compiler doesn't like it.
> 
> > +
> > +	/* check if more than one VRAM/STOLEN flag is set */
> > +	if (hweight32(vram_stolen_flags) > 1)
> > +		return -EINVAL;
> > +
> >   	place->flags = TTM_PL_FLAG_CONTIGUOUS;
> >   	place->fpfn = start >> PAGE_SHIFT;
> >   	place->lpfn = end >> PAGE_SHIFT;
> > -	switch (flags & (XE_BO_FLAG_STOLEN | XE_BO_FLAG_VRAM_MASK)) {
> > -	case XE_BO_FLAG_VRAM0:
> > -		place->mem_type = XE_PL_VRAM0;
> > -		break;
> > -	case XE_BO_FLAG_VRAM1:
> > -		place->mem_type = XE_PL_VRAM1;
> > -		break;
> > -	case XE_BO_FLAG_STOLEN:
> > +	if (flags & XE_BO_FLAG_STOLEN)
> >   		place->mem_type = XE_PL_STOLEN;
> > -		break;
> > -
> > -	default:
> > -		/* 0 or multiple of the above set */
> > +	else if (vram_flag)
> > +		place->mem_type = bo_vram_flags_to_vram_placement(xe, vram_flag, type);
> > +	else
> >   		return -EINVAL;
> 
> Nit: I think we can drop the else here, since we already checked this
> condition above? Or drop the check above and rely on this?

Okay, I'll remove that return from else.

> 
> > -	}
> >   	bo->placement = (struct ttm_placement) {
> >   		.num_placement = 1,
> > @@ -2266,7 +2294,7 @@ __xe_bo_create_locked(struct xe_device *xe,
> >   			return bo;
> >   		flags |= XE_BO_FLAG_FIXED_PLACEMENT;
> > -		err = __xe_bo_fixed_placement(xe, bo, flags, start, end, size);
> > +		err = __xe_bo_fixed_placement(xe, bo, type, flags, start, end, size);
> >   		if (err) {
> >   			xe_bo_free(bo);
> >   			return ERR_PTR(err);
> > diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> > index a77af42b5f9e..9a8401300b15 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.h
> > +++ b/drivers/gpu/drm/xe/xe_bo.h
> > @@ -122,7 +122,7 @@ struct xe_bo *xe_managed_bo_create_from_data(struct xe_device *xe, struct xe_til
> >   int xe_managed_bo_reinit_in_vram(struct xe_device *xe, struct xe_tile *tile, struct xe_bo **src);
> >   int xe_bo_placement_for_flags(struct xe_device *xe, struct xe_bo *bo,
> > -			      u32 bo_flags);
> > +			      u32 bo_flags, enum ttm_bo_type type);
> >   static inline struct xe_bo *ttm_to_xe_bo(const struct ttm_buffer_object *bo)
> >   {
> > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > index a6c361db11d9..621aa0ab3de3 100644
> > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > @@ -158,7 +158,15 @@ struct xe_tile {
> >   	/** @mem: memory management info for tile */
> >   	struct {
> >   		/**
> > -		 * @mem.vram: VRAM info for tile.
> > +		 * @mem.kernel_vram: kernel-dedicated VRAM info for tile.
> > +		 *
> > +		 * Although VRAM is associated with a specific tile, it can
> > +		 * still be accessed by all tiles' GTs.
> > +		 */
> > +		struct xe_vram_region *kernel_vram;
> > +
> > +		/**
> > +		 * @mem.vram: general purpose VRAM info for tile.
> >   		 *
> >   		 * Although VRAM is associated with a specific tile, it can
> >   		 * still be accessed by all tiles' GTs.
> > diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
> > index d49ba3401963..6edb5062c1da 100644
> > --- a/drivers/gpu/drm/xe/xe_tile.c
> > +++ b/drivers/gpu/drm/xe/xe_tile.c
> > @@ -124,6 +124,14 @@ int xe_tile_alloc_vram(struct xe_tile *tile)
> >   		return -ENOMEM;
> >   	tile->mem.vram = vram;
> > +	/*
> > +	 * If the kernel_vram is not already allocated,
> > +	 * it means that tile has common VRAM region for
> > +	 * kernel and user space.
> > +	 */
> > +	if (!tile->mem.kernel_vram)
> > +		tile->mem.kernel_vram = tile->mem.vram;
> > +
> >   	return 0;
> >   }
> > diff --git a/drivers/gpu/drm/xe/xe_tile.h b/drivers/gpu/drm/xe/xe_tile.h
> > index dceb6297aa01..5d834378b354 100644
> > --- a/drivers/gpu/drm/xe/xe_tile.h
> > +++ b/drivers/gpu/drm/xe/xe_tile.h
> > @@ -23,4 +23,9 @@ static inline bool xe_tile_is_root(struct xe_tile *tile)
> >   	return tile->id == 0;
> >   }
> > +static inline bool xe_tile_has_separate_kernel_vram(const struct xe_tile *tile)
> > +{
> > +	return tile->mem.vram != tile->mem.kernel_vram;
> > +}
> 
> Nothing seems use this helper AFAICT?

I think I'll use this later, but I can move it to the patch with usage.
> 
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> 

Thanks, for review! 
Piotr
> > +
> >   #endif
> > diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
> > index b44ebf50fedb..7adfccf68e4c 100644
> > --- a/drivers/gpu/drm/xe/xe_vram.c
> > +++ b/drivers/gpu/drm/xe/xe_vram.c
> > @@ -13,6 +13,7 @@
> >   #include "regs/xe_gt_regs.h"
> >   #include "regs/xe_regs.h"
> >   #include "xe_assert.h"
> > +#include "xe_bo.h"
> >   #include "xe_device.h"
> >   #include "xe_force_wake.h"
> >   #include "xe_gt_mcr.h"
> > @@ -283,8 +284,11 @@ static void vram_fini(void *arg)
> >   	xe->mem.vram->mapping = NULL;
> > -	for_each_tile(tile, xe, id)
> > +	for_each_tile(tile, xe, id) {
> >   		tile->mem.vram->mapping = NULL;
> > +		if (tile->mem.kernel_vram)
> > +			tile->mem.kernel_vram->mapping = NULL;
> > +	}
> >   }
> >   struct xe_vram_region *xe_vram_region_alloc(struct xe_device *xe, u8 id, u32 placement)
> 

-- 
