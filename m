Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05A73C27C4F
	for <intel-xe@archiver.kernel.org>; Fri, 31 May 2024 20:08:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 045C910E2A1;
	Fri, 31 May 2024 20:08:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Phw+NER9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FF8610E4B1
 for <intel-xe@lists.freedesktop.org>; Fri, 31 May 2024 20:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717186087; x=1748722087;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=kUcuiftV4KWyHEwF2N7vnPMmiF+lT8bL+7//T8/xFck=;
 b=Phw+NER9B4vnDtQtuVuFYxkTeAhP3fv8iFhjvEY/qXllw1m5nZsIK3dY
 neX5HpG7WZbEeTrMF0vi31HN1zpSu0KCS9VnGu86/FSX43tCosIQUxw0+
 qSj1KoTKC+lFdvzUUmOpEUFUpET5RSIbNIMHNwAxwU+1ihLS+VdvJk/KQ
 Q4Pu+x+HsETQTnTbl9+jKijuKMVm/Qib1HMcXSE2XerSf4Y+0mDkj2gkE
 tUcSD0SCTD+QM/Tt7HDpfCla2hg5mI0ogfx2r0iwe6EBO8OuBHc5ZRDN2
 +EB7UabqiAYFWc8r4crJ2hXh/jpr+pGPYl/UfwCJXHSeOL6Q/tWopwIx/ w==;
