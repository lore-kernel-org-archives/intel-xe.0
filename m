Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A16BCCA0EFC
	for <intel-xe@archiver.kernel.org>; Sun, 24 Aug 2025 17:58:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4774810E04A;
	Sun, 24 Aug 2025 17:58:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U2/TOMYN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C40F810E04A
 for <intel-xe@lists.freedesktop.org>; Sun, 24 Aug 2025 17:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756058299; x=1787594299;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ZQyYbyogC3B9koVjw9DGmXC5jG67iCJE1i0uB6qSduo=;
 b=U2/TOMYNWX4QzYqlBqr3qVg0smlJRCpY14r5hEwH6o+lOk+2ucIwaioJ
 Szgn7BxhNn7Rk84Djie7/g8XX/EJnN77hHcTyeagVnPpi8B6xGoMBcQcR
 1QA9ygfVyk7Hh9H8MTgL14SEocVvAMKChwMFSgo4PTC7E7hwipHZJYfel
 vHDXtRCsnA+HwC4/a2UH68OLOmQx7tuqQ1M8ovLcLV84GBIorwoeWsSEX
 SstxwEGIf3L+xjw2I9ceNcFx1wZSU0sQhrJF2KPecLCLpNaSZlrXXl3S2
 BMN7DbEDPRmVmP8iiBDXWz/0O/zqUjBOOo0Fu5RvvkIiR7knEW25zd+oW Q==;
X-CSE-ConnectionGUID: /Ks7kiToTy+Ji0pwUhYbEQ==
X-CSE-MsgGUID: y0z6AZ23SBG4Jf49T8KfVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="58425683"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="58425683"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2025 10:58:18 -0700
X-CSE-ConnectionGUID: JQlXTVl8SF69m+MBBt3m9A==
X-CSE-MsgGUID: YiDqT56IQ7abeZDz23zGxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="168326894"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2025 10:58:18 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Sun, 24 Aug 2025 10:58:17 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Sun, 24 Aug 2025 10:58:17 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.53) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Sun, 24 Aug 2025 10:58:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XkNXSzccOG+GzrrVbP9y76/q5wT+Xvg5v+R31Ya8pL2LAW3vApeTMARntWezfMeUbwR3pXg8nwx4z1aHFnYamFyHNqbXDFWMnqiqufN0ihyUrZ9ym0bRiwgM2uzRPMaDIjl+8mgKRbBk50wRCjeoNMuogiGMt9w1laESBN9RBJOdne3OcigiQ5roUlaAb5x3fvVeSjaqdGCPHJYcvViIi6Rg3VJYb7P8DczrhKYaL/VQ8SnlJmrzokhdZnh2kPy0SRlL5PGHvZaw7wDZ+VhFdkV61nIjWNRtTr0hxcN6jRDyWRlsWHo2gcI4yl7bC2F4g1GHxmBEE1eTEJPm7vjNiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Iif10bqD/a4vKpyf7eUBrWavjDQqJ1QintHGuEmdMI=;
 b=DYHqYjLePZ9Mc2/b98hEGvI+6w5hOY6CwqqVrxgyTL0kSUTjhVzFRdcj4mAfiJhQ816i0x1JlnMLHqi81w4nb/7Dk4eoAII48bHoZOGASz3cpUc3govTBY4zT2L4RMHtKC3knE7O/OtTqDmkDkq2DZH33PWkvSpe9GKSymxSsjgg8WbQYuMHP7P96fneWe57XwN4ypsj+5hX8+vAZccOTO/IPb0BJvB/mm+qwbHEZS2XqjNZgaPJOq4phxGfN4zah7w73MpQUrHATjT+xG9COk8WgJGoUC+xEX90migkXKbcfv6mIhseprZjb1M7dAc+bU0iFfO5JM7ENatgB4ZIGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN6PR11MB8101.namprd11.prod.outlook.com (2603:10b6:208:46e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.19; Sun, 24 Aug
 2025 17:58:15 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9052.019; Sun, 24 Aug 2025
 17:58:14 +0000
Date: Sun, 24 Aug 2025 10:58:12 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Tvrtko Ursulin <tursulin@ursulin.net>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v4 0/7] Use DRM scheduler for delayed GT TLB invalidations
Message-ID: <aKtStOG7FFuzUgv+@lstrano-desk.jf.intel.com>
References: <20250724191216.4076566-1-matthew.brost@intel.com>
 <5339ecf6-05f7-4714-8032-c0508259f4a5@ursulin.net>
 <aJpDw9ruWXJjXg1X@lstrano-desk.jf.intel.com>
 <d8a07019-895f-44db-ace7-1fd9324de573@ursulin.net>
 <aKjUylKzWhQAA64L@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aKjUylKzWhQAA64L@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: BY3PR05CA0044.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::19) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN6PR11MB8101:EE_
