Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDFEDFF8868
	for <intel-xe@archiver.kernel.org>; Mon, 27 Apr 2026 19:23:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BF9C10E8F8;
	Mon, 27 Apr 2026 19:23:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cl8HA1pn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB17010E8F8
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Apr 2026 19:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777317824; x=1808853824;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=y54RpjgCebapLTEwU7oFpOG989YF6axfq7eY3mlMVxs=;
 b=cl8HA1pnmWaL5/WM4cN7FW+Rzy6FG6KV8KJZCnt/wsKO185aZPejUK2p
 QdTWq8b74RpizPmLTS0tWMiDYaDvappK6V3jkldVRg/viLgr+eog0KX9X
 X/r66lGqzsmgKgpLpBX6qZgxxyvnc5fBN2bVNTpydebiRBDZSXWZ1pUZv
 8tDBNvu4hFU7tkArJ8LJi6SY+Zj0PQ4h6L7YvS9wB3FwamNJUzYqIXOnq
 7cl2luhI057Bv05TVjk4q6uMc/e1V0XexoCN2NI8KkCChiDazy9pa18mF
 Q4vHSIUirs8TOZkGLvQPWx2vzx+OkCb3uq95P7shYt0JfyU8ktdZqUp3P A==;
X-CSE-ConnectionGUID: OUTjffkPSL6Y1qo4mbj00w==
X-CSE-MsgGUID: uhM/dZSNQy2PN0s++n7Klg==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="77923188"
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="77923188"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 12:23:44 -0700
X-CSE-ConnectionGUID: +gg6gp+QRFCDV8B2MugXqQ==
X-CSE-MsgGUID: NZ5mIpNWQa+F7Y0HUSCPdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="264128764"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 12:23:44 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 27 Apr 2026 12:23:43 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 27 Apr 2026 12:23:43 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.62) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 27 Apr 2026 12:23:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XE7i7fpuBfMmAqyD/6Y9VnmLdWBWnyXxlyYvGZbUIUIgKBdEU0iS/+FPNS9QTv2FmDrfh/vyrANbG1WmUAXo6keHFwHNwbAoP5Pv8IGg62KmbUrLuFhuAX6dK4p9RmFC/tQ25uyo2j8AXkTekabN0MTiJWm3CsjvWGF/IRGW/AQ4//NT7ma8mIPx8+pNMQD3nfo4mEFOg756dSarenn1Hc4XOXDpF7hLpU+1bO1xWcjNix/0Rt6hf0E034H0wG3OdZJAsFON+XHHNiAqXHFYUa8HIUAbUYVO5sT1qmOT99sC/ckbNOw/Nb6w158mH7i5Q6rsS6KYXUjSDgaLapSRTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YUsmd4sKw1rrQdpkk/DXHFvLLG2ytv3qOJI0eJGQsWg=;
 b=VHGMCqO2AMxoLvadLl9J7v5AI6ToUPjD8BImz1jMarBi+ysxxAM3N52sPJ8B6v68fhsIjo0bzemUw6G/YqZ3UlxlilVzPPxGtKXrFekjeaPR2SyPDwEfzCCZpY882/J3PriDXD1C71DarQmcfvB1rF+wIdiAM6gzZg+91dZUdRdpdI8L7MYjzTfuWwR0hxJK8rjKWpdw3dWeHVJ00UQsNIdPm4GVPnN9PG1P8fQ4nFeaUGsoJMSlchoyd58P9c9qvM2FnP38A1r9E+Zt6oRRxLprmvv5AJfwT1oBRAtvaSw1Max3g1ZTAN2MfzR8wa5Ah4OESaRB/3tWqAVgHOlQoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SJ0PR11MB4989.namprd11.prod.outlook.com (2603:10b6:a03:2d9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.21; Mon, 27 Apr
 2026 19:23:37 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%4]) with mapi id 15.20.9870.013; Mon, 27 Apr 2026
 19:23:37 +0000
