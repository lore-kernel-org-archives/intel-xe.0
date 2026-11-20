Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA40606A326
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 07:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QAWZS4+K;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=aZBbKv2C
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C33510E169;
	Fri, 20 Nov 2026 07:24:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 162FE10E169
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Nov 2026 07:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795159487; x=1826695487;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ZApADUue2UYHj2i2IArB84iXIMKVi1qB9/fYGfo2GRA=;
 b=QAWZS4+KD8yuEG9f5xVATJN3oKjVj1+5NFJ5CDt8ZVnXQICxFopmwC60
 yfjY3nHnc9nIWXgZOtvWKRMkXVmQsbGcdWRLGqMaIXAVo9Qbp2vhbTQoi
 zHMZwyde5g08wKKD7kH9hT4hQYxZOaWQxxZHWN0jR0cf7N/vInw/BifiH
 xAlQnfwLeNvN4XVayuZxnbClSqveLqRThEL2HHpa8bNa41br1kLLh7Q3V
 Ud/Ptsu5oYAHXScq1OIi54oP+DjbKHJpfiJMpih/7d51wNx2oGGLMH0TR
 tWP6DYn1T6Z7nmzSj4uveuUcw8Fzad4EhLx3xsEHyHkfwbf++zeK/DmN5 A==;
X-CSE-ConnectionGUID: 2djyHiahQVKvW8by3PkBAA==
X-CSE-MsgGUID: kC0EdzJuSGGd7u3uFk3eSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3930101"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="3930101"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 23:24:47 -0800
X-CSE-ConnectionGUID: Fl3/AlL4Tp6kok6zg9D/Ag==
X-CSE-MsgGUID: a4Isx0qzQBCgF+tA47T8vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; d="scan'208";a="10531603"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 23:24:47 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 23:24:46 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 19 Nov 2026 23:24:46 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.48) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 23:24:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M4ex9JrmxNMwZPS27aA1Et4l4zb7lRMnYHsA2Mz6wWLY6AjqhZMB4HWAlx6bgCOgiq/NOLBspeEzXgneSPNaWCqQxTiORN+iYCxUEvbXhU5ScKEgKvAqgP00zzZkjxjmHhAfWqjtgOTky3lHaMxz3IcQxnNnzYLMhs1g38X8bSv0pmbewb2fczQzUeS2Je7iAlimdxvojPsmiROXRDgdRkPxUWy3GYVzk2rvyoTVRuTK6g5c0bxU+nU8CjIQFhXbnRqsg8SznwBlgvc9mntjBzYndTAXJKCY9awtrf/IxV9MvA9oqxvTawe6NW0XAyrVkUdvEFTQc9x7SxYEqZCPCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pJdC01M0Nbjz9EueS6r8XqmDEJPU3ANzL4fxvnlYnNA=;
 b=QQ0lUo44YAScgdHv9iq6kF1RzNWZ0mrcQ5Q++08A+FwP708qZwP9hFjtc/MVweOM9UPi2jE3WF+4JHjI+Oa7vTrh5QBQOcsn2+BrCO/BTWAy7bZiRJxu+l2BRth2kenx0TnU7nZUgF/32nDBGFlWu4CZOLJd+n/+cS2uORLuaYQVORHxR/a5xBJC7IAZYQMj/g2uDdoIoSRu0PPoYlqCN4xV823Y15TuKjGgHolngROaD7GiqUkAdQ9EIo45rvFza6pGOTd9USJM9NtwkWvh5zPOYpzN7FesEujlqKG+d2PJFZ13eRhwkmGqIZ3eALFfVGceIbS8jNIP0NWWeHi9Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pJdC01M0Nbjz9EueS6r8XqmDEJPU3ANzL4fxvnlYnNA=;
 b=aZBbKv2ChJlOQAhCRb+gH13Czpv4Rs/wkAk7qfhPSlwC6KKgmbhUjcQQ6qPgDRV73R8vAPoUyHXTe+nrkc3eh3WePp9AE57s8iPGaLUaXBtqcOvJ/93uzZ5O5SQbEnRxBTWlzdz68AFWpI4Okn9Y4miIvVLxXC3YrXmBIVKKPYY=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9205.namprd11.prod.outlook.com (2603:10b6:208:573::7)
 by MN7PR11MB170846.namprd11.prod.outlook.com (2603:10b6:208:5f0::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 07:24:39 +0000
Received: from IA3PR11MB9205.namprd11.prod.outlook.com
 ([fe80::7a6a:5bf7:f1d9:dbe]) by IA3PR11MB9205.namprd11.prod.outlook.com
 ([fe80::7a6a:5bf7:f1d9:dbe%5]) with mapi id 15.21.0615.013; Fri, 20 Nov 2026
 07:24:39 +0000
Message-ID: <5d7dc1e6-6295-4cf9-b808-d4015a82af4d@intel.com>
Date: Fri, 20 Nov 2026 12:54:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/8] drm/xe/oa: Wait for in-flight OA batches before
 stream HW teardown
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 <intel-xe@lists.freedesktop.org>, <harish.chegondi@intel.com>
CC: <matthew.brost@intel.com>
References: <20261119002737.3899877-10-umesh.nerlige.ramappa@intel.com>
 <20261119002737.3899877-13-umesh.nerlige.ramappa@intel.com>
