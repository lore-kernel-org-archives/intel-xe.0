Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 924A6CD5BD0
	for <intel-xe@archiver.kernel.org>; Wed, 27 May 2026 21:28:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5187510EA2B;
	Wed, 27 May 2026 21:28:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KEvdDXpF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78A0B10EA2B
 for <intel-xe@lists.freedesktop.org>; Wed, 27 May 2026 21:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779917279; x=1811453279;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=1QOOo3dxVq60WXTjoNGfniDmBjzDhqG1Nu3OCmh2GJA=;
 b=KEvdDXpFiMiD8A/gNd1hC5ISLSQmTTZoHDAuYTTQ6eupmP1dckW40eb1
 Z8uVyPFi2rl5XvyVV+bLSu0/0Ldjs41auLDysfgzNJdm75BesytPjM1N2
 oH8G2pxfEX+y0Tj3YcznGfBx1yvDzpcHhbbMKZAy52DinQzRRnsChmdyl
 jE3WXiEKUZShtQX7qvQKVQXHK9SR1JaTovZVymlfHhKwDmlsr/zUnNRAb
 tBXcrpbvHaNTm8bUyVy5rA5gG0BXXZnNztA63QgQX4Wt7f4Dogpz5afxO
 Zslvd8/w/23RuPSALPNR/zHxREgTqVQ8jlI6ePJthuGuWQGjvPUGxEMH/ A==;
X-CSE-ConnectionGUID: VHu6NzKRRB6K1hB5kVau9Q==
X-CSE-MsgGUID: NV3v5CwBSR+SMgpjvmXLBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="80816483"
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; d="scan'208";a="80816483"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 14:27:59 -0700
X-CSE-ConnectionGUID: XYndMCm/SHKHzYSFpkgJ2w==
X-CSE-MsgGUID: KTHOEC4ARdKanAMxityCLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; d="scan'208";a="246639813"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 14:27:59 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 27 May 2026 14:27:58 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 27 May 2026 14:27:58 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.70) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 27 May 2026 14:27:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s0wVeMAhqaWYKyOfmk0z6P6hXsn1TRQP09O4HDMaWIL8C4Xn8PVckrS7twvuEp+MLcs0TBWNeC+lrDz/DOciXNKKtGLihi/p2FsKBcgZuAULP3yzsoZ4K81BbXH6WZsfsVgFlbFsS+huX3+2Zx/Hz8O4mIKQvkEh7RYGOalWjGJYA+OfR7s929RmfrIxbri4T7fX45jGRqzTlYsInNGT3x/brYvoweTJsZ1UYaDD5Lt6TmKXk45BRqZD21ZDr1oCfw6+0jAPSTckfmmqljS5v78Pys39DzNVFisYUltUoVPLCq1SGfudfXjGKF8S875TlfDteTyMC8/ddb2drldP3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4b1SwhQfvwVpCZ+ps/LsxJmPIDMI+SSCB8x8esKp6IA=;
 b=Q7dcEexfyEajGFXuDFGab2CSDwp26VhK5Jql2Q0uRVz/hFp/z6i2AQrumHiKoNAwjxvcX+rH3Txit3x2w8qKwVx0remo6PjKO6zidYhQGjcmZZbW7T9S+orZuR/JZSJd6sPsRuMc3bLqpaTNOYxXWhC5aWm0jevDWC9rlAW2DCbH/wI3kGDbqGKMI9H1XCWGJw0+EUtogPqFZRHRR0YcJ4754qf3+li9n4JZjOS/TnilZrQVcDz1sIW2PIgEzV3hhl1eR6hAZNgOHg7BDp3rEKkFIXGPV5hvyAArmaRnBBySQNEQMI5PEkJw5k0mbFTHfhtbGJM6fFbGMeFKMgwXEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by SN4PR11MB9965.namprd11.prod.outlook.com (2603:10b6:806:4fe::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Wed, 27 May
 2026 21:27:56 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%5]) with mapi id 15.21.0071.011; Wed, 27 May 2026
 21:27:56 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, Violet Monti
 <violet.monti@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v4 1/4] drm/xe/rtp: Add struct types for RTP tables
In-Reply-To: <20260527211504.GB6214@mdroper-desk1.amr.corp.intel.com>
References: <20260526173056.967215-6-violet.monti@intel.com>
 <20260526173056.967215-7-violet.monti@intel.com>
 <20260527211504.GB6214@mdroper-desk1.amr.corp.intel.com>
