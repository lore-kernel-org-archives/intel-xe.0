Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19C7ACD6E55
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jun 2026 17:26:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D066010E2A2;
	Wed,  3 Jun 2026 17:26:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OLRaU517";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9003510E282
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Jun 2026 17:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780507606; x=1812043606;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=LUIqPkDUrsuJcRDGpfO35phVPWsmPdDxIPikisOni6o=;
 b=OLRaU517twEcbpKK/CJ+qHlXKLZ4hTkVXBcqWdcwuCEW28p2fT54LvGJ
 teBFL8w9hTd/Uylm0Q+nArrR+MBkm1VGoh4O7jFK/ERTEk+FEwXgxP1UC
 6H4nqMJGTh5TTpoh56NnPv89UxGqagCuY4X1f33d5D+P0CUn3ITcjSSmN
 OhTcjduoYeP3snFzSQUqxf8tK+vcv3Z/eUrVahPztoPPjb6njNY5NIqEx
 a+w047x3q/7LK5e8dnWRP76f0Ke09el6rRnNclmBMKl+c6GvPtBU6sk1S
 Gifc/NX8T9tSHHyX4J3x29uLbhn1BEfXZTtoJ/I5MRw16BGPeYiON1aMx g==;
X-CSE-ConnectionGUID: vUhMIxJaQ1GlPvKA0rW54Q==
X-CSE-MsgGUID: 6ocv/d0rQ5Cpt5hNB1dfsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="81323011"
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; d="scan'208";a="81323011"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 10:26:45 -0700
X-CSE-ConnectionGUID: pfK+alGxQo6YL5c/dz/2VA==
X-CSE-MsgGUID: vLrkbWs9QISxu5+001o6EA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; d="scan'208";a="244419951"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 10:26:45 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 3 Jun 2026 10:26:44 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 3 Jun 2026 10:26:44 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.62) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 3 Jun 2026 10:26:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BHXy7vF3HeKnTZ+lVJkQQTtrHXjJv8eFX6l2GeexEY10W0dYF3I0O8UtNhPcYYZmgre1miRkxYY3EhtPjyEVdDbf0zKtYVM6/cSKEbgFwD6br4cVf/K0OBrliDuGv/zipE9K0rGDe+XFvojfskEQnt+YdY3xjTEZg9cCVPx+AOaTvaUxxIYukJvhWJaNSaN8GPBd8jaqV4XYzliGtCaW1JGq7yewyuFbbsbrbcO+Ahm3E4JXEpqcNdliU8omwJvzyf42kDQv2nhurJ4SB98O7XOhfqwnadMWSoFWR4UH9OvGmZM+GzFTUfmQHOBH9a0Z+znaSKiZ2WaBm4tjyDJxTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DaahqqwvLlyc8qvxDE5Cc6POs96Or8pOkcjnIXrRFEE=;
 b=TWXWTdYvEktQxMugkuciIQwV/Eow5JX4Cjj/vqCEliO4SZwn5myD3tFnL85VE6DSIoL6kIZyz9WU3fYnPQq4sI5XeptSculm6B7L6hg84HKbLY+QeB7CCvNSs8OeDxyLBUzXTvy6TOMrLsMbhNS5Zsm+kjVtr+Km48BvR3XldaCplXOGw1le2BgQRX/2nEoxA0T1KJI3lhMIpcDr/IVihwvQcVbGGCtFdHmlZLKuZOWe2GB671ADO+nSki3C3/zTXWY8pjp6hEeZA/WU1InwoVKNg9wK7DSDCc8GFKTFLAW3y2Q/viAjxKAGlvgEbS0yI1/oEuFbPzwvU+nMu2vU3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by LVXPR11MB9731.namprd11.prod.outlook.com (2603:10b6:408:386::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 17:26:42 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 17:26:42 +0000
Date: Wed, 3 Jun 2026 10:26:40 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>
Subject: Re: [PATCH v2 09/10] drm/xe: Enable all FORCE_TO_NONPRIV registers
Message-ID: <20260603172640.GC6262@mdroper-desk1.amr.corp.intel.com>
References: <20260408-oa-whitelist-cleanup-v2-0-db4a06aae8b0@intel.com>
 <20260408-oa-whitelist-cleanup-v2-9-db4a06aae8b0@intel.com>
 <87ldcw7av2.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87ldcw7av2.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: SJ0PR05CA0184.namprd05.prod.outlook.com
 (2603:10b6:a03:330::9) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|LVXPR11MB9731:EE_
X-MS-Office365-Filtering-Correlation-Id: 70bf3c96-ef38-4936-5890-08dec195474f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|4143699003|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: CE3/GPd41MNzcF9Y9QS8Q0FkGbVbENkFYTJdehgB675Qn+PulLbpKXe10D8wqqnwR8zudJtL5rRgGjPZjP5NsLJc7OjQNwrx9jMCYwvZA+wW3ZLlSvr6M0HTZr2sjtgsTMd2hmXm42XrnXlmJUSevtus43PsYKQJmLywJTpYeinQ1gs8XeI3fEz03iA34giM5E61kH/taFWyXBE+KMFzYPftr0FlJO9h3csRYPWOIZy0O3ltWiY9ppdzCM5xtVyErs8vSvrrxi+L+QnbV0e15Iv+YeKRxVub2259jUu2k3w2rjcFT5+hGjxQIUieTD7g/y+bCWpy2ZyEKlxT/N1Pr3lYWlZ99aG/8dQ9eQ+15Y8X2rqD86wR2kMiyBTbbf1gvYpdcUAg7Hs2qhDxDuSmDhpd1aV9j6CZ+TKFI9ZVZ9hJGTu6+VMVQ7C4/ZScKAAXTu1jMXAme4t8iuokrLCEsUy9YURkuv1WpGFENR38Ced3WHEWfi6cT8ExHu/g7hBDwmgGfkMKz+r2ra+PK4Swp1TrllRf23ZhyOunpHGaE126WEHliVmc24zO+WRYRr17ReEQ02b3yLHFWq7LBMf/TbW5L27402Z4pGiDszxxCKz8yRJWSiGgXRgHjri+Aty9ldUaJfy0NBfghI4KDZgZIxVAMzJfkiJbLY/IpIehyLAL548IaMGphMuvZPX1VAyb
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(4143699003)(22082099003)(18002099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0PMBvrqyi4kQbya2en7nkpAySC0bqgik8ChkxOt5AXnFWw7o9EGk/xidxF18?=
 =?us-ascii?Q?gGGtDhBDRF0NmLWRBaO7gI/07vc4G6V6ilFZMFC0aqI3LrRvzqyDg4bpmT8a?=
 =?us-ascii?Q?B8JtFxlx+wPezyx4BNkAJQGVhrNyL0A4j6n9VcMzqJLPLJUyzNlnEeaSh/ZW?=
 =?us-ascii?Q?dSUp1+e4jbNiBjV/W+Uye3i33CfcR7brVw8l/38jgn0fEAyrw5UvB8gLwfet?=
 =?us-ascii?Q?1wyAX65fr3/tR72LqR2G9NT9k0H51kvip5zovmr7vQp6x+X8OT7RT5SS3wJ8?=
 =?us-ascii?Q?z1unk3TRGzz83nDER37nBu8Ew+nd9gKr0w9jNyQXTRxE+0/wkXDmcg1gbf4Q?=
 =?us-ascii?Q?dzjNjBVMTDdOtltxq3cE7b5RHI/YVoMAJn6MSkNY/qKAVypzUwcp9pFXOkqb?=
 =?us-ascii?Q?lXCTjQcqxNGD8p0tnbsHb+oOHX79qtGORAXvicwXyuuCMqllcSqJTIVUe6to?=
 =?us-ascii?Q?i/oFhiMOH8QE2FQqj3CYhTKMrIYETt4HGABqx1Jh5ts/cvVGWT0CJCOxOpmE?=
 =?us-ascii?Q?jwq+5Bp3NSUaIjNCzT7kJV+OXhWHVi2HHwKMRfQn+BX8/qKARk26BAoIpZoY?=
 =?us-ascii?Q?TQ9dGRB7UzODZvndGaqJtS866CSQ05uAWWl3NRUhqKmvnO0DJzAiua6ALOuv?=
 =?us-ascii?Q?RLLCdxaY9CBdb+U+b1BfRTeWYeBNW5NrJoczQgldb0aeKU1ur2YH2h6ILbnQ?=
 =?us-ascii?Q?SHxdSW8JL3QwI85e0rH8cB6eB129Sh3hMKvOfZ8p6lLFjI1P6K17gFQef9d4?=
 =?us-ascii?Q?1bemYc3L1EJjVOWjmWyhsvs4kW0jcKGYrWWi+VNOYwNAppPFsnfCcnZhx6Bk?=
 =?us-ascii?Q?uV3j4uyV2aDgC+FV1IX52ul/CmzQJrG0M8izcdlCTempLtHmtgCRFf64OtAj?=
 =?us-ascii?Q?bWuL1EesMBYVmA+BJPbh2Pk8W7fjoBe24TCdePNXfKp7H5hoCVowW6HaewRS?=
 =?us-ascii?Q?YUHmA+6p/xzpIqx79g6cNsROdF+CA1tun02pTO60Fb28xDlmbWgXJoI2N8iu?=
 =?us-ascii?Q?9UoKpe3RURU+xdNg5NsDxBrVKKXaUcPUdBsP3yzzfMh3JZQ9pXMh8oYuGvVR?=
 =?us-ascii?Q?2eDT80B6/36h9+ymexUe3L6NF4sFmdVf6nmB70zyxiwwgi1ykgVZfTCuUlw9?=
 =?us-ascii?Q?guV0Ur5vtHaZekcIWjA7+ME/y7HcWjl1Yl0bZyOhG/fN8pZ2c1MBtgQH/uJ0?=
 =?us-ascii?Q?A2rQ4zHCrPKhAspBVqv6/40vY8Ub9nBzEfNIdpCSju7t7ZcI221NkbOaIJz5?=
 =?us-ascii?Q?U9YJbGek2+yo4/jWrVP9Ly8A6xEaHfnXXk2f4mYsLjucSfXCUCfe4bY/lUNp?=
 =?us-ascii?Q?1nEg/JFGcY3kTW7pwHZIY+fIQAsk1QOTFrvebUQEHyFZF1kk+JI0+ji2Fm2y?=
 =?us-ascii?Q?cNkc0sUgMJNs3GDAyi+UWlx6C3oSHYM6BGtbSoRDbInf1iZVzwjk8xRQuK+G?=
 =?us-ascii?Q?OblNrz996/heUGI9GL//xBtXpqGCrUi/zoMLnTH4ybv2K9lnFczxYmjW91Av?=
 =?us-ascii?Q?olOEbp9Js7d2cjSalrDWgD9NDfGddmZqCNUmm1ZORlscmUwMd+xYPDY2xK9m?=
 =?us-ascii?Q?crPS71PBCIsA/W818r4rxOhe4j4hu/X+Ipb1ezwTc809ShJx6HDUuNwdHyb2?=
 =?us-ascii?Q?5ZdwRElCT5pCFhIiGJySPoMJLQLV3NJZh633nAM4Hjlja7OZ1RR1Ayn0WA7e?=
 =?us-ascii?Q?Da2Beg1k9P1XDmnFzoy916vz2BCu4achin1dY1UOE6lyqs9ydyOrsF28W3ty?=
 =?us-ascii?Q?5q5LpeUYNnB1QLwiXafC5ij3Ccp9plg=3D?=
X-Exchange-RoutingPolicyChecked: WILadorko3KYksRa+DWbBoWom1reuL5N1tbQ9AtVjbK5lLZ7LyBT3YLv0W+Q6W6l9vPbAjrQGuU0jNYaDhzp2vJrP9aNHolxaHAOxJiXUyT4w5LWDxM9hEKqhdWjHqbrBF2oYyS1w8GPNF84bWmcFxBKK/KIVkyTSeKuyJsUIWqq8eE9/JQ0svLyiUWUShO3ucNwFwE5aCLpZPHcyLl7KW3rtulBgSHSmkXrLTqEn7dPaj7doZtEQi/NTjw0oF+LwTelvNRJZHqsbYVlhedrQtHiaTxSv0eNx7MnXP6VibkNEq7dEY93/veA/NWm9n1H+9FsmwLg4bgiIWb3fza23g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 70bf3c96-ef38-4936-5890-08dec195474f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 17:26:42.5370 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UZMjpfcBZ3zn8F98ljgtuxpgKrtBP3UPVwPTvc1wW2MOD/87YjQHNF8Xv9jRLqWNKWb6K/2OpRhyGQ9Phhk6DE3ekcU/Z9UY+HiowkOuPnA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVXPR11MB9731
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

On Tue, Jun 02, 2026 at 04:58:57PM -0700, Dixit, Ashutosh wrote:
> On Wed, 08 Apr 2026 16:43:08 -0700, Matt Roper wrote:
> >
> 
> Hi Matt,
> 
> Wanted to pick up this patch, but doesn't look correct.
> 
> > Intel hardware supported by the Xe driver has 20 FORCE_TO_NONPRIV
> > registers per engine.  We've only been enabling use of the first 12 so
> > far because the upper 8 registers are not contiguous with the first 12.
> 
> Well the nonpriv register offsets are as follows (in hex):
> 
> 	010 014 018 01C
> 	1E0 1E4 1E8 1EC
> 	4D0 4D4 4D8 4DC
> 	4E0 4E4 4E8 4EC
> 	4F0 4F4 4F8 4FC
> 
> So it is the upper 12 registers which are contiguous. And the lower 8
> registers are not contiguous with the upper 12.

I was using "upper" and "lower" to refer to the register index rather
than the MMIO offset, but I guess those words are ambiguous wording
because FORCE_TO_NONPRIV[12..19] are at a lower MMIO offset than
FORCE_TO_NONPRIV[0..11].  The contiguous 12 are considered index 0-11
for historical reasons (old pre-Xe platforms only had 12 total) and the
fact that the newer eight instances happen to be at lower offsets didn't
justify the hardware teams renaming/renumbering the existing registers
in the specs.

> 
> > Some upcoming changes are going to require more than 12 entries, so
> > update the register definition to select the proper offset for all 20
> > instances and allow them to all be used.
> >
> > Bspec: 60340
> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > ---
> >  drivers/gpu/drm/xe/regs/xe_engine_regs.h | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> > index 1b4a7e9a703d..d8f0915500ec 100644
> > --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> > +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> > @@ -182,7 +182,10 @@
> >  #define RING_CTX_TIMESTAMP_UDW(base)		XE_REG((base) + 0x3ac)
> >  #define CSBE_DEBUG_STATUS(base)			XE_REG((base) + 0x3fc)
> >
> > -#define RING_FORCE_TO_NONPRIV(base, i)		XE_REG(((base) + 0x4d0) + (i) * 4)
> > +#define RING_FORCE_TO_NONPRIV(base, i)          XE_REG((base) + \
> > +						       _PICK_EVEN_2RANGES(i, 12, \
> > +									  0x4d0, 0x4d4, \
> > +									  0x010, 0x014))
> 
> Note that, from the nonpriv register offsets above, the lower 8 registers
> are in *two* separate non-contiguous ranges. Therefore _PICK_EVEN_2RANGES()
> does not work (if we are trying to include all 20 registers).

Yeah agreed, it looks like I missed that 12-15 and 16-19 aren't a single
range.  So we'll probably need to either add a _PICK_EVEN_3RANGES()
helper (which doesn't exist today) or open-code it for this single
register.


Matt

> 
> Thanks.
> --
> Ashutosh
> 
> >  #define   RING_FORCE_TO_NONPRIV_DENY		REG_BIT(30)
> >  #define   RING_FORCE_TO_NONPRIV_ACCESS_MASK	REG_GENMASK(29, 28)
> >  #define   RING_FORCE_TO_NONPRIV_ACCESS_RW	REG_FIELD_PREP(RING_FORCE_TO_NONPRIV_ACCESS_MASK, 0)
> > @@ -198,7 +201,7 @@
> >  #define   RING_FORCE_TO_NONPRIV_MASK_VALID	(RING_FORCE_TO_NONPRIV_RANGE_MASK | \
> >						 RING_FORCE_TO_NONPRIV_ACCESS_MASK | \
> >						 RING_FORCE_TO_NONPRIV_DENY)
> > -#define   RING_MAX_NONPRIV_SLOTS  12
> > +#define   RING_MAX_NONPRIV_SLOTS  20
> >
> >  #define RING_EXECLIST_SQ_CONTENTS_LO(base)	XE_REG((base) + 0x510)
> >  #define RING_EXECLIST_SQ_CONTENTS_HI(base)	XE_REG((base) + 0x510 + 4)
> >
> > --
> > 2.53.0
> >

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
