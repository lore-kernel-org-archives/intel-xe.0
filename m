Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7D46C6FA8E
	for <intel-xe@archiver.kernel.org>; Fri, 24 Feb 2023 23:29:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49D6510E036;
	Fri, 24 Feb 2023 23:29:28 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE15610E036
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Feb 2023 23:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677281365; x=1708817365;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6fkhZcJlvFi7MlsbkRv0Kf67Mb2nwm7yrGDJLBMgGmw=;
 b=kWTTKo2+ujaRYNASbgvIB/+LH2ebx2rekjGvu/AEHBT4dlpoRNwaR3+F
 M95Yx6iq6QRj80eWx1F2BlAW+gfB20KFVbgPqdODFHJkQLlLcCozB0yH8
 N3YtG27SrgV+cE4Z1oc7q+KxEMNzKV03MaJ4YCLx2sSmzQGVYmnscJGpz
 b+Mh/P9LBJQgsqQyKriXJrGjxeZeN89VnUSoRvOKiKnM6+NHuteelplRF
 9A83jhNtGQImr/KkG9zy7Laf2LdfBdOzRNndcnod/qBNWnxzwMn2azw7W
 XRZwhvNR8jSsyYTx0euuzCv3NIWxFOCccUvk/z/CQ0kqnS1E4Bc2inExh A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="333607529"
X-IronPort-AV: E=Sophos;i="5.97,326,1669104000"; d="scan'208";a="333607529"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2023 15:29:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="741820242"
X-IronPort-AV: E=Sophos;i="5.97,326,1669104000"; d="scan'208";a="741820242"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga004.fm.intel.com with ESMTP; 24 Feb 2023 15:29:25 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 24 Feb 2023 15:29:25 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 24 Feb 2023 15:29:24 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 24 Feb 2023 15:29:24 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.173)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 24 Feb 2023 15:29:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mYAyMYkTtXfbef9wFhHELM0V3oT+ZujIxelO0CJP1K9meGuUb+7Cu0tVaGXjnDbKRg7UKH0X9SLMb08snzoDuD6fbqEhzwixlGP6x5CZcOxWMpV2bcg0fCyjei6kgrH5pWv566q9YdqZV7A5H4CUJ1TmHaEqtj1+OQxtGrY7bTU+G4JvSo9RzJP6GWxA86gS5XlpSIsrT5sQmywX+ZquvV4i8b3SkZdhgSa2EmIIIxRrREwvftufMyNOUAw95ONgMADHGFgktaR72xqzXSFTX7hMC3v7Z2NGnYaVwT6ybcqViWWmrcqA4RH2zFUxE1/1RXRZ7N78SE+sJYET6qAvXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=60nnJeB1pD/iN9gGT5xrJYqrDTZHS9hGbkIwje1gMXM=;
 b=NcIl8pIrpn/qGGqhm7S+dG93gJJlBQbhq3a+vFXuYrSKDyUKLEYwD7zrf6lS99QavUNv5Z4UpgezSGLzRkfOE+l1rm7yrl+aJg4VUfURq9f9s6H75SQ74rYDwl9hzisI4ruGM12ZEWpoIelm8gOrEkdZ0az/Z5+czqknfs8qsaR62FJaGSYAIckF0blbvaJzi12iqBAV75jiP8+Jr09R0UaMk7k86mJiOg6NaCMid7dlvDN0L9yE5hkPn/mFKJ2pFf9bMP6eGyXSJ/bEY369ZYMo40yJD5164UiSvq9JK+yIle1DKNHvpRF3vV5p6lWNgk/quIKH6C4dPkzeZXSoEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB6741.namprd11.prod.outlook.com (2603:10b6:a03:47a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.21; Fri, 24 Feb
 2023 23:29:17 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8%5]) with mapi id 15.20.6134.024; Fri, 24 Feb 2023
 23:29:17 +0000