Content-Language: en-US
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
In-Reply-To: <20261119002737.3899877-13-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0045.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d6::8) To IA3PR11MB9205.namprd11.prod.outlook.com
 (2603:10b6:208:573::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9205:EE_|MN7PR11MB170846:EE_
X-MS-Office365-Filtering-Correlation-Id: 346d2416-4af7-4edb-47e9-08df46d75660
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|6133799003|22082099003|18002099003|3023799007|261022113327099003|4143699003|11063799006|261022075727099003|261026140227099003|261022105027099003|261028144727099003|56012099006|10067099003|261026121527099003|261021123027099003|261021121427099003|261009223027099003|261102123227099003;
X-Microsoft-Antispam-Message-Info: pSKELTktdz33Ogu2MxhccyrSJkXxKKIxFcAxoalHgOHZ+lr2nef21oMdX3Tv2Vj+WGfi/uVVM14JuqK5NhOCL0xwwM9AVfOGEEqpdmarhASiH5qssf+FNeFB2j2g+NtC487dSWBkPRk9V8iax2ZET40fK5FAa6+G9k79TPCOd5Ga84Nk2tUeDaLrDTkD5IdBn+lPi6Y3WXkus7YDG78I5/r6jPb7Axy/Px8HfNLWiodrEh2UUNCtf0500/85limqv5+Y8bBqazk2f5+5xpfCfdFCNpwqyGpqH50mtaLqh3OLGSY0J9YCZ3PUG4mmXmn9LwbJZKo0R74P7shSCqy7wfY1WBBP6XXhKKpI9dP0SvK/1p0TVgMIvR9XWLfMpzOZl4XA5+S5x7+p1N1ld/yicuJjtCSrcmk+4me97Vvcq+Aq+IAUYvZY7rOmlr9DgpfFhwClEiYNt4DnADEfnjHb9G+RBEi5cQvn1AOprixvAEq8QR13sCDPT/FuvZPK0/fycrn1AyTioLSB1u+S7YNHBFzwCoQC5aWK8nsv4fYXyuNOTuTwDVo8ZC+mHe0r6qzdywmojtOh9yjLjAK4rTWUjNY2HAeA+gbV2gwTkZgpoXT9ybNG8VVG5TQ9R2OWKxfrgxABVBR4W5RbBzQHtHtCEyZ6KYlCNZ4Ju/S6Tkrcgyk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9205.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(6133799003)(22082099003)(18002099003)(3023799007)(261022113327099003)(4143699003)(11063799006)(261022075727099003)(261026140227099003)(261022105027099003)(261028144727099003)(56012099006)(10067099003)(261026121527099003)(261021123027099003)(261021121427099003)(261009223027099003)(261102123227099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VjJyUnYzdlFCdlVuWFUwbW1FWEx4SlMvbThLQ01VM3NubVJ4WHVEZ0dXdEhP?=
 =?utf-8?B?TXJjVUl1YWZvd0d2VkxTN0lITVB0SEhPaFV2V1NTdlB5Q1ZzY0dKZkswdDNs?=
 =?utf-8?B?cm14WVhuOGF1aWEzemx5NXl4dlZYYWhWYnM4SG9XcmdwUjEzS1VEQ1E1bXBr?=
 =?utf-8?B?a2ROSmhsT0VlMjk1Q2hrcFlweWw2VmhOekVIdXdhbE5kRDRUcVh2aDdhQVhv?=
 =?utf-8?B?dkIxWkFGL2U5a25yeXJEdnhMZ0p5OTFBVkt5bDdXL3prUTV5WlBSaVVtcTNj?=
 =?utf-8?B?M1dUUlEvZFZ0OFpucnFQSDNYeWZsMWlmRU9yeGJUalduU0o0NklOR1J1dVF4?=
 =?utf-8?B?S0g3SEw4bjJ6NXQxZ21KblczQ0RVcVFUUkU1T0MzWjduV3RmakhRbmNSbFlt?=
 =?utf-8?B?K0ttQk5FK3lENjVXSjU5MFZDSEI5cTBvcG5sRS9pWHhPaE8reS8wZ3pSWCtt?=
 =?utf-8?B?T2M1NGtKSUhNbWFsNEZVN1p2TThyNVVsVy9aVU9Xb1FmMHBtSW4vUzh2VnNi?=
 =?utf-8?B?eVJWNnFMNnJxMU1uMnYzTEh5YjV5bmxXeFF4ZnlZRHAxZ2lPRGYxTnJzbS9Q?=
 =?utf-8?B?U0xyNUNvU1F3a2tsRi8wYXZ4RzN0eGdKRWhDZ0VSb1BVNGthS3JpRkkzQlND?=
 =?utf-8?B?OG03OUFSeExKc0JTUzVaa1R2YVJsbHhiUXAzdFVyZTRVYXZNTUpoWUFSTnNM?=
 =?utf-8?B?Zy9ibGlmd2NUQlVad3N2VkxaYlV3QjJOYUxEWHgycmYvMHpjTlBScW9FZjNv?=
 =?utf-8?B?ZjF5UERxWTROcTIxR3IrYUpEQmVtaG5sTitNQkd2WDN3UnBkWXJCM3RjVDdw?=
 =?utf-8?B?UG9nTERHci9RaGlQRy9lQ0V6MmVhTEFORUd6WWZzWVJmVEYveWxpV0M3ZGdl?=
 =?utf-8?B?QmlRZlVGZDI4R0Z4UENLUjdKUXk3dENRTHlvNkFpOHI2am4xM0h0MC9HVHh1?=
 =?utf-8?B?SkxsQXk5TzR1SXZNSldUcG5XZjdUd2NKNVorUjcydzl5bllSK0xZWHd4TWls?=
 =?utf-8?B?TG1Cc1I4TzRaYS9lZlg1R3FkVXI2dXAyVGE5VGNlYmZYU1NOSzA0T05xSWhi?=
 =?utf-8?B?TDMzU3FDanpnYW0xbHVCdjE5aEViMFRkSE1kdVdQVHp6T0V3K1BHMHd5SWdL?=
 =?utf-8?B?NW00a0tBZnNjN0tlK3drY1JFRG8vM3QvUkIxOUU2N2RtdFNoZkg4THliWUVV?=
 =?utf-8?B?Z1I5Q3F1V2VPQzlEcGt5VTA0L2tyVzkxdG1LYlMzdkJpaExGRmZVZE1Ib3hp?=
 =?utf-8?B?L3l3eGxIUnBmN1NFcGFRNXVFRHdZaW5XSnU1cDljck54bXErWXVueEdHQXho?=
 =?utf-8?B?cVdYMlZabk41NFUwSW1MRzZpWnJhTndhUk83UW9LVW1rcDg4NTlLUGVqYVlR?=
 =?utf-8?B?WmtXWUxRYXFWeklFQjgveHJnVjByaGxQTWtSS1RCR3FPRUNTNTZEYzRMeTh3?=
 =?utf-8?B?aGxZTjFlQ0lPQW9Qdlo5TnVoc2lmNitOQnp6eEs1aTMwWGVGMytVbXVybU5j?=
 =?utf-8?B?OVZ6aVhVM1gzL0VvTFE5SkxMczF6NFVLcy9HZkNTQjBxcmt6RHBoenlTM1Iw?=
 =?utf-8?B?Yi9sMnpaaGJrV2xBTzk2K1ZHazVxbW5vTHRhNUg0Zm5yL3FLMkptMzVEbDJz?=
 =?utf-8?B?bnR2R25RZEVFT2lMZHZjdkQ3U0dZQmZiOXdjUzJ5dlRoZ3NzajBBUzJDa2FT?=
 =?utf-8?B?MzljMXA3R0ZVUFlhKzdLSXd1bHNUWXlHWW9DQWFKV3RnRTBaUHh4aXVCVU9s?=
 =?utf-8?B?dlNsb3E3MEptTHEvNUZoZWQ5MlVRYktKaE1RY0hWdTZZUXhxN3RyM0N2NTFx?=
 =?utf-8?B?aFRmSDVYUjJMNmtJSmRBU3VmcnZVaHFTeVYrWjhJWUdpNW1FczRUUkdyeXRj?=
 =?utf-8?B?NU16enpLQUtjanpnU0JqVnZpNGVvT3JXNEJYVmN2Y0l1d2ZxamNJcmdYRWpr?=
 =?utf-8?B?eXdDN2VUT0l6Y0hqZUxwcUtxcFpXYzBPSGM0aUVialBzR0I5RU5TVzRncjZI?=
 =?utf-8?B?WWdNVmQyTXpZdXJGbm40TGlMOHFOZ0lRRTBnYUZkR3owYTBSMVNGMWF2a2sw?=
 =?utf-8?B?YjR3Qk93QTNUeE1Dc2J4RTdTTlZyaWgyRWdYNXdMalloUzEvZDg4WmZ0Q3Yv?=
 =?utf-8?B?eTBUVVFzUXp3MVFHZlRXTnNNWXBFLytKSVFKK2ZCY2N6aXZXandwZCtOVUpQ?=
 =?utf-8?B?aWFaS1RUTDNDUXpyelllbHVrdVg5U0lDQyszckJqVERVZGdXN2ZLa1lncDll?=
 =?utf-8?B?L1BRak15WW8waUM3M2g4MGtxa0lkOFVaTklrbndMZlpxTENSQmZ0cjlFelF3?=
 =?utf-8?B?eGFkTzhwSWJYa3lJclVneVBuN1VBQkNYQ3J0SFVYRy9tV1ZsVk9zUT09?=
X-Exchange-RoutingPolicyChecked: quFYCXwhX/uTl6qCXju/ksuhSi71tBSyT83neD7ll1RhUI2Pw9ENXISBG5bAGJPDQzNktvcEp66h0VBbUoIPgUC+kR3IiMGlEohC33O9K4OLWNhlfVdy/7sPTHW/tOId9awqprcfpbXfTC+UrkRKg0/ShyZ+s/7jmLMa2hSJY7g64pCDXNxAdKSd+4NB82tZnZaMhV4c+sEj7WBbeGMWV4AKJ4H7nQEKE4cWzBpNXYe/5HIi3kic2bXVQ2Bvsa26Jaf1XoWc1wYON9yz6YbgqV266PMiYcUqbTlCaWf18FwjoDDnVoqXgUAIcj63RuofgN53KZmLWXYMryy5noHFfQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 346d2416-4af7-4edb-47e9-08df46d75660
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 07:24:39.4402 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wNS6Mmr3IAmST+5NL5+gYOm+jyC70iTDzUPHvtKAMTbpVZNQQNen1LX12TilApZQLx+efMJFa1qSpn4IPEawT2J39iWL3R4SO8/6jCDWNfI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN7PR11MB170846
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


On 11/19/2026 5:57, Umesh Nerlige Ramappa wrote:
> Config batches submitted with output syncs and context LRI batches are
> not waited for. If one is still in flight when the stream is closed, it
> can program the OA registers after they were restored.
>
> Both go to the same exec queue, so also record the LRI batch fence in
> stream->last_fence, and wait for it before the HW teardown, bounded by
> the job timeout of the exec queue. Also wait for the LRI batch that
> disables the context save/restore of the OA counters during the HW
> teardown, which covers the stream init error path as well.
>
> A config batch with an input sync that doesn't signal sits in the
> scheduler, where no TDR times it out, and still runs once the sync
> signals, possibly reprogramming the OA config of a later stream. Don't
> kill the exec queue when the wait times out to prevent that: the TDR of
> a killed kernel exec queue resets the GT and can wedge the device.
>
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

LGTM,

Reviewed-by:  Shekhar Chauhan <shekhar.chauhan@intel.com>

> ---
> v2: Kill the exec queue if the wait times out (Sashiko)
> v3: Drop the exec queue kill, it can reset the GT and wedge the device
>      when the batch is on the kernel exec queue. Wait for the context LRI
>      batch of the HW teardown too (Sashiko)
> ---
>   drivers/gpu/drm/xe/xe_oa.c | 46 +++++++++++++++++++++++++++++++-------
>   1 file changed, 38 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index d574b0ecf39b..1c2f57735e0d 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c
> @@ -741,6 +741,12 @@ static void xe_oa_free_configs(struct xe_oa_stream *stream)
>   	dma_fence_put(stream->last_fence);
>   }
>   
> +static void xe_oa_update_last_fence(struct xe_oa_stream *stream, struct dma_fence *fence)
> +{
> +	dma_fence_put(stream->last_fence);
> +	stream->last_fence = dma_fence_get(fence);
> +}
> +
>   static int xe_oa_load_with_lri(struct xe_oa_stream *stream, struct xe_oa_reg *reg_lri, u32 count)
>   {
>   	struct dma_fence *fence;
> @@ -761,6 +767,7 @@ static int xe_oa_load_with_lri(struct xe_oa_stream *stream, struct xe_oa_reg *re
>   		goto free_bb;
>   	}
>   	xe_bb_free(bb, fence);
> +	xe_oa_update_last_fence(stream, fence);
>   	dma_fence_put(fence);
>   
>   	return 0;
> @@ -848,6 +855,28 @@ static u32 oag_configure_mmio_trigger(const struct xe_oa_stream *stream, bool en
>   		return REG_MASKED_FIELD_ENABLE(OAG_OA_DEBUG_DISABLE_MMIO_TRG);
>   }
>   
> +/*
> + * Wait for the last OA batch of the stream, so that it can't program the HW after the HW
> + * teardown.
> + */
> +static void xe_oa_stream_drain(struct xe_oa_stream *stream)
> +{
> +	struct xe_exec_queue *q = stream->exec_q ?: stream->k_exec_q;
> +	long timeout;
> +
> +	if (!stream->last_fence || dma_fence_is_signaled(stream->last_fence))
> +		return;
> +
> +	/*
> +	 * A batch waiting for an input sync that doesn't signal isn't covered by a TDR and still
> +	 * runs once the sync signals, possibly reprogramming the OA config. Don't kill the exec
> +	 * queue to prevent that, the TDR of a killed kernel exec queue resets the GT.
> +	 */
> +	timeout = msecs_to_jiffies(q->sched_props.job_timeout_ms) + HZ;
> +	if (!dma_fence_wait_timeout(stream->last_fence, false, timeout))
> +		drm_err(&stream->oa->xe->drm, "Timed out waiting for OA batch\n");
> +}
> +
>   static void xe_oa_disable_metric_set(struct xe_oa_stream *stream)
>   {
>   	struct xe_mmio *mmio = &stream->gt->mmio;
> @@ -864,9 +893,14 @@ static void xe_oa_disable_metric_set(struct xe_oa_stream *stream)
>   	xe_mmio_write32(mmio, __oa_regs(stream)->oa_debug,
>   			oag_configure_mmio_trigger(stream, false));
>   
> -	/* disable the context save/restore or OAR counters */
> -	if (stream->exec_q)
> +	/*
> +	 * disable the context save/restore or OAR counters, and wait for that batch like for
> +	 * the ones before it
> +	 */
> +	if (stream->exec_q) {
>   		xe_oa_configure_oa_context(stream, false);
> +		xe_oa_stream_drain(stream);
> +	}
>   
>   	/* Make sure we disable noa to save power. */
>   	if (GT_VER(stream->gt) < 35)
> @@ -896,6 +930,8 @@ static void xe_oa_stream_destroy(struct xe_oa_stream *stream)
>   
>   	mutex_destroy(&stream->stream_lock);
>   
> +	xe_oa_stream_drain(stream);
> +
>   	if (stream->sample)
>   		xe_reg_dewhitelist_oa_regs(stream->gt);
>   
> @@ -1002,12 +1038,6 @@ xe_oa_alloc_config_buffer(struct xe_oa_stream *stream, struct xe_oa_config *oa_c
>   	return oa_bo;
>   }
>   
> -static void xe_oa_update_last_fence(struct xe_oa_stream *stream, struct dma_fence *fence)
> -{
> -	dma_fence_put(stream->last_fence);
> -	stream->last_fence = dma_fence_get(fence);
> -}
> -
>   static void xe_oa_fence_work_fn(struct work_struct *w)
>   {
>   	struct xe_oa_fence *ofence = container_of(w, typeof(*ofence), work.work);

-- 
Shekhar Chauhan
Linux Graphics Software Engineer
Linux Platform Enabling
Intel Corporation

