Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA6C2D1951B
	for <intel-xe@archiver.kernel.org>; Mon, 26 Jan 2026 22:47:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72DF210E1EB;
	Mon, 26 Jan 2026 22:47:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z8n674Od";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DF2C10E1EB
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Jan 2026 22:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769467659; x=1801003659;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=FlmKfq/d4xqVICmMsEqOi0tEfD/nF3z3GGwPvNewSC4=;
 b=Z8n674OdO2WvEgJHtbCHPuX/sJnvv3EfPag/+s/e8V73uG09hgDEKLvI
 zXNqfwRXO9H0ZqUR5I4Of4g48MOQCGY2c4r+Z9Pl3I0yjNgMGXJkG+48C
 Y6/S0z9876T1fn8yPx7MT5e7jKJ8k5kRdzVoyYF0urYSKPNSVkaKbHg4e
 I7uVLVCflLH8mclealKWg7Zr54rwuab3RbaNa3Kfa1AEv6lKtRvDxrSJK
 ci6nGAWvNiVQkZ5G142eF5V5s1KkcY0lksetSbl/wTRB7VXSwY86WqJAn
 pXqwQ7QPZh5xoVCHPZjZpPCfSxUS7+xxnhpaLg/F31VTCP54LsP/9Vr2/ A==;
X-CSE-ConnectionGUID: e5jw8khAT/2VbR5Ce2O7Qg==
X-CSE-MsgGUID: CWiXOad6QTesDraVVhQdjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="81288437"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; d="scan'208";a="81288437"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2026 14:47:38 -0800
X-CSE-ConnectionGUID: Q40R5aKsSf2TwKTQlvKtJA==
X-CSE-MsgGUID: uGQHFOWvS4iE5VGlYBHQzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; d="scan'208";a="208158531"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2026 14:47:38 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 26 Jan 2026 14:47:38 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 26 Jan 2026 14:47:38 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.37) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 26 Jan 2026 14:47:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K1JttC0EHiOEkUjb8Sa0BZO1auzm3hLKRYpkrVoAigKSZiqk4qVeg0Upfv0jKrbLjwjsVQDTWl1lvNCmROpnhJVnT1lX6jtpmWdQzdeffsvolqET9FUK6iGSWfEmoHSa0sJI3E/s2OA7io9SuiXDzOokm2i/KmpxVyA/HRuZeVMSzyfwN4aliqmcyXI4Qi37+4w7xu0dtHKzMisq52ZOay2Yvbxx5jQDvQJjj9Lw3YwjA//0kv2GzOylJH02BJHtzs5zsK7evg2vMjNVvb3DF5ORf/+LLjFmbdJS4eXzHjxiHPwUZdQ25e4ZuEV1sPWZqXYtvxjK+5A6hWbw8scOqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=miHriciHHE+l37L5wv1KcY+93/Zwhu77r87BIMqn3qM=;
 b=PniFpbvbI8tCPH+wrrVtGUm19N9ASppk2nCPmqBRqO59gEPy2xLH3M+5BdPTD7j+3yq1CFMyipypdj8qWxuSgwlBGrgONbnFLPO/6G3tnWSmMv1d5esqKt9MUeRRpR0/y8ONyZwVkKhKXB/TWF4Uo4nKqtCVaCrFzPrBLBPmP2VRSOzP9RTSNK1t64bAuBrt4Pjtgxv4/T+ckSBSUvS1lJt4WZZGTLkxRJHFfwyp+94Ewf0MfV1BSkgt1hTfW3EPdwFDhEct9PJW//s6oHv4EV8UFGfgChadq1Prion9DQAAGUiCVgbf0r5iLeFkfaw+wxM+/tfep4vnUGRYyRHxQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by DM3PPFCBDC4B878.namprd11.prod.outlook.com (2603:10b6:f:fc00::f4f)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Mon, 26 Jan
 2026 22:47:35 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%4]) with mapi id 15.20.9542.015; Mon, 26 Jan 2026
 22:47:35 +0000
Message-ID: <a57f9620-7608-41cc-8177-59d39f107258@intel.com>
Date: Mon, 26 Jan 2026 17:47:32 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] drm/xe/gsc: Add devm cleanup action to
 xe_gsc_proxy_start
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260123175920.230494-1-zhanjun.dong@intel.com>
 <93e5739e-245c-42d0-ba30-c3eda5ca5510@intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <93e5739e-245c-42d0-ba30-c3eda5ca5510@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0112.namprd04.prod.outlook.com
 (2603:10b6:303:83::27) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|DM3PPFCBDC4B878:EE_
