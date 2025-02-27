Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83722C197BF
	for <intel-xe@archiver.kernel.org>; Thu, 27 Feb 2025 19:44:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A9B710EB78;
	Thu, 27 Feb 2025 19:44:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fp959Uox";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F28510EB84
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Feb 2025 19:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740685444; x=1772221444;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ZGjEqUi3P4+64j+330NM3CEV+1q6NjTWRalueHayku4=;
 b=fp959UoxVdYdnYCvE/VVz6niNrvKzw8k+uCkzRJAChQ8rkSKPgsVsD0h
 aFnK950M3ovw5UehVrQipNKtprHYLZRaVZo2Omi2XR4yGRlq05U915XVH
 Ux5jI2vaTCA9JiL2X/Ga66sy1pc2MmZ/Twa2PJdWKBwotlVoLNv8MbsGp
 5HKLJ2h9uIr7ThYGhfSZgsz9TZEFoStDhiQnzFnvzIIDptSYhUi9II7Rc
 fyeABRP1F0CpxGu3bSfe+b7jPH2eh+3tVL/6ISNxnL/z9HJifXn/z5xWT
 0MNUY0htcOanz1TlL4X6W2C063FBCqhtpdBDnqVCZlGkJPIzaEa70kSkJ g==;
X-CSE-ConnectionGUID: IAF4821YRhaY5Uh0MXY6+w==
X-CSE-MsgGUID: RLkxH7PITzu/P89ZZzC6iA==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="51803231"
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; d="scan'208";a="51803231"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 11:44:02 -0800
X-CSE-ConnectionGUID: NVcXF8zWSvC1qVyosooguQ==
X-CSE-MsgGUID: NUqmT/avSAeKpv1vF3NUpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; d="scan'208";a="122139200"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 11:44:02 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 27 Feb 2025 11:44:02 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 27 Feb 2025 11:44:02 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 27 Feb 2025 11:44:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AkNp0Y8Hhzf9qYVB08FYGJqJT7lApEMhDjuGT15RqJGBWYd7lEw/pcl79iiRLsR4H7Oem+JU62KIuHbxYy72J6vFlHSButzyAFfkg2o8CXFl7dEEDoP/Fz/+GFY3GHrwRNY6GjwTirOzTOiUfM67acarljYR9OZUMVIbRrUZ43767X0ItfVRoQFhua4kK62yliNE8prh2qnDJaGcpyDKzgTyNe3KLkUWhMA+TZh7hpYfBi0jjXZCs7vwt/3eNzu+ecRzbN0MfwHgzuld6SJQwmY+np/LQiPJkdfkQKvFOyfVktqz1WLf36U2DgQq/jR9XyB3MDSDHMuhuPdn0mjV9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qU9xnAPUx8ch0wT8Ioy+iNV3ikzO7GWUEOELsml0kn0=;
 b=H9SmzPtSd5ZvQxdkkg68KMTt03fCQq1CpffoWvcqe7doVE3hTOOoGIIvV7OV8S6OODj++gOJOr9zZko0H6D/jUvJZ/t7j3QT4L2H0SgbGOd2SnvC+T/DZVSNN2kM1zkZOu9C+Df2XGAaK9ti+UevGpqxdkA2v/LB/89bEhGjQCWbVu4QvJW16/wKkWWSDYCvACyFPRqu+6+doObc4WPe41DaRjrXQyENcyF5KWlCvDHMAXYgefb2ufGLezJTpP7rOERAlu9jlmgmdVhycJE5FjZBVUg5tfb0OZtpMUsla0uZO9plLk/h4ic5gakSO9jssT/yvwbtlQ4mrTvWxh5n/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by DS0PR11MB6445.namprd11.prod.outlook.com (2603:10b6:8:c6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.18; Thu, 27 Feb
 2025 19:43:58 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%7]) with mapi id 15.20.8466.016; Thu, 27 Feb 2025
 19:43:58 +0000
