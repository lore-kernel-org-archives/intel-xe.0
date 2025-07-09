Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17E39C83F09
	for <intel-xe@archiver.kernel.org>; Wed,  9 Jul 2025 04:34:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF8D810E1EF;
	Wed,  9 Jul 2025 04:34:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qw70672U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9054D10E1EF
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Jul 2025 04:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752035665; x=1783571665;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Odafjz5RWvQpBT/zyxQjClX0SEkBx/BRJhSFXS6CFtI=;
 b=Qw70672UaEEV/nH1yTseJxV5yXQSXG593vcj9nW1c+srFupy0ZBZdSRz
 zd3yk5N9LBbhkoib57aJWOH7ZrgLbeMQ4eWKumOrHkGFyPMt9w+5lXsMI
 KmTLXA4TfMoy2e4GC/6gk9Ryl4YWf+1DymI2KaUD2soe04yHjgpMM76Pm
 86a3tt1USvu10qJx/Y7DsXX7S6GQvjuA1Y2LTtR0CIs6C5B57z2n1oqiv
 wUtPrNMoMKqojjHlDf8SnHFHwzA6/a0Xtd1Uq8BKuVf3V0TlGgw8n45Ue
 SEPz97MNc4TyY+cQpm+XBnUPj+9qsSE8Ka0wPapIl2Z5+dXGWhr/ppkvH w==;
X-CSE-ConnectionGUID: 750qhvIJSS6U9mmeQy3+3A==
X-CSE-MsgGUID: aqhzUVf5SxOduhKoGkitHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="65347612"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="65347612"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 21:34:24 -0700
X-CSE-ConnectionGUID: rj5/kf6xSsyhRM4rh8NnJg==
X-CSE-MsgGUID: BSKGFvKKTFWSKYA/vbuChg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="155293316"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 21:34:24 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 8 Jul 2025 21:34:23 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 8 Jul 2025 21:34:23 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (40.107.95.72) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 8 Jul 2025 21:34:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tPWciBeaGUFVXLDjq0SWokCE0YoyFQ2voYtqQhrid9dqG3e1981r7loERXFZ8+M6qXBnXLbsnpb3L91OwXjKLpY6PwbaLNsA3Xj1AurVr8fSis6rrfYG8e4jDjFMQ3eZEivLpWJx0nI2WZoy8rP1Az+Y6LXvLGOzz4g7XNPaOtGcpSJyhZXwZg8rKCTMIE6XQUzT/BLD48YZ3r0fwbfJYnc7cecBBLWAmsJcBvCGSgsXHhISd54VvDLw0yFIas+Kp+ZuPICWM64DTGu5BfcOqD2RtWbNzvMhYVWPshXraJmNIejOVr3ip2XxsmjLYkr2vfM1zkKB2JLSRYbwBW57pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uLgBN1r0ClKBTe/Rzze7oKjVyByX07aTH0Rjh3RMMS0=;
 b=qMcqLiJT7+c9h5+6R978nEzIBZB+GWzHw+/EnUUh5MlqBGbHnX0G5/SJWwiEigG8pfrHPMueYWzUjdKxSWcGQ3ViWc6hDmzC/yi9+AIaXwGbHCwEpE4sc1fV7vdkNsvZxj81EoE2uPbzR26hTo73P3vc6Yy/gl1Q6phfWVDj4Hq/1E2CV7PWsHO7QviRFz1Ieo53akiJjqVFl5W5yHo0dpk7TGlthsLBMaolRzEqmU+at9GgIAeoIL4JzDCkWRQW1k2YwsTKVtqqGAUmVT9DzNeM6HZ82UGk93mTZsNKcrhZJTCR+K5YszRutRqCuCtRcp9UQerpnFM72+mKRP7RXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW5PR11MB5881.namprd11.prod.outlook.com (2603:10b6:303:19d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Wed, 9 Jul
 2025 04:33:37 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8901.024; Wed, 9 Jul 2025
 04:33:37 +0000
Date: Tue, 8 Jul 2025 21:35:21 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <Simon.Richter@hogyros.de>
CC: <jeffbai@aosc.io>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 0/5] drm/xe: enable driver usage on non-4KiB kernels
Message-ID: <aG3xidZTkbopob1d@lstrano-desk.jf.intel.com>
References: <20250613-upstream-xe-non-4k-v2-v2-0-934f82249f8a@aosc.io>
 <ffe4cf3f-7f4c-4d24-85cb-b1d80266797f@hogyros.de>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ffe4cf3f-7f4c-4d24-85cb-b1d80266797f@hogyros.de>
