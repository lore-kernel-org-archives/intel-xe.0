Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0DF7D24459
	for <intel-xe@archiver.kernel.org>; Thu, 10 Oct 2024 23:09:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 994DC10E9F8;
	Thu, 10 Oct 2024 23:09:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kbr7XEac";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63C7610E9F8
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Oct 2024 23:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728601784; x=1760137784;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Dp8oUJgR2l58DHXhuaRVqw2Om7I0gdvew/KaldBHHEY=;
 b=kbr7XEacdVCQVUSuempnBSmQZSGIV6pDgU48fEpRt6LctswiJPi5vrOX
 30PQ0jtkFJqOa8lT2aeGY02/mXdXKf9S7DWYFt98X3QKU51Jh+E73ZBx1
 DPvvOMkun1iph2TT37qCgqW3k4iyNQKP/LYSCwtBjLkaAXwTdXQZI7NTM
 4tJc1JEyK4KQ2dwcysRyvq0gMAR3JnHAgTlvjmqUjZAyDDhfxWhgCfe0Q
 9+n62ao+yTGgcO43wCowBVBjmKQBs7HVm9QxPfujURTCSuLYmPoipYpv+
 pJVv39yITcPZhCQ1QZNtyS6ar3OiMhrpqNfIwy3lYJyUy9H28f4a5zrof Q==;
