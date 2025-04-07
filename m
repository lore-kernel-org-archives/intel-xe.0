Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E5EFC36010
	for <intel-xe@archiver.kernel.org>; Mon,  7 Apr 2025 06:15:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25E8C10E1D6;
	Mon,  7 Apr 2025 06:15:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pt5/f7UK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3A4A10E1D6
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Apr 2025 06:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744006514; x=1775542514;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=psbfuZsA6hQFj7/4MMa+Z0EgbCb5GoR1vjIUtPWU3mc=;
 b=Pt5/f7UKpg1LAEZ3KtivwSJekyyfXAeuC5Ah/k6XrCZj8UhMRhTgjeWt
 IFvRiZnVWHjVhVh/eFrNJK44fOCd52gH6viSf1wLB1/RKknSZyV+mObMA
 slgnqelWV6MFuU2TveXVAYBbqBp9/XJ/TgRri+M9nnnlTF1QKSLyNMKdd
 uvPEBqZU6bBd131jdLr09URMH388KL2GK67tdmkezxDy07smo0rUXaZCK
 18MHWUnPJRpnGwxX5pwKYMlxd7pHplSq9HEOMcS//m81ATp4ccsaVuYH+
 XSGQdg+ChBLu6gYZb02ATzhg1qlPvYYb9Im0eL0eHefx7u+2T+uzNXyE5 w==;
X-CSE-ConnectionGUID: Hf+rGf3nSemLEIAPBCqhEg==
X-CSE-MsgGUID: hF1a21UkRzuSYIKyczMyZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="45087811"
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; d="scan'208";a="45087811"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2025 23:15:14 -0700
X-CSE-ConnectionGUID: 9fYonoThRNqbkN5FJcYzAA==
X-CSE-MsgGUID: v4EUjY9GRKqTXsAPP1e/sA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; d="scan'208";a="128178693"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Apr 2025 23:15:13 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sun, 6 Apr 2025 23:15:12 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Sun, 6 Apr 2025 23:15:12 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 6 Apr 2025 23:15:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qcX7+LVWn7DiOwHkNzuRKhB+d75QDCG9FvejPisJl/QpVsPc7DHbhXAz8PY8szCGZepZj0svL9TC7AcQGzDHsHdALNvHGhr0hGh3+s818+K9egvDrxTWsuI4Ia460m/AnruZI4Ll7fkP99CSGK9O/EtuYghiwyH2Jw9spr6/MYqekC5Cx/5+kWla2V+2ghe9sw4lRDw0L+g5TTo4Cg7SwPFSCZWTXw/Z55ixDmKPpNPvr/cgHbaLMRgI9UvKIoXzhd1npi06a9aUPbdzyZwtRybzRFciEZt+0Plg+ANBV/lilLAOXReqcgt0Hd2m8T0ejFyMLxMHb9VVU0XbnQsqBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kjmYJsb4p8q6ahY7kTFeziRcDEioO+/nBxoLhJt3h3M=;
 b=HoCzuBWEUYEjl/ZPhBsrrVgKzFzMpcyvW/2/1ojNtMCRFbjCN3+roy+EW0VSvEZ1jQJUYL5V8BaPr2oqEYXCet+yW1ci/jrDD8d0xFlYw8bYIXr64UzRgixVRXuaPwHFN/dCoxknqlgG+1HjTGTBtZAc5HguBO3coenehRkfvtRqWmfeyfDwoiYlB6ycm+iHbUtDaevpw6vYYCSRZOqlB/N62PUY/h7uPnkkP5CMEb2PbA52WDT4uOVWYO46OjpkSyLfvO+23SqfVCmbAFwuh26sZZSMWqnLxJETnazmVGBp67jS1XyHUhmh5ecXJ2fttlRDG9Hyz9N0Q3hM2asroA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by DM4PR11MB8227.namprd11.prod.outlook.com (2603:10b6:8:184::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Mon, 7 Apr
 2025 06:15:10 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%4]) with mapi id 15.20.8583.045; Mon, 7 Apr 2025
 06:15:10 +0000
