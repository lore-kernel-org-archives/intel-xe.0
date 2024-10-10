Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB69BCFC5E7
	for <intel-xe@archiver.kernel.org>; Thu, 10 Oct 2024 17:32:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8320310E99E;
	Thu, 10 Oct 2024 17:32:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MaKy2g1/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A64F10E9A1
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Oct 2024 17:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728581560; x=1760117560;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/EcFiCysVVnrqavJG8ijpYxrb3PhrynH59+PPbad2ug=;
 b=MaKy2g1/mVgCI5nwAZtk1+ZXeleVaYREDP+s43keaHtJ18PVjjLK/bm/
 fwLNfRiWq84UWS1mj6ah7Xjkct3o37HZ+krh32OoWGTS8gyj6y95Ti8vl
 ckIkzYrPtCOrJMR7t7zfvXvEQqicNg6uEFuLjWRpb1DFp++yld0Ns4ch0
 jTqj2h7jGsWbmPHPBJlbGZ7jTMj9c7WtUrzpjJOVNoS+8ZyTR9EXFkwZE
 m1ThAH3sYvYJLXEnfJrldetxRwRZHDml6P4p+oKGWUWMrb1LwzsRT9GWH
 aQbC8nSprkhrgCXgbSjVuKbtC/Cjae8mssvchAoMY5VZ9N3OsdfLQzPwT A==;
X-CSE-ConnectionGUID: BKIQAE4sRXGkjGZWmzQ2/Q==
X-CSE-MsgGUID: du9sQobZTEOgudYRJOl3Tg==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="38529703"
X-IronPort-AV: E=Sophos;i="6.11,193,1725346800"; d="scan'208";a="38529703"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2024 10:32:39 -0700
X-CSE-ConnectionGUID: l4sY5phxSXWERN9DZVZ7fg==
X-CSE-MsgGUID: HdlgwkhDSry9S8Vs5yjCPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,193,1725346800"; d="scan'208";a="81670169"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Oct 2024 10:32:39 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 10 Oct 2024 10:32:38 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 10 Oct 2024 10:32:38 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 10 Oct 2024 10:32:38 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.42) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 10 Oct 2024 10:32:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v0PxUsClcQilHNaH669gur/d2KWekBo2R+iVZLaNTqrj5PBMCyfdRad1fonLvuDI4kKG5/QOeAyEbghIvRWW2sDlITjyAygJOGTMOkX1BxNzcoWPcdyf0TTkRTBpzQjAxz6WI9kn6z9+L4rpjSEpuszFKEO6Vz9sLrn1ZId2coce+0ihrMQ6TbqAGlEkkiQwVSnmE0+jRZy13VdL7WpRa9UAv3gJu8jBVa8yhpY9/Yg3STpczeCRjpiGM/MAOGapIhgm8AWknmol4iFLzcDUTPZ6GslGEqQ/RrA9S9urqs0iIMPlsHkac1QaVkzN3QaB0O+VxJ4M1ZZSl6ELq2Hwdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wte43y0Zxu2lWLLhnIOUMgL68h/jJZOeThwy0Ql6aXU=;
 b=SIBIjzTz0yR/OHC8RqsrDnv4RAx9UdU/NtcgW7TGWF+ddqHmbvJvSdRb+Fd+0LHoDV19ao6I/STIqLYolPTNODvp/yB0Ke1Eeyjk5kVcTo1dVBFVzCQlknl+Vkl06qzgX2rmt81Jz8rqHiGc+oVvNJP7zfnKuiqFn224GdPlv1YKEHVTuUotDe8aPyXWHfWJjorPHtAwFr85uc+/n+jTCdPT4yjqhxH251QImoKIKF6boY1LKCjmGqr0Q58xXXn3rnlQ0DsxZkx1GQNlN5DGbJin+hyfX5NQnWbi43M1cToLyD91p5N8gR3Lp4qeesL4Hn7W3kOfBScnmTJvDMsItA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by IA1PR11MB7246.namprd11.prod.outlook.com (2603:10b6:208:42e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Thu, 10 Oct
 2024 17:32:35 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%3]) with mapi id 15.20.8048.013; Thu, 10 Oct 2024
 17:32:35 +0000
