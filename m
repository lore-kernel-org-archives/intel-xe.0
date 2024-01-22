Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ECC1C47DD3
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jan 2024 20:15:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F246210E5E7;
	Mon, 22 Jan 2024 20:15:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD4C010E5E7
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Jan 2024 20:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705954504; x=1737490504;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=gpwSByBcyP8WBksBJOt/u6kBFG/2veh/zqFGdoQbG84=;
 b=jHbt6Mi8716/Kg7tX4BSJtn0mQt2l2M2V1yDzOzDEeSb/nFmoMAIhHR3
 prINsNpAq/BiuIvcLInPKkdPhorEWW0CcbwlOTlk87NJah2spRB2BEcmY
 pZull6dEqHmPxf8JY3BWS1keEIJqnryYXuCx967zFe72tPgw5Y0VTMtMA
 Af1IzqczpHo3weEOmLS1VDIVBLcbNNsuL7O66bNTrJuZfSHufkrXAAZas
 QauCDjd41FUh+lKRtozqswSPdrbahA91U6eu6D9nu1rCGf8L98LllbJzd
 yYlV1m8QTfEa9wE2YgKmCbw22tBp+ilOPqk9UhzMpkiI5PFRh4K5KJKm3 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="1202794"
X-IronPort-AV: E=Sophos;i="6.05,212,1701158400"; 
   d="scan'208";a="1202794"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 12:15:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="785785236"
