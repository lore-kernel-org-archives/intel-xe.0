Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1726CDB46E
	for <intel-xe@archiver.kernel.org>; Thu, 12 Oct 2023 17:51:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ABC710E51E;
	Thu, 12 Oct 2023 17:51:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B01710E579
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Oct 2023 17:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697133103; x=1728669103;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=UtqsVHH5AIDUP+EXOJJlwym/Uiz1Y1p6Wvg68hntxbI=;
 b=dIDD6zAADotkP9P3MV01a+VLNv8zlIND/ji/K1+frblXEYtoIsTAGsPF
 tKkNa9hd/eZukaLGrZ8cul+TnCo2/mIj5PZ6UNXvsYNcnEsMBUsC+a43k
 dwuaV/xjWk7iCgsJ9ybRKdaotKgRj73BA8iJ0YKiBdbOxSn1zlpoi1uNy
 NP1LS1hU/z84RWYxcrtWo/jCrbDsycyJzuFB54LOzakTdTONk3jmvE4ZO
 bxfpQ014TbapXYNUyONfIpDW9njZvwZhjNEqI7QpCmapayKjYmzB8nZ5r
 7qULfr++9lMmW7DZAIvKPp1ygllota2KBAAQET2gOq/wrSEVf6eGXLVq8 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="384839908"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; d="scan'208";a="384839908"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 10:46:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="704271241"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; d="scan'208";a="704271241"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Oct 2023 10:46:22 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 12 Oct 2023 10:46:21 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 12 Oct 2023 10:46:20 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 12 Oct 2023 10:46:20 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 12 Oct 2023 10:46:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BC4dCB6TDwU3+T2HV69ZqWVXt2uXjdWjI3Nhfh8X+n0M5MxCTtX5uGdp9JdijMDapUgwVNvl28BA32cPCszLHqbhQWry0/pH0M7nvXe8S1KtZHvHJouRLtBlNuG31MIig7ZT/rYFB6K9uyCqklqZWIeDGHZwN7dRUmKFxVuSvQFFk9by1qNY0EmEKhaexJ0kHKCsMJR2HkkbUjg1LWhwyZdUcedgK+quw/p2QCxTtVDrvpcyVWnHhaBOLROqZr0/FGRra6z/cEP8C5tAqgrGOO6dMdePbVTpz4Mn2Nu6MkTC3ddymAimQqUaEsIm63BXoA5IY+igk1XWDBduFBlDww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DuqEme0MZDXLn7YOGuEKOs65MEEN6WslR/+1GE+hsWk=;
 b=VbtBC5/PxDLg2NopGzbGksCYK38RMLKVtgtrnJcFyZI8URzJoiQCrgG4YqGvi1fI3D8CxdMqgH0whxZX+I093BjbS4RtxmWyBJT5yMWO/wkbPyERykCFzjyQDQDItGuo2v3VtC/p2pjQbgagXtcGCi33R8Fl3YcoDiQtIXxU8sGbgTlOAjlQH+nm03akFGR3WWsjQ/a46QijfAAmxTud5442qjV22tYJKotkcQFA0goKbrs4Z9QAcgXwb6CxGgJsvYDjXDyGD+UyZ7FBr/akQDyR9BPNHukaBrjxKWlQ8tEkj0uzobnJPyVHyUQAU4OcL6z/PiiY3Nm2wZ7c1V3rNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 LV2PR11MB6024.namprd11.prod.outlook.com (2603:10b6:408:17a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Thu, 12 Oct
 2023 17:46:18 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::f957:c15a:9c34:71db]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::f957:c15a:9c34:71db%3]) with mapi id 15.20.6863.043; Thu, 12 Oct 2023
 17:46:18 +0000
Date: Thu, 12 Oct 2023 10:46:16 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>
Message-ID: <20231012174616.GK21382@mdroper-desk1.amr.corp.intel.com>
References: <20231010184151.91195-1-jose.souza@intel.com>
 <20231010184151.91195-3-jose.souza@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231010184151.91195-3-jose.souza@intel.com>
