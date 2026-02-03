Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 297CDE8B37E
	for <intel-xe@archiver.kernel.org>; Tue,  3 Feb 2026 23:43:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFAFA10E26B;
	Tue,  3 Feb 2026 23:43:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BlPumP+O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E5E610E1EA
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Feb 2026 23:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770162186; x=1801698186;
 h=message-id:date:subject:from:to:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=3IPbfXP9UNoqEDbWgB9UYEsSyNr8h/4cZyrD69/6xN4=;
 b=BlPumP+O86AOX+gQmMkcJLMDaVMVm6XdWZNnwL73sOriTgkVc5SOsa03
 dlCsVgTF8rlTtmwTmsIiZEz4ZAXC22BO06TJkkTvK3lci+9Ds0oRvZ9S1
 H67sPOeiTRcZYZz239VPUFZFhSsniCHZLkyV0sZvsdTLAMRoKlxSPFFP1
 DmAmIPfAwq6jiAjtBhY5fGLUeGbQ/oq/cr1/p7Y1zlf9AnB6WPdVl6c7h
 lis+ZJEP53Jo+nXwtopeaKOS7MAOhLpPTwzMggqXx4s63R8+2xuh4qOHm
 q5FQMnTdq7CF0qYUIyyEI3BIvjLJnNsL3xE3It3O+EE0r0pEfPKipsnv8 Q==;
X-CSE-ConnectionGUID: SHidbXZIRt+gLr+9gdi6OQ==
X-CSE-MsgGUID: 2YiULZl/Q1ORKIk1nw/ayg==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71066091"
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; d="scan'208";a="71066091"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 15:43:06 -0800
X-CSE-ConnectionGUID: MMDMVWjQRA2i3GmVi1xn/w==
X-CSE-MsgGUID: pH4psLxvSOivzQMlnKSGlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; d="scan'208";a="209101270"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 15:43:06 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 3 Feb 2026 15:43:05 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 3 Feb 2026 15:43:05 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.67) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 3 Feb 2026 15:43:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WfmkocUcXHCxlNHsgqBfxfD1qATp3d/BEb7DCd2Vge9C8xdWTCr03Rclqr3yon1LnxJ/UgSETpYssZiwRFwABx1LpCOKk30apA2LnrF17ffwxXN7sN11NL/AntLqs9a4QakIEc66fp6OskSAOl4pEegHQx8+M5ekr9IrfcuCnZuyELGGQGMAeQHyr2TUK0933utmPOp95Z2XeT2m0hIfr4KtGxY/ZvXrV+p0X83ltN0Db59DYr2l2joX7KGy+ofhnFUBG5IVRUBQT7yJFserm/AxJIwTAXype66WYlvwpXaXamEVSXkxZrzMSkG5k3A01u99IzzadHiygo3w7eExHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EjzFecflJ+iOnxIjFFaWRH8PraRXaO5V0IQ0aLECCmQ=;
 b=jhE5mMjDYivaNOwoFlKSiXKPxUJnmjmHkrsBiNKsHrermJpA2WTvshAccUt/QN/kB5iuEE2xv6WCkpfHKfZ/Yp8/hYzdC40Yp7FeNjGWXTe3FWFO8y6jEKxrIibBoBJUqpD51gvikKVxTbS6KB6Y3MLiQEOvIdpVDDSEG0LbEIVvHPHULtBV/7j5yrSivVQtcVq35/uE6u3x9Zx35zF74EPrG8e8PBrgEOnhmlUHgKCkmlDn8p5f5bL0ZC73bVdHFwXl6gvlnGE9OLd7odY34SRdmSxQjs7G3e1DJwbGPU0Wg9YF2XjZAik+vVo56LxY3IPLsAKN0fbVQoV8B83onw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by IA0PR11MB7330.namprd11.prod.outlook.com (2603:10b6:208:436::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 23:43:02 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%4]) with mapi id 15.20.9564.016; Tue, 3 Feb 2026
 23:43:02 +0000
