Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9CE0EDE9AD
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 19:33:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D3F710E908;
	Tue, 10 Sep 2024 19:33:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i1924qUu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A03B210E918
 for <Intel-Xe@lists.freedesktop.org>; Tue, 10 Sep 2024 19:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725996814; x=1757532814;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Dzd4fb4YEG/KCQMx47X3R1nv/mSnGDT5zXzFgZTOhdI=;
 b=i1924qUujC9ZswKYlkr7nc9ectIqYJhwCCojs4clamFKTAzKKjT7cVoz
 DtVuYYfmzVajzaONWvpCaACjD6oq9HaajW8AhcCHSwJiZ/nPX5HUQotAE
 CgoC+OCa74DxLQnAEt8CK6ca1Qu95P7RiUz0oBGI7T+8Dw9vIaD6Sinzn
 m/HrAtLj7AmyyoTMQv5AaWuHVkhrjG94yg7l71eZyK/yhPd38fHb7r62n
 W4L71oBo/o7UUxTguU3XYbxNOtOtu8WZcmsZib7K4xPKptasrKGDUEMYi
 N9WZL8txO+CDfmy7pHrcqP8iY98R38G/Ed1z0QxhNuKag8Tr1SwJlpEer A==;
X-CSE-ConnectionGUID: fRs/3UDpTj+P5/1Bb/6I8A==
X-CSE-MsgGUID: tjO5R067QKW1lRc9kyLX+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="24313809"
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="24313809"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 12:33:34 -0700
X-CSE-ConnectionGUID: JY4NWnSaR665EFTPsvMWqg==
X-CSE-MsgGUID: +yVCYlEsTruaTV/gKbtxpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="67373517"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Sep 2024 12:33:34 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 12:33:33 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Sep 2024 12:33:33 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Sep 2024 12:33:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jLypPGkFaLrEAgYiKn8cEm13JWoA6mC5pRUsNlfNkzF/WwyhyiQ08Z7gCPb9AYzkDwhMtedcsH6toFWQZUgblbMOVgYokfyLT5meqUYskP/qVbrEhMKfyJ6JPtOWacYy9t1tFWN/v0IAO4XmN8QhlKKj7IFbmO2U+hyPK1iBEuQKIxXAUCtz6Ov2KepXj5htkpOsB1KkSLF+8NS2AlSKNyHV7Bf5aBR4Da+zcPW2LgA2+Wlqy7hwFM02mafbGOex4S3QCOZImyh50CKlwN2JhheRjz7ZgaEl7hXPSYg+wxXPyVtfVtip8suIycWdhRBm5DykDZm7IzNvGMx9zUGR0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eOAyFkX1DNK8Y/Xh9GN6u5w41wQfSfGDTXKORmjyVpE=;
 b=D/Mv8lPeqlOJa5oc1ViOb5+XQa/go9s+DdpNGPF8Zsl5PEv2SRCpN3dKtCvRMG+277nWato+LpzbqOJBCJYpM4LI3eedCb18Rgq7OJh6OG9HXmrInindgHJScRwbSk6c7Pd6PqL+wwfnxpPDuUWebBG8NKucC1a1EbiqFne2u+1wpTCwHbrkxm432t1bJnBqUaFygvvubKKuVM+GAUtvD7NOOc09DyNbr/xw/AOQ/VQSiDLp56+mT6EnF5CChwYCC0jiVAUjtZyTuINIxv9yXnqi8q1My9MglGzmZqSKwwetAQzeU91EMDzbbNPasTYRFHz+65/WMF+LUjryLhKuYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7821.namprd11.prod.outlook.com (2603:10b6:208:3f0::22)
 by PH7PR11MB6054.namprd11.prod.outlook.com (2603:10b6:510:1d2::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.25; Tue, 10 Sep
 2024 19:33:30 +0000
Received: from IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::2ca4:29ad:f305:6fc0]) by IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::2ca4:29ad:f305:6fc0%3]) with mapi id 15.20.7939.022; Tue, 10 Sep 2024
 19:33:30 +0000
Message-ID: <36c69a89-eb37-4300-a376-cc1395f8375e@intel.com>
Date: Tue, 10 Sep 2024 12:33:27 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 03/10] drm/xe/devcoredump: Add ASCII85 dump helper
 function
To: <John.C.Harrison@Intel.com>, <Intel-Xe@Lists.FreeDesktop.Org>
References: <20240905205106.1063091-1-John.C.Harrison@Intel.com>
 <20240905205106.1063091-4-John.C.Harrison@Intel.com>
