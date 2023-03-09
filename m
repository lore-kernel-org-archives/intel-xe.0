Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75F27C61DA4
	for <intel-xe@archiver.kernel.org>; Thu,  9 Mar 2023 18:05:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3041F10E8D7;
	Thu,  9 Mar 2023 18:05:59 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2A2710E8D5
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Mar 2023 18:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678385156; x=1709921156;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=4uoqpmA4jt9cXCHOUSJ2ojGQEyOz03FcdVJEfGk7G64=;
 b=mOv0C2JfR8YwpSXfNNbfRtsFA4o5GBEolUuyUFHyoFBtAmywspIkvvfL
 wVrRw1j7wG//i1HKkc7rkHSe48PpJtEkEmHlZS7LG45ssRYeXiclJBz+0
 TrBVkdqGzWjuDMveNLNQHPwy/OzdgEJ07iPBwmgYp8TBrT+MzfojF8Yv0
 fxH6zRL41LuYlSy/ILyIYfALvsdCvpkWe+hwVFOYzgzcinfeBsksPCjFV
 GWO8vLb2S+kthku2Wya8tjDmJvK3YmrTWv33b39zxzHnJDyQLdArilccv
 NEPMrexERmBlbsOVnCsohfPzIbtvTeOP6u4gDOhyLbqkx0AlbQzX9QEP/ w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="316915994"
X-IronPort-AV: E=Sophos;i="5.98,247,1673942400"; d="scan'208";a="316915994"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2023 10:04:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="654857032"
X-IronPort-AV: E=Sophos;i="5.98,247,1673942400"; d="scan'208";a="654857032"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga006.jf.intel.com with ESMTP; 09 Mar 2023 10:04:17 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 9 Mar 2023 10:04:17 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 9 Mar 2023 10:04:17 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 9 Mar 2023 10:04:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bt8mW8+efDQk6UHe1fJm8/D/XA197FPMweNeCw9xWk5OLxTXLE+08hOhwl0iwVWaJ8E8bTbQ7Rb4hRh9RgKIfdqvoc4noJoojzZffyCfVtSoovC9OMoWdEbtGnMDs0rkFxv0gmjvV8jrGeIxX46W9EV56Wlap2NOKc0YJkgON6eYY+KjILxLngr9Q/hEebS4+JRJ3Zh8qJAkjdxCMj02XRyliAyJB13JcYNIpfJCq3ILMKf77Rnx8DQ6ILEvw/N3GCab6shDsx2KY6raEhQZ/DlwdkDeLe3XAWpQKjkeePKsahUcxyGevjCTqd8mj7nTBVKLh4n5dlgeOCQrMDfaRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kA9T3VUZtMhI1IHBvAkZK/RlgDmXzD1fN12EKW1wF8Y=;
 b=PryeO1SssB0Fzm62Dp9zDwBoiws/2FQQpgDNxyllavNsEdrUNi7nsQSYkjseUMvE7vSxWoPFVprSt2URO+lzyZaH4hmzR9qaiElILq+dF1xU2q4N2rzt3qLbC96gX8CPvG2KY3LtWDuBi7ZNO43dAVpxzkEaFxvMuSEQLtzLg90lBuw+BloXdZd3dyJ3Q46KvmfwEFj+faldzZCibwqarVRTe5QIAZesExAAw0yorhM70EAhIQBje2gPl1fm5C7cJ2sxe0NfZPSi+bSNsq7jr7dnpc/h4H3EHN+dPqyVWEKOTL4atuEmFRYbQtdTvraexBIXoxaa4KCc9Op7sdjTJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB7586.namprd11.prod.outlook.com (2603:10b6:510:26e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.17; Thu, 9 Mar
 2023 18:04:15 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%4]) with mapi id 15.20.6178.017; Thu, 9 Mar 2023
 18:04:15 +0000
