Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D48CBC25B10
	for <intel-xe@archiver.kernel.org>; Mon, 13 May 2024 17:13:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E30510E8D6;
	Mon, 13 May 2024 17:13:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gBWn9ofX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BB9F10E8BF
 for <Intel-Xe@lists.freedesktop.org>; Mon, 13 May 2024 17:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715620427; x=1747156427;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=tXE1MAA9bPOP7OHsQ3IN/YHLQPP+5sggg/jzjSCS5qQ=;
 b=gBWn9ofXW3BIz6vJmY9qFT/B3xlHHDMDHejQ1L7ntxrcDb69zPlbBPtg
 dmKUwi5rQd/YCbtIC69ucU6dfiWRjc3hxs+XVD3t7/IbC3xCOdQQQISHK
 d8HSs5sjyvOMlDRK6ABh/HySXn5mAGIK1bDD1iNOl7/oWg0F7XQYjSuyB
 mAjVzwj+mVPwYkVRceBIoMCRiVwLQNfIrEDnHWxMojPMGq8JaXNcKMAUR
 bd3XFDkH+FhnP5mwae2lZOT9W84//+pXcJfR9wy/TdyvbfpRz0mXmJgvX
 v4q+fx+URN70tI+yLXpdEULcRR7xlcY/y6y6ZLARFbQmn9dGLBmdDkK25 A==;
X-CSE-ConnectionGUID: A9KqlkT2TZio9EiGehBdsA==
X-CSE-MsgGUID: NIkXdkOhSYWm5CzrYjJ41Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="11743206"
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="11743206"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 10:13:46 -0700
X-CSE-ConnectionGUID: dtb/ZjScQFaRZvrfLpIM2A==
X-CSE-MsgGUID: nLlCjAesQxiNmmFwS1PQkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="30959267"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 May 2024 10:13:46 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 13 May 2024 10:13:45 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 13 May 2024 10:13:45 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 13 May 2024 10:13:45 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 13 May 2024 10:13:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cBSzqUXyuHw9TV2xxckOfxTGcoI0To0mV8GUHsJJDOFK0Ajt2FzJjuKvbc5PEM41k5ZBvwGrDgzm7NzYcICp/c8H9fdjrUiNike78ME9sXhX44t8luYL5xpBaHndn9cGkG3r7TFuISnGAqm4g2/Q5YyVOjBeuLdLbwuk5SMzNS6LsVYK8L1dehyiulB9dUUOXj/OjOf+7WwRg9Kp1Uia+wwt4KzbWOMMcB/jVfLrDX6bU3OCsE1RcKDQp3L4riYxOiPY6BQxgkD0gAZR1Fg/npnUe+0m/2HP+MNhBJuwkoYRTVYrbUp61MHOzxr1ILcwdymPrd0Uqknzjn5yojLHnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VcLPimCIL2+qCfB8dz5cVIp8VfbL6HG47SfCdIheisE=;
 b=mcrk4EhZsT7I0SUOWQJiNN0NBAmHfmR4ahgtIXafqNEz/fbI2gAJkVbZohjM2iF8EW1+s9xQ7w+XbUuhvBfPbvYWcOspo2SGICV3p+t3lD76hfZUaFGTYLrknwuLm8FLLkm2zLE/x/7ZyVckyL84OWVFAuJ2hqSeOwLRu8OenFNJ3sjwFwZ2VldWPsRFZkUwbOOg5pJHTbqRbnNDqoGEZGY6QLHbEVJLq0+Zi/up894Pb2VY7jZvswx7s+U9c9leNUg39alBustQtAhSqNFelDVgh5150HiTVzb5y7z60HNPFHWL2NS+joUs1vO3MGBZF/8yZXiMD2csrH+3fgot9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by SA1PR11MB8575.namprd11.prod.outlook.com (2603:10b6:806:3a9::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Mon, 13 May
 2024 17:13:38 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.7544.052; Mon, 13 May 2024
 17:13:38 +0000
Message-ID: <efeef3d8-d656-4dce-af2a-516ff6be1382@intel.com>
Date: Mon, 13 May 2024 10:13:33 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] drm/xe/guc: Improve robustness of GuC log dumping
 to dmesg
To: "Dong, Zhanjun" <zhanjun.dong@intel.com>, <Intel-Xe@Lists.FreeDesktop.Org>
References: <20240508224927.11341-1-John.C.Harrison@Intel.com>
 <20240508224927.11341-3-John.C.Harrison@Intel.com>
 <28b8fef5-14fd-48fc-92c7-09196d7f6680@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <28b8fef5-14fd-48fc-92c7-09196d7f6680@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR20CA0003.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::16) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|SA1PR11MB8575:EE_
