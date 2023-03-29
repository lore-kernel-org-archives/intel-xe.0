Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEA9BC74A5B
	for <intel-xe@archiver.kernel.org>; Wed, 29 Mar 2023 19:13:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73C1210E180;
	Wed, 29 Mar 2023 19:13:44 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 529B510E180
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Mar 2023 19:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680117222; x=1711653222;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=fo/lGG/9L9JlkjZ/+gXevwSD672jKtO6GrsV/shSmmc=;
 b=cXIgYDzfOFW5c+YCpajxbneNv5qf26pFTzUrLLS/2auoDNPTG3GgpCbq
 YPKtrzNzqMy9XbAC5cRfYK43OT1Eo6RiDV8cAaD12Xu1LytdM/MXktZUS
 /awd2FrGDqePWBxO6tE4o4Y5QaaQ3FdRxocz12Xbj4C7urJnpK8zt6ua6
 q9i+PBkwpZdTXpI0NXaPJzQE4n4ibQG/3fAwqQaPmDBGmpuiTB241+rFP
 r7h6pihPhUXw7qz2tnLWvstQAqotd8e/9P4SGUMYgzNCgzzKjSC8PZYV5
 UheBaBpfFqbX1YHj5oZjrj0Ee1gI011lzuAHN2FmIDTDlARi6Yan+qS7O w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="343423427"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; d="scan'208";a="343423427"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2023 12:13:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="930445584"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; d="scan'208";a="930445584"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga006.fm.intel.com with ESMTP; 29 Mar 2023 12:13:42 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 29 Mar 2023 12:13:41 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 29 Mar 2023 12:13:40 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 29 Mar 2023 12:13:40 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 29 Mar 2023 12:13:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eYUQudCzUumVlPvUWBX2/bMfEfXFFQTylw3AaducaKIu8PYwlptPusZm/hfqrdZuiXTCw7Eg6q+844e7tHs3YdA0n/lotgBktnh203A1la1vMKmGsbT9o+/ftUbnz8tbSs3IG1S/i3lrBA+I7s+DiHsMbV9zaDdXjtgXlsiQJRqgn66a6uwnBTq39KuK/0mL5GKo9uyVbCaqnfTe3nOE4B85+kc32mVoKZvSLy+ePfnma/70SOLJ686S4d3m4FnoBn4j4JFwCiBh1zsqkTtP8cPlfYLjDwStE1dJvPT/tv6D2AV0XrNO6oA5MudgR490XXde/jhrY8iDes+y7YJ8fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FExT5KtX/tHfjf/s1G+Dyo8BjQxGXHtNAMcwhbJLy0s=;
 b=iGKme8StsBFLjX6NcRsFHRtULojbcx2Z/mFDqBoPTrHjkgIbbO8hmP+SNvBVBPC9sKl0S4ytnU4FZPfsuxWNzjf9DeShKvsH9wzTBgjIr60cEThvx2od5xfkcNgLIkRxzu6gzuMpeUyBP87VkLytLKWg4HvLQqh0PtHD0mSZG+8ePLilrAAzu+z5wtq6tul11h30vKR5tu78gWgecBBu0Agr2ZtqJvgGuMlei4dyjLVcqa8kHeKiYujV0x2EHnX8AnfJW/HvrBiSCmQN/pz37nVGPeQrnat1ayKjopnnRKWNfvRqY2h9d1zxrtpnJC5mKkhcWykW4UQhwjdVal2IVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CY5PR11MB6257.namprd11.prod.outlook.com (2603:10b6:930:26::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.35; Wed, 29 Mar
 2023 19:13:39 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2b57:646c:1b01:cd18]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2b57:646c:1b01:cd18%6]) with mapi id 15.20.6222.032; Wed, 29 Mar 2023
 19:13:39 +0000
Date: Wed, 29 Mar 2023 15:13:35 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Chang, Yu bruce" <yu.bruce.chang@intel.com>
Message-ID: <ZCSN356SJZFVB7w6@intel.com>
References: <20230323202313.3523-1-yu.bruce.chang@intel.com>
 <ZBzYPLlnwL86qo0d@DUT025-TGLU.fm.intel.com>
 <PH8PR11MB6950295C09940BD29EE7EF52C3879@PH8PR11MB6950.namprd11.prod.outlook.com>
 <ZB3Mn1atvjMFK29G@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZB3Mn1atvjMFK29G@intel.com>
