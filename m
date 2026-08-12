Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D23AC5AD5A
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 04:47:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4CD910E3C8;
	Wed, 12 Aug 2026 04:47:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kOWxy1p7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9627D10E3C8
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Aug 2026 04:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786510033; x=1818046033;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=aAb+1skyeWMK/lOBusEzunKXhA9nv0tpV7aOZY5YWBM=;
 b=kOWxy1p7yJs+QUWfDcr2xGFKQEOPWtWgfyG5R09WEZ+gcmClDzhaq8EP
 oIAozIa1dsm4kUDJclv9/it3UR2wGjAw5wTD2+Ickvd2KLAY/NKRMv7x5
 s1TcBZNjSjl1j9L1/i5dp8mMRFUzhnxivBkIWdUejcxO+qgba28eLrV3A
 Z0z4x+WGWxs1+1xvBn044qEt3BInJ285liNcPGUSd/OAa2OVsQhZiHuGg
 Ur1zpAMx6VImCneUwWaHILWd9P+k8HcLndYhNMF2657OA4fM76T0D7LZm
 +jFfZkwrg5F6+mcS44XofWIyJYYVC38ozzkuYJBYCT3vafnyBhTqzzM+2 Q==;
X-CSE-ConnectionGUID: uIjpUnpuS/uoEhhxr5Tr8w==
X-CSE-MsgGUID: 5OFmVo19QYmmAiGODFND9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="86009224"
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; d="scan'208,217";a="86009224"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 21:47:13 -0700
X-CSE-ConnectionGUID: aKNFfiH+Rg6PQjZlBMJbyA==
X-CSE-MsgGUID: tKS7IEVFQgu2WNEZNdTTVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; 
 d="scan'208,217";a="262217003"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 21:47:13 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 11 Aug 2026 21:47:12 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 11 Aug 2026 21:47:12 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.42) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 11 Aug 2026 21:47:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JRSL83Zez/kyIEdsIFgzaNGc8eoiz50/ta9hw7VMIzaZica7/zed9SZYiBfacOlwIHBsMOJW4PcIueVUZY36WTM5QgvrATVkM3G6wJYQU6nhjDohnA3bqBeyDhf7iIV07Pd2+lSB5RICsjvby/Y4zqoRU+W6coaCCFAdTddI4jOhKEfJr+KETyyztfdq9ZJ1anwRZ46tJj0xV/wVM/+fiC2EXfyYwim6sLyuUEIQN8XFrBAzKk9GuboNrHHYXJ2pptaGoM3HGXpJEmMpWninnkjHuQxV7CC22GL4ECzXPAuvw+Sn9dUYf9/BfOWzE7AD4scgtWcbkUnt2vqTA1pM6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vi2wjtUpSFLHzvfdfdgJnxVGh541ZI6ZOx0kEw/T4fQ=;
 b=tibE8NllW7YLQuqAKnl82TAavAB8CJsbJMRQ+Ll9PaJ4Y+INd4JgwNUZ+3Iq1ZtioY0QfO2jTrhRdbONMNV9i5RmEqrv6lFsu42QpWo3BeEiDkDrZY+PobSO8HlpzMKXrpcp1xLjtnhVwR/JnKbkHgBEUpK7JjCzJbfkAgJ7DqMFV9WpNNdFIlAMx5k9TKfPQh+nb+aMPPImUnQ9tZCOjBAX37CHANZPyLEJ9Vvg52+KY/Tv1SmE9r4E/haP/U5dZl17j8HgtPGP7j0cirSnAJHxKTHBqA/WDi/Dz303/0UhLoHtMFFfRU7Sw7UdP0LN8Mi5eWXmAhDbUDQhfN9Blg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by DS6PR11MB795166.namprd11.prod.outlook.com (2603:10b6:8:529::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Wed, 12 Aug
 2026 04:47:11 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.21.0292.024; Wed, 12 Aug 2026
 04:47:10 +0000
Content-Type: multipart/alternative;
 boundary="------------mwbMPz0aCx0TgRR02FnNZYAf"
Message-ID: <1f767000-73da-4075-8577-374ddf1cf9fa@intel.com>
Date: Wed, 12 Aug 2026 10:17:03 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 18/23] drm/xe: Report 'Survivability Mode' errors using
 SIGID
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>, Summers Stuart <stuart.summers@intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Riana Tauro
 <riana.tauro@intel.com>, Aravind Iddamsetty <aravind.iddamsetty@intel.com>
