Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32922CD98F2
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jun 2026 22:19:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5B6010E8B3;
	Mon, 22 Jun 2026 22:19:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JzSODcNi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DA7810E8B3
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Jun 2026 22:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782166793; x=1813702793;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=wwt39rO/6aX8ZxJJn/0my+GkC/BXlHJiXCUQpw9W36E=;
 b=JzSODcNi4pENdkcWJwtpdzU5sEcSgEWX6i4Z8z4Z4JiSv5cmYhZXMdgH
 wlxRDL6thrl0Q5q//w6HzbC3wkZCVce5X0ddgPlp/pK/jwcoCpt1mD+pL
 2oWbS6UWEugyznpEqolLFxsmh/utFtR7QGBBuhAtKXgNEmnruInzAueC+
 vDt1KUvrASDhG1a0x4qruIvfSaFCpN3asy9FRQDuP+UVMH2a8yLXPC+xY
 roi1dA5PK0p0w+OMNe9dww8e6KzRRIXLMG9TEViTm7k+KbB1jwp5x10NW
 XDZcHQa1qEVGvZ86SiLiN2AdE7fYeaontUAe1oII57bEw424jh6oaAcK2 w==;
X-CSE-ConnectionGUID: i0X7oUhJReO9rs7eKXHJfg==
X-CSE-MsgGUID: 3wbLIOEFR2eaz0MmXmcB1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="70422320"
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; d="scan'208";a="70422320"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2026 15:19:53 -0700
X-CSE-ConnectionGUID: gz1Mds8RTmKO+DgGsxh/TQ==
X-CSE-MsgGUID: xb/PySnsRg+UW6Ii9c04zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; d="scan'208";a="249205600"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2026 15:19:53 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 22 Jun 2026 15:19:52 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 22 Jun 2026 15:19:52 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.42) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 22 Jun 2026 15:19:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VTNBPX9qKtFFZlI9ZjeLC8y+CRGDJUiF2OmrnTf7+yhrP+zB7e0qpo0uP7Kjhf1Zjn3K2rdm6AOVZT5nijbK89fHRdiqe4U/oY/n4utpD5WyqCEFYsJB5bBw2e+Cu7nKW1B9IUjeDuPCJ24PC1D0ykTjimSo3t10aUQ7EwMFpywWtcb/YdQ2ySer14iLw0XAWGei1maS09n7C5K3aDxuFnWwfdGbF5Dyr2zhB11bx916nAKE8nRlH2wmxAm4BTSjK2OzkQz4WjJxYSNsXFxx8YOIPujxhPXcCEHcPCg8H7c/dlV7HdRxxMTZ94suyrU1T2ef1RuieAuW4QaHX2vl2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n1X/eN6GP0xl8x5ht88kcfmo2ObLeGQEV9Q1xYlfU6Q=;
 b=m6NAXS7jaVhviKdetica/d6qkdGLhMboO3AJTs96Oc7XNASW7S2BN+nuZUW+AZVqYs+4Xc12iZA1xBR0eYiE6hQ+vjWBx+jGVsLPijhHMS9V0RCmJddTFmGUvlcsWUDqKmG7px4/GiMheIfOh9WDgQfh+6S9E3giXL9Vh2VNOREPAo0OzwOHMGWWcUx7LkKsfnG59SohpMD8CutgKM3+5S5z/H/KHNNlqcFS0q24O8rmWoIJHQIUHFVEI0PJ3XN7l/zbtG/qs+g4G2aNVd2jHtdOXvp0CbinbHgu3terDo3SqpEDAadqQm2SfAPIBA1vRMcECh+gw7NDr41vttCvbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB7558.namprd11.prod.outlook.com (2603:10b6:8:148::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.18; Mon, 22 Jun
 2026 22:19:49 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0139.018; Mon, 22 Jun 2026
 22:19:49 +0000
Date: Mon, 22 Jun 2026 15:19:47 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Arvind Yadav <arvind.yadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <rodrigo.vivi@intel.com>,
 <tejas.upadhyay@intel.com>
Subject: Re: [PATCH v6] drm/xe/guc: Hold device ref until queue teardown
 completes
Message-ID: <ajm1A1+b6UWuzlGK@gsse-cloud1.jf.intel.com>
References: <20260622091335.2222655-1-arvind.yadav@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260622091335.2222655-1-arvind.yadav@intel.com>
X-ClientProxiedBy: BYAPR21CA0023.namprd21.prod.outlook.com
 (2603:10b6:a03:114::33) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB7558:EE_
X-MS-Office365-Filtering-Correlation-Id: 13dc1bc8-a451-47ad-762d-08ded0ac5fd2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: /Ob0M08dhFhpsowStuWDuls2XWzPmB9s+dk2cKM2kyWkXSPZD2mSleie4Tk1sCt6o0MM1WfAvnXZ4VRKSB9W/Z3iygLc85DOjSjb4ak1TgQ6b7Z0Eb+VIqtG41x+qXX8KlJedsIMjyoXdf6zZl9K9RcXFiUTz34iiwNfXYBZWFd+iJLkGKJ51fEiLrTquzB6n54HRhi4Jb1H3WpQHGWgtTy6Wh60PWRHnR9Peq/uymctfJXxe3z/RDbEX51swNoTG6kgTdwmNiwJjqOGSX8edqduxndR8B2hPVERTeK1aGGZkqSJMMLDk6toET4toLka1pe+rJnvWQ+5Ow0W2vMPmMPnVdpQIaU3X5mwKsVWB417mUJEcCe8pi8eWXd3+Nh+QoFABuv6uJXM556+7VM6STNRV4TkrDp0DTusjW6poqnd2LphoevY6kmYdZdJ+f41YUEFqaBgdIqNSn/CqKYXmOyBSIEhkuLwpRWK8vNHT2gq+wz52mj8NnPtssVrJov/2E3TfzKeKcb7+f0vdoa5/1Ab9LMGPsdDq+I1/jJjZ8tJB4ETLnAdrxYRZ7WI5oEmyUPde8Me45XcROCwflCNGLuLsvs2e25XYmo62eKhMRzNZA5mZl4C9tW4iUPmSZZn/3BFeFR6Hvuq3S1Ag2WVpuhn8lddxx0+VDPRdAxtdB4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(11063799006)(56012099006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?B12mkq4zPTIVIUNwMy/tPaWykeMQfnSw0oI6E7oxtUaSVnKicqhAc0rxH3?=
 =?iso-8859-1?Q?RrBeZ+r+li+cioilx0huQOs0nsz0k2Kieupv9LY3y4Kn6SsT1LOIF9+B+2?=
 =?iso-8859-1?Q?faAgs7mcUkWzT8R8PkQqqJcsFJ9K80UF3DQa9tcmxx7AeBVLIVsuOZhQVu?=
 =?iso-8859-1?Q?rfFoxAXT8QZUyftQrcJWOew0v+GrGLaar5oJwtAtHw2kkqNzHtpdDNSvQZ?=
 =?iso-8859-1?Q?2XLA7fphJXPvyV6BmH/10/+VoWHiAiPFpWKrgs58HB3qD2YmHQvogt0f78?=
 =?iso-8859-1?Q?kNh4PTJ/jeaf945wGQco0EFxy7ZvjZ6QR4ZmHnFK5cWe7wuze0SnV0Zlgw?=
 =?iso-8859-1?Q?YNiTEevAlco8izVhdG6k+QMlnmVx0kB33vRklrGtRWS7GMyiDAZQ8KCg1/?=
 =?iso-8859-1?Q?iBeOjgWTMFFcCq9iFes/yIBbF/msOcFlOAs1Raytnu1Z/qMBD+7TX+Yet3?=
 =?iso-8859-1?Q?P3SNVdmd0UFsm0KbKB1rljundj/c2u3ErQWIvyZmcO2Lj8ruwUpjB3Pqdy?=
 =?iso-8859-1?Q?32IFLlZ4AvYo1vhz86iYM943YUpVuQ1wzsqyare1dLZIuZ6KTwqXRxP91/?=
 =?iso-8859-1?Q?lr6oGw7Ape5AtdTsEYqEpeb7E8nG0sQ9/eo2VgFZIcyNEyMM9qkZTcT9qp?=
 =?iso-8859-1?Q?eq+kH/eiHO45eLqXYFdSCpM04C1KPFAprcfaiPuCdqgnhMrNsIiAw4rnK/?=
 =?iso-8859-1?Q?x500Y+I4tiwL+gKMlzVjqvooYnMe7VKja7zkX9t25Hk3IyY0VVYPzP/vK9?=
 =?iso-8859-1?Q?oFRIXJAA4666O61/7896/pQkYpVjwJFj5joCrcNQNfkn/KcYP32L50J98S?=
 =?iso-8859-1?Q?QLdt5QyNk1LSTMDk8cguZj5YdpD1DgZL2VIAobpVxSZ374LGjBu0pdJBA/?=
 =?iso-8859-1?Q?AHKSWHRLDIKx/sh1Lgu4ixUw9aYP8XPtAbNwnmBDXOok3ATBnOguKAzrDj?=
 =?iso-8859-1?Q?IgIg7d8tN6PKKgP5rx3PLrpBhXXTuOzipiscUtkchLWy1G91l2FR/8IWRU?=
 =?iso-8859-1?Q?M5/mePchHaE7Q7ApnafNmnrHmJDSZrTdazHNX7PiWu5TXhZL3R2o7iDYF6?=
 =?iso-8859-1?Q?e/3pl6u+vhXv0AX+5YkXUVKSRTk5rdsXySNUb8iWC/cNQ7+Lc4vcxXHyi9?=
 =?iso-8859-1?Q?0Ls77km55xtrkoHdoHifH5OiVgEF5OAWDiHboDNJhUAFPZLf7FCQe/uGOh?=
 =?iso-8859-1?Q?gDBkplH3/mZtWsmAb0nmCWInTUrzeOL2mPmsV6ijPVjgwt72cjx0WeeQzy?=
 =?iso-8859-1?Q?qvdnzwxQcBIUmxQo/5LT2f18U3cAChFUCWoG6FtVpNGTrwYatc7aKGmpgs?=
 =?iso-8859-1?Q?+QHvP0et63EeNKDwOlbPJ2Kv8RhOrkKe01Y/7IZPiC2SRjMyJXhYB4Jinw?=
 =?iso-8859-1?Q?1GePvSX1r+FcyRFancpEpmsa1ueIDERa5JDmbRgniMUEwbPoMpcRuZFE/w?=
 =?iso-8859-1?Q?ztq82jkg+Lcz54U+ZYtAOz6YHxV/vk4asNhlO04dJbtPNRJ884mT5AQir3?=
 =?iso-8859-1?Q?r2aEHydMLjP9DGp2J3z+bh65Hk01AiNCLC8c/QCcUlLpYrMH4gJ0sXpr1I?=
 =?iso-8859-1?Q?cBHzH6FZicMWvGjw2H0MrC8+ef3Lz40iQeBFqQAaN9mrmQ4Bx24rs2f5vJ?=
 =?iso-8859-1?Q?X1G5FQKoOAo7lbpWuKsY1vHQQ2jJhj2yxtyn+D9cr7RMiboUKeCcL3afwL?=
 =?iso-8859-1?Q?2VBUdVBZ7MgWtbg1DEUS4lPAk9Aqxmq7b6HhEQgI1qFnDTdP0JiPPshaSG?=
 =?iso-8859-1?Q?+NOsIlkU/Y1Cw8R6MkDSTCr0cWKjW75HpIeMFDS2rn1T+UBZJXE/A12BLF?=
 =?iso-8859-1?Q?r9VGrwvQIg=3D=3D?=
X-Exchange-RoutingPolicyChecked: R5JMO5b6xJOP1aL1jGq5TnSBE+jq3iz97qJ5ZQql/bjOCWI2TlNfUrlzqoVQTWKaILcs/3SjGCWrzrePsFEAURA5lHFaTv9NiUjCcmc8x9CTMiMA03YILqRePF9Y8/rCeoM6JUz1gCvn0BRa3WMSWNxokxu6X0rgqUyqSWyryU937NENmxSZM4+aaM4GdPnZx9OQH6qZhNmKNRXl6v033rbHK0oVsahY7xznNaVeh7hh74HVtVdozmSx/5WDwap47RAwB1x2+XQCddf9wRfW7xZWlClogqYMPTVy7OHvgtgYAcipNYlJFYGrUY4MmfF46NFEiIMiCEUaubo01O2FJQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 13dc1bc8-a451-47ad-762d-08ded0ac5fd2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 22:19:49.6345 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SE/Fb/hu5wONKW0Aof9O49RctauFX9WsgYteBxGOa3oy/KWvBSi2Q/A3V4LYte8cd+pDFdxq9KmLg7x+7zmMSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7558
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

On Mon, Jun 22, 2026 at 02:43:35PM +0530, Arvind Yadav wrote:
> GuC exec queue destruction can run asynchronously. If the final device
> put happens from a destroy worker, drmm cleanup can end up draining
> the same workqueue and deadlock.
> 
> Hold a drm_device reference for the queue lifetime and drop it after
> queue teardown completes. This keeps drmm cleanup from running while
> async destroy work is still pending.
> 
> Move destroy work to a module-lifetime Xe workqueue and flush it on
> PCI remove so hot-unbind/rebind still waits for pending destroy work.
> 
> With queue-held device refs, guc_submit_sw_fini() cannot run with live
> GuC IDs. Replace the fini wait with an assertion and remove the unused
> fini_wq.
> 
> v2:
>   - Rebase
> 
> v3:
>   - Switch to queue-lifetime drm_dev_get()/drm_dev_put() model. (Matt)
>   - Queue async teardown on system_dfl_wq instead of xe->destroy_wq. (Matt)
>   - Drop separate deferred drm_dev_put worker.
>   - Remove stale drain_workqueue(xe->destroy_wq) from guc_submit_sw_fini().
> 
> v4:
>   - Replace the guc_submit_sw_fini() wait with an assertion and remove
>     the now-unused fini_wq. (sashiko)
> 
> v5:
>   - Move destroy work to a module-lifetime Xe workqueue instead of
>     system_dfl_wq. (Matt)
>   - Flush the module-lifetime destroy workqueue during PCI remove to
>     preserve the old device-remove wait semantics.
> 
> v6:
>   - Keep SVM pagemap destroy work on the per-device destroy_wq to avoid
>     letting it outlive the xe_device/drm_device. (Sashiko)
>   - Use WQ_MEM_RECLAIM for xe->destroy_wq because SVM pagemap destroy work
>     can be queued from the reclaim path.
> 
> Fixes: 2d2be279f1ca ("drm/xe: fix UAF around queue destruction")
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c       |  2 +-
>  drivers/gpu/drm/xe/xe_device_types.h |  2 +-
>  drivers/gpu/drm/xe/xe_exec_queue.c   | 30 +++++++++++++
>  drivers/gpu/drm/xe/xe_exec_queue.h   |  7 +++
>  drivers/gpu/drm/xe/xe_guc_submit.c   | 65 ++++++++++++++++------------
>  drivers/gpu/drm/xe/xe_guc_types.h    |  2 -
>  drivers/gpu/drm/xe/xe_module.c       |  5 +++
>  drivers/gpu/drm/xe/xe_pci.c          |  7 +++
>  8 files changed, 88 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 089872507bdd..a81345811a8d 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -580,7 +580,7 @@ int xe_device_init_early(struct xe_device *xe)
>  						       WQ_MEM_RECLAIM);
>  	xe->ordered_wq = alloc_ordered_workqueue("xe-ordered-wq", 0);
>  	xe->unordered_wq = alloc_workqueue("xe-unordered-wq", WQ_PERCPU, 0);
> -	xe->destroy_wq = alloc_workqueue("xe-destroy-wq", WQ_PERCPU, 0);
> +	xe->destroy_wq = alloc_workqueue("xe-destroy-wq", WQ_MEM_RECLAIM, 0);

Can't we just drop this? xe->destroy_wq is used in xe_svm.c but that can
use the module level one.

>  	if (!xe->ordered_wq || !xe->unordered_wq ||
>  	    !xe->preempt_fence_wq || !xe->destroy_wq) {
>  		/*
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 32dd2ffbc796..0e6065d62e37 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -355,7 +355,7 @@ struct xe_device {
>  	/** @unordered_wq: used to serialize unordered work */
>  	struct workqueue_struct *unordered_wq;
>  
> -	/** @destroy_wq: used to serialize user destroy work, like queue */
> +	/** @destroy_wq: used for device-lifetime async destroy work */
>  	struct workqueue_struct *destroy_wq;
>  
>  	/** @tiles: device tiles */
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 1b5ca3ce578a..43990d19ec63 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -6,6 +6,7 @@
>  #include "xe_exec_queue.h"
>  
>  #include <linux/nospec.h>
> +#include <linux/workqueue.h>
>  
>  #include <drm/drm_device.h>
>  #include <drm/drm_drv.h>
> @@ -30,6 +31,35 @@
>  #include "xe_vm.h"
>  #include "xe_pxp.h"
>  
> +static struct workqueue_struct *xe_destroy_wq;
> +
> +int __init xe_exec_queue_module_init(void)
> +{
> +	xe_destroy_wq = alloc_workqueue("xe-exec-queue-destroy-wq",
> +					WQ_UNBOUND | WQ_MEM_RECLAIM, 0);
> +	if (!xe_destroy_wq)
> +		return -ENOMEM;
> +	return 0;
> +}
> +
> +void xe_exec_queue_module_exit(void)
> +{
> +	if (xe_destroy_wq)
> +		destroy_workqueue(xe_destroy_wq);
> +	xe_destroy_wq = NULL;
> +}
> +
> +bool xe_exec_queue_destroy_wq_queue(struct work_struct *work)
> +{
> +	return queue_work(xe_destroy_wq, work);
> +}
> +
> +void xe_exec_queue_destroy_wq_flush(void)
> +{
> +	if (xe_destroy_wq)
> +		flush_workqueue(xe_destroy_wq);
> +}

Then here s/xe_exec_queue_destroy_wq*/xe_destroy_wq*

and make this module generic?

Matt

> +
>  /**
>   * DOC: Execution Queue
>   *
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
> index 0225426c57b0..a269bb0f77c7 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.h
> @@ -31,6 +31,13 @@ struct xe_exec_queue *xe_exec_queue_create_bind(struct xe_device *xe,
>  						struct xe_vm *user_vm,
>  						u32 flags, u64 extensions);
>  
> +struct work_struct;
> +
> +int xe_exec_queue_module_init(void);
> +void xe_exec_queue_module_exit(void);
> +bool xe_exec_queue_destroy_wq_queue(struct work_struct *work);
> +void xe_exec_queue_destroy_wq_flush(void);
> +
>  void xe_exec_queue_fini(struct xe_exec_queue *q);
>  void xe_exec_queue_destroy(struct kref *ref);
>  void xe_exec_queue_assign_name(struct xe_exec_queue *q, u32 instance);
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index afe5d99cdd8b..64d3029fa6ac 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -10,6 +10,7 @@
>  #include <linux/circ_buf.h>
>  #include <linux/dma-fence-array.h>
>  
> +#include <drm/drm_drv.h>
>  #include <drm/drm_managed.h>
>  
>  #include "abi/guc_actions_abi.h"
> @@ -232,17 +233,9 @@ static bool exec_queue_killed_or_banned_or_wedged(struct xe_exec_queue *q)
>  static void guc_submit_sw_fini(struct drm_device *drm, void *arg)
>  {
>  	struct xe_guc *guc = arg;
> -	struct xe_device *xe = guc_to_xe(guc);
>  	struct xe_gt *gt = guc_to_gt(guc);
> -	int ret;
> -
> -	ret = wait_event_timeout(guc->submission_state.fini_wq,
> -				 xa_empty(&guc->submission_state.exec_queue_lookup),
> -				 HZ * 5);
>  
> -	drain_workqueue(xe->destroy_wq);
> -
> -	xe_gt_assert(gt, ret);
> +	xe_gt_assert(gt, xa_empty(&guc->submission_state.exec_queue_lookup));
>  
>  	xa_destroy(&guc->submission_state.exec_queue_lookup);
>  }
> @@ -319,8 +312,6 @@ int xe_guc_submit_init(struct xe_guc *guc, unsigned int num_ids)
>  
>  	xa_init(&guc->submission_state.exec_queue_lookup);
>  
> -	init_waitqueue_head(&guc->submission_state.fini_wq);
> -
>  	primelockdep(guc);
>  
>  	guc->submission_state.initialized = true;
> @@ -411,9 +402,6 @@ static void __release_guc_id(struct xe_guc *guc, struct xe_exec_queue *q,
>  	xe_guc_id_mgr_release_locked(&guc->submission_state.idm,
>  				     q->guc->id, q->width);
>  
> -	if (xa_empty(&guc->submission_state.exec_queue_lookup))
> -		wake_up(&guc->submission_state.fini_wq);
> -
>  	mutex_unlock(&guc->submission_state.lock);
>  }
>  
> @@ -1685,6 +1673,7 @@ static void guc_exec_queue_fini(struct xe_exec_queue *q)
>  {
>  	struct xe_guc_exec_queue *ge = q->guc;
>  	struct xe_guc *guc = exec_queue_to_guc(q);
> +	struct drm_device *drm = &guc_to_xe(guc)->drm;
>  
>  	if (xe_exec_queue_is_multi_queue_secondary(q)) {
>  		struct xe_exec_queue_group *group = q->multi_queue.group;
> @@ -1703,36 +1692,52 @@ static void guc_exec_queue_fini(struct xe_exec_queue *q)
>  	 * (timeline name).
>  	 */
>  	kfree_rcu(ge, rcu);
> +
> +	drm_dev_put(drm);
>  }
>  
> -static void __guc_exec_queue_destroy_async(struct work_struct *w)
> +static void guc_exec_queue_do_destroy(struct xe_exec_queue *q)
>  {
> -	struct xe_guc_exec_queue *ge =
> -		container_of(w, struct xe_guc_exec_queue, destroy_async);
> -	struct xe_exec_queue *q = ge->q;
> +	struct xe_guc_exec_queue *ge = q->guc;
>  	struct xe_guc *guc = exec_queue_to_guc(q);
> +	struct xe_device *xe = guc_to_xe(guc);
> +	struct drm_device *drm = &xe->drm;
>  
> -	guard(xe_pm_runtime)(guc_to_xe(guc));
> -	trace_xe_exec_queue_destroy(q);
> +	/*
> +	 * guc_exec_queue_fini() drops the queue's drm_device ref.
> +	 * Keep the device alive until the PM-runtime guard unwinds.
> +	 */
> +	drm_dev_get(drm);
>  
> -	/* Confirm no work left behind accessing device structures */
> -	cancel_delayed_work_sync(&ge->sched.base.work_tdr);
> +	scoped_guard(xe_pm_runtime, xe) {
> +		trace_xe_exec_queue_destroy(q);
>  
> -	xe_exec_queue_fini(q);
> +		/* Confirm no work left behind accessing device structures */
> +		cancel_delayed_work_sync(&ge->sched.base.work_tdr);
> +
> +		xe_exec_queue_fini(q);
> +	}
> +
> +	drm_dev_put(drm);
>  }
>  
> -static void guc_exec_queue_destroy_async(struct xe_exec_queue *q)
> +static void __guc_exec_queue_destroy_async(struct work_struct *w)
>  {
> -	struct xe_guc *guc = exec_queue_to_guc(q);
> -	struct xe_device *xe = guc_to_xe(guc);
> +	struct xe_guc_exec_queue *ge =
> +		container_of(w, struct xe_guc_exec_queue, destroy_async);
> +
> +	guc_exec_queue_do_destroy(ge->q);
> +}
>  
> +static void guc_exec_queue_destroy_async(struct xe_exec_queue *q)
> +{
>  	INIT_WORK(&q->guc->destroy_async, __guc_exec_queue_destroy_async);
>  
>  	/* We must block on kernel engines so slabs are empty on driver unload */
>  	if (q->flags & EXEC_QUEUE_FLAG_PERMANENT || exec_queue_wedged(q))
> -		__guc_exec_queue_destroy_async(&q->guc->destroy_async);
> +		guc_exec_queue_do_destroy(q);
>  	else
> -		queue_work(xe->destroy_wq, &q->guc->destroy_async);
> +		xe_exec_queue_destroy_wq_queue(&q->guc->destroy_async);
>  }
>  
>  static void __guc_exec_queue_destroy(struct xe_guc *guc, struct xe_exec_queue *q)
> @@ -1927,6 +1932,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
>  {
>  	struct xe_gpu_scheduler *sched;
>  	struct xe_guc *guc = exec_queue_to_guc(q);
> +	struct drm_device *drm = &guc_to_xe(guc)->drm;
>  	struct workqueue_struct *submit_wq = NULL;
>  	struct xe_guc_exec_queue *ge;
>  	long timeout;
> @@ -1938,6 +1944,8 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
>  	if (!ge)
>  		return -ENOMEM;
>  
> +	drm_dev_get(drm);
> +
>  	q->guc = ge;
>  	ge->q = q;
>  	init_rcu_head(&ge->rcu);
> @@ -2014,6 +2022,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
>  	release_guc_id(guc, q);
>  err_free:
>  	kfree(ge);
> +	drm_dev_put(drm);
>  
>  	return err;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/xe_guc_types.h
> index c7b9642b41ba..31a2acb63ac3 100644
> --- a/drivers/gpu/drm/xe/xe_guc_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_types.h
> @@ -100,8 +100,6 @@ struct xe_guc {
>  		 * even initialized - before that not even the lock is valid
>  		 */
>  		bool initialized;
> -		/** @submission_state.fini_wq: submit fini wait queue */
> -		wait_queue_head_t fini_wq;
>  	} submission_state;
>  
>  	/** @hwconfig: Hardware config state */
> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
> index 4cb578182912..1949fb3242bb 100644
> --- a/drivers/gpu/drm/xe/xe_module.c
> +++ b/drivers/gpu/drm/xe/xe_module.c
> @@ -18,6 +18,7 @@
>  #include "xe_pci.h"
>  #include "xe_pm.h"
>  #include "xe_observation.h"
> +#include "xe_exec_queue.h"
>  #include "xe_sched_job.h"
>  
>  struct xe_modparam xe_modparam = {
> @@ -112,6 +113,10 @@ static const struct init_funcs init_funcs[] = {
>  		.init = xe_sched_job_module_init,
>  		.exit = xe_sched_job_module_exit,
>  	},
> +	{
> +		.init = xe_exec_queue_module_init,
> +		.exit = xe_exec_queue_module_exit,
> +	},
>  	{
>  		.init = xe_register_pci_driver,
>  		.exit = xe_unregister_pci_driver,
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 78fc2e4dcfc6..5a185ca00c1f 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -21,6 +21,7 @@
>  #include "xe_configfs.h"
>  #include "xe_device.h"
>  #include "xe_drv.h"
> +#include "xe_exec_queue.h"
>  #include "xe_gt.h"
>  #include "xe_gt_sriov_vf.h"
>  #include "xe_guc.h"
> @@ -1049,6 +1050,12 @@ static void xe_pci_remove(struct pci_dev *pdev)
>  		return;
>  
>  	xe_device_remove(xe);
> +
> +	/*
> +	 * Preserve remove-time flush after moving destroy work to module
> +	 * lifetime.
> +	 */
> +	xe_exec_queue_destroy_wq_flush();
>  	xe_pm_fini(xe);
>  }
>  
> -- 
> 2.43.0
> 
