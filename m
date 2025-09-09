Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4080DCA0FED
	for <intel-xe@archiver.kernel.org>; Tue,  9 Sep 2025 22:10:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF10610E26C;
	Tue,  9 Sep 2025 22:10:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ito+aUIY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99A9910E26C
 for <Intel-Xe@lists.freedesktop.org>; Tue,  9 Sep 2025 22:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757455810; x=1788991810;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=xFHyCrI3hvPAp2LxgMTJWSo6j3Ankr3fqaqwTMDs/3g=;
 b=ito+aUIYPogow7TPP3VUceRr1f2DqBtGef5LehCFYzI88ln+5znHmi+B
 5IB6pFPwBdjJg9XNfJ26gKV3ahg2nvw7PeKK5j1bgNmuNusb02f3d18HP
 8uxXtjjt9z3X0q2Iymc3ivrtXG/0p9SSn0zKSVIhQT3MwnptvQDnF0oET
 l2DNdV5FPABXfR7ojNq3J2cMmj2o6AQPtUdzI6kKiRA/ekKX7Ab6p0b3F
 wtTmvBRSMT/dE0gOXebkTRn3IIpk0bGyP+Y0LNDv/Y/9RfOdqh+xDAgo9
 wco52CH4DU6OXnq9DEyA37ZbP0KKZ94CXFV4d3ft3q+dzFUx6I7kyilNK g==;
X-CSE-ConnectionGUID: 7lhjpdtLRZaKeYVFGvfCGA==
X-CSE-MsgGUID: iJDdsVobQoyNibL6/A2xNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="71135247"
X-IronPort-AV: E=Sophos;i="6.18,252,1751266800"; d="scan'208";a="71135247"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 15:10:10 -0700
X-CSE-ConnectionGUID: zTXPSiJcRniBHpIX4L4pOg==
X-CSE-MsgGUID: SSgAo4z7RsacI0fQ44ztSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,252,1751266800"; d="scan'208";a="174005615"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 15:10:10 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 9 Sep 2025 15:10:09 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 9 Sep 2025 15:10:09 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.59)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 9 Sep 2025 15:10:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ORA+FXjv0cq1ENyvCbyckLgmqKD5WtbGCK0yYI1CgwC45NG3qw5vomjnMYqJdhViGkrgDSCDPlpT4HgI8O/h5V4CgvZultHSth7rhRzdgdjXMeDv/ekz6XymobyKBod82tu+wWWMU/ibqgq8Slkdvjy3qERXD/9cSk53tRrKCFYWtHb1mwhQ/SagLmffJJlVkck5vfF2dmsPmzlWCqBKlIthwNP3LozECvrkXEL+wzAiwbX9qTxkYry9usykWFq1CHavwAoVaVwy0heYohnLSmr7eX1tsjuJKkr9e1oyNVqkqoPo86rkvtzKH0NW7aX5cbsQuGhxNytyccg3ArlKrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7PsItaV9K9z3QB8EE+kwcmsDuEnkDzhkQgkAb8ZUpho=;
 b=F8cmRbV7iRS64GFmy8bN6y2O1t1pHsIe2QxAebRv5iowYDbqAerbBOsJJ/60XjUx+PS00DQ2fQbEhVohPqH9dQgEiUU/onkwx4TP0AWmkwt9M4zZqvo8rK1EtTfeLhlOXwmw1IsLmNmd4tFkGKalYW0kh/7voSSIMJkew8dZIQtoVjDTReKO9BigmerzbgWhJGT4rYLbJ4mJ+rYxCNMn+aotbPth/udEDNhleGNIYGHJolFDJhZVTQHA1KsIyXNTXS+xfdfBZFL4zcDt8erToQEf81Iu5pT7Fy95gY5wr0G8wLKsbVkEhwOgx6nI/eL8nFUIbYE9tbH+syK7HQjfGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by PH3PPFCE69B97EC.namprd11.prod.outlook.com (2603:10b6:518:1::d4d)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 22:10:07 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%5]) with mapi id 15.20.9094.021; Tue, 9 Sep 2025
 22:10:07 +0000
