Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3058BD2629E
	for <intel-xe@archiver.kernel.org>; Tue, 20 Jan 2026 21:02:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7FC210E64B;
	Tue, 20 Jan 2026 21:02:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G/bCbJ5n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 927F810E1C1
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Jan 2026 21:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768942973; x=1800478973;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=1ya+Zq9NShUiZ2C7ta9pwF9C8qAjf3agtLTBFKH7j3Q=;
 b=G/bCbJ5nmWEqnsnB0YTFAot6HnhZpS2ZHnJjjdZ+3zgflSNdW35CxnD+
 Mx6i2zYT/BqjQRmsTeI9cMIjAU4bNIycn+Dpyp4F7xXVeCFqZc91/sGL3
 HRbhfjV8UzhZxkI0fgEdj03sW2BTqMZmyFi2YmULG8ez1YsFtowOKk2Ky
 03rKaKXde17AbuFcaDboPlNzeWBk5NB2J7297h+C3TpqvNUdGgPrfCfR3
 4k2QMjGpPN5Y6tnDN4c69ikf9o4bs+fPHthf73f6iT5+IzySCvjIAArnx
 zvkzmATD3ZMM8QX5DLsm63B+NdeDN8qujN6tm8xQubXh7kQJ39df1yUbU A==;
X-CSE-ConnectionGUID: H2siLfRuROKSsixas6ENjQ==
X-CSE-MsgGUID: xKFGUMhiT0ioZcZN3cz+KQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="87578360"
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="87578360"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 13:02:52 -0800
X-CSE-ConnectionGUID: LjQp+J4oRFmF2+avHdv7SA==
X-CSE-MsgGUID: 2OaNcnWjR8e3VLncjvyvsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="205867067"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 13:02:52 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 13:02:51 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 20 Jan 2026 13:02:51 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.67) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 13:02:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jttmSdYbH7dd06A56dh42J3buBqGhke9V+f2Rty1T/1mHTtMqtZRNhIcXMZUHCZppALkPM/CgLBI2tSPOKQJuQN/qmWRiUKGjPhNHOa32vIn2XExIZ58FWn1X8W5LUrpUa6g0Ml1561CTTJ6Avgu6lzEKsm4sSzj3M1CVsvQGQUDn7HBlyXMXdUL9hreosVH8Fgyd2ZePgL0PzGVNt49qXXOyp8R39vvxDUYLDHoeakN8D5R2r18xCumPaUcgKVGfxqqoSxgKokG4h67nKsd5m/XeNlhr0KMQ4/uDbdkDPQdiRtR98jTHTLof2UJaKnvP8m1FTzS6inrFV1Ud83nSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F8kwqZehPO/tjVGG5asNiqOH2pKI1sSj+bOEaCxZvrw=;
 b=CBHGbNRg73UMg5IFiQCjO+zC+RyrWRQBuCfiqqRrffR/osyX/daDkTZ8wgDJ+oyiQkkz1frqskU+oxWCZ1DKALY905N7EKQ8L4QUeOhXnxl6+mtz319Wp15pwqWFGn17j7TjLi2BiiY+bssDwQhnh2ToGfnD5XRVfcx+9DPz7bhP3djci8cVsPCp/5LhrTH2lKk8HJ7O27ecUOUMlhXfc1UCYHeND8qqpLMd146u1TpwQ98o7xg12r6ZWG6J16qF7yiTy50upzXFl+LPtYzWofyWpkKVgN1xiuFo3gr/1HBEhJHISH/Uw5rslocs+Bj8kkuZ2X3OLJmvDLItq5SmlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB8504.namprd11.prod.outlook.com (2603:10b6:510:2fe::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 21:02:48 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Tue, 20 Jan 2026
 21:02:48 +0000
Date: Tue, 20 Jan 2026 13:02:45 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/3] drm/xe/guc: Wait before retrying sending H2G
Message-ID: <aW/tdSZ3HAjTjDDA@lstrano-desk.jf.intel.com>
References: <20260120185047.593-1-michal.wajdeczko@intel.com>
 <20260120185047.593-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260120185047.593-3-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MW4PR03CA0211.namprd03.prod.outlook.com
 (2603:10b6:303:b9::6) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB8504:EE_