Message-ID: <058ab253-3ed9-4a1a-a23e-c75282ec1069@intel.com>
Date: Thu, 27 Feb 2025 11:43:56 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/xe/vf: Set submission version in xe_uc_fw struct
To: "Laguna, Lukasz" <lukasz.laguna@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <michal.wajdeczko@intel.com>
References: <20250225132337.6508-1-lukasz.laguna@intel.com>
 <20250225132337.6508-4-lukasz.laguna@intel.com>
 <f42f1fb1-9cca-429c-b232-1dc2984e04fe@intel.com>
 <91ed57cd-f17a-469e-9bef-fd43f2894e39@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <91ed57cd-f17a-469e-9bef-fd43f2894e39@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR07CA0060.namprd07.prod.outlook.com
 (2603:10b6:a03:60::37) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|DS0PR11MB6445:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ae9f1fa-f11f-4cc6-694c-08dd5767139c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WUZkL0h4RHUwditwOHBJM05tcWxxWUlwZjZUOVphbitXNUVETnYyaE9UeXRW?=
 =?utf-8?B?MnROK0t0T1dFZlkwTVFBSHNraW1Ld2M5VkpuOHp2bFh3TU0zcjRZWW5JR28w?=
 =?utf-8?B?K0VMMmNIOTBlTm1keVFpbmU5MVhBSHI4UlBIRWoxRjVMMzNZUDU5aUNsMTFS?=
 =?utf-8?B?eCtoK3BRV3JsWU1oc1pIZkFTT1pjNm1xUENDMWtNNldDTVdveFgzSURmSkdM?=
 =?utf-8?B?dEcwM3RjZzNiSk1SR0ZROGJEVHFjNTk3akpFY1VIT1ZzbmRCUnc3MWhHczBF?=
 =?utf-8?B?cDhSa0o5c0laelErT0xNZTBqQ08vWTZTOERyZGVST211S090YmljeW54VEN5?=
 =?utf-8?B?U21Xc2l4NGc1NzMxNDhMRmpxbDB2WWl3a3gyeTljM082MStSbDJobzYzS0hY?=
 =?utf-8?B?L2NYM0JzM0pmM0MyZkRPd2F3SjRCcVBTQ1k3QUFCTEk2TFpoa1ZtbmlNdGJ0?=
 =?utf-8?B?MGxKNkovWnRubnNuM0R1enNaYXFSVlQzWHNHaUZkVzRTZ3pwTUZtdS9RZ2d6?=
 =?utf-8?B?RjJCNEViZFlScjdqL3ltdDU3NUkrWHNQRy9ZbFdMNVQ3eVBsOGJQcmlmMmlH?=
 =?utf-8?B?L3llOXhxckNYc2QvMkJvMGVYKytIRTlpNDRwQXc0Wm1UdThOZW5tT1ZpWEV2?=
 =?utf-8?B?eFVqK2R3WGJ2MERtYU9FQUdPd2FCVFovUGlyZzV1SGtkRzl0Yko1dm5RMUkz?=
 =?utf-8?B?V0diVGFCVTdEVmw0U1Q5NWNEWlNGVWNma3JsdHNYbW5CK2tndCs2UGZzWkJY?=
 =?utf-8?B?MUZZZlpZdHlRclBJc3NQT0puNm5YSmtjUjZMd2dieWZBNHhpVVg2OGU3am0w?=
 =?utf-8?B?NTN4c2dyM2NKSE5CakIwMWJjU0tQNnIwZmxqRVBjWHVaYS8rQXN5Y0pPa3Zn?=
 =?utf-8?B?WEE0UnRSNWJhM0JLREpMYTZGVnN3SFRobEZaVGpzY3NCWDE3MjJXenNJSlZI?=
 =?utf-8?B?ZllOd3RsWCt4eFdHMmJJQnlISHg3eXl2K0xhV2NnZDZtSlN2TWZUUG5rcDdP?=
 =?utf-8?B?ZkhZblNLOHVDZ0NoZTBidmg1dEhsOTI2Q1BYV29xOFVRZE1HZS81TjNWTmFU?=
 =?utf-8?B?SjJ3VFkyZnF3UXZKY09sNU9BcTZGV3RXUGNDUkYrOHExN0RtRTA3MlBvNUZZ?=
 =?utf-8?B?YXdDVkhSRXEzandaekZVQ1BuR2pzWWVQQUQ4bWYrSElSWWhEWjRCbjRuM2xk?=
 =?utf-8?B?TmdDUENMb1Fvb1c3eEFJRnY4MnVkd3JmQlR3bWprWGJMaDNlQTJoTXNGVXRI?=
 =?utf-8?B?ODVaVS9scnpUcW1iaWY2UjZWWTZtV1IyMTRRNHlHRHRPRnFPNjY3MGxqeWtu?=
 =?utf-8?B?M3dUZHdXMmp4TTByU0ttRHJ4WmhXSitCOW1lS3B3dkZWMEpqTUp5QXpQUzlx?=
 =?utf-8?B?bXhsYmZiQUk0ZVVjMXYyL21qVVc0S0RnMUErdzc5T0QrbDROS3V5cjBqN3Vi?=
 =?utf-8?B?ajlZaW5MYWllMUVTTTZrT1UxL1JCcWtqVG5IbFdaS2JlKzRtbWU3NTUwSE12?=
 =?utf-8?B?SG00anYzTmVMdGNBV0QzQXBUaUduTkM1Umw4Q2dWNnJYV0h1dzZlUzJlUTVv?=
 =?utf-8?B?RjViVW9WU0ZUUStsa0RYNmp2VEQyNHlwTkc4NDZpRkdOSk9ETUo1NkMza1Rn?=
 =?utf-8?B?dnl3eGp1bVRCRkRBTVdKbDVRZHRKb0FWcENPTVRmQ0dxNkVYMldHK21sTnNY?=
 =?utf-8?B?NUxJUkFVM1ZiSmtJbWxubGhXK05iUEVydFhYVXJrMkx0OWx5V3JzbGR5R2xP?=
 =?utf-8?B?MGVtOGlZeHVDalRZdnoxUCs2d0ZBQkVNMkZzcFpkekVwTFRPTTk4Z3UyTnZL?=
 =?utf-8?B?UytnYjIxSXhlWk9qa1JXSk9NempxS0F6amVlTFBDY0NPa1J5aEJqQUd1TWl4?=
 =?utf-8?Q?UdDDeR1LmR0RM?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cXpyOUMyczJUUjVnb3drMFF4TW9aS09wMTBUa01vVXhvaW5UK1VyNitvaUxJ?=
 =?utf-8?B?NEE0S0J1YjVWS2Z2UHJiaUpvNEhLSzNSTVJxVkoyN1o4YTN0UEV4dHdLSFlz?=
 =?utf-8?B?K3RyR1dKRjJKYndyM042OXBMUzJZbStVSVJnRjRNNTRFNEN5MDdUdGsvMjNn?=
 =?utf-8?B?dElHNEczbElVQ1RsZW45c0YycFhFckhuU3NBRVp1Wi9YYzUzcXBMdWllTmdo?=
 =?utf-8?B?TDJ5NXVwcU45R1ladzlLVk5WTEdaSDBDMWJtNDRTSjF0aGNOK29PRGVYNVM3?=
 =?utf-8?B?ZklpdkRqZzlqckpLbGs0THp5U2Jvay8wcElRV1JDUm8vWTEyQUVUNkpKajBI?=
 =?utf-8?B?eG00S2Y4U2h1OTB6eXpGMmlJV0w1NHA4anlGbEZ3ZEwxNFRTMDUrd1FramZM?=
 =?utf-8?B?aEV4U0djM2liVHhUVTNEeG5QVG5iejY2a2tQY3N4Z3NLcytrbEJQYkk3dmRR?=
 =?utf-8?B?bU1vNHh4c1N6K3haN2RxRUg1clR3WGRnMlQyUzhqU3BENkVUMityRG5ZemZP?=
 =?utf-8?B?eVEyVjF5MUJIMVVDdCtrWDV2UHY5Z0c1Mit4VUdXUHhYNmJuMTYreFNVNXRr?=
 =?utf-8?B?UFowdjQyR0Nja0Q3R2lpSUdCZHMyOHBUWGxQNVlrZ3hhQnI0UFlqMFlhQ2hy?=
 =?utf-8?B?QjZOSkF6TlBYNm5WaWRVZG5VZ3l4dHJPYVQwNGJZTHV4NzYvb2x5YkE1UG9m?=
 =?utf-8?B?TTlSeklHeTB5ejA3aFh4NGRsOU1jMEhnb3ZQcUt0TVd0alB2YUtiLzh2UzNi?=
 =?utf-8?B?cm1ueFQ2ZThhUVMwU0xVVStNN1hIT01Wa3Q0MXBnZFJweVJNVkNDanZoRVJV?=
 =?utf-8?B?RWRiam1YMnRLYXREdmlxTGIvL2k5MmMxMXdtNWRXWFBNTWZaM1V3bC9WeDRT?=
 =?utf-8?B?TUp3T0phTVlWTkw0M2ZxU0JYL0Z3ZUJRRWwweWt2blFMcTk1Y1o2ZXloNlZW?=
 =?utf-8?B?MU9HWHErK1ZZOElJZEJwQ0hvTFVQVXEwZC90OGVUWlVBQ3BYaHFnamorbDY3?=
 =?utf-8?B?ZEtUZW1YVytSZERvSlpqSzBSSlNQVlhkMEsrdGVxVDdCWEtkVGg4U3M1bXls?=
 =?utf-8?B?bTBUdFdzeG1PTVBCS0ZQRFhUdHlGNDdWeElKUWhWSHNob09EQ0hUbXJ1UldD?=
 =?utf-8?B?dzJsQ3BnY29tZ1dtVnJqTHFpZGdwOC9zTElKVHJrY3BaYmF4eXM4VXQ1dnJQ?=
 =?utf-8?B?LytRcytxeTdkYjhIWEwwMmZLVnpuSkdwSWtJZkNoemxDNVJ1b1A5dlRoVEdL?=
 =?utf-8?B?akJKNDNzNndjYkp0aDJvRi9vbG05QXFqUllBSDl6b3ZURno2aU90RmZROVdM?=
 =?utf-8?B?QUJlN25taFRFQ2lubTZVNFRXeUhXQ3ZxNGZLRDBnNCtyUTVqK1pTcUpNM1lZ?=
 =?utf-8?B?MExKeHYxbGxnYm9mUG44bFdYM2w5Q3pjK1ZsajMrTHVtRmhSSVFFWEkyWktQ?=
 =?utf-8?B?K3pETEhWNThTUHhrSWs0QkVOU2RLVHAvYXBJVnZTbFgyL3h0bERpcW5PTDAw?=
 =?utf-8?B?ekovM1JrUFBPakE2K1Nibk5JMVNVTTlqalZZd3pzbkxteUhQd0tRMzFtRkhs?=
 =?utf-8?B?MDZDUjJjV2FueHRvU2ZSbXlLQmt4N0pRdVplY0svanBVQkd2R2pjVnNkck9N?=
 =?utf-8?B?N05IQ3JuNmpSREVHOXJ3SEJzcUhINDFQOFF2eG5Eeng4NTVob090UTlHTURW?=
 =?utf-8?B?cjFFeE1ENzhORUpPK2JvQTlsZ1N4R0VRN1hRMXZSc0Jvemo1SjZjSVpwL2ov?=
 =?utf-8?B?aVBibEVaYnZhRHpCLzNYUm9IYURuT1kvVUpLZHFtZWpOdlQzcFp4MjJtRkdS?=
 =?utf-8?B?U29EaTNHTS9WQlNGZzFyZ1R3MVpvNFdaaVBjRmRFTUlod0xqaThHcDFxWGZx?=
 =?utf-8?B?QjVrNjI1cHlZcEUzMVdXWTJCRzljNGZiQXlhZllEaFVYYjJPMHVCUXhGaEx2?=
 =?utf-8?B?NEk2YnEwZkMyUjJINm0yWDNaTjlldnVybEtuZEpuNGU5VHNzWnV2aVhubmta?=
 =?utf-8?B?ZXF1UEc1UHNVWE1VSkl5dnRBcUZVL2ZEb2lXSzUxcWVIQXZLVlowREZMbTJF?=
 =?utf-8?B?RFF5ZUF2NFZuTk9mYUJ3cW1KWk5LaVNKRXJLV21vaUNHamI2WFJ5ODI0MDNB?=
 =?utf-8?B?eXppU3h0dEpxTkc3VDNCeGovU251UlkxeTM3bmtmbjd1QVYxUE1Cd0NoOENN?=
 =?utf-8?Q?1DTggtj8+xVp4pFoPLxP9EE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ae9f1fa-f11f-4cc6-694c-08dd5767139c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2025 19:43:58.0058 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oSsqEOV1x35QIUkE9Kdekf7en+/dSbWZ7zhf5pOTe2VgBuJq9qdzp9QUPc3eMzEVVZP8efYNapqe4xm77xA2LdEl8wVsGGoC2k9ru0z+Qt0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6445
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



