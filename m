Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A99C6C54E65
	for <intel-xe@archiver.kernel.org>; Wed, 21 May 2025 21:06:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 733E710E731;
	Wed, 21 May 2025 21:06:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FOgigO6s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C3DC10E790
 for <intel-xe@lists.freedesktop.org>; Wed, 21 May 2025 21:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747861560; x=1779397560;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3x04wyZ9uWPgFNGGnhm8q1Az7RFvdq/rQ89CC8n84X4=;
 b=FOgigO6s6vXOS9rvJAkSEY9h3BDexC4T9JnOGYmi2ZDgER9u9nJpwD8V
 rlO95RpfU+uw+kBqurfGwO1g4pkUog3ZpHBfJVpZbzbvXnVHBKrZ7Da9v
 R/uff1d0kVlEueUU+V0UhJFK9/YgLrUYziVbFYdiRA1uIB4tfFKB3GgvS
 UiZjOXwhPFAO4gUOiKTc5mpvu15ffP2w1OB2c46EK48MElYRXG68J6w8+
 YTSgo6ZfagzrmmA9llyDbhXm14batm+OS2OrdhLirfI+B+wujtb4fZclC
 4pYRPxwihR8J8ZXl8NOlp5RbPoRTQds6xfSagRLuIRB+oMS0g4ayoQzYO Q==;
X-CSE-ConnectionGUID: QdPxO4y3SiyEqTlVM8XRUg==
X-CSE-MsgGUID: oPONGgHgSnatSddk4qdvjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="37481689"
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; d="scan'208";a="37481689"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 14:05:59 -0700
X-CSE-ConnectionGUID: An7eWNILRByk3nlejODaSw==
X-CSE-MsgGUID: 63/ucG3ARnKHCaV1HUVWaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; d="scan'208";a="141151721"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 14:06:00 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 21 May 2025 14:05:59 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 21 May 2025 14:05:59 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 21 May 2025 14:05:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QcXIuT7AhjmFov7161NmApxGKyZLEzdg9Kz3/yLwqqHtTv0wGbqt/TrDLHOZZRfsEhDC4vciduOIC0R7ioIbNMzVtvmHD8odGiicyIZSq/Fu17jX9aYQa+9p+R/z667WqdwOLq06rFD0FOl9aC9X7slZuLcNrvVURTzkg/A5IkCstzIXyWxlRls32ACPKA0OuqHRclLM4S5tlLhkXBCSOm3L9b/8OXKb9iJFWISzT2u9COfTkcyFUy4ZaConxTGUHVJFRmFEh8XpsaPmkFYGnAy4E883hylrS3AKpJyjtGA3oz7nGWNv/b/cBKxDdMFx2mOWhDkUlrhibM4ooRfO7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3kj+PkvHNbV0uTwOpgI3U4WW3X1PgCaztV2HLaya4I0=;
 b=wU2FUrKHOXDSVr9UW+gz1h7bD7YCOj7FkzhaJ4oxqiNfYFvRoxI1p4pZXxAeEORzz6QNbSe7x+0vHGzKvgquPZ3oJuXWjNKOWAJ0F6Ppcb1ANFhmOtjFCtQwulGjxAOkvMTHKjN2ZqXCBdLTWl2rpy+L3CR4MQK98C+KvGDgeMYYUrzqE1KEEVuuQnH+YDzaIPzZ/LdsR5tAb60abhKj8MR15G1v8ZtkSsmCmKZISxzOJHPIxtxLIK48GQNzf2K/v0O/gHTgGqn7htThP6wQ9RSmr0TQDbRiMUWYVuAhKx/DuY2xzTDU7BfI5I2EHU0rscN0+TrY9gVYcTv6Z+5G/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by BL1PR11MB5980.namprd11.prod.outlook.com (2603:10b6:208:387::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Wed, 21 May
 2025 21:05:54 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%7]) with mapi id 15.20.8746.030; Wed, 21 May 2025
 21:05:54 +0000
Message-ID: <c23adcc6-5a3d-4032-b70b-a31596c3d951@intel.com>
Date: Wed, 21 May 2025 14:05:51 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Allow to trigger GT resets using debugfs writes
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Lucas De Marchi <lucas.demarchi@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
References: <20250519200914.216-1-michal.wajdeczko@intel.com>
 <eefda6f4-e81c-43a6-bebc-7d4fe0c3132a@intel.com>
 <e222a156-bc07-45d0-bfd6-f24ff31696a4@intel.com>
