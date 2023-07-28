Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4389C001DF
	for <intel-xe@archiver.kernel.org>; Fri, 28 Jul 2023 14:53:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77B1F10E70B;
	Fri, 28 Jul 2023 14:53:13 +0000 (UTC)
Received: from mgamail.intel.com (unknown [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAF5810E70B
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Jul 2023 14:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690555990; x=1722091990;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=LweWsg8CLvETbq9j6ZTAo3F0QAKiQ5Bo7EX2/9lzgKM=;
 b=arJu2vMlS86XgGcvIz8QOCds1j57iyJp/U0/yMiT/tF9pvvdnZOoA+ky
 f4hl2MfbI+1WDxNINT9autgqurCiGt81fMVF7QPOAggezXjERycnYWjfk
 oKTcbtLPfEhoJj7pSVOmcSQdkdY0hh7oNMbRy0mbP3doD8lEGgfg5o9pY
 ldNX4Tb0CxH0/unnj/yZ/rnO8N+HCuQoJP0k1cJJktMcLWO32mF1RjTee
 l2elwWxYUWncDbw8vJdbxcmuIcGcsUJYwheq4q++0U1j177TFEdl7ptHD
 1tlleVsfw21k1WUv/MF8fRmEmc/AEKQ71uXQ0sFpIde2vin/U4UYQkmv3 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="367488391"
X-IronPort-AV: E=Sophos;i="6.01,237,1684825200"; d="scan'208";a="367488391"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2023 07:53:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="1058161749"
X-IronPort-AV: E=Sophos;i="6.01,237,1684825200"; d="scan'208";a="1058161749"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga005.fm.intel.com with ESMTP; 28 Jul 2023 07:53:09 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 28 Jul 2023 07:53:09 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 28 Jul 2023 07:53:09 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 28 Jul 2023 07:53:09 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.104)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 28 Jul 2023 07:53:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LpdNcP1YzKmeEEntVdO7qPpGPF21lQ2fFHq55q28INS6mXVVdmTq3jUW43OaW940mkKrxJ9LxktxOpRD8ulDrAUOpjo+oZnRTVS7p/7EdSKELs1xkHLi3kBKwStSZadG/bOO9V61tgPbaVRgm3ZXW8uszycY2cbV75oTNdWoEQLHt586ygvp0LjYREWifftAueZi2WdCYqN7kfMoKbXu5iEh8iKB/yoKSmMoyq7bLD8JbkzWXwImonNzxvYrLzJXN876iPi/CHCRKB1ofTEZBjfZOWoPeuJpttLOb84FsYWx2RnseiNXi1Nedy7l5CkgpzwvTozTTguLTVDXfSzv+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IVCpIFXyhXjRQSFgrEguqKwqTvFhERzm/RAAD8M04ws=;
 b=geMcTunCSk0/8wg2IpoD36p1OkY9mtNyYyusf+PFK8st53G6tWHmwyR6TUkY/ECHfFL0zWrXReyIO+e1YzvcTAC1xVBzR31C1ji2tz41PUUKdJsI1t8s1zVLneRLwtbSGYul30xFA/2exKnkKR5NdZTiU+DHvQIL8pQk5C3JfaLWl9XpdnQIvv3K2cM6OnOku6I7ObMuOrxkl/6LoGOeQU5a1uWNJU6AhLH0fwG0yc5FrjaQbkQnz4asnT/JMJiA/YDnfXfUMam6gC6o/dmXVJgTeu7g5UQ85/Ps6uP6X+OCWYEu9vwKrjM+g2G/Blr/TwRjrUVGF7xBkHj2tX5BfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA0PR11MB4751.namprd11.prod.outlook.com (2603:10b6:806:73::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Fri, 28 Jul
 2023 14:53:08 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5645:50f0:9b06:1dd0]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5645:50f0:9b06:1dd0%3]) with mapi id 15.20.6631.026; Fri, 28 Jul 2023
 14:53:07 +0000
Date: Fri, 28 Jul 2023 14:52:19 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.william.auld@gmail.com>
Message-ID: <ZMPWI0DYAwCZtYSG@DUT025-TGLU.fm.intel.com>
References: <20230727183423.538211-1-matthew.brost@intel.com>
 <CAM0jSHOqXiks=o91pS=Wcr7ihyJVS74oWeegQR3BSWuThP4Rdw@mail.gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAM0jSHOqXiks=o91pS=Wcr7ihyJVS74oWeegQR3BSWuThP4Rdw@mail.gmail.com>
