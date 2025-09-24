Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19F09CAC5A5
	for <intel-xe@archiver.kernel.org>; Wed, 24 Sep 2025 09:32:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD40A10E6DC;
	Wed, 24 Sep 2025 09:32:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ghlWBiUF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B24F310E6D1
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Sep 2025 09:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758706339; x=1790242339;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=+e7V70kFobyj3zjDe1MgP3EdeJ9wEh4j8nsrb9astHs=;
 b=ghlWBiUFPRhEn5q4mwAZN/wMU/2C0CQ3tdru3wl2IXxo1xQVa83i0qtF
 rkgXGamDI72Bbn2ZxQl9WAq4C9Mmao/GFt5irxwvbfxR0wyCiaBpjKaiL
 rE0OyV7Wy9IHKLcwtKTy9USkz3mp8rr5HftpoVR9qeUE2krZQaA7aam5y
 4vg0Q3u0vtYFtjhJYxV2SPGyQB1hvbmBzBQdhKRwgjwpcNGOGHJf2K8J6
 PQfg3eQx/t03oh6he62mPPksV7puqtbgPFpSLG7EZk/DGP4kr6qLO9qEN
 gpt9RKDZffJa9YtmpQsbK8cexVRSOKP9v9a7qtlh52C717tgcxOWCl6GF w==;
X-CSE-ConnectionGUID: 7eLCtusjSI2A+jgwQ+hngg==
X-CSE-MsgGUID: ViQOhEcbR3mNUIW9CsBUNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="60702695"
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="60702695"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 02:32:19 -0700
X-CSE-ConnectionGUID: OmQsFq5QQwqpGMxpWcksuw==
X-CSE-MsgGUID: GnxMpFs5RDatRehOZXjDFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="182160663"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 02:32:18 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 24 Sep 2025 02:32:17 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 24 Sep 2025 02:32:17 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.4) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 24 Sep 2025 02:32:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KHSowmCG5zlHChGlk4nRvZLQGwcnvNPfcpgxYjBN09FeF+gGQmN1xGYUgmYRKZTybyVJQKzfGiEIkiHD4FVG8yD8vit3ZtZC3+8H8oNFfx8UqFGLJDtjNjXP6XUaXtSYKIQo1LHUjoLVUAIzUIVB4w24GeeUF4lqM5LWXI6321KqXRngeglHQ7v2cGCfWbX/OGrtqpWDvREoK8cjfuJOTcoCUM8FQFLI9C1yHAkixIQoCACTO7dYhQT1EZRR/DrOVI60lF5cPcqebpft6rL4npUk5tESrvdTa5yXqLWAKaShe3DsX+C7Of003Lo2vwzebs0a793JeqPO5ERhvivExQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fNFSa1QJR8OafZHHPNm77gX8qWv+sWPZCarYl/qBeNo=;
 b=Wr5SQWhRFJRZV9qrPXGmqHHVIG+LkAPyv829UZoJ3OfOBMHJkcWasbOnjdVdeQTM3gq+QK4SVknHIc+hS1k2YFtzSixy4Xi1MC4hdFdb3i7Tad+x8GZV2dXFf/G2NiqNFQMpgcCvkrDxIZApst+09s+/0NwMAjeo0sQbfIp5tAY7KKYhwnioatwTN5XLxmUP40C2S1iSQGCIXJbs1HeNq4j4UWs45ZpiZY7EcNP5ibFC14pklMVIh+FvSoBggK6KrQN8nI8XQ4VbsPEuNIJDiNt/FctFbGmqYt95t69P7meTQBiptetgIs9jIhTGGajbYe0vhTx+UAvxQ+r+6bty6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DS0PR11MB7443.namprd11.prod.outlook.com (2603:10b6:8:148::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Wed, 24 Sep
 2025 09:32:12 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9137.018; Wed, 24 Sep 2025
 09:32:12 +0000
Message-ID: <f7d9e968-b6cf-460f-bc98-5408dde828cb@intel.com>
Date: Wed, 24 Sep 2025 11:32:07 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/34] Revert "drm/xe/vf: Rebase exec queue parallel
 commands during migration recovery"
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20250924011601.888293-1-matthew.brost@intel.com>
 <20250924011601.888293-3-matthew.brost@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250924011601.888293-3-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0202CA0020.eurprd02.prod.outlook.com
 (2603:10a6:803:14::33) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DS0PR11MB7443:EE_
