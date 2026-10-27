Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2183F606A329
	for <intel-xe@archiver.kernel.org>; Tue, 27 Oct 2026 23:44:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAD2810E4EC;
	Tue, 27 Oct 2026 23:43:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 516F610E4EC
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Oct 2026 23:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793144633; x=1824680633;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=QKrwZbQL+5sxv27ExnqP1i3PTYlgmHgREMvhrzvsX/Q=;
 b=CMYs+BKOvcr8KqNFyx1kJEtBWCfWTUDH1++GgXSrzHuIkrP724ohuoia
 GTonfKML6hN4cuTC/UjXf5VWodjPWHl73gnnyv7t8bXkfLUe8B/K2Iwob
 kXu6XiaiSfNRhUIyuMTAOoE7XRfGy5QDDnraCre91I1xkRAzvcoS5PvQd
 cTctMjTAZr+3C+At79oKrRrGUxDG5MuNvT69MAh6LQzpGO37BFeMnDGAJ
 Hi/dMbOT7XUiaw6eR/VfjL9g/BD08bpFwlAq19yF0/5HW5TTZhwXMNK6F
 563wH99dbk4C+pG9VltXXGFgnw8gBrLPVdHS5b8VUKLO+toZsjfReOiNG w==;
X-CSE-ConnectionGUID: U20bpL1ORSKroTMTIXX1xQ==
X-CSE-MsgGUID: C3dTARolRF6HJuaqAHyaHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1741528"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1741528"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 16:43:44 -0700
X-CSE-ConnectionGUID: qLIHcfjPQCm7lPov4Z7WvA==
X-CSE-MsgGUID: URqMtGKsSC608oVliPC/TQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="5041507"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 16:43:45 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 16:43:43 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 27 Oct 2026 16:43:43 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.25) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 16:43:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bre5/ZptfP8SUAHQClzX6XsPJ9TyyhOXJ98Hbulvzmz24dMcJsTQfx4l442GYqZD2VHK4KYe3VlcO8zVBv1aVjKar+loExPJYhKYaLU+I9Sl7lgBdRl8Io+gixL2ILUpvkiBsBrF14iLvlmKkQ/DuxQi+xEm3rY/fc4EJmzW/RJ5BA98uW4428JIPA6Wgcrqsbmg0Ph+IsmE3Jy58HSbT4d4W82BYW8xhGcLNMRtr0EGr+9/r1No8voiwRjN0DCwVk1bdNu9b+p2RzHi+Xd477nhQM+BTGB7cXgD0Dsz+fZ9pQGtZ8X2HiKtEylar7Int9J0mU1oL7r5cOgsdtUpSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=blAN4vaAMXNiOFOUIgbtmp3slBKcCU/uwOgJ+Je+Evs=;
 b=TMdomc9sm5l4kJL+cm7jsq6CyugEn27qsxBS+/Hy0iKAsfRx4K2LEJes1Ni5ecwVNIgmPccET9vA1oP8NnDQ6d1zxZmLJu9E2pCAckPOrixnzP0jFWAOLxOwmElFCzJaEEYwyQ5CVdUCykhZ4HR65fLEfjL9ug0F7yhhT/dDfSdDdITw7B/klHgKQ43PX/STgt3OyVU/vuv+kARGIxuBFkGwYqRKWlUamwvavuetQ3Oh956zWjdZLkN8ewz/6Y+vndTN0PN4zZvwejyjHwD9xUReCBGh07z7Lkhqbk2hriY6ua5UPYT2Hd59S9iZFDylWI5AWiPy8zSsf/TYu6Ncug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4787.namprd11.prod.outlook.com (2603:10b6:303:95::23)
 by DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 23:43:34 +0000
Received: from CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd]) by CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd%4]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 23:43:34 +0000
Date: Tue, 27 Oct 2026 16:43:32 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
CC: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 3/3] drm/xe: Memset g2g buffer on resume
Message-ID: <auE3JKCsUzXk2Ph0@gsse-cloud1.jf.intel.com>
References: <20261023111832.218750-5-vinay.belgaumkar@intel.com>
 <20261023111832.218750-8-vinay.belgaumkar@intel.com>
 <482083e4-150e-4210-942d-b941e7c17b69@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <482083e4-150e-4210-942d-b941e7c17b69@intel.com>
