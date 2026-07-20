Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A51CC44524
	for <intel-xe@archiver.kernel.org>; Mon, 20 Jul 2026 16:21:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D944810E1FC;
	Mon, 20 Jul 2026 16:21:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mxQsMlic";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36DC410E1FC
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Jul 2026 16:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784564514; x=1816100514;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TfQ7lu7G/8FKLhQvHQW8fW+qJtHaBUIXZkLfObsnC28=;
 b=mxQsMlic5sOAV6Sl0zudLGd0q70/YeqVQXGtbFCasv7Ub0mWSmf1fKO9
 feqJKIzReHy2QrfQyOBCapGcj1lUyzKzT405gJjRMJFDwzem0msbK7uiM
 vM1xbK09Ol2M8vdL7g4dHG4di+Vik7G2214z69rbGGyG12z/lGvI0H+ND
 ke8tuAiqn0JrwK8XR3q7+x3HTJFRnL9RMPMnIF0DZwAKgZy2/p5S47gVV
 4+Eh7Okn42e9njhdIDY0LHsF4S2qwHSpp5jESbc334gjTUlDPGfjhoUdH
 oCjOJgE99VENXuP9BC0lw4lqkW79gcoXTPbXwQisKAnYe0JTfN28CoxJ7 A==;
X-CSE-ConnectionGUID: 7mAYYZ3vSvG1phlTCp4jmA==
X-CSE-MsgGUID: 4OEeKae5Reat7Yv5aHPk/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11852"; a="95803087"
X-IronPort-AV: E=Sophos;i="6.25,175,1779174000"; d="scan'208";a="95803087"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2026 09:21:53 -0700
X-CSE-ConnectionGUID: 8r+TCwc0TFqmxG/Gjleq7g==
X-CSE-MsgGUID: qVYGJ6SyTWSBrFhwOxddcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,175,1779174000"; d="scan'208";a="255717736"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2026 09:21:53 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 20 Jul 2026 09:21:53 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 20 Jul 2026 09:21:53 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.31) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 20 Jul 2026 09:21:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I5jeLU+nt1TZjgMRBbsTB3hIIySBA/wzljZMpVi/oaj32lOOPmJNnezMO9UJ3qeVvZxkrGyuECtlEmSu4I5gnTZvUeiV8liHphqP0bwcRdqGLGc4YKcJ1oPL2qOx3L4Q/+TIK0i/wWijn4YLG5Cl/6ekHyzV+wyZC2VIjgjljv8qAphH3mjf/pBfaWiDXDBaCPBlbGG3oEB32DLm8zsEh0lX887mjeC4Jo8AFUs6wDbe0qPtQyisiCxAC0OooH8OTPCkvdGc7S69ByV/LIx5YZYTZ3hebjfrHLMd9eGZrbjWFIPbK0Icdt6vsmjNqUYTN5P6uT2HrwRbvPMoHlmkvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wx63pBSOE0+YUWJU4rtT3cx7FPlXLDZjqpD7yBkwLtw=;
 b=iELS+z/tDbBYRIys09UNl1Fn+FMdWehghjazl27PzNVh/Ck6CMGS99y+eRbeN4SEhM0xZNcGmU6xf4gvSN8PLAJiBO5JNJd+ol2C9ODBspMaW9NdoYPElBausCtdCYhos8RndIZiuCTvsYfE02AFWQNH+GWMdDhYVHtxTp7vd8DHuaEhn7S8Nz0j1G6UwxSKqIEH1a3TeuVFlyw2HbjtUQ84wEmQE/Zmr/wCx71jT/TiHpk/MlqX8Kj5CZJojEzVcu3M6d6cnhjAOhOPomqtkdKzEMKgxVoSQtwR13/OpfNjEJYNKu7tELSDHRTvhRztbDSnEdMS8JSaLjEx/TR/NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by PH7PR11MB7479.namprd11.prod.outlook.com (2603:10b6:510:27f::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 16:21:44 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0223.017; Mon, 20 Jul 2026
 16:21:43 +0000
Message-ID: <57651a6c-1751-4697-85e2-018731e4deac@intel.com>
Date: Mon, 20 Jul 2026 18:21:39 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] drm/xe: Add debugfs for IA/GT bias
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, Vinay Belgaumkar
 <vinay.belgaumkar@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20260715235824.116991-1-vinay.belgaumkar@intel.com>
 <20260715235824.116991-3-vinay.belgaumkar@intel.com>
 <al3-Kf5iZD1dNR0w@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <al3-Kf5iZD1dNR0w@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM8P191CA0004.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:21a::9) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|PH7PR11MB7479:EE_
