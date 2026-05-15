Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02406CD343F
	for <intel-xe@archiver.kernel.org>; Fri, 15 May 2026 21:19:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9207B10E421;
	Fri, 15 May 2026 21:19:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HAWmpHMQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D78A610E421
 for <intel-xe@lists.freedesktop.org>; Fri, 15 May 2026 21:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778879954; x=1810415954;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=9exzJT+A7AXBx3MKMI29mvvWl79VW4YkJOcJYD9OSuo=;
 b=HAWmpHMQLU4VWTv7IT7ZfQhWMV+Q+RfqMKkYyniMONZTrvwxXE2DlDJx
 K5DRkzXu9DTDh8lBrAY08AoWN2QIeQobWXtYZj8iEQSwu4ZFkxIO6s7c8
 z21bwyhtWMWO/PkYMCI3YplCbKX33X7e3sVxTueN78rrK7IlCO4zjNbK/
 YyvZOcW1/cP/7H6zz2/jQk6IpJEhzHjiUrnrHZRkln7lE0QWZM16x9liF
 OmMNLGhj17NihgajntFP9UhI4S/dKttKfz82B6S9t4hBxr5gOHl2Qpts2
 kyMIvpLQ3Fjafr/+OoYGyy0yXO1p75bXaw0dIu2DM3+71Va3Pm3ykml6I g==;
X-CSE-ConnectionGUID: T62vkrEuTBuREZp5IkXW2Q==
X-CSE-MsgGUID: CyA9jhlORZ6NM8r6DqKPHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="90944295"
X-IronPort-AV: E=Sophos;i="6.23,237,1770624000"; d="scan'208";a="90944295"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2026 14:19:13 -0700
X-CSE-ConnectionGUID: GeRXwpiVRmeWXbAn+DHaPg==
X-CSE-MsgGUID: moXbrXYFRxCC0gq+vvnkvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,237,1770624000"; d="scan'208";a="237935746"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2026 14:19:13 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 15 May 2026 14:19:11 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 15 May 2026 14:19:11 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.54) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 15 May 2026 14:19:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j7jkf7CWgsdCbxF2lLo1mjeCh/yv5UQ/wUvVHvSylSiuUMedF6+L5MAdlAUsasBB+XVIC8p+KGt+A7PMnGPcoDwZrmFrJ1HhmQxwOmINhY2bFJ1GpUQDUa3hJckwIdthyOSty8llogf1JbqHlveS/Sg4yAeaz/Or9QlwvNiUgwOar/imFPer4y32gNNPPtDFqgXgWwCl/meAoW5LjNAP7jTOtDA0csMyC5l7YgIC4CZwknwMBNP5B1+1DHS/XnqMexVN/6azSC0zxpsXzG0tWiDK2V2W6aNfEPFt9gPTL7jIm8HrEz8fVpnMmg5e8QWpJouMHWXVLMWrFUVYbqc0Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2qqzPwbCGqQZfYMOM2rK9LqIChF/uFUL1t/+Js2JqkQ=;
 b=Yx16gX/EDlvge6l2rCccR1R6WnkeSDQmTD6E9RdKJggbhTBx8byf3SE92jGOdfyxJsigmKQPiK42jTa1Z7YB9FXILTh2rQLfE5bvtwnitpueKLdDRbSe9y2XK7u//BJ4yIh5YCvXJygY0IeVx4L8zyjwzoy51Sm/p5D/k52A5mgjYgw0YyOuOQp0T099xQNnn13YaMn1shAJiGBTOR+gy2IRH4ddNFzrkHJNox0BTqEpVC4Rgx0+MwvE7hWX5rfESOR/irgrO/Gr8eUVEF3z/5RdPLjKOnXAmUKKSkObZgoDxK4yF6ntS3LScjzZHw+YcMnqqI8umb/97ByDo8mufQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by CH3PR11MB7324.namprd11.prod.outlook.com (2603:10b6:610:14f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Fri, 15 May
 2026 21:19:09 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%5]) with mapi id 15.20.9913.009; Fri, 15 May 2026
 21:19:06 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Matt Roper <matthew.d.roper@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v3 0/7] Fix MCR inconsistencies in RTP tables