Date: Wed, 27 May 2026 18:27:51 -0300
Message-ID: <877booy23s.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0059.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::34) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|SN4PR11MB9965:EE_
X-MS-Office365-Filtering-Correlation-Id: 07a8aa87-a1e1-4206-c0b2-08debc36d136
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|56012099006|4143699003|11063799006|6133799003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: s2Trz5I4p85tsdbTnVxzGQ1Piy80WT5CqweqFCm0QfEPOQZ7aDBz/FhTH4kRhzyZid0eFc0c/nMUK4Qgw9YLMz3ipr5hW2Vq8ca+ebefR3NXG+d5zMob08pBjHciyjNAaMnV+611+B/gdObcsiK/GCKqlJmQjpPFuJppMdBs0VuaImsB7Ql9XpiC4YglUaX0/Yb61bN9XWUDRhN+4TX/jUfR9Y08y2xKD6GlWalkoGk/Gkl0X6GlRYe25D2L0WLlRIZbQwRh0MXYQ0Cie5VFJhFTmen25Trx6cMzvAdwGHX7XtfYRjRVRGrrJ3U5munvt/jaqWP41SCt/XhzSw+tNCNs2DP9l/0R/WmTZroGIYegnNkyMt7gd3w1Ng7nhJMxqMWj0EEBk4vgIXNbplYJeimk+hbfVFuPa8eG51NppKKji68JwEK9wHh79n5kU6Jdj4n9UhRarz9UctrvZtSkIAYJK9Atjewo3UXlxgtY4qJBgkWeSxfgUlBCiw/2bJJtDY37kGkiqnMQfuv3IApbxhnnVXpw8MlhLP/TLNPu9ipuKTCoewXOHZuZCxqp5TvHSOciPShjjM0WFXhJzUUYB628xEDIj2gn2IcxrJg1pK7oNy64WOy6jkx4Cittl6KVp4WQiSs5TCS5CRMnJ1G11kj3fSqqPR5b22/FeRmTEDsyV8RTy5Q+JRKGDyJtO8Ry
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(56012099006)(4143699003)(11063799006)(6133799003)(18002099003)(22082099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bNG4jBUswDXh0XufQN2UevgE4B8B6dO1hCDGzYxjiY5WVbNzTp4JxIxT/p5G?=
 =?us-ascii?Q?06PiOkq42uFMXMm4dEl7W0WSCMscLm/mwLlw5FoBCGlb/dYjVbzvcvGQ1CrW?=
 =?us-ascii?Q?ozKUq1hygBAa4D/pVMNXwAiQkH95H7iiUs+i1UDJKDv98FPwpL0rCJqttyMI?=
 =?us-ascii?Q?n79qYi+fJRluEV3jwjSOC8wGkqVGWWiY27yrsxlUq7GjCeZU/u9DiPP0ia49?=
 =?us-ascii?Q?uGOiiEtm0NDxXkkOALNMw1fT0SEwFt/u8j/20pFK5ij21T0QJVl+sKQBAVRk?=
 =?us-ascii?Q?Sa3LJGiRsKWum1oszAS3aIEF5u5CMGyLpFTUAAzMyiCBlg/UfTwhakri9jY1?=
 =?us-ascii?Q?WjZDXBCCai+tVgXBlwwEl+BaytPRqITKrixNzayTOqT0Bua/X/4L7sgu/cKC?=
 =?us-ascii?Q?QqVScbVJ+UGuDa6nLx09GLVP0sVkV5yTp07c0B+rf85j9w9xqF+oUTj3+0hs?=
 =?us-ascii?Q?vasCw/1/04YkDA6KqqdXxyA+COJI+5Ose1Ov9V6apBfgQ2qMKZNocziuqMNS?=
 =?us-ascii?Q?OfA024gCaM9fdVzmQDx8GLumsMx+2UtPYYxuQ5rNedcu1MC/1vgHtxHv7BcA?=
 =?us-ascii?Q?kNrMaFkM/da6cf0I31mxsYNukQV8y/is30Njs9iHI0koStcFya72uPs0oGHU?=
 =?us-ascii?Q?/qrPYVNAJ3aNkre6epJB92MU5Pt5qP2I0RFArQlG+Gxd2YtVf0bG3GP+cp75?=
 =?us-ascii?Q?2p9NgPgec2HftbeEA+F1yidpbfuylKl7NY1rw6NOWhIS/1PkeEQbs08kRRpR?=
 =?us-ascii?Q?pZNcsa75f2dLV8wa0nPBLxxrUA3I8pxvTsq5hxVPs6bD7DYmqgs2Vt/CQDeD?=
 =?us-ascii?Q?P7ozLl3RGAw0E67fv871XCA8QHUV7hl3JZQccSaYyDGwVqPg3xFAIFXsRHs7?=
 =?us-ascii?Q?KkXcWLbXhzl8tH0/zSOltPlX+sTEZpOOMJWr5de1pvVAA2noW2lnvHz6FsVW?=
 =?us-ascii?Q?3zgxu5v5J82vtFhs9GkgYjNpXKN14iX2+yICSLpIN0MeDEzBjqKZkNT6wvjY?=
 =?us-ascii?Q?WfOfDpRt3X/9Adr7VucfDkjiwCFAT9EeSRtsNxr7Ho7cn6/EdzdCm/CLAE2o?=
 =?us-ascii?Q?LqTLNggpQitRSGPz+gE3zpY2dSzFnXFOyoXOKSYaPG3C7XL6UF3RTaDHk6lB?=
 =?us-ascii?Q?8UB//uUqd5/KglheEEc457nw8cHrIcGOiS53R34l46cjADwxCejcyeE7zCXY?=
 =?us-ascii?Q?vQq3WLGgH9ZVwPqAhzSj23j9JJ9KPhFV9OcNj+I7NaRShfXGOrbRuohpLDfs?=
 =?us-ascii?Q?3ZTisSHgThbemLxip0QCt5C81KpKN6OwKzPuXAYVAe5pCqPYZVud/rQQcsj+?=
 =?us-ascii?Q?0Nsbd5QZX2XTn7g3JWfg5V+lBMAsgiyFSsYTmrsnH/rD1LacpMVzf4Le/6be?=
 =?us-ascii?Q?9OPpRibchelzfDJtcFV8FUm+GLEBuCp7XxnYo2tpUPUQo+0fZ8It0Eyyh+XS?=
 =?us-ascii?Q?eDGRf5Yq5OFAlFARgZkq9Wn6s+cxfl8UcJmsvnxu8WkEvTRU1nzcAumrIc4J?=
 =?us-ascii?Q?e1yw9m7v8ciVpBDs6ZJYFz5HsYPblUJsqp8prrOqd4o7FepELFKH7Ilb1Orw?=
 =?us-ascii?Q?w35QX3u424bwONKAmm+mRaUZGiMjoMu9wV/GAuBo1ZgPt4PndXHJWmhFebVa?=
 =?us-ascii?Q?/qXsQvgGYvHy+VcErz8211YYgJa2KlWC7xd+NZxcGRm1978DFZgPpubAtugS?=
 =?us-ascii?Q?THlTWHuFzzX1gj5yvG4c6kuXONFOOoxaqf0Cx//f/4WD1oD9JaY8GWB9i6pY?=
 =?us-ascii?Q?i3eEdOhbow=3D=3D?=
X-Exchange-RoutingPolicyChecked: pgxM92kXk/25h4WcKEEF2mKuTf3yxKMF3pN4mxe5F3F8b9Q0UcIXRwhmRZ77r0qyKkJJZgCrTobBbnWEDUkeGjF1n6fTPy9ssu02yqZrOvy0tF2k09m8AcxI7HDUqwGUOPTbjJ92WvQqD/7lKLr2v5EswmdjA4MnSGXumYemVtfsLRz3d9qN/Lm29ZXgktpDyY+dIr8C+inprCvPaXSKxDO+T8jDR/tuHhBWVqlcj8lU8EXMIzraZsmtz24lPVxaLy4S6WLXTyp+BJLhpY6QB7jq4FBhl+bULhxuGLDVoi8AL1bO6ieprT+CMK/4dQEeNxuzr0/5yPwfg4US6UIu5w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 07a8aa87-a1e1-4206-c0b2-08debc36d136
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 21:27:56.2817 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: veJtuXGGa08EEJkFmoMTyvarDn+kJ1Q3mkBmw/zmyWoeR5gvuwj9Er2cWOFeDgY0XItO8bRq2e2c7GbiE6a3vQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR11MB9965
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

Matt Roper <matthew.d.roper@intel.com> writes:

> On Tue, May 26, 2026 at 10:30:57AM -0700, Violet Monti wrote:
>> From: Gustavo Sousa <gustavo.sousa@intel.com>
>> 
>> We currently have a mixture of styles for our RTP tables with respect of
>> how we define the number of entries:
>> 
>>   * xe_rtp_process_to_sr() expects to receive the number of entries as
>>     arguments;
>>   * xe_rtp_process() expects the array to have a sentinel at the end of
>>     the array;
>>   * in xe_rtp_test.c, even though xe_rtp_process_to_sr() does not
>>     require a sentinel value, we need to rely on that technique to be
>>     able to count xe_rtp_entry_sr entries because simply using
>>     ARRAY_SIZE() is not possible.
>> 
>> The style used by xe_rtp_process_to_sr() makes it hard to share the
>> tables with other compilation units (e.g. kunit tests), since the number
>> of entries is calculated with ARRAY_SIZE(), which is done at compile
>> time.
>> 
>> Since we use the size of the tables to create some bitmasks, using a
>> sentinel style doesn't seem great either.
>> 
>> A way to reconcile things into a single style is to have a struct type
>> that would hold the entries array and the number of entries.  Since we
>> have xe_rtp_entry and xe_rtp_entry_sr, we would have one type for each.
>> 
>> The advantage of the proposed approach is that now we have a nice way to
>> share the tables directly to kunit tests with information about their
>> size.
>> 
>> v4:
>>     - Removed conflicts with main branch
>> 
>> v3:
>>     - No changes
>> 
>> v2:
>>     - Add compatibility with new xe_rtp_table_sr format for
>>       "bad-mcr-reg-forced-to-regular" and
>>       "bad-regular-reg-forced-to-mcr"
>> 
>> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>> Signed-off-by: Violet Monti <violet.monti@intel.com>
>> ---
>>  drivers/gpu/drm/xe/tests/xe_rtp_test.c | 147 ++++++++++++++-----------
>>  drivers/gpu/drm/xe/xe_hw_engine.c      |  14 +--
>>  drivers/gpu/drm/xe/xe_reg_whitelist.c  |   7 +-
>>  drivers/gpu/drm/xe/xe_rtp.c            |  31 +++---
>>  drivers/gpu/drm/xe/xe_rtp.h            |  16 ++-
>>  drivers/gpu/drm/xe/xe_rtp_types.h      |  10 ++
>>  drivers/gpu/drm/xe/xe_tuning.c         |  45 ++++----
>>  drivers/gpu/drm/xe/xe_wa.c             |  89 ++++++++-------
>>  8 files changed, 196 insertions(+), 163 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.c b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
>> index 642f6e090ad0..4b4dd93cce20 100644
>> --- a/drivers/gpu/drm/xe/tests/xe_rtp_test.c
>> +++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
>> @@ -54,13 +54,13 @@ struct rtp_to_sr_test_case {
>>  	unsigned long expected_count_sr_entries;
>>  	unsigned int expected_sr_errors;
>>  	unsigned long expected_active;
>> -	const struct xe_rtp_entry_sr *entries;
>> +	const struct xe_rtp_table_sr table;
>>  };
>>  
>>  struct rtp_test_case {
>>  	const char *name;
>>  	unsigned long expected_active;
>> -	const struct xe_rtp_entry *entries;
>> +	const struct xe_rtp_table table;
>>  };
>>  
>>  static bool fake_xe_gt_mcr_check_reg(struct xe_gt *gt, struct xe_reg reg)
>> @@ -289,7 +289,7 @@ static const struct rtp_to_sr_test_case rtp_to_sr_cases[] = {
>>  		.expected_active = BIT(0) | BIT(1),
>>  		.expected_count_sr_entries = 1,
>>  		/* Different bits on the same register: create a single entry */
>> -		.entries = (const struct xe_rtp_entry_sr[]) {
>> +		.table = XE_RTP_TABLE_SR(
>>  			{ XE_RTP_NAME("basic-1"),
>>  			  XE_RTP_RULES(FUNC(match_yes)),
>>  			  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(0)))
>> @@ -298,8 +298,7 @@ static const struct rtp_to_sr_test_case rtp_to_sr_cases[] = {
>>  			  XE_RTP_RULES(FUNC(match_yes)),
>>  			  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(1)))
>>  			},
>> -			{}
>> -		},
>> +		),
>>  	},
>>  	{
>>  		.name = "no-match-no-add",
>> @@ -309,7 +308,7 @@ static const struct rtp_to_sr_test_case rtp_to_sr_cases[] = {
>>  		.expected_active = BIT(0),
>>  		.expected_count_sr_entries = 1,
>>  		/* Don't coalesce second entry since rules don't match */
>> -		.entries = (const struct xe_rtp_entry_sr[]) {
>> +		.table = XE_RTP_TABLE_SR(
>>  			{ XE_RTP_NAME("basic-1"),
>>  			  XE_RTP_RULES(FUNC(match_yes)),
>>  			  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(0)))
>> @@ -318,8 +317,7 @@ static const struct rtp_to_sr_test_case rtp_to_sr_cases[] = {
>>  			  XE_RTP_RULES(FUNC(match_no)),
>>  			  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(1)))
>>  			},
>> -			{}
>> -		},
>> +		),
>>  	},
>>  	{
>>  		.name = "two-regs-two-entries",
>> @@ -329,7 +327,7 @@ static const struct rtp_to_sr_test_case rtp_to_sr_cases[] = {
>>  		.expected_active = BIT(0) | BIT(1),
>>  		.expected_count_sr_entries = 2,
>>  		/* Same bits on different registers are not coalesced */
>> -		.entries = (const struct xe_rtp_entry_sr[]) {
>> +		.table = XE_RTP_TABLE_SR(
>>  			{ XE_RTP_NAME("basic-1"),
>>  			  XE_RTP_RULES(FUNC(match_yes)),
>>  			  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(0)))
>> @@ -338,8 +336,7 @@ static const struct rtp_to_sr_test_case rtp_to_sr_cases[] = {
>>  			  XE_RTP_RULES(FUNC(match_yes)),
>>  			  XE_RTP_ACTIONS(SET(REGULAR_REG2, REG_BIT(0)))
>>  			},
>> -			{}
>> -		},
>> +		),
>>  	},
>>  	{
>>  		.name = "clr-one-set-other",
>> @@ -349,7 +346,7 @@ static const struct rtp_to_sr_test_case rtp_to_sr_cases[] = {
>>  		.expected_active = BIT(0) | BIT(1),
>>  		.expected_count_sr_entries = 1,
>>  		/* Check clr vs set actions on different bits */
>> -		.entries = (const struct xe_rtp_entry_sr[]) {
>> +		.table = XE_RTP_TABLE_SR(
>>  			{ XE_RTP_NAME("basic-1"),
>>  			  XE_RTP_RULES(FUNC(match_yes)),
>>  			  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(0)))
>> @@ -358,8 +355,7 @@ static const struct rtp_to_sr_test_case rtp_to_sr_cases[] = {
>>  			  XE_RTP_RULES(FUNC(match_yes)),
>>  			  XE_RTP_ACTIONS(CLR(REGULAR_REG1, REG_BIT(1)))
>>  			},
>> -			{}
>> -		},
>> +		),
>>  	},
>>  	{
>>  #define TEMP_MASK	REG_GENMASK(10, 8)
>> @@ -371,14 +367,13 @@ static const struct rtp_to_sr_test_case rtp_to_sr_cases[] = {
>>  		.expected_active = BIT(0),
>>  		.expected_count_sr_entries = 1,
>>  		/* Check FIELD_SET works */
>> -		.entries = (const struct xe_rtp_entry_sr[]) {
>> +		.table = XE_RTP_TABLE_SR(
>>  			{ XE_RTP_NAME("basic-1"),
>>  			  XE_RTP_RULES(FUNC(match_yes)),
>>  			  XE_RTP_ACTIONS(FIELD_SET(REGULAR_REG1,
>>  						   TEMP_MASK, TEMP_FIELD))
>>  			},
>> -			{}
>> -		},
>> +		),
>>  #undef TEMP_MASK
>>  #undef TEMP_FIELD
>>  	},
>> @@ -390,7 +385,7 @@ static const struct rtp_to_sr_test_case rtp_to_sr_cases[] = {
>>  		.expected_active = BIT(0) | BIT(1),
>>  		.expected_count_sr_entries = 1,
>>  		.expected_sr_errors = 1,
>> -		.entries = (const struct xe_rtp_entry_sr[]) {
>> +		.table = XE_RTP_TABLE_SR(
>>  			{ XE_RTP_NAME("basic-1"),
>>  			  XE_RTP_RULES(FUNC(match_yes)),
>>  			  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(0)))
>> @@ -400,8 +395,7 @@ static const struct rtp_to_sr_test_case rtp_to_sr_cases[] = {
>>  			  XE_RTP_RULES(FUNC(match_yes)),
>>  			  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(0)))
>>  			},
>> -			{}
>> -		},
>> +		),
>>  	},
>>  	{
>>  		.name = "conflict-not-disjoint",
>> @@ -411,7 +405,7 @@ static const struct rtp_to_sr_test_case rtp_to_sr_cases[] = {
>>  		.expected_active = BIT(0) | BIT(1),
>>  		.expected_count_sr_entries = 1,
>>  		.expected_sr_errors = 1,
>> -		.entries = (const struct xe_rtp_entry_sr[]) {
>> +		.table = XE_RTP_TABLE_SR(
>>  			{ XE_RTP_NAME("basic-1"),
>>  			  XE_RTP_RULES(FUNC(match_yes)),
>>  			  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(0)))
>> @@ -421,8 +415,7 @@ static const struct rtp_to_sr_test_case rtp_to_sr_cases[] = {
>>  			  XE_RTP_RULES(FUNC(match_yes)),
>>  			  XE_RTP_ACTIONS(CLR(REGULAR_REG1, REG_GENMASK(1, 0)))
>>  			},
>> -			{}
>> -		},
>> +		),
>>  	},
>>  	{
>>  		.name = "conflict-reg-type",
>> @@ -432,7 +425,7 @@ static const struct rtp_to_sr_test_case rtp_to_sr_cases[] = {
>>  		.expected_active = BIT(0) | BIT(1) | BIT(2),
>>  		.expected_count_sr_entries = 1,
>>  		.expected_sr_errors = 2,
>> -		.entries = (const struct xe_rtp_entry_sr[]) {
>> +		.table = XE_RTP_TABLE_SR(
>>  			{ XE_RTP_NAME("basic-1"),
>>  			  XE_RTP_RULES(FUNC(match_yes)),
>>  			  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(0)))
>> @@ -447,8 +440,7 @@ static const struct rtp_to_sr_test_case rtp_to_sr_cases[] = {
>>  			  XE_RTP_RULES(FUNC(match_yes)),
>>  			  XE_RTP_ACTIONS(SET(MASKED_REG1, REG_BIT(0)))
>>  			},
>> -			{}
>> -		},
>> +		),
>>  	},
>>  	{
>>  		.name = "bad-mcr-reg-forced-to-regular",
>> @@ -458,13 +450,13 @@ static const struct rtp_to_sr_test_case rtp_to_sr_cases[] = {
>>  		.expected_active = BIT(0),
>>  		.expected_count_sr_entries = 1,
>>  		.expected_sr_errors = 1,
>> -		.entries = (const struct xe_rtp_entry_sr[]) {
>> +		.table = XE_RTP_TABLE_SR(
>>  			{ XE_RTP_NAME("bad-mcr-regular-reg"),
>>  			  XE_RTP_RULES(FUNC(match_yes)),
>>  			  XE_RTP_ACTIONS(SET(BAD_MCR_REG4, REG_BIT(0)))
>>  			},
>>  			{}
>> -		},
>> +		),
>>  	},
>>  	{
>>  		.name = "bad-regular-reg-forced-to-mcr",
>> @@ -474,13 +466,13 @@ static const struct rtp_to_sr_test_case rtp_to_sr_cases[] = {
>>  		.expected_active = BIT(0),
>>  		.expected_count_sr_entries = 1,
>>  		.expected_sr_errors = 1,
>> -		.entries = (const struct xe_rtp_entry_sr[]) {
>> +		.table = XE_RTP_TABLE_SR(
>>  			{ XE_RTP_NAME("bad-regular-reg"),
>>  			  XE_RTP_RULES(FUNC(match_yes)),
>>  			  XE_RTP_ACTIONS(SET(BAD_REGULAR_REG5, REG_BIT(0)))
>>  			},
>>  			{}
>> -		},
>> +		),
>>  	},
>>  };
>>  
>> @@ -492,16 +484,12 @@ static void xe_rtp_process_to_sr_tests(struct kunit *test)
>>  	struct xe_reg_sr *reg_sr = &gt->reg_sr;
>>  	const struct xe_reg_sr_entry *sre, *sr_entry = NULL;
>>  	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(gt);
>> -	unsigned long idx, count_sr_entries = 0, count_rtp_entries = 0, active = 0;
>> +	unsigned long idx, count_sr_entries = 0, active = 0;
>>  
>>  	xe_reg_sr_init(reg_sr, "xe_rtp_to_sr_tests", xe);
>>  
>> -	while (param->entries[count_rtp_entries].rules)
>> -		count_rtp_entries++;
>> -
>> -	xe_rtp_process_ctx_enable_active_tracking(&ctx, &active, count_rtp_entries);
>> -	xe_rtp_process_to_sr(&ctx, param->entries, count_rtp_entries,
>> -			     reg_sr, false);
>> +	xe_rtp_process_ctx_enable_active_tracking(&ctx, &active, param->table.n_entries);
>> +	xe_rtp_process_to_sr(&ctx, &param->table, reg_sr, false);
>>  
>>  	xa_for_each(&reg_sr->xa, idx, sre) {
>>  		if (idx == param->expected_reg.addr)
>> @@ -534,83 +522,111 @@ static const struct rtp_test_case rtp_cases[] = {
>>  	{
>>  		.name = "active1",
>>  		.expected_active = BIT(0),
>> -		.entries = (const struct xe_rtp_entry[]) {
>> +		.table = XE_RTP_TABLE(
>>  			{ XE_RTP_NAME("r1"),
>>  			  XE_RTP_RULES(FUNC(match_yes)),
>>  			},
>> -			{}
>> -		},
>> +		),
>>  	},
>>  	{
>>  		.name = "active2",
>>  		.expected_active = BIT(0) | BIT(1),
>> -		.entries = (const struct xe_rtp_entry[]) {
>> +		.table = XE_RTP_TABLE(
>>  			{ XE_RTP_NAME("r1"),
>>  			  XE_RTP_RULES(FUNC(match_yes)),
>>  			},
>>  			{ XE_RTP_NAME("r2"),
>>  			  XE_RTP_RULES(FUNC(match_yes)),
>>  			},
>> -			{}
>> -		},
>> +		),
>>  	},
>>  	{
>>  		.name = "active-inactive",
>>  		.expected_active = BIT(0),
>> -		.entries = (const struct xe_rtp_entry[]) {
>> +		.table = XE_RTP_TABLE(
>>  			{ XE_RTP_NAME("r1"),
>>  			  XE_RTP_RULES(FUNC(match_yes)),
>>  			},
>>  			{ XE_RTP_NAME("r2"),
>>  			  XE_RTP_RULES(FUNC(match_no)),
>>  			},
>> -			{}
>> -		},
>> +		),
>>  	},
>>  	{
>>  		.name = "inactive-active",
>>  		.expected_active = BIT(1),
>> -		.entries = (const struct xe_rtp_entry[]) {
>> +		.table = XE_RTP_TABLE(
>>  			{ XE_RTP_NAME("r1"),
>>  			  XE_RTP_RULES(FUNC(match_no)),
>>  			},
>>  			{ XE_RTP_NAME("r2"),
>>  			  XE_RTP_RULES(FUNC(match_yes)),
>>  			},
>> -			{}
>> -		},
>> +		),
>>  	},
>>  	{
>> -		.name = "inactive-active-inactive",
>> +		.name = "inactive-1st_or_active-inactive",
>
> The updates to this test (and the others below) seem distinct from the
> mechanical change of xe_rtp_entry[] => XE_RTP_TABLE() that the rest of
> the patch is doing.  Were some of these changes intended for a separate
> patch?

That was possibly a conflict resolution issue?

--
Gustavo Sousa

>
> Aside from that, the rest of the changes in this patch look good.
> checkpatch isn't terribly happy about lines ending with "XE_RTP_TABLE("
> but I don't see a way to avoid that while still making the tables
> visually clean for human readers, so we can probably ignore those
> warnings.
>
>
> Matt
>
>>  		.expected_active = BIT(1),
>> -		.entries = (const struct xe_rtp_entry[]) {
>> +		.table = XE_RTP_TABLE(
>>  			{ XE_RTP_NAME("r1"),
>>  			  XE_RTP_RULES(FUNC(match_no)),
>>  			},
>> -			{ XE_RTP_NAME("r2"),
>> -			  XE_RTP_RULES(FUNC(match_yes)),
>> +			{ XE_RTP_NAME("r2_or_conditions"),
>> +			  XE_RTP_RULES(FUNC(match_yes), OR,
>> +				       FUNC(match_no), OR,
>> +				       FUNC(match_no)) },
>> +			{ XE_RTP_NAME("r3"),
>> +			  XE_RTP_RULES(FUNC(match_no)),
>> +			},
>> +		),
>> +	},
>> +	{
>> +		.name = "inactive-2nd_or_active-inactive",
>> +		.expected_active = BIT(1),
>> +		.table = XE_RTP_TABLE(
>> +			{ XE_RTP_NAME("r1"),
>> +			  XE_RTP_RULES(FUNC(match_no)),
>>  			},
>> +			{ XE_RTP_NAME("r2_or_conditions"),
>> +			  XE_RTP_RULES(FUNC(match_no), OR,
>> +				       FUNC(match_yes), OR,
>> +				       FUNC(match_no)) },
>>  			{ XE_RTP_NAME("r3"),
>>  			  XE_RTP_RULES(FUNC(match_no)),
>>  			},
>> -			{}
>> -		},
>> +		),
>>  	},
>>  	{
>> -		.name = "inactive-inactive-inactive",
>> -		.expected_active = 0,
>> -		.entries = (const struct xe_rtp_entry[]) {
>> +		.name = "inactive-last_or_active-inactive",
>> +		.expected_active = BIT(1),
>> +		.table = XE_RTP_TABLE(
>>  			{ XE_RTP_NAME("r1"),
>>  			  XE_RTP_RULES(FUNC(match_no)),
>>  			},
>> -			{ XE_RTP_NAME("r2"),
>> +			{ XE_RTP_NAME("r2_or_conditions"),
>> +			  XE_RTP_RULES(FUNC(match_no), OR,
>> +				       FUNC(match_no), OR,
>> +				       FUNC(match_yes)) },
>> +			{ XE_RTP_NAME("r3"),
>>  			  XE_RTP_RULES(FUNC(match_no)),
>>  			},
>> +		),
>> +	},
>> +	{
>> +		.name = "inactive-no_or_active-inactive",
>> +		.expected_active = 0,
>> +		.table = XE_RTP_TABLE(
>> +			{ XE_RTP_NAME("r1"),
>> +			  XE_RTP_RULES(FUNC(match_no)),
>> +			},
>> +			{ XE_RTP_NAME("r2_or_conditions"),
>> +			  XE_RTP_RULES(FUNC(match_no), OR,
>> +				       FUNC(match_no), OR,
>> +				       FUNC(match_no)) },
>>  			{ XE_RTP_NAME("r3"),
>>  			  XE_RTP_RULES(FUNC(match_no)),
>>  			},
>> -			{}
>> -		},
>> +		),
>>  	},
>>  };
>>  
>> @@ -620,13 +636,10 @@ static void xe_rtp_process_tests(struct kunit *test)
>>  	struct xe_device *xe = test->priv;
>>  	struct xe_gt *gt = xe_device_get_root_tile(xe)->primary_gt;
>>  	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(gt);
>> -	unsigned long count_rtp_entries = 0, active = 0;
>> -
>> -	while (param->entries[count_rtp_entries].rules)
>> -		count_rtp_entries++;
>> +	unsigned long active = 0;
>>  
>> -	xe_rtp_process_ctx_enable_active_tracking(&ctx, &active, count_rtp_entries);
>> -	xe_rtp_process(&ctx, param->entries);
>> +	xe_rtp_process_ctx_enable_active_tracking(&ctx, &active, param->table.n_entries);
>> +	xe_rtp_process(&ctx, &param->table);
>>  
>>  	KUNIT_EXPECT_EQ(test, active, param->expected_active);
>>  }
>> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
>> index 8c66ff6f3d3c..98265293f2dc 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
>> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>> @@ -346,7 +346,7 @@ hw_engine_setup_default_lrc_state(struct xe_hw_engine *hwe)
>>  	u32 blit_cctl_val = REG_FIELD_PREP(BLIT_CCTL_DST_MOCS_MASK, mocs_write_idx) |
>>  			    REG_FIELD_PREP(BLIT_CCTL_SRC_MOCS_MASK, mocs_read_idx);
>>  	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(hwe);
>> -	const struct xe_rtp_entry_sr lrc_setup[] = {
>> +	const struct xe_rtp_table_sr lrc_setup = XE_RTP_TABLE_SR(
>>  		/*
>>  		 * Some blitter commands do not have a field for MOCS, those
>>  		 * commands will use MOCS index pointed by BLIT_CCTL.
>> @@ -369,10 +369,9 @@ hw_engine_setup_default_lrc_state(struct xe_hw_engine *hwe)
>>  					   PREEMPT_GPGPU_THREAD_GROUP_LEVEL)),
>>  		  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE)
>>  		},
>> -	};
>> +	);
>>  
>> -	xe_rtp_process_to_sr(&ctx, lrc_setup, ARRAY_SIZE(lrc_setup),
>> -			     &hwe->reg_lrc, true);
>> +	xe_rtp_process_to_sr(&ctx, &lrc_setup, &hwe->reg_lrc, true);
>>  }
>>  
>>  void xe_hw_engine_setup_reg_lrc(struct xe_hw_engine *hwe)
>> @@ -408,7 +407,7 @@ hw_engine_setup_default_state(struct xe_hw_engine *hwe)
>>  	u32 ring_cmd_cctl_val = REG_FIELD_PREP(CMD_CCTL_WRITE_OVERRIDE_MASK, mocs_write_idx) |
>>  				REG_FIELD_PREP(CMD_CCTL_READ_OVERRIDE_MASK, mocs_read_idx);
>>  	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(hwe);
>> -	const struct xe_rtp_entry_sr engine_entries[] = {
>> +	const struct xe_rtp_table_sr engine_sr = XE_RTP_TABLE_SR(
>>  		{ XE_RTP_NAME("RING_CMD_CCTL_default_MOCS"),
>>  		  XE_RTP_RULES(FUNC(xe_rtp_match_always)),
>>  		  XE_RTP_ACTIONS(FIELD_SET(RING_CMD_CCTL(0),
>> @@ -465,10 +464,9 @@ hw_engine_setup_default_state(struct xe_hw_engine *hwe)
>>  		  XE_RTP_ACTIONS(SET(GFX_MODE(0), GFX_MSIX_INTERRUPT_ENABLE,
>>  				     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
>>  		},
>> -	};
>> +	);
>>  
>> -	xe_rtp_process_to_sr(&ctx, engine_entries, ARRAY_SIZE(engine_entries),
>> -			     &hwe->reg_sr, false);
>> +	xe_rtp_process_to_sr(&ctx, &engine_sr, &hwe->reg_sr, false);
>>  }
>>  
>>  static const struct engine_info *find_engine_info(enum xe_engine_class class, int instance)
>> diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
>> index fb65940848d7..2e84b1c49f37 100644
>> --- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
>> +++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
>> @@ -41,7 +41,7 @@ static bool match_multi_queue_class(const struct xe_device *xe,
>>  	return xe_gt_supports_multi_queue(gt, hwe->class);
>>  }
>>  
>> -static const struct xe_rtp_entry_sr register_whitelist[] = {
>> +static const struct xe_rtp_table_sr register_whitelist = XE_RTP_TABLE_SR(
>>  	{ XE_RTP_NAME("WaAllowPMDepthAndInvocationCountAccessFromUMD, 1408556865"),
>>  	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210), ENGINE_CLASS(RENDER)),
>>  	  XE_RTP_ACTIONS(WHITELIST(PS_INVOCATION_COUNT,
>> @@ -154,7 +154,7 @@ static const struct xe_rtp_entry_sr register_whitelist[] = {
>>  	  XE_RTP_RULES(FUNC(match_has_mert), ENGINE_CLASS(COPY)),
>>  	  XE_RTP_ACTIONS(WHITELIST_OA_MERT_MMIO_TRG)
>>  	},
>> -};
>> +);
>>  
>>  static void whitelist_apply_to_hwe(struct xe_hw_engine *hwe)
>>  {
>> @@ -202,8 +202,7 @@ void xe_reg_whitelist_process_engine(struct xe_hw_engine *hwe)
>>  {
>>  	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(hwe);
>>  
>> -	xe_rtp_process_to_sr(&ctx, register_whitelist, ARRAY_SIZE(register_whitelist),
>> -			     &hwe->reg_whitelist, false);
>> +	xe_rtp_process_to_sr(&ctx, &register_whitelist, &hwe->reg_whitelist, false);
>>  	whitelist_apply_to_hwe(hwe);
>>  }
>>  
>> diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
>> index dec9d94e6fb0..83a40e1f9528 100644
>> --- a/drivers/gpu/drm/xe/xe_rtp.c
>> +++ b/drivers/gpu/drm/xe/xe_rtp.c
>> @@ -326,8 +326,7 @@ static void rtp_mark_active(struct xe_device *xe,
>>   * xe_rtp_process_to_sr - Process all rtp @entries, adding the matching ones to
>>   *                        the save-restore argument.
>>   * @ctx: The context for processing the table, with one of device, gt or hwe
>> - * @entries: Table with RTP definitions
>> - * @n_entries: Number of entries to process, usually ARRAY_SIZE(entries)
>> + * @table: Table with RTP definitions
>>   * @sr: Save-restore struct where matching rules execute the action. This can be
>>   *      viewed as the "coalesced view" of multiple the tables. The bits for each
>>   *      register set are expected not to collide with previously added entries
>> @@ -339,12 +338,10 @@ static void rtp_mark_active(struct xe_device *xe,
>>   * used to calculate the right register offset
>>   */
>>  void xe_rtp_process_to_sr(struct xe_rtp_process_ctx *ctx,
>> -			  const struct xe_rtp_entry_sr *entries,
>> -			  size_t n_entries,
>> +			  const struct xe_rtp_table_sr *table,
>>  			  struct xe_reg_sr *sr,
>>  			  bool process_in_vf)
>>  {
>> -	const struct xe_rtp_entry_sr *entry;
>>  	struct xe_hw_engine *hwe = NULL;
>>  	struct xe_gt *gt = NULL;
>>  	struct xe_device *xe = NULL;
>> @@ -354,9 +351,10 @@ void xe_rtp_process_to_sr(struct xe_rtp_process_ctx *ctx,
>>  	if (!process_in_vf && IS_SRIOV_VF(xe))
>>  		return;
>>  
>> -	xe_assert(xe, entries);
>> +	xe_assert(xe, table->entries);
>>  
>> -	for (entry = entries; entry - entries < n_entries; entry++) {
>> +	for (size_t i = 0; i < table->n_entries; i++) {
>> +		const struct xe_rtp_entry_sr *entry = &table->entries[i];
>>  		bool match = false;
>>  
>>  		if (entry->flags & XE_RTP_ENTRY_FLAG_FOREACH_ENGINE) {
>> @@ -371,37 +369,40 @@ void xe_rtp_process_to_sr(struct xe_rtp_process_ctx *ctx,
>>  		}
>>  
>>  		if (match)
>> -			rtp_mark_active(xe, ctx, entry - entries);
>> +			rtp_mark_active(xe, ctx, i);
>>  	}
>>  }
>>  EXPORT_SYMBOL_IF_KUNIT(xe_rtp_process_to_sr);
>>  
>>  /**
>> - * xe_rtp_process - Process all rtp @entries, without running any action
>> + * xe_rtp_process - Process all entries in rtp @table, without running any action
>>   * @ctx: The context for processing the table, with one of device, gt or hwe
>> - * @entries: Table with RTP definitions
>> + * @table: Table with RTP definitions
>>   *
>> - * Walk the table pointed by @entries (with an empty sentinel), executing the
>> + * Walk the table pointed by @table, executing the
>>   * rules. One difference from xe_rtp_process_to_sr(): there is no action
>>   * associated with each entry since this uses struct xe_rtp_entry. Its main use
>>   * is for marking active workarounds via
>>   * xe_rtp_process_ctx_enable_active_tracking().
>>   */
>>  void xe_rtp_process(struct xe_rtp_process_ctx *ctx,
>> -		    const struct xe_rtp_entry *entries)
>> +		    const struct xe_rtp_table *table)
>>  {
>> -	const struct xe_rtp_entry *entry;
>>  	struct xe_hw_engine *hwe;
>>  	struct xe_gt *gt;
>>  	struct xe_device *xe;
>>  
>>  	rtp_get_context(ctx, &hwe, &gt, &xe);
>>  
>> -	for (entry = entries; entry && entry->rules; entry++) {
>> +	xe_assert(xe, table->entries);
>> +
>> +	for (size_t i = 0; i < table->n_entries; i++) {
>> +		const struct xe_rtp_entry *entry = &table->entries[i];
>> +
>>  		if (!rule_matches(xe, gt, hwe, entry->rules, entry->n_rules))
>>  			continue;
>>  
>> -		rtp_mark_active(xe, ctx, entry - entries);
>> +		rtp_mark_active(xe, ctx, i);
>>  	}
>>  }
>>  EXPORT_SYMBOL_IF_KUNIT(xe_rtp_process);
>> diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
>> index e4f1930ca1c3..4e3cfd69f922 100644
>> --- a/drivers/gpu/drm/xe/xe_rtp.h
>> +++ b/drivers/gpu/drm/xe/xe_rtp.h
>> @@ -461,6 +461,16 @@ struct xe_reg_sr;
>>  		XE_RTP_PASTE_FOREACH(ACTION_, COMMA, (__VA_ARGS__))	\
>>  	}
>>  
>> +#define XE_RTP_TABLE_SR(...) { \
>> +	.entries = (const struct xe_rtp_entry_sr[]){__VA_ARGS__}, \
>> +	.n_entries = ARRAY_SIZE(((const struct xe_rtp_entry_sr[]){__VA_ARGS__})), \
>> +}
>> +
>> +#define XE_RTP_TABLE(...) { \
>> +	.entries = (const struct xe_rtp_entry[]){__VA_ARGS__}, \
>> +	.n_entries = ARRAY_SIZE(((const struct xe_rtp_entry[]){__VA_ARGS__})), \
>> +}
>> +
>>  #define XE_RTP_PROCESS_CTX_INITIALIZER(arg__) _Generic((arg__),							\
>>  	struct xe_hw_engine * :	(struct xe_rtp_process_ctx){ { (void *)(arg__) }, XE_RTP_PROCESS_TYPE_ENGINE },	\
>>  	struct xe_gt * :	(struct xe_rtp_process_ctx){ { (void *)(arg__) }, XE_RTP_PROCESS_TYPE_GT },	\
>> @@ -471,12 +481,12 @@ void xe_rtp_process_ctx_enable_active_tracking(struct xe_rtp_process_ctx *ctx,
>>  					       size_t n_entries);
>>  
>>  void xe_rtp_process_to_sr(struct xe_rtp_process_ctx *ctx,
>> -			  const struct xe_rtp_entry_sr *entries,
>> -			  size_t n_entries, struct xe_reg_sr *sr,
>> +			  const struct xe_rtp_table_sr *table,
>> +			  struct xe_reg_sr *sr,
>>  			  bool process_in_vf);
>>  
>>  void xe_rtp_process(struct xe_rtp_process_ctx *ctx,
>> -		    const struct xe_rtp_entry *entries);
>> +		    const struct xe_rtp_table *table);
>>  
>>  /* Match functions to be used with XE_RTP_MATCH_FUNC */
>>  
>> diff --git a/drivers/gpu/drm/xe/xe_rtp_types.h b/drivers/gpu/drm/xe/xe_rtp_types.h
>> index 0265c16d2762..58018ae4f8cc 100644
>> --- a/drivers/gpu/drm/xe/xe_rtp_types.h
>> +++ b/drivers/gpu/drm/xe/xe_rtp_types.h
>> @@ -112,6 +112,16 @@ struct xe_rtp_entry {
>>  	u8 n_rules;
>>  };
>>  
>> +struct xe_rtp_table_sr {
>> +	const struct xe_rtp_entry_sr *entries;
>> +	size_t n_entries;
>> +};
>> +
>> +struct xe_rtp_table {
>> +	const struct xe_rtp_entry *entries;
>> +	size_t n_entries;
>> +};
>> +
>>  enum xe_rtp_process_type {
>>  	XE_RTP_PROCESS_TYPE_DEVICE,
>>  	XE_RTP_PROCESS_TYPE_GT,
>> diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
>> index 9a1b3862e192..bf3fad9cdbef 100644
>> --- a/drivers/gpu/drm/xe/xe_tuning.c
>> +++ b/drivers/gpu/drm/xe/xe_tuning.c
>> @@ -20,7 +20,7 @@
>>  #undef XE_REG_MCR
>>  #define XE_REG_MCR(...)     XE_REG(__VA_ARGS__, .mcr = 1)
>>  
>> -static const struct xe_rtp_entry_sr gt_tunings[] = {
>> +static const struct xe_rtp_table_sr gt_tunings = XE_RTP_TABLE_SR(
>>  	{ XE_RTP_NAME("Tuning: Blend Fill Caching Optimization Disable"),
>>  	  XE_RTP_RULES(PLATFORM(DG2)),
>>  	  XE_RTP_ACTIONS(SET(XEHP_L3SCQREG7, BLEND_FILL_CACHING_OPT_DIS))
>> @@ -100,9 +100,9 @@ static const struct xe_rtp_entry_sr gt_tunings[] = {
>>  	  XE_RTP_ACTIONS(FIELD_SET(GAMSTLB_CTRL, BANK_HASH_MODE,
>>  				   BANK_HASH_4KB_MODE))
>>  	},
>> -};
>> +);
>>  
>> -static const struct xe_rtp_entry_sr engine_tunings[] = {
>> +static const struct xe_rtp_table_sr engine_tunings = XE_RTP_TABLE_SR(
>>  	{ XE_RTP_NAME("Tuning: L3 Hashing Mask"),
>>  	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210),
>>  		       FUNC(xe_rtp_match_first_render_or_compute)),
>> @@ -129,9 +129,9 @@ static const struct xe_rtp_entry_sr engine_tunings[] = {
>>  		       FUNC(xe_rtp_match_first_render_or_compute)),
>>  	  XE_RTP_ACTIONS(SET(TDL_TSL_CHICKEN2, TILEY_LOCALID))
>>  	},
>> -};
>> +);
>>  
>> -static const struct xe_rtp_entry_sr lrc_tunings[] = {
>> +static const struct xe_rtp_table_sr lrc_tunings = XE_RTP_TABLE_SR(
>>  	{ XE_RTP_NAME("Tuning: Windower HW Filtering"),
>>  	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3599), ENGINE_CLASS(RENDER)),
>>  	  XE_RTP_ACTIONS(SET(XEHP_COMMON_SLICE_CHICKEN4, HW_FILTERING))
>> @@ -171,7 +171,7 @@ static const struct xe_rtp_entry_sr lrc_tunings[] = {
>>  	  XE_RTP_ACTIONS(FIELD_SET(FF_MODE, VS_HIT_MAX_VALUE_MASK,
>>  				   REG_FIELD_PREP(VS_HIT_MAX_VALUE_MASK, 0x3f)))
>>  	},
>> -};
>> +);
>>  
>>  /**
>>   * xe_tuning_init - initialize gt with tunings bookkeeping
>> @@ -185,9 +185,9 @@ int xe_tuning_init(struct xe_gt *gt)
>>  	size_t n_lrc, n_engine, n_gt, total;
>>  	unsigned long *p;
>>  
>> -	n_gt = BITS_TO_LONGS(ARRAY_SIZE(gt_tunings));
>> -	n_engine = BITS_TO_LONGS(ARRAY_SIZE(engine_tunings));
>> -	n_lrc = BITS_TO_LONGS(ARRAY_SIZE(lrc_tunings));
>> +	n_gt = BITS_TO_LONGS(gt_tunings.n_entries);
>> +	n_engine = BITS_TO_LONGS(engine_tunings.n_entries);
>> +	n_lrc = BITS_TO_LONGS(lrc_tunings.n_entries);
>>  	total = n_gt + n_engine + n_lrc;
>>  
>>  	p = drmm_kzalloc(&xe->drm, sizeof(*p) * total, GFP_KERNEL);
>> @@ -210,9 +210,8 @@ void xe_tuning_process_gt(struct xe_gt *gt)
>>  
>>  	xe_rtp_process_ctx_enable_active_tracking(&ctx,
>>  						  gt->tuning_active.gt,
>> -						  ARRAY_SIZE(gt_tunings));
>> -	xe_rtp_process_to_sr(&ctx, gt_tunings, ARRAY_SIZE(gt_tunings),
>> -			     &gt->reg_sr, false);
>> +						  gt_tunings.n_entries);
>> +	xe_rtp_process_to_sr(&ctx, &gt_tunings, &gt->reg_sr, false);
>>  }
>>  EXPORT_SYMBOL_IF_KUNIT(xe_tuning_process_gt);
>>  
>> @@ -222,9 +221,8 @@ void xe_tuning_process_engine(struct xe_hw_engine *hwe)
>>  
>>  	xe_rtp_process_ctx_enable_active_tracking(&ctx,
>>  						  hwe->gt->tuning_active.engine,
>> -						  ARRAY_SIZE(engine_tunings));
>> -	xe_rtp_process_to_sr(&ctx, engine_tunings, ARRAY_SIZE(engine_tunings),
>> -			     &hwe->reg_sr, false);
>> +						  engine_tunings.n_entries);
>> +	xe_rtp_process_to_sr(&ctx, &engine_tunings, &hwe->reg_sr, false);
>>  }
>>  EXPORT_SYMBOL_IF_KUNIT(xe_tuning_process_engine);
>>  
>> @@ -242,9 +240,8 @@ void xe_tuning_process_lrc(struct xe_hw_engine *hwe)
>>  
>>  	xe_rtp_process_ctx_enable_active_tracking(&ctx,
>>  						  hwe->gt->tuning_active.lrc,
>> -						  ARRAY_SIZE(lrc_tunings));
>> -	xe_rtp_process_to_sr(&ctx, lrc_tunings, ARRAY_SIZE(lrc_tunings),
>> -			     &hwe->reg_lrc, true);
>> +						  lrc_tunings.n_entries);
>> +	xe_rtp_process_to_sr(&ctx, &lrc_tunings, &hwe->reg_lrc, true);
>>  }
>>  
>>  /**
>> @@ -259,18 +256,18 @@ int xe_tuning_dump(struct xe_gt *gt, struct drm_printer *p)
>>  	size_t idx;
>>  
>>  	drm_printf(p, "GT Tunings\n");
>> -	for_each_set_bit(idx, gt->tuning_active.gt, ARRAY_SIZE(gt_tunings))
>> -		drm_printf_indent(p, 1, "%s\n", gt_tunings[idx].name);
>> +	for_each_set_bit(idx, gt->tuning_active.gt, gt_tunings.n_entries)
>> +		drm_printf_indent(p, 1, "%s\n", gt_tunings.entries[idx].name);
>>  
>>  	drm_puts(p, "\n");
>>  	drm_printf(p, "Engine Tunings\n");
>> -	for_each_set_bit(idx, gt->tuning_active.engine, ARRAY_SIZE(engine_tunings))
>> -		drm_printf_indent(p, 1, "%s\n", engine_tunings[idx].name);
>> +	for_each_set_bit(idx, gt->tuning_active.engine, engine_tunings.n_entries)
>> +		drm_printf_indent(p, 1, "%s\n", engine_tunings.entries[idx].name);
>>  
>>  	drm_puts(p, "\n");
>>  	drm_printf(p, "LRC Tunings\n");
>> -	for_each_set_bit(idx, gt->tuning_active.lrc, ARRAY_SIZE(lrc_tunings))
>> -		drm_printf_indent(p, 1, "%s\n", lrc_tunings[idx].name);
>> +	for_each_set_bit(idx, gt->tuning_active.lrc, lrc_tunings.n_entries)
>> +		drm_printf_indent(p, 1, "%s\n", lrc_tunings.entries[idx].name);
>>  
>>  	return 0;
>>  }
>> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
>> index cb811f8a7781..b9d9fe0801aa 100644
>> --- a/drivers/gpu/drm/xe/xe_wa.c
>> +++ b/drivers/gpu/drm/xe/xe_wa.c
>> @@ -130,7 +130,7 @@
>>  __diag_push();
>>  __diag_ignore_all("-Woverride-init", "Allow field overrides in table");
>>  
>> -static const struct xe_rtp_entry_sr gt_was[] = {
>> +static const struct xe_rtp_table_sr gt_was = XE_RTP_TABLE_SR(
>>  	/* Workarounds applying over a range of IPs */
>>  
>>  	{ XE_RTP_NAME("14011060649"),
>> @@ -306,9 +306,9 @@ static const struct xe_rtp_entry_sr gt_was[] = {
>>  	  XE_RTP_RULES(GRAPHICS_VERSION(3510), GRAPHICS_STEP(A0, B0)),
>>  	  XE_RTP_ACTIONS(SET(GUC_INTR_CHICKEN, DISABLE_SIGNALING_ENGINES))
>>  	},
>> -};
>> +);
>>  
>> -static const struct xe_rtp_entry_sr engine_was[] = {
>> +static const struct xe_rtp_table_sr engine_was = XE_RTP_TABLE_SR(
>>  	/* Workarounds applying over a range of IPs */
>>  
>>  	{ XE_RTP_NAME("22010931296, 18011464164, 14010919138"),
>> @@ -614,9 +614,9 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>>  		       FUNC(xe_rtp_match_first_render_or_compute)),
>>  	  XE_RTP_ACTIONS(SET(TDL_CHICKEN, BIT_APQ_OPT_DIS))
>>  	},
>> -};
>> +);
>>  
>> -static const struct xe_rtp_entry_sr lrc_was[] = {
>> +static const struct xe_rtp_table_sr lrc_was = XE_RTP_TABLE_SR(
>>  	{ XE_RTP_NAME("16011163337"),
>>  	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210), ENGINE_CLASS(RENDER)),
>>  	  /* read verification is ignored due to 1608008084. */
>> @@ -794,21 +794,29 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
>>  		       ENGINE_CLASS(RENDER)),
>>  	  XE_RTP_ACTIONS(SET(CHICKEN_RASTER_1, DIS_CLIP_NEGATIVE_BOUNDING_BOX))
>>  	},
>> -};
>> +);
>>  
>> -static __maybe_unused const struct xe_rtp_entry oob_was[] = {
>> +static const struct xe_rtp_entry oob_was_entries[] = {
>>  #include <generated/xe_wa_oob.c>
>> -	{}
>>  };
>>  
>> -static_assert(ARRAY_SIZE(oob_was) - 1 == _XE_WA_OOB_COUNT);
>> +static_assert(ARRAY_SIZE(oob_was_entries)  == _XE_WA_OOB_COUNT);
>>  
>> -static __maybe_unused const struct xe_rtp_entry device_oob_was[] = {
>> +static __maybe_unused const struct xe_rtp_table oob_was = {
>> +	.entries = oob_was_entries,
>> +	.n_entries = ARRAY_SIZE(oob_was_entries),
>> +};
>> +
>> +static const struct xe_rtp_entry device_oob_was_entries[] = {
>>  #include <generated/xe_device_wa_oob.c>
>> -	{}
>>  };
>>  
>> -static_assert(ARRAY_SIZE(device_oob_was) - 1 == _XE_DEVICE_WA_OOB_COUNT);
>> +static_assert(ARRAY_SIZE(device_oob_was_entries) == _XE_DEVICE_WA_OOB_COUNT);
>> +
>> +static __maybe_unused const struct xe_rtp_table device_oob_was = {
>> +	.entries = device_oob_was_entries,
>> +	.n_entries = ARRAY_SIZE(device_oob_was_entries),
>> +};
>>  
>>  __diag_pop();
>>  
>> @@ -824,10 +832,10 @@ void xe_wa_process_device_oob(struct xe_device *xe)
>>  {
>>  	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(xe);
>>  
>> -	xe_rtp_process_ctx_enable_active_tracking(&ctx, xe->wa_active.oob, ARRAY_SIZE(device_oob_was));
>> +	xe_rtp_process_ctx_enable_active_tracking(&ctx, xe->wa_active.oob, device_oob_was.n_entries);
>>  
>>  	xe->wa_active.oob_initialized = true;
>> -	xe_rtp_process(&ctx, device_oob_was);
>> +	xe_rtp_process(&ctx, &device_oob_was);
>>  }
>>  
>>  /**
>> @@ -842,9 +850,9 @@ void xe_wa_process_gt_oob(struct xe_gt *gt)
>>  	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(gt);
>>  
>>  	xe_rtp_process_ctx_enable_active_tracking(&ctx, gt->wa_active.oob,
>> -						  ARRAY_SIZE(oob_was));
>> +						  oob_was.n_entries);
>>  	gt->wa_active.oob_initialized = true;
>> -	xe_rtp_process(&ctx, oob_was);
>> +	xe_rtp_process(&ctx, &oob_was);
>>  }
>>  
>>  /**
>> @@ -859,9 +867,8 @@ void xe_wa_process_gt(struct xe_gt *gt)
>>  	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(gt);
>>  
>>  	xe_rtp_process_ctx_enable_active_tracking(&ctx, gt->wa_active.gt,
>> -						  ARRAY_SIZE(gt_was));
>> -	xe_rtp_process_to_sr(&ctx, gt_was, ARRAY_SIZE(gt_was),
>> -			     &gt->reg_sr, false);
>> +						  gt_was.n_entries);
>> +	xe_rtp_process_to_sr(&ctx, &gt_was, &gt->reg_sr, false);
>>  }
>>  EXPORT_SYMBOL_IF_KUNIT(xe_wa_process_gt);
>>  
>> @@ -878,9 +885,8 @@ void xe_wa_process_engine(struct xe_hw_engine *hwe)
>>  	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(hwe);
>>  
>>  	xe_rtp_process_ctx_enable_active_tracking(&ctx, hwe->gt->wa_active.engine,
>> -						  ARRAY_SIZE(engine_was));
>> -	xe_rtp_process_to_sr(&ctx, engine_was, ARRAY_SIZE(engine_was),
>> -			     &hwe->reg_sr, false);
>> +						  engine_was.n_entries);
>> +	xe_rtp_process_to_sr(&ctx, &engine_was, &hwe->reg_sr, false);
>>  }
>>  
>>  /**
>> @@ -896,9 +902,8 @@ void xe_wa_process_lrc(struct xe_hw_engine *hwe)
>>  	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(hwe);
>>  
>>  	xe_rtp_process_ctx_enable_active_tracking(&ctx, hwe->gt->wa_active.lrc,
>> -						  ARRAY_SIZE(lrc_was));
>> -	xe_rtp_process_to_sr(&ctx, lrc_was, ARRAY_SIZE(lrc_was),
>> -			     &hwe->reg_lrc, true);
>> +						  lrc_was.n_entries);
>> +	xe_rtp_process_to_sr(&ctx, &lrc_was, &hwe->reg_lrc, true);
>>  }
>>  
>>  /**
>> @@ -912,7 +917,7 @@ int xe_wa_device_init(struct xe_device *xe)
>>  	unsigned long *p;
>>  
>>  	p = drmm_kzalloc(&xe->drm,
>> -			 sizeof(*p) * BITS_TO_LONGS(ARRAY_SIZE(device_oob_was)),
>> +			 sizeof(*p) * BITS_TO_LONGS(device_oob_was.n_entries),
>>  			 GFP_KERNEL);
>>  
>>  	if (!p)
>> @@ -935,10 +940,10 @@ int xe_wa_gt_init(struct xe_gt *gt)
>>  	size_t n_oob, n_lrc, n_engine, n_gt, total;
>>  	unsigned long *p;
>>  
>> -	n_gt = BITS_TO_LONGS(ARRAY_SIZE(gt_was));
>> -	n_engine = BITS_TO_LONGS(ARRAY_SIZE(engine_was));
>> -	n_lrc = BITS_TO_LONGS(ARRAY_SIZE(lrc_was));
>> -	n_oob = BITS_TO_LONGS(ARRAY_SIZE(oob_was));
>> +	n_gt = BITS_TO_LONGS(gt_was.n_entries);
>> +	n_engine = BITS_TO_LONGS(engine_was.n_entries);
>> +	n_lrc = BITS_TO_LONGS(lrc_was.n_entries);
>> +	n_oob = BITS_TO_LONGS(oob_was.n_entries);
>>  	total = n_gt + n_engine + n_lrc + n_oob;
>>  
>>  	p = drmm_kzalloc(&xe->drm, sizeof(*p) * total, GFP_KERNEL);
>> @@ -962,9 +967,9 @@ void xe_wa_device_dump(struct xe_device *xe, struct drm_printer *p)
>>  	size_t idx;
>>  
>>  	drm_printf(p, "Device OOB Workarounds\n");
>> -	for_each_set_bit(idx, xe->wa_active.oob, ARRAY_SIZE(device_oob_was))
>> -		if (device_oob_was[idx].name)
>> -			drm_printf_indent(p, 1, "%s\n", device_oob_was[idx].name);
>> +	for_each_set_bit(idx, xe->wa_active.oob, device_oob_was.n_entries)
>> +		if (device_oob_was.entries[idx].name)
>> +			drm_printf_indent(p, 1, "%s\n", device_oob_was.entries[idx].name);
>>  }
>>  
>>  /**
>> @@ -979,24 +984,24 @@ int xe_wa_gt_dump(struct xe_gt *gt, struct drm_printer *p)
>>  	size_t idx;
>>  
>>  	drm_printf(p, "GT Workarounds\n");
>> -	for_each_set_bit(idx, gt->wa_active.gt, ARRAY_SIZE(gt_was))
>> -		drm_printf_indent(p, 1, "%s\n", gt_was[idx].name);
>> +	for_each_set_bit(idx, gt->wa_active.gt, gt_was.n_entries)
>> +		drm_printf_indent(p, 1, "%s\n", gt_was.entries[idx].name);
>>  
>>  	drm_puts(p, "\n");
>>  	drm_printf(p, "Engine Workarounds\n");
>> -	for_each_set_bit(idx, gt->wa_active.engine, ARRAY_SIZE(engine_was))
>> -		drm_printf_indent(p, 1, "%s\n", engine_was[idx].name);
>> +	for_each_set_bit(idx, gt->wa_active.engine, engine_was.n_entries)
>> +		drm_printf_indent(p, 1, "%s\n", engine_was.entries[idx].name);
>>  
>>  	drm_puts(p, "\n");
>>  	drm_printf(p, "LRC Workarounds\n");
>> -	for_each_set_bit(idx, gt->wa_active.lrc, ARRAY_SIZE(lrc_was))
>> -		drm_printf_indent(p, 1, "%s\n", lrc_was[idx].name);
>> +	for_each_set_bit(idx, gt->wa_active.lrc, lrc_was.n_entries)
>> +		drm_printf_indent(p, 1, "%s\n", lrc_was.entries[idx].name);
>>  
>>  	drm_puts(p, "\n");
>>  	drm_printf(p, "OOB Workarounds\n");
>> -	for_each_set_bit(idx, gt->wa_active.oob, ARRAY_SIZE(oob_was))
>> -		if (oob_was[idx].name)
>> -			drm_printf_indent(p, 1, "%s\n", oob_was[idx].name);
>> +	for_each_set_bit(idx, gt->wa_active.oob, oob_was.n_entries)
>> +		if (oob_was.entries[idx].name)
>> +			drm_printf_indent(p, 1, "%s\n", oob_was.entries[idx].name);
>>  	return 0;
>>  }
>>  
>> -- 
>> 2.43.0
>> 
>
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
