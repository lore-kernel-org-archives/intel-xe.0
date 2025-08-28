Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14FB2CA0EED
	for <intel-xe@archiver.kernel.org>; Thu, 28 Aug 2025 18:38:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C28A910EA9D;
	Thu, 28 Aug 2025 18:38:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eqA7Cx53";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CC5410EA9D
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Aug 2025 18:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756406305; x=1787942305;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=wGWNwRHTjk6vw/MOotMw2InSubIFNmK05EmY5GTnNWE=;
 b=eqA7Cx53bDDRSDE78Ys7MEoeudfh9xZeKFpO0bIkiDe+y4K5RQSxXzQN
 jbw5c1YqR310m9Hgy9G2AvGQsM8lG2xmdGD+efYAn51dqX/pQ7FcLWcTS
 dEpXn8S0KSp+FpoWIe6sLu+GVY0miCIDeWjXIU8ek43JYHgLjX613wqJg
 O/NFQbl3fbBM00ZOp5YVr6hyLz1vn92yBHKZDepiiQWRSSRz0qBK0HiIq
 px/s/sludBzAzJ2Vsl7HUH+fMEadoH3r1+vC32UDspGlV5gwCi/QLEzEe
 V/VrWVwLdOYgzvhzBSJEjOuDC8ZRGxDjed2QN8aKRYX0KHhAFhzlTqfOy A==;
