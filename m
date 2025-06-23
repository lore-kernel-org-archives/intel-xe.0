Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F026C7115B
	for <intel-xe@archiver.kernel.org>; Mon, 23 Jun 2025 04:37:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E130E10E139;
	Mon, 23 Jun 2025 04:37:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PzTIGSYJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05DE510E139
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Jun 2025 04:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750653421; x=1782189421;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=bMacILEjwLf+rmjP/KsGxrxcBnhbs5zUZCWxpIOBMN0=;
 b=PzTIGSYJ5fI7+u+BWdEciHdOdJmBmeE323fnkqyub8diNCRhEEM4Qj0D
 2S+Ag240JzoV2YDdosjiIz9IQypml38oQfHX6OJ1Z+ApcatE3cusFzh+k
 tnBoUCbmDlsKV7hwAC5jvqNVIlG+kxrQZ9Njqh03RGQwICpo07/jnYlA6
 DwWK2SUdeQcTEGPQWvkLGVbDNhc55+3edO0KITBdP64CMIILJfrIjGrxk
 0gCPSWSbZ4OqyznORKX7aBe+6K1YbvIQk6Fj9YQmX20q5EbpCZV+CPpwP
 nHwJZFLr2k/iOsVfhAwA0ITY5iGKQB8B2y8gF1YeCLfG4SjhLbkqLwzHX g==;
X-CSE-ConnectionGUID: hqQMpfBmSgmrTZg5nlbarQ==
X-CSE-MsgGUID: Q+zYowDOQsO2ThsTDZFyrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="52933530"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="52933530"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2025 21:37:00 -0700
X-CSE-ConnectionGUID: VBFHkPsWT42uBC4WUhjUiw==
X-CSE-MsgGUID: CLpiRTFrRgOnazAUPLcS2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="152002075"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2025 21:37:01 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sun, 22 Jun 2025 21:36:59 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Sun, 22 Jun 2025 21:36:59 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.50)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sun, 22 Jun 2025 21:36:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lFXXaM6mqqs7lIvueTcyykOdMxCsGEzuZCRYRGdvw7Coff4b/Fp1m9l24kFS1YMYhB+lCbywANu2WSvmm1edSlmPosK+lqjOrO2m8WbbwG58q7CY8exSfN8USJKGEXyFoFk0pLKk+sVMwV9MsNs3zPT6GfLwCBic87x7HgmO7YSHEUoUCfpy0L2XAeLbSLkRtaH86cyGkK0natf9jy/YY4hY8BoEDEIp8Q0QU0lpqvYd7FPFSPzCt8S1bhKlRZtKVnor0LlHhz2MRoyIzugsOO55VeCtyNSKFG9i+9a0zTjqa+VBiZA6drosFdTAuDhJUiPrPWO1lgAhSPNKq7qwQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UmcoHjy0e3Cq4XOX1XulE+YejhzWK1+A6eDCXlOfEsE=;
 b=kBdhp+IUWGXBDWLl/BfR4zhPx5yNa7EQJFT+ALEAvtRgVmFZTQOecP4J+/fDf/7Z/1g+HGRcFn7oDBFMAq/IMXwKtH1GwIJZAPWefgFT0u8SqxqAAaejsGSogMJ7a7I7Ohmu4WBcbhYiBWrqFrG1b5e8C5CuQQNWcnjmDZq4+jQ1ogCP+GNpSpd+L425wsOVr/XQ8FEmha87xm0Ku3UUfLEg2z4Yr2Esekle/wqeByyhSCzYrqJu/NZjT3FcxDcGn5rhu9J1tyTRPkba6HVpiXgKlf2gIm6kNLLAUOuNpJxZHOswbJh08qO2E6yesxVXvok7Hjc9hm8Ghf59rFVHoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BL1PR11MB6050.namprd11.prod.outlook.com (2603:10b6:208:392::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Mon, 23 Jun
 2025 04:36:52 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8857.016; Mon, 23 Jun 2025
 04:36:51 +0000
Date: Sun, 22 Jun 2025 21:38:30 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v4 05/20] drm/xe/vma: Modify new_vma to accept struct
 xe_vma_mem_attr as parameter
Message-ID: <aFjaRqbVpAAtoSVd@lstrano-desk.jf.intel.com>
References: <20250613125558.2607665-1-himal.prasad.ghimiray@intel.com>
 <20250613125558.2607665-6-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250613125558.2607665-6-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW2PR16CA0066.namprd16.prod.outlook.com
 (2603:10b6:907:1::43) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BL1PR11MB6050:EE_
