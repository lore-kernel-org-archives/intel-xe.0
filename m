Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 543D6C001DF
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jul 2023 17:36:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B28710E0A2;
	Wed, 26 Jul 2023 17:36:44 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0D1E10E045
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jul 2023 17:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690393001; x=1721929001;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6BVbLIxFqv8Oe7HAyMacATFiOKGw9rxc2c4ISm9tIfg=;
 b=djxzXnUcny90hTgsEyDVyzeB9DfBkUX0utePQM3jS+Zwg8UyRF8M4p0W
 Mo3oC4VirKCJp8tq0hzv/ny/F0XGV8aiehf5CGhDPMPibHaXVYqoEpJXc
 nV1Q+btN3u9RoRR0u/XSiwDdmNPSHF05TWTPZNCcuGDFK4m6XOSNd/raC
 WIgSwpxvE6ckSmzuCStrksOH8QUCfnlnuNI2joW4p9sFtJnuJAxymF6pm
 DvRDqhhgFZM3alPTb9X9uB8hTZpD02nMyjWZRfv8neipZwSzD/j8sbgjZ
 X+gSqcz3QuEuj2RAbOg7JM62QGTC8Lh8yx1MdBzgHDMSWuTC7ctvsLbC/ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="358083431"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; d="scan'208";a="358083431"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 10:36:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="840332915"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; d="scan'208";a="840332915"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga002.fm.intel.com with ESMTP; 26 Jul 2023 10:36:41 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 26 Jul 2023 10:36:40 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 26 Jul 2023 10:36:40 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.102)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 26 Jul 2023 10:36:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FQ+dn8wiSIyXiSnrNUds1VOjkrthaG4FkAVclSxvP+Dr2tRTQ8BwZmOm+J6hJ+zWWkwkmElt4dT2KqD6y6Bnjb/4PsWwYFfQW9OuAn+5v+Vp4S4BQAmGIYH2O5Y6VQr9gKYpE4sx2ED+OqK+pe/+kNqOBfa+AQnYNEPOUXk+MZ8kK3B27Vu1EcVx+8m8/jHXZaJKO0bw25NSlkNXWA5lpG5pr8ylWwcBgV7uiDgo0CxSJ8Qltxf0+xGAt897R6GgMZGfCEfN8NPCkpuxi8aqSGTftclDJFc9wqpkYQz/IGvQSl+PPnS5eOsyBV7Gkjd8a4qpWs60+GfSQx1cvg13cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hAcwDJdHrXWGrihwspu0zVlVLctfqLqLrypcfgVjvVY=;
 b=AvAlbZVOpN+Xey6SfMrN8Xu9HliIrhldBL2UEJfLygaPM6gXHSpd+soVSgFyXX0OPJMMEJ7pY11OV1wAo/aMsQvHsZEXSNdTJf4NZ0q7LvnDh6TthjFrIcnyX/HTkZO9sFxHNEoq3QeiJrdka76P3z82EBSRzj3Ww01trBn1BqMEQPTCBnLcPZy1Hu1iTL61gVFI5IIIzjGu9sDIsJfKGzNyhhgDzf43GQAv76BIoLTCutvTUTTaHl7ffwgtj/x3kdB+7R00XY9f+2yo+slfvt0WCHK37CFC6nKq3ETW7p6XquxtXfQVFWsQT/jYHLYEZ8xShFtEw3TG1FCZEuptCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 DS0PR11MB8183.namprd11.prod.outlook.com (2603:10b6:8:161::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6631.29; Wed, 26 Jul 2023 17:36:39 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41%5]) with mapi id 15.20.6609.032; Wed, 26 Jul 2023
 17:36:39 +0000
