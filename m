Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBF48D116F1
	for <intel-xe@archiver.kernel.org>; Tue,  2 Dec 2025 03:07:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ABA710E525;
	Tue,  2 Dec 2025 03:07:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ByaxmhZD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 046FD10E523
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Dec 2025 03:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764644843; x=1796180843;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UthadgIBeJlcKl9Uqtp8f64o0V4n1+FOt8yscmCH6ts=;
 b=ByaxmhZD/skv0jeeavPCplCIbNppFO4y6XNkhH96WTi3hGoQ5fOZzErl
 090gJovRf3WssB+QLt2jZLGkoa2Y20FYN1//r3rtcfNWYyAiAcWJNJ1pJ
 N/QvIIfILjWCsWZChe34ifEBzFIHJLkfqeOXRfGISM0XZxiMIyiuSmPru
 S5DQJ4Qj8y0ytKHWXP7ZSYkGW4dGQiMbqEqtt4iENgDJa/uc1Nm1QYQw+
 FsMAjZwLAhhtxVzNJzdCt9GEfC2f5/eORPXtXAV0d6qdUtB8NQ1+lsWMF
 Ji9D9oHKCe7/Zz07xuo/5UKWbiAsfmoTAPWQl+L868ikvUe82x9JftHfk Q==;
X-CSE-ConnectionGUID: bNHPS4wLSESi/ni/IjTaSQ==
X-CSE-MsgGUID: D0RTWAUCQgSwmlXHa8MHxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66638736"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="66638736"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 19:07:22 -0800
X-CSE-ConnectionGUID: wq8Hgc+pR5iKcA5O2Joblw==
X-CSE-MsgGUID: NnPiFPBbRluCrVsyWN9EGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="193532458"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 19:07:21 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 19:07:20 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 1 Dec 2025 19:07:20 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.59) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 19:07:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kW8BdNs+T8HOdR8BsCPsdzR5u4SEZh0jXgbtCkR99LmMPQb+XJVJoURu3XaA4DBXUIjxWacW2T+LozjGKkup8iF2DTbjzcnlBBWrx6jWclAeuv+vSe22f2xuRAvt/hGxpUYcL3yQ8FzAS/HXMLizAm7Ubg3CTk6ADdHcUc8RiIHYhB/dzLooGdGV007JP9KL7u5hsmR4eG+FEx7xViJHeGGsog09LVrfQac49GcqhDPyWex2UbK2I4zWwbpjSaEL42lPabC0eRqTBI3EHCnIgfXjWFUax4THmw0mLvZ8gUuFdStnalssGKRoKFe7dF6SV/jrdEisu6wnc8qYbE6ZeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hHXeY51fHUhZti5kS54/jHrZT8vrjG3gNjjoM/8G6Yk=;
 b=i70oauX+jJFmalLZvc2uCQOYlE344pocJeeJRKxBVM6t370r+bP/dGDf2qbjr22wNpwtVsJr6lV+wGdqUcO7V5cIDQn+9P184EcoO3yRMrk7+KsEgdPiPoMj2lROA8NNmu47y71tFeAvOB9h1JYa8zdRASw6zk1urn1vLhjVM2krUt1hnkntCQp+gxRRb4jwymQXUcqQWecdmCetJBArx4IBvfe2ZFk3sxDykeBazIRA4NW7kC3Gusad8HDGjP78YEIKHQ8MHAH6ERbh31nCBCizBNHTsOqbPFUbnLG2+rXZ/0a3dcOm2Co/ye6Cotakg+fvhi/egoCzQQ+jPEVWLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 IA0PR11MB7259.namprd11.prod.outlook.com (2603:10b6:208:43c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 03:07:17 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%7]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 03:07:17 +0000
Message-ID: <93501016-0e5c-4ef2-8d15-9d437c492260@intel.com>
Date: Tue, 2 Dec 2025 08:37:09 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/xe/xe_survivability: Add support for
 survivability mode v2
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>
References: <20251201143420.3158372-4-riana.tauro@intel.com>
 <20251201143420.3158372-6-riana.tauro@intel.com> <aS3T2crA95cvORV0@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <aS3T2crA95cvORV0@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0080.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ad::13) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|IA0PR11MB7259:EE_
