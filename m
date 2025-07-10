Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A9ABC83F17
	for <intel-xe@archiver.kernel.org>; Thu, 10 Jul 2025 10:45:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42AD810E211;
	Thu, 10 Jul 2025 10:45:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W7nqEPtp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8304010E211
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Jul 2025 10:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752144338; x=1783680338;
 h=message-id:date:cc:subject:to:references:from:
 in-reply-to:mime-version;
 bh=sgLuY90vGByXt9C0P5DxvforKxgB3jc0QGdJ760SOfY=;
 b=W7nqEPtpfyVrfZVLI4D5Ix3MPPmF1mk2fWes0qpUpKr9fKUHOCjvXIVd
 wHb3+tIZ4q2Fjj5ecyD32LAyJQuzPv84+eJO8jpa4qb8lgjkraZ7NP7Qj
 ao/0ji1lEYsI2ykl7V1NKl2YXlWD3YXf8fmyPYxzowu9MNoXju1jYrLRy
 efQmAYNjTwgNO3JizDKYs/4jHsT6vkvto7XxN+zNrmfRrixAs1uZBYGNp
 V45rAaCadiAp0bMx3W6xtUXPwcYwi97mFyjqGd6MvdtT8/S+B4z8Kp8ou
 SqM5/1iiuce9lze+qwxPCmvuBzXFeCrubK0uhH3OOt6StB0mJIlcuutRO A==;
X-CSE-ConnectionGUID: WkWPD3rSTamZeSBy9AfLIQ==
X-CSE-MsgGUID: NGowMfFzRWCe9zWFaaCoSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="58187818"
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; d="scan'208,217";a="58187818"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 03:45:38 -0700
X-CSE-ConnectionGUID: hsd8D9CoRPqd+DnQXzIqAQ==
X-CSE-MsgGUID: 6jm8v1FUShGd0r4zwYN6IQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; 
 d="scan'208,217";a="193246015"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 03:45:38 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 03:45:37 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 10 Jul 2025 03:45:37 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.63)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 03:45:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iZJ4FqITDdg1AaS5NFQ7lmUTOIHhp/Dz0sOSXGPYDjvpNbvfI5ZQ5aAq7eCGLjgjBukYgAd1IhJ9fitsmzE8uhYJhiQ0Xdmgpj3BdWog0LfEB5S35vlra351uh1AMcON2hxVHUm0RBr2G+aHsqGv/uLakfv130m8/r1LOabyozQYwiSHC49upe3+btWKfYshpmxgLJoTAIzCXiBY8gkwzHfW/qOH8B0Y5Kd1+2wCpWWlQhp78Gaaa5GYvgDMpCqEhBlpWHZtu+TqiuMRftdNsEYWwGEDBK1Gxzt+XypKard3S/xA8nepjS6xQ6RtSDATsc12eHAOT49jp3Jgv2uCNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BMnDX7wlDiXZ25vRMsvMrMqLfCF0tiTz4I++WHmMI20=;
 b=pUsyQnwqeL20uSKA7VIScSTRKTvc6Vds7vYBPTzeyWXQUv7nVdVMn/tJjWFBPtRuYZPjxhPxCCpJHkhmXFvMduTf/XvYBBj7AHa3O15pDFV81cNfZ+ndVosqwd7riY7rK/TlYNLmoduXcfqZTeaUgfWjhZwHpK9hgAgJaTnDIlGKvM2lV64z4vp0sKSLgj4cVGEpZCZ2edL7avBtVd0HQEeiRznpD3Iac4MDqvgYrw1z8zdazZ0CPxmRyVt5UNkR1O4H234MqA1mO8he7yGXBg75GALQ5ts2UBuESPUB0gT6Br2r+gqTuJo+Oz9EKw77U97LjKCUGB3kRYelr6HUCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by CYXPR11MB8689.namprd11.prod.outlook.com (2603:10b6:930:d8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.25; Thu, 10 Jul
 2025 10:45:07 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541%5]) with mapi id 15.20.8901.024; Thu, 10 Jul 2025
 10:45:07 +0000
Content-Type: multipart/alternative;
 boundary="------------cq27100qV1dUJ2fr4q0dvrfQ"