Message-ID: <fb530ce7-17de-4600-a045-c2b91a66c5ae@intel.com>
Date: Thu, 10 Oct 2024 10:32:31 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] drm/xe: enable lite restore
To: <fei.yang@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <matthew.d.roper@intel.com>
References: <20241010173142.425498-1-fei.yang@intel.com>
 <20241010173142.425498-2-fei.yang@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20241010173142.425498-2-fei.yang@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR02CA0042.namprd02.prod.outlook.com
 (2603:10b6:a03:54::19) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|IA1PR11MB7246:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b344276-0ac7-4c6f-4570-08dce9518725
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RUhEWDV1NmNpazdwQlpnc0lhR1lVQTlrS3RnVGpjby85YzRZblNVdXBGQmJk?=
 =?utf-8?B?SnRsV284c1ZEeHV6R0c5cDhYOTBqWER5eFlzVUdJWXZidm9vcDNobXVUQlNm?=
 =?utf-8?B?OUFKK1RKVFdUN2VoTWczd0ZPOTZKbGY3S01WR1g0NXZtcEVlY0Z0ZWRZdWRk?=
 =?utf-8?B?SWVhQ0dWS3ZneksvT0E1V3Vyb3RCNGNuNHk4dkJ5R3Z3UVY4TStqaUJYdTYv?=
 =?utf-8?B?ZWUvU1h6TlJJQlRTMHFDR3ZOTDE4QVgrNWxVcS8vUWJ0K3dkd1JPV0VFN015?=
 =?utf-8?B?dUxMTEFvaGhpeHpqOTNUeDd2Z0h0NjVvQ3NkdFF2bzhFeWVtVTdzVU9aalEw?=
 =?utf-8?B?bjlMd1UxRThKSzFTdFYreGdUTTN2dFFvMlFKV1pRVXljeFQzcFI3WWpWTWVW?=
 =?utf-8?B?Tm05SjJMUVM0U05ER1VtZzBwYUVPVXhHTDZEZUQrMHFVcVZZYk9nY3JNZTdx?=
 =?utf-8?B?akFLZGZQTUJFRnBWbGxUZU1tUEZneFFjZTAwc0lkOWxVTHpjWjA5TWVmV05C?=
 =?utf-8?B?YzFlUkpWNzE0bVhTTnQ1RzZCaUJ5MGtCcmNUTWtRVXcxa2t1TlJXcUNxTE5I?=
 =?utf-8?B?c09EZW83dHhrTDhWRTY5ZTBLcTNtamx6S0dnTHBobnhHV25kZjNIdUlHOEhZ?=
 =?utf-8?B?d2hkc1dYUURrL0VLN0MxTFFucTNUUEFsNGdpa1JxMzVvOUJzSUVGNzZEUmFX?=
 =?utf-8?B?eUNPV0p6YkVuZUNwWnpCOHRRM09GUVU2TFMyckJNMGUyNzdUNmp4M3p6ekdJ?=
 =?utf-8?B?a1h0NFNaQ2hvY3F0UXNReGdpcXIvWTJvT0poK1lPeXVlTW45akRoNUdmQ2o5?=
 =?utf-8?B?bVJRa2JwOVBNaUc2TzhiMkxQUXhBUC9ObUxnUkJzNVg1cHFaUDFqM05FeWxF?=
 =?utf-8?B?dVFkN1Z3UEZQY3RtZFF1Yll4djFaTkRUc0pSaHRBeU9ZSXRxall4NTV5QmFu?=
 =?utf-8?B?TzVOWU5XcXh6dWgzR2FQSTlSckZ3dEpOWm9JTmpBSnoyYnVFb1RtNTJGaTk4?=
 =?utf-8?B?ckpPZloycUwxakFVTjlNN3dWb3Y1a2JyZExvWm1sNnlMeTVra2F4MmhicytG?=
 =?utf-8?B?cktRSFZhQ1NTOS9IQm9tTnZGeXA3aEdsKzB4MjI3QnBCMHpzZ3Fxb0Y1UXFT?=
 =?utf-8?B?eHhzQ1V3ZFpNdnFVcU5RelJpY3REczdjY3NON29aemdSa0RoQVl1Um4xRXZH?=
 =?utf-8?B?dlRYUHZDeDFNZklyRzJKeWtiRENXSVBBd3VVT1hsSGRrQVZva0VpQjQvNmZh?=
 =?utf-8?B?N2ladUw4VHh4VkoyWmRyd21PaHRodVMyS2FuL3FCK3lISDQwUDA5REVQZTI2?=
 =?utf-8?B?a3VERnF4TnQzSUtrVWlrZ1kySEtRZm5Nd3lrRzlmQmpWY1dhaENCMTBUZWJM?=
 =?utf-8?B?UWpVMWN3VUtjd04zWWo4R2l2NU96d3MrNlEzUEN5SXhJSXRqMEhieVhqWDFi?=
 =?utf-8?B?blE0K2huL1dwMFNHT0VJUE54MjBJUmpyclcvUWFybzRzNWpCOXVJb2YzdWdH?=
 =?utf-8?B?M1NXM3BIVFg4c3U3YVRKQUpVU2RWdTFHZDlIL2pZNUZoaXhGYkFRRGxlWGNE?=
 =?utf-8?B?Mld3RUZNOUxlSlV1M2dFNVhoQ3ZYNkdwaDNESjBsQVNJNlhvVE9WOHZzVGdi?=
 =?utf-8?B?TU9PR0FuZkt1TUNjYWV5R2RqUDNLZU9MWWNrZFZOY0d0bnZFa3ZGc3hwQlBM?=
 =?utf-8?B?Qi95cEZVMk9hV0pLUnJOTzdhOW5wajl2RVJjUFBjUDhuWUMwSUs4VktnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b1BYUFV3dG0rQXNOMWxJdmwyNGx3Z2lRRDVndkhkK3psamo4dyt4U0tzSXJv?=
 =?utf-8?B?U29BbTQ5bitBdnE1aklFR2FFY0RzVXN3VFEvckU3dk85KzhTM1RVZUh5bnB4?=
 =?utf-8?B?cmFSb2k1dUMrTGJEWXZHcmlpSG04RGhvb2FIaHpsN2tHcVB3RmhjN3AyejNM?=
 =?utf-8?B?TzcrbTBvM1VmTWk2TG5jMGZMbGhGdVl2dExOejVLQmpPZVIzaEVJeDlZaDZy?=
 =?utf-8?B?M1VHU0N4OFFITVQ1dmF4Z1lIVkxhUHp6L0ZJRnljcjFvQW5adnpuYUtjUFM3?=
 =?utf-8?B?ZWxHOWswMkthb2pSMVBvNUw0MUdkeDdzMkxvcDdzRzBUS3VQdzFveGt2OHFO?=
 =?utf-8?B?TDB0OFZCSkh1NTlDUzhMY2FXVjNiL0FCamk4dGFzYitVRzZVSUxwVHp2QXRy?=
 =?utf-8?B?OWxoMWxRMGVrb1Q4SUZPbGxsd0FQM2pVVGdjbThiWmllWmRjRzA4THoxSk9U?=
 =?utf-8?B?TlV5dTFkaEZVTEhEektCYU01VzVmaXB3YjV3UFJlTmlwYzNaSzZhZUUyQlBM?=
 =?utf-8?B?Q0hUR2RVVDc5eW9COUpLMXkxNCtHb2hxLzlEZHdNRzhCbi92VGU4eFc5VHBa?=
 =?utf-8?B?MUxHcTlXS0hGYjNyalRDVG9naUI4bWszTzFaR0ZvK1BURS9BbSsrMkFRdm9k?=
 =?utf-8?B?b1FCNktWNm9PZ21HN2J0blVwTHRMMkNENzU5OFU3eVFMWHhBS0RRNzZYVytG?=
 =?utf-8?B?MlZrc3o3OG5Cd1NBdHBnRW1ZQVc2NGdzcFFtNitaMDRpd05DSTlEb3JRWXZi?=
 =?utf-8?B?MUNFMTZzektDYk8yaFlYc1F2eXVMak50VmRyWCtSNFk4bXpORzVDbDA3UUJk?=
 =?utf-8?B?YTVQUmdyUUpDelZ0Z0o5M3VtdWtpenAxWnhiU1BNMVd3WE8yNjlxWll3c1Zn?=
 =?utf-8?B?ZUdTd04wMm1hN1B4M2wxa3N6dk1zRUFDdlhSRnNaSGdyd2VLVW52TFl4WVZR?=
 =?utf-8?B?VytNeGR1VUpUTzYwYkFiT003aG8wNFpVZmlNeXBEaFZtRnRLaDZWeEc2ZDIv?=
 =?utf-8?B?R0FvU2lsQWY4WmxrajBWelNiV2JUeGNrOVk2SHN3N0twM3B0K3FxVlp6OW1T?=
 =?utf-8?B?Ri9oMjd2TXNSa1c5a0FaWFNNTnZsRTNKK3FidUFPOEZydlBReWl3Y2xzRVQy?=
 =?utf-8?B?SGxIamJEbFRFY3RJSFZZTWRzUS9TZTdla2tkckwrOFVBKzdjTXR3bzlaSzFl?=
 =?utf-8?B?eE9TRWxTVCtYVEpiclhOUW9YYVU3LzBoVnVlRHY4NU1CcXBIVUU4cWtlWCs3?=
 =?utf-8?B?Y1E5QTNjRk43bFBMT0VueGp3Z3FxREpoWlFxVDNIM2owd0lNamE3VlV6bDNE?=
 =?utf-8?B?QlUrdkJqVVpXdFB4SVBCclZOYlR4clg0WHIvZXRPRTcxSTFYNDZEVmIzMFBw?=
 =?utf-8?B?cVRKc1QrNCsreElhV1VxUkpmRExaalo5TEZHREN2OHRpY085UGp4UTByRHJv?=
 =?utf-8?B?Q0NweThDQzFMbnQvbURpVW9vekFUb3ZFWThrOXRXQ09HK3VRbmdoM0t3a2lq?=
 =?utf-8?B?U1haUzVOenRMNnl2aWw4RytCTE1abkN0MTdhUVZZVnhGNktQUDdxbUZINzhU?=
 =?utf-8?B?RjQxVWZJdEIwYUErZHFGenhxSjZoa3B6R1VHY3NuY1doa1I1MzlWb0w0Sjcx?=
 =?utf-8?B?NkQ3OXhrNW8rbmJBeXE1SFlFY0Y1UUEyamhldkJhNWptNUdRMGlOd2pUZi9v?=
 =?utf-8?B?UVIrRTlMMGR0MHg4dXgxODh4LzlvUjA5RFZDaHpwQ2ZDYUcwWkYvMW5HckpZ?=
 =?utf-8?B?YzFWek9DclBkV25MMm8xdjBTaXJCdDBPZDFTU1dRblpiMm03VUdUOHpHVWo5?=
 =?utf-8?B?SUZnTFgxZUg3b1JMdnhuMEVwSzYrcVZxM2NiWjI1bnVXNVNoQjBpT09BcVJY?=
 =?utf-8?B?aEhSVFo3M1VzSXRkemNxWDNnUWVUdnZGK1NYYzljUFFtYXV6SlNQdGJWUGV1?=
 =?utf-8?B?cG5NMVE5Q2taSVhLcm91QnRSNk9xNjBWZWE1blc5ak5aaDhPMTFNd0haQ1da?=
 =?utf-8?B?U1pSd0R0cFVieTc5YmxqZzV0NWxtRDltVW44Y05hU2EyK1kvb29oblRiZWxv?=
 =?utf-8?B?MXdDZkdvNVNQaXFBWlREdlB0c3hJR1dqMC9oaXUrTEFXeGJ0bzN4Si9janZX?=
 =?utf-8?B?NWVEVlpxZHJEK3pSQXF2TTFPMGRGWmpLZkRaOWFuczBOQmNNa0FZSEtKUzJL?=
 =?utf-8?B?UlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b344276-0ac7-4c6f-4570-08dce9518725
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2024 17:32:35.0285 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w+1AdP5boKhyyPJ+FoIJpSGEyBj2Nr27Oel76auRvzVjtXOkH05j5L3y+r2xS5uDveTpESQFWnWuipU2UQP2aTxejPPf/LOuHhreif7X11c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7246
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

