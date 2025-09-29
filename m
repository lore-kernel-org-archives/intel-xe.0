Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C93BCAC5BE
	for <intel-xe@archiver.kernel.org>; Mon, 29 Sep 2025 12:31:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14C4110E234;
	Mon, 29 Sep 2025 12:31:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SMeA69it";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B75FE10E234
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Sep 2025 12:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759149076; x=1790685076;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=kr6Cow3PE0HpyluTwiAodYDZeB0rPD3r6vHBbcaSm9Y=;
 b=SMeA69it8FN4Ux2lXTeV3mtBoCjAaXkXToFWptyRS1Ozjn0t0+izAWYR
 yCmd3hCfxKMBF75wegwjLw+J/7WrDFIOYx4m8KTbVxYrhY9PZsBZsNm0s
 7TSSKPYw60d50u/KGZCNg+kjCAO1WVKhH2H3ETVDUDcfjGo914/vjjfRc
 y+wKpOpfNSIOy9wDBI1G5AIS989357wBa1RKmh1GlrXLifQZIB5p4iRwh
 zEzNXdaaxnCQnAXn8nVqoHsuf8Tv+DPRuv7owykPDeqyzkYXdflc/7e9X
 ILxkvGKm8AYlC4eK9FyYzn/B27hOlDgL+EKCo0kxobnEtZJbZNw6zD6n0 Q==;
X-CSE-ConnectionGUID: 8taZKyWmThKiP2vpyp2JRg==
X-CSE-MsgGUID: vweclYNZQAWnVwIpHlTWPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="60600103"
X-IronPort-AV: E=Sophos;i="6.18,301,1751266800"; d="scan'208";a="60600103"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 05:31:14 -0700
X-CSE-ConnectionGUID: nFCV4w0WSUiq9ji5LXyF3A==
X-CSE-MsgGUID: ZqYnBZdwQX+3U4CPtzhQxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,301,1751266800"; d="scan'208";a="182641257"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 05:31:14 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 05:31:13 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 29 Sep 2025 05:31:13 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.24) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 05:31:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fe530BRQcnup/2Mdec50vERxSjGDyb5r1r/VFaevr0hvBMsQuI4AR/dizGp6Ht8CHsquAUo4bLwewyWbimnD4ReP1o+nXssUolDoiYiImCV9iNigh19TmWTst0ILnomfgYZKwhTo+xyV9BWgOp4UgZ8TLK0lWyevwcGyHhjYKr3+veozRhkOYkB+mMIAARvqfLOWVBHrX1sMB8svmx7rV3EkQaDAUuGhzcZ34HbTn2W4mEcrOo7Y0cu5YJgnG1iaFOmmnjSQXMVAm6WUFrDtH3r6V2lQ/xLiAFIUgaAOj3e301jOSX/uBoJdRRcKUHGwwDAmDRYX7XJ0EHCmtrf1Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Trwa1H4UelCFV7bzs0Iv/iFOF7rR/hh2RqkLmWpt3u8=;
 b=OVQoxCgQMyfCTkrkRjlyeWNQ0xDPpjU7JO+u/XvoNRmjOiYapMmtyjCnIWBvBdsYytH0lF7qeRbIucbkYGMw/bVUNj3fgY2h3qpQDQrydSRV5P1Iu7npLK4WdxqJ1NSMkMuuovmZ8I1ahd8XJJSuhpl68nXq4k4k3d5LY1cOq4B20XYbTkrPsABiFrW9R2tLsD5Imd/aI5jVwuWj5Wbdv6nWeRvVyXw/+RoIjfMk1AMGsaQG4SRBa3UoAf8CDMo8zwMZYhd9dFHx+7A4+/oWvN4LJda/2QwkIx2U4gpLocPNoSI2DbTIVttmpdCG1gKRR9KZbwzMxeJNmxfLniCz3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB6470.namprd11.prod.outlook.com (2603:10b6:8:c2::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.13; Mon, 29 Sep 2025 12:31:10 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9160.014; Mon, 29 Sep 2025
 12:31:10 +0000
Date: Mon, 29 Sep 2025 05:31:08 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 16/36] drm/xe/vf: Close multi-GT GGTT shift race
Message-ID: <aNp8DPW3yvg+mwdG@lstrano-desk.jf.intel.com>
References: <20250929025542.1486303-1-matthew.brost@intel.com>
 <20250929025542.1486303-17-matthew.brost@intel.com>
 <59b3be2a-15d1-414f-91f9-cd3e0a748651@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <59b3be2a-15d1-414f-91f9-cd3e0a748651@intel.com>
