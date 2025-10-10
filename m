Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3787ECCA476
	for <intel-xe@archiver.kernel.org>; Fri, 10 Oct 2025 12:54:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0105F10EBF5;
	Fri, 10 Oct 2025 12:54:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NT7pUtc9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11D1A10EBF5
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Oct 2025 12:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760100873; x=1791636873;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Q0J2zp4GvMWLvo6Law92SSR/5EC9kogiu8JMBm8ioLE=;
 b=NT7pUtc9kuiPR1nxb8H6qFS5M5T3NXrK4cIRzpUFYDcxPFJF/fPCMMJK
 aXK80n30k0jLRyhuw4K+rE5qFcizgzxb1OWTbyqTPVzA2t2BiQ4jntFMb
 93iaVv1dOsA4xb6pgNPzF6JxFHKZ9ap+7ARelQbcPf+47piYKgkX/J0z9
 qRzxOt3kwNTjcDkjq4sCwQAUViXkL7lHf4lB4/KzhPfWPwro01h915PoT
 cVluZVHUsOSIpiNMdOsGpMenujizNDJc6PPJ+928YJAnL6+pfGVhr+CcD
 FoJA1Lcs9Dixygu/2QuA0VxEyYWfX8iL+L92HLtgG1CvBuNBjbJ/nzAVY A==;
X-CSE-ConnectionGUID: slRHsAAGTxGoDncJmQzT9Q==
X-CSE-MsgGUID: Rr4v3QHcSHuF/yE0RVDS0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62262084"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="62262084"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2025 05:54:32 -0700
X-CSE-ConnectionGUID: MBpwhtAKSKiDyYj0KiSnRw==
X-CSE-MsgGUID: X8Us9BIoTxiB0NEcPT9LSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,219,1754982000"; d="scan'208";a="185227327"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2025 05:54:30 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 10 Oct 2025 05:54:28 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 10 Oct 2025 05:54:28 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.55) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 10 Oct 2025 05:54:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rGeJYPEuwlrrhBT7idJtb12lK8t4pmVZjYxIekomz5EqqDfohANdq6J0VjjTRG1tS2jA94cIqyH22w5ev8KyoZ53Eqsb/C6/8ibPqBx+M2KTKsUkexYssa9N3jdLQg12ByM5/Sw8FHxcYjZoIpXSYy+4OJiqDCoPfMNvEGAirw7FFDVBGG8En4P9GWj3DmdCAHfHawV8Gu1cxAFu21ma/U5qRB+oboN9yGQFFv9WuZHE6g+SS/gfcNGwulkDSdFIes9KYwTYOtXXliVjsBBdV7A+Cng5jN941F6+sxcA8hiXHZ8eq783I7cdBRiV+a5/8rfJIOt6dqKmdthCjQhIyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CylX3vQoEeDE+rD0GERQV8ZPmtauZPHv22HERam2b/w=;
 b=MI9FQEfEZ6ohrddXr7LrKmm6UwWTztkEx7Gp1+n/uVshIVhFkw2qD/uYq9by87v9RMR2k1OrbAtW+xclg1f7n7KP6szyb2LdVmLmB5BQJafhdm0CnizmBUPHWRl8n8LJ2WOgUI3QL5aP3oaBOhVrz1KKP09Mf8aT7nEef2C8kio+bwjRRvXO4BZnN21ItDTzh4usDNwS06KQq/CBKdPMf+yEDIoHk9Nx0EJqGCpbCjAGrzE6AkL4HLc5ZvUJpLCfUjHWIBit2wi4GL0wMbveqqE4NQEUYnslpxpfvr7jkpa0J5rZ+8P41U6nO7aPi4j/PCH1g12cZcEW2Yukagd7pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SJ5PPF524F3F9FA.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::829) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Fri, 10 Oct
 2025 12:54:25 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9203.009; Fri, 10 Oct 2025
 12:54:25 +0000
Message-ID: <19b3bf2d-99f0-4c88-8c2d-85a414f46eb1@intel.com>
Date: Fri, 10 Oct 2025 14:54:21 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/6] drm/xe: Start using ggtt->start in preparation of
 balloon removal