Content-Language: en-US
From: Julia Filipchuk <julia.filipchuk@intel.com>
Organization: Intel
In-Reply-To: <20240905205106.1063091-4-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0285.namprd03.prod.outlook.com
 (2603:10b6:303:b5::20) To IA1PR11MB7821.namprd11.prod.outlook.com
 (2603:10b6:208:3f0::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7821:EE_|PH7PR11MB6054:EE_
X-MS-Office365-Filtering-Correlation-Id: 42dce1ba-65db-4e57-9693-08dcd1cf737c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RXFmSzF5OWZBVFI2SFFJeHhKM05qNndGaS9ieEJmbWRPNUJHdnhxN1JyZElr?=
 =?utf-8?B?aE9wZHRBYnhZNzAwQ1ZjNzR4MDBzb0QvNmROa1VESmJwMVg2MHZRdlNhcFlr?=
 =?utf-8?B?WlpHVk45dmlrMS9tOTBEMGp3RWViQ2hOdWhNeVo2WUdkRUdZcmpXclRjdVd4?=
 =?utf-8?B?TzVZclJnU3FFTEFmczR4cG9YdzRQVlA2STFQS3FuNEdRUFMrMXlJMHMxbTU0?=
 =?utf-8?B?UEg4NkN5TVZFUFdPVTlMdlNHak9JQ1MwYURGVXB4T0dQOER1OUV6STJwcldB?=
 =?utf-8?B?RFIwYjNTbi92VGRmTWJnZytOajMrREtzQ2wyc0FyWXZYQUczaVdLbWpMbTRw?=
 =?utf-8?B?dDA5SlJtZW1GT1lpK2xJem90UmJkcFU0ZFE3WXdXTkhSRDdtcjB4dkl2Q09v?=
 =?utf-8?B?UnFPUnpSaHZlVTZpbm5Nd3ViTlEvTnRJZUFIK1B4QmVJYjJGd2pPWGVuTWpx?=
 =?utf-8?B?RVBaNnR0RlQybnJweVF6WGdCYTdZRG81MW5UYlhhZDhBUzU5SGMzcjJBbGJy?=
 =?utf-8?B?V3I5eCs3WXhZNDhXYjhScTVDSWhRdXZ0L0lBdzB0UDZETE0rY1FtdGdwa0Rl?=
 =?utf-8?B?a2htZ2Z6UGhNLzBPVHo1RU1wNXV1d3lSUENTNjZUUk9ITTV4WHZBNDE4NU5z?=
 =?utf-8?B?MC9Jdk9BQm9Tbm5NSXhnSU9wNzM5anA5djhPUCs5eHdaMHVyMmc0N2VqNlNa?=
 =?utf-8?B?cmNyaXRYL2NIN3FtUExhRWh4RDFLeE1pU3dJTlhOSWVoYm54QVcwZGJCZnZ2?=
 =?utf-8?B?QytCaE8zT1FGeUNtUmJHZWVOQUJGc3k1RGQ2a1JyRkhoZzQ3bjZjelMraXpE?=
 =?utf-8?B?RmFWRnFzZDYzc3QvRUJjSld5ZURGcjZXSE1lN2pRc2NKR2QxZ0FLU09Leisz?=
 =?utf-8?B?alo0SzA2VEQzZFJQdUFPbC9aeHZEaEJpMEhtdUZrOFR3TTg1MEkvd0gwNURh?=
 =?utf-8?B?YTlSc1lmODFmbll5WWhkNitLVkUwSDlxUXZ2NFZYN2M3Y1Q2NlZNVDJRUm9a?=
 =?utf-8?B?K3FiSUdBbFdGbkJPL25HdG8yUVFQVjdnVHV2SWVWL0ZSZnBKMDU1WkJvNUly?=
 =?utf-8?B?d1J2U3NDckNuQjJlUmFDdVhPekh4ZkQ4VGI1NzNia3hyT1pHRmgwaEhoVHd4?=
 =?utf-8?B?THE2ZktCUlBMekVpRi9jbWJZNFJTTDBpRWxxMWV6YlB2UmxqYjhNWUY0cExx?=
 =?utf-8?B?UzFUME4wMnp0aUV5WVVQVVdFR1V2ZEZiV2xMckVHb0x6cVpmM21zVk96TWh0?=
 =?utf-8?B?V1owcXFWTXdGZXJONmt0am11ejhVQWRQR3MvVjRmNHdWanY4V0J2NlpSS0o5?=
 =?utf-8?B?UE9udEczSTZFenI5SWkzaEhSdEYrUGNBZXlsUEQzUUszVEVzakxzT2M2QXMr?=
 =?utf-8?B?VXBWMWp6SEpGY20wQnZ5S1ZmQWxVM1h5a0QxdHFhY05DbjlHQ1JqRjg2dDF5?=
 =?utf-8?B?elVVb2ZjK0lCTDRNakRobXNYbjUreUMyNCtlUEVlYktOVlBONno1WUtjbDRC?=
 =?utf-8?B?OFVydHg0bWlIZWplUVVjZ09KVGRRbUZXbGhiV0xEWHVqNE5wNGI3RkkvaFVW?=
 =?utf-8?B?dittY2lqWUtLUFloSXRIMkhnaXNsaHh6R2VML3pFZ0pLTTJUU0MwWE94S0RJ?=
 =?utf-8?B?L3BiaUxQa1VVN0pZSTJyQmczYzE0REVOdnFoY1J4MDNrR2cyNTZQZFpyNGda?=
 =?utf-8?B?aW5neG9DNVBwT3pERWRCMUUwdWZaQkdoeXNjamNybmNzeVMyQ2lCa25SRWpC?=
 =?utf-8?B?QmUxcVNzNExUbUtMY1JNSVBZbURLRTg4QmF3NTh1TEJUVFRaZC9lZVVJUnNN?=
 =?utf-8?B?SUlCVVFRaUJ4TkhBcllnUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7821.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZklkUHE3d0RmNGVaNlhYUjFLcXEvbml2TDZjS2U0TEV6bWo5STJTMTBIZjJ2?=
 =?utf-8?B?Mnc1WEQ3SHZBaXE1MnV6VUcyeTkyZkRMYllPK202elpkYXl0NUlzT2owdWlS?=
 =?utf-8?B?dHcwVElPenVIcS80c1Z2VmJUb1lGKzlqYXFRMW0vbllUZjNEc0lVTTNvYmhs?=
 =?utf-8?B?RXhTeWxGY3ZzS3dMY1FEeFVLQmJ0UVVnaE92dzV0QTFXcmIvUlVFQ0RDMDZX?=
 =?utf-8?B?a1lUOU1tazBxQ1Y0ZTdFUVoyUU1VM3BtanhmbHpWY2psOXBNNGNkbDNGbThn?=
 =?utf-8?B?Q2poZldVd1o0d3hPQlBLS0Jjb3JJZ1lCdmZ4eFA3aHVpdFlhNE80QlFkR2dC?=
 =?utf-8?B?bFljNU1oRVZsZC9ONGxYbDU2MHA5QlJFTU1Db1lYZUhvNjl3WXYyVDZ6MFdR?=
 =?utf-8?B?WUgyTTBld2NYajR6RGczeGxJK0Rvd0srYXIvbzRNbTVxY1Y4UFFTL1o2YmhO?=
 =?utf-8?B?aHFUWGI2bGpVVjNIbGh5QzJodTZ1QkZLNGJwWTJvQWlqZ1pOV1B6RjgxTUhT?=
 =?utf-8?B?UW9wQ1pJZCtOdkFmdDhqWXZCbFNtYmM0b3ZrRk9LaG1CNEZHay9qbUNrcnd0?=
 =?utf-8?B?dGlwbTVYS1gzSHNxazFBT3cxdmJ3N1dLbnpVMWRxeTVIRktFWEZjdE13RG9C?=
 =?utf-8?B?ZjM1WXV2ZndVNkJiOVk2bXFsTlNTZXFkS25lT1Y3Tk5OL3FtOEFiWHhKTVJt?=
 =?utf-8?B?QzNPRFV1MEJvdjdGY0YyZXV0WDZINDNzRDAzL2JaZ3RqbU13NUJpdXlmWk1x?=
 =?utf-8?B?cmhBZHpiL3BzSjhHc21kUDB0KzNEQ2ZtWWdRaXZjaG80SGpIdmltSXpQbWdt?=
 =?utf-8?B?eUYvQm92Y0dVMnlGbTZLMEUxcU0vVzRVYWlkQXJKMjNpRkNKQkNHODhsczNI?=
 =?utf-8?B?QWZWSU5pS2ZsbExjdVRRSnhZQWZRc252d2pZNlFuNzAwcFdVM284T2FuMUpY?=
 =?utf-8?B?VmtseW1ZamJoWitPOHp5S29aSi9XZWZ4dlRTcDVxZTFFTmFTNFZ6eldRNnEr?=
 =?utf-8?B?Q2pLdEFnSHk3UkpYZWJueHZ1cEVGVXd6UDdOZjhQRzViVW9YRmtGQmQ0eFRu?=
 =?utf-8?B?aGpZci9IYlhtM3M2ekgvMjlQbWV4blFmdk9rRmQzUlFNaFM1UmtQLzlUb1dR?=
 =?utf-8?B?bUhnMXhmaWc5L0lMRXRKbzFGZmVrUURJZHVmMmxKWmEvMVdYZlU5NU9nU1k5?=
 =?utf-8?B?TjZodktSWFZWcjlsUkNuSm93dmRUWllpYzVhYnJwemFRdXcvUlB2UWNxbXBX?=
 =?utf-8?B?RUJsZUhVZ1lMVUpGa3NKWHFOWVBzU0EwVjVvL0o0VDd6ckJsSDZ0WVdUb0cx?=
 =?utf-8?B?dTBxRXVKUUlzMDRjUXlkM0M3UVV0b1BDZlFLc3daaTR0Wk9MMThHUkY1QVRD?=
 =?utf-8?B?OWgzM2FVRVhwWnRueXVvWldLYVJMS0Rxa2ZpTFBvNDdYdisxdjBWQUpjNkhv?=
 =?utf-8?B?MTVaTjRPb0tPVTVoeldMNHhzN3BJT0d4cFRjcStOMnZXL2VJSzFCeFcwRHJH?=
 =?utf-8?B?TWQ2a2lmOHo1L3hnWHRPT1Jva0VSTjEvaFZXbHdyUzBGKy9aN3Bqb042TEV3?=
 =?utf-8?B?UDdwY1JEWUVURHpDS09McU13bFo5K2pCM2RBU0ZHb0tMUEFTS2prTU5yaC8w?=
 =?utf-8?B?TFRyY2xiUjRFSkFtbnNvTG1XZWNOT25ZMHNiUVh1R3JZc2ZiSWFUQ1phRTY3?=
 =?utf-8?B?Nm9wTTRFdGZVYnFKSEFpeWFaMVBwK0NJZGt2bGJhTFBuY0V2dlV4TDRtZ3lX?=
 =?utf-8?B?eTEzSDZwZ1J6TTNySExJOXphVUxuV0hTSmQyZVVTNklQYkNWZ3Q1ZWVRTkt0?=
 =?utf-8?B?Y3hkUWd5bnA2UjB3YnRiUkFzbnFIY08zOGVXc2dBYXJGQWMyQTNJWlhsU1Nh?=
 =?utf-8?B?eS82dUtQZ3dMWUowbDNPTFdpUk9kU0xoU0NkZVdYMVZTMHZLVGJRcGQ1TnlS?=
 =?utf-8?B?QUZVRnFoU1RVMWdnMDJhajRaalk0RmF4VE56UEMzZEFMbi92N0hrcXA4aDFR?=
 =?utf-8?B?VXlMQ2RNVk1yUzV4ZXdVSU1RVmFJRVI0MkI3SDdvS1RnME9tekpxRllaOXZx?=
 =?utf-8?B?RHFYTlJPY3VtWlYvaWhDOS9Rb0hyNXJtcTJEYnh5TE42amdteE5KZmVZSWUw?=
 =?utf-8?B?Y0RZakpwRHJtUTRqQXJZYzAwSHdnTWIya0dxTjBYMUZScmlLTVVnSkxxYlBU?=
 =?utf-8?B?cEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 42dce1ba-65db-4e57-9693-08dcd1cf737c
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7821.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 19:33:30.6617 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yUaAGtFk9h1VB5exQyKTvkTbUL/xVgG5Y9EfIRkRipAkMRoPQkCB6PzPs0rTox4wfMarE0XnUExXv59Io0i4qN9MGtS39Jsika22PqtAnnA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6054
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

> +	if (prefix) {
> +		strscpy(line_buff, prefix, DMESG_MAX_LINE_LEN - MIN_SPACE - 3);
> +		line_pos = strlen(line_buff);
> +
> +		line_buff[line_pos++] = ':';
> +		line_buff[line_pos++] = ' ';
> +	}
Since 2 characters are added to the end of prefix should the computation
for n be "DMESG_MAX_LINE_LEN - MIN_SPACE - 2"? MIN_SPACE already
accounts for space of trailing newline and null terminator.

Also, prefix is only added to the first line. Is that the intended behavior?


> +		strscpy(line_buff + line_pos, ascii85_encode(val, buff),
> +			DMESG_MAX_LINE_LEN - line_pos);
> +		line_pos += strlen(line_buff + line_pos);
Since space for ASCII85_BUFSZ bytes is guaranteed by checks against
MIN_SPACE output of strscpy can be used to increment line_pos. Although
I do like this safer style that would work even if the checks failed.

> +#undef MIN_SPACE
Suggest to also #undef DMESG_MAX_LINE_LEN here.


Reviewed-by: Julia Filipchuk <julia.filipchuk@intel.com>

