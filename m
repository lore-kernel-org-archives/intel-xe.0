Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 261AAD6A221
	for <intel-xe@archiver.kernel.org>; Thu, 14 Nov 2024 19:46:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB65E10E359;
	Thu, 14 Nov 2024 19:46:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IOFourpj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B2EB10E359
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Nov 2024 19:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731613590; x=1763149590;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=7LyS/u/jU8RWU4HOProyTjnXDayo7rfzPqzxmSBu5Q0=;
 b=IOFourpj2ZfwTFypPWTcWX++PJP0g7ERwrY0WdcxrtaogwrdybDvkpNC
 wglnbVQjxYUvrVWXVS4n5VpsR2ixuuPQp1nC6DY75hFHaZ7osFUDyWcNV
 7SOKHoC0rKjCLgd5IGbPtjeuq81y/1FFpPhu5ZuAj4ouyHAbNZMEhZOlz
 Ltq9McSBEEcLV5tkmYIcNkTWaIledotvDDBG1tUsayilZswAWifNHZgPi
 UZ0ApD+fXwRKVLCNSov7aSKP5homZ/p8q/LfiEjk6hWRNu75FNvpSKDU+
 NyJtKJlKFELbsW19mQn0B78q7iVMAd9EcCx2NCOLO4R0tijsb+DaIMXWD w==;
X-CSE-ConnectionGUID: DgS/9o9SRjqG0VRBCQ4eWg==
X-CSE-MsgGUID: j1qinzV7RDWqzAKKTN/DEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="19195647"
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; d="scan'208";a="19195647"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 11:46:29 -0800
X-CSE-ConnectionGUID: yHGX7ZR7SIeCYMGtpTC7HA==
X-CSE-MsgGUID: K5dkgGd5T6CnwJ7dvxJHQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; d="scan'208";a="93257578"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2024 11:46:29 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 14 Nov 2024 11:46:28 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 14 Nov 2024 11:46:28 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 14 Nov 2024 11:46:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eTa5ZHpksVaQLzigKCnNisOx0xVEwdCeP2+83IS684vqEuFCJVsP4lGwZXyCOPhvhNMmvPuml6cwZ2z4Z9y8WfOskSJX/A4W3NLvFbFVqNvwMD+uTXjoxsuum55ICeCPs989vvNI1C23ShULYF3shEaVLsFXo9rmZAlNnFOLsd9xTCqElh2PwLsHJdnX1/QDL5v6qm+p1dnaqRN8zp8d/11XKBNrc98C0Bi8E7tbH3FibVPwP76Pvp/nXHTi5oROkUlBVNudl8m1AbhZj/xKEFpry8cpE/mn24NQKVsch9cNIZ23djuetotDMAmRTYTcra1fBxI/PJeMZKDnTZVPhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ntxKb09kzr8HBhlh1L4g708uZ6jyrbWstvMizCcftEk=;
 b=fVjVKZRh2i7yZJ9JFr30nxOiXm7J96wQCCBfq0fLkWQzqpC7f+OhVcCpL2uxgyJHkaUTpGXMvWcCk3g08UAQjQ7PDpdy3arbhRKyIQ1qpw1a7/yOKsY78Ru2p1pBRYFkDp8fEr52zOHYoc9LpiMMaP3/cWNhVnfVRHbzUEUPUiLCghpGUIbpnA3W14VPBke08gU/KASSOgZ0k082ZbhJ3OhP4weQ5TIPip1tyijrDjMD9Y6WCGgqYNGiHSOzSb/ZgW9mD7ByNCwjohaPVOEUpZyq/bN90yuCStwO+mX7BFiLqEX4wUj3FXIftd5C51SDCmVB8hU7NVXyq8IJH91dHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by IA1PR11MB7824.namprd11.prod.outlook.com (2603:10b6:208:3f9::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Thu, 14 Nov
 2024 19:46:24 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%3]) with mapi id 15.20.8158.013; Thu, 14 Nov 2024
 19:46:24 +0000
Message-ID: <17ce458a-18f9-40e9-af60-fa0b7889651f@intel.com>
Date: Thu, 14 Nov 2024 11:46:22 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/12] drm/xe/pxp: Handle the PXP termination interrupt
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20240816190024.2176976-1-daniele.ceraolospurio@intel.com>
 <20240816190024.2176976-6-daniele.ceraolospurio@intel.com>
 <9655d74e-f3f0-4d60-bef3-b9006db61bc3@intel.com>
 <2eb53217-757a-47c0-81ab-6106d3e00c7d@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <2eb53217-757a-47c0-81ab-6106d3e00c7d@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0140.namprd04.prod.outlook.com
 (2603:10b6:303:84::25) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|IA1PR11MB7824:EE_
