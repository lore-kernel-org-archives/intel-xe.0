Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 799D0C43458
	for <intel-xe@archiver.kernel.org>; Sun,  5 Jul 2026 08:04:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36EE310E15C;
	Sun,  5 Jul 2026 08:04:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VBFZO2jy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3B2310E15C
 for <intel-xe@lists.freedesktop.org>; Sun,  5 Jul 2026 08:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783238690; x=1814774690;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6wjFYh95qNNVlBcUln6pEwt4wAc5CA/lt1QbidmMZkQ=;
 b=VBFZO2jyE1Es5z3n4dulP5D9u+VqyHuwj0J7uoWMeSw9W7b0RAYbZjSY
 MAp3fSX1ci57CdP8yZ3E7t+vB/HKek9nSHnZlXEblEU+rQEaTIURPGdld
 0nD10F/QBMRw3xB0ge12j8GTPF2xqqJM1jQfCOa1nV4xrIKI10ZRkLruX
 M1F8hTjN3zmc81LpqN3xhyW9cFbxHfT0qR7QRhrMQ7as/EQszuyqAaDNt
 I0Z8VingEFKEZVOPJC4FPMI5DbCjA4Z0zNpaQzQg6mHY2sjRFrn0T0ISn
 78KW4+hWg/HYu2oILe+hc6vHOi2ZIbkaufgKt3skNxNmxh2337Pi9z/Bt Q==;
X-CSE-ConnectionGUID: ryqbfciLQOuJF6tov3rzpQ==
X-CSE-MsgGUID: 2s8a6y2xQxec2QcIqnsCZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11837"; a="101323369"
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; d="scan'208";a="101323369"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2026 01:04:50 -0700
X-CSE-ConnectionGUID: jAshIQTqSf6Q0+/lVU6zpQ==
X-CSE-MsgGUID: Z0VkZMeLR+WOKMsGuKfP1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; d="scan'208";a="255365441"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2026 01:04:49 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Sun, 5 Jul 2026 01:04:48 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Sun, 5 Jul 2026 01:04:48 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.19) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Sun, 5 Jul 2026 01:04:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hzvMeJ8UObcnplPwARI5aDaGoVAsWcHCoeG1IWi6+KcrF+3az2MdiTfnZ6/+eyExjdfhBjx17+nWGeIpFyOjL9QFBsFCu/qKDPq2GHPZc82KmHzwN4tjD/ECJXjo3pBkiXCmIHna6edxNACrqKRIMi0hW2h8iqyRu5r0VkfJwr815g0xj8TsFU6YPz2H/4WxXXyHOXoe/q6PunNcdYkUFN4+p/lIcKYLQE8gL1F9zlsfgaaT0gKMGoH1DnGC01HumQgIGkWtfg8aoMaxb88xXpUMVubj7q4lKtS6r8XV92n3a8Zud0zMiAJOz8mZ6osQOWaVo+JLBQNvJ3zlb0eKNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qWO/PpcN7rOP0XUJwC7RQtnAHLPwKeMVOeCVSVLITsY=;
 b=OBLLkA38N6QAatJv9hwnQhSlX61pHNl44+67yNwbJOnPmgQ/4gZ6srhKa6bKSP5th3aNejzlGcqPY6a1OVL04X40IHq1ioSZFDueEGa0PU1nls82SrxedomnBDhvAoHLbWUf5y8I3VULL5OKdqnBz+zUaoDrOuOt/SgtwkIUokvJgQKnq2zma3776/72Pf1ngHiUyD9yxXSZRrygBg8b4JusCzl7OFHzThKTWVotWwibm6UD6EruyCvxr3Lg8ml2I9REySSVpelfVt5n50ZmikxKtVvtbynoGW4LfYmVHBkY2CmRUpSlBxk7S5um7iKyBsBt0J/Xue6QK+PoC1LX/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by IA3PR11MB9040.namprd11.prod.outlook.com (2603:10b6:208:576::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Sun, 5 Jul 2026
 08:04:46 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::f3ff:11d0:7a52:db0c]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::f3ff:11d0:7a52:db0c%4]) with mapi id 15.21.0181.008; Sun, 5 Jul 2026
 08:04:46 +0000
