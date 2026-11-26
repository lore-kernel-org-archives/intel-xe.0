Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A665606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 13:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lKLoc+d4;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=W6YCVcFY
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D32E3112199;
	Thu, 26 Nov 2026 13:08:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C8D01123F9;
 Thu, 26 Nov 2026 13:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795698470; x=1827234470;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=A0kboXOew8v12JF8ysVT6bOrN8/Z6ocW1ae1qfXobQc=;
 b=lKLoc+d4cqSorIfIluQ7faNfOpladYVcNdPyo9YY6BBqTu2mM663gl+U
 Uqe/hQ0Z1cIkErd7rw4eSSXTRyZ+jKEUQ7BfUVGf6pLsEB4Sg+tifGriR
 ngRIkcCNmgE8vZ1oisnvPT8jM2M5nD81tx+QTp25fppxiA+1d53znyj83
 bjCOuV0b/rYRrvY5FYthxVbNYNOUuWKcNIJThyl7whBnnll0WNMTpsXrA
 o+zGC8cstdkMrzC4Ttx2llFnAXXkdSZL5PjxJcIb/GpGto/v62abdbFtD
 2C3/sX1mcVydUkAdf27jH7q6Ld5auQF1zKykWXcM5PdCsR7ij0NJg10+0 g==;
X-CSE-ConnectionGUID: JHQvmf2bSPKxGAnYWbkffg==
X-CSE-MsgGUID: L8/V+VhsTYe/mv9MyXvPaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4676067"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4676067"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 05:07:49 -0800
X-CSE-ConnectionGUID: c4pAWfhfSFGV5yRXODvh6Q==
X-CSE-MsgGUID: cXuvCVSTRoail+hVA4h91w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; d="scan'208";a="12485328"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 05:07:48 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 05:07:43 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Thu, 26 Nov 2026 05:07:43 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.62) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 05:07:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t3ZpbJuYPVc6jBNF06kiD2tVVzWMk/26MPM53Ll/20IooUPDVtyg35+v+b0XEWkc7YkPfSKsVw9awJpbVXxfjZRHHiqTT3HfoGo7efdPfKhD4jl+Lvm4+E5VeXIrlu86zuWzIPhAOcfwCtZVYY/bWJLlD/Z90SJEt0u1i1a7tru8weFSh8DYdCzgYU6LYad+yIvjj+90VhXx9zCdmYs2kS0jLJv/EaaZ7VCHNOP92JkRcXjTPCbcw5uix4WhW1luTifP9gkqNU6YLwqmBt8M2IhravXD1ySRBFy3UIARWDi5vXmm9gxcZnXq5vdHhedt4yh98Oo5Wh+iCU2nq4Lv2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cwFMERRvN/jYzTJeuSla5WjNjayJfVXUcEij15Z8STo=;
 b=mj9YHLtCNo+xO0Nf+qfbdD/eXw07XI/P0nyhkPSURdDZPAzOzkLbXYspN64NhARtbCN4kppUa9mIhD9yyYOGR+4WcDKr+5k9xTvfaL6QqWBqSGqjqty3KlxOGVwZMPyguOLThHc8JpOcdAN98S9JbdPkqGMfJPIYYhP4w9iHZsk5kJzehCF6qlLXElejJJjnnpQ89TQiG3S0szJYjzRXAIxaSQF7Q2D+uHs8bTJyFYlbAZ15aL9bmj5nCH4SoZ4ITynjHr6tK2RqTSNrWGLCc4asmCheXMLZr0rMBoczppG4btPjXda7OwJhEhSfAuNt3japxQ0tFDuzfTUzbNCCGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cwFMERRvN/jYzTJeuSla5WjNjayJfVXUcEij15Z8STo=;
 b=W6YCVcFYC+SkUo4l2DG8a3xCNw5HRY/uL/VMVhkgYTu8Pn6BRTKcpT9EHEROZI+rxqPZyELa58ywMjTtUnSw+0RO0pXxLoqO1SFSiw2Wne4bWV4tD3jn/fXCDJYxb/HZ95dcgFiK0qJq1F3GmibfDpXkldHE9zAYX4WbdATOYeE=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV2PR11MB148960.namprd11.prod.outlook.com
 (2603:10b6:408:40f::21) by DSWPR11MB9690.namprd11.prod.outlook.com
 (2603:10b6:8:356::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 13:07:41 +0000
Received: from LV2PR11MB148960.namprd11.prod.outlook.com
 ([fe80::9761:b20d:6f27:5460]) by LV2PR11MB148960.namprd11.prod.outlook.com
 ([fe80::9761:b20d:6f27:5460%5]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 13:07:41 +0000
Message-ID: <6e917119-b642-4d2b-9592-897a5683d042@intel.com>
Date: Thu, 26 Nov 2026 18:37:33 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] drm/i915/gmbus: deduplicate setting force
 bit-banging
To: Jani Nikula <jani.nikula@intel.com>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>
CC: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
References: <cover.1795607055.git.jani.nikula@intel.com>
 <7093a619be58bf8c6811260e4efae0a3dbc9f6f2.1795607055.git.jani.nikula@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <7093a619be58bf8c6811260e4efae0a3dbc9f6f2.1795607055.git.jani.nikula@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0308.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:21e::17) To LV2PR11MB148960.namprd11.prod.outlook.com
 (2603:10b6:408:40f::21)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR11MB148960:EE_|DSWPR11MB9690:EE_
