Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C961C197BF
	for <intel-xe@archiver.kernel.org>; Thu, 27 Feb 2025 21:21:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAE5810EB9B;
	Thu, 27 Feb 2025 21:21:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g9jKZ/Fg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0AE910EBA3
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Feb 2025 21:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740691277; x=1772227277;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=cx0GMjNhvvEa1pxGoWtKmXdOwUXj8MPcafpN0GK5590=;
 b=g9jKZ/FgluD54Wm5aOu8y9JtYft7rpqryUSRBQ/Svk7itlsKyrDIndE2
 k1BwxB/Ip40A7eDZZ7gMvy3+937GFQrY1eM9zGapLHptdwKWngUjsvsZT
 DFI7bBzywRlHoFbbas2FjEYyH3mO5FSZYyn4FRE2KlfFEKEWjBoGZ3qmO
 fNcE2Y3GiurBp4EXTmDtU15q8NwafRrEv5opp7CkrEMGRVmWwPH6mjqhZ
 sz/LiZCE0YU8+mcRrPDJiZ5LHA0VEWEWb0xfuwB0awXBGeNYtEBkePQnc
 0EFIs79oJOzKIyqF9I1ssSxGzuPSawIsRUcF37eHMvRptBNEFiBrY7p4a Q==;
X-CSE-ConnectionGUID: eJpPVTEuRAOMkI8dbSgs8g==
X-CSE-MsgGUID: Xh/rR+fWS3e4bLOUsWjzMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="41860154"
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; d="scan'208";a="41860154"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 13:21:17 -0800
X-CSE-ConnectionGUID: yuzc+fSoRGmNn2nNe1DCuA==
X-CSE-MsgGUID: cLFs1gHTQYef3sCQ3qQTHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="117664230"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 13:21:16 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Thu, 27 Feb 2025 13:21:15 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 27 Feb 2025 13:21:15 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 27 Feb 2025 13:21:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bovEz0bpSbSN6Ld0T2c4oMzGczBM8e/MapTCjEEDvpiAs9j7vVtDSBtnX1Zi81Wlve3nfSOnClTFIy6JX0SW1bSKRSVYRQGwrxSAPYvZpVrWFwR6PnTp9lVnuXeJUbr9kzNuaLdsuFRm29O/6otL255BWfI2IaMaAgKOKxSFrN/C1lpD+wzjxAccanQ68PvAGiyGb7FyLBJEBF8WtDMWkqHjjqgKlh107DvzlA5b7NZmzBNBLZ8MmGr2cz0u/LJj6ZP3z4c8/O6imIWWPH3FTBXHjXePfjOBHUtgQ4Pc5poX5cDSgKEGidm+UOxWhYXW8jhJapIUCrWIDRs0B9tA8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sutzO4QMhZ6gsJdrNRhZNq2zU/c0YWjfhP7opshmXKI=;
 b=JtYtqDsmNiIN/cqKffq/9qP81oeI1jOkj0/64oAO4y4YnE0Yl814GBD8KOfh2sk2s07QVz/KNHvw/k+Zr5eX2sQLV+2A7QkgmkNoxa+7xTt6/sk/buo7uCa8hq7pEOHvHR9qcbakcLfZ2Hcfu+lMCh9f8L9GoJf/MuxxRIOWIH73l45IDPUQkNwcFUfjMl2JTsESG2CgQssRidmkCz6lynUKGNpbCzF+MrsPe4eMmpwvYY1CU7eh5sHqP97zz1/RYASLls6I0VbJTDRJ1BFxpDHHjOWvC8rt12ln6eWzYJnHlUv9lysNcc3TJ5NYS9o17uZJ07HVJ3CyxdgEAeuWog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by IA0PR11MB7742.namprd11.prod.outlook.com (2603:10b6:208:403::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Thu, 27 Feb
 2025 21:21:13 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.8466.016; Thu, 27 Feb 2025
 21:21:13 +0000
Date: Thu, 27 Feb 2025 13:21:10 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: <intel-xe@lists.freedesktop.org>, <kernel-dev@igalia.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH 4/5] drm/xe/xelp: L3 recommended hashing mask
Message-ID: <20250227212110.GS4460@mdroper-desk1.amr.corp.intel.com>
References: <20250227101304.46660-1-tvrtko.ursulin@igalia.com>
 <20250227101304.46660-5-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250227101304.46660-5-tvrtko.ursulin@igalia.com>
