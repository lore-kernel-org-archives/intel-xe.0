Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66967E9A02C
	for <intel-xe@archiver.kernel.org>; Wed, 18 Feb 2026 21:07:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2788210E5D1;
	Wed, 18 Feb 2026 21:07:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V3/Rhu6/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBBE910E61E
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Feb 2026 21:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771448862; x=1802984862;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=I/VaiC8kmXPS//CTUKoeqZsy0r18Sh1E0zl+xAU94IM=;
 b=V3/Rhu6/hzukuwBECVIHXLDA+ypyX2JlTA8SbCMVl0cFx70y+1KgDl50
 JjxSW0RFfIUJhoUgDKC/8zndldDm7pTEECN88Ee2o25k/JU68fPb8mjEv
 /WgsU4fzl845aF/wqzk77D9zCpVLGZ9GV3JNX9WdfdjNrebTFUeVuGECa
 6XTrWsg4xZWt89kvOI8dVYGVV0HkH5lRGTkLnJoQEme+pczvgQUm2HhTR
 2KN4G/3uv/SooOsTnC9G9gEnZt7cgdYTdKB9XQyaCmCJdtp6cDpl06UCk
 CoG6+30PIrO0AY9ekBsAa5oUoeA8sdQ1Y1T/Y0ZXpQWNj9+Dm0Bo0a49r Q==;
X-CSE-ConnectionGUID: 1Bt1v16WSZ21+JkA/gfsTw==
X-CSE-MsgGUID: KwXPvK72QOSxUYBBAjSgKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="83983356"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="83983356"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 13:07:42 -0800
X-CSE-ConnectionGUID: JbK7maTYTgypoKMDcN96QA==
X-CSE-MsgGUID: Fu3YeHROQLS9w+yHGldxJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="219324466"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 13:07:42 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 18 Feb 2026 13:07:40 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 18 Feb 2026 13:07:40 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.17) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 18 Feb 2026 13:07:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZivMzsD6tnAbl9CJuruxBt6nG49BiGhVWieFINGeDxyxiHsXD/JJ3nxxSTbHX8Q/2fOWE7sBKetwkTNtaDP7xe3gVOX8Ay7/UW8OUANMKAsTn569Hu2NFPn5saLsli5wpJy9nVX+QNGCS3bMpOw4x6lMKLG3O/o7daphp+Eh8QYiOykFory1RmcBVDYMxdN82Bj3BGoXQq8n4upV3MdzZybmDbQN817zNN60W7B8RVb83F+q1j600IqRa6KuoQV70K1n2h80rm9D/7Efbl6TEFjPWiPGcPouuUzOF2E85XL8jBoAGdNZxsQajaACX2Huo9uXJncijJEyKImCQiPkvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v2FfPe8jTRByDSDotL9O6IYCyq/z4zPkogjz93YCZMg=;
 b=Fi3VHmsEjzU63Vdgkohnu6a3rG+uIXs5aA/UEkEjoTBjOMdJouFG4OdMnVrMQFIlitViBS2qHZsF5g/nYKFFmDkZXhNgAxdyE8GO33RonKwYh1ofFm0kqm7iHsK0/V1x/S7xKhwJqYj7gy+ADJP2/R7qRyOjh/kk0+xM4hoIqz+o0C/WCk9iwmnTgyGlULJOLqEZz5u8m9jGgQJvez/WFZfuep5k/ji78OyJ6/aH6e07zJmkn2uPu6EyzxuemrPnlIrEbjNWx+uAJcSMArOi3GdOKY94TBw0nn0I4twT0Rj3UBXcf4Z9XBOnf8Byqr1WcDhDnhNH7XYCjxUyKbYegw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by MW6PR11MB8392.namprd11.prod.outlook.com (2603:10b6:303:23a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Wed, 18 Feb
 2026 21:07:36 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 21:07:36 +0000
Date: Wed, 18 Feb 2026 16:07:33 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 3/9] drm/xe/pf: Allow to change VFs VRAM quota using sysfs
Message-ID: <aZYqFaKm4Ia6gEFw@intel.com>
References: <20260215203323.595-1-michal.wajdeczko@intel.com>
 <20260215203323.595-4-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260215203323.595-4-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BYAPR08CA0008.namprd08.prod.outlook.com
 (2603:10b6:a03:100::21) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|MW6PR11MB8392:EE_
