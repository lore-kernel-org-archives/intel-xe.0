Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4892BCA0ED1
	for <intel-xe@archiver.kernel.org>; Mon, 11 Aug 2025 18:36:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA99210E16A;
	Mon, 11 Aug 2025 18:36:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gukvAfue";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE36010E044
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Aug 2025 18:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754937389; x=1786473389;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=WKCjnHLEekogcOBer1GSrGL/CZKPJV/S5TN1wo1U49I=;
 b=gukvAfueMM4aYTYLQcxxJvCvBWECZERPaday38Gk27uni8zKvyNn3SPm
 5gv03NzbaVuJPpmzi27I6dcKXdiF9RqPVvO8JI6ok7LMsW/tiWN8CnGY7
 LKK1uIIky3ndkUdAeKP4Twy3aUQoRHPLc354YSS15RXFCa13VGA6nLxwD
 HbpFtXEFXz6mbPO8LvFRSFYiYYtDh1AQzTKToBBx30+ZHiJ2XBEd4eJ7f
 Hs1coI4BoJ2uv6O3hQUXdKEmyzowujexfvaUF0FWxW8E+JV9KZ2FBgbNh
 ssLe66lXkdCpzubJxgrnCv/TO9ARBOtEbzWqbAKOmmpxmIL861IkVvajY A==;
X-CSE-ConnectionGUID: 1qja4K4ZRvWt0D1QZg+haA==
X-CSE-MsgGUID: Dyiy0Eq1RIKlj0MmDoQHbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="68654764"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="68654764"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 11:36:28 -0700
X-CSE-ConnectionGUID: g9vlGvomRMqoZTb4tXRXlQ==
X-CSE-MsgGUID: 6XAixuMYSxWTxLcqNE+f7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="166378548"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 11:36:28 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 11 Aug 2025 11:36:28 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 11 Aug 2025 11:36:28 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.89) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 11 Aug 2025 11:36:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZlehXoAMekmBr/AH9fR6qLsEmNneCGN3fVfAGj5Kgn+HXN/eUX48+6yvEmBzgXicsnXU0daCIJELvF8OWCx6YV3NzTUYBTGoNivZg06yBMobPYswmrbfTzsfkCXj49ceEPjgMYKJhUZhFGL6BD1ekkCtktwmEH5rA0K3Qw/MhWgPxJMFARArFxrD3CoL9kc4HrTg5kzVE65p/koOFOr+EQ1fKSFqsNcVgJrljarj0RiDx44GkigpjmEz+VJBuuUqDnvMSUhwbKxaQJV97JYeYqFVDp3/RWAONwJ+jOjE3bMJHzws4562Jbs9o7H4M5xynQm6nSn2rc0NsdYRLcgKrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yf0NxfbuQJdHCmlZv2bGcaXXV/hmOZJJ7GfwZ6+4SXI=;
 b=AZJy75Ex+N3XTCcCm0zWWc7LDykaqYnNArDjeBqJRxiu+MVCU+l5ZK85u+vO246JlW5QR9SLbteeMT+DuyMM7j+mKsk4fm4dNgv0rw0cadtytKZgyu8AucRnJswiBGBpkabCNcocg940zPxs6Fz7+W2VNrL/BWVqYOg9QI2UznszMmW9C2qqXZEBj8kh0TQS8gC0CcCCiC5ZG09ry8ZQXmQXcbB8QBJqh6WGPDG9MsMzFjFsPMpqZvjPm+LtCOyFJm6br24mppCL8sgijd16rvnk4SAJjkPyEhv9d4x//XShWdbFL7HVM+cgEJqRH32UEp6Is2q262NRclr0rMleIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA4PR11MB8890.namprd11.prod.outlook.com (2603:10b6:208:55d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.16; Mon, 11 Aug
 2025 18:36:20 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9009.018; Mon, 11 Aug 2025
 18:36:20 +0000
Date: Mon, 11 Aug 2025 11:36:18 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Lis,
 Tomasz" <tomasz.lis@intel.com>, "Wajdeczko, Michal"
 <Michal.Wajdeczko@intel.com>
