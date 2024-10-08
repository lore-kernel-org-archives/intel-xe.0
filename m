Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFE4DCEFC38
	for <intel-xe@archiver.kernel.org>; Tue,  8 Oct 2024 17:50:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C14910E1BA;
	Tue,  8 Oct 2024 17:50:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HJJcwrNy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF8A410E1BA
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Oct 2024 17:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728409805; x=1759945805;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4NRqV8ygZcEUl6Bsl8jcVZC1ty2KDDkSfyO2b6j4Mrs=;
 b=HJJcwrNytfvrQzXzZ41avL0LUheEfDwE2S4ihMTC8uLl5KN9ayq8q4R5
 /ii8zzbxFt/mydwWs+h/nsXoB2Uxz7raQGoibCT31KvHDYdwUlsgi4BVj
 VYGS6fhubsq6cyOs9GYY++myC6qR9wAsTDgb4/wRsngZCHCI5D63IxCzd
 ZnGbbOD2JO4COYKbR8csZOVMvE7RyU2Ta9OJWMicPVBYDkBdCJQy73oVs
 NwC7eV80vI2JzlooFDns1irtILx0yEIzeX8so/Dc6+MLjk/PsOrFs5/PV
 s5Oof/0oNsjvkpQzlUiNsOZSMUbWiPFErGtQBNZuptXYfuP5bOH7ealwW w==;
X-CSE-ConnectionGUID: q60Qt4ymRDebiyB1sgrgRg==
X-CSE-MsgGUID: 9pCPcy4aQR2OHzx/nNrvMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="27757179"
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; d="scan'208";a="27757179"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 10:50:05 -0700
X-CSE-ConnectionGUID: RdxdirafS+u3p3YIQ8ux5g==
X-CSE-MsgGUID: xj7dNroMQo+H3PR6U9qtsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; d="scan'208";a="80779093"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Oct 2024 10:50:04 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 8 Oct 2024 10:50:04 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 8 Oct 2024 10:50:04 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 8 Oct 2024 10:50:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kpGIH186P+VQntNHdz74vaaCC8jp8DP0zc8tgnvsorciRarjwzzI+VMES++3oJB82jHwyQU4QXviRDfvCynzZ2bL2obxF1KMBsSg2rx3DRBXqMfjq2UPmAj+9J1meyDCE7AkYSlq/IqtH1ldS1qBusjk3X2foK+f7nHwFfva6Z5foa6AEzP13lCQ1qtQ5wUWW6zX4s2p5kSBrJ3BQHw3+Ay/SSAqLFAzv6x9IoUXA+RLFCiAbU+O8L400I/hfhPba+/JkTYdyXNpsMt862xnvlxHKWUEVIyjAvYnW0NJ4vwKyz/kqjcpc6n7THcvIGi1N49N5lOVRIX+yFwMb1/EWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lKnF/dGg266oPgvmkW5gZFNpfiXPhkoeB25EF+LpMmA=;
 b=Z/w/CcAEjSubDWKjtOCVVEq6b70Tte+Y5F3M4DD5Olu92C7OvRQ7MUEqgasosjSPjStR7M8QXPCW4kDPm/DfoNCgZM+McDIygyOI1H6IwTBAIOHNH5/dvPU3f6OtBiutC3QijFlZqvqtf3OjPuczYpfbgKS+wh2kuLwxNWvpRg4cNB1gDzJjUCLlFM8YwzRZ+X1Zxj/xoYUs6CQ1LhKcObCtQ5SJthv8HVrs5+FMBcyplh3+n/BlpkOzKjnFf1PDuOrkh/a9nMoFgjqof3y3Ce9VppC+/RO2KYztlbVUrj/kFtnwuF8Cd5hC7fW68qZoluCUV2BDenv/FZjbsfwl7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV8PR11MB8607.namprd11.prod.outlook.com (2603:10b6:408:1ec::18)
 by SJ0PR11MB4928.namprd11.prod.outlook.com (2603:10b6:a03:2d2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.24; Tue, 8 Oct
 2024 17:50:01 +0000
Received: from LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::55b1:592:df13:a9f3]) by LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::55b1:592:df13:a9f3%3]) with mapi id 15.20.8048.013; Tue, 8 Oct 2024
 17:50:01 +0000