Date: Fri, 24 Feb 2023 15:29:14 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <20230224232914.gcf6bqu6togmabzl@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20230224221601.3996099-1-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230224221601.3996099-1-matthew.d.roper@intel.com>
X-ClientProxiedBy: SJ0PR13CA0130.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::15) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB6741:EE_
X-MS-Office365-Filtering-Correlation-Id: c4c35c94-f15b-466d-3871-08db16bef23a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n/IfrzgstLjtrUNQb0pzuVIzlJm0hrvI4ktCary+PjkMRWRMG/7TK6CpIm8fdo+tSk4AsajV+jEJcAq8wkw+qrozgFAT54ROm41NWKWtAbsfb7EqzKlM3ZYohTX4aJ+6IhEAsXBnaqfEw0sH98Yd1dX1fZofqleU0XpcFRLSrB2Lxw9nb5C32n4yKvHDlWyFFrbYjRJRbk+3MPTY+37tj8ezHmhrT+VLS4TDGNmTR/CYXCT9RlXijt1ywTK1hPuA8fK7XtWP7r7s/Q2hsEzA8Zc+byTuIo9YD2UFrL50DKfyGQfHT36HDEvriPuuW63z9pxPFjQetCDVTbQoBDoj1Nf+pb6HwnweHODF3lJle5xaUN8++xfZv73NSFb+eHQWp2NwPdM3sn7EALBwKCFPVt3NdhPQd+/TUHjchbZ2KKaqKYraxFk7RRzhFQfbIj9ga0lhM/ajNl01Ewaqh7TlP8CAzA6L9C62YVBtsdKvQ7dDBpb0hGigxQI5BmLuZVJQ2u7gjE7Y2d+fFZEvC10BKjktut/WD5w4cI4qn0GRXCK+GWKzWmQHtBTOm+q0RTw3Q5ttup+yBqaCgsz1OzGVqlFGuqFgLTVHXaQFbpBNYBCf0yIjvh86xsAzHWnrCETc9Z3BRtS0ORTlob8xAaKsFQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(376002)(136003)(346002)(39860400002)(366004)(451199018)(38100700002)(2906002)(82960400001)(83380400001)(36756003)(6486002)(186003)(26005)(6636002)(478600001)(1076003)(6512007)(6666004)(6506007)(9686003)(86362001)(6862004)(316002)(41300700001)(8936002)(8676002)(5660300002)(4326008)(66556008)(66476007)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GFIZdiIihT0XjKTYLucGNIur99J5raA+sQvdhXgxjOcFHek1xHe5/ZHcExtV?=
 =?us-ascii?Q?yboXku66+b13YBTSwT7IKqb5UyzgmrxysC71SbqlzGHUhWLlc/OHKN0K28BX?=
 =?us-ascii?Q?yCgFLBYUVjageYxeri3H9KHJKJl57Ae06iz1NvgoQ/yNCHSipqw2J1WMEYD4?=
 =?us-ascii?Q?p4FNdyB5L1hEHKoOjlqPu6+tw/8jFr5R/C9ClRADuMNlowIktsNINAAe/gcw?=
 =?us-ascii?Q?41rtvtn9s/YE3qR44VNbq/ovRmtc0KY15LfA0UdaWU/tqihnJm0o2YAiOzme?=
 =?us-ascii?Q?dgG5RndiRSQujopFlexel2evTCEpYRNzuWUWHmHdtMC2QHf+cGF1DpLuRoTK?=
 =?us-ascii?Q?pnCuk2E7P0H3g9HiqYcWYUCrrY1EIbUVAglWznYmsW31ohUyF+pi53ANsIhW?=
 =?us-ascii?Q?4MnklwuaGcth0e01Cdm98xKmi3V2kT1L8VYQzOgHU9mOyTIZvCPgT38Z9SrB?=
 =?us-ascii?Q?QIIM8rSyRYd+BRbBkHVv7vUMKcO/kE4aHMA/43aCLXyD6npgFsux0YM/iM2x?=
 =?us-ascii?Q?h9vWXrWbVo5yxboYC7GHCgm1SDm9nzVrEpIenfAPGy9G/d7FuNhxjpxpND1i?=
 =?us-ascii?Q?LZxsTMcvDW07XwhH2rvmpZfBPZQlUvuxCgQrad1wVPw4vGAREJaZVjz2XFtJ?=
 =?us-ascii?Q?vIEHRiGgFD4PAhTit4zc5w84B9mt02wge4IZCHy5DddB9JJagn9wxucvRa30?=
 =?us-ascii?Q?2+3CxBHWk4Uq/QHXvvRFHnB04Lpusx9b/8NrDxM+CF4V10JjdL30k9wKarf5?=
 =?us-ascii?Q?A8HEW/yLdFTlZBxA90vkRi74n+9hJyJNObqRijqbkxCJ2H39nss7+ZJ3/K3e?=
 =?us-ascii?Q?8MyKg8UhvdbefdQg9ujQvmqeAonLHmGXNSbXwa1CbZsrFZo3mBhOXKOcti+X?=
 =?us-ascii?Q?RqpXz+410DNhnxbUgWfWt8BPUj78xhiJ3CbbKLAk6mq9SWTNAUWfbalC7cFn?=
 =?us-ascii?Q?Z5nKncziMQH5ycd8SjkM9ZdoHH768Cm4Lb+ivMzA5+c0cGJj5N/r5DbrqW/s?=
 =?us-ascii?Q?cC0rTZU2P2yN+lvfH/GIktdqXOz1h5xV4+dwOLLsbiEPQ1kKs1n48n3J9Bi3?=
 =?us-ascii?Q?Wfc7QVEii4rViJCIU2mkoJsgnI5yZSQb54RjHI3XLuavQbHeDxuvmNYQdeYc?=
 =?us-ascii?Q?eIuSIfQ/B/rW1bpjo7Kim7qAYA9fgKz5WqKtgqheoQYyWuF2B3ZAUaa/Ctrh?=
 =?us-ascii?Q?XLgh5l3daDTlHP2nLziWBiE9aY9uu3p7JK67/HWiqh/xbSOjXyoI8ZQGHOJa?=
 =?us-ascii?Q?+dyhKWLLQx8iP9vzowQG1JkGsuHPRV+psXQae8RoXegBIG5tLBvdz2BObXQG?=
 =?us-ascii?Q?Q2jdLz6bl9WRSNNipp8tsO9G3GFesjepuwEf7RL0gghTIjVipRzGoJZ1rBoR?=
 =?us-ascii?Q?iabntUzPXmqfI+JSSoFNunX1gvJA/RHHgGSXJf314ZZyfPDOOuBr6bPHZI/A?=
 =?us-ascii?Q?hp/NmTfdalML2pWarpYyhpnL5qW8zCufqBRnGYRNRI0diitWWxpmzX26XUU0?=
 =?us-ascii?Q?JoHI041oXNSeBrALq6D+467JBA5S4P6f6jpZmFEOyUzbqsJ/n+mPAF0+4Y0A?=
 =?us-ascii?Q?p03uBjm4euoAqp59uOsobEwf0oZL6nZhygtPnZahvngLuZzYJDbQYLmtPC/x?=
 =?us-ascii?Q?sQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c4c35c94-f15b-466d-3871-08db16bef23a
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2023 23:29:16.9368 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FBC9lWVZ9TvzJQZU9TViN3Az2B1S0mG4H+8u5n/QJyIvBCwYjob04M/FAlboghiRMB1+qFqAH+S1gOr4GXLIqK0FFFmEbVYnmaApTwVHb6Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6741
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Assume MTL's forcewake register
 continues to future platforms
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

