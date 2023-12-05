Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45A74C4167B
	for <intel-xe@archiver.kernel.org>; Wed,  6 Dec 2023 00:23:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 115AA10E64F;
	Wed,  6 Dec 2023 00:23:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CABD310E64F
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Dec 2023 00:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701822196; x=1733358196;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=vyEPiLfl+yTbg83sjFYRxtA/PZQaAfreQtT+BhJkBoY=;
 b=jHCuFoZZT+rvYBYBBCwy83GEhYdJg365IdElCUZnOhrQHUiDvWKXj6s1
 jWHXme/k2Fl9Bs73qJKpxaDdbUM4tf31Cl+6shpKE4uUIgzywRe0whOo9
 bSKuwsYTh3FTYlcAvzLA/ZeatNZ35NnIlIpeu20P6iVAJ71HMYPfTeJoz
 lXiokjiMj/ooQmided1HHiaBkqTqsmGhWFhkJ6LhZAjRTaVSTqqMPrYAt
 8DyG1A08Vcgz7pVTta32FnujF5CJqiIcfaduPIH13LGncKCtuV98e5Vjg
 W1hX9aBX8ex72yUk7vd2puoXFUQ3Zh5yKMJ30z/1TSF/oUkhEMjE/a7Yv w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="458301685"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; d="scan'208";a="458301685"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 16:23:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="805458583"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; d="scan'208";a="805458583"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Dec 2023 16:23:16 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Dec 2023 16:23:16 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 5 Dec 2023 16:23:16 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 5 Dec 2023 16:23:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jTnTOTW5SZ04NBjb9NIiH1YKp9r8VxWj65PaKqGmJXJE9smgDOkJyxIV4iOgORRyeoxDL8SASSrAZW5GW001bsMcXQ8VBbwbKbf15C7CVF7O8VL+qKLwfYgmbsWzT/QIwNK2RkI/7b0+AUqc13YuWnC8y3AcU+wEVd89yarFXklWIKh6iHI93ZxnCU3MD6wS+Is4dPUvrPTQVz9PXB0oqK4yF45OEegREDTGGfqEkWX+lGOJUJl7nhsI8W+KtEHzOTuveOLYZvY8FKEMo5FybFLhDFbn7rN8sCdYZ1wD3w821YBgfNZPYGqgD44p//chrIXeSdN1EwhKmCtdfIXI7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/fm6+aRZySOQkhM60D/XlL7mF7HPSZ2X/AEBrx1Cxw4=;
 b=kcwFOGENh3nZuPqj97Ln5av9kzTooAoVwhpAcwPnH1ARViWvGNe1J/FdFkmo0XbM0gWjxVd/7LOFBvtR3hQ8QfLG2CTzw13U2iyGXi3pyHrAi2Rij+mqxBf20Bsl45ap0DGxxKElGul/91l/Z+XkkGszMALccinxltt91wcZqDD30twgTuidEdVdK1gNAfe3qIh/8DVttMu6cZiBqeCFY9KByxk+0XiDgylZPkESKU8anW/rFg7vRx9kiiOilBDzYxX0vYYwvwd3dp2Ohl+EYkCafLIEpB1fc8093af0WndmfOB4d3S6QizAYvy+QF3hdpugxoGhVXg3GsSvKHICig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by LV8PR11MB8559.namprd11.prod.outlook.com (2603:10b6:408:1e6::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Wed, 6 Dec
 2023 00:23:11 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::cd22:ffd0:f4cd:a9ae]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::cd22:ffd0:f4cd:a9ae%5]) with mapi id 15.20.7046.034; Wed, 6 Dec 2023
 00:23:10 +0000
Date: Tue, 5 Dec 2023 17:22:16 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Message-ID: <ZW9cSEuQ3mvjaINL@DUT025-TGLU.fm.intel.com>
References: <20231206000030.3061046-1-daniele.ceraolospurio@intel.com>
 <20231206000030.3061046-2-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231206000030.3061046-2-daniele.ceraolospurio@intel.com>
