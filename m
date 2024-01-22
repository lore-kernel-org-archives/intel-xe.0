Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B14FFC47DDC
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jan 2024 20:20:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B14110E7D4;
	Mon, 22 Jan 2024 20:20:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF09110E7D4
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Jan 2024 20:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705954858; x=1737490858;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=E8+t9P9V1tgZG8SAUSAfsy2oRGnuSh0YPQs4P/K23sw=;
 b=TOTUnWWs4koAHoT/DPU48b8+AjvvtEZoQVRoa7hRo3h/7o1rNRDScQ2Z
 1IIkXd8y5Ghddrwr2lqgfb90OF4AYr5Z1I7aXxIY0Adcis3mlRUdZMBNl
 HuBFjNIrtg1SRh0rFMJjQ/jLaWMkLq22ODsfnDu5O9ichHQnXHucp8wMC
 W7s9uW4nyhJXQpNo2pERpIbDPcoIWK4cPnNoQ7iK1u8oewUvDLqbA7UgQ
 EJ6sRJAqjA7yIvUyDEETW5GNcKlRdlttLDzRvXndqYtWK7Se2JchzyZKi
 7xJ8iGWyPt37EQMNhrHhEMSlRS3/8hLGUyURyW3wR0ez6HUSJVs/Az5QH w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="391741770"
