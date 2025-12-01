Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0CAED116F1
	for <intel-xe@archiver.kernel.org>; Mon,  1 Dec 2025 17:48:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18B4610E439;
	Mon,  1 Dec 2025 17:48:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gb+wL5wN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C54EA10E439
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Dec 2025 17:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764611319; x=1796147319;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=o8Kpt/re9crLqxB0XzkVrd1QMVo0V2e2a3lFZlsHRgE=;
 b=Gb+wL5wNQyOjfdPRDSdJUbHafBYGJXHefi2JnhSMbR1uTPhSEnCK+Tx1
 f6/5bHoRh0htehOHDHG98pYlgzv7qS4k+u1bdI8sIFd0qZND7gobkIrNF
 8kh06b+fqSTi+rKA3pJfIPwEKuywddgM20L9SYPbMp0HLBMr2W54KmcFy
 Jp+dOkw/RUJxzHjrfBT7MfBXWV0ExvdLa7lCWrbh3y9x2bTlosAuX69E6
 G3vhFOxOanzxyOLsViDMnnuitbWUVCk1fDhTIVbJiBB1YAc5Cb26/rsXT
 YR+WczNEcoMrpQARLHLVa7fdww8W6D35RgnIE9/8AKnpMCsm3LpmIpKHC A==;
