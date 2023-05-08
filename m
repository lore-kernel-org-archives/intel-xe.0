Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05AAEC77B75
	for <intel-xe@archiver.kernel.org>; Mon,  8 May 2023 21:29:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAC7110E307;
	Mon,  8 May 2023 21:29:51 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E04610E307
 for <intel-xe@lists.freedesktop.org>; Mon,  8 May 2023 21:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683581389; x=1715117389;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=NBDuBAFASkrwj5FFExBxnHEBPWUy4KSYJiQpe7JBioE=;
 b=aggV5+9bYRKv51qEDbO98See7VtNTPzEO0WiR1QHfb9wkBM2+2KsHmUY
 3rD0PYoPqrc/2CYzxAuUdg1uMB/dKFrNG2sPnARR9xKoi2estu1ilav+D
 kP10aaJfHd8LXK8O/QwIasKR3bZbcH80bQuMCSyyESKTL9e2Q2jyPTfwZ
 Ulqf5DIc/Jby76YvySBx7mbx7UvoO9w3/HYeN23jOBwZ0vqRSRoRqaMG+
 yXhzqVMTROjVN0odMClHEKuZfdNGLO/wrJapvV2tvpNddzvj3kA5Sbumv
 lWqZCLCP6CbCRaUC8B7JyEvN440BT0N0t4xlZ2r/vHZ73w2420dhQnNOR w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="329383133"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="329383133"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 14:29:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="763551952"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="763551952"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga008.fm.intel.com with ESMTP; 08 May 2023 14:29:48 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 8 May 2023 14:29:48 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 8 May 2023 14:29:47 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 8 May 2023 14:29:47 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 8 May 2023 14:29:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ROIQev5BGQUGLFhClgCObKFeXa5c2MvUUtQpmbRfhWZKk3L+ddyot7SxQ/ZHGPBEPbNHgVgk38qIj5NnN8FdgNwLCL7Z+y09qz1+hfvPMn1qcgq/3fvDbBu0iDVi+tExS9wQZgdeDLkYuTn2LCt5jzH0T5/9xZIUA5BTdllCseA6yMVD4EJKEwOEAViFBcHtV0pIlO1c/kNdZeAx68qC5MibdCU3uQz3HHI9CBZLr+Vzc0/mctXrYbEbyPbyY5Q2uyndZ8TH96sgqhthSmzYLHut+IQmaKG6iYrYou4NDIBWF59zpY0a4cOzoMKQpOl9v/Gyjc3vIKhvV9gupssbcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KyNNtQPHBXOL21ROp6OI72+6SlEbjlMUym/xhr3ZXwI=;
 b=XoPAimVn9Q0wj/0IB/+fxdeOMssTAzpxfKs6nQoijBWKvBxt87Gvx2lx8NjGUWhHIs5aoFBvT5pdsQHC4TkkUcK2m6HQphnpNSKs0gmRo3uTIWT+mxQd8faFDOPBagA8SNCBqsP1LC8/XnEjN0sa1WYlh+MXu1SuhqO4LbxLS5EaZymzL3gjNdAAOjG8f8FdD74GEmylogrQgQfB/nLZP4JUtGNMobv6amhmDaYT2gyzuZni717YGSkQM37TtjaWB5vWTNvzzojDCJnTi29hZu4ynd62up8gfCgPF485YDkatxxfIpHbTNUlGOeYtT8PD1MlSZp2gF37d1RT6mLlGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by BL1PR11MB6002.namprd11.prod.outlook.com (2603:10b6:208:386::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Mon, 8 May
 2023 21:29:45 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004%6]) with mapi id 15.20.6363.032; Mon, 8 May 2023
 21:29:45 +0000