X-ClientProxiedBy: MW3PR06CA0012.namprd06.prod.outlook.com
 (2603:10b6:303:2a::17) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB6470:EE_
X-MS-Office365-Filtering-Correlation-Id: 3251d6dd-051c-4745-1b51-08ddff541240
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bvkLYaWIy2yXuYjp22CIXMvb4KTzScN6n14hLzJEIOiwrglcjPcHzqzTTH5c?=
 =?us-ascii?Q?TgVjAuWO7EZVeKEx35d3k5X840lK+U3SWayfOcqFwd4xvjJTa3zTLWKGSXA2?=
 =?us-ascii?Q?1RpOSRPVpoWslI5KrqzAzAMlr+hmndf1oQYPumRIhq63M3NESugD2bNoR/of?=
 =?us-ascii?Q?s7aHrY1PSAC3e9JXa76lSGOEv26+Bu7qn+DjOv7I9lRodPfnL1Eu7+MnXy85?=
 =?us-ascii?Q?i2regYxQ1vQ37y+Y0hEZEdJAgxDnT834crQek6Uauxi5bxphimpp/we7iZfJ?=
 =?us-ascii?Q?f9XZG8Ad9YcNkc1qUMYEOGk4NJqt87Bw9JrX0Q10isqNZuJwYqJ0o0UW/8Pz?=
 =?us-ascii?Q?wj+6MKrMb81EP5AxWHl+wVtZmTd85f44bQgRmEtMMe7xGNpvA5OpgGvn70aL?=
 =?us-ascii?Q?99ZQhrQkx9jGqzGGnqYhvAGn/+gj5W/Y6u2kI4uKukmTIoI8YHya28Fw29gz?=
 =?us-ascii?Q?vhxklvyeYvkQQZ1ojTlrmKtU0yACl0AK/jKNSPPOSKoSf4p9uxN9J+1NF521?=
 =?us-ascii?Q?tQPvnmzZAbA2756wy/dbFQc1FRSBwEpL4gkTYJt+yOb8pZ1YvLc6MvbYv0wC?=
 =?us-ascii?Q?CDTqQWyvXrs8fzmQE2AW7GVAizYs51m6umgClKq/TVJWO8ggLCwUxuP0Harc?=
 =?us-ascii?Q?ibt1iihhEERVWxmJiD8b6bCAizpcIKsgzecktGwkwctbmKgy3shLpG2CNEwQ?=
 =?us-ascii?Q?7E5sfxgKGlrzWIq9u85aTj/5zIZK+kc8P+nE+nwiJBg6bBNCQ/Z8qB2gPR4+?=
 =?us-ascii?Q?EWY7r3UC8/+oItDqkq398cGEFsMHvYu3Le9a6YRzFTlTswwg4Uoz0oRF7hlg?=
 =?us-ascii?Q?P0FMh5LHFqWPt2RLqWX7uwrly7S4dsC6GL+a6nr1T8gC165l2RRYLboa6qAB?=
 =?us-ascii?Q?iWKAGFZcEYFV57M0xRwrsyfGMrbyivl0w1FAm5PvVLqovuHYQzKY1TM/HVXO?=
 =?us-ascii?Q?YwCEvhCa3/tcAa5iS4eABo/Vu8WjGxLPSHp6MOf50BeIarW1honl083+rRCx?=
 =?us-ascii?Q?jtqPQD1dhbojc7OFaUHKhl8Vp8MVlj7uNaZwV/XQgjdM45PuPscersujfnE5?=
 =?us-ascii?Q?HEwNvDQwZUjBlh8hlMVspx+hXLnQHpt0+EfSkalAAbenpSXdXP9mSYW7OFRs?=
 =?us-ascii?Q?1bzYPWYIbXYAytVM9IPy6kl3XBZ4ll0dSWjekJtYavAcIE94ZqpIkoGGGqd/?=
 =?us-ascii?Q?IofG9CLvRPCqvtLeNcfzD0B6LrteiBftujejPAE8ziSh8ooi0rOQ9Sdkfz4i?=
 =?us-ascii?Q?GX/OUlSim8YfhX1T/UlK81wBnH3NPYjzBW0hWJHfHp+21bfP9lSYNpR8Yp+l?=
 =?us-ascii?Q?xWwDw+M7yVSX05Zp0KZ3YO6ssQQj2xCIn/JW8WduRkON2KrXnNn/SUzQs/SZ?=
 =?us-ascii?Q?olyC6N+3Suih2lEOkRSvoK0/VBuAUHGffy0CJnMokFXo/mkN+g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fHtNPI3oZhbUHKx23ZQGa9G2ggav4xwlLjXQ16y4LOGIJMx0PwlBSTxNP8PK?=
 =?us-ascii?Q?NGoObpdC7blcJ5DWlL5O5mSgCc8xAkLzwszaeZ3uv2bBIDeeUzo9tDQpmTCz?=
 =?us-ascii?Q?4dZgswXDcWyvs7n3HVuhzIwR9kuoKebCVgexi/2pT4D1MHU/3PHqUuM6c2F3?=
 =?us-ascii?Q?N3kbdll3FWBqICUf2LItKO9yc5g+BOBX6LjrGy2LpMxhDlJ6o7alzs2df8ec?=
 =?us-ascii?Q?wWevn0Rr34jLRY5qVdpBO+MFe2zNP0xWYrvtZ+RTJPbwyad/NjAhTTZKcaKn?=
 =?us-ascii?Q?EVLO59+rxCyngR8IIvDPi54VYqQpKosCdgISYnvThS0qFkmOjFRPlCqea2N1?=
 =?us-ascii?Q?IB9N3B7EGzqF8iTb7SaU54kTQzW+Rpn+EfNytjzcCSPPtuWojehC4MnthGnv?=
 =?us-ascii?Q?ZrRtkE6S5khr/Fke5INQzM4hijwzG7VbzNSukynhre7o8Az7IixkIU61+meA?=
 =?us-ascii?Q?x7Pcy7jcyoFkM3OyKlKl9hPb/k8zDiT/EMYQX6ebw/BTUngwsdmQ3h5bykIu?=
 =?us-ascii?Q?aZSXElBhw1MOn6MsI3YY+ElXA4SRKc4wiZs4aCk7MtsySEVIBqJjqa8vjMUZ?=
 =?us-ascii?Q?vj6XEzj4wPHbS4qiwCRNWM2+bx3siP5JjRpAPZIeGqzZglUtc7kSB3c/F8XY?=
 =?us-ascii?Q?peWLfydwBn3Dsb7zrKC+TUlsTQjb7Yo1fC8Gwu5Royn/m7Hc1n5S8Sm/GV6S?=
 =?us-ascii?Q?dE0FpynLNCgnflp9bfd1ml5Z6rBiu2scTq+i8XaZ18CeloYPKRzpLyUnWkVP?=
 =?us-ascii?Q?dD96FYz1dvIFnzQrQ+lrdYSACOWwOVYN0X5TGR0JXiw8HrkvrRZ0onRS5fst?=
 =?us-ascii?Q?HSCsbb6FC37HCas4dzJ1cqPr45hScd/8WKAkpvEkQAyWXMGegJZaRengaTNB?=
 =?us-ascii?Q?Wzkghlt2yupUNmyI/0wkrKmBN4co7nahda9uDaS4D/fhRl2fUnrUs6W6Jhw3?=
 =?us-ascii?Q?6JhqO/qGs3iSWMARLPRu2oLkpwLDXyea/enAo7mjKAdWh/V3m+iCdsaMRp6S?=
 =?us-ascii?Q?+GhsHWIVh9TgQjaXyHgTxIaYKspY4si+t9jyXoJTgUpQ5dRoltGMNZCBn7H9?=
 =?us-ascii?Q?Wh+yP2U/LbsAca3r1YK0ei53HJja3FIGVZMdrReWpn9rBvKZrlYS/8OL4Pun?=
 =?us-ascii?Q?ujSCXKc9W7dCvXQ53goUdJx4jwizZfI2F0nzfH5jxIgfUBncA+EuUNNnOi/g?=
 =?us-ascii?Q?gjTEZ/dK6WX/vujO7qcHSSfYTUdWop9btlrPaHxH021rfNwdMP1rFRsMbQlF?=
 =?us-ascii?Q?/Vp6LkmfZ3Mc2qO/B2hvP+8iLeJnOBKJd1x4uv9bfxK7rqiis48Lor6HHPtu?=
 =?us-ascii?Q?smPyO6XYAUrAVf1pnBvps8bWJw8dSwitWGXvtiS82Sq18CKO2F9y1yb0RiSw?=
 =?us-ascii?Q?QdOn7DWv3ph91u7gzLbt34FzpvPtAtCB2VYVc0sqSJuw2XLNzq58W0TAt9Bk?=
 =?us-ascii?Q?ZvbboHJ5z9Mvb/ClznjTE2lJwp45tb7/0IqCFvCfZwjmE7VqEPoyXwl94O7F?=
 =?us-ascii?Q?MmCZ+ftc/SMe/NQCvcwwHk3DgK3TMGNB57kZxtgy5qvpLpMIYAQHoFcCxZdO?=
 =?us-ascii?Q?7q4+OqBA1GBnudengiIYKayYEkGDc7rxXnX+92vVC2kleOxZP7T5vga3KX2n?=
 =?us-ascii?Q?HQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3251d6dd-051c-4745-1b51-08ddff541240
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 12:31:10.6458 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vj/3Uu+nJwJddKkkXdv12Kj9rpYdlpFLo4S0LLcdnpR8s0vM+ZbtpXIMtglqi15XkZYgEOctz9qzYLNNW2OF8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6470
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

