Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3953C0218A
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jan 2025 17:03:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F73610E02D;
	Thu, 30 Jan 2025 17:03:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BirmZJSU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6255A10E02D
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Jan 2025 17:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738256634; x=1769792634;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=UZKxKOMMmb5PsoDUxbfh267nJ2FTnc5Iu4NGO5F3FN8=;
 b=BirmZJSUfoF29hwrhvHVnNcsklSMEBk/DeJkVzpruLhIoKHBiwppXDTa
 XjQyndV30GviXAsvtU7R/IeQ3IRd3UMGBOc3S+V7RUN48nU2hDnJmga+1
 PG8IjVX45LIOIpT42Xg5zQbLC+9w3ElYge9tIznwwWKaLC8JV44PsPJiR
 it9efpzZKKPK1GoiLjf++ym2RP0QfYThCav33PoYHZ8Y0F5oqOAplysSj
 WM4kfjlDJRi4MfT3tQcLRDnRUxHiYQpGr7GHvpUk6zII/Wp59WtAFquN3
 Jcd9seCEArmUaROHEwQh8WlsLY2Po+IpX3jMQNt2hPOjpHzyvULHN1+Dl g==;
X-CSE-ConnectionGUID: Dm/8TESTSMqcZcVlDlCsiw==
X-CSE-MsgGUID: N66rGSxDS7OVdDIURbPkwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="49799912"
X-IronPort-AV: E=Sophos;i="6.13,245,1732608000"; d="scan'208";a="49799912"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 09:01:59 -0800
X-CSE-ConnectionGUID: w2o/RWvXRAGSwF2SPvNB2Q==
X-CSE-MsgGUID: vJ2OB1r0SxKgOeclvPUJZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="114363331"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Jan 2025 09:01:59 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 30 Jan 2025 09:01:50 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 30 Jan 2025 09:01:50 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 30 Jan 2025 09:01:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IWvC/Pc4MtAe4LDnc2DZPC1ncrCtW7dCjhusu9W8USOv33saQ/DanwYhEEe86b+D9u9TPNhiM5NerNpZ/pSjOz5RUcbazdUqKK55d2277bDf7r2lI2KrUaRDpd/DRkBToMxIONsnfreTFhaQV+ZxEeXPGnj/2jUGUqVL+kgUne2ccss/VqkTG9VxxixrsWekinTqLb6+ZZC9Efc8G5wfneeML+nIdaie/DVOR7Dxii6CgInw+JS+d9PD/lnjw4VsTaAvKY1Xu16cxWTKPnimVJTiQoc5EG4YeXqa2iIjqph+cdBWQ0UcaFHTKhpC9hqiTZfJ2OcEoiwUrJikDnbgPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dYyMXKw9NKjvseGynGEsWwPMOTlDcgPCMh/NNPGWZec=;
 b=TbAaWg1TAMzHvAczptjQol9UWnNmbKEHGfMmYQ6pSs64fK5wUgAk2Fe4EtV+OBZ4CoUkarnTfmUH3d30ASPFhXt2U8lDr4cdHuDToTCwBwGxuGFF6MIyvsQAvABkIl4wDCZ3NTqHP2gvl/RlEcnro1/qnAjy2opldFjR2A3+AfgcInRirIn3UhuzV+km7dmAnv+mYCPyoLQHi6eoJ1vy06EIcuqk3H0TOVPVjqZkzM69czDJGTPiqSU2R6ah0xsyYFNlz5oqq4rEqf78EOguczZDahSSEGr2MHpr4YmdTI2pM2StB2tdSMyRpvky3XTXB+3O411pzjScPa6FNrlYLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by CH3PR11MB7866.namprd11.prod.outlook.com (2603:10b6:610:124::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.17; Thu, 30 Jan
 2025 17:01:32 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.8398.018; Thu, 30 Jan 2025
 17:01:32 +0000
Date: Thu, 30 Jan 2025 11:01:26 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 <intel-xe@lists.freedesktop.org>, <kernel-dev@igalia.com>
Subject: Re: [PATCH 3/5] drm/xe/gen12: L3 recommended hashing mask
Message-ID: <qtejsaeqxq2mquolai72ykoc6enz57dhkobfsdiodthslleeu4@v77hsb6lmajs>
References: <20250129155627.93827-1-tvrtko.ursulin@igalia.com>
 <20250129155627.93827-4-tvrtko.ursulin@igalia.com>
 <uyje2ytdlfmkitygqjqo4lobspearzzwt4edkeetpupngrckcl@oy4ebrtn23yt>
 <20250130162334.GR5109@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250130162334.GR5109@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: MW4PR04CA0116.namprd04.prod.outlook.com
 (2603:10b6:303:83::31) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|CH3PR11MB7866:EE_
X-MS-Office365-Filtering-Correlation-Id: e2bccb34-ff42-4ea5-b86f-08dd414fbecf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PxVh0pAzaHp01x99JO6t4hhbL4DUuulAwu+Licsw4rPq/UgQzvywyaMcdejb?=
 =?us-ascii?Q?MvOCd0Od7DRHahjP2brDTz8JExmSCiQ5HaQFkZ1MMVmBoA5+0gtt5l4d716N?=
 =?us-ascii?Q?7UrjV1VozhqS9jDqD7mBLuLP+/m3c6rY22jFC+0WC9eFFw6vBvSgxPQ6TChR?=
 =?us-ascii?Q?xJ5CaSKkj9mJYzQB/gpfCmD5yDSEsbYaS9xoqzPwB7EmgjN7EL0wJbZBhkuE?=
 =?us-ascii?Q?1obOSZt4KivgIAu0bh+mURnKX6Le6rKXPdATyS++BHJpu5/PCb0uT74245TF?=
 =?us-ascii?Q?Fm/82pCF+4yJoaktuNS9v1JgVlZzY1+Jr1AVQOCgpX0GUXVsrEdVMbMVkDsw?=
 =?us-ascii?Q?k+Uj/BTUHtE/cf3UL2sKw/aDbJy2kurD02O3Oq8lmaJZwTXW5NHL7Td0fO5M?=
 =?us-ascii?Q?sw+n7KRjB04C7rtH3ZkCWOIsPr4lZgyhnbwbb/B56WSGrdoq9149eR3++tXB?=
 =?us-ascii?Q?Ii3fs2K0sTziOiTi9tOqa+La5nI5tcWsAhhqF94ItsYR3H8ur/oVg/pYk4Ib?=
 =?us-ascii?Q?065KWgzwmBsx8wKOpYBaphCfV2KOddapboPhh3V3ydG2pMG7/EJ98gl2kIXK?=
 =?us-ascii?Q?tHjfu/0BeEwdylYl7KWpRYvZILS7uMRz8VxqD1WCu7JGaM2J8JKOBR3bL2j8?=
 =?us-ascii?Q?bg2z4DNMkiDc1fwv16CF59jx9HXM8Y//uiuw7UUUgmmNfpTTQTcwmbDgkyHw?=
 =?us-ascii?Q?vZgFoHauSpMWIDBlTSXOSZKh2XrnkXnz3TRap18IKdlFBve2KlHkzz5Yyhvu?=
 =?us-ascii?Q?baN7RZzWyQC9nNiVq3Ufjtijd25Pbwe2MN9vTu1sHOWp+IwMUbls2FbvtR+f?=
 =?us-ascii?Q?rH7v5MANbYpFzmkaR2cdCO7XK/IXERABDmk1D0jAkoSElF8BbGuN1TjlFrdV?=
 =?us-ascii?Q?LGJiz36Ay1JrizQPZx6dV9hONNEVC5ETOgJ4oX7VAVkmTJBhzt3yF36m30OU?=
 =?us-ascii?Q?vcJBgSTGBcg4QCu52tUxwPAInHexxHJXoOFfV8Abvc/plzQKdJEI2YPl8Efq?=
 =?us-ascii?Q?jieiNB/4pnBVfYz20+AxEq+gqW2y005cmv15kfRf9DfchEY2b9cUCiFOVHzP?=
 =?us-ascii?Q?BpP+S9fFPs+GA8K0pEeVjr3fts+bE57FhICZlP/1SNpgNZ4kHWbzrTDq1Ctt?=
 =?us-ascii?Q?uQ6lnS2W3GOOgek7r32V8m/bPJXr62nF5yrEdkYLlE2FZYtUBxLhOktcqYP/?=
 =?us-ascii?Q?iWxistnidrA4FOVkZxZmNL26WCD+mn85Vs42QEGyQJOwi+Dxj21n02n1UDhE?=
 =?us-ascii?Q?yf/AIqtqILQh+8STQ0zrgwH3gOYItgzhxb9HdSh9qjXQhQG5ySUcLRmPT9R5?=
 =?us-ascii?Q?hyc0Njcz1gZIDwCFTNMiZysCFeFH2FV2uqszd0hZY52MnGvZqztW4foLhOLW?=
 =?us-ascii?Q?rFlrPdbLPRoVyTzQafnf3BFaGXJ+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Gk6zvLheYBxVwlUJ5j1i6363B7CQg/4HkcRh1AJIn9A282wJLVxZvBZnlqYB?=
 =?us-ascii?Q?xRhqVTwobHfXwxYbu9gCwf3ncvgSizLTenF42T2hpLBEkOjHZStZXD9JB351?=
 =?us-ascii?Q?cily/qBKaQPHbLMulhOWuXd6557cdyLfhDSxmwUAJRszAvGO6OfnbU0IAraZ?=
 =?us-ascii?Q?He8Gc+Mx6v9BCL0K6GlqV3KpsyQYgahukIE+uMLV33LnpnhzNPbAee9w7TJr?=
 =?us-ascii?Q?tMco0cnbUbDQ96bAO39QRXLaIxor54e4xyeYsyEJ+FhQMv9kQbd+MlaTVJCP?=
 =?us-ascii?Q?MvyYDsQswiPvs9eo5y/FLYW2mBX49nh4gehAO3qAoA5WenB1iZ4e15wSZV7U?=
 =?us-ascii?Q?PtoY1yANLh8EljoLguenU0Ix4gryPN0UVk259QX0KL4mCeXWy+iGJr9MfDwu?=
 =?us-ascii?Q?hs5KN+kktW7t9ZqU+as2bMb+WBF++i0ur+YRKy09qhAJmhjVuVMmYYYDeYyf?=
 =?us-ascii?Q?54bmsZdxAG+s4acU6L39hb60gPgG7T1uVu3b7yDR43yY+un+xPBuD+ckWey9?=
 =?us-ascii?Q?cB/1S2OG8YnbT70qddC4aGEy7IEtrEKsrkvoIj8nEaECOPHltTkPwNG/9ceo?=
 =?us-ascii?Q?JOECoATNphARxYatvrxq+VvUdv+PoQ6+8KNoo8s1N/b+XvoJu2Ev3tJ6kaD/?=
 =?us-ascii?Q?7JdgCAhGb46JrHgKaVBx3ObPec8TEDy8U5/iTdU8lYYExX02/rGXiHwCaCei?=
 =?us-ascii?Q?/sDMLM31IXqQg+OVrXCg6BNgq55R+liINfQYwtKCr/GQzRVKBBBOY8mEgUed?=
 =?us-ascii?Q?amB7FboZk/DFxGxReI1fyV8AeIAnRDdWMZkBUgPct8RkKkUkPhMPB62nfpIr?=
 =?us-ascii?Q?1VpYN1GzTTXAwfgxIDFMCJMogUD3Qr2Ens15h7KdjJ4/PiGcRqgBuTpnVnFv?=
 =?us-ascii?Q?wfg3xLD1So669wbMm57iJxnvywEn8FmyOYckBa0judph6xLpmKG8mM5uYnLS?=
 =?us-ascii?Q?K0/vSo00oncV+/ChnHKHDUSQi2wcKjdMIDuK1EErRzfrwLuoOxu/GJUK0yc0?=
 =?us-ascii?Q?qYfJ+FMBKhfHMjVgbAfBnh3+ZJEitlkiqWJtgZ48IXl1Dyl9GMxksPoGzz92?=
 =?us-ascii?Q?/Ei5TQXGBK9/TQ9GXaAFuuYY9dDKoEf4OXHZA0OqJgzyd/LkpIdggdP8GLa7?=
 =?us-ascii?Q?W27WtJfL2VKk17l89Djbl1rYRh+5Z9ScmkIuOxiCCG/4HJGGR90xMypanzXA?=
 =?us-ascii?Q?DrbjfsGWa37jD2hV+DDD4Wc6G2ActQd8/FX7xMUBAyOGqabL6ydxb2Ejo7xE?=
 =?us-ascii?Q?tqT47imPHcjLRZka6wKK4TLKk04v4WB8eRQtgCN8y7GtmdLUwypdotIPRefF?=
 =?us-ascii?Q?F2JSqsYzGW52RbKkOMCPO6IsOA34zxeK3cLqRQEFkkFXRNq8BIvKO47/+JfQ?=
 =?us-ascii?Q?JJbRduWVlqiSv7aesoqO93rY1FpyrqTcemXJ3YpztyuYGnTzBFJrwgNbhRJL?=
 =?us-ascii?Q?tATrRd9+epawnrZkfHWxNH2NBs1VZ+08G8kxh57ebJKaGPAQ7Ps3TO1/mmV9?=
 =?us-ascii?Q?1PvTolmAq0PEote41rJE2oJ8kuLdAcIqqCLgPiyNg8RYq8vZ5auWc/GQkquD?=
 =?us-ascii?Q?eKqZdcpEkVw2IQRvd16C/51ZKt9SbjSwB7s0TjuFXARDn42bAN+OiB5vsaWn?=
 =?us-ascii?Q?HQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e2bccb34-ff42-4ea5-b86f-08dd414fbecf
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 17:01:31.9521 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DnByTzACE+1LGBRQdrKrRZXbFzfLbEaZYzM0jgJ2cyIqxm4VY1ZF9Yzrevf2r4A3OY2G5zqdmY0KyGAH045dCh0t35/FD6bquGMctOegoLI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7866
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

On Thu, Jan 30, 2025 at 08:23:34AM -0800, Matt Roper wrote:
>On Wed, Jan 29, 2025 at 12:30:28PM -0600, Lucas De Marchi wrote:
>> On Wed, Jan 29, 2025 at 03:56:25PM +0000, Tvrtko Ursulin wrote:
>> > According to the i915 codebase xe missed to set the recommended
>> > performance tuning for L3 hashing which is applicable to all legacy Gen12
>> > platforms. Lets add it.
>> >
>> > Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> > References: c46c5fb725be ("drm/i915/gen12: Apply recommended L3 hashing mask")
>> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> > Cc: Matt Roper <matthew.d.roper@intel.com>
>> > ---
>> > I could not find the reference to this in the public docs, including
>> > confirmation whether 0xb004 even exists on for example TGL. Then for ADL I
>> > don't see that PRMs have been made public at all.
>>
>> leaving this part to confirm later. Matt Roper may remember better and
>> chime in.
>
>The tuning setting here is still documented for Xe_LP and Xe_LP+
>platforms on bspec page 31870, so this seems legitimate.  I think the
>only reason we never added it to this driver was because Xe's support
>for the pre-Xe2 platforms was never intended for any real-world use,
>just for early driver development when Xe2 hardware still wasn't
>available.

thanks for confirming. Let's add the bspec number in the next rev.

>
>The register itself exists on the Xe_LP and Xe_LP+ platforms, even
>though it isn't included in the public PRMs for some reason.  It was
>removed in Xe_HP, and the tuning no longer applies after that.
>
>>
>> > ---
>> > drivers/gpu/drm/xe/regs/xe_gt_regs.h | 3 +++
>> > drivers/gpu/drm/xe/xe_tuning.c       | 6 ++++++
>> > 2 files changed, 9 insertions(+)
>> >
>> > diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> > index 096859072396..909638b18557 100644
>> > --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> > +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> > @@ -366,6 +366,9 @@
>> > #define   XEHPC_OVRLSCCC			REG_BIT(0)
>> >
>> > /* L3 Cache Control */
>> > +#define GEN8_GARBCNTL                          XE_REG(0xb004)
>>
>> mind the commit 0bc519d20ffa ("drm/xe: Remove GEN[0-9]*_ prefixes")
>> GEN<x> prefixes/suffixes are not here on purpose.
>> When we refer to GEN12, it's XELP, or simply drop the prefix when it's
>> not needed.
>>
>> Registers here are sorted by address, so it should be before
>> XEHPC_LNCFMISCCFGREG0
>>
>>
>>
>> > +#define   GEN12_BUS_HASH_CTL_BIT_EXC           REG_BIT(7)
>> > +
>> > #define LNCFCMOCS_REG_COUNT			32
>> > #define XELP_LNCFCMOCS(i)			XE_REG(0xb020 + (i) * 4)
>> > #define XEHP_LNCFCMOCS(i)			XE_REG_MCR(0xb020 + (i) * 4)
>> > diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
>> > index 9e7ec36dbd47..b21a59578ba3 100644
>> > --- a/drivers/gpu/drm/xe/xe_tuning.c
>> > +++ b/drivers/gpu/drm/xe/xe_tuning.c
>> > @@ -107,6 +107,12 @@ static const struct xe_rtp_entry_sr lrc_tunings[] = {
>> > 						FF_MODE2_TDS_TIMER_128))
>> > 	},
>> >
>> > +	{ XE_RTP_NAME("Tuning: L3 Hashing Mask"),
>> > +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1254),
>>
>> 50..55 are made up in sw... I believe it's safe at this point to just use
>> GRAPHICS_VERSION_RANGE(1200, 1250)
>
>Generally we apply rules to the specific range of platforms that they do
>apply to.  In this case the tuning applies to Xe_LP platforms (12.00 for
>TGL, RKL, and ADL-*) and Xe_LP+ (12.10 for DG1).  So I'd just write this
>range as (1200, 1210).  There aren't any platforms that use any
>subsequent version numbers until DG2's Xe_HP shows up at 12.55, so it
>doesn't really matter from a functional perspective, but I still think
>[1200, 1210] is more precise than [1200, 1250].

Ok, I was assuming the by using 1254 the intention was to cover 1250 and
exclude 1255 onward. If 1250 doesn't have that, then using 1210 should
be sufficient indeed. Bspec 68331 doesn't show it, so agreed.

Lucas De Marchi

>
>
>Matt
>
>>
>> Lucas De Marchi
>>
>> > +		       FUNC(xe_rtp_match_first_render_or_compute)),
>> > +	  XE_RTP_ACTIONS(CLR(GEN8_GARBCNTL, GEN12_BUS_HASH_CTL_BIT_EXC))
>> > +	},
>> > +
>> > 	/* DG2 */
>> >
>> > 	{ XE_RTP_NAME("Tuning: L3 cache"),
>> > --
>> > 2.48.0
>> >
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
