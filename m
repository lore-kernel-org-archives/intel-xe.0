Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DA0DCD98ED
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jun 2026 21:09:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAC3F10EB4A;
	Wed, 17 Jun 2026 21:09:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B+MFHJ4H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B241E10EB4A
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jun 2026 21:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781730586; x=1813266586;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=3GfMIcZxh8o+r82Y+Y//hME2y5v4lTXs4NjnOmcdQD8=;
 b=B+MFHJ4HcBGH+mhjTKr7Igv9i77U41ZVVBR9jvQeboe7u0DEMkeadDwa
 oZnG2imBWsip79WxxmthqLHr0GboHEwlBsFCa5fW6+bCNpDj9kDjxfO5a
 i87aAgWKR4QZoYre8PVWWYTHR9s4hc71DL+oojHBPEA5C87g8eK9/UeQX
 hgdGNA0DoIKkN+uuxMsbbCV12ozXZOklzZHQfcGyX/82+FG+1vpY47o+q
 K4TmOsWzWWUA3pkPFMsR5oEuRcqU5W4poRs8vcTnpNq4ui9lU4h7OEHJh
 HTYx89SS1jkVUg19aWJZ0BUc+gm/O+SvVsDe/9ENxvdF/6x371VItzvR1 w==;
X-CSE-ConnectionGUID: vFsmWNEyTTqK4BqBKgSeug==
X-CSE-MsgGUID: kmvw176ARCOZn0uIcsn9zQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="85105286"
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; d="scan'208";a="85105286"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 14:09:46 -0700
X-CSE-ConnectionGUID: J0G8FcMdQzieD7jVqaDv7A==
X-CSE-MsgGUID: Ny5SQH28QWe0lB3InTJgMA==
X-ExtLoop1: 1
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 14:09:46 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 17 Jun 2026 14:09:45 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 17 Jun 2026 14:09:45 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.42) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 17 Jun 2026 14:09:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ojfb9MiHSjEfbQuH2Q9c8E9ZatwHP2cca0nytP/waVlUQ+Q8duq+JnI+gzMTESgTv1MPAGFCOzw5xuj0Gpi1+1yAoLcRXrDF+SL+T1fAHGwSFtmjtt+aNM8Qj0eU+jouvjEeWWOWOq0JKoN4XwZ5/DwD7EqJEZO/lUbnXfvLz/ZwBH8FGuT3s2+mdObBUASq8Yw8PrqRDh0s/q12vW+WSEJncRFqdaIgSAxYCRtEvDsLko7KtAswzjkb3BBUGCynEJnL2GjyRyo+nmNNLNDjfKjIGXQFBEqRqhUQTRkDSEc6ACUXhvF9N1ZG9lCuEAajqiYxR9Yr/UTWMAcobX9GjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kY1QYVbNkA+/YZJXDg3rn214ufcTSPZo3lCTEBkxhIA=;
 b=MTeaLisceuNiZZKyhUN7ltSYUHJKGYbhVJImkguGcNvcYfGOe5GrIuT148cnQ9qlY2sRLFcnrvj1ewKkCB/wt9cVQsuhDd4eB0zPq3wjN0/RkZ5UGNrrGhCVFalrvZd/L4+lzNE8oMrP+lsZXyzSbp58gWPBl5ywox1fje1dzoCmE/wDGuT0JEEi7u3fWWSFhZ/Om9P6DVAyVtG7zpSlPfA6ahsphGW3KFTH2yZk2gSFjUoZyZnTHTmW96Rgu7PjO3u0L5Brn5i0WXXT0tn7C4G3BEe2xZhXXjVEf9zMKpe0olxIjW6NdiRAy9Q84HMW1HOeJIyyROk1vcc2Bk3QaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by MN2PR11MB4744.namprd11.prod.outlook.com (2603:10b6:208:263::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Wed, 17 Jun
 2026 21:09:43 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.21.0113.015; Wed, 17 Jun 2026
 21:09:43 +0000
Date: Wed, 17 Jun 2026 14:09:41 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkJBVDogZmFpbHVy?= =?utf-8?Q?e?= for Move
 RTP tables for engine init off the stack (rev2)
Message-ID: <20260617210941.GO6214@mdroper-desk1.amr.corp.intel.com>
References: <20260617-rtp_with_dynamic_vals-v2-0-3f4cb34c2ea1@intel.com>
 <178172710845.91018.7661611226855697648@6beec6c84f66>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <178172710845.91018.7661611226855697648@6beec6c84f66>
X-ClientProxiedBy: SJ0PR13CA0021.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::26) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|MN2PR11MB4744:EE_
X-MS-Office365-Filtering-Correlation-Id: 562b08ad-d258-43d8-34a7-08deccb4c0e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|4143699003|56012099006|11063799006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: t2MyzxEdPAqnbdJSjNtoLyKV+D0zZKtbSvSIPAZdfTDipjaUJt9QsTko+AtG4aYnyszHeSt8HwN+9+ItKlIucOm3qxg6eAM4IjQEtkfIVTXAhNde/cmPjddOCN/scU/i9OhEjBF2JR9U+u11+0v03+JHVzxV/moaXklJWWVo+yaEWY5cU/3fZ9Yml6r+iiPO6kjDNd5L5UXAuaoLoRAnN3eqkU8fNIFsvtlpmrRQnG8HyCJA3gIl/+hN5UuLOV/nv5YgFtELwQZox123HzjikfQreUyKdREjNuO/Lloi8x4kcr23do9YAfv89O+8sFR+w+dCGSAuVWcyH19h/EiiHRz10LL3NtP9LaFRKPuWwbVH+13perW+7QV4tZCQxyBi529B5eimegSNbczhQfsQOXTPogzdQKSSRptlNdsYnIAYDlapii11BSS7AHEnqtlMchJKrk64xox2ioxEqsBQSqUzKQ1eYF0S1LhG822ilAWqdvw9R98sEEl24awHqj9yA+IFPCEm906rlcJ9iC043b73qlxiuZjB1dhjrRFsf9CJvsPZRCIuNjNbkKwa20GyZE/F556VqpCQqGvZ1UHH7Ye3q8XXo2bnVoroAGE09/iyfhZJDVHWcOxfk49EUeV9IUhqtytKVu0HOsD5A+SeeQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(4143699003)(56012099006)(11063799006)(6133799003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?16RsRVPgzl/5Bj42gXHoT6Sr9fD7vUEgaFKG1bPVN2bn/tOrWFLQkxORC5JA?=
 =?us-ascii?Q?WT4bcJrJYGTSJE9y3vSX2FnOmy7wvxTpauWZO22uPKnjk42k/wl6tXCTAEj5?=
 =?us-ascii?Q?ZOv7MsIVbif6+qDAFxqi7Agw4EweGMK1/9rekUD16OvBIDEyLiJFzentmTHI?=
 =?us-ascii?Q?PCNGs4ZuD1+EPy86vHp6D7PmGoH0s9K0E9bueFYUuAHUkd8G/P1Mw2XAgvmn?=
 =?us-ascii?Q?NDLOFRjqrNyZ10EGc6Yy1iVZe6mLhfIKrV7NyFGVUYPuYcIBFJds7+/oXzj6?=
 =?us-ascii?Q?eFH2gDht1GkL+GPkm4ZNdc+ZKfX6ItraW9X88+1KjCm8LHXHV+fNrf2+TcQC?=
 =?us-ascii?Q?NIoEj59PY+FtQ7ZtFPwGs/7l17qX4Epogz6zoEjpS9ewi1COFlhA5Su0k9V/?=
 =?us-ascii?Q?rDLQq+6xu9Oc01/P7idZQ4rt1yZ6DR5snOdyg+XItkKUw+VAKr9M9x4LQwM2?=
 =?us-ascii?Q?aXEox/7zZpNFVy3HYwUQmkQfb7OnNMf0uyEqCJwhNddYVqQbe2pi4KvxX3AE?=
 =?us-ascii?Q?FvZAfVlZL01kkWWxR28fdbxP+Pllk2rQRDXa4cRpY4B6E0jodR22pzCrK79j?=
 =?us-ascii?Q?peSwgreQZXSkw/Jli4H0pKAEUHucAmAatUv/mpTadMG6ks5oRErCpJMeqNi8?=
 =?us-ascii?Q?UuUj+hcJAsZjLS8aUPo16hNto+eJf6mnhXGId4rqR9vcXoRndspOipc2sWcB?=
 =?us-ascii?Q?XJCxnbxTQdscsZxWeItPi5ZzSSWyji2Os0BdskW3EHwFeeyEsgxUq8V7VcbD?=
 =?us-ascii?Q?XDilpEtS7A3WXtGnRcXnTqQWepX3Ootrhw1+i8+2Cbt8OuZoLpkHvQ/DchLY?=
 =?us-ascii?Q?ZBtSyiCE493mBaMTjmRWZN2l7slodObputY7AiV0Lema8MUBZpIoxCbEoP9t?=
 =?us-ascii?Q?BkMnkjD9/3LJSKwhqvPWHe72Qesa/EjDWrl97OLnnSXmtUx8hPmBvdZt+Jv5?=
 =?us-ascii?Q?HclszBKlJvfV/T+bWjf/o5/ZxGHDDRz+OM5JTvnHlUbBKzL9n9jhg9KNGJGJ?=
 =?us-ascii?Q?eyfBYLfIX7l9K7O6Qk64j6fXBkEFkgXKfc6etjcYDpzTEz+/pMIuelel92NM?=
 =?us-ascii?Q?9Nkv9hfy8SRQkrr1zGBuYtdv/XYrlMDRZom/LJZLrZY2lnU47xoRIBJOQUmJ?=
 =?us-ascii?Q?JeNlqsLBxDOgBoNSWztFvHCIh0xKCk0kWJAPaBGhqd8HaZDinC0Yf1JQN/Rc?=
 =?us-ascii?Q?C/sqR7EEfhOdV9cZ+V7TyHq+OtkcFGFUpBoIp3/spFIdLTFJF1EN9JvVDaNp?=
 =?us-ascii?Q?WWtgkau4r/n1VfPPHynLW73OWAXNAvPvVPfHrAZ6p4DMHgxjPr+W+6QLZfSo?=
 =?us-ascii?Q?h0RcjIMTGGQsbiSvuaM+rWIAZdtKmu5899K2aZL9O/L8oEdd+HcJ38AzsJRa?=
 =?us-ascii?Q?foSCgJ0GZZ4WGm9wkwPh+TIvT9Sl1nz5L9NQCboQrX7BbZ9QQv8SregnKIXo?=
 =?us-ascii?Q?x86+1IY7IWdF2YkAJ7j05drUz/MGwQOAXibV0xSptmDbPosEgPIw34kvdm4R?=
 =?us-ascii?Q?eFO3O+LfetQ4eKdtUIQLVE3obM08fHRB/mhJo8zPkSW7++8kTolrL//VfkkS?=
 =?us-ascii?Q?ymwnsz1uca16V/SFy3nLdMcx6XC7qfboO2aD6GJICgQLQlzaAFvZIcVwcHaq?=
 =?us-ascii?Q?8X0Oe2Y95rRz0yMywlPKlUFoG7M1s3rbvbOVNoYZSx9m58j2gLjDADJV5x3J?=
 =?us-ascii?Q?BLwdOKms+JyNRlrD31zqXZ4C8HepSFvooEKDPwLiwHgRP1cME5uyuLx1an/h?=
 =?us-ascii?Q?vFJjkc+SSHtrch6+mIVIt1pslAExVS8=3D?=
X-Exchange-RoutingPolicyChecked: d9wEbQ1aDCerfnsUjjb2e7SOas+/wchAjQRdoS51w3fxQm/5F6k7OBbac1GarwaqJHVTV0Zi+5VLuIaF7940fggHG6nhPo/spADaoLRbOpDJnydKeEiO/m28f+BiYNopgUqf4zlh605moAodtZKQcOBmiURRLA4suWVd5QQe75koQpkYOdfu/VfVy3zMMPldPyb6DqWY6ctE+0qUc/++5yBfR4jPtuR4D5sGTFBp6LUNX548Ewi9cKw9vqRAyu0W//6OX9jzyYkC6pH68YcPjUwDczlXesyMQIyn93KdeOLH7Oi6+yiSy0Xt4ez29ykeXw411SejNE2nxS4sVKbA/w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 562b08ad-d258-43d8-34a7-08deccb4c0e7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 21:09:43.7333 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3g1+u5bNJtixexl9/y3D/bejoERPBSm7dQEZ7yu36Molrzgj5Xp5b6CyBudJ0TcgxhaJgZ0xV6w8CcgwMeQ6+IRzuFe/iMjVdZg2zW7rD1U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4744
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

On Wed, Jun 17, 2026 at 08:11:48PM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Move RTP tables for engine init off the stack (rev2)
> URL   : https://patchwork.freedesktop.org/series/168630/
> State : failure
> 
> == Summary ==
> 
> ERROR: The runconfig 'xe-5274-f7cb2873b7430d84afd4ad4e4771d3f8ad03fbf9_BAT' does not exist in the database

Seems that the CI system lost its "good" results and can't do
comparisons now to detect possible regressions.

Since v1 of the series passed CI [1], I think we can rely on those
results to justify merging this.  The changes in v2 were:

 - Updating kerneldoc (no functional change)
 - Adding 'static' to some arrays (compile-time change, no runtime
   impact)
 - Adding an extra patch at the end with a new kunit test.  CI *did* run
   kunit successfully on v2 with passing results [2].

So no changes in v2 that could impact the runtime BAT and FULL results.
Merging this should also trigger creation of a new baseline build, which
might be what we need to fix pre-merge CI for other series.

Applied to drm-xe-next.  Thanks Gustavo for the reviews.


Matt


[1] https://lore.kernel.org/all/178165630296.86642.11835579407959899578@6beec6c84f66/
[2] https://lore.kernel.org/all/178172480884.91018.6877579933780575711@6beec6c84f66/

> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168630v2/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
