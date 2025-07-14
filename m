Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 708EFC83F1B
	for <intel-xe@archiver.kernel.org>; Mon, 14 Jul 2025 15:28:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35CF410E498;
	Mon, 14 Jul 2025 15:28:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZP+1zp70";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D4EA10E498
 for <intel-xe@lists.freedesktop.org>; Mon, 14 Jul 2025 15:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752506885; x=1784042885;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=RX4Ly+T8roS+gHklOyuTuUv1eR85Ahos8nRQZNujir0=;
 b=ZP+1zp70CQlRh09Ie7/IghRn39NjW5sMhsiWl7BlK0OKy4viNXjmbNIr
 y3DrdTgU2w9gojhYFL2AJuXSsvhhyvAcne1vDK7rc7UWRQBQAdO86FDEs
 gcEpoBIFI7iLUQo8eZ5zz5DbAAobxrcxd04kzZCZ4TEMoZSe6/+0Eh75m
 P6HJWTGdNqr0ouMaLdU07APLYH9jZJHMGBacLm2CrqNqfp1gNIb+aIBc7
 dxnGAIqk265TOGyTsHSa/p8R0XBBYVxZjjPyua6OzLaBzz7T/mRhGhb4k
 xVWcAYTY7+5mr3MNyAgms2TI7F0mk5P3HE1w6+NW8eyofRdrirwdZLlko g==;
