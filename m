Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C68F9C07CB1
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 12:33:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94CB610E1C8;
	Wed, 29 Nov 2023 12:33:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E26F910E1C7
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 12:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701261219; x=1732797219;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=icnyf6tt1pplF+PWfbWdU//6IQfcN59EzATByFG9ZNk=;
 b=lzQRyluMk2clVxmDKF39i6aZipPKtW76de7yTsI2MOF2YnaumURYbbQE
 wMX4OrcWWv2GlHL2B5A/Q7JHFH07Uj+kau/IKOGaRgdOIU9PNMHLnR6rC
 GU0fsdpW3RHCSYAm2jKJHcY3Qt8XhPWVoxVUTTEBRZYc1C99psdn0uSon
 eGn2ZEK9giuvCbtn3vmGlpB29KW0puRqU8/le3wBsGvwI/JuJIdftbth9
 hsNGNOosdFg1uev1T7/QFU79WvUAOr3XR8mFg7hu3iyGsVc5rVVY7W6B1
 ot/JQxzMCnL8fTmD5sZwu8qeHTGbHCkUdP8u6+TpwYbatChJf62xx94+c w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="459652951"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; d="scan'208";a="459652951"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 04:33:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="1100516984"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; d="scan'208";a="1100516984"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Nov 2023 04:33:38 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 04:33:37 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 04:33:37 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 29 Nov 2023 04:33:31 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 29 Nov 2023 04:33:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OJDyBHQo7BDSCVva1IO5dJkqwo+B35gU9BennRH7+4JeoblWJ3YhMrIwp5aXW7tZFkwYtAGBFJI4aGt/ab7E3dpzIjla31OYXp//z+mvMay7489Z9ENzr0/LtP3rAnRh4X0aCPDV30xEfEzgFuA2Np+RCqZheMoMwyNt7egqIn+0xM6dkiBtv+8qlyLdTt+Ae9+IsJvIkEawaRqtvY3kACwy1GHXZ85sX15aMpnLBQS3PXcCJMxDzYNFSvA7J/PP8bgxD7sfwklku/+u87UC/4KbBIUFPsasMRYpcqxQOW9Kaz7PMT6B0ObIKhxNcKDeSiKZROWM1tjCUZmcokb25g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1s7ZbX3OF3zoR5jell0bIncYT3kZFsJgZ/kk+bACyjg=;
 b=CtYji4IB+Q7MYLsRYwOWiaNwiQI+9olHomPbV56JqZpF1IicIHL087zHX0ljXkXG7PWY711522UhgXapIkAwVnHJ6ISDqECJ6CfdoSAvOFTXdpFd0GIK6ds1finYe7VaAf/HRv6AFvpgDhlG3ueKvgONCEmYZeL7pW/Xpk/Emm2Tl5fiGSqYgTX2NGAuy1t/CB2p/FFHqlfYDeBqkPcbRMMIqoB6z5Fk0gFh+blh+jO8yp0YPp7msgSrp8Y7Gst7y5iRe1TDvHOA1Ej+qZ2p2i0N/h+dL0G8edzLT2oprjGhFaw1LfBR9SQ9x9JCiY6fLQLJ/Y1Jh7UZLTA+EVehLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by MW3PR11MB4618.namprd11.prod.outlook.com (2603:10b6:303:5f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Wed, 29 Nov
 2023 12:33:24 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::3514:49a8:468c:a3d4]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::3514:49a8:468c:a3d4%7]) with mapi id 15.20.7025.022; Wed, 29 Nov 2023
 12:33:24 +0000
Date: Wed, 29 Nov 2023 13:33:18 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <ZWcvjtdKOLXPadR6@fdugast-desk.home>
References: <20231122143833.7-1-francois.dugast@intel.com>
 <20231122143833.7-6-francois.dugast@intel.com>
 <3c34b03bd2bab567ca6891b095332a2f2b4ddc29.camel@intel.com>
 <ZWZSwQXvcAB5v9fW@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZWZSwQXvcAB5v9fW@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DB8P191CA0005.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:130::15) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|MW3PR11MB4618:EE_
