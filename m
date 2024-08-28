Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 212D9C636F0
	for <intel-xe@archiver.kernel.org>; Wed, 28 Aug 2024 19:12:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E459D10E308;
	Wed, 28 Aug 2024 19:12:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FNizqQU0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77FAD10E308
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Aug 2024 19:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724872349; x=1756408349;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=2dVrBdbHjlEyFNcocEml8Tz3XSqnVWrDV5ZEQ+amyS0=;
 b=FNizqQU0IqHoZoIs68mk9aAEfeeO6dS9hyarmJ/355ZlDhckvJj1yas9
 /tcewP+orwz94sfg1WfAFn1Vwc+DVMvjHHg4HFjGElF1ZiMH2x2jqM7iU
 cdsUsReFxRj011uMMP3DvMwF4ArtQvbduUqK8YL5G1F/xemiEBgK9GJ4e
 Eufdyrk6+nKvMLCeJlocSmT2Hf4mfuXAl1reyuMVOso6Sz0sA5nfrB8bj
 60H4atk3ztDTMZKPtCDZg/lsri/rAwp85vl4f3xUfwaFvKSQv6vQ9l7uM
 bAFuFjmWYa96FSFDkEpxIhGr7i4DxapgZrsEnIKZSH6ZNc9CBrvh8Ud7N A==;
