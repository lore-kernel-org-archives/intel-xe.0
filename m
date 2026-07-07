Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54A0CC43458
	for <intel-xe@archiver.kernel.org>; Tue,  7 Jul 2026 07:48:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12AFD10E460;
	Tue,  7 Jul 2026 07:48:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R8S+JuGY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9B2210E460
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Jul 2026 07:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783410479; x=1814946479;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=B3nAGqg4tjjEQcYwJqX0tRiLF+CmFqBHOeA30rWacY0=;
 b=R8S+JuGYXA2gWRKoSxEYgdYhvfw+zfIZ40mGQEm2+Z8Xd1feapyHRB8l
 nvi73gac5DcEw3OjLGRhnCQDFHKVp/R1ePZVqXnS3BRxXFTMtN974IkJP
 p4iVMtgkj+AocJo1dAoXCFnaO6tzHS5PKUbXBPrRW1jrpTBf4MSMV3IYr
 VkjJph+bRxQoRmwpEBd3DEgvJ0KU3A77JNCuszAFCBJe7FFDy2RInn6y4
 hvZ3QsZUkyyH4gOQaLoOQePu29BiLscdQ/SS7AYRUhuRdGZhBFSUYO0l6
 25euTN1IMd6+hv4xd++6x0HHq7/2HFLtfD5TlSvZr3XfuorCR9XVg51Ce A==;
X-CSE-ConnectionGUID: m7xhLsVvQKi4RQP48Uaoow==
X-CSE-MsgGUID: ZI0Szo4oR0OYD0MY8YJ4Ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11839"; a="71572619"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="71572619"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2026 00:47:59 -0700
X-CSE-ConnectionGUID: w7uX3omLRR+uACp5YuVqww==
X-CSE-MsgGUID: wWnSMGGOS5+ic9htTuSWJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="257799845"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2026 00:47:59 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 7 Jul 2026 00:47:58 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 7 Jul 2026 00:47:58 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.50) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 7 Jul 2026 00:47:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PAEFsLppG4wON71rkmPDhz2BqAF/i0y+8q52Z4LHlhk08Qdd53d/xF428QHWlSke/DHO8SHYYl8mHiwOMZi/N3X8y3Sih06rFE+TPB1TXBWMxkig+Ke8l2MuXiPG6nqG2hw42qREfGv8b1GcaGlZKgfh7Hj2WUhQ98bHK4jxY0Gd9lJX4au4FxVEQVH0XCp5a8B52ByYxtnnQcKDf2qvu5d0mgfL2w5wtQZemReMct6XqEELz/xLYnkdvE+kAAWUKyVisiHgmfFScklTMbVe4eL8z/DhmqX0216GHCsNDCPO3JPSomb60ha1tkyeSHmlJEOf9LGxhZFQGTL5KjU5zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZtNayyPt1k+7oxhIGQ1RFAG31uB2VZjM8ZjmP7CAeSQ=;
 b=IngBcBVDTZrxvqmW1SX81t+le/UrX6ZoDmEyrXMe7DQ4QedkF/Jeg5ozFTebLDXHtNojj+cYXI+OlR1LR3xjjaUTfs7K2POCVdF6mf0mv+Y8Me9TA3EywGIRLWiA46hXhfQfWipNmgrV0uWwd74SjxAtnhYWogbzPpuZX0/6X2trYxVFh7ossLtByB9didS1GAduNQJZ8RnR5cumA4qd2CgRmgIyCiDU/SPxBao4TipY23QwRDB6lCH+X7Nzs2xFcNeJe10ysvCfK9HrVqN+hhCMYUk9yGxUmYQp4cvY4UWETwMR0i5b+wsZlhGNKYvUuGOdCW7+CrIiSNZkNOYGnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SA2PR11MB5145.namprd11.prod.outlook.com (2603:10b6:806:113::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.13; Tue, 7 Jul 2026 07:47:55 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0181.009; Tue, 7 Jul 2026
 07:47:55 +0000
Message-ID: <36bfb523-9c4c-4e1c-bbc8-b0ae851cf241@intel.com>
Date: Tue, 7 Jul 2026 13:17:46 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9] drm/xe: Consolidate debugfs fault injection functions.
To: Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <vinay.belgaumkar@intel.com>, <karthik.poosa@intel.com>,
 <sk.anirban@intel.com>, <raag.jadav@intel.com>
