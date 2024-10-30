Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BDD7D5CCAF
	for <intel-xe@archiver.kernel.org>; Wed, 30 Oct 2024 14:03:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ECFB10E0AC;
	Wed, 30 Oct 2024 14:03:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DaDQt6+a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66AEA10E0AC
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Oct 2024 14:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730297016; x=1761833016;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=PBPTJl3WVIQUSZHc/VoTx0UGt9CErxqmg57zWafQrw4=;
 b=DaDQt6+a+ueauglfvyDDTkoAEcyFd/xtPsDurqKj/tSzxfuUE88X2Rkx
 eY4+G7lrjE1OMb8TwxxdRLv7UKSna6wnOuessCLbfA9EaLDjZVDZFzT4G
 hpTzhhaFUklmJ/6WL8b4uYf67174aJUTxOOONI4oywWCECk0bMeXaO3gr
 462ojFMAWJWJZbaW78SNm2S4lu9CSHUimwDhEqfI5BFk2Jzhjm2MM0CYN
 smDEucoaiiFYrOb6plqHM0xmCHumBdhiGhGM9PBWiXQ9EUbKzR/4R13VL
 MDTc8NmUsC8sPD8UdAIF7Rap18DzaZcEuz5pmHnaBJH2dkGeZKsbCQGdk w==;
