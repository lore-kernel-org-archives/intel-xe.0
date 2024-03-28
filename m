Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A518C54E64
	for <intel-xe@archiver.kernel.org>; Thu, 28 Mar 2024 14:15:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E98A10F1C0;
	Thu, 28 Mar 2024 14:15:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N269VX5S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B99F210F1C0
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Mar 2024 14:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711635303; x=1743171303;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=bc7AA0uw+X1BhIxMfV+LqyanyQAlxX4Aq2gIWxdgcTI=;
 b=N269VX5S4yL2zxfrWP6Uyba7TZL3PiTHGm5r79PQf3pWj+5aJlCRcwbo
 BCDruWNmtcU+RgwMxqwWV8Di/GSf4WbcHAVN9beyGYnrPSDna2KfFhyZK
 6EMUcuFphR+x0yMAGRMsDbOQSDV4dtJSsjhf4rJC90V6G7aoLdAjpNDIM
 cv7QOCFRhI/z2gu5gqw96yknEwK0Uyw/HUramQr5W9xyVX8UJCshDR2Tz
 dJR/qDSNMHmY0WUOIqqYKvXGUsyTw/X7ZcvxGIUYHO56uNl9KNrFGnK01
 D93Y6QYnPS3SmRnSMba7rE9elkrZeTu4nz097UhypwWrbtbqXMjS0pqwf A==;
X-CSE-ConnectionGUID: q8OcCNu2QYu+KYqAETQHCg==
X-CSE-MsgGUID: W/YSjJj1TqepBF60AYi51A==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="10598474"
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; d="scan'208";a="10598474"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 07:15:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; d="scan'208";a="21375147"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Mar 2024 07:15:01 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 28 Mar 2024 07:15:01 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 28 Mar 2024 07:15:01 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 28 Mar 2024 07:14:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H7SjX3udKo9bgdNqpsOiKjl5MZbB21KvD7a5kwm4N4sIAhIrTmfWkmKjPrtOE0gLfOnhIUlXUmRI7OvUKmaICTfps15bBIBRm0ANTGify1k8++8K3mHCJ/CtLKg0nwEU4fRgRSCHmTsnldChAMfiw/fIXaWtE5kMEQ8wi7UMb8Twrdtct9cnf5rx5/Iq3dcfZz3ay3mj55pkd1dgsEAuHfyjvdEqIEJcFZ+k+YhFqPfDBQFw9leZ1Wt1N8YBcLEBMXJRGdBGJXG11WEs23G67E6+Rx9F6C3cbWzUcVCc73MnAxFdVsd+UO3NaeTLiNgGQXEBc8Onbu1xzXnsGrK7qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CI4mexf/lc16rLD4yY74BaJweDFarU4F2VKTzef8RRo=;
 b=gDDX53Hiwp+f1F6eYNmd2buXVkZ/6lrigdq8awnjZkTouvD323f2IyNAYuAZ7AqkUdDPAvV2SIUAO/5hKmG3tATp7NUo0E9cV7Nd6w/83DI4jun30kLlcv66Eor3gWtoOXSuDVSqOz+/mMXk9gaA/mXqAxVj+t6YoAICC3K/M2aFxrpLA/EfWeaR3Ndxi98aWqLP9d/7sjOjDYJAwJY6HXX6O17sDPVOVIhzmPcvF8W7Uuyyr8sQpWq03Z00uE1qH2w1R8yKwmaCjOJKjMDhDmfzyB33RxqPpoRaGnPsAJDwnQkU6cjJKVyUafcSQEVN+sHO6gYoyw/nu4CW2X/AOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA1PR11MB6734.namprd11.prod.outlook.com (2603:10b6:806:25d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.33; Thu, 28 Mar
 2024 14:14:19 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7409.031; Thu, 28 Mar 2024
 14:14:19 +0000
Date: Thu, 28 Mar 2024 09:14:17 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH] drm/xe/uapi: Define topology types as indexes rather
 than masks
