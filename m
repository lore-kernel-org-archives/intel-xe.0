Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE2B4D31A26
	for <intel-xe@archiver.kernel.org>; Wed, 14 Jan 2026 08:56:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 803DB10E5A1;
	Wed, 14 Jan 2026 08:56:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nywXZPav";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F393410E5A1
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Jan 2026 08:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768380985; x=1799916985;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=WgNwhj+REqAxbuRqJ9kx1GmLQsGU6cmZGuO98Qz7xM0=;
 b=nywXZPavyQhoKLbnfZQCfoYpcXztsaapoU2Rl2ERjSRla7OQqO2nYSFQ
 b5/y7l7PCbnuSWvkCCpYjZPoAdY68ZBarZpuUMLIRrAkKziod58vMpYiL
 WO2T1mQJx84LaLCq3fvRoqvDN8cGAyKh485LL0qR31vPjwvYmK4+xKtgJ
 r2W16jxZcIWw1Oi7nWTHMa5FtvX+kHG7O2eX5p5/WeKP9sTC3+HWDWrYk
 NM/lQYJJr4sN8Co7leAjPBIKZRTVRNcTocWuFk7fAMui1F9Wy1fJq7HkC
 Ryf2cJ8ttmsKFYvIHbbmQ8en94xgX/KHEJSu8c2sMvR1VjnwYTLArS/Dy A==;
X-CSE-ConnectionGUID: PBKUF17OQi6vTtBxX6u7dQ==
X-CSE-MsgGUID: Z5jhcaiVSh2oSUjqPi7RuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="72258180"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; d="scan'208";a="72258180"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2026 00:56:24 -0800
X-CSE-ConnectionGUID: 0dw8JWA8SeqLuYrY4JyDmQ==
X-CSE-MsgGUID: lVmAk66ZS3eYW86lbMUTAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; d="scan'208";a="205180749"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2026 00:56:20 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 14 Jan 2026 00:56:19 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 14 Jan 2026 00:56:19 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.59) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 14 Jan 2026 00:56:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N2js6t3oZEpH6DiTKt6JrjG7waH9jRPlp/wzTCFqJ6gqmscwNGFuZ0veTHgadnG+MoPHnpviQKtLgjBGA9v2BZgyOBVDCZ2YJ1H3/oUzGv3A1So+Zxs0QS3Riyz/cbqsx/pie9LBMMFXweZGsymue2Qq/TUhLdL4HRWfdSZ167+IprnU3dydYCBJkGpa9jJ1kXrIszdKtn0pGuARzmP6QKQ5Z+clqC1B0DNCAFgNKtTHZ/bVg894QTcyxwQdwJb/ZfgTHvbcSa5DQ2iLEoUMxEgfI232IDzsT3bdayE0ANzFNJ3rbxNFK8bXOy8SCE5HvXa7YriQ7jNA6BDoOM6Lmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7/4Qzbh4up5xNzl/Fu9aMe/LHi6bBeWJe2WAxAX+9Hw=;
 b=y9Mh+jOBu8EdeVehlzzeF7EIHRlV4YmO5CQgRhkiomKOgNK8EJP01/pDV7yZlWwGkPSPpnTUmKemsIDXGjzX2cugY0Wf+swvM3V5JrgYSAELlDdI5/sD7ad4vekRkYfi2qQOk3yC2CdrjGHiMnJ3v9obFvkWQkUNawiHnOw9roNGJs4z84kuILOYIm59ojorKZOwrHXJqjvRM3/zJGJq43KjfkrDumi94z/msMIv2w9NLz/+d7fhGrrT3f05JmfsHIAZ5hPaEmFzROG+poWDya/r2SysPtFjAHYXaRBK0H7DJ7wTOKid/0JxKClPFcthEFODUMnTVPx9UzZ772KwEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by SJ5PPF162366726.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::813) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Wed, 14 Jan
 2026 08:56:17 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::d269:c67e:1cc2:d1ca]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::d269:c67e:1cc2:d1ca%6]) with mapi id 15.20.9520.003; Wed, 14 Jan 2026
 08:56:17 +0000
