Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03C5EC25B10
	for <intel-xe@archiver.kernel.org>; Mon, 13 May 2024 15:21:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EDBF10E802;
	Mon, 13 May 2024 15:21:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RCLLTYLn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55D9B10E802
 for <Intel-Xe@lists.freedesktop.org>; Mon, 13 May 2024 15:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715613692; x=1747149692;
 h=message-id:date:from:subject:to:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=JLrWsXBzBV8wOiRcPtMrOptnLiO42jkD51sPRJ9yAYw=;
 b=RCLLTYLn/2icxVgoKGvqKn07B13yYwRRB2Z5Cl2Cb75J84GdUL82WP/9
 C9yoHw9/4PjZy+jK3QHuFqOpq7SoihC9xHoZW3KTDOGnIDzUpDihK0sHN
 6KQbRAU4uZZNnQcOf4Dg/LKW62UmgTYba/Kzms/tqi8RY+QmVgpgiTRSj
 tIpvKJuoVvEJUPJsudSuJrDBN/cTVYHKCMndoJUSILQa8TbxaEUDxWOk+
 lSEtjxk+G8esSWWu/hW2mqshxRnL0lK+64GMLKhWU2TcQZuMx+/F3E2yK
 avBb/X4AG0e2G7vep+jiKaT6QHj7mCZYnN8LC5dLbWVJWTQ0FfFBRphWD w==;
X-CSE-ConnectionGUID: g+60V+VtRl6kRQaQXp1t7g==
X-CSE-MsgGUID: 3Cy2ApYBS52VYrmtN2Sarw==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="15374118"
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="15374118"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 08:21:32 -0700
X-CSE-ConnectionGUID: BZJ5CFbSRUuGr56J0O2Lsg==
X-CSE-MsgGUID: b7IWFMUuRpKInKAHVTcw0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="35241136"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 May 2024 08:21:32 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 13 May 2024 08:21:31 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 13 May 2024 08:21:31 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 13 May 2024 08:21:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=meS7hLiNkIpTgKX64kbZVTHhZhx8QiwkVkflGL10sA9uxWWkW3QgwMZi1EIGFHgyG/SzH8RJt5MNPzh4BuGHJKC5TGAtgApU85AD91NlwhllOlItSSJ9qLHeYLw9BnjSB/gSxlIjmWfOvg+QPIDGVlIXeL+Dbcwp5f6L5LJsnEYqlnVD5y/VvAFrhZBO8yhnsCnTxm+WjPYEq5WDEBYhc4RIoUU94VbYCUTl/+VzMEew4oUCxhfR1FtH8C1jzeiH5RlW/ZAjy+R3Ol+F5wKo8Wu+f/IYxfUYofiErfM7fZfmpC3XLvup4OkDdokfLH4c8Can/s/2Teqgh7R7xE+3/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lfoy9vaA7LzLv1hGN7AIhNt+Y2hL9f3OdeENqDDpDv0=;
 b=DeKM4Uh8kTX8El0inu4YfQsqLeTRr+62KFznigco7TNU7TXEKBAixmWRt/ZGjb+dAC9E96oBHhWDnUVtScVQkrSF+hoFuu19bEFBuPJWkgyAFOsPx64QoxLW+vrHnS7qVYMjghScFYUFqTYxv8prRWOAyHPYixXRTT/v459IZy2+GgJPhawoe0JvMYV4ZRZE3iv06XRBJXHRQDL0vQNN7Fo2U49yB5Y6QNzwrcwLAevlMoHPnyTljd1yQgahj3Ng1yF3Gope+yffGKYl1cbWU48J1L0R8D76GIBy8hu/ggHUECjFZJNJitn14msGfu+kW+pF1chO7eAnhPrCfUMqbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by IA0PR11MB7212.namprd11.prod.outlook.com (2603:10b6:208:43e::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Mon, 13 May
 2024 15:21:27 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::ca61:3301:7ce0:f694]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::ca61:3301:7ce0:f694%4]) with mapi id 15.20.7544.052; Mon, 13 May 2024
 15:21:27 +0000
Message-ID: <28b8fef5-14fd-48fc-92c7-09196d7f6680@intel.com>
Date: Mon, 13 May 2024 11:21:24 -0400
User-Agent: Mozilla Thunderbird
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
Subject: Re: [PATCH v3 2/2] drm/xe/guc: Improve robustness of GuC log dumping
 to dmesg
