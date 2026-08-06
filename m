Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D248C5AC7A
	for <intel-xe@archiver.kernel.org>; Thu,  6 Aug 2026 14:17:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39F9310F1D4;
	Thu,  6 Aug 2026 14:17:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jyb1mcdQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D92C310F1D4
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Aug 2026 14:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786025828; x=1817561828;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=n6uqxJlLc5Zyb4cfingyTNS0ykiNB5vu964Q+z1FsRA=;
 b=Jyb1mcdQn2OL0vf8ll1DsjSZ6EAop3KfJj1uThw8wlGLGxE5OGmQK4G1
 Y5gfFAwKAlisNWcsaJ6XUl3J4dMiKMHKXi/QUvwNWkb7IgbpmKS0Sh2eg
 C6/CADrw/XXP2U80NyWPyMbkdKyExcv0A+d0Esev4MQ7gXShl0xJNXwQ0
 gf7Uuft2t85JKu87wXvwGON3Od9Ua88EWz9k+7O/Z3NEpiE6GLn86w6l8
 aPfoY46Rt9UoqfEkUoZ46U/Ns+c9N2YlAqSp9Ds5eI5E3YYIwwivawelh
 Jx/IUZgN3QTK78xmaNPJtzrDpGWu7QfHqGeeayPlKqqpCXKMK/7nMJXpo g==;