X-CSE-ConnectionGUID: ClZZNwzcSGKOdXeI3P5GEw==
X-CSE-MsgGUID: k+d88QbkSVW0kOKpGn4QKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="23311630"
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; d="scan'208";a="23311630"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 12:11:36 -0700
X-CSE-ConnectionGUID: qo+phsNAQxumKPN5deeAdg==
X-CSE-MsgGUID: 51P+nM/wS6Sigh1xnLW/cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; d="scan'208";a="63026255"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Aug 2024 12:11:36 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 28 Aug 2024 12:11:35 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 28 Aug 2024 12:11:35 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 28 Aug 2024 12:11:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dxOgcMMV2Awp0jHj7+2x9uwEC3C2SXcM31+FbD3ycZ4doyHaYj8DeEtEsfwww4X76H8KPzYjtoZp137DJIjZGZJS3qG+xWasT6QECY0EeijK7KUuPWZs2Hw35xvWu96coHvWGlVUWlIwkYnvUqV38kUyQjEuJ6jNSxUb5xWBC/6bMiU8WYo2iq1qkQb+5spP06PHpB+QvAPfBIrfeZy8AvJwg2/yKmjSZqLSfDbT/BN3Pmvf70GsHXZ7i00zvTTpiVwY4y3X8rslwOaq/RsDJPSK2ZIxFPHPA0Jqb4DzpEPrLncGvVno9SRv/If8qWK0O2KivUibDIMrcQJRU2iFBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TSIurS7bQvqst9wxlyRhG6bGGM4h/NJ/rdPulKoZtGY=;
 b=e6aT1fyLdQCyFuhEEy1M8fHDx5aw4lMVcfBWKjox2HRPEUAPe/IH+oVTnUwbn1C00ZtQkFLkbCaOdTuX2A+ofLqk+2zCulgLdw6IpXcgabbRu9caZMawQ1oGe5JjWooZAuMUt24q3OwVLjHXHJ+yrWmwWQL2R1DciRp6tM6HzBWdxk7k7Atpcw8/7ygYiS2O2kOl5CdXDV2Dt7fmCGn5ZkhqZDEFKjLLVsxmzWyVyB514ZaADU8B1lxGRtu0RdeksD/t2yZvDfbd1kWqUCuWFyUY2t8Hxj/oBuMOzClarx5WQL+UE6k3UKFwupP5id5rAAeRT6jgEfkdNmKTxgNOIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by SJ0PR11MB4800.namprd11.prod.outlook.com (2603:10b6:a03:2af::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.26; Wed, 28 Aug
 2024 19:11:32 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7897.014; Wed, 28 Aug 2024
 19:11:32 +0000
Date: Wed, 28 Aug 2024 15:11:29 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Aravind Iddamsetty
 <aravind.iddamsetty@linux.intel.com>, Tvrtko Ursulin
 <tvrtko.ursulin@intel.com>, Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 Riana Tauro <riana.tauro@intel.com>
Subject: Re: [PATCH 1/4] drm/xe/pmu: Enable PMU interface
Message-ID: <Zs92YdWa0tjkdHE1@intel.com>
References: <20240827164107.47034-1-vinay.belgaumkar@intel.com>
 <20240827164107.47034-2-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240827164107.47034-2-vinay.belgaumkar@intel.com>
X-ClientProxiedBy: MW4PR03CA0235.namprd03.prod.outlook.com
 (2603:10b6:303:b9::30) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|SJ0PR11MB4800:EE_
X-MS-Office365-Filtering-Correlation-Id: 6af60b79-cdc5-44de-b24a-08dcc7953a0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?n7fTjUMQ+E4d2P7KmYVyr7/K5q7bImj5UiNUoggQYjh0FyU/gmug3lrOH/?=
 =?iso-8859-1?Q?ihha+3J1Cc1uVM8zPfK/re9kCCHZ+Dg2AmObXfXmk3ZJJWRilKegXdfu/X?=
 =?iso-8859-1?Q?smV4dNjxqx4+VnGbLlYf20Ctxmui+T5shsBVeo2/2LQ1pyNvfM7KtPehZl?=
 =?iso-8859-1?Q?mrde6ge3rcHr0kcDrhG4U7T7XDXr8onlULAQ0fpgEPKO0uIEP0UTiKIU85?=
 =?iso-8859-1?Q?GaYvnGqINNbyMktdm5ITP+HRXlb7Zm1JP1aFiGP6RDtzYb6qM0riUOGNQQ?=
 =?iso-8859-1?Q?U4wcl2L8kpDwllc3yOdHO7LRZ9sX4rJGX6zt0lulKCYEN1RQW0VCogLhp1?=
 =?iso-8859-1?Q?H2NaJQWMbb59vK3l66bUMTce+hnNwKyBuYnIRbdWg50ePq2NkK1Wbq6gE8?=
 =?iso-8859-1?Q?09moQCYTZMHI7BPhYYL7kC/aDtTVOOCgJcp0P81nU/eoyJ8a80Ig05oDwl?=
 =?iso-8859-1?Q?j+QpxljRlG6uRhjB9RKtKBOivESeriFfoErdzasuNuECanmofGEwmYZz3i?=
 =?iso-8859-1?Q?q8/caGTmdVvHQv6evDl4HFnS+MYss4/d7GHfpcOqQ72iyZF7JQmNZXoxnD?=
 =?iso-8859-1?Q?O2aOf+gk9A+TC34KAxYqEJILYzBQM/Km90JtJZem9AlwiAdNaydRraJ0pQ?=
 =?iso-8859-1?Q?cFIWcv67TYWQvA2fV80gUNloPbXIkLzyKrEUf1t+4YHI8rSaBlb8Z7yg8R?=
 =?iso-8859-1?Q?9l2NYw4BqUYKt47Z5M5cy66oUZ3fYOkINXNtNhbV9D0qlLEQ56YUsUla6f?=
 =?iso-8859-1?Q?Qv7coRo2Im8FvpUAHxzG6M3QXUKmF+hp+kdOeuEpRVCKFsFU4mnVYn+Olc?=
 =?iso-8859-1?Q?N3YFpHzOsSRwsi6SSabmQ0d4+u6LnfGT8vkAJlnB6H9jIDdoc0AooP17Wn?=
 =?iso-8859-1?Q?xcjN2fRwFOknixQ1KDxXKJkRjoFXvoDd4bIdZuPI6n/KkoECOaGIFXTAvX?=
 =?iso-8859-1?Q?duAvRsgeIACT7iqoyJJJKo17Imy2Q4+JuMoLxQhMz91NEhoxjTrEYkUepP?=
 =?iso-8859-1?Q?t8CdGcy9fDRPMPs+KksTQ/wE7+14Vwd5doUuMX1A9/fXTL3eiu5wDikidx?=
 =?iso-8859-1?Q?Z9o1AHSB/eICh+AwHqXfrRo7dogZzP9CW5V5fqqIxsPXej+LkEb6bez4b6?=
 =?iso-8859-1?Q?+y5wWcZdGZH21Ej90HWwQCY5do8ed9JpooapP1Lgo5V+6i+9ryxy/w5Elt?=
 =?iso-8859-1?Q?5i+7wlAQHYYM9I6hHgLOelYjrw25J5Kxs6NcMxpEX2f4JIgubKiRwFl5Oa?=
 =?iso-8859-1?Q?SgwK4k+4ymdJKPWViWv8MZLcS+oqMFBreoMIE5jzrmKL74KteHghiAxbWm?=
 =?iso-8859-1?Q?a4Ikr4biirykYkK/gNylVEOymC6HX+RLOEayCtqOQZjleHA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?84HIu6QpFqpiwTxqw8Nw1ewZeWOvOFRYCT42Z7jWXDPPtKXLErzwmLvBpU?=
 =?iso-8859-1?Q?coBsVNYRAjYkN7NqmOZw522VSWYKUQDlbSDwk4ipeuAlLxpZ8dIPXnNaN3?=
 =?iso-8859-1?Q?KK0XmqeTagHTTPsjcpFhyf44c4QHU+nobQitf27M4Hc49s0faDX2O9a5mi?=
 =?iso-8859-1?Q?0mP0Vuyf2Dzrh7egenGIsiYV2MUGNZDZQEe0tmu7SNwtZJWoB5QsH/zYYP?=
 =?iso-8859-1?Q?vzFo7RD9VgSUU7+9ezxZtQsefTg/pciCJ/H8TKvzepoqQNcz7SijCzKqeJ?=
 =?iso-8859-1?Q?guKkxym+rLr2HjV1YR3HqamiWBSEpE6dUIlUqTmPyo/bx+jZRAoSawcGNY?=
 =?iso-8859-1?Q?JfWLc+NT0pPgkmvzuYQ3p6Gl6NhbKJhDziTkF6gnepMVvUyDmSPEz2Iczr?=
 =?iso-8859-1?Q?IanrIyV3z5xZqCLH75KgF/r6N8ZgUtl2hg4vWcGIWBvxPVvQDm2wBc6jxl?=
 =?iso-8859-1?Q?Wxe0uRY+Ebx/AN6bfokHP6NLqbrLHYwwgejmZDr0AVg++S6mis1m3ZWitr?=
 =?iso-8859-1?Q?5d3JjyxXUNYtVED2DCVwaqcYl14ENB4gAmjAx9EyhV5qxjfm1lYF8qfeOt?=
 =?iso-8859-1?Q?+2MUOm+AsDn4tVpi+RyKfVto9kydrs/smwbBsGOYeAwPws2znSksq+sPra?=
 =?iso-8859-1?Q?RcFix0/o746jt6nnEF1aRk/YqX9MR/F4SBiZmyVs6SS7raMLK3nXgy4FOX?=
 =?iso-8859-1?Q?7ciyY6pLVtFES0A/6WMXDx997p1G89wL+Na6yncPJ/ht2cdn0CteMYwW0q?=
 =?iso-8859-1?Q?BiSh3Eo1e8hHvagiorryBAWDBbdi0cDZa0hESnZz4wIs4jJjbCKNTx/FUx?=
 =?iso-8859-1?Q?ZCuZg09XnJseEOnFSw9HMO5hhwGqL3h6d8vU1JiYCc0xBLuHrxvdN+0lLL?=
 =?iso-8859-1?Q?bqPvTddmQMlxu0q6sSo0BN8GwRaOQQmS9aTRlTbM+y/joiNMOHhnP6qjJe?=
 =?iso-8859-1?Q?XdRt6zUDKJ09evhfjxcjeGi+3ABTmFNpXL7NU6xrRXFD7Zs0iQimc3hn70?=
 =?iso-8859-1?Q?AgTE4ybY6809+QeCVeQO0pzJZsJQF8CUwZl7Swh8pPvdpeV7RYDBVFGaKD?=
 =?iso-8859-1?Q?EFkzBZaeaRsBko37npwO6YeR8lb3WB+Ce5b8nBfW2rmrXuO1STJnljjWcC?=
 =?iso-8859-1?Q?Diat9tjoTh3m4Mqqn16nE7X8P4EvNcl6wKZHyhjcmEwkTGsr2Xju6tlPN0?=
 =?iso-8859-1?Q?mef9zbj241UxLysa8gYJ2yiKu14bCeCmULqtJzKSERxdCfopFhdwwaA3HK?=
 =?iso-8859-1?Q?quAH+hOi8xHT0HtY1qrP8eK5ebUMYki8wbAU1SZyMvQUfAdBjqaoN02Kl6?=
 =?iso-8859-1?Q?kGuyxOTX3mm3tIxPCDdiS4rUO3vfjJX+U66ypYAL0xiJwkkn9JxDJQ3y/N?=
 =?iso-8859-1?Q?G2f/oN6WCKoQcvgocNgkVFnKnQKoNtFZ7mxo0jo25LiCHIoVlLpJ5q4deC?=
 =?iso-8859-1?Q?fTJhh31haR3SRQ8aZJW/5Yh3EuyuDIMiT9KYZFFc8nl6VV7qgYnI1Vztsf?=
 =?iso-8859-1?Q?A5BgG/YM2qgXaMLpImt6EQWWoAXHKKxjpU+nrHYXeNkNo91V3R5SaFtOVB?=
 =?iso-8859-1?Q?t/HBGmOG5C9r8y0kaolcFIthbT9d/lDPSD9hYiTO1SJw179sJVL0/ZpQ7F?=
 =?iso-8859-1?Q?J1vhzMbHiAHBPtZRrcnHC/hunix/gsr74aXCvQ7Dh2YFaeESCtActRrw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6af60b79-cdc5-44de-b24a-08dcc7953a0e
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2024 19:11:32.6738 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oQtOT5HhHl4sKxVbKnkScr7DogYUR/R2vu4nkzzHZDENQYa3fwo+xsl+yd8Z4E5rJ1hNMd/S4pk/4r7vo/zaRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4800
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

On Tue, Aug 27, 2024 at 09:41:04AM -0700, Vinay Belgaumkar wrote:
> From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
> 
> Basic PMU enabling patch. Setup the basic framework
> for adding events/timers.

probably stop the commit message here..


This patch was previously
> reviewed here -
> https://patchwork.freedesktop.org/series/119504/
> 
> I have included the s-o-b names from that patch here.
> 
> The difference now is the group engine busyness has
> been removed. Also, the patch has been split up into
> 2 chunks like the timer being setup in the next
> patch.

The commit message needs to be an imperative language saying
what the commit is doing and why. Not the history mixed like this.

> The pmu base implementation is still from the
> i915 driver.

perhaps this is also relevant...

> 
> events can be listed using:
> perf list
> 
> and can be read using:
> 
> perf stat -e <event_name> -I 1000

is this relevant here?

> 
> Co-developed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Co-developed-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile          |   2 +
>  drivers/gpu/drm/xe/xe_device.c       |   2 +
>  drivers/gpu/drm/xe/xe_device_types.h |   4 +
>  drivers/gpu/drm/xe/xe_gt.c           |   4 +
>  drivers/gpu/drm/xe/xe_module.c       |   5 +
>  drivers/gpu/drm/xe/xe_pmu.c          | 546 +++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_pmu.h          |  28 ++
>  drivers/gpu/drm/xe/xe_pmu_types.h    |  63 ++++
>  include/uapi/drm/xe_drm.h            |  34 ++
>  9 files changed, 688 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_pmu.c
>  create mode 100644 drivers/gpu/drm/xe/xe_pmu.h
>  create mode 100644 drivers/gpu/drm/xe/xe_pmu_types.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index b9670ae09a9e..05edccd85413 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -264,6 +264,8 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
>  	i915-display/skl_universal_plane.o \
>  	i915-display/skl_watermark.o
>  
> +xe-$(CONFIG_PERF_EVENTS) += xe_pmu.o
> +
>  ifeq ($(CONFIG_ACPI),y)
>  	xe-$(CONFIG_DRM_XE_DISPLAY) += \
>  		i915-display/intel_acpi.o \
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index b6db7e082d88..978eca47cbc8 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -748,6 +748,8 @@ int xe_device_probe(struct xe_device *xe)
>  	for_each_gt(gt, xe, id)
>  		xe_gt_sanitize_freq(gt);
>  
> +	xe_pmu_register(&xe->pmu);
> +
>  	return devm_add_action_or_reset(xe->drm.dev, xe_device_sanitize, xe);
>  
>  err_fini_display:
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 4ecd620921a3..eb34f4ee7d6a 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -19,6 +19,7 @@
>  #include "xe_memirq_types.h"
>  #include "xe_oa.h"
>  #include "xe_platform_types.h"
> +#include "xe_pmu.h"
>  #include "xe_pt_types.h"
>  #include "xe_sriov_types.h"
>  #include "xe_step_types.h"
> @@ -483,6 +484,9 @@ struct xe_device {
>  		int mode;
>  	} wedged;
>  
> +	/** @pmu: performance monitoring unit */
> +	struct xe_pmu pmu;
> +
>  #ifdef TEST_VM_OPS_ERROR
>  	/**
>  	 * @vm_inject_error_position: inject errors at different places in VM
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 08a004d698d4..097a32ec807d 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -844,6 +844,8 @@ int xe_gt_suspend(struct xe_gt *gt)
>  	if (err)
>  		goto err_msg;
>  
> +	xe_pmu_suspend(gt);
> +
>  	err = xe_uc_suspend(&gt->uc);
>  	if (err)
>  		goto err_force_wake;
> @@ -898,6 +900,8 @@ int xe_gt_resume(struct xe_gt *gt)
>  
>  	xe_gt_idle_enable_pg(gt);
>  
> +	xe_pmu_resume(gt);
> +
>  	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
>  	xe_gt_dbg(gt, "resumed\n");
>  
> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
> index 923460119cec..a95c771e7fac 100644
> --- a/drivers/gpu/drm/xe/xe_module.c
> +++ b/drivers/gpu/drm/xe/xe_module.c
> @@ -11,6 +11,7 @@
>  #include "xe_drv.h"
>  #include "xe_hw_fence.h"
>  #include "xe_pci.h"
> +#include "xe_pmu.h"
>  #include "xe_observation.h"
>  #include "xe_sched_job.h"
>  
> @@ -78,6 +79,10 @@ static const struct init_funcs init_funcs[] = {
>  		.init = xe_sched_job_module_init,
>  		.exit = xe_sched_job_module_exit,
>  	},
> +	{
> +		.init = xe_pmu_init,
> +		.exit = xe_pmu_exit,
> +	},
>  	{
>  		.init = xe_register_pci_driver,
>  		.exit = xe_unregister_pci_driver,
> diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
> new file mode 100644
> index 000000000000..33e7966f449c
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_pmu.c
> @@ -0,0 +1,546 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#include <drm/drm_drv.h>
> +#include <drm/drm_managed.h>
> +#include <drm/xe_drm.h>
> +
> +#include "regs/xe_gt_regs.h"
> +#include "xe_device.h"
> +#include "xe_force_wake.h"
> +#include "xe_gt_clock.h"
> +#include "xe_mmio.h"
> +#include "xe_macros.h"
> +#include "xe_pm.h"
> +
> +static cpumask_t xe_pmu_cpumask;
> +static unsigned int xe_pmu_target_cpu = -1;
> +
> +static unsigned int config_gt_id(const u64 config)
> +{
> +	return config >> __XE_PMU_GT_SHIFT;
> +}
> +
> +static u64 config_counter(const u64 config)
> +{
> +	return config & ~(~0ULL << __XE_PMU_GT_SHIFT);
> +}
> +
> +static void xe_pmu_event_destroy(struct perf_event *event)
> +{
> +	struct xe_device *xe =
> +		container_of(event->pmu, typeof(*xe), pmu.base);
> +
> +	drm_WARN_ON(&xe->drm, event->parent);
> +
> +	drm_dev_put(&xe->drm);
> +}
> +
> +static int
> +config_status(struct xe_device *xe, u64 config)
> +{
> +	unsigned int gt_id = config_gt_id(config);
> +
> +	if (gt_id >= XE_PMU_MAX_GT)
> +		return -ENOENT;
> +
> +	switch (config_counter(config)) {
> +	default:
> +		return -ENOENT;
> +	}
> +
> +	return 0;
> +}
> +
> +static int xe_pmu_event_init(struct perf_event *event)
> +{
> +	struct xe_device *xe =
> +		container_of(event->pmu, typeof(*xe), pmu.base);
> +	struct xe_pmu *pmu = &xe->pmu;
> +	int ret;
> +
> +	if (pmu->closed)
> +		return -ENODEV;
> +
> +	if (event->attr.type != event->pmu->type)
> +		return -ENOENT;
> +
> +	/* unsupported modes and filters */
> +	if (event->attr.sample_period) /* no sampling */
> +		return -EINVAL;
> +
> +	if (has_branch_stack(event))
> +		return -EOPNOTSUPP;
> +
> +	if (event->cpu < 0)
> +		return -EINVAL;
> +
> +	/* only allow running on one cpu at a time */
> +	if (!cpumask_test_cpu(event->cpu, &xe_pmu_cpumask))
> +		return -EINVAL;
> +
> +	ret = config_status(xe, event->attr.config);
> +	if (ret)
> +		return ret;
> +
> +	if (!event->parent) {
> +		drm_dev_get(&xe->drm);
> +		event->destroy = xe_pmu_event_destroy;
> +	}
> +
> +	return 0;
> +}
> +
> +static u64 __xe_pmu_event_read(struct perf_event *event)
> +{
> +	struct xe_device *xe =
> +		container_of(event->pmu, typeof(*xe), pmu.base);
> +	const unsigned int gt_id = config_gt_id(event->attr.config);
> +	const u64 config = event->attr.config;
> +	struct xe_gt *gt = xe_device_get_gt(xe, gt_id);
> +	u64 val = 0;
> +
> +	switch (config_counter(config)) {
> +	default:
> +		drm_warn(&gt->tile->xe->drm, "unknown pmu event\n");
> +	}
> +
> +	return val;
> +}
> +
> +static void xe_pmu_event_read(struct perf_event *event)
> +{
> +	struct xe_device *xe =
> +		container_of(event->pmu, typeof(*xe), pmu.base);
> +	struct hw_perf_event *hwc = &event->hw;
> +	struct xe_pmu *pmu = &xe->pmu;
> +	u64 prev, new;
> +
> +	if (pmu->closed) {
> +		event->hw.state = PERF_HES_STOPPED;
> +		return;
> +	}
> +again:
> +	prev = local64_read(&hwc->prev_count);
> +	new = __xe_pmu_event_read(event);
> +
> +	if (local64_cmpxchg(&hwc->prev_count, prev, new) != prev)
> +		goto again;
> +
> +	local64_add(new - prev, &event->count);
> +}
> +
> +static void xe_pmu_enable(struct perf_event *event)
> +{
> +	/*
> +	 * Store the current counter value so we can report the correct delta
> +	 * for all listeners. Even when the event was already enabled and has
> +	 * an existing non-zero value.
> +	 */
> +	local64_set(&event->hw.prev_count, __xe_pmu_event_read(event));
> +}
> +
> +static void xe_pmu_event_start(struct perf_event *event, int flags)
> +{
> +	struct xe_device *xe =
> +		container_of(event->pmu, typeof(*xe), pmu.base);
> +	struct xe_pmu *pmu = &xe->pmu;
> +
> +	if (pmu->closed)
> +		return;
> +
> +	xe_pmu_enable(event);
> +	event->hw.state = 0;
> +}
> +
> +static void xe_pmu_event_stop(struct perf_event *event, int flags)
> +{
> +	if (flags & PERF_EF_UPDATE)
> +		xe_pmu_event_read(event);
> +
> +	event->hw.state = PERF_HES_STOPPED;
> +}
> +
> +static int xe_pmu_event_add(struct perf_event *event, int flags)
> +{
> +	struct xe_device *xe =
> +		container_of(event->pmu, typeof(*xe), pmu.base);
> +	struct xe_pmu *pmu = &xe->pmu;
> +
> +	if (pmu->closed)
> +		return -ENODEV;
> +
> +	if (flags & PERF_EF_START)
> +		xe_pmu_event_start(event, flags);
> +
> +	return 0;
> +}
> +
> +static void xe_pmu_event_del(struct perf_event *event, int flags)
> +{
> +	xe_pmu_event_stop(event, PERF_EF_UPDATE);
> +}
> +
> +static int xe_pmu_event_event_idx(struct perf_event *event)
> +{
> +	return 0;
> +}
> +
> +struct xe_ext_attribute {
> +	struct device_attribute attr;
> +	unsigned long val;
> +};
> +
> +static ssize_t xe_pmu_event_show(struct device *dev,
> +				 struct device_attribute *attr, char *buf)
> +{
> +	struct xe_ext_attribute *eattr;
> +
> +	eattr = container_of(attr, struct xe_ext_attribute, attr);
> +	return sprintf(buf, "config=0x%lx\n", eattr->val);
> +}
> +
> +static ssize_t cpumask_show(struct device *dev,
> +			    struct device_attribute *attr, char *buf)
> +{
> +	return cpumap_print_to_pagebuf(true, buf, &xe_pmu_cpumask);
> +}
> +
> +static DEVICE_ATTR_RO(cpumask);
> +
> +static struct attribute *xe_cpumask_attrs[] = {
> +	&dev_attr_cpumask.attr,
> +	NULL,
> +};
> +
> +static const struct attribute_group xe_pmu_cpumask_attr_group = {
> +	.attrs = xe_cpumask_attrs,
> +};
> +
> +#define __event(__counter, __name, __unit) \
> +{ \
> +	.counter = (__counter), \
> +	.name = (__name), \
> +	.unit = (__unit), \
> +}
> +
> +static struct xe_ext_attribute *
> +add_xe_attr(struct xe_ext_attribute *attr, const char *name, u64 config)
> +{
> +	sysfs_attr_init(&attr->attr.attr);
> +	attr->attr.attr.name = name;
> +	attr->attr.attr.mode = 0444;
> +	attr->attr.show = xe_pmu_event_show;
> +	attr->val = config;
> +
> +	return ++attr;
> +}
> +
> +static struct perf_pmu_events_attr *
> +add_pmu_attr(struct perf_pmu_events_attr *attr, const char *name,
> +	     const char *str)
> +{
> +	sysfs_attr_init(&attr->attr.attr);
> +	attr->attr.attr.name = name;
> +	attr->attr.attr.mode = 0444;
> +	attr->attr.show = perf_event_sysfs_show;
> +	attr->event_str = str;
> +
> +	return ++attr;
> +}
> +
> +static struct attribute **
> +create_event_attributes(struct xe_pmu *pmu)
> +{
> +	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
> +	static const struct {
> +		unsigned int counter;
> +		const char *name;
> +		const char *unit;
> +	} events[] = {
> +	};
> +
> +	struct perf_pmu_events_attr *pmu_attr = NULL, *pmu_iter;
> +	struct xe_ext_attribute *xe_attr = NULL, *xe_iter;
> +	struct attribute **attr = NULL, **attr_iter;
> +	unsigned int count = 0;
> +	unsigned int i, j;
> +	struct xe_gt *gt;
> +
> +	/* Count how many counters we will be exposing. */
> +	for_each_gt(gt, xe, j) {
> +		for (i = 0; i < ARRAY_SIZE(events); i++) {
> +			u64 config = ___XE_PMU_OTHER(j, events[i].counter);
> +
> +			if (!config_status(xe, config))
> +				count++;
> +		}
> +	}
> +
> +	/* Allocate attribute objects and table. */
> +	xe_attr = kcalloc(count, sizeof(*xe_attr), GFP_KERNEL);
> +	if (!xe_attr)
> +		goto err_alloc;
> +
> +	pmu_attr = kcalloc(count, sizeof(*pmu_attr), GFP_KERNEL);
> +	if (!pmu_attr)
> +		goto err_alloc;
> +
> +	/* Max one pointer of each attribute type plus a termination entry. */
> +	attr = kcalloc(count * 2 + 1, sizeof(*attr), GFP_KERNEL);
> +	if (!attr)
> +		goto err_alloc;
> +
> +	xe_iter = xe_attr;
> +	pmu_iter = pmu_attr;
> +	attr_iter = attr;
> +
> +	for_each_gt(gt, xe, j) {
> +		for (i = 0; i < ARRAY_SIZE(events); i++) {
> +			u64 config = ___XE_PMU_OTHER(j, events[i].counter);
> +			char *str;
> +
> +			if (config_status(xe, config))
> +				continue;
> +
> +			str = kasprintf(GFP_KERNEL, "%s-gt%u",
> +					events[i].name, j);
> +			if (!str)
> +				goto err;
> +
> +			*attr_iter++ = &xe_iter->attr.attr;
> +			xe_iter = add_xe_attr(xe_iter, str, config);
> +
> +			if (events[i].unit) {
> +				str = kasprintf(GFP_KERNEL, "%s-gt%u.unit",
> +						events[i].name, j);
> +				if (!str)
> +					goto err;
> +
> +				*attr_iter++ = &pmu_iter->attr.attr;
> +				pmu_iter = add_pmu_attr(pmu_iter, str,
> +							events[i].unit);
> +			}
> +		}
> +	}
> +
> +	pmu->xe_attr = xe_attr;
> +	pmu->pmu_attr = pmu_attr;
> +
> +	return attr;
> +
> +err:
> +	for (attr_iter = attr; *attr_iter; attr_iter++)
> +		kfree((*attr_iter)->name);
> +
> +err_alloc:
> +	kfree(attr);
> +	kfree(xe_attr);
> +	kfree(pmu_attr);
> +
> +	return NULL;
> +}
> +
> +static void free_event_attributes(struct xe_pmu *pmu)
> +{
> +	struct attribute **attr_iter = pmu->events_attr_group.attrs;
> +
> +	for (; *attr_iter; attr_iter++)
> +		kfree((*attr_iter)->name);
> +
> +	kfree(pmu->events_attr_group.attrs);
> +	kfree(pmu->xe_attr);
> +	kfree(pmu->pmu_attr);
> +
> +	pmu->events_attr_group.attrs = NULL;
> +	pmu->xe_attr = NULL;
> +	pmu->pmu_attr = NULL;
> +}
> +
> +static int xe_pmu_cpu_online(unsigned int cpu, struct hlist_node *node)
> +{
> +	struct xe_pmu *pmu = hlist_entry_safe(node, typeof(*pmu), cpuhp.node);
> +
> +	XE_WARN_ON(!pmu->base.event_init);
> +
> +	/* Select the first online CPU as a designated reader. */
> +	if (cpumask_empty(&xe_pmu_cpumask))
> +		cpumask_set_cpu(cpu, &xe_pmu_cpumask);
> +
> +	return 0;
> +}
> +
> +static int xe_pmu_cpu_offline(unsigned int cpu, struct hlist_node *node)
> +{
> +	struct xe_pmu *pmu = hlist_entry_safe(node, typeof(*pmu), cpuhp.node);
> +	unsigned int target = xe_pmu_target_cpu;
> +
> +	/*
> +	 * Unregistering an instance generates a CPU offline event which we must
> +	 * ignore to avoid incorrectly modifying the shared xe_pmu_cpumask.
> +	 */
> +	if (pmu->closed)
> +		return 0;
> +
> +	if (cpumask_test_and_clear_cpu(cpu, &xe_pmu_cpumask)) {
> +		target = cpumask_any_but(topology_sibling_cpumask(cpu), cpu);
> +
> +		/* Migrate events if there is a valid target */
> +		if (target < nr_cpu_ids) {
> +			cpumask_set_cpu(target, &xe_pmu_cpumask);
> +			xe_pmu_target_cpu = target;
> +		}
> +	}
> +
> +	if (target < nr_cpu_ids && target != pmu->cpuhp.cpu) {
> +		perf_pmu_migrate_context(&pmu->base, cpu, target);
> +		pmu->cpuhp.cpu = target;
> +	}
> +
> +	return 0;
> +}
> +
> +static enum cpuhp_state cpuhp_slot = CPUHP_INVALID;
> +

