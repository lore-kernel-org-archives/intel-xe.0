Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC118CE7AA8
	for <intel-xe@archiver.kernel.org>; Mon, 25 Sep 2023 17:13:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68A5B10E2AD;
	Mon, 25 Sep 2023 17:13:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98B2010E2B0
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Sep 2023 17:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695662012; x=1727198012;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Bbn0sp/C27q1tdxSCXNBqW+OyPqVQoU6VueQPpbwFFU=;
 b=VS99Ij6fGHrhn3443VrvhBBZPMHv2hIXbx+h2JLnT7//kF4TeKi0XlRj
 jOjEGEFdyPmIuRAcuRMOnpEslD9LJwGDZuGg5qj7SqsBDVZYPiQOodlBi
 bPsLEPK/5aeoPamofXZJXe4UATvbBhgiaWKy8y1sWUJ8eSE80qO2GLaZ4
 zVn213dN96Zk+N8cp6ExCN/RXoaZfH40GHj0BQ7EnXmwZdo7iXdPrySZt
 rHX/x4iKLncQdV/MUuaGm24mCdpw1bSs9GxIewA9vVS2Bp8mKW2/EbUl0
 X2Kp9wptb06nf7dYGl5OYNcSfAVSWvCIPbMKT3U2xjk06SqrOVWDUN1xs w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="412231086"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; d="scan'208";a="412231086"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 10:10:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="741990597"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; d="scan'208";a="741990597"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Sep 2023 10:10:22 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 25 Sep 2023 10:10:22 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 25 Sep 2023 10:10:22 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 25 Sep 2023 10:10:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G4Y3CBueruMs2Xip0o6WzaZQqnvwp7vcAFshfEXksBcdE6aIM1uYY3a9EytarKCft4Yh90kM2/73/D55PnmpNX8z/baGW2vT+IbNreAYAw0pehBLN9QyNwntzDf0yZyA5Yqhb6sXXfGxFoup0oMSLMqqPFreP6FwK+XY6mvBtfmHgrlbJERc7CGMML0sGJlfHBnGwPu0QLYiHpBoWqQDvfkNI+6lkjhguJYjhVPXySnDlgUVCeATmr/MqgRI9nOzqr5DfRU8uxTQCr5VvDj0Mq3U+vw6hEWjH5uzb0iioChXwHyOQdqM6l+pv1s5QlB6di+lAymIM6nEgLLd5RnVgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qZ4XQdN0kkQYW5mBtGXEI2jcY2pXFkWW7BIpf6zSImg=;
 b=kG3RmMXGBQttnocgcStIqu18DbIm8BNhtCDOwLA+v+G2lPIhoazLtLac8fKTYnVDfb44YUNxKPMakyr5knfOZlDzNEtBxsYKHTAWJjJlFdT/9w4ITKVB3gzr9bE6BW+YXklvJO/ENBt+LxQoOf7KI6Ez4VG82KwJfqTw2jK2cM+y7eIIWRJaICpEbv+vHYdmIsooppaEbdcP8FDHPUFZ88F4p47JU5HXxD7/ELc2umhHWW6MBFq/w6oZ8TyCiAKN/tgxq4dlPvsaytZj/PpPddQZL6/qsmo2sgOjTFNPOeksuSpr32pl5DLZpkLvI2VtSpcs/zs36v9A03LddH7k5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB5022.namprd11.prod.outlook.com (2603:10b6:a03:2d7::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.23; Mon, 25 Sep
 2023 17:09:59 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79%5]) with mapi id 15.20.6792.026; Mon, 25 Sep 2023
 17:09:59 +0000
