Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DE08C83F21
	for <intel-xe@archiver.kernel.org>; Tue, 15 Jul 2025 08:59:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02B9D10E1CD;
	Tue, 15 Jul 2025 08:59:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a6eI7E99";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B651E10E1DF
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Jul 2025 08:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752569969; x=1784105969;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YRAG8JsvxVWbYPgwDNMf+n+ksm8iycSD04BWrkXcQRM=;
 b=a6eI7E99PZoyiZrbmq5vlqoV4R+PFFPByErHetCGnEQM3aFFpAo+GgUp
 rdQLdoRRhH/kGYtwWSS5P8jNx5LeIgDxho20Z++HuG5+29scRvHtO9OsZ
 kDulA02NfOSo1lCa0OcrWigBS3rB/Z6/FTcSpj/022A1Y+EW9476sCGOU
 SKK25pdxP3PiBF5WmGiQhTDQ456MMV6Jy+gXqhRSHDY9gFJy4PIYvBvE7
 EMo/fU5ldjAe2Qu7zWKcuj+9B2hXCNPOv5ZJImezx46dsYqwkPN6yh0/6
 /613jBLwdL1g/zuVoqosF+Htr9C5sbS3bAChjyhrg8PkkYvhMvjdG197b w==;
X-CSE-ConnectionGUID: vSZSvVDJRWWSyI6Gwxy0mw==
X-CSE-MsgGUID: Rv5Xi16wQZqxRAqSGZYfzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54927587"
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; d="scan'208";a="54927587"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 01:59:28 -0700
X-CSE-ConnectionGUID: XdL3KeiESZ2UnQdRgqEH5Q==
X-CSE-MsgGUID: EyOWOj0KS4+1sLykRREqjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; d="scan'208";a="161716439"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 01:59:29 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 15 Jul 2025 01:59:27 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 15 Jul 2025 01:59:27 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.69)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 15 Jul 2025 01:59:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wEgwOqweMg+9b+Y8cXTrThzzK5ZCCQMIwsXbnP2HX2/wUbUodVYkj2pjpIjlfcEcs5jPiSYdEv36TPXEYDEOjR34C5wsnV7p04PRTmtcZSpMWfZPDZ8Pio6gTsd3kVa4MUFt0B0PWDd/+57aXn9luvfzd429UFKhQf19/FVJrRZOqk8wlvp3jnnMIeJ51rgcrLVUt6cRa42R9RpioYigPnuvsqbu0WpKChLTHtaNbkZznZqDVTNoDuGSZpIUdKNvLHP+nYLaZQbGYLg1WVhWkJlWindNrCtikKhqyz4iV9iPQfHy4yj2LdFavePieP4ojq2TqkJgZsheM0nDAkeahQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CBql78ZsmnosqDxkvAFLaD8vAAduzfr1TmeNIXSR+Vc=;
 b=gVWEytLO98J9pGDZW30ejrqKZVhCK75BU/5ftBhH1KQqwdd1x/hs/yaglQlwPB6YB0EcPWnkLTmTCGR9ErVr4AACX8ocTfPaJUVeV3gLIl/Ijkc67kTr5SUtUYzriaOCSSbEER3mhewZ7q3k2Swi12MxgbYI3c+Qw3j+2er7bgAMTwhO8y7f9UhY1FEseWs33veUMSo4+cLqcgJZaZZICz+nLJePhtjh7ayL7v9NY40SqHvXORcL4EnwzHAinavQy/34qnhQufHERArRtRFN5F+lChQSYj3dp3VAZup7zSqmxP37Wnc4PAHIGMoHLR0wXUxKwnnMky2TwdCRzQhlgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by PH7PR11MB5793.namprd11.prod.outlook.com
 (2603:10b6:510:13a::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 15 Jul
 2025 08:26:50 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::2ae2:110b:2487:40ed]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::2ae2:110b:2487:40ed%6]) with mapi id 15.20.8901.024; Tue, 15 Jul 2025
 08:26:49 +0000
Message-ID: <cbec761a-4f18-45d1-8bf3-20791e0de82d@intel.com>
Date: Tue, 15 Jul 2025 13:56:42 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/xe: Disable compression on SVM
To: Matthew Auld <matthew.auld@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <michal.mrozek@intel.com>, <francois.dugast@intel.com>,
 <thomas.hellstrom@linux.intel.com>