Date: Wed, 26 Jul 2023 10:36:36 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230726173636.GW138014@mdroper-desk1.amr.corp.intel.com>
References: <20230725202836.3854908-1-lucas.demarchi@intel.com>
 <20230725202836.3854908-5-lucas.demarchi@intel.com>
 <20230725225515.GZ209733@mdroper-desk1.amr.corp.intel.com>
 <w6r3nlsddl4euiug2b2ec7fgds2md767kiye7fpa7ip7d4ktin@gof5474xjdbl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <w6r3nlsddl4euiug2b2ec7fgds2md767kiye7fpa7ip7d4ktin@gof5474xjdbl>
X-ClientProxiedBy: BY5PR03CA0029.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::39) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|DS0PR11MB8183:EE_
X-MS-Office365-Filtering-Correlation-Id: 58cd3067-5e4f-4c89-6b8b-08db8dfedde7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GQT6vVJ6x3nllAI5QJebf/bNUrDcoCaoDZUB0b7Kvo6nbnaofQhwcoF3yNxSKVD7rA7MRFLBC2bvKz2c9K0wXepobOOcCaEFwbIay8QItYNNLphVrkX2gyXg9UOJz16XYwLzMWxE/HB1YTK7cq560MnTCG7DvmJQ1ZT242nTAsdErLi6fIf2V/16mBUHfgY2vWmM8QP+m9ryA8mntYbKl7VNp5vqTIto07rpWMDgaHR98tqP2kI/WpxsfPJQgug5Oy9nyjleTDcIcq+CUDfjgDkx+T8E2GpST7MXLOl63nWkDTmFwolw2Y//yZ0a7pDbev920DGQaiIeS3C9eKyGHyx/ZRx3xdSyl69Q9uUqOxcnjvSSHu/O+lLNtPNvGH43ZAD24IM2/xHA7CuF8wMlV58qW1XZgqWSrBZXDAQBnayuoDX/UJgRMeGz8MkmSqS8I8NnLzxycYgTKkGT46g6DivTcqfNL5BRWhz5VqPBXVrMnlPSuKNZfkrkjTHiCPVFFXGgv0yDgPs83VCn3ciem+lXxwjyiBx1oMpbiG72NB4YvbzUzNrEwC4BHab27j4L
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(136003)(346002)(376002)(39860400002)(396003)(451199021)(83380400001)(82960400001)(2906002)(5660300002)(6666004)(6486002)(1076003)(6506007)(26005)(86362001)(6512007)(478600001)(38100700002)(41300700001)(186003)(66946007)(66556008)(66476007)(316002)(33656002)(8676002)(8936002)(6862004)(4326008)(6636002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kYYnFV+GaQ4ySkvEoqdMknPgHLfFxsJFFdLbzXPxc1XdQvq3v0J8y9ecOY5a?=
 =?us-ascii?Q?WsjOP8yaevv0xPcgxbVZxSXpCBnSgCnNxynm/6YD1JEz84+pbpJ46u30+eE9?=
 =?us-ascii?Q?fFPW42/oOShfUZX3/nn/1gcQ4Eiib6gTzT/0FdVp/o3VTdS1MVwW0n9z653x?=
 =?us-ascii?Q?F9Ho6pNBn1glhyt3upEgUeL0PdYQYaJdAMVATTdRdR6yHXB1Rc/GRwtMgb1W?=
 =?us-ascii?Q?JG4hULdZjwLr83PmPpjj4ge7GdxqYoAnpvUW+3Wz76A5JtO7nCZTW2P0o/z5?=
 =?us-ascii?Q?fuS3eYIzzMaTnJid07IU0AUv8i5Dq4O3XUK7RGNf7hUHpa1VC8bkNk5RMlCR?=
 =?us-ascii?Q?NMqkyM1XqF+V6WMVx6QV52BYFPSyb4DzsqnUAQJb35iuE+q6UFTRNydt9yRR?=
 =?us-ascii?Q?xS4vDstBJH3Ge0haJjzCZhUzIrtpCFFhq4AfGMwVFa2bYD6nvPcCVLeKWS1Z?=
 =?us-ascii?Q?INTTiEWR+pMJtZWwqb4nUCoUbthG2DA2xmOc02wQtXEB7PLLnoHaEqc9res/?=
 =?us-ascii?Q?ruxfuOgIjLcI3HaXJ+0wyXtuHRjbp0dmC3vgCm03nWnij5oChHGbHW/7ciJs?=
 =?us-ascii?Q?UdAwL2evoZy6NMJKE103n1P3NnnNDFpe+j9m70RWZMOxpBA5lmcvMU6uwRpj?=
 =?us-ascii?Q?rUGvr5JfmKvM+zGItLcG+B9FjPE4vfqXI0BKoiNOPtgz+kAc0+HJoleh889r?=
 =?us-ascii?Q?UriZooHZOuOlaEgFHpYAqi7Urj1wI+mho1r3XaMt0D+LbzP62U1VF3Opd4+J?=
 =?us-ascii?Q?qCTz/u7k0qZ0dvSeRsF2bCiOa71eTf03DfvXn8iF9/0GC+yuHP8PirDMmRLV?=
 =?us-ascii?Q?oXS883WNOkilGVB93m7qe+8MHTsUkRx3vhvYql1Y8jk9uQCWvQmUk2etcwqk?=
 =?us-ascii?Q?WxLU/07RbRKZrNyz4C2yFAPOrUS6TzeWIjmbijYu6cU07NZqlrYlWoAOnyej?=
 =?us-ascii?Q?wCGqVvYjqxDOq2HyNNrQLvzCp6aBX8J0KI9tFC5QJg+whR2qaTW+738ZC4Oq?=
 =?us-ascii?Q?ueCz6RTtWZGzH2YtrAr9+i7yP+XAkcM+byWDBKp4KlhwAFLQxP8Tur4/Diqr?=
 =?us-ascii?Q?1dCG2y/9uFW9HbkzMhWL47zyyNKYoXwA3AMxjFbvCCoF0jKMRC0fwQ1HYSnq?=
 =?us-ascii?Q?AOoeQ6sHZfVx1obQ8aNyZUi5ZWaaRmWWd/VsfW6yGvZZqc04nY0ukepp+GJP?=
 =?us-ascii?Q?45NisHp9To/Da4DbFmnyGv943GDFUP0wRHvDmNLvR1ZNFlyWbf24pfwH6Ti3?=
 =?us-ascii?Q?TFJt0arGE/88WHFrxqj4228gvAdtQ91YKvaDiNPOy9DNTEfnVUGEXDPI/snb?=
 =?us-ascii?Q?+Zp8UByO+V/JuT9kR5uWzM9t7gUd2jjjbIpLavnoazEpHz0oTGKSa5z11Kgq?=
 =?us-ascii?Q?/5EPlTCD2o/twYu1wLaIS1cAmAxTNUwK9N0MhXo1dQdBhSAsgeuVHJpBA9ph?=
 =?us-ascii?Q?U2R7p2U3+k7yyH+B3gEU0h4ZAs5zCxR0cDdO5ykX8CQ04lnOiXsXlx2NTavL?=
 =?us-ascii?Q?ip+lMeuIyqXPDC8bX5/7Mmc0yEbkc2HZgVJULp/9HRXx/iKueBhNOFTdpTAN?=
 =?us-ascii?Q?oGfqGwBV9hOONKeYqVLthbQI57zVf0/dk5Mo7e5OYzqhkFMM2zT6l2DpXWEX?=
 =?us-ascii?Q?+Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 58cd3067-5e4f-4c89-6b8b-08db8dfedde7
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 17:36:38.8734 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gQja+hgBWOV1SxCe7sQe3F8Yup1xbvjRy1sFpQ021u0ELnJJ512H6LUPTX7N4V+N52voD1eWo0Gu3QuhabWLmjdOr1O5s1CC7tvScVm/rvg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8183
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 4/4] drm/xe: Sort xe_regs.h
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

