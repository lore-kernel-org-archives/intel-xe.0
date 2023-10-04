Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B850E7C4E2
	for <intel-xe@archiver.kernel.org>; Wed,  4 Oct 2023 17:32:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2536A10E0A4;
	Wed,  4 Oct 2023 17:32:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4E3410E0A4
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Oct 2023 17:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696440758; x=1727976758;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=V8Xn3He+rZnJByJ0wdaB+SleVgnbrwWhC743MdikTE8=;
 b=DKfv22Niv1j6eTYCUTLWOs64XKUmlz2atZLmdYs8McGvwpx+ikeCnJTZ
 NFikmKY3RSfJEGS1afMQe5TuA7wAFu2eqXtv4Sll4c5BFIx9PGTeb9icC
 RdudCmbhUp4a6ZCGs+1AJruLfw3JzRRI9fKDZrTW0hTR6buVA8sZQ0tsV
 KBqvL+2WUHkznu1x++L62Gol7EGyxyecC7UNFRS4m7FV4goV9s2IgxKZn
 hyiL0KGJ38VFzSF8aFKtApHwE4GdJEBjppajZ1tIqs+7VJE4nMUr8XeQT
 dAsDDUoXUY8P1nviIjcRkD2AREQbmTGEsvNg6KfwtU+KtMyIlZeaudWCR Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="368305230"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="368305230"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 10:32:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="1082596792"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="1082596792"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Oct 2023 10:32:37 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 4 Oct 2023 10:32:37 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 4 Oct 2023 10:32:36 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 4 Oct 2023 10:32:36 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.106)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 4 Oct 2023 10:32:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dH6qO0TU6VYRNWU875IZ+nl4VNFnE0mnXUdnpZs3rj3owJZiwQ2qxf9tXzJuPme4Gu8/YCOn8N8F9hzRGCNJR6fLDTKrizbxQGEMd8m+w5gAjVzlY3fHM8JXKbw2s7UoP1u+9CJ0KrFs3LerzLI9a/VMzTq/3txRX2m3m9vc7JmMcn9WvE7FpIqQXoOOZ1gyQ/p6d9Gd2KJuiQzEn7xQSe0U7QVvH1IgtddRPs/ELEyf34vytUiSKkHxQxuGWLQjXOVHRHMm4XeXwOEJYJjhL/t0W3lllz81QVfRIT98vc207w6mWq4yAU4FKig+4Wr4zSRP7tFvgoQpDxYj/+zItg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dD3RRg6k6prtXS53T7KAtb1j+5K3ViAnmDEew3dRBvM=;
 b=MAYeR/XKA9QnT5PpRa5zEiO8oGo+j7ag0zW39/njt+h9YzbDachdgiEqI1qXV/H7WJshlLLjY0D8ngR3/1hZznSQr8A1UoBRAsF6EvjY+BlxL2ITIKE8WGaTsrRyeMzAvN0HfatZDcQ6A7DqDHO9mULjHt7t9ogOKxf087QLwNgpNPU/mYf+IbrtpVFDd3nXspDsQMf0w+W5NEipkmbvyoyqeJw50/yKR7D70tqHS/bmx4QqyNKaDaaJw5TSEkG3rwD3nOKvNCsqD4GxmDCqDVxfyeiE7t/ltxRE9Wv03D1yRTA4WFlykHsv0n9uMqbo4yyxZF5jCHM6Auf36/g05g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DS7PR11MB6151.namprd11.prod.outlook.com (2603:10b6:8:9c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.29; Wed, 4 Oct
 2023 17:32:33 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%7]) with mapi id 15.20.6838.029; Wed, 4 Oct 2023
 17:32:33 +0000
Date: Wed, 4 Oct 2023 13:32:27 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Souza, Jose" <jose.souza@intel.com>
Message-ID: <ZR2hq5glDLNXadr1@intel.com>
References: <20231003202728.132545-1-jose.souza@intel.com>
 <20231003202728.132545-3-jose.souza@intel.com>
 <ZR2cxBinwax6xtM4@intel.com>
 <85b1efd2ad0bee2c5ac10e52afd9410cb655ad2c.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <85b1efd2ad0bee2c5ac10e52afd9410cb655ad2c.camel@intel.com>