X-CSE-ConnectionGUID: khQBUJcyRVW1mH4EFltClw==
X-CSE-MsgGUID: tRhnU9kBTnGEcW/ti9Zb0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="70174466"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="70174466"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 09:48:38 -0800
X-CSE-ConnectionGUID: ov/E5ImIRDqO5tlgWG1G7A==
X-CSE-MsgGUID: CIxMpskUQGqdQsKH6fgTRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="194340245"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 09:48:37 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 09:48:37 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 1 Dec 2025 09:48:37 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.48) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 09:48:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pBggeywiDnWo4/PAz17htBP8656xDTN/LWswgsQh4in/CucXhjbGc9ml2Y7cI+LjY45qQzG1tYFHlU7ynN0F3OXyz0LDFl729bz0AI4QURxop8rJ4+XegCSPagB8EqZLzx108vT1Z8mBrBReVLbieqGykLrTyWMAqvlp0lp8Cjq+x4MQGShxkZmAwzfchelYcXjR1OyX43ML1gTuEDE3B+IZDOlwwB999hv/PfnWphMM2UuBVe8t1jWqaHjC0BLLa1Cuz0tbgy3pX6Qvzv5y+3NBGGmiLXYnYIgptLkT0vQQbLlr9DBqR10ooRH8EdQCaMpn9u+O0zYkl5TRQoltLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dZFjkh8dkKYzMz1RqSMv6W/ZYgotbif0iHEYdo55w+w=;
 b=HRL2nLPGTZRXkAXwFroBYQQ4MEiF5c/U/9V3XbavQZlK/uKEXYT5U2CSMYYzjbfEvQHhpCmeu8ccVH/OiKIPWxnUnFiyXCUBzYJtyhg6c8i4C74lNHoBjJZ0RLrLrwIVgrIVVs3f57HZc3MABflvCjAYzHeNsdrHY0zueIXfR/GJa9b4w9MhczBtnfcrEL63ZEDO3ul5yFJaKn35HpmBXtZ1sdoGEwpvJc0gkPuqJNMgJDAkpWbpj+LAyTbcQbk02qK5lU1d5G8z0wCYnV/yzV6UOK2Mj+q4NbtYZ3L0Vw9sLAL1yPzXUTdk24g8GB754KOmlizmyUDiD/6yAR77hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by IA1PR11MB6396.namprd11.prod.outlook.com (2603:10b6:208:3ab::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 17:48:34 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 17:48:34 +0000
Date: Mon, 1 Dec 2025 12:48:31 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>
Subject: Re: [PATCH v2 1/2] drm/xe/xe_survivability: Redesign survivability
 mode
Message-ID: <aS3U7x5mabFPF23e@intel.com>
References: <20251201143420.3158372-4-riana.tauro@intel.com>
 <20251201143420.3158372-5-riana.tauro@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251201143420.3158372-5-riana.tauro@intel.com>
X-ClientProxiedBy: BYAPR08CA0054.namprd08.prod.outlook.com
 (2603:10b6:a03:117::31) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|IA1PR11MB6396:EE_
X-MS-Office365-Filtering-Correlation-Id: b861744c-6b2b-4a65-d08a-08de3101d954
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c0wvUHcraU1IK3ozRDdmY0ZRK0ZIYkR4N0VVRml2b2V1b2JlczJZVEhoQlJ1?=
 =?utf-8?B?VEtLSFlLSjZ4TUpmbUVjZjZESEtnTmlTVjdXdGhVN29qejNRRUt5MnJuL0g4?=
 =?utf-8?B?QkEwMmpvd0Jxci9ZYUM3cXZZSmlodzM0a081SUZHWXQrSTFDcVBVZ3hxNzNO?=
 =?utf-8?B?R25oamtVR1owdHJwVFduK3VKNUkxOHoyNUIvU2pwWnV5SlZ5cVhxd1dBejhE?=
 =?utf-8?B?aktpUDRpYjg3Tm1nL082T2pBVFA2R003QTMvNHJUWDlzZnRmZTAycWN6MEtV?=
 =?utf-8?B?VjB1cHFnL2tQb1dLNXpBdjFFWkI4NVUvQnFrNDRxclZZWUdJVXp3bkwvc2JW?=
 =?utf-8?B?bUxsL0txbG9ROUYrbTFlQzNqZlpDb3AxS2s3UTdKbzhxOGl5R1hFQWMwQU9W?=
 =?utf-8?B?dXU2ck5kQVVNQkp0WEdLVmVZUWlaNFk5WWphT0RUZXUrbnFiVVZ5TUppNUEx?=
 =?utf-8?B?Yk5WT3dUaTJwTGl2VXVTUjNPRGZJSzloOGMrTmVxOVc0OWU2MzF3U2liT1R1?=
 =?utf-8?B?MEE2NWFSM01wTXp3OGFYajZrd1hPR0E5Mnp3THFuUkdJQUkwam1qNXMzTFNk?=
 =?utf-8?B?ckFFR0xjQk9KYlNSOXVKQVN6TkRqNnFYeERieFBSbXZNcDNWazJaT1AyS01t?=
 =?utf-8?B?UXpjd2pDamllL3ZqZVpzUHk3RjQxZ25XSGlTejArdGIzK1ROeHhFUXhwaXND?=
 =?utf-8?B?dExkT3ljZWthYW5lemlSWmVOZzhVbzJPK3E4b2NVcktUNG54OTNNWURCbWlH?=
 =?utf-8?B?MjNxME51Y1dSNEJGWEIxQjBGSnZGZW9TV01ic2Nxa2wzSGxEaHpyV2xjUXdR?=
 =?utf-8?B?V1RDODBaZkdLbk4vTlJ0M3c0S0c2TEJtcjFQc0dwNk5waVViMUtaNlZoa3c4?=
 =?utf-8?B?Q0NweUxYUkdxZHBKZkVjM3BuUjVYYzZmWWZYRkIzeXpRS1F1ZlRBa1RvVWhC?=
 =?utf-8?B?dEM3cXBHNmc1ci9nM3hJNFVDRFRTMzQwb29HdlRnZzJhUit5S2JOV3VuOUdn?=
 =?utf-8?B?a0lVcEd3emdjcTZ1TVE2cUFvbU9rV2VzZW1LdUNydVJCcmJBbkRqT0xpbjNZ?=
 =?utf-8?B?WjFVak9HUkFxUXN2N3EzZkI3VElBTWV4V3AySVMvcUN3YzBtTnhiMDcvenZt?=
 =?utf-8?B?M1pBK2hndkFYQklRS0w3SWRHMm03dllneE5hQ0NrS3YzZFZ3ajV6dHRibzlG?=
 =?utf-8?B?S1plck9EQis3cnVYVEZWYnB2Vmc2cGY4NU5aSlBGRno2cnFmNE9zbEtGS245?=
 =?utf-8?B?aWdMRVZuN3pYOGd4a3pjeEpMUVFtcmwxdEs0b2d1Zm9RN0RoalovWFJ6dUJl?=
 =?utf-8?B?TlcxaWlQZ1hIR3o1VGI0djBwU25iMWxaOTZLNVFveWc5dVZualFySktlNmNN?=
 =?utf-8?B?R3R5UUZkMDM0aFVCdGFCU242K1hOSHk2aXBJRjNXUEVNKzZhU3IrcTRNWWRE?=
 =?utf-8?B?ZzEycHNwNU1MT2J0MWx4LzExNlIyQXdsdDdRV2o0U296c0VwUEF6VXpmWUdl?=
 =?utf-8?B?TXVPbzJNN2w3cTFZemV1VEJYdG9YeDMwU2pmQWJTT3VnMGtTdzNGM0hNV2Ur?=
 =?utf-8?B?TXhEcnFvNnVZTHVNVm1keXZ4Tm1SYXMyWElKWFVIWTE1blR6TnZNVDZFcDBk?=
 =?utf-8?B?MjN6eEgxZWVBdVF4V2g5bWU5QThNMmthNDBVdmxQYzZ6OU0zaFRNc2dySEph?=
 =?utf-8?B?UVRKTzNRVGVGanBiZ05CZkZ0UlplSE1YZUd5L0dKdEtIVHBxa0orUGZtaXov?=
 =?utf-8?B?aVJpS3lOSFlyL1AwSEl3Q2lYb0dzZGJ6c3VSTFNoZUROeWFFVFhMVGpqVDJ2?=
 =?utf-8?B?YUF3UjBZbERMakJBQTcrRHloMXRzNFJxNkJYV08yeHo3Sm1meVBtS21mY21j?=
 =?utf-8?B?Q3p6YWl4SU1sUlEzWnVORjJvVjVUbklSdTdyZ2NmeDNwYVRIbXNSM3NubmxG?=
 =?utf-8?Q?U983QFKET3iE1dZIvJXAfMAX14Oaxsmm?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c3YvSERpeHY5NGhJYlVkN2VUYk40eGZkTkRRVE9pTGpEOTN4M0NxbWgwRkJu?=
 =?utf-8?B?M24yZk9kM3BKL3lLNDFnUHVienNxQUFmZ3RuTENTMVFSUWZnbmdjdjNWTXFO?=
 =?utf-8?B?dFFxRjRpUDJiLzNWNlBvTmV0V0N6bnBPYXllR1pkYlNBb0xqQjdvVlczdnc4?=
 =?utf-8?B?SUNrUGp1QVppRlVXblFkdlNxYUVrSEFFRGg5TmNYeG9DK1pKdUtqb0c3ZFZV?=
 =?utf-8?B?MEFjY3pmZC9tQnV0bVBiRDhpaU04MHhuTTRxV0EwcUU4anN0dFNKZ2x1M0I0?=
 =?utf-8?B?VWU2a3RIM1JQRm5HR2dDN0dmZlVYU01vYlZLZnZwMDFSL3c0L3ZySWpDZnFY?=
 =?utf-8?B?ZDUrUDhmT0x0LzRZWVZuaTZlSExTTkE5clRmcFNuQklJRjYyb3hxOTdPSkEx?=
 =?utf-8?B?b2YwcHZVVk4rRUY5bXAydUJGNFkwREQ3b3oxY2tZaVFWR0JzK2IzcDRvN3hw?=
 =?utf-8?B?RkJ2Z3JaMVZtYTJQTWcrUlJDemwrVEVJSWZGbGZLZXdBc3VVRkFkd2tQOUNk?=
 =?utf-8?B?SHZYZ0dLSDVuVlpzeWZJU1hYemdUeHlpd05uYjIrUHRzYTZqMm1SZ2tpTmkw?=
 =?utf-8?B?WVNYWElRdlBpbThLWEdSb2luR0g5N25IQTk4MlRkL3owQWJaRkV1S2I2QUU5?=
 =?utf-8?B?UWZMYmdad21EZi9jbzQveVdUVWpOYXh3Qkc2TXc4cCtTMUpRSGdVaCsvN0JC?=
 =?utf-8?B?dlJzVlhwcmpvZEtYbmUwdkt5eWxpc2ZWUjJnVTMwWVEydEtJNUZaaUpiYkYy?=
 =?utf-8?B?ZlJTUzBUVHZJRDl3V3hTYWhhUjg3TWNPeFZ4K3ZyTitvVW8yU0JoVGhveXBq?=
 =?utf-8?B?bzU4eTZ2SHp6TEUxWWNFYksrNEdtYzl1dlR2S0xqUVhwOHVLRG1GdGRpYjJD?=
 =?utf-8?B?R2hDMWlsamVOYzFjUWp6dUlHWDVqR1BVNXRReUtWQ21TeWJWVnE4Tnh3T2tl?=
 =?utf-8?B?WFpUNm5WTUwraGtTTWFSM2F0MFU2VWNzM3dCblh0bkxucG01NlgwaGJFWm1v?=
 =?utf-8?B?UGtSTjFXcVgvTmNEOTl1c3lmNXlWblZIN1oyL1pnRXg1bVN4Ym9zV3l6YzNs?=
 =?utf-8?B?bDcreG45RE9LMjdSQTBZYk1MQUpqdVZFWW04MG5PdllmWWlpTHlJVlYwVlp0?=
 =?utf-8?B?YnlibTBMVDhrMHRNK2Z3L1podWNsdXZXeFRyVlR4cUhZck1IUldLdjU0dGty?=
 =?utf-8?B?aXMrNDB6d1NSRnRQa3NjU1ZjWGw5cUcrdEtLa0o1a1ZSRVQ3RThlbzJXam02?=
 =?utf-8?B?ZDA5bVZGUFh0ZEZQeElmL3NFcjB3RWdlQ1U5SmdrS3RqZmpmZStCWW9vZHov?=
 =?utf-8?B?R1FzOWxPa09sMVRJTkFoOXErNGlXVEtxTzA4R29ZcG1yZWdtTjREbkJYVWJN?=
 =?utf-8?B?ZDRCaHB5akpnMk8rSWNXWVVzZmkyWXd5UC84Sms0OS81bUY4WkNxbmlTQnIy?=
 =?utf-8?B?endIWXZGVTRIZkhLZmZnN3AwRHFHT2xPWXFVQnRIOXhyZjdFeStJcVMzQTM2?=
 =?utf-8?B?aWdaMUZnbjVBTVVWSlVoR0VjcDN2Smpkb2cvWVpqeEM5d1pwd09rZWdVNVdV?=
 =?utf-8?B?eUlKTlVGa1AzcTUyTFRTZDdSUHRpdjJZdFczQWlVRHlob29rSEtrRDBtYm51?=
 =?utf-8?B?SU40NVBFMW8zYnlHbW1BNUpJZTNnZEtyUEZBOEJMZXBMc1JwV0JhVzl5b3Z4?=
 =?utf-8?B?THBCV09DSmxMVEpKVFMwd3JRSGFzdWlBSkxzZzEyaGVMeU82S0tNM0VRZmRX?=
 =?utf-8?B?WE9veHo1NklTVnJkb3hpdFpZQW1FR0RHNHZSVEx0WlY1QWJhcWNEMVhIU3Js?=
 =?utf-8?B?Z2pPZXNiNDZsQzNKaVF5aW1pMk1ZUGMyY3dBSEY2a1paRXRhbTJaNlRuNHgw?=
 =?utf-8?B?d3JMZHFVM1ZleCs4TzNJRGRad1hReVc4WUxUaGhBYVN0TUozV2djNFYxOWdC?=
 =?utf-8?B?QlJQSmdTSGRLMmxORmFBRDdUUTcrN1hkYzhHdXR4NVFOZG1wYkJqUWpoTlAv?=
 =?utf-8?B?NDg1dm1PakxRZDZ3T2d3Z3FrTXlDYTVjZGVKR2QzZXdsdHVBZHM3RGFJOGhP?=
 =?utf-8?B?YzBEbmVaVjZVV2g1VWs4Q1B4NVpmRVdrSmRmcFF3NDZvK2Y1ekdQZmZ0N2N1?=
 =?utf-8?Q?hKmRYsOnEVUVeZJrta06m0mJv?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b861744c-6b2b-4a65-d08a-08de3101d954
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 17:48:34.6499 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V7dchHzty1xf7gZ8V+SY/gT76P1+FErbogVZPoRKhOaF5BRgO7dg5J6N7byY+vEqioS1pVl+ujDaj8ZgcwObNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6396
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

On Mon, Dec 01, 2025 at 08:04:22PM +0530, Riana Tauro wrote:
> Redesign survivability mode to have only one value per file.
> 
> 1) Retain the survivability_mode sysfs to indicate the type
> 
> 	cat /sys/bus/pci/devices/0000\:03\:00.0/survivability_mode
> 	(Boot / Runtime)
> 
> 2) Add survivability_info directory to expose boot breadcrumbs.
> Entries in survivability mode sysfs are only visible when
> boot breadcrumb registers are populated.
> 
> 	/sys/bus/pci/devices/0000:03:00.0/survivability_info
> 	├── aux_info0
> 	├── aux_info1
> 	├── aux_info2
> 	├── aux_info3
> 	├── aux_info4
> 	├── capability_info
> 	├── postcode_trace
> 	└── postcode_trace_overflow
> 
> Capability_info:
> 
> 	Provides data about boot status and has bits that
> 	indicate the support for the other breadcrumbs
> 
> Postcode Trace / Postcode Trace Overflow :
> 
> 	Each postcode is represented as an 8-bit value and represents
> 	a boot failure event. When a new failure event is logged by Pcode
> 	the existing postcodes are shifted left. These entries provide a
> 	history of 8 postcodes.
> 
> Auxiliary Info:
> 
> 	Some failures have additional debug information.
> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
> v2: Add array map for names (Rodrigo)
> ---
>  drivers/gpu/drm/xe/xe_survivability_mode.c    | 199 +++++++++++-------
>  .../gpu/drm/xe/xe_survivability_mode_types.h  |  22 +-
>  2 files changed, 135 insertions(+), 86 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
> index 1662bfddd4bc..b5b582442637 100644
> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
> @@ -19,8 +19,6 @@
>  #include "xe_pcode_api.h"
>  #include "xe_vsec.h"
>  
> -#define MAX_SCRATCH_MMIO 8
> -
>  /**
>   * DOC: Survivability Mode
>   *
> @@ -48,19 +46,25 @@
>   *
>   * Refer :ref:`xe_configfs` for more details on how to use configfs
>   *
> - * Survivability mode is indicated by the below admin-only readable sysfs which provides additional
> - * debug information::
> + * Survivability mode is indicated by the below admin-only readable sysfs entry::
>   *
>   *	/sys/bus/pci/devices/<device>/survivability_mode
>   *
> - * Capability Information:
> - *	Provides boot status
> - * Postcode Information:
> - *	Provides information about the failure
> - * Overflow Information
> - *	Provides history of previous failures
> - * Auxiliary Information
> - *	Certain failures may have information in addition to postcode information
> + * Survivability mode sysfs provides information about the type of survivability mode.

Perhaps expand here that it is ether 'Runtime' or 'Boot'...

> + * Any additional debug information if present will be visible under the directory
> + * ``survivability_info``::
> + *
> + *     /sys/bus/pci/devices/<device>/survivability_info/
> + *
> + * This directory has the following attributes
> + *
> + * - ``capability_info`` : Indicates Boot status and support for additional information
> + *
> + * - ``postcode_trace``, ``postcode_trace_overflow`` : Each postcode is a 8bit value and
> + *   represents a boot failure event. When a new failure event is logged by PCODE the
> + *   existing postcodes are shifted left. These entries provide a history of 8 postcodes.
> + *
> + * - ``aux_info<n>`` : Some failures have additional debug information
>   *
>   * Runtime Survivability
>   * =====================
> @@ -79,49 +83,63 @@
>   * to restore device to normal operation.
>   */
>  
> +static const char * const reg_map[] = {
> +	[CAPABILITY_INFO]         = "Capability_info",

Why do we need '_' between the words here instead of space like
the entries below?

> +	[POSTCODE_TRACE]          = "Postcode trace",
> +	[POSTCODE_TRACE_OVERFLOW] = "Postcode trace overflow",
> +	[AUX_INFO0]               = "Auxiliary Info 0",
> +	[AUX_INFO1]               = "Auxiliary Info 1",
> +	[AUX_INFO2]               = "Auxiliary Info 2",
> +	[AUX_INFO3]               = "Auxiliary Info 3",
> +	[AUX_INFO4]               = "Auxiliary Info 4",
> +};
> +
> +struct xe_survivability_attribute {
> +	struct device_attribute attr;
> +	u8 index;
> +};
> +
> +static struct
> +xe_survivability_attribute *dev_attr_to_survivability_attr(struct device_attribute *attr)
> +{
> +	return container_of(attr, struct xe_survivability_attribute, attr);
> +}
> +
>  static u32 aux_history_offset(u32 reg_value)
>  {
>  	return REG_FIELD_GET(AUXINFO_HISTORY_OFFSET, reg_value);
>  }
>  
> -static void set_survivability_info(struct xe_mmio *mmio, struct xe_survivability_info *info,
> -				   int id, char *name)
> +static void set_survivability_info(struct xe_mmio *mmio, u32  *info, int id)
>  {
> -	strscpy(info[id].name, name, sizeof(info[id].name));
> -	info[id].reg = PCODE_SCRATCH(id).raw;
> -	info[id].value = xe_mmio_read32(mmio, PCODE_SCRATCH(id));
> +	info[id] = xe_mmio_read32(mmio, PCODE_SCRATCH(id));
>  }
>  
>  static void populate_survivability_info(struct xe_device *xe)
>  {
>  	struct xe_survivability *survivability = &xe->survivability;
> -	struct xe_survivability_info *info = survivability->info;
> +	u32 *info = survivability->info;
>  	struct xe_mmio *mmio;
>  	u32 id = 0, reg_value;
> -	char name[NAME_MAX];
>  	int index;
>  
>  	mmio = xe_root_tile_mmio(xe);
> -	set_survivability_info(mmio, info, id, "Capability Info");
> -	reg_value = info[id].value;
> +	set_survivability_info(mmio, info, CAPABILITY_INFO);
> +	reg_value = info[CAPABILITY_INFO];
>  
>  	if (reg_value & HISTORY_TRACKING) {
> -		id++;
> -		set_survivability_info(mmio, info, id, "Postcode Info");
> +		set_survivability_info(mmio, info, POSTCODE_TRACE);
>  
> -		if (reg_value & OVERFLOW_SUPPORT) {
> -			id = REG_FIELD_GET(OVERFLOW_REG_OFFSET, reg_value);
> -			set_survivability_info(mmio, info, id, "Overflow Info");
> -		}
> +		if (reg_value & OVERFLOW_SUPPORT)
> +			set_survivability_info(mmio, info, POSTCODE_TRACE_OVERFLOW);
>  	}
>  
>  	if (reg_value & AUXINFO_SUPPORT) {
>  		id = REG_FIELD_GET(AUXINFO_REG_OFFSET, reg_value);
>  
> -		for (index = 0; id && reg_value; index++, reg_value = info[id].value,
> -		     id = aux_history_offset(reg_value)) {
> -			snprintf(name, NAME_MAX, "Auxiliary Info %d", index);
> -			set_survivability_info(mmio, info, id, name);
> +		for (index = 0; id >= AUX_INFO0 && id < MAX_SCRATCH_REG; index++) {
> +			set_survivability_info(mmio, info, id);
> +			id = aux_history_offset(info[id]);
>  		}
>  	}
>  }
> @@ -130,15 +148,14 @@ static void log_survivability_info(struct pci_dev *pdev)
>  {
>  	struct xe_device *xe = pdev_to_xe_device(pdev);
>  	struct xe_survivability *survivability = &xe->survivability;
> -	struct xe_survivability_info *info = survivability->info;
> +	u32 *info = survivability->info;
>  	int id;
>  
>  	dev_info(&pdev->dev, "Survivability Boot Status : Critical Failure (%d)\n",
>  		 survivability->boot_status);
> -	for (id = 0; id < MAX_SCRATCH_MMIO; id++) {
> -		if (info[id].reg)
> -			dev_info(&pdev->dev, "%s: 0x%x - 0x%x\n", info[id].name,
> -				 info[id].reg, info[id].value);
> +	for (id = 0; id < MAX_SCRATCH_REG; id++) {
> +		if (info[id])
> +			dev_info(&pdev->dev, "%s: 0x%x\n", reg_map[id], info[id]);
>  	}
>  }
>  
> @@ -156,25 +173,38 @@ static ssize_t survivability_mode_show(struct device *dev,
>  	struct pci_dev *pdev = to_pci_dev(dev);
>  	struct xe_device *xe = pdev_to_xe_device(pdev);
>  	struct xe_survivability *survivability = &xe->survivability;
> -	struct xe_survivability_info *info = survivability->info;
> -	int index = 0, count = 0;
>  
> -	count += sysfs_emit_at(buff, count, "Survivability mode type: %s\n",
> -			       survivability->type ? "Runtime" : "Boot");
> +	return sysfs_emit(buff, "%s\n", survivability->type ? "Runtime" : "Boot");
> +}
>  
> -	if (!check_boot_failure(xe))
> -		return count;
> +static DEVICE_ATTR_ADMIN_RO(survivability_mode);
>  
> -	for (index = 0; index < MAX_SCRATCH_MMIO; index++) {
> -		if (info[index].reg)
> -			count += sysfs_emit_at(buff, count, "%s: 0x%x - 0x%x\n", info[index].name,
> -					       info[index].reg, info[index].value);
> -	}
> +static ssize_t survivability_info_show(struct device *dev,
> +				       struct device_attribute *attr, char *buff)
> +{
> +	struct xe_survivability_attribute *sa = dev_attr_to_survivability_attr(attr);
> +	struct pci_dev *pdev = to_pci_dev(dev);
> +	struct xe_device *xe = pdev_to_xe_device(pdev);
> +	struct xe_survivability *survivability = &xe->survivability;
> +	u32 *info = survivability->info;
>  
> -	return count;
> +	return sysfs_emit(buff, "0x%x\n", info[sa->index]);
>  }
>  
> -static DEVICE_ATTR_ADMIN_RO(survivability_mode);
> +#define SURVIVABILITY_ATTR_RO(name, _index)					\
> +	struct xe_survivability_attribute attr_##name =	{			\
> +		.attr =  __ATTR(name, 0400, survivability_info_show, NULL),	\
> +		.index = _index,						\
> +	}
> +
> +SURVIVABILITY_ATTR_RO(capability_info, CAPABILITY_INFO);
> +SURVIVABILITY_ATTR_RO(postcode_trace, POSTCODE_TRACE);
> +SURVIVABILITY_ATTR_RO(postcode_trace_overflow, POSTCODE_TRACE_OVERFLOW);
> +SURVIVABILITY_ATTR_RO(aux_info0, AUX_INFO0);
> +SURVIVABILITY_ATTR_RO(aux_info1, AUX_INFO1);
> +SURVIVABILITY_ATTR_RO(aux_info2, AUX_INFO2);
> +SURVIVABILITY_ATTR_RO(aux_info3, AUX_INFO3);
> +SURVIVABILITY_ATTR_RO(aux_info4, AUX_INFO4);
>  
>  static void xe_survivability_mode_fini(void *arg)
>  {
> @@ -182,17 +212,48 @@ static void xe_survivability_mode_fini(void *arg)
>  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>  	struct device *dev = &pdev->dev;
>  
> -	sysfs_remove_file(&dev->kobj, &dev_attr_survivability_mode.attr);
> +	device_remove_file(dev, &dev_attr_survivability_mode);
> +}
> +
> +static umode_t survivability_info_attrs_visible(struct kobject *kobj, struct attribute *attr,
> +						int idx)
> +{
> +	struct xe_device *xe = kdev_to_xe_device(kobj_to_dev(kobj));
> +	struct xe_survivability *survivability = &xe->survivability;
> +	u32 *info = survivability->info;
> +
> +	if (info[idx])
> +		return 0400;
> +
> +	return 0;
>  }
>  
> +/* Attributes are ordered according to enum scratch_reg */
> +static struct attribute *survivability_info_attrs[] = {
> +	&attr_capability_info.attr.attr,
> +	&attr_postcode_trace.attr.attr,
> +	&attr_postcode_trace_overflow.attr.attr,
> +	&attr_aux_info0.attr.attr,
> +	&attr_aux_info1.attr.attr,
> +	&attr_aux_info2.attr.attr,
> +	&attr_aux_info3.attr.attr,
> +	&attr_aux_info4.attr.attr,
> +	NULL,
> +};
> +
> +static const struct attribute_group survivability_info_group = {
> +	.name = "survivability_info",
> +	.attrs = survivability_info_attrs,
> +	.is_visible = survivability_info_attrs_visible,
> +};
> +
>  static int create_survivability_sysfs(struct pci_dev *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  	struct xe_device *xe = pdev_to_xe_device(pdev);
>  	int ret;
>  
> -	/* create survivability mode sysfs */
> -	ret = sysfs_create_file(&dev->kobj, &dev_attr_survivability_mode.attr);
> +	ret = device_create_file(dev, &dev_attr_survivability_mode);
>  	if (ret) {
>  		dev_warn(dev, "Failed to create survivability sysfs files\n");
>  		return ret;
> @@ -203,6 +264,12 @@ static int create_survivability_sysfs(struct pci_dev *pdev)
>  	if (ret)
>  		return ret;
>  
> +	if (check_boot_failure(xe)) {
> +		ret = devm_device_add_group(dev, &survivability_info_group);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	return 0;
>  }
>  
> @@ -239,25 +306,6 @@ static int enable_boot_survivability_mode(struct pci_dev *pdev)
>  	return ret;
>  }
>  
> -static int init_survivability_mode(struct xe_device *xe)
> -{
> -	struct xe_survivability *survivability = &xe->survivability;
> -	struct xe_survivability_info *info;
> -
> -	survivability->size = MAX_SCRATCH_MMIO;
> -
> -	info = devm_kcalloc(xe->drm.dev, survivability->size, sizeof(*info),
> -			    GFP_KERNEL);
> -	if (!info)
> -		return -ENOMEM;
> -
> -	survivability->info = info;
> -
> -	populate_survivability_info(xe);
> -
> -	return 0;
> -}
> -
>  /**
>   * xe_survivability_mode_is_boot_enabled- check if boot survivability mode is enabled
>   * @xe: xe device instance
> @@ -325,9 +373,7 @@ int xe_survivability_mode_runtime_enable(struct xe_device *xe)
>  		return -EINVAL;
>  	}
>  
> -	ret = init_survivability_mode(xe);
> -	if (ret)
> -		return ret;
> +	populate_survivability_info(xe);
>  
>  	ret = create_survivability_sysfs(pdev);
>  	if (ret)
> @@ -356,14 +402,11 @@ int xe_survivability_mode_boot_enable(struct xe_device *xe)
>  {
>  	struct xe_survivability *survivability = &xe->survivability;
>  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> -	int ret;
>  
>  	if (!xe_survivability_mode_is_requested(xe))
>  		return 0;
>  
> -	ret = init_survivability_mode(xe);
> -	if (ret)
> -		return ret;
> +	populate_survivability_info(xe);
>  
>  	/* Log breadcrumbs but do not enter survivability mode for Critical boot errors */
>  	if (survivability->boot_status == CRITICAL_FAILURE) {
> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode_types.h b/drivers/gpu/drm/xe/xe_survivability_mode_types.h
> index cd65a5d167c9..f31b3907d933 100644
> --- a/drivers/gpu/drm/xe/xe_survivability_mode_types.h
> +++ b/drivers/gpu/drm/xe/xe_survivability_mode_types.h
> @@ -9,23 +9,29 @@
>  #include <linux/limits.h>
>  #include <linux/types.h>
>  
> +enum scratch_reg {
> +	CAPABILITY_INFO,
> +	POSTCODE_TRACE,
> +	POSTCODE_TRACE_OVERFLOW,
> +	AUX_INFO0,
> +	AUX_INFO1,
> +	AUX_INFO2,
> +	AUX_INFO3,
> +	AUX_INFO4,
> +	MAX_SCRATCH_REG,
> +};
> +
>  enum xe_survivability_type {
>  	XE_SURVIVABILITY_TYPE_BOOT,
>  	XE_SURVIVABILITY_TYPE_RUNTIME,
>  };
>  
> -struct xe_survivability_info {
> -	char name[NAME_MAX];
> -	u32 reg;
> -	u32 value;
> -};
> -
>  /**
>   * struct xe_survivability: Contains survivability mode information
>   */
>  struct xe_survivability {
> -	/** @info: struct that holds survivability info from scratch registers */
> -	struct xe_survivability_info *info;
> +	/** @info: survivability debug info */
> +	u32 info[MAX_SCRATCH_REG];
>  
>  	/** @size: number of scratch registers */
>  	u32 size;
> -- 
> 2.47.1
> 
