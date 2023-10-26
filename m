Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0987EC0032E
	for <intel-xe@archiver.kernel.org>; Thu, 26 Oct 2023 03:08:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C868A10E742;
	Thu, 26 Oct 2023 03:08:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DF7910E742
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Oct 2023 03:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698289696; x=1729825696;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=u+IAwTNR6bq2WlVnmqT7E7Gy7F8X9vgc2qAlfL7FLNA=;
 b=ZNB94PjdkB2Kc1T9fdOuYf7871A9U3bmhBMYs5cw1o5Bvl9Eftz5uSKH
 hfD8LNYVsdrl2a4uMHtvz7pCYxkKhYONf9eGpKebf0SLjjfIaGI8UfCXx
 9gSobUrL3X/Umxcq8ib+SaLHI1ulYYLw7TH/mu+jn7t2JIVB83IJiVx+t
 +UntMUbRNUJ04tu0x6H6h/Y0O43WexnmRUZS5bkyew99Gsa9Z1W/eKcrK
 QtsbBRtWo9ZUPO4V0DN80CZPI0/36ehJMGeoTG25fuc+551680XDlG2Es
 3Zl6dhgkyByIwO40oGCBADpM9dJL3+HCsLJzjdXfpn/kATypM/mo/vMhp w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="6068451"
X-IronPort-AV: E=Sophos;i="6.03,252,1694761200"; 
   d="scan'208";a="6068451"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 20:08:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="762673694"
X-IronPort-AV: E=Sophos;i="6.03,252,1694761200"; d="scan'208";a="762673694"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Oct 2023 20:08:14 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 25 Oct 2023 20:08:14 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 25 Oct 2023 20:08:13 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 25 Oct 2023 20:08:13 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 25 Oct 2023 20:08:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PzgA9Z9V3ac+aazKq48YcNxXuorC40INAEG+QzNjYv7u0lbz+6gS63JjoaMK2Bk7dqJs1ZvIq9TNOPV7cTBN/vS8goggBBdbJl6QpGzmSBJtdOcJuzb0op4aBjEd1c2vNjh3ubg7+hAt11E6wWRCuxjoYTrlksDpu5IcA9aHwiLbPKVU2kpIBLDZkiEVYO4sHtdYmznSzCwA+cynmpYyoQ3AD3memfMkLFS5tbVevh0lXvhAeiDxDBXj8wxeBBXKA0TU12kI8RJd3wEMktLkZFjq6xvKzKjDJtH+u2caMLcHSrfXPQTw/ebo6qLMpfgjPQ/7bAX2Y98tLXaW6M0RRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ametfIzYXCElU33F0S6QwktMnLtcX2K4AtWVE4WoeJo=;
 b=oejxxektdfjlz8kfcdF9wsJ5NvmTyn1MoJS148YUsBJPnutgUCUIC2fBaS3NWQcXW5C5mHS1Y6iqVMcJtpKun8ja9d4UcdQqkp/ErEVdeWotJ1Evpfp8+mUYSyavyPWRPfUmD77H4HXEScOTPileei0+VyQ+lkjM14oKgY++I02cV3cUYLVMoJy7KJBu/hprL8N2AeIThKob9AxZ9vhqrvGyoHWGmHcxYsanU7EcJLr5OX9+y2A8x2ZYSGB78uX1i3zEh/bKNSkkhIzTaRn6omLgkJnOuN0ZIor9UkAVKfdRGp6lxh0sg5JxstmgSI4yxtFfWwmXUDq027vvXlIE0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 CH3PR11MB7389.namprd11.prod.outlook.com (2603:10b6:610:14d::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6907.31; Thu, 26 Oct 2023 03:08:05 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::f723:f4d9:c12a:5b62]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::f723:f4d9:c12a:5b62%4]) with mapi id 15.20.6907.028; Thu, 26 Oct 2023
 03:08:05 +0000
