Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64D40C71136
	for <intel-xe@archiver.kernel.org>; Thu, 12 Jun 2025 18:26:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B88510E066;
	Thu, 12 Jun 2025 18:26:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UyAV38W1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A255C10E066
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Jun 2025 18:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749752815; x=1781288815;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GWLgSJn15QSDZhysbuVqaGu3Iq7ULhxISsj5x3m2Wf8=;
 b=UyAV38W1Z39KAw4eA9Nfm8mciE6/jpUP3dRquQIxXiJ0JVLXh6KNgCeA
 CUV2lgAEWhQB/lIan3BFzMiXAeOSBxMfJjGkb4iRa5v4kpONhMVQMmrcZ
 hi2G6bHQSQ823Yth2D1/IxNyLiJgMrG/kz4U1BilhhehvBTdPD+oHVLWM
 T8Kdx3SlMpKhErkhvNjbEmnNzGNp39C+W/9U5EAmaPps6lGYzH7O4JuUC
 1NAHa/jJB3RlgFqhhP6SNsCrnFCFdCQedtAliuaTt8kU4vOqJI3YanS/4
 vG8LDHzU15xSw7Dkj7AOCoblBnrCafytrNAw0bmM03GjQV/wuAfkWKMPj g==;
X-CSE-ConnectionGUID: YlgVs1JtRd+axSB06RJkRA==
X-CSE-MsgGUID: jfYJBhfBQ2qSzyZ45SF4xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="62990321"
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; d="scan'208";a="62990321"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 11:26:49 -0700
X-CSE-ConnectionGUID: 0YRZleb1Q1WsK1LtTjUcag==
X-CSE-MsgGUID: iryouvRiR/W69/DY0Qmhxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; d="scan'208";a="178500511"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 11:26:49 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 11:26:47 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 12 Jun 2025 11:26:47 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.50)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 11:26:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GF/hDz0RmFA8sdXajNpYfa77NtToPYKTCptP4XjTY4CHOUHEKcQIfDM+IjxXRTj5xh0NPX8eBQYf/HQr/BE7m0G32Nse5K5XgZr0CcN9BLWqFWAnevutlfoprWGtCO2xOqQex9RTABcvYLSB09qWfk8pAkQ9EhDaoL9sIrsN3ILIBGU0fGn41g+Sg1e7/PMZghZUVh6qpmnkv+4yQI0LprrxtQzPF3T1oBZhQrRcXAHMgS9scf/JVhhTEC3JBfMbKSYt/PlfWLKmWFQm+K2x3JYASM+1xltQQGpEpVPbhSNt9NC4+MaVef9C/ZKcqfbbk7q+SVn4fbXPeDCOMp57zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aAfHS8Axh5J/zMXVfAb/GeBrGPgEsXnhbyI97kvSnI0=;
 b=X8x29AAuX6vJGm6Sq1akfQkRJLewwTSj9ha+xp6auCVCz9J612U031xdiS+3VYJrRv4/7/BsDGHztI2NQ4srB78GR7hipNEqgtlRi0gaNIMTtlk9ZzLsInHkq7TXSWbJGAAzXiA9m5xMRVEYk9CdLsGN6Wn7j6LNY+umQzqh2fBjNWpO4NBPgtf1/LlBSli7M3J68CFsD6G/F1mBaohhTvR3cW0Jmb1+bBsxLL1O03DdMfYhdEdq5gTONCmB8wbzQqTSgx4uQvfxRWeVDo3K3H2hxD5orzgPNGe2JU+9VWIlM9kUzM8zp99TQ5FRrIN2eO9AKji099QQDKpoLjgbdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by DM4PR11MB7277.namprd11.prod.outlook.com (2603:10b6:8:10b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.26; Thu, 12 Jun
 2025 18:26:12 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.8835.018; Thu, 12 Jun 2025
 18:26:11 +0000
Message-ID: <1caeda49-7355-4e68-8546-f127d222f52c@intel.com>
Date: Thu, 12 Jun 2025 11:26:08 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe/guc: Default log level to non-verbose
To: Matthew Brost <matthew.brost@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Mrozek <michal.mrozek@intel.com>
References: <20250612-guc-log-level-v1-0-51f124a3be6d@intel.com>
 <20250612-guc-log-level-v1-1-51f124a3be6d@intel.com>
 <aEsatLTQ5+93aO1T@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <aEsatLTQ5+93aO1T@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0172.namprd04.prod.outlook.com
 (2603:10b6:303:85::27) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|DM4PR11MB7277:EE_
X-MS-Office365-Filtering-Correlation-Id: b5d6fa76-dc5b-41d6-ba73-08dda9de9baa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dE11TFViOXlQL2YvSWNRSWhlK1grTmtCRC9QOVBMVjhkU215TVpuKzM2MDJ1?=
 =?utf-8?B?MDJuU2RiWDA0cVNERVhXRzM0aDBsY0xlZVppTWVyblVud29ZUzljUVh1cWhT?=
 =?utf-8?B?Q3FxcnpRQlFtQkFXZ0MyeHZpODVJWUJNWVpVR0dBRHg2cDR4ajFCNlNZaGxD?=
 =?utf-8?B?cVo4eDlHVFU2Znd4TFk1OTVPTUFzUExZS1Q1QkQ2VGIyTmlkK2wxZmp4Ym1D?=
 =?utf-8?B?RnJCQjJDd3lma1VKZmpRdk9mUkxrcTE1VEN0UmhGZnNvNkZtT05rMlhhV1Zh?=
 =?utf-8?B?ODUyRXBId3hMN3dxS3Y3eG15c3ZHOElQZHNkblpNNkVnQTlPT0VGTzJmejEw?=
 =?utf-8?B?bk5uUGg3S21IalY3U2srZVpseUY4WmV1b2YvVk1TOGZma013Z0hoaGswRk9z?=
 =?utf-8?B?RkJzcjBjVkthY2VDczMwbElReGgrL1oraG5pNkY3Q1hFbTdNTVdkazY2bkJD?=
 =?utf-8?B?eDM0OVpFcUprcTJIaVdjL0ZnNklpMXBybURsVDVEREdUYzd0VTRnUVhGMldk?=
 =?utf-8?B?S0NWNVBCN2pJdVAyQkt4di82cE54UVZJcDRTamJ2aEcwa0pNRGpJemFiYWUz?=
 =?utf-8?B?a1hzUmRza20vSnVGbXoxeCtkOGxlWlFmQzRQQjhEYjRpNDZVZHVqSGF2UHJL?=
 =?utf-8?B?eGZnV0lTdVNGcW96QnV1NXl2b1hob0lpVDJxN29mdFpVQ3dFcE0rMWcyeFVx?=
 =?utf-8?B?bzZTWVBrK0dZL2dQT21xZlB3RkpnZUZueUx0bTJFUENKTjlQZ0MzVEZuZFRV?=
 =?utf-8?B?OTRjTGdIVnVGdU9wK3ZhNXZDSEJMdTNLWmdDUDhkYVR5WVBuSHJ0NFowOG55?=
 =?utf-8?B?TUdtb01GcDNRVnRJQ1BCelNDeDlqM2hJR0ZNL2VTbmVYdW40TnVoZXpxay80?=
 =?utf-8?B?NGh6UFJNbXFpbGFGRU8wcDNNSzZxWEwxUWxjc1B3VGpsVG9jQTR4ek43UGJt?=
 =?utf-8?B?enNRSWVuQlE2emZ5THZWTXVuelVtd09aVForZFNpRGdhU00xT0FRa096NkdG?=
 =?utf-8?B?SGQwZ3ZKbW5pem5WTmZpS1pYSUVDOHp3N2QrNHZ2MmhMeGtPYS96SVZZR2dL?=
 =?utf-8?B?MzhBaEZaVzRNTjhqTnFlVDdWbkVJbUloV1pObHEzdHEvdE82ZGtHUFdDdDhq?=
 =?utf-8?B?d2Q1dFFKM0N6L1NoU2xhZWRTUEtsMDhYeStiMGMvL2lBWFF5MFBZSGJ6NTBF?=
 =?utf-8?B?aVJ0YThESlNwN2hpY0RCZ2Fra3hTVTVFcHl0UFJ1WVZSa1JkM2ZORFkwVld3?=
 =?utf-8?B?alBmYkRGZ0s1a0oxTkk4K3NtOHN6NVFWM1RlMy84RDVwcDNmek56NTJNN21H?=
 =?utf-8?B?ZlJmTmdYbE1UKzU1MCtVV1VIMVlJc0tzQnN3dlU1eEd2dytFR2RxMStWZ2lz?=
 =?utf-8?B?aW9IQ0RmcnZHUDNuRGZHbmgxVEpoM1lkOVZ4bnNBZEpyZ2p5cmlMYjJtYUdl?=
 =?utf-8?B?N2l1dTE2VjBNNnZ6T0l1cUp4QVlXeFVoUGdQZnFhNkVwV05ZZmIwYUc5Tzlk?=
 =?utf-8?B?SjFVWE1oTG1GUlNMNDNTZXQ5N2Zvb2lKT3I5M3NCaXdidHpJTW9wTTZFS2xm?=
 =?utf-8?B?QmxCSFN3dVVJY2E0amZIRHRUSW40QjV3OExZMHoyMXlhZ3pJb3JkT2ZVaGRT?=
 =?utf-8?B?MmVaQVhjbFFZSnFqK0xtTElBSVc5N2ZWMThnaWpVcUlhYWdEWmw1SHQ3QmVB?=
 =?utf-8?B?d2R6MUdSOHV3c2lkNEwrMFdYY0s4YzVKTzlXTW5HcEZiN0RTNHhNejJ5djFO?=
 =?utf-8?B?N0RCUXpMQnd3UGNvOS9HZVF1WDgrR3NQdTdlaTBmaTBPWFhDYktGcGNCNmhi?=
 =?utf-8?B?TUUwdGRBNkU5bkVrMUtiZ1RpSmMrenBYbnd5OUlHa1BsS3hnSFc2VjlJdTgx?=
 =?utf-8?B?cEVlYllqcU1tRjAreVdHeXBIKzhjOEhxUEFXNm5mRmt4VUY5Y2UwK2RQSlN3?=
 =?utf-8?Q?xrZVPP6uUBQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MTVqMnN0VE5IajhSRTFJczdFMm9pM3dBZjIxYmJaU1ZtUXgyeVFQSUdyNjhN?=
 =?utf-8?B?VEdPdUllc0NmaHFjYlBxYmh5dTVQWmdlczlhYXFMd2NRWDhDaU1TOEhzL1hp?=
 =?utf-8?B?ZlFGbmRSay9xQmdhMGZNemo4YmM4VXVKYWw0Ni9pSEtJcEQ4V3c3MTJLd1VH?=
 =?utf-8?B?dGtqN0RLeFhlNlpKSDRLNHUzTzBJSVN0OTZSNCt3QkQwZEtxT2NTdndkSXBq?=
 =?utf-8?B?TUU1Q2hoMXhVVUJEQk4wYTNNTjJ2U0p0dTVkc2txcnRnOTFxZld3T1VJUzY0?=
 =?utf-8?B?bURISnJMMThFYnBCeXAyc2cwdFZ1dWwwQjNWVEtGOU5GNDQ2czB1QU8venVC?=
 =?utf-8?B?WlRydktxclZtejlBeENpY1lOMjBpQnA1eWZFUHAxR0Vtd1MvOUhTSjBRcElR?=
 =?utf-8?B?UERxdW4vNmVOSm1lYTBDSzNRYXdtY25NWDVoQ0lIdXFDaFdtTnJDRytXa2FK?=
 =?utf-8?B?akFNaHpYd1hWTDBHYThiZW85UkxpN3hqOGpxdlJuVWYveW1zM0JGRVBkamx5?=
 =?utf-8?B?L2R6dHZkSE9raUdYOGJSZ3NKbGg5Ty9McW5QNnhWd3RqczFaTmJqZmFEcUpL?=
 =?utf-8?B?YU95cWhCUWhXeERnMDRZQWltSGdDWkpQSE9GZlZDVHRPc0ZnR3JHVk1abzNh?=
 =?utf-8?B?bkVGazJ3NkNvNXBSaUsxSFJJeWRrbTlKZFZQdFYvUllUNEc4aFhRdGVlaWJr?=
 =?utf-8?B?dTBROEF2Q3drYzV1UGpYN3BuM3Jsa0VxRFZObmhkY1o1U0xVb2lTbk1icFJt?=
 =?utf-8?B?Rm55TnRtL3RJT2hPRkdsa2JWWWtwTGtkWlpKVnNHaVJ4TjNPWU83MkhHN3JB?=
 =?utf-8?B?OVJlRlB6QUdGaW9HMzVoVVZ0cXR6aVcyTEt6MHg1V0RLSzEzaWZmdStZbFZj?=
 =?utf-8?B?VEJFZUhjU2RybnBuOE5haEY2d21ZOEtic0dqN0YzRDN5MkhHS1JIUXJZbXZH?=
 =?utf-8?B?cVZvMHNzS054dm5MWGZ3cXB0QlhsOGpwUFl2TDZocVZEWWFNazA0UGN4Ym83?=
 =?utf-8?B?UzBpSVd5RC9RVld4QVEzclhvMnpRUXNVaFh5UUVEaTBKNlRRYnZaUDFBZllK?=
 =?utf-8?B?bzZ1MXREU09hMjlUbEo4TkdWZ2NhSGQ4bE1FYXBtWXhuMk93dmtMSW9zM0hm?=
 =?utf-8?B?dThOczhwbWw0YVBjOVNQN3hUTThzZldNWE9OamVETlBSdTdWNnJZYURKWW5X?=
 =?utf-8?B?ZE9vb2lnbG1ZS2p4SHV5eXE5OG1pekYvZ0tJaVE3NldHUy80RkJQeUd4azZG?=
 =?utf-8?B?SVVRK0o0RFkwYnYwWTM4aThlcXpXTkd3cEd0N1BtNm5DYzdodU9NNGlJNGFj?=
 =?utf-8?B?eUYzaTVpd3dIa3h5ejNkWVlnRUJnTkNqQXpacGhubmd4TldPQWhTVGM1T09W?=
 =?utf-8?B?c0JsSVBha1JiUHJ4aFRzT1ZaMDY1SE1GTUx5N2UyU3R3bEVwQUVjUHcrSHNo?=
 =?utf-8?B?OFEzdU81N01Wdkh0eEg3bEkwMmVKTVQ0bktuUVJYYzRxNXFiOTluNllOL21M?=
 =?utf-8?B?eDBhL205WkMxRVRxd3FWUkxrRnJMZ1Btd0NHSXI3WS90WVdWT3FXOHlFTjVa?=
 =?utf-8?B?ellSYm5LVFNqYWhFZ240KzBQZG5jdXczejZXS1FEdGhTQlQ1ckkwemZvNXlI?=
 =?utf-8?B?UTFLOVlSVWVxUWtEWTk2L29CaGkrSjdaSGxNY0RmcWx0aHZYeGNVMzZ5eGRv?=
 =?utf-8?B?QnFTTncvck5kM1JCbGRraFcvM2t4elFNejMxTWt2M05GTkJ6NkpQV25Jd1NK?=
 =?utf-8?B?UXA2RHhXakc0NDJhVzlXT1JqanJFVlljZi9XeDVxeTFlTVZLZm5pa1ZNaGN3?=
 =?utf-8?B?UmY5M3NXU2hEL1plVkJMczZ0VGxwQTY0ejdVd3J6dnZJRitROHdtb1dKV0c4?=
 =?utf-8?B?Q0JQaFRxK0c1akR1ZVJvdUh4ZlVPS1JHZzZyYXlsakEvclVNcCtMRzlMSTlC?=
 =?utf-8?B?UjhFcTg0OU1ZRkFlZHVUczlPVTlkM1BSMzMwMGdWdjNHeDhhOVAvclA0cG00?=
 =?utf-8?B?ZE5oZXcrYmZad2UvY0dvOGZFZnpxRVRSTkVqeUxSREp2SjdYaTF6dDF1RG4z?=
 =?utf-8?B?WnlyUmQ5NXR3MzVjWlNnZ3hTejk4TGtjZzFieXVIdlBVWjlIV1AyaFlkcGJp?=
 =?utf-8?B?a1RzdFAxNjYzT0dsd0h4bkNqblFrYXRWVzNGV1plamlhdjlJTTVYSWkyTDBJ?=
 =?utf-8?B?TWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b5d6fa76-dc5b-41d6-ba73-08dda9de9baa
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 18:26:11.8361 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yiqznIhQK63xkdksfBJ2FIrpCawMoCNllQDEHoPoDdDgpQyJ400SzE9wqFI4O37tsxLkbIE/7nPxV1gbLASJlmCsgP15jLzDcq6vYkr3tco=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7277
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

On 6/12/2025 11:21 AM, Matthew Brost wrote:
> On Thu, Jun 12, 2025 at 11:05:32AM -0700, Lucas De Marchi wrote:
>> Currently xe sets the guc log level to a verbose level since it's useful
>> to debug hangs and general development. However the verbose level may
>> already be too much and affect performance.
>>
>> Michal Mrozek did some tests with the L0 compute stack for submission
>> latency with ULLS disabled. Below are the normalized numbers with log
>> level 3 (the current default) as baseline for each test:
>>
>>                            Test \ Log Level                        3      0      1      2
>>   ----------------------------------------------------------- ------ ------ ------ ------
>>    BestWalkerNthCommandListSubmission(CmdListCount=2)           1.00   0.63   0.63   0.96
>>    BestWalkerNthSubmission(KernelCount=2)                       1.00   0.62   0.63   0.96
>>    BestWalkerNthSubmissionImmediate(KernelCount=2)              1.00   0.58   0.58   0.85
>>    BestWalkerSubmission                                         1.00   0.62   0.62   0.96
>>    BestWalkerSubmissionImmediate                                1.00   0.63   0.62   0.96
>>    BestWalkerSubmissionImmediateMultiCmdlists(cmdlistCount=2)   1.00   0.58   0.58   0.86
>>    BestWalkerSubmissionImmediateMultiCmdlists(cmdlistCount=4)   1.00   0.70   0.70   0.83
>>    BestWalkerSubmissionImmediateMultiCmdlists(cmdlistCount=8)   1.00   0.53   0.52   0.78
>>
>> Log level 2 is the first "verbose level" for GuC, where the biggest
>> difference happens. Keep log level 3 for CONFIG_DRM_XE_DEBUG, but switch
>> to 1, i.e.  GUC_LOG_LEVEL_NON_VERBOSE, for "normal" builds.
>>
> For series in general, I think this is a good idea - no need to slow
> down performance for customers.
>
> Downside is devcoredump from customers are going to have less
> information. I'm wondering if the GuC log level is low, if we should
> print something in devcoredump indicating this, and instructions on how
We already include the log level in the GuC info section of the core 
dump (and the debugfs dump), I thought?

And note that the minimum log level is meant to include the really 
important logs. It certainly isn't as complete as higher levels but it 
is hopefully enough to give us a first thought of what is going on. And 
if we need more then it is easy to add a comment to the bug report 
saying 'please re-run with this extra setting'.

John.

> to turn up the GuC log level for filing verbose bug reports? e.g., A
> similar message to what we print in xe_device_declare_wedged?
>
> Matt
>
>> Cc: Michal Mrozek <michal.mrozek@intel.com>
>> Cc: John Harrison <John.C.Harrison@Intel.com>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_module.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
>> index 1c4dfafbcd0bc..4809afa7ce3f9 100644
>> --- a/drivers/gpu/drm/xe/xe_module.c
>> +++ b/drivers/gpu/drm/xe/xe_module.c
>> @@ -20,7 +20,7 @@
>>   
>>   struct xe_modparam xe_modparam = {
>>   	.probe_display = true,
>> -	.guc_log_level = 3,
>> +	.guc_log_level = IS_ENABLED(CONFIG_DRM_XE_DEBUG) ? 3 : 1,
>>   	.force_probe = CONFIG_DRM_XE_FORCE_PROBE,
>>   #ifdef CONFIG_PCI_IOV
>>   	.max_vfs = IS_ENABLED(CONFIG_DRM_XE_DEBUG) ? ~0 : 0,
>>
>> -- 
>> 2.49.0
>>

