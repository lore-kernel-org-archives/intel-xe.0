Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D69E7CA1016
	for <intel-xe@archiver.kernel.org>; Thu, 11 Sep 2025 10:50:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90AB110E03B;
	Thu, 11 Sep 2025 10:50:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mS8iDDHF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D95310E03B
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Sep 2025 10:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757587815; x=1789123815;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=p72fnMFD5zJO3pE2i7OkyW+Lm70hw1o2/2fNTbi3/lQ=;
 b=mS8iDDHFi7lacBbf4Cf6N/azReP7pumh4jOADk9odetdMU44FB9FcPeF
 akhhMZ84NnP/Y1tan1m+/xPOUdSxHJzDTH7KmN8Hd25AX0Ddf5vOd06TS
 FPlatUaQ5fsS90QAKGyu0KYcaedCFvZfZXIQ5yr+YOBV39vVbUPjbPa69
 1if4jkYjDij796qj/3+pjkGlfXlbDtDQC3HJcoQ6tJbagbjCw7Jm62Yvp
 vOExPJYxtvXfB/v09hsQOQnzCyha5exzqhBdBPwTHHQD9mHhno4kz+ZXx
 gXNaMN4OocF3sfLCxZaZ0jxN3x1eD2ktcQYjCQH6gKhvO/hWGdy4Mc5f1 A==;
X-CSE-ConnectionGUID: f6XcxONQRuioUZ/haDicWw==
X-CSE-MsgGUID: a1YTEt7/Q7uvhNzqLY7rDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59836152"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="59836152"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 03:50:12 -0700
X-CSE-ConnectionGUID: VHdcv586StG5CcooirHPMg==
X-CSE-MsgGUID: 5HGvSO6YQBuhoG10srYoVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; d="scan'208";a="174104429"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 03:50:10 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 11 Sep 2025 03:50:09 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 11 Sep 2025 03:50:09 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.61) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 11 Sep 2025 03:50:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U259WlF3w0xmXTSRtWCnn1+2g/X9XatNsQKoNc+r59r/RO+d0Y0Mut80tl9WpV/sWRPolzE21sSpZUnUHI4aWSrf4Uu/bw5x+vCrtJIHt/JYqg0oH+wf44NCarJjt5kO0S2gSIs/XVVcTGhvceEX/T6y+qQ7akfXdDmoT2zF8mM8NaN8YEnXH/j+9u12oKsH7aTJvw1IZWuUm3mrqGZz9iwaJZtjXWgwK8jY1r9/bXE3fMkQTITjCQSJJE9HzvFP0sy2LRlZx1qU8T/R2HCWoTJLt+QHtnRLUM9QX92P33Gtcz130omfaog3fd3QGJsVOjcP7gxrFCoZ2LK2kYCW+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b9iTylxTXB3ZG6cf0JAoiXSPrWJTn2GSsUAuz7IiQh8=;
 b=rU/5TVU9gfRQuysp07cvMJF7UkwHlRLn/l55mwbDoyH4BZVH+RTU0YvfHuHehxeY8L6cxPWOmj1YrZK5XzgOyvm8flvAmH10rptdc3G90paTHBgWMgVTSp5iBsdEt2SJIqweSwZkSYt9FjOB7X0xJKFmkiv0ttEfX0c5g6FfNsv4h5EWfCGznfLVIxOZDH8TTA/rkAxzpq+yi/8NUHBMiruaBZHCQ+1Oj9JewIM5+1g6C8Dp6JArErmvD+zTXZbUVEsI4tpeHTFlScw5DqqmAfmKOsbg7+Phe4SRsH0eJIHsPSZWH7vhtNVumC5bWYZykNnCy4CMltue8rbG2PymZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 by MN2PR11MB4648.namprd11.prod.outlook.com (2603:10b6:208:26f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.16; Thu, 11 Sep
 2025 10:50:07 +0000
Received: from CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3]) by CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3%3]) with mapi id 15.20.9094.021; Thu, 11 Sep 2025
 10:50:07 +0000