Date: Wed, 25 Oct 2023 20:08:03 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
Message-ID: <20231026030803.GL1327160@mdroper-desk1.amr.corp.intel.com>
References: <20231023204112.2856331-2-matthew.d.roper@intel.com>
 <169828346643.20472.14503968158103102340@emeril.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <169828346643.20472.14503968158103102340@emeril.freedesktop.org>
X-ClientProxiedBy: BYAPR05CA0063.namprd05.prod.outlook.com
 (2603:10b6:a03:74::40) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|CH3PR11MB7389:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a16faec-e409-44c9-a159-08dbd5d0c5fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: buyG+9K5LJ5anR/Jt+pu8KrMOC4aK4tUp9rVDw5NTu3lQtATvAP31VaChQOaQOy2lt0sD+3f5/7Kh/oITgYPyt1UxnG80Gi8/+6IqAU3P1KydpBnLtRQAL4/BgedNanYucPHHXPSsVkkK7CuZ7SR2lfXVYiZDSuGvcFCU8xOy5LhipB1tOjpSVuZHaVqZ236hUAdV0ZGvS84sebxSjy3TG3O7YZ1ck3Sfsa9jsqX7WDjBAe8g8aDRx+T12esW0O+rA0xIXzZcH8pnb6ku2KDvt49V5FW5RA6851tTxWdqrIDVoKrdEZxVk6dGViZ1Qu87I4BUB30pvdGLr91SZRc+Gp2dZVDte1wmiwG+A0tAahUZTWccs8fi1+qX4x6/++ukEe/BaC/uxv9otUfSMoBygjBT4ibCtkbVe1YvX3nda93YY6NBhom1oKJhWIBhefJGIJ+KCcGUzzs77Lva5QfkB0PWP4ethKiTWlC4xG6RuK9OWagQLWcd8kP0NDSxDVMXVn25qVSGhFKcTjnia9gzdCsgYtE0b3ltc+C/hITVoNjsXRU1aZcLW3NTtsA++pbQjhay2983tVJzGEnuhxz8Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(136003)(376002)(396003)(39860400002)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(966005)(41300700001)(8936002)(5660300002)(6486002)(86362001)(478600001)(2906002)(66556008)(66946007)(316002)(6916009)(33656002)(66476007)(26005)(6506007)(1076003)(6512007)(82960400001)(83380400001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?L3JZ2wL8eILkATkLv7LlWKwbwece469/BTXsZnNp9nhFOOFK1Z9rdRUKW5AR?=
 =?us-ascii?Q?BiUOyeNF9eSzkO9M+p6vg3XNMHIohn0RVPev9wz7Sudr+YAQ8E6hWJ34gmB0?=
 =?us-ascii?Q?hqhXhoovh/duKlSAzXj7tmUW85XRjj7QpaeOZp85OfHz6g0zIPnbvjrXjmYg?=
 =?us-ascii?Q?em/yP4XNoQsVTaoPzclzDLMTA3I3q7k/ov8o4Od7/oG+ufQU69D2T7zdfrKp?=
 =?us-ascii?Q?wEJahdX/5JGcCpr9pO8DzXX7V5FwfMXm2qp9x8htXbwrERKOpMykn+4y337K?=
 =?us-ascii?Q?zzhJ1TT3HdseNGE4CGkGt2ILsXwTSyWfRQuiWHcqrQTkQ3kdpxWuYQSY9Zqh?=
 =?us-ascii?Q?z5Edvh8N5LpLsJ83PUveDmgoXy1/4wi2/GpKtO481r+eewcpSRenXeoVpbem?=
 =?us-ascii?Q?y8aS8Hk4Koax4YRcIyzX+GT+LUvIX971WM2Tt7LYq1jHBb2XtVVRPjpjyoUE?=
 =?us-ascii?Q?Se2HuLdkblBe4F2LA9kjJ7/R90edLFkWr8vadWCcmcVwqI1EuJZHzluhqCjQ?=
 =?us-ascii?Q?0bMgmjbRkpY75DcYh/prOrlOY36jBWY12c8o35VqF7Rg6X9gnmIxkce9PNMX?=
 =?us-ascii?Q?2MbkBn7NlQKOhgF+K2sylyJpi/CVjEYLaHt3LqDtnv0PopgtIpvcBc9jKF/T?=
 =?us-ascii?Q?G1prCClcem8VsxeqIAshyCN20iGzwmUANe/TbIs4o828ejgsLfWxnu+CRLJq?=
 =?us-ascii?Q?0kdgtbo5ywb2/pJpA39d0T8LKL5/cZ/w0OU03JM0McaU/yQhGQwBLSzRaWA/?=
 =?us-ascii?Q?YqlbhWYblaLq2NPq83wvP9jgZkFy47THmkjUiYU8Fvex/8xrraFlO40Vt6/y?=
 =?us-ascii?Q?lFb2CW2wHh0lailJssxfF2GeEQAmv6AVNTtTzxmuU5Mu4v8Flhymn3cKbML1?=
 =?us-ascii?Q?1z6W6PXXl0x3de3MOnp167h9ljXdcCRtTBtDHIvpiieZHYP93S3+hw6fArrx?=
 =?us-ascii?Q?hQrgDyslehohghbU/FtQD//KIpi36WDTOYDnZIdUdVuBFGcCnqvxH5F53gas?=
 =?us-ascii?Q?JOicCASBPn7xXU5kA9JtGYJx7Sbn3NncxsuakQpx4vR1xj83I7xblKXcHJZ4?=
 =?us-ascii?Q?Hyx0gGEZvNaBl14Q9A9Pu4H04zkU7mmXR+8dJeyEHpQ1olacn+U8w/gY19iT?=
 =?us-ascii?Q?HvcqhmksUq1vJeIWgag89Hn/C8imCDuDadk9kEG8e2S1ZnVl10jZeMuWvn3G?=
 =?us-ascii?Q?fz303kfr7gAryJr/o4HPUusHByEFDwxJUVPQezEnLh47QFgDMyJBFULmIJ5g?=
 =?us-ascii?Q?JhpwyYpLDT4eEHowaRSjTU5yz9fYku28gWcweBE7/n362pK8nt/X/r2wmBNQ?=
 =?us-ascii?Q?lFtDgLufshqDo50sTKRkS+PAtqcxn0M75n/k95/X7SLxirPe9dQt+EiU5ivS?=
 =?us-ascii?Q?23JXuGtDpamRRPDksgAQUEKVA9MdEqiNCWb8G4KzO0ezI3jFXbuapXiN+pxP?=
 =?us-ascii?Q?f1s1cKZKp2ccKkr1zNzQTq1TGajLEt13WloU2FjcvINmhrB4gbO99psrz041?=
 =?us-ascii?Q?pJ49Yk5Ri85UEs2KRWGj9QvGfbYIkF3YEtq3P19tdqNH1Zcax3wQebSBA8Nz?=
 =?us-ascii?Q?ybyJrLIVbbZv2meFM9q+NZ79p01yH9W/msQSXj4o3zLqYRK0Z+Gb+CoNnVxS?=
 =?us-ascii?Q?YQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a16faec-e409-44c9-a159-08dbd5d0c5fb
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2023 03:08:05.5859 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LpXw/tvIwjhmJ/R/J90noY8fBSgjL727VQfKibn2hVp78CYQ1upbKstVHfksUMcUGddpddqQY+oE6udm6w2DHGHc6M32jtBNMpMPO/t9SfQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7389
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] 
 =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe/mo?=
 =?utf-8?q?cs=3A_MOCS_registers_are_multicast_on_Xe=5FHP_and_beyond_=28rev?=
 =?utf-8?q?2=29?=
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

