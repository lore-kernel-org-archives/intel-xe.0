Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FF05C4345F
	for <intel-xe@archiver.kernel.org>; Mon, 22 Apr 2024 16:55:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC6D211284C;
	Mon, 22 Apr 2024 16:55:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Palmn28E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C03FD11284C
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Apr 2024 16:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713804922; x=1745340922;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=wQ05LbXSQ5RZMJ2qzdEqK5cj8vTypDbPzy1FSDqFaQE=;
 b=Palmn28EhvG9gzoB2h8diESnTVdWyq41gu0PrArDkllKbhyDk1XQsIX2
 +GJ7QzclbfvdVvAYhQ4iW1VXVZpxJkOMLUh4iJEzHNLfGd8dRPLG3Vm2j
 GMLTRaFJeYh5MrSJNrRWp864U/o3A2MVEFreDLjBBOzNuvoc29SgyUadP
 /nesVDp8utASVw6lX5jQZYEhSY3b5dXZrdqvmyMSFwZdpSOeqYQYUW6YL
 KDVXN/0T58PbI5twEaps9PLVzqha6cS5I66+S2fyrvETioFkOtwQLCdQZ
 KxNRD9fUiSfB7Py5SWIAPwgJBw/GM2m14H3vxCEpAmjwSfHIzDI2NXDSX Q==;
X-CSE-ConnectionGUID: 0gFhR6VYT1mFBN/TAJu+/g==
X-CSE-MsgGUID: YteuAhmnSNWEOqtx6YyKSg==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="9523852"
X-IronPort-AV: E=Sophos;i="6.07,221,1708416000"; 
   d="scan'208";a="9523852"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2024 09:55:22 -0700
X-CSE-ConnectionGUID: 07K+bV+7QQ+7jdf/r+hxOg==
X-CSE-MsgGUID: lI1QJGYHTg2KLPsmP2drzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,221,1708416000"; d="scan'208";a="61515953"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Apr 2024 09:55:22 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Apr 2024 09:55:21 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Apr 2024 09:55:20 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 22 Apr 2024 09:55:20 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 22 Apr 2024 09:55:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hfptg+bE8y+f68/u+sfamB3AM5+/pgid2awcpTtWtG6n+gLU89hhlzQDTbfOvGN51jrlCTGmnGjARE4bzmSuOSoy7bKuHv53pI77rXGaSX4oEDRUPfDzNa3FKfhVBO2fbiSXfKDxmdzkE2yKvN2DUHs7E3c5RSDi+0XCg68eXc6NuI/R0teAnxh90T1WDmXYomuByjhD9X8V4ZNRD8e7LzyHcd2nVAV+IkGElB5Ehq08beoJySJJIRBMIt4YGP/iepFTYj3ECKDx1EEYFV8E6TXmffgE721WtHHr/ZQ+6QyLsxoBP10yHmLYb73UFlO3anbSZ3/d7TGMQ51v/p5yZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4VhnKo6+sbjKZ+M+CNL8mDkLCzAKIVR2xRGQI3YEJAQ=;
 b=CfgQcTdOlLn3yhSf43jlUAEIZmSrKsqNJ/qqTxzVaTCzwCLnnE46qZMzubIMmrEuYYkMA57h0OcPaj8IEySevYDvzt1YTE4qEqAO2S2x5ZjnlsEBQtolqHjxXBLmKhHfOCcFdOB2cQbNzQRZftJ5+lwK9v9SH7akZyRYiUAsZLrsh5yinQqaJEoX5vVj4Yeyfln2w1J69I/ICQEHbKjRmsJPPXsHo8Kv7wD6yrOsfEbjlh209HTNAjzhUyndDoEZJP923UdHwAR/nxWfxdmW8570QgnsMl2wYFIPdq1EVtEnbuA+NipchBW8fw0bNRzX39aB1SR3cuNy0wdpH2xyqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by PH0PR11MB4901.namprd11.prod.outlook.com (2603:10b6:510:3a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.20; Mon, 22 Apr
 2024 16:55:18 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b867:cbf6:e190:6eb]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b867:cbf6:e190:6eb%5]) with mapi id 15.20.7519.018; Mon, 22 Apr 2024
 16:55:18 +0000