X-MS-Office365-Filtering-Correlation-Id: ad157f2c-314f-4734-e301-08dc7370075a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aitBNnRTckFod1JXM3pHZFpDNUhaMDY1VnFTcDhqQXJzeWFvdVJjd2p6SEpU?=
 =?utf-8?B?SEszQzhlbFY1bWNlNERSVTJla2h2dzdsUTdJcVdYVldKTW5qMittVXlUOG9Q?=
 =?utf-8?B?Yk04cWljWnc0MHlta3FRdWNTL2FTVzhvdEc3VDdYYlFNVm8rOXE3SVhidzhy?=
 =?utf-8?B?WGxXck1ocXI5NVpnNVNBOWpDTjFkNWVNVERrcFZxd29KTFpQbTNzTVZNR3Zj?=
 =?utf-8?B?MTdiOThPaDFLeTRMaEFSZitnNEt6Z1BLMTFNOWtTNXJTc0xxVzdxQ1g0bzBi?=
 =?utf-8?B?VDJpbHdQb2VEQmRocTFxcU16cUpHTDBLbng4Ty9Id1piaHROS05vTTBxS1Ri?=
 =?utf-8?B?ZVRNNi9LZHJKcnVqQ2QwUGR3QjZ0UDBUT0I4NUF2ZmVjdFFIa3lWVTBWSTh1?=
 =?utf-8?B?NmtJc2hLVzlNcHIrcXpSSk1MZ3NsTmxMN1AzT0JhSkRYVnRkejRGNUlxYXpV?=
 =?utf-8?B?bHJrRUh3eGRUd3VveTFQNUs1eGNJTWVuMVdNY2NGc1ZnaE5Ea1E3ZFRoTTIx?=
 =?utf-8?B?ZWtzZUF3cDhmWW1BSVlhL2VsUkhKRG1JSGdQZitPamZZdndKRk5KOTcxNm5R?=
 =?utf-8?B?QTFoNjlSeng0QVJWL1JFNDMyRWtnTWQ3R1ZCUlJncE9ZZEFlZFNoc1NqRk0y?=
 =?utf-8?B?TDdxaGZVV1hhcDFLZW8yYUsxbkUzbGxCSEVMM1lUT2EwelZuYkNmcGhzVE43?=
 =?utf-8?B?ZUF5c0RYVmdQaEVkVWRQQlBzb0pQZ0VmSTdSZk5pZEorRER2aDZZYmRra2xZ?=
 =?utf-8?B?Rm9UODNTcHBVeFlJbDc2TDBGSTZ5bGlseGZVcVRmL0lhZTJ4RFo0U1hkeVFG?=
 =?utf-8?B?Z2dJVEhhcTBtaFAyd3ltT3M0bVZLdmoxYmVVVzk5TzdFbHBCa1BNNm5VWmVt?=
 =?utf-8?B?VUJWWVd4UVBCTTMyRzE4VVdxajNxZzFZV1dDRDhYK1Rrdkdyb1RpUDlNay8z?=
 =?utf-8?B?U2luWXI2a2hYekx0WDJ4WmRXcU1LS1pCa0tUNlBHNG16dUkwaStLdURQNDlm?=
 =?utf-8?B?UXFBNmkzK25idzZsY0xEOHFRZ0loNHQ2VEE2RTE2RnBybjlFNnhISDVieUhz?=
 =?utf-8?B?Qmd6N1o5MGVSVUxOaWZUWWtBTjE5R29SN3hCYVNVNTNWRWJHemp4UkhwV2wr?=
 =?utf-8?B?QkVJdUQ5WWdJb0dva2JjODY5TmdkdFM1ZVZHSXZ4bTZMWjZFQ3hGenhubjkx?=
 =?utf-8?B?a0RTbmpBcmFZNUlKZlZQT2F1R0s3MGx1M3B6N3pUN1pIRi94VVFLMS8zSzVI?=
 =?utf-8?B?S295UTVJbGNSSjFxaXlFTnMzYVMxblFHWVI0WmZaNWNIQTcrcU9EcitNLzMx?=
 =?utf-8?B?cThUYWE1RmxLcUFlY1hQZ3lsT3hTQnVtTTNoZ0Z2WDJ2SmtlQ3M3andodEU2?=
 =?utf-8?B?TFVncjFucFNTOERqMmNnbHd5bURpNldGOFc1WUd2MHFNVDJ3TGVIdVdwVmV6?=
 =?utf-8?B?a1ZVQStNeUcrYkR3K2lJdlFmZnVDRC8vTURGZXphTDJRQ244cWFMVkVWaXlT?=
 =?utf-8?B?NUJqOVhDMERWdGEvTDlINlg2VTc1MlQrZUN5bTlYT2MwLy96dGdnUTdXRmZQ?=
 =?utf-8?B?K0dlckVTL3M4YTcrS0JjUCtMaU1OMnhMSm5kQnZtK1hXeWtWbWlXYWhWNDh1?=
 =?utf-8?B?V2lZR2o4MFpoZkpaV2h5amo3MFprSTV0cHRGOTdQQklRTDJQMFQ2cEU1ZTdl?=
 =?utf-8?B?VE5aRWkyQkNpUXZ0ZHRQWGpUak4ybjN5MUl0YVExdTlwYVliTmhQU3l3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SjRLcm9SaDlaN2xRSFpsYU4rUDdheFk5ZEIxNUFlK2grNXlQcGtXZWRFbXBo?=
 =?utf-8?B?ZmtVNTNBSnNuN1M2aXJTdit5cThYS3hCQ0FUNllGa0c2djhhUFNILzN1V2dG?=
 =?utf-8?B?bkpabENyWUNKSFBMMUNkTHpPU2NVdVlqMlNPY1hZQXZqQXlvbWptSlVSWGR1?=
 =?utf-8?B?QVVWbjlEaWdkSmZUVDFKR3NXSFRBMXB4WDQ4QmViN0VKbjlxTHM5Vng2eW5m?=
 =?utf-8?B?eWdsL3dmQW81dHVGdmMrRHpveFByM3RXZnNONDRVWDJqb0U3c2xsQUlEdU5P?=
 =?utf-8?B?Q2N6dS9mM0FudC80WWpoeUM4dEdMaHdhRUhQT2IvN1JCK0tnem02UGxSOXhZ?=
 =?utf-8?B?dkUzRHRaYW1DTWNwQXo4MUdHdFJjVCtkUGlhSlNGMTVxTFBmVXhzdkNzZGl0?=
 =?utf-8?B?RWYybUdQakI2MjROditlcmpBYlcyUVlIaGZHNDF1OHVtUzZ6aFhEODVYZzRN?=
 =?utf-8?B?ejJnSzJVbmd2U0o0dEY5V3hyMnBoR1lJLzMyYmV6K1NXc0s1MDhtSWNZMlR4?=
 =?utf-8?B?ZlZZK3JjZU13aWlJalkvYmtSOVZ6YzdXUTlSR0h2RmFmYlYrRzdITjN0REVS?=
 =?utf-8?B?dlRIckVBTGltOFFGV1hxVkpWZDU4ei9XVU91L1QyeUkzbER4ZFoybUZUc2Q4?=
 =?utf-8?B?cjJUeUtjYnlIOHdNUlFreFFUdXVCYVBLdW9ZYmtqYVM3UHJmTVpTL2p2QVlr?=
 =?utf-8?B?ZERrMjRCRjArTklGWm9jUmVBRU9ldElmd292YU5ObVltVXZXN2Z5SGQwaHNH?=
 =?utf-8?B?WHdBakpaeTdsSGtBZVRObitJZDI0N2ErV0dvY095QWFtb2haa2N2VUpzbVJr?=
 =?utf-8?B?RXhkdSs1UEI1aisrT3IwWXo5UlYzcFQ4NnVhanBqclRSQmxHSDNHdWE1Rnl3?=
 =?utf-8?B?QlhIbEErY3RSYm1TR3pxM1pGUnB0cEc4aVpURmxCRTRNbzE5UUFkTUdML2pW?=
 =?utf-8?B?aFZWYWllR29KbjNQTFc3MHozaVFJNFByMkFBbkRhOUV5OTRXZXh6SlgrZzBq?=
 =?utf-8?B?K3dYQkhUdE1rc3FCNnhvVEhkaTdnbVBEeDR0SVNRc1NTb1JnM1c4NTFiaVFJ?=
 =?utf-8?B?UnVSQk9aSC9FaGo0OCtBdHRBZDVnOHJ2dUFHYmU4TkhhR0h2SWxkSGZ2REts?=
 =?utf-8?B?eFlyUmt3Z1VyczlOTzhHTGRRbXVIbVJjRHd6NHB4SXpGVWp0M256UnZJTEhW?=
 =?utf-8?B?cDVwYlJmcHJWNEk4RWF4Z3NpVHlnMnFVUmg0VVUvUUtPWDZKQWg4ME1MditU?=
 =?utf-8?B?RUhvOWpURDhlUXlDZzVOai9ZZndtcDRTSm4rSnRqbVdVbk1hTU0wRU9USm13?=
 =?utf-8?B?dXA1bURFWTlSVWd1MmZIYnFoeFY1aEJrMXZnWGlpTXl1Qm00bFNzZUJCc1ZC?=
 =?utf-8?B?dTNXRnpYdi9rMWp2YXZMWERBTHNjOUYrK2t2TDRSR3Y5dktLT25scEZiaGov?=
 =?utf-8?B?Q1dXaCtDNGdhS0tTYXREeHpGQzRWcmhhRlFDdHlPd3p3WU01MXJMM2ZoZi9r?=
 =?utf-8?B?UWFabzdpTlZ4bVNNS2FrZElWWkVHNmUxeXBRanBEb2ZYZmplUGFNSGJpOGI1?=
 =?utf-8?B?RjE2amtBREJvMWJid28remRhVkxrNlQ4U2ptaTBmQ1h0TVRDQ3p6TkFMT0dG?=
 =?utf-8?B?NGwwejZBVmU0ZU81dXJXNkdYaFhXZlh1U0kzUnFibmdDdE1wamtMSGloMjFu?=
 =?utf-8?B?Z0pvdjNIbVBtOUxkSDdCRlZKSVpxaDdmblZ2YUorejVWdEdXQnBybkxKRXVl?=
 =?utf-8?B?bkhjcU1UNnB0anlCYWZHTDZtY2EvbUdMRUNlZ1pMUDBxVVZpRjZVaHJBTHdn?=
 =?utf-8?B?S2VUOXE2dDdLZzlJT0EzdnVhSFJPeWt5R3AvZFF4Mzl5S012anlUUE1SZE54?=
 =?utf-8?B?YzBYYzVGUmpRUUdwUGRTcHUwM3lVU2gxRWVrQnlLbmlERTRaQnV5TSt1aWNL?=
 =?utf-8?B?MjhLWDJ5djIyQmFBYVNkbG9wZjh1SmhlMVZBT2hEM2NHUlFLUkc0TmxWQk55?=
 =?utf-8?B?azdKZnNydUh2RHBrdnMzUHdYbGVGL0Z1WEVtWkd4Qk5iTDZWQnNrUHVLR2kv?=
 =?utf-8?B?dW5XS2F3NUhrbEZaMUtkS1BaQVU4L2l5cGlnUFJTSEFlWXhXUFMwK0plaDV5?=
 =?utf-8?B?c01nOUNWcWFEWXBvUGl3NFpDQjNhYWlOQXA1MUhpM0xlNXp2OUdPUTlvTnA1?=
 =?utf-8?B?TWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ad157f2c-314f-4734-e301-08dc7370075a
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2024 17:13:38.2198 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dHck8YnKUP9/aB2rCblXRtgWtHO4LKgrUga8U4nNqNjBRiA+dwaD9mrSIx+8WawQpdN0Z4VP8pBCfIJv6q8cGPKCT7ZkRGIVA7UDQpelBgE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8575
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

