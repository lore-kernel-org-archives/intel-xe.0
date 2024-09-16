Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51B5FC3ABB2
	for <intel-xe@archiver.kernel.org>; Mon, 16 Sep 2024 18:10:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BBF610E088;
	Mon, 16 Sep 2024 18:10:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dvYU3Jx7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E07F610E088
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Sep 2024 18:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726510223; x=1758046223;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Qz4TMf6Sux+VEgDNgYTFidlbrM7q7Z+BaJDTuz2p9rw=;
 b=dvYU3Jx7e42Afr+4Ma6cjHvo7nBV60z7bCtdfvBy5mJgt7oNJ4mqKlag
 flxFImX/VtH5JnVgn2fFNqxaAmFYB/2rFBjZEkKNf6cve3Rsi30WK5DOs
 gyoGtR0Exf52PLK7w9xkgUilff3rVYo/cwV4AVE59iaKyJL5wbWsguTAi
 e15YxkxkadYmN9UPqHLGD42+qElMsZJlrcwk7keCfa89qRpHNkhP8DKQ0
 ZKzdec2YsBEvdN02mhcNp7zkkEhYGMDswR0tfmIsoEiSVOVBRbAJ56dgE
 nlBHsiYZvIS8xMUCWzlb4El3PU5Jx1b2G/fWKEpitqDshpW7vIDzbbeXL Q==;
X-CSE-ConnectionGUID: 2V4wfH4gRVCWfad65j8KNQ==
X-CSE-MsgGUID: 3xN9e2QsQhW9ZrM96xRVDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="25445750"
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; d="scan'208";a="25445750"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2024 11:09:54 -0700
X-CSE-ConnectionGUID: wM/LKVVLTPqikzRtbejOcA==
X-CSE-MsgGUID: ev0kHzL/S5ebPOQSmQ2liA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; d="scan'208";a="73701484"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Sep 2024 11:09:54 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 16 Sep 2024 11:09:53 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 16 Sep 2024 11:09:53 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.45) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 16 Sep 2024 11:09:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J2XbXfJ5niU8WSlW1rOhWxtSVMkBr5M9/Kdt5km5szcKevB5KmUmYWfPWlqnFQMFYNFAYL2Zqn70gM2c5KQSXG4Wk2Mrncyp6ml3y5GJ+X+T3q9tlreSXWySnf8VpcODNp/Gegs38JVOwAc0Fc0Ghqz1KVSR5Otu6FmT3RqBypBqhYMoZKnk2WHgbTJu6sbQB3OEeOMVQyu9hbAZ/L3AJMbf9AC3g6m5tPgXWSu9609lcE1KUpBkWUOjXIbYBy/M/GxYT9Qr8rk2MCHAyKEPJxTWRNiQAS0QT7T2kth/c4w2ULrhC398HiXn2HJj0x/m71K1R3TXyT4/VVmrYM5ihg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TUkWDipPbEagFw53YS3vVx3vNexm3XOaHi+rn7JG/eg=;
 b=UmDXQI1YQwCVw1RI6xqo9XSlF4j2eeqWXYrQehkE9HT+bhZ4CicrenkuGACwkLY2utTnB9YQUbD3m16j+2Uhr4sfe/onhdZhQcWmry84TilUpM+RgxMxsgNSxe3lelcS5Pqc/ttizKZh0T5UrZbdxl9njuMaojOxqjCrRy7NE2PEOUTidh5sT5xkVG7fXyUnsLuSP6tbYost+uYKrSK9L4UE+pXZZWQ2j+sZil089pIDoDDInMoNmlUpe1cGBUXPh+KelXNZM+1JQJXe2nzX0QWUjBz+UXkBN6tM3qHBAzidKbEDnEmA7TzwJToOjS1XwxIVe4+W5ydqD8aUDR3VvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by SA3PR11MB7612.namprd11.prod.outlook.com (2603:10b6:806:31b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.23; Mon, 16 Sep
 2024 18:09:48 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7962.022; Mon, 16 Sep 2024
 18:09:48 +0000
Date: Mon, 16 Sep 2024 14:09:45 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH v2 1/3] drm/xe: Move display reference timestamp readout
 to display/
