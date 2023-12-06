Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7E41C4167B
	for <intel-xe@archiver.kernel.org>; Wed,  6 Dec 2023 16:26:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7927D10E75F;
	Wed,  6 Dec 2023 16:26:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D39C810E75F
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Dec 2023 16:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701880008; x=1733416008;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=RiGcfgZD0Sl5YnM4nZjv98UN9Kl2TuBC4YC9FPsBNm8=;
 b=N0wbkr/2gdapXjpBQ6c/8ePL+puBELfluylmRzYvE3cQUExLxvwgsT10
 7s10Y++TfqLRjrc4i7ELLIh/MkOJXB0cHPD3AsEEhfKQ+BENPom9RG1Iv
 VANsgckJvOZ0Iohya0NDn8/Muzn/Qv10YlTDvMspuHFBUbMmvNLEpTEN/
 UZZIqIPjYhMgkMhXU0MfQvikKVoIRdXswK9HkZuft8Lv9wMdHeEdSown7
 EC9pKNv1ePumCMlgTv9SYjRRiHLyeYunw42U/+S1t6WGYH/BMz+GPSDV3
 /nNC5p9tTkG3qh0gNbQsDs4cUb2urKVnNNM21f+wccd3S/9/71moV0+bX g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="392956817"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; d="scan'208";a="392956817"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 08:26:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="894783898"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; d="scan'208";a="894783898"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Dec 2023 08:26:24 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Dec 2023 08:26:24 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 6 Dec 2023 08:26:24 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 6 Dec 2023 08:26:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B12MUcDdmebfO6n8S/qxSxNwnEYHI3YFKQqYf5yY5F02HaZVGf9pxHujZiTsYaEPmp0N+tnEX1KM7NNTMQqtV2ZBq0EC1a0GeYRQ+riBIls+aWVHiJr6zYdYd3EkAsCE0Cq2fA5ObsuEkbO0/qzpW60dqE9SpS8LC0BRT708GEjmZevalvVhW2dqaSOajZfx3Z3I3dW1OFdcgBPi4xBTeKu6HRj/l7owuQW6pgbzKGnenviP9j5cvlwdRign7WDcSFcj9NUck04uZz0D3WHG+WiVT8eOMDI7R2S1rP8u1lO30Uj4yHkrKRe+mdhGBJ5ifqXEsVAiU4qyI5LXojYcgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hsjxkSGlWUAqrtREr/8w0GhncDrzAwtsbgQE6WUh7Fs=;
 b=mgs1J2lmRF80qcPlagzaUDMJSj1wYIl7hTCkRZ9K4axCEHxNPb7FMO4RhK0/ez5epRNGIVrT318w6CcItbiXIgRw42sH6ihxsfM85x+tj4TpurYzotD6/DRp+6hoaEbNRDpHfNXvCOySMkDdHE5KjnJTbCuuM6AHU7UQnOFJkEQcvIWcVPq08Av2LoYvtpnXQvyfcGzto3wl6DeRvm1bcAixbDr89Ab52J/EYaXhsklhe7mmVorb2TYusANvsB8ZwUnBFzVLU+hm4i9a29zAGqW3gO2GMD/E+96NnF3bd9Q40YUS8cibxxCxAbNGr7u/zQM1veNmWpXCA7/13l/8Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Wed, 6 Dec
 2023 16:26:21 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7046.034; Wed, 6 Dec 2023
 16:26:21 +0000
Date: Wed, 6 Dec 2023 11:26:18 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <ZXCgqvhDlMiEJNFo@intel.com>
References: <20231206160617.7-1-francois.dugast@intel.com>
 <3v6lvfmd37hezn6tudgzrwv235f7wv4wct4d7zswa5qres7sfx@jovwzf4vgh2l>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <3v6lvfmd37hezn6tudgzrwv235f7wv4wct4d7zswa5qres7sfx@jovwzf4vgh2l>
X-ClientProxiedBy: SJ2PR07CA0005.namprd07.prod.outlook.com
 (2603:10b6:a03:505::29) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM4PR11MB5373:EE_
