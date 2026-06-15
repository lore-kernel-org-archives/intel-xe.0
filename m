Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28F82CD98CE
	for <intel-xe@archiver.kernel.org>; Mon, 15 Jun 2026 20:03:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEF3810E61E;
	Mon, 15 Jun 2026 20:03:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FRIbu84V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FB5110E618
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Jun 2026 20:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781553828; x=1813089828;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=3rd6DGg2VNXmJJlNASGhXPw58JeEYY0/wPSHT2WLqVg=;
 b=FRIbu84V/fzDboaPfKjD3DH2CipARnnI3PomLD0SdE/99fj+w3TJCnEA
 ZprcXv2g6xxRlCv9CPyQt/QHTn1NxUx0sbxEYhM6SyObOP9sG13IaN5Ye
 w+gxKVgSOHuit1yuyVgnGECHYfvvcR06duurM73bbpxqSQhQAvRGEsIKV
 B8rGd41B+EVDOloq9F3rSzNFNCPsbqo44crTrv0oVS+sE8F+frtv3xzTm
 N11THJ60Zq/ccpJRL/q87TCFLVV0v7tjv/de1oNJI92tc6wF+//i/Vj1h
 tDVhmpE5fp/sDOMJuWuv9MTMm74ou9c1JZx60b5ePgf2HV4bmgHmfCuMO Q==;
X-CSE-ConnectionGUID: SCZb4EPrQcacXi1+TRg4og==
X-CSE-MsgGUID: hF/HQLU8RP+DzkeTEKPYfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="81318595"
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; d="scan'208";a="81318595"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 13:03:48 -0700
X-CSE-ConnectionGUID: fjZFYJTRSSWaWBWsyXzwiQ==
X-CSE-MsgGUID: XPgrJdNzROOue2vn3nkUvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="247424638"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 13:03:48 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 15 Jun 2026 13:03:47 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 15 Jun 2026 13:03:47 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.4) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 15 Jun 2026 13:03:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eWb+WwP2R3drvglyAizemgJuGDcW1ZS433YhQFelaUODpTZ9Ch6gb94s5eyrp9l7tcygRKUmIVTe3X7BVM2YVkjLe0EiVs11F2uB3JzDu6sPKKhppG/zyAJQJ8/0QlWCfzDMr8XGtE3oTrlPGyIz1ZnDn97RQx8DljJzaNEB9DbYzejiEaWGRJaPPToK3dmCNYCUxZzR4otEhcrhb1GSWYq7ICpedbWxuYRr8ybT9GKcztBiLwEL6Bj1cU2KUzYo5E/gx89vKxUQUZa93m/eK7i9CVd0VtAkzkZ0poxRbhMtaFoExuctA2fXQL0QIehzhl8vnhMWJmLlQgxIhMg+cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pfyrgP+1fEeE7Pi77A+K74CgxgK15nRwUacW1pGZs2Y=;
 b=elZjpP4/w34aFtBStSI3FhosDWOCLo9D+7XBibohDFyUwdGxBHZpE/RoA8/zMDUJc0Oilhyomz20g5x5g3l7l7yyQl5ww50oPnifpIxWmdu4w2oTpVq8DX19yLkIaXE82bhVhzelfYvypUhhap7ts2Nhc5WHx3V78WVG9ROngwzX59E3QXoSDBjDoG+UVxkAh9BKe/ZsXYPu43+85pZxuH2GdoBGmYgsKkjigMUkousoL+npo0ebahZaAuCNESE7Vlva5mEcgj+C+mesKrc3okDHKhGtdpDMy2ZsOPAzq0lQKZaz+17ZIEk/B1uVdnBzl5C73RNgt34MHZutRb093g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH8PR11MB7120.namprd11.prod.outlook.com (2603:10b6:510:214::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 20:03:42 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0113.015; Mon, 15 Jun 2026
 20:03:42 +0000
Date: Mon, 15 Jun 2026 13:03:39 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH] drm/xe/pt: Fix NULL pointer dereference in
 xe_pt_zap_ptes_entry()
