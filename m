Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E38FDC3DA4A
	for <intel-xe@archiver.kernel.org>; Mon, 12 Aug 2024 03:09:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2ADA10E08A;
	Mon, 12 Aug 2024 03:09:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DqdqP8JB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF33910E08A
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Aug 2024 03:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723432178; x=1754968178;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=+KRYfD6zrDHZlcCd0MctGItvOp2mMRbcLZtOmv3H7uY=;
 b=DqdqP8JBPv7fjDq26PIEIFaF+TqODW560u5CPcXC+qhA5lOTsW+lYMlG
 BeYbdwnvhuHaYltEeRoIh6JvzxefquIldncgTEiAHyEcPK3Q+LgJQmCo1
 C8KvXL2Gc0uAkXmG1SNWHf3VbaanHtceeGa2zFKCWOcqgbzCDjKazHnrJ
 OXMhU8AvBQliqgeZ1Z7XbhqJ1mu9H7n5pv96Gp6qAKlHadwyQCSAwkW16
 kfn1mA66pa6638nmb+kwZgzd5z1lT9vIDLIOV9i0KrPp2A40QPN/SZJkv
 m/PTxA6lG++qtMze3BpPNWlDgPc/cSsWRfPjqCERXLavVTzqFS2tVrCvA g==;
X-CSE-ConnectionGUID: 0oftx3CBTBOoKtF8tiVH8w==
X-CSE-MsgGUID: Na/9VvaUTPuCYIlX3AI+8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11161"; a="44043690"
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; d="scan'208";a="44043690"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2024 20:09:37 -0700
X-CSE-ConnectionGUID: hOGiOMpSREmwxzyzf5pjQw==
X-CSE-MsgGUID: lHdccddaS0mWbaxyfVHdNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; d="scan'208";a="62975800"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Aug 2024 20:09:37 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 11 Aug 2024 20:09:36 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 11 Aug 2024 20:09:36 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 11 Aug 2024 20:09:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YbsiYdZvHfDD8LzGFZy/f5zwOf2LHjBRLttXe+B7S8hPs9K8Q7z+Pw5v2dcCJ2RYpwBv02s1BquWK9oO3IH67go/WD8tWZRiObSfcJAI123b+hhLEGpGu+SGXQH1T4cp16qdPv6gPwCNb0UKWa/lGJetOPtqpB9puEu22h9arwEPqmUWSdkYSySCTd40MKmgO4E3VbLuRIgWdvmxUJ0YIHKeM3kXVMpTg6U6Azm230dv+nL8SmrRvQ2NdB3zJIQBbWry31iOvkOzhkgk6pLi/N863Mf/yJU1ZNago5ZX5/h8Rs9pJX06gtf8Wh/CBrEgDhn7NnTz8HykSU4ndXl9Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PA8SfDQZCq1Vot3NWxjVzUntUhl0+CA8HcLw1IYFeDY=;
 b=PEjHiekvF9kNWrbRxz97pOUNnPFnS7VLHLDX+w2h9rkUwfh5jzdkRwI3awt9WXUHDIXDKeLIsYt/AlXsjTs7qhU+09LyFTYQ5rEOttWLaSVS+PyyTggkCaRgMYtb0G9TKyOwyt9d+7vd3GKe0P6IsSUw/l4p+wt2y+NkaOWjUTH1O9OQWLYwbqJmcWhLnOkantPwK2YyuuBsWki3lILPbH5NLjNEyQ5gqWW5onh1AKHop9LFTpO+/rh2wF8RChvkp9NQ8IuSNSMJn9EfkRxr7NJzgA6CfPDSDhCYueBGP38TSlivfw4Bc05L2oM2KsOc6WCZmDIeGd2iQuPjeCj73A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by PH7PR11MB5943.namprd11.prod.outlook.com (2603:10b6:510:13f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Mon, 12 Aug
 2024 03:09:33 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%6]) with mapi id 15.20.7828.031; Mon, 12 Aug 2024
 03:09:33 +0000
