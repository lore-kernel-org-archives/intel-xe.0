Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B081FC4332F
	for <intel-xe@archiver.kernel.org>; Wed,  1 Nov 2023 22:24:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E11910E06C;
	Wed,  1 Nov 2023 22:24:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32DC010E06C
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Nov 2023 22:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698877485; x=1730413485;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=F4dJRvShxJo+/wOCw+TIqWOeEgov/YCh/cUHeI9oYdI=;
 b=jGpzDRScDlSue3fMaymLO1ySY9mMGIz79TB+HsjKxwYSDCI34TFkKG9s
 A/ZRPNzoqZ5BTQghj/yqhjQ4YHC91pwLOx4ONmfN4DRo3Zgd4zwsGVdn/
 kItDC4USInxyrZOsWRT/7Nxw2NsJ+PprYZnNJftZePZAQjZ+C3qDOyeKS
 XLpGGM2MBcjAwb38X1NG0+bfvcVKQzbVr275U25aPfzL1fz/nY3NBsvUC
 oozeyattsRKSCQ5zv4P5SvrbtS919EOS2b7O1mzbcEzZvioTa05q4GUE3
 61436ypxGhMEaSMRkaS8G6xIDzRex2D5X/9YveHnNbsR1UAITh+nUZwq+ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="388401510"
