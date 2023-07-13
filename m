Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE6CFC001B0
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jul 2023 05:09:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54A5610E06F;
	Thu, 13 Jul 2023 05:09:31 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCC4910E06F
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Jul 2023 05:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689224968; x=1720760968;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=eCLO0IDwNtqYbgrVc2IbagmlNgUzH7y+h/YSMOJ5v8U=;
 b=MF7i4Yvs/9FDAj/GmuCfMkXJ7onxd1RVvtmIkSx6RToqzoMWvnqUYCbO
 YLZn1RqIFs0h50RzWCq91LpjDPdoOaGHrBvkzSarVLzCrZH5ZUBT8S0Vc
 uXiys28cLEBl4YtbvkhZFcCYHXvtqbk6+hP+iEcX3LNRfUywL7H4cgJg9
 tREkghXKxF8MICSCrdkHZoaODmhNAr3trOhbBkv0U92JXiYzbE9Fybz60
 GlsA4Rc071NSLj1RtPpyKmbPgZ44eRO82DCWVSFpi5yVwXXXATxbccIan
 lQ5XjE35secvFvaMexJ22DVlHdYtx9dT/69IgZ6IGv5PH9GekCAS/BbGR g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="362553048"
X-IronPort-AV: E=Sophos;i="6.01,201,1684825200"; d="scan'208";a="362553048"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2023 22:09:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="725158981"
X-IronPort-AV: E=Sophos;i="6.01,201,1684825200"; d="scan'208";a="725158981"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga007.fm.intel.com with ESMTP; 12 Jul 2023 22:09:09 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 12 Jul 2023 22:09:09 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 12 Jul 2023 22:09:09 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 12 Jul 2023 22:09:09 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 12 Jul 2023 22:09:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WXH7jNxJ52VcZLtKql0bAap2eZ99m9sZSBLqmsI4HZpYZhoV6S4ytgqD6RbPzccOekhBjfBCQ60W2ua4Kgb6MjI4W1EsKLZIbzIDdb9EuPFMoYRxftZTxBfVfYi471GunDfHSk6LhpU82Ua6ZGJBRZxbICnYnUMEo5XOFK7d3sAAl3JKgWHbFOBA1uAvBs9+ue/Hk9S+QN/pEYql+rC10NLT880o6NuYYqVMJVXYSCCnJLkX42HDaYT6h2fdQ2HJlCIU7MkrHS0aYZOq7nVn1Yw8f2g3bMTwtd+hcal3VEm81pP8uYCqpLlFTHnT2Jm15o24QcREjT88aD8n5GJLRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R3012UFxLbTbmLJ1EbXzpzUGhCxRbbxUOJgps9cjY2w=;
 b=C7iB+Odc/P/7dODpyQ0S+HrFvph8R/tmYp3xU/9l8IpW0jbl+jaqgrZm+EIGpcy/KhjfosEi4EQ6QCMpSF53s1moxJbsTOI3vie1IyfdaY92UcsCmiz+1nHMczYiCy7c5emfWtcHJbDrK6xY6Nt+OHAoZXBj/y4unUyij1MZA44AHkoA/m1taoDyNaS/BYHqxoswA9V6Km2mMcGsGWWTrsCSNKjAONTvmrtTmvbda5d0BRLrRwM1EVOc0WDBn7JEaMwBQBQK0RlsxB//4IDFkFCDC1aWIMb4SH0qD3lDizEU8V2d+PQkjLYyyPMXWF+u4/69lIQuM5S/m7XGYwOo7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW3PR11MB4569.namprd11.prod.outlook.com (2603:10b6:303:54::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.24; Thu, 13 Jul
 2023 05:09:08 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::c65d:c846:f197:3ca5]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::c65d:c846:f197:3ca5%4]) with mapi id 15.20.6565.028; Thu, 13 Jul 2023
 05:09:07 +0000