X-MS-Office365-Filtering-Correlation-Id: c95c17fd-3202-4d39-1343-08de5d2ce5ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b3YrU0pWT0o3VC93WFJkTkZXK2laOXVYZDByZkNXWGxaWUxhSWVmTCt1RHRk?=
 =?utf-8?B?SkFIUTJ6eHdvWjFYS2ZndHpYN0FrMXZkcFFIVjVGbkpQNHdBQmdnd3cwaXN4?=
 =?utf-8?B?bXU3S0krcDQvNkZRVENWT0g3THNWRE12ak5OTkRCLzh1L3ExejZYQ2toVTdt?=
 =?utf-8?B?dHpmb3NnN25mclR3WHAwTU52QTlUbGk5alFsZGFzdVQ1U2c0QXJWTVU4ZjZo?=
 =?utf-8?B?aTlyaWRNa1BzMm1MR0RnUXFSR2tEZFlVY29Od3IrUXNSNVNTYk1UUTdmNVl1?=
 =?utf-8?B?VzA5ZUJwZWRhQmJsL1lTSWFFZjVoRWxnZFhPYzlvOGlaNVU3Ty9SdDdBU3pk?=
 =?utf-8?B?QXhIcVg3U3VCaWRkV0RBU2FRQ3hZckZkVWVNa3BTcnoyakRkTGVnMStmbldI?=
 =?utf-8?B?SWZwSXQyUVU3NFdQczhxaXR0QzEyOXVnR0s3dTRLdFloVkxGTWNUOWxvWjZx?=
 =?utf-8?B?R3hoNGMvTEZJOGM3WTc3MGZkMHdMVUxEcktmdzY3dW16TUdCY255OVRMbHlY?=
 =?utf-8?B?bVVWVkxwWHoxZkQwSllQQXk4aElwS1MvTTZoSUsrYWpUcTloUWEvQ2VDZnJS?=
 =?utf-8?B?cmpXSDlhOTBaQ21Sa3NaU0NxZmordURWSmNpaS9lZXYva2MrSmdqbjBFYTRE?=
 =?utf-8?B?SjNGT1E3TWRpZEZ4dDkrVERLVlUxWHZtOUNQTnpwYkFJbTZKblNWUHQyZG1D?=
 =?utf-8?B?VzVDeGRrQWRZbkJVVHU0NmV2NENMVUJLY3RhNEJlcGdLakF4cDZTaTk0c2Zl?=
 =?utf-8?B?bHJUYXAxUFZ5dWwzdjNGUmxXdkJDVjRrQ044UUU5N29mcjdYWGFxVW8zTFVk?=
 =?utf-8?B?QTdMNEczbkxRejhkbTFkUnZBTSt5MUh6MlRJamdtQW5LWHM5WU0ydmVYZzdT?=
 =?utf-8?B?K1k1ZUtKdlcyUGY5Mi9PckFWbURpeDBId3FwanE0bnN4S0o4K0FORDZxaGJM?=
 =?utf-8?B?MWdIdVlyQmlNUW92ckVhZWpYTkY3UXFHSlFTTS9JdDdDT2hSVGh0NE5aUzV1?=
 =?utf-8?B?M3Bvbml4THBNZnRvaGtFV1kyQ0NNTFc5NVhBdkl4RHR4alNkZGllNFA3dGFy?=
 =?utf-8?B?b2NiRG5Na2NuVk96aW80V1M2RjVyWWhCSU9WeGhYOU1lV3p0Q2c4MWNiVnIv?=
 =?utf-8?B?eUYrQkVOYXBlKytFeGsrZ1BoQTNURDA5ZUVWcDNhUnVqREhCMHphWlpoR0k3?=
 =?utf-8?B?cnRGUlNtYmlReWlsZTlyZG1YTGFuU2ZCaCtvbHlPYnhSN1UveEg2c3VudmxP?=
 =?utf-8?B?ZFNyaE00ZVhZZFR5NXkwbUh2UDd1cFhMY3dLek9XZGN3UlpQUklWUUw1OStl?=
 =?utf-8?B?UEl2UXNrRXVVYlRoUXkzeFdtdU9UcUZ6dzcyWmRYZ2VMNFFyQ2VzU2wrOFo5?=
 =?utf-8?B?YUFJNDlJdldUNzlKUHlyMWQ0RHZpeEhjRXg0Q2RKVDIvSlZTMG5MaHVaREtq?=
 =?utf-8?B?U3Avc3kwV3FGeitpSTcvSm1kek9XNGErUi9JVjVCUnk0bEJYSGE1c2lPb0Ji?=
 =?utf-8?B?bzN2TWxWK2FRQ2NwTStEdElrdFhBVldCMzlqdWVyMlBBZnFGcFlvTkNpT3RR?=
 =?utf-8?B?U1o2ZzZhUU83anBiK1lKY29aVTc3UzNCenRkR0JDZ0E1dFlhMmY0Q0FmWkxS?=
 =?utf-8?B?elVxT0hLWUtSZVJ5Yi9vMzNONWpwaVFJTW1YYStoWG1kYzk4V1UrZ0FVSitC?=
 =?utf-8?B?SDZhcU83YlcrbnpPNlB2RnpaZkFzc09tcWFudHNIUWVkWDhOM2VjbG4xcjQ2?=
 =?utf-8?B?UDhvbXdtQytIOUxqUHlnamF1UWkyQmF2MTUzNDhpWjF6aE1WUWQ1QzdrWUNP?=
 =?utf-8?B?c29MNjQyd2dZTjhjTlNRVWs0R3JXd29GcFVyNFFCeW1QVHZiRmlrK01wb0h6?=
 =?utf-8?B?TkZ3YXk4K25CcVB6RjFNUWlvRnlJNUltdHUvdVU4eE1NSVN2QzNmeDJkWnBW?=
 =?utf-8?B?dlpYL0RlVkI4N1l6alFCcUsxTHVkbTVSZWhYS2FJWlJkai9Td3JNOHM2NXp4?=
 =?utf-8?B?Zk1SV0tNeVNlUmtXeklwQThPS3BCN29HTXF0VWpEUVd4dUhaaUlRWUR1YXI3?=
 =?utf-8?B?ZTBLS0RET3ZrbWxwVmZLVmpEVmlBdGVaY2FDWTlOR01jUW1sNlFGSXRaaUhU?=
 =?utf-8?Q?g3Tw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aGdMQVZNeHpHUzZxcnY2ZWVjTnpmZHVrRnJCSVhISkI1cU55STFHV1I1UnhG?=
 =?utf-8?B?c0JPWmErU0E3ZG96ZmtMVXY2cjFHb0RGdmtDa292eEIwZkkrL25sUUdieHJs?=
 =?utf-8?B?d0Fpd2M2TnZXNkthRVpLNHo3YWc2Z0RFdHBPUzJvdzBQbndLb244M2lkMENR?=
 =?utf-8?B?Nnhpd1JWZVVjUEdQZThtQ3J6MmJKdUxYYU9TS29KV0FvbTF1cEVvYkZaVlRn?=
 =?utf-8?B?Ynh0MWYwOHpvVnNoUTFHaTh5ejZPdE42bGs3c3pvTjdML0kva2IzbHU1Z3lG?=
 =?utf-8?B?SVNySTZ1Q29kR3ZrSmoxZ2xoOS9OQjdrbEIwaXNHSjhSZmZXTkE0UkplSjZm?=
 =?utf-8?B?SWdxQ2t0bmp5bXZYRW0vbVZkZ09tdExIb0svSWM2dlBYa21JY0ZaNFBLaGI3?=
 =?utf-8?B?TlpEYzJDSGV3S2c5V2lUSFIwUTFicVBZdm1DOEJMSHdpZjZLTVhGN2U2eTht?=
 =?utf-8?B?aXdUa1VFekliSGg0Yzl5ZkRJemtDN2UrbUNPTnJhOXJvUExabzcvczNMMmtB?=
 =?utf-8?B?TmhNRHE1SFRmdnl0RjlGMUtGeHB0dlBZelU2MXVXUlVCTGloRzNJazhoUERi?=
 =?utf-8?B?Qjd5Y1RkS1dSaTYvcE1ZT2QzejN5ZXJkNTFHQzkvK2Y0Y0RaWVl6MS9jQnEz?=
 =?utf-8?B?eEdZTnVhVzdvUzBPY0RvMFFUNzcxbFBUb3VGVDcxYU5jWmxEaUpFY0d2MSs1?=
 =?utf-8?B?VURiRjdyWndVUVVhVWFaT3B4VjFNVWFEeFZNMVFqTEg3NTJvSHdTc216UzhK?=
 =?utf-8?B?Q1I2TUdoa091bHM2R1p6MXNkWC8weStKSWVYeXpZeXI1NmZndzhIRE44Tkdq?=
 =?utf-8?B?SzJaWkhjLzBLdFR4NTFZOThQczhEWGdGbWZEaU14YU05UmNQU2pTVG1xSWtz?=
 =?utf-8?B?NjdIVWNvc0UxNlhIelJubUFxdTgxNTR3S3J6b21xOTlKdXhHdFdBYmdoZUJm?=
 =?utf-8?B?aDdDVzU0NVpHQzM2R3gzcFY5Ymp0RVVxZ0s3RVJqY1FSTW0wd1lZUVJwQ0Vp?=
 =?utf-8?B?aEFYV0x0YmRjb0owUFoyOTB6OFlQRVFnUXQ4RXBOZEtKUmpaaWl2dnJDWE9o?=
 =?utf-8?B?S0pPMGlobXRSZmpGemdRb1NxWWpLUHBjam5LZUR6NnpUem1FYjhQdGNLeU01?=
 =?utf-8?B?YzI4cmMzS0VtMEdCMnBJZFVLYVJpTEVGZUdnaVoxbVJPZkhwbnkrZGpWbmpn?=
 =?utf-8?B?cE5oL2QzenZlRnVUSk41QzI1eUM1SjE2R3N1Z2Zyai9oUWc4cy9zY0g0cVNU?=
 =?utf-8?B?K1dSTk9SQ24vbmpiY3hQb1ZiMUVUaG5HY2Rzci9KakhKOHlrY3hkeFAyM3Vw?=
 =?utf-8?B?VlBsajFEVFdxcjZ2L1kvdWpDM2loZlVodGs1YSt2QmxvV2FnNk1WRGFncTQv?=
 =?utf-8?B?SUJ5eHVFdWd4N2ZGTk5jVVdNMzZFRGNtRlVxK2VGemNlVmYzRmJwNDlOdHdY?=
 =?utf-8?B?b2UyYjlJVk1BcS9RUFpaRCtSTTRGM28wK09pSnQ2MUZkUEU5SUdUTDA2M0tF?=
 =?utf-8?B?M0c3bEhyanJselUyUGs4d3E4bU9Hc2Q5bmxFSG5qN2pSTE82WVdTQ3VGLzB4?=
 =?utf-8?B?Y1BhZjJ5djhtMXVkZitNdTRXK3ZSV1VoNW1HQlZsMVV0UjhZOU90Tytjd3hV?=
 =?utf-8?B?eHp3QWdwZTNFMEltNUNFbDNIaE5YaWtmcnIwOGF0MnJUMEp2dUQ2NnVzNURU?=
 =?utf-8?B?ck9COXpkRGVvNGgwT2lzNStQdUQrVzNDQm1OalFlR3o0NTdiWUZJaHJQTVRY?=
 =?utf-8?B?OThzaFZuTzFGZmxWd2YrdGRtNXJMTFZGdy8xUmhlMU8ydVMzOHZOQXpEallI?=
 =?utf-8?B?c2pMYUdFemV6S0sxRGFYVi8vMFJIcFFlbnVubDY1a1B5aFc1cnRPSU5jRjhD?=
 =?utf-8?B?b29KRkZlaVRodWc0UEVQMldidHZpVlo4MzBkbThyMFRNMDEzMHVpQ2p6MGJk?=
 =?utf-8?B?bnhyTm1WWVNCMGlPWjAwaG1SZzVTN3FxTWdPaFVIR2RKRnA2OS9SRi9EcmR5?=
 =?utf-8?B?TUVaZmF3YXB0QjZoTUhJcHVlWFcraWVVYVd3SnBrZkp3WVlyeUUrUU5nYThP?=
 =?utf-8?B?MXR3OHNyZ1BuMVkyWG9FMStTL2tqU1FOREtXZE56UWppV2htU2FlSTFDQ05J?=
 =?utf-8?B?VUY5UHlSSFFHMWVaSHY5R3hpOEhDWFRSUHJZNkI5SkVaUlNRMnhFZDhXcTRX?=
 =?utf-8?B?UFJncVFwMVZIWjZDb0NQNlFWK3VObGl2cnZyVVFGN0hJc0VTeHF1Nk1kc3Uw?=
 =?utf-8?B?QXh0RjRDc09FblpDaU5HazQ2eWdGcXMzNTZCbFlwY0VvbU5XRmpjZTNBQy9v?=
 =?utf-8?B?ZXFCVXJjTmtDaDQxT2tIclNpdUxPWlRvWFZhb2VRT2hpK3dTbzIxZz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c95c17fd-3202-4d39-1343-08de5d2ce5ef
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 22:47:35.3146 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: phl2JFAS+itBC9+70+l+lBeeWNFnARBidxkj3vrtce15XzzBjrsGrAov05VolTEVZl/SQKYoXHYBBr2qlNhqDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFCBDC4B878
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



