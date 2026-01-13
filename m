Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 346D1CF45CB
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 01:35:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBCBC10E190;
	Tue, 13 Jan 2026 01:35:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FZgAui1p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B45E10E2E0
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jan 2026 01:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768268104; x=1799804104;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=VImugqVPDjOSvOCiGwIdKE0fX8PgdHrJ2TUsQftLnu4=;
 b=FZgAui1pkWGBTCN9vnS3DkteMYrVQZgvDF7Sq1UaYhPVP8eEo8a26sO8
 mIEf6TfKqYGC2OJTwj1aMF7VuyVu7mtBs6T4iUanRunoeJ2H51bH9Y8EY
 iTM1mL5rlZU1fLvo1bP2P2kOp1H2svapmPZqil0FTQ7K5wEdvNR1YP0LJ
 sbhDgKI6HMHGBr5eA+JRBsDgMLnagrQDpliuMUVYKMW0RXsYT2GHtQSAm
 NlZNLgw6dS+3ntZcOwXCywZescLZAxOqGLv2tB2TiSsriURUSISSGtdp6
 P4L1hv3sbvYDbwu5dbcyTmhkzqaGKnAyF3ooJx5Z7OmwrQIG7lYxDm8sb w==;
X-CSE-ConnectionGUID: nrNwgDcfRLS7gK6pBnzY+Q==
X-CSE-MsgGUID: 9+y1CFqrR2+VQ2XGnBTp4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69625565"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="69625565"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 17:35:04 -0800
X-CSE-ConnectionGUID: PGTHFjadRSuM6/OAWMxwsQ==
X-CSE-MsgGUID: I2tO70JWSJau+36k+amadA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="203879418"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 17:35:03 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 12 Jan 2026 17:35:03 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 12 Jan 2026 17:35:03 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.25) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 12 Jan 2026 17:35:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eBRgNFbDjaxCs/RYwMSbdAwW3OzPnHFsCNbaTi0rWU7RHw/gxohqaw/e02hkf66XMrnh4Gn1zgODXKho0xAf0mmkIuTtkd6wrL11uoE4tWhYxS7LCKqBN/2VhSPWCO5NVjHlUUAkyHGoVtjm2y74QVsZeLRLgH11qqdkwvSa1lqAnjxr8BjFVcZ5he5W1x326dRdHfUwWrPgquppAPLBBhmlmzDFpTF+QK26+Q2ZEWfoRpUityg0w+7WY/vL81V6+9uLECS3tt8nxXf3JVupjxaJ2OAy3WQYBuZmQ4zGav0waks0EXevygPi/Ue3sHy2cPKPyICflIryhELw0iAVMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tgm5LNtrAezLpXSm+GYcHDfRTZK7n5eRK+xJ/+oqBrM=;
 b=WdXDKSUePZN4m0ZLoom5HoWe4bkaAoHJ4EkiH8/QWDwMyGAukFAzBHGn3pvPKVl2QuStMd5DxQ5fWAjONZNlBTePe8MUCn4+7O3i/8m6bka5dYQLVYjED0Il2GMGlkGtcX+gkLVm+MDGYbLlEXN0FAjc8cTAT4yggpqkDB+ti+b6MraL+PHNi8rRuJEFyiYteBrFwN+1afRlf+Fl+a0EUZsiSAgy4rf+mt7hN2tQxaxftilGfWHZUWOSCAH/UT57OScmcIQo/2iK6g8AhIhdwIG/YCKG6aoWBgKoSdwm5y94sHVW5teB9fl0FcgCaAi6wVunbsGVeNxbPkuOU9d8pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BL1PR11MB6001.namprd11.prod.outlook.com (2603:10b6:208:385::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 01:35:01 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Tue, 13 Jan 2026
 01:35:01 +0000
Date: Mon, 12 Jan 2026 17:34:58 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 10/11] drm/xe: Add context-based invalidation to GuC
 TLB invalidation backend