X-ClientProxiedBy: SJ0PR13CA0125.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::10) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA0PR11MB4751:EE_
X-MS-Office365-Filtering-Correlation-Id: 58c13024-06a6-4f0d-a88d-08db8f7a5af3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: crAgGLzdU7FdlpnuT6BJ/uHmNvbQyNiUzDtu4+rkAXmZmJQNl/X4gjLimh01a2rh3ATx2JzmzQz6rJFYWjeg2Vps8s4wqHSzl673oAR9f5qmU/UdxQmwcgwi9vrwuI+WPXrhxRbg7eZv1+gYgMV2vjamNHYt3TeHgzH5Gm/5YCSSjCJzcfIMTrBMWECdbU7KIIuXWY16ttip9Mn7OIt+SQnn1tWsIYFpcQ2PJc2QfGw81cyyblzIECiNO0FXIh/tIGA7wgSZFGyidwV7gqELBgHIcmBKtfMLxLEEXER62idhy9qJIAQ9/oSslIxvBNILbeNpJsBNDHJLL/U4hsEO2ODWwppr3BMV/dhkB274+3wpKsZ1tC+lV8KvyIIfY+Sa8tpSErHMumU8kxfRJHBsKwq2RQkJzGQOgTG6Lcjuv8ISJ2RSBWpJHD6WoATtSCyFOnglNkI/HfQSObHaVQLKqyLEvpfIdgkDJHSPMOCj7TPovB5JL4MkYnhEOcGTgUW5uQ9xjuBtWaA8tlwAC+FTkEsZ6r2pxdTLA4uLT5OSaIVGz6WoI+eRGf3zDWd8KzRl
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(136003)(376002)(39860400002)(396003)(346002)(451199021)(86362001)(2906002)(44832011)(38100700002)(83380400001)(186003)(6512007)(26005)(6506007)(6666004)(478600001)(6486002)(82960400001)(66476007)(66946007)(8936002)(66556008)(4326008)(5660300002)(41300700001)(8676002)(6916009)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?A+G+3pftQyHssnWsNtVxlYPgELvZkfXjW0R/i4rrVhiyBcq31xLTD9hAad/J?=
 =?us-ascii?Q?udtVpb4JHDgU4HuCW/35L01jzLLbH7Y4tro/tjGhEWjxo/FD7e5/KD1jujdh?=
 =?us-ascii?Q?lkiDpYViO/zG6uoulZGhA2OreNPwzhgJH74vD38TUWJ0v1R2DuDLwjw+mVmC?=
 =?us-ascii?Q?T1x7iGsE1fmpP9dS/722YEct3hDh481Cf2BL53lP4MckILLbsjgR9aDioUVq?=
 =?us-ascii?Q?pneDNGH834Eo0wHrUi+SbS+kjoSQFlTl910PFfEjm4AsrmuesYq4s9XGyzGA?=
 =?us-ascii?Q?cpxOp0P/PnQVWR3rf/eWI/aWoQOSe0lX1qNNem8zqEg9Zcf+pPOKd+Wjp3sb?=
 =?us-ascii?Q?56Q8G22snoR1rIaVwUsjORWxY71zf4B5MCAmo/PbM++iKPtWUWKQyjsKTqMZ?=
 =?us-ascii?Q?hGOkOgb75TExdeqMW4OPmNZHaMcdV2c+Fgrrme5Z/Fv8QP8YuDAcx5DRzKED?=
 =?us-ascii?Q?NMzW9wWaSn2YlnDLCmBfvP9q7xgLvK0JNcWXvOcFKKP6xq233l6gVoTV0ss3?=
 =?us-ascii?Q?i4WA1JMxBrDzH1hv8tNsZUzL0g3Mz1xxrNQZznjLbHrJHewcAOuOUU3lLluO?=
 =?us-ascii?Q?qPi7Fc1d4X4FcO7z3LFHLX3WVCQhna9FTDnQj6TRa0cQlC3WlRvCmuaYxmnT?=
 =?us-ascii?Q?8PX8DJ8nkqNrtCyyK4xQPAD/MJ5dCmRHPXwX6xroyBiPx0/yLVW2EtQWL+Va?=
 =?us-ascii?Q?+MiOeqtbv368rIEVyFFiENUuS1Iwoja/bmJsLV1Zyn2Y+wg0f/mY1K4ileS3?=
 =?us-ascii?Q?rs1zwGZPjABUTUDYnqb9SoOwe0/2oRRZTUPFuIdPoaZzaLOqVOGiNOIYzS4T?=
 =?us-ascii?Q?LBL3EAqFmzHV+MPwih6ggAlCSgkkSm+e1fQD1IZ7MdPFGYT/0B+mMKmc5MLQ?=
 =?us-ascii?Q?Iss1L2mr3su7TLa67n9ug3rWmduHgf3ZBTrPjqvZCPw74b4OB8JpoRTMB28a?=
 =?us-ascii?Q?hzQ87VSj9VCLDIFvP2OiTHvJBILiewaT3RkqTfPW6ellycbmp78gF7RRsjik?=
 =?us-ascii?Q?WADCiH6DihEz554HvoEVFhVF9DID8FwRro5QoH8pM6q2ZnBRYMZWjPENcuqa?=
 =?us-ascii?Q?3y94jdLyCfIGNrAI9tJWiaX9hXzTYNZi/KY4P64Lv/H9bixda6Mi3CRHntkS?=
 =?us-ascii?Q?pOkzl56DfQvfrEG/GTx67bOZTHzg+08dGWX2EliXNqFh8HP4SivL3F8gfrQv?=
 =?us-ascii?Q?v07KWA7oATIUV5B9UzrHuBrb/sSMzxS2dm0xTdhEiN8q2U5MbMBhVvbLQcZK?=
 =?us-ascii?Q?DdDsyMQssD0ccEKND8GR4ADKXliIC5LOtQmNtscGMB7w/gQ2KoPBKyZW9TqH?=
 =?us-ascii?Q?5Fmunm+8Rak5vhcn3pp46AMWbwBbyjshEKOc1DT6Q0T0xVfsQEU8Lw4AB4IH?=
 =?us-ascii?Q?4dgDmvC/9ObBJDbxyLucaW34pMhuIRnsrqDcw0JK3OvXqk/X7zW2QPuXTODf?=
 =?us-ascii?Q?56162YYWAT2eqqN3k0AIVJOdto8e3wxAVntXlsxma1wmZSHXudd2hJjo0rtz?=
 =?us-ascii?Q?LVbsHwKXQXPjk6CNV2a7lAO/4DqfMjfsVs1sz6WfRB2NAMkBseKXzGlpRwtQ?=
 =?us-ascii?Q?pWXk9us8V5HtfLoUGS4krD/z3iFpzBVZauLp69ViiL+QvgTGhs+8IOUjolss?=
 =?us-ascii?Q?sw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 58c13024-06a6-4f0d-a88d-08db8f7a5af3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2023 14:53:07.8930 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1k4s12DLnd7zJPliJB15AdZSXyZi9Ghpt1nrjg3ODl2FEGzbyjB1cmaIp/v3d8nGQ365nkmqu5SFbJ7J/QlW3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4751
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Remove unnecessary memory barriers
 related to wait queue
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