To: <John.C.Harrison@Intel.com>, <Intel-Xe@Lists.FreeDesktop.Org>
References: <20240508224927.11341-1-John.C.Harrison@Intel.com>
 <20240508224927.11341-3-John.C.Harrison@Intel.com>
Content-Language: en-US
In-Reply-To: <20240508224927.11341-3-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR07CA0003.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::16) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|IA0PR11MB7212:EE_
X-MS-Office365-Filtering-Correlation-Id: 12d5fd77-0893-4f17-4b9d-08dc73605bd4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y2VGYkZCMDVHdXhCWG05WXJ6c1RQUkUyZVlUZWNBeEZjOFRBOGNVK2dlcCtN?=
 =?utf-8?B?Q0Y0QUd1V1NxRGNNaGsvd0pOZ0RrY3RBQTFTY1NnczdVNFl6dXh3RWRUd1Mv?=
 =?utf-8?B?ejg1c2FZYjNKbGhPMVQ4K1dwQzlubEthSjlvVUo1TUIxckRwSVNWWWFvYThm?=
 =?utf-8?B?NS9ZbXF5aUVOV0xxZ1RjTmVHWmUyQmtBMWdQWXg3YVhQWjQyTXpYYzRzNkpt?=
 =?utf-8?B?TXFpOUlrZmNxcWRHSWRqRjF5czljbUpEZHRQSVRMbVo3cU9SVEtlc1dZZTc4?=
 =?utf-8?B?UndYbE5sUkF3Ym9mRGY0K1V6bHg0LzFUR1RPYW1IZUZJcmRDM0VmSmc5RG5n?=
 =?utf-8?B?Ryt1WTRyYnUxc09wSXJ1OG9pN3g3ZE5ONmtLU0Ezb2x3VHdSbW1tQytvdUdq?=
 =?utf-8?B?cXpGUWhhL0xEWWliaVhreUJlRitYODFGbzBJTUlmdURXaVdNRG80ckJJNE9R?=
 =?utf-8?B?VTljZGQ5NFBYM3dYb3FhNkxUMFI0cUV6UVRRNEJXK3lTb2lxYk9KQVRuZUFS?=
 =?utf-8?B?RjVXZzNaVGhQcHVXTUwxUHZJK1l6dzdzblA4Z01tdHhJVTR2OGh2VHlVNU5X?=
 =?utf-8?B?K2ZGN2dUUUludlcwdkFPK0hqZlRRK0hjZityRm50VVR6c1FOa2dBc0hNb2xM?=
 =?utf-8?B?Zm9NVFByeWwydGl2MzhXaUFLWGRBSlhJblAwcXc5dkFGU1FlaVpJSzh4aXht?=
 =?utf-8?B?QWVzVDFpK1hnL041MDVnOUFxa1RtTE5RVXFHZEE3cVdOWXJMYjYxM1JYeG1K?=
 =?utf-8?B?TzVJUm9yUit1MHNSUmFqN0EzaG82SFBoV1lSTDNodGlZSnc0bUVmK3VqV1J6?=
 =?utf-8?B?Rk5COGRiVVZ6T3VoSVBaMjdVZmNhNFRteTNxWUxDZjFrVzdMbkxJOElEY3pF?=
 =?utf-8?B?cmV5Qlh5UW1MdE9EZ2RPWi9LTWpYVDVldUlkN0kyTVNub2NzdFg3R1V2NFBW?=
 =?utf-8?B?ci9UU09JaWhId2N5amxpU3EvbEszME5yaGRqS3ZjaHVRR2xOTjJzd0wwempO?=
 =?utf-8?B?VWJhY2VXR093QjF6bTlLWVFGcW1WdnZxay9mUTkxNi9Ebk5aK283cDUwenIv?=
 =?utf-8?B?NTNIYnhFMVkzeUtOdkthTi8xTGJrcUtEWUJxUDNuWFFqa0ZDbnlQWWpYZUx3?=
 =?utf-8?B?UEI4V3B1TGtxUmlva2xhaDVqWWFQRy9rNHFlZW9wQVFJMkNzVXhZZUNwVkh6?=
 =?utf-8?B?d1doV2ZKNmZVMnVEejNCODdLZnZqU1hJTU5velZVYUlTUTBnMEZHUkYrdXpH?=
 =?utf-8?B?WE9LdHN0MXBxejA2MmVNcU5vZm1sckRRU2ljMlF5STZxcUxiQkV5ajZWUDZt?=
 =?utf-8?B?ekgvUTVxRGpPUEZlNHFrbllOcStpS3R1N3JqVE83UkVQNzFoRnc2RFVtTjJF?=
 =?utf-8?B?NU4zTkI1SUswMTVxWm94eEgzbGowSFV5QnROZWNGYjFvVFdORjVkTno4NlM3?=
 =?utf-8?B?aXYwVUJXUjBjeVd1NXdHRVBjM01FKzJ4Tk5lRFpGWEdmRUUxanRyVll1akk4?=
 =?utf-8?B?bFZNejN1azN1UmFYUVVxeHg2OHNWRlU2YkxOTGVJMlpsNmJTYkFSSGYzdWMr?=
 =?utf-8?B?Mi9rMnUxSVhCV2V2b1JSWjdMc1ViUHpMT0IrTGJicEU1Q1JRMU4yOGY4cTFC?=
 =?utf-8?B?OU5laGVnOVdxcHhYVDJUMjhRTTMrak1Ud21JdkN2a1ZSYkV2YmFIM3dpOFBV?=
 =?utf-8?B?ZjJySnpIV0g2bmhHYzNEWnpuU3pXT2k2SzdCL09oRTNyRldhTGFGOVJRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WldncFF5cWhFMjJwUC8wZHFhRlc5R1l0dksxNXRCSnBwckFrcTJvWldSYXF3?=
 =?utf-8?B?ck1CL0FGVE8vdUJTQ0xrLzhRd1cxV0VrVWQyT2hJamxnUlN1LzJQcy9lNnF2?=
 =?utf-8?B?djhWd01pdTJnSXZmS3l4NDRzL2QxaXpqaTRTWlpRN0VIMm5hWG1mbmZXWTVa?=
 =?utf-8?B?TDgvWmUvQnd0Vlc4WHVpcEtZVC91ZENFUGRHaDRYV2toV2RiZ3ViZUJEVjha?=
 =?utf-8?B?anVDVzExdUNLNmVvbG5YR0ZKakNXUlZ4a21SRndzTmI1TWV5UHlHc2U5VDZ3?=
 =?utf-8?B?VXk1a1FUWDBwWnRLL3BjTElDWWZFbGJLMWFjQWhvbkp2LzlDM0dTV2lzMGhR?=
 =?utf-8?B?OWx4bU5hUlBoNTR3a0NrdUlpMmtSWVNTVm8wOWtBTmFPWnMzcVdDbFVIUmx6?=
 =?utf-8?B?REpZOHNpQTM0aktjb3dOd1NRNVVhUnZqaURwa0pFY1R6ZnRaUGVBclJPWEpj?=
 =?utf-8?B?R2REZkRxek5zRyswNUJRcGU5SnM5VmtNd2V4bnBVVzN0UFZoSys5eXBlOHJ1?=
 =?utf-8?B?aEVkZFRRYXU0UDQ2QWQyL1A2VHhDMzg3Q2wweWl3RlVicElWZ0ZzbGhjWWhS?=
 =?utf-8?B?UExjOFpiVExIZnhvaHo1c1BSOTlwSHpkWExrNzdNOWxERStiYmNLNkFISGZY?=
 =?utf-8?B?VitIUmhjQmxlbHRGVW9ZNGMyaFQxd0hHMXZqcGg5OEQzZE1Ga2M5M1V0bGZI?=
 =?utf-8?B?WWdNM0R3aGdlQjBXZTdUNzFjMWkzcityNkQ5bkpXV1ZsM01laUw4NWlLbUp1?=
 =?utf-8?B?N25DMnJJZGVEWHJ6bFY5SVZmTjZzZkxjZ2lHYk4vcDhGNUh0RXp2UW5JTlRj?=
 =?utf-8?B?WVJCZDRldzZPRklkR0Y0WnRCWXFjUWtIbXN6Zmh1amwxdzByU255b09jK00v?=
 =?utf-8?B?MmNIbVdyV0I0VE9Kcmt1S1dIZWZoL3Y1VFUzcFFuSWJUVUxRN09sSzI0am9T?=
 =?utf-8?B?VlFSU0NySlVSMmYyWXl3dGR6aUN3NHRCRG9JWXVaS3RqQUdNM3Q3SmNKcVR5?=
 =?utf-8?B?aXhVUHc0dXVTWHZEMGkwQi9qNkRDUm5OZEZMQ1EveG5vVmxrK3VRRlRWOWd4?=
 =?utf-8?B?MkJ2TUlrSnhVd25UTUhjZ0RIcEU5a2NlTHNIaHJFY2IyeW9td1MvYzFxTFNB?=
 =?utf-8?B?Qi9EbVdFem80aUhOZlAraFBFYzd1SnpSeSs3QUd0Q3Q2ajRiYVc1dXI1QTdt?=
 =?utf-8?B?MTkvSjA5WS9GL2lodXN6WEhVQllmZkI5SW1PQU5FWEZneG9sTEUyYUFzdVJv?=
 =?utf-8?B?blVZRmxlNmFGdDZtWTZJVEV0ejVKQjNYSTVneVdpaXhCU1VoNWZ4RDhUTkI4?=
 =?utf-8?B?c3JyVXd1TlpzUDlyT3ZkYit2NlNOaEZUUTZudUxyek0yYjRwdFpHakdvSjM4?=
 =?utf-8?B?N1ZRZ09EUXl6VHhaREkwcStYYlpxRlFQSlJydzJFMy84azhja1B2V1VqQnA4?=
 =?utf-8?B?aGRzdzdZeTE1bGo4V0E5VlY4YTZRUDlINWFkSHd6RnhhZkl5bDcweDFiL0M3?=
 =?utf-8?B?bDFoYUc2T3pwb1dISFJSbzRkY05TcWUvcituK2FUTkd4dURoenE5d1JSUWxV?=
 =?utf-8?B?L21udkVZOG43aXlua0JkZWxqWThKVHl6YjZadGZBWmYyM1dCaTZ2NGU5dHpn?=
 =?utf-8?B?ZmE3dk4wcFFZMTh3aUdoazdRS3RjcE1LQ0hIeXUzNXFiY2pzK3hBY1ZpZEVM?=
 =?utf-8?B?ZlU2UUNQTDgzcWVYOFBHWHlhS0xuU3lLOGlxQkg1RmUwM3FxaFNGMkx1WTBr?=
 =?utf-8?B?USt5b0l6SEpvNjd4WmpZR1JvUUJ5cXQ0Y3lKZC92TmI4eW11MzE2K2VSTFg2?=
 =?utf-8?B?K2hMRU9xQk94SnNoNy9iZm5YQllRZnhIL1VUNDVaS2cyS01CcFF6V2NvS3A1?=
 =?utf-8?B?WFNYelpEVGVNL0dyYnE3dFFIU3c1YW45THBnN1BWZkg4QXhYZ3hOVlJVZmJy?=
 =?utf-8?B?a0RPT3BQMHdXTnMzNVdxb3NpWEdxK29EQ0ZvK01vTml0dmdJYUoxM2xmMkIz?=
 =?utf-8?B?eWt5aG5jbVQyb1RkWTNNWmk2SDY1ZjNpVHI4OEhrVkN5TU9hNnJwRGphTWU0?=
 =?utf-8?B?czd2YkZSdU9ReFl5NGtwdkFCY1ZyYVhaNzRvMUpQdFNwcW9zdnUyZlFhbjY1?=
 =?utf-8?Q?HUOHv/T0W2nAMUM+Ng514RZZ2?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 12d5fd77-0893-4f17-4b9d-08dc73605bd4
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2024 15:21:27.6024 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B4dtmoa0KudH/pExRgVTOp8Jq368lvpDI7Ls2crle8NAWFgggAp53b14/KesUNNF0CH85cQ7VD73pD4i9dvZYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7212
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

