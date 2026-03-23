Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 228D5F483C9
	for <intel-xe@archiver.kernel.org>; Mon, 23 Mar 2026 16:17:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA80110E52A;
	Mon, 23 Mar 2026 16:17:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Po9qcdZN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C45610E52A
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Mar 2026 16:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774282649; x=1805818649;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=iMTXY/sTjwkA9/S84sVP1MkCEFPhcTkkFOxYui6VuBY=;
 b=Po9qcdZNKgE/WbBLE7Cqs4WiF4mKyL/35dkECsl3HzSWmFvKvpDvW6BI
 06wjfjqKkTtq186FrVHiUgg2+1zaSXrTkw7Wc/lMvqfy67IoJMYOfDYx+
 CePssRFDtHeXRfG0RUqPSSF7owOwoMduBsRPCltv1mrbZ0wNIQ9qdlza7
 h7FwzpcCVcs/kdzZc3s4itXTGcE8wVwWC/I7UDsPq+oKil2upg34D7kvv
 iLOsgNbj8PGzNntqV6+xANWON8eqgYsfmYpJK0QUsJiwcOSSp8A+CPBBD
 fPLwl94w2n5MjlPfFlX1QAfVgeRU4lqYgb6SxelGv1G2Y27aL8j/hzpeK w==;
X-CSE-ConnectionGUID: NaxfwKzoTdOc6/53g36DgQ==
X-CSE-MsgGUID: Z/f9oh7HTDe/w+xxAQudNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="86653073"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="86653073"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 09:17:29 -0700
X-CSE-ConnectionGUID: Zomlk/rVSXmgHrSKSd9XqQ==
X-CSE-MsgGUID: ldaSzwJcSq6qvqCmMLhaRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="224088481"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 09:17:29 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 23 Mar 2026 09:17:27 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 23 Mar 2026 09:17:27 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.14) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 23 Mar 2026 09:17:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gd3e7dSGux6hRHcz0YnLhwNcFd09L2LDy0gGeMmhMRbOLqgJVPTu8TjIBZG70mSapwtq8Ck5lNyMualHAct8g2lbN/O3DDkWfHpO49uhFvyBl1zMfZ+pEOiXmhaZXTPWRLdXRCZiPYeUExk0Uz+LF0VWMmouhznof0sbdy3z0VyJnQ3juE+PYXmh09X8DM2M+300qeoSnqnltkCTBUvg0cXQyqMm+OKJak5nw/K/B1BprF6hhKyy87u7K4ZYY7VISjL5jYQJvvwckrUZPMzKndCSwjpmP2Sa34pCf0YoPSt9Y9e9UVjlFvY0788I6sstlmS6cWLYv8figFXHxBnfJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qj7GMS6jWcLilu3A3E2kg1JAhWHV9H/wdbW9PpgIGOg=;
 b=lZl/JFcXT9M4nJmsqQYqh+pwEr9xfu05FU23DlPr4iBzaqmSO/dr3Al4Op4YY6hXe95/01N99Bmd9Den6tWo5ZLXmltEEMb5cBYoOGWpaphDfs7AYNXwCIoKFhivzz8+Vq31v9B1+cigv50ZT+STR1zF3DrDK/hsZvKzXPiHk1X4h9jFJfnFjCGE9c2a+/R1EsoOA4crNiCeu7XNelcfuN6iHjDNXjGmWtUKftgq7WJTyMQNMxpIdU7fa1ysI10UQ1zC7PczBt+vpOCbhFB6e1ytOE0GZq8WzVrTaTyoRYuA38Djuv9+hN1LbOu6noqeBngx+aDbcwj+3Ja6Ph3AIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by DM4PR11MB5232.namprd11.prod.outlook.com (2603:10b6:5:38b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.9; Mon, 23 Mar
 2026 16:17:23 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%7]) with mapi id 15.20.9745.019; Mon, 23 Mar 2026
 16:17:23 +0000
Date: Mon, 23 Mar 2026 09:17:20 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Skip media GT TLB invalidation when VM has no
 queues mapped
Message-ID: <acFnkD6HZV4r/8o6@lstrano-desk.jf.intel.com>
References: <20260304233728.926378-1-matthew.brost@intel.com>
 <7f334028a55504b5f75f2fddd555a65107de2a49.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7f334028a55504b5f75f2fddd555a65107de2a49.camel@intel.com>
