Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1331D2444F
	for <intel-xe@archiver.kernel.org>; Thu, 10 Oct 2024 21:34:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 738E310E9D0;
	Thu, 10 Oct 2024 21:34:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OJr0JMb/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BCD610E9D0
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Oct 2024 21:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728596077; x=1760132077;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=MYLcc/SYfmn/EvmebqT4Od+vIO0p4jjOsnCF4gD9v1A=;
 b=OJr0JMb/xEq9EyO1l4yEauNO4CY0FsIazL1gJG5nJWxYNFiJOCUPLydW
 WnL0ezlWDBf+iaNEyotAtqsgS0hTrOahKVUlP1pxR24iAJYiOhzSa+AvO
 KX1XCc+JHWYa6yik4TY5Vb0RYJFncQfwvDwPK6s1MIzyHYdFVrf1ZnG0Y
 +Vp37TFb2mU2XcLCGVuPZuFeLeY7OqgebcPDnJRbanrwRbXfLNxT0YIEM
 JvHMMrR0MOldQsPmuryWkw8YlD/F7UZbIsTspypHWoPv8oEOhxN9817Xd
 is9IgNIOd34NhSk7wh2Sm6ma+6fR2Bnyh+ZHmWiH0h0MHYzZf/2zUwYoT A==;
X-CSE-ConnectionGUID: OJGZgQ09TN2D0gda520fjg==
X-CSE-MsgGUID: dIGGBKi5QPOyCzeZdvpSoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="31880788"
X-IronPort-AV: E=Sophos;i="6.11,194,1725346800"; d="scan'208";a="31880788"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2024 14:34:35 -0700
X-CSE-ConnectionGUID: gRVQdE7ATAGRm0v6hbchJA==
X-CSE-MsgGUID: sqJdy9fTS02A579kArbeng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,194,1725346800"; d="scan'208";a="76639763"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Oct 2024 14:34:36 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 10 Oct 2024 14:34:35 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 10 Oct 2024 14:34:35 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.44) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 10 Oct 2024 14:34:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zLKxmfrILfzfkOc4ydmxvBV5O/qrOG0dtFFfcyB5qBlLU4Dln6sYFNaEj61LyZUuHjvotLk/5Kp49iP4oBvxQUcc0e+Oc/cYnOzzINjYRG1mgwIsZpJEw/Apa5/aJihz50XpXiOiGgYU8xN82d4j5xzu/EGR8BgL+Txt37By34lLi+Ri2Qbu9WNlSiZPxwD2+xwG8uRPyjFCMnQJGL/rSbWy33qpVVs9J/0SwNwrHSSak9ZEsZd9FAbX9DZtrNXEA3JP71vQeUTO98cf9T4xY/JUhe1WYclLKitc6FX5k+viEGE0UnJZyRch9eHQZDAF6kv+3cS7A0buJoJc2hF7Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Av15sbUMfC+HcV1h3ugxqjxsTUIbRWTeXCImeZEfEaY=;
 b=bWRyaeKLhn7M5/kApx9yV4jym3veoJNDrGP5LRnPpSonuuusyqgpFSiwgGp/P1taBBPTNsmdE4qlLM5d4nj4W2mqZUHO1kVHPYOi8teV6rL0RMRUs3Dc+Awiv3bRgQpPbuS6ojCSxEPkaLCEcTScHwX+wRCcyedbI6rS30m2omIsgArAVPFGWq5xcEVgNdd+8ucG6MSQZo7eZeA6orXBG3pdMq+QMg+1fslGz9NrOkT/Y3In8RrpglR0hAfcqBGhhSKuX2oPJ07GAMoUpqy0QGE+uvU5cKKzhaA420xckcrca2YT5MIyUMavrdhzlzXK3hAkSFlbmUTmeQ+ZnvkKkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DS7PR11MB7782.namprd11.prod.outlook.com (2603:10b6:8:e0::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8048.16; Thu, 10 Oct 2024 21:34:32 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.8048.017; Thu, 10 Oct 2024
 21:34:32 +0000
Date: Thu, 10 Oct 2024 14:34:29 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>, Szymon Morek <szymon.morek@intel.com>
Subject: Re: [PATCH 1/3] drm/xe/query: Increase timestamp width
Message-ID: <20241010213429.GY5725@mdroper-desk1.amr.corp.intel.com>
References: <20241010034847.389734-1-lucas.demarchi@intel.com>
 <kramaztywikxqhtzc5e3o27w7u4eannpkjocejdgvu5siatgea@6nb5lkrgur3u>
 <20241010171051.GX5725@mdroper-desk1.amr.corp.intel.com>
 <atdj7r65fwpafp5osauwrnyzmnlyor73yvmgvn36kvnvxzpame@7osi6yxt2qtt>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <atdj7r65fwpafp5osauwrnyzmnlyor73yvmgvn36kvnvxzpame@7osi6yxt2qtt>
X-ClientProxiedBy: SJ0PR03CA0234.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::29) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DS7PR11MB7782:EE_
X-MS-Office365-Filtering-Correlation-Id: 80f6d649-6e97-458e-6c43-08dce9735468
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8jUqXreV6RP4FgCKpWbIE/qBYh/TutVI5WNMRoqdbdg8oZ1yYekk9aU4auiU?=
 =?us-ascii?Q?JSeA1/1Zl98Coyth8vZSmouPL1WXfS2C43WL2d8QrzDm16VZ6fa7uvBUKB6B?=
 =?us-ascii?Q?MVPJBb+/Z1gokd/UiaZ1xTMsL1QSJw1ly7jvO91ZDMRHQ1xzX2MLfMVLsxZU?=
 =?us-ascii?Q?SfGvlTwibZuBXisxpmDzR8DiIRh+fi4/rbilR2rMxnUac71PBaZbnxp7iTbH?=
 =?us-ascii?Q?Mrlh1T3XCcZk0+4rvhGKVI97VUEKfCZcPMTSaRoyytSK7QmrtXilvyBfVVWS?=
 =?us-ascii?Q?B0J0/+qF2Wx/QHjR2YhGMAM5PnD45QJux/9T+O7VVDmJJRiVACdkn12xf9Bc?=
 =?us-ascii?Q?TxRfMmMPH6cnCaoQ/LHnFZZ9m1tfDkPebS/lNlgXINJgjx2igzSnaEVr7QJ9?=
 =?us-ascii?Q?S4BVbLDty3gbqOT/SvnH3EAERbzERf2FDSalNoeHnG8Yeg+nLQ7ho+4TkxsN?=
 =?us-ascii?Q?YaglsQ2Wu4yG+6c8nMJL0QCboTVUCurTMxqe3EQ5XJfgiv2yCjmEdPMD9TuN?=
 =?us-ascii?Q?ZD1dcvK9ovfbZp8km9mIQ2rk3cZLCyEliT/SFerknE4qhSmNr+lHGeKAHbG1?=
 =?us-ascii?Q?vbmnNRkftHRme0Uv6Al/0rJX+5g37i8lHnQBqDiaIr6ZSq150nyeSpNBIZFb?=
 =?us-ascii?Q?HwuzxHxAHLnJ/UKX9IQh0OobhWFRSBuuSAjKI7fhq9sUVpOgkcLaGWCftR9t?=
 =?us-ascii?Q?p5UTx5Kb3qzO3BmEKqng5Mxn+FrRNZCTa/HtxvGXv+lOII585Mwr0ulf0Z0M?=
 =?us-ascii?Q?m87g8ucbMIPBJERzqkL1MY4cIw5MkZTk0nw8B/KuqbIqjyWK/7AxUEUKQAhU?=
 =?us-ascii?Q?dsAIEqhF2lKNAbucepKBaMGC6JAAa1rLtP08UAY/ZcBxSj28xvOENsUcLs5j?=
 =?us-ascii?Q?hwNZbxpDyH7s6jUURE3Ssaeob8n3nAmlMiZCgjj0Cywy7WjS/5iQY8ZSCflA?=
 =?us-ascii?Q?vGy6+G5xGhgV1NHrBV1/HFc+2KBbE4KouvFrbMlBEBeI7IedmbGjmZAzwM3L?=
 =?us-ascii?Q?/Flkhjd0mF6/cYj0lDD530Zc87m7d7d9FJ77MV9/viqoEqm9x8LT1omE49wH?=
 =?us-ascii?Q?WDEBZa90+ZmQQfRjd18fgOSqFdei5/9CisaDUi3807poNsv9n1zcA+eQqv5q?=
 =?us-ascii?Q?ypuz7s8zYJijF9eB8u4PCENFpcZfpLws1XODg3M3eQuTAx5PqY23i/be7kNm?=
 =?us-ascii?Q?YDQTqmhnFGKDej8VkL3Pcy+bO2Set2dyYg1r3/vpbr7nfoOeXxxV3bl22sy1?=
 =?us-ascii?Q?RHBSRhjpKDNv+lo8xllBNhhSiPIXT8M1bmk+Vxiggw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mE+rnSvIOKGC49U8ymdqKCnOW5oPD7wu2drL3nDVVt9djYjnVyx78vIHqqpl?=
 =?us-ascii?Q?9w8AYA2ehmod/hVxsb3gTsbLbLoHvds8KEh0qJe1EBXGChzSpwGCShkt9ZGV?=
 =?us-ascii?Q?cxURAogQnWKI7761Vt/8i8w7PO/RR2LZ4oMbvRqO1zRwJQutX5GtfSzHWQ7y?=
 =?us-ascii?Q?hGaHpazo4coct/4ApW9ruOlTlbLtlDrxh4M4T1bpvootHQ3ggmlIU4FGFdOh?=
 =?us-ascii?Q?fgEzqTIWeqPLdL8auZr46lS58PrkHTmkG5Y/O+Ndzqj0KVvozecOGNMYfLon?=
 =?us-ascii?Q?j6hERXcQxLzjU9sYVOYTUFxQLSH5NEGdmsn+5zPshBLCcRiN7ejSjWGoj/v2?=
 =?us-ascii?Q?xGGaDQ9PJ+LiWptfXrh4d0RjhDyVR/2o2T2Vcd6Qa7NVfvgoMqNKpwWQLtJe?=
 =?us-ascii?Q?YwNB3AXnYOEcLvl/0aOXQEtKpSOGu5xsW3tTPklmw1TgFE0KJrlEb8yTUE2V?=
 =?us-ascii?Q?mXna5VjfJHcvgvF0VjxUlI5+n3qdOIqW11YdkkWczBvaejMRwIDTCSf36XUl?=
 =?us-ascii?Q?8cdALxCFe4Ic0s7iUfwfGeOmpp21aC3bPFeDdUF69/XgTWGBOA7YFSPtTcuW?=
 =?us-ascii?Q?Es+pbEx0/XpwP70H5TQsv3b3z5sRtiyQ6m3UBPoEfyc+yCs9SmjRYnZvmGQt?=
 =?us-ascii?Q?APAIoXUtU5DaONKsqFRtIn7asxIkoT/1hnyD6jdlQrHM64hGTOOj1RHInKpr?=
 =?us-ascii?Q?ujSym8V4qgax4AQRBGNsM9SZm6GiM/aFHD/20ev/TbZr/ujnUz/LALtCXN1k?=
 =?us-ascii?Q?uPs7ptAtPnJxWG5eTo+apSfHnjiTIWDc9nC59Na0U7K4Pss4vy19+dojRxmz?=
 =?us-ascii?Q?j2tkoycf4JYb8ouKn7qZ5QLFZ9GgqKv6D/OQhw15BUQhMMXfNrp7qo/LoPZ3?=
 =?us-ascii?Q?wbG6SWiu4hayrnOC5g1tFCc5W76DeiLY/gpLYXQVa80Ms9JjT7ako5FGf8Yy?=
 =?us-ascii?Q?cyNpOHBSe9PSvPqfuuLzUDx6kVpiLC3Pn5Gz06DccB2XweJddOvoYZ/cOq00?=
 =?us-ascii?Q?cugE/vIJ3FflFfs+v/knCS2DHHE1XRZq5ehs7qJxYdx5SvvxL0yGSf87vWIF?=
 =?us-ascii?Q?1kbrTbJQzi5IRQPhI441UmqxMHWK0XaLBZ/fMbONL7i0+vxJM2xGhnMVWO3m?=
 =?us-ascii?Q?p6VIilmPbQfkJb1t8/+m27aFMy6t2sMAJWQipojitFTY3SB8s8X24PKuLgoW?=
 =?us-ascii?Q?JYm9uIMzrroy/Twjyb1z1Ul+9JYinMkED756XYlw7YEBg/wx7t497sQXdmvG?=
 =?us-ascii?Q?AzdKb56KNKSvLmmdcQZHvLsZ/siDBOZa55PwEq64Z+L8GtE59dXH1fgo4GRL?=
 =?us-ascii?Q?qMjBLJHN85aWnMhyon3hnkAkbE5MWrG0bxexmWp4JP/WrDdInaBa1XLBn4Va?=
 =?us-ascii?Q?4xVFXG/+CnMD5/45nN0HdI0m9dEKtQysr6WOkOabTnd/Y+MNY1sLLOw5pPA+?=
 =?us-ascii?Q?dL5xLMELuIzOFYPO/DRmKcMt2veWynWvX2mgcxS9ypyCoqmFtFo3oM1DGMWX?=
 =?us-ascii?Q?zFYikYCbN9GmaiQD1sUf/HMEQENa8PPMhMh8lkJonaMwwSLsrLKZ/SjPoHLx?=
 =?us-ascii?Q?+bhfBNp65fMDWZk0D2u9s1mD/W5ACawfyRWQFbc90LIXpsMz46RaLtdOfOfv?=
 =?us-ascii?Q?nA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 80f6d649-6e97-458e-6c43-08dce9735468
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2024 21:34:32.7568 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S+pRdG0AdzbmQrtejsFMH0pOZSD/ioslIrvT8rGgGerzRm9883Npsz5WIKrISIhuf3sI78gPCe2iw2aZpai67m6bspOe5jed571lD/pkY50=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7782
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