X-MS-Office365-Filtering-Correlation-Id: b929831f-4d56-4351-32ef-08dde337cc1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|1800799024|376014|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aXh1TUZFb0RDQjQzYVdZWmlocUplbWJxWm1FZ0xmQklmeEJpTit2QkgxcGgv?=
 =?utf-8?B?bTNlb0ZFWS9BZnZxVlIzSzF6Vm5abmtwY0h3ZGhPUWVEaUlORU5wQ0FwOStW?=
 =?utf-8?B?QmpFY1JvemF4ZU9BS1FaaEM0dmlRMkVjZjNqRUd1Z0Izdlptak50cjlyM0ZX?=
 =?utf-8?B?QW9ZaG9lRWhqQnozQUdVbnFhRVBXc2FvakdnVXorY1MwaXVIMmljbEl4cUI0?=
 =?utf-8?B?aW5TcmRNT3ZoeHNKVnVWeDkwNEZBd2pYNXZxdXgySWhWaEFVdlVvNnpaMm54?=
 =?utf-8?B?MGhRTno1dGxDOWsyTFU0eHVzTGZleVM1TFRmMCtaM0cwbzFOWVdrS1FGcHp0?=
 =?utf-8?B?bVc2aFhJUFFnNWs3enk5dE1OcTF3Vkx4ZC9iL0NLbWxUOGNqekpWRUFXTDJr?=
 =?utf-8?B?anlnQjg2aHJXZTB2L29JM0c1M0UwUm9XcHJyWHlwd3ozSXhpdHJXdHdQMzBC?=
 =?utf-8?B?cW1YazIwSjhRZndBczc3ejVsQ3BxZStOQS92ZTNrR0Q5SklkUjBJTFVaL1h4?=
 =?utf-8?B?M1ZwRER2TFArN2hVK043NUZUemV4T3NyREM3eFZjQWhUR2V4a0FtbmZPZEhF?=
 =?utf-8?B?dGdVM0s0U2tObnhoVnQ2YVhiUVhQMTlMNDlteWFmb2Y4ZW5qcVgyNWU2ZTEr?=
 =?utf-8?B?ODBYSzRhMDdiT1ZFT0VOa3hwcHJaczNMR3ZycnZ2Z0EvQUorVGtoVGp2YUQ4?=
 =?utf-8?B?SzZOSUpTUjZDcjFUaEd5OE00VlR1RWhEUnJrVmJnQjg5cHRDVERjdllWZTVX?=
 =?utf-8?B?WjNQQ0tVZDlTdVRLd3grMjcwZEF3S29zeTJLTHQ2SlI4eEJ5dTJST2NQaWtP?=
 =?utf-8?B?TENCdE8rMHhLRTcvSGFHNksrSVcyL3FWNFQ4dFRnenA2QnFaMUlmV0tnSlZO?=
 =?utf-8?B?RGljNm9tcGcydXFUMjFTQnFhZ0dYUXlFaCtseHFFckZhS2ZlZW9QNGdRbE1i?=
 =?utf-8?B?MTNZMWdjZm5yblQzRktLMjBKLzJnQzUvRUREZklpTEJIazA2anVtVW91T3Bp?=
 =?utf-8?B?WlJmMlhnR1VuZitRLzQrcUR0aFlrTmNpTHN4Nkg3VTBQNFZTaXAxaXJzdk8r?=
 =?utf-8?B?YWJENzNQR2N5Z0xzYUFsbVdTQ3NVVzRrb09nNVorQndqVS9lK2pjVWxwc1Iz?=
 =?utf-8?B?NW9MT0Mydm1HK3JTa1YvdTJEaEN5YjUvdGVkRERuWDRKMXJyNDk0QWJjZlN3?=
 =?utf-8?B?c2twVktBb0NpSnZGNWx5UzR2Tm5pWGJieWhYOFdxRVVPam5pTTJua2lWdXdM?=
 =?utf-8?B?ZkZQRStpS3V2R0hCVldWMzREdzNNbTFXa2J5MmpCU3h4WXRBWko0Z2svZjBh?=
 =?utf-8?B?WGpTdVRndENndFNDcm54Rnp0dk0veWxlNHBuUmtiWTlLK2t4MGNqdExoMnBv?=
 =?utf-8?B?SWVYTmRlaVNpZVc4VUhvMDhrSU1nMmJTcm5XK0RSWnhVWlpmd1BTWGV0MUFr?=
 =?utf-8?B?NUlCS05tT3I4SHZmdjhwbEpqRU1pOTV5YmZYb0ZJRkFQQUMxWjhtbGp5ckJ0?=
 =?utf-8?B?ZXY5NTRiTmhTa1VuUWJySGRiVnZoZjhSeU00NzZLSjQyOVZaQXhYdzVLR0JN?=
 =?utf-8?B?bUt6blBOS2s2TVVOakE3MXV0RnMvTHJLMHVHczR2SkR3cGJSVmV5QTJFSG1w?=
 =?utf-8?B?WHVwRFE1WCtHWHZ6aU15WWhSbkFnQWVvbllUWUxvdWRXWXJPTTh3dzJtQW90?=
 =?utf-8?B?ZWk2YmpCNTBLdHVYWTA2Z3VxMTFlVDIxNWZsaXY0VFB3dUFwdjduYVUyaWxF?=
 =?utf-8?B?NG42VXl4QW12RVU2ZGxuM3N2ejkxQWtYRzR0L2hzMWlrSStpL2JleHVuRUpr?=
 =?utf-8?Q?k3JXsJR+IQl3Q16mdYD+U6ZWVbgqp9xkuQ2OE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dFZQWGVINWpvM3ZzcVNuVDNmWFVVczR5ZWFxbW5OcFJBOWZiaVZOcE1pWG9H?=
 =?utf-8?B?OExhSmU1SU9yZDl5REl3UTlKWCtwK1h2eXBhYXQxTFlQU1pHdnVKK0o3TENp?=
 =?utf-8?B?dnVWanhobWh6WE1URjBNTEtTZUs0ZVJBMnlWRTZiRm0rbWM0VEw5SjJtTGhn?=
 =?utf-8?B?eWI2bDh4QUxBcTFhV1NRQTRWbXZVUTF6bmxJTUg2VUpSZ0ZwVGRFMzl0eGZu?=
 =?utf-8?B?SWNhZ2J4Z1phTk9WNko4V0QvYm9sdXp5R3FrVS9EVW5BaWwza2xCUTF0ODlL?=
 =?utf-8?B?ZUYzN0lNN3NzZnRUL0Q1WDNWSEcrenh2elJnS0hkc0F1bkJRMDJJZEt2dEJS?=
 =?utf-8?B?QjgwaHJpMk50L3dVdE9IRGc0ZU1FaE5wdFRBaG9OZmNkVnFNUTh0TUR1ajVo?=
 =?utf-8?B?b3pxeWJMNEYvNkNTY3hsbXNGNi9yU0EwQVc1RWdQQ2htbXY5MjJZcjVaczgy?=
 =?utf-8?B?RVlKVHNHZVBpZEJnOWltUU40bkp5d3NUMzc4WlhoUlhXSjVRSFJPMTZyMFZK?=
 =?utf-8?B?dldQMjdRODc5bHpWYy9kcVNQUll6MkxXc0dwdURmckJXSW1nalRkU200VDdk?=
 =?utf-8?B?NXE4WTJ0eVFrbXU2WE5lQTFSVzF4S0twdHkrdENtajBheGxtRUJBcXhiUUJw?=
 =?utf-8?B?TURvemNGSFBqV1N5OUNoaVVCQTJBZUlTY29kZVRHd2xBQkpOc1I5YTM2Nmoz?=
 =?utf-8?B?ZnBKeUs1Yi80bU5obnpjamxrVXpQYnNVQjNQZFFPaVVZS1Y0dEN1dC9ZODhB?=
 =?utf-8?B?aDAremRNWU4rb3BhQkNlN2t6VjA1b2dpUGw1VHpVV0VDS25hZG02dmY2b3g0?=
 =?utf-8?B?NnlUZWNVajV5YzNXKzZVaTF4aWxXSWlKdDVWV3EramVTRk5rVXFZbGtQeUJE?=
 =?utf-8?B?aGpVbVEvRmJ0UXM1WjI5bmRwTzhPOStZOVNabFJwVi8yMW0zWVpDeGhRazRR?=
 =?utf-8?B?VTlGcCt5RnFINXRzaDI4dm1KV3pucVBEWUtnanVjbVVLMnYwTnlocEpGRVdn?=
 =?utf-8?B?bWNVanFZYjFuWFBiZ1pZQjRDYUIyakxZdy9aRWRyR1ZQbXlDVG9SY3BHUEZp?=
 =?utf-8?B?a3ZROHhtYlVqL2hFdkc0THRxU1h2aUlEMldKOUV5d0FCcWNwTmFRUEUwbTRN?=
 =?utf-8?B?NkltTm41emdwSmsyRjZJTm40TFdKOVNNUHErNUFiV3pxeTlIbEtKSUhVMVRU?=
 =?utf-8?B?VWxLWEd3eGo5YTJwUXAxMmhPSjdkMXpCZW9mejRNODcvK3ZPYlQxZnNUKzcw?=
 =?utf-8?B?Y0U5VFh2VEplcXBLYU5uWWd3cU0yTkxDbEljMGxuZTFYbGtkUnAxKzVKMlMx?=
 =?utf-8?B?UktjS2RkOEtjQ0pqUHNnT25lM1BTR3NtRitmanlvL0Raem5Sd3hHL3JTVjhp?=
 =?utf-8?B?VWNpck5xb3hkcUdhbEV5aWNVZGRFTjlKbndrUVY2OVJMdGpMS2c2UGhid1Jm?=
 =?utf-8?B?SEZGSDJXcm9YVDgxamdlNm42dzZaNXVuMlZNaW5rQ1h6L3htYnFMbjh5UzJj?=
 =?utf-8?B?NWlNRXdjSDBwYkFXOUx6N0tRNEFrMHBmMldCUk9ZcC9DNlRuZFpJV0NrZTF6?=
 =?utf-8?B?YlJhV1NPQ2krRGcyUlVrdEphZjYvWUtrWXlsOFNEOVdQZzU5NXNCSkZNVmsy?=
 =?utf-8?B?OVhid3RpYjNPWVE1YTVsT0VsRkdjcFI1Vjlzc0NFeUlxVzgrd21Qcmw3N1U5?=
 =?utf-8?B?a2szalRjWFg2aVlabzZ2c0VWaTNCYW1DR3lBa3VtV2RZdUJzYkY3Q05qWEhz?=
 =?utf-8?B?UG9qSEJVRE1MVzl2WnptcVJaa0s2N3h2U2luVi81UW4rTGVsS1U3ZFV0VjNo?=
 =?utf-8?B?MGdQOUlXL2FkbjFsaUxHaUNMSGVpcytwM2x4RHFueDZhc0swV3MvMC9raWND?=
 =?utf-8?B?ZGVxNTRYWlh5RGxCQXdWOC90N2Y2bzlBdTRNdzR1cVBOQ0VmRWxzaUY2aWNI?=
 =?utf-8?B?VVg1cXJNQ1FTd1ZIazVTaS9MeXVIRHBTamhlMCthMnl2TjdyM3pyNGtNMWtq?=
 =?utf-8?B?UVk5L2MxOUZVTm5mSjJnbU1CeGZXQUpoS2NlVnUwTUdZQWRTaDQrSnZjMUE2?=
 =?utf-8?B?NWtJZWV5Vk94VjR3cHFuYlBzUGtSNHd0d1BEbC9FcnVCaDIvbmp5c2lWN0dV?=
 =?utf-8?B?TXMrcWVPU0plSmlzWC82Z2w5V2FRc3dSYldiODZxdHdURmZITmFSOG1yMnpo?=
 =?utf-8?B?QXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b929831f-4d56-4351-32ef-08dde337cc1d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2025 17:58:14.5374 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uO3gYjyiUEXavix19yGwY/Hmi/Q1k6IWea2bYgohePh+V1nb0GuKg39Y8fsGjxVQ7eSPHRiZyu0szOCRzqxDuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8101
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

