Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41CC7CCD183
	for <intel-xe@archiver.kernel.org>; Tue, 14 Oct 2025 02:07:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED0DE10E04A;
	Tue, 14 Oct 2025 02:07:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mj0dvnUq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99B7310E04A
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Oct 2025 02:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760407637; x=1791943637;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=aVRFkTNULEn2A9MCYT/Jwy6DKkYD0LI6WoHu7AUZjQQ=;
 b=mj0dvnUqPGVWkVWPehDeZSx+fH+nZgNeFR8vp4rkt2o/lJAjxpJFJAab
 bJpALBA+HlUUEtibjoFOxnz/w/HfeCtPNSCQNduMo8dS1+OuGJU8+SXQR
 N1lHx9En0cmsOZ4mRbJM29i2x/Dk4sxthptvJ0pidiBnbE6hoLZZTX+oy
 TxxY3k7b+ayV6bYj7cmIAq5/N/HZ97Y0tHRXpliPZUQ0btNwTG/5wPU89
 2UP76gakJ8SJWBqTHuKmK9L29KtXnWrcI6wYBUhEWGrhAPB/+KMlw2Uvr
 Mo6giIKk+VstpYrC3hFeFwk8SebbOFJTVM9ti9fpNKSDDfLo9ioGh4DMf w==;
X-CSE-ConnectionGUID: lf2yjtuQSHK/SKCusIDnQg==
X-CSE-MsgGUID: GvR9ZCT+TpiCFJ4u/lJz/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="66382078"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="66382078"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 19:07:17 -0700
X-CSE-ConnectionGUID: irn/zD14QAqloiEGivFCLQ==
X-CSE-MsgGUID: qlC112dKRxmW7vvFiSwPFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="181555980"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 19:07:16 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 19:07:15 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 13 Oct 2025 19:07:15 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.24) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 19:07:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n8L7lS54ON/JmT4S7bJnThnZcnap1z/hlu/72nUswH0A5N2F5YT1LITk8BZVWmzFKjSPmHTdZLZl0+6lVq5zOKGIXTQtxuO5ODEbhkDPr5PCXmHzwtJTKJKklKUvlyus2KYI3BE4m4l/FffWVNhyz/sW4I4SQIGDMa5ajl1bL/H5Av19mekycLcMv6PwAYtErkrtFNp+dVLVUwfiU3gqyFZ5P0q5K//mfJ+nc8qgaV7vT0NHldV4t1kYRbUc15TFsPajDwBDRendXGOQq5+NEdNx/GVwQMybFV42EXqxU+gf3oCK+sGtN7l0bKdPAvSzJUrOduhbLGQaWueCT/FldQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/+niinAwHCGmjTho13xGXp2uNpIagv81Rtn9W5MruVk=;
 b=xuI6ckoi3ZJQpvH8B+KtWAFIvNhw8SVQrDa8RwyVHk3JnamcMjz3lREKK6PDsqtJ1yXjc5xcgz3jl27kRL3euZIE/vVzC3YMMZTMFdVdbOQwLNviNH3YA1zTLtjCuA9oqsFMVJlTEdHvAkndF4cBjmdOpXG/tNQna8a4fLEsUCY6sQ20rpfiz39lPKoA7Q1sFDLAJ20pkVih43ZadckyqxyPbL3h5w6qiuRgYEeikATvQWTSXJr6PrmL/CbuC6hqD0tLP7ELt+RrltRNlnr39sxni7bF/TbVwTcvEp8RDbMRvbvJd4TLp0+/DaDyCGyJnGuQb0vxgxfpvyhxaEnJNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by DM4PR11MB5309.namprd11.prod.outlook.com (2603:10b6:5:390::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.21; Tue, 14 Oct
 2025 02:07:13 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%5]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 02:07:12 +0000
