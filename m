Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05584CDB465
	for <intel-xe@archiver.kernel.org>; Mon, 16 Oct 2023 17:30:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1BA810E229;
	Mon, 16 Oct 2023 17:30:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4053E10E229
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Oct 2023 17:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697477420; x=1729013420;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=KGs1Cn8fB5KX59sLsyutfzhLo06D55ODg3fXBbqvVyE=;
 b=Ysz+0jgWPxbqNbJFV99GsjYn1R3HfO9Wgtfi4gB5xDVtQKCJ0x6RviH8
 Qd1c9iQUYCgtZJBBesMxjDJo9fS+6pidoOSj9ARCyboBY++n9zaKu5IqG
 HhbG8qh6IP014z1s0Qx2IB0trnM1J+DD4RvFaPpYTSjJl9pNEotYaNRse
 CwCfzawZVXTxof50yFm3B1uV3Ao/OpDFovc5AT2GGyhcVCOvQGkgModFu
 /+UVgA+HfcPndB0wduTmekuqvv7AAdi9hzOGqisdWuDD1mhnOremDIYUn
 m96IbgrEhnbl3fNkN7AshNZiwAh46Lit5yRXU41K4rinR8vbKTq62lcH/ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="4202126"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; 
   d="scan'208";a="4202126"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2023 10:30:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="1087169563"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; d="scan'208";a="1087169563"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Oct 2023 10:27:17 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 16 Oct 2023 10:27:17 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 16 Oct 2023 10:27:17 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 16 Oct 2023 10:27:17 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 16 Oct 2023 10:27:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EDKqF56gwMguXsIFUs3rkWpJWgec8K9sfCoieoedB4yxIxosDcdIjAnTo0SPuqEfDoZk/jKZEoqvzNsR9O2j9OLtvoIDqlK+G0pmkFjrSyNR9EDySZOyrC3KOUWFC5eQ4bWVs7hI2Oq7sFwtE5R6z9nH2hyGkiWwQvYx8yiDmatyf73H9Wvi5xNqld4yNb4a8ROwQ74G+6659L0tldrdBudIY93PNmJYB/ExR3ys/gOgg/LGKbUskh9OovWWPZR6UBoTnkzd9lXS8hXYLP9hFTUYmgBJeoIkiiPvh57JNztc4hLMlcMMWQdSR9C2WjXXXJoTqqmEcwd47kEUTFQKsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MpT8qrfpzOD3sRGP1jkcGHNypwZsiaX6yp9FgFaOHbc=;
 b=AmbVMKr++kU9lYavBtu4oPjxYtAyrjPDORQ/tkUDAwKnumm7NVok7XxcvJCrDv8U/O5O3tKkrmpKvgwXdNu9n8jZofplncKFsZLtp/j4sLoIOwBgYmz0uGZt0yNsKTZEfnxlG8pMiasCDjMYWLx+oyIJnyp+Q98rsN58B975Deyf2qNj1a3cDi62TZlBkQyQeaOUYnGVf1ba4spmIvJwfALvP1lo6sHkKkbynfw5hgVnKXyr8o3ab3bgQU7+nYo4wnK/ZROpnYqnhqn0AofB4bbfQ9U9V0TQvMx64XtLiRM4XrCezYgJ/t3/SplkpqlCXqVQcuR/4df6aqw5m/wuzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 MW3PR11MB4716.namprd11.prod.outlook.com (2603:10b6:303:53::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6863.45; Mon, 16 Oct 2023 17:27:14 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::f957:c15a:9c34:71db]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::f957:c15a:9c34:71db%3]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 17:27:14 +0000
Date: Mon, 16 Oct 2023 10:27:12 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
Message-ID: <20231016172712.GP21382@mdroper-desk1.amr.corp.intel.com>
References: <20231016163449.1300701-8-matthew.d.roper@intel.com>
 <169747698018.13510.132356556182135666@emeril.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <169747698018.13510.132356556182135666@emeril.freedesktop.org>
