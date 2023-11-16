Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B58DC197A0
	for <intel-xe@archiver.kernel.org>; Thu, 16 Nov 2023 21:28:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C57B110E091;
	Thu, 16 Nov 2023 21:28:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F20BB10E091
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Nov 2023 21:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700170134; x=1731706134;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=pE6ysfPec2YivehIxYaRmOPj4NWcf63Gz0whvsC87Ho=;
 b=OEPVYlYZjkUbKTT1LLzmf4arMfD5phcSokfmymFLcmvUFzEOUWta37dD
 Z7Tb5nUNC3ynwdc0IpMZUopT7uJWjopYlQ5BWqHrZHVGMyRY3QGGgAGqc
 ilJOjwrFmN81GyOcQ8j++CuWwipzC5jBFWgLyYPLzW3D2b46hiNlUVbEl
 AE02hmwXDzSXkPoDVL/1WKypLJXRhkU2loN8h4dFA6xqrcFr5kaAitxrG
 Nf4tDah8cLQo/j5eO1goM+VlMMmwMttteS0ERvw+Xgsldl1BvrGIsC0rL
 mbH1IqBUllecbV0jAOPV0Sa1nAHVHCok4IgueRCyT/sMqaBnabj1xDSOs g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="422284634"
X-IronPort-AV: E=Sophos;i="6.04,205,1695711600"; d="scan'208";a="422284634"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 13:28:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="856133152"
X-IronPort-AV: E=Sophos;i="6.04,205,1695711600"; d="scan'208";a="856133152"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Nov 2023 13:28:30 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 16 Nov 2023 13:28:30 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 16 Nov 2023 13:28:30 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 16 Nov 2023 13:28:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gJyApgR7QzHKsSshKTlYa/UxtueevFsORgzkeE79gusjIroN8BWh51qynoeQ36/jfjs4GimdeuCsHDHsCbWnts0+DSwEepNzHGTVmaqRVt/rf3/R0QpCVUaUt58dl42yviLcA778hqE0GSM0yU2ocK60nBEIP2BZbd+cp2cBlPEsTfttYoA3jFD++OBgqsbqQ1G2ck3Z0IZuHwh0qGrvrUmveoFghxPKQlrcFZCz9tGH/3TpSawMJH975baJaOCpn4Lu8RjPAk+stqQQ0MrKtHsVbMfICLhsnRG2pHiMgNIqgjujlpdGo6UbmfKWQe2tOFD4+75jZ9MEDOfEYX0ioA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RsMsCqAClw9gl8UYVJpRhparBIpPMmujZ5uMpj9Omrk=;
 b=oVKZ3ly2aB1E5mqtf4/bMkkeIs+yx9+6uPccftmZLW4aYmb/OBGs6z1vF9D9IuwNmwLVZGv/3o05a0FJnB7FvkbsFAsvsmm/FVpHqVfNL4PJF0pr8v3TfydllOVoqd/ct8gzaSD8ww/QRWc/aDwv3YzO18MtfDVzVfrL8qAKWgd6Iku/ROewIQYbdwS/6+6jX43IHrORTDSIuUH1DWPav12Feu62hKBor1/Hz90GS8mLLz2UI3ey51sH4Fp5vegTIV0SWhHw2lGXCeaqnCNnmDuogh380h3gL3q2/aStO0dhifs+LT2S4Sqau5SxfA++DfBCbHom3aUZlPMZrbdQBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH7PR11MB5819.namprd11.prod.outlook.com (2603:10b6:510:13b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.29; Thu, 16 Nov
 2023 21:28:26 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0%7]) with mapi id 15.20.7002.021; Thu, 16 Nov 2023
 21:28:26 +0000
Date: Thu, 16 Nov 2023 13:28:24 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <20231116212824.GT1327160@mdroper-desk1.amr.corp.intel.com>
References: <20231116144316.7-1-francois.dugast@intel.com>
 <20231116144316.7-7-francois.dugast@intel.com>
 <b53c6f92cafa55a32d2315dfabc4698b6cea17ac.camel@intel.com>
 <ZVaB/d2fR0GBje3T@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZVaB/d2fR0GBje3T@intel.com>