Date: Mon, 13 Oct 2025 19:07:09 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 6/7] drm/xe: Kick start GPU scheduler on teardown
Message-ID: <aO2wTZPMi4xnAQNF@lstrano-desk.jf.intel.com>
References: <20251013223135.189357-1-stuart.summers@intel.com>
 <20251013223135.189357-7-stuart.summers@intel.com>
 <a20a8b50c04ee8fd531dfe1a416a34785321618c.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a20a8b50c04ee8fd531dfe1a416a34785321618c.camel@intel.com>
X-ClientProxiedBy: MW4PR04CA0046.namprd04.prod.outlook.com
 (2603:10b6:303:6a::21) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|DM4PR11MB5309:EE_
X-MS-Office365-Filtering-Correlation-Id: 68549e2e-9b08-4793-f098-08de0ac663a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?oqRLLhzrAVUZF6K7dbhiPv1WD1BYCdGYlULYCzGvr4nmTLT66KBghB9qck?=
 =?iso-8859-1?Q?GdHkcZ05stDkvv7gq6aCbt8VRVvnCU4Uq++yNtqszQT1fuhGfeWK0t81de?=
 =?iso-8859-1?Q?OmyGhjGFJ+c43aFK1GyRKBvAw7YC0Y4DXLscfg3h6LmA9mC3attlHitQqT?=
 =?iso-8859-1?Q?r2vdGSwk6NPkoUB3jgsHWbP2GYSpOTgK2TgY0R+8D7yers+f3wJ7lNoVeS?=
 =?iso-8859-1?Q?bIZt7y15xwwJYqIOD1qQ7AJ33ByU/yAmy8heGjnE5/a4TCZFE3Kf7D4N1N?=
 =?iso-8859-1?Q?bHT3GraDQRr9RuLY8XKqKD6QHnzeggfWzwhpiGi/LDsSXnAI9kbIvLPV/0?=
 =?iso-8859-1?Q?kRRnN5qIl9jq45RNkjSw2Gps3nfutu8IxCVKe8KjzuKXPgLHFgVPoA7a2R?=
 =?iso-8859-1?Q?crVqr/DPQs4TmZ7NFI25rcs2o0KMNkzQE8Vfd8jzcI2rAFMy9gxZ+OfsC7?=
 =?iso-8859-1?Q?AzenkgQPr+9PNqn9m1lAT1VomDee4YvuOpUEb14zf+0WPW9pX8TLXW/51R?=
 =?iso-8859-1?Q?dJdUtkxufMCHDXf74XoCDz8e6c+IAtJTkmLrGQ5sG34Ze4WbkmdVInGC7/?=
 =?iso-8859-1?Q?VUiwljODRz2saL6Nk2K+96n73d1Mdq37mpTXRaSYMkTLKLpCOOiCaP2Lwg?=
 =?iso-8859-1?Q?KeZHZgUUEbZQoRQl6Q6ckYgimgggdGyBNnZ96WzIJdRlMtSbWBxoCoo0vN?=
 =?iso-8859-1?Q?5kBQmr46y43Sl0fa7GMjbLfcVG1RupMisSAvxPXymYthsk9+CcXeNW/Ayx?=
 =?iso-8859-1?Q?T6KOMGutvwlMpwaZBZY71+CHKLBXerALO2qRJj1AjdIe+IfTC2efRuKAvx?=
 =?iso-8859-1?Q?Bl4c07/2FNG2VW100VyqgUhrWIUdWS11+7kQsJ3Jk/na9DS5cJyx0akJZ/?=
 =?iso-8859-1?Q?Fc2y78aWi1d4/kZuk3leH8o+g5k09gcGP1eI2tK8yhp9xZAa5UrjLguPQM?=
 =?iso-8859-1?Q?1tYjUbk52sD+1DDUkIWueUmjWyiB/TlKkciDCpA05sCIr/V9p/uUT8EZ+P?=
 =?iso-8859-1?Q?lqN32TQ/4Z7bMgjDxLT4Z3+eHN6Ao9qKgH/lLLxt1no51KheyshuWBDIfD?=
 =?iso-8859-1?Q?S8mpXdxvsqibyymK4nZrKYl6+l30S4OJmcNWbTkKIXLAZDHQUxy8LplB8e?=
 =?iso-8859-1?Q?NaWrDfju6C0kmRBByRXPq58mJ/NxbRA4V5YCQVzvu+nIEjhd1brteSJ5y4?=
 =?iso-8859-1?Q?bZ60cJna64u4aeOqF+xpOcI59S0jKyViphg/oha2t2YYtm59c+6eCG8b8h?=
 =?iso-8859-1?Q?pu+Pu2asW3UzAeZndHuoMOSmpUjujt/S/5gWpy6Rl+GpCUaFeZtKMncBzy?=
 =?iso-8859-1?Q?toOdxs6wKbS0XoOZO+dXSotucF7OxlqnnM3zU33xwP5jtmtd88peC+2b0z?=
 =?iso-8859-1?Q?zlrRcNcnXuEKYpov9W7PWdPT6XOjtT5g2964G0L0rnLvvrY1PotlnqQf6K?=
 =?iso-8859-1?Q?7dDWsmr9JycMzDuiPwKM3l0VNW2mE+1+l/VE1fz13dVc1etsgyRPEDn94i?=
 =?iso-8859-1?Q?8Yb+FS3KG/KkNZljJ23f0v?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?v186GbNLYHmqHUKGfpXZsre9w2kTye5dXVbuLfuBGN9+kYs1C1nSMD6Eee?=
 =?iso-8859-1?Q?68LMSJ3xhhM5gJqm3maASy0fclWj6iV6CBI6U29nYGACF1mXQu8LNwd3xg?=
 =?iso-8859-1?Q?frIKVAaQZj5+9u34LPKsijtsZ2TEOJexG0ks52LLID0dlLNmTYN8Z96M3s?=
 =?iso-8859-1?Q?pckMfSFuFw1d2Tk27VPcfgh5BrPkaE7HtywQ7ioV5d7zN/YWyT64jbG6u/?=
 =?iso-8859-1?Q?4G2kFgE7IHY88UP7Cx3kZ8TCBe4RZqySNL7EapAq0hGTgNF7AAOZdTR+KG?=
 =?iso-8859-1?Q?mRXfHbOILslfRfHcRHLeRBR0nSQdKC30x4yeyZjnhB/2T1T4KDj6tW9JKE?=
 =?iso-8859-1?Q?388sYJCteGl9KSngzCDDOeoXz7QpDWT0Hhkrh2t0wBGvB/GN+vRu5QlxNA?=
 =?iso-8859-1?Q?/Yn11dNP2UWQhhnwZUmrXQvLtXlsJa3Ay3RVk0yLKB5HhODxRqbCxgbn9W?=
 =?iso-8859-1?Q?9b5SqdzzIKooDj0yiiw2xprHg8R6teZBJGvwQ5Xd2YkKjut+Lz0wiCU/6F?=
 =?iso-8859-1?Q?huGOmOzq+7GRGlQA3eIFBeF7iYs1+oqGp+/H4/a0ee1ktUNlvaTgwJqXtm?=
 =?iso-8859-1?Q?3AapgBbe8ibZJfPIizNEYiT7jGL048aIGCjCi3o/If/Zhy7DyUdZOeR5Zc?=
 =?iso-8859-1?Q?F7hndOPAKf9FuEnAbdm9D+f28gv5n5a4Xsq9CMNA67qfTUoAmeIxvuXGMY?=
 =?iso-8859-1?Q?eTLu7htMk5rPmD/cb5J3h35BuIZYkMd38Dvi8SQv/9ld0DRngEtTtlB3On?=
 =?iso-8859-1?Q?4oegFztCEiPAU3Iuf43Mxoavol6yZnYnIPlkAn8xJDPrMQjUUEHO9koxa/?=
 =?iso-8859-1?Q?RhxG21j0cALz5FI1X2CbmFYzwFew0H/LQWx2zrS7kkubAbUo32cI1cLiyf?=
 =?iso-8859-1?Q?p8TeQDotC3a1skKE/EYUYrk/KuFAjwyRUr7ltFqIs/Y9hJLIQw1YGTl0GT?=
 =?iso-8859-1?Q?ttAvge5+nCF3KsJfUhHjBT57b5bIcG/70tDComioQFJ4p5TUgd/S+fviCZ?=
 =?iso-8859-1?Q?plFkZM9bixzR1XULvxfVL0GL5ru0J0UBY1y+h8wGhJCtvMcqRfjO97VNp3?=
 =?iso-8859-1?Q?AWmhjwEOy5N8c7fPLHPhc+xJJ7kpb2d0iQaCivr47p2+tfnmhQkgzRFpTI?=
 =?iso-8859-1?Q?mVjuQ99Yq50p5lWxxZZz6ayrXdGrjmu00nJdiqN9ImVN1d14pq1tZbVDTd?=
 =?iso-8859-1?Q?A17Ikejx07WN4t/k1XAE5+j8rNhL2QdIrLgj7vanQYy/SaBWfH0dn9uexr?=
 =?iso-8859-1?Q?Di4/qtROmkHEo6Hs+l94rRTxYWHl3n0ui6EZJodycVlblv+T3zy/cjklzO?=
 =?iso-8859-1?Q?NGKJYi+Q/UntFf+kNxXDclEeAZ/KfqYU6F1qIgNmK5XSACDN9fPZisIBiH?=
 =?iso-8859-1?Q?edOm1MJweqM62fxOtdv1ijgakzVDY7IJSwo9uCXaY35JM5WQYe0BVYrNBL?=
 =?iso-8859-1?Q?WISoqEIeUR6txbBuijgMnHByiW/SyAccYIR+L9tEKHxaAboF69ml61YK/S?=
 =?iso-8859-1?Q?S4dSo0bn+CxPjRAjfhGSWv+40H9yJXqy7F2bH3iV4JOzNbUxdDG4gDYAxF?=
 =?iso-8859-1?Q?vcaY4cMlxgyd71I062V5lSGtVatq69TMEgeA6xQAEu197DWY+Gl+jPJLqg?=
 =?iso-8859-1?Q?zGeWBp9TBAvplfmm8axXcxVDfcuSg2WgXx4fQZUXF6Ueu2F6ZHNPeX+Q?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 68549e2e-9b08-4793-f098-08de0ac663a8
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 02:07:12.7616 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VNIBnnamKi+QDIVBbGJ7ssirxwgFVYjmdvNF4cKYheP9fFG7TnY6YCkcQV4nC4dM0vCyuqAQXhP7IWB2gBA/wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5309
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

