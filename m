Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FEF3C77B73
	for <intel-xe@archiver.kernel.org>; Fri, 26 May 2023 21:48:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0FB310E0D6;
	Fri, 26 May 2023 21:48:27 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D90410E0D6
 for <intel-xe@lists.freedesktop.org>; Fri, 26 May 2023 21:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685137707; x=1716673707;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=3bwva2eplT5eYmbsejqeZszRpmphoXtL78xcnJeQr0Y=;
 b=LgNzKOX8bvuRYPlpGw1T9uAyCVibACdp3COHZc27QAJIEDXES1NYQyDB
 11lrZkGilYScCS2k31bV7/8Bo3aRYwRdqSL/nxPF7Ysgpd8x+lr0EVPdK
 lQTtsqsWyuk0yxMwVuoHKZUrBabcJb4IZcZn2lQ5pAPiYf5QnW4i2OyKp
 lb7TmUAxRAdmOyP7C8Rwu3D7hXB0XA0YxtpHYdKP8ITnludhZ58yloP4e
 qAlrpI+2u5ddXK2XrzWE2mOhhx71y/KWGEdAwp0AyPNihwvwy25FZbZV/
 hmKOpmTe2kpEKvrL1lNWfTEDF2alftcPa3nouJGiHKaGiXfU7+i+iCORf g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="334666588"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400"; d="scan'208";a="334666588"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 14:48:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="775216262"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400"; d="scan'208";a="775216262"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga004.fm.intel.com with ESMTP; 26 May 2023 14:48:26 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 26 May 2023 14:48:25 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 26 May 2023 14:48:25 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 26 May 2023 14:48:25 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 26 May 2023 14:48:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=btVqXmH2LpGMFstzljZkLUyqIu62zEE/zUIcOgEkIONkYlTViOVe0/CTawyY8U3nJRPaWIo/R+cgkJno45TBIm8OnKvY/XbQmWtfikkabP89zPAu6a6hbjKIA476tQWetlB1ScZ+GMtc0ZSqrBhmJYyLgji1kCKBEuRFvcNonI2XDPnJ6ea9PsD6GXVHP6qlXbJ/8Ou0Wrf+gZs5LO6uBmIhML/iqwNyQ3SzqtXxwCD4VSJkBEm3p229SR6GuUWTKIaK1kOYjG3KdMaEygH1Gp98IVYr7U8Ny06St941dJQcedw1cgHNgQsmKX8nj3DiYp8sQlIeDfDiBIboZQT+7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YJPiGYjl2KNNzYd1GV7kgrjuC4Lb9IdGCbUVaKUetfE=;
 b=PcnkddbU3bKKYk70QmKRQWJloA2bbCIWDOh0eMAIxskHPMZ+Lx2wMKdf66HCrWiAx8xUcUPymQK6n2ukI4QNfC79lNfnQj1gq9+wuE1mFIqRtZqwfEFCX6CsCEo/sF8aNr1Ns4G2NObAiP6bTapCjhUtvtCUXdOfL5HGa04WfLSXISSzn2u/G3sBxz1FEGQMQhiPY2TWcaIc5gp/Nh7D10CL2znwQbG10QvchxEid1E8EZEpJiCvyXlGMJgxCULO31f6hiq+rC1Ht/Aav4Lue5kykMU0OYYLWLLKevl6ikFSRlsIkEMl6im8bhB4AQO03ugvYWABlb9mKpK4RF57VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SN7PR11MB6969.namprd11.prod.outlook.com (2603:10b6:806:2a9::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.18; Fri, 26 May
 2023 21:48:23 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396%3]) with mapi id 15.20.6433.016; Fri, 26 May 2023
 21:48:23 +0000
Date: Fri, 26 May 2023 14:48:17 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
Message-ID: <20230526214817.GL10045@mdroper-desk1.amr.corp.intel.com>
References: <20230526004235.745730-1-gustavo.sousa@intel.com>
 <20230526004235.745730-3-gustavo.sousa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230526004235.745730-3-gustavo.sousa@intel.com>
