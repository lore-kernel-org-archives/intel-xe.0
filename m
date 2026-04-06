Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 946D1EF4EB6
	for <intel-xe@archiver.kernel.org>; Mon,  6 Apr 2026 07:30:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E009689D30;
	Mon,  6 Apr 2026 07:30:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BNEJWOlX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7420089D30
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Apr 2026 07:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775460610; x=1806996610;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1x/WXrT1TdZc1kQ2rlpHnqfdp/y4iQObryhwPByZXpk=;
 b=BNEJWOlXXIrsez2GeLO0E3h8psvkbfT7LH6opi7GVlsuhXn80Sws7Fcy
 ivKh+7ckYUx8IOC22JDql40VIK6gn+nmroEnOdAWKAFLj/S+znU/e9Xb2
 llPPExNmqpuh5XFuMCNyuiJIs313kKdvIRc7ON/PAisQ5i/iW3XefgzTL
 zLDPvfZh1KPWYaaJO6Ibq3IX8+KFmOze01ikfaHhDOq7d7plDDrUmx+6s
 AIi7drP6qpWSgG5I95xmXpfkzxQhYMjhzvrw6q7nyFNN9QjhXksI6gJZo
 nRA6uYepNQW0v8pFQOhn/OzfKXMfG65JAAV06wzGSZvGKYA4ZtzuL/9Cw A==;
X-CSE-ConnectionGUID: 9koM/pfwTpuc1OzmM+Us7Q==
X-CSE-MsgGUID: kmuSjhKAREaC5hylmHydtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11750"; a="93992777"
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; d="scan'208";a="93992777"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 00:30:08 -0700
X-CSE-ConnectionGUID: WSl0KlQyTR2POQXgwYCCsw==
X-CSE-MsgGUID: M+KkObKYTKqJreLoig41MA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; d="scan'208";a="228090773"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 00:30:05 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 6 Apr 2026 00:30:05 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 6 Apr 2026 00:30:05 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.57) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 6 Apr 2026 00:30:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MHeJVV+3zpaaKUrlvMyezBu1Wr4YwBH/wyWJIGUkISKWb4alAH+UyI+zosjrivscNaCm8iZkn1MVU7j5a4xEpnQii5rrSgC/UXXZwPqQDFvZT6BycnHrVm4uJveYSJdCFsjuEykJER5FxfY2OJ/hhQ1WHjy7MVS8SWqQGhgWu82DbDVYDpcS1OzcTP954ARygcHh7VO6kmdpYd+KnT+sAflVIUSVdysTi5sHiCwwlurL8WgKxP1mnEw6e992/vnAUGewzmRvSSawDjXeVvxChSaPJJtmA+0Cq4x1X8IpqPaUY5sQr50WbTzIj3lNw7uooJ3QmSnZL2XK4HQ+BSUCuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dz1i5w3M2RAiyTcwssriSBO5QURH1QFb89wZWEvUgY0=;
 b=Mk6Z3aIRDvzo79Merc2x3xCeQzx/ZMgxi2YJcDeeFwsCmQiqzFKXwY0s/gx7rd5g5QPZNtjf98P3PyZri+myGZXEDUUzHnCmPwnFq2rsa9EYDSX3PlgKOT5DfEUcqOiWdveoF9WCBGYbIcQ95Eu4bchXASWqph6i+qXjJwwp4yerR8FZJrQkViWQe1UTbwkKPDyZ+3yHMGXr81XB24Z/xg0R1M6Ed3tjEMmPkud/h+3AHZub62gNibYS+vpXYdkWBefcSu2bqRUnmyamhgEtmSs8Pj5jdTd8fZCVZiX6mfiMvubHwpQfvM6derdrFMk22pmDSxN+v5PwOeLC3Vqpwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 LV1PR11MB8790.namprd11.prod.outlook.com (2603:10b6:408:2b1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Mon, 6 Apr
 2026 07:30:01 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%6]) with mapi id 15.20.9769.016; Mon, 6 Apr 2026
 07:30:01 +0000