On Mon, Oct 13, 2025 at 04:32:57PM -0600, Summers, Stuart wrote:
> On Mon, 2025-10-13 at 22:31 +0000, Stuart Summers wrote:
> > Ensure all remaining GPU scheduler messages are processed
> > on teardown. We already have a wait here, but if the
> > scheduler was stopped while we have outstanding transactions,
> > those queues will never be fully drained.
> > 
> > Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_guc_submit.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
> > b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index 5ec1e4a83d68..c923f13a13ef 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -276,6 +276,12 @@ static void guc_submit_fini(struct drm_device
> > *drm, void *arg)
> >         struct xe_gt *gt = guc_to_gt(guc);
> >         int ret;
> >  
> > +       /*
> > +        * Kick start the scheduler here to ensure any remaining
> > +        * messages are processed
> > +        */
> > +       xe_guc_submit_start(guc);
> 
> Let me know what you think here Matt. We can also extend the below
> timeout. I'm hoping this covers both the case I have and your VF
> submission drain case.
> 

I think you will need some code similar to guc_exec_queue_stop somewhere
in the wedge path which cleans up lost H2G. Off the top of my head, I'm
unsure exactly where to stick that part.

Matt

> Thanks,
> Stuart
> 
> > +
> >         ret = wait_event_timeout(guc->submission_state.fini_wq,
> >                                  xa_empty(&guc-
> > >submission_state.exec_queue_lookup),
> >                                  HZ * 5);
> 