Message-ID: <342d1e7a-6874-433b-8f93-f789254f0717@intel.com>
Date: Mon, 7 Apr 2025 11:45:04 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 10/29] drm/xe/svm: Refactor usage of drm_gpusvm* function in
 xe_svm
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>,
 <oak.zeng@intel.com>
References: <20250314080226.2059819-1-himal.prasad.ghimiray@intel.com>
 <20250314080226.2059819-11-himal.prasad.ghimiray@intel.com>
 <Z+71oARy4v3t4UWc@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <Z+71oARy4v3t4UWc@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0P287CA0011.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::7) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|DM4PR11MB8227:EE_
X-MS-Office365-Filtering-Correlation-Id: 9128f3a2-83ab-4004-de28-08dd759b8cd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dUhPb2ZJNjFXL1FBdnVub1VGTUlvNVR1aVpiOWNELys2RU5GRlJSclVmaC91?=
 =?utf-8?B?ZjNld2VDMFd0WUNpcXdDcEpIR2RhMndVa2grV2l6V2JDK2kvcUNydzUwYkNJ?=
 =?utf-8?B?QVJ5TnJLU0VqRkp1NGoyQmxwckQwNjE1anptU2xNQ0RtR0p1WUVBcG0vTVV5?=
 =?utf-8?B?Rm1qYVFOL0xVYmhmQW5jckNaSEZGNGlxWkkwWWxZaE5MUlg2bHoyZ2V6dHZn?=
 =?utf-8?B?djV3S1UxcWZ6TWhzYzNpZk1yaGJLcFNOZHBZRTRHTThUN2JlUmlpQzk0MlZ1?=
 =?utf-8?B?YTdIeE41NDlwaEhVNmJGMUlUYUFnSVRWa0o0aktzVFRBeFF5YkI1bGJHSHJJ?=
 =?utf-8?B?SEpSbGtyN1F4WXdrb2c2RWE5dlZxM3JVS1RmdHA1SkpydmpiK3R6aWZrcWZl?=
 =?utf-8?B?OU5MNXVJY1Zudm9meHpoQnVCMi9TdmNyNlZSaEE4Z1JlL3ZSZ3BvYlVkdCtl?=
 =?utf-8?B?djZWdDVycmp1amNpQTR5dXhtTklVZDRsMVNJUndQdXA3ZGh0QjIzSmp3MzF6?=
 =?utf-8?B?SUNBdXg3Q2JFMENxajBpK2dyRGRKd2JOVjZWQmdSUDRzeXpBNnp6clJHcElh?=
 =?utf-8?B?bzVNdnhCSXpVMU4za3JRMHMvOStrWS9rVGhXeldSZ2JaQnRQcU40R3paelRx?=
 =?utf-8?B?SUhaeUkyRFI1eWFVOUorTlllWnlBZlhELysrL1lOMGN1cCs4Q0VHSTB3eUZJ?=
 =?utf-8?B?U055UHFacTl4bXo2RFpKV3J6TFdMY1A4MXdPc2FvaXhvMVp4VU44WWVySmFt?=
 =?utf-8?B?eGYxcEs0THlBYWhMaDd6RWRwVUVrVklyZkVYQWwvRU01bUREdDFTVDBxY2xn?=
 =?utf-8?B?b0Q0MUphM0V6MTVzREJFRkY0a205Y09VTi9KakNzUUJKM1h3T2xCeHViSlZU?=
 =?utf-8?B?bTNEYjJ0MS9BVFUyOENxaGdkS1IwZ2dHMW11anUvNm1sMEdIYm45ekZxbDhT?=
 =?utf-8?B?MlRCQ3FtQzBhY2xvS2FKQnJwRzFYOHFEWDJDOGc0THZVcHhyeU0vWkxjZCtO?=
 =?utf-8?B?Y0N4WlZ5dzdKcDY0V2J4QUxBam1sM2Q2eTlocFRpbFVyajQ0dXpFV1U3SlRj?=
 =?utf-8?B?MEpEVkljQ0tOZHNYUXBTQkVsVzZCQWE5dVhpMnFaaGo3a0hmTHQ5cU1LNEkr?=
 =?utf-8?B?YTJyMkVyazJ0YVB6K1o0YUNjQWVGSUtoRjE5d2NTc21BM2dZbi9KV1NCeW91?=
 =?utf-8?B?Z0txU1RaMU9NMFBrVGg2aENpM09jRjVWMGhYUEFwaFdraEY0eURSK1g4M2ZE?=
 =?utf-8?B?R0hnYkV3bHA3RTJnV2JPaFNLR1pBZUVDbzltZGQ5cGRxdWw3R0ZBWFRGV1ZV?=
 =?utf-8?B?aW9DUk9tZVhaTTVzdG9vbk9ObG5xYTE3azNQMk9KVTVHa3JxZ2tQNDhSZEZC?=
 =?utf-8?B?ejJwQzc0WUMxZGZGcXlWenIzVklOU01uMkJVQUNCUndvZ3R2Z1hOSkE3M3lz?=
 =?utf-8?B?MzIzSlJwc003RW5PTGZycnhhYXJ0ZlRNbjVnd0VYWjNoY0VVN3ErbkRpTmc0?=
 =?utf-8?B?NkphY2lzRXMvN1Y4U0pDeVVTSUFYYzZVRFVOK1RlZWw2bXQxbWhFN0IwNzBa?=
 =?utf-8?B?REZDU0o5ZzN6R0pnTEVGWXFxQngrZDU5N0RTcGxQdG5rWXU1NUZITXpvT1BJ?=
 =?utf-8?B?dXJYMkJHTml5U0xNaXM1RTk5ejljRlVrMmdGRElwSERYYVVqdWx6QjArY1VS?=
 =?utf-8?B?R01qM1lZVFlETGFpV2FMVkYrbXBQZnhHWmZuNWRmSmZMSTdyVUlNMnQwV2Nn?=
 =?utf-8?B?NlNuQjVPUTFRVWw1TnVtRWdXNUFtanhMM2RscVkvOXNXRmxVeWlOdzBXK0h6?=
 =?utf-8?B?VUZqR3FOMXVpb1FhcEphaVRWTzhFQkptT1JzRTdPdEtuZEVIS09PemtqNk56?=
 =?utf-8?Q?GI6Z8iosioRVY?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MjV3YTZBRXZGam9vY2dJOGFmeXB0OW9RS0dFV1V5V2svR0N2VVpnY256MGJN?=
 =?utf-8?B?aEoxejZIOHEyS1lLQmxWZ3dBRTZ5SCtnbitTSXlkVzNHZ25HNkJLbW1vVmVh?=
 =?utf-8?B?NDNzeEpoQkFpZWx2b2VmelJYaVVUOGNVd0Q1Y1VQVXhBZU1zL21XcWZUd1Mz?=
 =?utf-8?B?UWM4Zi8rRDQ0VjdtdmhoTDF2azRVU2I5NTNqWlFzVVBvblU1VTJ4STY5NmtZ?=
 =?utf-8?B?MWtpZDdIbTFuTEM3dTVWTnF4dVA1dFRrc0phUlZWQU9SaDQwbjZ3ZmxJRHla?=
 =?utf-8?B?THVaVzB4RTduN2NQcEpMS3ZQWU9qbnFMV3JzbE9WSGVLWnJnM1drZG9YSDlW?=
 =?utf-8?B?MW8yYTlEbldsWjBRWWcyWmVPSE54V1JvREt1QVZtdXkvZ3B1RnJSQzl1OFll?=
 =?utf-8?B?MGJZdkt4NElLOTRSM1I3eXlXRC8yK2lUYlYxZDAycmdDdUxaUk9LV3VTSlVp?=
 =?utf-8?B?WWMyaWdiWjBCRHgwQjFuMjFJb3NQM3gwenltNVFnNGNQRDVQOVJScnNKWmFU?=
 =?utf-8?B?Y0JDWTdsYXhCa3NSOVNmQWphRUFUYU0yQlRtM2M5L3NIcGNmc21NU3ovUmdI?=
 =?utf-8?B?cENncHVRYjU0d3UxT2xxVDQ4NitSNHlVdXd6S0JNK09hSXVhdnl6Q3ZFZ012?=
 =?utf-8?B?SzJ1V0pkSzJkQmR3NzdPK29LSjBmbTI4aVhmQWZQMVh6cGJhMzZlYVFvK005?=
 =?utf-8?B?L21zM0NwMEZGYU1wNWpBV0lSWGg4M285Y0xxY1ZGdHpkWnJ3UXV1OGhHdVlD?=
 =?utf-8?B?a29zRVFFVGRXUDViN1h4S1pGZGF4Q09pNlcvNUFGL3ZVTmpadkRUVDhKT0Rr?=
 =?utf-8?B?aUF1YUFtekcxb3c3MkxpRk1FZm5OaHU4WDI4R09RUkY5ZGc4TnByR0pCd3ZE?=
 =?utf-8?B?dDIxckVRSmd0b1NjVjZ6N3VKa1orTVV2NEVKY0MzZk9RR0NsdUE4WWtMMjFD?=
 =?utf-8?B?TmkwOTl4TmZnUkgxWEw4NnRUUnNBQ0ROTklNV25TMk8zdmljd0Ftby9XQ0Qv?=
 =?utf-8?B?WU5wKzJGS3IwVlp6cWptN3prNmVMa1NmWkpJQjFBZE1PV2VqNm5Rb0lWeTdK?=
 =?utf-8?B?d3VJc1B3QlZCS1NFSDcrV2hsTGt0Q2xFSy9sMCswN0l4bnBOVHBFbUFKNkEz?=
 =?utf-8?B?bnFBTWE4d2VKKzNDcTdsbWpnUzFaOW1YclFHbUtlZW1rU3NyYThQcmthanMy?=
 =?utf-8?B?bDNDRzBJdG43M1plaUlMNVZUcEp1TSs1eFlnK1FJc29aQnBwK2duNDNrbGFw?=
 =?utf-8?B?Znc5YzU4S2w1c3h2N09mL3FNblEzMjVFekRRamtOblgxWGt0NncwTEJMR3RR?=
 =?utf-8?B?L0VRQm41TWlPN0owYlU3WU5YTFE1QnBHY0t5bmlRTTZKSXhwTFQ3QmdmQzhE?=
 =?utf-8?B?Tng4QStvaDRuSjFIWWFsOVVmOGQxNXE2N0Vlak9NM0x4S3lxMlJjM3E1VDkv?=
 =?utf-8?B?S0pxZXJyR0k5MjYyNGJMZWhQaThmSHFVR2Z3OFVNN2NGVmRyMUNvaVFJUHFJ?=
 =?utf-8?B?Z2hwMzRDMW9wWURHdDVNaFJwTTVoR3dxWE9aSHYwcXlZQVpFY1YvbnVCbmsx?=
 =?utf-8?B?Y04veXhiNE9ja2RyUUFqVzM1dFpDWWU4NVduc2poRWhNdHZIdnRLYkNoMnAy?=
 =?utf-8?B?N2pzOG5SbTIyWVk1ay9seEdPQ1BJdDl5TUxOUXRMMzBzRkFqeDBPazltS2ZS?=
 =?utf-8?B?bExKMk1tRkYxWEsrV3QvdlJtOHpDNlcxM2syTlhuMlphNmhCSE5UM1FsVnZV?=
 =?utf-8?B?OUhLYldBWC9LbWNtSXp1ZEFnRk1zaHNhTElDZXNDaVhhTGlaRGZlUWZCS2Qr?=
 =?utf-8?B?TWFwRFBnZEltbXVZbytJT01HdndHaUxxT2tXY3QvdTk3aU5yOUxKWHduYXU5?=
 =?utf-8?B?VXV6RTZFY2haVC9wTXgzL0h3YlYwWFc4WjJKV2ZnbVdlNHEzbnAwZSthN3JJ?=
 =?utf-8?B?S1daWVZHYWx3MTZnSzRTdi9xTWN3MkNjZGpCNnNWcTlvN2dhMWFMZVhtUGov?=
 =?utf-8?B?ZUtUaXpscXZaa2NBcmxMWG45NXpjalExMXYvVjJIbTkvWWFXb254YkxUNldS?=
 =?utf-8?B?ckFmTHQvenJpVHovYVNRRDRObzUwc2w0dGFQd0d1N1hMcjRxeUNyc1UwK2hn?=
 =?utf-8?B?c2J3TTMrdWtaN0JRUWNsT05pT0JFdDBvOERiaUxWTk82NmZNQ3ZFV1dSWG82?=
 =?utf-8?Q?7HYoY5fEKNCbdj47Zn7L+Rw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9128f3a2-83ab-4004-de28-08dd759b8cd9
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 06:15:10.3171 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: czEH1SmYkEG4qWUrDIaRa/mIaK1xDsW0KBeIE2DSiRy0UifVOV4/AddtB0tu9KtiSsD4sPJAPxK+bbf9mEXp0tJiNgrD97srqaabzHt/o/s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8227
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