X-CSE-ConnectionGUID: 9M6PqoXYQuOhRbVn9aMzFQ==
X-CSE-MsgGUID: GIjeJZBLTauYkD51KduxlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="90439245"
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; d="scan'208";a="90439245"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2026 07:17:07 -0700
X-CSE-ConnectionGUID: ivdLeJfuQXm60W/n+WFCAw==
X-CSE-MsgGUID: vn9ZUtbiQwqYzEZriU16rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; d="scan'208";a="262195664"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2026 07:17:08 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 6 Aug 2026 07:17:07 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 6 Aug 2026 07:17:07 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.55) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 6 Aug 2026 07:17:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fhmitttJDIzQyjfVATopN+O8dHkBbBFJpB7PLA6w1hVU2iXYPcN91gqh6K68nDQK33/6VvBPUENqKUqd586BFkQyCRHibbAucJQ3x1efuG6cUjhT7uZGLASlkIuHKREeJE5n2d34yv/pSY4Acs8/wFxwoGvbzKn31+2J5roKc2KIVFuyDRFxQ3zEmLYhMzdmNO/1q6R61txIVSpxYbiEWs0RVuYJXOOJo/yGs6AIlePjNADOPPGpHwsgHO6/Hoo+1rG8VyY3r++s3ZeGzx0AxU0DdMSSrSkq0/YoHGQATsGBa1aIEALa+nDGk2Al6/5C4u5GxKDW3Fl1xviqTIwGQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=71QBRVtrXQeiimyuuD2FwYTU2KYe1KWjowQSG98PJhs=;
 b=oUbdgakzpXdpmQeE6sIbBPJ3sHZ7K2fL+rdZTYaHaGVcAOnBegBQkJh9xM5l4Sn8Ibru7EOo2onFBdWDJ6ACaVZQo4+XDoDQ6A1IP1vj4m+iEg4ih+3OCqoAevKFj9vrlDXkgqU1whPx3dBBBTXKTt1MOfvoxtT71irliffntF0Hf8l6CCoqHvCQ/gyKE+b2WArGfSeM3SqiJTMMd6AirC7eMBBxbQEENCUHhp24cyrdGNvBIdVmYbWWhfN4k0MxQrask4p05wg93JIFuBGZQ/Da7L0GCd/ES0eRyagqqOpu5eIzW03tNJLm3kCCwOs/zB56rwsVLE0+Vst97piF3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by PH7PR11MB5914.namprd11.prod.outlook.com (2603:10b6:510:138::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.20; Thu, 6 Aug
 2026 14:17:05 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0292.018; Thu, 6 Aug 2026
 14:17:05 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>
Subject: [PATCH v1 2/3] drm/xe/ggtt: Initialize GGTT pools by SR-IOV mode
Date: Thu, 6 Aug 2026 16:16:39 +0200
Message-ID: <20260806141640.186830-3-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260806141640.186830-1-piotr.piorkowski@intel.com>
References: <20260806141640.186830-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DUZPR01CA0284.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::22) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|PH7PR11MB5914:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f52f63f-0aa3-48d7-1980-08def3c5642a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|376014|11063799006|56012099006|10067099003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: Hpr7iqIUZ33ceWGdFYQKZeufSCreMBwWvlQGq/MKtYpfHxaLbH7+stnFlDt1nPEuMgaJY+GT79do0M/a4ksLHNao7d1nTmXy5Aj1n8FyLMMHQ7BgxFpIO5aJyxH3hD8Fl+1muF1qaMCrMOg3uEcS5q060Qny9zWAL/3cTC8esCjRg1o26EuyszOV2UvJOEgPfBJmEK+ZJuYnOe1NznduymUpvyT0XrRcaZIrkpamUaVo+YTUcBjpnxr7JMTqEb2HA9hFNeVs12q1LCgRNawXytHtv1bbNhUCN9BMHV7zYcqNrI49PQ4WqK/y+oHPzVRaEkEAZ6KAPET0J539KQTpxoAUKGBhqmuuBxIeGD7J54/IhwQG3XMHX+O8Q63bLCX8enFtSagx0qraMLNP5Vr0NmSWlaDsHGI9AtA/CRq+b+FHnOj9LITEEkCH7yQbu8qYtO+PM46q3Ez/IEP3bbcKHgVrbdR9D7a145Thbm620t35hf3HybNpMPqUebOzRENOW3YUz4nhWxLzuSt1nI5CiqBuDBG0j5rh6l0l0WBiXwvrVSfPUa49gVjR+u5poy6YpIFxhcf9hygzVKp8u57nIqAjnFdEiGO18h84uUkphByD0lKRJz75njZ0nl3wnNpnB1IQzctGi4+ZDrsWlQ+VLoXSB5qpxcdUg9zkAzCTfRM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(11063799006)(56012099006)(10067099003)(6133799003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZTNLUzhIOVU1Y1kzN2crcy9iRmYxT2ZaS2ZkZll3Z0l1bG5YdW5tMnh4Z1Ni?=
 =?utf-8?B?dHIvWGZ5TUxiOUZGQkpycWpqYkJBenNwZzA5T0xTQjNTWGpJZUlSdUQ3ZVR2?=
 =?utf-8?B?T2dHOEUreDBYOGZtZU9kRDlFbTliRU1RTW9FaTd3RGF2cm9QWURidlNBYTFW?=
 =?utf-8?B?eFUvelB5Tm9lSytaUXlFem1ua1phelpWVFdXOU43MTcwMWRxbUtiNUdPRUxL?=
 =?utf-8?B?bzFScmdsbk1peGIyQzNuKzF6R21YVWVtSkVqREdCeDBXNWtjSExZMSsvMFly?=
 =?utf-8?B?SUtXMG5MamtzYWtwTEFmVm55Q1g1c0NZVjlsQ0FBbkJSUzc1ZXRhNXM2N21m?=
 =?utf-8?B?MzE3WitaWU03ai91bVVjRE1ZNWVmWkV2VHlCVUZaR1VvK0pNelVvUi9UN0tl?=
 =?utf-8?B?Z094bVFYL3dZVmI5QU94b0NWdXRaSEpxZ2NHWVd3VWtnczYwSk9IL0NMWXMv?=
 =?utf-8?B?YUdNNkZDd1Q1K3g4N3ZDRk43T05keTRpWUxVVUpuTlg3UHZWU3k5bkErVUI5?=
 =?utf-8?B?UWxWWUVUUnpaaFNLSTZGMGc3ajQzT0J2K3c4NnNVZnREeEtyS21BSnlsZk1j?=
 =?utf-8?B?MWR0TEdNbDY2UnFTaXhRc0toMmw2SzJzcE11OGR0ZnJKanBubTBJaDd5S2ZD?=
 =?utf-8?B?OUtKVVczQTc3dUFtMFkwMFpRaGppT0NBVUYzMWdIY3lkbnZRU1Jic1pEMHYr?=
 =?utf-8?B?NVZpanQwRThoYll4UFBzd0cwbkY3YmRQTjNYMHFsc3I3clVuUjFyVVZyazVP?=
 =?utf-8?B?ajlSVDFCaUxuRXZaK2dTS0h0YTIxQ1RaUlJ0OVRORHhQZmVtdk5QNktjQ0sr?=
 =?utf-8?B?K3dqQktibVdmQ1lyZ1pXVm94b0hyWUZuTTM3L0U3MUVvZmg2YlZPMWRPdXV5?=
 =?utf-8?B?Y2s1cFcxa2tPdXlvR25RWkJ5TUVPV1l5a0JpeERUTnRncWs3Z0tERXJOVEtC?=
 =?utf-8?B?Z2Fvazg4ZGdybnp2eE9mbUJPSVdieGZOVHpEekpRazRjRTNzQU1SU1RWOWpl?=
 =?utf-8?B?aGVxQTAwMU5WdEFKL0lkZkw4bjFySmhtZFY0cFU0K1VKSHY0aytaUzF6cDZG?=
 =?utf-8?B?ZUJqYmFiUHZjQlRGMHBIczZmVEtjL0ViNTBaaExqTkJQLzhhV0ZyQnF3T2hP?=
 =?utf-8?B?ZzFMR1YzV3UwamZrSExiZzZ0NEFoTDFSbFpoTUdqeE9CL1JRZXNuU3NVN2Rq?=
 =?utf-8?B?SkoySmVBS2dRWkU2eFNsT2M2Wm1zdXdPNkF1WnV6THFESG0vK2JXNTlBKzdw?=
 =?utf-8?B?YWRIaFVPT2hTQWNuNlJBZ0lveXl2RVpudUNXSzJPK0NzTE5EbkdGSzlFV2FK?=
 =?utf-8?B?YU81MWtwZ0ttTzZMK0lrZlM2d2J4SFdod1VUaWswWlVHd3pTaXA0N3FqRDVW?=
 =?utf-8?B?dU5PQTBNaDNkb1ZJUjR0SzN2c3JjamlHWGJzUXNJbzYxOG9EUXZUcHlMZUdv?=
 =?utf-8?B?T1hFOVB6UHF3dGo2ZklteURXeVpzZi9ENzlCOGxDT2RFQlZiMENZeDJpT0xz?=
 =?utf-8?B?ZUdJUnIwVm1hZGxNNTliZWxZTUJiQUFFeU11b0RLZVRpeEYzTjh1c0o0NUpI?=
 =?utf-8?B?ZmZOV3ZueEdWK0Z4R1JMbkRGYk00dkM3Z0RaQzZ0TTJHS3NXTHRWM0gxVUkr?=
 =?utf-8?B?WDFOSWFrc1IvSlRBTjNUNnUzSjAvRDZjTVFUNFFEdzhWSUI1clNYYlhGWEFO?=
 =?utf-8?B?YURUTHUxdFpBbFZ6eGF3YlYvTnV1T1Q2OENickRjaWljQlBtMXV1V3RGblJp?=
 =?utf-8?B?MFoxeVRPYnZIZG5nU09JVnliakhSd1hUOGQyTU4weUhHbTBkVkFXM2lmcndp?=
 =?utf-8?B?RTFTZmdXY1B5RFY4aFdQM2IyaDZYSDBoQTc5a09sKzl0S3hDL29GbFlXK3M4?=
 =?utf-8?B?TnRGeUlGSFhkb2pXTDUzY0VUcWlDTnhVK1ZZa1RRUWh6ZGZBT2czWTBTbmo0?=
 =?utf-8?B?aFRzTzd1OFFoMVdNVVFKeld1cFloc0pGMDdFQVpGSUUweUQ2OVVncnVXWTNr?=
 =?utf-8?B?Rnl3SzJKTzBBMktTSEtUZHRlNVZEM3docE56MDNxNmJYVkxwNm1kMFQ0ZWpT?=
 =?utf-8?B?WW9CSVU4QkVSSVZwN09MTklqdm9xMFREMDNBY0ZmUnJGYjRYbk9vaVdqbndH?=
 =?utf-8?B?bDdERzFxQXJBVzJ0dDhTNmJkNW4xejdaaW42bDFRd1ZFZFUyTWNNdkNZTFlN?=
 =?utf-8?B?WXpzWnViVHgzOUR3RlNtZW10azl4a2lEbGJ2RWYxVzRrUVNMUFhrN2dySlhq?=
 =?utf-8?B?eXNWQWhTdTNkQkQybkZHS3JUWHRjQUV1ejc4Y3lqcTNlTmZFK3FyejhCMThO?=
 =?utf-8?B?S05lUXUyMU55YnIwRFgyVVE3SURQUXRSUXJVRnNxSDFlbVpBWUppbVNKbUQx?=
 =?utf-8?Q?5wCcPH8INxe+u7YQ=3D?=
X-Exchange-RoutingPolicyChecked: QnPMhMDxkFiScgIQWvY0Qnim71+iIvpLCgA17IT8vF6FdO4nN7jr0l1lCTAq/SzzqXJEgB5gS7oMssFsrjBGXkebt2tCvxhn5EQzZvS1wGCwnkJ+JKDNhlfSYDcxt+CAdp1wC3OD8iGJ5vXPC4waDGtShoPNHrxWrZNZ0Wu2zMCvLgNdzLMjzqkdihnXyiwSSHu1VOmWLWBlQ15ABNHU36TVtpd2osayUIaT7UMiHbfyBOVHd2PoWCbg8JSslN6YPkHXSihN8klCDMAJ2Ff0okZN8mc0rYiZSAQqag/2yQh3kis5Tw5UnI5qwWu5hLn9yML3KAzEJQpjz7Dhf4Rl5A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f52f63f-0aa3-48d7-1980-08def3c5642a
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 14:17:04.9293 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sLcuHfC34L24M20SsIZ2s38/ToQ0EkXC0Qb0AYueQ7gfQm/X3VkK9jdkpcd5UVtfFyPVe89TDynt/Q+xTJrfyX60/eLP0YAOEn2GP+ryn0s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5914
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

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

GGTT initialization currently uses the full available range for both the
usable and shareable pools, regardless of the SR-IOV mode. The range is
read from hardware on native and PF devices and assigned by GuC on VFs.

Let's separate range discovery from pool setup and initialize the pools
based on SR-IOV mode. Native and VF modes will use only the usable pool.
Shared PF mode will use both pools over the same full range, so they fully
overlap.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c | 134 ++++++++++++++++++++++++++---------
 1 file changed, 100 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index a4a8d34f0f82..18e7d8f55673 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -244,10 +244,12 @@ u64 xe_ggtt_size(struct xe_ggtt *ggtt)
 	return ggtt->size_usable;
 }
 
