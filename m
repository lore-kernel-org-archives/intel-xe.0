Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E6ADCCF9E3
	for <intel-xe@archiver.kernel.org>; Tue,  4 Nov 2025 23:02:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1437D10E0CD;
	Tue,  4 Nov 2025 23:02:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N1Z3eiiG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71E7C10E0CD
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Nov 2025 23:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762297377; x=1793833377;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Sqmt1syYRMeUZJw5wmPNDUSHjgne0OtQnVu7ZzKiLJk=;
 b=N1Z3eiiGpWKz28uiLyWHNa1XVKzBfn2bL6PW0kDzFnVV0vUtpT6Hjrge
 C9lg17wcoaOL1tHPMraImHoHuSfcXKOUsSAc0yf8lpWc5pZhiK+zmKgMU
 sr6XLPZOLsqtTsssyJr8/uwBpG585JCES7QF0f1vg3YwreTmUfuNFnNet
 A+mvtKkid8qdLyt6yqIZ3EDq5gp2zucjGSLaJb0WZ11VtDtI5cKbRtYdv
 BQyIx3rtTE8qKpIEG+0Lxy++HeHDKWhWmoSV3/jvuWbjgcwCMdrSleYC/
 AWJyozWOSQwpa+SxbyiEz5IuCs9WGdKsxEyEKJ20Xm60ea/bfJ+fryPV0 g==;
X-CSE-ConnectionGUID: DfpA5E/zQmixSEtn+HB4Uw==
X-CSE-MsgGUID: V8jfN+ZdRZyS4jqnlWVNUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="64503244"
X-IronPort-AV: E=Sophos;i="6.19,280,1754982000"; d="scan'208";a="64503244"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 15:02:56 -0800
X-CSE-ConnectionGUID: MDz6XoZGQjOXAJQoc//JBw==
X-CSE-MsgGUID: nMpNFDrVSKqwEmub9mF3Ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,280,1754982000"; d="scan'208";a="187730383"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 15:02:56 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 4 Nov 2025 15:02:55 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 4 Nov 2025 15:02:55 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.27) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 4 Nov 2025 15:02:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=El2slsWi87Br//2EBTIx4Xi4yqJs5nRC/dm1P5Xgb84ooT1aoHhT8PtJi0Z3vy0QEgGdEjOEkb8IHqHuVw0CFwxNYiTZw3aI7KCXigBsBRynkCj5WHsGKpkHmiPX8DhQzcutt4BWIkaP+OA8aHGrcN/BONq95cnaGLnM34d/VYqYSwV53vCZ4CQPguJVObsk4z+M27YogBIMIpRgzmy8R/w6/dSU73wec9GPz3ZUUiE0PWziKqKMb9jzs4yLigZp62/uRmWSPXuVqI5ybeFS5CZOOQPHp/DLZs7cxnO/e2LORq3kwx6+lclo5rm1h+gAf+kAhunjOIqM3BfUVE60DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tYZwQkLP4t0W9tau/AHpMfmwy3Aplks/kqQ0J08W2oo=;
 b=D36lLKDx+wrX8BsIGRiRqrzBMFD/K1pyeZ9QI7se9G/HLis8RAnDKc2HvDefMmbWPZ3+Xyz/4JtG14OhhXYhEmwC27zye6IpSLAZZtjoOo99+PkGCRK6+s7/eeSLWRdlMkXMSUIjTM1xqk0PIPhKiwFdevqaSY6X2kY8rUJf+ctfE2t/Z5qPE1InV6CgZ8L2+g47nm0STzIWPdnBpKIXNmFFMOA1YLLtfxiJ8+EsSrfWGMUyRjs2dYpHQsSxobGy4w9kiAzZ51T3JEgcKs/AK4+zaLdceotg5m7EmZ+M4iuKriyT8fxQ/bAQ2c+bwo1YJNu09Wk8j2LZEtbeIOrhhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB5310.namprd11.prod.outlook.com (2603:10b6:5:391::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Tue, 4 Nov
 2025 23:02:54 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9275.013; Tue, 4 Nov 2025
 23:02:54 +0000
Date: Tue, 4 Nov 2025 15:02:51 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 07/16] drm/xe/multi_queue: Add support for multi queue
 dynamic priority change