X-CSE-ConnectionGUID: u8nmV0AqRh+xMGPircU14w==
X-CSE-MsgGUID: rtuW1ph9QcewoMoQLbiO6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30193342"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30193342"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2024 07:03:35 -0700
X-CSE-ConnectionGUID: hoYtpcpHR6qbgtyzHsItRA==
X-CSE-MsgGUID: 7SvxRlMbT7eboLlEQsaRHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,245,1725346800"; d="scan'208";a="86875446"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Oct 2024 07:01:46 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 30 Oct 2024 07:01:45 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 30 Oct 2024 07:01:45 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 30 Oct 2024 07:01:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zCFsrgtIDcaSaZKiSu9nVRAHSDczaGoJbfYRx+MS0/qrTfq3Sm1S/5zhpVmw9k+NdbOOKpBdMtGrW4vxhLS3lDdPu46ysrLJjvqtjtkL73xfC8aJF0Lnm0cW2B4u878F8PZKMx9v+38Bxiee9bIW23ra1c8pTxkoWTX7DxtmjeckHfpC5t257XaIgfhVhfh8deid6yx/HAkROd+PuIqRmQ5639TaNHcp6LfyiUMAUJhhBTJPkfFfRWIZCyh8EO2OF+TrKy+DAd8SNdCIC8AaYzn2vrU+5Kzm7aZaBY2Ri2mRLOhnWIPVv+Ieq8AQNbyYXyjg63ZR1IAzNxOcyGPq/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HyLfb2LbPZKZumJ0o0vamyGsffp+9q1TwqD1a/dMRdY=;
 b=ywg/sHbYCYFwi5IP5N/bQAlbxGxJWp/6oqBdBxRQfgB70gjwrVFYT2M7ChG2cYy4gCkiviyTfwj02KouEXyyo/LrLLyA4RtUrzNJYno9sB++Nlu1mdncMTTp3k5J9RFLGtqCm368dlJv5hDAxNp66WanmnCSb8na56sGryXxxZakBB8VteNex7xBylaNT90MRJwJRHEHvwlovgxrAMmpaRSXbiQ3yxkB4zR81Dhjmm/SLcONSvG4twprwRMyTcbgzmGmOzYFJdnltS84QB7Ml9367OiduGMwYzdo7SO7jcDTJKU6F9gHGo96HUl7EZF5R8KAJqoBJCWfx1Dv678uKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB6403.namprd11.prod.outlook.com (2603:10b6:510:1f9::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Wed, 30 Oct
 2024 14:01:39 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8093.024; Wed, 30 Oct 2024
 14:01:39 +0000
Date: Wed, 30 Oct 2024 09:01:32 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Nerlige Ramappa, Umesh" <umesh.nerlige.ramappa@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>
Subject: Re: [PATCH v2 4/4] drm/xe: Wait on killed exec queues
Message-ID: <pn26ghptsg56bzuyfgbckzy3wdkq4a6v6nda3oqyqxpmo4gx74@l6sm6h7pvd3x>
References: <20241029214351.776293-1-lucas.demarchi@intel.com>
 <20241029214351.776293-5-lucas.demarchi@intel.com>
 <CH0PR11MB5444E2830B55D38B1E1C07E4E54B2@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <CH0PR11MB5444E2830B55D38B1E1C07E4E54B2@CH0PR11MB5444.namprd11.prod.outlook.com>
X-ClientProxiedBy: MW4PR03CA0263.namprd03.prod.outlook.com
 (2603:10b6:303:b4::28) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB6403:EE_
X-MS-Office365-Filtering-Correlation-Id: d455bb3c-46e8-4478-e2c4-08dcf8eb5ffb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8YMD6XJO2K6OzxOI26vAqZ4UpcEKKjEFxgvZJLID+oqDfs0v+7A7M4JzXn3G?=
 =?us-ascii?Q?R0BUxJOsMqrwsTv2q+mAEPj986Vwr5rfqWtC/a7BMWWbLSOMInp1CAv2pNRq?=
 =?us-ascii?Q?x9o5r8lm8U2e41XO3F0tJ5gvUtjfQKdrm6THcF6oZqD6pznLtPzroGNZTO6q?=
 =?us-ascii?Q?Fo8zi/JurG+S1WFyt+C+4MYA4KkioWBj9zZKl0K/pMYsOqp+QUKp4vvEt/Ah?=
 =?us-ascii?Q?kTTG9OiVI29p9zCKjZfE+VqyPPNOghwutUwXfUrJkYb2ieKQPkejGiZ6KZtz?=
 =?us-ascii?Q?UEhv+QMP4EW+ZjVhLzFhgQnpUs3BznRoPmJ/YVF8WCNGy1E846pXGW+6a7eN?=
 =?us-ascii?Q?ZilpXZOmLxTAHukYdoNrnkyZ0fgOKB/y4hZB23UbWB0YqpJaQ7neUuciy+yn?=
 =?us-ascii?Q?piTzv+/cNC7jmRPBvQ1ezB8qN6PEaUSN6bR9rv7tlEekpORZz9e/Wp5dV2GX?=
 =?us-ascii?Q?vSLQkiOPzwqA1nVN58DfV3vC48BY6vLQGGtZmNFzF0Gz22mkiXWsdrV5v3tz?=
 =?us-ascii?Q?y/5IoG2KmoeJruH5ykZjnx+AtAdiI4r8icB1jWgzqdOEIlAA5qv2GZ8QSIne?=
 =?us-ascii?Q?vrPn2OfMG6YYC5VPdyhA2rHsYgoRHZgGKLs4/3c6/oAlmcAOb0GJAdzzWoyn?=
 =?us-ascii?Q?fFXXjaswuMrjDyJAywbhQSybIB2tbuVlWhKT0Kxlms7O+mQ9OhsqR3eN4Yjf?=
 =?us-ascii?Q?b0WXzGmxSX+gJf4XA6PVOfwWT/p87i+GINf3pMkDYfCsjpRY8g2xUBK+Gs5k?=
 =?us-ascii?Q?PXhG76KDO4ZvuwodKL8QcwAEX4/3MA3Wm0GqYEoheIjM2mf4T1Aow3IeFQjO?=
 =?us-ascii?Q?LFUmXGqWaNXyCFk7BRcRZ9CGbe5b3SoDsZKueVoxMc9pt3zs0dd5YWxQFqLe?=
 =?us-ascii?Q?JSoLJ9F1v+CQTRlXIHm/0VH3KstOs9uR4xxbXh0buNwatHoePrG7zBOvWsw1?=
 =?us-ascii?Q?mIuJBCPJkwRJkQmgEcJbQ86JrrFpxyib2Y2i3AuOD6FTz3lDb9eybKRMeQHn?=
 =?us-ascii?Q?yPxQ2L6uyQ62zy9nKcC4X+j3pWV1tL4taC/suzLPY+qyoFRGqvWoFFC1P6ua?=
 =?us-ascii?Q?U/5JcG4VRcS5eitDWJLFoD21Mn0Ad/FpZnc2WbkQJ1wNlyIs6j9CwN0Nt7rj?=
 =?us-ascii?Q?qjvQEHHaRjo10Wt56Ct1LPAhezfUo3TWaCrMyYxlzKDektmsRL1oTYW4n9T2?=
 =?us-ascii?Q?lZnw7uwiRPPlUe3AUerggAKjhuNcw2c6amvzC85AkvNJQvrjrp0CGXDGzeRI?=
 =?us-ascii?Q?NTdPK0nFGX678kre4aR1?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2Q4hE1k/rRej8eSHsO7L86ay3YqDbUMzT/pa6DDMtCKcdD8pvpMlRUm6FA8Z?=
 =?us-ascii?Q?RwXb1R3asMykElu4Xzp3IYFnBJqsZs5Pp0OIAostUg0n10gXZDvruBeGECuG?=
 =?us-ascii?Q?0TM3BxdCVhMI7ZEegGJ/8f2decU8EzBwYAuqRt5OT4a2c4kjnJVI1xUQoTs2?=
 =?us-ascii?Q?QyqZukmCwlwsZcHDV29HmuQvwDUb4XGL5dv5PbPJ6uSpL/OJIxF4kPpqkyyx?=
 =?us-ascii?Q?CiZ8IMqm30/zyXUYawUvJ9HOZsBsKk5FMIrIjp6mxjk1BVfSbNJoVULNJRDg?=
 =?us-ascii?Q?9ijRr8N2+jhypb2cATkUH/9Yv0qkPSMuGmnP+Wd6zoJkCe7uPWFIHpSMdAtm?=
 =?us-ascii?Q?kWlGDpyo9ak+bZ7TwcWYz/M9DWG8vdvQXggQhsjvwRMx/2gnK4MW7mTSVgg+?=
 =?us-ascii?Q?mXfQa8ynw9gbp7XGIAUx1ou/Cj/QXGfLGaCiVR8XvTEN3cInQSng1qX4bqon?=
 =?us-ascii?Q?zgt5qg8JM4bAv6ivK9oddO6kPET8zX+U1BCJn23hNgfoSjtmfUfGqAITKGjd?=
 =?us-ascii?Q?qvbQI6CIaGM7jHn8QU4NwNFK8tamYVy1BBpOTU82Ih0Qn2EZIn6/XCvKNK4C?=
 =?us-ascii?Q?ZJSjeRyUxnTVsWMAqjCk/qGwPjMDSsrGrmHpRvxx7jVHW7+lKKnZk7DOkvF+?=
 =?us-ascii?Q?jiiR/SL8ZWAkqQQr1Gvf+pQ6EdKW0hqGXtbAAHTwPkLLqqiQEvNeAJfpVSCk?=
 =?us-ascii?Q?EuRi/LugyTIoLe+2UI9gk7kP3urfR1t7dVyyJ/kNO09u3WKrlRG0A8CNdO5O?=
 =?us-ascii?Q?GWaoiwNfy+fy8SWOSH3am6fBmWazWJQdldVym6a0izkUYd6yoYwzLvsXfb8D?=
 =?us-ascii?Q?vOEy+ZL8YYxfnc5uU5O8E530Nem3J7I8H46kH3//aGNUEdZUxlOBTZ3Zu5Es?=
 =?us-ascii?Q?ETiZcmpBbWb1ki4/eMsxYF8lESsFQiqWvG0k5eEUBQR6lXS/FU0RurlLZh6t?=
 =?us-ascii?Q?ez0SfHnzRCO9HnBbyaNb1d6uxDaMKdpY43XwGzwMRCCGCi/wqz6nNIPFD2Zr?=
 =?us-ascii?Q?Y3xENtpGWYUxUZL7bfFSzF4kVnu60qiOLnG9aWlaOfEG27qEh68bOw/kOkC+?=
 =?us-ascii?Q?Q9ncAfxZLNZFW701ttP/5JFBS3fXxPBVmj/YlEeHZn/SWObVmUKZivuolVOb?=
 =?us-ascii?Q?aU9ul7YxpjIjDTh8Kka6y5ySqmSGj4m9fSmXBN8ej9OGsR9K5oNCv/sSmLg0?=
 =?us-ascii?Q?EgIZyPe8vL8BZJfJyHMYrKgGdSNkhA472c8BPySFgDUbBwp11bNwTtKQwOV7?=
 =?us-ascii?Q?OVkYMTER6f8iw1IpA0VF/BZ8CuQhdMLv5URH0voIf9Z3unag4rNjcbomJ8Kp?=
 =?us-ascii?Q?Iy0p0RZSpd6noEWCLMOe+LF11GxK15mzCJo0YoHe3vTf0AVtMmL9Zp2zKT1k?=
 =?us-ascii?Q?Wj+z6PZudsWBnmYYQiu9XpcBvdKeZWM+uMsW6O6EJZcZ8e7mjnrv2Q4MhLXb?=
 =?us-ascii?Q?FfvGMLCfO9wKfsacr/cxOzvooKd5/pANnILmSnf5gHdDrGpdSWoSSuXoc73c?=
 =?us-ascii?Q?Do+CFpMaFNPi44nbURr/IdCKhxbQTZ3tprsT6FWwz+M4dFS3jwHQuA3LsM02?=
 =?us-ascii?Q?K+/EObGnekucIk9iNxZQ+cQcK6x+899kUp9yOrnJ60GrIZZRaLYrN6kXnX2M?=
 =?us-ascii?Q?Zw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d455bb3c-46e8-4478-e2c4-08dcf8eb5ffb
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2024 14:01:39.4559 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /gkj5z+PVfBzXo/0VXrhg1m13pUkkB9A1BsLBSXjwBIpNDO5gJUmF3uqXxTGYpTZTNLHabLWZahvarYTs0US8IHDl71HybKkUTckLUS5nbw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6403
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

On Tue, Oct 29, 2024 at 05:05:18PM -0500, Cavitt, Jonathan wrote:
>-----Original Message-----
>From: De Marchi, Lucas <lucas.demarchi@intel.com>
>Sent: Tuesday, October 29, 2024 2:44 PM
>To: intel-xe@lists.freedesktop.org
>Cc: Cavitt, Jonathan <jonathan.cavitt@intel.com>; Nerlige Ramappa, Umesh <umesh.nerlige.ramappa@intel.com>; Brost, Matthew <matthew.brost@intel.com>; De Marchi, Lucas <lucas.demarchi@intel.com>
>Subject: [PATCH v2 4/4] drm/xe: Wait on killed exec queues
>>
>> When an exec queue is killed it triggers an async process of asking the
>> GuC to schedule the context out. The timestamp in the context image is
>> only updated when this process completes. In case a userspace process
>> kills an exec and tries to read the timestamp, it may not get an updated
>> runtime.
>>
>> Add synchronization between the process reading the fdinfo and the exec
>> queue being killed. After reading all the timestamps, wait on exec
>> queues in the process of being killed. When that wait is over,
>> xe_exec_queue_fini() was already called and updated the timestamps.
>>
>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2667
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
>Non-blocking asides below.  Otherwise:
>Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
>
>> ---
>>  drivers/gpu/drm/xe/xe_device_types.h | 5 +++++
>>  drivers/gpu/drm/xe/xe_drm_client.c   | 7 +++++++
>>  drivers/gpu/drm/xe/xe_exec_queue.c   | 4 ++++
>>  3 files changed, 16 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>> index ef7412d653d2e..b949376ca388a 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -614,6 +614,11 @@ struct xe_file {
>>  		 * which does things while being held.
>>  		 */
>>  		struct mutex lock;
>> +		/**
>> +		 * @exec_queue.pending_removal: items pending to be removed to
>> +		 * synchronize GPU state update with ongoing query.
>> +		 */
>> +		atomic_t pending_removal;
>>  	} exec_queue;
>>
>>  	/** @run_ticks: hw engine class run time in ticks for this drm client */
>> diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
>> index 22f0f1a6dfd55..24a0a7377abf2 100644
>> --- a/drivers/gpu/drm/xe/xe_drm_client.c
>> +++ b/drivers/gpu/drm/xe/xe_drm_client.c
>> @@ -317,6 +317,13 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
>>  		break;
>>  	}
>>
>> +	/*
>> +	 * Wait for any exec queue going away: their cycles will get updated on
>> +	 * context switch out, so wait for that to happen
>> +	 */
>> +	wait_var_event(&xef->exec_queue.pending_removal,
>> +		       !atomic_read(&xef->exec_queue.pending_removal));
>
>There's probably an argument to be made that this should be done before
>getting the total GPU cycles (as that's when we update the run_ticks value
>of the xef exec queues), but I'm not going to block on that.

