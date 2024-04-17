Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A6ECC4345F
	for <intel-xe@archiver.kernel.org>; Wed, 17 Apr 2024 20:33:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A06510EA18;
	Wed, 17 Apr 2024 20:33:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GLTCX4/8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7213510EA18
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Apr 2024 20:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713385991; x=1744921991;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=JAiX80uyK2gc844TXbp29GntmP9ESlTgVyRKfRsURAA=;
 b=GLTCX4/8HgDhNapw2El6QK9wsD8II/FGhTPwOEsFXTglvQVYxZyQ2buV
 RvHwOHsz2CNzsR7aCQV9r8DffPW0r4rs4sfpIYVcVWHU1WlejwCglNwyX
 SQj5Ytbcx1kSWDoQf4QtOgtt+gcAzzfqyKcZeXQs8xKYJhxhSW14c59uX
 3rTI18cMXe6t9aKLwznB8fiUkml+ly8SkObBMc3WodltGhJh1vOR9F47p
 xp165FSmeOpo7St9EJZf/niJUp4FkLuhwmNjvBfjbBwS6DtMvmEdz3fPo
 elda28ctd8COs90hLNKqf/bSwXYt+iR9yWq6pr6Zeie6E0rvecSE4zUWo w==;
X-CSE-ConnectionGUID: aa9WCeR2RBm691Ts5Xlx0w==
X-CSE-MsgGUID: JjQ3OJPyTRWyp2eRBMP+fw==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="8761430"
X-IronPort-AV: E=Sophos;i="6.07,210,1708416000"; 
   d="scan'208";a="8761430"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 13:33:11 -0700