X-ClientProxiedBy: SJ0P220CA0024.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::32) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|LV8PR11MB8559:EE_
X-MS-Office365-Filtering-Correlation-Id: 85e44048-c853-4ada-25d3-08dbf5f186dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: twz1oy1wfKvVnGjvGXY6W4RPapE/ox4lisklTSVLYLuk4Lji2fVHXJGSYzO21cQcgurWekcar1X89nOpmEvNjHmbRt0bw7Mhd5VdzSOdiMtmvDl99NmCGMI1vSDyRxUjLtCYNcsiW+1KRu/KQAIIUUgLDxtVdtl2BseUj38x3IowzgtQaeowAVw46/thub7nWy0IsXk6pooDbWXe16WKIJ6g4+27WCEwGWUHSWhS8laAXUdO66jVU24jI2RUbeTcumOjiH2vBrdt9bDFu6XM0TidH21t0+qMuXhA3ejmQzfIje2v67o0Slzn6FAl1kzRngTM2vRCs/CLrzoyR3m8yHphlXmh9ExOxRmPWqbrYqM/L3v9wKP0s68NYyFpd/zxuwmnM5GmWUzx4QFpX955id6YMx3HdMwNVgpSOYvk0HGGjvGghTVTmlkH5kdL/kHoVVvVCvKVdu1HVV5JWCgUV1Uw72szvNmo6vkz0lTWHAGXyFUizk1BqtYF6qPtNg/3hXdLtT2FQJPWlo9OypbMciYPnmzFFXpW125/LPCESO8s23UB2imSqG/hkgpBK65f
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(136003)(376002)(346002)(39860400002)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(6636002)(316002)(86362001)(44832011)(8676002)(6862004)(4326008)(8936002)(66476007)(6486002)(478600001)(66556008)(66946007)(41300700001)(2906002)(5660300002)(38100700002)(26005)(6506007)(6512007)(83380400001)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oKpM+r4uTNKa6kB9nP2s6XWDC1eTWmOAVsbym1ohy/zw7uMkp9SDeCwZg2el?=
 =?us-ascii?Q?XUZ6vhT28bo1wi1SLzWSMc9uJDUA/NQPwWOJa9YcJjm0FYFZJgxYhPvjC/yd?=
 =?us-ascii?Q?Hhoe9w/smCNQlGGK944bHuGYJw+lN+lbxuT2hXjKq2ZkT0i2/MmOX4pONCup?=
 =?us-ascii?Q?D1arB7/jh/abarPRUiK81pJM7uryMeC5wOqnsvIsMoBfmnAjslWuTg3Kkb6S?=
 =?us-ascii?Q?NA1b/zU86T4huW2xgm6jZxD7Cybz2r33Uib8hJ1opYwmjbfiqyRzyYUmdXpZ?=
 =?us-ascii?Q?z0rVN/VVKpaNH4CF8DuROcI0s+hI4L3TCnaxZHWBryDIHzzt0IcPCORC2Aro?=
 =?us-ascii?Q?VtzjBLNNjI8gtc1ZlNwrlTxP3ec2hb2BSJQ40pg6AsuKt5HTfTmLqkRIK1vX?=
 =?us-ascii?Q?m8AoiJn9SS4Vjkj1DCD6ZWengsH8FIU1QOrS84bK1/QWtib5bkPtLo5oVlmm?=
 =?us-ascii?Q?xFqnNrQ0RaOnps2Wh/ZOHhZ0dPfXxlXkTvW8u4F+5N3MJ+Y80aOtfumVLq9p?=
 =?us-ascii?Q?EKticBCnD/KmT2ogCTVV726O4zswo0XqSobt1ElSK+ujQeKu5xs1kIrhKykI?=
 =?us-ascii?Q?Iz3JL6707G48/tEVWyPeihekihJLcHWi9uIqusQxkdVfgGIObc5J2roh/0EP?=
 =?us-ascii?Q?wxOxNyudVMUqyXgQ/doDGFAuw87/woJSplJk3csp9EqmbqdMZSlaOZ2SPrzA?=
 =?us-ascii?Q?2fm1Z5U18IDsgZ6ngQKFHeON1Z/JFeSL7AXvSt575zOtZ0gKRqv56qKlC7KY?=
 =?us-ascii?Q?JN9uqawG+qyUn5K6DVecQ534lxOUzC69xbewApzFJKt+cQBw5IPP0dqzspVX?=
 =?us-ascii?Q?aEdncaJpbTiWTjOYpd+zS4GtiBUO2XaCQ1OyGHqTsRYgG5XMa7gDfOLQqG4T?=
 =?us-ascii?Q?6hLMXnCqFCYuMaRZCqqKL7BbBjJqMOXbcOwnf2UhD8LXXxgiMRk5OleNyo4D?=
 =?us-ascii?Q?lyFvQ9wZ61+WWTZDm3/KmQh0kELy0FaZ1WRPUpNFYqH99e4HDCe+2vXnFsMk?=
 =?us-ascii?Q?mL4gT0mfqLF8eEL2uvjNkGWKhFeoK3h+tCzE7BdsFzcHg2Cz7qQeaOcYmQtz?=
 =?us-ascii?Q?QVGcWePPA1+F5/ZNoxyA85Ub90AF7G8o27moMNkHmdjuDge2SMxLpn7o6koH?=
 =?us-ascii?Q?Q6KgidFSWOkfJ8uI/VpmfiiLY/8PAbztMHCCBxzEd5v9Mb1Ef/r7EyauUGkQ?=
 =?us-ascii?Q?fABpldlxqcHXUmQyZIVw3/7wu2/SMQHI2HjJqmbyEiNaqRajELD/666fa6RG?=
 =?us-ascii?Q?0H9Yv41n+7HIzERwA5oQVgd10YwT8BD70C5FxGsSweT20FYRO6Qjr0Q25F95?=
 =?us-ascii?Q?Dh7pvvghWjOgNVjoH7fUCKIYodUwLNfv/Zlch/cNIMnlKEOWW+QSJSIbU1Y1?=
 =?us-ascii?Q?Dd2PS+Ck/CB9LoiwkSQBffu5OkY0K2A47XgUIQQhS9TTydAMHpxZVH+05i0O?=
 =?us-ascii?Q?436r7MAxhN/kuaQblWLG76CQxGNFkcU4ZCGc00eyzW8E1P8VOdkqv7QVUjrV?=
 =?us-ascii?Q?fz40weCQlshpJseHg3LUde9r7rxlQOIBJhMrY6WZYmJIEDMivO6i+d2ZYpmE?=
 =?us-ascii?Q?iHpVP+XmxEFLf+hR/7PhU93pumrdJzRIvbejH07gS3L7L9dm+7GSai4oeoIG?=
 =?us-ascii?Q?1Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 85e44048-c853-4ada-25d3-08dbf5f186dd
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2023 00:23:10.5972 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ajkpMW3Z7rpbz033DbfeGY5Akwca3ZnrWGOwujHaqOMNY2Lyw8GYrR1bLZZLc77e657neiTDVntQa/SuCnkVjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8559
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/1] fixup! drm/xe: standardize vm-less
 kernel submissions
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