References: <20260730152121.576-1-michal.wajdeczko@intel.com>
 <20260730152121.576-19-michal.wajdeczko@intel.com>
 <ca3dd4a6-91f9-410e-8142-53256de9e817@intel.com>
 <092a6287-e2ff-478c-8d33-ca65ed5b3c30@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <092a6287-e2ff-478c-8d33-ca65ed5b3c30@intel.com>
X-ClientProxiedBy: MA5PR01CA0129.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d5::15) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|DS6PR11MB795166:EE_
X-MS-Office365-Filtering-Correlation-Id: e333e9aa-93a8-48b6-c11f-08def82cc54c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|10067099003|11063799006|4143699003|56012099006|6133799003|22082099003|18002099003|8096899003|13003099007;
X-Microsoft-Antispam-Message-Info: MU9u4p9z9eQ6s9hVjFagXWEC0LD9UDcjb0XxaOww702DuIGvc2uRH6Zw5aA5d9vuZevhVlHMuxern6tHrr4EelXuEIp1P93BVeBlRqchAuI7vEVoBzNq9lLdSeBL+pkQLWb4Eh/IW9Gk6CIrlzvjxKEIiqYdeNjkOvmPCaCVaM8BwaIVBN1IOSUYRSoYnTzJ6s/h6XEmLVt9lbhSNr4ATiU9gQ8bFA5ok4jY6PNP35SXRzr612Ix/PrfLKAYMxY3u7r5nR7p6M6Gcw2oXDCg/vSmF9WhXcuotkGwERt7Ah87tENty92NTTeQ5PIpLNDjjig5zdfFGNO0fcDt9+jNuyXaTg9prU4ShL2inNlepdQE0lv8FcOP6rpnbKJITXceAjEHklOx301EENNWSUNHYpSbC/46FNgQ7lkYC0MZ9AEsWPAmi5eUbREvyTJpRvp/y8Qj7BWmcHOXXwlmilVUR63L+9ho1jtFa2AkIYpyFwSPPbj9/DdGITtk7aizwmKHNAk7V52c5tPjAul1wDOOko4uRUFrg5API1Pm0OH4i92YXnFzYvX942kgvqVT6bRe3GC3h/8nUXpoIlwh8WpIkPS4hbWJAlG3SJVaoFKnQ2J8EVVNw+enjeRaUUXgOFIK
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(10067099003)(11063799006)(4143699003)(56012099006)(6133799003)(22082099003)(18002099003)(8096899003)(13003099007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OER0YTJTcGJJSHlhR0FwWFg4N3p4bDZ3Y1paN2pBY3VrNmRwcWRXV0IyNksw?=
 =?utf-8?B?ZkJZZ3FkYVBhSFBIZzljMDJzc2VyM09IRCtLcDRNa1Byek10SEJNSERpQTdM?=
 =?utf-8?B?TnU2N2hOM1c5emY1ZTVuU0kxU2VHUytUV2VoMStPa3ZpUDk3WWI5NTE0VXJZ?=
 =?utf-8?B?Njl0c3AwL1BkSTI3UmphZkFpRDZKMllNSTdkak1OSXJpdkFVN3dWeG5qMU85?=
 =?utf-8?B?RWNXSjVRS2RwNlI1UjdSVk5mdGROY2VzM0lIN25iYk9PVzFOUm1uT1NXNkdZ?=
 =?utf-8?B?MTgxODFRZzhVaGRoeFBieUJVaTd0QmRVQmJVelFPYUZ6anB6bDJzUU9EZ3ds?=
 =?utf-8?B?aENBN1hyZ2RpUXRDRERMVS8vMnY4YlVZUXcrZXRTQ3BaTUdLbHc1OVpQZ2dl?=
 =?utf-8?B?Z3lqSlFweGZvUG9KM0pWQUlqMmk1b1pETWxPWGFjQVZ5dms1a1dIelFTMDRm?=
 =?utf-8?B?TnlZYlhxcmM3Tm1YcWMweXZMc2kvUzduM2xjQ3NMMVh4K1JmOThQc0Fua1RB?=
 =?utf-8?B?YzJhYUdBSFpBNTNYTWljZ0xMNTZzOVp6TFBWYXdmUnMyMGlNQVYzeHJJbDlo?=
 =?utf-8?B?cHVLUXl3UzQ4WUdnZ0VkVE9wTzVzRjE5ZGgxeUpJUkFUbUliVWo2NDFpTVBT?=
 =?utf-8?B?dlUxQTV5Z0hvREpsL1FqK20wMmJSaUVPWGRMek9wdmZvenJFM1lIei96R1Z5?=
 =?utf-8?B?eFNMZUR3eVN0cHRNcy90TjdFVFBZMmVZU2p5UE1VZEwzWUFzVFVuVlhMZTNR?=
 =?utf-8?B?UittNHlndXpFTXFrM3NUTTltazNscnFmMGJGUDJ3ekJXUUs1QU1IcTlyNUF3?=
 =?utf-8?B?WWRmWlVrTHZTeGRWelJmRkdiNC9IK1pFekdKanVma1ExTSt4YXI5Qjd1bFBT?=
 =?utf-8?B?ZDdadlNyclJEd3NaemVQVDRQUi96NDVtZ3hjcnRYelg5TFRyQi8vTTBlczF3?=
 =?utf-8?B?SW5jMlFZUnlYb2FVZDZHbDhOM2JCMHBQeWw0amF2VXVrMG9yU0NCc01tWGQ4?=
 =?utf-8?B?ZW42SVpUQXRHWW9UcVNHUU1NaUJjSXV5Vkt2L1BPU0dPRVZkUHRYdnU1Qnc4?=
 =?utf-8?B?bEUycGJ5Z1dObHljN2JteW5LTE56ZDJjNFVYVUJmTWRnU040RUlhOG4rUXZq?=
 =?utf-8?B?RUpOY2s4NjRjY2ZpVFNwbzJoOXdBNk1iWm1XNDg1VHduQzEzNjQyaEhxSThw?=
 =?utf-8?B?YnJoWlNaUlBtTHZlOTdjMXRhdlNZdXJNNWZDN0Y3QmcyNVgyUUg0djFqYlBR?=
 =?utf-8?B?eVFhM096T2Vvc2trUkJxWnk2bTV3UEszU0xVSitxMGY2NkR1WlpWZitRdmhs?=
 =?utf-8?B?ZGVTb1FsZHJMVDVESStRaU82UmVYak9PSVhQZDZrd2VEWjdkaWZKN3JjdFp6?=
 =?utf-8?B?MjBEbU9LM0lUUXlJNWxhZEVBOXFEMm5sL3ZCeVlXbktPRDhFNmwvNklPYXJO?=
 =?utf-8?B?UnRDKzBMcGZzZ3hQVmdiQ0F2RDY3K0oybXlMTVBDOWZJOWk4ZkcvWFNzUm5m?=
 =?utf-8?B?UzdPODhlTm5NVDROdGZXRnp4RGVZaXE2YlErMExQUXBTZjY0VlNxMmJONWlO?=
 =?utf-8?B?Rk53Vjg5bTJLS0ZYZ0x4bHBES05qWEI5WWNxaXNseDZ2SzRkY2QyU0ViVlQx?=
 =?utf-8?B?Q25uZXk2aE1qK2hTeEhINmU2N2Z0dWN6QjFXQjFQNlJFMTZadXpiT1AwdEtF?=
 =?utf-8?B?bGVhOWZkdTBxcXVQVndNZ0Q0YjNQRzR6M2VBR0x3ZW04U1ZlV2RlQTVrWC9q?=
 =?utf-8?B?YU5MM3NYQU41ZHR4cTRhSTRxRzU0VU16VUVqcjJxTWt3NUhBVW0zRE5vbXR0?=
 =?utf-8?B?M01nRXExNGkvNWJzdEtXZzYyeWMwL2xrR29iYTUyNlR5aTI1OUJ6KzNETUl0?=
 =?utf-8?B?TGxYeFpteGFsR0VkVFhDVEhTQ2dickhKU3k5RUczWGxjUkFCUkFRV1l0OTN2?=
 =?utf-8?B?UzlMWTdYWWdTQ0ZmS1VYbmNsV2xlUFk0aVNEU3pzcFgySlNNbVBpRmVlc29x?=
 =?utf-8?B?OHVRekp5RFRUdFdTNnFvdFFPK1JFRVdPT3NqV0UvUVNtbDBFNm9Ha0dEblJD?=
 =?utf-8?B?TS9aQTJCVlY5Rm5ZSks2TEFuY1B2M29ScC8zeEJWMVRNZURVd1B3ODRhUk9y?=
 =?utf-8?B?QlVtVFVtVUFuQXhtVVR5cTl1M0pWM3VaaCtvdWNTV0k1b0Rlbk92Umphd0tZ?=
 =?utf-8?B?L3JmV2Q1OTE5TGhaaDk1ODhONVpWNjNaWU56ZHo4UlBpSkFuTHVjOUZJMkc1?=
 =?utf-8?B?eTdjNzJPeDgzbE1vb0laZHgzQ0tpZEZ1SUtDSEdlaGk5SWcydlBhbmdJb003?=
 =?utf-8?B?YVd6WGk2UWVwZnkrTkNSMG0xcWNLUTlLdHExVGM1dFJWVDZDdVJXYkdqZ2dK?=
 =?utf-8?Q?gW3Gczpt5hKOqDyo=3D?=
X-Exchange-RoutingPolicyChecked: pJGT/kXVCiPVwCinO1UaKQ6C+uD3rnNlO+YTLkoSEN5TK/bbEZTzo0m0Xogb5W+ZuvUxK01fvHQjlYyMIQzFxUuvtfWu+qGf6Aa2G2qrz5tXw3UQcgOgYF2QkVSIpmB77L4+bOT5W/FHW1jWWZSFq8Ii1fLf23JvH1q+g7t8+iexBv36W3aqgaJEM+S2VCv3hy1IsTcY2zh3AsYNCSjRwi+dLbGw42oynzWRRnKapkMuCmyX3n4j+yCK7H8Q3VC8B6mJYcuAha8h3bQ+sAzr+71HSbHcTOIhHilhl62aBH5fmPPBu3J440HCXJwxq54vYRbE8VH4mQNik5jj+hQuug==
X-MS-Exchange-CrossTenant-Network-Message-Id: e333e9aa-93a8-48b6-c11f-08def82cc54c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 04:47:10.8520 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GLZMRZhpn226tx/aA/5ErsS+qJb2Ny9usL1T89+la7geZwXX2yr0qw3saXqFOyHwHxKW2JHborcpimk48cbWDwh5DXQhBq8kj8plvZiwLbo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR11MB795166
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

--------------mwbMPz0aCx0TgRR02FnNZYAf
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 07-08-2026 05:44 pm, Michal Wajdeczko wrote:
>
> On 8/7/2026 1:18 PM, Mallesh, Koujalagi wrote:
>> On 30-07-2026 08:51 pm, Michal Wajdeczko wrote:
>>> Report various 'Survivability Mode' errors using xe_log() helpers.
>>>
>>> Signed-off-by: Michal Wajdeczko<michal.wajdeczko@intel.com>
>>> Cc: Rodrigo Vivi<rodrigo.vivi@intel.com>
>>> Cc: Riana Tauro<riana.tauro@intel.com>
>>> Cc: Aravind Iddamsetty<aravind.iddamsetty@intel.com>
>>> Cc: Mallesh Koujalagi<mallesh.koujalagi@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_survivability_mode.c | 24 +++++++++++++---------
>>>   1 file changed, 14 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
>>> index 4c506027fa94..788b7e8137a9 100644
>>> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
>>> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
>>> @@ -14,9 +14,11 @@
>>>   #include "xe_device.h"
>>>   #include "xe_heci_gsc.h"
>>>   #include "xe_i2c.h"
>>> +#include "xe_log.h"
>>>   #include "xe_mmio.h"
>>>   #include "xe_nvm.h"
>>>   #include "xe_pcode_api.h"
>>> +#include "xe_printk.h"
>>>   #include "xe_vsec.h"
>>>   
>>>   /**
>>> @@ -179,11 +181,11 @@ static void log_survivability_info(struct pci_dev *pdev)
>>>   	u32 *info = survivability->info;
>>>   	int id;
>>>   
>>> -	dev_info(&pdev->dev, "Survivability Boot Status : Critical Failure (%d)\n",
>>> -		 survivability->boot_status);
>>> +	xe_log_info(xe, SURVIVABILITY, "Boot Status : Critical Failure (%d)\n",
>>> +		    survivability->boot_status);
> btw, is it OK that we use INFO level for "critical failure" ?

Good catch! We log the message when the device has a critical boot 
failure and the survivability is too old to handle if (version < 2)

so the driver is about to abort with -ENXIO. Using xe_log_info for that 
situation is wrong one. Using

xe_log_err_fatal(xe, SURVIVABILITY, -ENXIO, ...); we can fix it.

>
>>>   	for (id = 0; id < MAX_SCRATCH_REG; id++) {
>>>   		if (info[id])
>>> -			dev_info(&pdev->dev, "%s: 0x%x\n", reg_map[id], info[id]);
>>> +			xe_log_info(xe, SURVIVABILITY, "%s: 0x%x\n", reg_map[id], info[id]);
>>>   	}
>>>   }
>>>   
>>> @@ -316,7 +318,6 @@ static int create_survivability_sysfs(struct pci_dev *pdev)
>>>   
>>>   static int enable_boot_survivability_mode(struct pci_dev *pdev)
>>>   {
>>> -	struct device *dev = &pdev->dev;
>>>   	struct xe_device *xe = pdev_to_xe_device(pdev);
>>>   	struct xe_survivability *survivability = &xe->survivability;
>>>   	int ret = 0;
>>> @@ -342,12 +343,12 @@ static int enable_boot_survivability_mode(struct pci_dev *pdev)
>>>   	if (ret)
>>>   		goto err;
>>>   
>>> -	dev_err(dev, "In Survivability Mode\n");
>>> -
>>> +	xe_log_emit(pdev, check_boot_failure(xe) ? CPER_SEV_FATAL : CPER_SEV_INFORMATIONAL,
>>> +		    XE_SIGID_SURVIVABILITY, 0, 0, 0, 0, "In Survivability Boot Mode\n");
>> Please make it cleaner and simpler.
> sure
>
> it was one of the earliest examples of the new xe_log API,
> and that's why it was using the base xe_log function
>> if(check_boot_failure(xe))
>>
>>      xe_log_err_fatal(xe, SURVIVABILITY, .. );
>>
>> else
>>
>>       xe_log_info(xe, SURVIVABILITY, .. );
>>
>>
>> OR
>>
>> xe_log_emit(xe_any_to_pdev(xe),
> we do have pdev already, no need to cast back to xe
Agreed!
>
>>              check_boot_failure(xe) ? CPER_SEV_FATAL : CPER_SEV_INFORMATIONAL,
>>              XE_SIGID_SURVIVABILITY, XE_LOG_COMPONENT_SURVIVABILITY,
>>              xe_log_location(xe),
>>              &survivability->boot_status, sizeof(survivability->boot_status),
> cool, but isn't this already printed in log_survivability_info() ?
it's not print both, either it print log_survivability_info() (based on 
condition and return) or enable_boot_survivability_mode.
>
>>              "In Survivability Boot Mode\n");
> btw, as we use SURVIVABILITY component, the dmesg will already
> have "SURVIVABILITY: " decoration, so maybe this msg should be:
>
> 	"Boot mode enabled!\n"
>
> with dmesg:
>
> 	<3> [drm] ERROR SIGID=103 FATAL (04) SURVIVABILITY: Boot mode enabled!
> or
> 	<6> [drm] SIGID=103 SURVIVABILITY: Boot mode enabled!
Agreed!
>
>>>   	return 0;
>>>   
>>>   err:
>>> -	dev_err(dev, "Failed to enable Survivability Mode\n");
>>> +	xe_log_err_fatal(xe, SURVIVABILITY, ret, "Failed to enable Survivability Mode\n");
> and here:
>
> 	"Failed to enter Boot mode!\n"
>
> with dmesg:
>
> 	<3> [drm] ERROR SIGID=103 FATAL (-ENOMEM) SURVIVABILITY: Failed to enter Boot mode!
>
Make sense.
>>>   	survivability->mode = false;
>>>   	return ret;
>>>   }
>>> @@ -412,7 +413,7 @@ void xe_survivability_mode_runtime_enable(struct xe_device *xe)
>>>   	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>>>   
>>>   	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe) || xe->info.platform < XE_BATTLEMAGE) {
>>> -		dev_err(&pdev->dev, "Runtime Survivability Mode not supported\n");
>>> +		xe_log_info(xe, SURVIVABILITY, "Runtime Mode not supported!\n");
>> We can add xe_log_err(xe, SURVIVABILITY, -EOPNOTSUPP, ...);
> hmm, actually I was wondering if this dev_err() was correct
> maybe it should be just xe_dbg() as we are not doing anything
> related to SURVIVABILITY ?

That function is called in runtime survivability, so debugger will get 
the context easily and figure it out

what cause it.

>
>>>   		return;
>>>   	}
>>>   
>>> @@ -422,11 +423,14 @@ void xe_survivability_mode_runtime_enable(struct xe_device *xe)
>>>   		dev_err(&pdev->dev, "Failed to create survivability sysfs\n");
>> need to use xe_log_err(xe, SURVIVABILITY. -EIO, ... );
>>>   
>>>   	survivability->type = XE_SURVIVABILITY_TYPE_RUNTIME;
>>> -	dev_err(&pdev->dev, "Runtime Survivability mode enabled\n");
>>> +	xe_log_err_fatal(xe, SURVIVABILITY, 0, "Runtime Mode enabled!\n");
>> hmm, Logging error as fatal, however passing err=0 (Success). is it right? or simply we can log as xe_log_err or xe_log_info ? any thoughts.
Already I checked with Arch team, better to provide as xe_log_info 
rather than fatal. Just indicate to user it's Runtime survivability mode 
in such case.
> passing 0 instead of errno to xe_log_err() helpers will just omit
> printing anything in ( ), no %pe nor %phN
>
> whether this should be info/fatal/recoverable it's not me to answer
> your initial documentation [1] was saying that all XE_SIG_SURVIVABILITY
> should have CPER_SEV_FATAL
>
> [1]https://patchwork.freedesktop.org/patch/732271/?series=168333&rev=1
>
>>>   
>>>   	xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_VENDOR);
>>>   	xe_device_declare_wedged(xe);
>>> -	dev_err(&pdev->dev, "Firmware flash required, Please refer to the userspace documentation for more details!\n");
>>> +
>>> +	xe_log_err_fatal(xe, SURVIVABILITY, 0, "Firmware flash required!\n");
>> ditto
> ditto ;)
ditto ;)
>>> +	xe_info(xe, "Please refer to the userspace documentation for more details how to flash the firmware on %s!\n",
>>> +		xe->info.platform_name);
>>>   }
>>>   
>>>   /**
--------------mwbMPz0aCx0TgRR02FnNZYAf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 07-08-2026 05:44 pm, Michal
      Wajdeczko wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:092a6287-e2ff-478c-8d33-ca65ed5b3c30@intel.com">
      <pre wrap="" class="moz-quote-pre">

On 8/7/2026 1:18 PM, Mallesh, Koujalagi wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
On 30-07-2026 08:51 pm, Michal Wajdeczko wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">Report various 'Survivability Mode' errors using xe_log() helpers.

Signed-off-by: Michal Wajdeczko <a class="moz-txt-link-rfc2396E" href="mailto:michal.wajdeczko@intel.com">&lt;michal.wajdeczko@intel.com&gt;</a>
Cc: Rodrigo Vivi <a class="moz-txt-link-rfc2396E" href="mailto:rodrigo.vivi@intel.com">&lt;rodrigo.vivi@intel.com&gt;</a>
Cc: Riana Tauro <a class="moz-txt-link-rfc2396E" href="mailto:riana.tauro@intel.com">&lt;riana.tauro@intel.com&gt;</a>
Cc: Aravind Iddamsetty <a class="moz-txt-link-rfc2396E" href="mailto:aravind.iddamsetty@intel.com">&lt;aravind.iddamsetty@intel.com&gt;</a>
Cc: Mallesh Koujalagi <a class="moz-txt-link-rfc2396E" href="mailto:mallesh.koujalagi@intel.com">&lt;mallesh.koujalagi@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_survivability_mode.c | 24 +++++++++++++---------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
index 4c506027fa94..788b7e8137a9 100644
--- a/drivers/gpu/drm/xe/xe_survivability_mode.c
+++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
@@ -14,9 +14,11 @@
 #include &quot;xe_device.h&quot;
 #include &quot;xe_heci_gsc.h&quot;
 #include &quot;xe_i2c.h&quot;
+#include &quot;xe_log.h&quot;
 #include &quot;xe_mmio.h&quot;
 #include &quot;xe_nvm.h&quot;
 #include &quot;xe_pcode_api.h&quot;
+#include &quot;xe_printk.h&quot;
 #include &quot;xe_vsec.h&quot;
 
 /**
@@ -179,11 +181,11 @@ static void log_survivability_info(struct pci_dev *pdev)
 	u32 *info = survivability-&gt;info;
 	int id;
 
-	dev_info(&amp;pdev-&gt;dev, &quot;Survivability Boot Status : Critical Failure (%d)\n&quot;,
-		 survivability-&gt;boot_status);
+	xe_log_info(xe, SURVIVABILITY, &quot;Boot Status : Critical Failure (%d)\n&quot;,
+		    survivability-&gt;boot_status);
</pre>
        </blockquote>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
btw, is it OK that we use INFO level for &quot;critical failure&quot; ?</pre>
    </blockquote>
    <p>Good catch! We log the message when the device has a critical
      boot failure and the survivability is too old to handle if
      (version &lt; 2)</p>
    <p>so the driver is about to abort with -ENXIO. Using xe_log_info
      for that situation is wrong one. Using&nbsp;</p>
    <p>xe_log_err_fatal(xe,&nbsp;<span style="white-space: pre-wrap">SURVIVABILITY, -ENXIO, ...); we can fix it.</span></p>
    <blockquote type="cite" cite="mid:092a6287-e2ff-478c-8d33-ca65ed5b3c30@intel.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre"> 	for (id = 0; id &lt; MAX_SCRATCH_REG; id++) {
 		if (info[id])
-			dev_info(&amp;pdev-&gt;dev, &quot;%s: 0x%x\n&quot;, reg_map[id], info[id]);
+			xe_log_info(xe, SURVIVABILITY, &quot;%s: 0x%x\n&quot;, reg_map[id], info[id]);
 	}
 }
 
@@ -316,7 +318,6 @@ static int create_survivability_sysfs(struct pci_dev *pdev)
 
 static int enable_boot_survivability_mode(struct pci_dev *pdev)
 {
-	struct device *dev = &amp;pdev-&gt;dev;
 	struct xe_device *xe = pdev_to_xe_device(pdev);
 	struct xe_survivability *survivability = &amp;xe-&gt;survivability;
 	int ret = 0;
@@ -342,12 +343,12 @@ static int enable_boot_survivability_mode(struct pci_dev *pdev)
 	if (ret)
 		goto err;
 
-	dev_err(dev, &quot;In Survivability Mode\n&quot;);
-
+	xe_log_emit(pdev, check_boot_failure(xe) ? CPER_SEV_FATAL : CPER_SEV_INFORMATIONAL,
+		    XE_SIGID_SURVIVABILITY, 0, 0, 0, 0, &quot;In Survivability Boot Mode\n&quot;);
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
Please make it cleaner and simpler.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
sure

it was one of the earliest examples of the new xe_log API,
and that's why it was using the base xe_log function
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
if(check_boot_failure(xe))

&nbsp; &nbsp; xe_log_err_fatal(xe,&nbsp;SURVIVABILITY, ..&nbsp;);

else

&nbsp; &nbsp;&nbsp; xe_log_info(xe,&nbsp;SURVIVABILITY, ..&nbsp;);


OR

xe_log_emit(xe_any_to_pdev(xe),
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
we do have pdev already, no need to cast back to xe</pre>
    </blockquote>
    Agreed!
    <blockquote type="cite" cite="mid:092a6287-e2ff-478c-8d33-ca65ed5b3c30@intel.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; check_boot_failure(xe) ? CPER_SEV_FATAL : CPER_SEV_INFORMATIONAL,
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; XE_SIGID_SURVIVABILITY, XE_LOG_COMPONENT_SURVIVABILITY,
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; xe_log_location(xe),
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &amp;survivability-&gt;boot_status, sizeof(survivability-&gt;boot_status),
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
cool, but isn't this already printed in log_survivability_info() ?</pre>
    </blockquote>
    it's not print both, either it print&nbsp;<span style="white-space: pre-wrap">log_survivability_info()</span>&nbsp;(based
    on condition and return) or&nbsp;<span style="white-space: pre-wrap">enable_boot_survivability_mode.</span>
    <blockquote type="cite" cite="mid:092a6287-e2ff-478c-8d33-ca65ed5b3c30@intel.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;In Survivability Boot Mode\n&quot;);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
btw, as we use SURVIVABILITY component, the dmesg will already
have &quot;SURVIVABILITY: &quot; decoration, so maybe this msg should be:

	&quot;Boot mode enabled!\n&quot;

with dmesg:

	&lt;3&gt; [drm] ERROR SIGID=103 FATAL (04) SURVIVABILITY: Boot mode enabled!
or
	&lt;6&gt; [drm] SIGID=103 SURVIVABILITY: Boot mode enabled!</pre>
    </blockquote>
    Agreed!
    <blockquote type="cite" cite="mid:092a6287-e2ff-478c-8d33-ca65ed5b3c30@intel.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre"> 	return 0;
 
 err:
-	dev_err(dev, &quot;Failed to enable Survivability Mode\n&quot;);
+	xe_log_err_fatal(xe, SURVIVABILITY, ret, &quot;Failed to enable Survivability Mode\n&quot;);
</pre>
        </blockquote>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
and here:

	&quot;Failed to enter Boot mode!\n&quot;

with dmesg:

	&lt;3&gt; [drm] ERROR SIGID=103 FATAL (-ENOMEM) SURVIVABILITY: Failed to enter Boot mode!

</pre>
    </blockquote>
    Make sense.
    <blockquote type="cite" cite="mid:092a6287-e2ff-478c-8d33-ca65ed5b3c30@intel.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre"> 	survivability-&gt;mode = false;
 	return ret;
 }
@@ -412,7 +413,7 @@ void xe_survivability_mode_runtime_enable(struct xe_device *xe)
 	struct pci_dev *pdev = to_pci_dev(xe-&gt;drm.dev);
 
 	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe) || xe-&gt;info.platform &lt; XE_BATTLEMAGE) {
-		dev_err(&amp;pdev-&gt;dev, &quot;Runtime Survivability Mode not supported\n&quot;);
+		xe_log_info(xe, SURVIVABILITY, &quot;Runtime Mode not supported!\n&quot;);
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">We can add xe_log_err(xe,&nbsp;SURVIVABILITY, -EOPNOTSUPP, ...);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
hmm, actually I was wondering if this dev_err() was correct
maybe it should be just xe_dbg() as we are not doing anything
related to SURVIVABILITY ?</pre>
    </blockquote>
    <p>That function is called in runtime&nbsp;<span style="white-space: pre-wrap">survivability, so debugger will get the context easily and figure it out</span></p>
    <p><span style="white-space: pre-wrap">what cause it.</span></p>
    <blockquote type="cite" cite="mid:092a6287-e2ff-478c-8d33-ca65ed5b3c30@intel.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre"> 		return;
 	}
 
@@ -422,11 +423,14 @@ void xe_survivability_mode_runtime_enable(struct xe_device *xe)
 		dev_err(&amp;pdev-&gt;dev, &quot;Failed to create survivability sysfs\n&quot;);
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">need to use xe_log_err(xe,&nbsp;SURVIVABILITY. -EIO, ...&nbsp;);
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre"> 
 	survivability-&gt;type = XE_SURVIVABILITY_TYPE_RUNTIME;
-	dev_err(&amp;pdev-&gt;dev, &quot;Runtime Survivability mode enabled\n&quot;);
+	xe_log_err_fatal(xe, SURVIVABILITY, 0, &quot;Runtime Mode enabled!\n&quot;);
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">hmm, Logging error as fatal, however passing err=0 (Success). is it right? or simply we can log as xe_log_err or xe_log_info ? any thoughts.</pre>
      </blockquote>
    </blockquote>
    Already I checked with Arch team, better to provide as xe_log_info
    rather than fatal. Just indicate to user it's Runtime survivability
    mode in such case.
    <blockquote type="cite" cite="mid:092a6287-e2ff-478c-8d33-ca65ed5b3c30@intel.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
passing 0 instead of errno to xe_log_err() helpers will just omit
printing anything in ( ), no %pe nor %phN

whether this should be info/fatal/recoverable it's not me to answer
your initial documentation [1] was saying that all XE_SIG_SURVIVABILITY
should have CPER_SEV_FATAL

[1] <a class="moz-txt-link-freetext" href="https://patchwork.freedesktop.org/patch/732271/?series=168333&amp;rev=1">https://patchwork.freedesktop.org/patch/732271/?series=168333&amp;rev=1</a>

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre"> 
 	xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_VENDOR);
 	xe_device_declare_wedged(xe);
-	dev_err(&amp;pdev-&gt;dev, &quot;Firmware flash required, Please refer to the userspace documentation for more details!\n&quot;);
+
+	xe_log_err_fatal(xe, SURVIVABILITY, 0, &quot;Firmware flash required!\n&quot;);
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">ditto
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
ditto ;)
</pre>
    </blockquote>
    ditto ;)
    <blockquote type="cite" cite="mid:092a6287-e2ff-478c-8d33-ca65ed5b3c30@intel.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">+	xe_info(xe, &quot;Please refer to the userspace documentation for more details how to flash the firmware on %s!\n&quot;,
+		xe-&gt;info.platform_name);
 }
 
 /**
</pre>
        </blockquote>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------mwbMPz0aCx0TgRR02FnNZYAf--