X-MS-Office365-Filtering-Correlation-Id: dffdfa10-fc9b-4a86-77e4-08dbf6781513
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gapepCRb7/3bNgf0tWo3O8gAGfkiqvpjSADgkmk2weLJTMyo/VTXyPfID0VOEg1mAW/dD1mgglNI/VHFvnPkd4AkDCI/udHkB9t/qdsX5UU8XsqNnRLaT4hvafCo+aPMpVrOkKOGLNz2KG0V9dOaM3RYGSU4vqW5+PiMbxUOS3xuKis/izlD26LxeJsB7icssjf4/L1r7nrif/6AIlPbbiB82JrUjzIf+Su96Sri4fuLsrsWDuHSUZSm2b+gn/jmYrOwZYIuYMlTOqIOFLlGQPQSEzl5+GWC7Xi0JXPJw4fZRVWuMz0B1RVisS4zjed90ngItQ1U/VCeoYT/0Ajkqcz77OaHe8s/8QgNfG3v5ReJXAhlf5QOwUsinqj/nyuA8ki2VtPVf/VGry0ILmnOB+DG389zB4xle6pmWv7VqMKMqM+AqVwUUU91GOf/3Ds7zvqJN+d+s3V69w6/JRtKzGV8K5JSOQ3LcFqRXLExZvksvFuLO3E+u3dFBpsyaMok5p0/96tvWsl5WcMvLVg10Hp11o4cFxKrcqYePZkXN18ZXYStNb/rnPBuzc+A9FJ9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(39860400002)(376002)(346002)(136003)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(38100700002)(2906002)(5660300002)(82960400001)(83380400001)(6512007)(2616005)(6666004)(6506007)(26005)(41300700001)(4326008)(66476007)(6636002)(478600001)(6486002)(66946007)(37006003)(316002)(6862004)(8676002)(44832011)(8936002)(36756003)(86362001)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fRHSJMBg+YSns789bkZjDQFszTC1V+aRf8w5qiQc/BOUShHHicBBDylwVCS7?=
 =?us-ascii?Q?yXlVDlZ7A3HgRk7TQb2vF2c6vPzUpG6ycNlce5atFTSBgu3Wvklln3pStEqW?=
 =?us-ascii?Q?h0BrF0Tr3jNA4MpMuT3NWfvp9BFxcWMq3iO4wwqgVZN40tcWePKcejtJ3iha?=
 =?us-ascii?Q?aAHak9H9tKkw4KThb3KnDiGs/KUcEFr1tKce0CX36z9y/WGE4n4Jt1PoFvYp?=
 =?us-ascii?Q?Y/wEAjJz0+P+pnxoUZ0g+E4UA3CJi2RNZcbqiAoGx6bp7V5906baZKu9IEle?=
 =?us-ascii?Q?ju1/n/6dAdPfuQET/H17zQbH2Ouw833BuxBeeaZnxIpysNSyiRhgH0D/3GCv?=
 =?us-ascii?Q?1C9xMA7d4qeJb7vE8cxWpzXduGMCRek86wyQEjKAFy03jVAloFpShn9RTeis?=
 =?us-ascii?Q?kp8/UKJCJAaAieymlRNEGPbZfphzd1q6qV29Et9XFBz+nioHHdOANMtuEW1b?=
 =?us-ascii?Q?mRaLAfAs1PQ24+qC/2ffu1Y4/aaumlwmPvsALh54Vh4kA5qB2/OECrXmBkIZ?=
 =?us-ascii?Q?vrQ5hJ7C1XHdVhQA9cIJtjhRhLwlxCONGCtwLGrCy9eJj/2OMx2nKhITDv34?=
 =?us-ascii?Q?H9h0dEStowWpG5g1TjkAO4+wLZ5Xr5UKqzM+Xamw1VDC6w0PJjceJRno0tFe?=
 =?us-ascii?Q?97o/6yLHg5Hlwhua07mbDbgWFXUJ3Bn2mDexOjHJei9kINYYB+9CKMbvWj/z?=
 =?us-ascii?Q?zftChRiQ9sbXG6/WbFIxGrN7BI5R6M8onhKqFOmGaBc3ZsCTBmCG/5KMbrnD?=
 =?us-ascii?Q?88P6jWWWWG+HNwbFORCz8+tfqevixiRnx+U0mWwI4V+Pg0g8ltU5k3zEBZsU?=
 =?us-ascii?Q?ZJXcmMNaZlPfegvxnV6CxpRb0BXEHj8P2JbPPM35fz1xtkw0dBC7s90ZGdP0?=
 =?us-ascii?Q?w7tG/Tlll6I4hCNh6of8xJ1YZi6N2s1VfrtzzMBHDjilJeohdxd3UmcDieZ+?=
 =?us-ascii?Q?KxjdTJiBjDdCDiyYMkGqhTE3Kksilt/MwXJnksQuBoAqeHF8WB/YffdENWNB?=
 =?us-ascii?Q?w5XMOwW6p3Dt6E7EHe29FiIvClpvu5B/qIa/jeP2wKHjX1gFips9Uq4XbYJm?=
 =?us-ascii?Q?Wjv1lNpdH4AvGPIeBZuvLYLyR2Z8Wk14rozk7g6wp5MFZBaQdrfhO7x8ylaz?=
 =?us-ascii?Q?X2YH+gzYddntibucAukvi5L7G18J+xLl61cRvKE7LWsnVaV4Zc/SNOmaHMrz?=
 =?us-ascii?Q?jJyRoLl1s09TwhgJWqP7K5pX3VZ8v67iNj20hpwxfNI8mHNeGy0QmuP9Xgbw?=
 =?us-ascii?Q?Dbnev90kU26A+kvbC0qdU2xyckWuouzQf9lleoGMbtx9h4GA8vlYV2rfEAz0?=
 =?us-ascii?Q?3gzk1WAGx5QLA9/BzwMpKMKVrhaMQABTK6Bq+PblrQ7+KwgmgSJDPrUNMP1m?=
 =?us-ascii?Q?Q0FbpTEYccxkFGO3j+IBcDZTwfm9r3ySp89Gp2O3SySH6KmuEUogfkD0LGVH?=
 =?us-ascii?Q?J2Rw5Kh2treHhsY9zQh8uo7sr8Y3fpzXTuYI0IiUweY90ReJucwkQX+BkQQR?=
 =?us-ascii?Q?ZmKwzsBHCUxixdnOc7SqiIIvQBRPMYpIabEYoNNzDrXMwio2iHekyAVC5RPY?=
 =?us-ascii?Q?Ig0TOidgVlOrxhmE/fJWsOSFVtGc38GgCQ9MEh2M?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dffdfa10-fc9b-4a86-77e4-08dbf6781513
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2023 16:26:21.6867 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AmvUGHJ+l3f6448l6Z/perLCHwMn8RtU8ZR7V4GH2p8U9mTCXcHsfboHrH//hggZN0q8Hh/g5g0U7iqXkJz7iA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5373
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/uapi: Remove
 DRM_IOCTL_XE_EXEC_QUEUE_SET_PROPERTY
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

