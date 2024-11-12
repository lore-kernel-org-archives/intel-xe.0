Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26EDBD41D5F
	for <intel-xe@archiver.kernel.org>; Tue, 12 Nov 2024 06:52:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D88D310E0D8;
	Tue, 12 Nov 2024 06:52:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XSsuxdMj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBC0410E0D8
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Nov 2024 06:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731394333; x=1762930333;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=BUEmkzj9GNVcy6U1XEGNLrEIy739EwT0T3pMKsWl98Y=;
 b=XSsuxdMj01oJ7pj3dBjq2Dw+tivu7URYvzE3NWp3U/5GnoYmdRzrCzga
 UOcbtmVo4lWKXIg5h/V++dE6a5SHZ5UHhsDbwRUP9zWYl1g6kQsbHO4g9
 jDnpZpibMewc+3S8Anz03D4qVZXf2J5i4+qA2+KsyjevR6+VO78sb9pbq
 FgVWIWjkdIesdFgFP5QPRrTpXLeKb6pQaDw6Rks6z6Tz51oBo/eBqhN0Y
 j7M++PUPSzPMvJ3ISJcu8PhRBuulOT/cVSs30mcg3gsRBlbEStRWcxHwU
 YmwI2ATferyczGLJjHWyFY+OZJ4UtNbNNrU903flChVPF3R6jgj0vFbdm w==;
X-CSE-ConnectionGUID: W49DQSBDTmeiwVKQRCTiVA==
X-CSE-MsgGUID: gGgCSgUlSaOTbjoMjjwy7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11253"; a="42593573"
X-IronPort-AV: E=Sophos;i="6.12,147,1728975600"; d="scan'208";a="42593573"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2024 22:52:12 -0800
X-CSE-ConnectionGUID: y2+kO1S9Rn6LEDDFQvrqew==
X-CSE-MsgGUID: nZ4ulGmUTwiAk3SIuLzdeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,147,1728975600"; d="scan'208";a="87063933"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Nov 2024 22:52:12 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 11 Nov 2024 22:52:11 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 11 Nov 2024 22:52:11 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 11 Nov 2024 22:52:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mtctiy1EAjZwv8MYWEonvGmx+HmJlyAQyp7uNuAkq6EjNVSYibmUq0NqhAN07DSjilDJOG5ftsmCGNNYB2o0Bbnq+uHl+V3tCAxjT05ny4QHREWkVoL+3bd7ephVkZC3fT+buIM/eJOXAETtHn+OJXiJbXTtRNzDLppXwN8N5mI7vQImKVoNMiI9FNMd8K3Zyl4Fzoihg5INCWnQL1tGbkK7xJVDHgVnkg5kinChDXrniTn5cKer2oLVVJn82Vct646pyCzutg+raXfhmMVPT27EskKc9deS+R3rluFrTCHmfmKLodfliyumcdE7q7Zf5477dU77XWWKQjmrINUkCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0e5qkCmkcoK9ORS1sgLYAwBYtsYVuQ0yc3B9J3UHlOo=;
 b=rw+yp/Mwco+badPRw/QQed4S3csMfmW4r7PFvsEMv1q/Wyk2G7+VdpPGcVSPPCXhEwcgaGPTSFFHWtQIXxpyzcc/t9UsplugktET2xs397XzYqcJ4lGUklrP7X94mTaDno55pq6oJJbwx4xdbFFq5P9eWTyWo0hz/RzDUQBOtN7Pb2w0ZBkt/N2r8930FDtmP5LrWRBrssNhzX0+Z41j0NU9ciL5Dweh/lbNCfQS4ysqLQFa2gVEQNODAFnXG7vo0jZR2B4z3oAGaXy035qshX4aOsLAF1ZM6OuWywvixtMX7kHYD1s5txdxO4ZM7qzgmgrpWGloXqKtKSqwtHc8Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by IA1PR11MB6098.namprd11.prod.outlook.com (2603:10b6:208:3d6::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Tue, 12 Nov
 2024 06:52:03 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1%7]) with mapi id 15.20.8137.027; Tue, 12 Nov 2024
 06:52:03 +0000
Message-ID: <dd834ae9-841d-4569-9e7c-7f08a4ac1a43@intel.com>
Date: Mon, 11 Nov 2024 22:52:00 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/xe/pmu: Add GT C6 events
To: Riana Tauro <riana.tauro@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20241108181512.3461481-1-vinay.belgaumkar@intel.com>
 <20241108181512.3461481-3-vinay.belgaumkar@intel.com>
 <Zy6RiQtCjTcSDTsw@intel.com> <cbfe45f6-355f-4d6a-accd-bc12800c3d69@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <cbfe45f6-355f-4d6a-accd-bc12800c3d69@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0041.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::16) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|IA1PR11MB6098:EE_