X-MS-Office365-Filtering-Correlation-Id: c09f51c6-b8df-4307-6806-08dd04e50575
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VmpGU2JUbU5IQWliR0VYTGdYSDNtL0JMa1FqdnQycEtod2xpR3pBb3lFeE5o?=
 =?utf-8?B?b1BIR2lGSGk0N01RYktSbEorR25kVE5OYmtvQ01QeGZyb2hMUHl5VVYvTk1i?=
 =?utf-8?B?UTBoOHlmRkw1WkVETjhLc0REaW96alFHYzZLT0c4SnNLZzJRcEZlK2t1T29L?=
 =?utf-8?B?OXBvcnBaZ1o0ZzBYZ05tWlhOSVVrZWZtak11azJiU0VJRk8xYXRZS2VMNWNP?=
 =?utf-8?B?Y3NTMzY3dWl3MmN4MU16ckRubUtFVWVTZysrc1pMOUJDU3hPOXJBVFNZU2th?=
 =?utf-8?B?Tm1TNktsQ2pXOVBDL1JJMFM4T2wwZUsrSXhnKzM3YWJ0M0o2bTh2dGd1R3Uv?=
 =?utf-8?B?Rk5DSjFwdHpObWZvMVUxZHh5bU4xd3VjT2g3SDlQMFhrWmhvNUd3eUZCSHlQ?=
 =?utf-8?B?REpaTGpSOXdsL0lsK2FyZmExcU1rVTRyNmVPK29kZWNLSDc1K0dQYkFkZWVh?=
 =?utf-8?B?TWw0Rk5FQXFDd1BhZkhlbGNubjlXN2M4M2Z4dzRhb0JyUjR0TUJCUFlXNWJy?=
 =?utf-8?B?c0dmMkRLVmpJc3ljSG1wRElJOUFkVFR3T0NkcEE4SG9MVHhqZEY4MUQyUGh5?=
 =?utf-8?B?R3g4UC9TbXIxNWIwMW1aUGVsdnpWYjBEWVBCZ0dWSm9Zay9tTmNHMDF6Zno1?=
 =?utf-8?B?TVNnOHV4VWJJQlpVenRvMytuQzZYMnFMa0g3c3FZNWdtR3dEL002czRjZTJH?=
 =?utf-8?B?ME9LTzMwMkRuQ3UrN2NLaTd5V2NVdHlxdWJDRHI4WEh3d2VCOWpVQ2w4dkkx?=
 =?utf-8?B?K3JkVUlzQTMrSldRanVGZlFqUEFRVFhnNnRmeWVVUzRTNWJOcURhVDJlSjly?=
 =?utf-8?B?MUwvRWRSZUZNbTF3ZFlQYUhYWEFLd2kwRFAvek9Hei9FeHRJc3g4SE5zOXIz?=
 =?utf-8?B?Yll5RXFtbkpqbHhRQmVuZW9VM0FzeE53MjAwOHR0dkZ6U1d2T3d2REtJNlQ2?=
 =?utf-8?B?MmtRcmZzVTJMbFQvdFk2NGVjNEw0aUp0bHVsWnFnNjd6WFRxV014ckJaUVI4?=
 =?utf-8?B?NjRZRXdVWWNqc0FlMUtLbytEMUR5OVRFeHd3clZIZ3lEekJFN2QxekxjK2pn?=
 =?utf-8?B?MG11QnRUNjVUcUFUS2JGL1hZNTNKSHA4NGZzenExUmpuZXpZalhHZnRuNHhK?=
 =?utf-8?B?czVUS0gxZHFVeEZDVTlUOCtIS0MyQUxSQU1Bd2lSa2c2UHQ4QjBGdmE3LzVC?=
 =?utf-8?B?b3lPbGRGSFFHazNVZVpPa1pDdTk0WGtXV3dkZHJ0SmF0RU9DTThxYjhYajNR?=
 =?utf-8?B?VXArV1JTRjVrY2tkWFZidUpKQUNVOXAyVTFBaDJzRU9nZnJvSHhhaU9wSWVo?=
 =?utf-8?B?N2ZQdkxPR1lHQnNXSlZ0aVJrckhHb3NGRFFvY1RDVWIrLzUveUFiczhmT2lX?=
 =?utf-8?B?cGpLWmxNRUp2T0VjWEh3enZmblBFODNTNE43S0ZUcEp2Rlg1c3JvZzJxbXNL?=
 =?utf-8?B?b0JGRG5sSWxYSGt1OTQ0ZTZNbGRDek93bzlLS2hHYkovdHM5cUlWajRxaHdL?=
 =?utf-8?B?UG9NZG1WZjAyWXVHWFdXMllSM3R4eWFNUmdsRjFwWWczMDlueGM1NTVVOEk3?=
 =?utf-8?B?RW96T0IrcnoyYkV2ZVVTdEFzdGNmOWhta20wZ3hLRTBRWUViVk4xTE8zb1RE?=
 =?utf-8?B?VVR0VXB4bFVoYmNSa091WVI5WTNiOUFVczgyTzY4WlZpblhRV3J5NE5OdXNa?=
 =?utf-8?B?MkNSZVovVGw1NFYrT29hN1d5UHgyS3pMRXg2ZVlhZ3poNFZWV1lvRVNQNVBl?=
 =?utf-8?Q?JJfNidYa5erJ2GwuyqIFumK9g/IXrHJPdfW4pTd?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YTVERkUxWnB3TGJBby9uOHEySHBNc2tGYU5pbjRudVdnR3BTVmxkZy9KWWVO?=
 =?utf-8?B?U0NqWU9BaHRQR0ZLZG1YYkFmS3ROQ20ycC9uTTdYYjVFT2JjcFNKQTZvTHlm?=
 =?utf-8?B?ZWhYeHlFZnI0dmJBT0NjTlN0N3J0anFpczliZlVjeUx0ZkRyb1ZicnlNT1dT?=
 =?utf-8?B?WFNtNU1SSjJsM0I4czZHWUZPN0hlQXhuU0NUYWxnbHpDTmZOUDZwWmJPbWxs?=
 =?utf-8?B?RStTdVV2Zy9GbkZwU1VaNlQ5cm5FQ0hUSnhJZCtMWkJQamdVZi9TNmtOaHJT?=
 =?utf-8?B?YWVNcENXSkFEaXJZYUJFQ1RIV1J3RWptNkkydksrSlZxcGVRUjJPR2MrUEFV?=
 =?utf-8?B?SHIvR1lpTXBPamM5VVNKT1RVWW1rSUdBeTNmamFmTFhDZ2RUaHBkVnJTd0tv?=
 =?utf-8?B?R2VwMDZKMlc3V0ZuZTd5Z2dvT3VQeU1Bc3JOU2NXMVNvLzZCNXZLTXlFN2ZL?=
 =?utf-8?B?M0lRcGRzT3VMUXVLOXBkR1RmbTIrMzIrbU5zSjMzRlhqc1VXcVgrTHNxeXFp?=
 =?utf-8?B?M3k1SnVVTUIzQUZ1Z21aVEJWa3Jvb1RIUlEzeERoY0VXRHpydnFJRkl0c0tJ?=
 =?utf-8?B?NDdjSnJyeklEQVZVT3o2TlB6OHBiVXJrV2V4U2pQelNKZ2xaTmtobGt5YkNi?=
 =?utf-8?B?MGFUOExKUm04YjJzeHNYaFNSY2Jjb3oyekxEdHdoNERLbzRXZVU5YU9VT0Jm?=
 =?utf-8?B?TlMxN3pBajd3cTFBVTNpc2puT3FYYmlwNFd6Sm1YbGs3bzFKY0FyRmQyYmVU?=
 =?utf-8?B?MER1SmlHcW5HelhIcmtJNXo5M0wvUStRYU1xOEU1cHBMSWRGdWdFY1pBOEZy?=
 =?utf-8?B?WURDa0VEeU1hS3ZNRHNMTzJVWWo3RERDbEJFNHczc1lzQ25TYmlMaElJNHQx?=
 =?utf-8?B?b2UvbjMwNWxyQXZmU2RwNDRtbDF1c3VBMVZoVlBTb004a1dPN1RlYXY0VEE3?=
 =?utf-8?B?K010eXFOYWQzWnQ0UU5BZzlzelczOU1xT2dLZTc3NUw5bE9kV3ZzSEpodWZZ?=
 =?utf-8?B?WU03VWNJY29sU05DT1kvNW1LeWtUSSs4ZUNBRlNDbVltR0NtSFhXc0duMFdF?=
 =?utf-8?B?Vk0rVlZSWkdtYUZJUW5DbzNoMTFTZEtDUXBVSm93VmFmQWxkZEZFOWNKQmdS?=
 =?utf-8?B?VTF5ellwZ3pBbGZUb1pBMGpiaWlzMVN2bGFvc2VIUmQ4YXNYLzc4QWJONk1S?=
 =?utf-8?B?WUJnMzFKVnJlTDZNemRhdlM3Z0VjMkhVRlpiWjJKYThHZ1VDVFlDcWtJVHNU?=
 =?utf-8?B?eDR2YndmNC9EMzZqZ3VwdEd3d0laczZMTGc0eklvc0pybFk0T0VGcVczUTcv?=
 =?utf-8?B?QStwVmdNUi8wM1ZpTmM2azZtbHhlSXZiZ0RwWVVwZHduTDFQTEl3ZlV5TUFQ?=
 =?utf-8?B?NVhONU5heW9yUG1kcERCM3Q3S3pDa0tyUHZBcThHWC9MTE5CWUZXZ3h0UG5P?=
 =?utf-8?B?NUdTbVRTeGwwZCs5dE5rMGhMS2dZbmNoMWFNR25Od3RNKzhlRDU1T0V0KzdQ?=
 =?utf-8?B?KytkbWNwMk41cHFzWFpxOW9ZSHVVamRPaVZaSlJLeU11TmxVbU12ckdReldz?=
 =?utf-8?B?Umw0bm54Y1BTWkVkc04rbmlvQlRqZy92SEVpb2VMN2NnNUJ5SHlFWEUrcTVN?=
 =?utf-8?B?aGxLMG4zSmFiYWFFY1hFZUhidjYvdlJLSW5paTQxZjJjZzMxeGRsRi8zZ25p?=
 =?utf-8?B?R0xXZDZuenB4SGZGOGZXcFpTbzZBVVYyeDl4WWNsYjZmZ1RIT2s0N0ZDcEta?=
 =?utf-8?B?aXBZUFgwZjZvRmFZRkptMm8rMDFCY1hLOG9EdUFWUWNCRXBGWmIzRGdXbXY3?=
 =?utf-8?B?aUY3U1diTytXczJoTE5sS1ovNU00SFE4UVAvTUZWUllIcEVRRTRDdzFFR2Qz?=
 =?utf-8?B?MGwwckNyaDZ2WnoxKzFxb1JYcWpEYVNqVnhtNCtuTDVaSG1uUnh5eFlKSER3?=
 =?utf-8?B?bUo0MWxRUElpTDloNVE2ZVd5a1lFckxCSWF5aDQ3eGdQdkdFU1Fsb09Bckp4?=
 =?utf-8?B?ODhPSWRhTXh5QnEyZmlxejZzWmZVQ2hOelRBS3dtYTZRTk83OTFvQVAyWnda?=
 =?utf-8?B?SVFvNmU0YURPUzJJUDdzVzhpcStqU2dQTFdrUTF2bGxkN3R4YmxhMWM1eHoz?=
 =?utf-8?B?TzM2bXRhdFNwRGhIK3lwNzlZM2Z4OExGajc4NWY3dmdaQkdHNitsQ1Mwb1Rw?=
 =?utf-8?B?Nmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c09f51c6-b8df-4307-6806-08dd04e50575
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2024 19:46:24.3625 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rNOaODoHrIYb4LemCrnt8rYClg2MXAxYOavWX+BQQJ5jiIMWXLt5ITjx3LHCLuPjx7z8Jb10XK9WNsWoSMSqbDPnpJSImPiiOxXyv1h8M1M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7824
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

