Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72B8BC6FD1F
	for <intel-xe@archiver.kernel.org>; Thu, 21 Mar 2024 19:45:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09A08112082;
	Thu, 21 Mar 2024 19:45:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FI6t8fyn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65CD4112082
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Mar 2024 19:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711050337; x=1742586337;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/wLYxokCsZWg3y/UeBwfD31JBhq0e46UrR9YxHXOZ+E=;
 b=FI6t8fynR3ry7qjCTnKVDKvlzVmfZOZSYg791oR4R7YvKrQ2+/FzJLjy
 Q9AthlQTe4vkQ2KX4uzagiFcAlsyXA8VOAn+5UtQmuCxsn4C87DW0n6u6
 840FTTIy5W5CWcM7JZGU1RAjhX94MB+fuv3zt/20LM2kv7TYsH+n9kKRg
 6KbeQdVbI0ajgC6zdeiDZpDEZv5hV/aeK8bXw8IFmyDsAPnVTvA2m9721
 h+Vu7NPgTkTrEz14w9FOEuotJtedmRIGOx8U1kchRuKgRLGK52E9J8wiX
 wu1TyKupJ9ayiag+eH/aV/yoTTlGxBjKhSOhcoju3drfAegUyQ9qviVoB w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="28540660"
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; d="scan'208";a="28540660"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 12:45:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; d="scan'208";a="37754907"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Mar 2024 12:45:37 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 21 Mar 2024 12:45:36 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 21 Mar 2024 12:45:36 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 21 Mar 2024 12:45:36 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 21 Mar 2024 12:45:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YAg1b+NuycjmjKBvszBwqoIS1PniX6AFelWAfe4qjH/MrtpuHjt9QdQsuBcg6c/Ne+88Wx2xIhnoHAU4HuHYFBNWLKaHtrYaIF5hHDY/LH/Qe5Kp03qwUYjpiD74UnfQD6NYZD4DvkCO43FmKyGSvDU9cNz/5oOacelSjIJQOdQNkETI4+VnxckDy7z/usk6TaePJuJW/0aN4NLpTwIUd4HK6diN3uopHaRJRxxjUSAmYm6poVEizFHvEb+XLBIzaiYyljK6cInIMYxySfq3mGbmgIVXO32cbTEMFSjd/U7g6A/MAQc3boXwoNvDrQ0XK4u0axAPUL77DLhn44p/4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rZ23//dIuCocmOl+nz/yKNr7GXEiE4Vxu3GM7xMAN78=;
 b=dryRwgzCsdSWwnfD5SNHcSOqeQPPXtegqFxm8G6oLvWe//JrBYpd+eGNs2ovcLary/2Q0Gdpfc6pBI+DEThh8XaNJ8Q5uU0OWBBUaPan9AfvCGbrxRDx+sQRaZeCOI76nN7c+ic1WgAlAIw0uFblr7G3ajR6a0joY1pm3vqdn+2UvLeCmQM7DIDMAmNjh55oXoyj9NjdIhpzcv20QtePrq6EEa3Yi24zI++ajXK/vRsPr1bN7dgTXBCfeNM2QaDOrnKSLIfU0P+7Kt7pMDmk15Zz+I3wLozfA1DI/TNGVzN7MNfob/XBbP/3i7zd1LWj32fNZ6OOy5rcpXzJfvedUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH3PR11MB7390.namprd11.prod.outlook.com (2603:10b6:610:14e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.12; Thu, 21 Mar
 2024 19:45:33 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7409.023; Thu, 21 Mar 2024
 19:45:33 +0000
Date: Thu, 21 Mar 2024 15:45:30 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
CC: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] gpu/drm/xe/xe_devcoredump: Check NULL before
 dereferencing coredump.
Message-ID: <ZfyOWmBvYj78bazH@intel.com>
References: <20240320051719.3248723-1-himal.prasad.ghimiray@intel.com>
 <85le6d5w27.wl-ashutosh.dixit@intel.com>
 <98d1434d-c701-4435-873f-023b2df2abce@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <98d1434d-c701-4435-873f-023b2df2abce@intel.com>