Message-ID: <5094f7ad-3fae-451b-91f7-b2bae984841b@intel.com>
Date: Mon, 6 Apr 2026 12:59:52 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] drm/xe/xe_ras: Add support to query error counter for
 CRI
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <badal.nilawar@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <mallesh.koujalagi@intel.com>
References: <20260320102607.1017511-1-riana.tauro@intel.com>
 <20260320102607.1017511-6-riana.tauro@intel.com>
 <aczSkmVPPc8o0buN@black.igk.intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <aczSkmVPPc8o0buN@black.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXP287CA0004.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::14) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|LV1PR11MB8790:EE_
X-MS-Office365-Filtering-Correlation-Id: 8de04261-5620-4ee3-b468-08de93ae500c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: t/s75AxlONxVnN1P/8LIYt5YwAdl9SCjgR5WmQUuJUkNeGhoOUk+pmqb2igRqO1q7mb13IGR4JBOHVtq5Zd6VljXGQhK9opVAH9GYDb/6RJTUHmOKdqfz+CjQgYA/+5+/InS3W/xvJ/FCY9UR3HlvWBy0hKsBdjtrasWBDw8tfdeSoQO+uH7L5m/EtCkafgovtOd0AebjWlEFfze9Mt0ddBSswqCbWAQ67O0WqZ2CT4E7+oEv4Jn61qVHAcbJLXKi5jlwZqzxYVUfGGrGiXaKM781ZeWQQJ1EA1n42Xit0a/WjPmmgCooxRT2vXywLc8gWjTF/HrzXEF/ELlIqHRAcBc5BoTWIHYCLkJgfVTGj6OygNSx0L4qRS2Y1IxWKah1Yog6vAgwsmvmD2IVKrB3eoCg9cltp+WxK8LXrGpdMpoifZUWRUtImlUe7y9oHBwNtxIi1M1l2dq15fWudQCWnvyrLmIi2US69C4AQcIfjpFWHa8jxkteMxnEeNzjIwNQ90bdk3ccWeZ6Z44cX0XTmUhOIYC2ysk00N0c8iBJg5EUV4qTZ7RFSRRxWXbP+R9Lr3kwrx5xRkST452OKpSln60FUL9XM8BhDhhtyqHAf28S5aZ0dRYKzbQB7u7Sg6rqoeK/keb61+SlpfBa/b2PuHvDWD8kuK78/CUXf4TjcTZBGKgpVaU4IVPLJaePAN+YvtNi6OO1+yfV/sITi6XgfE9If1lv9VdSyxQ+V5sLys=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UGh3RnBOS2NRQmZ1bWJUcmJESXcvVVZxTFd5VnREaUMwdUNwTzBydUJJVSs4?=
 =?utf-8?B?dlk4cW1hNnl3N2U1Z1pjVjQ3dzlvRVVmNDl5SXgzNXJmSDk3TStsZm9zM2FU?=
 =?utf-8?B?WVpxRjl6K00wWVVZWERia1B2MkVvbUg4R1pRWFJPbmhDbGpzOVZRWWdnbXdw?=
 =?utf-8?B?dmRKSnlBKy9FYWxpUlhFR0QzQ2xyc3BhREVIQVRsaVRtY094UGRlcHhOQ1dp?=
 =?utf-8?B?ZE53clg5YkEyUDlmZW1FYU9PNU82blk5cEZDTlUwWnozZldHTjBoWU5rUVhq?=
 =?utf-8?B?M05FZzlCbTVtV2x6TXVJZURKb2V6aWRmM01LeWVrbmZVV3UySUI3aFlybitC?=
 =?utf-8?B?bS8zaFltNTNHSXQvaW5xWWlTLy9yY1RrL1drZHJqYU5nS0cweFJFOVBRenM5?=
 =?utf-8?B?UGFNQ2VmRjVwdjZnYnhyRGY0ZnBlUk5DZVhEdFE4OG5JRUxVUS9tcnhVNUta?=
 =?utf-8?B?ZGlLTXpjRW5EbXRIL0VPMXJHTllVOXBHVnZCQ1h1dkk3Vlh3YWlHdklsTTZj?=
 =?utf-8?B?eHhYSnJqRStPNUJLek1ENTN5OXF2L2hvNkt5Zm1FNlZDTFU0SFh3blMwSnhB?=
 =?utf-8?B?UERlSllBckFXS01sVUtDb2JaaW92RjY4d3JBMmlDRDZ5aTcrU0lHSkZPNmZM?=
 =?utf-8?B?ajF0c2lxYWpscXpsTGFGWVVLdTloVGQrTWx4K2U3L2luelRHS2hkeXVvbWNk?=
 =?utf-8?B?SWZUNFh5Z1pKMjNDVndWTnpGa01YSGpUbVN6WVZRRW9reUNUZHQvUHRUZ3NL?=
 =?utf-8?B?WkZudkR2NlFhYzIwOXN2YWY1Yy9zS1FqU2pCU0UwdVBrSkJ6RGxIM0syNFp2?=
 =?utf-8?B?bmFGWUg1UEZ6NTlKWG5EU211NTYwd1htTGoyRElvNHdXOFlndG1qYk1GN0Z6?=
 =?utf-8?B?bnFHTFVxQndYOTJGWEhUNVYxckQ1MldKVzlIMEdpb3F0ZlJ0WDlYOHZnOGg1?=
 =?utf-8?B?N0JGOW1EcG5wYjdFbWhiT0RTaGlyR0VNd0lFSWJHdUtocml0OHJ0WVhFQ3k2?=
 =?utf-8?B?WnBPZUhYZ2xOLzNSUWRtcFdRS21aT1dkN0RMLzMzazd0cVpsRDk2T00vVHRp?=
 =?utf-8?B?NjNVUG94YWs4VnBONForNVlQZDQyRVMxVkIyYlBMZXJFYUtyWkdYMDMveWZk?=
 =?utf-8?B?VGVTOVBtUGFsdmhsMW0yc1YvRE5WMFgydHZ1b3hHQWx0dS8xcHpZZnhyRWZp?=
 =?utf-8?B?MGpYcTFVZFMzT1RDNC8xU1F2YVRyeXJMMFdMSDZMSmY4NXVFUTdTUFVVSzZl?=
 =?utf-8?B?bnFWZnhQZVJDeXpTWHlVd0NnVzMxNVJmWU5CR0ZTOEZRT1UwcDZwR1Z1eDN3?=
 =?utf-8?B?T09zTkhyLzZ6bkxzcWRUaEtLOFRENXUxL2R6ejVrRXZ6bGdPazliUVZESkJk?=
 =?utf-8?B?Z2VBWVdlY1pQRFJraGJ4cG5ibjhmdHZad3o3bkgvcnM2K2dLU08xR1NnSnpL?=
 =?utf-8?B?MHl2UXR0WCs4WEdQNm94Q1FOcEpPYi9CeHhmdC9KTXJta1NiR01WVUdDUmJm?=
 =?utf-8?B?NHprd0tRQTZvSXA5UVFYbXlDOTNNZDlNeXVvd0JJSU9KQjY5SnAvOXlmS2xS?=
 =?utf-8?B?VFVsNWhJY3hsd2VNeXFBcWxiOEpTVHdFSmEyTWZKZkpMeVFNY0F3U1JRTXNW?=
 =?utf-8?B?aWdhNWJPVDdPbHdZWEhpcHBYQjA1L1l4N01NZ3pFOGhmeHppbkJwb2FCMnVL?=
 =?utf-8?B?TVJQaC8zcE1taXNvdUhpMUdsUGlDQUVjWnFXWjQ2b2phczVsaTUrN0trWmhR?=
 =?utf-8?B?M05uQUg5RS9jS2JvZ2hhVUtOQXZlV3dvM3lZOGtQcVNyZG1QTGNyeGo0UkxU?=
 =?utf-8?B?Q3YzRVR3OEVVYWp6bjkzbEVnbmJsdnZGNTd5WWl2bmllYWhLTVJiTUI3U0pI?=
 =?utf-8?B?aFY4cmJBMDFQTU5WQ3Z0ZjFsemhGd3VVRzNUMytPTFNHNGFkUVo0bUVCWmZT?=
 =?utf-8?B?cUk5VGZCQzFHSVZBTkhIT3p4bnl2d1pjdXhGNDhURzdLVTBzTTJTYUNiSEM5?=
 =?utf-8?B?cWxNVUJ2aXhhV1RpbFZtRnpVUmJSUlNyMloxL01pTnNwd08yWmsreWlTMGhs?=
 =?utf-8?B?ZHJ3U1B4NFBzQU1GZ1B6V0xWSUZCOVdNdThWY0ZxcDh0NmFuUFFkdGNsV3Qw?=
 =?utf-8?B?azlzSGU1eVlwclpjSDlzRURRMFdIbHhrM2hPS1NBT1pydDAwMVhJMFlkVSs5?=
 =?utf-8?B?UTJGQ2VvRTZ6RS9HVVNYOTZWMTlNNVF2bjd2K0doclJVZE5ibEU3aXN1Yk8y?=
 =?utf-8?B?WXBXNjBaSy9ZYnlrYXZDdWlSbFp4OFhJUDJld1Zzd1hnREZpa3VDUXU5OERr?=
 =?utf-8?B?T01nVFNiZTBGKyswV05BZFlZVnN1RURTRUtieC9qMkZYRVhCcGRudz09?=
