Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A618AC4345F
	for <intel-xe@archiver.kernel.org>; Wed, 24 Apr 2024 23:49:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CB7B113E9B;
	Wed, 24 Apr 2024 23:49:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OGtPWjpB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEA36113E9B
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Apr 2024 23:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714002558; x=1745538558;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=1zXJIvdPInl+9puc61RCt31ZH/iyoSDDR0snaZx/B7k=;
 b=OGtPWjpBHR51rt7NKGyS4E4N2Qse2bfGwUsIGV2XbnltsNCz7AdxqI6w
 H6rElzIVNsVvpGJtKULuSP6unvSnplpLgLSn+5OZHu+q5hiwo0vYiMIDu
 x8u0zYPNA5MMm08UoCbWDN7urwkILg8k8jW2O0MjxMF1DPMt+FeLUUb/e
 ClRECSE/iVsUmH+jhUtrhWAueXwT+tBEhmjXE+q6SwWuPhmrWpgZJCaqS
 aI2/LQqFxI/Fm+uB1KT3fRbjnou4lA6KX5T6fVlOUrEail1B/vZE9y++F
 eGHAmJFzWOd6303KD5w2tCdfmTK96qtnz041WwsDVvxw8QQD6E8qVtFNr Q==;
X-CSE-ConnectionGUID: yo3BVyRkSxmlL0gl66DAbA==
X-CSE-MsgGUID: YphD9QvnS7m2LeBzflFQnA==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="13451828"
X-IronPort-AV: E=Sophos;i="6.07,227,1708416000"; d="scan'208";a="13451828"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 16:49:18 -0700
X-CSE-ConnectionGUID: GEs+x7tGS2WJbIbwYBepJg==
X-CSE-MsgGUID: FkMDvqTbQnOHZ2pxTc/uFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,227,1708416000"; d="scan'208";a="55820761"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Apr 2024 16:49:18 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 24 Apr 2024 16:49:17 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 24 Apr 2024 16:49:17 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 24 Apr 2024 16:49:17 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 24 Apr 2024 16:49:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oe+9aaQIVhdiDpcWiImCsaBNxGZNzNl2eNEv9gKna3D5ze8uNcS0qLxiYReqdN3mld8CtiQ1m9gU73ZlIzSfCl4WamPV8jpSF5M3v8IxgNtu8D8a36td8ZWEQT6Cra1Thugw1UB7vyt63bAAwbfB/N8siXueMA4r5J/y4GLvRpb3l5ZEYTmYEuHTB/A5w2sPyVwfTpxF9XWc039LD2phHCzyQ7kJQxw4RmBmk76DTWqJ62Jdv45IHMWixgSqE5LZkoa3g8zW3yW3r78ls2Osn41Th0R/65G6QtPvXnmUOQvoU5kIj3TDgWvmVqFddoKK0LQZlBs0q7KMkFIl5xoIXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M6Joxr/QIGig88LveC1fgcxud5hpDokI7nqSytCPgc4=;
 b=gJwLH0sWwrQdEIMt6fdubPjm/fKlmr55xb9j9UwJiMqRB97agxS4Tu6c52Z6LsKMxiRjOlEES1FoiRdG4qqsOYmAEmt0RcMaz26PnTxyYPkYQrOucqWsKf50S1cIGQxRCdkLUV9hjbVGr0mXQB/cxKxHNrQFEWMAgH2mVs3glxbKtjHRlfVvWqqaTQXpOeQXRzXLEaVwx2QJ6lTvz1mF4WLPqdNa0Y1rHUHQBzdGJTRbI09X/zNI8cpGzPUaOILYAFtOnYv3Jd0xrTU3Jp60c+OebRNTnoJ+LNTQUjLlALekfM/toyRKF1guAcynbDzbc2FWCvO78XS1WAtX6pD8FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA0PR11MB7403.namprd11.prod.outlook.com (2603:10b6:208:431::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.21; Wed, 24 Apr
 2024 23:49:15 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7519.020; Wed, 24 Apr 2024
 23:49:14 +0000
Date: Wed, 24 Apr 2024 18:49:11 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: =?utf-8?B?4pyXIENJLktVbml0?= =?utf-8?Q?=3A?= failure for drm/xe:
 Generate oob before compiling anything
Message-ID: <mg2lgbojzxfxhtqlm72ipo4wda7ytbnbt3deg7lvxexlgabxqz@5vi6rereyuoi>
References: <20240411210703.3296782-1-lucas.demarchi@intel.com>
 <171287128167.1341683.16678909560622884204@8e613ede5ea5>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <171287128167.1341683.16678909560622884204@8e613ede5ea5>
X-ClientProxiedBy: BY5PR17CA0067.namprd17.prod.outlook.com
 (2603:10b6:a03:167::44) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA0PR11MB7403:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a036520-2ef5-4431-dc4c-08dc64b925a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z3lMcjkwY0dwc3krTGZVSW1zSHhpcCs4VWRUL0o0M1RjaDhyZE9iMmhETFRm?=
 =?utf-8?B?Z1o2WDZFZzM2cFY3czhKOWI3cGVuRzZKZTBTNjlwMUlLWlVlMVRvVERTbmNu?=
 =?utf-8?B?dFZOMGVmYlZrNlhZYittOWJWQzZQbWpEVUsxa1gvSmRGem5KWW03TkpmNnlr?=
 =?utf-8?B?UGk5ZEpKTy82VTMvdFhzbXBEanZycEwyUW9lRCtsQjQrT1J6RThBcDNtR2VB?=
 =?utf-8?B?TTlyZGkxN3M3eDRxcUF4VlpLa3pNVGpQTU40Z3hTc3EwN3N6U3FFMGhKOEhz?=
 =?utf-8?B?aDVUdmx5YW4zZ08wVHJkR1FJNTQybVBVZjRVYWJGZlpCanJZQ0ZnUmxFVXNM?=
 =?utf-8?B?VXY4VjBjbmRCclkzU0Yrdm0xc21Xbkk2NUU3NDZhaEtpZkxHb0tzQ3E4bDlG?=
 =?utf-8?B?UWZneGVuKzdPMTNLSERGdkltK1A3cEhJMldlaFh2VkwxZnJkTXhjcGJYRnpx?=
 =?utf-8?B?dmUwOFhzc0Iwc3huVU9lTzNXWWxaQ1hRWnJFdnZjRlZqZGtJK2tiVHpIR2Ji?=
 =?utf-8?B?alZJY01mYkNWbTZZaHVUTDdlQm41eXB0VmpGMTdHakRkazRjMWdWU0JLMXlk?=
 =?utf-8?B?dkVmRHFOWW9zaGo3V1RSZGxiZEFZMkxjeVh1VFJ0M042YjFLVSs2OVhjWEN4?=
 =?utf-8?B?ZThqa1Z4dFlVVEdzU0tWT0Q3QXFudVpLbUFtL3JNdUU0TU9lSG9qUjNJOGZy?=
 =?utf-8?B?V2l1ZWM2dVZtV3lYK1hSdVk1Mm94S0xSR1lUeGdOeGVkMXFVZHcvcmpPM1Q3?=
 =?utf-8?B?aW9XS0MvajA3WWxDWnMwTU9UV0lJcTNqbXlRZ0RRNUdrQklYNXJtSnMxQkpy?=
 =?utf-8?B?SnFEY3pQanA5Q2NVblNqSEUzNVVuckVYRzIwa1BidUJ0UStDdEtKNzg2TURq?=
 =?utf-8?B?S3RPQ00waitPL1kvMDFGaTRzTlh6TUxrM3ZNcmNLNS90TzJYOHNrTVV1VlpJ?=
 =?utf-8?B?N0RzRlVnNm1seGF5OXhVN0RjZyt6dWZWZnBFT0J6YmRLNHhyNS9vd1o0Rloy?=
 =?utf-8?B?aVNUL2xzLzBtcFN1c0trWjJKdXgreHg0NGFIMThRTnB4K3F0akhTN2dDeE9T?=
 =?utf-8?B?cmdobDI2NmN6SW9WZEhaUzhCQ2RKaDQybjMvV1VLa3JreU5Odks2bzZHaFp1?=
 =?utf-8?B?M1lEeEU1eEcwR1BDQVMwOWdoVWVnSlg5akVNc2dxMWFLcUREVkJNZ3FORCtr?=
 =?utf-8?B?bERwRHhwN3ZNdWQrVWozQnB6aFVSWDQvMkQrWnNRUHFaNFBBUmQvNDFTMXNq?=
 =?utf-8?B?MFNCWEpHWkxSejhwKzdtMS90YW1uNWNEbWx0UXZBK2wxbnNjUkY1T28ybDZY?=
 =?utf-8?B?bTNTNzB1S2dWaXMrNXBUTVp0YnFyMHJ3eE5iSkg4N2FGMStQcVpBd255aStv?=
 =?utf-8?B?cGRwSmVHWWgyRXlxd01TZTlNeGprQWhndkczengrcXJ6MldoYXNCdm5GNWRM?=
 =?utf-8?B?VXNEQVBEL2wydUNJQ0hSZUhDYytJWGswd2FkQ1ZZeUJ0bUo4ODUvR1p5Z1hZ?=
 =?utf-8?B?S0pZSVNBSHViOTR4ZFgwUU4xYXBxRFJIcE1iYUUxcXZVYkI0eG1mYXRtZFBZ?=
 =?utf-8?B?aTBOSDBUaURTekYwb2lGZVBHV0VaeUpxcDdiM1MyZkxyaFQ2QXNxanQ4T08r?=
 =?utf-8?Q?i+p+l06drIXSgfKb54FqLiKEjPiSpyJH2jXFAB2QfRXc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aGFOQmZZcS9JaHFiNTlILzBrOU5qemVPTXh4RHZ5bmZONUJodWphOTNRbFpO?=
 =?utf-8?B?a3NhN0gxdEFFUm8yKzhpbkpSQWhiQXREVmZ1TndVUUFmZzdBUVliUVRjazF3?=
 =?utf-8?B?YndRbU9CckpKbHFibFlaSFpkY1kxMlNHLy9MaFJkRCtDYit1RWtUS2RiK1dR?=
 =?utf-8?B?clpqL2Fna1Erek5EYkZUbTJHak8yMWY5Wk5JUjhUSmE2Uk9IaXNIUHBxOFZQ?=
 =?utf-8?B?VmdwWllJaytSR29ibVIvUXhyUjZYOUtsT2ZvSjR4Znl1RGRXZm1hbDJqSm9y?=
 =?utf-8?B?SElyTmxmaDN2STZxSjFJbjZoWFphRmFObE5IaEU0RVJVSFE3YlZuYm0ydWFz?=
 =?utf-8?B?Si81QXhCN0xkR0NLdzlMRFRhTEFnZjJianBialY1disrcWlBZFZzSHZXKzA0?=
 =?utf-8?B?b0lHeVNvRlV3c0tyM3B4MXV6djY4bGVtOVZWb0NlbnA3UlZzRGpnN3lNaVFs?=
 =?utf-8?B?TGJCTXFaUUE5MkNzZUgza0thNy9FbHlBc2dqRkJ6SUhJS1NwVkV3elhhUXRn?=
 =?utf-8?B?MDRVZUorNmhEZ3NNQ0dvTXV5cmdMd1pMMi8rNTlqZTJwQ1g4dHNoUkRqTkp6?=
 =?utf-8?B?cHhPWG1WN04wRFNFTGFDVkJNc1ErZGNKNzFMdzlZOFVKZFhoV05ua2o2QlR3?=
 =?utf-8?B?OGpVckRSOHh3NGtoejRPVzlnTk85eUd5cW52N0hnRlRlaGhRUGdJVzBrUEp0?=
 =?utf-8?B?Z1dYeVFRYjNDQUk1MDIzZTUwck9kNzVjeDZZWUlJT2JDeGFwV2FBQ2VXQ1gy?=
 =?utf-8?B?aXRMQ0xSN0hxeUZVdytINjBKRVZvTUlpKzNreTJ5OUMvc3AzMXBXaXJnQmJV?=
 =?utf-8?B?eFhnZi9KRTBpb1FScXVLVkNMckpDWUxwQjdNbGFvdE1MaXhnRHdYLzZQcUJV?=
 =?utf-8?B?RVZWckZ3eDZibjR5WDdDT1o3dVdTYkVZV0JRWGo2SmNLam1YR001VjRwOWFN?=
 =?utf-8?B?YW4wdkpwZUpheVFiUXg0SFVhOXRYQ3F0cjJSOUpwNkdaTWswMkpxN2kyUnZX?=
 =?utf-8?B?NDljL1NUbkNVK090b1dpZElEMlBNa1J1YVJHcnhNWGQ0eG5JUnpBUURNczJD?=
 =?utf-8?B?MU5KZGhWWU8zQ05pMjR4RUcwNGdSUGRiZS9lNVgrOER1TnhKZUpsRWp1bG9v?=
 =?utf-8?B?dFJlNzU3Zzh2dk92SThYOXlPTll0TXhpL2ZuQnJ5dlhZbFQzaUhybDhtbEJX?=
 =?utf-8?B?WWJ2SUsybE81eC8xYzFXTFZ6c2RXUjhTQ1NsZm9hdk8wbVp0ZWtHUFhZOWN1?=
 =?utf-8?B?RE9sSitmMS9GT282aDBWUUR0TUxkcXJzQ2tJZVBFazg3ckFBYzhpTnFCQUNB?=
 =?utf-8?B?RmRmaHN1VWpMS3UyMU4zWXlrTk5oeHhkSmM3dHNrUFIxYk1sZW5oaVdiUjda?=
 =?utf-8?B?RG00SFV2TWl5TXFSSnNCUWNwQVBaeFhsWVJmeWtIQytucnRUTWxxRGIyL0Jn?=
 =?utf-8?B?RkNaSjgxOFI3ZnRXcWNWQjRqSWNmTm9VM3JHdTJzUlNCRm9aVTFPbVhKdUU3?=
 =?utf-8?B?Qk52clR4cmhIcHV0RDBJRXh4Nnh4SkxtVVp6Snp3U3g3RXJYaFpDcXVBSkJ3?=
 =?utf-8?B?V3NxZ0ozYzJSaks2NXMzd0drRVNQUVdqZElkQnJmUlRYTFBlamFRUGN1WGVQ?=
 =?utf-8?B?VzFvZEtZSTlXcERpbndwdzRKVm5rOUwrMFNKT1E0bkI3REh6REo2VEN4ZGQ3?=
 =?utf-8?B?SEsrOVJoYTM2eGRRUkVvYXoyNEhIOFMrZ3YrQ2FNR09STGpOMDNlT0FwTXNt?=
 =?utf-8?B?TnJnT2JuYTRZSExSOHBvdW12TEtJN1I1SmtxSDJWZUtWcVdKMy9wZjluYTJK?=
 =?utf-8?B?WUpJekREeVMwRXh5SHRPTGh5Nng4VFBhUnExbmZ4WklvTFErN2VFcTJyaWRG?=
 =?utf-8?B?Y01ZaEppUGJ0Q21yT2hXalFPSWhOM0oycHdudkUxUjg5cG1pczluR3VpcGxx?=
 =?utf-8?B?MWQ4NVc5aEZuNkFTWFZpS2s1RC83RUROYWNLT2ZkdUZUbTJSaVpZVUFhYU56?=
 =?utf-8?B?Kyt5Tmk0RXNibktodFNNNlRBUTVhMnlxSnByeE5LMzJxSXZKTkFrc3RQK3FJ?=
 =?utf-8?B?aWFKVGRqUE5Mc1NiQjZCakQ0TVFCbmdUOXJsZFY1My94WGFTSC8zZDFMOTVJ?=
 =?utf-8?B?eWNXM2NDZW5mN1ZNZUJYOWJvQWkyQXRzQW1ad3hrNURURFFhVFFjaGM1dWxP?=
 =?utf-8?B?MHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a036520-2ef5-4431-dc4c-08dc64b925a4
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2024 23:49:14.5512 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: krQSex/UmXffe2HYlc1J+Gp6nOQmk6CbOj58E7S/g2WV1QSpYpTydQFXer5EPI3CppXTt2bu5O9alqkrWzfqu1wxmu2w31KCDYHlXTaG9I4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7403
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

+Masahiro

On Thu, Apr 11, 2024 at 09:34:41PM GMT, Patchwork wrote:
>== Series Details ==
>
>Series: drm/xe: Generate oob before compiling anything
>URL   : https://patchwork.freedesktop.org/series/132331/
>State : failure
>
>== Summary ==
>
>+ trap cleanup EXIT
>+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
>ERROR:root:../arch/x86/um/user-offsets.c:17:6: warning: no previous prototype for ‘foo’ [-Wmissing-prototypes]
>   17 | void foo(void)
>      |      ^~~
>In file included from ../arch/um/kernel/asm-offsets.c:1:
>../arch/x86/um/shared/sysdep/kernel-offsets.h:9:6: warning: no previous prototype for ‘foo’ [-Wmissing-prototypes]
>    9 | void foo(void)
>      |      ^~~
>../arch/x86/um/fault.c:18:5: warning: no previous prototype for ‘arch_fixup’ [-Wmissing-prototypes]
>   18 | int arch_fixup(unsigned long address, struct uml_pt_regs *regs)
>      |     ^~~~~~~~~~
>../arch/x86/um/bugs_64.c:9:6: warning: no previous prototype for ‘arch_check_bugs’ [-Wmissing-prototypes]
>    9 | void arch_check_bugs(void)
>      |      ^~~~~~~~~~~~~~~
>../arch/x86/um/bugs_64.c:13:6: warning: no previous prototype for ‘arch_examine_signal’ [-Wmissing-prototypes]
>   13 | void arch_examine_signal(int sig, struct uml_pt_regs *regs)
>      |      ^~~~~~~~~~~~~~~~~~~
>../arch/x86/um/os-Linux/registers.c:146:15: warning: no previous prototype for ‘get_thread_reg’ [-Wmissing-prototypes]
>  146 | unsigned long get_thread_reg(int reg, jmp_buf *buf)
>      |               ^~~~~~~~~~~~~~
>../arch/um/os-Linux/skas/process.c:107:6: warning: no previous prototype for ‘wait_stub_done’ [-Wmissing-prototypes]
>  107 | void wait_stub_done(int pid)
>      |      ^~~~~~~~~~~~~~
>../arch/x86/um/vdso/um_vdso.c:16:5: warning: no previous prototype for ‘__vdso_clock_gettime’ [-Wmissing-prototypes]
>   16 | int __vdso_clock_gettime(clockid_t clock, struct __kernel_old_timespec *ts)
>      |     ^~~~~~~~~~~~~~~~~~~~
>../arch/x86/um/vdso/um_vdso.c:30:5: warning: no previous prototype for ‘__vdso_gettimeofday’ [-Wmissing-prototypes]
>   30 | int __vdso_gettimeofday(struct __kernel_old_timeval *tv, struct timezone *tz)
>      |     ^~~~~~~~~~~~~~~~~~~
>../arch/x86/um/vdso/um_vdso.c:44:21: warning: no previous prototype for ‘__vdso_time’ [-Wmissing-prototypes]
>   44 | __kernel_old_time_t __vdso_time(__kernel_old_time_t *t)
>      |                     ^~~~~~~~~~~
>../arch/x86/um/vdso/um_vdso.c:57:1: warning: no previous prototype for ‘__vdso_getcpu’ [-Wmissing-prototypes]
>   57 | __vdso_getcpu(unsigned *cpu, unsigned *node, struct getcpu_cache *unused)
>      | ^~~~~~~~~~~~~
>../arch/um/os-Linux/skas/process.c:683:6: warning: no previous prototype for ‘__switch_mm’ [-Wmissing-prototypes]
>  683 | void __switch_mm(struct mm_id *mm_idp)
>      |      ^~~~~~~~~~~
>../arch/x86/um/os-Linux/mcontext.c:7:6: warning: no previous prototype for ‘get_regs_from_mc’ [-Wmissing-prototypes]
>    7 | void get_regs_from_mc(struct uml_pt_regs *regs, mcontext_t *mc)
>      |      ^~~~~~~~~~~~~~~~
>../arch/um/kernel/skas/mmu.c:17:5: warning: no previous prototype for ‘init_new_context’ [-Wmissing-prototypes]
>   17 | int init_new_context(struct task_struct *task, struct mm_struct *mm)
>      |     ^~~~~~~~~~~~~~~~
>../arch/um/kernel/skas/mmu.c:60:6: warning: no previous prototype for ‘destroy_context’ [-Wmissing-prototypes]
>   60 | void destroy_context(struct mm_struct *mm)
>      |      ^~~~~~~~~~~~~~~
>../arch/um/os-Linux/main.c:187:7: warning: no previous prototype for ‘__wrap_malloc’ [-Wmissing-prototypes]
>  187 | void *__wrap_malloc(int size)
>      |       ^~~~~~~~~~~~~
>../arch/um/os-Linux/main.c:208:7: warning: no previous prototype for ‘__wrap_calloc’ [-Wmissing-prototypes]
>  208 | void *__wrap_calloc(int n, int size)
>      |       ^~~~~~~~~~~~~
>../arch/um/os-Linux/main.c:222:6: warning: no previous prototype for ‘__wrap_free’ [-Wmissing-prototypes]
>  222 | void __wrap_free(void *ptr)
>      |      ^~~~~~~~~~~
>../arch/um/kernel/skas/process.c:36:12: warning: no previous prototype for ‘start_uml’ [-Wmissing-prototypes]
>   36 | int __init start_uml(void)
>      |            ^~~~~~~~~
>../arch/um/os-Linux/mem.c:28:6: warning: no previous prototype for ‘kasan_map_memory’ [-Wmissing-prototypes]
>   28 | void kasan_map_memory(void *start, size_t len)
>      |      ^~~~~~~~~~~~~~~~
>../arch/um/os-Linux/mem.c:212:13: warning: no previous prototype for ‘check_tmpexec’ [-Wmissing-prototypes]
>  212 | void __init check_tmpexec(void)
>      |             ^~~~~~~~~~~~~
>../arch/x86/um/ptrace_64.c:111:5: warning: no previous prototype for ‘poke_user’ [-Wmissing-prototypes]
>  111 | int poke_user(struct task_struct *child, long addr, long data)
>      |     ^~~~~~~~~
>../arch/x86/um/ptrace_64.c:171:5: warning: no previous prototype for ‘peek_user’ [-Wmissing-prototypes]
>  171 | int peek_user(struct task_struct *child, long addr, long data)
>      |     ^~~~~~~~~
>../arch/um/kernel/mem.c:202:8: warning: no previous prototype for ‘pgd_alloc’ [-Wmissing-prototypes]
>  202 | pgd_t *pgd_alloc(struct mm_struct *mm)
>      |        ^~~~~~~~~
>../arch/um/kernel/mem.c:215:7: warning: no previous prototype for ‘uml_kmalloc’ [-Wmissing-prototypes]
>  215 | void *uml_kmalloc(int size, int flags)
>      |       ^~~~~~~~~~~
>../arch/um/os-Linux/signal.c:75:6: warning: no previous prototype for ‘sig_handler’ [-Wmissing-prototypes]
>   75 | void sig_handler(int sig, struct siginfo *si, mcontext_t *mc)
>      |      ^~~~~~~~~~~
>../arch/um/os-Linux/signal.c:111:6: warning: no previous prototype for ‘timer_alarm_handler’ [-Wmissing-prototypes]
>  111 | void timer_alarm_handler(int sig, struct siginfo *unused_si, mcontext_t *mc)
>      |      ^~~~~~~~~~~~~~~~~~~
>../arch/um/os-Linux/start_up.c:301:12: warning: no previous prototype for ‘parse_iomem’ [-Wmissing-prototypes]
>  301 | int __init parse_iomem(char *str, int *add)
>      |            ^~~~~~~~~~~
>../arch/x86/um/signal.c:560:6: warning: no previous prototype for ‘sys_rt_sigreturn’ [-Wmissing-prototypes]
>  560 | long sys_rt_sigreturn(void)
>      |      ^~~~~~~~~~~~~~~~
>../arch/um/kernel/process.c:51:5: warning: no previous prototype for ‘pid_to_processor_id’ [-Wmissing-prototypes]
>   51 | int pid_to_processor_id(int pid)
>      |     ^~~~~~~~~~~~~~~~~~~
>../arch/um/kernel/process.c:87:7: warning: no previous prototype for ‘__switch_to’ [-Wmissing-prototypes]
>   87 | void *__switch_to(struct task_struct *from, struct task_struct *to)
>      |       ^~~~~~~~~~~
>../arch/um/kernel/process.c:140:6: warning: no previous prototype for ‘fork_handler’ [-Wmissing-prototypes]
>  140 | void fork_handler(void)
>      |      ^~~~~~~~~~~~
>../arch/um/kernel/process.c:217:6: warning: no previous prototype for ‘arch_cpu_idle’ [-Wmissing-prototypes]
>  217 | void arch_cpu_idle(void)
>      |      ^~~~~~~~~~~~~
>../arch/um/kernel/process.c:253:5: warning: no previous prototype for ‘copy_to_user_proc’ [-Wmissing-prototypes]
>  253 | int copy_to_user_proc(void __user *to, void *from, int size)
>      |     ^~~~~~~~~~~~~~~~~
>../arch/um/kernel/process.c:263:5: warning: no previous prototype for ‘clear_user_proc’ [-Wmissing-prototypes]
>  263 | int clear_user_proc(void __user *buf, int size)
>      |     ^~~~~~~~~~~~~~~
>../arch/um/kernel/process.c:271:6: warning: no previous prototype for ‘set_using_sysemu’ [-Wmissing-prototypes]
>  271 | void set_using_sysemu(int value)
>      |      ^~~~~~~~~~~~~~~~
>../arch/um/kernel/process.c:278:5: warning: no previous prototype for ‘get_using_sysemu’ [-Wmissing-prototypes]
>  278 | int get_using_sysemu(void)
>      |     ^~~~~~~~~~~~~~~~
>../arch/um/kernel/process.c:316:12: warning: no previous prototype for ‘make_proc_sysemu’ [-Wmissing-prototypes]
>  316 | int __init make_proc_sysemu(void)
>      |            ^~~~~~~~~~~~~~~~
>../arch/um/kernel/process.c:348:15: warning: no previous prototype for ‘arch_align_stack’ [-Wmissing-prototypes]
>  348 | unsigned long arch_align_stack(unsigned long sp)
>      |               ^~~~~~~~~~~~~~~~
>../arch/um/kernel/reboot.c:45:6: warning: no previous prototype for ‘machine_restart’ [-Wmissing-prototypes]
>   45 | void machine_restart(char * __unused)
>      |      ^~~~~~~~~~~~~~~
>../arch/um/kernel/reboot.c:51:6: warning: no previous prototype for ‘machine_power_off’ [-Wmissing-prototypes]
>   51 | void machine_power_off(void)
>      |      ^~~~~~~~~~~~~~~~~
>../arch/um/kernel/reboot.c:57:6: warning: no previous prototype for ‘machine_halt’ [-Wmissing-prototypes]
>   57 | void machine_halt(void)
>      |      ^~~~~~~~~~~~
>../arch/um/kernel/tlb.c:579:6: warning: no previous prototype for ‘flush_tlb_mm_range’ [-Wmissing-prototypes]
>  579 | void flush_tlb_mm_range(struct mm_struct *mm, unsigned long start,
>      |      ^~~~~~~~~~~~~~~~~~
>../arch/um/kernel/tlb.c:594:6: warning: no previous prototype for ‘force_flush_all’ [-Wmissing-prototypes]
>  594 | void force_flush_all(void)
>      |      ^~~~~~~~~~~~~~~
>../arch/um/kernel/um_arch.c:408:19: warning: no previous prototype for ‘read_initrd’ [-Wmissing-prototypes]
>  408 | int __init __weak read_initrd(void)
>      |                   ^~~~~~~~~~~
>../arch/um/kernel/um_arch.c:461:7: warning: no previous prototype for ‘text_poke’ [-Wmissing-prototypes]
>  461 | void *text_poke(void *addr, const void *opcode, size_t len)
>      |       ^~~~~~~~~
>../arch/um/kernel/um_arch.c:473:6: warning: no previous prototype for ‘text_poke_sync’ [-Wmissing-prototypes]
>  473 | void text_poke_sync(void)
>      |      ^~~~~~~~~~~~~~
>../arch/um/kernel/kmsg_dump.c:60:12: warning: no previous prototype for ‘kmsg_dumper_stdout_init’ [-Wmissing-prototypes]
>   60 | int __init kmsg_dumper_stdout_init(void)
>      |            ^~~~~~~~~~~~~~~~~~~~~~~
>../arch/x86/um/syscalls_64.c:48:6: warning: no previous prototype for ‘arch_switch_to’ [-Wmissing-prototypes]
>   48 | void arch_switch_to(struct task_struct *to)
>      |      ^~~~~~~~~~~~~~
>../drivers/gpu/drm/xe/xe_gsc.c:10:10: fatal error: generated/xe_wa_oob.h: No such file or directory
>   10 | #include <generated/xe_wa_oob.h>
>      |          ^~~~~~~~~~~~~~~~~~~~~~~


So, I'm trying to make this generic so the generated .h/.c are done
before anything else is attempted. I'm puzzled that this works for me
for x86-64 with xe as a module or built-in, but for some reason is
failing when using ARCH=um.

Any idea what's going on?

thanks
Lucas De Marchi

>compilation terminated.
>make[7]: *** [../scripts/Makefile.build:244: drivers/gpu/drm/xe/xe_gsc.o] Error 1
>make[7]: *** Waiting for unfinished jobs....
>make[6]: *** [../scripts/Makefile.build:485: drivers/gpu/drm/xe] Error 2
>make[6]: *** Waiting for unfinished jobs....
>../lib/iomap.c:156:5: warning: no previous prototype for ‘ioread64_lo_hi’ [-Wmissing-prototypes]
>  156 | u64 ioread64_lo_hi(const void __iomem *addr)
>      |     ^~~~~~~~~~~~~~
>../lib/iomap.c:163:5: warning: no previous prototype for ‘ioread64_hi_lo’ [-Wmissing-prototypes]
>  163 | u64 ioread64_hi_lo(const void __iomem *addr)
>      |     ^~~~~~~~~~~~~~
>../lib/iomap.c:170:5: warning: no previous prototype for ‘ioread64be_lo_hi’ [-Wmissing-prototypes]
>  170 | u64 ioread64be_lo_hi(const void __iomem *addr)
>      |     ^~~~~~~~~~~~~~~~
>../lib/iomap.c:178:5: warning: no previous prototype for ‘ioread64be_hi_lo’ [-Wmissing-prototypes]
>  178 | u64 ioread64be_hi_lo(const void __iomem *addr)
>      |     ^~~~~~~~~~~~~~~~
>../lib/iomap.c:264:6: warning: no previous prototype for ‘iowrite64_lo_hi’ [-Wmissing-prototypes]
>  264 | void iowrite64_lo_hi(u64 val, void __iomem *addr)
>      |      ^~~~~~~~~~~~~~~
>../lib/iomap.c:272:6: warning: no previous prototype for ‘iowrite64_hi_lo’ [-Wmissing-prototypes]
>  272 | void iowrite64_hi_lo(u64 val, void __iomem *addr)
>      |      ^~~~~~~~~~~~~~~
>../lib/iomap.c:280:6: warning: no previous prototype for ‘iowrite64be_lo_hi’ [-Wmissing-prototypes]
>  280 | void iowrite64be_lo_hi(u64 val, void __iomem *addr)
>      |      ^~~~~~~~~~~~~~~~~
>../lib/iomap.c:288:6: warning: no previous prototype for ‘iowrite64be_hi_lo’ [-Wmissing-prototypes]
>  288 | void iowrite64be_hi_lo(u64 val, void __iomem *addr)
>      |      ^~~~~~~~~~~~~~~~~
>make[5]: *** [../scripts/Makefile.build:485: drivers/gpu/drm] Error 2
>make[4]: *** [../scripts/Makefile.build:485: drivers/gpu] Error 2
>make[3]: *** [../scripts/Makefile.build:485: drivers] Error 2
>make[3]: *** Waiting for unfinished jobs....
>make[2]: *** [/kernel/Makefile:1919: .] Error 2
>make[1]: *** [/kernel/Makefile:240: __sub-make] Error 2
>make: *** [Makefile:240: __sub-make] Error 2
>
>[21:34:13] Configuring KUnit Kernel ...
>Generating .config ...
>Populating config with:
>$ make ARCH=um O=.kunit olddefconfig
>[21:34:17] Building KUnit Kernel ...
>Populating config with:
>$ make ARCH=um O=.kunit olddefconfig
>Building with:
>$ make ARCH=um O=.kunit --jobs=48
>+ cleanup
>++ stat -c %u:%g /kernel
>+ chown -R 1003:1003 /kernel
>
>
