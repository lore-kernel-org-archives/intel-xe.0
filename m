Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1DB9CCF9E3
	for <intel-xe@archiver.kernel.org>; Fri,  7 Nov 2025 07:48:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AFF310E02A;
	Fri,  7 Nov 2025 07:48:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h2oKjZ4w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4060710E02A
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Nov 2025 07:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762501724; x=1794037724;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=vNffwViQAHlX3rCEP52q6agC+EjGQBAC9VcuSQUfu8Y=;
 b=h2oKjZ4wUFI+PwUAwHaHNv6bZzJa+6sGd4wnggv6rKmSn3EKAIYUBkNY
 kKKY6vbBzcLHGswzkA5VzAUdw/eR3NCLPeBoTIhGqXUNd68gRA1j6Zt+y
 6nJV6YEDw6co/EP5WgTzDXiaubRr0pMWk+Y5/1dOPEkHzDyl55d9kgXv9
 4eh6UO4z0xB28nQO2S9vfQ5dJHoUDQtu64MB1mM5k6oiZxjhHUtUiIij4
 KR4xAeCqqrXjN+dcgW3EBsQ9srQSaCthtum564Trc9cRtpDQiLIBXtri1
 eXqfUT/596iOIG1mIplu4hasRaO9+iU6rRh2jBsH60sWLml9lJ3pUGtYO g==;
X-CSE-ConnectionGUID: fLIdOtCrRQukhORL3v1S8w==
X-CSE-MsgGUID: ubl4v58ASIuT2miaBuAKQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11605"; a="52215472"
X-IronPort-AV: E=Sophos;i="6.19,286,1754982000"; d="scan'208";a="52215472"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 23:48:44 -0800
X-CSE-ConnectionGUID: XyYwO+DtQ1eAGx4XMiYnqw==
X-CSE-MsgGUID: YoV+Rbr3QNO0eACMgAtgug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,286,1754982000"; d="scan'208";a="188413225"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 23:48:43 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 6 Nov 2025 23:48:43 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 6 Nov 2025 23:48:43 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.68) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 6 Nov 2025 23:48:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CpHm9KCflWx5bNxDjBc8h45edCpn0bE/VL/fj3vXLhbL5BF/7Ew4WvMiVB0ZDxJcd4pF1EHaqQuhAwfWVEE5ltx9p3YDlgZK8Uh94jv5klcWL/J7BuI7g3SqxE1dptKEQsBbwfX4t2yn4STAMFz3YeTP4EbkUMBkwV+HsCWCuxFhWOURF789UMDf6rhO3Eu0PbYePoGtsvVuScHk7XT1VEcjYUhXJnE9mqe7LuAQrP+rIX/NuYya7mv9qpsNRpg6hVMfdnx0FoP+2/O0/VOuT7z08UmonaIM1biAq1oGPczS6jFZpRrO8uxpGr/9UrSL/B3tsArzX+mGeqz6UuqFHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gWjnaIHzsj1/SiDY416L2oZZIVq9dOzua29GXz7yZJk=;
 b=iiG3W/qWpy18e7A0Y/UH1wsYUPmXWnLG6VXULL37BTXuNrAFu3sZLJSniespkF2bQkoz71KnQp5Z0WNiGVpT6WuFPAspFlOLTKiu5hWpo0MTmO6oAZgXOi6MbEaK4JEGJL/pw++8UE9I17wMK8Ldw5oxkkoaTaH3pThnZqHk/TSlr04zqBfjiQkpTxmTiSKqPPgfIMEK2weaKlZk/RJ/eGiZvgKEerJ6UcpXGoMZXxGdy6r+8eTQ5pC4eQZ0D9oTR0QuYpDp0QJZZROMYVVEUIDaG/Vk0F9xFNGEnOzpnLdCZLhCIwZtqOg0qSsbSifHfx8udpUEZizMI810HI7Mng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by SJ2PR11MB7546.namprd11.prod.outlook.com (2603:10b6:a03:4cc::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 07:48:40 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%5]) with mapi id 15.20.9298.007; Fri, 7 Nov 2025
 07:48:40 +0000
Date: Thu, 6 Nov 2025 23:48:36 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: "Lis, Tomasz" <tomasz.lis@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v2] drm/xe/vf: Start re-emission from first unsignaled
 job during VF migration
Message-ID: <aQ2kVCs94QjLECVQ@lstrano-desk.jf.intel.com>
References: <20251031201345.3015516-1-matthew.brost@intel.com>
 <9c179328-bc36-49c6-9147-869b9ce2f77b@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9c179328-bc36-49c6-9147-869b9ce2f77b@intel.com>
