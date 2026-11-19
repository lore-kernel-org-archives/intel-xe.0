Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7889606A325
	for <intel-xe@archiver.kernel.org>; Thu, 19 Nov 2026 17:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HE1wmw4j;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=CTpiaVZt
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97A4110E062;
	Thu, 19 Nov 2026 17:54:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B35B10E062;
 Thu, 19 Nov 2026 17:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795110842; x=1826646842;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uhUa4PzxEyKhnu3ESsRqAFEcs7Qu77qQYOvN/Tnpr1g=;
 b=HE1wmw4jdSLhc1A7a7WZtylDaTOvjgGN1mxNllgVhPsI9GlgOTzfa7an
 Gnj6qZscjcV/o2D/AoMo9SxTO1cvm/7tLtdIJEPnfhg3xefcOSC+XZK0A
 7nY/ZYxZQ17REAWnUqhOow/t+AglGh9a8D8WVkUwfi9aZBG9CDrPZ3Beb
 sU/eflB0XTP74O3hPrRtzWGw36JlTOiFSYEmtc6cOEAuq8kkMIknVJyjt
 dCSWrz9hRHx37QVkmfspw1WXvkY4kUotZsqApYmOq1+4kNrzL9hPnWK8P
 37RD8uM5kJF8aTAK1+QG0wGQWGLoIgLtYlfw5U0GYQbhF99Uzw9Sfbvnj w==;
X-CSE-ConnectionGUID: 7g7eEDbmQ1WEPWGWGV6t/g==
X-CSE-MsgGUID: QZG1He84RsyPDD6ViHl+gQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3871568"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3871568"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 09:54:01 -0800
X-CSE-ConnectionGUID: fsK1MEkPSfKk756R+ewsZw==
X-CSE-MsgGUID: /VI28fxRRWWfxFNxh0FOxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; d="scan'208";a="10702684"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 09:54:01 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 09:54:00 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 19 Nov 2026 09:54:00 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.44) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 09:54:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lll6UDw/sMJ13B6HDgfgdlpXB0Bb4UitjbjiX95nxM5zuRR7jianpl/Atv2G8z5yMEPDJ75OmogSeb/W88cHyKZCDba0ybSa1Jh10EZOGDszDpccgh0EIHWNNMKcMexw3lEynFalZHQwJ9Ow+sJbZkZc7wnd/M5iu4JvOYueqDCaQ50aDLhQ1HLzmkhuugaCAeVWcz2oOWQE6SUwDZJWofp+fKWCZRaqX10mrpFRx7FldQngt5ExX7I7+aPy3A7Ay53BE9oktUhCBjluwwpWI4jhJ8qrktjC309fCkClP5LOXx9CD5hsZMqeE1S4/k8NC63A5eNY1VQu2ZeJbO/zIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+pJOdUcP8YozZ820OoScATqEWAo3pDos6p/7lPrB0Oc=;
 b=dTs4myM7JY0ugjMZ4DRWZy9TwTtytiMdrdJ2N29tXcM8UnTf6S8VVgw1uFA2BVSkSLseb4L9NaUlzHxNYX2EMQHPhR5lShTi7gIkwjoZHl/wNTaiJS91AcLOQfGZPe836B01l95oSFYhMCQAXgF1AaOZYXGRLRpddBp2mdJBn9onjTj0zXO+4ReVjv6+tMrmy/iyvTqTN+u3wpyGuuJG+N0EtEGIhgrPR+P8rJYOzfVq0IqxHbLVD1IXIspVHoYMV52Dxn2BnMkwXxziSoatU84k1jerccrHU6l9mGsHujzJjaVGv9AWtCy0KEUCIdiQQ2l5vDW0xDiUaPZascG+aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+pJOdUcP8YozZ820OoScATqEWAo3pDos6p/7lPrB0Oc=;
 b=CTpiaVZtkTr9oWkf5fYod+XPqixIe2lZN3aElg5TGDqcg14wMQEIuMM76qi+Kkub+d1hicSB+XLSjiyEkfurvSzKXC7UnjgDZm53AsUtBOJfpUHRyahmm+utYC3nr4NvQL+zeFyLD6s6JbEkTsQNCx1F4YmldUHoHYg3o+k0Nbk=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LY0PR11MB357627.namprd11.prod.outlook.com
 (2603:10b6:404:21a::11) by CO1PR11MB5139.namprd11.prod.outlook.com
 (2603:10b6:303:95::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Thu, 19 Nov
 2026 17:53:58 +0000
Received: from LY0PR11MB357627.namprd11.prod.outlook.com
 ([fe80::71fd:d139:945b:a71c]) by LY0PR11MB357627.namprd11.prod.outlook.com
 ([fe80::71fd:d139:945b:a71c%5]) with mapi id 15.21.0639.011; Thu, 19 Nov 2026
 17:53:58 +0000
Message-ID: <13c43f50-6e95-4eba-8ffa-5649280d6798@intel.com>
Date: Thu, 19 Nov 2026 23:23:50 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/2] drm/i915/color: 3D LUT fixes
To: Matthew Schwartz <matthew.schwartz@linux.dev>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
CC: <uma.shankar@intel.com>
References: <20261118191514.2931270-1-matthew.schwartz@linux.dev>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20261118191514.2931270-1-matthew.schwartz@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0353.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:219::18) To LY0PR11MB357627.namprd11.prod.outlook.com
 (2603:10b6:404:21a::11)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LY0PR11MB357627:EE_|CO1PR11MB5139:EE_
