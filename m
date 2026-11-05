Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 078D3606A31B
	for <intel-xe@archiver.kernel.org>; Thu,  5 Nov 2026 23:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mY9+vit+
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2D1610E0D0;
	Thu,  5 Nov 2026 23:43:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 251EE10E0D0
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Nov 2026 23:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793922183; x=1825458183;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=WN1sOxSReW/7Sh1AXiIbT2OXtAB/V7a/z/OJvez+yLk=;
 b=mY9+vit+0UZYZq1WSrsvMdIbCSoiFz5ZDGBHsAZF4uFtiwyUrIxtsYO0
 85TFsA6HKpad+xXZqvxdKFh8y6tckZ9ccZFSuU/X7VRpg/cjJj6Y+ktfg
 gzb8aMuDjsZyVzFcK+WvDpzqIIUntEWsIT0s56bN9AA07UjBSJzNhnBAd
 bVNvG6DRswDjuZNudiz1NR5QaYvA5rl1ChNHrYWqr0sN+t2MK+HTr0kjf
 yEpax05pSJNStR5sA1101IAofycNvD0hwJ2xlSkQJTrkprbRp2fODWPHO
 quUbudB4dMidsZxIblaQ+z/R2mbnXsL1GaFauz3kI58Yp4ThGkbsKNpDT g==;
X-CSE-ConnectionGUID: ecLz1+YaScyvhYRA5yqjyQ==
X-CSE-MsgGUID: bKyn4UjtTtWps4JGrRG97A==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2620478"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2620478"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 15:43:03 -0800
X-CSE-ConnectionGUID: X9hD23dmQdW4/NFJfsJbYw==
X-CSE-MsgGUID: PvVTeCHWRaqdzgDjDqEhWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7473363"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 15:43:03 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 5 Nov 2026 15:43:02 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 5 Nov 2026 15:43:02 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.66) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 5 Nov 2026 15:43:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pLUkDdmnSubib4g5waXjZ0p1oCUKZmWKyyF+9GCqtPtc+a10G6yBclq8FwBNCjcUmPyCz49tINl2USVMhcZd8iclaImxg4gKswHeBQAUkdpiRcI/UjNT1UCYxL5IrwDL2vKxIejONfsikrD+M8Nhsj8V1y/6rMEjAFHQJJXuLBfdwdmXrRihclthGoEE9Zd/jzCGDHsTwj8xiH+gy6p0wKuI7CCkKu5a+78nx1s5u7qKQQFQWE4w2Lk0B6UV0hs8+R94ykl6zTZ5QrLSWzTM4OLYt5VeQwZ+AR9tOXCEtaYpbHGcc88e+8x/v6tkyH9Tzaxauc9vFvJi0WA/1wCOkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y5SzI7dS/uWZEk7wrr5xKcIW8mFOTZEh+reFHW8ElNU=;
 b=cLMZr7Zw9Jh7eBfqVlhzDCIBP9CIPXDQEUK/q2RAoQbiyN/2IJMzRw8dfDUY+7FCdzOOWIgsiSxlEajptDU/9HoxWQk1y5l62XFF2RhyK3ZXwkNmxK1vg6vV/8+O+TtrmdCu8UKNECeTQB5mnYJjkcQf5gQ9etOs7myFEYTZ4AwUsPauDqPuUVQvtSi7UUUDo2gI6cGP1b+WKIz9Dc8wTGXENYFMKeGCUi174u9CrnMMJWVeMcBwg6cEiR1edsYWsRvTGuEakqzNAW43iLw5rDkocXbfvEsMe0ExN79/WV2LU7j6KL8qjD3HXP8/6kVffOVyzbCqUSui1m7KbVMcPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8185.namprd11.prod.outlook.com (2603:10b6:610:159::12)
 by SA1PR11MB6966.namprd11.prod.outlook.com (2603:10b6:806:2bc::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 23:42:53 +0000
Received: from CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::443e:8ff8:c5ac:1ac4]) by CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::443e:8ff8:c5ac:1ac4%4]) with mapi id 15.21.0592.007; Thu, 5 Nov 2026
 23:42:52 +0000
Date: Thu, 5 Nov 2026 15:42:45 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Daniel Charles <daniel.charles@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Fei Yang <fei.yang@intel.com>
Subject: Re: [PATCH 2/2] drm/xe/cri: Implement Wa_14028586678
Message-ID: <20261105234245.GL6162@mdroper-desk1>
References: <20261103021418.654723-1-daniel.charles@intel.com>
 <20261103021418.654723-3-daniel.charles@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261103021418.654723-3-daniel.charles@intel.com>
X-ClientProxiedBy: SJ0PR03CA0054.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::29) To CH3PR11MB8185.namprd11.prod.outlook.com
 (2603:10b6:610:159::12)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8185:EE_|SA1PR11MB6966:EE_