On 2024-05-08 6:49 p.m., John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
...
> diff --git a/drivers/gpu/drm/xe/regs/xe_guc_regs.h b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
> index 11682e675e0f..45fb3707fabe 100644
> --- a/drivers/gpu/drm/xe/regs/xe_guc_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
...
> @@ -49,32 +57,79 @@ static size_t guc_log_size(void)
>   		CAPTURE_BUFFER_SIZE;
>   }
>   
> +#define BYTES_PER_WORD		sizeof(u32)
> +#define WORDS_PER_DUMP		8
> +#define DUMPS_PER_LINE		4
> +#define LINES_PER_READ		4
> +#define WORDS_PER_READ		(WORDS_PER_DUMP * DUMPS_PER_LINE * LINES_PER_READ)
> +
>   void xe_guc_log_print(struct xe_guc_log *log, struct drm_printer *p)
>   {
> +	static int g_count;
> +	struct xe_gt *gt = log_to_gt(log);
> +	struct xe_guc *guc = log_to_guc(log);
> +	struct xe_uc_fw_version *ver_f = &guc->fw.versions.found[XE_UC_FW_VER_RELEASE];
> +	struct xe_uc_fw_version *ver_w = &guc->fw.versions.wanted;
>   	struct xe_device *xe = log_to_xe(log);
>   	size_t size;
> -	int i, j;
> +	char line_buff[DUMPS_PER_LINE * WORDS_PER_DUMP * 9 + 1];
> +	int l_count = g_count++;
> +	int line = 0;
> +	int i, j, k;
> +	u64 ktime;
> +	u32 stamp;
>   
>   	xe_assert(xe, log->bo);
>   
>   	size = log->bo->size;
>   
> -#define DW_PER_READ		128
> -	xe_assert(xe, !(size % (DW_PER_READ * sizeof(u32))));
> -	for (i = 0; i < size / sizeof(u32); i += DW_PER_READ) {
> -		u32 read[DW_PER_READ];
> -
> -		xe_map_memcpy_from(xe, read, &log->bo->vmap, i * sizeof(u32),
> -				   DW_PER_READ * sizeof(u32));
> -#define DW_PER_PRINT		4
> -		for (j = 0; j < DW_PER_READ / DW_PER_PRINT; ++j) {
> -			u32 *print = read + j * DW_PER_PRINT;
> -
> -			drm_printf(p, "0x%08x 0x%08x 0x%08x 0x%08x\n",
> -				   *(print + 0), *(print + 1),
> -				   *(print + 2), *(print + 3));
> +	drm_printf(p, "[Capture/%d.%d] Dumping GuC log for %ps...\n",
> +		   l_count, line++, __builtin_return_address(0));
> +
> +	drm_printf(p, "[Capture/%d.%d] GuC version %u.%u.%u (wanted %u.%u.%u)\n",
> +		   l_count, line++,
> +		   ver_f->major, ver_f->minor, ver_f->patch,
> +		   ver_w->major, ver_w->minor, ver_w->patch);
> +	drm_printf(p, "[Capture/%d.%d] GuC firmware: %s\n", l_count, line++, guc->fw.path);
> +
> +	ktime = ktime_get_boottime_ns();
> +	drm_printf(p, "[Capture/%d.%d] Kernel timestamp: 0x%08llX [%llu]\n",
> +		   l_count, line++, ktime, ktime);
> +
> +	stamp = xe_mmio_read32(gt, GUC_PMTIMESTAMP);
> +	drm_printf(p, "[Capture/%d.%d] GuC timestamp: 0x%08X [%u]\n",
> +		   l_count, line++, stamp, stamp);
> +
> +	drm_printf(p, "[Capture/%d.%d] CS timestamp frequency: %u Hz\n",
> +		   l_count, line++, gt->info.reference_clock);
> +
> +	xe_assert(xe, !(size % (WORDS_PER_READ * BYTES_PER_WORD)));
Could we have a "start tag" print here? Make it easier for parser to 
find dump start.
Although we have the "[Capture/%d.%d] CS timestamp frequency:" ahead, 
which might be an "in-explicit start tag", but if something added after 
it in the future, this "in-explicit start tag" will causes parser broken.
A simple "[Capture/%d.%d] Dump start\n" liked tag is more easy to maintain.

> +	for (i = 0; i < size / BYTES_PER_WORD; i += WORDS_PER_READ) {
> +		u32 read[WORDS_PER_READ];
> +
> +		xe_map_memcpy_from(xe, read, &log->bo->vmap, i * BYTES_PER_WORD,
> +				   WORDS_PER_READ * BYTES_PER_WORD);
> +
> +		for (j = 0; j < WORDS_PER_READ; ) {
> +			u32 done = 0;
> +
> +			for (k = 0; k < DUMPS_PER_LINE; k++) {
> +				line_buff[done++] = ' ';
> +				done += hex_dump_to_buffer(read + j,
> +							   sizeof(*read) * (WORDS_PER_READ - j),
> +							   WORDS_PER_DUMP * BYTES_PER_WORD,
> +							   BYTES_PER_WORD,
> +							   line_buff + done,
> +							   sizeof(line_buff) - done,
> +							   false);
> +				j += WORDS_PER_DUMP;
> +			}
> +
> +			drm_printf(p, "[Capture/%d.%d]%s\n", l_count, line++, line_buff);
>   		}
>   	}
> +
> +	drm_printf(p, "[Capture/%d.%d] Done.\n", l_count, line++);
"End tag"
>   }
>   
>   int xe_guc_log_init(struct xe_guc_log *log)
