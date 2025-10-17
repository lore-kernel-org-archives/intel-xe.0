Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F2ECCCD199
	for <intel-xe@archiver.kernel.org>; Fri, 17 Oct 2025 17:34:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 323AD10ECB6;
	Fri, 17 Oct 2025 17:34:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T6D/Gwws";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85F5B10ECB7
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Oct 2025 17:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760722481; x=1792258481;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=tR1Nq+JjCF1puTIFo098+jdSZy5oTTpcun3RweULRqI=;
 b=T6D/GwwsT8l2cQmSQ1axJCBXBDL0YghjMAG46Ecu3Bv9TWfJQVdaoS3S
 +3XwvAWmukj/H8entL2nqxXmBwpO3roiL+suwWSWYPajaDTIgvdx/Nry9
 ye3741UJP1b5zJMBP/N977gPunbCSHo8jMuw/ekZa800HQjnznGB8uaW6
 +e38o3ltUiTeR3CLn+gBJMjpAPWlxZeeTVhOdOR3kwibipdF2V43uY+NF
 OL5T2EEdK6IPXtVEaGQ5Id/EuR1mzka/Cm28YZtglB/kdQ+5cgnBVL9pj
 8Rksy+mo19tkeOh1n4w3TwDCQTFvvZOGIAwgaJLuXhT/O5aDjiE3kAPrK g==;
