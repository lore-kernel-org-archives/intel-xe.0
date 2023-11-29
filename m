Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F0EAC4167B
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 16:55:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3281110E63F;
	Wed, 29 Nov 2023 16:55:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAB8910E63F
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 16:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701276901; x=1732812901;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=a5XpcT9GQ2cD2h8De4JWkS6HVOxghPfu7WwbynRkS1s=;
 b=maO6DLo41Sl0NzlR+4MVmi5POHw62Li1hyBUW1Wn2q+YbEzuOBGYqcuB
 vjOwHZULxmZVMkFRI6YxcvdOnL46s9pVyDEIlms9K8BLEnuh0B4L94M91
 EnFxI8JyDsmvNPZ0x+2T4Qq8yF/0L0W49yoX4n+tPTSjyG6RpZ/cyTT13
 WUL546vyXVtAi5ODCNGtv/9HDuTxD10sGB2Xw9TfT9HXHmMqQlqn4kTkd
 AkrPtRVRiNfApfZ+O4fL0iWGn9EkXg5lrP32Uzulia4yKWAA3cz3nUGxN
 uGTXZ3PIyiZh2s0nuQORuDIxWcfL3O/dv1C/MckajdbLc9y2A6buGmghs g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="6458389"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="6458389"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 08:55:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="1016330093"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; d="scan'208";a="1016330093"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Nov 2023 08:54:59 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 08:54:58 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 08:54:58 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 29 Nov 2023 08:54:58 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 29 Nov 2023 08:54:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jklORMCVIClXEg8T1AWLyZfadkt+vG08+lpkR5k2jFCJAIrdd1X7euKAD9vGq9kTErnf12Vx2veiIwXZjlYjpJEPtn5e1nUpkufXeg1zVxQWP25Sj/YYeIUvPgC6oVlBuYn9syXifoQYfIEeo6TJyF3bc+EwDWyRoCWKgFtQcPg7OMBzjLg0Tsr59lH/wS+wVnViYOiABLMGw7VZUjnXqVExmhmPOTgcsqe16/c5SFQ2/VHlRh9lw1/0LSx7H8SiNMijJhI4jadqMvH9Fmic2trP9jGajYnjzez2NVHkmD8Ccc1ICtWgcwjmNHv2st3iE0G9gz1vn+VMlttSPUiX+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wDGT1jyXVOTsJWateCkN1BZI86f4jLKx0Q5RHnpWAqU=;
 b=nMEIXqEUwC4mSqgmqmvgTUHHii0ZprJD1AGcJXenhG1wlnGpYF5zeiA3nPTAtRZGJoErcXDIvkiwJ+PiKok5RTpcDapIYgf7Gb2hGLxHEFIAGD8LpD9h6pfsyf4pmecP9APO3e82tPP36R8pYiYTMj9942BpcjMn/+EHcPwCJm3aPkgmOf1r51GAYk4HqwC6RfC/FSflMgC34JU3ha6cB9FauYTHv/c1t83KNJJCRXE3/AW8G602RJXcI2/80Rg78eKbB/70T6L7O8NEwMf2TxMnrl1K9TiYcr/PcPv2tVudB2v+t1eVfuS/ivOa3pj69e2ElN5zIMBEsLVrnN3qhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH0PR11MB5475.namprd11.prod.outlook.com (2603:10b6:610:d6::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Wed, 29 Nov
 2023 16:54:56 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7046.023; Wed, 29 Nov 2023
 16:54:56 +0000
Date: Wed, 29 Nov 2023 11:54:51 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>, "=?iso-8859-1?Q?Jos=E9?= Roberto
 de Souza" <jose.souza@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
Message-ID: <ZWds2xD8bXkBy-t0@intel.com>
References: <20231122143833.7-1-francois.dugast@intel.com>
 <20231122143833.7-4-francois.dugast@intel.com>
 <ZWZY/zQQzVeWV1PG@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZWZY/zQQzVeWV1PG@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: SJ0PR13CA0091.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::6) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH0PR11MB5475:EE_