Content-Language: en-US
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <e222a156-bc07-45d0-bfd6-f24ff31696a4@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4P223CA0030.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::35) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|BL1PR11MB5980:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c2eb177-11bf-4d8d-1a87-08dd98ab4655
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WHFCNkpJZjZ0Yi84ZlloSUZsTndTVEluTzgxUGYrbi92dDNMVFpmZWFNZFFR?=
 =?utf-8?B?RWFNL08zVVZQODc2c0ROdE1JQllxSzhjR1c0QUJKODQ4Rlk5bjFSdXUyUUFP?=
 =?utf-8?B?RCtuVlBNZThiZlVna1I1Ty9uTVZvSVVEUXpDK2N2R0RJcDNqcytQQjBHVTNN?=
 =?utf-8?B?d0NqN0hGKzNxNldNN01PMnFvYmd0emdPNGNHNVVUUm1HZzArNjJWK1JDQWFs?=
 =?utf-8?B?TDBsUmFzMFJ5MnJNeEhzZURqblhmbUlIY1h4OUkvcGhES2Y4VjZvRy81V3BN?=
 =?utf-8?B?bSsxcUo5WExldWs2Y09QcFQ4R283WG56akhDTHN4VXR6eURUa3p6alRpY1Ro?=
 =?utf-8?B?RFFVbTJia2p4LzFUcDE3TkxEK3hhY016YVFtQ2Zkc20zbml5aGtneDJITlNj?=
 =?utf-8?B?TUs4aHVPQ3NwS2NnMkhiVjIzbjRnTVFkUGpiTmJsZ29QS244dE5HemVUY2d5?=
 =?utf-8?B?MnFVNkhWcW5JNmFrandTcW0xMVptREpkdzdBazV2aTJMaFhsY0FsOHFBRUZ1?=
 =?utf-8?B?ellHTys1eTM4UU8wRFZ6YlJ2OU5ZdCtEZ0Jic2pPZjBLZXBIZXV4Q2JGUjN1?=
 =?utf-8?B?YXBNRHFPRU02d21iRjVyRXdkVU5XWVY2Q3V3NE5jb25xRXNNV1FNcmhlaHVD?=
 =?utf-8?B?MVl5WmFsR2ttTEhuUG9VNTBPN3FVUU5hUUVMMnJScTdrVm5OMk1KVjJIRE0y?=
 =?utf-8?B?czdPVFJ0YXE2S2orWFJuQjFLNDJZU3JYOCt6Um94dnJLanRDU3dYVXArejBj?=
 =?utf-8?B?TWlUeFAyOGVsdVIwdXM4VEIvcjVGYzYvV0dkVzQxM3FMNVlOc0Z3SEFKTFha?=
 =?utf-8?B?OW82MVEzVHp0WG9UaHZaYWRoMDBUdFFlM1BuR0pkbzRTYUJxUVEvN2tQcnEz?=
 =?utf-8?B?Mk1NTnJDYzYzeVM0c1RlUGRXZDY2cjRTdHJBek04Mm9Mc05TSmM0YUF0TGVt?=
 =?utf-8?B?d3EzRE4va0RzNEJMT1E2Sy9CSHlmZzVHQVk0SjRBWE0xdXljOFZHbXFheExu?=
 =?utf-8?B?eUtpaDY3T2J5VmtrcUppZ2p5cjViTStNbXMrd3JtNzE0c1YwanJtamFQYU0r?=
 =?utf-8?B?cmpqQmxHYU1vbC9rTk91TVowNXdQaFZaZjdKZFRpWnNrV1o4ZzFSZmJNU3lG?=
 =?utf-8?B?a2VzcUNTSnJteWg3NUZhS0JJZXFqRkdmYTR1TndUOTVqRkdSVkFXTXI1YnM1?=
 =?utf-8?B?TVV5dUlFQ2tjekpGc0N4Z0NSSXprS1dnT0x6bFRhWEdzMEJiNnYwb1pGVUI4?=
 =?utf-8?B?WDdNaE5LbkN5eE9xSFRHdm43WHMyb0ttSjN5THdlTWNQd2F1RHNCV3FqMUQ2?=
 =?utf-8?B?a0JQazJBOEJ5OURxUUU2dkZ0RUJuZzB5RTdSN0xqMi95c2FVeWU1czZPU2sx?=
 =?utf-8?B?ZXJhRUZOZFlJcGhEVW9FS1Q2bkxOU0h4bFBEUDRxdkxTbkJ1ak9SNnNEclBo?=
 =?utf-8?B?M1hjT0JZMTZjTVZaTm55K3dod25BdzZmUHIzQmVpSWJlaHArNTVoZkhTM0k1?=
 =?utf-8?B?bWt3U2s3ZktXd0pvaTA3eDYxR0lZeExSeW9NQVY5bVlXZkxBY3NiNU04RnVV?=
 =?utf-8?B?ZDBnd2pSa2d2dnYyeGREZ3BONUI2SzBnL2FFcGJHVkZiL2JIcW9LU2N6TzJx?=
 =?utf-8?B?MjJGQkxrQ0U0QXhHMmNiZmZJYWZSTFdHemoxNE5vN29KVFR3dDJwWTZVQ2cy?=
 =?utf-8?B?cmFGYjN6eUZNSmhNUTRad00vVGNTYW11TDdGWFVUSi9EUm1pRDdqV2IvTEFU?=
 =?utf-8?B?ZlVLb3V6QUs1aHFtOXczRU9OV29XQ0dGMUxvNVR1T2JkTXJ2UjdqSzNjbVpI?=
 =?utf-8?B?WHBoVldEQTJ0NjIyUFpvcU8wYTVDcWxna0dyN3gyRWROcmFxZzVjYXpRb3Zk?=
 =?utf-8?B?enoza05PczhyV0ZHdlhUYzRSU2V6MXRjOXVYZkpUcHpTK2dwQWZyMktVZ2Nl?=
 =?utf-8?Q?xfcP2WO/35U=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZXZxV0I0am81VjFiTXZTY2NHbHFkZnpadGNtcXdKT0lOMVlMZGE3dzhYakpq?=
 =?utf-8?B?Qm5aTVpxT3VnRlNSU3E2OVZoN2pmNGFUVGtTQVlwcWhlODhRZFAyTjhoMjlU?=
 =?utf-8?B?RDE2MGJ4SytrUjZJaDlyaTg0b2wrbjloQ1ZqN1FKTU16V0JCa3JxTDZObk9h?=
 =?utf-8?B?bTM2c3hLaHJCKzBCc244WXFCVlBXOVNXV3ZseEVjbFVWWGo1Q2l0VmIxSllN?=
 =?utf-8?B?enljVGUyTHVOQlVuQkM4VUx0OCswTzhUNG5TYkZkZjBEVThWb2ZrOVUwVlNM?=
 =?utf-8?B?Vkl4OTNZR0hTMGRPdEhudXgxZk5SL25OMk1lWWJVNlhwUFUreHlBelNRSFRN?=
 =?utf-8?B?VExHOGJQVkZZOEpucTlycm16d210UURrZi9nN2NCcmw2R2ExbUZId3c1R0xP?=
 =?utf-8?B?RVlwSWtWakI3SjNaY2Z4ZXVEdnA4VDhva0lWbHFERHhCSEpzL0JhcmFIQi9T?=
 =?utf-8?B?WkN1VXJ1UWZMYWczTTVCUmFvUHg0THMreTJDaU1VVG5NeUZkTFkraGhLMVRM?=
 =?utf-8?B?VE04LzdCQ0J1cEpDWERPQ0hNK1ZCQWcvWjlmd3d1L1NYWlVGbTFPbUNNT3RZ?=
 =?utf-8?B?SWlFMDducmxjWmJKSjI4UDBPVit3MUYrbzJCNS94UDV0ZHFHVVpYTVJEeEVv?=
 =?utf-8?B?NXNOSHVUeU8rUE1ZZ0pPZ29GT2puTkMrYkNlUWQ5d1A1dEJjanlSTi8zT3Zs?=
 =?utf-8?B?QzBpd0Rpb1hUTVhVY0hMckpIUzRkWHNkLzlVVVcwWnFOblprRWtnckNMWDNS?=
 =?utf-8?B?S1doUVpiTit3akFLZ2kwdFQ0VEpGb1FMTVRmQ0VHNGszTzErOUlMcEhCeE5y?=
 =?utf-8?B?RzdxdHJkdXJpV0NLdm9Bam41L0ZVd05lTWxLT3NSKzZjeWYzdjdIMUU1Vmtx?=
 =?utf-8?B?T2kzSHhrZVdoUTNWc3hMYUFYdGE3K0E4YUI5Y3JVdHBHZENYYzgvWUpaa09L?=
 =?utf-8?B?N2N0QmFLREVBa2MwajlUU1UrMDBJb2prSnpSSnIzRS9lTzVOb2pkdUZoQ0Jk?=
 =?utf-8?B?b2c1Sm1pNERQYnp0ZVRXbm5YbG9qSE4zZ2p4Nm5BWWYvMklyUlVZVmY0Q3NV?=
 =?utf-8?B?a0lwalpyRCszSWxFWWV1NHRUUGNGQVNBenBIUVV1MHFBREJDZWpMVTNnN21T?=
 =?utf-8?B?ZUp2QTA1ZFJBTHZacmdvT1BXOVkzM2Q1ODR3ZUZSWVBtMTRHOXg3QTBHUVUx?=
 =?utf-8?B?N3ZHZGdsUXRYeXo4bTNIZEVCTndpaURiWk5RWVhnRkdlMFp0YUpCeGJrTllZ?=
 =?utf-8?B?Ujg2ZVRBaDloMCtaT0JVaytjZnhwL0w4RUt2K1RBM0tWS25GK1Zwek43MXpC?=
 =?utf-8?B?ZSt5enN1eG9leW5BNzIvR3FVVGtraUhjd2FTWmNZMFlla09oZVNwQ1J2ckVD?=
 =?utf-8?B?RURNSTlhbnBtcTBhd0FTdlNCcjlZcnp6RG9mZ2N4SXNYK0YrcWp0UGo2MUNW?=
 =?utf-8?B?dzlYK1ZWdndYbitVai9lL3N4bE01M1g0K2g1Y21sMWVzWS9zMXhGc2hxV2Mr?=
 =?utf-8?B?bW1BTDBmdzFwNnE5TitmNk5ReVF3cEd1RlFkVlNST3pzUlhEUXNKNDdkUXMz?=
 =?utf-8?B?cXBMeXdpVjgxeUNtdDhJMHdYaU9lSVJZQWtpWHhUalBQdHlXRkdabG9KMENQ?=
 =?utf-8?B?ZU9zYXJsc2xnbWt0QVVsZ2pQazJ1Sk9UM0NsZGx1ZTBqL1pPNk8weTMxYUVG?=
 =?utf-8?B?cGh1V0UxNGRwQldTTmlveTJlM0tsNDc2SXFmMUFGWWRCSFZFZWgzQ1lscWQv?=
 =?utf-8?B?b0RXc3dWUk5QOVRnU0d0UkNHVVNqSUh3d1ZuZDAwc1hOOFlUb3I2S1FoY0FE?=
 =?utf-8?B?dEJFdkJtSVc4TmJnNGJYNW4zdG4zOThSTnAyRFBZM3Fra3Jsc0t2bmpnT2tK?=
 =?utf-8?B?cUZDOE9HaFBDdWEyTW9FUG5Tc0l4OWhzcXg0TnpoRjhMWTVJdWxoeUdYWGZn?=
 =?utf-8?B?dmh6YVVSRElTQ0trK3NIalpyZElIeSt1cEdMTWdxY2NUTUpMSDc0dXlEd3FI?=
 =?utf-8?B?cXdkTlN5Q0JtUXZOVnI5Y2dVdzBTUDVwczU4ZEpiQTFEdmc2SWRyb1hYWklv?=
 =?utf-8?B?OExNTDNOV0RNZzdvYzZWL1RmMi8vcjliK2YrcHBHeDgxeUZYMkJQU08xZ2sr?=
 =?utf-8?B?dGZqSDR5VG5KTkhqTFNqNytDSGIyQks4eVVRMDg4Szh0TDZkL05yL1VDWHgv?=
 =?utf-8?B?Z2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c2eb177-11bf-4d8d-1a87-08dd98ab4655
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 21:05:54.5023 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fsmQ2iZpDJ2WraJFdwl8QU7ltK/mZGXCO5KRAEdZABpuqf7c6ckCKSp1l0gnVeb4jyhDTeKpYv8dEQdVJrFBbKQHdHIcMrPn6Z+Rd5qdGzs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5980
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