X-ClientProxiedBy: BY3PR04CA0009.namprd04.prod.outlook.com
 (2603:10b6:a03:217::14) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|SJ2PR11MB7546:EE_
X-MS-Office365-Filtering-Correlation-Id: 17dc119c-392e-4664-1d33-08de1dd210f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bS9wSU1TdytxUEdJSjJENDhSSFQrSnZNZGpIT1M1ZnByR1ZKcGdFQzJHV1BN?=
 =?utf-8?B?NzVaVGh3eEZoSzIzdm9QVnZRU2djdGt6MmZ5dnpzUFA1K1M5TkpLWFNrYmxH?=
 =?utf-8?B?b2hIdzdEMC9pMWs0L0VlQXhDRk1DaDBBRmZZQVB4dmJGdTZsc0VIN291a21S?=
 =?utf-8?B?NG55RFVReFduK2Q2SnNpM29keDRYNzczSzlSbTlxUmpXN2t5TDkxOTBQVHlK?=
 =?utf-8?B?QXV5WFhlSFRuWWdiMUxtRVYrZFFaNWtjU0hNZEVJby9pcXNHWlp1WWJiTnAx?=
 =?utf-8?B?UlFSeTREV1ZJZjYvb3RvbXlJS2FqL0FSV0V6SU52UGlnN1RmRFZDNGMwOTc0?=
 =?utf-8?B?L1hrM1JHNUdkUWNKTGpFTGhadGhodEJLQjFLY3RoV0tQb1RIK1d0OHV1Qmg4?=
 =?utf-8?B?enFJNWNvdFFwcUZaWjNXT0hQTzh5WUh0UnM2L1dKdkRGZW9LVlVENTdnRTBC?=
 =?utf-8?B?alZ2cno4OHplaU1xbG9SUGplYnBUNnNSU2FzRERtOS9GQ0xyb1gxNEEwVTNE?=
 =?utf-8?B?YlpNZFpUclM4LzZkS1paaHBZVUNIU3k1dHY4UGdqVGFyTTRTbHhyOWd5WDU1?=
 =?utf-8?B?Y3o5eHgwOTJncW8rUUtXelFCQXhzaVdJemZVVkV3UjJPTmV4VUdEK2t1NWxk?=
 =?utf-8?B?emNpMFdqRlFSNHJJR0RFNitiUVR3Zzg3Vzd2V0Ztd0hvVmFIMk1CME1sVnVJ?=
 =?utf-8?B?UzNMb1RRK0NQajkySGhQQmQvVEdrTXVuWWZMendvSU5Kb1VDa0hHOWl3aVFF?=
 =?utf-8?B?WENPalloeEVpODVkQ2JEaTNjYTFhc2JuYks0eWxCY2lZM2oycy96bTcwNUxj?=
 =?utf-8?B?MmlWRU9PdjBlcDhSR3ZVRGRyZzJKT3I0djVnMFNrU2FkV1NWalkzSE0zbWpX?=
 =?utf-8?B?QkVsSERrd3lobk8rU04vVDE2eDJLVWdwanRnWC9palVFUTY1bGlIUXdqdHVj?=
 =?utf-8?B?UUY1cTV1OHBub0MrdUhBSFVHV1doc2Rrd0VnZXBiamc0YXRTdGFUck9ja3p5?=
 =?utf-8?B?Z05xK0JqN1ZtL3l3dytlY3JTb0lzYVovOGwrRStwQVlrcEIwb1R5T0w1OE02?=
 =?utf-8?B?RTllQ2JiNmxRVVgzZDVNRGtQS0FQcDhoQTdFaHYyZFYrYVdSR3VzR1l5VTFl?=
 =?utf-8?B?NGlxMzU0VDUzbnB2amQ1c0tqWlZPdm5JM0QvV05Ia3hCZy9jOGRZR1hzOG0v?=
 =?utf-8?B?TU1FRG5GUzNMekdJb05UeGx5L0dqY053Y0JMcHIrckZ0Y21RclRKYlVkd2s3?=
 =?utf-8?B?U3lTVTh5VHI0VEpLOUZKN3ZOMU9sUlZlbE45QTZuR3hFUlVSVUFkdVQ5S0VW?=
 =?utf-8?B?ZVk2UGVITjFRQ2JCYmIzRDd0VHllZ0ZYUTNoOS9tMW9aU2w1V0tCRnRxZkJ2?=
 =?utf-8?B?MXl3eWFWb0tKUVdmMTZIMWtTd01FTUVua0ZxMFRkZmczKzV2b00vcW1NVWpM?=
 =?utf-8?B?S2VFRko2ZmdmNzV6eS8wTzJsVVpROTEyUjhxUzE4ck5VbnZHL1A2bnZaK2x2?=
 =?utf-8?B?U2VMUWwwSXBHbmJqWkZ0Z0RuT24rL1JZaTEyVlRnT3hMZ3BjRzZrTE1raVM2?=
 =?utf-8?B?eGZVYTV2L09zZVdtUkpLSnBwWjFvQkxmaFdwQnBnUEFTaktYcVBuUlZWYXor?=
 =?utf-8?B?cENpYmlrdUNodlpmMnlER08rMjZweE5KdlZNVXg2QnhESU5aMWRYMk5uNXhS?=
 =?utf-8?B?cU9Ecm0zVlVSdTE5MDlGVm9SeTVDMmxacjBZeUw1SDJrVThqMjI0SngrMjZm?=
 =?utf-8?B?dmJxMldLMk9TVjdFckNMVmhCcUNMZitCRENKY1Qvb2JJV1hib3Fkc0hVQ0pB?=
 =?utf-8?B?WlhDNko0Z09LRm1oZmdoMGpmZlZvSFBzNUdROXZxNXlIcVo5WlNuc2U1dTJO?=
 =?utf-8?B?UjBHd0VxQmRlSngwWHhRRUVmSzhsYVV4amNKeFpMdzZwR1E9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OFdRV2dXY2FNSnpCcWFuclhlYyt5Vy9VSUcvb3paZXpQTm1DN3dvUVFGZkZu?=
 =?utf-8?B?bWM2dXNINlNuSlF5YmNrQmtleXd0ejlZN2dCUkQxOGk0QW00a0NBZEJVSE5P?=
 =?utf-8?B?ejMvbUFXa1poN0JrUGJpSnBLWEd6akdRNE11RTM5ZURjUll5S0VCSGNNOHlD?=
 =?utf-8?B?eFdzdWFvQmkxV1NaU1ZESWlvWnhsc2FmKzgreE9iQWxQWk5wRGUrQXNVS280?=
 =?utf-8?B?NitXMEdZT25Zak00U2R6N2VnbnB0YXhTVEl5NUZDUnZIMnVnRDhOWDlJcEtN?=
 =?utf-8?B?b1l0WnNqcitJSFlIYmljU08xdmVxRnhzRVoxTE80eFdyZGRPOW1ZOGE1dklD?=
 =?utf-8?B?dDhpbjdPOG1KZDZ2Q2lHcTBKbFkxWHRqKzZ6QTJXbWhmZG1vNmVOUjVZT3d4?=
 =?utf-8?B?TFRTczNMNkpGbXNqdUdBM0FkbUdiRE1jRzNsTys4Nk4ycnZPRFA2cWN0eXM0?=
 =?utf-8?B?QWF5YWE3eG5LWjZNTThrMXRxTm5NaVg5SEkveC9NeHM2d3ZrRkdQaTZMRjEy?=
 =?utf-8?B?Mkc2bmRReXRlL1Rxc1FVNlRqbFlVc3NwekZ4RVBYVGdZMXpucHUxZ3FhcjlL?=
 =?utf-8?B?NGNkejdoK0lNL2cxQnc0SWNYd1NlaXJCRndoY1RMNkRJa203Q0xDSkRlUjZH?=
 =?utf-8?B?SEpjTkUrMUUvK291UEdwdHRYRnhGdWgvbGFVamFQSU9oekZyUEU1dmRCTFZt?=
 =?utf-8?B?eGZZaWRta1pqSE16SFpDYVcrK1BNVUw3WFlXTWdncmIyWnByWmpNOWtGUXhZ?=
 =?utf-8?B?YWt5Qjh2c1h6aG5tS1hoTWdjS3RRSkZsZnhnL0d5M1FSR2wvUmFYaUFNaTR2?=
 =?utf-8?B?WjVSNU00L0k4U1FTbE9JWFR6bncydFZTU3lKL0EraFFrU2gvYUtiMm9UUDFo?=
 =?utf-8?B?OGFvbS9pa0FnYzk1SHlxeGw4SDZSd21qcnNRSHl1cUJhY2EyandTWTdSYUw2?=
 =?utf-8?B?NHlDUEhzWUYrQU1zVkhQN3RrUjlLVVAvUUNPUWtGUmg0WTRLdGwwV0VUZ0dj?=
 =?utf-8?B?QUswRGgwRFhiaDQ1N0R1TENER0RvVlRXNnNSdlpnejBLS2xUMDUydkc5c2J1?=
 =?utf-8?B?a254ZVZ4M2hvNWFBTGhJMG1qTnhyWVk4MTNRU2NZaDlNYmRYcXlYQUtCWURX?=
 =?utf-8?B?Rlg4aWRqSFYvWGxGSy9xN1YvYXhZaUpJZ0daenBPZitEcUQvRWkrQUtUaXMz?=
 =?utf-8?B?ZXp1aGJ4TXgzakpaaVgrN1dEZmlGY1NFanBFcUlHc3h6WGN3WUxQUkNYdVV5?=
 =?utf-8?B?eStLelBWZVpwcDhJU3cvblRpSkZzUzV6NWdMZUF3bWkrWVBqVUFzTm40dW91?=
 =?utf-8?B?NFFPSHlENE1IcDFkTXdYMDZ6RTJIVlJyRzNNcUxacG9KQTB5ZnN2YmJGSHlZ?=
 =?utf-8?B?dlNpNnNOQkhmdWNNSEtwdkhWTXBiYkNianFnYUpjbXJZUSthaFFTd2p4aDhV?=
 =?utf-8?B?dDBvYTVoUHRwS0dFOXNBeklKeUM4VUhkUnJ0ZU9YRGI3RXJPMEhuUUhJVTRm?=
 =?utf-8?B?SytrL0huV0NSMWFFTmtNWFRXZHdBVlkvbVdWTFRhVGZCTWM1ZTg0MUVabnl6?=
 =?utf-8?B?U0FRdlhKdjlpRDFOQndGa3N3SkM4dTBiWWx4VHhrNVhZaTVxZVlMSzBPT1JW?=
 =?utf-8?B?djk4ZGZuSWY5TGtSaDJQdGNBc2p3WXAvM1Bzc3Z2KzgyanQrT3pIeE9LT21t?=
 =?utf-8?B?NlNCeGgxYXhkRDhMd1A0YWx1aHZ3M09IQ3RabWdFd0JNanZGUEsvRjlnbkV0?=
 =?utf-8?B?dTJEYjlLeU1XczFtcTVJQlVnSnZrSmUvWUtKTmxrL09Ecnp3Q1kzTk8valRw?=
 =?utf-8?B?Q2x1STN4OWhsRmIxR01FVVYwNi9jM1Q1NDU1RTJ4RVUzMEtxVDA4VGRacTlk?=
 =?utf-8?B?SmIydVhBU3ZJTzE4LzN0TW9VQTN5dXN5cDlaNDJRdDRhMXJrbGQrYVpqKzh1?=
 =?utf-8?B?R0xNTmtnOFVVT0FDbExCS3FnSjVSRU5QVFJjZWxnMEJWdk5tR0dXUThGVDFn?=
 =?utf-8?B?Z2VBRlFjUXRrcE0ycVMrSlhlVXlOenNyTVkzNTdac05yVVQrYm5XMlpjckxs?=
 =?utf-8?B?TUIwZHQwL3lpYm1NTmtwVXlUeUNsSElCRm15c1RFTGp0dUhkYjlsTTFWWWxG?=
 =?utf-8?B?dDBmb1BvZDhlWEpQdlZwczdlSUtlcXJIVnQrOUdwR0VHWjBVcEFLcmV6aUh3?=
 =?utf-8?B?NWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 17dc119c-392e-4664-1d33-08de1dd210f4
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 07:48:40.1694 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: STaAXiXv8MnLvOYUTmKh/NUd6WbwisOFnuOXzJNIYwmjCz+fWRk36uLRrYlf+1kddgdt70Mv7wHAUXSFj/A7GQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7546
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

