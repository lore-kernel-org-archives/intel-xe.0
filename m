Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6D9ACD98F2
	for <intel-xe@archiver.kernel.org>; Sat, 20 Jun 2026 19:39:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AED610E289;
	Sat, 20 Jun 2026 19:39:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gg8/Vymi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E1DB10E289
 for <intel-xe@lists.freedesktop.org>; Sat, 20 Jun 2026 19:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781984397; x=1813520397;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gPaIZJoBShskQnVv0COZ2Dg+m/WmEqES1UJc7zGDsUg=;
 b=Gg8/VymigW3glitT0JNnekLGO11kG91v3W1wvBsE1c/Nzmbt4RkpU6bD
 9UdlqvYJ4hL0p0cu709IeBrmQwwkRZcvNX5VqQDWn1V541Xnt6OD1PPxs
 CJO9MlbT1WACSwly56COtVSRbntI0zX3X1phptfNkArAcWBbld5YmdCEr
 QgH9STyRXtjQkwOkZOV4N0yc4uTI1JuBfmWGvyT/yZGUZZBEEro/91+VW
 7IMmec8pQfEVKUkMQE118ioIuejbPt+FOQjop/vRuekZUk+/+6gFdWt/O
 6e4ghEc64aR+OSvnNkPy9ioI3JEe1XBs1Qv8XxveAhjm9ojkmDYqvw1cC Q==;
X-CSE-ConnectionGUID: ML90HCoDQu+okQcZTv0Z3Q==
X-CSE-MsgGUID: LD/+cQwpTfu5k1P6ZYAMPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11823"; a="100208588"
X-IronPort-AV: E=Sophos;i="6.24,215,1774335600"; d="scan'208";a="100208588"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2026 12:39:57 -0700
X-CSE-ConnectionGUID: edfNllz1SM2y2Jzdg3oyNQ==
X-CSE-MsgGUID: FnYGiCURT/KTBMbzATYmRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,215,1774335600"; d="scan'208";a="244521518"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2026 12:39:56 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sat, 20 Jun 2026 12:39:56 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sat, 20 Jun 2026 12:39:56 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.17) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sat, 20 Jun 2026 12:39:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WDT2hZsqC4W/gByXHwWb7OsOFcG7UKc1ZDdytfx2x7ry+2serPaEJ498P4xHZJIM5oo5Xst0WTFKkwWGSiMdVTB+mcppj1pGDCIeo00b5YxwBkZ0tp+by5rcDGraSNgMJlbbFEUhx7VXyg0SJq77piccNa4vIrYi607bQhWyXaR8I87qK2Egr9opikSYXHNw+oPPq32Owtpu3VesP9x2daUIlzH9ozd64A6BrfvLl0abTFDaK+pGoomn7p3YlcAohGjtmAQE7LsVleWVB2ZwYGOAN5Y5hQWExFZ8eipJ5z3lSXYXqSLTLeTioiCCW23vW5v/TvX0lQND9f8zI0JW7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zfloi9T7bK61VQjF+Ulr6GYHOBa3f3oCOtMs4xBpoP8=;
 b=nMGoLhuhOorA1e23lrWJBVAlDxtzgENWL4mm8rWeW4znbj8+pL8nkhblCwRlbqqvrugq4k43fZ7sFXPpWRBk1pw+1nQRkN1TGeHmM/Obj3uNMBcCFJ4WUv09hAjga2S4XvbM6/CWdeeooSYcZ2F7VZJOrF6B9G9/SCBgl6lXzrqZ4yFLhjTX0QSeOSLE36M9zWL7xAj3vkvYXzYcs2lrTfOzd5PwzSH4320A6twYB0lnmzxwJy5gs16OgHuLqO1AFAmr/Lh0IRsOKszm7RelR8q6zl4gRCkUD5zWmqerZP9htF4nw8TjSP8UgOFHry9uCpAjTXhzq7rszUlSeAqPUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SJ0PR11MB6813.namprd11.prod.outlook.com (2603:10b6:a03:47f::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.18; Sat, 20 Jun
 2026 19:39:53 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0113.015; Sat, 20 Jun 2026
 19:39:45 +0000
Message-ID: <8309b56e-19cb-4464-a72f-37f748b1d4cd@intel.com>
Date: Sat, 20 Jun 2026 21:39:38 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 3/3] drm/xe: use XE_RAS_WEDGED macro in
 xe_device_declare_wedged
To: Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>, <thomas.hellstrom@linux.intel.com>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <vinay.belgaumkar@intel.com>, <aravind.iddamsetty@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>, <sk.anirban@intel.com>,
 <raag.jadav@intel.com>