Message-ID: <j3dr22wonovslxaedkvvuz6jc66c2ky277r5xk3qlzqrimp6ux@tpp4yk2hczqx>
References: <20240328140243.7-1-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240328140243.7-1-francois.dugast@intel.com>
X-ClientProxiedBy: SJ0PR05CA0046.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::21) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA1PR11MB6734:EE_
X-MS-Office365-Filtering-Correlation-Id: ca277ca1-af36-418a-5eec-08dc4f315bb0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zFvKgSsuJmHKl9x69OV+olPZhXM7W17tfucCdhEd+vE/006SfAP8xMT+ta7k2kXyP7n1VhJYX7l68nRIQ8DZTOOJaTfDV1OTCL/AgSYPKRSA+5eqTgqwWSuXajDkE7w/DF9/a8IZuseA51uh8xlO+TT9uZ9SPu3ZU2UhFbq96Pi2s/a4417IxtdrK/Uk1zwzFzTJ1n/J0ScZ6yURhzNQsKuMPIoPyLDT4r8ekrK2p8bdyf88N2NEv7w3nytCaylWI66hSknM4pvXTaq7VhNu3XH1a3Sk4ndNazEvg8ESvP3Fcgf75bc2L/rkL936gKR3f52aMAB1bcRZn+gaBlLr3jv+0xntnX0l+6crXZMAvyaZBiuLiWnVF1A9ULaAo3d46dgtERoAu7nq5ENaeBknCmbht1eEjsW684/69gNdirAk7S0Nmw7QXpCAAdijUwCATX+S9JTv9EMtklUZXjDi/hR0ybE1FWbeqhMp1VoBNm+h7Y0Hu3rJpLMz0kudjIpQNj+zfWnUdLYbCndawVFD1fDITuO2WEQ6KFayRuFMde8saKbBwD3vKs9sBmAYZ3MlB6Pavh2MmAtTCHo2lkN/kCW4sChkMIpGfzhl3cM+0MM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vGFuKVFDMgAKKe/OCyBFmK003Bt7pROGEJIdLXIRa1VUfadi7qmS05A9mQqa?=
 =?us-ascii?Q?Cc1ZlG0X+DWxUeAGPgTWbnNQJI1tDLVx6KoSLCVLcvp9o90WtM3tETvSDIPe?=
 =?us-ascii?Q?dD50utFQ+5tFPieI6HGjZnvAQe+u7hvErocQ2FI3JH7PPHAXXhADvv9+L6Yh?=
 =?us-ascii?Q?hoSRGbGkjoEhldSrWgrVWDa8rGEevCHG6ld0x7Rn2qmzX1rWMPYxkV3AMGdW?=
 =?us-ascii?Q?ItRs61kI/hhDDSSOd9EAnFONP1IsjONN6PCC/VSFDm09FoXZ0k+CDFVFGCWf?=
 =?us-ascii?Q?Qr6n5V758XRoP8RTHjIxcdxXzEqf9EsRv55bpD6rSTZ1j8g0AaowdVHtJ4mC?=
 =?us-ascii?Q?pgc6DDA4YZT8a583HBzcdaaBDC99KHjUVsXhjvyiFk9PWZ/2flh1MGD/AIYU?=
 =?us-ascii?Q?FSV+e57E2JfzCalcKfzx+fwpOq8vHCJo/pEHYJ807g9iDPgCgZR62rpjsCZw?=
 =?us-ascii?Q?kn4Rqb9Y/2nsRL+NjVf/jHcSGlQFmschiiw9haxpkFHGuPErHPiWfb4DJU7G?=
 =?us-ascii?Q?jgKV0i4Zx1J4PCCyo88WK1Ids2qhg92ZDkTagDjeQH9OJm0hz50M5ougx95z?=
 =?us-ascii?Q?/0uc+QiX8LeTPUeuUOow9LMLN1TdmBi9LDoMtzudrIbqC5dDiZQHbWQdtiZ0?=
 =?us-ascii?Q?CGDbz/a7fltwi+maaZ1pFNVp1wLbNRuaTYd47VGw9pLaqE7YL8RxoxwxhHHZ?=
 =?us-ascii?Q?FmkrUe3Mdn48tHcWQWwwamyrSdUuG0vtU50aC+nNxTV+V6hdPvdFZVqkx5sW?=
 =?us-ascii?Q?PrUgZkAK8BQTmWGXXQLBli3UaQGNHkQ22I1vyuKHWcE9Of//cxOhxmgksCpG?=
 =?us-ascii?Q?b7LSrmjPFcLBS124GurAN0bmF/9Wx0M/jg/xCH46HV1CFxH92hb2sbHppvl7?=
 =?us-ascii?Q?Hk7qmaFnrNn8LjAhgIiRgxGezS2tSgFeZPe+ogMt/nH8QYiu9mRkodBg/4d9?=
 =?us-ascii?Q?/BuqT9T+NpyKlu0x2wNV4KN0tojzham0+Vcw4YjiS1t1LdYLzk6loPv4qgNi?=
 =?us-ascii?Q?r9/D3zJzYm5UjBC52u87yPYE92qmbCUGISHb3iuTXhW/ydVrqbHvJom64PKm?=
 =?us-ascii?Q?rG0QQHtFxsDymUKKqXIMm3EvkZrquc1osCJKyHnjQav5nooLMpEPwOmoQuPo?=
 =?us-ascii?Q?iCkRptdS733Ve50qI8fIwrq8dqabCt/1U8Yc6+AUK/trz5NP7GsVzmdtZCPZ?=
 =?us-ascii?Q?AQ/VMu3qWLVgm3MvF9TdXGgiR8k8MZE9r4Cd0bZFHIPxRoCx5+eEWWrU1SYu?=
 =?us-ascii?Q?biFAQrZv0bNROYoqZvJyBPecIdZTJqpC/PXZI3PzSSoucVzIGXrDX4CAfpQe?=
 =?us-ascii?Q?O8L14l3b7IWmeu5GVsHTFo3FEEXtuA16r7LENlslnvEG/w2jixTFzlVIs+GM?=
 =?us-ascii?Q?Sg1ZAN01Jo0qokTQfCwvMJGQSIpgxxhRhGKGB2hVGUkoy+Fh9lhf65T++sbQ?=
 =?us-ascii?Q?qElSAH7EAxP6XV2rJE2tiFXbCQZ1eFkPzYzi62C9h8PZSfILRd7latLRq9R5?=
 =?us-ascii?Q?QB69NJ4vJPPkmagy040t+vSL0syvqH5rKqyeoXcaLYiYXv7zh+iajgywz7M3?=
 =?us-ascii?Q?6OrcLceWZ7IxmoxrbO1VW8HXqMgvo8hlp26LJM1YwrnAvI0VnAAPPWpOi6S9?=
 =?us-ascii?Q?sw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ca277ca1-af36-418a-5eec-08dc4f315bb0
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2024 14:14:19.2443 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sg5l8E7dIv9tFCHOfEvHw5tN3z2VqDHikTLhSxpKrgAZXzTpn7GQsG+AxtXDVy+H7Y4yPr5mbrvQyICykHx802XCyFU5J7Y6jM1OyzF0BgE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6734
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