X-MS-Office365-Filtering-Correlation-Id: 31769601-0600-4bb1-8018-08dd02e683ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UWdjNlhhck5DQVZCc1lnL29HTmxjdzlURTdNTER0S29MelQ0REJiQ0x0cEVE?=
 =?utf-8?B?dWtTeXZVM0FQMjljNmw0OVIxQ2t0ckR5b0pWL3pyVGZVeGRaQkswckt3cko4?=
 =?utf-8?B?bUJyNDhxbXBoM3N4SzJ6T3krRDJva1pxaVFaSFNBZk4zWTZSVE4zd1hSbzl2?=
 =?utf-8?B?MjQ2UUZBQ1VpekQvZWFtaCtWVVB4Yld3alIyckhBRUdRaURtNDZ4K2I4ZEtj?=
 =?utf-8?B?MnVMRnVsNDdxb0hJSGd3OUozQ3F4b2o0RnBHUXY3bDFpY3luRzdFNnQvZWE1?=
 =?utf-8?B?L1Z6YmtCcGFyQ1hjNGgyNVBGVEV1STUwVmdTVCtScWVKb1Z6MVg1Q1JSbDNB?=
 =?utf-8?B?c1Z0NXphbjl6dEhuUlorZVNkeGJpUnRLOUhIaUtkMDVxYlVDelFWL01CMzI4?=
 =?utf-8?B?NFJXR2dYTnFFZGdyME5BYS9tc3VKbnV5SHFWNlRHVFF1YlJ2Umt5dFFhTCtr?=
 =?utf-8?B?dVFlZlgzbithWi91akNEb2RNdzI0MEp3aHRnenlSU0lFZmluWXVTSUs5ellO?=
 =?utf-8?B?UEU4WG5aNnN5ZXUveCtQY1h1eU43czE4VVpxdXFPeTh4dFlTbDlyVWVLMWZH?=
 =?utf-8?B?MExJWGxyU2FpQXgyeWxGZ1pocFE3TWpjZzdCcGNvaWNWZ1c5OHBaR2ZtVDYw?=
 =?utf-8?B?NjVteEhkaFcrbFdGd2JkUUl6emtDaW1yMUROazVFbUZQalJSSXVaS0pQTkZ5?=
 =?utf-8?B?QjhrcVJmRC9yQWZ2UldkMWduSjdIdy82aFUwV21CSUl1OWo1aGJmQkpJY2RV?=
 =?utf-8?B?aDFuU3FrSER2UEhyaDIxVHVhZmVITWl1cmtYclVyT2Q4RGJWVUlFSTl6L3ZC?=
 =?utf-8?B?NTNMeUxaTWNnQktieW5WcnJuOEtDYW9OVWx6dkNiTjNmWHNOUlZtVlpKbTRa?=
 =?utf-8?B?Q3lRRE9GaTRiWStNQXVSN0JEWFZSUkhuckxsOW5wa0RXWDZpMlZoMytqWUEr?=
 =?utf-8?B?eWtwUjkrMS94MkxHYnZaUHdKTkZ6U2JFYjd0VTM0MVBzMGxaUWQrdkU4MXYy?=
 =?utf-8?B?M2c4UGErdHVFeU9Ub3BTZlIxYi9qa3ZrTUNYVktRNFEyWFVhTDhMeXBqSml1?=
 =?utf-8?B?QVJ2UTZ6SDJtbERtL25PZHBsT1FYaEM0UC9iL1VOOEtoK2VTRVhxZzhoeElM?=
 =?utf-8?B?dEhSSDJyUXc2S1dsREpuSGJ1YThyZ09FUUlVbGtMR1pkRCtwZkVmVkR1R1Jv?=
 =?utf-8?B?MHZYbzlaajhIQ1U4cVJOSFhpa0dsODZJaTVFYU1Ja2c0a2JYMVh3NHliR0lD?=
 =?utf-8?B?SGhFNCsvV1ZpZjVzanZJem12eVJmc2laTHMwSi9UakxjNjF5T1pGZGllWDFR?=
 =?utf-8?B?MjErbzUwa1dLQStKV1p0MzI0NDEzM045cFlKWEhZamxKWlBwWFRSTmtOdm4v?=
 =?utf-8?B?V3pmQWhCbVpNTkw2UGRBdFNJRVpSYWJ3S2JZYWN3QzFXMHUyaDdqb3pzR1hQ?=
 =?utf-8?B?a0NpaTFTZ2k0aUViYUJoc3VqWDNCaVN2Z25VcmU2WWpqYkx6K3lTcXpTblIx?=
 =?utf-8?B?dVJKczQ4ZyttUXIzZVRSTmRMZHd3QVVtNjZPY3d3anBHU3QrdFZNS2VlbVho?=
 =?utf-8?B?NTJ4MVkrc1d3TkdMb1UvenJkbFMzK3cxNEhPaGEwYkh6M2FiZlZpU2ROczZz?=
 =?utf-8?B?dHF0RmhqdnNaeFZBS2hwTGxBWCtIYU0vOXpjVllsTU9nelBGL0lMeWFmUFdK?=
 =?utf-8?B?QytTSExUdzJaWW5SWUJob0pXamd6OCtaaU1iZVNyU0JYdE5ka3RReFliSExK?=
 =?utf-8?Q?ay5ypMHFFOJvS/hGH1hXluCUcY26oC+Ni6bT9Xq?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MmkxTGxYZmtLbE40WUxDUkdsNnVwU1FxVDdudDE4QVJVR05kczhDc3hmNEJz?=
 =?utf-8?B?WUxCMUtPSUlrNkptZkxMcHhIZnByU3pMdmJuanoyRi9sZWxxd21OWGd4MTBO?=
 =?utf-8?B?S2hGRmpYdUJrdm91Ym1ZUSt6eUNRbWlqMjVGNmZuR2R4eWY2WE9VVk5DSm1D?=
 =?utf-8?B?NUdvblAxK1NrUTFWYzVuQkRSSjdjU21QUHVaUDN4bHRtYjRxY0o2SW9RYk8r?=
 =?utf-8?B?NDk2QXJYMTdlamtRNTdXdWJNcmRBcFN0czl6VDdSOHFRTER1YUFORG02ZXNM?=
 =?utf-8?B?TG9zYzg0elcxbmYxS1BpbG82Wk90eFVJUjQ2RnJNY0VYSnBLRWIvVFRYUE5Q?=
 =?utf-8?B?aXVBWE9Tek44SjJqbmZsNXFDaUQrOFJYdDliUEVtS2JWYjdjaEdHMlhJemRG?=
 =?utf-8?B?aXd1ZEowMUovWEp6MzA1Q0NibXRKVjgzT0NLempTem1pc3pVMUt3eHFoYURO?=
 =?utf-8?B?aHg3bmVJUDZncVRzWUNjbDUvdUdESmRLMTYxdm4rcUVKL0h2TlFucWc3WGk0?=
 =?utf-8?B?aG1ZTFBGcmg2TUIrdlpxMC9aaytNWUE5UUo5NFZkekNBZlRBak1vWE1veU9J?=
 =?utf-8?B?Z1owR2lxT2lYbjVHWHVmSk1DamJaZUdZN1V6KzlSdEhkWlV2ZllIL0hlVlBF?=
 =?utf-8?B?UTNCbXdjYWpHcWpRRm1OdXIyNmxGTmVtNi9acWs5eTFzSXZLOHA2L1dzeWx2?=
 =?utf-8?B?amFRTEdMOS8zdXZ3bUE3c29ycWJ4c21CWlJaSnlCdU1ZMm1FRUJ5V1lYbThV?=
 =?utf-8?B?U0NHUzZnWDN6bUtEYUN2ZWlSdEhoNVdDd25CZG8yTjVHK2k5Yjl0eGYwSFMv?=
 =?utf-8?B?RTJreG9yRGVFZEhHZWRXM1NOZ3ZxSERDQnFEOTl0RWJldnRJaC9HNFhnamdH?=
 =?utf-8?B?bzEyY29XT0x1bVZUNnIzRWwwNVVJNlBaWVBBR1psQjFPNm9jY0l0aUd3VHRX?=
 =?utf-8?B?SmNBenczRXB5b2xlaWMzT2hhQlZ0VVoyQ2V0b0daNGx5WVdBaFRQb3NtSElQ?=
 =?utf-8?B?WU9IRVRiSklxQ01rcDNFZnozdDZvU01kUnV1R1BFSkNOZ3paTy8vQzdkUHUr?=
 =?utf-8?B?WVdwTGhCTUNHR2w2K0ZoMTlDMEtVUmFRdFgvTTRrOWdZbW85S0ZzRStQN09P?=
 =?utf-8?B?R1lIU1E5WXhpdDl2eTE5RHZRZ2VaVTc1WW1ra2dqYWVFVGVjVC9HWklCU2p3?=
 =?utf-8?B?U0dDOXRXLzZEQzlkV1RRc2pCRmlqQ0NpeHNVNnNiQU1KYU9sc2dSVVJLY3B6?=
 =?utf-8?B?U29DbDc1SlUwV2xVRkJwZFdwWENPc3BPRWRrbWRXN3VxcDhHTVZJT0ZIN1h1?=
 =?utf-8?B?bmJpcTFQTGlGSENaVTUvY0drLzkvMDAzb2REMW4vc0dhdnFDZnZtNzgzNGU5?=
 =?utf-8?B?VjM0ampQNnQ3eVI1akxkclFHaHYzRFpRRGJpRTFIMmttOXVESXFqdTlQUDlq?=
 =?utf-8?B?TnRpRndXcktlbnJQdDhHMXRvTzF1aEtWcFNYQ2t4Ykx1QTJuU1hURjdJWEFq?=
 =?utf-8?B?NmRVVVdtUVlSaWhzNlU1aWs1RGJqWEgrbmlWa3d2S2xvL2pJVXE3c3dyZER4?=
 =?utf-8?B?S2h5Z3NMMTZvTEZ1VlBlZ3FWc3RMeFp4Y1RvUnpzaXRGUGhlQ092Mk9WS2o5?=
 =?utf-8?B?UVNjSExMcjQ1Tmg1eWlzcmQ4bmdTRXFaK3g4dDIrQ1lnRGFwV0UrRC9melFE?=
 =?utf-8?B?NmVEWmx2SHpUWEZhVEpiM1IzbWlicGxTMkYyU0N1ekNSRjcvN01tMElVdmts?=
 =?utf-8?B?NEZFbGJqWjl1bm8yNytmNHNQYW40TFNUOEZBSXJIQ0RkUXFYQ0NLamx0MjZS?=
 =?utf-8?B?N3JKOFRkVGp3MmJQcEZGUGZZdmhFcWQ3OUdaY3M2M2ZwZUN0OUZNdktFM0ZC?=
 =?utf-8?B?WGVkT1o1djhKc1BDRThIcTU0dytlamVzT2JMVnpDSnFKVWsyRWI5ektmcE5h?=
 =?utf-8?B?YlJZcTZFZ3FML2NUWGtyZU5rRWRFYVJHcnZZSmJ6bk5GM2U4dTVYaFJ1TmM4?=
 =?utf-8?B?MFg5RlA1UW45OGRoVDVXSUFHcCsvV0ZwSWF0WmtXd1BKaitPM1FlYllZc0sv?=
 =?utf-8?B?eitaZHh5dUs1TzhCMDVVTjJlMGdiM1B0SUNiZndiRUN5VjA0RDNFNDFwU3Yz?=
 =?utf-8?B?a1oyWXBFdzNSazg3RUFaTEJtdE9PbGxXY25sclduUnBWWkZmbVJ4QmlhelU0?=
 =?utf-8?B?Q3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 31769601-0600-4bb1-8018-08dd02e683ac
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2024 06:52:03.4059 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PF1qNye2Qr/0D0f6Ofjvz6wTs/Qrn31s0KsnMc0MXuFflbINVU+NUXuWMZiopfmUGc6TXZ0RAMvJqeKuCvwOPdzPknp/jSsa/c5PCY1nau8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6098
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