Message-ID: <aQqGG5izr0hka5Ww@lstrano-desk.jf.intel.com>
References: <20251104185150.246345-1-niranjana.vishwanathapura@intel.com>
 <20251104185150.246345-8-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251104185150.246345-8-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: MW4PR03CA0059.namprd03.prod.outlook.com
 (2603:10b6:303:8e::34) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB5310:EE_
X-MS-Office365-Filtering-Correlation-Id: bfc8e57c-04f1-40e9-15ae-08de1bf64943
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MEUGNBCmb8/qqZxywigRT7AwUbc9CzopSnL7G2vn3tTg+c5l0uAQzmYAuRSM?=
 =?us-ascii?Q?PwD/RTLGFP/56EaJh6TkLf5s5SP8O5TC/PaomxtYUazOcE3PegvJiOr+/Euc?=
 =?us-ascii?Q?rIV6pnwcEwTGqRAP0EC4Im74tBm7ZRQF5VaizRbGYiD5eIXVOhQBMdwyztpj?=
 =?us-ascii?Q?HkFqnNBR8FcK57ZQ0l0bSfTqcL6IEqap6F+07SIFxHZNdrJUj4zIUoCC2Y74?=
 =?us-ascii?Q?d9dr59oqwGn1kXlAJ7p/Ln7TX9haWX+bul4Y5/tsFZPaf1eeJwqB81ZF1kHd?=
 =?us-ascii?Q?Gauzn0dDPfAlpFcCd5gvAdKFh1eRvq/puN08zI5MGMor82WLHBdleWskTvYB?=
 =?us-ascii?Q?t6EVkDDu8UkHQCwS391b6nZeEMY5L0z3Ex4GAIqd/dL6fkVEeCUISHJmdE44?=
 =?us-ascii?Q?FJNva7KE8zv/A6CyrE6CkOFuGotPpyHqSg75ZjdADTc5ihvOhHdQgjdZjyP+?=
 =?us-ascii?Q?TuxF09bJ8/vPOBDtxxWIF2BRdu8KeD7niOTcncW/gqBE/RvsGN5c3zxaoiXt?=
 =?us-ascii?Q?i55TcxZ2eLTETjEvvbyaivTxq/S+b9UtjMxaZUMQDJ+xvjUQ+amAGWOFeWM9?=
 =?us-ascii?Q?rcaIS41sosd4dW21+LUNPVGYZqLtJLwJsGnsWQPUZ78ikclZZM5y86LKsVIH?=
 =?us-ascii?Q?eXX8dGardsEbHYiqPZse6Rd7G3NoHE32Uw2rX1FCKDNey32cwsmCgwaNrrtM?=
 =?us-ascii?Q?jgALt8yM1Zxqyu2qvjj14BOkvYIEMyRaAj4irRiSv6oCw/Es2cmFjtGQWqxC?=
 =?us-ascii?Q?tSPpmVWeX3FtnmzSJqU3lCUtZj2Crx/3OzfYF+mEXB6x6x70vte3gx5tX7HQ?=
 =?us-ascii?Q?ohlLRy0s8Pc0iblHmAL6REZkOvD0DuI8cxe2CqLnFQDYadURa5ySXVcHwyIa?=
 =?us-ascii?Q?3tdfIYZnYSATlIEXZWOcPnQauiS58VVl03edMqT41uVfNIL63lp3v4N6kYJe?=
 =?us-ascii?Q?pImfX5TJqr7xhvjkEC8aBUdd4rVWrDh1I2utc9NI+a58yp6igtdJWo3t2FoI?=
 =?us-ascii?Q?8jHSYatOz/CvRMkFuW34H1WkY1pLTNRL1nUiYTX9uvin1fk1QXo6U1WxtO0o?=
 =?us-ascii?Q?u5iZt71JIg9OvMx6X7jNkk91SSyQGAgX+If1sxDuCvJUxZXP0NRFKUwM4+bk?=
 =?us-ascii?Q?ihetKL0lthfkGiW2yuZHjQzfrnLQxO8oJpiRqKa/jc6IMwX2jMJW0mD0JyLh?=
 =?us-ascii?Q?+rCVnqWrMFvYZSRwd62ANGG2Q35MIARUe+O4D+HdD9qHROJ6RMwk1ATE20zu?=
 =?us-ascii?Q?A2OO+i0ynadnEeLtnuOHMR2330xUyjwS2Eo9e5WD7swZzBOGNHyncTEasvUf?=
 =?us-ascii?Q?MYomJ9Qm8DLt08bvGD+IfbTPy+NxHJfS5m804GamOgJBKxqil3Sz00sIpDCL?=
 =?us-ascii?Q?VRHfHLjbL+bjb3z4mMupaEf0qnG8w3l40+e6g9zEN/3sSMr2fR0jjMR8qBk1?=
 =?us-ascii?Q?SNvORVL25zZTPx0NxOjaw7NYZrNxrj6m?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6dpu1LqGJm0CyNjMWvVQx0usUAjQdAvjNAujM3ys4t2oPlkaRizTOoqKCYyv?=
 =?us-ascii?Q?kSQqMlX7wo393cO+RbMS704ffUs5L9H7zybpXyx3bBq43VHSDUvVzcpDbsI2?=
 =?us-ascii?Q?GihC0x8dEHTssuq1aKgm/WJHqQez61TEndogdrvDPVv9XFty8BNpHzefB/yS?=
 =?us-ascii?Q?qzadyAH4EpGpuivgG+fwiAaJDEeThs1pL2gyOT1FcZCqeJEesQwfzicuCxXr?=
 =?us-ascii?Q?9FRR5xID4j+KyudJh6tumj8OrEqclxb57Q7V4IhB/RTsVSruV6wzdJ6958jo?=
 =?us-ascii?Q?pPnb2p4akf+lQFeZgZzJvlgnf1OhY/vDoFbdvws1lRxeu7XPqpDHyTwmv4ZP?=
 =?us-ascii?Q?giQY5P7xy13dLqVvqct0qGB/8HFIUkPf9a0iC7Y1eNWem5egrxacIoA8XgzY?=
 =?us-ascii?Q?i6LzBL1ifDRkWwLrnf1qPHizPsx6IgOjnUucdxCrNA8TevyxAJmOesjJEspr?=
 =?us-ascii?Q?LbhnVYL0OANsRqpvwm68Jgg+Vgf6nfUdbagtW6ulK0BCzi+xWPo9NGoeiIYy?=
 =?us-ascii?Q?YHWrWjTFnJo2D37DDGv9Po0XHUCcIT+Unss9ut+jFEakjI9beAHE85YAGp+Q?=
 =?us-ascii?Q?w4UCHanXH4h361lBM5vPnwx2a1XXHnt/BN9MesxRyE2xlHc6AxoA4Lo+8BQD?=
 =?us-ascii?Q?NPlQamsN241yMIqvEM2tmApTc78V0Ukg3jCRF+L5HoNURc8Jp1Bm8Hx6hiq4?=
 =?us-ascii?Q?UIt11YxYQvN8rBUEuH8+8KJnUB02RNQ96e5itulwwiXvJCo/3PfvDmxXxAhr?=
 =?us-ascii?Q?HVkXxpkZCVgnc2xjsvR+R7bc4lgn0leU3YEHUC5KintPMpfMp0cBg3efMk0n?=
 =?us-ascii?Q?6yH+PaJeKRLPxi2n+pJdlASkFcpNq5VZjWAYN5nR1AqrI4vBW6lVCDSXaaPs?=
 =?us-ascii?Q?swp66pey1AYzfnql0gdmqKxvETKNEwEvJrk5AukQJf5zK5AzirNn0I186wxQ?=
 =?us-ascii?Q?VQ/LH/4fMOlvNtslq2BjTAe/D06fwUlHwmdrjBXQdGTbkTeHwjpGnkB3Kxo4?=
 =?us-ascii?Q?y9s71jSfYMQ1FPJfdxax35OBVgyesKtxAFQQ8Fqb7coOd27wtniIWTIO6n7e?=
 =?us-ascii?Q?dRNNqdnfGnmKm74ESUH1L1ckZijqnk8C/qt3WBSxVU7QwMTe+1AdZl67LSHx?=
 =?us-ascii?Q?eLZvda3NhZHqHQtUkXzWzOzifqOG9mu5jmy19LF76HVQ3doZyO6oQqTqq5Ts?=
 =?us-ascii?Q?QZugxeJHoEHDN6CFHqJHpdnquk/gi7vEpuMr7nKgPztTTVSt00iNtJsAGpQs?=
 =?us-ascii?Q?EwSS/olaFKVzhghkhpTjkXN1FDLefc0zazXffAZXIsnEOAmILPOIgd2UC0np?=
 =?us-ascii?Q?gPIZKElx14KfBUWACwXd8g2Is0uiBTYWm5YaxVpamez/uqf5mjN9W0ky259c?=
 =?us-ascii?Q?niqxaMjsvYQVXY/kutfyvFovsblSw0Ao7fr1RwzTxvNzg0EzK7ofgbUlxuo6?=
 =?us-ascii?Q?9oxnOJGQFNT5KAOYlTYGGWfxUS4WV44yfT01ls4uySXb59OgYISt7bdD6ins?=
 =?us-ascii?Q?33NRe+/6Be7UtBrFwYRW2K1tJhB8rNKjVhZvD/MBo5yb9fijhFzrNeER9UcQ?=
 =?us-ascii?Q?S1ald2URW3zy1/nT7ssrzLIuDcca2KeCQ72zRYVGS+hEdC0HRFy4Ml/QXy2k?=
 =?us-ascii?Q?fw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bfc8e57c-04f1-40e9-15ae-08de1bf64943
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 23:02:53.9956 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: teoyTOyI4J150ZW+CMkkBCow9wMVxJvfzO8cnl5sW3ykdCK5Jolo6VnGhs0g2s9Zz/lGJa4xkQ55qe1qRHz70A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5310
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

