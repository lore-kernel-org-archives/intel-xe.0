Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49895C5AC67
	for <intel-xe@archiver.kernel.org>; Thu, 13 Aug 2026 04:39:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E665910E4A0;
	Thu, 13 Aug 2026 04:39:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OXcBhRUm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35DA110E4A0
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Aug 2026 04:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786595958; x=1818131958;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=P83suVZmsl2Cd8LZBODF3SY7kVwNky4BpfKdlqHLO+g=;
 b=OXcBhRUmW/PT10Kvd9/tt5bTxMQ1wITiVJCDCx7JZGEzp0ihtzyckk1v
 LjlfPSwM/4P8lksgpVKDbPSiGn49pWxdJbgmLfLsyPUz4tkcuDQsWiKs/
 OU3giXXVq5GcRtebWajrWQG6WP9RhpNpOewuffCZau9oiz40s3ZEO/Nxu
 gXaBcbHRwpGiEjVNe4eUf/4I/SQXeiNbJVn7PBzX3UQb6euOMbpFaRv2M
 n10M7eDxsJ+CN1tTzyqeLdKI2URSZ7DeflLPIOcv+3mfuACSWibuePDYR
 BX0n8Ue4WrqbD/GVzUoK76XE8HqkVCzJpUPTRn+IVWpRLgsBNQYIf6U6y g==;
X-CSE-ConnectionGUID: QGr2dxDvSz+fG7J97g3D3A==
X-CSE-MsgGUID: GOYS2HZaQGm5oonFw4dmOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="87023700"
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; d="scan'208";a="87023700"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 21:39:16 -0700
X-CSE-ConnectionGUID: 5vynGDcMT16amJVhgb3e6Q==
X-CSE-MsgGUID: MflSELP9TAGJhlFVHgkOQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; d="scan'208";a="267681420"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 21:39:16 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 21:39:15 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 12 Aug 2026 21:39:15 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.40) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 21:39:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P2RIMu3mOL4mjrSi8FSqhQAdOEgmt00sVGZDC4STx/01lewozXcKmqSRSlC455+6R1SJQ+Ag/d95kaQY5FaE7xeskNj4Zch/xfm4DBsjLNq3QN7BkJBTyvkw+Hcbj6cJCz9BZvPaPByYDppcEnev33QVUlenU0Ut2NXzQnV2yqpO/z+HCFwrFQuJ9jSh2Juaq6RMO3VQf/FZql6YIiWa8NnSmneIlw3ruPjzmp0CgwTjUrHbg0O3KBR7yPuO68vFLaiKy6A2RkeEfQc0L+8FuAx1nAIOOMrKpjD3wBkGH5Qnsf/0G8H3Igec8U7alr2ROT2o3EgOI9NdabiJjlcqHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vr7zw7ljsbpCcCMwP6L+NuyEKMmMZJv28Lis/kfS29U=;
 b=A7Ny5DRSKvWluLdHQ7sCyXvgF+nqoWWNYrB64XhPWkIyN7nV2GyZUcMZ4fAOpzpuDAwxFJC1aQzyCXKkmp7LpFuIzj9XGCjc/YMnaSC6SFrr4ENJ8yS2/0aXNGNWI1zOMWDTDsAd6pzHyyAjwHRdRia4Q+atZXWwKtV1eE7JneP8ClFhMMmvF/gJn8PcM/VwKixg5+jl8qXPvvjNgI9hEkXsuFAVPUdWB8ycWV6IvUiDEpf7bM3SVK/pZu2A+Y64AQ1pfJCe/WfbamyueEa2+Z3dnowGEprxvXfujb04HQAhwyQ8FkNR2++y9/6vDNnp6hnL4NV38fUiTae+jXa+KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by IA0PR11MB7695.namprd11.prod.outlook.com (2603:10b6:208:400::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.14; Thu, 13 Aug
 2026 04:39:07 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.21.0292.024; Thu, 13 Aug 2026
 04:39:07 +0000
Message-ID: <280c4c3a-4acc-482a-89b2-c77dd7130017@intel.com>
Date: Thu, 13 Aug 2026 10:08:59 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/32] drm/xe/log: Add SIGID log helpers for component
 & severity
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20260812191450.11690-1-michal.wajdeczko@intel.com>
 <20260812191450.11690-10-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20260812191450.11690-10-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0127.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d0::12) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|IA0PR11MB7695:EE_
