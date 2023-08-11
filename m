Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F693C001B0
	for <intel-xe@archiver.kernel.org>; Fri, 11 Aug 2023 18:26:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC01610E6E1;
	Fri, 11 Aug 2023 18:26:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C63E10E6E1
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Aug 2023 18:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691778373; x=1723314373;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=3o1OlGqgrg43ehcw/jtjGts+5W1boU+NYS40UTktJbc=;
 b=Jn7teqWw80+R9dF8ZHufJY8m5tBigR11x0Ec9FKjs9tAE7plBCbGDguM
 s1A9QO9N9ro6Ox+Ndtymh/i3nRmjr1pNNClOEqK72ttxZdL9QOyNX2OMf
 hMvMnYdFtvpy27Tjb0PhtQ39AOu99d8XZ+bS8VlsxfjDOZIU3PbspNZ2E
 dG1XK6sIEEtyju4GEX827aVKLnc6D5fusRLFy0QMBl9K0DWqFXYVKRMO+
 dqmQezQDYLm80b/pvpNwws1FnDRgYLVfVVlJj28gp0Ho8Yha40bBnRcbn
 dtztT7INUwIY8Xe2qxp0CSWqnfCfUIUEBgaFCDUUUat6I4p2CYMhZMLYP Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="458107463"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; d="scan'208";a="458107463"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2023 11:26:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="767745941"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; d="scan'208";a="767745941"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga001.jf.intel.com with ESMTP; 11 Aug 2023 11:26:12 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 11 Aug 2023 11:26:11 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 11 Aug 2023 11:26:11 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 11 Aug 2023 11:26:11 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 11 Aug 2023 11:26:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PCaYI5fnIpK/9XM2bghx9+/i+R6D7B081AQvIoQmXv5wTlOkl3SutKU2Lpcol4nGTfNoOv75t1j/VeiukoDtxECfE5p0U+dnLogvxjklO1yKrzvuHBTT9aI4TXE14z+uYKDFM6Y7OyPHZJOJ9I9IJgnzX3nV6yd531RCtJZkcXp7M4rXC0nbqe33WUNZ3utLronuhuGx8SPjgXnucXRMY0JmR500VmffZYf5twzgKa+N6M2FCIuBIThIT/SOcPKOie1Sj9NhLvesNJJPlw1lWDJ5qxDywE3LNdXpuKf0NW+WPsbv2iz50tLfYVSsbv1zfy7t4oDhsDaUNZ/U6aY6gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y5DnbSeZHayx03xP1O1uc4daNvSf/454KNYVAKmUNgc=;
 b=EGFyETcKyMFceKMb1mi9vpNRfNtY9qxQuqiidPmwHmVYnXbuxg6JjIiJKPVqCZ2xSN+PymF0cWRR4yjJj+0HFUibuwH5WIlCy4FWS8/01TtX/tYpPSVjGn3NN3oUZPrcIQh03htZmGSt7I7zz44tPrMlSJsW9cdOb9aD99dpYiXg7GbNohfEwK43RyHafxUkkhR9hHam4eXPoPVvoyFvu3rbweQ6EmVv2aWJDvE6s7rGC71V+ffyFMNuTj/EQZWKh8L/2RtciGKGw1DAHc2ddEEsTvKQFeld8xSxWK5gKpb0/CD7riLM4z+T+CA17aI5/DJp/VjTx6e2wkXITXLv9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by LV3PR11MB8579.namprd11.prod.outlook.com (2603:10b6:408:1b6::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.20; Fri, 11 Aug
 2023 18:26:09 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b429:ee19:a001:eb69]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b429:ee19:a001:eb69%4]) with mapi id 15.20.6652.029; Fri, 11 Aug 2023
 18:26:09 +0000
Date: Fri, 11 Aug 2023 18:25:18 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Oak Zeng <oak.zeng@intel.com>
Message-ID: <ZNZ9Dk16chiys59k@DUT025-TGLU.fm.intel.com>
References: <20230808024501.11669-1-oak.zeng@intel.com>
 <20230808024501.11669-3-oak.zeng@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230808024501.11669-3-oak.zeng@intel.com>
X-ClientProxiedBy: BYAPR04CA0022.namprd04.prod.outlook.com
 (2603:10b6:a03:40::35) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|LV3PR11MB8579:EE_