let's already add doc for the exported functions?

> +int xe_pmu_init(void)
> +{
> +	int ret;
> +
> +	ret = cpuhp_setup_state_multi(CPUHP_AP_ONLINE_DYN,
> +				      "perf/x86/intel/xe:online",
> +				      xe_pmu_cpu_online,
> +				      xe_pmu_cpu_offline);
> +	if (ret < 0)
> +		pr_notice("Failed to setup cpuhp state for xe PMU! (%d)\n",
> +			  ret);
> +	else
> +		cpuhp_slot = ret;
> +
> +	return 0;
> +}
> +
> +void xe_pmu_exit(void)
> +{
> +	if (cpuhp_slot != CPUHP_INVALID)
> +		cpuhp_remove_multi_state(cpuhp_slot);
> +}
> +
> +static int xe_pmu_register_cpuhp_state(struct xe_pmu *pmu)
> +{
> +	if (cpuhp_slot == CPUHP_INVALID)
> +		return -EINVAL;
> +
> +	return cpuhp_state_add_instance(cpuhp_slot, &pmu->cpuhp.node);
> +}
> +
> +static void xe_pmu_unregister_cpuhp_state(struct xe_pmu *pmu)
> +{
> +	cpuhp_state_remove_instance(cpuhp_slot, &pmu->cpuhp.node);
> +}
> +
> +void xe_pmu_suspend(struct xe_gt *gt)
> +{
> +}
> +
> +void xe_pmu_resume(struct xe_gt *gt)
> +{
> +}

