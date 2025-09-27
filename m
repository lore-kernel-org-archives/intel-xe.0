Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6836FCAC5B8
	for <intel-xe@archiver.kernel.org>; Sat, 27 Sep 2025 11:54:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E68DE10E192;
	Sat, 27 Sep 2025 11:54:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DhWixPNL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54F1A10E192
 for <intel-xe@lists.freedesktop.org>; Sat, 27 Sep 2025 11:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758974088; x=1790510088;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=pfRaNukVAV05ojanblMGSpWnXSrBygSULq2dqAeBq6c=;
 b=DhWixPNLi0ejhvKJe3cH61gJ8x2jlwXmI+uTBJlPNwfvlR9XyUqLgx5X
 VzDHi0TwjWaKnUEj/pZKZZkyqaOiDQ5pGGRYgl9c3kOB6+5uIH8nnzlBF
 N+ST7bu3K5m4mHULxoRN3PjX7TYBDKSc98VdkVPAmOG+C+2rh4VIxoD5u
 B4xshDL3cFckVqqRyn9bSn3BSFdQOupiFPsoJClovXWYbn4ZpxctG7LHI
 LynPkN2vsjr9BZD3cTX9rEvfPIEi/IfeQXBkPNo3vJuIAEd6y656n2kri
 NN3LpQrH8X99ctYYOcI8v6d3lOifvtJdwJHtUaJugBst2n0QtpzsHabpM g==;
X-CSE-ConnectionGUID: pyhmqDV0SwejiNjqMNaYVQ==
X-CSE-MsgGUID: djAq0H7VRC2iFi6sAlMOfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11565"; a="65133662"
X-IronPort-AV: E=Sophos;i="6.18,297,1751266800"; d="scan'208,217";a="65133662"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2025 04:54:48 -0700
X-CSE-ConnectionGUID: 5S9scZr3TMiHZffcMh+7qQ==
X-CSE-MsgGUID: wqAEpfU3QD6KY4WOWM5CHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,297,1751266800"; 
 d="scan'208,217";a="177379718"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2025 04:54:48 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 27 Sep 2025 04:54:47 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sat, 27 Sep 2025 04:54:47 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.49) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 27 Sep 2025 04:54:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TzuyX7CQH66pen28tgIM43QwHWm9PfRGC3IkDshzRwsNeD9Pn6D9JcA0HJLZ02JG+hQQaefdETJqliIWWQJAzKhpzbbmrHZQ1VFBnojV3aLRHIz1bh63ItS/i5EI7XxaDzbe2vVY+frxdTiWFAfBNM08D6AZlbkiOE9cLEv/dVMA9fwhvqMCzBH5vj9pkWijX5RVHXaNMTsk6B6OXkPqyuDh//0pl5JbB/Swa6gEtWetFS/C3bY1dhMiKSJfHDw/i9MJhHIcyD0+Y7Eq6hyfhBvMIXtHou/xfpD4J6NWseRHpuOTNdyCRt0LthF3aCgR0AcYUulpy2gWwaHzF3f2pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QkKScAwuPbfYhglQkj+AQ1li3BugzskL/u3CA0BpcZo=;
 b=tFOE1gEzQ6+BRY3Mf13U5nTbWibx8hL9zG4XTH71Uo6iPUVFKIDGUwMAuSkftsyO7bNLyPf+UlOmln3tlokozVV25HvenRG+PrlB2oVC7BgqXUJT+53rHlqevG0EDXtzEhX65iLiXZTgGRbgnJLYIrplvYl8MvI4JjhxFHV7a5u/oE560t6U7n4BNM8e1Ptu1M87asuoOOYMvgcj+lPLZ0GIVZZUGz5nouHzS1vf+Zfr1vr6qNBJ4mmMt1frRgA14952RwllI4As4RFFtdCds5kIgUXZNhi7QGSJcMRj1n2SjVvXWVY5UUzd5HIP7TShwSvNHy1hEskjO1u8c39Mmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9226.namprd11.prod.outlook.com (2603:10b6:208:574::13)
 by MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.14; Sat, 27 Sep
 2025 11:54:39 +0000
Received: from IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09]) by IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09%6]) with mapi id 15.20.9137.018; Sat, 27 Sep 2025
 11:54:39 +0000
Content-Type: multipart/alternative;
 boundary="------------h3isXnHVuinjZTIk064MkLdc"