X-MS-Office365-Filtering-Correlation-Id: 85ec84a4-b9d3-43ed-e7db-08de6f31bdf0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K3V6NEZhNXVjWEpuZEswbFZYL3JQUm5NNTBqKzM1MUdmQ2ZIanM5NDVsQVVl?=
 =?utf-8?B?eSs0YzJBWThpbXJHNlN4QjN5ZXVSSmVLamllRVI5RFp5K01Kdzlkc3NtTkxj?=
 =?utf-8?B?ajV1MktMNGRJa1lzVEdSc0IyR1piUndTSVdndCt6QmNEN2VtKysxNUFRdURi?=
 =?utf-8?B?TzROallxNWdJOTRCcUxSeVZnUko1VzBWdi93bWY3K3Y5d2tvQU5HQzIvUmdo?=
 =?utf-8?B?UCtvSm9PYUVub01rV3UzUVl0Wk1nSzFDdWNjRXVwTEdKQ2lmTXJydjJTaVJq?=
 =?utf-8?B?OHE5Q3NDN1JXbUQxZHlxc0txQUJjTnhNUE52UFRUUzVrUGcrM1ZSb285QW9J?=
 =?utf-8?B?a3B1OVd0Z3JrQkg3a3pQUGpTTWdUTHo0VlVQUFZDTVdVaVdiMXhST1JGdmFV?=
 =?utf-8?B?VWxCUzk5R1VNSWdUL3JGTFlGWFk5NDZyQmNUK1VOa0tYbUFBN2VTZjJkRmVW?=
 =?utf-8?B?TFdDaVpXaG5yVlhaaGpjU1ZrOEhnY0Z4bllYSWMyUG1NODdpL0NqWEZNL1lG?=
 =?utf-8?B?aGJKOEMvMENVWVFwVmMxN3hYMWNZQW1FTTZydjNXNXlnMW94Nm5ZdDBqdnM0?=
 =?utf-8?B?VVZBQ0xwQXJKcG1nZ1l2MEYzUGdmaC8yTXlvWmJPZFlidDRTdTdxWTViNU5z?=
 =?utf-8?B?TkpxclBpc0Z2d2pTNGZtazJtVjZ3UEcxUWtjcEE2cHpjTStSSzFtY0hrenV0?=
 =?utf-8?B?eHFJV0lUaEFjRDQ1YlBuZ3F3TlhLVk1rcWwvN2xXdjY0WUdTbXJBa2l6Qnhr?=
 =?utf-8?B?U29Gbmt2NUhNSXRPUVgyTEx3NVJ6WURCdHg4Ymkwc0JFcFpJbmg1YU9lVEhL?=
 =?utf-8?B?SjF4WlltQTAxMG1waEJvRFlsTHpqL0JKRWwzbTFWYUV4R1ZBdFZuSk5QZ1FC?=
 =?utf-8?B?c2NibGNUOFdpZURvYm4wK1VKUzFlMWtIR0VXU0daRWZ1bmd2ZVp4Yk5JbE0y?=
 =?utf-8?B?SFlYUzFVbG9rL1ZoaGFtTDNJTmt0aDd3aFBPV0R1dVkrSFhpWmlYbFFjVmlq?=
 =?utf-8?B?bWRjT0dYeEhyNUtsMDhXc0FuZU92U2dMVk1CU1RueTNRMHRGdktDVDdIajdi?=
 =?utf-8?B?RUxpRWw2R1UyT0ppQm93STk0WmlMWXAzb0xDUUhFcVlCQ1dMYk5vdG50ZkZX?=
 =?utf-8?B?R1F0MzU5NHFaTDJIUWdDeUFzZ1BRZWxPbmM5OVJRRVh3VE9tRm92c0VidDBq?=
 =?utf-8?B?TXl5S1FuMVBqQzdpcFBaaHgraTlpUnhMdXVsVWRLNzNpVVZGREEydGVuZWow?=
 =?utf-8?B?OVdNZ2N1ajhtOHpQNGdWV1NJRGcrSVl0TnVwU3loYmJOVGYwYWMwQzYyMzh3?=
 =?utf-8?B?Y0Z1WkVzeU9kZnp6U2hacHF3VU13aHAvMFpzb2RwdlE5VFhCQWdNVmxvTzlm?=
 =?utf-8?B?L3NtSXlLWU9qQ1p6cGk4eUQzTFl0M3VueW0wd3pVZklsKzY3Z2JsRjhUVzA2?=
 =?utf-8?B?Vy9kZnkrYVVXSU1qZFROcXBYNzhOODFCdDVKZGpJdjR3NS9EcWgxdUZ5TUxH?=
 =?utf-8?B?ZHNMWkpWWVI2WjZSMXVxUGRUQWZUdFJ4WGNuOUlYbWJSdlpyMFRqcFg5RzVy?=
 =?utf-8?B?RThYeWZrZngwdjdRcGZKcXhrQ1N4TXZRZmZDbFo1R1lwbzc5cGlJL3RyeXRi?=
 =?utf-8?B?MUgwdFVndDJzTjFJU1lUaEwrNGM2M2ZESElUYnVNNDNEbUExUDFJY1d3WURs?=
 =?utf-8?B?aDU5QzRGbVhkZEFZQ1BRL3o2d28vWGhZYyt5ZEhraUVoblZHQ2V1UGtoc1pS?=
 =?utf-8?B?TFRQckNYcUxMaFFSdzRIUHdmVWhVSUxtaXhjRENHTitoVGJyb3JUdnd5Nitp?=
 =?utf-8?B?OStBM3dkdXdTb3VmQ0RHUzlQQUJBQ05jOXUvVy9XRXd2anZPR2dKMGZwem13?=
 =?utf-8?B?dS9QdTk0Qy90WHRGR0xLM1dBbjNuM3dFb2RoLzJqNEtNUnRMV3VLRTBlTkxm?=
 =?utf-8?B?UHlSN3NBWmRlbVBUNFBISG1WRW54TFlLQWdSZ1RZSmxWaXlKYUZOSHZEc3E4?=
 =?utf-8?B?Mm9jdFVuMDFuRmpFVlo0NUtDdk9hdkVxZlVYNG5UcVc4Wlo4dnFzd0tHUXlk?=
 =?utf-8?B?Vll6NS9POE5WVnIyc05TNDhxc055WEZuMDlzOWtTeHEyR2MzSlIxNHhEQzNu?=
 =?utf-8?Q?tJZU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NmdEV0xtOWx4MTI4U1E3STNrUVlJRUMxV25mVEIyeWVIZHVaZCtPZ3Q4K0Zj?=
 =?utf-8?B?N1ZsVExlMVdUZmxqeTR5cGZuYWRsL0wwVFJSbCsveDVNQzlzYzZuOFpsQXlW?=
 =?utf-8?B?WWIwMW1Va3lzMFNBK3FxQ2cvaU16WWhvTmhTbVBPNGVMcWIvL1hKTXVEZ0x5?=
 =?utf-8?B?emxyaUVCWGNaWEJNbkY1c0VwZ1FKR29zSnFncTdkbmQ5NjJ2RHdPNVdJSWE0?=
 =?utf-8?B?MzMxbmFHZGtYRWZiSlN5MHBOMjA2ZFBVNU9RMW1jSUdtbG5XQjBwZDRwcnpS?=
 =?utf-8?B?b1dncmxxMkdvTjgxdDhnSThvV2V5T2diWFkzS2RZQUNlZ1pXUmEybHFiSTha?=
 =?utf-8?B?MzhqV0pwcnBTK0VYU2NvTVVZcWZBZVFIUGVURWE3ZU5TSXRDRDRCcHN4Tm4x?=
 =?utf-8?B?alEvY2FNeEQvSURhbUtPOEl6MmQ4ZEVoNDlNaGNVQmhweElSV3dsb3hLL001?=
 =?utf-8?B?TlBsU1dCVjREaGhiN0hzNFFDU0JHNjZFZWhEQlVBUHptRVplc2NoaFMrV0Vm?=
 =?utf-8?B?NjZSZVA1U2ZsYkNRa29PRTBQWVRSZTA0N2doTmF0WS9PUVpYdGR5bUUwcjBG?=
 =?utf-8?B?Z1VqaXdsdFdXOFNuWTRQcDIzMEF1OG0wdlcyVnVqdEpyK0hlcFNQZ3l5a0lB?=
 =?utf-8?B?UXNiMERkSk03NklNSUNxRXVsUUZJUDd1dW1FR3FkVXJTTi9IMTliUVVPMGFv?=
 =?utf-8?B?UDNDK1V2dUpwckdlKzBNaWp6U2x2T3UzYXdldmsyYnA2RTVSMEFZSHJDbFJr?=
 =?utf-8?B?QjhFVkJ1K2hRbFNRZWZmdVJBdXRxYVc2bXJnc2pXOGZ0WjNPUVB0QXBZdWsx?=
 =?utf-8?B?UHU4SExRWjFTU3ZrVkk1R01FQ0ZrdXFYWEg5VGt6YXJxWjN6dlcwNENLenZG?=
 =?utf-8?B?eHFnaXNuMHlqQmhWWHRCdCtxc1dkRDdIeGRtL0lqSXpXWU16elNzKzUyOTlW?=
 =?utf-8?B?VEVWbE85a0E0eW5SUVB4bFQrbk4wSXJvWldWUy9HTTJ4ODdIQkhTTVFyTkRs?=
 =?utf-8?B?ZmdTOEkyZHluSDdQdjJCQjdsdUFsdGtPY1dBMlNzRSs0Y2NxNWZKRWJDUklQ?=
 =?utf-8?B?YmF3UXFJVEczb1AwbGlhWGtYOWtoTWUyTVhGZGxDRnlWNmRjcWNpU2FHL3dS?=
 =?utf-8?B?cUdaSzFaOUt6R2tKZ21XbTVKSkJ5ZGIzMWo4SWF2UWl3V0laN2t2aExaclRV?=
 =?utf-8?B?ZGNBdTdnSit6VVVlOWV2ME4waGI0SkU2UUtZbmRHM1FiU3RNTHFIZmJkQzls?=
 =?utf-8?B?T1RvcUo2MTZ3Y2pkb3RwNXk3L0wzdzFDbG9iUk9PV1RMalBvUGhxbjlwRHNC?=
 =?utf-8?B?UGh4ZlVSQkE3cmk2cHJ2N2RMRVlHVkFkdlpUZk1aQmsyVVNCRkhqNXZuL2xM?=
 =?utf-8?B?SDRudkN3dkk1TWo0bmxjVUdzUHpwdHdaeFMvSE5iY0I5WlNwWkZDRno3QlVr?=
 =?utf-8?B?aUk2a09EdFlnMmNic1RNTlBuTHpaLzFxTWFOa0xkdTN2S0pMY0krbml5Y25i?=
 =?utf-8?B?TlRrc2ZlZkFOdTlBM29OMnR0ZkFRa3lsNnFjVURmb2VXN0xyQnpBSnJxcC9R?=
 =?utf-8?B?ZGVoa0dGT09OWjFPVmNWZ0dleW1ONlBzV0JVa1ExbWx4cWtGRHh2cGFQOStZ?=
 =?utf-8?B?b2prUU5EWEt0aXowUkx4QXJlei96bHdoTEdtTC90Nm4xbi84WkU4bzRLNXdX?=
 =?utf-8?B?VUxGNWZtMXdqTHJ0WU5zcGNvNnpFemU3V3pDQ1A4ZHUzVTNFN0x5YzgrZW9C?=
 =?utf-8?B?L0YyR1Erajl5eEsxcmdRN1Jrc21hcVJ3MU1SY21VRFB1ZGlaL3dDdjNQUmFw?=
 =?utf-8?B?UmJwTWk3c01xMjM2UXlVWlRGbUFWSFBldi9OUWFxRUJQY3BwVnM5YWZqSVBG?=
 =?utf-8?B?NURoUTlYRVFOaW1wR3o4SXhBVkxVZkdqbFp0M2pScjRDYVk0dEtIbmU1alRJ?=
 =?utf-8?B?dlBqQnFwb1VicndzY0hkOG5tMVlmYzAvejI3WFg2QTlyczRoUGN2ODYxR0Fn?=
 =?utf-8?B?OHdSbjFnRllOVktwN2VRVXREODNKMDZqZ00xditwb3AzNHNyNlY0Z0E1MXdz?=
 =?utf-8?B?NUh1K2pUejdmcmZsd3BSNjhTbEl0TlQzYXlVV3VTWlJyV2E2bnhnSTFlS3BX?=
 =?utf-8?B?QzBzVmlxZ2t2WUxtaWVUTnFOZ1B1aG5zSTdWb1JoNC9JcE93YTFxVlNoTllT?=
 =?utf-8?B?YXNrdUpwUi8vZGkzVmx0Yzg1YjJZY0Y0a0JKVHJ2K0cvU3dzZFArYTlzZGY3?=
 =?utf-8?B?R08zS1k4dFRrWk5VWEZFdUtVU1JhSDdwYlFDZVptL29uVlhzNlV5VkF4aUZU?=
 =?utf-8?B?Vk95Q25FbTdOdFg4SkU4dm41Qk9kSWExd0hSZ29ZZS91QmxyNE5KQT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 85ec84a4-b9d3-43ed-e7db-08de6f31bdf0
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 21:07:36.6358 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t4A3zgxTGFSA4hS/Bk9N9aDEUFuS5cKbYfljGGGS8d0L4guJr5sPM7ENaoklmzvxFkOnzELkbJKhctTMvuDxgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8392
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