On Fri, Jul 28, 2023 at 01:13:04PM +0100, Matthew Auld wrote:
> On Thu, 27 Jul 2023 at 19:34, Matthew Brost <matthew.brost@intel.com> wrote:
> >
> > These not needed per the wait queue doc, remove them.
> >
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_guc_ct.c     | 3 ---
> >  drivers/gpu/drm/xe/xe_guc_submit.c | 9 +--------
> >  2 files changed, 1 insertion(+), 11 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> > index cb75db30800c..3f58902b6be3 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > @@ -308,7 +308,6 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
> >         spin_unlock_irq(&ct->fast_lock);
> >         mutex_unlock(&ct->lock);
> >
> > -       smp_mb();
> >         wake_up_all(&ct->wq);
> >         drm_dbg(&xe->drm, "GuC CT communication channel enabled\n");
> >
> > @@ -820,8 +819,6 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
> >         g2h_release_space(ct, GUC_CTB_HXG_MSG_MAX_LEN);
> >
> >         g2h_fence->done = true;
> > -       smp_mb();
> 
> Hmm, pretty sure we still need barriers such that done = 1 is seen to
> happen after the stores for fail, error, hint, retry etc, and then ofc
> a matching barrier on the reader side. The barriers in wake_up_all()
> vs wait_event() won't ensure that. So something like:
> 
> parse_g2h_response():
> /*
>  * Pairs with guc_ct_send_recv().
>  *
>  * The ordering of g2h_fence.done vs wake_up_all() and
>  * wait_event_timeout() is already handled by that api. However here we
>  * also have the added dependency of ordering the g2h_fence.done after
>  * the previous stores, like with g2h_fence.retry, g2h_fence.fail etc.
>  * which we need to handle ourselves.
>  */
> smp_wmb();
> WRITE_ONCE(g2h_fence->done, true);
> wake_up_all(&ct->g2h_fence_wq);
> 
> 
> guc_ct_send_recv():
> ret = wait_event_timeout(ct->g2h_fence_wq, READ_ONCE(g2h_fence.done), HZ);
> if (!ret) {
> }
> 
> /* Pairs with parse_g2h_response(). */
> smp_rmb();
> if (READ_ONCE(g2h_fence.retry)) {
> }
> 
> if (READ_ONCE(g2h_fence.fail)) {
> }
> 
> But AFAICT there also seems to be scary lifetime issues in here. The
> g2h_fence is allocated on the stack, and goes out of scope when
> returning from guc_ct_send_recv(), however if the wait_event timedout
> we don't know if parse_g2h_response() will still run before we remove
> the fence from the xarray. I think we need to grab the ct->mutex to
> serialize the operations. Also if we have to acquire ct->mutex anyway
> it might be worth seeing if we can drop the scary shared memory access
> outside locks stuff here.
> 