On 2026-01-23 4:05 p.m., Daniele Ceraolo Spurio wrote:
> 
> 
> On 1/23/2026 9:59 AM, Zhanjun Dong wrote:
>> Split xe_gsc_proxy_remove into two parts: xe_gsc_proxy_stop for cleanup
>> operations and xe_gsc_proxy_remove for component removal only.
>> Add devm managed cleanup action at the end of xe_gsc_proxy_start to
>> ensure proper cleanup when the device is removed.
> 
> This is a bugfix, so it needs a better explanation of the bug it is 
> fixing. Something like:
> "xe_gsc_proxy_remove undoes what is done in both xe_gsc_proxy_init and 
> xe_gsc_proxy_start; however, if we fail between those 2 calls, it is 
> possible that the HW forcewake access hasn't been initialized yet and so 
> we hit errors when the cleanup code tries to write GSC register. To 
> avoid that, split the cleanup in 2 functions so that the HW cleanup is 
> only called if the HW setup was completed successfully."
> 
> Also needs a fixes tag.
> 
>>
>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_gsc_proxy.c | 19 ++++++++++++++-----
>>   1 file changed, 14 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gsc_proxy.c b/drivers/gpu/drm/xe/ 
>> xe_gsc_proxy.c
>> index 42438b21f235..0b76b29bf2d5 100644
>> --- a/drivers/gpu/drm/xe/xe_gsc_proxy.c
>> +++ b/drivers/gpu/drm/xe/xe_gsc_proxy.c
>> @@ -435,15 +435,12 @@ static int proxy_channel_alloc(struct xe_gsc *gsc)
>>       return 0;
>>   }
>> -static void xe_gsc_proxy_remove(void *arg)
>> +static void xe_gsc_proxy_stop(void *arg)
> 
> I think it might be worth moving xe_gsc_proxy_stop to be right above 
> xe_gsc_proxy_start, to keep the opposite functions close.
> 
>>   {
>>       struct xe_gsc *gsc = arg;
>>       struct xe_gt *gt = gsc_to_gt(gsc);
>>       struct xe_device *xe = gt_to_xe(gt);
>> -    if (!gsc->proxy.component_added)
>> -        return;
>> -
>>       /* disable HECI2 IRQs */
>>       scoped_guard(xe_pm_runtime, xe) {
>>           CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GSC);
>> @@ -455,6 +452,16 @@ static void xe_gsc_proxy_remove(void *arg)
>>       }
>>       xe_gsc_wait_for_worker_completion(gsc);
>> +}
>> +
>> +static void xe_gsc_proxy_remove(void *arg)
> 
> xe_gsc_proxy_remove is now purely SW management, so we can use drmm 
> instead of devm when we register the cleanup.
Try switched to drmm, but got this:
[ 3869.024154] BUG: unable to handle page fault for address: 
0000000000002780
[ 3869.031132] #PF: supervisor read access in kernel mode
[ 3869.036329] #PF: error_code(0x0000) - not-present page
[ 3869.041523] PGD 0 P4D 0
[ 3869.044097] Oops: Oops: 0000 [#1] SMP NOPTI
[ 3869.048340] CPU: 4 UID: 0 PID: 15240 Comm: xe_fault_inject Tainted: G 
     U              6.19.0-rc6+xu4438+ #5 PREEMPT(voluntary)
[ 3869.060184] Tainted: [U]=USER
[ 3869.063204] Hardware name: Intel Corporation Lunar Lake Client 
Platform/LNL-M LP5 RVP1, BIOS LNLMFWI1.R00.3223.D96.2504232223 04/23/2025
[ 3869.075573] RIP: 0010:xe_gsc_proxy_component_unbind+0x10/0x60 [xe]
[ 3869.082024] Code: cc cc cc 0f 1f 80 00 00 00 00 90 90 90 90 90 90 90 
90 90 90 90 90 90 90 90 90 0f 1f 44 00 00 55 48 89 e5 41 54 53 48 8b 47 
78 <48> 8b 98 80 27 00 00 4c 8d a3 f8 1a 00 00 48 8d bb d8 19 00 00 e8
[ 3869.100945] RSP: 0018:ffffc9000a2af9f0 EFLAGS: 00010286
[ 3869.106233] RAX: 0000000000000000 RBX: ffff888173d9b940 RCX: 
0000000000000000
[ 3869.113446] RDX: ffff8881171e5390 RSI: ffff8881241cb818 RDI: 
ffff8881070ec0c8
[ 3869.120647] RBP: ffffc9000a2afa00 R08: 0000000000000000 R09: 
0000000000000000
[ 3869.127853] R10: 0000000000000000 R11: 0000000000000000 R12: 
0000000000000001
[ 3869.135064] R13: ffff8881171e5390 R14: ffff888109b1dc40 R15: 
0000000000000000
[ 3869.142283] FS:  000075ff95df2940(0000) GS:ffff8884eb8e0000(0000) 
knlGS:0000000000000000
[ 3869.150463] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 3869.156278] CR2: 0000000000002780 CR3: 000000017b3c4003 CR4: 
0000000000f72ef0
[ 3869.163489] PKRU: 55555554
[ 3869.166243] Call Trace:
[ 3869.168735]  <TASK>
[ 3869.170870]  component_unbind+0x56/0xf0
[ 3869.174764]  component_unbind_all+0xc2/0xd0
[ 3869.179007]  mei_component_master_unbind+0x21/0x40 [mei_gsc_proxy]
[ 3869.185256]  take_down_aggregate_device+0x35/0x60
[ 3869.190008]  component_del+0x99/0x140
[ 3869.193730]  xe_gsc_proxy_remove+0x45/0x60 [xe]
[ 3869.198416]  drm_managed_release+0x8b/0x160
[ 3869.202657]  drm_minor_release+0x5f/0x90
[ 3869.206631]  drm_release_noglobal+0x7c/0xa0
[ 3869.210865]  __fput+0x10a/0x2f0

