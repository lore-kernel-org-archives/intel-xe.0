Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3CFFCDB46D
	for <intel-xe@archiver.kernel.org>; Wed, 11 Oct 2023 17:01:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C72E10E428;
	Wed, 11 Oct 2023 17:01:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E7DF10E428
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Oct 2023 17:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697043665; x=1728579665;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=v7cKKwpItoFhpUsRi+/mi53QF5gNw/GdEfbMkLwE1MA=;
 b=Ft06XTxy3dgM25geeqzygg+JtefPb8gnl2ZTIVdRFlqetQgbIAYeViTv
 +sDObxyWIre0TngZ8ovUBI9bvQQSjnZzEsge93C9rS7l33iUbF+cD0DNy
 SiksbRYy0AprLbqtMx1yjK5VoODcnzGLIMysEiUEwLPsTy740+3Wz4LRN
 F8koKfrFvsCrhwUNHApgX7FoM1QRWTXIll/yxRAVCpn0yvgl7iadaLJk8
 f7DvUFcN10epx3ewnHTomR7yz+5fGFTVzE0Az1iN60J4gK6QJhgeqcCq6
 44mMXByTKikS7INMq+aC76pmR+hKoMajzdYCIS6redZr0BSKEcKbGv4Am A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="383582522"
X-IronPort-AV: E=Sophos;i="6.03,216,1694761200"; d="scan'208";a="383582522"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 10:01:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="1085302981"
X-IronPort-AV: E=Sophos;i="6.03,216,1694761200"; d="scan'208";a="1085302981"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Oct 2023 10:01:04 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 11 Oct 2023 10:01:04 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 11 Oct 2023 10:01:03 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 11 Oct 2023 10:01:03 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 11 Oct 2023 10:01:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iYI34XMc51/2/LX3UxrFlcdD4vj5agyO1pzMdyFaRE5VhSqYYJvNBhREyn7/gBA9tas1M5IgDgvVPnE96gYFAR0PKNOySWPuS0fhUDtFNAThlmCFUKalSwl/FMnf6cm8Ir1KYQlmOIWDqbNMdzkfwgeb7ZSRz7WzJVj42BvD7VHCZY/FWMyYQO/mon83y/5NeXxFp7hl57N63HoQfaVv8s+HX1Vr1rrwPI7eCRCCkVVmYZy0zQuSKJWDRykAmM5H4XsWpUoqyRO//rAb/Y8RCGvHdGDGUAGlkwYZCcJkN9R4s9rSPh+AMDCAkQE2TX8HmtfmRIn938iAaiFMjTm3Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dkeoldgizGymrapYjEWgv7Evi3a25PrVrDJ+/8Gxeyg=;
 b=dFW3P2/d+gstJWYIWszIlo/yPahghBwBp/i/sgG5//+jxQ224QuKieHWXGXoT71BgFRMgjgAYSNOLyDvo3kjr5QXIDewpqzvpwQGOmW0jEHsk6pSBL1A3eW0X7yYMfzqPYEVpPTAzVpLIfD7mSEuzrvQ/ofutTntqEb9AHolOmQ03TYN3etLxdetr/+y+griT+gaXBP0BZiFOVNWaOusLGNZxAzE9/Tyoi45+T53TnOLv45lZxD7KtQJrXoaQ3yrsCIpXE2aq+SPahC6j6wKRCLWnOQ3r4Yqy+D3jfmdqFswvYtuKvkxAjuDnvcyHDAAvIXnRlPgEojtHdfESzY0Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MW4PR11MB6692.namprd11.prod.outlook.com (2603:10b6:303:20e::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.44; Wed, 11 Oct
 2023 17:00:56 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%7]) with mapi id 15.20.6838.040; Wed, 11 Oct 2023
 17:00:55 +0000