References: <20260617104711.79646-5-mallesh.koujalagi@intel.com>
 <20260617104711.79646-8-mallesh.koujalagi@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260617104711.79646-8-mallesh.koujalagi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VE1PR08CA0008.eurprd08.prod.outlook.com
 (2603:10a6:803:104::21) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SJ0PR11MB6813:EE_
X-MS-Office365-Filtering-Correlation-Id: 14272991-2b98-4fe5-fa20-08decf03ae90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|22082099003|18002099003|4143699003|56012099006|11063799006|13003099007;
X-Microsoft-Antispam-Message-Info: oqZ7CTJpZs2f1r1XKqU3cdkwzkLZnyjvkz0LCW3X+2hoFK6EZ16jWbHMbcOvAeCf4Gfgpp2wowQGQ4wDfOl0BR+2YNhAMfaj12C9LZqc9g0E1Ax9wC2J+ix4oirMTOeusrjxOPSKhLm4O/BfFv+StBCDaEpUggM8VxF9SjHS3T6bEwS9MxCNstgnIvDt21C/yFf3nFD/iOhEcTlp0hKrJob2aK8lQUXdxRN2lCZNTTXt+mDfD+bKn2zDvOjRSt3P5YUU23KYlIG3lj96dLlSiOzlVcG3fF6gUC2Qj6Pb+xGJEPP7bPbgu9mtxPPkzUoexd0ZKvgeufcjL6V86s1MrHVtnuoh3KHQMRveBRfcApl7lDjAtHaB1sT+hfxPWj1Mv1+OEmBIQYQzClYE/8Tt1FW2ToFXNXVOHAsU7pRGiLTMrJY8tK4jy5yJNWqrpS3mfd6M3zAkvEU3snp2NQNGMK25Ql5OjIKQ4DgXqOD1aqKBhkoh1KnE+Kj0fBD8AtXO3XE3Tru5c0x72JyyaVBG0l/BNv1Pbxr32lAhwQFh7muocolh9+Wfy5cLvwUZu+c8rowH8kVTIQLWf2ebUXjnIq3GpA8p/1v197Ez+JBItDhiPueD4Q48k1EtuIs6HIf7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(22082099003)(18002099003)(4143699003)(56012099006)(11063799006)(13003099007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bmNJdGh6cEtROXlBRG9HdW50QzdEVnkybmpoclc3ajdQdmY5dVVSV1lVRTFQ?=
 =?utf-8?B?a3lKT1ZGVVNPa3R5QWR6SjF6QU1FSGFadFFHS3h2eVgwZ3FGZzdkdEZyU2Z1?=
 =?utf-8?B?WENYTHRZWkZIVHVFK0daVHQ0VVI2di9KQVA0SHkzZVZ6RFNYVFVUYzB3YThV?=
 =?utf-8?B?TjFpQUMyU2w4UmZ4cXFlaDJsU0g3b0dTQ0dobjlpcWFuTlJUc2ZtbnpiNjdN?=
 =?utf-8?B?UUJUT3d2eDNNRHhFZ2d1TzlZSGFrNXNpUXRVOGxWYjhlRUhkRmZGOE5LZWth?=
 =?utf-8?B?TzZvVGtBT3hTY2lWM1lkOFlNTUl0RlQ2d3hHalRJR0MvTjAzTk9Na1loMTE3?=
 =?utf-8?B?OFAyUkgzNzZFWkE3M3llbkN2MU16U093c3hmbVpxSWNvUTV6cm5IdEhSZ3pT?=
 =?utf-8?B?cGZ1WDh6cGoyd1lEODZCYURDT0xrRXBNUk1rdDYzSzFKTGV2S1pHWVdkZUhu?=
 =?utf-8?B?LzdGL0k5ckkrRUErTFdkMnJHdlVTcHRScFRyMk0wSTV0MXZ4dkkvRUgxTEpk?=
 =?utf-8?B?dXhDRlhDK0xuK2VVT21YQ2RnM3FYT2pQUytpbW9IUlEyRzMvT0o2dW9DS2Yy?=
 =?utf-8?B?K1JZRWwva1pmT1RheEdpSVArMEFoMWk4b2pxVnJwcE5VRmdyMnRybWxBemZu?=
 =?utf-8?B?Nnp1OTU1azFSVjk4cXpyVkUwNTY3MlJVR1Q3RzBtRXNVb1BOcnBoYzdrS0Nr?=
 =?utf-8?B?Ym0wdWI4TUdHY0dYOUJTKzhmSXJkWnBoVG9mNUNRTlJrcUordmd1QXJlTTZw?=
 =?utf-8?B?NU16Y3NrREtsR05qam4zS0xUNFY4bXg2OUxjMW5yWENVQjdSMUtSTFVkOElE?=
 =?utf-8?B?cjFkd0RhVHdOQzJzNUZmNFNmcVVKQ29DemlqenpuNk9MUGN2b043QlYrVFFH?=
 =?utf-8?B?eXRWcWI3SHBra2RmTGZFUkpNcHp2Qm80RFBJbFphQ3RUcjltQTVSYjRncHNV?=
 =?utf-8?B?SVNSNmJXaXp2ZHhxUHBod2cwZUlBc3lqUGNYS3RXbzl4dWFFYXZ0QzJOWlNK?=
 =?utf-8?B?VStHcGdFRDVwU2t3aFA0RHYyMDlpMmVOTElrdFRCSVBYOUYwZzFJY3FTRTJ6?=
 =?utf-8?B?VHk1QnJTVlNYVFdOd0NPa2xFVVJEZFVWV1YxbEtGWjkrOWVod2ovMGh2L2Jz?=
 =?utf-8?B?NXN1SDVnUEZRWjNiS3p6N0xIM1hzN2pZUGpRU1lFM1pkaFJ0cmNPZ0FrZ0NK?=
 =?utf-8?B?R1BPY2hSTGZoVGtXUUpIM3YwTUJJT3hPTXM4WG8xZjZ1bk42Sy9LUGRjU0Za?=
 =?utf-8?B?SGhYQy9pdDdpSFVDbVR6d1R5ZXB1U01YcnZEN0FCTnFnejVzeUtVZk1LbWxW?=
 =?utf-8?B?QjVWQlVubmdac2VoNTAvRThDQUJLQm9qanRZN0pqUzFmRHFHUU5zd2xhMy93?=
 =?utf-8?B?V0lXdFQwOGRiUis3WjV5Nk5ocVorNVB2VThLaC93aURUOWNVNU1DUGNFOSsy?=
 =?utf-8?B?STZ6VDZWYm9rSmtwbmZOa0dQQnkwUkNxZ3BLWXVDWVFuRnVCM1FuTkJBcTl4?=
 =?utf-8?B?UzFEeGhXTUdpb2J1UWZxUVMrR0ZNZHh0bnMzRXp5M3lUK2VOekpaVHE5czdQ?=
 =?utf-8?B?TkJWNURiMCtNMHE0K2NhZ1V4eXJBaDk3Wk54bUJ6TzRncll4VXVHNmU0SWVy?=
 =?utf-8?B?RkpucFZ4c0l2VVYvNUgxYUpxL3NvR3RJZEtZYTFvb2ZMUTh3MDZmbnZPQUlu?=
 =?utf-8?B?WlpiYSs3VlhHemNNVks5cHRuS2VJcXk3eUo3d2tTN3hlbk1pUldLb243QUx3?=
 =?utf-8?B?VVVXSzNDeW1pUlg0RlpLZ1dWSHd0Q2pVakYzSXRnbTAzUzZMdHJGSzVKdG9W?=
 =?utf-8?B?cXBaZjNBQlUxS3JzOWNIMnUwQzF6WVJic09JVDdXNGZkZDk3WVY5Z1RBaDRh?=
 =?utf-8?B?a0tuSlY4bkh1YkNOSUJrL0szTWI3dG1MbzhqWFlvZmpHeWJ4V0FEU094YXNO?=
 =?utf-8?B?U0JWamlqU256SmVrSGxLSTdCL1pWZE1mS0EvdUhRZXpEZ2JiT0FKTkRHNXVX?=
 =?utf-8?B?S3JybXIzcmRMYnJaREY0dEhFMmJseHlHSGV1UjdDS05PL3IvVWpvM0t1RUpH?=
 =?utf-8?B?eDJkMW5wWkcyTDdmYjZOazd3NFF1amZxcGZ4b3BzQUhXZmxMUTF1TEdaVHFM?=
 =?utf-8?B?UFZ3aUF3djl2UnBQWnVMZzRmaE45ZFhzUDZ6UDlNbldjWkVkM094eURMaHo2?=
 =?utf-8?B?cW5Sc3E2VnN4ZXBGczNkcFFKQ29uTlJRT00rVDUyR0lNa0lHZzA2U0lKVlB2?=
 =?utf-8?B?eVhleWpWRm9WTVpLbTgxNDVjd08vTk9May92bGRpTko1Z1hCNFR1YjZUaTdL?=
 =?utf-8?B?NVYzSDNRbGpmV1pmdXdXS3NHZzV0QTV2ejdZM1BKekZrQmYzdVF6RCtrZVg2?=
 =?utf-8?Q?jOMBPmJekOMhxOFQ=3D?=
X-Exchange-RoutingPolicyChecked: Oz4p2Gq8XeEB/og/1cdpzO5B5F+V3VOyNeTtp1jPKrnW5kljugMk/o1mnck5BeXM8GPzwwjXkO8nepnooGbkPufGDiaiIiEKe3k295E/FO/zp8jsF97H5siz5RFfTqxhGiwqcvqOkW+9wV1Wpylr6cT4YT+INhGZwOpRE53ZjH5zAFIc0GJk/YnPgIysrgq3xt6camK8wUPHe1tTDulEAZ2C3mWAvzDP4yWJRmUMYJAl8M3vdoWzgMx6/ISZxtYxOVgamGwd5WeVzru0kYYVeAYmyURqzS6PppjMiHyh+3f0Q7vgjjTY1xaGCzV3uREb6g9UalDgMihWujANQqdRQQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 14272991-2b98-4fe5-fa20-08decf03ae90
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2026 19:39:45.5708 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i2eWG1z8mPJTQDqNvrAlhiIJrY0UULyeuq+RW4YvqRAUo2pxl0CAw8rtD3nijOqTZVBiuSh2iy/NojURaMX/MlQl+T5Yr8fcd/2+8WBp7hg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6813
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



On 6/17/2026 12:47 PM, Mallesh Koujalagi wrote:
> Replace the open-coded drm_err() call with XE_RAS_WEDGED()
> macro so that wedge events are reported through the unified
> RAS/SIG logging path with a consistent format, CPER severity,
> and errno.
> 
> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
> v2:
> - Rebase.
> 
> v3:
> - Update message in xe_ras_log_wedged().
> ---
>  drivers/gpu/drm/xe/xe_device.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 089872507bdd..8284578b9156 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -61,6 +61,7 @@
>  #include "xe_psmi.h"
>  #include "xe_pxp.h"
>  #include "xe_query.h"
> +#include "xe_ras_log.h"
>  #include "xe_shrinker.h"
>  #include "xe_soc_remapper.h"
>  #include "xe_survivability_mode.h"
> @@ -1424,12 +1425,12 @@ void xe_device_declare_wedged(struct xe_device *xe)
>  	if (!atomic_xchg(&xe->wedged.flag, 1)) {
>  		xe->needs_flr_on_fini = true;
>  		xe_pm_runtime_get_noresume(xe);
> -		drm_err(&xe->drm,
> -			"CRITICAL: Xe has declared device %s as wedged.\n"
> -			"IOCTLs and executions are blocked.\n"
> -			"For recovery procedure, refer to https://docs.kernel.org/gpu/drm-uapi.html#device-wedging\n"
> -			"Please file a _new_ bug report at https://gitlab.freedesktop.org/drm/xe/kernel/issues/new\n",
> -			dev_name(xe->drm.dev));
> +		xe_ras_log_wedged(xe, -EIO,

who really cares about the errno if machine will only look at class and severity?

if relevant for deep-dive analysis, it should be printed as part of the regular message

> +				  "CRITICAL: Xe has declared device %s as wedged.\n"

hmm, so now we will have all this in one log line:

	*ERROR*
	[xe-err]
	Severity = FATAL
	CRITICAL:

and full message like:

	<3> [0.028976] xe 0000:03:00.0: [drm] *ERROR* [xe-err] SIG_ID = 2 Severity = FATAL Location = device Errno = -5  Xe driver declared device 0000:03:00.0 as wedged. ...

> +				  "IOCTLs and executions are blocked.\n"
> +				  "For recovery procedure, refer to https://docs.kernel.org/gpu/drm-uapi.html#device-wedging\n"
> +				  "Please file a _new_ bug report at https://gitlab.freedesktop.org/drm/xe/kernel/issues/new\n",
> +				  dev_name(xe->drm.dev));

compare with:

	xe_err_fatal(xe, WEDGED, "Xe driver declared device as wedged. ...")
and
	<3> [0.028976] xe 0000:03:00.0: [drm] *ERROR* [WEDGED] *FATAL* Xe driver declared device as wedged.


>  	}
>  
>  	for_each_gt(gt, xe, id)

