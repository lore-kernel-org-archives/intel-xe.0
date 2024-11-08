Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3558D64097
	for <intel-xe@archiver.kernel.org>; Fri,  8 Nov 2024 23:09:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE50510E027;
	Fri,  8 Nov 2024 23:09:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K0mrVwba";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D11D410E027
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Nov 2024 23:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731107385; x=1762643385;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=D/7bRyQdM40AupuqBrOx31YRJ+2ZVbPVFHV1K9Hafjg=;
 b=K0mrVwbag+XSZC1dOJvOc0J7hXoORbGADNVhXF5WtbSDqgOtn+kTC8kx
 S+FGTFN8hmRcQnhOdGPTQ6FGwBJEpBlQuSXG467POeeQpa+H21/GY+Viv
 foy/zScxtJFmatgJVZ5CWYr4j9PmV8tv344MkAW11rqIG/PEq5VB6ffiF
 YAcCe4C2/n84rqT8EOCLrBgX+aEAQTXoQZ8O8tYjEXG2al/1db83vcNPP
 L2TkdoR4UAFSBlJ3igAkvev/NsRBv3CaTT0EjfhAp2xMO+1YLgItrnMln
 1Ci3yJuJHH37eRijU+8yw5YGrkTK/iWCpIK03l0az0frtNqxQeGlMBrsA Q==;
X-CSE-ConnectionGUID: oo43sdPYRvKqsqNRftp37Q==
X-CSE-MsgGUID: tvXHUOjoSUOdx2KD6yb8aw==
X-IronPort-AV: E=McAfee;i="6700,10204,11250"; a="30888708"
X-IronPort-AV: E=Sophos;i="6.12,139,1728975600"; d="scan'208";a="30888708"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 15:09:44 -0800
X-CSE-ConnectionGUID: W6xAPDECRdOumx2Z50mZBA==
X-CSE-MsgGUID: O/3Ay9GAQ7KZCQu+IVCeNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,139,1728975600"; d="scan'208";a="89722477"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Nov 2024 15:09:44 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 8 Nov 2024 15:09:43 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 8 Nov 2024 15:09:43 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 8 Nov 2024 15:09:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jUvfbyf65kUpfaS2gnIMsqjA3XIjKQgTYAxGYydiTNz1laDMnlAzrnRYiMruoV5Sq1stvCguHf0MnBj4O6PRaz705lSB2pjwU88nLyZPCB+qXwDHbqfpSAGU6qpTw/jiiZvfAYP9LAIJOMhFu3H2OYLtGgmZWuR2MzlgQ3+4u0G2oQsuAGBQHCHM0auuf/1BZz/jX3Ik6LBlmqKpHei4GidgmaO9B6cF11LFUYg0vJDwcnad4YZBXrKtEJuMWEkcrQV63w4VWg8+xiQbIZdxlg4WPKJ8G/w2pa0MyKwvuRKuW+rj/Uw4WmO8nTErcQPLl8YhW3jku8XjO6BkbMovRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lxXcDYwTqES7dLj8VSw4DinhmvQo4LQHqq2U3oy6blg=;
 b=aXDTiUOOJVZRBoJjalE+PrYQFP6IKZtiRCNgkEiFZfMCAEGf192+p7yv2o9ugDfE7gYAjU48GlsrhKfVv18S7hzlNfsN3W7cH7TNqNhtPSWaplKl1b8F4nexapjqC8sqfAWzF44D7X5iPBB8UvztYEWJJQQtXdhVlTimraWskeJwI0UYDLnFCjmPOhN0hH/ePX9hYeYyTeIcONQmWDhH8AWKR2nWYGgVheXx394gFJlP1y9EzayGucO5i0ERZNrrgMmohCfyw5vFc8qjO3fU+I9XKpQ/GDuRZqGrftjqQd0SAodyX0/zg8Ix6zJhlE0YhyNA+Ya5786MaioCGkdfBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CYXPR11MB8731.namprd11.prod.outlook.com (2603:10b6:930:db::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.29; Fri, 8 Nov
 2024 23:09:41 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8114.028; Fri, 8 Nov 2024
 23:09:41 +0000
Date: Fri, 8 Nov 2024 15:10:13 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Teres
 Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>, "Dong, Zhanjun"
 <zhanjun.dong@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 2/7] drm/xe: Add ring address to LRC snapshot