X-CSE-ConnectionGUID: m9c3hndOSxOAwK0CgbReMw==
X-CSE-MsgGUID: rF6K+VbQT4ec90q5vPIUBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,210,1708416000"; d="scan'208";a="22628198"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Apr 2024 13:33:10 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 17 Apr 2024 13:33:09 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 17 Apr 2024 13:33:09 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 17 Apr 2024 13:33:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a6jNpjeIsQWCwEvderda9SgVVyCZEp6VZXLxszlMmEb6TIX2L1oOwSqAKO6WEQaKZHHEjO08zUsu18yw+P1NValJ+aPq+amWnlBgiikvYOiAXYQLjFLgycTqfHGzUEWlJ+VxKmk1+ZfWezXowoV5y0EGVEdM/X+vF5fTzSKxb8znNqyDYF7zMyCNPjTRKCVfixpxBuXJQr+94x23epabdEE1ml5/hyPxoseumrl5QE84yi5HgG27OeYL2frqg2ndjXRmwrhF7NTMTo/AyGhSM8UTr02oSt14aJ9lw8atWKCblAC9zNwOj3KokKKHdS1lvTZlIsJNJtodzMrLHbCdjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pJ0X0m1HrG861Jzchpkl9Ap8BSR5IUudSe022mo6dXo=;
 b=HB5q15cEPER4EKwC1apvecAkrM7uPmkTY1ZZn1ciTzpFEYOWPxzj7KnnA3/rNNle1JsYkxvXscROFNqFwgjVS+ss6aBUbEAfG5aX/ql5XRcA80M3zW5ebS1g9InwLPDjs3BBDIexrBET0u/PvSn3JJsrureQ4k1gI9nlRfV9q5wSs4V2Mv3KYIJ+7qVly0+g4tVf1y2B5aXRzJB+vf6c/ojNBJJ+skxvD/johoUR7cidAXz0NLzhk2VY2rTSYt4IlA2sesdtXZaGPen0ymfL6wxqSORPcMPOGxeSRe6VxLB7CSHMzpbDd/BFjuMFfT3e2djfgwo1TRGme4b7fhB8QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB5101.namprd11.prod.outlook.com (2603:10b6:a03:2dc::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.37; Wed, 17 Apr
 2024 20:33:07 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7472.027; Wed, 17 Apr 2024
 20:33:07 +0000
Date: Wed, 17 Apr 2024 20:32:58 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Auld <matthew.auld@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
Subject: Re: [PATCH] drm/xe: Add outer runtime_pm protection to
 xe_live_ktest@xe_dma_buf
Message-ID: <ZiAx+jADKGT3jknI@DUT025-TGLU.fm.intel.com>
References: <171271725279.1318876.10825510039289922734@8e613ede5ea5>
 <20240417193411.21833-1-rodrigo.vivi@intel.com>
 <ZiAsmERgUb0x5KlW@DUT025-TGLU.fm.intel.com>
 <ZiAtJgbbg4qkBg2c@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZiAtJgbbg4qkBg2c@intel.com>
X-ClientProxiedBy: SJ0PR13CA0058.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::33) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB5101:EE_
X-MS-Office365-Filtering-Correlation-Id: 003ad65b-6f74-4d09-ac50-08dc5f1d96db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aDB5dOpxbVge0/5uxNUQG4TsDw6WWJBfR0MLhoilITvnI/PV5vtqKlSCC93uA6HsU6dxVHUbJ+wcnM15KpfMGCNZDOmwJ5a6YetmNCWxM5LlikDZ3czXuV2ctd85ZueI9JlFZl+AzgWEbvezGaO/hhhKducRMtkXgHGI1H4LU7cFOH3zSBFxXRGqWCqDlbErA47UnJROV9rB9xxJrEMiDhwl+5PYpFqGNAnkPYR3VioLHsUd9neTuP9/oT2r+1x8ER15VBoK2TWHmTh8NoaKO2DefJYzA7XRTojakX3lZE9lxUoYmwt9aJc6Acg4Up3zEjmylkRNEWIOnSM6U7MuygxqiBZ0DfAy5qx9fw5fs/8YIf130HH/rVOaB9e4+d4Hp2ZKKk73yaXPywOypS84CmV3GtrerRWzKfFOk2YuxKLR7lm/knJw3ORp8cLAoa7s4Y1U6uMO9e3C+6JdCundfxUBFc1j+bfrMU763fYFmiQymZelFG1EpRHLaIlc82NJk+elQ+ToCcgwCOiw0aToEpMeFCx5dGK34qx6qgUxf2zUjN2HUrrN96VmnYHz/VqNbfwXeSJknHpNe/vxnIf+MJCaD0A4hbCatJxYOThVgzTO5LY2GKlrly+TDM2U6Z5bjiUu73VuXfm4a0ExCgfxoWmqCaY6affz5vDvEvPFW8Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Tp1vZGawHH9fj4YbsZK/rNdLujlptU+VIhMa66eOwHoZXmQuCxjYkocK9Cwh?=
 =?us-ascii?Q?Gw4NXUTeGrBpDE9N6uVUkUpD+Try52XjhsfF+bF7zxOrmyajsi8ePoBn09Kf?=
 =?us-ascii?Q?Tf2jhXhUTFexGVXLqOWUjui/oHAjpwWgsWAq4viEOHfhBShJwlolSKEu4AP8?=
 =?us-ascii?Q?0To/rIbGDSvJZf6xG9bRzY4ei58bGJLksFCW8FgDU3rJclwKmmkEEIAqkTO+?=
 =?us-ascii?Q?xXN5xo0Zul5UOEST8Rjx+KVUdEt4/wMzMHEycrpiWzXyelAD6xpeA7J6+aOD?=
 =?us-ascii?Q?I1KodJ6wQ9wN5jVau4LdVmRvTlOcNTCKhwgnpFVV67OV6gOa4dYOLyIv0NGR?=
 =?us-ascii?Q?AnDPy4X9zsIhAN6WaM73aQWljxDSUMujbE1nkcC74WrrM10yxWXQiUDdoE3l?=
 =?us-ascii?Q?h1uUfKqMBco+6DcCwf3yFnMmR6eO1ECVV0P6s3U/NhAE2qr2HYfkAHq+YL4K?=
 =?us-ascii?Q?PnxTEo2+3To7Xd4cWPQrW4nXVGOZaNDhJGg5RTwKUmkZ1lzxBjEiu3HVI4wl?=
 =?us-ascii?Q?jyRPjDe5r4vW2Ighf+AJZnbxYBQuk794b+Cqs/LQLMmzB7TBHMJY8OaGrn2d?=
 =?us-ascii?Q?1KBzeh4lN2iqFtbbFzilRe4zuiORfwNSqJfSg1Rs+xqrm76WlAhuDuUlmj4s?=
 =?us-ascii?Q?Byi6rhgL6SrplpX9fdo/b2o8UjKI/OKYaF9ujVyc3PQtvNtZSoLh6yCXMULB?=
 =?us-ascii?Q?mXchxeLXUnZ6FKk6D5ApttA/2USV8yZ9ilhwpRsDyc4J6K7wHo4YBlSQljpF?=
 =?us-ascii?Q?OmQwMq61qnIaIIlRgZ9HbPNITsM9fyyjPKX17iVZ0PC3CtBHg0LwTqXs9RKu?=
 =?us-ascii?Q?esx4smVuDPE6W47Nre/3vULMD9onFiYBtrmI+uUy5Cdj6Z+H2LxxaB4jf4hU?=
 =?us-ascii?Q?XU8OKRdmVOZ6ztyrtk9UOpf4sD3fCap6gwJ/GpeaUJ8KUuR1C5FRXyMhGMMr?=
 =?us-ascii?Q?vIp6AoULNMjRnYsp/Xq9V3CBuK1OqYa0V4JLvBZ5wCXuiSYXc/2ZC6eVOIAD?=
 =?us-ascii?Q?PXIQsVJT7vxj+e56r9g9wR/v0nZvaw2Tepm+JIYVAqOlc9f7vrbt+mUj0yVR?=
 =?us-ascii?Q?jNgSPrXGpqcDanaqkE3swIt8wIFRiCp0WFm1Ow1UHJgSQsyQ0fJJlGBGCSzv?=
 =?us-ascii?Q?+REpw2gIqBMyd4qigSTh6WsfhP0bSKKwinA5lCU9X6JMz4AMJfy9CKIHjTVs?=
 =?us-ascii?Q?NsdCjzBiG6CjMSdftvlsZKip+r7qrPs1P1SoZ9vzSpC9mLG5YoeomgtDXDcS?=
 =?us-ascii?Q?8xBGdkcQ/miDrdiwRPcRE19P90RzhNwviuM/0Flug/IOMQcY4h6ML9VPNZ96?=
 =?us-ascii?Q?8IlvxGmQTsUjy7Ldh2pZs0VUA2fkZnGSzx34IDuIAQK9NebDrcYUmanzrZf/?=
 =?us-ascii?Q?4aIcpmSoz+JHZh42/mgBQcPfZ/KI6/YEMVJ8DXuH8phtLj2JLW8QYMg/Y9UH?=
 =?us-ascii?Q?lKCOkxwwqYjUa1oudVE4ByQkiuaSbSUQFv8Tx5Y+Yh++re3l/OSME4v8ZVpV?=
 =?us-ascii?Q?igGu37y2rgMu+HVE0Tuh+PsATqC01+FP7M/CuBiFThokpcwJbFUIPQ/CEbs+?=
 =?us-ascii?Q?+15fNe776fM1zuB+hnxQG42R82l4S6/kutMcF0B8ET7IJd8+3dXi7P/GhApn?=
 =?us-ascii?Q?Kg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 003ad65b-6f74-4d09-ac50-08dc5f1d96db
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2024 20:33:07.0857 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jsQCZOowJ7G1FZWumlkDugsFW9j9szNYJ7ArcC9HbjfmQGRRhY6AMv0BixqwTZIPiApZXkYPMtD6KBXlbrsQtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5101
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

