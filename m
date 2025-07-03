Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA489C77B7C
	for <intel-xe@archiver.kernel.org>; Thu,  3 Jul 2025 06:56:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A77F910E7CB;
	Thu,  3 Jul 2025 06:56:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OBUJ7wA6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCD3A10E7CB
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Jul 2025 06:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751525805; x=1783061805;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Aczoi+NuGPyEhvF+A4pcpSwUA44CQbYgGzrVKy4SbO0=;
 b=OBUJ7wA6ZIzpCVddKKSGFAThfDjnf5h+BEnhNcInJvNyk/VVPcxdzcvT
 2BVComv3EyWD0rdFd2yuw2DTo/MAaPoEkpwFBBWiizBHWTDc11qyWazmk
 qtG2czDG6dQKz1LIq+7akjiEjo0L/YRUXJb0iiJxwm0OwUdt28dRoU45A
 /VZXOy/6Yci2GnAYoZ8D0sxTrkXI/VAlKTxavjFZ2yWB+co7FOmanoRAt
 ONZn8qVkA49T0yQiDyURFtF2rSNDs+GqPbs9x5iZdcSUQL/QUZ94AEI9T
 O7W8hOAnXzCZcuvq/2I9F75aFiiLQBveVJM12mN6zwuOA0NtBNbxoIzrT g==;
X-CSE-ConnectionGUID: JovOkdMASaSQapzItiyNxw==
X-CSE-MsgGUID: tlEhdCXLTSC9VfT8MphTOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="52957915"
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; d="scan'208";a="52957915"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 23:56:45 -0700
X-CSE-ConnectionGUID: VsEgXhOQTQaIIgPucLTsxw==
X-CSE-MsgGUID: PhHW7S2gRNWTLBXybI7eEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; d="scan'208";a="158564365"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 23:56:45 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 23:56:44 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 2 Jul 2025 23:56:44 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.57)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 23:56:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k/lTwh1VoGShwZ546156fSCQ/T2Vw1igBmsAgE1/TIz540cHN0MSvjw0TLbkeC+dAeziBjR3Ana8XsLjdTIWAi/I0+y/bgcFnekTe4Fr24FWoHNySgXwtzCl8IYYSGu8a8xjST5UyPtW3o2TYG0uv49/m2ix/JqEdomuhgD+le4BuskSV4J/wp7EsaayQo3iwOqXiKoCcFQijJyuD7k4IxQHkm64qn75o5TXdYHLdURtomDNGHYw7TDXGyYh5MTsr7vYnuCSM5sGYSnWWr/NERDi3TFHLkxreJP32W4I6zmEek+ikqzRa8glFXtQb4fCYrhOXg0ZKV+kwDfRcfjF0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QEqWJhueKj0HQPkNr7/3L2QN/J6z5gLKhXj15Xjirj8=;
 b=WcMIWQpOzddCbf7m3UTNekARfqaUPGY5Uu2eFGXdKDGnkxGFFdUOVFVhfVfLKnreiQYBKgTIRLhKeUAt/od8eP6n2NLKNy1QWfZECG0QGnRVsXSufSwG5vlXAX/KDfa/Ao1Apth9IdFijD8di1p8AscE80nXAEBsOw6om/z1gV/183m1M+NFNnvAN3Ey6cDShX2Tb0flW3cT6wOUbgKXvMkbYIrjef6+Li2zP2gTKp4L0dTeAB2eX2fxl975fntqhF53kFJ/4w5fPO5NPPFiRcLbdUxOmE/9nzE9HZTyZw2P6xUGL6s4uFJk/M8V2FJu/h/bDG7ycZ7QzaIrmJVEkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ5PPF3A51834D3.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::821) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Thu, 3 Jul
 2025 06:56:12 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8901.018; Thu, 3 Jul 2025
 06:56:12 +0000
Date: Wed, 2 Jul 2025 23:57:54 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Shuicheng Lin <shuicheng.lin@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/xe: Release runtime pm for error path of
 xe_devcoredump_read()
Message-ID: <aGYp8kPgCyfKFsm9@lstrano-desk.jf.intel.com>
References: <20250703062024.3441918-4-shuicheng.lin@intel.com>
 <20250703062024.3441918-6-shuicheng.lin@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250703062024.3441918-6-shuicheng.lin@intel.com>
