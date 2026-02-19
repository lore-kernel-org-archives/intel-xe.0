Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87E56E9A04D
	for <intel-xe@archiver.kernel.org>; Thu, 19 Feb 2026 00:18:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 467EC10E156;
	Thu, 19 Feb 2026 00:18:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H+69/34W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E587410E156
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Feb 2026 00:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771460330; x=1802996330;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=bX11AGuEAVcl/UvV/Tgh+V9jWQ5fx0ukVaMzE27iK70=;
 b=H+69/34WRm2C0Q89/dLNeSlBExYzTXlqzfyoPl2tn6OfB+AEjQVr4c+k
 gu7Om6VHWuJIIoAgVMjqnKmds0LSR+xKw5TxKXF+UeiK5Uf7W3/u9ufmb
 wLFyftsYTSInXtuInLxLvI5GYR7r2WoWXuQLe+MFusQRKtXphwhKVE9Tx
 gWybfG7I+I9qjceHMbRh2KMD02l/tVXZ0WlejNzcYofUSH3Ih24i9HtiM
 JEx4jgWQvtlTXon81EpFRg4DmE9Fkh2kz+GMXtHgmP7B8TG6VTOfJpzev
 8mA4GY28kib5nSfojn8nM2ervawoxCtV2VvkbBCIlHDZzsL+r9zLbeQMM Q==;
X-CSE-ConnectionGUID: /bveNrbiT1OmxRi64nMZLg==
X-CSE-MsgGUID: Z/LrQ4OQR86d5gUotcJ4Dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="89956775"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208,217";a="89956775"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 16:18:50 -0800
X-CSE-ConnectionGUID: 5zOZT5aCTpm0a/zuXZ0y2A==
X-CSE-MsgGUID: fxEiaqm7Rxi/uiZCBoXqlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; 
 d="scan'208,217";a="213510730"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 16:18:49 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 18 Feb 2026 16:18:49 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 18 Feb 2026 16:18:49 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.45) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 18 Feb 2026 16:18:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mETRVlSu5gnuRUgY5mmPS/wBeTLp7Xl9GAgIGNhQUqFO3AdawaTy18kich0oD1usokowdb+lDP2gu8T48Oe/cRkJnWT2JO3JYY9cGKPtyfXwG9p61NRmzN9MVdiDq+VXMYLXllTRLsALhqQZtXEexnU7KEVkvL2owqB3VNoEMJz10f7siTYbp6J4dKadvMOd6+oLPWc90VuI5G3xA1nxViESl5Yde3Tl8SnxB8Uo/ekb4zWROQSAxke1asVVowIaS3lpVP4X3AKY683RcG1RtibtnFMNJidJ8uQvzKfH9SHg8WbOG9niRg/5Qj7MpRHo/x8zoYh5grU5J7GdQT3Uzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mluDfIYYul4Ojbyp9p+IrvzCp6Q7Pel0diJxONc5Iis=;
 b=BL+vepM2RpljXFRvqYTUQ6itZunnws71H9kyJaWlaXUHxzyEVFp4157CMVwPG9H7YBuGO8zDhykWaOPC2kFa5JJUqfhs3EHrjmiuC7ygA1eP6SS26EwejP9w4H10bgMtm8CBE7DSgBuDOYhZwgRCtNJbhiSg0OeZtgEYR540qj/3RfG1+xPl4PE9cjbXtHFeaLVVSaWTLHpQF2sFs0oT60TvsAOckq5Mrcmnhqjw2oYRcPk6hlWu+6Zkg9Mju3JfI3ldz7d7YHDZiHP1+Z9/La7n7x0s3Wg0ObWf+Xqn6hIRhnWJ/+lhwmnXU3TZ5tayuM4SgwGPpsqKdQQxiY0EGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9226.namprd11.prod.outlook.com (2603:10b6:208:574::13)
 by BY1PR11MB8078.namprd11.prod.outlook.com (2603:10b6:a03:52a::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Thu, 19 Feb
 2026 00:18:40 +0000
Received: from IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::4efd:8324:f06f:5b70]) by IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::4efd:8324:f06f:5b70%6]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 00:18:40 +0000
Content-Type: multipart/alternative;
 boundary="------------P92Uj23bIZxxiemL2SkEXYif"
Message-ID: <082c0139-c43b-4ac2-b394-99648afecef8@intel.com>
Date: Thu, 19 Feb 2026 01:18:37 +0100
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_drm/xe/guc?=
 =?UTF-8?Q?=3A_Increase_GuC_log_sizes_in_debug_builds?=
