Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9583DD3B994
	for <intel-xe@archiver.kernel.org>; Tue,  9 Dec 2025 20:59:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5501D10E212;
	Tue,  9 Dec 2025 20:59:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LHtevji+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB5EF10E212
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Dec 2025 20:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765313975; x=1796849975;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=KtAxt0fmDWPWiJ5cJtrc/bMi7ayvslH2sd3GS84xUzc=;
 b=LHtevji+zFruozpZO+Cvq3y4qHqZkbHCuQhYxKWaIvFj14IDKPkT23Rw
 oe9D/teQQ3XWvJJipj2PoEHI4MyGS69b6ayJju72dKg4OWuaEFv4e7Ir4
 xCGZMTe9onD5FjLP+TCB2XHI/olZroyPufq5woYELKFfZMMWx6kZOCFyF
 zXgnbDmwNwKFmNGHZTFG5pjCb9ldlWK6cpn1YPHcdGU3nWRAQLbRQH10f
 ue92Uic9Ph46M661vFeIR10vKqyiMtkYQEQtn7LNO08P2PJBIlrY4PC6U
 nE4vLKJX7tF2WkTQbyax8gGYuxJaVTsxnWa5/O1alqHTN7/JqsLf/af1L w==;
X-CSE-ConnectionGUID: dh6LuSGlQuuGxRYGVlQYvg==
X-CSE-MsgGUID: SLp7ZU2ITGy+dDNlBFY/3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="67448959"
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; d="scan'208";a="67448959"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 12:59:34 -0800
X-CSE-ConnectionGUID: NMb0G4Y7ScijyoA/2nvQaw==
X-CSE-MsgGUID: blfxYFinQ2WeFGW8nLjZnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; d="scan'208";a="233734857"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 12:59:34 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 9 Dec 2025 12:59:33 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 9 Dec 2025 12:59:33 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.32) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 9 Dec 2025 12:59:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZdQC44rzzwtcTfNG5M+doo8wInKwr43Kbu1CLsjXf1cv2fTLYuq63q+kVAwwQ/dhWaOhEpoOKl/I7w0yvg9QJZggK6SYmgdN4Msjv4yaTwrwRwEkYN8gzZAbAg4nmhzMd3Sr1SDioQXBzPcw/zCXd5ZY535R1JPnWijIdQl1O1xdL/GHNtzVp4xqb+q9gsqS4egOqLVT5x3CLoJ2Bggwmwzx0XSQnjY+gN7mLCO14BEMom27sWb4pplj9FMyXpUh0axEhIfDEGjEevdyH5X5cVhKdoqR5dU67ovmDPxWkHTalku551yXIBud3WoMWW6Sw0nK0kbVoKyQyJjcI0V1Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=usZkSWwEgQerZJjGToh+sRsVApX+27oArvlXiL9Xhzg=;
 b=cz8JdbCMbDD4G3Mz8SS0w/wnHV29MNBnojZBYHSf1ZamaFblw3eExKeCxbc/c8vwSrn/rMCWaqGwZKR/gcPKZst83weHSz/LDVGtzAFd4rGvLB4737bfMWYVQ5ux2y9KcHvS0/RJRkoughYKBsoPo4D8JyewST2rr5EJezf0Zi6Oo6/XpSDgAL+XLQOj7PXrsjJWNti7/By82rB6Rq/+d5mDLcvyvJrZGgTUQ2/bcVF1YZv1dC7DD11OYFuaoe1BMqUZmiwpwRIE6CDaKKa7YyO293qqfNjbdyLhYvRTZSiLNSbUNat954VoN5mk6JZKJxzXYCHzpKUA745iKe0jig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW4PR11MB6885.namprd11.prod.outlook.com (2603:10b6:303:21b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.8; Tue, 9 Dec
 2025 20:59:30 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9388.013; Tue, 9 Dec 2025
 20:59:29 +0000
Date: Tue, 9 Dec 2025 12:59:26 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <saurabhg.gupta@intel.com>,
 <alex.zuo@intel.com>, <stuart.summers@intel.com>
Subject: Re: [PATCH] drm/xe/xe_guc_ct: Exit CT submission fence wait on GT
 reset
Message-ID: <aTiNrtW2pl3gK+do@lstrano-desk.jf.intel.com>
References: <20251209203516.155703-2-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251209203516.155703-2-jonathan.cavitt@intel.com>
X-ClientProxiedBy: MW4PR03CA0279.namprd03.prod.outlook.com
 (2603:10b6:303:b5::14) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW4PR11MB6885:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d708e04-b5ec-4626-2752-08de3765d84f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?soMuD3ORViLOriV6cWrMroqGt88oyUeSumU5bYxIh8SAFBwUwYLWQOM1UcGs?=
 =?us-ascii?Q?bkc0OkPnej7J/sNUHYCmRIsDJsymZECQIfOBirJYb/MAj3i3rul+CweC30gF?=
 =?us-ascii?Q?pgksjSIzr2XT3662jltoMWBmxESXSZ/22tlgeq0wxPFyoAZDOf/i4F2I3L5D?=
 =?us-ascii?Q?FtjPZJjU69Ey96cQIeBXGiosJWYPaZhz+rkZzArhtafBp+a2H3pxfcVmJwmw?=
 =?us-ascii?Q?ZLShsm17YWg9MISSUXY7z1F53tMserFBURGGD3pfjPNJrSPYGKC+DCVqaPw1?=
 =?us-ascii?Q?DiSW4vvX6jwAmkJVU/rucyRcDov0Gce1TIiE+o0JUOJu0mvuHFI0RNDm8FL5?=
 =?us-ascii?Q?3sI4kg7hDMsv2Qxg71TiKjP2KOka1aGjflmU7wLBanVuuDb3KDj5TSgJ7tm/?=
 =?us-ascii?Q?MOMuj9tBA5jiNrVQMVnGrt09Y5jOrMnNPYzpzIxhxZ9/alqfleAmEDWelGl5?=
 =?us-ascii?Q?Y3jbPTBCvFW8DH7JYkMhn/+GYQdbHa1BleUu/g829LJg2LwYA+Y+UaEofyOl?=
 =?us-ascii?Q?8jxuXY54TNX9Yt0l6g61K7TAehJKGy2JQd5nWEUctKRWhfhic9lUHOdDp/9w?=
 =?us-ascii?Q?IH8BlHtrAWlzeb3v2b6m+QT0VE2kk2sZ6VS9duhPnx5mLnJ9YKwgtobZU2x0?=
 =?us-ascii?Q?4R9qhge0U7eWIKuDN/5sQirbjFnkn4KqIeXN4h10XBQIGpVTbfN8TFdCkf4Y?=
 =?us-ascii?Q?RQSGvKTGeUU9xDsONIfu08awjKYVtWun1V6JgTLOM/1j9KNju2GO5vIBe0kO?=
 =?us-ascii?Q?Hjg6dSOBN6+HnsX2vneabP7xmDmmupBS9LGjlbbGtliR+WoYZe+9OWCRroFH?=
 =?us-ascii?Q?3QeL231VPFSMf2dkOsgc+H8wNFplSGb+vLT+7b6jFIYSW7nsqPjGI9KGuII5?=
 =?us-ascii?Q?6kx/xKhg2pywKwLVtY5BH/jeeoj0OU+6JNoWB7zsVJQQT0rW88iXDhO9wBbL?=
 =?us-ascii?Q?KKX3tNXibnmQ2dM3cKgg8Vklg1u8NAESl10ongA6IDxNT7yZun8W4zh3qyCI?=
 =?us-ascii?Q?sCWU1XkcWUIbdyfQ6XE7R1njAGgTG6KhKMCk/HD5E7tfC5TxNPI4oj2Zk3CB?=
 =?us-ascii?Q?UWzQs3N+v+XqoGs04CF+4WfxiKaLZJmwL5Jqos0AKHwSeTTP4OhIqho6p925?=
 =?us-ascii?Q?bJaDKCWgX5DYQphx44i9YNO7ixGXCsI3qfFf6ptdezEzQQQIXCIqP4+Nm7a8?=
 =?us-ascii?Q?wtHP5hKH0NKC1mZGl229CHVRnAjVljKbJcxn1lnNDqfD8XYc6NA6loHXm29A?=
 =?us-ascii?Q?HiYbymQEn/BDwb8dpjPeAU2TqBONeM5EcJ4yMW5pZ2kv6YcsU44stznhedV8?=
 =?us-ascii?Q?wzTtyd6EUdWMcZLRFyjlwDGfX8ZCNUuQ4/H9IOfaYng8Rq6yGPbBGfQcKojT?=
 =?us-ascii?Q?mbnRI1+xKKRp2plKxo6Jep5UDjj3eRQsXD50k4y/rj6D6Pha/0vFI3+yy6f+?=
 =?us-ascii?Q?yE3buIZdHnYYolU8j2qyLQefdfMYLjby?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OdwJun3I2nSCNcco3gO32NQvubsBJgTdOEQHZtLwdC9myXo2bDljP7mgyMUX?=
 =?us-ascii?Q?JmLIwMjpxj6YFaPnVs+S/9gVH3cEQo2oa1f8fRjKh92PFmRD6RcbxrtEBcvP?=
 =?us-ascii?Q?0lcVTRGm1Thyu04V51Zo6LRG7fh5TmInZvzRgnXTfxO7OAIcSwhQHbzE3c+R?=
 =?us-ascii?Q?dBRMm7cM7HfKjbALvoNEdB/EM23mZHtAuKOP3KZ8cmR8bvbWVDRwvwaYz8/r?=
 =?us-ascii?Q?1tDoPVXIQQWN2T7uv8x9llD3NYQHPRwHf1SuI3bEXt+JE7OweToVtq8OvKo3?=
 =?us-ascii?Q?jXX7FPA3Tw6wsDupRS1MqERXgjpmwgCYJKoZc+/uQYL9AhslFR4QFSDI5VLN?=
 =?us-ascii?Q?0AYH+HpcnyB9/2lIM1USPBquaDQdpTBx5JrdV20NugdYGwS/QX4g2EAOdcYn?=
 =?us-ascii?Q?di6RRq/SBRFWTzyYwCcb5ft2VIIhgmarXIV7F4+1eJmVFZmP879zOG0GUx+s?=
 =?us-ascii?Q?ojnyvMlqp7YAfcQpzvPz0pXCwOQillImhZfvpinlwOohBtFDZwCaQXVXSbrY?=
 =?us-ascii?Q?meS+OUea+oSwvs7ToDeS49B4tRKf5RHDtNGJASjHnmH8OhEOBHJ+R0j/SX0D?=
 =?us-ascii?Q?eJENitRF+HKKvleXPewr3KQThmHY/SnM1Os82+Nrn2LkMXId2e1bDQyK1ZWr?=
 =?us-ascii?Q?98hcVFEkRRdhxQxoQyRy0R4c8lasNeqmLx3r/TlbYrsrPB978LzgGfJ4XxR5?=
 =?us-ascii?Q?iffHQHp6ZuTwafSh9iAGooHcASbihVT5z15paggYfrySfrJc4nNJ658hT/2A?=
 =?us-ascii?Q?2Y7SkIytJZct/d4IWi7sQ5vs6WAI15zHWLdGooO+nNaNw1T0QjXYDnyXByp5?=
 =?us-ascii?Q?XS4ZpLOWN6MqLZ5ftX+Nfyi1X3G+ZqyMrGdNT8Dhw0VlPRU4MuaN4+yh1Mfv?=
 =?us-ascii?Q?WR9U4VW8xd2nl2W2tGx8362B7brZgRgkk9TMMaR4KtRTUxZSUVd6+zPGUJIQ?=
 =?us-ascii?Q?gXW9V8zQPfMlUi46OYlaOs4meNoWBtRWGFteVfJlpvXvkra9+9mZmV8W8E8K?=
 =?us-ascii?Q?3OgTb8ZJjtL8uvbPLCMG0tXVHCZ2oxCI8BdNRDqVroJGV2ttyxuotSAPcLUM?=
 =?us-ascii?Q?BKDKvQIpaliRK1Bkd/MQ0P3FmyxSYbP2kyDrFhPcF9gxBzWfntPAcrJDrkTv?=
 =?us-ascii?Q?UHhH/zGTNiEb1UL7IICrB5NfEZIjwLUlsUU9EO1Czkivt1gR6Lk746OMjSiz?=
 =?us-ascii?Q?Bmbo6RlU4gnuT9hNwsNXN1llr9bXfPl5KXV/Dku+PFHdPMRaDaEBLWsT7h2y?=
 =?us-ascii?Q?Us4JRGml5Nck9kIdWtXBVrv3IPr1htwIMbRulkL5jaqSFO5/qcrYc8kdDq1H?=
 =?us-ascii?Q?xUMFvQ+jT83qlZneP/BuckV61y4twjWMA4sCln2NFfm1VePnRR3CH7ojjW9I?=
 =?us-ascii?Q?z+aPcQ/XWMi9GoR2MeYaoMBtBgQWJPQddVDjMea2QzEagjKByDiS0v3ATI21?=
 =?us-ascii?Q?qVP/Gfc9aNLq0aQgArp1tZkP7ZSzT+SzUemC48OiQdzocyz14l26FZr/YfzY?=
 =?us-ascii?Q?hBygCb4dVYOYBLo81ofv/UTDLDJG1PW4r2ao4zkdu7L97wHOfnZAClsTSqri?=
 =?us-ascii?Q?9m6t/w3pRdEWP3Ip5Zx4I0SI23nY4qZM+QQZ6hnbJ++f26+8zYXtiGUBHfBo?=
 =?us-ascii?Q?zQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d708e04-b5ec-4626-2752-08de3765d84f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 20:59:29.4735 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fPzGjumPzFZ0F7MxafJmKPgLrhFfjaqpp/wUu9d0zBTdWagMX+2Axn6Op21z8P2VvMlkg9zbEMagpRh1QB1wVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6885
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

On Tue, Dec 09, 2025 at 08:35:17PM +0000, Jonathan Cavitt wrote:
> It's possible if unlikely that the GuC could be reset in the time
> between performing a guc_ct_send and the G2H fence completing in
> guc_ct_send_recv.  Exit early if this is occurs.
> 
> Suggested-by: Stuart Summers <stuart.summers@intel.com>
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_ct.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 648f0f523abb..438a460106db 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -1231,6 +1231,10 @@ int xe_guc_ct_send_g2h_handler(struct xe_guc_ct *ct, const u32 *action, u32 len)
>  	return ret;
>  }
>  
> +#define ct_alive(ct)    \
> +	(xe_guc_ct_enabled(ct) && !ct->ctbs.h2g.info.broken && \

I just noticed this - xe_guc_ct_enabled probably needs a READ_ONCE to
avoid the compiler optimizing this out too. The existing code is in
retry_failure is dead code in Xe and actually probably doesn't work.
Also we probably want WRITE_ONCE on ct->state in guc_ct_change_state too
pair with this read once.

Likewise g2h.done should set / read with these macros. I think we are
just getting luckly compilers are not optimizing this stuff out.

The broken checks I think are fine as is as when we toggle those states
we don't wakeup the waiters.

Matt

> +	 !ct->ctbs.g2h.info.broken)
> +
>  /*
>   * Check if a GT reset is in progress or will occur and if GT reset brought the
>   * CT back up. Randomly picking 5 seconds for an upper limit to do a GT a reset.
> @@ -1240,12 +1244,8 @@ static bool retry_failure(struct xe_guc_ct *ct, int ret)
>  	if (!(ret == -EDEADLK || ret == -EPIPE || ret == -ENODEV))
>  		return false;
>  
> -#define ct_alive(ct)	\
> -	(xe_guc_ct_enabled(ct) && !ct->ctbs.h2g.info.broken && \
> -	 !ct->ctbs.g2h.info.broken)
>  	if (!wait_event_interruptible_timeout(ct->wq, ct_alive(ct), HZ * 5))
>  		return false;
> -#undef ct_alive
>  
>  	return true;
>  }
> @@ -1294,7 +1294,7 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  		return ret;
>  	}
>  
> -	ret = wait_event_timeout(ct->g2h_fence_wq, g2h_fence.done, HZ);
> +	ret = wait_event_timeout(ct->g2h_fence_wq, !ct_alive(ct) || g2h_fence.done, HZ);
>  	if (!ret) {
>  		LNL_FLUSH_WORK(&ct->g2h_worker);
>  		if (g2h_fence.done) {
> -- 
> 2.43.0
> 