X-ClientProxiedBy: SJ0PR05CA0011.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::16) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|IA0PR11MB7742:EE_
X-MS-Office365-Filtering-Correlation-Id: c938a30d-6d54-45fb-e640-08dd5774a985
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?R7JLfDoBBpKQBNsT9erBaFiKIc/2L2QE0LFAiCcjksC2oYalDJx0oXAPNcFB?=
 =?us-ascii?Q?9mSmItbQVzj1z8dmqfo42jFqsEckBkAJqcqYMhd2nonlnsm7GAxUb0vWbrwN?=
 =?us-ascii?Q?5WBI1GePoZz5TArTuN6IQ5OHACxWba1jU49loOHR4kG6PNmLHA1j7bxL7Q12?=
 =?us-ascii?Q?gt/ncWJPFKv1JR75c/kEYZyaUnRuI1BaARSRmCIDP66O8FFGaOwNZ6fE/G+g?=
 =?us-ascii?Q?EpLjKvIxDe4AXE5QpmoNE3PQ0y7GEfea//AsV26QGFnyqfZxZUhcyA7AcAPf?=
 =?us-ascii?Q?iQGS2HBxUuowbcO8e6colKnjj72BVqjuDA2O6rmPQwqdR2XY1mNWbUSt8v/c?=
 =?us-ascii?Q?3eLc0VnfekqnMUi5r8ga6PvmfNSxBDtRnI9UCsI394dYTEJgBDOSEtGH4WLR?=
 =?us-ascii?Q?Px93yfDZI6evWgxFFFPVnK25XZKcHP9jmUJcxDfavLlPVRpGbqSvmd3AMjxq?=
 =?us-ascii?Q?NzdckebRSWSnJbyTWl4lblU4dDtkBDvdDEl+4n8paFREdK5TLooqFGs2Jn4r?=
 =?us-ascii?Q?tVGlyhmOtOcyf6ojxHvuuvvyRzjwWVEb8eZpX/rvzddkybeAVsg88X48Y2wW?=
 =?us-ascii?Q?e+JtiRB+J4EKjaN9s+fnWht5EREC5VZHrF7cEfgcCB7ZYhoBnijUCyDFNzsR?=
 =?us-ascii?Q?V2H31L2CvUzr2iGRHQSTOOdjzZEu/pt2IV7hs78ZnuwSpoMisu72vtgRHabd?=
 =?us-ascii?Q?bOgUdOrddoclS4wdFrFpdnRtCBXTY8SBwruoNAGOEji/BRE3aibbCqKM2aEe?=
 =?us-ascii?Q?XfUT2VFAWWFgOQCJ/swkeTbUxSsMNo3gZkc5RUEjNS25sOJzeyWpK2KwFlZw?=
 =?us-ascii?Q?rxGnx//+WEOOV5X9OQ2Mqwpz131nvDv5Bros25UbzE6hY7ruQ2eoLa1nri+G?=
 =?us-ascii?Q?P7IaCTvy+vtc+uH0bS8a58ZkM0jnK4/FBnu/LqEmgNTnETkCfYABjcoO7kEm?=
 =?us-ascii?Q?Pfq81qIEcrtRawx7BusHvpZ3cc4PA+HijmBQ7y7N0U1yzK5S8iMrymCvBan5?=
 =?us-ascii?Q?nOREWmX5pcsEmkcKqBA6HGIwRh+jQTXIoLDGIkDgA4yjPFumQXHciiDvupze?=
 =?us-ascii?Q?AQR9K5AGMAhLOFQqO0C4hCCvpT9a+3A+s6XY1S6xpS8Y/2tTLx3wmE93u5mb?=
 =?us-ascii?Q?c9RiFAG+iOz5Vw3MZeNr4+KK45dopb4u5b3/XmT8JHda7H8UHS6EWxu7qq1Z?=
 =?us-ascii?Q?A5xek+e6Z12ptle3gkQwnUtba4iYHp1PYgUUZD0wJ58iGBIz5vY4wOfi8Lkf?=
 =?us-ascii?Q?Ph0lyH5+LHiWRD8irdv3jAyZTOaIp8fAJPwj/n3ryZqkOMHxPiyLU6r4QkYW?=
 =?us-ascii?Q?V30vEVmArjaMCMltWwahimjeQf9L34PDTfCgE6Mg2x7SuWB7YYEmyyL7f6S1?=
 =?us-ascii?Q?aqP9jmSj0RCJg7wP8A4bop4W/Muo?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RDoJZ0C+ba6qmpuvS2Qxrk+yHUlhjYNxNwJ/Km4PBbsDvtvG49mgxCGKz8o3?=
 =?us-ascii?Q?XIqEZjMSMEnPM1+5Aptl6vfjzqu53TnCzruStwSTXZQffOtKutTi6+6NZ+cM?=
 =?us-ascii?Q?UbZp42OlhB+jfIrWa/DYnlsyKFO0taqx8OlB8ptCKeI4bzaopsSl2ivaqEur?=
 =?us-ascii?Q?ugqbyqPCTkjCRE5A+I0Tty+qse635goD9gf7kum+tQyuVevZpVZ4G4xGFCg9?=
 =?us-ascii?Q?BfT819u4nrp8prP0XkI/1BKZcLlwApCNfFF6idfhVxJg7UXocS+ZzkkKxDr2?=
 =?us-ascii?Q?0BW1mHW5kVML/TbrH8ZDFaRER3MetbrvFgk7gQW3UScmBHTb/SFkQGfn9DBU?=
 =?us-ascii?Q?6HMDmcvBxi+eosZOfc2MRT/0Y43Y5qvGbbkYdgFWVOkDxyZwtQIySYFHqeRA?=
 =?us-ascii?Q?qhtHWDvaoiFC7CUDmyYtSiAt01XY8k/pJTnuycYPqQQa+GzAdb2noqyGooeq?=
 =?us-ascii?Q?fcc9uU5dH5ytWMmAuLu+ofxHRe7rG46n3Nm0Pe7NuYQ450akTtXqlLxGtR8B?=
 =?us-ascii?Q?qgFDZoYxDaS7sBnMxGKiZ6PxWVEsBIPJ+3KvNr7yJqmpVE1T/jz+n5i3YLbG?=
 =?us-ascii?Q?rTXxrJxXL+UCoJOzhZTApbPuGUSXRA8rqyfpCFjDFUBXMYW4DnHRQugsMXD3?=
 =?us-ascii?Q?wlRH9q00fPU6YDtINIdU50vRKMJ9idV37CHYwfOxedZ8P8vdvBKnoqZzO1Hd?=
 =?us-ascii?Q?rhingIuUSv059NnnyEMZug5Bm8zWwWo//eESHtL75m1N+sJYlHt6kNKjPpJO?=
 =?us-ascii?Q?gKwSM1b+fE5tQ8kFmLCYZ05OgpMWQL3M2bl96aLIaq8jMgI2JWuq1QJoZECE?=
 =?us-ascii?Q?rC01yh8QPy7sxi4RSKOROrps9NAy5F+sTtzbUGhl3JS1ZjLTZwLHfgj1LKD1?=
 =?us-ascii?Q?baR5ppHC3nau7+0V1kkB3TWJ2uocLbigoeclII3hxV7aOxX4TzJPrvRqpdul?=
 =?us-ascii?Q?gMU6MYugr5jls/GjCsBLjrase31LXbmHHkwAkG1XPKnta23/+q+kD0WFwMDq?=
 =?us-ascii?Q?mZQMb6kz2SkawV4qosiLB5U2CAYrpFYXrVPMQkHyZ/NQqj6QL8PPDIomACwy?=
 =?us-ascii?Q?8B+3Ndx3b8UZ5LFPxYoBAUkRbsd91Wiyr1Inx+dXtOyw4Gy5xVrQT9GZp87B?=
 =?us-ascii?Q?7BP8TojKcldpUucpQ+JeGVXXQtLxvIhN/wCYyJzPXirJ2+FdxS/J+RsIwjGo?=
 =?us-ascii?Q?RW2jr9bwbM2KufVCtaQuqbF0lzZAiNVNcU6VYUUkA5OPYT046CumGdcutC7N?=
 =?us-ascii?Q?HbSdalEOo2BHtrOILG+AMwq4VWLlXM13jI93gBLWV6D6gZO8b2j7VPp3w7KL?=
 =?us-ascii?Q?suFJdQYaTmFDVrNXUdAz7Gi5Ow5zpo0YpzWNg6p72i1GpzjbeSQXW5nAnZv+?=
 =?us-ascii?Q?81U6IP9qXCfcHrXURtBrk5ynGS9hf+Px14dJoMnp1zUl9SP2X/+JpQIQ2n72?=
 =?us-ascii?Q?yDHCyBlpgka/NfEjnl9Bkd/0mEJNXnw0vavkLhvns5r0WjLF5aTgvfsjxREE?=
 =?us-ascii?Q?Gyd3uYIzyyWBrOpm2kG8/c2nEEvZyXxFElGikaSjjh1+M+TZLZadGiUsgmIb?=
 =?us-ascii?Q?HnhFgL+fP0Grdyrb77/ijMzzI1FrSY2Cx6yWPRc/1MQfDCC0LAL5v6tZI6PF?=
 =?us-ascii?Q?nw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c938a30d-6d54-45fb-e640-08dd5774a985
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2025 21:21:12.9924 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GOan2UR4ViiUzY35L7gDSnBe6kO52o677Rh/m2WVQK3dze+Crf//5Vf8lxCEBX/sz/Wc2CTnukZgLfzhUXvjMzVTShSXoKBd9ZDyzHApeTQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7742
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