Message-ID: <d03ace74-4158-4881-b5f0-8efdf4d7029d@intel.com>
Date: Tue, 8 Oct 2024 23:19:55 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] drm/xe/xe3: Define Xe3 feature flags
To: Matt Roper <matthew.d.roper@intel.com>
CC: Matt Atwood <matthew.s.atwood@intel.com>,
 <intel-xe@lists.freedesktop.org>, Haridhar Kalvala
 <haridhar.kalvala@intel.com>
References: <20241008013509.61233-1-matthew.s.atwood@intel.com>
 <20241008013509.61233-3-matthew.s.atwood@intel.com>
 <7a77f979-5743-4626-8307-d5bbe5d3450b@intel.com>
 <20241008161512.GG4891@mdroper-desk1.amr.corp.intel.com>
Content-Language: en-US
From: "Chauhan, Shekhar" <shekhar.chauhan@intel.com>
In-Reply-To: <20241008161512.GG4891@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1P287CA0017.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::36) To LV8PR11MB8607.namprd11.prod.outlook.com
 (2603:10b6:408:1ec::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR11MB8607:EE_|SJ0PR11MB4928:EE_
X-MS-Office365-Filtering-Correlation-Id: a9ef00e8-6dc6-4be3-9064-08dce7c1a1ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cUtiUWYxOUVCeHhETElFUFJ3RXlsYm8wTWdoQ3hoV1FORDhLbTd3QnlRam1U?=
 =?utf-8?B?N0ZXVFpJZlNDcVpqUXVQYWhTR2p2NTNqUE92ME5LeFlGTit0QWVGQWppNHJp?=
 =?utf-8?B?UkVDSDVJcmxlUWY2TGI5SUNmNjBrc1JjRWlycFFlcUdOajVkS1dTa0NaeVRJ?=
 =?utf-8?B?N2tTWElMell0ZGwyNlNCRUx6ZHRRZXpTcDB0K0cxMUpkcnVDTTFGUkdJSGIv?=
 =?utf-8?B?RUs4RjJ6TXNLSEJVRHZ0azdjYmZUN0pFUHpKdkpsMHEvRThsWE0zQ0VqbVJ6?=
 =?utf-8?B?MklsM2JlT0I0enN2VnBqVmpsZUpPWUNvOXUxMnU3Qnd6NU1IRVBXV2tRT001?=
 =?utf-8?B?M1dleVJOOTc3MkJxbXpEM250TXJSaitISmZKNDZSaFJBZEVYTE5KUy9ZaUor?=
 =?utf-8?B?UEpkeUNTcVFWY2hwMXlLU1VIZ3RYRS95TDhBQmlaMm9WVk9ncHNXTnlsSnFt?=
 =?utf-8?B?eHBqSklTZ1NKOEpGdkZRTGtROFU3YjRFcnZ2Y2V2eWtZaXFFMFB5R01ubDVT?=
 =?utf-8?B?c1RwZHRxN28rNWw2eDRWOEQyS3VROEpaWHpIOFV0M1B2b3g4OGRkMGNQZ2ty?=
 =?utf-8?B?aEJXVHRrSHBDZUFKd0ptcXF2OVhSelVqN1NDd0FCVHhNakVEUStLOXlRREQ5?=
 =?utf-8?B?S0MrOWc5cS82NGljc0Y0aWJjdGtWVFZYK3kzeVBoQUxVNE5YTEF3U1VZUDV3?=
 =?utf-8?B?SHk1YTg0RldtNW54b21PTmpPSUU4cmp4c2hDZVI1U1M5K2tzbFczZi9TQml6?=
 =?utf-8?B?VFhZNmNOcmlCa054M09od3hpOTYyUGNXMHJUMG14Y0NiZi9hZHV1QytPbVN0?=
 =?utf-8?B?OEx6R044bW8vZHRJVUJ2cVBDUEFkOHFESDhub2dndFZud2tVSThMcUZXZG5p?=
 =?utf-8?B?cDRQc2FTYUpScWFkclkvQnNYNEw0QVN4dE5PbW43UGVyQ3RHWlI5TkVpSnVw?=
 =?utf-8?B?ZFliMzV0MDhneExQcjhnTk9yUGlYSE9UUmxrZ2JITHRWSXdJcGFtQWlRNjYz?=
 =?utf-8?B?L2lLdGZzUWpjcHdrQVk0UmdWU3hHekJDTVVmTzlYUnRTNVRkK1pVSHRWVVFZ?=
 =?utf-8?B?UnI3QUxqb1UxbWZvUEJma0tUd1NPZ1k5NjF1eDh3ZVhsR21wUEFiekRETWhS?=
 =?utf-8?B?Vy83OVZmVnFOOVlMQm9DRTlQb1R6UzFGSGpqODB2cE9VODFFMkJtbkZTMVNL?=
 =?utf-8?B?RnMzRUpGM09ibUgwVUJsZTVMbkJhZVhIelBlUlFhcU1CMFZocStxSUZDR1V0?=
 =?utf-8?B?SGdRVkxId1JPWkhXSlp6bU42UW4vdjBUV3JGVXRpRWUyRE9zU08zUzZGbVJC?=
 =?utf-8?B?Z2ZDQjZ6eWRzdnBoUkp2YWtkanN6RnlVKzY3V1UzaUZjSUZuTkNGWTBFTWVW?=
 =?utf-8?B?czlUT3Y0cFhab1JaVUtyREZnT2dLbldzbU9CTEJCSVplMUNGbWV1WTJOZStJ?=
 =?utf-8?B?ZkZYZUxzWjlEeEJxbXJKeUhEeGw5eTdkN0F5RmFuSUxZbmkwU3Z3S1JsWkkx?=
 =?utf-8?B?dHhKcXlvQkF0Zzlwa1JzbzloNExNVU9HdlBWUG9sVDBuZml0YnpZQ1UySStP?=
 =?utf-8?B?cmFuRkNBcGhiK0FmRk9uUnBtdi9EZzVDUVRVcjBMVHJsNFlpNUZKc2xxQklD?=
 =?utf-8?B?ejhraEdSRDZKdk5XMm9xTGpUbUxlanRjZGpwWm9qYndrdDR0WDRsSnhOWTBq?=
 =?utf-8?B?aHMvZTJQdzVzbk5YbnNrTE9UOHgxSG45YmtRSktyS245bFRzWERNa0tBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR11MB8607.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TS9kZ2RVaTdvUy9MKzV1S1JseWpLUS9ZeG1RMVR4NGRPY2pKOUpXNmxJMDBn?=
 =?utf-8?B?Q2N6Zy9yYXJiWDduQnhQSDZPa29sRVZTRnNQNUVlUGNOUGw0OTNURDhtVHZt?=
 =?utf-8?B?MGhRTStSSzB0ZUlycmNYWFd0b1AwbTZXcTFPT0tMS3JjVmtQQ2FzT0RDTE5D?=
 =?utf-8?B?VUorYTJweU5YN3J1SmRtcDh0ckQycSs0M0NiZUxyUXV5N0daVkhTd0ZqaDlo?=
 =?utf-8?B?Uml1NTllZXJXRWprcXIxWExLQVlNR2tSdWpjWFQ1ZXV6WlNOd1FENDZCTW1V?=
 =?utf-8?B?VXZtdVNnVlpaMlNkUzR2aGczV01ER29vT0hJVzZiMTlCbUFFNjgrM0xkQi90?=
 =?utf-8?B?TkdJN2xnTjBwWk9wQ0JZRUpUb1U3QnB0N01Pam1HVUkxUmpjMGVya1p1YnlU?=
 =?utf-8?B?dzZBdnArd2Q0bUhXa0I2Sk9VaHgwL1ZhS05tZHdGbitidUZHY1hkR0hqd1Y4?=
 =?utf-8?B?WDlXMW5BWTlkNVBPbVprK0dyVGlzYVdxK1JrVzYyZy9jbjIrK2p0OHdXR21T?=
 =?utf-8?B?Uk00UzNIYzVKdDBYM05SQnA3NU9zOCthYlFjdGJjYWNNaEpTdVhHRkFJckpP?=
 =?utf-8?B?Y0dWbFJsOUc2YjR5clBtemN6c0ZaaHJKcytPVFdPMGpUSFZIZUVGVE43bVl2?=
 =?utf-8?B?MTBFaFhEbVoxdHAyRnlMRDNKOG5NN1JyS0Q3THJYMlNhcFkyTUY2bFZCWmNW?=
 =?utf-8?B?VHlqWHMvQkJ2Z3BDLy9Od0lyd2d2V3NTc1NiOWZOQVdJamFEMXJJamttQStI?=
 =?utf-8?B?QzZQR2JQMlJER2hqUWFaT3c4OUhGb3VzQ2xkS0gzOUZ5dktwaTB2dnR2b0dE?=
 =?utf-8?B?S1g1N0lQeFBPdFBVUURIMHg0QnpVSlJUTUJ1aTdXbGhCYXdBY3cxU2NiM2pY?=
 =?utf-8?B?Mml6VERUZ2twc0dQdUFVYndZUlFZdElpeVBKT1p4dk1PK0U4MWJZbUVCQWYy?=
 =?utf-8?B?bFg1MFNkS0s3SWxlb1hsVlZjcGFtVTMvdE1tRm0wZkRyN2d0d2FaTjVZVWdx?=
 =?utf-8?B?b1lBVlZlVkRkWW9IZ0VRK01HcldNU3JEVUxnRHpaa0Nvc0NMQUdCYitqSVdT?=
 =?utf-8?B?aCsyUEcwTFhlOWt4Q2wwaFYxdDBlWjJqQTNacW5xdzVMa1hhTHQ4RzFrdWg4?=
 =?utf-8?B?OHhsNG8rVy8wWjlrd2FiSWt3ZU9pSVc4RnR1b2xmaFJrQzZUdDg1eUYyMDZJ?=
 =?utf-8?B?Y2xFZWs0bVl2SmdnQy9mMDdxYVQwd2FTOGFXYXlSTDFxMm12dG9rTXZzaG5k?=
 =?utf-8?B?RlJGNWlhZU9kM2ZjR0paaC9sS0VvT1FpVkJvZDlFa2tNdWVBaytRWTNIemd3?=
 =?utf-8?B?NUc0VUZYSjhhcWwzcFdLL3d1UXZ5bS9zY041d3RQTWR6ZlNRRE9zTzlwWXdS?=
 =?utf-8?B?MlR4cUhiajJ4RnNVTHZGQkU1V2w0OWJmWU10NUhzOGRVQUV5OVFCWjdDaWJG?=
 =?utf-8?B?L3FFZkx1K2FGTFU3VEpITHZiYjdvUGhaVUlXVjlXVDIxSlVFYzI3K1JMVktv?=
 =?utf-8?B?N283R3E2TGlFQ2x6cXZSU3NBR2I0M0pvZmRReHVRMWU5UjdoVjRSSHBpVDd0?=
 =?utf-8?B?cGp2dlNYaUdzZCtsMlpDRVVLQzVLWDVOcEFpT29sbWJTMUhJRVdyT2s1bjRm?=
 =?utf-8?B?cFBmeDhNUlZLRWc0THlIbHVyL3lvcWltWUpJNkJZWkp3QUdTQ3FnR2ZuVmIr?=
 =?utf-8?B?Nm8yMHEzZjc4WHhUYTV4MHloK3BYb2U3dWtYRUt5V3VFcUp2Z3VjN2pXeFor?=
 =?utf-8?B?RHhrUjNKNHUvRG5SM1lGZjZmOFpNMkd6MHRiQU1qSG5pNWlTblY0L1lHY0Iv?=
 =?utf-8?B?b3I2SzkxRmI3UjhoSjZUbEpLM1RVWXMrcks1WWNNTytsaGg2UVlIVFNWSzhs?=
 =?utf-8?B?ZG9lZlJpVVZSbzJsMVB1UFVRQkR4dDFCT0lpQ3pvK3dZOGJicVBWTnM1VXdu?=
 =?utf-8?B?WG11ek5FNXRpejV4d2xycVR1M3paZ1l3RGkxeGp4R2g2VE51N0lBbnhzN1FW?=
 =?utf-8?B?Wjl0eWtwaWRmSjVyeDRHbXd6NmdUQ3QwTHFWRk56dTlmeVozOWgyOVU3Nm5S?=
 =?utf-8?B?K1pHbjQwTDh1eGIweEo1YldmT1BZaksxYXVXUm5WMkhWWlRiamQxL3dvSHl0?=
 =?utf-8?B?aTIyRGlNVDRsTlpMRHRGb3JrclROTkVKMW1tZlhQNWFVVkhSaUNOQjVTUFlU?=
 =?utf-8?B?T0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a9ef00e8-6dc6-4be3-9064-08dce7c1a1ac
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8607.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 17:50:01.3489 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uAxAJEmbp7o6eyTSbKsX8jF4N8EKq0Qx2Pin3DIk4NrMYYFH7MLCocWulZxbnr8INtAvE4Rw152qNTh9DLcLLaqOvsdeqUlDyUHGOf1tPAM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4928
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


On 10/8/2024 21:45, Matt Roper wrote:
> On Tue, Oct 08, 2024 at 07:53:00AM +0530, Chauhan, Shekhar wrote:
>> On 10/8/2024 7:05, Matt Atwood wrote:
>>> From: Haridhar Kalvala <haridhar.kalvala@intel.com>
>>>
>>> Define a common set of Xe3 feature flags and definitions that will be
>>> used for all platforms in this family.
>>>
>>> The feature flags are inherited unchanged from the Xe2 (XE2_FEATURES)
>>> platform.
>>>
>>> Following B-spec details inherited from Xe2 feature flag definition
>>> commit.
>>>
>>> v2: reuse graphics_xe2 defintion
>> The patch itself LGTM, but since we're re-using Xe3_LPM with media_xe2, I
>> believe we can have a v3: Reuse media_xe2 definition. Also, there's a typo
> That wasn't a v3 change; this patch has been using media_xe2 since its
> original version.
I meant with the v3 being sent and then there were back and forth 
changes, might as well document them.
>> in the above graphics_xe2 'definition'.
>> Both of these are minor things which can be addressed while applying, so,
>> with that,
>>
>> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
> I think you copy-pasted my r-b here by accident?
Ah, nope. Your review did most of the work, mine was an overview. 
Henceforth, I didn't mean to "take" it away. I've done something similar 
on the other patches as well in this series, where most of the review 
was done by you, but then I had a final look over it.
Let me know if this isn't allowed, i.e., having 2 reviewers for a patch.
>
>
> Matt
>
>> Reviewed-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
>>
>>> Bspec: 58695
>>>    - dma_mask_size remains 46   (not documented in bspec)
>>>    - supports_usm=1             (Bspec 59651)
>>>    - has_flatccs=1              (Bspec 58797)
>>>    - has_4tile=1                (Bspec 58788)
>>>    - has_asid=1                 (Bspec 59654, 59265, 60288)
>>>    - has_range_tlb_invalidate=1 (Bspec 71126)
>>>    - five-level page table      (Bspec 59505)
>>>    - 1 VD + 1 VE + 1 SFC        (Bspec 67103, 70819)
>>>    - platform engine mask       (Bspec 60149)
>>>
>>> Cc: Matt Roper <matthew.d.roper@intel.com>
>>> Signed-off-by: Haridhar Kalvala <haridhar.kalvala@intel.com>
>>> Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
>>> ---
>>>    drivers/gpu/drm/xe/xe_pci.c | 5 ++++-
>>>    1 file changed, 4 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>>> index 7ffee06fab13..2139edba9062 100644
>>> --- a/drivers/gpu/drm/xe/xe_pci.c
>>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>>> @@ -208,7 +208,7 @@ static const struct xe_media_desc media_xelpmp = {
>>>    };
>>>    static const struct xe_media_desc media_xe2 = {
>>> -	.name = "Xe2_LPM / Xe2_HPM",
>>> +	.name = "Xe2_LPM / Xe2_HPM / Xe3_LPM",
>>>    	.hw_engine_mask =
>>>    		GENMASK(XE_HW_ENGINE_VCS7, XE_HW_ENGINE_VCS0) |
>>>    		GENMASK(XE_HW_ENGINE_VECS3, XE_HW_ENGINE_VECS0) |
>>> @@ -360,6 +360,8 @@ static const struct gmdid_map graphics_ip_map[] = {
>>>    	{ 1274, &graphics_xelpg },	/* Xe_LPG+ */
>>>    	{ 2001, &graphics_xe2 },
>>>    	{ 2004, &graphics_xe2 },
>>> +	{ 3000, &graphics_xe2 },
>>> +	{ 3001, &graphics_xe2 },
>>>    };
>>>    /* Map of GMD_ID values to media IP */
>>> @@ -367,6 +369,7 @@ static const struct gmdid_map media_ip_map[] = {
>>>    	{ 1300, &media_xelpmp },
>>>    	{ 1301, &media_xe2 },
>>>    	{ 2000, &media_xe2 },
>>> +	{ 3000, &media_xe2 },
>>>    };
>>>    #define INTEL_VGA_DEVICE(id, info) {			\
>> -- 
>> -shekhar
>>
-- 
-shekhar

