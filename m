Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97AF7C77B7C
	for <intel-xe@archiver.kernel.org>; Tue,  9 May 2023 14:45:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B43D10E386;
	Tue,  9 May 2023 14:45:38 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6A0910E386
 for <intel-xe@lists.freedesktop.org>; Tue,  9 May 2023 14:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683643535; x=1715179535;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=DiDP4ifvywC9BZjb0r1dzLe3cfY9DqqnfKzb/ze2sf8=;
 b=YiBZn/3wfltSq6Il2knOv5LGj6w1A8k/wy/jwoglVsLHdAV2fhaaWAqB
 lHb2SXgJmUnovX9Zzxh2fCNq4iRGcRGH6+N4DdRDGS6ze41ijXS3xDCG5
 UEPaIB8FNzSKsWyUjl6kvOfOFJgkVA7baeUmQKzjcyxUlKP7BHmWKyJVG
 YnW8nYPd+iiZAd9SfvCAmTSL5/Yy0FWiHwdcKksTuJMW6ZnZkoEEVTCa1
 3//N/RuTRjEyxnRqYGi5x6rzBAfNB/o3iWwqbSB5RNP+f14haMUXTBztV
 ZmLiKMXWt97HzX8hA3hupFkIiMWLPMg68bOlC1gs1OsQYv2v32nc6FXLL g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="436262951"
X-IronPort-AV: E=Sophos;i="5.99,262,1677571200"; d="scan'208";a="436262951"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2023 07:45:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="676490406"
X-IronPort-AV: E=Sophos;i="5.99,262,1677571200"; d="scan'208";a="676490406"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga006.jf.intel.com with ESMTP; 09 May 2023 07:45:34 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 9 May 2023 07:45:34 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 9 May 2023 07:45:34 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 9 May 2023 07:45:34 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 9 May 2023 07:45:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b4IP0wrjuM+JTlogVKoAzbNZYSoA76iJq+39+YcSqRcvY3K1mCaRFYuxQaukYXw5oY97aF+cFx42Yx30Wfv7opBEmoJsMKB7I/ps8X9wOt30C58+NUKsSw0mK2/XnKOUjNgKOx5w4QaUn/qU6Gym6lxy08s2zkUv/wo6/bs2BqQgVA2fZ3oTlShqGq1hIzWOyijeEr6WiswIujAa1R38aeQg8NjInu5pRSQPlb46yyfPOK9AZ6/1XY8qhAxmvxsMq4Ju0iQypUhWoZCoFaSq/WhAfEsdueFgWIVtDNLM4IlCA+oYA38UBhGOAsJ0EhSYYYV/6kaSuP7lhwVvdkdd5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pT8Ombl9AdRvDzjninhUqQ0lI5FMS0FnOCPs2fUuIFs=;
 b=IQTUPDKUFchj9QnR8pUDuUW8VEasdkzXsSOt4MaSm4uzDv9rCHbprRT6aP98P0vPbINu1VIIQ+QzhrZmW/aNd9lKCJdQ6NB2PGliyNtzE+Udc3MJGqjtN9vxPwfimMzDUZQfNaj2tU23FzEh2KIeOGOYckP63uwFaFWWq1YKcKeD0bvqERuOii+xDmx+YzWGaadyq+sEpir3+1NT+uOTggzhRITvYczNyPca/DDO74U0wNuoq+iPwgkQFjRgNugOJyUiqifETorTTbsR5a1o3pg+AKScVFBY/wtJeZ53hJLetT5sFrxiwqtW7186e8YjoF8tOFfq9lbMD6h8Ihm7Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH3PR11MB7723.namprd11.prod.outlook.com (2603:10b6:610:127::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Tue, 9 May
 2023 14:45:32 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004%6]) with mapi id 15.20.6363.032; Tue, 9 May 2023
 14:45:32 +0000
Date: Tue, 9 May 2023 10:45:21 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <ZFpcgRA0y3Jy0HpL@intel.com>
References: <20230502001727.3211096-1-matthew.brost@intel.com>
 <20230502001727.3211096-27-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230502001727.3211096-27-matthew.brost@intel.com>
X-ClientProxiedBy: BYAPR08CA0072.namprd08.prod.outlook.com
 (2603:10b6:a03:117::49) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH3PR11MB7723:EE_