X-CSE-ConnectionGUID: OItxUBBqQOWcpVsFOBnPMA==
X-CSE-MsgGUID: z9DUVr6iQnKM8cj3Q/9Vsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="30861290"
X-IronPort-AV: E=Sophos;i="6.11,194,1725346800"; d="scan'208";a="30861290"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2024 16:09:43 -0700
X-CSE-ConnectionGUID: fDlic7AcRHCX9CcmZukrQg==
X-CSE-MsgGUID: nAECcpp1SYaBSauAzWKQ7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,194,1725346800"; d="scan'208";a="114198379"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Oct 2024 16:09:43 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 10 Oct 2024 16:09:42 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 10 Oct 2024 16:09:42 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 10 Oct 2024 16:09:42 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.42) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 10 Oct 2024 16:09:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j3x1o0ASvtBOGzfiCbLra5s5Hay34lYOqtyWZC6JM2UuZeq6bcsSAPTYh7GQ89I5lcEcm7ExdWtmWZVWTzUpiicMTdV7fJRiURe1S0Wsatl44GGwuHUA967+2WElW1WcOCrf5BC/oV1z6LhS57Jy3k7BNnuO0wnHr60bRTYe9FbDInScOYdmsCGBTWxJG7iEHoThQXXKj8C87s3hnpUh4PpBbP9Sk1ChbjVa1ClFO1Mek3ckPme+ugN616I3O2qphFgHKkgj2a1dc9bmJ+WUnN1hI/mw42aPQMA9UdRkOyYDuhlsVpq/B4a4kkwh97k2vYSTjdQe8pQCUU0vsLuloA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d/RKbhWWpSsODgbLk084cYyIFbj6ZdW8gLge6IXGWao=;
 b=afY1vby07n0d3wYl0oBVD82YcVAMNjn9/k3hjIA4Kz3Li6tyZek93ufmwt6O9HKg4bkFPVpXLMGlw38Rjzx7aAWsuM6fIsWCJ1VSSbheBDrjB0tGIlcSAKyEeNjw/915Pi126vE3HaZ528YEZBQ8gu7ywFXGc+1x5yGKy7AjZudzNIksTHwiK3HOa9AdJQZJtaX4FgzewZe3moQrZFpjJDvb31Of6cBCkI5fLih8G/jKZ3rZH1dslrXGkh4nQp3/YpLP7Dw9dvzsJC0Qq95+LPZW+PFW9c2t1IDeMziEVYVI3q9xOfsgJgafGEDva/R7/Z0R71Ln+tdxkEi6rnvT4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB7294.namprd11.prod.outlook.com (2603:10b6:208:429::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Thu, 10 Oct
 2024 23:09:37 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8048.017; Thu, 10 Oct 2024
 23:09:37 +0000
Date: Thu, 10 Oct 2024 23:09:17 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: John Harrison <john.c.harrison@intel.com>
CC: Badal Nilawar <badal.nilawar@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <matthew.auld@intel.com>
Subject: Re: [PATCH 3/3] drm/xe/guc/ct: Flush g2h worker in case of g2h
 response timeout
Message-ID: <ZwheneW/5Fzr4clE@DUT025-TGLU.fm.intel.com>
References: <20241009105645.1416588-1-badal.nilawar@intel.com>
 <20241009105645.1416588-4-badal.nilawar@intel.com>
 <65cf53a0-1696-44bb-8606-83f867b7c545@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <65cf53a0-1696-44bb-8606-83f867b7c545@intel.com>
X-ClientProxiedBy: SJ0PR13CA0190.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::15) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB7294:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e4ee116-8ab2-46e7-3ec0-08dce9809ca4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BCy1iFZtSoF5NTTCGAvZKJRbl+sOomTrx7AnGWPNra2YqJNDFnB/joQVLypO?=
 =?us-ascii?Q?NVfbYKGXjzX0XX006yHAgIAZuXsXV6Ph8uW1aZC07+zGRFLCzWat0MvQOGn2?=
 =?us-ascii?Q?y8HxsCvoL/+k3KqnzqBBSM1jzGhMHGknLBfU4p/ZevPlAOdScIhV14r6JFuq?=
 =?us-ascii?Q?Hpj0M3qgzYwQJO3dU/+jNigvsWlJkz5bocY9Cs0naUj76zb27LvIPJoiJEVt?=
 =?us-ascii?Q?kv/+01P+8Wm1dM2AFxSZsUa5vs1TRNaK7OwML3GnpsT+CunTs4K+HrpRItL/?=
 =?us-ascii?Q?8vd03yKaLsODXufrunFon6Ea8vfzFSpg70BMKGy2db1dGJxqMZmHdmQvYq58?=
 =?us-ascii?Q?EeiRHWSGXwB5h5aajyQDlAY9rLd7F75UpNMPA0NZtdmtYW2mpmcbc4P8rjbG?=
 =?us-ascii?Q?ldqHG8FDQBHeQ+xNUYIqbN/yW3fR5X60yhRJgmLYMd+Xs0DtmhMXTOC1rjoO?=
 =?us-ascii?Q?sl0r1EbyLWQMgy7uSpxT3qvAm3vVZHIL2v1zZcvWJBKYhOmftB+EYPzrXON2?=
 =?us-ascii?Q?WGJ4fomWu5Suqi/pqa0EULKkCI2g7RmN5vLwcCfKYTcOZpO1FGzJQbdyKxnM?=
 =?us-ascii?Q?5RxzsliqnSMMAuY5XGldXoT6axRAkoSeyg4OKfJ2iWx2SVi+57vb0uQDDCSB?=
 =?us-ascii?Q?ChWpL9K/+Ze16qL8xDA35Xfsp5WLD0y5xGM+R7C+V7Dq8t9jGqHcwtIDZYqJ?=
 =?us-ascii?Q?Ik2zBLzeCQ/QzUWSkgwz4aNRvqypMd09bDLOX7Y9IvzuKeh8m0r9nszkimPn?=
 =?us-ascii?Q?PNcjlmz+8YrMTAQ+U3+NvVqDRTG9jtMJzDyUTelX8tPHwwwgNnWzixh1FLi8?=
 =?us-ascii?Q?82oBco26gmRBVJK++vUGXo+CK/UgjkkRgWVktZxXZiIZxHXP/pN5BpRREdSB?=
 =?us-ascii?Q?MAtwT65Wz1t1VLGk0EV4DOfQ+ysmp8YA8YCSQGlHQJZAGfDVa2yF7S49UwU+?=
 =?us-ascii?Q?VM4aOoIRlvB65F4cw4dU8FQo3fwip8wRdIkgD2lXXP2EfOYvrNJCWv1TuZ6A?=
 =?us-ascii?Q?qoyr255I22Eaq2Vzm+VrXH5KrdXHiAZdJck2Z3JWpIAUlXrXh8aewdjde7H+?=
 =?us-ascii?Q?6LoAh6uh01pYfqmqzJYyO9K984OGFnSgysHMvHPGKG1JH23XMedDq7k015sc?=
 =?us-ascii?Q?6ykDs1sJ+wKKKNaIHxIlZ1td6+x0TtNe1w5VRGlDccFFHySET3QRlz1+mCda?=
 =?us-ascii?Q?hMIaj6AHZLYpF9lG6FApOim8UgHJ95T6wh94xOr7TkXZlmVaeUMS4CRSXU8?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DL1rg5zdQSnlM+Ty6CBPkEqsee8tCr90J7tl38LKbMg2Z/CcveHZ77Mj9V9o?=
 =?us-ascii?Q?IXYsrPqL1Fs55FZImTP2pXCJu6ozWRIvw980+sbLeClRJ3rRNIviMjbUdxot?=
 =?us-ascii?Q?jD699/WH6jX9n18VSjYo06Pck6LHe+tEwvCWwJGCxcIU17sRekupByx1a54E?=
 =?us-ascii?Q?vC1WgcpQ3TM+zKgmvAqyF7sd2qientPO2mFYvRoBLIu0nMJhj1MPlc7D9T7a?=
 =?us-ascii?Q?K+AT1tm5WilDM2ghpiZhDTbfmNqm+WyRTs3/GQF95hoVPGCGwm1uz67VoYS/?=
 =?us-ascii?Q?LYjVXLPc9ek9AydyvMAlVst1I7bm4lBWLIus818YYCGyCJIsI2QBo3ogsDJN?=
 =?us-ascii?Q?NRtNQdOfWoGWlyVe799g9sOaGPjFzbWvyIo62E/xZNg3D9qBPq1rm5v5LOor?=
 =?us-ascii?Q?h9AlAkN4z+U1fNeW+XKZ4SmEDt4apjzUwL5NVXuYIZw51FiX8QOkHrOiZZX7?=
 =?us-ascii?Q?QgKlMhqpZU/XbYSJIvXhcpgHpft9DkVJt7A1g/wika57BNMUmub8zAtAl2NX?=
 =?us-ascii?Q?kQlx2jqkDvhdpjGGK128q6VvJryU/SJi22j50YVp59p5qy7IN+IKkJbu9HVQ?=
 =?us-ascii?Q?tlIS03+q9gjZ1EXhNAacwDym+K5BBGW0zjZ5T8j9UC7lmxRcZ6vNXoaYQJfO?=
 =?us-ascii?Q?jh+1raUP4025PFKM31ppDsd6sm0YcCGZ9XRkTl21af8O6M5FrWOF5X8IaXxU?=
 =?us-ascii?Q?wq8WXtlo5VfaNNRv2lfi5hUJbjaX4DpYKd+lhXuzKmQwbPxp5webOiqHBNPO?=
 =?us-ascii?Q?+YK6r8oVyF0DaXHssDaREXd5ZjMx26QgNPjykhn4UYsW/8w4JW7ao71Ycody?=
 =?us-ascii?Q?hfUs/s647r4ryFYBUWnqYmCr/urtIy8Dvy087b7BJ/TPPlhEz/1ZtlKFVyQX?=
 =?us-ascii?Q?DuFZXi6NTc8qyzNnSyE9icUXTw6vrpunYYkuF601AZI5DxSbctCWJ+BEKJyk?=
 =?us-ascii?Q?h/t9/HCMw4Jfie+cwI6wzpiu+S6HYHVBtovcAFwnBRzGrxZJm/8He0SFbP05?=
 =?us-ascii?Q?tNLIatDO6BxFm969LcIR+OJnq/SaIUZug0+OxLX5EZAWuviuJTa4TSFzc3i1?=
 =?us-ascii?Q?IY8Z1tmeYPqtx1GLfsHv8Z+KIdw9qZKOqN6hJkwZOFz9tpxxJgkNYPbvnA6z?=
 =?us-ascii?Q?utRmelJlZRTF0pfxcO894iFsQllssdsnb9gy9o2BSsZuQ83zNOyhxAO8vLMB?=
 =?us-ascii?Q?SVGPD1o61ti2XVgqLQMA16dHcG6mZwRUjF/BLJbfDBY0Qaw+M/vR0H8NDRWU?=
 =?us-ascii?Q?ND8HrwcaRkricISNgKtm+ZgKwd9yN48ws5ah2ca8uk4l2306MLdxYNBq4cG3?=
 =?us-ascii?Q?pAnxSRLmAgdCUx+kkufWJEYayIc20P7/NSNhoZMFTByKkTP2vuY6gtwMSQIz?=
 =?us-ascii?Q?gI/IFTS7lNYDfja59EtQoZu3YXg3s23mwv6j7ICH1N7jH/sB2mSB4RMJXHQk?=
 =?us-ascii?Q?kYRY4WCMEoOyHF8IQ/ZYW+wbUf839A++dHYUIPYdM5JJlwYaojtx5ZL47uMR?=
 =?us-ascii?Q?olx867qBirFmi1oJeKFltbWJ0K1HsYpz5nVs3alZhr9wsjQmpE9RHnsaOwNv?=
 =?us-ascii?Q?9E46NsRvPzkAPbOCRMfSBg6dMHJvO1xtAufJbuL6RXFmrhHBv0RV6jsjRkKq?=
 =?us-ascii?Q?1g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e4ee116-8ab2-46e7-3ec0-08dce9809ca4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2024 23:09:37.3805 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GQsyvEq5SDog2hPM45UDR+1K4g+2QzYjRXiZsYHdqUMiRNj6oo4J8M2LwP6wjVpzLzxb5Shi890VvRw1FmI5+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7294
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