Date: Thu, 13 Jul 2023 05:08:22 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Brian Welty <brian.welty@intel.com>
Message-ID: <ZK+GxkrPbKgOGTnp@DUT025-TGLU.fm.intel.com>
References: <20230713020144.21594-1-brian.welty@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230713020144.21594-1-brian.welty@intel.com>
X-ClientProxiedBy: BY5PR04CA0028.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::38) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW3PR11MB4569:EE_
X-MS-Office365-Filtering-Correlation-Id: 050e13a6-6ddd-414f-92e1-08db835f48a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vydNoFy88DoT7i0c4b22596YI1IbS79DPGPC35X3BkY+yJGyb0WfoSBpTYUb5YBuEcjPeqPydeVZhdJ/4yEImIHzouPD28AOMqY9wl9Jk1u7Wd54evujz5HVQfUYY1v+zwWX0rQggPPSIPs3Uj94jw4nubK90ZaMnFTnm3axFU+CpnprUM4LJfRb9tPsUqXUN3Xa42XSTcxe++fv1jR7MPb9SJ8PiJTnG+aNf1o1/gTJ0VJOHRsX0REvuqeLINoxaMmd4e4CDbVxpKA0mOMTU7MVyOub/1G/YBNbD6+YNZ0RV8jJS8mzC9NgO/FKu06xb8Aq+9/LBNdxqL9FJb9/xyhYDqkkVtCdYVvHND+u5Cnl5e2DFS6C99JvHtQjgObpy4deWQgadHAXYQh2mQoGJTwRziqdTa6sDYSrE3SLIrO41WMgCdNXDEFHzjtFmCBrL6Gv4IiHhFwN6T+uaTyop/lDOmz0fzGDNqK6yF3T5sgaQrKL39G6mJKfyA8W3SHPOYkVlbxnsUt4ZRnw4QLmNSEIkVKbw0JRBkU/CMkf8VorDg3dcT4wHZlKwcgsC04WPrq4wb4ma5DXVscMnpuhh5AcmJuX4+GSoeruykCGRag=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(396003)(39860400002)(346002)(366004)(136003)(451199021)(44832011)(5660300002)(8936002)(66556008)(8676002)(4326008)(41300700001)(6636002)(66476007)(2906002)(316002)(66946007)(6666004)(6486002)(6862004)(6512007)(6506007)(26005)(186003)(86362001)(38100700002)(478600001)(82960400001)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?80KekrVUrJxdD9zRLyqQpAyKC2PQRvgXr1B3CLL/PFAGkSLAZPBVR/WZePfR?=
 =?us-ascii?Q?nBq5yHoEVyVbX1na9OEkTttbvw6HcxfL88WbO0pydMBYyb65kUYdVTW7MmWd?=
 =?us-ascii?Q?XuxYjidTzTN+eyHmO6vqeLKwwgsPgFx1uwyXME+XoTdTP465OV/IDAiwH2LX?=
 =?us-ascii?Q?Ppx8oxEfJUZvvXoEdu+VRvCt1FS+dtcBvflX9225CfPnVvQRC8jcx2qduWFF?=
 =?us-ascii?Q?KU7A0TM3Y1sXi6UsLaDDNABTOC3/qWGllITMV/HBfu3u+6yY931Y7LsYvD1c?=
 =?us-ascii?Q?oiLHUVSmeEDEbve+RFpa/DIg53LoP2Rr+N5oXpuU722qmfjLhP5j6HR1B2ES?=
 =?us-ascii?Q?G0c4K2jhRd8+ux7CdK6K4f95m1q22ub3oWU0yNY8VfiI3YDEZRUA9/YI20WZ?=
 =?us-ascii?Q?5og3hbf03qXs/FF3NlrPhLhw4ZK3UOoRtApD60k95N9JRxKy+X1TxACzcJrI?=
 =?us-ascii?Q?vuc2k25cseW8thWzPtnfxrWenNHcH2PBXb/OXhD2VS66P5ttYr1FFeoSHM6R?=
 =?us-ascii?Q?B1Zce4UuL9zMz0eR4UHztIjOV8nLkeAMeoxmR8aMF1Bv1LVpSlNTCV5yNxjC?=
 =?us-ascii?Q?sih82QeeeixJLV9zSWvAce+/l/l/9RyslrGAi6TbSJjJJfXkkYdE5VaofzfO?=
 =?us-ascii?Q?H/PpAmFLo169rHFvfXkKBXFmuUYrO3bXIIpd0PE+eQEwIRSewJj7TQUxZwrL?=
 =?us-ascii?Q?zLi8SWM+tpI9Y/92uBWrdq1ZZkC0kn5cEKFB9GZpJf6u0EsAVxIM1/+wt9Q/?=
 =?us-ascii?Q?JzQOFWa3FN6T90Tas9qdep5PVk5YIWh8olULaEuX9J6Pob73Vcr+jlEJ8/4A?=
 =?us-ascii?Q?HdsMfsgXa/YdtKJz6V7DjbXNX15D9g2Ky+MUkp0qQefa6FKCUOfFMoRjUmOJ?=
 =?us-ascii?Q?GxRkgndom5c34O3vJtVc2PXUkarPkLL3hd8CZLt9lUsrBg/zVMNFHn54CX7H?=
 =?us-ascii?Q?7E52kteYqbCJlVFwlHnZAFn12sJ5PIjKA9nFu+gARJynJKFXKX0FuRakI+yc?=
 =?us-ascii?Q?Ju9FOUEQWFrO/r7RdLZwd6OLQc3bM+jseZ/16WbQ3avyMSTd+aPKdZ25B/6g?=
 =?us-ascii?Q?1E5jiQw9SwQYbUmhx5S4s2y9ma1R2RweyswuhxaM1yahGRt8OMdb44rrHt/l?=
 =?us-ascii?Q?cLeIr3dDV5I1hbESeT9+NvbrSvKuyY1n6VN17J5yZG4N3Xfph68aBkh3rp4G?=
 =?us-ascii?Q?Hw3mh1lshsqD3vr11okrmn0TsWqCSv10F31mEKGwOrRP/yGW7zDlPyc2Y38b?=
 =?us-ascii?Q?SLdzE048Ta7iHaI+L3G3CngAHI9KPMvYHaDAGQlmzNkp9D3Nx/Vdw1sp2eM3?=
 =?us-ascii?Q?h+KLyOtYd7nfshy5FkJ6zwabtWcqWCr9ftV6R2wmmt8Ud3+buc+vxlQnC/Wn?=
 =?us-ascii?Q?s8Iz38d74nKXNYFKeBc3z7IKDewZPYrYNP7oZlDVRiM/6WDqTt88SCvG7K9j?=
 =?us-ascii?Q?afyEoXSfWZuQdZj5J6bxL2AFf8xz6mVMknrE9xgQa0ycOOBzqG14XhBfZbSG?=
 =?us-ascii?Q?PofKTFkhHAOFyWzzIIpmU2PQ3uN7E+fuNKJyYZBUS3/WuRPBABOYq13z4enj?=
 =?us-ascii?Q?19jrR7+d/nBa6r6+e70xBHljRRECx675GYk59qUD721KTnYrEWEZkbbFTTGE?=
 =?us-ascii?Q?AA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 050e13a6-6ddd-414f-92e1-08db835f48a5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2023 05:09:06.8399 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DiayWlzbbXKoCAgaR3JsLuiZ5rc/ADjJm397kicLwZjCZ4Fspo3/YYxxptZ+J3AVxA+u7BfWnSQTrJW6czryPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4569
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Fix BUG_ON during bind with prefetch
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

