Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55138CCA471
	for <intel-xe@archiver.kernel.org>; Mon,  6 Oct 2025 13:30:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1624910E375;
	Mon,  6 Oct 2025 13:30:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YW+RW2aC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7328610E34A
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Oct 2025 13:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759757421; x=1791293421;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=C8n7MU7sk7Q9OWDYU8RWXTYAxJugLIBV0UQkDLtbyC8=;
 b=YW+RW2aCBL37e6caBVez0iIO6a29TSvzyXGAqALz6wzwEHlVcJpVwUgn
 5R6BErEETP2biEEzKwvpplhx9Zkhp7J8yz/45h7Sr6KUy94pZistWbBzj
 X+KdTKldWs5xA/sVNvHu7ZvKIqNU+KU01U3M7e/gQT1K15ihH+bpoaUK/
 OwpNLEwDr89b9IYFwqtPiIk9M8qsOgh7GJFqrtHHNZrsgQaI+pe1eEmDi
 bfDr97Pma/vi53EO6N4Zh0EiFdqO/+6SncM6YuS6wpQbdIFoj7OTTh2xg
 1wkLUZs9WUJy1VISuRug8QtxzX0wjKnAHRdx22oEqG8oIeqDWyGSNLUj3 g==;
X-CSE-ConnectionGUID: ffUeIwXvS2O9wE/LN297mQ==
X-CSE-MsgGUID: LcTAizmCSlyQYWSc2Kw6RQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11574"; a="61963787"
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; d="scan'208";a="61963787"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 06:30:21 -0700
X-CSE-ConnectionGUID: 4k7X0Z/IQOSd0QYz0RIVTg==
X-CSE-MsgGUID: PqADX1oFQzCniwK37kbZdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; d="scan'208";a="180310422"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 06:30:21 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 6 Oct 2025 06:30:20 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 6 Oct 2025 06:30:20 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.31) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 6 Oct 2025 06:30:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bWtTVgXHYF4d1VPN+lmrpq+rQautCLLnk7Epvq+gQUXk2fEs2NkXZbEckSLvkh1pFklTcwtwduY2+Ki0vPmVUoggxDC8PnDgYRjpCrjGFu2MqypLjZwSCpkb5n/CouDa6DCLYRh3HRlT8pKNpeZvLTtg0h1PcF/CtbBMx/alIo4d21I1pQFOjfkWWC7cwKG0NJ4mZke22nICXMgRE2ob4oezOluHJpoxarXpZCpw7+sTd/06sPvwJ1N8D+kVbarg7SpHd6aVj40amWeN6R02DjOAsYE/qUxBaDYyhUg5bdTtuF8UdqLzY/wnDVo5wUu+pLFJU32e+itD88DK/Ps+9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nRhezP8adpJdGjT3XznkVkTXRGKxBurEW5qsmogUoN8=;
 b=PPdl+248PWH1RakAepcArMV6M61cVPxf7locIs/CqVwA/43egyyml3t3KQmZLsVwvmHF3QkoHMp+dSaQuRzhP6nrnrn8tdc1XiPHJBA4y/8XTI6qQqD+Dc777TxIelqf7eVMrxGueM7k1WklBzkessG52M/S2SvEWxkYagZ0veL20wTsZ3g9X02RO7zSSRQwojbOnFU1bFPqofaNmnN8gr3jNwcS9TeX9zyasedWlEd+EntrZTzLCPhPvDeFznwu9QHv17PD0FLEiMt93p90JIs+waF2PJfZY/Fp27lGNii73ZpKABR0Fl43kfKFO8YLP358yrsvJpfoo+W2VzDQMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by LV3PR11MB8696.namprd11.prod.outlook.com (2603:10b6:408:216::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Mon, 6 Oct
 2025 13:30:13 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.9182.017; Mon, 6 Oct 2025
 13:30:12 +0000
Date: Mon, 6 Oct 2025 15:30:08 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 3/4] drm/xe/pf: Update LMTT to use tile-based messages
Message-ID: <20251006133008.j4t7kytgfwglfqlb@intel.com>
References: <20251005133641.2651-1-michal.wajdeczko@intel.com>
 <20251005133641.2651-4-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251005133641.2651-4-michal.wajdeczko@intel.com>
