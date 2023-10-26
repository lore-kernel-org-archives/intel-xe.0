Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8AFBC0032E
	for <intel-xe@archiver.kernel.org>; Thu, 26 Oct 2023 03:07:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75E3010E742;
	Thu, 26 Oct 2023 03:07:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7836E10E742
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Oct 2023 03:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698289665; x=1729825665;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=yewBhUr3BmVP4dj1geycAbf9IC9/8xWBv/v36E+k9TA=;
 b=hebsY8i7EdHionPZ2QOAKzuF03W26mJgRL9pIXwvEFiK/t2kyb3OqyUI
 NUBR9pvaA4N0pttuqUfQqples6t8QYZCj2MyPGV3ET2L9il7AsJL5sT1y
 v57l2cNLJFXy0yKLyNPBdMPQq7RXS1XSmgUqXvwLVVKGaiw5D5UAzuI9q
 ZaYtaGe2UJz9HEDryDO5gAjqCpFmf5NKZOn9NupsxKDpXtncWLtSWADep
 cZQcanzMxbYWZcUReuQsDZ4jBvlflIHKVecLzcy0R2AeJVgTDyqjrEotR
 05SsbVpw98ZyTPIleOROpqEIWbgN7jyrwJN4eJhr7DK1UqobqazZpJVya w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="418575217"
X-IronPort-AV: E=Sophos;i="6.03,252,1694761200"; d="scan'208";a="418575217"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 20:07:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="932584738"
X-IronPort-AV: E=Sophos;i="6.03,252,1694761200"; d="scan'208";a="932584738"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Oct 2023 20:07:44 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 25 Oct 2023 20:07:44 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 25 Oct 2023 20:07:43 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 25 Oct 2023 20:07:43 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 25 Oct 2023 20:07:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cpPIh94upXILVPHejBmShmPHmmyhpqKII0yzaweEsQ8ZI9CWyPJ/EN2Tx3DhcBGLj5b+Z5Pm7gR+jE20fdpUrZkkvML6ARkgeIWHB28w53VEaJ0OtUEo/q/u7iCVX2dec2CBw+VAgnJv0WiHUAdhq9BJm5+HBHyxAj/LhZAgOwFMzEBL4eJ6cO8jC634Ru5voQq3cIAjsK7NpGx4y9g5eObfSSgOI96CLjll2WF/Qi4HfcHvTtkXpnst9d1z4jX1FNINvCK0WR95isQBChEE2jzffy7BstAKNRe7MTkWDLaVSLZ4TaXTUrJuiAjBB3/LE7Q37gL6or1CiAwzxE4AAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4WJdSYgCI/Y+wf7TZMjasgWn6Lvak1ImihuhUxxGGvM=;
 b=SrA0fi4TuOXBdBmSuT6jNpc8TSjp+S561ZFbNjg7ZqzCtMxPKbfUMVHLwwheaT6lcI3R3cJjPV4LdWqvx6P9C15jhdhJxZCSdjTQyQHArH9XDNofvTnNprRsvZIuC3MsXM/Hk/UJ2IUkfHkyzGRbc6xgdu71vMR9cXoyt169p81gfnln+VUCLTqAZgrQgONYmPVKuk57MddUq8iTTCi3RkAdKHJiVvWjfHzwQX3Z5p1riFRoHDqXaanTGBFX3kiSBGssICrrRSxO8LFu58nbuUTIrgITU6DhKEzZa7mxkUuEo5EEXT5f6J+i/rUCNWWPm06mdwUgvG8e2bwB64sq5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 CH3PR11MB7389.namprd11.prod.outlook.com (2603:10b6:610:14d::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6907.31; Thu, 26 Oct 2023 03:07:35 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::f723:f4d9:c12a:5b62]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::f723:f4d9:c12a:5b62%4]) with mapi id 15.20.6907.028; Thu, 26 Oct 2023
 03:07:35 +0000
