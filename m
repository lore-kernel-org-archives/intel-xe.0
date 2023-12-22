Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B4ABC41535
	for <intel-xe@archiver.kernel.org>; Fri, 22 Dec 2023 05:53:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A63F710E74B;
	Fri, 22 Dec 2023 05:53:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9502010E74B
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Dec 2023 05:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703224417; x=1734760417;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=xC4Jpt1zO5Ld3Un5XgweVUJNZ1StnzAcLQyPUxbcbxo=;
 b=biuqSixjZt/n2XHSuQaTKNMJhsb2XiWo2A+iIyQgZ/cOfulb8pSmbWDo
 q6VZTfGrG2n0cTaxdKOM+QuKwXi4JMNVCufSbL8G94pO6wjSvNutAcoeU
 u/ruoGjyK9UnmWhhkfJrfnw37yEz3TWpw3VA9+/S+eUpB6AQ2nFoP+oS9
 R/WnlmvaQGIwL0J9mILC9bAynWqpr7iBunbkDIdDTwVNVeR83fU8UH7eH
 pSc5DoMw+d796ytKYim+ag9aUm/C50ZBblqJOhNz2cQ6N+1Tid+eaVEH6
 yIZntxwmxi1hENbqHWoojspHNBSufZQ0UWNc8yFgeRFCvEn6TeoD8TNeD Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="386504216"
X-IronPort-AV: E=Sophos;i="6.04,294,1695711600"; d="scan'208";a="386504216"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2023 21:53:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="726687048"
X-IronPort-AV: E=Sophos;i="6.04,294,1695711600"; d="scan'208";a="726687048"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Dec 2023 21:53:37 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 21 Dec 2023 21:53:36 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 21 Dec 2023 21:53:36 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 21 Dec 2023 21:53:36 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 21 Dec 2023 21:53:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k9/RfnBvaYyM6yaz2UaOubeClY1kz2MGF1SClbefqNjxlWvK/LpKekl9aGvMy3PQL0g33OT/NksmxSe0BfI9jAy0Nsy/8bD95tBoQjVkqoACg+chqKN0N9KQlbWu/Ehiq7Cc+6RE1bwXkT97gwpWXmFkpPgU5WqR24TUEU+sycDZHfyGKIUriX8X5RiPwDANh92xdzKZqHQ+60I98Nxa41o2qlQo3Zrqz/2MqQ1Pu5mfU6e+NV5/JamdMfo6Kn7FoXiYSTKSWe5A0K2pr+yNi16pd8P6EDxlqnIWHCWJjdqFerGrL2gRCS/cXNcVRa+5l370Mo4jsNhJchq9oyhNDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y/uQO36qylNYNi4jWuVs5yEb6qpSza1pIM6FV8shFOE=;
 b=FBsWGcsanhm7oap+24539JkAw+ywdjaTzHYze/ugEjTxsSUSQVwwJswzB5Iy7OU0iV6iiI1xkuwYojHXGAM0a9zYvX5n6szSE/jbbWF6l/wzed36Mh7g9qg5DiHUdikbmgF0vnPRyY/Ao1Jsv2+85wU7SH2IDlyv182D+YAClmhlT/UA+5qMETLMAi1XXV21wCtgrhVtvBKatrkRdgIAbcVM6WkjvHJ3rk2WKLfveWohI4EYJ3YYApwrIhcGtajsqb+7u6jCnMk94ACU1thh9+XrQ8XfF6XnjdrKZygOYCA/zvgUQYuy7zGdgnYewxsaj3bRNitVDB8WKYC2FC8ZzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW5PR11MB5786.namprd11.prod.outlook.com (2603:10b6:303:191::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.20; Fri, 22 Dec
 2023 05:53:33 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7113.016; Fri, 22 Dec 2023
 05:53:33 +0000
Date: Fri, 22 Dec 2023 05:52:35 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH] drm/xe/guc: Add more GuC CT states
Message-ID: <ZYUkIzf+R/JSJPIc@DUT025-TGLU.fm.intel.com>
References: <20231219172824.832873-1-matthew.brost@intel.com>
 <6af59573-3925-4af4-abb4-ad7e1f40b920@intel.com>
 <ZYUi5ZdXQV+r6J7C@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZYUi5ZdXQV+r6J7C@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: SJ0PR13CA0011.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::16) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW5PR11MB5786:EE_