On Thu, Feb 27, 2025 at 10:13:03AM +0000, Tvrtko Ursulin wrote:
> According to the i915 codebase xe missed to set the recommended
> performance tuning for L3 hashing which is applicable to all legacy XeLP
> platforms. Lets add it.
> 
> v2:
>  * Rename prefixes to XELP_.
>  * Tweak version end point.
> 
> v3:
>  * Add bspec tag.
>  * Tweak version range.
> 
> v4:
>  * Move from LRC to engine tunings list.
> 
> Bspec: 31870
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> References: c46c5fb725be ("drm/i915/gen12: Apply recommended L3 hashing mask")
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 5 ++++-
>  drivers/gpu/drm/xe/xe_tuning.c       | 5 +++++
>  2 files changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 282afd22b68b..da833a147c0c 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -365,10 +365,13 @@
>  #define FORCEWAKE_MEDIA_VEBOX(n)		XE_REG(0xa560 + (n) * 4)
>  #define FORCEWAKE_GSC				XE_REG(0xa618)
>  
> +/* L3 Cache Control */

Did you mean to move this comment?  This was originally intended to
refer to the "l3cc" MOCS values in the LNCFMOCS registers that people
may remember from older platforms on i915.  Even though 0xb004 is also
doing L3-related stuff, it's not providing the specific l3cc values the
comment here was originally written for.

