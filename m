Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A553E743C9
	for <intel-xe@archiver.kernel.org>; Thu, 28 Sep 2023 22:36:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F8DA10E6BC;
	Thu, 28 Sep 2023 22:36:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF0A710E6BC
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Sep 2023 22:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695940566; x=1727476566;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=p5CIotCVr5ox9dti/KOOVvjSZw9/DNLNgQg+00tcXGE=;
 b=OCbOROwnjtpORvgaFxKxpHfnllKQz8B03fmspA5/thsY1VM0cm8PzYRr
 tMfwd3Iq/y0LH9mXuGU4TlmL1jyPUB+1tmaqEBn0xcOslqDgO0ZtiDDq5
 ppo7jvwkXIzA7IkRYz9fRqbHlM2HZedN5tjtIN5+1X7hRz4ktAdkaj+tr
 fok652dH8DQxqz3EzrSktWuNwcw0cX/sEnFs5MZce0Y4xlWeeqtm+RxOB
 Np6jZriRv96/xIt1Riv+aOoPQYhc3F0vRUHArN3x6JvklZ23R7zGcJLnF
 7MHjzit2D+ArypfEgK26aBSTQmqjh6A2ICzwRYw31CCWbcd/HadiKDHUa w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="379464037"
X-IronPort-AV: E=Sophos;i="6.03,185,1694761200"; d="scan'208";a="379464037"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 15:35:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="815400286"
X-IronPort-AV: E=Sophos;i="6.03,185,1694761200"; d="scan'208";a="815400286"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Sep 2023 15:35:57 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 28 Sep 2023 15:35:57 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 28 Sep 2023 15:35:57 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 28 Sep 2023 15:35:57 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.105)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 28 Sep 2023 15:35:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m5sBexQPfSpFGhcYKzEyZ0GaycnkpOQLUGpnWwbzidBVDnZoHvmdOqYZ7N86ZtfHPeRyasnxNngINOPKGqWuNmldOXIAvKlhZtQgD0IrGN0uci82YGWs+pwSMITqIAEeuYyaLrI+ozYgtZzAdRGNJYkkZibtgMW81/CSpoly0wXhqFCvTZndZ+qmGv3Pop/SzUMqI8kpUDME4jxbbbe3nmP5mIUE2SSTqHiZJLge6FpELQlCsvSNZnx8xbaUFs9bSPp4FmTh04+rLjPz5UcVeUrttMVdv1WKiLZs4vWbn5KC/vYNPa8Yqhz42bMon586iOEjywaLrRFo5fY4jNWhvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bYqyh9PoVcH5Tt/Ul1yvZ8EiqcewJhFA0bgoeSYmY5I=;
 b=P2KdDQokJxsTrtMtoRL67tKQAWQdJN4lJ5MBPb9z/GZdqpDb/7TzxxsdBq2JKP1J+vOfMHFxXoCey9xNFRFhJEf+4HjyANHqXHySaHwmd/UzNHsAYTf4FtbYnJ8Bd5271ljvg/pBeNNGqL0KlezgkHql0G2GhNmsFDCDur+hHKqdi6/MeKLqMB9jWRuLMUvaKpp76gPdpPfidu+pP/vXmqHtl6iEk0J++FRHdidfRso7Gv2znF/5NVm/Zx5rAHuX4pZ+yqfeUHwECL0TeigQRTx4NvDhUdvnOXYsc6KYZJCrgedD6ebmDUfaeBZ1F+wBj0jhaGDIilb8n3HFGBr3vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by SJ2PR11MB7576.namprd11.prod.outlook.com (2603:10b6:a03:4c9::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.23; Thu, 28 Sep
 2023 22:35:49 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::4182:281:404a:1042]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::4182:281:404a:1042%3]) with mapi id 15.20.6813.017; Thu, 28 Sep 2023
 22:35:49 +0000