X-ClientProxiedBy: MW4PR04CA0236.namprd04.prod.outlook.com
 (2603:10b6:303:87::31) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|DM4PR11MB5232:EE_
X-MS-Office365-Filtering-Correlation-Id: 48674cf1-70ad-4b14-b392-08de88f7aaa0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: 4z+cVeA526cUY/seCzvFlIR0L0o+QSUt8hdci56g/TdeI4UlQxDzYE9jOVOeTIugZCfFYEv8rWDM6Krwi4SqhCFIirZ2oyestMICZGQY6ga7QVXhjcjKzAOSc8LMwHWRc4cn2TnaKeOlDjVN8BK9HAo0yxKX+iZQM4Q6vOPr3jrrziFqhSbF4v+jO4XjQGeWq8GZILUKdIOaCINt2K5IYbwrM1g99X6vGzytiv1j3xIHDOvq7udc9ap0w+GfI8w+t3XlvBFOqsl5RPhnPHgItZLK4hWojm42dBjl5re9h4DywQEVCaKSoB9jcxTGpYez7qe0A26nehUFNVMVF/R0RIM761Vbqo++0ep4p5gA8T1wabsqqnI6rOfej81W+AMpQiT3uJA3E8k5wSm+IYgLLR8fCPsMKYuleSkU2h8A+voe6Yd9kXC0YP8g1D8K+QjhZ76cOKLOa4JMyhmUCaRu5ZWlknC2wniY5hIF7JIZ/Stm73HJikTCYVQCQOsXmJ8J7n3oD8oBxZ74Jq5r/2cYV38ZCMcRjwUJi5PEaAvUEoWekuuDcuNAt19wA1rUkx92ndS+7CiA7issnaYLndaFVCeulWZuFMyYnBrqOXI9aDvwkkmMOs1XXd8NxE2OJLj9ekqWwWrUxjMuzLR4+RghzU/lSy1mhnB0RkpmRYu1tutsBCp08NWZ5Qao4F5bsGcSSpnvswqnDnULQfYb20SMlKBJiaexdsIOWydpe3qDGmk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?1f00+34qJ/tkvzRqaU3bAEZYY94Ek/mNY5D03Ce4HaOT1pKYszGQvUdB5u?=
 =?iso-8859-1?Q?5VqM08kywIq63KdzuENMf4z1W6YK5oIGe8WftIX90pVfdHeHOrDHOS5Lg8?=
 =?iso-8859-1?Q?IJwdCJh465oiSf89G4Msso6beAHxaiWS+32W6dhEZs+gmwwYgv9IKlIG43?=
 =?iso-8859-1?Q?5gRYVMJPNjCHVSperKXGGdOo9xJ5V4eywdYkiMAB3KQh2gmbsMVRBLw6K9?=
 =?iso-8859-1?Q?XHFngTgn9dLx8ZkdRntxMqMjrHeoRcePJA5bgKvOj4ckMJVKfZPU11QV65?=
 =?iso-8859-1?Q?OO5CkXXcI7yLbJ+P7R0caOMEp0DA8+Gzjg4EB++gIHkkuqtmiylYaFqiKF?=
 =?iso-8859-1?Q?dl/O7eppFFrlwhmj2dkCUu6gE2gL8IOZNqrnsF8iYJzOV4tF3/dtQI56zX?=
 =?iso-8859-1?Q?NrLpxSTXQOG9ETNDor5qE0ZZkyGxC5c/yIxv4SNK5yK6C7auJF/aMGE5P6?=
 =?iso-8859-1?Q?H34wZvsbLZolKatex2f4sPeQOCARyKVmGCYaFnxQ4lxUFZSrfU56L3BOv0?=
 =?iso-8859-1?Q?iy84ZBt5Xh+fwip+TNrM9SE/Ozz5n0o1CT2CV+BBIdCTuHO6JM0+rvP637?=
 =?iso-8859-1?Q?aKlwo8FIhs5pIOvRNUG5CLPcIil8lgY6N+C4BDykHVsTpecCyf0bW2IGfN?=
 =?iso-8859-1?Q?usRYuc+sHF3s1XF4snOjPrMUJwTnwlE4NDvfe3dMI3bs7JlGu5umBY4tOc?=
 =?iso-8859-1?Q?64AiKF9PTYd80q/i0cJmH7vOw/CqKE8NA5zm8kph41tNqd9w5roFA/3aDR?=
 =?iso-8859-1?Q?Ohs7+y8e+FJwYJn5SdGppNxwUf2x+ieCQjiuQsMccwiy0YFbfIeVJYZTqi?=
 =?iso-8859-1?Q?uKKlDXj9jH99QauxkIv9pz4d2mCkykksJ0XNkKATDOh9wV5AWs+sVaz8Z8?=
 =?iso-8859-1?Q?GumQ48LFjTYl78RcVVN4MC4TgBGYuprPaTbX/LnYGVuxjBAM0HcfzCdAqT?=
 =?iso-8859-1?Q?8iwNAobMz92Z2otdxtuTDYIOTf1oNwmKbFwKCJ9/GkcoL9lVOVBIO2yWwL?=
 =?iso-8859-1?Q?M9xzzyb7cTs4d0GQDqs0Ug8P1Mim8VRxKCzfKaxk7bVKRNmKmYraH7+Zsw?=
 =?iso-8859-1?Q?KqQX/9R9tMUDeF9D8jDl2pSIuXGhtT3braQVSK7gppSSx1uc/Ce0B9KthC?=
 =?iso-8859-1?Q?iObnlX/hGaUIP3F+wjyezGYRFC/bIHh7ZDNg9TyW8YLWdsodDYJSHMPpuS?=
 =?iso-8859-1?Q?omht4z6r+NmC/dMOWiktX4rl4wuC2SqSZWhRqO/ZacSdvcxIw7856Oe7Kc?=
 =?iso-8859-1?Q?3ke0GDKGvsSd4pOol/3n/VP5b3NYAE4l61Zagldoofa4/4iQn7Dd1bDSwO?=
 =?iso-8859-1?Q?+5acqJ+m3ECEVbpkAmJdISgTNxYFEOFnAeinXCax7nqdxIsuk+WeyAxE4m?=
 =?iso-8859-1?Q?6V6OJJx5Q2ahMfKVMhNN2Em/BYhlE/+KP0AUtDc1XHIsB6wnYzReC5fYC+?=
 =?iso-8859-1?Q?uKgc/YmhOWrfqh6SFRs5J6939unRR/naNXDeb0ZL29WxIRxKZbWa5bSrdd?=
 =?iso-8859-1?Q?+dPoAlR0sxpuiDPhgnMyRwqK3pzFwCGX4LaANfZ/1mf2Lfe40hMG6/nRn4?=
 =?iso-8859-1?Q?aQtCnlFLMItsKDydsFe1axWKj9rizDK+cqxCqq7NTcV7EyL1HVLTqaszze?=
 =?iso-8859-1?Q?+dlIt96R8muIbTbOGHjQSPTEvdiGCDXt22LRPLhVy8d/J/Bkti2SjTD7Jx?=
 =?iso-8859-1?Q?go8Vp33BqWCdN7XRH1zgl7p46lx/dn3hvrrYGF4DDAH+9LYP6QYRBQikDp?=
 =?iso-8859-1?Q?6cCgQlaURcgINSNM+M04bvf3j8GqWfhWtfoZLIMJHctaQsIJ2OPT8TU5j/?=
 =?iso-8859-1?Q?Qq5YVj8UIA=3D=3D?=