On 04-04-2025 02:24, Matthew Brost wrote:
> On Fri, Mar 14, 2025 at 01:32:07PM +0530, Himal Prasad Ghimiray wrote:
>> Define xe_svm_range_find_or_insert function wrapping
>> drm_gpusvm_range_find_or_insert for reusing in prefetch.
>>
>> Define xe_svm_range_get_pages function wrapping
>> drm_gpusvm_range_get_pages for reusing in prefetch.
>>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_svm.c | 73 +++++++++++++++++++++++++++++++------
>>   drivers/gpu/drm/xe/xe_svm.h | 20 ++++++++++
>>   2 files changed, 81 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
>> index 07511011aba6..5a4cb14d608e 100644
>> --- a/drivers/gpu/drm/xe/xe_svm.c
>> +++ b/drivers/gpu/drm/xe/xe_svm.c
>> @@ -714,7 +714,6 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>>   			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR) ? SZ_64K : 0,
>>   	};
>>   	struct xe_svm_range *range;
>> -	struct drm_gpusvm_range *r;
>>   	struct drm_exec exec;
>>   	struct dma_fence *fence;
>>   	ktime_t end = 0;
>> @@ -729,13 +728,11 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>>   	if (err)
>>   		return err;
>>   
>> -	r = drm_gpusvm_range_find_or_insert(&vm->svm.gpusvm, fault_addr,
>> -					    xe_vma_start(vma), xe_vma_end(vma),
>> -					    &ctx);
>> -	if (IS_ERR(r))
>> -		return PTR_ERR(r);
>> +	range = xe_svm_range_find_or_insert(vm, fault_addr, vma);
>> +
>> +	if (IS_ERR(range))
>> +		return PTR_ERR(range);
>>   
>> -	range = to_xe_range(r);
>>   	if (xe_svm_range_is_valid(range, tile))
>>   		return 0;
>>   
>> @@ -757,13 +754,9 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>>   	}
>>   
>>   	range_debug(range, "GET PAGES");
>> -	err = drm_gpusvm_range_get_pages(&vm->svm.gpusvm, r, &ctx);
>> +	err = xe_svm_range_get_pages(vm, range, &ctx);
>>   	/* Corner where CPU mappings have changed */
>>   	if (err == -EOPNOTSUPP || err == -EFAULT || err == -EPERM) {
>> -		if (err == -EOPNOTSUPP) {
>> -			range_debug(range, "PAGE FAULT - EVICT PAGES");
>> -			drm_gpusvm_range_evict(&vm->svm.gpusvm, &range->base);
>> -		}
>>   		drm_dbg(&vm->xe->drm,
>>   			"Get pages failed, falling back to retrying, asid=%u, gpusvm=%p, errno=%pe\n",
>>   			vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
>> @@ -842,6 +835,62 @@ int xe_svm_bo_evict(struct xe_bo *bo)
>>   	return drm_gpusvm_evict_to_ram(&bo->devmem_allocation);
>>   }
>>   
>> +/**
>> + * xe_svm_range_find_or_insert- Find or insert GPU SVM range
>> + * @vm: xe_vm pointer
>> + * @addr: address for which range needs to be found/inserted
>> + * @vma:  Pointer to struct xe_vma which mirrors CPU
>> + *
>> + * This function finds or inserts a newly allocated a SVM range based on the
>> + * address.
>> + *
>> + * Return: Pointer to the SVM range on success, ERR_PTR() on failure.
>> + */
>> +struct xe_svm_range *xe_svm_range_find_or_insert(struct xe_vm *vm, u64 addr,
>> +						 struct xe_vma *vma)
> 
> I think you want a drm_gpusvm_ctx argument here. It is odd to duplicate
> the context locally when the page fault handler has already set one up.

Makes sense. will fix in next version.

> 
> Matt
> 
>> +{
>> +	struct drm_gpusvm_range *r;
>> +
>> +	struct drm_gpusvm_ctx ctx = {
>> +		.read_only = xe_vma_read_only(vma),
>> +		.devmem_possible = IS_DGFX(vm->xe) && IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR),
>> +		.check_pages_threshold = IS_DGFX(vm->xe) &&
>> +					 IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR) ? SZ_64K : 0,
>> +	};
>> +
>> +	r = drm_gpusvm_range_find_or_insert(&vm->svm.gpusvm, max(addr, xe_vma_start(vma)),
>> +					    xe_vma_start(vma), xe_vma_end(vma), &ctx);
>> +	if (IS_ERR(r))
>> +		return ERR_PTR(PTR_ERR(r));
>> +
>> +	return to_xe_range(r);
>> +}
>> +
>> +/**
>> + * xe_svm_range_get_pages() - Get pages for a SVM range
>> + * @vm: Pointer to the struct xe_vm
>> + * @range: Pointer to the xe SVM range structure
>> + * @ctx: GPU SVM context
>> + *
>> + * This function gets pages for a SVM range and ensures they are mapped for
>> + * DMA access. In case of failure with -EOPNOTSUPP, it evicts the range.
>> + *
>> + * Return: 0 on success, negative error code on failure.
>> + */
>> +int xe_svm_range_get_pages(struct xe_vm *vm, struct xe_svm_range *range,
>> +			   struct drm_gpusvm_ctx *ctx)
>> +{
>> +	int err = 0;
>> +
>> +	err = drm_gpusvm_range_get_pages(&vm->svm.gpusvm, &range->base, ctx);
>> +	if (err == -EOPNOTSUPP) {
>> +		range_debug(range, "PAGE FAULT - EVICT PAGES");
>> +		drm_gpusvm_range_evict(&vm->svm.gpusvm, &range->base);
>> +	}
>> +
>> +	return err;
>> +}
>> +
>>   #if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
>>   static struct drm_pagemap_device_addr
>>   xe_drm_pagemap_device_map(struct drm_pagemap *dpagemap,
>> diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
>> index c8add37614ec..6bb358bf62ad 100644
>> --- a/drivers/gpu/drm/xe/xe_svm.h
>> +++ b/drivers/gpu/drm/xe/xe_svm.h
>> @@ -76,6 +76,12 @@ void xe_svm_range_debug(struct xe_svm_range *range, const char *operation);
>>   int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
>>   		      struct xe_svm_range *range,
>>   		      const struct drm_gpusvm_ctx *ctx);
>> +
>> +struct xe_svm_range *xe_svm_range_find_or_insert(struct xe_vm *vm, u64 addr,
>> +						 struct xe_vma *vma);
>> +
>> +int xe_svm_range_get_pages(struct xe_vm *vm, struct xe_svm_range *range,
>> +			   struct drm_gpusvm_ctx *ctx);
>>   #else
>>   static inline bool xe_svm_range_pages_valid(struct xe_svm_range *range)
>>   {
>> @@ -137,6 +143,20 @@ int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
>>   	return 0;
>>   }
>>   
>> +static inline
>> +struct xe_svm_range *xe_svm_range_find_or_insert(struct xe_vm *vm, u64 addr,
>> +						 struct xe_vma *vma)
>> +{
>> +	return ERR_PTR(-EINVAL);
>> +}
>> +
>> +static inline
>> +int xe_svm_range_get_pages(struct xe_vm *vm, struct xe_svm_range *range,
>> +			   struct drm_gpusvm_ctx *ctx)
>> +{
>> +	return -EINVAL;
>> +}
>> +
>>   #endif
>>   
>>   /**
>> -- 
>> 2.34.1
>>