To: <intel-xe@lists.freedesktop.org>
References: <20260213140008.1473400-1-tomasz.lis@intel.com>
 <177107205515.254602.13254433727933943779@a3b018990fe9>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <177107205515.254602.13254433727933943779@a3b018990fe9>
X-ClientProxiedBy: VI1PR0502CA0006.eurprd05.prod.outlook.com
 (2603:10a6:803:1::19) To IA3PR11MB9226.namprd11.prod.outlook.com
 (2603:10b6:208:574::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9226:EE_|BY1PR11MB8078:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d29989d-91bc-4c7c-ce58-08de6f4c6f01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|13003099007|8096899003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WFc3RVVOWENpWDM0MnZHeGNkTXVWYlVqMlJUK1pYNUZLcWJsSUtHbHVLQkpx?=
 =?utf-8?B?VGVJUWVVWFdHcGpVUlo2dXV2VG5WNlkvYU0rNDhVMWV5Y0xEVC96T05vYjBk?=
 =?utf-8?B?RlF4SjZPa2ZjVHFhQ0d3aUx4MVNNcmZNM0J0cXcrNDEzRDFOb2RFZlNHL1p0?=
 =?utf-8?B?SG9UZUJXZWFUSlM5am5uYWg2RHlxdSs3U3VFREtOeXpQeWc5ZURIQXhsMTdY?=
 =?utf-8?B?Ym8zR0pqcm9NZnhJT29rRGtHL3NNZEtPYWh1VittdXc3QUJWM1gzamV1b0pr?=
 =?utf-8?B?SHc1Z1oycFZ6NmxuVm5UQS9mYmxhaUxJN2REbTFXN1Z3c0VjRWgyek1IZ1pm?=
 =?utf-8?B?ekQrbmdlc3lKWE9udmNLZEtvTlBndGNrRnR2OTJxa0xlVjJVeVJJRVlKY1lG?=
 =?utf-8?B?L08wemR3WStFTC9wTkFsMG9xUEJXNS9tWEFYNzQzS3MzNmptU21xci9OeGZx?=
 =?utf-8?B?T2RzMlVQN0h2TlpySytybTJ6WEVjWWU1eHFMK3VXUXdJRXlKUU5XMW9tZVZR?=
 =?utf-8?B?THFrOHM0RWxNVUZ0QWhBT29KUTU2NFZvT09uVEdia1dYTWYrT3J1TmUxN2My?=
 =?utf-8?B?K2MvclFwSjVtL2dNR3pkdGxIK2N5aVBIUGxZS2VnWVpmWW1JdUZadTQvc0x0?=
 =?utf-8?B?REhIb2RnOUcwcUxnUk9qd0QwSlVqbFFwRjE5ZFRUQk94a1hsZUEwNWFNSzBS?=
 =?utf-8?B?S21IWXU4aGlFWXVINGJSVWMxeTMrT21xV1FuVWdCc2ZKYnlFU0U2RE1WL0Jx?=
 =?utf-8?B?RU94MWdpQWR3NE9GZ0sxTXVxR29FMU1yczJ4T3lXeXd2YzYwVXVPSHBqSDJY?=
 =?utf-8?B?UzBhdHN6N2VmVXc2UU9SR0EycldmWlhmMlU5emJUTG9qN3ZKUndRVDVsM29K?=
 =?utf-8?B?bncveWg4UGRkR2ZaQS8vd2lwVmZjcGg3TWVFL1Z2cmUzcTFHR0tDWE1lRm11?=
 =?utf-8?B?SGl4S2Vzbyt3K1M1NU5EeGVzMnhSS24vV3kzZDdJWFI4WnpvRjEwQXJGOUxo?=
 =?utf-8?B?ZHNZWVJUZldHczRLc3JXRzE3MXpveEVFeGlKY25GNjdNQjl6bzBmc1pGUkts?=
 =?utf-8?B?T3pwaFFYbzdLamRHbUdBc1k0dzFvV2pLdFF3bmxMK0REUHBiaVg0dEpOWFZM?=
 =?utf-8?B?ZlpISGZVTXliYjAzWmJqQnZmSzB4bDBORml0UHlQdGgwM3N1ZFNpTzdub2dB?=
 =?utf-8?B?bU1ES2pUNGpoY1hYajJHRmdJcFphbjVtaXZKSHFHektpSW1OOXZ2T3g5Q29X?=
 =?utf-8?B?N1hOT3BJSWNUNHFyNk9SMG9odGFxbk9RRTgvT0YySHUwV0JnOVI3cDFCN2p1?=
 =?utf-8?B?K2ZWcUxkTGtXcllVMWF0eklTMEVmeWFCaTRjbjE3cEplUlZobFJmTHVXZjc2?=
 =?utf-8?B?aTA3N2lOSHFwN1daODFWWXVrenFEOThLNVdxVUt4T1c0TWxSU0FhS1JUN080?=
 =?utf-8?B?ZVdmRHlTeEF2ZEtkdmUxOHhYWGpKTVRDalhqRGxmQ08zYWkyeHY4QjgwaCtL?=
 =?utf-8?B?SFByN3JFYWJPMmdQMlBPRXYyVU9GRmlNbzNVSzVYbjFnTlA2V2VUcHhoNWNm?=
 =?utf-8?B?TE8rWHFtSEx0ejE0K0hhNjZPelh1b3p1Qnh6Q2p4MWorajc5N2tFb1FuLzBh?=
 =?utf-8?B?RzB6c0xETUZmbzYvQ21PNjIyL1NGb3ZUUzhUUFg3RG1sRzgrT1FIckl5dFpk?=
 =?utf-8?B?R0xLdGJaSS9ZWGZQRHFQMEc0a041dkxSYjdPMUw3UEVPWlRZYUFJNldJbXpy?=
 =?utf-8?B?aFJqM0NVRyt2S0xnSzlURE1za243OUF2TEszL2lUN1BQVUZSTWJHQS9VcVdW?=
 =?utf-8?B?WmNiaitUZmV2d2ttSGlNam9FSUJ6SHMyRGR5VFZKRk5UVVNyZW05QXVFQjlt?=
 =?utf-8?B?OW5NQzZVVVN2QXUvNVNxNlZJRkhZclZieUw3dXI0RWJodGRDVFRtV25YTTRZ?=
 =?utf-8?B?SGt2MTlldnhmQVRsYXIvSklHYkRhL0svOW5IUWlodVk3RnBwZW4rcFJkMFAw?=
 =?utf-8?B?MzNaRUtYVjhWaFdjK2srWjNOQW53SlphMHBoYzlIdGpSRDFJR2NXVWlzTzVU?=
 =?utf-8?Q?XPDawY?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9226.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(13003099007)(8096899003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QnluTG9yUHF3bk5kTmlzV1JWeXVyR2syUmJhVTB6d1Jpbmx1VlEwZ0NseURo?=
 =?utf-8?B?Z2Zud3BjakdOY1lYVGNVdW1TMFdXSXA0NDhjNVlkbUN2ZUhIOTVpRzZSc2JF?=
 =?utf-8?B?M1JBMXk3d0c1UkdPeXF2Kzl0aEpBVUo3ZmdDZ1h5NnVjN1d6V1o5djMxU3FL?=
 =?utf-8?B?bnMzWHJzK1dTWW5KV2FzbVIrbDIyMkJZTWFzS0FEWVRDUmIybzhMYWNBU045?=
 =?utf-8?B?NGFKVDllRDRFWk9rcU5TcUZwZVBwa1lpSnRwdjdPeWw5TUtxWk05OXVwcmQ0?=
 =?utf-8?B?aHFrVGdPU2FoN3JOczZicFJwaW1JUVVGMVk5NE50YURxZW9OVjJCVnlqVEU4?=
 =?utf-8?B?YTV1YkZDTFpzV3NqN2J2SE01b0w3amEvQi9zY2FnOGZxa2M0UVlPWjNwd25N?=
 =?utf-8?B?d21GVi9iclJZbTYyYVJQK05uVGEvSUMvaDVlbnZ6OEhCay9jR1ZuazNFa2ox?=
 =?utf-8?B?V3pZd3lNQm1hNWxoSzJzdUt2eVRORUZhZkp2dHNGeGVyaGNET2dlOUVEU3Z5?=
 =?utf-8?B?aUtKdksvNFV5N2g4TDVLaDNQRTV6R1pNbnZ3dVFXM2tLcDA2Wi9FYkN1R01h?=
 =?utf-8?B?Vkw0dVAxZWdvRWVOV0VaQ2MzclJWbTZEZzVEcU9RYUU1QkZZL1R2ZGlncXFl?=
 =?utf-8?B?cml5RHR5a2RKN1Z6WDRmTmxQSktjRGJqWXYvSTIwRUNSSHpKQ1ZRZmVieFMv?=
 =?utf-8?B?Y1VGcFFXaGZQb04yMzdYUjcrbDlMRFJYeGFIOWRiWDVuTnpyN1B1TU9sMlZN?=
 =?utf-8?B?bm1rc2taNUJGRnBQb1YxZThvdjVaRXF0WmhxUmJzZFZQTjc3MnMxaG9ERGZl?=
 =?utf-8?B?REpMVmdPZTQ5UjlXYjFkR0ZqWUhuYnQvUmlnWXNuMGF6VnExV3Y3NGxKT0tV?=
 =?utf-8?B?cUNZTEtjc1JxWFMrbTQvaFRJemY2Z25RRVM1ZGFCVHJkbU90Y25DeEpBY2xp?=
 =?utf-8?B?blo4WUpEeDhCZnB0MHNSSVRkUzA2N1lDZDVEdGk4MVFrb2d0VDlmS1JKZGhI?=
 =?utf-8?B?YWtVbEI3M1NmNElUQWRmbjdLN1VhR3dmRGFENnQzMHIrZnVOS05ycjFQQk9h?=
 =?utf-8?B?L2plSDIzM0c4ZE9EZkhxOFEyZlJYTWx3bnBNRmQ2cXpCdlFqUWhOaFYrOUhY?=
 =?utf-8?B?d0lXSkU4eHo2aWl5K3JwVWY2UnFXQUJLL1RiV1hwUUJhN3d1MXA1bWJRU0ZB?=
 =?utf-8?B?b2J6QW05T0xNdWN1Z3hneEloK3FlQnlvdHljaEhrS1hyS2REa3BJRGxHclB4?=
 =?utf-8?B?NWFDN1AvNjF2UVNnSDFZTXArb1lJU0xJcUt6aVVsSGpWSGRVeHFRN21MMWc1?=
 =?utf-8?B?TjV1ZWM4QU1KYnh6bzN3N2xpUjJibGRrL3ZwTUdBWXUvbnFZVkd3anRIWU4v?=
 =?utf-8?B?Y3l5YnhtSDUzN3lXeDJrdlAvbnRKYnl3NndzZ1VHYktVZ3ZGUFcyWENadDJS?=
 =?utf-8?B?Z0xUZm1UKzh4ZFkzNFVhYTZJc3Z1RW9pbURRMUFsQXI2QmxXckRzakR1Smc2?=
 =?utf-8?B?Q2JsNllsODI1QVh3dlY1NlRjMkx6Ymszc1JZL2FESlYrVktITklmWC9pQU5r?=
 =?utf-8?B?TDVscTJodDR4TzFzSm5sZ3dNRXg1Y0lKMFk0ZWFQMW9FeUFHYVlGQlFscDF3?=
 =?utf-8?B?T3V1aVdVVThXQ05vMFI3ZFB3ZE9HZlFvTGFERVpnNFZDSCszUk93WkJkUW9q?=
 =?utf-8?B?eHhJeWRhRmFlbnNqZmhDMHZOTndOWVU4RGY5VE1tM28zTjUrMkVxTytROVZu?=
 =?utf-8?B?MEhqVU0ySXl6QlhlR0VFdE1STFVxcjhhZnB5M1N5aUwrczFxbmFuKzVYVWhz?=
 =?utf-8?B?NVo5a2RxanEzeHZzTkNJalVKaklnaFpYQTJFYWVzMnE0M2d2eE4wZ0NpeXFq?=
 =?utf-8?B?bWFobzNtN25tM29BMjVJVC9kM3VCYlFKMFhDRVJ0aURoeENWTlNnWlhjcmlL?=
 =?utf-8?B?TTZQYlBhZXk3RGtQa21wdnRKQzAyaElJL0k1bzZOMW1yanVZN2xmWFB0bWVT?=
 =?utf-8?B?N1Y2azJteDk5MGtXT1RQVXNvMzBnNEc2dkZPaitMMmhMakMySnpjcHFUU1Z3?=
 =?utf-8?B?WTc2cllzdzd3WmhNV0JoSTFVSjNnWXptRWcrN29tTnZUa1ZvdGoyODA0cU5t?=
 =?utf-8?B?bi9FZHp4eFlmeDcraUFycHRPNWtjQmpmelBxOEdhMDlvVVErcGtucFcvYTNF?=
 =?utf-8?B?MStnY1RQZVZ2Vkp3T2lBWlhBN3hNN0VmTnBpaVZHUTE2ajhLczZVY1dYZXhu?=
 =?utf-8?B?MW9yYlYydFNNc0wxNzRpRWMxUDhrcktVakJrMTkzZWg2K2RSdmh1SklCNks1?=
 =?utf-8?B?ZnplNmRpYnpQRlpxN1diL2FwZXF6eHR3MDFaYVNTZGdHNktBNmh6Zz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d29989d-91bc-4c7c-ce58-08de6f4c6f01
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9226.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 00:18:40.5790 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uu/lsINAmZFlueICgpq1nq3aF7PaGL/IRUyaVtKe9lVuc67wEFWmObIID3Ruqbw7RzphUXqxH0uddnMbwAk7rQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8078
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

--------------P92Uj23bIZxxiemL2SkEXYif
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Analysis of fails:

* igt@kms_async_flips@alternate-sync-async-flip@pipe-c-edp-1

This is a display test, unrelated to GuC log. The fail is due to some 
slowdown during display testing, from first look it seem to be test 
issue rather than Xe issue - the test is susceptible to slowdowns on CPU 
side.

* igt@xe_exec_system_allocator@eu-fault-4k-range-device

Also unrelated to GuC or the patch under test, but this is worrying.

During creation of buffer object from user space 
(`xe_bo_create_user()`), the kernel function `rb_insert_color()` was 
called on a NULL node.

Memory corruption within iommu domains referenced from within `struct 
device`? I hope we're not seeing this often.


Fails not related to series under test.

-Tomasz


On 2/14/2026 1:27 PM, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	drm/xe/guc: Increase GuC log sizes in debug builds
> *URL:* 	https://patchwork.freedesktop.org/series/161589/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161589v1/index.html
>
>
>   CI Bug Log - changes from
>   xe-4553-f9b2cabe33794dfc69b0a547516d9e2f45718f0b_FULL ->
>   xe-pw-161589v1_FULL
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with xe-pw-161589v1_FULL absolutely 
> need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-161589v1_FULL, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
>
>     Participating hosts (2 -> 2)
>
> No changes in participating hosts
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in 
> xe-pw-161589v1_FULL:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>  *
>
>     igt@kms_async_flips@alternate-sync-async-flip@pipe-c-edp-1:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4553-f9b2cabe33794dfc69b0a547516d9e2f45718f0b/shard-lnl-7/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-edp-1.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161589v1/shard-lnl-5/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-edp-1.html>
>  *
>
>     igt@xe_exec_system_allocator@eu-fault-4k-range-device:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4553-f9b2cabe33794dfc69b0a547516d9e2f45718f0b/shard-bmg-2/igt@xe_exec_system_allocator@eu-fault-4k-range-device.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161589v1/shard-bmg-6/igt@xe_exec_system_allocator@eu-fault-4k-range-device.html>
>
>
>     Known issues
>
> Here are the changes found in xe-pw-161589v1_FULL that come from known 
> issues:
>
>
>       IGT changes
>
>
>         Issues hit
>
>  *
>
>     igt@kms_async_flips@alternate-sync-async-flip:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4553-f9b2cabe33794dfc69b0a547516d9e2f45718f0b/shard-lnl-7/igt@kms_async_flips@alternate-sync-async-flip.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161589v1/shard-lnl-5/igt@kms_async_flips@alternate-sync-async-flip.html>
>         (Intel XE#3718
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718>)
>  *
>
>     igt@kms_color_pipeline@plane-lut3d-green-only@pipe-c-dp-1:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161589v1/shard-bmg-5/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-c-dp-1.html>
>         (Intel XE#6969
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969>) +1
>         other test skip
>  *
>
>     igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-dp-1:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161589v1/shard-bmg-5/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-dp-1.html>
>         (Intel XE#6969
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969> /
>         Intel XE#7006
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006>)
>  *
>
>     igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2:
>
>       o shard-bmg: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161589v1/shard-bmg-1/igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2.html>
>         (Intel XE#3304
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304>)
>  *
>
>     igt@kms_content_protection@uevent-hdcp14@pipe-a-dp-1:
>
>       o shard-bmg: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161589v1/shard-bmg-5/igt@kms_content_protection@uevent-hdcp14@pipe-a-dp-1.html>
>         (Intel XE#6707
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707>)
>  *
>
>     igt@kms_cursor_legacy@flip-vs-cursor-legacy:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4553-f9b2cabe33794dfc69b0a547516d9e2f45718f0b/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161589v1/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html>
>         (Intel XE#4633
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633>)
>  *
>
>     igt@kms_flip@flip-vs-suspend:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4553-f9b2cabe33794dfc69b0a547516d9e2f45718f0b/shard-bmg-9/igt@kms_flip@flip-vs-suspend.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161589v1/shard-bmg-9/igt@kms_flip@flip-vs-suspend.html>
>         (Intel XE#2049
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049> /
>         Intel XE#2597
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597>) +1
>         other test incomplete
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161589v1/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render.html>
>         (Intel XE#2311
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311>)
>  *
>
>     igt@kms_setmode@basic:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4553-f9b2cabe33794dfc69b0a547516d9e2f45718f0b/shard-bmg-6/igt@kms_setmode@basic.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161589v1/shard-bmg-4/igt@kms_setmode@basic.html>
>         (Intel XE#6361
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6361>) +2
>         other tests fail
>
>
>         Possible fixes
>
>  *
>
>     igt@kms_bw@linear-tiling-1-displays-2160x1440p:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4553-f9b2cabe33794dfc69b0a547516d9e2f45718f0b/shard-bmg-1/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html>
>         (Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161589v1/shard-bmg-5/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html>
>  *
>
>     igt@kms_flip@flip-vs-expired-vblank-interruptible:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4553-f9b2cabe33794dfc69b0a547516d9e2f45718f0b/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html>
>         (Intel XE#301
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301> /
>         Intel XE#3149
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161589v1/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html>
>         +1 other test pass
>  *
>
>     igt@kms_pipe_crc_basic@suspend-read-crc:
>
>       o shard-bmg: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4553-f9b2cabe33794dfc69b0a547516d9e2f45718f0b/shard-bmg-3/igt@kms_pipe_crc_basic@suspend-read-crc.html>
>         (Intel XE#3428
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161589v1/shard-bmg-10/igt@kms_pipe_crc_basic@suspend-read-crc.html>
>         +1 other test pass
>  *
>
>     igt@xe_oa@non-zero-reason-all:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4553-f9b2cabe33794dfc69b0a547516d9e2f45718f0b/shard-lnl-4/igt@xe_oa@non-zero-reason-all.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161589v1/shard-lnl-4/igt@xe_oa@non-zero-reason-all.html>
>         +1 other test pass
>  *
>
>     igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_copy0:
>
>       o shard-bmg: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4553-f9b2cabe33794dfc69b0a547516d9e2f45718f0b/shard-bmg-7/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_copy0.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161589v1/shard-bmg-7/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_copy0.html>
>         +2 other tests pass
>
>
>         Warnings
>
>  *
>
>     igt@kms_hdr@brightness-with-hdr:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4553-f9b2cabe33794dfc69b0a547516d9e2f45718f0b/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html>
>         (Intel XE#3374
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374> /
>         Intel XE#3544
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161589v1/shard-bmg-9/igt@kms_hdr@brightness-with-hdr.html>
>         (Intel XE#3544
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544>)
>  *
>
>     igt@xe_exec_multi_queue@two-queues-basic:
>
>       o shard-bmg: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4553-f9b2cabe33794dfc69b0a547516d9e2f45718f0b/shard-bmg-7/igt@xe_exec_multi_queue@two-queues-basic.html>
>         (Intel XE#2594
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161589v1/shard-bmg-7/igt@xe_exec_multi_queue@two-queues-basic.html>
>         (Intel XE#6874
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874>)
>  *
>
>     igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
>
>       o shard-bmg: ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4553-f9b2cabe33794dfc69b0a547516d9e2f45718f0b/shard-bmg-5/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html>
>         (Intel XE#5466
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466> /
>         Intel XE#6652
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652>) ->
>         ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161589v1/shard-bmg-9/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html>
>         (Intel XE#5466
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466>)
>
>
>     Build changes
>
>   * Linux: xe-4553-f9b2cabe33794dfc69b0a547516d9e2f45718f0b ->
>     xe-pw-161589v1
>
> IGT_8753: 8753
> xe-4553-f9b2cabe33794dfc69b0a547516d9e2f45718f0b: 
> f9b2cabe33794dfc69b0a547516d9e2f45718f0b
> xe-pw-161589v1: 161589v1
>
--------------P92Uj23bIZxxiemL2SkEXYif
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Analysis of fails:</p>
    <p>* igt@kms_async_flips@alternate-sync-async-flip@pipe-c-edp-1</p>
    <p>This is a display test, unrelated to GuC log. The fail is due to
      some slowdown during display testing, from first look it seem to
      be test issue rather than Xe issue - the test is susceptible to
      slowdowns on CPU side.</p>
    <p>* igt@xe_exec_system_allocator@eu-fault-4k-range-device</p>
    <p>Also unrelated to GuC or the patch under test, but this is
      worrying.</p>
    <p>During creation of buffer object from user space (`<span id="dmesg-normal49" class="dmesg dmesg-normal">xe_bo_create_user()`),
        the kernel function `rb_insert_color()` was called on a NULL
        node.</span></p>
    <p><span id="dmesg-normal49" class="dmesg dmesg-normal">Memory
        corruption within iommu domains referenced from within `struct
        device`? I hope we're not seeing this often.</span></p>
    <p><br>
    </p>
    <p>Fails not related to series under test.</p>
    <p>-Tomasz</p>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2/14/2026 1:27 PM, Patchwork wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:177107205515.254602.13254433727933943779@a3b018990fe9">
      
      <title>Project List - Patchwork</title>
      <style id="css-table-select" type="text/css">td { padding: 2pt; }</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>drm/xe/guc: Increase GuC log sizes in debug builds</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a href="https://patchwork.freedesktop.org/series/161589/" moz-do-not-send="true" class="moz-txt-link-freetext">https://patchwork.freedesktop.org/series/161589/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161589v1/index.html" moz-do-not-send="true" class="moz-txt-link-freetext">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161589v1/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from
        xe-4553-f9b2cabe33794dfc69b0a547516d9e2f45718f0b_FULL -&gt;
        xe-pw-161589v1_FULL</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with xe-pw-161589v1_FULL
        absolutely need to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in xe-pw-161589v1_FULL, please notify your bug team
        (<a class="moz-txt-link-abbreviated" href="mailto:I915-ci-infra@lists.freedesktop.org">I915-ci-infra@lists.freedesktop.org</a>) to allow them<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <h2>Participating hosts (2 -&gt; 2)</h2>
      <p>No changes in participating hosts</p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        xe-pw-161589v1_FULL:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>
          <p>igt@kms_async_flips@alternate-sync-async-flip@pipe-c-edp-1:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4553-f9b2cabe33794dfc69b0a547516d9e2f45718f0b/shard-lnl-7/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-edp-1.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161589v1/shard-lnl-5/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-edp-1.html" moz-do-not-send="true">FAIL</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_system_allocator@eu-fault-4k-range-device:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4553-f9b2cabe33794dfc69b0a547516d9e2f45718f0b/shard-bmg-2/igt@xe_exec_system_allocator@eu-fault-4k-range-device.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161589v1/shard-bmg-6/igt@xe_exec_system_allocator@eu-fault-4k-range-device.html" moz-do-not-send="true">INCOMPLETE</a></li>
          </ul>
        </li>
      </ul>
      <h2>Known issues</h2>
      <p>Here are the changes found in xe-pw-161589v1_FULL that come
        from known issues:</p>
      <h3>IGT changes</h3>
      <h4>Issues hit</h4>
      <ul>
        <li>
          <p>igt@kms_async_flips@alternate-sync-async-flip:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4553-f9b2cabe33794dfc69b0a547516d9e2f45718f0b/shard-lnl-7/igt@kms_async_flips@alternate-sync-async-flip.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161589v1/shard-lnl-5/igt@kms_async_flips@alternate-sync-async-flip.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718" moz-do-not-send="true">Intel XE#3718</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_color_pipeline@plane-lut3d-green-only@pipe-c-dp-1:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161589v1/shard-bmg-5/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-c-dp-1.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969" moz-do-not-send="true">Intel XE#6969</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-dp-1:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161589v1/shard-bmg-5/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-dp-1.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969" moz-do-not-send="true">Intel XE#6969</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006" moz-do-not-send="true">Intel XE#7006</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161589v1/shard-bmg-1/igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304" moz-do-not-send="true">Intel XE#3304</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@uevent-hdcp14@pipe-a-dp-1:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161589v1/shard-bmg-5/igt@kms_content_protection@uevent-hdcp14@pipe-a-dp-1.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707" moz-do-not-send="true">Intel XE#6707</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4553-f9b2cabe33794dfc69b0a547516d9e2f45718f0b/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161589v1/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633" moz-do-not-send="true">Intel XE#4633</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-suspend:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4553-f9b2cabe33794dfc69b0a547516d9e2f45718f0b/shard-bmg-9/igt@kms_flip@flip-vs-suspend.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161589v1/shard-bmg-9/igt@kms_flip@flip-vs-suspend.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049" moz-do-not-send="true">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597" moz-do-not-send="true">Intel XE#2597</a>) +1 other test
              incomplete</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161589v1/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311" moz-do-not-send="true">Intel XE#2311</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_setmode@basic:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4553-f9b2cabe33794dfc69b0a547516d9e2f45718f0b/shard-bmg-6/igt@kms_setmode@basic.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161589v1/shard-bmg-4/igt@kms_setmode@basic.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6361" moz-do-not-send="true">Intel XE#6361</a>) +2 other tests
              fail</li>
          </ul>
        </li>
      </ul>
      <h4>Possible fixes</h4>
      <ul>
        <li>
          <p>igt@kms_bw@linear-tiling-1-displays-2160x1440p:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4553-f9b2cabe33794dfc69b0a547516d9e2f45718f0b/shard-bmg-1/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367" moz-do-not-send="true">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161589v1/shard-bmg-5/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4553-f9b2cabe33794dfc69b0a547516d9e2f45718f0b/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301" moz-do-not-send="true">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149" moz-do-not-send="true">Intel XE#3149</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161589v1/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4553-f9b2cabe33794dfc69b0a547516d9e2f45718f0b/shard-bmg-3/igt@kms_pipe_crc_basic@suspend-read-crc.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428" moz-do-not-send="true">Intel XE#3428</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161589v1/shard-bmg-10/igt@kms_pipe_crc_basic@suspend-read-crc.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_oa@non-zero-reason-all:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4553-f9b2cabe33794dfc69b0a547516d9e2f45718f0b/shard-lnl-4/igt@xe_oa@non-zero-reason-all.html" moz-do-not-send="true">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161589v1/shard-lnl-4/igt@xe_oa@non-zero-reason-all.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_copy0:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4553-f9b2cabe33794dfc69b0a547516d9e2f45718f0b/shard-bmg-7/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_copy0.html" moz-do-not-send="true">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161589v1/shard-bmg-7/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_copy0.html" moz-do-not-send="true">PASS</a> +2 other tests pass</li>
          </ul>
        </li>
      </ul>
      <h4>Warnings</h4>
      <ul>
        <li>
          <p>igt@kms_hdr@brightness-with-hdr:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4553-f9b2cabe33794dfc69b0a547516d9e2f45718f0b/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374" moz-do-not-send="true">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544" moz-do-not-send="true">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161589v1/shard-bmg-9/igt@kms_hdr@brightness-with-hdr.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544" moz-do-not-send="true">Intel XE#3544</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_multi_queue@two-queues-basic:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4553-f9b2cabe33794dfc69b0a547516d9e2f45718f0b/shard-bmg-7/igt@xe_exec_multi_queue@two-queues-basic.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594" moz-do-not-send="true">Intel XE#2594</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161589v1/shard-bmg-7/igt@xe_exec_multi_queue@two-queues-basic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874" moz-do-not-send="true">Intel XE#6874</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4553-f9b2cabe33794dfc69b0a547516d9e2f45718f0b/shard-bmg-5/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466" moz-do-not-send="true">Intel XE#5466</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652" moz-do-not-send="true">Intel XE#6652</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161589v1/shard-bmg-9/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466" moz-do-not-send="true">Intel XE#5466</a>)</li>
          </ul>
        </li>
      </ul>
      <h2>Build changes</h2>
      <ul>
        <li>Linux: xe-4553-f9b2cabe33794dfc69b0a547516d9e2f45718f0b
          -&gt; xe-pw-161589v1</li>
      </ul>
      <p>IGT_8753: 8753<br>
        xe-4553-f9b2cabe33794dfc69b0a547516d9e2f45718f0b:
        f9b2cabe33794dfc69b0a547516d9e2f45718f0b<br>
        xe-pw-161589v1: 161589v1</p>
    </blockquote>
  </body>
</html>

--------------P92Uj23bIZxxiemL2SkEXYif--