References: <20260706231837.201726-2-mallesh.koujalagi@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <20260706231837.201726-2-mallesh.koujalagi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0148.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b9::13) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SA2PR11MB5145:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f6d293f-6f89-4a7a-7503-08dedbfc0e5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|11063799006|6133799003|22082099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: 27VGb4hrrbsqdQzoTpBX9r7iJfdf6vGnhmW2qkBEoiMLH1A+rvQgNxz2mrjymMenwBKB36AuCNdNJxQtRBQZuHA9F0D0zrLd/XtZMLIng6AeaOhuB8mlP3+LsWCTIuFfr4woiVOSjRV1zZnpGGYP2KTYVENtBaHA2EhXMvH4G55Yt37zu6fSLi11F/PLOGBEJ+A8kDm5xiF1NcepfGMdi9jM5sFozAYTzEiDqhYMU6OCfDKvF4IO8iFHl+Vslwdy/AM9kHSOBOEYfi1pTWC5C3H9LuTnzaAU43BsBbrGnfbtgznLmgI1MBVM14Nm9cBPOREjV8xbOMtVxzGPTCjWm30zJPyngg6g6rrY6yjf8xw3f89gemI53p5bVaSkYKgUUdIG5ZTowCNpP/nGsPr1SFPb20seS991LZ5QKyIqdhBtE+Qf7Gb5fcNf0kkbSgpXoJ0q18xF/3qQqTnmMaVPT4wuhpBlJ6hG7AQdwrcRWOAbLcLKxTcAqk6FneI5W5Zb1Z4UNRMmzoRdX2swPnhtpQNZ5B24w2CoVJDzy1HoT0/EZm/BdeWGyPYAlqCh535J5PXfcoUvjOLHx7ewCleNqE8K/zbKgaZFm94eX/F40gKIATkTbAHBSCbRwS0UFpzkjWeHHckrHOJhtv67A8xE9/bbtIJv1BIRtbR2jaVeAmo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(11063799006)(6133799003)(22082099003)(56012099006)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b2VoaUtqYzQyRFVkOGlsMVUyVlhiOVorWVNuMHhFZ1FSQ040MEI4bmVXQ2dG?=
 =?utf-8?B?OEJmWXA4Q1hYTTZ0VUIzeEcxMWZvcEZ0MzN2WVJSUStNcnZaaHV6OWtWWGIx?=
 =?utf-8?B?T0ZzUGZ1c3p0dWM4RkVYY0NLZnFjeDd5U2tqL2xSWGF2NkZ2YlZUMnhVYXpE?=
 =?utf-8?B?MDNrR1lETDkvT0RWMFJwL2d2WUFhUWliSzVLZmNpNHQvbDN6T295ZTc2VU9D?=
 =?utf-8?B?R3VwYndvM0k2WjJUR0U5T2FNRjZCSnhtUEZVR2ZsTE9DZVlINFNybXVjRGJo?=
 =?utf-8?B?Vmk3TDNvanBWaExKN2xtQVJwbXlPcWNzUi8rdkJwY2NVUTJzbmsrYUc2NWsr?=
 =?utf-8?B?dnpLWjUva3RGam1lbVV6ODVaZ1J4enZZRDgvV1dBNFlTeHRPdFEwWWoxby9m?=
 =?utf-8?B?L0NYaWZrZFdtS1BoRHQ5WWFqK0FvdVdIc1lpMENvRFliZklvblNNOFlzVVV4?=
 =?utf-8?B?UUc4VG5vRFVrbndRTlRYSEtkUzVLcGNGL2Y2MHpVaE5GY3ZMOHFDclY2eHcr?=
 =?utf-8?B?MCtJS2ZLMVFITDdSVlFaS0tSclRtTmJrdHhrMDFWckE4RzlHaTYreHRPSHVO?=
 =?utf-8?B?a2lnZ3hoNVhpSjIzUDdLdXJ5bjk4YU5SLytnM2oxYWZFelVYNE5oRVFWQ0Fq?=
 =?utf-8?B?bXVNenpnVFBweEduZVk5aFlGa3NXRzc0a0xQNk1zR0pGR3k1RWlQYS9oUDBH?=
 =?utf-8?B?V2o3S1AzYU1aejZkRWxEenJua3g5am9jMGlyMWs2c2ZrU3VSYVBIeFpnZ1Zi?=
 =?utf-8?B?VEdZNHBxdHRlWk1QQlRzeEVuM3RzbGRYK0NCQXR1bmxOWTM5Rjd5UkZrVklB?=
 =?utf-8?B?TXVGZkZiNlhGc1JrOWNYMHd5TkVNZVFqSTFRUFlTWUdoSFlBdTNuRmZMd00y?=
 =?utf-8?B?bnVnNVlkTDJjU3RQdi9renFuMGJlVThzM1haTkZNYkJRNjBSYWc0cTZEMGtp?=
 =?utf-8?B?VEhKWUphbE1YdWN1aEZrZTlmcTVKRWJSazM0ZjdTNmdHcVFzNWhGN2g3ei80?=
 =?utf-8?B?YUlydmRSdkdxNTl2MGNibUFJend5NEdOWVZNalk3QXFZLzIvUGRaNHdpYkYz?=
 =?utf-8?B?YnZGdnhqK0Vwd3FGNmNBZWl3dkt1NjVVVkJmN1AyQlNXekh6dVMzcEV6U1cr?=
 =?utf-8?B?SnkvMWE5Rk9jNkxBaHBLL1R2ZjBwTytrcVdEbzNmVUxiQmpMd1pIM1lCcGxk?=
 =?utf-8?B?djlORXJ1YU1hak5NRHY1SGNkOU1zWlZKWExiY3ZtWjQ3NWUwQWN6dU9VNEsy?=
 =?utf-8?B?UHptUzVmbmxadUNtdGhObGl2VXVUa2ZRUE5VOFQ4UVYwUENVZHdRZzFNOUIr?=
 =?utf-8?B?bTFNbXVPN1RlQTdoNjN1WVVzZEg5RkdFNHFVSmVUd1dtUTEwck9JVndWSTRs?=
 =?utf-8?B?MitDWEJlQUR1bTBvejIzQ1hrMUYya0tXblZicEliay9EL0RCZm5hdHk4VWJC?=
 =?utf-8?B?RTBhanlUbzNWNGtad2FFRjRGdUQ5U28zM1FhNFpRUkM1Vk5TMkY0YzVGWlo3?=
 =?utf-8?B?VmFDQmRvQjd2b3gzZFZoQnRhdmxHM0hGNjlxc0ZzbkFNVG1MYmk0SEhFZ0tY?=
 =?utf-8?B?aXlVU01NM0pKVFV0MDJhU1BwSDVCdEo1TDhONkd2SHBhUzNKS1dxOXJmbXFM?=
 =?utf-8?B?OEFSbGFESTBwMnVOeUh5SFMxRk1NMG1UcjRGTUZjNU0wdnRwUlJZeWp3dm55?=
 =?utf-8?B?UVBKWXkvZGp4M2Z3YjlSd3FNL2FTWTdwS1B6KzFWbXhmTnN2UGtEdEt1K0ZB?=
 =?utf-8?B?cG9KdzZDZC9SS3NVNytpWXQ2ditjYi9SR3FldHhlZjJXY3hqVHRtaUFZeXA1?=
 =?utf-8?B?ZFkzZWt0dEVHUGlNOTljUm9kWldqb3dRMkhuejd3MnRuTlFUQ1h0TWtTdVlu?=
 =?utf-8?B?c25ZTnlEOFBmcDM4VnBqY1dQcVJRZjJ2SWY5WDR6eEY2cXh5N3FzSHVQcUJC?=
 =?utf-8?B?dmtHd25BYXpGczN2a3ZlbXJ0aHJIK08yblJjaGxKTkJmRStFWVZFakNpMWg0?=
 =?utf-8?B?ckd5Mi9qRFR6WXhUY0RMcjdyWEltT3Q0cm9oOW9HeURCZkxVUWpQVmtlL1hX?=
 =?utf-8?B?SEpVNGtvYlkvSzRXaTBROHU1NExYZ09RWHFNZ0ZXZVBnZEJYY3B4cENEeHpx?=
 =?utf-8?B?d2ZpelNtbk5yZktlczhvSFZjVDRKTStiNE9SSlBPT2ZTbE5VZi81S0JFTVAr?=
 =?utf-8?B?eDJjN1h6dXdOSS92Y0pSbVdyZy9NWFBCNGZRa2tVQ1IzOTYyODRTQmhEU1Nq?=
 =?utf-8?B?WWpHVDNoazBqNTZKWXIrZ3YrL2U1QTl1dThrSFU5OVoySXlqb01kV3ZOc2My?=
 =?utf-8?B?VWlrekF4MDBSbUcwSU1XWWtLYjFtYkhORndCL29ONk51QlpXaDZuUT09?=