On Wed, Dec 06, 2023 at 10:16:22AM -0600, Lucas De Marchi wrote:
> On Wed, Dec 06, 2023 at 04:06:17PM +0000, Francois Dugast wrote:
> > The exec_queue_set_property feature was removed in a previous
> > commit ("drm/xe/uapi: Kill exec_queue_set_property") and is no
> > longer usable, struct drm_xe_exec_queue_set_property does not
> > exist anymore, so let's remove this.

my bad, sorry

> > 
> > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> 
> should probably be a fixup to that patch? Anyway,

no because it is in the uapi header that gets "copied" by the UMDs
and IGT already merged and Mesa likely... and we cannot do fixup
on their sides.

Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
> 
> Lucas De Marchi
> 
> > ---
> > include/uapi/drm/xe_drm.h | 1 -
> > 1 file changed, 1 deletion(-)
> > 
> > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > index dee750385161..346007e8074d 100644
> > --- a/include/uapi/drm/xe_drm.h
> > +++ b/include/uapi/drm/xe_drm.h
> > @@ -53,7 +53,6 @@ extern "C" {
> > #define DRM_IOCTL_XE_VM_BIND			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_VM_BIND, struct drm_xe_vm_bind)
> > #define DRM_IOCTL_XE_EXEC_QUEUE_CREATE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_CREATE, struct drm_xe_exec_queue_create)
> > #define DRM_IOCTL_XE_EXEC_QUEUE_DESTROY		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_DESTROY, struct drm_xe_exec_queue_destroy)
> > -#define DRM_IOCTL_XE_EXEC_QUEUE_SET_PROPERTY	DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_SET_PROPERTY, struct drm_xe_exec_queue_set_property)
> > #define DRM_IOCTL_XE_EXEC_QUEUE_GET_PROPERTY	DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_GET_PROPERTY, struct drm_xe_exec_queue_get_property)
> > #define DRM_IOCTL_XE_EXEC			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC, struct drm_xe_exec)
> > #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
> > -- 
> > 2.34.1
> > 