Date: Wed, 11 Oct 2023 13:00:50 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Kumar, Janga Rahul" <janga.rahul.kumar@intel.com>
Message-ID: <ZSbUwmEQOE8l5CIk@intel.com>
References: <20231004085138.1825175-1-janga.rahul.kumar@intel.com>
 <ZR2QPM/V8p5+5cb3@intel.com>
 <MW3PR11MB4748563072E5947514D726C2AECAA@MW3PR11MB4748.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <MW3PR11MB4748563072E5947514D726C2AECAA@MW3PR11MB4748.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR13CA0164.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::19) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MW4PR11MB6692:EE_
X-MS-Office365-Filtering-Correlation-Id: cb2f0b86-d504-4e03-9062-08dbca7ba232
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5AKyMbaB+sEYTGlPD85g7A0jO67Ir0yR+Bx8hSjP9wakBXNuhWccp3YXseSZkiV/vz6zvcKYrGL955ijgjuBoTbiltPGHXOGrNBk2j8y58SAmrKR8iweMehnUdpQyoWQsa2P9UgJ4QP9cD3trIGT7oylF4dBcg6Qk+RjmAwZXN/aPQbUbTyR0ExWM5Q8+6mRYPrE7PwFsiwARuqrxzTmhwn6BC+leTWZ6aT/ieUNFu07MVwnjRcJ0+jAAW+mUD91eYnOBhbxbs7aKzTd9WhXmmHjvKwENoHzjFlMQaZcnSSxnekOBYpdB9M98gM2xAvOrr5qSwkM0sgq99pEx9DJxY0dIjM/+JEIUhFs1/3eEuqlg2JbqQ1AXI3yXV+jDXLCK8CKOiddIKQyBpNy6+bmiOESymIAEe56Dl5J/uCIWr+HeBhA2sxKaPOeiWW+YfS+KhT5ljzPXYGnckHre0RlxFVLSslxFHs3xIE7YTwQ0LezsEbBJE7n164BWk7q8v2SUS/3qEAv+kziFzLE/ULljrnsaxPb1D4R/BMBYxZw5vZTADHoLzRIPwLLmndB9256
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(346002)(39860400002)(366004)(376002)(230922051799003)(1800799009)(451199024)(186009)(64100799003)(6512007)(478600001)(6486002)(86362001)(36756003)(6506007)(53546011)(38100700002)(6862004)(8676002)(8936002)(4326008)(5660300002)(44832011)(82960400001)(6636002)(37006003)(316002)(54906003)(66476007)(66556008)(66946007)(2906002)(41300700001)(6666004)(26005)(2616005)(107886003)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MLXSozTC59aIRiQeDgi3OadSdmD0n2GKlSuWBMbkJySwICyq9uiIWglfLcYn?=
 =?us-ascii?Q?04Lf9e6Xy04+zj0wOMhQZIoQfgzt1WrgXLACbLAoaiOkpVqW58fpXt4exNRp?=
 =?us-ascii?Q?gJjbpBeNGnL9l334RKLL0VkAnO4x/JZHySZh1JLzJ6smr9EG9QhKsahoqRn9?=
 =?us-ascii?Q?0d8xS7O8nwWo2tQaFZz8Ye4T1GS/LZS7vDbSy2Sqs2+dpwxr+L4YCtXZkMmu?=
 =?us-ascii?Q?1nCb29++6Y2PDcbrxHq6T3Hjeq6pt3+tyl+gbnGd3yGN/hmuew9oTtv/KwTg?=
 =?us-ascii?Q?BVIukwMMpBfKdSNbI0Rp2DmW7gsExVa7uDbMYUxUR7Fv8UWKCA7ZSaXYvlnP?=
 =?us-ascii?Q?TUOH56VEuQBZd0NIQu+D/eez9xlWFU6hyE0gklZGOKNCrTgAzBa+c21/XE97?=
 =?us-ascii?Q?OPzz3VwIpLK1w+znHweLNhFWeG6XUlOadwjQEMEt0bHnsBzcxckxk88SOrsE?=
 =?us-ascii?Q?hYRU1Ek/48VOqZFxj2EWDZTjwL/U0O2qzsVzXpFz2zAxgXcia1DuA58pFWiI?=
 =?us-ascii?Q?SYuSgcyjPD/mZZsxl8V9vts7OBnwVQ+A4jf26HRouiy72M05UC27gmdgpsaS?=
 =?us-ascii?Q?uW6xJ7SJjeHlKCa/tQRHxnwsa+sTbVJPNRERGFTHgf42EBYIHUBgU1Km7Dyg?=
 =?us-ascii?Q?jE9uxnId9oCMmOaRqPasXgvl2YCQ3rvVmIgu/gvvsGx95zTUw/2gNDlgXjhx?=
 =?us-ascii?Q?GalKDYADj8pYVn5M89WOo5GXeW42RvYlefWNmp/WXRXDoJHVsUYRUw2nSdM5?=
 =?us-ascii?Q?GVU06lQUKwkktxTEK3K2I1uz6ntifbO/4ALsE4B5j4VXrcbIib3MgRkHQG1A?=
 =?us-ascii?Q?Of9c73Em7CvVq9ausaIh3sWsFaDqC1Ft1SBrosw013/WNYUT9zyBU+0pRUqJ?=
 =?us-ascii?Q?Z3Eeui6eHhBHS/GWnqMZ01VNrf0E8nbbBUDmlQApDc69jvnpZZwqe3ZCRrQZ?=
 =?us-ascii?Q?W2P4HbwzvD/eJho31KnLyatbRMu2G/8aHIjeOU6WaxYbGR171ecADzbVP/5V?=
 =?us-ascii?Q?DgLHtelw8edjFXoNPCa5qwbuq6GOn5pEqAgu1oLPnj8E48HQp4Yf6BWg5ofu?=
 =?us-ascii?Q?8GMhACtnYRGf+qIlexE4PZ45t7Ut8xTyb/4ZBX5spKbGRHSQt++x9XWESxSM?=
 =?us-ascii?Q?hpexnrBFopv7Tr27W5QH6XW9SFswW6Ta2DuW69r8SBgCCZ0OdbOxOtgnxYFM?=
 =?us-ascii?Q?a8ZWdkdoFFTEBhMWLn/DGf5l+gvXvmlOUvbz3sofR6mssXGeFfHeer5oirDJ?=
 =?us-ascii?Q?ldk9isuuaUSJikIT3TpOHp6Rr9nDny8GsS/tn1rbLbodhP843wF1CZEedvLQ?=
 =?us-ascii?Q?TA8D+BCs6M2t0/FtthlsXhB3AdDjJjch3w3z9Esc17CLZoTYqOryskY89up5?=
 =?us-ascii?Q?cxU5uUPZ74ZIdPKAghxPKoz5F+J0XI+FMeFS2qVsKSvBfYn6kusSYoQqHO8R?=
 =?us-ascii?Q?3q94L5gf1WNXz+yl33gvgSzDWQwaGfByKK1Z9palKgs/CaYsponrSf3abEAh?=
 =?us-ascii?Q?iYcqtGsELNTtUvGbqz6tTTHiXgt/YfXj4kM1ne+ekY6eNu7IFihAr7rlryQK?=
 =?us-ascii?Q?iS0hPlX0rem1roA92Yl7s38SlSmK42jknS2/9KZX?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cb2f0b86-d504-4e03-9062-08dbca7ba232
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2023 17:00:55.8505 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p7YSxeAXYwCH/skjQ+6Ur/Gd/owpxqFjwBOhi1ivVKNR2w6VjnI07ZLq/8Xcvs4joK3bGrrFNQakzs8aNn2HDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6692
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Extend query ioctl to expose tile
 count
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
Cc: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Gandi, 
 Ramadevi" <ramadevi.gandi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Oct 05, 2023 at 03:26:50PM +0000, Kumar, Janga Rahul wrote:
> 
> 
> > -----Original Message-----
> > From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> > Sent: Wednesday, October 4, 2023 9:48 PM
> > To: Kumar, Janga Rahul <janga.rahul.kumar@intel.com>
> > Cc: intel-xe@lists.freedesktop.org; Gandi, Ramadevi
> > <ramadevi.gandi@intel.com>; Roper, Matthew D
> > <matthew.d.roper@intel.com>
> > Subject: Re: [Intel-xe] [PATCH] drm/xe: Extend query ioctl to expose tile
> > count
> > 
> > On Wed, Oct 04, 2023 at 02:21:38PM +0530, Janga Rahul Kumar wrote:
> > > Tile count can be queried by UMD's using the query ioctl.
> > > VM bind ioctl has tile mask param whose valid range can be determined
> > > based on the tile count info.
> > 
> > And what exactly UMD is doing with the tile count?
> KMD is expecting UMD to pass tile_mask(bind_ops) as part of VM bind ioctl (drm_xe_vm_bind_op param)
>         /**
>          * @tile_mask: Mask for which tiles to create binds for, 0 == All tiles,
>          * only applies to creating new VMAs
>          */
>         __u64 tile_mask;
> How can UMD be sure of the valid tile_mask range if the tile count is not Known?

it is strange that it also receives a 'region' instance above...
and it is a single region and not a region_mask.