On 11/6/2024 16:33, Daniele Ceraolo Spurio wrote:
> On 10/7/24 17:34, John Harrison wrote:
>> On 8/16/2024 12:00, Daniele Ceraolo Spurio wrote:
>>> When something happen to the session, the HW generates a termination
>>> interrupt. In reply to this, the driver is required to submit an inline
>>> session termination via the VCS, trigger the global termination and
>>> notify the GSC FW that the session is now invalid.
>>>
>>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/regs/xe_gt_regs.h  |   8 ++
>>>   drivers/gpu/drm/xe/regs/xe_pxp_regs.h |   6 ++
>>>   drivers/gpu/drm/xe/xe_irq.c           |  20 +++-
>>>   drivers/gpu/drm/xe/xe_pxp.c           | 138 
>>> +++++++++++++++++++++++++-
>>>   drivers/gpu/drm/xe/xe_pxp.h           |   3 +
>>>   drivers/gpu/drm/xe/xe_pxp_types.h     |  13 +++
>>>   6 files changed, 184 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h 
>>> b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>> index 0d1a4a9f4e11..9e9c20f1f1f4 100644
>>> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>> @@ -570,6 +570,7 @@
>>>   #define   ENGINE1_MASK                REG_GENMASK(31, 16)
>>>   #define   ENGINE0_MASK                REG_GENMASK(15, 0)
>>>   #define GPM_WGBOXPERF_INTR_ENABLE        XE_REG(0x19003c, 
>>> XE_REG_OPTION_VF)
>>> +#define CRYPTO_RSVD_INTR_ENABLE            XE_REG(0x190040)
>>>   #define GUNIT_GSC_INTR_ENABLE            XE_REG(0x190044, 
>>> XE_REG_OPTION_VF)
>>>   #define CCS_RSVD_INTR_ENABLE            XE_REG(0x190048, 
>>> XE_REG_OPTION_VF)
>>>   @@ -580,6 +581,7 @@
>>>   #define   INTR_ENGINE_INTR(x) REG_FIELD_GET(GENMASK(15, 0), x)
>>>   #define   OTHER_GUC_INSTANCE            0
>>>   #define   OTHER_GSC_HECI2_INSTANCE        3
>>> +#define   OTHER_KCR_INSTANCE            4
>>>   #define   OTHER_GSC_INSTANCE            6
>>>     #define IIR_REG_SELECTOR(x)            XE_REG(0x190070 + ((x) * 
>>> 4), XE_REG_OPTION_VF)
>>> @@ -591,6 +593,7 @@
>>>   #define HECI2_RSVD_INTR_MASK            XE_REG(0x1900e4)
>>>   #define GUC_SG_INTR_MASK            XE_REG(0x1900e8, 
>>> XE_REG_OPTION_VF)
>>>   #define GPM_WGBOXPERF_INTR_MASK            XE_REG(0x1900ec, 
>>> XE_REG_OPTION_VF)
>>> +#define CRYPTO_RSVD_INTR_MASK            XE_REG(0x1900f0)
>>>   #define GUNIT_GSC_INTR_MASK            XE_REG(0x1900f4, 
>>> XE_REG_OPTION_VF)
>>>   #define CCS0_CCS1_INTR_MASK            XE_REG(0x190100)
>>>   #define CCS2_CCS3_INTR_MASK            XE_REG(0x190104)
>>> @@ -605,4 +608,9 @@
>>>   #define   GT_CS_MASTER_ERROR_INTERRUPT        REG_BIT(3)
>>>   #define   GT_RENDER_USER_INTERRUPT        REG_BIT(0)
>>>   +/* irqs for OTHER_KCR_INSTANCE */
>>> +#define   KCR_PXP_STATE_TERMINATED_INTERRUPT REG_BIT(1)
>>> +#define   KCR_APP_TERMINATED_PER_FW_REQ_INTERRUPT REG_BIT(2)
>>> +#define   KCR_PXP_STATE_RESET_COMPLETE_INTERRUPT REG_BIT(3)
>>> +
>>>   #endif
>>> diff --git a/drivers/gpu/drm/xe/regs/xe_pxp_regs.h 
>>> b/drivers/gpu/drm/xe/regs/xe_pxp_regs.h
>>> index d67cf210d23d..aa158938b42e 100644
>>> --- a/drivers/gpu/drm/xe/regs/xe_pxp_regs.h
>>> +++ b/drivers/gpu/drm/xe/regs/xe_pxp_regs.h
>>> @@ -14,4 +14,10 @@
>>>   #define KCR_INIT                XE_REG(0x3860f0)
>>>   #define   KCR_INIT_ALLOW_DISPLAY_ME_WRITES    REG_BIT(14)
>>>   +/* KCR hwdrm session in play status 0-31 */
>>> +#define KCR_SIP                    XE_REG(0x386260)
>>> +
>>> +/* PXP global terminate register for session termination */
>>> +#define KCR_GLOBAL_TERMINATE            XE_REG(0x3860f8)
>>> +
>>>   #endif /* __XE_PXP_REGS_H__ */
>>> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
>>> index 5f2c368c35ad..f11d9a740627 100644
>>> --- a/drivers/gpu/drm/xe/xe_irq.c
>>> +++ b/drivers/gpu/drm/xe/xe_irq.c
>>> @@ -20,6 +20,7 @@
>>>   #include "xe_hw_engine.h"
>>>   #include "xe_memirq.h"
>>>   #include "xe_mmio.h"
>>> +#include "xe_pxp.h"
>>>   #include "xe_sriov.h"
>>>     /*
>>> @@ -202,6 +203,15 @@ void xe_irq_enable_hwe(struct xe_gt *gt)
>>>           }
>>>           if (heci_mask)
>>>               xe_mmio_write32(gt, HECI2_RSVD_INTR_MASK, ~(heci_mask 
>>> << 16));
>>> +
>>> +        if (xe_pxp_is_supported(xe)) {
>>> +            u32 kcr_mask = KCR_PXP_STATE_TERMINATED_INTERRUPT |
>>> + KCR_APP_TERMINATED_PER_FW_REQ_INTERRUPT |
>>> + KCR_PXP_STATE_RESET_COMPLETE_INTERRUPT;
>>> +
>>> +            xe_mmio_write32(gt, CRYPTO_RSVD_INTR_ENABLE, kcr_mask 
>>> << 16);
>>> +            xe_mmio_write32(gt, CRYPTO_RSVD_INTR_MASK, ~(kcr_mask 
>>> << 16));
>>> +        }
>>>       }
>>>   }
>>>   @@ -324,9 +334,15 @@ static void gt_irq_handler(struct xe_tile *tile,
>>>               }
>>>                 if (class == XE_ENGINE_CLASS_OTHER) {
>>> -                /* HECI GSCFI interrupts come from outside of GT */
>>> +                /*
>>> +                 * HECI GSCFI interrupts come from outside of GT.
>>> +                 * KCR irqs come from inside GT but are handled
>>> +                 * by the global PXP subsystem.
>>> +                 */
>>>                   if (HAS_HECI_GSCFI(xe) && instance == 
>>> OTHER_GSC_INSTANCE)
>>>                       xe_heci_gsc_irq_handler(xe, intr_vec);
>>> +                else if (instance == OTHER_KCR_INSTANCE)
>>> +                    xe_pxp_irq_handler(xe, intr_vec);
>>>                   else
>>>                       gt_other_irq_handler(engine_gt, instance, 
>>> intr_vec);
>>>               }
>>> @@ -512,6 +528,8 @@ static void gt_irq_reset(struct xe_tile *tile)
>>>           xe_mmio_write32(mmio, GUNIT_GSC_INTR_ENABLE, 0);
>>>           xe_mmio_write32(mmio, GUNIT_GSC_INTR_MASK, ~0);
>>>           xe_mmio_write32(mmio, HECI2_RSVD_INTR_MASK, ~0);
>>> +        xe_mmio_write32(mmio, CRYPTO_RSVD_INTR_ENABLE, 0);
>>> +        xe_mmio_write32(mmio, CRYPTO_RSVD_INTR_MASK, ~0);
>>>       }
>>>         xe_mmio_write32(mmio, GPM_WGBOXPERF_INTR_ENABLE, 0);
>>> diff --git a/drivers/gpu/drm/xe/xe_pxp.c b/drivers/gpu/drm/xe/xe_pxp.c
>>> index 56bb7d927c07..382eb0cb0018 100644
>>> --- a/drivers/gpu/drm/xe/xe_pxp.c
>>> +++ b/drivers/gpu/drm/xe/xe_pxp.c
>>> @@ -12,9 +12,11 @@
>>>   #include "xe_gt.h"
>>>   #include "xe_gt_types.h"
>>>   #include "xe_mmio.h"
>>> +#include "xe_pm.h"
>>>   #include "xe_pxp_submit.h"
>>>   #include "xe_pxp_types.h"
>>>   #include "xe_uc_fw.h"
>>> +#include "regs/xe_gt_regs.h"
>>>   #include "regs/xe_pxp_regs.h"
>>>     /**
>>> @@ -25,11 +27,133 @@
>>>    * integrated parts.
>>>    */
>>>   -static bool pxp_is_supported(const struct xe_device *xe)
>>> +#define ARB_SESSION 0xF /* TODO: move to UAPI */
>>> +
>>> +bool xe_pxp_is_supported(const struct xe_device *xe)
>>>   {
>>>       return xe->info.has_pxp && 
>>> IS_ENABLED(CONFIG_INTEL_MEI_GSC_PROXY);
>>>   }
>>>   +static bool pxp_is_enabled(const struct xe_pxp *pxp)
>>> +{
>>> +    return pxp;
>>> +}
>>> +
>>> +static int pxp_wait_for_session_state(struct xe_pxp *pxp, u32 id, 
>>> bool in_play)
>>> +{
>>> +    struct xe_gt *gt = pxp->gt;
>>> +    u32 mask = BIT(id);
>>> +    int ret;
>>> +
>>> +    ret = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>>> +    if (ret)
>>> +        return ret;
>>> +
>>> +    ret = xe_mmio_wait32(gt, KCR_SIP, mask, in_play ? mask : 0,
>>> +                 250, NULL, false);
>>> +    xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>>> +
>>> +    return ret;
>>> +}
>>> +
>>> +static void pxp_terminate(struct xe_pxp *pxp)
>>> +{
>>> +    int ret = 0;
>>> +    struct xe_device *xe = pxp->xe;
>>> +    struct xe_gt *gt = pxp->gt;
>>> +
>>> +    drm_dbg(&xe->drm, "Terminating PXP\n");
>>> +
>>> +    /* terminate the hw session */
>>> +    ret = xe_pxp_submit_session_termination(pxp, ARB_SESSION);
>>> +    if (ret)
>>> +        goto out;
>>> +
>>> +    ret = pxp_wait_for_session_state(pxp, ARB_SESSION, false);
>>> +    if (ret)
>>> +        goto out;
>>> +
>>> +    /* Trigger full HW cleanup */
>>> +    XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
>> Why WARN here but no explicit message at all if the earlier force 
>> wake fails? And is it safe to keep going if the fw did fail?
>
> The idea was that if we know that the state is good enough to 
> terminate we could try to do it even with a forcewake error, worst 
> case it doesn't work. If we don't know the state we can't attempt a 
> termination at all.
>
That needs a comment to describe the reasoning for the different behaviour.

Also, note that xe_force_wake_get() doesn't work the same any more. See 
"drm/xe/gt: Update handling of xe_force_wake_get return". It now returns 
a domain reference that must be passed back in to the put call.

John.

>
>>
>> Also, given two identical, back-to-back fw get/put sets, would it not 
>> be more efficient to have pxp_terminate do the get and share that 
>> across the two register access? It would also remove the issue with 
>> failed fw half way through causing problems due to not wanting to abort.
>
> will do.
>
>
>>
>>> +    xe_mmio_write32(gt, KCR_GLOBAL_TERMINATE, 1);
>> BSpec description for KCR_GLOBAL_TERMINATE says need to check 
>> KCR_SIP_GCD rather than KCR_SIP_MEDIA for bits 0-15 being 0. Whereas 
>> the KCR_SIP being checked above is KCR_SIP_MEDIA only.
>
> That's just the spec not being super clear. The description is common 
> between the render and the media copies of the registers, but you need 
> to check the version of the registers on the actual GT you're doing 
> the termination on.
>
>
>>
>>> +    xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>>> +
>>> +    /* now we can tell the GSC to clean up its own state */
>>> +    ret = xe_pxp_submit_session_invalidation(&pxp->gsc_res, 
>>> ARB_SESSION);
>>> +
>>> +out:
>>> +    if (ret)
>>> +        drm_err(&xe->drm, "PXP termination failed: %pe\n", 
>>> ERR_PTR(ret));
>>> +}
>>> +
>>> +static void pxp_terminate_complete(struct xe_pxp *pxp)
>>> +{
>>> +    /* TODO mark the session as ready to start */
>>> +}
>>> +
>>> +static void pxp_irq_work(struct work_struct *work)
>>> +{
>>> +    struct xe_pxp *pxp = container_of(work, typeof(*pxp), irq.work);
>>> +    struct xe_device *xe = pxp->xe;
>>> +    u32 events = 0;
>>> +
>>> +    spin_lock_irq(&xe->irq.lock);
>>> +    events = pxp->irq.events;
>>> +    pxp->irq.events = 0;
>>> +    spin_unlock_irq(&xe->irq.lock);
>>> +
>>> +    if (!events)
>>> +        return;
>>> +
>>> +    /*
>>> +     * If we're processing a termination irq while suspending then 
>>> don't
>>> +     * bother, we're going to re-init everything on resume anyway.
>>> +     */
>>> +    if ((events & PXP_TERMINATION_REQUEST) && 
>>> !xe_pm_runtime_get_if_active(xe))
>>> +        return;
>> I assume it is not possible to have both REQUEST and COMPLETE set at 
>> the same time? I.e. is it possible for this early exit to cause a 
>> lost termination complete call?
>
> A complete is only received in response to the submission of a 
> termination request, so they should never be set at the same time. 
> Doesn't really matter anyway since we submit a termination on resume 
> anyway.
>
> Daniele
>
>
>>
>> John.
>>
>>> +
>>> +    if (events & PXP_TERMINATION_REQUEST) {
>>> +        events &= ~PXP_TERMINATION_COMPLETE;
>>> +        pxp_terminate(pxp);
>>> +    }
>>> +
>>> +    if (events & PXP_TERMINATION_COMPLETE)
>>> +        pxp_terminate_complete(pxp);
>>> +
>>> +    if (events & PXP_TERMINATION_REQUEST)
>>> +        xe_pm_runtime_put(xe);
>>> +}
>>> +
>>> +/**
>>> + * xe_pxp_irq_handler - Handles PXP interrupts.
>>> + * @pxp: pointer to pxp struct
>>> + * @iir: interrupt vector
>>> + */
>>> +void xe_pxp_irq_handler(struct xe_device *xe, u16 iir)
>>> +{
>>> +    struct xe_pxp *pxp = xe->pxp;
>>> +
>>> +    if (!pxp_is_enabled(pxp)) {
>>> +        drm_err(&xe->drm, "PXP irq 0x%x received with PXP 
>>> disabled!\n", iir);
>>> +        return;
>>> +    }
>>> +
>>> +    lockdep_assert_held(&xe->irq.lock);
>>> +
>>> +    if (unlikely(!iir))
>>> +        return;
>>> +
>>> +    if (iir & (KCR_PXP_STATE_TERMINATED_INTERRUPT |
>>> +           KCR_APP_TERMINATED_PER_FW_REQ_INTERRUPT))
>>> +        pxp->irq.events |= PXP_TERMINATION_REQUEST;
>>> +
>>> +    if (iir & KCR_PXP_STATE_RESET_COMPLETE_INTERRUPT)
>>> +        pxp->irq.events |= PXP_TERMINATION_COMPLETE;
>>> +
>>> +    if (pxp->irq.events)
>>> +        queue_work(pxp->irq.wq, &pxp->irq.work);
>>> +}
>>> +
>>>   static int kcr_pxp_set_status(const struct xe_pxp *pxp, bool enable)
>>>   {
>>>       u32 val = enable ? 
>>> _MASKED_BIT_ENABLE(KCR_INIT_ALLOW_DISPLAY_ME_WRITES) :
>>> @@ -60,6 +184,7 @@ static void pxp_fini(void *arg)
>>>   {
>>>       struct xe_pxp *pxp = arg;
>>>   +    destroy_workqueue(pxp->irq.wq);
>>>       xe_pxp_destroy_execution_resources(pxp);
>>>         /* no need to explicitly disable KCR since we're going to do 
>>> an FLR */
>>> @@ -83,7 +208,7 @@ int xe_pxp_init(struct xe_device *xe)
>>>       struct xe_pxp *pxp;
>>>       int err;
>>>   -    if (!pxp_is_supported(xe))
>>> +    if (!xe_pxp_is_supported(xe))
>>>           return -EOPNOTSUPP;
>>>         /* we only support PXP on single tile devices with a media 
>>> GT */
>>> @@ -105,12 +230,17 @@ int xe_pxp_init(struct xe_device *xe)
>>>       if (!pxp)
>>>           return -ENOMEM;
>>>   +    INIT_WORK(&pxp->irq.work, pxp_irq_work);
>>>       pxp->xe = xe;
>>>       pxp->gt = gt;
>>>   +    pxp->irq.wq = alloc_ordered_workqueue("pxp-wq", 0);
>>> +    if (!pxp->irq.wq)
>>> +        return -ENOMEM;
>>> +
>>>       err = kcr_pxp_enable(pxp);
>>>       if (err)
>>> -        return err;
>>> +        goto out_wq;
>>>         err = xe_pxp_allocate_execution_resources(pxp);
>>>       if (err)
>>> @@ -122,5 +252,7 @@ int xe_pxp_init(struct xe_device *xe)
>>>     kcr_disable:
>>>       kcr_pxp_disable(pxp);
>>> +out_wq:
>>> +    destroy_workqueue(pxp->irq.wq);
>>>       return err;
>>>   }
>>> diff --git a/drivers/gpu/drm/xe/xe_pxp.h b/drivers/gpu/drm/xe/xe_pxp.h
>>> index 79c951667f13..81bafe2714ff 100644
>>> --- a/drivers/gpu/drm/xe/xe_pxp.h
>>> +++ b/drivers/gpu/drm/xe/xe_pxp.h
>>> @@ -10,6 +10,9 @@
>>>     struct xe_device;
>>>   +bool xe_pxp_is_supported(const struct xe_device *xe);
>>> +
>>>   int xe_pxp_init(struct xe_device *xe);
>>> +void xe_pxp_irq_handler(struct xe_device *xe, u16 iir);
>>>     #endif /* __XE_PXP_H__ */
>>> diff --git a/drivers/gpu/drm/xe/xe_pxp_types.h 
>>> b/drivers/gpu/drm/xe/xe_pxp_types.h
>>> index 3463caaad101..d5cf8faed7be 100644
>>> --- a/drivers/gpu/drm/xe/xe_pxp_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_pxp_types.h
>>> @@ -8,6 +8,7 @@
>>>     #include <linux/iosys-map.h>
>>>   #include <linux/types.h>
>>> +#include <linux/workqueue.h>
>>>     struct xe_bo;
>>>   struct xe_exec_queue;
>>> @@ -69,6 +70,18 @@ struct xe_pxp {
>>>         /** @gsc_exec: kernel-owned objects for PXP submissions to 
>>> the GSCCS */
>>>       struct xe_pxp_gsc_client_resources gsc_res;
>>> +
>>> +    /** @irq: wrapper for the worker and queue used for PXP irq 
>>> support */
>>> +    struct {
>>> +        /** @irq.work: worker that manages irq events. */
>>> +        struct work_struct work;
>>> +        /** @irq.wq: workqueue on which to queue the irq work. */
>>> +        struct workqueue_struct *wq;
>>> +        /** @irq.events: pending events, protected with 
>>> xe->irq.lock. */
>>> +        u32 events;
>>> +#define PXP_TERMINATION_REQUEST  BIT(0)
>>> +#define PXP_TERMINATION_COMPLETE BIT(1)
>>> +    } irq;
>>>   };
>>>     #endif /* __XE_PXP_TYPES_H__ */
>>