Date: Mon, 22 Apr 2024 18:55:16 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/3] drm/xe/pf: Expose SR-IOV VF control commands over
 debugfs
Message-ID: <20240422165516.kgmix53ktdezy6g6@intel.com>
References: <20240418203442.226-1-michal.wajdeczko@intel.com>
 <20240418203442.226-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240418203442.226-3-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MI2P293CA0013.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:45::8) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|PH0PR11MB4901:EE_
X-MS-Office365-Filtering-Correlation-Id: 210bb05b-64f3-4227-820f-08dc62ecfd6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aFhscnN2Ny9QUTVQdE1wcXNRREVodXQrMlhQWXFvOHBId05XblBCOXl5Mllh?=
 =?utf-8?B?VE5WZ3FiNkdueWtBS1c2Wmx2V2dsWE5mWlRld2lzNTRSREJaejVvcDQ1aEdI?=
 =?utf-8?B?WTIzcDAydlZFNndGNHBUNkNCQ21BZk9kSTAwZmxTcE4rbVVMc2w4WFdxbDVS?=
 =?utf-8?B?ZmkxdVFDZGQ1cnpUWDE2Zlk1UU9xemFmbWpsN0Y2L3pGWVFxS0U5cWxVSkRy?=
 =?utf-8?B?bmpGRkxjcmQ2c1BXeU9CWWgvZlhtMWQ4eEJCaTdKYmEzcC9IQjJtYnRBWWtl?=
 =?utf-8?B?VDl4MGdIdE8xRWlIOHVXc0NkSWhnVjdoa2RZY0xQdDJlL2Z6YTNuYXZnejdv?=
 =?utf-8?B?MzJTczdoV2R3bDNCTTc2aUllYkxKd0lxRXRtUEx4aGVzOVRUZmRjT0JDZVll?=
 =?utf-8?B?UzdjQXV3QUJnYlY3ZzNFSGdJM1EzemE3cEE3c0h0NlRXSGdrT0dKaTlMdmVZ?=
 =?utf-8?B?VXZRbkkvK1ZEL2Fnc3ZlVXZrMEV3SWR3VEc2bmFhRERzZlFZb2w1NnBZamVj?=
 =?utf-8?B?SUNrMjhiMVJZZjRiTzZybCtDVnl5dzFVdXVCdDdPZFBtVFZPL1pYbXhLTi96?=
 =?utf-8?B?VDdEb1pjOHZ2RTBoOFV2c2hrYk1FczRJWFhBTDNGbHJLTG1pYVZYTWRYODRh?=
 =?utf-8?B?ZjN1R2dBdFgyVFhVMWY4STRXMlN6YVg5ZVdPMlVxSWZaeG05citUNlhUZDdp?=
 =?utf-8?B?SFRUcVVKR1VuaTFFem8vTHBiMGJKLzVjN0o3NStLQ3g2aTF6aSt4ZHkyUmNG?=
 =?utf-8?B?eFZGeE4zamtNZmZ2dWxUWlJVU3U0OEUzbFNUNTRJUFFaa2VocUROcEZqYTFm?=
 =?utf-8?B?dENIZyt4aVBMcFViRFRVaDd3YWZHSzd5NVpxVWx4OVMzMGtpMHlpWUV6RWdn?=
 =?utf-8?B?YmpObnVXYkZKVlhHWGlmYllrNUkwb1dvUUhtZFJ0UVI3cTRpWmZGM0F0bWlt?=
 =?utf-8?B?NkpxY2tyT0ladGt4ZENYT3dTQ041Z1U3OTdJWDZua3h3ODZBN3VPU2h0STcx?=
 =?utf-8?B?SHFXR3hHTll1MVdCNzZpajZOb3VnSkZrbUdsUVRWbi9xZERvb3hpZlpYS21W?=
 =?utf-8?B?cysvYWRINjdNb2JBdE9pZmlGbzRDNUUyUEhJS21CMVA5a2JwVUZGKzNmcW5D?=
 =?utf-8?B?TnhnZmpPU0c5RGYxS2dRUzlSRis1L2lHMnNDL1lrT0xpQk9HdHVWZEhiUXdt?=
 =?utf-8?B?QUpwQW5ya2dFb1lIMy9NV2NJQi9QdlRqVWJiQWVFNm44R3ptNEVzR1FUTjF1?=
 =?utf-8?B?SWd6YkhCM0g4bEYrdnRQbXlPTlZGa1hwZkp6dThuajF4RjZaNG9LQUw0VGFx?=
 =?utf-8?B?MHg0TERQWHFMRC83S2J2OEtORUxsMWx5bXZMN2N5NHBzM01NdnkvSWJMRmVu?=
 =?utf-8?B?aC95ck5aVFJiN2tEZE1VY1FMK0JDMzExSk83elVLaFhDV1BUUVhFR01ZTkh3?=
 =?utf-8?B?MDdPQWNxN0IrQlFSSUJwdENsUmdUeTdnYzVjRkdEdExqRlF3czZVenY4bkFS?=
 =?utf-8?B?V0I4Qkw4b0xMMHFhUXBYK3NCSWM3VXQ4MDZkQmQza2dSbXB4QkwrNHU1SndV?=
 =?utf-8?B?YVhZUWdienFRUGY1Qi9WMkM3WVpJTnFwaWhDOW5rSzE0cjZuTDhzdFBHTmFs?=
 =?utf-8?B?N2FzYXc3TEgvTmU3ajlMaCtobHRnR0FjODU1OTdEWlJ3TmpkYkZybDNXR09C?=
 =?utf-8?B?UmhDWmVrSDdES3djMElMZExlQjJjTmhpTGJMK2ZBM0EwRXlVSjBiREZRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dWRmampuaUhrc3FIOGoxL0xkS2QyVmdRbHFqaXVnM3BJcStlckxRTDdDcVlU?=
 =?utf-8?B?WEFSV0dGcVVhYS9MbGhuK0prVklZQ1BjL21UdHRoY0lJd0ZDNzY2SVFneGJl?=
 =?utf-8?B?Q2M1RjhaT3V5UWtCQWNSQVM4Y05zRi91aXdPeFAyOXdXTVZDVU1yK1lCN1Bl?=
 =?utf-8?B?cTBKcHA3NENEeVJ3ZEZiR3VRNElVd1lJSnJKb1c3Slh6anBQd1NndXNmYUs5?=
 =?utf-8?B?V2djMGt3V0tpRVJrWGtZMTVMU3RieGczWEJvcmtPTS85a3RjRDhkOGxJQmJG?=
 =?utf-8?B?WjlnSUlxbEFhcVRFOVVIUDBWc01ZSHhEZmZCb2FUYld0S0hYTm9DYnVmZ1FX?=
 =?utf-8?B?d0tzR2ZTMzJpc3ZldFJVOXBsMHVCOXR1bjBrOGNTbzJoLzhjRTBQaG1VVUQ0?=
 =?utf-8?B?a0x1S1BuK2tkSlZtaUFGZDd5ZVlyYy9QeUtYY0xBVkkzSFlWN1NvR2F4V3NG?=
 =?utf-8?B?WFZldEFGR0RMK2I2dWYrVGhoL0NxWWRZcldlTGZLV2QvNXJMMkcybW54cEh5?=
 =?utf-8?B?QzlsQm1Ud0tNdWRsZnVMQ1Ywa0NUY3NlUmRGcHhyTjNsRjBXOENLL0dKSEU3?=
 =?utf-8?B?eTRXWXRCRE9hSGQ4SjR4QmovdE5oRTVkektYbmdZbks2NDZzZ1JsV0VQU3ZY?=
 =?utf-8?B?bmovZjJYZytPbEtHcEU3eTNtcGptVEVZN3VjbSs0RlB6LzFpWWxQbkY1elNW?=
 =?utf-8?B?YmMwSnFoWS9ORHlDSkRja1JNUlVXV0d5QnZQdDl0UXQ1bStvV3kzTjF5L2p5?=
 =?utf-8?B?b1YrekFzL3poRkEvNzJPc3BTMkRiV1BjV1JNb1FWRnZTTU5KNFpuY1hDZkV1?=
 =?utf-8?B?K0pDYld1cUg4UFdMWXU1TjBGcmxZU1hMRUN0eEdldUY1c3RCeW9SOXJDZUt5?=
 =?utf-8?B?YzNTVEFnSXNXb0tYVjFtYStCcUlhZUtjc0R3ZHkyZC9IVmRJTWJHOXZ3T0dU?=
 =?utf-8?B?UkpVajhYTy9BMGhOUmZwUkpyL2U4YzdxWURkeENKOWZVOU1qODNvRVpVMjFO?=
 =?utf-8?B?NDJ5TWFzZU5ucU9YdUsyVWdocFJyUThVQXRZZG03Tlk3NU85Y2ZQYkozUVlu?=
 =?utf-8?B?SDdjSjJjY3B5WUdnMEJ5eWl0bXd1VkVmSU5kTUJucEc2ekVTSzRUajdkc1Zu?=
 =?utf-8?B?M0ZFbXprRWlXdUpSd3c2bnlPRnJIWjU3R0tmMWhxMk9WeEM5RTY4N2ROZDFa?=
 =?utf-8?B?eDM5K0hiM1hhWDJYNE5rTFNFdHBVZDh0L2VEbzdoWkRRaGFXQ2tkMnE2MHNO?=
 =?utf-8?B?MUxoYUNsZ2UrbU9YdENQK1NqN01Sc0psNmttalFqa3hPTy81UHAvWG1neXU1?=
 =?utf-8?B?WThLcURtWU4yS3dlQnNrVjNqckZIVXlaSDRwdzFBVnZLOTVkMG9xRUdJMGlV?=
 =?utf-8?B?MTBmREdaSCtydlZwUlRWMjFrR0U5SE13TkhFSUNJQ1oyenQ0eXZaTjg5Q3Y5?=
 =?utf-8?B?NDh0SU45TVBwYStmUlNCZE8zMXF3d1ZYK29yTDhzYml2MnV3cVdMMDdmOFZu?=
 =?utf-8?B?em1ZWWZJVmFzNE1Sc1pjSlBNZHE0SkdtWFZKVzhmV3ZaeDRNNURRbHJPUmE5?=
 =?utf-8?B?OTlVQW5waXdGOU04aWZrVFJZS1BCNW03SzFUV1VWR1NvK24yb01RNUNROXFv?=
 =?utf-8?B?UzNUd2lkdFZoZVJxT08xbG91MlBkOVlmdkVHbkUrdlZpT2JBSTFvNFR1UXF5?=
 =?utf-8?B?ZlJoa0cwWWJxYVdyMERvWVhHenRwSFNSNzRPdXlqTDZEWmk1MlFVTTgyYmhi?=
 =?utf-8?B?ODlIZjRNenlwOXNmZDdUZzN0RW8wZmFZTG5haGZCSHY4Q24wK1d0Rjcyd1Fo?=
 =?utf-8?B?U3FJQmpoYmcyYi95VTJ3T2FMS203U1E2U2kxL0pYL09vVVh1UHFINkxtMVpK?=
 =?utf-8?B?cFMwdmQ5RG5rZVBCYmdSbmVQL1N0dDNQMUc5MTlLcHF1QSthM0tWOCtCUzNC?=
 =?utf-8?B?VXY1c3pUaC9aZnVaU0NyRGNjK2lienVSSHdGekhueGFabEtkR3IzTVA1TWhV?=
 =?utf-8?B?SjM0UjZCT3Q0Y0l4ZElwa3hXbDRGYVpudGs5eC9GSTZtbDh5ekVrWkdFM2hr?=
 =?utf-8?B?OElhRy94dnQ5U0V3SXZxMVpJRnArOHJ6WXk1STI0emJqbHBkaTAzR0d2VXZ0?=
 =?utf-8?B?RWIyTFdraFQyazJlaE16N2ZoSjZnVE9PaXNSVncvWWcvMitmTWUrK1lDdTFS?=
 =?utf-8?B?a0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 210bb05b-64f3-4227-820f-08dc62ecfd6a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2024 16:55:18.4574 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pMC4kz2sb93HHUZCnoDE9lPP7aKFwFDGKZTeDW78Yt83KxgJX/xEGT1TtIa75ecSers8oPeOJ2W4LMnU9vk+Sgl1VfTTEXf38mQWaQT3xYU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4901
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on czw [2024-kwi-18 22:34:41 +0200]:
> We already have functions to control the VF.
> Allow to control the VF using debugfs.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c | 79 +++++++++++++++++++++
>  1 file changed, 79 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> index 32ce98698690..8909bb950a8b 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> @@ -14,6 +14,7 @@
>  #include "xe_gt.h"
>  #include "xe_gt_debugfs.h"
>  #include "xe_gt_sriov_pf_config.h"
> +#include "xe_gt_sriov_pf_control.h"
>  #include "xe_gt_sriov_pf_debugfs.h"
>  #include "xe_gt_sriov_pf_helpers.h"
>  #include "xe_pm.h"
> @@ -153,6 +154,83 @@ static void pf_add_config_attrs(struct xe_gt *gt, struct dentry *parent, unsigne
>  				   &preempt_timeout_fops);
>  }
>  
> +/*
> + *      /sys/kernel/debug/dri/0/
> + *      ├── gt0
> + *      │   ├── vf1
> + *      │   │   ├── control { stop, pause, resume }
> + */
> +
> +static const struct {
> +	const char *cmd;
> +	int (*fn)(struct xe_gt *gt, unsigned int vfid);
> +} control_cmds[] = {
> +	{ "stop", xe_gt_sriov_pf_control_stop_vf },
> +	{ "pause", xe_gt_sriov_pf_control_pause_vf },
> +	{ "resume", xe_gt_sriov_pf_control_resume_vf },
> +};
> +
> +static ssize_t control_write(struct file *file, const char __user *buf, size_t count, loff_t *pos)
> +{
> +	struct dentry *dent = file_dentry(file);
> +	struct dentry *parent = dent->d_parent;
> +	struct xe_gt *gt = extract_gt(parent);
> +	struct xe_device *xe = gt_to_xe(gt);
> +	unsigned int vfid = extract_vfid(parent);
> +	int ret = -EINVAL;
> +	char cmd[32];
> +	size_t n;
> +
> +	xe_gt_assert(gt, vfid);
> +	xe_gt_sriov_pf_assert_vfid(gt, vfid);
> +
> +	if (*pos)
> +		return -ESPIPE;
> +
> +	if (count > sizeof(cmd) - 1)
> +		return -EINVAL;
> +
> +	ret = simple_write_to_buffer(cmd, sizeof(cmd) - 1, pos, buf, count);
> +	if (ret < 0)
> +		return ret;
> +	cmd[ret] = '\0';
> +
> +	for (n = 0; n < ARRAY_SIZE(control_cmds); n++) {
> +		xe_gt_assert(gt, sizeof(cmd) > strlen(control_cmds[n].cmd));
> +
> +		if (sysfs_streq(cmd, control_cmds[n].cmd)) {
> +			xe_pm_runtime_get(xe);
> +			ret = control_cmds[n].fn ? (*control_cmds[n].fn)(gt, vfid) : 0;
> +			xe_pm_runtime_put(xe);
> +			break;
> +		}
> +	}
> +
> +	return (ret < 0) ? ret : count;
> +}
> +
> +static ssize_t control_read(struct file *file, char __user *buf, size_t count, loff_t *ppos)
> +{
> +	char help[128];
> +	size_t n;
> +
> +	help[0] = '\0';
> +	for (n = 0; n < ARRAY_SIZE(control_cmds); n++) {
> +		strlcat(help, control_cmds[n].cmd, sizeof(help));
> +		strlcat(help, "\n", sizeof(help));
> +	}
> +
> +	return simple_read_from_buffer(buf, count, ppos, help, strlen(help));
> +}
> +
> +static const struct file_operations control_ops = {
> +	.owner		= THIS_MODULE,
> +	.open		= simple_open,
> +	.write		= control_write,
> +	.read		= control_read,
> +	.llseek		= default_llseek,
> +};
> +
>  /**
>   * xe_gt_sriov_pf_debugfs_register - Register SR-IOV PF specific entries in GT debugfs.
>   * @gt: the &xe_gt to register
> @@ -199,5 +277,6 @@ void xe_gt_sriov_pf_debugfs_register(struct xe_gt *gt, struct dentry *root)
>  		vfdentry->d_inode->i_private = (void *)(uintptr_t)n;
>  
>  		pf_add_config_attrs(gt, vfdentry, VFID(n));
> +		debugfs_create_file("control", 0600, vfdentry, NULL, &control_ops);
>  	}
>  }


LGTM:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

> -- 
> 2.43.0
> 

-- 
