Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A073BC5AD55
	for <intel-xe@archiver.kernel.org>; Mon, 10 Aug 2026 03:21:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 233FF10E11C;
	Mon, 10 Aug 2026 03:21:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WNrYvpHo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90E8610E11C
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Aug 2026 03:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786332092; x=1817868092;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=da/w91DtiUSX/vomMnGJyCyeu+UtxX6JqakxCg+ybgg=;
 b=WNrYvpHoeWE4kD+hVAgOPGder+tjo3dLOhhar7VsRLJIiOhmctLQ7uVx
 xkcCSO4fgMz/Shege31Q+c6i97xOoxr8XfO71utqVue2gwzDtJeGEnGy3
 m06JBvlPXOFywK+ga8tr/RL4e2ugCaG8vMmRCkMQEC+E7YitDnoM6DK4e
 JoU3TWn20liHkxIVbzi4EPs+B0ETjTuc+D9NOegItJ1wfpntHZ89mfME7
 3YxkXD7s/KxyD9CFNM74feD2BSgfJlWujs8m4TuDKc/IRmGMiTgfsG725
 DKxBU9zM83cJsDMQY/9Vkeb1yLlh7d+U77jdpVlOH4eUop9AOv+f3ph8E Q==;
X-CSE-ConnectionGUID: Stlb94hwRHCVlrbIubvtgg==
X-CSE-MsgGUID: U3uUblzNR9KIMQ4uTv03PA==
X-IronPort-AV: E=McAfee;i="6800,10657,11870"; a="97437720"
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; d="scan'208,217";a="97437720"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2026 20:21:32 -0700
X-CSE-ConnectionGUID: CMDpyKZVQ1+sBf5aLddoUA==
X-CSE-MsgGUID: A4bIMlBySjiDVCMrBKvLbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; 
 d="scan'208,217";a="256705433"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2026 20:21:32 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 9 Aug 2026 20:21:31 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Sun, 9 Aug 2026 20:21:31 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.10) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 9 Aug 2026 20:21:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oR/nXK7U2dxXumBbWMo63sekN9zs/hOnNzQE5hjvUsEbcbOlog5GOzpFx0pb8sz+EmP/Z03bRr1FfhcFyaRU0P/zarUiQSQ8eAhBaymXdSEteDtx91jwa/M6Q1F5gPzxFR1Fea9HWmYBsdrmAXqYarXF6aesgpwlq8ic8vTEyHMlMu2bVZ6aojOCDKOwXUC+h+FDFN07KxrI2Y9iI34kGhj+MdCffoxTnUR6iEKre7STKuO8J5BaYr/HuVWjrMFNXmKadEbtBNVTvBac2hp7rHmK9V1kZGYU7xDDPIIoygZnckHMTNGNAxWykSsGbz+ZD3+43FsUiRoMHn5dcex8qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X3mGH5kdgW7f4aoVvByad2ElI+dZ9vMQM96vwvEyUWo=;
 b=EeUn0wQnhomK56GMvyZQ9qxojzgRiU5p4mzD4KTZVjy1eXIsjx32cVDAWUfRhvCJ4//a1THoZKYK2IbFYFpieVZRfsNXSMiLo9XOsAHI9wcOWj1BJ8wzM5kBIChfCOaWLV+0TVP7MjwHpCKCyKi4QKt1bl7bLp6xWrfjROQucm7SFb7IVww5Z7s26LCja6HrPnIEllvEW6KJqASg/mUkF+gxP3Btky+zqe8gpUovAd/zjLEvVWn7x4mfBZxgW4OVkmooaHDNybwUQo8WKyxvqUfskSnCQVWhEpQsCFhkEM3L1ETL8DE/9AoKidJ3tmZl00nHyhMGGL8VzxpFhukOfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by PH9PR11MB126636.namprd11.prod.outlook.com (2603:10b6:510:3e9::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 03:21:28 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::ccc3:3fd6:58f5:927]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::ccc3:3fd6:58f5:927%5]) with mapi id 15.21.0292.024; Mon, 10 Aug 2026
 03:21:28 +0000
Content-Type: multipart/alternative;
 boundary="------------gm6t3HdLWzVqN9tZEWsjR0gQ"