X-MS-Office365-Filtering-Correlation-Id: f95ff445-85fe-431a-6aaf-08df4bbe4085
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|10067099003|56012099006|11063799006|261022105027099003|261022075727099003|261022113327099003|261026140227099003|261028144727099003|261021123027099003|261021121427099003|261102123227099003|261009223027099003|18002099003|22082099003|4143699003;
X-Microsoft-Antispam-Message-Info: 69Y9T/dYjajP/BcCf9f+twTsKGHB00rwe3JsoiFlrS5xA/cMBKdA9bFzyqLWnGmqBWFsD3G+PTtO1WA5p9UDjiwUQr2TDaUd8jRoddVPE4M6eKbOv0rPeh57UUP4fllGevP3AqctRKxGu/kXPhTZbDLvWODJ8MTE+1BjXNwErpIKkADlbF+u4U+ArgJxG2lZEdK8dOfPDDjHQLq5d/SXU6wED1uq7+AKYtJsrszWn6BXi89hcVyS+oTLIGx/tGLY2s1dGQYqTepDWppQXuLyMrtYBHhNPFqlqPCGRdPNiIda8vNPujqw9RFDDPOuVY3R3VRjiSPMpK39G24CYyiZ+Mk5BX20do/phKu5iinXGshw8GDjD1MoshqpDdFaisW6heWG7l5xy4t9kTaZFIZcfDi2cIobn/zmqrhc5/y8/GwELZ84W7uJ4j/QNTyRDyJOfyUK8nOXHAybYWetskjsmPgXjabl+QGkAGFHYsNvKoOHEzEk9zC1NmGcTP6BbaWuN052iuNP/CndU9Dq0Ayu1THZ5mSWu98ub9cV0CJFERgpYnvd6PTf4++P//rfcnm5aFVGyUkeGf0/6VZ0E69EJ1vpzm0B4nHgdciyyIiwjQGIfQJ0BmLD2R2xtrzSAbp+1bsUJo649tUN06kCuy46nNzCV7h43BeLU2ZHAd9hBJ0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR11MB148960.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(10067099003)(56012099006)(11063799006)(261022105027099003)(261022075727099003)(261022113327099003)(261026140227099003)(261028144727099003)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WFhBU284bzl1MFhRYTVmY2p0clRnVGtVSFpwZERWWFJGMCtFQ3ZRaGZDYXBX?=
 =?utf-8?B?ZkNhSFV0Rmpndk1hQi9oYVE4ZFMxb1Rlb0tsbmxPQ2JVM0RuSWZJaWRaeU5E?=
 =?utf-8?B?UEVXQTlhall5WkpkNFUxeUM5YkpLV29jS3RiODZ2RFF4NVA2dFEvWEMra3E4?=
 =?utf-8?B?Rlp0c1daQ01EMTdWbUE0a0pmdGM1WTE3RDI4bkZUNTFrYm1xUzR2dDIwMnRt?=
 =?utf-8?B?SE9PR3JFc0ZUUUpsZ1ZLTkRCT2thcm8zOFQ5L3RyREQwQlI2WHZtK3dIdVJR?=
 =?utf-8?B?TlNwaFA0dVA2SzdEMkI4TzB5SldyTnEvUVRDRWc1VTNQREZzeVBrWWU4M0tC?=
 =?utf-8?B?UTNIMmpzb3lSczZrNk0rZ0M5VGkrWUUvWjgwNnlxb0dJS3c1TUlDWG0wSWx0?=
 =?utf-8?B?MHMvbHhxTHczQnJQWWtkQXg2elh4ZHFVU1ZENXpJRG43SElpaFFKeHZaeUhK?=
 =?utf-8?B?cXcwMFBrODJqdkFvLzM1TEtVaGVwNGR3aTN3MTg2M0VFa2xyWFFmU3g4aWV5?=
 =?utf-8?B?RnpYK2cxN1MxR2V1NWQzNjY5cVFZZzdSbDN5eDVvL1U5eHJxN3VFSFJMcCtM?=
 =?utf-8?B?NElnSEh6SFczZzBDclRyZFI0N3JwNTg1MW54Q2VseFFnNzFhUVFjdmhjVno0?=
 =?utf-8?B?U0JuMnZzUkZ0WXd3RjNWSFdZUndGaUxYNUsrM1l3czI1bGtHbDFVMXM4NXpM?=
 =?utf-8?B?R0Q3RE5zdTVQMEdzZDZMYUxRdmMrVWQxNStDU21Ec1NZTllQbGNjdXdVSklT?=
 =?utf-8?B?WU1xV0FZYVRuNXdUVlN2R2dTSnliWkdtUUt5S0JGU0VrNWhFYjFFeG90cXB2?=
 =?utf-8?B?c2JhRnFQWi9TbDVRMDFLMDNtVFhBUVI1dEU3QXJ0dXF0NTg5cEkxRktLVEVs?=
 =?utf-8?B?akdBQWtvSExqYjFCRVF3ank2TFM5WHAxYitTdHFDM1RHSjVtZFUrcHFIWlkz?=
 =?utf-8?B?M0FISEVZSmxiV3ZLalF2SXdkQlBVZkRZMW1rblBIUW5SYlJYUk8zdGVQei84?=
 =?utf-8?B?Nlp0aXBzeFZQSkJSUVQ1VVh5UjlueUV3Qyt4aEJ0cDNZTE9Fb2x1YXNlWTZY?=
 =?utf-8?B?ZFpRTGRnYWFFUlBHdlJKNyt6cVV5MTF0R3BkaFJwYlRCYWNLWWZPRmYrNlJj?=
 =?utf-8?B?bDBhYmVMWGdyYnJHK0tkUkd1Znd0ZDZCam9ZUWgrcVE0UVAybkdwb0FzbWxH?=
 =?utf-8?B?V0U0RGQ2Z2dJVytZcUNiQ3lZemo1K2tiSzk0K2owRFhPUFg5aTNuVGxyN0Yx?=
 =?utf-8?B?aVYxam05QldzV0ZCRHVjdVUrMUtPL1FiS0p6TzdOeEI0VzZWaXdXMm9WWk9B?=
 =?utf-8?B?dWVYNWpBR0JOdEt4azViQVNGRkFVMVo0L09qYTFZM0JsMmpnY2FSZmZiRTJm?=
 =?utf-8?B?dFNNRFViT3JsNFpRZGFYZ2hKdUtyczBjWG9WLzE1U2JVNXg4S3RYV3ZHYllr?=
 =?utf-8?B?NC94V1NRUjVTeWg4TU1aV2RrT2RaNHRKNmptcnFMc240Q08wenVoZ1Bscm1Y?=
 =?utf-8?B?V2pqbDM5TjBIWW9JVGxvSHpWTk5GbEllVG9IdGVOdEtESTZlTnorcnczYUlv?=
 =?utf-8?B?L0FySldGUmlVSzh6L2d5d2ZrVE5nMDMwNWxrRE5pLzJoY1E4R1ZkMExXdU5Y?=
 =?utf-8?B?Yk1oWW9ybDJVZ3dzNEVtdjdMY1ZpYU55ZkJkaU1SRVpvQXRBOEh5MGc1akNq?=
 =?utf-8?B?RVdHUkx5VEdYNTVKdVpJTFFwMHFrY1Z6eE9IQy91My9NMGhLcTl2NFBncWdy?=
 =?utf-8?B?b3FmSHJiQlNpN000Uk1QWDVIYm1Eckg1bEl6V2ZXVUN6VVR1dFRnQW50dWhP?=
 =?utf-8?B?NUozN1ZTNnNQWkZkK2NOcWR2bTFha2pGbVJyMW5PUlhFc1ByZzRycVlIYW1Y?=
 =?utf-8?B?VnAwNXl3UGVzYTJPVlVKZGs1aGZQVWFnNTZQQythd2F0Qndqc2hIVDhwUzNZ?=
 =?utf-8?B?cjNRTExudlkwTEV5RjNnRi9KK2ZRRm11ZEF1K1BMU3hnNW1RTnQwdWJYNjc5?=
 =?utf-8?B?ZHFSaTZKTDBqdVRXUDNHNVk2UHBneFB3dW9ydzNVejQ5Z1FrKzlnaGQwRThx?=
 =?utf-8?B?N1R3RzZUWjQ0STlQSEw0aDQ4OTB3K3V5Z3BFaER1V0RQeUpyY042eFp3RWRO?=
 =?utf-8?B?QmhPNzluOGxnbFo2WEt4UUVlOEtIUTRjenBsWlJ5OGcrNmRuWG5hK1I3Qk9Y?=
 =?utf-8?B?UHNwdkxMYU1KTDV2aElFZ3ZEd3lzYThLdGYyWjdLOEo3Y2pEclBJalh2RFo5?=
 =?utf-8?B?Z2NzVzJMVFI3c1pqcXAxbHlXdXBoUkl1UmhjSldEMTJMTXUwaG9rcFA5WUdH?=
 =?utf-8?B?aytjTTJIWTFMN0J1MzJPcXlMWkt6YUpSNFhGLzlmQzVHbGVyQVRZdkhla3ZR?=
 =?utf-8?Q?rGWOqWBz22YgQD64=3D?=
