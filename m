Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C437FD116F1
	for <intel-xe@archiver.kernel.org>; Mon,  1 Dec 2025 14:26:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AD268922E;
	Mon,  1 Dec 2025 14:26:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d6VcuMuR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BF3B8922E
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Dec 2025 14:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764599161; x=1796135161;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bdMxH0L+Aan9zIAl2Kv65NvvwAZ2F3YebqvPbIdUCr0=;
 b=d6VcuMuRtqjUgj4MhC9eARdvMSI817OKUHbWvxGK+tWy2ivcFAQ8hcKF
 izPy3oXOOocUXVkTSmgIUwZtaamjqMJpGN3moZfD19/zY+Tg1LGSSstwp
 Y7hryvPtptVu+CQhMRcnSaiE8S4CTWdLtx5ZukCfndrGMD9h8Pnpwa029
 qTBhJ1co/ih/+Zm4kPCsxniR9LbrlYyhLodZ49s2ZWio+gI0A+llNC/sd
 osixH1Qii5yiSF4rQ5NvDWto0IOI56Bb72wRMXYf54Le4h015sosGUEes
 oUI7rB+Defm599x9TqZNsdygahXqFZB74A0QWsG3ERcsziySbN3/mqWum g==;
X-CSE-ConnectionGUID: UIlH5q4wS7iUuPsZnVR0iA==
X-CSE-MsgGUID: 4ktRMIHkST2f5X4poqeDYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="70399048"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="70399048"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 06:26:01 -0800
X-CSE-ConnectionGUID: IpUK6qZ0TXetXJR3S12xZQ==
X-CSE-MsgGUID: TcDBRltJTk68bTuGViz+gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="194191361"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 06:26:01 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 06:26:00 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 1 Dec 2025 06:26:00 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.28) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 06:26:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jPE1qktni4ZZxCYrMw+0cK+Zm05uQJVGIK4HqHhVDRH4qfLM5SkUf7XZ7lvAxbVwgADoLjQ3uIgfxWjU74haxTT856gdsMfARy24pUP3iDJgy8sCj6EyDJYovf0PU6XFEvVas/K2tPfO5HLh1XUdGRHqmBHDH2mlCLTGHkPpFs6viljm0w1ccZOgwPIXPcgb9bY/WreIqV9yXDYrBZ9vM7F0RVRaSCkZN+7JG0b8d7LPGMBeLNFed7GhR9c+2tqz5qDS5Qlu86DP2rOPfqMXN8ud3ZtzDqNSD0RBNt9aTaHY2ngNlXFdAKoF3m6kkTh4wujVdQEk40B7O9aIaMLlAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lT0a85NzcGumezcnjMgCsJPrNqSNFicg/FVRUUMnJ9Y=;
 b=JPWSzC6W0pv/y7exlxadbPoDTLkV4KesvICWPEIMxe+FZwlgHq3GfGkGZOZzzzHr/qpG4WQbwuax+cX/wrJA2FKE038xmsXOW6YNKz8ruInlVXuBcyXI3CRMnL4HvDrNpOrrBDbxmcJoq6NsMq0ML5EWJ4u9pE3Ec+4A0MOws+lO7gEi2vXNmXvaYKBppm7LoMBtbxSiIXEwYDyT2CsxykTTmfUj6e7MYJFNMW3R2z6x6E4WUtU++HVauDK4xbr4RcrwQNxaoggM+lNoxGNfExxXvUElyh+x5TwFRllxe7Xg/q6ym8hgkKEB9X1p50y9MeEYRuIBwSi2lqz+b4bC2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SA3PR11MB8119.namprd11.prod.outlook.com (2603:10b6:806:2f2::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 14:25:58 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 14:25:58 +0000
Message-ID: <52585063-8b4e-4aa5-a360-eb2088e901b2@intel.com>
Date: Mon, 1 Dec 2025 15:25:54 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/4] drm/xe/vf: Requeue recovery on GuC MIGRATION error
 during VF post-migration
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>, Tomasz Lis <tomasz.lis@intel.com>
References: <20251201095011.21453-6-satyanarayana.k.v.p@intel.com>
 <20251201095011.21453-9-satyanarayana.k.v.p@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251201095011.21453-9-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P189CA0007.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:802:2a::20) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SA3PR11MB8119:EE_