On 2/27/2025 3:22 AM, Laguna, Lukasz wrote:
>
> On 2/25/2025 23:30, Daniele Ceraolo Spurio wrote:
>>
>>
>> On 2/25/2025 5:23 AM, Lukasz Laguna wrote:
>>> The VF driver has already negotiated the ABI version with GuC. What
>>> remains is to populate the generic xe_uc_fw struct with the version
>>> before initializing submission.
>>>
>>> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_guc.c | 9 ++++++++-
>>>   1 file changed, 8 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>>> index bc1ff0a4e1e7..7b38447d902c 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>>> @@ -703,9 +703,16 @@ int xe_guc_init(struct xe_guc *guc)
>>>     static int vf_guc_init_post_hwconfig(struct xe_guc *guc)
>>>   {
>>> +    struct xe_gt *gt = guc_to_gt(guc);
>>> +    struct xe_uc_fw_version ver;
>>>       int err;
>>>   -    err = xe_guc_submit_init(guc, 
>>> xe_gt_sriov_vf_guc_ids(guc_to_gt(guc)));
>>> +    err = xe_gt_sriov_vf_get_guc_ver(gt, &ver);
>>> +    xe_gt_assert(gt, !err);
>>> +
>>> +    xe_uc_fw_set_compatibility_ver(&guc->fw, &ver);
>>
>> Why not just pass &gt->sriov.vf.guc_version here, instead of copying 
>> it into another variable first?
>
> By using xe_gt_sriov_vf_get_guc_ver(), we additionally verify whether 
> the handshake completed successfully (major > 0). Only in that case we 
> set the version in xe_uc_fw.

But it's impossible to get here with a wrong major value, because 
xe_gt_sriov_vf_bootstrap() would fail. If you really want to have an 
emergency check then IMO it'd be better to just have:

xe_assert(xe, gt->sriov.vf.guc_version.major);

which you can have in this function without the need for an helper (the 
same assert exists in other SRIOV functions like xe_gt_sriov_vf_lmem).

Daniele

>
> Lukasz
>
>>
>> Daniele
>>
>>> +
>>> +    err = xe_guc_submit_init(guc, xe_gt_sriov_vf_guc_ids(gt));
>>>       if (err)
>>>           return err;
>>