On Thu, Oct 26, 2023 at 01:24:26AM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/mocs: MOCS registers are multicast on Xe_HP and beyond (rev2)
> URL   : https://patchwork.freedesktop.org/series/125478/
> State : success
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-448-bd3d7e8aa312ce25c5797388f753151f024bec02_BAT -> xe-pw-125478v2_BAT
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
> Participating hosts (3 -> 4)
> ------------------------------
> 
>   Additional (1): bat-dg2-oem2 
> 
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-125478v2_BAT that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>     - bat-dg2-oem2:       NOTRUN -> [SKIP][1] ([Intel XE#623])
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125478v2/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
> 
>   * igt@kms_addfb_basic@basic-y-tiled-legacy:
>     - bat-dg2-oem2:       NOTRUN -> [SKIP][2] ([Intel XE#624])
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125478v2/bat-dg2-oem2/igt@kms_addfb_basic@basic-y-tiled-legacy.html
> 
>   * igt@kms_addfb_basic@tile-pitch-mismatch:
>     - bat-dg2-oem2:       NOTRUN -> [FAIL][3] ([Intel XE#609]) +1 other test fail
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125478v2/bat-dg2-oem2/igt@kms_addfb_basic@tile-pitch-mismatch.html
> 
>   * igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:
>     - bat-dg2-oem2:       NOTRUN -> [FAIL][4] ([Intel XE#773])
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125478v2/bat-dg2-oem2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
> 
>   * igt@kms_dsc@dsc-basic:
>     - bat-dg2-oem2:       NOTRUN -> [SKIP][5] ([Intel XE#423])
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125478v2/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html
> 
>   * igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1:
>     - bat-adlp-7:         [PASS][6] -> [FAIL][7] ([Intel XE#480])
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-448-bd3d7e8aa312ce25c5797388f753151f024bec02/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125478v2/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html
> 
>   * igt@kms_force_connector_basic@prune-stale-modes:
>     - bat-dg2-oem2:       NOTRUN -> [SKIP][8] ([i915#5274])
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125478v2/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html
> 
>   * igt@kms_frontbuffer_tracking@basic:
>     - bat-dg2-oem2:       NOTRUN -> [FAIL][9] ([Intel XE#608])
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125478v2/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html
> 
>   * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:
>     - bat-dg2-oem2:       NOTRUN -> [FAIL][10] ([Intel XE#400] / [Intel XE#616]) +2 other tests fail
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125478v2/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html
> 
>   * igt@kms_psr@primary_page_flip:
>     - bat-dg2-oem2:       NOTRUN -> [SKIP][11] ([Intel XE#535]) +2 other tests skip
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125478v2/bat-dg2-oem2/igt@kms_psr@primary_page_flip.html
> 
>   * igt@xe_compute@compute-square:
>     - bat-dg2-oem2:       NOTRUN -> [SKIP][12] ([Intel XE#672])
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125478v2/bat-dg2-oem2/igt@xe_compute@compute-square.html
> 
>   * igt@xe_exec_fault_mode@twice-invalid-fault:
>     - bat-dg2-oem2:       NOTRUN -> [SKIP][13] ([Intel XE#288]) +17 other tests skip
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125478v2/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-invalid-fault.html
> 
>   * igt@xe_huc_copy@huc_copy:
>     - bat-dg2-oem2:       NOTRUN -> [SKIP][14] ([Intel XE#255])
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125478v2/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_frontbuffer_tracking@basic:
>     - bat-adlp-7:         [DMESG-FAIL][15] ([Intel XE#282]) -> [FAIL][16] ([Intel XE#616] / [Intel XE#750])
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-448-bd3d7e8aa312ce25c5797388f753151f024bec02/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125478v2/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
>   [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
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
>   [Intel XE#750]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/750
>   [Intel XE#773]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/773
>   [i915#5274]: https://gitlab.freedesktop.org/drm/intel/issues/5274
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-448-bd3d7e8aa312ce25c5797388f753151f024bec02 -> xe-pw-125478v2
> 
>   IGT_7557: 18fc864d68d382847596594d7eb3488f2c8fb45e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-448-bd3d7e8aa312ce25c5797388f753151f024bec02: bd3d7e8aa312ce25c5797388f753151f024bec02
>   xe-pw-125478v2: 125478v2
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125478v2/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