X-MS-Office365-Filtering-Correlation-Id: 404d42e2-4e70-43ba-2b4c-08dee67afc92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|18002099003|22082099003|56012099006|11063799006|10067099003|4143699003;
X-Microsoft-Antispam-Message-Info: XQOfUI2BWdkP0Ew3s2WlqCv+XcHnVRFSaN8mHsj4enCr9e5UNGPP2W5dHQyNdUVk0WKbBungcY+WOIH0b6NKHZ4dMOKXlkc1V7O1r6CZE/wpLDF9w64FObqXUZ9qfRdttZEmbSRsQoPcDDeicRNc/ongkj24K587QlZPyB04QMUQmIGxY8Al9tvAi8Iyf1UdQA9I4X+MPMxu7vigI4nSE8W1hmgPJYD/OC0eNxIUTakf5FyvcPp/j3px9cOHISZ2YXwXV1SBDj+mz3khNXOhO8gbC028S/ZtN38WoeO4t8GqLgIDo6duA2HaNqMc2rdeaLxBXRBdtIEm9lIfOU6aJZ8tRA9fnHtSi9XWq+R77sQgDRV1DNJ5B4Rg5L/2b2CB5Au6wRPoFnbpQmlnoANYUARgi+MrWBPrSU9Jhq55EzTFQirJPkvOs+y6DjODlQZqHyK82vgq3Ye1G3yCDha2iUt7hFFA2p8YkAJK/TIDhwVsXuBdyj2n79tL4khnioXKJT5O7XfnCY3Xqcxtx2UkSIl80fPksE/2HnD56Rji9sfyKfghnkKt2RyYX3aQ7tuB4Hzwj5X3j31oYJlTDiMUK/QKXJv12x9dbT1VNWUh0/QsZ0fu7FLlqBZ0G/n1IOPTM5MqOWRahT1U5ptu6VIb2PQRx5B/s4lEaHVCB1BOOEM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WmZwOWQxMmJSVG5wMm5MdUthMVBPYVRWTCtYVlpsQThlOUdYSkc3ay8vUWF6?=
 =?utf-8?B?RHRncGJvMk9uTlFuRHVrMXByRGJvYVc2MFJXVlBPNTRNUjVnZ3R5b29ZT3B2?=
 =?utf-8?B?NGdIY0pxeVhqT2Q1blI4TGF5UDdXZ2F2SDFZUGF5Rldpd29TUHk0WVR6MG9E?=
 =?utf-8?B?K1FuWkZFUzgvVEYyVjArSHhsRGVDdUdhQlNpNFdHNElra1JsN0lqRDdtMGUx?=
 =?utf-8?B?ZzZXaWJML2NTVUpFMVd3VElBc094QXlLTk1XYTI3VmRwK29CdG81cnVFekNj?=
 =?utf-8?B?bmxpbG10U1RYangzTUVxYTZmYk16UzdiRVFVOXVkMWoyNVdUblBneHV6dUlE?=
 =?utf-8?B?SHlKa05BL3VyVndzSGdKR3VicnRvdG1EMWpteUNGVUtTVnNmSGcvOEhieHEy?=
 =?utf-8?B?MUpOenlLNUxaRHhUU2pzZFV2OGpxTTdzMHpmbkNYQ1UvS0pNWHJaTXFLbk40?=
 =?utf-8?B?ZVExSDNzV1ZmaWVDaUVITm00NnYxVm1lRVdXeWZiR29CUEpQQkxLVTMvSm5O?=
 =?utf-8?B?Mlpwb1VKTjR5ZDlyLzdYZWNSQWNyaitZMW8vWElMWWJJT1Y0Vkg5TVoycXpG?=
 =?utf-8?B?QzVaVTl0ZW9rV3FEUGU5Z2l6aEVxTFpNc2Vld2RUK2xXQmMwYW9xVXlDR0Zi?=
 =?utf-8?B?SGFDV1ZiSmdJSzlWT01Gb05vQm1uUzB1eGhzTnNURUNaaHhoWVdqSFAvZ044?=
 =?utf-8?B?Wmt1WXNYMFlkU1NxUmhFbVQrUGtaeDYzN1Z6d1JhZUdHT05Zc1J1ZjFoaU9K?=
 =?utf-8?B?aENvcDVwaWgycTVqUERhd0d2QThqdSt2TTRXRkNGM0xZTGNCeFIxZXdzTCtJ?=
 =?utf-8?B?K2hxdmFJdXlkc0ZGQTJEMnEwNk1VckxWWURwazh5UHpzZStsS0JoM2Q5RjFo?=
 =?utf-8?B?NEs1MHFFSThEMk5qcis5TENuQVN3bHdCajFhcE1SU1JJd2YxSysxcklOYnUz?=
 =?utf-8?B?UFd4Qi84TzFIakozWG1rVXB5dXBBdDFJYnNpcHBuMWdKQTBPODNFYWR0RzQv?=
 =?utf-8?B?eHFIdW9wMEt0NkFlTzVSWGxVTEhjdkVRbXNwTmpuUlk3dFFXSkh6UWJ5Si9D?=
 =?utf-8?B?cTYybWluVVAyWXhhVGdxTEIxaitNTzdwa1lIeTBEYkRLYWJDMEJUT2NVdFoy?=
 =?utf-8?B?TktsVHk0bUZwN3JRZDlWMjhwOXVKanRpN0hXYTZGY0pRUnJURE9hR3UrUnJE?=
 =?utf-8?B?d282YjhLOG50R1gva0V1WGZzN0dlV0VPdFA5VG15UU9hR3pmNXRObmJwLzR1?=
 =?utf-8?B?bmx3NnhlWVdkWHpYQ25JKzQxczY3dUlJUjJSMU1kVkFJWU5BSk9ieWd0dW42?=
 =?utf-8?B?eHo4UUpMUlFJZ3NUQVBheStpNmVoc2NtZ2JuS0JPNTBKU2hXK3EveUJjS1ll?=
 =?utf-8?B?MHROVHpiVHcyaXBTOHdTc015aU5YMVVMNVVqblBUd2RZaGh6ajUzNmRrT0xk?=
 =?utf-8?B?VVFsNExZT2ZNMmsrMVBMd1kvZ09Edko0SE9OQVI4U0F5L1pxN1BYMHMxTjhl?=
 =?utf-8?B?OGpEbHM4bWVYUGRmck9JOGQ3a3pNT3pRVmVmUnRBUnVDc2g0RHhoa0Joc0tl?=
 =?utf-8?B?Vll1eGFRMzZYYlVuUHpVZjFsRERZem5BMHpsYlJZU29ISDdpNXJ4Y2dDazl6?=
 =?utf-8?B?QjNFZER0YktHTmdicnl1R3BLaWw3eGpWVXgyZytaODBhOWc1MUx0L1lYb1NY?=
 =?utf-8?B?d0J3bWIvQUNLQktTdk9SdWowOGN2ZlcwSmMzNi9Yc0tSSXRXVG8reUFxcVAr?=
 =?utf-8?B?RTk5SWdrbm4zNW9qZ0ZyQlQvM015T2svK2diZzV5RTVDbFBHTWV5elFZUTUr?=
 =?utf-8?B?dXZ5aFYxNms1RFdycjdMUGVkTnU3NktpUnFGNG4yMmtkUi9ybGg4emJZazFB?=
 =?utf-8?B?RXRQUXZyOU0yS1RlK0FENklFQzkySWE2YUUwNGQ4cjV3MWhVQWxpRnJYSW5V?=
 =?utf-8?B?WDBDUkhYL0xSTE9XeXZ2dnR3VWpHTVp2VEZaRFVmOThhV3hSY1JWQStCRm8z?=
 =?utf-8?B?eldsT0M0THkwMFN4WTlwS21VWEU0ZWF5QW9xdEJERWxDZ3VjVGtmZUtLR2Mv?=
 =?utf-8?B?elBVejFqSXk0WjE2VGNmY3c0eTFDTy9MZm1LWElhS3NZV2VJSWF2aVNDZldW?=
 =?utf-8?B?dWRyaVJ4M2l0N0VUNGY5TmhMN056Z1JjYjdZN2ZHMHZKalBqMWVzTHpwVzFs?=
 =?utf-8?B?K1FKR0l1L3ZuaUpZb2ZieG1UdjlnRFRlSldyRWVUVEc4TVF0YllONWl1cnRF?=
 =?utf-8?B?VUl5Q3ZvNmJjSldFdGE2UnYrUS9hMUpxdFRKaE1DdXRlQ3ZaSW15Um1CZ2hI?=
 =?utf-8?B?UFBFd09XSWIvU2tlb1NMZ3JSSTBnM2xkc2RiNWZDOEVqNzVkNXhpZWdVSEs2?=
 =?utf-8?Q?eaHwmDIut1H1XCk0=3D?=