On Thu, Oct 10, 2024 at 01:28:38PM -0500, Lucas De Marchi wrote:
> On Thu, Oct 10, 2024 at 10:10:51AM -0700, Matt Roper wrote:
> > On Wed, Oct 09, 2024 at 11:08:12PM -0500, Lucas De Marchi wrote:
> > > On Wed, Oct 09, 2024 at 08:48:45PM -0700, Lucas De Marchi wrote:
> > > > Starting with Xe2 the timestamp is a full 64 bit counter, contrary to
> > > > the 36 bit that was available before. Although 36 should be sufficient
> > > > for any reasonable delta calculation (for Xe2, of about 30min), it's
> > > > surprising to userspace to get sommething truncated. Also if the
> > > > timestamp being compared to is coming from the GPU and the application
> > > > is not careful enough to apply the width there, a delta calculation
> > > > would be wrong.
> > > >
> > > > Extend it to full 64-bits for non-media engines starting with Xe2.
> > > >
> > > > Bspec: 60411
> > > > Cc: Szymon Morek <szymon.morek@intel.com>
> > > > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > > > ---
> > > > drivers/gpu/drm/xe/xe_query.c | 6 +++++-
> > > > 1 file changed, 5 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> > > > index 158629971eab3..a1f4cc25bea68 100644
> > > > --- a/drivers/gpu/drm/xe/xe_query.c
> > > > +++ b/drivers/gpu/drm/xe/xe_query.c
> > > > @@ -164,7 +164,11 @@ query_engine_cycles(struct xe_device *xe,
> > > > 			  cpu_clock);
> > > >
> > > > 	xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> > > > -	resp.width = 36;
> > > > +
> > > > +	if (!xe_gt_is_media_type(gt) && GRAPHICS_VER(xe) >= 20)
> > > 
> > > I sent this to follow the spec to the letter, but I'm thinking the spec
> > > is not tagged correctly here.... the counter is the same, replicated to
> > > all engines. It doesn't make sense to be different in the media gt.
> > 
> > Yeah, when REMOVEDBY() tags are used against a top-level IP family
> > (top-level Xe2 in this case) rather than a specific release, the bspec
> > output often gets confused and leaves behind some stray markings like
> > "XE2_M" that aren't actually true.  I don't think those marks are
> > actually used so they don't have the proper IP inheritance rules
> > defined, which is why they still show up where they shouldn't.
> > 
> > tldr:  I think the 64-bit width here should apply to both the primary
> > and media GT from Xe2 onward.
> 
> thanks for confirming.  Another thing, should we mask the value to the
> width or just rely on reserved fields returning 0?
> 
> one problem with relying on them to be 0 is that we could end up returning
> more bits read from the HW than we report in the width. Example from LNL
> without this patch:
> 
> (xe_query:5738) DEBUG: [1] cpu_ts before 4549113780840, reg read time 2694
> (xe_query:5738) DEBUG: [1] engine_ts 87847861517, freq 19200000 Hz, width 36
> (xe_query:5738) DEBUG: [2] cpu_ts before 4549113801981, reg read time 2615
> (xe_query:5738) DEBUG: [2] engine_ts 87847861922, freq 19200000 Hz, width 36
> (xe_query:5738) DEBUG: delta_cpu[21141], delta_cs[21093]
> (xe_query:5738) DEBUG: delta_delta 48
> 
> That is not a problem anymore after this patch since we went straight
> from 36 to 64 and all the previous platforms do return 0 on those bits.
> So maybe just leave this alone. Agreed?

Yeah, reserved register bits should return 0.  Since it sounds like
that's working properly on the older platforms it should be fine to
leverage that.


Matt

> 
> thanks
> Lucas De Marchi

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