X-Exchange-RoutingPolicyChecked: WZYF4vO/QvmLVZ7D6Fsyoe1xj2A5s3xPovvGFkH2rOGxnDnkmYhEamyNXdPjBs3JHprCUFEmpDG+R5gmI169DXFQx77ro/TAmFBuMHza3vuYkSM84u5SdQ5pNn8e7aWRqyVRsbK6jXrSZCepvyzgNlmHb5J3adw9QL57t225bSN6MseqpynPRBTmoDlBp/GeXRTNZkccwZskitRHfLPICwyKLVf1GjsrjHeycE1QURV25fnj+ENpOAcln5L6/KSMOm9iTngTkPRWv++IvLou93MC0L55xq2Q6vl9KN14OTLUNinVPPjIKaSOf3a9CDasijOGVHtdWBJw3adqYX9b7Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8de04261-5620-4ee3-b468-08de93ae500c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2026 07:30:01.3593 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DDB0HTUermQjRAQY4tyw/doVsI8+APAQVuOWBi9q/qn4hsbD19/UVqh3YOOdS8B+Hql+3+kkWH2x1+cOwaZp3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR11MB8790
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


On 4/1/2026 1:38 PM, Raag Jadav wrote:
> On Fri, Mar 20, 2026 at 03:56:00PM +0530, Riana Tauro wrote:
>> Add support to query error counter for all errors.
>>
>> When userspace queries a DRM RAS error counter, fetch the
>> latest value from system controller.
>>
>> Integrate this with XE DRM RAS.
>>
>> Example : query the counters using ynl
> Either Usage or Example, let keep it consistent with other series.
Sure
>
>> List all supported errors
>>
>> $ sudo ynl --family drm_ras  --dump get-error-counter \
>>    --json '{"node-id":1}'
>>   [{"error-id": 1, "error-name": "core-compute",  "error-value": 0},
>>    {"error-id": 2, "error-name": "soc-internal",  "error-value": 0},
>>    {"error-id": 3, "error-name": "device-memory", "error-value": 0},
>>    {"error-id": 4, "error-name": "pcie",          "error-value": 0},
>>    {"error-id": 5, "error-name": "fabric",        "error-value": 0},]
> I haven't tried this but do we really get the last comma in output?
My mistake. I must've added it while formatting into multiple lines
>
> ...
>
>> +/**
>> + * xe_ras_get_error_counter() - Get error counter value
>> + * @xe: xe device instance
>> + * @severity: Error severity level to be queried
>> + * @error_id: Error component to be queried
>> + * @value: Counter value
>> + *
>> + * This function retrieves the value of a specific RAS error counter based on
>> + * the provided severity and component.
>> + *
>> + * Return: 0 on success, negative error code on failure.
>> + */
>> +int xe_ras_get_error_counter(struct xe_device *xe, const enum drm_xe_ras_error_severity severity,
>> +			     u32 error_id, u32 *value)
> For event cases we need to reuse this based on error class we read,
> perhaps keep a provision for it?
You need a parameter 'error_class' for your usecase?
Let me try to split the functions then

Thanks
Riana


>
> Raag