Message-ID: <9a5568c3-9ff2-433e-93e1-c4387539f2cf@intel.com>
Date: Tue, 3 Feb 2026 15:43:02 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] drm/xe: Enable Wa_14025515070
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: Julia Filipchuk <julia.filipchuk@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260130210120.2682085-5-julia.filipchuk@intel.com>
 <20260130210120.2682085-6-julia.filipchuk@intel.com>
 <019f9fc5-5695-4b65-b39c-8de2ee278f9e@intel.com>
 <6aefe580-a66f-425f-a61d-fe7113b5213a@intel.com>
Content-Language: en-US
In-Reply-To: <6aefe580-a66f-425f-a61d-fe7113b5213a@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR21CA0003.namprd21.prod.outlook.com
 (2603:10b6:a03:114::13) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|IA0PR11MB7330:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b06db2f-de36-4023-e8e3-08de637df884
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZE1YY3d0Lzl6SXQ5cjhMcmlqSldseW1BRUk4RmsvcGVaM3N5L1BEeUdudU82?=
 =?utf-8?B?WmE0cmtEN0pJU1J0Y0ZhYmJKeGxCWW1CbUxhK3FjY1VHbkFaYTMzMUFPMkZB?=
 =?utf-8?B?Z3N2Sytkdm9IZGc3RWlHNjRacWVoN3ZYVXJNNm9QZytuRDZacG9UcUNyTUxN?=
 =?utf-8?B?ZVdGcFNLMkpIREtMQVFoR3I3aWNrR3JvV1FZeENCemE4VzVTU212V1plNUNu?=
 =?utf-8?B?d0dZZjI5R013bWxiNWFOdlZmN3pQUVQ4NU95S2UrMWUxT2tQbWU2R2lGaU13?=
 =?utf-8?B?anhGSVZaREZ4SDZoMnByQTZxQXVrWXJEbHNCYXZkWWlQRWpHOTNWSWE1dnhX?=
 =?utf-8?B?enQxRmpoNTMyanI2RmFMNzhvSEVPZkZja2p0NWpRUm40Y1NkVUJoVGJMeWdM?=
 =?utf-8?B?RTFBQ3dHMU5nZzZWbk5Mdm9HSVFmNjVBNEdyd0d6bDhsZ3dlQkdCS3E0QStv?=
 =?utf-8?B?WEo4R3NVRm12RW1ldGRRK3VPK1doQ3g0ZmJsakZIRkdDRmZxSUIvV3ZsRWRp?=
 =?utf-8?B?NzY4clRqUENkamoyUlplU0RtOUsrcEhqOWV2NkdpaEVma3VUd0ZCb3BQV09L?=
 =?utf-8?B?SWhKbTUzai9pOXVKQytnUTdvVzBmTHh4VGZnYVI4NGEvSVJNRU1YdFNkWFhx?=
 =?utf-8?B?Wk9HWlF0WlMwYXBXTkNBREtQSk9Vd0k3WDcrNFFiODQyMng3RzMvMUxvc0xa?=
 =?utf-8?B?TXE5T016bGxIZHFEMXpIOWR4WG83SkhVaWdZNmN4MnFlckJLdkNSTG1KZVM3?=
 =?utf-8?B?V0VzUmZDS3NPOUV6OVFuTjYyYUJiNWZLMjBucU11NjVaaXo4MHJyMG1Ga3VH?=
 =?utf-8?B?M3Z6ekhaT0gzQ2FaakloQ0FKMkNtT0NGanRyRW52TlNlQWJMRm1URTcxZnJj?=
 =?utf-8?B?L0V4dlRuSW9wbS9ldHNSNFduMFVZWnoyVUpVSytzeGtJOUlGUmJBY1p5THBX?=
 =?utf-8?B?K08rbENHM1ZWUGJpMldueFV4NzVRV0hvU3E5VmF3WjZxZmtCTEFjVW1XT0Jr?=
 =?utf-8?B?WWowcWZ3N1BJSXNNa2JWbmRiSFk4ZjAvOGdpeVErOHpLamYzajFBNU1hWFdQ?=
 =?utf-8?B?dnJsTG5oTmt3VnNIbzVOUWVvVGRjZmtvdFRaU3FvemhQQXkrMUFVUG56bURu?=
 =?utf-8?B?YnA1Vm1sNVFhSnFxUnNFZ3NwVU4rOGxjYWJOUEtObDJ4SmlhRWUrbndsekpL?=
 =?utf-8?B?aTVTU0VDMWtPRUFlWi9jQ1hDOWVKWWt0QkIzN2l1RWxtWU5MTDFRRjZHVmZa?=
 =?utf-8?B?WFpBMGl5NXpSMHVKRDBaTk5qVVE5dlRiZTl0RWhGVW5rNWZCczljeXl3WWRE?=
 =?utf-8?B?SlNBY0NrVnVobmRPemM2Y3lDcVBKSFRWU3hHZjVoKzlvRWo4M3RIZ2hQZDRJ?=
 =?utf-8?B?Y25HeFEvYlV0WWx4NHltcDAzMko3Q2RJaFJ0VmhWOUVPWnY3Z0ZwbTVuRE9v?=
 =?utf-8?B?WjRIQllDSDBPWHpqL3ZSMGdvc2U0eWpOcE9VTWpGNDNmZUI1b0k1ZUdZV0lH?=
 =?utf-8?B?dHpkR2htMXNKWHkwSXA2SUIzNGRPUlRDTXVkNUkzOTBzZWs2RGVoY0FjV1B3?=
 =?utf-8?B?WWZVWk5JZHI2eHJvVkpEeEhzR0VTUm5INncwY1c1a1pMaTFGU0VsKzlHMEty?=
 =?utf-8?B?bytNbyt4WVhsVkMvV09DamkwdmttcFlZVFFFT1VFQXNnSzhJbnhPWkROYllP?=
 =?utf-8?B?UEVvTGtaeTRieTNNY1JUVXRZTmxxRXl4OURlNXUzTWwzTWF5N0hIWVNPQTU2?=
 =?utf-8?B?aXRzOWtyYS9MTGZZTHBURERBTFV3azhaUlpySlozTWV1SUowSmJTY0YrRUNU?=
 =?utf-8?B?UGRlVXFLMmtLVWdxUG5vUXF5VzBhd3l4dlIrOFFCaTBvQklhYVBCZ3NMTHdE?=
 =?utf-8?B?eFhNeXhST0x0NTRNQ0tJOTZ0b0RieVczOHBaL05UVDc0QU13a1BrZlpYSWpY?=
 =?utf-8?B?OTF2a0Iyb3lHZEFZSDB5TGx6a1RDM3hRUVpvUkFSaUZRREtTVUtDcE82cXNr?=
 =?utf-8?B?N2F0NjA5UHZ0WXR1VnhIRERFRkVSSzEyeHlhaHp0RGlaZy81dzlGa1RzK1Vy?=
 =?utf-8?B?VjVFUk15a1EzVVZmQjVnb1l6ZFhrdy9pejZsajI5enhUNUJqN3BuT3Mzd2ph?=
 =?utf-8?Q?vdeE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WEZTampJUXFtZ3hQUUJYcU1Bbmh2cjdGcjJKOEtjT0VDWThKZkkrVFIzRzVw?=
 =?utf-8?B?MDNvdkVXOFdQa1Q3Z0hKMk9kMGxlS3dHWTZrTCtEbzkvSE4vUHhXNGIyNmhv?=
 =?utf-8?B?ZEdWVWFlUzJWNXMzaVRyUmowT0VDcHBnOG8zY1JsK2NjdjNMZFo2V0JCQTUz?=
 =?utf-8?B?TmdKb0xiRE1RZmQ1UXdkTEN6OVcrUk9LVll3bnFuYlJoZjNBL3JqYThmUjB4?=
 =?utf-8?B?SkVERmpxQThXcTU5NThCRzBwZXBlK2NGZ3Q5VFFoUStSSWI4b0gzNmhudTJS?=
 =?utf-8?B?RXpLZFJFaThTRVo3dU1YREJabmo4STZRYTFpRVBUWnNjejliVGtwVS9YODZj?=
 =?utf-8?B?TkUwNTIzQlVMTVRWQnROb0ZxNFdsWlNmSXFxMjF1ako0YXhzUDRTTC85YUVr?=
 =?utf-8?B?OCsrRFV6b2RGc05EczJ0RzNsOEw2TTl2YjVXMU1rVzZVTEZmQzk2eUtQN0xB?=
 =?utf-8?B?L3RnMnJmRDR4eEtGRFR1VGUzTEtDREZsMXNYeU40SzFvZ25DbHEvNk5sOWZa?=
 =?utf-8?B?NkJlU1JtU1Q4cFgxMmF5UHkwQTluVWVBY290MUN3dkoram1ia0RwQlRtUGEr?=
 =?utf-8?B?dXdHNHUxRVUzcTFHeTl5M2tHMDNpeVU0Q0l4ZUZibXFBcWtlUDI5L0p1SkFx?=
 =?utf-8?B?N1g3a1BHdHd1dzJMVDBldTVtcWtLbHE2UXI0a2JkZ3BiZnJwdFAyMFFqSlN0?=
 =?utf-8?B?K0RNcUZINHhmK0M1MzB2QmtadlF5T09vd3QxQnBOZzF5OGFYaHVIREpRVmUx?=
 =?utf-8?B?QndJK0hMNWZ2YzE3YXNXWmFEOG9ISHNwc1ViZW9XcTk2YzdlMDhqZTV1TzBj?=
 =?utf-8?B?eUZFODRnUVJ3V2tnWTArMjRxSzdDMkprUFl4SG94dFBBaUZTMjBRMXRURFNw?=
 =?utf-8?B?Mm1DTTZzcjRjdkpGTG5XbjlOdnY3SGVVZG5DTnRhNlJiSlVxUmZWQSszTWs5?=
 =?utf-8?B?YXdCYzF5TnNWTEhscGFMSWRqU2doc1BCQ09lTWdkcWZiQXdvOUp0Qi9mR29E?=
 =?utf-8?B?SnV5ck9yTzBEUnd5TWY0dkdrRXZGWGtiY2ljYkJpRTFSdDRlNEgwV0M5WTlI?=
 =?utf-8?B?UUhSVXFYVGhmK0ZGc3hCeTlGVy8wbmxXN203UE9kdUluZ1ZoTnZZcDRBMDRs?=
 =?utf-8?B?bTV6bWNlT09XbnVrVWVCb01WdDNSR0N0cm5qZUNJSWJSV0ZXQ1psemlhTWdI?=
 =?utf-8?B?bDlUWGZ2UWlVMTRqSGJTSHltcVh3Q3NjeTZWOWdMalFTL2o5VkZzc3d0Tnl2?=
 =?utf-8?B?WU90YjJXYi9xWlRtM2hyQ1ZUS3UvaDVxdHNXOUVLajFZM0JNYXcwTjYwK0N4?=
 =?utf-8?B?a3NhOFVJcHZTNWtZNE9LNUF1SHdmSWxwQStITk5wWGxkS2pzRjZFU2ZiSzZR?=
 =?utf-8?B?VVNOdjJ5dTA3dlpFTWk4QVJHY0pNZDFZRlpXT2hNdmx0eUYyQzVpSlZ5Njc2?=
 =?utf-8?B?djR2ZnhKc0NQdjFwNG8xOWhzMU9ZU0JpZGpydDk1THk1czNwVzVpQ3QzMytE?=
 =?utf-8?B?RDY0cVBYWEJ2MkhvQVp5QVhXckp0UjlKV0c4QW1tMkZMMEo3QlNwSXNTaWlo?=
 =?utf-8?B?c0JZSUQzZ2d2ZVEvaU82SGsvVWtWeG4wTW5MeHRNejhXV2svbEVjclVGeWd4?=
 =?utf-8?B?MnBuTkkvTnlsdWpWTTZBU3BvaWVqTFByQkRpSEpDS2d6MUtHVlRycFhtc2pn?=
 =?utf-8?B?ZjhCNGoxbXQydTZhakU2RW1kVUpzb2k2Q1o3elkrdWwzMlUreXN4VzJiM1FY?=
 =?utf-8?B?dXEwdWw5ZlRDc3VFdC9xbjJzVEpDOWcrNzc0MVpydXJjWUR1MFFxMDFGMllD?=
 =?utf-8?B?MnFDWUNjcVczVjFMdlExZ0ZLZzhvU3RrRERraVYxcU04ek52MTlmYTlRNElY?=
 =?utf-8?B?dkY1cnBLNEV6KytabTQ3a3djTk13a01RdEJVYkk2TTVhT0F4QWRSWmxjTllt?=
 =?utf-8?B?djZGbWh4eHZObzVQV1M3Q3JRaGYraXVCY3NZZm5XNmcwdkJSVGc1Tkg3ZXhn?=
 =?utf-8?B?YXBJNnNZSWZWSmErdUpTdjB4VlVwYkNGZ1dCdnIxRGNxeWxqbmVFT1h2V3o3?=
 =?utf-8?B?cFVXenRXVVNrVXc4T3V1azN5Z28wUjVQM0ZCZmtEeUFaSVpXVk5rb1oyODhM?=
 =?utf-8?B?RDVjSDlQM2p4a2xzc3BOd1FQZWhHRDZ0QlJKTXRwdURHalJXcHlJN0oyN1dj?=
 =?utf-8?B?aUdockNWWXpLMHlTNW96SkpKVmh3bGxZbWx1eEl2L1pxV1NWT2x2VmNlbGlB?=
 =?utf-8?B?MW5vOXVVYWJNeXd1MkpRU0JhaFdYNlVWdVB4cHFoZGdQc3E0WEI0Tk80bHZt?=
 =?utf-8?B?UjNYN1lwUlFKeTh5NGJKc2lmSkhDSldvSkhFMjViZHlSbDhaQ3RCYUYzaSsx?=
 =?utf-8?Q?Ecup2alVurQINSn4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b06db2f-de36-4023-e8e3-08de637df884
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 23:43:02.6141 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fJFqV7gF5TIrEQuS62UjAUBB5fofnDujoBivuFx6reJGqPGF3n7C5yu8ICvED3ghdPKips+MC+pSidvAj5pSrlHsFEoETfr2qwZgTqtYeJM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7330
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