X-Exchange-RoutingPolicyChecked: WlItscFntGdNwJgG0XtU9PtNE4jVuWVOS1U00ACUv8fWdBBZ5qoQqkNRj709mMbDUojm56UAXe+a+QMXYZYlWzYb+4IROShI0RdWiDIkfACy1LlPCt55E36NLcWCchmVJwNM8w2G44egVa2j2n04rBTa2dMAuvln1xUUnzhYKrXeasmhWKgDERL91Ll95wpAtDB3lbRKpEA8M6qvQtWGH3RRu0+IsEiE6162oAcASkO0LLRG7CtOBfk3l5PIekwWP3pB/tFlIqfeV5513nPjcpYL4Ue0g3IkFD/5AMmv3CMJCXSI1cpDwZwTIUYOCaUVWJX7aPFUdMzSpDaXJ21EiA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 404d42e2-4e70-43ba-2b4c-08dee67afc92
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 16:21:43.4992 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S2ZYsw0sACx5udPVbdxtUp4NhVhUC369IVZKO5QXnnZJU9iEjv5BCUmMSy91ezC4zBFTQDNOVWPTr3x3pWPmMq08SVoOGX6RMccQ3k7FRzE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7479
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



On 7/20/2026 12:53 PM, Rodrigo Vivi wrote:
> On Wed, Jul 15, 2026 at 04:58:24PM -0700, Vinay Belgaumkar wrote:
>> GT_IA_PERF_BIAS_REG indicates power budget between IA and GT.
>> Lower 16 bits correspond to IA and upper to GT. Higher value
>> indicates more bias towards that plane. The values are in U1.15
>> format.
>>
>> $ cat /sys/kernel/debug/dri/0/gt0/ia_gt_bias
>> 0x80004000 (GT: 1.000, IA: 0.500)
>>
>> This interface will allow us to observe power budget changes while
>> running workloads and also, if needed, tune it.
>>
>> v3: Add a helper function for U1.15 decode (Michal)
>> v4: Validate input values (Rodrigo)
>>