Message-ID: <aWWhQpD6GysgmJYp@lstrano-desk.jf.intel.com>
References: <20260112232730.3347414-1-matthew.brost@intel.com>
 <20260112232730.3347414-11-matthew.brost@intel.com>
 <14464929638a4c6d727af6cda9152720dda7c468.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <14464929638a4c6d727af6cda9152720dda7c468.camel@intel.com>
X-ClientProxiedBy: SJ0P220CA0019.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::35) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BL1PR11MB6001:EE_
X-MS-Office365-Filtering-Correlation-Id: 20ec925f-345e-45fe-10b4-08de5243f7f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?3hbyaVgUcblx33NeLwy4eFG7CgFQNLERCL4Ka07BoJw0E5RJmbvHr2wo8f?=
 =?iso-8859-1?Q?8aKR8inlRFW8LdjYbb/BlRXeupNz6VIcBmV0HFZb0sr8jt3nPJ2GyRwuqt?=
 =?iso-8859-1?Q?JrUDqzpevBOn2/M/jh76FKTvkxYC0dXcbJd8JvGZkIjMBav7P+WSB8x1WU?=
 =?iso-8859-1?Q?4uWSr4SnYBOZlZW6NW1eBthVAeH87JqxHtZ+BhTHrrE33lsJ70NIpWRufT?=
 =?iso-8859-1?Q?YgY3g9iYp30KbvvzXNdCiVixvnQeIM6IheIvRME2chVmXnNDRHikIKMUCK?=
 =?iso-8859-1?Q?8BPM33mN7dy3WL2JH35TqXzkH6rkGEhEhczTw6/kYBbChNUzHaBaUs0Ffc?=
 =?iso-8859-1?Q?+HA6/rcFQ+HzGslZINAZqxeNsCDRviYmAyYrgfCe+8CLlR3FhkFmyJ/8I/?=
 =?iso-8859-1?Q?y9K7lvllK4B31+XRV5WGaZS9r7ZMEKcbqJj8Un25LqxvDbIP5mChYodfbT?=
 =?iso-8859-1?Q?0R8CSzJCSWv3yCLoOfntMVQWtVHqVslDPnb3ZJ0GmsTGhS8LWY1l5Jsde4?=
 =?iso-8859-1?Q?Py9w5d1CAdP2hDrCB+zpQoXVVph0HwX/ITlKNvYaWpGgVAyuEwN8PH0sH3?=
 =?iso-8859-1?Q?Ht5/jGkrMd7ryrrxXrr4VlZZuGkwx8SLbBYU0yFzJl3SixdMnF5isfiETZ?=
 =?iso-8859-1?Q?dloaIClVo9jtn/OT3I2Z3B2MHHZaKM+nJBl04rdRAbxgnZtwCmLrd4grC9?=
 =?iso-8859-1?Q?QBu4cRSdhUFjI93gt0Zp53FU0dMCE+bU9EwmQbdn0fumnz9kEP/dHQmJv2?=
 =?iso-8859-1?Q?mh1PtpFNTB45A1fl70byH+2onzOLVCXyFnQWgKT16n4plIaRZsZhRzC4/R?=
 =?iso-8859-1?Q?yPqE8IiWBJs5kWX9GgZOnLdmGHdikmYLTwsGXjDPnyE8BWwtRhvjHWGUhn?=
 =?iso-8859-1?Q?Sh/ceJq3ja/Bnl4bJFXMhefYO/SXabQ5kUtOUDzZKgoD2hOvEgs8thGlC+?=
 =?iso-8859-1?Q?5MWfQKcB9k6i8qX+BJyCiLIikmnWkrDzcyiLYTrFHfx9FbZh48/UGz5/I/?=
 =?iso-8859-1?Q?YojoL2MWvsfePtYjNZHC5+ALRVzqVlPGB3j6xZN8jW0ixEuhwTRvbKz0OD?=
 =?iso-8859-1?Q?LV9eqQWwZvgHQxFoPtdhO7L8yIOvc5iYhVWwflwccAvBy5JaYnmZ4DtstI?=
 =?iso-8859-1?Q?6Ax+cBjRHzIJxsY1fvRceRP/V2E8OX7zSFgmkLy3e5Xb7YdNbBrirp7N4O?=
 =?iso-8859-1?Q?UNWdVdZLO7dCJRf4GC6jE2iQ9l3IiBGwbMOpp8JHxlGkz5QIrZDAAj/gNM?=
 =?iso-8859-1?Q?wb1Gt1F5BR0PYnQY6y9I1tzsd93ZxnhZ/kdo+/JN1OOIsjnIL325sQvw3C?=
 =?iso-8859-1?Q?ywdnf+G0z2jKlUROrdjyanpcgfEQ8RdllmyFkF6v9AjQjHU0l8xQqbHmsD?=
 =?iso-8859-1?Q?cQHx9SFvIl0IrBy9g4BmUpeTN65+64Waul8qpHIJH0T0LsJ5z90Tx0JFDr?=
 =?iso-8859-1?Q?H7A1NWALAb/35SKO0c05JjwsVZbOAkV17/rlqG9O9+BuwCMKR6WRCthxU5?=
 =?iso-8859-1?Q?C9H54Jwww1Iq1BfzMPvQPd?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?1z26pOsBPOVcvyzhIELZDjpnsyhkcpUKWVgdcFgwiqqq+ksLJNGckd5g7h?=
 =?iso-8859-1?Q?S8FqLwj1U+AInFWOGiV8k+C1LmaDNcTlXOeofdWD9wJJDY9tVyNRFI9lA+?=
 =?iso-8859-1?Q?ZFMmd2Mm05H6uy6Ym2TPDF9SaEuWi/XXL78FXjr9sUC0ytuY59tJfpS/Kk?=
 =?iso-8859-1?Q?1ATS+fSvWVRLRuIlqRoIfHEPncRg3edyHdA35mqLDkiSQUl+0NJiAYDgAr?=
 =?iso-8859-1?Q?/sfN3J7mpcXSJHc2/GDlJKsuyd0lSD7s49vdrKTYmpplnpP5SvCdLdlwa2?=
 =?iso-8859-1?Q?ouzgANHofhlKkkR2Gu8vv0sKrWVHJtC957A7Ek9uKeFFSC6nMHBLaGomq2?=
 =?iso-8859-1?Q?AVGcYQyzuycwWxDL4viUASPJPt6G3PxTxyet3/aH0IphuO7WbNiPc6Fbic?=
 =?iso-8859-1?Q?gq85hP8vvrEUIeJV+fW3audWL0QPn5je4zTgYBLMtwpfsnVccQ4GWJbJYk?=
 =?iso-8859-1?Q?hBW8+Mu//i4pVVY5iUZHI0yytoRIEztELqVxht77/E28AKgvq9MLYLXpMk?=
 =?iso-8859-1?Q?awL6nv0Q3Bfu5AP4RH/H0+6fDmnNFTf6EDVSodI8zPaX/3Fs0iAELiNAPP?=
 =?iso-8859-1?Q?oeE/GjIJPtwhTS6i7CqgXJSpeGLkVQrkCvJJTT25ZEHkgGXN2MX5uRoXg+?=
 =?iso-8859-1?Q?xnzpzq25dNKVdiwiOIYSzS1aVlVh9pGbsIdvb9AXSNSPMc0WUS1TTkKPS5?=
 =?iso-8859-1?Q?+sWgR3NvHCGoTIo1aQ0lu1NmgF5pCxWH64fBEoXjgm9jL5qAchYl7Se1JI?=
 =?iso-8859-1?Q?Wb4xW6L1VXpvfwdzhrqiS1c2hpvDuj+ax4A0fAnJBIuI0/EUeoZSQ+5udd?=
 =?iso-8859-1?Q?iR1TYTdOFbOr4k6+i2bD5QWItR3Lff+l40qJBykQ439CWxWkxmaewOCNSF?=
 =?iso-8859-1?Q?7t7rROJ7y7LEhHHPUmu0MqmMO2QECpEIuGl8rvCsprT/MJmMs4Fuk12BP9?=
 =?iso-8859-1?Q?NpRKMxAoGbwiWAGclGcSOPkggBtNgLBlIBED70v+B8Pjtzif4Y3CvcHt+r?=
 =?iso-8859-1?Q?TbTmf7/EgDPLIClcwbvSUNLt2JrLIsyYHMleCiUck7akkWC6wSTWFqjZ3F?=
 =?iso-8859-1?Q?YqhPJE8XFjRDMctWiCak7+gKUOrHEuRcOvQBApRr+3KEdaCwF/UcmqXOsN?=
 =?iso-8859-1?Q?gEYVUwH76g5o+gDnsI0IP44ggqCNPSf0pVp/yfZYTFS5TRrPGNyITvC927?=
 =?iso-8859-1?Q?3KNR4iKUv2fbSRXc6JARZyhTPkPLJar7hzlyBOv5+cMVPOIeVVc7iIoCtr?=
 =?iso-8859-1?Q?tnmMOn/ayn9ibipUO3WBzfEtXX8jhB+WLnPUiDayTDpmAU45g6VKg3UDr6?=
 =?iso-8859-1?Q?RpNLe9yjJZAZbSoSnRYTzyoCbizFfPgJpsBxn3V9hDG3A8B4KaMN65QDpP?=
 =?iso-8859-1?Q?SLhcE/GRaKVivIgMNQOegTxQh51mAEFZHUETjRg2Vqp96pJwWCYEljOuHS?=
 =?iso-8859-1?Q?n/+Z8E1YHqUW7yY0LfT3xIksNBljB8o15Ia4TNSrywPCaIo/GBURWXmV0s?=
 =?iso-8859-1?Q?nKSHNnCtSEW0770UOztPWYAP0zwYSsZcjH6HxTCsvqHebQG9hVWr0Mqijx?=
 =?iso-8859-1?Q?WNp7Or5RAL8UTKocJevMK5tMozuOkZWn9aXSCoJYfACXaGkai73c1XdUsf?=
 =?iso-8859-1?Q?2eWfkDqbaNS8iXmLIW09yCZJ9GBcSeUQuXpiTFDV4WTNqYgOUqJRDVgQqq?=
 =?iso-8859-1?Q?S7xMTBzK/7Jh80ALPZPzasdm7ObzyGQ2nsQ/wxHWTJz7BnhjGcSU3XMohk?=
 =?iso-8859-1?Q?flJo5EXwrDYXkarG9LcpoPmnDeBpVIOWGM32wmKUboAiK2zI79SOjD8Q8N?=
 =?iso-8859-1?Q?H2GPbLvsVjSaDsjiNM8z5fRRwAnl55g=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 20ec925f-345e-45fe-10b4-08de5243f7f2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 01:35:01.0569 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4V9STFktSR38dEgRgQEIgcpnYNBjs6s0YlmR1v1ebSv3elY3u40uq528DAjlafjC7VNFAXtnYH2HNFJkESs9tQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6001
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