On 5/13/2024 08:21, Dong, Zhanjun wrote:
> On 2024-05-08 6:49 p.m., John.C.Harrison@Intel.com wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
> ...
>> diff --git a/drivers/gpu/drm/xe/regs/xe_guc_regs.h 
>> b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>> index 11682e675e0f..45fb3707fabe 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
> ...
>> @@ -49,32 +57,79 @@ static size_t guc_log_size(void)
>>           CAPTURE_BUFFER_SIZE;
>>   }
>>   +#define BYTES_PER_WORD        sizeof(u32)
>> +#define WORDS_PER_DUMP        8
>> +#define DUMPS_PER_LINE        4
>> +#define LINES_PER_READ        4
>> +#define WORDS_PER_READ        (WORDS_PER_DUMP * DUMPS_PER_LINE * 
>> LINES_PER_READ)
>> +
>>   void xe_guc_log_print(struct xe_guc_log *log, struct drm_printer *p)
>>   {
>> +    static int g_count;
>> +    struct xe_gt *gt = log_to_gt(log);
>> +    struct xe_guc *guc = log_to_guc(log);
>> +    struct xe_uc_fw_version *ver_f = 
>> &guc->fw.versions.found[XE_UC_FW_VER_RELEASE];
>> +    struct xe_uc_fw_version *ver_w = &guc->fw.versions.wanted;
>>       struct xe_device *xe = log_to_xe(log);
>>       size_t size;
>> -    int i, j;
>> +    char line_buff[DUMPS_PER_LINE * WORDS_PER_DUMP * 9 + 1];
>> +    int l_count = g_count++;
>> +    int line = 0;
>> +    int i, j, k;
>> +    u64 ktime;
>> +    u32 stamp;
>>         xe_assert(xe, log->bo);
>>         size = log->bo->size;
>>   -#define DW_PER_READ        128
>> -    xe_assert(xe, !(size % (DW_PER_READ * sizeof(u32))));
>> -    for (i = 0; i < size / sizeof(u32); i += DW_PER_READ) {
>> -        u32 read[DW_PER_READ];
>> -
>> -        xe_map_memcpy_from(xe, read, &log->bo->vmap, i * sizeof(u32),
>> -                   DW_PER_READ * sizeof(u32));
>> -#define DW_PER_PRINT        4
>> -        for (j = 0; j < DW_PER_READ / DW_PER_PRINT; ++j) {
>> -            u32 *print = read + j * DW_PER_PRINT;
>> -
>> -            drm_printf(p, "0x%08x 0x%08x 0x%08x 0x%08x\n",
>> -                   *(print + 0), *(print + 1),
>> -                   *(print + 2), *(print + 3));
>> +    drm_printf(p, "[Capture/%d.%d] Dumping GuC log for %ps...\n",
>> +           l_count, line++, __builtin_return_address(0));
>> +
>> +    drm_printf(p, "[Capture/%d.%d] GuC version %u.%u.%u (wanted 
>> %u.%u.%u)\n",
>> +           l_count, line++,
>> +           ver_f->major, ver_f->minor, ver_f->patch,
>> +           ver_w->major, ver_w->minor, ver_w->patch);
>> +    drm_printf(p, "[Capture/%d.%d] GuC firmware: %s\n", l_count, 
>> line++, guc->fw.path);
>> +
>> +    ktime = ktime_get_boottime_ns();
>> +    drm_printf(p, "[Capture/%d.%d] Kernel timestamp: 0x%08llX 
>> [%llu]\n",
>> +           l_count, line++, ktime, ktime);
>> +
>> +    stamp = xe_mmio_read32(gt, GUC_PMTIMESTAMP);
>> +    drm_printf(p, "[Capture/%d.%d] GuC timestamp: 0x%08X [%u]\n",
>> +           l_count, line++, stamp, stamp);
>> +
>> +    drm_printf(p, "[Capture/%d.%d] CS timestamp frequency: %u Hz\n",
>> +           l_count, line++, gt->info.reference_clock);
>> +
>> +    xe_assert(xe, !(size % (WORDS_PER_READ * BYTES_PER_WORD)));
> Could we have a "start tag" print here? Make it easier for parser to 
> find dump start.
> Although we have the "[Capture/%d.%d] CS timestamp frequency:" ahead, 
> which might be an "in-explicit start tag", but if something added 
> after it in the future, this "in-explicit start tag" will causes 
> parser broken.
> A simple "[Capture/%d.%d] Dump start\n" liked tag is more easy to 
> maintain.
There is a start tag - "Capture/X.0 Dumping GuC log for...".

The parser needs all the output, not just the hex dump stream. And it 
will already cope with extra meta data being added in the future.


>
>> +    for (i = 0; i < size / BYTES_PER_WORD; i += WORDS_PER_READ) {
>> +        u32 read[WORDS_PER_READ];
>> +
>> +        xe_map_memcpy_from(xe, read, &log->bo->vmap, i * 
>> BYTES_PER_WORD,
>> +                   WORDS_PER_READ * BYTES_PER_WORD);
>> +
>> +        for (j = 0; j < WORDS_PER_READ; ) {
>> +            u32 done = 0;
>> +
>> +            for (k = 0; k < DUMPS_PER_LINE; k++) {
>> +                line_buff[done++] = ' ';
>> +                done += hex_dump_to_buffer(read + j,
>> +                               sizeof(*read) * (WORDS_PER_READ - j),
>> +                               WORDS_PER_DUMP * BYTES_PER_WORD,
>> +                               BYTES_PER_WORD,
>> +                               line_buff + done,
>> +                               sizeof(line_buff) - done,
>> +                               false);
>> +                j += WORDS_PER_DUMP;
>> +            }
>> +
>> +            drm_printf(p, "[Capture/%d.%d]%s\n", l_count, line++, 
>> line_buff);
>>           }
>>       }
>> +
>> +    drm_printf(p, "[Capture/%d.%d] Done.\n", l_count, line++);
> "End tag"
"Done" is an end tag. And it is more friendly to a human reader while 
makes no difference to a machine reader.

John.

>>   }
>>     int xe_guc_log_init(struct xe_guc_log *log)

