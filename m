Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1553CE7B1E
	for <intel-xe@archiver.kernel.org>; Fri,  6 Sep 2024 14:50:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D75110EA79;
	Fri,  6 Sep 2024 14:50:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ERA2Bob0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 566EC10EA79
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Sep 2024 14:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725634234; x=1757170234;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=g3OzoPAL2lAzZ587esGHE2mUi4mtwLxsP9H4RLwYKb8=;
 b=ERA2Bob0K//YjJclRZc9sOIOGAk7BFrvwBtBQQoZomBnEBnIo69fwZVH
 x4KAJbZlPQR1YnkbAmGBlGiUidKGcFFhRb4EQimPD538VLXio742pf+dr
 FvfotN4zd0lv+v/rOFYujIaFAXlXZPvPMVA7jNxN1+g2g1Hs8DrgeqTPP
 aChfoGPWyUyEQ1vJRXJdlx9dlOIaL0lqtk7vYlmJQxQ1Nbx1Ny+W/VoAw
 Wsckvpy0eLF3QeF7vGr8qnT/wsyO3yLnfKBVAgAZo8rtPrwFXM+EiH0FA
 mdUT0yylDoNhcRR0hRsk5JclRXOciovVZk2rYUAyw7Zy8i70t5V0TRy9Q Q==;
