Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E62ABCAC5B8
	for <intel-xe@archiver.kernel.org>; Thu,  2 Oct 2025 21:00:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CAF910E009;
	Thu,  2 Oct 2025 21:00:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EUcz9O2X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA7AB10E009
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Oct 2025 21:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759438831; x=1790974831;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=uCstK55yid+tE5+UcAzg4MHr3+xK+EmAHoju7xxoDpA=;
 b=EUcz9O2XAeJykAPFMfpxtWOE8VB2j1q/tmobOm/DcHaqcg1+nP7yOtqk
 J9a/Td/Rw1ka0Mzpq4lWGrOGVzCdFKXuKIU4oT4++1eOk6KzX10phleOw
 lb9HiZlbe1xP67KzGb9vwfZVG9XqrWUBEoJQG7Z+3R15EDNWOhrur3NmK
 B/PxKAAx3pl1xfZFU8ZV11KqCgJPrufl2dQ1V+G/3wPdSIYkXpR+3MH/x
 ptV53NDuJQrhqA5bXSQzK73z+40+U7SoUjJ6X+ipMCNybpDe3sHzNyAaM
 6fQufilxch6WYd1GvPsCfa5xnR9BM0dPk9Pm1Gaykgawt2DgMu391nC1m A==;
X-CSE-ConnectionGUID: /lZlUJ+OTq+UZoutEx4FJQ==
X-CSE-MsgGUID: HSv47YqtQ++wI/nfBmd1dg==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="61832235"
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; d="scan'208,217";a="61832235"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 14:00:30 -0700
X-CSE-ConnectionGUID: YWpAwquPRVOVaO9ZbG7z/A==
X-CSE-MsgGUID: BuEBvHSaQhe3U26UEaRQ1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; 
 d="scan'208,217";a="178769766"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 14:00:30 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 2 Oct 2025 14:00:29 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 2 Oct 2025 14:00:29 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.3) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 2 Oct 2025 14:00:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U+dfLnUS8qr4w2XXwKyVNUHETZKx+ECMXO4pKtzSivjaXFbbFAPe7FWqmO1avUnsqdGWNXysa67hHHilFzQWwH1g/lWWPajh3judibTKnRFx4zo9VIdsc4zib+ZMtCRX7+xmsCq7QtFpD//QPBCW1/iIA3VqdWyLZ8y6Ojvzoe89Re/EFNWZ61eeu3Y07VJYHat9tqL01OJd0yRamPlPuXulXes20pgMMHThpvlCzvO+bmB+yPrdsA2Q6VDbnFQwkP1gjZIw3zVQlqUBQu4+JGSDx1J4/nC4RyuyOco9GyOg+CnYZDRYUZbh8RxfBaodE1wsZvq9lDQTJjZNllubCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qfln1xZP4xrZiB269zmDetYkWQxlxKjZCGXflDJ3Qu4=;
 b=bRHwPjLj+5d2ezFyrGZ5ZnmrlXdj7/5yvaL5ajsiidDpWbLr5TnBuJtzY9E35z94YeH23S1S/Z5drYX4xx1HWM2sH3JyLaGqI1Z46k7Q/o/NWz4QCflXj58FtNksQHoBJ/WGn/x/t8cjZC+RIHn5U7W+rCLV+2AEAU4u8oAKqAHnLv4qly/uw+mD3pypfBehBfolqRoDVMiSnF2X0JdErwXnhl3gI4sBkQmYX5n5FvQeiICDnmL0eTvTlCInwBQUn9+YnTKf5X4i6vPnfxkQZG589BJshSQP/00raTcfGbhAP/TUI4dHqQzofaB/KfR//8ndK9ksMYWuknmEWhL+GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9226.namprd11.prod.outlook.com (2603:10b6:208:574::13)
 by SN7PR11MB7113.namprd11.prod.outlook.com (2603:10b6:806:298::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Thu, 2 Oct
 2025 21:00:25 +0000
Received: from IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09]) by IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09%6]) with mapi id 15.20.9137.018; Thu, 2 Oct 2025
 21:00:25 +0000
