Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F675C27C65
	for <intel-xe@archiver.kernel.org>; Tue, 11 Jun 2024 17:04:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1451810E6E6;
	Tue, 11 Jun 2024 17:04:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qc+gXRn4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E8CA10E6E6
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Jun 2024 17:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718125496; x=1749661496;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=vxaUr0GoB3gfWeuLy0LuDgbv8r5YNUMlryQbJnPrAKA=;
 b=Qc+gXRn4vj56ox7CQ7B/mYclNnIfQBzL0wa4gOh7P8YJk2xOytFgqSRE
 8Co5Xl2plpx1Jy90cP8JhI7hJLE+4jbskSRH4T3Vv4BuED18VwBg2MeuL
 tKkj6MbrjEmR6ruib9PsGOPT+COgUZrCiXkjW6evuRExiM4DjEi55Umdk
 w/14RimdAb5xVXKYUSjWaMOlzALc9n0T3VKKs82OOCYO2SXdh8szqmZQ6
 zWbFaaeirA1vjdSL9fMaLcJFr2HnkBAMJTqApfmvB5iCfUHbqwM4+mGS0
 QWXH4qYn4lEWul99Xy2ToLB/KQt4t5gAYb4tNCvc24mKMokp3VN8ZP+2u g==;
X-CSE-ConnectionGUID: mLSX7g7ARQm5HZCPg9uUmg==
X-CSE-MsgGUID: wW+Kyxs9QUmugwBrQE52iQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="15077679"
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="15077679"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 10:04:55 -0700
X-CSE-ConnectionGUID: /r7IYgQoRsOaX9bJ2j/iUg==
X-CSE-MsgGUID: obGqRn9CTnKcYspdTgx9zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="70302419"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Jun 2024 10:04:56 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 11 Jun 2024 10:04:54 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 11 Jun 2024 10:04:54 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 11 Jun 2024 10:04:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cShoo8JPAXaptC3RQEJVM9A1aJcP2WqUEZjx5apE86x329TVLR8xueXFh8eosjdt8pMQ/JZ3zSARitWKpgG20BY8Qoe2hg50oLh+gy0LduF6V4f551kdJQg4Xotbe816JxLHr95iroxt3bgoKWF09TsIbUxUlGekCaSMJL0HdYU4IhPXrW2fjg1RFwIiyuPEfyHAihhacL0m3xSZCv9yQi951LdQBj5prNwvmB4lcOy/ncoXT7wXGkxU7ex40bFNh9l6hjVX0JwYfocnss/8/ppk4vYDFgieEO79dvwKdSFKyUy08rh1+bD1aCQ+zUo7f7KNVWiIHqe1ileuVYRfcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IkarPu9uvQWYch/7cRiheLCQFefNl7sPwBsvKE1s1l0=;
 b=BH4xQ2E+38xOQ50dzwZslbLcUtI5i+j1kpfs6YZ4Nl2SHm1oxab40aLr2ywOJn5dWPHICC8fjg8FGGWMqFQmxvJJTVl82GAubTPU6ItEQJE2812AU3Rwid9OCSYo7aObLLL4Cdpl7c5OaZqXBKVv6/SVlJX04JA5oNjoJVkUd2fV+3297V7JKjIHceBpE0LlX7JLAiN2YYALXmTK0pzO2CuLYh/hdRBcqLNP+sujkH3ShcbeGAxEZYxFgMDmWpGev5Eed4AqIblpO3k4n9bizkQOskhXeYtU5uzhTARICtuBmo5lthum4nWyQHYIpC0P6/DlrW3Y9AD9KuCTo1+FIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by SN7PR11MB7114.namprd11.prod.outlook.com (2603:10b6:806:299::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.28; Tue, 11 Jun
 2024 17:04:52 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7633.037; Tue, 11 Jun 2024
 17:04:51 +0000
Date: Tue, 11 Jun 2024 13:04:47 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 3/5] drm/xe: Include additional info on failed
 force-wake operation
Message-ID: <ZmiDr5oOi-l_9V6R@intel.com>
References: <20240611163537.1944-1-michal.wajdeczko@intel.com>
 <20240611163537.1944-4-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240611163537.1944-4-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR13CA0201.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::26) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|SN7PR11MB7114:EE_