X-ClientProxiedBy: MW4PR03CA0200.namprd03.prod.outlook.com
 (2603:10b6:303:b8::25) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DS7PR11MB6151:EE_
X-MS-Office365-Filtering-Correlation-Id: 215ae367-3c1f-43b5-ceab-08dbc4ffe402
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nEgne4GKH1mbasORYfsLYDFWClvtBtNc7/gTeVtdoG0sjckFupkwXv4Dhg2uFdosX9YO6IkqauHhyJlajnDj9yGwQx614LzSKfrvV79hfoXQtThk9T4nGIsDIuJJkm1KEU+YYCzdXzsWVuCFyN2vtC+MoqeRaczN1aTDTjOFVSL+NCFeW8WJ9hYBOv6T6p82YVWkOQOiZ6YE00bFHTiMXuKR2gcLYuvwcbIGzftdKX3QU5F2obYscoWeIUb4GDyseAkNO3oCNkfRseTd55w8RPTRbwx2M/skCNMVJnM4KMK4xbKiZ6yUlJf5nTlBGDrNW6xrgm8tAShxufQs/l5ZPQfwMXnX8Zg6bCX7YVvuF8gND4Bc++9m4gUKM7e162SdfG1+LCNkcRAnYBoqF+62IOiwoq+sZclZZlkQ7EyosJHo4EM6eBZ9fjbnGwJH091dxKHEVl7DdpEEJDdOaXnxlhLxzWYVLKEsRzBDqfk/rtDf2sA9gPTLnqIetXLaMukFfNC68N1D5WYMJI0yz0QGHdhXZnyv9N1yobuUsgdjkdzUloWuREk0mBZKyoO/zKTH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(39860400002)(366004)(376002)(346002)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(2616005)(26005)(38100700002)(82960400001)(86362001)(36756003)(83380400001)(316002)(4326008)(6862004)(8936002)(6636002)(8676002)(37006003)(5660300002)(44832011)(41300700001)(66476007)(66556008)(66946007)(2906002)(6486002)(6666004)(6506007)(478600001)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?F3Z0yyA2ggGMCMgYzaGqmThSdbr3IehaqpNQeaXNfCYPBu471YxKsCbu1A?=
 =?iso-8859-1?Q?p7y101h/6Y3t8VEyMHXdaOMkACJXrdGWbHK0nRSMieqWjF7T/xb7sfyLi1?=
 =?iso-8859-1?Q?QzU7sRxwF3iK5DncR4s+3pb8ROVZuGU/X4fPrGZ4FCa63ujN9upVnaVhSW?=
 =?iso-8859-1?Q?O1NakeKWOG/nst2w+AftptXsBu+6o6tgbDkgrLcwXFLqk0iWXgcPdfdozP?=
 =?iso-8859-1?Q?PSXavEKY14fJo2HR9IHKdrecMsX+1UdlxGMXD0YMizjxqpE6s5jPnXiUuh?=
 =?iso-8859-1?Q?/OfEdF7U4RSI9PHNONShlkQTkHEwtqbSiufdsCELqvTnUJi/4uqHBARlxA?=
 =?iso-8859-1?Q?1brzRNsvZqAV05cuBLbxWdFWlEtzmzqjBQMID2QYiwA4UEy/yRLEQvP7sp?=
 =?iso-8859-1?Q?kEnlO803lvIe0KBt8KlXUTSRrzK7GsEItajHS+olMU4/QnBbbAwbNuigaa?=
 =?iso-8859-1?Q?d/2kQDtXr+uqVuvC7b2uA6w+4Sx45l2wwb2RvNo3EmGo8lMTa7l6euMi/W?=
 =?iso-8859-1?Q?vYMmzc47+3l3CTim1HHMnhym/YDZL0zijUpZyGrScaCXjs2XZR5JiVyV/y?=
 =?iso-8859-1?Q?BIuLcmZFCpKGyXaoC2tCK1k4Kp+Q1yoI9o/jljphqAADqILvp9e+GONCX9?=
 =?iso-8859-1?Q?G049/+hh8/Bw4jAHtBb1muo4qtoY8o3lR4jx1M+r9llrLWo+PrUYOe7nIr?=
 =?iso-8859-1?Q?n4aD6QKdw/LW4Kb3rgzmRARMdKwGEZxMFbbR/4OlhL9+vGeqbOr7FkZD+K?=
 =?iso-8859-1?Q?vQ33iVnD5uYVTKYDJRVFT8WGRNcc+osnO/Cw7gU6NoJIYIurWu4ZnKM5f8?=
 =?iso-8859-1?Q?e0Cy6aDTzDnM3dyeG3IBUKuBZk4osR66iwV1HkJk2kBZBXuj0XgDEDoBaZ?=
 =?iso-8859-1?Q?BqCmB+xU8qbRBFf5c2dR0Qx8b0mhR1LE8ptjQ4WvioLxXQF3OsgXnt1zhk?=
 =?iso-8859-1?Q?0jh3MUi3Ccnzf6KdPburAqxIHBYR5dpHZuNp9uWRgxISHKbwRwlM/ZqBm7?=
 =?iso-8859-1?Q?1tH3+zJcmNuQpSB95B3ypBjTwweyzT5UIHc2GScDX/R1TMBn6qnIgic180?=
 =?iso-8859-1?Q?lXPDxgIhXlM0pwgcm6k6c/Pm7gkKzPyd7JR8CRUyHDkI7jHonrMMuOcZdy?=
 =?iso-8859-1?Q?KtLQ7z28dJTZcfsAcDagJG0RTS2rGciOHBL1e8I58aDc4Y4W5ujpAYDI4a?=
 =?iso-8859-1?Q?1owpYIFQFcOjvtuEEIsJntExfpe5emauNqMIzudZeXd0p09SQ1MVF0AL6L?=
 =?iso-8859-1?Q?S9TH5PSDwi3KeDbOFRK1X79NBGGK8Yavxd7Xj4ndFr7Sej9IVkpohhkbyh?=
 =?iso-8859-1?Q?+RfhhuLi2TOz5BfmBj25C+kFJXDop6ndMKAwPXuASHPgoqnsLxJzzU8K0E?=
 =?iso-8859-1?Q?IMMwTiJZ/boASuOljC9Z0ymXrO099uQV2E9opzqDD9cVVH8XObh8kQETtZ?=
 =?iso-8859-1?Q?JD6PJFTkSSe/HJOmnRa8iiLNGyk4QboE6VcobuYdllo7Cul1+mj6/wqdoX?=
 =?iso-8859-1?Q?8ANA4d11c2v6ccvJJwOMyRSEJq1ciIYx+TfH+/ABKsjaHeDvx74On4S1De?=
 =?iso-8859-1?Q?6Y6/BLDHFNjzXgGvrg7+iGc8R0ntpQ3dmV6dYyKIy4sclKNuqq2MCG+uDj?=
 =?iso-8859-1?Q?FbIifSsF7/cdCfbDSnCM7CZ4xnG2B+9/FbiqRKeE8QOIwKIIs8pVtLIw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 215ae367-3c1f-43b5-ceab-08dbc4ffe402
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2023 17:32:32.7501 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +xi8kdOspmpQAapUEIcKhiSG0+r/wXXzyjL48qyTAx1u80s3A3Oihg+iqcHKJuXIXULVkzTQEE1oSICeD2daIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6151
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 3/3] drm/xe: Remove devcoredump readout of
 IPEIR
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Oct 04, 2023 at 01:15:13PM -0400, Souza, Jose wrote:
> On Wed, 2023-10-04 at 13:11 -0400, Rodrigo Vivi wrote:
> > On Tue, Oct 03, 2023 at 01:27:28PM -0700, José Roberto de Souza wrote:
> > > This register don't exist in gfx12+, so here dropping the readout
> > > and print in devcoredump.
> > 
> > What about the RING_IPEIR ? also doesn't exist in newer platforms?
> 
> There is a chicken bit in 0x2064.