On Mon, Sep 29, 2025 at 10:44:07AM +0200, Michal Wajdeczko wrote:
> 
> 
> On 9/29/2025 4:55 AM, Matthew Brost wrote:
> > As multi-GT VF post-migration recovery can run in parallel on different
> > workqueues, but both GTs point to the same GGTT, only one GT needs to
> > shift the GGTT. However, both GTs need to know when this step has
> > completed. To coordinate this, share the VF config lock among all GTs
> > that share a GGTT, and perform the GGTT shift under this lock. With
> > shift being done under the lock, storing the shift value becomes
> > unnecessary.
> 
> maybe better (and more natural) option would be to move VF GGTT config
> from GT (xe_gt_sriov_vf_config) to Tile (xe_tile_sriov_vf_config) ? 
> 
> and protect it there with single lock also defined there ?
> 
> I'm doing similar changes on the PF provisioning side...
> 

Yes, that is a better place. I was just being a bit lazy, but I can fix
this one way or another in the next revision.

I think we need to answer why the config lock [1] needs to protect more
than just the GGTT. If only the GGTT needs protection, we might be able
to move the entire GGTT config lookup + shift under the GGTT lock. That
might be considered a bit of a layering violation, but if we could
export a well-defined GGTT lock helper, it could help mitigate any
layering concerns.