X-MS-Office365-Filtering-Correlation-Id: e81597da-abf5-4e23-3192-08de314fe649
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S0plbFE2cjdaZ1c4TEh2RzIxdHZ2Z0hEZXVKaThJcGduREs2Z3MzTVNyZGVQ?=
 =?utf-8?B?YmpQYjJXdkp2WVdmTnk4emNoZ3Y4bzZ5K2hRM0tTVmV2SEdDVzhXMG1vK0J6?=
 =?utf-8?B?QTBjNHRhT3owRlB6TEdMclFuNFRTVXBGL0N5YXU0d3Q4dHZjQW9JZS9TZ2wr?=
 =?utf-8?B?NHFMbjdQS21VNHVUYlBzZW9NTjY2K3g3bEx1dEtRSEd6V09YbmlOM0MzSWpZ?=
 =?utf-8?B?b1BNanRjMHdGRTFyVDA4MVVaU3F0V00xSEViVExiWFBLVUJOck9pZ1Z0WG80?=
 =?utf-8?B?bzYxdXNaVzBqNnhBV2tEeWY0ZngweXFQbnVlU3cvUmVXUFl5RWIrWVhvdTVO?=
 =?utf-8?B?bnFIRktBUnlGS01nVzBTN25BVWRGTWtlV0ZmSnhySWZ5cVpUZFRKRWtsUUZu?=
 =?utf-8?B?NFBNeE9XTzE1cFViR1FuRW9pdDUwSllnZW9QaGdTMXBYNFl6Ry9nNU9UbnZp?=
 =?utf-8?B?Y2VtcHlZU09wNnl3dDdWSDhYeUl4ZzExTlhXQTBuMFBpbDd4L1hPL1p1bitm?=
 =?utf-8?B?dVBHd08zaVQ5OWpQWWtETnA1OEt0Nit1YWtxRFJSZHBsb3B5RHF5djUwcExQ?=
 =?utf-8?B?NzNmazRZQkpwekduZktFelNJNEtvWHp3L05HOGhudTBZaEdxOUdoRFVqamxs?=
 =?utf-8?B?amRNYUwydTBuRDcyUjRVMDhPakdBb1Nab25mVzJkT095L21JR09xekROWklO?=
 =?utf-8?B?L1poY1VmdUZBTHRvcUc3dktMazdjdnZDb0VkbFJSSGh6b1h0TnlEUXAvOWUv?=
 =?utf-8?B?UHZOQVNsUGw0b2lrUTlSM09Uc2IrTVlScWRPQXRKamJaUWQwUWdmcGRZUW1M?=
 =?utf-8?B?ck42RlNvUU5LNnRzUWdYbTUyUmVaRG1uWGMwNURldVphMVVhK21HZHRQbyts?=
 =?utf-8?B?aUl5Z0RqMXBVQmZ5UStYTzlQaVpRdi9KZnlVYzVGeERiM28vdlNsbmQ4Z0ha?=
 =?utf-8?B?OHd0NTFQbDd2eThHaVlTdUwwenpuditmc3hLa3FYSm54d2NmL0lxN2g5RTZB?=
 =?utf-8?B?bitpUllQYnhEWU9RbjBac1dMRGxzUWtiR2FHajdiMDN1TGVITUJQUnF2bldY?=
 =?utf-8?B?TXkrcTFlNUoyeFc5a09XV2c1S3hpczl2QTkyRG1hQmZzWktBbnRUb20yL3BN?=
 =?utf-8?B?c2FNVHRVQXR2L0R5TVNmNkcya2t3T1lUdGFya2xRTGQwSUZjRlorbE1xR29J?=
 =?utf-8?B?TlVidDE1b1BSV3VPa0hNaGZhRWoyaEtEbS9IekxIVm1wZ0FESS91OC90dFpK?=
 =?utf-8?B?aWZZLzZhZ2tQRWwwamtncHNGMTh0a3VzMFNIMkxaclJZaWdEK3VTcEFTUWF3?=
 =?utf-8?B?eXFGalNzZk5DMEtJLzZJVWYvc1BvbXJjVGxudEkzRVUyYmJSc3VSd1hWTjBs?=
 =?utf-8?B?bUhUUlNiVjhvTXhGTWVJUkRGd3J1Vm44Skt0bWcxcDR6enNzMzluQ1g0cUFn?=
 =?utf-8?B?VERHUXhiZ2FOWEtMWXN5OVB1L1plT0hwVStIVVdBVmR0eTVjZHA1cG9BMDdz?=
 =?utf-8?B?UU5tZGE3eTdvYkJkUTRZQkVCbGUzc2IyTVluaVZNcGxWYVhIaXk2UklEQ2hM?=
 =?utf-8?B?dndveFVJbzlwd2g1eFZXcTBMMmt4Qk4wWjlEN1Q4RXNjN0s0Mml2UlZnSHF6?=
 =?utf-8?B?by9oSUZGdHhIcEVXR3VPeXgyU1NMZlc3dXdKUzdYT0E2S05RQzI1c1BJZHd0?=
 =?utf-8?B?Q1dBaEovVE9aelZXdWFzYlFNRWV1RWJFYTExWW9PeWFFR2lkZGdCRVA3Z1Vv?=
 =?utf-8?B?Y3JzRFlkWkZ6ZlBMcTNaNnNTMDNHZ3J5TEVYejBCK2Fxb3ByUmQrWE9DLzFX?=
 =?utf-8?B?RHM5ZGxEaGtkbm1kK0RFbG40NkJtMnQveUFBVmlGOEJoWTFaenF4WkpRekIw?=
 =?utf-8?B?c1lnTHFrRlBhYW5MUFpzVDRndm0rQXJROXBXOUFvQy9ML005OFNoN1NUZHZt?=
 =?utf-8?Q?//ISUpn6B/1at4vEm/ZTzZtj0xCOL86A?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RzRVbEkzbi9HUUp4RHZvbUZTMXBGVmtVYkZrNjNhSGx3aExwK0w2bnFtK05Z?=
 =?utf-8?B?NTJHTTM2U3A4QXZNeGVJRnh6NTB3VlhJalBxY25xbVI3Q3d1MGxJR0NIdTVt?=
 =?utf-8?B?a1lSTTN2L0h1N1dWQXppenVXdmY4THBmOVV0eE5kZlhuLytKRW1ZdHVkazVn?=
 =?utf-8?B?VmJoem84cU9SZDA2cnlBQ1VLNTRmbTl5TUlyOXNsTzFudlVLTzkrWWgzSlg0?=
 =?utf-8?B?Z2p4RkNjTnV3S1NRNldXNUVWUlJrY1ptbWtpNldrMEsvMkhkOGMyOHJyKytu?=
 =?utf-8?B?dDNKQjUrMEdyZE96b0QwSWcreU1uUjNCZWJVZHcyQ0pOK244V01ReXpSVWdC?=
 =?utf-8?B?VXhrMFA3c1IvUGZzVXVPNG10dHY1NGNXRTdUR0ZnZmVYdjZhd2lMLzdMaVJN?=
 =?utf-8?B?Q0M3S01sTW1wYzVqK3lsc1hLYjZVbko0NFc3TmlXaW5IWXVTWkMrMFIwdUZx?=
 =?utf-8?B?MDU4ZEN5N1h5NnJZeHNaeDVKSytiMzFhLzZxekhNcEVnSkNjK1JBS0FvUmpm?=
 =?utf-8?B?NzRVODJuckt5bytEc1MvRlFSMHlFVFJPN2Z3N1QxbTJMUTVqTXVRSHhwSmhn?=
 =?utf-8?B?LzRFTks4NEdlOHpOSXNpRFE5SkJySGh3dUljdlc3TmdOejgvTGFkcDVQUXFE?=
 =?utf-8?B?SXc1N0VTR1RGYTlBUjJyaDA1RC90ZWdDYm9rakpkRmsrd25RdzVUbGNXWGNF?=
 =?utf-8?B?Z3U3QTNJQ1kzbVBIL0l1bi9UdmIwVWNhT0dwVVQ3MEpUSU11NjIrSXhmSVlJ?=
 =?utf-8?B?V3g2ak5pZDVYTUhXMytmSzcvaGVvVmdVOElrd3oxWGhud3lBWXNPTEl3bkp1?=
 =?utf-8?B?b2RNR3VNNlRkWHE4dmYzQ0FsM1Ftc0g2MXNRYUQ2SEllVkYvVTdpKzlkektO?=
 =?utf-8?B?THZzVWM3cmxhY3d5NlpmTGNrTU9lM21taGpaS1B2aWo5RSsva3lsajMveEQ0?=
 =?utf-8?B?TkpFcERYZjhlM3lLa3M1Qit2dHJMS0doNmxlcE1tWlFhNlB4QnFldjgyaytu?=
 =?utf-8?B?NmF0bTRJUVVubnpxRmtoNkM2dTZ4ZWJvTS94ZHVna1EwN2xGbGF6dmtob1Ar?=
 =?utf-8?B?MlFCZmJjZERCUkV0TjB6MVZ2SXhhbE1mbTB3Nlg5dUQ1ZU4yVkdoelZlYXNa?=
 =?utf-8?B?Q3ZocjNCemMvWDNvYUIwemphM1FQenM2T0dUS2dVRG1zOHpKYzlWSm96UkxO?=
 =?utf-8?B?c3dXa2JwYVZHRUVzS3RHRlZuckpVaUVlemkreUJDMDk0ZkUwVzB5c1F3VnVl?=
 =?utf-8?B?Q0VGc3FFbzRuWkFZaTJwK1VtUEpBaURYRVI2V0UyalJNU2NxZVFQdW9XcG5m?=
 =?utf-8?B?ck1EZ0Mva0ZaY0hTcGwxOG1YckNzSXNtOVVlWGMvVmlRVk1EamNRTmpNNkd3?=
 =?utf-8?B?anJVSVZ0Tkk3RWhKbFlTM0ZCa2U0ZWl1UWpRTkFPSGIyWitQMG5Nd3gzOTJ6?=
 =?utf-8?B?eE84S2V2RklxOUhla2FmUVpZbGhMY2t6b2FXYzRBa3RVajZIZ1VRTW53SU1C?=
 =?utf-8?B?U0hlT3d3eER6MEkrUEtRWGxCbW9XTFVJTHJZSlR0emtaMFQ4ZVR6NUtqbndN?=
 =?utf-8?B?Sms0blQ3L3ZjamRRYUlleFpUMHA1OGFnYUpPTG9iUGxTZndKM1RYeVQ1WDc3?=
 =?utf-8?B?c2lLRmZ4bUtYYmlpZXlibnNSZUZ0Nk9maEczcXNEMEVNVER2NXhZYXJOMUsv?=
 =?utf-8?B?MGVyajFsWFQ1TTJBeThUYndNMStnajVZdzRheHJCVEdzZWJWcTNZUnBxV1gr?=
 =?utf-8?B?czFBYVRrZnpwNEhjd0ZkaTV5bDFVM01FME9MdER4aCt5eFJoRUdNZkhlVnlR?=
 =?utf-8?B?UHkyVHVaNzNhb281OUN5YTZZLzUvZm5CY0l1dWVRZDZHdThsM3pic1hLS2lo?=
 =?utf-8?B?QXM2NFhWVjA3ZUpPUytzOXphWGVPQWVaZnhEYXRkSk9qQW1PeU1SSjN0eWxL?=
 =?utf-8?B?bmtWdkQwTnlVNGlBakxJVXIveG9OdjBYZkoyMU50T24zZkxZd2dzT2FXTDZa?=
 =?utf-8?B?YktMd1FXbHpWV3loZk1xSmJ1T0NCUFdFakFsMHpoR1AzTkF3YVpadzNLOHBD?=
 =?utf-8?B?YytsZkgrL0tDMzF2KzJSWXBPUjV6VnRUYVJXTldkOFloR0xndDQxNkNtdEVQ?=
 =?utf-8?Q?JTgPjxPkNjqDinz8LO+BCgur6?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e81597da-abf5-4e23-3192-08de314fe649
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 03:07:17.3101 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wa6VthI7ct78MGyveRuKMmDrwCCi/bm+6jSdeHyVWFDptl/3zk2V6Hnqde2Y/p7vDyEi73ho61BK+MlUNV7Ykw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7259
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



