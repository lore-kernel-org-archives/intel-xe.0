Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7692EF4198E
	for <intel-xe@archiver.kernel.org>; Wed, 15 Apr 2026 10:34:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B7AD10E6BA;
	Wed, 15 Apr 2026 10:34:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M3+BKr4B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5AFD10E162
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Apr 2026 10:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776249238; x=1807785238;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gtt1dwr2jwGbAclgcnd/U3z6b9ObBksPqqATbBklceA=;
 b=M3+BKr4BKuwClZeDYAjtvQqbnmY0F56JiX6DsxyDwLZDReCcV6BB8TUu
 LzFyTomzIB4dtF4WVvjrpCv4q316pFBmeUI8mQHe/8jBoUOy2WHhMgTNa
 B4n15hoq3q6Ri14N/kDl6qaIWQuwYpES4utLxlhebDQyZ8AIjgEw0wKUe
 axB+sU5A/W2bsQW7SZGbgoUIOScglVSE/XJjfSdXQyJXE47IYk7CwsZfK
 jNHsKZUQcST8P8BevjnQKvq0ULR6QpGpCUEw7eq+mm2MGTwtyyPRw9eCP
 Zg+YJw3Me/xNDQ8LIM+JlKqIghDe0vuU2U3snRfcbxVZbpGDbvZ32uC7i A==;
X-CSE-ConnectionGUID: 4UwxMNJUSou/lTCRcbYmwA==
X-CSE-MsgGUID: 6pEnvNfTQB+4DS7mQXJ+DQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="81090583"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="81090583"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 03:33:57 -0700
X-CSE-ConnectionGUID: +FwBdJ0kQGSrMeNNbRCd0w==
X-CSE-MsgGUID: b52SodwOTdOR/w4rynV0Gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="260801512"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 03:33:58 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 15 Apr 2026 03:33:57 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 15 Apr 2026 03:33:57 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.55) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 15 Apr 2026 03:33:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h3VVQHAVXQpUpUMQztGF99ErtHj7hxuTH7/KJQSJGVGFErxVcXjmy2QW9gLqIctcA9YQwC4lv5kI3n7UEICXKwh/SXegtblrPzKgAFRplbhlqepAuZF6/cgTK0R0e4SVpoCiqP/eEKRpxzXPvFFbbhl47Kvl/uIv/Vx64NG7ue1hFQbjnhSr70kez4cLaPyCcrZXrE4Gv2zjql6FkMu4iYVngA4Tq7XOgX1pKqmU7ZIH+zVP6mUaHLOoFei0qOgKAd6cB4khqKJNbzRuAR4oO2kWMwAtxcI3Q8Gyqhw/8WWgoec3sj0uEqAy0Is4gshq0YRIbBNgvUv2QPOePmBtgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sHDy9WjutsKdswkVNnTFRRzv091eGu+GbVg3jNkTyT0=;
 b=JW3IrFYaZQsgEC99l4Sv1aaZeryJ36bxlqDni52q8kfb+lL3nh1HeEA7l26Ik6Y3tmemJYDm5PUlR5R4Dhdq3earVJ8s/0/1IHc33Yp1DrF68f0ep4RIpMhExQtHK3BNucqdGJ66MgMksvlV/6cwOFtRy2ojeedzrKCKw1TbA1lsWFrQiMQMwkvziePc9IsMsgxKItmkTfltzT368eS/MFxrr7ZoPLsGGrNzOuH2fjBpai1ceZTWaji0iGi1XcWQVmbvSrCe/XlN4wxbuwRXYi4m5np025CU57M7HclrjKnRg9A9S7iX42ObLOOflgQndIvUGvHfvySaBA7QRIzxog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB6195.namprd11.prod.outlook.com (2603:10b6:208:3e9::8)
 by CO1PR11MB4771.namprd11.prod.outlook.com (2603:10b6:303:9f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Wed, 15 Apr
 2026 10:33:47 +0000
Received: from IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391]) by IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391%6]) with mapi id 15.20.9769.046; Wed, 15 Apr 2026
 10:33:47 +0000
