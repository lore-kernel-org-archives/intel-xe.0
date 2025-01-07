Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 373C5E77198
	for <intel-xe@archiver.kernel.org>; Tue,  7 Jan 2025 23:14:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F16AA10E356;
	Tue,  7 Jan 2025 23:14:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JmnfuCbo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9213610E356
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Jan 2025 23:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736291689; x=1767827689;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=1dtVB3KHFxPZ3YglYiGI+uFnuOlshKNjoRZ4Uqr5EtM=;
 b=JmnfuCboyisuqhvYMEyePiONUuG1hm57lygmq67LMjI+NdnWvh66mj3Q
 fFdjQnmik5jcpH0huBevrBUtrJ2L45ZMmFv7GHWwcbC2N/kNYVerKL/FC
 +lO/wcQwkEE7wG9WIJy08ixwlA8VFas9hRSbcKFJGdxvqw0nBQ88AMmYY
 YOEyTYfg7xctkS2oP1hDDwB7TIceigpcgQn02Xc786jLWkuLA+XCX0oqn
 J+G5B9VhIQX575N5+y/nbaeFT/udCd5yZUkPfP2Xlvhrjh9Rjx4OaErfT
 /umF4rdG8MAt9D/m5f4HGbvV1IzGsSQsfs1gyLe1OKN/p7cCCb4xY0Oib g==;
X-CSE-ConnectionGUID: 8X63DnLxQcGmlPDbWKoudw==
X-CSE-MsgGUID: 3wPDufazQlaJzqCMmu4N8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="36661795"
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; d="scan'208";a="36661795"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 15:14:48 -0800
X-CSE-ConnectionGUID: 8Ir7XCOhRb2gnD3JRjx9hw==
X-CSE-MsgGUID: tP5CN7mKTw+bgoHEmew+GQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="107539451"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Jan 2025 15:14:48 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 7 Jan 2025 15:14:47 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 7 Jan 2025 15:14:47 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 7 Jan 2025 15:14:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xcILdEWiexcZmCU/nXOP66NdQgmgo6PxFsxRLGJgKK6MczOrxl8mGQkagS2uieyrohv9UTLdIFi2ZK9NZSDqx1asTkwjUFFl8cfbpgQgFlSqxpUsuhYVa1uBOFpsmb0e/mAD4vE16/EVqwQcsmr9KgxvkNZKwZ3Y20fLG7jtF4cf/XsEeSmtP6sgJVTU/kUspis/a0kKYTHyq36VpJbsunWsyBLljqeRhjRxUNf1PToyJB6zbs0FDS60Te1wTeTFri08kjT8QeFscb0hrDuvDMIA8tk3c9VQ4X+UJfT7TIXhseB99R6dCdMNKSkPgIGNHozUc2hdFoGK895Y8SlNcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E10TDCTk2cpEvm/YasKdOJtx4N4hWixmoYdTrqf5aOA=;
 b=mz58Rsz2uz+006ZMo6rN4EjNof88uWTF0TKi4RqdW8bg364o3uGs86t9YkvyQeg9wIeC3g14FKw2sHEJNE+V6JYKuJsdiTiK0zvlEGRLuOlMIo/n9sR8PB3A0qDxre5IXGGN/IU6L0u9hb7GaqxvRIAYqAG95Kbq1a+VwXTV3FaXaZKH5XasRUB97f83h1kd4xpr7vhylzuQXD1z5S5XeGUQrTSnCSWm56z0eLfBcoI7hmymzALJpgu6eTj0ZS+EVAWTr/HPoZwo4NBaC52I0U0T8C1DyZyEoGVEOE5FMcop4PxfrPK7FJbm0FWDQ99eINjaGEbvULnO4hufxBKgbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8185.namprd11.prod.outlook.com (2603:10b6:610:159::12)
 by SJ0PR11MB6694.namprd11.prod.outlook.com (2603:10b6:a03:44d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Tue, 7 Jan
 2025 23:14:25 +0000
Received: from CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::1be5:55ed:3261:fefb]) by CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::1be5:55ed:3261:fefb%4]) with mapi id 15.20.8314.018; Tue, 7 Jan 2025
 23:14:25 +0000
