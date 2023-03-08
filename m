Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB8A9C678D5
	for <intel-xe@archiver.kernel.org>; Wed,  8 Mar 2023 22:29:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9409010E740;
	Wed,  8 Mar 2023 22:29:25 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 837A510E740
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Mar 2023 22:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678314564; x=1709850564;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=kX+PevkeF2bucjGW5ok31pW3GZL4OIMJIVvg+GzXgxA=;
 b=UUKXjnMKFuoD0o6fues6QAcaMZQEzUm7Rq6/3nlVxnsV16bEYQFM0opG
 ylfKcHYoqwCOyIVP0HPcuNmq/jeArnhdJqlSuJ11IWf2Mvxue9BScHjyB
 1vLfZOVyKRx9nGe3GAmtasaTLBSrpkzg38aJyGkJCYx55d6OnVpUCskn7
 beytekFm7P3Y33EJF0Fx4ADHHsoe1WNuZCdLNQU4avs0cdnt7Gw9LwR7d
 EmXw8WR9qwxT9nsGkape4xCOIUjYWeRxFPv7+BY1PoAHfSb5stQMhWJBH
 Gf/a123DfeMQcK2k/oMS7mUYPkrCkimDTLEfjIJZGtj6v518MZPWXHH9q g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="422562294"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="422562294"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 14:29:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="746073184"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="746073184"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga004.fm.intel.com with ESMTP; 08 Mar 2023 14:29:23 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 8 Mar 2023 14:29:22 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 8 Mar 2023 14:29:21 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 8 Mar 2023 14:29:21 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 8 Mar 2023 14:29:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PN+0WS3yAKfRrTFEq7fmcCCwi+oLzi13zdZTN/jUUJrh6IhhjF70qLlK6ggGVmcNJGLlSNmw9P9MBZVE3PcyrBqA+dI6GesBeRaNbfRszzDyn8rEzjjbNWsYvVXJaK5reT2q4ZhcXttzk48WZkEWialdrMbzVZIJoZmtl8R9UaHOLcmsb/EIY4cTNRYu8/Xhxru+DAk/v65CmCRT41qgTA+qbMKw90Dp1wwMNqmdXXFcQLQMFj5kEnjQff2+c7ZFMTq2E7PkejPExkf001Fq9xAKFpJytHThHoWOKsQMDwr/WhC8CZBULmT8QZ+KJbi/NMsST8uql+djot3attlRhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BzUr17Xmo4K0uJVpoGBrqKDmajvwRSr7WrSrBHogNPo=;
 b=QYS+yXwUhs6CnQ6icdEUqC1lHgj3Y3H9Q6VYGZaniGRj1U3HUlC7COBfPzPRe1Cpr0WqB2OGnnccGL0EtdXwZXN4TI3QfahkGBK6cXt1q3m6kwmx+7Snbh65NSBTPv3kMlmXDlG09eFAP8WIfZDidNNBeX1hkhkiyY875sna7fdzi79shvyPth17x4toKdAVUKsmbgTrt817ykPQyMHqkAiMD+0qPBDgwW2VdaWOCNXdISj2yEeFOlNmi5Zt5ynRwY8FJs220LrXKxLOmBi4crFm0/9Wq2vxiBUyDXNflrZbJy/3TH4OiX67Iw4na5LXSbSGeNv7xT9c0vgk8qFjOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA0PR11MB7752.namprd11.prod.outlook.com (2603:10b6:208:442::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Wed, 8 Mar
 2023 22:29:16 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%4]) with mapi id 15.20.6178.017; Wed, 8 Mar 2023
 22:29:16 +0000
Date: Wed, 8 Mar 2023 14:29:14 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <20230308222914.ctdmrgyu26xvmaed@ldmartin-desk2.lan>
References: <20230307092446.1263266-1-lucas.demarchi@intel.com>
 <20230307092446.1263266-8-lucas.demarchi@intel.com>
 <20230308220707.GB1543793@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230308220707.GB1543793@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: BYAPR08CA0051.namprd08.prod.outlook.com
 (2603:10b6:a03:117::28) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA0PR11MB7752:EE_