X-CSE-ConnectionGUID: LRCPqkVtSMKaRRlJh0IQjg==
X-CSE-MsgGUID: XfAOrtpnT4iSKnzcXjzTuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="58615790"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="58615790"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 11:38:24 -0700
X-CSE-ConnectionGUID: 7FmKNVP6Qxel0oDbDt7yWw==
X-CSE-MsgGUID: HDaMB1ZqTT23s8mEEiF8LQ==
X-ExtLoop1: 1
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 11:38:24 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 11:38:23 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 28 Aug 2025 11:38:23 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.75) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 11:38:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N6nAsYXGKI0SZQchQaemFjUw0M5P0euqgsqBzOl3FZlhB3WLQ/UydZSOolY0oKJSDreBWSPiIUVR52ce43N+L4mnrxZ6+8HOevyJW1UyJg6v+ros9O42MLTw7hKGUIsddEiEK7KZnCm5MVUaXoZzs+wKFje5CZLJ+Pv/bzx5Ugpuc9O4N2Ni9F19m6zZK5bszLypE/jBSrL0JlQAqt/wnngiPNIAD/iLkbvFAENvn1HFcOl91KH9vcQvY9t5EI4WZ1d9/TkYEBBZawNzuNwYBNGfnPsBR2Xdbgk1zm9FJYsZHPWBmJxKMTxQdZHzHuZEbFL2aHRIGlM7ueju3yUMNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q5FDsnjdxRN47yn6jf4AkfdAb0HMHe0lc2tTjLBkN2A=;
 b=MIQq/yI+ckraFqYz557jCjuG2ijtsEg7WWptpr4kcJpU+NTV369S6ice4BTWZU+g8jKKAUCxq6j/NMbQzk5wfjxyS73I3Gu68rne+F0k5ZluTyY2kX6t5zdcAC23tUPog4Bkm4X7ZM0sWSFwk/BYNguLdLqR95NuteVc1hKBQ8tBOZ02f7i5RzPGiHNBKdeujykE3r8Nw6ov6frmYB6erxgqMBxj2ZDuwDbHhjwOeThYpxpK85lisyCq57uTuOahMu50A3dl3+/A1l7TwfhGB1WZBfoX5jgUfGW/WIMG5a7Iqgtyy+KQVSinSdsHl+gKyiQ8QFGeMsYD+b0l1i9Ssw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by CH3PR11MB8186.namprd11.prod.outlook.com (2603:10b6:610:15a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.15; Thu, 28 Aug
 2025 18:38:16 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.9052.019; Thu, 28 Aug 2025
 18:38:16 +0000
Date: Thu, 28 Aug 2025 11:38:13 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>,
 <himal.prasad.ghimiray@intel.com>, <michal.mrozek@intel.com>
Subject: Re: [PATCH 06/11] drm/xe: Add xe_guc_pagefault layer
Message-ID: <aLCiFVrGvJ1w8qQM@lstrano-desk.jf.intel.com>
References: <20250806062242.1090416-1-matthew.brost@intel.com>
 <20250806062242.1090416-7-matthew.brost@intel.com>
 <aLBZQQWCC4f7xFPo@fdugast-desk>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aLBZQQWCC4f7xFPo@fdugast-desk>
X-ClientProxiedBy: SJ0PR03CA0142.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::27) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|CH3PR11MB8186:EE_
X-MS-Office365-Filtering-Correlation-Id: b456525a-b119-4619-1020-08dde6620d92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VUQ1cXVVSDFFbFNPcmFTTVNjRWF5bVhEVmR0Qnp1cTlFOVQxcHhheEZOamt3?=
 =?utf-8?B?Wis0cVVkQ0pzbi9xc0ZaZW5iVU1lQnR4SmdqWElyb004ZzVPc0FaMmJzZmxI?=
 =?utf-8?B?UFRCSkRFa1NEc21zM1JRTHFXaWFhNHQzL3VreWZkekJmaG9EcHRnMzlROFk1?=
 =?utf-8?B?bU5SaWNtcFovQnE2SG1vMERIZVBGSUxGVDZWV0NHeEVxaUdGMVQ2RFhQd3M1?=
 =?utf-8?B?QjYwTHc3NytiS21LMmJCOStzQ2NyS2x5ZzNuL2RRTXFEWU1ENTBrOS9ONzU0?=
 =?utf-8?B?cW5GYVhXQ3liVjZGcXNkd2QxQk84MWdyTXdLbzdOT3luTVp2dmpxK0F6VHcx?=
 =?utf-8?B?cDBGUGFtYzhTVWtrN3hxSS8vN0RhNzl3RjRJT0JKWmQ4OStldnk4aVJtWWVF?=
 =?utf-8?B?bVVTaU9wVGlHbkdWbnBuOUUxdUtHU2owdjRxU2pmZ0ZwZW1MQzE3QTBFekYx?=
 =?utf-8?B?SGFSaGxnZWhzelZUSFM1V2NoaUlFeEdoaWYveDc5eHpvakl1TENHMHpxMGJy?=
 =?utf-8?B?a2RYMmZZMHZwS1V1em8zcHRleFEzdXhPVzIrMGhaUHA2S0cvTjRtNkVQbjdh?=
 =?utf-8?B?TkVtQ1BXU3B4Q29vcVJNZmd1LzZZUFZYNm43U0NkVXM4ZkpGYXh6T24xYUY4?=
 =?utf-8?B?L2RrUEQ2OERQbzhMYlNGWjMvU3hxdmhRVWhkN051ZTZkb2c0MkRSUHk1QnNS?=
 =?utf-8?B?L3N4SkZkd3dVVXVIU0tvWjY2Zk41ZW9kY25rRWZKRXE5Ykc4OHhWMmh4UHZZ?=
 =?utf-8?B?WmRvRHNDYktQQnBJb3pJUFVkc1g0Qk9taDliT29HSlBzRUdwMWlEU3p0QXNx?=
 =?utf-8?B?Z0xXUm1Tb0lRYWFCV1cyQURxY3pVRnVjbW1ERGh5MDFrb09RK296RlpkcERl?=
 =?utf-8?B?anora0szZWIzcFRiSjh4dUwrSHJHeWVTblBtYm85ekQvdyt5a0g5bk5UZlZp?=
 =?utf-8?B?SjZxajJOOGlneDI4LzN0Y3JsRHphS0JOL0UxRUlpd0diM2FZVUxQeHJsRVhh?=
 =?utf-8?B?SmFlOHFVRWN5SkVHR05KZ2RUbStvbHRoQjVqV2loT042d0I2di93bm9STEEy?=
 =?utf-8?B?N3NpUkNIT0JwazJ4MmlUSG9DdmVUWnVLQjNOV2hXeGl2cVJaakpiZk1JU0ls?=
 =?utf-8?B?clJYZCszUjlJcHNRRnQ4Y1FubG9pVEN2ZjA0TlV5YlQ0akt5UDRqS2dqVHB5?=
 =?utf-8?B?ZDEyNlpQSXV4WldINmJuckp1d3A1YzdMVXQ5M1dlMXpReDJRMVhOeWp2RHFO?=
 =?utf-8?B?cXUxS3FpZDJLMW9ubTk1L002d0hSV0dJWTRNSmJwZUNNY2VIOENHK1VYOWlG?=
 =?utf-8?B?MXQ1WmFIOW9ibUdVeWlQL0kxdkVWeGVDUEtvdnlDQnM3cERuRmpyM2loTWNP?=
 =?utf-8?B?T013Yjk1elRTZDBrL2tHaTJic040WVF2UWN5KzJRS2o5bEZjb041TWFuaC9p?=
 =?utf-8?B?Z3pHRGZlNUNBZVhoVmk0bFIydFVsWnBGSm1TUzFRMEFEMEdHVWZWOUxVQkpM?=
 =?utf-8?B?cUVoOWhFdnhSM0tDU2JwaUV5SDBINC9qVWVoSDlrNjdUZjlWYWlFQkdJdFho?=
 =?utf-8?B?R05tNjk2OVJRT0c3Y2kvSktCWENmMjYzd3RiUkwxakpaTEFLV3AxakxJSlpv?=
 =?utf-8?B?TlVQMDBrdGZLbGtVaXV1Y1ptTUhMUklPVWhhVUtHeVdPZitQcElSUGFmNnl4?=
 =?utf-8?B?NlRTVkRnSzFHNGNSamY4UnVtME1XRTkvYy9aR1RLeUlLOE5jRk9oMHM2aTUz?=
 =?utf-8?B?NTVjREh6azgzZnZTODczWVdNZ001UnVtMzNSVzZhemVTZHpxZW5NcWlJc1BP?=
 =?utf-8?B?eDlKTHErbHVaQWgyQ3IyRkFUTFFQZkd2Tmp6QkErajc1T2pCWXdwcEdOK29x?=
 =?utf-8?B?clJRUk1uakdaZTEyVFZjQ3ZRRUVsZGdNd1UwUHlDbVdMZEQrRCtsdXVtNFpF?=
 =?utf-8?Q?DG2UOPQIj8c=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VmFyQzlsM2h5YXg0MmhuSDFxTVRNTmRNZXFCREw5YXJUVG1SRXMxVGkwbGJo?=
 =?utf-8?B?MzYzZys5WDd0OUhpUVJLM0NZSy9GME5ENmtxZlNJNC8velRrMityd05EWmNl?=
 =?utf-8?B?VUNUSkRrdHlzVGdCNk1LY2tuNkdMY3pBNi8xSUtpcmtxL1B1dFlSMFNVSDYr?=
 =?utf-8?B?QjZueGc5bkVscmtGZWVDc2llb0pXRDI1TU1SUmZPOWlLZ2RKZXhzbnZBcUdF?=
 =?utf-8?B?a215Umt0UXc5ZUUrY2tHZXVDbDVEYmR4dVNrN1FJd3lINjFWUHZOb3BCaXk5?=
 =?utf-8?B?bFdaWFY3YUpYVXpmOTQzYndzc3pGU1A2QmtBK2ZWQVUrNElTcmlPcXdBSkpF?=
 =?utf-8?B?K0IvUlhyVy9WbXkxalU4MGo2ZVpsblErTWxCRy9qdDlHamhNQ0hSNVkvWG5W?=
 =?utf-8?B?QzRqb3d2NElUMmpMdzJUTG1OZmlrNmtFNGFyMVE3T3FlMVhla3djN1FWdVV2?=
 =?utf-8?B?VndOTnU5N3N5Ykt6cDdTd2ZpQXoyTXNoLzF1TmdncGdiSGw3bExKU1hURDZh?=
 =?utf-8?B?WW1qNTFKWFYrdGpQTlpKeWRtQlZkZ3hGZXNBMWJHRFliaUhGMDJMeThjMDJH?=
 =?utf-8?B?NGIrdGtUZEJFcHVUZG1UQk1oWldvZlRBVE51RlRvbXAvMnZHZHJZZXJqUG4y?=
 =?utf-8?B?OHBjR3FUdzRjS0d0MnpoUng1UE1zSnNzbldHdnY1V1dnYWpBZWQ4ZFRUT3py?=
 =?utf-8?B?WVdjNWt4OGtONmkzWWpESm45WlJaSWNUd2lubi9acU82Uzl6dG52SlNWaHBW?=
 =?utf-8?B?enpYNlJqOTMxeDhRZW94SSs1eHUwNFBsQnZrVUdId003SFlodzUxVDk4SFBR?=
 =?utf-8?B?OEZDTHE2VEN2dGpldDBLcnpkd0t5VG9xYVNseU0xY29oYWtqZGRCSloweXVG?=
 =?utf-8?B?R1FZMmZkRFpxaktaRktaMFJQZUcrdkhWUi9hVFVuaUpQdVk2bG03a1Q4VDVT?=
 =?utf-8?B?dWx1KzdpQStBRnVoclJadk1XeHVmN3pKa2xEdFhkUjhITUtUU0tJanhOZXNp?=
 =?utf-8?B?TVBtK2VhS21NYVpKWXJoaWZFc2ZXQjAzamkzcE1DRWdnTGdQSVNxWk1WYmI2?=
 =?utf-8?B?Ump4Q2ZrKy9CcldmcFVqbGR4NHVnQ2EyOEZDRkxjamJYbW1YQlUwdUJHaEFO?=
 =?utf-8?B?NW02U2hkS1F1U3JHakhyN0FwZGFSS2JLT3ErMGkzOER2dTRFcFEzZTV4YXBW?=
 =?utf-8?B?aU9ySGdpNUV3b0duNlJIdTBiUDgxYlNoM1FRRUZlY1Zwcm9BTERKcEZSMDQw?=
 =?utf-8?B?aWhNeTR5TTJRNzRwNjYxU1VpekV6bkZGUk9Jb1dFM0l0U1RkYlV4b1kzbEFG?=
 =?utf-8?B?ZFhnQkZ4MEpCcmV0VnZReGxUbmljeFp4NzNEVENjci9jZmk1SWt6ZFlrUkpv?=
 =?utf-8?B?RktJSWwvMWhQZ1JFOHhNUGoyOEZJWUtGNDEraHZMMFdXYlBvVUJLdHZRYzBE?=
 =?utf-8?B?dHJvV1lSYVZTa2JDNEpEV0JKU3JGWnFPRWNXT2tnU0xSSk9Sa0twWjMzOW82?=
 =?utf-8?B?QjAyb056ZEJOSElNeTdkYTg0bHdZRjRUK0dEU21nNXYyS3diT0VxclZKaE8x?=
 =?utf-8?B?WUdocVV4eXBPN3M1b3FWRVZKSjVWcFNzemNQU05tTEx1b2pBM1ZDVjNGd3Fn?=
 =?utf-8?B?Z0t5MnpJRzhRaEJpSTBzWStQK3hYZjhGRHlVQ3F1QnU1Y0tFckVwRUNhQ0JO?=
 =?utf-8?B?UzI1Ym43Q2NVOXgwVlpINFFNUFBPWjVvMzFaampuTHJXMnJkSlpRVFFzd1Vj?=
 =?utf-8?B?eDlicTJBaTd4YVhVM2lXOHJBOXZrZmUreWluZWFsS0NLVHExMVBnNFByVzBH?=
 =?utf-8?B?dHkyZEN3VGJteW5uLzJ5TFZhd0RHRHNXMWJTNUxWUWFQVXE5bnNFem5taDFH?=
 =?utf-8?B?RzlHNjRaVWZHU0o5ZzNpWVNEUmwvZlVrbTNkRm91Y1I3ZkJSbTdXYXRsc2Zj?=
 =?utf-8?B?SkhHb1lNYzkxa2w0alhCdHpJVUVETmFGRk1LOWNhRVYyNkhHZHlSM2YxWC84?=
 =?utf-8?B?ZlZoMnUwS1lHRVVSTlRYeHZ5SU03SC8vaW9EN3pkaG9SWkh2azRGS0M3bUhy?=
 =?utf-8?B?aHBNdWxXZHlpV0lQeVc0SjFkOGVKZXVHamVWOFIzMEJXUHNvRWV6bWkvRlBC?=
 =?utf-8?B?ejJNbDVncnJtdFhaSlJSTXZVcUh3Qi9BSCtkNWpEOHZndUZiK2ZuZHJGYWlS?=
 =?utf-8?B?b1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b456525a-b119-4619-1020-08dde6620d92
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 18:38:16.7053 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2km5t+V5c3pn8ZeYst0t8n93YitOfQSmcrfVZ2lxciZ15Ir4hKRWqnAABKyl4bAVFBLR+IvlaoERazms7qjbPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8186
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