Date: Tue, 7 Jan 2025 15:14:21 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Adam Miszczak
 <adam.miszczak@linux.intel.com>, Jakub Kolakowski
 <jakub1.kolakowski@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Michal Winiarski <michal.winiarski@intel.com>,
 Narasimha C V <narasimha.c.v@intel.com>, Piotr Piorkowski
 <piotr.piorkowski@intel.com>, Satyanarayana K V P
 <satyanarayana.k.v.p@intel.com>, Tomasz Lis <tomasz.lis@intel.com>
Subject: Re: [PATCH 2/3] drm/xe/rtp: Add match helper to omit SR-IOV VF device
Message-ID: <20250107231421.GB3224633@mdroper-desk1.amr.corp.intel.com>
References: <20241211064211.781820-1-marcin.bernatowicz@linux.intel.com>
 <20241211064211.781820-3-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241211064211.781820-3-marcin.bernatowicz@linux.intel.com>
X-ClientProxiedBy: SJ0P220CA0003.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::34) To CH3PR11MB8185.namprd11.prod.outlook.com
 (2603:10b6:610:159::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8185:EE_|SJ0PR11MB6694:EE_
X-MS-Office365-Filtering-Correlation-Id: 035357f7-9f64-4ab4-7dcc-08dd2f7106b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fw2fd0+D6hq3jo69y4WU0X/4LKqI1bforpuncwc11MbIFiUIjdJiSVw3uQpn?=
 =?us-ascii?Q?Kfl35jrhoWojEJJGLKt0z5AiMZBWmhw+XSBM4onPVAP0dm2jj06GLalR0rnj?=
 =?us-ascii?Q?3vNZPd5hAHE1Aum9w+yciwDmSZsRFRewUGggpkebUgZFPcc83tw4YMi6UYip?=
 =?us-ascii?Q?b18lthWDnV9Pgl2l76fNDqhz1DmjM3iwlBrhvrOkyPvynwBuzL0j/OcX/va1?=
 =?us-ascii?Q?Rztbfg2vYwbbwWwM8YWRycAgpw+OaizI1Wwrk///MtCYPJ/XPVKBOeM/4y3j?=
 =?us-ascii?Q?WdcF1FItSzY15T0ZbWmxacW6vbkXbD5WaDwN1jEynpFv8q65eTa/rWkcNprb?=
 =?us-ascii?Q?fOrnh0EN6YxnAwjVslutbSMJ0S8+FNcKWgOI0TWMhYicz22azba5fRX7veUj?=
 =?us-ascii?Q?H1WHVfg1gC85HM4PccwOvmuRn4DwukCygp5FWchQPnymtL9+dJ5dfyZayker?=
 =?us-ascii?Q?8vlFrF+IBWfC/P+qYc/d+iShgK0AxPYm2snVFiaikJspQHzjn3+SQgTFPTpG?=
 =?us-ascii?Q?9xgF5wwX8IzFaKAne8QMSr3CyK9K+J0QbD8utG8zPunBk2N/t649GDXH84VH?=
 =?us-ascii?Q?qMNPX5prEW4YXPpvQib/yKh7csZCPUNlcJmHBhQJZxKZPRsY1PeIq0l6zvgr?=
 =?us-ascii?Q?bT4OOINxQogsKFzicFu3x43rla1XPJWhecs3WqlV+3quqKidEmw5jQEYRqed?=
 =?us-ascii?Q?TEBfKj9U/bppm5tKR9Vgmqx46sTvrX+w+46qQ5v6KlGiXOd/CGX0IiGjJkmo?=
 =?us-ascii?Q?EMW8EMaOi4KsD93UhjdxDP1oKZ844/pSCel0gNUGF02JrEKodxNkm+EgEl7F?=
 =?us-ascii?Q?j6YG49z4rSWS5HmbuxKpLMRx40LRoU/7Yh8b8UVY4uGfM4iNh9rVebkBWHW0?=
 =?us-ascii?Q?coOOGnV8fHLu7DISgsM+cP3FoBUofesvyDiAjEPl1UE/bh67uqH3m6cU2id2?=
 =?us-ascii?Q?4jjjFOLLJ/75DdQ0/mknfNaH7rwQAC7lZdImKwgEjRLxyYgS/Nw56Sd4D9Dj?=
 =?us-ascii?Q?Gd3u+ovB9tC5+wxAsUBF76PlG21NnmPqyTIbJN161wtsPEErXDoPTfJTvN3s?=
 =?us-ascii?Q?I5ejnK6UYIscQFOrxOdNZKQG16p+dqtccdlBzeRCHL2jrJL0Z5Rfr+TJyJyY?=
 =?us-ascii?Q?xfwnGEVOeYyLyE843ImS3+0Y0AEcAZJvMYvMz6LfjOyTNEI6UxXKReE63TKP?=
 =?us-ascii?Q?fM7ESWqX53nSglwpOMZiWUF5Imhkpp71pgl4MesN97IvggDG7zqMlQ8mAb7O?=
 =?us-ascii?Q?OlIf1X8SxXFK+1B1u9EgwZngkkRVaD6PZLqop3lmeXWDZl3ZmIWUwAK81Tt8?=
 =?us-ascii?Q?mbCi+dohaDVQxiNy8OEbxiFM6zklP/B/Qkx4pr8YB9gdNkd+Z7WyRhmDR0Dw?=
 =?us-ascii?Q?wQnE2mHvOM24EGYMymN2T4Zbyb/4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6tcMvi+6/J9Vq0UTH0XpnQa1zlzkXf9VIOTy2rUbjAkE4/NIth/S6OAn63Ny?=
 =?us-ascii?Q?gUhGi2gmOZRFM9BWkqLzlE/wH0YOjQCCT5mFuzL6TnYKmRsfHiZKHWTSzLLj?=
 =?us-ascii?Q?Y6p8SvIUbushYbkqlfoOjU4wIeb6l/i7hRTfPbVCTdB8evzHmln6dQB0FWjk?=
 =?us-ascii?Q?5QIbY6GHqSHEwoOY+DxV1N/Ffc4yPL+K3jkcJaaBhG40OEiUb/oUcgm+3cyx?=
 =?us-ascii?Q?DtikFmWukpcCo5LfqroTd/XKaMErk+Ey+0xp8icuz/deRDpD4i0k+7N32zr6?=
 =?us-ascii?Q?L4+RbaZ+yqH+8lhV1n6XPKj/DZTdxgcb9akW8YOXx49LHOOODbgYdBkblX2h?=
 =?us-ascii?Q?mea+U9vhSBYCPRaD2skLqg0c5rvg9whtaE9QWae43pbGIddj7k66OPa7Jx1X?=
 =?us-ascii?Q?/sM1uvPM0rSeKTIhmY6hkV//smKKUe1wQmjEtLsdj+9vDR89zxscesoitU4m?=
 =?us-ascii?Q?AXtItUVroGqw2Xi4HXkgqYVt1f/ssYcWFhpzEhdaYkGWqCyo8QJUfE9dkpmr?=
 =?us-ascii?Q?jI/EhpRzZhPc08iozEOJbb8ynDteIQS2T9H6AdJ1q593T1QYBACdTcayNlX8?=
 =?us-ascii?Q?o2hYDDu7SZLqd4eINY4Er8DEyFOrg3rEXMobM3Xej3w4dT1vX6KSS/w6sp+n?=
 =?us-ascii?Q?EpbsyR45/A6BF+XXesYDG9j8GqOvCDdqmH5vQpQU4UAxnYlGYS/4CaZIbEDC?=
 =?us-ascii?Q?5mmDlRoNtz0MVYW5BG2JOH0ceb5W3gm+YiJw4chrdKz1XfNnEvG8D5qN1znh?=
 =?us-ascii?Q?6iW3EXwAlXoMUmT3Tuci3S5v8dVrpWwkmow5ZRWMMDhWCM8s2ISStzETu2Vy?=
 =?us-ascii?Q?+cDXedMD3T24FRRPNHJuRMwf4KW7tjPlaXaFBiabX9UE2G46qJwQ1VDCyqqZ?=
 =?us-ascii?Q?K5sWSw7XlJp1Qspv/UC9/bmNIcRAjhtyEzlx7DKX5LwU4YwW3A1J13v1Bqql?=
 =?us-ascii?Q?oV8OnJ+NzFE9i1MTnCTqgVgG1sRCsc0i3Ol+osO01LXlQeaD3c6/JF3uEqED?=
 =?us-ascii?Q?YWumzvGA1eIiCnqArcc+m/8EuDdDs40WsWtHy+eWXth8tgoDC4tgMUSZkwi4?=
 =?us-ascii?Q?TRoLgyINVrzlpYoYeJy+cAkKsRXRX5TqI1Wf/eUmse/V0LLa0PaxfKYs/lMA?=
 =?us-ascii?Q?4h3r76JJMyWQZYCknfoP6s2JYgpbzGaKyqPAx88w1wDWutWyVJFDXp0XiW8F?=
 =?us-ascii?Q?8+dui/9Fd/+Y16eK64gFyk4YguZ9dSiWZvjColweozy7fw62ePORscxu2W0Z?=
 =?us-ascii?Q?nSf/OYqnooCXJbv1qE/XddI02CCcDRCS3mJFSKJDE0Rynst3BfiovFXRY9q8?=
 =?us-ascii?Q?FVLcuFKZlCw/5fZRg9cTCqVNjgY6YQfT5brYsnuQA+NV1F9FKEWp1Rd2a2EN?=
 =?us-ascii?Q?znEyiifLdJ5T20nKq51UIvzg23+8kSIIJHMWEgYxiurucVSggiSMb8Xn5GLE?=
 =?us-ascii?Q?77mr4IdCm8CYJIRG2FwdwCQpXXAmpTZTZcHI3M66+bcG7OLw/cX+Cvly4mxI?=
 =?us-ascii?Q?CF7RRq1DQN4ypRZ6Nvs7+k85o877lcYelMKRmLTeSzZKBIozg53Y3jyD/J9E?=
 =?us-ascii?Q?AjOKbMY3cWRQGXdafDKReY9A1I1fULzjjo2osfogl7oCco5ZJoXFY8DAj1m9?=
 =?us-ascii?Q?1A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 035357f7-9f64-4ab4-7dcc-08dd2f7106b1
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2025 23:14:24.9090 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NfQz5aC13oH5x+c/13fUGNpCOTDSE6IhLtHnXUPV2sb1RxehlEWq/v58u0UNWyGtN+UMi037dpLBhNlUTY7YXVgJK9ZoDnNF5p/dSpcb81I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6694
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

On Wed, Dec 11, 2024 at 07:42:10AM +0100, Marcin Bernatowicz wrote:
> Add a match helper that allows the application of a workaround
> when the device is not an SR-IOV VF (Virtual Function) device.
> 
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Michal Winiarski <michal.winiarski@intel.com>
> Cc: Narasimha C V <narasimha.c.v@intel.com>
> Cc: Piotr Piorkowski <piotr.piorkowski@intel.com>
> Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Tomasz Lis <tomasz.lis@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_rtp.c |  5 +++++
>  drivers/gpu/drm/xe/xe_rtp.h | 11 +++++++++++
>  2 files changed, 16 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
> index b13d4d62f0b1..7a1c78fdfc92 100644
> --- a/drivers/gpu/drm/xe/xe_rtp.c
> +++ b/drivers/gpu/drm/xe/xe_rtp.c
> @@ -340,3 +340,8 @@ bool xe_rtp_match_first_gslice_fused_off(const struct xe_gt *gt,
>  	return dss >= dss_per_gslice;
>  }
>  
> +bool xe_rtp_match_not_sriov_vf(const struct xe_gt *gt,
> +			       const struct xe_hw_engine *hwe)
> +{
> +	return !IS_SRIOV_VF(gt_to_xe(gt));
> +}
> diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
> index 827d932b6908..7dea10d732d7 100644
> --- a/drivers/gpu/drm/xe/xe_rtp.h
> +++ b/drivers/gpu/drm/xe/xe_rtp.h
> @@ -476,4 +476,15 @@ bool xe_rtp_match_first_render_or_compute(const struct xe_gt *gt,
>  bool xe_rtp_match_first_gslice_fused_off(const struct xe_gt *gt,
>  					 const struct xe_hw_engine *hwe);
>  
> +/*
> + * xe_rtp_match_not_sriov_vf - Match when not on SR-IOV VF device
> + *
> + * @gt: GT structure
> + * @hwe: Engine instance
> + *
> + * Returns: true if device is not VF, false otherwise.
> + */
> +bool xe_rtp_match_not_sriov_vf(const struct xe_gt *gt,
> +			       const struct xe_hw_engine *hwe);
> +
>  #endif
> -- 
> 2.31.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