On 10/10/2024 10:31, fei.yang@intel.com wrote:
> From: Fei Yang <fei.yang@intel.com>
>
> The lite restore feature is supposed to be enabled by default.
>
> Signed-off-by: Fei Yang <fei.yang@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   drivers/gpu/drm/xe/xe_guc.c      | 2 +-
>   drivers/gpu/drm/xe/xe_guc_fwif.h | 1 +
>   2 files changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 8570b1218287..fed30f2872f7 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -70,7 +70,7 @@ static u32 guc_ctl_debug_flags(struct xe_guc *guc)
>   
>   static u32 guc_ctl_feature_flags(struct xe_guc *guc)
>   {
> -	u32 flags = 0;
> +	u32 flags = GUC_CTL_ENABLE_LITE_RESTORE;
>   
>   	if (!guc_to_xe(guc)->info.skip_guc_pc)
>   		flags |= GUC_CTL_ENABLE_SLPC;
> diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
> index 01e3ab590c3a..08ffe59f22fa 100644
> --- a/drivers/gpu/drm/xe/xe_guc_fwif.h
> +++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
> @@ -105,6 +105,7 @@ struct guc_update_exec_queue_policy {
>   
>   #define GUC_CTL_FEATURE			2
>   #define   GUC_CTL_ENABLE_SLPC		BIT(2)
> +#define   GUC_CTL_ENABLE_LITE_RESTORE	BIT(4)
>   #define   GUC_CTL_DISABLE_SCHEDULER	BIT(14)
>   
>   #define GUC_CTL_DEBUG			3

