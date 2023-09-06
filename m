Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA74CEE14D3
	for <intel-xe@archiver.kernel.org>; Wed,  6 Sep 2023 20:50:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AC5310E1F5;
	Wed,  6 Sep 2023 20:50:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E1FC10E1F9
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Sep 2023 20:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694033455; x=1725569455;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=za2bwXvR0sx1okN8qONOKz+ikFVAqRGD6cHRu98F7mM=;
 b=cqQrL14e9YRKuw+vnlEG9Br+gJQR0Q8Kp8MSBKyJJu7WgnZ/tan16UYl
 0RbT1eEgJau+khw5p3LJvF8BI5XWcwS821UJt/lvosJHpIwDNSz+J753g
 jsrB3QslcmtMJ5mwtCkENwBYoJHgqcInXB0LuVe0Tsb86mJHvnQgif148
 xesIYnjlI8gskDRSVpGQypeE+6FPU1uNXkd4K6c4+43xZyRGDB20898N0
 bMsCl1usS9l8CQqcuLW1ovC2oVbQA34uEZ4TbsX1w5mruOn33uFkWAIMJ
 /N2G8PvOL6TM05AQ32q63N+AiZNLY+PLElVpLYDMDHONIoezIbgE4bfS/ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="379889980"
X-IronPort-AV: E=Sophos;i="6.02,233,1688454000"; d="scan'208";a="379889980"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2023 13:50:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="741714553"
X-IronPort-AV: E=Sophos;i="6.02,233,1688454000"; d="scan'208";a="741714553"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Sep 2023 13:50:06 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 6 Sep 2023 13:50:05 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 6 Sep 2023 13:50:05 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.104)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 6 Sep 2023 13:50:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kZ/G/VTAZlAsfnBkCxvO1v3nAishY4F5XmY2Umydgh3U46Mr6ii8KN/eBO+4WOn4VIKK5NRXbFaiKkQmgDceq4pNdHtDF5hbV7tloKBh3k5nSaKU9XCJyNJzf5Ggni4GwJ7NNhQRw8Wh3sxd8JqulIZ+JaNwsHCsCCwPwtOHk9EU+eIorYJr/AJJKvKHNIfcZNDDYHmRxefyLIwjxjNJai5zS+OHHpr3ODa5fA91KKqFaXVdTgxRt8DgW7jBydrCr0sqUGTAECjVT5/RE99hjk1oqlPmrpcNSJVFH18ol6mgMzUXl8gi7k2wgzdlbBKpDVc7U07uEZqi/NejnOS0sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cp4AYnlFO+MloV5xn8vFsnHnc35qmdpPkwCVB+wVMmk=;
 b=UGX1RpaTFdWirUAPX6/KKw+kaynH44iw2gaiw6el0rXMUkYi4mrKbjfm9ijPSbHkCdwoIje+WzYgTEvO42BCXZ7Kf2PHPLDuzl497QvL4KMeIrThvltRr17XF06HxfAuSYpAFMY000wczAs1SYGoUAgr99Us+zwVOtQK6Nqsr31CGRYGckNqoLoARBfH4snghhafG1lBCN0KBiOMGCpgLf3BlwwNwL4Z0+rmXhXDgvX2Komxsk8mLc2/atjWCFUyAyp1V7HaPNyRlM059k5wiTa+PkhtZQXYt8KrZXcv10T8c66VlWKYyKkc4i3+xv6tSTviUPr8NwDu08x4hZQmgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB5261.namprd11.prod.outlook.com (2603:10b6:5:388::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Wed, 6 Sep
 2023 20:49:57 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79%5]) with mapi id 15.20.6745.034; Wed, 6 Sep 2023
 20:49:57 +0000
Date: Wed, 6 Sep 2023 13:49:55 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
Message-ID: <diyxbzamuccprdppcicllahgvkovvs5mjmfiucimrrwkikpeur@2q3ta42nq2ie>
References: <20230906200049.49674-1-gustavo.sousa@intel.com>
 <20230906200049.49674-2-gustavo.sousa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230906200049.49674-2-gustavo.sousa@intel.com>
