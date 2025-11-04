Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E3BACCF9E3
	for <intel-xe@archiver.kernel.org>; Tue,  4 Nov 2025 17:30:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3406310E29A;
	Tue,  4 Nov 2025 17:30:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NK9dikvL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DF8510E297
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Nov 2025 17:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762277408; x=1793813408;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6WzoSRYUjGtGsUM1T9diUSl6ie8WZtCmyzUoYfrB4p8=;
 b=NK9dikvLzzFQpoZ7ifjAR5Vg8Nlo7pSP677D3mKIrxpb9vxPEWPIe33j
 KCbYTqoiFTSnE6JKYUZWulGtHS0OIHjfoFC+AELG2UKcGu7DmgUS8n+co
 joUTtN8xtiNjeyeHt8KGSmyr+chmAnV6mcp1lGVaKNYMx1IDIUNCGT4Hh
 itPDvQFzVDnAF3k9DKP7fr9c8rM+MxqJNXfhZ3kwymW1jfGC8vJ1+zxds
 Q9TsWE9FY4NGS5kQMLYkJpkBzYFGZxrnOAIJxFmyqqrOGcl7zXJS8L9Yd
 26jB5G0Tt8qh8qnvpj7lUAU/428g1rw0LA34T0b7nIPOnjCCQMmdzBpzy A==;
X-CSE-ConnectionGUID: ozBtwpOGRHShjgYThgM8DQ==
X-CSE-MsgGUID: Ei7JIiYLQ3673u+XXQvIlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="87009228"
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="87009228"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 09:30:07 -0800
X-CSE-ConnectionGUID: fLgv6wT5Rle2ciVscYKRwA==
X-CSE-MsgGUID: nW9CLf3hS0+1dnV6cS8jVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="191310388"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 09:30:07 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 4 Nov 2025 09:30:06 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 4 Nov 2025 09:30:06 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.10) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 4 Nov 2025 09:30:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VRidjAX8TX3vOCgZAPjQ7UEc2xtr2+hYUDfZhtqhbI1gGoBh+aRtR+XXrH9afkNSSr9j201P2OtS09mNzuMfcl+ZN5Eu/wLAss96MyTJ5kc5NaY1d//W3afSd+SaB0+MajQ1rW1tto0WRbmICPuci1nFovSWB4Xq3JNEJ1M1wHWhKROEFRHZkoGUC2C5k/Jez7GaKBkAsNFXz5MuXhHkynK5rkqtZllneHwoVgdv361SQXPZxlZQ4lir2ljyin1pTcmk0TKT89v69WMO/UlH9tJEg97RIFS2o9Ilr4RzZ0+QMBwzBnSsrSLMsTjk8/0bIM96vKHD33SIBUD5rVHAxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ohS6WN8UDwQ6hd1mz52GqC2hm5Czm4res34yOG322Cw=;
 b=bxzUp+LWs3FXMV5zFYZ0sMZf62npQGAm8UXyYJ+Wlwe3yTLa2e8jcSzgEtn1ICzEEpGZB9fxk2Fuo19gFxm79X/27uSQOjcn9u6tordKDGCXfYQYH+WlMjMT1lVWA/pY4NL0fEVQRmRN3K7bq3QswvulzIxdVIh0zowQVZIU7aWQ0LabBoWguDySjLvl7yHglqKqk+wK+4W4A0EBXW68x+7keAAc8IRiY0qI8vQryBQ2uou36JNsHH0VtpGgcW/DQA1SJHq4Hv29ZKUQ6yUWLldji/kbRyO00HXixr9vR1SvZ1gtwb1OJAMwp9lH1di0fgRlgAJ32Z2LITOBLJUtDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by SA3PR11MB8117.namprd11.prod.outlook.com (2603:10b6:806:2f0::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Tue, 4 Nov
 2025 17:30:04 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%3]) with mapi id 15.20.9275.015; Tue, 4 Nov 2025
 17:30:04 +0000
Date: Tue, 4 Nov 2025 09:30:00 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 13/16] drm/xe/multi_queue: Support active group after
 primary is destroyed
Message-ID: <aQo4GNR5_CjefJKo@nvishwa1-desk>
References: <20251031182936.1882062-1-niranjana.vishwanathapura@intel.com>
 <20251031182936.1882062-14-niranjana.vishwanathapura@intel.com>
 <aQknQYvam2TBQIpf@lstrano-desk.jf.intel.com>
 <aQo2v7Kiphmc7ibF@nvishwa1-desk>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <aQo2v7Kiphmc7ibF@nvishwa1-desk>