On Mon, Jan 12, 2026 at 06:28:01PM -0700, Summers, Stuart wrote:
> On Mon, 2026-01-12 at 15:27 -0800, Matthew Brost wrote:
> > Introduce context-based invalidation support to the GuC TLB
> > invalidation
> > backend. This is implemented by iterating over each exec queue per GT
> > within a VM, skipping inactive queues, and issuing a context-based
> > (GuC
> > ID) H2G TLB invalidation. All H2G messages, except the final one, are
> > sent with an invalid seqno, which the G2H handler drops to ensure the
> > TLB invalidation fence is only signaled once all H2G messages are
> > completed.
> > 
> > A watermark mechanism is also added to switch between context-based
> > TLB
> > invalidations and full device-wide invalidations, as the return on
> > investment for context-based invalidation diminishes when many exec
> > queues are mapped.
> > 
> > v2:
> >  - Fix checkpatch warnings
> > v3:
> >  - Rebase on PRL
> >  - Use ref counting to avoid racing with deregisters
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_device_types.h  |   2 +
> >  drivers/gpu/drm/xe/xe_guc_tlb_inval.c | 145
> > +++++++++++++++++++++++++-
> >  drivers/gpu/drm/xe/xe_pci.c           |   1 +
> >  drivers/gpu/drm/xe/xe_pci_types.h     |   1 +
> >  4 files changed, 145 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_device_types.h
> > b/drivers/gpu/drm/xe/xe_device_types.h
> > index 8db870aaa382..b51acff4edcd 100644
> > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > @@ -358,6 +358,8 @@ struct xe_device {
> >                 u8 has_pre_prod_wa:1;
> >                 /** @info.has_pxp: Device has PXP support */
> >                 u8 has_pxp:1;
> > +               /** @info.has_ctx_tlb_inval: Has context based TLB
> > invalidations */
> > +               u8 has_ctx_tlb_inval:1;
> >                 /** @info.has_range_tlb_inval: Has range based TLB
> > invalidations */
> >                 u8 has_range_tlb_inval:1;
> >                 /** @info.has_soc_remapper_sysctrl: Has SoC remapper
> > system controller */
> > diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > index 070d2e2cb7c9..328eced5f692 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > @@ -6,15 +6,19 @@
> >  #include "abi/guc_actions_abi.h"
> >  
> >  #include "xe_device.h"
> > +#include "xe_exec_queue.h"
> > +#include "xe_exec_queue_types.h"
> >  #include "xe_gt_stats.h"
> >  #include "xe_gt_types.h"
> >  #include "xe_guc.h"
> >  #include "xe_guc_ct.h"
> > +#include "xe_guc_exec_queue_types.h"
> >  #include "xe_guc_tlb_inval.h"
> >  #include "xe_force_wake.h"
> >  #include "xe_mmio.h"
> >  #include "xe_sa.h"
> >  #include "xe_tlb_inval.h"
> > +#include "xe_vm.h"
> >  
> >  #include "regs/xe_guc_regs.h"
> >  
> > @@ -156,10 +160,16 @@ static int send_tlb_inval_ppgtt(struct xe_guc
> > *guc, u32 seqno, u64 start,
> >  {
> >  #define MAX_TLB_INVALIDATION_LEN       7
> >         struct xe_gt *gt = guc_to_gt(guc);
> > +       struct xe_device *xe = guc_to_xe(guc);
> >         u32 action[MAX_TLB_INVALIDATION_LEN];
> >         u64 length = end - start;
> >         int len = 0, err;
> >  
> > +       xe_gt_assert(gt, (type == XE_GUC_TLB_INVAL_PAGE_SELECTIVE &&
> > +                         !xe->info.has_ctx_tlb_inval) ||
> > +                    (type == XE_GUC_TLB_INVAL_PAGE_SELECTIVE_CTX &&
> > +                     xe->info.has_ctx_tlb_inval));
> > +
> >         action[len++] = XE_GUC_ACTION_TLB_INVALIDATION;
> >         action[len++] = !prl_sa ? seqno :
> > TLB_INVALIDATION_SEQNO_INVALID;
> >         if (!gt_to_xe(gt)->info.has_range_tlb_inval ||
> > @@ -168,9 +178,11 @@ static int send_tlb_inval_ppgtt(struct xe_guc
> > *guc, u32 seqno, u64 start,
> >         } else {
> >                 u64 normalize_len = normalize_invalidation_range(gt,
> > &start,
> >                                                                 
> > &end);
> > +               bool need_flush = !prl_sa &&
> > +                       seqno != TLB_INVALIDATION_SEQNO_INVALID;
> >  
> >                 /* Flush on NULL case, Media is not required to
> > modify flush due to no PPC so NOP */
> > -               action[len++] = MAKE_INVAL_OP_FLUSH(type, !prl_sa);
> > +               action[len++] = MAKE_INVAL_OP_FLUSH(type,
> > need_flush);
> >                 action[len++] = id;
> >                 action[len++] = lower_32_bits(start);
> >                 action[len++] = upper_32_bits(start);
> > @@ -181,8 +193,10 @@ static int send_tlb_inval_ppgtt(struct xe_guc
> > *guc, u32 seqno, u64 start,
> >  #undef MAX_TLB_INVALIDATION_LEN
> >  
> >         err = send_tlb_inval(guc, action, len);
> > -       if (!err && prl_sa)
> > +       if (!err && prl_sa) {
> > +               xe_gt_assert(gt, seqno !=
> > TLB_INVALIDATION_SEQNO_INVALID);
> >                 err = send_page_reclaim(guc, seqno,
> > xe_sa_bo_gpu_addr(prl_sa));
> > +       }
> >         return err;
> >  }
> >  
> > @@ -201,6 +215,114 @@ static int send_tlb_inval_asid_ppgtt(struct
> > xe_tlb_inval *tlb_inval, u32 seqno,
> >                                     XE_GUC_TLB_INVAL_PAGE_SELECTIVE,
> > prl_sa);
> >  }
> >  
> > +static bool queue_mapped_in_guc(struct xe_guc *guc, struct
> > xe_exec_queue *q)
> > +{
> > +       return q->gt == guc_to_gt(guc);
> > +}
> > +
> > +static int send_tlb_inval_ctx_ppgtt(struct xe_tlb_inval *tlb_inval,
> > u32 seqno,
> > +                                   u64 start, u64 end, u32 asid,
> > +                                   struct drm_suballoc *prl_sa)
> > +{
> > +       struct xe_guc *guc = tlb_inval->private;
> > +       struct xe_device *xe = guc_to_xe(guc);
> > +       struct xe_exec_queue *q, *next, *last_q = NULL;
> > +       struct xe_vm *vm;
> > +       LIST_HEAD(tlb_inval_list);
> > +       int err = 0;
> > +
> > +       lockdep_assert_held(&tlb_inval->seqno_lock);
> > +
> > +       if (xe->info.force_execlist)
> > +               return -ECANCELED;
> > +
> > +       vm = xe_device_asid_to_vm(xe, asid);
> > +       if (IS_ERR(vm))
> > +               return PTR_ERR(vm);
> > +
> > +       down_read(&vm->exec_queues.lock);
> > +
> > +       /*
> > +        * XXX: Randomly picking a threshold for now. This will need
> > to be
> > +        * tuned based on expected UMD queue counts and performance
> > profiling.
> > +        */
> > +#define EXEC_QUEUE_COUNT_FULL_THRESHOLD        8
> > +       if (vm->exec_queues.count[guc_to_gt(guc)->info.id] >=
> > +           EXEC_QUEUE_COUNT_FULL_THRESHOLD) {
> > +               u32 action[] = {
> > +                       XE_GUC_ACTION_TLB_INVALIDATION,
> > +                       seqno,
> > +                       MAKE_INVAL_OP(XE_GUC_TLB_INVAL_FULL),
> > +               };
> > +
> > +               err = send_tlb_inval(guc, action,
> > ARRAY_SIZE(action));
> > +               goto err_unlock;
> > +       }
> > +#undef EXEC_QUEUE_COUNT_FULL_THRESHOLD
> > +
> > +       /*
> > +        * Move exec queues to a temporary list to issue
> > invalidations. The exec
> > +        * queue must be mapped in the current GuC, active, and a
> > reference must
> > +        * be taken to prevent concurrent deregistrations.
> > +        */
> > +       list_for_each_entry_safe(q, next, &vm->exec_queues.list,
> > +                                vm_exec_queue_link)
> 
> Nitpick: I'd prefer braces around the the if here so we aren't nesting
> the multi-line condition within this list_for_each loop.
> 

Sure. CI and local testing is showing this loop explodes too. I'm
reasing two GTs are modifying the list at the same time as I'm just
using a read lock here. I think vm->exec_queues.list needs to be per GT
actually or just use a mutex to protect the list.

> > +               if (queue_mapped_in_guc(guc, q) && q->ops->active(q)
> > &&
> > +                   xe_exec_queue_get_unless_zero(q)) {
> > +                       last_q = q;
> > +                       list_move_tail(&q->vm_exec_queue_link,
> > &tlb_inval_list);
> > +               }
> > +
> > +       if (!last_q) {
> > +               /*
> > +                * We can't break fence ordering for TLB invalidation
> > jobs, if
> > +                * TLB invalidations are inflight issue a dummy
> > invalidation to
> > +                * maintain ordering. Nor can we move safely the
> > seqno_recv when
> > +                * returning -ECANCELED if TLB invalidations are in
> > flight. Use
> > +                * GGTT invalidation as dummy invalidation given ASID
> > +                * invalidations are unsupported here.
> > +                */
> > +               if (xe_tlb_inval_idle(tlb_inval))
> > +                       err = -ECANCELED;
> > +               else
> > +                       err = send_tlb_inval_ggtt(tlb_inval, seqno);
> 
> Can you give a little more context on this line actually? So this is
> going to send down a 0x3 type invalidation to GuC (TLB_INVAL_GUC). GuC
> is still doing an invalidation to hardware when we write this. Is that
> the expectation with this?
> 

Yes, I think I explain this in the comment above. We are issuing a dummy
invalidation to maintain ordering when required, this would be GuC TLBs.
Not ideal but we can't break dma-fencing ordering and this case so be
exceedingly rare.

> > +               goto err_unlock;
> > +       }
> > +
> > +       list_for_each_entry_safe(q, next, &tlb_inval_list,
> > vm_exec_queue_link) {
> > +               struct drm_suballoc *__prl_sa = NULL;
> > +               int __seqno = TLB_INVALIDATION_SEQNO_INVALID;
> > +               u32 type = XE_GUC_TLB_INVAL_PAGE_SELECTIVE_CTX;
> > +
> > +               xe_assert(xe, q->vm == vm);
> > +
> > +               if (err)
> > +                       goto unref;
> > +
> > +               if (last_q == q) {
> > +                       __prl_sa = prl_sa;
> > +                       __seqno = seqno;
> > +               }
> > +
> > +               err = send_tlb_inval_ppgtt(guc, __seqno, start, end,
> > +                                          q->guc->id, type,
> > __prl_sa);
> > +
> > +unref:
> > +               /*
> > +                * Must always return exec queue to original list /
> > drop
> > +                * reference
> > +                */
> > +               xe_exec_queue_put(q);
> > +               list_move_tail(&q->vm_exec_queue_link, &vm-
> > >exec_queues.list);
> 
> Will get back on this one... need to spend a little more time and do
> some testing.
> 

I probably should flip the put for clarity but this is in fact safe as
queue's memory can't disapear if vm->exec_queues.lock is held.

Matt

> Thanks,
> Stuart
> 
> > +       }
> > +
> > +err_unlock:
> > +       up_read(&vm->exec_queues.lock);
> > +       xe_vm_put(vm);
> > +
> > +       return err;
> > +}
> > +
> >  static bool tlb_inval_initialized(struct xe_tlb_inval *tlb_inval)
> >  {
> >         struct xe_guc *guc = tlb_inval->private;
> > @@ -228,7 +350,7 @@ static long tlb_inval_timeout_delay(struct
> > xe_tlb_inval *tlb_inval)
> >         return hw_tlb_timeout + 2 * delay;
> >  }
> >  
> > -static const struct xe_tlb_inval_ops guc_tlb_inval_ops = {
> > +static const struct xe_tlb_inval_ops guc_tlb_inval_asid_ops = {
> >         .all = send_tlb_inval_all,
> >         .ggtt = send_tlb_inval_ggtt,
> >         .ppgtt = send_tlb_inval_asid_ppgtt,
> > @@ -237,6 +359,15 @@ static const struct xe_tlb_inval_ops
> > guc_tlb_inval_ops = {
> >         .timeout_delay = tlb_inval_timeout_delay,
> >  };
> >  
> > +static const struct xe_tlb_inval_ops guc_tlb_inval_ctx_ops = {
> > +       .ggtt = send_tlb_inval_ggtt,
> > +       .all = send_tlb_inval_all,
> > +       .ppgtt = send_tlb_inval_ctx_ppgtt,
> > +       .initialized = tlb_inval_initialized,
> > +       .flush = tlb_inval_flush,
> > +       .timeout_delay = tlb_inval_timeout_delay,
> > +};
> > +
> >  /**
> >   * xe_guc_tlb_inval_init_early() - Init GuC TLB invalidation early
> >   * @guc: GuC object
> > @@ -248,8 +379,14 @@ static const struct xe_tlb_inval_ops
> > guc_tlb_inval_ops = {
> >  void xe_guc_tlb_inval_init_early(struct xe_guc *guc,
> >                                  struct xe_tlb_inval *tlb_inval)
> >  {
> > +       struct xe_device *xe = guc_to_xe(guc);
> > +
> >         tlb_inval->private = guc;
> > -       tlb_inval->ops = &guc_tlb_inval_ops;
> > +
> > +       if (xe->info.has_ctx_tlb_inval)
> > +               tlb_inval->ops = &guc_tlb_inval_ctx_ops;
> > +       else
> > +               tlb_inval->ops = &guc_tlb_inval_asid_ops;
> >  }
> >  
> >  /**
> > diff --git a/drivers/gpu/drm/xe/xe_pci.c
> > b/drivers/gpu/drm/xe/xe_pci.c
> > index 91e0553a8163..6ea1199f703e 100644
> > --- a/drivers/gpu/drm/xe/xe_pci.c
> > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > @@ -889,6 +889,7 @@ static int xe_info_init(struct xe_device *xe,
> >                 xe->info.has_device_atomics_on_smem = 1;
> >  
> >         xe->info.has_range_tlb_inval = graphics_desc-
> > >has_range_tlb_inval;
> > +       xe->info.has_ctx_tlb_inval = graphics_desc-
> > >has_ctx_tlb_inval;
> >         xe->info.has_usm = graphics_desc->has_usm;
> >         xe->info.has_64bit_timestamp = graphics_desc-
> > >has_64bit_timestamp;
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_pci_types.h
> > b/drivers/gpu/drm/xe/xe_pci_types.h
> > index 5f20f56571d1..000b54cbcd0e 100644
> > --- a/drivers/gpu/drm/xe/xe_pci_types.h
> > +++ b/drivers/gpu/drm/xe/xe_pci_types.h
> > @@ -71,6 +71,7 @@ struct xe_graphics_desc {
> >         u8 has_atomic_enable_pte_bit:1;
> >         u8 has_indirect_ring_state:1;
> >         u8 has_range_tlb_inval:1;
> > +       u8 has_ctx_tlb_inval:1;
> >         u8 has_usm:1;
> >         u8 has_64bit_timestamp:1;
> >  };
> 
