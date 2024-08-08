Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34980C3DA7F
	for <intel-xe@archiver.kernel.org>; Thu,  8 Aug 2024 03:11:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE67010E08D;
	Thu,  8 Aug 2024 03:11:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gsm7yCeN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEA8C10E08D
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Aug 2024 03:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723086710; x=1754622710;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=OocmkVDCSJEDJxBgLYPreaOFTOtLBhHolpQ6vIEZP5Q=;
 b=gsm7yCeN0aZp6GJYNZ3NN81sSkw1UO4z96AeyNFXUfkw9M784cbRTlHQ
 68D2OalGZ2RgikeVXD7AvdmjVBzN88mV9ACRQmFDPhzVnBNjO19HWghbt
 DspXciL5lL/JTcXY56+C8i2F1P3VfYk8YkeYBMzhgfYkDtxOQryK5wFDU
 vD/6udKB641m3izsASpk/+upiQEoioHkp4sEAoODI/ikLHoEkGq0g3KVd
 qglaqfHsJNKfG29jQ9w0LizWrWME7oOsgC3couJPuMec8bcWygpZBK4j9
 F4UKHGOLw4sSWzaptkffreqe1+Ee0r5V8Enmerr0AM++pKDyJ51Fyz62G A==;
X-CSE-ConnectionGUID: 6oFOg8EuTP+kXgoDvwfvEg==
X-CSE-MsgGUID: M89Hw3//S6u4Dor/BBQeCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="32597061"
X-IronPort-AV: E=Sophos;i="6.09,271,1716274800"; d="scan'208";a="32597061"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 20:11:49 -0700
X-CSE-ConnectionGUID: 4iPM99HxRB+LqmwaYciaiw==
X-CSE-MsgGUID: DK/4x9s4Sje4iDykidf6MA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,271,1716274800"; d="scan'208";a="56927903"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Aug 2024 20:11:50 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 7 Aug 2024 20:11:49 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 7 Aug 2024 20:11:49 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 7 Aug 2024 20:11:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E+PWyEOQGqqreOjQ3Wyl8+kgMgeYj28eSpzButJpyl0XJLTJfon5gPToo+ySQGeIeW3kdMG+uhuqkcr9RRusbeH99j/8aOvwJnogFywUkUY7V4KdDDYq+Dz/lHQPvi7jcvgdNeaeDOju0JX/Oo+Gsg7P2rSrwB/stp8wwq0LuNidX1yMO3bm6kQHPT+UmoKWeHQBIa0gyNuhO4q4dcZf857BYDJccM2G4D9z7WuYGcF3MK7/5HUFOHfrgzogR7cvNpqEBTv56XwxVqdvs6TDy8w3D1xIQmVCL8SJ4IDr3cAR7ckoXhnreZbqe9Qs+YdS2aeV0rXwE+yhxXzuOse0+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NbmhZLV8WWeVztvdFZXChlEWXZLMQGQ+YGc5yw/6uwY=;
 b=IeaQs4kZHx2zCBorFdBwHEM7ik4R1lS/absD/GjbfjL4fm9Vd/6I7z9P8ms1jIYBy2O+8EI4Zz/XvB6LGvaIDkk/HOA1aPlKH3pEkXvbTvO0rOWOVH4groFtZi6UJqfXI8msp9YPE2iGe56kzAnw9IwFpGySuT3+0v37VBYK3mVWkGPhyOkdDiFzswF+Q+cAhnEUTFHaUJe29SteiH9JvoFKv1Q0yaeNpNBAOtYVM9yD8IhcjzznoNbFm2FWN5wXJUZXsNDHoj/8jdkp1QtTxAskzYyLOB1FwT+M5Mg6N9ly+dBQbcE/s/UL7eMB9hzqjzkER2D7FM4hiNPbZJXcAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN6PR11MB8171.namprd11.prod.outlook.com (2603:10b6:208:471::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Thu, 8 Aug
 2024 03:11:46 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7828.023; Thu, 8 Aug 2024
 03:11:46 +0000
Date: Thu, 8 Aug 2024 03:10:27 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v7 04/13] drm/xe/hw_engine_group: Add helper to suspend
 faulting LR jobs
