Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8993FD1AD36
	for <intel-xe@archiver.kernel.org>; Thu, 17 Oct 2024 08:35:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 522D810E13A;
	Thu, 17 Oct 2024 08:35:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QeEsvWVN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7B3910E13A
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Oct 2024 08:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729154099; x=1760690099;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Ruyk9hrA6U5WpsXr/QziAO4t8fM/izdf7bzNo57PFzc=;
 b=QeEsvWVNHi6FeH3HVZ23vXpjEB8rlqXg4spLl/SedRB29vnlZmavYGJD
 Tk+K4I3tz2LJ0OFtLzGyJv7sJtUBbdvK+f7BLG9U1axHqpeP3n0Qbw+A1
 b8urKvHXgnlPSxdp82k5pY9IOffXOaP5DKbJDFyQRuoxQBwZmLKHcZwnJ
 sIYIcIl9fozgDAuKtBb6BjFJJXz+sbTXbcypllTl0hqU/kJ8syuEMLnOh
 nkUYdCa2ldFlmpk0vYig3tEgfhUskNHniQgl2k9VOH9zvmxKKn/eWh3og
 5x85dlYbaPnTyQR/e8IPEpqTGEzEdWz43ilrz/u7Ll3qBuXtQduGpGWII Q==;
X-CSE-ConnectionGUID: nLeaTTBaQ+6jiS6Xg5mp+w==
X-CSE-MsgGUID: jiXgkIAUQQmYMlycCgNEwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11227"; a="28836593"
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; d="scan'208";a="28836593"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 01:34:58 -0700
X-CSE-ConnectionGUID: /ZRbrEcvTYGHLmDS4feVyA==
X-CSE-MsgGUID: QwK4C/jaTmGuxi/sraBsLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; d="scan'208";a="78089581"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Oct 2024 01:34:58 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 17 Oct 2024 01:34:57 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 17 Oct 2024 01:34:57 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 17 Oct 2024 01:34:57 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 17 Oct 2024 01:34:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zo5BNPNhidKInOp0mNv0VqcuW34ZrjNYNz99u2/ie/zZjCZkU2A/Chn3um/3kEnQo0QKjDmUaUivG9o7/zcDnqAw5/sAIhyzs9r5DTj23VET+XAsFAK2srSN7BiujPVxNMW7/wzK2qA0TUvhzlr5cs68m6tE4O1ou3l+rTsW8udA5GXeO4yQBZq9HO9iNEOAvyicVqOTm+cEQE/7QQlmwQpJZSInLdpTJ8K7RIYe6WgKPFkrlAXLdSQrXNVzh/8wnhrSUqF/yT+eK8oDmboe8Ts5M3zs/NTim1THwj21+2W17M1022fid6Ibforx5znsBJY7vfsj0Vfz9P+aV4m4eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nkzDQLelz5j8tZaV+1yjwf4Berh/5WbiuinGdnZVzRA=;
 b=pJ0S2Wp9dOpPCv3Q+TSwuL+JFrQMnwaZgxM9CafIVdPQCaT2OasvQykQVb9L6t9D4bLd4Xibw4F2oUoV4gwY3nNzcL4NoM+y5FkPsalItG9b9HAlI9bm7a3J4JyVg8XuCf8KXMwzL1OIaGZX0aieVnnftxRQxBfohsH746DoiO9LW7Q01r4F1s3CiWsiZSUadc5Abs1KZpK8Cr9IGnqWEorq7WLSx3Ry2A4etl/fNPjxAPAVncUG90+QHsqyMQfD+qkWBvhD+/P5kcYz5TaBI1JDyxUXrJwig6rIHssNpYe31Nyi6fHKXqLv5Y4kdU7bJPbrNz/1kzuYRc4yYEsKRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by SJ0PR11MB4975.namprd11.prod.outlook.com (2603:10b6:a03:2d0::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.21; Thu, 17 Oct
 2024 08:34:55 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%7]) with mapi id 15.20.8069.019; Thu, 17 Oct 2024
 08:34:54 +0000
