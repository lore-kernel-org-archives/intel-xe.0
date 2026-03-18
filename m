Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFDF410775E6
	for <intel-xe@archiver.kernel.org>; Wed, 18 Mar 2026 16:26:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8241C10E457;
	Wed, 18 Mar 2026 16:26:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AuLSKISW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29B2910E457
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Mar 2026 16:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773851188; x=1805387188;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=83Fg7nMgAd9LgyUIEujNuNdFKIEmG9XgAwX/PmDm6x8=;
 b=AuLSKISWFzevPJfHGhIP8jNTTByRITYPLNXvmQh6EY+wjR3R/7rAqdjt
 qZfsO44sycOP52i5uTmYf+nHBw/B8a+KJWIJzu15cy+7033qEXbIYR3NJ
 5L4pPkfroidCUuqKthA+li4NyxssLciqYn1haXdsjgzKhgs9Hj4PN0FI1
 tOPq6ACWzuAXeJxQu8uK52oY0H6LOTpvJwPP/DmJbBGWocrSgcIrrzl/6
 EANbobgdKdx8t/atQ2xBtaz0nArdWLeG+VuZLfpnBeO6xZrsbNAf2AAN1
 41XIPiYASkgFwfamaqqd+/OogmSVv0mNfTJXpyyS+Ot9SKDvzLEQxcJOP A==;
X-CSE-ConnectionGUID: 7F8qwxU7SNSgH9kdn4CooQ==
X-CSE-MsgGUID: zOn2EIyiRp+1vsybEWQsGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="85612224"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="85612224"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 09:26:28 -0700
X-CSE-ConnectionGUID: g9D+CqVhTSKPjfaSBfCmAw==
X-CSE-MsgGUID: NxPucZnCTY6Rg3/s7LjXuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="253157483"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 09:26:28 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 18 Mar 2026 09:26:26 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 18 Mar 2026 09:26:26 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.52) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 18 Mar 2026 09:26:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ics7NI0f/rHlAYVV6gFNtOKRp+cRnCCX73OUxSlMbN/TK3ciZD3MsLzfwN2KuWgQV+YZ2DXoqiQ/CEiB0bBC6oIGaQpSpzwbdoDU0eghYbKrgUEbkUFiaX3U+oDodUvJP0ak7VWErFSn/mAB08+yfRq2JdgDs7HTG37AKyZ9fbaSBlCNu8MrJcbmkKlif7Qz31bGvfYkw0CgLmrh4kkd/pAQMocJ5HvuyNrIq/crwQ8O2+Bbiq03BhE8sUYDAvEoTpwURSEAGg/ITWRYgSL0yYqMUB8jElDAYaG5PPPxWPJZth6QuryZxh0o2Io1HYjqldVngKDINqQ2bNT/r55olQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VDdFiBgCH46AHa1p0gpVkOrVkk+aaPg+didLUwWF1Wg=;
 b=i+wTE098ZvA0Zteo60lBeWvlKjXQZ3NISaXBEM1vNpt2tzaPUTNxW1OTMDunGyavevBwI9zqFRf20TFFAujE0ICOI3RWmLAbFhpb0ugRZfR6O1deIBNf4skxXOcFIfldr0KRIwM+YSbP1qzH53NjPusksci2AcgfiSxIsEM9ocCl9q8H44+SxUL07N4UbCVeEFjbksniN12rS3uLWKzgT9oFvCbeW9zd3xvqZJ3P5l/x7BC81dlii5Jhj2aFzkxJEJE1KCQIoeUHRtqktAb6ZNcJW6tvUKa5sMwNchsvpJ6huR4A12RU0cClBwlm9jspKpFGfHM7rEbZfWBwgh2Cpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by IA4PR11MB8991.namprd11.prod.outlook.com (2603:10b6:208:55e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.7; Wed, 18 Mar
 2026 16:26:22 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%3]) with mapi id 15.20.9723.014; Wed, 18 Mar 2026
 16:26:22 +0000
Date: Wed, 18 Mar 2026 21:56:14 +0530
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <badal.nilawar@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@intel.com>,
 <riana.tauro@intel.com>, <anshuman.gupta@intel.com>,
 <matthew.d.roper@intel.com>, <michael.j.ruhl@intel.com>,
 <paul.e.luse@intel.com>, <mohamed.mansoor.v@intel.com>, <kam.nasim@intel.com>
Subject: Re: [PATCH v10 3/7] drm/xe/xe_sysctrl: Add ABI and mailbox interface
 headers
