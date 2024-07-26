Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3272EC3DA49
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jul 2024 16:46:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE29210E9A9;
	Fri, 26 Jul 2024 16:46:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DnJRaktD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 412E510E9A9
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jul 2024 16:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722012382; x=1753548382;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=BWg6iqrPwLNwMqG9kij/jRyWTGwDRfD3zeGUKtQZ+lc=;
 b=DnJRaktDU0p1GDaD+VNjreTG85ahDT0h+BquZl1rc3ohRrgKkiUo5sdK
 QqY4LuiILJl0Q2sCvurp1QrtpuGHAc7RB4VX6TmZZ3J4QHaKD6pOq6Mbu
 CnMLrtpO6Ul9qvUFBgEgkNwOo+gcupuKxWjB5sUTSfySb7M9Kgyp2Qp8J
 jDnXoNFrOhy7Xzf9iBaY3NkdEWDSHscnc0yvibdrV3H6nLS9QdSjQLgwk
 nHTmFV0G/XaPnt2S87YH5WneYnBKm9CR6ogYQDhNdxOsrAiAlMi5m3kaz
 obgKx7teapzyf1btj41HKEt/XmKARgLEaC7+CWavSnbNuXB5/uwh0+v5G Q==;
X-CSE-ConnectionGUID: THuOMxL9RC+ScbggzXPYvw==
X-CSE-MsgGUID: uCBQIPe4RzSnHydHTTqVlA==
X-IronPort-AV: E=McAfee;i="6700,10204,11145"; a="23668525"
X-IronPort-AV: E=Sophos;i="6.09,239,1716274800"; d="scan'208";a="23668525"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 09:46:22 -0700
X-CSE-ConnectionGUID: P9tBRGHdT3+Vy3574hcplw==
X-CSE-MsgGUID: Lt1IAA8pS8epa9092PQJsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,239,1716274800"; d="scan'208";a="53925483"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jul 2024 09:46:21 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 26 Jul 2024 09:46:20 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 26 Jul 2024 09:46:20 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 26 Jul 2024 09:46:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wWDVuwQYjr4dRQlvWoyXZ1noRCyCkW5hG1tnCH/M6EN8Yu4x44LMMad2/ADIxDJQ6/aVA4/jBXWT8DDBoiSm1f7BWodg2YGE9wo6qrql7f1axLF+Og4xglxKMqJrfNxKZOQJPm+8iJ/mQYu8yv3NGUfkxwgUvcjYpiz1IYr9cUUMhQ2Nz3N2SIxSo/YbppIPlhTdfuvUWe8+eOzZTHW83II5AIts25Cl2Hgq4dZxVcXyAQm5GvmWM7T2DvYLsLcBbS+8bO1lCEAHxVoHiag02Kvk6CkX+iu4B57s0kGPrIEO1WcZIoL8Skzx3RwLtRW8uT79E/vwbOfsNbRgNoXzVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vJHoyxyEWm9HIY5gMdVtT3BcBIZyBynKr5ikTxNKHt8=;
 b=PdKc4UJyGhgZ5jy62oCXc7lu66NScUbnwWINYePfw+ZCcgeJZj2+psquqGV0ynFYgEQn7U/mVNHssxJBPZ+d3cjvGN4/NABiNEapOCx7qDRgpqUWD4snLw/1c5DfOP6vgnjONizoEj5+p2zD/mjYmupS6JBM/PjnUtSHkbZYoTA6arwfvTEouHYaUAvDpAcwekQojkmie/+0jdSaQUicBiPaMpiaaCKmQ01ANtRY/nvPdESnSYg3x9WDmtrCORjAPi0fsLxjY6l6kLb3r7dMXEbyoHMOZesNXX87rIBqMkSjuP3XyInCkHPT2LEli2ae393tKmqXuEvpFesSEBx8KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by IA1PR11MB8245.namprd11.prod.outlook.com (2603:10b6:208:448::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.29; Fri, 26 Jul
 2024 16:46:16 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%4]) with mapi id 15.20.7762.027; Fri, 26 Jul 2024
 16:46:16 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240726064337.797576-8-lucas.demarchi@intel.com>