Subject: Re: [PATCH] drm/xe: Take preemption into account when resubmitting
 jobs
Message-ID: <aJo4Iu6kvmNCy2CC@lstrano-desk.jf.intel.com>
References: <20250809043421.1982541-1-matthew.brost@intel.com>
 <c10c822357ef1c0f491ca9ccbfb27702435f4478.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c10c822357ef1c0f491ca9ccbfb27702435f4478.camel@intel.com>
X-ClientProxiedBy: SJ0P220CA0024.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::32) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA4PR11MB8890:EE_
X-MS-Office365-Filtering-Correlation-Id: 3aa040c0-4aa1-4cbf-af28-08ddd905f714
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?VaHkYnS1hAMXNT/iWsP8txP3Qv1yHNlHXw/y6+R7YkzE1iPXKD/xS6kMDh?=
 =?iso-8859-1?Q?PjFdF8VBDjMw3h56qAgEKmLstwcuQ2XHxWcQQfKPoaHmEqpeKeTbgmcdiP?=
 =?iso-8859-1?Q?5fUKtnoAJBPkfXhl/ZxtI919yGrrs+wbGH503Ttjtj9wXh85MYXXuDIDku?=
 =?iso-8859-1?Q?VJC937jmviGKEplEjRhVMUWtuuLBbo0BK3LonQ6vQp0DJelHdQRJQY2F3Q?=
 =?iso-8859-1?Q?R8DfEJf296b38YtflZR4DiRb5tInLt+yWBxtnBLs8yh0+v/i+v5rAOaq60?=
 =?iso-8859-1?Q?dNvd/sJnMl2uyHf47aFC7mg2I+gz06/5JakDRgA80LXfwRhdyzQxdhi7f3?=
 =?iso-8859-1?Q?465RGjtff8DkFOqVsyewOleNHwn9/n6JBzkyD8VhDkjdMg6+E5l1XbqNaE?=
 =?iso-8859-1?Q?X2zUz7sTBc/v7rXl1MPfWvaxHGbaSLO0p/iTv/0jc+BtpN73TzWmzkKc1k?=
 =?iso-8859-1?Q?ptrYN8ICnyTi6jNr9hHh3D0cV082b7MXZF8vTZqo0M4G0wU61npV+ZDZBP?=
 =?iso-8859-1?Q?Zum0kgSKuod9MsHAZ2z8WakIFCuUAT/t/zD+UiymVzAdptSlOebkgjMJPe?=
 =?iso-8859-1?Q?JQUp2Gly+94MFQz2O+MrFtgErOa3nxH/tqWz3unMty+Ho8SYEtQbtRsYj1?=
 =?iso-8859-1?Q?dOQzK6E/JfHMquylrBlBoz2C53NsSgKW7lHjaeLdO+5kxYM633eCPY3sUo?=
 =?iso-8859-1?Q?0I2VlxfKfYh13+XlJaJLrPlBEn1HQaJPxyzq07BxqmA7TjeFi4+bMsV6oJ?=
 =?iso-8859-1?Q?G7p34CpAKDOj5lAQB9c28zYFMGbU/vZ+WulqsXxxo4oAGznXWkYuOpraxl?=
 =?iso-8859-1?Q?N4lks7W5CMOkJwMfKmWndnTwBy6LCfk99nXkLrKhvqKCGDIGf569hb93mE?=
 =?iso-8859-1?Q?jsOg5FP4dsJh+xx+dSa8G+s/vMRyb5JOQRccJrvIyRDfnwcsU9pwo0VZce?=
 =?iso-8859-1?Q?F006t6egGGJ2X9W5gDIqGPHyeC+NSnH6FLn9nBvhx2nEMD4IaUfgFAtgDj?=
 =?iso-8859-1?Q?9q8YgiYbc+jcq3DhjDyiOQ1dSzcb569kxjD69kx4RRCcVlX/2J+jlYwhsr?=
 =?iso-8859-1?Q?aT8o2QxOeXq8JuMOvSjkGHy+b3T6x6oOeMT/tD+Uf+54duCFOgamsMHri7?=
 =?iso-8859-1?Q?/oTJsHAo2LzB3Kuhn+wLtqNtQFKrVUnZu9RRuSRqdNTEjEB3uIbwQydB2c?=
 =?iso-8859-1?Q?sahO7nMkvMVdM1O1UFesYFnIsD9tMGOE0tRetxTZkI1HMZLR2i455bEtPv?=
 =?iso-8859-1?Q?Y0McRlN282Lcl64a5Wmyw/4tXvadMkcbPpITvxobJahZYdEGDr82XS3ONT?=
 =?iso-8859-1?Q?XbDdLqGnv0ch4lbqjZ9u8KQFUrP3+6/DkgHmF9MGAutFMuGndUVAaGIBpn?=
 =?iso-8859-1?Q?m9BIP5JEcgi59j9itbzHPcJkjKiiuA0FYvn9DViRrTRgr3U65ONfkFM3D+?=
 =?iso-8859-1?Q?IqXoTym1h/vOa4bxluSWATGO2nxxt1JEn+oIAVuNqgZv8K9auJeDjJHQNL?=
 =?iso-8859-1?Q?s=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?OoF6UaOM5NKV8axQvMerw1tPzjFLlGR0uJx0kC2nvP2U1QMjqfKnpDBDoP?=
 =?iso-8859-1?Q?AlHqTzPH/FnzjLeeQz7dItvu8f+YZw92tA2PzmjVmAvxzkYybnkCvMOnpE?=
 =?iso-8859-1?Q?g7vrxZzoGRXWw5v0ODCXHtSrFRuSeNmv1ODPG+SrvCZcAHQ/vI/nGMvN3L?=
 =?iso-8859-1?Q?IPApejImHNApA2MVEfGJqR7y+qLe7Brw5QkCV2xceayRMEOVsv8YcN7FR0?=
 =?iso-8859-1?Q?5FsabXG2lejGz9fs9os4htYIrIuWGdzj74F8dv2Vrofy0+epjMmcxCt2Mx?=
 =?iso-8859-1?Q?A1xns2ZIZCb43fRS8yDkkQAUSzMbRdUiL9q/uluPjAF55Gi18X9dEEXP2Y?=
 =?iso-8859-1?Q?MQELqCl6urDexblQSXE1RCwz2vrkP0wPQWy+FVyvyM2l26kcwo03dw9bt0?=
 =?iso-8859-1?Q?UeAZXTEFhubK3w8a2hNmquneuwHE8+RfsqSRzdS9QJNFSfCMnWgrIgvebV?=
 =?iso-8859-1?Q?OfPKDM2DQmLVPwK6b7pK9ozabc5Qo8LhoElFMDmmdRckeWfTE3kL8q3pU5?=
 =?iso-8859-1?Q?/G/nB8t1c+jtBN7xHBueggoiApZbNjMHVRle2ETEGek5KIlsj80tl4blKE?=
 =?iso-8859-1?Q?AK9V6dE9p731EDSj4bdA5ABXc3XHfrKzW60kyqh3w56OoZiBcPZH+zm2Fy?=
 =?iso-8859-1?Q?w7KisnbWXbj3FuW3H+WHqE1HLnm08U+NMiSZKPy1+zG2SDaJisDh6e9yey?=
 =?iso-8859-1?Q?U1g1HrrFr6/6nz9+RF7xFNg9jY0pyrG2ah0MIejX+s3clDgEdjO6LthJae?=
 =?iso-8859-1?Q?UduVlhbaIGwgsU4QwXwWTMVGxKlQdaE+lMCAHekRE7BOGjO63Nj9K/87q2?=
 =?iso-8859-1?Q?F8r5R06cJCMAVcqnNCfnmbTVfDiE6O7DDaipuBmTbkw8COyKMqmCA7bWvS?=
 =?iso-8859-1?Q?63OquQh36VjIOnFkbGM6USNVTPSlUB/pc2rDuDfW3dlJD5PNfusOWJ7aP1?=
 =?iso-8859-1?Q?ytuAQZuCYaAGENPsmBecyYUAEhwFW2vWv0iZUIC3uv8x5i9N+NmYu0Gr5H?=
 =?iso-8859-1?Q?ay7K4A7LLpaYF8tR/swp9FOXBjbB/kvOSk7y+dXI2lNGkP6IZtE/dni6xl?=
 =?iso-8859-1?Q?GLY432xt0QW+BFaEx90oUXylpYbzaLgsdypGCtsHyqXmhRUQXDKjaSGkMD?=
 =?iso-8859-1?Q?uV24MuBj6FNq8mfW57w5zXJAJn4nMvZ1AagzXsGRmugnCrtRRg3dQ1kPit?=
 =?iso-8859-1?Q?NJ9riJyaGrZhdjcEhwayczy8QE3oiDLcRB9ue2zduyKeb6BfbDcfCc2cIq?=
 =?iso-8859-1?Q?7vb+btCZ1JY6726kD53Zm+CHJTZue36Q/67ArfThlwds/EaWwTneXJGkCj?=
 =?iso-8859-1?Q?KzbQVv6iEjKmfiZX7eZKfgL+1IxQSaqWTKJJPuPAlAdwsaqcoUi/zlW3kl?=
 =?iso-8859-1?Q?qC10ISaTw/cxkig1cvfP0Uy4/yblI4zQxF4sDt0n8wxSPPD1siKf4DKT1e?=
 =?iso-8859-1?Q?DRwEyunlkQ0+58uGpn6PInw5iYJfnc7yj2WTixVEIohJf5jSkjhXQjU5sK?=
 =?iso-8859-1?Q?qt0bYMC/71C//fYlt4A4ArXBOO7GXPJez7Pwo0bTdvmzFCkG8dYA7dG/Na?=
 =?iso-8859-1?Q?ZHG7keH3qal5YxUSlDaBzgoT2CqWTojDwsQHYf+H4wEnYVdp4209eizXYZ?=
 =?iso-8859-1?Q?gObbL0CCZ0QTqjblmy4ZUjTy9f1Hhd6Czj8z7Paf3EvgrxkVWfws1HQw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3aa040c0-4aa1-4cbf-af28-08ddd905f714
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2025 18:36:20.1862 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MTnXezPamf8QqcGx9MmTJoNjONS63i5QptDa7jk3YNRlYlA+vcTZwR7AEdVv+PeTZrbfV1iM92ZT7Wm+0OyBUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB8890
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