Date: Wed, 25 Oct 2023 20:07:33 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
Message-ID: <20231026030733.GK1327160@mdroper-desk1.amr.corp.intel.com>
References: <20231025151732.3461842-5-matthew.d.roper@intel.com>
 <169828069462.20472.17781629217464355310@emeril.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <169828069462.20472.17781629217464355310@emeril.freedesktop.org>
X-ClientProxiedBy: SJ0PR03CA0339.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::14) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|CH3PR11MB7389:EE_
X-MS-Office365-Filtering-Correlation-Id: c5fa5502-2943-4534-9f00-08dbd5d0b3d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XCs5VYO0ZvHsjkpBG/2xY5QCmhJYbqWPv92YXdL3LDYAxJvNqOpjA67xtit6ckFCAJMu0vE+MI5sfkHRJ322LJkjo4t+lnbaXWTVP/3smmFGTzTn79VTAcXYbpn7zSnqjQ0qV5Wb3Po4cdeqpagwyQ3HN1d2am9fIfu/lRCNEbFgoasG+eB54OFodswzvDP9m0JRqfwUC91EbU03JUYfe0PNthCEFCNqnt/BT5ifSsuzJbY5VDynoQaO68uAvq+JrjXqFdwaiTqkXpJRerRtcg6BjRPl+95BZ6NEyd/d6iUSRSpjoJmOVV4LJG4SaplWhi5A8uasjcUfgSyK3B6EQ7kYEh5eta1kLRz/VGIB9SVm2NsPf9vkBt6fN0HLkkTSzjVB6rWY0EaepoV4TLXP2i9pPfhBCwjkaWkkUUqpNZWP5umee+Mv03dn3cNakOKR3zwwHTp21J3q0PzfO7TMsM2fD58Qz5csCrB7evFeJb7KvHqBCIFBN31Q1XvEwdhg4LMdhVzt0bQGhHo3iDapzRqKhirNgN63OhSzC9r9AsYRXhjDqRZKNlsS4wusbDz9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(136003)(376002)(396003)(39860400002)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(966005)(41300700001)(8936002)(5660300002)(6486002)(86362001)(478600001)(2906002)(66556008)(66946007)(316002)(6916009)(33656002)(66476007)(26005)(6506007)(1076003)(6512007)(82960400001)(83380400001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fOLFsZG+vqZ8HpSGuBUVYozznJYPDwnv2/kJ757VWby8hPOlBf6Doi4y40Og?=
 =?us-ascii?Q?c1PuqqJd3PmhQPP0WsIh3UNGt1Sx1z9/MUKqDdmnihSaiSHTwnEey0rp+VQJ?=
 =?us-ascii?Q?9UzZfTrQCmd9Q1Z4LgDKiuo+NBsxjjGzQbIVbnfXAkRYrR9aAKteXRbsZfMJ?=
 =?us-ascii?Q?jBqyhm8eqcdYq2zYYeu7wPp4L9n4wBmKRZDuQIHU1xJL6wNIJzXID5JuNujB?=
 =?us-ascii?Q?R/bcMFMP8VPduJRT50CQAtigr1ewza8WRDvR4dTvDg8dO3g/QwvrYA/Eg9rL?=
 =?us-ascii?Q?xjETOv4tXrPvivnbN7Cwqx27XTjW97VpAxEn/BD1aLGlzSeebxk4GZZUX6My?=
 =?us-ascii?Q?yxVVBN2y3YmwvSdLsNK1sTQP0s4h8HKgWpoBxTRk+y3F/Cf89q9LClR0zIzl?=
 =?us-ascii?Q?cQOSudj7FJaRkO999JZk/VQaeYGSYeqrSLkwytBYgA60yXOpbrM1no9G9zOd?=
 =?us-ascii?Q?jUB5dLteM5O2jXMpXp2Ioo65NlGCgte/usIKiJgD/rvsfFIbe9vPtZr2lgFl?=
 =?us-ascii?Q?zLyR9uCCLs+NWN5n1WvV0Mswbm98zzkLIcs7XfN1fjuzwgcgtnuH6/7n4O/i?=
 =?us-ascii?Q?8iTrpdCv/X2wDsMlXGOGJhGQqYUt6S0fiGVmxCwy3ALfpzkgNKhCodnPeuKv?=
 =?us-ascii?Q?42bIpP+DwsxmCl8s+kGlsVsPq/MuG7yYL9vdEJ6r87HJZ3nm8n+jZG0Q07i1?=
 =?us-ascii?Q?KGJ6prh53f01S1eAxdVLvGYMv2ahLh03t43G2P2TPsuEikTSgbknKkMPuzHX?=
 =?us-ascii?Q?DdWKVmLKceHWcqQQ2r7ndZAmLfIk+Rb4ajafH92hN75dVokP/Vo06FUISjnl?=
 =?us-ascii?Q?QAdcCxQlFw6KpvrYbDUQ+3VWEGf6MBdW/TeEVyncoGC5KArrTzly5oBxF5e3?=
 =?us-ascii?Q?e8MiaN/vfT5aduKn4As/yC88nUMb7Wyj8uYerGjgSt0yzRdWNBF6X5hW3Mu4?=
 =?us-ascii?Q?DoXtz3egvv5MXfURcXZa0rXcR7ysrXgXuJorJ8k/8BNiEGtE6PFYwifuVoyT?=
 =?us-ascii?Q?HO9epemkJu/gmFVLYok4IaObaxvym+pk/pBnnysL0AtKd+pL205ury10ZPnQ?=
 =?us-ascii?Q?lzOaKGMwcPefuXLGan3D3N1/QkQj9rAdUhPztKTw9MeWLNhcwMX+25e9LJvN?=
 =?us-ascii?Q?DXsfVWdRcj2aFx8Cr6KYlbxTMFESdWo6P4QnyRwDAXhHtACesZZ5B1fwYLkW?=
 =?us-ascii?Q?CmJgYkBV7AqsEtQ9nqxptBmYpdo56iTP5O4ITVjZWZXkpQs7cRpUZJNWzqB1?=
 =?us-ascii?Q?bE0M2t9WTo8iWL3/V1FqZvyoonUq8BJCpTkdGfrUPNF78zDGXJ+V4FMLzGGL?=
 =?us-ascii?Q?nlKehkz9x7hlU5w3tG6CLEQ3U5Vatzao14FVtWn9UZpHDBfi4HUJUUfxIcHF?=
 =?us-ascii?Q?A1eORvLcxnscysy9zfWOq4ld1JEYko/ZRIsuZE1xh5oPQN8MFt+6KL+4Tn6V?=
 =?us-ascii?Q?OGsdYFyTK6HEY3CZg0TmIZTdXSaHmI6XA1Za20nooth2VfoHGHFI9Q0SFiLg?=
 =?us-ascii?Q?JVVVHUxO+r1HAdASQ4E0DodQ9rE2DiVSBslCrtc6R899JWDO6uoG6lpyrwM/?=
 =?us-ascii?Q?DtA2Vco5bS1CDMVsX4zhx8iVBIkdHoDzSGrA1r6n8K+mg3HU8d/P50qnK9gj?=
 =?us-ascii?Q?iQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c5fa5502-2943-4534-9f00-08dbd5d0b3d6
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2023 03:07:35.1727 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ax1xBhypewS0g/jnOR9VZImci1BZEzC5tIVs+gkg3mmnhhwCdEhRxZET1TR/1sHqXPtNrsamuyXNLrETV7PoMTPKzgv7cxDahKi3qDMv+EM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7389
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] 
 =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_Emit_SVG_?=
 =?utf-8?q?3DSTATE_during_LRC_init_=28rev3=29?=
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