Date: Mon, 8 May 2023 17:29:40 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <ZFlpxCMh4S32Rlmm@intel.com>
References: <20230502001727.3211096-1-matthew.brost@intel.com>
 <20230502001727.3211096-29-matthew.brost@intel.com>
 <ZFVcU5VPibAp/Umi@rdvivi-mobl4>
 <ZFhONAGmO8X+qD1f@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZFhONAGmO8X+qD1f@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: BY3PR05CA0036.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::11) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|BL1PR11MB6002:EE_
X-MS-Office365-Filtering-Correlation-Id: c97d8631-a99d-44c3-51f0-08db500b5785
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eyldL5OkH5skCS+S2wj4GHur+nrP4ft/ez4XGTvTas2zcFctMW+Tz3b4NE2DX8qm7rGdiAeCkaAX5oWmmi+oDVp3YQn/IiV0mUnQ2OeaXOczlQ7RUOKvQk7l1IJVwGiPKjb7Sepv0NOgwD9p6ORPpcufDAT/VKq9g6O9SRC8CXv0hcE8Gd4SuG+vC1dYB0m9EmkXzyVe5M8NIEmrUNYIDDVn9uideokhcS3SswFk1xN9aGd3bUwzmqFM9/j+M2Em05e36jIaKMAb/4OSOi6qiuHN20q93pa8oOhm2o5izDMKMfSADlxgwIGGpoGtgknkczUIrXG0pnZLOoA/4G3OvqjjQ+168kpdz2RAzHr8rqDQVVsiglbEFT+Dk9x3oBHnNgP21Eo47Rvk+ejT1uS12qXPSkgX2oH7GK9v9CxZ7EenN1SlUSuRcqK5d2ckeeWuBLiOdoN6KuFZ3zIcUpHTQIQ8+/yBSLxSCwWnBDSclRpX3tYqoNMYmz32hVX4CIxgaKSXGNPPwjGQ8WFkUHrBT+Py/aIxwkUkz5fy6O0mhI2oqpvVfCNHbfMBTpCt4MIl
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(396003)(39860400002)(376002)(366004)(136003)(451199021)(36756003)(66476007)(37006003)(66946007)(316002)(4326008)(6636002)(66556008)(478600001)(6486002)(86362001)(5660300002)(2906002)(8936002)(8676002)(6862004)(41300700001)(186003)(44832011)(38100700002)(82960400001)(2616005)(26005)(6512007)(6506007)(83380400001)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pSYT62bLntyf9Gv5+G4i4jkd1xSO+jWwDWHWXgB4w520vrlinfGDRbQZo4XM?=
 =?us-ascii?Q?9yd/RM9hynzT4QXGXDclOO9fmBcxcm5M0PdP9+J6QMIpyDGHItC87qfAOCZJ?=
 =?us-ascii?Q?87e+nfpV8iCo5oUv6TxCGMpyWlxPXi1PZst92yOPd5P/DImAdODWbi3HT/Tg?=
 =?us-ascii?Q?+c28jcZ4H23uhQmsTybX+EZ+V9wg/PYrCfHjuRKHbaYTHSx/XGwzKIrMRPAT?=
 =?us-ascii?Q?Zaxd7y+PaN0/aOtpJlTBgTZUUTSPm8P47AvzoJecanKqn5gnXEaeMA5tUb+J?=
 =?us-ascii?Q?i3g6kxEN6Ozh3aHcmmYBAAYmOA8D+QfXxEg5czftYrkaKRDFxy19oZilWudk?=
 =?us-ascii?Q?l0CI9FY8+FheM6G+QoaVBpTXaYEETtXfge7ZgJKl66PmHceS9bIMvhTZ7U6h?=
 =?us-ascii?Q?dHL84tgy6ZSD5vptQAREMhGTsf5RrtopavS7OVeYKsEq54ZD0kmh2kzsmqFE?=
 =?us-ascii?Q?KvtPPPEds7o6YsbELNpi4MlvPzT/qdpUfU8VCkNixU6Ajk9wgDmDdd425Lks?=
 =?us-ascii?Q?do84NqZFqWHz1Y+lLKptL1ali8VUzk7FB3bAuv5PVS2GRd1B98I7r3SUYLbc?=
 =?us-ascii?Q?XEolA54kTmq/ns2gKClBzgjRNQqDckiuadCSpwGdeZoOfvIl6/cEhvk1CSvA?=
 =?us-ascii?Q?QW0P7lVskSIyjTv3UDWRYek0t6hk9p9AYjr92S5tPTO2aE9qDYYxWXEawGJx?=
 =?us-ascii?Q?JkiMWsuQ3p+H2HoUMku3HROU+bIj2SnA1ybGwGwLBI005EqPHGgaCgoupxr0?=
 =?us-ascii?Q?wD+juyho6+gppQTdbB7HQfsSGheaKPyFRKsKSy6uf2LLeq8F12d/SaMO//DZ?=
 =?us-ascii?Q?qHVNXbm5SGcLFm/45RVaByV0qC03MD2hwq4aO7R0eAqEPgH6wMdtAastD+Of?=
 =?us-ascii?Q?sHuKgLdY6Nala0BgXm2vBtwWA5tAaVY8o1phfdlXwBkjKipVey5O+tTqYfmg?=
 =?us-ascii?Q?3/MJrd0HwQPMMJ1ONN1XD95mjmC6Y63YZesm9PDNpn+8sGwZDvHE4DY1wHBO?=
 =?us-ascii?Q?IsRnU1vLJcT7Z/B3l1V3kNsrj/Qnytapujg6hDo7V3la+pE+wsxR4YoLe29P?=
 =?us-ascii?Q?wuk3TG06KOt/+9xmlDr4OCM4Au9GmuziWfD/mINdFs+kDf8GtU3yzydpv3XQ?=
 =?us-ascii?Q?6FrLCMoyaXqQRXg1Wb2sBHAGTSc1awGVebAl+5zn94apsfeVC3vFzY2byJsf?=
 =?us-ascii?Q?f99q+kBSQztBoA6/7e8p/7PrSuR1vwKBF/e2Htjp3C+pHFMXyNjaJaisf2e0?=
 =?us-ascii?Q?2uXtSz2Pi8+WcTFH+/606EYiGRsUZW62hXyC6i8tr240HDmKd7MjTmS3aGJK?=
 =?us-ascii?Q?CEnDJZ2D2ap6tBEPvy371GxsErJHSBaMrelaW0aTJEA0fzivEydAL8OmNsFs?=
 =?us-ascii?Q?unSniwRRD/nuXB03nrERPUDadp/4Yq+JDNTpBdgEishRi7ZsgWC8RLKfBd1T?=
 =?us-ascii?Q?+bB1ZlwJuZWRf+5F+Dye+zE/WMepl6W5I3jgQrfTmk0nir0P1upjr7z1xSTf?=
 =?us-ascii?Q?ysjfW9NnpOiJrz9XPWuNuUCiXCLkrvSQW256CrhOnVx+kdJ+/5shVkbhbTNO?=
 =?us-ascii?Q?1XDtbzxMl+wgPbreg6dTC2qw1wMB67cG8TDl0PMH9z8f1ILtPRX8NgZHyOrR?=
 =?us-ascii?Q?5Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c97d8631-a99d-44c3-51f0-08db500b5785
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 21:29:44.9404 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bPxK+VIxLvsIumtncX8/xQxjV6Pjbd8vIKIGCQlfJuaCuw4jBi6ZOCS6ccJijImnjB4tUSrSbc9BYPNLSvRu4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6002
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 28/31] drm/xe: Allow dma-fences as
 in-syncs for compute / faulting VM
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
Cc: Rodrigo Vivi <rodrigo.vivi@kernel.org>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, May 08, 2023 at 01:19:48AM +0000, Matthew Brost wrote:
> On Fri, May 05, 2023 at 03:43:15PM -0400, Rodrigo Vivi wrote:
> > On Mon, May 01, 2023 at 05:17:24PM -0700, Matthew Brost wrote:
> > > This is allowed per the dma-fencing rules.
> > 
> > it would be good a word saying 'why' we are doing this.
> > only because we can it doesn't mean we should...
> > 
> 
> This is allowed and encouraged the dma-fencing rule. This along with
> allowing compute VMs to export dma-fences on binds will result in a
> simpler compute UMD.
> 
> Sound ok?

