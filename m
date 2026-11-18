Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB626606A31C
	for <intel-xe@archiver.kernel.org>; Wed, 18 Nov 2026 09:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EIxHnjCc;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=iQZPt/ha
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68A0710E7BF;
	Wed, 18 Nov 2026 09:57:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28E8310E7BF
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Nov 2026 09:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794995830; x=1826531830;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cKXTaq7O27Ia5wBIIQCaOuNjs0I+nPt0XM/LPZT0NeA=;
 b=EIxHnjCcMB58PfTeFhikdoV1Au+tn0DmzuvjuzPWnkvbkYaGXpy1FI9u
 aHKwbaFA1YY47/pLaMyB7SQrhpt5AYAgegSNrje9qSpM4gyHCxRwrmndn
 8vwz4vp7NYxa9XKStFa0/f82CIS/UQzokJM1vxTMZ0vMk+gVgjrX2K50/
 zqUsm2yjskehMn7/y/CQKcqZl1yz4dWOk1A8EbG/F7ngmNeasjJi19VV5
 ayIEG/5wC9PXcCsTTWK7EVx5zg2wQttIlGdnPkat9xxhwISskX1xEoFTZ
 WJpA6XfWhI95oUKiHIaE0zGvkQXWiqmIf259khWQI9871eT8Mvdo+PnYA g==;
X-CSE-ConnectionGUID: mN3mvOgWS+ueXeR5sapjHw==
X-CSE-MsgGUID: ssQtx1eoT02HDMhTjZdi/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3808279"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3808279"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 01:57:09 -0800
X-CSE-ConnectionGUID: ZLGd1WEqTbaYtf4Q/jJ8kw==
X-CSE-MsgGUID: zx0R4zc8QTikOzVfK66vVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; d="scan'208";a="10244529"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 01:57:08 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 18 Nov 2026 01:57:08 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 18 Nov 2026 01:57:08 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.37) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 18 Nov 2026 01:56:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NkZPAAmaJBz4UuErzSreXV+ubacBeCkdOnNd+L1xJyizt+JYv4e8zSFpKH4SlS4qvaY6H/osHBkJyY/dWbPN5VVrlX77fKv99IJFIivsOvd611QLwIWbh9FLzpfdLpGBsS5u1RwilMJJwZ/JDNCLPqz+NTZrGPgQhltwAY61qKskiwRHmS1KZLC1GursoLHcEyCJMWocJmnQvy4Z3glHwrFrAA00U9qhIPELhozoMY/8rxj3EnXJ/zAW89rE8/81kgU7y5jwk0T90xhbqUJdxdMzYfB2dnxgLMRzaeVljCdHbL053+T6CGsmD7r05ECVHnRGkPbEBZKzpJ+KC0pMmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q+WetZnmYBkhzuDrx/NJqRpByco2aF3Xq8lC2pv/9gI=;
 b=t6UejE/5BPMX/I8XxJ/3oLS2b1HUQjI1ZjciaPl4XQKNEcBgsLxYLjHliUA6QU7kJZVodjA20YBj5Tgzl+cC91Y3xuv5vsY8YAfoEbgcaGWEdGO8zbL78KDDD1aDN2A4QfK6ylra/sQiWhbeBl+v26fSy97ukKUDi47pBy0JHkKGx7liamMGmoo1RQShm+X/+kRoVfeowQaosnrjyg3SrfnNOvDuUklgsykjpfXGLPdmTM5MVnebvd3dg8psJp9+DID5uowpRJtGgQ/yVaP5XgXqXuKmKGf9O6neaVMtKeUE2RKA9exD3Hx5/MX1vBkp9oLi3BgQh7rQJX7k+Mv0DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q+WetZnmYBkhzuDrx/NJqRpByco2aF3Xq8lC2pv/9gI=;
 b=iQZPt/haZHeUBlqqfmMpDMOuQ8I7lRBlvCxlPyzKTkVmHXJBOM/NHRPO79nH8eAKAPnQQw710YNg2vV/fGnfWO+FW6RvEUVFC4nR+g2uEVOtmZG0pmAmXsP88yk4IEVRqUARS4EDMOkAiUMW0WTA9tkrNn8MxKTM4M0G/yYfItU=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV0PR11MB9792.namprd11.prod.outlook.com (2603:10b6:408:385::5)
 by SA3PR11MB066336.namprd11.prod.outlook.com (2603:10b6:806:588::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 09:56:29 +0000
Received: from LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8]) by LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8%5]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 09:56:29 +0000
Message-ID: <8b2cbe48-782a-4e9f-9224-eed28ed24362@intel.com>
Date: Wed, 18 Nov 2026 15:26:21 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/xe: Expose CRI maximum memory frequency and
 bandwidth in sysfs