Message-ID: <ZrQ3IwoGX/spJJf9@DUT025-TGLU.fm.intel.com>
References: <20240807162416.1307061-1-francois.dugast@intel.com>
 <20240807162416.1307061-5-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240807162416.1307061-5-francois.dugast@intel.com>
X-ClientProxiedBy: BYAPR08CA0044.namprd08.prod.outlook.com
 (2603:10b6:a03:117::21) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN6PR11MB8171:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c8f4383-be7a-402c-4f89-08dcb757d605
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?eQ3XP4PSCS7KEynqyVHmR63S0joA7ODAhKhMVOvj31QO53t018WzsewZ8huF?=
 =?us-ascii?Q?YXkle5rAjj/gDLJDJj7BaawohWzssPrJ5Azo8QSah45tSxK+dNeoYcYItHEJ?=
 =?us-ascii?Q?4Q5CzPv92U5XGwQ8NPu6ZoQ2iZIEUxfIAE4OBRkiAEsrwOT5Tkyfrra94BkK?=
 =?us-ascii?Q?QM2DsklDuQhD/YeCgNWEgfZzQ7beSvEOyGeZ92JtqWxBqvIl/YLRhywdxTvA?=
 =?us-ascii?Q?BHbXsiNPsmW9KH1MmFsSoaGUh/pe38GhKtAgNptjZu2Lv+tpwf9c3m3HTO+t?=
 =?us-ascii?Q?mSndxteD5g1w6IoLjvpFOq1UACP4EeroXmqhBsV+qelUfDxLNNUi7PciLnw/?=
 =?us-ascii?Q?+9uTtGDCvBoYkuIF9soznQLyCA/PcATACqftjFZqcw8DXEeIViEljhFFxD7q?=
 =?us-ascii?Q?qON9RNky0KnseuLMIxqtNXYJVwXxjfz7w/xBgfpvzMrIBIqy7C+am0aoXzYy?=
 =?us-ascii?Q?Q6V1Dl3YVHiw7BQ7WjqkdeMfcUZedTp1o2swl+Dl0IK5gIdvihM4PzywoUBc?=
 =?us-ascii?Q?Gk7cmvmqXx7TB+iHUfb08QmjOnZ/LIQSl1b5AvLSE+9TcrxKKBUQ4kfrMSIz?=
 =?us-ascii?Q?u16RSzhclVZ7RO4C5TkmVpXVwnfWui61YD3IsqCoTp/fgYdfwAY+eCHFxWXR?=
 =?us-ascii?Q?12xS34p65hCcxBMlyOM9CXgrS6xsVq+YiBqdpw+XGIIWXIum0zQSr5KNHFCW?=
 =?us-ascii?Q?YV8bU6Q3fBbQTKO9ESyphfWCh1ocjoLtaCbXXKUAqA7Oe4wuhSfxkJYCr9OB?=
 =?us-ascii?Q?wEzB78CwUXZ6AECAfIqNyEgUPZG6R2YqerSBrF9CXRIAVyNpZLx2HaOCgoOA?=
 =?us-ascii?Q?u7Rpc8p1/Qi1nmyyAgT6X0kXRXiB8oB3U1/YYNtePzKT9elUeDCXn+HGFWAu?=
 =?us-ascii?Q?t5JWnYfxPD1cgDDERjPuhMHFPjxU3llnQSlJm2km9VYVU9hqyyhqMsfs5J5g?=
 =?us-ascii?Q?lst6yQO0GZL2Q8h0Z1Vgl6Lz8PKIq2ArE0pJ3lyRWvIvC0TTwrCntAxIMi/d?=
 =?us-ascii?Q?qL67UM56ue+lYF5lRa0kFbGxbiYuFRSMfYU1cYHpYFCF5iUHV7CPMHqG+mQv?=
 =?us-ascii?Q?YtfWzXKk6iZ/ouf72TWqe8PHU/lV58ytEZFd+c2iDPcmF+dU5iY/gArHxF6U?=
 =?us-ascii?Q?fLCMKKooCsq3doVqwWg7sljeCvrloKHMEftEJw3PGhKvBSnEN4iCf6BKnY9S?=
 =?us-ascii?Q?W4dNWnJSDUBO2K2CiwIsSHzrQQwt9X1doHlK2ChDvXy1/YSbveQcmElzBoN7?=
 =?us-ascii?Q?s24mLHhklAvJyTxKOkjLyB2r4R5LUMZP46OIfk5f/43pvxk/BrR6ExGELUIU?=
 =?us-ascii?Q?4A8+Wpe4ek7sPdxl3wMW4r+zYlU5+q1Sr5dqL6LQxoV5tQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qPEbE6yLHwwKNGm0yWF2MvUh8e8negLZPtJW5y+kMAeXFFC0XoXOFv2mVZxG?=
 =?us-ascii?Q?F6EoHV+NsdEo/QEruHw5XLCAz7F+pPfkWiLmffjvj7Tt435voeLNDwzKjyak?=
 =?us-ascii?Q?Zl7WGEwNZYk3UWUSuPjFZUWiLQad13v8skB7OTe8lWygCcrMWPefcwkVUDBr?=
 =?us-ascii?Q?aPEoTjeMtdAjCj7KlEXzNJKoJJNyzceAfl2IQ9z2C5mbSVrU9lz4AU6zVfz8?=
 =?us-ascii?Q?N2Na3YAu1o1Fz3tNKScSFl7W4y527kso4K/J7wkv9hM84UPJTdGarQHCCqy4?=
 =?us-ascii?Q?YI5/CNj0fctK+ZGxyDBaLmB6VMiXCx4ODMJ60vbMGfJf3dRnyDG4qWQdNDyV?=
 =?us-ascii?Q?mQ9fOjAvDbKWbjT0M5OGYnkrpFi4BanMH3I58RdOyzDZ4d5kMliovE/m9hYC?=
 =?us-ascii?Q?HmlpTaqxQszHelUAQvbP6h131kCosaha1YDmQoXYbOlM3VD/pMICFGjQQcBo?=
 =?us-ascii?Q?LaFA/7Kbz6X9BasFotjMiqAPrgboknKh3hMRdTVjyvJpqR2O3wNTVpSQHSg8?=
 =?us-ascii?Q?6ZzRRp1B6tjQZtxoeDWr6WdqmsaQsQLkRqRW+bgDad1zM6U/yRb/Wt+67IQW?=
 =?us-ascii?Q?SLQVfn106UYBcfqKKc7qlzY5RchMkJcSmme6VB6yDJOog7GmnTphnQzB9DtW?=
 =?us-ascii?Q?EgcwMS+GecYHYPzqQ11WKdUUn43ua96RVDCIS6vq56wkn1DMMkmI5n6mo6ri?=
 =?us-ascii?Q?CQcendzX07WCp8qa2hNJHDHGW+0b0q3MEXy5c6fBhBpLMJoNW4jXkrGwYSAH?=
 =?us-ascii?Q?bcY6Z8mK6nwjiXXQ+9aP3Gy5bcchjIrg+mGKQ6Wum60vNAQwjXZuNvpoWPnz?=
 =?us-ascii?Q?bQPY4XeysXHxDHVSMEQYeCuFof0MsCohVy02ffCicbyGmYQmz2GJ4uKDn0Gs?=
 =?us-ascii?Q?BWnaJdf3XxuUWX+PGpYGjx0rk7IBDF6EFPMjE5hw1jDz7uzmWl4qLemlYF0b?=
 =?us-ascii?Q?IBAXrVedoFnWILHv0mCAXpybyoZIYk1R1u71H9+imvXwQ9ppqL47ON4HeGaH?=
 =?us-ascii?Q?/qeLW7XJYxs9PmeBBeGxC2ESVXdCbdFMALN9viMWmVWZX/vlfE7uiuTUFVNc?=
 =?us-ascii?Q?HUGbwA8gFMXvwPCVobcmwQtQrkacOaD4WtutSZbkdkDYeHEDvoudJ4EDghuI?=
 =?us-ascii?Q?2dJgHHdGbU9KoNCh1vYc0dPI5uMTaXuVk3B9OMkth0SigKARA97XZG5tzTtK?=
 =?us-ascii?Q?jZrJKKfK6qwXuJNjEp6k7gdSu2xKfC3+Q7/2ue5C8RE4De3jcL4s/4kcjGuW?=
 =?us-ascii?Q?9YDOVAGIPxQCizL9ORrQ/h1ZuJxfWW0UgorxiDV7g9CEGTzJFCBdRAcoV+Ut?=
 =?us-ascii?Q?zZHUrxJpxQQ3YgnV8UkzcOOiaLGbe9UEnkPGR2rkWFcA1JE47hCxwJnt5weh?=
 =?us-ascii?Q?h8L1NU1FTf1aztN54yGvTo3iPjWOgT/K5YoI/E51foLkonRCdzJ1j3/aX0eu?=
 =?us-ascii?Q?Fe5eW05Vvmgkn8PyF6xF/z51PzihDnC8dmUjtnvC6USiKtDHVNg2SUNZlpLK?=
 =?us-ascii?Q?cgBBzKZX11bkt7BT3pmoFhWh5sv2bsQjQFwLNc8cnh45eeDwmjEr6KaWGpwm?=
 =?us-ascii?Q?CBFFmtWjThxKZpBMsg5/Bi292/PWJ/0CAfBhSA+cOgTZEN0XW3NGrx2LQgPj?=
 =?us-ascii?Q?zg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c8f4383-be7a-402c-4f89-08dcb757d605
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2024 03:11:46.1241 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m6jCqeYrcmLAIC/gF22qU7ioeFaXYDWsQSnZp8z4Rzbe4+C4Rca8Qz5T7cEcpbij2IUHWi5VoPAeMAhnGBZiTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8171
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