Message-ID: <d0fc86ed-2788-4dd8-8741-88370965b034@intel.com>
Date: Wed, 15 Apr 2026 12:33:41 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 9/9] drm/xe/pci: Introduce PCIe FLR
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>,
 <rodrigo.vivi@intel.com>, <thomas.hellstrom@linux.intel.com>,
 <riana.tauro@intel.com>, <michal.wajdeczko@intel.com>,
 <matthew.d.roper@intel.com>, <michal.winiarski@intel.com>,
 <matthew.auld@intel.com>, <maarten@lankhorst.se>, <jani.nikula@intel.com>,
 <zhanjun.dong@intel.com>, <lukas@wunner.de>
References: <20260406140722.154445-1-raag.jadav@intel.com>
 <20260406140722.154445-10-raag.jadav@intel.com>
 <3b6e0cd3-9d8c-42cd-8ca8-f67bb59110d4@intel.com>
 <ad9eW3OlG6vCxOMs@black.igk.intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <ad9eW3OlG6vCxOMs@black.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR04CA0059.eurprd04.prod.outlook.com
 (2603:10a6:802:2::30) To IA1PR11MB6195.namprd11.prod.outlook.com
 (2603:10b6:208:3e9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB6195:EE_|CO1PR11MB4771:EE_
X-MS-Office365-Filtering-Correlation-Id: ae7f9089-479b-4504-f882-08de9ada79c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|18002099003|22082099003|56012099003|11006099003|18096099003;
X-Microsoft-Antispam-Message-Info: mKJswGWonQhjvUqk3cj7Wc7Z2k4SCF00+d13sKCuZ89SoxOH3f0are9g7YuvrpDOK++Qr8hGhm0PzuMUYfwmjXgS+3IB98Jci8vn6ZnmSazK0C+grcz+OKcQ82aVLeHJlkXgdjjJQ9odsPIkm7xeTLkRuXzLEkr40e5DOyIkq9RUC6ZXVqD04IvOfJbnXymkESYckdDqNl9eJMT7BntvlAmhC8UgLBUqAUqUwavoPDtHOJOFfIwmsLJbmLhRaopmVFwji8HYpCILxNS5TtZUkO6uLHyPFETuyjfeLpv+4UFEXc1+E60h/NdNnM1OzkbxTmjGy9euvtFyiQyPKV9wo3EVry7L1xk2vC1YrBIdDYuwsVQKUGdqFZNRokuTzEfUp+CFsyR4m6Zs/SLI801MEj+cW4wN5YB8Jr19grQ6TLP568eCtCjFWeh+cgFqE8DRpF1w2boI/q7JPCPm3UZWJl8ZV8lSiNmsR7MXu+ptHpTrfBaz8KoqCO3LRjjXqceS4dodZQmIxOlpUaYonMsCkADEO5GryBfMPdjqsHqrZxX14zLerr06nhXARJlOtvMgCrOlgpMr40JpW8R7VLB9ADqj/M0Czgs98oVMYF7SN43wgFmuQECow1GvutXRFAKKdkci6omvFeHkD96lZRXUUsWFK89GYa+wHPwjAa4CSbqYxSsOb60gC6g/6GK4cLhQMnkWnMmInXhwnQTWegQs7RK0Plt4EFOzBHJNf3PkPBQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6195.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(22082099003)(56012099003)(11006099003)(18096099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dnFadFk1SDJpMDlmZUNnZW1JUnFRSEhPbk5Tc3JlWnNNWi8xWE4xS3A5WWFN?=
 =?utf-8?B?cUp3QlUzZVpDU2lBK04zeDhZRHVrQTlEUlp3cWsvWjVGcDJTbEtKNWNQWkRL?=
 =?utf-8?B?VTZRMkR0djFyYTh3bm05SUUySUNXNnRVZ0dsdnZJUG9UVURXaWJvRnFvcWZv?=
 =?utf-8?B?OU1KMFhIUmpyNllVN05FWjFoc3pwd3FRSElyTjE4MmR4ZGpacE80UG1jQ0l6?=
 =?utf-8?B?NUJ0dUpaSXA2WmprZXQrZ1ovbkM1VVRtK3pUY01JbnFPLzdKQlk0Zkh5ZjIy?=
 =?utf-8?B?VzdwcDRRTm5tYno4NU8zZXU4cjVNcEpSaXFOL2ZGcE5PN2hGWFZobVY0dmQ0?=
 =?utf-8?B?elBQWWM3MG42UThlN1dXOW9xMEtaTmlEcmVPSDdyYnRsbHVPdE5SRnEzdy9p?=
 =?utf-8?B?U2lENFpIbmRaL3hFQnV4c054WTM3QzhIdFRBdTBHdEJhQlZrUmxjZld5NEdQ?=
 =?utf-8?B?WUFzamhNSSsrNVc3TXhWSEo3bVQrNjIyYnNMT2ovRWd4OEFveU5wMTNUNjhF?=
 =?utf-8?B?dWlybXIzckZjdWFycFlkSUFKcEJoS0RnbEc2OS9pUUxLMkdhQXM3ZnYwbXdP?=
 =?utf-8?B?dU1sVVdjdXlhcjRMSkVkdHJ5SjNGZXFZNStxVHlNZEZicTh5K1Z1VEJUNGJu?=
 =?utf-8?B?MHQxcUdSZWl0UW9EaVh6RTdQQUx2VldCV1BocjBqci81WEFSblZMd24zdVZZ?=
 =?utf-8?B?MWZrQkJ4UFZqTXFlTG1PRmYwM3hzMGowWm5lekp3NWk2K1FBOXpPU28zVWFn?=
 =?utf-8?B?UEdoNzF5YzhxRmZPS0dJRDB3YStpSlM2a1N6Zk9vSW9sR0JMamQrazBhZVlh?=
 =?utf-8?B?SWJyOGcwU3gxdEpzNVF3MGhSa1FaSVVoVjIxck52ZnVLOEMwY0hLYnJHVHhW?=
 =?utf-8?B?NFY5N1VSTkhISEljOGR3NDFKQVUyNHlnaTE0cEVqYVZtdEFScHFpdWhjV3NV?=
 =?utf-8?B?ZWZ5NVF5dGExUlY2bXU5bDU1ZzBKeWV5ZS9DYmRaMXRsN3NoVEswaUNwRG96?=
 =?utf-8?B?NWNqbGNCVEk3bTZMZG9tRFVkeEI4QjU4RzczTENlempnVUxIdFVUd1FmcGVI?=
 =?utf-8?B?ek53c2hlS3JOMjgycndRUmw5MldoWXQ1Y1pnMzVrUUc5QXBaMnNLRFV3N0l4?=
 =?utf-8?B?V3BNQ050NlBaNnVDNVUvZGlGbStDMHlwQWt2VUVJZXc2cXFlV3FuejgzeUFC?=
 =?utf-8?B?UU9GRUhaRTdQeVlacXhJM3VMN0dBb0VFODlNekRwZityOTJ5bVROU2VJaVRl?=
 =?utf-8?B?QTRUcTJKSVM1eXNyM2k2eXJUN2pYZ0tib1ZmRFpwOFZndm5iMVppdTdzZGd5?=
 =?utf-8?B?OEJIOTVWTzdvcWMzSktjWnk5UFdIOXNESWZaU0xYNnZkSjBCeHZPUkt2VDdt?=
 =?utf-8?B?Wi9lcVg4Szdnb0Y2bHNFSlBJTTl6cmxnQmNVakVIeVdVRyt5c0w5bGVpVUU1?=
 =?utf-8?B?QzFUNUpERDNlS3UvMVdMdFlDSndKTEpzaTdEc3oreDFrTWl3anEyRHFiUUxB?=
 =?utf-8?B?L2k1YmFDNE1VcjBiTk1CMDJIUWRmUFNjU2dQUUw4UGtHaTdyTnlqR2cwNStU?=
 =?utf-8?B?ME9QVFBWRlQyNkJEQ3FFMmFjY1QvQXBueElqdi9meDF6Q1JtSENVTTB0dmdV?=
 =?utf-8?B?VVB5OUoyc2JjcTBzN0ZuYlVRVytiUVZmQTJEL24zRTZyenIvb1hUb2JoTnM4?=
 =?utf-8?B?eFh3akp4WWVlRStuOTNDelNxOHBscEZ3enFYWkZ2d2F1Yms3VHNHTzFhV25S?=
 =?utf-8?B?bGtodjRRRWVXUnlkVXpQbjJaOGF6SFdhT0NZdmdXYklEaE9SNUtqU3g3RnpT?=
 =?utf-8?B?OTVvbGpXYzhSWmJDemp5bUx4QnlmT0NMNkhQTlNRVnJDUWtUU0xFTE0ydXNt?=
 =?utf-8?B?SlFuQThxcFZ3UlN6L0NYYThqKy9PUnh3NUtPcXRZc2pYZDJVVEQvWDZJMkxp?=
 =?utf-8?B?UE94VXl4SHdnYnlSSVNBcXBncCt5RnB3aXV5UklFQlh4RWpUUFgwVGpJNlAw?=
 =?utf-8?B?K0xkNFhDeWw4Y1FLK0FIaDNJSlVHbHVGbmxzdlY5M2NMV21iUGRtY3dMdUdX?=
 =?utf-8?B?TzZBYWFaaWtWcitBKzJvT0x2UmdJTXRkWlIyU2h1RmtJOGp0STNRczVER0Zy?=
 =?utf-8?B?dXFMaUlLMVZRUFFaQlVGMWxmUGVXemMrcUVpampRVkIwZDNBSldTRXZ4OVk0?=
 =?utf-8?B?SGZEVmJuQk5wNUtKdTd2Z2RXWTVNR3hiWUJESi9CVjlFR1pZay8zZW1XM0cr?=
 =?utf-8?B?bjdTT0Z3YmdmNXp2dDlpQW9pa29QMDlIeEU0bThsMlNwZnRSUFVGdHQ1NWRC?=
 =?utf-8?B?d0lkOTJ3UUVGQzZRTExlRnVNaW83ZjZCTkRvUWdRNElDamVwY2p3UT09?=
X-Exchange-RoutingPolicyChecked: vEl/LeYy75enBCy6dNEwYQAMSbgRi63Jt6BwKkNleKdLQEsc0BxH1LCdXT9SF0nna7oF+goJAUrRMavItYc9VTpdwQxERAc57Ql/+82GA9KJSCuuvh+4QXH4vt2Pds1KPMFXGxcPxskohvRDAbV0gcaF+UCBiHm1B5GKrznFLXCXGEZDKpUkPCKI1g2XOE7NA03EzwZFa8LjnxFBJ/UI/4slbIscek5voCF0bdf7mgZ0qxNZPWKVpBvJx5Rj3dKg0BbmpvzNPD7+vfLUc1NeFvsEKQVdRF2U6YAeOtOaWkveh+PxtEfZOVlecZC7h9m3O20ALg91fH0kH3LWCT8nhw==
X-MS-Exchange-CrossTenant-Network-Message-Id: ae7f9089-479b-4504-f882-08de9ada79c6
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6195.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 10:33:47.2396 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r/IGALhLLLkHHTMTuDt8fIR0hNPdwJJA3sU6zzf8XFq97EoYJFndjtsB0KS1uK+GaMgjRzsPtvMEgomqrvPjhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4771
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


On 4/15/2026 11:46, Raag Jadav wrote:
> On Wed, Apr 15, 2026 at 10:43:53AM +0200, Laguna, Lukasz wrote:
>> On 4/6/2026 16:07, Raag Jadav wrote:
>>> With bare minimum pieces in place, we can finally introduce PCIe Function
>>> Level Reset (FLR) handling which re-initializes hardware state without the
>>> need for reloading the driver from userspace. All VRAM contents are lost
>>> along with hardware state and driver takes care of recreating the required
>>> kernel bos as part of re-initialization, but user still needs to recreate
>>> user bos and reload context after PCIe FLR.
>>>
>>> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
>>> ---
>>> v2: Spell out Function Level Reset (Jani)
>>> v5: Prevent PM ref leak for wedged device (Matthew Brost)
>>> ---
>>>    drivers/gpu/drm/xe/Makefile          |   1 +
>>>    drivers/gpu/drm/xe/xe_device_types.h |   3 +
>>>    drivers/gpu/drm/xe/xe_pci.c          |   1 +
>>>    drivers/gpu/drm/xe/xe_pci.h          |   2 +
>>>    drivers/gpu/drm/xe/xe_pci_err.c      | 160 +++++++++++++++++++++++++++
>>>    5 files changed, 167 insertions(+)
>>>    create mode 100644 drivers/gpu/drm/xe/xe_pci_err.c
>>>
>>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>>> index f9abaf687d46..06b5d53e1629 100644
>>> --- a/drivers/gpu/drm/xe/Makefile
>>> +++ b/drivers/gpu/drm/xe/Makefile
>>> @@ -100,6 +100,7 @@ xe-y += xe_bb.o \
>>>    	xe_page_reclaim.o \
>>>    	xe_pat.o \
>>>    	xe_pci.o \
>>> +	xe_pci_err.o \
>>>    	xe_pci_rebar.o \
>>>    	xe_pcode.o \
>>>    	xe_pm.o \
>>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>>> index 150c76b2acaf..b743b3986205 100644
>>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>>> @@ -482,6 +482,9 @@ struct xe_device {
>>>    	/** @needs_flr_on_fini: requests function-reset on fini */
>>>    	bool needs_flr_on_fini;
>>> +	/** @flr_prepared: Prepared for function-reset */
>>> +	bool flr_prepared;
>>> +
>>>    	/** @wedged: Struct to control Wedged States and mode */
>>>    	struct {
>>>    		/** @wedged.flag: Xe device faced a critical error and is now blocked. */
>>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>>> index 26eb58e11056..f3515c91e534 100644
>>> --- a/drivers/gpu/drm/xe/xe_pci.c
>>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>>> @@ -1332,6 +1332,7 @@ static struct pci_driver xe_pci_driver = {
>>>    #ifdef CONFIG_PM_SLEEP
>>>    	.driver.pm = &xe_pm_ops,
>>>    #endif
>>> +	.err_handler = &xe_pci_err_handlers,
>>>    };
>>>    /**
>>> diff --git a/drivers/gpu/drm/xe/xe_pci.h b/drivers/gpu/drm/xe/xe_pci.h
>>> index 11bcc5fe2c5b..85e85e8508c3 100644
>>> --- a/drivers/gpu/drm/xe/xe_pci.h
>>> +++ b/drivers/gpu/drm/xe/xe_pci.h
>>> @@ -8,6 +8,8 @@
>>>    struct pci_dev;
>>> +extern const struct pci_error_handlers xe_pci_err_handlers;
>>> +
>>>    int xe_register_pci_driver(void);
>>>    void xe_unregister_pci_driver(void);
>>>    struct xe_device *xe_pci_to_pf_device(struct pci_dev *pdev);
>>> diff --git a/drivers/gpu/drm/xe/xe_pci_err.c b/drivers/gpu/drm/xe/xe_pci_err.c
>>> new file mode 100644
>>> index 000000000000..339e8688d37f
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/xe/xe_pci_err.c
>>> @@ -0,0 +1,160 @@
>>> +// SPDX-License-Identifier: MIT
>>> +/*
>>> + * Copyright © 2026 Intel Corporation
>>> + */
>>> +
>>> +#include "xe_bo_evict.h"
>>> +#include "xe_device.h"
>>> +#include "xe_gt.h"
>>> +#include "xe_gt_idle.h"
>>> +#include "xe_i2c.h"
>>> +#include "xe_irq.h"
>>> +#include "xe_late_bind_fw.h"
>>> +#include "xe_pci.h"
>>> +#include "xe_pcode.h"
>>> +#include "xe_printk.h"
>>> +#include "xe_pxp.h"
>>> +#include "xe_wa.h"
>>> +
>>> +/* TODO: Extend support as a follow-up */
>>> +#define XE_FLR_SKIP		(!IS_DGFX(xe) || IS_SRIOV_VF(xe) || pci_num_vf(pdev) || \
>> Any known issues on integrated platforms? I checked it on PTL and didn't
>> notice any problems. Everything seems to work fine with display disabled.
> Thank you. Can I add your Tested-by on this? I can include integrated
> in next rev with it.

I triggered an FLR, which completed successfully, then executed 
xe_exec_basic and xe_exec_store and both passed. If that level of 
validation is sufficient, then feel free to add my Tested-by.

Lukasz

> Raag
>
>>> +				 xe->info.probe_display)
>>> +
>>> +static int xe_flr_prepare(struct xe_device *xe)
>>> +{
>>> +	struct xe_gt *gt;
>>> +	int err;
>>> +	u8 id;
>>> +
>>> +	err = xe_pxp_pm_suspend(xe->pxp);
>>> +	if (err)
>>> +		return err;
>>> +
>>> +	xe_late_bind_wait_for_worker_completion(&xe->late_bind);
>>> +
>>> +	xe_irq_disable(xe);
>>> +
>>> +	for_each_gt(gt, xe, id)
>>> +		xe_gt_flr_prepare(gt);
>>> +
>>> +	// TODO: Drop all user bos
>>> +	xe_bo_pci_dev_remove_pinned(xe);
>>> +	unmap_mapping_range(xe->drm.anon_inode->i_mapping, 0, 0, 1);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int xe_flr_done(struct xe_device *xe)
>>> +{
>>> +	struct xe_tile *tile;
>>> +	struct xe_gt *gt;
>>> +	int err;
>>> +	u8 id;
>>> +
>>> +	for_each_gt(gt, xe, id)
>>> +		xe_gt_idle_disable_c6(gt);
>>> +
>>> +	for_each_tile(tile, xe, id)
>>> +		xe_wa_apply_tile_workarounds(tile);
>>> +
>>> +	err = xe_pcode_ready(xe, true);
>>> +	if (err)
>>> +		return err;
>>> +
>>> +	xe_device_assert_lmem_ready(xe);
>>> +
>>> +	err = xe_bo_restore_map(xe);
>>> +	if (err)
>>> +		return err;
>>> +
>>> +	for_each_gt(gt, xe, id) {
>>> +		err = xe_gt_flr_done(gt);
>>> +		if (err)
>>> +			return err;
>>> +	}
>>> +
>>> +	xe_i2c_pm_resume(xe, true);
>>> +
>>> +	xe_irq_resume(xe);
>>> +
>>> +	for_each_gt(gt, xe, id) {
>>> +		err = xe_gt_resume(gt);
>>> +		if (err)
>>> +			return err;
>>> +	}
>>> +
>>> +	xe_pxp_pm_resume(xe->pxp);
>>> +
>>> +	xe_late_bind_fw_load(&xe->late_bind);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static void xe_pci_reset_prepare(struct pci_dev *pdev)
>>> +{
>>> +	struct xe_device *xe = pdev_to_xe_device(pdev);
>>> +
>>> +	if (XE_FLR_SKIP) {
>>> +		xe_err(xe, "PCIe FLR not supported\n");
>>> +		return;
>>> +	}
>>> +
>>> +	if (xe_device_wedged(xe)) {
>>> +		xe_err(xe, "PCIe FLR aborted, device in unexpected state\n");
>>> +		return;
>>> +	}
>>> +
>>> +	/* Wedge the device to prevent userspace access but don't send the event yet */
>>> +	atomic_set(&xe->wedged.flag, 1);
>>> +
>>> +	/*
>>> +	 * The hardware could be in corrupted state and access unreliable, but we try to
>>> +	 * update data structures and cleanup any pending work to avoid side effects during
>>> +	 * PCIe FLR. This will be similar to xe_pm_suspend() flow but without migration.
>>> +	 */
>>> +	if (xe_flr_prepare(xe)) {
>>> +		xe_err(xe, "Failed to prepare for PCIe FLR\n");
>>> +		return;
>>> +	}
>>> +
>>> +	xe->flr_prepared = true;
>>> +	xe_info(xe, "Prepared for PCIe FLR\n");
>>> +}
>>> +
>>> +static void xe_pci_reset_done(struct pci_dev *pdev)
>>> +{
>>> +	struct xe_device *xe = pdev_to_xe_device(pdev);
>>> +
>>> +	if (XE_FLR_SKIP)
>>> +		return;
>>> +
>>> +	if (!xe_device_wedged(xe) || !xe->flr_prepared)
>>> +		return;
>>> +
>>> +	/* Unprepare early in case we fail */
>>> +	xe->flr_prepared = false;
>>> +
>>> +	/*
>>> +	 * We already have the data structures intact, so try to re-initialize the device.
>>> +	 * This will be similar to xe_pm_resume() flow, except we'll also need to recreate
>>> +	 * all VRAM contents.
>>> +	 */
>>> +	if (xe_flr_done(xe)) {
>>> +		xe_err(xe, "Re-initialization failed\n");
>>> +		return;
>>> +	}
>>> +
>>> +	/* Unwedge to allow userspace access */
>>> +	atomic_set(&xe->wedged.flag, 0);
>>> +
>>> +	xe_info(xe, "Re-initialization success\n");
>>> +}
>>> +
>>> +/*
>>> + * PCIe Function Level Reset (FLR) support only.
>>> + * TODO: Add PCIe error handlers using similar flow.
>>> + */
>>> +const struct pci_error_handlers xe_pci_err_handlers = {
>>> +	.reset_prepare = xe_pci_reset_prepare,
>>> +	.reset_done = xe_pci_reset_done,
>>> +};