Message-ID: <abrSJmsgEKgcVMWO@soc-5CG1426VCC.clients.intel.com>
References: <20260313143303.2441609-9-anoop.c.vijay@intel.com>
 <20260313143303.2441609-12-anoop.c.vijay@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260313143303.2441609-12-anoop.c.vijay@intel.com>
X-ClientProxiedBy: SJ0PR13CA0066.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::11) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|IA4PR11MB8991:EE_
X-MS-Office365-Filtering-Correlation-Id: c123538a-77bc-4f4a-9278-08de850b17f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: NOzwyXcvLsjH2vrM136Re4D1xKRXmQgmI5i4r1Q5LkPrqee2JNd0FzFYfRENTO3lQLv6RbSW7FOUrvFWqJ+RqxSrC6nMRHMBvAmE1Wns6JgtWDyC57eBMj0nML4nEb5KOhwAKCUm7mDO2f72YhOlZAcXyIUEnfmSFxBye7gmtMAo7oQwTmhHMqBITm8Ga0gFrZOJu2MpoPDkJbJVOUkcjEUE59LYejrsOPwCNXWq3GVyuJJCoiXfZbkjSB4E9TKsi3RHt8kOBZ3pDN1foM28wnoXaqGGU2Smy2krAFh6jS89EuPFOzGmTe+rMBE2Jt1iEMYcgLJ1fmoL2tVzpPXAACikxKGI7JcBpXci6kq/GOzOoMjbCe4oG7e50uai5/h0TEVO9rBgqfhisOPmjYU7nBwRkSks2PgDAA57JUIpC8wW4VkGXgDS2rbTv/ZYLYlaxo87XKzDTq2fGoVUlOmUVT0n4V0ytJlLDUl5n9VIBuFTRNyMUu3PNyRPxTbzNWfiaYdmh1BVRMDiRjuQY03uH/D0iIt/33qZo5ll7jYfGaJbkv9vupfi1LE0D48NM8ShOAbC3HlShbCqs5GZ4hjX0PV3CNk4ZRHzUjrxJoisLiTEr8eyzSQAxYplEQXt/OhRqXqcabkjKr7UDoP5xBY35Rg/LjMXt0awx8Lw4ToZoutXSb242pwHPSDrtpff63JZixveJeQJHh6xbSEt6fZRaGlSFkL+rkcqkYuozBVvQok=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SDNIMWRvczY4SzZ3YnBjcjE5SDRQZGxzK01CdG42UmZkcHlyeU01dFF4Ni8x?=
 =?utf-8?B?YU9PT2VKZ0xRcTZLNHVYTEg5NGZjbmoyOVZPWEd0MGtxRE5TRStvSWJTTnlk?=
 =?utf-8?B?QVRHaHpIbUFydW9DZWVFS1ZzUi9ibU1xOUdxRmozUU0xZXNSTnZxcE5kMHkz?=
 =?utf-8?B?MVFKQTF1R1VIdXJOVzhIUi9KY2dYY2owN1FCUWVSY1U0dG9EbHU4MWR4SUNB?=
 =?utf-8?B?Z1htZWw4dTQ3QlVFUHdNUUhKYXVsakJ2ZHV4WWx3Si9FUzJlMWZVQjhzMFN4?=
 =?utf-8?B?dllQYmtUZXk3ZmxOZnhNYXFEdUxTTVBSOVRhS2Z5dnp6VndqVi9GRlg2UmNO?=
 =?utf-8?B?SGhWRDl3bnB4alNZNWhmVmpHVjBic0h6VUxKNWFLTWpUV2FLQkE5eGpPMjRa?=
 =?utf-8?B?OWE5WEhUaVlpNGJwMCtBMnh6clBHRjg2YzBBZWRRdnN1ck5QMWt5dy9IRVE1?=
 =?utf-8?B?UlVwQWw3U1FyTEo5OWU4MnVZTCtBT0xuSjFOUCsxNTBoSGJTL3FPSmFKSVV6?=
 =?utf-8?B?NWpiRjlMNlZjRER6cWg3NEg4cWdVTk5aL0RCU2V3a2RYY3g2VkZCTWo1MkxQ?=
 =?utf-8?B?YndEUXhybEROYm9laEtBakE4V1hFaFpKdG5wVHNLaVBKTDdSakFYaXZzRzVk?=
 =?utf-8?B?ZVFBbkcvalFJNkFPVmpBd2Y0MkJDaFJEbWt4RGZ0Q3o0ZnNxM1A3UWRJeG95?=
 =?utf-8?B?Q2pEZktKYXFGRm5RbnBNdEZmSzN5YTY2SEZGdTlQMGhHNU1kdkVqWjdBaW9K?=
 =?utf-8?B?czZybjlCSG5wT3hncVFQN2tsRVNkL3lNd3oxbTFWa1lBQVFXMmhHT1lSMlBq?=
 =?utf-8?B?a2FWQ1ZoUnVKampCZDM5YW0yU1BtbGN5UW5pUzZLMDlNUjM3ODFhTWJJSTgw?=
 =?utf-8?B?Q2ZocW9ncndqbEROdEgwRlFPYlFpSTJXRlZIaGpXcDRjWXoxMWNDc0tpRW9u?=
 =?utf-8?B?SUsvNGFXNlVQM1IyZUxsdHJhc1hRWDlJZGs5Y1k5NGFnR0cyNVFCVkJvd1F4?=
 =?utf-8?B?cEtWcU5sNTdKSUpDQWxlUURnVkZuS2pFRlVFd3djdElWT3plYzRwM2NxVnJO?=
 =?utf-8?B?QU5qZU1MT3puTjNucXZ0b1JJK3BrN0M0VjhDSzNEbWpyNEVGQ1pvU3BkOWZB?=
 =?utf-8?B?YSt6akhoS1ZqblBpRENuTENnZmt6ZnRORGVhSnF2Wi9OLzMyUVNldWZpbEl0?=
 =?utf-8?B?a3FUR0I0WW1CMC9HWFdzVmlyZjNNcnZ0RTFWR3FteVhBSkZzaWxsSCtJdWZN?=
 =?utf-8?B?b3N2RnFRMVhqcW90dW13ejJnZWVIR3V3MDdIdXMyRThpMURyUjJ5ZkVLMkJu?=
 =?utf-8?B?M3hMZklKVHVoNnlhRlVJZ2o3R1Vaa0pRZXVjM0EwSGNqVEJMV3cyQ0xDQkxp?=
 =?utf-8?B?enVGQUd0SzkyZ0ljRHVieHhiWUwvV29HbTRxOXJ5bjRCS01XamNlbFNYN0gw?=
 =?utf-8?B?Z3o4U2IyQ1lPYjZuNnJOaG5FOXVKQ1o4Y2VoSmlrTGJLR3p3S2VYUkZSb2RJ?=
 =?utf-8?B?NFQ4MFlSd2lIWUtYK25ab0NKNE9lM1l0NVF4ei80WjhPMlh2Y21rREh3Wjkz?=
 =?utf-8?B?and4bDNldi84eE9Ua3R6Yk5MQWN3WkRxWWlUTnJuS25Db0NVQ2tlUTNJbHd0?=
 =?utf-8?B?eW1mNDhUZ1FsZ0pSTGo2aWp3bWkwdHpLRzVGSUlpMkxhR0daNDlmWUM5eTJX?=
 =?utf-8?B?VkFtSk9ZR0ZkUDJkR2Rad0tJRXN0ZnRCNWh2dWRHcklPbkZCNkVSOW1idlM5?=
 =?utf-8?B?MnNJcm9lcm5xRkhERGwwZlNITjh5d0p2K0s5bmNhTStSc210OEQrOEJmTzM4?=
 =?utf-8?B?c1JwSTdPZkNMVU1nNExyakpYTmlEQkMyandaYmV3LzZvdFRjOUc1QlA3Y0lB?=
 =?utf-8?B?VUhVYmZTTnBSSGJJdTYxUHRrQ0lEU0FqajNxTk9RTHAvckhYa2x2NXpPWHdu?=
 =?utf-8?B?eE9haWc2YStuZWJlQ2dhaUhUTDVaeVhVQzhMcHJhTWZ4cGR3eVNUcFlOQUQ4?=
 =?utf-8?B?bTlPUnl1YnBTckhrdU1jdldVclQ2a282TUxOSEUybDAzY0NndkxLWVJzVFZr?=
 =?utf-8?B?MldBb2x5cmY5TVhzcjNzTU8vQ0FMTS83MXoxbmkyNUtSZk9YeUJBckhWVGwr?=
 =?utf-8?B?L3VXQTlaa2lmYjVIbmg4TUtzK2lsd1pmYWZxelVIVEhVcVpJS2hRZ2c1NU4v?=
 =?utf-8?B?cXl6bmhoR1VZNS9qeFlaZklMOGZ5VTVaMVV0U1A3cTFiOENhUjBUSEZSeWxT?=
 =?utf-8?B?SjRLWUEvcTZPaUZGSEtrSEhzUVZkaENUNjVCeFpwb3dJd1d4QTNIblM2UkVP?=
 =?utf-8?B?ckhaenhjVFlqMHZkYnFtcldESmp3NCs4RzJrUDNoQ2tRTTl2VTNuRlpBOG1Y?=
 =?utf-8?Q?1z+fYlKG3FusYHYRf7shZtvREVjTUsvHG62FF?=