On Wed, Aug 07, 2024 at 06:23:33PM +0200, Francois Dugast wrote:
> This is a required feature for dma fence jobs to preempt faulting long
> running jobs in order to ensure mutual exclusion on a given hw engine
> group.
> 
> v2: Pipeline calls to suspend(q) and suspend_wait(q) to improve
>     efficiency, switch to lockdep_assert_held_write (Matt Brost)
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_hw_engine_group.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.c b/drivers/gpu/drm/xe/xe_hw_engine_group.c
> index 52e1dc78518e..3f74ff577a4c 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_group.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_group.c
> @@ -155,3 +155,28 @@ void xe_hw_engine_group_del_exec_queue(struct xe_hw_engine_group *group, struct
>  
>  	up_write(&group->mode_sem);
>  }
> +
> +/**
> + * xe_hw_engine_group_suspend_faulting_lr_jobs() - Suspend the faulting LR jobs of this group
> + * @group: The hw engine group
> + */
> +static void xe_hw_engine_group_suspend_faulting_lr_jobs(struct xe_hw_engine_group *group)
> +{
> +	struct xe_exec_queue *q;
> +
> +	lockdep_assert_held_write(&group->mode_sem);
> +
> +	list_for_each_entry(q, &group->exec_queue_list, hw_engine_group_link) {
> +		if (!xe_vm_in_fault_mode(q->vm))
> +			continue;
> +
> +		q->ops->suspend(q);
> +	}
> +
> +	list_for_each_entry(q, &group->exec_queue_list, hw_engine_group_link) {
> +		if (!xe_vm_in_fault_mode(q->vm))
> +			continue;
> +
> +		q->ops->suspend_wait(q);

This can fail now via being interrupted (e.g. user presses ctrl-c), so
this failure needs to be propagated all the way up the call stack to
exec IOCTL and returned to the user. With that, upon retry
'q->ops->suspend' can be called multiple times too. Ensure that function
can safely be called multiple times too.

Matt 

> +	}
> +}
> -- 
> 2.43.0
> 