X-ClientProxiedBy: SJ0PR03CA0010.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::15) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH3PR11MB7390:EE_
X-MS-Office365-Filtering-Correlation-Id: afe59ea8-4f11-4fea-7842-08dc49df78e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Kw5b3CiuvW4Yb+WZH5iN7EHgp8zQEERRRS3d+PJmqnnughpMkTMOmWLKAXibYqG4FsAwy/dKF0tUSGHSXQYDcP2kYn0yYw82iouQt5OzJVTwBcxOwDjH9aKoEmDP1iMQUtF+4N+Jvk4hLennMylKsRCNEnifSBNQg7YhfzfMQ8q5jsiToArEdAR4GViXNxSSahLuKFGFIi7kv3kt6CgzljrZP5hlwg8rG2uh1WjqXE3cDx2EiIYOQxdXWFVzHujHPSvpI0j5xwewtc6kYjJGOx2Bn5t7EtMwki1HdvhynZ8dLyFktYznGfeSSM4++XaWJbfZLfja3to0ppZyDnDtYa76bXmBYo6fOMjK+TKbLBSYQMLeuDeeCj7FetnnoLgwuksiRgzd4MFCCHdVxnazoaoYNjhVjGbnTWcOz8E6RuesG5S2vsKbr0RFV7IZkf3j9++FYch68OhBnCqbpF/kJsQsRknKY8eyzXfyIq+fzogLCX+f7/BagzIal63zvBmnRNHc6VywFbo0/9LaeGbhkIdXbs/rnWge62494yflI3bQ4o0fKF4F5r9JAECZP8w6WEsf2aOVDKNR1Zh9Mq9dDABzvFVfW0U+TXaIpdwHJy574aCvZ2SgAkL4YVDm4iSnls+KeI8baNa/LBGxT1WD1qFgRKT6Zx1yzGSo2/lpI1o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lUQMDBdulXNJUBNtWvzf+1OYx2ZzrUipZWty2AgCGUafxM8owhX0G3AFd0Oe?=
 =?us-ascii?Q?BTkHusW9Z9JEiJ72Z0ZRoLJK0kmgTVWzQAxMcjmCoK6BxPcKAp2WXPZ9ub3l?=
 =?us-ascii?Q?NPP2FMVaQW0p4n9N/Z/FzioGJMUnBcnA+UhijM4b6x+JaoZqvszhUnqmwDvA?=
 =?us-ascii?Q?OCmB+AEPxlIzxnL7Or5n9qYcr8zgjRc4fyoCZ7es0rlw+h3MSiYt+4keFgdP?=
 =?us-ascii?Q?v4RFc6sxBHTnrlvVXziG4DDlNjy6LPmxHxkrHxhUE0eZiwAIbmr5wksZJCih?=
 =?us-ascii?Q?0z5Xhhr/o9EVnRFmXhIgfEdKwOEMa99h9qI62aowXoZwZzN5TVyNFPYqJIWE?=
 =?us-ascii?Q?cS1nuF4rbQWTq6WBJwMwOmYYYoUV8s0OZZZY2Dcy0gCrLtdaMo7ytOIU66pD?=
 =?us-ascii?Q?KjF6iHW3/EuZ1hLwk8RfGOtoxj4rdnZ3Jl1xlqcWRYZgAWzQVbTADDR5h8D8?=
 =?us-ascii?Q?IULSre/PGK97NmbWym2N8+083dhTbX6VNvFucN0G6TiqHlZ37DoOLikEcUPo?=
 =?us-ascii?Q?gS1FA44FvhXiMfLPhe5JHe0t6fJG/iPKDeOFiicqjtPEzPb4tKCMCWnGxDOv?=
 =?us-ascii?Q?YqFcy4567rTiALHYuHJCwyDaQjZ1BuMHSotBpzB5ff+DdSMFiXYJu5okBgnH?=
 =?us-ascii?Q?1idyvcOh3kHpGSd//Z9N5OVrq20RuLTCI3rPiXjGPdIlls927TmbTZZZByaX?=
 =?us-ascii?Q?5bW78rEPjs542GGtCvybHbQ3IFdikYBr/ES3UU3fhEihd43pYuOXWHCE4u5J?=
 =?us-ascii?Q?m3++MJqsiC4D+a995G0FsvBdMEvP8XTk8IHwGuAdj5I8zoS6Zht6DhCZ98Bl?=
 =?us-ascii?Q?EnSjFCahL/S0xdIt8KmK5xkDQPuM30Rs5EYiCn0aRFmy383vlB5F335u2DuN?=
 =?us-ascii?Q?JBh5100v2kNGdeyuBfC7ur9pvHV7sqENpdnertRvp/n+ZJ9MWe6KnfIUOHAg?=
 =?us-ascii?Q?d+SQ9+3TVoRyCN7YTiHBBjUhufYapdE6RqGqpZ2/swZRTIZsgctrKvOTS5WV?=
 =?us-ascii?Q?BGDXESBsHMbl+W6gNbQ/IHCJrGo/ebMlpLZggicv3BP6UJ13ZcCsGJTfO0Zg?=
 =?us-ascii?Q?Temx64iXsYsA91Um/LoP0NaWuyjIxTSC9CIhyZrwAN3BT/HBy18ITRQWm7X2?=
 =?us-ascii?Q?wmgsWXhw+pu7iEp8UVcZ1hhSoGz6yQeLtXR1adgynfMjcqj3jQtHBpFr/8Gt?=
 =?us-ascii?Q?JlA4std1GzN3u/FG0tjxpjwIF7wHppBagzIkqJtUIU3seMV7nPdA4aK4fCUZ?=
 =?us-ascii?Q?X/ufNmiBVgkPwOLtyiB+dr8MDZrHHedJY/qgrdbysfufBIwTTThX88C/lVZj?=
 =?us-ascii?Q?pwiFGlZTpadaDESpdiBJgcpWh2dVzLJgXlsk4/MXeK3ePyykZrbcoWtWVrCi?=
 =?us-ascii?Q?i9MyX1beGSoQNcTT68skK3SepuGkVEB69GqLM+zWr8pqIuzU9cnUgrmFUxzd?=
 =?us-ascii?Q?p3PHLg7edL8ljhiqmi2ZqRNC/nr8ISm7ff5f3i0MEjcwxd5A3rENit45Zbre?=
 =?us-ascii?Q?T3WUcFAUrkI0y5dX9kSNR7AOJ/Pmx32FgvvEwYUn/EA5+u6SrMgxAeNng6yd?=
 =?us-ascii?Q?tGLxoO2gRfY9uchid+NYSE5cchcAehSLmTJkjjogepoBkgELkw6CkfXTXUHG?=
 =?us-ascii?Q?yg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: afe59ea8-4f11-4fea-7842-08dc49df78e4
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2024 19:45:33.7971 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kTrRF4syEnRzkH9T3TVwODFLOfJtWA0c/CH95P97by2d7DEUECPbtyw7apw8bzzMNSwCu3FOvw5rwr1KGIoObQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7390
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

