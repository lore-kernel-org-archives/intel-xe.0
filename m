Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79646C54FB9
	for <intel-xe@archiver.kernel.org>; Fri, 17 Nov 2023 23:24:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A5E510E013;
	Fri, 17 Nov 2023 23:24:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1078110E013
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Nov 2023 23:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700263450; x=1731799450;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=ikhrIXsWysa4KVo9l5Iwj2SJ2oor1Z8RRQ1kjEx2PtI=;
 b=OQh8Rk+S1Onm0I+Yf48rLML3NolzlfCwwxVc3ttbMhNm30D5TR99ZIUv
 qrEjSvVe/E5Ftc/J2k1AgQEZqJLgmN3rhkdb58O8BPN41xA7VKlp7Ls0F
 x+3HhNNlnmnTENuu8FHCK0aRdT/hg/yozWOIxaimm4JUcpn9H9aP5rycc
 zb2USX0plHZ1IVrD4nsXAMA7F985YPxDj5q+Ch4YS9++jyVeSFp6AjQ4E
 2zFsAPNJuwehKzE8YUa82QiEb4H3kR4v/nXSzqKmzMcTYqpjPqCrb3Yr0
 1MCm6hJauZ2lwBsL1YsA/5SKLo1iz5xDeWMUv4cnd+8Miyt0qIFBD64mc g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="395310303"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; d="scan'208";a="395310303"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2023 15:24:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="889387921"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; d="scan'208";a="889387921"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Nov 2023 15:24:08 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 17 Nov 2023 15:24:07 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Fri, 17 Nov 2023 15:24:07 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Fri, 17 Nov 2023 15:24:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ffNOlrLIdFJgr/pJsvPHmZz/5LNQRFQQyAA00rr+7VxCS6n+8v5zQWZsfOmg4i0ovTkMQlEz1qrREpCokolx/S5rPak0hrmd0OcPg3akhLArxs/dSK/jzZIz6wrWyN9tME1d7U2U+7uMu6gbDVzCNoSpga65Qql08pnO7Pcq4AMY/9J8SfiNqMUDisIldw+YqkcQd/Z8y3NCp1iuz77wzg+/T23JOLSkm+/e+RpAPM/loq6MYZHEHsNE/+prmz/9QGcH+eIDRFoYllcQVBnkUkc/xm4T0biEXoZhzdcLMKelv3I3Sn9K/SBexzMIWU/Jl4FPJPx5sCiYUMB2qS5D4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cjp+mugVZPM2/j3ZxGJX+bMvUqW5uAyCr2S5Pt03Vkg=;
 b=oN1KHLIex1EhJX3i5MmJMg7RZ+n8HBrv4Jbu6iBefZRxLQwQRfVwA5B9jjByXSwH1hJhbw1NU3tAHTbLxlJheCPruc5v5r5pKMpBvSBx6SlwBoKvllqVEDFf5YEdSM474hjhPJjh6axN2asRz4z5Eu/ujHlAXEbZxcYMgzFrCPyfvRj4stsWEXTkBwx7dOW4cOMie3ctYkYSi4/OFK0Rjx4qzUUyV+taddUQXLQ5Yx0z5gjipYxBsWxkL8ytHwnrRR6uieWRt+iagzy4rDRH2SXDch/qvshTQha3TDdJTD+4bp9XbmUPXyGYuEp6xqkH3n9z85EBWvkLpoxenB8Tjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by BL1PR11MB5555.namprd11.prod.outlook.com (2603:10b6:208:317::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.23; Fri, 17 Nov
 2023 23:24:02 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0%7]) with mapi id 15.20.7002.022; Fri, 17 Nov 2023
 23:24:01 +0000
Date: Fri, 17 Nov 2023 15:23:58 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
Message-ID: <20231117232358.GB1327160@mdroper-desk1.amr.corp.intel.com>
References: <20231115183029.2649992-2-matthew.d.roper@intel.com>
 <170025364141.7875.4636750333481956779@emeril.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <170025364141.7875.4636750333481956779@emeril.freedesktop.org>
X-ClientProxiedBy: BYAPR04CA0026.namprd04.prod.outlook.com
 (2603:10b6:a03:40::39) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|BL1PR11MB5555:EE_
