Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18AB9C3ABCB
	for <intel-xe@archiver.kernel.org>; Mon, 12 May 2025 21:30:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5ACE10E072;
	Mon, 12 May 2025 21:30:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="COhxLWZ/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21CDA10E072
 for <intel-xe@lists.freedesktop.org>; Mon, 12 May 2025 21:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747085437; x=1778621437;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=jN9bFWqXjAwTIgaDy+wjdYQhYXuZTx/dRfsdWYWbxyA=;
 b=COhxLWZ/TJwZKO6lgCjkg1tEhSw0VzDnNlZy4LXSfNcQVdHI2/uObn9s
 1EIKAtGXz0KO4TkhrqqQWv97hUSgrQ+HLC/sx55nPnKZE7iKjuttNJTTI
 IFZa+UxfYS9BE8/LaK+U3hPp8P0laBZSkmhlRVs9+1MotdrFwkm65dnXi
 pXDKR+CqYUO8Cxn3sChkXF4wFejMZ29uCnsKvT03MJJEds5AoCGquo8g5
 NRO8JNo/CyOQimTzUuSMbYxpQqFnGEzriVsIDFOU6xJh3NAwWgOm3DNcT
 LdrAnWMHl+xrP+WriGy5JubmzXPSp7VxZq8S4bnwY1ig39eLKIXq3wJQj g==;
X-CSE-ConnectionGUID: 3Puz5/R8SGye8Hc3jUGWIA==
X-CSE-MsgGUID: zuyB34SwQdO7SNgskrQIXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="36526850"
X-IronPort-AV: E=Sophos;i="6.15,283,1739865600"; d="scan'208";a="36526850"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 14:23:21 -0700
X-CSE-ConnectionGUID: hNhGXxmqSDin5fFvL3SPlQ==
X-CSE-MsgGUID: xlH6uqmcRY6pLpWd/7jvCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,283,1739865600"; d="scan'208";a="137417420"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 14:23:21 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 12 May 2025 14:23:20 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 12 May 2025 14:23:20 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.48) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 12 May 2025 14:23:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MRRz+5X9dqcZsAGmNznJUVvVew5WqoyIWiNkeDN9OQ5JGHzDzzaEhA7mKoeadCni2gfYrDPVcNbZiQJtnUI0k+1GW1dZZ9LpRhTxJqj+lE2bc1t1tIOdryNzC9VHb1ivgxqWcouK4HW7mSCxISiXM6P1E745Jyf5vY28e3d91l91xRzjlE3PT7Mr5lerNYqXK/B9R9vf95vNAhTpu9EcP5wF1KzWWUouJZgyLcq+x1tMRD/u+QZuCGtZEmhCMd80RvzyCSdfBqwCJNuPsuudeK1ArmQ79SpCDinQo7JbQaHJZMDErq4suePMtVjaqZNf5P8p3HWSCM+o8V/3L6PLHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q4P5ITKXP2oi+1hcd4m51QQbrWD2CQ9N4Wt/9h5o6dQ=;
 b=mrBkNOhRHjzV46tgbMSH4b2Uy/xnI5464l35qxXwiGhA4RaaEO+w7BhW4IVDQ9A9y1XLTzh07ace4yFRrvNc7SlMxl51y+5gSSmy03pphhfCCH4sxyACt3cU7XQ8pBynl95oXbFG/OW5g5YylQGPvOMkUxaytK+QNId9JYe7QLPJR+iCQMgjXmBD+8cOJa3YzM1EfdAzc/4DMRRTrFd66ANaoruwEtA6mIeBcGjUdN8hm6zvYrVpm6g+rvsmZZMUuOyjditnxa1z9riF2B99PXP6Q/Rw+cpk/TFZcgfR75bc+n8zyUcInHrKKuMlN/JqsEvtp62bih/NfArA6ai0lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW4PR11MB6838.namprd11.prod.outlook.com (2603:10b6:303:213::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Mon, 12 May
 2025 21:23:17 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8699.026; Mon, 12 May 2025
 21:23:17 +0000
Date: Mon, 12 May 2025 14:24:44 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v7 17/20] drm/gpusvm: Introduce
 drm_gpusvm_find_vma_start() function
Message-ID: <aCJnHFgCmssQ49s6@lstrano-desk.jf.intel.com>
References: <20250512164740.466852-1-himal.prasad.ghimiray@intel.com>
 <20250512164740.466852-18-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250512164740.466852-18-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4PR04CA0126.namprd04.prod.outlook.com
 (2603:10b6:303:84::11) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW4PR11MB6838:EE_