Message-ID: <104b4c4b-9bb6-457e-86a3-82abace6e759@intel.com>
Date: Sat, 27 Sep 2025 13:54:35 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 25/34] drm/xe/vf: Abort VF post migration recovery on
 failure
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20250924011601.888293-1-matthew.brost@intel.com>
 <20250924011601.888293-26-matthew.brost@intel.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <20250924011601.888293-26-matthew.brost@intel.com>
X-ClientProxiedBy: WA2P291CA0022.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::24) To IA3PR11MB9226.namprd11.prod.outlook.com
 (2603:10b6:208:574::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9226:EE_|MN0PR11MB6135:EE_
X-MS-Office365-Filtering-Correlation-Id: 22d806e6-16d4-42b6-498e-08ddfdbca379
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aEpPenFRaTQzTjVPREcvVXBGcmNYSnhBQk5Lc1k2UlJRWU8vYWNUQ0lzTnQ2?=
 =?utf-8?B?TmtwVkZMMkJFeGwrSGhwNkRsYjJyQ2xzQUV2S2luTzJOL1BzNGk1L1lEQmpt?=
 =?utf-8?B?Y1NtQm0zTEZ1VURXMkhZOFhhbitLeE82TWZVRWVQVGxRREVXaGVxS2xVQ3Iz?=
 =?utf-8?B?emUxNE92QzdiVGg1TXltM2dteHF4a01nMlpjNmYwZFdGM1FMdXZSUjY1WEtN?=
 =?utf-8?B?RzNyelRPb0xVYzJKMFVxRDBYM0hkNmI2eUVKN0ZvY3V1YktWM3lnNDFxUFdu?=
 =?utf-8?B?STYzZjd4L1NWTnpKZlRsbVVDeWt4UXBDZ3BiQnE2SjNSOEpuSllKL0Vha1RY?=
 =?utf-8?B?VC83dXpWc1pRUmYyRy9QOWJzc05LK2tUZkdrbm5jMngrT09PeWVIMmhxYzZt?=
 =?utf-8?B?SEhMajh2NkJaU2hLTURzZXhwYnRiNVZCTmVtMUY1OXNTVjFvTGl2NEh4a0po?=
 =?utf-8?B?UG9lYmY5bUxnVFRtbVQweHBPcUx0RldBOTdZY1dlMmFkNVFtK29wL1RjTGtr?=
 =?utf-8?B?bmIzaTFvazlhajNtekh2aVptVGpMbVU3K1BXTk5aVmdBRDgxZTZpWDlsN1dE?=
 =?utf-8?B?MWIyQkd3T1U4RzVueDJLd0tWTCtiVkNwVnFLOW93a0Nob1BLcjRXYVBzMzZL?=
 =?utf-8?B?QnFQVU00Y0pWclkxWFdRcU9EU01QTnJKd0g4WWd4eC9aWGxjY0U1SkhEVTUy?=
 =?utf-8?B?WllMeWhiMjdJREFEd0QvVHpLQnYvcE5adUZUOElYVzduUDM5ZjE0VlBoV0VN?=
 =?utf-8?B?YitmaFhkeVZLL1Mya0M4Y1pQWVBDSHRvTXcxY1kvdzlWZVNMZ1IwRHRkcXNT?=
 =?utf-8?B?RENONi9yNTNsd1UySWJiN3ZrZUFYRC8yMHFjSjdKa0VHZjRweVNqbzNmb3hK?=
 =?utf-8?B?SG5XSlJpRjh5RmpSM2JWOXUvbDNyNW5KNlh5NEN1ekUzcmZwMkl2WStsQy9L?=
 =?utf-8?B?MHZOQ29UY3czMzRJZHdwMVlvNS9kUkR6ZGt2U3VRcVkrdkw5K2pvU2YzZGxs?=
 =?utf-8?B?ZWdCeTkxQ3NoYkVOeS9Ja1k4YlcvT2J0RUljUlJBOE1JbzJjWFg0cTVTcHNu?=
 =?utf-8?B?WUpaM255WVVPTGtBY1I0d0k0UVpqQ0xhOGZwbnlISkoyOU9ya1dRd3o5NXI5?=
 =?utf-8?B?VGVQVGl4U1RycDVPWjFGZGZjM1hGM1VsbCtMbFcwRXNMSGQxNWJ1TWRTVGE4?=
 =?utf-8?B?UGxxbkNSVi91OWxUNHk0b3ZHMWxoRTl5bWF1L1BsNVQzS3FOOGU0MG5nV3Q2?=
 =?utf-8?B?Ky9mcUp2QW5DbEt3RlA2QXQyQzNRb04wQTN2UWpNNFp2VUlNYStmMEhuZUlG?=
 =?utf-8?B?U0ZxT1loMlhITkRGM1VFLzBDRWcvaWtTS2NoZ0MzRWIvTU45M1pOWlcvcWpH?=
 =?utf-8?B?K2pDeXNJWVpQQkRXdlpGSkIwWmZ6Nms0OUhmc0JsZk1ZNXAyemF5ZHQzYTBE?=
 =?utf-8?B?MTIyMlowcVYyM3ByN0NoVTJFYyszdGt4ZnlTYXJDTjh3OE1pSWM1NldrL0dL?=
 =?utf-8?B?Snh5R1Rxa2VpQjR2QTQ0VWxXcXZKQ1VMOU5wU0lBOENpTG1yOXF4Q1JJN3Ir?=
 =?utf-8?B?U3lRRlRKaGgxNEhRR3lVMzdodzErNXc5YXZzRDhlVEI1WkJ6eGFzcldocGFQ?=
 =?utf-8?B?OXp5Zi82QUpiTTZsL0oxaGduUldlM1BoYnNvOFRIcDlIc0owcDlXUll3YTZp?=
 =?utf-8?B?YUtDeW5tVTAzMjhwZWZpdC9vdWRUTVRVWkZqQzZkeVNETmYydi9XWWVuem8r?=
 =?utf-8?B?OExOZ09PZmJ0RmFTYUF6MytJY0dQWW1EUWp1eDBUQjM5VmtsOXBjblFSbW5Q?=
 =?utf-8?B?MllDNDFKSVQzMjJENVYxdjJBMVprdHM1Vk1UeEZlend6OGlpMHZJbEhPNlgx?=
 =?utf-8?B?dFVTMzk0MlNoUkhzeG9TQ0htNmdGbXVlc0tlQ3A3K0FtN2xWb3JLL3lwRXVV?=
 =?utf-8?Q?AkKshRfGdft+u5142vn9TCegIz2XNOxa?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9226.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UTV1a0hlNEdIcGRtV3RHNHh6c1RtM0k4VHdQbzFLZ1hObm96eEdHYVFoeVRU?=
 =?utf-8?B?ZjJMdXhONVNMZkJiS1FibUVDWTVzSnB0SURqVHJGUU9DUDBVdndtb1c0Z012?=
 =?utf-8?B?THZTanFrdm9XcVNwMTN1Q2NKV1dhSW96Mkdhd1pVUTNXS2ZDVU5PUnhDbXNm?=
 =?utf-8?B?cjJ6ZU9kTWhIY296TFl3eTF0cTZvQXhuOE5NdlRWV2hLQ01XYWs4bHc3ZkFB?=
 =?utf-8?B?WitnNkZRQ1ZwTjgyLytQbjF4NDBIWjJiZC90Z0ZaTFZ3TFZKZFdCY0w2ZjV6?=
 =?utf-8?B?NDloa0wwVVMzY0JMdkhNT3FGUEVscVh0VkRMa2YrMUdBY1NuUEc0clY0SVVh?=
 =?utf-8?B?T2dOUXZIY21tNk1DWGVJaXpQYTh4MVVQVWFNeFp6OHQreWtKY3p2SDYxaDVS?=
 =?utf-8?B?RnZFUHpVdm5XNEw2TEFSZnNjR0xRM0YwbkhlTCtqZGs5NjhaL2xVcWZIQ1FP?=
 =?utf-8?B?WWgxdEovaGRveVpDTFppbERreHdwYWkzTjR6Wml2NU1yM3UxalJGQzR1ci9L?=
 =?utf-8?B?STdKeXF6Q0RKRlA5YlEwR3VCSEpqc21sa2FmT0EyYmNFdXFGS3dmeHFjbUla?=
 =?utf-8?B?RGE3Y3Rva2t5Q3NZN3FwcUo3MC8wRGVjN1AxS3VXK1E0a0VYWHcybkRDTDMz?=
 =?utf-8?B?ZjVvR09pSFZmZmZQK3dkUmhadHZxcGhqRDZuR0RUR25PNUZZMG1mUm00MnR5?=
 =?utf-8?B?bStuRGtoUXh6N2dHQ2NKdzRrNDlITXlramZrTkd6LzAwbGpjRGRtMW1xK0s3?=
 =?utf-8?B?WWprcmUrTCtQKzZic2RHWVY1OE9FQnJ4YXVlTDByY3ZWM3ZWbm1sb3hXcTFK?=
 =?utf-8?B?QW92UVJHR2NZcWgxbjl2UVI2ZFVNMVN5T25ZMVhhVUx6ZDdRa0RMLzRCU2xQ?=
 =?utf-8?B?M3ZFYmxWaGhqa3JNcXBvaEN2SEFoS0MrK1Vtdng0RUEzQStiZ3RxNG9nL0Zy?=
 =?utf-8?B?aHZTYmQ0UGtPWVAyaDE3Kzk2T1hScU1TK3pBL3hxZWw5ZTNiR3BuZkl3d3o2?=
 =?utf-8?B?dkJ1ejlZWkIyZ1dmS0p4U2tlZFlqYkJhUCtwZzYxbkJzWGIwQkRxSHcyMFlp?=
 =?utf-8?B?MERIUDhkbXpwVThJaElYc0xPcjIySlNoVDFsVlJaWjVtY0ZITUNuZmZaNG4z?=
 =?utf-8?B?SzdQMXE3T0JSb1N3V2N1eXR5Tkp1OEJaZ09jWTVlcnhCS3lYSkE3WklsMDJL?=
 =?utf-8?B?VnNiajFZRXZ4MGdkaS9TZTZVUFlqUUxId0dneGJJQ3Byd3F5VGN4WHpuMDhG?=
 =?utf-8?B?MTIxRkc0b213TGZGelN4bXU2S0laYXU1MkdLWTl2WEpvS0Z1K0RtMmpOMHdw?=
 =?utf-8?B?eFczWTJCQ1JJSE1yWlpXRXlQeTJYbWF6QnNvRUQwUEltR0sxZU1LOTYvbUNP?=
 =?utf-8?B?V21odHNPa1ZkOUhoY1dCbmd2Uk00cVBvVHFQbUdZY3JFM0RpUjRUN25KMG9U?=
 =?utf-8?B?Vm1ZaDhING9vUGJwZC80bk1Tc09yNWd5Q2M3YnFDcC9NcDh4d1IvTUhTSGZX?=
 =?utf-8?B?cnMvZ3RFMmE3RUxyenMxeUdmZXg5a3psd0p4eE43aWhMZFJDZ3hqMVpibXBO?=
 =?utf-8?B?V0srUWJBSm9IWWlYQTRFVDF6eDJOVlV3TitFWGM4QitJSWlmU1krWldzOVBR?=
 =?utf-8?B?dllXaEtkUzZSc3JYMmRhTXJJbldOd0RwTDVlUHRtdDRRdXY5SDNNTWx3YUtQ?=
 =?utf-8?B?VFdmdlh4Z1dNcWZmWTgydUQzbHV0U1c0UmdZNWFtbHpXQ1NpZFZDdnBkZmI5?=
 =?utf-8?B?WWQzRTZTUmdRSk8rbUIyZFlaUFFVcmIvbXNFL1E4b1BVTTV1VnpoanRsaDlO?=
 =?utf-8?B?REtiaiswaFFnUXpUNVNzTW5DVlYwSG5aQXdUaHJwd2NaMk44Q0JPbkZFbDJk?=
 =?utf-8?B?WkN3Q1k5Q3h6UFA4MS9QM3lsczZaTVV0SGdGM1Z0N3lGbU1pY3NHbGNUb3Zn?=
 =?utf-8?B?S2RXaUhXTEorVXZhZU5telRmNmc4L1BUZ2tRMHNxbGo2cE83VXcvK1ZFMnp2?=
 =?utf-8?B?Y0N1OFNueWpjejcxamdYWDZxR0ZtY0Z5SGZoaGxVQS9wbnBzTGN1aWtMTVQ2?=
 =?utf-8?B?a1JPZ2NtNE1MQVJHQUIycjNxbUNGQUpjOUlmaUFMeTBWR3Y2eXhFSHo5bkp2?=
 =?utf-8?Q?di0zoZES6nBQmyVruzefcPtCm?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 22d806e6-16d4-42b6-498e-08ddfdbca379
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9226.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2025 11:54:39.6880 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EMJy+GyFHIsR/mliZ9vCqGc63OsO1tRZVUPCMTwIHpZsOKguLlmyIN7d69xFLXBMWfKxN80jdSrbdfijwHMSIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6135
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

--------------h3isXnHVuinjZTIk064MkLdc
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 9/24/2025 3:15 AM, Matthew Brost wrote:
> If VF post-migration recovery fails, the device is wedged. However,
> submission queues still need to be enabled for proper cleanup. In such
> cases, call into the GuC submission backend to restart all queues that
> were previously paused.
>
> Signed-off-by: Matthew Brost<matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 10 ++++++++++
>   drivers/gpu/drm/xe/xe_guc_submit.c  | 20 ++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_guc_submit.h  |  1 +
>   3 files changed, 31 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 34e57f44fbf4..a987560de2c7 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -1224,6 +1224,15 @@ static void vf_post_migration_kickstart(struct xe_gt *gt)
>   	xe_guc_submit_unpause(&gt->uc.guc);
>   }
>   
> +static void vf_post_migration_abort(struct xe_gt *gt)
> +{
> +	spin_lock_irq(&gt->sriov.vf.migration.lock);
> +	WRITE_ONCE(gt->sriov.vf.migration.recovery_inprogress, false);
> +	spin_unlock_irq(&gt->sriov.vf.migration.lock);
> +
> +	xe_guc_submit_pause_abort(&gt->uc.guc);
> +}
> +
>   static int vf_post_migration_notify_resfix_done(struct xe_gt *gt)
>   {
>   	bool skip_resfix = false;
> @@ -1280,6 +1289,7 @@ static void vf_post_migration_recovery(struct xe_gt *gt)
>   	xe_gt_sriov_notice(gt, "migration recovery ended\n");
>   	return;
>   fail:
> +	vf_post_migration_abort(gt);
>   	xe_pm_runtime_put(xe);
>   	xe_gt_sriov_err(gt, "migration recovery failed (%pe)\n", ERR_PTR(err));
>   	xe_device_declare_wedged(xe);

We could alter the order here to make sure all queues have cleanup 
triggered. Now only the ones which were previously killed/banned/wedged 
have that.

Not sure if it would bring any benefits though.

> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 52b86cab4ec5..8bee65dd9ca6 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -2345,6 +2345,26 @@ void xe_guc_submit_unpause(struct xe_guc *guc)
>   	wake_up_all(&guc->ct.wq);
>   }
>   
> +/**
> + * xe_guc_submit_abort - Avort all paused submission task on given GuC.

typo - Avort

-Tomasz

> + * @guc: the &xe_guc struct instance whose scheduler is to be aborted
> + */
> +void xe_guc_submit_pause_abort(struct xe_guc *guc)
> +{
> +	struct xe_exec_queue *q;
> +	unsigned long index;
> +
> +	mutex_lock(&guc->submission_state.lock);
> +	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q) {
> +		struct xe_gpu_scheduler *sched = &q->guc->sched;
> +
> +		xe_sched_submission_start(sched);
> +		if (exec_queue_killed_or_banned_or_wedged(q))
> +			xe_guc_exec_queue_trigger_cleanup(q);
> +	}
> +	mutex_unlock(&guc->submission_state.lock);
> +}
> +
>   static struct xe_exec_queue *
>   g2h_exec_queue_lookup(struct xe_guc *guc, u32 guc_id)
>   {
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
> index f535fe3895e5..fe82c317048e 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.h
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.h
> @@ -22,6 +22,7 @@ void xe_guc_submit_stop(struct xe_guc *guc);
>   int xe_guc_submit_start(struct xe_guc *guc);
>   void xe_guc_submit_pause(struct xe_guc *guc);
>   void xe_guc_submit_unpause(struct xe_guc *guc);
> +void xe_guc_submit_pause_abort(struct xe_guc *guc);
>   void xe_guc_submit_wedge(struct xe_guc *guc);
>   
>   int xe_guc_read_stopped(struct xe_guc *guc);
--------------h3isXnHVuinjZTIk064MkLdc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/24/2025 3:15 AM, Matthew Brost
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20250924011601.888293-26-matthew.brost@intel.com">
      <pre wrap="" class="moz-quote-pre">If VF post-migration recovery fails, the device is wedged. However,
submission queues still need to be enabled for proper cleanup. In such
cases, call into the GuC submission backend to restart all queues that
were previously paused.

Signed-off-by: Matthew Brost <a class="moz-txt-link-rfc2396E" href="mailto:matthew.brost@intel.com">&lt;matthew.brost@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 10 ++++++++++
 drivers/gpu/drm/xe/xe_guc_submit.c  | 20 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_submit.h  |  1 +
 3 files changed, 31 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 34e57f44fbf4..a987560de2c7 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -1224,6 +1224,15 @@ static void vf_post_migration_kickstart(struct xe_gt *gt)
 	xe_guc_submit_unpause(&amp;gt-&gt;uc.guc);
 }
 