X-MS-Office365-Filtering-Correlation-Id: 40928ac3-5fa4-4a6d-a232-08de58674412
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sh7IuoQLmvPGz8qc8EflRsu9ntzhiViYN7YpqgpJ3DfTNMyrOpxbX2aI/+5S?=
 =?us-ascii?Q?Q4krke0HXNDAa7tvaPHdBo66zpDu/dWlCDuip6m6vPA/xMdtGoZavLn5BnRL?=
 =?us-ascii?Q?etHFiDAUs60sjmAZG2TIDEDcEfBS50jCZF+RgtXAboY8TEPP2JIyelR40oYG?=
 =?us-ascii?Q?xlpG8ZZM9KPU6AaMGJvU6Tjpsh790Y0yiR5VigSufWDRhTPnlLVY7wSSXHyh?=
 =?us-ascii?Q?BXQtibTK5rzN/TAtOOYfG9QqQeJSG7KYxSbZ1NE9NPyF5CWvB9QDPS+LsXRg?=
 =?us-ascii?Q?xKmcvpNoqymapiZ9oFXE82ZgilPMjzL7qPMrClvCJSHf6ByZKk5RQYXW4vZB?=
 =?us-ascii?Q?ErAx/W+AYpyp9ieQWxnpCzf3nRd1G104Ogcf8zkNFWYW4AURHb7E8QpKNk/0?=
 =?us-ascii?Q?y8R7PjEnSkGu4+683kfj3kX1tYIeTWtXp/h9Vq28eFDA9URu1iP4Xud4OFUd?=
 =?us-ascii?Q?nPbHZ8JEshVnU8D46uNKGK6UMcm/fCbMRhIOkGM2r/84mXsb/OHRLi/uCTBw?=
 =?us-ascii?Q?d5q4bkEMNlkz1DnCQGvlJJlzPZE+VFqHgJP3twvYWwmfQcNooVQk3rGL9Bjm?=
 =?us-ascii?Q?Ra2PcpB0ZPA0GpKzj7u+kSv2WY6FYBD47ZjnZuFNPn35pwmLnpsIg7TxR/pU?=
 =?us-ascii?Q?Sv2yij5cHbhNUxUwnvuSWWqmKANFkd9GnuRk4c0LEJIbIpzQ6aMNBdio6NJE?=
 =?us-ascii?Q?U6YhX17vd4isSWQwc7XmMT34xprZNZnOUHIQjEm7FrDN/dfC8APVrZAELUNM?=
 =?us-ascii?Q?MLQVqpqSIfp8vgr52hUSVDSLjMeNSRmSD1lYu5xZOAhPbOsfjuNkrReixdXu?=
 =?us-ascii?Q?AikkwpEnCdhh207kaYXsSyBwiA7jFTVpdkp+NB5oIvrGqVT3PUXz4AeamXcb?=
 =?us-ascii?Q?5EdVhZn46OMOti7VsnXyMU814SpaidcSTLEvdwosStOjhcDYpid0to/g9jY9?=
 =?us-ascii?Q?P8Zuk4talVAueWtQ7YgpuWzym6UfcTe0OhTRshtFUPcTytflKv1QzOpWiEE+?=
 =?us-ascii?Q?hJN2e75xKYfQk5AQSUqLkMSY8pnZ+VPJ2Ims+KlGGuPQX013XtZgikSZOUwI?=
 =?us-ascii?Q?XxGHqNefR/l6JD1RhGA/2R2C39g1vN8sFfWQaqUrNUP/W23fDqNsaI4RYyMI?=
 =?us-ascii?Q?xRAcpAE638r8DtAJ3IDoURJnjkrDpu2AovmOx1PkYQ2N3PmfNEiVPaQ1BebH?=
 =?us-ascii?Q?iKh6T0NBxZg24/5WS+utuBqvp2ql3XtZPtwS6YCK934YWA6mk9dg5j+70WSH?=
 =?us-ascii?Q?pFXvQqA+ONi1ptTMhfZlOOlQ7H/mVBIxPw6jttRfi6iMjUmpo+4dNPgK4icw?=
 =?us-ascii?Q?uxIiS3GW8c4iHOECBE7Z4vjEl+CZNVYCvMyGuujN76oB/NZQ4ElQ9Po1xxMn?=
 =?us-ascii?Q?ZsvTC9LJN6Pw3qOsTrmZ00Ksu5quLwb1SAE1RfyEVWpzxnF0RcA3d/+481RU?=
 =?us-ascii?Q?FUfr8L/Cozl2Kug1c/ZaDT1dcHGfSxQFaIHWHyzLCThgqfoC3Z4YBJvpE30h?=
 =?us-ascii?Q?7lsjhe9HX5HT5ZA+2ES8w/Akj8IjPBh0oPS+ypJVqM0rf12gazU7LZuMEtWw?=
 =?us-ascii?Q?jzBo3ID7euEzSsSDovI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NrCWc8j7PsNukTyBc+sENCMGkfNs9Ym3cBWie4njqdCYSZYghHPI54FUwyDI?=
 =?us-ascii?Q?CxOKk1PKFHaUjrymUawqDTFHNB5oKz1Q0njFpFQuQVO6Zim00VLkj7fiJxvO?=
 =?us-ascii?Q?IfkSvqoF0M8W4x1LBh4pE40LFMlSgSosUzS41IBmTBVKcOOWac92LnjmYwG5?=
 =?us-ascii?Q?uVfSo07Rw/SQIK/R7X+GhC5VpiNgxsTQZ8XJ10Be7NYcM8yLxyLLq+cuth/M?=
 =?us-ascii?Q?hPLl6hf97Xda/LyF6NepDgsM5rVJZIyi7rC70hGlpzYXvWgs+ASlAPQ7TAWO?=
 =?us-ascii?Q?Y2ZpWdR5ZdRf4SHi4PyxjwQYBkjXyl+rUEcR5C+KcZIMfUNqG59JeC+ZOcmh?=
 =?us-ascii?Q?9Ia6f5TnsBQXVObTwws0SmQtIP7e/ShtYv4PjtGJcqC0nqegGAwQFUmnx3ML?=
 =?us-ascii?Q?HM7zSr63YzeVej1Tv+YqsmK9BzulPgHmbTL5XsnWAkpRSR6nuiAinM3rjGOq?=
 =?us-ascii?Q?K2GWBzf+xwEUOvE6JzapZgdzT+ZqKZEF70eldxuKC0d9n1BT93Q2xvrwFUH6?=
 =?us-ascii?Q?2oZ12s4LLNkcH1oA9jUlpu5Hf4UYZJHsIMOpSuvt7Ud0VEoqDbut6f8qCjlg?=
 =?us-ascii?Q?QaHSvwU3rEEi16B9Mu4vZ0RTVvMiTpId0YMjdaitFhZBLzhKQZ/Srh/Ygz8G?=
 =?us-ascii?Q?bqjJHUFkJPKGYH1wiQ94Gln1F+Vl4zWhkwuLh/LmHFcGDbalhjToKOKO3wfO?=
 =?us-ascii?Q?U9duYmiW7XXyPFENPGd510zN0JeQvUoI/g5Oo+KbopnlY5tporTiBfM6FnW/?=
 =?us-ascii?Q?eh0tvHlXFgSUgLUkdTcTHx4YDuCVbXItip8EnFNYG7wOpLT1GD2pB2e5hnKi?=
 =?us-ascii?Q?MfMLfSOJ/TjTyIE7hpCoBj+BKUaq6QHx5MICtSao/9iQVJIfBVxhYpL62qtr?=
 =?us-ascii?Q?7+j+knx+xK5VN7YvLom32LwUU95H3UxIQRl5tIrkceMaCi+A0QKR7YkMHfn+?=
 =?us-ascii?Q?aVat6EGn5iUb+3fCjCPP8KnPRfJkBXJEEKNmzB6iKv89fI1/9FoF2d5rOrQl?=
 =?us-ascii?Q?mU0uqzQK6Qef12GMo702Z/cyjvNopkZ0n/FlmHd3VhQk99Ul4ljnB0iekoiB?=
 =?us-ascii?Q?e/moG2mf75u9b4IOFN4y5xtoDrREXNwky/r/9foDVUSGqzd1rPapqT8dw3r0?=
 =?us-ascii?Q?WWAuOVCsvr6OakNALtxxR2lIZ4xdpBgInOfDlQjnZHlKEL2rIitWBRpuqs69?=
 =?us-ascii?Q?djnwi0rxezIGhf71goNRd3ekid+wrrvwwFMmadIh4PPBDtZDhzLOoFKddgq/?=
 =?us-ascii?Q?+SqHGJ4vRFiPyj6FtuP8IejXbH++lplMdvI1Edew4i5fNMpSJNNfVcchjo0Q?=
 =?us-ascii?Q?4ckt5hcnQIXd9N3w3+sasu0fKfP/og7pzpD3mkDnEfFEocShGR9uj1f9mlK+?=
 =?us-ascii?Q?a4tihlZ04k0gENExC1H6JYpdug3THyEwZ6o6j3wvCtNRC4ZQHAhVmpHXiNKh?=
 =?us-ascii?Q?ye5ynjlJA3nu2ESl2J+qpR4HABZ8kZecGWWmQXeVR6UWoDb6X1MM0Q/hLQ4V?=
 =?us-ascii?Q?zk0x7JR5++niadKns8Gac4LGblB3xBj9gICnuFbyo0IxYzJOt/YiCTbnh+n5?=
 =?us-ascii?Q?BNw9UXogdzX10whZEuVPXFoMViN3EvTVctbw/80+NRfRcPIs1qcJLNOjMhzl?=
 =?us-ascii?Q?TYuDifkb+z2WkksvZWm8Aa0eG8AgAkEwmBIHntV9bf6sHfXdQKP5QxGEIlyZ?=
 =?us-ascii?Q?kdQ4YravoglmYiKzUiAQSHgKM2vx1Q9LVsAyMdpKl7ISTNgg7ufOwaodJQmL?=
 =?us-ascii?Q?Vz1uAHWJT0a541hvKuj+qsGJB7rGbaU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 40928ac3-5fa4-4a6d-a232-08de58674412
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 21:02:48.1313 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NgrrIf0L4eEYwn55nSQfc7NI7ODHFKDNv8keUvNU/syw9nYDAM5f2JzOVfuDj6y9uohq7w3cmkmj9Z1yAOnnhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8504
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