Date: Mon, 27 Apr 2026 12:23:31 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/3] drm/xe/oa: Use xe_map layer
Message-ID: <ae+3s4ZViPjXxzzG@soc-5CG1426VCC.clients.intel.com>
References: <20260425001439.2148765-1-ashutosh.dixit@intel.com>
 <20260425001439.2148765-2-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260425001439.2148765-2-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR04CA0045.namprd04.prod.outlook.com
 (2603:10b6:303:6a::20) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SJ0PR11MB4989:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e6c62cd-5c8c-48a9-b29e-08dea4927af5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: 7XFj0OA1WAU/fzk7jJtW+/CyCdEBBeXPYzTjJqbQNFiQPgkkM5yeTALxj0Aiea+dVF4SXMtnypiEj+9xqjQsnjMumKIYSq1a6HzSriKrOBoPoO2aK1sYhrQsePjfD/poqf1OVPG1q1XUldUSgnMOD5XCy9lcxy1HTTJE73qF/u8H6dH3L4MR6XEC5tKzsgK3DoyM5yTsPGCNg2CxcN3lSxE0dHy2aaBUi3CrxMUSqgH9DBU6w58t33yxTPLz8uErWRGkanuU+zGrjaAPvYmGl/sVtMv0lcJU6gNUns6UsK8G/q0yW7dBmgKsqjbXsSbaL+F4hWkeoTikUcmi4SP3/ACcQNzJYHTVlYrc6NXQmyoUDxdZV/ANIh2y5dsQsCByyNnogJoKJNtYJXlIkBTIFfgHmE8misDbIlZ3CDwCk3SRgDOVweW0GGB1OkAsipE4O3p8NOtg1jp/vf2YaablT4PsZ+9lLcXZY4hQHQtihOhxG1Ct/9Obrcxpp+qSwQGgOjnb6O/VBXd+W1oexAJNyVcAeElDVHuv0GUPLWaB/LHQ5UaN71exxeVbJ2b7IAmUW1Aq3S1cumE2To6P2TL3FrNKGPb4EfoY2s5uOieFTcI0LOe8ZX6nNRTqftts05MvEK+MuhNHxjqz+Ank9j+qMXdPmTpO2EtQ054/n/kKB1lle14xMUdSaC05OVBJEeF1DvXAK40w7TDg+RKGj5aOHszrB6NGltaHwdCwOeOv7fA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dDBJL3dWYmRnblRZVEwvZ2taZ2I1REVhcTF5U0RZVUNZeGFUTzdwNUREVmV6?=
 =?utf-8?B?cVIrMlY0Sm1YWnFaNXcyQysvY1YrWndmYkYwdWV6Y0tzeUZsOWJxWEdxYlFE?=
 =?utf-8?B?NzR4alFvNGp3TmhPc2xKYlBBUGU5REFoNVV0UCs3S3dub2JKdjVwQTdXS2ZG?=
 =?utf-8?B?S0hlY0FjK2ppWXJvd0ZjSnlGa2tUdkRWSEZCL2ZGOVREUWpudXNjaFRha2hM?=
 =?utf-8?B?cVR0S2crMlYvcUJwbGR5R01pNGdRVnJyKzhwbDNUakVzZ1dUc3ZpTGhBQWJo?=
 =?utf-8?B?VTc4emU3c3g2d3pCUDRuYUsxMXFobTRvSjVPYXhtZHJqL3J4Z3p5Y2ZZNDY5?=
 =?utf-8?B?TnJ1TmRrcGNDNy90dHdrQ1BHUGVtd052N0dXSXFSd2MxanowUWlBeWtETjJ0?=
 =?utf-8?B?Znc3OFVnVDVqdmw1MnpJZDFlYUw1R0ZsbGhXeFhxaFBhcThFWjBhRURVRU9W?=
 =?utf-8?B?SXhZN1RGbTZFRzZVektkblNZK3ZPUTZXeVN2MTVrclNKakh1MkJ5RFVjVjRJ?=
 =?utf-8?B?eUFTdURhRFI2SGpURUM0b2JTOHFwcURVQ0FsakJzR2hsT2ZNRTVoNDI3S3Zh?=
 =?utf-8?B?OWZ1aERFRU54TTg4SlFPM1BxRGQxMW1xZ09LNExsV0lRZE9JMDBWZTYvUWNv?=
 =?utf-8?B?c2ZScmMzS1VXaFVNaFNBQnIzRDNEdTIxZThJZC8vZDVOL2ppRGMrTjBkSU9S?=
 =?utf-8?B?anhYSy9mUUtDdzRianVXcFlCVnJTTUhZNkFVNFlwYnU5cXBlTkJsU3kxQ1pP?=
 =?utf-8?B?OGlMYm1SeFZVd3Fqemx4TzNCaVdsUFpkdFE3K0Y5b1luK1FUb3ZhZ2J0K0pa?=
 =?utf-8?B?TGgxV2E4K3lvb3pTVHBMN0toSis2ODNDMFphMzRNOVhRY25zZUdoWU1wQmRL?=
 =?utf-8?B?dEhQckRObDFwYlE4YzVKRnFLQ2ZDZHYvZFh5R2xENm5JalRXa3hNc0dQT3Q0?=
 =?utf-8?B?OWR2RkNuWW5nNUpBTnBDK1dJYUZ3T1VwdXFYZktkblRBQ00vUkh0ZWVMZVJX?=
 =?utf-8?B?aHRTaWoza3pOWjVhWFYrYTlVank5d1dUZ3ZLak5TUkJ6ZzhGdC9UNHRlcFJS?=
 =?utf-8?B?QmI3djhRaThSZHZvVlp0dzZFcFpNcFJiWGQvMWJWdnNoeFlKWEhyQkFBZVlz?=
 =?utf-8?B?VzY3RmpqTzNmZFY2RHVFTTg0MFF3d0hLQlYyVGhzdjdQdTl0Rm9XbU54dm1Y?=
 =?utf-8?B?TS82eEZxSFl5ZmxkQmRpV0FkUjVOYjFmNDdFbitQUHZueXZpNDE1TzFQZFBQ?=
 =?utf-8?B?bXN5K1ZGOFRpQkloNG1xSW5xWXh5YjdOSHpFZjVqN0VwK1FCdVdrSmhoejVp?=
 =?utf-8?B?UlU3Wk81UDVBaHF2cHE5bUJ5TGsrR3dTZCtYQ2gyTUliVmwxT3U0cnlLajhB?=
 =?utf-8?B?OCtQTVlUWXRlUlpwWVVGQWd2RjZaYWI1cFpHZWNRbm9RaUNkMEp1N3dQUzNF?=
 =?utf-8?B?NUkrZFNVWCtLSHR6TjBvbUJ6bzhFdk82ajFRUmdWdmdtTS80ODVpeEFHRWZV?=
 =?utf-8?B?bEdXTUhXMjFYd3ZkSDFMOW1HMFIxSDQxMWNyZGN2RmN6WGZoQlFoT01RSTk3?=
 =?utf-8?B?UHdXT0VLQ0l5aldIUmVPREpid1dGRmRqSTdQNXhjYkt1QWpaeEQ2ZnZnRU80?=
 =?utf-8?B?OWlCR0JqT1lHdGJKemJONGVqUE1aZDNKcWNtQklhRUE2bWtZbzdRM2p0Sjlx?=
 =?utf-8?B?S0hYYTVoaC9yT1FpSi9YekIxR3N1bjFvU3dObVprcUdUbmtBelpxS3hDMHh3?=
 =?utf-8?B?OGFMQVhaUkw3bTYxSjdRM0RJMkNjWHorL2o0UlVMTm52YjZocmhDV1pGNlpY?=
 =?utf-8?B?Zi9VUVR3SFZxU3ZWZjl5L3RKVERoQnNDSGIvd3JZd0RhSE81R1BwQkY0UWw5?=
 =?utf-8?B?MXJVcUQwOU1NeTBmY2RvVW1sNVNjMXpJT3MzSU1mY0tSQ05KWCt0aGwxWGJK?=
 =?utf-8?B?SVRCQmtVbkY2em1xNUUra2NkS2pQV2UrR3RJZElJWWltS0o0M3hxcldTU0g3?=
 =?utf-8?B?RWVnWVVENTNyNytyL3R3K2NLVnVNOGJITkNoRHh0M0JkeHgydlJvNmtxUnJE?=
 =?utf-8?B?YllRWTFYTk1oUkNhcWY2emRpTkdOd0xqWGNYSHAyWXpEYnlnZ2R4SzY5eFFj?=
 =?utf-8?B?UDJQTVpXN0RFTHpEbktnR3JOUFlRalBYQ25xWDIrSElOdm9lV3ByREZ5YkVG?=
 =?utf-8?B?Nm9wNG4wZWJTYjZsaFQ2N1h4dlhlK0I0cmlMVU9IT0tENDl5Z1dEQ1BtbWsx?=
 =?utf-8?B?OUlJKzlzNStiUkVHSnlyaW56UlBYdG9KYXhmMHpEVXExOWNicHNaQjBHS0lD?=
 =?utf-8?B?SXl4ZUpBa01wQ2RrNGEyalk0NXpBMVk3QVJSc1BpZ2ErWW1EVTlzd2xZYkE4?=
 =?utf-8?Q?4Qwfs82ZzPAmHPfnLMvPScbE+ZZbDy/+wr1/1?=
