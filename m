Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 008F6EA7943
	for <intel-xe@archiver.kernel.org>; Wed,  4 Feb 2026 19:11:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E98F10E74D;
	Wed,  4 Feb 2026 19:11:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FX56gZ7j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A59F710E74D
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Feb 2026 19:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770232277; x=1801768277;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=xzdpHNwQ2iz+6ZFCLJkMKVr1pRRTgxApBWENZHqBTnA=;
 b=FX56gZ7jJqqteEgWfO/8ByRkoFt3XSm4lkJLyhrbn0vwDTfm1XZ1I2aS
 4mXVA7eafhF0oe2sUWaUz3QqjtRqsBR2yhXxO6jT0hOe+UeVvDKHxBiZf
 Penk8dlwaO5LUCfh7CLr4UipPZ0UGRqabR/i3Kao9VAB9AFWrVQXZDEeU
 pp5s0PRuBBSHnPbK/BX44ho4ZLHN+EKRokMND1uFx03ma1RHULzKuJbe/
 Bm84pWzxSgjhOEnLQYMItpYNMaSmAb7PCiLkE2Uzu5E1RsLV4hTqTfXcr
 q2jTdOGksq/j4cUvrI2EO6IEaZb6tBzUAwBg0Fc54lKDcEqR30/c7NxxJ A==;
X-CSE-ConnectionGUID: ZjJTzJlaTMy5Fxl0P62hEw==
X-CSE-MsgGUID: e/Z3WKFtRYGy/Vm4JjeIMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71484838"
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; d="scan'208";a="71484838"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 11:11:17 -0800
X-CSE-ConnectionGUID: k/6eW1WvS6yKl9thy3I22A==
X-CSE-MsgGUID: 6pbGEQGoSiqVbEt1yYlZ2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; d="scan'208";a="209543265"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 11:11:14 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 4 Feb 2026 11:11:13 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 4 Feb 2026 11:11:13 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.7) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 4 Feb 2026 11:11:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l4+4aN2+Z2PikmJb6Xau/BEpIIlf0qR75+uqLfuC38Z+U1k/x3zPpyjWBM+yJ6vaP+iYS+gpAjp5dE126p5zMCt9UQfDhOB2P2DIAImnxTTLpryCVGqpNtZTWcpSmoU/rYjB99zywT0rRldEteV+PZVWUZghc9lZZ5ZoAGPBNMD8I6XQUkCI5pVHEe4sNzTYbjfzBoHxssRhQ4kvGHZk/QlgyN4GlOgAiYaIj7F+kwy6YhxK9h73jRFLvUBiwi7sHiYsKYlPkTCzZzmbeflZJtMjdFmTQBIRmosEzqYpI0yY6MiGA2TWO+C4/Lty6/Ki+xzYW4AmpNucEBeK+Y8P+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KAKs4p528ulXugI9fPmLTN3pjft3rO0RDjF7U5Di5G8=;
 b=vzWUtsIqWXK1aO0KPzyi7aeCKDgH8yONIMWbR8KgrYcIuy6BpKjbZ/o+afmoPKVrsFpK6W7ttAj1ze6JZ2j7O6t9kbIK8WG2bQ/q5ZvDr1ZRe5c1HEn0xwS77GSZrif/yPxQkWU+AwMtGzcFI7Dh4/e2vruzreMfXo5/rUnfnvxemzQ2jyOE2wXV9rOLwpqwpjKrSKfdk9iZ+UOJvJns2fa1NSbryGqE43b6f0zpRCMXJPHH7N2LRkuhayhWeoeszPJa7MoHCeoTIyrltAHilf2WI5EQm2TZ0yA1s9uG4Vi5O2iql95oVKXEPz4M7Hb15p8lIxO+SVeNayUQnwEpKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by SA2PR11MB4828.namprd11.prod.outlook.com (2603:10b6:806:110::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.14; Wed, 4 Feb
 2026 19:11:11 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%3]) with mapi id 15.20.9564.016; Wed, 4 Feb 2026
 19:11:11 +0000
Date: Wed, 4 Feb 2026 11:11:08 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH v2 2/3] drm/xe/sa: Add lockdep annotations for SA manager
 swap_guard