X-Exchange-RoutingPolicyChecked: Kzv1cW1gw6zKJxPif7a3hNFJdaQU9KGdTCwqa50PrpGdi2EvxKEQGtLgtw6U1PkvWBK5FHqAc0S7rOzxLuXf6r2jQr1hN2XNRnf5q+KAV3ZhEGlQdqEPeEFLOP0Zq238fj/gKwavj6GcQXydmpxbsRy+2V7n/F8jM5MY2KvI+8LyyqEUpLPj6TeV9WeEviQttwzJ5eYjO5nnE15HwIccvYJVh0PgDRHm6QJP/HM+uazHOKtJF3IWvTUp0DKtmmSsRciRTVOWfz6eC7jgraOOu0sP3H+LamUDWn0Yfth4tprcE0xeR6eXUmrufkco/tiiUZEF7IgnMroGLSP9nzNnfA==
X-MS-Exchange-CrossTenant-Network-Message-Id: c123538a-77bc-4f4a-9278-08de850b17f7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 16:26:22.7967 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q696je7JC2yS6u7IGkBJCMzTWRJBPqMFdyxu82ZRuyK0RSnZbKLztfdQe1OS91Y1Nl5G9sIXoHrHbmKl1B7jKDMV/bZWs0/Ri9DxRz92J/s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB8991
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