X-MS-Office365-Filtering-Correlation-Id: 21f651b6-8c10-42c6-0e16-08df4666161a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|261026121527099003|261026140227099003|261021121427099003|261021123027099003|261022105027099003|261028144727099003|261102123227099003|11063799006|5023799004|56012099006|10067099003|18002099003|22082099003|261009223027099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: IwtMc9a3+Zag0Fpc0b1g27kWUHjJgLMU6tiQYhhrz4eYD3jP/Ic+LhPXiQDHrCQqJ2vfOxyCldHLZDNGL2WxqhAcMuvl/Vy479PWeL0u1OMCzrQnoujI40JQtN8eX2GQNmPgOwHy5MvzFd9qhFsjzPka8dRgr6uFYhtjIxYxlIlHkh6yBxQrjcetmWU8aWksfdowsT3Q7MRqa5ax7MF8XVbh+YXi1TI9y6cSEs4kHwjii6KrrvP/PslTnSyjjYmk4vH1vORmq5ibdudP9LApPzvKcBDBVRWLIPhQ4COlio+xOUpos2VwfHNKfJFTuYu9bV3SQ9f2B9HBwJ4JvAk+aOnlXF7G0NHetj1JSditFvJ0NxLBgoBoLfWnuLqstVB6wum9bjBjb7B4cKNHN6o4O3dx52Xsq3BUJ66vugU9uO71/GMfegKwmb0Q8q86u6xw735hSO7jmcppZwqp4RVEJAMLRRxkd20D65mGAgMuG1QSJiM4IeueM/05gA5/5dntC7/sDoiq4xF5pciTGGy0x9elRWKcKAs0t4LQLmIhI987IP4tcmH9vxA7y+eXolQy2UDA2+N/+uXUUkLIFmShaNM/8XY5ar3ItG8lh8ytOAycbv5oy68BkpnCBKmsHlWF
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LY0PR11MB357627.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(261026121527099003)(261026140227099003)(261021121427099003)(261021123027099003)(261022105027099003)(261028144727099003)(261102123227099003)(11063799006)(5023799004)(56012099006)(10067099003)(18002099003)(22082099003)(261009223027099003)(6133799003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RDhxZUxTdlcxOWFQblVwalFUbTZNOFUwc3U5b2l5ZGI2bWdESVgzNElXMEVQ?=
 =?utf-8?B?QVU5azZjeWhVcGN6bjBGUkJlS2J3cUswZ3E2UW90OGQwTmx6ZGtpSXFEU21p?=
 =?utf-8?B?NnJmc3ZqWklleTlrV2pEeWpCMWsyQTVWNkZ3dXFvK2c5U0IweHh1ZDZka1JG?=
 =?utf-8?B?MmdYL2tmUHBWa0FrNWtQMTVGTjFWUFErQ2V2Wk83K1hxc0NBZFI3T2FnKzZv?=
 =?utf-8?B?emZ3VmMwdnZ1UXh0aUxQVGExb1RwZ01vZXNlVWo3VkhGU1g4dFdpVVo2M29v?=
 =?utf-8?B?dWV4VWVDaDNlSExia1U5WnJlbGh3K3h5N0lGdWE4ZFBoU3phWlRKMkk0cFNC?=
 =?utf-8?B?MmZoZEorZmxqa1plc1ZsdWNuLzg5NDBuaEpRbVkyOXJ1WlI3cDcxOGtjamsr?=
 =?utf-8?B?U1d2SFNzUHR0cXV5anFLUzkwT29DUDFmMkMxcmFxbEE4dXhOVzRlTy9ueDla?=
 =?utf-8?B?aUVlRzVTYWZkVXJEd1prc0Z3TjlOOHJHVEJobkNYT3FRczlMTGpQM0RyRDI2?=
 =?utf-8?B?WVhhU3RqTkl6L3IvcE5wMEptY0YzZGdzZGd6Q1JEMXduQis1b0RwQVJ6cFdS?=
 =?utf-8?B?SHB1RFE1QUtoOUhJaTdYZ3EyTzNKRFBOanBRQ3N2YkYyUkdYMEp4VjhLTTlO?=
 =?utf-8?B?Z1BMV004ank4bGFwQSthajJoUWluS3RVL3NTVlVHUVMyK254Q0t6S21OcEpy?=
 =?utf-8?B?a2xkdjFoWGVVQW5sMjZiU0diellBRFdacDFFenkxOHlNQ1M4Q0pKbmpMVk1n?=
 =?utf-8?B?cWw1Y0NWY3pDM3Q3VGpEcXpidFZvbTVveW1BMERFaWFIeVQ0NlpDZm1ONW84?=
 =?utf-8?B?UnRsUUtOekhWbGNRbHlYOWZrOUdFZE1xMmt4OGRBa3RQVEJHVFZEOUZPODh2?=
 =?utf-8?B?dlVuWjljbTB3RHdvWVhSNmhIeG5aemhHbFR6N0k4RGRJazNIVDF2TmFuS1dp?=
 =?utf-8?B?ZmNmQ2ZiQUZ1US8za2hRU1lwTGFOQ1FOcHVOMllrSk5TcVNieDZib0kxcXdH?=
 =?utf-8?B?YlNBOXlqUGVFNXYwbFJpclVGTUZyV2pxMy9GaTJHTTdUc2xJMTdmZWZwQ0Rh?=
 =?utf-8?B?VDVGQ1U4L09CTENjK0pQK0VhOHU3em16anFybzdlOElSbUFUcHh4bXF2YWVV?=
 =?utf-8?B?ei9iUXYrRk1ISkphblBLV1JEZXBOTWlJMjdwM0d2R2t4cjJZWkZvM3JHV21i?=
 =?utf-8?B?VDBoUzliNnFYRFZydVVHaVIrZytyQjQ3cXM1ekVpMjFETzZiZm9BSm5acUNm?=
 =?utf-8?B?RUp4YUdVV1dUVnJId0JjQk9jL1VBM0g5K3U1YVhNUERPYkZuL3BJcEZ5L29a?=
 =?utf-8?B?a2w3Tk11TGdXT0JRS2oyQjUrZFMwdjd6dWJJYmFLTnVzTzNQU3FKQnNjMDYr?=
 =?utf-8?B?VlBabnR3QnlydVgxb1Q0U3l4ZURKcXgwSjFxbFJ0MW9PUUR5NUZCRVBtY1BF?=
 =?utf-8?B?RWZXUVp3SDZVYVpXTzRWSjc1RDhRRytMRFM0cUJTV2tnMlhaby9aMW9ZaEM3?=
 =?utf-8?B?c2ptVVNaWXUvdW41akw3UGh0dmttMEp2K3ZmeG1ERFRCa0c5TXdFNW9GRDZU?=
 =?utf-8?B?YWVycGRyQklWZmc0eW1GcXdrdzVPeDgyai9EQW1WRUVPMnlCVHpWZlVQWTJq?=
 =?utf-8?B?bWVJbFpXcFhoOWVubE5tNkpVSU5uWVpVTzBMNFFzRVpHdUtVWXhOODkxUUtO?=
 =?utf-8?B?S1BjWS80SHNBWEFsb2VhSUtMaUlneHpFSTFORHN1WUtkZWkwdEd6V0d4eVdC?=
 =?utf-8?B?S05yOENTdi96bytmaUFmanNnNERGVU5uNUZ0TkRCODFFS0JXb0hnWHhrR09i?=
 =?utf-8?B?NnU4L2JocE4xNnlsVE9KbmhqUDlFQ3pLdVVzWXFlZE5JcVlTYi9JQ2tGRGtN?=
 =?utf-8?B?M1JscUtTZ05ZL1ZXajlKVXF0em0zb2Q0RmtFTWV6ZENEQXovbm1wQVBVSjkx?=
 =?utf-8?B?Qi9jMXNBWGlDdk5UTG5wTGo5ak9rc1NrQ080RmROdjVyZExSc3pCR2d2bTZ5?=
 =?utf-8?B?eS9sTHhjWEgzVTdEemlMT0xVRC9LTExCYVVvdVN4T2hGem1HK054Y2pEeE42?=
 =?utf-8?B?Tk1MMHRaNGZUcnFtTlRuZ3NYdXJWa3RIdUlpZlVyakVKOUprTll2SERoTkEw?=
 =?utf-8?B?cG1XWmU5SHA3blJkWHVMdHhTc0F1RlJFc0IwYUh5TkNnMUREYU0vSlZjS0dS?=
 =?utf-8?B?dUZyZUVuVEtjMVBQbFVlNXUrRkhqNDY3K1QyNS9OWElxdkF3ZWVxMXNYRm1F?=
 =?utf-8?B?Mit5ZE1YYlJGZEtueGxLOEQxaEdYK1BCaStPMExJQ0N0bGRpSlk5SFh2YWEr?=
 =?utf-8?B?RVZFUFJSMUtKWGJVMTVnQThNNmd0RTRwV0czMUJLcVhSQ2dtVkpQTFBzb0Mx?=
 =?utf-8?Q?ofMcS9DB1xmw20EcVTrQWtHuP0tnbCw6uSVVq?=
X-Exchange-RoutingPolicyChecked: Q/u69Wu+RpcqnICMm4rG3RO8LeMnJ8u4Skf5isd4hF1fCq0dd8eVVYuIF1JGLfnvV7kVYMmr1aDVf3LfT6Nww4NUWGTCvu7vB1XfHLWgReoiIZ4Mm54rtRcuuRyJCoO8nfKMG1SO0MTfoXt5GC/aJsheV2BzCeZ5ZP6S664qRuSz5ayEuXWcupjNgYVWtmLWskdQHfPnsDKz7zVe3/+1a6Ib5NpszU27kRWa8udgLnkVFjUtxAyrxKuKWaPjr4hz1wHCB7T9O6+1dGMa1khWtea83SSUC9ZSWf3Hp+jVpTXrVWIB0CdwY/kJpkgMBjiIF71+FZKZd9n+2dTOJGFhZg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 21f651b6-8c10-42c6-0e16-08df4666161a
X-MS-Exchange-CrossTenant-AuthSource: LY0PR11MB357627.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 17:53:58.4632 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lRejf5ohzoQrfnl3S8KBOVxISkpYz2VSwAB8TdhWaNOmt+QJ4TK2M+wuZ4MZIBaQsIg3cy/j9PDkitu4OcO2hTrgfq0v3kJLggAutyg58x8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5139
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
X-Spam-Status: No, score=-22.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello Matthew,

Thanks for the fixes! Not great that the entry order slipped past us,
so thanks for digging into it.

On 11/19/2026 12:45 AM, Matthew Schwartz wrote:
> Two fixes for the 3D LUT support that came with the plane color
> pipeline. I ran into both while bringing up the pipe-bound 3D LUT on
> Lunar Lake for gamescope, using out-of-tree patches that expose it
> through the CRTC color pipeline proposed in [1].
> 
> Patch 1 stops planes that do not own the 3D LUT from rewriting
> LUT_3D_CTL. On Lunar Lake an enable bit set by hand is cleared by the
> next plane update. Reading the code, the same write from any
> non-primary plane on Xe3p_LPD disables the LUT the primary plane
> enabled.
> 

While testing this I found another bug in the same path. With joiner,
the secondary pipe's plane has no uapi.crtc (only its hw state is copied
from the primary pipe's plane), so intel_color_load_3dlut() and
intel_color_plane_commit_arm() skip it and the secondary pipe's 3D LUT
is never programmed. The part of the screen driven by the secondary
pipe ends up without the 3D LUT. I've sent a fix that switches both to
plane_state->hw.crtc:

  
https://lore.kernel.org/intel-xe/20261119165925.683691-1-chaitanya.kumar.borah@intel.com/T/#u

You could perhaps rebase on top of it.

> Patch 2 writes the table in the order the hardware reads it. The colorop
> blob has red as the fastest axis and the hardware has blue. I measured
> this on Lunar Lake only, with the LUT bound to the pipe, by writing
> LUT_3D_INDEX and LUT_3D_DATA from userspace and decoding the pipe CRC of
> solid color frames. I have no Nova Lake hardware, so the plane-bound
> case is unchecked. If the plane binding indexes the table differently
> this patch is wrong for it, and I would appreciate a pointer to what
> Bspec says about the entry order.
> 

Bspec 68894 documents the entry order (red as the outer loop, blue as
the inner one), which matches what you measured. Please add a reference
to it in the commit message, e.g. a "Bspec: 68894" tag.

I tested the series on Nova Lake with the plane-bound 3D LUT. Without
patch 2 a solid red band comes out blue and vice versa; with it the
output is correct. The existing 3D LUT test uses a constant table and
can't detect an ordering issue, so I wrote an IGT subtest that does:

  
https://github.com/ckborah/igt-sandbox/commit/04f17a3d3afbcb82967d7cc79405b187251254ae

I'll send it out as well.

With the Bspec reference added:
Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

==
Chaitanya

> [1] https://lore.kernel.org/all/20260716160556.227556-1-mwen@igalia.com/
> 
> Matthew Schwartz (2):
>    drm/i915/color: only let the owning plane program the 3D LUT
>    drm/i915/color: load the 3D LUT in the order the hardware indexes it
> 
>   drivers/gpu/drm/i915/display/intel_color.c    | 28 ++++++++++++++++---
>   drivers/gpu/drm/i915/display/intel_color.h    |  5 ++++
>   .../drm/i915/display/intel_color_pipeline.c   | 12 ++------
>   3 files changed, 31 insertions(+), 14 deletions(-)
> 
> 
> base-commit: fb078d17b966f7a24720b6e3a5de06d43c2e184a