On Thu, Oct 26, 2023 at 12:38:14AM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Emit SVG 3DSTATE during LRC init (rev3)
> URL   : https://patchwork.freedesktop.org/series/125255/
> State : success
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-448-bd3d7e8aa312ce25c5797388f753151f024bec02_BAT -> xe-pw-125255v3_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **SUCCESS**
> 
>   No regressions found.

Applied to drm-xe-next.  Thanks Bala for the reviews.


Matt

> 
>   
> 
> Participating hosts (3 -> 4)
> ------------------------------
> 
>   Additional (1): bat-dg2-oem2 
> 
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-125255v3_BAT that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>     - bat-dg2-oem2:       NOTRUN -> [SKIP][1] ([Intel XE#623])
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125255v3/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
> 
>   * igt@kms_addfb_basic@basic-y-tiled-legacy:
>     - bat-dg2-oem2:       NOTRUN -> [SKIP][2] ([Intel XE#624])
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125255v3/bat-dg2-oem2/igt@kms_addfb_basic@basic-y-tiled-legacy.html
> 
>   * igt@kms_addfb_basic@tile-pitch-mismatch:
>     - bat-dg2-oem2:       NOTRUN -> [FAIL][3] ([Intel XE#609]) +1 other test fail
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125255v3/bat-dg2-oem2/igt@kms_addfb_basic@tile-pitch-mismatch.html
> 
>   * igt@kms_dsc@dsc-basic:
>     - bat-dg2-oem2:       NOTRUN -> [SKIP][4] ([Intel XE#423])
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125255v3/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html
> 
>   * igt@kms_force_connector_basic@prune-stale-modes:
>     - bat-dg2-oem2:       NOTRUN -> [SKIP][5] ([i915#5274])
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125255v3/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html
> 
>   * igt@kms_frontbuffer_tracking@basic:
>     - bat-dg2-oem2:       NOTRUN -> [FAIL][6] ([Intel XE#608])
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125255v3/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html
> 
>   * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:
>     - bat-dg2-oem2:       NOTRUN -> [FAIL][7] ([Intel XE#400] / [Intel XE#616]) +2 other tests fail
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125255v3/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html
> 
>   * igt@kms_psr@primary_page_flip:
>     - bat-dg2-oem2:       NOTRUN -> [SKIP][8] ([Intel XE#535]) +2 other tests skip
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125255v3/bat-dg2-oem2/igt@kms_psr@primary_page_flip.html
> 
>   * igt@xe_compute@compute-square:
>     - bat-dg2-oem2:       NOTRUN -> [SKIP][9] ([Intel XE#672])
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125255v3/bat-dg2-oem2/igt@xe_compute@compute-square.html
> 
>   * igt@xe_exec_fault_mode@twice-invalid-fault:
>     - bat-dg2-oem2:       NOTRUN -> [SKIP][10] ([Intel XE#288]) +17 other tests skip
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125255v3/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-invalid-fault.html
> 
>   * igt@xe_huc_copy@huc_copy:
>     - bat-dg2-oem2:       NOTRUN -> [SKIP][11] ([Intel XE#255])
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125255v3/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1:
>     - bat-adlp-7:         [FAIL][12] ([Intel XE#480]) -> [PASS][13] +1 other test pass
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-448-bd3d7e8aa312ce25c5797388f753151f024bec02/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1.html
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125255v3/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#400]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/400
>   [Intel XE#423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/423
>   [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
>   [Intel XE#535]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/535
>   [Intel XE#608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/608
>   [Intel XE#609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/609
>   [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
>   [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
>   [Intel XE#624]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/624
>   [Intel XE#672]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/672
>   [i915#5274]: https://gitlab.freedesktop.org/drm/intel/issues/5274
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-448-bd3d7e8aa312ce25c5797388f753151f024bec02 -> xe-pw-125255v3
> 
>   IGT_7557: 18fc864d68d382847596594d7eb3488f2c8fb45e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-448-bd3d7e8aa312ce25c5797388f753151f024bec02: bd3d7e8aa312ce25c5797388f753151f024bec02
>   xe-pw-125255v3: 125255v3
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125255v3/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
