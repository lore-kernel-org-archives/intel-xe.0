Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32B32C79FB9
	for <intel-xe@archiver.kernel.org>; Thu, 10 Sep 2026 11:46:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB47310F46D;
	Thu, 10 Sep 2026 11:46:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Eb6awqle";
	dkim-atps=neutral
X-Greylist: delayed 424 seconds by postgrey-1.36 at gabe;
 Thu, 10 Sep 2026 11:46:55 UTC
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D78F910E5E1
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Sep 2026 11:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789040815; x=1820576815;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=F3YnvaN5WZC2wXZBSYR8TCPiG2V0XaQrM+o7ecVWPyQ=;
 b=Eb6awqledD3T9bh/E9p5Kn3waSIYcOo43j8IwXAAYlFmCdeXrjZ0mWye
 kzw//Po5NVknosWz86EGJfwm3CDAZfX2FvepdXoaD69XsJYQXsyhCz3NY
 10/JJS0k7GGEeFP9+9LYjM80WCQ7JtcGwlBA0XJpC0xhByE7RNCEzpGM3
 vZE1WwkTB49OeN2vO1dyZXByUELzLKsNLm7GNrCJdNOE/8pHcYA5nT1AW
 w4yRw11i0alXnQhjIRR4ykOQm4xJdxmpUZPTnuF6nrtQTv78x3yK2RMfp
 buj0BroOMmBdAmKv9CJkj0crVmdF8M+bEEMvkbPR57AaszU2Rgb54LMUy A==;
X-CSE-ConnectionGUID: lAne/K+sQoGsNu8ZlELW0g==
X-CSE-MsgGUID: B2FVUQT8Q/+9hLnryAAE5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="9266"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208,217";a="9266"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa116.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 04:39:52 -0700
X-CSE-ConnectionGUID: ttqmoaF6TN+rFuplwXXOlw==
X-CSE-MsgGUID: oUT+MHuWRJaYKgdK0tHiWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; d="scan'208,217";a="272111820"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 04:39:50 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 04:39:50 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 10 Sep 2026 04:39:50 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.2) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 04:39:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y+qxlbeaQaeI5o0UgrHWIDhCVkEm/Wlg7056hJGyDTzAvDCqK9QhXsAfTrADfHk/U1ZL1TlJZ09TP2sLo1fdBObowj7Y2Bp7HARZfLFCtvtyvCOyqFmwvXBlNDSoAw0k9ZCJUDA5uwsi4bvmaXlF+Y5L2i78O7eG9sfEWF+slULxpU5JspzJaDGSerW7SZBDEWuyDetomGyKiJU9WP5I+IDCjZtJCgWgjX0aL5/Uow3r4ePmnsZW9BbVaj+ZcHHbDbDZHl1u+TbrFHsFb2+hNmRVwh+6fdsKL1QJOw/qYuZHEYuL9CPjSLQVJKYRCG9wbzYZNtEbVfqhNIcAbPubBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GWlylxev0sLALupU42GXhHXkvLWPLEg+gJD8sYCNZ1o=;
 b=D1NNUzuOtCx6k0KpFM8NvbPF4BV2RwGmJU8XiEbynCK+OQJv7k6nm3uT+eiAtMzhxHFVb2onhsCHdyfHKGhZkBQt0i8TiX6d8MWgykELLHCsB/hysi7CI46GGqPs6A+lJdDCM//ioaPSBgUmX/St/2XsLcezXLLwU3a0QwBOQfQc72L0NNH1NBSbkqtHYDgeyZfg6ylW+b9poUWJv7WksuoidLunhiyGeju6gzb+r3GADDLtlmsPtmk0MEuyy8IsYyqGDqQrCGn+Cea/NH7X6Ae08ruXfPrUFEyeUNbnKeiSJ3fo9JSzb/VjktXinh7R6qLh+FBN6nLhydrPHVqkvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV0PR11MB9792.namprd11.prod.outlook.com (2603:10b6:408:385::5)
 by DS0PR11MB7832.namprd11.prod.outlook.com (2603:10b6:8:f5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 11:39:47 +0000
Received: from LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8]) by LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8%5]) with mapi id 15.21.0406.007; Thu, 10 Sep 2026
 11:39:47 +0000
