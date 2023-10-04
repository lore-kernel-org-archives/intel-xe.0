Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5651CE7C4E2
	for <intel-xe@archiver.kernel.org>; Wed,  4 Oct 2023 17:12:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 247E610E3A5;
	Wed,  4 Oct 2023 17:12:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1C3210E3A5
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Oct 2023 17:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696439523; x=1727975523;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=PIWjzHsgW4WzUMFWD3envCUwSHVRXgSz0IJri5dE054=;
 b=jT04SMBcirLNEhz3ksym9ezums2Mm/VxgPu6bZ+kf4yQqnrTPA0ytZub
 oM+N0uAUIifij6EWooWTo3mRxZlUCVk9BdNN+yu0HAVq+bvvgulJ4hKNJ
 OxnLPDpsD1Tn6cqimVC7Zw4DSsal79RPHLi57oLg3y0OvbXuSj5iEpYWv
 PXhYo2JtfPMYiNQQ+BB6SmJdpr8EWEpPj8b6jwHLQQNbkUJiemXfEpgA/
 TMPo1ke0L+MALuQzjwPzN6COeNm3wobRSLwgNIpJeUH6WSNzW1Sf1PJKw
 Pwu3Xvnlipu8uzUv1mGIhnoR2F/BKiXRizwLKrl7D318qC42U3+K6hz60 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="368295496"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="368295496"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 10:11:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="1082591813"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="1082591813"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Oct 2023 10:11:57 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 4 Oct 2023 10:11:57 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 4 Oct 2023 10:11:57 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 4 Oct 2023 10:11:57 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.42) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 4 Oct 2023 10:11:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lsnln/eZZnV4kjz9GCNdV9+GIdkqfRoKWSfWFPPPzfQntGYVo0jdvZg7/c5itwbhaG4qg8YR5yaZNQ4D/Y+8QrF2lOtGswmQNwRe0w3jYe77xooAAJF25TD9HuCuaBF/Zp2ovREvt0m50RoXU6agM4qAdBHzAh5MLNpiqgpd82z8NMx04wdTDIzdr90SJPerCxVmsXbp/CX+sW2oSMhMfv8T0MwW6rHCTLD80xNARdTUDGOVtPezSK4aPknfYi7jk7cplQlzJIR5eA4fZTIC+U1TE7jGsqI35GOkZFk6IUfdx6EZahGOUAiUzDxM8X3am4LCbor0fZPY0p+i6FNFKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cvfOF93moY6yGP8kh1PYHN6RShU4Gd2mf7br8rzi1Fg=;
 b=c5kH7ak7V0INhrB5HuSXCqEy8GchycGC4cJgSCDEELKQ55KiYcItQNCkuLGmw9BuJ+cvr7GgKT87kXtyG0mStRH+QwRkXxCf7x1lGM/8IZWiZvtkXBnY7PcrElSALmijEh99I6SEg5g4l1glSm4b1nrW7zTyzdP39l6WDgCCZC/iLpzdrqdJDmCk953q1/2D/UJ5Cp5Rf7G29Iihb9paFZZVNFKo+aeDiYBS/Vvqc9QnAro3hwXfyELhDAhZn7heotp1F1OdgnR8z1Lly5G84UMD4YWsAlOdU20RU1XVn1PUsY07cHVlnfBM3W91U85PlOrgAsuYQMwlTfL7K4Qu9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MW4PR11MB7104.namprd11.prod.outlook.com (2603:10b6:303:22b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.34; Wed, 4 Oct
 2023 17:11:54 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%7]) with mapi id 15.20.6838.029; Wed, 4 Oct 2023
 17:11:54 +0000
Date: Wed, 4 Oct 2023 13:11:49 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>
Message-ID: <ZR2c1bS4m3W3jeCN@intel.com>
References: <20231003202728.132545-1-jose.souza@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231003202728.132545-1-jose.souza@intel.com>
X-ClientProxiedBy: MW4PR03CA0135.namprd03.prod.outlook.com
 (2603:10b6:303:8c::20) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MW4PR11MB7104:EE_