X-ClientProxiedBy: BY5PR17CA0053.namprd17.prod.outlook.com
 (2603:10b6:a03:167::30) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|LV2PR11MB6024:EE_
X-MS-Office365-Filtering-Correlation-Id: 06c4e422-73bc-44fa-eba7-08dbcb4b236c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xhRVg3suMrB50rzFaU2DC9FePZ5kCFIy8APNx2Qx1H4yuQxjIO0U2KI5QQw8aBPXK2qnefqpE+vCQCP1b6gxKOJip+PdmwoStnPp/fiGOVrNFiqjgjIc/lytZSnY+0cS7kUGcFNh268TCkbF8Ppo/mCezJFX9xzp3kvJYN7lliIhTo6ZuAQC7AmxcQFyNNjqzEMIy2IpSoqo/+jfjoXAJFG8bcAfHdAQ7J8ctiP+aANlf1INa3E1BE6IYv6h5NGkR6tvaOP9ZJV0pbeWvFkanxO61zUvGfg/ztFeCbgu/cWnh4nGaxHm9tIuNGyVv+ThS2Gu8GalfcN3zIMKYa8Gkdss0ZyrQzetS6qlt5diFGJTYMDCVnOHbMIDvafNSetWlGv1+oYDJT4T4p4cD+7y+cnNVLfiNKjHf4RKLk7R0dbLJVjwRe4HMqFiM4sjh+A1svmNDlc/+jBtR1idC+hlEFjCDhEm3YRwOI9IeZf9+DfgiMDRUFDy+Eanr10P4lEYHgxyU15jTl13Cx31J93hLhxz6YAANiaQUGdY7TMoFCDb7H35DDiEWtvXKnXZzCtB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(366004)(346002)(39860400002)(136003)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(33656002)(82960400001)(86362001)(38100700002)(2906002)(6512007)(41300700001)(8676002)(6486002)(478600001)(8936002)(5660300002)(6862004)(66946007)(6506007)(4326008)(107886003)(6636002)(1076003)(66556008)(66476007)(316002)(83380400001)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?EDIbhe24v7GVO4dIPGrf2CyYI6dxZzIxQyoVG40pnsEl1nR+6eBvnJMioW?=
 =?iso-8859-1?Q?8hUu+wyIM5qDkTABrP7fBcMkiWaPZsd6426t/R0guNAx+oKJfM/zTl3dpx?=
 =?iso-8859-1?Q?mrZfEhY/1fp8vdbWT1HdGA8dBWbWIR2FtEUGfVOV4c3GX7H071ji5WPa6q?=
 =?iso-8859-1?Q?/8OoFJs276ZuDe7NkWsAbUVmSmkY/KrkvdF0fAd+ggyneiVgBdjvCKRbVC?=
 =?iso-8859-1?Q?hMuWaBy+A5cTVsrjSWK0+bN6K5I8cAEFyxM/TteFu2a3RmkTEaCer+vH+v?=
 =?iso-8859-1?Q?52ZT5JbnaMtYl3NXtl41mb0Q43FZRRubhQBNprDiehaOXwuHxRNVd3VNNL?=
 =?iso-8859-1?Q?uLL5JdmdfedkO4DVDVNCNovCh9z/FgUY+Ngyr2YJBl5/tcbJDsHnvlE1u1?=
 =?iso-8859-1?Q?oxvu7Hnkp8pDr+5qPQxkRRlyabNPqJYyg/uGUp8Mq2P2Jdvpa/neL9Zwi+?=
 =?iso-8859-1?Q?Tv562lMuEVSsqdnwnpb+lAtIiD4KDYdpTwrLv4JZ8pXTG0NgyBubqhOBM1?=
 =?iso-8859-1?Q?fvVtOkP1hq5hDdrMrIsThwHTWgser+V+AhdVeBfnd4xBaCsTUZ5wLXNZ1v?=
 =?iso-8859-1?Q?COd1zNhSgKFhQMCMWjUlIm/8+Zg9orpkvICnC1Nr+FU4S77umKLE6xlD4e?=
 =?iso-8859-1?Q?ZffUiGiiC9m5fSchK4Y3hi5goqE5YNb2+pYFwthlg2nA6SjwtLsZ2TWF0X?=
 =?iso-8859-1?Q?xnBrVnWCDjEHvy+IHKEoYjI+4UnsiAJBSfEsKkuApaM3439UWU9/XdT6V9?=
 =?iso-8859-1?Q?j/8ypzS1vzCvhalGRYiA79SDydYlliZZNQraIRx+f9wS0cEaCvprxTKt6L?=
 =?iso-8859-1?Q?eC6gcxOwYEBtShSK8AH+0yOLv1Nw5HeafHXgn1VK0vdCNfMVCC8nS4canW?=
 =?iso-8859-1?Q?sqrcIRfuEDojeHuAcdYwPYWKGyMDDoca9djZhqexh38Kicx4g/SeD/Vcfv?=
 =?iso-8859-1?Q?GvDwegwuPEQWeMiXRoXQpC8+spdDtxe3VZCMt5keIV3f3+oPt6FsdCQqPg?=
 =?iso-8859-1?Q?H7QHDOlEPLj2sMAMxLRwZmNVdYTef/sUh/CeGpN94j5/a5yJp1RODw56IV?=
 =?iso-8859-1?Q?IrkwxNL08p2HMwqiC/ejAqK4GnVjgGOgoJBkB/4OHUIwzPnXoyvtvrVokl?=
 =?iso-8859-1?Q?4Cm0tkNehKYmK89gSguYO/axAoxm3KAU7a339cZ/+YwE7EIIcUOMzGAGaf?=
 =?iso-8859-1?Q?0VK9zj9whv5uZCvFaTVq4J5oKkhLNO/WtPRlT+fC1ZVZE92zWBUXlVaZaE?=
 =?iso-8859-1?Q?TPyintiuF0gCfSk+SqaGBybPc1WvmttZn5SWp4OUyx6qagPfeEXokxePxP?=
 =?iso-8859-1?Q?wMnoPbO5KZkgTCB64Hl4N754Xsp27JBRolBCdvAJfyDVG4KpfFP3bfoU6J?=
 =?iso-8859-1?Q?6mp2qO/BRYYXiJ6G35HC09ZogPmLv8qH/CVIt42J6PyUMuOLcMXlonrJuJ?=
 =?iso-8859-1?Q?nJue0kdGptBUI/aowhcUr0HtkBKi6fe+VwLEkV7A/lLDRqtNReNqr05NJY?=
 =?iso-8859-1?Q?lbjdoOgss14hPl72+5mNYZsg0nmsGlkazsvYJ9/fJ7zOl+6SQ+MAKXHYyx?=
 =?iso-8859-1?Q?A86FgVKlwAgkaE0/A51MNNtOpaZPIqoxJYQV9r1o0+2tDSK1fvkVFdRUAf?=
 =?iso-8859-1?Q?V8pW8une7P0Y+vHTNXJ8ZBzbUx4i3jjpwGdWrxx/6T3eKv7D/rEnoGWg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 06c4e422-73bc-44fa-eba7-08dbcb4b236c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2023 17:46:18.2198 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QV9gFcgBhFcRT9M/FMyJo/MW4KGKzRDUCVk2fqNaYbUYQDX5qp1YHyhxhs6ndz6Bm3A6gB9/awUhWFN663/TFBjFlMd7yngoalUIUfcFdpw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6024
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 3/3] drm/xe: Add INSTDONE registers to
 devcoredump
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Oct 10, 2023 at 11:41:51AM -0700, José Roberto de Souza wrote:
> This registers contains important information that can help with debug
> of GPU hangs.
> 
> While at it also fixing the double line jump at the end of engine
> registers for CCS engines.
> 
> v2:
> - print other INSTDONE registers
> 
> v3:
> - add for_each_geometry/compute_dss()
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_engine_regs.h |   1 +
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h     |   9 ++
>  drivers/gpu/drm/xe/xe_hw_engine.c        | 100 ++++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_hw_engine_types.h  |  10 +++
>  4 files changed, 117 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> index 35dd4837dd75f..32465e384fc24 100644
> --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> @@ -32,6 +32,7 @@
>  #define RING_ACTHD_UDW(base)			XE_REG((base) + 0x5c)
>  #define RING_DMA_FADD_UDW(base)			XE_REG((base) + 0x60)
>  #define RING_IPEHR(base)			XE_REG((base) + 0x68)
> +#define RING_INSTDONE(base)			XE_REG((base) + 0x6c)
>  #define RING_ACTHD(base)			XE_REG((base) + 0x74)
>  #define RING_DMA_FADD(base)			XE_REG((base) + 0x78)
>  #define RING_HWS_PGA(base)			XE_REG((base) + 0x80)
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index cd1821d96a5d8..c6650124ae6a6 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -105,6 +105,8 @@
>  #define   FF_MODE2_TDS_TIMER_MASK		REG_GENMASK(23, 16)
>  #define   FF_MODE2_TDS_TIMER_128		REG_FIELD_PREP(FF_MODE2_TDS_TIMER_MASK, 4)
>  
> +#define XEHPG_INSTDONE_GEOM_SVG			XE_REG_MCR(0x666c)
> +
>  #define CACHE_MODE_1				XE_REG(0x7004, XE_REG_OPTION_MASKED)
>  #define   MSAA_OPTIMIZATION_REDUC_DISABLE	REG_BIT(11)
>  
> @@ -117,6 +119,10 @@
>  
>  #define COMMON_SLICE_CHICKEN1			XE_REG(0x7010)
>  
> +#define SLICE_COMMON_INSTDONE			XE_REG(0x7100)
> +#define SLICE_COMMON_INSTDONE_EXTRA		XE_REG(0x7104)
> +#define SLICE_COMMON_INSTDONE_EXTRA2		XE_REG(0x7108)