X-MS-Office365-Filtering-Correlation-Id: 397d854f-da5e-487d-96d0-08dd919b3672
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?q+b1H1HeabOo75GkAU6DMVQUJGOyhu3BZNwBN93sH4yCD5XiQPzG2rdM5Yyn?=
 =?us-ascii?Q?XOecfpkOPqwbFg524+WGI8BqrFlM57dR/ZIKaZ6p4xruw3JYpWU+z7SwcXCm?=
 =?us-ascii?Q?cNwuKoK2RLPxrBkSDX1T81RlaOCDpySxCx7uiAK2+okaKU4PkPOz6u+2liyw?=
 =?us-ascii?Q?x7RaCbwNJaPAwT7RzMEW+RKB1eFVAxoVZxkA48eqX+OB7BXGKeZQwocuscd8?=
 =?us-ascii?Q?SrhchS5X67q9LbT58yJP4PhgVLyM9TT1IoGyReqY1BuFeguE8IK3Q0fWusCF?=
 =?us-ascii?Q?mxF2KB1oSbKH47iryr/wyAysFMuKg3uKk9xCKp5pWMjfI7RNto7L2W2drvfR?=
 =?us-ascii?Q?yfwWLQUnbqIsklE7W5hW8iaJGUwMsy+EEvms6r0NSWzLDvQWOG2QGiT3kdTV?=
 =?us-ascii?Q?Sv7GVtM1U27F7okDqc3EpgrN2nyh0yX0CwsOpgMbuw214OrRf3p4+DuBXfBP?=
 =?us-ascii?Q?IRAMxDphm6IZwaIGtNY1NOfobNUBw+hksb4lhpE/Ic7evN9GqYc1xRgYUpWA?=
 =?us-ascii?Q?zMVH4r9QmOtD2QeuCsPart7hbKBiCw9Yg1R/jON9ZAVLG29ScMCWT0W3m5Rj?=
 =?us-ascii?Q?EMwhQ2g1JoEGvMsYOroCWQySgsXGi6ne1rmBtr128XOrs5s7xC0Y2CrMQftq?=
 =?us-ascii?Q?xGUYAkhGPwNZZKX1Zvte75vnbdksVCJyfoc086BJGw9qomF9f/tiNaeaVSgC?=
 =?us-ascii?Q?wvbgka+jOEnqcCdbKUFPcxhasW26+oXyzKMRUL+uso+xNVY1J7jT6rkk83R+?=
 =?us-ascii?Q?sBwvTPfs1xmjTZIfrHMdS7679VPI0oG+0HoStq1LkwMVSCSQepwxnkB9NJm2?=
 =?us-ascii?Q?Ylwl3xg6ftDQKzwSvS+m8Sd+1Za9wp/NQ64I7MPnq2G/Btp0rH1MdAbkUGR2?=
 =?us-ascii?Q?lej6ynd+NdE3EuxHdVzePjYe1NrrkoUxdeWlHYpEX+IlUfpMhZ1R3xAKE2UG?=
 =?us-ascii?Q?eq/XMLQYyYmVVvLG9kVbprFAlxaAsWp/z7MhnQ1jAhsaELehCQ8EWieIYzNe?=
 =?us-ascii?Q?ndTKsIdSIs1hfpL6wLSDpm18rrO2ZvtT0+FRVJy15h797lUWELrOedaROP4d?=
 =?us-ascii?Q?7ShEeWGl1j2fC8W+T5BTYbhhYsQ4TcxuE4b4tourXB68MGwPkn8Ozwlxu/MU?=
 =?us-ascii?Q?4v2xw59se56D0iOnnHh+BMwaUbGkDD/+Xp0BpxEyJ5+Tj0l5WKVYJis4a73D?=
 =?us-ascii?Q?3SO3bwGtt+ZbE6pk1ymA/IPWGV291h3iMeAEtTlWLk7//pGr5waWvD9tfNLk?=
 =?us-ascii?Q?LUiqkMtc52+zKaQJbOeYgG1VQQt6ORnEswj0Oz99ylTX9OgSmnPjoWL+Vb+h?=
 =?us-ascii?Q?hclD9u9mv1XiZgRTm/6nqkE8bSMPDx+tyAbmop50NvcEUrkAcaVZp53XrDn9?=
 =?us-ascii?Q?4xNzJ3caoyu7vK0mFlEAvO19WNCyrU8miLzINcGP7lkeKPyg5HAGsswxC9wa?=
 =?us-ascii?Q?FkCuIH9UyA8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?97QlFIYR8SKWrh008fzXOyrbBZZWeQKpxTV3fuYh1n85TTgth0iRPMw0j7UO?=
 =?us-ascii?Q?J2mCVlT+uLX7ulstjEj+pHsp3jS5MDeWk62E3Z4rVc+4vgaoJBUmgXM0TZz1?=
 =?us-ascii?Q?om4LB1GmJ798wdilX7LBfktjKGeq/iaVMBwN/CvoWXhYbhnMwe8ntXVzQSQ+?=
 =?us-ascii?Q?w6qAhtXKcAN+RPwFrajkD7FQcCIXIo1R7XuaAcs77BnJ2Kz7cIg91c08MBZ5?=
 =?us-ascii?Q?aaKB+e7E1Of63uUPT5mKSjbSyAVr9byQIcjzaKS/KXZB9dfxOzMsBnzVLALg?=
 =?us-ascii?Q?MUR6pk9jh8SxJxnTXu7WcDXPZMWCtbDvcEXdZtgGAAzKtaZOfsD2JkefigmU?=
 =?us-ascii?Q?aMUS9EycfSxg3p7KfIc1rfMuDMrSVk4SDlQRqjyiymMfruH88RGzYfD05IhP?=
 =?us-ascii?Q?x4L75YkC4jeyUD/qHMGKD3+PztM+vF4rG2R3qV796XCU5/yXDcnmBmNYrUvk?=
 =?us-ascii?Q?0LF/7Izb4oebdRCJB1M6HgSszvhT9GUnfPSQWBWB7dACdW5nFRBXzIx/7lqU?=
 =?us-ascii?Q?lpotQ8c0rC+nb/x+qj1RCwmZQ6+2GhCDvsvG3GJYawYEz4ZQpyLzgazCoLkU?=
 =?us-ascii?Q?KqhZwNuzys99E2wzPql9nCCl4gurGzhaxsgQSNJF2tBqImeYohMTdYelX6dr?=
 =?us-ascii?Q?Aqu6Hy3oYi7A6lk7Qz3lMBQyfT/AVToeB8cvKXGcuDrqlZP4bQDaQYknyyOT?=
 =?us-ascii?Q?OafqFJbhIwpf2vwaa8xmddjaCZruk+k+GWlP8yCLkEenvQO7sgd42eF9x/QO?=
 =?us-ascii?Q?gDKQhxfCaL5bUimUN1d7T4m5yqQB7VBKBtJai/j9xqbRLipbhEtvSmWba482?=
 =?us-ascii?Q?Q0egiapL7k1rFnT1Abao80rBploIPSPfjRzbI/WF+O4OBDyi4Ktimto4J7Cn?=
 =?us-ascii?Q?Mzl0G5QJJvQNEO5y7ad9h7bUa8J7aboYAu9i5o8a4jJ+JFMA9ryQKNjrT8p2?=
 =?us-ascii?Q?ykW4wBLHrsMFSodamXM6OJ4dDeSHci/clR06d1EpVcLdBD5FfRDLsvP1vt1F?=
 =?us-ascii?Q?cEeWH2FFm+y33krhQcTYpoh4p2CId1WHjWJO6RfzbK8U5Hjc7iW1XWTF0nXQ?=
 =?us-ascii?Q?1wW/jSyDIr3k7bg5Wc8qTx9InLthnVLKYcmCI4K3Poy6AqKpqVaiuJTPHWAS?=
 =?us-ascii?Q?gauy/8OLOM3gjDtC9z55phvH4pIR4zQ00v6QieybPMvqsQsHsQcFoal9YYxO?=
 =?us-ascii?Q?FNIq9jRu4UXrrM15SWF6pO9M9/kQ8HvZdfLElTcWWohyANNaJBPxDkYzt3Eo?=
 =?us-ascii?Q?gNqwoNYQ424I41HsxqE0i4//Yhtaa9g6KTOSm07Dwg0IBo5UxUyv5BV1tktT?=
 =?us-ascii?Q?yf1OruIiBsvFFneqj+u6iZH59YykTaUK1sBDXrt+Sp/aSmSBnILXG99eezH+?=
 =?us-ascii?Q?2ydpbbkf4+TVTdXXm678bmHbvpcBQMIfmhfGDuWVUtB6K0zsxPhcefmY7ng1?=
 =?us-ascii?Q?TAteaIWmVDwa7C+ikky2gVjW90TC/kMufL3rbqPHrZI7bw9WyJMHTaCW0HWR?=
 =?us-ascii?Q?Y6XWHwrxH0eEAjePrAzWD5cYsm9Z7LYDMg1qU2o54OY53UIbABywym4ZX1Yq?=
 =?us-ascii?Q?V6rcnuzyKIM0ms49/khJFE5C/O/lRD8reyyUEEzB3qaKGEjtyASuHH6YRW7B?=
 =?us-ascii?Q?Rg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 397d854f-da5e-487d-96d0-08dd919b3672
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 21:23:17.7508 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5QSkRdRXNSvpylgBZD9oKSxLmsYvQ/xh965C59xU2qReo1M++EMpoEwYNRRPPMZpmH9b7FIpMzjpU4B/NtVwIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6838
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