References: <20250714173342.2997396-1-matthew.brost@intel.com>
 <20250714173342.2997396-2-matthew.brost@intel.com>
 <338a3400-1202-4c12-a99b-6a45004ce548@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <338a3400-1202-4c12-a99b-6a45004ce548@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0027.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::20) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|PH7PR11MB5793:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fa4a053-246e-4130-1828-08ddc3795836
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZnY5TzhNc3hCMWdmb2J5akYwbGNiSDA4eW0zM0RTaVJtaWpFeThZUGpaQjJx?=
 =?utf-8?B?clRIL3VIRnhQRHNnS0V6UWtJdHNwRzh6Wm5WYUk0V2FuL01hcXVZVFpJVlBV?=
 =?utf-8?B?d0ovRHg1YzJpeUdkMUZGcWFSRndENVVkcXZleEpnd1VkeTRBbHYzZE16SS9p?=
 =?utf-8?B?aDV5SldPVDNaOEpBN1hreHRaWXd2VFZtZTFlMHRVcVo1ampmRVd0b05xVnZX?=
 =?utf-8?B?QVlNbkVvZmJmL2Y3c2NRdjlwZXhMakdUV0J0QjE1dEUydElmWTlxSkJteGV3?=
 =?utf-8?B?QTRQUnliWVNwN1N5ZW8vT1lsREJYZi9FRjZIakxldWI1VlhjU1JPKzBubmdq?=
 =?utf-8?B?QXdnc1pLZGFicUtPT2FlVEt1czE3a09TaUdVc3AydTBCTW1xb3VKUW1xV0Z1?=
 =?utf-8?B?Y2QvWktERkJibHdHQ1daYlBNSllzMU9ydnE5WVJrRUF0NjcrRUhTazBRZzdy?=
 =?utf-8?B?V3lDRjM3bHNDYjVvSzNEaFpJK2xSZnVjRWlINWJMWVMreXI4ZkVKb0hYWUk4?=
 =?utf-8?B?NU1kaWR5YkJVVUx1QU5GZXlIRVRpQTBjR01Hd3RmdmVNRUEwb3VCMjhIUEVy?=
 =?utf-8?B?THlvbFdaWXA4V2VGdHlaTC80WlFob2lFYUI3QTVMUlg3YnY4M05LWnVXc1M0?=
 =?utf-8?B?U09BVjlEajdXeE96cGtqbVVQbk9lRG0wYUZBcXgrbFMzOUJVVFpNaVU0QkFR?=
 =?utf-8?B?RU5PYkZVN3Zyd1JBeFdFUHI1WEpzaFRUQzlaMjdYWDl1ZStCem44L3h5bHI3?=
 =?utf-8?B?N1pmL3MvR0NxTDhySW1wcjNtT2tzNHhCRlNkd091YkcwN3k0OUVhb2tpRFV6?=
 =?utf-8?B?Y01GOVFJOWNidXlWV0xCNzJRZTB0VFc4Z25oRzNteVlLYjg3UkRMNThEYy9k?=
 =?utf-8?B?VWJ6eHRVUnBuQ2ZUTWh3N3o2R2RYUW5OZWwwclJsRVIzUktydjVkai9XRVkx?=
 =?utf-8?B?bzFVRVZRZmNKQ2c0WTZOOWRvRFNEakwvNmxhTGYzNmJMTFBUcUhsUGlLL1pz?=
 =?utf-8?B?YkE1Zi9RVFRPeWVuU2FxUVlqK3VuTDFYQ0Vaa3NRSnJibHFJUzQ4Wms3RzJZ?=
 =?utf-8?B?YURYanJhWWFiZFRybFIyZ01iMTBvMkY3SCtHSjJTWGQ2T3hWdnZRVEc2S2Jr?=
 =?utf-8?B?WGY3N0tUUTNKTmdQeGpKRmtLcXdTcHVFY2hUeFZLSUQ5NXJxb2VCUGh4dXpO?=
 =?utf-8?B?eExOdk9yZytwWEN1b3ZOYzZsVzNUTVl5OHQwTVZkS1RDakJGV1o3Q2gzaE5u?=
 =?utf-8?B?Smpxa1k4S0xFQklFUHJqUlFGTmM1a1hIV0xiNERRajZ5Qis5eStTdzQ3WGpI?=
 =?utf-8?B?OEhSQzZwRGw2UDdUc2VRT2VhWnZXa21NMnhPdVd3KzhnQnA4d1JlK1BGSmFn?=
 =?utf-8?B?ZEVmVStkbGFnQXl5SnJLZFlEczZpbGNmTzRzOU9NY3AvQmxtV1lOVEtQU3Fy?=
 =?utf-8?B?YURyYVlnRGNnaDFUTnhTM3VmUkg0YnhVV1l0WlIvTkpaMTdEQnR1OTBZYXhs?=
 =?utf-8?B?NWNFbFIvZjlwTDZuaGxydFVPZm5ocVlsTjBOcGNVTGpqLzNqb3A2SXE5aGw0?=
 =?utf-8?B?cU85L2xvZEJxa0xSdk5wNFp0VEZnN3cxWTVQT2xRNnBlK3JRNmlUWTRUSGJX?=
 =?utf-8?B?TUdSeCthZVhXWlJuRDBUbkE1V2podnlRWmZ0MnQvbmlrcDZITCtPNTYrOU0w?=
 =?utf-8?B?VmJPZzA0em1BMGhtT2diSTExK2xFL2tEUE5zeTBKN3FGaG5hdDQ1aGpLRHVz?=
 =?utf-8?B?ZTZwK3dJME9nYjFMTDhyckhzNnhCemEyWTZGcHZucGQ4cktJaEc3Rm9IbS8w?=
 =?utf-8?B?V2prdWlNVkRGSzFzdzBpaXJ2U3prQVdwODRmYXZjY3dpZk53UXgrYmVYWCtG?=
 =?utf-8?B?ckRFZC9USUxZRiszTWprOFRnZVM1QVlUMmIweGtKUEZMSTZyWFdPMTN1bkpM?=
 =?utf-8?Q?IGtbwbR2XQ0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M0RSKy81STNhd0wxa1ppdVIzbjhTRHJrdEFmSWlVNmhSa2sxWVRocW9uTmtq?=
 =?utf-8?B?bkMvdXkrcTFQVW1JbzRGb2F3K0ZnZFo3NDdURTR6NmgxVjRTbHF5Z0dLclhU?=
 =?utf-8?B?QUtZSVRZekNZczIwa1VkaHlqQThpM0dxaUFYUytmN2c5T29JckFWZW53MDVx?=
 =?utf-8?B?M2YrMlgxYnAwZU5JWGx0N3U1d1BIeldibzdEcVplVWhBYXFxU3Rsb0RMK3dI?=
 =?utf-8?B?dm1HTFRjcTU3WmJEZTU2V2tKajhiU2NVY28rMllOYlh5bEk2R2haNndOT0ll?=
 =?utf-8?B?SDlHQVVqdHlCQ0hGTUU0Y28zSjV3Yk04UHgxM0FkbUZkUHI0SnRJV1h3US9v?=
 =?utf-8?B?UisvTkZiaUN1eW9sT3dudGZkN1NqZ3ZweFpERUZTN1E2NEtIZjJneDI3U3hW?=
 =?utf-8?B?U3puckxpdmxteE1aV2ZGbTR5SlBNZlVqVkMraUxwZUJWdENXRFk5VzZiWVYr?=
 =?utf-8?B?MnY4NFAzRGx1aWQrRmlqdXpVNmR3amt1MEZZQkJEU3MzaDdXbndGRnNoMHFZ?=
 =?utf-8?B?bEdrWkJnc0pVMU1STlFZNEh5cHR0R3BmUmMxQzVvekl4YXVSK2FLN0lhTmhw?=
 =?utf-8?B?WGlnUlc1K1JKR0c4emovM01SaGFLVDRUZEkzR3lxQWhPdklaeHkxQ2NiaUZE?=
 =?utf-8?B?bk4wbGdRSkdaZDlpL0psY0gzeW5sTG5DTzdsTmRqKzk2MTQ1UmF1NjMvUzNT?=
 =?utf-8?B?YUM2TEhLc3RXK2xaUWRxaDk4d0NTS3BDeVZjRHk2WTFrWUgwNytVSWpQQURs?=
 =?utf-8?B?cDFNaWtOQWwyZ3JCWWlBaDdEWER2TUw1RXFoQTJrRTNiYWF0MHZKOXBneFVq?=
 =?utf-8?B?aTdDYUdFbWJyczBQeW9WNVJuamFTTEptZ2V3OHpoQ29TSUZ1Q3h4TTBnVk54?=
 =?utf-8?B?YmxlSzhyMzVKczdjdmpOQUxSL0liOVFoYW9HdVUwZnpoWEZjMVBrcXRTTnQx?=
 =?utf-8?B?VzdYZWx0ZFBPeTNUMmtnK3N0eGJGYjZZYmg1ekRqU3ZvUnUyelBmSExZbkEv?=
 =?utf-8?B?TDI1RGJpcXBHV3hjK2hYSG9jVng2NEllZzZTekNRelA5UmhVNTRYYnNBYXVZ?=
 =?utf-8?B?NWZzUFlSR1pGT2hIajlxa201cldaYUloemVDeUoxU2RadjJ6dVlYQm1seDBI?=
 =?utf-8?B?RDZ0aGE3MmswN01PRDVOdU43T3FpcjR4Y3g3WGRrSHhrYlpJUC9KaVVkSm4v?=
 =?utf-8?B?NGtYc1FpRy9vSnJxdUpkWFFwV3pYTmlSVlpqcTU4SSsyV3IwVnhnYWNQbGRR?=
 =?utf-8?B?VlRycXlsT3BnbDViQTRxdVhGbDEwajk5Qm9xbVFrNjFtQWI5cmJpVWxvaHI5?=
 =?utf-8?B?b0k0cFRNWnI5cTdEZ1ozTmI3dVlRbVFsUEw3MjBzd3cyVFBLcm1rZWxSa1RG?=
 =?utf-8?B?SVpERUV3NHAyblFxeHpTVjdUMHhPR00rb2tjUEZsZm9zb1AvVmNYMDVSSUJo?=
 =?utf-8?B?bmQwNkZrcWxBa2lNSU5IdFh4dkhCUmRrNFlyNzM4OUhYTmRBMkNYbEV3WHhz?=
 =?utf-8?B?b1B1cE5XOVBjUFJrVHQ4VWZZdTFYejdRcW9lbVJrS2RjaHoxYmpMMVpUOE53?=
 =?utf-8?B?LzVCOVJQb1A4SzVNWVBOZzZMTEU3MndMNWR1UE5UUGU4RS9BdTh5RWppWVND?=
 =?utf-8?B?aXBNSU82TEdERGFiRkpWSEdteVluSEcvZlQxMEcvRzAvNzlPMTJTQWJTaXZp?=
 =?utf-8?B?U0F2cTJucUZ0ZkdVNUh4Zi8wdnQvRjlHL0FFVnBSUDdZaXVtSFZhVFVOSnVV?=
 =?utf-8?B?NVZyZjB0WTB0YU9USFlLcGw0alRQaUZTSlExaW1JMWNFZ0dkNVQ1OU5MRjE5?=
 =?utf-8?B?ekhFdXlKaUQ0M2VJeXVMODVRYzk3ankxNW9VUlNjL1V4M0x1N3ZpMDY0TU5h?=
 =?utf-8?B?S2d6YnlocGh6aHpxcjF5R0srOERkZW95WGlwZE9ScTlYWGlIV1IrbGdOeWEx?=
 =?utf-8?B?VDJPMk5zMTBrTjJ3aEM2OFhXUWRVUHdjMnJZVkszSnliTUxublpzWkpkMFdQ?=
 =?utf-8?B?akZRVDJ0M1V2eHdnOHh1TEg4Sk9pOTFCSXBVSSsrQkg3cXhaREVMQXdUcjh2?=
 =?utf-8?B?Rm9jRng4RVBlMlJKdmNPQnlWWHFXaEx0ejZ2bS9yVDNRN0Z2ejRlWndGdExH?=
 =?utf-8?B?eExKY3JrcHFDM2s2ZlZ4VjhhbnZRaFNnbEtydW1VN3dPMXZia0E5eXY4OUwr?=
 =?utf-8?Q?H3dytFW1uov/4TbGHbdyHWw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fa4a053-246e-4130-1828-08ddc3795836
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 08:26:49.8324 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l/YRHI/h3ut2eyISnFqg4ooI7hHn5Q2VEfBpYT7n6h/ajt0VWmIf75DpnsotiV8Oayr2oHjbR2TvclzdmSIkDD3J0uWnvi6pQwzmQdNYdok=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5793
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