These three are MCR registers on Xe_HP and beyond (one instance per
gslice).


Matt

> +
>  #define COMMON_SLICE_CHICKEN4			XE_REG(0x7300, XE_REG_OPTION_MASKED)
>  #define   DISABLE_TDC_LOAD_BALANCING_CALC	REG_BIT(6)
>  
> @@ -299,6 +305,9 @@
>  #define XE_OAG_BLT_BUSY_FREE			XE_REG(0xdbbc)
>  #define XE_OAG_RENDER_BUSY_FREE			XE_REG(0xdbdc)
>  
> +#define SAMPLER_INSTDONE			XE_REG_MCR(0xe160)
> +#define ROW_INSTDONE				XE_REG_MCR(0xe164)
> +
>  #define SAMPLER_MODE				XE_REG_MCR(0xe18c, XE_REG_OPTION_MASKED)
>  #define   ENABLE_SMALLPL			REG_BIT(15)
>  #define   SC_DISABLE_POWER_OPTIMIZATION_EBB	REG_BIT(9)
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 37b3ee1268090..6e144859abb1a 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -16,6 +16,7 @@
>  #include "xe_execlist.h"
>  #include "xe_force_wake.h"
>  #include "xe_gt.h"
> +#include "xe_gt_mcr.h"
>  #include "xe_gt_topology.h"
>  #include "xe_hw_fence.h"
>  #include "xe_irq.h"
> @@ -655,6 +656,40 @@ void xe_hw_engine_handle_irq(struct xe_hw_engine *hwe, u16 intr_vec)
>  		xe_hw_fence_irq_run(hwe->fence_irq);
>  }
>  
> +static void
> +xe_he_engine_snapshot_instdone_capture(struct xe_hw_engine *hwe,
> +				       struct xe_hw_engine_snapshot *snapshot)
> +{
> +	struct xe_gt *gt = hwe->gt;
> +	struct xe_device *xe = gt_to_xe(gt);
> +	unsigned int dss;
> +	int group, instance;
> +
> +	snapshot->reg.instdone.ring = hw_engine_mmio_read32(hwe, RING_INSTDONE(0));
> +
> +	if (snapshot->hwe->class != XE_ENGINE_CLASS_RENDER)
> +		return;
> +
> +	snapshot->reg.instdone.slice_common =
> +		xe_mmio_read32(gt, SLICE_COMMON_INSTDONE);
> +	snapshot->reg.instdone.slice_common_extra =
> +		xe_mmio_read32(gt, SLICE_COMMON_INSTDONE_EXTRA);
> +	snapshot->reg.instdone.slice_common_extra2 =
> +		xe_mmio_read32(gt, SLICE_COMMON_INSTDONE_EXTRA2);
> +
> +	for_each_geometry_dss(gt, dss, group, instance) {
> +		snapshot->reg.instdone.sampler[dss] =
> +			xe_gt_mcr_unicast_read(gt, SAMPLER_INSTDONE, group, instance);
> +		snapshot->reg.instdone.row[dss] =
> +			xe_gt_mcr_unicast_read(gt, ROW_INSTDONE, group, instance);
> +
> +		if (GRAPHICS_VERx100(xe) >= 1255)
> +			snapshot->reg.instdone.geom_svg[dss] =
> +				xe_gt_mcr_unicast_read(gt, XEHPG_INSTDONE_GEOM_SVG,
> +						       group, instance);
> +	}
> +}
> +
>  /**
>   * xe_hw_engine_snapshot_capture - Take a quick snapshot of the HW Engine.
>   * @hwe: Xe HW Engine.
> @@ -679,10 +714,30 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
>  	if (!snapshot)
>  		return NULL;
>  
> +	/* Because XE_MAX_DSS_FUSE_BITS is defined in xe_gt_types.h and it
> +	 * includes xe_hw_engine_types.h the length of this 3 registers can't be
> +	 * set in struct xe_hw_engine_snapshot, so here doing additional
> +	 * allocations.
> +	 */
> +	len = (XE_MAX_DSS_FUSE_BITS * sizeof(u32));
> +	snapshot->reg.instdone.sampler = kzalloc(len, GFP_ATOMIC);
> +	snapshot->reg.instdone.row = kzalloc(len, GFP_ATOMIC);
> +	snapshot->reg.instdone.geom_svg = kzalloc(len, GFP_ATOMIC);
> +	if (!snapshot->reg.instdone.sampler ||
> +	    !snapshot->reg.instdone.row ||
> +	    !snapshot->reg.instdone.geom_svg) {
> +		xe_hw_engine_snapshot_free(snapshot);
> +		return NULL;
> +	}
> +
>  	len = strlen(hwe->name) + 1;
>  	snapshot->name = kzalloc(len, GFP_ATOMIC);
> -	if (snapshot->name)
> -		strscpy(snapshot->name, hwe->name, len);
> +	if (!snapshot->name) {
> +		xe_hw_engine_snapshot_free(snapshot);
> +		return NULL;
> +	}
> +
> +	strscpy(snapshot->name, hwe->name, len);
>  
>  	snapshot->hwe = hwe;
>  	snapshot->logical_instance = hwe->logical_instance;
> @@ -730,6 +785,7 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
>  	snapshot->reg.ring_dma_fadd =
>  		hw_engine_mmio_read32(hwe, RING_DMA_FADD(0));
>  	snapshot->reg.ipehr = hw_engine_mmio_read32(hwe, RING_IPEHR(0));
> +	xe_he_engine_snapshot_instdone_capture(hwe, snapshot);
>  
>  	if (snapshot->hwe->class == XE_ENGINE_CLASS_COMPUTE)
>  		snapshot->reg.rcu_mode = xe_mmio_read32(hwe->gt, RCU_MODE);
> @@ -737,6 +793,38 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
>  	return snapshot;
>  }
>  
> +static void
> +xe_hw_engine_snapshot_instdone_print(struct xe_hw_engine_snapshot *snapshot, struct drm_printer *p)
> +{
> +	struct xe_gt *gt = snapshot->hwe->gt;
> +	struct xe_device *xe = gt_to_xe(gt);
> +	unsigned int dss;
> +	int group, instance;
> +
> +	drm_printf(p, "\tRING_INSTDONE: 0x%08x\n", snapshot->reg.instdone.ring);
> +
> +	if (snapshot->hwe->class != XE_ENGINE_CLASS_RENDER)
> +		return;
> +
> +	drm_printf(p, "\tSC_INSTDONE: 0x%08x\n",
> +		   snapshot->reg.instdone.slice_common);
> +	drm_printf(p, "\tSC_EXTRA_INSTDONE: 0x%08x\n",
> +		   snapshot->reg.instdone.slice_common_extra);
> +	drm_printf(p, "\tSC_EXTRA2_INSTDONE: 0x%08x\n",
> +		   snapshot->reg.instdone.slice_common_extra2);
> +
> +	for_each_geometry_dss(gt, dss, group, instance) {
> +		drm_printf(p, "\tSAMPLER_INSTDONE[%u]: 0x%08x\n", dss,
> +			   snapshot->reg.instdone.sampler[dss]);
> +		drm_printf(p, "\tROW_INSTDONE[%u]: 0x%08x\n", dss,
> +			   snapshot->reg.instdone.row[dss]);
> +
> +		if (GRAPHICS_VERx100(xe) >= 1255)
> +			drm_printf(p, "\tGEOM_SVGUNIT_INSTDONE[%u]: 0x%08x\n",
> +				   dss, snapshot->reg.instdone.geom_svg[dss]);
> +	}
> +}
> +
>  /**
>   * xe_hw_engine_snapshot_print - Print out a given Xe HW Engine snapshot.
>   * @snapshot: Xe HW Engine snapshot object.
> @@ -785,10 +873,13 @@ void xe_hw_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot,
>  	drm_printf(p, "\tDMA_FADDR: 0x%08x_%08x\n",
>  		   snapshot->reg.ring_dma_fadd_udw,
>  		   snapshot->reg.ring_dma_fadd);
> -	drm_printf(p, "\tIPEHR: 0x%08x\n\n", snapshot->reg.ipehr);
> +	drm_printf(p, "\tIPEHR: 0x%08x\n", snapshot->reg.ipehr);
> +	xe_hw_engine_snapshot_instdone_print(snapshot, p);
> +
>  	if (snapshot->hwe->class == XE_ENGINE_CLASS_COMPUTE)
>  		drm_printf(p, "\tRCU_MODE: 0x%08x\n",
>  			   snapshot->reg.rcu_mode);
> +	drm_puts(p, "\n");
>  }
>  
>  /**
> @@ -803,6 +894,9 @@ void xe_hw_engine_snapshot_free(struct xe_hw_engine_snapshot *snapshot)
>  	if (!snapshot)
>  		return;
>  
> +	kfree(snapshot->reg.instdone.sampler);
> +	kfree(snapshot->reg.instdone.row);
> +	kfree(snapshot->reg.instdone.geom_svg);
>  	kfree(snapshot->name);
>  	kfree(snapshot);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> index 71c0a0169e62a..0a10a79962c97 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> @@ -221,6 +221,16 @@ struct xe_hw_engine_snapshot {
>  		u32 ipehr;
>  		/** @rcu_mode: RCU_MODE */
>  		u32 rcu_mode;
> +		/** @ring_instdone: RING_INSTDONE */
> +		struct {
> +			u32 ring;
> +			u32 slice_common;
> +			u32 slice_common_extra;
> +			u32 slice_common_extra2;
> +			u32 *sampler;
> +			u32 *row;
> +			u32 *geom_svg;
> +		} instdone;
>  	} reg;
>  };
>  
> -- 
> 2.42.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
