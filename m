Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5225DC001B0
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jul 2023 18:02:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8C9410E084;
	Thu, 13 Jul 2023 18:02:58 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE47910E084
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Jul 2023 18:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689271376; x=1720807376;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=dzxi2NjdlnHdaj5Ujdg1voUbsf8f1+xkfT/NGkoPv50=;
 b=dJ0r4YawQAKfmXUX4wnG4d9B9akEr636f8zHK6DmZaZv0I2VSf0NvriT
 rVgtAU0jLxR1x+V3UFPMb0pMQ+ajvsZO5l8KXClQRYowKNPPffsm4OnQH
 s9Mpmsby+fKTjVkCUalczT49mrri/fhjdQNd2CW/5wCvQqjlJjHe9yajG
 uvSYBGZm9P+s4U+wZzTXbJK2ur8yX2BIzQJEupGFDoeNPq5jXisPD/tq6
 OQBILUEVsTXL+cZ0lxgomA0ouk1MJxsygpFdRArbYZX9xgBveeLaF6Kgy
 QghEeGmiRPe2gNY3Zd0u/4UIG2/sl5trbFPbglfEuUU541adiCZruM3gt A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="344867041"
X-IronPort-AV: E=Sophos;i="6.01,203,1684825200"; d="scan'208";a="344867041"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2023 11:02:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="787555669"
X-IronPort-AV: E=Sophos;i="6.01,203,1684825200"; d="scan'208";a="787555669"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga008.fm.intel.com with ESMTP; 13 Jul 2023 11:02:48 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 13 Jul 2023 11:02:48 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 13 Jul 2023 11:02:47 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.109)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 13 Jul 2023 11:02:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ApLg4mxVpf/e2ynaAlpeyEAsiSWZ8fuak+CTB3cHgr8E/Wm/EAWbxyf3RfvfbUDqdQzhOINXO4xN3ENbeO/dDAOhF13vC4y67vB3EVrQEAaIMnDxByTXFn8dEx3COzb5gmhOTmb/v2CIG6U5RGL0e+jodfsgCKghvLsGBh3FT3K/d2XUjqoLoLYkm8+g+9KeorosZ9D3SWpGVvcKs/zUYQJqNhH6lDkyos0faUmeOjrVh+p83H7VJD9pgWiJ8vfeCNSFoT0Y6uXYCI+Yw0LZVdWnnXfDixPu2AGs5tu+MF8ZgXFXBDMzq6tvORIXdGsLcQ03x5OkuORiRWmI8th6wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WOirEy1tftNxlv8SX1Nivom2Ksg251qDc5NI5uaHjGU=;
 b=IetFFjlYPnpkdwErZvrm99oiIEkubIJUWeCIiMsXo2tKAxE7eFTH9r+fipzLfrAdKaZPfBFe0Z9MigOrF+rj943Qkjyw1/Ac1C4XCAjOhnh/5ZGG7tOJX1xmpKmsjdyEnDYiyDJLdLx3v/eF2PkFOODY1VgqYPog5y6YQjrow0hqh30lc2QRW1jaUTic1SSGQV2WVNAaP2GagaBcWqp0Sj6zA2cd6+YM++ry4xHyV3g/oftL7QHD+0D6YXoQTpAg7IFVPrZCTkGWZl7XT1CVkddaZ8ZYZS/trkenacmzJRBvrtTGHJRiuOxOElSxGJSDNMJWA2N6ficG8nF7/0tQng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA3PR11MB7609.namprd11.prod.outlook.com (2603:10b6:806:319::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.20; Thu, 13 Jul
 2023 18:02:45 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::c65d:c846:f197:3ca5]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::c65d:c846:f197:3ca5%4]) with mapi id 15.20.6565.028; Thu, 13 Jul 2023
 18:02:45 +0000
Date: Thu, 13 Jul 2023 18:01:58 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <ZLA8FhYeV7kmnU93@DUT025-TGLU>
References: <20230710221544.1882405-1-matthew.brost@intel.com>
 <20230710221544.1882405-2-matthew.brost@intel.com>
 <0a878f99-dbf6-89ff-d570-3e5e9e83b5c6@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0a878f99-dbf6-89ff-d570-3e5e9e83b5c6@linux.intel.com>