X-Exchange-RoutingPolicyChecked: LKn/YvFc+dYWtAlUZDb02g4UbcXiff31Rk/ruZLfCmiOoZfOOedliiSGDjwvQ0qxIls/4MIc8asgcO+Vb7RxvgVOicevU6z4NC0TrjsZMtDShQz4wR1oZoY1dPC4dzwW1dPujwGY73uJQfHtJD82bfPHaT3k2/dljspX1OCMX8lHrZZQ466JVxAT0ru4CptsglnoEkr8+RAYYWwr9icUAWoSKveszVxxGKG97EQf9s9gG112mq6OGbiRHhdbFF5nTscfwYYILbmy6RyiiSkYhSVf4vl2nsx8vT1jz5y4DIlbt7CZIqv2X/2ZUCS20EoAtuoV7A270N6p+Kc88fJ5DA==
X-MS-Exchange-CrossTenant-Network-Message-Id: f95ff445-85fe-431a-6aaf-08df4bbe4085
X-MS-Exchange-CrossTenant-AuthSource: LV2PR11MB148960.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 13:07:41.1358 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MLU3vxRaRG6tdQBA/ti0ayQC6hvcHP86vnGrTsEHcS4hQNlKTZ8m61hjoNgUjt6TZJmGz5B1Vv80GAf6FCegUcjH+Q7zLGywdXuHP1eC/Gk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR11MB9690
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