X-Exchange-RoutingPolicyChecked: n/RQtjQbUyQTtOawZZILYEvGWDRmemyKFGmtFjJkH55FDbVcxlyE1biTi+PG60zhdjhlh4mBk40h/hic5TuCW5WcoHIbsHLpHxg+yiN2rMpaVzF4l8WHF7ixwMaz4SZbCmQTTLskoFSDVBrJZNEIYLMRzOaUh+Y9fygZNKarepmadEByEUYIQuSVuuiaznNrcrdBc4lwJ39G3QapHhip6Ef3zvgGrgI3fbITHBCVSIxf5NpKazg/rUNPOqSHtjNQsbeM+aonGaPj8li0izNyFxp3YWAj2y6JHLiWPoJk1Q4Ww2t2gIw6CHD7E9233T9yVv4P4rCE/0Ab4xwsm82Ivw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 48674cf1-70ad-4b14-b392-08de88f7aaa0
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 16:17:23.7193 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HJPlxN6mGdBt+ZOHsrFpF2/YtU+BgP8GesKlYEm94g8SAg5WyE1+JbRP8BO5nEZaBGaFyi/2RHmpw9yW2ZEJww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5232
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Mar 23, 2026 at 10:13:28AM -0600, Summers, Stuart wrote:
> On Wed, 2026-03-04 at 15:37 -0800, Matthew Brost wrote:
> > If no exec queues from a VM are mapped on the media GT, issuing a
> > PPGTT TLB invalidation for that GT requires an rc6 wake which is
> > expensive.
> > 
> > Skip the media GT TLB invalidation when the VM has no exec queues
> > mapped on it. If TLB invalidations are already in-flight on that GT
> > we can't break fence ordering, so issue a dummy GGTT invalidation
> > instead to maintain seqno ordering.
> > 
> > This optimization is particularly impactful for SVM workloads which
> > may or may not use the media GT. Average TLB invalidation time drops
> > from ~75us to ~18us in such benchmarks.
> 
> So.. what if the user creates the VM, binds it, and only then creates
> an exec queue and submits?
> 