X-MS-Office365-Filtering-Correlation-Id: ac8bff23-9861-42f4-8d05-08dc02b25475
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fVX33cVoOpMSYASfEgCB8GdIy8FQ5/ZmrUwxZUWb7pqHwV7MIHrX+FdL1zALlEEGYdz58esDU/jzZ7v/oqCOI1dfAKcAavMQapnpATvgVxZgYyEJ0GP6pUOeiU2Fb3wVYl/70mON850OKsNsScQmb2AePUdgEUGRrDpmrzmnaign7TUyCqJYTgM5IvHtsc9p8kMT40TVvxwTkdltFGCujN1dpa8IYCTtIAY+olIzu63ITxN6Abqj2MN5L4oLSK/8ENDqInbKpjPWwCnfDjuZ4oAdGFqKVAJyav0JTF5rn4+nQFoctQHV+u9mwvanhqBfDwCrgVCWogp/yFT0xrpI6qRrhMfopMCSRsM++Z69GNo7++RjMfrAOGmH6lKzvoQ22l6BYGguJAXTfnj0/Y6DhQrSUt7jR9xJY4MlJnUHMNBjjHYdDGed8vrAMz6PrKt02J4V+iMEFVCiOW2vYqctO41rhMT3Xf/8kmfNLmdXSlfEorQG36pS/hdFbnYKg2JigjUgWRPXWrsQIGgPtLzZV31fhH+WyA0aKiYlBsB4U2g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(366004)(39860400002)(376002)(346002)(396003)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(86362001)(53546011)(6512007)(5660300002)(4326008)(8936002)(8676002)(6862004)(6506007)(44832011)(2906002)(30864003)(26005)(316002)(6636002)(66946007)(66476007)(66556008)(83380400001)(478600001)(6486002)(38100700002)(41300700001)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0wGUJ1U38lDfo/wbZZTXbeC/Lv1FdQjixj8x3bVU15Tvxa2K+zhaAZztE16U?=
 =?us-ascii?Q?lzd6/MISpQKBPTovFGAkUspvqZUnN0jXyeyuvx5YB2akWl11X/oFYLS6Pksb?=
 =?us-ascii?Q?41FLIb3Xk8Za4UsZziwrsvvAAVEXvq3PWnINtv5wsbER6GBFmbtDsfuA+Q54?=
 =?us-ascii?Q?BNRT10BvP/MSaBjZF3iiwS+9GUY37MX9HNy7fSqUwOUWy6qzyCCcIxY0VNTV?=
 =?us-ascii?Q?0mi8LS9en0H52LLSch+H1LgtG5Dw8br6XD+xxdLe+N+Sm8JI559+kVpXCp3m?=
 =?us-ascii?Q?d6Mjys6Zxp6p0rTH85jVbM9+gNxmVYz269H+YX6PSZ6NQmGCUtPXDCrSlaur?=
 =?us-ascii?Q?TrLOGAyCbbHLxv56cyjRepjt1buUKN0QZZluUrByyJSFfrfZ9+DhkW5AixAq?=
 =?us-ascii?Q?9fb6CnMWbwbeGWdu6caz7Pd/6zXzw6jrbKnWn9HSQ2WUNWyFqPffurZkAn4C?=
 =?us-ascii?Q?yVS+IUNL420M/RGXx3+12DCXXX752uBrzKQ2x4jVn/hwjRIsbAQqyqG/TKHv?=
 =?us-ascii?Q?B+XydrGYgiDeSP2A5d2DJQis2aeqacQ1XBOy5r8ZsIQv51pIwfziMtlivHB4?=
 =?us-ascii?Q?MnmD/9TyaXdk02CfOuSLRiMVHgOdt2/TfFTV5N2yZ1NAfA0cruz4/frplzyn?=
 =?us-ascii?Q?RvVzIrw0NUmZZXa3IxNDt65GZB6uBLK2ENYo/rId6p9x8EycsHAwIcOjSF7v?=
 =?us-ascii?Q?2ikPDbZ47nzQZNULjpGpHdtPdmxX7b0rspgAikuiRm6m5LXKmDc5GUIQlVrj?=
 =?us-ascii?Q?Ac+6nu7XDOMQlanlsY55PiaIw9ZzJWGonlJmPwfeod+HZtOyKomANK1aJlF+?=
 =?us-ascii?Q?kgcBiSbW1Prubs7p9EgFuV2yGg3EgpYqCrWcBCwzwfnMQ9f5nxNuvp0jPZsd?=
 =?us-ascii?Q?O3SVzjh7FFdbaOaBsdA/Sjvpt51ugi/naUk2MkXcoWZGwRu8eqDmFE0StnwD?=
 =?us-ascii?Q?ebU2J4lDCdEx5Dl88Stdw7WZErpwlJmgKQGQcJvojHaN+h5p59iFynJymdEM?=
 =?us-ascii?Q?Nt4wfmVM2r+cXjisRYgMH200K6QNhO+jIgAvhblLV3gsIjlqPFNGBCisJQ7S?=
 =?us-ascii?Q?eauahzELyyGj7d6VbaVcazRP76ej9VQRmT7JW9Xfha2dbp6gWoUx6e4WD+6d?=
 =?us-ascii?Q?GEDL8b/ERTXZ2Qxt87uthXpu6LmU0WwTAPPN7c5vpFpRZl+UzfmrETCvlTpu?=
 =?us-ascii?Q?Lofv3zq87jXJNDVXua9FrW4glujRl4v7kSvwLJfbCNNw9gNp/JIJQUryYaBn?=
 =?us-ascii?Q?Tt17Pj1SAAo1IQ5g7eypQvVEUd8Qrhpixq9G9M2ZrO9tMLOWT7YOtldbKNqz?=
 =?us-ascii?Q?K1URVmoqCj9FGFmC2M//uzHrDatUy5tGTW+FIamIvjMDvyIxGd1dV+a+By7M?=
 =?us-ascii?Q?iHS/UghDcynXPIjsbYDQtiZmU5RJowHmuLHxHZf/bgdBXRWxesSpzrV2STcT?=
 =?us-ascii?Q?6Is9lsRHw2eSlg/3HlPp0NJ76jdqHPLZ90+ekqA3B5JxZEtzWQSOhQgfsgCs?=
 =?us-ascii?Q?acBasQubZsX7G+Eih1l6WkBKf5LUVbNcAQrWi1C6h3fChrsNgqPZ0FUtjBBV?=
 =?us-ascii?Q?v9at3KcA9DY7ezk/vdKX2N6KrsQYRNlqNzmwdIybtFFahC4sWf/tj7GwrkUx?=
 =?us-ascii?Q?XQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ac8bff23-9861-42f4-8d05-08dc02b25475
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2023 05:53:33.0206 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VvDB7kSJ6n0xwQLFdYW77zXWPx8pPUKD+6wj7sKVyn4vIV0tjVKknK2yHFlhqR10gNyCNwJ9DOuiA8IuG98rLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5786
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

