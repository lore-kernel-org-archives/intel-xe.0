Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 715A0EB64D7
	for <intel-xe@archiver.kernel.org>; Wed, 21 Jun 2023 03:55:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34DB510E3A9;
	Wed, 21 Jun 2023 03:55:45 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A042910E3A9
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Jun 2023 03:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687319742; x=1718855742;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=OZEhbl+3QBMAXH+R98yQSNoZ0B3rSve6UKGuGzlrUTM=;
 b=FIe7mMAcaUMdPLudBj2Ee98mXsBvz5nP3Zy+VjYVB+oY1YEt4vdgfpNF
 R5k7g3vQUFooel6tSJTM5jK2mtp2tP3dvZZ51NyNQKKCdlxdo6CQ9p7AZ
 3xoMtDoUPcY4Y24UK7mzr+Ci9mKGvvA/hZRVzzZn/7mIAXftITg6MC/or
 dsMvc4YqENmHeS+Y3WIKf4hgfOEJtiVQg8CMDA88xuiUP4CJNhbPsveeu
 gQnhvCpzG33niPnMcJ1tkNIaW2IytTbBnRhFggry2yQ3tjpKn46kpUWW0
 6pl5ZeW7QQDqcXO0X9DNgFh64XJiP7/MhxtlQ1PcgmBnfSecaFaJmfi3a w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="340398519"
X-IronPort-AV: E=Sophos;i="6.00,259,1681196400"; d="scan'208";a="340398519"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2023 20:55:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="858820550"
X-IronPort-AV: E=Sophos;i="6.00,259,1681196400"; d="scan'208";a="858820550"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga001.fm.intel.com with ESMTP; 20 Jun 2023 20:55:32 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 20 Jun 2023 20:55:32 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 20 Jun 2023 20:55:32 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 20 Jun 2023 20:55:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a0E5fvcVT2GKUHiEE1M/qKuJGy2G4RxHDfRgof7tYrEGrRFLl+4T/9jkLpzzfm53Yln2sSXnTxnqFzWrzM0FltZw1gnHiRmkPUiLnUXTlD9FCYTLPPg/uvFMhYzPByF4276280D9P5tzq6O2lh+lUocduwBw6C/hz7kHuPE2scM4Xa4CPcZnbc2xUpACj8uWzl5C5QP8cnrx8DzQyrQFMO8V3zeMLGn+NbFOgnSW4c6VSrQJpMFAo2lWbDQkkgyujnb0MclzRc/oPy1edcINoudMow4noVBYZE6JVDVVZ54H25Q4Tto+SgQVrTIsYk2wA/TnRFO2lHqEZhgWzTGY3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2sXocgYnBidlEecsNai06epBrTDFNsEG1nZ/CRpsVJY=;
 b=NoeQ++AJpInXt8o2QDvm/3iwtkdKSDj+CCVmPuiMfN5zjNLS84O5Q3NgWWP3R93m/SKkiHn1/gAOZRSfda7Usb4ceevUQpZshK/5ogsSe82/Biz7Ah1RU24Vzc5gfla17mxE00ojv4ClIYqcQ57u1UEFcLMvd+MAz+E/qqboHnnZBnD1WT2xSyOwxVsQF84o6KvACtOLYnMgEM5GA3aYlwAILpXep1OP7mHqkNPe/VeaogqVbI1Brl5v/qcllon8wpiD77IaSDLZEZJji/Ur6ZL12La8iYj9coRE1qRxkOWnvvhrxcjqtFwXCdU4fyhPrenKvMnfh0IN7McKAA+0/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by CO1PR11MB4881.namprd11.prod.outlook.com (2603:10b6:303:91::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Wed, 21 Jun
 2023 03:55:28 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::84a5:8625:a20c:4086]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::84a5:8625:a20c:4086%4]) with mapi id 15.20.6500.036; Wed, 21 Jun 2023
 03:55:28 +0000