On Wed, Oct 09, 2024 at 12:50:29PM -0700, John Harrison wrote:
> On 10/9/2024 03:56, Badal Nilawar wrote:
> > In case if g2h worker doesn't get opportunity to within specified
> 'to run'?
> 
> > timeout delay then flush the g2h worker explicitly.
> > 
> > Closes: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620
> > Closes: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2902
> > Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Matthew Auld <matthew.auld@intel.com>
> > Cc: John Harrison <John.C.Harrison@Intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_guc_ct.c | 12 ++++++++++++
> >   1 file changed, 12 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> > index dcc95c01b6f0..2e2fa59eadfb 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > @@ -1034,6 +1034,18 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
> >   	}
> >   	mutex_unlock(&ct->lock);
> > +	/*
> > +	 * Flush g2h_worker explicitly in case if it didn't get opportunity
> > +	 * to run after it is queued
> > +	 */
> > +	if (!ret) {
> > +		xe_gt_dbg(gt, "Flush G2H worker to service H2G action %#x\n",
> > +			  action[0]);
> Seems like this could be a single line and still not hit the 100 character
> line length limit.
> 

Kinda a bikeshed, but I typically try to wrap at 80 if can.

> > +		flush_work(&ct->g2h_worker);
> > +		if (g2h_fence.done)
> > +			ret = 1;
> > +	}
> Again, are we wanting this to be a permanent change or is it intended as
> just a temporary workaround? If the latter, there needs to be a comment to
> explain the situation.
> 

Agree, see my reply to patch number 2. This applies here too.

> I would also prefer to have the debug print only in the case where
> fence.done was set after the flush. And I wonder if it is also worth making
> it a warn. That way CI will track how often this is happening and on what
> systems.

I think this is a good suggestion so this shows up in our CI.

Matt

> 
> John.
> 
> > +
> >   	/*
> >   	 * Ensure we serialize with completion side to prevent UAF with fence going out of scope on
> >   	 * the stack, since we have no clue if it will fire after the timeout before we can erase
> 