Message-ID: <1aeaec82-c600-42f0-aa1d-49edee51b0d0@intel.com>
Date: Thu, 11 Sep 2025 16:20:00 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: drm/xe: Fix driver reference in FLR comment
To: Varun Gupta <varun.gupta@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <himal.prasad.ghimiray@intel.com>
References: <20250911100138.783960-1-varun.gupta@intel.com>
Content-Language: en-GB
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <20250911100138.783960-1-varun.gupta@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0015.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::7) To CH0PR11MB5249.namprd11.prod.outlook.com
 (2603:10b6:610:e0::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5249:EE_|MN2PR11MB4648:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b027303-a954-493c-0e8a-08ddf120f8b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VG5XT2VmcWdHN3JPbEZyUHlpdVBDODFMZ1M1NmlBU2lyMGpCcDJmazcyTFRy?=
 =?utf-8?B?bS9JWmN1SHhRdDdtUndnM2JKaGIvTDFsQnFzWm90YTV0MEZ5d1VPa0x5enND?=
 =?utf-8?B?K3Q2OTZHTi9ZTlY5ZEQ5bmorYm5mdXd6d1plcGVleDhPQ2IwQVNiVDErVXlo?=
 =?utf-8?B?cGNDL1hkRVlRYkNZcUxEZlVDU0dpZjJaVld5dlhmbTh6YUw1WDVvMkUxcU1Q?=
 =?utf-8?B?QWpwQ0lKeWRwOUxaUGZHd3J6ZkNxUUduZzBtdGFnYzB0UHFjeXlWdkJCUjQy?=
 =?utf-8?B?eExUTExjRXlGWTI4U1RRSmoxd2NCMXg3Uk9pNkRDKzl1Q2pweXcwbnRLRGtw?=
 =?utf-8?B?bDFBY2R0VHU4TlhSY3RQWlQ3eGRqN3ZoSkhDV0doYWZOckRxUENPOERkSzJu?=
 =?utf-8?B?eHlQNFh2UDJQRmJiVEt1THdueEFWSTFTTmNyejdkbHA3cTRVcnFyMGJ5SGJO?=
 =?utf-8?B?M3BmclAvMjExWXU0aG9nTkRLTVNyUXR6djlsRW1KZEJ6NWF3T041NVBYTFlm?=
 =?utf-8?B?QU5xUHAzcGh5bElFZkozWWVhaEw1TmIxLytqamZPby9NWDIzakJ4Zk5BSm1D?=
 =?utf-8?B?R3EzeEpvQ1hMYWlTR3JFcWFLWUpLTURsbXJyVW5jZWRFTGg1Z2JIaitCa1Bj?=
 =?utf-8?B?WG9UZHlmVUtaMGpHSFRZS1EvaEdaZnIxSDNma2pWb0ZYQnBtSXFwQzdoWUpv?=
 =?utf-8?B?a2FKRFVIdENzSDZPQ1hHQkgxN0ViRHVUb0JucGxHTXNCVk90cHE5UnkzTWE0?=
 =?utf-8?B?ZzlzcXV0a3ZpSjI5bUk2ajBBNXNKMExsTGk2M0Yrb0MrMzV3WEtpV3BLdFFt?=
 =?utf-8?B?ZWh1Um1IYnFGWWhkYXpsS25JNlF2QnYrZUNLYkFOalJtemdxbXhXSHdSOEU4?=
 =?utf-8?B?bGJTZldCMmtHYjRTWXZPOVZhR3RNSlpHdUZzeHdjMHF1OUEzaElPL0N6Mkc0?=
 =?utf-8?B?amY3ZTAwZ2lHdnlIOTUyR2NCTzM2a0RIbGRUNVFzdDhlbjZ1aC9meGF3VURJ?=
 =?utf-8?B?SnJ2N3VCRFlDZUNoNkdTRVJlUVJpMWxWMVRPQWIxT1lrMkROTnViTVNyM2ta?=
 =?utf-8?B?L1d2K0xtaXNCS0JPV09Rbm1WKzVVNVRwWmJCanRWQlRTdFNhQWRxMlZ0RjRt?=
 =?utf-8?B?T2VlZWo2YlpVdW00cWcyWlNMYUFtMnh0c2d5a3BUazl6QmlZWURsR0dYU1pW?=
 =?utf-8?B?RDFURUtCRm1NUW16cVRXbEZqb2JDQkh3TFpQSVZSeWdldmxuY1lIODBPbEhW?=
 =?utf-8?B?Uk1IMzJzamdBS25Na1NGUFYwV3ZRV3hHYktBMUlJNnN5UVVMcXpUUGg3UE9n?=
 =?utf-8?B?OGVUUS9xZE04dzBpd1FvbnFkZXJSSVZOOHhuaHpsTHdLWlQ5TUdHNzZsdFRZ?=
 =?utf-8?B?aG5yWlEvTEk1RXYrQUI1aU9sWmFPbWp3TXQ3ZDNDeUZIUDR0RjcyK0kwMFpt?=
 =?utf-8?B?MlJoUWNqMHRybWVEdDBRYjJoOUN6YTNPMURGdkNsbHZKcFZMR3YrTnQzenBS?=
 =?utf-8?B?Nk1sNnRxQ3lFVlpYS2wzYUg4QkRreEkzWVNYTDYvMitJUFMzUVIvQUJmSnJk?=
 =?utf-8?B?aDJrV0dJdnVweEtxZ0l5VlRnbzBabUc1M3ZZV1J3Q0xoMGppQyt4bWxIckFy?=
 =?utf-8?B?bTh3SDBFdDNJWThwbXBTQTZuZnZPZXNObTNJaE80OTE2dDVkays1bklQSVpo?=
 =?utf-8?B?UVpqNzltdkRIeloxR3ZKbXdqRndFSXFFQ2U3U2E5MlFNT044bTZpL25rd0VR?=
 =?utf-8?B?Tytaa1EyanlBRm1yUW5ETmFDY1JKdzhBeVA5OVk3TmhhL3UxUTM5ZW5xcmR2?=
 =?utf-8?B?N09VUDQrbWFWSnJ5dkNJdXJCb1BQYk5FU1cybzErUlk3T2xmRFd6NjBKZUdJ?=
 =?utf-8?B?aU02Tkt0eFYya2RHVkVJbWpqVWxDaWtWNVQ1ajNDRlo5eGdzazQyRGM3Ukhy?=
 =?utf-8?Q?bduXy9PU7GQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5249.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TjAxd3RZd0NhbFB2aDdmcnY4MkROVmZmaDRVbXVqWHRQNiszci9EbnJKazFo?=
 =?utf-8?B?a3hCbzFaVytJd3dWUE9kVGY0UU5ZaGFZTnB2NkJOdFZiQmZWQmZsYzFhSHVY?=
 =?utf-8?B?cGhHd2UwVlpWY2YyVVJBNVY3TFFnODhBVFBLbGwvQUUzY1FsMENFcWVUa0l4?=
 =?utf-8?B?MUxxTmwra0RkZzdWQ1JFNkVqK1A3dERKSDd0dkpDRjBTZDhHUDdHdDlWdXJJ?=
 =?utf-8?B?N0MwRzJhVnByTzE4QkNUV0Y4ZkVKTUtBMnJFOER6MGl5QVBjNUV2WE5PR0h6?=
 =?utf-8?B?YWZBdUgwV1JtNko0QUJvRC8xVWl4N3hvSVhlclhyYk94aGFSNUlDZ1EvY20x?=
 =?utf-8?B?T1FpdkkzQ0tKcmgwRkJpU0dSV2xHUTRVcmpEQWc0QzFpZ3JMbWhORnplZkN5?=
 =?utf-8?B?eXl3cjlqaUlja3JBcUpXdmMvMVFSRUtnUzAzNm5JM08rYlBJTXhMYjVMZm10?=
 =?utf-8?B?ZCtsWUo4dGNTWkRiUnVnNmZkbTlpdUhBRHlwSFYva0RLT0FuSEx0SnNwMFdI?=
 =?utf-8?B?NkV1QnJrM0xTOEcwT0xxL0JGeTRsTzBPR0NWTkxFSmtCcFFLY0FvWnFBbmhT?=
 =?utf-8?B?SnRVQzB6SWJEUGNwMUtnUG5ROE5POXdFVVd3eS9kTW0zTkphbmFZWE1iWnJU?=
 =?utf-8?B?dGhRL3BQOThDdGZYb2QwdVl3b1Rsb1pYVlQzaWY4WXVuZnVxdzlmaFRvQzZW?=
 =?utf-8?B?cWRsM240Qmwva05jczBBUFVLOVJ6LzM2d0lpdkl6cGlJLys5NE16MTNnVFE0?=
 =?utf-8?B?SU80VGtya2dSWkREQjZHWUFxaVBtZjVoL1VjQW10S0ZjTWtKZUNIdDl5bStK?=
 =?utf-8?B?WGVYUzRwQzEwWWlYcnc2VU9jNXQ2dzhDOGR0eVJuSnFGL2lqT3hCS01Zakpp?=
 =?utf-8?B?S21wQ2tUMm8rM1pBTFRLV29DTE9iYy9YYTVHc3VvMzUxSnBHQ1FwUXhxQWJJ?=
 =?utf-8?B?TE1RYjlYWmpUNDlxcVE4NDN2NXNtYTdOSE1VYy9zcDRLQkVnSnN0SnJDUG9p?=
 =?utf-8?B?NnE3dEZmSkRpS2NhakV2VlpKem1pZDAxK3YxVE11dmRRK2xjNUpXS0taRHVC?=
 =?utf-8?B?elRiUGdGQktZQ3FJSmZ2SlJnZkNQUnpJc09laWM1MjNLZWtLS2NxU2ZkdVZw?=
 =?utf-8?B?c2x2TGdLQ1U4clVRVURlVnZGL0ZHdXlWS1BNTGpzcnhkQ1VlNEVYV29LR0ds?=
 =?utf-8?B?UkJZeVE5NFlYend0eHVaSzZpSTd2NXdOem9MMVhwUStpOHhWajNJa2FJdnJK?=
 =?utf-8?B?S3prYkIySzR5RVlDUXJydVB0TkF5bFBjWTdYeGw0bHFWSzUwOU5lSXpkN0Rp?=
 =?utf-8?B?SGtxUXp5cy9kSWEwSU9zaHFuNHZFQ1NqVW11SUdLYkYvRTI0Z3AyVUNJckJn?=
 =?utf-8?B?a0ptK3Z2RXYyVlhlUVF1QWVvWkYrYXk1d29uMmc1TzdFN2M4bjQveE9rTm0v?=
 =?utf-8?B?Umo1Umtqb2dEbnJoUG04KzRaUll2bUxwZjZjSXdzeEdIczhTdGNoT1hlSkRO?=
 =?utf-8?B?WjRhQVNuTEo0RHlKdnZtbE94VmF4aWp5L3BOZm5EQkw5SVdpUkZjQXdyeDUv?=
 =?utf-8?B?SjB3cTZtdWRZcXUzb1ZpZmx2Z01CWGJ1NFlrTzZqWkpET05qd1NsalJkOVBm?=
 =?utf-8?B?Znk0Q2tkUVFQRXQ0R0NWcXY3U1MzMDByNk5jczNhQnZNYWVyK0Nnb3B6bGNE?=
 =?utf-8?B?UkFCVnpKME9EU0pUVCtpUkdNMHZBblYrSWh4ZkFCWUVmWFM2RnNteXNCQ2hq?=
 =?utf-8?B?M2xMVURQcTZxUDdrVGdqVGxNYmVyLytIdFN3ZTBzSEpUd1BCbGdPUnJ5UDBG?=
 =?utf-8?B?UG9aM3lxTzdyTVowMHp2ZEZ3WGtrbjdiS3ZoTm9wV0Jkcm8yTFdteW5qeWhB?=
 =?utf-8?B?eDVLSWFQZjVQTGdsWmN0RWlOYjNoWUp4UjlpZTN0MXVVQW1pODUwa1lGMXdl?=
 =?utf-8?B?a3dVdWJXbUsvRHhYMmlCK255RlpmWmY2TTZoSURtVXA3cmNyM2FYaDdGbEFz?=
 =?utf-8?B?cXlGRFptYUFEbVlseU80Z2FTMyt1bWRFaHJkc1Rrb0Z6elI0b1ZLRmlXK0w2?=
 =?utf-8?B?SmFlOHh3aU1PdzI3VUprWXUxa2l4TFpvVlU5cEs5WnEyM1dFbWxDZld3WnJ4?=
 =?utf-8?B?dUxZNXhJMEQ3VGpiVExONDBPRm1Ybm1VNnlyZmxsR1JWckFaNGRCU2ZEcVBz?=
 =?utf-8?B?OGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b027303-a954-493c-0e8a-08ddf120f8b1
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5249.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 10:50:07.3559 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: heiKKEYo1qHnOlS0fQWNz+JqrBLrixZzSY7d9BXsEVWh+WeUEEJNYHrjC/PxLg31sGsB8kOKngKcd0tKusowWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4648
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


On 11-09-2025 15:31, Varun Gupta wrote:
> Fixes the comment about the driver-initiated FLR to refer to
> the 'xe' driver instead of the old 'i915' driver.

%s:/Fixes/Fix
or
this can be also be rephrased to:

Rectify the reference of i915 to Xe in a comment.

>
> Signed-off-by: Varun Gupta <varun.gupta@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_device.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index c7bba535b145..76076e3f1914 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -532,7 +532,7 @@ static bool xe_driver_flr_disabled(struct xe_device *xe)
>    * re-init and saving/restoring (or re-populating) the wiped memory. Since we
>    * perform the FLR as the very last action before releasing access to the HW
>    * during the driver release flow, we don't attempt recovery at all, because
> - * if/when a new instance of i915 is bound to the device it will do a full
> + * if/when a new instance of xe is bound to the device it will do a full
Xe references shall be with X in capital.
>    * re-init anyway.
>    */
>   static void __xe_driver_flr(struct xe_device *xe)