I guess here:
struct xe_device *xe = kdev_to_xe_device(xe_kdev);
devm action first, then drmm, when reacted here, dev no longer valid.
If no other concern may be keep current way and let it managed by devm?

Regards,

Zhanjun Dong

> 
>> +{
>> +    struct xe_gsc *gsc = arg;
>> +    struct xe_gt *gt = gsc_to_gt(gsc);
>> +    struct xe_device *xe = gt_to_xe(gt);
>> +
>> +    if (!gsc->proxy.component_added)
>> +        return;
>>       component_del(xe->drm.dev, &xe_gsc_proxy_component_ops);
>>       gsc->proxy.component_added = false;
>> @@ -510,6 +517,8 @@ int xe_gsc_proxy_init(struct xe_gsc *gsc)
>>    */
>>   int xe_gsc_proxy_start(struct xe_gsc *gsc)
>>   {
>> +    struct xe_gt *gt = gsc_to_gt(gsc);
>> +    struct xe_device *xe = gt_to_xe(gt);
>>       int err;
>>       /* enable the proxy interrupt in the GSC shim layer */
>> @@ -528,5 +537,5 @@ int xe_gsc_proxy_start(struct xe_gsc *gsc)
>>           return -EIO;
>>       }
>> -    return 0;
>> +    return devm_add_action_or_reset(xe->drm.dev, xe_gsc_proxy_stop, 
>> gsc);
> 
> You're not doing any cleanup if xe_gsc_proxy_request_handler() or 
> xe_gsc_proxy_init_done() fails and you bail early from this function. 
> Need to change that so that interrupts are disabled in case of error exit.
> 
> Daniele
> 
>>   }
> 