On 12/1/2025 11:13 PM, Rodrigo Vivi wrote:
> On Mon, Dec 01, 2025 at 08:04:23PM +0530, Riana Tauro wrote:
>> v2 survivability breadcrumbs introduces a new mode called
>> SPI Flash Descriptor Override mode (FDO). This is enabled by
>> PCODE when MEI itself fails and firmware cannot be updated via
>> MEI using igsc. This mode provides the ability to update
>> the firmware directly via SPI driver.
>>
>> Xe KMD initializes the nvm aux driver if FDO mode is enabled.
>>
>> Userspace should check FDO mode entry in survivability info sysfs before
>> using the SPI driver to update firmware.
>>
>> 	/sys/bus/pci/devices/<device>/survivability_info/fdo_mode
>>
>> v2 also supports survivability mode for critical boot errors.
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>> v2: do not exit survivability mode in case of mei init failure (Rodrigo)
> 
> I still see the goto err there, what am I missing?
> I mean, no strong feeling about what is right or wrong to do here,
> I just want to make sure the code matches the doc and expectations...

PCODE enables FDO mode when mei has some failure and firmware flashing 
cannot be done using igsc. In FDO mode, XE KMD initializes the SPI driver.

If initialization of SPI driver fails, then user cannot update through 
igsc or using spi driver. In this case, there wouldn't be any reason to
stay in survivability mode. The goto err is to fail probe.