X-MS-Office365-Filtering-Correlation-Id: 134c37fd-0d95-49c5-8fbd-08ddb20f9310
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y29rUGRUK2w0alFSeFZPaTA4czZZL09TOWViemtTR2xuYlkya1BoNGN4bmUr?=
 =?utf-8?B?VjduNUU3Nm5BYWRwOE94dXpHSFhvbHFCS0VPQVZrY3lQbUFNVzdCZ045VThm?=
 =?utf-8?B?SW1ZeE9UdGJzY25PSUdveGR0ODdEdjdWbDdETTdOUkxqRW1hZGViU01MU0ZX?=
 =?utf-8?B?MXV5SWlPdmJKTjc3c0tld2FmeHFVcjZlOVVYOTZPdUtSZWN5VGlPZ1lsNFIy?=
 =?utf-8?B?d3MyTW8wczhnRnBDNjVyMDNmRGZod0xleEhod0phMXZ5UFlqVzNaUis1WjJB?=
 =?utf-8?B?aVpjeVpKQVNvVFVIZ1dMeGxyUS9pUEEzK0lBd2JzQ08rSjJWamV5NFZQSUNy?=
 =?utf-8?B?bFhSWldiM2p4UWF5UmR0djY5b2VLaEN0OVllQ2tFa2pReEk1aEpCVkJoNkxW?=
 =?utf-8?B?SjQzeVUzOEtwbTBrV29EeVI3WUJVaVhuUXlvZmRjWHQ0SG10MFovQVJ3OENo?=
 =?utf-8?B?UWRxMHBhL0s0R2hrY1pmM0ZtSklGT1VKWi85aDhTeldEMHNEQ3VRY2RodGN3?=
 =?utf-8?B?WWRxZFUwMWJSVXVkVzlrOElwVXdYOEp5cjRVRk1yTEc3OVQ1eXRjeHJMZ1ht?=
 =?utf-8?B?ZCttcXVabTJ4d2lBYXdUa1Q0VEhpNHBDbUZiVnZFVldOWUUrM25FcFdycWRQ?=
 =?utf-8?B?dWJYV2RzQWdkekJWWlc5SnEyV25HeFlBUUwzajE3MG0xako4ampOYmd2Nk5G?=
 =?utf-8?B?N0RqSjg4QzNjYnNRQk4rWk13UkliQVhSS1p6MUxDK2ZLRUxISFl3RnhrZ2kv?=
 =?utf-8?B?UEo3WGM4TDRTMHdGbFJqUnZWVEZkZGphVytaWUI4NHorTnhZbUhCYWwvaVJz?=
 =?utf-8?B?MFVlQ0hneWZGUlBIUUNaVUNzWThzaE1ESk5TUzgxQVl5a1lMUVJZakdxbkxi?=
 =?utf-8?B?MlVOTnlNcyt2RFIwRjJNM1g0Ym5ZTytxTHFnTTJ0Vi9hQ0NkdG03OTZDdHNO?=
 =?utf-8?B?ZGtjTjgvbmFmVlZtYjVIOWNaNWZ3RlRic1RPWmN1clQ2ZmdXQXJ2UERWL3hY?=
 =?utf-8?B?djZZZ3Z4S1BwSm5HUzhuZHlya2dsa3BSdkowQXBSdTZFT1pxR0ttMllDQ25t?=
 =?utf-8?B?SzdpcERsdzdRMlYvYm03c3ByMlZqOHRJQ1plUGVNRmpkVXhZZ0FERThIblgw?=
 =?utf-8?B?MWFWUm9CVHNqVXFyclpRN1A2WmY0YjlxakU1TmNPOWVhSG05Zml5Z25pUUti?=
 =?utf-8?B?VGl1REhXeXYvL3g1QjRhUDlMQ20vbjRDV0pOVXBObEhnTm4wZVdkK0plN0xX?=
 =?utf-8?B?YUFLUHJFSi9RcXBKVllwTUNjMjI0bUFJWW5YQ0t1QW95bkRSSEYwMUZJUTc2?=
 =?utf-8?B?dlFYbXBCei9FSWZUYkhiZC93Q29jR21qM0xKTjJqVGlGQmhxd2dCbGJDWFFF?=
 =?utf-8?B?NDJITkRKOXNCOUJNVU5UMy9KOFdoVmRhMWxHTk5mcTR3cXc5TmJBMmRDM2JI?=
 =?utf-8?B?Rjd0MmdxVmwxM3R0MXZXVXBaMUFFS1BKNTBjczV4ZzBzMlhmVzJIZDdLdUV6?=
 =?utf-8?B?ZXFxcE1uNGcyU0xuQ0d3aVIya0RSK1kycGszbTRXVml6K3FYbFRIemtJNGlX?=
 =?utf-8?B?WVQ3dXlMcENwTXptVm5DVFJaNk9nS295YndKaFY3VTRqODYvMDA4ZmQ4TUNT?=
 =?utf-8?B?ejJ2dDBNaWhPeDBvdnV4Qjc3Wmdqd2c4cWlWVjl4V0cybVFGaDhwVjBkQmdF?=
 =?utf-8?B?NzFVcVgzNVB3ZVZIclVpQnBod3RhYTZvRjdrMDBTMWVocFZ3VlpyT1liZDJN?=
 =?utf-8?B?Q2pZQUpzQXlMbmV0MWVGMnQ5MWtYNTNLYThkRnlJbG4rRlQrRG0zc0ZvYXA5?=
 =?utf-8?B?Zzloa1hmUVM4T2NXOWNGTExuRjNtbXdDTmxzUmJnV3ozR0dVVjdsVGpLdFBR?=
 =?utf-8?B?MjgwLy94SkIvQ0V6TDNkV3FicHdqUGc4L0ZmK0IzWU5NWWNNMm9oUTZpeEhz?=
 =?utf-8?Q?xGcaxewsVx8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZThwZWxhNnpKWjE0dFVqazFRMXQ1VmIxK0dHN2NFUDZaY2Q3NFFMc2hxT1hH?=
 =?utf-8?B?enVuazVlNnhHZWlMRlY5cmdDaks0bHpydE5GSEQ3eW1xZTVJNE1ybzhkaGFw?=
 =?utf-8?B?SDBPY0MwamNmcllXU2JtTVFmdmhERWIwdHlMcXZvaks5eXNQME9HcXJpMU1F?=
 =?utf-8?B?ZFdhUXVlVXRpUzFLNDE5dWxKQzBnTTZZNklsYlFXNU1qZkwxY2lJZ0ZDZTZK?=
 =?utf-8?B?L1FkdEI2ZFMwM2JZbkVNV2FVcHhVT2d3bmU1Q0RYdGZsTEpuY2FxdUtCeHVX?=
 =?utf-8?B?TWNZbm5KK0ZQRU92UlFIdVBrdWdQb2VUeUs0eWQ4ek5KUTlFTW1vYnFMZkg3?=
 =?utf-8?B?clcyWG1LcWZ2TFFhUHVnRU5iTTZPM2l3ZHRuV1VHRjBCR3BhSU9vUzZSU05N?=
 =?utf-8?B?RlIySm83NEVNWjU2TkFCNGtPMEYzei9hUlNtMk92d0s2Ky8rSlNDWWZEUElz?=
 =?utf-8?B?T0tBQ3hqb1NQRWpQZjZ1bEJLQVpXTkppWXBMVlRoaUROS3ZFd2FCU1JTUUQ2?=
 =?utf-8?B?bEovbXVCWGlVQURPSjJMcmdVdWU3R3RjTjVPNzdyV0tBT1R4R2FmUmVreklM?=
 =?utf-8?B?V1g2d1I2WjViSUtRQnlNSVpHUm1oZGZXSlRUY0thRFdJdlZPaWRHN2RjU0RR?=
 =?utf-8?B?ZU91SHlQUEVmR2VqTTI3Tk5WN3NXUmRaQ2dTa3dzQm1qM25HcHgyblpUN3Z4?=
 =?utf-8?B?eGQybW9nWkZQZWxmOCtOTkZPakZaZ0lhZ2FQd1FSRUVKenFjMlluV2RHMkt1?=
 =?utf-8?B?MHkwb3V3OWlaUG5qeUwrRVpmR2cxcFo1Rk9mYnJmSGQzM2pkSG0xNkYzZ2F4?=
 =?utf-8?B?Z25KeE4wUVNYR0FHSkw5U1FDd0I4a3NBanBFaWhIUkF6NmZCWlRQTjVHZkxy?=
 =?utf-8?B?UWZHK1BxUXk3aGhTSDNOaUxScnZOejhZWGJReDR1VDl2bFFZOTNDNVNiZHpW?=
 =?utf-8?B?aUNxTHZIV2xXQnZKaTFtRCtKcGRHNmV2N3RaaE1tRjNCWVBnbTBIb254T3ZG?=
 =?utf-8?B?ZHFjRk4rY1FJLzNscE4za1NjVU1ORGh2aHk2aFlyYkN1TmtJZFhSMFU2L1A2?=
 =?utf-8?B?ZVc4WUdTN0UzSVJHZllKcUE1bi80eCtLcE9odElHbTdWRWJjcDZYdEZYMjBN?=
 =?utf-8?B?eCtwNEN1cmpYZy93c0RlUkZPVkZNdVJzRGV2WUNzSXN0UjlseGxvcW1zd2ll?=
 =?utf-8?B?clUrZXpqR3FrZzkyK241K2pzaWZFY1VieW5ReDdXb3ordk1sQVpXREdsZFdy?=
 =?utf-8?B?dzB3VHNiTXJQMHN6c29IZkFiTUVJZXJENkh5a1E4aUpGN2x6eWI0Mm5MQm1E?=
 =?utf-8?B?RmQ3cGdSQU53KzRLYVNkZ1RoaUM4KytLRlBkSHhNZGExQUZJSmxIR2dGVWJt?=
 =?utf-8?B?UWFOODRldkZZMzY3WXJVdXB5d3FXenE1Um9hUjE2ODFoWldhZE9EVVBpeW1a?=
 =?utf-8?B?L1ZIU3ZQYjBSWnBUR3lYY2NOck84UmtQOGExT21QYzNmRVlaMVBnMGd5UGIv?=
 =?utf-8?B?UGNIRUZDZ3RRbXQvVjJPWFNsN0lKTVorbmV2RE1SanhtZjNGMnF6MVZyK1hn?=
 =?utf-8?B?UWlUTE41dTI2ZThNNzN2a1dSeTJJbGh3S3pLOGlreTRlSzY1MUxldGJ6UE14?=
 =?utf-8?B?TFlvTmpQVURDQUxaZ0h4YTRlWUVsYmtvN0xFVmt6NTNuazl2Y0pSYWI3bjZa?=
 =?utf-8?B?U0VZY05hTGJmZjBMb3dPNy83MmFZQkZaTUJSYlFkOHZZVlUyUmV0MjRNN29G?=
 =?utf-8?B?dkpXbXF0dGFkN1dYbnZHWUY4VG5EOTdBa1lhUG16RExDZzVnVHRHelMxSnh4?=
 =?utf-8?B?enNrQ2NHTVA5VC9FQ0ZtNFFZL1N3T1h5amJXdjk4VllWSlBnbnk2d05rR2pw?=
 =?utf-8?B?c2N5UUhDMjgySHMwZGV6SE5KNmZKRXlRM0xWYVZka1hsTkhmTUdqMnBlRjJs?=
 =?utf-8?B?MlNReDlrVlM5ZjlUeEpUUUV3dGhWZFRWcGpsOWJBUUFPSStJTEEwTUhtYU8y?=
 =?utf-8?B?eExRRTM2VjV5SEt2LzArMHB0aEhuV0ludld6dk9CRTVGNGdZQXo2Rlh0VEVH?=
 =?utf-8?B?djBmQU0rT3FET3g4Zm9MMVdla3JFdUx3SWJUSGxLU1JlK2ZuMEQ0VWcyNU9i?=
 =?utf-8?B?bzFRTmllRTcyM1lmMm5WYktWZ094U1VMamNUVUpYUEJuczVpdU16bnhuSW14?=
 =?utf-8?B?VHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 134c37fd-0d95-49c5-8fbd-08ddb20f9310
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 04:36:51.9439 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1kw1Xqtmb6u3cbbXTKkGaRQyOXzleCzxElE6GcSTd+REsWmhnvHtBMmU4voSWY7GHnUa1WVBTWcz0XwU2FdtWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6050
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