Message-ID: <ajBamzPvHnzejdBL@gsse-cloud1.jf.intel.com>
References: <20260615091904.165762-1-francois.dugast@intel.com>
 <ajA/Yy/py1Fs+vUz@gsse-cloud1.jf.intel.com>
 <ajBORuKifZevsDgd@fdugast-desk>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ajBORuKifZevsDgd@fdugast-desk>
X-ClientProxiedBy: MW4PR03CA0064.namprd03.prod.outlook.com
 (2603:10b6:303:b6::9) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH8PR11MB7120:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e52d8d4-5447-4b98-541e-08decb1932bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|6133799003|22082099003|18002099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: dotjYsiEyGogEGpbI60vZEbdXv0So4f74yVh/iehWL4wp0f/UhVj5FZjGqqZ4lLrXig9PenuEdectqdoQRX5SvJh2gP+5fXQXZEwRGL4sf0etZBERlb7TT0/l7aT/gjySmZkOpWCbPrKDkBM7opJJJV5eUgh+M5VHWIch3ofUn6bPmcUP1+fRSXwADoXpvH5HBJNmuR77kB4JVIEXM6KNczZPFmb9Y92Ia85CicJLtslpUiuD39yFYFykOy55stQmq189GBpi9kf63xNXcF6MFI/9xPxSDvj0H7DxxRIJdU+fq5P5D2j+PLES8UYk1SMdNw66bC2ogq4+I1cYPXzDrTdPvwqrF55O0eYydtdL06Zm7wxbUkty10ef9BPx/LB+1boK1NkIDw4pL6F6TjFeTbaTB7qJ1DMEbC5RMTdYYiYJ7HRWuYhgPIsAc3Ila7QxyfDbfy19KU1J/TSyz4vC1HqOx6foFOo2tO8a02V8Qxjf0lyqX8pTmivr94aN2cSzyeTMOWunSeQSpnWwkHkg4xhd2RRTVqghI7EMa9A5JuQVZqikvYbSUxO505byD/1L5oky4uB7cP8KW9KFFAisLbR9pRi7Jf4VXIS85k7YvXEc6emG4mGlZe8/XVgG6wMsWRrtGNkNPx3DQV5C9yAwnpR9BXHymou5mEqD3wg8c9tlZs6yMt97sJJJ9YQXflX
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(6133799003)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?VoUPdxsAD/Xoo6KPG9uuG3aYDT6T/42HXW5iA+QwkaR+Y7+TrxklsK9VrR?=
 =?iso-8859-1?Q?DmMJLTzI8jMuSweP+8hRwRd2XoGEyMGShmR0+U6RB+e4Wynv4DMo1m8GGt?=
 =?iso-8859-1?Q?j6DN549NIAgygCd0mbF9lTaN1wQfFbOjX9D0yB1G7fKu357bPjc5PSpKkB?=
 =?iso-8859-1?Q?h9q+JdB5DCSf61AVGQ80P+uCtGilFZYe6Vuy1nkwwO/HwgQ1RiBKQ3Ug8g?=
 =?iso-8859-1?Q?xUN4jKmbMS0qsBwbyU6NrY0pqzstgj2o987s8G+VY/TB7bFHQ5zqHshztM?=
 =?iso-8859-1?Q?cpn867bjZuUV1x9OKhHRJsqxqtnXB4++CFYQC5i8/5dD2mloInYSJ6JAC8?=
 =?iso-8859-1?Q?L3l2Jj7SsxekMGKH4qTamSX6qWJDCQBOApBYUwPh9IronShmJwYLvaKQrm?=
 =?iso-8859-1?Q?2QW/jGbUA62UkAvqkSDYpuk7se37ELlf+Im++HUuRrvOqVh3Wx+Ofowkj6?=
 =?iso-8859-1?Q?GCi+9HVURDgXOYjKxzM/ODRSGWQERLAYflVb0fx3d8WkR9nwdXi9EAYksD?=
 =?iso-8859-1?Q?R0OZYQ2QFMT1hRaQ3AFbG0gKos0uglPVq7oG8GziK/cLLSD5AtqWD09685?=
 =?iso-8859-1?Q?ncyFl+tNd0oEz+UFLt9GbPABpZ+pv4ma47eB1qhddktWPQfZEtNL+3a9h4?=
 =?iso-8859-1?Q?H2SceGFDoRB9DgrFWGr+Yp8LredrwbQtq/+gXczlf5C2LdlostlxAu1v3v?=
 =?iso-8859-1?Q?VnDEEF9S7o+FVmb0qrcCNMOPmPMGAu+cKxti9PA4c/wDRBVnVff1UyhqaZ?=
 =?iso-8859-1?Q?lmWrx6yJcGhifaBwcZOcgBIUAaeBJCXV4ADZaBlwvYxEoAcf/yv88IjaTq?=
 =?iso-8859-1?Q?GEJF62OR6r4fQUGMunnNDL1K9UFAYH9VE348Qr+D/vRK+JanrA9fQrGhA6?=
 =?iso-8859-1?Q?/bSFHnjg1W7II+A6geeo9BQ/e32ZmKHyr3PU0RGVzRm/0CtU8lqWK61wfp?=
 =?iso-8859-1?Q?6j9LwQQSHM4mCOnljw+f4ig8UNMLQRormj2lnbwKUk0szUeP3wqtiFwZmF?=
 =?iso-8859-1?Q?8zKI9iF6xs8HeeGtG2jOI2hidV23vgc5VY+rYLQwllTAnhX8X6tJpvhYcS?=
 =?iso-8859-1?Q?ZQoLuFVzGltq9TYlh3xsmzz2ym/LZFVXG+T63lGZQzpw/6Sqv74YB33mSZ?=
 =?iso-8859-1?Q?SXGbyPeATcto9FSTak/NGanSXWP+Pn1DBJSu5gUlVGRfIUxuCbolTuC/XB?=
 =?iso-8859-1?Q?t8dxhHtf8bbdTeru/MhdABSn9F8heSOaeCav0HkF26hlLYQKokcCZP8IAU?=
 =?iso-8859-1?Q?6H7jVWIM7MkGITLu4UGCqk0NrSzyexBXndXrXagxnwNqQh5/sQY9Nxmu5T?=
 =?iso-8859-1?Q?FsyRqiqm9UYGpMKp8BGahoHoUWAtrJEiZ+8YmZuaf0tx9ZjWACeUd/1FhA?=
 =?iso-8859-1?Q?L53AujE/tLQJgvb/Hu3bSQG9Xgoasy+Z1jeV051THhur2GAtGI3AQ8NCc2?=
 =?iso-8859-1?Q?gQKROfpgO7/E15s8pxv7c6pkfMf81zL8KAL0ObiW+5+0kMcjCd/g3NgKIa?=
 =?iso-8859-1?Q?Li5O2H/cdX87f9xwI76jk7KI3ko7qRQ+WCyCVf+cY3Wl2GW6QdAmOjewWr?=
 =?iso-8859-1?Q?lzYVDeMWoDaJsxMMZu+SFzP3i2qJd/Yep7FSjwp0NUO3ZceOGiY/4R+/mD?=
 =?iso-8859-1?Q?jF05I5RTlzaHK0snrn4LqMDhcHVW507O4rSN45cQpA5ubScS8Jcv8TcUb5?=
 =?iso-8859-1?Q?EJWt3KsuHPzOfEXhJZbx2pnMMMlAQW8RwecoXQRuwVWuQq4HKKKh3Vj0vJ?=
 =?iso-8859-1?Q?NRZMNzRgzYK61KJnhAh7Cr8BdHelluP4JB8DhUqcftTZiTiPlxoifShlVX?=
 =?iso-8859-1?Q?+tYVbPOfy93e8aix+XV9fr3uevty68o=3D?=
