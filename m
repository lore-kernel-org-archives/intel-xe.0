Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08E8DC25B74
	for <intel-xe@archiver.kernel.org>; Tue, 21 May 2024 04:04:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7293D10E180;
	Tue, 21 May 2024 04:04:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="km7TnG/E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1682310E180
 for <intel-xe@lists.freedesktop.org>; Tue, 21 May 2024 04:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716264245; x=1747800245;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+NOlzlxLJ6P3E+N3hBBZtVuYVxqATxuRnY+08RmGb4E=;
 b=km7TnG/EWNxDrOBBtYcVTXNV1wdnjjyvrA/Hkc3hHGubBvtYuifT/o0J
 CPfSg/3yszLcDBwmDD7ahoRcjFZES+fGJbJsQStnvYNTpqMeCODICJglH
 lMAd6rzt0MRJazGsH+QraRb+DjVxuh8nvMmyDOzuKM+mTEB+pdQN8m1Po
 BMa8nDUMOI+fbhHwjslm4RETFn80HnHDZe9s9eL8KoTT/cy6H90vdLYQW
 Gtn3R7Vnv8Sza6DOIyEpUM+VrDBxTAcWO/4cKQI3eFngLfIMGGJrAfAUd
 YtOBjHAQr44HuKjF29rQDsiACn0AfWvE7YmKRE3EIUpT3gmYGwI/kr4lI w==;
X-CSE-ConnectionGUID: wvIoZA2TTxqZKC3/2+6yYA==
X-CSE-MsgGUID: WKR4kt4LT/eE92LMZ6ks2w==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="12224682"
X-IronPort-AV: E=Sophos;i="6.08,176,1712646000"; d="scan'208";a="12224682"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2024 21:04:04 -0700
X-CSE-ConnectionGUID: YIZ86BCLR8m4GdqIzthkrQ==
X-CSE-MsgGUID: sveNbc7fQeiVsgziXGOrrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,176,1712646000"; d="scan'208";a="37143846"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 May 2024 21:04:04 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 20 May 2024 21:04:04 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 20 May 2024 21:04:03 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 20 May 2024 21:04:03 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 20 May 2024 21:04:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MR938s8KtpHObgHac0hOjvy9AY/ZdGHiQ1oK53t4zAszjD8gI0O6s/bQTamfniWuUVZSRi+QOQLF7SPYexOFFJbFx4nrJcnEvCWGG9GloGeq5bgr7Dt8TJjVHBtLh7BgkNHgjmAIH6cXo5HZmU8nhwP/FnAYJSXrkAPnmmMUyxsPmFnaVjxXPKIQidD026bOUPccZVxMIokVuTTiW4fk9CwIqTcOcqHk6/6yAYJw7+DuJ1QruKK9hU3eltQiFBkvDoNNf90Q0TeSwd/1XOo2g4dMoHKBzNh8KdYSAP4SFJCPMkWIbT+yPDkp0K2ajvut9yAG0qj4CPwAYyNxW7TlJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SHvAjKPmXPK25Su5vdoSIB8d0E56HlCo2h/uiSkLSsc=;
 b=A5lUNYlgVEd2GtA8oj/A/bswT11r4uwFHZv0JQGg6C5eAWl1TdD6npsyVXQlmqflyTvy4iXFfZqVMklznG/k9f4Ec55oBelcN28o7PKYD8LQc6QBSEJTDRoEOsmG5gca0YNIRRAmD81+Z8Yb2C0OR2M8Z/g9cD8rQh73oJIN419vkJszLp3jlANIQ/V3cTvf6QYP/or7mceDBaIFDA2CnsJmWV9prF+ALoyf/nK4qAsVQNRPvltt2m8lwy8FG+bDBkVRiGWT4aGq9Kcfp8s0LbodEsFCjB19kldQkTpnNAst4rglL9cWlROWEEDlgn7w/xutfk19g/NndGBFIbtk8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by PH8PR11MB6660.namprd11.prod.outlook.com (2603:10b6:510:1c3::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Tue, 21 May
 2024 04:03:56 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::ff2a:1235:d1ba:4f93]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::ff2a:1235:d1ba:4f93%3]) with mapi id 15.20.7587.035; Tue, 21 May 2024
 04:03:56 +0000
Message-ID: <409f498a-d1b0-4b4a-82a6-2386c6707485@intel.com>
Date: Tue, 21 May 2024 09:33:48 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe/guc: Allow to initialize submission with
 limited set of IDs
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>
References: <20240520212330.2436-1-michal.wajdeczko@intel.com>
 <20240520212330.2436-2-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240520212330.2436-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0P287CA0010.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::15) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|PH8PR11MB6660:EE_