Message-ID: <430401fa-0684-4096-9bc3-d982e9e0e3a3@intel.com>
Date: Thu, 10 Jul 2025 16:14:59 +0530
User-Agent: Mozilla Thunderbird
CC: <satyanarayana.k.v.p@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH v2 2/2] drm/xe/sriov: Mark BMG as SR-IOV capable
To: Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20250710103040.375610-1-jakub1.kolakowski@intel.com>
 <20250710103040.375610-3-jakub1.kolakowski@intel.com>
Content-Language: en-US
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
In-Reply-To: <20250710103040.375610-3-jakub1.kolakowski@intel.com>
X-ClientProxiedBy: MAXPR01CA0099.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::17) To LV3PR11MB8695.namprd11.prod.outlook.com
 (2603:10b6:408:211::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8695:EE_|CYXPR11MB8689:EE_
X-MS-Office365-Filtering-Correlation-Id: f0913cff-2c6b-4bc1-3e0e-08ddbf9ed604
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZjBOR2wzSmdRSW5EUUZqKy9QSG1KYVRVeFhmMXJOMU9TZUlZTVJEYmxmeFl4?=
 =?utf-8?B?RU1TRU5kby9nUXU4ODh1dWk0Nzg0ZncvNEs0Tzdhd1dZUS9PY0k4NmNyQnBu?=
 =?utf-8?B?NWJTaHRPOFphbC9ZMys1cm5ibjk4eUhwN25jNzN1ejJ2VFpEUms3NzZCcXgz?=
 =?utf-8?B?Qk1OK0FySHlQSUZYNUFsVE1Cby9ITExGeUNNZmM1UXNZN0pXcDVLekFmeitt?=
 =?utf-8?B?VjdMTHpiekFWU1pxamJEdTRmbGJLdUdSQ0NXbExGNm94WUFRYkVHOVdWWHRk?=
 =?utf-8?B?N012NjBjaGE0bUJuTlZ2TzlKYnArY2lsdlVYOFo0SkpBNGVuLzY4SmdOaWlh?=
 =?utf-8?B?eTN4MnFjSkxtUGM2bGxPQ01uQndma0lnc0ZzaHl2aGU5a0ZCeUc4Q09UbzBR?=
 =?utf-8?B?YnpNT2hLL1F5WFZyTWdBWVUyNkJ0TC94SGtkM29JUU81aXJicG84WnBUS0pw?=
 =?utf-8?B?d2hhYWdYR0cyZ0N0aDJMZU5hWGVyUEowcUxnc0lxY0x1c05pSHh2MjN6M0xR?=
 =?utf-8?B?VjZSK2JuWVNHenI0eTFHNjRrbmYxVVdTUEZhMkFyOWc5VFZqZGh1ckYyUFNB?=
 =?utf-8?B?NDlTTEVqMURKL0ovdUlsMVJud2ZrUFZaZ1NObTFJZlVoT2swWFVWamZxVTFL?=
 =?utf-8?B?YWZ6MVBjU0oyUVplaVVlL3gxQUVmV2wzTkFuME1qNkFsNnBNdy9xTnhTZ1Np?=
 =?utf-8?B?eXdITGdoYmVuSVFEL3dLMExXWmVkOVhmVEJpSU1DT1k3M3hGWkl1WkEzeGJP?=
 =?utf-8?B?Wnc4eU9qQ1VNWEZuWitRY1hCczdSVGFabGlMZjlOWUQwbXZOeHBvWXZ3aWpx?=
 =?utf-8?B?VE9wMnI4bEUvMlVmQmtmcEtTME5yNTQzYjU5Z3JwWml2NVkyMWUzenY1V3c2?=
 =?utf-8?B?MVR6c0FqTTE2dXVvdW5HbHUwRzBpeDhnWit0MXZQam1paHB6Mkc2UG9IQlFH?=
 =?utf-8?B?cmhTTDFtSHBxdEM0bjFqUHRTQ1FmZitSZ2NIZkZRaWZkWTV5bUp0MFFVeEQ4?=
 =?utf-8?B?Mk5LTnc1TnlUdS8wRGI5V0VjZW5ET2M2Wm9adlFwcHBONDhTcDNvb3JDTzNw?=
 =?utf-8?B?eUdVaXNNdkN6cmdBa3RWdU9oUzUxRTAzTng2UUJwZENPWE1BV016VldaVFEx?=
 =?utf-8?B?Njd1eWhXczFNRi9XMWUxRXlZZTlqWG9POTlWWUpWV3NSRDVxd0Y2TllaNXNr?=
 =?utf-8?B?ekNweHJkY3lhQVZZOVhDS1Nubk5aWTdpWWZhUFZxaWFCV0hFbm90RkRoTktk?=
 =?utf-8?B?RHpzM2hrWGpyd2QxWHI4NTZUaDBKeURTMkFxNHh5TnQvU1ZFcG15VFZUYjhD?=
 =?utf-8?B?SkM2U2Z1N0xDdTYzcHJTTEJJdkRaWEx1OGFOb1czTXowQW5qRGYzUktaeXBD?=
 =?utf-8?B?WXprRzBZWlZBUXdZZVgycHZtb0VpMkt2c0hYTHFBUVdiNm1rNnJvZlNHZ3Z1?=
 =?utf-8?B?ZU9ud0ZkaC9lUmo0a056QzQ4dDJ2RVpXaktSNzJSck4rNWwzWWpQSkhyMmxp?=
 =?utf-8?B?R0xtVkNPSXFHZFJ3eUJXd1RQS0xMVVpFbTlFTTVqc3JqeDBPRDJwZUZFWlJa?=
 =?utf-8?B?ci9PeFhSYlR0ZndGMk5ONXNEYmNvWG9zVDZObWl4a1c4MHJqdnFQdzBFZnY3?=
 =?utf-8?B?bGwrOEZCekRkb2ttelZ2UzU5d2xEUEtFVTcvc2s2OU1UdGI5djE2bGlVb1Ax?=
 =?utf-8?B?WndvajdjOTdzUmFvUlRjM28yRDFJQnlneTJtYjJRSWcwakc0NDIzV3d4eUdL?=
 =?utf-8?B?WHNMTGk3ZTJ6OStiaFBTWE1FZTNIMmJwRGF3R3k1elNFQytiWVlsa0xSVTM0?=
 =?utf-8?B?aCtsQnhvT0w2NG1XRndPaUV4NC80N3J4aVlGYWFtUUhXMjh1bEgwdTJqNHk0?=
 =?utf-8?B?K29jcmcxaXBvNlhwVkNkUDR0UjFDeC9aUS9sdzN5WWl0VUM2UTBSMW9VcU5l?=
 =?utf-8?Q?okyXWfWIO68=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SmV6OUdiSEx6My9SOWk4ZzYxaVNnYVRlZTNJeEpGdVRpVVhXK2N5QytTT3pB?=
 =?utf-8?B?MmpOY3FDWUViYnhMeG9hb3hvRHB0K21yOExpQVd2MURjUEpPM0JBVHdXUTlu?=
 =?utf-8?B?QzROb0ZTM1BpbWhFeFhGS0lrNGFSUzk5OVFERGczZkZiWGRIS1FPZ0xMM25k?=
 =?utf-8?B?TytxMi8yUE9QQ2Ftc1Bvb0pMdEhZS0wrOEhha0pudk5sQUUrM3N3T0N4NWMv?=
 =?utf-8?B?aWNXRU03N3lGL0JyZFVIZSt5OFNVcW8xLy8rdGxCL0p3K2Z1M3FSWUgyQitV?=
 =?utf-8?B?UFJnK1dVOXhKaDRLb2o3cTVwa2xtUmVZYjdvM05HNUhSSFN4UFowRUNyOEpT?=
 =?utf-8?B?QSsxQXlnRWRMRHdLY2JXWjd6MVF5M3J1TFp1SVdOU2JLSTZuZXZDRktkU211?=
 =?utf-8?B?YTd5YzkyQ3BMTlhWQUY5bUxOQ2d0Yzc2Z2JhNzR1UHpsVDhONzh2bDVOZEZ1?=
 =?utf-8?B?aDVwb2JsY0dsSW1sRThXMWExTkFFeE11K1p6N0xsbmhLeFNJOUVMdE15NGxz?=
 =?utf-8?B?TVA5bzVkd2d4aVZSVVFRSnFISDRzcm9RN05FbnAxSE03NHp5Vlc2UHI2MExw?=
 =?utf-8?B?OHozeEp6UndZUWJMZFREaGhlUWFwaldYWFNNUVRla3o3MmJOd2xjUFZ5QjAv?=
 =?utf-8?B?dm5IZ29DYS9wRUFKQVVyanpDcG5wQ1RERXdBMGIxNkxTVm5ZcXM3UEM5R3J4?=
 =?utf-8?B?VDZLc2orenNtS01lYVIwU090OVE5K3crcTJkTlMwaGxFcThpbzNYYVZxWFlo?=
 =?utf-8?B?M3lndnF2SXhkY2JuQTVMUFZORHhMdmliR1ZKdFgzRHlxWllxcjJSeWJQR2Jo?=
 =?utf-8?B?dFAra2wrZldTeHlSb1UxZENKUG15TEc4OXpsdThmd29iMUM3V3YvSmpwc0cz?=
 =?utf-8?B?K0tsM01vSGZDeFduZzltMEZ0dkIxZlcvZndCRW1WZ3I2K2paNWcxRmNUbEI5?=
 =?utf-8?B?NENYY1pFTXJSTm12dTJDQklieWpXMk5mVG9Da3pZYW9TeFZ2RnFHeDJEanI3?=
 =?utf-8?B?OVpzRm1BNkZwVEV6OWhKcGcxamVkRjZkQ01yRHZiTG1IS0hiVWtCNkh1b1or?=
 =?utf-8?B?TmJHREJIaXREZVBveitsTTR2MXJtc3ZsWm9wN2o1Q1ZPV1FZUU9UdFBKT2E0?=
 =?utf-8?B?L0lGVXVBcWFtUmdVcXkzdnlRYTBML1V0My9TNi9uZDRJczlDMVduK0ZodUky?=
 =?utf-8?B?WjVOVVJEWDdlbjFzdEJXLysrM01abVRpVVM1UVhyNWF5NjEyY3pqUlIvZ0JS?=
 =?utf-8?B?V0tnWmVPc0s2bS8ydkxlMjdaVGlSS0tPb0tjWjFKU1V4YVFRLzlHZTJCOVhD?=
 =?utf-8?B?SDFRcE9LbHREckYxOXVQN3VFMEpSS0tGcWRCTFFDUG9PV1JrRDh2bW9pdGoz?=
 =?utf-8?B?c0lGTlZWaFp1ZGNFMVFETUFQTWhGZFpnWDNoQ2dma3YvTjVBbnFsSTV4MlNr?=
 =?utf-8?B?REJNamVMZFVWbUlVNGJwNVB5NmFxOVF5eG5sSTlZN3JuRTlIZCtscWxzVTl1?=
 =?utf-8?B?aFYwNjdVb3NHN01LZWJDZ0xmZU51Q1F2WGJwL2lkSjJpcVlUMGMrN2EwdUZn?=
 =?utf-8?B?ekdmMG9tL09NTTR5VXp3WVhFTGtDNmp1Y1hFVnMzbTh2SEM0ZU84b0U1R0VJ?=
 =?utf-8?B?NWpNblhSSVk1cWxzSnluVTFPVlpPb2c0V1JFRWYrVXZoZTZvNHc1RC9RZXBJ?=
 =?utf-8?B?ZFlHSU5WVVp6ZTRLVHVHR0hGdnVlZnB5SzlnYkVPZ3lYU1lva2gyWWRiOHV4?=
 =?utf-8?B?bHNyNjlDVFAxM3lwbS8rNTNtNVViakI4Qys3QXliQUQ3UWhnQ2c1RS9ycVRz?=
 =?utf-8?B?ci93eVM0amxHWnV6Ujg3Z3ZoRVVGbCtnNjlDR21ORThlSWpONzIyaURId2VV?=
 =?utf-8?B?OUhCWVo0TUJrK0dJNUFJc3l5VHJJaURBRDR4aUlKZXpWaVkyd0w2MDl0UW5x?=
 =?utf-8?B?enh2ZTJlQStJWTRiWlE0Y3BXZUFWenEwZ1BYbDI0MjF1bjFiYUVLdXZtVTJa?=
 =?utf-8?B?RGNUMk8rWXZVUDJzSDhieHhDVkVFTHU1OTRvN2tlUFFRL0ZoWmRrdFpYRVp6?=
 =?utf-8?B?aHRNdTFkZXZUTkNZRzBIcTJEZC9xcjZpWGNKK2hJSm5vSnc3S2RlQmJuQU1H?=
 =?utf-8?B?aHdYQU01L2I2UVp2WDZWTHlTZ0xiQWFYK0hqS2NlaXh1ZVNsUWZvNmVlZWxZ?=
 =?utf-8?Q?Zgl8SBhVp0c4L36MHV4lrGo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f0913cff-2c6b-4bc1-3e0e-08ddbf9ed604
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 10:45:07.6002 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SNKjXleJHBq9skvkNM5WmT9G+4jPrTEtwgAxKIFPA+7m39l559ipaj4uKkjPSdO7Kv7F7E34wNpXv03M0o7lnukUCdfThZmNdh5eSLhl+pA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8689
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

--------------cq27100qV1dUJ2fr4q0dvrfQ
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 10-07-2025 16:00, Jakub Kolakowski wrote:
> From: Michal Wajdeczko<michal.wajdeczko@intel.com>
>
> Enable SRIOV support for BMG platforms.
>
> Signed-off-by: Michal Wajdeczko<michal.wajdeczko@intel.com>
> Tested-by: Jakub Kolakowski<jakub1.kolakowski@intel.com>
> Cc: Michal Wajdeczko<michal.wajdeczko@intel.com>
> Cc: Lucas De Marchi<lucas.demarchi@intel.com>
> Cc: Satyanarayana K V P<satyanarayana.k.v.p@intel.com>
> ---
> V1 -> V2:
> - updated commit message (Satyanarayana K V P)
> ---
>   drivers/gpu/drm/xe/xe_pci.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index e9c5d3150efc..0f5147e26ee4 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -331,6 +331,7 @@ static const struct xe_device_desc bmg_desc = {
>   	.has_mbx_power_limits = true,
>   	.has_gsc_nvm = 1,
>   	.has_heci_cscfi = 1,
> +	.has_sriov = true,
>   	.max_gt_per_tile = 2,
>   	.needs_scratch = true,
>   };

LGTM.

Reviewed-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com <mailto:satyanarayana.k.v.p@intel.com>>

--------------cq27100qV1dUJ2fr4q0dvrfQ
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10-07-2025 16:00, Jakub Kolakowski
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20250710103040.375610-3-jakub1.kolakowski@intel.com">
      <pre wrap="" class="moz-quote-pre">From: Michal Wajdeczko <a class="moz-txt-link-rfc2396E" href="mailto:michal.wajdeczko@intel.com">&lt;michal.wajdeczko@intel.com&gt;</a>

Enable SRIOV support for BMG platforms.

Signed-off-by: Michal Wajdeczko <a class="moz-txt-link-rfc2396E" href="mailto:michal.wajdeczko@intel.com">&lt;michal.wajdeczko@intel.com&gt;</a>
Tested-by: Jakub Kolakowski <a class="moz-txt-link-rfc2396E" href="mailto:jakub1.kolakowski@intel.com">&lt;jakub1.kolakowski@intel.com&gt;</a>
Cc: Michal Wajdeczko <a class="moz-txt-link-rfc2396E" href="mailto:michal.wajdeczko@intel.com">&lt;michal.wajdeczko@intel.com&gt;</a>
Cc: Lucas De Marchi <a class="moz-txt-link-rfc2396E" href="mailto:lucas.demarchi@intel.com">&lt;lucas.demarchi@intel.com&gt;</a>
Cc: Satyanarayana K V P <a class="moz-txt-link-rfc2396E" href="mailto:satyanarayana.k.v.p@intel.com">&lt;satyanarayana.k.v.p@intel.com&gt;</a>
---
V1 -&gt; V2:
- updated commit message (Satyanarayana K V P)
---
 drivers/gpu/drm/xe/xe_pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index e9c5d3150efc..0f5147e26ee4 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -331,6 +331,7 @@ static const struct xe_device_desc bmg_desc = {
 	.has_mbx_power_limits = true,
 	.has_gsc_nvm = 1,
 	.has_heci_cscfi = 1,
+	.has_sriov = true,
 	.max_gt_per_tile = 2,
 	.needs_scratch = true,
 };</pre>
    </blockquote>
    <pre>LGTM.</pre>
    <pre><span style="font-family:Menlo">Reviewed-by: </span><span style="font-family:Aptos">Satyanarayana K V P &lt;</span><a href="mailto:satyanarayana.k.v.p@intel.com"><span style="font-family:Aptos">satyanarayana.k.v.p@intel.com</span></a><span style="font-family:Aptos">&gt;</span></pre>
    <blockquote type="cite" cite="mid:20250710103040.375610-3-jakub1.kolakowski@intel.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------cq27100qV1dUJ2fr4q0dvrfQ--