X-IronPort-AV: E=Sophos;i="6.03,269,1694761200"; d="scan'208";a="388401510"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2023 15:24:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="826907516"
X-IronPort-AV: E=Sophos;i="6.03,269,1694761200"; d="scan'208";a="826907516"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Nov 2023 15:24:43 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 1 Nov 2023 15:24:43 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 1 Nov 2023 15:24:42 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 1 Nov 2023 15:24:42 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 1 Nov 2023 15:24:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=awlGYNqIlX+W0MldfCprrvCIaO1vYih3Cld50+ZPV6V2jtso76bR6sAVDiCeyvJS1vzjnO00Fcyy9dW6HTr2rujwQ1L3GnabOqF6Y7rj6JzbK70SdITzSUzznxDd9+A23udaqrDPLjTvQ8incZXWuCmGZNcCW18PMZCtvhcfYSILR9DEdPw48+pqawWmns36Zr3OPFZArdkB3xc9XXMAkDFxtCFT9DdtJ99H2QT0PMMC7OEnox8EKE4mbbh5leGBN7Z9MPjIuCwCdMTsQsNONIy/OM6znpjHKjFgZ2D00vVUCXhztLjPNPR+P6/t8AGMzcpooBDpVDVIVB62Op5zMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EcGphfhK2lAJdIN7qxajsViYDz/KJKex4QbWPnpM8zA=;
 b=c6mR6oWf0w6GqmrEMWXTENZvrTUim7HRfpx2bZuTTf3kPAsJfBjYzVe0MJpRs/yP3HKlyPXKgwBgNAB0QaD383oTKenBHSIN8ceA8Q7k7a01YJNdITSSKxPzc9jK+4SV1dObQ0LJV9DUXYxc4ssFj5np4U+pp8Stv+pShwbsAnzXo59MSLFmsujMkKmwjiG7pLGVflGM/3W51sBj+MhnWszHTd2eSnYn8mgF46OP4JRm+iOY2lPTE0uhEp+3pLZ5tbS0dYUkRldW3SOAQEeUEYcs1NSp23QfFzHVAU1fe9LbNuil0xzDsbX0SL0NtyKilSBBt51wJBMTz+9JJZoJJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7854.namprd11.prod.outlook.com (2603:10b6:208:3f6::5)
 by PH0PR11MB5659.namprd11.prod.outlook.com (2603:10b6:510:ea::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.29; Wed, 1 Nov
 2023 22:24:37 +0000
Received: from IA1PR11MB7854.namprd11.prod.outlook.com
 ([fe80::929d:7372:b3aa:2541]) by IA1PR11MB7854.namprd11.prod.outlook.com
 ([fe80::929d:7372:b3aa:2541%5]) with mapi id 15.20.6954.019; Wed, 1 Nov 2023
 22:24:36 +0000
Date: Wed, 1 Nov 2023 15:24:34 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
Message-ID: <20231101222434.GC5757@mdroper-desk1.amr.corp.intel.com>
References: <20231031140151.303296-2-matthew.d.roper@intel.com>
 <169876821927.27659.4177551660418300939@emeril.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <169876821927.27659.4177551660418300939@emeril.freedesktop.org>
X-ClientProxiedBy: SJ0P220CA0008.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::17) To IA1PR11MB7854.namprd11.prod.outlook.com
 (2603:10b6:208:3f6::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7854:EE_|PH0PR11MB5659:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f079dc8-caee-4244-a6a3-08dbdb2954cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VjdsCa8SDyjIbhg2OYX+ldz5cml3a1N/lo1axHxM7IP6qWewZtdv/S0FvFzGCWHRA+lU/6hZOTJsWaL6svDmNr0ef8x7gzZFPMqOn599o9nxC3p9mSkCpZAH2GwW1iOZJgLJWYa2ciAn1GzochitUUU21W0ah4v2HrXzBUQBq0xofmCNi1Q2NNgEn3Sap+iHkzF0uVb0OWU2V0kPjawaDa5aHf3xU6y3nZcF/LJaszauA3ty6hjSguMnGyT+ExRpmia5AiKtUA0yf2oBXlzfEPrXkzdBacUBe2HpGD09iaKcj+oLZHlP3p5IJhAkff4R/zGVVmu2c/M73ejhXKkB4eW4th1GGshMr+ax2LSMBzSdWQVjJrTHkctlPI+1boV1k05AyPBFffU9CLj568JOHyUBnRN991qe8y8mF1hwvN8i7Ww2lGoSBuzT17N4RbEBXepJXRtL70BbBfoX6voT9EsqEf8GH5oiYqO2sIrZs82SC3TOTczii5JDsX0c72KRtw1vO2sIzgTR19m+TZevrw/3jqkhaYKc4bLPICCMCCrNMawqiUa4CMINmlehkZc6oPl/f36+9NfF3+ymDXdXy7iThHG+Fi0qMg/MPXAiUqU7yP4B59PNy2000H6iVWBgzvjufniuCNWZ00MVHjryOQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(39860400002)(396003)(136003)(346002)(230273577357003)(230922051799003)(230173577357003)(1800799009)(186009)(64100799003)(451199024)(8936002)(1076003)(26005)(316002)(6916009)(966005)(41300700001)(6486002)(6506007)(5660300002)(478600001)(6512007)(2906002)(83380400001)(38100700002)(66476007)(66946007)(66556008)(82960400001)(86362001)(33656002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7g6a/JGxl1KR3otvfAGafSZqWMXi1a0gbMztHjd11UNiAdXOB5UdI1r/r1Ko?=
 =?us-ascii?Q?EAZCcIAy9fQQrP/CxUjLtiG3Ldaf3GEuz20b6AUpUHHtqppwYJdKZg7ileBF?=
 =?us-ascii?Q?hV7EUDPw1gLl2RwvyvS4kf6a4F1J09yv5arwmycW0NEJVuww15VnIIcJQw6T?=
 =?us-ascii?Q?fyYXg/pjK92P/Usk7GeIdKJB72aM00nRGdmJsJtQtET/lWy2/BY6hmCgcg9n?=
 =?us-ascii?Q?rosduBzqvxmpEVA+jsLp8tVCEBgGyU3w0rAk5s8h9LQiqDgQIVfMWzEsy6ee?=
 =?us-ascii?Q?iZ9ypNZT+YQ/UfNc+hOrQd5pU1NOXdKDJ1/ZzJ5h0My0dfk9JWwr0CUv43G8?=
 =?us-ascii?Q?ap4Jah9f0xZ5boMYlEaOQKpxT00UX8MEwzNGoHlHa7EQnVWJWpsq4dwe3V2l?=
 =?us-ascii?Q?TwFZUxgSDTqXn0vfMevHxk7PdKXeoxv6oVgDJR462ClgpPkyiBhBzffkManw?=
 =?us-ascii?Q?bCQZEChJ2kLd0qt8FuCmsjIYLqb5ThcM0BX4FM54gD6PuvcgknmCSoztVvQO?=
 =?us-ascii?Q?EoaYlVyx9n+vV86t/HKr16kBIIQXLzXDY4dY4kMvn2eSauuW8lxeh+eC13jK?=
 =?us-ascii?Q?VBE0mwPz/gh1NRV1AS/xVwAeVxJ5so/Sg6dwaKDHDYzZvrsZrNWkhybBtn/B?=
 =?us-ascii?Q?r4yoaSMnD+Tvu3ihKW60Gms84zjBR4pHolOrbdejlaGx8S078LeB+2IWMvbS?=
 =?us-ascii?Q?F+p1IXOjFsYaHRmqlFbZF9g/2/metwrvi5DCXVfuxbGg6MR8jD+OaAmMeud3?=
 =?us-ascii?Q?7Nn9ddiIiTCyKSeNQYXnBNlRkqRKd7/gskKj4aro+0R8ytKl2GkBCtthiIq9?=
 =?us-ascii?Q?WzH/LFXWUwUDWOt5EiJllb7EgnOmCU33fDHrpGGp/nHtrmmT3pduH+FKJyEa?=
 =?us-ascii?Q?OqmZ7sqIYfHmBPMuV6Bk0cIFbSgXTwm/szV5HUj40kYvHKcCwv1y/K9/S54R?=
 =?us-ascii?Q?OdI2XKt/3lbooKWSHR90LKk4oIY9DBok6kAfp4J4st0r3ranTzovAYnG+g5P?=
 =?us-ascii?Q?+51ayLXW4Pc14noRDB75+LyAhLtSd49UEm7JifvDtg6wvi+ZmumDj8qCKO89?=
 =?us-ascii?Q?ycY6YDDhBibVtWJGtbF9r0qy44NQNL+rP0zqHWx3aRQSF7lp1bOySz6Ixwr5?=
 =?us-ascii?Q?rc1yUzRWBcw/HA/rWSrnj1Lk0eETBExUoJubAJAah9uIGuXH50JoygsofkBD?=
 =?us-ascii?Q?OwNopRW4xE/giiSZof32Dpxiv4QmTLEuadJOLYAl+UzOvu3hQpnN3bzlW154?=
 =?us-ascii?Q?ngNdmtbCvChwLM8IUedlPi/nrhhi9mhBGvrY/T53pPxIeQnmBr4fg+AN8xTU?=
 =?us-ascii?Q?xXhrVBMXnqlt+oBlDuLbKn3SzOEG5ZZXUvgTd5V+sglsrDtUZ6P2XrzPQoB6?=
 =?us-ascii?Q?IrmSC9MijK9TiLh5zsmYEg4GVsycFer/mUnIOYFOZ0pyzDc42iSxSrqMsphI?=
 =?us-ascii?Q?eB+BJ7gLTEEypkaxSyHy/aoILcT9SJMvkuZNQTKTf88NmZOjatHTeELO5KdM?=
 =?us-ascii?Q?ennjDzLmKT3yqwnPAENxJsEWnyq/jOvoOhX0N+uhRNq9JyqB8nqxRB3MQEaW?=
 =?us-ascii?Q?m/s01oOuguOLlCHMGFrp2R9oW5BglkXUZ74PT2UxEjbwM2PkZhvOIwkETwAq?=
 =?us-ascii?Q?CA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f079dc8-caee-4244-a6a3-08dbdb2954cf
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2023 22:24:36.7687 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Eux0N0UbGq0xf6sFNF6saeznOGC5LqMMl2w17PBWIcWQpzCoLjhxka3uU12QZMRmmfS8NtcJeLxONxWUqpqkmeWWg7LSMke4FurWLNBoEP4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5659
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] 
 =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe/xe?=
 =?utf-8?q?2=3A_Program_correct_MOCS_registers_=28rev2=29?=
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

On Tue, Oct 31, 2023 at 04:03:39PM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/xe2: Program correct MOCS registers (rev2)
> URL   : https://patchwork.freedesktop.org/series/125813/
> State : success
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-458-87f169fc90d74a88df33e0b34c02240308625a99_BAT -> xe-pw-125813v2_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **SUCCESS**
> 
>   No regressions found.

Applied to drm-xe-next.  Thanks Pallavi for the review.


Matt

> 
>   
> 
> Participating hosts (4 -> 3)
> ------------------------------
> 
>   Missing    (1): bat-pvc-2 
> 
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-125813v2_BAT that come from known issues:
> 
> ### IGT changes ###
> 
> #### Possible fixes ####
> 
>   * igt@kms_flip@basic-flip-vs-wf_vblank:
>     - bat-dg2-oem2:       [FAIL][1] ([Intel XE#480]) -> [PASS][2] +1 other test pass
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-458-87f169fc90d74a88df33e0b34c02240308625a99/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125813v2/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank.html
> 
>   * {igt@xe_create@create-execqueues-leak}:
>     - bat-atsm-2:         [FAIL][3] ([Intel XE#524]) -> [PASS][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-458-87f169fc90d74a88df33e0b34c02240308625a99/bat-atsm-2/igt@xe_create@create-execqueues-leak.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125813v2/bat-atsm-2/igt@xe_create@create-execqueues-leak.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
>   [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-458-87f169fc90d74a88df33e0b34c02240308625a99 -> xe-pw-125813v2
> 
>   IGT_7566: 7566
>   xe-458-87f169fc90d74a88df33e0b34c02240308625a99: 87f169fc90d74a88df33e0b34c02240308625a99
>   xe-pw-125813v2: 125813v2
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125813v2/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