X-IronPort-AV: E=Sophos;i="6.05,212,1701158400"; d="scan'208";a="391741770"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 12:20:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="856059116"
X-IronPort-AV: E=Sophos;i="6.05,212,1701158400"; d="scan'208";a="856059116"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Jan 2024 12:20:57 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Jan 2024 12:20:57 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Jan 2024 12:20:56 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 22 Jan 2024 12:20:56 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 22 Jan 2024 12:20:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F9RiIIThFY5e9vzAI64p+BbbQD4TKVW/VI8DJ6d0oJ32JR/dt1JqBooU9QM/K3aGHw3FQk0OKBOXySFpGIJHcP+Jm6fuFfJCrW45B6DkjLSnP8GdHw4vQuAtylPNr+XJPQupwbC8AFos27sJPw4gAla4ScEfNtBtMxomopOWXA/12xAw1DUTDJWGAHvYzt5V8S9C+c/oQ5th1cLomU7oPRe+Y7WdkuOu2xvYQVXuPIseashpb++TXGYqQcNLYGp9mci3nsOKeceJSY8lsrsMj2ofRUKmhnvJPw/8bOY9sSwho3zc5JnM6GFAT8OvxypKmAF4IzwvF5ip1GvGjDgEFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CfyjcRh0SgSgrZuLxsw/9dmTlr/Me7UHD1OmDTnjg4c=;
 b=N3PdP0cTtkAJrH48b/imGfikYGgWcY928jTmgD1ucuEbLZcHeG/7UwnUJfQ1H65PZfHbDHcl+NsA+rAawkcVXmhgRR5KTVmZps2quvIiogaCvyaVWSepezUxerHs8WLCio58zXX45JgQWlvyGIHAyAigcfa/cfyjmrqGulFacw66ocVLGDD8YCsHLD2waS7CC60axJbN2pseMQY0om7OolShh0Z3ldh+GIVW/zMioMM73SesAFmcP5DmHMRLJTdIHmC83Gf6s0sLY37zGFzy0VPHp9zIIhbJ5kg5qMqjA4RGXzwZKscwtasqjqVaVJyRNc6u/GCRj+BkXeGjQQinsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH0PR11MB5457.namprd11.prod.outlook.com (2603:10b6:610:d0::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.31; Mon, 22 Jan
 2024 20:20:53 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7202.031; Mon, 22 Jan 2024
 20:20:53 +0000
Date: Mon, 22 Jan 2024 15:20:50 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Souza, Jose" <jose.souza@intel.com>
Subject: Re: [PATCH 1/9] drm/xe: Remove double new line in devcoredump
Message-ID: <Za7OInHbWLmJZcu6@intel.com>
References: <20240122170445.108856-1-jose.souza@intel.com>
 <f787dab50690396e0cf1159da66321a85069009c.camel@intel.com>
 <1fa902956e2dcd9092934f7587fd1f4fa3e5bd81.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1fa902956e2dcd9092934f7587fd1f4fa3e5bd81.camel@intel.com>
X-ClientProxiedBy: SJ0PR05CA0196.namprd05.prod.outlook.com
 (2603:10b6:a03:330::21) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH0PR11MB5457:EE_
X-MS-Office365-Filtering-Correlation-Id: 0482fb97-dd49-493e-0df9-08dc1b87a222
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GwNArds8VPJQcfgNuxIzAKPeE/Prc7SbLDazwrwgXPl2rIysRa3GwTP9eKSAhlMMvOz0p2tclQ6y4ByYgdJXqZu6iWNVHqrDGNMu7ifoIiREwdZEWhIpVgJlMF6MJEqpMoYSY3P3roOQnXiiXsJIue1nzHGIQTAuX+zA8BQlCqk9mB2sydd+RRCE216nqP3Az/EzyVbaTd7MewXza0S1xjUToc9stCBon4wvECUfACAQMujwsqGxB/AIlPa8EGKz06LpxwD8Tct/k2XgiXlv4ADaKlFKnlk3RAOisxlin8N2yEF3qifJPb6TMHK12PF+SogStyMhaaVSY7Y+Tq9nTCJIMPNZCcynUC5EXvemfzdsWp0UX7tRSF3b5WQtATwkmd8ktOdRWJIKkCpD8aWavmGKzWUqs8D1R79RVuVmH91MwrrKpjzgaimUfxeOI8hZMAg1aFsVm5JsjeMmAiyRm2i86Nr5wR+b71bzGht435WDrkStTiQdRIrJDrXONpzytbh2XMwmegJI9xAo4cHyr5OJBA0s5cBD+gttzywSFC3OAYCunWPFQ6/Dd0y9DJ5E
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(366004)(346002)(376002)(396003)(39860400002)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(6506007)(6512007)(2616005)(26005)(86362001)(36756003)(82960400001)(38100700002)(41300700001)(44832011)(5660300002)(83380400001)(2906002)(478600001)(66476007)(6486002)(8676002)(66946007)(316002)(6862004)(8936002)(4326008)(66556008)(37006003)(54906003)(6636002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?e2s9ASLzVyCcXWgv5950RZMnyCLCbsu4KfmUjUl8iuOOpo9S2Ukyl3KL/G?=
 =?iso-8859-1?Q?MPJtD5b/wrEqu8/erUHk2kAsTNXLVzKyHXC136+LRiK03bMkvBOxqNHWZj?=
 =?iso-8859-1?Q?Xu0bSdAn6T+2EA93XnrzW2schWeDoOwTjcScnb0QzQ+STuRyFSwSDVrXfg?=
 =?iso-8859-1?Q?Y/ishfo1O57WNtuxBvqfTTSEw7/XgK5hbSjjSdSIOu0rHyVTF1ZoPawFWj?=
 =?iso-8859-1?Q?Z/b6xAKA4WGVATdT7jsVPGGfehuArtcfIiR/t5gCGALkoL469CFVHFL3Uo?=
 =?iso-8859-1?Q?Youj9jgqV9pu9e0foCNh9jn9B/8aReNOkb1HHU2xn+8hdSwUrQK1bPaD03?=
 =?iso-8859-1?Q?DXw62MclfIyaypuWZ1WIxKdDA8o8z2YSkL5K1tklznnn9o4uJfOga0+s03?=
 =?iso-8859-1?Q?xdfUT6qv49bWxjWdRMgbJN0YTgNLXE4pPtmIp3kWpUZJoBzP3tnQFk/VvR?=
 =?iso-8859-1?Q?p3MEISyxFLemQ4GKjOihdcCTKSgPuoAx9bFXa/YX8c5++rBw1+6SlEckQ6?=
 =?iso-8859-1?Q?u/FopfONC4MzW7r4nbSSuerioK4C79/1ECtBtVBe9NZRsS17haRkSFAbOi?=
 =?iso-8859-1?Q?a5KE9IR2lLQJ/B9AaM9WcqaK14JpbQCOtUnhY6ZQQlq/t4AMkuJqw87laR?=
 =?iso-8859-1?Q?bfFeN/b93SMAfYnx9YEmfNbP1quhAJrtRcPNp8bY/AzVQmy5OJ1PHbiQkU?=
 =?iso-8859-1?Q?kQRRru7JAhbuuXpf2x23v5naHoDikALa0Ne9hI7rSXJT8grTOvzc4QzxSO?=
 =?iso-8859-1?Q?bB5kQOvXbRiaY3hGjWMka1I5sfvBPpH0iBe+/X3qb9wXUmLlpgIoEqFzH8?=
 =?iso-8859-1?Q?sV6POT+M3nbtp8+Su282x/lPXVF/w3SCwIzLDTwEZuEKA6g4X392Cv31kv?=
 =?iso-8859-1?Q?qeQMN6EJto51hiQ+uEnYhii0uyRqRHNtYsB1UBN+sYclXuC0aeZhh4L3fp?=
 =?iso-8859-1?Q?L1Jgmvtk8pHetwHON5Y93NZMAQ04ZxAEotejdjqEhc1LqznQtnIUS3ZrUW?=
 =?iso-8859-1?Q?LrdPVGni+jazyxL/oq9ET5lqJNBQbb5MhnDzHvou6t0cc2U2IKwUoZRimH?=
 =?iso-8859-1?Q?NxIJxBi66kYXlcr3H5M0k7Hoot0P77AK0+2ccOCWY7NNVHVD81+fz/wSWx?=
 =?iso-8859-1?Q?r6XYLKVT27l+YJqoLLPd6UHUQiv+S3eZU4/E01vnqfyxA5+aKUJZsnhW3W?=
 =?iso-8859-1?Q?493sWxixrF/kzM+JRBCbNbSAo/b7L+gqAcYJKvHbfKJBTbn+fE28bHN367?=
 =?iso-8859-1?Q?gkAuRX45Ib8KzxQ1WCPWSINHfjEQECycXBBu+d503j5TrrHCmwKTBNtk9O?=
 =?iso-8859-1?Q?SgpEGZal7oxJ+bzzk9QcozP8k86sYd3CW44phd31QjcFnbyV5EHcSwCGG7?=
 =?iso-8859-1?Q?Wm+qJjSPs7+IXr29gxV+/zk4GNyBR+uSdwq3BkPbmnHZD57S8pczZBLkk/?=
 =?iso-8859-1?Q?qIokVMVs1OwUObCz2CrCXbOFriseUB6AQjGIG1reNheONdN/AlGxldGnfO?=
 =?iso-8859-1?Q?YYEv25kwpKNvT0bUaMZCmyZ8YTpagcyEK0vtYsaYAsdGdJuLJtLyyQx3B+?=
 =?iso-8859-1?Q?HEqKPenp52rKJA4WQFjQAikmYCcI8AMi5RzhqS/R7F8SQv1XjuY6T0OFNp?=
 =?iso-8859-1?Q?+IFqZRPllkuL80GVDxXnCKNfvsf0mJfTT/?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0482fb97-dd49-493e-0df9-08dc1b87a222
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2024 20:20:53.6434 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GuFfpeExpILJesKqbwpNIvRws3rXSw26XW506s1hTbZ0zA5IhniMaCVUOSQqVDYdnjbuEdiRegb8mOlTK/q5Pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5457
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
Cc: "dev@lankhorst.se" <dev@lankhorst.se>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Jan 22, 2024 at 06:40:14PM +0000, Souza, Jose wrote:
> On Mon, 2024-01-22 at 18:28 +0000, Summers, Stuart wrote:
> > On Mon, 2024-01-22 at 09:04 -0800, José Roberto de Souza wrote:
> > > Right now devcoredump has a new line between '**** GuC CT ****' and
> > > 'H2G CTB (all sizes in DW):' while other sections don't have.
> > > 
> > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > Cc: Maarten Lankhorst <dev@lankhorst.se>
> > > Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_guc_ct.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c
> > > b/drivers/gpu/drm/xe/xe_guc_ct.c
> > > index ee5d99456aebc..0c07355690948 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > > @@ -1366,7 +1366,7 @@ void xe_guc_ct_snapshot_print(struct
> > > xe_guc_ct_snapshot *snapshot,
> > >                 return;
> > >  
> > >         if (snapshot->ct_enabled) {
> > > -               drm_puts(p, "\nH2G CTB (all sizes in DW):\n");
> > > +               drm_puts(p, "H2G CTB (all sizes in DW):\n");
> > >                 guc_ctb_snapshot_print(&snapshot->h2g, p);
> > >  
> > >                 drm_puts(p, "\nG2H CTB (all sizes in DW):\n");
> > 
> > Why not here too?
> > 
> > Also just visually IMO it is nice to have the extra spacing here. I
> > don't have a strong opinion though.
> 
> This sections outputs like below what looks fine to me:
> 
> **** GuC CT ****
> H2G CTB (all sizes in DW):
> 	size: 1024
> 	resv_space: 0
> 	head: 0
> 	tail: 424
> 	space: 599
> 	broken: 0
> 	head (memory): 424
> 	tail (memory): 424
> 	status (memory): 0x0
> 
> G2H CTB (all sizes in DW):
> 	size: 4096
> 	resv_space: 1024
> 	head: 137
> 	tail: 0
> 	space: 3071
> 	broken: 0
> 	head (memory): 137
> 	tail (memory): 137
> 	status (memory): 0x0
> 	g2h outstanding: 0
> 
> GuC ID: 2
> 	Name: rcs2
> 	Class: 0
> 	Logical mask: 0x1
> 	Width: 1
> 	Ref: 2
> 	Timeout: 5000 (ms)
> 	Timeslice: 1000 (us)
> 	Preempt timeout: 640000 (us)
> 	HW Context Desc: 0x00435000
> 	LRC Head: (memory) 416
> 	LRC Tail: (internal) 552, (memory) 552
> 	Start seqno: (memory) -124
> 	Seqno: (memory) -125
> 	Schedule State: 0x3
> 	Flags: 0x8

makes sense to me as well. But without the extra line it would
also work I guess.
up to you:

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>


> 
> > 
> > Thanks,
> > Stuart
> > 
> > > @@ -1375,7 +1375,7 @@ void xe_guc_ct_snapshot_print(struct
> > > xe_guc_ct_snapshot *snapshot,
> > >                 drm_printf(p, "\tg2h outstanding: %d\n",
> > >                            snapshot->g2h_outstanding);
> > >         } else {
> > > -               drm_puts(p, "\nCT disabled\n");
> > > +               drm_puts(p, "CT disabled\n");
> > >         }
> > >  }
> > >  
> > 
> 