X-ClientProxiedBy: TL0P290CA0013.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:5::20) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|LV3PR11MB8696:EE_
X-MS-Office365-Filtering-Correlation-Id: b90042ba-4f61-4d30-733c-08de04dc7a35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YUg1R2tIaFpDdE1IaGkzSDJZY1I0eDNZbC84WnlsMzlHcC9kK1hTTW14RTFm?=
 =?utf-8?B?bVc1RnRRc3lycU5sR1JkV3hmd0M1Uy81UDBIamZ0RDZ1TzRlYzJaS3p6c0xs?=
 =?utf-8?B?U2xleWhKYjlTWTh2Wmlad3JTRW1XYXBiK3VGUkg0SWRVbVJpQ3VWYXFTTi9H?=
 =?utf-8?B?S2huUWVYcFoxc2hUb1ZhVkIzYTlxVEgrcisvbFpQOUk4bTA4c0h1US92em1u?=
 =?utf-8?B?NCt6ZFlpU0p5ODJlUmZqdjJrSTFnL3QzNmoyalhWY1hIbUorYUtlRXJPS2tY?=
 =?utf-8?B?V1lJMlk1eEhsekhycmg2WE42WTlhcllsMEdLY0FBWktDeHNYY0V0KzI2UXAx?=
 =?utf-8?B?VXIwZ2ROOWl4Uk5GRzBFYVpPdFNIcjdkRzF5Ulc2V3B5UlU0MlBXU3JnOUlt?=
 =?utf-8?B?TEhHbUVLckM5NnFxblRqK3NXOXhLQ2g3eExLNjJEd1RYNWVkUjBickovQnZm?=
 =?utf-8?B?dXowRXVzMFVPSS9uaHA3VXBOamFaNXF0ZmgvTGY0WDNqK3Iza0F0bHRpSWp0?=
 =?utf-8?B?STFRWTJCdG5jTWlsczE4MmhOb1ZDa21YdXQ2RzhyMEpod2NyS2NnWUNTWnA0?=
 =?utf-8?B?MkF6dGkrTDNySG5hL1dQT3hHeFhnTnRzOGpPSm1sSngvVmxzNTdneG1YQjhB?=
 =?utf-8?B?c3d4YlpWMVpabXFWTW1RZWZ1WnFGN0ZoZXEzY3M3VnlTRXJGWkZZNEhjWFNP?=
 =?utf-8?B?VXJFM3E0TG9sK1c2ckFpNjdHa1dPUlpzVzk4TTlXZStGQ0pPcTNqQUFJNS9I?=
 =?utf-8?B?dHVja0tkU1dQemQzNm5CTnAyZHJxQTdmWkNseWpOejY4VDBwSkFiLzd3cjgy?=
 =?utf-8?B?eFhjNXNMdTRoTGpsSlpaZUJiUnB5ZWFNRFJwNnVxbnB5RGE1L1VlRVJ3cnV5?=
 =?utf-8?B?eGI3QTN4ckdIU3duc3JRQ0VkcXljV3FaSTZBMjZRdzRzUDBpZC8yQXdQKzlY?=
 =?utf-8?B?cEFpMTFMbXBseU1tMUxnN1RLekR0SjB2VzgvMFY2a2JoclJLd1p4UGc4bkkv?=
 =?utf-8?B?YUJkTC9CTGpQSHEzNHh3RXowdVI5bGVORGtrVzFaVlBsNnNsYWNkc0tXajk1?=
 =?utf-8?B?TnJERUpFUWZOUUl5bnc2dXFCcGpTYnA0bm9FN0hDODJiNGF4dzRWR3FKaEpo?=
 =?utf-8?B?OHBadCtxVDZQZWJUelJpcWlLRS9KYXZkYkJVME1NQlRIZU5nWTlmK0l4UWQ3?=
 =?utf-8?B?c3hFNXk3Z2NRdXRBdlFxSGVlMWtGYUh1MTNmdVVWR1NTb0ZGelNSRkNWbHl2?=
 =?utf-8?B?SHIvVEFFMHE3dmJzbTZEOFlzYm9QY1RZLzhvRFFLOGk2Z3RnTEhPS3V2a2dH?=
 =?utf-8?B?RUFpR0lWaEhDUVFZem8wakdlMFVreWJ2eHZQTVNjRnRDdUM3SGdQQ1JlTmRn?=
 =?utf-8?B?Y3BrR3pjQkE4aGxYUHcxMXNTMEVMKzIrdkN4dUNpd1JSWGVLWGF0dkpmWnRO?=
 =?utf-8?B?RjlqaHJ3aTV0QUNReWdLQWFUVjArSFBHQzRUTU8xTEpXS2JUMUQwVyt2eFBU?=
 =?utf-8?B?ekp4QVI5R1hmVEtsbVRYTEM0bVd4aksra2tKTXRWUTZvY291Y0prZDNqWk0v?=
 =?utf-8?B?SjhvNTZjV2FRUHozN3ErMDFlV1Z5RjZFTHZQOXdNMEZvZXRIRlZ3TmpQUXJP?=
 =?utf-8?B?S25LcXk4cUFnTHE4VkNTcTZvdnNzTHVsWkVBTW4wQzJYOUJKaUthOWpXOU9J?=
 =?utf-8?B?SEJXZHRhbnNkaUxvOStrTXdFN2Q2b1NoTmdnck9vNDU4Nm5mWVA5Kzh5c21G?=
 =?utf-8?B?eHhGdUt0blVQNHRpSUY3OUJ6ckw4UXpwTDJzRCtvdEhlK29nOE1mL0xqdUM3?=
 =?utf-8?B?RU8xUkRpTm1ZV2ZNcDFsTUFQQTJpUWU3L2dneE5IQytobU45RnV6TlVMaTNi?=
 =?utf-8?B?NGttTHRFMWFaa25DU0dnKzVLb0cyOTI3WnpZOVFieTE0MkhvYlY4Q1JrSnp6?=
 =?utf-8?Q?J6EbfvToFxF8IFuS/MUQ5g70GgiU7+ep?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UkZBaTR5c0lxSmwrdmNKNWpheDZXcS95LysrRWtUbHZDcmZmS2hLaWNqa3Ns?=
 =?utf-8?B?MFNwOW1OVmFlZHkwZlNaM0hpUkdoQ3VzUnhPck5MYi9PNW9FczY5azR4TTB2?=
 =?utf-8?B?M3Z5c01TZmczMXRFNVQycDkyMHlYNWxyR1d6T0VNaVA1bE1ib3NzR1hZTGlF?=
 =?utf-8?B?aklJT09XWlRraWFBYXoyZVdlS1d0dTN6bzVQQ3M1elI5WFZxaEF5SDBSTlFq?=
 =?utf-8?B?L0h3SXJIQUEvMkNYSlhsRkN6ZmgvUGpjblFGdGlhTDNLZExPU0pTOHZDSEtq?=
 =?utf-8?B?cXRTTnJXb3NVWThwT24xL0JCLzlycXk0TSsrOFFoenhQVm5CQlhPcDhBWU00?=
 =?utf-8?B?L3ppTGNLa2hJcUY0TWNiU0FSb0FkMmtKYTBSZzdIOFkxQUNmNk9sRkg2K2Ra?=
 =?utf-8?B?bmI1OTB0MHgrZ3k4Wmx2d2RQSlNXNnhYMWIzbkMyWTk0cEY2ZDV4K0hiTW5z?=
 =?utf-8?B?d3JWeW5OTmM2S3hRbUEwUElXQ2F2TC91Q1NhMGRKSWpmaTZLUHMxSkRzdFY2?=
 =?utf-8?B?Y25WdkliaEVoRjUxUDY3aG9neW1jTjFmVnRPcnZWZE91Z2t0QUpGYmFHTkNR?=
 =?utf-8?B?U1drcmx4UHAvSXh5U3FrUEpISWZpV28ydGNtRzd6Yk5sREhSS1RQdXhzV0dt?=
 =?utf-8?B?blpkeFJFTDd5ODRsR3hMNnhCc2xkMTJjcHh3UWI3NCthamlJYmxsU2pqWmVm?=
 =?utf-8?B?T1JpdStUOUJXMmorb2I2TWNoRkUxb3VwMldYR2Q3eFhpczQwUitZQndiazgx?=
 =?utf-8?B?T3lYcE9vWjRWTmd3MWQ4Yk5XemhBS1N1MEtHbXNjaE1FdFBLZ2IxR2o4Nmw4?=
 =?utf-8?B?cjlGTTBpUmR0TVJXV2orU2lpcXlJcldqMHhPOUtWYlFZWXFuWklhVlFuSmNu?=
 =?utf-8?B?ZXByZEh2aVduNG0xWGM5VnVsbEQ5REFpSlUyR1FRYmNFOGdpc2xuZ28wT0hB?=
 =?utf-8?B?NmFrTFpMYVhTRUdzYzF6OTdlK1JDOHp1MW0wSklWZTdySktTZ3VXQXkyNlc2?=
 =?utf-8?B?dmtzNWt4RTJ2OG1qRzgvemw2ckxpWVpNcTR4SHM4ZlMrL3B1Rk93WTc4cFlH?=
 =?utf-8?B?M2MwQlNjN3JCVVhWdWUzSmp1TjJwVUFCT0ovRUZwZDFoZ1FvS1ErNzhUVEJ1?=
 =?utf-8?B?YjhtOWpkano1aUt4Y0dhaDk0ZzBRK3JBNlRxcXljS1RUUk45KzNNSFFrV05P?=
 =?utf-8?B?MXJyVzFsU3hKd3F2UjgyUnlndG5pNEtaVS81S2QyajdhdDZlZzN6amJkSExY?=
 =?utf-8?B?QXdQUkF1S0pvbnZJMFdvK29EWVM3SkVpMVdFcHpkNnVBaXcxTGdUZE1hK3BT?=
 =?utf-8?B?dkNLZ3E3cFFkcWNpZjNwMU1nT1VjZ1UyVk1kR1JXbzEyaktmSDVBZGlyMXQ0?=
 =?utf-8?B?bUoxMnFkVWsyU1h5WnB4RjlyNHFVUTFqdThqQ1Z6cHFzcmpoTEZVdGtFSjZC?=
 =?utf-8?B?amc4R1VkVWErTStEOE9aOEhtaUppNU0rYmNmSjVmY0xCcEJ1MzlOcjJtN1FE?=
 =?utf-8?B?Q1o0R2tza2ZJRGV4U2Vmdzk4a3QrbjZUa1VudUtjKzNxSGlrYlNNcjJnRy9y?=
 =?utf-8?B?UmJFejA2aU41V1Q4blE0YzZoNmFMSDVIVytjQlZHaldjMExyRWVwR1NFU2Fi?=
 =?utf-8?B?QnRuYWZBVTR0VytXYUVPbnM0cTY0akhXcEJxYUFRQlBCMEVQQ3BzRFVKQmk1?=
 =?utf-8?B?TmpidHRFaE45WVUvTTJpaXhSWlFQNnJKbmNqTFBHZWFXOUZFck9sWmxVL24z?=
 =?utf-8?B?TW9NMldNcExXSk8yd0VoaC9IM3YwWkQzT1NSRUVwWmxlUmtQZE9LdzlZUHl0?=
 =?utf-8?B?TXFGTFJRWDhHY2Vrb3YrVkxGNGVLd2gzdTRMSGN2VStqWFhYMUVPa0V4NE1L?=
 =?utf-8?B?WVJXQVFNSUc5K3k5NmUxRzZ4SEVnaVBETHhkMGlYcGFMYVRHQkdVakhOUmZo?=
 =?utf-8?B?dmd0U0VVU0huUStOMm1NWXVIV2NiSFlXY3hzYXhodWdpOTYyUUUzSDBvdWRG?=
 =?utf-8?B?SFlPakY3QktwT1picHdwQUZaNWxOd3BMTDQ2L1p5Z2pIT1NOWVdTUDlqeHN1?=
 =?utf-8?B?SVIwWE9TTGVHNy9NUWZPLzlXYjVUdnFGbWZqRStianFTaXd0Z2ZBQklGSW1N?=
 =?utf-8?B?MnFJZDNuL1IzRWhrRXUwQ3BJZlBzT3hNdlY3dTZrd1BVbUpHUmYwMEJ0WlBt?=
 =?utf-8?B?enc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b90042ba-4f61-4d30-733c-08de04dc7a35
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2025 13:30:12.8779 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eRTDewLxbxs69fWgH4DzbcsnweKw01ozuFKqWLYQNBDTRgydm80yxgONkmoo0IMilenlmfaJlDVRTLJMH22vKenwfAWelkRd5SY0FhAne54=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8696
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on nie [2025-paź-05 15:36:39 +0200]:
> Since now we have tile-based SR-IOV printk macros, there is no
> need to manually prepare the LMTT specific warning message (that
> is now upgraded to proper error level message) nor to use generic
> debug message without tile/LMTT identification.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_lmtt.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_lmtt.c b/drivers/gpu/drm/xe/xe_lmtt.c
> index 62fc5a1a332d..4dc1de482eee 100644
> --- a/drivers/gpu/drm/xe/xe_lmtt.c
> +++ b/drivers/gpu/drm/xe/xe_lmtt.c
> @@ -17,7 +17,7 @@
>  #include "xe_mmio.h"
>  #include "xe_res_cursor.h"
>  #include "xe_sriov.h"
> -#include "xe_sriov_printk.h"
> +#include "xe_tile_sriov_printk.h"
>  
>  /**
>   * DOC: Local Memory Translation Table
> @@ -32,7 +32,7 @@
>   */
>  
>  #define lmtt_assert(lmtt, condition)	xe_tile_assert(lmtt_to_tile(lmtt), condition)
> -#define lmtt_debug(lmtt, msg...)	xe_sriov_dbg_verbose(lmtt_to_xe(lmtt), "LMTT: " msg)
> +#define lmtt_debug(lmtt, msg...)	xe_tile_sriov_dbg_verbose(lmtt_to_tile(lmtt), "LMTT: " msg)
>  
>  static bool xe_has_multi_level_lmtt(struct xe_device *xe)
>  {
> @@ -267,15 +267,14 @@ static int lmtt_invalidate_hw(struct xe_lmtt *lmtt)
>   */
>  void xe_lmtt_invalidate_hw(struct xe_lmtt *lmtt)
>  {
> -	struct xe_device *xe = lmtt_to_xe(lmtt);
>  	int err;
>  
> -	lmtt_assert(lmtt, IS_SRIOV_PF(xe));
> +	lmtt_assert(lmtt, IS_SRIOV_PF(lmtt_to_xe(lmtt)));
>  
>  	err = lmtt_invalidate_hw(lmtt);
>  	if (err)
> -		xe_sriov_warn(xe, "LMTT%u invalidation failed (%pe)",
> -			      lmtt_to_tile(lmtt)->id, ERR_PTR(err));
> +		xe_tile_sriov_err(lmtt_to_tile(lmtt), "LMTT invalidation failed (%pe)",
> +				  ERR_PTR(err));
>  }

LGTM:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

>  
>  static void lmtt_write_pte(struct xe_lmtt *lmtt, struct xe_lmtt_pt *pt,
> -- 
> 2.47.1
> 

-- 