the difference is that we don't update the run_ticks for these queues we
are waiting on... when it's killed we send the message to guc to
schedule it out (if it was running) and I think the delay is mostly on
completing that operation: the schedule out and the processing of the
message from guc to fini the queue. The timestamp saved doesn't depend
on this last part, but meanwhile the gpu_timestamp will be ticking and
could cause it to be taken later than it should.

I have some refactors on top that I didn't send (because I couldn't
still solve the issue of running the test together with
`stress --cpu $(nproc)`. I will play with the position in which the
timestamp is saved and give an update.

thanks
Lucas De Marchi

>
>> +
>>  	xe_pm_runtime_put(xe);
>>
>>  	if (unlikely(!hwe))
>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>> index fd0f3b3c9101d..58dd35beb15ad 100644
>> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
>> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>> @@ -262,8 +262,11 @@ void xe_exec_queue_fini(struct xe_exec_queue *q)
>>
>>  	/*
>>  	 * Before releasing our ref to lrc and xef, accumulate our run ticks
>> +	 * and wakeup any waiters.
>>  	 */
>>  	xe_exec_queue_update_run_ticks(q);
>> +	if (q->xef && atomic_dec_and_test(&q->xef->exec_queue.pending_removal))
>
>I was going to say that we should probably perform a wake_up_var irrespective
>of the dec_and_test result, but then I realized that there isn't much reason to
>wake up the waiter if the pending_removal value isn't zero, so I suppose that's
>a moot point.

yep, the pattern for wait_var_event() is that it should be waken up only
when the condition it's waiting on is met.

thanks
Lucas De Marchi

>
>-Jonathan Cavitt
>
>> +		wake_up_var(&q->xef->exec_queue.pending_removal);
>>
>>  	for (i = 0; i < q->width; ++i)
>>  		xe_lrc_put(q->lrc[i]);
>> @@ -824,6 +827,7 @@ int xe_exec_queue_destroy_ioctl(struct drm_device *dev, void *data,
>>  	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
>>  		return -EINVAL;
>>
>> +	atomic_inc(&xef->exec_queue.pending_removal);
>>  	mutex_lock(&xef->exec_queue.lock);
>>  	q = xa_erase(&xef->exec_queue.xa, args->exec_queue_id);
>>  	mutex_unlock(&xef->exec_queue.lock);
>> --
>> 2.47.0
>>
>>