X-MS-Office365-Filtering-Correlation-Id: 304ce3aa-a37e-4a84-9790-08df3b9681e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|260925022911599003|260925021311599003|260925021911599003|11063799006|4143699003|261009223027099003|56012099006|261021121427099003|261102123227099003|261026140227099003|261026121527099003|261022105027099003|261028144727099003|261022113327099003|261022075727099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: UB9N+UQfaG4d9CkpLkw39TEynrREs1VAXNkyInx1R3wAfkc9WDEj5zkASagsiKVbz7VyAX/p7GPTNo4ifHuuWTf2GIff+A+rirwQx2YtfwfsCr5M80/0jHs/AIUCLmjtyETR0rK9OPkfhfS4rwzS/5ZuM9S7CAVjwDJtZjWqi5dBzbq50Ru2XWl6m2T1W5r2S89yAYc3PES/TM/9sU5PvWLJqrE4Gooz4M4JLU8GtfpMFpr9PUq/fcx+r+bLZaGtqncuOhaiNfRXuFCShbuohzJM+bN9GGBCZwNorIPKlusYGjmtT15vNRfUDvLc4D1m+yqTlMHd/+GYaKn4pNCVmfGwBeB8T0fCFoSZoLe2kSdRwFTdHvA9kHzsDuuhqJ4/FSzyx5iLWDV+/Y2rehsTjZ4jJEQw/dbj6uvHmSMrLknYvR+oxPAnwj53nu/DwiPq+PBCkoi1aUT6jKI9o8oqoW3UxOKT/UvSvZ3MCXWIveabJc8TDh4dBs1R7hj/l7F6UIunibpLrIZI6LRvHwLjeZkChLo+OZK62T1vEFijyXV7edw4lCNOOW9y1QKCPQvFEy4/zmvLXq/dwt9tO8tKZjSmC5M3lCsP3QTC27XCvwAUginbR+745cyzykHHyPj2lDJKmr9nxS10wEU3nMF0ZRiUhvWc0h7W6U+6NyGAFDY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(260925022911599003)(260925021311599003)(260925021911599003)(11063799006)(4143699003)(261009223027099003)(56012099006)(261021121427099003)(261102123227099003)(261026140227099003)(261026121527099003)(261022105027099003)(261028144727099003)(261022113327099003)(261022075727099003)(10067099003)(18002099003)(22082099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qKO/CKgx+jWcklXs7T8f7ghZ4Lnbbyd7GXqyhC38jtFT//0SDbPKmeo7XaKf?=
 =?us-ascii?Q?ogoHlESXFElmUBU8f/GJhpK5LqYcr0b1rReg2mJXJhchxLZOZdqjJDvtKn7n?=
 =?us-ascii?Q?4Reh0WbOkmVvO1b0MN8IiW4MoXI8DnzpvuuH+JH/GauWLjp33iiGONZ7xUaG?=
 =?us-ascii?Q?tRuimJx2wnrdPwGKLFgQn2oniVXZJ7Qj2NDsJ8cdlCBYYN7E23kEj+6Eblrs?=
 =?us-ascii?Q?qBmEmCAYpL7hdCb6AgS9CY4+JzqZXwhdaooFj8irB4MIYgJlPN26Si8v3Sdt?=
 =?us-ascii?Q?o3snN6c3pIlTejewsrb2QaAbe97MvpBguxZiAvaXtnhB6z0I01d+GiXm4AQp?=
 =?us-ascii?Q?I+th1wwRgcxHnH4qNOVZGHl/QM/HhowbpGaXNAtWc36fpVOwRooZMqwrdZjf?=
 =?us-ascii?Q?PgmAe2pe6hxExHVSbqmspFpgrNkDNqRww1+8+7YtiLoh5uvRO8ASqksNHmjI?=
 =?us-ascii?Q?TxWTyEmEJ60jT8R9PhPJBe2LCp1HKrQ6V/IwwhSJGC7Z74ijoRxDpjETs7yd?=
 =?us-ascii?Q?F1EvyQVNs1fCyNy74XFEHYQIdND6tEu7dQznGFQO/K0AUTnYJPw/mByMQBDs?=
 =?us-ascii?Q?qlylOZ750a1pBQLKVbi6oAjTVMxx0kmJz3yEPTfQsoDT3a7geL4YfTM0nTee?=
 =?us-ascii?Q?Q7Kc6UurXwqRnvHodcqRdS0g2KBo9ZLagVXbMx8B28NoCEdzEoxw38KqafQw?=
 =?us-ascii?Q?ishoLiZEN5LcDz1zy+VqDuohQ3PDAnNcnReEYZrvRT2/NWTtec3WPTVfqEe9?=
 =?us-ascii?Q?sXh1g2fy5guORgp7gcGKta0oyg5XArQfcmpFO/CGAYPowDHYQ2MjpcBYy49h?=
 =?us-ascii?Q?zQ+1GKoK9MPZ7RgL3ZY2FkPTEC63ghP/1U/JIK50IWNmZwI4Rs2Dwmu7F3bV?=
 =?us-ascii?Q?YNEC87zcIQArR0Z1rOOtmr4jVLaCvFYGnUtnWUzFhBQ3f+o6DKH50JpBmzH6?=
 =?us-ascii?Q?Pq+E3LRnR/nZVGrO1Lrr3o9DSupyWAfn8KDT94QBtYBegS+BDp9FhYCs9unz?=
 =?us-ascii?Q?WKstIdjUk82cf4IRmJ8kc6kEPfu6C/alyJJ/qOFppROSd8yNygV0b2CACI06?=
 =?us-ascii?Q?tZK4iOqde1uPoGABz970DOOqzMuChqLAKlYl3XNtzP289uIiy5liklE35XGy?=
 =?us-ascii?Q?kez04zX++a3adSKo3fyc5z+lUY4ipfImuY6B9KW6wsrLbi9f0ixJWa+g5Qyh?=
 =?us-ascii?Q?v2PdnV35hivV92WKki6P2iijw+QCZtDYNuMJqLIz6RBV6Jup5XTxKxiSAkWU?=
 =?us-ascii?Q?ItKljWw65gSOtV340kOj3DHMov5VmN7Cj5qlmM5QrnofFfrTrkbzChyAdfSJ?=
 =?us-ascii?Q?bkA8K2G6kDAUs6rWflSi3oCDDBvS/mkQE7876JSHNa9zEK9j5ZWuwSLPqlsy?=
 =?us-ascii?Q?y+BznTplIydSmFqt1ZW9gUhApo61iL0sqO9YSjvl7Q8eK6YwoCZg4oywNcLo?=
 =?us-ascii?Q?ysi5TJ3vpD1BND1cAX6IrFcEJpWVC1VP3Xk+zf+5OqYIT++SFgSMP67pg2WV?=
 =?us-ascii?Q?7P5Tym3UsSh2rd1To1nZHbqp/7Jn1i2z5K/DSvvV7Ql8GlpV0GTt8JnadQWE?=
 =?us-ascii?Q?wrZuzY+O1Nnd3OHIzrNpAehcO/zdzs/dO4S8hd54EwYDMvY0qjax+RmcyrQD?=
 =?us-ascii?Q?uDNKinfD1ezKFLCfL+UWWru21p/nQ4XuBJcRSS+rFpxDjkHHv4sybIfIOP4a?=
 =?us-ascii?Q?BNledu0UABVfAeTB2g0p1PjOjTipWQ+iyxNF5JkW6f+zUzD5Dy8CuEfj1Wyt?=
 =?us-ascii?Q?fj+X4D78pWZkNGDZBoX6PCEfAoeplkY=3D?=
X-Exchange-RoutingPolicyChecked: 3M5PqeWHi7dao2i+Qv7H2DLRFH512DucLHWIsZZsGwzWznqJaAGxy0IttxuY0tIX4glPklvToEQKfNvO5EyMVP338lTcrVn6sSgLoIZtkEFzmhIfPfBPzS+z6WaS1kenyMeXiL3YDo35k+sKP8asKMYr0f0r4qeOeNgkostXFXxJyh6OMpNkZ32A4dWwXgFgzIUgMSP/KyWLFRCbxKj0X6IV2D2xjB+pIyENK4qz5xjvitwyuRk+6B4Fq43yI00pET2qLI+RtNuTi/NI38++zSTD5YbjTmuqn1g2voM+PkLtErPcWPh3gmIIKnaOUeeaytgoYmP/sw/DCTupKkDz8g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 304ce3aa-a37e-4a84-9790-08df3b9681e6
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 23:42:52.2225 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VW2g8ojvp7SiPl3lN8Fa+ztDXwdvLErBDx7mZwxWEgb3M5V0WnCK3XR6eqwjZ/quC05YjQPUKf250OGzLqBrbSrTJNvntpbzjnHAxgKSNyY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6966
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 02, 2026 at 06:14:18PM -0800, Daniel Charles wrote:
> From: Fei Yang <fei.yang@intel.com>
> 
> Implement the documented Wa_14028586678 hardware workaround on
> Crescent Island by updating the L3 class-of-service and caching-policy
> fields in DWNSTRM_ACCESS_MODE (0x144154). Change bits [7:4] from 0x3
> to 0xc to select L3 class of service 3 and write-back caching, while
> preserving the other register fields.
> 
> v2:
>   - Move this workaround into a dedicated MERT table instead of
>     placing it in gt_was, since MERT registers are device-level and
>     accessed through root-tile MMIO, outside GT forcewake and GT
>     save/restore bookkeeping.
>   - Add an RTP helper for full-register device MMIO writes and apply
>     the MERT table during probe and after pcode is ready on system or
>     D3cold resume. Match Crescent Island and skip devices without MERT
>     and SR-IOV VFs.
> 
> v3:
>   - Use PLATFORM(CRESCENTISLAND) instead of GRAPHICS_VERSION(3511),
>     because device-level OOB processing has no GT context and the
>     graphics-version matcher requires one.
> 
> v4:
>   - Switching from RTP to OOB removes the need for the MERT-specific
>     table and RTP helper proposed in v2. The v2 and v3 notes are retained
>     as revision history; this version uses the device OOB rule through
>     the existing per-tile workaround helper.
>   - Program the register on every tile, assuming the workaround values
>     are identical across tiles.
>   - Use a masked read-modify-write to set [7:6] to 0x3 and [5:4] to
>     0x0, preserving all other register fields.
> 
> v5:
>   - Apply tile workarounds after PCODE initialization completes on system
>     resume, matching the runtime resume ordering.
> 
> v6:
>   - Split the system and runtime resume changes into a prerequisite PM
>     fix with its own commit message and Fixes tag.
>   - Rename the class-of-service field macro to L3_CLOS and drop the
>     redundant MERT capability check; applicability is selected by the
>     device OOB rule.
> 
> BSpec: 73603
> Signed-off-by: Fei Yang <fei.yang@intel.com>
> Signed-off-by: Daniel Charles <daniel.charles@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/regs/xe_mert_regs.h    | 4 ++++
>  drivers/gpu/drm/xe/xe_device_wa_oob.rules | 1 +
>  drivers/gpu/drm/xe/xe_wa.c                | 7 +++++++
>  3 files changed, 12 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_mert_regs.h b/drivers/gpu/drm/xe/regs/xe_mert_regs.h
> index 99e5a26da6572..64570ea6e718c 100644
> --- a/drivers/gpu/drm/xe/regs/xe_mert_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_mert_regs.h
> @@ -8,6 +8,10 @@
>  
>  #include "regs/xe_reg_defs.h"
>  
> +#define DWNSTRM_ACCESS_MODE_GAMREQ_MERTSS	XE_REG(0x144154)
> +#define   DWNSTRM_ACCESS_MODE_L3_CLOS		REG_GENMASK(7, 6)
> +#define   DWNSTRM_ACCESS_MODE_L3_POLICY		REG_GENMASK(5, 4)
> +
>  #define MERT_LMEM_CFG				XE_REG(0x1448b0)
>  
>  #define MERT_TLB_CT_INTR_ERR_ID_PORT		XE_REG(0x145190)
> diff --git a/drivers/gpu/drm/xe/xe_device_wa_oob.rules b/drivers/gpu/drm/xe/xe_device_wa_oob.rules
> index 356b4707dafea..753b2a4a10067 100644
> --- a/drivers/gpu/drm/xe/xe_device_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_device_wa_oob.rules
> @@ -6,3 +6,4 @@
>  14026633728	PLATFORM(CRESCENTISLAND)
>  14026746987	PLATFORM(CRESCENTISLAND)
>  14026779378	PLATFORM(CRESCENTISLAND)
> +14028586678	PLATFORM(CRESCENTISLAND)
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index c94fe7753f9a9..a930ab94cce2a 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -16,6 +16,7 @@
>  #include "regs/xe_engine_regs.h"
>  #include "regs/xe_gt_regs.h"
>  #include "regs/xe_guc_regs.h"
> +#include "regs/xe_mert_regs.h"
>  #include "regs/xe_regs.h"
>  #include "xe_device_types.h"
>  #include "xe_force_wake.h"
> @@ -1031,4 +1032,10 @@ void xe_wa_apply_tile_workarounds(struct xe_tile *tile)
>  
>  	if (XE_DEVICE_WA(tile->xe, 22010954014))
>  		xe_mmio_rmw32(mmio, XEHP_CLOCK_GATE_DIS, 0, SGSI_SIDECLK_DIS);
> +
> +	if (XE_DEVICE_WA(tile->xe, 14028586678))
> +		xe_mmio_rmw32(mmio, DWNSTRM_ACCESS_MODE_GAMREQ_MERTSS,
> +			      DWNSTRM_ACCESS_MODE_L3_CLOS |
> +			      DWNSTRM_ACCESS_MODE_L3_POLICY,
> +			      REG_FIELD_PREP(DWNSTRM_ACCESS_MODE_L3_CLOS, 3));
>  }
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