References: <20240726064337.797576-1-lucas.demarchi@intel.com>
 <20240726064337.797576-8-lucas.demarchi@intel.com>
Subject: Re: [PATCH v2 7/7] drm/xe/rtp: Simplify marking active workarounds
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
Date: Fri, 26 Jul 2024 13:46:11 -0300
Message-ID: <172201237134.1586.8196077901199945907@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: MW4PR02CA0022.namprd02.prod.outlook.com
 (2603:10b6:303:16d::15) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|IA1PR11MB8245:EE_
X-MS-Office365-Filtering-Correlation-Id: cc2e0941-d5cb-450e-71df-08dcad92775d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bU9sdnY5UEtWQVNBdzVHcGZrMHVxYmVxZ1dKdVBEcVkzOVVFWHIyMWNFa3NC?=
 =?utf-8?B?UGJzaVN1Zkk3a2svK0J1MGJmdVJaMWpzWkc3V3hjMjd1TVU2bWZBbEhZRE0y?=
 =?utf-8?B?cXM3dDk3R0FGNllzUk4vWkdSL2lySTJrZklPMjJ1UW9mc2RNZkphZW9XUnRP?=
 =?utf-8?B?YXRDNkpQRWsrRmJYQ0RMRm4rN3Z0SnBDQzJjcnFkK1RHODJMUzhJVUxrczdC?=
 =?utf-8?B?Z3BTUnYxYVJKOERHbFZHZGZodThHT3p3ZzEzSEFLSUFtaVI3TGFqY1ZDR1p0?=
 =?utf-8?B?Qm5xRGYyTzdTWVFKdWRoU09RanptY0g3eGswc0M4Nk5TazN4MWd5SjUrOUg3?=
 =?utf-8?B?cmFtOUJ6cWMyQjYwTkVPRVVHa2EzSzhqcUJhMDNSZjY4c1pwVXlYYVJHNGhS?=
 =?utf-8?B?NjQ0QjJZdDNWeFpTYWVrOEkvSERhTkk5aEJUYStrbWNrS1c4WFU0NWxFMnZn?=
 =?utf-8?B?SmI3aGhiNFEwbnV1enU4bVMycnFyMFZPYmt1NU4rd0w0T1dHdlJPdUNBQUVa?=
 =?utf-8?B?ZzRlK2hac3NjcHhwRFJXZVI2VFhXVGtlbEo1cUNnU1E4ajIzYTk0cnlsdVpi?=
 =?utf-8?B?UkdqNmlxOW9oa0J3aWpsdFBNMCtjN2tCYThlVGJqQVlESVRFYmJNNGdhcHps?=
 =?utf-8?B?UnRpZkozdGFENXNlaSt2R293UmlXTFV2L0pIQVBna3JYd3gySG1TUnVpNUwr?=
 =?utf-8?B?YWRRM28wMTBiZWtOOTlHUVRJdHpuZVoyOWVLSjJqcEtocFMxRjQ5ai8xNlJG?=
 =?utf-8?B?N0o0Q3hCNHRWYnBTeUkrM0FReXNWejd1d3lyZXFadUc1V0F4VjZGbGt2NHpl?=
 =?utf-8?B?TDhyc3FuYnAzbXUrREhSVTZMQ2VlSE1qd0Y1dmFmblJuZVFaNHBDVStxU3lN?=
 =?utf-8?B?MnBYdDAzWGo1d09ZeFdobnBLWlVWMjVMUm1WZHEzRjg1RUwza3gzU0plai9a?=
 =?utf-8?B?Q2tsaytIeGpudlZ0ZnB6VHFXWDY0U2RkbUwySVdUZGlaZUpqWURPQlFjU2Zu?=
 =?utf-8?B?RjFiNGVuYzBiNTRURDVSOGhTTGtwSGpERlJtZFNEdGFjeUR2ZGhnM2NvYmJR?=
 =?utf-8?B?aGNvNGp0OGtGZWJYL3NFalgyaU9QaDAwOE5mN3E5MkxEb0Zrb0hFUjZxYzJs?=
 =?utf-8?B?UGFIRWVUallWTmczOGlDRmlURjVUQ2dGallBdWEwUS95cFBXWGNaQlZBeGJ3?=
 =?utf-8?B?Yk9nV3JLR0cyV1pkdXpSOUx6T3RZekpIQXVRcGU0TTBzUnNMUjhUK2tjZVl6?=
 =?utf-8?B?SklkRHJVb0ZvUVhhc0hIV1lQZzVOaG4xNjRtTEhjNGdESUF5NG5tQllRbXZK?=
 =?utf-8?B?dUpnVUl4T25yUGwrK1ZPQ29sb1dVdCt2M09OMS9qbUFBMW4yekV3MHFmUDZC?=
 =?utf-8?B?WTRtU1h6NnIwZzVid0MrSERoSnFLNHJVU2VkdDZMWml4eVcrOXpaS3E2MDY3?=
 =?utf-8?B?L3F0SnVodUdpTXRFcW9FWS8xdFB2a1JEbmZONEtKbHFYU2ZBMXd0ZWxnKzkv?=
 =?utf-8?B?dCtTSW1LOTdFcE02RFRQZFFrb1Bia2lkQTBKU1kzb1YvTWxXYlhycFZzalFO?=
 =?utf-8?B?UzRYT2JFSHRJb1ZmbWlFd1YzVzJLMktNUzVVS0ttT3BwT1lJTHc1d2lHc1VU?=
 =?utf-8?B?NjFXWWl5TFJpNDVhdVZSdStCV1JyUjFsUlpJa2QweHVTY1paYzFqMm9pRmR4?=
 =?utf-8?B?bWRibmxOaTdhdWQ0dTViamVSMGFiYk85SUg0WURIWVhTMGI0SW56RWNrK0ho?=
 =?utf-8?B?VkhqL1JUemlqNWhDS1hhaVR3SFJsN3BFZHdhSWljUWJlV1hOWjFsbisxb245?=
 =?utf-8?B?SzFUVjNZZUZROE03WXdzdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TFRrN00yTkgwbWtoZE14cEhqNzhONnN4Y0FCU0FaYWhxaWRZTFFjT1RydnZX?=
 =?utf-8?B?ZTBjVDlWOTRNVklHZ3VZemF3WjhTZG8xaHVnU1ZRek0yWC92a3pFd0ZLN3NH?=
 =?utf-8?B?aW5ZbzErVW9QbmF5bmJjSmNnQUUrTm1XQkdoN09xSWVOK2ZZSk5HaTl2WmVP?=
 =?utf-8?B?MXRZQkZuZjFzR1dZMnBjSUJZOE1RNHJMekI1eE1TbnlPWFRHNmVWdDdldzNm?=
 =?utf-8?B?TTdjRTdPUGhXcWZLWm1QNFJVM29oN2ZDRVVqU2o2V2kxU1d3Z3Y0MWVPb1Ra?=
 =?utf-8?B?S0s4Y1RpR3IrdFg2UFpFMkx6a3p3ajF2bkZKeldFUk0wd0NDMkNRT0tHdjFI?=
 =?utf-8?B?a0hQZExHMFhPLzFQYStHeUdjclNYeVVIbXFCa1F0bmluTUprVXc3UU9NUzda?=
 =?utf-8?B?ZkhnWGVvUFlmaTVUVXRTWWNHSHZoTnhIeUd2S0MvSXd0SEpRMmlHc3lHQk9D?=
 =?utf-8?B?STdxK3FGc1lPZkRWa3dsR3YxZm9vbDBhOThEVGlNWEtKcUk5K0diYmQ0eEtr?=
 =?utf-8?B?M1hnanFva0FPek5PK25nRmxMWFVNZGZkYjY1RW9FYktDZ24rNm4wY1Mvc2pq?=
 =?utf-8?B?UnJJWlArSCtWaDNwU2VvRnhvTFEzOVZlaitRMmpTbWtrcVlJS3VrV2NRN3d3?=
 =?utf-8?B?a0xjeVhvWU5UWXU0Mmg3YlRKY3lrZE9DRHh0bzlhVmhZWG9JNkZyQWVUSklp?=
 =?utf-8?B?R2t0UXNrY3YzRnhOQlBSdVI3ektrWXJkSDU4ekRMcXd3ZUFNeTZ3QUNqSjV6?=
 =?utf-8?B?VWR5Mk1vQ1dGZkJSYlBVRGtQL1RzTDJ4N0hOOHhSVU9wQXZPYUljREFKNlJ2?=
 =?utf-8?B?ck1KSlcvK3g2Ui9lQm4xTkwzQVBBMmFvQXp4bThnbm1Xci9ZNENWSzYzWmIy?=
 =?utf-8?B?UDFjQlJBZkFtaEpQVWtJcG1vZFBqeUV0dDRmY1pzbTlLT1NEY2ZTT3RHdVR1?=
 =?utf-8?B?cFdXQmErRDE2UWYxaGVyaTZqSnJSeTFLMWtYOW82MFowb3ZOK016NERZemM1?=
 =?utf-8?B?ckNOdUFJVzVTUEg1NDQ1Ni82ZXhqdVNrVmVTZVFqUlZZZ0JrYllnd3ArczBR?=
 =?utf-8?B?LzlRalNDWUN3NVFYRE54c0FDcW5ncVdZa0xjOS9wNVlFa2NkVm1iZ0g5RndB?=
 =?utf-8?B?enRzWE9adCs2dDJZNkNmUzNuQUJEalh0eThQQlBZTmdhRys0VW9zd1NIQnRw?=
 =?utf-8?B?eW52a3BLK3lnWlE1VDV2NlRBYWxRQWpDcEl5TTYrVlJTT01NbHRrSkRmam96?=
 =?utf-8?B?b0lPSTN5ejE2cmJ3QjM2ZWZmMWVOUDFTZFdmcU5hSWVKMlhMWkhDdTJ6YmxK?=
 =?utf-8?B?ZmtvRmNYc2p0RjNmb2R1K0YzZzdpMjJMKzNUMThVNVZ1Mis1ZFZSNmJ4bTlr?=
 =?utf-8?B?Z0RzZnVHeTJrdmUrMGhjaVVCUklaRUtsWGJBVE9kV0lUUFZURWo1TU40aHc0?=
 =?utf-8?B?bjJhWXJ4T2luMkRTaERUQmlMcnhTTy9paUhSL1ZMZjYzdFpDd0licGdBbWtD?=
 =?utf-8?B?ZzEwWFBXYmJZQVhrNnhZMnRIM1FGU0RBZ3ZtU0FGRkVWT21pZ0lKY3BhR2N2?=
 =?utf-8?B?aFFCUEgvbXd1MDQwK0Y1c2lTam9ZdSt0bHkxMVZYc0FsYzhuYzFOVnFiSk04?=
 =?utf-8?B?RVdsb1FuYkxHTk9OZkFiQWJtckFiMHFBQS8yWVJPazNHMzVPTkNGNXRNN3lP?=
 =?utf-8?B?amNsUjJBR2VsNVFFb3YyYU9UeUl1OUw0eVdPeUkvWHpNWnV5dzFLMmtrMlRL?=
 =?utf-8?B?VU1MUzBCaFVzL08rSVlMWjBBUGtlMkwwSE5sSm05SUljVE02OXVKWHpoUm93?=
 =?utf-8?B?dUI0VzN1ZkJrODVtcDRnUytIRlN6ckl0QkZyQTJTb2ZXR3JWMmZPeWtrZlUv?=
 =?utf-8?B?aUw5T3N0V2dhT2UzeUpGSXh5N0dPdzRkK1JLZzF6aGhyZXhpdE1aYy9wZldO?=
 =?utf-8?B?QjJEQ3ZhWGJaM3NESUtuY0w4WnFUcXk5RGtMR2d5a3g4OGtSTEpLQ2E0djdH?=
 =?utf-8?B?U2c3TGhTZitnd3pjNWs0VmRIdW5NZ080Ykd0Y1Q5WDZQbWNmUDhrbUNMRHBL?=
 =?utf-8?B?aWJMcVE2TVhCcHYxMjZiaStxdXlQWGdST3lSYm9Pczc1V0Z6Q3RqS0QrQzZ4?=
 =?utf-8?B?TVFDUlpBTTRhYkZwc0d2dnJ1RXZGbFFJZFlBRXJla1UwMWZkdXJ2b1JBYloz?=
 =?utf-8?B?SVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cc2e0941-d5cb-450e-71df-08dcad92775d
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2024 16:46:15.9936 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: okMh5DAhl0O3/cg20DU8uavi1IfEMc/De2Xr7w+7x+zUkmwFu+bsD/kBVrnTPTh2esbUbW7nQqZ4ri8euL0ynA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8245
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