+static u64 ggtt_total_size(struct xe_ggtt *ggtt);
+
 static void xe_ggtt_set_pte(struct xe_ggtt *ggtt, u64 addr, u64 pte)
 {
 	xe_tile_assert(ggtt->tile, !(addr & XE_PTE_MASK));
-	xe_tile_assert(ggtt->tile, addr < ggtt->start + ggtt->size_usable);
+	xe_tile_assert(ggtt->tile, addr < ggtt->start + ggtt_total_size(ggtt));
 
 	writeq(pte, &ggtt->gsm[addr >> XE_PTE_SHIFT]);
 }
@@ -261,7 +263,7 @@ static void xe_ggtt_set_pte_and_flush(struct xe_ggtt *ggtt, u64 addr, u64 pte)
 static u64 xe_ggtt_get_pte(struct xe_ggtt *ggtt, u64 addr)
 {
 	xe_tile_assert(ggtt->tile, !(addr & XE_PTE_MASK));
-	xe_tile_assert(ggtt->tile, addr < ggtt->start + ggtt->size_usable);
+	xe_tile_assert(ggtt->tile, addr < ggtt->start + ggtt_total_size(ggtt));
 
 	return readq(&ggtt->gsm[addr >> XE_PTE_SHIFT]);
 }
@@ -378,8 +380,8 @@ static u64 ggtt_total_size(struct xe_ggtt *ggtt)
 	return total_size;
 }
 