X-MS-Office365-Filtering-Correlation-Id: c4de4263-d9dd-4468-8700-08dbc4fd020a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tiOLwX9G4cSbv1i9WRx6I2TuvsJiKFBHajT2UKGJn2WDHhpE7YOKAHIBH/4WEfGMO/0QnpwbA+NHKoAFOxIMq8xvBN8PycuBdF02O4/kBvaACPlOCZE77qIoL/ie82FfhPzP/3/pHmUmwJ8AjNmVAdp9mU5ET7BR0uYU2510nlldinKUFBMsLx9dcuaCELnVfmUKsuibEwcVLnroMcWfRf1i2954jmndIidf14g/6RhdSe9mRSyuUSyR81XjYehl2LeqzxB/rt7in4S5Q63UNEvgOu5ywE258zlu/elOfGFnkkp5/FyYb83L1Dpywl/Hw3ijAN1k8UY5N26sqXhBcDC+mBeDfMa4gOpeIVSfixKVHvoH9y/wQcde3c0nwwmaV0NHDpYPSvJUH+v9f24YqTdxvXTMVNUxNrDk/PHW4QXsGNuRD4VL2K2Nzfu11W7cOmmArLH2N8g7Gi02yB30GdjjWtxbKkFijXaV+sBoeo249XMDhBONKuvwAO+T7HzuKJL0pBg8rT4bNdcByXSYIZSmoQxJTLJBnUuPkZaQxsV8H1en5RacPdFmeFjcwU9j
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(366004)(346002)(376002)(136003)(230922051799003)(186009)(64100799003)(451199024)(1800799009)(2906002)(83380400001)(38100700002)(86362001)(82960400001)(36756003)(44832011)(316002)(66476007)(37006003)(6636002)(66556008)(6506007)(6512007)(66946007)(41300700001)(6486002)(2616005)(6666004)(478600001)(4326008)(6862004)(8676002)(5660300002)(26005)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?8W17XTBWIF0/UkdbvN4+Kl6alA+7kt04QQqOkcMRYpKUZbx7Se4pXCMMMf?=
 =?iso-8859-1?Q?J1I6mVQO4LTHmI7smNFswCEKGgmFQAEdNAoIKRXnwUDZ47ddlKHON+jLVr?=
 =?iso-8859-1?Q?PCkaoOyEs/ZYLOzE7N2MNl0nReGPA9NHui9dH5nzo7thHTChIS9i0RP8OW?=
 =?iso-8859-1?Q?xg5VJSae8G0v93LSjQ1WTX1DQYLakKzZaAtejmAJx/u+tfuOP3VCc3D7Ed?=
 =?iso-8859-1?Q?vjta9XgSpwTYs3o5EEKgsLLVm7AnsBZn+Y1m28/y8EjtLEpVGVJL0GHz+M?=
 =?iso-8859-1?Q?EtOBhynyU9ZqA+Jmoc3PXd9FRN4vZsKNS+D/nk4UFOPy5HZB320c5EtN0V?=
 =?iso-8859-1?Q?gjLKKevT0qlRTRaendyToG9FftzrcYpyuKT8btRjMBW5DhYb8TCyk2tWyN?=
 =?iso-8859-1?Q?pu5s1CjpF8ILWer9J//ziKJDvKwLeOzGu7vGW0IwJVD0WidGBym+Sf23/o?=
 =?iso-8859-1?Q?7sp5bGGDlW8SS1lj3BcdtMd/XcfcTl9UYRkKkZsb8JXvuaXSL8aTsSVQjf?=
 =?iso-8859-1?Q?ngEH5Hhb2GRi2P+1vV4Q6bKAYk2ONI3zKzyfOtR1o7m6SdCnO7YDyPHD4l?=
 =?iso-8859-1?Q?nWDZQmlVu1e5GPqS/37t4KrySe5qWTmgs1LreFYGkD+rvguSIfJmkblfXz?=
 =?iso-8859-1?Q?N4dp7RE1PpK7Bu1IzJMHG56BxRM42TwrNMg5B94xpwZ4XFoA2ZfEu46gLn?=
 =?iso-8859-1?Q?y4OPitx10as294A6cPsSMOX6385q39HfD7jAnCeF+RyaT+NqyffAMHcABA?=
 =?iso-8859-1?Q?FF1uM4RkMpuKPC6yPm7MpC2GS4EcoM8X/hM+M0WdviJOJSY/m9ZoiWfIkp?=
 =?iso-8859-1?Q?B4dwuOLDwL6VaTPwNCaaZuHrbSxJ7m4JbCTUNbiKaF/l3eD/Yzq9MgE52B?=
 =?iso-8859-1?Q?k9/T1x31HtirhrGx3obb2Mx3SkPN0rWiDq2Ip7/+NE86zJcNy/++k3sDxA?=
 =?iso-8859-1?Q?zAIQAxLJPSwj7RvmI1Z8fZoCamsTkRfngX5/acrmnjy3KZwQU7cW7XFHtO?=
 =?iso-8859-1?Q?5EMvEQXSLJuJGbBrUVfGBzTAS6zx13wdZN0kJs7rI6S3Q7PxUabweanvCs?=
 =?iso-8859-1?Q?Jbk5z/OVG6q1TuLlMTIQ17TnFCPKN7e3u5egIaVhQQCukNDL3TqMfsFjVv?=
 =?iso-8859-1?Q?lVq187srshpn/ElQ8ZRxvf4zYvrMvQuLx/U+oPnNcpOQzFyKVVuWQnnk8K?=
 =?iso-8859-1?Q?fI3/IqVWxSZjXchxReSShOKIk5QAM7c1upc42TNbn/zeM05/o6Xe4Y0NeZ?=
 =?iso-8859-1?Q?AyqqtIj6tLnMPIR45R6aPbGfJ+5xp3Y0M9hu/BVLpyheDFPvIsi4i/QQWg?=
 =?iso-8859-1?Q?va/8I1t6EWLscxFFr6wxhJidDLcyRgYYPXPrdwvQWrGa4XuQ3cd2p9OAI6?=
 =?iso-8859-1?Q?wRU/DDxd14EFhA6KTweY/Uu/QCEzbdSYb4PTaX/bACaSjdvd5PN9L98maC?=
 =?iso-8859-1?Q?DsXCagU7M0uTJUyPLUPIJ/kB/RbBtiQw/0anKfdGUM92XKUclvvThZivZb?=
 =?iso-8859-1?Q?uoRBpii3Ie8J8mmtGuO0BkMnNT7k/kaoiUqZmURkLBiE0eK2qdXty4qhDc?=
 =?iso-8859-1?Q?z0MzyJWz21459aRcz0gg6BvZOt9gnuW7HUQm8mIXEEXDUenZlrh1mBPeTO?=
 =?iso-8859-1?Q?CBMMNP9YgT5Af05H2n5NPIg2vn2IDyqbom/5CTraVjvL/7DMmsiGrNtw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c4de4263-d9dd-4468-8700-08dbc4fd020a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2023 17:11:54.5690 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VUMJiLWKjAyrScKwkIl9cJgFH8AgN/rXtqFffbTx5e/ixgMoeigAz1P/juIiveERiBsGk94sMoJUplKob4lRFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7104
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/3] drm/xe: Fix RING_MI_MODE label in
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Oct 03, 2023 at 01:27:26PM -0700, José Roberto de Souza wrote:
> Fix a typo in RING_MI_MODE label.
> 
> Signed-off-by: José Roberto de Souza <jose.souza@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_hw_engine.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 49128f640e15d..dc9dd83d99c52 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -770,7 +770,7 @@ void xe_hw_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot,
>  	drm_printf(p, "\tRING_HEAD:  0x%08x\n", snapshot->reg.ring_head);
>  	drm_printf(p, "\tRING_TAIL:  0x%08x\n", snapshot->reg.ring_tail);
>  	drm_printf(p, "\tRING_CTL: 0x%08x\n", snapshot->reg.ring_ctl);
> -	drm_printf(p, "\tRING_MODE: 0x%08x\n", snapshot->reg.ring_mi_mode);
> +	drm_printf(p, "\tRING_MI_MODE: 0x%08x\n", snapshot->reg.ring_mi_mode);
>  	drm_printf(p, "\tRING_MODE: 0x%08x\n",
>  		   snapshot->reg.ring_mode);
>  	drm_printf(p, "\tRING_IMR:   0x%08x\n", snapshot->reg.ring_imr);
> -- 
> 2.42.0
> 