Content-Type: multipart/alternative;
 boundary="------------f0YRIEnI5vfJJ0CR6nHuOS4U"
Message-ID: <805c6ffb-0820-4b73-ab1f-65d89df6b871@intel.com>
Date: Thu, 2 Oct 2025 23:00:21 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 31/34] drm/xe/vf: Use primary GT ordered work queue on
 media GT on PTL VF
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20251002055402.1865880-1-matthew.brost@intel.com>
 <20251002055402.1865880-32-matthew.brost@intel.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <20251002055402.1865880-32-matthew.brost@intel.com>
X-ClientProxiedBy: VIZP296CA0011.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:2a1::12) To IA3PR11MB9226.namprd11.prod.outlook.com
 (2603:10b6:208:574::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9226:EE_|SN7PR11MB7113:EE_
X-MS-Office365-Filtering-Correlation-Id: 14102306-3b81-48a4-253b-08de01f6b575
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RGYzQ0Y3NkV3R3Y1UVJ3TE5GRW00SmYrN1NUTmVIb2lBa20vL0c3QmNnTlpW?=
 =?utf-8?B?U25iRzNvMGJJSXUxRVhjZW1XTTVPUmVxVDVRb0diZWhBQ01pOFhMeE9PK2gw?=
 =?utf-8?B?b2lpUFBhTlRUbEVxa01IUHE2QnRtalJ0Nlp2SlFBaW9MSVVYVWI1ODQ2QVdp?=
 =?utf-8?B?blQvanM2YTZITVB0ZkpOMnI2S2dBc3VBS3hmVTV0d3lUN1I1UjAwQW5tc1JJ?=
 =?utf-8?B?SnBRNEVqRC9xOFlldFFTcTV5VzI5Y0YvM2FWTTRDZEpyMFRoUjB3TGk5ZVRw?=
 =?utf-8?B?Z0V6WGI1NFRYeWtuSlpyYVRBbEpZUXN5bE5uQWdUbzNOWW9zZTRkc2RaZDRw?=
 =?utf-8?B?UXFwSkJvdmdGY0VqR203V2xEUUZHTURpeUQyNVBNOXpoaHVwb0c2amJRbWlP?=
 =?utf-8?B?L0FEYndWN3hrdkRJV3RjSTl6Y2RadDZqSHZkVkQwT3hhUjl0bXNzYVNsS2NJ?=
 =?utf-8?B?b3hUdFNMdEJaOTRlM2cxR0tlREdxR2g1MDh2R3VXZC9haXhMaGwzcG51bmtV?=
 =?utf-8?B?WGpsZnVQZ0h1UUt5NFQ4cnVFZzVtcnNDZDNlME9Dd3h1VVZva0dwbmJpamFN?=
 =?utf-8?B?Z2p4KzRYdzBCV1E4bHdHWXRyd0xzTzBlbWpOSGt0OERZb3kwd0x0QzZBNUFW?=
 =?utf-8?B?bjR1VHJvektndmpsZ0xhT2UzOHZRRFR4ZEg1ckpIYk1GWVBTaG80ekluVDE3?=
 =?utf-8?B?Vi9WL2Y0R3g3cGYyM2RPR0tlZ0dhSUo0djYrcHl0bGpjQVA1NHliTXRJUW5O?=
 =?utf-8?B?eThwZmF3eldqS0s4YVQ5QXZjM3ZtY1I5Y0pNUWdUaS9uT2M0Qk4rbFoxUldr?=
 =?utf-8?B?WDJyZ051dDRjZHltMkh4TGZQbERjQXljYnZrTTgvb25ZMCswdUpjOStZcXVr?=
 =?utf-8?B?WFpNRmxxM3puOXlPTnZteGo4UHZKM1BFMkpobEVoVmVqOWgrZ1pBRDZFeHB0?=
 =?utf-8?B?VlFReVJwM2tSdjkvRllQSXJlVnhCd0dkbHFTYWs1cTBMRFpZOHQrZXdJejZM?=
 =?utf-8?B?VGR2K2N3UFFRY1dSSk5sdzcyc2JUZUFReFp1SHBtTjZKa1Fka1ZVUVhpVkZX?=
 =?utf-8?B?cnhxTGtrVUN5NVVIVmwxUlNLd1k0U3drMEdlVlpnK08xMVhWaGxqVEp6Ukcv?=
 =?utf-8?B?clh2YTdudXliTUEwZFo0YytMM3ZNbzI2MmllT1NXOWpqTUhUVDFuc2hmRzJN?=
 =?utf-8?B?Z1hVZ0RwWnp6enZHNlpFMTgzYzk5N0pvQmFYdCs3eUpLcUhkNEZDN3F2d0c5?=
 =?utf-8?B?TjQxTThldmVzb0VLR3JCcGV0eXhEZXFaUSswSGxxM2pXeTFGSEZzWGtTZ0tt?=
 =?utf-8?B?cWdIN1J4RGRNc1pSbmplcEhSeFEwUXRlbmRnZGl4MGZqUkJpNXJXUXI5cVZ0?=
 =?utf-8?B?Z2dITjQ0RkxyaUdkR1V3N3l5Rkh4SWQ0M1Z6S2NJSXBVTzdxTE5KN3pEN3Qv?=
 =?utf-8?B?eGVXelZqcncvNVMxUllEeHV0Wmc1UGVKRW5jUjRLRUNFVTViRE95TUhYeVR3?=
 =?utf-8?B?Vk4rNndEbWlTVzRrVHpNY2tUOHo3cXhuY3FIbi84L3QzQjNMZzR6QnpvU1ZE?=
 =?utf-8?B?TlhTMVdPSFM1Rm1idGFWYVlEL0g0cWd3SFJ1ZGNLenFWSk5lRUMrQWs3Sk5s?=
 =?utf-8?B?VXQ2emptS0hqY1gyZUxEcUN4NXhmdTFoYXhLYmNPbEFUamJEVlpYMjhYVHBr?=
 =?utf-8?B?NEpCMlYvSkF1U0lwY2VhVmVVM2NkYjZsNnhRVm51WHAweGJOWnExNU1qUXBh?=
 =?utf-8?B?QkZtZjdPeGVyYm9XYVV4ckVlR2sxd2t4QVlyVGZ6eFdvMmQ3ay9nQ0crcitL?=
 =?utf-8?B?VnNQOTNNNjVJSDJuSXFBcFc5VmFUQmx3d2xka09mWnU5ZnN0Z3AydDVWclFS?=
 =?utf-8?B?MG13cWNsVzdrd0JuT25lcGNsTWV0c0JJVTdkWTFVWHllTm1ySEdDODF2ZzN4?=
 =?utf-8?Q?+D7w/UL+Wv1RUWQprYcG+Oiysxzghkpg?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9226.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QjlmS0JVZEtnaTJDRGNUd1VlOUdvVFVNaEJiNlJIVlVYSHJTd3ppeUhuRkQy?=
 =?utf-8?B?eWdvUllQSSticFQ0OWdQQnpHMkJpR0NZOFU4UDRveFF4cEtacEl3ckRQQTcr?=
 =?utf-8?B?eXZCdHlJMk1aOGd3bVFEMWNsUUhwM2VobUNac0FvdUNlV3NDYkpNU3B5S1hT?=
 =?utf-8?B?SCtldEZuQnk5UWVrWGY3enAyL2xKcHFqanMzWm05ck1KaUlsQ0JheURDNGhN?=
 =?utf-8?B?dThTdGlyUG1kTHFxejZST2JuUnZUYlVXNGNKUGpqSDVGY3laNVBML1NzY3hk?=
 =?utf-8?B?UnIzKzFWUG5lbmY1MGh3elBlSzBYUHRvak9jSWdVcGJiMmI0UzIyenNGaFc0?=
 =?utf-8?B?YkY4Nk90MHhmSGtDUDlqVFp2Q3BmZjdJSUs1Nk03d2NxU2UzazFwc3hUV3Nq?=
 =?utf-8?B?eWZYMDN0ZDVkcGRHU0F2VGJTaGk2VVMrMXE4ODF1cTY3WDZDcjhVMHlsVEJE?=
 =?utf-8?B?NWJJbXA1S2FBaUlXMHFNKy8rdkVWM0tuSDF5UEx2V2NRSGtUdk5LaEMwa09P?=
 =?utf-8?B?eXYybkRhdXptVW5USnE2NnA5MEsxaGZ6RG9Ea2tJdi9tZjVNSzZzZ3lWdllz?=
 =?utf-8?B?N2U3enJkYjJqVlNoRUJGRWpjWE9HR25EVkkweFN3R3A3aDFpVGNHOFdNVEM1?=
 =?utf-8?B?dng2QmRrZWNSNzJVWlVOZHNBWnhxa2NuSklBaGJtc2lDT1daWTBuRWx1NVNM?=
 =?utf-8?B?ejMwcldVYnc5bnBJV0dmallXTlVFYXBFZW9DclVlVGFaYUJqSmd5amZ5SU96?=
 =?utf-8?B?ZEZ2eHRwZ0RRYnNLRHQ5RTVGa1RVN0ViNlQzQWZEdDFacG01a3hRM3dwM2t6?=
 =?utf-8?B?dGEzNXFZbmdKaDI0OXMwaDlyaGhrVWJVMXo1S3hONXczUXlmNGJWR2xMOGxW?=
 =?utf-8?B?cEw0RnRkRlZueVNBckRTamRnbXVGQ1cwTWZrcGI1Q21oZzZ4eXM0azgvOFAx?=
 =?utf-8?B?NURNNUVrRC9qNXNnSVhwUWVOb2FWeHNBZlR1MjhNMVRrT01sY3IvSitYR0NR?=
 =?utf-8?B?bStvQ3Z5a0pYZzFiQ2RsT1BtaDF5WFNBckZHVFdBYndLQkN0WEdDQnJUUE1V?=
 =?utf-8?B?WGgzbHl2NTY5VlV0aFFHTUo0ekhTOTV0YVg0UDlkVHZuWnVLT09ER1ErdEtD?=
 =?utf-8?B?VkxRdFdxcEZrRzFzUWlFVm5CbzRIcDBvL2RNZm1xeDhxTlM2RlZ2clNQSy9n?=
 =?utf-8?B?aU9pR0pqY2dDamVRdXJIMHAxYW85QVJFUUowTVBSSzNaU1UwU3JXdnV4TG5h?=
 =?utf-8?B?czR4V2NtYlV6Z3JDamxYRnozWXpNOGh3Y21iM3JSNW9SdlBDL1dQZm9aVkk5?=
 =?utf-8?B?K29LUjlOK1ltTFNtQzRrY011ZjVIYVpyVTZUWTRjSkpCOHU0K1I0WTFiQ3F3?=
 =?utf-8?B?bzlHaURnK1JBZFowODJEMUlsdGNXNTBGQ0F1dVV1VlYyN2hyNVFyMmo3Y25G?=
 =?utf-8?B?VTV0V3dOSDZuL21CYXNYMkM4QXBRTmV3QWwxc0Y5Vi9rd252TWhGK09SV3dL?=
 =?utf-8?B?NjFuV28ySmhpM0U3aFhJRnFCcGZ6V2pOMkdMbUFsTFQ2aXBxVkJvT0VnY3RD?=
 =?utf-8?B?ZUpvQmx2TUNLczRpMnl2VHJtZFlEa1FyNlMwc04wVUJUdXZvWGEwdXkzZ1ll?=
 =?utf-8?B?aElnMncrUlBQZ1p4cFpjQTNvMTJYbWZ6M3ZJeC90QWxIbmFDWUM3TFV3eVZp?=
 =?utf-8?B?SSs5aTZEamszbW1VeXczYTYwN2JRaXpvcUZPbG9HcjBNMUs0RUdkSDdINExl?=
 =?utf-8?B?Nnl6cG82cUF3dzNVYlYxUXhqSFpoN2tEYS93bURtQjBFSWhuMnoxTDNQMG1E?=
 =?utf-8?B?dCsrbTdabUhWOExuVW5zSG9QRmNMQ3pQaEQwZERpL3ZsMG5kZ3pFVlZFbjBG?=
 =?utf-8?B?YXM4d21YeXY3NE9LSDRPdWZxSmNRb0FSRTBWa040SGw5NkdHN2ZHZVFSc2ZN?=
 =?utf-8?B?ajIzYTVMMkVwMmJLNEl1SVFYd3Z6WHhJbjVma3M1NTl5WGNFL0Jla2w2VTc3?=
 =?utf-8?B?M0JFMi9aNFYrWkJGK250V0p2MU5HRjF4ZDBQeWRTSFV6cHpyR25OQjU5NkF4?=
 =?utf-8?B?WWpBTWU2Z2NLcmg5SXovMVg3bVFTL3RYcTFPNlA3eVJYa3J2QVNieUQycXBU?=
 =?utf-8?Q?Z0iwhVGPmYUHiQN5WeFYJI0wo?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 14102306-3b81-48a4-253b-08de01f6b575
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9226.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2025 21:00:25.2599 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SolGwIEnVYUG/c66vNe56VroqMeWuVp0JRRNWJdVfjBNMSiPXLCu5VVHj+cDYwf5Biotk8dJH51j6BgyUJsGGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7113
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

--------------f0YRIEnI5vfJJ0CR6nHuOS4U
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 10/2/2025 7:53 AM, Matthew Brost wrote:
> VF CCS restore is a primary GT operation on which the media GT depends.
> Therefore, it doesn't make much sense to run these operations in
> parallel. To address this, point the media GT's ordered work queue to
> the primary GT's ordered work queue on platforms that require (PTL VFs)
> CCS restore as part of VF post-migration recovery.
>
> Signed-off-by: Matthew Brost<matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_device_types.h |  2 ++
>   drivers/gpu/drm/xe/xe_gt.c           | 16 ++++++++++------
>   drivers/gpu/drm/xe/xe_gt.h           |  2 +-
>   drivers/gpu/drm/xe/xe_pci.c          |  6 +++++-
>   drivers/gpu/drm/xe/xe_pci_types.h    |  1 +
>   drivers/gpu/drm/xe/xe_tile.c         |  2 +-
>   6 files changed, 20 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index c27414d4e856..1fa17e25236f 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -321,6 +321,8 @@ struct xe_device {
>   		u8 skip_mtcfg:1;
>   		/** @info.skip_pcode: skip access to PCODE uC */
>   		u8 skip_pcode:1;
> +		/** @info.needs_shared_vf_gt_wq: needs shared GT WQ on VF */
> +		u8 needs_shared_vf_gt_wq:1;
>   	} info;
>   
>   	/** @wa_active: keep track of active workarounds */
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 5f04d562604b..0c38cd30143c 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -72,7 +72,7 @@ static void gt_fini(struct drm_device *drm, void *arg)
>   	destroy_workqueue(gt->ordered_wq);
>   }
>   
> -struct xe_gt *xe_gt_alloc(struct xe_tile *tile)
> +struct xe_gt *xe_gt_alloc(struct xe_tile *tile, bool use_primary_wq)
>   {
>   	struct xe_gt *gt;
>   	int err;
> @@ -82,12 +82,16 @@ struct xe_gt *xe_gt_alloc(struct xe_tile *tile)
>   		return ERR_PTR(-ENOMEM);
>   
>   	gt->tile = tile;
> -	gt->ordered_wq = alloc_ordered_workqueue("gt-ordered-wq",
> -						 WQ_MEM_RECLAIM);
> +	if (use_primary_wq) {
> +		gt->ordered_wq = tile->primary_gt->ordered_wq;
> +	} else {
> +		gt->ordered_wq = alloc_ordered_workqueue("gt-ordered-wq",
> +							 WQ_MEM_RECLAIM);

if (!gt->ordered_wq)

	return ERR_PTR(-ENOMEM);

or maybe if use_primary_gt, the error returned should be different?
>   
> -	err = drmm_add_action_or_reset(&gt_to_xe(gt)->drm, gt_fini, gt);
> -	if (err)
> -		return ERR_PTR(err);
> +		err = drmm_add_action_or_reset(&gt_to_xe(gt)->drm, gt_fini, gt);

Looks like we've transformed `gt_fini` into `gt_wq_fini`, and it's not 
getting back to what it was.

Then, the rename as above would make sense.

> +		if (err)
> +			return ERR_PTR(err);

I don't see why an issue with registering cleanup handler justifies 
failing the probe process, but that's out of scope of this review.

-Tomasz

> +	}
>   
>   	return gt;
>   }
> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> index ee0239b2f48c..2e3898c18746 100644
> --- a/drivers/gpu/drm/xe/xe_gt.h
> +++ b/drivers/gpu/drm/xe/xe_gt.h
> @@ -28,7 +28,7 @@ static inline bool xe_fault_inject_gt_reset(void)
>   	return IS_ENABLED(CONFIG_DEBUG_FS) && should_fail(&gt_reset_failure, 1);
>   }
>   
> -struct xe_gt *xe_gt_alloc(struct xe_tile *tile);
> +struct xe_gt *xe_gt_alloc(struct xe_tile *tile, bool use_primary_wq);
>   int xe_gt_init_early(struct xe_gt *gt);
>   int xe_gt_init(struct xe_gt *gt);
>   void xe_gt_mmio_init(struct xe_gt *gt);
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 3f42b91efa28..25a1d96a68e7 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -347,6 +347,7 @@ static const struct xe_device_desc ptl_desc = {
>   	.has_sriov = true,
>   	.max_gt_per_tile = 2,
>   	.needs_scratch = true,
> +	.needs_shared_vf_gt_wq = true,
>   };
>   
>   #undef PLATFORM
> @@ -598,6 +599,7 @@ static int xe_info_init_early(struct xe_device *xe,
>   	xe->info.skip_mtcfg = desc->skip_mtcfg;
>   	xe->info.skip_pcode = desc->skip_pcode;
>   	xe->info.needs_scratch = desc->needs_scratch;
> +	xe->info.needs_shared_vf_gt_wq = desc->needs_shared_vf_gt_wq;
>   
>   	xe->info.probe_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
>   				 xe_modparam.probe_display &&
> @@ -766,7 +768,9 @@ static int xe_info_init(struct xe_device *xe,
>   		 * Allocate and setup media GT for platforms with standalone
>   		 * media.
>   		 */
> -		tile->media_gt = xe_gt_alloc(tile);
> +		tile->media_gt = xe_gt_alloc(tile,
> +					     xe->info.needs_shared_vf_gt_wq &&
> +					     IS_SRIOV_VF(xe));
>   		if (IS_ERR(tile->media_gt))
>   			return PTR_ERR(tile->media_gt);
>   
> diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
> index 9b9766a3baa3..b11bf6abda5b 100644
> --- a/drivers/gpu/drm/xe/xe_pci_types.h
> +++ b/drivers/gpu/drm/xe/xe_pci_types.h
> @@ -48,6 +48,7 @@ struct xe_device_desc {
>   	u8 skip_guc_pc:1;
>   	u8 skip_mtcfg:1;
>   	u8 skip_pcode:1;
> +	u8 needs_shared_vf_gt_wq:1;
>   };
>   
>   struct xe_graphics_desc {
> diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
> index d49ba3401963..a982732a8056 100644
> --- a/drivers/gpu/drm/xe/xe_tile.c
> +++ b/drivers/gpu/drm/xe/xe_tile.c
> @@ -149,7 +149,7 @@ int xe_tile_init_early(struct xe_tile *tile, struct xe_device *xe, u8 id)
>   	if (err)
>   		return err;
>   
> -	tile->primary_gt = xe_gt_alloc(tile);
> +	tile->primary_gt = xe_gt_alloc(tile, false);
>   	if (IS_ERR(tile->primary_gt))
>   		return PTR_ERR(tile->primary_gt);
>   
--------------f0YRIEnI5vfJJ0CR6nHuOS4U
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/2/2025 7:53 AM, Matthew Brost
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20251002055402.1865880-32-matthew.brost@intel.com">
      <pre wrap="" class="moz-quote-pre">VF CCS restore is a primary GT operation on which the media GT depends.
Therefore, it doesn't make much sense to run these operations in
parallel. To address this, point the media GT's ordered work queue to
the primary GT's ordered work queue on platforms that require (PTL VFs)
CCS restore as part of VF post-migration recovery.

Signed-off-by: Matthew Brost <a class="moz-txt-link-rfc2396E" href="mailto:matthew.brost@intel.com">&lt;matthew.brost@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_device_types.h |  2 ++
 drivers/gpu/drm/xe/xe_gt.c           | 16 ++++++++++------
 drivers/gpu/drm/xe/xe_gt.h           |  2 +-
 drivers/gpu/drm/xe/xe_pci.c          |  6 +++++-
 drivers/gpu/drm/xe/xe_pci_types.h    |  1 +
 drivers/gpu/drm/xe/xe_tile.c         |  2 +-
 6 files changed, 20 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index c27414d4e856..1fa17e25236f 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -321,6 +321,8 @@ struct xe_device {
 		u8 skip_mtcfg:1;
 		/** @info.skip_pcode: skip access to PCODE uC */
 		u8 skip_pcode:1;
+		/** @info.needs_shared_vf_gt_wq: needs shared GT WQ on VF */
+		u8 needs_shared_vf_gt_wq:1;
 	} info;
 
 	/** @wa_active: keep track of active workarounds */
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 5f04d562604b..0c38cd30143c 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -72,7 +72,7 @@ static void gt_fini(struct drm_device *drm, void *arg)
 	destroy_workqueue(gt-&gt;ordered_wq);
 }
 
-struct xe_gt *xe_gt_alloc(struct xe_tile *tile)
+struct xe_gt *xe_gt_alloc(struct xe_tile *tile, bool use_primary_wq)
 {
 	struct xe_gt *gt;
 	int err;
@@ -82,12 +82,16 @@ struct xe_gt *xe_gt_alloc(struct xe_tile *tile)
 		return ERR_PTR(-ENOMEM);
 
 	gt-&gt;tile = tile;
-	gt-&gt;ordered_wq = alloc_ordered_workqueue(&quot;gt-ordered-wq&quot;,
-						 WQ_MEM_RECLAIM);
+	if (use_primary_wq) {
+		gt-&gt;ordered_wq = tile-&gt;primary_gt-&gt;ordered_wq;
+	} else {
+		gt-&gt;ordered_wq = alloc_ordered_workqueue(&quot;gt-ordered-wq&quot;,
+							 WQ_MEM_RECLAIM);</pre>
    </blockquote>
    <p>if (!<span style="white-space: pre-wrap">gt-&gt;ordered_wq)</span></p>
    <pre wrap="" class="moz-quote-pre">	return ERR_PTR(-ENOMEM);</pre>
    or maybe if use_primary_gt, the error returned should be different?
    <blockquote type="cite" cite="mid:20251002055402.1865880-32-matthew.brost@intel.com">
      <pre wrap="" class="moz-quote-pre">
 
-	err = drmm_add_action_or_reset(&amp;gt_to_xe(gt)-&gt;drm, gt_fini, gt);
-	if (err)
-		return ERR_PTR(err);
+		err = drmm_add_action_or_reset(&amp;gt_to_xe(gt)-&gt;drm, gt_fini, gt);</pre>
    </blockquote>
    <p>Looks like we've transformed `<span style="white-space: pre-wrap">gt_fini`</span>&nbsp;into
      `<span style="white-space: pre-wrap">gt_wq_fini`, and it's not getting back to what it was.</span></p>
    <p><span style="white-space: pre-wrap">Then, the rename as above would make sense.</span></p>
    <blockquote type="cite" cite="mid:20251002055402.1865880-32-matthew.brost@intel.com">
      <pre wrap="" class="moz-quote-pre">
+		if (err)
+			return ERR_PTR(err);</pre>
    </blockquote>
    <p>I don't see why an issue with registering cleanup handler
      justifies failing the probe process, but that's out of scope of
      this review.</p>
    <p>-Tomasz</p>
    <blockquote type="cite" cite="mid:20251002055402.1865880-32-matthew.brost@intel.com">
      <pre wrap="" class="moz-quote-pre">
+	}
 
 	return gt;
 }
diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
index ee0239b2f48c..2e3898c18746 100644
--- a/drivers/gpu/drm/xe/xe_gt.h
+++ b/drivers/gpu/drm/xe/xe_gt.h
@@ -28,7 +28,7 @@ static inline bool xe_fault_inject_gt_reset(void)
 	return IS_ENABLED(CONFIG_DEBUG_FS) &amp;&amp; should_fail(&amp;gt_reset_failure, 1);
 }
 
-struct xe_gt *xe_gt_alloc(struct xe_tile *tile);
+struct xe_gt *xe_gt_alloc(struct xe_tile *tile, bool use_primary_wq);
 int xe_gt_init_early(struct xe_gt *gt);
 int xe_gt_init(struct xe_gt *gt);
 void xe_gt_mmio_init(struct xe_gt *gt);
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 3f42b91efa28..25a1d96a68e7 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -347,6 +347,7 @@ static const struct xe_device_desc ptl_desc = {
 	.has_sriov = true,
 	.max_gt_per_tile = 2,
 	.needs_scratch = true,
+	.needs_shared_vf_gt_wq = true,
 };
 
 #undef PLATFORM
@@ -598,6 +599,7 @@ static int xe_info_init_early(struct xe_device *xe,
 	xe-&gt;info.skip_mtcfg = desc-&gt;skip_mtcfg;
 	xe-&gt;info.skip_pcode = desc-&gt;skip_pcode;
 	xe-&gt;info.needs_scratch = desc-&gt;needs_scratch;
+	xe-&gt;info.needs_shared_vf_gt_wq = desc-&gt;needs_shared_vf_gt_wq;
 
 	xe-&gt;info.probe_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &amp;&amp;
 				 xe_modparam.probe_display &amp;&amp;
@@ -766,7 +768,9 @@ static int xe_info_init(struct xe_device *xe,
 		 * Allocate and setup media GT for platforms with standalone
 		 * media.
 		 */
-		tile-&gt;media_gt = xe_gt_alloc(tile);
+		tile-&gt;media_gt = xe_gt_alloc(tile,
+					     xe-&gt;info.needs_shared_vf_gt_wq &amp;&amp;
+					     IS_SRIOV_VF(xe));
 		if (IS_ERR(tile-&gt;media_gt))
 			return PTR_ERR(tile-&gt;media_gt);
 
diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
index 9b9766a3baa3..b11bf6abda5b 100644
--- a/drivers/gpu/drm/xe/xe_pci_types.h
+++ b/drivers/gpu/drm/xe/xe_pci_types.h
@@ -48,6 +48,7 @@ struct xe_device_desc {
 	u8 skip_guc_pc:1;
 	u8 skip_mtcfg:1;
 	u8 skip_pcode:1;
+	u8 needs_shared_vf_gt_wq:1;
 };
 
 struct xe_graphics_desc {
diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
index d49ba3401963..a982732a8056 100644
--- a/drivers/gpu/drm/xe/xe_tile.c
+++ b/drivers/gpu/drm/xe/xe_tile.c
@@ -149,7 +149,7 @@ int xe_tile_init_early(struct xe_tile *tile, struct xe_device *xe, u8 id)
 	if (err)
 		return err;
 
-	tile-&gt;primary_gt = xe_gt_alloc(tile);
+	tile-&gt;primary_gt = xe_gt_alloc(tile, false);
 	if (IS_ERR(tile-&gt;primary_gt))
 		return PTR_ERR(tile-&gt;primary_gt);
 
</pre>
    </blockquote>
  </body>
</html>

--------------f0YRIEnI5vfJJ0CR6nHuOS4U--
