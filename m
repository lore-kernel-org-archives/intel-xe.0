Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6162C4345F
	for <intel-xe@archiver.kernel.org>; Thu, 25 Apr 2024 21:16:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 631F810E67F;
	Thu, 25 Apr 2024 21:16:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XGlRt1Id";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 389FC10E67F
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Apr 2024 21:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714079784; x=1745615784;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JeoTB1qPgddC1hxBXhEOEW+YTBffw4mGbA9f5FgIHvM=;
 b=XGlRt1IdWOKhuNl5izOhWtW8eN4ZB+udEsiP3KvbxHNDOqC3t7X2dLpn
 srjODf+815XX8V/PAPtz1HeTjB0puOt/Yf6uHNrQFlsIm71wGEwXYm8qU
 L6NK6AkO0sbf9PJoFYeSM4JTCQ1Ezkvt5CF28oXHTzdvkLiiQxJMpXZu4
 8QCuwZnYBCzTyo2ep5YH+0xwZrKh+0UeE3Ozon6c73BYPJ1Ie0Wwt/VcE
 yWxlzINBZcvOs5fhxk17m9zKA/cHG25exzD4klCIhI7AfYB3Ty3laREjd
 QtYhCUT3IAugi9N5ZkUnA/sVgeGJvDVBdtKYGXJTLA5nkOJuOGkDU+KV0 g==;
X-CSE-ConnectionGUID: 9Mu9SboCSEeQIk3DqNSnDA==
X-CSE-MsgGUID: 2J+o09EvRdO7hbflPBQOUw==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="9726010"
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; 
   d="scan'208";a="9726010"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 14:16:23 -0700
X-CSE-ConnectionGUID: 7LaEvPyTQsqayIVKnihpIQ==
X-CSE-MsgGUID: uaFBGTN4R6OfI+wXHU2OqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; d="scan'208";a="29656591"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Apr 2024 14:16:22 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 25 Apr 2024 14:16:22 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 25 Apr 2024 14:16:22 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 25 Apr 2024 14:16:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aNJkIFlfsYOoscRXKxdrq/xHlCQ0RpxGV+OZeGGzYMnsr6GEnuqEv6thjiuhfirKlldlOztQOgx+UHTKXs+tDHm/ixntS7zWsl9Q8wIDqmSsb3IhHQR7JbMdK3RrIKM9RB5ClLbEUsIGyupYTSespyPU204a1hcKzsfzole92zp7BJR8CfAQJYQm/FQDaGo6KTM4i8VPnEhCDsQDyCZd7CiynjHgqwmqJJjVliQLORf66xpRiqbzcAOtVIFZzfC62X7mhb8rQJshiJmhTP3WU7Ln4q9Ee0E20IkGj+F97vczvxePmHAdqBFF+idvH7r+89GD29805RKvoRMIG557CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nGm+JdQ98k/YCZZmyWqxL9iiud2mcAL43edb5dhdqvE=;
 b=mAAmMqhr2wbY2p8/c+t/QNogIaQdOjPnA6ULwJSfqOMsS01C+pKroLhDFOeK6dTAsqToXR7u4Lji9iT2h6n20QOIhMYXedtf8rU6r6Uss2lwGiyKPY2IYESsxbpoYw5NcPwIIz6U/lzrlL2SrYNdE3dEf+XAFvYL1bcSn2RK5jjxdGUoioPO9RvRwMB6UjXrP80BcAMP73tlYOf35z4YFWn85gKM4poOpFVXHyRwTfP6D1JWLPTWTeb71VOeZP05C0wy+GhW73Ii0SFpaXCvVrsxngqmMZKno41F6+9r2Nm3R4/JqTaBlJn6f59mzrL+b3t1VPHwj+rDuzsM+sRy+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 SA2PR11MB4778.namprd11.prod.outlook.com (2603:10b6:806:119::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.22; Thu, 25 Apr
 2024 21:16:20 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::d616:a889:aeb0:3724]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::d616:a889:aeb0:3724%7]) with mapi id 15.20.7519.020; Thu, 25 Apr 2024
 21:16:20 +0000
Message-ID: <2a989da8-26ad-498f-bf7d-19796eac2fa8@intel.com>
Date: Thu, 25 Apr 2024 23:16:16 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Add engine name to the engine reset and cat-err
 log
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20240425121856.4500-1-nirmoy.das@intel.com>
 <ZiqW68FPS+vJ8TtR@DUT025-TGLU.fm.intel.com>
 <e2c55678-55f8-4ee8-9be9-f941f29f7724@intel.com>
 <Ziq9n0f24pKHCQTN@DUT025-TGLU.fm.intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <Ziq9n0f24pKHCQTN@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MI2P293CA0012.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:45::10) To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|SA2PR11MB4778:EE_