X-Exchange-RoutingPolicyChecked: QeoaA7uz856lknrBTOHMgpcihfNu6wTkRmW1QfTWfHlYd4hQfodyaqtFKiR/kuHCV+0T1bUqzOAhkcfjR8aCUzgH/vIw/jiVxVCAZuEXdUVndCVY6gKcAAIQ/jpmRiiy08kAr4DMMhMk5B4DkSH4WUvc1dVdOkJdAhXMniLqv/Ya1opmqLCHp3jPB0SLp9XfGBwIghCyjg+sa1deFkT/1jbWKg7fGpFSCQuQNXjmgk54Kxlv9b0D4G8x84cuQRNnxFCSutK939yegFw3XsRKg7YU+4owN1boxRrgwuBnhG/OeKR5faTRUbi3j/3QuV7j/GVgsxbbmcxPlxrqKe3zag==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e6c62cd-5c8c-48a9-b29e-08dea4927af5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 19:23:37.0707 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lL2LM7pEXsw1nz4sNzEmRQ7XAw30BKusd21tA6GYXD3yT71U0KWbOZlQGyQjlmj02zkeJNDgRcsQ1acPet+wx9BOwS2f6XnOrU7juqp17tw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4989
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

On Fri, Apr 24, 2026 at 05:14:37PM -0700, Ashutosh Dixit wrote:
>OA code should have used xe_map layer to begin with. In CRI, the OA buffer
>can be located both in system and device memory. For these reasons, move OA
>code to use the xe_map layer when accessing the OA buffer.