Message-ID: <9b683da5-8b3c-42b1-a1db-5be14819895e@intel.com>
Date: Mon, 12 Aug 2024 08:39:26 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Fix tile fini sequence
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20240809232830.3302251-1-matthew.brost@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240809232830.3302251-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0053.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::8) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|PH7PR11MB5943:EE_
X-MS-Office365-Filtering-Correlation-Id: d7c67c2a-3f56-497a-640a-08dcba7c3051
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SDNUZ0Y3ZFROZzJSdXBYMVFLYnFxdkhoVmFjTnZicGZxTlBrT1dScDUvZTBS?=
 =?utf-8?B?ZTQ5TGNaZ1FIc2xxWXdhNWVuRDc5TE1hVGM4V25BeEIxZ2t5UmdXT0FpZTFF?=
 =?utf-8?B?QmhhTkhybm1XZGVLSUh1ZExUdm1FSklZckFIOTZ2dUlIRVhucjBnL3hUT2pX?=
 =?utf-8?B?c0tab1ZGRE5NcjRRZXduSXc0cjBFMmdxWjVlVVAyb1hBQ2k1eXh6eG1kUjR3?=
 =?utf-8?B?ZU9uUnhxeTFnY1RJbG91NnltL1hMUjlEOVE4dCt2dXp4eGpaUGxRMDFFejZ6?=
 =?utf-8?B?Y0tPV3ZYZ2U1YndXMFZZZ3FDNE5EVmlIZXRLSkhpT08ya2ZKQWRDQ3VJSkMv?=
 =?utf-8?B?VlJDM3liWDNOcjVSeUx4OHVTNUZ1OVN4ZkNpbHFUL3pOZGtkbXpHcERtSlpL?=
 =?utf-8?B?ZWR1R3g0OGg4aU4vclNVei8xbytKbW9ZU2hhT3ppTEFlczRqUlVTekhRS2FK?=
 =?utf-8?B?M3dmTnBKUEFFTFZGSlo0MlFWWjhWdzN0empaMTFZUjh2TmU4c3lvWkVmTjNZ?=
 =?utf-8?B?RWRESkkwaWJFcVhZN1NOdGhxZFhxQ2ZmVCt6ODlDeURlV2JYdFNOOVRlUXpB?=
 =?utf-8?B?TEs3YmszZFpTTXRKK2d0UnRxZVh2RUFBN3IzR1E2aHV6WTJ3NWxlV2p0dU9W?=
 =?utf-8?B?M1k1SFJLYTFuZkhUVVJ1Y0UxV3RQT2I4cmVRcEJ6L2piWVR3VUFCSDQvM3BE?=
 =?utf-8?B?Wk9scVFFNUJhUUxuVnNBY1Q0UEtFTTRKOGg4Ui91dFhySStWYnRtZVJFS2Z5?=
 =?utf-8?B?bEhmWEZ3VEhTU3ZmdzlBd3FiZzlMUFRpbmRjb3pmcUtHeDc3aXQwUXR3NEEx?=
 =?utf-8?B?NDJiSmR5dVByOXNUZmx6N2d5ZXpCTEdUZTRGaFo2YUUzQWRjTjNxK3lFaGVX?=
 =?utf-8?B?aU1yNlRhN3JrRUtReDhJV2lNbDRiTm42RHpVZkVLajM3by9ZWTNKcmNqRGJV?=
 =?utf-8?B?ODV5OEpObmdYSzRhTDdXM2NPci80cHliRHB2Q2VUZElBRzE5ZVppV29jcHdo?=
 =?utf-8?B?NHFVK0hITE1IUkw1YXE5WnphUGpwc003dU16SG4rM0YrYnhZZnlTQ0lsa0hG?=
 =?utf-8?B?TDB6YzhHMlp1YkptMWhkUnZhZEMwRzBac1FsV1J5c2t2TENzZmRPOGxpT3Q0?=
 =?utf-8?B?Y2JqR3pQQ05RZkFpcHgzV0Qwd1hWdzVEczZXVDY0YVg2NUNQV3N2V21BODBa?=
 =?utf-8?B?WHNBWVpFMGppRWM1bDRzYzdpbnJ0cmpyc3dndW1tS0tScEhscDRaclpGeEdx?=
 =?utf-8?B?ODFxWWdKV1NYajJCTDUzcC8vNGxXcXZNQStOUTRiV2YrZ2c4NFB1d29xaEo4?=
 =?utf-8?B?RUw4V1Evd2FPaktrSEhYUHBqVTMrZ01Id1V1cXBtN2ZVVXFuMUJYWGdad09C?=
 =?utf-8?B?cW1UeUJZVlBqZVRrL2FTUGc4VStjYmJNa216WUU5YzFmQnBUODdodUxGZEtY?=
 =?utf-8?B?OTd1UmFyR3VSZDhCZE9iWFl0ZTI2bXBBeXRBWGRBejZ3MVF3a2NZZURyUHVF?=
 =?utf-8?B?OFc1b3pSQVhveFNqZnBsb0hWRmlBemt5ZEVWcklBb09pR0tmc0FvU0pkY3JH?=
 =?utf-8?B?dHduWDZuTTF6WUdFVnNYdUVaL2k4UUEwbXdaS253STViZUpudkZUdVBQWHJi?=
 =?utf-8?B?NzV1VzFhTWZSS1AzZ0dkUTlGcEVJb3NlSy9xdFIwS091YzRvWnNFbjhhbThV?=
 =?utf-8?B?eW11YUlEenZhRkhWMDdiY3JiM1hwQzdOVTFOWkRjR3g5KzZ4YlBzVnFsQXJt?=
 =?utf-8?B?bmxtVFdCNzVmM1ZXSHp3T1hpRnhJcXlZZHpYdlJ6VUpxTWlKVlBJdGR2RkVE?=
 =?utf-8?B?L0k3QjFBY3M2S1YwMmRYZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YjRYU0NNcVpjdVl3RUZzYnkrejZSZ1QvTFA1akV1N2ltOWc1N2U0bTIyWEhX?=
 =?utf-8?B?OTZ5UGphazlrOUZyY3FteWNzeDVGcDJwaEVKcDV1ZDVWNlV5V3dQMHhKSTA0?=
 =?utf-8?B?c3RMWlg5c21KSGRaTzZ0WXJ1bCtnSll2cGQzNkZNY3JXa0NkY3o1ZjFYMWFw?=
 =?utf-8?B?VjQ1ejA3dWNlUVhjNzRjbytzM3JoTmNzcDVPVzZiRXpqMUxVa2Qxb3ROc0Q3?=
 =?utf-8?B?VHVUaVRFOEt2ODQ3Z0hJQnluU0x1Q2lrZnNPMXBQdm9OdlZvbUljb0lEdGpj?=
 =?utf-8?B?eUsySkJPaC9VVUE1ZnhoTDBmRW8vL3VlUG1aVHA4OHpnQ3VUd3FLM2Izdklt?=
 =?utf-8?B?T2F6Q0o5alJCOUZ1ZXpPQkFibUl6UlZZWnBINmVHekl2TEVCY1RkdDYzZVhj?=
 =?utf-8?B?cHpNVkc0Mlg4bENGUmxUalYvU3NkcXJkZU9KWjM2NkpnQ1oxbkhxQUVHUVRC?=
 =?utf-8?B?Unp5Sno5SGxBeFBzZkV4U0IvbDFOd1FVaGFscXFZYW9EQ3BVMjJzby9Mdjhj?=
 =?utf-8?B?eFl6OWUyMWdXRnRSM2w3NkkySUR2UnQwTjJYNzNWYTVqRmdLaFU2NnNCU3N0?=
 =?utf-8?B?RHBPakV6RXdJZGxZZVp2aXdON29LK0FDUlJUdVI0NVpPZXhnU2ZTSGQvNzNV?=
 =?utf-8?B?Nk9mc2RtakxjK3RiakhwWjYyV3pNL2UxbURXdHpmZ1dPRmludmx0L0ZRSzNY?=
 =?utf-8?B?VHR0Tmdsa0xLOURPeVNpUTJhUXAzQk1xanJFME9lT0VLbjRSQWw3NmxyMVV4?=
 =?utf-8?B?TE1OTm5IblRCVGlPc3QvbFZXdVk3YmpBY05ISlozd3JFTXNWZHllMWRaL0Jj?=
 =?utf-8?B?OHZQb1VBMkk1TVkwTFp6ck5ETU1JOEpPQm40NnBpM2UvcEgvUEM3Z3VJdnh3?=
 =?utf-8?B?SmtPOW1qcUVXOWpuZlQ0aWo4dG5pRnhBSzVTTWdUeXVPTCtiai9MKzIwazBR?=
 =?utf-8?B?dGk4UXFvWGl6RytUUUtaaElYMXpCdXZEc0NMbWZSbkJxQ3l2dTc0MFlpc0pT?=
 =?utf-8?B?ekpiWnI0elZLRDd1VDBMM2VyTnFWZ09saUhudjZhNkVuR1Y1MDBVdXRBVkI5?=
 =?utf-8?B?bC9GTUd5cWdYUUR2Vk9wS1ZnMHZDczZKaFJZQ3R6azJpT2hOTUFHWGhsdXo4?=
 =?utf-8?B?QmhicHRzZWZiTlM4REo4N2tvTld6NVM3UmxiZ01NWUJVN0lTM3dQaU1VbTRx?=
 =?utf-8?B?b0lFSTQxM2pvNlp3YVVjZWJIVVdxbmFtQXV2MHZQb3U5Rks0WUZvS1JiVzVB?=
 =?utf-8?B?QW9KYjluNDRhd3ZkZnVScXhJbU9pTU1qYVUzbW1KL1o5SXZwU0VNWDFldDd2?=
 =?utf-8?B?T294Z1VIcHVjWmlYbk8zYUhGTmdIOEJlUmdGSE9KcGpjVFl5NldpTjdyamsz?=
 =?utf-8?B?c3RpczBtRFJLTnBWeC9sazZ6ZjRscUNvZ2hOanRvWnp4ZDZhQVdqNlhQQ1Ey?=
 =?utf-8?B?Z21RbFRuNjlCd1hFQXVlUG1iQTBaeWhSK2MwSkhZcEtFdnFXdHJHODNxc3pm?=
 =?utf-8?B?c1VpenFpN3MrRzB0cDg0YUw4cGNxK3pncjVPVHRta1hNb0NmdXJ1ZXRoeDFM?=
 =?utf-8?B?QkNYZktERTBoenFCalNMVjhRaGFqS3ljakFHWHdFMzlHSHNIRG5uQzVCSy9U?=
 =?utf-8?B?alVJUWFSY0lGUlhXY1VDTFpOdVBkditkUWpnN3k1bHBvTlZzRkxuS0Ivd09K?=
 =?utf-8?B?NmhXZTRsTFpPYThLVFg5VVJQcllneUg0Wm5Va2VrRjRBUS9BUjdxNk9nNWZR?=
 =?utf-8?B?Q0lJc1BvdksydUt3L21tVUpkMnIvSGFnVU9rTzhvL1k0aTFNTFNEdFVNYUlR?=
 =?utf-8?B?V2lDL3VtLy9oWW9LejBTMmkvZVlLY1RPdEs0VmhOUmlvSHo1ekZFMFZCejZk?=
 =?utf-8?B?UUNlcjdYOTMrcGRVdUM4VEkzdVRGLzFDa0NlZ0FEWXE3SHhTaGVzRDllbWxO?=
 =?utf-8?B?YXVna0dUUXVQQmxCNldZbFFUMGtmT2JxOFdGamwrdEc0TlpCc1NlUU9BbG01?=
 =?utf-8?B?VUpnWXZUUWxtQXBSbkJtbkIzdmNzTW5nWlNLalE5TTlxdVM3bUR1Qlh4WFFy?=
 =?utf-8?B?azJEd0NhSTRocWZPRmpJTXo3WEIvdVlybjRRTG9uVEFjdE9QdE9LVnViTUpY?=
 =?utf-8?B?ZDdhanRERHUxd2oxOXNuL3hFajRxS2dkV3VIbldmb0Z2d0s2a1l6d0FhV2g4?=
 =?utf-8?Q?fC/wc7gFGd5zvlnpjeBFshU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d7c67c2a-3f56-497a-640a-08dcba7c3051
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2024 03:09:33.1923 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EXNcMXHl3CsFl23OZXC3NWqqVbGt3GwYr/ph6V2pDp2KHrBKQeg5rhXDkGdWUjp6vU0r0NBeip3YYRu8v7tzspqccwcWdnkKxqmdUflb87w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5943
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



