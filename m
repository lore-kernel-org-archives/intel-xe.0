Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AC89C77B61
	for <intel-xe@archiver.kernel.org>; Mon, 10 Apr 2023 18:45:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BE1D10E1E2;
	Mon, 10 Apr 2023 18:45:30 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59B5810E1E2
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Apr 2023 18:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681152327; x=1712688327;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6XS/1DGZuZhgoxqcpNwfZ8l9Or/el/klumKd50PM9SM=;
 b=M94wRnFkcsGFwNLBQucnvZMQgbot/5UT2/UKLMY/vzHfrFUmOM+Aq/DH
 8IPmhdRsPOLURymlotf5c8QA1wYAtwc+J33ZDWxf9qTHIAJRMRmEFsWwo
 WShG5vB00a3NxabxCG5CngcORatlFtJzyU0GvuG3u/m1FkukIhJE0ock4
 hLkUpow1hwZZT3DUnY2g7LromW1K2dk7voct8h8d5+hQJa6LiWm7L3QdA
 KTyj9IN2BOQhe+RYTMKDf+1nf1T4y5EABnChOWx7qKe0vLKzzlZa9igv2
 33am/WXKZpkLLaWKeNgOO0AdCZ0EMWL78z0xHeenUzi8nQoaXJxRe3gg+ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="406258326"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; d="scan'208";a="406258326"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2023 11:45:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="690880936"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; d="scan'208";a="690880936"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga007.fm.intel.com with ESMTP; 10 Apr 2023 11:45:15 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 10 Apr 2023 11:45:15 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 10 Apr 2023 11:45:14 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 10 Apr 2023 11:45:14 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 10 Apr 2023 11:45:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UP9GqH8+cw43rLWMWXqqBMYUY94XAviHGfwMXR4ztPQgSTwjjAjAiJFUBQki2VAJ4MPPgst82hwrzhwo65BB3EOIbqLyQdjhspMSwk0nfq+m5Jl58UFmyp8ZxRf8e9M0jeFtir43WcYWUKBBZLFPMRPXOq7c/T8BKYVua78Kw2NeebPV1TccEkjn5rqUI2s1TCHrMNbjEc0adFnOzrP9Dzret9bQKuctdrTHFHlaPTyRekxuyN/28GWXzweURBiWkE+rWgLJtindimtFWNhI8/GgLHT9yy/EbHqPmH4aU6ySt0tzXXGL/xVzBRLq7ovLQbcxQ3G+XK8qBrVpDmiCTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uIQ/nrn8PwapdN98e266H+Di5L+PGMxC2P14M5YTRu0=;
 b=DRIAgN5MrSHVoSQqo7ljlG2Abl2EJDq+PsVR68+kHbK1k2QFNC7416RP8EGAMpncWTNaZc7RVJia1D7gQNvCsFf3f56jSG7R/te+Nz4Hn1JtQFvE4EvCj82y4ZWsLfCxIxiUQQCLcpYNXHdbYhry730ZwvX4hxNhSgsryvlsQhLaJ2CvWIHS9ZR51p/oHbPXW0jK/fum95tdDF2/tw68y6j9fkvx36XdK/5aPoCPbouqQFJMyaHqBIW3JKsO+O9Xc7jUIW33cuhrg6Vra9brXPCATA/QJ156bFYS3Zai2/ue8ckzcCYwLzTgKZI+rg9XprM3iCZX1QkR+nZOeU4v8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 MW4PR11MB6981.namprd11.prod.outlook.com (2603:10b6:303:229::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.30; Mon, 10 Apr
 2023 18:45:13 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%8]) with mapi id 15.20.6277.036; Mon, 10 Apr 2023
 18:45:13 +0000
Date: Mon, 10 Apr 2023 11:45:10 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230410184510.GV4085390@mdroper-desk1.amr.corp.intel.com>
References: <20230410180504.2706189-1-anusha.srivatsa@intel.com>
 <20230410183726.r7hsj55yuqaouuyq@ldmartin-desk2.lan>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230410183726.r7hsj55yuqaouuyq@ldmartin-desk2.lan>