Message-ID: <Zy6aVcXWot6hBV1n@lstrano-desk.jf.intel.com>
References: <20241108174312.272792-1-matthew.brost@intel.com>
 <20241108174312.272792-3-matthew.brost@intel.com>
 <CH0PR11MB54441F26FE46E5366FEC4EFDE55D2@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CH0PR11MB54441F26FE46E5366FEC4EFDE55D2@CH0PR11MB5444.namprd11.prod.outlook.com>
X-ClientProxiedBy: MW4PR03CA0324.namprd03.prod.outlook.com
 (2603:10b6:303:dd::29) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CYXPR11MB8731:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c3c3306-3226-479a-287f-08dd004a6cfa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IsxcHayCNZO4Eruuvme+bhZVnDW+SNboXLjMurTyfcSnLNJSyO++rsmw9Q6k?=
 =?us-ascii?Q?HJ9IsxfnwhmdUYSK9kiEvvUvWNnDMvkX4uq9Hth3oQTdF93NzLZsE4fxsCjK?=
 =?us-ascii?Q?whJ4EhH2UpY5Kl50uOzolJbjc4PFc4Zuw3wFP25WtYAE0ZBm7TR/i5Ngyi5l?=
 =?us-ascii?Q?PvE+TZXHXE2OoBeGgZTPo/dlZrrhvAnofwtp2wVRbbQe6Uo8RavSlA25XxwI?=
 =?us-ascii?Q?jYY3qu6fU5J1FTDFesWsNqAG4Gj4NjzQ38VDFRa2FDf6UeiItGpkgM3Ffs1z?=
 =?us-ascii?Q?kwFyW4LTZ2tl8XVRRWuCXn5hd5VipUNcZoEAgviN1HLwXVswHJIplYQGJLf/?=
 =?us-ascii?Q?3r3vVw4Thp/7nP2bUwYsfri8ZvArALWNUgeEQ91XJ3vrwnSC2/MRbfuL/hV6?=
 =?us-ascii?Q?SSurfGENBF1OCUc1sIbLjp4xIkWQQT8Db+lJZWhNH1ZI8brSHTV5tBlAdB0o?=
 =?us-ascii?Q?ZrsvLz1Howu0NkApf1vlWoA/dkSYnrPWXucD7QnfKOzfLChfgyGz66Nf6MwF?=
 =?us-ascii?Q?A3JgKkLDS137wYGsrl/3nSXBapbsiIlRuTMR/t8O+qb9k6CeWNmVsds8zy/N?=
 =?us-ascii?Q?MLWbWn8TIfOJbu+F17lsE6Jka/ytaudVeqpdKPcSo5fcyb89eyVy3nS+Yqwe?=
 =?us-ascii?Q?kIleGCkJKrdVLtU7BUAgCYMvRqXnVpixqVmNwvbpHPB0sSnVH3Ko1OqlJD/b?=
 =?us-ascii?Q?2hk6i6pKHtUgjcrEJxtMvbZEciiv/TnD7rnLlQ6OSEKmZRIo4BUt7iwS8F4B?=
 =?us-ascii?Q?+SUzb4DyQfi63gchhv6+SFP8seiOg4TKgHbLF5cjxlUEDOYxJcbO+UezSyAI?=
 =?us-ascii?Q?eUa1/da0Iip4E4weZzn/nhelxOpMZhUM6ufR2YFSyySOLAr/9ZFnmzd5puYB?=
 =?us-ascii?Q?1JqzHbrhGhntXKWr0N+ZcG6cRc/ibL71Tl4IrL6atNX+hlOtvqsVGXKAJoHx?=
 =?us-ascii?Q?uwYeyMv4Cp1YnBU1twPE0yBlsbbfwHRtCYWxTrCG4drZ/XIXdp5xKvIcDjvA?=
 =?us-ascii?Q?eb0TPiQTIiPMAaQFWGuerpi+0dOzljDJr1IrXlrd1t4XIfCyFUFNv3aQp/zG?=
 =?us-ascii?Q?0oF9wbS2Ef64kJfvbZO/r3AGPNU65pv4myfgD6lcW20FyyeTYBUBdqw48c/b?=
 =?us-ascii?Q?q+wamp1QE/onAKvDe7prpOVt3cyOsBPvUTqaPkplMcgEQHy83foepLtUgpOa?=
 =?us-ascii?Q?mID7djFTslqrjCUJwYi42vXPze8VKQCE8VbG6xontKzEM95iJbGAJyp5pvFA?=
 =?us-ascii?Q?06k4uhMaa2m4pLsNDbyC1RjQZWxQ4nQtDzVVQDEvxbAWVWeYODSs4RPBAXbS?=
 =?us-ascii?Q?9zo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?78UqZ8GSHvWF0M4IM1zl1nobEGXbcvuxP1H/Lh3hPL9WUvQooqRmhDMVjNxN?=
 =?us-ascii?Q?UO4bRio6DNWCQd335v7Jid1zCXFFzfZrCsirOOLSsKneRe0KzaDbiWuf/LI5?=
 =?us-ascii?Q?7YOMmaep1GEmYuOAMuE2TbO+Jw4RA5DxEDKAR0DC6MWSRImGEiZkUYbMtoF/?=
 =?us-ascii?Q?hsc1JzMgSIFZa1DTLpQLm6FuL471+5IyL6poneq3uoVCPhgnMpu6fuOnzKn8?=
 =?us-ascii?Q?5sJZPs4BWEtJh2IWyF5BNfz8i0jv0e8hs0GiV+rGcc8r5rhA8VuEgqGp/bEd?=
 =?us-ascii?Q?dNN+3eRGvAp7KH1vy1xrarJVNhihUSnkz+te4uKXG5w5gnzgOBS8WZtKznKh?=
 =?us-ascii?Q?92WLMATrcaszPO3VbwG4IpCVtkDw21Kq9HssJoFnIxQmjX0gN8b7E5+nFcF0?=
 =?us-ascii?Q?JvGF/tJ/lRbuiDEgiWHJUVhGfWB0nJ2rMKHd5S7q/t4Jxb+eriLle1670QJ8?=
 =?us-ascii?Q?XIX/coX9UQzd9l7hDiA/7QA7hy6aAxlN1Ntt/BVWkpUQEj+vrNOr4nZ2JQrz?=
 =?us-ascii?Q?v/5HX/Lc44wRyuQWeRwq/Sn1LKmxcIUmaL93qJ2j+DhDDJKuSJcbsFiTOwnx?=
 =?us-ascii?Q?k5DSUFUCZBEITIZ2BE0FPMJOHVH6/uOhjXDYPIBcvqXK5c9TZOOuaVkfsL10?=
 =?us-ascii?Q?idKsake51TRIKK71Fnp+nX7kBWvPIXiJcIU7r0BQoAXwZagvOEDd+nLs+j+t?=
 =?us-ascii?Q?wpd2axcnrQL3ExrNxJRPFhdZV5S7WABBkczJl7OJrblaIZCyrz9WDkxTqPKJ?=
 =?us-ascii?Q?owxbqDQz0BHlQFdkOL+jArsUVvnTzm9ZySaxwLLHoVcpWzDnw29FsV50Musz?=
 =?us-ascii?Q?WHivgy93i0hVYnqNdUUkR2YLdP2GOJj1k+gvzY1ZWtvcTNWJDIvPJyeNQ5XJ?=
 =?us-ascii?Q?XBQmfYiWdZZgUN4LSUStVEjaGijq/R3pnPTAu1OzwyT8BqIr9ssNvTrDA3UH?=
 =?us-ascii?Q?Y3O0z3iKsGQ6CUM3jFUinya86p7ZsApR9cpaMIYQNldhkAflychImBExdH3t?=
 =?us-ascii?Q?OAN8WPNNhgDL5UTji+GR+qBkQsq320sXzhFWKg13vxW1iorLefQ8Ywg8CpOE?=
 =?us-ascii?Q?jNJaO54WNGMnaJV4+O34qIEXKGPRvupJXJw2g4BTGQDnGwJnHiCwjNsApQ3C?=
 =?us-ascii?Q?8O1tVrv9Kr7pVdb2ykGOY+s4uFCbYtnVVcMWSRoR0zkyhcGwrJfSyu9Tn78l?=
 =?us-ascii?Q?o+9OBd53hU5Th3q6lWZuF4hPNCZK3lfkOFoNLyQANp+Afcz4BBYlieTLelvV?=
 =?us-ascii?Q?HNT0kDTqphrIEIUjTtLgJ9nL10eCzvtjI9CM3BcR6HRkw2fVmh2ing/irMul?=
 =?us-ascii?Q?uDiojnOpCNUS4yen5woXQUryjZuJ+bKNb4fwdt7KE7YnfcfE+wFhVaMtrfNj?=
 =?us-ascii?Q?VF0JM2RU2+X6q2hesT+ekUouOoDy8luDg+dpFhMTS4OZw8UZYV5mTdqFR/hc?=
 =?us-ascii?Q?sREZU5jXr1lJ49wcOaPuvOlX43+/t5xnfQGN0bXCGWTn7+rdqbmINoqZLbkr?=
 =?us-ascii?Q?mHRnQ8M/075wLdm9BIZRR5HrKy8gXura/8zzXfWxOEs93kqA5cj940aTrpDG?=
 =?us-ascii?Q?yNlQ6uRdJomXiOG1xblA+S1ihz8hdVKV1z6Cm/BHjWhZIlu4zo++36s0eR+w?=
 =?us-ascii?Q?Hg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c3c3306-3226-479a-287f-08dd004a6cfa
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2024 23:09:41.3793 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sgRI+WXLeSppekLt+FH/6igebdu8JaTEM2zbQBVF7DzgwtOWzgEJ2Qi7fr6XacKJeQRXY5tSSE/3lpBSGUKGSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8731
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