Date: Tue, 20 Jun 2023 20:55:21 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
Message-ID: <ZJJ0qfR/5JMDA2Sk@nvishwa1-DESK>
References: <20230615141933.2865583-1-tejas.upadhyay@intel.com>
 <20230615141933.2865583-7-tejas.upadhyay@intel.com>
 <ZIzMbz7Jk0F0tpf6@nvishwa1-DESK>
 <DS7PR11MB6197189274A9EBB171F589B5815FA@DS7PR11MB6197.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <DS7PR11MB6197189274A9EBB171F589B5815FA@DS7PR11MB6197.namprd11.prod.outlook.com>
X-ClientProxiedBy: BYAPR05CA0061.namprd05.prod.outlook.com
 (2603:10b6:a03:74::38) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|CO1PR11MB4881:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cdf3888-4f72-4ebc-0191-08db720b59e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: H735lgiCer72/koj+yMW2xmsjG386akc70iN9w+igpmapXWECp6Nrl8wJWYoWxCjYubtzb/cCw+zMAI+84QZwXUox5yXhQCB2oB9yDtpa+DDoUd4qU0x/6mlRkBW7amu4xz4J4KcE6Z8soUheGA9TA8wivsWIG7BiNT3pckgkfgfHNd5Bxlc1THw3DEH/yB3cl21ulvq3k4IuIermYjdrZkwjIGTdvFMyjL/kAksbkbrEXXq4DFFMTLbh78m8o4iExZ6rqOcWiuyqq/emqk3gl7YbqWRSVy13ZUoD8kqMUwXuyLR/o7UmuVfzJiPG05tzD7/5EGCLv31ye+EnTzHIFn3fsbeUcDoVgAGa1ZOKhPnoa82oZaWrpAiiOXhNDCla9lE/TDcBWjOOh+/gYtUjpZo6i0ZMprjNWkNwB1wuLyzxvThkTWhFJGy/sKIoegwWZ9xVuay4Bj2QJc4v/3ydmNyxzIArR+n8+ZI9q3uCwtRkdfwrXkmxXJZ2qZwsHEoiH7LN384ML5WwUV+JQw/R6qcB7Aki90UE9CdzgEoqJSBIBxLcG68FMvqE+96kdH5
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(366004)(396003)(39860400002)(376002)(346002)(136003)(451199021)(54906003)(6666004)(478600001)(66556008)(66946007)(66476007)(9686003)(26005)(186003)(6512007)(107886003)(6506007)(53546011)(6486002)(4326008)(5660300002)(6862004)(41300700001)(6636002)(316002)(8936002)(8676002)(33716001)(44832011)(2906002)(38100700002)(82960400001)(86362001)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TsMyqpA6SD9MwFnePyZRyVYt0DjKsrO9xcoB8qYMGzPh7nIw3sWzmPOh5Xb8?=
 =?us-ascii?Q?9UHnRH0+g2Wx+V/9CXDwII6e0UscwiqGL+vV/Q+bkz/SGjSbfl+nEURgIOWq?=
 =?us-ascii?Q?j5SlulMot4eUtFI8/SYoYCV2h1skIgX4bjGr52xEXdciwU83nSrh9xDDj9aQ?=
 =?us-ascii?Q?OLj3wacIPbErxOXLWDrP1sQalXLMtvUg+15VPa5Nz+b0vZnrGNiwpoZvcSP6?=
 =?us-ascii?Q?jeZkwiqH7QSMDT1GxR10df/Rvv3FunGRQM2aRQJBx2/fJEPtjCi2yveGaAzu?=
 =?us-ascii?Q?cmK4ggTEzmdJ/+b2mg9uTv6lKSm7jMCnJrln3GQx1k6IkSj4yaf7LBf+5C9O?=
 =?us-ascii?Q?WBFIPp2dVhuK/2pYzOWITj3v9qTFwPDoQmBjVrKVPZkjXC18WnPkmpZBCXsf?=
 =?us-ascii?Q?d7A1gHUysNwj0KmOT//vutCFQ18XPr6agQmAfHXU4n3r5VT1PzSLgtgdi4qM?=
 =?us-ascii?Q?teg/6IVRcqmpVkN6sy9c5sZM5RqPu/JUVuDzSCImvGpGS0aUa77IbV4BPxc9?=
 =?us-ascii?Q?5uRyX562C9OAyJtIU3GDRoJc3mCFa2FQWckiBziWIwGdEnko+XN31MVKudu4?=
 =?us-ascii?Q?Q+a0Z8kiHu4Nr0MFOijLk+mJCDp9iEGkI79xGwCydHGBF9kKGlGB95IUZJTM?=
 =?us-ascii?Q?64BtpxgEgI4zr+Vs8h2icaMT+xigNZxEv322MLLkqKGPQ3V9FWE1744dgPH3?=
 =?us-ascii?Q?627vFmoJMtVtgzjKozwmNYvrmo32uBd6b2QxmmKglchRDLWG6lsnwTDTcJZT?=
 =?us-ascii?Q?gIWX/UUYJ8BLyRJywsEY+1vuYkcz4ugYV3tlj1eHJ+0+faDWrLYjt0pW9/Qe?=
 =?us-ascii?Q?LYyvNQgAciBoF1rWgpxSZnIRflBw7hQs0TCOPJQD20RjOGp/j7iOWE2aR9TG?=
 =?us-ascii?Q?+Vmb0I0QyKtNwlrKgUwCOfIitx2aaWoirJFr3a9TfwdPXz4S1QGvZeC04pfm?=
 =?us-ascii?Q?j+NGI1cEzmEXBKm3UnaGqkMwSUC7DqWREuUh+Vr4uK6CvLMHrAOyFPgtwCrX?=
 =?us-ascii?Q?HmTcwajPKHNXRNK5jXbmorgRgJN8OOEBxOkesiQkHJqvkfk1ztHnSft9swhC?=
 =?us-ascii?Q?C88u+snO0XtUeg7SPIbfto6S7eqvq+n1t6SdsYMwzgyE9gV2uXuAMlpCvMfI?=
 =?us-ascii?Q?AokDWKiAUcu+h75+M3d9BzLu0Z5xfjt71GFTVyYgGumsP69jrBjwdkBmF4S9?=
 =?us-ascii?Q?Enzxo7P00JgYtu0GsdoQQLt06bhlJfc/QdfLIR1dOr5tI/62CDXYQnThTw7y?=
 =?us-ascii?Q?32x7v1klr6ln5W2EwG6LSLDT1uhEy9rAsSu/UeHcc29Ix2xM2C8MM0FMlWRQ?=
 =?us-ascii?Q?CZxk3R1htt7LCBk0oucsnukYeazCwQGDE+tOQRmUd2oyh7y4elIj+mCbNzEG?=
 =?us-ascii?Q?oeu50wJhIk/NGhzpXBZ3Po5aYrKJhDd4fzLHdr4yS3xYeGE9n0XH72bUc5ta?=
 =?us-ascii?Q?wR8EBhM+k2M4Zqf9AC967OA8Vu/390FUD7Z/fSsN+u7sqzPYFOx0OATtXjMc?=
 =?us-ascii?Q?jLfBy4QlNyxZJIHTCOUvDPETm1S8GKab13uYepuJuDlObzteNu48KXsGE2La?=
 =?us-ascii?Q?eUGr7VDGsXihT133ik7YeGKwx6OzOQ9W0LJ4OgmYjzrvyXHUaYi7B7P1ngMS?=
 =?us-ascii?Q?O+gP/L7A0B18nouLhngxja0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cdf3888-4f72-4ebc-0191-08db720b59e1
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2023 03:55:28.4124 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i8DmEGqQfOEL9kWW8wFwVywagCNjnNPdpcGZN3sCRjUvTTEcKE2fUgwgnuUyvHnIn8/K/p1n2awBruBBewEmG9w4XAXG04kAhDkj16mY0MmIRuYK1tZ8UMuJy01QFsPw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4881
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 6/6] drm/xe: Add min/max cap for engine
 scheduler properties
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Sun, Jun 18, 2023 at 09:43:51PM -0700, Upadhyay, Tejas wrote:
>
>
>> -----Original Message-----
>> From: Vishwanathapura, Niranjana <niranjana.vishwanathapura@intel.com>
>> Sent: Saturday, June 17, 2023 2:26 AM
>> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
>> Cc: intel-xe@lists.freedesktop.org; Iddamsetty, Aravind
>> <aravind.iddamsetty@intel.com>; Ghimiray, Himal Prasad
>> <himal.prasad.ghimiray@intel.com>; Brost, Matthew
>> <matthew.brost@intel.com>
>> Subject: Re: [PATCH 6/6] drm/xe: Add min/max cap for engine scheduler
>> properties
>>
>> On Thu, Jun 15, 2023 at 07:49:33PM +0530, Tejas Upadhyay wrote:
>> >Add sysfs entries for the min, max, and defaults for each of engine
>> >scheduler controls for every hardware engine class.
>> >
>> >Non-elevated user IOCTLs to set these controls must be within the
>> >min-max ranges of the sysfs entries, elevated user can set these
>> >controls to any value.
>> >
>> >Introducing compile time CONFIG min-max values which restricts elevated
>> >user to be in compile time min-max range if at all sysfs min/max are
>> >violated.
>> >
>> >Sysfs entries examples are,
>> >DUT# cat /sys/class/drm/cardX/device/gtN/engines/ccs/.defaults/
>> >job_timeout_max         job_timeout_ms          preempt_timeout_min
>> timeslice_duration_max  timeslice_duration_us
>> >job_timeout_min         preempt_timeout_max     preempt_timeout_us
>> timeslice_duration_min
>> >
>> >DUT# cat /sys/class/drm/card1/device/gt1/engines/ccs/
>> >.defaults/              job_timeout_min         preempt_timeout_max
>> preempt_timeout_us      timeslice_duration_min
>> >job_timeout_max         job_timeout_ms          preempt_timeout_min
>> timeslice_duration_max  timeslice_duration_us
>> >
>> >Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