Message-ID: <6c3e540d-c044-4e58-a3e0-1d79036af582@intel.com>
Date: Mon, 10 Aug 2026 08:51:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] drm/xe/pf: Add _locked variant of the doorbells
 bulk config function
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260805154733.604-4-michal.wajdeczko@intel.com>
 <20260807164826.5650-1-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
In-Reply-To: <20260807164826.5650-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MA0PR01CA0028.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::16) To LV3PR11MB8695.namprd11.prod.outlook.com
 (2603:10b6:408:211::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8695:EE_|PH9PR11MB126636:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b6ee4ce-ce0e-4a15-f55d-08def68e7766
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|6133799003|4143699003|11063799006|56012099006|10067099003|8096899003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: HhB1n2d5fXmftWy7SwTAwZsdH25JP1QRKP9uK8HuDexNy4jJGr8FQVRKqyf2NFBeJH5sN70QO0kZHANJHQK7EGSDr/4JPy2qMHgVZl+lCJ5Dvus7BLlK+A+Eb/FYRXNGsd59ZSdkhYY76EwJeBnTyHR60Kh9x/ixKwjRSy2girGpUcbFWEQYvTjfsyP7IuChS0BBNBueIR+Dy0BjDLO1RIQjS65+y7b3ZsXuLvoK/wPwI8SzfAAzAiNXj7k8tuptP8bgJ+QTWqlicJgil0HREM6FEuly1wlEqzpI2e4JEeU/X+7IePOFczk87gXH3Vt13AmLQtus6U32+Tz9pJrLhLmJmVHlGhXWTXciphqSUfICzPqvggpVFjwk8IO8NkEWir1h36NYl3EKumOMFWIYWeJWWEG1OdqCk+23YgM/aC/09q6VWsjJkAXncsptKRVK54/2VACJIfI0YqrFloGU6jXFdvBdYtkSX+MOKqOjN6/mK2wmRPjBfNOs0P2F9IGd4jACg+dv4PxPiD+3XhcRqUt6Kvnd24vJhEUmxOmYLbbEHcuNcM+SS2F8e8mKbRoFnNpBxz3moRII1Vrdpym2zKYoM2orXSwfrc0Lc2OSgdkumFsBhPNqC+HDGDxIJnBVLEr1rK5OKDwn+hSMg1gz8ggzGXxcaAWOtz/RBT8u1Hs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(6133799003)(4143699003)(11063799006)(56012099006)(10067099003)(8096899003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ajQvNDhqektSY3RCdmtZZENEam5iWXBqVEx1WW9ZTHZ0MVNzdEc3a201YlJI?=
 =?utf-8?B?NE5LTHhodGtpd3JCaVo4bTIzSnF4emVCL3NQTWE3bis4ZHM0elBWQ1NMbHhI?=
 =?utf-8?B?R1hOR1Uxb0MwcGpmVXdyMG5PdEZKL2pNTENPb3cvTGRwaDJyUU1xcFU0azMz?=
 =?utf-8?B?QnBBYWZ2N3d5d214ZEhINmtCL29Sak9CU1J6SWJOUEUrSm9WSjRIWC9lWUFa?=
 =?utf-8?B?M043dksxOXpRMGJVQUY5OXZQSjZubzlERnVrK09ucGxhOEFJWkFZWXJzb3FU?=
 =?utf-8?B?R3VqZzNGbHc2WmJ1a2dmUFpLVExFY2RUamt3OFFTZmQ1TU0yMVoyL0ZpT1JO?=
 =?utf-8?B?b1ZMZXFHQjhjUi9qY0l0TFZUMGY2ekN1dGtVUDA5Q1F1bkdTYlNqYTkwbnEx?=
 =?utf-8?B?S3d0d2FqL29kbm5yZUx3Nk9tOGF5ZHlSNU5QSzhSbkEwbmJkbXhGVnJmRGEx?=
 =?utf-8?B?cThZU2I2dEJhOENuN0FMRElVRzd6MkJlZjlKTDhiZjFLMzJwbmlSZ0g3dlNo?=
 =?utf-8?B?Y1dPREV6dWFsRWZlS1VZbXhXSHM3d1dxdmVTbnAyUWVwYkhGMmIzeVNmRzh5?=
 =?utf-8?B?NE9oYWEyUWdlRlRMbXBRdVEvNUpLL3pUTktqc3NTUGJJWHJpQUt5cTgzNTIz?=
 =?utf-8?B?MVp6eldNS1YxOW1Rdk5zNzI0TUpBbVFCOTNRTlBZOGI4S1NibE9vOUVIbU00?=
 =?utf-8?B?cnVjQmtQOUx5dEJmemVBc3RtNWo0RG9Tc25hQlgvUlpYY0hXSmVYSEM4TXA1?=
 =?utf-8?B?aTY1c1poOFZidW5JLzA4MDd1ZXRPcE5xdFU5eUZKUGRIOUI4RDlYMWVvMmkx?=
 =?utf-8?B?NktRN2s2M092ZTJHRXR4bnJLTXkzWW9EdHlRdCtLWGJaSkxWQS9XaHVWRWdC?=
 =?utf-8?B?dUlEUVpJdDRqajN3ME1wOWY1eDY3T2xvNmxia0pRWEVvT0xvTmhpbGdrVHdK?=
 =?utf-8?B?NkpHZEZOTkx5bklWZTFORzFNcHlrYWdqUXFybnFhNSsvT0xWTyszNlhKditn?=
 =?utf-8?B?MnJNVGRQdGZ1Q2gvL2p1QlBUb0dkZzcveXBocUMvZUR6TW1XYXdCOVZVWlRC?=
 =?utf-8?B?c1ZtUy9DZ3BFVWNIbUU3RmozRnRVQ3hxbXVDVXh3UzFVMnlnc2Q4QWIzMFBN?=
 =?utf-8?B?VHZjSDMvSEtGSURtTGZxTTVZNFBBWDJvZFhFTjE3cmowVDR4VUd1V0JPS21Z?=
 =?utf-8?B?OE9IVXg0NGhvWmNuTnNja2ZRVTlxV0QvOWVuczRwVTV2V0FUZFdmajAyQXZt?=
 =?utf-8?B?R3BMbzEwV2kyWFlZb1JXcnBCVVVDSnJ2czJrUk1mYnB3bVJ3WTR4UVVTLzJr?=
 =?utf-8?B?dkVOUVRPVUQrY3FmRVFQa0wvT00wWHNHSnRPd254bitsdWNFMUMzNHRpU1JW?=
 =?utf-8?B?UnVaWFpwWXN4ZGh2WnJBUnZyVGFkcmxGV3RHMkFjQ1JOUmdWS3JMYk82UERR?=
 =?utf-8?B?bGl3MW9xQUo4WjNyenJpNmVtRHVDNTZhRWtLVG4rY2RDbDVVZWV1ejZDakpO?=
 =?utf-8?B?eXYwMDBPYnAwdWpHSEExTXZvdUlPUlBtOHlMeW5rZ05BcnYxSjBjMkcvSW12?=
 =?utf-8?B?M1pjYnNSS1k3STlIWE9ocGk2UnEwY3Z2YWNXSXl2SWg4bFYwTm9CTy8zaXZo?=
 =?utf-8?B?K1J4eDkzNFBSSHpyOGVkRTJGMnVSQStVR01zOU9qdnJva2pmdlZ4a1lyN3Ni?=
 =?utf-8?B?Wm5QSFVXTXFyTFdYNTF3RWZseWl5M3FNRWNSbGZBSlFjK1RjT2JGVmVFOTB2?=
 =?utf-8?B?QmI3Z1ZSajdGeWE3ZHQ0bllSWVhIWEVlQjh0d1p3ZUlURUpGbTg4cnVNaVFN?=
 =?utf-8?B?d3dLRVFXNWlOUlVBWU15OERDUUpwSm5hRUxoNHk3cGtHMVQ3akM1MFR5N3hB?=
 =?utf-8?B?Rno4cmYxQlRYcWtuUi9QZm9MS0RUQVU4ZFg1STRkNE5EdHZmOHhNcEcyczFN?=
 =?utf-8?B?Yi9Tc3l1dW5hcXJPRFZuZDZGd3F4R2dld2FCUWJXZkdPeGViQWRLdFlZK1Rl?=
 =?utf-8?B?QU9UNGI5bGR2L0xzWk9pN3BVVE54L0doOHU4Rjc4WlJRazRWcml0Mmt5OVNJ?=
 =?utf-8?B?VjZQRStFWDFhMEc1c05uSTFvZldPVnkxOTdXWlF0bStoTXVNdGNrYldSalRL?=
 =?utf-8?B?VWxkMUVRMnRrenF6VnZIUnhSNndiT1FoMFN5cm9RUmFXV1N5azhPYUFTOGM0?=
 =?utf-8?B?QUNvSjlxN3Y4N3c4ZEVXWU5wSS83UDQrb05nV2w3d0VMTFdKNktrY2ZwcFF0?=
 =?utf-8?B?R1cyQ1FJTTJaaXRxc041WTJRdHFpMEtUZkpBdzdWZkw2bmp5S2VUVm9BSEdL?=
 =?utf-8?B?QUlrMUJ4NU1jc2NIY2ZWUXN2SnU0aXdXelN5WlM0YTU0VEwyNkpyMm5kUVph?=
 =?utf-8?Q?Kf6rWQz9BRe2OHhM=3D?=
X-Exchange-RoutingPolicyChecked: gYToeturJsGg+zxlQ7pXATNAKFlk5BGe07oSIEEVUJkfmnE3aZF1o6LdQ5nH3tKvq8MbP6vvCd18Y00Mqw4W46CIpHwlvWZtTcaP8A9tQ5pCahFiazRvNQsxF2tRm1qtw+W5cldUsrx4qUwLSHGfiOmUZCNjfhjRNnZThsTuOgdYaDg7WYdP3L2LUMLyv4YzyOHl7YvR1N2qgAZlZT4A+nODAgjAQoZGrNKzu6Bd0BoHbSJxEZhIZhkciOqHm7ecx2apCUVIbL0ncz1vId2J5sLKn3yVPo/57Tz/4IDg27wLNFKDcOJSocy3mroEGNCptIGj6p9tXj3ecK4VyA+/tQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b6ee4ce-ce0e-4a15-f55d-08def68e7766
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 03:21:28.5758 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3GaGuLvET+J35JB55lssCsbOROPnBRddSGRzjfoY7IkxtmnpS+4V/3Frsag/NaQCqeJP23H2xTrKTCb+0Zwkr455xOJOhjqqcMQzLsCd+gA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH9PR11MB126636
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

--------------gm6t3HdLWzVqN9tZEWsjR0gQ
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

> We will soon want to provision all VFs, including their GuC doorbell
> IDs config, in one step. Split existing doorbells bulk configuration
> function into two functions, one of which will expect the master lock
> to be already taken. Use this new function in the fair GuC doorbells
> provisioning.
>
> Signed-off-by: Michal Wajdeczko<michal.wajdeczko@intel.com>
> Cc: Satyanarayana K V P<satyanarayana.k.v.p@intel.com>
> ---
> v2: fix kernel-doc (Satya)
> ---
>   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 37 ++++++++++++++++------
>   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h |  2 ++
>   2 files changed, 29 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index 4976d8c018ce..be0a413ee17c 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -1397,7 +1397,7 @@ int xe_gt_sriov_pf_config_set_dbs(struct xe_gt *gt, unsigned int vfid, u32 num_d
>   }
>   
>   /**
> - * xe_gt_sriov_pf_config_bulk_set_dbs - Provision many VFs with GuC context IDs.
> + * xe_gt_sriov_pf_config_bulk_set_dbs_locked() - Provision many VFs with GuC doorbells.
>    * @gt: the &xe_gt
>    * @vfid: starting VF identifier (can't be 0)
>    * @num_vfs: number of VFs to provision
> @@ -1407,30 +1407,48 @@ int xe_gt_sriov_pf_config_set_dbs(struct xe_gt *gt, unsigned int vfid, u32 num_d
>    *
>    * Return: 0 on success or a negative error code on failure.
>    */
> -int xe_gt_sriov_pf_config_bulk_set_dbs(struct xe_gt *gt, unsigned int vfid,
> -				       unsigned int num_vfs, u32 num_dbs)
> +int xe_gt_sriov_pf_config_bulk_set_dbs_locked(struct xe_gt *gt, unsigned int vfid,
> +					      unsigned int num_vfs, u32 num_dbs)
>   {
>   	unsigned int n;
>   	int err = 0;
>   
>   	xe_gt_assert(gt, vfid);
> +	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
>   
>   	if (!num_vfs)
>   		return 0;
>   
> -	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
>   	for (n = vfid; n < vfid + num_vfs; n++) {
>   		err = pf_provision_vf_dbs(gt, n, num_dbs);
>   		if (err)
>   			break;
>   	}
> -	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
>   
>   	return pf_config_bulk_set_u32_done(gt, vfid, num_vfs, num_dbs,
> -					   xe_gt_sriov_pf_config_get_dbs,
> +					   pf_get_vf_config_dbs,
>   					   "GuC doorbell IDs", no_unit, n, err); } +/** + * xe_gt_sriov_pf_config_bulk_set_dbs() - 
> Provision many VFs with GuC doorbells. + * @gt: the &xe_gt + * @vfid: 
> starting VF identifier (can't be 0) + * @num_vfs: number of VFs to 
> provision + * @num_dbs: requested number of GuC doorbell IDs (0 to 
> release) + * + * This function can only be called on PF. + * + * 
> Return: 0 on success or a negative error code on failure. + */ +int 
> xe_gt_sriov_pf_config_bulk_set_dbs(struct xe_gt *gt, unsigned int 
> vfid, + unsigned int num_vfs, u32 num_dbs) +{ + 
> guard(mutex)(xe_gt_sriov_pf_master_mutex(gt)); + + return 
> xe_gt_sriov_pf_config_bulk_set_dbs_locked(gt, vfid, num_vfs, num_dbs); 
> +} + static u32 pf_profile_fair_dbs(struct xe_gt *gt, unsigned int 
> num_vfs) { bool admin_only_pf = xe_sriov_pf_admin_only(gt_to_xe(gt)); 
> @@ -1480,10 +1498,9 @@ int xe_gt_sriov_pf_config_set_fair_dbs(struct 
> xe_gt *gt, unsigned int vfid, xe_gt_assert(gt, vfid); xe_gt_assert(gt, 
> num_vfs); - mutex_lock(xe_gt_sriov_pf_master_mutex(gt)); + 
> guard(mutex)(xe_gt_sriov_pf_master_mutex(gt)); + fair = 
> pf_estimate_fair_dbs(gt, num_vfs); - 
> mutex_unlock(xe_gt_sriov_pf_master_mutex(gt)); - if (!fair) return 
> -ENOSPC; @@ -1492,7 +1509,7 @@ int 
> xe_gt_sriov_pf_config_set_fair_dbs(struct xe_gt *gt, unsigned int 
> vfid, xe_gt_sriov_info(gt, "Using non-profile provisioning (%s %u vs %u)\n",
>   				 "GuC doorbell IDs", fair, profile);
>   
> -	return xe_gt_sriov_pf_config_bulk_set_dbs(gt, vfid, num_vfs, fair);
> +	return xe_gt_sriov_pf_config_bulk_set_dbs_locked(gt, vfid, num_vfs, fair);
>   }
>   
>   static u64 pf_get_lmem_alignment(struct xe_gt *gt)
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
> index a14ca7bf7e4d..a56e63f3660a 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
> @@ -34,6 +34,8 @@ int xe_gt_sriov_pf_config_set_dbs(struct xe_gt *gt, unsigned int vfid, u32 num_d
>   int xe_gt_sriov_pf_config_set_fair_dbs(struct xe_gt *gt, unsigned int vfid, unsigned int num_vfs);
>   int xe_gt_sriov_pf_config_bulk_set_dbs(struct xe_gt *gt, unsigned int vfid, unsigned int num_vfs,
>   				       u32 num_dbs);
> +int xe_gt_sriov_pf_config_bulk_set_dbs_locked(struct xe_gt *gt, unsigned int vfid,
> +					      unsigned int num_vfs, u32 num_dbs);
>   
>   u64 xe_gt_sriov_pf_config_get_lmem(struct xe_gt *gt, unsigned int vfid);
>   int xe_gt_sriov_pf_config_set_lmem(struct xe_gt *gt, unsigned int vfid, u64 size);

LGTM.

Reviewed-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>

--------------gm6t3HdLWzVqN9tZEWsjR0gQ
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <blockquote type=3D"cite" cite=3D"mid:20260807164826.5650-1-michal.wajd=
eczko@intel.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">We will soon want to provision=
 all VFs, including their GuC doorbell
IDs config, in one step. Split existing doorbells bulk configuration
function into two functions, one of which will expect the master lock
to be already taken. Use this new function in the fair GuC doorbells
provisioning.

Signed-off-by: Michal Wajdeczko <a class=3D"moz-txt-link-rfc2396E" href=3D"=
mailto:michal.wajdeczko@intel.com">&lt;michal.wajdeczko@intel.com&gt;</a>
Cc: Satyanarayana K V P <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:s=
atyanarayana.k.v.p@intel.com">&lt;satyanarayana.k.v.p@intel.com&gt;</a>
---
v2: fix kernel-doc (Satya)
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 37 ++++++++++++++++------
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h |  2 ++
 2 files changed, 29 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/x=
e/xe_gt_sriov_pf_config.c
index 4976d8c018ce..be0a413ee17c 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -1397,7 +1397,7 @@ int xe_gt_sriov_pf_config_set_dbs(struct xe_gt *gt, u=
nsigned int vfid, u32 num_d
 }
=20
 /**
- * xe_gt_sriov_pf_config_bulk_set_dbs - Provision many VFs with GuC contex=
t IDs.
+ * xe_gt_sriov_pf_config_bulk_set_dbs_locked() - Provision many VFs with G=
uC doorbells.
  * @gt: the &amp;xe_gt
  * @vfid: starting VF identifier (can't be 0)
  * @num_vfs: number of VFs to provision
@@ -1407,30 +1407,48 @@ int xe_gt_sriov_pf_config_set_dbs(struct xe_gt *gt,=
 unsigned int vfid, u32 num_d
  *
  * Return: 0 on success or a negative error code on failure.
  */
-int xe_gt_sriov_pf_config_bulk_set_dbs(struct xe_gt *gt, unsigned int vfid=
,
-				       unsigned int num_vfs, u32 num_dbs)
+int xe_gt_sriov_pf_config_bulk_set_dbs_locked(struct xe_gt *gt, unsigned i=
nt vfid,
+					      unsigned int num_vfs, u32 num_dbs)
 {
 	unsigned int n;
 	int err =3D 0;
=20
 	xe_gt_assert(gt, vfid);
+	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
=20
 	if (!num_vfs)
 		return 0;
=20
-	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
 	for (n =3D vfid; n &lt; vfid + num_vfs; n++) {
 		err =3D pf_provision_vf_dbs(gt, n, num_dbs);
 		if (err)
 			break;
 	}
-	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
=20
 	return pf_config_bulk_set_u32_done(gt, vfid, num_vfs, num_dbs,
-					   xe_gt_sriov_pf_config_get_dbs,
+					   pf_get_vf_config_dbs,
 					   &quot;GuC doorbell IDs<a class=3D"moz-txt-link-rfc2396E" href=3D"m=
ailto:,no_unit,n,err);}+/**+*xe_gt_sriov_pf_config_bulk_set_dbs()-Provision=
manyVFswithGuCdoorbells.+*@gt:the&amp;xe_gt+*@vfid:startingVFidentifier(can=
'tbe0)+*@num_vfs:numberofVFstoprovision+*@num_dbs:requestednumberofGuCdoorb=
ellIDs(0torelease)+*+*ThisfunctioncanonlybecalledonPF.+*+*Return:0onsuccess=
oranegativeerrorcodeonfailure.+*/+intxe_gt_sriov_pf_config_bulk_set_dbs(str=
uctxe_gt*gt,unsignedintvfid,+unsignedintnum_vfs,u32num_dbs)+{+guard(mutex)(=
xe_gt_sriov_pf_master_mutex(gt));++returnxe_gt_sriov_pf_config_bulk_set_dbs=
_locked(gt,vfid,num_vfs,num_dbs);+}+staticu32pf_profile_fair_dbs(structxe_g=
t*gt,unsignedintnum_vfs){booladmin_only_pf=3Dxe_sriov_pf_admin_only(gt_to_x=
e(gt));@@-1480,10+1498,9@@intxe_gt_sriov_pf_config_set_fair_dbs(structxe_gt=
*gt,unsignedintvfid,xe_gt_assert(gt,vfid);xe_gt_assert(gt,num_vfs);-mutex_l=
ock(xe_gt_sriov_pf_master_mutex(gt));+guard(mutex)(xe_gt_sriov_pf_master_mu=
tex(gt));+fair=3Dpf_estimate_fair_dbs(gt,num_vfs);-mutex_unlock(xe_gt_sriov=
_pf_master_mutex(gt));-if(!fair)return-ENOSPC;@@-1492,7+1509,7@@intxe_gt_sr=
iov_pf_config_set_fair_dbs(structxe_gt*gt,unsignedintvfid,xe_gt_sriov_info(=
gt,">&quot;, no_unit, n, err);
 }
=20
+/**
+ * xe_gt_sriov_pf_config_bulk_set_dbs() - Provision many VFs with GuC door=
bells.
+ * @gt: the &amp;xe_gt
+ * @vfid: starting VF identifier (can't be 0)
+ * @num_vfs: number of VFs to provision
+ * @num_dbs: requested number of GuC doorbell IDs (0 to release)
+ *
+ * This function can only be called on PF.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_config_bulk_set_dbs(struct xe_gt *gt, unsigned int vfid=
,
+				       unsigned int num_vfs, u32 num_dbs)
+{
+	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));
+
+	return xe_gt_sriov_pf_config_bulk_set_dbs_locked(gt, vfid, num_vfs, num_d=
bs);
+}
+
 static u32 pf_profile_fair_dbs(struct xe_gt *gt, unsigned int num_vfs)
 {
 	bool admin_only_pf =3D xe_sriov_pf_admin_only(gt_to_xe(gt));
@@ -1480,10 +1498,9 @@ int xe_gt_sriov_pf_config_set_fair_dbs(struct xe_gt =
*gt, unsigned int vfid,
 	xe_gt_assert(gt, vfid);
 	xe_gt_assert(gt, num_vfs);
=20
-	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
+	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));
+
 	fair =3D pf_estimate_fair_dbs(gt, num_vfs);
-	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
-
 	if (!fair)
 		return -ENOSPC;
=20
@@ -1492,7 +1509,7 @@ int xe_gt_sriov_pf_config_set_fair_dbs(struct xe_gt *=
gt, unsigned int vfid,
 		xe_gt_sriov_info(gt, &quot;</a>Using non-profile provisioning (%s %u vs =
%u)\n&quot;,
 				 &quot;GuC doorbell IDs&quot;, fair, profile);
=20
-	return xe_gt_sriov_pf_config_bulk_set_dbs(gt, vfid, num_vfs, fair);
+	return xe_gt_sriov_pf_config_bulk_set_dbs_locked(gt, vfid, num_vfs, fair)=
;
 }
=20
 static u64 pf_get_lmem_alignment(struct xe_gt *gt)
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h b/drivers/gpu/drm/x=
e/xe_gt_sriov_pf_config.h
index a14ca7bf7e4d..a56e63f3660a 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
@@ -34,6 +34,8 @@ int xe_gt_sriov_pf_config_set_dbs(struct xe_gt *gt, unsig=
ned int vfid, u32 num_d
 int xe_gt_sriov_pf_config_set_fair_dbs(struct xe_gt *gt, unsigned int vfid=
, unsigned int num_vfs);
 int xe_gt_sriov_pf_config_bulk_set_dbs(struct xe_gt *gt, unsigned int vfid=
, unsigned int num_vfs,
 				       u32 num_dbs);
+int xe_gt_sriov_pf_config_bulk_set_dbs_locked(struct xe_gt *gt, unsigned i=
nt vfid,
+					      unsigned int num_vfs, u32 num_dbs);
=20
 u64 xe_gt_sriov_pf_config_get_lmem(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_config_set_lmem(struct xe_gt *gt, unsigned int vfid, u6=
4 size);</pre>
    </blockquote>
    <p>LGTM.</p>
    <p><span style=3D"font-family:Menlo">Reviewed-by: </span><span style=3D=
"font-family:Aptos">Satyanarayana
        K V P <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:satyanaraya=
na.k.v.p@intel.com">&lt;satyanarayana.k.v.p@intel.com&gt;</a></span></p>
    <blockquote type=3D"cite" cite=3D"mid:20260807164826.5650-1-michal.wajd=
eczko@intel.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------gm6t3HdLWzVqN9tZEWsjR0gQ--