On Wed, Mar 20, 2024 at 10:54:57AM +0530, Ghimiray, Himal Prasad wrote:
> 
> On 20-03-2024 10:39, Dixit, Ashutosh wrote:
> > On Tue, 19 Mar 2024 22:17:19 -0700, Himal Prasad Ghimiray wrote:
> > > Derefernce coredump to get xe_devcoredump_snapshot only if coredump is
> > > not NULL.
> > > 
> > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/xe_devcoredump.c | 11 +++++++----
> > >   1 file changed, 7 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
> > > index 0fcd30680323..83a1f3cd37cf 100644
> > > --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> > > +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> > > @@ -74,17 +74,20 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
> > > 				   size_t count, void *data, size_t datalen)
> > >   {
> > > 	struct xe_devcoredump *coredump = data;
> > > +	if (!coredump)
> > Needs empty line before this line.
> sure.
> > 
> > > +		return -ENODATA;
> > > +
> > > 	struct xe_device *xe = coredump_to_xe(coredump);
> > Declarations after code statements are not premitted in standard C. Does
> > this compile?
> I was also assuming it will fail but it does pass compilation.
> > 
> > If you fix these things looks like we're back to the original code?
> Sorry I didn't understand this. Can you elaborate on this ?

you need something like this
{
	struct xe_devcoredump *coredump = data;
	struct xe_device *xe;

	if (!coredump)
	   return -ENODATA;

	xe = coredump_to_xe(coredump);
	if (!xe)
	   return;

and respecting all the blank lines above..

let's kill the comment as well... that's obvious...

with that,

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> > 
> > 
> > > +	/* Our device is gone already... */
> > > +	if (!xe)
> > > +		return -ENODEV;
> > > +
> > > 	struct xe_devcoredump_snapshot *ss = &coredump->snapshot;
> > > 	struct drm_printer p;
> > > 	struct drm_print_iterator iter;
> > > 	struct timespec64 ts;
> > > 	int i;
> > > 
> > > -	/* Our device is gone already... */
> > > -	if (!data || !coredump_to_xe(coredump))
> > > -		return -ENODEV;
> > > -
> > > 	/* Ensure delayed work is captured before continuing */
> > > 	flush_work(&ss->work);
> > > 
> > > --
> > > 2.25.1
> > > 