likely good to avoid blank functions and only add them with its usage.

> +
> +static void xe_pmu_unregister(void *arg)
> +{
> +	struct xe_pmu *pmu = arg;
> +
> +	if (!pmu->base.event_init)
> +		return;
> +
> +	/*
> +	 * "Disconnect" the PMU callbacks - since all are atomic synchronize_rcu
> +	 * ensures all currently executing ones will have exited before we
> +	 * proceed with unregistration.
> +	 */
> +	pmu->closed = true;
> +	synchronize_rcu();
> +
> +	xe_pmu_unregister_cpuhp_state(pmu);
> +
> +	perf_pmu_unregister(&pmu->base);
> +	pmu->base.event_init = NULL;
> +	kfree(pmu->base.attr_groups);
> +	kfree(pmu->name);
> +	free_event_attributes(pmu);
> +}
> +
> +void xe_pmu_register(struct xe_pmu *pmu)
> +{
> +	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
> +	const struct attribute_group *attr_groups[] = {
> +		&pmu->events_attr_group,
> +		&xe_pmu_cpumask_attr_group,
> +		NULL
> +	};
> +
> +	int ret = -ENOMEM;
> +
> +	spin_lock_init(&pmu->lock);
> +	pmu->cpuhp.cpu = -1;
> +
> +	pmu->name = kasprintf(GFP_KERNEL,
> +			      "xe_%s",
> +			      dev_name(xe->drm.dev));
> +	if (pmu->name)
> +		/* tools/perf reserves colons as special. */
> +		strreplace((char *)pmu->name, ':', '_');
> +
> +	if (!pmu->name)
> +		goto err;
> +
> +	pmu->events_attr_group.name = "events";
> +	pmu->events_attr_group.attrs = create_event_attributes(pmu);
> +	if (!pmu->events_attr_group.attrs)
> +		goto err_name;
> +
> +	pmu->base.attr_groups = kmemdup(attr_groups, sizeof(attr_groups),
> +					GFP_KERNEL);
> +	if (!pmu->base.attr_groups)
> +		goto err_attr;
> +
> +	pmu->base.module	= THIS_MODULE;
> +	pmu->base.task_ctx_nr	= perf_invalid_context;
> +	pmu->base.event_init	= xe_pmu_event_init;
> +	pmu->base.add		= xe_pmu_event_add;
> +	pmu->base.del		= xe_pmu_event_del;
> +	pmu->base.start		= xe_pmu_event_start;
> +	pmu->base.stop		= xe_pmu_event_stop;
> +	pmu->base.read		= xe_pmu_event_read;
> +	pmu->base.event_idx	= xe_pmu_event_event_idx;
> +
> +	ret = perf_pmu_register(&pmu->base, pmu->name, -1);
> +	if (ret)
> +		goto err_groups;
> +
> +	ret = xe_pmu_register_cpuhp_state(pmu);
> +	if (ret)
> +		goto err_unreg;
> +
> +	ret = devm_add_action_or_reset(xe->drm.dev, xe_pmu_unregister, pmu);
> +	if (ret)
> +		goto err_cpuhp;
> +
> +	return;
> +
> +err_cpuhp:
> +	xe_pmu_unregister_cpuhp_state(pmu);
> +err_unreg:
> +	perf_pmu_unregister(&pmu->base);
> +err_groups:
> +	kfree(pmu->base.attr_groups);
> +err_attr:
> +	pmu->base.event_init = NULL;
> +	free_event_attributes(pmu);
> +err_name:
> +	kfree(pmu->name);
> +err:
> +	drm_notice(&xe->drm, "Failed to register PMU!\n");
> +}
> diff --git a/drivers/gpu/drm/xe/xe_pmu.h b/drivers/gpu/drm/xe/xe_pmu.h
> new file mode 100644
> index 000000000000..eef2cbcd9c26
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_pmu.h
> @@ -0,0 +1,28 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#ifndef _XE_PMU_H_
> +#define _XE_PMU_H_
> +
> +#include "xe_pmu_types.h"
> +
> +struct xe_gt;
> +
> +#if IS_ENABLED(CONFIG_PERF_EVENTS)
> +int xe_pmu_init(void);
> +void xe_pmu_exit(void);
> +void xe_pmu_register(struct xe_pmu *pmu);
> +void xe_pmu_suspend(struct xe_gt *gt);
> +void xe_pmu_resume(struct xe_gt *gt);
> +#else
> +static inline int xe_pmu_init(void) { return 0; }
> +static inline void xe_pmu_exit(void) {}
> +static inline void xe_pmu_register(struct xe_pmu *pmu) {}
> +static inline void xe_pmu_suspend(struct xe_gt *gt) {}
> +static inline void xe_pmu_resume(struct xe_gt *gt) {}
> +#endif
> +
> +#endif
> +
> diff --git a/drivers/gpu/drm/xe/xe_pmu_types.h b/drivers/gpu/drm/xe/xe_pmu_types.h
> new file mode 100644
> index 000000000000..ca0e7cbe2081
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_pmu_types.h
> @@ -0,0 +1,63 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#ifndef _XE_PMU_TYPES_H_
> +#define _XE_PMU_TYPES_H_
> +
> +#include <linux/perf_event.h>
> +#include <linux/spinlock_types.h>
> +#include <uapi/drm/xe_drm.h>
> +
> +enum {
> +	__XE_NUM_PMU_SAMPLERS
> +};
> +
> +#define XE_PMU_MAX_GT 2
> +
> +struct xe_pmu {
> +	/**
> +	 * @cpuhp: Struct used for CPU hotplug handling.
> +	 */
> +	struct {
> +		struct hlist_node node;
> +		unsigned int cpu;
> +	} cpuhp;
> +	/**
> +	 * @base: PMU base.
> +	 */
> +	struct pmu base;
> +	/**
> +	 * @closed: xe is unregistering.
> +	 */
> +	bool closed;
> +	/**
> +	 * @name: Name as registered with perf core.
> +	 */
> +	const char *name;
> +	/**
> +	 * @lock: Lock protecting enable mask and ref count handling.
> +	 */
> +	spinlock_t lock;
> +	/**
> +	 * @sample: Current and previous (raw) counters.
> +	 *
> +	 * These counters are updated when the device is awake.
> +	 */
> +	u64 sample[XE_PMU_MAX_GT][__XE_NUM_PMU_SAMPLERS];
> +	/**
> +	 * @events_attr_group: Device events attribute group.
> +	 */
> +	struct attribute_group events_attr_group;
> +	/**
> +	 * @xe_attr: Memory block holding device attributes.
> +	 */
> +	void *xe_attr;
> +	/**
> +	 * @pmu_attr: Memory block holding device attributes.
> +	 */
> +	void *pmu_attr;
> +};
> +
> +#endif
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index b6fbe4988f2e..de6f39db618c 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -1389,6 +1389,40 @@ struct drm_xe_wait_user_fence {
>  	__u64 reserved[2];
>  };
>  
> +/**
> + * DOC: XE PMU event config IDs
> + *
> + * Check 'man perf_event_open' to use the ID's XE_PMU_XXXX listed in xe_drm.h
> + * in 'struct perf_event_attr' as part of perf_event_open syscall to read a
> + * particular event.

is this entirely accurate? I believe we changed the name from perf to observation?

> + *
> + * For example to open the XE_PMU_RENDER_GROUP_BUSY(0):
> + *
> + * .. code-block:: C
> + *
> + *	struct perf_event_attr attr;
> + *	long long count;
> + *	int cpu = 0;
> + *	int fd;
> + *
> + *	memset(&attr, 0, sizeof(struct perf_event_attr));
> + *	attr.type = type; // eg: /sys/bus/event_source/devices/xe_0000_56_00.0/type
> + *	attr.read_format = PERF_FORMAT_TOTAL_TIME_ENABLED;
> + *	attr.use_clockid = 1;
> + *	attr.clockid = CLOCK_MONOTONIC;
> + *	attr.config = XE_PMU_RENDER_GROUP_BUSY(0);
> + *
> + *	fd = syscall(__NR_perf_event_open, &attr, -1, cpu, -1, 0);

is all this still accurate and all that is needed?

> + */
> +
> +/*
> + * Top bits of every counter are GT id.
> + */
> +#define __XE_PMU_GT_SHIFT (56)
> +
> +#define ___XE_PMU_OTHER(gt, x) \
> +	(((__u64)(x)) | ((__u64)(gt) << __XE_PMU_GT_SHIFT))
> +
>  /**
>   * enum drm_xe_observation_type - Observation stream types
>   */
> -- 
> 2.38.1
> 