X-CSE-ConnectionGUID: hwfFmEzIRrG7boqSdoGbWA==
X-CSE-MsgGUID: yK1fFxmiRKa8ia6a76CUHA==
X-IronPort-AV: E=McAfee;i="6600,9927,11089"; a="17574902"
X-IronPort-AV: E=Sophos;i="6.08,205,1712646000"; d="scan'208";a="17574902"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2024 13:08:07 -0700
X-CSE-ConnectionGUID: 6XXcWA6QTAec/kcLDQzZRA==
X-CSE-MsgGUID: EIsQTQdvSeyNYjNhYMLoog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,205,1712646000"; d="scan'208";a="73744114"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 May 2024 13:08:07 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 31 May 2024 13:08:06 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 31 May 2024 13:08:06 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 31 May 2024 13:08:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kGhGdMl0bhAxcpQtET1Yliqf4+sOpLy1A8m1K6eUHthYGdPNuIgfAG3hlLnjIO/DW2OgXzcwzlYfKF8IevhfVwvk1Lm7zy5udSMapIIyDPunT+2fOo9c31xg7nKJRE1vgz0k2UGyvl+zxfAxusID6BpEj0Lpv9UHR/oddfH1Na4up5m3LIlj7Tdguu4QPDqHW1QL0xG4EpmV4qJb34yA9XKLUaKd5IWA2/zWMV2pjJjDLgaEv9rphYShcDtINnl1nCodtMAOr/wWH49ApG1ScFyDGy34cG6GJkC8zplxcmuXC42P6EpNHSFnexJscCS1NPH5CVpYFVCKVxqHlva8kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ioqCmGeiqVAJeP3GcmVbBDvwZTqYzzaMRsr+A7IHs4=;
 b=lzNb7qvjObONnxTLIx77IQRZEBHBfECfc3a6uXGOVRs2idX26W0j9dBBNvaV/4GgOE2UuF0xZ/FqpG/ZZ2UwmpST6N/6n0jgv7S2NCXeRQTSC7SKwLmOZ9ihc26mQY/1dFNh1QQomjF86jJH9YQB/6RwnKOtP7apEcXvE6Hhy2rgdqGHqcRYBhG9en+/yk9NUDf5inMrgeGnW8W67R5bzAsrPrcTWrLOHXIaY4kJ3+gPfb8s/Ysqb0oE11p3KU3Ge1eRLwgJXfaspsyEO4FFKUcv0piD4i2ohBp6RWG7q5bLlBTCbnSwxfwDuADUacN0x7QkYHTIUgnWjqJS0zNftg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB8280.namprd11.prod.outlook.com (2603:10b6:806:25d::21)
 by MW4PR11MB5773.namprd11.prod.outlook.com (2603:10b6:303:180::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.22; Fri, 31 May
 2024 20:08:04 +0000
Received: from SA1PR11MB8280.namprd11.prod.outlook.com
 ([fe80::13a:4240:8d73:3c88]) by SA1PR11MB8280.namprd11.prod.outlook.com
 ([fe80::13a:4240:8d73:3c88%5]) with mapi id 15.20.7611.025; Fri, 31 May 2024
 20:08:04 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240530151313.2284182-4-radhakrishna.sripada@intel.com>
References: <20240530151313.2284182-1-radhakrishna.sripada@intel.com>
 <20240530151313.2284182-4-radhakrishna.sripada@intel.com>
Subject: Re: [PATCH v3 3/6] drm/xe/trace: Print device_id in xe_trace_bo events
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <lucas.demarchi@intel.com>, Radhakrishna Sripada
 <radhakrishna.sripada@intel.com>, Ville =?utf-8?b?U3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>
To: Radhakrishna Sripada <radhakrishna.sripada@intel.com>,
 <intel-xe@lists.freedesktop.org>
Date: Fri, 31 May 2024 17:07:58 -0300
Message-ID: <171718607801.268111.4878138619215194582@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: SJ0PR05CA0039.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::14) To SA1PR11MB8280.namprd11.prod.outlook.com
 (2603:10b6:806:25d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB8280:EE_|MW4PR11MB5773:EE_
X-MS-Office365-Filtering-Correlation-Id: e65cc2a6-6b21-4ef2-97ff-08dc81ad612b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NC9HWEpzQUFDdUpxQ3gxT2pnaGVZQktINXFBQjBxUDVJWTVVejhBS3g4T0tT?=
 =?utf-8?B?UDR6YlhuTXNjRExyK2NBbHZMQW9XTzdhb2M1YkR4eTlHZ0VQUCtvWDNGY1VW?=
 =?utf-8?B?bFNsTDhYaXZMWG1rWXhUSHVxdXEvbktkd2xCc3dUMmN2UjNYMEFXc2JSeEcy?=
 =?utf-8?B?bkRERDU5V2ZhVy8rRm53Ym1Wd0lyOTcxaHpiNWpLVW56TUhjVzM0RjVPZGlM?=
 =?utf-8?B?cENaRHlNd2YrczJZWisyUlBySnpRWGpRbFVMYmF4TEp6MW1xUFZnVzJjZm4w?=
 =?utf-8?B?cnFmMnF4VWk3R1JCckVwczYzT1k0anBCRzNmRHlZQXJNOTVtYWFPeEVGeW9u?=
 =?utf-8?B?MVBQZEYxekp3clZ0QzBCNGtMTnhCeEJNQVBMbk1GZ0tndG1IRUxHSFNsNHBv?=
 =?utf-8?B?cTlQUFRTYnB1WXkrbVRFS1JkYnpjMlBhRFhMQkp1YzZLaVl0eUlrNllMRFdi?=
 =?utf-8?B?WFJyaXBmMlladnNVTlJVV3B3Q1B4LzlNODhOb20venVNaGY5Znpqb3luRVlY?=
 =?utf-8?B?Y016VXRLZEtKUEZpcGVxeTQ1TWVrd1huazFYcFhZQlRNMDVlV1BRT3NLOVdL?=
 =?utf-8?B?M3U0YjBGMUh3NGhobVgwcFJXTmh0THhKQlgwSlNwc1JKZ0EwOTQrQjM1TE4z?=
 =?utf-8?B?bUJwZ2NCK2syWWNGNFFQTDlCL3JwdDNXTFdEenNZMzJvV0JrZkxmbkVuRlN1?=
 =?utf-8?B?NmNyVGtRUUZHZUxERWlnYTRNUmx1MW1CcEJyWlgwS0hML3R6eTc5M2ZMMHF4?=
 =?utf-8?B?Z3NpTml5eFFmY2srYjNGR1pwZmxWcWljeXpmblZSc2lYVDJVTzlTZDZrSTBD?=
 =?utf-8?B?NEZaUmZTSko5VGQ5dzk1b3BGcjNtVThjazFhVXBWQndXY3ZtZWpRVWVkZ0Rn?=
 =?utf-8?B?NFM1dGk4UEsrN3Ztc0dmUzB2Tnh0TVVkelFWZDJxYkVJalZlVDlleEdWVW9t?=
 =?utf-8?B?VVM5Vi9JUE1RUGJ4Rmx1d0xoeGR4NDh5MFB6OEkraUQ3TlpTb1RHeFFCa0kx?=
 =?utf-8?B?ZEhRMWpSK2ZkR0t4Y3BqemROaEJ4OWdQaU14cnlkenk1TklZRmFhMmNOMjZy?=
 =?utf-8?B?eEFIdzhmM3M4K0dlUEZXcFVsZUJQeU8xUFJpaDBXaXRMZjdUOERqYWc4dWdV?=
 =?utf-8?B?WG9aMmZuZDA4eUg5SmNEOXFHZm9kbEVEa0U2Yk03aTBaaGhDbEY1RTdyMk9j?=
 =?utf-8?B?OXNKdW8yS2g4dnhMUTBlV0I0b2Z4S1FiNVNuQUxKcVlia0pVUGxuQStSbEJH?=
 =?utf-8?B?MSs0OTU5Mnd5M3hrTHl1SXQxSEw1N1MwNnVPVHJLQklLY0NuU1MrWE5LUTJh?=
 =?utf-8?B?T1ZnN202R1ZodURMSmY5RkZDd01BUzdRdDFNWjJzNUlSWDNUV0FRcFh5NHVr?=
 =?utf-8?B?WG13RHhQY2RSaC82MWRwa05mcVlIek4yaUhBTHAyTHVJTmcrNHlzQzZIRURm?=
 =?utf-8?B?OG1zdjVUeFNnZVFXRmJPT21EMXVTZ1UwNzkvTU9lL2lnaHNNcGg2NmdRQWxh?=
 =?utf-8?B?ZVVYcTRCRVBDYXdQRmZGWFg2QWE4V2cwSHU2SFNLYURqZWZwTEx6NDEyNldY?=
 =?utf-8?B?emJyYXlFVGkrYlQxaVQwL3Y2YkxBMmRFTE43U2VCZ3dZbU13ZnFEV2xGZmVk?=
 =?utf-8?B?OEJ0RlVZcUV1SmRXZG52NE9xOEFySCtNTHVDaTFGTXlMVVdCMWlmU2pBSU01?=
 =?utf-8?B?UUI0UDQ4UlByRWxBbDBXMldnT3puUnM3M1ZHWVlkbUZ4U05OTjU5NXhRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB8280.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Slo5SThIdlE0U2pYazdKaFYxLzNDQ094QWRqK2FaLzJpZS9hSy9Za0dXZUxN?=
 =?utf-8?B?UU5TUGlPV0poalJrLythK040aUZlMENISDUzcFlnR3dCZ1huUkNHQ21ISVJS?=
 =?utf-8?B?U3BGNzVSRlZJRVNweDhFMXVkUjF5TlphaXVwM3RySXNodklyaVc1bFg0SmU0?=
 =?utf-8?B?eGQvNUNwMHVLSVpFWk9rNzdPOUJSaFlibWJFbGNVSWV2V2w5TXRoaGl0VWRM?=
 =?utf-8?B?djc4R2RTYVl1c3M3aEsvQlpYQzZlbExOeENBRjM0aEVkVkd1anlPQlRVbldO?=
 =?utf-8?B?dDlsSnNxVC9aVmF4RSszZ2Z0cjhxMjNJSTRFWWZRa2hSc0tUa1BrYnJpdVd3?=
 =?utf-8?B?Smd4b25aN2Y0STZ4L0dOVzk4eUQ2ZGR3UzYzMTFxR0Q3YUZBUVJsVWpOeXdn?=
 =?utf-8?B?emlmRDVvRTAvRXNGME9COWhsQm1ENDM0TWc5ZTlraUpIRVNpSzM1VlczNkZK?=
 =?utf-8?B?RmN3dVdDUVhTd1BqaE1UNiswa3VaZWtLaUV3cnNQZGl4Mk43WHUxOXdKQnVa?=
 =?utf-8?B?NDFQendXUTNCNU5HWnIxdlREOXBOeEF3WFgwVFBWQ2x5a1hZVzdLbTRFTWNI?=
 =?utf-8?B?TkJ1Q01ldzhRRE5qQk1MajVMSlhnaFNBNlluZ0hZUm95UTB0OWJpcUJCeEVU?=
 =?utf-8?B?UFpuR2tDTWd1L3ZUZTZkL2RxWGVGQ0k0d0VSVlozejBvb3pwSkpJcmdEdm9x?=
 =?utf-8?B?MzVGbEZpcnExTlVKakdCLytlWUk4d0J1cXF1UFNJTlBBQ1ZBWkRXK0FnamIw?=
 =?utf-8?B?V3dwTElHVkc0MUNiSnArUGlaRFc2NHJKdnJGOWxrWUVzV0kzQ2hwSE1vQlAz?=
 =?utf-8?B?QlUvSkZMTU9peGNmeWdXdnZzM0Zyb1JweEhhUUZxVG4wVmZ4dXVoZmwwSFJJ?=
 =?utf-8?B?NEQxQUEweEtMK05COVVuanpWZkRNTEw2eGVCR1QxTFczUVFRSEp3ZWc3dG5u?=
 =?utf-8?B?dXFsdGpNOEJWbEhLMXl1cDNsK2dmU3JvMWtwaFdBMWhtTWNNZ2xNcHJuVjFI?=
 =?utf-8?B?ck0xS1hublRMWlprVU5FMUpTUHF0dDNtS1g2MVFSc2RMdzdycDFsUFRtZzdY?=
 =?utf-8?B?Z3RvQ1VlRkZHQmp3djhFc09lUUd6bUZPejZrZjRVaXR6Vmc0VWdZM2twcTYv?=
 =?utf-8?B?K3IzU2w4c25IQ0NZSXJMcmViQVQyU3FDNzNudVV1Y0loSC9lSVkraktBcFYy?=
 =?utf-8?B?dlRGWXRYWGYveXVsRE82dDlPU09jZWJaZWM4L1h0Mkh6ckVycDVHUU9DNHpK?=
 =?utf-8?B?MFB0S2NWRml3di9EU0N5TkJUaXE4Q2wvSmtPMXhwM1dNRWJjUHlxYy9IbHlX?=
 =?utf-8?B?Q2VKcW1NVmNESUs4OTF3bDlJWnQ5UlZJeC9SV1dPcjducXIwRFNnU0RSVG1L?=
 =?utf-8?B?dHhHUzM3UXZFM0NrdFNlcmE1WVFhWGlZT0pSUWkrdTd0OXFibG1IZHJOZWY3?=
 =?utf-8?B?aEg5bjRoYms1WXFEQjFhSFFMVDd3RXBNS1Q5QVE2Rm95RG1vM2E5NHR1NjJV?=
 =?utf-8?B?bE50MG9aWHYxYVNhdEhneC9OKzdoc25sY0ZsZEYvbnVGUWFJY2liWXBsVng3?=
 =?utf-8?B?VVpKUkJiU21sS3l5bWtRTVdTY2Z3R3hvVnY4UWlzSXlvZFVWUk96RHlRTVY0?=
 =?utf-8?B?N1VSRlFJRWpnUXdRRE16T0M5eU5GMEVRWnZNdGZ3cWY3SzlTY1BKelN6K3FD?=
 =?utf-8?B?Q1IremVsMmRHTGhwRm8rVGluSFZ0UHJ3Wjc1b29XRmVnM1U0RlhtQjdlcnJR?=
 =?utf-8?B?alFGQ2RvL3QxRzQ3MlpkUnlTNldGWUsyRkV1L3pNQ2Z4b1I0cXJqdkZLOFJZ?=
 =?utf-8?B?U21QTk1vckhPdDZQNzNJa0tGOFVDSFdadFd1TEgvZkVGTk1MT3c0MTZoTStF?=
 =?utf-8?B?bDNDeEEzZ2VZYWRvSnFLdzJveUdEYTYwSE5yRHdWVWQ2dGJSOFpHQU1xSXZT?=
 =?utf-8?B?QjFCV0hMUnA0RTNmWHhndDBnays2eGJTbUJta21iRFRRK1NTeGdzOWcxRjhs?=
 =?utf-8?B?WDVuQUZGQ3UwSXlUS2RITko4MWlOWnBVdUhZaW1xMWNRTHBZb0UwMkM1dEFs?=
 =?utf-8?B?Z0NGZ0grU0prcE9CMEVBN0JpUE1BWXo1Q2JPYnRqRko2eFRtNkdDTzAvTkVm?=
 =?utf-8?B?L2tJcFpYV01mY1RqMmtYL0ZkaVB6MWM4YitweFhTUUVBeGVzM1JiRXcyc21a?=
 =?utf-8?B?VVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e65cc2a6-6b21-4ef2-97ff-08dc81ad612b
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8280.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2024 20:08:04.1806 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 46HdpywtU5JRHPaeV2nOwmPEptyO+8LISl/ZpEefT2RjX3Ugqh7BzLAktmLoadOBqqZP67+03OI3M1ly3QPbqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5773
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

Quoting Radhakrishna Sripada (2024-05-30 12:13:10-03:00)
>In multi-gpu environments it is important to know the device
>bo/vm belongs to. The tracing information includes the device_id
>to indicate the device the event is associated with.
>
>Suggested-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
>---
> drivers/gpu/drm/xe/xe_trace_bo.h | 20 ++++++++++++++------
> 1 file changed, 14 insertions(+), 6 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_trace_bo.h b/drivers/gpu/drm/xe/xe_trac=
e_bo.h
>index 6d90f3f42d54..88204d4988fd 100644
>--- a/drivers/gpu/drm/xe/xe_trace_bo.h
>+++ b/drivers/gpu/drm/xe/xe_trace_bo.h
>@@ -24,16 +24,20 @@ DECLARE_EVENT_CLASS(xe_bo,
>                              __field(size_t, size)
>                              __field(u32, flags)
>                              __field(struct xe_vm *, vm)
>+                             __array(char, device_id, 12)

Two questions:

- Are we certain that 12 is always a suitable size? I see that i915
  display (in intel_display_trace.h) uses the variable sized variant for
  displaying dev name (e.g. the event intel_pipe_enable).

- Are we required to have additions of fields at the end? Putting that
  at the beginning feels more natural to me.

>                              ),
>=20
>                     TP_fast_assign(
>                            __entry->size =3D bo->size;
>                            __entry->flags =3D bo->flags;
>                            __entry->vm =3D bo->vm;
>+                           strscpy(__entry->device_id,
>+                                   dev_name(xe_bo_device(bo)->drm.dev), 1=
2);
>                            ),
>=20
>-                    TP_printk("size=3D%zu, flags=3D0x%02x, vm=3D%p",
>-                              __entry->size, __entry->flags, __entry->vm)
>+                    TP_printk("dev: %s: size=3D%zu, flags=3D0x%02x, vm=3D=
%p",
>+                              __entry->device_id, __entry->size,
>+                              __entry->flags, __entry->vm)
> );
>=20
> DEFINE_EVENT(xe_bo, xe_bo_cpu_fault,
>@@ -78,6 +82,7 @@ DECLARE_EVENT_CLASS(xe_vma,
>                              __field(u64, start)
>                              __field(u64, end)
>                              __field(u64, ptr)
>+                             __array(char, device_id, 12)
>                              ),
>=20
>                     TP_fast_assign(
>@@ -86,10 +91,11 @@ DECLARE_EVENT_CLASS(xe_vma,
>                            __entry->start =3D xe_vma_start(vma);
>                            __entry->end =3D xe_vma_end(vma) - 1;
>                            __entry->ptr =3D xe_vma_userptr(vma);
>+                           strscpy(__entry->device_id, dev_name(xe_vma_vm=
(vma)->xe->drm.dev), 12);
>                            ),
>=20
>-                    TP_printk("vma=3D%p, asid=3D0x%05x, start=3D0x%012llx=
, end=3D0x%012llx, userptr=3D0x%012llx,",
>-                              __entry->vma, __entry->asid, __entry->start=
,
>+                    TP_printk("dev: %s: vma=3D%p, asid=3D0x%05x, start=3D=
0x%012llx, end=3D0x%012llx, userptr=3D0x%012llx,",

I would go with "dev=3D%s, " to conform with the rest of the line. If you
prefer to keep the above, I would remove the ":" after "dev".

--
Gustavo Sousa

>+                              __entry->device_id, __entry->vma, __entry->=
asid, __entry->start,
>                               __entry->end, __entry->ptr)
> )
>=20
>@@ -175,15 +181,17 @@ DECLARE_EVENT_CLASS(xe_vm,
>                     TP_STRUCT__entry(
>                              __field(struct xe_vm *, vm)
>                              __field(u32, asid)
>+                             __array(char, device_id, 12)
>                              ),
>=20
>                     TP_fast_assign(
>                            __entry->vm =3D vm;
>                            __entry->asid =3D vm->usm.asid;
>+                           strscpy(__entry->device_id, dev_name(vm->xe->d=
rm.dev), 12);
>                            ),
>=20
>-                    TP_printk("vm=3D%p, asid=3D0x%05x",  __entry->vm,
>-                              __entry->asid)
>+                    TP_printk("dev: %s: vm=3D%p, asid=3D0x%05x", __entry-=
>device_id,
>+                              __entry->vm,  __entry->asid)
> );
>=20
> DEFINE_EVENT(xe_vm, xe_vm_kill,
>--=20
>2.34.1
>