X-ClientProxiedBy: MW3PR06CA0012.namprd06.prod.outlook.com
 (2603:10b6:303:2a::17) To CO1PR11MB4787.namprd11.prod.outlook.com
 (2603:10b6:303:95::23)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4787:EE_|DS0PR11MB7312:EE_
X-MS-Office365-Filtering-Correlation-Id: 04cfcd61-684e-4470-f7f7-08df34841d6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|261009223027099003|261022105027099003|56012099006|261021121427099003|261021123027099003|261022075727099003|10067099003|261026121527099003|6133799003|22082099003|18002099003|4143699003|11063799006|5023799004|261026140227099003;
X-Microsoft-Antispam-Message-Info: ZefBpwW1UEHBKO+N9r2XM/6T40uNgqO4ih12D805/Iw5XHkvXWU/mktTQu2d6wAjjMfvk7rF4nk+5dYkcauMn0Tsu/KykEr+TxuYCxpaWFKl5WxrgsVGwYYKFBCMcEgTk6Rlrw0+xkZmJLF5VuqJvQHm1QzsgPht3pAeQ8AL3G4d8CdYoHOsRDy67wg0HCYyCjps6vwTm2SpdYsV8WF0f5wvz4/4LmsDT+uPUkhUCSgScmIwVS/MWkT5m4JacrtEntBONFC7w0iRxIaI9AXU1+BO/QoAJq3B4lcXsZV/kf8Pczej7qkurWJZzgayzhv9EWRCXsZoEyVO5x57Wad2rDj1yxqt4GRscF0INNHc80OhteaqT0Txe0wbLm1EjJzcNyFe6lo2rg977QQWSrvstYK8oWNucfQakw2SFc3hhOInA02caWjh9KUazJ9BtmLuAj/YhKvwraTtQx61/3jzH3CgQ7GmDxyujmo68llP2lKQFs9VSi2muAySsQwWjRAHYxf/3wpfC6lepKXFEQDBi4docOrBHiw0WzErLZF6TJyqtC3n3VHSFVFA6cg2nWWD1X1Iww3jFexrzwVvSCbvYeFuDPjSVt0lhT3jfnbLwNM2QYlhZfVX4/vrj8vu+sJUwxhtx4vfommKgiJknH9EmoH+jEWkRV2BNXf8cDMkrmM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4787.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(261009223027099003)(261022105027099003)(56012099006)(261021121427099003)(261021123027099003)(261022075727099003)(10067099003)(261026121527099003)(6133799003)(22082099003)(18002099003)(4143699003)(11063799006)(5023799004)(261026140227099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8GWXS7W9LoVpyUcgytALYzFLEg5DinjtoBhoNu+RozpnEzYx0HXfhpJN9kbI?=
 =?us-ascii?Q?dmAbYOwLsTGA17FrJZfBPoteoU0u/+Hb0/1dskcwPygcMDOg25EjtzCy+1jD?=
 =?us-ascii?Q?JhtPxWpuApM5oFzVJeseWmSLQPH7BFaoSpGDsA/2kmzmDTuYfQUdTZ0Q31kh?=
 =?us-ascii?Q?4vKKiPjvbNZ6ScNdGmwGJL2ibH/K7w6bTqPU6uuZPs98vPckw3hvMIe2Oq9J?=
 =?us-ascii?Q?qL4iO8GKYawR9Stq2mI21SXfia8opK2Nv72m8r8YQR7A6hkmq+5YkqQ8knXI?=
 =?us-ascii?Q?DQxYQHkFYcfhf3XGHZ2OdeensyDE8n5iDjlzAM1j9UhNGeALFM+IieGTE5Lb?=
 =?us-ascii?Q?91hssRY2rb8tk7ev+c2K1rQWoQprZNVJ2dtgllvHrNWZ5cSr31c1oUGpFJ6a?=
 =?us-ascii?Q?VuS1tTkkMNk3fSmGpzmOZ9rfa1Z+RShOpqldAfkvY+nf1VdItqUjjpdza6cj?=
 =?us-ascii?Q?5Y3EiBLPt9Lq91OE+kam8G7tAR/ijd3wQnIL2ihoRkbi/CGHfoDZ9Q1EgIzT?=
 =?us-ascii?Q?jVedCIKohLjU/3q/E2t4zQ7YzPD6myehQRu6WS/RUAtIOcjukKbcEB9Rp9rC?=
 =?us-ascii?Q?VjQRpxR48dQtmLO+NL6nEC66BgBtz3uUHK8vhgTIlFSCN/FzyqjrJdXDPMzi?=
 =?us-ascii?Q?X7XdRdwjtoxbJBDp0PJlCvCWwrem1YW8hPOfXNNeDByQoI+kEOP7N4BC+60k?=
 =?us-ascii?Q?qzPPk0U99KIoTjPir4zmtKEU11PGQs30lvXvQ5qde3UMe1GQUKZdG3iYJe4d?=
 =?us-ascii?Q?xHLlMI2p2TgE4nC/+czByUFVo7IQ87/97Fb8efmf3Esg6AM2WV6Pk60AX/+0?=
 =?us-ascii?Q?KRXqVth8d//xP6/GlvpG1MZIQ8MJMXx6s+LKiWON9e+suqVPisUAtfmTsNoS?=
 =?us-ascii?Q?xjvR7t02Dxd7wA3r8/NyE9CLiUJdttSRWxQfst5K1hQYlY00I1kaX2tazLr2?=
 =?us-ascii?Q?1va/bfoINb0A4t26C7PmuVagcR8kdpNXNBw1RNeuSSQ6HFooNmwQt9m7sDup?=
 =?us-ascii?Q?h5ik6WbHMNx0dV2dMINXf3txmgKeum+WfHZ7kgI2blUhjjkBTMGhpKb5d9My?=
 =?us-ascii?Q?naBdcov1RLpzBagXzOJ38zLDmGRLlWw1Cf9azB9Q7J4EQFuopSA9eqcvpgWz?=
 =?us-ascii?Q?ph4gn/wSAeoANIWo+lwjTQtoOEZoLyN9k2Qiq2LbiI9mAdLVqwHVmEFmcZvU?=
 =?us-ascii?Q?w/31jkt91EkMNMuXfpsti/2mM4/uBppAXFwsQk5RZUF3b21ljhNk54HJJCVc?=
 =?us-ascii?Q?K/2ScFwltevKLKsxiecfxo9kRyt8Jqk9YLCA1cby7J9Jzb+aIOBbTRCa1K8Y?=
 =?us-ascii?Q?Cp+UzYE2j6n4ibebzIHVE07wabxOXovDElTQ7qi4WHq/C+662RdiwCGRgxxW?=
 =?us-ascii?Q?Ivj2gyR82teUrBzS80jVUHy6YZ/KPtR2KuKzSxeYMWqRRdhjqECEfmf9qHCc?=
 =?us-ascii?Q?cZ3AVSBAgoN6R2aI4vfeL85m2f3J3Ge4JMYTtaxycoNd4v4vXZyIBizYwba6?=
 =?us-ascii?Q?NhYl2hd9XMJ6RrjY8MiVq05XjzlIRy36Z0dOIXvEA+PqHq5OPnU9B+cU8tDX?=
 =?us-ascii?Q?VOojXXo+rOOmHAXSL3T5mWBzrchYOnbd/nA//p7WCuBXP8x+f+1sLpzXDUHm?=
 =?us-ascii?Q?oZSh5LK61gbDWvB0rfa72rYXlCESZfPqgwd8Ba4MF56l2mXtrl0gECQuOHhX?=
 =?us-ascii?Q?6blc8+lGzW2ZxOlSApSCFlE1zjPr6C4+igvrPzkO8R08Ci9ry6R2ZX2aa1er?=
 =?us-ascii?Q?8Z1yBiN9GYImySOIZv3/Xg84OruReso=3D?=
X-Exchange-RoutingPolicyChecked: usA1D7x5hG6gLdJf/bLGLE/NaV5VhhhJa6W+1/soH+90XhvITyENlkHuAC5YmoneJLtzRshhAVXhpjWIjve7UckP4kdnqHmvW1N5+OvG2ZcpXrfE/UTiTTmNYlS8HDgOBbnNepld9+xiZFUQtK3j6U0o/Ztsu7xP8bWTLvCixhbUsrn9cq3A+BdgWx12HihvetOMvtZu782mWxOidHTw4qqDY7G1wmyJ9RY1nqI6EEuok5nKOXzfRlp6fe2Fi+Uq52ssYfE+joBphEJXMcdiSrGWeLPlGF8L37y2AufOA7OYyp5Dr2HOnoRFuxEkQDuKzHvnYGhB8DPBn+XRBw7XIA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 04cfcd61-684e-4470-f7f7-08df34841d6f
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4787.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 23:43:34.5184 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5AhBuk8ZtpFDXXstdMN8TDlB7+hhrqz+c2yCSxP3j+uhcgMIvuqrpr69k7q5CEpAB176U7UD+1zlhF94ZRSUmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7312
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 27, 2026 at 04:19:49PM -0700, Ceraolo Spurio, Daniele wrote:
> 
> On 10/23/2026 4:18 AM, Vinay Belgaumkar wrote:
> > KMD creates this buffer for use by GuC, it is also responsible for zeroing
> > it during resume. The buffer is marked as XE_BO_FLAG_PINNED_NORESTORE,
> > so we cannot trust its contents after a suspend cycle. This commit adds
> > xe_*_resume_early() functions for handling this and the C6 disable
> > during resume.
> > 
> > v2: Maintain layering with _early functions for gt/uc/ct (Matt Brost)
> > 
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> > Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_gt.c     | 14 +++++++++++++-
> >   drivers/gpu/drm/xe/xe_gt.h     |  1 +
> >   drivers/gpu/drm/xe/xe_guc_ct.c | 16 ++++++++++++++++
> >   drivers/gpu/drm/xe/xe_guc_ct.h |  1 +
> >   drivers/gpu/drm/xe/xe_pm.c     |  4 ++--
> >   drivers/gpu/drm/xe/xe_uc.c     | 15 +++++++++++++++
> >   drivers/gpu/drm/xe/xe_uc.h     |  1 +
> >   7 files changed, 49 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > index 60d35ada2853..96b5702347c1 100644
> > --- a/drivers/gpu/drm/xe/xe_gt.c
> > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > @@ -50,7 +50,6 @@
> >   #include "xe_lmtt.h"
> >   #include "xe_log.h"
> >   #include "xe_lrc.h"
> > -#include "xe_map.h"
> 
> This seems unrelated to this patch
> 
> >   #include "xe_migrate.h"
> >   #include "xe_mmio.h"
> >   #include "xe_pagefault.h"
> > @@ -1093,6 +1092,19 @@ int xe_gt_sanitize_freq(struct xe_gt *gt)
> >   	return ret;
> >   }
> > +/**
> > + * xe_gt_resume_early() - Early init for GT resume
> > + * @gt: the GT object
> > + *
> > + * Handles GT related init before GT restart after a suspend cycle.
> > + */
> > +void xe_gt_resume_early(struct xe_gt *gt)
> > +{
> > +	xe_gt_idle_disable_c6(gt);
> > +
> > +	xe_uc_resume_early(&gt->uc);
> > +}
> > +
> >   int xe_gt_resume(struct xe_gt *gt)
> >   {
> >   	int err;
> > diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> > index 7b6952fe804c..7d292f9d0be7 100644
> > --- a/drivers/gpu/drm/xe/xe_gt.h
> > +++ b/drivers/gpu/drm/xe/xe_gt.h
> > @@ -58,6 +58,7 @@ void xe_gt_record_user_engines(struct xe_gt *gt);
> >   void xe_gt_suspend_prepare(struct xe_gt *gt);
> >   int xe_gt_suspend(struct xe_gt *gt);
> >   void xe_gt_shutdown(struct xe_gt *gt);
> > +void xe_gt_resume_early(struct xe_gt *gt);
> >   int xe_gt_resume(struct xe_gt *gt);
> >   void xe_gt_reset_async(struct xe_gt *gt);
> >   int xe_gt_runtime_resume(struct xe_gt *gt);
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> > index d42f0133c1eb..435b10c29e24 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > @@ -863,6 +863,22 @@ void xe_guc_ct_runtime_suspend(struct xe_guc_ct *ct)
> >   	xe_guc_ct_disable(ct);
> >   }
> > +/**
> > + * xe_guc_ct_resume_early() - Early init for GuC CT resume
> > + * @ct: the &xe_guc_ct
> > + *
> > + * CT init before GT restart after a suspend cycle.
> > + */
> > +void xe_guc_ct_resume_early(struct xe_guc_ct *ct)
> > +{
> > +	struct xe_guc *guc = ct_to_guc(ct);
> > +	struct xe_device *xe = ct_to_xe(ct);
> > +
> > +	/* clear the g2g buffer which is marked as NORESTORE during alloc */
> > +	if (guc->g2g.bo && guc->g2g.owned)
> > +		xe_map_memset(xe, &guc->g2g.bo->vmap, 0, 0, xe_bo_size(guc->g2g.bo));
> 
> g2g has nothing to do with CT, so this should just be xe_guc_resume_early in
> xe_guc.c.
> 

Yes, this was my bad. I though the g2g was allocated in CT and suggested
this. Daniele is right.

Matt

> Daniele
> 
> > +}
> > +
> >   /**
> >    * xe_guc_ct_runtime_resume() - GuC CT runtime resume
> >    * @ct: the &xe_guc_ct
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
> > index f3af15c95c75..3470ced126de 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ct.h
> > +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
> > @@ -20,6 +20,7 @@ int xe_guc_ct_init_post_hwconfig(struct xe_guc_ct *ct);
> >   int xe_guc_ct_enable(struct xe_guc_ct *ct);
> >   int xe_guc_ct_restart(struct xe_guc_ct *ct);
> >   void xe_guc_ct_disable(struct xe_guc_ct *ct);
> > +void xe_guc_ct_resume_early(struct xe_guc_ct *ct);
> >   void xe_guc_ct_runtime_resume(struct xe_guc_ct *ct);
> >   void xe_guc_ct_runtime_suspend(struct xe_guc_ct *ct);
> >   void xe_guc_ct_stop(struct xe_guc_ct *ct);
> > diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> > index 1f5097875bcd..89d64aa6577d 100644
> > --- a/drivers/gpu/drm/xe/xe_pm.c
> > +++ b/drivers/gpu/drm/xe/xe_pm.c
> > @@ -249,7 +249,7 @@ int xe_pm_resume(struct xe_device *xe)
> >   		return err;
> >   	for_each_gt(gt, xe, id)
> > -		xe_gt_idle_disable_c6(gt);
> > +		xe_gt_resume_early(gt);
> >   	xe_display_pm_resume_early(xe);
> > @@ -703,7 +703,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
> >   			goto out;
> >   		for_each_gt(gt, xe, id)
> > -			xe_gt_idle_disable_c6(gt);
> > +			xe_gt_resume_early(gt);
> >   		xe_display_pm_resume_early(xe);
> > diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> > index 686c28856014..2dfd525dce6f 100644
> > --- a/drivers/gpu/drm/xe/xe_uc.c
> > +++ b/drivers/gpu/drm/xe/xe_uc.c
> > @@ -12,6 +12,7 @@
> >   #include "xe_gt_printk.h"
> >   #include "xe_gt_sriov_vf.h"
> >   #include "xe_guc.h"
> > +#include "xe_guc_ct.h"
> >   #include "xe_guc_pc.h"
> >   #include "xe_guc_rc.h"
> >   #include "xe_guc_engine_activity.h"
> > @@ -297,6 +298,20 @@ int xe_uc_suspend(struct xe_uc *uc)
> >   	return xe_guc_suspend(&uc->guc);
> >   }
> > +/**
> > + * xe_uc_resume_early() - Early init for UC resume
> > + * @uc: the UC object
> > + *
> > + * UC init before a GT restart during resume.
> > + */
> > +void xe_uc_resume_early(struct xe_uc *uc)
> > +{
> > +	if (!xe_device_uc_enabled(uc_to_xe(uc)))
> > +		return;
> > +
> > +	xe_guc_ct_resume_early(&uc->guc.ct);
> > +}
> > +
> >   /**
> >    * xe_uc_runtime_suspend() - UC runtime suspend
> >    * @uc: the UC object
> > diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
> > index 23bc0ce1c42f..3c56327fb3f9 100644
> > --- a/drivers/gpu/drm/xe/xe_uc.h
> > +++ b/drivers/gpu/drm/xe/xe_uc.h
> > @@ -13,6 +13,7 @@ int xe_uc_init(struct xe_uc *uc);
> >   int xe_uc_init_post_hwconfig(struct xe_uc *uc);
> >   int xe_uc_load_hw(struct xe_uc *uc);
> >   int xe_uc_reset_prepare(struct xe_uc *uc);
> > +void xe_uc_resume_early(struct xe_uc *uc);
> >   void xe_uc_runtime_resume(struct xe_uc *uc);
> >   void xe_uc_runtime_suspend(struct xe_uc *uc);
> >   void xe_uc_stop_prepare(struct xe_uc *uc);