Message-ID: <8beecd3b-8de0-46d9-a4d1-2c107f2425c0@intel.com>
Date: Wed, 14 Jan 2026 09:56:13 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/mert: Improve handling of MERT CAT errors
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260112183716.28700-1-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <20260112183716.28700-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR06CA0183.eurprd06.prod.outlook.com
 (2603:10a6:803:c8::40) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|SJ5PPF162366726:EE_
X-MS-Office365-Filtering-Correlation-Id: e5bb32f6-954b-425a-3a92-08de534ac737
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cjNrdk84WEpPZjhWR0RYczBsZzFMV0YySTg0Njd5Zy9jbEdDYzJXSDRhZzBO?=
 =?utf-8?B?U1dQM2ppMWZYNkpEYnJpb0EwUmlXVGN6cWNCUWpRNnVlcnJlOTRneGpYcktM?=
 =?utf-8?B?bzg0UFVoWU96c0Rzb3RmZUM3eGxoUXNaZEtLUXNtaTFZdlpMVnBZd081NGVF?=
 =?utf-8?B?Z053S05BQkNNN09vVGVsd05NVys1UXNYSGx0ME00ZHZSMzlNSXNVTEdPbDFl?=
 =?utf-8?B?UTRxUm0vNDQ3MlRQQXg4d2cwRVBteFVuUkE3VExvLy9yK1g3U3laWld5Y3gw?=
 =?utf-8?B?d1ZYaXhtcHNYOTJtREZXeklta1R0dXpYYzcrU1VpdjZEWi8zZ1hFMUQwaDNS?=
 =?utf-8?B?MFlBQ0ZnVXZaSkVQbWkrYkRHU0RXdWF5eVdpZHlPcjJTK3VlSUltWFlCaklY?=
 =?utf-8?B?eDVNU0dSVklVVHBSQ2NMdGVFcVpFSkw3ZVpIdFlmYXVWM2dpSGt5S213WmRM?=
 =?utf-8?B?cXUxZjZZU3U5MTNOalVqNG9CSUlDYlBZa3JsWFBVTitIY091bkhTQXptL1VR?=
 =?utf-8?B?WG5SOUJvei9DeTNMbGtwTUhOdXpSMDJWTW9NZGpUVHBkTlZOY1JSWHpOUWlZ?=
 =?utf-8?B?bmZVem5YeWEybDFGL1BQZVN0cTRZUlhTcGtmbTk1bnN0Z1VFcmhLWi9kdDRW?=
 =?utf-8?B?aWh0WTIzOFRpemkvMGVIeUNTVGlzNVAyend6L084MXIvd1JXeUEvT0lTNndn?=
 =?utf-8?B?SG9XRmY5SjFkTHpUY21HOTA3R0N6dG5waTBieUFqV3d5QzhuOHJ2MnZMbTJT?=
 =?utf-8?B?VWphR0ZOelJMcXJRbGJLM0VtM2lvZW40UXk2cUcwcGIwQjFZSGlQUlJXSW15?=
 =?utf-8?B?dTJmQTBrWTlveW8vV2t1K2I1cUZCemdNQ0JmMnRUT20rbW43VlpkZjRTdk5N?=
 =?utf-8?B?TURvSmlET2VVdlhRYS9kNlZrWjQ2MWdPcW5lQkpucDJuNStYNHorR0tUZ2d0?=
 =?utf-8?B?QzVibUo4RUhpZEQzR05neEcycm1sUXNVcVBLRlNFZ2NQMDhQVlk5UXMzem8z?=
 =?utf-8?B?QWJzcDREQ2FtTEl3UGl5UUJpWUErcS9MRGhXVDVtUmJlUytPQ2U0elA0NDV2?=
 =?utf-8?B?YitxL1VDM2cvVjZGQjVvLzJyZlZXZlVtWnRla0h6MzJVUWF1VlFSUWtaYjh2?=
 =?utf-8?B?Y3NIamdqMFMvVlYwZ29yc2hQamRNcEdUZWZwWmpjZzA0QUd6ZXgzSjNjQXVx?=
 =?utf-8?B?UGJaVlkzaEI2UERkajF6VGN5eTI2NXZUbVFXVWxTb2laYkR6UFNPeTZnK1Rp?=
 =?utf-8?B?b3NFLzFrdE5zVlZOYjVjVkNBbCsyKzAwbmNUZjc2V1Exd2hzaUlDcTRPZkNB?=
 =?utf-8?B?MDhWUUl2T0NENlFPMVhuemVCK0tnNkhPYTZseDJUa2V3OHYvNE1NZVQ2TXlt?=
 =?utf-8?B?dDJNeHpJbHJuZWRwcFRFYlA0N1diM2Q5dmowZmVmajBmWjFXVXcyQnU2VUVJ?=
 =?utf-8?B?bzEyNi9pL0swNjZZZTc2SnY4VitaNEVKdXcwVWdUTE41SnJKNEVQT2VFbTI0?=
 =?utf-8?B?NlcyZEd6cjhFa2daS21BUnNKbTdoanIwUnpZTUljRmJjYXJTQnhhNmZBL1Za?=
 =?utf-8?B?TmdrN0JpRVNjUzZEYVZ6VGVWdUE5eEFvdTdlVitIc3Y3RHg5V1JtSk44UHRN?=
 =?utf-8?B?dndSb1dFYUQ2VWZMbHJaVkNXTlFtWEhzeHZad240V2U0dVFrR3preUtWUXlU?=
 =?utf-8?B?MFI2L2pYaTlUazk4Rklnczlkejl2QkVsTzFyT0ZIdExGcDg2QnhZeWdBUXV1?=
 =?utf-8?B?S2ZvNFRpa1hCdHh2SmhxemwweEcvd1JrR1pKckZORy9KTXNnSUtoRUgxbTdV?=
 =?utf-8?B?aFdUaDRBTDREcmZINGhFTjN6NTdId0p4d1c5VEozekFXU1I2UkhrNEtkN2Jj?=
 =?utf-8?B?NTVOMDhiL2k4cUNiWjRDRXd0azNxc3VvWHdIK2F5UzFhOExyblhkYnYxL3lP?=
 =?utf-8?Q?Jucn/z+mfaBE24LDQ3tPEip4tMWpizqO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M2dKRVBad3pBTGRUQ1JJWmNDNVVLMUlXS2NDaU1Ub3RDK0xpZDNkUzZPYVBL?=
 =?utf-8?B?Ly9obnFjQUtwak80TEx6Y0R1eHB4K0JJbFpPUWRLTE0xdWRzYkdxYld5ZTg5?=
 =?utf-8?B?SkJaNjIxTmF4QzJSdnNJMklRV2tlbmhiRG5LZDRCYndlRHVFd1RROXJIZ3Av?=
 =?utf-8?B?SlNTSnZkSnBCUU84b1h4VUZzRUhyd3Jhekd3OE1mUFRqZXBWc1dXNXJZdTlI?=
 =?utf-8?B?NlpSRUVyZWFZUmFFZVVMb0F3UWRKOEFaU3RaVzJhQmNTUmVLUTBKcXpSMFhM?=
 =?utf-8?B?eEtGSVlKZXc0ZUhVNFZmN1FNbS90Nkh3YVVITmU1dTJ0RmtQUHVHOUR5K2xR?=
 =?utf-8?B?cm8zcnNsTjFWdXRudzJFejRBRGdRaWtGOGswNHAyeW5DWjl0Q21yRm9KNStX?=
 =?utf-8?B?ZEI5RmFvajd4Y2dXQUUrWjNyL3B5azJKTVhjbnVvOW1oMmh1TnpzUDNyVW43?=
 =?utf-8?B?RXhKTFlycmpMQjhFUExkaWVRTEhseVVmcDJJUGRwbUhBSkY2U1FEbUdoeFZ6?=
 =?utf-8?B?d1gxTHBIcE5NV2piZGR5bEhoTzVpSUc4WE9jMjVnbTNxVHFlWnVqMXB6cU90?=
 =?utf-8?B?VlBjYmZ3akltczlqdmtvZ0diS2dtSTlwUU8yU2t3MlIyM0I5MVFUQ0F4VCtX?=
 =?utf-8?B?d0FCV05KaHdNSUhEMHNXNlhDMWI2YTV5dkp3SkE1djJtUDBPd2JYdEgvQytO?=
 =?utf-8?B?RjdtUS8xWHVZWVFTRlNLOTc5RVQ2dDZnNjNMRjU3TnhZYUlhOHJQUFp5ZnVS?=
 =?utf-8?B?cWVZOUM3TDM3NDUzVVNUem5oRFM4L0ZzdXgyUHIzUjgyUlI2a0pDd1RHMTBk?=
 =?utf-8?B?ajVXVnl2a2ZlOUN0cWZGdktYUk1IaTFoNGV2SXhBcmZ4QVBvVi9OdGdCd3NF?=
 =?utf-8?B?V2tLdDgvZ0ErRmhYZEg0cTlkbitxZkMySUhrVGMwbUJucC8xSlU5aHJuOHlP?=
 =?utf-8?B?bXdQenE1YjQ2UkMvb2YwTGxXWjlMTW9RUjhQR3BzUlJuT2RSV0xlVmhWMFNG?=
 =?utf-8?B?US9teEdRMFB0elpWdk1EeHRhWFVvR3VSczNyL21vbm90ZWhueTVSWVg2V1NV?=
 =?utf-8?B?bGZWTEtHcFJqT0VGc0liWDdyWC82Y2pEYkVLT1NUYW9qTm9tTDNqcFdzTi9B?=
 =?utf-8?B?Vit2VVpvTlFlbjQzZURFem9ZbGNoZ0JvLzIvellsWFBDRmVKZzhNZUhGb1Q5?=
 =?utf-8?B?YkpMYk4xSVMwTndzODc3TnpQSWpUcTFpVzJrRjhGdyt5R3g4b2NQYS9ZNEtX?=
 =?utf-8?B?WXBVNXlsRnpKTUE2NDEyVFNvN3duNFh2ZUlHL0RlakorQjVvMDJ4a1Bvdmpi?=
 =?utf-8?B?MkFERnpubGUzaFA0bzhLOSsvZ0huWkcrcUJrVjFjSlV4ZzZxdTREZWdjbUR3?=
 =?utf-8?B?UWYwUWtIRzc2anJXMEJoeVMzM2JPeGNCdzN3bWFOU2hEeFBJaDVHd0k0T1gr?=
 =?utf-8?B?VFdVM3B5VWp3Zk9TM2YyaGx1UEVES3FzRy9MeGtraG9HaWVhTzQrUk1SUm8w?=
 =?utf-8?B?algrUlhwdE40NzBMZEdpSjkvSUt0SmU4bnNxQUw0K1dZSlZRU0o0UEhaSWVo?=
 =?utf-8?B?VDA1WE5DNExNYXoxRGtLTWJnbEVlU3VKbzJKb1RvS3I5cW9qbk5BdlFycXJE?=
 =?utf-8?B?Zzh1M0VRSlpwVm9yeGR3NkNSN3N3L01QSEVGR2ZldG4rZmNyRHlpMS9BNGNh?=
 =?utf-8?B?dnJDTVBWRWdPYWhQWmJzTjJZOEVnYmZLNTBzbGN2TkRORzF3UDRHRXhveEdK?=
 =?utf-8?B?c0ttZlVxMGhZWTJldlpqckE5eWI2cFk3VDZCNWFnWEZyNUFSd1B6QTQ5M1Ft?=
 =?utf-8?B?YWJPVXZFUXdyNnA0OGJORWNEbExTdnNnMkhpcmxSU3Y1aXdKcjdnQVR3OVQz?=
 =?utf-8?B?SHppOHloVlVqVUMyeWxWemd2RjlTemVXTTBXNTFxbDRMTS8vS2p3NTc3QUhP?=
 =?utf-8?B?UkVpQ3RrNkl1SXg4OElOZWFUNVhEbFBBak9adnAxYTJub0Ria2tueGl0T1lh?=
 =?utf-8?B?dERXNU9tdTRhWm9xMTk3eFAxOWNrRWVScUpqRVc0dmpwckpma09GMEh1VnJu?=
 =?utf-8?B?U0MvajEwR2cvajRPQlFDbjdITmxzVTluSzdPdHlwemVHTkxrSjdDNTFrTFFU?=
 =?utf-8?B?WFRyM3JGbS9TWnRkTE9vdFBuN1VBeDNSdHZBdGlYaHdWUERJQWg4MTVCcmVh?=
 =?utf-8?B?WDEzcnQ3ZHJQK01ycFBRdEJyVTg0QncwZE56RmJid2gvbEpzUUlsZkxIVzRY?=
 =?utf-8?B?V3krK1gyUVZsNGNCdzZWUytFTkIzQnhGbVhzSjBjejUvZndSMWRES2N4eE5s?=
 =?utf-8?B?akhCTjIvbG1CUjB3OE1YVzFkOERtaEtkSlBocUF0VWk2cEs5am44UT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e5bb32f6-954b-425a-3a92-08de534ac737
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 08:56:17.2926 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bb5GzUXwfnXVuH/bJtt4zTPka72nyRTxPkmvwtCZ016/unvTwf26+evm0+8oYwGbb7tv1DFWNygp7co/qPWlXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF162366726
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

