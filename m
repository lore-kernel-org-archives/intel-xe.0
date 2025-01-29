Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE0CAC0218D
	for <intel-xe@archiver.kernel.org>; Wed, 29 Jan 2025 17:47:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ABEA10E10A;
	Wed, 29 Jan 2025 17:47:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h3Z3VGSm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACE5310E10A
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Jan 2025 17:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738172865; x=1769708865;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=rFv6edh6smAF+9IbHC0fDdR3Pcv9JeL0Fe82EqxMOlI=;
 b=h3Z3VGSmTC6MmDeVa2xjCkHgND/BcyqToat1syMKR9cAcXDEJs485TZY
 WHZksaYTGUBvRX7T4KhnL2Y2wYPb+G3Tk9V3zoLLkY/MrEtq6eyKGf6ah
 MhMshr7/qFBHC1NBb/1Q0No91C9IKPs+LA2a9mlqtfpwCT97LnrEHlr7Q
 5HvkDQXFMOTOZ1Ktz29pULKc4rqffoXu9H5KKKpIXDfNtErIsYpRm401v
 AY4nuZiZ1pzxARl3hLGTZE8atdeLC1LpYq7wYYHQl/c7sopbbhBcAGQCH
 eQGJlgAqWYFQtSIfKOox4HLnzTJ2IWdietgcccCpwZLuUjHa3Em1AvFgJ A==;