On Thu, Mar 28, 2024 at 02:02:43PM +0000, Francois Dugast wrote:
>The topology type is an index (not a mask) so define the values
>like other indexes instead of using powers of 2. This is also
>to make clear that the next type can use value 3. This commit
>does not change the existing values so it does not break
>compatibility.
>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Suggested-by: Matt Roper <matthew.d.roper@intel.com>
>Signed-off-by: Francois Dugast <francois.dugast@intel.com>
>Link: https://lore.kernel.org/intel-xe/20240327232317.GI718896@mdroper-desk1.amr.corp.intel.com/

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi

>---
> include/uapi/drm/xe_drm.h | 6 +++---
> 1 file changed, 3 insertions(+), 3 deletions(-)
>
>diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>index 808ad1c308ec..95a8ecca21f4 100644
>--- a/include/uapi/drm/xe_drm.h
>+++ b/include/uapi/drm/xe_drm.h
>@@ -518,9 +518,9 @@ struct drm_xe_query_topology_mask {
> 	/** @gt_id: GT ID the mask is associated with */
> 	__u16 gt_id;
>
>-#define DRM_XE_TOPO_DSS_GEOMETRY	(1 << 0)
>-#define DRM_XE_TOPO_DSS_COMPUTE		(1 << 1)
>-#define DRM_XE_TOPO_EU_PER_DSS		(1 << 2)
>+#define DRM_XE_TOPO_DSS_GEOMETRY	1
>+#define DRM_XE_TOPO_DSS_COMPUTE		2
>+#define DRM_XE_TOPO_EU_PER_DSS		4
> 	/** @type: type of mask */
> 	__u16 type;
>
>-- 
>2.34.1
>