On Sun, Feb 15, 2026 at 09:33:17PM +0100, Michal Wajdeczko wrote:
> On current discrete platforms, PF will provision all VFs with a fair
> amount of the VRAM (LMEM) during VFs enabling. However, in some cases
> this automatic VRAM provisioning might be either non-reproducible or
> sub-optimal. This could break VF's migration or impact performance.
> 
> Expose per-VF VRAM quota read-write sysfs attributes to allow admin
> change default VRAM provisioning performed by the PF.
> 
>  /sys/bus/pci/drivers/xe/BDF/
>  ├── sriov_admin/
>      ├── .bulk_profile
>      │   └── vram_quota                 [RW] unsigned integer
>      ├── vf1/
>      │   └── profile
>      │       └── vram_quota             [RW] unsigned integer
>      ├── vf2/
>      │   └── profile
>      │       └── vram_quota             [RW] unsigned integer
> 

Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> Above values represent total provisioned VRAM from all tiles where
> VFs were assigned, and currently it's from all tiles always.
> 
> Note that changing VRAM provisioning is only possible when VF is
> not running, otherwise GuC will complain. To make sure that given
> VF is idle, triggering VF FLR might be needed.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c | 26 ++++++++++++++++++++++++--
>  1 file changed, 24 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c b/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
> index 82a1055985ba..09deda2fd8b2 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
> @@ -44,7 +44,8 @@ static int emit_choice(char *buf, int choice, const char * const *array, size_t
>   *     ├── .bulk_profile
>   *     │   ├── exec_quantum_ms
>   *     │   ├── preempt_timeout_us
> - *     │   └── sched_priority
> + *     │   ├── sched_priority
> + *     │   └── vram_quota
>   *     ├── pf/
>   *     │   ├── ...
>   *     │   ├── device -> ../../../BDF
> @@ -59,7 +60,8 @@ static int emit_choice(char *buf, int choice, const char * const *array, size_t
>   *     │   └── profile
>   *     │       ├── exec_quantum_ms
>   *     │       ├── preempt_timeout_us
> - *     │       └── sched_priority
> + *     │       ├── sched_priority
> + *     │       └── vram_quota
>   *     ├── vf2/
>   *     :
>   *     └── vfN/
> @@ -132,6 +134,7 @@ static XE_SRIOV_DEV_ATTR_WO(NAME)
>  
>  DEFINE_SIMPLE_BULK_PROVISIONING_SRIOV_DEV_ATTR_WO(exec_quantum_ms, eq, u32);
>  DEFINE_SIMPLE_BULK_PROVISIONING_SRIOV_DEV_ATTR_WO(preempt_timeout_us, pt, u32);
> +DEFINE_SIMPLE_BULK_PROVISIONING_SRIOV_DEV_ATTR_WO(vram_quota, vram, u64);
>  
>  static const char * const sched_priority_names[] = {
>  	[GUC_SCHED_PRIORITY_LOW] = "low",
> @@ -181,12 +184,25 @@ static struct attribute *bulk_profile_dev_attrs[] = {
>  	&xe_sriov_dev_attr_exec_quantum_ms.attr,
>  	&xe_sriov_dev_attr_preempt_timeout_us.attr,
>  	&xe_sriov_dev_attr_sched_priority.attr,
> +	&xe_sriov_dev_attr_vram_quota.attr,
>  	NULL
>  };
>  
> +static umode_t profile_dev_attr_is_visible(struct kobject *kobj,
> +					   struct attribute *attr, int index)
> +{
> +	struct xe_sriov_kobj *vkobj = to_xe_sriov_kobj(kobj);
> +
> +	if (attr == &xe_sriov_dev_attr_vram_quota.attr && !IS_DGFX(vkobj->xe))
> +		return 0;
> +
> +	return attr->mode;
> +}
> +
>  static const struct attribute_group bulk_profile_dev_attr_group = {
>  	.name = ".bulk_profile",
>  	.attrs = bulk_profile_dev_attrs,
> +	.is_visible = profile_dev_attr_is_visible,
>  };
>  
>  static const struct attribute_group *xe_sriov_dev_attr_groups[] = {
> @@ -228,6 +244,7 @@ static XE_SRIOV_VF_ATTR(NAME)
>  
>  DEFINE_SIMPLE_PROVISIONING_SRIOV_VF_ATTR(exec_quantum_ms, eq, u32, "%u\n");
>  DEFINE_SIMPLE_PROVISIONING_SRIOV_VF_ATTR(preempt_timeout_us, pt, u32, "%u\n");
> +DEFINE_SIMPLE_PROVISIONING_SRIOV_VF_ATTR(vram_quota, vram, u64, "%llu\n");
>  
>  static ssize_t xe_sriov_vf_attr_sched_priority_show(struct xe_device *xe, unsigned int vfid,
>  						    char *buf)
> @@ -274,6 +291,7 @@ static struct attribute *profile_vf_attrs[] = {
>  	&xe_sriov_vf_attr_exec_quantum_ms.attr,
>  	&xe_sriov_vf_attr_preempt_timeout_us.attr,
>  	&xe_sriov_vf_attr_sched_priority.attr,
> +	&xe_sriov_vf_attr_vram_quota.attr,
>  	NULL
>  };
>  
> @@ -286,6 +304,10 @@ static umode_t profile_vf_attr_is_visible(struct kobject *kobj,
>  	    !sched_priority_change_allowed(vkobj->vfid))
>  		return attr->mode & 0444;
>  
> +	if (attr == &xe_sriov_vf_attr_vram_quota.attr &&
> +	    (!IS_DGFX(vkobj->xe) || vkobj->vfid == PFID))
> +		return 0;
> +
>  	return attr->mode;
>  }
>  
> -- 
> 2.47.1
> 