On Fri, Dec 22, 2023 at 05:47:17AM +0000, Matthew Brost wrote:
> On Thu, Dec 21, 2023 at 01:56:33PM -0800, Daniele Ceraolo Spurio wrote:
> > 
> > 
> > On 12/19/2023 9:28 AM, Matthew Brost wrote:
> > > The Guc CT has more than enabled / disables states rather it has 4. The
> > > 4 states are not initialized, disabled, drop messages, and enabled.
> > > Change the code to reflect this. These states will enable proper return
> > > codes from functions and therefore enable proper error messages.
> > 
> > Can you explain a bit more in which situation we expect to drop messages and
> > handle it? AFAICS not all callers waiting for a G2H reply can cope with the
> 
> Anything that requires a G2H reply must be able to cope with it getting
> dropped as the GuC can hang at any moment. Certainly all of submission
> is designed this way, so is TLB invalidations. More on that below. With
> everything being able to cope with lost G2H their is not a point to
> continue to process G2H once a reset has started (or send H2G either).
> 
> > reply not coming; e.g. it looks like xe_gt_tlb_invalidation_wait() will
> 
> During a GT reset xe_gt_tlb_invalidation_reset() is called which will
> signal all waiters for invalidations avoiding timeouts.
> 
> So the flow roughly is:
> 
> Set CT channel to drop messages
> Stop all submissions
> Do reset
> Signal TLB invalidation waiters.
> 