X-ClientProxiedBy: MW4PR03CA0046.namprd03.prod.outlook.com
 (2603:10b6:303:8e::21) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW5PR11MB5881:EE_
X-MS-Office365-Filtering-Correlation-Id: 89eb5ee1-936b-4b6b-8fc5-08ddbea1c5dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T0ZrM3VzOVBlbXZPTTg1WjE1RmdOZGxLSWlacENBWExjQUxBZ3ltaXYxSUd2?=
 =?utf-8?B?L2FLQ0tDbzN0SXVic25JYjFoR1B6TDJLY0MvWFA2VWM4K1hHWkNzblc2T2xO?=
 =?utf-8?B?V2NzcEM3M3VqbG5NVnJYTHdnUGdXbjBrOU5tMzJtMEJualc5bm15bmNBZWQr?=
 =?utf-8?B?YUowOGpKc1VCS2lmbWxrYVJmRDVnUVBGM0hHUi9vUm0vd3N0Mlk1Y01LaFNP?=
 =?utf-8?B?T2NFazlZYjkxVkk0cXc3bkFaR1o3eEJCdUhDR3ZGbDlJbWNoY2ptekY5QmZZ?=
 =?utf-8?B?b1MzSUc4RG9Sczk0T0NxcVZpWC95VVh6M09oZ25BOU8zekY2UzdwNVN1dzQv?=
 =?utf-8?B?Y09XK0dFZ1A4ZEZKWEZHTm5kWlZEbVgvWW10dmZEMzVpeHhDNlN0UWpXa0FT?=
 =?utf-8?B?VC9PSml5a0twdVJaQ0tPc0FKa1JJMHl5UXNNTnNya2pQU2FOelFrekprb2FH?=
 =?utf-8?B?Z1BNaXZWNDVyc1hNWGFxS29RQ1BsRXpGakprM0l6NzRPVmVqOGErN05aOHRO?=
 =?utf-8?B?MXNQSTJOaHcyVTFmR0RYdkZJZVVIVndobU5SRWVqNk9GYnVqaG5EUHlaVnRR?=
 =?utf-8?B?K3VvQkVGVWZWM3phUnIrUk5CWS9qL21mR1hlSDdiK3FpM3dUdEN0TzR5cVNp?=
 =?utf-8?B?TDhjbjJXOXVST3RWQk1WM1NSZXRicHBxckRLUTRmaGY2UDk1U2NYbDBKREhK?=
 =?utf-8?B?NFNJNkJkeEMyY2hxblJFK3JyMXVicmU0VlRXTC9zTlRHdjZSNS9LN011Z2t1?=
 =?utf-8?B?bWhqa3gycSt0RXlBUkJmaUtvT3ZBTzRRRmxhVFk5Q1VqaC91M3c4ZFUyM3Fs?=
 =?utf-8?B?UFIvN01oRFN2cCtVaDA1eGVKcW05MFh1OE1QTHhlcVBldmhCN2pkS0wxSXVH?=
 =?utf-8?B?bUk1T0EwdjZyZXc5a2ZxczJGNVJnUzVNUlA4Um80Z0FMQVlnbG9jWU5ncWx3?=
 =?utf-8?B?dHhHZGhrZjZCaThRRUp3WURtSThaM3BETVJHQjdxUzdQMVBMWlpNODdKQW4v?=
 =?utf-8?B?QUhka2s5QWg1a01NSXQ0ejVZTTlzZGFYMVJ6WGQvNjFKbThBT2E4c2RzNWN3?=
 =?utf-8?B?MjJHTlB3c0lYMmhDbW9Ka1Nub3Y1eEo5RmgwT1craElvMEpyanVtQk5qMWw0?=
 =?utf-8?B?TDFsczZJbTFiN0R2Yzh3V01OS053TWdoQUx4TFd2UzkyNlppMEhURERLakd1?=
 =?utf-8?B?Q1MyalVRamE4dXNucHZUWjdpa1VWaEdrR0VtRk9sbjNOU0lkWFlwSUNiSXlK?=
 =?utf-8?B?aEo1M2wrWGM5ZlliUUFkeFBsYUk5V0xXRmxadi9leHJETWhSbUZUaU0zNHFw?=
 =?utf-8?B?WmR0SlB5dkZTdEhTcFB5SXIwZG5XYmJVVFdXWThuV2tpYllWb2hKcElHV0JR?=
 =?utf-8?B?QVFlTG10dEQ3a0RDNkk3TWJIMVhLSEt3M0U5OVVBRHlGajJ3OEhqWU4vRWc0?=
 =?utf-8?B?N203SVMrdmlXTTBJUk1VYTdnVGFMSnRzaVNvcXQvblFXY3l1WVlPVkRmU2F4?=
 =?utf-8?B?YUZDY1Nzd1FpYnNzUFZ1ajBYS2tUaHZJWkt0WlMzUzhuNnVVS1h6NmdXbnJv?=
 =?utf-8?B?RFFmbUkzaThBeTd2V2pkcnBBbHVRTnVhRXBEWGErMVdQTDVSMmVOemsyRjVs?=
 =?utf-8?B?S3pmTVlHRllDMjh0ZFMweUNKdnZpN0F0MUhnTVNlUEdBMHVGYnBFcGJRTlFO?=
 =?utf-8?B?Ry93dmY2S2I4R0tRZ1R6SFI2L1NybHF0YnVCdmZ1VWc5UEJwUzJZSDJwN3hM?=
 =?utf-8?B?a2lqWXAzTGNNV25rTmtTNWtYcGhaM3d4dEVBOEx0VmxiYVpaM1VHVUxPaVBw?=
 =?utf-8?B?OGN4OVM4WEwvVVdxWjdkYTBUbUdkMTErMkU1T0cvQ1Erd2twRnVFNVBQbFhn?=
 =?utf-8?B?SDlncmpNV0tURGlydW12N3J2My95NjhsdTNhTUcrWWtabzlvbTdBdnZqcVp3?=
 =?utf-8?Q?i1Upn256Bvo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U3lwZXN6Uy9oU2NRUnhrTGFpSWxiZUFZSFNRdWx2d0o5NW02aUFZeW5vREli?=
 =?utf-8?B?TnpHd2RPTkt6ajUyZFZ4U3cwcDFjY0wxZmFvODlYVUdQSGRFQXBxS2JXYmdk?=
 =?utf-8?B?L3FRQ1hPRzJMa3dGVVd0NVhoS3haTENFZFNGV1Q2RktCQmhNdmgwU0NHaW95?=
 =?utf-8?B?WmZLazF1eGpVVjVMZWxaWDJvcmNpU25TWWxvTGtUcTNLZWVCNk5OTFY0aWNW?=
 =?utf-8?B?NmVCVERBUURUS3p6RFpsTmNQUTBPbTlXQmlyQS9TSThjVVpRUjAyZVFXTUda?=
 =?utf-8?B?dTF6M25IKzQ4Mi9lWHk0Q2ozalBlbzJ5WGRuWlRoNkdTdUNpT2gxdTdqVVZI?=
 =?utf-8?B?cm9hSzUxOUMvNktnZXRpczk2YmJKMnpINzRDWWMwcThTUmVBd2hvcmFINWpn?=
 =?utf-8?B?K2QrMGkwcWJiZUJsTk5VZ1RqcUt6Y0Zwb0hIdlZwMVlnZlpoamcxQlJ4WUly?=
 =?utf-8?B?M0ZYZ3RnS0dzaGxCSGVvM3dQYVNEOVp6V0lmSWNxU0ZaLzJBWkFJU1JremIz?=
 =?utf-8?B?NmhpVEd3QlRuSTd0b0NlTFlkMVBJWExoR3k1MEwwWkJHbVJjWHpXdE5kci9P?=
 =?utf-8?B?eno2SkpmZXU4eDBFejk5Z0hRQ3NMcDVLN3RqYlJpWGJCM2dhWVVyWStxK25l?=
 =?utf-8?B?dFNWMGI3SmRHQ0tvczJHbS82QkFYZ21yMXpqUThONjZRU09wZnRUMkdBZVVr?=
 =?utf-8?B?Qi9aNmtTTG9NQzRsdmw1Y3NURWJZTzhPTWNYK2JSL01iUUFROEFLZytIL2Rx?=
 =?utf-8?B?U0JGQnpRMEo0Qlp3U1BqS3RhQUVMQmdpYlhJZ21qVzlhaVlEWmh1djRUcjc2?=
 =?utf-8?B?b3lmMVViVkNQSnp0c0I1RGFkQWRFdHJmWGIzVXdhejZsZHBpQkNRTi8vRVcv?=
 =?utf-8?B?WlZieFpPUTdYY3pFd1JiK2poQWFacHhxSmVRK0Z6ZVJGZ3N5VFNmMFVlYTFy?=
 =?utf-8?B?KzNpeVVNUDFFQkNBWlNFTHVJOEowTk9OVjlLb3N0ME1BMUs4VGp5WW9GUTJ5?=
 =?utf-8?B?ZXZZMVNWeXdSa3Z2dUdUanM2dWxDTHAwdnQwZCtjVkZUYzJWd21PaURvOEhZ?=
 =?utf-8?B?NHFYQzJvZkE0NG9mYndGTVZNVEkvNzRQTnNwMUFaRWNHSytQd2tTL001bXI1?=
 =?utf-8?B?L1luWElIdFhqVnBCbjNwZWE5VDNHcDhQaHc0N0ovSy9iQzZDRmJJZmsxNEgy?=
 =?utf-8?B?cm9mTFJSeVVjVWZuYTJnN1ROb0l3NGJsK0QxZVFHNXNkcTEreGFHYjlkRkVs?=
 =?utf-8?B?ejhmNVRMM3NKYnp4M1pDTEErNGI2SnNMNjJiWUplL1A5NTl1Q1pRZGRGTUd5?=
 =?utf-8?B?MU9EenpvVDdUM1NFR3dHcDkxdUZBNVlYNGUvcUlvbmo5a3gxdGdGL0o2RmVp?=
 =?utf-8?B?dkhzMzJMaUYvcGQyTS9URC83aWNXSzRoTTVCZXE4akFnQjZzTFlJZ1RncFpu?=
 =?utf-8?B?dWJQNTdkSVJ4TE5sblFVbTVBcGdXQVB4NUZwSTNuR0YybU4ybkRaUFpKaVRJ?=
 =?utf-8?B?Y1JVanJEUm5wODdsYWdlbENteWYxcDVRTVQrLzdRZDNNRTN2dlNWcU5aaUU0?=
 =?utf-8?B?MHQwNHZndHordmJtdnFYNU42d2RMVndtaWxlMWVFWEZ5MVhjZ2R0Sk9JUTQr?=
 =?utf-8?B?Y0MwQzRGdzRraENiR3pub3NxaXJmQ0FlQWRmZWEvclNZQmNSWk9Tek1wYi93?=
 =?utf-8?B?U1RQK01iVDVvelZhWjVWdGJ5MmtUMlc2L1pkanRkNzdESVo3TFk3aGNTRDZK?=
 =?utf-8?B?MTJIdTlLNGVFVjZxL1FNdDYza0lTdlhOWTVDMXltamxRMmttblpmM1c2dStr?=
 =?utf-8?B?ZjluMzNPS0NBWlNyMGQvWFlnaWlvR2tBckFycVQ4ZExLM0k0TDVZS085TGJG?=
 =?utf-8?B?MWFkMmM0QkFzVmpibzBQbjVMY0IvYzN1SzVYeUdVZHEva0I3K3dSclo4alV2?=
 =?utf-8?B?OWZBT2J3NWVHVjNDbnZveklGTERzSmZtdnZFaHhPcWRRay9LU2FqNXc2UUhi?=
 =?utf-8?B?U3NseFNuaWZ0VVg5RU1QZ1gzN3pPbU93UE5uR1hyTXQwTkxRLzZFaHpiM2xk?=
 =?utf-8?B?VVFCVGx3MVhqTTd2Wlp6WG5VY1hQUTQzdU03S0t3SEw5aTNDMi9yQVd0VkNZ?=
 =?utf-8?B?M3BIdGtWY21SbG1WOEsrbVlNSUJPNE5Nd1liOEorMy9WRjdmTEk5SWpha1Fw?=
 =?utf-8?B?c2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 89eb5ee1-936b-4b6b-8fc5-08ddbea1c5dd
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 04:33:37.6037 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EuGYaDkhzdA4mTGdlyYT9dphghLjSt+l1p7uH83fXr/jHLfX7HiBa4149aKu/hlcLrTea/u2G8x6BxU8v7P+cw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5881
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

On Wed, Jul 09, 2025 at 01:02:48PM +0900, Simon.Richter@hogyros.de wrote:
> Hi,
> 
> this needs to be rebased after the abolition of bo->size — that is either trivial or needs an adjustment in how the size in the parent BO is set.
> 

Did this series set bo->size to a different value than the size argument
to drm_gem_private_object_init? If it did, that could be an issue. If
not, s/bo->size/xe_bo_size(bo)

Matt

>    Simon