On Fri, Mar 13, 2026 at 07:33:06AM -0700, Anoop, Vijay wrote:
>From: Anoop Vijay <anoop.c.vijay@intel.com>
>
>Add ABI definitions, mailbox API, and command data structures required
>for System Controller communication.
>
>No functional changes. This patch introduces definitions for mailbox
>communication.
>
>Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
>---
>v8: (Matt, Michal)
>- Reordered patches for logical flow
>- Moved ABI definitions to dedicated header
>
>v9: (Badal)
>- Renamed MKHI to SCHI (System Controller Host Interface)
>
>v10: (Riana, Badal)
>- Removed SCHI terminology and aligned to sysctrl mailbox naming
>- Added System Controller ABI kernel-doc
>- Converted xe_sysctrl_app_msg_hdr data field to u32
>- Fixed macro alignment
>---
> drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h       | 48 +++++++++++++++++++
> drivers/gpu/drm/xe/xe_sysctrl_mailbox.h       | 31 ++++++++++++
> drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h | 36 ++++++++++++++
> 3 files changed, 115 insertions(+)
> create mode 100644 drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h
> create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
> create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>
>diff --git a/drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h b/drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h
>new file mode 100644
>index 000000000000..642750e7468c
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h
>@@ -0,0 +1,48 @@
>+/* SPDX-License-Identifier: MIT */
>+/*
>+ * Copyright © 2026 Intel Corporation
>+ */
>+
>+#ifndef _XE_SYSCTRL_ABI_H_
>+#define _XE_SYSCTRL_ABI_H_
>+
>+#include <linux/types.h>
>+
>+/**
>+ * DOC: System Controller ABI
>+ *
>+ * This header defines the Application Binary Interface (ABI) used by
>+ * drm/xe driver to communicate with the System Controller firmware on
>+ * Intel Xe3p discrete GPU platforms.
>+ *
>+ * The System Controller is a firmware-managed entity responsible for
>+ * certain platform-level management functions delegated by the driver.
>+ * Communication is performed via a System Controller mailbox interface.
>+ *
>+ * This header defines ABI-level message formats and data structures
>+ * shared between the driver and System Controller firmware.
>+ */
>+
>+/**
>+ * struct xe_sysctrl_app_msg_hdr - Application layer message header
>+ * @data: 32-bit header data
>+ *
>+ * Header structure for application-level messages.
>+ */
>+struct xe_sysctrl_app_msg_hdr {
>+	u32 data;
>+} __packed;
>+
>+#define SYSCTRL_HDR_GROUP_ID_MASK	GENMASK(7, 0)
>+#define SYSCTRL_HDR_COMMAND_MASK	GENMASK(14, 8)
>+#define SYSCTRL_HDR_COMMAND_MAX		0x7f
>+#define SYSCTRL_HDR_IS_RESPONSE		BIT(15)
>+#define SYSCTRL_HDR_RESERVED_MASK	GENMASK(23, 16)
>+#define SYSCTRL_HDR_RESULT_MASK		GENMASK(31, 24)
>+
>+#define APP_HDR_GROUP_ID_MASK		GENMASK(7, 0)
>+#define APP_HDR_COMMAND_MASK		GENMASK(15, 8)
>+#define APP_HDR_VERSION_MASK		GENMASK(23, 16)
>+#define APP_HDR_RESERVED_MASK		GENMASK(31, 24)
>+
>+#endif
>diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
>new file mode 100644
>index 000000000000..91460be9e22c
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
>@@ -0,0 +1,31 @@
>+/* SPDX-License-Identifier: MIT */
>+/*
>+ * Copyright © 2026 Intel Corporation
>+ */
>+
>+#ifndef _XE_SYSCTRL_MAILBOX_H_
>+#define _XE_SYSCTRL_MAILBOX_H_
>+
>+#include <linux/bitfield.h>
>+#include <linux/types.h>
>+
>+#include "abi/xe_sysctrl_abi.h"
>+
>+struct xe_sysctrl;
>+struct xe_sysctrl_mailbox_command;
>+
>+#define XE_SYSCTRL_APP_HDR_GROUP_ID(hdr) \
>+	FIELD_GET(APP_HDR_GROUP_ID_MASK, le32_to_cpu((hdr)->data))
>+
>+#define XE_SYSCTRL_APP_HDR_COMMAND(hdr) \
>+	FIELD_GET(APP_HDR_COMMAND_MASK, le32_to_cpu((hdr)->data))
>+
>+#define XE_SYSCTRL_APP_HDR_VERSION(hdr) \
>+	FIELD_GET(APP_HDR_VERSION_MASK, le32_to_cpu((hdr)->data))
>+
>+void xe_sysctrl_mailbox_init(struct xe_sysctrl *sc);
>+int xe_sysctrl_send_command(struct xe_sysctrl *sc,
>+			    struct xe_sysctrl_mailbox_command *cmd,
>+			    size_t *rdata_len);
>+
>+#endif
>diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>new file mode 100644
>index 000000000000..bdf1c38243d4
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>@@ -0,0 +1,36 @@
>+/* SPDX-License-Identifier: MIT */
>+/*
>+ * Copyright © 2026 Intel Corporation
>+ */
>+
>+#ifndef _XE_SYSCTRL_MAILBOX_TYPES_H_
>+#define _XE_SYSCTRL_MAILBOX_TYPES_H_
>+
>+#include <linux/types.h>
>+
>+#include "abi/xe_sysctrl_abi.h"
>+
>+/**
>+ * struct xe_sysctrl_mailbox_command - System Controller mailbox command
>+ */
>+struct xe_sysctrl_mailbox_command {
>+	/** @header: Application message header containing command information */
>+	struct xe_sysctrl_app_msg_hdr header;

>+	/** @data_in: Pointer to input payload data (can be NULL if no input data) */
>+	void *data_in;

>+	/** @data_in_len: Size of input payload in bytes (0 if no input data) */
>+	size_t data_in_len;

>+	/** @data_out: Pointer to output buffer for response data (can be NULL if no response) */
>+	void *data_out;

>+	/** @data_out_len: Size of output buffer in bytes (0 if no response expected) */
>+	size_t data_out_len;

I would give a space between each of the struct member like above. Helps 
readability.

Regardless, this is

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

>+};
>+
>+#define XE_SYSCTRL_MB_FRAME_SIZE	16
>+#define XE_SYSCTRL_MB_MAX_FRAMES	64
>+#define XE_SYSCTRL_MB_MAX_MESSAGE_SIZE	\
>+	(XE_SYSCTRL_MB_FRAME_SIZE * XE_SYSCTRL_MB_MAX_FRAMES)
>+
>+#define XE_SYSCTRL_MB_DEFAULT_TIMEOUT_MS	500
>+
>+#endif
>-- 
>2.43.0
>