Ah, forgot a key detail here. Setting CT channel to drop message before
do the reset is key here - we don't want a G2H being processed to race
with cleaning up lost G2H in there reset step.

Matt

> > timeout and throw an error (which IMO is already an issue, because the reply
> > might be lost due to reset). I know that currently in all cases in which we
> > stop communication we do a reset, so the situation ends up ok, but there is
> > a pending series to remove the reset in the runtime suspend/resume scenario
> > (https://patchwork.freedesktop.org/series/122772/) in which case IMO we
> 
> This path we would want to put the GuC communication into a state where
> if messages send / recv this triggers an error. (-ENODEV).  We don't
> expect to suspend the device and then send / recv messages. That is the
> point of this patch - it is fine drop messages during a reset, not if
> during suspend or if CT has not yet been initialized.
> 
> Proper error messages will added based on these new states.
> 
> > don't want to drop messages but do a flush instead.
> > 
> 
> See above. Also unsure what you mean by flush here? Do you mean the G2H
> worker? I think that creates some dma-fencing (or lockdep) nightmares if
> we do that.
> 
> Matt
> 
> > Daniele
> > 
> > > 
> > > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > > Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/xe_guc.c          |  4 +-
> > >   drivers/gpu/drm/xe/xe_guc_ct.c       | 55 ++++++++++++++++++++--------
> > >   drivers/gpu/drm/xe/xe_guc_ct.h       |  8 +++-
> > >   drivers/gpu/drm/xe/xe_guc_ct_types.h | 18 ++++++++-
> > >   4 files changed, 64 insertions(+), 21 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> > > index 482cb0df9f15..9b0fa8b1eb48 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc.c
> > > @@ -645,7 +645,7 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
> > >   	BUILD_BUG_ON(VF_SW_FLAG_COUNT != MED_VF_SW_FLAG_COUNT);
> > > -	xe_assert(xe, !guc->ct.enabled);
> > > +	xe_assert(xe, !xe_guc_ct_enabled(&guc->ct));
> > >   	xe_assert(xe, len);
> > >   	xe_assert(xe, len <= VF_SW_FLAG_COUNT);
> > >   	xe_assert(xe, len <= MED_VF_SW_FLAG_COUNT);
> > > @@ -827,7 +827,7 @@ int xe_guc_stop(struct xe_guc *guc)
> > >   {
> > >   	int ret;
> > > -	xe_guc_ct_disable(&guc->ct);
> > > +	xe_guc_ct_drop_messages(&guc->ct);
> > >   	ret = xe_guc_submit_stop(guc);
> > >   	if (ret)
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> > > index 24a33fa36496..22d655a8bf9a 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > > @@ -278,12 +278,25 @@ static int guc_ct_control_toggle(struct xe_guc_ct *ct, bool enable)
> > >   	return ret > 0 ? -EPROTO : ret;
> > >   }
> > > +static void xe_guc_ct_set_state(struct xe_guc_ct *ct,
> > > +				enum xe_guc_ct_state state)
> > > +{
> > > +	mutex_lock(&ct->lock);		/* Serialise dequeue_one_g2h() */
> > > +	spin_lock_irq(&ct->fast_lock);	/* Serialise CT fast-path */
> > > +
> > > +	ct->g2h_outstanding = 0;
> > > +	ct->state = state;
> > > +
> > > +	spin_unlock_irq(&ct->fast_lock);
> > > +	mutex_unlock(&ct->lock);
> > > +}
> > > +
> > >   int xe_guc_ct_enable(struct xe_guc_ct *ct)
> > >   {
> > >   	struct xe_device *xe = ct_to_xe(ct);
> > >   	int err;
> > > -	xe_assert(xe, !ct->enabled);
> > > +	xe_assert(xe, !xe_guc_ct_enabled(ct));
> > >   	guc_ct_ctb_h2g_init(xe, &ct->ctbs.h2g, &ct->bo->vmap);
> > >   	guc_ct_ctb_g2h_init(xe, &ct->ctbs.g2h, &ct->bo->vmap);
> > > @@ -300,12 +313,7 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
> > >   	if (err)
> > >   		goto err_out;
> > > -	mutex_lock(&ct->lock);
> > > -	spin_lock_irq(&ct->fast_lock);
> > > -	ct->g2h_outstanding = 0;
> > > -	ct->enabled = true;
> > > -	spin_unlock_irq(&ct->fast_lock);
> > > -	mutex_unlock(&ct->lock);
> > > +	xe_guc_ct_set_state(ct, XE_GUC_CT_STATE_ENABLED);
> > >   	smp_mb();
> > >   	wake_up_all(&ct->wq);
> > > @@ -321,12 +329,12 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
> > >   void xe_guc_ct_disable(struct xe_guc_ct *ct)
> > >   {
> > > -	mutex_lock(&ct->lock); /* Serialise dequeue_one_g2h() */
> > > -	spin_lock_irq(&ct->fast_lock); /* Serialise CT fast-path */
> > > -	ct->enabled = false; /* Finally disable CT communication */
> > > -	spin_unlock_irq(&ct->fast_lock);
> > > -	mutex_unlock(&ct->lock);
> > > +	xe_guc_ct_set_state(ct, XE_GUC_CT_STATE_DISABLED);
> > > +}
> > > +void xe_guc_ct_drop_messages(struct xe_guc_ct *ct)
> > > +{
> > > +	xe_guc_ct_set_state(ct, XE_GUC_CT_STATE_DROP_MESSAGES);
> > >   	xa_destroy(&ct->fence_lookup);
> > >   }
> > > @@ -493,11 +501,19 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
> > >   		goto out;
> > >   	}
> > > -	if (unlikely(!ct->enabled)) {
> > > +	if (ct->state == XE_GUC_CT_STATE_NOT_INITIALIZED ||
> > > +	    ct->state == XE_GUC_CT_STATE_DISABLED) {
> > >   		ret = -ENODEV;
> > >   		goto out;
> > >   	}
> > > +	if (ct->state == XE_GUC_CT_STATE_DROP_MESSAGES) {
> > > +		ret = -ECANCELED;
> > > +		goto out;
> > > +	}
> > > +
> > > +	xe_assert(xe, xe_guc_ct_enabled(ct));
> > > +
> > >   	if (g2h_fence) {
> > >   		g2h_len = GUC_CTB_HXG_MSG_MAX_LEN;
> > >   		num_g2h = 1;
> > > @@ -682,7 +698,8 @@ static bool retry_failure(struct xe_guc_ct *ct, int ret)
> > >   		return false;
> > >   #define ct_alive(ct)	\
> > > -	(ct->enabled && !ct->ctbs.h2g.info.broken && !ct->ctbs.g2h.info.broken)
> > > +	(xe_guc_ct_enabled(ct) && !ct->ctbs.h2g.info.broken && \
> > > +	 !ct->ctbs.g2h.info.broken)
> > >   	if (!wait_event_interruptible_timeout(ct->wq, ct_alive(ct),  HZ * 5))
> > >   		return false;
> > >   #undef ct_alive
> > > @@ -941,12 +958,18 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
> > >   	lockdep_assert_held(&ct->fast_lock);
> > > -	if (!ct->enabled)
> > > +	if (ct->state == XE_GUC_CT_STATE_NOT_INITIALIZED ||
> > > +	    ct->state == XE_GUC_CT_STATE_DISABLED)
> > >   		return -ENODEV;
> > > +	if (ct->state == XE_GUC_CT_STATE_DROP_MESSAGES)
> > > +		return -ECANCELED;
> > > +
> > >   	if (g2h->info.broken)
> > >   		return -EPIPE;
> > > +	xe_assert(xe, xe_guc_ct_enabled(ct));
> > > +
> > >   	/* Calculate DW available to read */
> > >   	tail = desc_read(xe, g2h, tail);
> > >   	avail = tail - g2h->info.head;
> > > @@ -1245,7 +1268,7 @@ struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct,
> > >   		return NULL;
> > >   	}
> > > -	if (ct->enabled) {
> > > +	if (xe_guc_ct_enabled(ct)) {
> > >   		snapshot->ct_enabled = true;
> > >   		snapshot->g2h_outstanding = READ_ONCE(ct->g2h_outstanding);
> > >   		guc_ctb_snapshot_capture(xe, &ct->ctbs.h2g,
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
> > > index f15f8a4857e0..214a6a357519 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_ct.h
> > > +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
> > > @@ -13,6 +13,7 @@ struct drm_printer;
> > >   int xe_guc_ct_init(struct xe_guc_ct *ct);
> > >   int xe_guc_ct_enable(struct xe_guc_ct *ct);
> > >   void xe_guc_ct_disable(struct xe_guc_ct *ct);
> > > +void xe_guc_ct_drop_messages(struct xe_guc_ct *ct);
> > >   void xe_guc_ct_fast_path(struct xe_guc_ct *ct);
> > >   struct xe_guc_ct_snapshot *
> > > @@ -22,10 +23,15 @@ void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot,
> > >   void xe_guc_ct_snapshot_free(struct xe_guc_ct_snapshot *snapshot);
> > >   void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool atomic);
> > > +static inline bool xe_guc_ct_enabled(struct xe_guc_ct *ct)
> > > +{
> > > +	return ct->state == XE_GUC_CT_STATE_ENABLED;
> > > +}
> > > +
> > >   static inline void xe_guc_ct_irq_handler(struct xe_guc_ct *ct)
> > >   {
> > >   	wake_up_all(&ct->wq);
> > > -	if (ct->enabled)
> > > +	if (xe_guc_ct_enabled(ct))
> > >   		queue_work(system_unbound_wq, &ct->g2h_worker);
> > >   	xe_guc_ct_fast_path(ct);
> > >   }
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_ct_types.h b/drivers/gpu/drm/xe/xe_guc_ct_types.h
> > > index d814d4ee3fc6..e36c7029dffe 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_ct_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_guc_ct_types.h
> > > @@ -72,6 +72,20 @@ struct xe_guc_ct_snapshot {
> > >   	struct guc_ctb_snapshot h2g;
> > >   };
> > > +/**
> > > + * enum xe_guc_ct_state - CT state
> > > + * @XE_GUC_CT_STATE_NOT_INITIALIZED: CT suspended, messages not expected in this state
> > > + * @XE_GUC_CT_STATE_DISABLED: CT disabled, messages not expected in this state
> > > + * @XE_GUC_CT_STATE_DROP_MESSAGES: CT drops messages without errors
> > > + * @XE_GUC_CT_STATE_ENABLED: CT enabled, messages sent / recieved in this state
> > > + */
> > > +enum xe_guc_ct_state {
> > > +	XE_GUC_CT_STATE_NOT_INITIALIZED = 0,
> > > +	XE_GUC_CT_STATE_DISABLED,
> > > +	XE_GUC_CT_STATE_DROP_MESSAGES,
> > > +	XE_GUC_CT_STATE_ENABLED,
> > > +};
> > > +
> > >   /**
> > >    * struct xe_guc_ct - GuC command transport (CT) layer
> > >    *
> > > @@ -96,8 +110,8 @@ struct xe_guc_ct {
> > >   	u32 g2h_outstanding;
> > >   	/** @g2h_worker: worker to process G2H messages */
> > >   	struct work_struct g2h_worker;
> > > -	/** @enabled: CT enabled */
> > > -	bool enabled;
> > > +	/** @state: CT state */
> > > +	enum xe_guc_ct_state state;;
> > >   	/** @fence_seqno: G2H fence seqno - 16 bits used by CT */
> > >   	u32 fence_seqno;
> > >   	/** @fence_lookup: G2H fence lookup */
> > 