Message-ID: <a9b8d42c-bff6-4faa-8b9a-5fb447d248b1@intel.com>
Date: Tue, 9 Sep 2025 15:10:06 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] drm/xe: Allow freeing of a managed bo
To: <John.C.Harrison@Intel.com>, <Intel-Xe@Lists.FreeDesktop.Org>
References: <20250805234256.1021020-1-John.C.Harrison@Intel.com>
 <20250805234256.1021020-4-John.C.Harrison@Intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20250805234256.1021020-4-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR08CA0006.namprd08.prod.outlook.com
 (2603:10b6:a03:100::19) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|PH3PPFCE69B97EC:EE_
X-MS-Office365-Filtering-Correlation-Id: 637e715a-813a-42f9-b92d-08ddefeda2bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ejk1NDJ6VVRkN25wUlVlV21RZE1wckdvRXRkY0svMEVTMXdaeWI1bVc5RXNJ?=
 =?utf-8?B?K3NzMWV1VS9pVWllRlVVYlZhTG96ZCtqTjhLbllTZG5BTG0vWjNLTkwraWhY?=
 =?utf-8?B?WTg3MVZuT3lQZGhrYXg1bVFKWm5hM1pUcTgzL2pBSlAyM1RTdi82VHpKOUl0?=
 =?utf-8?B?TVFsN1RCMTlvekVsUWhtSmdJQmFCUXBiTllMRWNCWWdwS2FhUDQwZ1VsY0ZV?=
 =?utf-8?B?RDAwMjNDc0pDbEdRbnF4MzJ1aHJHSDYvZDZqYTRTd21aRzdQeERxWWMrNUo1?=
 =?utf-8?B?SnJJYm9ZRHpFZG9NeEdnc2ZlVUtrRStZSWxrWGtwOU8yM1MyNXMwNDhrMGg1?=
 =?utf-8?B?cnJRYzRkZ3FvM0k1OXFGSzJJY2FpMlVYOENvc2Mrb3pEd3pBNnVNNWpEZnRW?=
 =?utf-8?B?bUw5R2tOVjVnMGFUbXo2TmxNMnVoUDlqYm9sTmRPNjdjMTJvMDRIN3o3c1Jt?=
 =?utf-8?B?aGZJSlRyUEF5U1M2ckNwL0FVdGU5bThoNWU2TjFpbm5wNTJpUExuL21GU3Np?=
 =?utf-8?B?ZmltQjEzTzRlZGhjR1ZjN0NDelY0VG5mdmxpOEFCNmlDb3FpNTFJSFNvd3Qz?=
 =?utf-8?B?cC9UdlhDZVdDenJJS1gxNjZIaERFSUxhb3QveHgrNjFBUnBZSE5idWhPelNk?=
 =?utf-8?B?Sit1Y3JUYWhhdGJkc1NyNjA2R1V2eG9SdUcxUHhucVRVaENyNDd6c1Bxa0hI?=
 =?utf-8?B?Z3ZHbk5FMUkzbThjQXhLajBNbmV6Zlo4VG9Ec1lyVjczSkszRGh4Zi9scUk4?=
 =?utf-8?B?RGlIRDB3QzBNL1pMZm5TQjBUdi9nZ3I3RmdCQzM5bkdHNmVQUi9SVlpCdVZR?=
 =?utf-8?B?OWhSM3FkaXI0ZHZCaE9FbkNMeElWMkR5SGlzK3pXLzFjTkpKQitwaWRmMHFY?=
 =?utf-8?B?eHFPMys4b1cwUlptbU11K1ovZG1UcUVuS3RGSU1QWFM4RUJnVm1DSUYvVnBN?=
 =?utf-8?B?ZEZHK2d0aXdSQyswdklBNnZLUEFqVE8yaEVpVVZHRkJDYW9BdTlqVmhHMUJH?=
 =?utf-8?B?VlhPdFUwVitYcjN2b1JSamNqZ0F3UVhndVBjMllTNndqWHBqZERtajlHb1h5?=
 =?utf-8?B?UGg0U1Bjdi9adC9rMzF0aXBRSk1WQkxBUVVaYmZkYXEwNWN1eVRMRWdOZEVM?=
 =?utf-8?B?cW1ZblFsUFdndHI2ZDVqYnJ6ME4vZHYydFZ3WEhWMXZSWHFWQ0JIRUxhOUJY?=
 =?utf-8?B?TlQxclJuMExTS1IzNElSL3FRWnZOWlFhUTJDd1lUd0l6bnBMOHJMRXJ5eVB5?=
 =?utf-8?B?RFd2WGZhVHA4bjRubEV5YWx2RzFMNDlxRUlDZDBMZ2lVR3hiZmY5akVXSXkx?=
 =?utf-8?B?dEpXcHhqVW1ySWVNaDJuY2tTTlEzbUVWOUxqZ0NqYVJxNk5lR2ZHKyt1a2VN?=
 =?utf-8?B?cDFESVErV1Vad2RSRGVpNUpxVG1xaUR4Z3hJRkkyVGcwWTRreTZwS3pQSzRo?=
 =?utf-8?B?QXVmc1F4ekdCWnNMRHdMSk1xSXkxZGt3ZmhrcXYxUURSbmVsSERCTlJLbHdh?=
 =?utf-8?B?RXBSbFAyT0M5MDdiMzRwaTRqSlNjWFlUQzE5V3BFa2VPWmdNanpobytiaFpN?=
 =?utf-8?B?WlBSUmIzQzIvTlliSFJiSkJ4STBHMXQ4SXVscGsvUFJ4cGNUM0JkYlFPUDRL?=
 =?utf-8?B?MVNQR0dZRytwenJiSDM4U3FZR0xlemNpb2JQcUZ3ZHYrY2VPckNDUmhzYlRp?=
 =?utf-8?B?OExjb2RNckpwWVRjYldOWjZWSUJQT2VXTW1pYmpiT3dyTW9iZmkvSGsvV0cy?=
 =?utf-8?B?bEN0ZTZkL2hFTXgwVFJHQUJjM2RlK2R3ZGI0bnV0dWc2ek91VEJTSndlWGpY?=
 =?utf-8?B?K2JPZWxSSVR5TlpxMTl1dkFqcFdiTm9PMzBmWUZ5UkJVWnRaUnpCcFg5OWtF?=
 =?utf-8?B?YTd2N09wWnBYRGJKVEdiOFRiakMzcmNEdHRsRythRWQ1Rlh1YTNKU05HY0k4?=
 =?utf-8?Q?MnXfAsxOn4Y=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bVViOEdIZGNGUG1iUko5SGZjcVFYZ005WHBQRlZZc2VaZTNWTVF5d21LTlhl?=
 =?utf-8?B?dVFYY0F4V0VaYTNZbVNhVHZFeDdSUjRBbXBzT3hIc1pieGE2YTF1ZmFPMUo1?=
 =?utf-8?B?ZEIxVmpXdC9lR1A4Yy9PTEQ0Wm1uOGRZUXRsVjhEaFBZWXFqcEhhTFE2WkZL?=
 =?utf-8?B?NmlqUXdRYndxTURFbTY5bG50dTRSbWFDUkE1RWlrajJXS1FZbEhnUnM5WFdl?=
 =?utf-8?B?bk9RU0lNRlVjL3ZWa0xucEZtRWU4U09TOVIrY1ZhOUR2amtZTkR0ald2UlNa?=
 =?utf-8?B?RHlrZEp6ZUU1NUIwNE52clZsc0hTbE1iMk9LUE40eE9qU01zNk81V1NaaWF4?=
 =?utf-8?B?Tnd3SW9nVktoRDgxMHB0TjVQN3l0ZUJtSmVrb2l6MHRxWjBnNGtwSGc1cmZo?=
 =?utf-8?B?TnhHbDFtNGZob0s1ekJMZmJwbFl4dE81dzBnVTl5bVM4ckNDYlU3RHZMV1lw?=
 =?utf-8?B?OTQvNGZ6Wk1NZ1o5ckxhUkFXbFNBc3YwRFRHSjBocmZCRld3Z3BOVmV0MnVD?=
 =?utf-8?B?NGZSSC81YllJSnBiVUI1ZlVVYkpRWld5TWNSa1J3eWRucWluYTVuZUM0MTVr?=
 =?utf-8?B?WFZtQm5vckFlalpEVzBXdkR2ZzVudkptRmFVaUE0eldUdUdjTFpaRitoRjJk?=
 =?utf-8?B?VU5BNWxiVGRBeXJlcTBzdnIwL1VtUkJxdEM1b0Z0TVZDdzI0VGlLSVFjTVdV?=
 =?utf-8?B?MmxDc2c1ZXRWOWlVQm1jY0l0ZTdZdTlBY3hXbkRWR0RUNjB3WlhCZWxxQVdP?=
 =?utf-8?B?YXVSVG1PdGVBS3pLbmUwNG10VXNrR0RQZ3Z6dHFYTE5nVlF1dEgxR0RQRi9O?=
 =?utf-8?B?MHBqNmF6QnFJOHlDSk1WSyt6dExLUkhZdFM3L2hxQmNKdlFzUjdJU09uVHJX?=
 =?utf-8?B?VHpuM3RvNkJjTGVWbEt4RjY0VlVQbllqMklhWEFDVE80U1NGWk5xMlN6N1hk?=
 =?utf-8?B?bWVpQWRPcTI5dFlSWUlCbGVsTUpPNGdYbUdadldDdzRZenk2SG96TU9ucUhM?=
 =?utf-8?B?MzdHYXBXMzFtNDl3UzVqaUM0WTZnVDh1aGc0MWJIRUcwZGdmOXRyOTU3ZGlZ?=
 =?utf-8?B?enE3dVM3WVYyV0o3eVBrSjZ0QmpwNXhwMCtxWk0wR0F5VXlXSTFrem9XeTVM?=
 =?utf-8?B?UkdseWhKaWE4cjdiYWJOek8xL2FYU2ZTVVZ0RTVLYkovK2VqYTVlUHhsN3JF?=
 =?utf-8?B?THVhWEtyT0NuWEJydE8yZHVQOERMRWJHcTVtUGR3elRTSGZHN1pVV2owYjM2?=
 =?utf-8?B?N3NmWjYxaFRjRXNxZnduSXZIWE4rNUJRSTZFNSt3WEhVV0FxMlhMa0kzdldZ?=
 =?utf-8?B?UGdFZWNPOHhrTjF4YlM5Uk9TYktITGFFSzNHcVA3SVBlS0dWak9KdWVURXlP?=
 =?utf-8?B?Lzh3NzJmRnh1Yzg0elRtblRJYkpNaFUyQVRFMWxUQmI5UFgxV0NKZk5NRDJv?=
 =?utf-8?B?T3ZBUkZHbXVBK2Zoa0kvL1VvdEdGN0R3SnFabUVrdzhsOXo3RDFQTjM1cTZz?=
 =?utf-8?B?ZVp5R2VObEtWWGZ5WXB4bU5XZjFreDdKaTNlSEdvaWV1M0pzdDNPZ1hPMmxN?=
 =?utf-8?B?ZDFEdTQ4c2k5Um9OVjE5QnZzOTFGWld0RGw0Q0dwVmNFUzAxUTYrVStBOXZT?=
 =?utf-8?B?Q2JZL1NydFBHam9BbFY5RGxSem0rUEdpbW5jbmpiNVQ1dlh3Tk9WZ2tnNFBG?=
 =?utf-8?B?U1FRRmdzUW9uTjhjWlVjTTUvTWw4Y1kxdXpSVDBWSmhtdVdFNmV6S0hyUEEx?=
 =?utf-8?B?QmVkdGdTeERpTHlibExHNzJGemVjNXF0a3hwZlBFWEJldWlMb0tjSDBuQk5I?=
 =?utf-8?B?TmVLRTJKQkhvWUpmOEpMWmM0NjQ0eFZoRENVYTEraWFscEkycmZ3cGpHQ3Vr?=
 =?utf-8?B?MkJVZVM2ZnkwYklsMjZ2WER1eC9JRVhTdjhHM3V6WS9oVzgrTlVYRERzYWY0?=
 =?utf-8?B?RSsxZVVqSnBNamFNMmlxNHVYcmliQU9MSTloV0NtTmRZM1Zwdk5LKzU1dXk5?=
 =?utf-8?B?SURQcERzaisrZWJYVkpxRXVFVVYrVVI5TDZMNjlTbG5qLzU0LzgxRmxxRVFU?=
 =?utf-8?B?UFlWZmRzcGlOZUkxdkJHS0RaRDQ1YXhwWndyMDRRU0tDL3Rrc1ArR2ZXRUdW?=
 =?utf-8?B?L0Q1MlZURE5PTjZGSXFjYVlRbTdycUxEcHpwMVRGQ2ZTaDBDRmhvRXhwVnhC?=
 =?utf-8?Q?qbSbPn99NbFFidtP7gdA/8g=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 637e715a-813a-42f9-b92d-08ddefeda2bc
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 22:10:07.4395 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7cmKP07UJe3C6uWi5PN7NwgTTAZD7aJLw2IICesxUm5RroFs3nmNDN1oVaHOoQX3ptMbepiNoX9WIwSswocDqYcXZB413Im2VYNozLtqvB4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFCE69B97EC
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