On Wed, Apr 17, 2024 at 04:12:22PM -0400, Rodrigo Vivi wrote:
> On Wed, Apr 17, 2024 at 08:10:00PM +0000, Matthew Brost wrote:
> > On Wed, Apr 17, 2024 at 03:34:11PM -0400, Rodrigo Vivi wrote:
> > > Any kunit doing any memory access should get their own runtime_pm
> > 
> > So maybe we grab a ref for any live kunit tests in a generic way?
> 
> Yeap, I wished to have something like that so we don't risk end up
> with missing cases like this, but I couldn't find a generic way.

I figured you looked into this...

> Right now every other kunit is protected. This is the only one left
> behind. Perhaps we should move with this series as is and then
> have a follow up with a generic entry for all kunit tests on
> top?
>

Sounds good, don't want to hold up a fix.

With that:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> > 
> > Matt
> > 
> > > outer references since they don't use the standard driver API
> > > entries. In special this dma_buf from the same driver.
> > > 
> > > Found by pre-merge CI on adding WARN calls for unprotected
> > > inner callers:
> > > 
> > > <6> [318.639739]     # xe_dma_buf_kunit: running xe_test_dmabuf_import_same_driver
> > > <4> [318.639957] ------------[ cut here ]------------
> > > <4> [318.639967] xe 0000:4d:00.0: Missing outer runtime PM protection
> > > <4> [318.640049] WARNING: CPU: 117 PID: 3832 at drivers/gpu/drm/xe/xe_pm.c:533 xe_pm_runtime_get_noresume+0x48/0x60 [xe]
> > > 
> > > Cc: Matthew Auld <matthew.auld@intel.com>
> > > Cc: Francois Dugast <francois.dugast@intel.com>
> > > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/tests/xe_dma_buf.c | 3 +++
> > >  1 file changed, 3 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/tests/xe_dma_buf.c b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
> > > index d54dd5b43007..e7f9b531c465 100644
> > > --- a/drivers/gpu/drm/xe/tests/xe_dma_buf.c
> > > +++ b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
> > > @@ -12,6 +12,7 @@
> > >  #include "tests/xe_pci_test.h"
> > >  
> > >  #include "xe_pci.h"
> > > +#include "xe_pm.h"
> > >  
> > >  static bool p2p_enabled(struct dma_buf_test_params *params)
> > >  {
> > > @@ -259,6 +260,7 @@ static int dma_buf_run_device(struct xe_device *xe)
> > >  	const struct dma_buf_test_params *params;
> > >  	struct kunit *test = xe_cur_kunit();
> > >  
> > > +	xe_pm_runtime_get(xe);
> > >  	for (params = test_params; params->mem_mask; ++params) {
> > >  		struct dma_buf_test_params p = *params;
> > >  
> > > @@ -266,6 +268,7 @@ static int dma_buf_run_device(struct xe_device *xe)
> > >  		test->priv = &p;
> > >  		xe_test_dmabuf_import_same_driver(xe);
> > >  	}
> > > +	xe_pm_runtime_put(xe);
> > >  
> > >  	/* A non-zero return would halt iteration over driver devices */
> > >  	return 0;
> > > -- 
> > > 2.44.0
> > > 