X-ClientProxiedBy: BYAPR08CA0061.namprd08.prod.outlook.com
 (2603:10b6:a03:117::38) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CY5PR11MB6257:EE_
X-MS-Office365-Filtering-Correlation-Id: 37e49777-3178-4529-3b34-08db3089b3b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g9f/P91EvWrnnjbzu8GHA14dMcnvtKUKZcKR9CIRaHzm0tX/Ms5Jbmv20coQt9dYfpgm/YJ5E06NxHZpWyCcogPYbgs7iG5QIlV7qHxVbP7MTpHbnhV2wCAR4yWwcKY/s2rMMlGtpfnQsGePJkU891381HcvstmFIXKOQ1fz+8ExMT40u6aiJBKahxDO/2ZAmtYtM/ggb5VzsbFTlCIj1i0LB3gD1xU+j4U2Ph/czJ7FDbgWUGyODivn/95Uk3DiZV44Lf8Ke89L6xsxOO+rIPjsAe1vj/WdK7jFs9GjCli7ivoP+Nvgdmqmwq+vS9s547arXXUpskYVkbIRVfXDheRkJ6RbDU5LpYn/7kVea6OOx+IRSYZmLDy2enbVO2BntvU0J4VMo40UKkGHwxwpZq+z3yqTVI02rwNoIBr1Ji4FI4gbCnfGyg/ti35VmBAKPDgLJG7OLdYxsg5ma/S75C0oLZWs/tWq+653yhi3JaqUm5soe0dpwUbAwkEJsE1jRhNYw6pjlk9fOfTfhIkk6SgXsnrLzOjQ0iO51LJ95WHAU/niMaI7SmME5Swl7bWB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(396003)(376002)(346002)(136003)(366004)(451199021)(5660300002)(44832011)(83380400001)(2616005)(6506007)(26005)(6512007)(53546011)(82960400001)(86362001)(186003)(38100700002)(8936002)(41300700001)(36756003)(6666004)(478600001)(6486002)(66946007)(8676002)(66556008)(66476007)(6636002)(316002)(4326008)(6862004)(37006003)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ziWOjVu/KTBTXMb/NlSnGD9suxMyRrOfQgTsETWmH8jkiEi/7Ekt1iMzEXIS?=
 =?us-ascii?Q?isaxwL2TdJpufVwrvYpAitm4XSBxSXtC3nFLbavHcDkPNXBiSKDByK63OyZZ?=
 =?us-ascii?Q?OQSMS3KxKPlbjEacOr6sgU1Of7awx73xIwrc2EzuAxPBWyZuIXhl7614/ch4?=
 =?us-ascii?Q?82LWQZz8Q0I29doh/KhY2F1VxCREZYQgh+DbHqbqk45SXQpL1pO+PMdQzCDB?=
 =?us-ascii?Q?vPMyKduCUL283vvEWWI+WkFHFzYPAdbC0yRfVL2FOlNTTo2vTp4sW5AVZg3Z?=
 =?us-ascii?Q?xU/bUsyUzAxx7yevBB3Gh+LtHDpaEwCXnY0TO74vWD5RjZY1TX9glrDZUAfL?=
 =?us-ascii?Q?Zsz3+8t+YuylRnPyWlWOiaxydqhJrIx7QJeifVDrK9dguClNrj3eYJN0gf8B?=
 =?us-ascii?Q?sKFxlTtg57P8vI6UDEkWClYYfdGueUP5YDCxcPi6QPfOVD1zKEgm/+2EHIMG?=
 =?us-ascii?Q?vMfUZlnvZq3ODakcpDvXMxg0atYZ6HMUhl4bTNO4VXIswQcoeGiwEmY+3x0G?=
 =?us-ascii?Q?/PPLLXjA7SowQBDi+lygDP/juGp89LiQco/DMg6jevREShZo2U9+loA7iMmU?=
 =?us-ascii?Q?z8UIw/w+S8vYxLMWw6U6YTv7dWRlQ6UMsfBqP0hQOtp6v2dMAV3HranlS/H3?=
 =?us-ascii?Q?svJNpqpQCvGqMsHSMPbCKXC6LeVnsKvDNSpe9UerBFctufzNOy3i2o2YhaXL?=
 =?us-ascii?Q?VNq7goi60UQn7fu3RLR/QTtlhx8IB9ozCNix19XISqI9I9QMOZ9Ex9ZzLQXB?=
 =?us-ascii?Q?RM2A2mArGIUWaEAonNrZQa2EyHZBMoAw5L6nNwKIHZQDzw+jU21OZc1GVNoy?=
 =?us-ascii?Q?P6Gj1B3G9gDG6yNVhGOfenp0LJibBWGhFHbHnZHnF5veShoGY3smOa8B19Xb?=
 =?us-ascii?Q?TEMvAKCU+F3UneAlMF0Ffx0eC+xa5BB2q6MzlIarPJAyM66YVi0tAGBlRw2n?=
 =?us-ascii?Q?SKxQ9cFWKNOLXVboePFj2zJhmfQ/T9iOuAEjryiK5NvBR3kEE+gKSd2W+Be5?=
 =?us-ascii?Q?eIeeh8jYFuKgxPEok/rKyxAuy+MkefVt9VaFgsJQ6xn/q2iRRFm7fYFMq9ug?=
 =?us-ascii?Q?tDyE0xh9rV8MOl476hCqa/1yveDXgI0Fw1gMhrjmeC5vBwe57wn8JQMcP6Sf?=
 =?us-ascii?Q?ifB7r871CMS/r4BnIn/WIAoafm2XAph2rgzRWHbahjG9Bi7b196HSZfvaTyu?=
 =?us-ascii?Q?Ogi+4CZSCyV4c4ugwBfDg0HkXR1bIJKdTLwz8QtRnrMVdA9IGqIWTvNKhgUb?=
 =?us-ascii?Q?zqVKIc/NBOIHOICDXoSIFSpDRgq2Byj0xxtfNXLIWuJ6gMmk8xYSFp9QXqvY?=
 =?us-ascii?Q?ETjN0653MLQT9lZm7f+gFjR+rOmmHl9ocVl9HAHeIi1EZuLBdNV+9ODsTMRh?=
 =?us-ascii?Q?oWulaD6lz9uurdYjDZu9hIWE0yYzPipRMR3hIIno59xCYuuoS2gdBr81I7q8?=
 =?us-ascii?Q?5rws87PF/JftSA751pzf2usquwL5KQcFjaZ/3OxW5FG+QdzNs1MjvwApm2FA?=
 =?us-ascii?Q?Pyjsk2i9trqLdURP1Wof/0aKLzjImzLM6dH3DAKR08kJWIiNCvUZ/Zao+/rY?=
 =?us-ascii?Q?hbNqwsVenO7KKlcJA4T18Cki7AGkH1a69p4S/Co5?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 37e49777-3178-4529-3b34-08db3089b3b4
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2023 19:13:38.9237 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LR/u2gFeHiAt7fmzvIYSBEoV3B9sLCgssjkts3rwEhpSkihtiJ3Nwk+xqlsw2SGS/Zssufr7Bd8aQumXZsuk4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6257
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: don't auto fall back to execlist
 mode if guc failed to init
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Mar 24, 2023 at 12:15:27PM -0400, Rodrigo Vivi wrote:
> On Thu, Mar 23, 2023 at 11:08:58PM +0000, Chang, Yu bruce wrote:
> >
> >
> > > -----Original Message-----
> > > From: Brost, Matthew <matthew.brost@intel.com>
> > > Sent: Thursday, March 23, 2023 3:53 PM
> > > To: Chang, Yu bruce <yu.bruce.chang@intel.com>
> > > Cc: intel-xe@lists.freedesktop.org
> > > Subject: Re: [Intel-xe] [PATCH] drm/xe: don't auto fall back to execlist mode
> > > if guc failed to init
> > >
> > > On Thu, Mar 23, 2023 at 08:23:13PM +0000, Chang, Bruce wrote:
> > > > In general, this is due to FW load failure, should just report error
> > > > and fail the probe so that user can easily retry again.
> > > >
> > > > Cc: Matt Roper <matthew.d.roper@intel.com>
> > > > Signed-off-by: Bruce Chang <yu.bruce.chang@intel.com>
> > >
> > > I have not tested this but assuming you did:
> > > Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> > >
> > Yes, I tested on PVC and it used to fall back to execlist mode and constantly
> > print out EXECLIST_STATUS. Now all those are not showing after this change.
>
> But now the entire execlist code is bogus.
> We should remove it entirely or at least add a parameter that allows
> that to be selected.