X-MS-Office365-Filtering-Correlation-Id: 70249d34-1766-444c-327e-08dbe7c44803
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: slcEpfOksPQwB5dinb8VLQHtHtnpj3YF6u1/4BU0aHaLpFJWa3dr9yAShguF2ygtMupBvH8gF+CdzTdzkP+Kfp6+kLqYyA4ERvz7dZgQ/i2iBaTyrB1LWB86A+sgaULaIz7giY23WC9DaG9dARwVnKQhRA/GyYGBlzFHGDkFdPBmNaWGnb8ze+i4azLDJ/cL4LbayIboCBY9AUKObnhzX0ZSZEML5pgebDs43uBNzPNVli1MlTVicjRLnAZFJV1X3j/ytUSAxwrq27IVo7lykNC/OERFvs6BBp+lyYro181Hr/DDXYPn0m6TTY2dL4bvyo6yLVcS14vk5S1woEf9mIwNv94EiZVSciP4LTYZ1T+1QVEr5LSidA45o59WOPxTtaBJty9m9mQMGLbUm9zVBrurvD6sIfLzJmVgTqaNJzWFf3eTBnE/Slw/tyJujMK5+/rNDTtLphegZy0/LvmNtvfSgqXYRD0u5rYRvN4ijYTR1q1GWxIADlfWjYta0QwdGqSk5bkQyi5J7lUCRm510bdB8ppJ06AFu/hsFDNUig9vdSDL4lLKLW3WWHTFt9mHw+nxdN3h09eooFHsl/NqvRl1G+ZoIlBHo1QqNg+AlQ7Egr6/iNNHqsA3wXenZ6q6
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(396003)(366004)(346002)(39860400002)(230273577357003)(230922051799003)(230173577357003)(64100799003)(1800799009)(186009)(451199024)(26005)(6506007)(82960400001)(5660300002)(8936002)(1076003)(2906002)(66476007)(33656002)(30864003)(6666004)(86362001)(66556008)(66946007)(38100700002)(478600001)(6916009)(6512007)(6486002)(966005)(316002)(41300700001)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8x6bKxhLl5fKRK+8JuVAccMLqmymAtt3DG5eXAfO3X49dOWQyWEWMMsGw2Zl?=
 =?us-ascii?Q?XYjmDmlvcc76CtnQyfS/1ysx4g9ch7pdKh/b9DZJCVxJrzBtQTTuVIAVafYb?=
 =?us-ascii?Q?YjeAvaFnfsxMk0+FF3TWBRavJfzrkfegbEbbb/qzvbTDEuLukEW0V3qtFpwO?=
 =?us-ascii?Q?cxU7zyysCVgzcvhAQU15eudVQgk91fMM1x7XwUykjzMDtCLRIPDTPA4QsKs/?=
 =?us-ascii?Q?kUTBEunjy55GmQlG5jSf8KXZ+GNtsBX5FpbH2Pj4kY0ymC3MGW7CKnOk8DM0?=
 =?us-ascii?Q?e5BhTriPHQvtMgu1YZ2eprPqjdv1/m8pN8DAZMtGj3MuF6cUv19HVkxp9boo?=
 =?us-ascii?Q?FGad/ebeAlrBAX4Ryj1jQ6Anjupz1GEFQvgLnJiX6MTJPW1DlqeBE1jPBmEF?=
 =?us-ascii?Q?lKn/4YU9KYgHMafqiWOwGsTDWYfVglg1jijtn0X3zS78RKYw4wFw1vY3Ixaj?=
 =?us-ascii?Q?ni/P8rMJ40nY6D4Oh2pZox10BckpENIqikprMwUV4P70VxvsqtIllnsFL8wu?=
 =?us-ascii?Q?cKNs0An/z0IHbdcDqMLDKxL+geWRk1SZSsTlH8lWTN7QcoIieXTLZ9GYwo/T?=
 =?us-ascii?Q?RPLAaF1Zjm8JVVL3BfNN/otBTgzXQTLERUrl/kaEXgNUJiyOmsOI3WgS9A8X?=
 =?us-ascii?Q?4LEjhOM2wARSY7sS9A8QqGtCs0qd/uFbHSssFyk9Dn8J5v1zsBC05Uzxeebb?=
 =?us-ascii?Q?XBDrvNuuUlje8M1sc9YkuCqg5NjM43pulYHfsk2pL6WO5ptw2FIpYtjG/nkG?=
 =?us-ascii?Q?2YBRqFzWf+MyPgFHpD9S7n2zAgpGe5kjE3MmsBLTAtL84pJRGy51kmVbiBLN?=
 =?us-ascii?Q?SlegntxnsGqi9mZUwVW0CI52vielETrTFAF66oLOcVgRJHqmIK7ApdckbbZI?=
 =?us-ascii?Q?XU0wpeJluRtroqptGGn/RTaHMhpTX4crXCCdtdPuV+1NTfUhlbfqYi9tAa7W?=
 =?us-ascii?Q?3z16buoXCimKEHlDyzAVd1jtbl53VI9ruVZdzZthLwv3m//iHvA+AQgRqJJW?=
 =?us-ascii?Q?z3K9Hd3qWO2n4l3uBt270IBvloNwp7OwO+nCHn8vriDgTWgMxmQJA7Us2AeD?=
 =?us-ascii?Q?FN2WOrjpKYneLYTnv0t/aEk73rFUIF2R7pq9Awo0jsxSbQ4ZBb/nmxQAI6hJ?=
 =?us-ascii?Q?u+B+Y7f/KRpSS8BYJsxdL4tBbVc6pPcJ8pVVN3cS/wIKmTafP8qVbQwyYMiA?=
 =?us-ascii?Q?QIYlDIDdJVE3SYbxL82zaYCVgmzdzxVAinseLUTOacjt/LXmrqOmhgwgnZ5x?=
 =?us-ascii?Q?7S8Qa4kXq+/wuc0ZwYglJA7UGj77gy7DQzu+i1AUGaySps73OWFEDddkO6mV?=
 =?us-ascii?Q?B4hVlvPsEjQHRA18kMWSz5E4O9fwF6+NHu4mobMtloZnf/mQ1eY4MKfKcI1T?=
 =?us-ascii?Q?diAgIHlpyorCpZYatLrIX4e6TR1nwT8F9XcGAByLLIn6FPtS/7xWUVGWBkED?=
 =?us-ascii?Q?ecoX4pDgqp1z1l4MeL++tCZPC4MHOJllKR0PcVPFNGy/x1BuTog7Rt7vsumf?=
 =?us-ascii?Q?5Kl2i5d5o63fIxZ2ks0V/OfSzBqjorObUgn6Z3pqxC98W8GtymTWerXTB5pl?=
 =?us-ascii?Q?7E+ARFcTaB9swODN/7q/v2gUDMTMg+FlQzR1HYPDI0LU6lyyZPc4RMtowotG?=
 =?us-ascii?Q?Uw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 70249d34-1766-444c-327e-08dbe7c44803
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2023 23:24:01.1961 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: THRVw+q/mbk+MFQf6fLEx6Hg1YnKoMl7HVHWiyhPNc2iKmo5xWCEQ5MuqnreTIpbG0rIqe9kswcNfvUBIcYT9/weZ0Bbls8NoWUWypGEE0Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5555
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] 
 =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe/dg?=
 =?utf-8?q?2=3A_Wa=5F18028616096_now_applies_to_all_DG2?=
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