On Fri, Nov 08, 2024 at 03:05:34PM -0700, Cavitt, Jonathan wrote:
> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Matthew Brost
> Sent: Friday, November 8, 2024 9:43 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Teres Alexis, Alan Previn <alan.previn.teres.alexis@intel.com>; Dong, Zhanjun <zhanjun.dong@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>
> Subject: [PATCH 2/7] drm/xe: Add ring address to LRC snapshot
> > 
> > The ring is currently in LRC BO but this may change going forward.
> > Include the ring address in the snapshot protecting again any future
> > changes.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> 
> LGTM, though the terminology we're using to describe the various ggtt addresses
> as "descriptors" is a bit confusing, even if it's consistent.  I wonder where that
> terminology came from?
> This is just a rhetorical question.  I'm not suggesting it be changed.
> 

LRC descriptors is name copied over from i915 and may even be in the bspec.

But yea, indirect_state_desc and ring_desc are bad names. Will change to
'ring_addr' here.

Matt

> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> -Jonathan Cavitt
> 
> > ---
> >  drivers/gpu/drm/xe/xe_lrc.c | 3 +++
> >  drivers/gpu/drm/xe/xe_lrc.h | 1 +
> >  2 files changed, 4 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> > index e219657535cf..afb0f4f44748 100644
> > --- a/drivers/gpu/drm/xe/xe_lrc.c
> > +++ b/drivers/gpu/drm/xe/xe_lrc.c
> > @@ -1636,6 +1636,7 @@ struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc)
> >  		xe_vm_get(lrc->bo->vm);
> >  
> >  	snapshot->context_desc = xe_lrc_ggtt_addr(lrc);
> > +	snapshot->ring_desc = __xe_lrc_ring_ggtt_addr(lrc);
> >  	snapshot->indirect_context_desc = xe_lrc_indirect_ring_ggtt_addr(lrc);
> >  	snapshot->head = xe_lrc_ring_head(lrc);
> >  	snapshot->tail.internal = lrc->ring.tail;
> > @@ -1693,6 +1694,8 @@ void xe_lrc_snapshot_print(struct xe_lrc_snapshot *snapshot, struct drm_printer
> >  		return;
> >  
> >  	drm_printf(p, "\tHW Context Desc: 0x%08x\n", snapshot->context_desc);
> > +	drm_printf(p, "\tHW Ring: 0x%08x\n",
> > +		   snapshot->ring_desc);
> >  	drm_printf(p, "\tHW Indirect Ring State: 0x%08x\n",
> >  		   snapshot->indirect_context_desc);
> >  	drm_printf(p, "\tLRC Head: (memory) %u\n", snapshot->head);
> > diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
> > index 9d64cedc4d14..a2058a501353 100644
> > --- a/drivers/gpu/drm/xe/xe_lrc.h
> > +++ b/drivers/gpu/drm/xe/xe_lrc.h
> > @@ -25,6 +25,7 @@ struct xe_lrc_snapshot {
> >  	unsigned long lrc_size, lrc_offset;
> >  
> >  	u32 context_desc;
> > +	u32 ring_desc;
> >  	u32 indirect_context_desc;
> >  	u32 head;
> >  	struct {
> > -- 
> > 2.34.1
> > 
> > 