X-MS-Office365-Filtering-Correlation-Id: 574c3e64-3219-4a56-7bc7-08dc656cf3b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZVJMR0w5LzArSU00cWdkQlBacndyUVNBbE44QTlrKy9oTzhycmxpL0QxUHZP?=
 =?utf-8?B?cm9WR0h2YlAyNEs0SVY0NkE1ZTJpRjRoTlJBaEpTVTdyU0hEVTVxYWdYV0dk?=
 =?utf-8?B?QTR5eUFURHZKUGpLYTlxclVjZk9FajBzaVdVN21jekx6U2NrWkxWRHpwSngv?=
 =?utf-8?B?VjBSQWFLWDNVQy9iMjhaUGZueFZMWGdyenRveDZCOHR6dWo5YTJTTlUwMnY3?=
 =?utf-8?B?ZFJVMzVXNFJsZDJyeFhoeXB4T0pxNTU0bCtxeUFiR1lIcU52YW9PMkp2VjZQ?=
 =?utf-8?B?THZESmpGakRZeWFoL1RUTEZ6akIyUGVHMjdSZ0lKRjdMckJFTk9VN2tFN04y?=
 =?utf-8?B?d0JONS9RVXUvdmlzWWJIYjJZWUdpSGpTR1ZWMVUydy96MDZDWVVLUTV3OFh3?=
 =?utf-8?B?OWtMcEJkdU1leUdEQTZYS1ZyZ2U5bUZ4ZkQwSllWTzY3MytVWFNFdmdzT2Vs?=
 =?utf-8?B?QXRFYVdzMnlQdzhGbTBPdVVrTE1lb09FUGJEQW5Wdzd6dVZacTVYeGhqNnJa?=
 =?utf-8?B?VTY0YWpHWkJHVjV0N3VtREUycWJZWDYzb2luWFRLNUdxcmJwdlB1dHZ5M1pP?=
 =?utf-8?B?c3NLblF6dVB1OHUzR2tueXREUFIrVWFNM3Y5VHNIMFhwNTRCcVUxMkJiTEw3?=
 =?utf-8?B?ZDVtWElDQXdDK3J5bU5ENndmV3ZaaU1xWjVtYXBKVU84Vy9SVzB2eUdwWjIx?=
 =?utf-8?B?K3B1ay9zOEdpL2lkNkhwMUZ6dmljR0pkbXM5ZFhBT2YwVjdvUjgvL3Z5Tk85?=
 =?utf-8?B?Q2NLKzRCQXJLSHB4RXp0VTNkWEFwZ2JtanFCcTQwRnNHb1JzMmEza1dKTlZj?=
 =?utf-8?B?T0k1SzlwNFFSajRuVWhUZ3hra3kwT21FR0pkOWFDbmdiczRXS0xNdnUzTXBh?=
 =?utf-8?B?dE5WTmtzcGgybDdVejVyOTJHNk9BVE9iOUx4UGduV2hPNzNyejI0ZXlEWXdB?=
 =?utf-8?B?ZzBTR28zdTVibmlaVmFKUzZheFF0S3hHMFFuSStiSzhKTXhrc1lEZ1hNbXl6?=
 =?utf-8?B?UHFnWFd1TXhObjZFTGtiRmoyb3RyajRhOFdHRXRKQVlDS2djNDFDQUhnSFZ1?=
 =?utf-8?B?VFFNM00zVGswQ0hwcW5aZVJlN2d0WWJnUEhac0ZQRzRCSHFDM2FLZUllYVd3?=
 =?utf-8?B?TStVOXp5YlhoNmVuSVN5Yml0TkR1Wk1oeGcyMGQzb2k3RmZJLytsaU9QMTIv?=
 =?utf-8?B?MC9RZ0xZWnZSS05BdjdJaVFRMnA4TSswZ3hUR2MvelZzV2xzQjNTd2cvZ2xZ?=
 =?utf-8?B?NGZUY0FhYVpDcWxWK09BMGU0bTRYT05YRFBGcCtWeWl4SXE5UEZKaStaUDlw?=
 =?utf-8?B?eXRmYlJaZitzdkcyMVJ5Q3JNSEljYm5yZGhCaURaMGJab2J5d3hyeVpnRWQ2?=
 =?utf-8?B?UEVrQ0MvUnU5M241bkh4cXJFWUdYVGdRbEdYN3dFdEFIOXR4WHZnVUNxNGFO?=
 =?utf-8?B?aTNpZWhDMnZIYmNNT0hyd3FIa0ZxNlc2TG5Wb3hwOHJtUnVrekpsVVZpVVll?=
 =?utf-8?B?aURpdEhTbGR0bENSRjhYaUxqeDF2R094SGtjallrcHJnVlNISXhsUklIVTd4?=
 =?utf-8?B?TkE3NnArdEFlSlMxU29FMVEyUHZwQm1jU3AyRzVwODF4NWhjU3A5dkdRMDRx?=
 =?utf-8?B?ZzZiYi92Z1RUNHRpNmo4Z1ZtOVJxVGdVVTNLVWhLcURlU0NHc3ZORmREeVZU?=
 =?utf-8?B?cFM4WjJpVWRGWnNRUDhXQ1Fub2xoOW94c2tncXY2K2FTL0lBbzRWV3h3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b0o0WlRrRDU0OHNCNUY3NFZHaUpEcHRoQ0NHVVhYWUdMTEV6ekFROXdQTzQ2?=
 =?utf-8?B?QXNlMHo3eUNXd2N1cFR4YVBvUXdVR25zRTM4MWpOQmRrejYwY25GL2t1NmNV?=
 =?utf-8?B?WXc2Y2R0aHhTM0oxZkpTakNTck1SZ0FrL1dkSHNuTndzM1VQbkZFTTdlZEdy?=
 =?utf-8?B?U2szNDdEb0l6UTA3bjJnRC9XNzRZeklIRmtrcEFMY0xhOEhLSHp1cG1HTlpp?=
 =?utf-8?B?UnZRNVN2TDdmOWZxZGVPdWxWK1IvNU9OdHFFdm5ablRkdlB6WWd1NS8ybXhD?=
 =?utf-8?B?ekgwM05FVnN0ZHpkQlpKb3FJUCt4UmkyaHZ4UHQwTGUvQVdVWWZ0UmJOZHRG?=
 =?utf-8?B?TGQzSFdaSHZIWDFMajlNZ0FadXRHOXhKVVR0RzFoS3NtQi92cG9mc09hd3lj?=
 =?utf-8?B?S29paURHM3FUVTJEcVdsTjBHQi9VeUNCRDZJOWhaYURXLytieXpPUnRxMjhZ?=
 =?utf-8?B?Zml1cGFqWklWbGxJZkkzSm1zVWhsNWhNdEgyUUlpTUNQWXdpdDFNRFF5UXJP?=
 =?utf-8?B?VzR3Yk4rc1N0TWRLUlFwMWZ6MUhYYU9ISVo3OXFReE9pbWdyOXBLRGM5RUNn?=
 =?utf-8?B?Qk9pYlFXd3ZJMzRDMmJVVGZhdUNxZ3NIekg0NE5zaDAzWjJmRFhGemRibmVu?=
 =?utf-8?B?THhmR2QzQUFya2ttOFNZVlBreTRmSzFEQnVhUWIyaGlBWDBjQm8vYjRRUjZJ?=
 =?utf-8?B?eFh1TjVyUVZLeUhQbk14MDYrTldTNlhBektWV0xqOFFCTjRPdHEzTDN5VVls?=
 =?utf-8?B?Ulo1VTBLcmxRUVZtbDlyMVgrVWlJZWFkQTd0Yy9MZXFVUmZkOExTZ0ZjRmxX?=
 =?utf-8?B?ZEpLTW1ia04vN2UvUk1nSi91bWVIQ3BBd1BvYjN4Unc3T2VhTFNkVnd0ZHJL?=
 =?utf-8?B?TWJIb2hlR3llcUIwT2k1bFF1MGcwQ0x5WTJnUU5KOUVLSVNWaEVLVy9ESzVn?=
 =?utf-8?B?N0RNaVFXNkZpME9LVnNFTnQrWmg4cDZYU2dUSEtwRmJvNmd1MnBQRCtmWGg2?=
 =?utf-8?B?L2xGWFFVQ2tWUG5GMFdPRTcvM05kanRwR3VlLzk5REowM3B0dGtLcEQ1Z3c1?=
 =?utf-8?B?RzNTSzZkeDlYT2pBZXhPclJqREZISkNnWHBaOU1rU0RDSGYydVg3YytiaXBz?=
 =?utf-8?B?UGdYY3NnUytUTkVvbDJQWXNMZDAyOGkvMTFmUldYdUd1YUs1WU1OK0tmYnZv?=
 =?utf-8?B?VDk5bkpLbEZ2WTQvKzhCT0JNcFZXdDhHUW9BS2lvVUE5ZExza3JOQ3cyMlNW?=
 =?utf-8?B?TE9nMzVlWTRtSG5LVGtVTXZBdEVieXAxTjhNWk1obnh4TWozOEFTbXdpbnp4?=
 =?utf-8?B?SlI1VVVKQ1EzRnlPYmVVTzdhVHJiYWoyb1QxbHFiazM1RFA2KzZrYzVodGNR?=
 =?utf-8?B?a1ozdEw4RHRpaEtNVm5yRERVUHdFNEEvL0NCM0EvK3Z0b3ZpUDYyRnRIR2t6?=
 =?utf-8?B?NzdHckthbG5DOUZFa0Z6MVRrY2dpbGVKL1JPQWNkRnk4Zm9wVVZiaVh0M2lr?=
 =?utf-8?B?NmpkYk9UVUl3UWtjMTkxWURlV0pkaEFkRGIwcXRHdk5NcStOOTVETHEraEMv?=
 =?utf-8?B?OWtyU1BuYTFCNkJKUEhlMXFiZ2ZlT0xLL0l3cFA5WnFaUTcxVHNxcjVaT0Fj?=
 =?utf-8?B?bXh1Q2dDMVNWOEludCsxUnVNLzk2NWJOTWRZVEJzUXk4Sks1ZzNwSHFWUmNK?=
 =?utf-8?B?eVVZZDZFanQvd1JSTm84NElCanpwNnBSdFB4Z1drS1BrWWdaeHo1YkRjWmlP?=
 =?utf-8?B?VXAvaXU2WU44aXN6bGg5Zkd1ZFlxTlcwcElJcnE3Q2VrYnJ2cklJaklMVzRk?=
 =?utf-8?B?OWp5TjQrVnVXZlJCWk5VcktrelBpZ0NBZmpSL2l2bE1SUnBtakpMS1VmZjQv?=
 =?utf-8?B?NEZpdXRtcTIvY0pSQjRpSzROWGRjSGYrS0Ixc2t1dG1jZDJXOW9mSHRPQzNu?=
 =?utf-8?B?VWFENlFhUHJFUjNTQVpadE42QzdyQnlkUVJVOTBoVnVlRkJYY0JEeFdUR0JJ?=
 =?utf-8?B?emw3RmdZT3lXb3pvT1RzN0VGakpSNFczS2k4WXJHRVdkWDNxejBxNFplVjU0?=
 =?utf-8?B?QmpYNjlzak5XcjlpdElHdzJWUGRUVDdxN3lxaEM5dUNzejg4NUhlYmU5b2th?=
 =?utf-8?Q?gVBxrDsNJ0VRy/S6kOzSMyV/x?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 574c3e64-3219-4a56-7bc7-08dc656cf3b4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2024 21:16:20.2271 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2+NshUepa7OCSJMKlQvPkH2Y4wuUpHNAck7kdlMtGT4U9f0qlCdv6S1gtkuidoPq72en90m3vo59sMBhK6rTRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4778
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

