Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53B73E784BE
	for <intel-xe@archiver.kernel.org>; Mon,  2 Oct 2023 15:19:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF8A010E2D9;
	Mon,  2 Oct 2023 15:19:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A16C910E2D9
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Oct 2023 15:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696259987; x=1727795987;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=bg9NHeMjyKD5ydMJ4F9DeORBlC5Cu2KlzsmeST3tn+k=;
 b=czpYteclLf945Y1rr/O8ABrM9EJbIvbhG9gz2q2uXM55cnzliuj3U229
 SWruLmum5svHJhrTAxU2k1idRAMWq4CFXV4eFm9QwnJ1pA0WcaLg/DUKk
 pz8l3qfCy/Gz+pI0Vi8KLCCY/bVRTqBuy5oLDNrdXSpbpVZTc8NXpSMmD
 xiQlcnSszFw1d26ukjE2p/Bq2vjuHNPJMe68ECqLv2U2GmqiIFj9ckrKZ
 r/TUJj3QGIvetA+eVSuaiVUHs/57ZgFFNvrPpCYWJRwJcrbBjD+CUj7bt
 JmXxlE1mCOJj/WqXTQaL+d8H+/PuUcRD7Z7Ih+Pv0JbgiAW7ANAQK18D/ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="1250077"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; 
   d="scan'208";a="1250077"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2023 08:16:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; 
   d="scan'208";a="1541217"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Oct 2023 08:15:30 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 2 Oct 2023 08:16:10 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 2 Oct 2023 08:16:09 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 2 Oct 2023 08:16:09 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.102)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 2 Oct 2023 08:16:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GxCLOaoLEnIY2CldIaVHaQnMRXOZthZiRUpE2hoQF/OYH3R9phj2PL5pJSe9ep0I3QCRZeDXWXv68Q+yODGhEEY/gA6ya6wmcwfTr+qaNRftxfokQe+CWPBuNaElH2diyBYyTJF0h+CezcI1knKbOfYIuQ10BtYtPULCyg+SICXrY40YxOZ6rSh9zjqAQF7NOaFq0Clpk5FRkh+fCxOSXRFbsbuL142lnjc2+6J7ddVVYl1uyYRUTD67jXZ9FQnhPQC8DzzgA3uP/98FK6kzobCjPxefPX72MSODw2066Xsd1fOMZ2hai29QI9YyZfICCkK5EmPocnMXVOBgsMCYRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rvyt51B4lB1qnb9BvCr48ZezGcyi0Y09ajAXa6+ljg0=;
 b=oQVi7VdSBDn0W/CO6jND8F+52lH0UvSpo0Fi50hDUw3tKtUMqisidje0m5rw1tpxDnLShe9RKMObQzF84WnLmKRMobah4UCbWO3fWGNJt7oNUfepBFwS6yQfwT96X0WNN6X0PIbI/yV+4BHPv6Wtql8JpKn8SEotYs5P04iT5DkrRr4yW8O5jESGIwWyxt0ziDMtxcm3BjIc2JfTcWXFYmyOJfO6m2GT7sYQ+u40MUSD4wLFHWJomwq+09lcdQV9sT20P0QRM2ljU4qqRvJ5FS2XeJX6pX6TjEGX84YlzlP7FszuIieuZTT73jf45zBEU/b7wfS26UI8KhZuyVaJNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 DM4PR11MB5359.namprd11.prod.outlook.com (2603:10b6:5:396::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6813.28; Mon, 2 Oct 2023 15:16:07 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::14ea:3a78:f950:d6d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::14ea:3a78:f950:d6d0%7]) with mapi id 15.20.6838.024; Mon, 2 Oct 2023
 15:16:07 +0000
Date: Mon, 2 Oct 2023 08:16:03 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
Message-ID: <20231002151603.GN2706891@mdroper-desk1.amr.corp.intel.com>
References: <20230929230332.3348841-2-matthew.d.roper@intel.com>
 <169604066762.19042.2691889181545520131@emeril.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <169604066762.19042.2691889181545520131@emeril.freedesktop.org>