On Tue, Jan 20, 2026 at 07:50:46PM +0100, Michal Wajdeczko wrote:
> We shall resend H2G message after receiving NO_RESPONSE_RETRY reply,
> but since GuC dropped that H2G due to some interim state, we should
> give it a little time to stabilize. Wait before sending the same H2G
> again, start with 1ms delay, then increasing it up to 1s.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Should we model the sleep after the wq_wait_for_space algorithm?

Tomasz change that function here:
git format-patch -1 a00e305fba02a

Likewise should we update the CT sleep algorithm too?

Matt

> ---
>  drivers/gpu/drm/xe/xe_guc.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 2a3b057fc828..3ba0ea015611 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -1397,6 +1397,7 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
>  	struct xe_reg reply_reg = xe_gt_is_media_type(gt) ?
>  		MED_VF_SW_FLAG(0) : VF_SW_FLAG(0);
>  	const u32 LAST_INDEX = VF_SW_FLAG_COUNT - 1;
> +	unsigned int sleep_period_ms = 1;
>  	bool lost = false;
>  	u32 header;
>  	int ret;
> @@ -1477,8 +1478,12 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
>  	    GUC_HXG_TYPE_NO_RESPONSE_RETRY) {
>  		u32 reason = FIELD_GET(GUC_HXG_RETRY_MSG_0_REASON, header);
>  
> -		xe_gt_dbg(gt, "GuC mmio request %#x: retrying, reason %#x\n",
> -			  request[0], reason);
> +		xe_gt_dbg(gt, "GuC mmio request %#x: retrying after %u ms, reason %#x\n",
> +			  request[0], sleep_period_ms, reason);
> +
> +		msleep(sleep_period_ms);
> +		if (sleep_period_ms < 1024)
> +			sleep_period_ms <<= 1;
>  		goto retry;
>  	}
>  
> -- 
> 2.47.1
> 