In-Reply-To: <20260514-rtp-mcr-check-v3-0-30dd47855fee@intel.com>
References: <20260514-rtp-mcr-check-v3-0-30dd47855fee@intel.com>
Date: Fri, 15 May 2026 18:19:01 -0300
Message-ID: <874ik82wxm.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0239.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::34) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|CH3PR11MB7324:EE_
X-MS-Office365-Filtering-Correlation-Id: f727d570-b70e-452c-386b-08deb2c79877
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|11063799003|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: gXdx0aBsAb63rkHim0BICjgMqx8QFi4YxGW4noyy+EFohBEkYDiOnLVefG+YEL6cErTbQZ15lDqWL3E3bIPm3KkVrf3CZ7e7lgBO//CPzl+DTY1PU0+tboZz3fReyEURli7uy3RvKlh+meSstddetEY1+jRT5jBCmQVlemhv8a6Z8/5ZzcdFb7adFOPlrCZyEqDpXerTBT4iiX9e/dGdnZIoDepCXhbex1dG7pexsH/zGcL12MpoM0iR1BeZ0/6RndAqr1k/I1u0sqKOLXW4/JjMoOOpkFA91cveUijgFUj8Wr/njt4q/PCpl0WX9n/4SRUnrEvg8F6b70k2aXM/3OMDXWGn/0nkMg1ebdgDbIbm7sx41AS/yZ1ULd3PTz4Q1b4LkKz05QOQycHMnF2F6cfUZq3IAxL2OIyYq7ocirSMqbkz0wnV3DBr/Bdb/XiwpCr55w7+M9HFpoO5XxofBqKCWFTv4UEn2DVKKJqGYSKcEJleNRthz/B29ag11Sv0Q4WZLZdLMZtLoah0tl//94vmsRhXALEPjfzwnbc0ZdN1ZxcxiPKCDkhTBgB1csslZLZFFb1Kun5TW02Fn/Y90hFGf88BzLdWuXTorLKQg8BS3kK1HYZUSMI7lhv4RUspSOeTY8LLQ6C1TRI9/hZVgA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(11063799003)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RXQ9fIVJC8/kULsBZ6pOkTr4sGjy47znyaRIOf4WH1gorXa0FEO8tdKLd+mj?=
 =?us-ascii?Q?GJImxKZ2osrwznl2bczqje4gOi3/c5p2L8WYuUCQcx1vJfvNaIwbp3o9M2W+?=
 =?us-ascii?Q?IuHPJ2sriN5jrI2Jg9mWqj6a9bliSaXnNmVaMMumzubmomErvW9HvWNIA9IB?=
 =?us-ascii?Q?3HhtidEC87h4xLkDCVVkdKNUJz+cb96/Glp89Z6I+jwVKhyP1I60gUo1etAY?=
 =?us-ascii?Q?eURQjc65GZsUqNla+qjDEioZSnT1HH5EI/KIP3Z576mZFXXvpZOCjmmP0pGX?=
 =?us-ascii?Q?Q3SEQ2Fd8eG9eGRohivYLgYkY0wjnM5zYeR5VoHS0yuR66znMnBARVDRaFcb?=
 =?us-ascii?Q?IK8G9yTyAG04K315AliGiwO/XCWj6Mdc23w98Pu3u6nq2mEiQDEoNHjJQTh3?=
 =?us-ascii?Q?fJZLxiOqKRXcAQvZmTwZmYixqNpmWc6sEw0GYIGm51piE37h6vy3SAg0voKv?=
 =?us-ascii?Q?nN7oAt11Snqo1bC2lK8M67sIUHX25INTqRm6Xtr0Ff0pXFtUb6uGXuPb4p7l?=
 =?us-ascii?Q?8dVBxRelqY1Ivqhw113ZEe4CWS87eqDUGWTzOe+IaNdlNrpw45qR5SIMVHRR?=
 =?us-ascii?Q?RLxU4tMIjA6SoT57JzLWuG3n69aVCzIZpAM1ib26EkJANMn0+RxhZjoeiWNn?=
 =?us-ascii?Q?XLMxzuyJAzwUbK3NIOoBgovd+TFNXPRsq69kN6DgnvWtAN6KFSOdevEWUvhT?=
 =?us-ascii?Q?a/mp6k2MS0cspRzBCMrOtjpShRz23IB74JdSRHdoREyRgu598R/bsl+Fsh/d?=
 =?us-ascii?Q?MJCd5lT8SmO0nkrgsQDPsow45fetpMG5Xeyl3tPZQxI7tVRR0gmPkWSBy3Jt?=
 =?us-ascii?Q?1zfLdqEsBd7qTRa46XTnTwXXyzYH212UWZz3mjxqJD159oPBTCiAuoLAvIit?=
 =?us-ascii?Q?U6DaKxC38Qe1W9p4stZgNhXu1Ea9xNzoJJ98qmz0aGUyCCdmN4F+zDARuYwu?=
 =?us-ascii?Q?WYFelpqssvCociJi1myJRY8l1WVS9qldGb9o2DW5L1YTbBhhC+bzel9sMEdt?=
 =?us-ascii?Q?gNNoSUHxuSQl/TwXqMUQGdIaUsGN5nsqx8TJTuyB0nzKsOvj/ff2nrIcKSL1?=
 =?us-ascii?Q?8RyMk8aACCpAXy+hH8qqMYr7PhNFz3/5aJgU16xhyjin1lii2cWae4t8asV4?=
 =?us-ascii?Q?fhtMzPr4tDB8z0eLPSSuubuEZpcg4pYzGDvOpKNM2b31HVilXAFqERmzojRa?=
 =?us-ascii?Q?ZusOM3KkoJAL0FU66KDZuIyRyTn4qtRSbfd14HQGDFRWMVbzZb9yrvXX4jRv?=
 =?us-ascii?Q?fLlqrhKE/1lqyfDpmCsSSmieLoNfFDg6g0jzGErGSKdbbBhHAsshWH6ts1Fz?=
 =?us-ascii?Q?/MTOC0TBnnPh+VgWpKyxmKkGulfDAF3v7w8BKp0RbeEFFR88/vB8iZWWeadK?=
 =?us-ascii?Q?n5xSLsKdbxlFaamR4LshLUJnuNgvLNAEzSGJ40VCO4R9vI7NnfLhemRMno1p?=
 =?us-ascii?Q?xZ9W6l0HPTJvlQ7xRaSY5SZM8bGKzkzlPfB6vrQbQ1pn3jXMqUnakawRWu3c?=
 =?us-ascii?Q?Et3DiJw0B+0QWwkP0E5rIwgYVsqfd368oQljanhqxwt6IwxzYpDnBfeJnNIN?=
 =?us-ascii?Q?rVDzfRclla8DjwxzhLDDu5wWpoHFp16DwRwR8YrLrvro0JqqcY45Me0G8vmF?=
 =?us-ascii?Q?kq1Rf5YRXwAWbrG6UBoHOkrMrgIBbqTzH4Tku0V20rgm+JRrhwngtbcoiu3D?=
 =?us-ascii?Q?dP8tuftFTRtEeLKsFNo7OI7jIpOwdFQftUFNdTw3unppsuJpUImaTKNrHXuh?=
 =?us-ascii?Q?LniJgvY9bw=3D=3D?=