Message-ID: <90da706f-a107-416d-82d1-f36fea356ad4@intel.com>
Date: Thu, 17 Oct 2024 14:04:47 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/xe/guc/ct: Flush g2h worker in case of g2h
 response timeout
To: John Harrison <john.c.harrison@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>, <himal.prasad.ghimiray@intel.com>
References: <20241016115256.349791-1-badal.nilawar@intel.com>
 <20241016115256.349791-3-badal.nilawar@intel.com>
 <a6870973-20ab-4eff-a0d2-34dec13e52e0@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <a6870973-20ab-4eff-a0d2-34dec13e52e0@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1P287CA0009.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::17) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|SJ0PR11MB4975:EE_
X-MS-Office365-Filtering-Correlation-Id: b5b3bb43-9a60-4022-0dc8-08dcee8692fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aTN5SzdmaUcvL1gvV1g5cXRpZFpBUVNCYVNuQzRrTGp0OWdMRTFiZGhWZklU?=
 =?utf-8?B?WDM5VTAwQUJwNHBDbVI1dkloc2lKdUNPN2x3TjcyR0hkVlQvUFNEK0hPd1Nz?=
 =?utf-8?B?SnVUWk9GMkVPNk43TC91eGRCaDFXSzRtYWF1MmFaMUc5RWdqSWlzbHQ4c0dH?=
 =?utf-8?B?N1B4OWNMLzRqWmlQeTg0RDg2Skk3N0djVEllM0Mza0tyejZBSEJ0d21tNTVP?=
 =?utf-8?B?L21WT3cvMjJDaERxTFVXeEVSTndORTdpdG5nalM0VWtiR0RjbnkycmxRVHZC?=
 =?utf-8?B?TkVZeGozQXBGOVROTGZ2ZkttL1RkcTExMW1PbjB4N0ZuMERzTEZ0UlFNdnVM?=
 =?utf-8?B?UzkwbnYrQS84MllDZW9hZXh0SXVBcWtiS3NBLzVNVEFROENJcFFkN1lGWGUr?=
 =?utf-8?B?TVpHcVl5N3BKdC9Fc3RZNHlQZy9CVzVqck1pYlk4L3FXTTVTVTZHWDZrWHdr?=
 =?utf-8?B?dCtrT2t6OWxsZ3J5WjJHYkg1aDJoODRSRnZyK2xKdm9BQUhMQ1p5MzU5ejl6?=
 =?utf-8?B?WFBZZ29xVU5lamhUQk5BUXVCOW92SFdEMVcySTRTNDBGL2p3MHlCOWlwL0g0?=
 =?utf-8?B?VHBwQ3g2QjBJYnE1d3lEQUFoZEpYdnYrQ0M2OFA0UDU5OHB6NlpjbkpxU29R?=
 =?utf-8?B?bWJWWVFGTDdQRzhKayt6czRRQVp1MVVKalcrRkJuczFIaVFQWnNQb3NJNDda?=
 =?utf-8?B?anRTTVNRd3lXS04xUDNvMXZhL2hlZUdpYzFuYitmcDRJMGhSSzFUczQrWDdX?=
 =?utf-8?B?VFM3aEszM2JWUnhjRkFtK0ovcmNpcmJiQkk0V0NsUVBtRHFub09pZnZQL1gr?=
 =?utf-8?B?eUxOd0F1L2ZjY3pKc1A4cWEzZlhtcVcrbjlLVEpjdE5RcHhEakVsN1dGMjgx?=
 =?utf-8?B?bkV2MXcyZTI0UWQraVlIQmQ2eEdGZ044NXo4VjEyNG1LNFlpdTRadVE3clV3?=
 =?utf-8?B?K1J3dTZTTkRsaW1vQlJMYm9MZGNSd0VZczQ1eVBSSGZwMm9hYVByU0pKb1hP?=
 =?utf-8?B?TWRpcUNLQ1dabmY0ZkNhc0tjU1ZGUEtwN3NtSkhyYzhQSHNQbmd6RGczSm5U?=
 =?utf-8?B?djRBREl5aU9xVkZ6U0dZU0V2dFA3dmFHSytNdkFkR2ZJbzRiVEl2bGltTDA3?=
 =?utf-8?B?VEJWd3lZWndWcDBZYmo4UGJiZlliUWVnZS9SN3doeDJBSUFwcWFQbC9kTmlz?=
 =?utf-8?B?U0xQNHg5YTNPdXk5bzhsYk1jUVJ2aXZOTFpwaEhsT3ZrUDJEeXlWUnZrTjVu?=
 =?utf-8?B?MHJLaThWTnZOdXIzYTFJaWV5d3QwT1EwTzNPalh3akpzWENOdXEyQzV3UVND?=
 =?utf-8?B?Q3hMR0hWdDdnSEM0NkN4OTVSTEN6TzNHUmx1MG1oVXB1WFh1Z1g5RCtUbGM2?=
 =?utf-8?B?ODhUUnBVdkxrQ3JzZCtFMUNHQ3hqdklsY1g1dDFLejEyd2MvVjRaMTdpdmd1?=
 =?utf-8?B?aHRjTWNSN3AzMDVwZlFQc0hQa3pJNEtzemNHYThvMmFXRitmbldOS3N6NGZi?=
 =?utf-8?B?U0QwQ2VvdjNUb0xwTFpDSDI3WDFpdjZxZmhJeTRnR2QyZTdaRDdsMS9zZk45?=
 =?utf-8?B?WW13QmFpWVB1M2VwUVMwYWx3U0pibTZHZ2lVT1JscE10bW9tanRaLzlVQkox?=
 =?utf-8?B?aStBajZoU2YwRyt2TnRlZ0ZYUkVhU0NoQm4rbHloUThOQStZc1RmMVRXR2RD?=
 =?utf-8?B?VE9RbzhrNUZIUzVOaCtxd0lpRzFBRDJlSTRSM3l1QThWT2JDT3Z3eTZnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dFhDRXhFQldzOUVnSy9Ndi9HYTN0TzhJeWY2S2RjcWNFK2JsM0Zvdms2bHhi?=
 =?utf-8?B?UFpNYmFITTdsYzgrQm9SNXArTjFjUzh6VlFYZlJHdnVRNzNKNlF3SlFvck1P?=
 =?utf-8?B?bkNjQmhRcGpOV2ZoUzIwb2VsbVRwVnB0dW9USDduYjFnNFdHT2d3dmphc3FV?=
 =?utf-8?B?YUVoWk9mcFl6U1gxYnY0MXFzRHhHODNad2JjSUJKVzNpZFJIM0NMQWR2emZo?=
 =?utf-8?B?S3NnNWJEcnN4M0RUN0cxdTFCbVREb29HdmxseVlkU0o3UG9yVUN2NEFsMUdu?=
 =?utf-8?B?REFFaU53T0dySGZFeklmUFlSQTBlZnd3eHdVeE8wM3YwS3o0S05MNW5GUFBh?=
 =?utf-8?B?V0w4d2Uwb0tXVlZ6dEY2QzBTeTV5NW1WV2oxdk5BekVEUEFsWFBwS1gxNUd5?=
 =?utf-8?B?N01aOUFuV1N6eEEwd0dCaTZyaWJwcUcxbHFqbXYybHNzZmhkdGkxN0hYRWRH?=
 =?utf-8?B?RnoxYk9wTWN3NklCb1BZMzg5TDV1R0NYZ0hNbEgrcmVsSnZtaEZRRGc0Q3FT?=
 =?utf-8?B?UkJYRGNxY0NSTXgxOWVIOVVEeEtBMSsvSzdSVU4yUmR0cVllOHJKOE1ucEJ0?=
 =?utf-8?B?ODc5eUpkeG1PK3VUaGJEdGNvMXhQRU9hVkVYbmtTYVEwdDYxRDVEdGZCYnZF?=
 =?utf-8?B?d0NKemtVVTliSG9oTml5bGxSMXNvWVpXY2hHdWxONzBZM1M2enBvMEx0akFp?=
 =?utf-8?B?UFZCVkVaeDF6NEFhMDhycUFBU2NveHZyNnVMTGV2NU5QRE1EaTM1NmdpUFZq?=
 =?utf-8?B?ZFZWZjBVUlVFU3VLcUtiaDRvRThtU1VMYzJBb0ZVZ2dLSUJUaW1rbzI2N0VE?=
 =?utf-8?B?RzJCYWcrSnMydGx3RnFWUzh6cmxaYnNWdnQ2bnBDWlhKV2gxQndBRHRaMDdo?=
 =?utf-8?B?SVl3SlBuMlluQXVWbTVPcSt1bFAzS2Zja0labU01T3RVZy84Qkt4ejlibmtR?=
 =?utf-8?B?Zys1RHppQkFwd29nNGZkYXhtR1RzZFkvT0NJMXA4NjZKWG81dE9KL2RselFS?=
 =?utf-8?B?QnQyNFBKa1c3NFdsMVQ1VTFzdllTY2FaSStiZ0FwbktaSWlTbGg5NjBUejFt?=
 =?utf-8?B?am81MzhZbU5VS2hDV3crMDFwdEtIVGhENlgrMW1mcnhoeDc3SUkzWlpOdXA1?=
 =?utf-8?B?dmw2SDhIQTE0cm8vdHZ0MlU1eEM2TkxMSmxLdnpaVkQyUEo2elhvb09pU0g3?=
 =?utf-8?B?alpvN2ZxZUNNdy9QSW1PdWJQNnNDMzFmdW5DSnR6OWJvQm1qUkVGa1BGcTVS?=
 =?utf-8?B?bDZYWHFBSHhaWnNLWWZITzgvSk9tUFlEcmVaeDNsa3UzMlJmb3FnbTVUVGxK?=
 =?utf-8?B?Qi9FWE0xaG8zaUJxZWZLNEpiNWI0bmxWRDI1T3B0R3hqUmNNQXM2eWkzbVJp?=
 =?utf-8?B?RWpCTjZ6WkJHakNFZVhHNnZVNU1Ibkh0ekJVUU1hZ01KUFVUSUxKTU8rT25w?=
 =?utf-8?B?SHJDeVUzbGVLN2tFZXZVcE5jVWFjb3BmNzJ2cGNQeXE2cHQ0OVYzMHlKT3p1?=
 =?utf-8?B?VlZ2SUVSUjFJUUI4ZmVrSGZDbjM0NlVla1pKaUNSVjFEWENBbjcxNE55WjN1?=
 =?utf-8?B?TllST2ZMTDFkRkM2MGhGMUNrVGNMMFhYUWxWQkZWTTcxR3NIWFNRZUJ1cTc0?=
 =?utf-8?B?bTVzY0ZleGUzS25JV2FzZDdhTXhqbzVXaVZnNGR2Q2k0Z0JWRlE2ejYyM0Qv?=
 =?utf-8?B?NDlyTGJqNi9tNDNFWmQwSldzNlJleUxUMFVjb3BRS3lUbXBRSDhSSTNFTEh4?=
 =?utf-8?B?NVV2SnNMMGs5M09rMFpKSEZoSjNvMU4vbXFCOFJZQU9ZSXlHTk1LWExQL2JP?=
 =?utf-8?B?N3FENWxxVFM0NEcydlUzT2UwOW9idVorZ0lXM2RxcDdNT0ZCbitNaEdESGRQ?=
 =?utf-8?B?VW9UdFlnTmhPTFdqRmhFeXR6UmhWeXJHTUJZUHM3TzBJbGJqdElyQ2cwU0kx?=
 =?utf-8?B?K25TTWt4NnRvN0tickRNQnN0VS9LazRyRExJdTBBOGJYVnRkemRFdkdIWFIr?=
 =?utf-8?B?alhXRTVNamkxMUJoZVVhYnBxV0hLaVRHNkpTbkorZDkra0RMTXJVVHEzc2Fh?=
 =?utf-8?B?aHNhUG9pYVdkMWt3ZDRXSmU2TnFZMzZ5WjN1ZWZJd2NBV0tDdE5SelBSSWVn?=
 =?utf-8?B?WFZJYm1SWmxHR0JoVUJhUzBBc3RlaW1WZHpUNVVoV0NVOVRMSnFEYkxqTXY2?=
 =?utf-8?B?amc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b5b3bb43-9a60-4022-0dc8-08dcee8692fe
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2024 08:34:54.2265 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pay5hozZI10pVlU3dXlufRmgOvgig98q+East57ywnZmlvLLA8lCXKYZ49pY0YDNVZwnE/PXiqiIlRh+DDBZ7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4975
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