On 11/11/2024 9:56 PM, Riana Tauro wrote:
> Hi Vinay
>
> On 11/9/2024 4:02 AM, Rodrigo Vivi wrote:
>> On Fri, Nov 08, 2024 at 10:15:11AM -0800, Vinay Belgaumkar wrote:
>>> Provide a PMU interface for GT C6 residency counters. The 
>>> implementation
>>> is ported over from the i915 PMU code. Residency is provided in 
>>> units of
>>> ms(like sysfs entry in - /sys/class/drm/card0/device/tile0/gt0/gtidle).
>>>
>>> Sample usage and output-
>>>
>>> $ perf list | grep rc6
>>>
>>>    xe_0000_00_02.0/rc6-residency-gt0/                 [Kernel PMU 
>>> event]
>>>    xe_0000_00_02.0/rc6-residency-gt1/                 [Kernel PMU 
>>> event]
>>>
>>> $ perf stat -e xe_0000_00_02.0/rc6-residency-gt0/
>>>
>>>    Performance counter stats for 'system wide':
>>>
>>>                1907 ms   xe/rc6-residency-gt0/
>>>         1.907581788 seconds time elapsed
> For the sysfs, it was suggested to rename it to a generic name instead 
> of using rc6. The sysfs was renamed to gt-c6.
>
> PMU also would require a similar change as it exposes per-gt.