To: Maarten Lankhorst <dev@lankhorst.se>, <intel-xe@lists.freedesktop.org>
CC: Stuart Summers <stuart.summers@intel.com>
References: <20251010120655.1046007-8-dev@lankhorst.se>
 <20251010120655.1046007-11-dev@lankhorst.se>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251010120655.1046007-11-dev@lankhorst.se>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0452.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7f::8) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SJ5PPF524F3F9FA:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a4c5de1-41ce-495c-ac36-08de07fc243b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TlFvejJwakdPdG15U3E3bjlnN29jRFBnandHdStsUng3Um5yUDV5WFFyWEFa?=
 =?utf-8?B?dWtNWU1ZVFBZbko3V014YkxFSDRNTU1MT2NvV1dIekl6bWI1cVRYN1R1VTVD?=
 =?utf-8?B?SXArTG1qb1ZzS0NySmZLUktjbm5BTDFjcW5RSVBsQjhkak9PMjRCcTZybk9S?=
 =?utf-8?B?SHpLS2J6akJaakpDV3NlRHZyZ3BtNFJ2Vmx1c2JOcnpMTkZXSS9RUExETXE2?=
 =?utf-8?B?ODB3UC80MnVRSUpiRXBBY2dvRFNTTjZJQmE1T0V6WW1NSXRMbkRQd25XcTVX?=
 =?utf-8?B?MHVWbUliZkZqcUhodjVib2lJMklrT3dCK0NMVHZaT3dtbkJiVlhzbWNxY0VY?=
 =?utf-8?B?RDZCZHhFaTFod2VPK1pLVWhCc1l3OFBlTlo1L2xBVTcxdkEvbEF1Tys3VWJ1?=
 =?utf-8?B?MTB6ZmE2aTBBSHVXRjk3ZjA5VGNLc2xySTZsWFFGTnRodndPWmxMR21tbWNz?=
 =?utf-8?B?ZjhJeG1RcDN0allKckpyTi9yU3NTZ2xVcjhYWjliRlFjRm1jZUIyTmZLWXhH?=
 =?utf-8?B?TkRFalN0d2ZZaGRqUURRdkNDSmNrdkoyaXdNNHJtcithYlFUUkRLa2puY3h4?=
 =?utf-8?B?dDRVNWpvZnZGVW9SZ1JnMmZMUTdVOWVaQms4THR5RUU3eDFrRTdqMjg4Nzdx?=
 =?utf-8?B?bHVWMW4yQkI3bTk2UXg3SWs1N0lNMlVEUGpQOFNQZmdVN0tGLzRNSmlpajRm?=
 =?utf-8?B?aDBGUGVhNGpjNE8vbXhrb3NCY2M3ZnFxanlVSmI3ZEE2UXhBZkRIMGNxbTU0?=
 =?utf-8?B?UC9ULzFzYkJwQ0ErRlJQMTJzV2MydVk1SVRjTXBuRlJtd2hLV3p5UllBQ0ZM?=
 =?utf-8?B?bjBoSkROcHgxRXhpOFlkd2IzYnM2aW00MWFlRE5yRlNqMFdxbmIxczY0Yllk?=
 =?utf-8?B?bjlrUXNSeW92SlNoMmV3dmxkOVR1YVNFd3hhSVpFKzRXNWNtUzhuMms2N1lU?=
 =?utf-8?B?YzUrLyttWnRBVlFrNy9DODFlY291WFNGOTFiWkorNE8yS05wZENkdzB5NDY2?=
 =?utf-8?B?REpRR0dRaDRwZ2oxNUpBeG5ZYXV1TnVnaGlVZHJPTWRXWUtLWm1kSFQ1UlJB?=
 =?utf-8?B?MjNqVzB4OXZiOFBYNjNiTUJ3WXNSSHZwQmZHOXlIR0FYYkVhM1dhWVlGaGp0?=
 =?utf-8?B?QjFqRk8yZjAyb1ZKclpob3RlMWtYUUlORlNmTDMzUkpOMmJLYUtMWUtPMkMw?=
 =?utf-8?B?NEUxR3NieC9RZzVIVkRSMFdRZVhQUlJhQWVZQkRmMitURzNxRVZ4bnhNMzFW?=
 =?utf-8?B?aGpUOHRDRGQyVHdzcGZ6b1BUYjh3cFlDK3l4K1RUeGRzRW5qWlhpVWtZN0JG?=
 =?utf-8?B?WFhDR012dFJIQzRPZXVnYWVpSE8zamhiUWJBRHNNZ0d4RjZQV01GZjU5NzJJ?=
 =?utf-8?B?a1YwZ1ZBbkUzUDB0OW00UTUrRWdRNS9pOFFFcTVxc25uZmlEQ2RZdnI3bmRX?=
 =?utf-8?B?czQ2dEpLVjhNRDh5WVROajFUMkk4S2YzVHVRbTFrc0RYeVZhVzlmWE4rU0hu?=
 =?utf-8?B?TjRnQy9hblJ1LzcrM0VQZFNVSnJsYzlpUk01N3NnajRhc2RRNjhOVk5VUGRH?=
 =?utf-8?B?Y1lGNS9vbjlaRHdMQTBzSFdxbEhaUmFFdUlIYlcvZXJxNUN0TUZTN2M1c3oy?=
 =?utf-8?B?Y1ZRbmd1LzFvenhWWHU2enpBYTRVSVlnZ2lhMjVTbU5wZVZoU2Q3bGxyRlFJ?=
 =?utf-8?B?UFZjZHg5bU96OWg2TzQxTkUrMHlWZDRNNWVHTjhUOWs5WlBXTWJOWVJMd1lk?=
 =?utf-8?B?Z3AwelZud0lzUENDdE5VYmd3TytkREpwUlBIeUczMU1oV29Ta2FPS2NXV0Vn?=
 =?utf-8?B?MlBQOXFXdGY5WTlaUmdPa1A1eHBPbGxaZ1lmcVNOSlNsZHpuMVVTRGZQbWtT?=
 =?utf-8?B?VkRqNTB4dHdpU1pPMW1YNXB2WnBiWTc4cllBeThpMUZMSGp5aVdhc1U1QW9p?=
 =?utf-8?Q?nTE/eO7cnFwVM2ZOBjcVsKSCSSOnYYg+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QnN6c3M5YUE2Zk1QYUhNWXlBSUZ1a3pTR2xzWXFmVFZnZTNKaVg4UWIvODJR?=
 =?utf-8?B?TXJrQWNaaUl1ZEFMRkV1T05ML1F3ajJUZ2wva2RHUlRuVC9YanBPMHkwVXpy?=
 =?utf-8?B?WkdXMnJSM29qOEhYaHhPWFo2R3J3NHhZSUlZOTR1REcvcDVBZGk0cGdqS3cw?=
 =?utf-8?B?MGNUcjlhRWQwUmI3WkswekJDeFRVOS9sY05lQWhlb2M2eGY2eVdscEppZEIy?=
 =?utf-8?B?bWVwUmFVRGtNN0VWeUgrY3Q5MXgzaDV4aXRKSkVYdmJ0WE9jbjVSV1BBZW5C?=
 =?utf-8?B?d3EwenQ0TzFqZzBSTVZtem9udUVFK3d3RDlFNW1HYy9rVEZRMC9RYlQ3Rm9I?=
 =?utf-8?B?NDNDSDFoWWQ5aWN0aStOQ2Fla0pTalpQWThzZ2NUd01JSDdoQ2kyaWlsMGo1?=
 =?utf-8?B?QTRXUHA3bEErNmg1eFJXUnlCRXFBTWREbDc5VDVxOXJFazhzaFpYUDZKWU1S?=
 =?utf-8?B?M3V4SXlYOUF4MUFveDFGTDR6bnZTNGg3TklPUjhUM2NOeUN4KzhsTm9TVHBV?=
 =?utf-8?B?K2FIY1VyU3B5RTJKUkJvYlVTSkhwS0tPS0ppVFVuM25XblpTYmt3Z3hPamNt?=
 =?utf-8?B?UHU5M2Zqa0RnVkNNYnRySmQ5RTJZa0ZZZmNaODdqSUI3S1k0RzZGeVhyc0Yx?=
 =?utf-8?B?Rm50YUJrclgxSmJvRm5wRWRDQklXZk91bkVMSVp6NzhWZ3J6MWQrQ29ra3JJ?=
 =?utf-8?B?Ky9VTWR5MXlTeWlOMDYrMDdITTM3MjYyTGt2WERLWGxXc2svSk5maXNrWVY5?=
 =?utf-8?B?SUNqUm96cW91YnFqRmtsSjRQSklrTnJ6WXlPMUJUbWtFTkFLSHIrZWNRZGIy?=
 =?utf-8?B?ZU9RQ3dia05WM3A5ZGYyOER5Q0Y2ak5FbnlpdGtNVEVxUE1SQXlqRW10c3dr?=
 =?utf-8?B?TU9ucDQwdkQ2Z01DMW5jVVJIUFNLbk9GNVlOcjNEdkN2L2c0TEtMMXBlL2pq?=
 =?utf-8?B?Y252RGxuOG0rcmU5bmF6R29CV05XbTJCWFBvVjhCZXBybHFCL201VkdLNVR3?=
 =?utf-8?B?N1dsK2w2K1pLNkp4SUxOdGN2ZVBUMlZKU2ZLeWxNK1F3ZW5URjlNVWwzNi9G?=
 =?utf-8?B?L2FuL2gxVTFhdGtyVG5peVZMa1FuSDNYQVpxR1hZN3VFeXpRRmtaaU9ndWk2?=
 =?utf-8?B?aTJ2UDAvVkEwQnhDdkdaSVFyb3lWM3JsclVjWFZIbUdUR0FPRi9XMHprUmpu?=
 =?utf-8?B?ZnRONU9mY1krdnF2TitLbVhpRXFwdWtOWmhYRUtFTTlZMUczMklNNXNISjZ3?=
 =?utf-8?B?RCsxVDJENW5GN1liZkJZSzZtVklCWEVMTEovTG0zdEJXM2V4N014ZUlsU1hW?=
 =?utf-8?B?L2F2YzFqR3A3ZlNSMDBVcXU1SWE3dTRZcTIwRUhvWHdEVytzMDZQNnptUWU0?=
 =?utf-8?B?T1laRW53LzZpeFM5UTl4Q0RWZXkwSWVlamdFajRuUlBxVVlRT2xTNGNxQXJ1?=
 =?utf-8?B?YzE2aXp2eTlsbkwzWWVPcWg5K2JtWnZ1eVYzUUhLYVplVlRsMVZUS2NZNmVn?=
 =?utf-8?B?b1YwTDBRMys3LzFOM2VKV3lBa3NucmVNYktVSFp2dG1PNXRSRldURUdIYUlJ?=
 =?utf-8?B?SkRKd3VuTUlzdHBEV3JMMjk1UUt4YysxK2Jnb1dScEdVL2RlZEZqZ3NJQWc3?=
 =?utf-8?B?amRjbHVpQnlkK2VSRHlLK01Gb2lycWtaaEtBMTdZSERrZFRNNXBuQXNOTDEv?=
 =?utf-8?B?aTc2Znd3MFBmbng0M1RNUDlzcWtTdkRTRlRBNU5Vcm1PcDNzdUY5Q0VMM29o?=
 =?utf-8?B?WDBNU2JDTGRIRWFIWE55djduTmw2ZkFaUW15bGpaSmgyN0tEME51MFpFZWV4?=
 =?utf-8?B?cmNvendZMlpqUVA3WUpSb0F5bHlabTlFT3htWlRxSFpuRHczN3JUOGI4ZVMw?=
 =?utf-8?B?R0QwY1d3a1hZUlBiM25pRW5KdzlneVF5NkZiZTdZdnJMVWF5R2RKaWpvWVlh?=
 =?utf-8?B?czdFVmI5VnVXUE9sRnRGRjlydmJaZEhPVk5DaTZxRVJDak05SHJPWXJGOVZ0?=
 =?utf-8?B?aTZrenNOMWdkOWlDRlo0RHhxM1VTZlFmdEtxdlFyc3hHS1pyTEhYSDZ2bzVs?=
 =?utf-8?B?RlZTMmdtaEhHSnpnSFMwczFxOEdpdjYxZjN6Ym1GcWwrUktML3JMZk1xQWhH?=
 =?utf-8?B?ZkhLbUdQV1N1UTFqcE9IWDc1dytJRTRSaFE1bVJLK2RsNXE3bWNSZnQ2NzZq?=
 =?utf-8?B?enc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a4c5de1-41ce-495c-ac36-08de07fc243b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 12:54:25.6192 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s7omdiEQL6zuw3pUAFQri54mwFqnNuC6iXz8qKgBBDbTjj95DH01n3vx2nPR/bTDeEqHYTzKXnzBn2vl1uB3MrxXBusZCG6Pmy1jWTejfOM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF524F3F9FA
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