Message-ID: <aYOZzM1CAC926YLR@lstrano-desk.jf.intel.com>
References: <20260204164642.3509298-5-satyanarayana.k.v.p@intel.com>
 <20260204164642.3509298-7-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260204164642.3509298-7-satyanarayana.k.v.p@intel.com>
X-ClientProxiedBy: BYAPR05CA0052.namprd05.prod.outlook.com
 (2603:10b6:a03:74::29) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|SA2PR11MB4828:EE_
X-MS-Office365-Filtering-Correlation-Id: fa06f543-87ad-4a46-2186-08de64212887
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?huNGUynrU+NvSZCZSNjyobKhLzQqHnCmnWJhTOWap/W7/yM/sKrfaA5mk496?=
 =?us-ascii?Q?0yrCiRh007nv4kUGoCbmjtKUuGixL0cUppAmPtO/u5Aw9kh71MO4vceTMVZs?=
 =?us-ascii?Q?wsqFVzPbc/Y0v2Hx7Vg+9T9JSgvlMRgy4sxd/QiAEvIk7wubrYr5PbhFHQpW?=
 =?us-ascii?Q?Jx+m1m1XIzy88P+Wvna0qo5i/RxOw5/+Q35SKZdQyBHqD3bIgO6N8HA3jRWt?=
 =?us-ascii?Q?Op4YmfaBCnKXmNM/lfMk0jlJgkYRWIC1me6rA/xWAulDVkl+yiE+GOp8cYjq?=
 =?us-ascii?Q?zpNDBwdUNt870JFgPBhDXS1I2CRwtdyhZnxxaCxREJvgzC5iV6Nk+5UzYJRt?=
 =?us-ascii?Q?3VfI6Kao4YL1yvfOtEiRFvx+kUrSipjruFHnLkm5CoBr07DQeJfw9piggbV4?=
 =?us-ascii?Q?/jLTtii/wmN+fXrryNPr8Qe+KbAF/bqA841C0OUdLOM+st7q+ZNBAfabxzaW?=
 =?us-ascii?Q?Uo9u+9NTkUPBVPawUn0LLgpn2V1Z9tUdNlLB1peOl8T/iEfYcv/fI/N1FO8u?=
 =?us-ascii?Q?fF+8jeXlhywdwU0gieZN7DxYbh3KOvPzHwfDr/Prgf8z/iI4n8txtNboOHuj?=
 =?us-ascii?Q?Clnq5pmnG1MZVE/8aCVzQcD+/R0gZJre38SBkaIS0hacyDTPd6pbQLCnmlqx?=
 =?us-ascii?Q?/8YzghnnRhhkr23Kl5tkHjvygCa0Afxe7mlO5lbswpQkj3a6IlNxN6ThfEnn?=
 =?us-ascii?Q?qoNKAHY+oGlyl5eOMC10c9L6+CKQTJAR+SBU+hFZK6MwT7WILWZyj2FsarXK?=
 =?us-ascii?Q?Hfh1wUXLAlVfF3OX+j8YFI0rvLrYoivF3RS93jiKm7mNV/lx1xK0FvvXXJdd?=
 =?us-ascii?Q?Capvh+JoRbS4ZnXSgZm6FW7LEfXPVE91E1tpcDVd3Nf7xZKVUVzFLttfZxo8?=
 =?us-ascii?Q?lHgqLYRpNaveVVxrWJbtubZI3Rxw+bi5v0IERp0vViHtC3FgPXvwAyDJBVj5?=
 =?us-ascii?Q?KodnKssbfSYBnaQAHTugSQhXRxewF3WinNYIa3FUto5rNYLL0ju90Y50KbcG?=
 =?us-ascii?Q?DWBYWGe+z3MpHp/NLqTyltnnZA2U9JVlHYB0lVh1ewRpQV6Xr6FJKHZknTy8?=
 =?us-ascii?Q?OHevs07MLWmmeF33xpNzU2hMJkWL+kV5A9GQ3JnIciO82HxWY2PxxdRgxCYq?=
 =?us-ascii?Q?gMwYxnviVkGTm66+75qwm1yk/LB5qY2VtwfisNIQ5is3N1OBBqojEa+k+vzB?=
 =?us-ascii?Q?2W/XRimMm8y0KSms+/TjP4jXRudeXdAPsOsP5hBmfgWsvU9HCrlskcRZ5ts6?=
 =?us-ascii?Q?UF2Bnvb7U+rWar7CMBUmTt0PtR4t3XzRz1W7Qkq3do0oUHE2O6VxsNNwsgEI?=
 =?us-ascii?Q?SjV7KEUHEwPW3Tn84pwaCnHZCw/CR/b3QIqVn0QmR1oclAYg+Zp7vNTgB9e/?=
 =?us-ascii?Q?1Ff6aCLzAwiLbXW67Elzn8vKTb3dOeB3vp+xGibc3Hyd5hIPXgh1CNVhTNss?=
 =?us-ascii?Q?ZE4cskZPdgpp8lGrtTNaFscxGCnipzLrvE5n7KH+VhGMu9U9K0fcLKTa6Goi?=
 =?us-ascii?Q?c+jccPN5NPGFrdD7AUiUii6fDjieVj20Y+ldHVVm40Whr/TDtQ4AJctq0NRN?=
 =?us-ascii?Q?SRO9Cs0RG+2dYDxBw6M=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wok1Vbk2HsoHRNEu+1/k2as2jp4rSSdRjzWDTZBuvo9vVZiXvBh7+DIhgYkl?=
 =?us-ascii?Q?9a2CO/kLOB1uVFZ0bWD9uOC3YricS6RVWKDYlp8eJNr0Q5jEbz5KRcAZJl/K?=
 =?us-ascii?Q?5naIavU0Vz6vgn4GV5UCkKNBzwJGpffF5qpGhXzHjuu35MPnKAc5jbkfE4HN?=
 =?us-ascii?Q?kqrt5Vr2F25LIXvd/Ce/Cwv1Flky3aBgqgyv0jeAiCWztYTY7xMYlDqxJpau?=
 =?us-ascii?Q?1S0DcSl8oqMgCWIGs7liuPgz2SNPip/0BUdxnIcrH5A/r/vXw8ZnjDhPPMiv?=
 =?us-ascii?Q?QOhirXRhYdro5lL7uXq+i7R/EWcuGBQyyVKhHXokwwrghFeh14pXCIdQrLr1?=
 =?us-ascii?Q?RUYpxLxtMBJRT1YEQPGA8vcQq3SSla5IQrxKGCXej1c6XMhm8ZsBxsgS1Jer?=
 =?us-ascii?Q?cKajBQsIYMLeOK81LFUdqTopEnmDJUWoQ6L7YCNJXBJgMck5alQdO7GfNOsy?=
 =?us-ascii?Q?mV9XOobjZXOq/zDV633wMH8hetOcT99hsyNV6eu0lkYcDKx6Uos9dYAbPdAL?=
 =?us-ascii?Q?SuUTJvyyzHBWk/2EsIEQSStOBQSdoOVRPvnSmKQFL96ZpQbDrFpBxZsybFki?=
 =?us-ascii?Q?e+3/2Tr0s1Fc8bvOnM7jNW8kcQ5r2gJVygDHbxy34i3F+EqXWIjlvQKLvP2r?=
 =?us-ascii?Q?3Y7FI+BvfDgMunSBwX1AWMIY10o/idcX8unMWDVsSb/zhH9eZyY2gL/yfRi5?=
 =?us-ascii?Q?N86+XjnqnBFcnzosSOGeeyB5PD7WrxQdeKz8Pui+It8vTlNLzq26t4bmTVXb?=
 =?us-ascii?Q?Ylg7RN3kfefMz9BMCY5xFhL9CnHXsER+i7i7i3jQ9BtQqP8pOqlYHk1PS7A5?=
 =?us-ascii?Q?Wt2LKBC935noReIz4LJZBDXQ1DgZGQd3HF26wCAxvOm8ZwfNuYAwAgZlGMQ2?=
 =?us-ascii?Q?zfxLKye1tuYm3x8EWWnQXvNGn/iRk5r/DyMLV4o8BNiHio8TyLfwH24Qqo1s?=
 =?us-ascii?Q?hsYAGw4QAOJfPy2Oy5X4mpydJzIjwA85UhwWAem+CeJsgH4FzQND/2VjkYaZ?=
 =?us-ascii?Q?+GkXGX8taOrhReDu4oDPILyFQO6cOL0an+FzStHzGS+oM267fWaZi0aQO1KK?=
 =?us-ascii?Q?dS7q+4TtU7xBHSzqhAB1jU62ktrPbaGQFWRqGiASRtTzlX3W9ied/oA9ZnWy?=
 =?us-ascii?Q?25lHXNpB2hHhAYc9eOoSeP0URKAa0JI7LXgqjDUsr0sMkPZIvqhq/+ncCeJE?=
 =?us-ascii?Q?QjeBzo21V9fvoqtdbP1lXTqfaltQafWIduBRClXioQ/QcIA5heTI611EzRDm?=
 =?us-ascii?Q?2xc6srydn3r4Czz10T8w+M/hOiWh6GRIqh+Wmd+B4nJJNNlffDLIH05rfHjn?=
 =?us-ascii?Q?bPYJTnoBdC1pJbDj3SgsI96bCO2DX9AQ5RpP2Obs9zmCxUrSHQd5b+ZuGhf3?=
 =?us-ascii?Q?ARXkKVkqzwYmGGF4bnXJknJ+XsswBpGYZiia8J1EfKRQvg5Hd6Ay7OxefOl2?=
 =?us-ascii?Q?yD5cnCI3F/ewZxMlGtQuIp4QRytdDuq6uhbQBwT8Nx0RI23Pq5r0f3bhGIWA?=
 =?us-ascii?Q?oFiWf2QuAZGVmcz+WmnUV9WvkWiqRjjIAMDMrxv5w7XzqJLC9P6r6l27I62S?=
 =?us-ascii?Q?teprv7k6LJdAgr4RN1+r5uT97FG35IMQqQ2C0CvTotImeL67EoZ8I0VOAz8D?=
 =?us-ascii?Q?EHPRaB4lZDBHPIZ/dSrzuBpTJ/VWn1GBlFygboedVoBnjxcgwMD8Fi/js3Si?=
 =?us-ascii?Q?6Zm2ZVG5buMXONKizAFWLQNC9i80i4Fc0HLzhj1W/YO3MNLzPfao4GF2onyQ?=
 =?us-ascii?Q?Tz6c/ppK2w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fa06f543-87ad-4a46-2186-08de64212887
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 19:11:11.2420 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8s81N3CH08+PF4w7FGMmoQGvvCZFiF/vO/k+yiKOVB8SDT3PiUqZDBzAFJ9Gm3dwyMJbIgQMv29Vy/59LQlrWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4828
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

