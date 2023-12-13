Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED387C4332F
	for <intel-xe@archiver.kernel.org>; Wed, 13 Dec 2023 01:01:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 909AE10E14E;
	Wed, 13 Dec 2023 01:01:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0303410E14E
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Dec 2023 01:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702429311; x=1733965311;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=WlSnmvejAZUuT8fGpchwLElZHYAvbEBMiiUaE6xdcgk=;
 b=Q/onquCaP/mQl67qnNFryF+ve7IfjWnUPYHoKeaIIUld4aNzpHEQ2a/o
 s/1d4QePeVzLgFXUw+HT5pEwuK73TZRzFMocsr3NG8lXd90GUG0Iw2bYG
 OkUyZcjDb4fNpDwTJ7gcUn/hqSqn0h4I5/eofZvXoKwuhtCbYYVD2gVEX
 yYT/SDYIJ/4CFYzkZ9nXLj3j6+JiYhcf7RIVZhBUPdfm3K+s2Q5jr+B3R
 YeLxgyBvWOBXbmgaDlXWFhmrtjLffZmOvu7V26wrJdP0o1/Osaf8o/3ol
 ZvCOMNXAsZGDk7ERYISjmG8DCUZ4z66QOkg+JejBpLXBO0CYzSaCv2+9s A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="8271301"
X-IronPort-AV: E=Sophos;i="6.04,271,1695711600"; 
   d="scan'208";a="8271301"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2023 17:01:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="864419996"
X-IronPort-AV: E=Sophos;i="6.04,271,1695711600"; d="scan'208";a="864419996"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Dec 2023 17:01:49 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 12 Dec 2023 17:01:47 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 12 Dec 2023 17:01:47 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 12 Dec 2023 17:01:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DLAErC5Duekjcs1eQCwDSCYVdFNXTG3Eqaxl/Drrj0UhZCE2xrtdNNq8UZkDfxEW52Ct5IKN2SzbZyIHnv36UBuIYkVKKqMlZygH9tJHGk7BM7Kn9ICllN+49YA/XpC98mY85rl2vLeP/zU2O2TGnheRZopdvvmWkZySBEDEj6uBup4v9N6u4C9U+rCt908bQhBHn2BbEygTKLB0wjIud7lFbuhMTvwlOaISUgtx/zum0Ol5dz3tjgOyykhOrYs0z/yOnvTDde8JFEr8KAw48nPMSnZF0/mV4zfuy/dx17ix96msr22kPciivDva05asqJbuYWLu9nFQkAMV+xkXuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H5I77N+2/piQHq3IXQzmDO5qJWW71t04waIoiwvIUtw=;
 b=aj96IGCjE4+d03ztlw2Rp48c60o+WThhZOIuefs68R8lUBo50GlCnui7lLWRvhmwV78lSQFip5OVc/JhenIQ1LGDbL3HZT3rDHJw+LnANILs5V3dL4nZYWU4sSsXWdAuu9BvOFEGOIM3j9GA7Shb6lsxQXEHC4HPLqXycYAugMI6+KjjGwBAG4SEiK5czUFjlV+9EwmRlqFg+i5hN8azFJwbk+M3UckzR90yZOLtWGupC0qxoxjOVfeBFrciMRcO7m6iVW7X9vTZFUZ+DZmFlNq9h5Zsg4I2b+JheH6lHAuY/Ch2TJ/zmJd9xXvau2U50adhXpT5ZsJMJk4zdk/15g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY8PR11MB7135.namprd11.prod.outlook.com (2603:10b6:930:61::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.33; Wed, 13 Dec
 2023 01:01:45 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7068.031; Wed, 13 Dec 2023
 01:01:45 +0000
Date: Wed, 13 Dec 2023 01:01:34 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH] drm/xe: Remove duplicate RING_MAX_NONPRIV_SLOTS definition
Message-ID: <ZXkCbuQ1SoowIxf1@DUT025-TGLU.fm.intel.com>
References: <20231212215603.2041841-2-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231212215603.2041841-2-matthew.d.roper@intel.com>
X-ClientProxiedBy: BY3PR10CA0028.namprd10.prod.outlook.com
 (2603:10b6:a03:255::33) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY8PR11MB7135:EE_
