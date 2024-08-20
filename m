Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BDFCC3DA4A
	for <intel-xe@archiver.kernel.org>; Tue, 20 Aug 2024 17:07:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A3D310E16F;
	Tue, 20 Aug 2024 17:07:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CH0LpgI7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DDAA10E16F
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Aug 2024 17:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724173623; x=1755709623;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=lVDwPW1/SGWHWDider+3BIoj/N4AXnMmY6WoJRCI3ws=;
 b=CH0LpgI70L9iRYLpxk3plPBpHm2KJd+Qo7XTAvKjc96Yucgq3FDBtqsI
 C0dX5QuCrMVDpHQCCT6N5coJkVk31xRhWXUFhhmG4mt3dN8L/2KIQUTbX
 DORov5oWgwciGVMaz4km5usfUMSnW9GxYIvsWRfpxsL1gJB4sl1XC99DI
 u+mufHz7KcuvSwZGqv75YxDiFX3S225qW545+ms88Z7kYqcX2SbOp3zGC
 /DEmAlGy6K+09Rc5UWsiy5WJ5xU9stV86dbHA+5Tc78TmhiTEUKuY6iD5
 evX3Sm2GtSgR1t3a8jDF7ThDJV+uozZWxfuySKdzLe+l2Zai1MgNvfK4Z Q==;