On Wed, Feb 04, 2026 at 04:46:45PM +0000, Satyanarayana K V P wrote:
> Annotate the SA manager init path to model taking swap_guard while under
> reclaim context. This helps lockdep catch potential circular dependencies
> between fs_reclaim and swap_guard in debug builds.

I'd mention without this annotation it lockdep is unware of this chain
until the shrinker runs.

> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Suggested-by: Matthew Brost <matthew.brost@intel.com>

I'd make this the last patch in series so it goes in after the reclaim
problem is fixed.

But patch itself LGTM:

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> 
> ---
> V1 -> V2:
> - None.
> ---
>  drivers/gpu/drm/xe/xe_sa.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sa.c b/drivers/gpu/drm/xe/xe_sa.c
> index b738102575d4..5efbb5a09f77 100644
> --- a/drivers/gpu/drm/xe/xe_sa.c
> +++ b/drivers/gpu/drm/xe/xe_sa.c
> @@ -89,6 +89,12 @@ struct xe_sa_manager *__xe_sa_bo_manager_init(struct xe_tile *tile, u32 size,
>  		if (ret)
>  			return ERR_PTR(ret);
>  
> +		if (IS_ENABLED(CONFIG_PROVE_LOCKING)) {
> +			fs_reclaim_acquire(GFP_KERNEL);
> +			might_lock(&sa_manager->swap_guard);
> +			fs_reclaim_release(GFP_KERNEL);
> +		}
> +
>  		shadow = xe_managed_bo_create_pin_map(xe, tile, size,
>  						      XE_BO_FLAG_VRAM_IF_DGFX(tile) |
>  						      XE_BO_FLAG_GGTT |
> -- 
> 2.43.0
> 