On Wed, Jul 12, 2023 at 07:01:44PM -0700, Brian Welty wrote:
> It was missed that print_ops needs to include DRM_GPUVA_OP_PREFETCH.
> 
> Else we hit the impossible BUG_ON:
> [  886.371040] ------------[ cut here ]------------
> [  886.371047] kernel BUG at drivers/gpu/drm/xe/xe_vm.c:2234!
> [  886.371216] invalid opcode: 0000 [#1] PREEMPT SMP NOPTI
> [  886.371229] CPU: 1 PID: 3132 Comm: xe_exec_fault_m Tainted: G        W          6.4.0-xe+ #16
> [  886.371257] RIP: 0010:vm_bind_ioctl_ops_create+0x45f/0x470 [xe]
> ...
> [  886.371517] Call Trace:
> [  886.371525]  <TASK>
> [  886.371531]  ? __die_body+0x1a/0x60
> [  886.371546]  ? die+0x38/0x60
> [  886.371557]  ? do_trap+0x10a/0x120
> [  886.371568]  ? vm_bind_ioctl_ops_create+0x45f/0x470 [xe]
> 
> Fixes: d39e49e2ad38 ("drm/xe: Port Xe to GPUVA")
> Signed-off-by: Brian Welty <brian.welty@intel.com>

Thanks for the fix, clearly an error but way not print the op?

> ---
>  drivers/gpu/drm/xe/xe_vm.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 6c216350084b..f96690e868aa 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2230,6 +2230,8 @@ static void print_op(struct xe_device *xe, struct drm_gpuva_op *op)
>  		       (ULL)xe_vma_start(vma), (ULL)xe_vma_size(vma),
>  		       op->unmap.keep ? 1 : 0);
>  		break;
> +	case DRM_GPUVA_OP_PREFETCH:

e.g.
                vma = gpuva_to_vma(op->prefetch.va);
                vm_dbg(&xe->drm, "PREFETCH: addr=0x%016llx, range=0x%016llx",
                       xe_vma_start(vma), xe_vma_size(vma));

Matt

> +		break;
>  	default:
>  		XE_BUG_ON("NOT POSSIBLE");
>  	}
> -- 
> 2.38.0
> 