(1) Please also add the description from the thread in v4 on why you are 
renaming some stuff.

>
>v2: Use xe_map layer and put_user in xe_oa_copy_to_user (Umesh)
>v3: To avoid performance impact in v2, revert to v1 but move
>    xe_map_copy_to_user() to xe_map.h
>v4: Use bounce buffer and copy_to_user in xe_oa_copy_to_user
>v5: Fix offsets in oa_timestamp() and oa_timestamp_clear() (Umesh)
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>---
> drivers/gpu/drm/xe/xe_oa.c       | 95 +++++++++++++++++++-------------
> drivers/gpu/drm/xe/xe_oa_types.h |  4 +-
> 2 files changed, 58 insertions(+), 41 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
>index 6337e671c97ae..3ae30dc609bd7 100644
>--- a/drivers/gpu/drm/xe/xe_oa.c
>+++ b/drivers/gpu/drm/xe/xe_oa.c
>@@ -213,32 +213,40 @@ static u32 xe_oa_hw_tail_read(struct xe_oa_stream *stream)
> #define oa_report_header_64bit(__s) \
> 	((__s)->oa_buffer.format->header == HDR_64_BIT)
>
>-static u64 oa_report_id(struct xe_oa_stream *stream, void *report)
>+static u64 oa_report_id(struct xe_oa_stream *stream, u32 tail)
> {
>-	return oa_report_header_64bit(stream) ? *(u64 *)report : *(u32 *)report;
>+	struct iosys_map *map = &stream->oa_buffer.bo->vmap;
>+
>+	return oa_report_header_64bit(stream) ?
>+		xe_map_rd(stream->oa->xe, map, tail, u64) :
>+		xe_map_rd(stream->oa->xe, map, tail, u32);
> }
>
>-static void oa_report_id_clear(struct xe_oa_stream *stream, u32 *report)
>+static void oa_report_id_clear(struct xe_oa_stream *stream, u32 head)
> {
>-	if (oa_report_header_64bit(stream))
>-		*(u64 *)report = 0;
>-	else
>-		*report = 0;
>+	struct iosys_map *map = &stream->oa_buffer.bo->vmap;
>+
>+	oa_report_header_64bit(stream) ?
>+		xe_map_wr(stream->oa->xe, map, head, u64, 0) :
>+		xe_map_wr(stream->oa->xe, map, head, u32, 0);
> }
>
>-static u64 oa_timestamp(struct xe_oa_stream *stream, void *report)
>+static u64 oa_timestamp(struct xe_oa_stream *stream, u32 tail)
> {
>+	struct iosys_map *map = &stream->oa_buffer.bo->vmap;
>+
> 	return oa_report_header_64bit(stream) ?
>-		*((u64 *)report + 1) :
>-		*((u32 *)report + 1);
>+		xe_map_rd(stream->oa->xe, map, tail + 8, u64) :
>+		xe_map_rd(stream->oa->xe, map, tail + 4, u32);
> }
>
>-static void oa_timestamp_clear(struct xe_oa_stream *stream, u32 *report)
>+static void oa_timestamp_clear(struct xe_oa_stream *stream, u32 head)
> {
>-	if (oa_report_header_64bit(stream))
>-		*(u64 *)&report[2] = 0;
>-	else
>-		report[1] = 0;
>+	struct iosys_map *map = &stream->oa_buffer.bo->vmap;
>+
>+	oa_report_header_64bit(stream) ?
>+		xe_map_wr(stream->oa->xe, map, head + 8, u64, 0) :
>+		xe_map_wr(stream->oa->xe, map, head + 4, u32, 0);
> }