X-Exchange-RoutingPolicyChecked: ALPQTfVQXUQddHMY9gFEWiZrCl3i0wkif6FnUTC/PWF/S5gprjPqc0AVoJpXDavZOW0Uhn/Ld2AI7ZjQHsC56wIzycKWikeHR1T8AVMtLce1JWtlzc6APc/3EUWIMt+RsE0gvOFErCFUT9rZjqZTfXlgfFm0AHq4IDW1wuOdt7GYuf4kNKxpnk4yment/Xmfm1TD2+IdAbWtEXluR0QLRbNDjXbuw4qeke9kG9753ofN8QQw+6+YckNWjEg3dx5ouGfR5j6AjO5YVYwAuD4loBDsUHx34T0WRocSqRQ7Ign/8JVYfCQyFsyNRpedMV6tiZPGNP3drqbsAdSvOGI/nA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e52d8d4-5447-4b98-541e-08decb1932bf
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 20:03:42.3573 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jMuaFF56+PTcGaaFq9JhcUG7Ou1GX4Fywm2dZqbS7sInSgOa35TW5lFhc6A1my/7NkZ/loklwiPGdMeGS7Ndcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7120
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

On Mon, Jun 15, 2026 at 09:11:13PM +0200, Francois Dugast wrote:
> On Mon, Jun 15, 2026 at 11:07:31AM -0700, Matthew Brost wrote:
> > On Mon, Jun 15, 2026 at 11:19:04AM +0200, Francois Dugast wrote:
> > > The page-table walk framework may pass a NULL *child pointer for
> > > unpopulated entries. xe_pt_zap_ptes_entry() called container_of(*child)
> > > before checking for NULL, then dereferenced the result, causing a crash.
> > > 
> > 
> > Can you explain when this occurs?
> 
> This occurs when running specific workloads for extended periods of time
> but I have not been able to identify the root cause yet. But in any case
> it seems like a bug to first dereference then check for NULL, it should
> be the other way around, which is what this patch is attempting to do.
> 
> > 
> > > Move the container_of() call after a NULL guard, so the function
> > > returns early instead of proceeding with an invalid pointer. Return 0
> > > rather than an error code so that the walk continues to process
> > > remaining entries.
> > > 
> > > Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_pt.c | 7 +++++--
> > >  1 file changed, 5 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> > > index 15ce77ce7793..123f97b9ee42 100644
> > > --- a/drivers/gpu/drm/xe/xe_pt.c
> > > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > > @@ -885,11 +885,14 @@ static int xe_pt_zap_ptes_entry(struct xe_ptw *parent, pgoff_t offset,
> > >  {
> > >  	struct xe_pt_zap_ptes_walk *xe_walk =
> > >  		container_of(walk, typeof(*xe_walk), base);
> > > -	struct xe_pt *xe_child = container_of(*child, typeof(*xe_child), base);
> > > +	struct xe_pt *xe_child;
> > >  	pgoff_t end_offset;
> > >  
> > > -	XE_WARN_ON(!*child);
> > >  	XE_WARN_ON(!level);
> > > +	if (XE_WARN_ON(!*child))
> > 
> > If this can happen in regular operation then likely drop the warn on.
> > 
> > Typcially warn_on means this shouldn't be possible unless somewhere else
> > in the stack has a bug.
> 
> As per my comment above, it is not clear to me at this point if this counts
> regular operation but exiting more gracefully when *child is NULL seems like
> an improvement.

Yes, it doess seem to be an improvement to bail instead of crashing the
driver. I guess let's keep the WARN_ON so we can chase this and
hopefully root cause.

Can you add comment that we think that triggering the WARN_ON is
unexpected, thus it is in the code base, but it happens under some
conditions and better to WARN + bail that crash the driver?

Matt

> 
> If you think this is preferable, we could also return -EINVAL to interrupt
> the walk instead of potentially hiding a deeper issue, while still improve
> robustness by handling NULL.
> 
> Francois
> 
> > 
> > Matt
> > 
> > > +		return 0;
> > > +
> > > +	xe_child = container_of(*child, typeof(*xe_child), base);
> > >  
> > >  	/*
> > >  	 * Note that we're called from an entry callback, and we're dealing
> > > -- 
> > > 2.43.0
> > > 