right, that seems indeed to only exist until gen11. A bug that is also
present in i915 btw.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> > 
> > 
> > > 
> > > Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/regs/xe_engine_regs.h | 2 --
> > >  drivers/gpu/drm/xe/xe_hw_engine.c        | 2 --
> > >  drivers/gpu/drm/xe/xe_hw_engine_types.h  | 2 --
> > >  3 files changed, 6 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> > > index 792d431161c68..35dd4837dd75f 100644
> > > --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> > > +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> > > @@ -31,12 +31,10 @@
> > >  
> > >  #define RING_ACTHD_UDW(base)			XE_REG((base) + 0x5c)
> > >  #define RING_DMA_FADD_UDW(base)			XE_REG((base) + 0x60)
> > > -#define RING_IPEIR(base)			XE_REG((base) + 0x64)
> > >  #define RING_IPEHR(base)			XE_REG((base) + 0x68)
> > >  #define RING_ACTHD(base)			XE_REG((base) + 0x74)
> > >  #define RING_DMA_FADD(base)			XE_REG((base) + 0x78)
> > >  #define RING_HWS_PGA(base)			XE_REG((base) + 0x80)
> > > -#define IPEIR(base)				XE_REG((base) + 0x88)
> > >  #define RING_HWSTAM(base)			XE_REG((base) + 0x98)
> > >  #define RING_MI_MODE(base)			XE_REG((base) + 0x9c)
> > >  #define RING_NOPID(base)			XE_REG((base) + 0x94)
> > > diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> > > index c2db391cf2674..f63c821baeb77 100644
> > > --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> > > +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> > > @@ -727,7 +727,6 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
> > >  		hw_engine_mmio_read32(hwe, RING_DMA_FADD_UDW(0));
> > >  	snapshot->reg.ring_dma_fadd =
> > >  		hw_engine_mmio_read32(hwe, RING_DMA_FADD(0));
> > > -	snapshot->reg.ipeir = hw_engine_mmio_read32(hwe, IPEIR(0));
> > >  	snapshot->reg.ipehr = hw_engine_mmio_read32(hwe, RING_IPEHR(0));
> > >  
> > >  	if (snapshot->class == XE_ENGINE_CLASS_COMPUTE)
> > > @@ -784,7 +783,6 @@ void xe_hw_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot,
> > >  	drm_printf(p, "\tDMA_FADDR: 0x%08x_%08x\n",
> > >  		   snapshot->reg.ring_dma_fadd_udw,
> > >  		   snapshot->reg.ring_dma_fadd);
> > > -	drm_printf(p, "\tIPEIR: 0x%08x\n", snapshot->reg.ipeir);
> > >  	drm_printf(p, "\tIPEHR: 0x%08x\n\n", snapshot->reg.ipehr);
> > >  	if (snapshot->class == XE_ENGINE_CLASS_COMPUTE)
> > >  		drm_printf(p, "\tRCU_MODE: 0x%08x\n",
> > > diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> > > index cd4bc1412a3ff..5d4ee29042407 100644
> > > --- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> > > @@ -217,8 +217,6 @@ struct xe_hw_engine_snapshot {
> > >  		u32 ring_dma_fadd_udw;
> > >  		/** @ring_dma_fadd: RING_DMA_FADD */
> > >  		u32 ring_dma_fadd;
> > > -		/** @ipeir: IPEIR */
> > > -		u32 ipeir;
> > >  		/** @ipehr: IPEHR */
> > >  		u32 ipehr;
> > >  		/** @rcu_mode: RCU_MODE */
> > > -- 
> > > 2.42.0
> > > 
> 