X-MS-Office365-Filtering-Correlation-Id: 37efc102-cd65-4e41-7bc1-08def8f4cfac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|11063799006|4143699003|56012099006|10067099003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: i2kHMaq/mw+wvKAgMqZsy1FqkZsGom11PbOLDYMjmMYY7CHkB2GjhJnhE2p+Uwz2tHQK7y1tyZg0PjVdydM1BgYIgCHomQdi54JY2zBHn0UpltO7hoafYht81Bj31CRCd9RXt5e+i+7LIz8zMlcc1UgRJL8mzl6rZJwVzEN4wjIG4p9L7dj5IQC8EuF4xkMi7WvPjpqQOuryQf3SS4Wxw7y8otsyJPal122jYzdRZyLX/XtzT67G0iY25f9/Ua4Y1ifE+6+drtTWa/x61zTrCdY7QVS1Np0nBPFm4AaA/0JCcLI1ryY4UUCls1H3lp0VlpmBtNWu8zvYt5/OB3KZQL9iY6f0u5UBlTM4aTXxFORMICrDoNXI8rGcoUs2Y5Xz/DlvNBktWwAbzO5wF1B5XIR4oiG2smPGl+vlcktxMMxrxmu+Pzu4htuY6L+SZYI5xn1oGIQwtDnV65HULotKtvg6KuQoQUv09irnkg+acBYakgnH9ng+5sf8AD5BV0D0TS7NDF3qnWZz0+hnirWVUT330ak3dOcmZcPdYmPOs/gVnZkIk9atQrYW9ZPivdKLhmmr4OMnqdcE+lItTr88BP+QeaySYW3g5F6W6ccwXUlE34O2rHWQDtCmLSQvFwV+ED3I38k6TbmSphF16DbAyQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(11063799006)(4143699003)(56012099006)(10067099003)(6133799003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T054dTIvdExqSXR2eFpjSW1SN1hmbzVNVWc4a3Q1bURGdTBhSi95UDh6bCtt?=
 =?utf-8?B?YVNlakxJcEcyazZUK1lXcUlVV0YydTRTaDJnMUlxNVpudC9mVXkrTXB1eUxx?=
 =?utf-8?B?WXpQOEhFckZWNHdxcE14V1hEWVJ6aEVBcW9BNDd5V3YzbXhvUmlpZFhmZTVM?=
 =?utf-8?B?d213ZTFEY1g3Q1VFeERFQi9xWDhMeFZFemJoTFpRdlg5MkpsQ1hqQ0xxSkJr?=
 =?utf-8?B?cFp2NnhFY3piVW03am9rWXFvbW5rb3psQWdHR3lSaHhvWitVYzJWMVo4RmNp?=
 =?utf-8?B?ek5IRWNCR0FDZG5VWURFVkw2MXI0Mkd0NDk2dThzSXpyUENQcExQYmptRkEv?=
 =?utf-8?B?UmVyOWJVM3QxdURaUHF2bHhsUWdYcnd1Q2pVUEVYb25WSXN5TjJQbEdFWjE1?=
 =?utf-8?B?Sy9hRkQ2WGxFeHE3WStNRFlST1YyUVBzVG8rcHFIVG5pRFdqTS8wRFAvVWxP?=
 =?utf-8?B?Rmp0aTZkM1VvWFFZS0RQQUQxL2FQakdvTU1LTDk3K2VCY3dGdjFxZnRpQWls?=
 =?utf-8?B?Z3FvWWljMFFjTzFPQU12TUppalBuaTdkUkZza2h2RUhRU1NrTitxcWdJd2tK?=
 =?utf-8?B?MDdxNUdjU3hFb3FSR1dRYXhNYWNWQUJHY0R0ejdoT0xJZTZSQ1ZKcDFaRTNS?=
 =?utf-8?B?M1pjTEhDblY2dlQ2Y0hxczFLK1daTjFYNmpmbDN1OVF5MGR3MlJmbXM5RTBq?=
 =?utf-8?B?RnVwejBNVXFNbDJrTFBiUmI5cGswKzhoWTFPYXR2WVlyalJxTTlzaTBRQXVo?=
 =?utf-8?B?RkdWaFZSbWlibFp0bmF6NSttN2w1ZE1aSGptOTgzTHE5ODlUeXQwNGw0bC9y?=
 =?utf-8?B?cXBVQmhDcEEydjl6ZmxuQXpUSVM0aVlnd3JEbGRhZk5ZQzlqVmZKTkxQODlW?=
 =?utf-8?B?K2VFYmV2bTNRNHBUN3lCL2hxaFlUVWFzZjBWZVE1OStmV2RidUttRGpaTFlo?=
 =?utf-8?B?cHZ2MjF4NlhnNVdvOER4L0I5TCt2V1kxUVlXOVdJQ1NSV1NJMkI3R2FkdVkr?=
 =?utf-8?B?aFZJNncrUHZsY2c4MVlBR3ovbzNpaGcvbVpZa3BIcHlCZmFNN2VEejllZnJX?=
 =?utf-8?B?M0p2VkVKWHZMT1BuZDdRYWVUSXpjZEt2Vm9XL1cya0ROSnlvM2l3V3MwYWU4?=
 =?utf-8?B?eDRLNjFHYTlDTzlIanV4cTlCc01pNG1TaS93YmxnaUo5YmJkNGhCSE40STUy?=
 =?utf-8?B?ekg2ejBsZGxrOXQ0SldtQWp6ZVQ5endtb2x6RVpUSm1FdERaWndXWHFnZ05u?=
 =?utf-8?B?RGVWamFwRVFsZDA2TkVFekwvc1FkZVB6REd1RmpBYXJmMmNNai9kQUFRRUhK?=
 =?utf-8?B?UHlNV0traGVacXRlV09PME9BSlYxTmdidm9oRlkwbTRjREVSSEFvTmEyTHp2?=
 =?utf-8?B?Ti9zdkU5WmJsM3liRGEyZWNEMEo0UE1xZzA2VHFERFN5ZmM0YzI3OVVIMWky?=
 =?utf-8?B?SnRqVDVmajQrZXpZUUgvZ0htVzVKVEdOTm9YRkMxV0RXMTB0TkhUbEN6dmcv?=
 =?utf-8?B?blJnMlMvYzljODNwUEl4ZmdMWDdGNkpUMUNlSmNXTXFBUFFQaEVKMGJMN2RI?=
 =?utf-8?B?eVZDdm42WFF0Q2U3OHpKL2FJWE5ZUHNyVVkvNW13S1FqYkFkWHRmRm85cjJZ?=
 =?utf-8?B?YU84TXplbysxN2RYQktWVW5ONEtNTWdOeVIrNEVDR3ZoR3k2WE1DQkNqN0Vj?=
 =?utf-8?B?ckhkNGVZK0xCRnU3SGJJTGhCNElXRVdHcFRTYTBKUkM2NnBtdUVYVnRvT2cy?=
 =?utf-8?B?ZENCOVl1enlXOEprblNVRnJGRUV1dnNVemVpTUcvbUFZVUsxVStwRUltQWNm?=
 =?utf-8?B?RHJDWnVob3FHbHA3UFJEOW9BWG1IOElUQmZaTVpnemZ2U0QxSTZIVUFJYUpn?=
 =?utf-8?B?RDgvYWluSnlaZkg3Tmg1KzVrM0tGZTJxa1d2VEhodzkrZlZrZFJkcEdKTHlK?=
 =?utf-8?B?aU4vNjFMa3hJbnFrNlRISVpmVUs0cERTanBZV29wcmNoSEdySHo0MmQ0Ym4x?=
 =?utf-8?B?S0c5WmFzSmZaWmhZMWxiRUYwMENEd2M5TVJTQzVrNk1PSVpsSUNybGhsVU5E?=
 =?utf-8?B?VjNTNkJJdE8rWU5uQ3NHRXR1TC9BMTVJdHpNei92RzM5b0Rycncya05BOVFZ?=
 =?utf-8?B?NkNjTGZnMGhUN0Q5Wk9qSXdFY0cyam9RL3VqaUJDbmVFVzlBMFdzQXJrU25l?=
 =?utf-8?B?S3hpRHlSdzdXaTJ5RWw0Yys3cmY4Z1FCa2diSEFrbmpSMmExUDdjenF4cE80?=
 =?utf-8?B?T1NmUHVrM3VaZFFKQU5Kc0xyVUI1Sld0ai9uV21NY1MxM3FUNldPU1Zhdk0x?=
 =?utf-8?B?ZThmM2k0U05jUDFmTERud1dDVkVPVFhhZW9XY3ZpV1FaZkVXazJTU2Z5R2hL?=
 =?utf-8?Q?q0imfimjoRR/AOWQ=3D?=
X-Exchange-RoutingPolicyChecked: e17BpTeGAjvqmv04zSVMhhNDy+YCHYzRsKLCglbVJ/+UjuD2YoYz/IMcUol54Bsy4lmpyXS/fHjkzRhDES858UWaE0SknyeumPEoCNNIZ6PPKyBGesdKmDIdpdU7BpRoaOs8GRONWTS0hzhGCeRKSYLv5rIvbnalmpSRL6gXY4oT8I+BqXgjopeN6+a17nws+lzBV9gYvzwFJMbJQKgrBUeB/aFH6QxF73qzCKkPwVcQtf2jJEYzXBG73azaU5xFrlyyiestdTOQug0tTwKoUFUJezEbAAAujvRS9jdiNgRWG7FkITOCGZiujBABgEsPQOkTttqFMd0wfiKTV+3E7Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 37efc102-cd65-4e41-7bc1-08def8f4cfac
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 04:39:07.5401 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 20+Y+wO9S1fjmVjY1i8idIcilY4W7CGRZuwwLY5OcBVcZ4y8/NOmSJtt4/96mqwhShh4krF27a5dRJQxTcVzvS7dXAEQUR8BCmUoo8aSbag=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7695
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


On 13-08-2026 12:44 am, Michal Wajdeczko wrote:
> There are only few CPER severity levels defined, add some helpers
> to avoid forcing developers to write full CPER severity enum name
> in every macro call.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
LGTM,
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_log.h | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_log.h b/drivers/gpu/drm/xe/xe_log.h
> index c30db02950b0..c56306a183e7 100644
> --- a/drivers/gpu/drm/xe/xe_log.h
> +++ b/drivers/gpu/drm/xe/xe_log.h
> @@ -103,4 +103,16 @@ void xe_log_emit(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
>   	xe_log_from((any), (cper_sev), (int)XE_LOG_COMPONENT_##TAG##_SIGID, \
>   		    XE_LOG_COMPONENT_##TAG, (data), (len), fmt, ##args)
>   
> +#define xe_log_comp_fatal(any, TAG, data, len, fmt, args...) \
> +	xe_log_comp((any), CPER_SEV_FATAL, TAG, (data), (len), fmt, ##args)
> +
> +#define xe_log_comp_recoverable(any, TAG, data, len, fmt, args...) \
> +	xe_log_comp((any), CPER_SEV_RECOVERABLE, TAG, (data), (len), fmt, ##args)
> +
> +#define xe_log_comp_corrected(any, TAG, data, len, fmt, args...) \
> +	xe_log_comp((any), CPER_SEV_CORRECTED, TAG, (data), (len), fmt, ##args)
> +
> +#define xe_log_comp_info(any, TAG, data, len, fmt, args...) \
> +	xe_log_comp((any), CPER_SEV_INFORMATIONAL, TAG, (data), (len), fmt, ##args)
> +
>   #endif