X-Exchange-RoutingPolicyChecked: CSrIgVDR81JEC2kKOS20kFmiKUZfJHLnkSF2ZtZBWGRw0Ztpw6h3lvxESnNLyGR4EnyAWvZ4LU65CwJg3+qnIRFpgk0j4QeW/Dq6kX9G0PgmprXZVUcap4FBHAmpv304nNIlukkGIE1J8ytadJXeC2x2NTXhFAzwg+QtSAISdwowzSRVlBzuH2Y4cFsJBIlWh8ZDQzllRPNzVQzqdtSQ/kTvwOSLqLn5uU8Ymlvmf06+9bZ6dfmgtHsJUlri6R//mLwxV7u0FF+85XWZNW1NdJUyvuZJBOEjF2H7Nwmw+g8bkvMnU5mBibpdIzCaZQYAlekVEsnscptf/1WMgqlCeA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f6d293f-6f89-4a7a-7503-08dedbfc0e5f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 07:47:55.6690 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pw8S9UUS78c4mVHU1vLOboVcZMfQIP2Z71hseFZYuZoAm/GCvshpsl+NZXwHoneuk04jYJHT7Yt+04H1Lj7h2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5145
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


On 07-07-2026 04:48, Mallesh Koujalagi wrote:
> The fault injection code was scattered: the GT reset
> hook lived in xe_gt.h as an inline function with its own global
> variable, the CSC hook had a separate global in xe_hw_error.c with
> an extern declaration, and each was individually registered in
> xe_debugfs.c. Adding a new error type meant editing many files and
> copy-pasting the same boilerplate.
>
> Debugfs interface (under /sys/kernel/debug/dri/0/):
>   - fail_gt_reset         - GT reset failure
>   - inject_csc_hw_error   - CSC firmware error
>
> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
> v2:
> - Add multiple platform support. (Vinay)
> - Handle VF properly.
> - Rename to XE_FAULT_GT_RESET/XE_FAULT_CSC_HW_ERROR and
>    create xe_fault_inject_types.h file including those name.
>
> v3:
> - Solved patch apply issue on tip.
>
> v4:
> - Add proper header file.
>
> v5:
> - Properly refer FAULT_ATTR_INITIALIZER. (Vinay)
> - Change xe_fault_inject_descs to xe_fault_inject_entry.
> - Change 2025 to 2026.
>
> v6:
> - Change return comments of xe_fault_inject(). (Riana)
> - Remove full description of xe_fault_inject_debugfs_register().
>
> v7:
> - Move all fault inject helper functions in xe_debugfs.c (Riana)
> - Update commit message.
>
> v8:
> - Assign .attr pointer with DECLARE_FAULT_ATTR macro. (Riana)
> - Remove CONFIG_FAULT_INJECTION block.
>
> v9:
> - Add single availability callback.
> - Make an abstracted function. (Riana)
> - Fix xe_fault_inject_entry struct.
> ---
>   drivers/gpu/drm/xe/xe_debugfs.c  | 45 +++++++++++++++++++++++++++++---
>   drivers/gpu/drm/xe/xe_debugfs.h  | 19 ++++++++++++++
>   drivers/gpu/drm/xe/xe_gt.c       |  5 ++--
>   drivers/gpu/drm/xe/xe_gt.h       |  8 ------
>   drivers/gpu/drm/xe/xe_hw_error.c | 11 ++------
>   5 files changed, 66 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index 8c391c7b017a..1d1261943676 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -5,6 +5,7 @@
>   
>   #include "xe_debugfs.h"
>   
> +#include <linux/bits.h>
>   #include <linux/debugfs.h>
>   #include <linux/fault-inject.h>
>   #include <linux/string_helpers.h>
> @@ -42,6 +43,46 @@
>   DECLARE_FAULT_ATTR(gt_reset_failure);
>   DECLARE_FAULT_ATTR(inject_csc_hw_error);
>   
> +static bool csc_hw_error_available(struct xe_device *xe)
> +{
> +	return !IS_SRIOV_VF(xe) && xe->info.platform == XE_BATTLEMAGE;
> +}
> +
> +static struct {
> +	const char *name;
> +	bool (*available)(struct xe_device *xe);
> +	struct fault_attr *attr;
> +} xe_fault_inject_entry[XE_FAULT_MAX] = {
> +	[XE_FAULT_GT_RESET]	= { .name = "fail_gt_reset",
> +				    .attr = &gt_reset_failure },
> +	[XE_FAULT_CSC_HW_ERROR]	= { .name = "inject_csc_hw_error",
> +				    .available = csc_hw_error_available,

is_visible would be better and matches kernel pattern.

> +				    .attr = &inject_csc_hw_error },
> +};
> +
> +bool xe_fault_inject(enum xe_fault_type type)
> +{
> +	if (type >= XE_FAULT_MAX)
> +		return false;
> +
> +	return should_fail(xe_fault_inject_entry[type].attr, 1);
> +}
> +
> +static void xe_fault_inject_debugfs_register(struct xe_device *xe,
> +					     struct dentry *root)
> +{
> +	int i;
> +
> +	for (i = 0; i < XE_FAULT_MAX; i++) {
> +		if (xe_fault_inject_entry[i].available &&
> +		    !xe_fault_inject_entry[i].available(xe))
> +			continue;
> +
> +		fault_create_debugfs_attr(xe_fault_inject_entry[i].name, root,
> +					  xe_fault_inject_entry[i].attr);
> +	}
> +}
> +
>   static void read_residency_counter(struct xe_device *xe, struct xe_mmio *mmio,
>   				   u32 offset, const char *name, struct drm_printer *p)
>   {
> @@ -583,8 +624,6 @@ void xe_debugfs_register(struct xe_device *xe)
>   		drm_debugfs_create_files(debugfs_residencies,
>   					 ARRAY_SIZE(debugfs_residencies),
>   					 root, minor);
> -		fault_create_debugfs_attr("inject_csc_hw_error", root,
> -					  &inject_csc_hw_error);
>   	}
>   
>   	/*
> @@ -642,7 +681,7 @@ void xe_debugfs_register(struct xe_device *xe)
>   
>   	xe_psmi_debugfs_register(xe);
>   
> -	fault_create_debugfs_attr("fail_gt_reset", root, &gt_reset_failure);
> +	xe_fault_inject_debugfs_register(xe, root);
>   
>   	if (IS_SRIOV_PF(xe))
>   		xe_sriov_pf_debugfs_register(xe, root);
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.h b/drivers/gpu/drm/xe/xe_debugfs.h
> index 17f4c2f1b5e4..ec2c694cfca3 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.h
> +++ b/drivers/gpu/drm/xe/xe_debugfs.h
> @@ -6,8 +6,27 @@
>   #ifndef _XE_DEBUGFS_H_
>   #define _XE_DEBUGFS_H_
>   
> +#include <linux/types.h>
> +
>   struct xe_device;
>   
> +/**
> + * enum xe_fault_type - Fault injection types
> + * @XE_FAULT_GT_RESET: GT reset failure injection
> + * @XE_FAULT_CSC_HW_ERROR: CSC hardware error injection
> + * @XE_FAULT_MAX: Number of fault injection types
> + */
> +enum xe_fault_type {
> +	XE_FAULT_GT_RESET,
> +	XE_FAULT_CSC_HW_ERROR,
> +	XE_FAULT_MAX
> +};
> +
> +bool xe_fault_inject(enum xe_fault_type type);
> +
> +#define xe_fault_gt_reset()		xe_fault_inject(XE_FAULT_GT_RESET)
> +#define xe_fault_csc_hw_error()		xe_fault_inject(XE_FAULT_CSC_HW_ERROR)