X-MS-Office365-Filtering-Correlation-Id: f2dd685d-dba2-49c5-d28e-08db9a986ef8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1YXqfwxiti+eqnJGm2/a6oMLgS3GzBw+LBg6BBNki8Xf+mf61a6Wp109asFt7riGyD9aQkkV/6NF5fH1hjFbgxmqi3or6fYdT4X79d4CytYQATdyU8y99icy+r/E7pebwqngoPOs5xo9W7anpPUHkuX6rG6REVfKF69PehuPNcvoLje1tdjcuVBMidae35AJUvhwWy/zUTmTSiRYuNkEqq/rBkVNJZynuBow6kJ5S0MKMF9tYoZgZiQMy55Qui/rARtPtMbHMJHTsu+Tly62JpERZ7EqTxwFa4Ig1m0r1tG/AO1c1EcNweGPJhtJod6Crrbcz3IjYSrGYka2BLA36LuIJljUKy7rcu1pCFtZLmq2WpHOJ9Hu8ZqwTZCsnsp0nV/9lvMATgMgk3ykwImu0KiQzRRrYzVBeDxZYrkwjyqkp9rvZdqfvN47SP0qi61OgL2ahrBHkb3eil3n78eGry9PWtOIkFs1WuGsjg+GA+Et3d3lVDQSP+xkktgrn4oE4Ht9GuAQ59P0htj1IiJS2Ar46iAo/EIEWEkOjsUS/mdHApWe17IWaOSvP2XFwPnQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(346002)(396003)(376002)(136003)(366004)(1800799006)(186006)(451199021)(6666004)(5660300002)(82960400001)(8676002)(6862004)(4326008)(8936002)(38100700002)(6512007)(86362001)(478600001)(83380400001)(66476007)(66946007)(26005)(66556008)(2906002)(316002)(6636002)(41300700001)(6486002)(44832011)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xtT8RWbWuN5WQ6xZumXUAKXbdphjf1+j/I7sMAZdGlP3M3sn5XDIX+f8Qh3Z?=
 =?us-ascii?Q?dbeU0JMiNTDss2e/741glAmSwOd3n4FR4INKOodw/W/VXi4x5TNai7CV9MNp?=
 =?us-ascii?Q?G0r9Zr6m3M+SimMXyKSzticaBHh/jQ8OTO8ZxUy4/qPlMoB7oaoUBkTKTH6M?=
 =?us-ascii?Q?VgSMn574n9oP8brEc4b+B1opAxL1e1aVGOdPED8rj43D+bkWSba2lMdm4Vky?=
 =?us-ascii?Q?ZRR0eM98zT64nraNpSaKYf2r1buna5NVDNqm99VW0IXKiyXKthjKv8347rpv?=
 =?us-ascii?Q?L9g7VXqiT/zAbqVSxcn4h6WB/64XyscIP6FPZn3e8c1SGGrj79SRF7HjiJ/P?=
 =?us-ascii?Q?0l8UJmMMFuo5m2zLl3osQVu2M2zQt3nHDJX062zCK/KaMVGl+rCW85cwEcsR?=
 =?us-ascii?Q?pQkC3kdZjLw/3cz8K43elQAiS4zF7Hz8f2MAiyiPI+1GehunqI5EJY0hqWh4?=
 =?us-ascii?Q?ilh9dc9LN+0+/bLWNUt3qpGFMOup7ZzqDIb/BFUHDfojn4y+ZRPaHEJyCYSK?=
 =?us-ascii?Q?vK3QgK+evERtrRc813sUZUwgzww2IrIKTts0jnnjBPaC85F94PtvAzCJfJGD?=
 =?us-ascii?Q?ejRApYCmLjxzF7D9Lrn7vux81D/rl7Sre19QE2dTjFurpUZkI1NTFGEr0rkD?=
 =?us-ascii?Q?+nilTw4BKUeiPwBVaXQgwXgVa/yEZEhdi3Y3320UGhVm7VUWlK7ynDgPcMyi?=
 =?us-ascii?Q?Coo2GLCuEopNBcJfBZ3ei5DHHe9ZZ6NdrlWmRdiZaH5VcEq7LAjTF3g4GsYw?=
 =?us-ascii?Q?0SEVbz6GvnivVMoazj+oCAXMWh4ZHD9Uo8HbWaCjpCSK+1OfyasOEz68LUAc?=
 =?us-ascii?Q?tWZydc3+ek4fk1PnGN2U37TLMSNkvIpoY4A3aKuv5d8VayUx8xjAidPK/Nic?=
 =?us-ascii?Q?E41K03Tl+D+z+NglyJEvPL6IHB7MAhxzNyqdL9fcdzUUCQkeO2SHahYoXlb+?=
 =?us-ascii?Q?XxYzl+uK/cm2aSCUljZUrGYjLVh47RYJxb5vadzVX+KGn0wNS0Lhax9Me7Aa?=
 =?us-ascii?Q?Zo0ZKcTgWKJuxsf3WUcLYIA0dIjvpOnFCvTQFxo7D9AnrdTAe2wyjNSzN8x8?=
 =?us-ascii?Q?WwPIY/4mZ/vK3UewPpAxglMNckdrVYI0U0LqJNWrSp2kjD+qV5Gb0ooexQT4?=
 =?us-ascii?Q?Awx/f+uAEL1P7n6lJlINEoESVPhYD44iowRMg4Cn1CeXYrC1Hm9Twxi0TkJR?=
 =?us-ascii?Q?gzVPNpHXb7t/KeHMwn1FifzH934sYRzATTc+rfCH/By6yIkZyPOAPcsjjSAK?=
 =?us-ascii?Q?ZvASPuxYnqPM5iaFDUsxPM+xWNd+qKdXotUMzIuPg2LYifFHy6eSVbm11Sov?=
 =?us-ascii?Q?JznVTDLAL8OoHrplF69F/9NRSX94/RpzxVxU49d3674f9h3r3fqOyTnHMA24?=
 =?us-ascii?Q?6cJBGl0rfoNTI1fkioxKaUChWppF0wGylOxa3LRlPqziaylp+6XtlGD1gZ8G?=
 =?us-ascii?Q?SDN76Tc5zSTmTfxfcZw+R0cG7IUCU4WXZ36U8R4DDJ8UskXa4fjFKM6YL+pP?=
 =?us-ascii?Q?zXq7KxfWOdJWxXTyqsdTX7N/Re58rdhQS0BhJoQE7R+mHslX1kZTujBK120w?=
 =?us-ascii?Q?qBVTiubO9mOBgM9qaNP6Jeg6q/AGsj6OlfKsbH0VAKHuZ64KJwAHF9GOs6NX?=
 =?us-ascii?Q?iQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f2dd685d-dba2-49c5-d28e-08db9a986ef8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2023 18:26:09.2170 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pzAfT3r56Y1XRDp5rxitEeCMASktNDtBe57QhnE4iNB+MyXBjpABzYOk4bhWCTpUPw+rnAp2e5dsGNKUExS9sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8579
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe: Improve vram info debug printing
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Aug 07, 2023 at 10:45:01PM -0400, Oak Zeng wrote:
> Print both device physical address range and CPU io range
> of vram. Also print vram's actual size, usable size excluding
> stolen memory, and CPU io accessible size.
> 
> Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_mmio.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index 0d0966691eaa..9f249c61ff8e 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -286,12 +286,12 @@ int xe_mmio_probe_vram(struct xe_device *xe)
>  		tile->mem.vram.usable_size = vram_size;
>  		tile->mem.vram.mapping = xe->mem.vram.mapping + tile_offset;
>  
> -		drm_info(&xe->drm, "VRAM[%u, %u]: %pa, %pa\n", id, tile->id,
> -			 &tile->mem.vram.io_start, &tile->mem.vram.usable_size);
> +		drm_info(&xe->drm, "VRAM[%u, %u]: Actual physical size %pa, usable size exclude stolen %pa, CPU accessible size %pa\n", id,
> +			 tile->id, &tile->mem.vram.actual_physical_size, &tile->mem.vram.usable_size, &tile->mem.vram.io_size);
>  
> -		if (tile->mem.vram.io_size < tile->mem.vram.usable_size)
> -			drm_info(&xe->drm, "VRAM[%u, %u]: CPU access limited to %pa\n", id,
> -				 tile->id, &tile->mem.vram.io_size);

"CPU access limited to" is helpful to quickly ID if you are on small bar
device, I would rather not drop this message or at least have a message
indicating this a small bar device without having to math.

Matt 

> +		drm_info(&xe->drm, "VRAM[%u, %u]: DPA range: [%pa-%llx], io range: [%pa-%llx]\n", id, tile->id,
> +			 &tile->mem.vram.base, tile->mem.vram.base + tile->mem.vram.actual_physical_size,
> +			 &tile->mem.vram.io_start, tile->mem.vram.io_start + tile->mem.vram.io_size);
>  
>  		/* calculate total size using tile size to get the correct HW sizing */
>  		total_size += tile_size;
> -- 
> 2.26.3
> 