On Wed, Jul 26, 2023 at 11:46:09AM -0300, Lucas De Marchi wrote:
> On Tue, Jul 25, 2023 at 03:55:15PM -0700, Matt Roper wrote:
> > On Tue, Jul 25, 2023 at 01:28:36PM -0700, Lucas De Marchi wrote:
> > > Sort it by register address, but  keeping a few exceptions when a
> > > register for a platform changed the address, but has the same
> > > functionality as an already existing register.
> > > 
> > > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/regs/xe_regs.h | 56 +++++++++++++++----------------
> > >  1 file changed, 28 insertions(+), 28 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
> > > index 3f7052fec6cc..0b3607e0ba1c 100644
> > > --- a/drivers/gpu/drm/xe/regs/xe_regs.h
> > > +++ b/drivers/gpu/drm/xe/regs/xe_regs.h
> > > @@ -7,9 +7,6 @@
> > > 
> > >  #include "regs/xe_reg_defs.h"
> > > 
> > > -#define GU_CNTL					XE_REG(0x101010)
> > > -#define   LMEM_INIT				REG_BIT(7)
> > > -
> > >  #define RENDER_RING_BASE			0x02000
> > >  #define BSD_RING_BASE				0x1c0000
> > >  #define BSD2_RING_BASE				0x1c4000
> > > @@ -45,36 +42,15 @@
> > >  #define FF_THREAD_MODE				XE_REG(0x20a0)
> > 
> > Looks like there are some registers that don't really belong in this
> > file.  We'll need to move at least this one to the engine register
> > header at some point.  Actually we should probably move the *_RING_BASE
> > registers as well.  But that can all happen in a future patch.
> > 
> > >  #define   FF_TESSELATION_DOP_GATE_DISABLE	BIT(19)
> > > 
> > > -#define PVC_RP_STATE_CAP			XE_REG(0x281014)
> > > -#define MTL_RP_STATE_CAP			XE_REG(0x138000)
> > > -
> > > -#define MTL_MEDIAP_STATE_CAP			XE_REG(0x138020)
> > > -#define   MTL_RP0_CAP_MASK			REG_GENMASK(8, 0)
> > > -#define   MTL_RPN_CAP_MASK			REG_GENMASK(24, 16)
> > > -
> > > -#define MTL_GT_RPE_FREQUENCY			XE_REG(0x13800c)
> > > -#define MTL_MPE_FREQUENCY			XE_REG(0x13802c)
> > > -#define   MTL_RPE_MASK				REG_GENMASK(8, 0)
> > > -
> > > -#define SOFTWARE_FLAGS_SPR33			XE_REG(0x4f084)
> > > +#define TIMESTAMP_OVERRIDE					XE_REG(0x44074)
> > > +#define   TIMESTAMP_OVERRIDE_US_COUNTER_DENOMINATOR_MASK	REG_GENMASK(15, 12)
> > > +#define   TIMESTAMP_OVERRIDE_US_COUNTER_DIVIDER_MASK		REG_GENMASK(9, 0)
> > > 
> > >  #define PCU_IRQ_OFFSET				0x444e0
> > >  #define GU_MISC_IRQ_OFFSET			0x444f0
> > >  #define   GU_MISC_GSE				REG_BIT(27)
> > > 
> > > -#define GFX_MSTR_IRQ				XE_REG(0x190010)
> > > -#define   MASTER_IRQ				REG_BIT(31)
> > > -#define   GU_MISC_IRQ				REG_BIT(29)
> > > -#define   DISPLAY_IRQ				REG_BIT(16)
> > > -#define   GT_DW_IRQ(x)				REG_BIT(x)
> > > -
> > > -#define DG1_MSTR_TILE_INTR			XE_REG(0x190008)
> > > -#define   DG1_MSTR_IRQ				REG_BIT(31)
> > > -#define   DG1_MSTR_TILE(t)			REG_BIT(t)
> > > -
> > > -#define TIMESTAMP_OVERRIDE					XE_REG(0x44074)
> > > -#define   TIMESTAMP_OVERRIDE_US_COUNTER_DENOMINATOR_MASK	REG_GENMASK(15, 12)
> > > -#define   TIMESTAMP_OVERRIDE_US_COUNTER_DIVIDER_MASK		REG_GENMASK(9, 0)
> > > +#define SOFTWARE_FLAGS_SPR33			XE_REG(0x4f084)
> > > 
> > >  #define GGC					XE_REG(0x108040)
> > >  #define   GMS_MASK				REG_GENMASK(15, 8)
> > > @@ -87,4 +63,28 @@
> > >  #define STOLEN_RESERVED				XE_REG(0x1082C0)
> > 
> > We should also make sure we're writing hex in lowercase consistently
> > too.  Again, that can be done in a future patch.
> 
> yeah, I mistakenly added this is uppercase in the previous patch since I
> copied the value from the other register that is also uppercase.
> 
> > 
> > >  #define   WOPCM_SIZE_MASK			REG_GENMASK64(8, 7)
> > > 
> > > +#define GU_CNTL					XE_REG(0x101010)
> > > +#define   LMEM_INIT				REG_BIT(7)
> > > +
> > > +#define MTL_RP_STATE_CAP			XE_REG(0x138000)
> > > +#define PVC_RP_STATE_CAP			XE_REG(0x281014)
> > 
> > I think it's better to keep consistent sorting rather than trying to
> > keep registers that moved between platforms in the same place.  Too many
> > exceptions like this ultimately leads to chaos when people aren't sure
> > how far they can stretch the exceptions.
> 
> Agreed, but we probably should write down the rules. It would be good to
> have some rules that will allow use to eventually convert this to an
> autogenerated file. However we have the following situations:
> 
> 1) Regardless of moving the engine bases,
> 
> #define RENDER_RING_BASE		0x02000
> #define BSD_RING_BASE			0x1c0000
> 
> would we leave them spreadout through the file?

