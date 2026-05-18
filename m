Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39BB8CD4F3C
	for <intel-xe@archiver.kernel.org>; Mon, 18 May 2026 12:48:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F31D410E7F3;
	Mon, 18 May 2026 12:48:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lUAZQhCZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 862DA10E7F3
 for <intel-xe@lists.freedesktop.org>; Mon, 18 May 2026 12:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779108537; x=1810644537;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=aP120yLbJxgIGxBYwJLo90puwiGwT01rghW0DwcVZjQ=;
 b=lUAZQhCZxN48NfVztvregAndlVT1bH9YTcyGXO7f8lRvp/ekry88wfUf
 PxpXa/xgWbeKAhatuvCkmo3T2mkyBRJUTER2zUfhKtBiptxgPLoZYBO33
 l+B4wINMS92QrFLsNmBAmYbTbE5tu7UgM4u4qwMRmR9RZWmkiZro3ZtIl
 9OhG9yYckXCDceDUm83A4f8HXt/hoPbgnr9p0/qvuieL//nelIrvjwuqO
 s1XxENIac9FuNCDpPrq5kQDT7mQmkSAEIslU5EMf597b6BfP/LhKI/RaH
 x7ES5YcDjKwCseTYgZWS4fRFHJ5w2aQrfE/4wqnhCZg3b/yS01k8Hon9J Q==;
X-CSE-ConnectionGUID: QN18gcVdTfGsS3BWSL+r0g==
X-CSE-MsgGUID: HDVI0HyOTouw2jlBXKDeTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11789"; a="79674411"
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; d="scan'208";a="79674411"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 05:48:57 -0700
X-CSE-ConnectionGUID: mFVpyM9EQXeewXJfZFsjPQ==
X-CSE-MsgGUID: GxY3/kHIS0azvmD30ZMa1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; d="scan'208";a="239671669"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 05:48:56 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 18 May 2026 05:48:55 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 18 May 2026 05:48:55 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.48) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 18 May 2026 05:48:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V20oY13t4ZsnLIRQBtk0MtozjYRM5sSTb1Gx1nmZ7qWxntDUxc8hrwWfuuMzLcoQ7PuL/sENkTduIK1dND+Zt/fR2nJER7N8TlFlmK3xPJLiL8fLRdAsL8sm2B/QqT5ElT3GQ9zSaD58m/i4+wNkFFeYdt3+No54OEGpovtGpC8X6TrOBVUtO9jqCIHXXDmoHqctEjLb5ElNM3NMApCwYwUn5djQsTyDdESAuirM/cNz3oMUIOxbYW3fLO1VlerWo/NxlKfgxZU9obWWtXkUNaCajn1OfAzI2X3y3s8H6j/BKt+PPYcTOa6pp8n+qBE5YArZ2Oi99j6LyOStLIO7Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rk/i1GHiVif3loe2Qnaw/oMl7QSBjBnpQQWgBxwzzXY=;
 b=koqwCCQw0BPwDqaPgXaO6e1HLLFeSBFciTDNbIxH9kGe3LQ3cktt66EhekfQOWS6ikHTqU0MrKqJZsmU8GzvnC0Dngwh+zDTtLsYtVfCT4QuOJZu+tJScvGY6xTWCm8JjzPkRx9qHmQJjzjHMXT5QUlI8B4AiJdiPFIDMDgDypM9JxpReiEuOWbeysvBccukMUsxS33bhjeY30bC1LScafTpZxGv/T3ezvGD/SI4hV6kUALumIETkVNgJsgZGG4J1xIeAavBaKbIDCijKizg8X8YCb7lKEakvRDwzzF0CF2KP3YVw6EwbAnM07Qb+usQHbGBa8NerKIDBgcl3IsIWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by CO1PR11MB5044.namprd11.prod.outlook.com (2603:10b6:303:92::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Mon, 18 May
 2026 12:48:51 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.21.0025.022; Mon, 18 May 2026
 12:48:51 +0000
Message-ID: <e7199def-889b-4684-a720-d257de7a6bb8@intel.com>
Date: Mon, 18 May 2026 18:18:42 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] drm/xe: Unify fault injection hooks for CSC, GT reset
To: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>, <sk.anirban@intel.com>,
 <raag.jadav@intel.com>