X-MS-Office365-Filtering-Correlation-Id: 08f8d8ce-e429-4353-fc6c-08dbf0d76113
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /frm2HHfqULqJIMEhXxd8Y+6HuJ9k+Ry11ZsQTzETAzszs1Hk5Nb21vTSbMzOB23zA3iiCbgNy1ZoWYoRSRLdeL3IBDF4AXx5V5+G6pjNjo/rWWkzOQR6SrGNITOy97V8E8TURZBCko9ih16xDw2mbz4PUTLT7xJV5rXcz4lVnx1Zz6BilejjUwxEUhDv2eVlH9YjTKlsRx5qwLciw0hzApctKfOD08PpKfvt7TBxpdr69uiFJ7LC8xsdbTMIJCBmFL0NwIxKdHMIulJmZNQAkOX2wp8oE5WK5rvbM16JFGofGYogahhF72AtpI/A35JcjON1ie3xG622Gdt5jVkyk8JkkhUDH/EO86qjS/8zQuB6c8MFfVpEmCGP2LPQDkHOTiyQtjRvn7sbmGZGWkK2T3fgo4YHY2rA2Je8K/33uEdac++pFmIMtz4JY60tyw99sJTspdSPf+I1IMyz2PNvooropEQg5wY282MnaiPueSpjntomQYSDHpHCFjtMnGMyFZpTEvg+DYOVMo/jb9FvUHZtNbk5oeZQw/e0flMU3sxF7Zs24rS+NPTaaLbj/xoCVRyaArcEOqyG0Y22uawuy0NbewiuxKdqiE9bgqIeG4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(376002)(136003)(396003)(366004)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(26005)(9686003)(36916002)(6512007)(6506007)(478600001)(8676002)(82960400001)(6862004)(8936002)(5660300002)(44832011)(86362001)(4326008)(6486002)(66556008)(316002)(66476007)(54906003)(66946007)(6636002)(38100700002)(83380400001)(6666004)(2906002)(41300700001)(36756003)(4001150100001)(43043002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?kDSSbQq5qkKa8YHNE5vJtx6YTXiSiYZQ3P2VoBU15g7Q78zNNXzlNUhkwS?=
 =?iso-8859-1?Q?/TZ3wquCEaoM6UoMeEz2+z39rmUXmZqowcvnXAu6v2GeLmacP5zWokpukZ?=
 =?iso-8859-1?Q?o2M8Ja0LnFXYOlCBjgFbpyEoMk/LTAs8hVT/BgXoOnZwc+IqEcbTC3mlZ3?=
 =?iso-8859-1?Q?KiSsjY+XmSfLjhcz+4CDYlYKikSQ8eWUp7YXGG3OVF6gaL5yFrAGZ5X4Fk?=
 =?iso-8859-1?Q?aeGlYxKMehP4r7qOq4dMjWCMOBoz9Qh8TueQo4yRM6Ux0+P0W5TgVUPWGv?=
 =?iso-8859-1?Q?wjoyHgFjGXD9IyJH8oPu9/c35pxE2M3lf7+ZjAEaCRVQehG2LqTldxlUO+?=
 =?iso-8859-1?Q?iucZO8dn9upgIP42NSBVFH8l3BALVbC+tILl1OD24wdPZ8K/T7KEz1OgXS?=
 =?iso-8859-1?Q?dzEmrYSgs1YtP68Du/on9ExCmG5FsFt3FhilIJ6NiXSE6/bZAD5/1K7vGX?=
 =?iso-8859-1?Q?gqdZuZ6omZogfWUSQfnXE++ivTkHbCEob54RWOEZf3INXEuTCAlFHsycPI?=
 =?iso-8859-1?Q?LV7PkheOXoiybBbTrVeQ2lJHY8Huk/joQkT04tdP6zwhudTSMs0CPNJLyl?=
 =?iso-8859-1?Q?tGw1bmeXzYzU9iroKTIfqCq++ZaixL9vc1trVtahZi/k5YxDnI281PVhNT?=
 =?iso-8859-1?Q?e7RSLwDTumQLdXFQk81syj51BQHVy6ojVnKqRZ01eVszF1appoAK6wZQ+4?=
 =?iso-8859-1?Q?IxrMhFC7gcfw7+8S/yzS73bsozZlzgse3DTOvwFQFtd3ntnjG/Kl6J27gA?=
 =?iso-8859-1?Q?gb4fyIuzBsB3VqkPC0pUboFtzw86L+No0qGf0Aq+LmKq0hFZc6XeEjRIoi?=
 =?iso-8859-1?Q?VHxewwmtjCqt+hd2SjLNJGVU7IbS3f5KWG6PI2Hg1ue5rRompfZzdslUF7?=
 =?iso-8859-1?Q?C+u8BaMlAGTNOZ40dLSLCpthpuojp3ZPIZrqN0Ph/LcjaCMnNWl+Dl67Sf?=
 =?iso-8859-1?Q?2o1bo7sJCqtv0fcUBNPKw5qMfzWu8iCPfXPmmfcrlkWJ7tC0UXmVKatoeP?=
 =?iso-8859-1?Q?Kkp7yxwLWdLIL8wDiecKQn7Rh9xFs208sHVlRfc8T8N6du0LxGIDNfsUzg?=
 =?iso-8859-1?Q?pNAYM/nR8ass2+5THAZUXK/vWsv90xMvU8cIks0iYz8yzy+oENXX3R9u2Y?=
 =?iso-8859-1?Q?6/ADFj7UxfKVWJMAStgoozBFJ8x1nDpXByEM1SyHYdWmvIyHsHmQ+N9CvG?=
 =?iso-8859-1?Q?N8IntPrwbBY/BmJ4mmf+fhKGU21shhh48d1LU4pXx2WSinktgAsI67emDF?=
 =?iso-8859-1?Q?Lxd8ecKwDKQ3Hbxr2ugR9InnckLsBHrT/x0A+disetw6BjcfAdPbT+KH45?=
 =?iso-8859-1?Q?Nk2bOd1Z0d26rrP78K+nmkcAVuY7bc1jUPbowYc/wYSmYUEt5a/UYlIqa8?=
 =?iso-8859-1?Q?9PIetnsFFSAe2jFYqT8Sq1LaexoVgjUS2O+LO4mzjbK+elx9mhsEp6D1Ww?=
 =?iso-8859-1?Q?1EiNxa3cRiFGM8IhCTJtvcv8jgpVjydtCC0/P97xoCdjUitZyYE42QYDRW?=
 =?iso-8859-1?Q?XRCcA3rBvw6egFvJkD0HNjk7JxMeiJeza8RF050hD0PnSjSyhuP6FW4sMb?=
 =?iso-8859-1?Q?XOUZ/vbpVr8JcIUiIUxYxgrzF1c1lWwcA1tugLjZOgES3ipEc+5NWHd25E?=
 =?iso-8859-1?Q?+kbSZsSgWcmpKt2huh0JBdELC0HPyMlxZAe10Z0sSz6pNITR0+C5utOw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 08f8d8ce-e429-4353-fc6c-08dbf0d76113
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 12:33:24.2572 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LDakN3AXQGRPgyKXulS8HnBudV1Puo4eGphFG9a6liNYDmQmUh4L6bfI5qURdUqaiargE4YS0cC2OqTd1dwMZHGBhN9ZdU7/zCYJVv6d+WY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4618
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 05/14] drm/xe/uapi: Align on a common way
 to return arrays (memory regions)
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Nov 28, 2023 at 03:51:13PM -0500, Rodrigo Vivi wrote:
> On Fri, Nov 24, 2023 at 06:19:47PM +0000, Souza, Jose wrote:
> > On Wed, 2023-11-22 at 14:38 +0000, Francois Dugast wrote:
> > > The uAPI provides queries which return arrays of elements. As of now
> > > the format used in the struct is different depending on which element
> > > is queried. Fix this for memory regions by applying the pattern below:
> > > 
> > >     struct drm_xe_query_Xs {
> > >        __u32 num_Xs;
> > >        struct drm_xe_X Xs[];
> > >        ...
> > >     }
> > > 
> > > This removes "query" in the name of struct drm_xe_query_mem_region
> > > as it is not returned from the query IOCTL. There is no functional
> > > change.
> > > 
> > > v2: Only rename drm_xe_query_mem_region to drm_xe_mem_region
> > >     (José Roberto de Souza)
> > > 
> > > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_query.c | 36 ++++++++++++++++++-----------------
> > >  include/uapi/drm/xe_drm.h     | 12 ++++++------
> > >  2 files changed, 25 insertions(+), 23 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> > > index 0cbfeaeb1330..f321ed4d3b0b 100644
> > > --- a/drivers/gpu/drm/xe/xe_query.c
> > > +++ b/drivers/gpu/drm/xe/xe_query.c
> > > @@ -240,11 +240,11 @@ static size_t calc_mem_regions_size(struct xe_device *xe)
> > >  		if (ttm_manager_type(&xe->ttm, i))
> > >  			num_managers++;
> > >  
> > > -	return offsetof(struct drm_xe_query_mem_regions, regions[num_managers]);
> > > +	return offsetof(struct drm_xe_query_mem_regions, mem_regions[num_managers]);
> > >  }
> > >  
> > >  static int query_mem_regions(struct xe_device *xe,
> > > -			     struct drm_xe_device_query *query)
> > > +			    struct drm_xe_device_query *query)
> > >  {
> > >  	size_t size = calc_mem_regions_size(xe);
> > >  	struct drm_xe_query_mem_regions *usage;
> > > @@ -265,36 +265,38 @@ static int query_mem_regions(struct xe_device *xe,
> > >  		return -ENOMEM;
> > >  
> > >  	man = ttm_manager_type(&xe->ttm, XE_PL_TT);
> > > -	usage->regions[0].mem_class = DRM_XE_MEM_REGION_CLASS_SYSMEM;
> > > -	usage->regions[0].instance = 0;
> > > -	usage->regions[0].min_page_size = PAGE_SIZE;
> > > -	usage->regions[0].total_size = man->size << PAGE_SHIFT;
> > > +	usage->mem_regions[0].mem_class = DRM_XE_MEM_REGION_CLASS_SYSMEM;
> > 
> > nit: can you also rename 'usage' to something else, it was named 'usage' because of the old query name.
> 
> my bad for having forgotten this 'usage' in here. Let's fix that in a follow-up after this series is merged.
> 
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Thanks, it is already fixed in the next revision.

Francois

> 
> > 
> > 
> > > +	usage->mem_regions[0].instance = 0;
> > > +	usage->mem_regions[0].min_page_size = PAGE_SIZE;
> > > +	usage->mem_regions[0].total_size = man->size << PAGE_SHIFT;
> > >  	if (perfmon_capable())
> > > -		usage->regions[0].used = ttm_resource_manager_usage(man);
> > > -	usage->num_regions = 1;
> > > +		usage->mem_regions[0].used = ttm_resource_manager_usage(man);
> > > +	usage->num_mem_regions = 1;
> > >  
> > >  	for (i = XE_PL_VRAM0; i <= XE_PL_VRAM1; ++i) {
> > >  		man = ttm_manager_type(&xe->ttm, i);
> > >  		if (man) {
> > > -			usage->regions[usage->num_regions].mem_class =
> > > +			usage->mem_regions[usage->num_mem_regions].mem_class =
> > >  				DRM_XE_MEM_REGION_CLASS_VRAM;
> > > -			usage->regions[usage->num_regions].instance =
> > > -				usage->num_regions;
> > > -			usage->regions[usage->num_regions].min_page_size =
> > > +			usage->mem_regions[usage->num_mem_regions].instance =
> > > +				usage->num_mem_regions;
> > > +			usage->mem_regions[usage->num_mem_regions].min_page_size =
> > >  				xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ?
> > >  				SZ_64K : PAGE_SIZE;
> > > -			usage->regions[usage->num_regions].total_size =
> > > +			usage->mem_regions[usage->num_mem_regions].total_size =
> > >  				man->size;
> > >  
> > >  			if (perfmon_capable()) {
> > >  				xe_ttm_vram_get_used(man,
> > > -						     &usage->regions[usage->num_regions].used,
> > > -						     &usage->regions[usage->num_regions].cpu_visible_used);
> > > +						     &usage->mem_regions
> > > +						     [usage->num_mem_regions].used,
> > > +						     &usage->mem_regions
> > > +						     [usage->num_mem_regions].cpu_visible_used);
> > >  			}
> > >  
> > > -			usage->regions[usage->num_regions].cpu_visible_size =
> > > +			usage->mem_regions[usage->num_mem_regions].cpu_visible_size =
> > >  				xe_ttm_vram_get_cpu_visible_size(man);
> > > -			usage->num_regions++;
> > > +			usage->num_mem_regions++;
> > >  		}
> > >  	}
> > >  
> > > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > > index da10d946930b..a9bbdf141fe2 100644
> > > --- a/include/uapi/drm/xe_drm.h
> > > +++ b/include/uapi/drm/xe_drm.h
> > > @@ -182,10 +182,10 @@ enum drm_xe_memory_class {
> > >  };
> > >  
> > >  /**
> > > - * struct drm_xe_query_mem_region - Describes some region as known to
> > > + * struct drm_xe_mem_region - Describes some region as known to
> > >   * the driver.
> > >   */
> > > -struct drm_xe_query_mem_region {
> > > +struct drm_xe_mem_region {
> > >  	/**
> > >  	 * @mem_class: The memory class describing this region.
> > >  	 *
> > > @@ -322,12 +322,12 @@ struct drm_xe_query_engine_cycles {
> > >   * struct drm_xe_query_mem_regions in .data.
> > >   */
> > >  struct drm_xe_query_mem_regions {
> > > -	/** @num_regions: number of memory regions returned in @regions */
> > > -	__u32 num_regions;
> > > +	/** @num_mem_regions: number of memory regions returned in @mem_regions */
> > > +	__u32 num_mem_regions;
> > >  	/** @pad: MBZ */
> > >  	__u32 pad;
> > > -	/** @regions: The returned regions for this device */
> > > -	struct drm_xe_query_mem_region regions[];
> > > +	/** @mem_regions: The returned memory regions for this device */
> > > +	struct drm_xe_mem_region mem_regions[];
> > >  };
> > >  
> > >  /**
> > 