X-MS-Office365-Filtering-Correlation-Id: d0892db2-e78f-4025-bb27-08dc794b08c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YW1EdlducktPZjd1b0dwOWdveW9PQVVyL1YwUjVLT21CWXdGd1RYOW1HZVRw?=
 =?utf-8?B?czlzZG5DN3lJRHFQaXRZc1J3eDkyZ09PWkF0QjVPQzZzYWo1emdLU3BHamRY?=
 =?utf-8?B?YXR6Uk50MkJWRnRsNEFaWUdtdUoxMW55Y3VWVXZUTHM1cm5nOGhhcWo0NE5M?=
 =?utf-8?B?VFhqVkVPM0xBUS9tL0h0Z0pFVVdHcnZvMnVEQ3dOSVlMUnY0NnlyeEhXTHNX?=
 =?utf-8?B?U0Z1Q2M0em9YY3RIU0pCQ3VmRlV0M0d1VDNjemZVdlJhR0RWNUdKK0svRHAv?=
 =?utf-8?B?Z0JyaE9HUzNEVWc3UXFqSU9FRGUwdmI0eW1xVTdDY0x2Y2Vjd3IzMzNkZ0cr?=
 =?utf-8?B?Rndtd1Y4ZGJHazN1SDYyUDVpNW5NQU44cVYrL21JR1NSSGo1OXdwZko4VEp6?=
 =?utf-8?B?ZUdId0F0dFFMcnBpYWg0VnlDRlRXNXlPSXB6eEw2QnNRUUo1OWM2VVZzUUhF?=
 =?utf-8?B?VzdMekppV0tuQzh2SzluUXlGaDFSUUFqL3J3S3J1bWVSbC9Zb2xGYjF5R1RM?=
 =?utf-8?B?Z1BUSWhBRUk4V1VZbm1XbDZaak13MXdxU01nSG9zOEg5Tm45Tll6OEZDWHcx?=
 =?utf-8?B?Q1ovRUNIYTlTVTBMSlUxbHZUUm54dllEMCtnZnZGeVo3aUhhOGNHNjQ2TUdv?=
 =?utf-8?B?ZldtYmRpVWVpZHdEUkJmRytrZThCNmFSYUlhKzhJeHBWMWRnNlBWdzdZeXBZ?=
 =?utf-8?B?Nk1UL0JXRHZMSHE3ckc5M1huejIxVHQ0NGhHSFZzRTczenVnMWtscDIvNWJF?=
 =?utf-8?B?cUJONnFTckl1T21oRjlQdnIyaGd3Q0tPOTVZWHBRa0dwQXJwRHVTNW9yYUZu?=
 =?utf-8?B?WkpCK2s0bU9TcU96NmhIWTZYRmt2akx0UjE0M0NtVWdIbUZIMy9yUEM1S0F6?=
 =?utf-8?B?a1lQSHRWL2NISnE1MzFXRy8yZFBETjhDSVFDSkw1OXBzd0FPN3d2Q0NISWd0?=
 =?utf-8?B?aEdxcEFiT0pjdkRyQ3o4MUhKbHRoN0pMTjZ6cmZub1dJSXl3M0hqVXJ2RjF2?=
 =?utf-8?B?T0FGbjU5SnJqMk9HTmxob0dTeUNDSzdPWmQrcW1ST0lOQ0dwcDh3QnVkUFdt?=
 =?utf-8?B?cU51S04vRW1yMUVYNVh0dlkvcXFYL05yeDh2STlUKzJ4bUxvSzkwbWJuUTFV?=
 =?utf-8?B?VlNQUHBjdmtQOHVvRE9pOEZMaGh2VHRGVE5aSzlTdmQzVFVidzhoRUF0TFpT?=
 =?utf-8?B?QTY0N2dSU2lVZytrcFloY3BuazBHQ1hiQnFsUEJjMjkvM2hhc1cvd3pMSDND?=
 =?utf-8?B?aFhFb21ybHpzLzIxd2xFZ1NrUCt3TmdNdzhvdnVLcml3QXJudWFaa3VBWmh2?=
 =?utf-8?B?dkN6amlEWmxza2cvSzU3NDRLUjlxcDBMUkZQdGJ3eU94bnNuT0tmT29NOFBz?=
 =?utf-8?B?VmMxTDBiaERKRFJGSjhRUWdUM25aVVNEUXRyam9xVUhGN01aRjlrajVXTW40?=
 =?utf-8?B?enY4Y3ozR2NFeUQwUWtVdGdaOTVXSDE2VGtXS3RUejJraFZPSDhidGRieTdB?=
 =?utf-8?B?QysxdGdjUjMxTDJJeEhySHIwMi8yV1NaNlJHRVAxekhaOEM3T0xXOEVQTEw5?=
 =?utf-8?B?OHNYaG12K3pRVDc5UzhicGhuckxhclhsc0lSTWYramNBTEJKYjc0NytjeXIz?=
 =?utf-8?B?NXlwVGdxc2tlaUVTTTRmUHl0VGJFejFLL1hsSXg0U0VDWHVTWkU4U1VOTnJ3?=
 =?utf-8?B?YW9CSExUUHp4eXNCQzlqWDM4VEZ1Zkx1Q3B1d0dhWjFnNFZobmhFaWJRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZFcyWWxNdkUrTGYzeVkxWGFDRm5lbStGSWNFNUhnYWlMbnVFRGlmNmFlZGFN?=
 =?utf-8?B?WWpDQktzNk56RU95WWpxdzV5SzlJYk9MNWNLTHdGRElnZFhyenUzNEhwK2ZL?=
 =?utf-8?B?Ky9PVW9iRXRZNWFDM1ltZUI0eXlrclZMTEVYbU5ZK0x4Y2FBUHlGOWEvTkVJ?=
 =?utf-8?B?ZXFVTlFWL3M0ZXRLdW5zYlRiaEZmdGZ5ZFdoc0tocDVuNFpPZW16UEZTcmt5?=
 =?utf-8?B?VEl1cXc2UTYzQUkwdjBEMDcvaXdwNUtsN2wwbWpRSFc0eUlaZ215L3YxUTJp?=
 =?utf-8?B?QythQnFCTTg4NU5EWVIyYlIreTRCUlFtTDhSR3U0bVIxSHIyQW1qSnpkT3hB?=
 =?utf-8?B?MThPZDdhNnZ4NzNyZ2FWUzRCOWNJaUQxR2cwSTZCdjMrMFNCdFo2TVMvM0d0?=
 =?utf-8?B?dlNzRHpLdkw0cXViUDAyVDYxVmdyNmtLQU5xdU50TzZUOThrQTl0cFRYZFNn?=
 =?utf-8?B?NnhZR2FSZTZ3UUR2ZURuMDVPdjk0SGcvYTEzTXE2TXp2Umd4WCs3SGlDRnlO?=
 =?utf-8?B?anZnQjhvenV1YnIvUlFCa0p6VGQxTDBvZEJickd1NEpPWWxKMEVPZU0vMTRU?=
 =?utf-8?B?YmV6M2NxZ296MnR2R2piRy9LVFcrRTFhdUpTQ0N6elVPcGt2eE04Vm1Vc2l4?=
 =?utf-8?B?bWpjQ1VSNk54RUFrSy82bkdYalI2Z01CR1BmTFJWOUJxM2M4SGN4RGQ2Ti9r?=
 =?utf-8?B?cnNnOUlpT1FxRy9qTTEySXlKM25RdDFVeHM5SXpxNTZuRHE5NVhwQ3VwRHlF?=
 =?utf-8?B?R0pHUFJoYi9HclNrTEJqam83OFJQVGlYUFR1WXhzVjRSaVZDVkJyVGlZalFz?=
 =?utf-8?B?NEJmK2pEU1FPZFM3SThuRWZ4L2tuVkpkWGVORzJCT0hRWEo2NmJyZ1BJYnVG?=
 =?utf-8?B?WG92bW1GWitzWUJKQmRKaU9yam1CWDkvVXU1Uk9DbHBWd3gwb29DczBJd1V6?=
 =?utf-8?B?UXVsbGQ1bEVsU2lHaDYxUExYdkg4Z21nZnpVdGtGR3FPdmU3OG93WlhwNmFQ?=
 =?utf-8?B?ZDFMZnluM3hwT0JucHN1YWZrMWZmZlNLVG9YaXA4QzM4SjNpZ1VZa0t5dVEz?=
 =?utf-8?B?NGxoSFNJUDlIa09DV0dMbkhJR0hvSHc4aVZNVS9rSVdJOEM1eDdoWCs3cVcx?=
 =?utf-8?B?RG8xblo2ZXJidlptRkxwUTRqMmxEVnFValpvU1RyMVl5Q01FeUNvVnFLdTJY?=
 =?utf-8?B?dGpESDMzdlJVdXFVWmRYcEhQdHloWVJLQjhaNGFpTVU0U2RVdkZqNUxWNGs4?=
 =?utf-8?B?WWNaL3NsU2VOVjkzR01pQ1o1dG5KUWRLRjhPR2k0blFUaW5SN29JS1lDeXFM?=
 =?utf-8?B?YTVvVmlCV2ttQTcrT1ZtUFYxMCtVa1ZvRzVFanRvRVNNcWwvNWFZbVRFM2Z6?=
 =?utf-8?B?UDhmbXI1c1NrNExCc3BMZnVhWTJOSkNDQTBkelNlTWdQOXFjZ3BsWjcyZ2hr?=
 =?utf-8?B?d2MvK2prYlM3QUVCVTN0TXAxVytZSE9Lbll3WkRUQXFTYkpDWjIrU0RpYmRE?=
 =?utf-8?B?eVlJWCttQ29XaVZWMVRPdmwrend0VW1IbmVEOVBwTStzSHhYZ3ZKd0dUL0ZV?=
 =?utf-8?B?UzRhZkpiMWNhNE9IUVlSaGN1UXIrZUplMCtMZWJ0a3A3K2pMcjFZQkVINEds?=
 =?utf-8?B?UU1tNllkYTdSTkl0R3ZNOGNySUR1VWV3ZjlpaytuaXJvRUpkV2NtMHZqRXl3?=
 =?utf-8?B?VjFPN2pQbEZJeGxrdVdBVGg0Ny9kdi9ma3pDblFkTW1Pam1COEZodm1ydlcr?=
 =?utf-8?B?VW9YaytMUldSQWk2Q3Q5UjExNVJaSyt2YXlOWEZxTnpQNXN6L3M1NEFYa3Iz?=
 =?utf-8?B?b0ZBN09iQjh3WTNkcFAwc21lM2dKbjBrbEpMUXU4a0lXWEMyaUQ1d2FpUkZC?=
 =?utf-8?B?OHJSbDBEVk5XNTJjUlc0TDlGckxDbExHTFBMZDUwYmNyVUdvcGxiMDdleUJu?=
 =?utf-8?B?bGpkUU03VUJVVnVXRlFDMjU3dzBDNERWRmZCUDV5ajY4UmFxSW1qQ09uSHls?=
 =?utf-8?B?NjNmeldHNzRjaE01MjR5SHRkcUUrYjIxZllqemFVSi9Gd3ZFYlloV1ptS09y?=
 =?utf-8?B?VGJoczA0TSs1dWJiWmc3Qm5NUW5tVWRTQ2dJQ0M2U1VqNldBTVRBeStZQjlw?=
 =?utf-8?B?VW9aTTUzSmVDWGFTZGJCdjdhWjJYTFpURnJPZ1YyNFhudTUrYUhIZ216THdi?=
 =?utf-8?B?YXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d0892db2-e78f-4025-bb27-08dc794b08c8
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2024 04:03:55.9560 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Oz7Nnv+McdF78AX8s9pR4GlGdLDAWHGvDxu5NedjmiT4bIAtfukYQgwWOF7mf424VGgxCmA3Coc7DFCFKdQM54PgbjXG4EgmCoBL0TlDm3I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6660
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