Well, since this is cleared after the report is copied out, it's
difficult to catch it. The only code this will affect is when we try to
detect fully landed reports. I don't think existing tests can catch
that.

Can we plan to implement a test for this at some point? Something like -
mmap OA buffer, read the data using read() call and then checked the
mmapped location to ensure you zeroed out the timestamp and any other
field we are clearing.

>
> static bool xe_oa_buffer_check_unlocked(struct xe_oa_stream *stream)
>@@ -275,9 +283,7 @@ static bool xe_oa_buffer_check_unlocked(struct xe_oa_stream *stream)
> 	 * they were written.  If not : (╯°□°）╯︵ ┻━┻
> 	 */
> 	while (xe_oa_circ_diff(stream, tail, stream->oa_buffer.tail) >= report_size) {
>-		void *report = stream->oa_buffer.vaddr + tail;
>-
>-		if (oa_report_id(stream, report) || oa_timestamp(stream, report))
>+		if (oa_report_id(stream, tail) || oa_timestamp(stream, tail))
> 			break;
>
> 		tail = xe_oa_circ_diff(stream, tail, report_size);
>@@ -311,30 +317,35 @@ static enum hrtimer_restart xe_oa_poll_check_timer_cb(struct hrtimer *hrtimer)
> 	return HRTIMER_RESTART;
> }
>
>+static unsigned long
>+xe_oa_copy_to_user(struct xe_oa_stream *stream, void __user *dst, u32 head, u32 len)
>+{

(2) Check and fail if len is greater than report_size. I see callers 
right now are still within limits, so this should at least assert that 
the len is <= report_size because your bounce buffer can only hold that 
much data.

With 1 and 2, this is

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Thanks,
Umesh


>+	xe_map_memcpy_from(stream->oa->xe, stream->oa_buffer.bounce,
>+			   &stream->oa_buffer.bo->vmap, head, len);
>+	return copy_to_user(dst, stream->oa_buffer.bounce, len);
>+}
>+
> static int xe_oa_append_report(struct xe_oa_stream *stream, char __user *buf,
>-			       size_t count, size_t *offset, const u8 *report)
>+			       size_t count, size_t *offset, u32 head)
> {
> 	int report_size = stream->oa_buffer.format->size;
> 	int report_size_partial;
>-	u8 *oa_buf_end;
>
> 	if ((count - *offset) < report_size)
> 		return -ENOSPC;
>
> 	buf += *offset;
>
>-	oa_buf_end = stream->oa_buffer.vaddr + stream->oa_buffer.circ_size;
>-	report_size_partial = oa_buf_end - report;
>+	report_size_partial = stream->oa_buffer.circ_size - head;
>
> 	if (report_size_partial < report_size) {
>-		if (copy_to_user(buf, report, report_size_partial))
>+		if (xe_oa_copy_to_user(stream, buf, head, report_size_partial))
> 			return -EFAULT;
> 		buf += report_size_partial;
>
>-		if (copy_to_user(buf, stream->oa_buffer.vaddr,
>-				 report_size - report_size_partial))
>+		if (xe_oa_copy_to_user(stream, buf, 0, report_size - report_size_partial))
> 			return -EFAULT;
>-	} else if (copy_to_user(buf, report, report_size)) {
>+	} else if (xe_oa_copy_to_user(stream, buf, head, report_size)) {
> 		return -EFAULT;
> 	}
>
>@@ -347,7 +358,6 @@ static int xe_oa_append_reports(struct xe_oa_stream *stream, char __user *buf,
> 				size_t count, size_t *offset)
> {
> 	int report_size = stream->oa_buffer.format->size;
>-	u8 *oa_buf_base = stream->oa_buffer.vaddr;
> 	u32 gtt_offset = xe_bo_ggtt_addr(stream->oa_buffer.bo);
> 	size_t start_offset = *offset;
> 	unsigned long flags;
>@@ -364,26 +374,24 @@ static int xe_oa_append_reports(struct xe_oa_stream *stream, char __user *buf,
>
> 	for (; xe_oa_circ_diff(stream, tail, head);
> 	     head = xe_oa_circ_incr(stream, head, report_size)) {
>-		u8 *report = oa_buf_base + head;
>-
>-		ret = xe_oa_append_report(stream, buf, count, offset, report);
>+		ret = xe_oa_append_report(stream, buf, count, offset, head);
> 		if (ret)
> 			break;
>
> 		if (!(stream->oa_buffer.circ_size % report_size)) {
> 			/* Clear out report id and timestamp to detect unlanded reports */
>-			oa_report_id_clear(stream, (void *)report);
>-			oa_timestamp_clear(stream, (void *)report);
>+			oa_report_id_clear(stream, head);
>+			oa_timestamp_clear(stream, head);
> 		} else {
>-			u8 *oa_buf_end = stream->oa_buffer.vaddr + stream->oa_buffer.circ_size;
>-			u32 part = oa_buf_end - report;
>+			struct iosys_map *map = &stream->oa_buffer.bo->vmap;
>+			u32 part = stream->oa_buffer.circ_size - head;
>
> 			/* Zero out the entire report */
> 			if (report_size <= part) {
>-				memset(report, 0, report_size);
>+				xe_map_memset(stream->oa->xe, map, head, 0, report_size);
> 			} else {
>-				memset(report, 0, part);
>-				memset(oa_buf_base, 0, report_size - part);
>+				xe_map_memset(stream->oa->xe, map, head, 0, part);
>+				xe_map_memset(stream->oa->xe, map, 0, 0, report_size - part);
> 			}
> 		}
> 	}
>@@ -436,7 +444,8 @@ static void xe_oa_init_oa_buffer(struct xe_oa_stream *stream)
> 	spin_unlock_irqrestore(&stream->oa_buffer.ptr_lock, flags);
>
> 	/* Zero out the OA buffer since we rely on zero report id and timestamp fields */
>-	memset(stream->oa_buffer.vaddr, 0, xe_bo_size(stream->oa_buffer.bo));
>+	xe_map_memset(stream->oa->xe, &stream->oa_buffer.bo->vmap, 0, 0,
>+		      xe_bo_size(stream->oa_buffer.bo));
> }
>
> static u32 __format_to_oactrl(const struct xe_oa_format *format, int counter_sel_mask)
>@@ -699,6 +708,7 @@ static int num_lri_dwords(int num_regs)
> static void xe_oa_free_oa_buffer(struct xe_oa_stream *stream)
> {
> 	xe_bo_unpin_map_no_vm(stream->oa_buffer.bo);
>+	kfree(stream->oa_buffer.bounce);
> }
>
> static void xe_oa_free_configs(struct xe_oa_stream *stream)
>@@ -889,9 +899,16 @@ static int xe_oa_alloc_oa_buffer(struct xe_oa_stream *stream, size_t size)
> 		return PTR_ERR(bo);
>
> 	stream->oa_buffer.bo = bo;
>+
> 	/* mmap implementation requires OA buffer to be in system memory */
> 	xe_assert(stream->oa->xe, bo->vmap.is_iomem == 0);
>-	stream->oa_buffer.vaddr = bo->vmap.vaddr;
>+
>+	stream->oa_buffer.bounce = kmalloc(stream->oa_buffer.format->size, GFP_KERNEL);
>+	if (!stream->oa_buffer.bounce) {
>+		xe_bo_unpin_map_no_vm(stream->oa_buffer.bo);
>+		return -ENOMEM;
>+	}
>+
> 	return 0;
> }
>
>diff --git a/drivers/gpu/drm/xe/xe_oa_types.h b/drivers/gpu/drm/xe/xe_oa_types.h
>index 8906c3084b5f8..3d9ec8490899c 100644
>--- a/drivers/gpu/drm/xe/xe_oa_types.h
>+++ b/drivers/gpu/drm/xe/xe_oa_types.h
>@@ -164,8 +164,8 @@ struct xe_oa_buffer {
> 	/** @bo: xe_bo backing the OA buffer */
> 	struct xe_bo *bo;
>
>-	/** @vaddr: mapped vaddr of the OA buffer */
>-	u8 *vaddr;
>+	/** @bounce: bounce buffer used with xe_map layer */
>+	void *bounce;
>
> 	/** @ptr_lock: Lock protecting reads/writes to head/tail pointers */
> 	spinlock_t ptr_lock;
>-- 
>2.54.0
>