On 11/25/2026 5:16 PM, Jani Nikula wrote:
> The code to adjust bus->force_bit is already brittle, and it's better to
> avoid duplicating it. Abstract unlocked intel_gmbus_force_bit_unlocked()
> helper, and use it.
>
> Cc: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_gmbus.c | 32 ++++++++++------------
>   1 file changed, 15 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_gmbus.c b/drivers/gpu/drm/i915/display/intel_gmbus.c
> index df25a8233345..0c3037ef0dcb 100644
> --- a/drivers/gpu/drm/i915/display/intel_gmbus.c
> +++ b/drivers/gpu/drm/i915/display/intel_gmbus.c
> @@ -1015,19 +1015,27 @@ struct i2c_adapter *intel_gmbus_get_adapter(struct intel_display *display,
>   	return &display->gmbus.bus[pin]->adapter;
>   }
>   
> -void intel_gmbus_force_bit(struct i2c_adapter *adapter, bool force_bit)
> +static void intel_gmbus_force_bit_unlocked(struct i2c_adapter *adapter, bool force_bit)
>   {
>   	struct intel_gmbus *bus = to_intel_gmbus(adapter);
>   	struct intel_display *display = bus->display;
>   
> -	mutex_lock(&display->gmbus.mutex);
> +	lockdep_assert_held(&display->gmbus.mutex);
>   
>   	bus->force_bit += force_bit ? 1 : -1;
>   	drm_dbg_kms(display->drm,
>   		    "%sabling bit-banging on %s. force bit now %d\n",
>   		    force_bit ? "en" : "dis", adapter->name,
>   		    bus->force_bit);
> +}