X-Exchange-RoutingPolicyChecked: h0QBVhhKZ5a03VigVfQTi6Z3YonrR4F/z8cWHJJthTTDwMmFlczBmv/Eq3g7yYSyueuqc863PI8xOE1yZRl+Liaaly7+R3peq7U+Z5sdZDZXB7Y96k5YKFCAA3yVvDbj1HEq/D0syQMTj6iF01ETAxlClV2cipxcSSVNRlVCeZa8dPxwm5aCkqc36x3O4kSZGysS3U+PvjU+l9zEb5n4I/IjWLB1jyZMn8ETbb6RYIyQxQoKVr47DnRCRWFa70596YJV+JQSIchK6s42pHQSn9eVt0p8SrOeiS+x5hFsvWc+CoqxWjsB9vEWznckGfiLOywhRkdM2lLMRpAwDyDd3Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: f727d570-b70e-452c-386b-08deb2c79877
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 21:19:06.1819 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y5m8gYUapYSxce+5m3N7irS5LxicgW0t/hqCWArjWdmv/PweUVhZontao1qDkev5kzetgWDYj3swYQkQSrVD7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7324
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

Gustavo Sousa <gustavo.sousa@intel.com> writes:

> The Xe driver uses struct xe_reg as base type to represent a register
> definition, and defines struct xe_reg_mcr as a sort of subtype to
> represent multicast replicated (MCR) registers.  It uses this subtyping
> to "force" the use of the correct MCR-based API for MMIO operations on
> MCR registers.
>
> In regular driver code, usage of those MCR registers usually need some
> reasoning about whether the access will need to be steered or a
> multicast; and the correct MCR API will be selected.
>
> For RTP tables, on the other hand, that's not the case.  The developer
> when defining an action the developer can either select a regular or a
> MCR register and the register save/restore logic will make the selection
> between regular vs MCR MMIO access depending on the register instance
> defined in the RTP action.
>
> That allows some mistakes to go unnoticed: a non-MCR register instance
> could be used for an RTP action against a platform where such a register
> is actually MCR; and vice-versa.
>
> This series fixes those mistakes.
>
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>