X-MS-Office365-Filtering-Correlation-Id: e7885643-68dc-4bbd-8155-08dbfb77136a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Enx9XTHP3YclHdIqDOqwqd5FqDg+x0hrjK2DKzy2ybPXm6s8NvaqH6XPFhuYPKLDNLzxtHrVicnpt83a+EWuTX5A9Wy1a7DaMGpQsAiNNsngyWAzuRn7itL04o21xfunRZGrltfxyksQjrxW/vmu4h/Nc/XUR9FqBZwtIkWN8KbOPp0C9b1a2cf6P2azcyd06qY1luQNBzn4i5FbWf/LT8xeFTH7g4Aw5HWIK+Ft7SW1A92Cjkhk86whedQH9aRtTOHSfYIy649td+04XG+ntQxbO87pzXrBlrzwVjW8h8MycSqPCxTUI/2z1v+TZVZ/dGMwoscfvxy3pwgJaDc9Wr4FdV8C7LkuqQCZcRfgprz/HBRVGnXkpSzQGq+WglpX9FIPk5zLJfnaRgWIEQoEobqBhboRNd/YTE98Rqx76/d9/FP8bo6WEUgv/xuU7lt267uJQgq3+HuzS5kv3FMW1hsKi/3o/cEHo/HVdCCz8bs0SHBwQxVHPCooHILsGPsjdkgR40aLuBlCTc8E0RZ+CyVOyLYjbfNxoMzfmROiwB2VlOCA6TsM0fply462AzjR
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(376002)(39860400002)(396003)(366004)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(26005)(6506007)(6666004)(6512007)(4326008)(5660300002)(44832011)(83380400001)(6862004)(2906002)(41300700001)(478600001)(8936002)(316002)(6486002)(6636002)(66946007)(8676002)(66476007)(66556008)(82960400001)(86362001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hPgY/36UZQRreMfgRMZeQWbLY3M0m+fz/VTrJYd9dzHz9mpVF0F8nhfimlu0?=
 =?us-ascii?Q?TQ+qW/4pBUGZKQ+ffoPWZV5f55yx/9/o/O49UpiOLxJsywO8cW//bBesO2el?=
 =?us-ascii?Q?0sgGb90a8cBluTtl8xaE7EsSkVBm9VLiVrcaUcDf4AWlz4C0WZBVSoXw0XCA?=
 =?us-ascii?Q?mF7r59tevbJfVxxYCj7nuYEs/tSEeMLUVqT+BCcaIumsMM3QBTTMHn50VA+I?=
 =?us-ascii?Q?C7t+iydSqBogZRcfabA49aSSMUClQU5ZAAE0hoHxlf6hGlRrVyY2RG/dz35H?=
 =?us-ascii?Q?rFXCkG04i9IVwC8goFgB4dPzXXGsXwjvtGC6UWbzX5gb+L0WhGJUKT+bn47d?=
 =?us-ascii?Q?pF+DytSw3nGUBEk0s9Pqi+Prg5qscxH4R/HQIR/FwGcRGTfVm+91GG9q9mfv?=
 =?us-ascii?Q?aKfPuM1r/bXNU/MCnrzBmUyRYLt+0xhGN6mUVESipMoK6HDHXdpEq0tFpHZU?=
 =?us-ascii?Q?ewiGG55OlIMoraVBcM76XJpmDAEq3EIWk+nia7aGe+2n76bdN3KwgDz1XNqi?=
 =?us-ascii?Q?W4pde+AINg/qbBttEBw9B5hyEJ2HiUFaCyxv86RnqBK4TnSQaXgctHl2M/u4?=
 =?us-ascii?Q?NKdRHB6Tzk2xBvmry1N4V3jeK7qjljLWVQYfbdMPIjwLccZZ2WPulxGxOXBB?=
 =?us-ascii?Q?FKDznML2oO/tVH91ip2g769JyzHXT/iMcc31KQZ7B2meNVuUaR+hqvW10uN2?=
 =?us-ascii?Q?mO1q0Bg093zub0s1PJ+wzo5hV2CAhIpC9imjO9wRBVHNXUzYiXjl0dglWnJS?=
 =?us-ascii?Q?iKGHWKyZgkMWwUkl4JNStVDV7XiO7OECcZRiOebAuOVVAZxfl6Ey8jv5Z+Wi?=
 =?us-ascii?Q?Iy7xyxrWpa7i9ZYShotq7+UGw2OBsNtgefkZ8x8d95i0NDSH2V7M9ErdcY41?=
 =?us-ascii?Q?gh3vSQQietMOWn7kU2MZM9KJWqRuOdcwrzAjE0kv+9UFXLZC3NW/E4cbk5dt?=
 =?us-ascii?Q?v9jSyh515u9D+kXUdnzGntxyAFPdcHzbC/T6VVTivYiKsSWMQUulhseDCMeV?=
 =?us-ascii?Q?GWMRAZAGQZdC9dYF+iYrJgoATTvqsvG2zsHax7tXmmAmJb9o5juMqV/Waod4?=
 =?us-ascii?Q?KSfVu5A/8qbpPjBp1PySUKGuLG9HGg8YEQCNB3xO4H14pGmHRU8RZ9uG9why?=
 =?us-ascii?Q?uDt7hHnVNHZW7m/9ydJOVHfk83Xfn7dpOq59dF9ejZUiwc4x2GL7yGK9jSfr?=
 =?us-ascii?Q?m5Fabp6EU8mK1OdGTlbvdaZ6jJBxorS0ziNosnqp41HmxIpJy6j9CAMbO30z?=
 =?us-ascii?Q?+GxKqnCyxfvFVx7mv/PuCdHNGdCtpuyHRMN3guFuzQ3rjF6oGU01wZM7xVof?=
 =?us-ascii?Q?KxfH/Z5RwpV6AjQaSaKfSRasx9b/1HiLeeHdLzAISS+KDCGJ+rhqn32uInQs?=
 =?us-ascii?Q?KN04F8oZ7i/EUj5k9P9fV6XnBVVWJPfT/k4O5ItO1nU8lObC1BumwtDeaycF?=
 =?us-ascii?Q?deK3o1tKo1umOSVRAR1DqMp6+W6pDK5/2i4k2mEkIUnS0+2tGsiXZtnpJhn0?=
 =?us-ascii?Q?E6Zr2SZZJn2bj1bjIFkqcLk/cpSYwVBlKEt/ZYSOp5/+RdXsR714NiXhITCx?=
 =?us-ascii?Q?BK/wukmgVqNjq7wdw8qIJ8sjXX/SJvQFrJ/tQnLbisbjlSnDC5/7TUdOzcy3?=
 =?us-ascii?Q?OQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e7885643-68dc-4bbd-8155-08dbfb77136a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2023 01:01:44.9560 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lRQVFU69zQOIa4kl+qSExyhkMe1kKSgqwhEbWODjxk8PYJrYE5hC4DbjO/fScpDcwwf73Sg7Z4lxy4trIOl4FQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7135
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Dec 12, 2023 at 01:56:04PM -0800, Matt Roper wrote:
> The engine register header wound up with two definitions for
> RING_MAX_NONPRIV_SLOTS, likely due to a rebase mistake.  Keep the
> definition that's in an appropriate place (i.e., with the
> FORCE_TO_NONPRIV register definition) and remove the other.
> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/regs/xe_engine_regs.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> index 3942db268b01..1a857c4edcf5 100644
> --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> @@ -40,7 +40,6 @@
>  #define RING_NOPID(base)			XE_REG((base) + 0x94)
>  
>  #define RING_IMR(base)				XE_REG((base) + 0xa8)
> -#define   RING_MAX_NONPRIV_SLOTS  12
>  
>  #define RING_EIR(base)				XE_REG((base) + 0xb0)
>  #define RING_EMR(base)				XE_REG((base) + 0xb4)
> -- 
> 2.43.0
> 