On Tue, Dec 05, 2023 at 04:00:30PM -0800, Daniele Ceraolo Spurio wrote:
> VM-less permanent queues exists for the whole lifetime of the driver, so
> they can't hold a wakeref. Given that these queues are never
> disabled/deregistered and should never hang, we don't expect any G2H
> messages outside of the submission flow and therefore we don't need the
> extra ref at all as long as the driver makes sure to hold a wakeref when
> submitting.
> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Good fix.

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index cb284c4ad049..85574740bc1e 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -95,7 +95,7 @@ static struct xe_exec_queue *__xe_exec_queue_create(struct xe_device *xe,
>  	 * can perform GuC CT actions when needed. Caller is expected to have
>  	 * already grabbed the rpm ref outside any sensitive locks.
>  	 */
> -	if (q->flags & EXEC_QUEUE_FLAG_VM || !vm)
> +	if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT) && (q->flags & EXEC_QUEUE_FLAG_VM || !vm))
>  		drm_WARN_ON(&xe->drm, !xe_device_mem_access_get_if_ongoing(xe));
>  
>  	return q;
> @@ -172,7 +172,7 @@ void xe_exec_queue_fini(struct xe_exec_queue *q)
>  
>  	for (i = 0; i < q->width; ++i)
>  		xe_lrc_finish(q->lrc + i);
> -	if (q->flags & EXEC_QUEUE_FLAG_VM || !q->vm)
> +	if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT) && (q->flags & EXEC_QUEUE_FLAG_VM || !q->vm))
>  		xe_device_mem_access_put(gt_to_xe(q->gt));
>  	if (q->vm)
>  		xe_vm_put(q->vm);
> -- 
> 2.43.0
> 