Ok, can change it to c6-residency-gt<n>.

Thanks,

Vinay.

>
> Thanks,
> Riana
>>>
>>> v2: Checkpatch fix, move timer code to next patch
>>> v3: Fix kunit issue
>>> v4: Fix for locking issue, fix review comments (Riana)
>>> v5: Add xe_pmu_disable() function to reset enable_count
>>>
>>
>> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>
>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_gt.c        |   2 +
>>>   drivers/gpu/drm/xe/xe_gt_idle.c   |  17 ++-
>>>   drivers/gpu/drm/xe/xe_gt_idle.h   |   1 +
>>>   drivers/gpu/drm/xe/xe_pmu.c       | 220 
>>> +++++++++++++++++++++++++++++-
>>>   drivers/gpu/drm/xe/xe_pmu.h       |   2 +
>>>   drivers/gpu/drm/xe/xe_pmu_types.h |  63 +++++++++
>>>   6 files changed, 299 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>>> index d6744be01a68..fd18bbce99da 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt.c
>>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>>> @@ -877,6 +877,8 @@ int xe_gt_suspend(struct xe_gt *gt)
>>>         xe_gt_idle_disable_pg(gt);
>>>   +    xe_pmu_suspend(gt);
>>> +
>>>       xe_gt_disable_host_l2_vram(gt);
>>>         xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c 
>>> b/drivers/gpu/drm/xe/xe_gt_idle.c
>>> index fd80afeef56a..47b5696c7137 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt_idle.c
>>> +++ b/drivers/gpu/drm/xe/xe_gt_idle.c
>>> @@ -275,18 +275,25 @@ static ssize_t idle_status_show(struct device 
>>> *dev,
>>>   }
>>>   static DEVICE_ATTR_RO(idle_status);
>>>   +u64 xe_gt_idle_residency(struct xe_gt_idle *gtidle)
>>> +{
>>> +    struct xe_guc_pc *pc = gtidle_to_pc(gtidle);
>>> +
>>> +    return get_residency_ms(gtidle, gtidle->idle_residency(pc));
>>> +}
>>> +
>>>   static ssize_t idle_residency_ms_show(struct device *dev,
>>>                         struct device_attribute *attr, char *buff)
>>>   {
>>>       struct xe_gt_idle *gtidle = dev_to_gtidle(dev);
>>> -    struct xe_guc_pc *pc = gtidle_to_pc(gtidle);
>>> +    struct xe_gt *gt = gtidle_to_gt(gtidle);
>>>       u64 residency;
>>>   -    xe_pm_runtime_get(pc_to_xe(pc));
>>> -    residency = gtidle->idle_residency(pc);
>>> -    xe_pm_runtime_put(pc_to_xe(pc));
>>> +    xe_pm_runtime_get(gt_to_xe(gt));
>>> +    residency = xe_gt_idle_residency(gtidle);
>>> +    xe_pm_runtime_put(gt_to_xe(gt));
>>>   -    return sysfs_emit(buff, "%llu\n", get_residency_ms(gtidle, 
>>> residency));
>>> +    return sysfs_emit(buff, "%llu\n", residency);
>>>   }
>>>   static DEVICE_ATTR_RO(idle_residency_ms);
>>>   diff --git a/drivers/gpu/drm/xe/xe_gt_idle.h 
>>> b/drivers/gpu/drm/xe/xe_gt_idle.h
>>> index 4455a6501cb0..795a02c9d89c 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt_idle.h
>>> +++ b/drivers/gpu/drm/xe/xe_gt_idle.h
>>> @@ -17,5 +17,6 @@ void xe_gt_idle_disable_c6(struct xe_gt *gt);
>>>   void xe_gt_idle_enable_pg(struct xe_gt *gt);
>>>   void xe_gt_idle_disable_pg(struct xe_gt *gt);
>>>   int xe_gt_idle_pg_print(struct xe_gt *gt, struct drm_printer *p);
>>> +u64 xe_gt_idle_residency(struct xe_gt_idle *gtidle);
>>>     #endif /* _XE_GT_IDLE_H_ */
>>> diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
>>> index 7ce66c022e27..80d78628006e 100644
>>> --- a/drivers/gpu/drm/xe/xe_pmu.c
>>> +++ b/drivers/gpu/drm/xe/xe_pmu.c
>>> @@ -11,8 +11,11 @@
>>>   #include "xe_device.h"
>>>   #include "xe_force_wake.h"
>>>   #include "xe_gt_clock.h"
>>> +#include "xe_gt_idle.h"
>>> +#include "xe_guc_pc.h"
>>>   #include "xe_mmio.h"
>>>   #include "xe_macros.h"
>>> +#include "xe_module.h"
>>>   #include "xe_pm.h"
>>>     /**
>>> @@ -22,6 +25,8 @@
>>>   static cpumask_t xe_pmu_cpumask;
>>>   static unsigned int xe_pmu_target_cpu = -1;
>>>   +#define FREQUENCY 200
>>> +
>>>   /**
>>>    * DOC: Xe PMU (Performance Monitoring Unit)
>>>    *
>>> @@ -31,7 +36,9 @@ static unsigned int xe_pmu_target_cpu = -1;
>>>    * Example commands to list/record supported perf events-
>>>    *
>>>    * $ ls -ld /sys/bus/event_source/devices/xe_*
>>> - * $ ls /sys/bus/event_source/devices/xe_0000_00_02.0/events/
>>> + * $ lrwxrwxrwx 1 root root 0 Oct 25 00:19 
>>> /sys/bus/event_source/devices/xe_0000_03_00.0 ->
>>> + * ../../../devices/xe_0000_03_00.0
>>> + * $ ls /sys/bus/event_source/devices/xe_0000_03_00.0/events/
>>>    *
>>>    * You can also use the perf tool to grep for a certain event-
>>>    * $ perf list | grep rc6
>>> @@ -39,8 +46,30 @@ static unsigned int xe_pmu_target_cpu = -1;
>>>    * To list a specific event at regular intervals-
>>>    * $ perf stat -e <event_name> -I <interval>
>>>    *
>>> + * For RC6, following command will give GT residency per second-
>>> + * $ perf stat -e xe_0000_03_00.0/rc6-residency-gt0/ -I 1000
>>> + * #           time             counts unit events
>>> + *      1.001153792               1002 ms 
>>> xe_0000_03_00.0/rc6-residency-gt0/
>>> + *      2.008338100               1007 ms 
>>> xe_0000_03_00.0/rc6-residency-gt0/
>>> + *      3.009887054               1002 ms 
>>> xe_0000_03_00.0/rc6-residency-gt0/
>>> + *      4.011383318               1001 ms 
>>> xe_0000_03_00.0/rc6-residency-gt0/
>>> + *
>>> + * To verify this matches with sysfs values of rc6, you can run 
>>> following command-
>>> + * $ for i in {1..10} ; do cat 
>>> /sys/class/drm/card0/device/tile0/gt0/gtidle/idle_residency_ms;
>>> + *   sleep 1; done
>>> + *      2348877
>>> + *      2349901
>>> + *      2350917
>>> + *      2352945
>>> + *
>>> + * Each value is roughly a 1000ms increment here as well. This is 
>>> expected GT residency when idle.
>>>    */
>>>   +static struct xe_pmu *event_to_pmu(struct perf_event *event)
>>> +{
>>> +    return container_of(event->pmu, struct xe_pmu, base);
>>> +}
>>> +
>>>   static unsigned int config_gt_id(const u64 config)
>>>   {
>>>       return config >> __XE_PMU_GT_SHIFT;
>>> @@ -51,6 +80,35 @@ static u64 config_counter(const u64 config)
>>>       return config & ~(~0ULL << __XE_PMU_GT_SHIFT);
>>>   }
>>>   +static unsigned int other_bit(const u64 config)
>>> +{
>>> +    unsigned int val;
>>> +
>>> +    switch (config_counter(config)) {
>>> +    case XE_PMU_RC6_RESIDENCY:
>>> +        val = __XE_PMU_RC6_RESIDENCY_ENABLED;
>>> +        break;
>>> +    default:
>>> +        /*
>>> +         * Events that do not require sampling, or tracking state
>>> +         * transitions between enabled and disabled can be ignored.
>>> +         */
>>> +        return -1;
>>> +    }
>>> +
>>> +    return config_gt_id(config) * __XE_PMU_TRACKED_EVENT_COUNT + val;
>>> +}
>>> +
>>> +static unsigned int config_bit(const u64 config)
>>> +{
>>> +    return other_bit(config);
>>> +}
>>> +
>>> +static unsigned int event_bit(struct perf_event *event)
>>> +{
>>> +    return config_bit(event->attr.config);
>>> +}
>>> +
>>>   static void xe_pmu_event_destroy(struct perf_event *event)
>>>   {
>>>       struct xe_device *xe =
>>> @@ -70,6 +128,10 @@ config_status(struct xe_device *xe, u64 config)
>>>           return -ENOENT;
>>>         switch (config_counter(config)) {
>>> +    case XE_PMU_RC6_RESIDENCY:
>>> +        if (xe->info.skip_guc_pc)
>>> +            return -ENODEV;
>>> +        break;
>>>       default:
>>>           return -ENOENT;
>>>       }
>>> @@ -116,6 +178,63 @@ static int xe_pmu_event_init(struct perf_event 
>>> *event)
>>>       return 0;
>>>   }
>>>   +static inline s64 ktime_since_raw(const ktime_t kt)
>>> +{
>>> +    return ktime_to_ms(ktime_sub(ktime_get_raw(), kt));
>>> +}
>>> +
>>> +static u64 read_sample(struct xe_pmu *pmu, unsigned int gt_id, int 
>>> sample)
>>> +{
>>> +    return pmu->event_sample[gt_id][sample].cur;
>>> +}
>>> +
>>> +static void
>>> +store_sample(struct xe_pmu *pmu, unsigned int gt_id, int sample, 
>>> u64 val)
>>> +{
>>> +    pmu->event_sample[gt_id][sample].cur = val;
>>> +}
>>> +
>>> +static u64 get_rc6(struct xe_gt *gt)
>>> +{
>>> +    struct xe_device *xe = gt_to_xe(gt);
>>> +    const unsigned int gt_id = gt->info.id;
>>> +    struct xe_pmu *pmu = &xe->pmu;
>>> +    bool device_awake;
>>> +    unsigned long flags;
>>> +    u64 val;
>>> +
>>> +    device_awake = xe_pm_runtime_get_if_active(xe);
>>> +    if (device_awake) {
>>> +        val = xe_gt_idle_residency(&gt->gtidle);
>>> +        xe_pm_runtime_put(xe);
>>> +    }
>>> +
>>> +    spin_lock_irqsave(&pmu->lock, flags);
>>> +
>>> +    if (device_awake) {
>>> +        store_sample(pmu, gt_id, __XE_SAMPLE_RC6, val);
>>> +    } else {
>>> +        /*
>>> +         * We think we are runtime suspended.
>>> +         *
>>> +         * Report the delta from when the device was suspended to now,
>>> +         * on top of the last known real value, as the approximated 
>>> RC6
>>> +         * counter value.
>>> +         */
>>> +        val = ktime_since_raw(pmu->sleep_last[gt_id]);
>>> +        val += read_sample(pmu, gt_id, __XE_SAMPLE_RC6);
>>> +    }
>>> +
>>> +    if (val < read_sample(pmu, gt_id, __XE_SAMPLE_RC6_LAST_REPORTED))
>>> +        val = read_sample(pmu, gt_id, __XE_SAMPLE_RC6_LAST_REPORTED);
>>> +    else
>>> +        store_sample(pmu, gt_id, __XE_SAMPLE_RC6_LAST_REPORTED, val);
>>> +
>>> +    spin_unlock_irqrestore(&pmu->lock, flags);
>>> +
>>> +    return val;
>>> +}
>>> +
>>>   static u64 __xe_pmu_event_read(struct perf_event *event)
>>>   {
>>>       struct xe_device *xe =
>>> @@ -126,6 +245,9 @@ static u64 __xe_pmu_event_read(struct perf_event 
>>> *event)
>>>       u64 val = 0;
>>>         switch (config_counter(config)) {
>>> +    case XE_PMU_RC6_RESIDENCY:
>>> +        val = get_rc6(gt);
>>> +        break;
>>>       default:
>>>           drm_warn(&gt->tile->xe->drm, "unknown pmu event\n");
>>>       }
>>> @@ -157,6 +279,28 @@ static void xe_pmu_event_read(struct perf_event 
>>> *event)
>>>     static void xe_pmu_enable(struct perf_event *event)
>>>   {
>>> +    struct xe_pmu *pmu = event_to_pmu(event);
>>> +    const unsigned int bit = event_bit(event);
>>> +    unsigned long flags;
>>> +
>>> +    if (bit == -1)
>>> +        goto update;
>>> +
>>> +    spin_lock_irqsave(&pmu->lock, flags);
>>> +
>>> +    /*
>>> +     * Update the bitmask of enabled events and increment
>>> +     * the event reference counter.
>>> +     */
>>> +    BUILD_BUG_ON(ARRAY_SIZE(pmu->enable_count) != XE_PMU_MASK_BITS);
>>> +    XE_WARN_ON(bit >= ARRAY_SIZE(pmu->enable_count));
>>> +    XE_WARN_ON(pmu->enable_count[bit] == ~0);
>>> +
>>> +    pmu->enable |= BIT(bit);
>>> +    pmu->enable_count[bit]++;
>>> +
>>> +    spin_unlock_irqrestore(&pmu->lock, flags);
>>> +update:
>>>       /*
>>>        * Store the current counter value so we can report the 
>>> correct delta
>>>        * for all listeners. Even when the event was already enabled 
>>> and has
>>> @@ -165,6 +309,31 @@ static void xe_pmu_enable(struct perf_event 
>>> *event)
>>>       local64_set(&event->hw.prev_count, __xe_pmu_event_read(event));
>>>   }
>>>   +static void xe_pmu_disable(struct perf_event *event)
>>> +{
>>> +    struct xe_device *xe =
>>> +        container_of(event->pmu, typeof(*xe), pmu.base);
>>> +    struct xe_pmu *pmu = &xe->pmu;
>>> +    const unsigned int bit = event_bit(event);
>>> +    unsigned long flags;
>>> +
>>> +    if (bit == -1)
>>> +        return;
>>> +
>>> +    spin_lock_irqsave(&pmu->lock, flags);
>>> +
>>> +    XE_WARN_ON(bit >= ARRAY_SIZE(pmu->enable_count));
>>> +    XE_WARN_ON(pmu->enable_count[bit] == 0);
>>> +    /*
>>> +     * Decrement the reference count and clear the enabled
>>> +     * bitmask when the last listener on an event goes away.
>>> +     */
>>> +    if (--pmu->enable_count[bit] == 0)
>>> +        pmu->enable &= ~BIT(bit);
>>> +
>>> +    spin_unlock_irqrestore(&pmu->lock, flags);
>>> +}
>>> +
>>>   static void xe_pmu_event_start(struct perf_event *event, int flags)
>>>   {
>>>       struct xe_device *xe =
>>> @@ -190,6 +359,8 @@ static void xe_pmu_event_stop(struct perf_event 
>>> *event, int flags)
>>>       if (flags & PERF_EF_UPDATE)
>>>           xe_pmu_event_read(event);
>>>   +    xe_pmu_disable(event);
>>> +
>>>   out:
>>>       event->hw.state = PERF_HES_STOPPED;
>>>   }
>>> @@ -291,6 +462,7 @@ create_event_attributes(struct xe_pmu *pmu)
>>>           const char *name;
>>>           const char *unit;
>>>       } events[] = {
>>> +        __event(0, "rc6-residency", "ms"),
>>>       };
>>>         struct perf_pmu_events_attr *pmu_attr = NULL, *pmu_iter;
>>> @@ -477,6 +649,32 @@ static void 
>>> xe_pmu_unregister_cpuhp_state(struct xe_pmu *pmu)
>>>       cpuhp_state_remove_instance(cpuhp_state, &pmu->cpuhp.node);
>>>   }
>>>   +static void store_rc6_residency(struct xe_gt *gt)
>>> +{
>>> +    struct xe_device *xe = gt_to_xe(gt);
>>> +    struct xe_pmu *pmu = &xe->pmu;
>>> +
>>> +    store_sample(pmu, gt->info.id, __XE_SAMPLE_RC6,
>>> +             xe_gt_idle_residency(&gt->gtidle));
>>> +    pmu->sleep_last[gt->info.id] = ktime_get_raw();
>>> +}
>>> +
>>> +/**
>>> + * xe_pmu_suspend() - Save residency count before suspend
>>> + */
>>> +void xe_pmu_suspend(struct xe_gt *gt)
>>> +{
>>> +    struct xe_device *xe = gt_to_xe(gt);
>>> +    struct xe_pmu *pmu = &xe->pmu;
>>> +
>>> +    if (!pmu->base.event_init)
>>> +        return;
>>> +
>>> +    spin_lock_irq(&pmu->lock);
>>> +    store_rc6_residency(gt);
>>> +    spin_unlock_irq(&pmu->lock);
>>> +}
>>> +
>>>   /**
>>>    * xe_pmu_unregister() - Remove/cleanup PMU registration
>>>    */
>>> @@ -497,6 +695,24 @@ void xe_pmu_unregister(void *arg)
>>>       free_event_attributes(pmu);
>>>   }
>>>   +static void init_rc6(struct xe_pmu *pmu)
>>> +{
>>> +    struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
>>> +    struct xe_gt *gt;
>>> +    unsigned int j;
>>> +
>>> +    for_each_gt(gt, xe, j) {
>>> +        xe_pm_runtime_get(xe);
>>> +        u64 val = xe_gt_idle_residency(&gt->gtidle);
>>> +
>>> +        store_sample(pmu, j, __XE_SAMPLE_RC6, val);
>>> +        store_sample(pmu, j, __XE_SAMPLE_RC6_LAST_REPORTED,
>>> +                 val);
>>> +        pmu->sleep_last[j] = ktime_get_raw();
>>> +        xe_pm_runtime_put(xe);
>>> +    }
>>> +}
>>> +
>>>   /**
>>>    * xe_pmu_register() - Define basic PMU properties for Xe and add 
>>> event callbacks.
>>>    *
>>> @@ -531,6 +747,8 @@ void xe_pmu_register(struct xe_pmu *pmu)
>>>       if (!pmu->events_attr_group.attrs)
>>>           goto err_name;
>>>   +    init_rc6(pmu);
>>> +
>>>       pmu->base.attr_groups = kmemdup(attr_groups, sizeof(attr_groups),
>>>                       GFP_KERNEL);
>>>       if (!pmu->base.attr_groups)
>>> diff --git a/drivers/gpu/drm/xe/xe_pmu.h b/drivers/gpu/drm/xe/xe_pmu.h
>>> index d07e5dfdfec0..17f5a8d7d45c 100644
>>> --- a/drivers/gpu/drm/xe/xe_pmu.h
>>> +++ b/drivers/gpu/drm/xe/xe_pmu.h
>>> @@ -15,11 +15,13 @@ int xe_pmu_init(void);
>>>   void xe_pmu_exit(void);
>>>   void xe_pmu_register(struct xe_pmu *pmu);
>>>   void xe_pmu_unregister(void *arg);
>>> +void xe_pmu_suspend(struct xe_gt *gt);
>>>   #else
>>>   static inline int xe_pmu_init(void) { return 0; }
>>>   static inline void xe_pmu_exit(void) {}
>>>   static inline void xe_pmu_register(struct xe_pmu *pmu) {}
>>>   static inline void xe_pmu_unregister(void *arg) {}
>>> +static inline void xe_pmu_suspend(struct xe_gt *gt) {}
>>>   #endif
>>>     #endif
>>> diff --git a/drivers/gpu/drm/xe/xe_pmu_types.h 
>>> b/drivers/gpu/drm/xe/xe_pmu_types.h
>>> index 4da96b8fadd1..59d7718c59ce 100644
>>> --- a/drivers/gpu/drm/xe/xe_pmu_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_pmu_types.h
>>> @@ -10,6 +10,8 @@
>>>   #include <linux/spinlock_types.h>
>>>     enum {
>>> +    __XE_SAMPLE_RC6,
>>> +    __XE_SAMPLE_RC6_LAST_REPORTED,
>>>       __XE_NUM_PMU_SAMPLERS
>>>   };
>>>   @@ -23,6 +25,32 @@ enum {
>>>   #define ___XE_PMU_OTHER(gt, x) \
>>>       (((__u64)(x)) | ((__u64)(gt) << __XE_PMU_GT_SHIFT))
>>>   +#define __XE_PMU_OTHER(x) ___XE_PMU_OTHER(0, x)
>>> +
>>> +#define XE_PMU_RC6_RESIDENCY __XE_PMU_OTHER(0)
>>> +#define __XE_PMU_RC6_RESIDENCY(gt) ___XE_PMU_OTHER(gt, 0)
>>> +
>>> +/**
>>> + * Non-engine events that we need to track enabled-disabled 
>>> transition and
>>> + * current state.
>>> + */
>>> +enum xe_pmu_tracked_events {
>>> +    __XE_PMU_RC6_RESIDENCY_ENABLED,
>>> +    __XE_PMU_TRACKED_EVENT_COUNT, /* count marker */
>>> +};
>>> +
>>> +/**
>>> + * How many different events we track in the global PMU mask.
>>> + *
>>> + * It is also used to know to needed number of event reference 
>>> counters.
>>> + */
>>> +#define XE_PMU_MASK_BITS \
>>> +    (XE_PMU_MAX_GT * __XE_PMU_TRACKED_EVENT_COUNT)
>>> +
>>> +struct xe_pmu_sample {
>>> +    u64 cur;
>>> +};
>>> +
>>>   struct xe_pmu {
>>>       /**
>>>        * @cpuhp: Struct used for CPU hotplug handling.
>>> @@ -65,6 +93,41 @@ struct xe_pmu {
>>>        * @pmu_attr: Memory block holding device attributes.
>>>        */
>>>       void *pmu_attr;
>>> +
>>> +    /**
>>> +     * @enable: Bitmask of specific enabled events.
>>> +     *
>>> +     * For some events we need to track their state and do some 
>>> internal
>>> +     * house keeping.
>>> +     *
>>> +     * Each engine event sampler type and event listed in enum
>>> +     * i915_pmu_tracked_events gets a bit in this field.
>>> +     *
>>> +     * Low bits are engine samplers and other events continue from 
>>> there.
>>> +     */
>>> +    u32 enable;
>>> +
>>> +    /**
>>> +     * @enable_count: Reference counter for enabled events.
>>> +     *
>>> +     * Array indices are mapped in the same way as bits in the 
>>> @enable field
>>> +     * and they are used to control sampling on/off when multiple 
>>> clients
>>> +     * are using the PMU API.
>>> +     */
>>> +    unsigned int enable_count[XE_PMU_MASK_BITS];
>>> +    /**
>>> +     * @sample: Current and previous (raw) counters for sampling 
>>> events.
>>> +     *
>>> +     * These counters are updated from the i915 PMU sampling timer.
>>> +     *
>>> +     * Only global counters are held here, while the per-engine 
>>> ones are in
>>> +     * struct intel_engine_cs.
>>> +     */
>>> +    struct xe_pmu_sample 
>>> event_sample[XE_PMU_MAX_GT][__XE_NUM_PMU_SAMPLERS];
>>> +    /**
>>> +     * @sleep_last: Last time GT parked for RC6 estimation.
>>> +     */
>>> +    ktime_t sleep_last[XE_PMU_MAX_GT];
>>>   };
>>>     #endif
>>> -- 
>>> 2.38.1
>>>
>