Content-Type: multipart/alternative;
 boundary="------------DXotmVV1Gm5CZyf8bLdKXVk0"
Message-ID: <1fab7d15-a447-403c-bc4f-6b33b8dad2de@intel.com>
Date: Thu, 10 Sep 2026 17:09:37 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/12] drm/xe/cper: Hardware error CPER reporting from
 xe_log
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <daniele.ceraolospurio@intel.com>, <raag.jadav@intel.com>,
 <riana.tauro@intel.com>, <mallesh.koujalagi@intel.com>,
 <aravind.iddamsetty@intel.com>, <himal.prasad.ghimiray@intel.com>,
 <arvind.yadav@intel.com>, <syed.abdul.muqthyar.ahmed@intel.com>,
 <nitin.r.gote@intel.com>
References: <20260906172604.2215987-14-badal.nilawar@intel.com>
 <20260906172604.2215987-15-badal.nilawar@intel.com>
 <c18194ec-cefb-44f6-9338-7470bb7a8ed2@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <c18194ec-cefb-44f6-9338-7470bb7a8ed2@intel.com>
X-ClientProxiedBy: MA5P287CA0314.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:21a::15) To LV0PR11MB9792.namprd11.prod.outlook.com
 (2603:10b6:408:385::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV0PR11MB9792:EE_|DS0PR11MB7832:EE_
X-MS-Office365-Filtering-Correlation-Id: a143e143-7440-4ac4-2ce9-08df0f303734
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|6133799003|10067099003|4143699003|56012099006|11063799006|8096899003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: zPy8EBDXbI+omf/HqLUPq+nPJe9Jok/SiQmMfx0faUuOwkXz8BJnenlrflnorILUwIKTEU8+2WaNVkN4kKnFajf50TyRruK34E/f8bjLSMXLr2WsCAumcQPHAZc0Spjf2UWzICQw61pGFb/ewjYqAOGeq5/1wVqeTWi7buOI7hgVvNa6y5HEnFmV5z4ep5dKu3PHXnU5pGJphHUyFwFi+HSnjignMuf8w5wSgrBKjc4bT+cLA1fzLQmMKb55BcqQBfS+hIpStPJVMHd0HO9JScGNaYthdelWf/mE61nHiVVhEFfBsbbQXcqV17m/zWO/yzWSVUYNBMm8TwdnKVyaydBhVN2T1GGDex3oiCeg7/Eu3xhG2gJ53+XJuqK5jlfBJBOwi20cFyp+YY/QWhSba1ukjYUsicEYVFkfUVBsIjGFfWEJYs3QSIDQnoulBy+Gyq5eTW1YTy/iZPMIfLMqzAAWlBibDYeavSW1sC80Iff5zwqLY6AsGDwT2WlU8L+7A2fwCwtu/rEFZ5FhRezC4vl/FNdd4AHaLvu/wURNLqMEj0o2c3aT4/hRR71menMsiXk0ElfduWqybcNlJWtVgOM12/GVAbPdoU7Z7Vy+SfcpxPnDmfwaxrwzCBoowCD3/ppuQ8mLPouL7POmmF1xu+wh/51C70L8Nvr64F1/Nkg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV0PR11MB9792.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(6133799003)(10067099003)(4143699003)(56012099006)(11063799006)(8096899003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UU5HaC9BZC95MkJmdWVnT01Ra2E0ZlAydXBXNi9taWJCeUFoaFljN3g2MVNQ?=
 =?utf-8?B?ZHRrbmwvTDF0VFdKekQybHhnWFd6Q1laNy96NTN5enorUk9aYkZ0MWo2SzVV?=
 =?utf-8?B?WkxkSnpkZE56Smk2cDg2MTBiS2JNTEZMeU9YL1RvdWRYVy9zUTBZMXVsU1VX?=
 =?utf-8?B?dDJ6RGovSjVsM3F1UFZNSU9iNnAvMENCNzZVdTJQcjN4SHVERjcraEthYkZS?=
 =?utf-8?B?WElqR3JSL0o0Z25KdEhtZ1FjZFQ0dU9MeU9lM1ArZFNsQVQ5cFQydzVBLzBt?=
 =?utf-8?B?MmRsMkRwZHFPaHlQUGIyVnVxaWpaSXJVMTF0N1A0WXZFcGdrdXZTVkpEMXg0?=
 =?utf-8?B?cUltYXc5d0doQktNeHFpZCsyYWNxYXdRR1hjN3pSWm5sOER0dVZ3KzFBbWRB?=
 =?utf-8?B?MGVVYTZxcVVYM0VLaGJzMEpwM3ZyZ3RNdmtXVk5Za1BmMnpwNWd2YkNUVFIw?=
 =?utf-8?B?UHFzRTZ4OUUrU3drMW1KSUtHZ3U4ZHRMQXg4YXU4R2QvZDAwWk9iQTVieHQw?=
 =?utf-8?B?NWZpUk56YzFPY1Y2UDNiUUl3MWtKSk1GY0ttMG9TaHBQNG5ZTE8wNkpzTytJ?=
 =?utf-8?B?N2FSSytkYzJJVy9aa1pCT3BPWGlQajFLek41Y1lkdmlLWlhPMDhoOTlsR0ox?=
 =?utf-8?B?RWRIaThJcnVJVzkzSkJ1THdYM29KWlJoSVRPKzFZOWJqU3hkWlIxa21pNUdi?=
 =?utf-8?B?TjZDOFBXa29aR1BlOUE2TXVlZTdPTi9HRklJbVVmOGNQN09TNGZNaSt2dTFp?=
 =?utf-8?B?MDdOOGZFSnZrVno2SkZWVkQ4T1FxeGhvUWxSY0c5elp0ZFpPaW42Q0VWaW1w?=
 =?utf-8?B?TDVFNDV2TVUwVmhLNVhTdm1WTFJ1VE9FQ3lGSEtDQTVtZURuY0s1YWZFWVRa?=
 =?utf-8?B?WGpMcWpXYk1tdmZESnRncDdMZDlaWnJWNzVhM0xWamlLYWM0YVlqamtLaXp2?=
 =?utf-8?B?djVaMWdRUkdjc2N5V0hjVGdienpOQWpQL3daSVVOVTV0T0c3WE5FMkJTSkdD?=
 =?utf-8?B?djVLczZ2bzhjd0ZjUFZ1RXlaNWF2UmFvdVE1ek9zY2U0ME9PdllQb2ZYbjFi?=
 =?utf-8?B?cUp2emE2TVVjUnRVWXNtNnFwdm1rbGhTQ0RScGhsR1lTZytVVWgwWjZpUmNN?=
 =?utf-8?B?MWhVVURpMnZCOXFCWmNBVStBSUNlb283dnFUbnprWUhIK05HeWI3d2ZhSWFH?=
 =?utf-8?B?VmxLL1cyeWkzb3cvYzEvejdadWwzcCtiekVvZ3RYYTBhcDh0UDBwUWJHRUoz?=
 =?utf-8?B?NlZUOW9WZllQdEdQQXpKcUpPeHI3cHNlRllwTE9mWk42dHdHMis0STVrTVUy?=
 =?utf-8?B?OWZ3M29jekl5NVQ3eXFpYTgxTDNWZzhOcWphODFFWDRWU2dHWXRESnVaZkg2?=
 =?utf-8?B?Q0V2Z1lKMmN6RWp4K1djNU1KSmRhMm4veXR3VFh4cXk3cUZJZDJnb29GNGJ6?=
 =?utf-8?B?d0ljeC85Y1pxWGFVVXpFVHN6enhmZ1JJb0NvR01McWUzOXFuK0xESDlsbFpN?=
 =?utf-8?B?QWpjRzZOZ2cvMTV4dUo4VndFQmhuV1hzY2FvRnl1SlNMT1R5N05nU09hZ2VM?=
 =?utf-8?B?dExkZ3E5dm9PYXhLcDlxdUFyMGZUSUw1OFR1V2JwVlU2UFAxWGttbzVVUHRl?=
 =?utf-8?B?OUsvQnRoR2N0U045dG85T2FYaExjMTBMZnRwcTVpYU85NGhZdzBTNkJpQW1G?=
 =?utf-8?B?K1Y2ejFYMzRZMWlnOXVpK1ZLVnhncFBram9LQ2VQNVBXOVA1NFdwRzB6b2Z1?=
 =?utf-8?B?TkNNTVpCWG4wSXBpU0ZXQXEyalFUb1RPWWdLbmY0WXZvTU9ZUTZlOWZQZWVu?=
 =?utf-8?B?QmNoYXBudXE2T1AvUGVjdHUvOHhNakZZZ3JydWhiUFMrYi83MXBnOEZoblJD?=
 =?utf-8?B?T0lzbnRRRjJaQVRyeFhscXU4NnhWU3pSSkpHQzRUWWpGYnJORGhWUTdVMVFu?=
 =?utf-8?B?VjVBVTF4M1dvVFhLejl6YzBDWVlSbVdrYjM3R0kyNVFjT09MSUJIL0p5dFk1?=
 =?utf-8?B?cFBJd1hSZ09IYXhOT3lTcVZDTEp1ZFBGQUh4RE1SRFppTllZTmVMc3ZWYUZX?=
 =?utf-8?B?Qm1pOG9LdHc0QnorMHZwektZR2JmbzB5ZE1zR0JjcHNPQzMxRVBUd0hVd0Fk?=
 =?utf-8?B?Y3JhY0k4UkNNWkRxbHNmL1ROR1JiajRXTG1zVFpOWHpCMWlHcXRyTW42WU1k?=
 =?utf-8?B?djBOeFFISncxcTh0Y2JibW5wSE5aMjNLK04rSnNnMUJoeUsrc0M2NGQzbHJQ?=
 =?utf-8?B?M2dyVVZpTXhMWE15aTFLT0t2VjlTVXBOUklTUklzSjY1b0ZtL09QZURMdGY4?=
 =?utf-8?B?MFV0ZDZ1aUhkeVNFandDRk1iS3BrRU1YbkVzSitJdmVxMzFDQXBWdz09?=
X-Exchange-RoutingPolicyChecked: iwQ6fzNImS75x8IDkvVCElA0RCuNsyAAcOOwFRF29P/VijO/PMnAA79phcsc/wTTuGNWiU0R6NFQcvoE5ZBYzXaK6ktOUyVMOm07Z939OJ279pU1ttvnEDRsV9M54vVGAFGTYHlH1pgFuOUYgfCyI1MIn22EpAYUTlK2qsbNASxx6qgEZyt4WY5iXUXt0d7r/4l+q9/owiOX7uHnjhMYxL4c2A8YfUAAARhnQxhcy35oGNbhSfE1Y6ovcPvA+nWtLALx6lU+rg41RlxDahh8zOa3WmyIEq0aex3Dt7nC4u0S6noI7W6u5Ro+//rvETWJkZtHcf8vwBRfUiUPbftgZw==
X-MS-Exchange-CrossTenant-Network-Message-Id: a143e143-7440-4ac4-2ce9-08df0f303734
X-MS-Exchange-CrossTenant-AuthSource: LV0PR11MB9792.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 11:39:47.2221 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O+cIXgHLddvSIV5k6nA7yTu6fdG+jw4suKeT9JDIwBkj6449JRNBi+cwx23HdPr74+FE1ffg+0CV0IR5Lz5HSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7832
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

--------------DXotmVV1Gm5CZyf8bLdKXVk0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 07-09-2026 18:08, Michal Wajdeczko wrote:
>
> On 9/6/2026 7:26 PM, Badal Nilawar wrote:
>> Introduce xe_emit_hardware_error_cper() as public entry point
>> for CPER reporting.
>>
>> Wire xe_log to route hardware SIGIDs through the new helper.
>> No functional change is intended yet, as the CPER emission logic
>> is added in follow-up patches.
>>
>> Signed-off-by: Badal Nilawar<badal.nilawar@intel.com>
>> ---
>>   drivers/gpu/drm/xe/Makefile  |  2 ++
>>   drivers/gpu/drm/xe/xe_cper.c | 37 ++++++++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_cper.h | 25 ++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_log.c  | 17 +++++++++++------
>>   4 files changed, 75 insertions(+), 6 deletions(-)
>>   create mode 100644 drivers/gpu/drm/xe/xe_cper.c
>>   create mode 100644 drivers/gpu/drm/xe/xe_cper.h
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index 67b8b5477639..06b064add77d 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -166,6 +166,8 @@ xe-$(CONFIG_HWMON) += xe_hwmon.o
>>   xe-$(CONFIG_PERF_EVENTS) += xe_pmu.o
>>   xe-$(CONFIG_CONFIGFS_FS) += xe_configfs.o
>>   
>> +xe-$(CONFIG_UEFI_CPER_X86) += xe_cper.o
> shouldn't we use just CONFIG_UEFI_CPER ?
Will check.
>
>> +
>>   # graphics virtualization (SR-IOV) support
>>   xe-y += \
>>   	xe_gt_sriov_vf.o \
>> diff --git a/drivers/gpu/drm/xe/xe_cper.c b/drivers/gpu/drm/xe/xe_cper.c
>> new file mode 100644
>> index 000000000000..e8017e3ee3a0
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_cper.c
>> @@ -0,0 +1,37 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +
>> +#include <linux/pci.h>
>> +
>> +#include <drm/drm_print.h>
> do we need this?
will add in the patch where it is needed.
>
>> +
>> +#include "xe_cper.h"
>> +#include "xe_device.h"
>> +#include "xe_ras_types.h"
>> +
>> +/**
>> + * xe_emit_hardware_error_cper() - Emit a hardware error CPER record
>> + * @pdev: PCI device associated with the Xe device
>> + * @cper_sev: CPER severity
>> + * @sigid: Error signature identifier
>> + * @error_class: Hardware error classification details
>> + * @response: Response of get counter
>> + *
>> + * Emit a CPER record for a hardware error
>> + */
>> +void xe_emit_hardware_error_cper(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
>> +				 struct xe_ras_error_class *counter,
>> +				 struct xe_ras_get_counter_response *response)
>> +{
>> +	struct xe_device *xe = pdev_to_xe_device(pdev);
>> +
>> +	if (!xe)
>> +		return;
>> +
>> +	if ((int)sigid >= INTEL_SIGID_GPU_XE_HARDWARE_START)
>> +		return;
>> +
>> +	/* TODO */
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_cper.h b/drivers/gpu/drm/xe/xe_cper.h
>> new file mode 100644
>> index 000000000000..c4be7f25a369
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_cper.h
>> @@ -0,0 +1,25 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_CPER_H_
>> +#define _XE_CPER_H_
>> +
>> +#include "abi/xe_sigid_abi.h"
> maybe just:
>
> 	enum xe_sigid sigid;
Ok.
>
>> +
>> +struct pci_dev;
>> +struct xe_ras_error_class;
>> +struct xe_ras_get_counter_response;
>> +
>> +#if IS_REACHABLE(CONFIG_UEFI_CPER_X86)
>> +void xe_emit_hardware_error_cper(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
>> +				 struct xe_ras_error_class *counter,
>> +				 struct xe_ras_get_counter_response *response);
> since you're introducing xe_cper component, all its public functions
> shall use xe_cper prefix:
>
> 	xe_cper_emit_hardware_error(

Sure.  Kept _cper in the end to indicate cper record of hardware error 
is being emitted.

>
> and since all HW errors are expected to come from the xe, no need for pdev:
>
> 	xe_cper_emit_hardware_error(struct xe_device *xe,
Ok.
>
> also it's better to let the caller pass whatever data was given in xe_log macros:
>
> 	xe_cper_emit_hardware_error(struct xe_device *xe,
> 				int cper_sev, enum xe_sigid sigid,
> 				const void *data, size_t len)
>
> and do any data validation/conversion inside xe_cper code
>
> and since xe_ras_get_counter_response is now optional, just define another function (when needed) that takes already validated data:
>
> 	xe_cper_emit_hardware_error_details(struct xe_device *xe,
> 				int cper_sev, enum xe_sigid sigid,
> 				const struct xe_ras_error_class *counter,
> 				const struct xe_ras_get_counter_response *response);

Will think about this. Don't want to keep to many layers. May be a one 
more wrapper function in xe_cper.c, which will do validation and decide 
which path hw or fw cper to follow.
IMO inside log_emit_cper itself validation should be done.

>
>> +#else
>> +static inline void xe_emit_hardware_error_cper(struct pci_dev *pdev, int cper_sev,
>> +					       enum xe_sigid sigid,
>> +					       struct xe_ras_error_class *counter,
>> +					       struct xe_ras_get_counter_response *response) {}
>> +#endif
>> +#endif /* _XE_CPER_H_ */
>> diff --git a/drivers/gpu/drm/xe/xe_log.c b/drivers/gpu/drm/xe/xe_log.c
>> index 5549ef6966fd..2957adec41aa 100644
>> --- a/drivers/gpu/drm/xe/xe_log.c
>> +++ b/drivers/gpu/drm/xe/xe_log.c
>> @@ -8,17 +8,27 @@
>>   
>>   #include "abi/xe_log_abi.h"
>>   
>> +#include "xe_cper.h"
>>   #include "xe_device.h"
>>   #include "xe_log.h"
>>   #include "xe_printk.h"
>>   
>> +static bool is_hw_sigid(enum xe_sigid sigid)
>> +{
>> +	return (int)sigid >= INTEL_SIGID_GPU_XE_HARDWARE_START;
>> +}
>> +
>>   static void log_emit_cper(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
>>   			  u32 component, u32 location, const void *data, size_t len,
>>   			  struct va_format *vaf)
>>   {
>>   	KUNIT_STATIC_STUB_REDIRECT(log_emit_cper, pdev, cper_sev, sigid,
>>   				   component, location, data, len, vaf);
>> -	/* TODO */
>> +
>> +	if (is_hw_sigid(sigid) && !IS_ERR(data))
>> +		xe_emit_hardware_error_cper(pdev, cper_sev, sigid,
>> +					    (struct xe_ras_error_class *)data, NULL);
> you shouldn't blindly convert data to xe_ras_error_class
> you shall at least check if len == sizeof(xe_ras_error_class)
> and IMO it would be better to move that checks to xe_cper code
> (as maybe we can still emit some CPER records for ERR_PTR data?

Without valid error class no point in emitting hardware CPER. May be as 
software CPER this can be considered later.

Thanks,
Badal

>
>
>> +	/* TODO software CPER */
>>   }
>>   
>>   static const char *log_unknown_component_prefix(u32 component)
>> @@ -100,11 +110,6 @@ static const char *log_location_prefix(struct pci_dev *pdev, u32 location, char
>>   	return buf;
>>   }
>>   
>> -static bool is_hw_sigid(enum xe_sigid sigid)
>> -{
>> -	return (int)sigid >= INTEL_SIGID_GPU_XE_HARDWARE_START;
>> -}
>> -
>>   static bool is_sev_error(int cper_sev)
>>   {
>>   	return cper_sev != CPER_SEV_INFORMATIONAL;
--------------DXotmVV1Gm5CZyf8bLdKXVk0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 07-09-2026 18:08, Michal Wajdeczko
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:c18194ec-cefb-44f6-9338-7470bb7a8ed2@intel.com">
      <pre wrap="" class="moz-quote-pre">

On 9/6/2026 7:26 PM, Badal Nilawar wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Introduce xe_emit_hardware_error_cper() as public entry point
for CPER reporting.

Wire xe_log to route hardware SIGIDs through the new helper.
No functional change is intended yet, as the CPER emission logic
is added in follow-up patches.

Signed-off-by: Badal Nilawar <a class="moz-txt-link-rfc2396E" href="mailto:badal.nilawar@intel.com">&lt;badal.nilawar@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/Makefile  |  2 ++
 drivers/gpu/drm/xe/xe_cper.c | 37 ++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_cper.h | 25 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_log.c  | 17 +++++++++++------
 4 files changed, 75 insertions(+), 6 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_cper.c
 create mode 100644 drivers/gpu/drm/xe/xe_cper.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 67b8b5477639..06b064add77d 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -166,6 +166,8 @@ xe-$(CONFIG_HWMON) += xe_hwmon.o
 xe-$(CONFIG_PERF_EVENTS) += xe_pmu.o
 xe-$(CONFIG_CONFIGFS_FS) += xe_configfs.o
 
+xe-$(CONFIG_UEFI_CPER_X86) += xe_cper.o
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
shouldn't we use just CONFIG_UEFI_CPER ?</pre>
    </blockquote>
    Will check.&nbsp;
    <blockquote type="cite" cite="mid:c18194ec-cefb-44f6-9338-7470bb7a8ed2@intel.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+
 # graphics virtualization (SR-IOV) support
 xe-y += \
 	xe_gt_sriov_vf.o \
diff --git a/drivers/gpu/drm/xe/xe_cper.c b/drivers/gpu/drm/xe/xe_cper.c
new file mode 100644
index 000000000000..e8017e3ee3a0
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_cper.c
@@ -0,0 +1,37 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include &lt;linux/pci.h&gt;
+
+#include &lt;drm/drm_print.h&gt;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
do we need this?</pre>
    </blockquote>
    will add in the patch where it is needed.&nbsp;
    <blockquote type="cite" cite="mid:c18194ec-cefb-44f6-9338-7470bb7a8ed2@intel.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+
+#include &quot;xe_cper.h&quot;
+#include &quot;xe_device.h&quot;
+#include &quot;xe_ras_types.h&quot;
+
+/**
+ * xe_emit_hardware_error_cper() - Emit a hardware error CPER record
+ * @pdev: PCI device associated with the Xe device
+ * @cper_sev: CPER severity
+ * @sigid: Error signature identifier
+ * @error_class: Hardware error classification details
+ * @response: Response of get counter
+ *
+ * Emit a CPER record for a hardware error
+ */
+void xe_emit_hardware_error_cper(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
+				 struct xe_ras_error_class *counter,
+				 struct xe_ras_get_counter_response *response)
+{
+	struct xe_device *xe = pdev_to_xe_device(pdev);
+
+	if (!xe)
+		return;
+
+	if ((int)sigid &gt;= INTEL_SIGID_GPU_XE_HARDWARE_START)
+		return;
+
+	/* TODO */
+}
diff --git a/drivers/gpu/drm/xe/xe_cper.h b/drivers/gpu/drm/xe/xe_cper.h
new file mode 100644
index 000000000000..c4be7f25a369
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_cper.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef _XE_CPER_H_
+#define _XE_CPER_H_
+
+#include &quot;abi/xe_sigid_abi.h&quot;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
maybe just:

	enum xe_sigid sigid;</pre>
    </blockquote>
    Ok.
    <blockquote type="cite" cite="mid:c18194ec-cefb-44f6-9338-7470bb7a8ed2@intel.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+
+struct pci_dev;
+struct xe_ras_error_class;
+struct xe_ras_get_counter_response;
+
+#if IS_REACHABLE(CONFIG_UEFI_CPER_X86)
+void xe_emit_hardware_error_cper(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
+				 struct xe_ras_error_class *counter,
+				 struct xe_ras_get_counter_response *response);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
since you're introducing xe_cper component, all its public functions
shall use xe_cper prefix:

	xe_cper_emit_hardware_error(</pre>
    </blockquote>
    <p>Sure.&nbsp; Kept _cper in the end to indicate cper record of hardware
      error is being emitted.</p>
    <blockquote type="cite" cite="mid:c18194ec-cefb-44f6-9338-7470bb7a8ed2@intel.com">
      <pre wrap="" class="moz-quote-pre">

and since all HW errors are expected to come from the xe, no need for pdev:

	xe_cper_emit_hardware_error(struct xe_device *xe, </pre>
    </blockquote>
    Ok.
    <blockquote type="cite" cite="mid:c18194ec-cefb-44f6-9338-7470bb7a8ed2@intel.com">
      <pre wrap="" class="moz-quote-pre">

also it's better to let the caller pass whatever data was given in xe_log macros:

	xe_cper_emit_hardware_error(struct xe_device *xe,
				int cper_sev, enum xe_sigid sigid,
				const void *data, size_t len)

and do any data validation/conversion inside xe_cper code</pre>
    </blockquote>
    <blockquote type="cite" cite="mid:c18194ec-cefb-44f6-9338-7470bb7a8ed2@intel.com">
      <pre wrap="" class="moz-quote-pre">

and since xe_ras_get_counter_response is now optional, just define another function (when needed) that takes already validated data:

	xe_cper_emit_hardware_error_details(struct xe_device *xe,
				int cper_sev, enum xe_sigid sigid,
				const struct xe_ras_error_class *counter,
				const struct xe_ras_get_counter_response *response);</pre>
    </blockquote>
    <p>Will think about this. Don't want to keep to many layers. May be
      a one more wrapper function in xe_cper.c, which will do validation
      and decide which path hw or fw cper to follow.<br>
      IMO inside&nbsp;&nbsp;<span style="white-space: pre-wrap">log_emit_cper itself validation should be done. </span></p>
    <blockquote type="cite" cite="mid:c18194ec-cefb-44f6-9338-7470bb7a8ed2@intel.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+#else
+static inline void xe_emit_hardware_error_cper(struct pci_dev *pdev, int cper_sev,
+					       enum xe_sigid sigid,
+					       struct xe_ras_error_class *counter,
+					       struct xe_ras_get_counter_response *response) {}
+#endif
+#endif /* _XE_CPER_H_ */
diff --git a/drivers/gpu/drm/xe/xe_log.c b/drivers/gpu/drm/xe/xe_log.c
index 5549ef6966fd..2957adec41aa 100644
--- a/drivers/gpu/drm/xe/xe_log.c
+++ b/drivers/gpu/drm/xe/xe_log.c
@@ -8,17 +8,27 @@
 
 #include &quot;abi/xe_log_abi.h&quot;
 
+#include &quot;xe_cper.h&quot;
 #include &quot;xe_device.h&quot;
 #include &quot;xe_log.h&quot;
 #include &quot;xe_printk.h&quot;
 
+static bool is_hw_sigid(enum xe_sigid sigid)
+{
+	return (int)sigid &gt;= INTEL_SIGID_GPU_XE_HARDWARE_START;
+}
+
 static void log_emit_cper(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
 			  u32 component, u32 location, const void *data, size_t len,
 			  struct va_format *vaf)
 {
 	KUNIT_STATIC_STUB_REDIRECT(log_emit_cper, pdev, cper_sev, sigid,
 				   component, location, data, len, vaf);
-	/* TODO */
+
+	if (is_hw_sigid(sigid) &amp;&amp; !IS_ERR(data))
+		xe_emit_hardware_error_cper(pdev, cper_sev, sigid,
+					    (struct xe_ras_error_class *)data, NULL);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
you shouldn't blindly convert data to xe_ras_error_class
you shall at least check if len == sizeof(xe_ras_error_class)
and IMO it would be better to move that checks to xe_cper code
(as maybe we can still emit some CPER records for ERR_PTR data?</pre>
    </blockquote>
    <p>Without valid error class no point in emitting hardware CPER.&nbsp;
      May be as software CPER this can be considered later.&nbsp;</p>
    <p>Thanks,<br>
      Badal</p>
    <blockquote type="cite" cite="mid:c18194ec-cefb-44f6-9338-7470bb7a8ed2@intel.com">
      <pre wrap="" class="moz-quote-pre">


</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+	/* TODO software CPER */
 }
 
 static const char *log_unknown_component_prefix(u32 component)
@@ -100,11 +110,6 @@ static const char *log_location_prefix(struct pci_dev *pdev, u32 location, char
 	return buf;
 }
 
-static bool is_hw_sigid(enum xe_sigid sigid)
-{
-	return (int)sigid &gt;= INTEL_SIGID_GPU_XE_HARDWARE_START;
-}
-
 static bool is_sev_error(int cper_sev)
 {
 	return cper_sev != CPER_SEV_INFORMATIONAL;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------DXotmVV1Gm5CZyf8bLdKXVk0--