<snip>

>> >diff --git a/drivers/gpu/drm/xe/xe_engine.c
>> >b/drivers/gpu/drm/xe/xe_engine.c index e72423bc398a..c368ffd5e461
>> >100644
>> >--- a/drivers/gpu/drm/xe/xe_engine.c
>> >+++ b/drivers/gpu/drm/xe/xe_engine.c
>> >@@ -13,6 +13,7 @@
>> >
>> > #include "xe_device.h"
>> > #include "xe_gt.h"
>> >+#include "xe_gt_sysfs.h"
>> > #include "xe_hw_fence.h"
>> > #include "xe_lrc.h"
>> > #include "xe_macros.h"
>> >@@ -191,9 +192,20 @@ static int engine_set_priority(struct xe_device
>> >*xe, struct xe_engine *e,  static int engine_set_timeslice(struct xe_device
>> *xe, struct xe_engine *e,
>> > 				u64 value, bool create)
>> > {
>> >-	if (!capable(CAP_SYS_NICE))
>> >+	if (!capable(CAP_SYS_NICE) &&
>> >+	    !engine_timeout_in_range(value,
>> >+				     e->hwe->sched_props.timeslice_min,
>> >+				     e->hwe->sched_props.timeslice_max))
>> > 		return -EPERM;
>> >
>> >+#if defined(CONFIG_DRM_XE_TIMESLICE_MIN) &&
>> defined(CONFIG_DRM_XE_TIMESLICE_MAX)
>> >+	if (capable(CAP_SYS_NICE) &&
>> >+	    !engine_timeout_in_range(value,
>> >+				     CONFIG_DRM_XE_TIMESLICE_MIN,
>> >+				     CONFIG_DRM_XE_TIMESLICE_MAX))
>> >+		return -EPERM;
>> >+#endif
>>
>> Do we really need this second boundary check given the in the first check
>> above, the e->hwe->sched_props.timeslice_min/max values are already
>> subjected to these boundaries?
>> Applies for other below parameters also.
>
>Yes we need because,
>If elevated user exceeds configured sysfs min/max (he is allowed to do so), which number could be below or above compile config min max.
>As user can try any value through IOCTL/sysfs being elevated user, we need to check with second check.
>

I thought CONFIG_DRM_XE_TIMESLICE_MIN/MAX are the default values of hwe->sched_props.timeslice_min/max
which user can override. But looking at timeslice_duration_min/max_store(), looks like these configs
are not default min/max values but a boundary for min/max values. I am confused.

Niranjana

>>
>> >+
>> > 	return e->ops->set_timeslice(e, value); }
>> >
