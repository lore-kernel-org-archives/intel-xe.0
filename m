Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA416C25B77
	for <intel-xe@archiver.kernel.org>; Mon, 20 May 2024 21:30:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7746C10E8E4;
	Mon, 20 May 2024 21:30:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nb8l2EWn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F298E10E99F
 for <intel-xe@lists.freedesktop.org>; Mon, 20 May 2024 21:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716240635; x=1747776635;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=gGEqFFlgGd8w0K/naRjwJrudwR4nKevyi4v12w7kGM4=;
 b=nb8l2EWnkSzE6CEuNa6wOC3017dM9kBJS6PdEBuouvqljR4UzSo9cXNm
 cwAYwI2HbwlIilT3kzzi8cQJlvRBUJY452uiWnfimqzUIuvlLqfnzu8ad
 OFW67/RVAVvbjt3dcDtkIpgCCIKcIZZ6U8h9LNajfKo90fUsd6oD81C3w
 0dOgtyLrBthxLdlNQD1rU1yRP2EATTiDlW3WgwOhlNYhYdodZigDyA65M
 3zIaX5F0CCBAywP1ctYDtrs2k9sRYUjjwHVu3T66SfETcHA0qE4mTETce
 MK29AsrOyob4cqfPUqmH2CYRG8Us4uhgiB6nI8tR+YVnu/13hWeJX1bUi w==;
