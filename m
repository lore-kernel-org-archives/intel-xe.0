Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6797CA101A
	for <intel-xe@archiver.kernel.org>; Fri, 30 Aug 2024 23:33:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 575E610E728;
	Fri, 30 Aug 2024 23:33:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fE/hs1r5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B82EF10E728
 for <Intel-Xe@lists.freedesktop.org>; Fri, 30 Aug 2024 23:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725060792; x=1756596792;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YWScN7xUW8HcUAMxPFwsKqh2tAsn9D/B7gAF7oFjuqQ=;
 b=fE/hs1r5BcCjikShkPjcdGH17fmkmoVH2LS4VFpoZO9CnKsX5WhGcd+N
 9cjx8ZDr0asxLuCXfik8+dAi4v4sonCu0u86KYRT1LbQ3dqwzdf5uYGmj
 ea0yON5HZXb9MFQCmlM6/MJ1cNRQH0T8NeSs+f2QKZCH9qIoAt36lTyAm
 Cmq82FPtHXsxDg5CuYVTWO/PxZlIyWnA2ChHzR7djCOL1NPvkYAb6a1Aj
 7aKlVt0vpN9L40p3KyX6FxeYv6dpZ6zZ82kJ80siMgEAaAXeMb3g3who2
 zAwm8xD5suHeUACH+UU/DAJ5Y9nciUrotkwVLg960/PFTvbwTd0XzWWH0 w==;
X-CSE-ConnectionGUID: gQvAwyO4Sf6Pcq169cL31A==
X-CSE-MsgGUID: 7iFJNXyQRQ2Yza1Gsizhkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11180"; a="23600295"
X-IronPort-AV: E=Sophos;i="6.10,190,1719903600"; d="scan'208";a="23600295"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2024 16:33:12 -0700
X-CSE-ConnectionGUID: WJv/9aezRb6bcZLKlEscXQ==
X-CSE-MsgGUID: leww6yMtTtuN2exywD4aoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,190,1719903600"; d="scan'208";a="68839038"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Aug 2024 16:33:12 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 30 Aug 2024 16:33:11 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 30 Aug 2024 16:33:11 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 30 Aug 2024 16:33:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KakimCgW3pjAli+28pL4TjaIq6SxdWynSDLM/Sb/XuRjyWjwL4lOHSFjZqph5aRR7Eb6ido8z1w2MHBVrJJEoWYtpRJEM6jCl4a8G62MFnq4YFQfdO2lqnUrncfNcAzuT8QPzxH1WhqBolXFQndTwTgyDlOJju//Qgl0sBfiNVVtleRBWtkV5TQgMghybu5INatITcNw+PnY6DsjF81t0J+Wdhvc6SeTpTT4xGuIzWZbvLQST0Ux4D3z5ifHpSOy6QfTb1p+HpBj3NPliHOnjGg3f0POvX5mgJ0ode4Nx+K45UODuIgilKuqUnE16UOQ49zBCJH5mxkjMx+8t32Acw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0/vx+a39Vjw5/g4VEqzV/WGoyC/oHivRMqox4qd4aC0=;
 b=U0cIt0mMUMqjPUQKiLJZxP5qLdHtvptvwGuQ4KM+joKIR/fYQExAZ/tMiymFP1iKvhk2Q7sYFB1RQMbQ0qkPzTD+91DAUgN3kmINgOsrBcXIf5N0RaLIyj9BOMul+5Fw+RjKma4MZLfZpDRm3EpbCpkJKr/IcbNJ8V8jzbo0347tNCK+KVRvLRP18fcvHE3op+LjGXpnttw5pIjp5X6VCO/8CThujRkAQS5PPa0T7W18e+sNPNHbiKkA/I2epvNZHIig+u01WCAtZDO7tTGfLpX/UfRbqbL2dhyro8pNPxe7wo+0i6KhefFTFedBPL3iRVFLnS7PJbJ43nq60YlgzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by BL3PR11MB6409.namprd11.prod.outlook.com (2603:10b6:208:3b8::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.20; Fri, 30 Aug
 2024 23:33:03 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%7]) with mapi id 15.20.7897.027; Fri, 30 Aug 2024
 23:33:03 +0000