X-CSE-ConnectionGUID: mB8Rngd1TB6pPkCoOyXIFw==
X-CSE-MsgGUID: wimzR4uDTR2CNMgNOaCIMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="33155549"
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="33155549"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 10:07:03 -0700
X-CSE-ConnectionGUID: yz40PCUNQ56d/7zKTOqBBg==
X-CSE-MsgGUID: HFvNIHvhTuqfu+CQJVwsAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="83992903"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Aug 2024 10:07:03 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 20 Aug 2024 10:07:02 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 20 Aug 2024 10:07:02 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.43) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 20 Aug 2024 10:07:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wkRw5A4cDr454rY7SjrTmAbSwXT8PdZQjmAyj+RhU60r0xG8nvPuNKf3CwZmqdyqpE5DOMrjt7eKpdFQdr1PdxFJT1HCkq/aZ71qAndGrP6+oJHTOb198dVHt610Q8OwnVCH1ZFCIWNGynJ8QkI7Mxav/X56Z/kQI4G8I5QH4WEw+wptYm6uqhjDU1L1UMvLXcp2SixgWkd47YOddSXvuLDjl3jcLALxZn+mxAd5xhX7w2jCMmUCfov8I6L8KCJYm4hTqur8Uc6XNxLrxh3Cq8KPvvQSJqK/sI1nt7AeHlDRU+GCKLRU1j5AHHbnYWkwH0BfbtNLRZkD8y0AmuMh/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bvd5hE91OT1AquxmPH8UIEq0uwKj7uYGx4YmgN0Ky0s=;
 b=XCygZScCB6bs6IxO2wjoVuFbEaoPSPeBLYolcxaVajAI3OWBvAQmrie65RGnRRkUWn4Wj3VMy5Yi2iVlryc5laDIQT1eQFhBXJWG4vJOS42lvxYVIime7Ltpsp15ov35f8YDqi4ZBcB8qzY8KkXr0mYwoIqKmiXAYqjfb7/LXi3PUgnordzWLE89hgi6aME4fCMl4zMVOh0/HFEKXRWUawmNp+eSE4TA2JrBEhicg854aPU46Wgc5AEKuQt1dWgfu2vzCoWTK5IqwQRABV3wG7NfGjMWWmL5lFX6Jq6GQTH7eYz/luJdOQrZG/1jx5DZUaPam0GMgvGI7HrUB1NPhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7717.namprd11.prod.outlook.com (2603:10b6:510:2b8::8)
 by SA1PR11MB6663.namprd11.prod.outlook.com (2603:10b6:806:257::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Tue, 20 Aug
 2024 17:07:00 +0000
Received: from PH7PR11MB7717.namprd11.prod.outlook.com
 ([fe80::a546:1ad2:2379:b848]) by PH7PR11MB7717.namprd11.prod.outlook.com
 ([fe80::a546:1ad2:2379:b848%6]) with mapi id 15.20.7897.014; Tue, 20 Aug 2024
 17:07:00 +0000
Message-ID: <c1762c6f-e355-4fe1-abb0-59dc617288b7@intel.com>
Date: Tue, 20 Aug 2024 10:06:58 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/xe: Remove unrequired NULL check in
 xe_sched_job_free_fences
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20240820090230.3258128-1-himal.prasad.ghimiray@intel.com>
 <20240820090230.3258128-3-himal.prasad.ghimiray@intel.com>
Content-Language: en-US
From: "Randhawa, Jagmeet" <jagmeet.randhawa@intel.com>
In-Reply-To: <20240820090230.3258128-3-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR02CA0045.namprd02.prod.outlook.com
 (2603:10b6:a03:54::22) To PH7PR11MB7717.namprd11.prod.outlook.com
 (2603:10b6:510:2b8::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7717:EE_|SA1PR11MB6663:EE_
X-MS-Office365-Filtering-Correlation-Id: 48e06c89-8ead-4ec4-05d8-08dcc13a819f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M1JrOHlEQUhudVV6b2wrTTY3bHlXdW1ubmhEM2xrb0FscVBqR2NMT0pxOFBx?=
 =?utf-8?B?aFdjNTFKTlZrTjZYRjQ4bGJpWWlaeEdYOHoxMmh6UWFOOUdGMm90QjVuSUE4?=
 =?utf-8?B?azIreUM1bHFpbE1wbThTSUFCcTJhZE95YU8xbUQzMFZlT2ZOMjFxVnE5MDBV?=
 =?utf-8?B?WnBySjliQllhWmE5d3dpRkMyQWVXeFgxcGMvdmVnNDRKaWZueWNrRSs3c09N?=
 =?utf-8?B?Mm9wMmJaRjdsSmpYemk5N2t6akhKMTR0K1JBN3lVeUxDYVRLSGFLZFJJVVVS?=
 =?utf-8?B?U1lta3lBNHZoM1NqTHRUajd3SHp1bU5yVkllbE0ySW90WUFzek9POUYxVUF6?=
 =?utf-8?B?SjRDRnkrbEpsMkZZcVhIaVJyNzV3ayswYTkycXBUUmJsYUFTbG1UK2I3NkdK?=
 =?utf-8?B?cVpXbW8vRHpiancybVZZQlZyUDQ0VmFTSm5WRTJEa1o5NTk3aGNsaEIrcmUz?=
 =?utf-8?B?ekR3TDNmaGtuTFhlT2ZuODN3b0h5S2hjMElFeDZpRDA1Ti9qY0k1QXBwQ1B6?=
 =?utf-8?B?NjZZOFJmdGFZcWRTMWxhRjIvZWVwU0ZXaHo4UTFzSVZ0TG5tM0lvOGpHV254?=
 =?utf-8?B?bzVNQUJDUzJvRllOWjJiaGlrRm5QVnVuVjFzaDJaOWJTVVVDbTlIajI0QXpn?=
 =?utf-8?B?V2xscUR2WGVuYVh0a3lFTkRyQnNOVUdlY2Z6OHlGbVQ2b09PVFdJUjlPS2Q1?=
 =?utf-8?B?Z2VvTVAvK0xPcHNvdmN1ZUxGREdmMHY0eWxIc2xmbjZjN0NsTEdaZVl0bE9O?=
 =?utf-8?B?MlYrL1liLytudlgzdU9WZzIvekNMN21EWnZBU28vSVlVMk5KT2lvandrM1Jw?=
 =?utf-8?B?bVZlbTk1cTUvK0VnVG8zZ0I4R1NWbjZyT2NrMnZzOUJnOXJ6YmRiUVRSYmRS?=
 =?utf-8?B?QUJzcUozYi9lV3BwVmpyL3E0YnBBWVVITkJ6dERSMjA5dHhTZmtqbG8ra09Y?=
 =?utf-8?B?UjBWRWU2a0lrdWlNY3hBTUhIVzBvcS80T3NvUDRMQWtJb3grM2ppbGtXY3N0?=
 =?utf-8?B?VnBJeDBTcVA0UGYvT09WNHRhc1RqVTNtYzFTcEJEWHM3VTZiME9tMDM0T0tx?=
 =?utf-8?B?aWZqbUJnb01uTGlYTkV5VzBrSmV3a1IwOGMxU2J6TGZzY3ZFOExnd2k0cE5l?=
 =?utf-8?B?dzI3a05VbmJ4czJwamIxUERORzB5em14T2t5NWdPK3NUYnRmYUV6WDBOZUVs?=
 =?utf-8?B?QTlzOFBReFRJTmRkUHRXeHdVRWJBaHZPUXZDZlpLTWVaaDdCV0dMT01CNVJ4?=
 =?utf-8?B?bnVMMFZPR1MySUQ3KzcvaWJSZVE3NlluUHMvM2VQOTFwWFRQRUo3ckU5M0w4?=
 =?utf-8?B?eG9HeE50R1poZVpwUHhUaFF5L2plRVNPR2h1WHRPN3JFSDlrOXlvZUlDbG1T?=
 =?utf-8?B?WGdiWVNQWG1kSGZWWW9raG5IbHNpZWtqbG40eDFUNjZkU2I5eTJORk5NK2lR?=
 =?utf-8?B?SVd3ZlhZZEFEdWNLeE9zQTBuRjJjSjFxZ1RUNjloWk9COGtKWHpxbG9Lbjl2?=
 =?utf-8?B?eG9zMjBydnBjSERJRXZsR1hIWkVaaFVxUm12cENCMURZL1BGclRvdTZMc3VG?=
 =?utf-8?B?SUVHWW5GZnlsWnNDRzFUdW1jMGw1Y2JvT3BtMjZmcytRZm81d2NTT2VzNldm?=
 =?utf-8?B?TTlPb1ZlQlVzbzdnN0hLZDluZEU3QnV2WlZWa3VueWh0RUNXMWh4eWVrZ1NF?=
 =?utf-8?B?MUphSWl3QkdJaHd1RllQY29UVWFUYk1WVG1OeTJwR3JPUmpHLzBHdkd0VEdS?=
 =?utf-8?B?NzdlK0NacTlHc2RHYjlBRk13Vzc2NW9ZSDFLdVZKcmZOem5VZ3hyK0dOZk9n?=
 =?utf-8?B?VGVLcU9RNFNTWWpBMFd6dz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7717.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cmg5TUZhWTNuWGtsSllmUlhNMWMxbHFnK1dMeVppVnFxMzRrVmVrS3RvS3lz?=
 =?utf-8?B?UitPalExbVFNT2hoc3BPSjZ1QUhzOTM2eVVuV3ZNRUphRFhsc0FnUCtaR0FT?=
 =?utf-8?B?NUVLUHk5VWE1Q1pSYWlXWGlIcUZKRFNMWDR0TFdYSEJkVjBIUXlNdEttZTlW?=
 =?utf-8?B?aFpPMkVIUmRlQUd0U1cxOWtwK2hCeEJ0WjkySk12bjgvK0ZEV0JQbUp6L2lT?=
 =?utf-8?B?WEtFTDJuaEdrdXJMbzUrUWhoaFZFbjR3MUc3dzJOQjl4Rk1lanZNRVlwWHht?=
 =?utf-8?B?K0ExbHJSY2JJRGFNWlNySHdLYmljelJ6OFJ3by8xVGd4ck83SCtpTFM2VGI5?=
 =?utf-8?B?eElCQVNVckFvZHFDaWZVS2NFaHZJazBsWEFVZ09RME5vKy9KTitjYjFnQ1Av?=
 =?utf-8?B?WlhmdDlObjJCeGJGRDhiWFZNNXN0MXdJaGlVdWxzaVBQcHNXaXZpbDhpSDVI?=
 =?utf-8?B?bnEzMjllRURhWVZRdjExM2djUmgyVy9pMXR5bUo0N0dKc1BZSHd5M29rMHdT?=
 =?utf-8?B?bXRaTnBJKzErRWtSQzV6ZE1iTGE4ZElEZ05iZXAyMnFTVFIybGttNkp6SWdn?=
 =?utf-8?B?ZjhhOHlDckd3Ulo1eUZYSndlbXgvVWVnaTlGK0dJaDRmWVlVakZJR0MrZXU5?=
 =?utf-8?B?TjhVd2daeGxJWi9qMzRlSkhaT2liQW5tRnI2RzZPendPdjZnTHE1a0IrYnpa?=
 =?utf-8?B?TUNkREIweXRLeDZIb3JDZlJEcVlzaVFXV1pscHFpb1lhdHZITW51UmhzTkE3?=
 =?utf-8?B?dlc5eERXMlhwNmZtZ2J4Y1RLNHN0REtkbHFsVnBIRzRXSkJtRW55dWJ3NlB5?=
 =?utf-8?B?TTAwNm5YV0g1MnZrRG9GMFVwL01aSTVMMGZwTE8wM2tyR3FTSkIwMzJhRUZD?=
 =?utf-8?B?bGFrNzVKb200TzdHb0VGREJxWFNKMTdJRm1nOFk2cUdSa2dTWG1sa3YxVmFK?=
 =?utf-8?B?ZS9jRjJ3ZEcwa3dNU1I3NHY4K0lJNHlRYzVKa0Y2R3Bma2hWN2ZYK3pobUsr?=
 =?utf-8?B?UmVVKzRPdno3TGJ6eXNvZEJRWGFFb2Y1c2hpOWgxQ1M2YXEzTTl5QmZJS0th?=
 =?utf-8?B?V1Vycmo2Q0U0UURrOWFlakZtLzVCTDFucUJZM09lUit2aFRXa2xzN1VVdWRS?=
 =?utf-8?B?bFRERXJRaDZMeVR6M2IvbC9kWGVqakQ3UFUrRlRnek1IS1R5bi9ZQVVZc1Mr?=
 =?utf-8?B?V1ZLY1puOFF2UDJsQUowT3V2enI4WHYrN3B1dHlaUFZNUWFjYmgwOUJwWFNR?=
 =?utf-8?B?QkV2S2RRVW8wMi83cVFjUWNHTFpjTVg0d2c3TXo5cVZRRmRjNDZoTzJLZUQw?=
 =?utf-8?B?Q0ZhK2lDbEoxSlNoY0hRejUvdjdrZThpNWg1a2JETU5zTGhLYVVZSlU1OEJV?=
 =?utf-8?B?R1l2eWFQcGljcFZ6M01jQjhkZ2p6Zkg5cmZBM3NMN1FzQWhaWlVlYS9pTHVn?=
 =?utf-8?B?UkFlODhIdFF6V3ZXRktodUhiZjdvMHFjYmtlOXBsUC9NVlBTc28zTHprYVlw?=
 =?utf-8?B?WHRXdGpZdHc1Z1RXbW5YNnFrZUlKdFM4SGFjR2pFNW5PTXBQSWZ2a0lGMmlC?=
 =?utf-8?B?NURPUGJ2eFdtV3Y4bzEzMUo2cmV4YWNDajhCOGQ0b1FHWVVXbit4bERuWWhj?=
 =?utf-8?B?UVcyZlNwYzR0ZzA2Tzk3WXdyOEwwdFMydTJUWENpQ3lqeWtiWWhxRVM3S0Z0?=
 =?utf-8?B?T0piWTBzS1dzUmpBY1Nlc1VQWGs0OWtZczBldXRyMWpYV3pOQXBBb3hkRzB6?=
 =?utf-8?B?VFdhU3IrM0pkNG5lM0NPYUMvWmtMWHdNbzRJU3VyZXcwWGNwenlya2hKMCtC?=
 =?utf-8?B?RGllM3c5eHhxWlp5Qk1RNit5K21jTndwMVR2QmwrRnZCbE9qSk1PWVlJaVRP?=
 =?utf-8?B?VGV6eHA3Sk9KZWVQQW5uVWRXMW85WUpwa1JRc0hTZlVwcDJSR3lJdDV5Z3Yz?=
 =?utf-8?B?Q0FDOWhEUzFSSlFnNE5VSmNieXY0R1BHeTZJQXB0NjFBTDR3WFF1TjhIK09k?=
 =?utf-8?B?MGVXY01hQkpWbG9GRENFTHhGcmhhaVVZa1FlSTVXNnprRHdvOUlybkNiWG9y?=
 =?utf-8?B?enBYS3NSdU81TG85T1lDaGJUVWZjc280QU5oVGZ5RDUvNEdIajkrR0FyWXRT?=
 =?utf-8?B?elFkWHB3ZzFoYTZGRnZGNmVHc2EvbUtqQlRHSjh0SERNMVZrK3hhWm5DZEZW?=
 =?utf-8?B?T2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 48e06c89-8ead-4ec4-05d8-08dcc13a819f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7717.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 17:07:00.8085 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SRKEFGr76V42v/KvW0Z2rRu+u5iO9FgBm++VUuxKf5qcBbnkzFZFPef/ytupA6gUWgO5K1bM9Gd0Gk48ZRDaFNVa1x38zvtDfMxjYNWkzuE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6663
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


On 8/20/2024 2:02 AM, Himal Prasad Ghimiray wrote:
> dma_fence_chain_free() can handle NULL input, there is no need for NULL
> check by caller.
>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_sched_job.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
> index 44d534e362cd..4ed0c366ccff 100644
> --- a/drivers/gpu/drm/xe/xe_sched_job.c
> +++ b/drivers/gpu/drm/xe/xe_sched_job.c
> @@ -89,8 +89,7 @@ static void xe_sched_job_free_fences(struct xe_sched_job *job)
>   
>   		if (ptrs->lrc_fence)
>   			xe_lrc_free_seqno_fence(ptrs->lrc_fence);
> -		if (ptrs->chain_fence)
> -			dma_fence_chain_free(ptrs->chain_fence);
> +		dma_fence_chain_free(ptrs->chain_fence);
>   	}
>   }
>   
Reviewed-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