Date: Thu, 9 Mar 2023 10:04:10 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <20230309180410.e3i5y3hfs6xnv6ze@ldmartin-desk2.lan>
References: <20230307092446.1263266-1-lucas.demarchi@intel.com>
 <20230307092446.1263266-5-lucas.demarchi@intel.com>
 <20230308215338.GY1543793@mdroper-desk1.amr.corp.intel.com>
 <20230308221648.ylc5hxuqe2ymuvke@ldmartin-desk2.lan>
 <20230308222017.z547bjozgzniypjo@ldmartin-desk2.lan>
 <20230308224355.GH1543793@mdroper-desk1.amr.corp.intel.com>
 <20230309045107.kayv63tfzq6i4o2b@ldmartin-desk2.lan>
 <20230309160606.GR1543793@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230309160606.GR1543793@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: BYAPR07CA0007.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::20) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB7586:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c6f671f-3efb-4bfe-e696-08db20c8b1ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +7jVuADTOlpAaZOGOtjTxaRqHtURPTnvuV8gQ62z8apyybhe1W3syeosva2ZdqxfBpg6nE9P8k4GSh6Ko4OolwIthJ24B4mMmS4gCigNo7FmHTjA+bq0/DoYifaSslS6AjVN7g3zflMlHFmzKlnQczBcOF9hBp6FEoDliDYPrb89C/YDvn0hPDWUYVDWlnzOeEK83vTvtThC2wUvJ0MMqx6h23ojB0YiaI7fnXaU72cC7glbmsKy+/a5WEJpgyPhmZZmxwEYEIeP8LrpityoLBJ/5rhAQf+WVTkJfiyOFIYR6QoYcw5ltEhd4+e9it+nj5mS9DYeBEXb1n3DzP/P70aioXsNzchgWGZ0rnoL9Y27pJJJtBzMUd9WjQNAisWhFG3k1t02CbifN1AvPDZmDFRQ3x6ditOX6XKYaW8T2+q1Y4bdPEBNO776JSyqWeR+kzLXeURMUZm3DvAc+kn3DorfZ4EIpFHXOnUOK5i7gX1a3sUL+f5vo1euQh8F7A+BKJuqJ8MRpypVF8r5/v32R/E6yA0tPAZxTYlT7sq0/Oy+zVZzYf22j4i3J9iYun9grBPQ0oL7xwNYp+LgmPL4VDTUeXfIkzBJ8YNNmGUAjItmlf7qCEyj5ZLuTRqVeWy5EwEKQuExdfnUJhwdovauVA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(396003)(366004)(136003)(346002)(376002)(451199018)(66899018)(82960400001)(6666004)(26005)(36756003)(86362001)(478600001)(316002)(6636002)(6486002)(38100700002)(41300700001)(186003)(6506007)(9686003)(83380400001)(6512007)(1076003)(5660300002)(66946007)(66556008)(8676002)(66476007)(8936002)(2906002)(6862004)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aL+laVNyZnlUOiX/D59U+8fWLclaJN2c5qzRjk84xybAE+dbChN4RzeIttky?=
 =?us-ascii?Q?1YMRNxAPsS7cPB453BCMZg7Xmxd7rGREuLal/TtfclrPSzAsWvEXTBfNKM/M?=
 =?us-ascii?Q?3aFY/kG2iYq7uGfYi/Q0ufmuNH2OZikB2Kyk8zPfwI1CFClZsCmudd7lfSEq?=
 =?us-ascii?Q?xB9Ti+eDtjK3fPKbOUn6/Vvau1LgjpyAL0BHsus0IHBqW4QProwSNGcr8MZA?=
 =?us-ascii?Q?RYBirGDHlzt9CTy5rjXY+WLl4QaiDWKGZMCnmAU9pFU2q8s9CMW9hAtEv/2s?=
 =?us-ascii?Q?fTwSdLm08Hosi7gmBIHMB21SjMvJJIGIGzaaAlnBG9ZQR5CxMwIYyaKyktCm?=
 =?us-ascii?Q?eXre8MMmDXcM91cbKztb/PV72xbShyWJfGiJ+Hq4J4zhPkBYF05cOkC55WAA?=
 =?us-ascii?Q?cgBClTsrf/UE7z4CGJXBrAS+QOcKU4zkiWK8WHLXjOSD/8nhcUi1Ph4qmdvU?=
 =?us-ascii?Q?GlzyhxI81TxcE5mJJj3ZvW6U85cJTjKgi0co/SJmdtB7S/Es3JLw1JuzD5g3?=
 =?us-ascii?Q?Q9CBJ03AIz6wvbp6IvAA8aetsEItRTPWQ/P0ExACIvIxrG+pYXyylzZu7GOq?=
 =?us-ascii?Q?uj1xwFtr8FrbNSmsI2jDy4GBzztFLzOldRZlWt2WP7Eo/pxhgE8NEpB6+vKi?=
 =?us-ascii?Q?NVGbFhmgpMcPiITWRAAvUmAFnphKz/utjvd9oISmfcSxN68RpAFXgRpfKyRD?=
 =?us-ascii?Q?QsRFvfXB94mG0lPSDKLRHYi2jv3uEUUCE60PrRjc2+QVFEamyB1z2ES6ZZoL?=
 =?us-ascii?Q?8TqGVas3eqSn0hfSqLig++hukYGE/kCk4QN0ukps3rWlaIppDP0js0RxMogZ?=
 =?us-ascii?Q?LgX3aEGZQveJPCDqzsagB49Vk/u22Z4l7bkBwHj5SVK8Fm7KLFgdPcraKmyi?=
 =?us-ascii?Q?h6Gf0IXf/OlzMem/n7fcv7tkBT4DLsNXN7/WO/pgsFiBKgCI3i9mCXRibvNV?=
 =?us-ascii?Q?thDUuu7smX2M5YgFqeCMvgHMmLpufwR109s3fBJnAPmQhzVn8f/ePbg6EIub?=
 =?us-ascii?Q?k1TcZNDiTipz8Qym0G0G0uiQd+vs+bprX4fMC5gnv3xkJqz5yhuFAM99pagy?=
 =?us-ascii?Q?F2Sjtq4AoTVYGYzbOnjmDhKqfiYsfQPYTg2QgmGrYOB+yDpQsq4vFLVAxDu3?=
 =?us-ascii?Q?LZkE1/770wcabMgc8OPiTpAN/EF0zOSo6hOxB3v/IIHtfMwr6x3I4921t8AV?=
 =?us-ascii?Q?Z3lgToRVVN3q4WYZO8dR50HmHCbzVUVrHafAgPalPKAZ370X9/4YcbJ0OK31?=
 =?us-ascii?Q?39aHIC3aqLbKsCVem9SdBFgcbpbCOwvsxhe5U+7by3CmCN/1f7hYWOT/TsxH?=
 =?us-ascii?Q?jj1Y9IyMlqGWNrJdyBF8ou9btd6BRmNoeLRqI0o6anwIoQaA1h6k96iBeX5r?=
 =?us-ascii?Q?Y/HZ3QZiu9nceIqwYvfQRwWaQlL+X0oRpI+lgUIn4WMELVI+FAdNeMA6vWI9?=
 =?us-ascii?Q?c3NZdSEwkaPrgCB808Zr3wauDRQawhszZ5W/W5qUHp5ozROKa1NUyCh7r/as?=
 =?us-ascii?Q?CGycPDPPZnP/si2THq7GLsyskx3jHQr4QvN8TwKMWFYc9H2SSm+KO0Lisrs8?=
 =?us-ascii?Q?c16LofAd6zWsSpst3dURFB/SdXVc2OT7ugrNvyToKgH0DWGaTVsmo1dk1qgV?=
 =?us-ascii?Q?Dg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c6f671f-3efb-4bfe-e696-08db20c8b1ab
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2023 18:04:15.1625 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TAkSHGgcKGpztHL3xYWPCU89hl18rK0ErCEEcVLbapkBvauYWNulQ+Uc3WrsekjuMzj4kEh7I868t47YFF1D5TcNdQl42Axvv7t1/FZk2Fo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7586
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 04/19] drm/xe: Add helper to get dss per group
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Mar 09, 2023 at 08:06:06AM -0800, Matt Roper wrote:
>On Wed, Mar 08, 2023 at 08:51:07PM -0800, Lucas De Marchi wrote:
>> On Wed, Mar 08, 2023 at 02:43:55PM -0800, Matt Roper wrote:
>> > On Wed, Mar 08, 2023 at 02:20:17PM -0800, Lucas De Marchi wrote:
>> > > On Wed, Mar 08, 2023 at 02:16:48PM -0800, Lucas De Marchi wrote:
>> > > > On Wed, Mar 08, 2023 at 01:53:38PM -0800, Matt Roper wrote:
>> > > > > On Tue, Mar 07, 2023 at 01:24:31AM -0800, Lucas De Marchi wrote:
>> > > > > > This is already used in intel_gt_mcr and will be used in workarounds.
>> > > > > > Add helpers so the platform-dependency is in a single place.
>> > > > > >
>> > > > > > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> > > > > > ---
>> > > > > > drivers/gpu/drm/xe/xe_gt_mcr.c      | 2 +-
>> > > > > > drivers/gpu/drm/xe/xe_gt_topology.c | 6 ++++++
>> > > > > > drivers/gpu/drm/xe/xe_gt_topology.h | 3 +++
>> > > > > > 3 files changed, 10 insertions(+), 1 deletion(-)
>> > > > > >
>> > > > > > diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
>> > > > > > index a42061c4b9d2..694a79b40ec0 100644
>> > > > > > --- a/drivers/gpu/drm/xe/xe_gt_mcr.c
>> > > > > > +++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
>> > > > > > @@ -223,7 +223,7 @@ static void init_steering_dss(struct xe_gt *gt)
>> > > > > > {
>> > > > > > 	unsigned int dss = min(xe_dss_mask_group_ffs(gt->fuse_topo.g_dss_mask, 0, 0),
>> > > > > > 			       xe_dss_mask_group_ffs(gt->fuse_topo.c_dss_mask, 0, 0));
>> > > > > > -	unsigned int dss_per_grp = gt_to_xe(gt)->info.platform == XE_PVC ? 8 : 4;
>> > > > > > +	unsigned int dss_per_grp = xe_gt_topology_get_dss_per_group(gt);
>> > > > > >
>> > > > > > 	gt->steering[DSS].group_target = dss / dss_per_grp;
>> > > > > > 	gt->steering[DSS].instance_target = dss % dss_per_grp;
>> > > > > > diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
>> > > > > > index 967f2349c67a..9fe06a46a400 100644
>> > > > > > --- a/drivers/gpu/drm/xe/xe_gt_topology.c
>> > > > > > +++ b/drivers/gpu/drm/xe/xe_gt_topology.c
>> > > > > > @@ -103,6 +103,12 @@ xe_gt_topology_dump(struct xe_gt *gt, struct drm_printer *p)
>> > > > > >
>> > > > > > }
>> > > > > >
>> > > > > > +unsigned int
>> > > > > > +xe_gt_topology_get_dss_per_group(struct xe_gt *gt)
>> > > > >
>> > > > > When this shows up as a general interface, it leaves me wondering what a
>> > > > > "group" is.  The rules for DSS steering happen to use gslices on Xe_HP
>> > > > > platforms and cslices on Xe_HPC platforms, but that's just the
>> > > > > platform-specific rules of steering and doesn't automatically translate
>> > > > > into which type of slice would be appropriate to use as a grouping
>> > > > > elsewhere in the driver.
>> > > >
>> > > > humn... maybe I myself didn't understand the group meaning here.
>> > > > is group a generic term for cslice/gslice?
>> > >
>> > > btw the term "group" is already used in e.g. xe_dss_mask_group_ffs()
>> > > exported in drivers/gpu/drm/xe/xe_gt_topology.h
>> >
>> > Right, but that's just working on an arbitrary grouping of bits (of any
>> > size).  The definition of "group" in that case is explicitly provided by
>> > the caller via parameters; the function itself doesn't decide what a
>> > group is.
>>
>>
>> so.. do you think documentation for what this is should be provided and
>> be sufficient? Otherwise, if you prefer not to expose this, how should
>> we implement xe_rtp_match_first_gslice_fused_off()? Just hardcode it as
>> 4?  I was trying to avoid the word "slice" so I used the word group as
>
>Hardcoding as 4 sounds fine to me since that's true for all current
>platforms and at least the next few upcoming platforms as well.
>
>> it is used around this code. Maybe I shouldn't.
>>
>> What about the following?
>>
>>  /**
>>   * xe_gt_topology_get_dss_per_slice - Get number of dss per slice
>
>"Slice" is also ambiguous since we have gslices, cslices, mslices, and
>bslices these days that are all related to different subsets of the DSS
>pool and that can all potentially be used in different areas of the
>driver.  If we're making a function specifically for gslices, then it
>should state that; if we're making a general function that can be used
>with anything, then it needs to take parameters that describe what type
>of DSS grouping we want to use.
>
>Unfortunately the bspec still uses the term "slice" in a couple places
>without specifying which of the types of slices it's dealing with, so
>you have to read between the lines a bit.  I remember that leading to a
>lot of confusion during early xehpsdv bringup where different sets of
>hardware architects were arguing about "slices" and didn't realize that
>some of them were talking about gslices while others were talking about
>cslices.

I think the 4 hardcoded is worse than slice being an abstraction for
gslice/cslice/mslice/bslice depending on the context. The reason to have
just one xe_gt_topology_get_dss_per_slice would be the one below

>
>
>Matt
>
>>   * @gt: ...
>>   *
>>   * Each slice in the GT contains up to a fixed number of DSS. This
>>   * can be used when the ``g_dss_mask`` / ``c_dss_mask`` saved needs
>>   * to be interpreted on a per-slice basis.

^ here. Because for the current platforms they are the same.
we expose g_dss_mask and c_dss_mask at the platform info level, but we
don't expose how they can be grouped. This leads to additional platform
checks in different places rather than the one place we can have a
better understanding, the xe_gt_topology.c file.

If I hardcode the 4 in that function. We will still have:

	drivers/gpu/drm/xe/xe_gt_mcr.c:
	init_steering_dss() {
		unsigned int dss_per_grp = gt_to_xe(gt)->info.platform == XE_PVC ? 8 : 4;
	}

	drivers/gpu/drm/xe/xe_rtp.c:
	xe_rtp_match_first_gslice_fused_off() {
		unsigned int dss_per_gslice = 4;
	}

None of them seem to be in the right place (xe_gt_topology.c, for me).
Particularly the one inside xe_rtp.c seems totally out of place.

That said, I can disagree and commit here. Hardcode it for now as 4
and later we figure out if we want an abstraction in xe_gt_topology.c

Lucas De Marchi

>>   *
>>   * Returns: Number of DSS per slice to use with [gc]_dss_mask
>>   */
>>
>>
>> thanks
>> Lucas De Marchi
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