Can you try macro instead.

Thanks
Riana



> +
>   #ifdef CONFIG_DEBUG_FS
>   void xe_debugfs_register(struct xe_device *xe);
>   #else
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index d904527a8898..dfdacc0f6de9 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -21,6 +21,7 @@
>   #include "regs/xe_gt_regs.h"
>   #include "xe_assert.h"
>   #include "xe_bb.h"
> +#include "xe_debugfs.h"
>   #include "xe_device.h"
>   #include "xe_eu_stall.h"
>   #include "xe_exec_queue.h"
> @@ -926,7 +927,7 @@ static void gt_reset_worker(struct work_struct *w)
>   
>   	xe_gt_info(gt, "reset started\n");
>   
> -	if (xe_fault_inject_gt_reset()) {
> +	if (xe_fault_gt_reset()) {
>   		err = -ECANCELED;
>   		goto err_fail;
>   	}
> @@ -986,7 +987,7 @@ void xe_gt_reset_async(struct xe_gt *gt)
>   		return;
>   
>   	/* Don't do a reset while one is already in flight */
> -	if (!xe_fault_inject_gt_reset() && xe_uc_reset_prepare(&gt->uc))
> +	if (!xe_fault_gt_reset() && xe_uc_reset_prepare(&gt->uc))
>   		return;
>   
>   	xe_gt_info(gt, "reset queued from %ps\n", __builtin_return_address(0));
> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> index 4150aa594f05..f8e3ca63aabb 100644
> --- a/drivers/gpu/drm/xe/xe_gt.h
> +++ b/drivers/gpu/drm/xe/xe_gt.h
> @@ -6,8 +6,6 @@
>   #ifndef _XE_GT_H_
>   #define _XE_GT_H_
>   
> -#include <linux/fault-inject.h>
> -
>   #include <drm/drm_util.h>
>   
>   #include "xe_device.h"
> @@ -38,12 +36,6 @@
>   	xe_gt_is_media_type(gt_) ? MEDIA_VER(xe) : GRAPHICS_VER(xe); \
>   })
>   
> -extern struct fault_attr gt_reset_failure;
> -static inline bool xe_fault_inject_gt_reset(void)
> -{
> -	return IS_ENABLED(CONFIG_DEBUG_FS) && should_fail(&gt_reset_failure, 1);
> -}
> -
>   struct xe_gt *xe_gt_alloc(struct xe_tile *tile);
>   int xe_gt_init_early(struct xe_gt *gt);
>   int xe_gt_init(struct xe_gt *gt);
> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
> index 4a4b363fc844..ad2ec603df4e 100644
> --- a/drivers/gpu/drm/xe/xe_hw_error.c
> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
> @@ -4,7 +4,6 @@
>    */
>   
>   #include <linux/bitmap.h>
> -#include <linux/fault-inject.h>
>   
>   #include "regs/xe_gsc_regs.h"
>   #include "regs/xe_hw_error_regs.h"
> @@ -12,6 +11,7 @@
>   
>   #include "xe_device.h"
>   #include "xe_drm_ras.h"
> +#include "xe_debugfs.h"
>   #include "xe_hw_error.h"
>   #include "xe_mmio.h"
>   #include "xe_survivability_mode.h"
> @@ -25,8 +25,6 @@
>   						 (PVC_COR_ERR_MASK & REG_BIT(err_bit)) : \
>   						 (PVC_FAT_ERR_MASK & REG_BIT(err_bit)))
>   
> -extern struct fault_attr inject_csc_hw_error;
> -
>   static const char * const error_severity[] = DRM_XE_RAS_ERROR_SEVERITY_NAMES;
>   
>   static const char * const hec_uncorrected_fw_errors[] = {
> @@ -167,11 +165,6 @@ static_assert(ARRAY_SIZE(pvc_master_local_nonfatal_err_reg) == XE_RAS_REG_SIZE);
>   						 pvc_master_local_fatal_err_reg : \
>   						 pvc_master_local_nonfatal_err_reg)
>   
> -static bool fault_inject_csc_hw_error(void)
> -{
> -	return IS_ENABLED(CONFIG_DEBUG_FS) && should_fail(&inject_csc_hw_error, 1);
> -}
> -
>   static void csc_hw_error_work(struct work_struct *work)
>   {
>   	struct xe_tile *tile = container_of(work, typeof(*tile), csc_hw_error_work);
> @@ -517,7 +510,7 @@ void xe_hw_error_irq_handler(struct xe_tile *tile, const u32 master_ctl)
>   {
>   	enum hardware_error hw_err;
>   
> -	if (fault_inject_csc_hw_error())
> +	if (xe_fault_csc_hw_error())
>   		schedule_work(&tile->csc_hw_error_work);
>   
>   	for (hw_err = 0; hw_err < HARDWARE_ERROR_MAX; hw_err++) {