X-CSE-ConnectionGUID: roQAaH+9TiK6GNNRmBoPjg==
X-CSE-MsgGUID: IgcrnKA+Q/C3BdNpDiI51w==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="23900148"
X-IronPort-AV: E=Sophos;i="6.10,208,1719903600"; d="scan'208";a="23900148"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 07:50:34 -0700
X-CSE-ConnectionGUID: TalK3M8hSn+efeKXj6+jyw==
X-CSE-MsgGUID: J2b8grTqQk6hkXIO4W0WwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,208,1719903600"; d="scan'208";a="70916500"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Sep 2024 07:50:34 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 6 Sep 2024 07:50:33 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 6 Sep 2024 07:50:33 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 6 Sep 2024 07:50:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PAhE7K3eBKJ/mrnGsmwN+TyQU0CVqsC73JrAgVbnvsBGoEnH0OXf8apDdJ5Cm7MJ417y9q5wM0W5milphuTeqJoHzTaXX1vhhViSOXZwUWESZd5YAaXa5GM7w390ykkhtkwFOr3b6EctIPDkDAxqp/q+ZnI8vuPPge7lKyDzvoeX1LSHnleErvdv0CP88kn/K3CfbONi9x/11bn6xWzHbEwyJJY0GTmk20Zznjq364ckZIWrCfn3/h7NnlUqoMvpB8j9/y8Bu5mhV5I/rIHWsQ30HrcH13I3Gxgj57w4Y1m+uxDgevF6oEHZw7xG40gLO+dXY2geKEUZ/Spx7ztkDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8dECVBpOa1DMUZLQRt3nQAGmC/TpVGtp67535ZY1QKo=;
 b=zMZsz2yq/OE2SFg5OyDFGfyvA5+wnRHfUt8uyoWv0EbCv66p2k4Y0D3BipNYHNQij5Hxri9FEiPL82pEkSi8TxZBCT3KUrwE2WFcye4NbvNtZMHEcIZPfFaHf5NIBYFqyhm/1yOJLjPgfW927ZDsr+LO0B6bwZk7F8KQL69iD5betlUc3japuSNavyVrtvGMwqxhXkI/+7YIfdu83a738QSJFJ/hjRxJG33ByJBSXr6V05d9LSAAZvlFahzKss/AbKbBSn5UhwZgnRPj2AGjDlLb3fuG2jul/L5HwitROZAH1TryHmmg9nsBqVNgaGAoocvGtpbBrRmAUKp1zu3ybQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by MN2PR11MB4728.namprd11.prod.outlook.com (2603:10b6:208:261::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Fri, 6 Sep
 2024 14:50:30 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.7918.024; Fri, 6 Sep 2024
 14:50:30 +0000
Date: Fri, 6 Sep 2024 07:50:26 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
Subject: Re: [PATCH] drm/xe: Fix arg to pci_iomap()
Message-ID: <20240906145026.GU5774@mdroper-desk1.amr.corp.intel.com>
References: <20240906032507.2952859-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240906032507.2952859-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR13CA0143.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::28) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|MN2PR11MB4728:EE_
X-MS-Office365-Filtering-Correlation-Id: edb310a6-a1de-47da-dace-08dcce8340bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gELIDRXuttWJ19+vbdeP/IAa2Ckc9r9UrW75/KsNM8obEUlLcedIJx6eI9lr?=
 =?us-ascii?Q?zFbmZCJ9//a9OScuURWxArXfRoyovUauxRt0tpw2TpGL0/WYL0E37Q6ZabuY?=
 =?us-ascii?Q?vBGr8qUgZk72oRSPHvwe2ucz6w7oRCsk8346THawlFVsd7Lp4oYpghadzoVu?=
 =?us-ascii?Q?rIKwYi4cSPxoBHn/67rUMUu0wAXil7X+WHUb/dc9DxLgKNmZoE0BxLFBE3Aa?=
 =?us-ascii?Q?dOnRVdtkDwwhlLStdKRJBV89cj7J78uci1PAdgZZm2PlhBw58Gr1B2xgygzc?=
 =?us-ascii?Q?gFBSctC3l9rTKZC31/RyE6SkKfz42FvKB5ANq+hwMCP7aj6W0NiMTzCurE9V?=
 =?us-ascii?Q?cqCJkslTwCniEiPZRCT1l/B7Te+qfukTT9l7phNyJqnY4otK0DpllTzId5Q2?=
 =?us-ascii?Q?RVMlgQMvt0ZViWo7bnBYt05XAHIBlYrEtCH70aoTkaxBc+MfDmHCbaFbIiXS?=
 =?us-ascii?Q?1H/QvMzTXoDOrGFJDg6gElMqyiJrj/cXSU5sH9KPGZNtdfi/9lxOPftSWVuG?=
 =?us-ascii?Q?XZ0OOj9tRy9jtfKTdsCBQsumZpp1yCj/QGEcy1/caYJUeiZhgKs6/Uve2aLc?=
 =?us-ascii?Q?yay6nDuvckmUQ385AtakIAGJAYa9PFneH9kqdiLPwQxz8yTJJMBrf1OgfGNN?=
 =?us-ascii?Q?WRxrCbZs4bUa0GuFbPes38/iC073YZIx80ZRk2MHr+YD3P2e6+AELkPRZQAH?=
 =?us-ascii?Q?2CwjzbQiQypJzab2LwHC7a+xkHaQOqPPABx9G+j2xziSYvpnKc1+GQuCIgqs?=
 =?us-ascii?Q?RVZx8Mj67iQwuxsvKEo/6j+E6+h2H6cL2eJW5bYUEzZzA9wOXcpQY21xf2oC?=
 =?us-ascii?Q?jcdQZz2RZS2cJKm7NkaWS4uDJEl4NSJyLZNJukzTVD0PIl7rbmahNHVw1/pY?=
 =?us-ascii?Q?YnyG5+QORky89Ek7wBnMG7lhxal+hglnLmAi24GWAgSoZ9nXkubUuwUaIK34?=
 =?us-ascii?Q?NBCrWP2aVR0Wwc2hAWMsNKESFj/nuOqfo6BAPsQdFnQg1xDhBnEAsyitFWA8?=
 =?us-ascii?Q?yRVaX6nBA/qb/RiKFUfNzthzCYEtP+Tig56EI415SROKWe0IwNJa5nRw1F/M?=
 =?us-ascii?Q?HOR/18x+/vlzytLveswurG8kXYPYT39t4hcBltqKP+Cbs2gp77oSaWY5nGbS?=
 =?us-ascii?Q?IFosnXHsjwf6uJ3YwBC/ufif6S9dcqmVUqKiioj0Gtlls2Xulv3djVWk27mo?=
 =?us-ascii?Q?p4LH400xvHcVow5m+nhrHyI5Z339HtgBe4Hw8u9D2axExi9TTgJrzMbF9oEs?=
 =?us-ascii?Q?WiyAd7DYU1Cho159iGGBdkxJu6+OVxFcpXiI2h20UYl43He4Jn/K4WHa36g6?=
 =?us-ascii?Q?0vXHUDKrvlS3dgI+8n9o8hj9i3H//uF/QOZvxk/8E3N6Qg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yECfbzgLtlN55gJyh75xbL5uVPzvHdArY0iQK2tudxplMmfApAy3xQKcfdhv?=
 =?us-ascii?Q?61WZFdaJeh+ake447KNtg96veOg/dUJQstrOkkVTEpDKq3L5ETnqJNa0K/Tx?=
 =?us-ascii?Q?HFcuaq+O+e4hS+ysahVLCyO30XJFptuD/sBizSUav53drDGvzWgq5uIWslgI?=
 =?us-ascii?Q?uBgfmp3Qpz+NpKjdeLGvVWtU0wPmTc/s3YH5/T2kAlQOGbjPlPdmAVQ8Yra6?=
 =?us-ascii?Q?QBdZua4ofpqnrZXYPv/Xoj+53feAclEEONV/NHoCnDifUc7IsFfErANmpcBk?=
 =?us-ascii?Q?c0M708/tT8DF5Ha19hFEznuhTLjG5mzIF9phsinIX/u5nUjnyCNN0nPds3xr?=
 =?us-ascii?Q?1w/e1NSOPm9Tecvmthm5pELckDd4vRB6Saq4UIV3ib14GkHHKIZzVM7iQx17?=
 =?us-ascii?Q?Cnbymw0Ncq21h3hwyFNysf1GsYb01D9RY21Qe/eSaMkemav8G4YVSeH97mHG?=
 =?us-ascii?Q?VOY/cj17fUKAnB/jzHlVresi0klcdJHPgCKua0ujf/pViaLBijQ5wjMoxhGB?=
 =?us-ascii?Q?I/q9lLSXN/mhRkmrxeD1oqJzp+88MGEQOY740zSEqXmWAC+DJbvXNQPw7Ght?=
 =?us-ascii?Q?E9hrz52TmkVjefN2n7695gy1rGtsfNODtIs07mOod33HOR18iVuZb1Vp17Ky?=
 =?us-ascii?Q?F7ZfEla+1xvFb8hYuLKdQNa8iwoDA8qiLP395y/ev2dqbT68nkve44qXBcpJ?=
 =?us-ascii?Q?r5Eg3H5UV73Ixhr3TZh+CAl2WfWgMCMcwKivdU23NifhCPS8rTsfbtqgsJOV?=
 =?us-ascii?Q?bosdlqGOw+ML/MLW3vhle83TRdwBeTpIZyUkcI1hAl1zGPhApnYkHVQCdjEE?=
 =?us-ascii?Q?8grwMTsiQUjwWnhAgA7jXnuJGWkhen5cC/hYoVDDPB8my0s8sOpKPctYkeAj?=
 =?us-ascii?Q?2ie0jzVVk3ykKU/nMQ7nSBQDxeEHpYFGGqk+a3X/x1rgNnjjlWxoDQeQWHxD?=
 =?us-ascii?Q?bjy5QT6k8sg1Y3Ap6GPzLD8i/DvSF+NZOUQyEOGIaxzUh1XfKteq3KROaFFm?=
 =?us-ascii?Q?XSLuNw8cy5BBYmdhfxQH/bCk6nt/ooDq1nEzmGWIOQ6rhW21Fo9yFmiZvN1M?=
 =?us-ascii?Q?vlX7aIN8OG9L0UQMYSmUUIXmbLyMYA9w/Gb/i3H49umu5qGpFzUc5orF2N5+?=
 =?us-ascii?Q?nwquDInrzecObDHc38Af6xfM/2i8v/xDL3hJLFwlS5iFuuY4jfj85CIMTQbE?=
 =?us-ascii?Q?7fFoKKqx4sD+97NHTLcjQFyMNz7Izi4pJLmq+5rC3T5OGTel1nd0ZEcgmZB6?=
 =?us-ascii?Q?TPAhLXlA0fXe3SrJXu6dlOkNxrdjQNTg64TGewHmaNzUVwxp5/ZIEFvt2Cr+?=
 =?us-ascii?Q?PB1gpyZ/0vZbtjVtmpskTentRPtt4iAe+ttHE34b/DwyWxBXle/LzxA1Aw3O?=
 =?us-ascii?Q?lUKRDrNIHYB+hYlk4WZVJE97/oTFO0855RycB/EEAeMFrI9yjYwyQReHLfpm?=
 =?us-ascii?Q?CnrDhCge5XWcnq2OUiod8WdOQNvhOTWpHZxGfEm6PhuP/qiBsR5TGVA6VD/t?=
 =?us-ascii?Q?2I3pY+DjkenanxY+C89eKgOg/I8+X8hag7JgqIj9KQWOF34cqOg3VfxWwACx?=
 =?us-ascii?Q?C+8gR8RQneuv8wpmnxyjz+4RqKwya9iZY4LVH65vqGI8XimSImueZthIaCE0?=
 =?us-ascii?Q?Tw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: edb310a6-a1de-47da-dace-08dcce8340bf
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 14:50:30.3271 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qhDo8SsJch/toxwgBoIihwEb65lMocCU4VWQh3YytNwEeascItmRZMlA1GT+Fep+2WCQx+8Ctoxk1dDcXvqg6WRjeNfwyRtYlPbZ91csMFs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4728
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

