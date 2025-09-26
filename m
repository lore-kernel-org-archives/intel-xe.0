Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AF7CCAC5AE
	for <intel-xe@archiver.kernel.org>; Fri, 26 Sep 2025 15:40:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B02D110EA8E;
	Fri, 26 Sep 2025 15:40:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TdvWRX3I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92AA710EA8E
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Sep 2025 15:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758901232; x=1790437232;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=dpcpAJzOMXpK6HZCwaYV3U80vMIzb4Jwp6wmKHqpXL4=;
 b=TdvWRX3IBekVaFapdtd64AxIEjnKwv0pQcLtn9w3cP8b7W2Xn1Y2/AwW
 zuXINFEdZJaNcxrI0iAkvPlBRkUEeYApeZiu4dOI3zMmAQOVD9zCuTWmB
 pmmb9JostHoTHAm9fgPGirVO0uksbIOFn1HcsUiv76bKusXzDKA0p98/m
 wGyr/GiiDOgFHVMyhZze8SdRhCJRLI83rooD85oP7Bl2P/A20Ryr1VGtM
 5zt301Bcm6r05E+mGaiVw6yjTlmD30EEp/9MknhZpU/roEEgj/mq/qBqH
 rLb1RXEmk4UyJFjQYOO1adEfD4JvdWbVj6Y1pMzH93VS+vnpFJQfglh85 A==;
X-CSE-ConnectionGUID: Zt7IP6LUStqaIUMJd+gzmg==
X-CSE-MsgGUID: BFyofbcMTOOwn8tewSBoDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11565"; a="61155436"
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208,217";a="61155436"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 08:40:32 -0700
X-CSE-ConnectionGUID: BrHHJanyRaO6owEK5b2pxw==
X-CSE-MsgGUID: l7zxjyb2TdaQRsU7rl6rkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; 
 d="scan'208,217";a="177569840"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 08:40:32 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 26 Sep 2025 08:40:31 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 26 Sep 2025 08:40:31 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.0) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 26 Sep 2025 08:40:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rAo4rvTnF2PE7Fg5HU7O0kUUtgSgZ3MeX4no7TQyzmBPPQKJt8DDm+WnvekiagrJv5BpnNGEDO6jrrL1++UR4IJaqB3YqGm0iS377nN07+wKM0zaG6g7EyXNc2yl9uYj28liWRgnzm1eakHGDUFg2puZin4LCIpJRY6jZs6UxFyf9OcNPmHY3nCN6DNoG7wf6gUFN0SeS+Hes9RIgeXltx9HmO+8K7MCYMeAPVieq+jy6s43cGHzOpd86pWI1PK7nN6wFRE/VtAgDCf18FIgAATAbbbCFPE12B6unWRW4laWK+IHH2lXzk6mJfjNyA7xtOJG+PSlPJ0hfrG9WsQakg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZTa2svF7mMkYfkOdBfDX1igfQkJvI0mKcQftLWGlFOU=;
 b=kpMzvon8I9+A3Ytlk9N4mEJh/Nm3CsiWOGpwmwqXrqbx/hy7/zJdBBJ2NcakNCA2W8eLpsTixD2lt1rFz+x91qjGYhrlOBQ84Yg3eNe5G9rPLEwrV2oVmhqerwPKX20z9TVeKL6rgRlytdbfAjzuXEZBWLMyJnv40TjtQmWPSsRU8N1S2WGXaGGqnGTdQh9bMuIx6dA7xj/oCALAA6JlAvSsXwfRGPd83KuONS5rvFnlGazgGdFoCqiTocRmS4cpLGj0gJZNm7eCwHcoLvwDjRUNjnkuO5G8flhxLyKUFKY0j9kCzy6kPsprInJ42hTFzMVaADIfQO9/bbtV/qst/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9226.namprd11.prod.outlook.com (2603:10b6:208:574::13)
 by SN7PR11MB7565.namprd11.prod.outlook.com (2603:10b6:806:344::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Fri, 26 Sep
 2025 15:40:27 +0000
Received: from IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09]) by IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09%6]) with mapi id 15.20.9137.018; Fri, 26 Sep 2025
 15:40:21 +0000
Content-Type: multipart/alternative;
 boundary="------------1uuFYeHbr0BHfCtfqGRfUQM8"