On 5/20/2025 2:12 AM, Michal Wajdeczko wrote:
> On 20.05.2025 01:44, John Harrison wrote:
>> On 5/19/2025 1:09 PM, Michal Wajdeczko wrote:
>>> Today we allow to trigger GT resest by reading dedicated debugfs
>>> files "force_reset" and "force_reset_sync" that we are exposing
>>> using drm_info_list[] and drm_debugfs_create_files().
>>>
>>> To avoid triggering potentially disruptive actions during otherwise
>>> "safe" read operations, expose those two attributes using debugfs
>>> function where we can specify file permissions and provide custom
>>> "write" handler to trigger the GT resets also from there.
>> Would you like to extend this to the GuC log dump-via-dmesg trigger
>> entry as well? Dumping that during the IGT read debugfs test also causes
>> issues due to the huge amount of output it produces.
> yes, that was my plan as I was expecting more discussion there so I
> wanted to put that into a separate series
:)

>
> but since you already asked here, my question would be:
>
> do you prefer keeping separate write-only "guc_log_dmesg" file, or keep
> single read-write "guc_log" file that would print encoded log on read
> and dump it to dmesg on write?
I would keep the dmesg version as a totally separate thing. It's purpose 
is just for testing the dump-via-dmesg support for things like the 
CT_DEAD and other on-demand dumps from within the KMD. Whereas the 
regular 'guc_log' file is the official way to query the GuC log for 
debugging.