X-ClientProxiedBy: SJ0PR03CA0295.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::30) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB5261:EE_
X-MS-Office365-Filtering-Correlation-Id: 28b44747-be64-44c1-9e43-08dbaf1ad4c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uxzOV423x27joQowWiIwV2Qg6tWhiw9v1qyRmkRFajRdeKZueH69q2WaGblb6Uqa3UjqHdnr/c/IBxi2djRlB502U8MOCTsgTJnnEawD4RW9d3rGE1deFHBZAjJnFCF2PokUiH0FssDuJOgM6j/tUcPq7vCWTf4Kfl0Pogl6LL1hHANoxP9U7W63CdmJmwv6F+tXiM/jQ6s2bqjge7CN1Ddfid/mzoPJXRyTrPqqlp32ClKorBT1T0oaig9vVHFIdnCscWTP5PPuyBWY5CEP3VNFjGPSN4EZe0IbdriRprvRbRRb+NKQTa5eaCoCVgs3VGSR3+HXuy3hpPnjOK1v/Vn3d52ke85wozCTyRH/n+hBOvsCk169fsiqXiA8W4d4jPYk6wkTfp+lzbL9sTDumjFtWG/97DYf7jR6VgNXfme8P2KGO//x8CAEcz5Q5rR/3S4gBiylwwyFoZPSMeUxm3Ald02tJpp8xBsynjaV6IL8oOq/qULvR9jTM0It0LZnfRI6+NqGdlZQGxVGCD3/1XJC4t0hlXYYwj9Agv1cG7GNAmyleuOoA2MKEix1ljnN
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(376002)(346002)(39860400002)(136003)(396003)(366004)(1800799009)(186009)(451199024)(33716001)(8676002)(8936002)(6862004)(4326008)(83380400001)(66476007)(66946007)(66556008)(6636002)(6512007)(26005)(6486002)(478600001)(6506007)(9686003)(41300700001)(2906002)(316002)(86362001)(38100700002)(82960400001)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lq+7eZv99RbBnlmG1Dz4/aNmXzoK35Y3PBx9psNzlrPxfXRs1uv9KA6EZdio?=
 =?us-ascii?Q?jMcFclIJ6fu0/qK8w7H32zTJ115/y/m0nP2DpfuMYjPYEOeVBelzfmbLEtuy?=
 =?us-ascii?Q?8rY20jgfvj7yLWohpbhKQtGYhf4QyoQ8Q8TMA7mjQXaQpn5cln+vigRNC0Nr?=
 =?us-ascii?Q?yXp81mXpyhx5sIyu1y9QVI4naNh3qZP43s2V7E40IVWCToqOqXbutDyRNHOP?=
 =?us-ascii?Q?Vz7WrjLu6dT/CWJcEwFII/8iN+1Ml3RzJgSH+1l7FI4UvPfKf+QyCy8uYxG6?=
 =?us-ascii?Q?B0qKYls3I7buYM1XsLAv7bLJeh8yL6mlKL+14oCA68EbQ3ufT6BOxh6ERq8K?=
 =?us-ascii?Q?FMiovdqNuvMx4ajgwbbGvYv2FRFOYnaSUK/FBydC/qcugRx1xTfV/QAnFqIF?=
 =?us-ascii?Q?xVGC4PiIg2/xKcAOufbJXaESuy+yLLc2ijAJTOrWvECzsXUSV+TSU1V6grgx?=
 =?us-ascii?Q?Hw3+KDM49Gp0Cdpv94gzO8lXP+1EW4WPxlCMEXXdXl0M3G+IiKuizBtWUpWE?=
 =?us-ascii?Q?37ARO//6CMMnC7SA4O2WlQutiu/axyz6qwhQYp9sdw6Y4rttW5aYrThbTCCD?=
 =?us-ascii?Q?6ZiKxxDiOsl73lORWZkCOHcl1VYhKwIf9k/1XR+UOR/H6VqRcf5RlB33BZFl?=
 =?us-ascii?Q?TBWZF3FrLfBKtp8KNKM5IHTrJhJQbmxsCwBsS1EYat06DltP7EWGGUvgOFyI?=
 =?us-ascii?Q?GNKyu1q4IUg4LhKxuLPueEZXvZZ3WamCo7QBxO33pX6e7MRAKuK6Dn/JlXDf?=
 =?us-ascii?Q?BhOAcbl5Jp5T5FtT7tN8rnDFGnUF8ykbKlYg1i8snooirRe6zEZylJyLGygS?=
 =?us-ascii?Q?LzI38AZb261+nghi5yO9w4ZrdVOyiT2oXjWgHZLmPzu6r3oOlgI6tgZkFYsG?=
 =?us-ascii?Q?Do/J6yrpoctjPvsxmLbbKTqw3T1YWS19x1xUzn9Mlg+ogx6tOq3KlfCQm2ue?=
 =?us-ascii?Q?+andLPacnQpwPg14NZVHRvGfsYXlw6dVlBI0UlDHRuGTAqsBSr/2WVt9aP+r?=
 =?us-ascii?Q?3VQ+H+edgStAIWTo24/wRha7lkgKrytjTv4P8ZBup1Pc2VlVGJ/cWJYCSPO0?=
 =?us-ascii?Q?S+NbKQJHzI2gAfpKTf5BSQ0AQvnSfcAzjeF8phMeNyNu/dKCur9ylOYiBtQE?=
 =?us-ascii?Q?by3rR/cNKoRg06bGF9CC7ARqsTigT8cqh8GvZg4nOVsz+LCxGadiO8Q343ep?=
 =?us-ascii?Q?jkKZ0m/ZDl0oKwahxO1aEJuvpGnmVThGEOl3SZlkEPxBwDgz+eT8rAkbeJtN?=
 =?us-ascii?Q?xh6gfyBoQfARDS/agC1IX+NnTKdoXuDcZPPlGG9yII9EvTKIyX3yFDr2N4HM?=
 =?us-ascii?Q?umiQ9bEoHpDKMmpvT1b27iDAA4ltuTjkHCgAByy+ZsdB6w5810T4w3j9mfNi?=
 =?us-ascii?Q?96QB+tLW6oAZ3Uqqw2SoE5/xESQZPUBVrQkdhfIXabSFmaCsJVF6p4UKF9Tl?=
 =?us-ascii?Q?VxaGkseKO7bBGF6L50xSJ0RpW5Zt2Ko3ftbWM3DQ9gVnZq7VvMSq7qCybAIm?=
 =?us-ascii?Q?eI+6eYAsW8t1bDVFNSvep4uEF/RBxxSSVC4xttgprynDhjYJQtbqbQ8UxgUy?=
 =?us-ascii?Q?uCjnqHtg/Gxzv9CTW81wDEG5r8h4Z51K7SLIXgAFhlgmPdqoSIT8ZhIYxOey?=
 =?us-ascii?Q?iQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 28b44747-be64-44c1-9e43-08dbaf1ad4c0
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 20:49:57.8406 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A2QNIJZMnvS2/aGBp3RZwRA9523cyyYdaE3fgt7T1NN4jBNrGEbCyBHQXg80zCB5RqRggkKTe74R5xfqFdY5HxOwdYr+zqMY3OvOrFTr5HI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5261
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/1] fixup! drm/xe/display: Implement display
 support
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