Message-ID: <9c45f3d1-8d65-4d15-807e-5bb085f3c109@intel.com>
Date: Fri, 30 Aug 2024 16:33:00 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/9] drm/xe: Add ASCII85 dump helper function
To: Matthew Brost <matthew.brost@intel.com>
CC: <Intel-Xe@lists.freedesktop.org>
References: <20240830062310.3450387-1-John.C.Harrison@Intel.com>
 <20240830062310.3450387-3-John.C.Harrison@Intel.com>
 <ZtJAC9l/gaCnBPdA@DUT025-TGLU.fm.intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <ZtJAC9l/gaCnBPdA@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR05CA0095.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::36) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|BL3PR11MB6409:EE_
X-MS-Office365-Filtering-Correlation-Id: 056f3dfb-ba92-4571-d4c0-08dcc94c1792
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eXljb1RGUlh4bmZ6Q0tmTzlZWnZJVjdkSnMwRVhlNU1uYkZucElQRVFYZHpm?=
 =?utf-8?B?Vll1aHhXdi9SRWtuaEZFYjJtK3M4OEZYTEY3M2NsNUp0MGtBdUJrTG4yWVcx?=
 =?utf-8?B?NnVLSE5LS3BsdmRjeDdLbmlDeEVNNGFuaXppdURRbHgxUllEYTVjb1JXalB3?=
 =?utf-8?B?aHJieFBlemp4eWNYU2R2VUhXeW1KNW9MU2JHSGhheGRwdmNMcThwT25ZdkE0?=
 =?utf-8?B?enVDVnM4RitjM096TWYvZVpyRkVvaXFKTDFzOUQ3ZStzOWljamswS0hiOGM1?=
 =?utf-8?B?dlBuUHRJUEZrd1hnNUhvWDBqQXlMUkl1TFBaNEJtcEw3S1d1NXpNVFBKU3Nj?=
 =?utf-8?B?R25GOHBYTVFYMVljcG1Vbyt0YnQ5cjg2a1hwME5lQzY2U0J2TDlwenp6emhZ?=
 =?utf-8?B?SjUwTXIycmJwemp2QnVLd0MzRzZvbmtwcSsxcWFwSGttaUUrRmNrdFZVWVlo?=
 =?utf-8?B?T3hNanRyMXRaaytYNmczV3R3aXNrOGVoQSs1YUZQZ1MvenlXQi8rbnZnQmxl?=
 =?utf-8?B?WFkwYm0rRG9Xb3VnMnlHQU94THY5UUxwbnh2M1ZOcm0wMXVobFJuT0FFQVlU?=
 =?utf-8?B?aVhoblZiaDNrS2Q1VkQvOFJZMVlaU3hzdTVmVzhUdHd1TEtldGEyOGQwZ3d5?=
 =?utf-8?B?WUg4eW8rY1BSV3BqcTQ5aGEvUEtvUzZBNjVxWDZyMXhLeVFpTHNGVnRKVkZT?=
 =?utf-8?B?ck4yaW42Snh5eUU2a1lTM0RweXp3WEZIR2ZMSzhLY21SQ3p1bTNJZFRFUG1J?=
 =?utf-8?B?UXNHY1JLMjg4MVZEQi9ETTNHNEF4UktYeTZMSU1QYjV6b0RVZmJmbUM1aE1D?=
 =?utf-8?B?YWdnbmhESXQ2dS9aTEJYS01EN3p4KytGbGc5YmtsL2ExZWRJanQ4VnZmM2ZQ?=
 =?utf-8?B?SG1jRUpESkpBOTJhUW5wRmMxSTVrMVRLQnpjY3Z3TTM1REd5T2dicnk5by81?=
 =?utf-8?B?SFhsV253d045V2ZwU1d1YzBJT3E0Ukx1WGJHRkJZczhOOUNPS05NY2NBRkEz?=
 =?utf-8?B?ay9XZlNocmNHUkZ0VlVIb29JbE02ZFRaN3UyT28wNUEwYVkycnA0Zi9aL2dZ?=
 =?utf-8?B?TzkyeVVLYnJMcWY4WmxwMFJ0TkFmeTd0OVM4c1lqTXdNd0VDQkJZVzVXOGxK?=
 =?utf-8?B?UXk4anpyVVBwcm5UV0crUWNQdnBMVWtBL01yNUxiTnFVOWZ0QmVWVHBLK21Z?=
 =?utf-8?B?dUxqUXNqOEZJUEhBcDBkYjJOWGgxMUxKdXJjOGNQVkpOTzF6K0pTQ3doa1N2?=
 =?utf-8?B?K29STHBaOER3ak5PYnhIazZTQThxSEZRRjFPdUJrQjhBc04zaDFrM05SUTR6?=
 =?utf-8?B?dU1xWktOMHZoWmtUbU9HMWJqb3FJaXBsZXgvTHg5eS9QYjdSV0tnUGlINThi?=
 =?utf-8?B?QVRNRFFXOVQyWXdlbElKR3ZMNFRYdm1EY21mbFBkb2F0c3NsZElnU0N2Vm5C?=
 =?utf-8?B?SnBWTTN6TWd1cWdVVUQyZFRYdGtLOW11RklHWE1CaWVpWlgxMzdqVWppZm9y?=
 =?utf-8?B?Vm5OUUVHR2U2VjRpUkJlTFZpTit3V3hpNzZEc3ZnS1B6SjF3STJaN3d5ZFZV?=
 =?utf-8?B?eC9xdVZWRXJXcWZvVFVwUStsbWd3bHgyVFJxVlZGazBFU2ZqWU1iUHdZUkhR?=
 =?utf-8?B?OVNMQ0NPUWNRWGFUL1FSTnBjR0lVMG14S1krTVVoL2JZVlZKRlJhUDJra3ph?=
 =?utf-8?B?Q0c5WjdFZFhVQlJQQlF5UklmaW5GNmxNY1ZOUHlHNU9aeU5weW00dlJoenM5?=
 =?utf-8?B?MEZtMWlOQzlOK2JNZTlzdi9lRnpYV0tvWVBvUXRlYmkxb08vemVDeWdHZERP?=
 =?utf-8?B?Y0FFNVZvNHZHOSs2YVpVZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UjdTajNyQ1MzalAveGUzOGVPTFIzWldlYmJ1WHMxd3RteG81ZnRGYngyVkM1?=
 =?utf-8?B?elRoV0VJL0FUR1pYUitVeTJzWTNEbzZGUE9kR0lNNmJHZkZLN09jb1J3akg3?=
 =?utf-8?B?b2RhSFptbDFoLytGNE5sUXVDRjFhdzltYm9wSktkdUcvNUFsb1psMk1McExX?=
 =?utf-8?B?NDNmdElIQ2lFaGJYTm0rRFRMYzFZZ01Ec3RGcndBUW56aVkxZTJESE5IZFdt?=
 =?utf-8?B?bzFYZHZiZUlwZzNGdHN3RllNWlNoNmozbVBSZW5FN1F3WUV0QnlhQXdlcHVo?=
 =?utf-8?B?ZHpydFYwRE04WmtEaldVZW83dWIyS2NRMzFUL2Q3RzRhWlJCUXd6Y2VpNjJz?=
 =?utf-8?B?S2NxS0lCS3VzUGN5SklLZWc5YzJmY3AwYXVqa0J5dDI0UDN6NzVNOXBhZGNF?=
 =?utf-8?B?NHBQVFhOYTBmREYzd2FDRlp0Y3E5K3dXdDlHbUd4R1VhYjJJMVlycmdUUmJJ?=
 =?utf-8?B?a2xacjJyTE9KNG54ek1JM0lZQzNZSVJJbmcrd0w2WnFYZ1FIQXVJeisxZHRP?=
 =?utf-8?B?Vk15MW9IemhuOXBQUC9GeFQwOVRwVnpYaFd6QkZYYVREd1lJZFIvQWt0bTlL?=
 =?utf-8?B?S2xNNUdScERrQU1aSVRJSkhCd3YwZlFtMFoyYXpMWGhCZUM5Qk9XMkE4c2VT?=
 =?utf-8?B?dHVVWC91VjQ3WXhPSlIvNU1ZQmQ3dFRNbTBXUjN3ZVRoQ3lKa2FqQlZQV1NV?=
 =?utf-8?B?TXJXVE9JSTAweElkWUhoTjhTS092UUNQUXc5cm5nRFdXS1Y3ZTlyNVp5ZVhG?=
 =?utf-8?B?cElDTjlwdXN6akxMNDdGbzBJRGlEUndibmZNU1VrNmMyWWFGWlBPb3JsYmRm?=
 =?utf-8?B?WHJUaTZrMEhnbG94alpvSStWa3g0QitqNUlaeFo4c0h0S1VSVzhGRXVSeFls?=
 =?utf-8?B?ZjRhU3phcVJ4NGlsRm1VMkpTZ2JPQmEvMzFWRjhWOS9ja0cxdEIzaUhhL1pt?=
 =?utf-8?B?OG5NWDIrbmR6Qy9Lc1lsb2M5eFhwbENJUkJHSkhWc3p1Mmc4S21oeEFtUWFI?=
 =?utf-8?B?eFdGSytpcGRqa0NsWktYUkowR2V1MExBdFoxNnRleXBwOGszNDdnR0lkUm1x?=
 =?utf-8?B?SFpBSHRLbTJ4OTkvc3ZpSkphM3RhcHVZMnRZT2NoQk90eHlRN3JLWlRpM1Fx?=
 =?utf-8?B?VERtMnYvMHc4bTZFRm1Ccm1tTVMvRkUzdnlaaUtkVVVwend5N3V5YVN3djlo?=
 =?utf-8?B?eDJxNlVONHE5d1lkaFZzc1ZaTXFVUFJseXVaU0d4ajhEY05aV04xaWhmeTBI?=
 =?utf-8?B?TzBiMWsrMCtmWlIxYUlFYmJQa0hXTkl6R2trN2xodHBpY0dtYmlLcUR3Nzly?=
 =?utf-8?B?TWp6c3Q1NGVZNkFrU0Vmc3pEZU1GRDJjREZXWU9pUFNSSXhEcEIxa0dsZmhm?=
 =?utf-8?B?NVpIUVRhdng1K2FqZllYTkpodGQwb3U4eUsxUUNESGMzaHZ4L0tpZFZBcXpQ?=
 =?utf-8?B?U0R3ckRqblZzRS9UekZSL0psc1RsQ210M2NBbW9ES2QrT3FXTGJKYzZ2WS9n?=
 =?utf-8?B?ZXBmUDZZWFRDSTM5Zk5QaUJPbEM4aGJ6dmYzUk5SVFdkbis4M2tUNXlzdTNG?=
 =?utf-8?B?TnZHUkRRdGpxNjI4UmtCYktQZWZYQUdVSTlieXZYbHdKbkFJQ2dpdVhlYVRh?=
 =?utf-8?B?T1pmaEgvK0xBcmF1WXBLSXBLZHNubDNGK1BKYzc2cVBBdXR2TjUvREg1OXk0?=
 =?utf-8?B?c3hKUVR6LzY3Wis0b0FhK3dhNkl0UU1DY0JGOFBhbERRbmJuYlhmMmVsTng4?=
 =?utf-8?B?YnhJTFFzUGJmaXBWbnhmV2RObjNWUmR0WWtka3E4Sm5Jcm1kaE55KzRwWnc1?=
 =?utf-8?B?Y2tRTU9hOWkzVmhqUUdhWmNsdlQ2Ym5IOFhpc1JVcTVFKytBZjFzM2FFbmUv?=
 =?utf-8?B?MUIxeHNlak83MVZnZFFjSGM2SmFPNlhHK3RYWEZSaHQrNllTRitOSXJrOEpy?=
 =?utf-8?B?VmZmQ1ZnTXZZL29CY1h2VHJZUTF2Rlk0WFl3aHpvenZkTTJCZ3dSWDVETVBZ?=
 =?utf-8?B?bDl3Vk5Id0dldURGNEpodGNpY3U3RmllZXVKNWJ4YnAyK3BkLzEwT21JOGk0?=
 =?utf-8?B?ZmRSYVVJK0dQZERSeTQ1dlYwVE9wMDd3bGJrM3djbmc0bnl4WFFEUjltTy93?=
 =?utf-8?B?MHhvY0RWT1V6NDJUWGJZaE44bzhmRlM0a0FVcEp5NU00NnJjSElKdHhEZ1lk?=
 =?utf-8?B?Y0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 056f3dfb-ba92-4571-d4c0-08dcc94c1792
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2024 23:33:03.1750 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hGCY8EYks3+l0mwFuVrV2r9vXVj9svIagmUbS0xE/Osk4qPuL/Ykg8PA+vfVk5jR6p6FBy3nnFAYUljkwsehOYCpmytXdnvlbfU9GzQ8rOE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6409
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