but shouldn't we replace both region instance and tile_mask simply per region_mask?

> 
> > 
> > Please let's hold on this idea for now. I'm more trending to propose killing
> > both tile and gt concepts of the uapi. For user the important parts are the
> > hw-engine and the memory-region where the BO is placed.
> Sure. For user hw-engine and region info is most important but also the relation between the engine id and its local memory region id is also needed
> in scenarios where user want to allocate a bo on same tile region on which the engine resides.

yes, if instead of query_gt we have query_engine where engine reports the
memory regions, then we don't need tile, nor gt and we can use directly
info from engines themselves.

> 
> Thanks,
> Rahul 
> > 
> > >
> > > Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> > > Cc: Matt Roper <matthew.d.roper@intel.com>
> > > Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_query.c | 2 ++
> > >  include/uapi/drm/xe_drm.h     | 3 ++-
> > >  2 files changed, 4 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_query.c
> > > b/drivers/gpu/drm/xe/xe_query.c index a951205100fe..ada1f26dc1d9
> > > 100644
> > > --- a/drivers/gpu/drm/xe/xe_query.c
> > > +++ b/drivers/gpu/drm/xe/xe_query.c
> > > @@ -200,6 +200,8 @@ static int query_config(struct xe_device *xe, struct
> > drm_xe_device_query *query)
> > >  		hweight_long(xe->info.mem_region_mask);
> > >  	config->info[XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY] =
> > >  		xe_exec_queue_device_get_max_priority(xe);
> > > +	config->info[XE_QUERY_CONFIG_TILE_COUNT] =
> > > +		xe->info.tile_count;
> > >
> > >  	if (copy_to_user(query_ptr, config, size)) {
> > >  		kfree(config);
> > > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > > index d48d8e3c898c..1d207b5398ae 100644
> > > --- a/include/uapi/drm/xe_drm.h
> > > +++ b/include/uapi/drm/xe_drm.h
> > > @@ -257,7 +257,8 @@ struct drm_xe_query_config {
> > >  #define XE_QUERY_CONFIG_GT_COUNT		4
> > >  #define XE_QUERY_CONFIG_MEM_REGION_COUNT	5
> > >  #define XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY	6
> > > -#define XE_QUERY_CONFIG_NUM_PARAM
> > 	(XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY + 1)
> > > +#define XE_QUERY_CONFIG_TILE_COUNT		7
> > > +#define XE_QUERY_CONFIG_NUM_PARAM
> > 	(XE_QUERY_CONFIG_TILE_COUNT + 1)
> > >  	/** @info: array of elements containing the config info */
> > >  	__u64 info[];
> > >  };
> > > --
> > > 2.25.1
> > >