I would think the TLBs would be empty but something is clearly wrong in
patch per CI and perhaps this is the problem. Need to dig into failures
this week.

Matt
 
> -Stuart
> 
> > 
> > Assisted-by: GitHub Copilot:claude-sonnet-4.6 # Documentation only.
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_guc_tlb_inval.c | 43
> > +++++++++++++++++++++++++--
> >  1 file changed, 41 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > index ced58f46f846..20c34469d9a5 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > @@ -205,14 +205,53 @@ static int send_tlb_inval_asid_ppgtt(struct
> > xe_tlb_inval *tlb_inval, u32 seqno,
> >                                      struct drm_suballoc *prl_sa)
> >  {
> >         struct xe_guc *guc = tlb_inval->private;
> > +       struct xe_device *xe = guc_to_xe(guc);
> > +       struct xe_gt *gt = guc_to_gt(guc);
> > +       struct xe_vm *vm;
> > +       int err = 0, id = guc_to_gt(guc)->info.id;
> >  
> >         lockdep_assert_held(&tlb_inval->seqno_lock);
> >  
> >         if (guc_to_xe(guc)->info.force_execlist)
> >                 return -ECANCELED;
> >  
> > -       return send_tlb_inval_ppgtt(guc, seqno, start, end, asid,
> > -                                   XE_GUC_TLB_INVAL_PAGE_SELECTIVE,
> > prl_sa);
> > +       if (!xe_gt_is_media_type(gt))
> > +               return send_tlb_inval_ppgtt(guc, seqno, start, end,
> > asid,
> > +                                          
> > XE_GUC_TLB_INVAL_PAGE_SELECTIVE,
> > +                                           prl_sa);
> > +
> > +       /* Try to skip media GT TLB invalidations */
> > +
> > +       vm = xe_device_asid_to_vm(xe, asid);
> > +       if (IS_ERR(vm))
> > +               return PTR_ERR(vm);
> > +
> > +       down_read(&vm->exec_queues.lock);
> > +
> > +       if (!vm->exec_queues.count[id]) {
> > +               /*
> > +                * We can't break fence ordering for TLB invalidation
> > jobs, if
> > +                * TLB invalidations are inflight issue a dummy
> > invalidation to
> > +                * maintain ordering. Nor can we move safely the
> > seqno_recv when
> > +                * returning -ECANCELED if TLB invalidations are in
> > flight. Use
> > +                * GGTT invalidation as dummy invalidation given ASID
> > +                * invalidations are unsupported here.
> > +                */
> > +               if (xe_tlb_inval_idle(tlb_inval))
> > +                       err = -ECANCELED;
> > +               else
> > +                       err = send_tlb_inval_ggtt(tlb_inval, seqno);
> > +               goto err_unlock;
> > +       }
> > +
> > +       err = send_tlb_inval_ppgtt(guc, seqno, start, end, asid,
> > +                                  XE_GUC_TLB_INVAL_PAGE_SELECTIVE,
> > prl_sa);
> > +
> > +err_unlock:
> > +       up_read(&vm->exec_queues.lock);
> > +       xe_vm_put(vm);
> > +
> > +       return err;
> >  }
> >  
> >  static int send_tlb_inval_ctx_ppgtt(struct xe_tlb_inval *tlb_inval,
> > u32 seqno,
> 