Noted the _unlocked construct. I had the same mutex idea back then, just 
didn't extract it this cleanly.

Change LGTM.

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

> +
> +void intel_gmbus_force_bit(struct i2c_adapter *adapter, bool force_bit)
> +{
> +	struct intel_gmbus *bus = to_intel_gmbus(adapter);
> +	struct intel_display *display = bus->display;
>   
> +	mutex_lock(&display->gmbus.mutex);
> +	intel_gmbus_force_bit_unlocked(adapter, force_bit);
>   	mutex_unlock(&display->gmbus.mutex);
>   }
>   
> @@ -1085,30 +1093,20 @@ static ssize_t intel_force_bit_banging_write(struct file *file,
>   	struct i2c_adapter *adapter = m->private;
>   	struct intel_gmbus *bus = to_intel_gmbus(adapter);
>   	struct intel_display *display = bus->display;
> -	bool force_bit_banging;
> -	bool changed = false;
> -	u32 force_bit = 0;
> +	bool force_bit;
>   	int ret;
>   
> -	ret = kstrtobool_from_user(ubuf, len, &force_bit_banging);
> +	ret = kstrtobool_from_user(ubuf, len, &force_bit);
>   	if (ret)
>   		return ret;
>   
>   	mutex_lock(&display->gmbus.mutex);
> -	if (force_bit_banging != bus->debugfs_force_bit) {
> -		bus->force_bit += force_bit_banging ? 1 : -1;
> -		force_bit = bus->force_bit;
> -		bus->debugfs_force_bit = force_bit_banging;
> -		changed = true;
> +	if (force_bit != bus->debugfs_force_bit) {
> +		intel_gmbus_force_bit_unlocked(adapter, force_bit);
> +		bus->debugfs_force_bit = force_bit;
>   	}
>   	mutex_unlock(&display->gmbus.mutex);
>   
> -	if (changed)
> -		drm_dbg_kms(display->drm,
> -			    "%sabling bit-banging on %s. force bit now %d\n",
> -			    force_bit_banging ? "en" : "dis",
> -			    adapter->name, force_bit);
> -
>   	*offp += len;
>   
>   	return len;