X-ClientProxiedBy: BY3PR05CA0053.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::28) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SN7PR11MB6969:EE_
X-MS-Office365-Filtering-Correlation-Id: 8163edca-1afe-49d1-a040-08db5e32ecdf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N5CZeZbFldpCa2dsjAjLBjKBcgSisp/BBWRNcGRnb8MoNSrHznq9dK/2hgEix2886B1zAIguQnHjUKGzt2rGHHDjEkxUJ2RHNkWgd+aBNbYm93M1aKnbSE7sn3l0k4Y6Q08IHRQKxogGw9loIY8AZghX7teO3xxodyZjl52SkkPjpqOJh2vn+x5VBwta7nCfa+Qs06T08scbnYsVAf0hILQ7OfX5QYKScFGvmQhtPM9v+5sQ4Y178a8fXXi/xS6ufGe4O1BX+4NRbYRj5l1ZtX8n3QxPtyRfk6HomGiFlzqW/78hpF7baI/K9nSi0hz6MLNlJQ0+FQU26pOnH3rUJ7dRTpoGUV9Ig/YMsWbzqwvNt7Ps4Hh6g3JpXrf/fWGHL2WFanrPUgqN3KJJQZPtr33cZcPfuKb8dVXrqTVKvNGQ8yFZJajatxiiI3WdHRGN5GWWNqQXsT4mWKQ9rwnUemfMh8fLuyghTHmmsVqvnk+chzshbwJQysqb90dazoS+ei1DTKc7fcvbjiWRdFaQf6C0sKwbrzmC/OeB/DLbHjG2N5fGnd8zXxHydrnsFYE8
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(396003)(376002)(39860400002)(366004)(136003)(451199021)(6666004)(316002)(6486002)(41300700001)(2906002)(6862004)(8676002)(26005)(6506007)(6512007)(8936002)(38100700002)(1076003)(5660300002)(83380400001)(186003)(86362001)(33656002)(82960400001)(6636002)(4326008)(66946007)(66556008)(66476007)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?u1PlUkcH223OzoCRh5onpc6TYhoYjeXF8HryKGL2iXzxtWi80VzaHlFZHzab?=
 =?us-ascii?Q?fy7gOxLVcseHvKsGxEAElaFMxI5bSXov1uHnKxsCjprd/CyrGjUsPQtHD+5T?=
 =?us-ascii?Q?AYVJPb+B2onlw0RiUHYk5PPQ5s3IfhuSnjS7rOaWW5PX1akERMGJz8GjkX6C?=
 =?us-ascii?Q?rz/OlTZTZ32mtooWDoK2VRxiQBEBthWXsXC0hf5YRDjv3Ykbu+lzs7XgUCXL?=
 =?us-ascii?Q?tX9mr31pKwljtmwZ/r1P0rzO+BCYi/EnpsS+Xw/rHnZ2FNqg4QGdyF7zkUvc?=
 =?us-ascii?Q?CUgWe6i35F+pjIO3KKvBAqqzWUjS84Cfi8WHxkz2Ia2eR2OjWgsqBwd+tGKC?=
 =?us-ascii?Q?1c69PJPJhO9osgiLD6w/Qme2FuVWB9VaKIpLoeJSsdhXXWdfV+iOrDHozS3X?=
 =?us-ascii?Q?JGFC5r+8qm9qIMJ+81oIUKgKqJHlvuJsoBRNcgAanl/jEjeUBGxs5j2xj47s?=
 =?us-ascii?Q?kVoNTx0ihM7e8GVvf5Z9XGnDBl+kUq147HXCzN4ATC0vwZ0n/Lhoi52zx9C7?=
 =?us-ascii?Q?EdZhnQsbqk7WQ6JKgjT8fjTFSok7pVl6D0itaVfaoMIMZkRY2KQ85YpXGJKU?=
 =?us-ascii?Q?sQzcEZ63jF8k2grpFch6HGyV2vVmGRWeaTsvhDCA2Cnabc7/wgze9mELdF5r?=
 =?us-ascii?Q?XyEPZO/OfpWWgbOv6IC07HRT86UdmUND4TbdjLtLAsqHRFUlUVvV237w8BUQ?=
 =?us-ascii?Q?DXec4DgIxLeJn9CYMxA/cdU87t1RsBEBgDQu9MG8NV1B6C6L3dncIemR4C4D?=
 =?us-ascii?Q?uumasoAqH1wEVriB8ZTMUuoU8qvD6l8olXzxuwnHvl2JIROBcOMGMw3pd7Xm?=
 =?us-ascii?Q?nV/wY2dWpYuCVdeJgBNINMQjVbFLObbkMcs4+sFEFWcP7vptAQB33dso/jnB?=
 =?us-ascii?Q?p7sz6JZD7ohfEEhtmm+hwV3wTaAQylWIQCpsEuHdMsW8+Wn44Ig9igMu1awZ?=
 =?us-ascii?Q?G9ZYzh6RpV4ca/Efl3W3ST/7Rga38CFXaoEehhpf8l3VjpX1i9mPHFFl1vF0?=
 =?us-ascii?Q?q95rOvNT4xV+ywxLJxPmtaRQyUTyEy126p2PI9Ra502naYoslkuT1YwWgWnA?=
 =?us-ascii?Q?/+WqLaMJAQBbbXcL57lqDoKSMSZKlX3eT4rqeSg5i1IrEAAIXllg5kRSZ1qR?=
 =?us-ascii?Q?UW7Yv8j6Nnnd2E0VLDqE1X+wclYTwoGDt4pdEv/ZReyNkpGWFOQXEarS0u05?=
 =?us-ascii?Q?RIrFcpARF2X+EbUgJA7awLU6LETGpQUZJzPxh3gu5GRJdVY5Gxsos4qFzKdz?=
 =?us-ascii?Q?xkhp0C6JSSaPVOpah6zXlWjQX71jwXhMa31KKS0EH9qjFO1RGhcThvDpAaqL?=
 =?us-ascii?Q?lWxxWaRtDlXu4hxRairwy+20JeUpvI8UPlaKPkV1HUZLSoPV5p4Fcr/bHp4S?=
 =?us-ascii?Q?RdV+qd5ivH3fr1U/0HP4kofzCQEygRVP0FF08K10BXlnDMOWNtth5nM6ic8E?=
 =?us-ascii?Q?o187s8sJlE1NFa0xia5gqfJ7pamWTCIVaMaSHwqcGjYZ+cOXd78DTX7iJ0CI?=
 =?us-ascii?Q?wBb8l8WWHk55SYs7wEbl7YTdJw5fFGpE8jSwhxtPDrYWX5FK9aho3YscfZIh?=
 =?us-ascii?Q?n7+ySeSZrQs0mSSUveLoB4w8w99Zo6xSoVr/zajKOUPZ0LjaNIk8uKVE4+eD?=
 =?us-ascii?Q?QA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8163edca-1afe-49d1-a040-08db5e32ecdf
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2023 21:48:22.3107 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HQXE2N352aDb1qSJ4bxKK9bKnosw0/81MXpgE2EGhCvRw8rPGM4bGtckmoBaYFGv+nflXadqUE6hSY6O7gd6VsAYO3AL97+/jqcYz4CN7ow=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6969
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe: Replace DRM_ERROR() with pr_err()
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