Message-ID: <ffbde075-78cf-4337-af89-e73f6b159802@intel.com>
Date: Sun, 5 Jul 2026 01:04:44 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] drm/xe: Add sysfs for GT/IA bias
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20260702005614.2621735-1-vinay.belgaumkar@intel.com>
 <20260702005614.2621735-3-vinay.belgaumkar@intel.com>
 <akgAD4rCNg1Ztdxb@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <akgAD4rCNg1Ztdxb@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P222CA0005.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::10) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|IA3PR11MB9040:EE_
X-MS-Office365-Filtering-Correlation-Id: fae4aaeb-f035-46c0-f123-08deda6c1427
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|6133799003|11063799006|4143699003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: wVvng1S0QEl9PzK835T2v6OKKmOI+y6tRgvWVet8DllruARwhOFZimwf95kzJo8ShsAN5C2wEQLXuin5K2A+CWEruDF4MP97lpFzJ1hE4Bs2PMJ407384R0rmJV6yE3kEz4TJoFH/rD0VW/v3HvzjjwzDs29m4POQnBXS5kT6xwLQXYeitbJlmOhEy+IffPsPHXVL8wCLX0Fu3O33eb+6nAmTt3NHYI5d7wtvW1nyUN3p71l/v4gJwxHomiMi6LUb14EEoWGcwqxqXq6alyhTsjyTZmAEAx3E9nNX60e4Jb1yoJg4kkSTJc0YyCWUysTesF9+dcT92CmhVZ8Pvwra89ZMzMtx4jYJCcQlEY/av7/0tQeEKpy7k7UtrO5sGmUrkNxT7TYDWXznGT20twOVQsb2KM7CtILVuurCtYKee4Qjzy6Ic2plLf4EzLa+O5ZoF0MXPFztgredKLfrGgybPZydccr4fv+1/gWwOa9QqGjHh1f7uoCeNSFU+KjnaMdouOAaMlRBKgTxEf2n7lG9o3HJbxXvG2oxL75v9EFv7zHYlekP1TJ5UfoU6QNzdRO5Ys8V+UFoxgxKYI3UdL6RIk4A3WyAux06KXKGnc8mHlIyEJmMDJ2zZ7HR/I1u+c4LlbLpBWPe1gEl8py/gq62wucwW2kH3ziN0kYDp00omA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(6133799003)(11063799006)(4143699003)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UzJ6TlJOYjFuSERtYkMxYlVQMWJEUkFyZEZrMW42UjVnU0c4V24vU1U4R3BS?=
 =?utf-8?B?T3ZpUHhVbWRHUmp6L2FUNk9BcVluVlNDVFYyTnp5WGdLWWZVYXpwdnY5V291?=
 =?utf-8?B?bXVraktaaS8xS1FKOE1jYjNFTmdDRlFVOWJJeUNyR3dVUVBPa1NJa3lIU2Rs?=
 =?utf-8?B?VnorQjBudUd1Ukg0RFlrZjllNm9jem9LUHU5ZzBnbHZXWjFKWkVvRnZGQUpG?=
 =?utf-8?B?UEdDK0NyWFB4M0FLNTljUlBoamczQlBidTdMbFI0MDgzMXpKd04wYWRNa2pp?=
 =?utf-8?B?WG1iY1FLTEpSL3k1V0ZzeWhsZUVodDJWYW1WUytWM0tTNmxENEZ1VkVaL3NT?=
 =?utf-8?B?YnQ4MURneVBrSHNoUlNKMUpmbkxaY3lKM1lXLzBZZzJLSkp0WjU4SzRQdTZV?=
 =?utf-8?B?WTJrWnB2SjE2eG1UZ2tIS2ROY3h4c1FzdGF6cGNwNE5yNEZTSUFIMnVyMHg0?=
 =?utf-8?B?d3krUU51OWtLeFY2TE5hSTlEY3VnVUoxYzZiUFJzTUw3bjVoNHpiYUl4Nklx?=
 =?utf-8?B?Z0c1Q2QxWEtpYTlLTzBiRjZaVng0T2tYcmxDMG1TR3I2T0ptckxrY2NiWFNB?=
 =?utf-8?B?a2pwREg2Z1h5dDdTZnpnN0V3SXJyUXFZTlpoN2V5a25Ic2RhbVNqK2tldTdL?=
 =?utf-8?B?V004aVp1Zzd2anE1Z3poZzNSZXpoTVY4SUhSbDV0OEJMN0FYdjZpck8vQ1kv?=
 =?utf-8?B?K1I2SVVOVnF1bnNYZTAyVnJhcHRXczc5S0k5QTU3ekdMS1JZdmR3T3RxQjNU?=
 =?utf-8?B?d3RhMmQ5NXFNK3U5SHU4MDRzd3FvTUg2aXZDV3QvcGo5T2Vmam9CWmJIN2NR?=
 =?utf-8?B?dEJOdlUzWi9QWGN0bzl3VzQ2RUdBUGVzcWJoSVFudnJnQ0xFVzdTZmtDcXBS?=
 =?utf-8?B?OHhvamFkWjZDY2c4Y25nTzUzeTgwZncrTU5vWEtyUVNobU40RFh5OHVseTBi?=
 =?utf-8?B?VTdjbXFvYXZPUVN5ai9adkdlNVB3bFhaUFYwSyt5RUt2Uk1MTExSa1dQbW1S?=
 =?utf-8?B?L1BPUjRSMVc5TjJkRndZNnlra3A0czlqdHp1YVhmR0pFZU04S3QxdTJ3ajhR?=
 =?utf-8?B?VURWUGJPUi9WMjkyYW9GZmpLM3BadXJ3RUUzVWZQN2tlS3ZJSUU2V2RFT1ln?=
 =?utf-8?B?bklZWlBjdllzaTdOcUZkZmNDa0pCOE5ma2tiQjBva2Jqd1dwbVNqOEpXZFVx?=
 =?utf-8?B?NHVNblZmRDREZ2lxblNJdUk0YWx2S2hVREhwTFkzMktwYmJFKy9YaURPcytK?=
 =?utf-8?B?T0hXQlZYcTRzT0RIZDE4M0h6UDZVNG5jUnBaZzNvZ0M2RG1COTQ3ZkhLR3lw?=
 =?utf-8?B?Y1gwOWZvRUtNMnZQelRsMUxlOElYWkRDZ1BkWE9yMmtuRmJlbHpxdTQrTkwr?=
 =?utf-8?B?dE5sNzBORU1Fb1VNbnlPa1FVbWZwdnpvVEVjb21md0FpZWZ4a3VMdkZvZGZN?=
 =?utf-8?B?SGY2TkMrU2tpYjFqTC9XRTNCL1FraVFjUFIxajBrNzdFZEZZSEl6V2g2TERO?=
 =?utf-8?B?cnJYM251RVRTelVvRW9iR3RXZ2RSd1h4bXZHNnNLZk5uZWNaZ2lVNWllK01y?=
 =?utf-8?B?UkhscDc2SEFTWm0zN2M0RFRJSHF2eXZHZWgwdXZhT3Z6ZURjeElJSEhFMzZF?=
 =?utf-8?B?ZitjdURoY0NFTm9FdDJUU1h5RkR1eXFUNlFUMzZJN29xR0h5QnFiYk5hKzA4?=
 =?utf-8?B?TjM1eC8vYmxPREM3RzFmVW9ZaEI5Y3VPeHg0TnZXUW91L2JlSXZxUHgwcVNa?=
 =?utf-8?B?TWppdk8yYTZvaDFZdjBPVm1ndzRPcHgzUFg2anJuOG5kdVA4SDZwRVlaSkFw?=
 =?utf-8?B?VzRvRm1Ma3Z0M1VqZXBTd1hsK1k5eFpWMU0yczkvWXYwMCtweUM0bUl1Z0h5?=
 =?utf-8?B?RnFoOXBCY3Vyak5zYU1oRWRrQzFnMkY0c3VyY0FPcXpyV09ZMVp3aG5VQ2Nv?=
 =?utf-8?B?TnRWY1dRNTRnZGVFVDZuVDlMSFhheERpNDQ1M2wrS2pEUGdFMkE5K1AwL1Az?=
 =?utf-8?B?MzFnVWxzSi9KNEt1dlJpbk50b2FKZ1p1NHZwdUVLMFpwb2J2ZThlSFkvVUxD?=
 =?utf-8?B?d2JOTjJqUTErV0R0RVcyNjNSMmxNSlY0ME1FNlFJQUQ0OTA2MkliV3JTWU1v?=
 =?utf-8?B?UWlQeURXdXdYR08rOFM4cm54Sm1ob2N3ZjZabkxLOC92S0ZVVnQxSUVVTys0?=
 =?utf-8?B?MStlcnpEdXN5bkZQVEtaRVJ1Rk5wZ2tRdFl0eitsK2JPTkRCZGMvU3luYzE0?=
 =?utf-8?B?dHZzaFlpbHFKZVhUeWhzZFc0S045bm5wZzU1S25vK3Z0TmNTN1NkcEt0M2xw?=
 =?utf-8?B?VUpPZ2Vpd3R1OVFRN0Q3V0dYVWp5VDNPb3pKRlpsSkIrYWh6Mnc2ZEpQRlZH?=
 =?utf-8?Q?/RxkoG1DFNAWy3wY=3D?=