X-IronPort-AV: E=Sophos;i="6.05,212,1701158400"; d="scan'208";a="785785236"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Jan 2024 12:15:01 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Jan 2024 12:15:01 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Jan 2024 12:15:01 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 22 Jan 2024 12:15:01 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 22 Jan 2024 12:15:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wj7E32x/YRV1g0wY5SlkREN6Ci7CCeVh1HtOHnTnqRS/A/ruJMQfR5ZTeORj/FcCVoblKfcg1W8SripJp/9kIPXZVKGi499V2wa11oL+YxOQ0H9DHPR2hRnJHBIRxpmeJxQ6wT8AUQBIVV6PsDZff1/SVrqR3tCM/XlGSE9pBua47F3oBjtZGaR2Rs/8Q3JfmHj1okKOjSvsGAU9QD4ig+eD0R/gZqIGrRX2o7wieZHGx8zhd2rL2Hq1Stmi8K+vc6Zk+S943ab+cliAOjnlNN+zfRlHcq5ThkUeXfYYO9VI22SPh8jmoMMRibO6l5WcBd1xJAWvikBH4KteGPC3dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d75k5w3ksjeftR8ycKq5sWjOrP06eN+l6qBU8zq4ktg=;
 b=X8++jscSi90H+b9hIoB+d819oWsI6QN1KDWxa+8PnDDbvsiHgFroBEHSWD9M9z/syDW2HjJAtkFkfnKJ5YxyFdTRcnTOMm/H1OxROAXYEJ0jjCLOkKF0GcXl38HwlHkmJeS1hyzALcCBTxmCxqcU1qEZZWTCGAJ+/hfQA4fxSjoQ3kZfeA54/G4n8uWVRi7nNxR9mOWfsM4HbCEQHwGLgUwlrbJz3sfTDH2HRXQ9UFEpu2YVwq4izH7zo8ksYV441Sf9zrPQ1SWHNyodMxpuyWlc4vBt72XCtnWuNlbbMyVEjOldT+DZq6v/7tjXGArr5FQ3xz7vHPJ/4NXhwfECWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM4PR11MB7375.namprd11.prod.outlook.com (2603:10b6:8:101::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.32; Mon, 22 Jan
 2024 20:14:58 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7202.031; Mon, 22 Jan 2024
 20:14:58 +0000
Date: Mon, 22 Jan 2024 15:14:55 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>
Subject: Re: [PATCH 8/9] drm/xe: Print registers spread in 2 u32 as u64
Message-ID: <Za7Mv-kfTDmxQWuF@intel.com>
References: <20240122170445.108856-1-jose.souza@intel.com>
 <20240122170445.108856-8-jose.souza@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240122170445.108856-8-jose.souza@intel.com>
X-ClientProxiedBy: SJ0PR13CA0210.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::35) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM4PR11MB7375:EE_
X-MS-Office365-Filtering-Correlation-Id: 136d462e-9394-4847-6a99-08dc1b86ce54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r0nSr61TmNsYCYYqSrIRurmdoG/NFGEmFq0reUtO9HTHkxQFLth2y2XXH0w5373GhegdPdyGX9qw+nxdVmlrmh6gz1WGhE2JkJow4Jt02Mq9dRIiLHckCe/eClQH/7aPncaM6sS2rM9WK0ExsAAEEhqk3l/LSZLru2IM0QsracDwTczTJ5xD+1tICionfFjg+CtipXHYqOoVgXrKYKSFoCEPRJF0oM1i+g3oktKPMVmYmHG47T7uPOZY4LmdlRgcqQ7kFyOgdKA19Sf/kOcA9QOD7IrkIwMufc7gEfJecAye339rWkS7ODupFCNeOobhDrXJoaOHsiClx48hnDOLSys3d36THdCfdYeeuicL0upeUpMqnQXtipAblfch6P7lGHQXNRJ+37Q7QcffHtA2qUPSMeEKm/ZvaKIHvEdV9Uf5qD7PjiYJv47gGCS9JJ/JdXO2dBqaMGdpdORcAp4mX6jjY2QGcSM0C/Gotaxna1aSbYLZLio3LHU10S5Sj1vzh5F5MRi/wULMTbBy25sfv59mVlmlwPZFUTyQw20okNrDIyczE6nes55RUn/s4Zmx
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(346002)(396003)(136003)(39860400002)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(6666004)(6512007)(2616005)(26005)(6506007)(86362001)(36756003)(82960400001)(44832011)(83380400001)(5660300002)(2906002)(66556008)(38100700002)(8676002)(41300700001)(8936002)(66476007)(6862004)(66946007)(6636002)(4326008)(6486002)(37006003)(316002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?4MdRrybdixzYK+oXqvXmka0jKLng79KXFC/sXFmSAATcyR4+je41lxC0By?=
 =?iso-8859-1?Q?uXtouAPeKNZnjuCjR2gmIwvsrbwLTXeqJ2hAfmbSfwibOj5h+Kug1r1dVY?=
 =?iso-8859-1?Q?KVGjAAXEFU44j6PC8F5oxiRpF49xIS6cs+57NHotMQ/NHnLnguziRaQXvy?=
 =?iso-8859-1?Q?SAMqAGBMF2u4ahaqw1Lw+6Cm1o/N/14Z+9GheDEjsFRYNgjqCVZW1jEZv4?=
 =?iso-8859-1?Q?KHQHzwCYASC/8fHNMOl7s+H19HI4zOg2+3r3SCoCMyg7WEM8kk3rvz9tVq?=
 =?iso-8859-1?Q?cWk9OlNPjj6d38TnLjjD2aViDKmBe3bKwbX6IFYdoZIKLAnmBWg5OxL8mM?=
 =?iso-8859-1?Q?zMJDkiO1d8Q1IeB83Cdi/GayaIhYvFqqMkyt3ske2D1Hhk0i3tnepzWyQ3?=
 =?iso-8859-1?Q?4f1Lw6HBWK1DAK4R6i+ubfPyhH5GXNfvAquyIi5ktSvuiFkqUc0stctNy4?=
 =?iso-8859-1?Q?Hz2BVAXoh8PuBizcik9rCE9BRxGuK83BTvjgwEJrfb5Q2qrhfYfA7Js4YO?=
 =?iso-8859-1?Q?S4HQk7Crpl0gaHs6iDeJfPv9jZ3s8Ncrx/t2impWanja936gz5TMg/HOzn?=
 =?iso-8859-1?Q?xMYpau0tNWvCgT9o24+gVYnWHDqlgbTa8GxKrAg3DCtgdOZ9Ny+5sODG6I?=
 =?iso-8859-1?Q?pnWEertYErVu/y4P44uvLzXprNQK+2w6Pf2/QNFLeffJrAC/Gc8Iadzn63?=
 =?iso-8859-1?Q?oUzs2wLlLWNLn8MBy4S7f1VKnSs1g/i2PnV1ZIsCJv6zk+twR9QkgFRvV3?=
 =?iso-8859-1?Q?CWdmdo03zdQpAzwND0VAp22lChfe2EVChzSFV0g94+eYSrp04M8jmqoZyO?=
 =?iso-8859-1?Q?z8Mb4hQzKUyPDJfKaoEMrE1TVQTDVG7mMUNMlIfpkVU74CXaH7QabJcWJw?=
 =?iso-8859-1?Q?zUxH2lo14b8TZ1isTnLMSiQV3UUh0nkJgtoh0dYxWOzhBioYejy2CNGqh+?=
 =?iso-8859-1?Q?2z8gYbspTb09YDUXklbaJi9cRGo2Ghzko+xXLa3vAWtG03+ZBPJSONre6z?=
 =?iso-8859-1?Q?y7VP1qcsUkyd67Ivoaf8S43H5or9uUzWh7S+4GsFdS8IN3V/9D9kdWByJU?=
 =?iso-8859-1?Q?T8N0qlkfFojDWmAm9ZMndJIWj8mtUePsyelN1Vh0mbG5pjGwq88LfVDj7O?=
 =?iso-8859-1?Q?tgPvibAIT0LW955Haix1+t3SRB1tEOlBTd5NI0CuFzQuYxYq9oZ6jR9ifd?=
 =?iso-8859-1?Q?F/2Zhc+OxfJVT9EAqAAs4UgVOH4LWBpzg/LqT2Z+W3eh7wItVERWtCWscY?=
 =?iso-8859-1?Q?fb1SJTMrAJxuh47EGkUTX0pcvVzl3rhj6fE0aJ03mW5ETrJtApm0Bym8oo?=
 =?iso-8859-1?Q?h+QKd5bLSYefa9GTNYtP6HwTad7sFPYJz257aEvh1vvJ2xwkRXO/C/CcvR?=
 =?iso-8859-1?Q?DsJYP412iTT17srH2pPTg//YTtr2Cq8Wgy4d8q1oii+XUsVAvctowYRtrQ?=
 =?iso-8859-1?Q?hx9+CF86LVCdxk/1Gg0JQqKv0z2+UC2ZAlNk8sMEerXsOqNkodYRYgRnqt?=
 =?iso-8859-1?Q?smD4tLcHQhOun2hCLxHPa9dbTY6mCvVyqrbFmsCQn1bIgpXuZkWVT9ilcg?=
 =?iso-8859-1?Q?QXKwZFD1xKp8IIFmcJcIeRZE7Dhm/Ic12uo+FNEdjpOY85akoqVfHOzfil?=
 =?iso-8859-1?Q?PrOlbvB2F7gmgKdTMuhZ8GH7GRdCgZxnog?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 136d462e-9394-4847-6a99-08dc1b86ce54
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2024 20:14:58.2889 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sN7olNTcpl1c5XyejXirStM8zrHm4Kk7HAx4WdPZsMGU3V3u+FgZ3GTUp1WXIOkgUmWpz0BIY5i6Xg+dL/aqMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7375
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
Cc: Maarten Lankhorst <dev@lankhorst.se>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Jan 22, 2024 at 09:04:44AM -0800, José Roberto de Souza wrote:
> This makes easier to use those registers when copying its values to
> calculator also makes easier for tools to parse it.
> 
> To avoids padding holes in xe_hw_engine_snapshot the u64 variables
> were moved to the top of xe_hw_engine_snapshot.reg.
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Maarten Lankhorst <dev@lankhorst.se>
> Signed-off-by: José Roberto de Souza <jose.souza@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_hw_engine.c       | 69 ++++++++++++-------------
>  drivers/gpu/drm/xe/xe_hw_engine_types.h | 30 ++++-------
>  2 files changed, 42 insertions(+), 57 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 3aaab507f37fe..9fc30ecec0a26 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -749,6 +749,7 @@ struct xe_hw_engine_snapshot *
>  xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
>  {
>  	struct xe_hw_engine_snapshot *snapshot;
> +	u64 val;
>  
>  	if (!xe_hw_engine_is_valid(hwe))
>  		return NULL;
> @@ -766,19 +767,31 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
>  						    hwe->domain);
>  	snapshot->mmio_base = hwe->mmio_base;
>  
> -	snapshot->reg.ring_hwstam = hw_engine_mmio_read32(hwe, RING_HWSTAM(0));
> -	snapshot->reg.ring_hws_pga = hw_engine_mmio_read32(hwe,
> -							   RING_HWS_PGA(0));
> -	snapshot->reg.ring_execlist_status_lo =
> +	snapshot->reg.ring_execlist_status =
>  		hw_engine_mmio_read32(hwe, RING_EXECLIST_STATUS_LO(0));
> -	snapshot->reg.ring_execlist_status_hi =
> -		hw_engine_mmio_read32(hwe, RING_EXECLIST_STATUS_HI(0));
> -	snapshot->reg.ring_execlist_sq_contents_lo =
> -		hw_engine_mmio_read32(hwe,
> -				      RING_EXECLIST_SQ_CONTENTS_LO(0));
> -	snapshot->reg.ring_execlist_sq_contents_hi =
> -		hw_engine_mmio_read32(hwe,
> -				      RING_EXECLIST_SQ_CONTENTS_HI(0));
> +	val = hw_engine_mmio_read32(hwe, RING_EXECLIST_STATUS_HI(0));
> +	snapshot->reg.ring_execlist_status |= val << 32;
> +
> +	snapshot->reg.ring_execlist_sq_contents =
> +		hw_engine_mmio_read32(hwe, RING_EXECLIST_SQ_CONTENTS_LO(0));
> +	val = hw_engine_mmio_read32(hwe, RING_EXECLIST_SQ_CONTENTS_HI(0));
> +	snapshot->reg.ring_execlist_sq_contents |= val << 32;
> +
> +	snapshot->reg.ring_acthd = hw_engine_mmio_read32(hwe, RING_ACTHD(0));
> +	val = hw_engine_mmio_read32(hwe, RING_ACTHD_UDW(0));
> +	snapshot->reg.ring_acthd |= val << 32;
> +
> +	snapshot->reg.ring_bbaddr = hw_engine_mmio_read32(hwe, RING_BBADDR(0));
> +	val = hw_engine_mmio_read32(hwe, RING_BBADDR_UDW(0));
> +	snapshot->reg.ring_bbaddr |= val << 32;
> +
> +	snapshot->reg.ring_dma_fadd =
> +		hw_engine_mmio_read32(hwe, RING_DMA_FADD(0));
> +	val = hw_engine_mmio_read32(hwe, RING_DMA_FADD_UDW(0));
> +	snapshot->reg.ring_dma_fadd |= val << 32;
> +
> +	snapshot->reg.ring_hwstam = hw_engine_mmio_read32(hwe, RING_HWSTAM(0));
> +	snapshot->reg.ring_hws_pga = hw_engine_mmio_read32(hwe, RING_HWS_PGA(0));
>  	snapshot->reg.ring_start = hw_engine_mmio_read32(hwe, RING_START(0));
>  	snapshot->reg.ring_head =
>  		hw_engine_mmio_read32(hwe, RING_HEAD(0)) & HEAD_ADDR;
> @@ -792,16 +805,6 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
>  	snapshot->reg.ring_esr = hw_engine_mmio_read32(hwe, RING_ESR(0));
>  	snapshot->reg.ring_emr = hw_engine_mmio_read32(hwe, RING_EMR(0));
>  	snapshot->reg.ring_eir = hw_engine_mmio_read32(hwe, RING_EIR(0));
> -	snapshot->reg.ring_acthd_udw =
> -		hw_engine_mmio_read32(hwe, RING_ACTHD_UDW(0));
> -	snapshot->reg.ring_acthd = hw_engine_mmio_read32(hwe, RING_ACTHD(0));
> -	snapshot->reg.ring_bbaddr_udw =
> -		hw_engine_mmio_read32(hwe, RING_BBADDR_UDW(0));
> -	snapshot->reg.ring_bbaddr = hw_engine_mmio_read32(hwe, RING_BBADDR(0));
> -	snapshot->reg.ring_dma_fadd_udw =
> -		hw_engine_mmio_read32(hwe, RING_DMA_FADD_UDW(0));
> -	snapshot->reg.ring_dma_fadd =
> -		hw_engine_mmio_read32(hwe, RING_DMA_FADD(0));
>  	snapshot->reg.ipehr = hw_engine_mmio_read32(hwe, RING_IPEHR(0));
>  
>  	if (snapshot->class == XE_ENGINE_CLASS_COMPUTE)
> @@ -830,14 +833,10 @@ void xe_hw_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot,
>  		   snapshot->forcewake.domain, snapshot->forcewake.ref);
>  	drm_printf(p, "\tHWSTAM: 0x%08x\n", snapshot->reg.ring_hwstam);
>  	drm_printf(p, "\tRING_HWS_PGA: 0x%08x\n", snapshot->reg.ring_hws_pga);
> -	drm_printf(p, "\tRING_EXECLIST_STATUS_LO: 0x%08x\n",
> -		   snapshot->reg.ring_execlist_status_lo);
> -	drm_printf(p, "\tRING_EXECLIST_STATUS_HI: 0x%08x\n",
> -		   snapshot->reg.ring_execlist_status_hi);
> -	drm_printf(p, "\tRING_EXECLIST_SQ_CONTENTS_LO: 0x%08x\n",
> -		   snapshot->reg.ring_execlist_sq_contents_lo);
> -	drm_printf(p, "\tRING_EXECLIST_SQ_CONTENTS_HI: 0x%08x\n",
> -		   snapshot->reg.ring_execlist_sq_contents_hi);
> +	drm_printf(p, "\tRING_EXECLIST_STATUS: 0x%016llx\n",
> +		   snapshot->reg.ring_execlist_status);
> +	drm_printf(p, "\tRING_EXECLIST_SQ_CONTENTS: 0x%016llx\n",
> +		   snapshot->reg.ring_execlist_sq_contents);
>  	drm_printf(p, "\tRING_START: 0x%08x\n", snapshot->reg.ring_start);
>  	drm_printf(p, "\tRING_HEAD:  0x%08x\n", snapshot->reg.ring_head);
>  	drm_printf(p, "\tRING_TAIL:  0x%08x\n", snapshot->reg.ring_tail);
> @@ -849,13 +848,9 @@ void xe_hw_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot,
>  	drm_printf(p, "\tRING_ESR:   0x%08x\n", snapshot->reg.ring_esr);
>  	drm_printf(p, "\tRING_EMR:   0x%08x\n", snapshot->reg.ring_emr);
>  	drm_printf(p, "\tRING_EIR:   0x%08x\n", snapshot->reg.ring_eir);
> -	drm_printf(p, "\tACTHD:  0x%08x_%08x\n", snapshot->reg.ring_acthd_udw,
> -		   snapshot->reg.ring_acthd);
> -	drm_printf(p, "\tBBADDR: 0x%08x_%08x\n", snapshot->reg.ring_bbaddr_udw,
> -		   snapshot->reg.ring_bbaddr);
> -	drm_printf(p, "\tDMA_FADDR: 0x%08x_%08x\n",
> -		   snapshot->reg.ring_dma_fadd_udw,
> -		   snapshot->reg.ring_dma_fadd);
> +	drm_printf(p, "\tACTHD:  0x%016llx\n", snapshot->reg.ring_acthd);
> +	drm_printf(p, "\tBBADDR: 0x%016llx\n", snapshot->reg.ring_bbaddr);
> +	drm_printf(p, "\tDMA_FADDR: 0x%016llx\n", snapshot->reg.ring_dma_fadd);
>  	drm_printf(p, "\tIPEHR: 0x%08x\n\n", snapshot->reg.ipehr);
>  	if (snapshot->class == XE_ENGINE_CLASS_COMPUTE)
>  		drm_printf(p, "\tRCU_MODE: 0x%08x\n",
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> index dfeaaac08b7f9..d55c25fbf1371 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> @@ -173,18 +173,20 @@ struct xe_hw_engine_snapshot {
>  	u32 mmio_base;
>  	/** @reg: Useful MMIO register snapshot */
>  	struct {
> +		/** @ring_execlist_status: RING_EXECLIST_STATUS */
> +		u64 ring_execlist_status;
> +		/** @ring_execlist_sq_contents: RING_EXECLIST_SQ_CONTENTS */
> +		u64 ring_execlist_sq_contents;
> +		/** @ring_acthd: RING_ACTHD */
> +		u64 ring_acthd;
> +		/** @ring_bbaddr: RING_BBADDR */
> +		u64 ring_bbaddr;
> +		/** @ring_dma_fadd: RING_DMA_FADD */
> +		u64 ring_dma_fadd;
>  		/** @ring_hwstam: RING_HWSTAM */
>  		u32 ring_hwstam;
>  		/** @ring_hws_pga: RING_HWS_PGA */
>  		u32 ring_hws_pga;
> -		/** @ring_execlist_status_lo: RING_EXECLIST_STATUS_LO */
> -		u32 ring_execlist_status_lo;
> -		/** @ring_execlist_status_hi: RING_EXECLIST_STATUS_HI */
> -		u32 ring_execlist_status_hi;
> -		/** @ring_execlist_sq_contents_lo: RING_EXECLIST_SQ_CONTENTS */
> -		u32 ring_execlist_sq_contents_lo;
> -		/** @ring_execlist_sq_contents_hi: RING_EXECLIST_SQ_CONTENTS + 4 */
> -		u32 ring_execlist_sq_contents_hi;
>  		/** @ring_start: RING_START */
>  		u32 ring_start;
>  		/** @ring_head: RING_HEAD */
> @@ -205,18 +207,6 @@ struct xe_hw_engine_snapshot {
>  		u32 ring_emr;
>  		/** @ring_eir: RING_EIR */
>  		u32 ring_eir;
> -		/** @ring_acthd_udw: RING_ACTHD_UDW */
> -		u32 ring_acthd_udw;
> -		/** @ring_acthd: RING_ACTHD */
> -		u32 ring_acthd;
> -		/** @ring_bbaddr_udw: RING_BBADDR_UDW */
> -		u32 ring_bbaddr_udw;
> -		/** @ring_bbaddr: RING_BBADDR */
> -		u32 ring_bbaddr;
> -		/** @ring_dma_fadd_udw: RING_DMA_FADD_UDW */
> -		u32 ring_dma_fadd_udw;
> -		/** @ring_dma_fadd: RING_DMA_FADD */
> -		u32 ring_dma_fadd;
>  		/** @ipehr: IPEHR */
>  		u32 ipehr;
>  		/** @rcu_mode: RCU_MODE */
> -- 
> 2.43.0
> 