Quoting Lucas De Marchi (2024-07-26 03:43:37-03:00)
>Stop doing the calculation both in rtp_mark_active() and in its caller.
>The caller easily knows the number of entries to mark, so just pass it
>forward. That also simplifies rtp_mark_active() since now it doesn't
>have a special case when handling 1 entry.

By the way, the "first =3D=3D last" case was not even necessary, since "x -
x + 1 =3D 1".

:-)

>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>---
> drivers/gpu/drm/xe/xe_rtp.c | 14 +++++---------
> 1 file changed, 5 insertions(+), 9 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
>index 1c641cc0f5a1..86727f34ca25 100644
>--- a/drivers/gpu/drm/xe/xe_rtp.c
>+++ b/drivers/gpu/drm/xe/xe_rtp.c
>@@ -221,18 +221,15 @@ EXPORT_SYMBOL_IF_KUNIT(xe_rtp_process_ctx_enable_act=
ive_tracking);
>=20
> static void rtp_mark_active(struct xe_device *xe,
>                             struct xe_rtp_process_ctx *ctx,
>-                            unsigned int first, unsigned int last)
>+                            unsigned int first, unsigned int n_entries)
> {
>         if (!ctx->active_entries)
>                 return;
>=20
>-        if (drm_WARN_ON(&xe->drm, last > ctx->n_entries))
>+        if (drm_WARN_ON(&xe->drm, first + n_entries > ctx->n_entries))
>                 return;
>=20
>-        if (first =3D=3D last)
>-                bitmap_set(ctx->active_entries, first, 1);
>-        else
>-                bitmap_set(ctx->active_entries, first, last - first + 1);
>+        bitmap_set(ctx->active_entries, first, n_entries);
> }
>=20
> /**
>@@ -277,8 +274,7 @@ void xe_rtp_process_to_sr(struct xe_rtp_process_ctx *c=
tx,
>                 }
>=20
>                 if (match)
>-                        rtp_mark_active(xe, ctx, entry - entries,
>-                                        entry - entries);
>+                        rtp_mark_active(xe, ctx, entry - entries, 1);
>         }
> }
> EXPORT_SYMBOL_IF_KUNIT(xe_rtp_process_to_sr);
>@@ -324,7 +320,7 @@ void xe_rtp_process(struct xe_rtp_process_ctx *ctx,
>                 entry--;
>=20
>                 rtp_mark_active(xe, ctx, first_entry - entries,
>-                                entry - entries);
>+                                entry - first_entry + 1);
>         }
> }
> EXPORT_SYMBOL_IF_KUNIT(xe_rtp_process);
>--=20
>2.43.0
>
