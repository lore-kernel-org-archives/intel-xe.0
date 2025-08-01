Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFAC1C87FCB
	for <intel-xe@archiver.kernel.org>; Fri,  1 Aug 2025 10:23:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D96510E150;
	Fri,  1 Aug 2025 10:23:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QN1cXoEC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B803F10E150
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Aug 2025 10:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754043806; x=1785579806;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=hQkRYgV+3WBqXLhzn1NBQ7JaTo4GqYMINzfMzl0wyw8=;
 b=QN1cXoECokC6GBumeytNciRsEQ9Xm2Zo8faEfpRJVLHY9O/iwNTaLfrX
 GFKoKEbfaMobOk3SAMfZI5caQrXPdCyo+M0EMID+vzU9uPIH0MhJzrpmz
 //DS1AHuOadClXf8Hy10ddqcYJ16btLzik6OjM4N8aM5EgRf85klPs3CX
 TjUIdttFjwTtrD0lLm3YVfvYPSa1scsQZ28OoUgWptpxl6Z6hPMtVQOyY
 k4qHnPzwM5NKDAeRkbtAHOYhx5DpqhfuRnMs4jpenfx38AShrFsfPNpti
 rWdeC7a9l757Ol2Y57wxU5JPQLHpDLchoRrUvtC0u3597alOhfLcOYvla g==;
X-CSE-ConnectionGUID: niK4wN69Q8O/PKzVTBJJww==
X-CSE-MsgGUID: E73+fZf5TnWNtdWxHTUA+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="55589448"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="55589448"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2025 03:23:26 -0700
X-CSE-ConnectionGUID: EP5be2J2SuG1A/g0YgrWeg==
X-CSE-MsgGUID: 1l4KPs8VTuSKloXrgVGr5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="187202556"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2025 03:23:26 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 1 Aug 2025 03:23:26 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Fri, 1 Aug 2025 03:23:25 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.84)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 1 Aug 2025 03:23:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oT4e6mvjT7wJgQDhUfhjVyEjABZuSiWRKAwV7MRHQd6AQOMA1+AfJ3m3jygwdq7JqzOR9Pw+SzB2bb7iC/MlXeoSfuBD3MN8n+aUkFjyCAyVVb4W8qS3GKFiO5yDNE4A9hgGMMohFoAA1IvQjLZVoyDkiTyIg/01iC9dBxa7INCzJ3VIoqh0Zs3hRFoGFbcwkdvojAoLBrbnO2sJx7ymJO85rHVLzRRKDz7glUMU9e+NOiAn4aBXU3k/bBwOe46DTtBNK6PXbWa3PtK1WsOM07W1or+GT/rNFQjWXLke93cAHoK7Kq/lcNIODQOuon0rmpv5Eo3S2gMCPIUSLFUGRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ebuRjRtRGlAOOJAwkrtXiVj4gw5MnfDNe/+lEOrghtU=;
 b=TwLHwZc1PR/afmyn7egDAr380UsCMcH7WzZ6zXo6B8AXVkLK35Df8SSpWNMPd7NBGj5I3EqdYHMoAi8/6nxQY7Rb9ccsXRdKLrygdrtzBHkWtoP06yLr6Qaa7c8wFBkOXohpxaMNJTlyaTsBmwCuCVKdDx8TjWhhz9pilCGtGTroCwJROZEVK+aG0MxAs2mLd/u9O2FtX0dvJ86dpMHGi1VSAxfC7/AtY2hIVQ2obhinTtYDopidklBYXhWhT2HjBwt+vz76X6RbV85fLbNJVwnDDXbn/OctV331U9dgHHNgJmGCCtOHLM7A6OtWH2xkw6B/iAFg6Yb/ZQH+6O2t1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by PH3PPF4E874A00C.namprd11.prod.outlook.com (2603:10b6:518:1::d1e)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.11; Fri, 1 Aug
 2025 10:23:23 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.8989.010; Fri, 1 Aug 2025
 10:23:22 +0000