X-ClientProxiedBy: MW4P223CA0004.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::9) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ5PPF3A51834D3:EE_
X-MS-Office365-Filtering-Correlation-Id: 336221f0-fc09-4851-989f-08ddb9feb27b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+JNMTNBF3+O4hORsa7p877eYa5xMbmm9wHrpjJSZVo9V7glGAaDM543vJUgP?=
 =?us-ascii?Q?BJ2qTkedrTNGF2Z0wftQIw5h447qXlaDD0FGYGctoAIG+ltJ1WjvuY+adC2d?=
 =?us-ascii?Q?cqGNXHI4uS9BP/I2BbltbS9jUXC3tkG/pwJfxh2oaaDev0d3nda/Zu96MQXN?=
 =?us-ascii?Q?f+wE0O5XP31s+wZcON99m1mZMcErr8Pfchnxw1U9PLRPHFlgyC6lpLlFWzt9?=
 =?us-ascii?Q?OpAt+1tQW0BPQ8onvTruSgAkvcidUr78bkjZsOY6VIEgpmxazKd3WG7+Hx3k?=
 =?us-ascii?Q?9raB+XsUvTCm/qGl2Mrfu8+2PCFMbOuB4dtzHxYmP7rQhv4pDyu2VrpjkUwM?=
 =?us-ascii?Q?E/A2CmLYoGQKPzyE+MaiWMqmK3gd4YpkbSMog9dj93G3OIHePjXFWdnG+CUE?=
 =?us-ascii?Q?w7IwSfs8/NokZPvnkbqEaAtxKPq/BXxUtXubeWjk0b8k/CmQJYQZFSU+Wm75?=
 =?us-ascii?Q?XO4zw2lt3S7ubaXHAHetH7s7aZZBZVsjKqrCC9iCqGXxNwgY3HJjlOf+Xoh0?=
 =?us-ascii?Q?0NXpUWWEJJ3lHoVDzJRRXkhZQ5a8qYhUn4/bXMGXYuR8q19l6+HagqrN5avu?=
 =?us-ascii?Q?zM6dPrMQ+F36RWjXiY3UbZh1edTpfq9afNLq9OFINi9tAyt5i7n1SsABduWI?=
 =?us-ascii?Q?uf9ZG5ITeSC0aB1VYi6d3PTdWPQahPoiM5J2bo5q7JOtDKRIw84+MJKVYc4b?=
 =?us-ascii?Q?2KDa83IGx2NIPPRW3nhcizwu8PFNqo8GSuOxxIq21CpoDvEU2GsN16cvBiaG?=
 =?us-ascii?Q?qhLFZWEIke8oVH0Si7Ud5XMXXCE7B3mNvGmQD4WuHTo0YBQc3D1qvH6slErE?=
 =?us-ascii?Q?2Hyu0QR0/zVAGbNlIpMoOe5+ik3hZy+WfmbqBfaFJXhnqQHNUtF9FDfZkpgV?=
 =?us-ascii?Q?+B05XJRhpesD7SvO3l/T4Mbz+kU4/G+xu2mOP1Dfep24C4uDvY2s/naqnC4H?=
 =?us-ascii?Q?bBocoPaGmliDhbD6s3N+VuxnNxmaz8wWF6Qd1YSroUuq9ch4ldsrvhyZAJPg?=
 =?us-ascii?Q?UOa/FB8ZRUZ2JgZu4d0bdF0+IzHy+848MoTceRASWmxqOu6rfyWmN6dLdN9N?=
 =?us-ascii?Q?/W0vGV3zeZA8jlXYnH5aJdBqE6aprh5Ae6QObsBFg31VsPCjZfjFQkNdD/XL?=
 =?us-ascii?Q?UkSkLfrDIqWt0s3HZO6fasRA1eWodkz5OLse7kfxtbg8YooBGYQEHV8svEiy?=
 =?us-ascii?Q?RMpMQa5XpxpW8OaZqjb/hkWTF+nv50Z62JVLNLx5K9UwnfFk5v4eikPu2CKD?=
 =?us-ascii?Q?hmygCZgdR1Rj12yUPkgkBWruaWy0E/7IVkaRTRh7gg/j+qe/SPyHPWvPqUtn?=
 =?us-ascii?Q?oH10iZ9qfUQGoHIwI2jhkoTRjSOqtQqs8ehZbFTnOZPDPYqCTPHbN2Kcyqwd?=
 =?us-ascii?Q?+DPBb5XEgXDkM3SDIENkEjteZ4pRj7JvScs8pwNyOtVx2WyoGndmsMxgfHw3?=
 =?us-ascii?Q?fUnvOWCDWzk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0YVTU1PT/3rnDd7T3jNgB7reF2fwVO+l5Feyg1lpj+LAJzo9DRuoRhtRsnLY?=
 =?us-ascii?Q?FNdKdky2Rfo+9jayHxGuSSB1UhAsDJEpNecBm6tt8vXAE7ZrgcRxUpwnMWhU?=
 =?us-ascii?Q?NzYswnxV0T1+04ev2khVB/WJ2oLoAH4GHG+AuWWFK9rkMbuFY9KYfNeFAitO?=
 =?us-ascii?Q?BAs1prtALXFW39N2OC7FkiIA4G40XJQQ1RbKrzRqJXZkkKUzK7xb4v2L+dYI?=
 =?us-ascii?Q?bMFMnebSnRh2w3boxGR4u6+NqiG7SRqGVjxv+dFNamFma9wfsK8ZUbV6Dlmn?=
 =?us-ascii?Q?yx9/nq0wFzBqt8pa2+LCIj5zamNS/2B6bFguWbk4FuhDOYoT1dU2pA/NGKZY?=
 =?us-ascii?Q?ezuMOTS4ePftfl3Ydd5UMT5NswS4tY3BIlMPgFVVLFcEEX3j1nkz/n0vkplT?=
 =?us-ascii?Q?7Cbd4bYueyTGwwDJMMM4N5klNTitDZQtrfPYUO7rF3k13zYd27pVCJle+lsT?=
 =?us-ascii?Q?WoHOjJFlpW4S9Gd9xcQyuyLd166x6/+Jie+vdRAmZT4LB3VQSd6V7Y3uvriD?=
 =?us-ascii?Q?PoSeXoZgS7MfNHWgJhLjez92aJP6BlzALQ36kiITZHttMDmci7IxIGP3sYQv?=
 =?us-ascii?Q?YpxWAvcIx84T1bPRCjfW20R0c+4IoDNWa9Fpp8jnPb0xqiyn1f2/PsPHJZAb?=
 =?us-ascii?Q?oKhKvAMUDhkxI9ib8gqjdszfRLNptk4vNLbYtgC6qiwkFFpZVo6h1PprykHG?=
 =?us-ascii?Q?p1/u9PcjG8bOaeY5Qm4TqkWPUe8U5ex3dxblmdLnQKgA6Nt7QOEaTHP8inWj?=
 =?us-ascii?Q?KdOmOCEhrqnRAw4nc2UTHYV2eDSQvvwhDpe0BkXis0JR5v+fKdXLah9MQtRU?=
 =?us-ascii?Q?ECq3mKi7OHJAK53kE94WQpra1kvUOhua1OVnMVnVOi4LAdYsqzfcQKfBqAhE?=
 =?us-ascii?Q?iKgePJ2ETyqAzyhwXEt5GrSan2ovVl8UE9hbDW9I9XTyxZVH462oF+RCNgOu?=
 =?us-ascii?Q?8dvuiXty316Yew9P0DyqQKmIJDJf5WSUG/3VXSWiqVzi9DsU9T6TRGaGjeJS?=
 =?us-ascii?Q?YHzlZZ8x40RMMLyGC0Dp7i3BfIOh9OV0VX55Kxx4HjvqAfkP2YjmpLudr2xf?=
 =?us-ascii?Q?87hZtzpGI0ybuDU50DerV5sk7PyN00qOJw6FDGcjP3p8FKd11TG80fJgsqUf?=
 =?us-ascii?Q?QZK02SYLLQapNP/sQBQMlEsao4oBlrROKnjQBNS+0uwVnt939PfXsh4MN5Cv?=
 =?us-ascii?Q?4S1xreCfPXcULSf8kPRtt468FW6Yn0zQQJAIMmgT6mgR/pj8Gejm0xP503E9?=
 =?us-ascii?Q?ipZmGj0Q+wV0hUq2f8bchBGr08/efwZ7Vc3Wf67FsvfgFDjbnbdFICqyVMxb?=
 =?us-ascii?Q?H6jsXMEa7zPLBX1eEa3aIwG/UbsL2nIt9g+4l47bR5sD5p4hyejcoxRoU7kO?=
 =?us-ascii?Q?Ckaw6VJkvkWCNXnze7KN7Ff7wREUH/JVDi+UW03O8TTDlVIxHgqoTk6pCy+b?=
 =?us-ascii?Q?jGNOjJtTwvLgz19XLP5jwLhRjI0fqZQe2JwTbLMpMK7el3I9Wfr6Fys4DoSr?=
 =?us-ascii?Q?9eWr5sY1jmX0dmz2YIwlrWddl9y3EEr4x8AgJttjvKlfRL/ILJxgoXVavZni?=
 =?us-ascii?Q?ufHaNH27QFebCnHDe8UEOaSrM9qM2cUlWWT99gJ+t5MgxsDmAItIdwDvWNp3?=
 =?us-ascii?Q?zA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 336221f0-fc09-4851-989f-08ddb9feb27b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 06:56:12.5312 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rrBdeA2VDhs1NxRLovvyFccuEo/YG1zTCWiJvEMk4TatsRvTPwvhgqhanOCvT4KD5u1O82e8doeQx9HGyp1Mlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF3A51834D3
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