On Fri, Feb 24, 2023 at 02:16:01PM -0800, Matt Roper wrote:
>Starting with MTL, the GT forcewake ack register moved from 0x130044 to
>0xDFC.  We expect this change to carry forward to future platforms as
>well, so forcewake initialization should use an IP version check instead
>of matching the MTL platform specifically.
>
>The (re)definition of FORCEWAKE_ACK_GT_MTL in the forcewake file is also
>unnecessary; we can take the definition that already exists in the
>dedicated register header.

In my register cleanup series I left it in the .c, but I can add it to
regs/xe_gt_regs.h too

>
>Bspec: 65031, 64629
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_force_wake.c | 4 +---
> 1 file changed, 1 insertion(+), 3 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
>index 5bd87118ac73..21d04a02847b 100644
>--- a/drivers/gpu/drm/xe/xe_force_wake.c
>+++ b/drivers/gpu/drm/xe/xe_force_wake.c
>@@ -36,8 +36,6 @@ static void domain_init(struct xe_force_wake_domain *domain,
> 	domain->mask = mask;
> }
>
>-#define FORCEWAKE_ACK_GT_MTL                 _MMIO(0xdfc)
>-
> void xe_force_wake_init_gt(struct xe_gt *gt, struct xe_force_wake *fw)
> {
> 	struct xe_device *xe = gt_to_xe(gt);
>@@ -48,7 +46,7 @@ void xe_force_wake_init_gt(struct xe_gt *gt, struct xe_force_wake *fw)
> 	/* Assuming gen11+ so assert this assumption is correct */
> 	XE_BUG_ON(GRAPHICS_VER(gt_to_xe(gt)) < 11);
>
>-	if (xe->info.platform == XE_METEORLAKE) {
>+	if (xe->info.graphics_verx100 >= 1270) {
> 		domain_init(&fw->domains[XE_FW_DOMAIN_ID_GT],
> 			    XE_FW_DOMAIN_ID_GT,
> 			    FORCEWAKE_GT_GEN9.reg,
>-- 
>2.39.1
>