On 10/10/2025 2:06 PM, Maarten Lankhorst wrote:
> Instead of having ggtt->size point to the end of ggtt, have ggtt->size
> be the actual size of the GGTT, and introduce ggtt->start to point to
> the beginning of GGTT.
> 
> This will allow a massive cleanup of GGTT in case of SRIOV-VF.
> 
> Reviewed-by: Stuart Summers <stuart.summers@intel.com>
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> ---
>  drivers/gpu/drm/xe/xe_ggtt.c               | 70 ++++++++++++----------
>  drivers/gpu/drm/xe/xe_ggtt.h               |  2 +
>  drivers/gpu/drm/xe/xe_ggtt_types.h         |  4 +-
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c |  4 +-
>  4 files changed, 47 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 33b09737ccba8..1fcb128e661b6 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -124,10 +124,20 @@ static void ggtt_update_access_counter(struct xe_ggtt *ggtt)
>  	}
>  }
>  

don't forget to add kernel-doc for all new public functions

> +u64 xe_ggtt_start(struct xe_ggtt *ggtt)
> +{
> +	return ggtt->start;
> +}
> +
> +u64 xe_ggtt_size(struct xe_ggtt *ggtt)
> +{
> +	return ggtt->size;
> +}
> +
>  static void xe_ggtt_set_pte(struct xe_ggtt *ggtt, u64 addr, u64 pte)
>  {
>  	xe_tile_assert(ggtt->tile, !(addr & XE_PTE_MASK));
> -	xe_tile_assert(ggtt->tile, addr < ggtt->size);
> +	xe_tile_assert(ggtt->tile, addr < ggtt->start + ggtt->size);

shouldn't we also check for

	xe_tile_assert(ggtt->tile, addr >= ggtt->start);

>  
>  	writeq(pte, &ggtt->gsm[addr >> XE_PTE_SHIFT]);
>  }
> @@ -233,16 +243,16 @@ static const struct xe_ggtt_pt_ops xelpg_pt_wa_ops = {
>  	.ggtt_set_pte = xe_ggtt_set_pte_and_flush,
>  };
>  
> -static void __xe_ggtt_init_early(struct xe_ggtt *ggtt, u32 reserved)
> +static void __xe_ggtt_init_early(struct xe_ggtt *ggtt, u64 start, u64 size)
>  {
> -	drm_mm_init(&ggtt->mm, reserved,
> -		    ggtt->size - reserved);
> +	ggtt->start = start;
> +	ggtt->size = size;
> +	drm_mm_init(&ggtt->mm, start, size);

since drm_mm is internal detail of the ggtt then maybe we should aim to just make this as:

	drm_mm_init(&ggtt->mm, 0, size);

and add "start" only in relevant ggtt_node functions (as ggtt_node is/will be also private) 

then we even will not require patch 2/6 since this "start" will be fully own by our ggtt

>  }
>  
> -int xe_ggtt_init_kunit(struct xe_ggtt *ggtt, u32 reserved, u32 size)
> +int xe_ggtt_init_kunit(struct xe_ggtt *ggtt, u32 start, u32 size)
>  {
> -	ggtt->size = size;
> -	__xe_ggtt_init_early(ggtt, reserved);
> +	__xe_ggtt_init_early(ggtt, start, size);
>  	return 0;
>  }
>  EXPORT_SYMBOL_IF_KUNIT(xe_ggtt_init_kunit);
> @@ -263,26 +273,32 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
>  	struct xe_device *xe = tile_to_xe(ggtt->tile);
>  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>  	unsigned int gsm_size;
> +	u64 ggtt_start, wopcm = xe_wopcm_size(xe), ggtt_size;