X-MS-Office365-Filtering-Correlation-Id: eb210df1-a8a6-4281-f3ab-08de30e58b98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aVFqREdHQXVSU1VxUzhGUUNQeWduSUNMajBFeUF5dnBiR2FlZmtCZVJrREN0?=
 =?utf-8?B?ZUZ1TWtMR2lSRFA5Nm5rVnV0RkNKQ0d4RUJLSmdiSnRDLzV6enRWbnJxNkJk?=
 =?utf-8?B?bXZTQlZlMmNpMVBkR1lKY2hwUjRBZzllWHF1dnAzRjdicjBpcVQ4MmZkT3pW?=
 =?utf-8?B?U3MrR2pXOGZGcHROU21USGNPbU0za0l6amd6VWRKaFFXZ0N3UnRjVlNzeFFQ?=
 =?utf-8?B?TXpXOUVLNlU3aWc3bjBpdzVEQWdIN1JwU3VzYmsyZWROMktoNk5xUHF0MjN3?=
 =?utf-8?B?TDlIcUI0T3JIb2I3Mk9idkVpZHpxTllPN0xwVDY5YTllOGh6dDhuWDV6aDVN?=
 =?utf-8?B?RktueWRCVU15NExVTytTWWsxWHRmSGV4dU81azMwMDcvdmxqYUJuZm5qSDlo?=
 =?utf-8?B?blhqcDJyeEE0U09yYTI3YXB2QjVZUW9jMW0rK2dNOEFYM1J1S0pxRWRZSnJm?=
 =?utf-8?B?akZFNE0rc1prQTRIVUNmRnBtQnczZFhJczlqTG1ZOGZMYXRZNDYyazRLTVcz?=
 =?utf-8?B?RERRQ1lhV09WWUdPUUpHQVVQTDEwVlhJVjVyTkVFZTZsd29maW0xOUtsTmxF?=
 =?utf-8?B?cU1HRDlRQnhyM0M3Qzdha3dzWHNFOGNYaUVOSWQ4dTlxNXpITzdSWHVPOVR3?=
 =?utf-8?B?NmVhcFJjSjJCZmR2RXZvTXNwb25kNkJiQVZQbkRzQ1RMM0EzdDhiMCtqTEpq?=
 =?utf-8?B?Y21wYjE4aE9MTVZGYnRrSDEyU3VLYm9MSDlPQ291cXpRNkd3dVR3K3gydkZj?=
 =?utf-8?B?N0Q4NW8zS2YzVmY5eGlDT2JoVUxJMHRYM2xueGJtbHJaWWNZVFJLQ1VEeFZK?=
 =?utf-8?B?dTNjTW9UVG90MXZjRi9wR3l3RkpDRmV0Ti8rd2xPU094T0tYOWNvZ2EraTVk?=
 =?utf-8?B?VUFORHNhY3BUWHNCK09lT0ttSldmdEVhaHNuMHFoT1FvZGsyZm85dlg3S2Fl?=
 =?utf-8?B?Z2lod3FPZnQremhGR1VZMW1ONkk1S3pQS20zV1I3akNEcENRemMyVTRPVFZh?=
 =?utf-8?B?djVoYUJnSzRqamIzaWlOd2oxbFFEZGJpNTVKUlF4b3plSlpwTmk3Rzh4N2tm?=
 =?utf-8?B?dTNTSjloa2lBcEpva05OSVVSdmpwblFXVVU2bC9EazZXWXNEenNvcE1UamFO?=
 =?utf-8?B?QUtSUlBhUVZKT0dGbktYQTBsd05qd3Bhd3JIbGEzSFFhOFJkbUxjNTIxbExu?=
 =?utf-8?B?VTM3czFZZnBVUmtEbmttWU1UU1F5YWdqZFVldlZYdTJORTJuOSt5U3JSU0dz?=
 =?utf-8?B?Vy8vTWw5UkcwcUFzN3dRR1NXMEE4dzE1ZTVaZVk0RzBYUjF4VXJVOHMzNTE4?=
 =?utf-8?B?Y0x2VzBSR0MvSXZFR3BOTGhTeXZUcWdIellWRUxmOU94eFcxbEZOVU9xaVVX?=
 =?utf-8?B?UFJkQlQ3eWZhQkFVL0NFK1FMSW9vVUhHZnNTQzB6V3pvNFBTZkZMQTRtYVQr?=
 =?utf-8?B?UUlnZ3grN29paFNhbWE5aDUvL2pETm56WVBoRi9iMUwySDUwNkxNVkYvL1RT?=
 =?utf-8?B?QVRTc3NKcklxZFV3eEo2LzA4MU5McWdFWm1JaTdVdXZzcnkzNlg0Q3ZKVlBN?=
 =?utf-8?B?UG1IZTV3U0xITm83MW5SVkVZSzdvTSs0bE45dHZyalhBVEZ0ZmVlT0ZpSXZl?=
 =?utf-8?B?VFAyU3MzME81SDd2ZFZ1cmVTbzhqdHY1SWJJRVJHWFFFenhKN01SeWxIampp?=
 =?utf-8?B?aW15ODZUd0htdVBoM3VwUGtpUDJ0VjRZZU9ld1JtdVFnTlpsMXd2OFlVQ0Fu?=
 =?utf-8?B?empzS2pKTHFwd3FCTlA3cFJPQng5eEJNVkprR2kwVG5xbFZkelF1R3RsTzZP?=
 =?utf-8?B?RzByVm80VU4wRmVZR2RPaERuTDBFaDl3N0RwcHNrMUdFU0p2WWFERzVxWVN0?=
 =?utf-8?B?eDZ4N3VCd0xlbm13VFlKeWpOZ0NFVXhRdFZYNXZESGpHc0h4SWxPdHBvTlNq?=
 =?utf-8?Q?eZZwxZU9nv31jPkyqmI1zl1+UKUKyIEG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0ZUVERyalIxbjMwVlVVMGw5a3QwMmJvaVFPV3E3TlZVT3I0cHpxbTA0d2ps?=
 =?utf-8?B?S1JSSGwzemR3eEZOWEV5bHRqU2k0Y1h3M285THZiZ2xCejN2YXBiRzZCZTVY?=
 =?utf-8?B?b2VMZHd0YUtFeitMYmNUTjI4YUk1TzR4TkNUZDYvTWFISUo5MWRIdm1QeWYz?=
 =?utf-8?B?YWE4WEFXQnZpY3BCYVpLZUxQbFpTNlUzWVoxSmo2ZUd2UGhYN2pYYTZWY3dT?=
 =?utf-8?B?ZFJpRG1JLzZRZkFlUkpWVG1jT2syYmVLSW9FcEJOdmVNK0UxYkE4NkIwVUgx?=
 =?utf-8?B?dzBLOENLRnpxUk4xVmZNWU93bThOc3hONjFYWFlMVnVBQy9abHN3enZxYlkx?=
 =?utf-8?B?dVluMndEclJIUEdUcWRIUEJVcENHZHpIb09ONHhpUXdHVVhJQlRGVzRmbmhp?=
 =?utf-8?B?cjIrYTRBbUJZVnp0bUdFRzdDYWV2SzlxQWxtRVdPeWkrRUxQZVVPaStUaEgw?=
 =?utf-8?B?VDVnQ1QxSUN2eGt2VlFRcEw3dnJDY04zMVhOWEc2MzlDMXRlTHhhdG5NTUZE?=
 =?utf-8?B?bWdYSWVsRldMZWZLeTl6dnlYTi9Bc1FYZDBCS3l1TTRrOVFkQzRJRWo3Y0ov?=
 =?utf-8?B?Zy83aysxWjdsTldkRStVMy9kQ0dNOEpFZEU3YnlCRkREMEJqTFBwbHVLOERj?=
 =?utf-8?B?NFJnZVhLaDE1NnFsU1V6MFl3MFhtZ1Fjc3ljZURYbUY2ak15SXUrbkJrd2M0?=
 =?utf-8?B?TGpQM2ZTMlZtdkdnc3hQWFZxSEJVcGpZMjRsWVQzS2MwdllxVmZCN1M2dWww?=
 =?utf-8?B?K0FVVXpTSFkxak9qRXRDTDBnN3o3eU9aektOWTF0VG9mVEE3MldsUExrcGlq?=
 =?utf-8?B?blluTmQ2d0tjZ0lJSHpuT3dPZmtmT0kxUjZsc1J1K3czT0pObFM1WHl2SGJ5?=
 =?utf-8?B?YUVobkc5OWFTQ2ZKUklHanRNVFFid0VjbnNrUGlMVnBHOTkydFBKWHRyRllt?=
 =?utf-8?B?RU9kOGVRbzlxeWFHdjNHTmprSDE3K0ZoMTU5Z0psdnlEWDZxOFdxQ3hPRFF5?=
 =?utf-8?B?TlZPdVVjR3JSNmI1eFY2Z1Boakw5aDZWVmF0UlN0dlliTlQ4WlBFYjd3ODJU?=
 =?utf-8?B?RzZBZjI0UXYraVhiRm9mK1krOVJsUVNOMUIxenkybXFvTUtSMWV2Mk1CMFp3?=
 =?utf-8?B?UFduMktEa1lnUjR4UWJ3Y24xUkwxeHhyaVJHdDBuTGlYaDhwMFltNXZ1emc3?=
 =?utf-8?B?alJMMmRLMUtJQUwzUGNUaHpDTENiTzJnb25IYU9vSlpCeWQ1VnJkdU9SMnAr?=
 =?utf-8?B?NDMrbDNRempOTXAvMGZWSXFnUUJ0aWJRb1d1NzRKQVVvYlRkWXBURnpDNFpB?=
 =?utf-8?B?cEtjNU01T1hBY2hjYzNQeCtUNEJaWnlJM1orOXlWRTNCUGdFRXAwdHNLcVI3?=
 =?utf-8?B?YVA2a3ZHQVF1QnpPem8zUVJXSHBVSE9HZHdYVXlOdm5rdGt3aVpaZi9Idnpx?=
 =?utf-8?B?WXI4YWJuNXIwbDFmZW41VDRFaENESEljUkFEbmJGempyOE9qUTVNdWFEalNZ?=
 =?utf-8?B?RzkwV2VpYnFyY2EvS1JhMmRNREFLQ25DQjgxd1hxWEl5QUFCR3FySU9QZFlL?=
 =?utf-8?B?Y1RUSkFiQ09tbndpamRkVjRST21jYnZwMVI4Sit6TnI4L2E2MVc0bkJveDM5?=
 =?utf-8?B?UXQ0M25Ubkd2VzZBb1FxR3dJU0lWV1RsZHo0OE9DWmJZR0hQZWFwQmZQSi9K?=
 =?utf-8?B?NjFBZHZsQXZnT3JyUWVBaDFSUHZ3WUJoV2dtQ0xEUHVrTzBXczJGNzBSODhH?=
 =?utf-8?B?d1JuTEJTaldrdWNsTjBpSXhHTlFtbjN5akd1UnA1V0x0VmVDemEySnpHa29h?=
 =?utf-8?B?VnpzWC8vUVZjMWxZQTU1VFBqU0N5RXUzd1ZoWGROdExhZUxOVFNNNG9kYytR?=
 =?utf-8?B?dmRZdFNVczdTS1Yya3c2eUhELzc1OWdOTDdJOVZwS3ZLOFlybjZYdFlhZEkx?=
 =?utf-8?B?M1FFWnZ2M0N6NTErMmtDTnNMZnArNzU0VHBWaHVieDBnaXJyN0pDeEIrbVBa?=
 =?utf-8?B?OTN3ajhrY1VvaEZ4RDVoUkRkRlhIcFNIWlU2dHkzNHJwQkd0Y1hvWlFFS0ti?=
 =?utf-8?B?TTBNcXc2NkN0WGVrN0NRNy85cUdlbFNYMVNvVndXcFBldjgwSm5jeUZuOHl1?=
 =?utf-8?B?RlEzZnpXL3prM2d4SzNDZG50SWpUWktuemdGVm9ZTVEzcHdWVmFVQTBKSnl4?=
 =?utf-8?B?Q2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eb210df1-a8a6-4281-f3ab-08de30e58b98
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 14:25:58.3238 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: leKCFr4kp6+ZBkW8xRNZbI9GRq1Us9Fy3gms8rmGmI3kQLW/Cxc5Ey8jEVPz6zYNHoQmad5mKMtRy49O+JNYoYD9jdy9+OcHfYyarXVGE+4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8119
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



On 12/1/2025 10:50 AM, Satyanarayana K V P wrote:
> Handle GuC response `XE_GUC_RESPONSE_VF_MIGRATED` as a special case in the
> VF post-migration recovery flow. When this error occurs, it indicates that
> a new migration was detected while the resource fixup process was still in
> progress. Instead of failing immediately, requeue the VF into the recovery
> path to allow proper handling of the new migration event.
> 
> This improves robustness of VF recovery in SR-IOV environments where
> migrations can overlap with resource fixup steps.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Tomasz Lis <tomasz.lis@intel.com>

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

