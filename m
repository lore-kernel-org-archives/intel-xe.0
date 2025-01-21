Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A377AC02182
	for <intel-xe@archiver.kernel.org>; Tue, 21 Jan 2025 13:49:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7569810E0FE;
	Tue, 21 Jan 2025 13:49:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oGsxt1V7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACCFD10E0FE
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Jan 2025 13:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737467379; x=1769003379;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=IZRHOgY7jaDQj/F4xVwcA/HSf7QYdkVQSjIM3C4N/rE=;
 b=oGsxt1V7M3xzcJHZ/zbCCCKcgn84VXc2s3jx7Otb9bHoCdKO5qA0EJQ6
 kY2Sm/uILYV1M3ctJBUvHstAec0o+LKNeeU1Bqs/+6xB7sE5nP6uIp8gg
 e+JI/lqp0tIFZFdrfCfiPMtCkbdRp2Gp5GJeg7ENAOnY4SesI6LiAg4xV
 NEgkx+iUOAiMXuC+Y+kW3zIn7ivqaItrhFcUkqLfiwecT3/TBXHRMFs4q
 2zUJsbX1cXg222x8FKgLzuiUzBNfWf2v/9EgHIrx14SDqnSuobApngjyJ
 /CzJric5K8jox6XVR+vHXP2KREgwggSLptGv0lVc/9Nw+WqTMcDG+8LYZ Q==;
X-CSE-ConnectionGUID: lCONJjTCTCaYdL6+CCz3eA==
X-CSE-MsgGUID: ajCVjjg2QPSci6clU1DZMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="25478769"
X-IronPort-AV: E=Sophos;i="6.13,222,1732608000"; d="scan'208";a="25478769"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2025 05:49:39 -0800
X-CSE-ConnectionGUID: bT5+oFhHRkWwuBgE43s5Eg==
X-CSE-MsgGUID: Hi6X2UnETUiYN7/SWBO/jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,222,1732608000"; d="scan'208";a="106736320"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Jan 2025 05:49:39 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 21 Jan 2025 05:49:38 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 21 Jan 2025 05:49:38 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 21 Jan 2025 05:49:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hC3IC7YYUerQMOVCE4FAEpSDx6RHl9RFbYwlhjukHO8SBg52gl1WID54uL/kSLK0qYhLtU5UVvfzk0leeLTVc3x1cNVoRvtoasuIyRfrsCnrc1NSpOPi4jC9f14iFZemDpOqMq5mMWqGbwCt8yKoBD/nc2eGFT+UyrqtY5wULH84jjQF8R+zmMKlEDsuhpMYaIykWFMvCt4CgIeSjFC7Oh1Mjv7+5bh/8Q2hnDTCDYu6yi4vftA/1Qug6GaoY4z/l0fzV9GByMlOBQLTKXL1b+Wa982KODkas7MEJBgwx01morkHYaKvguRQq0A0juE49WzvhCoBWBjGIvqnGzDdrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uY9ZzuHJUfdx+DPJiuc2PFdH4d0H3Ec/5BBUGxnpSRU=;
 b=OLwuqRr/AAcEz1IBU8Y7fPIN2JsFOq2pnpQpcqQRQjqqvQUB4ZJselfvGLJN0lwIjyXTH6YpyMde7yNyBYABJjmmAeN7UdHmZOzhYwYyS4rZFyAo1FlC2yChE7s/ntnfPaK4asEkRDMj6H3MRO8TmscJJq2FtWEHZ5XnMQvXjnb2hn+FU5kiMrsF0HxHvfPV3tdH38WUitsaQX0FshPHCWd99J0XcyfCFa5lWlMSrbTWFbdsaJwa7tdeW4/doXpMpwtFS3mnUWpZHrMKCIL+3vP2a4Ww76TZnd1zfMiLIKG55UWE6jy7vbkVTSKVA4A80+2CWziZHvRFkSJ7/MeRxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7SPRMB0046.namprd11.prod.outlook.com (2603:10b6:510:1f6::20)
 by PH0PR11MB7165.namprd11.prod.outlook.com (2603:10b6:510:1e9::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.16; Tue, 21 Jan
 2025 13:48:56 +0000
Received: from PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc]) by PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc%6]) with mapi id 15.20.8356.020; Tue, 21 Jan 2025
 13:48:56 +0000