-static void __xe_ggtt_init_early(struct xe_ggtt *ggtt, u64 start, u64 usable_size,
-				 u64 shareable_size)
+static void ggtt_init_ranges(struct xe_ggtt *ggtt, u64 start, u64 usable_size,
+			     u64 shareable_size)
 {
 	struct xe_gt *gt = ggtt->tile->primary_gt;
 	u64 accessible_size = ggtt_accessible_size(ggtt);
@@ -395,14 +397,92 @@ static void __xe_ggtt_init_early(struct xe_ggtt *ggtt, u64 start, u64 usable_siz
 
 	ggtt->shareable.start = accessible_size - shareable_size;
 	ggtt->shareable.size = shareable_size;
+
 	xe_gt_assert(gt, ggtt->shareable.start + ggtt->shareable.size <= accessible_size);
 #endif
 	drm_mm_init(&ggtt->mm, 0, ggtt_total_size(ggtt));
 }
 
+static int ggtt_get_range_from_hw(struct xe_ggtt *ggtt, u64 *start, u64 *size)
+{
+	struct xe_device *xe = tile_to_xe(ggtt->tile);
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+	unsigned int gsm_size;
+
+	if (GRAPHICS_VERx100(xe) >= 1250)
+		gsm_size = SZ_8M; /* GGTT is expected to be 4GiB */
+	else
+		gsm_size = probe_gsm_size(pdev);
+
+	if (!gsm_size) {
+		xe_tile_err(ggtt->tile, "Hardware reported no preallocated GSM\n");
+		return -ENOMEM;
+	}
+
+	*start = xe_wopcm_size(xe);
+	*size = (gsm_size / 8) * (u64)XE_PAGE_SIZE - *start;
+
+	return 0;
+}
+
+static int ggtt_get_range_from_guc(struct xe_ggtt *ggtt, u64 *start, u64 *size)
+{
+	struct xe_device *xe = tile_to_xe(ggtt->tile);
+	u64 wopcm = xe_wopcm_size(xe);
+
+	*start = xe_tile_sriov_vf_ggtt_base(ggtt->tile);
+	*size = xe_tile_sriov_vf_ggtt(ggtt->tile);
+
+	if (*start < wopcm || *start + *size > GUC_GGTT_TOP) {
+		xe_tile_err(ggtt->tile, "Invalid GGTT configuration: %#llx-%#llx\n",
+			    *start, *start + *size - 1);
+		return -ERANGE;
+	}
+
+	return 0;
+}
+
+static int ggtt_read_available_range(struct xe_ggtt *ggtt, u64 *start, u64 *size)
+{
+	struct xe_device *xe = tile_to_xe(ggtt->tile);
+	int err;
+
+	if (IS_SRIOV_VF(xe))
+		err = ggtt_get_range_from_guc(ggtt, start, size);
+	else
+		err = ggtt_get_range_from_hw(ggtt, start, size);
+	if (err)
+		return err;
+
+	if (*start + *size > GUC_GGTT_TOP)
+		*size = GUC_GGTT_TOP - *start;
+
+	return 0;
+}
+
+static void ggtt_init_native(struct xe_ggtt *ggtt, u64 start, u64 size)
+{
+	ggtt_init_ranges(ggtt, start, size, 0);
+}
+
+static void ggtt_init_shared(struct xe_ggtt *ggtt, u64 start, u64 size)
+{
+	ggtt_init_ranges(ggtt, start, size, size);
+}
+
+static void ggtt_init_generic(struct xe_ggtt *ggtt, u64 start, u64 size)
+{
+	struct xe_device *xe = tile_to_xe(ggtt->tile);
+
+	if (!IS_SRIOV_PF(xe))
+		ggtt_init_native(ggtt, start, size);
+	else
+		ggtt_init_shared(ggtt, start, size);
+}
+
 int xe_ggtt_init_kunit(struct xe_ggtt *ggtt, u32 start, u32 size)
 {
-	__xe_ggtt_init_early(ggtt, start, size, 0);
+	ggtt_init_ranges(ggtt, start, size, 0);
 	return 0;
 }
 EXPORT_SYMBOL_IF_KUNIT(xe_ggtt_init_kunit);
@@ -430,41 +510,17 @@ static void dev_fini_ggtt(void *arg)
 int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 {
 	struct xe_device *xe = tile_to_xe(ggtt->tile);
-	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
-	unsigned int gsm_size;
-	u64 ggtt_start, wopcm = xe_wopcm_size(xe), ggtt_size;
+	u64 ggtt_start, ggtt_size;
 	int err;
 
-	if (!IS_SRIOV_VF(xe)) {
-		if (GRAPHICS_VERx100(xe) >= 1250)
-			gsm_size = SZ_8M; /* GGTT is expected to be 4GiB */
-		else
-			gsm_size = probe_gsm_size(pdev);
-		if (gsm_size == 0) {
-			xe_tile_err(ggtt->tile, "Hardware reported no preallocated GSM\n");
-			return -ENOMEM;
-		}
-		ggtt_start = wopcm;
-		ggtt_size = (gsm_size / 8) * (u64)XE_PAGE_SIZE - ggtt_start;
-	} else {
-		ggtt_start = xe_tile_sriov_vf_ggtt_base(ggtt->tile);
-		ggtt_size = xe_tile_sriov_vf_ggtt(ggtt->tile);
-
-		if (ggtt_start < wopcm ||
-		    ggtt_start + ggtt_size > GUC_GGTT_TOP) {
-			xe_tile_err(ggtt->tile, "Invalid GGTT configuration: %#llx-%#llx\n",
-				    ggtt_start, ggtt_start + ggtt_size - 1);
-			return -ERANGE;
-		}
-	}
+	err = ggtt_read_available_range(ggtt, &ggtt_start, &ggtt_size);
+	if (err)
+		return err;
 
 	ggtt->gsm = ggtt->tile->mmio.regs + SZ_8M;
 	if (IS_DGFX(xe) && xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K)
 		ggtt->flags |= XE_GGTT_FLAGS_64K;
 
-	if (ggtt_size + ggtt_start > GUC_GGTT_TOP)
-		ggtt_size = GUC_GGTT_TOP - ggtt_start;
-
 	if (GRAPHICS_VERx100(xe) >= 1270)
 		ggtt->pt_ops =
 			(ggtt->tile->media_gt && XE_GT_WA(ggtt->tile->media_gt, 22019338487)) ||
@@ -477,7 +533,17 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 	if (!ggtt->wq)
 		return -ENOMEM;
 
-	__xe_ggtt_init_early(ggtt, ggtt_start, ggtt_size, ggtt_size);
+	ggtt_init_generic(ggtt, ggtt_start, ggtt_size);
+	xe_tile_info(ggtt->tile, "GGTT usable %#llx-%#llx = %lluK\n",
+		     ggtt->start, ggtt->start + ggtt->size_usable - 1,
+		     ggtt->size_usable / SZ_1K);
+#ifdef CONFIG_PCI_IOV
+	if (IS_SRIOV_PF(xe))
+		xe_tile_info(ggtt->tile, "GGTT shareable %#llx-%#llx = %lluK\n",
+			     ggtt->start + ggtt->shareable.start,
+			     ggtt->start + ggtt->shareable.start + ggtt->shareable.size - 1,
+			     ggtt->shareable.size / SZ_1K);
+#endif
 
 	err = drmm_add_action_or_reset(&xe->drm, ggtt_fini_early, ggtt);
 	if (err)
-- 
2.34.1