X-MS-Office365-Filtering-Correlation-Id: 26f03bb5-2098-41e3-bab0-08dc8a389bbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230032|376006|366008|1800799016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NZOBphdxLCx/oXb47RfrilirU5rte9jcWhMNTEN8kF+t0MO+krczW+jl6VbG?=
 =?us-ascii?Q?3lFO5PR0SIWWddB47Ca69fSjURMES5NfQzPdx7+w87d0yek1sUjnbUgbMOeU?=
 =?us-ascii?Q?sESyYL0XaYPpEw2Krpmo7yD0JfzJ+yMby87i1f883hvLNTGJHELhTSMEmkii?=
 =?us-ascii?Q?iQkn01P4Jm66K9WeGPADVc2YecIMKOW3SZR6g935LwEAe7xzwJt6IELcQ/1Z?=
 =?us-ascii?Q?ZclWvAE+o9IFiJnn8BaJUWdHlX3r9117hdaULN93CESVE4C9qGZPbx7NWo1d?=
 =?us-ascii?Q?rkTPiiyljsIYkv8IOxL0/C65Tq0UL7CEbRx0G5pa1aZhY0E93dGch7kxSsLi?=
 =?us-ascii?Q?9Jrk6vEajUkXj1xDm+J4CS+PX3Zh3vJFD6jKEyy7yLlMnUKT/D2I3ErhsWle?=
 =?us-ascii?Q?iV3Lmp5qcT/wRwN3V4hUe/witno4IvbXMNOD1XaiQvIvjM110VrOFKd2OhfI?=
 =?us-ascii?Q?NG9HnKmgftm//g7lijckydoY5c0Ebcr23Lx+KU8ckrASdXJM3+cYZBEkOhYk?=
 =?us-ascii?Q?uQeac8ESUawRNee2esHDPteJfob+4omni7lNw5WgY8D/r8Bw9+3B2xQGL2Kq?=
 =?us-ascii?Q?52Q2y6RKH47oSmsrJjVYxVc9acGHrMUCl4zB+SW2fQ7zQ6sixUelsfYcfpOe?=
 =?us-ascii?Q?jG4aSqtPIlW4QTimYt8F56mT5WA6169zw8NhLCSWcierUnmj8zFscxJUyizx?=
 =?us-ascii?Q?L8CyIu5YqX6hO5y6c1FcbHYEMRZPchYu0t85E8o8NSUmx7UC2mzR2Fz7RcuE?=
 =?us-ascii?Q?YuBQd494wl+2Fn7tuHT2zNfFdxExXfIKnFQVR2WXPzEOa3TFakaknGE9duw6?=
 =?us-ascii?Q?PV8MEcDB8v4aDXHab67fdh3gmmExgDxqqCPjW7uT1xWIrnJ8rF+fDaWccNLz?=
 =?us-ascii?Q?nfd+zKWI0rxQ6RbHn27aM/VuPgxOnik+kNHMgO1Hycep7NLKXYUdHJLzPByU?=
 =?us-ascii?Q?XZWdYTg8Xy2ge4QW8ABcOWO4fwWkJj3jylDI6+pwSqqW9y2RNMmCSAjBB2R/?=
 =?us-ascii?Q?VvCrBfc3PMCGfDOlymGciZKnSk6mkSNXoBx7Af1grSHWo0xpv2YVne6+PDe1?=
 =?us-ascii?Q?kq2t9MB6jVE7X544jQSrsTCtQtBrZynaesu0Q3RkzU6zTB7oZREGDUoXoxc8?=
 =?us-ascii?Q?2spGePivyGnMmnHUroxVhqxYI8tvhqtBvVz2OZBvJ4czJg1q6xQ9Joa3la/D?=
 =?us-ascii?Q?jp9dqCItDwV3oDwWVjRnPyJz8aZvHkBlkMFVoZWESUpNyJrnXuw2pLwBJCu4?=
 =?us-ascii?Q?Ho/YFUn98SI8IxKxpBm/eNHRM1n9wCzloeM1bqj6GEKOlAW+PMulys4C1pVO?=
 =?us-ascii?Q?Quk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230032)(376006)(366008)(1800799016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KdQQvLWXDS3HJLcs6ltvdturGeoj2AdiE+CHkEJaRp+HT+1EpxHXkwPSYzwB?=
 =?us-ascii?Q?SX4oMMyh2haEWBpU1L2dcmYLvRBXO1x/XiIPGSaFiqBh8A1NKCsd5d0aZ9Fd?=
 =?us-ascii?Q?9YbNeGAtlLFHWzCnI/OGU9ArKk8mJ2VVFo5fBe9hmKadBM6kBegz+oQ+v9DB?=
 =?us-ascii?Q?251jE/F+G8apj9GmwiyxA1m7nIrAqz+KNQsYRkAHjRVXuuvJE3UQKh+5cFV1?=
 =?us-ascii?Q?zfcDiKBFHrJ8nc6M5mTVCoVHVlfbsArKxcq8lJKUtqRwhmjQV6LdQSV67tzf?=
 =?us-ascii?Q?EzZvyyk1MWVfCG0ytJYtTknSTNT7wy79AsBSAEKF3uyvUPghsYDbUzLugsQH?=
 =?us-ascii?Q?5zaUn8b71PDN/8d+Bdq8hBcYO0xQonXdftA6h5HfREcTER8BLhYbQdyYBnTP?=
 =?us-ascii?Q?ImyGm64WvEogg716lIPwuDhpiflvx/oAkdvPVCLjdwj9CPUj3aQx7NX4ybup?=
 =?us-ascii?Q?hJdvqskv4A2qf0/7Quw0LjkGO9mulx0e16vzL0NS+D/o/A0CO3rZU3YhIqTO?=
 =?us-ascii?Q?v7n3+DUmY3FBg+HYLy6Ynfe9gOzHlXFodsxRkhDEgimntDrOM5p4NRDZ0G5L?=
 =?us-ascii?Q?ePuI8N0AvRcw0eUCOEKsLCQqbvM4lF67Rx+yoeHfli7eRueeGxez0P2HUu0v?=
 =?us-ascii?Q?JXD8O0+F865V9Y94CbWYYbLwcgp8WBCOmaFYohnvIuHqNAoUeC4/4QNacQY5?=
 =?us-ascii?Q?wN1M1UTWO5ighgdu92HmuyUw2dxw+YuKZbaxcsNLFh4eGhXUy3aSzhKZ9ouy?=
 =?us-ascii?Q?5ek2me1serAXPa05TQ0sJwuMtGhYZyHEhDofZPmVNn6lNUV7OveBFV/SOmJc?=
 =?us-ascii?Q?vF3g0jQolUjNwkVuM3zsWIWsYf0vW1nw5oehqu1/+ngDCWAH3N6ZQt970NFc?=
 =?us-ascii?Q?ViYTQChxEqqbCgw68s462v7wyuMNYGkHEtM9B4WqpDwYfb4N7430oxBi51/E?=
 =?us-ascii?Q?gPxTU0utRspj9rOrCd3o2U7KM/UbOPZY9Nemz3r6vjDeGg4mpGCYW4CCRMDS?=
 =?us-ascii?Q?PJjXK+v6VteJr+8mOlDhysnotzXvPWNKYhsHZ+ztIUdvx9nlOt5mg/RJ9w0u?=
 =?us-ascii?Q?ljEEKCsyn/mbTlz6bP/0T14Nl+IDZvPmcrMAaJmG8egNFyCgXVMa4Xxjbka+?=
 =?us-ascii?Q?I3X/0GtmCfmV37twOtTTxXVYgGljfl49V6Wb1+PmxxikevMx0ewF44/3mjVG?=
 =?us-ascii?Q?KhM2SjRJS045j8hLtn0hWyd8qFFzcXwS8499ppsKJ2DnDrj2y8Ty6lr6Qk/r?=
 =?us-ascii?Q?cjMCmRqaicWM+QBM5GxDisoJcAkzUL6WuDgntRamWgMGC4GLP7in1bD9MS7D?=
 =?us-ascii?Q?Ml4/siya/jbfQ1A1rb/O1Ej+6oyDDkGH09pIx94PTySKXDWyGIe5tBBXuJK6?=
 =?us-ascii?Q?Bmboz4CQOXkRQmW9Q+hE0RgDVob0BTHPh44DkX9NFI9+w1o0+Bl+9/Mub2nR?=
 =?us-ascii?Q?LyX4N2pBzLYQRtwtcpaD7lT0XkON1ETdwcVrDholtdaMlLSz7SeVjCJrGnwq?=
 =?us-ascii?Q?gtsXy4bwRvmeOocLlTrKPFbJfQ5IonXQBjUTBeacQ60b0vC2Z/Nnh0pe4BvC?=
 =?us-ascii?Q?jJmCyXQQfhSNR0WdZ9AMffoSi0ZODHxCj+H787gz?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 26f03bb5-2098-41e3-bab0-08dc8a389bbd
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2024 17:04:51.7524 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fakedvst7gkmcTdOPTw1hcJwc7uAUWEh4YKTvbFG34XIJx8m/f9bbcCXMPTI6ucMkydG63a+aTX+s1dpII/LZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7114
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

On Tue, Jun 11, 2024 at 06:35:35PM +0200, Michal Wajdeczko wrote:
> For debug purposes it might be useful to look at the values of the
> force-wake ack registers in case wake/sleep operations failures.
> 
> Move xe_gt_notice() from the caller to the helper function, where
> we have the latest value of force-wake ack register available.
> 

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
> v2: remove ret2 (Rodrigo)
> ---
>  drivers/gpu/drm/xe/xe_force_wake.c | 48 +++++++++++++++++-------------
>  1 file changed, 28 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
> index 8799a2544648..afbca81c12dd 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake.c
> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
> @@ -97,9 +97,17 @@ static void domain_wake(struct xe_gt *gt, struct xe_force_wake_domain *domain)
>  static int domain_wake_wait(struct xe_gt *gt,
>  			    struct xe_force_wake_domain *domain)
>  {
> -	return xe_mmio_wait32(gt, domain->reg_ack, domain->val, domain->val,
> -			      XE_FORCE_WAKE_ACK_TIMEOUT_MS * USEC_PER_MSEC,
> -			      NULL, true);
> +	u32 value;
> +	int ret;
> +
> +	ret = xe_mmio_wait32(gt, domain->reg_ack, domain->val, domain->val,
> +			     XE_FORCE_WAKE_ACK_TIMEOUT_MS * USEC_PER_MSEC,
> +			     &value, true);
> +	if (ret)
> +		xe_gt_notice(gt, "Force wake domain %d failed to ack wake (%pe) reg[%#x] = %#x\n",
> +			     domain->id, ERR_PTR(ret), domain->reg_ack.addr, value);
> +
> +	return ret;
>  }
>  
>  static void domain_sleep(struct xe_gt *gt, struct xe_force_wake_domain *domain)
> @@ -110,9 +118,17 @@ static void domain_sleep(struct xe_gt *gt, struct xe_force_wake_domain *domain)
>  static int domain_sleep_wait(struct xe_gt *gt,
>  			     struct xe_force_wake_domain *domain)
>  {
> -	return xe_mmio_wait32(gt, domain->reg_ack, domain->val, 0,
> -			      XE_FORCE_WAKE_ACK_TIMEOUT_MS * USEC_PER_MSEC,
> -			      NULL, true);
> +	u32 value;
> +	int ret;
> +
> +	ret = xe_mmio_wait32(gt, domain->reg_ack, domain->val, 0,
> +			     XE_FORCE_WAKE_ACK_TIMEOUT_MS * USEC_PER_MSEC,
> +			     &value, true);
> +	if (ret)
> +		xe_gt_notice(gt, "Force wake domain %d failed to ack sleep (%pe) reg[%#x] = %#x\n",
> +			     domain->id, ERR_PTR(ret), domain->reg_ack.addr, value);
> +
> +	return ret;
>  }
>  
>  #define for_each_fw_domain_masked(domain__, mask__, fw__, tmp__) \
> @@ -128,7 +144,7 @@ int xe_force_wake_get(struct xe_force_wake *fw,
>  	struct xe_force_wake_domain *domain;
>  	enum xe_force_wake_domains tmp, woken = 0;
>  	unsigned long flags;
> -	int ret, ret2 = 0;
> +	int ret = 0;
>  
>  	spin_lock_irqsave(&fw->lock, flags);
>  	for_each_fw_domain_masked(domain, domains, fw, tmp) {
> @@ -138,16 +154,12 @@ int xe_force_wake_get(struct xe_force_wake *fw,
>  		}
>  	}
>  	for_each_fw_domain_masked(domain, woken, fw, tmp) {
> -		ret = domain_wake_wait(gt, domain);
> -		ret2 |= ret;
> -		if (ret)
> -			xe_gt_notice(gt, "Force wake domain (%d) failed to ack wake, ret=%d\n",
> -				     domain->id, ret);
> +		ret |= domain_wake_wait(gt, domain);
>  	}
>  	fw->awake_domains |= woken;
>  	spin_unlock_irqrestore(&fw->lock, flags);
>  
> -	return ret2;
> +	return ret;
>  }
>  
>  int xe_force_wake_put(struct xe_force_wake *fw,
> @@ -157,7 +169,7 @@ int xe_force_wake_put(struct xe_force_wake *fw,
>  	struct xe_force_wake_domain *domain;
>  	enum xe_force_wake_domains tmp, sleep = 0;
>  	unsigned long flags;
> -	int ret, ret2 = 0;
> +	int ret = 0;
>  
>  	spin_lock_irqsave(&fw->lock, flags);
>  	for_each_fw_domain_masked(domain, domains, fw, tmp) {
> @@ -167,14 +179,10 @@ int xe_force_wake_put(struct xe_force_wake *fw,
>  		}
>  	}
>  	for_each_fw_domain_masked(domain, sleep, fw, tmp) {
> -		ret = domain_sleep_wait(gt, domain);
> -		ret2 |= ret;
> -		if (ret)
> -			xe_gt_notice(gt, "Force wake domain (%d) failed to ack sleep, ret=%d\n",
> -				     domain->id, ret);
> +		ret |= domain_sleep_wait(gt, domain);
>  	}
>  	fw->awake_domains &= ~sleep;
>  	spin_unlock_irqrestore(&fw->lock, flags);
>  
> -	return ret2;
> +	return ret;
>  }
> -- 
> 2.43.0
> 