X-ClientProxiedBy: BYAPR05CA0025.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::38) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|SA3PR11MB8117:EE_
X-MS-Office365-Filtering-Correlation-Id: 63b86f17-ec31-4b96-d0eb-08de1bc7c9db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?j7dBGjH8srlm2gqjGaQwVSCuMm4YysTOmM/QhrojJ0ko3xAylG1+n105/e6w?=
 =?us-ascii?Q?Wts1YHFSgaovzq1vWmXtyHlRACZYhbQMpEV3/HZM/FvfpF/sNx1SxidHFcsU?=
 =?us-ascii?Q?Eu+taS4qwr1ZkjiFgYT4FwGfhkw1KyFi2zXxpPkNQWneAFRMLfnFGEAGi2OF?=
 =?us-ascii?Q?b4vFptegY6K0NJ+EYOieMe3WyqyTi1wF80MrB4Nfbvv5kGtbMKis44N84qLJ?=
 =?us-ascii?Q?aY82IyFxucdY+RuHGTk9a7UZU56M/TY7axmfookIUGvE7EPr4zxaV6CpiJEq?=
 =?us-ascii?Q?/NyHRvAfWbYpxJg7RyIlijrxmTsQhioD9nEdMx6ecnV3NnTSXvcEZDXJKnL2?=
 =?us-ascii?Q?OCVf+oLLtxgDmNIEMqwPD6LN+6iF3Y6Miy+kmt/AVe9M0gsKyxZh9QGJs1xK?=
 =?us-ascii?Q?lB4f1D/10B1zgOBhYbJbKkUEV2B8Nd/iU7DfQzBADphfYhu24yI7d7acmmdO?=
 =?us-ascii?Q?GLfm4jMAsZQt4725TGjbotQTileqdSBXp7JzloR8oW8rCNMgw2bhPIfpLrkY?=
 =?us-ascii?Q?6Z5EPjGg5vWQsl69n54sQGcCpgAcRf3ZJLlYfWva+8yfjfwYPdgFXnNhofnE?=
 =?us-ascii?Q?pRCz54x/JneIoUhaacwpBAC69Gg3jNqlV44AO+Y/ITtdzWBIbCGJh4O38Ygk?=
 =?us-ascii?Q?E12npDaaspZHECP3JbT65no1afEzPBSu4SHPkuSuIhNKOgVNcV7Kccf3w6qG?=
 =?us-ascii?Q?GKNZWOwtL/CvZ3t8rh+kZwcDbxe52uWI+CIUhx2U+lblFpyfJ3JoFYYAbUZ1?=
 =?us-ascii?Q?yqo+JRBtXrYrMsVzKavwjMtFaVM/UWcmv/2eXTzupJhAGmepPk8y7ukEVBx5?=
 =?us-ascii?Q?qzV36mUPjaeh/C3Ffciu9kxJKp4kLi+ghOPqwa62sC9ERwNhuChrqCttHvMj?=
 =?us-ascii?Q?TDm7ml15L7+T8pJt4XGOaaF/pF4Mw7x3AY3u04BAaa/BDraFSTWFdicfhJRD?=
 =?us-ascii?Q?Rl3TRxuyGG7C8q05o1R0EVVRA4tyeZATKfOjS6+7U/+XXflkTj+KaR60epkW?=
 =?us-ascii?Q?gDKzOtsXCgPUldRfgXbimFhJdgjuPWHw4LaWxrVQYMbYQZXnbCwN5ls9KSOO?=
 =?us-ascii?Q?rCD27xhp80YBKJaHTvhPuG3XnQzkMjXaPXn3Jmw7FiaCAX8AZuzkVRkYnvKX?=
 =?us-ascii?Q?7D1veLol9UKcel0/NGPmzkOF0mU8V4X+4I6IP68IDKXcb8006mAGCyC3eP6P?=
 =?us-ascii?Q?X5ztJQ0QlwJgnzGBylSqVzakovF9RmLTmporREymc2WvJmBZDGr5cLtm0MRV?=
 =?us-ascii?Q?8fRmneLWr1XZiZf1c6EU1OWzsyiI77yrWl+pqH8Q1aNlYzK0LYyxKgW/cGao?=
 =?us-ascii?Q?UjpL+Jp4mnzznFyUv0btlFo8DurPeun03GVhDtmP7pD0SXN9sz+nJ32zmIg7?=
 =?us-ascii?Q?ysofdynY9K0MRTEIXu4GzY9YDIwIyR0DsM6WhGeNqknGuKn5YQPkQGPtIQ/U?=
 =?us-ascii?Q?PGyIOicGS9WRVpVrsElPu+XSXl9VGMtM?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Q0E8/zaHvEwsG/1GrbS8O1QZuIJPG8VBgBpZ9AB5bzxQSjvctR/Z9KNNOmmG?=
 =?us-ascii?Q?zJ9TaB5F3AKU60Tosi3v0ZqoZEUCt6v86SEHwdwdJNoKgrr2V8pdBj1EhSfi?=
 =?us-ascii?Q?yxVAtvYgp4vRmvm+C5B0kNnvcBwjD5wokTdSnnrXI3+Kp/dz79HWq6S1YsXv?=
 =?us-ascii?Q?icx/VVsLNYm2lYkcMWa6+CdhqoWN2c5h41dwbNezF94tgEu20+LmjIKqNbyl?=
 =?us-ascii?Q?7j0M3gW7cn1+E8rwKl5RyFOqtCTJUFgk6i0PgcYg0SkggpoVZU2HqXDxKPc8?=
 =?us-ascii?Q?EmVuwFcD/RGUE9YsMUD/x83xJ2iLxLcY68ksN3CpStlby7V6rgoQSi7TqlqM?=
 =?us-ascii?Q?1rj+BSIffcjZxR2q8gW8hQoa0A151Jpd+kKIWPH/2Svld8W53HQZSq6fynDm?=
 =?us-ascii?Q?YAXhYJna085GUMCUHe79w9fmvGfwjr4ft5whlEDeIAXHKxqyI+qXWLfUkxNB?=
 =?us-ascii?Q?a29Pxt9W5LexarNyUAXOu9HZ0yOCMZzYJZvqno6CuVNZFgVRyes4fcwCuh1u?=
 =?us-ascii?Q?zu7f6TlhS3ko4jNYqN8IBkVK3ideV9tTcXeUE2vNLTi1is+rMIgRr3HzdJoK?=
 =?us-ascii?Q?kqr680ySaA13gSuc1w/2XnC7EPLaU/dhbkpWuRFbdWxuA9sEcpgxwBauc8Pj?=
 =?us-ascii?Q?/Ja6cOq5Q6g8F62PkyUWElzGsskZqBg+VxVqdd8/qUMAWbjhMHONtOrZfQlX?=
 =?us-ascii?Q?a9SjB5XrTj7OgSL/kPTTy+x32KvKVBBizPMlx6MDACnF3xb16hgsGK6+B/FH?=
 =?us-ascii?Q?663DTZcsZAEcV3kKgiK5eyMrbmTAAaqmGg2Tf9kvt1PWAJ9WzLB7Z18QLno1?=
 =?us-ascii?Q?UfCpFFINbg2xzmnio5SYBQiLboiHC/D73b5FF/0+Iz0yXuzR7L1BiTdABeSo?=
 =?us-ascii?Q?DzOea+U2da2SHgYTS7OHHMmq+qJHLpYRu7W4NzDVL1zun6JzReiTdkW1Z0G9?=
 =?us-ascii?Q?QRYJyk5LRaLFzCrBQfHmmg37A8Xs6TnjMtm11qWHbH0NtCt3fIkaeTNKsDHP?=
 =?us-ascii?Q?F+xA8CxuMnSfmkmzT12GV9fJlarFcnTyJP+gAVJ1Z8IDFowbQ8BJI2AUgu1T?=
 =?us-ascii?Q?v8nfFqOSUY9n7LTrDoANCWOlf49wo/ietoyCaXs4sA7l78CoOs52vM6x2/W1?=
 =?us-ascii?Q?Y0c+mJzcs6U01e4lRsLgZ99C74sYJe+Glp0t0eyOpkKah0YlQcqO2VYpBi+F?=
 =?us-ascii?Q?kQ7Bd7KhCSLtRzaWiq5CRTmXl9ELHTR+v1dRkBEPHZ8KhH6ifwqay13M43ff?=
 =?us-ascii?Q?OXoy6WkAYz34bUG9guD6UGpykp0XrWGcCQFlS71Ejy9rvQLxDu+nT5MLO+Lf?=
 =?us-ascii?Q?qP4lcJcJXAY1moKgQJIzLc92mFrcw2mXw7tWrl/wVgu31uIEboIOyQ8XXvla?=
 =?us-ascii?Q?M6g8Sn+0U5L2RiXw1WfoRzm3dRFs1QTRGi5FjoID4ZU7CFO+TpaFcDsLMkEs?=
 =?us-ascii?Q?eZ51voIILZ2P4FzzmT7vtWon6q6Lpwqs6X4ZyvKuGBMoR20nekVgO0WK1q7D?=
 =?us-ascii?Q?A60XVZg5dqOAjmI+m56e4z0RPchITgP4R6pu2MTrCmiO63r1mqUmeVss2tfN?=
 =?us-ascii?Q?yLc6VAw8Bwq4CUw8adDUjWzpxFM7OG/iblA2tENSxG3P6kmFvG6Zre7X0k7Z?=
 =?us-ascii?Q?QkzQL2QCEP+hqpYRVjIrCtM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 63b86f17-ec31-4b96-d0eb-08de1bc7c9db
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 17:30:03.9869 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n/rAKm/k6dNIRp5Qk1+oqUBaWxyUGdV0boEgcGQMXzZbHO36idgv5m+EcfiVdtuPQfUbVTf/DVNojqm7nf1D/b4+vQFbLLAxUgFSGByA3T/IvIZNwyjuNlwLUMYXpDuY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8117
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