On Fri, Nov 17, 2023 at 08:40:41PM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/dg2: Wa_18028616096 now applies to all DG2
> URL   : https://patchwork.freedesktop.org/series/126489/
> State : success
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-502-3b8183b7efad3d97ab6cf401f3fc0d24b30b6d3d_BAT -> xe-pw-126489v1_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **SUCCESS**
> 
>   No regressions found.

Applied to drm-xe-next.  Thanks Gustavo for the review.


Matt

> 
>   
> 
> Participating hosts (2 -> 4)
> ------------------------------
> 
>   Additional (2): bat-pvc-2 bat-atsm-2 
> 
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-126489v1_BAT that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@core_hotunplug@unbind-rebind:
>     - bat-atsm-2:         NOTRUN -> [INCOMPLETE][1] ([Intel XE#764])
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126489v1/bat-atsm-2/igt@core_hotunplug@unbind-rebind.html
> 
>   * igt@kms_addfb_basic@addfb25-x-tiled-legacy:
>     - bat-pvc-2:          NOTRUN -> [SKIP][2] ([i915#6077]) +33 other tests skip
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126489v1/bat-pvc-2/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html
> 
>   * igt@kms_addfb_basic@invalid-set-prop-any:
>     - bat-atsm-2:         NOTRUN -> [SKIP][3] ([i915#6077]) +33 other tests skip
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126489v1/bat-atsm-2/igt@kms_addfb_basic@invalid-set-prop-any.html
> 
>   * igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:
>     - bat-pvc-2:          NOTRUN -> [SKIP][4] ([Intel XE#782]) +5 other tests skip
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126489v1/bat-pvc-2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:
>     - bat-atsm-2:         NOTRUN -> [SKIP][5] ([Intel XE#782]) +5 other tests skip
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126489v1/bat-atsm-2/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html
> 
>   * igt@kms_dsc@dsc-basic:
>     - bat-atsm-2:         NOTRUN -> [SKIP][6] ([Intel XE#784])
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126489v1/bat-atsm-2/igt@kms_dsc@dsc-basic.html
>     - bat-pvc-2:          NOTRUN -> [SKIP][7] ([Intel XE#784])
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126489v1/bat-pvc-2/igt@kms_dsc@dsc-basic.html
> 
>   * igt@kms_flip@basic-flip-vs-dpms:
>     - bat-pvc-2:          NOTRUN -> [SKIP][8] ([Intel XE#626]) +3 other tests skip
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126489v1/bat-pvc-2/igt@kms_flip@basic-flip-vs-dpms.html
> 
>   * igt@kms_flip@basic-flip-vs-modeset:
>     - bat-atsm-2:         NOTRUN -> [SKIP][9] ([Intel XE#626]) +3 other tests skip
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126489v1/bat-atsm-2/igt@kms_flip@basic-flip-vs-modeset.html
> 
>   * igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1:
>     - bat-adlp-7:         [PASS][10] -> [FAIL][11] ([Intel XE#480]) +1 other test fail
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-502-3b8183b7efad3d97ab6cf401f3fc0d24b30b6d3d/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126489v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html
> 
>   * igt@kms_force_connector_basic@force-connector-state:
>     - bat-pvc-2:          NOTRUN -> [SKIP][12] ([Intel XE#540]) +3 other tests skip
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126489v1/bat-pvc-2/igt@kms_force_connector_basic@force-connector-state.html
>     - bat-atsm-2:         NOTRUN -> [SKIP][13] ([Intel XE#540]) +3 other tests skip
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126489v1/bat-atsm-2/igt@kms_force_connector_basic@force-connector-state.html
> 
>   * igt@kms_frontbuffer_tracking@basic:
>     - bat-pvc-2:          NOTRUN -> [SKIP][14] ([Intel XE#783])
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126489v1/bat-pvc-2/igt@kms_frontbuffer_tracking@basic.html
>     - bat-atsm-2:         NOTRUN -> [SKIP][15] ([Intel XE#783])
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126489v1/bat-atsm-2/igt@kms_frontbuffer_tracking@basic.html
> 
>   * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:
>     - bat-atsm-2:         NOTRUN -> [SKIP][16] ([i915#1836]) +6 other tests skip
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126489v1/bat-atsm-2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html
> 
>   * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
>     - bat-pvc-2:          NOTRUN -> [SKIP][17] ([Intel XE#829]) +6 other tests skip
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126489v1/bat-pvc-2/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html
> 
>   * igt@kms_prop_blob@basic:
>     - bat-pvc-2:          NOTRUN -> [SKIP][18] ([Intel XE#780])
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126489v1/bat-pvc-2/igt@kms_prop_blob@basic.html
>     - bat-atsm-2:         NOTRUN -> [SKIP][19] ([Intel XE#780])
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126489v1/bat-atsm-2/igt@kms_prop_blob@basic.html
> 
>   * igt@xe_compute@compute-square:
>     - bat-atsm-2:         NOTRUN -> [SKIP][20] ([Intel XE#672])
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126489v1/bat-atsm-2/igt@xe_compute@compute-square.html
> 
>   * igt@xe_evict@evict-beng-small-external:
>     - bat-pvc-2:          NOTRUN -> [FAIL][21] ([Intel XE#389]) +3 other tests fail
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126489v1/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html
> 
>   * igt@xe_evict@evict-small-cm:
>     - bat-pvc-2:          NOTRUN -> [DMESG-FAIL][22] ([Intel XE#482]) +3 other tests dmesg-fail
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126489v1/bat-pvc-2/igt@xe_evict@evict-small-cm.html
> 
>   * igt@xe_guc_pc@freq_range_idle:
>     - bat-pvc-2:          NOTRUN -> [SKIP][23] ([Intel XE#533]) +1 other test skip
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126489v1/bat-pvc-2/igt@xe_guc_pc@freq_range_idle.html
> 
>   * igt@xe_huc_copy@huc_copy:
>     - bat-pvc-2:          NOTRUN -> [SKIP][24] ([Intel XE#255])
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126489v1/bat-pvc-2/igt@xe_huc_copy@huc_copy.html
>     - bat-atsm-2:         NOTRUN -> [SKIP][25] ([Intel XE#255])
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126489v1/bat-atsm-2/igt@xe_huc_copy@huc_copy.html
> 
>   * igt@xe_intel_bb@render:
>     - bat-pvc-2:          NOTRUN -> [SKIP][26] ([Intel XE#532])
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126489v1/bat-pvc-2/igt@xe_intel_bb@render.html
> 
>   * igt@xe_module_load@load:
>     - bat-pvc-2:          NOTRUN -> [SKIP][27] ([Intel XE#378])
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126489v1/bat-pvc-2/igt@xe_module_load@load.html
> 
>   * igt@xe_pm_residency@gt-c6-on-idle:
>     - bat-pvc-2:          NOTRUN -> [SKIP][28] ([Intel XE#531])
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126489v1/bat-pvc-2/igt@xe_pm_residency@gt-c6-on-idle.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_flip@basic-flip-vs-wf_vblank:
>     - bat-dg2-oem2:       [FAIL][29] ([Intel XE#480]) -> [PASS][30] +1 other test pass
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-502-3b8183b7efad3d97ab6cf401f3fc0d24b30b6d3d/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank.html
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126489v1/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank.html
> 
>   * igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1:
>     - bat-adlp-7:         [FAIL][31] ([Intel XE#480]) -> [PASS][32]
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-502-3b8183b7efad3d97ab6cf401f3fc0d24b30b6d3d/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1.html
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126489v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_frontbuffer_tracking@basic:
>     - bat-adlp-7:         [DMESG-FAIL][33] ([Intel XE#282] / [i915#2017]) -> [FAIL][34] ([Intel XE#616] / [Intel XE#750])
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-502-3b8183b7efad3d97ab6cf401f3fc0d24b30b6d3d/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126489v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
>   [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
>   [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
>   [Intel XE#389]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/389
>   [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
>   [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
>   [Intel XE#482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/482
>   [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524
>   [Intel XE#531]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/531
>   [Intel XE#532]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/532
>   [Intel XE#533]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/533
>   [Intel XE#540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/540
>   [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
>   [Intel XE#626]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/626
>   [Intel XE#672]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/672
>   [Intel XE#750]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/750
>   [Intel XE#764]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/764
>   [Intel XE#780]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/780
>   [Intel XE#782]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/782
>   [Intel XE#783]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/783
>   [Intel XE#784]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/784
>   [Intel XE#829]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/829
>   [Intel XE#926]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/926
>   [i915#1836]: https://gitlab.freedesktop.org/drm/intel/issues/1836
>   [i915#2017]: https://gitlab.freedesktop.org/drm/intel/issues/2017
>   [i915#6077]: https://gitlab.freedesktop.org/drm/intel/issues/6077
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_7593 -> IGT_7590
>   * Linux: xe-502-3b8183b7efad3d97ab6cf401f3fc0d24b30b6d3d -> xe-pw-126489v1
> 
>   IGT_7590: c484e1422184a3183d11f1595e53a6715574520f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_7593: 9e0160a387768ffdffbd429c948eea8c5821ce4b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-502-3b8183b7efad3d97ab6cf401f3fc0d24b30b6d3d: 3b8183b7efad3d97ab6cf401f3fc0d24b30b6d3d
>   xe-pw-126489v1: 126489v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126489v1/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