as you are adding new reg, can you please add Bspec: reference here?

>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> ---
>>  drivers/gpu/drm/xe/regs/xe_gt_regs.h |  4 ++
>>  drivers/gpu/drm/xe/xe_gt_debugfs.c   | 83 +++++++++++++++++++++++++++-
>>  2 files changed, 86 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> index 08251c7a1a4b..4f1404c6c209 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> @@ -634,6 +634,10 @@
>>  #define GT_GFX_RC6_LOCKED			XE_REG(0x138104)
>>  #define GT_GFX_RC6				XE_REG(0x138108)
>>  
>> +#define GT_IA_PERF_BIAS_REG			XE_REG(0x138158)
>> +#define   GT_BIAS				REG_GENMASK(31, 16)
>> +#define   IA_BIAS				REG_GENMASK(15, 0)
>> +
>>  #define GT0_PERF_LIMIT_REASONS			XE_REG(0x1381a8)
>>  /* Common performance limit reason bits - available on all platforms */
>>  #define   GT0_PERF_LIMIT_REASONS_MASK		0xde3
>> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
>> index c38bcacb27e4..407393a90909 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
>> @@ -10,6 +10,7 @@
>>  #include <drm/drm_debugfs.h>
>>  #include <drm/drm_managed.h>
>>  
>> +#include "regs/xe_gt_regs.h"
>>  #include "xe_device.h"
>>  #include "xe_force_wake.h"
>>  #include "xe_gt.h"
>> @@ -22,6 +23,7 @@
>>  #include "xe_guc_hwconfig.h"
>>  #include "xe_hw_engine.h"
>>  #include "xe_lrc.h"
>> +#include "xe_mmio.h"
>>  #include "xe_mocs.h"
>>  #include "xe_pat.h"
>>  #include "xe_pm.h"
>> @@ -336,6 +338,83 @@ static int force_reset_sync_show(struct seq_file *s, void *unused)
>>  }
>>  DEFINE_SHOW_STORE_ATTRIBUTE(force_reset_sync);
>>  
>> +#define U1_15_MAX		0x8000