X-ClientProxiedBy: SJ0P220CA0002.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::10) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|DM4PR11MB5359:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ecbda82-e40b-46f4-d39e-08dbc35a7ff5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rKKlFKtxwrxIjetdEzjcmb3Gm/tyBv8jWfMKasR0vmMZ+Dt/WA4WsXO1NdD7cUngsHop333hwTnVdjDnph4WTIZcjkOToPhqTmewjirPUOwU3dl498Uqq+zmoTfMnw8HtoSYRoJQBb2ysppCsDFQp4chNuF8ZrvLMlG8OanTWb8hJW1VUcSDHmIv+OVMczQt+fNoKexnctuBpJJbXGLcMzqbLclBDLxsAy8wpYLpbn/ldJSwu0FQc/YiPmVru9JA7jJTAxRAc2kBXuJ0rwBVeScM0Q6/BkDRa5d4aK9kD7YVsrluD2bP9LewqOTe0UaUOPwJGg/SFhBd1EqD6HoDBIe9ENmOyjFWceUHc/ybkg3AAQlqpicyOXoInI9EujO/5OJqI9ORi7EjBoD6GYKj6pVC7OKl2YAt5Y8wadcc01WKaXEQAxDlMQor/POlhwQ8cfGW0YWcL0tBy3RbE5cV2NI75DRXlFYvfR6JW78KTR9OzZ4bxiUwEkwKczStLwwcbRC7/zTutOULX18MOVrgCSlUf+OxPqDWCoiQy1m46EcEPLtMW8KXLtlczndZSI9t1SR7z2Nh3jhrGGzbcphP9Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(366004)(346002)(396003)(39860400002)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(26005)(1076003)(6512007)(38100700002)(86362001)(33656002)(316002)(66946007)(6506007)(41300700001)(82960400001)(83380400001)(66476007)(6916009)(5660300002)(2906002)(6486002)(66556008)(6666004)(478600001)(966005)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WW9W++aFJ+EHbGh9IPzRIz+yWDidW0yG5U33NfBESAt+TZkwWCNgGxXmnzoy?=
 =?us-ascii?Q?aaGjz+MiCB7W/VHI3SjfINw+EjikEjvWfTe9IF+RdxwoU/dLE3TbZ7TwONTL?=
 =?us-ascii?Q?vhpoL7D6EY6tv3XxY3lK2sXvDBoxESV6jcceTBK4c655UdF6obNw3AeqTBHP?=
 =?us-ascii?Q?Ev25Utm+JknSykK2GDSeQPokqH0fi8Nyrvwe/E0B64aaBnxRipwkTALTx55W?=
 =?us-ascii?Q?m5O4Ae/Wl8gKROZ509oH4+IGnO7AUbCRyLqLwZMA7nsZ78ZhWva/Dofq9EwR?=
 =?us-ascii?Q?FWGrTC0x2SECOs/Lcm0nLVjWplOCOs7rrQxWV13PrETzQuPlYP2oyWjgQcHW?=
 =?us-ascii?Q?WDCjo4LxpZL1f0o8Ft0y0C0Vdb8iIBJovytMaRihD54911m6Oo348NGNgYzQ?=
 =?us-ascii?Q?lijbpXIgyorOLbh95XxSkQ+MTI7LctiwrOUapkYIc9VMwm9v4Xlu0dEt1d5f?=
 =?us-ascii?Q?2sArlkEMEEDddrB9NO7Lbll09Fb07QfV2uWWL+Y7ZKRpH9ORajBsEw6HSNIw?=
 =?us-ascii?Q?0JBJUnSXG1rRV7Le1jZDR+PuN0VCYp2Y7P8E4SslAI5Xw/EksDADas4SQS0o?=
 =?us-ascii?Q?U0W6+WuYSqZjuONtYz+lXSsKb3Wm/Bdh7+Og8vp+pNq9EnIflOLvrz8AoNoP?=
 =?us-ascii?Q?EWLRUs1nx/9MuSx+k5yeyzr80DsPdAjAdFLkwzPHPy6q/VmLY5xYmxdweOEJ?=
 =?us-ascii?Q?SSMYjYwDXvu0JxNp9tFmA7nNwkLnN+BHfmmkGQRgA9JLsNXCkX6T8ZXjysic?=
 =?us-ascii?Q?lNwn3j8ByxXtGf8oBnsPJ9/WwIdhPRZeppLDD9b8R/FTyFEeL5G+z01QrFtL?=
 =?us-ascii?Q?2IBRYELIQ5TVAKzcKFtv0ujZVWB4GwpD/WK3QeJLl7faPk/jCL2WrWdS/yT9?=
 =?us-ascii?Q?tV0VWavYcRAd4hSUOo8hXWX3O7eAr+Yyc3XOncdnLLy0lCmPmemdkxTtvuz9?=
 =?us-ascii?Q?EpVDrm4nefB4VnhPvwUJcg45yci81Mqusw7OxE4ihgNGrxZ7DGP4e4kRsUQs?=
 =?us-ascii?Q?WCQCYKbT6DmRiBztkOShYdebCZM+BQHb+EcfV9fL0aoCloJcKPaUKu65LZYt?=
 =?us-ascii?Q?MJfy1+qrmZiCs/tHwpkK6e9lZx0ZDOPPiae7ToiGtY97ANXckBK77wJI4g6+?=
 =?us-ascii?Q?HM5BgH+2BT2RLsFwqEzvmBCtJxLMVwM1Mot1SRihkSQuX/s+a6D12YOa/zHi?=
 =?us-ascii?Q?fi5HWLcLpWPlLs6X+jrJyTwd3yI9JVRAmCYX2UpOaOQFm2N6KEKCaOIBz6Oo?=
 =?us-ascii?Q?aedL6C/+LhftXvaqQx4T/PfkWW/nDlSliXZFgO/oqf/4PD6PTV2Wr4tZcZ4Q?=
 =?us-ascii?Q?l7ofHbSnueX67JPVm+tNzuBU/WRLLEY3SE7mBXKJGo07WWd2woMmHEJBQ6C9?=
 =?us-ascii?Q?pfW2D+VQMSmkNEu6+X6aZxlhLOH/KJIr5OjyYakN+iip4Zvu7brNEcPUjAZL?=
 =?us-ascii?Q?9g7Iyph8qKmbW6JXNpALZY2sdG8oZRJ3w+69e7kvrj+srdIq8tHIulXDP46/?=
 =?us-ascii?Q?EqGm+F4StpapMelG59skAD3a/HLefu0/fL1XCEFrjgjREUiycuHiNQS58USd?=
 =?us-ascii?Q?LPnYZYtQzrPgZHY6mj0x9dwyBrReSZaZc4960BtVe/Hed1AEK1KRooutsFGG?=
 =?us-ascii?Q?Uw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ecbda82-e40b-46f4-d39e-08dbc35a7ff5
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2023 15:16:06.6776 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6mhNTHKuGtNi7NiAvdCrOapuPnz0zZx7LFHogvlvEa+uZfOyPi+ZfVIbhuH8JzOVtK/CZ4dQEgf5dDrsmkFp2QcXqjXX/q9rU+C6NIwfPxI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5359
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] 
 =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for__drm/xe/t?=
 =?utf-8?q?uning=3A_Add_missing_engine_class_rules_for_LRC_tuning?=
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