X-MS-Office365-Filtering-Correlation-Id: 8953caad-1fcd-48c5-80ff-08dbf0fbe9fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4YUX+d56Kt0lPu2XqzlqSzz7z8vlat6EM4ET1u3WAIGH35MyMzMHavhbxmX2+KK7livoZqWPU4E1KLKIxbEtILoO5sxwx/eWvLeEsCS2knL903DPIXRz7SCGpRPwPgLnFSDo6G09aYSuh0OsgmQatvQKcboIMLNMd42ZG1Zzl0jSzKixF5WyiPh2a/O5Z7/QP0Pjh32B4m3Cui91j9BA7D9kLygzodPxmrke/J8hFgjTnOj2ewfk89SgNGe5eaJbajL+5/Yr0nG97og9b+O5nT1ddl6ntIXdyUWtRi+kdhjYr5iDzyIKAnr95gJsRpH+iJHxfwUjyhvt/NeDa/fZ79bTcRdMUeA4zQtLzA0a/ueh6CPFpWCE5TDEnxOuITTr/SQFkcbJQQPGBe8EN6iOIkDMYaugtmU7FEZIidrFXrcBwIp/7b39Pclhs8+1WVN/772/OwsImysmJYWJ0Ha1/DKwgRo/amkCdYb05MLkJE5bFKq2syouIMRTB0MQKA+0vffCmX0TQd0b+37HGt9ZBU6L8itSxyWyOt+dNNZKxPA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(366004)(39860400002)(376002)(136003)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(5660300002)(36756003)(6506007)(38100700002)(41300700001)(2906002)(82960400001)(86362001)(26005)(6512007)(83380400001)(2616005)(8676002)(8936002)(4326008)(66476007)(6636002)(66556008)(316002)(66946007)(110136005)(6666004)(44832011)(478600001)(6486002)(966005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?v+5ohp6VEJ7SlnlXNdkSSSjE6hIJ0zwzhvv0bAYDNv0NRuxUf+pTC/6Alk?=
 =?iso-8859-1?Q?ktItUROh7aJwzn9iLFdhFzcquVsatY5wmTGMv8s/k5zGrckj3Ub/nyQkIy?=
 =?iso-8859-1?Q?salWnAmqd/4u1QkuKqxHM9P8adBAnzZ+sJCKxiEUZxi01dhMpXFui+MK6I?=
 =?iso-8859-1?Q?NxHi/vJEeheiIQVepr4PNZzb04872h1+0UfpLDW9oc0YgGktjwz4g2dsDF?=
 =?iso-8859-1?Q?K2wx6EI4W3oSN1YCJJaZPuWFFvyFJ1Z04Yh4aNaeJI+N4GrkrRjranNV3W?=
 =?iso-8859-1?Q?QDFg45VqVI2NfxjUHEqHOGFtvWlc2T+Qh94Udb69BIM3II0XSNkO4bvyr2?=
 =?iso-8859-1?Q?OhsAR0blyDYH+/ZiO5/Eptf/6DkX9DNNNq8eyaRqpvacBzVldltBQIy/ZR?=
 =?iso-8859-1?Q?bGEch1JIbTTPyCx3eevnwwwcQ3ABZSTCXJIB3LImjAWMZFixhB1DO0vUFw?=
 =?iso-8859-1?Q?fW7abbIYXp5tmTmCzfLLpMooId0TFE+C+lMmzsLdWezpoG6iCMLKl+Ods7?=
 =?iso-8859-1?Q?hXNQKuMt1AyyGYMygdQdo29UR0s3yH2Qa7NWO0l8nWJheph6/yLgtwNM9/?=
 =?iso-8859-1?Q?G3C96Bt5NE1h+pV74c+YOns/PrXBW5hPW+LSWL9iC2DiFHQ0v0ujfcVl5p?=
 =?iso-8859-1?Q?Q+KuKm/6jEi0bZcV4H9p/LbNOcRFasZtxsDYPVmaxQxrMGdMBYK93aqhOC?=
 =?iso-8859-1?Q?YtR/B5eOO3Dried8p9WIbuMc67/LJYHY90GxTg44WaEGX95zYDRAEH+758?=
 =?iso-8859-1?Q?bcfERtwvw6ijsXSHyCyh/xqqjSBDDDVZ2KxaMOq9ciV0h7VlqSqOiaVGEf?=
 =?iso-8859-1?Q?KKTphT3L+kMurZ1dnVVjQ8BrjTOWSzEZb83XyexS9roXmSlmzlb72GV2ZS?=
 =?iso-8859-1?Q?4sYlzOwUPXzLrIa26I0Uie0C89pp22Cqd+tvoY8pjsDRhI9eP/dtiCk5XK?=
 =?iso-8859-1?Q?Y1669HtMEuRdY3F2RVPxnQo5J28lf+hOOwMHf8SjIo6r93tJUSpxtcD1US?=
 =?iso-8859-1?Q?bqtRa+r0sQVjQWBFOl7+dU9zm/bXomoEHEWoCnUAwU1aacSPeFt0QAtu00?=
 =?iso-8859-1?Q?VQz6xUiGGgcBGuA12UlTtIha3Oq9MRECtgtR3NnZP4pW1B1LRW1zOBTJkT?=
 =?iso-8859-1?Q?bfALwQ6ZZNBKZNYERGHoIjc5cWVJUuiJPUbCR0gZzjdVqzv0kPKMFiNavZ?=
 =?iso-8859-1?Q?0A1ikgGS05gkNYhhVHqE17JcIqwTt6n/xtMmhIR4knUA1+NOJQXOcGflSZ?=
 =?iso-8859-1?Q?kSzRre6r4cgWtuJMD/v7EvQuIPS54e7VCQnzgPCNhdmsVhdDjm97wKsyxw?=
 =?iso-8859-1?Q?c5gFpI9xriIIEJ99llJd9QGGeRr/0NF5KOHbZO7OI++TrE2ru3ToyskZpJ?=
 =?iso-8859-1?Q?2DXOZZzaRMpn62bohXkgls/Po5CcpZsNowIsqR9/CgWwkpRPv3sPzVONXB?=
 =?iso-8859-1?Q?lT5HD+Z3bcDLw8kiGJALPgkfmduJixj0OhGycnntUdjWyTnowrv6iZ/rYL?=
 =?iso-8859-1?Q?ICfMh83sBIqZs7NTjuiWvrE886gDedWojhtHp9LiDXb5utWpQwlXLHJQWU?=
 =?iso-8859-1?Q?a4rvAGGMz3im6Dekekw5HAD48BFpqQBVUKV/PWZd/tbi5RSg6LpGKhXEXT?=
 =?iso-8859-1?Q?p0+FhAOfQYQ3+Uf3kJxoKQpRXi6dGlRdrEdSFZyxsoun/1brqY39Yf7g?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8953caad-1fcd-48c5-80ff-08dbf0fbe9fe
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 16:54:55.9357 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HSmg9B2oaexowdW2N4xqSvJt3GdTuHnpKbBEoUNA81PuKBfOO66WCzM3f9iygAUz1WrPTr8cYlw2OBxe9tOlZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5475
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 03/14] drm/xe: Make
 DRM_XE_DEVICE_QUERY_ENGINES future proof
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
Cc: Francois Dugast <francois.dugast@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Nov 28, 2023 at 09:17:51PM +0000, Matthew Brost wrote:
> On Wed, Nov 22, 2023 at 02:38:22PM +0000, Francois Dugast wrote:
> > From: José Roberto de Souza <jose.souza@intel.com>
> > 
> > We have at least 2 future features(OA and future media engines
> > capabilities) that will require Xe to provide more information about
> > engines to UMDs.
> > 
> > But this information should not just be added to
> > drm_xe_engine_class_instance for a couple of reasons:
> > - drm_xe_engine_class_instance is used as input to other structs/uAPIs
> > and those uAPIs don't care about any of these future new engine fields
> > - those new fields are useless information after initialization for
> > some UMDs, so it should not need to carry that around
> > 
> > So here my proposal is to make DRM_XE_DEVICE_QUERY_ENGINES return an
> > array of drm_xe_query_engine_info that contain
> > drm_xe_engine_class_instance and 3 u64s to be used for future features.
> 
> There is 5 u64 in this patch.