Message-ID: <Zuh0aTvBXYrKrRzO@intel.com>
References: <20240913162910.4145142-4-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240913162910.4145142-4-matthew.d.roper@intel.com>
X-ClientProxiedBy: MW4P223CA0008.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::13) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|SA3PR11MB7612:EE_
X-MS-Office365-Filtering-Correlation-Id: ea65632a-9cc0-4094-f658-08dcd67ac064
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bN+jJlAd3JCMhEbVTU3Eo351huW3S4YLaVuQDbS/kZ7xXycB/X5wE2XiSN63?=
 =?us-ascii?Q?jbrDwXFINVgDYBDylzXhf3qhwJyqJoY+h6Jv4OIFxc17o3JHoCyWJtT/Mqjg?=
 =?us-ascii?Q?S+LLGo2DlRPonvdl3tNQVmQLqe82RE6sgxR8S6XVOo3IJzanZUFpeiVaLseA?=
 =?us-ascii?Q?FwRQqdzrFP0PEm7nIo7KgErz2jQJo0v9v/0NATozpNdBybXIo+6zA36Fi6ne?=
 =?us-ascii?Q?M7D+xrufLSkt7PtIuY+eYZ8Iv2kxdwlvTgix6m4ijyHO0JNbHjKh6xCffpOP?=
 =?us-ascii?Q?iby2XA55nEl/+7NbAkesGDisiAIB1NILUKVSh1Q3PJbgTy3BkT99MsEom364?=
 =?us-ascii?Q?byD3UuNdsgI9zoErjOjuC+n/9tcpEH02YzRbQ3KUb/Pq3AVeQc1QqX52wUuT?=
 =?us-ascii?Q?3AEzQZDT4d6tdxNsGyvXjkSsnYJ4XSXQGQEikJmfV2jAWQzBNrcWFUk3TlAx?=
 =?us-ascii?Q?boAnIwdMQKBs4w+TNsXfOHikwutz9DpOED1t3g/vPWdHQe2qCKzDAIZcWoU/?=
 =?us-ascii?Q?QXKNR62neE/bebtrQb9wFF5uqydSlQ++BwGaA+XhR6BI/+1wKpXSeMCRhEGS?=
 =?us-ascii?Q?uNN+48oiIr6oZnDOX0JwkjieHUh9p6dg6bu5H7Mzl1FVo9qwY3iEPVkqNINP?=
 =?us-ascii?Q?e3y0DmN8/ncU0UfFijfE/xmBC2wCWa0O07q9vWsmdOfdywE79CnGHW2Fntbb?=
 =?us-ascii?Q?zYq3lRh6/xsagKmKbyoZq9pclwtI6k6ZeUAHzagXPBkHok3dA7JemxfeDTkq?=
 =?us-ascii?Q?z8XxpYcrGTnv7dF+jCrVSVj/o7A9neS6YFgkZNZ+qeIEtdb34bg5YF6aZKfT?=
 =?us-ascii?Q?E3SifFGg2wnqN2ydeeRwXLIJbDvGwxgoRL2G7el1/mb1iLyWRB0LafvA637d?=
 =?us-ascii?Q?5e0bMGHhR26+PFaNeEkeZH6yln05c4GP8gst8Rn1PSuI9Uvg04OsI/8pRfb8?=
 =?us-ascii?Q?2LXwxZNJwtNNMXNDTmnu97qyE7At7+hYllRxzuWpBoAUgEDFYPvPdVXs/79E?=
 =?us-ascii?Q?Vj4l9YDP6fuX1GswDTaKuXJz91yMzfdeOt3HmkbykqxepbeRw7YAMJeYdiN+?=
 =?us-ascii?Q?dlaKhW4pQHczGpij1AR1uTcNKas9NQ+vOcv3o+/1VsKhsz+InTJ0eWCOXmrJ?=
 =?us-ascii?Q?4EOZHVsNCeyiRtbze1Bi/X503/2oezZwek4c48yVwq/xq4miUMo1+3tIqYHH?=
 =?us-ascii?Q?EUwEWj9cjx//FLazTLg3hruiRSRDow3v9N8uJpWzyk7XeAOTi9muUcbwEYX/?=
 =?us-ascii?Q?RyAta1CUx7GBUHNddPG7Lamn5b2BAFkHcotKiX8A4c7OlHCXXJGS2wKeA4yl?=
 =?us-ascii?Q?CVNhR11TupyBL5TefvjZPQk9oAAswPBmnYXddx4vE1JavA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BGxvuc+RoeQkYFpxXk6tnakoFe1Gx6GPWfTGaF4JrBtVgltU+gZlXBIUN8yd?=
 =?us-ascii?Q?1Y7mCA6C6EX8vgREXcYZwBdmQS2o5dVbVcVl5SlvJXbdNeo7QHyKsatw0Uw/?=
 =?us-ascii?Q?dDRJ7XPUnkDs9Fe0Uo0fhXc/bztzko0p0qaapBkop15yWBNhVx6VZcQNZeTe?=
 =?us-ascii?Q?GueCxe5S6Yx6rquudUeSstP3F+vIBAquA7YphE+7o3IHw/8xI6BJnDclfizT?=
 =?us-ascii?Q?D1Tv9yoln2ae4kEadTU5PsJJ8XZK+5PWKQd3M3vH3YNU7lb3frzI1AMAku6D?=
 =?us-ascii?Q?fjpSfaUCNL34MLQXeaTksrQ73FEYy7M1dI05i0jr1rxXESlnNUiktiZG3Uss?=
 =?us-ascii?Q?iqlMwoYC1ukdHSBUOOGIumITYj3zNtlyrcHu67Vb0SlCjgBZf8K6g7PLKFB5?=
 =?us-ascii?Q?snPA5UufLiV3Yv2Hex1RjYKBTiNtc4kI2Yr6GOkn3GY7vZC5UJAJ6anDVHz7?=
 =?us-ascii?Q?z65SVsNlEPBi7kjKOXJmyk6F5j3qHu+oMt3oCcGnUxlPPiY46b+LLJtRcsne?=
 =?us-ascii?Q?GDHqADhAzTPSZRVxy2i/vFCHPvPMiWrJZhTwZdbq+3DLmBq/UQ4nbr1AiFxj?=
 =?us-ascii?Q?LVyQPy6NS8f8HUX0+nYi3KLNT7bN+5feYQJG6omAtc+mxVfuhQyjwX5KjxFc?=
 =?us-ascii?Q?Ia/U903M6kLh2T3dtIahmtD0QXb4fywKYcMIx/KEnDHSs4FnfYSJLe5Ra7QC?=
 =?us-ascii?Q?zloNdMzJB2ibyTaVwLw/MazbL+DQKfkImcu76pLp4XYjQVfCjoQA5jAstpFo?=
 =?us-ascii?Q?rplNcDhlkDv8Y/5hzdeyKb0WxFo6N9Qpn2Of0P4c97qKZF+m67WM09OOw4K9?=
 =?us-ascii?Q?Wa1eD5EcB30LFxlNVzVbOi8WD+4qPjbpUb8CYWgXLh247Xrs19Ws8miSuowv?=
 =?us-ascii?Q?vm2FMJBO0mLFZ6QwGWXg+mxBjxmL8uqhOZFh/kS/8SmE2QbLGO+7iL+++WYQ?=
 =?us-ascii?Q?FhPJoyTnklIWaanD984DKikxk6slmxp/SwnDT5ulTMxcAmgbQWzbNU5+u6Oi?=
 =?us-ascii?Q?83EKlcrcgULfKjOQYC6hPn6fwzMQvziRtHlW+2pqD3gxf/njbxtqnBy+dq0s?=
 =?us-ascii?Q?4xASWw6Z9UK/vvPXay7/9ntO3ICCxOh2Yk02OPg90Sn7XZIthFMP9KHbfQyM?=
 =?us-ascii?Q?80M+McuIpH5SLHzy2PCoQa6x6bZGn0FPXHZZvG+lVe/a5wdagIcQkAahtXjH?=
 =?us-ascii?Q?gMIlUgbLlIYZqWVBT4TYXruCJEJYIEU0dxfnJpuOvGiiQYNySa2WZinwlO6S?=
 =?us-ascii?Q?O8CNGsJzPoeGqams+X83YzQTfkbtmqUQZ7ZjdM3cpuVfZ+WKMPinDliQI9Ez?=
 =?us-ascii?Q?4Wktpj1BbdkTphXaeKtrDHLjY0duxmHVI8A46t2iUxbbX2PU8lQdbUikC6g/?=
 =?us-ascii?Q?BJXYzk8EpENEc7WUKg58yPTv7IVOpcqfmBhZkX4D6aLjssn2R7cr8hvPMcPs?=
 =?us-ascii?Q?J7LuTycN4SMwDUaYifiKm7ldPfZ0Q43/eVDdPInanuB9KDMZ0Sq4zcL1egGK?=
 =?us-ascii?Q?uQJvpHNFYesRRBJr6HfMLyFdLQ3jNwGTL9MOkxWRyCisbX3R4TzMRLinjtDA?=
 =?us-ascii?Q?MZgG+011QokkrP4sGZGKoS2Y+dnGaHszx+wf3nme8tHzR1zXFgyQorh2F6UR?=
 =?us-ascii?Q?kQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ea65632a-9cc0-4094-f658-08dcd67ac064
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2024 18:09:48.7739 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DxFKIg7VtHU63LLTrv5eQv4YMwrV2NhFkpyxdLV4FEICUbimwbaXsP2BRIICezs6/piX92UGbp3oGZZKWKNpRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7612
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