On Thu, Sep 05, 2024 at 08:25:07PM -0700, Lucas De Marchi wrote:
> Commit 2d8865b27724 ("drm/xe: Move BAR definitions to dedicated file")
> moved the BAR definition to the header, but replaced the wrong arg in
> the pci_iomap() function - the last arg is actuall the length, not the
> BAR. Luckily GTTMMADR_BAR == 0, so it still works. Fix the argument
> to avoid confusion.
> 
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_mmio.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index 3fd462fda625..4aae30880bc6 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -157,15 +157,14 @@ int xe_mmio_init(struct xe_device *xe)
>  {
>  	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
>  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> -	const int mmio_bar = 0;
>  
>  	/*
>  	 * Map the entire BAR.
>  	 * The first 16MB of the BAR, belong to the root tile, and include:
>  	 * registers (0-4MB), reserved space (4MB-8MB) and GGTT (8MB-16MB).
>  	 */
> -	xe->mmio.size = pci_resource_len(pdev, mmio_bar);
> -	xe->mmio.regs = pci_iomap(pdev, mmio_bar, GTTMMADR_BAR);
> +	xe->mmio.size = pci_resource_len(pdev, GTTMMADR_BAR);
> +	xe->mmio.regs = pci_iomap(pdev, GTTMMADR_BAR, 0);
>  	if (xe->mmio.regs == NULL) {
>  		drm_err(&xe->drm, "failed to map registers\n");
>  		return -EIO;
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