On 2/2/2026 5:37 PM, Daniele Ceraolo Spurio wrote:
>
>
> On 2/2/2026 5:02 PM, Daniele Ceraolo Spurio wrote:
>>
>>
>> On 1/30/2026 12:50 PM, Julia Filipchuk wrote:
>>> Corrects a failure on context switch. On registration of context with
>>> indirect ring state will correct state of targeted and idle command
>>> streamers.
>>>
>>> If Wa is unavailable, notify and disable indirect_ring_state.
>>>
>>> Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/abi/guc_klvs_abi.h |  1 +
>>>   drivers/gpu/drm/xe/xe_guc_ads.c       | 10 ++++++++++
>>>   drivers/gpu/drm/xe/xe_wa_oob.rules    |  5 +++++
>>>   3 files changed, 16 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h 
>>> b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>>> index e33bd622ab44..69e6d9f9650c 100644
>>> --- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>>> +++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>>> @@ -496,6 +496,7 @@ enum xe_guc_klv_ids {
>>> GUC_WA_KLV_WAKE_POWER_DOMAINS_FOR_OUTBOUND_MMIO = 0x900a,
>>> GUC_WA_KLV_RESET_BB_STACK_PTR_ON_VF_SWITCH = 0x900b,
>>> GUC_WA_KLV_RESTORE_UNSAVED_MEDIA_CONTROL_REG = 0x900c,
>>> + 
>>> GUC_WA_KLV_CLEAR_CS_INDIRECT_RING_STATE_IF_IDLE_AT_CONTEXT_REGISTRATION 
>>> = 0x900e,
>>
>> Maybe we could try to make this define a bit shorter? something like:
>> GUC_WA_KLV_CLR_CS_INDIRECT_RING_STATE_IF_IDLE_AT_CTX_REG
>>
>>>   };
>>>     #endif
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c 
>>> b/drivers/gpu/drm/xe/xe_guc_ads.c
>>> index f4cbc030f4c8..1c563a01c12c 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
>>> @@ -360,6 +360,16 @@ static void guc_waklv_init(struct xe_guc_ads *ads)
>>>       if (XE_GT_WA(gt, 14020001231))
>>>           guc_waklv_enable(ads, NULL, 0, &offset, &remain,
>>> GUC_WORKAROUND_KLV_DISABLE_PSMI_INTERRUPTS_AT_C6_ENTRY_RESTORE_AT_EXIT); 
>>>
>>> +    if (XE_GT_WA(gt, 14025515070)) {
>>> +        if (GUC_FIRMWARE_VER_AT_LEAST(&gt->uc.guc, 70, 53))
>>> +            guc_waklv_enable(ads, NULL, 0, &offset, &remain,
>>> + 
>>> GUC_WA_KLV_CLEAR_CS_INDIRECT_RING_STATE_IF_IDLE_AT_CONTEXT_REGISTRATION);
>>> +        else {
>>> +            /* Disable indirect_ring_state when workaround not 
>>> available. */
>>> +            gt->info.has_indirect_ring_state = 0;
>>> +            xe_gt_notice(gt, "indirect ring state requires 
>>> workaround present in GuC firmware v70.53.+\n");
>>
>> With v70.53.+ I can't understand if you mean "70.53 or newer" or 
>> "70.53.*" (although both mean the same thing). Maybe just v70.53+ 
>> would be clearer?
>> Also, shortening some of the words should make this fit within the 
>> 100 char limit, e.g. "indirect ring state requires a WA present in 
>> GuC v70.53+"
>>
>>> +        }
>>> +    }
>>>         size = guc_ads_waklv_size(ads) - remain;
>>>       if (!size)
>>> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules 
>>> b/drivers/gpu/drm/xe/xe_wa_oob.rules
>>> index 5cd7fa6d2a5c..1da3a8f96f98 100644
>>> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
>>> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
>>> @@ -69,6 +69,11 @@
>>>           MEDIA_VERSION(3002), FUNC(xe_rtp_match_psmi_enabled)
>>>   16023683509    MEDIA_VERSION(2000), FUNC(xe_rtp_match_psmi_enabled)
>>>           MEDIA_VERSION(3000), MEDIA_STEP(A0, B0), 
>>> FUNC(xe_rtp_match_psmi_enabled)
>>> +14025515070    GRAPHICS_VERSION(2004)
>>> +        MEDIA_VERSION_RANGE(1301, 3000)
>>
>> We usually avoid using big ranges that cover multiple gens, because a 
>> new derivative might be added for an older gen that doesn't require 
>> the WA.
>
> To clarify, this isn't a blocker, since we do have exceptions. As long 
> as you've confirmed we don't expect this to change for derivatives 
> we're good.
>
> Daniele
>
>>
>>> +        MEDIA_VERSION(3002)
>>> +        GRAPHICS_VERSION_RANGE(3000, 3001)
>>> +        GRAPHICS_VERSION(3003)
>>
>> According to the WA database this also applies to Graphics 3004, 3005 
>> and 3511 and Media 3500 and 3503

Looked at this again with Julia earlier today and confirmed this doesn't 
actually apply to G3511 and M3503, I had just misread the database. It 
does still apply to the other missing versions.

Daniele

>>
>> Daniele
>>
>>>     15015404425_disable PLATFORM(PANTHERLAKE), MEDIA_STEP(B0, FOREVER)
>>>   16026007364    MEDIA_VERSION(3000)
>>
>