On Mon, May 12, 2025 at 10:17:37PM +0530, Himal Prasad Ghimiray wrote:
> The drm_gpusvm_find_vma_start() function is used to determine the starting
> address of a CPU VMA within a specified user range. If the range does not
> contain any VMA, the function returns ULONG_MAX.
> 
> v2
> - Rename function as drm_gpusvm_find_vma_start() (Matthew Brost)
> - mmget/mmput
> 
> v3
> - s/mmget/mmget_not_zero/
> 
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/drm_gpusvm.c | 34 ++++++++++++++++++++++++++++++++++
>  include/drm/drm_gpusvm.h     |  5 +++++
>  2 files changed, 39 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
> index 4b2f32889f00..7bb9eb71c9aa 100644
> --- a/drivers/gpu/drm/drm_gpusvm.c
> +++ b/drivers/gpu/drm/drm_gpusvm.c
> @@ -980,6 +980,40 @@ static void drm_gpusvm_driver_lock_held(struct drm_gpusvm *gpusvm)
>  }
>  #endif
>  
> +/**
> + * drm_gpusvm_find_vma_start() - Find start address for first VMA in range
> + * @gpusvm: Pointer to the GPU SVM structure
> + * @start: The inclusive start user address.
> + * @end: The exclusive end user address.
> + *
> + * Returns: The start address of first VMA within the provided range,
> + * ULONG_MAX otherwise. Assumes start_addr < end_addr.
> + */
> +unsigned long
> +drm_gpusvm_find_vma_start(struct drm_gpusvm *gpusvm,
> +			  unsigned long start,
> +			  unsigned long end)
> +{
> +	struct mm_struct *mm = gpusvm->mm;
> +	struct vm_area_struct *vma;
> +	unsigned long addr = ULONG_MAX;
> +
> +	if (!mmget_not_zero(mm))
> +		return addr;
> +
> +	mmap_read_lock(mm);
> +
> +	vma = find_vma_intersection(mm, start, end);
> +	if (vma)
> +		addr =  vma->vm_start;
> +
> +	mmap_read_unlock(mm);
> +	mmput(mm);
> +
> +	return addr;
> +}
> +EXPORT_SYMBOL_GPL(drm_gpusvm_find_vma_start);
> +
>  /**
>   * drm_gpusvm_range_find_or_insert() - Find or insert GPU SVM range
>   * @gpusvm: Pointer to the GPU SVM structure
> diff --git a/include/drm/drm_gpusvm.h b/include/drm/drm_gpusvm.h
> index eaf704d3d05e..6a5156476bf4 100644
> --- a/include/drm/drm_gpusvm.h
> +++ b/include/drm/drm_gpusvm.h
> @@ -327,6 +327,11 @@ void drm_gpusvm_fini(struct drm_gpusvm *gpusvm);
>  
>  void drm_gpusvm_free(struct drm_gpusvm *gpusvm);
>  
> +unsigned long
> +drm_gpusvm_find_vma_start(struct drm_gpusvm *gpusvm,
> +			  unsigned long start,
> +			  unsigned long end);
> +
>  struct drm_gpusvm_range *
>  drm_gpusvm_range_find_or_insert(struct drm_gpusvm *gpusvm,
>  				unsigned long fault_addr,
> -- 
> 2.34.1
> 
