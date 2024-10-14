Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90499D1812B
	for <intel-xe@archiver.kernel.org>; Mon, 14 Oct 2024 15:57:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D80110E482;
	Mon, 14 Oct 2024 15:57:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UxsVF2Pa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C950510E482
 for <intel-xe@lists.freedesktop.org>; Mon, 14 Oct 2024 15:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728921460; x=1760457460;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=85F/iyRt7wgbV/0pSVNJOWzs01mDKYGbeEZ6afMSybo=;
 b=UxsVF2PaWtsgWDCWTAoOHL7wzJW5iry8wneU1eYIQ5YkCZeeVdXwIwV1
 Kc11c3VShckCqj7NbSIbLKr0yXKmTPUtEY+q/e16j3nkYKcHF5mqfkSqu
 Bxo2YQZ4B0qrN1RKw6IsmPd/Q7UptRSME9CZHllkJVLapAcS21jdf9CjH
 C93Fve52pq7BmQDG4vfYpivCQ9QKhQtYfFcrpaFJDW6MR6UaCpnWhnJhj
 I7nQ5aQB2DXF20DDF8KSpJcgJZy9h6GPwadkM/isstazA4dHrNBkUx7YZ
 aw8dMhy+E5nHDFDJ+ma/o0DV3N+Sg7dWeC9DfSW5hZ3BgA49B+Byx1Yx+ g==;