maybe it's just me, but mixing plain var declarations with some assignments is not making the code any easier
what about:

	u64 wopcm = xe_wopcm_size(xe);
	u64 ggtt_start, ggtt_size;	

>  	int err;
>  
> -	if (IS_SRIOV_VF(xe) || GRAPHICS_VERx100(xe) >= 1250)
> -		gsm_size = SZ_8M; /* GGTT is expected to be 4GiB */
> -	else
> -		gsm_size = probe_gsm_size(pdev);
> -
> -	if (gsm_size == 0) {
> -		xe_tile_err(ggtt->tile, "Hardware reported no preallocated GSM\n");
> -		return -ENOMEM;
> +	if (!IS_SRIOV_VF(xe)) {
> +		if (GRAPHICS_VERx100(xe) >= 1250)
> +			gsm_size = SZ_8M; /* GGTT is expected to be 4GiB */
> +		else
> +			gsm_size = probe_gsm_size(pdev);
> +		if (gsm_size == 0) {
> +			xe_tile_err(ggtt->tile, "Hardware reported no preallocated GSM\n");
> +			return -ENOMEM;
> +		}
> +		ggtt_start = wopcm;
> +		ggtt_size = (gsm_size / 8) * (u64) XE_PAGE_SIZE - ggtt_start;
> +	} else {
> +		/* GGTT is expected to be 4GiB */
> +		ggtt_start = wopcm;
> +		ggtt_size = SZ_4G - ggtt_start;
>  	}
>  
>  	ggtt->gsm = ggtt->tile->mmio.regs + SZ_8M;
> -	ggtt->size = (gsm_size / 8) * (u64) XE_PAGE_SIZE;
> -
>  	if (IS_DGFX(xe) && xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K)
>  		ggtt->flags |= XE_GGTT_FLAGS_64K;
>  
> -	if (ggtt->size > GUC_GGTT_TOP)
> -		ggtt->size = GUC_GGTT_TOP;
> +	if (ggtt_size + ggtt_start > GUC_GGTT_TOP)
> +		ggtt_size = GUC_GGTT_TOP - ggtt_start;
>  
>  	if (GRAPHICS_VERx100(xe) >= 1270)
>  		ggtt->pt_ops = (ggtt->tile->media_gt &&
> @@ -293,7 +309,7 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
>  		ggtt->pt_ops = &xelp_pt_ops;
>  
>  	ggtt->wq = alloc_workqueue("xe-ggtt-wq", 0, WQ_MEM_RECLAIM);
> -	__xe_ggtt_init_early(ggtt, xe_wopcm_size(xe));
> +	__xe_ggtt_init_early(ggtt, ggtt_start, ggtt_size);
>  
>  	err = drmm_add_action_or_reset(&xe->drm, ggtt_fini_early, ggtt);
>  	if (err)
> @@ -527,11 +543,9 @@ void xe_ggtt_node_remove_balloon_locked(struct xe_ggtt_node *node)
>  static void xe_ggtt_assert_fit(struct xe_ggtt *ggtt, u64 start, u64 size)
>  {
>  	struct xe_tile *tile = ggtt->tile;
> -	struct xe_device *xe = tile_to_xe(tile);
> -	u64 __maybe_unused wopcm = xe_wopcm_size(xe);
>  
> -	xe_tile_assert(tile, start >= wopcm);
> -	xe_tile_assert(tile, start + size < ggtt->size - wopcm);
> +	xe_tile_assert(tile, start >= ggtt->start);
> +	xe_tile_assert(tile, start + size <= ggtt->start + ggtt->size);
>  }
>  
>  /**
> @@ -840,14 +854,12 @@ u64 xe_ggtt_largest_hole(struct xe_ggtt *ggtt, u64 alignment, u64 *spare)
>  {
>  	const struct drm_mm *mm = &ggtt->mm;
>  	const struct drm_mm_node *entry;
> -	u64 hole_min_start = xe_wopcm_size(tile_to_xe(ggtt->tile));
>  	u64 hole_start, hole_end, hole_size;
>  	u64 max_hole = 0;
>  
>  	mutex_lock(&ggtt->lock);
> -
>  	drm_mm_for_each_hole(entry, mm, hole_start, hole_end) {
> -		hole_start = max(hole_start, hole_min_start);
> +		hole_start = max(hole_start, ggtt->start);
>  		hole_start = ALIGN(hole_start, alignment);
>  		hole_end = ALIGN_DOWN(hole_end, alignment);
>  		if (hole_start >= hole_end)
> @@ -940,15 +952,13 @@ u64 xe_ggtt_print_holes(struct xe_ggtt *ggtt, u64 alignment, struct drm_printer
>  {
>  	const struct drm_mm *mm = &ggtt->mm;
>  	const struct drm_mm_node *entry;
> -	u64 hole_min_start = xe_wopcm_size(tile_to_xe(ggtt->tile));
>  	u64 hole_start, hole_end, hole_size;
>  	u64 total = 0;
>  	char buf[10];
>  
>  	mutex_lock(&ggtt->lock);
> -
>  	drm_mm_for_each_hole(entry, mm, hole_start, hole_end) {
> -		hole_start = max(hole_start, hole_min_start);
> +		hole_start = max(hole_start, ggtt->start);
>  		hole_start = ALIGN(hole_start, alignment);
>  		hole_end = ALIGN_DOWN(hole_end, alignment);
>  		if (hole_start >= hole_end)
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
> index 75fc7a1efea76..6482bddb2ef36 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.h
> +++ b/drivers/gpu/drm/xe/xe_ggtt.h
> @@ -23,6 +23,8 @@ int xe_ggtt_node_insert_balloon_locked(struct xe_ggtt_node *node,
>  				       u64 start, u64 size);
>  void xe_ggtt_node_remove_balloon_locked(struct xe_ggtt_node *node);
>  void xe_ggtt_shift_nodes_locked(struct xe_ggtt *ggtt, s64 shift);
> +u64 xe_ggtt_start(struct xe_ggtt *ggtt);
> +u64 xe_ggtt_size(struct xe_ggtt *ggtt);
>  
>  int xe_ggtt_node_insert(struct xe_ggtt_node *node, u32 size, u32 align);
>  int xe_ggtt_node_insert_locked(struct xe_ggtt_node *node,
> diff --git a/drivers/gpu/drm/xe/xe_ggtt_types.h b/drivers/gpu/drm/xe/xe_ggtt_types.h
> index c5e999d58ff2a..a27919302d6b2 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt_types.h
> +++ b/drivers/gpu/drm/xe/xe_ggtt_types.h
> @@ -22,7 +22,9 @@ struct xe_gt;
>  struct xe_ggtt {
>  	/** @tile: Back pointer to tile where this GGTT belongs */
>  	struct xe_tile *tile;
> -	/** @size: Total size of this GGTT */
> +	/** @start: Start offset of GGTT */
> +	u64 start;
> +	/** @size: Total usable size of this GGTT */
>  	u64 size;
>  
>  #define XE_GGTT_FLAGS_64K BIT(0)
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index b2e5c52978e6a..2289756761636 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -343,8 +343,8 @@ static int pf_push_full_vf_config(struct xe_gt *gt, unsigned int vfid)
>  	xe_gt_assert(gt, num_dwords <= max_cfg_dwords);
>  
>  	if (vfid == PFID) {
> -		u64 ggtt_start = xe_wopcm_size(gt_to_xe(gt));
> -		u64 ggtt_size = gt_to_tile(gt)->mem.ggtt->size - ggtt_start;
> +		u64 ggtt_start = xe_ggtt_start(gt_to_tile(gt)->mem.ggtt);
> +		u64 ggtt_size = xe_ggtt_size(gt_to_tile(gt)->mem.ggtt);
>  
>  		/* plain PF config data will never include a real GGTT region */
>  		xe_gt_assert(gt, !encode_config_ggtt(cfg + num_dwords, config, true));