:( My comment was entirely ignored and the patch was pushed.
Well, I complained about dead code...

after removing the fallback we need to either add a paremeter or kill
execlists entirely. My preference is for killing that entirely.

But also I just notice that this patch actually only does half of
disabling the fallback.

When fw is not found we still have the fallback in place:

@xe_uc_init:
err:
        /* If any uC firmwares not found, fall back to execlists */
        xe_device_guc_submission_disable(uc_to_xe(uc));

>
> >
> > There is still other unrelated issues during __pfx_ggtt_fini_noalloc, and need
> > to be fixed as below.
> >
> > [  223.839894] BUG: KASAN: null-ptr-deref in ttm_resource_free+0xe4/0x140 [ttm]
> > [  223.847211] Read of size 8 at addr 0000000000000018 by task systemd-udevd/566
> >
> > [  223.856141] CPU: 0 PID: 566 Comm: systemd-udevd Not tainted 6.2.0-xe+ #4
> > [  223.864921] Hardware name: Intel Corporation WilsonCity/WilsonCity, BIOS WLYDCRB1.SYS.0020.P84.2103030140 03/03/2021
> > [  223.877365] Call Trace:
> > [  223.881707]  <TASK>
> > [  223.885658]  dump_stack_lvl+0x5b/0x85
> > [  223.891200]  print_report+0x499/0x4aa
> > [  223.896690]  ? ttm_resource_free+0xe4/0x140 [ttm]
> > [  223.903268]  kasan_report+0x99/0x1a0
> > [  223.908683]  ? ttm_resource_free+0xe4/0x140 [ttm]
> > [  223.915210]  ttm_resource_free+0xe4/0x140 [ttm]
> > [  223.921621]  ttm_bo_release+0x3e5/0x550 [ttm]
> > [  223.927811]  ? __pfx_ttm_bo_release+0x10/0x10 [ttm]
> > [  223.934530]  ? ttm_bo_kunmap+0x11f/0x160 [ttm]
> > [  223.940775]  ? __pfx_ggtt_fini_noalloc+0x10/0x10 [xe]
> >
> > > > ---
> > > >  drivers/gpu/drm/xe/xe_gt.c | 4 ++--
> > > >  drivers/gpu/drm/xe/xe_uc.c | 3 ---
> > > >  2 files changed, 2 insertions(+), 5 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > > > index daa433d0f2f5..8a436c95591e 100644
> > > > --- a/drivers/gpu/drm/xe/xe_gt.c
> > > > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > > > @@ -455,9 +455,9 @@ static int gt_fw_domain_init(struct xe_gt *gt)
> > > >  			goto err_force_wake;
> > > >  	}
> > > >
> > > > -	/* Allow driver to load if uC init fails (likely missing firmware) */
> > > >  	err = xe_uc_init(&gt->uc);
> > > > -	XE_WARN_ON(err);
> > > > +	if (err)
> > > > +		goto err_force_wake;
> > > >
> > > >  	err = xe_uc_init_hwconfig(&gt->uc);
> > > >  	if (err)
> > > > diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> > > > index 4ccf2b3435e1..70eabf567156 100644
> > > > --- a/drivers/gpu/drm/xe/xe_uc.c
> > > > +++ b/drivers/gpu/drm/xe/xe_uc.c
> > > > @@ -54,9 +54,6 @@ int xe_uc_init(struct xe_uc *uc)
> > > >  	return 0;
> > > >
> > > >  err:
> > > > -	/* If any uC firmwares not found, fall back to execlists */
> > > > -	xe_device_guc_submission_disable(uc_to_xe(uc));
> > > > -
> > > >  	return ret;
> > > >  }
> > > >
> > > > --
> > > > 2.25.1
> > > >