On Fri, Aug 22, 2025 at 01:36:26PM -0700, Matthew Brost wrote:
> On Fri, Aug 22, 2025 at 01:39:18PM +0100, Tvrtko Ursulin wrote:
> > 
> > On 11/08/2025 20:25, Matthew Brost wrote:
> > > On Mon, Aug 11, 2025 at 09:31:08AM +0100, Tvrtko Ursulin wrote:
> > > > 
> > > > On 24/07/2025 20:12, Matthew Brost wrote:
> > > > > MIME-Version: 1.0
> > > > > Content-Type: text/plain; charset=UTF-8
> > > > > Content-Transfer-Encoding: 8bit
> > > > > 
> > > > >         Use the DRM scheduler for delayed GT TLB invalidations, which properly
> > > > > fixes the issue raised in [1]. GT TLB fences have their own dma-fence
> > > > > context, so even if the invalidations are ordered, the dma-resv/DRM
> > > > > scheduler cannot squash the fences. This results in O(M*N*N) complexity
> > > > > in the garbage collector, where M is the number of ranges in the garbage
> > > > > collector and N is the number of pending GT TLB invalidations. After
> > > > > this change, the resulting complexity in O(M*C) where C is the number of
> > > > > TLB invalidation contexts (i.e., number of exec queue, GTs tuples) with
> > > > > an invalidation in flight.
> > > > 
> > > > Does this series improve the performance of the TLB invalidations in
> > > > general?
> > > > 
> > > > I am asking because we are currently investigating a problem with Google
> > > > Chrome which apparently suffers a lot from latencies caused by TLB
> > > > invalidations piling up after a lot of tab switching causes a lot of vm bind
> > > > ioctl activity.
> > > 
> > > It doesn't improve performance of the actual invalidation rather the
> > > time to create a VM unbind job as it avoids O(M*N*N) complexity
> > > explosion. I originally saw this in a case of many SVM unbinds (i.e. a
> > > free / unmap is called on a large piece of memory) but many VM unbinds
> > > in short period of time could also cause this complexity explosion too.
> > 
> > You are saying it is just CPU utilisation and it does not show up as
> > submission latency, or it can?
> > 
> > The soft lockup splat from
> > https://patchwork.freedesktop.org/patch/658370/?series=150188&rev=1 is due
> > drm_sched_job_add_resv_dependencies() literally taking 26 second beacuase of
> > a huge number of fences in the resv or something else?
> > 
> 
> Yes—there were a huge number of fences, each with a different context.
> 
> The initial patch addressed the lockup but had issues; this series
> properly resolves the complexity problem.
> 
> I also greatly reduced the number of invalidations in the SVM case [1].
> That alone likely fixed the lockup, but I went ahead with this to
> address the underlying time-complexity issue.
> 
> [1] https://patchwork.freedesktop.org/series/150257/ 
> 
> > > By making all invalidations from the same (queue, GT) share a dma_fence
> > > context, dma-resv and drm_sched can coalesce them into a single
> > > dependenct per (queue, GT). That keeps the dependency count bounded and
> > > eliminated the SVM panics I was seeing under heavy unbind stress.
> > > 
> > > > 
> > > > Also, is it related to
> > > > https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2162 ?
> > > > 
> > > 
> > > Maybe. In this case, a flood of TLB invalidations overwhelmed the GuC,
> > > leaving it no time to do anything else (e.g., schedule contexts). It’s a
> > > multi-process test, so the driver-side complexity explosion likely
> > > doesn’t apply as this explosion is seen within a single VM. What we need
> > > is to hold TLB invalidations in the driver and coalesce them to issue
> > > fewer operations. I have patches for this, but I haven’t cleaned them up
> > > for posting yet—we’re in the middle of other TLB-invalidation refactors.
> > 
> > If you would be able to send something out, or share a branch, even if not
> > completely clean that would be cool. Because I should soon have a reproducer
> > for the Chrome tab switching issue and could report back on the real world
> > effects of both.
> > 
> 
> The last six patches in this branch [1] defer TLB invalidations in the
> driver when a watermark is exceeded, which should prevent overwhelming
> the GuC with excessive invalidation requests. They’re built on top of
> [2], which will hopefully merge shortly. It would be interesting to see
> whether this helps with the issue you’re seeing.