Pushed to drm-xe-next.

Thanks Matt and Michal for the reviews!

--
Gustavo Sousa

> ---
> Changes in v3:
> - Dropped patch "drm/xe/kunit: Add xe_kunit_helper_is_live_test()",
>   which became unnecessary in v2.
> - This version is being sent mainly to get fresh CI results before
>   applying, just in case any new inconsistencies were introduced in the
>   meantime.
> - Link to v2: https://patch.msgid.link/20260508-rtp-mcr-check-v2-0-9897b147a5d2@intel.com
>
> Changes in v2:
> - Incorporated review feedback. Please see individual patches for the
>   respective changelogs.
> - Dropped inclusion of hw_engines in xe_wa test.  We will implement a more
>   focused test to check for MCR inconsistencies in the future, which will
>   iterate over all applicable RTP tables.
> - As a result of the above, dropped MMIO interception patches, as they became
>   unnecessary.
> - Link to v1: https://patch.msgid.link/20260116-rtp-mcr-check-v1-0-d420b9c1a327@intel.com
>
> ---
> Gustavo Sousa (7):
>       drm/xe: Define CACHE_MODE_1 as MCR register
>       drm/xe: Define and use MCR version of COMMON_SLICE_CHICKEN1
>       drm/xe: Define and use MCR version of COMMON_SLICE_CHICKEN4
>       drm/xe: Extract xe_hw_engine_setup_reg_lrc()
>       drm/xe/kunit: Use KUNIT_EXPECT_EQ() in xe_wa_gt()
>       drm/xe/mcr: Extract reg_in_steering_type_ranges()
>       drm/xe/reg_sr: Do sanity check for MCR vs non-MCR
>
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h   |  4 +-
>  drivers/gpu/drm/xe/tests/xe_rtp_test.c | 71 ++++++++++++++++++++++++++++++----
>  drivers/gpu/drm/xe/tests/xe_wa_test.c  | 14 ++++++-
>  drivers/gpu/drm/xe/xe_gt.c             |  8 ++--
>  drivers/gpu/drm/xe/xe_gt_mcr.c         | 67 +++++++++++++++++++++++---------
>  drivers/gpu/drm/xe/xe_gt_mcr.h         |  1 +
>  drivers/gpu/drm/xe/xe_hw_engine.c      | 15 ++++++-
>  drivers/gpu/drm/xe/xe_hw_engine.h      |  2 +-
>  drivers/gpu/drm/xe/xe_reg_sr.c         | 36 +++++++++++++++++
>  drivers/gpu/drm/xe/xe_tuning.c         |  2 +-
>  drivers/gpu/drm/xe/xe_wa.c             |  6 +--
>  11 files changed, 186 insertions(+), 40 deletions(-)
> ---
> base-commit: 2edbd77a2045d12d30c95dbb5842b831e3da0035
> change-id: 20260112-rtp-mcr-check-f976cb1adf94
>
> Best regards,
> --  
> Gustavo Sousa <gustavo.sousa@intel.com>