X-MS-Office365-Filtering-Correlation-Id: 7383ba24-6a41-4b9d-b2c6-08ddfb4d3dbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dlhhaG9neHNtVXNJZVNScE90RHhYK1p1TE5lVWpyTkhIVTZJMWRMb2lFTEx5?=
 =?utf-8?B?QXlTNjZxZHc4VWl4QW9YTlNoWi84ZlhIbFowaWVpRWc3b0lnSzFCVm0xdHBo?=
 =?utf-8?B?M1N2SlZpblJLWm05V3FmdFl0TmdYeVhmQmx0U2x0ZXpTaWRSUzhGTTVrUWwv?=
 =?utf-8?B?YmNnd1MzcE1zazNRNGhSYXo0YTNIQmowVTNIWWFvcm1CZ0taUHZiKzI4YmFj?=
 =?utf-8?B?T1NDOHhNT0tJcEFpMlllRG53UGExcy9ndHRrYVZYUHdPT2NrRDNpaUN1Y25R?=
 =?utf-8?B?eE1hRlRtVFNIQWZ6MWpwY3RnT3RhS3k3ODl3bG0wTFhUdHo5L3BzdmEvQnVM?=
 =?utf-8?B?cC9sUEg5OFRudTAyRFdPR3JPa0RCQ3pUbEdyVTNOTjZkREwvSjNaSEhRSEZp?=
 =?utf-8?B?SWEzd3hzREZGS05pVzYxZXc3RSt0SFJtZlhiK2wrdFNhL08vdnppOWt4M01T?=
 =?utf-8?B?ZFBEZC9RUHFlYUpVdGRFamJmZ2RlVzhLWFo3cjIzWWxrbWk2ZGhiWXRhY2xj?=
 =?utf-8?B?K1BVMTZrTW9sUVJjcFF3VzVIMUpzcW9oa1ZWV3J3MGtZOVI5M0JVUDJ2MkJJ?=
 =?utf-8?B?L3Jyclg2Yk5SWm9XMUVHSFdxZTl0R2E5TnVVZ2FSR3dybXByVVhKc1VXN2dO?=
 =?utf-8?B?c0NFT2tjcFhxMEtvbUdMU2Rzemc2Z094aTRFQzR4ZUVIMTBrUGRTS3prbkJF?=
 =?utf-8?B?KzB3dlZzYmxBdjZIR1hHbGpleHgrOEVvcWdPanc3S09tWWtleWxWMmZmSVVL?=
 =?utf-8?B?aWpaeENQOGh6OEUySWJRNUVTU0RJbjJVazlDRDR0Z3pJOTBqekQwWjhUNG9Y?=
 =?utf-8?B?RWtVTGxGUisvZzdhOXlINm51ZzlGUGQ3ZjJYNTJGZHpYUUYydmxqdCtzN2k1?=
 =?utf-8?B?T2p3SFp2V2xrMW1mNVVPY0lTWWN5SUFPdEFHak5KZ3pwdVR3WS9PclA5SVIx?=
 =?utf-8?B?ZDlySXZ6NTdZa3VjWVVwVkVkQThVSFU1WkZrRjUxMitLeko2NWc5SzY3WUdU?=
 =?utf-8?B?d1hwb1hTQjFtdTdIUmZETEdTQk9RWXkrbnVCMjF2WTRFZHFKQnVZYXFmcE5u?=
 =?utf-8?B?NU0ybUlrZEg4bVNZUzdKRDNQM0FGMXd2UnRwNnl2cVV3VVNUSHlZdUg1V1My?=
 =?utf-8?B?R1JndjRMU0F6UEUyZGx2TndHQ3gxRGJ1aWxYWmxCV0hpNHpENSthN0dhWTRu?=
 =?utf-8?B?WEZBR3k2bHNJM3NuM1JJNXZqM0I0Q2JsYlhUZ0d1eEFTMldMKysvMDk1aFJE?=
 =?utf-8?B?S28zVGFRUVF2Yjd1NmQ5aHhxRFFUbjBSNWlRTUorYWpIdldOYjB6akNnang0?=
 =?utf-8?B?bVhNYUJwUWFOTTF2SVkzYnZvQmJUUFlqTkpzWDhySGJHeU05Wk1XY1k0dm8r?=
 =?utf-8?B?Ny8vZzRoeFU3cXMwdHRNRjhQekt3SnpCd0YrZkQveldCQ3NTSTVQbjdWRGxr?=
 =?utf-8?B?MHo2aTBydTRGQ2tHby9Yekplamc1V0YyN0ZQT25Va004VG8zSVRKdDVUV00z?=
 =?utf-8?B?RzJqRjFwcnhzQ0VRMmQxYjRZbEZ0c1pjcTRwdnBsZ0MyU2I5eFgwMDBqRmYx?=
 =?utf-8?B?Sm1DY0k0REY1NzRoVzhnbkdZeXZCTUNDWVJXTHFRWGNnall2WDY5eTB3Wjh2?=
 =?utf-8?B?NnU1UG1kc2t1dkZ0cnhDcDc5eG9LZFQvcUYxc29zOHlRT1V3MldjcmJHSm9Y?=
 =?utf-8?B?SEp6UDBuY0ord0VCbCtsUi9LSTRDMzM5YXVzOW5UOUJLYWxPb3dtMVp2SlRl?=
 =?utf-8?B?Yk92RG04cEJrUXJ2ZFJTWFZYK3VpNVlmN0JCa1NWMmM1Qi9UV2pTYnkyZVk2?=
 =?utf-8?B?bHhZV2xqN2czUlNGQjlFa0lHdEJsUUVkQktCMlY1RWtiUjlwZ2VucVpuVDBa?=
 =?utf-8?B?MHVDc0JUWms2Zzdkd3RRQjR0aFlhSlB3TzVlajRHenRqSlE3ckZzcE93Q0NY?=
 =?utf-8?Q?LTUIb8h3SEM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UFBuSXZLTm40L0RacFNSVDREWk4rMXp0K0VDYzhwZVlsOU9mSDQ0cGMwWjdS?=
 =?utf-8?B?ZjBnRG5vWkZMZTNQMHNLbjM1NWtubU9qZHFZU2hCc0YrU0Z6Uk5NR1F4Umty?=
 =?utf-8?B?czJHbU95U24rcGE5RWY5cjVMVE40V1B2SWlnaU9hYkVwUzNZdmRCZWFVNFI1?=
 =?utf-8?B?T0JOclZ4ZTA5OTk5ajhESityT0lhdW1saW9CTmVQY1JDM3UzVTlLMzVqUGNU?=
 =?utf-8?B?cDZVRFh5M0szVENDSHNFbUdYcDBqcDhqUW83QkpKVi9HTzNlRWlOODVmQVdL?=
 =?utf-8?B?Vm1TdkRObXpDSDZoYU9MY2Y2UEFLZi81MHozZFBnTXpIckI3VlJMZHZoaGNZ?=
 =?utf-8?B?S2tUempTNEgvMEx2T3M4MkVSYTNXTzlOejNlQlA4RkZ3MjVXM1hZQktkalZz?=
 =?utf-8?B?cUQ4V1lyL3diekZHQ2FpQ2RWSWZHcEJ2cnpCc2UyT3F3UW91YXpwTVZHUnc0?=
 =?utf-8?B?VjdpVUl1d3FKK2xTNU9LdzhjRkd2L1JRSkIzZUZFYXZpR0g3Rlo0RG9TNHZn?=
 =?utf-8?B?L24wSFdwRHFzU0xEZi81emt1K3lZVXlRbHdoZHM1alJCdXYwazFrL2VDVGsx?=
 =?utf-8?B?YlhtTWwxVWY5Z1BmSkNxbXpCMjNFRC91Qk0ya1Ivbkc1aC9hVWV2RnlVRExH?=
 =?utf-8?B?RmtxSGRneC91WmJTNkpDdjl2YTFtSy9hNTJURCs2RWQxMHMzN05ObzZBWHk2?=
 =?utf-8?B?V0Zyc2pBdTVUa1JYNzBUR0pMV0hNVXpZK0s3MkJjVnVXaXlGcTJMSEl6Tzgx?=
 =?utf-8?B?OC9XM0VsWHpKbWorbnUrVWRMaGFWdjJrZkxycmFWb3FERkozMzY0bVFZcE9r?=
 =?utf-8?B?ZkY3VTlsV3g5b0lFdVdwT0ptY2EraFZ2Zjg5WkRObEpiclhIamVDRHF1T2Ez?=
 =?utf-8?B?QktvTlEvQ3ViRURTeURDVHZkNnRoWmJ1UUdva3cxMlNjTDJBSHk3aXR6L3h4?=
 =?utf-8?B?ZlNVRm51Wmk3WEgwOHFXR1BTQWNtclkyWWNKTVVRUWNZUjE1VWo1NGpDQlQr?=
 =?utf-8?B?LzdzNlpudVE5RVFnYmtJczBZcVV6TXQwNmdKL1VIYVYxK3dYano0bUZudkpX?=
 =?utf-8?B?a3dFMmhLYSthajZZT3hUYkErUDdqT3l6cFpwOVpDQUpnRWhrK3lGdFp5Tnp1?=
 =?utf-8?B?R1loL2VId0NBWEF0M0dVSW9veVB3bCtUd3B5YnRLNlZNQ1dTLy8xbzRHM1RN?=
 =?utf-8?B?dXhLN1ZpcEs4Nm1RLzRpdnBEUWNtc3FhWmdvdXB6SHhsMlpvUER4Z3Zhamor?=
 =?utf-8?B?My9tY2dNZlIybEFQWmM0emk4dER4bFczL0hmdlFDaXdXWWdyVEx2d1ZILzEv?=
 =?utf-8?B?YkxvQUVuOWoxcGtGamVxenRad0YxV1l0NDFmWlFRcStQS29mMzV2dWlWbXVN?=
 =?utf-8?B?L2FkZEtBVVprT2t6VVluUXMvWlhGRktkZjN2Q0hpRGtaQXo3MXFiSy9TQTAy?=
 =?utf-8?B?bzF0SndMTzB0YXdDT0FzdW9TVDRLdXkzMGRpbTQ5dUwzcXJ6QWhwR1R3WEdL?=
 =?utf-8?B?SFJVNHIyMmltc3cyend5T2YxaDRzWi9JUFhKeXAyLzZ4a1E2OEQ2WDByQ0pu?=
 =?utf-8?B?SGVIZWVvUXY4TDBkZHVzVUYweGJ2Mk1YeXZtWWg1bjhDTjZtdk9VZTRkRmJy?=
 =?utf-8?B?dWJxZkJZZ25nbE1YZmk5MVhUZG45bWxEMzduTExZdXF1ZktnSU5jUUM5UFAz?=
 =?utf-8?B?MlVXdkVsVTdFV1lBTTZRSXNXcmtTT1hNZ01XUFI4K0hIdmFxU2QxM3BIZ0pT?=
 =?utf-8?B?YlIwM1hHcitXTHBJOEZtMDk5S25TQzZ3VUVMSTBreU9kd3NaTDFvK2p6cE1N?=
 =?utf-8?B?akNyVUEwUjBpcnRkZVd0eWFGMUNscVV3Y1dpZ01ndUZIRXFMOWd2aTRqRXF2?=
 =?utf-8?B?VE9qZ1VWVzRBMUVQNzVKYWhtUTc2Skk4dzhlMzk2KzZZK2E5dHhxYWh0a01s?=
 =?utf-8?B?QjZ5blMvQVdhbnJhcHpOTVYwSWFkS0wvTlJXSTVwWjRHWFc0TG00NS9WQm9k?=
 =?utf-8?B?MGpZVHJSVWV2L2IyY3VVUCt4a1QzWW5wREFqdmtCRy9ycUNhTHA5TlhVV3pv?=
 =?utf-8?B?YlRFbkZqWGFsZm1FTUJhLzEvZElNSTkzaERqZGxleUF0YkM5RFpsMVd0M3RE?=
 =?utf-8?B?Mm9DT05IN0o4eXhVd2Vna0YzUlJBUG5aakQ2V0d2L2l1Qmw0SnpKZElDZytv?=
 =?utf-8?B?aXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7383ba24-6a41-4b9d-b2c6-08ddfb4d3dbe
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 09:32:12.5823 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DxwOsZevqNbmePU/rNADJX76lqkA7fKK81JWVbzfP1OkoDlbiVXbwH6QbFWD/pDUoDbdLu3oiZhkIAc3cdyfXK7pkcWffKMMRz5P8V5EoMc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7443
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



On 9/24/2025 3:15 AM, Matthew Brost wrote:
> This reverts commit ba180a362128cb71d16c3f0ce6645448011d2607.

we still need the "why" part here, at least something like:

"Due to change in the VF migration recovery design this code
is not needed any more."

> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/abi/guc_actions_abi.h |  8 ----
>  drivers/gpu/drm/xe/xe_guc_submit.c       | 54 ------------------------
>  2 files changed, 62 deletions(-)