On Mon, Aug 11, 2025 at 10:21:46AM -0600, Summers, Stuart wrote:
> On Fri, 2025-08-08 at 21:34 -0700, Matthew Brost wrote:
> > Take preemption into account when resubmitting jobs, and adjust the
> > new
> > LRC head pointer accordingly to skip over previously executed parts
> > of
> > the job. To support this, save the head pointer of each job when it
> > is
> > emitted.
> > 
> > This code can either be leveraged or reused for VF recovery.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_guc_submit.c      | 23 +++++++++++++++++++++--
> >  drivers/gpu/drm/xe/xe_ring_ops.c        | 23 +++++++++++++++++++----
> >  drivers/gpu/drm/xe/xe_sched_job_types.h |  2 ++
> >  3 files changed, 42 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
> > b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index 1185b23b1384..3ba707bbb74d 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -1954,16 +1954,35 @@ void xe_guc_submit_pause(struct xe_guc *guc)
> >                 xe_sched_submission_stop_async(&q->guc->sched);
> >  }
> >  
> > +static int guc_lrc_offset(struct xe_lrc *lrc, u32 job_head)
> > +{
> > +       if (xe_lrc_ring_head(lrc) == job_head)
> > +               return 0;
> > +
> > +       if (job_head < xe_lrc_ring_head(lrc))
> > +               return xe_lrc_ring_head(lrc) - job_head;
> > +
> > +       return lrc->ring.size - job_head + xe_lrc_ring_head(lrc);
> > +}
> > +
> >  static void guc_exec_queue_start(struct xe_exec_queue *q)
> >  {
> >         struct xe_gpu_scheduler *sched = &q->guc->sched;
> >  
> >         if (!exec_queue_killed_or_banned_or_wedged(q)) {
> > +               struct xe_sched_job *job;
> >                 int i;
> >  
> > +               job = xe_sched_first_pending_job(&q->guc->sched);
> 
> Can we reuse the sched variable at the top of this function for the
> argument here?
> 

Yes.

> Also, I'm still going through, but how do we know the first pending job
> corresponds to the context we are updating here?
> 

The pending job list is per context (queue).

> And why only update the first in the list? Should we make the same
> calculation against all of the pending jobs?
>

Jobs are executed serially within a context (queue, LRC, ring). We just
need to look at the first pending job and skip over any instructions
which have already been executed. BTW, this idea is meant for VF pause /
unpause but job submitted this patch to convay the idea in the existing
GT reset path as it applies here too + provide hooks for that feature.

Matt

> Thanks,
> Stuart
> 
> > +
> >                 trace_xe_exec_queue_resubmit(q);
> > -               for (i = 0; i < q->width; ++i)
> > -                       xe_lrc_set_ring_head(q->lrc[i], q->lrc[i]-
> > >ring.tail);
> > +               for (i = 0; i < q->width; ++i) {
> > +                       int offset = !job ? 0 :
> > +                               guc_lrc_offset(q->lrc[i], job-
> > >ptrs[i].head);
> > +
> > +                       xe_lrc_set_ring_head(q->lrc[i], (q->lrc[i]-
> > >ring.tail +
> > +                                            offset) % q->lrc[i]-
> > >ring.size);
> > +               }
> >                 xe_sched_resubmit_jobs(sched);
> >         }
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c
> > b/drivers/gpu/drm/xe/xe_ring_ops.c
> > index 5f15360d14bf..4dad28f0614d 100644
> > --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> > +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> > @@ -245,12 +245,14 @@ static int emit_copy_timestamp(struct xe_lrc
> > *lrc, u32 *dw, int i)
> >  
> >  /* for engines that don't require any special HW handling (no EUs,
> > no aux inval, etc) */
> >  static void __emit_job_gen12_simple(struct xe_sched_job *job, struct
> > xe_lrc *lrc,
> > -                                   u64 batch_addr, u32 seqno)
> > +                                   u64 batch_addr, u32 *head, u32
> > seqno)
> >  {
> >         u32 dw[MAX_JOB_SIZE_DW], i = 0;
> >         u32 ppgtt_flag = get_ppgtt_flag(job);
> >         struct xe_gt *gt = job->q->gt;
> >  
> > +       *head = lrc->ring.tail;
> > +
> >         i = emit_copy_timestamp(lrc, dw, i);
> >  
> >         if (job->ring_ops_flush_tlb) {
> > @@ -296,7 +298,7 @@ static bool has_aux_ccs(struct xe_device *xe)
> >  }
> >  
> >  static void __emit_job_gen12_video(struct xe_sched_job *job, struct
> > xe_lrc *lrc,
> > -                                  u64 batch_addr, u32 seqno)
> > +                                  u64 batch_addr, u32 *head, u32
> > seqno)
> >  {
> >         u32 dw[MAX_JOB_SIZE_DW], i = 0;
> >         u32 ppgtt_flag = get_ppgtt_flag(job);
> > @@ -304,6 +306,8 @@ static void __emit_job_gen12_video(struct
> > xe_sched_job *job, struct xe_lrc *lrc,
> >         struct xe_device *xe = gt_to_xe(gt);
> >         bool decode = job->q->class == XE_ENGINE_CLASS_VIDEO_DECODE;
> >  
> > +       *head = lrc->ring.tail;
> > +
> >         i = emit_copy_timestamp(lrc, dw, i);
> >  
> >         dw[i++] = preparser_disable(true);
> > @@ -346,7 +350,8 @@ static void __emit_job_gen12_video(struct
> > xe_sched_job *job, struct xe_lrc *lrc,
> >  
> >  static void __emit_job_gen12_render_compute(struct xe_sched_job
> > *job,
> >                                             struct xe_lrc *lrc,
> > -                                           u64 batch_addr, u32
> > seqno)
> > +                                           u64 batch_addr, u32
> > *head,
> > +                                           u32 seqno)
> >  {
> >         u32 dw[MAX_JOB_SIZE_DW], i = 0;
> >         u32 ppgtt_flag = get_ppgtt_flag(job);
> > @@ -355,6 +360,8 @@ static void
> > __emit_job_gen12_render_compute(struct xe_sched_job *job,
> >         bool lacks_render = !(gt->info.engine_mask &
> > XE_HW_ENGINE_RCS_MASK);
> >         u32 mask_flags = 0;
> >  
> > +       *head = lrc->ring.tail;
> > +
> >         i = emit_copy_timestamp(lrc, dw, i);
> >  
> >         dw[i++] = preparser_disable(true);
> > @@ -396,11 +403,14 @@ static void
> > __emit_job_gen12_render_compute(struct xe_sched_job *job,
> >  }
> >  
> >  static void emit_migration_job_gen12(struct xe_sched_job *job,
> > -                                    struct xe_lrc *lrc, u32 seqno)
> > +                                    struct xe_lrc *lrc, u32 *head,
> > +                                    u32 seqno)
> >  {
> >         u32 saddr = xe_lrc_start_seqno_ggtt_addr(lrc);
> >         u32 dw[MAX_JOB_SIZE_DW], i = 0;
> >  
> > +       *head = lrc->ring.tail;
> > +
> >         i = emit_copy_timestamp(lrc, dw, i);
> >  
> >         i = emit_store_imm_ggtt(saddr, seqno, dw, i);
> > @@ -434,6 +444,7 @@ static void emit_job_gen12_gsc(struct
> > xe_sched_job *job)
> >  
> >         __emit_job_gen12_simple(job, job->q->lrc[0],
> >                                 job->ptrs[0].batch_addr,
> > +                               &job->ptrs[0].head,
> >                                 xe_sched_job_lrc_seqno(job));
> >  }
> >  
> > @@ -443,6 +454,7 @@ static void emit_job_gen12_copy(struct
> > xe_sched_job *job)
> >  
> >         if (xe_sched_job_is_migration(job->q)) {
> >                 emit_migration_job_gen12(job, job->q->lrc[0],
> > +                                        &job->ptrs[0].head,
> >                                         
> > xe_sched_job_lrc_seqno(job));
> >                 return;
> >         }
> > @@ -450,6 +462,7 @@ static void emit_job_gen12_copy(struct
> > xe_sched_job *job)
> >         for (i = 0; i < job->q->width; ++i)
> >                 __emit_job_gen12_simple(job, job->q->lrc[i],
> >                                         job->ptrs[i].batch_addr,
> > +                                       &job->ptrs[i].head,
> >                                         xe_sched_job_lrc_seqno(job));
> >  }
> >  
> > @@ -461,6 +474,7 @@ static void emit_job_gen12_video(struct
> > xe_sched_job *job)
> >         for (i = 0; i < job->q->width; ++i)
> >                 __emit_job_gen12_video(job, job->q->lrc[i],
> >                                        job->ptrs[i].batch_addr,
> > +                                      &job->ptrs[i].head,
> >                                        xe_sched_job_lrc_seqno(job));
> >  }
> >  
> > @@ -471,6 +485,7 @@ static void emit_job_gen12_render_compute(struct
> > xe_sched_job *job)
> >         for (i = 0; i < job->q->width; ++i)
> >                 __emit_job_gen12_render_compute(job, job->q->lrc[i],
> >                                                 job-
> > >ptrs[i].batch_addr,
> > +                                               &job->ptrs[i].head,
> >                                                 xe_sched_job_lrc_seqn
> > o(job));
> >  }
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_sched_job_types.h
> > b/drivers/gpu/drm/xe/xe_sched_job_types.h
> > index dbf260dded8d..359f93b0cdca 100644
> > --- a/drivers/gpu/drm/xe/xe_sched_job_types.h
> > +++ b/drivers/gpu/drm/xe/xe_sched_job_types.h
> > @@ -24,6 +24,8 @@ struct xe_job_ptrs {
> >         struct dma_fence_chain *chain_fence;
> >         /** @batch_addr: Batch buffer address. */
> >         u64 batch_addr;
> > +       /** @head: The head pointer of the LRC when the job was
> > submitted */
> > +       u32 head;
> >  };
> >  
> >  /**
> 