On 1/12/2026 19:37, Michal Wajdeczko wrote:
> All MERT catastrophic errors but VF's LMTT fault are serious, so
> we shouldn't limit our handling only to print debug messages.
>
> Change CATERR message to error level and then declare the device
> as wedged to match expectation from the design document. For the
> LMTT faults, add a note about adding tracking of this unexpected
> VF activity.
>
> While at it, rename register fields defnitions to match the BSpec.
> Also drop trailing include guard name from the regs.h file.
>
> BSpec: 74625
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>

Thanks for the patch!
Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>

> ---
>   drivers/gpu/drm/xe/regs/xe_mert_regs.h | 10 +++---
>   drivers/gpu/drm/xe/xe_mert.c           | 43 ++++++++++++++++++++------
>   2 files changed, 39 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/regs/xe_mert_regs.h b/drivers/gpu/drm/xe/regs/xe_mert_regs.h
> index c345e11ceea8..99e5a26da657 100644
> --- a/drivers/gpu/drm/xe/regs/xe_mert_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_mert_regs.h
> @@ -11,11 +11,13 @@
>   #define MERT_LMEM_CFG				XE_REG(0x1448b0)
>   
>   #define MERT_TLB_CT_INTR_ERR_ID_PORT		XE_REG(0x145190)
> -#define   MERT_TLB_CT_VFID_MASK			REG_GENMASK(16, 9)
> -#define   MERT_TLB_CT_ERROR_MASK		REG_GENMASK(5, 0)
> -#define     MERT_TLB_CT_LMTT_FAULT		0x05
> +#define   CATERR_VFID				REG_GENMASK(16, 9)
> +#define   CATERR_CODES				REG_GENMASK(5, 0)
> +#define     CATERR_NO_ERROR			0x00
> +#define     CATERR_UNMAPPED_GGTT		0x01
> +#define     CATERR_LMTT_FAULT			0x05
>   
>   #define MERT_TLB_INV_DESC_A			XE_REG(0x14cf7c)
>   #define   MERT_TLB_INV_DESC_A_VALID		REG_BIT(0)
>   
> -#endif /* _XE_MERT_REGS_H_ */
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_mert.c b/drivers/gpu/drm/xe/xe_mert.c
> index fc027d2d7a5e..f637df95418b 100644
> --- a/drivers/gpu/drm/xe/xe_mert.c
> +++ b/drivers/gpu/drm/xe/xe_mert.c
> @@ -9,6 +9,7 @@
>   #include "xe_device.h"
>   #include "xe_mert.h"
>   #include "xe_mmio.h"
> +#include "xe_sriov_printk.h"
>   #include "xe_tile.h"
>   
>   /**
> @@ -55,6 +56,37 @@ int xe_mert_invalidate_lmtt(struct xe_device *xe)
>   	return 0;
>   }
>   
> +static void mert_handle_cat_error(struct xe_device *xe)
> +{
> +	struct xe_tile *tile = xe_device_get_root_tile(xe);
> +	u32 reg_val, vfid, code;
> +
> +	reg_val = xe_mmio_read32(&tile->mmio, MERT_TLB_CT_INTR_ERR_ID_PORT);
> +	if (!reg_val)
> +		return;
> +	xe_mmio_write32(&tile->mmio, MERT_TLB_CT_INTR_ERR_ID_PORT, 0);
> +
> +	vfid = FIELD_GET(CATERR_VFID, reg_val);
> +	code = FIELD_GET(CATERR_CODES, reg_val);
> +
> +	switch (code) {
> +	case CATERR_NO_ERROR:
> +		break;
> +	case CATERR_UNMAPPED_GGTT:
> +		xe_sriov_err(xe, "MERT: CAT_ERR: Access to an unmapped GGTT!\n");
> +		xe_device_declare_wedged(xe);
> +		break;
> +	case CATERR_LMTT_FAULT:
> +		xe_sriov_dbg(xe, "MERT: CAT_ERR: VF%u LMTT fault!\n", vfid);
> +		/* XXX: track/report malicious VF activity */
> +		break;
> +	default:
> +		xe_sriov_err(xe, "MERT: Unexpected CAT_ERR code=%#x!\n", code);
> +		xe_device_declare_wedged(xe);
> +		break;
> +	}
> +}
> +
>   /**
>    * xe_mert_irq_handler - Handler for MERT interrupts
>    * @xe: the &xe_device
> @@ -68,20 +100,11 @@ void xe_mert_irq_handler(struct xe_device *xe, u32 master_ctl)
>   	struct xe_mert *mert = &tile->mert;
>   	unsigned long flags;
>   	u32 reg_val;
> -	u8 err;
>   
>   	if (!(master_ctl & SOC_H2DMEMINT_IRQ))
>   		return;
>   
> -	reg_val = xe_mmio_read32(&tile->mmio, MERT_TLB_CT_INTR_ERR_ID_PORT);
> -	xe_mmio_write32(&tile->mmio, MERT_TLB_CT_INTR_ERR_ID_PORT, 0);
> -
> -	err = FIELD_GET(MERT_TLB_CT_ERROR_MASK, reg_val);
> -	if (err == MERT_TLB_CT_LMTT_FAULT)
> -		drm_dbg(&xe->drm, "MERT catastrophic error: LMTT fault (VF%u)\n",
> -			FIELD_GET(MERT_TLB_CT_VFID_MASK, reg_val));
> -	else if (err)
> -		drm_dbg(&xe->drm, "MERT catastrophic error: Unexpected fault (0x%x)\n", err);
> +	mert_handle_cat_error(xe);
>   
>   	spin_lock_irqsave(&mert->lock, flags);
>   	if (mert->tlb_inv_triggered) {