On Sat, Sep 30, 2023 at 02:24:27AM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/tuning: Add missing engine class rules for LRC tuning
> URL   : https://patchwork.freedesktop.org/series/124478/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-404-22fcf2404f56a8e7aea6734298e0b2b265136313_BAT -> xe-pw-124478v1_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-124478v1_BAT absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-124478v1_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (4 -> 4)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-124478v1_BAT:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_exec_store@basic-store:
>     - bat-adlp-7:         [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-404-22fcf2404f56a8e7aea6734298e0b2b265136313/bat-adlp-7/igt@xe_exec_store@basic-store.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124478v1/bat-adlp-7/igt@xe_exec_store@basic-store.html

I can reproduce this failure (very sporadically) both with and without
my patch, so it appears to be a pre-existing problem, not caused by this
patch.

Applied to drm-xe-next.  Thanks Lucas for the review.


Matt

> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-124478v1_BAT that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1:
>     - bat-adlp-7:         [PASS][3] -> [FAIL][4] ([Intel XE#480])
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-404-22fcf2404f56a8e7aea6734298e0b2b265136313/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124478v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:
>     - bat-adlp-7:         [FAIL][5] ([i915#2346]) -> [PASS][6]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-404-22fcf2404f56a8e7aea6734298e0b2b265136313/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124478v1/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html
> 
>   * igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1:
>     - bat-adlp-7:         [FAIL][7] ([Intel XE#480]) -> [PASS][8]
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-404-22fcf2404f56a8e7aea6734298e0b2b265136313/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124478v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html
> 
>   
>   [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
>   [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-404-22fcf2404f56a8e7aea6734298e0b2b265136313 -> xe-pw-124478v1
> 
>   IGT_7506: 4fdf544bd0a38c5a100ef43c30171827e1c8c442 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-404-22fcf2404f56a8e7aea6734298e0b2b265136313: 22fcf2404f56a8e7aea6734298e0b2b265136313
>   xe-pw-124478v1: 124478v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124478v1/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