On 15-07-2025 13:45, Matthew Auld wrote:
> On 14/07/2025 18:33, Matthew Brost wrote:
>> This is not yet supported, forcefully disable by setting pat_index to
>> zero for CPU address mirror VMAs.
>>
>> Cc: stable@vger.kernel.org
>> Fixes: b43e864af0d4 ("drm/xe/uapi: Add 
>> DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR")
>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_vm.c | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index 2035604121e6..73cb981c0956 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -2362,7 +2362,10 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, 
>> struct xe_vma_ops *vops,
>>               op->map.is_cpu_addr_mirror = flags &
>>                   DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR;
>>               op->map.dumpable = flags & DRM_XE_VM_BIND_FLAG_DUMPABLE;
>> -            op->map.pat_index = pat_index;
>> +            if (op->map.is_cpu_addr_mirror)
>> +                op->map.pat_index = 0;
> 
> Is this meant as a safe default or is this just a dummy value? If this 
> actually gets programmed in the hw, maybe XE_CACHE_WB would be better 
> here? That way we know exactly what it does from driver POV for a given 
> platform. Index zero for example might have no host coherency (might 
> then need WC on host). In some world index zero could enable compression.

+1

> 
>> +            else
>> +                op->map.pat_index = pat_index;
>>               op->map.invalidate_on_bind =
>>                   __xe_vm_needs_clear_scratch_pages(vm, flags);
>>           } else if (__op->op == DRM_GPUVA_OP_PREFETCH) {
> 