I think these should probably move to xe_engine_regs.h, at the very top.
They're not registers themselves, but rather the expected parameters
that will be passed to every register in that file.

> 
> 2) When the register keeps the same definition and just changes the
> offset for a new platform, what to do with the bitfield definition?

I don't have a strong feeling about this one, but I mostly just leave
the old definitions where they are and add the new ones under the new
register.


Matt

> 
> Lucas De Marchi
> 
> > 
> > > +
> > > +#define MTL_MEDIAP_STATE_CAP			XE_REG(0x138020)
> > > +#define   MTL_RPN_CAP_MASK			REG_GENMASK(24, 16)
> > > +#define   MTL_RP0_CAP_MASK			REG_GENMASK(8, 0)
> > > +
> > > +#define MTL_GT_RPE_FREQUENCY			XE_REG(0x13800c)
> > 
> > It looks like this one should be slightly earlier (0x13800c < 0x138020).
> > 
> > 
> > Matt
> > 
> > > +#define MTL_MPE_FREQUENCY			XE_REG(0x13802c)
> > > +#define   MTL_RPE_MASK				REG_GENMASK(8, 0)
> > > +
> > > +#define DG1_MSTR_TILE_INTR			XE_REG(0x190008)
> > > +#define   DG1_MSTR_IRQ				REG_BIT(31)
> > > +#define   DG1_MSTR_TILE(t)			REG_BIT(t)
> > > +
> > > +#define GFX_MSTR_IRQ				XE_REG(0x190010)
> > > +#define   MASTER_IRQ				REG_BIT(31)
> > > +#define   GU_MISC_IRQ				REG_BIT(29)
> > > +#define   DISPLAY_IRQ				REG_BIT(16)
> > > +#define   GT_DW_IRQ(x)				REG_BIT(x)
> > > +
> > >  #endif
> > > --
> > > 2.40.1
> > > 
> > 
> > -- 
> > Matt Roper
> > Graphics Software Engineer
> > Linux GPU Platform Enablement
> > Intel Corporation

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