Date: Fri, 1 Aug 2025 12:23:20 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/3] drm/xe/pf: Disable PF restart worker on device removal
Message-ID: <20250801102320.fzqlyoxg6xlu4x4y@intel.com>
References: <20250730174913.178434-1-michal.wajdeczko@intel.com>
 <20250730174913.178434-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250730174913.178434-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: DUZPR01CA0064.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c2::17) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|PH3PPF4E874A00C:EE_
X-MS-Office365-Filtering-Correlation-Id: 73d7d59d-7173-418c-f58f-08ddd0e57150
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SFdnMDRxR0l0ck4zbVhQeHdwV3dYYkRaRDFKd1dHSFQ5eUJEVnhGNmp1OUxx?=
 =?utf-8?B?QXBrbmJqWUsySTY0TnoxT0RmT1d6YzY1QkhZakswM1A0eHZiWG1qQXVjNUpm?=
 =?utf-8?B?UkVZQ2RPQjkrNmFFUVNTeHhpQmU3eUpVZXVmQ3YxaGMwanBiM0IrQzkwK1k0?=
 =?utf-8?B?bEFiZkQ4dHd0UUF3M2ZxN2Z1ZkpoaXFRQkQ0a21sUWsrbkhWUXJ6RTcySkpN?=
 =?utf-8?B?STJnbHBOczFxajFCWkErT1ZlekEvZkxBUGtlemkrdytFUjV0bFl4ZmUwbjJn?=
 =?utf-8?B?b2VKeURVNHM5RVhJSHNmTzdqbDR3ajBDUEkyL3pBZTRxSlJiYmE2L1FVd295?=
 =?utf-8?B?cVhoNHJYQ0VxTFNPTmt0OHVmSDE5cHg5a090Vzc2eC9JM3E3WG1rbzFhZlha?=
 =?utf-8?B?Q0lkV2xVeTl1S04zYWt4Vzk3MW9tQzRMK1U2cmRYeUZyQ3o5WlFiL3lwZzlD?=
 =?utf-8?B?VGFHRXRHUXdZNW1hYUQ5NW45SnA2MzBOSFR4NFlrVGZHbURBcTQyQ3JveSt3?=
 =?utf-8?B?bmhndG1hQzRTc2FBSjJnZGlCQjRPY2pIVFI3ZXdjRkx5WDhpRXVDME9ydjJm?=
 =?utf-8?B?ZVdpOWFtdG1jTnhRb2hOR2REU3I1YVFEQXhPaW40NDZmdE5DWkppbzBwNlpx?=
 =?utf-8?B?MzBVYnNzQ1VyejFnMWFVLytQSWE0enQ3UUFkTTcvWlNBamFWREZmdm5CMDVu?=
 =?utf-8?B?VlJoUFc3OVNxLzlKMCt3R1QvbytkTktORUd4ZzFiV3VodGQvT0JvcUJ2cElT?=
 =?utf-8?B?TERTMTBxVlQ0d1A0WVJDZjgxZzkxaEh0TFhMSHN3eFZrUUg2ZzdFbWVsSFkx?=
 =?utf-8?B?RDU2aC9TOGprTy9JdEFtbjdLZG14dHI0TEZpYXNZcmloQjRaVFlQQW9rOUlt?=
 =?utf-8?B?cEJycVlRbWUxMG0zZHg4S2RoUk9NbW1kR2kvSUQrM0o0OE82T1lZWXV4Zzlm?=
 =?utf-8?B?Z0NqVHUxOFdaUW9iZk9CTDhzVC9aSWd1TjdpWUVrSDVpVmlTKy90Q3REbXVE?=
 =?utf-8?B?VUg4czJ0QlRmdlVxVXhSTXJtNmp0VHB2R05XdXVaNlRXUERBWjZ3TFErY0lC?=
 =?utf-8?B?RkwzWjY4anR6dmk1bXRKQVowNUdObTBCOWp1SVpKeU12cDVSUFZFamtsanZh?=
 =?utf-8?B?MGh4QjljcU5UeGtiajgwZkdXcVU4cS80eEhxeEtDTm56c2lLYUhmRkpzQjhE?=
 =?utf-8?B?Mkd1MStKYXFLa0oyci9DV2cxU05XL29haTJQVHRKa3lCVHorUGRYelhwSnBz?=
 =?utf-8?B?dS9kci9oK2lzSlE3Zk52dk5LR0dMbW43MXYvTHcrY3ZXNGJFT1pYdW1RYTYw?=
 =?utf-8?B?WW1GZTY1WGFUZlhGWG85Y29xZWJDYUVHdERmQlZoL0xCUlg2L0hQQ04vU09R?=
 =?utf-8?B?R1hDZHNwcnJOYVhyZHRJUkJkSmt4aEkxcVlZZ3hzYkZWRTFFays5QVUvT3FB?=
 =?utf-8?B?dzlyWW9WYSsxZ1dIUGtrQzFLVlpYblF0UC85N2dIdGE2QWdMMjlxVGFwK0JE?=
 =?utf-8?B?Rks4MUZkL0tkUjZPWjJ5R3ZUQnpKeitlV0xHQTZBRTd5MEJ5bjFTZTFWZGla?=
 =?utf-8?B?b1JXTmNkVFFjQlhrZ1VhU2ZZdmpqWjB1MDlqSmtoVFpRSVNlU1ZYWi9FL0lX?=
 =?utf-8?B?YStQSEpCVVo0blRxQWJ2WnprUHpqWDNjK0FReEVaTW4yRWMySkN3TnFNUkJu?=
 =?utf-8?B?bDZFREtqOFZISm9VU2s5d2xrTWNNeXlkc21IeGE3Mkg1dEV2NmNWNjdRY0FP?=
 =?utf-8?B?UFpoMTM4NVpCRDJZa0NReFNFb3JhZmpnemxOR1FhNkJUQ0JocnMwQUdSYTUx?=
 =?utf-8?B?WkcxUjNwakpkckdadWtRMEhhdnJkWTZuVzRDOHdKUVlrcGtJK1BKN0NtSzAr?=
 =?utf-8?B?RWRPOENoWnMvRVFNSWFFMENiUnUyeDRQTk5xbktFV2ZweUtqN0xVUzBTalVW?=
 =?utf-8?Q?hM3XiJEeTcs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZTZTME9VOG5DbWVGM0t4UU8weDNoN0U3V0IyWnR2RVFHMy9sSUs5aFI1clpy?=
 =?utf-8?B?cmoxNUhMWlg5M0djRldJVnd3a05Nb00zajNuRWtGMVpNazYycnB2cUhUM0w0?=
 =?utf-8?B?SVR6cHZ1VGxJQmwwNEtzcUZQQXZGZDhEL0tadVV2WG9kVjZ4RVQvSW1xVmNU?=
 =?utf-8?B?SE1DVHQxSlplZ0t4cmo1L0hBU0VHeUtKMDg5ckpGa3FTcmYwbk1BOEt6M21K?=
 =?utf-8?B?RzVSZHFDYlBLM3dIRGJ6SjRGZGFmV3BVQVpqNmtSUWppb0tmbitnSUFtcnFr?=
 =?utf-8?B?dGdlTTVGRE9OeHBYQXRIcmFpKzdoTjVQZlBLbW1TZk16Q0lXNHZEVFpZMWVQ?=
 =?utf-8?B?Zm5kaWFaTGZIRHhFVDZibmE0bnVFRklnbElZNmlaVGllSkZ6bG8rMFRabUJC?=
 =?utf-8?B?eVZreTNqcW1EbWVybXRLQ2tLSGVFVlFxQ0Z5MVhBaXlKUFIrZFFHdHBxZkRk?=
 =?utf-8?B?a1RvRE1aN0pWeGRvWkhoWTZlVk9BSEVmSzhpNHJkYW9jU3hSYko4NUFHYkNU?=
 =?utf-8?B?U0hjVGpuRzBtcTBjaWkyb01MYnk4V1pSamcxTW1oUGlWUGV5TTV3b3NCcU9o?=
 =?utf-8?B?TVkwT24vUmQ1ZC9ybTJTS1V1VS9wbm91MDhJTVVjR0RTam1GSm9MaGxWSk9C?=
 =?utf-8?B?eVZrTk11NTlVL3ZIQ3RBY1g2TGkrYWJKeFdmRUxuV1Q0RXpqWGdzcWpISFVL?=
 =?utf-8?B?WHNWWmlJZHNtQy9MVDlQc0JvWmZncE83TzJTdFNENW5nbTcyZlJ3UHdqaTdS?=
 =?utf-8?B?SktzVlVlS2FYeDd4b1FYY1B4RU1zOFJBYXFJUmdyVFFHNFpKMTgyYi9BaEFC?=
 =?utf-8?B?ampuY1ExRnJWeUJXWktUTEF2TjMvMWl5WlJ3L3V0UUFOMXo2MEVTMC9LUUNV?=
 =?utf-8?B?bEszNVIyYUJOMFhDZTVZZ0dYdzBWUG1NakFXUzFoRmN4c1l3UzRHb2VMTGt2?=
 =?utf-8?B?WDRFTUU3bW1mSVhPV2huS0MvRnl4a04xZlZiYTNBMUNXd2Z6NEpkbjFWSk9W?=
 =?utf-8?B?bE5aQWdjVVUyYzRteG8yL3ArbDQ5bHgyOFBqbnpsdmFYYVZhQThGd0xuY2k5?=
 =?utf-8?B?eE1qRWxjakpKYWUyVjQ2RlgyZGpnTlVzcUFuS0VCNGllaWdUblBtclVZMDhH?=
 =?utf-8?B?Q2VqbCtYQnZPeU5yMGF0c1UzRk9SeUVGYVFydzNML2JKZmpvSkg4U0NaaEor?=
 =?utf-8?B?QTJUQ21IUkVrL1pLS01LMDVvbGl3b2EzSlpCNkExSlYyVHFQYWF3Zkx3ZGNp?=
 =?utf-8?B?R0dFVnhjQTRpVFVRNjZKeEFza3ZsZFdGMXBhbDMwYlBIOS80R2pINjRmaEd3?=
 =?utf-8?B?ZmFCMHZOZEZXMGVSRngzbitvT3hDVXJKTlA4R2xENkFKSFgzd3dnb2R0WXRI?=
 =?utf-8?B?MUV6a0pjL2kvV3RFYWlhN0Y1UzNpU1NteVJpQkMrNlBtM0p3dVQzRmFLdkMx?=
 =?utf-8?B?MmlNSVBQMEtBWEpCR2xnM3BuM0xuOUhSd1VESG9iZCs2ejh2NFJqMWNjSUZV?=
 =?utf-8?B?Wkx1RlAzYUF3SWMrN2Z2Vk40Y1V1VHpvcHYveHp5QkZNeWFxTVpQaHJTTlhJ?=
 =?utf-8?B?K0xHYnpoOHJ3OXFJbzR1cXAvVFBpTHEweFdrV0dkMkM5ckc3T0RlelgzRUxt?=
 =?utf-8?B?SWxxNjdQTm1VclJGSVUvNzhCa2JjUFRsOGI0bXp5OS92Wk5hWlRkM3luNitZ?=
 =?utf-8?B?OHlVTjF3QmV4TFlGNUdvQzlPMW5QWWcvd0ZGMVBJcmNENFhBcGZiV28ycm91?=
 =?utf-8?B?MkM0enY0MkE2cU5GNCtBYno1a29RRDQ0VmhHWGRCZU15bTFXdG1PTmlsdE8z?=
 =?utf-8?B?UVFIcFE5TmtwOWRFYXBDRWxGRjNiMTRBOEZyWEtiNlo2TGxVYmNLcWYyMU1u?=
 =?utf-8?B?TXlHQkpGYU90U01nc1l5Ykd3Zk4rcm1NWXBIV2U0dGJUeXhqWTF3eFRES0hX?=
 =?utf-8?B?dkhDVmpzSnNFUVhFYTZ2R29ja0NPVlN6c1RjenVZeFVhTndYV0RkYzlYQ0dl?=
 =?utf-8?B?U2pheXlUSC80QzRVMzVPd3FzMFRBOU1OT0szUGlxbE5KTk41MU1PZmVnZE1T?=
 =?utf-8?B?c2w4eVpDdit0Mm1qQTBiYjVicGZRSDdiS09ESVZaUmZGMDRxVjJxS0N6MW5v?=
 =?utf-8?B?MFZTSVN0WG1LSUZFOUIwci9CNmtNaDRueHFWQ1U0cjJSQ3dYbndYZWh0QWN1?=
 =?utf-8?B?REE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 73d7d59d-7173-418c-f58f-08ddd0e57150
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2025 10:23:22.4580 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RhKr6GVAIGB8X/xmFgMmuim5rLfs7lkLyNg7SMzKYwhfcC6vYwlq5ayA0lmhh6Oo51Uc+xZTmr5NY/4Kwm8grY3tWL0sLUu0p8Om5YUH6Tc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF4E874A00C
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on śro [2025-lip-30 19:49:11 +0200]:
> We can't let restart worker run once device is removed, since other
> data that it might want to access could be already released.
> Explicitly disable worker as part of device cleanup action.
> 
> Fixes: a4d1c5d0b99b ("drm/xe/pf: Move VFs reprovisioning to worker")
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf.c | 30 ++++++++++++++++++++++++++++-
>  1 file changed, 29 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
> index 35489fa81825..2761319fdc26 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
> @@ -50,6 +50,11 @@ static void pf_init_workers(struct xe_gt *gt)
>  	INIT_WORK(&gt->sriov.pf.workers.restart, pf_worker_restart_func);
>  }
>  
> +static void pf_fini_workers(struct xe_gt *gt)
> +{

NIT: I wonder if xe_gt_assert should also be here.
It's good that we're keeping an eye on this in pf_init_late, during register fini action,
but theoretically someone could call it directly at some point.

> +	disable_work_sync(&gt->sriov.pf.workers.restart);
> +}
> +
>  /**
>   * xe_gt_sriov_pf_init_early - Prepare SR-IOV PF data structures on PF.
>   * @gt: the &xe_gt to initialize
> @@ -79,6 +84,21 @@ int xe_gt_sriov_pf_init_early(struct xe_gt *gt)
>  	return 0;
>  }
>  
> +static void pf_fini_action(void *arg)
> +{
> +	struct xe_gt *gt = arg;
> +
> +	pf_fini_workers(gt);
> +}
> +
> +static int pf_init_late(struct xe_gt *gt)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +
> +	xe_gt_assert(gt, IS_SRIOV_PF(xe));
> +	return devm_add_action_or_reset(xe->drm.dev, pf_fini_action, gt);
> +}
> +
>  /**
>   * xe_gt_sriov_pf_init - Prepare SR-IOV PF data structures on PF.
>   * @gt: the &xe_gt to initialize
> @@ -95,7 +115,15 @@ int xe_gt_sriov_pf_init(struct xe_gt *gt)
>  	if (err)
>  		return err;
>  
> -	return xe_gt_sriov_pf_migration_init(gt);
> +	err = xe_gt_sriov_pf_migration_init(gt);
> +	if (err)
> +		return err;
> +
> +	err = pf_init_late(gt);
> +	if (err)
> +		return err;
> +
> +	return 0;
>  }
>  

LGTM:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

>  static bool pf_needs_enable_ggtt_guest_update(struct xe_device *xe)
> -- 
> 2.47.1
> 

-- 