On Wed, Sep 06, 2023 at 05:00:49PM -0300, Gustavo Sousa wrote:
>The function xe_display_driver_probe_defer() is supposed to return
>-EPROBE_DEFER when not yet ready to continue the probing, but the
>current implementation is actually returning 1 instead of the proper
>value, which would probably keep the probe operation to be attempted
>again. Fix that by returning the expected value in case we need to defer
>the probe.
>
>Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>---
> drivers/gpu/drm/xe/xe_display.c | 5 ++++-
> 1 file changed, 4 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
>index a453946ad108..bf475f9a7e14 100644
>--- a/drivers/gpu/drm/xe/xe_display.c
>+++ b/drivers/gpu/drm/xe/xe_display.c
>@@ -45,7 +45,10 @@ int xe_display_driver_probe_defer(struct pci_dev *pdev)
> 	if (!enable_display)
> 		return 0;
>
>-	return intel_display_driver_probe_defer(pdev);
>+	if (intel_display_driver_probe_defer(pdev))
>+		return -EPROBE_DEFER;

but now we have the odd situation that xe_display_driver_probe_defer()
returns an int (with < 0 as error code) and
intel_display_driver_probe_defer() returns a bool. I'd rather convert
xe_display_driver_probe_defer() to a bool and then force the -EPROBE_DEFER
return code in the caller, like is done by i915_pci_probe().

Lucas De Marchi

>+
>+	return 0;
> }
>
> static void xe_display_last_close(struct drm_device *dev)
>-- 
>2.41.0
>