On 21-05-2024 02:53, Michal Wajdeczko wrote:
> While PF and native drivers may initialize submission code to use
> all available GuC contexts IDs, the VF driver may only use limited
> number of IDs. Update init function to accept number of context
> IDs available for use.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc.c        | 2 +-
>   drivers/gpu/drm/xe/xe_guc_submit.c | 4 ++--
>   drivers/gpu/drm/xe/xe_guc_submit.h | 2 +-
>   3 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index e52b544ac690..807ad53449e4 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -358,7 +358,7 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
>   
>   	guc_init_params_post_hwconfig(guc);
>   
> -	ret = xe_guc_submit_init(guc);
> +	ret = xe_guc_submit_init(guc, ~0);
>   	if (ret)
>   		return ret;
>   
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 4efb88e3e056..9a7885a9b4c1 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -278,7 +278,7 @@ static void primelockdep(struct xe_guc *guc)
>   	fs_reclaim_release(GFP_KERNEL);
>   }
>   
> -int xe_guc_submit_init(struct xe_guc *guc)
> +int xe_guc_submit_init(struct xe_guc *guc, unsigned int num_ids)


Please add a kernel doc.


>   {
>   	struct xe_device *xe = guc_to_xe(guc);
>   	struct xe_gt *gt = guc_to_gt(guc);
> @@ -288,7 +288,7 @@ int xe_guc_submit_init(struct xe_guc *guc)
>   	if (err)
>   		return err;
>   
> -	err = xe_guc_id_mgr_init(&guc->submission_state.idm, ~0);
> +	err = xe_guc_id_mgr_init(&guc->submission_state.idm, num_ids);
>   	if (err)
>   		return err;
>   
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
> index 4275b7da9df5..4ad5f4c1b084 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.h
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.h
> @@ -12,7 +12,7 @@ struct drm_printer;
>   struct xe_exec_queue;
>   struct xe_guc;
>   
> -int xe_guc_submit_init(struct xe_guc *guc);
> +int xe_guc_submit_init(struct xe_guc *guc, unsigned int num_ids);
>   
>   int xe_guc_submit_reset_prepare(struct xe_guc *guc);
>   void xe_guc_submit_reset_wait(struct xe_guc *guc);