On Tue, Nov 04, 2025 at 09:24:19AM -0800, Niranjana Vishwanathapura wrote:
>On Mon, Nov 03, 2025 at 02:05:53PM -0800, Matthew Brost wrote:
>>On Fri, Oct 31, 2025 at 11:29:33AM -0700, Niranjana Vishwanathapura wrote:
>>>Add support to keep the group active after the primary queue is
>>>destroyed. Instead of killing the primary queue during exec_queue
>>>destroy ioctl, kill it when all the secondary queues of the group
>>>are killed.
>>>
>>>Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>>>---
>>> drivers/gpu/drm/xe/xe_device.c           |  7 ++-
>>> drivers/gpu/drm/xe/xe_exec_queue.c       | 55 +++++++++++++++++++++++-
>>> drivers/gpu/drm/xe/xe_exec_queue.h       |  2 +
>>> drivers/gpu/drm/xe/xe_exec_queue_types.h |  4 ++
>>> include/uapi/drm/xe_drm.h                |  5 +++
>>> 5 files changed, 70 insertions(+), 3 deletions(-)
>>>
>>>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>>>index 0b496676527a..708a17c357e6 100644
>>>--- a/drivers/gpu/drm/xe/xe_device.c
>>>+++ b/drivers/gpu/drm/xe/xe_device.c
>>>@@ -176,7 +176,12 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
>>> 	xa_for_each(&xef->exec_queue.xa, idx, q) {
>>> 		if (q->vm && q->hwe->hw_engine_group)
>>> 			xe_hw_engine_group_del_exec_queue(q->hwe->hw_engine_group, q);
>>>-		xe_exec_queue_kill(q);
>>>+
>>>+		if (xe_exec_queue_is_multi_queue_primary(q))
>>>+			xe_exec_queue_group_kill_put(q->multi_queue.group);
>>>+		else
>>>+			xe_exec_queue_kill(q);
>>>+
>>> 		xe_exec_queue_put(q);
>>> 	}
>>> 	xa_for_each(&xef->vm.xa, idx, vm)
>>>diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>>>index 3c1bb4f10fd5..d7b0173691c1 100644
>>>--- a/drivers/gpu/drm/xe/xe_exec_queue.c
>>>+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>>>@@ -405,6 +405,26 @@ struct xe_exec_queue *xe_exec_queue_create_bind(struct xe_device *xe,
>>> }
>>> ALLOW_ERROR_INJECTION(xe_exec_queue_create_bind, ERRNO);
>>>
>>>+static void xe_exec_queue_group_kill(struct kref *ref)
>>>+{
>>>+	struct xe_exec_queue_group *group = container_of(ref, struct xe_exec_queue_group,
>>>+							 kill_refcount);
>>>+	xe_exec_queue_kill(group->primary);
>>>+}
>>>+
>>>+static inline void xe_exec_queue_group_kill_get(struct xe_exec_queue_group *group)
>>>+{
>>>+	kref_get(&group->kill_refcount);
>>>+}
>>>+
>>>+void xe_exec_queue_group_kill_put(struct xe_exec_queue_group *group)
>>>+{
>>>+	if (!group)
>>>+		return;
>>>+
>>>+	kref_put(&group->kill_refcount, xe_exec_queue_group_kill);
>>>+}
>>>+
>>> void xe_exec_queue_destroy(struct kref *ref)
>>> {
>>> 	struct xe_exec_queue *q = container_of(ref, struct xe_exec_queue, refcount);
>>>@@ -607,6 +627,7 @@ static int xe_exec_queue_group_init(struct xe_device *xe, struct xe_exec_queue *
>>> 	group->primary = q;
>>> 	group->cgp_bo = bo;
>>> 	INIT_LIST_HEAD(&group->list);
>>>+	kref_init(&group->kill_refcount);
>>> 	xa_init_flags(&group->xa, XA_FLAGS_ALLOC1);
>>> 	mutex_init(&group->lock);
>>> 	mutex_init(&group->list_lock);
>>>@@ -675,6 +696,11 @@ static int xe_exec_queue_group_add(struct xe_device *xe, struct xe_exec_queue *q
>>> 	q->multi_queue.pos = pos;
>>> 	mutex_unlock(&group->lock);
>>>
>>>+	if (group->primary->multi_queue.keep_active) {
>>>+		xe_exec_queue_group_kill_get(group);
>>>+		q->multi_queue.keep_active = true;
>>>+	}
>>>+
>>> 	return 0;
>>> }
>>>
>>>@@ -691,6 +717,11 @@ static void xe_exec_queue_group_delete(struct xe_exec_queue *q)
>>> 	if (lrc)
>>> 		xe_lrc_put(lrc);
>>> 	mutex_unlock(&group->lock);
>>>+
>>>+	if (q->multi_queue.keep_active) {
>>>+		xe_exec_queue_group_kill_put(group);
>>>+		q->multi_queue.keep_active = false;
>>>+	}
>>> }
>>>
>>> static int exec_queue_set_multi_group(struct xe_device *xe, struct xe_exec_queue *q,
>>>@@ -709,12 +740,24 @@ static int exec_queue_set_multi_group(struct xe_device *xe, struct xe_exec_queue
>>> 		return -EINVAL;
>>>
>>> 	if (value & DRM_XE_MULTI_GROUP_CREATE) {
>>>-		if (XE_IOCTL_DBG(xe, value & ~DRM_XE_MULTI_GROUP_CREATE))
>>>+		if (XE_IOCTL_DBG(xe, value & ~(DRM_XE_MULTI_GROUP_CREATE |
>>>+					       DRM_XE_MULTI_GROUP_KEEP_ACTIVE)))
>>>+			return -EINVAL;
>>>+
>>>+		/*
>>>+		 * KEEP_ACTIVE is not supported in preempt fence mode as in that mode,
>>>+		 * VM_DESTROY ioctl expects all exec queues of that VM are already killed.
>>>+		 */
>>>+		if (XE_IOCTL_DBG(xe, (value & DRM_XE_MULTI_GROUP_KEEP_ACTIVE) &&
>>>+				 xe_vm_in_preempt_fence_mode(q->vm)))
>>> 			return -EINVAL;
>>>
>>> 		q->multi_queue.valid = true;
>>> 		q->multi_queue.is_primary = true;
>>> 		q->multi_queue.pos = 0;
>>>+		if (value & DRM_XE_MULTI_GROUP_KEEP_ACTIVE)
>>>+			q->multi_queue.keep_active = true;
>>>+
>>> 		return 0;
>>> 	}
>>>
>>>@@ -1254,6 +1297,11 @@ void xe_exec_queue_kill(struct xe_exec_queue *q)
>>>
>>> 	q->ops->kill(q);
>>> 	xe_vm_remove_compute_exec_queue(q->vm, q);
>>>+
>>>+	if (!xe_exec_queue_is_multi_queue_primary(q) && q->multi_queue.keep_active) {
>>>+		xe_exec_queue_group_kill_put(q->multi_queue.group);
>>>+		q->multi_queue.keep_active = false;
>>>+	}
>>
>>This looks a little odd. Either you don't need to clear
>>multi_queue.keep_active as xe_exec_queue_kill can be called at most once
>>(IIRC it can be called multiple times) or you need some locking around
>>multi_queue.keep_active or it needs to be an atomic to prevent multiple
>>threads from calling xe_exec_queue_group_kill_put twice.
>>
>
>It looks like xe_exec_queue_kill() will only get called once.
>We really don't need to reset the keep_active flag here by setting it
>to 'false'. I just added that for completeness.
>Ok, Will remove.
>

Or may be just keep it as it looks more readable to me. ie., for the
secondary queues, we set keep_active while calling group_kill_get() and
we reset it while calling group_kill_put().

Niranjana

>Niranjana
>
>>Matt
>>
>>> }
>>>
>>> int xe_exec_queue_destroy_ioctl(struct drm_device *dev, void *data,
>>>@@ -1280,7 +1328,10 @@ int xe_exec_queue_destroy_ioctl(struct drm_device *dev, void *data,
>>> 	if (q->vm && q->hwe->hw_engine_group)
>>> 		xe_hw_engine_group_del_exec_queue(q->hwe->hw_engine_group, q);
>>>
>>>-	xe_exec_queue_kill(q);
>>>+	if (xe_exec_queue_is_multi_queue_primary(q))
>>>+		xe_exec_queue_group_kill_put(q->multi_queue.group);
>>>+	else
>>>+		xe_exec_queue_kill(q);
>>>
>>> 	trace_xe_exec_queue_close(q);
>>> 	xe_exec_queue_put(q);
>>>diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
>>>index 61478b2e883b..b642341f1ede 100644
>>>--- a/drivers/gpu/drm/xe/xe_exec_queue.h
>>>+++ b/drivers/gpu/drm/xe/xe_exec_queue.h
>>>@@ -109,6 +109,8 @@ static inline struct xe_exec_queue *xe_exec_queue_multi_queue_primary(struct xe_
>>> 	return xe_exec_queue_is_multi_queue(q) ? q->multi_queue.group->primary : q;
>>> }
>>>
>>>+void xe_exec_queue_group_kill_put(struct xe_exec_queue_group *group);
>>>+
>>> bool xe_exec_queue_is_lr(struct xe_exec_queue *q);
>>>
>>> bool xe_exec_queue_is_idle(struct xe_exec_queue *q);
>>>diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>>>index e64b6588923e..cdca3afe838c 100644
>>>--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
>>>+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>>>@@ -55,6 +55,8 @@ struct xe_exec_queue_group {
>>> 	struct list_head list;
>>> 	/** @list_lock: Secondary queue list lock */
>>> 	struct mutex list_lock;
>>>+	/** @kill_refcount: ref count to kill primary queue */
>>>+	struct kref kill_refcount;
>>> 	/** @sync_pending: CGP_SYNC_DONE g2h response pending */
>>> 	bool sync_pending;
>>> };
>>>@@ -152,6 +154,8 @@ struct xe_exec_queue {
>>> 		u8 valid:1;
>>> 		/** @multi_queue.is_primary: Is primary queue (Q0) of the group */
>>> 		u8 is_primary:1;
>>>+		/** @multi_queue.keep_active: Keep the group active after primary is destroyed */
>>>+		u8 keep_active:1;
>>> 	} multi_queue;
>>>
>>> 	/** @sched_props: scheduling properties */
>>>diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>>>index d72151163e77..333fb38b3404 100644
>>>--- a/include/uapi/drm/xe_drm.h
>>>+++ b/include/uapi/drm/xe_drm.h
>>>@@ -1260,6 +1260,10 @@ struct drm_xe_vm_bind {
>>>  *    then a new multi-queue group is created with this queue as the primary queue
>>>  *    (Q0). Otherwise, the queue gets added to the multi-queue group whose primary
>>>  *    queue id is specified in the 'value' field.
>>>+ *    If the extension's 'value' field has %DRM_XE_MULTI_GROUP_KEEP_ACTIVE flag
>>>+ *    set, then the multi-queue group is kept active after the primary queue is
>>>+ *    destroyed.
>>>+ *
>>>  *  - %DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY - Set the queue
>>>  *    priority within the multi-queue group.
>>>  *
>>>@@ -1304,6 +1308,7 @@ struct drm_xe_exec_queue_create {
>>> #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE		2
>>> #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP		3
>>> #define     DRM_XE_MULTI_GROUP_CREATE				(1ull << 63)
>>>+#define     DRM_XE_MULTI_GROUP_KEEP_ACTIVE			(1ull << 62)
>>> #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY	4
>>> 	/** @extensions: Pointer to the first extension struct, if any */
>>> 	__u64 extensions;
>>>--
>>>2.43.0
>>>
