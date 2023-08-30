Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C667C83F01
	for <intel-xe@archiver.kernel.org>; Wed, 30 Aug 2023 20:58:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3942210E5D3;
	Wed, 30 Aug 2023 20:58:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D9D010E5D5
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Aug 2023 20:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693429120; x=1724965120;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=nyNjoHUYJFFwAHooGUPlXiQ8pdLlSSCing87kbAU5Ls=;
 b=R5W6rLrJarspUuo6tngLREEO9hYJ3iJj+mkCJQt1mn9ZZLa8BV+c9pL+
 j5ZInAG7JFmDfETh72qRb+ECOVQCVzEPmImxkRSOPZYPL48Z1DNxk3+9z
 +KDlEPUVWhjeM3edCHX7fyR+1yQk/OiNpbLRneTCPDROdYB7KLV/UP4+H
 b9Lv05AFtZM/bogqCiqolHLks+TJubrzPYkFwsj7S3MEf4m51KKn4y7XI
 iILtNT5xKQH6Zj0dgR+cTo5P93UKd8/Ugjpongejj3TG77EqQ5iYfaXBe
 H2ZJFGV12KW0q8XkJgmYmSg//VvSYjPDwV/415D+q8mlVlRpl9ScbV9bu A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="360737817"
X-IronPort-AV: E=Sophos;i="6.02,214,1688454000"; d="scan'208";a="360737817"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2023 13:58:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="985911931"
X-IronPort-AV: E=Sophos;i="6.02,214,1688454000"; d="scan'208";a="985911931"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga006.fm.intel.com with ESMTP; 30 Aug 2023 13:58:38 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 30 Aug 2023 13:58:38 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 30 Aug 2023 13:58:37 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 30 Aug 2023 13:58:37 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 30 Aug 2023 13:58:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n21JDszHujeHSFev1mxC21APannLJmnKMOrXbq7C8WF17mTOd7PBMyLi7VkUFU6LlHQgrE8oLlJECHDUOv0mKvzahYLEtVSZPTdBIa4DItuW8Cn1HzjdPBCcZFK9lG+GM6A0RRA8Tb1t/nqFovYdOxcZMxbqcW+J57f5x8Y7cof/boAzHkw7TI8x0F0oJR4n12Uq3s250/oaWCCnJ67TNVVhfGmW+UOpNO+Ty+bbD2vU0pN0XH0nelGuXUsU0vn1Q+JMjUvGT/Eri+T7U/FkGAGucMVH9r7YRM4ckO4fwZzLQQ1V1VJRcv9++eKMmu3JDCZ1IJ7mPtxx1Nd4mPi1CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qfAwZFCW/MCkK0esE7KDHz5p9RmbAkojWKGpe/g9p2g=;
 b=nTUyYb+L0BFRdBddNw0I6cHtFyePvRdoVgPzpjSOr+pRj6F8NR/dsyk4k/iIgVMVdeH4iFxERZJ8Zv1Rkp+4Il40GglEAsTgHr/p6EFNO8A5G1yKwkHsEwCBYuZdfRtujyQDd7TA5OfNyy8tZHrXb05MUShkYz4ecK456EeHA+SrId5Jtf2cbfVCohssXXb1NKjWNgSsmcinxBeodQ+BGRNzWHLoEpYVbvfHmSFhL39yvNSMvknlZvEMrMQz0oR0ZTJaj55068UZSfAKEo+HkOoEFBv0/47WI00yTNGBuFWHxAhZNzZAwcCC5bLcxDWPPJ7o70ezRSy0qLMZRFxjBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM8PR11MB5686.namprd11.prod.outlook.com (2603:10b6:8:21::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.20; Wed, 30 Aug
 2023 20:58:35 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6745.020; Wed, 30 Aug 2023
 20:58:35 +0000
Date: Wed, 30 Aug 2023 16:58:29 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
Message-ID: <ZO+tdVtAOrIYLqN0@intel.com>
References: <20230830051544.369643-1-aravind.iddamsetty@linux.intel.com>
 <20230830051544.369643-4-aravind.iddamsetty@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230830051544.369643-4-aravind.iddamsetty@linux.intel.com>
X-ClientProxiedBy: BY5PR17CA0013.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::26) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM8PR11MB5686:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d85a8a2-467e-4890-d6ea-08dba99be014
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PR/3S29nC0V2fcG3l1lAzrQI6MM8BwdpvHnnzy0H6t2Jj4vQvB2u0+iskSyjeMIb0uA9UM4X4xZ7riYtPCwfnRkiaXiNMkmOB6/1NMO2eCxGJ9g2B/XMK/9oWFH2SKHmwleJrjPpgJwab+jMxfJI+DP5v2jJLEGb/NNc/dQuIGL7EpXeRZe0DTLn/WacTbCIncwVDi47gwp6wJxnON1prllaVdabOwi3wUxuO9uE7XntK6oQhJA3zs8ZnXxm1ji48dGzXq4mcAWinl883cAiyEj6SuUt8vs1WQGMaQOb4mTuNo0A7gTCK4FBVDEPq/PKiNDFv2+zSbj+X3cDqKKzXGmtvjvUWvU5qpOhSjA2Qrul9nd4NbuBNlVJPxv1CVattedy6fyKSv8ILQJJA32WS4mK5OWmKRyk3+Tb3DLge/iarMVOsBW/Mz+avxCBFjgpX6M2T/uvlp2rIYCZA9xP7OylUGPFtaUKjjlD7BarRcLp550J5yIAzXIyjoKxD3KUtdyaF8/TEmRkakXtcyr7Ux8jxsEYXssQrfBjyo0+iFZc2Hn94S6HU0oZbfExdlrgx/reik92X80jtHf+IKzih9FpZqJKufuF7rk0CxsLUkw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(39860400002)(136003)(396003)(346002)(1800799009)(186009)(451199024)(478600001)(66899024)(54906003)(66476007)(66946007)(66556008)(6916009)(316002)(82960400001)(38100700002)(2906002)(30864003)(41300700001)(8676002)(8936002)(86362001)(5660300002)(44832011)(4326008)(83380400001)(6512007)(6486002)(26005)(6666004)(6506007)(2616005)(36756003)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?g/47aSd0Dz0dKmfRfNjCg1fsZyDMTfNClV/D8Ya5P8mS5TJRKv1QqcpeOq?=
 =?iso-8859-1?Q?k82RqqNd0SSZbtpR5VQVzkpVLYp6UGYr6S6S2vTLYl35uNOvuL4CssJcB7?=
 =?iso-8859-1?Q?73/CRgRmDx6aa3wp+YK7oPwsH8hT9gvyP4wLM1nm2KizMvuD/9j64qjFup?=
 =?iso-8859-1?Q?PaE/aNCyhMzW7wWWRAfRO3MVEuZ7LDL7MbI144RjpDsEkbmclS0RZNwTOv?=
 =?iso-8859-1?Q?OJY/IamrL6O/wJ6CE4l3w8eEpx85s17fjy/audN7qRD7e6zyuOXwuoPzLS?=
 =?iso-8859-1?Q?SeuCt6uMQ2cpW/C/B8hpVr23qRAc+1GrLzRQ24am5Q4MgUcDaScKr3pGlA?=
 =?iso-8859-1?Q?Ag/l9oLKsKH6X4OLSwDp7bRtCokMO/OfpHIox4Jr28wgrtvFbXcNgRyq7I?=
 =?iso-8859-1?Q?3RfSQqNNfD1jEtq7vervgOYlGWgVljTWWLETRTVxfkQva5oZVOY+qP9PJC?=
 =?iso-8859-1?Q?YxnuJbhNqfIiqDgKkDI1eEdUJarkjfVTgLTV2lKafSFBvITZFRr1OKf6tl?=
 =?iso-8859-1?Q?BZNpnrKWZiBEL0rEMS9np2bUCylq7TQ27J5yPjZzQzQV2kbXaujQsuACF0?=
 =?iso-8859-1?Q?fTeKsJP1qGV9s4xVmy1yuXfRIf5d6qGZvmWe/u27wg6g0AlMvpw2mVkZsx?=
 =?iso-8859-1?Q?7idcRpDCmo4LPmXUH4LsbZqU5g9FdPjoU+LQmBx+rK9WrJl3NX2aM1RepE?=
 =?iso-8859-1?Q?kwOoW2tUlOnLTNIpJxjGlcbes72DYi/NubDYI8IZOV6mYT2ZrhEnOgGvBM?=
 =?iso-8859-1?Q?ReKkm09Aan/hic/b9A3Tuv78qvORty/7BDMXdhqU/MAnts6eehU6vlTSfN?=
 =?iso-8859-1?Q?sHWODkPaOVhsFw2s53hna4ZSjTDHCQ+++iLDqo4ofg17Reb+qFDE4lmi17?=
 =?iso-8859-1?Q?kXgCksIQE4dOLuyeEXPkP74LheFs1uex/Hj0BzzdQE2yXWDZ3iX1c3G5aI?=
 =?iso-8859-1?Q?TiX9Z0d2D/I301NRdYfTSE6X8VezfttQPIELyXqukMrQzQ7XP8rEi5WOfz?=
 =?iso-8859-1?Q?viT8Aq+5hjTBslbVg5+cpQ1RgC+mVAfjzZp8SaG+5Vo+uBQXC/36gFAw4B?=
 =?iso-8859-1?Q?HQogY8jdfvvialaFoy8OF8KU/vaxTE7CTWMm4LcP4LFEbA1FBTvH1nSn8Z?=
 =?iso-8859-1?Q?i8hFf3eVpOcAtcuAa/8i+adelqCEUKxxFcgxk0Mh6/o822qD+fN/aHVKKX?=
 =?iso-8859-1?Q?dq6cay/hb2ovJNHw/iGq7ss2XQD67rUVutMmTOzu4Ae9Isfqyt4wFkz/Np?=
 =?iso-8859-1?Q?Dgn0ZvoElTkh55iZOiM6PXGwjJHg9XbpLZVGPZ1plxgTS3uZL0VZKr248R?=
 =?iso-8859-1?Q?iLax3yXLe3DfPWEyRQ5vtjGtHbOcFIP3ij6cd6KGtFQu8wyywYYb9cfiP0?=
 =?iso-8859-1?Q?MlAs61IRmacjTOzSCbi2+lIs1i3pgJPc3SbzWS87ghD1ehdrUVwJ/z+LFZ?=
 =?iso-8859-1?Q?sAMChV2Ft4XbMAcXRTho9iiRoP4cKg7QOaXjSKmM1fzD+ZFSiEc6VOoYDC?=
 =?iso-8859-1?Q?HGrdWQK4QahQHIRhiZhkCWeL5tAhZJZojtjBnG7E3dB/lcflbQ5ojKZAvm?=
 =?iso-8859-1?Q?LBZ9qUahMKNhJoa9k9GPxht+xHB1gG7Wdsj2KcRySpB/QCna4s+EscG+72?=
 =?iso-8859-1?Q?P55yQsX0VA0ZX9+Oteg17sbMuxNgcqMHCn3Q5s/IKIn6DjZXS5klse0w?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d85a8a2-467e-4890-d6ea-08dba99be014
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2023 20:58:35.2009 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rhgQ4WNv95KpeYi5m4/6p3YvLDeDeDMmTFhkfHBPxEj+Kwbdm9nyi3N10+i1z8uk38zJ0uUlVWEiNnbUJyXNpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5686
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v5 3/3] drm/xe/pmu: Enable PMU interface
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
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 intel-xe@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Aug 30, 2023 at 10:45:44AM +0530, Aravind Iddamsetty wrote:
> There are a set of engine group busyness counters provided by HW which are
> perfect fit to be exposed via PMU perf events.
> 
> BSPEC: 46559, 46560, 46722, 46729, 52071, 71028
> 
> events can be listed using:
> perf list
>   xe_0000_03_00.0/any-engine-group-busy-gt0/         [Kernel PMU event]
>   xe_0000_03_00.0/copy-group-busy-gt0/               [Kernel PMU event]
>   xe_0000_03_00.0/interrupts/                        [Kernel PMU event]
>   xe_0000_03_00.0/media-group-busy-gt0/              [Kernel PMU event]
>   xe_0000_03_00.0/render-group-busy-gt0/             [Kernel PMU event]
> 
> and can be read using:
> 
> perf stat -e "xe_0000_8c_00.0/render-group-busy-gt0/" -I 1000
>            time             counts unit events
>      1.001139062                  0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>      2.003294678                  0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>      3.005199582                  0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>      4.007076497                  0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>      5.008553068                  0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>      6.010531563              43520 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>      7.012468029              44800 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>      8.013463515                  0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>      9.015300183                  0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>     10.017233010                  0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>     10.971934120                  0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
> 
> The pmu base implementation is taken from i915.
> 
> v2:
> Store last known value when device is awake return that while the GT is
> suspended and then update the driver copy when read during awake.
> 
> v3:
> 1. drop init_samples, as storing counters before going to suspend should
> be sufficient.
> 2. ported the "drm/i915/pmu: Make PMU sample array two-dimensional" and
> dropped helpers to store and read samples.
> 3. use xe_device_mem_access_get_if_ongoing to check if device is active
> before reading the OA registers.
> 4. dropped format attr as no longer needed
> 5. introduce xe_pmu_suspend to call engine_group_busyness_store
> 6. few other nits.
> 
> v4: minor nits.
> 
> v5: take forcewake when accessing the OAG registers
> 
> Co-developed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Co-developed-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile          |   2 +
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h |   5 +
>  drivers/gpu/drm/xe/xe_device.c       |   2 +
>  drivers/gpu/drm/xe/xe_device_types.h |   4 +
>  drivers/gpu/drm/xe/xe_gt.c           |   2 +
>  drivers/gpu/drm/xe/xe_irq.c          |  18 +
>  drivers/gpu/drm/xe/xe_module.c       |   5 +
>  drivers/gpu/drm/xe/xe_pmu.c          | 679 +++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_pmu.h          |  25 +
>  drivers/gpu/drm/xe/xe_pmu_types.h    |  76 +++
>  include/uapi/drm/xe_drm.h            |  16 +
>  11 files changed, 834 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_pmu.c
>  create mode 100644 drivers/gpu/drm/xe/xe_pmu.h
>  create mode 100644 drivers/gpu/drm/xe/xe_pmu_types.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 9d2311f8141f..cc95a46b5e4d 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -233,6 +233,8 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
>  	i915-display/skl_universal_plane.o \
>  	i915-display/skl_watermark.o
>  
> +xe-$(CONFIG_PERF_EVENTS) += xe_pmu.o
> +
>  ifeq ($(CONFIG_ACPI),y)
>  	xe-$(CONFIG_DRM_XE_DISPLAY) += \
>  		i915-display/intel_acpi.o \
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 271ed0cdbe21..e13fbbdf6929 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -294,6 +294,11 @@
>  #define   INVALIDATION_BROADCAST_MODE_DIS	REG_BIT(12)
>  #define   GLOBAL_INVALIDATION_MODE		REG_BIT(2)
>  
> +#define XE_OAG_RC0_ANY_ENGINE_BUSY_FREE		XE_REG(0xdb80)
> +#define XE_OAG_ANY_MEDIA_FF_BUSY_FREE		XE_REG(0xdba0)
> +#define XE_OAG_BLT_BUSY_FREE			XE_REG(0xdbbc)
> +#define XE_OAG_RENDER_BUSY_FREE			XE_REG(0xdbdc)
> +
>  #define SAMPLER_MODE				XE_REG_MCR(0xe18c, XE_REG_OPTION_MASKED)
>  #define   ENABLE_SMALLPL			REG_BIT(15)
>  #define   SC_DISABLE_POWER_OPTIMIZATION_EBB	REG_BIT(9)
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 766df07de979..e7178460c924 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -335,6 +335,8 @@ int xe_device_probe(struct xe_device *xe)
>  
>  	xe_debugfs_register(xe);
>  
> +	xe_pmu_register(&xe->pmu);
> +
>  	err = drmm_add_action_or_reset(&xe->drm, xe_device_sanitize, xe);
>  	if (err)
>  		return err;
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 750e1f0d3339..a82f28c6a3a0 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -15,6 +15,7 @@
>  #include "xe_devcoredump_types.h"
>  #include "xe_gt_types.h"
>  #include "xe_platform_types.h"
> +#include "xe_pmu.h"
>  #include "xe_step_types.h"
>  
>  #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
> @@ -361,6 +362,9 @@ struct xe_device {
>  	 */
>  	struct task_struct *pm_callback_task;
>  
> +	/** @pmu: performance monitoring unit */
> +	struct xe_pmu pmu;
> +
>  	/* private: */
>  
>  #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 3d6a7c11bac1..ded798f54b41 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -620,6 +620,8 @@ int xe_gt_suspend(struct xe_gt *gt)
>  	if (err)
>  		goto err_msg;
>  
> +	xe_pmu_suspend(gt);
> +
>  	err = xe_uc_suspend(&gt->uc);
>  	if (err)
>  		goto err_force_wake;
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index 1dee3e832eb5..0a307274ba74 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -27,6 +27,20 @@
>  #define IIR(offset)				XE_REG(offset + 0x8)
>  #define IER(offset)				XE_REG(offset + 0xc)
>  
> +/*
> + * Interrupt statistic for PMU. Increments the counter only if the
> + * interrupt originated from the GPU so interrupts from a device which
> + * shares the interrupt line are not accounted.
> + */
> +static __always_inline void xe_pmu_irq_stats(struct xe_device *xe)
> +{
> +	/*
> +	 * A clever compiler translates that into INC. A not so clever one
> +	 * should at least prevent store tearing.
> +	 */
> +	WRITE_ONCE(xe->pmu.irq_count, xe->pmu.irq_count + 1);
> +}
> +
>  static void assert_iir_is_zero(struct xe_gt *mmio, struct xe_reg reg)
>  {
>  	u32 val = xe_mmio_read32(mmio, reg);
> @@ -337,6 +351,8 @@ static irqreturn_t xelp_irq_handler(int irq, void *arg)
>  
>  	xe_display_irq_enable(xe, gu_misc_iir);
>  
> +	xe_pmu_irq_stats(xe);
> +
>  	return IRQ_HANDLED;
>  }
>  
> @@ -433,6 +449,8 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
>  	dg1_intr_enable(xe, false);
>  	xe_display_irq_enable(xe, gu_misc_iir);
>  
> +	xe_pmu_irq_stats(xe);
> +
>  	return IRQ_HANDLED;
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
> index de85494e2280..86557e8f89a1 100644
> --- a/drivers/gpu/drm/xe/xe_module.c
> +++ b/drivers/gpu/drm/xe/xe_module.c
> @@ -12,6 +12,7 @@
>  #include "xe_hw_fence.h"
>  #include "xe_module.h"
>  #include "xe_pci.h"
> +#include "xe_pmu.h"
>  #include "xe_sched_job.h"
>  
>  bool force_execlist = false;
> @@ -49,6 +50,10 @@ static const struct init_funcs init_funcs[] = {
>  		.init = xe_sched_job_module_init,
>  		.exit = xe_sched_job_module_exit,
>  	},
> +	{
> +		.init = xe_pmu_init,
> +		.exit = xe_pmu_exit,
> +	},
>  	{
>  		.init = xe_register_pci_driver,
>  		.exit = xe_unregister_pci_driver,
> diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
> new file mode 100644
> index 000000000000..41dd422812ff
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_pmu.c
> @@ -0,0 +1,679 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#include <drm/drm_drv.h>
> +#include <drm/drm_managed.h>
> +#include <drm/xe_drm.h>
> +
> +#include "regs/xe_gt_regs.h"
> +#include "xe_device.h"
> +#include "xe_gt_clock.h"
> +#include "xe_mmio.h"
> +
> +static cpumask_t xe_pmu_cpumask;
> +static unsigned int xe_pmu_target_cpu = -1;
> +
> +static unsigned int config_gt_id(const u64 config)
> +{
> +	return config >> __XE_PMU_GT_SHIFT;
> +}
> +
> +static u64 config_counter(const u64 config)
> +{
> +	return config & ~(~0ULL << __XE_PMU_GT_SHIFT);
> +}
> +
> +static int engine_busyness_sample_type(u64 config)
> +{
> +	int type = 0;
> +
> +	switch (config) {
> +	case XE_PMU_RENDER_GROUP_BUSY(0):
> +		type = __XE_SAMPLE_RENDER_GROUP_BUSY;
> +		break;
> +	case XE_PMU_COPY_GROUP_BUSY(0):
> +		type = __XE_SAMPLE_COPY_GROUP_BUSY;
> +		break;
> +	case XE_PMU_MEDIA_GROUP_BUSY(0):
> +		type = __XE_SAMPLE_MEDIA_GROUP_BUSY;
> +		break;
> +	case XE_PMU_ANY_ENGINE_GROUP_BUSY(0):
> +		type = __XE_SAMPLE_ANY_ENGINE_GROUP_BUSY;
> +		break;
> +	}
> +
> +	return type;
> +}
> +
> +static void xe_pmu_event_destroy(struct perf_event *event)
> +{
> +	struct xe_device *xe =
> +		container_of(event->pmu, typeof(*xe), pmu.base);
> +
> +	drm_WARN_ON(&xe->drm, event->parent);
> +
> +	drm_dev_put(&xe->drm);
> +}
> +
> +static u64 __engine_group_busyness_read(struct xe_gt *gt, int sample_type)
> +{
> +	u64 val = 0;
> +
> +	switch (sample_type) {
> +	case __XE_SAMPLE_RENDER_GROUP_BUSY:
> +		val = xe_mmio_read32(gt, XE_OAG_RENDER_BUSY_FREE);
> +		break;
> +	case __XE_SAMPLE_COPY_GROUP_BUSY:
> +		val = xe_mmio_read32(gt, XE_OAG_BLT_BUSY_FREE);
> +		break;
> +	case __XE_SAMPLE_MEDIA_GROUP_BUSY:
> +		val = xe_mmio_read32(gt, XE_OAG_ANY_MEDIA_FF_BUSY_FREE);
> +		break;
> +	case __XE_SAMPLE_ANY_ENGINE_GROUP_BUSY:
> +		val = xe_mmio_read32(gt, XE_OAG_RC0_ANY_ENGINE_BUSY_FREE);
> +		break;
> +	default:
> +		drm_warn(&gt->tile->xe->drm, "unknown pmu event\n");
> +	}
> +
> +	return xe_gt_clock_cycles_to_ns(gt, val * 16);
> +}
> +
> +static u64 engine_group_busyness_read(struct xe_gt *gt, u64 config)
> +{
> +	int sample_type = engine_busyness_sample_type(config);
> +	const unsigned int gt_id = gt->info.id;
> +	struct xe_device *xe = gt->tile->xe;
> +	struct xe_pmu *pmu = &xe->pmu;
> +	unsigned long flags;
> +	bool device_awake;
> +	u64 val;
> +
> +	device_awake = xe_device_mem_access_get_if_ongoing(xe);
> +	if (device_awake) {
> +		XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
> +		val = __engine_group_busyness_read(gt, sample_type);
> +		XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
> +		xe_device_mem_access_put(xe);
> +	}
> +
> +	spin_lock_irqsave(&pmu->lock, flags);
> +
> +	if (device_awake)
> +		pmu->sample[gt_id][sample_type] = val;
> +	else
> +		val = pmu->sample[gt_id][sample_type];
> +
> +	spin_unlock_irqrestore(&pmu->lock, flags);
> +
> +	return val;
> +}
> +
> +static void engine_group_busyness_store(struct xe_gt *gt)
> +{
> +	struct xe_pmu *pmu = &gt->tile->xe->pmu;
> +	unsigned int gt_id = gt->info.id;
> +	unsigned long flags;
> +	int i;
> +
> +	spin_lock_irqsave(&pmu->lock, flags);
> +
> +	for (i = __XE_SAMPLE_RENDER_GROUP_BUSY; i <= __XE_SAMPLE_ANY_ENGINE_GROUP_BUSY; i++) {
> +		pmu->sample[gt_id][i] = __engine_group_busyness_read(gt, i);
> +	}
> +
> +	spin_unlock_irqrestore(&pmu->lock, flags);
> +}
> +
> +static int
> +config_status(struct xe_device *xe, u64 config)
> +{
> +	unsigned int max_gt_id = xe->info.gt_count > 1 ? 1 : 0;
> +	unsigned int gt_id = config_gt_id(config);
> +	struct xe_gt *gt = xe_device_get_gt(xe, gt_id);
> +
> +	if (gt_id > max_gt_id)
> +		return -ENOENT;
> +
> +	switch (config_counter(config)) {
> +	case XE_PMU_INTERRUPTS(0):
> +		if (gt_id)
> +			return -ENOENT;
> +		break;
> +	case XE_PMU_RENDER_GROUP_BUSY(0):
> +	case XE_PMU_COPY_GROUP_BUSY(0):
> +	case XE_PMU_ANY_ENGINE_GROUP_BUSY(0):
> +		if (gt->info.type == XE_GT_TYPE_MEDIA)
> +			return -ENOENT;
> +		break;
> +	case XE_PMU_MEDIA_GROUP_BUSY(0):
> +		if (!(gt->info.engine_mask & (BIT(XE_HW_ENGINE_VCS0) | BIT(XE_HW_ENGINE_VECS0))))
> +			return -ENOENT;
> +		break;
> +	default:
> +		return -ENOENT;
> +	}
> +
> +	return 0;
> +}
> +
> +static int xe_pmu_event_init(struct perf_event *event)
> +{
> +	struct xe_device *xe =
> +		container_of(event->pmu, typeof(*xe), pmu.base);
> +	struct xe_pmu *pmu = &xe->pmu;
> +	int ret;
> +
> +	if (pmu->closed)
> +		return -ENODEV;
> +
> +	if (event->attr.type != event->pmu->type)
> +		return -ENOENT;
> +
> +	/* unsupported modes and filters */
> +	if (event->attr.sample_period) /* no sampling */
> +		return -EINVAL;
> +
> +	if (has_branch_stack(event))
> +		return -EOPNOTSUPP;
> +
> +	if (event->cpu < 0)
> +		return -EINVAL;
> +
> +	/* only allow running on one cpu at a time */
> +	if (!cpumask_test_cpu(event->cpu, &xe_pmu_cpumask))
> +		return -EINVAL;
> +
> +	ret = config_status(xe, event->attr.config);
> +	if (ret)
> +		return ret;
> +
> +	if (!event->parent) {
> +		drm_dev_get(&xe->drm);
> +		event->destroy = xe_pmu_event_destroy;
> +	}
> +
> +	return 0;
> +}
> +
> +static u64 __xe_pmu_event_read(struct perf_event *event)
> +{
> +	struct xe_device *xe =
> +		container_of(event->pmu, typeof(*xe), pmu.base);
> +	const unsigned int gt_id = config_gt_id(event->attr.config);
> +	const u64 config = config_counter(event->attr.config);
> +	struct xe_gt *gt = xe_device_get_gt(xe, gt_id);
> +	struct xe_pmu *pmu = &xe->pmu;
> +	u64 val = 0;
> +
> +	switch (config) {
> +	case XE_PMU_INTERRUPTS(0):
> +		val = READ_ONCE(pmu->irq_count);
> +		break;
> +	case XE_PMU_RENDER_GROUP_BUSY(0):
> +	case XE_PMU_COPY_GROUP_BUSY(0):
> +	case XE_PMU_ANY_ENGINE_GROUP_BUSY(0):
> +	case XE_PMU_MEDIA_GROUP_BUSY(0):
> +		val = engine_group_busyness_read(gt, config);
> +	}
> +
> +	return val;
> +}
> +
> +static void xe_pmu_event_read(struct perf_event *event)
> +{
> +	struct xe_device *xe =
> +		container_of(event->pmu, typeof(*xe), pmu.base);
> +	struct hw_perf_event *hwc = &event->hw;
> +	struct xe_pmu *pmu = &xe->pmu;
> +	u64 prev, new;
> +
> +	if (pmu->closed) {
> +		event->hw.state = PERF_HES_STOPPED;
> +		return;
> +	}
> +again:
> +	prev = local64_read(&hwc->prev_count);
> +	new = __xe_pmu_event_read(event);
> +
> +	if (local64_cmpxchg(&hwc->prev_count, prev, new) != prev)
> +		goto again;
> +
> +	local64_add(new - prev, &event->count);
> +}
> +
> +static void xe_pmu_enable(struct perf_event *event)
> +{
> +	/*
> +	 * Store the current counter value so we can report the correct delta
> +	 * for all listeners. Even when the event was already enabled and has
> +	 * an existing non-zero value.
> +	 */
> +	local64_set(&event->hw.prev_count, __xe_pmu_event_read(event));
> +}
> +
> +static void xe_pmu_event_start(struct perf_event *event, int flags)
> +{
> +	struct xe_device *xe =
> +		container_of(event->pmu, typeof(*xe), pmu.base);
> +	struct xe_pmu *pmu = &xe->pmu;
> +
> +	if (pmu->closed)
> +		return;
> +
> +	xe_pmu_enable(event);
> +	event->hw.state = 0;
> +}
> +
> +static void xe_pmu_event_stop(struct perf_event *event, int flags)
> +{
> +	if (flags & PERF_EF_UPDATE)
> +		xe_pmu_event_read(event);
> +
> +	event->hw.state = PERF_HES_STOPPED;
> +}
> +
> +static int xe_pmu_event_add(struct perf_event *event, int flags)
> +{
> +	struct xe_device *xe =
> +		container_of(event->pmu, typeof(*xe), pmu.base);
> +	struct xe_pmu *pmu = &xe->pmu;
> +
> +	if (pmu->closed)
> +		return -ENODEV;
> +
> +	if (flags & PERF_EF_START)
> +		xe_pmu_event_start(event, flags);
> +
> +	return 0;
> +}
> +
> +static void xe_pmu_event_del(struct perf_event *event, int flags)
> +{
> +	xe_pmu_event_stop(event, PERF_EF_UPDATE);
> +}
> +
> +static int xe_pmu_event_event_idx(struct perf_event *event)
> +{
> +	return 0;
> +}
> +
> +struct xe_ext_attribute {
> +	struct device_attribute attr;
> +	unsigned long val;
> +};
> +
> +static ssize_t xe_pmu_event_show(struct device *dev,
> +				 struct device_attribute *attr, char *buf)
> +{
> +	struct xe_ext_attribute *eattr;
> +
> +	eattr = container_of(attr, struct xe_ext_attribute, attr);
> +	return sprintf(buf, "config=0x%lx\n", eattr->val);
> +}
> +
> +static ssize_t cpumask_show(struct device *dev,
> +			    struct device_attribute *attr, char *buf)
> +{
> +	return cpumap_print_to_pagebuf(true, buf, &xe_pmu_cpumask);
> +}
> +
> +static DEVICE_ATTR_RO(cpumask);
> +
> +static struct attribute *xe_cpumask_attrs[] = {
> +	&dev_attr_cpumask.attr,
> +	NULL,
> +};
> +
> +static const struct attribute_group xe_pmu_cpumask_attr_group = {
> +	.attrs = xe_cpumask_attrs,
> +};
> +
> +#define __event(__counter, __name, __unit) \
> +{ \
> +	.counter = (__counter), \
> +	.name = (__name), \
> +	.unit = (__unit), \
> +	.global = false, \
> +}
> +
> +#define __global_event(__counter, __name, __unit) \
> +{ \
> +	.counter = (__counter), \
> +	.name = (__name), \
> +	.unit = (__unit), \
> +	.global = true, \
> +}
> +
> +static struct xe_ext_attribute *
> +add_xe_attr(struct xe_ext_attribute *attr, const char *name, u64 config)
> +{
> +	sysfs_attr_init(&attr->attr.attr);
> +	attr->attr.attr.name = name;
> +	attr->attr.attr.mode = 0444;
> +	attr->attr.show = xe_pmu_event_show;
> +	attr->val = config;
> +
> +	return ++attr;
> +}
> +
> +static struct perf_pmu_events_attr *
> +add_pmu_attr(struct perf_pmu_events_attr *attr, const char *name,
> +	     const char *str)
> +{
> +	sysfs_attr_init(&attr->attr.attr);
> +	attr->attr.attr.name = name;
> +	attr->attr.attr.mode = 0444;
> +	attr->attr.show = perf_event_sysfs_show;
> +	attr->event_str = str;
> +
> +	return ++attr;
> +}
> +
> +static struct attribute **
> +create_event_attributes(struct xe_pmu *pmu)
> +{
> +	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
> +	static const struct {
> +		unsigned int counter;
> +		const char *name;
> +		const char *unit;
> +		bool global;
> +	} events[] = {
> +		__global_event(0, "interrupts", NULL),
> +		__event(1, "render-group-busy", "ns"),
> +		__event(2, "copy-group-busy", "ns"),
> +		__event(3, "media-group-busy", "ns"),
> +		__event(4, "any-engine-group-busy", "ns"),
> +	};
> +
> +	struct perf_pmu_events_attr *pmu_attr = NULL, *pmu_iter;
> +	struct xe_ext_attribute *xe_attr = NULL, *xe_iter;
> +	struct attribute **attr = NULL, **attr_iter;
> +	unsigned int count = 0;
> +	unsigned int i, j;
> +	struct xe_gt *gt;
> +
> +	/* Count how many counters we will be exposing. */
> +	for_each_gt(gt, xe, j) {
> +		for (i = 0; i < ARRAY_SIZE(events); i++) {
> +			u64 config = ___XE_PMU_OTHER(j, events[i].counter);
> +
> +			if (!config_status(xe, config))
> +				count++;
> +		}
> +	}
> +
> +	/* Allocate attribute objects and table. */
> +	xe_attr = kcalloc(count, sizeof(*xe_attr), GFP_KERNEL);
> +	if (!xe_attr)
> +		goto err_alloc;
> +
> +	pmu_attr = kcalloc(count, sizeof(*pmu_attr), GFP_KERNEL);
> +	if (!pmu_attr)
> +		goto err_alloc;
> +
> +	/* Max one pointer of each attribute type plus a termination entry. */
> +	attr = kcalloc(count * 2 + 1, sizeof(*attr), GFP_KERNEL);
> +	if (!attr)
> +		goto err_alloc;
> +
> +	xe_iter = xe_attr;
> +	pmu_iter = pmu_attr;
> +	attr_iter = attr;
> +
> +	for_each_gt(gt, xe, j) {
> +		for (i = 0; i < ARRAY_SIZE(events); i++) {
> +			u64 config = ___XE_PMU_OTHER(j, events[i].counter);
> +			char *str;
> +
> +			if (config_status(xe, config))
> +				continue;
> +
> +			if (events[i].global)
> +				str = kstrdup(events[i].name, GFP_KERNEL);
> +			else
> +				str = kasprintf(GFP_KERNEL, "%s-gt%u",
> +						events[i].name, j);
> +			if (!str)
> +				goto err;
> +
> +			*attr_iter++ = &xe_iter->attr.attr;
> +			xe_iter = add_xe_attr(xe_iter, str, config);
> +
> +			if (events[i].unit) {
> +				if (events[i].global)
> +					str = kasprintf(GFP_KERNEL, "%s.unit",
> +							events[i].name);
> +				else
> +					str = kasprintf(GFP_KERNEL, "%s-gt%u.unit",
> +							events[i].name, j);
> +				if (!str)
> +					goto err;
> +
> +				*attr_iter++ = &pmu_iter->attr.attr;
> +				pmu_iter = add_pmu_attr(pmu_iter, str,
> +							events[i].unit);
> +			}
> +		}
> +	}
> +
> +	pmu->xe_attr = xe_attr;
> +	pmu->pmu_attr = pmu_attr;
> +
> +	return attr;
> +
> +err:
> +	for (attr_iter = attr; *attr_iter; attr_iter++)
> +		kfree((*attr_iter)->name);
> +
> +err_alloc:
> +	kfree(attr);
> +	kfree(xe_attr);
> +	kfree(pmu_attr);
> +
> +	return NULL;
> +}
> +
> +static void free_event_attributes(struct xe_pmu *pmu)
> +{
> +	struct attribute **attr_iter = pmu->events_attr_group.attrs;
> +
> +	for (; *attr_iter; attr_iter++)
> +		kfree((*attr_iter)->name);
> +
> +	kfree(pmu->events_attr_group.attrs);
> +	kfree(pmu->xe_attr);
> +	kfree(pmu->pmu_attr);
> +
> +	pmu->events_attr_group.attrs = NULL;
> +	pmu->xe_attr = NULL;
> +	pmu->pmu_attr = NULL;
> +}
> +
> +static int xe_pmu_cpu_online(unsigned int cpu, struct hlist_node *node)
> +{
> +	struct xe_pmu *pmu = hlist_entry_safe(node, typeof(*pmu), cpuhp.node);
> +
> +	BUG_ON(!pmu->base.event_init);
> +
> +	/* Select the first online CPU as a designated reader. */
> +	if (cpumask_empty(&xe_pmu_cpumask))
> +		cpumask_set_cpu(cpu, &xe_pmu_cpumask);
> +
> +	return 0;
> +}
> +
> +static int xe_pmu_cpu_offline(unsigned int cpu, struct hlist_node *node)
> +{
> +	struct xe_pmu *pmu = hlist_entry_safe(node, typeof(*pmu), cpuhp.node);
> +	unsigned int target = xe_pmu_target_cpu;
> +
> +	BUG_ON(!pmu->base.event_init);
> +
> +	/*
> +	 * Unregistering an instance generates a CPU offline event which we must
> +	 * ignore to avoid incorrectly modifying the shared xe_pmu_cpumask.
> +	 */
> +	if (pmu->closed)
> +		return 0;
> +
> +	if (cpumask_test_and_clear_cpu(cpu, &xe_pmu_cpumask)) {
> +		target = cpumask_any_but(topology_sibling_cpumask(cpu), cpu);
> +
> +		/* Migrate events if there is a valid target */
> +		if (target < nr_cpu_ids) {
> +			cpumask_set_cpu(target, &xe_pmu_cpumask);
> +			xe_pmu_target_cpu = target;
> +		}
> +	}
> +
> +	if (target < nr_cpu_ids && target != pmu->cpuhp.cpu) {
> +		perf_pmu_migrate_context(&pmu->base, cpu, target);
> +		pmu->cpuhp.cpu = target;
> +	}
> +
> +	return 0;
> +}
> +
> +static enum cpuhp_state cpuhp_slot = CPUHP_INVALID;
> +
> +int xe_pmu_init(void)
> +{
> +	int ret;
> +
> +	ret = cpuhp_setup_state_multi(CPUHP_AP_ONLINE_DYN,
> +				      "perf/x86/intel/xe:online",
> +				      xe_pmu_cpu_online,
> +				      xe_pmu_cpu_offline);
> +	if (ret < 0)
> +		pr_notice("Failed to setup cpuhp state for xe PMU! (%d)\n",
> +			  ret);
> +	else
> +		cpuhp_slot = ret;
> +
> +	return 0;
> +}
> +
> +void xe_pmu_exit(void)
> +{
> +	if (cpuhp_slot != CPUHP_INVALID)
> +		cpuhp_remove_multi_state(cpuhp_slot);
> +}
> +
> +static int xe_pmu_register_cpuhp_state(struct xe_pmu *pmu)
> +{
> +	if (cpuhp_slot == CPUHP_INVALID)
> +		return -EINVAL;
> +
> +	return cpuhp_state_add_instance(cpuhp_slot, &pmu->cpuhp.node);
> +}
> +
> +static void xe_pmu_unregister_cpuhp_state(struct xe_pmu *pmu)
> +{
> +	cpuhp_state_remove_instance(cpuhp_slot, &pmu->cpuhp.node);
> +}
> +
> +void xe_pmu_suspend(struct xe_gt *gt)
> +{
> +	engine_group_busyness_store(gt);
> +}
> +
> +static void xe_pmu_unregister(struct drm_device *device, void *arg)
> +{
> +	struct xe_pmu *pmu = arg;
> +
> +	if (!pmu->base.event_init)
> +		return;
> +
> +	/*
> +	 * "Disconnect" the PMU callbacks - since all are atomic synchronize_rcu
> +	 * ensures all currently executing ones will have exited before we
> +	 * proceed with unregistration.
> +	 */
> +	pmu->closed = true;
> +	synchronize_rcu();
> +
> +	xe_pmu_unregister_cpuhp_state(pmu);
> +
> +	perf_pmu_unregister(&pmu->base);
> +	pmu->base.event_init = NULL;
> +	kfree(pmu->base.attr_groups);
> +	kfree(pmu->name);
> +	free_event_attributes(pmu);
> +}
> +
> +void xe_pmu_register(struct xe_pmu *pmu)
> +{
> +	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
> +	const struct attribute_group *attr_groups[] = {
> +		&pmu->events_attr_group,
> +		&xe_pmu_cpumask_attr_group,
> +		NULL
> +	};
> +
> +	int ret = -ENOMEM;
> +
> +	spin_lock_init(&pmu->lock);
> +	pmu->cpuhp.cpu = -1;
> +
> +	pmu->name = kasprintf(GFP_KERNEL,
> +			      "xe_%s",
> +			      dev_name(xe->drm.dev));
> +	if (pmu->name)
> +		/* tools/perf reserves colons as special. */
> +		strreplace((char *)pmu->name, ':', '_');
> +
> +	if (!pmu->name)
> +		goto err;
> +
> +	pmu->events_attr_group.name = "events";
> +	pmu->events_attr_group.attrs = create_event_attributes(pmu);
> +	if (!pmu->events_attr_group.attrs)
> +		goto err_name;
> +
> +	pmu->base.attr_groups = kmemdup(attr_groups, sizeof(attr_groups),
> +					GFP_KERNEL);
> +	if (!pmu->base.attr_groups)
> +		goto err_attr;
> +
> +	pmu->base.module	= THIS_MODULE;
> +	pmu->base.task_ctx_nr	= perf_invalid_context;
> +	pmu->base.event_init	= xe_pmu_event_init;
> +	pmu->base.add		= xe_pmu_event_add;
> +	pmu->base.del		= xe_pmu_event_del;
> +	pmu->base.start		= xe_pmu_event_start;
> +	pmu->base.stop		= xe_pmu_event_stop;
> +	pmu->base.read		= xe_pmu_event_read;
> +	pmu->base.event_idx	= xe_pmu_event_event_idx;
> +
> +	ret = perf_pmu_register(&pmu->base, pmu->name, -1);
> +	if (ret)
> +		goto err_groups;
> +
> +	ret = xe_pmu_register_cpuhp_state(pmu);
> +	if (ret)
> +		goto err_unreg;
> +
> +	ret = drmm_add_action_or_reset(&xe->drm, xe_pmu_unregister, pmu);
> +	if (ret)
> +		goto err_cpuhp;
> +
> +	return;
> +
> +err_cpuhp:
> +	xe_pmu_unregister_cpuhp_state(pmu);
> +err_unreg:
> +	perf_pmu_unregister(&pmu->base);
> +err_groups:
> +	kfree(pmu->base.attr_groups);
> +err_attr:
> +	pmu->base.event_init = NULL;
> +	free_event_attributes(pmu);
> +err_name:
> +	kfree(pmu->name);
> +err:
> +	drm_notice(&xe->drm, "Failed to register PMU!\n");
> +}
> diff --git a/drivers/gpu/drm/xe/xe_pmu.h b/drivers/gpu/drm/xe/xe_pmu.h
> new file mode 100644
> index 000000000000..a99d4ddd023e
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_pmu.h
> @@ -0,0 +1,25 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _XE_PMU_H_
> +#define _XE_PMU_H_
> +
> +#include "xe_gt_types.h"
> +#include "xe_pmu_types.h"
> +
> +#if IS_ENABLED(CONFIG_PERF_EVENTS)
> +int xe_pmu_init(void);
> +void xe_pmu_exit(void);
> +void xe_pmu_register(struct xe_pmu *pmu);
> +void xe_pmu_suspend(struct xe_gt *gt);
> +#else
> +static inline int xe_pmu_init(void) { return 0; }
> +static inline void xe_pmu_exit(void) {}
> +static inline void xe_pmu_register(struct xe_pmu *pmu) {}
> +static inline void xe_pmu_suspend(struct xe_gt *gt) {}
> +#endif
> +
> +#endif
> +
> diff --git a/drivers/gpu/drm/xe/xe_pmu_types.h b/drivers/gpu/drm/xe/xe_pmu_types.h
> new file mode 100644
> index 000000000000..4ccc7e9042f6
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_pmu_types.h
> @@ -0,0 +1,76 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _XE_PMU_TYPES_H_
> +#define _XE_PMU_TYPES_H_
> +
> +#include <linux/perf_event.h>
> +#include <linux/spinlock_types.h>
> +#include <uapi/drm/xe_drm.h>
> +
> +enum {
> +	__XE_SAMPLE_RENDER_GROUP_BUSY,
> +	__XE_SAMPLE_COPY_GROUP_BUSY,
> +	__XE_SAMPLE_MEDIA_GROUP_BUSY,
> +	__XE_SAMPLE_ANY_ENGINE_GROUP_BUSY,
> +	__XE_NUM_PMU_SAMPLERS
> +};
> +
> +#define XE_PMU_MAX_GT 2
> +
> +struct xe_pmu {
> +	/**
> +	 * @cpuhp: Struct used for CPU hotplug handling.
> +	 */
> +	struct {
> +		struct hlist_node node;
> +		unsigned int cpu;
> +	} cpuhp;
> +	/**
> +	 * @base: PMU base.
> +	 */
> +	struct pmu base;
> +	/**
> +	 * @closed: xe is unregistering.
> +	 */
> +	bool closed;
> +	/**
> +	 * @name: Name as registered with perf core.
> +	 */
> +	const char *name;
> +	/**
> +	 * @lock: Lock protecting enable mask and ref count handling.
> +	 */
> +	spinlock_t lock;
> +	/**
> +	 * @sample: Current and previous (raw) counters.
> +	 *
> +	 * These counters are updated when the device is awake.
> +	 *
> +	 */
> +	u64 sample[XE_PMU_MAX_GT][__XE_NUM_PMU_SAMPLERS];
> +	/**
> +	 * @irq_count: Number of interrupts
> +	 *
> +	 * Intentionally unsigned long to avoid atomics or heuristics on 32bit.
> +	 * 4e9 interrupts are a lot and postprocessing can really deal with an
> +	 * occasional wraparound easily. It's 32bit after all.
> +	 */
> +	unsigned long irq_count;
> +	/**
> +	 * @events_attr_group: Device events attribute group.
> +	 */
> +	struct attribute_group events_attr_group;
> +	/**
> +	 * @xe_attr: Memory block holding device attributes.
> +	 */
> +	void *xe_attr;
> +	/**
> +	 * @pmu_attr: Memory block holding device attributes.
> +	 */
> +	void *pmu_attr;
> +};
> +
> +#endif
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 86f16d50e9cc..75c9a7fe3490 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -1056,6 +1056,22 @@ struct drm_xe_vm_madvise {
>  	__u64 reserved[2];
>  };
>  
> +/* PMU event config IDs */
> +
> +/*
> + * Top bits of every counter are GT id.
> + */
> +#define __XE_PMU_GT_SHIFT (56)
> +
> +#define ___XE_PMU_OTHER(gt, x) \
> +	(((__u64)(x)) | ((__u64)(gt) << __XE_PMU_GT_SHIFT))
> +
> +#define XE_PMU_INTERRUPTS(gt)			___XE_PMU_OTHER(gt, 0)
> +#define XE_PMU_RENDER_GROUP_BUSY(gt)		___XE_PMU_OTHER(gt, 1)
> +#define XE_PMU_COPY_GROUP_BUSY(gt)		___XE_PMU_OTHER(gt, 2)
> +#define XE_PMU_MEDIA_GROUP_BUSY(gt)		___XE_PMU_OTHER(gt, 3)
> +#define XE_PMU_ANY_ENGINE_GROUP_BUSY(gt)	___XE_PMU_OTHER(gt, 4)

Could you please add uapi documentation here showing examples on how
this is used and all?

> +
>  #if defined(__cplusplus)
>  }
>  #endif
> -- 
> 2.25.1
> 