X-ClientProxiedBy: SJ0PR03CA0225.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::20) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|MW3PR11MB4716:EE_
X-MS-Office365-Filtering-Correlation-Id: fbdb8a3c-1759-4643-b6ff-08dbce6d2387
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7eCzL9i0zuMJ31hIC2NpHn8+AcviWP9yOyxGenLFKhLtXqKy79WIapX2W9aBHTZulj3cmID+qpZdCc0FPGqGrsGwcyf/SNX5hUHF7/W8fnctyvZPIgYwdV6QqJBLeZi4f2aRgyZt76baHMlkWdeXdNW2bEq8WWnhulknUeiehbY+oxTze1GD/OQBSfW2WCAFZZL4TBPLDmqBI1rGOHusC3Fdqm4ebfryuaj+/OKFDXndg0OwD3ngeBER8mfqj01OQyaDD1PhJPk2mZ5JhMUOL/hOQ0D0YSUA5VyxhP3VB0Vu2hH5u0NxoZrLyfkouIeaDaSWgo/ytdqXEKQChnRBii+94hmg7VHxLw8pb6riyt0dkV1kW0D90RUo3AeAvVeQbBGTjGcj0GEKcXmN1Y5YAdKh7BQ1XlY+wddXZ2Gt0ojWrPi3YWTgUWgtDj6ZrE6y4ceflSbCcRnORNB8I/RkjjTDoWw+1Ny/D08WyYrFG1C2E5kHR6/UuRCwrTQwTK1OWik8ervxxhmYb+Wig9WQ5JHB6V2Dm0kzSC4YCvyL9IuvwQTUpsRnfb3tqb9uqve5/EaKRnlr6P481Nz0FCLM6g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(366004)(346002)(39860400002)(376002)(396003)(230922051799003)(1800799009)(451199024)(186009)(64100799003)(966005)(2906002)(478600001)(6486002)(8936002)(41300700001)(5660300002)(66946007)(66556008)(6916009)(316002)(83380400001)(66476007)(26005)(82960400001)(6506007)(33656002)(6512007)(86362001)(1076003)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?USVsC2B0M3NaaRF1NL19frxBos8vQ/NJ5DDDakUgs3L9eSYd7Y4kUZZnAAvZ?=
 =?us-ascii?Q?JdqzC+EbIzxV7CDT9zwqi2GaHOwNAtfp76owCWNDwV9MGNT753kEKD1wWdUI?=
 =?us-ascii?Q?QIWBLEod1F3tavuJKu5GC9WifLujplxw1O9ypTXdBOQqyKCTAM2eXfCVG/8M?=
 =?us-ascii?Q?3s2v/BKneQDW3Zisxy8+avGEfKp3kmUdpaB2HJ59mZnh4Yl+wk5bQc0B97I3?=
 =?us-ascii?Q?7BgOlE38/iBfCUVbp/rj7EQBhuEvbJB+r0V9jpLgK98IoX/KIh3Gcr4QU8tn?=
 =?us-ascii?Q?rOfP/QS1/NHwJPpO+oMqtI1L6YhuKtm+goD31hwrYuT5kGCFYK8ryBZdV1/d?=
 =?us-ascii?Q?An+7vvhrTsWVOMbLBYTIePINw3nkklUL2OocDI2FXOEGfw9IGufUK/fIfDU2?=
 =?us-ascii?Q?fY4P2iVQWISVL4X+S9lybRHTk8oCdz2hZxoWiLNWB71VkwuSmXtirfhxoDq+?=
 =?us-ascii?Q?g0XE0x39TnwBZ0f2QZUv8TFxOlBjQQQce5+iLED4kCnLNpnDXOCCR8ZkB3as?=
 =?us-ascii?Q?4n9WkDtUHchJJMBAcH0SxIy2nbxXa1cXgN/YFUV4xXro8QBIZSdJP5C6VZzV?=
 =?us-ascii?Q?O/yTelzo3WYNTbS652A7KX0kHcZPHiXrRr1ttAFMmt3V9Uv0SGXVlD2+723z?=
 =?us-ascii?Q?4fNUN8STJi8EJHXtErvvLWUf2V1AIf7f6ajilcCY4XEv40IxZfzrc72WOZyO?=
 =?us-ascii?Q?rXET5cWJL3oTlFFOANdOmRg8uEsXfIJ3CWnE9vWbfOBgUeLh8gblKyvwbzGB?=
 =?us-ascii?Q?jJHvJzByaOtLv2TJHhtq0Vv6XtfAhPXQmqDotuH/OI4MEQPbua4e6Kv3OgLC?=
 =?us-ascii?Q?4dhExPzEa3wzvewThaPeJyla8y0bWZaJuAzqilhqMGq3p4iH6c0JEC5+fClg?=
 =?us-ascii?Q?weq3P9c/ZJhVzN6fejXT1SPZNcftnzrPMP89BWQFOdfK07JYSAAfJcz8R2kD?=
 =?us-ascii?Q?at65MYkBkWyzSoGHRxAK+Be4Eifi5YkWTIRJMWH2/Bpu11+7wM0G4PyD/QLP?=
 =?us-ascii?Q?5T6TwryAorHMZ89fhl+ianeJ1jTVPaaLJLdxgb4X55koowwwv/lDT6sfEGzM?=
 =?us-ascii?Q?MEH3f8aLRuc0dPIEShAwYcV2HuWSuh0XQsbd9zK2Qm/j8PCQJa1FYlTpgiYi?=
 =?us-ascii?Q?0ZZgDKFTd5VFuZaAxRZ635Vwq8KXNNCR7uulHfQK0iac7+Z9Cn9X6XRzHBrv?=
 =?us-ascii?Q?ymbD2rHs9mxQoWrC6409xOfwhC884sool32m0mfYaGG4O70Ho5R3/matnYGy?=
 =?us-ascii?Q?vGVNqvrKIB9rOEdYwN7PnRMB6GxYD4rfE0NJGidO68ilpi20IVXG+FWMbG7P?=
 =?us-ascii?Q?e9/fBXHIzVcnrcFvajkETVWZAQWPeWami56FsdYfXwtlNOhBmBumh9wAtWcK?=
 =?us-ascii?Q?fE1XsOFrRjduN7KDvN2/gE/ECTIUw29FClhD+G93+MeW+uhSFhSMKsv2zi3m?=
 =?us-ascii?Q?4ilAqULO7nVCLC9wO8g3dPNskyNW685+NE2fxYFRJpUEolTO+biVRZeoPGX9?=
 =?us-ascii?Q?fOFPsW0cptQMKOSnRtbp4pQLhirXT65PJiPLdtiNdxkdVyD6fSNREoJa8mfo?=
 =?us-ascii?Q?jeStfUNTp0+WgrCkgsGUTxJqVRFh/ycEe++aReI23wMj2SD+CcrYK//bE4TW?=
 =?us-ascii?Q?dg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fbdb8a3c-1759-4643-b6ff-08dbce6d2387
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 17:27:14.7104 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d35y/bfFSEgltI/GzuEA8i5oZrSdSVVg9Jz8/zMFoq4m8XtTBJKHF6nA7/xXHKJeE/ReismVGsAOFmSyI874Ot9iusjszojrBTU74OCKcS4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4716
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] 
 =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_LRC_debug?=
 =?utf-8?q?fs_and_general_instruction_tweaks_=28rev4=29?=
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