On 8/5/2025 4:42 PM, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> If a bo is created via xe_managed_bo_create_pin_map() then it cannot be
> freed by the driver using xe_bo_unpin_map_no_vm(), or indeed any other
> existing function. The DRM layer will still have a pointer stashed
> away for later freeing, causing a invalid memory access on driver
> unload. So add a helper for releasing the DRM action as well.
>
> v2: Drop 'xe' parameter (review feedbak from Michal W)
>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>   drivers/gpu/drm/xe/xe_bo.c | 5 +++++
>   drivers/gpu/drm/xe/xe_bo.h | 1 +
>   2 files changed, 6 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index ffca1cea5585..87aa0f5b2b2a 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -2222,6 +2222,11 @@ struct xe_bo *xe_managed_bo_create_pin_map(struct xe_device *xe, struct xe_tile
>   	return bo;
>   }
>   
> +void xe_managed_bo_unpin_map_no_vm(struct xe_bo *bo)

Not sure if the "_no_vm" postfix is the best choice here, because all 
managed_bo operations are without vm. But maybe better to keep it for 
future-proofing, in case we have a vm-enabled version later?
Since I'm undecided myself I won't block on it.

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> +{
> +	devm_release_action(xe_bo_device(bo)->drm.dev, __xe_bo_unpin_map_no_vm, bo);
> +}
> +
>   struct xe_bo *xe_managed_bo_create_from_data(struct xe_device *xe, struct xe_tile *tile,
>   					     const void *data, size_t size, u32 flags)
>   {
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index 8cce413b5235..298eef403505 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -122,6 +122,7 @@ struct xe_bo *xe_bo_create_pin_map_at_aligned(struct xe_device *xe,
>   					      u64 alignment);
>   struct xe_bo *xe_managed_bo_create_pin_map(struct xe_device *xe, struct xe_tile *tile,
>   					   size_t size, u32 flags);
> +void xe_managed_bo_unpin_map_no_vm(struct xe_bo *bo);
>   struct xe_bo *xe_managed_bo_create_from_data(struct xe_device *xe, struct xe_tile *tile,
>   					     const void *data, size_t size, u32 flags);
>   int xe_managed_bo_reinit_in_vram(struct xe_device *xe, struct xe_tile *tile, struct xe_bo **src);