On 17-10-2024 00:21, John Harrison wrote:
> On 10/16/2024 04:52, Badal Nilawar wrote:
>> In case if g2h worker doesn't get opportunity to within specified
>> timeout delay then flush the g2h worker explicitly.
>>
>> v2:
>>    - Describe change in comment and add TODO (Matt B/John H)
>>    - Add xe_gt_warn on fence done after G2H flush (John H)
>>
>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620
>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2902
>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> Cc: John Harrison <John.C.Harrison@Intel.com>
>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc_ct.c | 15 +++++++++++++++
>>   1 file changed, 15 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/ 
>> xe_guc_ct.c
>> index 3096baa4c9f4..c4e06d6722f0 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>> @@ -1028,6 +1028,21 @@ static int guc_ct_send_recv(struct xe_guc_ct 
>> *ct, const u32 *action, u32 len,
>>       ret = wait_event_timeout(ct->g2h_fence_wq, g2h_fence.done, HZ * 3);
>> +    /*
>> +     * Explicitly flush g2h_worker if it hasn’t had the chance to run 
>> after being queued due
>> +     * to delays in workqueue scheduling.
>> +     *
>> +     * TODO: Drop this change once workqueue scheduling delay issue 
>> root caused and fixed.
>> +     */
>> +    if (!ret) {
>> +        flush_work(&ct->g2h_worker);
>> +        if (g2h_fence.done) {
>> +            xe_gt_warn(gt, "G2H fence %u, action %04x, done %s after 
>> G2H flush\n",
>> +                   g2h_fence.seqno, action[0], 
>> str_yes_no(g2h_fence.done));
>> +            ret = 1;
>> +        }
>> +    }
> Why bump the timeout and then do the flush? If the only issue is 
> believed to be the delayed worker thread then waiting longer before 
> doing the flush seems counter productive. You are just increasing the 
> time taken for no benefit. Flushing the worker thread should be all that 
> is required. If anything, we should be breaking the timeout up into 
> smaller chunks with a flush in each so that the completion happens 
> sooner not later.

Initially I thought just increasing timeout may help, but seeing flush 
(debug prints) even with increased delay. Sure I will drop the increased 
timeout patch. In the prior revision, I didn't receive any comments 
regarding retaining both the timeout extension and the flush, so I 
continued with them.

> 
> Also, there was a big discussion about resets on the previous revision 
> of the patch set. What happened with that? I'm not seeing anything about 
> connecting with the reset paths here?

The improvement patch requires more discussion and few revisions so I 
decided to handler it separately. I should have mentioned this in cover 
letter. Meanwhile workaround patch can go.

Regards,
Badal

> 
> John.
> 
> 
>> +
>>       /*
>>        * Ensure we serialize with completion side to prevent UAF with 
>> fence going out of scope on
>>        * the stack, since we have no clue if it will fire after the 
>> timeout before we can erase
> 