On Mon, Oct 16, 2023 at 05:23:00PM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: LRC debugfs and general instruction tweaks (rev4)
> URL   : https://patchwork.freedesktop.org/series/125008/
> State : success
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-435-ab7cd1b4af95baba2d6ce5487d35ffda523e895d_BAT -> xe-pw-125008v4_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **SUCCESS**
> 
>   No regressions found.

Pushed to drm-xe-next.  Thanks Lucas for the reviews.


Matt

> 
>   
> 
> Participating hosts (4 -> 3)
> ------------------------------
> 
>   Missing    (1): bat-adlp-7 
> 
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-125008v4_BAT that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>     - bat-dg2-oem2:       NOTRUN -> [SKIP][1] ([Intel XE#623])
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125008v4/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
> 
>   * igt@kms_addfb_basic@basic-y-tiled-legacy:
>     - bat-dg2-oem2:       NOTRUN -> [SKIP][2] ([Intel XE#624])
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125008v4/bat-dg2-oem2/igt@kms_addfb_basic@basic-y-tiled-legacy.html
> 
>   * igt@kms_addfb_basic@tile-pitch-mismatch:
>     - bat-dg2-oem2:       NOTRUN -> [FAIL][3] ([Intel XE#609]) +1 other test fail
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125008v4/bat-dg2-oem2/igt@kms_addfb_basic@tile-pitch-mismatch.html
> 
>   * igt@kms_dsc@dsc-basic:
>     - bat-dg2-oem2:       NOTRUN -> [SKIP][4] ([Intel XE#423])
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125008v4/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html
> 
>   * igt@kms_force_connector_basic@prune-stale-modes:
>     - bat-dg2-oem2:       NOTRUN -> [SKIP][5] ([i915#5274])
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125008v4/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html
> 
>   * igt@kms_frontbuffer_tracking@basic:
>     - bat-dg2-oem2:       NOTRUN -> [FAIL][6] ([Intel XE#608])
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125008v4/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html
> 
>   * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:
>     - bat-dg2-oem2:       NOTRUN -> [FAIL][7] ([Intel XE#400]) +2 other tests fail
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125008v4/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html
> 
>   * igt@kms_psr@primary_page_flip:
>     - bat-dg2-oem2:       NOTRUN -> [SKIP][8] ([Intel XE#535]) +2 other tests skip
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125008v4/bat-dg2-oem2/igt@kms_psr@primary_page_flip.html
> 
>   * igt@xe_exec_fault_mode@many-basic:
>     - bat-dg2-oem2:       NOTRUN -> [SKIP][9] ([Intel XE#288]) +17 other tests skip
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125008v4/bat-dg2-oem2/igt@xe_exec_fault_mode@many-basic.html
> 
>   * igt@xe_huc_copy@huc_copy:
>     - bat-dg2-oem2:       NOTRUN -> [SKIP][10] ([Intel XE#255])
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125008v4/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@xe_exec_balancer@no-exec-cm-virtual-basic:
>     - bat-dg2-oem2:       [INCOMPLETE][11] -> [PASS][12]
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-435-ab7cd1b4af95baba2d6ce5487d35ffda523e895d/bat-dg2-oem2/igt@xe_exec_balancer@no-exec-cm-virtual-basic.html
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125008v4/bat-dg2-oem2/igt@xe_exec_balancer@no-exec-cm-virtual-basic.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#400]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/400
>   [Intel XE#423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/423
>   [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524
>   [Intel XE#535]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/535
>   [Intel XE#608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/608
>   [Intel XE#609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/609
>   [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
>   [Intel XE#624]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/624
>   [i915#5274]: https://gitlab.freedesktop.org/drm/intel/issues/5274
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_7539 -> IGT_7541
>   * Linux: xe-435-ab7cd1b4af95baba2d6ce5487d35ffda523e895d -> xe-pw-125008v4
> 
>   IGT_7539: 08e87a32fa113a9b6f30cbd9766fec346b53faac @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_7541: fcddb77c3f8a77020f7f3b2660a66cae27cfaa2b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-435-ab7cd1b4af95baba2d6ce5487d35ffda523e895d: ab7cd1b4af95baba2d6ce5487d35ffda523e895d
>   xe-pw-125008v4: 125008v4
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125008v4/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