To: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <sk.anirban@intel.com>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>
References: <20261118062301.4135537-1-naresh.kumar.g@intel.com>
 <20261118062301.4135537-3-naresh.kumar.g@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20261118062301.4135537-3-naresh.kumar.g@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0068.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b7::7) To LV0PR11MB9792.namprd11.prod.outlook.com
 (2603:10b6:408:385::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV0PR11MB9792:EE_|SA3PR11MB066336:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e2cd8c0-2c50-4a58-4e84-08df455a37a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|10067099003|261026140227099003|4143699003|56012099006|11063799006|261026121527099003|261022075727099003|261021123027099003|261021121427099003|261022113327099003|261022105027099003|261102123227099003|261028144727099003|261009223027099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: dS2FoeDn8Kp4vF7fzUql55kiLSybugh0Jq9l5/1Gmc1qRG5m60kJoqQ9EvIOLszVo0mRz+n6TvZyB4cZNPLTGIei8aGy0LCC1a9WoaQZWd/Da9oFUP2d9wcqupiA1L4nt8LdoY32TEgznUz2ybMcgopMwWVF/E5rA2fTlTyfOBo2HfptJofJLqRomiuMssBXVhBXygpcrw+iShYQss6+qR61hP912qg1Aldvm83a9Q46SUQALUdjV5pLQSqFemuNo8Kv8T/3qllyQDOc6L3fKbgcfB5jOL8wi5lEW0/yIDeTiAJlNeTMpgBp6+m3ZDgK2VUqTozFwBWo0KmFES0Kx6rjaJqzYTZ+WvwADaLfQKwLwI55Lnh5eocL2nG7dSL6dUxhgem82zBmx/nhHROTSgpbb+PxVUfpg2ASkNDDKUVb6U2uk8Xqm7tn0d5l72ypSVoNuewTR+Osh1jjl/QaM8ts8YWgD1J4hOoT8zidx2RsKso+ujYHwSQnTmlbdqSd/TQgOZjiAs9lUSWM8E7KnXAAFjIYpfBeZffehWV7CPajKrC04k10Rw3yPHXidpLanNbtcAUGWAq1sGUgelHz0C5Fwml4RPzBJg0FiJNrkqAhPTtFz0tVPwNWiC6n7pLzdPm0l/xIx1/rzGrnO6ygjWioLMLepZ9F1EjFWUHyLjs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV0PR11MB9792.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(10067099003)(261026140227099003)(4143699003)(56012099006)(11063799006)(261026121527099003)(261022075727099003)(261021123027099003)(261021121427099003)(261022113327099003)(261022105027099003)(261102123227099003)(261028144727099003)(261009223027099003)(22082099003)(18002099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YWF4MFZzRUEyOEo0N0ZrUkpxRG1pb2NXS01vWjdsSGxPRzhJVzNJWmxMT2pU?=
 =?utf-8?B?YTRYSWhqZ2dJUjJjcmRwYnQ5VUFFcnM2aURMWkNvSG5YWXFCeWpEdExHQ0Zp?=
 =?utf-8?B?dGxhcGpTcTBNSE5mTmUzYkRsOVBzZGxQdHp4VlJ1TDdKWVZDUGZucUxadEJN?=
 =?utf-8?B?N3AyU3Vla3hlLzNDZzdsS3pPU3Z2VS9ubTNRdExNUnY5SWQwMXBOOEpGTWN0?=
 =?utf-8?B?VStNK2NURFY2QURDVGdFc1JTWi8yT0NEZVpjdndwdFViUU5LWnZXenNKNk9E?=
 =?utf-8?B?LzI1NDhtZnh4OEFtZjI0a2tQS0ZlQk5QeVU3RGt6V0U4YjdncmlYZkxLRmZV?=
 =?utf-8?B?VWxhWWdGY3JhclhYWTJrMXpJWFZHeXJsQndFelZSMHVGZ2tqeUc3aDg5OS9x?=
 =?utf-8?B?VUFOK1JXeVA1dXp2ckJ5eFZPR051bkltZnROMXpFWHBIWWxoVWRFWlYwZ3Vw?=
 =?utf-8?B?enloOWxoaEpQQmd1ekZDNEd2ZXN6T1BVbVVmUHV1OUYzV2pOcDIwd2wyaUVV?=
 =?utf-8?B?bVZoMENPaEZyQzd0WUtWTllIUzBDeU5ESEZpdkkyY3N4SUhFZ1dFVHdObHRJ?=
 =?utf-8?B?UFZzT2UwOVFTNHZLRllkVVUwRElRQnNHalYraHpENmo1TDFHb0lIdEJnVnlr?=
 =?utf-8?B?NWpsbE10ODF5Q3g4NzJzUGR2QUtVL1pxVkw4a3o4dHMzM2p2dzRzTGpBeTdh?=
 =?utf-8?B?UitKZGhDV05OSXNlYUlDZWUveGFpQ1FpRFdocC9VNHVINmplbEpPK0FFSHhv?=
 =?utf-8?B?cWoreVNoZngwMjMwQnN4eUI3RzJlT3B6a3Z5cHhqaUdtYjZ0M0huNHhCWXJR?=
 =?utf-8?B?YUhsUHoxKzdoYXg1K0t4OW12bUtqSzM1NDJmOTNWMlFuSkltekR3ejJzMnQ2?=
 =?utf-8?B?TFRFVmNseGxhT1p6dXRTcVZaeGI3WUg0cEkzQ0t1NHNRTVh1MloxMTltL3U0?=
 =?utf-8?B?Y21UdkppRU83M1pMWGJ6SjJGeWd3OUVUVm84bWF0bjJPQXl5dDhSRjdIMVBv?=
 =?utf-8?B?Q3kzTGRGVTlXOVpoNk1xSHNubjB2SXlNbkE0Y2toZVUzVEdHNXF4QmNiTnR1?=
 =?utf-8?B?SUQxSHppRUtMcEM4MHorOGFQcFJqaldxWFJ2WlNVZ3lLT1dEVm1WZ1Qyclk5?=
 =?utf-8?B?dUNwZk9XOVJFL3BCTHdGRVp1YTY5dFhNMFB1cjJNVzJ6bitJSmxwcjJzMWlH?=
 =?utf-8?B?NytWTm5JVWswWE56V2lPTG5YS2ZvSG1VZ2gxT1pHYlZ1QmRabnhrTjZSOE91?=
 =?utf-8?B?K2kvNXRVNUJkUm5DSDZvNE8vOGQwdTFhMktqRlNkOGtpaGtLT0JUOW1BK25z?=
 =?utf-8?B?aUdKNTR2cXVlSkwxUnREbUZqZU1pQXhYaXNsSzhLTWp3N0JKVklEcitXRlIr?=
 =?utf-8?B?UlNyR0tmWGhJTWZGR0g0dEh2SElqbWRhRUc1a2VvdGppQkRJT05pcVNRdS9R?=
 =?utf-8?B?MnhQK1NmN3JFWWlwTGNRMCt5eDl1MkpObFBvR2NwcW0wZlpnK0VlTXJXNkNu?=
 =?utf-8?B?bTNDcHppWXlGcDNSUEYvVVphSkh2TmVHOGdTQ3pvYW9CMUFpVHRtakI4V1pI?=
 =?utf-8?B?RHVneENTUEYvaFliWlpsZmtnTVpsM2F5c1FYb0NwYzlqMVN1UzNrbHNZZm1m?=
 =?utf-8?B?QWdaOVJ5RjQ1c1hhcU9oZzNNM0JBL2hoMVpqNjNNSDEwMU5laGwwM2tvajRX?=
 =?utf-8?B?anlUY2lPTC9lVi9idzUyUVJva2gya0k1VHpNVjRyS1MvMG1RdFU0cDZRMTQ2?=
 =?utf-8?B?alJwNUlBWEJCVGxCS0I4eExpTTgzR254YlRjMGtvWGlxdVVUVm51VzZDSzIr?=
 =?utf-8?B?UW85TVlqakJIbU9oeVJiWVgxOTVyRTlKeURld1VjcDVGWHpSOFRVZTREZ0dt?=
 =?utf-8?B?WHRqY0tnNDlubk1hTU5kYjNpSTRzS1pCeWtZaWwzMkMvekJzeXlnaXhpa3hy?=
 =?utf-8?B?NjRGNEJuL1h0S1JKOUNoaW9UWENZVzJPblFGb0txb0JPbjNlVVBwR1ZlcjZP?=
 =?utf-8?B?cDZGTnpQeElHVVY0MDlkdWlGZis1MkRzaHhjVGFYSlFwVEVKQnhDeXdscFl2?=
 =?utf-8?B?ejUyc3RBaDB1VWlFVjg3ZEZDeWZlNnlwcUsxb1VKaEcvL09xaXUxTlpuVUo4?=
 =?utf-8?B?eDYwYnVRc2YvK0ZSTSt4M0xFQ1lvaENPTmV4c0ZkbVVuQkJDSllZUWRFWDZh?=
 =?utf-8?B?WFFWQ2N5SXA5SHhyREYzZFhoS29JNEluRHVMYnBQOE5zSzZOQWttZzVMOFRT?=
 =?utf-8?B?S2tGUjYwUnhyZFg5QXpKYlBBc0dYUWNrTTg3eUpLd2dVeHVGYVhoWlJMRjZK?=
 =?utf-8?B?aWR4aFBkdEJDajRJcEZnVk12ZzQ3RHpka29YKzU5UzdmS1A4cEQvUT09?=
X-Exchange-RoutingPolicyChecked: bZzBz7ruaYz0a13D6+iM3dBhSFEQr+zQ+GZEEsTJK27NQaBGXiQ7mND1KiIvK7b+NOY+1jBVAQVQ1IC/wtn7cyMP5aBt7z7gC5LL4tkpCBcWOOThtEqsScBR6wXYvKAh4kVGl0LAqnKKZ5+WuS6w9pID8+iltAga4anlB+MxtUm8gkRxz9qN3FTgZNMNBNyLTCvjdh/1MbWZ8ibrzn3YKBM7Ka6qV3rxqvEVDX0eozKIcDq92WpnwE51zDk31ypfC5/8dpUyQWiYRS1sJ35D8Z+o4gSWTNnlfWSOE2bj/wGTL3VJuQVNuwNnxUoJAMLOHLbg+hj51TRdwVwlRUuxIg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e2cd8c0-2c50-4a58-4e84-08df455a37a3
X-MS-Exchange-CrossTenant-AuthSource: LV0PR11MB9792.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 09:56:29.3573 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n0/nP+jjD3fW7dVFcauZZJ4xcBTnJecH7cUw1Gtc8qIh+uL4EnyiH2aryi4sHDKsbSAtsYsRlS/2ruB9mzYOBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB066336
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


On 18-11-2026 11:52, Nareshkumar Gollakoti wrote:
> From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>
> Expose the maximum achievable memory frequency and bandwidth reported
> by PCODE MEMORY_CONFIG as read-only tile#/memory/max_freq (MHz) and
> tile#/memory/max_bw_Mbps (Mbps) on Crescent Island.
max_bw? or rename attribute to max_bw_Mbps.
>
> These are capability limits, not the current memory frequency or
> bandwidth usage. The existing PVC memory/freq0 entries are unchanged.
>
> Document both attributes in the Xe sysfs ABI.
>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
> ---
>   .../ABI/testing/sysfs-driver-intel-xe-gpu     | 24 ++++++
>   drivers/gpu/drm/xe/xe_vram_config.c           | 85 ++++++++++++++++++-
>   2 files changed, 105 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-gpu b/Documentation/ABI/testing/sysfs-driver-intel-xe-gpu
> index 4dc4afc3961d..45a140af965e 100644
> --- a/Documentation/ABI/testing/sysfs-driver-intel-xe-gpu
> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-gpu
> @@ -8,3 +8,27 @@ Description:
>   
>   		This sysfs file is present only on supported Intel Xe platforms.
>   		Accessible only to users with administrative privileges.
> +
> +What:		/sys/bus/pci/drivers/xe/.../tile<N>/memory/max_bw
> +Date:		October 2026
> +KernelVersion:	7.4
7.5 ?
> +Contact:	intel-xe@lists.freedesktop.org
> +Description:
> +		RO. Maximum achievable memory bandwidth reported by firmware, in
> +		megabits per second (Mbps), as a decimal integer.
> +		This is not a measurement of current memory bandwidth usage.
> +
> +		This sysfs file is present only on Crescent Island devices.
> +		It is readable by all users.
> +
> +What:		/sys/bus/pci/drivers/xe/.../tile<N>/memory/max_freq
> +Date:		October 2026
> +KernelVersion:	7.4

Ditto

Thanks,
Badal

> +Contact:	intel-xe@lists.freedesktop.org
> +Description:
> +		RO. Maximum achievable memory frequency reported by firmware,
> +		in MHz, as a decimal integer.
> +		This is not the current memory frequency.
> +
> +		This sysfs file is present only on Crescent Island devices.
> +		It is readable by all users.
> diff --git a/drivers/gpu/drm/xe/xe_vram_config.c b/drivers/gpu/drm/xe/xe_vram_config.c
> index 31a3405c39ab..4b8661b8597a 100644
> --- a/drivers/gpu/drm/xe/xe_vram_config.c
> +++ b/drivers/gpu/drm/xe/xe_vram_config.c
> @@ -8,13 +8,14 @@
>   #include "xe_device_types.h"
>   #include "xe_pcode.h"
>   #include "xe_pcode_api.h"
> +#include "xe_pm.h"
>   #include "xe_tile_sysfs.h"
>   #include "xe_vram_config.h"
>   
>   /**
>    * DOC: Xe VRAM config
>    *
> - * Provides sysfs entries for vram frequency in tile
> + * Provides sysfs entries for vram frequency and bandwidth in tile
>    *
>    * device/tile#/memory/freq0/max_freq - This is maximum frequency. This value is read-only as it
>    *					is the fixed fuse point P0. It is not the system
> @@ -22,6 +23,11 @@
>    * device/tile#/memory/freq0/min_freq - This is minimum frequency. This value is read-only as it
>    *					is the fixed fuse point PN. It is not the system
>    *					configuration.
> + *
> + * On Crescent Island, the following entries are provided instead:
> + *
> + * device/tile#/memory/max_freq - Maximum achievable memory frequency in MHz. Read-only.
> + * device/tile#/memory/max_bw - Maximum achievable memory bandwidth in Mbps. Read-only.
>    */
>   
>   static struct xe_tile *dev_to_tile(struct device *dev)
> @@ -84,11 +90,81 @@ static const struct attribute_group freq_group_attrs = {
>   	.attrs = freq_attrs,
>   };
>   
> +static const struct attribute_group *pvc_memory_groups[] = {
> +	&freq_group_attrs,
> +	NULL
> +};
> +
> +static int memory_config_read(struct device *dev, u32 subcmd, u32 *val)
> +{
> +	struct xe_tile *tile = dev_to_tile(dev);
> +
> +	guard(xe_pm_runtime)(tile_to_xe(tile));
> +
> +	return xe_pcode_read(tile, PCODE_MBOX(PCODE_MEMORY_CONFIG, subcmd, 0),
> +			     val, NULL);
> +}
> +
> +static ssize_t cri_max_freq_show(struct device *dev, struct device_attribute *attr,
> +				 char *buf)
> +{
> +	u32 val = 0;
> +	int err;
> +
> +	err = memory_config_read(dev, MEMORY_CONFIG_SUBCOMMAND_READ_MAX_FREQUENCY, &val);
> +	if (err)
> +		return err;
> +
> +	return sysfs_emit(buf, "%u\n", val);
> +}
> +
> +static struct device_attribute dev_attr_cri_max_freq =
> +	__ATTR(max_freq, 0444, cri_max_freq_show, NULL);
> +
> +static ssize_t max_bw_show(struct device *dev, struct device_attribute *attr,
> +			   char *buf)
> +{
> +	u32 val = 0;
> +	int err;
> +
> +	err = memory_config_read(dev, MEMORY_CONFIG_SUBCOMMAND_READ_MAX_BANDWIDTH, &val);
> +	if (err)
> +		return err;
> +
> +	return sysfs_emit(buf, "%u\n", val);
> +}
> +static DEVICE_ATTR_RO(max_bw);
> +
> +static struct attribute *cri_memory_attrs[] = {
> +	&dev_attr_cri_max_freq.attr,
> +	&dev_attr_max_bw.attr,
> +	NULL
> +};
> +
> +static const struct attribute_group cri_memory_group_attrs = {
> +	.attrs = cri_memory_attrs,
> +};
> +
> +static const struct attribute_group *cri_memory_groups[] = {
> +	&cri_memory_group_attrs,
> +	NULL
> +};
> +
> +static const struct attribute_group **memory_groups(struct xe_device *xe)
> +{
> +	if (xe->info.platform == XE_PVC)
> +		return pvc_memory_groups;
> +	if (xe->info.platform == XE_CRESCENTISLAND)
> +		return cri_memory_groups;
> +	return NULL;
> +}
> +
>   static void vram_freq_sysfs_fini(void *arg)
>   {
>   	struct kobject *kobj = arg;
> +	struct xe_tile *tile = kobj_to_tile(kobj->parent);
>   
> -	sysfs_remove_group(kobj, &freq_group_attrs);
> +	sysfs_remove_groups(kobj, memory_groups(tile_to_xe(tile)));
>   	kobject_put(kobj);
>   }
>   
> @@ -103,17 +179,18 @@ static void vram_freq_sysfs_fini(void *arg)
>   int xe_vram_config_sysfs_init(struct xe_tile *tile)
>   {
>   	struct xe_device *xe = tile_to_xe(tile);
> +	const struct attribute_group **groups = memory_groups(xe);
>   	struct kobject *kobj;
>   	int err;
>   
> -	if (xe->info.platform != XE_PVC)
> +	if (!groups)
>   		return 0;
>   
>   	kobj = kobject_create_and_add("memory", tile->sysfs);
>   	if (!kobj)
>   		return -ENOMEM;
>   
> -	err = sysfs_create_group(kobj, &freq_group_attrs);
> +	err = sysfs_create_groups(kobj, groups);
>   	if (err) {
>   		kobject_put(kobj);
>   		return err;