X-CSE-ConnectionGUID: +12YQA7QTjSFZEA366pedw==
X-CSE-MsgGUID: O9fkyt1uT1i9Fv+cxPpQBA==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="12338972"
X-IronPort-AV: E=Sophos;i="6.08,176,1712646000"; d="scan'208";a="12338972"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2024 14:30:34 -0700
X-CSE-ConnectionGUID: alNIAKhySXaPx8YQHj5dvg==
X-CSE-MsgGUID: fmKqLy4CQyKwsV/mVOgr2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,176,1712646000"; d="scan'208";a="37204667"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 May 2024 14:30:35 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 20 May 2024 14:30:33 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 20 May 2024 14:30:33 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 20 May 2024 14:30:33 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 20 May 2024 14:30:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nP55OCCECPVruMWUi7/f8LoIx4kqAx8a4ECMeDMsG0fFvZhUAq6ZE0BMk4TJDN8/UpPNg1j10nxglYJUjtFTKmAs52p92mlht0AvwgNsHrI0SRS+fcDEAoSaRdQBz5QhqVFAlSc8gp6C3FUk+HUmR0gWgPqCdH0fwrnebycHXeyb+2RNjrV3/Jzb6/mqdrrVKi/Rc/7kcEqvi01U/Pt+KpFPBnXZbKoDmRyzV8kKKeIbIkS+JqYC7FQsVABG2Y1dOjwNcjLEunS+BoUzLyPMu/JBkyh4CViV1YsOPrqGlUrv5qy7jeOt9mbOcfbiT/d2uqlg6yxHTvMknYMjaimcvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C+87lohhY/SABPpJc/Wxbhj6ilTGv0mYq/kz2ijCBP0=;
 b=MD+upWJ7XENHLihhQHyXqUp/5SjsRyRdqBpDB3LFfW++pUmp0yxYA2rWZ1rXvWn798JS1tQeAmpLzQ4Tckgj0DnmVZvVMzuWIlEP7jdyeJ/8qIxYx37EM1AnrkyMRpCtszRuvqXJGfzPluGnxeGL92pIF1rD/gKwMYsA+XSGfmyQnKD2+KJV7uZ+2COuzXe2D/ALUDcJQiJyQ/najklyTmXz5kFrpc0Yl4/tBiJmLBGMJMj6CZIoNnngrwqk1L8zBM8z1Z4IHd6kUnPReVZ7GlTatLpqtN0uormK2Zzp2Mj0PQ9yYnwzgS3YCyxwdK04T2IR7A6mrVv01lMW9p2Gzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by IA1PR11MB7917.namprd11.prod.outlook.com (2603:10b6:208:3fe::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Mon, 20 May
 2024 21:30:30 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.7587.030; Mon, 20 May 2024
 21:30:30 +0000
Message-ID: <9139d5f4-c770-4157-bb59-0b2b2288701e@intel.com>
Date: Mon, 20 May 2024 14:30:28 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe/vf: Custom GuC initialization if VF
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20240520212330.2436-1-michal.wajdeczko@intel.com>
 <20240520212330.2436-3-michal.wajdeczko@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20240520212330.2436-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0374.namprd04.prod.outlook.com
 (2603:10b6:303:81::19) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|IA1PR11MB7917:EE_
X-MS-Office365-Filtering-Correlation-Id: 6172ac00-df96-4340-2f6c-08dc791412db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aVoweHNMajg4YWZFRGRjcjcxeGJhVHFXbm14dVJDaHZYdjRxOFNjcDJVUkRX?=
 =?utf-8?B?czhxekxXandvS1JTZzdCWmxUbVlqK1RCTEZRVjQ2MTVRbXdiKzh5MUhRVkhr?=
 =?utf-8?B?czVoWlNMS0YwbUtpTnVWcFMrNGlOZWdUcWNhRUNWeFlvYldPTnZPTzBUdEph?=
 =?utf-8?B?RVFyR1o0RDNIdlVnZUM2NEF5emNVc1NrblJzdkpQYXUrOGREOVBibWRud09Y?=
 =?utf-8?B?Vm9nOXI0UklJZVkxTC9LTUM4TWtTM0g3MmpnaWlMeTlObDZtakgxUFRmT210?=
 =?utf-8?B?WmI1RlZocEF3aFZHNFZ1K1A2WXRFN0FsV09XUnVxcFA5NjBwTmlBNGNMbGIv?=
 =?utf-8?B?Qnc3aU5rcHFYdXM0RWNRZEJ3SXJnalg4VFJBTlB1WXZiT2IwTEdOaHYyc3Fs?=
 =?utf-8?B?M3UxT0tGcGdmbis5THdNQnFZeUhzS2ZFUDZVZ1JXREVNVXYvVC9ucWJ1MEd0?=
 =?utf-8?B?NzBDeS8xQ0QxS2FSWnZDUlVJbmVCV2Y0OHNHRVJrSUtRaWw4UFF1UGhVeVdE?=
 =?utf-8?B?d21mdEduNmVvU2FCSXczdTgyTVpOdlVLQ0tYeUFpOUNoaGVmcWVWdHdjUFcy?=
 =?utf-8?B?YVA0dGxZLzd6YzJPRVNMaytBSUhROUhNNzl0QzZtaWRPVGgzT2JjOEg3RjZj?=
 =?utf-8?B?NzJDb0RYQTNsUVZSYlh1djAyaUh1TzAvYUtXWml4N01iU1h3cmxmQnlLazFO?=
 =?utf-8?B?UkxIbjlzdzVkbklKdVp3Sk1FbzBHRENxc1laZy9hOUk1VnpNdTI0QU1yemRL?=
 =?utf-8?B?aUJ3Wk1EQUlEZEZGM2ZKVmkwbWdHeFFFM1BxdXdvSFg1M05aWWpnRHlOWXpY?=
 =?utf-8?B?djM3QlJqbkw5ZTlDUDNQUEJQNTJGMlZYVktPZ0F5UVdHYVlhSTFnRVhMNHFj?=
 =?utf-8?B?V2tPRmhRK1JLODZBL3FQajIrNjdlNXRUVnpJeTVjQkFCQUtIdnNWNmpmYkh4?=
 =?utf-8?B?WG1HRGRyMmEyL0NoUnNTMHJrUUNRSmhPMm94SmZJRU1xditJWWpkaWdRNTAy?=
 =?utf-8?B?MDVRWEdveWUwdktFTGFubDhNN2xIRE1vaWhuTFVodUxuS2FHVm4xZGRHZU5V?=
 =?utf-8?B?OWZkcEtaYXhlRVV3bEcyTE03cWpzYlE5aFJORDh0aldRVjEyblJRMlFjZkVs?=
 =?utf-8?B?SVRqMmlGNDdFTGljSm5Dc2ZHRVMrVncvWDZMSGR0VnJZK0RpUmM0Z09tTENW?=
 =?utf-8?B?ZGJiYi9VMmJDTmZrRWJzZFJrcmx3Ly9YYUt5cWRvZy9ZYTJlK1dkSWZUbENx?=
 =?utf-8?B?NWFJWjBialR5ZjZzQXpLWThNeStFWnA0ZXE3bkxDei9RdCswUXhxMjh4QmFa?=
 =?utf-8?B?NEUyS2JDdG5OZ1EvTHZLT0pvTDAvTUM3dEVFK3l0aStyeFJKaW9UelpzQ1RE?=
 =?utf-8?B?YmI4WDJhNTZHUnpDUkpuQXdnRnkzZngwQTMyVXRUU2lJdDJvUVZmcUZUaFNu?=
 =?utf-8?B?UHNaZmRpVFduUjBnUFB6ME9SUEVRVkJSdXV3b28zVUpEWm4yL3I4TXo0OU5P?=
 =?utf-8?B?eW5WUTZGMjJ2SVNmUUFTT3E1NTZpQVU3TUovQmV0R0FUMERUbVRVWmpSc01G?=
 =?utf-8?B?RUIrbGdDOXJmczhWaEg1R0tHUm1KbUlLanN3Uzc0Ry9Ia1ZlZ1U3YVlJd01k?=
 =?utf-8?B?R1RieFg1Rm5Vbmh0YjBGcExZNldEVWVma29mUm90dU80MmJpZXZxS0RsNFBE?=
 =?utf-8?B?OFQyTEdwTWhGdjhYTko4T0xnc1BMZVlyZDVVc1BQYmdSSFRtY2RveVlBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z2txWGtpZFBVZmlYbDV5K1l6YmFXTVV3VUNwYzBpbzUvWW91dmNuQStnVHli?=
 =?utf-8?B?M0FRMEVrV1pmd2FJaVNtaU43T0h3ZFhpZ1A1VzN5V0ZvOVJIVHI3QWk4b29B?=
 =?utf-8?B?R1hzMWx2bkExTUIySkFycFNXU3FEL1JOV0FYMG9raGFkZEovT0FFUzE0WDlZ?=
 =?utf-8?B?L2pieUxhM0NUZStBemtLRHpkRnpMQXgxMTRYR0xYL3AzeTVSbFI4UmpEVDRo?=
 =?utf-8?B?SDNjU3JmUEpNcFAwOEtlUllYTVdUeHR6eTg3QjdIa2xxYS9OWDYvZ1NTdmY4?=
 =?utf-8?B?Nm1ydW8rdEZPaFB5L01BY2JsRVFSWjh1UFkyeTlKSk8vUkp2Qm45NVVKNHlB?=
 =?utf-8?B?UWpoN3FoeUkwdDB4MmorWFNzVGRPMlNkV3hQTjZ5SW5vdHM0QklMODVFRHhy?=
 =?utf-8?B?RlFLemUxYUtKMFhDaUNhQUpnUmt5WXc3OWNJQVVUTWVQZEx2NHNITjdhOFF4?=
 =?utf-8?B?eTVHcGttV0VzR09NSXl4R1oyOURSMVJhQkd5elBUc3lGc1R3LzJ2UFpNOUtn?=
 =?utf-8?B?ZUJ4YVl6RmpSOFFOUXEzeGQ1bzhyK2pxVmpkWFdyWU5VMWo5WTNOSWM1NHE3?=
 =?utf-8?B?Y21MZ3FYVGlJQ2w1R29MWTlLV1Q2NWtFRkZpaFNnVzk5RW9WL2YzZmVWRW5P?=
 =?utf-8?B?djVpRWZ2U0xiRDNsYnBDbTYwTkhmY3FFa2hWWjE2dU5SaVF5TW5RNzVRS0xG?=
 =?utf-8?B?QjdacGl5SGR1RXRjcnhDVTFiaGhjc1FaUzRvNC9maWVhWEw2L01MQVJHUnAy?=
 =?utf-8?B?anU2MUE1QU9NNzBKdlpnOE5QajJoRWlpS1J4eTQzNzdmMk5USXlvTUxXbWxM?=
 =?utf-8?B?S2JQNWpiNDJVVWpYZWFvVlczZnUrcGZ4dG1wWkFXSUxmM2pKZGNJZmNNWWxW?=
 =?utf-8?B?c0srYSsrQmpjMGJYd00xV3V5azU2L2FKS29pUzFVR1ZmOTRlNTFTWDRVMmU2?=
 =?utf-8?B?S3d2ZEkrK01US1VuVHV5OWpDWjFTWTZ5dW4wa3VHY3NrMWJuMVJ5UnJwdk9w?=
 =?utf-8?B?MUlPazNhejJteVZMM2dNVUpGVU5wTTRFS2VmRUtYT3YzQjRWaEFEVzFJdG95?=
 =?utf-8?B?aVRUQUJuN014MlV1cG16VVNRT1dXbktBMnhoRS96Ujg0dDhDSGE2SklRQlpD?=
 =?utf-8?B?SnFCU3J0WkJmeCtSelFzK1dNZGtVMGRLMTdwUDN2Qkw4eHBSKzFoaXJmWk1I?=
 =?utf-8?B?M1VITlRQVitGdkRCS2JjRVprbGdxayt1ZXoxOTY2ME54VStLNGZQaVQ2bmQy?=
 =?utf-8?B?dXhkZkJmbWFyc1FxWVpielNBWU9kRnpYWnRDeFFOclZZb1FMVFczRmtDK3dU?=
 =?utf-8?B?TmhlN1RYM2J0WXhVTktHOHM3ZjdJUlZxODkyb2JYVXk4RDFYdzl6NHBIOWN1?=
 =?utf-8?B?bzJIWjlQL3JUdm5jY1BlMXoyK3huTTQrRnFqVnlmU3UyRlN0bU1ncFNHKzVT?=
 =?utf-8?B?UUZvNlNnc1NMU1pTcmhvL01GVnhSSXd4TzZQSGJiRDArOGJJQWFjY1daRjU4?=
 =?utf-8?B?YmR4UjVVNU1HNFRCNmVyN01XaG04ZE41bEZkVGNpNW5BU3hnUUZ0d2pOVll1?=
 =?utf-8?B?c0lGUmczQ0lVNmRmNHpyYllDVkxhbTVocDVYRXpzdFM3VnYwNXBnaSt4U3JI?=
 =?utf-8?B?V1BtNUEvMnpHSm4vMW8wdlUrMDVZYWcrV1NUbCtzZnZUVStkWEs0QXU1Ky9V?=
 =?utf-8?B?M3hObmNlczY3UjZ0V1JFRFhIWHpZR2ptejNjOUJTNWdYRTRCZlQvcGtLYWU2?=
 =?utf-8?B?TFd0QVZCbFlsNzF2cTYvNjFrU2lKSG02Q0xJbFZvbWljczNmZUxSU1Vpck5O?=
 =?utf-8?B?YXZnemJZOHlhUDZEOFlvNzh2YUdINlB3YTNLbFFwMjE0bE1pYzNmWEFGR3V0?=
 =?utf-8?B?SVJlcmVDWUVWOVJvQndGclY3bGo2K0kvR0R0RlZuQXhWWFdaRjVsU1dIL014?=
 =?utf-8?B?Y29CSjhLMERkT09yVXBkOFY5eDBRYTczdGRad0ttbzJEREdXYkZOMno2RXdr?=
 =?utf-8?B?V1o4eTR4SWZMMDdsNVJJL1RPZFBoWDQxb0xXTnVUWHJVMGhIVm8zR2NNcFpW?=
 =?utf-8?B?QTRaTU5NN3Z1ZnRGOHVvc09sMkZvNmZZNm5rU3hKUXdxaG9TQlljNkozNTFP?=
 =?utf-8?B?RXNVSFpLQ2pFblV3K2wvUmFHMnNUc0NJZ0dXa2xnQWs5UjhJWTFmNEdtVUho?=
 =?utf-8?B?QVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6172ac00-df96-4340-2f6c-08dc791412db
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2024 21:30:30.3839 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l2bQgHCOQ0UKGTKEKcf4Kp32mBXS46Hsogy6VB7oxE7xeYgdLE3XCWw1SuAW94MBqrGDzKAyDwYgWsg0eNrn2uDq+Qc3flzL2zRa+8jqe1E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7917
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

On 5/20/2024 14:23, Michal Wajdeczko wrote:
> The GuC firmware is loaded and initialized by the PF driver. Make
> sure VF drivers only perform permitted operations. For submission
> initialization, use number of GuC context IDs from self config.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 17 ++++++++++++
>   drivers/gpu/drm/xe/xe_gt_sriov_vf.h |  2 ++
>   drivers/gpu/drm/xe/xe_guc.c         | 40 +++++++++++++++++++++++++++++
>   3 files changed, 59 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 378dde5ad4f9..bf4dfe301a71 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -408,6 +408,23 @@ int xe_gt_sriov_vf_query_config(struct xe_gt *gt)
>   	return 0;
>   }
>   
> +/**
> + * xe_gt_sriov_vf_guc_ids - VF GuC context IDs configuration.
> + * @gt: the &xe_gt
> + *
> + * This function is for VF use only.
> + *
> + * Return: number of GuC context IDs assigned to VF.
> + */
> +u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt)
> +{
> +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> +	xe_gt_assert(gt, gt->sriov.vf.guc_version.major || gt->sriov.vf.guc_version.major);
I may be going blind but this says 'X || X'? Is the second term supposed 
to say minor? Is there any need to check past the major version anyway? 
Xe does not support legacy GuCs from before VF version 1.0.0. So if 
major is zero, there is a problem.

John.

> +	xe_gt_assert(gt, gt->sriov.vf.self_config.num_ctxs);
> +
> +	return gt->sriov.vf.self_config.num_ctxs;
> +}
> +
>   static int relay_action_handshake(struct xe_gt *gt, u32 *major, u32 *minor)
>   {
>   	u32 request[VF2PF_HANDSHAKE_REQUEST_MSG_LEN] = {
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> index 997cb7541036..d6d37b193d17 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> @@ -16,6 +16,8 @@ int xe_gt_sriov_vf_query_config(struct xe_gt *gt);
>   int xe_gt_sriov_vf_connect(struct xe_gt *gt);
>   int xe_gt_sriov_vf_query_runtime(struct xe_gt *gt);
>   
> +u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt);
> +
>   void xe_gt_sriov_vf_print_config(struct xe_gt *gt, struct drm_printer *p);
>   void xe_gt_sriov_vf_print_runtime(struct xe_gt *gt, struct drm_printer *p);
>   void xe_gt_sriov_vf_print_version(struct xe_gt *gt, struct drm_printer *p);
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 807ad53449e4..cec709a908c3 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -295,6 +295,23 @@ static int xe_guc_realloc_post_hwconfig(struct xe_guc *guc)
>   	return 0;
>   }
>   
> +static int vf_guc_init(struct xe_guc *guc)
> +{
> +	int err;
> +
> +	xe_guc_comm_init_early(guc);
> +
> +	err = xe_guc_ct_init(&guc->ct);
> +	if (err)
> +		return err;
> +
> +	err = xe_guc_relay_init(&guc->relay);
> +	if (err)
> +		return err;
> +
> +	return 0;
> +}
> +
>   int xe_guc_init(struct xe_guc *guc)
>   {
>   	struct xe_device *xe = guc_to_xe(guc);
> @@ -309,6 +326,13 @@ int xe_guc_init(struct xe_guc *guc)
>   	if (!xe_uc_fw_is_enabled(&guc->fw))
>   		return 0;
>   
> +	if (IS_SRIOV_VF(xe)) {
> +		ret = vf_guc_init(guc);
> +		if (ret)
> +			goto out;
> +		return 0;
> +	}
> +
>   	ret = xe_guc_log_init(&guc->log);
>   	if (ret)
>   		goto out;
> @@ -342,6 +366,19 @@ int xe_guc_init(struct xe_guc *guc)
>   	return ret;
>   }
>   
> +static int vf_guc_init_post_hwconfig(struct xe_guc *guc)
> +{
> +	int err;
> +
> +	err = xe_guc_submit_init(guc, xe_gt_sriov_vf_guc_ids(guc_to_gt(guc)));
> +	if (err)
> +		return err;
> +
> +	/* XXX xe_guc_db_mgr_init not needed for now */
> +
> +	return 0;
> +}
> +
>   /**
>    * xe_guc_init_post_hwconfig - initialize GuC post hwconfig load
>    * @guc: The GuC object
> @@ -352,6 +389,9 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
>   {
>   	int ret;
>   
> +	if (IS_SRIOV_VF(guc_to_xe(guc)))
> +		return vf_guc_init_post_hwconfig(guc);
> +
>   	ret = xe_guc_realloc_post_hwconfig(guc);
>   	if (ret)
>   		return ret;