+static void vf_post_migration_abort(struct xe_gt *gt)
+{
+	spin_lock_irq(&amp;gt-&gt;sriov.vf.migration.lock);
+	WRITE_ONCE(gt-&gt;sriov.vf.migration.recovery_inprogress, false);
+	spin_unlock_irq(&amp;gt-&gt;sriov.vf.migration.lock);
+
+	xe_guc_submit_pause_abort(&amp;gt-&gt;uc.guc);
+}
+
 static int vf_post_migration_notify_resfix_done(struct xe_gt *gt)
 {
 	bool skip_resfix = false;
@@ -1280,6 +1289,7 @@ static void vf_post_migration_recovery(struct xe_gt *gt)
 	xe_gt_sriov_notice(gt, &quot;migration recovery ended\n&quot;);
 	return;
 fail:
+	vf_post_migration_abort(gt);
 	xe_pm_runtime_put(xe);
 	xe_gt_sriov_err(gt, &quot;migration recovery failed (%pe)\n&quot;, ERR_PTR(err));
 	xe_device_declare_wedged(xe);</pre>
    </blockquote>
    <p>We could alter the order here to make sure all queues have
      cleanup triggered. Now only the ones which were previously
      killed/banned/wedged have that.</p>
    <p>Not sure if it would bring any benefits though.</p>
    <blockquote type="cite" cite="mid:20250924011601.888293-26-matthew.brost@intel.com">
      <pre wrap="" class="moz-quote-pre">
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 52b86cab4ec5..8bee65dd9ca6 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -2345,6 +2345,26 @@ void xe_guc_submit_unpause(struct xe_guc *guc)
 	wake_up_all(&amp;guc-&gt;ct.wq);
 }
 
