Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0134DD24459
	for <intel-xe@archiver.kernel.org>; Thu, 10 Oct 2024 23:06:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E0D610E9F4;
	Thu, 10 Oct 2024 23:06:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mdjItbk/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B72110E9F4
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Oct 2024 23:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728601599; x=1760137599;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=NpCFqmNryAmKXdxJFiNLEnlAlcXZqcroQo1h2jrsgJw=;
 b=mdjItbk/hpdGCVN8D3rCM0UTkC++Mfm+Nbl3wBIpD4W0xurJQI8b7SC4
 UGS/xb7mD7vfXyA4dOBPjDMHRRKUT2m6N9a6Wj3+eRjbi2bwfNBiTocRC
 zx9igDc3gp87CeJZLPr1Vya0OJJJwFC9CJObCXdRIidN3BiKR6dlVlTym
 6/OuY9s7tgbAkvbj1q59tm9WDvMomRwGLoDyrntNAl4lIgOf0DVKLtNTE
 sWwha3cJyqARXZI9/lr8dC+wUXhOka3Jw34uL6f7LJ2at/wrURzWL5hxm
 wz0uyKTAuFH6Ks2OzSScCYwc+haMqKtFSI2EX/J3RIFsqpWA8yP6Polkh A==;
X-CSE-ConnectionGUID: +wzZ3fkhQMqqgaHFONvmww==
X-CSE-MsgGUID: 74K/E9wsRgu8VmLZgGAMDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="45462981"
X-IronPort-AV: E=Sophos;i="6.11,194,1725346800"; d="scan'208";a="45462981"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2024 16:06:38 -0700
X-CSE-ConnectionGUID: IQXnKXYuQTKKHkMjyP302Q==
X-CSE-MsgGUID: 7SMAcuaPTMmY+MIXrJO6yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,194,1725346800"; d="scan'208";a="100072151"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Oct 2024 16:06:38 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 10 Oct 2024 16:06:37 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 10 Oct 2024 16:06:37 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 10 Oct 2024 16:06:37 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.44) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 10 Oct 2024 16:06:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XqhjD7xyJwqjhZnt9hKdIrbc6004Pz71uwnwHcOogBmTsq2BwDiVGBKOEMHx4w5zB+MC7+nTHh6YVQAyXkPOrTA5JaBuZf0PYPvt7P/oDFXO7FpiXrXe4JVB1+0MzCtgdujl0E156Gy6F7EuGXB2NMRjGJHaouIjy37wno+HH6X9yM1H50eIYjZFM7Oph6f5POMtvHgrIaAMTuRnVxlG7IeQ3ExkEuKWZnWgaBblNLHFvbMlBQNmoY1I1iDjlE5Wm8E6/fO6zBN3AngLvXU3ZmvmI4UPqVPCVEWQsq1M2555M51GvKYXcCkdWWXjxNh8nED/2Oz5yX+0WD4jUWEfqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/w8Wrgd+rzt5nhu3MsYBoY6xB600Ojv1/Mfj9oqreJc=;
 b=bp/r5jv/Sd5LUD1mZ5UdXEuhnSu5PDypN3jPS8H772vd81dSNy981wE53gyie+FPZL2p7CyAHqTqh54GgJsBnnsyBXNFEQfltbsq+gv28Q/v6Fyrx5KyhiTWDnsGOxTVzQNXDJHOfQH8poeVcyR+0RqXq4S/dHcVRy2k0SKC3f2ZSHGTu6AWEo7h3O9Bf/cZUg6Ygdpzd01XfCWCW9lmAQ5FlOdvCwhqy/GFVRpx6eHV3UIfFsaNr/quAqEHIyWGlmdKiBKLwLJHyjD/yXQ4Jd7ra96jtsQCjDwuS01/58TM6Jfo29zU4ntI+IDnitWS+U+YMoPQZ4IjMwnE6vahHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB7294.namprd11.prod.outlook.com (2603:10b6:208:429::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Thu, 10 Oct
 2024 23:06:34 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8048.017; Thu, 10 Oct 2024
 23:06:34 +0000
Date: Thu, 10 Oct 2024 23:06:15 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: John Harrison <john.c.harrison@intel.com>
CC: Badal Nilawar <badal.nilawar@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <matthew.auld@intel.com>
Subject: Re: [PATCH 2/3] drm/xe/guc/ct: Increase wait timeout for g2h response
Message-ID: <Zwhd56R8t69f9hLi@DUT025-TGLU.fm.intel.com>
References: <20241009105645.1416588-1-badal.nilawar@intel.com>
 <20241009105645.1416588-3-badal.nilawar@intel.com>
 <8711d85f-6bf3-4e7f-8c71-5a838aae588f@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <8711d85f-6bf3-4e7f-8c71-5a838aae588f@intel.com>
X-ClientProxiedBy: BYAPR08CA0047.namprd08.prod.outlook.com
 (2603:10b6:a03:117::24) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB7294:EE_
X-MS-Office365-Filtering-Correlation-Id: 89e4ab01-2a80-4667-cdc5-08dce9802f92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5bQbe0vIfiDE1AdG7O7n1tIof5VlY/QAuqLdHXPeCe6EQbLaNlsmlZrbh3F/?=
 =?us-ascii?Q?8u5rzbl7atnarcVceZI20qIy6MlTkKT8DDQltP/aBdQioWyURnwNLG18gp0C?=
 =?us-ascii?Q?d8Cven4Ai4xK9gJGylCPKMw6kuAj75gaouN1vVnAmgwSxwPcnvEENKghRt6L?=
 =?us-ascii?Q?GrW6+Xgm+c/qE9zuU+4WOg1jM3IUnx/WLiTAvDk8gEiwREMzxmi00UzWCdD2?=
 =?us-ascii?Q?A0HPXbowa/SSRqu7w0rMqmUTHz0NT3wTtzId9R6tvdX49RcbdyGSiZ9L45FT?=
 =?us-ascii?Q?JCUg2bcpTGW03ppzPTcZEBb3Gq9kme9HLVGInEYFjXLIQvA23qKNJWyWpKzp?=
 =?us-ascii?Q?59skaLI/BYif8jInFhbXZ0rsoPinktMsJJN5r1HvoSojfvN9wCrUNUP1FJLa?=
 =?us-ascii?Q?VtmHBi5T7581TlE0Er9y63moi9RSq7Da7ijNyvLzmHxms/W1XJi2vSvBWcGb?=
 =?us-ascii?Q?pPwXd0j8cxRyxqQxVaY/WxwAaxvvP4MSo9IXvKElErtc0iWcPwjPVloZl3Oz?=
 =?us-ascii?Q?UshOg+2DTPrjpZp8Px1h2FchftsmcNSbvvy0j5rSZCHlDZwtOsXXatWSvlgf?=
 =?us-ascii?Q?bOEm1Wh9vcHtQ14tbtxM6tzVP2Yun46bBdHyV0ongiRLH5ZWQxl2pAUNf2n1?=
 =?us-ascii?Q?pDresTYFoehTwBz2qeXHo9gjBuezDdvoKMapFio7SOKaEyG4VFXhRQDjjdsH?=
 =?us-ascii?Q?yrOCQaNq/nYV7rf3e7XiRrAbcTm6AwKoLDN6KTOrfGsTacvlrjL2an22d7o1?=
 =?us-ascii?Q?65on1Tij7vhGAdbJHy0WOqhSIk8PYEIcmFTmyBW26QkU9jJFM9xjQsDF7/oa?=
 =?us-ascii?Q?96jOOtPPRHymf9hAkw5Ov01+dm4eiPp16VX1EkfrbXSyytLphaAbDeIVzvTW?=
 =?us-ascii?Q?Ra5IO1sIWG/3a/4085HzbFa09ACQeDtZnpMMxpJ98+y5N3TVPkfRWBad8fEz?=
 =?us-ascii?Q?XQl0CHwC98ZwMJ8RhDM7tptjbs+5uGCR4lIyRNyLrvHp0ALaKpawAOEKwaF1?=
 =?us-ascii?Q?nLJYOKeQKEsHoOBQJR2EGFMefWhCEXMoORGzWBp/F4Jin5kPEff0f7P3L9mS?=
 =?us-ascii?Q?lQ00M7KUg7FbWtdGDgjw8aLyS4cfSnZloOjv/d9gvV2C+br2orzMxj78tOC8?=
 =?us-ascii?Q?kq71IejaMLuo3lmcBApoXAK1KNXtz+e/FzzJ99M5lPbfguenLE8OLWOFQ2DK?=
 =?us-ascii?Q?us0hgZJsyAJU34FXrmBAH0mdcHYQDzKkt4yYfFkgb0DoEp2CRNwJpmu8NIk?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CKj6XiNEpnZBcJ64rHDeZY4y7hM890rrGvE+E9a93N/NTheDOgsdaIyNwgET?=
 =?us-ascii?Q?wZuC//llH1eWieqtjO24Q4d1gDxsuiKz2n5U135YJjb1d7Rbj81MCqnJNQas?=
 =?us-ascii?Q?mWrMKWgMiKhe88bDOro3n04/pt/Ck0GN9igBYUPLhhYZbYWV2DURKI97NJgC?=
 =?us-ascii?Q?bl5rvsALVHA07G6RMLmiGvWPFd/cRH6G+Xg3W1DxzbML8G2RBRz7esJ6b+b5?=
 =?us-ascii?Q?JcqbyZM+FexrNMWaDkk609H8y7iBLFGlnShA43ioF1QboHmtq8vob9ujdVbc?=
 =?us-ascii?Q?iaz+BwQEojuIA4iNji5G5IHUc2gGuyHctUeDe0zQAUEL9kIsKmAxTmsnHTV5?=
 =?us-ascii?Q?Egcpa1FpjJocOdcRlbfF4SXZJX5oue23T8aR20EOEGj9JnDcFB8sTHjdonRX?=
 =?us-ascii?Q?fPtgC7oW/J7eQ8DTBUrF38mjXNvA3g+xhCdwWMhe4SXMdZ3TwrDu+eMLyX9p?=
 =?us-ascii?Q?cQIqJs60AGrFcJ+kRPX02T0levcVV7pUdua5oSfDxtXkC/CUtM5+NxlrRzHK?=
 =?us-ascii?Q?u+s6aipTefCrYtlCa+t7NcXrwalZqb66eNsNzbEKuh9bGGO6AcutHIiSiF4v?=
 =?us-ascii?Q?Lqj/GmO6Kb7HKncVR3gtDqdGCz0YBxNPSDKBGzUnPL1sCFM2fUri6tu/cuZB?=
 =?us-ascii?Q?q2G5yVmLP1TuXe2kz90H0sozGzFh2iZpoySCz6KnQyvtoKBOM40WgS1xqX+1?=
 =?us-ascii?Q?1vgQCNGn/o3lq56P5JJ6Y8TmACSLUQHP6F3VVpfYAGZEBlYqQK99OOUzzn0R?=
 =?us-ascii?Q?qbzESB3xvP6CDGoNOHI8CzaOt321/wtD5Bf2qVI1ObYR8IG+LjpA8cyhAmhM?=
 =?us-ascii?Q?sUojQvUlmZxY1v8gnJOpqfgl7lMIOA0vLL6JGa8BhGCJoKPAPKfKtC1ew1r1?=
 =?us-ascii?Q?6GPtPkKPiEFDRyzBCrRMUXOisqgWt6DUw/JJrGrse2Mjm4ASCAAyeKpXD/+v?=
 =?us-ascii?Q?xwG4cDnUzuU373luQ5ynAhthry9O9AmrpwPTu9fbYdEI7dHcqb/msVrZV0qm?=
 =?us-ascii?Q?piYHFYcOiu6oQlc3R5Y4q2fHDgkfjSLh1Bg7tSYOtX8ANSs0ueGXgzXAFM6L?=
 =?us-ascii?Q?MeiVaM4GT4tua9eyyNIAOtwJ8wJwbgtvyuU4HrKbVRpmnZqN7GYtJviU9EHf?=
 =?us-ascii?Q?ShToeVMOn3E1KWQjQ8YXgY6+IWjWC1F7M4vsMRiPSPpaGQ3g0I91TBM1qoMR?=
 =?us-ascii?Q?0NLd8VNlb/db4jn75nT1qmXAnGYSQaDRBjmTHhAZGyEO/igtDD8GYhf5FSrd?=
 =?us-ascii?Q?Ra3/rQ4Tf/8Zl/89xhYyfoQvKqErXkPiSgoo5lBqbWz0GKJAys2PBqmbRkes?=
 =?us-ascii?Q?4cMcgNe5pdsDW2VhdY+Y2oPyChDhei5/o3oBVJlhV4HJGhb7w+hEuSVXApPP?=
 =?us-ascii?Q?yxTn/f3KFkpYYwMzrBa0OYh2+bQXAw15GbS48UbPjhGX3P9XAGpkuSptIfq4?=
 =?us-ascii?Q?jplYTsCOK7vmud5owoQgYOEAtcRDV6snAknanDrrBu8LmhfbOayHbWHVQ/DN?=
 =?us-ascii?Q?kTX5Jx2zsJh5NYEt/r6FW7togLIw13AL2/KRKwjh2n9Zfr0FatjqqtKh0zBs?=
 =?us-ascii?Q?kL/rCkRWA5tomMfWzMCnHkV5bxiHxNOpPhqo74z2ZQlXdnlxfFx/qrkjEopF?=
 =?us-ascii?Q?6w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 89e4ab01-2a80-4667-cdc5-08dce9802f92
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2024 23:06:34.4345 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KCFMPbzJ9fUaAf/YM0zDo7P2oEVh5WCR+ONAfUP8WVhneDM+YZY5AuIY2yjRk2jyTU4L1dPVQGJNZvJsHFNUPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7294
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

On Wed, Oct 09, 2024 at 12:43:36PM -0700, John Harrison wrote:
> On 10/9/2024 03:56, Badal Nilawar wrote:
> > Occasionally, the G2H worker starts running after a delay of more than
> > a second even after being queued and activated by the Linux workqueue
> > subsystem.
> > To prevent G2H timeout errors, the wait timeout is being increased.
> > 
> > Closes: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620
> > Closes: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2902
> > Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Matthew Auld <matthew.auld@intel.com>
> > Cc: John Harrison <John.C.Harrison@Intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_guc_ct.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> > index b93b2821e4e8..dcc95c01b6f0 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > @@ -1019,7 +1019,7 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
> >   		return ret;
> >   	}
> > -	ret = wait_event_timeout(ct->g2h_fence_wq, g2h_fence.done, HZ);
> > +	ret = wait_event_timeout(ct->g2h_fence_wq, g2h_fence.done, HZ * 3);
> Is this change intended to be temporary until the fundamental scheduling
> issue with the workqueue is fixed? If so, there should be a TODO comment to
> that effect so that we remember to shrink the timeout back down again later.
> Three seconds seems like a long time to wait.
> 

I fine with this W/A until we root cause the work queue scheduling issue
but agree this needs a comment explaining why this large timeout is
needed (work queue scheduling issue), how to trigger the larger timeout
(tests which can trigger this), and saying once we root cause issue
reduce the timeout.

Matt

> John.
> 
> >   	/*
> >   	 * It is possible that the g2h request may be cancelled while waiting for a response due
> 