X-CSE-ConnectionGUID: 1TTHMSWOTKilDAqgfmRTVA==
X-CSE-MsgGUID: 5Dx1JAjlQMezwN5aEhIEzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11330"; a="56238892"
X-IronPort-AV: E=Sophos;i="6.13,244,1732608000"; d="scan'208";a="56238892"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 09:47:45 -0800
X-CSE-ConnectionGUID: FCyfF6ocQ7SIUrB9goHcgg==
X-CSE-MsgGUID: DLmSgLFrRVK40FV53T6y4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,244,1732608000"; d="scan'208";a="109655589"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Jan 2025 09:47:45 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 29 Jan 2025 09:47:44 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 29 Jan 2025 09:47:44 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 29 Jan 2025 09:47:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PJiuB7XFLr3W9ehGnzD9lFHHRFr/VtcQv4cB/5BSwHSdG057UHQDOxHWvG69JNyG0Ej/H1GOqLuvZwY0OAYkYrz4qFscGk2vOaP42zPjGvt8rhlBHBbqhrRXoqXSmbNqLULZpXzVL98YAua5I5G8MziTQB0SYKv3ay6iDPyoQM8vw/qM/2vFjzp1JwSJByu9/07MHOP8jPx07Qff/CQgOmyXDn3oQQ6Jn8O5fIJCltwoxgrg+gsuMXoMCJj3NEmiJRbns0y2BECB/5T11QZ6GidSTyVE7bkpXGIOjBZKPeYf581LCO5f2Wt/j9y1RAt1O9Sr/0MnhOcRTeyODujH7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P4wMcSFxRgP8KHXITqVz6gii1AnptZXWBYw9PEo0rUc=;
 b=xZr9TZkJVG6YCMSJuEvRIy+2VVYwck4pSFHagotwiWtP0USKAmVwIw6JjyFpqjef4QKPjyD9i83QPqXHB3Plyf5BhZOtA0SOAS3Y8aP7cn5cP2eASXrsAaoxcS79NVu7s5O1yNmDFDX5EApSnBoWfiqOaMT1repSjaGeP/iQnB9zkZ3Lu4K8kvcXScYCE2pVDlzreg8z1QBQ2KseI26rk+6/WX6BTO9I3zXJoP2qAAapOSLtuONJM/Rvqe5N1fKiBRPAcpDAmIkMjVmJlxIhsCcn0dQgMnoRSNiueNPFrrS8dHymWh35Hbgsn8S64PQf7GFUdyAl1kOMBgSa87Ruug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH3PR11MB8546.namprd11.prod.outlook.com (2603:10b6:610:1ae::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.17; Wed, 29 Jan
 2025 17:46:54 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8377.021; Wed, 29 Jan 2025
 17:46:54 +0000
Date: Wed, 29 Jan 2025 11:46:51 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: <intel-xe@lists.freedesktop.org>, <kernel-dev@igalia.com>, Matt Roper
 <matthew.d.roper@intel.com>
Subject: Re: [PATCH 1/5] drm/xe: Fix GT workaround handling
Message-ID: <mgjamkdkkivqko63evowuxuqhxyabr3oxqdkc27ldyja57eelf@xa3pdzszryrr>
References: <20250129155627.93827-1-tvrtko.ursulin@igalia.com>
 <20250129155627.93827-2-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250129155627.93827-2-tvrtko.ursulin@igalia.com>
X-ClientProxiedBy: MW4PR04CA0302.namprd04.prod.outlook.com
 (2603:10b6:303:82::7) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH3PR11MB8546:EE_
X-MS-Office365-Filtering-Correlation-Id: 9609f15e-751c-49ac-c1e8-08dd408ceb3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QhHoRFEnJdcxA3HSRcidAWXM8w8OHX98aMmgTskYCEGgCu/r6ZG7WpbwWj+7?=
 =?us-ascii?Q?/JPTCaOhIUFJxwNKfzOB5dzkqg9P68fKQLgFvLlmC39/GZSuFsn+MS4YnqX+?=
 =?us-ascii?Q?ZWYdlxcVlrtMW6UbMJmwx9Wm09faNbpvlRA3UW3BhYcPWc9VG/604rHbgzdH?=
 =?us-ascii?Q?4znw8fsUiyqsTPZTrSLH8STJeSm8rNy9LUFjUcnkQyJopYp6tWsi132/ynBb?=
 =?us-ascii?Q?J1MoO6lsg8TPaVELwYOexW5sga1Psuy3VxZ4DQvjO5cFtbdS1cGGLBfv1ZVV?=
 =?us-ascii?Q?BePw9QKzDogiE1YiWnsB+WyRxVTg3Rwc1aPHpDszbjKNiyMbaubKSYrwiJtb?=
 =?us-ascii?Q?Zqj2pfy/ss36zXgNkLRoHJ67jKWpg83wi5OJ2b7WySh/NNMu2pPihhnNVS2o?=
 =?us-ascii?Q?+WB/OD3vOYDNIo1l5SfBD9smwmCNOvuvJPnl1Kjy4RCLNJGepPpB6fhDeBVh?=
 =?us-ascii?Q?oDJ3olVLBtzY7YqHmwkxxydFjMPBiI9yorGlk1xv71yl4JsVi6aFwS5eMUwc?=
 =?us-ascii?Q?pcwl9DVWzhthkq8xWheO8AUEGOYL15w3DhwrYbbTmjK83yC22GrWIO0UFdYV?=
 =?us-ascii?Q?kF31TvkOPnd7ukA7ED4WPJNgq3GlzJUb/6jCClRgMuF4a++j8WlH/yCMYFf/?=
 =?us-ascii?Q?dQ3lT2tFmksfZaPw+dmRmBByv8q+gbQU+2fzz8rUjtlC8mb4IEGkMVcPk+tq?=
 =?us-ascii?Q?Wxxr7AUqfmWNFgHqaHCiNDI2obJtG5Rbaysl2alJN74YSpb+fovLyJgkGFH2?=
 =?us-ascii?Q?E+Bdr9hpx3ePcQm4eHqhjPZnxOC8Yfi6+QAEQqZkjV5MzlmlX/ZlqaGdTNqF?=
 =?us-ascii?Q?6S+wDucMZww0faeUCmVbzlldID5rnqPtVvn8HMuoVhydfBYMrjxQWSR5kVbQ?=
 =?us-ascii?Q?aT7MZyOpZojI1c6mICAqPSp226bkQ4lHJZa4Cpr0EqnvhsK4JLL5wuNBYx42?=
 =?us-ascii?Q?ifjnNDVPbzlciMgXRg32pG+sIUXHzihEDD4vOIsetJKQh817nNZpxZT00Bd4?=
 =?us-ascii?Q?1oqHUH1qzpJ7+TbR+S41V1AsbM2B/90809S42EiA2V5B0Cr0kNwputebpxjh?=
 =?us-ascii?Q?p4R+azAOgvR30F/fSBcrOCVYrTl+kY0Twd4UznZHhnxJgZxc3+QSaoqTWFXm?=
 =?us-ascii?Q?GVeY8UkTWVGtciHJ75s21J95u9LBf7oa9edgqDT31COhWuP9zZSWR+4sRZaj?=
 =?us-ascii?Q?K8mPTWC8l3nKPFUhLE4/SUR3aOlBi6spdvsKR1g+JA4h9IjrUPQhPdpjOqhw?=
 =?us-ascii?Q?CDL7GROsy22I+LvrN5O5GKqEld8cYXOt/8Ku2clWcA/ZdbTFQVctXsL4jku5?=
 =?us-ascii?Q?1JWhQIZYC3unYVnKP0XZ/PGxNS2Y4gGfCFpW/7IolsEJ4u0t5OwlmbTEJfhX?=
 =?us-ascii?Q?DqALdSAZhduvnzQeNbH26EKZtq2q?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HYlvVtCT37vhgWI1vDbq1L2w/7Y23ZOzplEMdnnZ/4Ot6MGnKXGodcv/7+/g?=
 =?us-ascii?Q?xRWAyA3+wiHomIBlY/NV2zT5HfEDzFQnpg1T9L4GxOrMm8rL9ttie5HCPzYz?=
 =?us-ascii?Q?987PaNvEV6oHg5X0QXBgIMWFrcG4qfGZ/2AxtZW14rQ79zFgKkWPIVMMkFTk?=
 =?us-ascii?Q?npUnkLK0H6/eURRILNFqAvkn8sm505FSg19FPLXPlde2YohNSA3BanD5nUon?=
 =?us-ascii?Q?hz/hnULjHJ3Z6B94pSklmkI6UF/TpqjHuINZieRb+tj8bmxiFS0urDiNxqd8?=
 =?us-ascii?Q?4qtPecCqAWKrQBYRgco4Rk1W3Lll6NVObQeQiX3V7xHlOIJZPd2Cjkx9egU1?=
 =?us-ascii?Q?uhuB3oHpEF5Q6xLPusaYjZEpkwPBmExnSE7LMItYSSdWVige5AYx89/SfF4l?=
 =?us-ascii?Q?hcvRpA9L1WwQ/rT1MU7/FW7HQ4UTWVZPGit2Dj1Jhb31zIAwweU967qm7EMF?=
 =?us-ascii?Q?0bsGFrllk+VcwBkULR3aKn5/YXCnyBAJb80Uuq+H8auAfqDKemyQOr032gzu?=
 =?us-ascii?Q?BoPe40FPVZpZJB7gqBrOYARTD/sSIjcuO1gpKNvJRr3kI15FpdZPTSCLepGn?=
 =?us-ascii?Q?vsn5SZ9afqJ4glCf8YOzyg0wK5nikyoPH+y/C2MqJZy0y5lCFag+WAw+BCE0?=
 =?us-ascii?Q?uYB7XNoetABHLzP1bMATd9v7kMYuGt/ETrZk4VSjNR/Gofn0y+jfOCnl5KIq?=
 =?us-ascii?Q?gngWjOq6dydHEAeFOghYhUfS5z4VKWln8CQJeeQKFqs868+RaG5ztwk62AJA?=
 =?us-ascii?Q?Xa8GeRy3DrOTwRt1aIu/m63uYXzoJxWFtSQlLHsHZJlNx1JmT4pZYpQ5dDT0?=
 =?us-ascii?Q?EW0x6RgrYqeUmVHrxcG0B/O/5bmu5KS03QmdpYAjnzPx+BeT6aIXu1yFJLEu?=
 =?us-ascii?Q?WLBO7dN79dcj/Gx9yXrleIg2O4573HyVqJJrBv9ZtXo/gNYDNYVOoJjkdzDR?=
 =?us-ascii?Q?Yd4N5TVSzDJK0OcxarhvPCAXob1I0yJBf/sF/i48M18xSGVLUmbhVjW83Oa5?=
 =?us-ascii?Q?MUvWJEkfqVck4FRdBV5DdlfhM3tNc3OGestz+e65sF1MgBy99LLLMt1roavG?=
 =?us-ascii?Q?IlDkysFYjA9QpRbPmejCQZcVAH0OblP8M6w1xWjTpw5BUcRV5QN68ARucUTr?=
 =?us-ascii?Q?tU6rPrubycYGfAdDc9QikcpWBvjhJ5cSrDNXwCc0TwrSU2U7PkHcurtieIZ1?=
 =?us-ascii?Q?eonCAtFk43sjEUOqGEiCJ/8n1jLHMQPZhAp9rS4pjDkIYSykoM0osO4N6Sin?=
 =?us-ascii?Q?NhHij14dVCFbUP2vn0OiGmLBKzJvTqcCrWWnUaSuYh0JO9brwSyX/FO3XwaJ?=
 =?us-ascii?Q?8M/CDhcydJSvRg3WO/U9ax1wWDH6JIWeS8QWyj36Gwb0PW5k3M4yBzIUmD3t?=
 =?us-ascii?Q?p+B6y3al94q6HhKfR2jshQg3TugjsOQRG2WY8nsHTkYo1qrdtEir4jeNJZ8t?=
 =?us-ascii?Q?/myjeSsNJQdFREjvpOpQRPlo3T+WkRT/S8M7jBa2DQS8JebRurSDcy/GkRyH?=
 =?us-ascii?Q?Kk9rhu33RjRx2l4/+xBiirGTfeN3PvmRSQWj2fz6DZfaY2kJf7i0diSq6YVn?=
 =?us-ascii?Q?4G8+aKiMxO4nykdQrF6YpTeGvhNFCKA3nGTu3lHbPn13lBMOg02x7zSY7qng?=
 =?us-ascii?Q?sQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9609f15e-751c-49ac-c1e8-08dd408ceb3a
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2025 17:46:54.4221 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u205dv6XhjKfIZGYbLl+eQAKyaqGf7m7epRXiBw34qHPh+Pkn2dhN1hZmlxV/tlVqFRW9ZhnWuJuVOe8zeo49zkm8PAn+Q26gZPVHaHOXnE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8546
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

On Wed, Jan 29, 2025 at 03:56:23PM +0000, Tvrtko Ursulin wrote:
>Any rules using engine matching are currently broken due RTP
>processing happening in early init before the list of hardware
>engines has been initialised.

for *gt* workarounds, it only makes sense to have an engine check
if it's something like 

	XE_RTP_ENTRY_FLAG(FOREACH_ENGINE)

... as it doesn't have an engine context. It will loop through all the
engines on that gt and add the entry for that register and it should be
able to do that before the complete engine setup. But indeed, a
quick look on my tgl doesn't show e.g. 14011060649 as being used:

cat /sys/kernel/debug/dri/0/gt0/workarounds

I will have to take another look.

It would be useful to dump gt0/workarounds and gt0/register-save-restore
and check for not having a setting that should be there, adding it to
the commit message.

>
>Fix it my moving the processing to later in the init phase.
>
>Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/xe/xe_gt.c | 8 ++++----
> 1 file changed, 4 insertions(+), 4 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>index 01a4a852b8f4..7feb4b6fb976 100644
>--- a/drivers/gpu/drm/xe/xe_gt.c
>+++ b/drivers/gpu/drm/xe/xe_gt.c
>@@ -380,10 +380,6 @@ int xe_gt_init_early(struct xe_gt *gt)
> 	if (err)
> 		return err;
>
>-	xe_wa_process_gt(gt);
>-	xe_wa_process_oob(gt);
>-	xe_tuning_process_gt(gt);
>-
> 	xe_force_wake_init_gt(gt, gt_to_fw(gt));
> 	spin_lock_init(&gt->global_invl_lock);
>
>@@ -616,6 +612,10 @@ int xe_gt_init(struct xe_gt *gt)
> 	if (err)
> 		return err;
>
>+	xe_wa_process_gt(gt);
>+	xe_wa_process_oob(gt);
>+	xe_tuning_process_gt(gt);

that is too late as we need the gt WAs in place before initializing GuC.

Lucas De Marchi

>+
> 	xe_force_wake_init_engines(gt, gt_to_fw(gt));
>
> 	err = all_fw_domain_init(gt);
>-- 
>2.48.0
>