On 10-08-2024 04:58, Matthew Brost wrote:
> Only set tile->mmio.regs to NULL if not the root tile in tile_fini. The
> root tile mmio regs is setup ealier in MMIO init thus it should be set
> to NULL in mmio_fini.
> 
> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_mmio.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index bdcc7282385c..f5bdb540e823 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -30,7 +30,8 @@ static void tiles_fini(void *arg)
>   	int id;
>   
>   	for_each_tile(tile, xe, id)
> -		tile->mmio.regs = NULL;
> +		if (tile != xe_device_get_root_tile(xe))
> +			tile->mmio.regs = NULL;

Patch LGTM, just a minor nit.

if (tile != xe_device_get_root_tile(xe)) can be avoided by using 
for_each_remote_tile.

With that
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

>   }
>   
>   /*
> @@ -146,9 +147,11 @@ int xe_mmio_probe_tiles(struct xe_device *xe)
>   static void mmio_fini(void *arg)
>   {
>   	struct xe_device *xe = arg;
> +	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
>   
>   	pci_iounmap(to_pci_dev(xe->drm.dev), xe->mmio.regs);
>   	xe->mmio.regs = NULL;
> +	root_tile->mmio.regs = NULL;
>   }
>   
>   int xe_mmio_init(struct xe_device *xe)