X-CSE-ConnectionGUID: cbI0yY5sT+2a32PB7lUarg==
X-CSE-MsgGUID: vuKkvneqR2WWDQbxegRbaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="72150464"
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; d="scan'208";a="72150464"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 08:28:04 -0700
X-CSE-ConnectionGUID: SRIHu/xzT5CINxGGXbx8/Q==
X-CSE-MsgGUID: l/+IFFD4QripMlmkzjs19A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; d="scan'208";a="156370251"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 08:28:04 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 14 Jul 2025 08:28:03 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 14 Jul 2025 08:28:03 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.40)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 14 Jul 2025 08:28:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=otNiKkMGwn6O5QSwc+fELmZ0KF0+QlaMlagfbDdw/aVwktyui2odEWCjI8lp6LjrCcodmWOm5G96SIfyfXXeiO5gmbAqAmNNKnjDGEd5bxPe4wDBHCv1sR8g0ez6m/L6Dqqxb6+Xu1Kg8PmXa0VI3Iv9wuU8yh4b+8Dc06Ywdkv5HwXXLtcymwgNgoXNEv7NP9lx0Gx7uI4qoMQIsIkzsirGRxLrMJPm5mivn6HZpc1cZ+2r3iXjmvMK8Z6WydXD7lS4hJN9lnERVwEI0HiXEK6nLAQe5iHTbI7mzjGqJx5KAlkrsCaxcAZ76reyAO3fLZDRLe/iY7rLXCVtdMx4Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vmJFPoPaMYWbJInPHCtRdh3kSuZh7cn4rVALbyicsCU=;
 b=Of9vRZXvVFzWOrnpqNG4HYrAncC65G7WFvUpw1EN17I4NJ87mCWwqwzWgFy12WyxqHOAVWZh7rk5TDoyQR/cw9IWahUGo3jFSo0IKDm2RppxEnrkX+6ZHsjNnQptaHZC7oO9HbrqdzljoiXNbiNymE85qr9rv6pzx/lq6cfuyg4UOAuA5cfSmovU3S0lvhzG0DNGY+2iptL3Q1GIpIWhargeRTWtnXqSQr7GPki8V6GM494TpEwbbkGfpx7RY8ZrePHHIzsKl00WvfZejwfedF9lgqBxugE3YpMMp0dIArCcJZed5+9VdWjaLu8Uwo/BQwKV7phCzXhXhkquSci9Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH3PR11MB8750.namprd11.prod.outlook.com (2603:10b6:610:1c7::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.35; Mon, 14 Jul
 2025 15:27:58 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8922.028; Mon, 14 Jul 2025
 15:27:58 +0000
Date: Mon, 14 Jul 2025 10:27:54 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: <intel-xe@lists.freedesktop.org>, <kernel-dev@igalia.com>, Matt Roper
 <matthew.d.roper@intel.com>
Subject: Re: [PATCH v10 0/8] More missing XeLP workarounds
Message-ID: <guk2rrsfewvqw3rcknnnhmgjk77ug7gwycu3thi2yeiw4j7bdx@r4lpcrs7lwxv>
References: <20250711160153.49833-1-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250711160153.49833-1-tvrtko.ursulin@igalia.com>
X-ClientProxiedBy: BYAPR11CA0053.namprd11.prod.outlook.com
 (2603:10b6:a03:80::30) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH3PR11MB8750:EE_
X-MS-Office365-Filtering-Correlation-Id: d89c5f5d-222c-4d1b-7121-08ddc2eb0300
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9oQk+Bill5nxFOaS5m5Rng9Q5N4El48FGPJYVn3ZrhlmRm9E1aK6SDy7Lu0C?=
 =?us-ascii?Q?kv6gM8FF/Bzi4ADLNV755fu5aR+t/iXrzrmgeI2VUhn5sxukDl77vzfBAuEm?=
 =?us-ascii?Q?5WZjMA1O8Wk3CTXPfV5x51ouykcSZA5uO5/7KPJLjPASe1IwELR5Ew6NnbAi?=
 =?us-ascii?Q?lc8auURhPmIrBU6EtBc69aaQhPj6E4+kfWvHxQm1IGDqOkk61UAdQ0FVoZXo?=
 =?us-ascii?Q?K/TLGbABCDp1ehFTPMQZay8X/+KaqR8VHpB3FILZUuVGiYX4NzqpfTB7njVf?=
 =?us-ascii?Q?wzcCjAu1r2+1rIX+4Y6XRnsPoORX5qu9dbt0q+4iZ85RYy9aNDTYrWNQ1rzE?=
 =?us-ascii?Q?YghPcCNSnEL1XhHAVZI0L6k51RsNN+et4xcrQrKWIdf4cYlIM5JnRG5uaZUK?=
 =?us-ascii?Q?/RkOezOSnJEzbppn94Clir1BCa1SvMrOfW1Xr4fc+pw05lSJQwxIfx+R4AeG?=
 =?us-ascii?Q?qNGr5EKdcB3nngWmrFm4hG57niAcgAJfIdhAI3r5ifhxaSVXXrxlziUyXsdB?=
 =?us-ascii?Q?4p9F2mOWaR0dSMcMUTN9YlnjC3NRYG/me0mdiWhS26Q9PuKiwo3AOVpO9+96?=
 =?us-ascii?Q?nDM4xbkzSkCq6vpuDHp+QdZAq/3GjseuaZguil4lVlKlDxhTDBQcA3mU3wdu?=
 =?us-ascii?Q?NHeeZoIWmS8K4jHpKizC6ktIIn3mnfy92SVIdXz+UfYlfKa2Ul/h9F/ji/nD?=
 =?us-ascii?Q?2AqN65LVelLE+3HEuJQ+oQYUbcR8Nl7vcNeg/gQBRAYfVez/5SkSIMNMVXUc?=
 =?us-ascii?Q?VPrt0IrVuQCTIeprbni91Ii8HKRY/6+y8bh06kGqdbGSG80YDmRsUEic/08/?=
 =?us-ascii?Q?+D9PGeQ1IS90OUvPsXYxYocZAXqLNe75NI4gNkuYM0ZZDIfflcm77HRXPHjc?=
 =?us-ascii?Q?ifRjrqf8Gc1iWgdknDoWyxJRWTDjkXHfA9z2GfbenhgPesN+3jYzOmWCJA65?=
 =?us-ascii?Q?g8gvcKCEypL6mB3Ix5uyLtmXE8Nsmx6f5WlRrRGWSzffuD1Qp/t3cOX5EDEn?=
 =?us-ascii?Q?JUissdQMgZxIOKsmsyGXF9s2pIKZhKHYivR0DrHGkTFD9KDxT2BGvRKRobiI?=
 =?us-ascii?Q?OJAzZw+o+Dtgfge6WeMOkdGCrQtdn//To0VWH6a1BcP/qKfV8/kuoNuRfaHw?=
 =?us-ascii?Q?YqU9SuNvZlybBTBBA4asitQ2Ls5N2c3G+JVkGPCFpJpUkJW2unJw/WY/iONu?=
 =?us-ascii?Q?5s1qsBxVD6YyWXGcN9xQR7QUTfq8LOE3Kzhq7bZUazDAnDitT1uvQOHrC3vf?=
 =?us-ascii?Q?OMuF3JOuLBD59rKVei0/QDwkBHl0mUyUJ9uCtp7Ryleh/VuY9FYo2EwAAqmS?=
 =?us-ascii?Q?7D+7ossEoQJJqUVCTOf2DGB4x4xk50pXFtmdif6+IQ1ACHvv2DHzLFP1VdaF?=
 =?us-ascii?Q?9CDKwvLGZOwHde0XKVn0DHEe5kEUf7BAQlz6Pri19C1qya0y31FCc8xgfxpY?=
 =?us-ascii?Q?YRVzT2eSc20=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/OTpTIe+EfpJNCiueI1xcaHI/tZBh6JGTtu42jP/QCs1VDcu3VEIzJYhIE4p?=
 =?us-ascii?Q?7W5yfskfucHdWUN7ZFGmPMPIMte0Bl/edGt1q/GP+OTG8SxC0XtGvyA9sbo1?=
 =?us-ascii?Q?yi/Ua7Qs2ulwNgKYoDdWtt33p8bL08Wh1LfzQ3dYCw56LKHilC1hRivL+x3O?=
 =?us-ascii?Q?kfYOO52w5Al5azpo+QjX43/pnnUmcMIrz7h19JvHNu0tb9DzrsCXMIs0e1CN?=
 =?us-ascii?Q?u7VMV/MQLq2/v2mTWDi6nZY8/8xv6uUOFmUBhcSI8qVt5tuYuMqGqmWBbGpv?=
 =?us-ascii?Q?6hQBfo6EMpQ9ufEMYpGA0jbZwMZ4TvdYIwPb/JpgQNN9DVGVvBnLTfps6mnQ?=
 =?us-ascii?Q?VAmOE2+IJfJ+4Pxw4z8a4r1/s0Dwzi5db0soRtLcJRzgbqMq6EyNwIauKkBo?=
 =?us-ascii?Q?cdrI3+fb5X8Xkv9OZtBxb8gXup5Cx962zfPzFAfKSUHo2pF+XZEOuerC0u9G?=
 =?us-ascii?Q?261UZCkL9ZZeyU2STZ5G30TdFIHrG94PYvYBhtmMI5AqjBOs6HFwFxrJbPEo?=
 =?us-ascii?Q?aSiQiahAHQ2IWvjwZSmTo3BiY/xcggfdpN5mpEnbVLZymHjlk7DrgVO3NKRa?=
 =?us-ascii?Q?M3/O+Gswl0iHllrAoc1PwOPSSMGc73FK70bEycRqDLwnpcO8zUEgjynwdrAT?=
 =?us-ascii?Q?WwJy1CSRl5nOZ3wAhFtJA1pYAXZaa47F6FSB0yrIZjHondTU0V0Vhi50L+Ee?=
 =?us-ascii?Q?7IAPjoHckKo7f+9mX9rU3B/NtADRrYs9OezkHqs/VSaBzXQcU1+/509SZz5p?=
 =?us-ascii?Q?lem7F47vr8hW/gaHjaQ35htJIDGj9P4BuOyWqP/WcoxWDl7pdAsQv5Undclj?=
 =?us-ascii?Q?42C0OWWoxSkt1a1DEq6yv0NwRlt2YmmMS2CvAvka7xdipa9n4qfA7rGIJAUh?=
 =?us-ascii?Q?SA+L5H5f7qJj/zCo7cQAhuEJ9E12wCif5JjxLxni6BvQEqz2wJFUwypGSTSN?=
 =?us-ascii?Q?ImDSw1U3PUyZk6fMudF4OQARPD4qBkLaD78OddVPuKM1zMXQK31IYJ0VMsbs?=
 =?us-ascii?Q?6nMEnOsNmSyapa3CDkn5i6xkVyna3dwPolKqKfZRzskBM+JaXdB0pG/H5uAp?=
 =?us-ascii?Q?QUuDRy0duh7dDcN6yleQB9ykmuC8ryCDdC3IYSWcdAWYvDg3QozD6JPLA6js?=
 =?us-ascii?Q?0M2tSyf7aZ5eMjbTlt2Ew9iThgiXVN11k7Po7vHZYaphyYHlg0QlI4uuRYxb?=
 =?us-ascii?Q?bV6JY+5A3SA1BlmEUe0awvAXahAZ2xfd8wnVqIhmg3gFPjtvrL1hMAdRt6d6?=
 =?us-ascii?Q?Msx4uIZ8UpE1TgyXZgVlr4MmLqlYt6hO9DikenRMRTg8+C3WKhq91O5+ezQw?=
 =?us-ascii?Q?MzeGVfsqemjC4usZFJhb3ad+q2qN1tEp6lM6SiIiOm94/Z/hz/1N6wohyQCe?=
 =?us-ascii?Q?kN7CpzOLL6t3G/xTpJZbBUO4pzmHGsy25uJCtsofkfgbgSS9dkanf755ZUip?=
 =?us-ascii?Q?UBU9PLb56K5Le6d1EnZOsJY5KOIkCHrsnZLpgPxImcXrih+gacY46hAEvimQ?=
 =?us-ascii?Q?YTfobv+0BTr9jn0ifyj6Q9CKzqTplk32yFa/RjscR54gzQSLqqPbjq/d46Hd?=
 =?us-ascii?Q?gEaNyF5NaVXT+jGpain6CiYBa43u9DqVIAFi2uWJBHCHVIYij4N85KkZt35N?=
 =?us-ascii?Q?4g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d89c5f5d-222c-4d1b-7121-08ddc2eb0300
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2025 15:27:58.2091 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DawWexLgn0559wXQowZEYupITD0Y8gAqlvc6WaP9ad0Zhg4iaF4v1/SVRoGXcoEVxi2z2oC9IWTBo64GXqyLoTgIZZ+TA1lB2SPL2hAf7PQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8750
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

On Fri, Jul 11, 2025 at 05:01:45PM +0100, Tvrtko Ursulin wrote:
>Some more missing XeLP workarounds. This time including some which need to go
>into indirect context, which also means some plumbing had to be added.
>
>Includes a fix to use iosys helpers for existing wa bb emission since there is a
>code dependency on it.
>
>v2:
> * Use iosys helpers.
> * Split indirect context plumbing as a separate patch.
> * Tweak where and how Wa_16010904313 is emitted.
> * Move Wa_18022495364 into the wa_bb.
>
> v3:
> * Rewrite on top of Lucas' wa bb changes - use same infrastructure.
>
>v4:
> * Rework due 3a1edef8f4b5 ("drm/xe: Make WA BB part of LRC BO").
>
>v5:
> * Fix indirect ring state offset calculation.
> * Removed extra space in one patch.
>
>v6:
> * Fixed indirect ctx MI_NOOP padding to 64B cacheline.
> * Do not add negative errors codes to reported emitted counts.
> * Renamed workaround emission functions. (Lucas)
>
>v7:
> * Rebase for removal of bo->size.
>
>v8:
> * Rename bo emission helpers. (Lucas)
> * Drop XELP prefix from LRC layout define. (Lucas)
> * Drop first patch from the series as it was merged.
>
>v9:
> * Contain emission helpers arguments in a struct. (Lucas)
> * Use REG_FIELD_PREP for CTX_INDIRECT_CTX_OFFSET_DEFAULT. (Lucas)
> * Coding style tweaks. (Lucas)
> * Improved comment. (Lucas)
> * Split indirect ctx bo size defined from maximum hw supported size.
>
>v10:
> * Tweak code formatting in last two patches.
> * Drop LRC_INDIRECT_CTX_SIZE. (Lucas)
> * Use reserve_dw = 0 for the indirect ctx. (Lucas)
>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Matt Roper <matthew.d.roper@intel.com>
>
>Tvrtko Ursulin (8):
>  drm/xe: Generalize wa bb emission code
>  drm/xe: Pass wa bb setup arguments in a struct

there were a few checkpatch warnings in this that I fixed up:

	-:34: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
	#34: FILE: drivers/gpu/drm/xe/xe_lrc.c:982:
	+^Istruct xe_lrc ^I^I*lrc;$

	-:37: WARNING:UNSPECIFIED_INT: Prefer 'unsigned int' to bare use of 'unsigned'
	#37: FILE: drivers/gpu/drm/xe/xe_lrc.c:985:
	+       unsigned                offset;

	-:39: WARNING:UNSPECIFIED_INT: Prefer 'unsigned int' to bare use of 'unsigned'
	#39: FILE: drivers/gpu/drm/xe/xe_lrc.c:987:
	+       unsigned                num_funcs;



>  drm/xe: Rename utilization workaround emission function
>  drm/xe: Track number of written dwords from workaround batch buffer
>    emission
>  drm/xe: Allow specifying number of extra dwords at the end of wa bb
>    emission
>  drm/xe: Add plumbing for indirect context workarounds

and in this one:

s/CTX_INDIRECT_OFFSET_MASK/CTX_INDIRECT_CTX_OFFSET_MASK/

I don't like the repeated CTX, but if we are using it in the other
define, we should use it here too.

Pushed the patches 1-7 to drm-xe-next. I'm still waiting to hear from
hw/validation about the WA. I expect to get this applied next week.


thanks
Lucas De Marchi

>  drm/xe/xelp: Implement Wa_16010904313
>  drm/xe/xelp: Add Wa_18022495364
>
> .../gpu/drm/xe/instructions/xe_mi_commands.h  |   1 +
> drivers/gpu/drm/xe/regs/xe_engine_regs.h      |   3 +
> drivers/gpu/drm/xe/regs/xe_lrc_layout.h       |   5 +
> drivers/gpu/drm/xe/xe_lrc.c                   | 263 +++++++++++++++---
> drivers/gpu/drm/xe/xe_lrc_types.h             |   3 +-
> drivers/gpu/drm/xe/xe_wa_oob.rules            |   2 +
> 6 files changed, 240 insertions(+), 37 deletions(-)
>
>-- 
>2.48.0
>