Date: Thu, 28 Sep 2023 15:35:46 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Ohad Sharabi <osharabi@habana.ai>
Message-ID: <ZRX/wlgYhzBhW+8f@nvishwa1-DESK>
References: <20230928135621.308271-1-osharabi@habana.ai>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230928135621.308271-1-osharabi@habana.ai>
X-ClientProxiedBy: SJ0PR05CA0078.namprd05.prod.outlook.com
 (2603:10b6:a03:332::23) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|SJ2PR11MB7576:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ef92db0-6b99-4125-7e95-08dbc07343d9
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W4Tkza8Qf6ffPqJZoTY1tw6abmNYZgGUEhvnMtzjw8OFDeOy+4EGDBrzvdkHTF0qpQSJIMYLQd2RY+JxvjNPWQ/LFixbqj2Fsa3UOdyMtakbQ6VVOrnwM/owSpgFwgrPQ/yaE1wVsOJrUm0Ee3+kSG5jHBEH85m8JgN7UYkEPntkCdJWRa6xLQh5SmYiglaFrma/08OYscO719mPxMDE+K8TbLgYjFb9EQL6kHDJi4PWVMM4GHKQoUkLo6/qIUc+pBxDQZ6iCFkRfn5egWvGe4kZeDbnFqT4rg2ptal2RJPFROKaTWFgZQ98aqGyTDSmPQ6wniJjcIndaKTJIXxB7jXe0GbwC8oME0Ln0bkqWqvu9ZPgEN75gDwir4tAU0SPyB3UETcxER6tNFEZAuWbEPeY0Ptx3U9w1L3eI6/KbuKXGfRN8SbNkhYaTQWJtpVJXAj4eNZbqTPfNECKhwCw2IKnwoV5CrIkfkpNOQX/DNDU0VAnLyPRqT6ECBZbs9CsXGoxvcio2blhBdP/9CSySmApvdJYu6Q80bJ4Q4lJDS1e42V9w4E2+ymeyRMJnG8o
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(39860400002)(346002)(366004)(136003)(396003)(376002)(230922051799003)(186009)(64100799003)(451199024)(1800799009)(8936002)(8676002)(4326008)(66476007)(6512007)(6486002)(9686003)(6506007)(38100700002)(6666004)(82960400001)(26005)(5660300002)(66946007)(44832011)(316002)(6916009)(66556008)(478600001)(41300700001)(83380400001)(2906002)(86362001)(33716001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kixolpir8gHOlbYGrmdm/NxF5RBqXUtVb5Rw2Om2LqBwNgKefuAhz/YyDOhd?=
 =?us-ascii?Q?pEzfD7olSMsVotL4HtzKFkDCo3EtxJybqz3ZYFOz3rPEneTO4GGR2ew5Ndz9?=
 =?us-ascii?Q?h8dG4Gs4dTDkrquQerPBKyUo+Khpu99MyFMXdvufVqyyGMrnnPYIyGBeYFp+?=
 =?us-ascii?Q?NSswU4V6cQyTOI/2lA8UWWCV90CbQiQURL4Pp+rdhdTYDSHzWAkU5+kqdPvz?=
 =?us-ascii?Q?NCZKjTMnSqxbdYA8ocWo/WVn3Bc0320FPrEqzPZ+O43943tTe4UD5IWd+Gql?=
 =?us-ascii?Q?MkUXisERgUcDTSR4I9OvDm+9BoEciodunmxjes8JHWB/SFksd7PNHpA0la3b?=
 =?us-ascii?Q?72j3zqX/tT8XXiwyXUxo7D1hb+/Ly63qziiG2yLemj8UX4xW45oKpLSaKieD?=
 =?us-ascii?Q?AWgvgzJuFL9HevZuZE8S119aBiUy3lBS30EcxnV4PSqO8EYO1/Hv+hfefW/S?=
 =?us-ascii?Q?P/MxdMrKs3MHMf19x18QhuX/7Mt4XPx1ptRLSdBYrN7c8ZNSx2+6OXuq+chs?=
 =?us-ascii?Q?MmhvExi2bnQ+0FTmXlvz5SaI3I10GGC6tIqXxB2KTSjr0e3XHb47k9zbnVnO?=
 =?us-ascii?Q?TFoutxvpJLrt5kOg0vScEJnEyhh8sqdp/9aP4YCzP35sWx4cgSAxkop+/Mfh?=
 =?us-ascii?Q?mn4U0Wtuh3J8l8PCjKww8xyZH84FvJa/4gsO+AO2elTXYuNVH3mrGDnh2DDS?=
 =?us-ascii?Q?bYv8OCgwQ+Ovx0Pae8O65KgpS+qqPTkeTC36O6LpgpnJSSpKtoRVmRM/MgO6?=
 =?us-ascii?Q?QMWbDcDRxo7eJoX3vd+AZGzv6tHjTQlGP+g+OpgqaWK31mCfhPW7QMYn07Kh?=
 =?us-ascii?Q?2X4C14P2bOOnm2RUgCxhPh8St8QXypLbG0JnAYF3/5voOSEuH5qvO6GYG9Yn?=
 =?us-ascii?Q?FOnXS+H4+Mt6d2tvCEJQaEyXnWXuIQK+/szX6scaikWDffzOHqSeBVN/MLqm?=
 =?us-ascii?Q?X/bM008OMVNU5Rk+hIPU8MPMbrEhsuUDtuenpvKfYVtwYUjAOfAs843sYTx7?=
 =?us-ascii?Q?MAY0IbW9x7OFVApEsk7mpGF7YAxS6uK5HTvdW48p5XXRWSsBjsl3jj2PDxlz?=
 =?us-ascii?Q?o7INz1pT+FRhEyOIOOfvXOeh06YAzwnLrqKGdOXEOS+qGoshjWjd+z4+08fk?=
 =?us-ascii?Q?e0Q0BbnlZ6RB/uBPPOdxB/lpuEd6o307fT8vtVmCmAHg84VWR4yv78bXBiuW?=
 =?us-ascii?Q?VuuDkz5l9lS4WoMntYulqM88XUC87ApjDDgJurfu9hNsaXI7FLJd3vQX+6Ie?=
 =?us-ascii?Q?EYzGzcoimDu+oeyIFmsJ8omshEtA4wxPPHPVhm4OOEYlTOkiKdOToL69ZRhv?=
 =?us-ascii?Q?gbfY3GW8eOFQ1sR1b89Erl+n19y4dIgovSo0JO0/T1RXD4FGzBliwo/kgTVf?=
 =?us-ascii?Q?zXbcjaUgYZe1tY3iLr13kl6Ic9Au/NYRSz5hqBoQvZE3kcuVLhKwipxonJO1?=
 =?us-ascii?Q?byuJF7B2ruK8GiyOJnkQV7F7CZMVg6HR6KA1ucxHDaRrPXvZoJFq2BNKy0a1?=
 =?us-ascii?Q?suEtXHfKLaq23hysQoVGJaGfxvfMmd71zI6F+PgRpRxvbH11FnfYVm/K7ADl?=
 =?us-ascii?Q?ePMobQqEOfvQ05NNXEC1/e2CdrFvn7v4IY9MXzEIvAgIkbV6GYvwNLc0Bixk?=
 =?us-ascii?Q?4d7g+F2r4M2LLeZcoG/Y/Ao=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ef92db0-6b99-4125-7e95-08dbc07343d9
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2023 22:35:49.6207 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uOYfMPgD6nkEVornKRC9IaR4QVX8j+JLJYn3UV5xVGnjs/qqdWmjVYoPhef5X/IGoK8T8wYd4RKtf3EaTjFkAbYTQdcVRhjA/4YkF0GvbuPDLZKLhhRFtHGz36ztEJnk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7576
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: do not register to PM if GuC is
 disabled
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

On Thu, Sep 28, 2023 at 04:56:21PM +0300, Ohad Sharabi wrote:
>When working without GuC (i.e. working with execlists), the flow
>attempts to perform suspend operation which is failing due to a
>lack of support without GuC.
>
>If PM ops are not supported without GuC we may as well avoid PM
>registration rather than returning errors from various PM flows.
>
>Signed-off-by: Ohad Sharabi <osharabi@habana.ai>
>---
> drivers/gpu/drm/xe/xe_gt.c | 4 ----
> drivers/gpu/drm/xe/xe_pm.c | 4 ++++
> 2 files changed, 4 insertions(+), 4 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>index 1aa44d4f9ac1..68cd9a7ee087 100644
>--- a/drivers/gpu/drm/xe/xe_gt.c
>+++ b/drivers/gpu/drm/xe/xe_gt.c
>@@ -641,10 +641,6 @@ int xe_gt_suspend(struct xe_gt *gt)
> {
> 	int err;
>
>-	/* For now suspend/resume is only allowed with GuC */
>-	if (!xe_device_uc_enabled(gt_to_xe(gt)))
>-		return -ENODEV;
>-

Hmm...I am not sure bailing out early in xe_pm_init() will
make this function not to get called as it is registered with
pci subsystem.
May be we need call device_set_pm_not_required() like we are
doing in xe_pm_assert_unbounded_bridge()?

Niranjana

> 	xe_gt_sanitize(gt);
>
> 	xe_device_mem_access_get(gt_to_xe(gt));
>diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
>index ad3c08c4ff22..e31a91cf311c 100644
>--- a/drivers/gpu/drm/xe/xe_pm.c
>+++ b/drivers/gpu/drm/xe/xe_pm.c
>@@ -167,6 +167,10 @@ void xe_pm_init(struct xe_device *xe)
> {
> 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>
>+	/* For now suspend/resume is only allowed with GuC */
>+	if (!xe_device_uc_enabled(xe))
>+		return;
>+
> 	drmm_mutex_init(&xe->drm, &xe->d3cold.lock);
>
> 	xe->d3cold.capable = xe_pm_pci_d3cold_capable(pdev);
>-- 
>2.34.1
>