Date: Mon, 25 Sep 2023 12:09:56 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
Message-ID: <2b6m6xjd22m2ijbfryjvb42tovmmmtze4i2eajuqewtqiemnf5@iyurmbf76mnw>
References: <20230920194534.57856-2-gustavo.sousa@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230920194534.57856-2-gustavo.sousa@intel.com>
X-ClientProxiedBy: SJ0PR05CA0040.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::15) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB5022:EE_
X-MS-Office365-Filtering-Correlation-Id: 31ba0b91-69ca-4b81-810a-08dbbdea3fe9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gznPFlyyciTlrxrqBGgMklYx8+aeSXBkFZpPT0wjFDMmvVwZx6JFOmYhl2k8R7Udjg62NS9tBhtUUWT9cnPjX6+DkcwUA53yxSJJCrcmOgIUF2Bhg+oJs9NOsC5gcENMipKxlU2gFTk/FLHmFD+YTGXLiRR9i+4gcStaYsKrf28i99xP1xhzo268O7Fty4OUcrev9rVZUif+msr/iJZvQCRc/ttMoNbIuBYyCkT2usqIySj20t5WKmz5RkFsWii6o2RLOXOx8l8UmvrE2rKnEhT1vb2irtiOHDzxRLeijJl3E4zpsA+vv9cFmfURu5Y7SEX7X7C3JmHHlPxJit32i2s/LLMS3m/ChXzOqSBbFcFkJnpAEKXu0wQzeBkBcjU3yTEbuUkoPvLOavbazwVbNzA0PfegT3t4mxxxGwd7LVdyr80TYxtR2tRS39Wg/zD8cWRtufL27nrdOWvjWA/qNwuG89vxStaRbrZvMAvgOk1gpmqyICdu3fETKfHHkHtwgrG5EKMPkJOzG2o180aU1LvZJSSBbBkf8YjMdzjogFvNx1UmMJPcyr2LxZE7HKij
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(39860400002)(366004)(396003)(346002)(136003)(376002)(230922051799003)(186009)(451199024)(1800799009)(9686003)(6506007)(82960400001)(6512007)(26005)(107886003)(6862004)(8936002)(4326008)(2906002)(41300700001)(86362001)(5660300002)(33716001)(66556008)(316002)(66946007)(66476007)(8676002)(6636002)(6666004)(6486002)(478600001)(38100700002)(83380400001)(66574015);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?X576MSw/KAu7kmWm1Mj21D76hkKIEilYlALeBI9MwhfjklzkeHZGKuz2Jf?=
 =?iso-8859-1?Q?Ut1lMei5hZtTdCJWBJj0XZT+FcfHZwZltLYq6zNd1nnBzgpL/9WalAICub?=
 =?iso-8859-1?Q?q6NaM2VmsLT0i2E1cjAdteb7rII7lrQB/FYwaJ1WZxfVjZ5vPt2Wsi3WUA?=
 =?iso-8859-1?Q?ms8DZwE4fMjMgtM779HjRZ1lNX/YFevdPyYSKl2qwem6L2nk9rSqVG1K7s?=
 =?iso-8859-1?Q?til/bdX8azo+OzwT0c4MJh3SCCHzOQHmkI7k4mqdhidCxWDd0fzl1fHoBU?=
 =?iso-8859-1?Q?+92I8IlW1YYZNooDbhKUJy5AQsHuO8EhcACYq239MzxGrm6kOUbX4PplIh?=
 =?iso-8859-1?Q?BEIiGWqXjcYpAwJQBc8c540Nv3mbJ1CSQG4dxjA4mwPbjO94lls/vL8fVT?=
 =?iso-8859-1?Q?h7TDeoVIXHQjNN1XDcOiUimYLVpHdLL7uuBrBhO1AiGfMXbi0xBNtpc1SX?=
 =?iso-8859-1?Q?S7shQpIYVF5/oOOMf9+HCrR+QW4DAoRlfH1jm68F7OIORI6mAx17u5x3PV?=
 =?iso-8859-1?Q?GbGoq4wpWLTITVAcOClc8Q4F7pCmy/ex3Jz0/1FUhR5okv5Xazmrv02oh2?=
 =?iso-8859-1?Q?AnIFH8YyGU/Mx7543YI64MSVjzSCur9IW4JtBR2N4Su7LFlDsAsA2chcNu?=
 =?iso-8859-1?Q?lW+Ftm38idVcPTiz5SZT3HUnRy6iI0LrdUO668F/HtLBlQ1YB2NDXtHAx+?=
 =?iso-8859-1?Q?EMyCnU4oH7HX59Z9nk28GtZJaN3dtS6MM1VYjsmC1zrndGVIzipSisCVeM?=
 =?iso-8859-1?Q?wRVckLLob96TN+Dc0X/KM1a6yg9vePyVhFXhfBVgIlyyTSnfWMIlAJrcXU?=
 =?iso-8859-1?Q?w9vVl+U3TdE11liGohbop+/6g3WN/JklngVH2lrP4AvzP6cdKA3pgZd0um?=
 =?iso-8859-1?Q?o0jiOe8MZ8371IlbtdGELvXVWQ0q1L5PryYlrKj2txZo0asmg77ttxZCTT?=
 =?iso-8859-1?Q?RYWWXmjH1vgUvijnk8IyY54+dtf9RQVEDMOuCKU5vf7aWyWGOh+6dGasCN?=
 =?iso-8859-1?Q?CcIoHPu/PzHsuF/6U9gO2UBayjc4kulSqsHyBUi47X9bJhfgX1uXdw5/aP?=
 =?iso-8859-1?Q?r3Ytf3+hdzAAoLQlwLN33+lIEsHkjJLkNrrraSA5E7ge0Gt3R67QWSIjAw?=
 =?iso-8859-1?Q?PtladfnkRXVPjmP8A7WJdlOZRnS6rnfxgWdGyG+kznbY70gSz/9nzP53xE?=
 =?iso-8859-1?Q?O2jwWNbiu0FHsFxcHN33HSWslZIMnmYCdOWSXUactIGqktdF2bfogfklkF?=
 =?iso-8859-1?Q?9lqKdUojYz9inJ50gO6XzcSgw/tTTPucK6y9sfo81zsEzyJpAnk/U+ti9m?=
 =?iso-8859-1?Q?dcIOuwOX91R230Hyw0qNsacqaE08YlfvfchiV0UBuwakqZv76SaMIZz54B?=
 =?iso-8859-1?Q?Psum27BKfyJNkCGONIEhE67RWIdq3YNhNqN6E5MlROaYzGatBPvllMtDN6?=
 =?iso-8859-1?Q?K47z/ux48J7t85dEOM6+R58TXMutUddbZ02VkysrGemNLotU0bCZ7cSOyH?=
 =?iso-8859-1?Q?76nnhof4OD60FQeR4MEDHeksoYOfaQOIOjTBWgLAo20pW50Kon8sG4r2lY?=
 =?iso-8859-1?Q?DFYZ+MbiukXgu+9HC3XOe2cx4DwiCZXti2t1ggnwvUyv12lrP2Durl4LR5?=
 =?iso-8859-1?Q?Ft1cJDb6xivzId9KD4UMOYb3bxLMjsCK8flscRnLHW1fiZ1LwIptyV5A?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 31ba0b91-69ca-4b81-810a-08dbbdea3fe9
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2023 17:09:59.7056 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hzWkCFxBkDlO8w+ZYuIago1jB7IasYMRvM0czMw6gwM9dPfhDBjirAnqK3EblQb+rKsVugClCe/SyhUXO6nHOdEzzsNtB4VUOiC9fowzHSM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5022
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2] drm/xe/irq: Clear GFX_MSTR_IRQ as part of
 IRQ reset
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
Cc: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Sep 20, 2023 at 04:45:35PM -0300, Gustavo Sousa wrote:
>Starting with Xe_LP+, GFX_MSTR_IRQ contains status bits that have W1C
>behavior. If we do not properly reset them, we would miss delivery of
>interrupts if a pending bit is set when enabling IRQs.
>
>As an example, the display part of our probe routine contains paths
>where we wait for vblank interrupts. If a display interrupt was already
>pending when enabling IRQs, we would time out waiting for the vblank.
>
>That in fact happened recently when modprobing Xe on a Lunar Lake with a
>specific configuration; and that's how we found out we were missing this
>step in the IRQ enabling logic.
>
>Fix the issue by clearing GFX_MSTR_IRQ as part of the IRQ reset.
>
>v2:
>  - Make resetting GFX_MSTR_IRQ be the last step to avoid bit
>    re-latching. (Ville)
>
>BSpec: 50875, 54028, 62357
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Matt Roper <matthew.d.roper@intel.com>
>Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
>Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>---
> drivers/gpu/drm/xe/xe_irq.c | 16 ++++++++++++++++
> 1 file changed, 16 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
>index ccb934f8fa34..cb03f40df272 100644
>--- a/drivers/gpu/drm/xe/xe_irq.c
>+++ b/drivers/gpu/drm/xe/xe_irq.c
>@@ -519,6 +519,13 @@ static void dg1_irq_reset(struct xe_tile *tile)
> 	mask_and_disable(tile, PCU_IRQ_OFFSET);
> }
>
>+static void dg1_irq_reset_mstr(struct xe_tile *tile)
>+{
>+	struct xe_gt *mmio = tile->primary_gt;
>+
>+	xe_mmio_write32(mmio, GFX_MSTR_IRQ, ~0);
>+}
>+
> static void xe_irq_reset(struct xe_device *xe)
> {
> 	struct xe_tile *tile;
>@@ -534,6 +541,15 @@ static void xe_irq_reset(struct xe_device *xe)
> 	tile = xe_device_get_root_tile(xe);
> 	mask_and_disable(tile, GU_MISC_IRQ_OFFSET);
> 	xe_display_irq_reset(xe);
>+
>+	/*
>+	 * The tile's top-level status register should be the last one
>+	 * to be reset to avoid possible bit re-latching from lower
>+	 * level interrupts.
>+	 */
>+	for_each_tile(tile, xe, id)
>+		if (GRAPHICS_VERx100(xe) >= 1210)

Better with the version checked swapped:
	
	if (GRAPHICS_VERx100(xe) >= 1210)
		for_each_tile(tile, xe, id)
			dg1_irq_reset_mstr(tile);

The code in the beginning of this function is about choosing between 2
versions of the function, which is not the case here

Lucas De Marchi

>+			dg1_irq_reset_mstr(tile);
> }
>
> static void xe_irq_postinstall(struct xe_device *xe)
>-- 
>2.42.0
>