On Thu, May 25, 2023 at 09:42:35PM -0300, Gustavo Sousa wrote:
> The former has been deprecated in favor of the latter.

It has?  I thought generally the goal has been to replace DRM_FOO() with
drm_foo() (i.e., drm_err() in this case) because then you get nicer
device-specific output.  Or when we're doing something GT-specific, we
move to xe_gt_err() so that the useful information about which GT is
automatically included.

It looks like xe_reg_sr_add() doesn't have a reference to a drm_device
to use drm_err (I didn't check how hard it would be to plumb down to
that point), but xe_vm_bind_ioctl() should be able to use drm_err() I
think?


Matt

> 
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_reg_sr.c | 11 ++++++-----
>  drivers/gpu/drm/xe/xe_vm.c     |  3 ++-
>  2 files changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
> index 24d9c73ef279..4266999cdeb6 100644
> --- a/drivers/gpu/drm/xe/xe_reg_sr.c
> +++ b/drivers/gpu/drm/xe/xe_reg_sr.c
> @@ -7,6 +7,7 @@
>  
>  #include <kunit/visibility.h>
>  #include <linux/align.h>
> +#include <linux/printk.h>
>  #include <linux/string_helpers.h>
>  #include <linux/xarray.h>
>  
> @@ -123,11 +124,11 @@ int xe_reg_sr_add(struct xe_reg_sr *sr,
>  	return 0;
>  
>  fail:
> -	DRM_ERROR("Discarding save-restore reg %04lx (clear: %08x, set: %08x, masked: %s, mcr: %s): ret=%d\n",
> -		  idx, e->clr_bits, e->set_bits,
> -		  str_yes_no(e->reg.masked),
> -		  str_yes_no(e->reg.mcr),
> -		  ret);
> +	pr_err("Discarding save-restore reg %04lx (clear: %08x, set: %08x, masked: %s, mcr: %s): ret=%d\n",
> +	       idx, e->clr_bits, e->set_bits,
> +	       str_yes_no(e->reg.masked),
> +	       str_yes_no(e->reg.mcr),
> +	       ret);
>  	reg_sr_inc_error(sr);
>  
>  	return ret;
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 4d9c8de8b348..89d8240ea6aa 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -13,6 +13,7 @@
>  #include <linux/delay.h>
>  #include <linux/kthread.h>
>  #include <linux/mm.h>
> +#include <linux/printk.h>
>  #include <linux/swap.h>
>  
>  #include "xe_bo.h"
> @@ -3019,7 +3020,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  	}
>  
>  	if (XE_IOCTL_ERR(xe, xe_vm_is_closed(vm))) {
> -		DRM_ERROR("VM closed while we began looking up?\n");
> +		pr_err("VM closed while we began looking up?\n");
>  		err = -ENOENT;
>  		goto put_vm;
>  	}
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