[1] https://patchwork.freedesktop.org/patch/677296/?series=154627&rev=3

> > 
> > v3:
> >  - Update commmit message (Tomasz)
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 95 +++++++++--------------
> >  drivers/gpu/drm/xe/xe_gt_sriov_vf.h       |  3 +-
> >  drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h | 11 ++-
> >  drivers/gpu/drm/xe/xe_guc.c               |  2 +-
> >  drivers/gpu/drm/xe/xe_tile_sriov_vf.c     |  6 +-
> >  drivers/gpu/drm/xe/xe_tile_sriov_vf.h     |  1 -
> >  6 files changed, 51 insertions(+), 67 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > index 6f15619efe01..ad1d63b5b8d1 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > @@ -436,16 +436,19 @@ u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt)
> >  	return value;
> >  }
> >  
> > -static int vf_get_ggtt_info(struct xe_gt *gt)
> > +static int vf_get_ggtt_info(struct xe_gt *gt, bool recovery)
> >  {
> >  	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
> > +	struct xe_gt_sriov_vf_selfconfig *primary_config =
> > +		&gt_to_tile(gt)->primary_gt->sriov.vf.self_config;
> >  	struct xe_guc *guc = &gt->uc.guc;
> >  	u64 start, size;
> > +	s64 shift;
> >  	int err;
> >  
> >  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> >  
> > -	down_write(&config->lock);
> > +	down_write(config->lock);
> >  
> >  	err = guc_action_query_single_klv64(guc, GUC_KLV_VF_CFG_GGTT_START_KEY, &start);
> >  	if (unlikely(err))
> > @@ -465,13 +468,17 @@ static int vf_get_ggtt_info(struct xe_gt *gt)
> >  	xe_gt_sriov_dbg_verbose(gt, "GGTT %#llx-%#llx = %lluK\n",
> >  				start, start + size - 1, size / SZ_1K);
> >  
> > -	config->ggtt_shift = start - (s64)config->ggtt_base;
> > +	shift = start - (s64)primary_config->ggtt_base;
> >  	config->ggtt_base = start;
> >  	config->ggtt_size = size;
> > +	if (recovery)
> > +		primary_config->ggtt_base = start;
> >  	err = config->ggtt_size ? 0 : -ENODATA;
> >  
> > +	if (!err && shift && recovery)
> > +		xe_tile_sriov_vf_fixup_ggtt_nodes(gt_to_tile(gt), shift);
> >  out:
> > -	up_write(&config->lock);
> > +	up_write(config->lock);
> >  	return err;
> >  }
> >  
> > @@ -485,7 +492,7 @@ static int vf_get_lmem_info(struct xe_gt *gt)
> >  
> >  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> >  
> > -	down_write(&config->lock);
> > +	down_write(config->lock);
> >  
> >  	err = guc_action_query_single_klv64(guc, GUC_KLV_VF_CFG_LMEM_SIZE_KEY, &size);
> >  	if (unlikely(err))
> > @@ -505,7 +512,7 @@ static int vf_get_lmem_info(struct xe_gt *gt)
> >  	err = config->lmem_size ? 0 : -ENODATA;
> >  
> >  out:
> > -	up_write(&config->lock);
> > +	up_write(config->lock);
> >  	return err;
> >  }
> >  
> > @@ -518,7 +525,7 @@ static int vf_get_submission_cfg(struct xe_gt *gt)
> >  
> >  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> >  
> > -	down_write(&config->lock);
> > +	down_write(config->lock);
> >  
> >  	err = guc_action_query_single_klv32(guc, GUC_KLV_VF_CFG_NUM_CONTEXTS_KEY, &num_ctxs);
> >  	if (unlikely(err))
> > @@ -549,7 +556,7 @@ static int vf_get_submission_cfg(struct xe_gt *gt)
> >  	err = config->num_ctxs ? 0 : -ENODATA;
> >  
> >  out:
> > -	up_write(&config->lock);
> > +	up_write(config->lock);
> >  	return err;
> >  }
> >  
> > @@ -564,17 +571,18 @@ static void vf_cache_gmdid(struct xe_gt *gt)
> >  /**
> >   * xe_gt_sriov_vf_query_config - Query SR-IOV config data over MMIO.
> >   * @gt: the &xe_gt
> > + * @recovery: VF post migration recovery path
> >   *
> >   * This function is for VF use only.
> >   *
> >   * Return: 0 on success or a negative error code on failure.
> >   */
> > -int xe_gt_sriov_vf_query_config(struct xe_gt *gt)
> > +int xe_gt_sriov_vf_query_config(struct xe_gt *gt, bool recovery)
> >  {
> >  	struct xe_device *xe = gt_to_xe(gt);
> >  	int err;
> >  
> > -	err = vf_get_ggtt_info(gt);
> > +	err = vf_get_ggtt_info(gt, recovery);
> >  	if (unlikely(err))
> >  		return err;
> >  
> > @@ -610,10 +618,10 @@ u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt)
> >  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> >  	xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
> >  
> > -	down_read(&config->lock);
> > +	down_read(config->lock);
> >  	xe_gt_assert(gt, config->num_ctxs);
> >  	val = config->num_ctxs;
> > -	up_read(&config->lock);
> > +	up_read(config->lock);
> >  
> >  	return val;
> >  }
> > @@ -634,10 +642,10 @@ u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt)
> >  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> >  	xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
> >  
> > -	down_read(&config->lock);
> > +	down_read(config->lock);
> >  	xe_gt_assert(gt, config->lmem_size);
> >  	val = config->lmem_size;
> > -	up_read(&config->lock);
> > +	up_read(config->lock);
> >  
> >  	return val;
> >  }
> > @@ -656,11 +664,9 @@ u64 xe_gt_sriov_vf_ggtt(struct xe_gt *gt)
> >  	u64 val;
> >  
> >  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> > -	xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
> > +	lockdep_assert_held(config->lock);
> >  
> > -	down_read(&config->lock);
> >  	val = config->ggtt_size;
> > -	up_read(&config->lock);
> >  
> >  	return val;
> >  }
> > @@ -680,34 +686,10 @@ u64 xe_gt_sriov_vf_ggtt_base(struct xe_gt *gt)
> >  
> >  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> >  	xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
> > -
> > -	down_read(&config->lock);
> >  	xe_gt_assert(gt, config->ggtt_size);
> > -	val = config->ggtt_base;
> > -	up_read(&config->lock);
> > -
> > -	return val;
> > -}
> > +	lockdep_assert_held(config->lock);
> >  
> > -/**
> > - * xe_gt_sriov_vf_ggtt_shift - Return shift in GGTT range due to VF migration
> > - * @gt: the &xe_gt struct instance
> > - *
> > - * This function is for VF use only.
> > - *
> > - * Return: The shift value; could be negative
> > - */
> > -s64 xe_gt_sriov_vf_ggtt_shift(struct xe_gt *gt)
> > -{
> > -	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
> > -	s64 val;
> > -
> > -	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> > -	xe_gt_assert(gt, xe_gt_is_main_type(gt));
> > -
> > -	down_read(&config->lock);
> > -	val = config->ggtt_shift;
> > -	up_read(&config->lock);
> > +	val = config->ggtt_base;
> >  
> >  	return val;
> >  }
> > @@ -1115,7 +1097,7 @@ void xe_gt_sriov_vf_print_config(struct xe_gt *gt, struct drm_printer *p)
> >  
> >  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> >  
> > -	down_read(&config->lock);
> > +	down_read(config->lock);
> >  	drm_printf(p, "GGTT range:\t%#llx-%#llx\n",
> >  		   config->ggtt_base,
> >  		   config->ggtt_base + config->ggtt_size - 1);
> > @@ -1123,8 +1105,6 @@ void xe_gt_sriov_vf_print_config(struct xe_gt *gt, struct drm_printer *p)
> >  	string_get_size(config->ggtt_size, 1, STRING_UNITS_2, buf, sizeof(buf));
> >  	drm_printf(p, "GGTT size:\t%llu (%s)\n", config->ggtt_size, buf);
> >  
> > -	drm_printf(p, "GGTT shift on last restore:\t%lld\n", config->ggtt_shift);
> > -
> >  	if (IS_DGFX(xe) && xe_gt_is_main_type(gt)) {
> >  		string_get_size(config->lmem_size, 1, STRING_UNITS_2, buf, sizeof(buf));
> >  		drm_printf(p, "LMEM size:\t%llu (%s)\n", config->lmem_size, buf);
> > @@ -1132,7 +1112,7 @@ void xe_gt_sriov_vf_print_config(struct xe_gt *gt, struct drm_printer *p)
> >  
> >  	drm_printf(p, "GuC contexts:\t%u\n", config->num_ctxs);
> >  	drm_printf(p, "GuC doorbells:\t%u\n", config->num_dbs);
> > -	up_read(&config->lock);
> > +	up_read(config->lock);
> >  }
> >  
> >  /**
> > @@ -1215,21 +1195,16 @@ static size_t post_migration_scratch_size(struct xe_device *xe)
> >  static int vf_post_migration_fixups(struct xe_gt *gt)
> >  {
> >  	void *buf = gt->sriov.vf.migration.scratch;
> > -	s64 shift;
> >  	int err;
> >  
> > -	err = xe_gt_sriov_vf_query_config(gt);
> > +	err = xe_gt_sriov_vf_query_config(gt, true);
> >  	if (err)
> >  		return err;
> >  
> > -	shift = xe_gt_sriov_vf_ggtt_shift(gt);
> > -	if (shift) {
> > -		xe_tile_sriov_vf_fixup_ggtt_nodes(gt_to_tile(gt), shift);
> > -		xe_gt_sriov_vf_default_lrcs_hwsp_rebase(gt);
> > -		err = xe_guc_contexts_hwsp_rebase(&gt->uc.guc, buf);
> > -		if (err)
> > -			return err;
> > -	}
> > +	xe_gt_sriov_vf_default_lrcs_hwsp_rebase(gt);
> > +	err = xe_guc_contexts_hwsp_rebase(&gt->uc.guc, buf);
> > +	if (err)
> > +		return err;
> >  
> >  	return 0;
> >  }
> > @@ -1316,6 +1291,7 @@ static void migration_worker_func(struct work_struct *w)
> >   */
> >  int xe_gt_sriov_vf_init_early(struct xe_gt *gt)
> >  {
> > +	struct xe_tile *tile = gt_to_tile(gt);
> >  	void *buf;
> >  
> >  	if (!xe_sriov_vf_migration_supported(gt_to_xe(gt)))
> > @@ -1328,7 +1304,10 @@ int xe_gt_sriov_vf_init_early(struct xe_gt *gt)
> >  		return -ENOMEM;
> >  
> >  	gt->sriov.vf.migration.scratch = buf;
> > -	init_rwsem(&gt->sriov.vf.self_config.lock);
> > +	if (xe_gt_is_main_type(gt))
> > +		init_rwsem(&gt->sriov.vf.self_config.__lock);
> > +	gt->sriov.vf.self_config.lock =
> > +		&tile->primary_gt->sriov.vf.self_config.__lock;
> >  	spin_lock_init(&gt->sriov.vf.migration.lock);
> >  	INIT_WORK(&gt->sriov.vf.migration.worker, migration_worker_func);
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> > index 0b0f2a30e67c..ff3a0ce608cd 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> > @@ -18,7 +18,7 @@ int xe_gt_sriov_vf_bootstrap(struct xe_gt *gt);
> >  void xe_gt_sriov_vf_guc_versions(struct xe_gt *gt,
> >  				 struct xe_uc_fw_version *wanted,
> >  				 struct xe_uc_fw_version *found);
> > -int xe_gt_sriov_vf_query_config(struct xe_gt *gt);
> > +int xe_gt_sriov_vf_query_config(struct xe_gt *gt, bool recovery);
> >  int xe_gt_sriov_vf_connect(struct xe_gt *gt);
> >  int xe_gt_sriov_vf_query_runtime(struct xe_gt *gt);
> >  void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt);
> > @@ -31,7 +31,6 @@ u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt);
> >  u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt);
> >  u64 xe_gt_sriov_vf_ggtt(struct xe_gt *gt);
> >  u64 xe_gt_sriov_vf_ggtt_base(struct xe_gt *gt);
> > -s64 xe_gt_sriov_vf_ggtt_shift(struct xe_gt *gt);
> >  
> >  u32 xe_gt_sriov_vf_read32(struct xe_gt *gt, struct xe_reg reg);
> >  void xe_gt_sriov_vf_write32(struct xe_gt *gt, struct xe_reg reg, u32 val);
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> > index a63b6004b0b7..6cbf8291a5ab 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> > @@ -19,16 +19,19 @@ struct xe_gt_sriov_vf_selfconfig {
> >  	u64 ggtt_base;
> >  	/** @ggtt_size: assigned size of the GGTT region. */
> >  	u64 ggtt_size;
> > -	/** @ggtt_shift: difference in ggtt_base on last migration */
> > -	s64 ggtt_shift;
> >  	/** @lmem_size: assigned size of the LMEM. */
> >  	u64 lmem_size;
> >  	/** @num_ctxs: assigned number of GuC submission context IDs. */
> >  	u16 num_ctxs;
> >  	/** @num_dbs: assigned number of GuC doorbells IDs. */
> >  	u16 num_dbs;
> > -	/** @lock: lock for protecting access to all selfconfig fields. */
> > -	struct rw_semaphore lock;
> > +	/** @__lock: lock for protecting access to all selfconfig fields. */
> > +	struct rw_semaphore __lock;
> > +	/**
> > +	 * @lock: pointer to lock for protecting access to all selfconfig
> > +	 * fields, all GTs point to primary GT.
> > +	 */
> > +	struct rw_semaphore *lock;
> 
> this could be placed in tile.sriov.vf
> 
> >  };
> >  
> >  /**
> > diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> > index d5adbbb013ec..c016a11b6ab1 100644
> > --- a/drivers/gpu/drm/xe/xe_guc.c
> > +++ b/drivers/gpu/drm/xe/xe_guc.c
> > @@ -713,7 +713,7 @@ static int vf_guc_init_noalloc(struct xe_guc *guc)
> >  	if (err)
> >  		return err;
> >  
> > -	err = xe_gt_sriov_vf_query_config(gt);
> > +	err = xe_gt_sriov_vf_query_config(gt, false);
> >  	if (err)
> >  		return err;
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_tile_sriov_vf.c b/drivers/gpu/drm/xe/xe_tile_sriov_vf.c
> > index f221dbed16f0..dc6221fc0520 100644
> > --- a/drivers/gpu/drm/xe/xe_tile_sriov_vf.c
> > +++ b/drivers/gpu/drm/xe/xe_tile_sriov_vf.c
> > @@ -40,7 +40,7 @@ static int vf_init_ggtt_balloons(struct xe_tile *tile)
> >   *
> >   * Return: 0 on success or a negative error code on failure.
> >   */
> > -int xe_tile_sriov_vf_balloon_ggtt_locked(struct xe_tile *tile)
> > +static int xe_tile_sriov_vf_balloon_ggtt_locked(struct xe_tile *tile)
> >  {
> >  	u64 ggtt_base = xe_gt_sriov_vf_ggtt_base(tile->primary_gt);
> >  	u64 ggtt_size = xe_gt_sriov_vf_ggtt(tile->primary_gt);
> > @@ -100,12 +100,16 @@ int xe_tile_sriov_vf_balloon_ggtt_locked(struct xe_tile *tile)
> >  
> >  static int vf_balloon_ggtt(struct xe_tile *tile)
> >  {
> > +	struct xe_gt_sriov_vf_selfconfig *config =
> > +		&tile->primary_gt->sriov.vf.self_config;
> 
> with GGTT (and its lock) stored at tile level we will not be forced
> to look at the primary-gt any more
> 

See above, for my response to both subsequent replies.

Matt

> 
> >  	struct xe_ggtt *ggtt = tile->mem.ggtt;
> >  	int err;
> >  
> > +	down_read(config->lock);
> >  	mutex_lock(&ggtt->lock);
> >  	err = xe_tile_sriov_vf_balloon_ggtt_locked(tile);
> >  	mutex_unlock(&ggtt->lock);
> > +	up_read(config->lock);
> >  
> >  	return err;
> >  }
> > diff --git a/drivers/gpu/drm/xe/xe_tile_sriov_vf.h b/drivers/gpu/drm/xe/xe_tile_sriov_vf.h
> > index 93eb043171e8..4ee68d1fb28e 100644
> > --- a/drivers/gpu/drm/xe/xe_tile_sriov_vf.h
> > +++ b/drivers/gpu/drm/xe/xe_tile_sriov_vf.h
> > @@ -11,7 +11,6 @@
> >  struct xe_tile;
> >  
> >  int xe_tile_sriov_vf_prepare_ggtt(struct xe_tile *tile);
> > -int xe_tile_sriov_vf_balloon_ggtt_locked(struct xe_tile *tile);
> >  void xe_tile_sriov_vf_deballoon_ggtt_locked(struct xe_tile *tile);
> >  void xe_tile_sriov_vf_fixup_ggtt_nodes(struct xe_tile *tile, s64 shift);
> >  
> 