Hi Matt,

On 4/25/2024 10:31 PM, Matthew Brost wrote:
> On Thu, Apr 25, 2024 at 09:11:22PM +0200, Nirmoy Das wrote:
>> Hi Matt,
>>
>> On 4/25/2024 7:46 PM, Matthew Brost wrote:
>>> On Thu, Apr 25, 2024 at 02:18:56PM +0200, Nirmoy Das wrote:
>>>> Add engine name to the engine reset and cat error log
>>>> which should be useful while debugging.
>>>>
>>>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/xe/xe_guc_submit.c | 5 +++--
>>>>    1 file changed, 3 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>>>> index c7d38469fb46..245e29d095c0 100644
>>>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>>>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>>>> @@ -1655,7 +1655,7 @@ int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
>>>>    	if (unlikely(!q))
>>>>    		return -EPROTO;
>>>> -	drm_info(&xe->drm, "Engine reset: guc_id=%d", guc_id);
>>>> +	drm_info(&xe->drm, "Engine reset: name=%s, guc_id=%d", q->hwe->name, guc_id);
>>> I don't think q->hwe->name name is useful as it might not actually be
>>> exec queue is running. I'd drop that, and replace with string indicating
>>> the hardware engine class.
>> I will resend with engine class instead.
>>
> Maybe include the logical mask of exec queue too.

Will do that!

Nirmoy

>
> Matt
>
>> Thanks,
>>
>> Nirmoy
>>
>>>>    	/* FIXME: Do error capture, most likely async */
>>>> @@ -1690,7 +1690,8 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
>>>>    	if (unlikely(!q))
>>>>    		return -EPROTO;
>>>> -	drm_dbg(&xe->drm, "Engine memory cat error: guc_id=%d", guc_id);
>>>> +	drm_dbg(&xe->drm, "Engine memory cat error: name=%s, guc_id=%d",
>>>> +		q->hwe->name, guc_id);
>>> Same here.
>>>
>>> Matt
>>>
>>>>    	trace_xe_exec_queue_memory_cat_error(q);
>>>>    	/* Treat the same as engine reset */
>>>> -- 
>>>> 2.42.0
>>>>