this looks more like U1_15_ONE, as U1_15_MAX would be 0xFFFF (~ 1.999969)

>> +#define U1_15_INT_BIT		REG_BIT(15)
>> +#define U1_15_FRACTION_BITS	REG_GENMASK(14, 0)

as these are regular U1.15 definitions, no need to use REG variants

#define U1_15_INT_BITS		GENMASK(15, 15)
#define U1_15_FRAC_BITS		GENMASK(14, 0)

>> +
>> +static void decode_u1_15(u16 num, u16 *whole, u32 *frac)
>> +{
>> +	u16 frac_bits;
>> +
>> +	/*
>> +	 * In U1.15 format, uppermost bit is integer value and the
>> +	 * rest 15 are the fraction. We calculate up to 3 decimal places.
>> +	 */
>> +
>> +	*whole = num & U1_15_INT_BIT ? 1 : 0;

	*i = FIELD_GET(U1_15_INT_BITS, value);

>> +	frac_bits = REG_FIELD_GET(U1_15_FRACTION_BITS, num);
>> +	*frac = ((u32)frac_bits * 1000) / U1_15_MAX;

this wrap to 000 resolution doesn't look like a pure U1.15 concept

maybe introduce a separate helper:

	u1_15_decode_decimal(u16 value, u16 *i, u16 *frac, int digits)
	{
		u1_15_decode(value, i, frac);
		*frac = (*frac * 10 ^ digits) / (FIELD_MAX(U1_15_FRAC_BITS) + 1);
	}

>> +}
>> +
>> +static int ia_gt_bias_show(struct seq_file *s, void *unused)
>> +{
>> +	struct xe_gt *gt = s->private;
>> +	struct xe_device *xe = gt_to_xe(gt);
>> +	u32 val;
>> +	u32 ia_frac, gt_frac;
>> +	u16 ia_raw, gt_raw;
>> +	u16 ia_int, gt_int;
>> +
>> +	guard(xe_pm_runtime)(xe);
>> +	val = xe_mmio_read32(&gt->mmio, GT_IA_PERF_BIAS_REG);
>> +
>> +	ia_raw = REG_FIELD_GET(IA_BIAS, val);
>> +	gt_raw = REG_FIELD_GET(GT_BIAS, val);
>> +
>> +	decode_u1_15(ia_raw, &ia_int, &ia_frac);
>> +	decode_u1_15(gt_raw, &gt_int, &gt_frac);
>> +
>> +	seq_printf(s, "0x%x (GT: %u.%03u, IA: %u.%03u)\n",
>> +		   val, gt_int, gt_frac, ia_int, ia_frac);
>> +
>> +	return 0;
>> +}
>> +
>> +static bool is_valid_u1_15(u32 val)
> 
> this function name seems to be misleading since it validates
> the entire u32...
> 
>> +{
>> +	/* Validate both IA and GT values */
>> +	if (REG_FIELD_GET(IA_BIAS, val) <= U1_15_MAX &&
>> +	    REG_FIELD_GET(GT_BIAS, val) <= U1_15_MAX)
>> +		return true;
>> +	else
>> +		return false;
> 
> just
> 
> return (REG_FIELD_GET(IA_BIAS, val) <= U1_15_MAX &&
>        REG_FIELD_GET(GT_BIAS, val) <= U1_15_MAX);
> 
> or perhaps just use this directly in the function below...

and maybe as:

	if (REG_FIELD_GET(IA_BIAS, val) > U1_15_ONE)
		return -EINVAL;
	if (REG_FIELD_GET(GT_BIAS, val) > U1_15_ONE)
		return -EINVAL;

> 
>> +}
>> +
>> +static ssize_t ia_gt_bias_write(struct file *file,
>> +				const char __user *userbuf,
>> +				size_t count, loff_t *ppos)
>> +{
>> +	struct seq_file *s = file->private_data;
>> +	struct xe_gt *gt = s->private;
>> +	struct xe_device *xe = gt_to_xe(gt);
>> +	u32 val;
>> +	int ret;
>> +
>> +	ret = kstrtou32_from_user(userbuf, count, 0, &val);
>> +	if (ret)
>> +		return ret;
>> +
>> +	if (!is_valid_u1_15(val))
>> +		return -EINVAL;
>> +
>> +	guard(xe_pm_runtime)(xe);
>> +	xe_mmio_write32(&gt->mmio, GT_IA_PERF_BIAS_REG, val);
>> +
>> +	return count;
>> +}
>> +
>> +DEFINE_SHOW_STORE_ATTRIBUTE(ia_gt_bias);
>> +
>>  void xe_gt_debugfs_register(struct xe_gt *gt)
>>  {
>>  	struct xe_device *xe = gt_to_xe(gt);
>> @@ -368,7 +447,6 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
>>  	debugfs_create_file("stats", 0600, root, gt, &stats_fops);
>>  	debugfs_create_file("force_reset", 0600, root, gt, &force_reset_fops);
>>  	debugfs_create_file("force_reset_sync", 0600, root, gt, &force_reset_sync_fops);
>> -

unrelated

>>  	drm_debugfs_create_files(vf_safe_debugfs_list,
>>  				 ARRAY_SIZE(vf_safe_debugfs_list),
>>  				 root, minor);
>> @@ -378,6 +456,9 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
>>  					 ARRAY_SIZE(pf_only_debugfs_list),
>>  					 root, minor);
>>  
>> +	if (xe_gt_is_main_type(gt) && !IS_DGFX(xe) && !IS_SRIOV_VF(xe))
>> +		debugfs_create_file("ia_gt_bias", 0600, root, gt, &ia_gt_bias_fops);
>> +
>>  	xe_uc_debugfs_register(&gt->uc, root);
>>  
>>  	if (IS_SRIOV_PF(xe))
>> -- 
>> 2.38.1
>>

