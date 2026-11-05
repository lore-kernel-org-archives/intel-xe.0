Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E94D606A31B
	for <intel-xe@archiver.kernel.org>; Thu,  5 Nov 2026 05:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XRSzGRDY
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43ADC10E223;
	Thu,  5 Nov 2026 05:59:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 550AD10E223
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Nov 2026 05:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793858350; x=1825394350;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=AYYmlxLaj2QqWm/G5OhjsRnccgCRS0XBNe1CkOJeG0c=;
 b=XRSzGRDYHKKmECZT8/eaH57ssAYWQA9s+/p8dapTrNVnmuZt9/Y+BaDo
 pMmfG70iTzjov/kYsYvgGb3a2yT0RugR64D3+1ZSO0zImB+zgm4eh43N3
 6Q92i2M2eEyfOw57tOptTVJaeg5e2ZEzZlkrJcMqi9pDI0bRJdOThz+kq
 iqYZlGjXC4pHqpUSU1a3Sc0ia9A4NcY7o6thN9gHHfUal4QH+v82dZVD4
 /mwnMqmFBEuHb3br0T8FVLqug8l1AWW76CyKSHCg1FLHagqjXmrhXjR+r
 RUpp0Y7FI14Sc4Y9StH/b8l5QCyQS/Lq1DpQqjLaB3Tu2zF3wZP/JSZPT Q==;