X-CSE-ConnectionGUID: Ddhx94u0ST+2Uqq0z68AlQ==
X-CSE-MsgGUID: MAcPBd5JTN2x662Ea+cm2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28234630"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="28234630"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2024 08:57:39 -0700
X-CSE-ConnectionGUID: JhrUkvO0SESO9p5rrpPdtA==
X-CSE-MsgGUID: 67r3VIEzRQal4vIlslPpJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,203,1725346800"; d="scan'208";a="77791258"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Oct 2024 08:57:38 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 14 Oct 2024 08:57:37 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 14 Oct 2024 08:57:37 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.47) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 14 Oct 2024 08:57:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=upUX6xp8a/35rPEqwouvGcXHCtaRKRYME5rZyxKdCYP7LwzJmcJ4aYBnGCREVYNbZQU2oa3xLG1sD//0sK9xG/PVOOIsRLN7XhHetlpelJ2BfOoBNWFf984taTbhFEyu8EDkPkSMG3QGRbjEJTEx4brrKQzSLkaaIWjGA5HihnmIq4m0YJW1Fu40HP5EoZJ7hGjxR3ayDMQaGwJmk2Oh7kSblFpnzQ+H86CyQweo8xbEawZyjHfaqKoBwsrU8jeglyRhRy22luZSJR0usFXtD+kguA80Viezr/ECC+/2NIn1R7JkvbHGqfE3428Pz/aY+h748FmASk1B1vWstTvPww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6rkjI/7TdSnlktx7plfi/eXN65b0t5k9BZCKumtzH1Y=;
 b=pfo6eqA88xCTc88V7w95e6O+41uRLOX6Czfbbu+WnIrMtFGBXGTZjMMDp4FriZxgybHhlWYCXNhkL/lhdfYz/DtcpyOfnu3Dh0jc4x1ociMwdFiTAlPSSi65wXHr1/G7wfxxiSpNPKDrQY3uYMU5jwYZpAPwwK/0W8txKbb8acBr6iXe+QiQcM2jqPOms6nwi3Euy95NpJHygIXtc54gY4w8Zm2ayLloqJf36PZjqs7jCoyBhYgZuTDs89rEH/+VzDMf2AhbaFTxqYcSaQ5HHrYAHAcBpp9dRqeDHl4HmcUpkl/ZlybfJ2xQc+7Qq1z1uvTJXrTjI7eArbzYIcU0bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH0PR11MB5314.namprd11.prod.outlook.com (2603:10b6:610:bd::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.27; Mon, 14 Oct
 2024 15:57:35 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8048.020; Mon, 14 Oct 2024
 15:57:35 +0000
Date: Mon, 14 Oct 2024 15:57:00 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Nilawar, Badal" <badal.nilawar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <john.c.harrison@intel.com>, <rodrigo.vivi@intel.com>,
 <matthew.auld@intel.com>
Subject: Re: [PATCH 1/3] drm/xe/guc/ct: Improve g2h request handling during
 async gt reset
Message-ID: <Zw0/TCkEBMm3JMyT@DUT025-TGLU.fm.intel.com>
References: <20241009105645.1416588-1-badal.nilawar@intel.com>
 <20241009105645.1416588-2-badal.nilawar@intel.com>
 <Zwhc5V5aQDSbhBWN@DUT025-TGLU.fm.intel.com>
 <9eae52ab-fe51-487b-9db3-6c05c4a58d20@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <9eae52ab-fe51-487b-9db3-6c05c4a58d20@intel.com>
X-ClientProxiedBy: SJ0PR05CA0195.namprd05.prod.outlook.com
 (2603:10b6:a03:330::20) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH0PR11MB5314:EE_
X-MS-Office365-Filtering-Correlation-Id: 8001b132-b056-40d9-4158-08dcec68eb96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kmX6n6Gs1HDfjNdkBeqF90PMNk/ZyyvEueCx/Vc59mm9KUo28eTfevvy1qN+?=
 =?us-ascii?Q?WA84QRzMT2ePZhWeAclaz2qj6qy3Nh66AFxASdTdT61H780oDltGMKKrlIxS?=
 =?us-ascii?Q?eajudIhNDtCfU00lzCMTWYySaBwZH/GpW2vdpVZPvTaBbnB2jHH96chqzK0z?=
 =?us-ascii?Q?iqNBaTzowBKYCtxtPRrzfHEdqz0GtNYUhTn2ZwA/5ftSz0sJ9YObuJzHTr4x?=
 =?us-ascii?Q?QSlVrAIgHbebD/Ld1SBymvlR2YuYqx9JnzogP9GZPasAWZy+X7uyL5mLpr+3?=
 =?us-ascii?Q?PcTZ6tyBDCaLkU33or+1Zw9AdwFkLSgpStUdE1z22WLI3Q+XV2zipS4sZQ8T?=
 =?us-ascii?Q?LqSsVjiPdFEZzOOg8Me2cCWeZuwCUEQRi3jfcEa8rBsovN11L2k7GEjm8GdJ?=
 =?us-ascii?Q?2BDG6PWqwXJ7Gz865bvwYXgrlauXrC/6wyt6CHwCeufclpj2Zc/Jp8ClSHFk?=
 =?us-ascii?Q?sjDvgBnt3GozyhCHynszT8C9KWI10b10W2rvw+EiltMkmHN+FImlsPz/JRCT?=
 =?us-ascii?Q?aeXnw0H9QL7vYhqPsYJXez4YD+BLpC7MScEuQVxYos3pUNgYNQtPavh9uXrZ?=
 =?us-ascii?Q?uZwyr8tGKACLIRPGd2OvRXRhx7nK7+HuHXcOOKUPrrx7PwnWxv+R+5aOwzAq?=
 =?us-ascii?Q?uW4S4XNVoNBL/rV2/Y8U2Z1D/+0RvbW2DMk0V9braUzqL/XUPnjxEkT9lEw3?=
 =?us-ascii?Q?D4HJ5FGkY3iKMMgg7OP9nMxluy2up6BW8niq+lUGT5h1fLMPhgN/gA7s9F7I?=
 =?us-ascii?Q?aZ2FPVNtF9NA9xVy0F+hO2MFHPwuOp5hU4vEDAVsDrr3r67BobWZQkE0rwOn?=
 =?us-ascii?Q?wQdPgHnCZwNHdTJu9FGz4hl7/GHAGdl9y7EYaVjoUSdU7xW/lT8wEU8Yhz8O?=
 =?us-ascii?Q?/HlrTyvVutI+F4f/9EPowKPDnDsFNNFigLeoVEf6MLQ4SWqCay1tkRXMco4t?=
 =?us-ascii?Q?CeBDg0KdgbDbG6w/Ydg5CjkEd3Nshh2+YBcoVYHKa8GQOJjliliAwyyTT/Qm?=
 =?us-ascii?Q?OzomddC/3huoRiQOG8fxMuUax82Lt3CrxLYxCRLvjyowcj7Yrk2QrBBuBbvY?=
 =?us-ascii?Q?D07O9rXIUplWO6Zkg9SSzaylUQE1NKvca5vtQ1X38cbqHXaxx4Tpyy01/obB?=
 =?us-ascii?Q?yJR9WiV6kltpBKoI89OMI+RtNHdOqVsvJCDXMczojJOjUvnCGHb8gY0UAJ8l?=
 =?us-ascii?Q?JPNp2gjMwgrI0934PsvQrypMBuxFCoX+UMvHOguRZHEb/o6zJLO9hJlM9OcF?=
 =?us-ascii?Q?y+o33LoBf1FqUAAQdxs/W82BdV6XhcwtbtYvSkp6iw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Nx0UBb47fak1xtyC8r1Hd/2B/u6qNZR3joaEU0tSiWFxKFw9k77ur4dce4kp?=
 =?us-ascii?Q?9BCwG6OHxR2LTSOHZQ3Jq/6QeihCeN78aR+CLDKUMledvbA/jrR4lH9rq6wz?=
 =?us-ascii?Q?ivtZsRnLKbDD/JCOWCbaAuUN6RawCU1aNA4SOD/5G9jfQWlRPFW95FlsIvvF?=
 =?us-ascii?Q?PURrMfKPIap+VO5cEA17xGw8O/yrJdfWJzzpt7uaiISDgFrBkhc/goncgIGU?=
 =?us-ascii?Q?rUYSoVpiXVG2XT99QzHbsIJEK8MzymCeWeAq3CCPl/Me4Isfx2O0b6hilB9q?=
 =?us-ascii?Q?xlCqUM7WXsg9QTZpkZF2anb7P80YfC6NBUFxr+M86K5YRLjbSrjPcppa2IXJ?=
 =?us-ascii?Q?KFfDyS0IJ2aFxDJWGewnDJTA6sRlKDDpGZqL+4PlqIK3hqLmKQL1ANpO4cNq?=
 =?us-ascii?Q?0IPmglPtP3CwNF8Flxbbt/23OuadwDervvcPxcUlO8Owah+/wlhoItb52AUa?=
 =?us-ascii?Q?+TNgDSpZJeAaLRwLzu0KCr8PRaAYVOQVrvDZjk1hqWKVfVYje3JfkC+ifqqv?=
 =?us-ascii?Q?EjLfLtgagycF0xaRiPbwONZiHMKWB5bnR7jkllpHT+V7EIjxxhGVFIVAfck0?=
 =?us-ascii?Q?EDmYZBef71sYyErgCfFNb9u4oANa8KQGJ8evtF22zH5v4yNyfnu44gbOVYAt?=
 =?us-ascii?Q?OgcFSmTS0ahP9hv7Y2AgcJwjyCoY9PHenk3prSPnbiRZrC41fFv/cR/kq/U2?=
 =?us-ascii?Q?Z/Ujt68JM+Na9cVzDZePNfeCLf8pJHGdhHMiq/WIL3IMgQvXCBVY5d3yNDG3?=
 =?us-ascii?Q?jEMB+FUMCc51TDKJoaky0QQkQknCMvdrVjRRJSX9zd+gXuUPPXSJuWrJ2InK?=
 =?us-ascii?Q?Xy2PEiBc1Aw/a05jM94tdFCOH3+Dkcd1rOP2FZ4K+MOwkXxaWMzKynSxcdW7?=
 =?us-ascii?Q?+TOgvKoLxlhJsN6rwaWGKhiX2Xz3nakG6ztmqUZVD09hNtYzyJqQ5VWuoyG1?=
 =?us-ascii?Q?ABZSExUp1wi98/rE9P+cjLMSPoRwt+H/PQuOj1GWuwYZ6xhBLntCS9QUoEVS?=
 =?us-ascii?Q?b5D1MchKaMEkk7Jeq0hyW4FQYgM2SKHW8sqOWtXdnfn9yLenz/uLoSkUYUzX?=
 =?us-ascii?Q?cTZfVIrMRL6ozYfx1jrPhQUQkvZoTu+rYss/tMbrrCzbWR0lZ9iQP0Wp7I3G?=
 =?us-ascii?Q?RfkAw5xh+GRWKiQMVr71C8DaAj5Ro8vyszCVw62M1HMV2sl7OvRN7omMVZUW?=
 =?us-ascii?Q?cunjEkyXmHBPiyCLISMxiyVr2v9NX2UizK2z5nF4waMFdc37Jf3bUMZBUEhe?=
 =?us-ascii?Q?8mauud1zM4Wngt1E/OydjhNbbaVmBcPYGQWJnKOHCHyiTjKEPBWTv01zPU3Y?=
 =?us-ascii?Q?a1X2ZyCaS2Q3ClVIUnGNpN4HTehFju2+i0fZrxsJmNqsM/9tIL0hDN/LiEby?=
 =?us-ascii?Q?lwuL1syA5IJ2fysVZNBQa0cCQLOW8lYdEGclP1tPEpiTI8eLcmOXBUkrxcrO?=
 =?us-ascii?Q?OfhE+zjma4PeKZJNwt4/HDof+Q2Yy+w0vGzo87cb282SHzcozsI1cv7K+8Fe?=
 =?us-ascii?Q?a2nByFNu6zAXjM3qJgqN6TfQ95GI8By2xwsVJZV7wFca5OfWaJ4AMJevUi19?=
 =?us-ascii?Q?z1gpxB0PZeilaqXp6ub0P9/HLRcjCnkC+KBscgszq7eaB1xat8jCdvhKRkFB?=
 =?us-ascii?Q?mA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8001b132-b056-40d9-4158-08dcec68eb96
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2024 15:57:35.4441 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZhWccj7TgwtuuraHw827UudVcD6y7mI8s7M+NIxL57673kEpTR2mmTxpIPAnvkTh/vJFmES/TkmHlMg9ug+xng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5314
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

On Mon, Oct 14, 2024 at 05:40:16PM +0530, Nilawar, Badal wrote:
> Hi Matt,
> 
> Thanks for review comments.
> 
> On 11-10-2024 04:31, Matthew Brost wrote:
> > On Wed, Oct 09, 2024 at 04:26:43PM +0530, Badal Nilawar wrote:
> > > It is possible that a g2h request may be cancelled while waiting for a
> > > response due to an asynchronous gt reset. This commit ensures that in
> > > such cases, caller will be notified by returning -ECANCELED.
> > > 
> > > Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> > > Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > Cc: Matthew Auld <matthew.auld@intel.com>
> > > Cc: John Harrison <John.C.Harrison@Intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/xe_guc_ct.c | 16 ++++++++++++++++
> > >   1 file changed, 16 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> > > index c7673f56d413..b93b2821e4e8 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > > @@ -512,6 +512,9 @@ void xe_guc_ct_stop(struct xe_guc_ct *ct)
> > >   {
> > >   	xe_guc_ct_set_state(ct, XE_GUC_CT_STATE_STOPPED);
> > >   	stop_g2h_handler(ct);
> > > +
> > > +	/* Notify callers that CT stopped and G2H requests are cancelled */
> > > +	wake_up_all(&ct->g2h_fence_wq);
> > >   }
> > >   static bool h2g_has_room(struct xe_guc_ct *ct, u32 cmd_len)
> > > @@ -1018,6 +1021,19 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
> > >   	ret = wait_event_timeout(ct->g2h_fence_wq, g2h_fence.done, HZ);
> > 
> > Better would be abort the wait here if a GT reset is queue'd or in
> > progess. We do this a lot in the xe_guc_submit.c - see any of the
> > wait_event functions in that file. We likely should normalize this a bit
> > with proper layering but basically the flow should be:
> > 
> > - Any wait_event_* are OR'd with a queued or in progess GT reset
> 
> In xe_guc_submit.c to check if reset queued/progress we check guc submission
> is stopped xe_guc_read_stopped(). Are you suggesting to use
> xe_guc_read_stopped instead of checking ct->state?
> 
> Or we should do like this?
> 
> ret = wait_event_timeout(ct->g2h_fence_wq, g2h_fence.done || ct->state ==
> XE_GUC_CT_STATE_STOPPED, HZ);
> 

Not exactly. Move 'guc->submission_state.stopped' (and helpers in
xe_guc_submit.c) to the GT level and have both CT and GuC submission use
those functions.

> > 
> > - After wait_event_* signals check for OR condition, handle gracefully
> >    via an error code kicking it to upper layers
> 
> Agree.
> 
> > 
> > - All upper layers need to cope with H2G failing or use *_no_fail
> >    versions the H2G functions. The *_no_fail versions are untested as I
> >    coded those 2.5 years ago in Xe and don't have user of those functions
> 
> Ok.
> 
> > 
> > - Queuing a GT reset wakes up all waiters
> 
> How should we do this. After queening GT reset or during GT reset CT
> communication will still be there. Especially during gt start we do
> guc_pc_start there xe_guc_send_recv is used for SLPC check.
> 

See xe_guc_submit_reset_prepare - wake_up_all(&guc->ct.wq). This wakes
up all waiters in xe_guc_submit.c. So after moving
'guc->submission_state.stopped' to GT layer, we'd call down into the
lower layers which will wake up any waiters. We'd need to call
wake_up_all on guc->ct.wq & ct->g2h_fence_wq or maybe just drop the
later.

> > 
> > - Upon completion of GT reset the OR condition is cleared
> 
> Ok. Condition will be cleared once CT is enabled.
>

See above. This would moving 'guc->submission_state.stopped' clearing to
the GT level.

Hopefully this reshuffle isn't too painful but this seems to the correct
way to do this.

Matt

> Regards,
> Badal
> 
> > 
> > Matt
> > 
> > > +	/*
> > > +	 * It is possible that the g2h request may be cancelled while waiting for a response due
> > > +	 * to an asynchronous gt reset. In such cases, return -ECANCELED.
> > > +	 */
> > > +	mutex_lock(&ct->lock);
> > > +	if (ct->state == XE_GUC_CT_STATE_STOPPED) {
> > > +		xe_gt_dbg(gt, "H2G action %#x canceled as GT reset is in progress\n",
> > > +			  action[0]);
> > > +		mutex_unlock(&ct->lock);
> > > +		return -ECANCELED;
> > > +	}
> > > +	mutex_unlock(&ct->lock);
> > > +
> > >   	/*
> > >   	 * Ensure we serialize with completion side to prevent UAF with fence going out of scope on
> > >   	 * the stack, since we have no clue if it will fire after the timeout before we can erase
> > > -- 
> > > 2.34.1
> > > 
> 