I'd be inclined to just drop the comment completely at this point; I'm
not sure it's really providing any useful insight to anyone.

Anyway, the actual tuning looks correct, so aside from the comment,

        Reviewed-by: Matt Roper <matthew.d.roper@intel.com>


Matt

> +#define XELP_GARBCNTL				XE_REG(0xb004)
> +#define   XELP_BUS_HASH_CTL_BIT_EXC		REG_BIT(7)
> +
>  #define XEHPC_LNCFMISCCFGREG0			XE_REG_MCR(0xb01c, XE_REG_OPTION_MASKED)
>  #define   XEHPC_OVRLSCCC			REG_BIT(0)
>  
> -/* L3 Cache Control */
>  #define LNCFCMOCS_REG_COUNT			32
>  #define XELP_LNCFCMOCS(i)			XE_REG(0xb020 + (i) * 4)
>  #define XEHP_LNCFCMOCS(i)			XE_REG_MCR(0xb020 + (i) * 4)
> diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
> index 3c78f3d71559..551c2f308e1c 100644
> --- a/drivers/gpu/drm/xe/xe_tuning.c
> +++ b/drivers/gpu/drm/xe/xe_tuning.c
> @@ -88,6 +88,11 @@ static const struct xe_rtp_entry_sr gt_tunings[] = {
>  };
>  
>  static const struct xe_rtp_entry_sr engine_tunings[] = {
> +	{ XE_RTP_NAME("Tuning: L3 Hashing Mask"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210),
> +		       FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_ACTIONS(CLR(XELP_GARBCNTL, XELP_BUS_HASH_CTL_BIT_EXC))
> +	},
>  	{ XE_RTP_NAME("Tuning: Set Indirect State Override"),
>  	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1274),
>  		       ENGINE_CLASS(RENDER)),
> -- 
> 2.48.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