On Sat, Nov 01, 2025 at 02:33:07AM +0100, Lis, Tomasz wrote:
> 
> On 10/31/2025 9:13 PM, Matthew Brost wrote:
> > The LRC software ring tail is reset to the first unsignaled pending
> > job's head.
> > 
> > Fix the re-emission logic to begin submitting from the first unsignaled
> > job detected, rather than scanning all pending jobs, which can cause
> > imbalance.
> > 
> > v2:
> >   - Include missing local changes
> > 
> > Fixes: c25c1010df88 ("drm/xe/vf: Replay GuC submission state on pause / unpause")
> > Signed-off-by: Matthew Brost<matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_gpu_scheduler.h |  5 +++--
> >   drivers/gpu/drm/xe/xe_guc_submit.c    | 19 +++++++++++--------
> >   2 files changed, 14 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.h b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> > index 9955397aaaa9..357afaec68d7 100644
> > --- a/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> > +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> > @@ -54,13 +54,14 @@ static inline void xe_sched_tdr_queue_imm(struct xe_gpu_scheduler *sched)
> >   static inline void xe_sched_resubmit_jobs(struct xe_gpu_scheduler *sched)
> >   {
> >   	struct drm_sched_job *s_job;
> > +	bool skip_emit = false;
> >   	list_for_each_entry(s_job, &sched->base.pending_list, list) {
> >   		struct drm_sched_fence *s_fence = s_job->s_fence;
> >   		struct dma_fence *hw_fence = s_fence->parent;
> > -		if (to_xe_sched_job(s_job)->skip_emit ||
> > -		    (hw_fence && !dma_fence_is_signaled(hw_fence)))
> > +		skip_emit |= to_xe_sched_job(s_job)->skip_emit;
> > +		if (skip_emit || (hw_fence && !dma_fence_is_signaled(hw_fence)))
> 
> This looks ok, but what is the mechanism which could lead to a job after the
> first  `skip_emit=1` job to have the `skip_emit` flag lifted?
> 

This shouldn't be possible with the current code, since we're checking
hw_fence. If we were relying on the software fence (i.e., the job's
finished fence), the state wouldn't be stable. I think our eventually
the is goal is to use the software fence [1] to avoid DRM scheduler's
violations, so defensively / future proofed coded here.

[1] https://patchwork.freedesktop.org/series/155314/

> Wouldn't the only possibility be that jobs were executed out of order?
>
> >   			sched->base.ops->run_job(s_job);
> >   	}
> >   }
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index d4ffdb71ef3d..f25b71aca498 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -2152,6 +2152,8 @@ static void guc_exec_queue_pause(struct xe_guc *guc, struct xe_exec_queue *q)
> >   	job = xe_sched_first_pending_job(sched);
> >   	if (job) {
> > +		job->skip_emit = true;
> > +
> >   		/*
> >   		 * Adjust software tail so jobs submitted overwrite previous
> >   		 * position in ring buffer with new GGTT addresses.
> > @@ -2241,17 +2243,18 @@ static void guc_exec_queue_unpause_prepare(struct xe_guc *guc,
> >   					   struct xe_exec_queue *q)
> >   {
> >   	struct xe_gpu_scheduler *sched = &q->guc->sched;
> > -	struct drm_sched_job *s_job;
> >   	struct xe_sched_job *job = NULL;
> > +	bool skip_emit = false;
> > -	list_for_each_entry(s_job, &sched->base.pending_list, list) {
> > -		job = to_xe_sched_job(s_job);
> > -
> > -		xe_gt_dbg(guc_to_gt(guc), "Replay JOB - guc_id=%d, seqno=%d",
> > -			  q->guc->id, xe_sched_job_seqno(job));
> > +	list_for_each_entry(job, &sched->base.pending_list, drm.list) {
> > +		skip_emit |= job->skip_emit;
> 
> All emitted jobs have the skip_emit set, unless their EQ got submitted to
> GuC which clears it, but if it got unsubmitted without finishing then the
> flag is raised again.
> 
> So this does seem to select unfinished jobs.
> 
> Though this introduces an assertion that within Command Streamer ring area
> of a job, there are no GGTT references between seqno increment and end of
> the job commands. Maybe worth commenting in code that we're working on that
> assumption? Example issue would be if someone introduces saving some kind of
> metrics there.
> 
> (this assumption was in power before this patch too, but now as we're
> skipping fixups for finished jobs still in pending list, it becomes more
> important)
> 
> Also we're emitting jobs which have a flag names "skip_emit" set. This
> disconnect needs a comment too.
> 

I am not following this comment.

The idea is that in guc_exec_queue_pause, we set skip_emit—this acts as
a marker to iterate over and resubmit jobs regardless of other
conditions. As I mentioned, if this marker were based on a software
fence, the state could change between guc_exec_queue_pause and
guc_exec_queue_unpause_prepare. The current code uses the hardware
fence, but that could change between pause / unpause too.

We need to keep the iteration consistent because it also affects the KMD
software state. Even if a job signals during this flow, there's no issue
with the hardware; the key is maintaining a consistent software state
throughout the iteration phases: pause, unpause_prepare, and unpause.

Matt

> -Tomasz
> 
> > +		if (skip_emit) {
> > +			xe_gt_dbg(guc_to_gt(guc), "Replay JOB - guc_id=%d, seqno=%d",
> > +				  q->guc->id, xe_sched_job_seqno(job));
> > -		q->ring_ops->emit_job(job);
> > -		job->skip_emit = true;
> > +			q->ring_ops->emit_job(job);
> > +			job->skip_emit = true;
> > +		}
> >   	}
> >   	if (job)