Longer term, the intent would be to drop the guc_log_dmesg entirely and 
replace it with a devcoredump_to_dmesg file instead. Given that the 
intent is to drop the fake coredump via dmesg that CT_DEAD currently 
uses and replace with a real core dump once I can get back to fixing up 
the core dump to not require a DRM job, support multiple GTs, etc.


>
> also do we want to keep 0444 mode for "guc_log" or change it to 0400
> mode (or 0600 if it would be dual-purpose)
It is debugfs so requires a debug enabled kernel in the first place. I 
assume that someone who is concerned about security and end user privacy 
in a actual product would not have debugfs enabled. But sure, we can 
drop it 0400 if you think being public is an issue.

>
>>> This step would allow us to drop triggering GT resets during read
>>> operations, which we leave just to give users more time to switch.
>> I'm not following this sentence. Give users more time to switch what?
> switch to use "echo 1 > force_reset" instead of "cat force_reset"
>
>> Also, would it be more accurate to call the patch set something like
>> 'require a write to trigger GT resets via debugfs'. Saying 'allow'
>> implies you are just extending the existing interface rather than
>> removing the trigger-via-read ability.
> this patch extends the existing interface, the legacy way to trigger a
> reset by read is still there (due to IGT) - see force_reset_show()
>
> once the IGT will be updated, we would make those files write-only
> I didn't want to introduce any CI regression right now, hence two steps
Got you.