X-MS-Office365-Filtering-Correlation-Id: d87b7623-7665-45b7-6063-08db20248cfd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ekOUWOdtxzKLs5MhRL8t3gj9qke12HyoZl5aXt/wVPPUxFAVdBPbt8BkXwO8eefUvt3w0Qa42KbmedttccLuFMX4w2Yu7GYgFhTHsY1ceZwGi87RYuaT0AlcTEJ8zY/HP6HkAn43NrCvXT+Ekm3Zc5wn1IdOXbO7B3EZqvIJdcdgkG5te+oEZHDKBO0NCMa/KjtvSFV8oFgjBnChYy+C4Q1j8qdpbsswkf0lr58i9mEUwMaZHKmNRGQh8O5CK4lfwyVSxVO/rjacFF0J8gaX3h33BXjRdz4kaMBRqUfDqP8oo9WwibUb6AKIwBT+sVssvNwik8CwGOH6NTkliVUI1/dXLujVFFa68bhbUopzk2OD7fTLg6+pYfBDBbmaTZGZ92Gf7W6aewT+BqwRb/2LB9pVAdOjfaziG8neAl/2PweLQO0tj9l2v5KbKWLZ7j9+r61a9hQ0wUOnXHb44TLGhbeDiHEF7YUtAf5Bx8wbw0HBog+TnMC0EKMrYtInGFhVGj9SvjdyBwPVaflpKzgN6TYOLuUQflwp/uZFS1sSqTfLrHXc6NHaP5NrA7hxkUi9k8Oha0tossV0IRdCR7O/NzFknc1gZqyviaRHyG0ESxq/RTND4occDBfCTHa3R9HT7NPKmrczSE9skfw7rzqaPQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(136003)(346002)(376002)(39860400002)(396003)(451199018)(8936002)(2906002)(6862004)(5660300002)(41300700001)(66476007)(4326008)(66556008)(8676002)(66946007)(83380400001)(6636002)(86362001)(6486002)(478600001)(1076003)(316002)(6506007)(6512007)(9686003)(36756003)(26005)(82960400001)(186003)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OQF6OT1uJCPg9fb9GI9CucZSw1K9jNG5p+vmdMYFnDNa0wh09tr+oWxaxcPW?=
 =?us-ascii?Q?5snX+6BFJrsNzSgM591UV18GN7RMcdCIfare6I9KanYjQfC2LvOBfZxUq+K2?=
 =?us-ascii?Q?cBDnoncElneeUDVOjAt0Mw7p6wACGf3RnUpa37dVFtqeYV5J5BKv8YnpoOjE?=
 =?us-ascii?Q?HjuNeQEVFuyPce9w2eM2G1Vjtl2GdzKgCuBZD1aKRDKlzie9FbBZDV59n8gt?=
 =?us-ascii?Q?iz0eA5vqLH2WYy8cJ0zJT+mFmQ5MuTEdAibPq4YnD/ZcmHbMZXk7Z+8xPobS?=
 =?us-ascii?Q?HRVtEAhaq1mpknaVu851Cm3FlLCb719mPMMaCHLctHA9mf95C/SO4XO+o9tc?=
 =?us-ascii?Q?Fk4Ky1+m353PpRVv/93aSh4UmKD46q67DZzJeLXyT73H8jCWAohmeUz4Jkyu?=
 =?us-ascii?Q?Ssh2Vw82IEX9qD8EoTXh/k6wH3l6u9C5JgsEotVRGZInRbx5ZSaQ7eEy3Ibv?=
 =?us-ascii?Q?GYQ+P+xVzkAH6U9N8d/QhFRDyqzyjV3JMnhJSAzEwKc8A8/l6pCjhjxElePE?=
 =?us-ascii?Q?itTgC8Q3R07jJmLlfjBMeQhBHT85mGc9b0r6dEAX8tGSE7aG5jVrasSoMFxP?=
 =?us-ascii?Q?VDXR7bok6OqUJ00FCtAL87tZv8GFbInhI5opByU2aviiBCo1obMlEM0PObK8?=
 =?us-ascii?Q?Yn2O9o3R1dlZ0xr/71RrXMgf12Jvh3IrhwBGTv2N9Ph7CEnMtm04xcPrFW1y?=
 =?us-ascii?Q?gXSbzXKyEc7spPVjdonIBXtNG6pTTGZAlAUcWTAid25vPN96QysC+sEgYzUy?=
 =?us-ascii?Q?REDusO253GJUPn/Pd0mYvK0OPOMTLGPqLmAc7u9o0SlMlhHYQF8Pr8iVXZJz?=
 =?us-ascii?Q?zmYOfnj50LxARV0paStp9nTTl+66v4ys26hVn7UU4iP8bDltyYPpXlFOCEuJ?=
 =?us-ascii?Q?Yzq2gHYiuuVBNieOHtUxfI7Idmw+vkUzLWprUpSgYuruqZ55FcC/o/k8PGI9?=
 =?us-ascii?Q?I+waennY12VyDwhbFFia9qCGVA/sFOkzJqSd/D/eMeFC9WclGA2GH5tGUoDh?=
 =?us-ascii?Q?icimjqrN0mKn7IWtQRLwGiWyqJ0m/dU3070/kgUh7Dv1Xi6v3FL7i/G+npne?=
 =?us-ascii?Q?g/NZYCtNE6S6AEqyVSbgL5/tKokUiScyVMJe8ekCiQfobZaqrTszn4IJJtit?=
 =?us-ascii?Q?lZaarQ6Y2UNPhMxd+dQnWcnPrXWT9ZKi9lT3k2LwN9+wj8B26FVLdix15Ib+?=
 =?us-ascii?Q?I/vZKw0qskBGU8T7k8St0DR5ZhBRscBYvmKQ5uwMcfYKwGHVr6jPmCzAaDUm?=
 =?us-ascii?Q?VBJT5pK06ewYMoikMqfbsMyvZntfgZy/b3sibTbL2Da/vNs7xLKmBP2z/eBE?=
 =?us-ascii?Q?XBw3uBOohM6URiqvftuU35Kkii89vRxLlivqbu3mvOdgfMBdxPdxF4NzKGj2?=
 =?us-ascii?Q?a6dcKWaJOkJXAjcepOcfM+TTcVnu0bNW2wU4ARmSeuHPugWRrfLCxNSBIVjk?=
 =?us-ascii?Q?2yuhEUHMKpEPfLAortw6RJBwn4RF4+8C+JYIoUGX1evq84eMaLfHVqdi4qDB?=
 =?us-ascii?Q?xezVPlEiv+vyk00h/eRFjI5Yg8K7ha47fGsJNIGr3xSFFTMWyYApzHWwhVVu?=
 =?us-ascii?Q?Fnp+vG8dp8b6ytPwjK6OiqkiB9+wN4drw3JS51QhRxccNv0UQ0+a4JRJAq/4?=
 =?us-ascii?Q?dQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d87b7623-7665-45b7-6063-08db20248cfd
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2023 22:29:16.1883 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R1w1WPAgs9xJkl3jpU2KaCPypYE6tBY1U6ER03nH5+jnktUW5SkxRmYL3fZ1g91wVwAKneFKZ27NTSHMIYyV4SLvwyyV8wrqP+TPGStDwOY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7752
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 07/19] drm/xe/rtp: Add match helper for
 gslice fused off
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