I have mentioned in documentation that 'FDO is enabled only when MEI 
fails'. Is there something else i am missing?

Thanks
Riana

> 
>> ---
>>   drivers/gpu/drm/xe/xe_pcode_api.h             |  2 +
>>   drivers/gpu/drm/xe/xe_survivability_mode.c    | 44 ++++++++++++++++---
>>   .../gpu/drm/xe/xe_survivability_mode_types.h  |  6 +++
>>   3 files changed, 46 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
>> index 70dcd6625680..975892d6b230 100644
>> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
>> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
>> @@ -77,11 +77,13 @@
>>   
>>   #define PCODE_SCRATCH(x)		XE_REG(0x138320 + ((x) * 4))
>>   /* PCODE_SCRATCH0 */
>> +#define   BREADCRUMB_VERSION		REG_GENMASK(31, 29)
>>   #define   AUXINFO_REG_OFFSET		REG_GENMASK(17, 15)
>>   #define   OVERFLOW_REG_OFFSET		REG_GENMASK(14, 12)
>>   #define   HISTORY_TRACKING		REG_BIT(11)
>>   #define   OVERFLOW_SUPPORT		REG_BIT(10)
>>   #define   AUXINFO_SUPPORT		REG_BIT(9)
>> +#define   FDO_MODE			REG_BIT(4)
>>   #define   BOOT_STATUS			REG_GENMASK(3, 1)
>>   #define      CRITICAL_FAILURE		4
>>   #define      NON_CRITICAL_FAILURE	7
>> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
>> index b5b582442637..8d409bc9c14b 100644
>> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
>> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
>> @@ -16,6 +16,7 @@
>>   #include "xe_heci_gsc.h"
>>   #include "xe_i2c.h"
>>   #include "xe_mmio.h"
>> +#include "xe_nvm.h"
>>   #include "xe_pcode_api.h"
>>   #include "xe_vsec.h"
>>   
>> @@ -66,6 +67,11 @@
>>    *
>>    * - ``aux_info<n>`` : Some failures have additional debug information
>>    *
>> + * - ``fdo_mode`` : To allow recovery in scenarios where MEI itself fails, a new SPI Flash
>> + *   Descriptor Override (FDO) mode is added in v2 survivability breadcrumbs. This mode is enabled
>> + *   by PCODE and provides the ability to directly update the firmware via SPI Driver without
>> + *   any dependency on MEI. Xe KMD initializes the nvm aux driver if FDO mode is enabled.
>> + *
>>    * Runtime Survivability
>>    * =====================
>>    *
>> @@ -94,6 +100,8 @@ static const char * const reg_map[] = {
>>   	[AUX_INFO4]               = "Auxiliary Info 4",
>>   };
>>   
>> +#define FDO_INFO	(MAX_SCRATCH_REG + 1)
>> +
>>   struct xe_survivability_attribute {
>>   	struct device_attribute attr;
>>   	u8 index;
>> @@ -127,6 +135,11 @@ static void populate_survivability_info(struct xe_device *xe)
>>   	set_survivability_info(mmio, info, CAPABILITY_INFO);
>>   	reg_value = info[CAPABILITY_INFO];
>>   
>> +	survivability->version = REG_FIELD_GET(BREADCRUMB_VERSION, reg_value);
>> +	/* FDO mode is exposed only from version 2 */
>> +	if (survivability->version >= 2)
>> +		survivability->fdo_mode = REG_FIELD_GET(FDO_MODE, reg_value);
>> +
>>   	if (reg_value & HISTORY_TRACKING) {
>>   		set_survivability_info(mmio, info, POSTCODE_TRACE);
>>   
>> @@ -188,6 +201,9 @@ static ssize_t survivability_info_show(struct device *dev,
>>   	struct xe_survivability *survivability = &xe->survivability;
>>   	u32 *info = survivability->info;
>>   
>> +	if (sa->index == FDO_INFO)
>> +		return sysfs_emit(buff, "%s\n", str_enabled_disabled(survivability->fdo_mode));
>> +
>>   	return sysfs_emit(buff, "0x%x\n", info[sa->index]);
>>   }
>>   
>> @@ -205,13 +221,18 @@ SURVIVABILITY_ATTR_RO(aux_info1, AUX_INFO1);
>>   SURVIVABILITY_ATTR_RO(aux_info2, AUX_INFO2);
>>   SURVIVABILITY_ATTR_RO(aux_info3, AUX_INFO3);
>>   SURVIVABILITY_ATTR_RO(aux_info4, AUX_INFO4);
>> +SURVIVABILITY_ATTR_RO(fdo_mode, FDO_INFO);
>>   
>>   static void xe_survivability_mode_fini(void *arg)
>>   {
>>   	struct xe_device *xe = arg;
>> +	struct xe_survivability *survivability = &xe->survivability;
>>   	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>>   	struct device *dev = &pdev->dev;
>>   
>> +	if (survivability->fdo_mode)
>> +		xe_nvm_fini(xe);
>> +
>>   	device_remove_file(dev, &dev_attr_survivability_mode);
>>   }
>>   
>> @@ -222,7 +243,10 @@ static umode_t survivability_info_attrs_visible(struct kobject *kobj, struct att
>>   	struct xe_survivability *survivability = &xe->survivability;
>>   	u32 *info = survivability->info;
>>   
>> -	if (info[idx])
>> +	/* FDO mode is visible only when supported */
>> +	if (idx >= MAX_SCRATCH_REG && survivability->version >= 2)
>> +		return 0400;
>> +	else if (info[idx])
>>   		return 0400;
>>   
>>   	return 0;
>> @@ -238,6 +262,7 @@ static struct attribute *survivability_info_attrs[] = {
>>   	&attr_aux_info2.attr.attr,
>>   	&attr_aux_info3.attr.attr,
>>   	&attr_aux_info4.attr.attr,
>> +	&attr_fdo_mode.attr.attr,
>>   	NULL,
>>   };
>>   
>> @@ -287,12 +312,16 @@ static int enable_boot_survivability_mode(struct pci_dev *pdev)
>>   	/* Make sure xe_heci_gsc_init() knows about survivability mode */
>>   	survivability->mode = true;
>>   
>> -	ret = xe_heci_gsc_init(xe);
>> -	if (ret)
>> -		goto err;
>> +	xe_heci_gsc_init(xe);
>>   
>>   	xe_vsec_init(xe);
>>   
>> +	if (survivability->fdo_mode) {
>> +		ret = xe_nvm_init(xe);
>> +		if (ret)
>> +			goto err;
>> +	}
>> +
>>   	ret = xe_i2c_probe(xe);
>>   	if (ret)
>>   		goto err;
>> @@ -302,6 +331,7 @@ static int enable_boot_survivability_mode(struct pci_dev *pdev)
>>   	return 0;
>>   
>>   err:
>> +	dev_err(dev, "Failed to enable Survivability Mode\n");
>>   	survivability->mode = false;
>>   	return ret;
>>   }
>> @@ -408,8 +438,10 @@ int xe_survivability_mode_boot_enable(struct xe_device *xe)
>>   
>>   	populate_survivability_info(xe);
>>   
>> -	/* Log breadcrumbs but do not enter survivability mode for Critical boot errors */
>> -	if (survivability->boot_status == CRITICAL_FAILURE) {
>> +	/*
>> +	 * v2 supports survivability mode for critical errors
>> +	 */
>> +	if (survivability->version < 2  && survivability->boot_status == CRITICAL_FAILURE) {
>>   		log_survivability_info(pdev);
>>   		return -ENXIO;
>>   	}
>> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode_types.h b/drivers/gpu/drm/xe/xe_survivability_mode_types.h
>> index f31b3907d933..bd5dc1c955ff 100644
>> --- a/drivers/gpu/drm/xe/xe_survivability_mode_types.h
>> +++ b/drivers/gpu/drm/xe/xe_survivability_mode_types.h
>> @@ -44,6 +44,12 @@ struct xe_survivability {
>>   
>>   	/** @type: survivability type */
>>   	enum xe_survivability_type type;
>> +
>> +	/** @fdo_mode: indicates if FDO mode is enabled */
>> +	bool fdo_mode;
>> +
>> +	/** @version: breadcrumb version of survivability mode  */
>> +	u8 version;
>>   };
>>   
>>   #endif /* _XE_SURVIVABILITY_MODE_TYPES_H_ */
>> -- 
>> 2.47.1
>>