X-ClientProxiedBy: SJ0PR03CA0337.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::12) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH7PR11MB5819:EE_
X-MS-Office365-Filtering-Correlation-Id: 689ebab7-b85a-449f-d5a1-08dbe6eaf848
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WN0RcVA+A/I27/RTlJVpPN/wif10kPHRIGnvj+htIpxGuwsltYa70Qq3+faa20AF43Eja83POjLhC7eSASczfw7L4/e3GrVtPkM2K/FExSOuPRIULi70Wu874rshNUuJdUZuz+XZjucKxfW5ms+AO/xIPI80c9zLnw7GlrFj2h3QvOl+VHZ36Ld5h9gEgTzfKDPKRM5y+3WmdBrfwVP+1XckLExDpJSImNKwXO+bSxg9D912dUGRo8PZBwQnRYB/rHurySn9BbBmJNQhiUq7SeVsywqVyB4CyKYYVYzKfceXBwtpFr9Jl/XZG97HwX9XHt24Qg3IVk+8bIEl5mFgyk7MSXbWo0xHBgXAqqAIyhIl4snCqbV1wcZk/+sY7m+q8QU/MuMhxOtQcvpZHhSJ2rz3QUwqH9W1uRYD1mIHsXyVYfvsEmJfCEJ3vbN30WwrtqHSTYe46xjP8LNt5q5ekUJv6tU2k8p/agS4SDrHSoRkWIaH2SJ9uFx5QSR8ieYVKu0nDuSiZZEl2NSfUvaTLzbIuKxPFqvKsnTJ0VwG7FBdfiimwngjOzlGTitNI5tVGqdidB9Gq0aHU2tvIRCR595Xcn+1AKUo9RoiNBVq20o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(396003)(136003)(39860400002)(376002)(230922051799003)(451199024)(186009)(64100799003)(1800799009)(41300700001)(4001150100001)(966005)(6506007)(2906002)(54906003)(6862004)(8936002)(4326008)(8676002)(6512007)(316002)(66946007)(66476007)(6486002)(33656002)(6636002)(86362001)(478600001)(26005)(1076003)(83380400001)(38100700002)(82960400001)(5660300002)(66556008)(43043002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WPKLtb9w7FQqtFPqkhfTLGIetIZZceYm8GJyGXccaF8ZVcx5qJMntAJiTgee?=
 =?us-ascii?Q?FZeyalwypWo0rDFRmKb6gNL13LysRakTvmLVKMWS//m2XpV11T+iosP/e+qB?=
 =?us-ascii?Q?EE9KdVoI6C6ktB9DARWN0q3k4drOD3ceP4WC2XvDvevWKA21ENwMTCw7zVB0?=
 =?us-ascii?Q?WvLfXktbv87bLPZH6DTHB5hifvAj2ROs7davHeZSy7q6ZZzr6jAka0ybnZ4P?=
 =?us-ascii?Q?yFMunu3twvAGjcIo/8r7ipxgEYUqJBMm0R0KgdwgUscVys4YMR/+UuayqSQh?=
 =?us-ascii?Q?7P00eQGVNkSDF6NqDTDq9StgBkNt5iestKuZhnS6U8iN188Z2MaQndTbdd95?=
 =?us-ascii?Q?3DcEceKHCJFI2ydorCsi/im3mXHqO1wktWjByo1rMWf+hl5HkKo1VGoVOeb8?=
 =?us-ascii?Q?d7lHpluATBujuV1WdYTyI6g7ZDr0ghBK8Rts8maopXyae0XvqRwCsdRMf8YO?=
 =?us-ascii?Q?DQpZo/DW8NakoAqbCSfmSs+DHGMOjNFUQXL09XSc5WXfGdYwVTwGEzJ8t6/+?=
 =?us-ascii?Q?C4yo+FqDWQK/++pXPxDZs0rwxgmkZpIW1DqMHmCa+qBPAEVtT2QwU6mWADl7?=
 =?us-ascii?Q?HSecR+yr8rpqkIwjCn23rqbsR7rDFGA+W2kISJFtQNEyOrHmRVwb0PUmklTP?=
 =?us-ascii?Q?giMPeGYFtgwz2rW9b8e+IteBuBU/SJvJeyzMPrXy82UzgKqV96A617cwJJ8b?=
 =?us-ascii?Q?QG7DJ/859f5BpASgWAx7kBDMEeCkh7RCjvqb2Xh9aAVdNglVas3/Vp+Y2kB6?=
 =?us-ascii?Q?5UewYshOoZLLz4n7y2PuLq8Ij43fsNC7Mrk613IMEhxDFjjOPjbd9yxH+Axj?=
 =?us-ascii?Q?W9+a5g6iH7yehSBHKm1DfGTcQB3BL/TG/OUWYwwTe6VmzzgaRTLyOBp1WXic?=
 =?us-ascii?Q?B+A3uolqbUVcFe5pgePoiw65ojNMrDH7vWlATiNDCsYR0OaiOYzrBmhMgrL9?=
 =?us-ascii?Q?dkFKFevZNpGuaSV4nr7ae+EMSrsK4Nvnayz4ts7Oe6GTuR9bWG19SbLy23dm?=
 =?us-ascii?Q?hOmD+wZ979ctf2W6f7I3yRk6dGENZIF6FEJG+1lla0u1+1tapDBmTJVGbY38?=
 =?us-ascii?Q?nMS5V1+FK1kFlFqL0EsTz21GTnKZo1pdlbyF0fHkBmoPWoaWmfyJJnCDrGph?=
 =?us-ascii?Q?eWwDrD+xrCwHfOkKLBXX3uRCeWJP9fuma9x1slQxhJIgihn4WS51LAn9E1eW?=
 =?us-ascii?Q?QDcdRG+ph8BL09E7VtgyqLm+Oa2DHkCheTs9wLd24x4qJKm4TYvxk3R8UR5H?=
 =?us-ascii?Q?1bcNmCcBv/JNjJ4bfpD0fBzF1q5pxP2H7knQUyjN3FBLAm/bMpD0CdZoz2lS?=
 =?us-ascii?Q?15Dju9GGObdka+WQ2Is1wqZcLKnL8l8bkmrsw5zm9zdaC2NodedZtZS+EJ1h?=
 =?us-ascii?Q?4oy9P8VInteOu7c/zy82jPhKNrcV8hxgl4c0cuJJeRubWTI8b9WMWUXkrriG?=
 =?us-ascii?Q?uDN3+AgMwymY7JTPEzwHTv8A15RHetS3m+ft096EWLW/VsRsd7HgQ/9/W4MU?=
 =?us-ascii?Q?f4lErq3juhHE3913bKtuzziFFQpDsZ2hs1iyHjuemlagn1kpLnuJBw6sVKbd?=
 =?us-ascii?Q?LUlLI16p1GPWolbNRAHPQjN1TR4lHpvb3y1YMnFHoZrCQU84VfyaOIYo2TrZ?=
 =?us-ascii?Q?MQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 689ebab7-b85a-449f-d5a1-08dbe6eaf848
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2023 21:28:26.8038 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uB81cV5r9yj4t+H7IkKGLaIm4TqKByoqqkwYJpVKVOubS78AFBpkIcNMVOYMQZref8u7E9H0V8RUKBipgFZc9kZdNdkpfkPtMRLth84E9Kg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5819
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v1 6/8] drm/xe/uapi: Align on a common way to
 return arrays (gt)
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
Cc: "Dugast, Francois" <francois.dugast@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Nov 16, 2023 at 03:56:29PM -0500, Rodrigo Vivi wrote:
> On Thu, Nov 16, 2023 at 08:40:26PM +0000, Souza, Jose wrote:
> > On Thu, 2023-11-16 at 14:43 +0000, Francois Dugast wrote:
> > > The uAPI provides queries which return arrays of elements. As of now
> > > the format used in the struct is different depending on which element
> > > is queried. Fix this for gt by applying the pattern below:
> > > 
> > >     struct drm_xe_query_X {
> > >        __u32 num_X;
> > >        struct drm_xe_X Xs[];
> > >        ...
> > >     }
> > > 
> > > However, strictly following this rule would bring back the name "gts"
> > > which is avoided as per commit ("drm/xe/uapi: Rename gts to gt_list")
> > > so leave exceptions in the case of gt with num_gt (singular) and
> > > "gt_list". Also, this change removes "query" in the name of struct
> > > drm_xe_query_gt as it is not returned from the query IOCTL. There is
> > > no functional change.
> > > 
> > > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_query.c |  8 ++++----
> > >  include/uapi/drm/xe_drm.h     | 18 +++++++++---------
> > >  2 files changed, 13 insertions(+), 13 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> > > index b31e00bd29bc..5756d8eaf972 100644
> > > --- a/drivers/gpu/drm/xe/xe_query.c
> > > +++ b/drivers/gpu/drm/xe/xe_query.c
> > > @@ -353,11 +353,11 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
> > >  static int query_gt_list(struct xe_device *xe, struct drm_xe_device_query *query)
> > >  {
> > >  	struct xe_gt *gt;
> > > -	size_t size = sizeof(struct drm_xe_query_gt_list) +
> > > -		xe->info.gt_count * sizeof(struct drm_xe_query_gt);
> > > -	struct drm_xe_query_gt_list __user *query_ptr =
> > > +	size_t size = sizeof(struct drm_xe_query_gt) +
> > > +		xe->info.gt_count * sizeof(struct drm_xe_gt);
> > > +	struct drm_xe_query_gt __user *query_ptr =
> > >  		u64_to_user_ptr(query->data);
> > > -	struct drm_xe_query_gt_list *gt_list;
> > > +	struct drm_xe_query_gt *gt_list;
> > >  	u8 id;
> > >  
> > >  	if (query->size == 0) {
> > > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > > index f54e545cc4fb..fa4f554b5264 100644
> > > --- a/include/uapi/drm/xe_drm.h
> > > +++ b/include/uapi/drm/xe_drm.h
> > > @@ -356,14 +356,14 @@ struct drm_xe_query_config {
> > >  };
> > >  
> > >  /**
> > > - * struct drm_xe_query_gt - describe an individual GT.
> > > + * struct drm_xe_gt - describe an individual GT.
> > >   *
> > > - * To be used with drm_xe_query_gt_list, which will return a list with all the
> > > + * To be used with drm_xe_query_gt, which will return a list with all the
> > >   * existing GT individual descriptions.
> > >   * Graphics Technology (GT) is a subset of a GPU/tile that is responsible for
> > >   * implementing graphics and/or media operations.
> > >   */
> > > -struct drm_xe_query_gt {
> > > +struct drm_xe_gt {
> > >  #define DRM_XE_QUERY_GT_TYPE_MAIN		0
> > >  #define DRM_XE_QUERY_GT_TYPE_MEDIA		1
> > >  	/** @type: GT type: Main or Media */
> > > @@ -390,19 +390,19 @@ struct drm_xe_query_gt {
> > >  };
> > >  
> > >  /**
> > > - * struct drm_xe_query_gt_list - A list with GT description items.
> > > + * struct drm_xe_query_gt - A list with GT description items.
> > >   *
> > >   * If a query is made with a struct drm_xe_device_query where .query
> > > - * is equal to DRM_XE_DEVICE_QUERY_GT_LIST, then the reply uses struct
> > > - * drm_xe_query_gt_list in .data.
> > > + * is equal to DRM_XE_DEVICE_QUERY_GT, then the reply uses struct
> > > + * drm_xe_query_gt in .data.
> > >   */
> > > -struct drm_xe_query_gt_list {
> > > +struct drm_xe_query_gt {
> > 
> > In my opinion it should be drm_xe_query_gts or keep drm_xe_query_gt_list
> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> 
> I honestly prefer gts better to align better with the plural of
> everything else. But Matt's point is that a plural of an acronym
> looks another acronym and people might ask what is "gee-tee-ess"?
> 
> so, I like Francois attempt to align them all in a consistent way.
> But maybe we need to keep plural everywhere and accept "gts"?

When we were first upstreaming multi-GT stuff for i915, there was some
pretty firm push-back on the "gts" usage that we had in the original
patches.  I think the discussion was kicked off on the mailing list by
Jani here:  https://lore.kernel.org/intel-gfx/87pmrqj3va.fsf@intel.com/
but I believe there was some followup discussion and agreement with more
people on IRC that we should try to avoid the potentially ambiguous
plural "gts."

Personally I find having "query [singular] foo" return a list of foos
somewhat surprising, and would have expected something more like
"drm_xe_query_foo_list" or "drm_xe_query_each_foo."  But I don't really
have strong feelings about it; since this is uapi, whatever the
userspace guys think is most understandable is fine with me.


Matt

> 
> > 
> > >  	/** @num_gt: number of GT items returned in gt_list */
> > >  	__u32 num_gt;
> > >  	/** @pad: MBZ */
> > >  	__u32 pad;
> > >  	/** @gt_list: The GT list returned for this device */
> > > -	struct drm_xe_query_gt gt_list[];
> > > +	struct drm_xe_gt gt_list[];
> > >  };
> > >  
> > >  /**
> > > @@ -495,7 +495,7 @@ struct drm_xe_device_query {
> > >  #define DRM_XE_DEVICE_QUERY_ENGINES		0
> > >  #define DRM_XE_DEVICE_QUERY_MEM_REGION		1
> > >  #define DRM_XE_DEVICE_QUERY_CONFIG		2
> > > -#define DRM_XE_DEVICE_QUERY_GT_LIST		3
> > > +#define DRM_XE_DEVICE_QUERY_GT			3
> > >  #define DRM_XE_DEVICE_QUERY_HWCONFIG		4
> > >  #define DRM_XE_DEVICE_QUERY_GT_TOPOLOGY		5
> > >  #define DRM_XE_DEVICE_QUERY_ENGINE_CYCLES	6
> > 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