On 8/30/2024 14:56, Matthew Brost wrote:
> On Thu, Aug 29, 2024 at 11:23:03PM -0700, John.C.Harrison@Intel.com wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> There is a need to include the GuC log and other large binary objects
>> in core dumps and via dmesg. So add a helper for dumping to a printer
>> function via conversion to ASCII85 encoding.
>>
>> Another issue with dumping such a large buffer is that it can be slow,
>> especially if dumping to dmesg over a serial port. So add a yield to
>> prevent the 'task has been stuck for 120s' kernel hang check feature
>> from firing.
>>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_devcoredump.c | 76 +++++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_devcoredump.h |  5 ++
>>   2 files changed, 81 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
>> index bdb76e834e4c..eec7b89ab48b 100644
>> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
>> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
>> @@ -6,6 +6,7 @@
>>   #include "xe_devcoredump.h"
>>   #include "xe_devcoredump_types.h"
>>   
>> +#include <linux/ascii85.h>
>>   #include <linux/devcoredump.h>
>>   #include <generated/utsrelease.h>
>>   
>> @@ -310,3 +311,78 @@ int xe_devcoredump_init(struct xe_device *xe)
>>   }
>>   
>>   #endif
>> +
>> +/**
>> + * xe_print_blob_ascii85 - print a BLOB to some useful location in ASCII85
>> + *
>> + * The output is split to multiple lines because some print targets, e.g. dmesg
>> + * cannot handle arbitrarily long lines. Note also that printing to dmesg in
>> + * piece-meal fashion is not possible, each separate call to drm_puts() has a
>> + * line-feed automatically added! Therefore, the entire output line must be
>> + * constructed in a local buffer first, then printed in one atomic output call.
>> + *
>> + * There is also a scheduler yield call to prevent the 'task has been stuck for
>> + * 120s' kernel hang check feature from firing when printing to a slow target
>> + * such as dmesg over a serial port.
>> + *
>> + * TODO: Add compression prior to the ASCII85 encoding to shrink huge buffers down.
>> + *
>> + * @p: the printer object to output to
>> + * @blob: the Binary Large OBject to dump out
>> + * @offset: offset in bytes to skip from the front of the BLOB, must be a multiple of sizeof(u32)
>> + * @size: the size in bytes of the BLOB, must be a multiple of sizeof(u32)
>> + */
>> +void xe_print_blob_ascii85(struct drm_printer *p, const void *blob, size_t offset, size_t size)
>> +{
>> +	const u32 *blob32 = (const u32 *)blob;
>> +	char buff[ASCII85_BUFSZ], *line_buff;
>> +	size_t line_pos = 0;
>> +
>> +#define DMESG_MAX_LINE_LEN	800
>> +#define MIN_SPACE		(ASCII85_BUFSZ + 2)		/* 85 + "\n\0" */
>> +
>> +	if (size & 3)
>> +		drm_printf(p, "Size not word aligned: %zu", size);
>> +	if (offset & 3)
>> +		drm_printf(p, "Offset not word aligned: %zu", size);
>> +
>> +	line_buff = kzalloc(sizeof(DMESG_MAX_LINE_LEN), GFP_KERNEL);
>> +	if (IS_ERR(line_buff)) {
>> +		drm_printf(p, "Failed to allocate line buffer: %pe", line_buff);
>> +		return;
>> +	}
>> +
>> +	blob32 += offset / sizeof(*blob32);
>> +	size /= sizeof(*blob32);
>> +
>> +	while (size--) {
>> +		u32 val = *(blob32++);
>> +
>> +		strscpy(line_buff + line_pos, ascii85_encode(val, buff),
>> +			DMESG_MAX_LINE_LEN - line_pos);
>> +		line_pos += strlen(line_buff + line_pos);
>> +
>> +		if ((line_pos + MIN_SPACE) >= DMESG_MAX_LINE_LEN) {
>> +			line_buff[line_pos++] = '\n';
>> +			line_buff[line_pos++] = 0;
>> +
>> +			drm_puts(p, line_buff);
>> +
>> +			line_pos = 0;
>> +
>> +			/* Prevent 'stuck thread' time out errors */
>> +			cond_resched();
>> +		}
>> +	}
>> +
>> +	if (line_pos) {
>> +		line_buff[line_pos++] = '\n';
>> +		line_buff[line_pos++] = 0;
>> +
>> +		drm_puts(p, line_buff);
>> +	}
>> +
>> +	kfree(line_buff);
> Dive by comment kvfree per CI. Will try to plan sometime soon to give
Not for a kzalloc. That's just a kmalloc(GFP_ZERO) which means kfree. 
Although I think the IS_ERR test is not actually correct. It should just 
be testing for null. Not sure how that would result in the CI failure 
though.

John.