Message-ID: <04bfb230-94e6-43a5-a7f4-cb48652552dc@intel.com>
Date: Fri, 26 Sep 2025 17:40:17 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 16/34] drm/xe/vf: Teardown VF post migration worker on
 driver unload
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20250924011601.888293-1-matthew.brost@intel.com>
 <20250924011601.888293-17-matthew.brost@intel.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <20250924011601.888293-17-matthew.brost@intel.com>
X-ClientProxiedBy: VE1PR03CA0019.eurprd03.prod.outlook.com
 (2603:10a6:802:a0::31) To IA3PR11MB9226.namprd11.prod.outlook.com
 (2603:10b6:208:574::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9226:EE_|SN7PR11MB7565:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d705900-639c-4e88-6b4d-08ddfd1300c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RlpVVVl6TGR1aWRBMkJ5bGV4dnR6UXFFcU01NExHbEV6RTBabko2YnpvcXRv?=
 =?utf-8?B?cEFQYW5Md0lKTjI5WjQrS2VodmRmejkyNndwQnN6UllpaitTWlE2aU1LUmpp?=
 =?utf-8?B?MTBoRkZod3MrdkhYbzEvcTZPaG1kRXp6dWZlaVdZUnd5V2lLeGMvYzY3WWwz?=
 =?utf-8?B?WCtWQ0dvNFo2V0pwMTRtYytMMXVlNW1qR0xZRmN6OWpTa1dnNDNXOThzUVhY?=
 =?utf-8?B?RllFZUJMMWtXRko1dkdXakw4UDF0eHhnL01Xb055dkI4TEJ6RldxZTQyclZE?=
 =?utf-8?B?eWxlZWZ5QVlLQnVqc3pDTXVnTkN1VU5jYXBJZkhTbE9lVlRLejBRRnhkODZp?=
 =?utf-8?B?ejRzNmVFbTRZZ3JmQTJaczBIQTJuNnFBc3RQZVBjTlo3Y3RwS010dzd3RE9q?=
 =?utf-8?B?QzZYRFgyaWFpc3FydUdaSGNBR1A3OFpkOVllUTFDVXRGN0NQSU11K1NvcXN0?=
 =?utf-8?B?Qnc3di92cGRPekdTelZzcFJtREozalE0cEhmYmlvR3Y3aWd6RDRtTzBGQ0NX?=
 =?utf-8?B?K0xnUUhBVEJnaFNyVkU0RlEzQXN6cCtQd0UzTmFRbnIvVkRFNjFpVDdENkNS?=
 =?utf-8?B?bGM2ZHZSOEJibzdCTGovNy9IbTUwbjBLWjZyVE1rLzVFRS9ZcTdmcXVCcWxK?=
 =?utf-8?B?TDFieXFWcGFaemFJVndQZEx2NXJ3emtHKzhoUDEzcjgxSms5UXlDcFZpNXZl?=
 =?utf-8?B?Vmk3NU1pcUtMcTFBQy9XTjg2SWhVVjFVUTNkakZwcFZJVVpKRUFrRVNNNVBP?=
 =?utf-8?B?bmc4M0dPbDVNUG1OVHdWMUdPdC9Cd1N2MDl0VVFncDIzMWNXOHFlZGplRDNS?=
 =?utf-8?B?RUU0bEY0N3RXMHBUZ1J3TmNyUEhWbW9UV0dlWEdGL3lqTVBZWUhQVk5MRzVD?=
 =?utf-8?B?TDUwOExaWWZMa3JPS1U3UTRqTWo0cDgya1JXTytiaFNmL2RHQUR1MlNFRGdO?=
 =?utf-8?B?UTA3VUNGWWhUQmVIa05DUFFOM2l6MEVjU2lyeUJONEZ4cTRPMFJvblFWT0kx?=
 =?utf-8?B?KzdFL0dlTGVvMzAvdSsxY0JSdVVvb0N3UDV4WUEwbUFKYjFjemd4VDVzdWs4?=
 =?utf-8?B?WFNHdWRGYVR3SzBVaWtTSi9qTmk5SDNpTjZlaVpJRlM3RHIwMys4NTJxb292?=
 =?utf-8?B?V1BMZ2lnelZadU1SNVJMVXc5aXFMSDZtbEl3L2xoUGpkTHNPa3RJS1Z1a2Qw?=
 =?utf-8?B?eDVXM2toS3lDb0NoL0VYQXlLakxUNGp0UjJ0U1JOU28zN05UdHlTN0p4dnlL?=
 =?utf-8?B?K0pjRFZ1YzA3ZURGU2RkVTRBU1hWa0t6c3NMSTFaUzZRM1kvZ2VZL25ESmxE?=
 =?utf-8?B?ckZ2eTRsQ1Z3T1RQTGppT1FiMkw2UGlKQmtyMmExaWFMTk13Wi9CSmNCMFIw?=
 =?utf-8?B?Q3RmbGt4L2s5Vk1aNmFQSzhSZFo1clo0aTF3RDI4dC9YUUQ1U3B2Uk5nbTdC?=
 =?utf-8?B?RklMYzlITzkwbXZaSWIzNk5ETnJKWm1lU0UvemVvMEV0ZVNDc05uejNFMDJB?=
 =?utf-8?B?UG1hblVpR3Bab2VNdTA0WnlzTUd3UXpjSUdGeHlONWZ1RUk0Y0JpTVUyKzFG?=
 =?utf-8?B?WE52Zm0wdzJwS1M0WXlrKy8vZ2NOTjFQSnRxUFVFaGVaSmRzaTRIMjljc0xY?=
 =?utf-8?B?MXZpUlp5b1cwQWdIMlhqK3kzV3MxKzNLVWhUL3hzNENMRFJHUVhab3ZRNkJS?=
 =?utf-8?B?alZJL1ZqdUtDdThSVGJkd05xNXVTMHlnaVlHeU94MTVBNG96Q1ZSSEgvSEEv?=
 =?utf-8?B?SnFVYitDcUp1R0h3U3VVTFIzcVFDQkwzeEdiOFJGU3YwMTRNYWF2QjNsdW1U?=
 =?utf-8?B?aVNWbWpRSlFoM3VvNC9WVVZwZ3ZGaWlGS1JOT2s2cnErZjROK1VUZFJ5MkNl?=
 =?utf-8?B?eXFIVTlpazdGS1RwWnZzK2tSa3pRNWlZTjMxQVhUM01KOVo1anRTNnA1emFS?=
 =?utf-8?Q?93Cn7FVgJw0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9226.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Um82SEYrazQyV1NsNkVQcUt4SUxIUWtxdGNmOW14OHdjQ2ROQ3ZRc1NZR1l2?=
 =?utf-8?B?YVM0cHdsWXMxb0JtSkZIaUo4YXBQbWlWZmxva09SeWQ0bWxkQzdNTkREeVlx?=
 =?utf-8?B?SGlyUGYvNUJKd3ozSS9pWE82dStmUEhLQy94YTF6eXg1VVFCY2xyWXVEdE9V?=
 =?utf-8?B?NkZtWVB5dldrS3cxNTZOK0ZMWEhacGRJOWdhdE1OZGFJRFdqdlk0d29TR3Rp?=
 =?utf-8?B?Y0FlcXBzOWUzSEdHQmNGeXczTWJBelBuSDJVcW01U1NRRitybFd4MWF6NTlw?=
 =?utf-8?B?VEYzQlF4cldnajBiWHVzV1poMURFRVpuTXRncTNvd0U5S2V5RFhabGlwdTNB?=
 =?utf-8?B?d1JqUVpDV2xLdVMyc3lkQnNyVUZkWmtYcVN0SVdiVFVyRXFOb213MSt3TGs5?=
 =?utf-8?B?K2IwL0N5Tmkya0sxSWtXQmJGNWdzTFI4dzRUa2hpbVZFNFVTSE5HMmVDL0Qy?=
 =?utf-8?B?LzJ1OEhYdjhFS2g2Qjdaa2NZa21XeGF4OCtxU3RLaHZTc0V0cjg4a3RCT2dm?=
 =?utf-8?B?SHFlNngzWWxBL1JSV3ZvU2tIQnFBT0tQOVM2UTJzU1VFeU9RckF5c0ZpS2pK?=
 =?utf-8?B?VEhMMzRURUQ3NUo3QjljRG1jbEFoQnoyZ2lQMEV0NnRQenVWbHdzTWRxTGk3?=
 =?utf-8?B?OG5LK3hRT2JaWHJrbHV6TXczdThDeW5FUDJLTzFYM2MwcEdxVmh6K1VsUFJ6?=
 =?utf-8?B?NkhrT09SL2QrSXZQU09XSnNXUlBCbEx1N2k5c2ozUXUwdDB0ZHlkSmxURi8r?=
 =?utf-8?B?QUZZRitDRlliSys0ajdUbFhISlNwdzhMbytLcitpdEV0a0JuZzNwM1VQVzNG?=
 =?utf-8?B?VXpRaDBHQTlZN1NrdXlSV0xndzYwTkZEd2FTM2lzRW83NkpYRGpPTitoQzBI?=
 =?utf-8?B?TDVnL1VtWmpmbnVJeU81UWhkUkdFV3JQZ0V0cDlaa21NVFBPVFl4U2kwbFp2?=
 =?utf-8?B?ZHZ0MmpZUC90eE9uRHR4dUpqc1NDOGVQTWIraHcwbUVGNDdvYzVtLzRmRUI5?=
 =?utf-8?B?Q052UTdXMXhhb2FpajVsdzhzNS9BdzQ4ZWZIdzh3eEFmRktQNGRWSEk0eDY4?=
 =?utf-8?B?RGhwMGlTV2FnVlBzUGVzcmk5ZVViRkJ6Nnd6ZWFRN285UnBSUXdWOHhYNDFJ?=
 =?utf-8?B?eWxleU5HY013VmxUTEZtazdIWnAzRE03WWNKOFBnTENqSTYyZ0xPOFkrVW5G?=
 =?utf-8?B?UnJSQ1dhRy9FY1NXYTFKUmo2bjVkMlVxNnZaeEk5dVhOT01FdEhMaytWN3Vn?=
 =?utf-8?B?VGozOTJpRmRXVDVTYzMxSktORjFxZzBXRnFpZEJ4MFBNRkQ3OFNaRWRZemdG?=
 =?utf-8?B?TVYxN2wxNTdSbU5VWmpUSXVTQVpZS2NHUEt3cWw2S09YVFJsM252L1VoUWlI?=
 =?utf-8?B?RktqZmtZbTk1RnlsWncrbzRVMlozRGQwWXRaYUdhVlVick56bWFOQTdUdkUw?=
 =?utf-8?B?MWcwTGJXNTJtd3Z5SGxMKzlZRFZjTVEwUHdTZ0ljcVpzOVlmbncwUGx3aGVO?=
 =?utf-8?B?UmRkNnM1anRYblJORVNLOG9LZ1hwbTdta25wYWR6WGRjT3FnOGVtTGVKWVMv?=
 =?utf-8?B?MFA0dDEwNCtlMnJpVjY1SHQ2ZGxKeUpKazhmKzdlZTltcDI0M04wQnFUa1hI?=
 =?utf-8?B?UjNpRnh4dzROTlgzMndsQUZjeWFaTTRGTm9ubmJrL1VpWUx6SkZrRld5Tng0?=
 =?utf-8?B?d2ZvdVh4aGM2R0NjKzV1SituaWcxTVRaVXppTzJYaG5nWFMzY1VqQkNMcUl1?=
 =?utf-8?B?SGFneHh2eE9Zc3U4ZjAyanNDYkFUVTJod1JXRlNRTVBFWVpsNXhwNStrMzZJ?=
 =?utf-8?B?U3lKR3k3WEl2dTdmVTNJdkk0K3M1bjR3aHV1ZnBkaVMxazZFeC9SelEzNVZt?=
 =?utf-8?B?NVEyV1dDanVDWTVvTjcrc2ttME96RVZXaXdnUXgvYk1LMEs5VmtiZW0rWEhn?=
 =?utf-8?B?N0FHYmlHMjdVUWdBYWRSR0FCZkl4QVJZWURxQXgzRE4rQXRvelc0N0h5WXd1?=
 =?utf-8?B?NjJqNGo1d1hibkdQZlQrVkRVKyt6WXpaVEF1VWJWSzNZMk9mQTNlTGd3NEFP?=
 =?utf-8?B?RmNMcW0zMHc5YjBuYXFBNW5iMThERTFGNXh2ZlVxQ0hhN3NJN09NZElCSUda?=
 =?utf-8?Q?8ut2buBKL+7ZxHIUnEo1ObVpY?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d705900-639c-4e88-6b4d-08ddfd1300c8
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9226.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 15:40:21.8798 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lwZFOvETcDoq3Yt/4ZcMv/qM6IQX1A0lYNgdG9LtwlC62exvy1G1iHYmN5bZMnHf16QbHU5ljq5jBZWgrIWmnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7565
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

--------------1uuFYeHbr0BHfCtfqGRfUQM8
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 9/24/2025 3:15 AM, Matthew Brost wrote:
> Be cautious and ensure the VF post-migration worker is not running
> during driver unload.
>
> Signed-off-by: Matthew Brost<matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 17 +++++++++++++++--
>   drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |  4 +++-
>   2 files changed, 18 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 807fdced0228..4eaffad6ebcf 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -811,7 +811,8 @@ static void xe_gt_sriov_vf_start_migration_recovery(struct xe_gt *gt)
>   
>   	spin_lock(&gt->sriov.vf.migration.lock);
>   
> -	if (!gt->sriov.vf.migration.recovery_queued) {
> +	if (!gt->sriov.vf.migration.recovery_queued ||
> +	    !gt->sriov.vf.migration.recovery_teardown) {

We're registering `vf_migration_fini` very early in the init. That means 
it will be called very late. With that in mind, is it even possible to hit?

During `xe_gt_sriov_vf_migration_init_early`, interrupts are not enabled 
yet. Doesn't that mean they are disabled already when vf_migration_fini 
is called?

Both ggtt_fini_early and guc_submit_fini should be finished by then; so 
if the recovery was running, it already crashed or errored out at this 
point.

So, maybe register the fini later? We need to `init` before IRQs are 
enabled, but for `fini` - it should be before `exec_queue_lookup` is 
torn down.

-Tomasz

>   		gt->sriov.vf.migration.recovery_queued = true;
>   		WRITE_ONCE(gt->sriov.vf.migration.recovery_inprogress, true);
>   
> @@ -1280,6 +1281,17 @@ static void migration_worker_func(struct work_struct *w)
>   	vf_post_migration_recovery(gt);
>   }
>   
> +static void vf_migration_fini(struct drm_device *drm, void *arg)
> +{
> +	struct xe_gt *gt = arg;
> +
> +	spin_lock_irq(&gt->sriov.vf.migration.lock);
> +	gt->sriov.vf.migration.recovery_teardown = true;
> +	spin_unlock_irq(&gt->sriov.vf.migration.lock);
> +
> +	cancel_work_sync(&gt->sriov.vf.migration.worker);
> +}
> +
>   /**
>    * xe_gt_sriov_vf_migration_init_early() - VF post migration init early
>    * @gt: the &xe_gt
> @@ -1308,7 +1320,8 @@ int xe_gt_sriov_vf_migration_init_early(struct xe_gt *gt)
>   	if (!xe_sriov_vf_migration_supported(gt_to_xe(gt)))
>   		xe_gt_sriov_info(gt, "migration not supported by this module version\n");
>   
> -	return 0;
> +	return drmm_add_action_or_reset(&gt_to_xe(gt)->drm,
> +					vf_migration_fini, gt);
>   }
>   
>   /**
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> index 61484c7c9a36..beb9978336bb 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> @@ -59,10 +59,12 @@ struct xe_gt_sriov_vf_runtime {
>   struct xe_gt_sriov_vf_migration {
>   	/** @migration: VF migration recovery worker */
>   	struct work_struct worker;
> -	/** @lock: Protects recovery_queued */
> +	/** @lock: Protects recovery_queued, teardown */
>   	spinlock_t lock;
>   	/** @lrc_wa_bb: Scratch memory for LRC WA BB in recovery */
>   	void *lrc_wa_bb;
> +	/** @recovery_teardown: VF post migration recovery is being torn down */
> +	bool recovery_teardown;
>   	/** @recovery_queued: VF post migration recovery in queued */
>   	bool recovery_queued;
>   	/** @recovery_inprogress: VF post migration recovery in progress */
--------------1uuFYeHbr0BHfCtfqGRfUQM8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/24/2025 3:15 AM, Matthew Brost
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20250924011601.888293-17-matthew.brost@intel.com">
      <pre wrap="" class="moz-quote-pre">Be cautious and ensure the VF post-migration worker is not running
during driver unload.

Signed-off-by: Matthew Brost <a class="moz-txt-link-rfc2396E" href="mailto:matthew.brost@intel.com">&lt;matthew.brost@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 17 +++++++++++++++--
 drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |  4 +++-
 2 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 807fdced0228..4eaffad6ebcf 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -811,7 +811,8 @@ static void xe_gt_sriov_vf_start_migration_recovery(struct xe_gt *gt)
 
 	spin_lock(&amp;gt-&gt;sriov.vf.migration.lock);
 
-	if (!gt-&gt;sriov.vf.migration.recovery_queued) {
+	if (!gt-&gt;sriov.vf.migration.recovery_queued ||
+	    !gt-&gt;sriov.vf.migration.recovery_teardown) {</pre>
    </blockquote>
    <p>We're registering `vf_migration_fini` very early in the init.
      That means it will be called very late. With that in mind, is it
      even possible to hit?</p>
    <p>During `<span style="white-space: pre-wrap">xe_gt_sriov_vf_migration_init_early`, interrupts are not enabled yet. Doesn't that mean they are disabled already when </span>vf_migration_fini
      is called?</p>
    <p><span style="white-space: pre-wrap">Both ggtt_fini_early and guc_submit_fini should be finished by then; so if the recovery was running, it already crashed or errored out at this point.</span></p>
    <p>So, maybe register the fini later? We need to `init` before IRQs
      are enabled, but for `fini` - it should be before
      `exec_queue_lookup` is torn down.</p>
    <p>-Tomasz</p>
    <blockquote type="cite" cite="mid:20250924011601.888293-17-matthew.brost@intel.com">
      <pre wrap="" class="moz-quote-pre">
 		gt-&gt;sriov.vf.migration.recovery_queued = true;
 		WRITE_ONCE(gt-&gt;sriov.vf.migration.recovery_inprogress, true);
 
@@ -1280,6 +1281,17 @@ static void migration_worker_func(struct work_struct *w)
 	vf_post_migration_recovery(gt);
 }
 
+static void vf_migration_fini(struct drm_device *drm, void *arg)
+{
+	struct xe_gt *gt = arg;
+
+	spin_lock_irq(&amp;gt-&gt;sriov.vf.migration.lock);
+	gt-&gt;sriov.vf.migration.recovery_teardown = true;
+	spin_unlock_irq(&amp;gt-&gt;sriov.vf.migration.lock);
+
+	cancel_work_sync(&amp;gt-&gt;sriov.vf.migration.worker);
+}
+
 /**
  * xe_gt_sriov_vf_migration_init_early() - VF post migration init early
  * @gt: the &amp;xe_gt
@@ -1308,7 +1320,8 @@ int xe_gt_sriov_vf_migration_init_early(struct xe_gt *gt)
 	if (!xe_sriov_vf_migration_supported(gt_to_xe(gt)))
 		xe_gt_sriov_info(gt, &quot;migration not supported by this module version\n&quot;);
 
-	return 0;
+	return drmm_add_action_or_reset(&amp;gt_to_xe(gt)-&gt;drm,
+					vf_migration_fini, gt);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
index 61484c7c9a36..beb9978336bb 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
@@ -59,10 +59,12 @@ struct xe_gt_sriov_vf_runtime {
 struct xe_gt_sriov_vf_migration {
 	/** @migration: VF migration recovery worker */
 	struct work_struct worker;
-	/** @lock: Protects recovery_queued */
+	/** @lock: Protects recovery_queued, teardown */
 	spinlock_t lock;
 	/** @lrc_wa_bb: Scratch memory for LRC WA BB in recovery */
 	void *lrc_wa_bb;
+	/** @recovery_teardown: VF post migration recovery is being torn down */
+	bool recovery_teardown;
 	/** @recovery_queued: VF post migration recovery in queued */
 	bool recovery_queued;
 	/** @recovery_inprogress: VF post migration recovery in progress */
</pre>
    </blockquote>
  </body>
</html>

--------------1uuFYeHbr0BHfCtfqGRfUQM8--