I would just go straight for the intended version in one patch and 
include a link to the corresponding IGT patch to update the tests. But a 
two step approach works, as long as it doesn't get forgotten and step 
two never happens!

John.

>
>> John.
>>
>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>> ---
>>>    drivers/gpu/drm/xe/xe_gt_debugfs.c | 96 +++++++++++++++++++++++-------
>>>    1 file changed, 76 insertions(+), 20 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/
>>> xe_gt_debugfs.c
>>> index 119a55bb7580..848618acdca8 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
>>> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
>>> @@ -122,24 +122,6 @@ static int powergate_info(struct xe_gt *gt,
>>> struct drm_printer *p)
>>>        return ret;
>>>    }
>>>    -static int force_reset(struct xe_gt *gt, struct drm_printer *p)
>>> -{
>>> -    xe_pm_runtime_get(gt_to_xe(gt));
>>> -    xe_gt_reset_async(gt);
>>> -    xe_pm_runtime_put(gt_to_xe(gt));
>>> -
>>> -    return 0;
>>> -}
>>> -
>>> -static int force_reset_sync(struct xe_gt *gt, struct drm_printer *p)
>>> -{
>>> -    xe_pm_runtime_get(gt_to_xe(gt));
>>> -    xe_gt_reset(gt);
>>> -    xe_pm_runtime_put(gt_to_xe(gt));
>>> -
>>> -    return 0;
>>> -}
>>> -
>>>    static int sa_info(struct xe_gt *gt, struct drm_printer *p)
>>>    {
>>>        struct xe_tile *tile = gt_to_tile(gt);
>>> @@ -306,8 +288,6 @@ static int hwconfig(struct xe_gt *gt, struct
>>> drm_printer *p)
>>>     * - without access to the PF specific data
>>>     */
>>>    static const struct drm_info_list vf_safe_debugfs_list[] = {
>>> -    {"force_reset", .show = xe_gt_debugfs_simple_show, .data =
>>> force_reset},
>>> -    {"force_reset_sync", .show = xe_gt_debugfs_simple_show, .data =
>>> force_reset_sync},
>>>        {"sa_info", .show = xe_gt_debugfs_simple_show, .data = sa_info},
>>>        {"topology", .show = xe_gt_debugfs_simple_show, .data = topology},
>>>        {"ggtt", .show = xe_gt_debugfs_simple_show, .data = ggtt},
>>> @@ -332,6 +312,78 @@ static const struct drm_info_list
>>> pf_only_debugfs_list[] = {
>>>        {"steering", .show = xe_gt_debugfs_simple_show, .data = steering},
>>>    };
>>>    +static ssize_t write_to_gt_call(const char __user *userbuf, size_t
>>> count, loff_t *ppos,
>>> +                void (*call)(struct xe_gt *), struct xe_gt *gt)
>>> +{
>>> +    bool yes;
>>> +    int ret;
>>> +
>>> +    if (*ppos)
>>> +        return -EINVAL;
>>> +    ret = kstrtobool_from_user(userbuf, count, &yes);
>>> +    if (ret < 0)
>>> +        return ret;
>>> +    if (yes)
>>> +        call(gt);
>>> +    return count;
>>> +}
>>> +
>>> +static void force_reset(struct xe_gt *gt)
>>> +{
>>> +    struct xe_device *xe = gt_to_xe(gt);
>>> +
>>> +    xe_pm_runtime_get(xe);
>>> +    xe_gt_reset_async(gt);
>>> +    xe_pm_runtime_put(xe);
>>> +}
>>> +
>>> +static ssize_t force_reset_write(struct file *file,
>>> +                 const char __user *userbuf,
>>> +                 size_t count, loff_t *ppos)
>>> +{
>>> +    struct seq_file *s = file->private_data;
>>> +    struct xe_gt *gt = s->private;
>>> +
>>> +    return write_to_gt_call(userbuf, count, ppos, force_reset, gt);
>>> +}
>>> +
>>> +static int force_reset_show(struct seq_file *s, void *unused)
>>> +{
>>> +    struct xe_gt *gt = s->private;
>>> +
>>> +    force_reset(gt); /* to be deprecated! */
>>> +    return 0;
>>> +}
>>> +DEFINE_SHOW_STORE_ATTRIBUTE(force_reset);
>>> +
>>> +static void force_reset_sync(struct xe_gt *gt)
>>> +{
>>> +    struct xe_device *xe = gt_to_xe(gt);
>>> +
>>> +    xe_pm_runtime_get(xe);
>>> +    xe_gt_reset(gt);
>>> +    xe_pm_runtime_put(xe);
>>> +}
>>> +
>>> +static ssize_t force_reset_sync_write(struct file *file,
>>> +                      const char __user *userbuf,
>>> +                      size_t count, loff_t *ppos)
>>> +{
>>> +    struct seq_file *s = file->private_data;
>>> +    struct xe_gt *gt = s->private;
>>> +
>>> +    return write_to_gt_call(userbuf, count, ppos, force_reset_sync, gt);
>>> +}
>>> +
>>> +static int force_reset_sync_show(struct seq_file *s, void *unused)
>>> +{
>>> +    struct xe_gt *gt = s->private;
>>> +
>>> +    force_reset_sync(gt); /* to be deprecated! */
>>> +    return 0;
>>> +}
>>> +DEFINE_SHOW_STORE_ATTRIBUTE(force_reset_sync);
>>> +
>>>    void xe_gt_debugfs_register(struct xe_gt *gt)
>>>    {
>>>        struct xe_device *xe = gt_to_xe(gt);
>>> @@ -355,6 +407,10 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
>>>         */
>>>        root->d_inode->i_private = gt;
>>>    +    /* VF safe */
>>> +    debugfs_create_file("force_reset", 0600, root, gt,
>>> &force_reset_fops);
>>> +    debugfs_create_file("force_reset_sync", 0600, root, gt,
>>> &force_reset_sync_fops);
>>> +
>>>        drm_debugfs_create_files(vf_safe_debugfs_list,
>>>                     ARRAY_SIZE(vf_safe_debugfs_list),
>>>                     root, minor);