my bad, sorry. just trying to prepare for the many capabilities and other
stuff we will likely need. But likely 3 would be enough.

> 
> Anyways agree this better but what if we improve this a bit more making
> each __drm_xe_query_engine_info a dynamic size.

hmmm... I think I like this idea. pahole seems to have a good output
with our other existent dynamic array.

> 
> e.g.
> struct __drm_xe_query_engine_info {	/* Bad name, just for example */
>      /** @instance: The @drm_xe_engine_class_instance */
>      struct drm_xe_engine_class_instance instance;
> 
>      /** @reserved: Reserved, dynamic size */
>      __u64 reserved[0];

I believe [] instead of [0] is the preferred way nowadays.

> };
> 
> struct drm_xe_query_engine_info {
>      /** @num_engines: Number engines */
>      __u64 num_engines;
>      /** @engine_info: Array of engine info */
>      struct __drm_xe_query_engine_info engine_info[0];
> };
> 
> The size of __drm_xe_query_engine_info then change and can be calculated
> to be:
> 
> (returned size of query - sizoeof(__u64)) / drm_xe_query_engine_info.num_engines
> 
> We then should be able to add additional fields to
> __drm_xe_query_engine_info indefinitely.
> 
> What does everyone think? We likely can apply this idea to other
> queries too as it makes sense.
> 
> Matt
> 
> > 
> > Reference OA:
> > https://patchwork.freedesktop.org/patch/558362/?series=121084&rev=6
> > 
> > Cc: Francois Dugast <francois.dugast@intel.com>
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > [Rodrigo Rebased]
> > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_query.c | 15 ++++++++-------
> >  include/uapi/drm/xe_drm.h     | 24 +++++++++++++++++++++++-
> >  2 files changed, 31 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> > index 61a7d92b7e88..0cbfeaeb1330 100644
> > --- a/drivers/gpu/drm/xe/xe_query.c
> > +++ b/drivers/gpu/drm/xe/xe_query.c
> > @@ -53,7 +53,7 @@ static size_t calc_hw_engine_info_size(struct xe_device *xe)
> >  			i++;
> >  		}
> >  
> > -	return i * sizeof(struct drm_xe_engine_class_instance);
> > +	return i * sizeof(struct drm_xe_query_engine_info);
> >  }
> >  
> >  typedef u64 (*__ktime_func_t)(void);
> > @@ -186,9 +186,9 @@ static int query_engines(struct xe_device *xe,
> >  			 struct drm_xe_device_query *query)
> >  {
> >  	size_t size = calc_hw_engine_info_size(xe);
> > -	struct drm_xe_engine_class_instance __user *query_ptr =
> > +	struct drm_xe_query_engine_info __user *query_ptr =
> >  		u64_to_user_ptr(query->data);
> > -	struct drm_xe_engine_class_instance *hw_engine_info;
> > +	struct drm_xe_query_engine_info *hw_engine_info;
> >  	struct xe_hw_engine *hwe;
> >  	enum xe_hw_engine_id id;
> >  	struct xe_gt *gt;
> > @@ -211,12 +211,13 @@ static int query_engines(struct xe_device *xe,
> >  			if (xe_hw_engine_is_reserved(hwe))
> >  				continue;
> >  
> > -			hw_engine_info[i].engine_class =
> > +			hw_engine_info[i].instance.engine_class =
> >  				xe_to_user_engine_class[hwe->class];
> > -			hw_engine_info[i].engine_instance =
> > +			hw_engine_info[i].instance.engine_instance =
> >  				hwe->logical_instance;
> > -			hw_engine_info[i].gt_id = gt->info.id;
> > -			hw_engine_info[i].pad = 0;
> > +			hw_engine_info[i].instance.gt_id = gt->info.id;
> > +			hw_engine_info[i].instance.pad = 0;
> > +			memset(hw_engine_info->reserved, 0, sizeof(hw_engine_info->reserved));
> >  
> >  			i++;
> >  		}
> > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > index 1bdd20d3c4a8..c80e03b61489 100644
> > --- a/include/uapi/drm/xe_drm.h
> > +++ b/include/uapi/drm/xe_drm.h
> > @@ -124,7 +124,14 @@ struct xe_user_extension {
> >  #define DRM_IOCTL_XE_EXEC_QUEUE_GET_PROPERTY	DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_GET_PROPERTY, struct drm_xe_exec_queue_get_property)
> >  #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
> >  
> > -/** struct drm_xe_engine_class_instance - instance of an engine class */
> > +/**
> > + * struct drm_xe_engine_class_instance - instance of an engine class
> > + *
> > + * It is returned as part of the @drm_xe_query_engine_info, but it also is
> > + * used as the input of engine selection for both @drm_xe_exec_queue_create
> > + * and @drm_xe_query_engine_cycles
> > + *
> > + */
> >  struct drm_xe_engine_class_instance {
> >  #define DRM_XE_ENGINE_CLASS_RENDER		0
> >  #define DRM_XE_ENGINE_CLASS_COPY		1
> > @@ -145,6 +152,21 @@ struct drm_xe_engine_class_instance {
> >  	__u16 pad;
> >  };
> >  
> > +/**
> > + * struct drm_xe_query_engine_info - describe hardware engine
> > + *
> > + * If a query is made with a struct @drm_xe_device_query where .query
> > + * is equal to %DRM_XE_DEVICE_QUERY_ENGINES, then the reply uses an array of
> > + * struct @drm_xe_query_engine_info in .data.
> > + */
> > +struct drm_xe_query_engine_info {
> > +	/** @instance: The @drm_xe_engine_class_instance */
> > +	struct drm_xe_engine_class_instance instance;

> > +
> > +	/** @reserved: Reserved */
> > +	__u64 reserved[5];
> > +};
> > +
> >  /**
> >   * enum drm_xe_memory_class - Supported memory classes.
> >   */
> > -- 
> > 2.34.1
> > 