X-ClientProxiedBy: BY5PR04CA0002.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::12) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA3PR11MB7609:EE_
X-MS-Office365-Filtering-Correlation-Id: 04df9dde-cf7d-4c35-956a-08db83cb5c06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RZozcp9NA8/sndjFciqk8DU9ca9SfMsq71/BciPG2+kQG9lqQj2mBwtzBm182n6GB6ANy+GoNDp0iKTfNOhuhMU6oRZlvCBKeQVuOX75K7dHMUG7IlwASQkRb2qZFZ2VeI84p1tWK8qCh8/IonZsIGzR7fPR2RTtOmFm3q5AooG9e30XKpnd83Dcx+/elIT5ZroQfav6/NvFVV3qd2KNUaI5VVfHs7d9E+pRm/ftmd0iOXKX8dw84CP3pt+FJWKZ1kY0axioetzc35/zlZmseXKN5l2TO/xTQXbsEzqkJ5KRK5Qy0FgfQor6GLLbzngO1Zf/hwbAGnenHICxZABQlVW/NsqZQez5mWKawgjBcChNqjM/ehjh0DFnqe/vmhPJV0lnuYNWjrqzkwp4294EvgH0kILm3OSfWQy2706vO3RtC6LARgyyq407r2um0pY+iIGLr+jV1D2HIYqU9mjl9+8pBKbKORqdMRTpEh9AkeM3lBkIf9fTngfjF1DDRi37wpDJvhNcsvm0F+RNVM2uoFIwfim6IZVcXYfDH5sh9m6LQhwmsdpl5np3QrGwShTW0+gI/+lH2yLydzU2cRmzK/iY6+VDf1q3/FQjZFzn9J9vHG8jvMe5iznCC36q+ra/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(136003)(376002)(39860400002)(346002)(396003)(366004)(451199021)(2906002)(33716001)(6512007)(82960400001)(38100700002)(66574015)(83380400001)(53546011)(26005)(186003)(86362001)(5660300002)(9686003)(6506007)(6666004)(8676002)(44832011)(8936002)(478600001)(66556008)(41300700001)(66946007)(66476007)(6916009)(316002)(4326008)(6486002)(309714004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?hlfmcLbB+gZE/zA/D4n4wne0qAr6B1VP+HW38cOysUZQUpuE6GYC93mPwk?=
 =?iso-8859-1?Q?N1P/kHdbbuz/t2wG1EPAUcJ2iLiLf5pwA40nvG/DwKSJwpI5OG+45beZjG?=
 =?iso-8859-1?Q?vcPfivNhXyALTQ7mxuBSOkZeQEbHs7MORYoNkMlTMV4ZIIwUBWy45m21xF?=
 =?iso-8859-1?Q?hdyrI0J9LD+Exl+nSu/sSL4mwW4OeTQJbkfagPnJycFnd8smHrBlE0nypX?=
 =?iso-8859-1?Q?ZsGeH0e2aIFnl9JA/z3d/L7zkVylPTfrtmCkTtU8WaQQWFqp5O0zfglVTZ?=
 =?iso-8859-1?Q?p0Puwf4A5KWlPeoHBoJTLMfaChbGzGak38FJq7WB7XZvM8Q/96iil7j6Lr?=
 =?iso-8859-1?Q?a+AAfYfc0Xx2SQqk4lXtKQ8gjUUkO7DALZ4A+dJYndkcIeCIUfggBGx36w?=
 =?iso-8859-1?Q?DYp6IuZimVTOpxSZQNtnrKXuFMpSgf3RkuXbbQJvBxyUm/P/he2W00qaET?=
 =?iso-8859-1?Q?0iIoOX0fgEhTC0YVwPcAtUJfhgjLjgOnwPIoV6WjS+JZlEDyGZ6Ry0D403?=
 =?iso-8859-1?Q?OGV2tAtcZx5bkAsIqNqRKpMHjfihV7zwda6OhFN+0HGF0GIFBti9dVFR+4?=
 =?iso-8859-1?Q?wA0CcarluRP3j9ISM4Im3DW4RO0q2L1GN8akMrs1SJ5S0x/budu46UE7Hx?=
 =?iso-8859-1?Q?Hh3kGztTqst4IZZDT4cqAKMtmH9798za2VBtfgTdS76x32dQvCdNACmcK9?=
 =?iso-8859-1?Q?cZXCNRN9Z29TVbDSOVTKwlYdv+CeQ0thBMtm5moB3lDQwKxfilBX8thSSA?=
 =?iso-8859-1?Q?XPo/S8zozrSTJd3ulFZkGp2prUB8lfoGrhKBmnIhLLSehZt7999HevV85W?=
 =?iso-8859-1?Q?SFVWbTcJHuccd0wQN+vumpy+eWrPUWfBV4rhR0M/KVmwsfFIsa8imPoQNQ?=
 =?iso-8859-1?Q?Wb4wPvVP+PpEHItWn+JdhS8F5vvGcVy/XHf+RNW9ai1XkjmgU0jwlf4L+s?=
 =?iso-8859-1?Q?YX+YzL4y76a28vdCF4jJqzYOv2pAoXBSNRU2YZfnvVntt2uyWLr+ODaK/k?=
 =?iso-8859-1?Q?+GRcPfX/RJNrA4hSUya8FAuQKPdGoHzyJgszXv6aUH647UR6Xn04Wo26VV?=
 =?iso-8859-1?Q?H1v2RwpUNXgYIe2upho1r3hlTQaidbb8ckBiPsvLgfdUc6AKAhZ9ZiHP+v?=
 =?iso-8859-1?Q?JDeo+H2I04PJ7PhoPF22g3Q9/DndB9PpI3rkduNuF6jrnybdXHP2N8P2c6?=
 =?iso-8859-1?Q?nJ1vAnBKWtSVxa9vjy+QL92e2GWaZEDCIjhIFvBlgsbx22yABjNZAl9xRa?=
 =?iso-8859-1?Q?oD+7hcaUXucA9KDP/6P3BZmD3exQtE7sM8wEdYKSD/SnjH/WVlSyTzbhnb?=
 =?iso-8859-1?Q?gIPk+9BOpHrpuJBIRfXqoELmW5yp8u9C4ZV3hrYDgRUmZzCfiqcaVK78dI?=
 =?iso-8859-1?Q?FuBDcHcg/dgIe3zD33Xbj0+KeAy6n4R/MxTKuDiGyVTY99hPTuYEDPo7Zc?=
 =?iso-8859-1?Q?xfgOdpwBLlMCHi3yTAR7GeDitJL6L7yBW+FfuP8uPc21D0RgMGYDISKFlL?=
 =?iso-8859-1?Q?yFipekJDXqzMU0pwaZfNEabLFN7gyvHLu2Aw/sAYMWjvu0AXlu054umYzH?=
 =?iso-8859-1?Q?qkra3RCxvfjrYo6zuMvxGNtIYbzNpPKK+r7GBlcOmYHRodrdFwqbtVNjT3?=
 =?iso-8859-1?Q?dYaXMAri11kyrAhq/cvoHlj6HZjTB1RAFAxgieBI3M2EHh0Eb01KZAqA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 04df9dde-cf7d-4c35-956a-08db83cb5c06
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2023 18:02:45.5876 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /szbB+LjqigGJ0Jp5ju5IyVJNRjuOVCMX2s8zNbxhGBlM4QJOPBIDTrpCCoeRk8EduGhnlJfq1mLIyesqVPT3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7609
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe: Introduce a range-fence utility
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

On Tue, Jul 11, 2023 at 03:27:16PM +0200, Maarten Lankhorst wrote:
> Hey,
> 
> On 2023-07-11 00:15, Matthew Brost wrote:
> > From: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > 
> > Add generic utility to track range conflicts signaled by a dma-fence.
> > Tracking implemented via an interval tree. An example use case being
> > tracking conflicts for pending (un)binds from multiple bind engines. By
> > being generic ths idea would this could moved to the DRM level and used
> > in multiple drivers for similar problems.
> > 
> > Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > ---
> >   drivers/gpu/drm/xe/Makefile         |   1 +
> >   drivers/gpu/drm/xe/xe_range_fence.c | 136 ++++++++++++++++++++++++++++
> >   drivers/gpu/drm/xe/xe_range_fence.h |  78 ++++++++++++++++
> >   3 files changed, 215 insertions(+)
> >   create mode 100644 drivers/gpu/drm/xe/xe_range_fence.c
> >   create mode 100644 drivers/gpu/drm/xe/xe_range_fence.h
> > 
> > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> > index 336f0eb8f91e..c2cf86002bff 100644
> > --- a/drivers/gpu/drm/xe/Makefile
> > +++ b/drivers/gpu/drm/xe/Makefile
> > @@ -90,6 +90,7 @@ xe-y += xe_bb.o \
> >   	xe_pt.o \
> >   	xe_pt_walk.o \
> >   	xe_query.o \
> > +	xe_range_fence.o \
> >   	xe_reg_sr.o \
> >   	xe_reg_whitelist.o \
> >   	xe_rtp.o \
> > diff --git a/drivers/gpu/drm/xe/xe_range_fence.c b/drivers/gpu/drm/xe/xe_range_fence.c
> > new file mode 100644
> > index 000000000000..72d75e78c621
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_range_fence.c
> > @@ -0,0 +1,136 @@
> > +// SPDX-License-Identifier: MIT
> > +/*
> > + * Copyright © 2023 Intel Corporation
> > + */
> > +
> > +#include <linux/dma-fence.h>
> > +#include <linux/interval_tree_generic.h>
> > +#include <linux/slab.h>
> > +
> > +#include "xe_macros.h"
> > +#include "xe_range_fence.h"
> > +
> > +#define XE_RANGE_TREE_START(_node)	((_node)->start)
> > +#define XE_RANGE_TREE_LAST(_node)	((_node)->last)
> > +
> > +INTERVAL_TREE_DEFINE(struct xe_range_fence, rb, u64, __subtree_last,
> > +		     XE_RANGE_TREE_START, XE_RANGE_TREE_LAST,
> > +		     , xe_range_fence_tree);
> > +
> > +static void
> > +xe_range_fence_signal_notify(struct dma_fence *fence, struct dma_fence_cb *cb)
> > +{
> > +	struct xe_range_fence *rfence = container_of(cb, typeof(*rfence), cb);
> > +	struct xe_range_fence_tree *tree = rfence->tree;
> > +
> > +	llist_add(&rfence->link, &tree->list);
> > +}
> > +
> > +static bool __xe_range_fence_cleanup(struct xe_range_fence_tree *tree)
> > +{
> > +	struct llist_node *node = llist_del_all(&tree->list);
> > +	struct xe_range_fence *rfence, *next;
> > +
> > +	llist_for_each_entry_safe(rfence, next, node, link) {
> > +		xe_range_fence_tree_remove(rfence, &tree->root);
> > +		dma_fence_put(rfence->fence);
> > +		kfree(rfence);
> > +	}
> > +
> > +	return !!node;
> > +}
> > +
> > +/**
> > + * xe_range_fence_cleanup() - Cleanup range fence tree
> > + * @tree: range fence tree
> > + */
> > +void xe_range_fence_cleanup(struct xe_range_fence_tree *tree)
> > +{
> > +	(void)__xe_range_fence_cleanup(tree);
> > +}
> > +
> > +/**
> > + * xe_range_fence_insert() - range fence insert
> > + * @tree: range fence tree to insert intoi
> > + * @rfence: range fence
> > + * @ops: range fence ops
> > + * @start: start address of range fence
> > + * @last: last address of range fence
> > + * @fence: dma fence which signals range fence can be removed + freed
> > + *
> > + * Return: 0 on success, non-zero on failure
> > + */
> > +int xe_range_fence_insert(struct xe_range_fence_tree *tree,
> > +			  struct xe_range_fence *rfence,
> > +			  const struct xe_range_fence_ops *ops,
> > +			  u64 start, u64 last, struct dma_fence *fence)
> > +{
> > +	int err = 0;
> > +
> > +	(void)__xe_range_fence_cleanup(tree);
> Is that void cast needed here? Should be safe to ignore return value
> regardless.

That is what I thought too, Thomas is out taking over this. Will remove
in next rev. 

> > +
> > +	if (dma_fence_is_signaled(fence))
> > +		goto free;
> > +
> > +	rfence->ops = ops;
> > +	rfence->start = start;
> > +	rfence->last = last;
> > +	rfence->tree = tree;
> > +	rfence->fence = dma_fence_get(fence);
> > +	err = dma_fence_add_callback(fence, &rfence->cb,
> > +				     xe_range_fence_signal_notify);
> > +	if (err == -ENOENT) {
> > +		dma_fence_put(fence);
> > +		err = 0;
> > +		goto free;
> > +	} else if (err == 0) {
> > +		xe_range_fence_tree_insert(rfence, &tree->root);
> > +		return 0;
> > +	}
> > +
> > +free:
> > +	if (ops->free)
> > +		ops->free(rfence);
> > +
> > +	return err;
> > +}
> > +
> > +static void xe_range_fence_tree_remove_all(struct xe_range_fence_tree *tree)
> > +{
> > +	struct xe_range_fence *rfence;
> > +	bool retry = true;
> > +
> > +	rfence = xe_range_fence_tree_iter_first(&tree->root, 0, U64_MAX);
> > +	while (rfence) {
> > +		/* Should be ok with the minimalistic callback */
> > +		if (dma_fence_remove_callback(rfence->fence, &rfence->cb))
> > +			llist_add(&rfence->link, &tree->list);
> > +		rfence = xe_range_fence_tree_iter_next(rfence, 0, U64_MAX);
> > +	}
> > +
> > +	while (retry)
> > +		retry = __xe_range_fence_cleanup(tree);
> > +}
> > +
> > +/**
> > + * xe_range_fence_tree_init() - Init range fence tree
> > + * @tree: range fence tree
> > + */
> > +void xe_range_fence_tree_init(struct xe_range_fence_tree *tree)
> > +{
> > +	memset(tree, 0, sizeof(*tree));
> > +}
> > +
> > +/**
> > + * xe_range_fence_tree_fini() - Fini range fence tree
> > + * @tree: range fence tree
> > + */
> > +void xe_range_fence_tree_fini(struct xe_range_fence_tree *tree)
> > +{
> > +	xe_range_fence_tree_remove_all(tree);
> > +	XE_WARN_ON(!RB_EMPTY_ROOT(&tree->root.rb_root));
> > +}
> > +
> > +const struct xe_range_fence_ops xe_range_fence_kfree_ops = {
> > +	.free = (void (*)(struct xe_range_fence *rfence)) kfree,
> > +};
> > diff --git a/drivers/gpu/drm/xe/xe_range_fence.h b/drivers/gpu/drm/xe/xe_range_fence.h
> > new file mode 100644
> > index 000000000000..d6a22eeb0158
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_range_fence.h
> > @@ -0,0 +1,78 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright © 2023 Intel Corporation
> > + */
> > +
> > +#ifndef _XE_RANGE_FENCE_H_
> > +#define _XE_RANGE_FENCE_H_
> > +
> > +#include <linux/dma-fence.h>
> > +#include <linux/rbtree.h>
> > +#include <linux/types.h>
> > +
> > +struct xe_range_fence_tree;
> > +struct xe_range_fence;
> > +
> > +/** struct xe_range_fence_ops - XE range fence ops */
> > +struct xe_range_fence_ops {
> > +	/** @free: free range fence op */
> > +	void (*free)(struct xe_range_fence *rfence);
> > +};
> Could we  keep the definitions private as much as possible?

Like move to a types file?

> > +
> > +/** struct xe_range_fence - XE range fence (address conflict tracking) */
> > +struct xe_range_fence {
> > +	/** @rb: RB tree node inserted into interval tree */
> > +	struct rb_node rb;
> > +	/** @start: start address of range fence is interval tree */
> > +	u64 start;
> > +	/** @last: last address (inclusive) of range fence is interval tree */
> > +	u64 last;
> > +	/** @__subtree_last: interval tree internal usage */
> > +	u64 __subtree_last;
> > +	/**
> > +	 * @fence: fence signals address in range fence no longer has conflict
> > +	 */
> > +	struct dma_fence *fence;
> > +	/** @tree: interval tree which range fence belongs to */
> > +	struct xe_range_fence_tree *tree;
> > +	/**
> > +	 * @cb: callback when fence signals to remove range fence free from interval tree
> > +	 */
> > +	struct dma_fence_cb cb;
> > +	/** @link: used to defer free of range fence to non-irq context */
> > +	struct llist_node link;
> > +	/** @ops: range fence ops */
> > +	const struct xe_range_fence_ops *ops;
> > +};
> > +
> > +/** struct xe_range_fence_tree - interval tree to store range fences */
> > +struct xe_range_fence_tree {
> > +	/** @root: interval tree root */
> > +	struct rb_root_cached root;
> > +	/** @list: list of pending range fences to be freed */
> > +	struct llist_head list;
> > +};
> > +
> > +extern const struct xe_range_fence_ops xe_range_fence_kfree_ops;
> > +
> > +struct xe_range_fence *
> > +xe_range_fence_tree_iter_first(struct rb_root_cached *root, u64 start,
> > +			       u64 last);
> > +
> > +struct xe_range_fence *
> > +xe_range_fence_tree_iter_next(struct xe_range_fence *rfence,
> > +			      u64 start, u64 last);
> > +
> > +void xe_range_fence_tree_cleanup(struct xe_range_fence_tree *tree);
> > +
> > +void xe_range_fence_tree_init(struct xe_range_fence_tree *tree);
> > +
> > +void xe_range_fence_tree_fini(struct xe_range_fence_tree *tree);
> > +
> > +int xe_range_fence_insert(struct xe_range_fence_tree *tree,
> > +			  struct xe_range_fence *rfence,
> > +			  const struct xe_range_fence_ops *ops,
> > +			  u64 start, u64 end,
> > +			  struct dma_fence *fence);
> > +
> > +#endif
> 
> Cheers,
> 
> ~Maarten

Thanks for the comments, can you look at 2nd patch in this series?

Matt

> 