My links are screwed up here...

Let's try this again. The branch is [4], it is built on top [3].

[4] https://gitlab.freedesktop.org/mbrost/xe-kernel-driver-svn-perf-6-15-2025/-/tree/tlb_inval_rework?ref_type=heads

Matt

> 
> Matt
> 
> [2] https://patchwork.freedesktop.org/patch/658370/?series=150188&rev=1
> [3] https://patchwork.freedesktop.org/series/152022/
> 
> > Regards,
> > 
> > Tvrtko
> > 
> > > > > Admittedly, it's quite a lot of code, but the series includes extensive
> > > > > kernel documentation and clear code comments. It introduces a generic
> > > > > dependency scheduler that can be reused in the future and is logically
> > > > > much cleaner than the previous open-coded solution for delaying GT TLB
> > > > > invalidations until a bind job completes.
> > > > > 
> > > > > v2:
> > > > >    - Various cleanup covered in detail in change logs
> > > > >    - Use a per-GT ordered workqueue as DRM scheduler workqueue
> > > > >    - Remove unused ftrace points
> > > > > v3:
> > > > >    - Address Stuarts feedback
> > > > >    - Fix kernel doc, minor cleanups
> > > > > v4:
> > > > >    - Rebase
> > > > > 
> > > > > Matt
> > > > > 
> > > > > [1] https://patchwork.freedesktop.org/patch/658370/?series=150188&rev=1
> > > > > 
> > > > > Matthew Brost (7):
> > > > >     drm/xe: Explicitly mark migration queues with flag
> > > > >     drm/xe: Add generic dependecy jobs / scheduler
> > > > >     drm/xe: Create ordered workqueue for GT TLB invalidation jobs
> > > > >     drm/xe: Add dependency scheduler for GT TLB invalidations to bind
> > > > >       queues
> > > > >     drm/xe: Add GT TLB invalidation jobs
> > > > >     drm/xe: Use GT TLB invalidation jobs in PT layer
> > > > >     drm/xe: Remove unused GT TLB invalidation trace points
> > > > > 
> > > > >    drivers/gpu/drm/xe/Makefile                 |   2 +
> > > > >    drivers/gpu/drm/xe/xe_dep_job_types.h       |  29 +++
> > > > >    drivers/gpu/drm/xe/xe_dep_scheduler.c       | 143 ++++++++++
> > > > >    drivers/gpu/drm/xe/xe_dep_scheduler.h       |  21 ++
> > > > >    drivers/gpu/drm/xe/xe_exec_queue.c          |  48 ++++
> > > > >    drivers/gpu/drm/xe/xe_exec_queue_types.h    |  15 ++
> > > > >    drivers/gpu/drm/xe/xe_gt_tlb_inval_job.c    | 274 ++++++++++++++++++++
> > > > >    drivers/gpu/drm/xe/xe_gt_tlb_inval_job.h    |  34 +++
> > > > >    drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |   8 +
> > > > >    drivers/gpu/drm/xe/xe_gt_types.h            |   2 +
> > > > >    drivers/gpu/drm/xe/xe_migrate.c             |  42 ++-
> > > > >    drivers/gpu/drm/xe/xe_migrate.h             |  13 +
> > > > >    drivers/gpu/drm/xe/xe_pt.c                  | 178 +++++--------
> > > > >    drivers/gpu/drm/xe/xe_trace.h               |  16 --
> > > > >    14 files changed, 700 insertions(+), 125 deletions(-)
> > > > >    create mode 100644 drivers/gpu/drm/xe/xe_dep_job_types.h
> > > > >    create mode 100644 drivers/gpu/drm/xe/xe_dep_scheduler.c
> > > > >    create mode 100644 drivers/gpu/drm/xe/xe_dep_scheduler.h
> > > > >    create mode 100644 drivers/gpu/drm/xe/xe_gt_tlb_inval_job.c
> > > > >    create mode 100644 drivers/gpu/drm/xe/xe_gt_tlb_inval_job.h
> > > > > 
> > > > 
> > 