X-MS-Office365-Filtering-Correlation-Id: 27d5175c-ce14-40a2-af78-08db509c0a62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JcY72vEBXYElGcHsb2qEx04YqwdIjftAM+lZ1JiS3Z4ZpNWZNKCCz5cK0zPKk8qxjxQF5B1OysoGroJFA0W1qV301bIBRV8rCR9Oah0j5nva1wgZGOjvV+uOI6GVzF08uuH2j0QLTI0EDK7sl5dF05JLGcJAZwgf2kkC/dyLUko/Lya781qhGuOr/cHqlfdy8EVTcUg03ATJcGbgQ1kw8sMRswMNe3FdT6H9fZw8Tu7vkAOCTKFxE9hC/7z7hCbMGh6sgTjk+lpaeVwh72UqonI+Y06ZAhUYQn8RGoZMhnaR3i20ZAMojvBlwOgNaqXXCyJrn4wiPQdH9AtmRGNacKS/3fkK0al8PcKfH6uIl2mMXSqBq9E4sWjCPRg8kYcQAEXHAX5lzF2Xe+faX6YZY/+SpTWhrkHgnvegnZojqIKC/Ne3JazOW2z/xEO9YWiImNkASZ2HkKEbPeDHE//GEjjh4l/q4ieK3/UPyEYzgTH/xySVkBAYPAhGY3wx1HT1h8hq4LHkSji4axFwsmX5n8H1nckjdAXL1HsAZu00gGUdU+DtgHLs5gQsR8iidC7C
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(396003)(136003)(346002)(366004)(376002)(451199021)(83380400001)(2616005)(186003)(2906002)(36756003)(38100700002)(86362001)(82960400001)(5660300002)(8676002)(6862004)(8936002)(44832011)(66946007)(66556008)(6636002)(66476007)(478600001)(4326008)(6486002)(41300700001)(316002)(6666004)(6506007)(26005)(37006003)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZKYqKE/hsCC0Kro4CAJTiYUl9jYo9n+nbIircmaHiipcrnroIN/qYY3BJ6mQ?=
 =?us-ascii?Q?fjKV/27Nr0RoPk5Xr0RujX3a88xdSe3cKu9eZqjk48Ip39YJ4PSNUDj39CaV?=
 =?us-ascii?Q?McnS5HLRltmRsw98fhmpzRS2hoHv8QYXdWoOSLd5f8utQJia86StraLBDOGp?=
 =?us-ascii?Q?eEy9ExLQFDY+xwDiV5ZZPHKiJQLY+TA8KNEK59q0wijKVO4mdeneE126cEgR?=
 =?us-ascii?Q?sxb4HYYZFh3PxqbO2GlMI4ijOpKsvJtyVysrQGqid1doDpGGPmKKj8WiKErV?=
 =?us-ascii?Q?x5AitIWQBtqHUABrj7268Ie/XC8xagxy8bPTS/b1fcYpLQLaFjtuRCiCDhLV?=
 =?us-ascii?Q?YO288gAY1NmVpnP9adEa+zAocCu69GEIrjY1lPVLq1sRc+u6T6reBK/ucnFP?=
 =?us-ascii?Q?vPIZETbjLTgh6QSUOngrK8rVpPtYO1fMLvYHF7gufAMzUceza3/GyenP2wVj?=
 =?us-ascii?Q?sCBnqk5TQVvEmRUsPCARh9TpE/2lqjpJ3A6K1kpvuiv/AgNlhsLHnT7kNdBy?=
 =?us-ascii?Q?esHj9+8Cdvc0Jhg5Fc89/EEkZrMOYDFl2au7sNvUHhCqSHz00glwVyl78Cjc?=
 =?us-ascii?Q?dmSwETOcU01hmPRghFSSbDRJ4pb2wQC00hN+AhWygM3+oZq597eFbSy7tAuB?=
 =?us-ascii?Q?KhYg5mkjrFcLRLAODl9+aqMj14fAcGhfEYHZPpUSjZu7M5+4rz34tpKupV7t?=
 =?us-ascii?Q?7vtbor/4W7CbRDNMQ4nt2PFDd5SGqDZP8WPN1ip7SPksZ1z919mKOgjn1g1h?=
 =?us-ascii?Q?65ZrgREAaAIYrOp7KaCwU1IKXAX/MY7Jwg92lAIYyNmQzuT5PCA3zC+by1u5?=
 =?us-ascii?Q?JFKDIEcT3aGic8YdU50UnO315OlbZR+OgLuVB/N2S4119drc1qD+Z3nUok9o?=
 =?us-ascii?Q?tHFGrYcxD5y98YdYzkXc/R8ovef6Nh2+EdiB5D6x33YOJ5pH9IGO4OKCGXe0?=
 =?us-ascii?Q?I58BGTFHrhCFf+LpzprIumPwIqCAx8+svC5gXoqt0kysJwuPf2QT4zXMUQ7I?=
 =?us-ascii?Q?6dHtNc44XpDykSQ+Z0gmqOfCviAAxhQ8T29vyAbNXTYFlzhK+oTlIXo0hSge?=
 =?us-ascii?Q?7gFfOn5CI2Xt2CXic4c/HG3NunwWKqN8QbLCQT+wtxAP5nYPku4eCOfTIHuZ?=
 =?us-ascii?Q?kuQ6GQ3uqBVKvclCIEnIIez0bmcXTnnI68mvDGtZ9Bh9Xc79bmK6zi9oIoT2?=
 =?us-ascii?Q?D08+Kyu4cq8Lp7/iNJTpyq5kV5E2yRBhMinAXL9ftHfPkk1dTF77xKydGaGJ?=
 =?us-ascii?Q?1cXZwDqcrt900cUlXBCQXO5IwonYNNCFOeQVV/inLJbL1O8oCIGf7DA2I6RW?=
 =?us-ascii?Q?gwh5qVMpGUysqC+6lx8fql0ni/43oCos0BNdeJV5DreC+T8FCXQ5XXwBO2Y0?=
 =?us-ascii?Q?OeQDDYxOr0Ro1Tddm3I7XKDKbAY74oj++56RAz3mv44aIrlrv7wdtKqTZnW3?=
 =?us-ascii?Q?JSUJR0c6BXtg6JyE6h6SAySUmd2zt4KDZ2QkGEci+aLInzyGWZqsJebMfApD?=
 =?us-ascii?Q?Jp/XqB/lOjQM9Sm6yczH90c3mPI3HZAXOWMYUc5jBAU13uoUHYMAgMb920Ox?=
 =?us-ascii?Q?iPGPR/7uzT+SJeHueh/MEfffigs1EqQBGE+KfN5Q?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 27d5175c-ce14-40a2-af78-08db509c0a62
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2023 14:45:32.5404 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zG6fh/sDT0whu6FRCwSMa8jCeqMQ1hRvUDns+XmTdbwa5ICZpEP8w1MWgnplh+E+qjx4l0Z2zKrZUIVOoJy93Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7723
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 26/31] drm/exec: Always compile drm_exec
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
Cc: Danilo Krummrich <dakr@redhat.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, May 01, 2023 at 05:17:22PM -0700, Matthew Brost wrote:
> We want some helpers for DRM exec in gpuva, alway compile this.
> 
> Suggested-by: Danilo Krummrich <dakr@redhat.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/Makefile | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index ab728632d8a2..40067970af04 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -23,6 +23,7 @@ drm-y := \
>  	drm_dumb_buffers.o \
>  	drm_edid.o \
>  	drm_encoder.o \
> +	drm_exec.o \
>  	drm_file.o \
>  	drm_fourcc.o \
>  	drm_framebuffer.o \
> @@ -81,8 +82,6 @@ obj-$(CONFIG_DRM_PANEL_ORIENTATION_QUIRKS) += drm_panel_orientation_quirks.o
>  # Memory-management helpers
>  #
>  #
> -obj-$(CONFIG_DRM_EXEC) += drm_exec.o

shouldn't this kill this kconfig entirely then?
Or should the helpers be split into some other common file?

> -
>  obj-$(CONFIG_DRM_BUDDY) += drm_buddy.o
>  
>  drm_dma_helper-y := drm_gem_dma_helper.o
> -- 
> 2.34.1
> 