On Fri, Sep 13, 2024 at 09:29:11AM -0700, Matt Roper wrote:
> It's quite unusual to read display registers as part of GT
> initialization, but use of the display reference timestamp is one
> approach to calculating the GT clock frequency on older platforms.
> Rename the function that does this readout and move it to display/ to
> make it more clear what's actually happening when this route is taken.
> Also add an assert that we've probed display before calling this
> function since we never expect this to be the route taken on platforms
> that lack display.

oh! that's ugly.
How much of this calculations and clocks are actually a coincidence then?

Shouldn't we be using a GT based timestamp then?
Or perhaps a MCHBAR one? But why display timestamp would give anything
GT related?

> 
> In the future we may want to move to an intel_display implementation
> that can be shared with i915, but we'll leave that for later.
> 
> Suggested-by: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/display/xe_display.c | 18 ++++++++++++++++++
>  drivers/gpu/drm/xe/display/xe_display.h |  4 ++++
>  drivers/gpu/drm/xe/xe_gt_clock.c        | 24 ++++++------------------
>  3 files changed, 28 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
> index a3131a67e5b1..ac6d08a5cc73 100644
> --- a/drivers/gpu/drm/xe/display/xe_display.c
> +++ b/drivers/gpu/drm/xe/display/xe_display.c
> @@ -29,6 +29,7 @@
>  #include "intel_hdcp.h"
>  #include "intel_hotplug.h"
>  #include "intel_opregion.h"
> +#include "xe_mmio.h"
>  #include "xe_module.h"
>  
>  /* Xe device functions */
> @@ -510,3 +511,20 @@ int xe_display_probe(struct xe_device *xe)
>  	unset_display_features(xe);
>  	return 0;
>  }
> +
> +u32 xe_display_read_ref_ts_freq(struct xe_device *xe)
> +{
> +	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
> +	u32 ts_override = xe_mmio_read32(mmio, TIMESTAMP_OVERRIDE);
> +	u32 base_freq, frac_freq;
> +
> +	base_freq = REG_FIELD_GET(TIMESTAMP_OVERRIDE_US_COUNTER_DIVIDER_MASK,
> +				  ts_override) + 1;
> +	base_freq *= 1000000;
> +
> +	frac_freq = REG_FIELD_GET(TIMESTAMP_OVERRIDE_US_COUNTER_DENOMINATOR_MASK,
> +				  ts_override);
> +	frac_freq = 1000000 / (frac_freq + 1);
> +
> +	return base_freq + frac_freq;
> +}
> diff --git a/drivers/gpu/drm/xe/display/xe_display.h b/drivers/gpu/drm/xe/display/xe_display.h
> index 17afa537aee5..40030cac7fe9 100644
> --- a/drivers/gpu/drm/xe/display/xe_display.h
> +++ b/drivers/gpu/drm/xe/display/xe_display.h
> @@ -43,6 +43,8 @@ void xe_display_pm_resume(struct xe_device *xe);
>  void xe_display_pm_runtime_suspend(struct xe_device *xe);
>  void xe_display_pm_runtime_resume(struct xe_device *xe);
>  
> +u32 xe_display_read_ref_ts_freq(struct xe_device *xe);
> +
>  #else
>  
>  static inline int xe_display_driver_probe_defer(struct pci_dev *pdev) { return 0; }
> @@ -76,5 +78,7 @@ static inline void xe_display_pm_resume(struct xe_device *xe) {}
>  static inline void xe_display_pm_runtime_suspend(struct xe_device *xe) {}
>  static inline void xe_display_pm_runtime_resume(struct xe_device *xe) {}
>  
> +static u32 xe_display_read_ref_ts_freq(struct xe_device *xe) { return 0; }
> +
>  #endif /* CONFIG_DRM_XE_DISPLAY */
>  #endif /* _XE_DISPLAY_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_gt_clock.c b/drivers/gpu/drm/xe/xe_gt_clock.c
> index cc2ae159298e..886c071c10f5 100644
> --- a/drivers/gpu/drm/xe/xe_gt_clock.c
> +++ b/drivers/gpu/drm/xe/xe_gt_clock.c
> @@ -7,6 +7,7 @@
>  
>  #include "xe_gt_clock.h"
>  
> +#include "display/xe_display.h"
>  #include "regs/xe_gt_regs.h"
>  #include "regs/xe_regs.h"
>  #include "xe_assert.h"
> @@ -15,22 +16,6 @@
>  #include "xe_macros.h"
>  #include "xe_mmio.h"
>  
> -static u32 read_reference_ts_freq(struct xe_gt *gt)
> -{
> -	u32 ts_override = xe_mmio_read32(&gt->mmio, TIMESTAMP_OVERRIDE);
> -	u32 base_freq, frac_freq;
> -
> -	base_freq = REG_FIELD_GET(TIMESTAMP_OVERRIDE_US_COUNTER_DIVIDER_MASK,
> -				  ts_override) + 1;
> -	base_freq *= 1000000;
> -
> -	frac_freq = REG_FIELD_GET(TIMESTAMP_OVERRIDE_US_COUNTER_DENOMINATOR_MASK,
> -				  ts_override);
> -	frac_freq = 1000000 / (frac_freq + 1);
> -
> -	return base_freq + frac_freq;
> -}
> -
>  static u32 get_crystal_clock_freq(u32 rpm_config_reg)
>  {
>  	const u32 f19_2_mhz = 19200000;
> @@ -57,14 +42,17 @@ static u32 get_crystal_clock_freq(u32 rpm_config_reg)
>  
>  int xe_gt_clock_init(struct xe_gt *gt)
>  {
> +	struct xe_device *xe = gt_to_xe(gt);
>  	u32 ctc_reg = xe_mmio_read32(&gt->mmio, CTC_MODE);
>  	u32 freq = 0;
>  
>  	/* Assuming gen11+ so assert this assumption is correct */
> -	xe_gt_assert(gt, GRAPHICS_VER(gt_to_xe(gt)) >= 11);
> +	xe_gt_assert(gt, GRAPHICS_VER(xe) >= 11);
>  
>  	if (ctc_reg & CTC_SOURCE_DIVIDE_LOGIC) {
> -		freq = read_reference_ts_freq(gt);
> +		xe_gt_assert(gt, xe->info.probe_display);
> +
> +		freq = xe_display_read_ref_ts_freq(xe);
>  	} else {
>  		u32 c0 = xe_mmio_read32(&gt->mmio, RPM_CONFIG0);
>  
> -- 
> 2.45.2
> 