References: <20260515101950.1894669-2-mallesh.koujalagi@intel.com>
 <54bccd8e-c9a6-41da-bd8f-5f0e130c6c1f@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <54bccd8e-c9a6-41da-bd8f-5f0e130c6c1f@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0102.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::18) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|CO1PR11MB5044:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bcfad27-7550-4dc0-ca7e-08deb4dbcf85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|56012099003|18002099003|22082099003|4143699003|11063799003;
X-Microsoft-Antispam-Message-Info: w8MOSzOy2ul5dO4mhWa0wQDsOg32kZvKTc1mLkjexC9DPQNNaQkbFcISkycbCv1o2pkpGxhVZlovcsa8MW/sQBRAs6w6rpSA2JPvI9Pvis5MZ4euzH4Yt29rXysCbr4eQBrnBXm4aUqIu1HNioxPzFMyGnWItiKg7Gts38RYZ9ozZbMihyx9PhsI0C0aL4WCYJDcAGpzXaeYyia9YdCS4SqkvpEgO4LpGY/dZOcUV7qAk4Ob3pI4xuSKXs/6m2MTald0qIOPTooRiDEUiNe+AoVogEQPWhOE9SuyAcTD58XFwnquEktNAyJnLilE7KFwHMuqotHB1dO5ztChANzf+jHGXJTD7FlkafUA1AoQBkEgTUucFAYwpIbdgETwaRXZWkJ0AKD49QeZmdbOsg4yNJDopnOpUhselsd36wYUtQTYsXrafLK4Cu01kvy7qqfHLWOra+o2tXilcs8AzCzA+sNXV57pB/skab5gdXdNO/6SLfMEk8e4clWM+U48w8eNjN5zJPWlUtlsp50LNPtSgIzr4g9AwVct9g5uGqWI1RiDvGwg/wMA+eOIGTNYCDmViMy6nyC2TguKgi7UNqrH6UhwC0KpJ4b7exJ7aM4fZK9nVF5wJjy7bpm43+UUg8nMizELi6bmLRsCRKNGheoSDB67nyx0cH66tbqFx6NGxZJ73d6sQ1rYVt4QozUFR4Us
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(18002099003)(22082099003)(4143699003)(11063799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YjBzRHBCc1pKODdaNEw3L0h0RHBldlJHN2ZTRFBHR05icVBCOXRwYTBFUVdX?=
 =?utf-8?B?cG5KSlk5M1Y2YnJIa0thcmxQRUxUM0I2a3krUE42RTJIY2NyS2ZodkJtMDAz?=
 =?utf-8?B?M1VIbEdXaXdLSlFzNUpIUU80RTNCSnhCcWZzRnZTNkxBdFV5aHFOaTFFZGM3?=
 =?utf-8?B?bzVkR0ZWTTQzMFlGeGpYQnZjU0RWSnFQdDlaK3k4WnN6VHJxdzAvZGlab2R2?=
 =?utf-8?B?d3FnL2xVMEtraHVXQ2JXRGVUM0xCZlUvQ2dqajU5dXJOSDJPQUhXSU5ZRS9U?=
 =?utf-8?B?K2xjK0l3Z0N1eHZNT2hWMmhzcVRMS0FZZDBJZzVDVmoyYWUvckZuaERGK2tx?=
 =?utf-8?B?UURDNmRtWXB4dVNVSldWQ1c0b3YxalBXUlFNc1Q4dTlieDNIRGtZdXJucEhQ?=
 =?utf-8?B?amladzFRa1NwME90UUNnaG5MM2lTSGJiRkFocGFZbFU1ZDMyVU1HWHlpdy85?=
 =?utf-8?B?THRlUCs0b0NJR0tzU1dFemNaOEhpTWh3L3FUbnpaalBiclFkTWhhOEJqV0Fa?=
 =?utf-8?B?aWpxdEVUdWd0OXhkeXY3bHgvUnY4RDd2M3J2U0lseTU0cFdRT2I2WEFZTFU3?=
 =?utf-8?B?ZGk2K0F6dlJ6ZUt2Q3FBYUVxQ08xL09wdndFRWVYZGRJcFd5bmxWeDJxenpN?=
 =?utf-8?B?K1RVOXFGd0V3TE1PdnMrYUQ0dXU1Q1BUeFlSeUNiQWxiZDJwdDV2bHJuQTF0?=
 =?utf-8?B?RklJMnpuTE50M2d0cEdQUXdFc2JoczNobGtuQ2s5U2FmT1NDQW1hdmQ2czE4?=
 =?utf-8?B?ZHE0NTc5dkNXODlKMWc1WGxrTmcvcmNHVlBrOVoveVBMdi9yMTNPaWtQV0FD?=
 =?utf-8?B?TWFEWnRqbUJvVi82L0dLdmNhYlVLL1R5ZGFib05ZQVU1T09HSGIwYzdTQWta?=
 =?utf-8?B?SkFRd0pqWXU2YTFUT2htQWQ0cHI3eWVNUmFPd3VwUmdiVEZyRzBLQ0c3SDhs?=
 =?utf-8?B?dlZILzNYSWhjREV6bzRyTnNPQ2FxY0FHVUUzandxd2s1UGJzZXlhN24rSTBi?=
 =?utf-8?B?REVBczQxNTY1U2xhcU9ESVdiRVpvNDhvd29TcGo4cUd6SEY0dWsxM2R5VGtC?=
 =?utf-8?B?YisxTVBlT245NE9KRHk2NUswSldQc052WUVBRG9VN3lURzhaRVp1QXpZZ1Zi?=
 =?utf-8?B?cU5qbDB6bTlNelAxQ1RPSERqUVNhdmZXOWVJTGR4RDZ6eDNVMDJzK1lpMkQw?=
 =?utf-8?B?K0R5MU9IYkNPU3Vwa1lvMHNsNnhkbnNiNHVORHpNYmh6VTJueEZ6SWxYaWda?=
 =?utf-8?B?Um5BblBIWjViU2NoZ0ZLbkI3blIzYmxWK1hwM1JHRy83b1lhc0lJcVF3MStq?=
 =?utf-8?B?dVd2TVlkQVFIZVlSODFtZ2U2YkZzd1IyU3NHNzlvMXl5U0tObEtTMDNpK3Nw?=
 =?utf-8?B?N3JGc1J0cXN2cG1aTXduUEQ0YzJVUWRzUXoxSzJyNmhkSzZnd1BrSDN4LzVX?=
 =?utf-8?B?eTU1U1pQVTlYVlZwTW5HWDJtTHJ1dEVyVzZFOUpyZFp3U2xPd3BPeGgyL2Jy?=
 =?utf-8?B?RjRRdkZ3UW5ReGZ0Y3dsc3FWdTRZM2RmeW03ekROZ0xrdkN4Q1RacFlBRHpk?=
 =?utf-8?B?Z2N1UTVKVi8xNlh6SWwzL3g5cDArallGazBvQ0poWmJJRnpNVmFOZHQrazhY?=
 =?utf-8?B?eG9LVWxqN21lMDBOdG95UjNWc2twbWczaHBxREJFUW9BY29aS0YyZFR5UWhF?=
 =?utf-8?B?M2lNUkszVjFnQ0JPWVVCQnNmRzhYVmp2NitvdjRMTG1IbW1VRkZBOTlrdEo5?=
 =?utf-8?B?WGthRnNlQithRitiWCt1UGFROUZ0cUhlOWtlT2p5Smh3S3RDVXVmQXZMeVJ2?=
 =?utf-8?B?OTlSZWw3WlVTUFB0UkFmWDFwbnMwSlk1NDBIR2RSY2dubzVCR3dQV1NBNGhW?=
 =?utf-8?B?dC9VRC81RkVkTnlKV29qVG11QThucU0wODdtQmZlOUszV3dMV1FBUUJpeFp4?=
 =?utf-8?B?UTJOOHJQQjRydTdUblMyMkZqT0JES1Y1LzhFN1B2NzhhR013Wlp4N2dtdE5z?=
 =?utf-8?B?Vm9ZQXdvYnVCRkpOMStseEw4VUlqTlluRkhqSGMycndIQnYvYXBoRFpyU1My?=
 =?utf-8?B?ams0eDY2QjZ0UDNDejlGSzNvcHZiRlRxYzFPR3hVS1dkWE5wbWJITmF1alRi?=
 =?utf-8?B?WDZ5QlNUaVBWZHpTTElhS2xNNHA4SGJaQkJPSUtFUFFiazBDdVVpUk5UaXJB?=
 =?utf-8?B?ejJNN29DS0doRWhabkVVQ3JQOEtIOEw2ZmdNdHVBNWVKL3hDc0JhbEoreWtD?=
 =?utf-8?B?T3AzaGw3Wmc2dWpQM1poWlhNcjhsdlZ4ZHA1YW1DWmRjUmVTbjkwdlovMlhR?=
 =?utf-8?B?ell1VVZqV1U1Y2E0MDFCamV1YjVZcGNNcjh2NkJBbVpXWUlqZWlxVTFWTytR?=
 =?utf-8?Q?UJVdGcD8i0tsiU7E=3D?=
X-Exchange-RoutingPolicyChecked: NhU7+Z7hbUZpcrjKo11KRiu4dyL24wlAq/AsqOrYxS26XzpspqPCgl0zG1wJUeJX+QFLdwg4FkRF1Eo7T+MLiZMmpg35g3F20zaDE9OavjLz45bS6ELgxrYiQ088e5FasTEKERABYbuLcsbyiSNv3jnTSoMUWR0Ik09EtvYkxTAyQx6tnaGRpmYu2u+2DL+CUTqIPndStWXBYMtn5xAas2MGfnWlC1Wp8xuyR3OJPhxqEbMTXHIIiKC/LnjTSJ7oCi6dGVP4N6iU9D753cgSD9ehyMlEcIt5sIckhK41VVdgFYBfaGJk2VX3g45QB+rO3Bj2x6wkzI5G9/7YYS5Spw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bcfad27-7550-4dc0-ca7e-08deb4dbcf85
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 12:48:51.0070 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: voQ5kFWULAESnF/1JGR8cwKjLgzhYh/V2/WNxxeqOtvKJAbolu/Gb81tWVkRVnVmfQeHZIgXFl03jaRlvzhf9G0o6dPKhIicOWMbCTQy/Ys=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5044
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

Hi Vinay,

On 17-05-2026 01:11 am, Belgaumkar, Vinay wrote:
>
> On 5/15/2026 3:19 AM, Mallesh Koujalagi wrote:
>> The fault injection code was scattered: the GT reset
>> hook lived in xe_gt.h as an inline function with its own global
>> variable, the CSC hook had a separate global in xe_hw_error.c with
>> an extern declaration, and each was individually registered in
>> xe_debugfs.c. Adding a new error type meant editing many files and
>> copy-pasting the same boilerplate.
>>
>> Create a single, centralized fault injection module
>> (xe_fault_inject.c/h) that manages all fault types through
>> one table. Each type is just an entry in an enum and a one-line
>> row in a descriptor array -- no more scattered globals,
>> externs, or per-type inline helpers.
>>
>> Debugfs interface (under /sys/kernel/debug/dri/0/):
>>   - fail_gt_reset         - GT reset failure
>>   - inject_csc_hw_error   - CSC firmware error
>>
>> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>> ---
>> v2:
>> - Add multiple platform support. (Vinay)
>> - Handle VF properly.
>> - Rename to XE_FAULT_GT_RESET/XE_FAULT_CSC_HW_ERROR and
>>    create xe_fault_inject_types.h file including those name.
>>
>> v3:
>> - Solved patch apply issue on tip.
>>
>> v4:
>> - Add proper header file.
>> ---
>>   drivers/gpu/drm/xe/Makefile                |  1 +
>>   drivers/gpu/drm/xe/xe_debugfs.c            |  9 +--
>>   drivers/gpu/drm/xe/xe_fault_inject.c       | 68 ++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_fault_inject.h       | 31 ++++++++++
>>   drivers/gpu/drm/xe/xe_fault_inject_types.h | 21 +++++++
>>   drivers/gpu/drm/xe/xe_gt.c                 |  5 +-
>>   drivers/gpu/drm/xe/xe_gt.h                 |  8 ---
>>   drivers/gpu/drm/xe/xe_hw_error.c           | 11 +---
>>   8 files changed, 128 insertions(+), 26 deletions(-)
>>   create mode 100644 drivers/gpu/drm/xe/xe_fault_inject.c
>>   create mode 100644 drivers/gpu/drm/xe/xe_fault_inject.h
>>   create mode 100644 drivers/gpu/drm/xe/xe_fault_inject_types.h
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index 09661f079d03..b36cf511a537 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -351,6 +351,7 @@ endif
>>     ifeq ($(CONFIG_DEBUG_FS),y)
>>       xe-y += xe_debugfs.o \
>> +        xe_fault_inject.o \
>>           xe_gt_debugfs.o \
>>           xe_gt_sriov_vf_debugfs.o \
>>           xe_gt_stats.o \
>> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c 
>> b/drivers/gpu/drm/xe/xe_debugfs.c
>> index 22b471303984..8402189b24ef 100644
>> --- a/drivers/gpu/drm/xe/xe_debugfs.c
>> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
>> @@ -6,7 +6,6 @@
>>   #include "xe_debugfs.h"
>>     #include <linux/debugfs.h>
>> -#include <linux/fault-inject.h>
>>   #include <linux/string_helpers.h>
>>     #include <drm/drm_debugfs.h>
>> @@ -14,6 +13,7 @@
>>   #include "regs/xe_pmt.h"
>>   #include "xe_bo.h"
>>   #include "xe_device.h"
>> +#include "xe_fault_inject.h"
>>   #include "xe_force_wake.h"
>>   #include "xe_gt.h"
>>   #include "xe_gt_debugfs.h"
>> @@ -38,9 +38,6 @@
>>   #include "xe_vm.h"
>>   #endif
>>   -DECLARE_FAULT_ATTR(gt_reset_failure);
>> -DECLARE_FAULT_ATTR(inject_csc_hw_error);
>> -
>>   static void read_residency_counter(struct xe_device *xe, struct 
>> xe_mmio *mmio,
>>                      u32 offset, const char *name, struct drm_printer 
>> *p)
>>   {
>> @@ -563,8 +560,6 @@ void xe_debugfs_register(struct xe_device *xe)
>>           drm_debugfs_create_files(debugfs_residencies,
>>                        ARRAY_SIZE(debugfs_residencies),
>>                        root, minor);
>> -        fault_create_debugfs_attr("inject_csc_hw_error", root,
>> -                      &inject_csc_hw_error);
>>       }
>>         debugfs_create_file("forcewake_all", 0400, root, xe,
>> @@ -610,7 +605,7 @@ void xe_debugfs_register(struct xe_device *xe)
>>         xe_psmi_debugfs_register(xe);
>>   -    fault_create_debugfs_attr("fail_gt_reset", root, 
>> &gt_reset_failure);
>> +    xe_fault_inject_debugfs_register(xe, root);
>>         if (IS_SRIOV_PF(xe))
>>           xe_sriov_pf_debugfs_register(xe, root);
>> diff --git a/drivers/gpu/drm/xe/xe_fault_inject.c 
>> b/drivers/gpu/drm/xe/xe_fault_inject.c
>> new file mode 100644
>> index 000000000000..80811850a2ef
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_fault_inject.c
>> @@ -0,0 +1,68 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2025 Intel Corporation
> s/2025/2026 here and elsewhere.
Sure, I will update it.
>> + */
>> +
>> +#include <linux/bits.h>
>> +#include <linux/fault-inject.h>
>> +
>> +#include "xe_device.h"
>> +#include "xe_fault_inject.h"
>> +#include "xe_platform_types.h"
>> +#include "xe_sriov.h"
>> +
>> +static struct {
>> +    const char *name;
>> +    u32 platforms;
>> +    bool skip_on_vf;
>> +    struct fault_attr attr;
>> +} xe_fault_inject_descs[XE_FAULT_MAX] = {
> Nit: Descs are more for descriptors, maybe xe_fault_inject_entry?
Thanks for feedback!, you are right.  I'll will rename it to 
xe_fault_inject_entry.
>> +    [XE_FAULT_GT_RESET]    = { .name = "fail_gt_reset",
>> +                    .attr = FAULT_ATTR_INITIALIZER },
>
> Should have some reference to the patch that introduces 
> FAULT_ATTR_INITIALIZER. Can they both be in the same series?

Found out alternative solution by checking CONFIG_FAULT_INJECTION in 
header and Makefile files.

Thanks,

-/Mallesh

>
> With the nits addressed and copyright year fixed, this patch is-
>
> Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>
>> +    [XE_FAULT_CSC_HW_ERROR]    = { .name = "inject_csc_hw_error",
>> +                    .platforms = BIT(XE_BATTLEMAGE),
>> +                    .skip_on_vf = true,
>> +                    .attr = FAULT_ATTR_INITIALIZER },
>> +};
>> +
>> +/**
>> + * xe_fault_inject - Check if a fault should be injected
>> + * @type: fault injection type to check
>> + *
>> + * Returns true if a fault should be injected for the given type.
>> + * Controlled via debugfs fault injection attributes.
>> + */
>> +bool xe_fault_inject(enum xe_fault_type type)
>> +{
>> +    if (type >= XE_FAULT_MAX)
>> +        return false;
>> +
>> +    return should_fail(&xe_fault_inject_descs[type].attr, 1);
>> +}
>> +
>> +/**
>> + * xe_fault_inject_debugfs_register - Register fault injection 
>> debugfs entries
>> + * @xe: xe device instance
>> + * @root: debugfs root directory
>> + *
>> + * Creates debugfs fault injection attributes for all supported fault
>> + * injection types. Platform-specific entries are only registered on
>> + * matching platforms. Entries marked skip_on_vf are not registered for
>> + * SR-IOV VF devices.
>> + */
>> +void xe_fault_inject_debugfs_register(struct xe_device *xe, struct 
>> dentry *root)
>> +{
>> +    int i;
>> +
>> +    for (i = 0; i < XE_FAULT_MAX; i++) {
>> +        if (IS_SRIOV_VF(xe) && xe_fault_inject_descs[i].skip_on_vf)
>> +            continue;
>> +
>> +        if (xe_fault_inject_descs[i].platforms &&
>> +            !(xe_fault_inject_descs[i].platforms & 
>> BIT(xe->info.platform)))
>> +            continue;
>> +
>> + fault_create_debugfs_attr(xe_fault_inject_descs[i].name, root,
>> +                      &xe_fault_inject_descs[i].attr);
>> +    }
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_fault_inject.h 
>> b/drivers/gpu/drm/xe/xe_fault_inject.h
>> new file mode 100644
>> index 000000000000..bc4d856407e8
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_fault_inject.h
>> @@ -0,0 +1,31 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2025 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_FAULT_INJECT_H_
>> +#define _XE_FAULT_INJECT_H_
>> +
>> +#include <linux/types.h>
>> +
>> +#include "xe_fault_inject_types.h"
>> +
>> +struct xe_device;
>> +struct dentry;
>> +
>> +#ifdef CONFIG_DEBUG_FS
>> +bool xe_fault_inject(enum xe_fault_type type);
>> +void xe_fault_inject_debugfs_register(struct xe_device *xe, struct 
>> dentry *root);
>> +#else
>> +static inline bool xe_fault_inject(enum xe_fault_type type)
>> +{
>> +    return false;
>> +}
>> +
>> +static inline void xe_fault_inject_debugfs_register(struct xe_device 
>> *xe,
>> +                            struct dentry *root)
>> +{
>> +}
>> +#endif
>> +
>> +#endif /* _XE_FAULT_INJECT_H_ */
>> diff --git a/drivers/gpu/drm/xe/xe_fault_inject_types.h 
>> b/drivers/gpu/drm/xe/xe_fault_inject_types.h
>> new file mode 100644
>> index 000000000000..cf0cd0974be1
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_fault_inject_types.h
>> @@ -0,0 +1,21 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2025 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_FAULT_INJECT_TYPES_H_
>> +#define _XE_FAULT_INJECT_TYPES_H_
>> +
>> +/**
>> + * enum xe_fault_type - Fault injection types
>> + * @XE_FAULT_GT_RESET: GT reset failure injection
>> + * @XE_FAULT_CSC_HW_ERROR: CSC hardware error injection
>> + * @XE_FAULT_MAX: Number of fault injection types
>> + */
>> +enum xe_fault_type {
>> +    XE_FAULT_GT_RESET,
>> +    XE_FAULT_CSC_HW_ERROR,
>> +    XE_FAULT_MAX
>> +};
>> +
>> +#endif /* _XE_FAULT_INJECT_TYPES_H_ */
>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> index cdc678d1ae1f..f900c252a523 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.c
>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>> @@ -23,6 +23,7 @@
>>   #include "xe_eu_stall.h"
>>   #include "xe_exec_queue.h"
>>   #include "xe_execlist.h"
>> +#include "xe_fault_inject.h"
>>   #include "xe_force_wake.h"
>>   #include "xe_ggtt.h"
>>   #include "xe_gsc.h"
>> @@ -923,7 +924,7 @@ static void gt_reset_worker(struct work_struct *w)
>>         xe_gt_info(gt, "reset started\n");
>>   -    if (xe_fault_inject_gt_reset()) {
>> +    if (xe_fault_inject(XE_FAULT_GT_RESET)) {
>>           err = -ECANCELED;
>>           goto err_fail;
>>       }
>> @@ -980,7 +981,7 @@ void xe_gt_reset_async(struct xe_gt *gt)
>>       xe_gt_info(gt, "trying reset from %ps\n", 
>> __builtin_return_address(0));
>>         /* Don't do a reset while one is already in flight */
>> -    if (!xe_fault_inject_gt_reset() && xe_uc_reset_prepare(&gt->uc))
>> +    if (!xe_fault_inject(XE_FAULT_GT_RESET) && 
>> xe_uc_reset_prepare(&gt->uc))
>>           return;
>>         xe_gt_info(gt, "reset queued\n");
>> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
>> index 4150aa594f05..f8e3ca63aabb 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.h
>> +++ b/drivers/gpu/drm/xe/xe_gt.h
>> @@ -6,8 +6,6 @@
>>   #ifndef _XE_GT_H_
>>   #define _XE_GT_H_
>>   -#include <linux/fault-inject.h>
>> -
>>   #include <drm/drm_util.h>
>>     #include "xe_device.h"
>> @@ -38,12 +36,6 @@
>>       xe_gt_is_media_type(gt_) ? MEDIA_VER(xe) : GRAPHICS_VER(xe); \
>>   })
>>   -extern struct fault_attr gt_reset_failure;
>> -static inline bool xe_fault_inject_gt_reset(void)
>> -{
>> -    return IS_ENABLED(CONFIG_DEBUG_FS) && 
>> should_fail(&gt_reset_failure, 1);
>> -}
>> -
>>   struct xe_gt *xe_gt_alloc(struct xe_tile *tile);
>>   int xe_gt_init_early(struct xe_gt *gt);
>>   int xe_gt_init(struct xe_gt *gt);
>> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c 
>> b/drivers/gpu/drm/xe/xe_hw_error.c
>> index 5135e8e4093f..192e68e847a5 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_error.c
>> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
>> @@ -4,7 +4,6 @@
>>    */
>>     #include <linux/bitmap.h>
>> -#include <linux/fault-inject.h>
>>     #include "regs/xe_gsc_regs.h"
>>   #include "regs/xe_hw_error_regs.h"
>> @@ -12,6 +11,7 @@
>>     #include "xe_device.h"
>>   #include "xe_drm_ras.h"
>> +#include "xe_fault_inject.h"
>>   #include "xe_hw_error.h"
>>   #include "xe_mmio.h"
>>   #include "xe_survivability_mode.h"
>> @@ -25,8 +25,6 @@
>>                            (PVC_COR_ERR_MASK & REG_BIT(err_bit)) : \
>>                            (PVC_FAT_ERR_MASK & REG_BIT(err_bit)))
>>   -extern struct fault_attr inject_csc_hw_error;
>> -
>>   static const char * const error_severity[] = 
>> DRM_XE_RAS_ERROR_SEVERITY_NAMES;
>>     static const char * const hec_uncorrected_fw_errors[] = {
>> @@ -167,11 +165,6 @@ 
>> static_assert(ARRAY_SIZE(pvc_master_local_nonfatal_err_reg) == 
>> XE_RAS_REG_SIZE);
>>                            pvc_master_local_fatal_err_reg : \
>>                            pvc_master_local_nonfatal_err_reg)
>>   -static bool fault_inject_csc_hw_error(void)
>> -{
>> -    return IS_ENABLED(CONFIG_DEBUG_FS) && 
>> should_fail(&inject_csc_hw_error, 1);
>> -}
>> -
>>   static void csc_hw_error_work(struct work_struct *work)
>>   {
>>       struct xe_tile *tile = container_of(work, typeof(*tile), 
>> csc_hw_error_work);
>> @@ -507,7 +500,7 @@ void xe_hw_error_irq_handler(struct xe_tile 
>> *tile, const u32 master_ctl)
>>   {
>>       enum hardware_error hw_err;
>>   -    if (fault_inject_csc_hw_error())
>> +    if (xe_fault_inject(XE_FAULT_CSC_HW_ERROR))
>>           schedule_work(&tile->csc_hw_error_work);
>>         for (hw_err = 0; hw_err < HARDWARE_ERROR_MAX; hw_err++) {