On Thu, Aug 28, 2025 at 03:27:29PM +0200, Francois Dugast wrote:
> On Tue, Aug 05, 2025 at 11:22:37PM -0700, Matthew Brost wrote:
> > Add xe_guc_pagefault layer (producer) which parses G2H fault messages
> > messages into struct xe_pagefault, forwards them to the page fault layer
> > (consumer) for servicing, and provides a vfunc to acknowledge faults to
> > the GuC upon completion. Replace the old (and incorrect) GT page fault
> > layer with this new layer throughout the driver.
> > 
> > Signed-off-bt: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/Makefile           |  2 +-
> >  drivers/gpu/drm/xe/xe_gt.c            |  6 --
> >  drivers/gpu/drm/xe/xe_guc_ct.c        |  6 +-
> >  drivers/gpu/drm/xe/xe_guc_pagefault.c | 94 +++++++++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_guc_pagefault.h | 13 ++++
> >  drivers/gpu/drm/xe/xe_svm.c           |  3 +-
> >  drivers/gpu/drm/xe/xe_vm.c            |  1 -
> >  7 files changed, 110 insertions(+), 15 deletions(-)
> >  create mode 100644 drivers/gpu/drm/xe/xe_guc_pagefault.c
> >  create mode 100644 drivers/gpu/drm/xe/xe_guc_pagefault.h
> > 
> > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> > index 6fbebafe79c9..c103c114b75c 100644
> > --- a/drivers/gpu/drm/xe/Makefile
> > +++ b/drivers/gpu/drm/xe/Makefile
> > @@ -58,7 +58,6 @@ xe-y += xe_bb.o \
> >  	xe_gt_freq.o \
> >  	xe_gt_idle.o \
> >  	xe_gt_mcr.o \
> > -	xe_gt_pagefault.o \
> >  	xe_gt_sysfs.o \
> >  	xe_gt_throttle.o \
> >  	xe_gt_tlb_invalidation.o \
> > @@ -75,6 +74,7 @@ xe-y += xe_bb.o \
> >  	xe_guc_id_mgr.o \
> >  	xe_guc_klv_helpers.o \
> >  	xe_guc_log.o \
> > +	xe_guc_pagefault.o \
> >  	xe_guc_pc.o \
> >  	xe_guc_submit.o \
> >  	xe_heci_gsc.o \
> > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > index 5aa03f89a062..35c7ba7828a6 100644
> > --- a/drivers/gpu/drm/xe/xe_gt.c
> > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > @@ -32,7 +32,6 @@
> >  #include "xe_gt_freq.h"
> >  #include "xe_gt_idle.h"
> >  #include "xe_gt_mcr.h"
> > -#include "xe_gt_pagefault.h"
> >  #include "xe_gt_printk.h"
> >  #include "xe_gt_sriov_pf.h"
> >  #include "xe_gt_sriov_vf.h"
> > @@ -634,10 +633,6 @@ int xe_gt_init(struct xe_gt *gt)
> >  	if (err)
> >  		return err;
> >  
> > -	err = xe_gt_pagefault_init(gt);
> > -	if (err)
> > -		return err;
> > -
> >  	err = xe_gt_idle_init(&gt->gtidle);
> >  	if (err)
> >  		return err;
> > @@ -848,7 +843,6 @@ static int gt_reset(struct xe_gt *gt)
> >  	xe_uc_gucrc_disable(&gt->uc);
> >  	xe_uc_stop_prepare(&gt->uc);
> >  	xe_pagefault_reset(gt_to_xe(gt), gt);
> > -	xe_gt_pagefault_reset(gt);
> >  
> >  	xe_uc_stop(&gt->uc);
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> > index 3f4e6a46ff16..67b5dd182207 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > @@ -21,7 +21,6 @@
> >  #include "xe_devcoredump.h"
> >  #include "xe_device.h"
> >  #include "xe_gt.h"
> > -#include "xe_gt_pagefault.h"
> >  #include "xe_gt_printk.h"
> >  #include "xe_gt_sriov_pf_control.h"
> >  #include "xe_gt_sriov_pf_monitor.h"
> > @@ -29,6 +28,7 @@
> >  #include "xe_gt_tlb_invalidation.h"
> >  #include "xe_guc.h"
> >  #include "xe_guc_log.h"
> > +#include "xe_guc_pagefault.h"
> >  #include "xe_guc_relay.h"
> >  #include "xe_guc_submit.h"
> >  #include "xe_map.h"
> > @@ -1419,10 +1419,6 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
> >  		ret = xe_guc_tlb_invalidation_done_handler(guc, payload,
> >  							   adj_len);
> >  		break;
> > -	case XE_GUC_ACTION_ACCESS_COUNTER_NOTIFY:
> > -		ret = xe_guc_access_counter_notify_handler(guc, payload,
> > -							   adj_len);
> > -		break;
> >  	case XE_GUC_ACTION_GUC2PF_RELAY_FROM_VF:
> >  		ret = xe_guc_relay_process_guc2pf(&guc->relay, hxg, hxg_len);
> >  		break;
> > diff --git a/drivers/gpu/drm/xe/xe_guc_pagefault.c b/drivers/gpu/drm/xe/xe_guc_pagefault.c
> > new file mode 100644
> > index 000000000000..0aa069d2a581
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_guc_pagefault.c
> > @@ -0,0 +1,94 @@
> > +// SPDX-License-Identifier: MIT
> > +/*
> > + * Copyright © 2025 Intel Corporation
> > + */
> > +
> > +#include "abi/guc_actions_abi.h"
> > +#include "xe_guc.h"
> > +#include "xe_guc_ct.h"
> > +#include "xe_guc_pagefault.h"
> > +#include "xe_pagefault.h"
> > +
> > +static void guc_ack_fault(struct xe_pagefault *pf, int err)
> > +{
> > +	u32 vfid = FIELD_GET(PFD_VFID, pf->producer.msg[2]);
> > +	u32 engine_instance = FIELD_GET(PFD_ENG_INSTANCE, pf->producer.msg[0]);
> > +	u32 engine_class = FIELD_GET(PFD_ENG_CLASS, pf->producer.msg[0]);
> > +	u32 pdata = FIELD_GET(PFD_PDATA_LO, pf->producer.msg[0]) |
> > +		(FIELD_GET(PFD_PDATA_HI, pf->producer.msg[1]) <<
> > +		 PFD_PDATA_HI_SHIFT);
> > +	u32 action[] = {
> > +		XE_GUC_ACTION_PAGE_FAULT_RES_DESC,
> > +
> > +		FIELD_PREP(PFR_VALID, 1) |
> > +		FIELD_PREP(PFR_SUCCESS, !!err) |
> > +		FIELD_PREP(PFR_REPLY, PFR_ACCESS) |
> > +		FIELD_PREP(PFR_DESC_TYPE, FAULT_RESPONSE_DESC) |
> > +		FIELD_PREP(PFR_ASID, pf->consumer.asid),
> > +
> > +		FIELD_PREP(PFR_VFID, vfid) |
> > +		FIELD_PREP(PFR_ENG_INSTANCE, engine_instance) |
> > +		FIELD_PREP(PFR_ENG_CLASS, engine_class) |
> > +		FIELD_PREP(PFR_PDATA, pdata),
> > +	};
> > +	struct xe_guc *guc = pf->producer.private;
> > +
> > +	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
> > +}
> > +
> > +static const struct xe_pagefault_ops guc_pagefault_ops = {
> > +	.ack_fault = guc_ack_fault,
> > +};
> > +
> > +/**
> > + * xe_guc_pagefault_handler() - G2H page fault handler
> > + * @guc: GuC object
> > + * @msg: G2H message
> > + * @len: Length of G2H message
> > + *
> > + * Parse GuC to host (G2H) message into a struct xe_pagefault and forward onto
> > + * the Xe page fault layer.
> > + *
> > + * Return: 0 on success, errno on failure
> > + */
> > +int xe_guc_pagefault_handler(struct xe_guc *guc, u32 *msg, u32 len)
> > +{
> > +	struct xe_pagefault pf;
> > +	int i;
> > +
> > +#define GUC_PF_MSG_LEN_DW	\
> > +	(sizeof(struct xe_guc_pagefault_desc) / sizeof(u32))
> > +
> > +	BUILD_BUG_ON(GUC_PF_MSG_LEN_DW > XE_PAGEFAULT_PRODUCER_MSG_LEN_DW);
> > +
> > +	if (len != GUC_PF_MSG_LEN_DW)
> > +		return -EPROTO;
> > +
> > +	pf.gt = guc_to_gt(guc);
> > +
> > +	/*
> > +	 * XXX: These values happen to match the enum in xe_pagefault_types.h.
> > +	 * If that changes, we’ll need to remap them here.
> > +	 */
> > +	pf.consumer.page_addr = (u64)(FIELD_GET(PFD_VIRTUAL_ADDR_HI, msg[3])
> > +				      << PFD_VIRTUAL_ADDR_HI_SHIFT) |
> > +		(FIELD_GET(PFD_VIRTUAL_ADDR_LO, msg[2]) <<
> > +		 PFD_VIRTUAL_ADDR_LO_SHIFT);
> > +	pf.consumer.asid = FIELD_GET(PFD_ASID, msg[1]);
> > +	pf.consumer.access_type = FIELD_GET(PFD_ACCESS_TYPE, msg[2]);;
> > +	pf.consumer.fault_type = FIELD_GET(PFD_FAULT_TYPE, msg[2]);
> > +	if (FIELD_GET(XE2_PFD_TRVA_FAULT, msg[0]))
> > +		pf.consumer.fault_level = XE_PAGEFAULT_LEVEL_NACK;
> > +	else
> > +		pf.consumer.fault_level = FIELD_GET(PFD_FAULT_LEVEL, msg[0]);
> > +	pf.consumer.engine_class = FIELD_GET(PFD_ENG_CLASS, msg[0]);
> > +
> > +	pf.producer.private = guc;
> > +	pf.producer.ops = &guc_pagefault_ops;
> > +	for (i = 0; i < GUC_PF_MSG_LEN_DW; ++i)
> > +		pf.producer.msg[i] = msg[i];
> > +
> > +#undef GUC_PF_MSG_LEN_DW
> > +
> > +	return xe_pagefault_handler(guc_to_xe(guc), &pf);
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_guc_pagefault.h b/drivers/gpu/drm/xe/xe_guc_pagefault.h
> > new file mode 100644
> > index 000000000000..0723f57b8ea9
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_guc_pagefault.h
> > @@ -0,0 +1,13 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright © 2025 Intel Corporation
> > + */
> > +
> > +#ifndef _XE_GUC_PAGEFAULT_H_
> > +#define _XE_GUC_PAGEFAULT_H_
> > +
> > +#include <linux/types.h>
> 
> For this to compile we are missing:
> 
>     struct xe_guc;
> 

Yes. This was compiling on my machine without this but something
recently changed and this is required. Will fix.

> Francois
> 
> > +
> > +int xe_guc_pagefault_handler(struct xe_guc *guc, u32 *msg, u32 len);
> > +
> > +#endif
> > diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> > index 10c8a1bcb86e..1bcf3ba3b350 100644
> > --- a/drivers/gpu/drm/xe/xe_svm.c
> > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > @@ -109,8 +109,7 @@ xe_svm_garbage_collector_add_range(struct xe_vm *vm, struct xe_svm_range *range,
> >  			      &vm->svm.garbage_collector.range_list);
> >  	spin_unlock(&vm->svm.garbage_collector.lock);
> >  
> > -	queue_work(xe_device_get_root_tile(xe)->primary_gt->usm.pf_wq,
> > -		   &vm->svm.garbage_collector.work);
> > +	queue_work(xe->usm.pf_wq, &vm->svm.garbage_collector.work);
> >  }
> >  
> >  static u8
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 432ea325677d..c9ae13c32117 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -27,7 +27,6 @@
> >  #include "xe_device.h"
> >  #include "xe_drm_client.h"
> >  #include "xe_exec_queue.h"
> > -#include "xe_gt_pagefault.h"
> >  #include "xe_gt_tlb_invalidation.h"
> >  #include "xe_migrate.h"
> >  #include "xe_pat.h"
> > -- 
> > 2.34.1
> > 