On Wed, Mar 08, 2023 at 02:07:07PM -0800, Matt Roper wrote:
>On Tue, Mar 07, 2023 at 01:24:34AM -0800, Lucas De Marchi wrote:
>> Add match helper to detect when the first gslice is fused off, as needed
>> by future workarounds.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_rtp.c | 10 ++++++++++
>>  drivers/gpu/drm/xe/xe_rtp.h | 11 +++++++++++
>>  2 files changed, 21 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
>> index 0d2f51bb06e8..dc5a1c62d531 100644
>> --- a/drivers/gpu/drm/xe/xe_rtp.c
>> +++ b/drivers/gpu/drm/xe/xe_rtp.c
>> @@ -8,6 +8,7 @@
>>  #include <drm/xe_drm.h>
>>
>>  #include "xe_gt.h"
>> +#include "xe_gt_topology.h"
>>  #include "xe_macros.h"
>>  #include "xe_reg_sr.h"
>>
>> @@ -170,3 +171,12 @@ bool xe_rtp_match_first_render_or_compute(const struct xe_gt *gt,
>>  	return render_compute_mask &&
>>  		hwe->engine_id == __ffs(render_compute_mask);
>>  }
>> +
>> +bool xe_rtp_match_first_gslice_fused_off(const struct xe_gt *gt,
>> +					 const struct xe_hw_engine *hwe)
>> +{
>> +	unsigned int dss = xe_dss_mask_group_ffs(gt->fuse_topo.g_dss_mask, 0, 0);
>> +	unsigned int dss_per_grp = gt_to_xe(gt)->info.platform == XE_PVC ? 8 : 4;
>
>As an Xe_HPC platform, PVC doesn't have a geometry pipeline, so there's
>no such thing as a gslice here.  It looks like this would be trying to
>check the first cslice for PVC, which is confusing.  Should we just have
>an XE_WARN_ON() if something is trying to check gslices on a platform
>without geometry?

humn.. I thought it would be fine to just return false like we are doing
here, meaning it's not that the gslice is fused off, it's that this
platform doesn't contain geometry at all. Note we are using
gt->fuse_topo.g_dss_mask above.

This is for Wa_1308578152 on DG2.

Lucas De Marchi

>
>
>Matt
>
>> +
>> +	return dss >= dss_per_grp;
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
>> index 433f0cbff57f..4140ef507fa0 100644
>> --- a/drivers/gpu/drm/xe/xe_rtp.h
>> +++ b/drivers/gpu/drm/xe/xe_rtp.h
>> @@ -427,4 +427,15 @@ bool xe_rtp_match_even_instance(const struct xe_gt *gt,
>>  bool xe_rtp_match_first_render_or_compute(const struct xe_gt *gt,
>>  					  const struct xe_hw_engine *hwe);
>>
>> +/*
>> + * xe_rtp_match_first_gslice_fused_off - Match when first gslice is fused off
>> + *
>> + * @gt: GT structure
>> + * @hwe: Engine instance
>> + *
>> + * Returns: true if first gslice is fused off, false otherwise.
>> + */
>> +bool xe_rtp_match_first_gslice_fused_off(const struct xe_gt *gt,
>> +					 const struct xe_hw_engine *hwe);
>> +
>>  #endif
>> --
>> 2.39.0
>>
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