Date: Tue, 21 Jan 2025 08:48:53 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Stephen Rothwell" <sfr@canb.auug.org.au>
Subject: Re: [PATCH] drm/xe/uapi: Fix documentation indentation
Message-ID: <Z4-lxVMgxFlO6S6H@intel.com>
References: <20250117193827.91779-1-rodrigo.vivi@intel.com>
 <SJ1PR11MB62046663BBD6AC02759BA18681E72@SJ1PR11MB6204.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <SJ1PR11MB62046663BBD6AC02759BA18681E72@SJ1PR11MB6204.namprd11.prod.outlook.com>
X-ClientProxiedBy: MW4PR04CA0182.namprd04.prod.outlook.com
 (2603:10b6:303:86::7) To PH7SPRMB0046.namprd11.prod.outlook.com
 (2603:10b6:510:1f6::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7SPRMB0046:EE_|PH0PR11MB7165:EE_
X-MS-Office365-Filtering-Correlation-Id: 21336303-fe80-4ca1-78a7-08dd3a22594f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XHBPKYY3661DRF6L4V9GEhrC04up4yw06RVRecg+yHNHU3+JLpual/nRGMUT?=
 =?us-ascii?Q?1K9fwFfzgbWwJ4tfwEX0TBuBHLWJiihiYcpb1lFUZ1pVXfwDybMMqdxb0BE8?=
 =?us-ascii?Q?W4etj9TEIcW50mB4AmwvIq78ELM9YjCfKOMe6qkfmY85EdUZ3Bs4tQUhGZpD?=
 =?us-ascii?Q?Yb5UZT8xOc4JuQ+5QY5PkxicESFz8ePyMYe2L27uQvzfn8jNvDB4UcYdcsE5?=
 =?us-ascii?Q?iRvGmYI0nulQvh7pcvsveSxXUs9KVcPJ20ALDfAHqLFvXU5wOeWv2AEfVKc+?=
 =?us-ascii?Q?NEqvc5qelU0brDVNoz+GPoODJKpA+HVzmrQrShCVi1qQyu0OnoITfl0kDWi3?=
 =?us-ascii?Q?yKA2czbOsyWBRWuL0YKezzluYrjYDLLTwD6v+tYeiTlmnr69MiRGOr6LK7zk?=
 =?us-ascii?Q?b7hAZXfSs1ARdhHB7XSvFCmNBhcNyxJJquFyxVq+P+35KN9YGkeE3TYNLLpo?=
 =?us-ascii?Q?k+2PwJGvAkN9CNCXYKcGqlbzLz4soKMfOoGdXLsFNxCV/ZbC2QJ1bqSx4v5w?=
 =?us-ascii?Q?ASfA19e/6+Hjuzr266weELSMKXirswDKZxSbKnYm3IdEWexZhsevAe/4xVk9?=
 =?us-ascii?Q?Twx4ISsGbtP0PjnLxJ1+D0xHcabfwGJRC5ZYyLMWrueHcOldvhACVPCpQcuH?=
 =?us-ascii?Q?9wh8FdKgwf3ZTBcUZ1vTisRfUTVTjrSp2fLU1wlxP0JZRJeeKPgz2N1QVxom?=
 =?us-ascii?Q?OAO+F08Rdr8wDou9oW65LTpJsy/ePP2606jZglZ6aFlPLXS/jP0IxRO2/OEO?=
 =?us-ascii?Q?QxLjOz/8EzBF01q6Yrie9zDLnFD+VvaLrS13AkOHS5aJ7Jbs2JdJQ3LAxV/w?=
 =?us-ascii?Q?gF6lW6FCcD1650LwQkaEWCuxpUuXwevMkUA+STZJb8zkn5/QP7kHCvDkEGXX?=
 =?us-ascii?Q?4uZrSNUo7Q4C5cis4uEi0V/ybyJ5xzlq21ltrterpB2osjiw4Fb1LbbldvvK?=
 =?us-ascii?Q?bR6TDhCj4HjeYVuwAITjaYp48GUbUG4oWr+hBdk8U5RJ16hzM2z3oclPPqaa?=
 =?us-ascii?Q?6O54cxm5JbKBItisFllfoiln+EQzYhNEJ8loP44kBSnzVsM8LR8KWmjXQ9wt?=
 =?us-ascii?Q?1e04daIMM9S3mr3BtD/8uTxhSi7+Cy5o+755W7Hn38G7lCmH72wdk1H339eN?=
 =?us-ascii?Q?rAXql+DJOCZY46pru6B/ISXgOO5t1Ruz+TgKps894RMVaUv5dv6wV+aR1z82?=
 =?us-ascii?Q?QcsHBFe4UBlBMGxStjMgGish4W7E+HQ6b29nps1qgfRF3OUVApOQ7+DcY2UI?=
 =?us-ascii?Q?PnDiy+81YzhEUJVSPLPAWSkn/YaQO6aGd3l6JnlcihGYY0ctiUkMjSkyhn88?=
 =?us-ascii?Q?+5Sn8o7MTmYj8ZDmPzHrj5pgBwKu49KpOaqsUXRQxa+n0A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7SPRMB0046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OPc9hLxThvlONEt1qlKmcrihueR4Miy4iKHaUq8OutAorv5PM1VliRayS0Zt?=
 =?us-ascii?Q?ZF7CCE8DJMN4uMtJ/KGrVPMc2VQzwTWZ/XoCYvCBFertRD38/FWEvytjI6WL?=
 =?us-ascii?Q?4SfPPHhTpGH6RKhHHu6qniiSTUK620zP6o5ukok331DCzr2sCPS3sCFzFG1a?=
 =?us-ascii?Q?NSASLwhDcgNGvuB320mlnlAJX42Wv2Ki10u/QYAI6CNLyE7vFS9qQrqrFwLF?=
 =?us-ascii?Q?c+sgsnbljoY1fBsvHH54vnS7owb181FNMvHE9Sw0MmNL33D6oJd+8MUngbDf?=
 =?us-ascii?Q?MrvDXe7RHXR6kq8n9duBfM7woy342ifVE7yKv4oUDM16E8X7MBFD5+l9auK7?=
 =?us-ascii?Q?wxkiQeuh7csDv4FUq6p2p1tcmZVy0jyn3LhfY5MnArIl3ah3Qw/FdSWxf5g/?=
 =?us-ascii?Q?XqmFtWHObUplsFZx/5aa7Q3tTpbu+1tzHduFFlNO/BHad88EBOYYNeg+46mF?=
 =?us-ascii?Q?26iCTRtBkRXElyp9BG+LGhnko4l/xgEnbBLGsRolaqzucrtVjL5Z3gh4rLGd?=
 =?us-ascii?Q?i9eFBZMrUbB9p90R0YbLz8QT6Fo7cSF7439zP6qLEcB8S6vpWT0EVtWxj84z?=
 =?us-ascii?Q?xgX3d5zqOVxK0j7eX7dAJrCzJ/mzuyemHMWtZ42HQiSHFM93/2t4tDIwkmSp?=
 =?us-ascii?Q?3BH404hPSKaFllvDRze8YnuB5Dscd7IN+9IAjiLU7YczGi2ZuN+Pub1cyTO5?=
 =?us-ascii?Q?ZynRf6ZmwOST6zaNDupLMp2QpaGisSHmfG9uL8kHOWosKOH9sIi4oaAskgMX?=
 =?us-ascii?Q?0x2fdTVF/+8Jg0bA3jTtFi2PdDXoJxhs7GKTTMu8bf/t7pwAQyyU4tSITXAS?=
 =?us-ascii?Q?DQbU5Jukl32a7bpeqVr01B6J/cR32rM5TB73O29pJzFeGB5eQPlsn9wg7Uyt?=
 =?us-ascii?Q?BvQiw+uY8dZITK+Q0Mli6QhDOKwtwMyUYWVcSIXJ0pcBpJ6QKYh4bAEEENGg?=
 =?us-ascii?Q?a+q3C5Bp4haMkCgI4WTyxBQSpxxnadoYjnHT/B55+rVer7dn1hfjmhOxqm1C?=
 =?us-ascii?Q?IM3WW7+3LQClKg5Ta7vMKVJEFISPhkXVD/cjE0seGA82xRWn2wtMwUXr8T7h?=
 =?us-ascii?Q?LAWXw0o75A91MouCHbZvsf6VOigHv9N7yqXEHo7Zwkb+ItVSMPgLr/qS66UX?=
 =?us-ascii?Q?0INM+168cv9oWn3zLarZhggT0RAqSfQIjdDt8rfWCEElDZhy7d3wr1wxp/U2?=
 =?us-ascii?Q?1wUVjbPeLInBfoAx6F95XTkGFOH2Gvm5ExqpSvw6TTio3nFbrE89mBLg4+rh?=
 =?us-ascii?Q?li8b2DHH7lmsZ5042E+vy7OJ4aetTMgV/JA4aFXPgnVqmoYEleoLjBVS3N2E?=
 =?us-ascii?Q?acBAMnC2u9gIHAG+mBrdcvwwnOUqBfNFe96ECzD0SJyPzJ2M4B2jhlqS3Ehs?=
 =?us-ascii?Q?WdWKy2styCneVVVnEwTYWgCsQ5qr09u7U6pj/R3V+z/liDYKJsYkDyLbe7j+?=
 =?us-ascii?Q?uFmn+C30b0YeFIPwupWguHcPSg14UT+MzSIIrnCDjs3PHMcODoiqyBnbjUmW?=
 =?us-ascii?Q?nPBduswnDgktGLI7ax8qYkPqpra7OGUsUIXUIyDzasgX6PU7Kmkx5QrGeEJj?=
 =?us-ascii?Q?05tV+UceL16XeIWn1y2UbEtjhhT+gmdIJMkQqSRfXhJOboZi2DKyMF18Rvtf?=
 =?us-ascii?Q?kg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 21336303-fe80-4ca1-78a7-08dd3a22594f
X-MS-Exchange-CrossTenant-AuthSource: PH7SPRMB0046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2025 13:48:56.0296 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EjAReMpGOXlxyCYxKlBd9djLij4Rn/3muRHHjIgNnh/ksNGgT5v3F4pTiyRutrAqrh23xu3V6oEt0SQAmIDZrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7165
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

On Mon, Jan 20, 2025 at 03:28:07AM +0000, Upadhyay, Tejas wrote:
> 
> 
> > -----Original Message-----
> > From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> > Sent: Saturday, January 18, 2025 1:08 AM
> > To: intel-xe@lists.freedesktop.org
> > Cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>; Stephen Rothwell
> > <sfr@canb.auug.org.au>; Upadhyay, Tejas <tejas.upadhyay@intel.com>
> > Subject: [PATCH] drm/xe/uapi: Fix documentation indentation
> > 
> > Fix these issues:
> > 
> > Documentation/gpu/driver-uapi:29: include/uapi/drm/xe_drm.h:817:
> > WARNING:
> > +Bullet list ends without a blank line; unexpected unindent.
> > Documentation/gpu/driver-uapi:29: include/uapi/drm/xe_drm.h:835:
> > WARNING:
> > +Definition list ends without a blank line; unexpected unindent.
> 
> Unfortunately none of these showed up in checkpatch or with strict option as well. Nevertheless 
> Change Looks fine to me,

Yeap, my emacs' magit automatically broke the fixes tag to respect the column
limits.
I was planning to fix that while pushing the patch, but b4 automagically fixed
that for me! o.O

> 
> Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

thanks, pushed to drm-xe-next...

> 
> Tejas
> > 
> > Fixes: 75d37750a753 ("drm/xe/mmap: Add mmap support for PCI memory
> > barrier")
> > Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > Closes: https://lore.kernel.org/intel-
> > xe/20250117164023.3fdc00b9@canb.auug.org.au/
> > Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > ---
> >  include/uapi/drm/xe_drm.h | 36 ++++++++++++++++++------------------
> >  1 file changed, 18 insertions(+), 18 deletions(-)
> > 
> > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h index
> > cac607a30f6d..e2160330ad01 100644
> > --- a/include/uapi/drm/xe_drm.h
> > +++ b/include/uapi/drm/xe_drm.h
> > @@ -814,29 +814,29 @@ struct drm_xe_gem_create {
> >   *
> >   * The @flags can be:
> >   *  - %DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER - For user to query
> > special offset
> > - *  for use in mmap ioctl. Writing to the returned mmap address will generate
> > a
> > - *  PCI memory barrier with low overhead (avoiding IOCTL call as well as
> > writing
> > - *  to VRAM which would also add overhead), acting like an MI_MEM_FENCE
> > - *  instruction.
> > + *    for use in mmap ioctl. Writing to the returned mmap address will
> > generate a
> > + *    PCI memory barrier with low overhead (avoiding IOCTL call as well as
> > writing
> > + *    to VRAM which would also add overhead), acting like an
> > MI_MEM_FENCE
> > + *    instruction.
> >   *
> > - *  Note: The mmap size can be at most 4K, due to HW limitations. As a result
> > - *  this interface is only supported on CPU architectures that support 4K page
> > - *  size. The mmap_offset ioctl will detect this and gracefully return an
> > - *  error, where userspace is expected to have a different fallback method for
> > - *  triggering a barrier.
> > + * Note: The mmap size can be at most 4K, due to HW limitations. As a
> > + result
> > + * this interface is only supported on CPU architectures that support
> > + 4K page
> > + * size. The mmap_offset ioctl will detect this and gracefully return
> > + an
> > + * error, where userspace is expected to have a different fallback
> > + method for
> > + * triggering a barrier.
> >   *
> > - *  Roughly the usage would be as follows:
> > + * Roughly the usage would be as follows:
> >   *
> > - *  .. code-block:: C
> > + * .. code-block:: C
> >   *
> > - *  struct drm_xe_gem_mmap_offset mmo = {
> > - *	.handle = 0, // must be set to 0
> > - *	.flags = DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER,
> > - *  };
> > + *     struct drm_xe_gem_mmap_offset mmo = {
> > + *         .handle = 0, // must be set to 0
> > + *         .flags = DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER,
> > + *     };
> >   *
> > - *  err = ioctl(fd, DRM_IOCTL_XE_GEM_MMAP_OFFSET, &mmo);
> > - *  map = mmap(NULL, size, PROT_WRITE, MAP_SHARED, fd, mmo.offset);
> > - *  map[i] = 0xdeadbeaf; // issue barrier
> > + *     err = ioctl(fd, DRM_IOCTL_XE_GEM_MMAP_OFFSET, &mmo);
> > + *     map = mmap(NULL, size, PROT_WRITE, MAP_SHARED, fd, mmo.offset);
> > + *     map[i] = 0xdeadbeaf; // issue barrier
> >   */
> >  struct drm_xe_gem_mmap_offset {
> >  	/** @extensions: Pointer to the first extension struct, if any */
> > --
> > 2.48.1
> 