+/**
+ * xe_guc_submit_abort - Avort all paused submission task on given GuC.</pre>
    </blockquote>
    <p>typo -&nbsp;<span style="white-space: pre-wrap">Avort </span></p>
    <p>-Tomasz</p>
    <blockquote type="cite" cite="mid:20250924011601.888293-26-matthew.brost@intel.com">
      <pre wrap="" class="moz-quote-pre">
+ * @guc: the &amp;xe_guc struct instance whose scheduler is to be aborted
+ */
+void xe_guc_submit_pause_abort(struct xe_guc *guc)
+{
+	struct xe_exec_queue *q;
+	unsigned long index;
+
+	mutex_lock(&amp;guc-&gt;submission_state.lock);
+	xa_for_each(&amp;guc-&gt;submission_state.exec_queue_lookup, index, q) {
+		struct xe_gpu_scheduler *sched = &amp;q-&gt;guc-&gt;sched;
+
+		xe_sched_submission_start(sched);
+		if (exec_queue_killed_or_banned_or_wedged(q))
+			xe_guc_exec_queue_trigger_cleanup(q);
+	}
+	mutex_unlock(&amp;guc-&gt;submission_state.lock);
+}
+
 static struct xe_exec_queue *
 g2h_exec_queue_lookup(struct xe_guc *guc, u32 guc_id)
 {
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
index f535fe3895e5..fe82c317048e 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.h
+++ b/drivers/gpu/drm/xe/xe_guc_submit.h
@@ -22,6 +22,7 @@ void xe_guc_submit_stop(struct xe_guc *guc);
 int xe_guc_submit_start(struct xe_guc *guc);
 void xe_guc_submit_pause(struct xe_guc *guc);
 void xe_guc_submit_unpause(struct xe_guc *guc);
+void xe_guc_submit_pause_abort(struct xe_guc *guc);
 void xe_guc_submit_wedge(struct xe_guc *guc);
 
 int xe_guc_read_stopped(struct xe_guc *guc);
</pre>
    </blockquote>
  </body>
</html>

--------------h3isXnHVuinjZTIk064MkLdc--