Yea I think all of this is correct once I think about it.

> > -
> >         wake_up_all(&ct->g2h_fence_wq);
> >
> >         return 0;
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index 6cb64a097297..d623cd9f6cc4 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -705,7 +705,6 @@ static void disable_scheduling_deregister(struct xe_guc *guc,
> >         int ret;
> >
> >         set_min_preemption_timeout(guc, e);
> > -       smp_rmb();
> >         ret = wait_event_timeout(guc->ct.wq, !engine_pending_enable(e) ||
> >                                  guc_read_stopped(guc), HZ * 5);
> >         if (!ret) {
> > @@ -888,7 +887,6 @@ guc_engine_timedout_job(struct drm_sched_job *drm_job)
> >                  * error) messages which can cause the schedule disable to get
> >                  * lost. If this occurs, trigger a GT reset to recover.
> >                  */
> > -               smp_rmb();
> >                 ret = wait_event_timeout(guc->ct.wq,
> >                                          !engine_pending_disable(e) ||
> >                                          guc_read_stopped(guc), HZ * 5);
> > @@ -1008,7 +1006,6 @@ static void suspend_fence_signal(struct xe_engine *e)
> >         XE_BUG_ON(!e->guc->suspend_pending);
> >
> >         e->guc->suspend_pending = false;
> 
> Probably a good idea to use WRITE_ONCE/READ_ONCE. Even if it is not
> strictly needed from the compiler pov, it at the very least documents
> that we are accessing shared memory outside of proper locking.
>

Sure.

Matt

> 
> 
> 
> > -       smp_wmb();
> >         wake_up(&e->guc->suspend_wait);
> >  }
> >
> > @@ -1392,7 +1389,6 @@ int xe_guc_submit_reset_prepare(struct xe_guc *guc)
> >          * and releasing any TDRs waiting on guc->submission_state.stopped.
> >          */
> >         ret = atomic_fetch_or(1, &guc->submission_state.stopped);
> > -       smp_wmb();
> >         wake_up_all(&guc->ct.wq);
> >
> >         return ret;
> > @@ -1521,17 +1517,14 @@ int xe_guc_sched_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
> >         if (engine_pending_enable(e)) {
> >                 e->guc->resume_time = ktime_get();
> >                 clear_engine_pending_enable(e);
> > -               smp_wmb();
> >                 wake_up_all(&guc->ct.wq);
> >         } else {
> >                 clear_engine_pending_disable(e);
> >                 if (e->guc->suspend_pending) {
> >                         suspend_fence_signal(e);
> >                 } else {
> > -                       if (engine_banned(e)) {
> > -                               smp_wmb();
> > +                       if (engine_banned(e))
> >                                 wake_up_all(&guc->ct.wq);
> > -                       }
> >                         deregister_engine(guc, e);
> >                 }
> >         }
> > --
> > 2.34.1
> >