On Tue, Nov 04, 2025 at 10:51:41AM -0800, Niranjana Vishwanathapura wrote:
> Support dynamic priority change for multi queue group queues via
> exec queue set_property ioctl. Issue CGP_SYNC command to GuC through
> the drm scheduler message interface for priority to take effect.
> 
> v2: Move is_multi_queue check to exec_queue layer and assert
>     is_multi_queue being set in guc submission layer (Matt Brost)
> 
> Signed-off-by: Pallavi Mishra <pallavi.mishra@intel.com>
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c       | 11 ++++-
>  drivers/gpu/drm/xe/xe_exec_queue_types.h |  3 ++
>  drivers/gpu/drm/xe/xe_guc_submit.c       | 55 ++++++++++++++++++++++--
>  3 files changed, 63 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index c96cc085e8e8..fef48b82b189 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -744,9 +744,16 @@ static int exec_queue_set_multi_queue_priority(struct xe_device *xe, struct xe_e
>  	if (XE_IOCTL_DBG(xe, value > XE_MULTI_QUEUE_PRIORITY_HIGH))
>  		return -EINVAL;
>  
> -	q->multi_queue.priority = value;
> +	/* For queue creation time (!q->xef) setting, just store the priority value */
> +	if (!q->xef) {
> +		q->multi_queue.priority = value;
> +		return 0;
> +	}
>  
> -	return 0;
> +	if (!xe_exec_queue_is_multi_queue(q))
> +		return -EINVAL;
> +
> +	return q->ops->set_multi_queue_priority(q, value);
>  }
>  
>  typedef int (*xe_exec_queue_set_property_fn)(struct xe_device *xe,
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index 445ae4979c0c..cafb3ba9a123 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -257,6 +257,9 @@ struct xe_exec_queue_ops {
>  	int (*set_timeslice)(struct xe_exec_queue *q, u32 timeslice_us);
>  	/** @set_preempt_timeout: Set preemption timeout for exec queue */
>  	int (*set_preempt_timeout)(struct xe_exec_queue *q, u32 preempt_timeout_us);
> +	/** @set_multi_queue_priority: Set multi queue priority */
> +	int (*set_multi_queue_priority)(struct xe_exec_queue *q,
> +					enum xe_multi_queue_priority priority);
>  	/**
>  	 * @suspend: Suspend exec queue from executing, allowed to be called
>  	 * multiple times in a row before resume with the caveat that
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index b01d852ae526..27ef83524a34 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1767,10 +1767,32 @@ static void __guc_exec_queue_process_msg_resume(struct xe_sched_msg *msg)
>  	}
>  }
>  
> -#define CLEANUP		1	/* Non-zero values to catch uninitialized msg */
> -#define SET_SCHED_PROPS	2
> -#define SUSPEND		3
> -#define RESUME		4
> +static void __guc_exec_queue_process_msg_set_multi_queue_priority(struct xe_sched_msg *msg)
> +{
> +	struct xe_exec_queue *q = msg->private_data;
> +
> +	if (guc_exec_queue_allowed_to_change_state(q)) {
> +#define MAX_MULTI_QUEUE_REG_SIZE        (2)
> +		struct xe_guc *guc = exec_queue_to_guc(q);
> +		struct xe_exec_queue_group *group = q->multi_queue.group;
> +		u32 action[MAX_MULTI_QUEUE_REG_SIZE];
> +		int len = 0;
> +
> +		action[len++] = XE_GUC_ACTION_MULTI_QUEUE_CONTEXT_CGP_SYNC;
> +		action[len++] = group->primary->guc->id;

If we want to be really paranoid;

xe_gt_assert(..., len <= MAX_MULTI_QUEUE_REG_SIZE);

Anyways:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> +#undef MAX_MULTI_QUEUE_REG_SIZE
> +
> +		xe_guc_exec_queue_group_cgp_sync(guc, q, action, len);
> +	}
> +
> +	kfree(msg);
> +}
> +
> +#define CLEANUP				1	/* Non-zero values to catch uninitialized msg */
> +#define SET_SCHED_PROPS			2
> +#define SUSPEND				3
> +#define RESUME				4
> +#define SET_MULTI_QUEUE_PRIORITY	5
>  #define OPCODE_MASK	0xf
>  #define MSG_LOCKED	BIT(8)
>  #define MSG_HEAD	BIT(9)
> @@ -1794,6 +1816,9 @@ static void guc_exec_queue_process_msg(struct xe_sched_msg *msg)
>  	case RESUME:
>  		__guc_exec_queue_process_msg_resume(msg);
>  		break;
> +	case SET_MULTI_QUEUE_PRIORITY:
> +		__guc_exec_queue_process_msg_set_multi_queue_priority(msg);
> +		break;
>  	default:
>  		XE_WARN_ON("Unknown message type");
>  	}
> @@ -2010,6 +2035,27 @@ static int guc_exec_queue_set_preempt_timeout(struct xe_exec_queue *q,
>  	return 0;
>  }
>  
> +static int guc_exec_queue_set_multi_queue_priority(struct xe_exec_queue *q,
> +						   enum xe_multi_queue_priority priority)
> +{
> +	struct xe_sched_msg *msg;
> +
> +	xe_gt_assert(guc_to_gt(exec_queue_to_guc(q)), xe_exec_queue_is_multi_queue(q));
> +
> +	if (q->multi_queue.priority == priority ||
> +	    exec_queue_killed_or_banned_or_wedged(q))
> +		return 0;
> +
> +	msg = kmalloc(sizeof(*msg), GFP_KERNEL);
> +	if (!msg)
> +		return -ENOMEM;
> +
> +	q->multi_queue.priority = priority;
> +	guc_exec_queue_add_msg(q, msg, SET_MULTI_QUEUE_PRIORITY);
> +
> +	return 0;
> +}
> +
>  static int guc_exec_queue_suspend(struct xe_exec_queue *q)
>  {
>  	struct xe_gpu_scheduler *sched = &q->guc->sched;
> @@ -2101,6 +2147,7 @@ static const struct xe_exec_queue_ops guc_exec_queue_ops = {
>  	.set_priority = guc_exec_queue_set_priority,
>  	.set_timeslice = guc_exec_queue_set_timeslice,
>  	.set_preempt_timeout = guc_exec_queue_set_preempt_timeout,
> +	.set_multi_queue_priority = guc_exec_queue_set_multi_queue_priority,
>  	.suspend = guc_exec_queue_suspend,
>  	.suspend_wait = guc_exec_queue_suspend_wait,
>  	.resume = guc_exec_queue_resume,
> -- 
> 2.43.0
> 