X-Exchange-RoutingPolicyChecked: pb7rwrwz1NKTD9+Ryzo6kC1vEXG/oU7JfPOQzHaRqnWIAHhrAqFSg6Ql2rMuUc5DUO4zvF1FoAOkd0R3DJe9mrrqpO77+FcFu04EkR0DsxOx9cptTV1y4Q7iloY2wnJC0b9GQfchfClxxauQUftbATmQRdmCBHXXsgQmiIcQ4p94M/KAgy/TIqbp0wpp/CCtMTJWFZEfmb+EYK33E0ErrLzQkWH4svW7c0GKeY2mbcM+WokrF7aVhXqrnS9RNzMD9dF91kl1jREdBTMY/Y8Cf4z9bUiyysCvHc6U1gYPZVh16pwc1Kg786rZuNkUpH871CwP3ZlOMasMmQCRmbO0Ng==
X-MS-Exchange-CrossTenant-Network-Message-Id: fae4aaeb-f035-46c0-f123-08deda6c1427
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2026 08:04:46.5562 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ju/FQOXRAvFP+VnalsQ5bpZIccBhTC99ICEdZUbAeqXqSiV4IPtJe+MABwFCVyBtrY46HEIm6jhmDq7NVJX7062Hbk2bj1YlIFtouTSaHM0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9040
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