X-CSE-ConnectionGUID: ekELDvMNQBuj4vMbS2SkDA==
X-CSE-MsgGUID: 5I4ICPgARj6RkeG4LvKxLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2515732"
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="2515732"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2026 21:59:10 -0800
X-CSE-ConnectionGUID: E5xT6TtoQ6qhY0MEbgEIwQ==
X-CSE-MsgGUID: InLQNYjmSLySHFMf+AYfVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="7043673"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2026 21:59:09 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 4 Nov 2026 21:59:09 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 4 Nov 2026 21:59:09 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.49) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 4 Nov 2026 21:59:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=srP36dW3wrhBIRM5T6Gi2eXkTZFUjzXEqobP1DzbwIlwNEz3toJRMpZoe1EbMBGdlbu388WxuDUcBKKQn/HGncUgsRx1Jzk6lzXatgQvkPYScPJ8S6GlMPFf+YBEcM/xk8fGZjfMSX++FCMM2HP7bdPs1u32rv6DBl5RE0wEJ1eSMwK+lhQI50ZoETtDKMwDiyUbMKJ7T/W4RC5oz8TOKJTDLKUr7bEA6z2C5bLPV6YD4MilKm1Nf0ukOru3bKNFgN8cY/HNroO/XHcABq8PXV5McMUMvxNuLIULbH2lmXZi7P1CO+sh8c/9jZKBA8t4MKhfDKYl2vqeIW7j3XWypw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Za2O3IvZSn0Q22ayrWbuXg6g9xuMitMSOKvllRsvCa0=;
 b=kO4QKIi3sfGrD+m0g+s+iFCkaLtlqZBindCakI9sNNBMMmtzVjLxz0/htyaZODQTmOCRA2MU6MNgs74j1vvvToy1MwJwoRvQpSDQJZw+KwVDYaAuwIftAmWhK9OOcar7W97gUXAVxBa7Oe4GKF8q5d1zagNkeLFN2w4anNuWYxxm0p1Jza5lnOEkXhLZ8caTUJY4t+Gz9b0jGSJhL/YqPYKAfS/193OrvmScJV/XY8UwBxDbGg4Qu9mC/7HND78EbxmRS4MonndpKmeuzZesL3CN27yyJb8lYyB6RWpAmbkVjBsv4RJq3Gnx2y7G+KKtSsg2AZIxz86MpbUOPcpwXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS6PR11MB087165.namprd11.prod.outlook.com (2603:10b6:8:4c4::7)
 by LV0PR11MB068984.namprd11.prod.outlook.com (2603:10b6:408:3ed::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Thu, 5 Nov
 2026 05:59:02 +0000
Received: from DS6PR11MB087165.namprd11.prod.outlook.com
 ([fe80::4223:7b03:1329:265f]) by DS6PR11MB087165.namprd11.prod.outlook.com
 ([fe80::4223:7b03:1329:265f%5]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 05:59:00 +0000
Message-ID: <1750b7b2-cc7b-4018-9a4d-9caac9dc11bd@intel.com>
Date: Thu, 5 Nov 2026 11:28:51 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/9] drm/xe/hwmon: initialize fan-control backend and
 table cache
To: Karthik Poosa <karthik.poosa@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <rodrigo.vivi@intel.com>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <sk.anirban@intel.com>, <mallesh.koujalagi@intel.com>,
 <ravi.kishore.koppuravuri@intel.com>
References: <20261015190751.1268916-1-karthik.poosa@intel.com>
 <20261015190751.1268916-2-karthik.poosa@intel.com>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <20261015190751.1268916-2-karthik.poosa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0258.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f1::6) To DS6PR11MB087165.namprd11.prod.outlook.com
 (2603:10b6:8:4c4::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS6PR11MB087165:EE_|LV0PR11MB068984:EE_
X-MS-Office365-Filtering-Correlation-Id: dab857f3-5fbf-46d4-0251-08df3b01e350
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|261021121427099003|261021123027099003|261022075727099003|261022105027099003|261022113327099003|261009223027099003|4143699003|261026121527099003|261026140227099003|261028144727099003|11063799006|261102123227099003|18002099003|22082099003|6133799003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: GzpngMHoJuIJug/tyBvye85BnC32wKZkRVGAcHnhP1gZN4NZLgXd9gahEnY78BBxe7Ym30KiMo8m6p9Odugbk7+lST8ja1LShQVCuKwG8q09ZGOG2RyiNrdEuUc7Ne8k8zuMJmnOnL8WgbjkU497uLgchlOWsVVH5HuTaLAt8yYFhh6SwfZGUuRTs9JrAUDngmoHAkeBeG/X7nJObKveot1oSYGttw2iBr/CEBOUYOhxzSLSsvu05uQXgM7DY3f4uhENm+HXLDxnXo3uR9dDm2DZrwj82tONAft59I8YVCVJgFbwnK0NwNXYykSRP6t/gOVs/x2T7Jf68F1E05tak1uMu0JMngMALJ7DSemJKyvlOHxbGyGHafnGA+T8jG88O3YoUSK4qrkV8Knvi65bX/WKvQuUVh47m2prRDxRu5om+ZP8x5BqX1i6mORWns5voPiXxR1k7We77HN1OS/wnEq6voI1XLusj8fnXGWb3TfXv/mJHbZv8x904WyqvlQInq53en85oZQbK6UYyl+wOfhT1p9fr93UmofTWZoe5iEJ6y2TRBnfv9Vcbw0YKba0k0O0+8u/7B8Qhy94enTF2tjOxJOx7tsV06XAWhFnE36fpVlC+6GgICalutWrXOAISnPUk90u0kiTj6UyF1UtlYZz8r8/hTYRGuIxrroyP28=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS6PR11MB087165.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(261021121427099003)(261021123027099003)(261022075727099003)(261022105027099003)(261022113327099003)(261009223027099003)(4143699003)(261026121527099003)(261026140227099003)(261028144727099003)(11063799006)(261102123227099003)(18002099003)(22082099003)(6133799003)(56012099006)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K2d5R1VGemF1UDUySUlnc0N4bHFLOXFGZlZsbjF0ckc0Nk9qdFNuT1JRbStE?=
 =?utf-8?B?MUNUV2t1RnpGU2k2eG9xUmk1N3RucU5URzIxV0dQUG96Wlh0S2VHejkyQWVH?=
 =?utf-8?B?bVoraW1HampFSER2RStKQXB0QUNSTVFPNUs3Y3I4WTNKeHJGYkMrQ0RqZXJI?=
 =?utf-8?B?VS9QVGUxK01GMXJkZjRFRGpHUHR2ZVRWZ0U5L1dBeTVNYVJUMmllcUpjUjFH?=
 =?utf-8?B?ZklXeEFCcUlVdFF5aVUvVmtXOE5PcmdUbmhBRG1NbTdvYi91Y3A1ZnJxZXdx?=
 =?utf-8?B?RWtnNzZsa3B6Qk5Sd2NMRnRPZ0JoOEt6V1g1VlVZc3RKWU5DaUZtdmxrc2hh?=
 =?utf-8?B?ZTlFc2xYVWs4SEM4ekhyNE9HZUIzeEZ6TlJxRnlHenUyTmdBNUNER0hmUnAw?=
 =?utf-8?B?eWE0cW56U3UwL2w4OFNmS1pHUTdDTFNjenFRM3dZZjd5dk9GT0ErQnVCSTZY?=
 =?utf-8?B?dDVWYVBpVFRKRUI1bmlENVVRUlp2bVQxejE0S0NJRTBRSVpFYklPMExSSktr?=
 =?utf-8?B?QUM4ODYyMzB2R0svTXQ1bGx5ejljTWRZNzBjV1c1U0hNbmdUdDN6aXdWUXRX?=
 =?utf-8?B?VmwrdzNKU3U3dlpEK3JoNjhWb05PeDdtbEJEdmNxQVhvZlFVd1J4dEsyVmVU?=
 =?utf-8?B?eGtRVVNJR20wOFRldzdreVh2Q0dRWGhDRG1SaldhYWVIRzZZT1prZU9jZGJS?=
 =?utf-8?B?NHE5UUtyK2QweUE3VE45azV1N0h0M2NVMERYb1pNRHMwaXNEWE9BZFdTRVlS?=
 =?utf-8?B?bG1JbmtzRkN0WGJTNWoxV1dibUNOOFpUNWJ5ZFNrbXhReGRoQk9lV0JLUS9L?=
 =?utf-8?B?WkI3VVhRbUljT0V0MVJ0cjFEbVJPOE5lYmIxM0xMQ2x4cnc0S2RWYnNlV0Yx?=
 =?utf-8?B?YXE1NlIrUnlvdDQxL3E3U29UY2ZwU1Ztc1dDOVJ2aVF0dFhnNDFndlVya3N1?=
 =?utf-8?B?RnhMNXRWUkdiNndmYVdtRHNsVVkvUllkY251YllsQzZJVjV2M1lscTRTUWRJ?=
 =?utf-8?B?SDcxdmg0OE9qZWUxdXBNb3FlZTl2NnhLaGZmVDlXK0dod2dCWWV6cjN1Y3FH?=
 =?utf-8?B?a1NRbVJUbUwyNUhjd2NjRkpwVE1tdm00WmVZUE9RdEVTVTNmWis0TFJaL214?=
 =?utf-8?B?aTUwYlhQNm5oeWRTRWNBbFlDdUxFQ1lVYkVUOW9ZY3NXV1VtK1VDbzFqMmN4?=
 =?utf-8?B?OVdLU2t1V3RVOENBR1VnUE1HQ2tCbTBTVXZhV1l2cm5VOVBGTTlNMkVQdzhP?=
 =?utf-8?B?ZytIeDdqM0p0UW5NdTFhUTFzT041dDh0Z0xJUTJjNTJhMytuTmVhVENRcHlI?=
 =?utf-8?B?MFBCZW50akJTN0EwazBHTDlpSTl2UlN3L1ZnT0JrNWdBTjFucmdJZkZZdDQ3?=
 =?utf-8?B?RDQ2MUlJR3hOaHRuejFSTmJneEFnaWxGTk1uNXJrVTIxRHBVc0hNYkhMSGc3?=
 =?utf-8?B?Z2JlZW4yNy9zbElEZldpOC9BYmRtdjkwSmZySU9ROUR4N281QmJUTHBmYVFM?=
 =?utf-8?B?bjZreEdoZ0RkOFp2ZGdSOVdwMEwyZ3VsZWExOVB1N0xhYk5tMVZxT1lLc01p?=
 =?utf-8?B?Z0IyOUV5UHlUaG1LTkVCMDdZQmVBblJSaDYyRVJReEF2YVNJSDNSQzF0R1ZU?=
 =?utf-8?B?TXl6ck10TWxLZWMrRzh2aVV4bk5uQ1hjcEtOcTNTQjBuU3FTdjdJVEtyQkJG?=
 =?utf-8?B?UnU4aUl1M1loSHRpUWFEMWphblVoQzh6KzI5ZVdWM2EzN0NTby9ZRlA5RURk?=
 =?utf-8?B?MFpJR0hNNmJJVmRpQU9ydHhzaTNUemdaZDg4VEl5cUtTREtUdTZ1UW5FWkxT?=
 =?utf-8?B?ZUJYM3FYWFM2anpzMFVpMU1selRZZVc4UVNXeHJLS0VseVlBbEVxd0N2RE4x?=
 =?utf-8?B?V3VSaHZvQ0psYUpESmxoWkhHZ0FmaGN6dnVWZWlGTkp0cUNBb2FKRmdFdktu?=
 =?utf-8?B?MzNQWktmN3lsQ0dZdUlkSzFKVkE1aytYeTF2Ti9OTGpNblp0RzdhaU50UmYz?=
 =?utf-8?B?bUw4SndCOTE0L1VnVkJpL3owL21oZjk4NERJbG5WVmVnNmJKQXM5dW1IVnhI?=
 =?utf-8?B?anRNMTB2c2w1UUJTc1JrSFJmV0h5YU9CQXExSHREWlJhRkN1Z1c4elVHVFhX?=
 =?utf-8?B?VnMrVU1wa3JtUkgxdThDMTFOU29sNHUzS3l0WjhidFlrK2kzcDIvbitzeER1?=
 =?utf-8?B?SVVqZ3NpaE9MQ0M3UTBaWm1wUGZqVVNkYmdiNEZTUVNIVmJERW9xSFJOZlJo?=
 =?utf-8?B?cWpwakxJM0xVcUJaZkwxeEtmQk5iZ29ZRnk3dEgvR21MZk5CcG9kYmlNOXdN?=
 =?utf-8?B?bnB6SWUyUlpsZGpnazZyK05iVXhjNTNnSzNSZWM2ZGpzbDNEUnF3ZDhjVXFL?=
 =?utf-8?Q?4tSqP2ZjqkUsO6MQ=3D?=
X-Exchange-RoutingPolicyChecked: F1MP9QAFmBz+VXSQc2R1QzZ2iQ3eJPmUYY9eZ4KIz2dLK6gYkLAq+4dDfvHDJsJxV1yw1g6sCvVTtk5luNn+TjOQidqkExbZvdf3VQCxKnzOd9Q0QNanxeu+1DLEJjt3TnVvOYiNi/PPY+YYqg9JBmm6zY8Wb81Pj5rg9U5AEhkpPjyTU7R9Xf3xkmTACN0A6ZI8tr7MVa0B4jvxyPb489bQfQivw0tNegET2sGz9JCxF3Fqcm0Xavk5ablyVeclM/VB0a+lDwNzG0jzUFiHZ1MClgWF1JedKivZbN/a7PJIr60okMZ8x4rkkx4133uD2eHqnNoynzsArCnEvIxTZw==
X-MS-Exchange-CrossTenant-Network-Message-Id: dab857f3-5fbf-46d4-0251-08df3b01e350
X-MS-Exchange-CrossTenant-AuthSource: DS6PR11MB087165.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 05:59:00.5562 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DUsdV4q+n8MbSd444xrKHOTo5utVcteXvpRhVHpngttcEiUAsDxyJPTodmaZOG0pD1Qhr8RkgTeQL9zWkBUjJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR11MB068984
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Karthik,
On top of the previous comments kindly also address these:

On 16-10-2026 00:37, Karthik Poosa wrote:
> Initialize Xe hwmon fan-control support by detecting fan count,
> reading stock fan control points and min PWM.
>
> v2:
>   - Avoid user table initialization during probe. (Badal)
>   - Move unused code to appropriate patches.
>   - Use xe helpers for dmesg logs.
>
> v3:
>   - Rebase.
>   - Refine a few debug log messages and comments.
>   - Update xe_hwmon_read_fan_control_info() to return on any stock table
>     read failures.
>   - Avoid returning when num_fans is 0 in
>     xe_hwmon_get_preregistration_info(), ensuring thermal mailbox
>     initialization is not skipped.
>   - Remove XE_PCODE_FAN_CONTROL_TIMEOUT_MS which is unncessary as default
>     timeout itself is now 10ms.
>   - Use xe_pcode_read() instead of xe_pcode_read_timeout().
>   - Rename fan_control_point_count to point_count in struct fan_table.
>   - Resolve kgdoc warnings.
>   - Add valid check for stock table fan point count.
>   - Use the fan-enable bitmap reported by FSC_READ_NUM_FANS when enumerating
>     fans. This avoids assuming contiguous fan indices and allows masks with
>     gaps to be represented correctly in the hwmon interface.
>
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> Assisted-by: LLM
> ---
>   drivers/gpu/drm/xe/xe_hwmon.c     | 167 +++++++++++++++++++++++++++---
>   drivers/gpu/drm/xe/xe_pcode_api.h |   5 +
>   2 files changed, 157 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 42acfeb8818c..f2bd20f8b0a2 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -21,6 +21,7 @@
>   #include "xe_pcode_api.h"
>   #include "xe_sriov.h"
>   #include "xe_pm.h"
> +#include "xe_printk.h"
>   #include "xe_vsec.h"
>   #include "regs/xe_pmt.h"
>   
> @@ -137,14 +138,51 @@ struct xe_hwmon_energy_info {
>   	long accum_energy;
>   };
>   
> +enum fan_table_type {
> +	/** @STOCK_FAN_TABLE: firmware-provided fan table */
> +	STOCK_FAN_TABLE,
> +	/** @USER_FAN_TABLE: user fan table written through sysfs */
> +	USER_FAN_TABLE,
> +	/** @FAN_TABLE_MAX: number of fan tables tracked per fan */
> +	FAN_TABLE_MAX,
> +};
> +
> +/* Check if a fan is enabled based on the fan_enable_mask got from FSC_READ_NUM_FANS. */
> +#define IS_FAN_ENABLED(fan) (hwmon->fan_enable_mask & BIT(fan))
> +
> +/* Maximum number of fan control points supported by each fan. */
> +#define MAX_FAN_CONTROL_POINTS	(10)
Why within parentheses?
> +
> +/* Fan control point index: bit31 selects fan table type; bits30:0 control point index. */
> +#define FCP_INDEX(FAN_TABLE_TYPE, POINT_NUM) (((FAN_TABLE_TYPE) << 31) | \
Nit: use lowercase macro args.
> +						((POINT_NUM) & REG_GENMASK(30, 0)))
Should GENMASK be use here ?
> +
>   /**
> - * struct xe_hwmon_fan_info - to cache previous fan reading
> + * struct xe_hwmon_fan_info - cached fan telemetry and control state
> + *
> + * Each fan keeps the latest tachometer sampling state along with two fan
> + * tables: the stock table discovered from firmware and the user table managed
> + * by hwmon sysfs writes.
>    */
>   struct xe_hwmon_fan_info {
>   	/** @reg_val_prev: previous fan reg val */
>   	u32 reg_val_prev;
>   	/** @time_prev: previous timestamp */
>   	u64 time_prev;
> +	/** @fan_table: fan control tables */
> +	struct fan_table {
> +		/** @point_count: number of fan control points */
> +		u8 point_count;
> +		/** @fcp: array of fan control points */
> +		struct fan_control_point {
> +			/** @temp: temperature in degree celsius */
> +			u8 temp;
> +			/** @speed: fan speed in percentage */
> +			u8 speed;
> +		} fcp[MAX_FAN_CONTROL_POINTS];
> +	} fan_table[FAN_TABLE_MAX];
> +	/** @min_pwm: minimum fan PWM */
> +	u32 min_pwm;
>   };
>   
>   /**
> @@ -193,6 +231,8 @@ struct xe_hwmon {
>   	int scl_shift_time;
>   	/** @ei: Energy info for energyN_input */
>   	struct xe_hwmon_energy_info ei[CHANNEL_MAX];
> +	/** @fan_enable_mask: bitmask of available fans */
> +	u32 fan_enable_mask;
>   	/** @fi: Fan info for fanN_input */
>   	struct xe_hwmon_fan_info fi[FAN_MAX];
>   	/** @read_power_limit_from_pcode: pcode accepted power limits write for the channel */
> @@ -1075,17 +1115,112 @@ static int xe_hwmon_pcode_write_i1(const struct xe_hwmon *hwmon, u32 uval)
>   			      (uval & POWER_SETUP_I1_DATA_MASK));
>   }
>   
> -static int xe_hwmon_pcode_read_fan_control(const struct xe_hwmon *hwmon, u32 subcmd, u32 *uval)
> +static int xe_hwmon_pcode_read_fan_control(const struct xe_hwmon *hwmon, u32 subcmd, u8 fan_num,
> +					   u32 *uval)
>   {
>   	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
> +	return xe_pcode_read(root_tile, PCODE_MBOX(FAN_SPEED_CONTROL, subcmd, fan_num),
> +				     uval, NULL);
> +}
> +
> +static int xe_hwmon_get_fan_enable_mask(struct xe_hwmon *hwmon)
> +{
> +	int ret;
>   
>   	/* Platforms that don't return correct value */
> -	if (hwmon->xe->info.platform == XE_DG2 && subcmd == FSC_READ_NUM_FANS) {
> -		*uval = 2;
> +	if (hwmon->xe->info.platform == XE_DG2) {
> +		hwmon->fan_enable_mask = GENMASK(1, 0);
>   		return 0;
>   	}
>   
> -	return xe_pcode_read(root_tile, PCODE_MBOX(FAN_SPEED_CONTROL, subcmd, 0), uval, NULL);
> +	ret = xe_hwmon_pcode_read_fan_control(hwmon, FSC_READ_NUM_FANS, 0,
> +					      &hwmon->fan_enable_mask);
> +	if (ret) {
> +		xe_warn(hwmon->xe, "failed to read number of fans, ret=%d\n", ret);
> +		return ret;
> +	}
> +
> +	/* Check if fan mask exceeds FAN_MAX and log a warning if it does */
> +	if (hwmon->fan_enable_mask & ~GENMASK(FAN_MAX - 1, 0)) {
> +		xe_warn(hwmon->xe, "fan enable mask exceeds maximum supported fans\n");
> +		return -EINVAL;
> +	}
> +
> +	xe_info(hwmon->xe, "Number of fans detected: %u\n",
> +		hweight32(hwmon->fan_enable_mask));
Should be xe_dbg?
> +	return 0;
> +}
> +
> +static int xe_hwmon_read_fan_control_info(struct xe_hwmon *hwmon)
> +{
> +	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
> +	int point;
> +	int fan;
> +	int ret;
> +
> +	for (fan = 0; fan < FAN_MAX; fan++) {
> +		u32 stock_fcp_count = 0;
> +
> +		struct xe_hwmon_fan_info *fi = &hwmon->fi[fan];
Inverted xmas tree.
> +
> +		if (!IS_FAN_ENABLED(fan))
> +			continue;
> +
> +		ret = xe_hwmon_pcode_read_fan_control(hwmon,
> +						      FSC_READ_STOCK_FAN_CONTROL_POINTS,
> +						      fan, &stock_fcp_count);
> +		if (ret) {
> +			xe_err(hwmon->xe,
> +			       "failed to read fan %d stock table point count, ret=%d\n",
> +			       fan, ret);
> +			return ret;
> +		}
> +
> +		if (!stock_fcp_count || stock_fcp_count > MAX_FAN_CONTROL_POINTS) {
> +			xe_warn(hwmon->xe,
> +				"fan %d stock table point count %u is invalid\n",
> +				fan, stock_fcp_count);
> +			return -EINVAL;
> +		}
> +
> +		fi->fan_table[STOCK_FAN_TABLE].point_count = stock_fcp_count;
> +		xe_dbg(hwmon->xe, "fan %d stock table point count is %u\n", fan,
> +		       fi->fan_table[STOCK_FAN_TABLE].point_count);
> +
> +		/* Cache the stock fan table for later use. */
> +		for (point = 0; point < fi->fan_table[STOCK_FAN_TABLE].point_count;
> +		     point++) {
> +			u32 fcp = 0;
> +
> +			fcp = FCP_INDEX(STOCK_FAN_TABLE, point);
> +			ret = xe_pcode_read(root_tile, PCODE_MBOX(FAN_SPEED_CONTROL,
> +								  FSC_READ_FAN_TABLE, fan),
> +					    &fcp, NULL);
Can xe_hwmon_pcode_read_fan_control() be used here?
> +			if (ret) {
> +				xe_err(hwmon->xe, "failed to read fan %d stock point %d, ret=%d\n",
> +				       fan, point, ret);
> +				fi->fan_table[STOCK_FAN_TABLE].point_count = 0;
> +				return ret;
> +			}
> +
> +			fi->fan_table[STOCK_FAN_TABLE].fcp[point].temp =
> +						REG_FIELD_GET(FAN_CONTROL_POINT_TEMP_MASK, fcp);
> +			fi->fan_table[STOCK_FAN_TABLE].fcp[point].speed =
> +						REG_FIELD_GET(FAN_CONTROL_POINT_SPEED_MASK, fcp);
> +			xe_dbg(hwmon->xe, "fan %d stock point %d: temp %u C, speed %u\n",
> +			       fan, point, fi->fan_table[STOCK_FAN_TABLE].fcp[point].temp,
> +			       fi->fan_table[STOCK_FAN_TABLE].fcp[point].speed);
> +		}
> +
> +		/* Read minimum fan PWM */
> +		ret = xe_hwmon_pcode_read_fan_control(hwmon, FSC_READ_FAN_MIN_PWM, fan,
> +						      &fi->min_pwm);
> +		if (ret)
> +			xe_warn(hwmon->xe, "fan %d min pwm unavailable, ret=%d\n", fan, ret);
> +		else
> +			xe_dbg(hwmon->xe, "fan %d min PWM %u\n", fan, fi->min_pwm);
> +	}
> +	return 0;
>   }
>   
>   static int xe_hwmon_power_curr_crit_read(struct xe_hwmon *hwmon, int channel,
> @@ -1615,17 +1750,12 @@ xe_hwmon_energy_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
>   static umode_t
>   xe_hwmon_fan_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>   {
> -	u32 uval = 0;
> -
>   	if (!hwmon->xe->info.has_fan_control)
>   		return 0;
>   
>   	switch (attr) {
>   	case hwmon_fan_input:
> -		if (xe_hwmon_pcode_read_fan_control(hwmon, FSC_READ_NUM_FANS, &uval))
> -			return 0;
> -
> -		return channel < uval ? 0444 : 0;
> +		return IS_FAN_ENABLED(channel) ? 0444 : 0;
>   	default:
>   		return 0;
>   	}
> @@ -1858,11 +1988,18 @@ xe_hwmon_get_preregistration_info(struct xe_hwmon *hwmon)
>   		if (xe_hwmon_is_visible(hwmon, hwmon_energy, hwmon_energy_input, channel))
>   			xe_hwmon_energy_get(hwmon, channel, &energy);
>   
> -	/* Initialize 'struct xe_hwmon_fan_info' with initial fan register reading. */
> -	for (channel = 0; channel < FAN_MAX; channel++)
> -		if (xe_hwmon_is_visible(hwmon, hwmon_fan, hwmon_fan_input, channel))
> -			xe_hwmon_fan_input_read(hwmon, channel, &fan_speed);
> +	if (hwmon->xe->info.has_fan_control) {
> +		xe_hwmon_get_fan_enable_mask(hwmon);

Why the return value is dropped ?

Regards,
Soham
> +
> +		/* Initialize 'struct xe_hwmon_fan_info' with initial fan register reading. */
> +		for (channel = 0; channel < FAN_MAX; channel++)
> +			if (IS_FAN_ENABLED(channel))
> +				xe_hwmon_fan_input_read(hwmon, channel, &fan_speed);
>   
> +		/* Fan control tables initialization */
> +		if (xe_hwmon_read_fan_control_info(hwmon))
> +			xe_warn(hwmon->xe, "Fan control tables are not available\n");
> +	}
>   	return xe_hwmon_init_temp_info(hwmon);
>   }
>   
> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
> index 00c4fc7d0124..0349b24a8259 100644
> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
> @@ -83,6 +83,11 @@
>   
>   #define   FAN_SPEED_CONTROL			0x7D
>   #define     FSC_READ_NUM_FANS			0x4
> +#define     FSC_READ_STOCK_FAN_CONTROL_POINTS	0x5
> +#define     FSC_READ_FAN_TABLE			0x7
> +#define     FAN_CONTROL_POINT_TEMP_MASK		REG_GENMASK(7, 0)
> +#define     FAN_CONTROL_POINT_SPEED_MASK	REG_GENMASK(15, 8)
> +#define     FSC_READ_FAN_MIN_PWM		0x8
>   
>   #define PCODE_SCRATCH(x)		XE_REG(0x138320 + ((x) * 4))
>   /* PCODE_SCRATCH0 */