makes sense. with that

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>


> 
> Matt
>   
> > > 
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_sync.c | 12 +++++++-----
> > >  1 file changed, 7 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
> > > index 99f1ed87196d..1e4e4acb2c4a 100644
> > > --- a/drivers/gpu/drm/xe/xe_sync.c
> > > +++ b/drivers/gpu/drm/xe/xe_sync.c
> > > @@ -105,6 +105,7 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
> > >  {
> > >  	struct drm_xe_sync sync_in;
> > >  	int err;
> > > +	bool signal;
> > >  
> > >  	if (copy_from_user(&sync_in, sync_user, sizeof(*sync_user)))
> > >  		return -EFAULT;
> > > @@ -113,9 +114,10 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
> > >  			 ~(SYNC_FLAGS_TYPE_MASK | DRM_XE_SYNC_SIGNAL)))
> > >  		return -EINVAL;
> > >  
> > > +	signal = sync_in.flags & DRM_XE_SYNC_SIGNAL;
> > >  	switch (sync_in.flags & SYNC_FLAGS_TYPE_MASK) {
> > >  	case DRM_XE_SYNC_SYNCOBJ:
> > > -		if (XE_IOCTL_ERR(xe, no_dma_fences))
> > > +		if (XE_IOCTL_ERR(xe, no_dma_fences && signal))
> > >  			return -ENOTSUPP;
> > >  
> > >  		if (XE_IOCTL_ERR(xe, upper_32_bits(sync_in.addr)))
> > > @@ -125,7 +127,7 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
> > >  		if (XE_IOCTL_ERR(xe, !sync->syncobj))
> > >  			return -ENOENT;
> > >  
> > > -		if (!(sync_in.flags & DRM_XE_SYNC_SIGNAL)) {
> > > +		if (!signal) {
> > >  			sync->fence = drm_syncobj_fence_get(sync->syncobj);
> > >  			if (XE_IOCTL_ERR(xe, !sync->fence))
> > >  				return -EINVAL;
> > > @@ -133,7 +135,7 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
> > >  		break;
> > >  
> > >  	case DRM_XE_SYNC_TIMELINE_SYNCOBJ:
> > > -		if (XE_IOCTL_ERR(xe, no_dma_fences))
> > > +		if (XE_IOCTL_ERR(xe, no_dma_fences && signal))
> > >  			return -ENOTSUPP;
> > >  
> > >  		if (XE_IOCTL_ERR(xe, upper_32_bits(sync_in.addr)))
> > > @@ -146,7 +148,7 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
> > >  		if (XE_IOCTL_ERR(xe, !sync->syncobj))
> > >  			return -ENOENT;
> > >  
> > > -		if (sync_in.flags & DRM_XE_SYNC_SIGNAL) {
> > > +		if (signal) {
> > >  			sync->chain_fence = dma_fence_chain_alloc();
> > >  			if (!sync->chain_fence)
> > >  				return -ENOMEM;
> > > @@ -168,7 +170,7 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
> > >  		break;
> > >  
> > >  	case DRM_XE_SYNC_USER_FENCE:
> > > -		if (XE_IOCTL_ERR(xe, !(sync_in.flags & DRM_XE_SYNC_SIGNAL)))
> > > +		if (XE_IOCTL_ERR(xe, !signal))
> > >  			return -ENOTSUPP;
> > >  
> > >  		if (XE_IOCTL_ERR(xe, sync_in.addr & 0x7))
> > > -- 
> > > 2.34.1
> > > 