X-ClientProxiedBy: BYAPR11CA0104.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::45) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|MW4PR11MB6981:EE_
X-MS-Office365-Filtering-Correlation-Id: b65c6f55-4f3f-4822-6422-08db39f3b7d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8JgGF5jCMb8XZfVEIrEFgq+PlFZxfdjLPPG4FmQ2upeVNPPgB1TK2T3amP91ovBmPHSL1Enc8YKrjnXWoO0C87eI8DZ3jzpsK/iPK0N4powweGwptxmLBvCOAvSc3/InkUvE9jKk0bwtvjLF2d+PsYpFu4/mOcE+eBx/ZSy1srfot0jqLb1Ya5C3rEgx2U/5D5cXm6aQFx9JUzVvnE6kvfsJM5cGuEicrDQi/JB7E57HfmD/XQMgbxqJdUkYxremBh3EuoYjY5DyWd3Vr+JDwLMNfUY3eWjzvTFkdmXmrxMF/f4AuVoahpbHEBXczUPKI449vcUwmES/ORIDyOYuowKLay/vK5q+aF6CwPkHQgmg2w63+LOSglxIK50FAI03yI3ooJX3uZHEMKFjidKcqm7DhZONJx6PppER1lmJx35Unz7fCOAB8M3WoORqcxjNjjM3ZJ0bWAgXCZqE0KI9kRH5PqZbgJnIEPfr3kMrVcCs3PdYQQVTedJ4lfh69xynaGA3V6kz7Y79r/zYxfGj1TMYGV8RTwycQIwb6nYvN9nAsVvC/G46E2WCnVd0gs3K
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(346002)(366004)(396003)(376002)(136003)(451199021)(8676002)(26005)(2906002)(6506007)(6486002)(6636002)(316002)(1076003)(478600001)(6512007)(6862004)(38100700002)(5660300002)(66476007)(4326008)(66946007)(82960400001)(41300700001)(66556008)(86362001)(8936002)(33656002)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YeUAw6W6ZqHFMRutsukenyUFZHLihYh4UnrHagVN45J5URr0Xr39RmGHLt+c?=
 =?us-ascii?Q?lsRk0gnzfjrWbJCWLxJoUSQN41Prcu+INCVPEILkEf+Rq3SD9Hg0zPhMtPnV?=
 =?us-ascii?Q?h2jdW47njlA0xUzC1hvFU1PSp1/hQCggjAtndH4PtEJBUtA/FTwgaDXHfglS?=
 =?us-ascii?Q?o78imBWXOBM8lD43PirE8Qhzsticdi24XP0ACNspM8fwG7ksMISwQU2e0bnd?=
 =?us-ascii?Q?VGaBanbeAqX8YjDtInHL6oJ7OiXkPnn2kAWC5QCJ1qaPCyz5xGRivWaxdy6i?=
 =?us-ascii?Q?q42BHurb86mhEEgwLqsvH083J4Vax9kXEi1j45xD/z+RlLVMaIjfnZ4UnWRz?=
 =?us-ascii?Q?y6QZhszP1vNehaAfAkVwP1u3WQPRau7P2i/Tci74k3idTShW4PwdbtDTBy0e?=
 =?us-ascii?Q?nF27RvkMxmy5IyjLTrLpXEDGZ0fQ8bcbm9tW5wbzNS4TRj+tm13qTc+/S8fw?=
 =?us-ascii?Q?5p1Rss0yqCW+pKlG5eBJQzq3IGgwWmO339fM+4pje321exWX42YpBPBK+M6A?=
 =?us-ascii?Q?6Tp1JMLZHu2JxnuyWhq+wZHgQIC1JVHBED/35yMzCTSxHRFsVIeD6/a1zp2+?=
 =?us-ascii?Q?XQ8hIwwOKkX+OLPbFrSYw/FMCBND6UnDJUgSaq8MoYkyXY0zAvg9stGaoN5X?=
 =?us-ascii?Q?T5We87CFz5OzgrSeHgNsz3z3K91nkk7NTX4e28w5aI2FycO+OxXzZhldQHu8?=
 =?us-ascii?Q?ixiUcPCOYtBVxtSWanHgM2EinXZnyVI0xcqYj2ycwxynK21D37ci/0kfyi6H?=
 =?us-ascii?Q?wd4ZWQKnCf7FyAgbzta/FzOoL+PoZcFPOcfMjbr96HyRqHBVQMinUKCeCuPZ?=
 =?us-ascii?Q?oTbDGFG4cMlu/uJVpPPil5cEnPclcYjlKqiRiXOGt6kMyUP7KLIEEVp1TAl0?=
 =?us-ascii?Q?lG0kHJMOnTvraQPGUeVmfiFGaf1aXoev6UYVaSJi541Afr103+qLSwgHW/h9?=
 =?us-ascii?Q?n9ZGRRseKQVuKqULQBaLpo53nFRS1QSz3qcP/xpkrHm84hyJfjgaF9C6O/Q8?=
 =?us-ascii?Q?/AgnODC6wpYuxiyFRAXn6u0wk5Tf+suhbXdp/VxYkIwFDg0CU8O6Rp3HA1wc?=
 =?us-ascii?Q?NC2DNCOmibGdQnnOz+Pe41R8Ft0Xu4zqjxYKD8V1f5CvGoJdkC4HXg2YYuHs?=
 =?us-ascii?Q?nRst7fb1HwPotn0l+B2e2CHWY02DLRhDriySHHEU5AbsuUIHQBFtpjZaTGw3?=
 =?us-ascii?Q?AbPQF1vZDOZ1mmYvWZTl9Wt9P9aRzjAMsUarf/BVVjMF9xgy1PufgUqPGdys?=
 =?us-ascii?Q?oe0HgIuQtqkAJ+a/IQF7lQEK1pBXghylVmpqoZ1yjkyGNmhy2Rv2WD9pal4/?=
 =?us-ascii?Q?VC40iyB9mIqjdD2yUn/m4S0am6gXlL6AOucEOphDjJqh8ku6dJXDjP9OXFCL?=
 =?us-ascii?Q?1OF89Dre+yeXNOzbLGUvDwC87tQlyZMRKpD9pX9gYsRh77Zk+R5oiJxIXWxF?=
 =?us-ascii?Q?QJZVY7NrF2jZvp2/EVwcdKq889oGQ7uWii26M6TU8u4Ul+qKC+DjLrkQKjW4?=
 =?us-ascii?Q?MqGfO+y+XrI9g1N3vNidyNhcpBQGKTajSfIA8gTw9GcAQa/JZq1JiWrtEhkC?=
 =?us-ascii?Q?/bZo40hR+oTX72eO/nUznUEjMS1TjHKfrIisPs1JvqQKDZ+co04mBNz6vkOh?=
 =?us-ascii?Q?iQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b65c6f55-4f3f-4822-6422-08db39f3b7d4
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2023 18:45:12.8652 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L7ZAnAJPmp9WJh+5tfQ5xigm2mDDPGcI7G+xnD04grcnpHFd9x2z6SS7iA3tcounhSKoVY4YE57S/frE+G1eM3MGB0pnhn06z5/dwiLrZuA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6981
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Add Rocketlake device info
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
Cc: Anusha Srivatsa <anusha.srivatsa@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Apr 10, 2023 at 11:37:26AM -0700, Lucas De Marchi wrote:
> On Mon, Apr 10, 2023 at 11:05:04AM -0700, Anusha Srivatsa wrote:
> > Add missing device info for Rocketlake.
> > 
> > v2: Also add abox_mask to the device info(lucas)
> > v3: rebase
> > 
> > Signed-off-by: Anusha Srivatsa <anusha.srivatsa@intel.com>
> > Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>(v2)
> > ---
> > drivers/gpu/drm/xe/xe_display.c | 11 +++++++++++
> > drivers/gpu/drm/xe/xe_pci.c     |  8 ++++++++
> > 2 files changed, 19 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
> > index 5fab5b9fbde0..44697c0f7fb5 100644
> > --- a/drivers/gpu/drm/xe/xe_display.c
> > +++ b/drivers/gpu/drm/xe/xe_display.c
> > @@ -488,6 +488,17 @@ void xe_display_info_init(struct xe_device *xe)
> > 	case XE_DG1:
> > 		xe->info.display = (struct xe_device_display_info) { GEN12_DISPLAY };
> > 		break;
> > +	case XE_ROCKETLAKE:
> > +		xe->info.display = (struct xe_device_display_info) {
> > +			GEN12_DISPLAY,
> > +			.abox_mask = BIT(0),
> > +			.has_hti = 1,
> > +			.has_psr_hw_tracking = 0,
> > +			.cpu_transcoder_mask =
> > +				BIT(TRANSCODER_A) | BIT(TRANSCODER_B) |
> > +				BIT(TRANSCODER_C),
> > +		};
> > +		break;
> > 	case XE_ALDERLAKE_S:
> > 		xe->info.display = (struct xe_device_display_info) {
> > 			GEN12_DISPLAY,
> > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > index b92d8b5a391e..a81427019d02 100644
> > --- a/drivers/gpu/drm/xe/xe_pci.c
> > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > @@ -179,6 +179,13 @@ static const struct xe_device_desc tgl_desc = {
> > 	.require_force_probe = true,
> > };
> > 
> > +static const struct xe_device_desc rkl_desc = {
> > +	.graphics = &graphics_xelp,
> > +	.media = &media_xem,
> 
> now it will have VCS2 as a possible engine. Not sure if the fusing
> will handle this correctly or if we should create a different
> xe_media_desc for rkl.  Matt?

We should double check to be sure, but in theory the fuse readout should
handle this properly.


Matt

> 
> Lucas De Marchi
> 
> > +	PLATFORM(XE_ROCKETLAKE),
> > +	.require_force_probe = true,
> > +};
> > +
> > static const struct xe_device_desc adl_s_desc = {
> > 	.graphics = &graphics_xelp,
> > 	.media = &media_xem,
> > @@ -301,6 +308,7 @@ static struct gmdid_map media_ip_map[] = {
> >  */
> > static const struct pci_device_id pciidlist[] = {
> > 	XE_TGL_IDS(INTEL_VGA_DEVICE, &tgl_desc),
> > +	XE_RKL_IDS(INTEL_VGA_DEVICE, &rkl_desc),
> > 	XE_ADLS_IDS(INTEL_VGA_DEVICE, &adl_s_desc),
> > 	XE_ADLP_IDS(INTEL_VGA_DEVICE, &adl_p_desc),
> > 	XE_DG1_IDS(INTEL_VGA_DEVICE, &dg1_desc),
> > -- 
> > 2.25.1
> > 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