On Fri, Jun 13, 2025 at 06:25:43PM +0530, Himal Prasad Ghimiray wrote:
> This change simplifies the logic by ensuring that remapped previous or
> next VMAs are created with the same memory attributes as the original VMA.
> By passing struct xe_vma_mem_attr as a parameter, we maintain consistency
> in memory attributes.
> 
> -v2
>  *dst = *src (Matthew Brost)
> 
> -v3 (Matthew Brost)
>  Drop unnecessary helper
>  pass attr ptr as input to new_vma and vma_create
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c | 24 +++++++++++++++++-------
>  1 file changed, 17 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 9b705526a3e3..4849d4cc806a 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1168,7 +1168,8 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>  				    struct xe_bo *bo,
>  				    u64 bo_offset_or_userptr,
>  				    u64 start, u64 end,
> -				    u16 pat_index, unsigned int flags)
> +				    struct xe_vma_mem_attr *attr,
> +				    unsigned int flags)
>  {
>  	struct xe_vma *vma;
>  	struct xe_tile *tile;
> @@ -1223,7 +1224,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>  	if (vm->xe->info.has_atomic_enable_pte_bit)
>  		vma->gpuva.flags |= XE_VMA_ATOMIC_PTE_BIT;
>  
> -	vma->attr.pat_index = pat_index;
> +	vma->attr = *attr;
>  
>  	if (bo) {
>  		struct drm_gpuvm_bo *vm_bo;
> @@ -2444,7 +2445,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
>  ALLOW_ERROR_INJECTION(vm_bind_ioctl_ops_create, ERRNO);
>  
>  static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
> -			      u16 pat_index, unsigned int flags)
> +			      struct xe_vma_mem_attr *attr, unsigned int flags)
>  {
>  	struct xe_bo *bo = op->gem.obj ? gem_to_xe_bo(op->gem.obj) : NULL;
>  	struct drm_exec exec;
> @@ -2473,7 +2474,7 @@ static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
>  	}
>  	vma = xe_vma_create(vm, bo, op->gem.offset,
>  			    op->va.addr, op->va.addr +
> -			    op->va.range - 1, pat_index, flags);
> +			    op->va.range - 1, attr, flags);
>  	if (IS_ERR(vma))
>  		goto err_unlock;
>  
> @@ -2616,6 +2617,15 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
>  		switch (op->base.op) {
>  		case DRM_GPUVA_OP_MAP:
>  		{
> +			struct xe_vma_mem_attr default_attr = {
> +				.preferred_loc = {
> +					.devmem_fd = DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE,
> +					.migration_policy = DRM_XE_MIGRATE_ALL_PAGES,
> +				},
> +				.atomic_access = DRM_XE_VMA_ATOMIC_UNDEFINED,

We need to double-check with the UMD team here — there are ongoing discussions
in our internal repo where we might need to set the default behavior for BOs to
enable global/CPU atomics on BOs with SRAM/VRAM placements. If that is the case,
then if this is a faulting VM, I believe the default should be
DRM_XE_VMA_ATOMIC_GLOBAL. See VLK-66541.

This would be behavior change too, so perhaps the maintainers can comment if
this is allowed or if we need add a query indicating the behavior change.

Let’s close on this before I put an RB here. Everything else LGTM.

Matt

> +				.pat_index = op->map.pat_index,
> +			};
> +
>  			flags |= op->map.read_only ?
>  				VMA_CREATE_FLAG_READ_ONLY : 0;
>  			flags |= op->map.is_null ?
> @@ -2625,7 +2635,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
>  			flags |= op->map.is_cpu_addr_mirror ?
>  				VMA_CREATE_FLAG_IS_SYSTEM_ALLOCATOR : 0;
>  
> -			vma = new_vma(vm, &op->base.map, op->map.pat_index,
> +			vma = new_vma(vm, &op->base.map, &default_attr,
>  				      flags);
>  			if (IS_ERR(vma))
>  				return PTR_ERR(vma);
> @@ -2673,7 +2683,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
>  
>  			if (op->base.remap.prev) {
>  				vma = new_vma(vm, op->base.remap.prev,
> -					      old->attr.pat_index, flags);
> +					      &old->attr, flags);
>  				if (IS_ERR(vma))
>  					return PTR_ERR(vma);
>  
> @@ -2703,7 +2713,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
>  
>  			if (op->base.remap.next) {
>  				vma = new_vma(vm, op->base.remap.next,
> -					      old->attr.pat_index, flags);
> +					      &old->attr, flags);
>  				if (IS_ERR(vma))
>  					return PTR_ERR(vma);
>  
> -- 
> 2.34.1
> 