On 7/3/2026 11:31 AM, Rodrigo Vivi wrote:
> On Wed, Jul 01, 2026 at 05:56:14PM -0700, Vinay Belgaumkar wrote:
>> GT_IA_PERF_BIAS_REG indicates power budget between IA and GT.
>> Lower 16 bits correspond to IA and upper to GT. Higher value
>> indicates more bias towards that plane. The values are in U1.15
>> format.
>>
>> $ cat /sys/class/drm/card1/device/tile0/gt0/freq0/gt_ia_bias
>> 0x80002666
> What about decoding this?

With the standard U1.15 format, this represents fractions with max value 
of 1. So, 0x8000 is decoded as 0x8000/2^15, which is 1. Every other 
number will be less than 1. I could add the decoding if that adds value.

Thanks,

Vinay.

>
>> This interface will allow us to observe power budget changes while
>> running workloads and also, if needed, tune it.
>>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> ---
>>   drivers/gpu/drm/xe/regs/xe_gt_regs.h |  2 ++
>>   drivers/gpu/drm/xe/xe_gt_freq.c      | 51 ++++++++++++++++++++++++++++
>>   2 files changed, 53 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> index 08251c7a1a4b..41c5c5f20964 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> @@ -634,6 +634,8 @@
>>   #define GT_GFX_RC6_LOCKED			XE_REG(0x138104)
>>   #define GT_GFX_RC6				XE_REG(0x138108)
>>   
>> +#define GT_IA_PERF_BIAS_REG			XE_REG(0x138158)
>> +
>>   #define GT0_PERF_LIMIT_REASONS			XE_REG(0x1381a8)
>>   /* Common performance limit reason bits - available on all platforms */
>>   #define   GT0_PERF_LIMIT_REASONS_MASK		0xde3
>> diff --git a/drivers/gpu/drm/xe/xe_gt_freq.c b/drivers/gpu/drm/xe/xe_gt_freq.c
>> index a40dd074106f..0847832151f9 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_freq.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_freq.c
>> @@ -11,10 +11,13 @@
>>   #include <drm/drm_managed.h>
>>   #include <drm/drm_print.h>
>>   
>> +#include <regs/xe_gt_regs.h>
>> +#include "xe_gt.h"
>>   #include "xe_gt_sysfs.h"
>>   #include "xe_gt_throttle.h"
>>   #include "xe_gt_types.h"
>>   #include "xe_guc_pc.h"
>> +#include "xe_mmio.h"
>>   #include "xe_pm.h"
>>   
>>   /**
>> @@ -242,6 +245,41 @@ static ssize_t power_profile_store(struct kobject *kobj,
>>   }
>>   static struct kobj_attribute attr_power_profile = __ATTR_RW(power_profile);
>>   
>> +static ssize_t gt_ia_bias_show(struct kobject *kobj,
>> +			       struct kobj_attribute *attr,
>> +			       char *buf)
>> +{
>> +	struct device *dev = kobj_to_dev(kobj);
>> +	struct xe_gt *gt = kobj_to_gt(kobj->parent);
>> +	u32 val;
>> +
>> +	guard(xe_pm_runtime)(dev_to_xe(dev));
>> +	val = xe_mmio_read32(&gt->mmio, GT_IA_PERF_BIAS_REG);
>> +
>> +	return sysfs_emit(buf, "0x%x\n", val);
>> +}
>> +
>> +static ssize_t gt_ia_bias_store(struct kobject *kobj,
>> +				struct kobj_attribute *attr,
>> +				const char *buff, size_t count)
>> +{
>> +	struct device *dev = kobj_to_dev(kobj);
>> +	struct xe_gt *gt = kobj_to_gt(kobj->parent);
>> +	u32 val;
>> +	int ret;
>> +
>> +	ret = kstrtou32(buff, 0, &val);
>> +	if (ret)
>> +		return ret;
>> +
>> +	guard(xe_pm_runtime)(dev_to_xe(dev));
>> +	xe_mmio_write32(&gt->mmio, GT_IA_PERF_BIAS_REG, val);
>> +
>> +	return count;
>> +}
>> +
>> +static struct kobj_attribute attr_gt_ia_bias = __ATTR_RW(gt_ia_bias);
>> +
>>   static const struct attribute *freq_attrs[] = {
>>   	&attr_act_freq.attr,
>>   	&attr_cur_freq.attr,
>> @@ -258,8 +296,13 @@ static const struct attribute *freq_attrs[] = {
>>   static void freq_fini(void *arg)
>>   {
>>   	struct kobject *kobj = arg;
>> +	struct device *dev = kobj_to_dev(kobj);
>> +	struct xe_gt *gt = kobj_to_gt(kobj->parent);
>>   
>>   	sysfs_remove_files(kobj, freq_attrs);
>> +
>> +	if (xe_gt_is_main_type(gt) && !IS_DGFX(dev_to_xe(dev)))
>> +		sysfs_remove_file(kobj, &attr_gt_ia_bias.attr);
>>   	kobject_put(kobj);
>>   }
>>   
>> @@ -289,6 +332,14 @@ int xe_gt_freq_init(struct xe_gt *gt)
>>   		return err;
>>   	}
>>   
>> +	if (xe_gt_is_main_type(gt) && !IS_DGFX(xe)) {
>> +		err = sysfs_create_file(gt->freq, &attr_gt_ia_bias.attr);
>> +		if (err) {
>> +			kobject_put(gt->freq);
>> +			return err;
>> +		}
>> +	}
>> +
>>   	err = devm_add_action_or_reset(xe->drm.dev, freq_fini, gt->freq);
>>   	if (err)
>>   		return err;
>> -- 
>> 2.38.1
>>