X-CSE-ConnectionGUID: BdTeyalhTayC0YahBqGLKA==
X-CSE-MsgGUID: LFvk2dGoQluqBLHPFLDR+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11585"; a="66584239"
X-IronPort-AV: E=Sophos;i="6.19,237,1754982000"; d="scan'208";a="66584239"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2025 10:34:37 -0700
X-CSE-ConnectionGUID: X0swD49PTsqJ81C9DlrW+g==
X-CSE-MsgGUID: M186Ev+yQGCu0/FO1xdWWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,237,1754982000"; d="scan'208";a="187882588"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2025 10:34:36 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 17 Oct 2025 10:34:35 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 17 Oct 2025 10:34:35 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.52) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 17 Oct 2025 10:34:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ecMHPChtafXhmC52AqVDG6nPu/U3ygu6CSK/aU8e0RL3toU/CO8bcWUjO0taDQzUrA3jmtJX3XtDhbr0HjI5N6nU3D9VzhZsHx49JstzBuSo5b47YBk3yYHG0ac2EjmIJp+zaA5iRo5WxXtOk8++HHUYtrX9dUPF/2rd4R9R9ejSgXMeTKnvb2OEe+FADzbVVFVcZy3BuF6pAjt7anBpN5NkfPUYTqGpQzzZLx/W5PQZvHkIi9uxXaFMeu4cGRMunBeeA/06clGi6ItZelXRscC6QwqNqDtmXHWoikVHLpih1sgayHoS+7pbCq+ZJPYxo69r2UGPjlnvfoydY9vWhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hJ94xldMPIdcC+N6wSbQyoIgYLdsvYXflkOVfrpFgKo=;
 b=qLTtLRNj2hfMcJuGYKjkfhgZlaMeBgZeZs/FgbaoM8mLdDB+9KtysA3xocn2qRQsZqb8cHWWOgcATYvE1yek7xGSA6oVLn5qZcEj7BQNi2KSYZ6+nM2LV/XKTpw71Sy6cjhmjHUfwDqkhFsRu8RdnQwU+TDAyrvYUXkohzzroYELXYMlGSpMdHz4weod73Su0oyA7kcbj6RdlCD9ja3meCfzrcqaTjgGQyyzI3D4S3lty5cwz8TSVk7XL7U7WZOCt9vK2FibT8S6Lah7LGHbEuYnB7Nd+VkmwlZtJSpfu0FZFyJjJq5ZCNYTA8NXSUN/scaxGzUNvEEiVtX/j5ye6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB5819.namprd11.prod.outlook.com (2603:10b6:510:13b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.13; Fri, 17 Oct
 2025 17:34:33 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9228.009; Fri, 17 Oct 2025
 17:34:33 +0000
Date: Fri, 17 Oct 2025 10:34:30 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Nitin Gote <nitin.r.gote@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <stuart.summers@intel.com>
Subject: Re: [PATCH] drm/xe: share USM BCS engine via root-tile helper
Message-ID: <aPJ+JszqVdAOSvtf@lstrano-desk.jf.intel.com>
References: <20251017122253.149187-1-nitin.r.gote@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251017122253.149187-1-nitin.r.gote@intel.com>
X-ClientProxiedBy: MW4PR04CA0150.namprd04.prod.outlook.com
 (2603:10b6:303:84::35) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB5819:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a78be10-dbeb-4172-db7c-08de0da36f68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ejcyQktoSDMvUmFCK3dQV0xKSkorRGxDRGZSQmlvVjh3bUtpZmNkOGNXaDRu?=
 =?utf-8?B?WW1JNmM5UTQyNkwyN3c2amRQelcvbzZ3d0NKUzVGTkRnMWV4THRhV2RJOUZv?=
 =?utf-8?B?REtKVjdwQjM2SzZ5djRxZUxwRDVBTVh4ODg5cHlGeU9vTjFKRktKSmNSR0VQ?=
 =?utf-8?B?ZFkyY21RbCt4cUF4UTQwNGlmUEdMSHRqMEZCVCtMbHZoQnNQU2lianluU3JJ?=
 =?utf-8?B?NjhZT01vb3JNOHV4M0RXRFAwL1JYQXlpL0ZMMTE0SXdkRCsyTFRsS0N4Z1A2?=
 =?utf-8?B?cWhyQmVYYlNhMWF3djcrbUpJTVhtMFBpbVVpTkFVVUU1bjYrR3N4anJMVWFl?=
 =?utf-8?B?d2NBUXdRRVBXa1BVenMwNlBJUzBGYkY3UjlrNWhkTjVIYXczbENzejZiMUpk?=
 =?utf-8?B?WU00RGpjeEFzd0tTNnptRU8yTzRscVo0UUcvSUtnWEp3NDgrRFVsQ201Z1hv?=
 =?utf-8?B?eHRpR09DS0xaK0NoL3ZSVXZLMHBXMGsxSlNDTlFtd1pURmRaMm41UjNja0tB?=
 =?utf-8?B?WDlpTDdZTFJVZnlmNUNSRDkybzBpNURSZ2ZyVGVmeWNwb210YktIR3NlZHdD?=
 =?utf-8?B?TTBSOU5ITDhTN3RwdGdPU0ZCcHdxSGxnNWU2OE1aWTRRTmlxcDBCaHIxSFhz?=
 =?utf-8?B?cGRXRmlRdkVINHl1Q1VqUjhNVDBpbndBbGJHL2ZLaGlWMVZJM1hHbkk0QTVM?=
 =?utf-8?B?Tlh3VHRVK1JHSDh4MEVtLy9jVHNuRTk2QUJzMmRKZ1JqdUoyNmo2bTQveHFM?=
 =?utf-8?B?RHlVK1JycDFNTGh5ZTY3dmNveXV6UnpFdFVwbnlvWlVzWmtIbTdyK0VUUUsr?=
 =?utf-8?B?K2RKUkdCZFEwRzYzSzJnbE1xZXFCNVQ4TUQ2VkpSUmJLZ2Z4SjNaZTFBRFB3?=
 =?utf-8?B?UzE0UVQ4aVZ0QlVYdXRqWXdIVzAyRFd4anVTNnVSV0hLUEl4TXVIZ2ZsMEtr?=
 =?utf-8?B?OFFrMGQ2SXNSd013Tzc2Wm04K28xNm1XWGhJNkRDam41eTJUT0JGQ2prS2RL?=
 =?utf-8?B?cm5WcDZ6bXltZldpRDZ0a214YVVpeGx4ZFRsTnM3UzNlMTB2V3VOOW93bW95?=
 =?utf-8?B?Skgza1NZUTBpWHgzVEpLMDN0Ym9WNXViYjQ3TmNsS25uN0tNRmhQS09pdmVX?=
 =?utf-8?B?VlVFZGM2Sm5CZVY0Y2NEYTZybGlXTFQ5VkFIbG1oajRnQ0lqNWFJaVJIMS9D?=
 =?utf-8?B?UzBFcFFieDRqNGNubFpOeXlSRUg0cFU0cXlBUG15RU9rQ1o1NFFCS016MDk3?=
 =?utf-8?B?UWVDVWxUKzY2NG5UQkZPNzZ4eitFeDlXWElleFRGbUtKRE1TRVVRMXNXZlRz?=
 =?utf-8?B?UzJHUlNoR2pDR0JYdkxlQUIrVm1DZnVUSCtGbmNSRU15dXlKcFFiMklkVjF2?=
 =?utf-8?B?Q2hVZmYrQnFpcEp3TXVoV1VrdjE1d1JrOGZWOFBVdUU3VGVjcFNISDVxSWRC?=
 =?utf-8?B?QkE3Z1dmbTY1OHlzb09veTNsUUZsMEU5WC9pTUdaZndqYmZOeDhuSGhTYmVp?=
 =?utf-8?B?ZFpkS2FHM240cllrS1d3R1Vkb1RUdDNCdStLLzRJck8waDdNcks5SEJBd1Iz?=
 =?utf-8?B?M3RlUktNcHRFeTF0d2I0d0pWRldkZzhmWjNYWkRBdjZaRDQxWGVQTGFlN1dU?=
 =?utf-8?B?ckVUN0V3bnowcnJxejFFQW9YSFBJNCtzZXVkcWlCZkk1ZE1HbVZqdHJOc0F2?=
 =?utf-8?B?NDlaWlVtcUNrOHcyOEtiZUpyQ0twV2hSSFQ2RkNLdzBPaURMYmJYbExWVTdw?=
 =?utf-8?B?cXNGWm5lSi9ZRCtHc3d4Qlk3QUlHODVDbEYxNGtzRXJFSU1keEVBN2xzUFU0?=
 =?utf-8?B?TlN3aEwwdmFydjZtVUZLZWp1c1NpU0ZiUkFxbFBvM2owOFpTdy96Q1RHSUU0?=
 =?utf-8?B?c2xiMnZva3grbzhFVmlHeVpIV2JValVNbjMzSG42VVBmOFE3RlZYRWdNbTBJ?=
 =?utf-8?Q?mkAQro1yJqY4BxsblEmaS84ZFel0tlXX?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MzZtR3pQTS9EditWRkZTL3VEU3JLcjNTR2pLcGJCZ2JGdHlZbVhsNFByc2Fu?=
 =?utf-8?B?M1BuZ2h2NTRUUmd6dytmdEk0NVFEcWNxQUh0d3h2OW82dTgza1JWRzRjVXZa?=
 =?utf-8?B?V3AwYmIwdW4wdXgzajA0L05hOUdGOFN1MG5vUlpYditPQkJMekpJUHBEeXAy?=
 =?utf-8?B?cWdBdVFmQS91ZStyY2kwdnozS0YvNEZpOTJjS1RQSkNBQWNITTMraitiQ3Rt?=
 =?utf-8?B?U1paSVJrMnVtV2pWMTV0YjUxeUVjbExoWWhXSm82eWpMK2F5OXlaaXNsMzdE?=
 =?utf-8?B?R3p5dnJVZzE1dm92RmxmcFdkakYwSGxaSTY2V1gvWmRZVkdKWlo4QzRsUUlJ?=
 =?utf-8?B?N2wvc0Jyc1FOd3F6YmVsY3J2cHpFNUh3Vk5LQlpnczlFUXlGRTIzUGtCRjRJ?=
 =?utf-8?B?dWZIRjZsN3F5S1JoMWZrNVl4S091MzlVVHlhbkJ4ak1IdDYyK2VsMHYyMk1B?=
 =?utf-8?B?aUdVTmM1TVg0alkyc2dlSGNnZHVCdFI1eHFSb2hMVUFibjlpUSt6QUxIUWZ1?=
 =?utf-8?B?UHR3ZDRLWk0zeFRKOXZEejJLdVh5dTdISGUxR1BuMlNTTStXdzZqNVFZNXox?=
 =?utf-8?B?UStEdWVjdm54U21wYnpXYitNWkFvUEZZZkhKM3Z1dm13SUU0dE5vdzdXMjJv?=
 =?utf-8?B?YWQxeGRYYUZxYUhIVHZpNjNzeHVsREtid0VHMHpSdDFhQmxFYUFoMWtQdmJn?=
 =?utf-8?B?WlRaL2lqWEozbkpVamkxakwxbFVjTGJMd3BwNzZkeHpKRFJpUXd6MVhHRDZz?=
 =?utf-8?B?ekpXZ1QzNitOdmVKZkQ4U2dOaWpFRnFuVUtJU1BlZDlFRlprSzZETTQ2dnp2?=
 =?utf-8?B?ajhRa1hZZlEvbU5hNEtQV1p3WmlKS3BEelk4WHFrWkRvUmxWZ2w3bWYvZ3Vj?=
 =?utf-8?B?aXIxMGYrVWZXY1NwSU83ZmRzSHJRdTFCS1Z0Wk1WM0FsUU1Dc3pkai9UVFJr?=
 =?utf-8?B?Z0s1MkV0SWhGbVBDbklzY016L1BNenFwRUpIU3p2ZVdEdi95VlMzeG1CMlVx?=
 =?utf-8?B?WnNhL0w3VzgzR0FqZTZpZTB3VERybTVkbHFaSUlGb2RwYVRjMW9scUFKeGdL?=
 =?utf-8?B?dWVqTURSUnY5U0V0TS9NbVpGRnlGMklWSUZpM2VqSklIYmEvWTltcXpjcDJi?=
 =?utf-8?B?Y2RPcXkzb1I2S1M3blZsMElaaklOaXJrSFpZQ29zemRMaXVGQUE2UXlyV2Zt?=
 =?utf-8?B?eWUvTjE3OE93eTNmK29CSVkxTUlsSjl1Q2Q1Y2E1MlA3TzEzQ2xKQmVZekdk?=
 =?utf-8?B?N2VHNkZzdGpIYkpuV2FzQ2g4andkNFFmYjhwMVRqeWJhQmNqT1pSdnpUZ0p6?=
 =?utf-8?B?TWJzRVBJeWNCR0xzSjYvV2w3ZXJ3QXdCY215Y0N1Sk1wWnhRY1BhdG5tQ3Zx?=
 =?utf-8?B?d3VCeVVEUWhHbnVHM21TbGU4dTY5UEZkc0ZxT0dLY2dnYSs1N1RHQXRsZXNI?=
 =?utf-8?B?NGtib2lFbkhTNStzSlExNUduYTNzL3k4SktjMFFKYUlrM2w1ZUVIUWp3eGdt?=
 =?utf-8?B?R0ZTYmlBNC8rcGc0eFNHN085Z1FRMVJML2h2S1BhYjIxekxoVXl0VTBYWkhi?=
 =?utf-8?B?ck1aRy9hdEFVNHRDQURuNlE3Sm94bTNaSlRYZ25lWTlneTFTR3VPV0Y5czNI?=
 =?utf-8?B?dm91TDdTWlhkY2w1ZmhIMHRHV0IyNCsxN2tqVVZrRG5vYkRadnhqN0RXRUU4?=
 =?utf-8?B?MVlEQnRINFJtbHQxWk9Hb251Ly8yclRxQkxZL3dJMzFHZkNLc2RmY2kvS3Zl?=
 =?utf-8?B?UXhBcm9aamtWYUdKSE11U1ZRM3BDQjFkZ2pwQi83RDdCZ3ZHSU1RL2FuM0gv?=
 =?utf-8?B?WUVUZDVsejNHTjZxS2syTEVyWWJBdG5iRXU2a0ZWS2k4amJxWWRidU5PZWov?=
 =?utf-8?B?TXRDRVMrdEc5YWxQQWdMeExXK3F0azNoclBsOFN3b2FIMjlldjJrS2tGNmtI?=
 =?utf-8?B?ZlAzRExlQkhLU0lSSmVRMys1ei9BVmR3Z3NWTmRUbkxUZy91WVNqWW5JR0h1?=
 =?utf-8?B?WDhldTlhb0lsanFyVkRRV0thQlA4d3l6b1RVUjdCZVhtWU1ZeUZmYXY3N3N6?=
 =?utf-8?B?Vy9STlVhYWlkS05Mbm5EaG02NTdIQzdFK3FrOHFQUDBRMml5MHM2Z0hQREhR?=
 =?utf-8?B?SXZVOG9QenhaQUYyUVY2bzV0NEJUL1c3Ti9TY3duQTNra0tPUEtMRStPZ3Fa?=
 =?utf-8?B?TGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a78be10-dbeb-4172-db7c-08de0da36f68
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 17:34:33.5020 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tz/0+CxcojGC9ocouK7Q01FcNnxIS7S1C8w4M1jphVG3Jx/ZSqrT/Egjwq2SS2MPMW7q2nYwtmosamDs2gk93w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5819
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

On Fri, Oct 17, 2025 at 05:52:53PM +0530, Nitin Gote wrote:
> Introduce optional root‑tile USM BCS engine sharing controlled
> by the device descriptor flag (info.use_root_usm_bcs) and a
> debug module parameter(force_use_root_usm_bcs). Each GT records
> its USM BCS instance and hw engine during hw_engine_init.
> 
> Add helper xe_usm_bcs_reserved_hwe() which, when sharing is
> enabled, returns the root tile’s USM BCS engine; otherwise
> it returns the local GT’s engine. Exec queue and migrate
> initialization now use this helper, avoiding failed
> instance lookups on tiles lacking lower-numbered BCS engines.
> 
> Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device_types.h |  2 ++
>  drivers/gpu/drm/xe/xe_exec_queue.c   | 12 ++++++++----
>  drivers/gpu/drm/xe/xe_gt.c           | 27 +++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt.h           |  1 +
>  drivers/gpu/drm/xe/xe_gt_types.h     |  2 ++
>  drivers/gpu/drm/xe/xe_hw_engine.c    |  7 +++++--
>  drivers/gpu/drm/xe/xe_migrate.c      | 13 +++++++++----
>  drivers/gpu/drm/xe/xe_module.c       |  4 ++++
>  drivers/gpu/drm/xe/xe_module.h       |  1 +
>  drivers/gpu/drm/xe/xe_pci.c          |  1 +
>  drivers/gpu/drm/xe/xe_pci_types.h    |  1 +
>  11 files changed, 61 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 02c04ad7296e..8f3ea6c637b3 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -336,6 +336,8 @@ struct xe_device {
>  		u8 skip_pcode:1;
>  		/** @info.needs_shared_vf_gt_wq: needs shared GT WQ on VF */
>  		u8 needs_shared_vf_gt_wq:1;
> +		/** @info.use_root_usm_bcs: share single USM BCS from root tile */
> +		u8 use_root_usm_bcs:1;
>  	} info;
>  
>  	/** @wa_active: keep track of active workarounds */
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 90cbc95f8e2e..06c5585b01fc 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -348,10 +348,14 @@ struct xe_exec_queue *xe_exec_queue_create_bind(struct xe_device *xe,
>  
>  	migrate_vm = xe_migrate_get_vm(tile->migrate);
>  	if (xe->info.has_usm) {
> -		struct xe_hw_engine *hwe = xe_gt_hw_engine(gt,
> -							   XE_ENGINE_CLASS_COPY,
> -							   gt->usm.reserved_bcs_instance,
> -							   false);
> +		struct xe_hw_engine *hwe = xe_usm_bcs_reserved_hwe(gt);

Can we just call single function here which figures out the HWE?

> +
> +		if (!hwe) {
> +			hwe = xe_gt_hw_engine(gt,
> +					      XE_ENGINE_CLASS_COPY,
> +					      gt->usm.reserved_bcs_instance,
> +					      false);
> +		}
>  
>  		if (!hwe) {
>  			xe_vm_put(migrate_vm);
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index d8e94fb8b9bd..b84a2c38c4aa 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -49,6 +49,7 @@
>  #include "xe_map.h"
>  #include "xe_migrate.h"
>  #include "xe_mmio.h"
> +#include "xe_module.h"
>  #include "xe_pat.h"
>  #include "xe_pm.h"
>  #include "xe_mocs.h"
> @@ -519,6 +520,32 @@ static int gt_init_with_gt_forcewake(struct xe_gt *gt)
>  	return err;
>  }
>  
> +/**
> + * xe_usm_bcs_reserved_hwe - select USM BCS engine for a GT
> + * @gt: GT whose USM BCS engine is requested
> + *
> + * If root-tile sharing (info.use_root_usm_bcs or force_use_root_usm_bcs)
> + * is enabled, returns the root tile's reserved USM BCS COPY engine pointer.
> + * Otherwise returns this GT's own reserved USM BCS engine.
> + *
> + * Returns:
> + * Pointer to xe_hw_engine or NULL if USM unsupported or engine not ready.
> + */
> +struct xe_hw_engine *xe_usm_bcs_reserved_hwe(struct xe_gt *gt)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +
> +	if (xe->info.use_root_usm_bcs ||
> +	    xe_modparam.force_use_root_usm_bcs) {

Don't check xe_modparam inline, rather on device probe override
xe->info.use_root_usm_bcs with the modparam.

> +		struct xe_tile *root = xe_device_get_root_tile(xe);
> +
> +		if (root && root->primary_gt && root->primary_gt->usm.reserved_bcs_hwe)
> +			return root->primary_gt->usm.reserved_bcs_hwe;
> +	}
> +
> +	return gt->usm.reserved_bcs_hwe;
> +}
> +
>  static int gt_init_with_all_forcewake(struct xe_gt *gt)
>  {
>  	unsigned int fw_ref;
> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> index 5df2ffe3ff83..2a896ef28fa0 100644
> --- a/drivers/gpu/drm/xe/xe_gt.h
> +++ b/drivers/gpu/drm/xe/xe_gt.h
> @@ -54,6 +54,7 @@ int xe_gt_resume(struct xe_gt *gt);
>  void xe_gt_reset_async(struct xe_gt *gt);
>  void xe_gt_sanitize(struct xe_gt *gt);
>  int xe_gt_sanitize_freq(struct xe_gt *gt);
> +struct xe_hw_engine *xe_usm_bcs_reserved_hwe(struct xe_gt *gt);
>  
>  /**
>   * xe_gt_wait_for_reset - wait for gt's async reset to finalize.
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index 8b5f604d7883..3aca91686e0c 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -212,6 +212,8 @@ struct xe_gt {
>  		 * operations (e.g. migrations, fixing page tables)
>  		 */
>  		u16 reserved_bcs_instance;
> +		/** @usm.reserved_bcs_hwe: reserved BCS hardware engine used for USM */
> +		struct xe_hw_engine *reserved_bcs_hwe;

I don't think you need this storage. On GTs which don't reserve BCS
instance reserved_bcs_instance would just be clear.

>  		/** @usm.pf_wq: page fault work queue, unbound, high priority */
>  		struct workqueue_struct *pf_wq;
>  		/** @usm.acc_wq: access counter work queue, unbound, high priority */
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index cba4375525c7..175407ae3ad8 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -35,6 +35,7 @@
>  #include "xe_lrc.h"
>  #include "xe_macros.h"
>  #include "xe_mmio.h"
> +#include "xe_module.h"
>  #include "xe_reg_sr.h"
>  #include "xe_reg_whitelist.h"
>  #include "xe_rtp.h"
> @@ -633,9 +634,11 @@ static int hw_engine_init(struct xe_gt *gt, struct xe_hw_engine *hwe,
>  			xe_hw_engine_enable_ring(hwe);
>  	}
>  
> -	/* We reserve the highest BCS instance for USM */
> -	if (xe->info.has_usm && hwe->class == XE_ENGINE_CLASS_COPY)
> +	/* Record BCS instance for USM; keep highest instance seen */
> +	if (xe->info.has_usm && hwe->class == XE_ENGINE_CLASS_COPY) {
>  		gt->usm.reserved_bcs_instance = hwe->instance;
> +		gt->usm.reserved_bcs_hwe = hwe;
> +	}
>  
>  	/* Ensure IDLEDLY is lower than MAXCNT */
>  	adjust_idledly(hwe);
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 3112c966c67d..e96fcfb13e24 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -450,10 +450,15 @@ int xe_migrate_init(struct xe_migrate *m)
>  		goto err_out;
>  
>  	if (xe->info.has_usm) {
> -		struct xe_hw_engine *hwe = xe_gt_hw_engine(primary_gt,
> -							   XE_ENGINE_CLASS_COPY,
> -							   primary_gt->usm.reserved_bcs_instance,
> -							   false);
> +		struct xe_hw_engine *hwe = xe_usm_bcs_reserved_hwe(primary_gt);
> +
> +		if (!hwe) {
> +			hwe = xe_gt_hw_engine(primary_gt,
> +					      XE_ENGINE_CLASS_COPY,
> +					      primary_gt->usm.reserved_bcs_instance,
> +					      false);
> +		}
> +

Here, we'd still create a xe_migrate instance per tile but each migrate
instance would point to the same HWE but be different queues. Different
queues means we will be context switching on the HWE and context
switches are quite expensive. I think what we want to do is if
use_root_usm_bcs is set, point all tiles the same xe_migrate instance.

Matt

>  		u32 logical_mask = xe_migrate_usm_logical_mask(primary_gt);
>  
>  		if (!hwe || !logical_mask) {
> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
> index d08338fc3bc1..9c3104c36897 100644
> --- a/drivers/gpu/drm/xe/xe_module.c
> +++ b/drivers/gpu/drm/xe/xe_module.c
> @@ -80,6 +80,10 @@ MODULE_PARM_DESC(force_probe,
>  		 "Force probe options for specified devices. See CONFIG_DRM_XE_FORCE_PROBE for details "
>  		 "[default=" DEFAULT_FORCE_PROBE "])");
>  
> +module_param_named(force_use_root_usm_bcs, xe_modparam.force_use_root_usm_bcs, bool, 0400);
> +MODULE_PARM_DESC(force_use_root_usm_bcs,
> +		 "Force all tiles to share USM BCS from root tile (default: false, debug only)");
> +
>  #ifdef CONFIG_PCI_IOV
>  module_param_named(max_vfs, xe_modparam.max_vfs, uint, 0400);
>  MODULE_PARM_DESC(max_vfs,
> diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
> index 5a3bfea8b7b4..61332b0ecc18 100644
> --- a/drivers/gpu/drm/xe/xe_module.h
> +++ b/drivers/gpu/drm/xe/xe_module.h
> @@ -23,6 +23,7 @@ struct xe_modparam {
>  #endif
>  	int wedged_mode;
>  	u32 svm_notifier_size;
> +	bool force_use_root_usm_bcs;
>  };
>  
>  extern struct xe_modparam xe_modparam;
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 24a38904bb50..c7dffb21b18d 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -638,6 +638,7 @@ static int xe_info_init_early(struct xe_device *xe,
>  	xe->info.skip_pcode = desc->skip_pcode;
>  	xe->info.needs_scratch = desc->needs_scratch;
>  	xe->info.needs_shared_vf_gt_wq = desc->needs_shared_vf_gt_wq;
> +	xe->info.use_root_usm_bcs = desc->use_root_usm_bcs;
>  
>  	xe->info.probe_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
>  				 xe_modparam.probe_display &&
> diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
> index a4451bdc79fb..cbbb338ee580 100644
> --- a/drivers/gpu/drm/xe/xe_pci_types.h
> +++ b/drivers/gpu/drm/xe/xe_pci_types.h
> @@ -53,6 +53,7 @@ struct xe_device_desc {
>  	u8 skip_mtcfg:1;
>  	u8 skip_pcode:1;
>  	u8 needs_shared_vf_gt_wq:1;
> +	u8 use_root_usm_bcs:1;
>  };
>  
>  struct xe_graphics_desc {
> -- 
> 2.25.1
> 