On Thu, Jul 03, 2025 at 06:20:27AM +0000, Shuicheng Lin wrote:
> xe_pm_runtime_put() is missed to be called for the error path in
> xe_devcoredump_read().
> Add function description comments for xe_devcoredump_read() to help
> understand it.
> 
> Fixes: c4a2e5f865b7 ("drm/xe: Add devcoredump chunking")
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_devcoredump.c | 32 +++++++++++++++++++++++------
>  1 file changed, 26 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
> index 94625010abc4..701ffe6c8264 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> @@ -171,14 +171,29 @@ static void xe_devcoredump_snapshot_free(struct xe_devcoredump_snapshot *ss)
>  
>  #define XE_DEVCOREDUMP_CHUNK_MAX	(SZ_512M + SZ_1G)
>  
> +/**
> + * xe_devcoredump_read - Read data from the Xe device coredump snapshot

The preferred style is:

s/xe_devcoredump_read/xe_devcoredump_read()


> + * @buffer: Destination buffer to copy the coredump data into
> + * @offset: Offset in the coredump data to start reading from
> + * @count: Number of bytes to read
> + * @data: Pointer to the xe_devcoredump structure
> + * @datalen: Length of the data (unused)
> + *
> + * Reads a chunk of the coredump snapshot data into the provided buffer,
> + * handling chunked reads for large coredumps and ensuring proper locking.

A little a more descriptive, would be:

Reads a chunk of the coredump snapshot data into the provided buffer. If the
devcoredump is smaller than 1.5 GB, it is read directly from a pre-written
buffer. For larger devcoredumps, the pre-written buffer must be periodically
repopulated from the snapshot state due to kmalloc size limitations.

> + *
> + * Return: Number of bytes copied on success, or a negative error code on failure.
> + */
>  static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
>  				   size_t count, void *data, size_t datalen)
>  {
>  	struct xe_devcoredump *coredump = data;
>  	struct xe_devcoredump_snapshot *ss;
> -	ssize_t byte_copied;
> +	ssize_t byte_copied = 0;
>  	u32 chunk_offset;
>  	ssize_t new_chunk_position;
> +	bool pm_acquired = false;
> +	int ret = 0;
>  
>  	if (!coredump)
>  		return -ENODEV;
> @@ -188,19 +203,23 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
>  	/* Ensure delayed work is captured before continuing */
>  	flush_work(&ss->work);
>  
> -	if (ss->read.size > XE_DEVCOREDUMP_CHUNK_MAX)
> +	if (ss->read.size > XE_DEVCOREDUMP_CHUNK_MAX) {
>  		xe_pm_runtime_get(gt_to_xe(ss->gt));
> +		pm_acquired = true;
> +	}

I'd write this like:

pm_acquired = ss->read.size > XE_DEVCOREDUMP_CHUNK_MAX;
if (pm_acquired)
	xe_pm_runtime_get(gt_to_xe(ss->gt));

>  
>  	mutex_lock(&coredump->lock);
>  
>  	if (!ss->read.buffer) {
>  		mutex_unlock(&coredump->lock);
> -		return -ENODEV;
> +		ret = -ENODEV;
> +		goto pm_put;
>  	}
>  
>  	if (offset >= ss->read.size) {
>  		mutex_unlock(&coredump->lock);
> -		return 0;
> +		ret = 0;

You don't need to set ret = 0 here as it is initialized to zero above.

Nits aside, patch functionally looks correct.

Matt

> +		goto pm_put;
>  	}
>  
>  	new_chunk_position = div_u64_rem(offset,
> @@ -223,10 +242,11 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
>  
>  	mutex_unlock(&coredump->lock);
>  
> -	if (ss->read.size > XE_DEVCOREDUMP_CHUNK_MAX)
> +pm_put:
> +	if (pm_acquired)
>  		xe_pm_runtime_put(gt_to_xe(ss->gt));
>  
> -	return byte_copied;
> +	return byte_copied ? byte_copied : ret;
>  }
>  
>  static void xe_devcoredump_free(void *data)
> -- 
> 2.49.0
> 
