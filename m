Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A863AD6AB1A
	for <intel-xe@archiver.kernel.org>; Fri,  3 Apr 2026 01:01:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 301A910F426;
	Fri,  3 Apr 2026 01:01:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gyx9VdBJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F59D10F50E
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Apr 2026 01:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775178093; x=1806714093;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=HVQVn3HbQyO4IihOI3aUA6WUir/t5Ce5zYmEZ00kn7o=;
 b=gyx9VdBJAVg+f6f7TXprBgp9uj1HLWgX7iT7EXbQtBLEt+aI4CyoKJC7
 F1gI691anr3WlpyXjtQ6vQofYag1yjOxR6lLsWeSvCcqTpo3WX+epS8mf
 n1sQlMrItqcMwCVgAXgbLLQdk+DwZblRN2JR2gC8GZjhTTWnuBVmmkqhO
 vJyiKwwRqHEWthbtCtk2QZ6gEA+KpmQvkjFVYjvcsCkDy99xdnUWcscE1
 WVmmZbasPAr43oQa4XwRCieDZZAgDb3Mp63qxfX+LdmZ0N7WDCb3Wd8OF
 npZqyCHmFe0jhSwaelk+P9xL4LWbhCnDXDum6EMi9WbKgvgaRzMp83leW w==;
X-CSE-ConnectionGUID: /8nSb4KjRXGS0hazXCktXw==
X-CSE-MsgGUID: dZYe7S+cQtu+FVnfdWREsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="76261222"
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="76261222"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 18:01:32 -0700
X-CSE-ConnectionGUID: DIVzoqheQ+yg+7BpzNdtaQ==
X-CSE-MsgGUID: Jxb6YoDMS+mh99uleGdbUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="226998670"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 18:01:32 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 2 Apr 2026 18:01:30 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 2 Apr 2026 18:01:30 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.23)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 2 Apr 2026 18:01:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gMsWrlCxUozq4PrhsjzUMqs34LU65zh7c8PmQVbGSpamkV+wzYX5h0uCm1lNROrQsKyHMRwjOqCONdesdA77aXxa0/cttZVHu2hsDAQIBCC1fSTHnQqCcjvB1QFVuo/XTgellA25000zmBj7mFbbTLTBJExbt5/K/jKVLT265jir8ntH0F+IxTe4lwoceNwF5LyNEcPH51DL0GLX9sTo+UMLJjOJvhSGzfgoW/3JxpKYuqZaKptZkFVmlfNI/Ih6txgeKgleQHe/EbJhenW3JjWJvVWsLeuD3+69NWWwVr704t+bAKEwNgBFW7LPDShcuHT/lMabLh3nnRs4DOCefA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l1OlLtQ5G1xwXARJp7QIIcwKflY6QJ6QyRsjXU0nSNk=;
 b=CvbJJD/87uymm0MWqMF6dYxCzIj/hFDFoQ+gmbYTjGcHuDTjiNUpDEcBST515Bb3FxyvvQeL1j2SX3+pJ0EU1HQq/Kil5tZPc0QDao892YSJA+M/Bgd3cFvDoy8vhDfqZe1FLxwLyczb/dYR/qlCupTxQ/LUMZ02jXeGTH4Q92M/RZMu52tK4t+N4l+Y65TeTbYKOGYkdI5+h2nqx6+XULyTdMa96uKaoA0zxzgMeOX3vO9/JiAij86noTd4bVEVVFp/yY5JSGXlPQDz/jk8UNlfXbCFIuB4BGVSsPiocy5ul2tzgOT+aHC6eyUka731pX7g1lPKARXHPi6GVFotEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by DS0PR11MB7483.namprd11.prod.outlook.com (2603:10b6:8:147::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Fri, 3 Apr
 2026 01:01:21 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%7]) with mapi id 15.20.9769.016; Fri, 3 Apr 2026
 01:01:21 +0000
Date: Thu, 2 Apr 2026 18:01:17 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>,
 <stuart.summers@intel.com>, <arvind.yadav@intel.com>,
 <tejas.upadhyay@intel.com>
Subject: Re: [RFC 09/15] drm/xe/trace: Add xe_vma_acc trace event for access
 counter notifications
Message-ID: <ac8RXcS0D83lmhoA@gsse-cloud1.jf.intel.com>
References: <20260318074456.2839499-1-himal.prasad.ghimiray@intel.com>
 <20260318074456.2839499-10-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260318074456.2839499-10-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4PR04CA0242.namprd04.prod.outlook.com
 (2603:10b6:303:88::7) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|DS0PR11MB7483:EE_
X-MS-Office365-Filtering-Correlation-Id: 10cb4180-c494-4b13-79be-08de911c84d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|18002099003|56012099003|22082099003; 
X-Microsoft-Antispam-Message-Info: m1vUSUGrvf8/ZG7r3PBtD3KsgR6C1ZuvG/8qH8zDXT6QIRnKUTrS9romJtN8PO2MSpDzveltrleaBkjjM2X6XnpWpVotVcpML9gjw3AV5pXDRsirCFQ74XR1ptgXYQtzF41uZFuJGvUN7DkoJWwmbnsvxAdQ0a7uNMWlH6KR1JI4TJ0z42JiZwbwtiAWdyH8flrZccYDWjv2c9lsscxyV8esw3m2JqoVstvrKxs1KkupS1UZ6vW/IQx4SitEQ5yTZt4XBoPy4aJ3x4rYcoJGHP03QgVsq2FG+ihLZxVMdz+H0ztc7WGsZbeyvoaN7fa1aZGhchbFLrJpDiPrXIQA08sxiM8VC+zGwXqTW+kL1VLigFGKh0WZpu+2inSKec1fI5P5Pk5O0zOYiTexZrt2E3d3Oqt4jqhh4bbwbbq7ahN9UCqP0j/1yainMI5H9bu/0qd5qSGuSfWkNzfi3gPtESqF1Mwi8rPRL9HAt5GSTzbWH30VQ8AcYlscYYLiGeDksK9yo6HdOVIZdEQdyocPJOygcZw8DZGst6YCx/XOy6PDefdNll5OWX46RtCx4MgaQjmlyTbTiU+0bm5m+UeEomxQMwUkvmWsHI6fXS6oiulE0rAoU+SyMGHN7tXPyNr2b7UfNwEwpiJyzSCb/YmGHT7zAcljfxLsojaJbnPLoy/rHlGuZUzThVYSJEUltZd7BkdJEbCBccnku5JLd5AjpDk0KLU0JoBVz+vPfU9loC4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qzcUvGlVjS/DLgYG53edYgPt8d5OQy7Bn5GeYeL5j5HF0qZfpVskI2SMZi+B?=
 =?us-ascii?Q?BqPFbmHn0qmIU7+o/xKIwbrGqocb8agsXH/y6hRnjNNM7JBkrO5sBv6A8JWU?=
 =?us-ascii?Q?fvLL8oPptVYAcwVC6Nr7peWpiPlKBBWWa+NhTlzjq7lhCRCdo7TrAdGUfHT+?=
 =?us-ascii?Q?39xk64uEXEvhBgAP2GOL6ZRodpvCFnPOp2JwvlA6R7LWGvF3ka3YnknYVGpE?=
 =?us-ascii?Q?P2kw10nBBGwKgir+r8s38bo1+Phro2pC2MarA83/Wf1AnT4OmAaPf+bb7z5j?=
 =?us-ascii?Q?PbaH7iw1JqVfKa/qJH0fD5o80WmeZHUsLXJkVzYLLCpPwyWm47v83j6Ra3tz?=
 =?us-ascii?Q?5hJMqlVCCg5Wm7g9LFzw4qtgf4nlbuVBMyABVtfkBEJGBaHx5Q13DGa7irB7?=
 =?us-ascii?Q?T52pXIsQT5gtqIKL5L21TkwP/qN9r9n3hhIiUXF9Aa4tiDOXWw114fnj07KF?=
 =?us-ascii?Q?hDmJBp2SX1hpfGdCph15yB09I6SBWqEvVZGSZhMCZOw4sv6EppTVjZSvKOss?=
 =?us-ascii?Q?B8Xg5ewvY7cO5UmK4DVTLYT5fW+kmet3j9keQ821IcQ1qI55L9v85dEI0SdC?=
 =?us-ascii?Q?m0l9lxOYNhtLEEDtlhvo0XRhCTvyGM5FAYQOl8OsfWoe+nWOR28wNp2CN12t?=
 =?us-ascii?Q?uIcyCpiw/TF/xOoqN9rCmo8VswkrEURdcNK2uWFak3P1zsDYgG69Mv//XbxV?=
 =?us-ascii?Q?kq5n9RQr80S1/yvMjfsp3Izxe8WbWw0NIsbhxjPz0oPWr9x0eVH9QraMTicb?=
 =?us-ascii?Q?K9xLkraitecOw6AF3+dg7qY1seLZTST1uW8hIeZCvKzvhFip6EC+m8DOjd1b?=
 =?us-ascii?Q?l/8e0B9PbIqWyZC9fd4rj0fq8esw6PbFb7v6YLRSBqpnsIZY4lR7JdHmz54h?=
 =?us-ascii?Q?LW1GHjG+ToJIYB8H3/hEyXSVpr6xG9WM8Z8Ka2DXi5J0wuu5kDvx3irQsUDa?=
 =?us-ascii?Q?J6XgG8fdYyz/tyShmAB4tzDN5rvCfyrG45ranX9qEfJ7Mj4DC9bYV0bPvlVM?=
 =?us-ascii?Q?DQ42noKTWoe9rEamxtOO9YrzqHHKBGvBhKG6Z7VaqTEFE4wGmphypvbpib1E?=
 =?us-ascii?Q?5fAkVepfW2JO6dbUPyKe4VsfnHfe3vj4dpf4YmHZ58Z20bkB4upxyojkB6a/?=
 =?us-ascii?Q?NSCeq6DL8XJSRIyWuFkZryo9kRFqfJcPWPzkhr2ubcYgl+Hv/CWxlEMVcNpM?=
 =?us-ascii?Q?bdemY/htXzrTtlQ2rTNF7O31kUfeIE4GJYzg3TH1+O7BGFDoz32t4n8LoDvS?=
 =?us-ascii?Q?pRZLRL8Pe1hLJ3N8A+qx70Gms83LDqAPYwFqUHMhL1d977o9buURMUEBEo7p?=
 =?us-ascii?Q?y6wBEeRF1isxwNHQNq4jtQcgBRuZLYM+DfjiW5j1y5sbd/juyfqDYwRQafow?=
 =?us-ascii?Q?x21n8i0WkNOA86rBJH3ZIShJoEuWP3DFaExJqOJzPtMLuMl8mFe/3S4zJgCg?=
 =?us-ascii?Q?vV5Me7WHHnAnAESgXuaHQ8/gOH3g2nyblRS6A3BZGz3W1h8BOeukCHyKH7xB?=
 =?us-ascii?Q?3LIFPloW54MKqign5CPOaxEmboJayBdW4+d+L3j+ku1zMXlmk3CNqPKKsv9M?=
 =?us-ascii?Q?kgXBDrqTCjJEGsKa1eIwBAaRoFpxow0u27SVjmv2QFSzW8kYAlGOM4lPbSKZ?=
 =?us-ascii?Q?moWwHtwK2OGBmMop+XWRMlShSVMUd/w7yFZCZUYRT4rB7Nmkb7CE6kXi6k2z?=
 =?us-ascii?Q?E6KvBJVqssopzdIRHsHArWXUWVUdpBe8nTKrpmsMGtCrJyrdqStlCSVUqJ8M?=
 =?us-ascii?Q?8qcb2fnsbr5w+aNVLWIRimiIbz9+EOQ=3D?=
X-Exchange-RoutingPolicyChecked: f0Wd5iTQBQsJk4l4bPWexpnFTYGv62PL1U2YAoSO17cMHogCQ+ty95505aFA186Hu0wbcRrKrH5KlAoUIYAzFwb2eK5SDBXUb0zfDriuwq+4TelsGuvCiUN4nl+qQhfFqfKNwVQIEOhjG6PB9JQKLoC4kjZCDVZw3VUp0bvaapCQ3Z5kMdvqjpnFCQXrHULBoTGmQ34LtR/oYPJxYyPqqMCYkNAKI8MIQDtZppdolcXvQLmWSElHXzuiK9VyPaQ/jJ+sduCGOlyEPyInoQFoQT9A6IueHWghjHOpCcvaZqEMyi8bPnWMZKmQqWMfvNYla+5b12DF8qqTJrC5RDfcLQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 10cb4180-c494-4b13-79be-08de911c84d9
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2026 01:01:20.9110 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ilx120aB5QV0U914BVF49e9zAbipaQVxiYJz46Yv9g5zFc+L/ZtmZrqHw5r2NdFuvACl3qMGMAFgxElYcIlrcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7483
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

On Wed, Mar 18, 2026 at 01:14:50PM +0530, Himal Prasad Ghimiray wrote:
> Trace VMA access counter notifications with asid, address range, and
> counter type (TRIGGER or NOTIFY) to aid debugging of migration hints.
> 
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_access_counter.c |  7 ++++--
>  drivers/gpu/drm/xe/xe_trace_bo.h       | 32 +++++++++++++++++++++++---
>  2 files changed, 34 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_access_counter.c b/drivers/gpu/drm/xe/xe_access_counter.c
> index 9eb9917d8da7..f93618faab02 100644
> --- a/drivers/gpu/drm/xe/xe_access_counter.c
> +++ b/drivers/gpu/drm/xe/xe_access_counter.c
> @@ -13,6 +13,7 @@
>  #include "xe_device.h"
>  #include "xe_gt_printk.h"
>  #include "xe_hw_engine.h"
> +#include "xe_trace_bo.h"
>  #include "xe_usm_queue.h"
>  #include "xe_vm.h"
>  
> @@ -109,6 +110,8 @@ static int xe_access_counter_service(struct xe_access_counter *ac)
>  		goto unlock_vm;
>  	}
>  
> +	trace_xe_vma_acc(vma, ac->consumer.counter_type);
> +
>  	/* TODO: Handle svm vma's  */
>  	if (xe_vma_has_no_bo(vma))
>  		goto unlock_vm;
> @@ -153,7 +156,7 @@ static void xe_access_counter_queue_work_func(struct work_struct *w)
>  #define USM_QUEUE_MAX_RUNTIME_MS	20
>  	threshold = jiffies + msecs_to_jiffies(USM_QUEUE_MAX_RUNTIME_MS);
>  
> -	while (xe_usm_queue_pop(ac_queue, &ac, xe_access_counter_entry_size())) {
> +	while (xe_usm_queue_pop(ac_queue, &ac, sizeof(struct xe_access_counter))) {
>  		int err;
>  
>  		if (!ac.gt)	/* Access counter squashed during reset */
> @@ -239,7 +242,7 @@ int xe_access_counter_handler(struct xe_device *xe, struct xe_access_counter *ac
>  	spin_lock_irqsave(&ac_queue->lock, flags);
>  	full = xe_usm_queue_full(ac_queue, sizeof(struct xe_access_counter));
>  	if (!full) {
> -		xe_usm_queue_push(ac_queue, ac, xe_access_counter_entry_size());
> +		xe_usm_queue_push(ac_queue, ac, sizeof(struct xe_access_counter));
>  		queue_work(xe->usm.pf_wq, &ac_queue->worker);
>  	} else {
>  		drm_warn(&xe->drm,
> diff --git a/drivers/gpu/drm/xe/xe_trace_bo.h b/drivers/gpu/drm/xe/xe_trace_bo.h
> index 86323cf3be2c..eae5a5d0dbdc 100644
> --- a/drivers/gpu/drm/xe/xe_trace_bo.h
> +++ b/drivers/gpu/drm/xe/xe_trace_bo.h
> @@ -12,6 +12,7 @@
>  #include <linux/tracepoint.h>
>  #include <linux/types.h>
>  
> +#include "xe_access_counter_types.h"
>  #include "xe_bo.h"
>  #include "xe_bo_types.h"
>  #include "xe_vm.h"
> @@ -125,9 +126,34 @@ DEFINE_EVENT(xe_vma, xe_vma_pagefault,
>  	     TP_ARGS(vma)
>  );
>  
> -DEFINE_EVENT(xe_vma, xe_vma_acc,
> -	     TP_PROTO(struct xe_vma *vma),
> -	     TP_ARGS(vma)
> +TRACE_EVENT(xe_vma_acc,
> +	    TP_PROTO(struct xe_vma *vma, u8 counter_type),
> +	    TP_ARGS(vma, counter_type),
> +
> +	    TP_STRUCT__entry(
> +		     __string(dev, __dev_name_vma(vma))
> +		     __field(struct xe_vma *, vma)
> +		     __field(struct xe_vm *, vm)
> +		     __field(u32, asid)
> +		     __field(u64, start)
> +		     __field(u64, end)
> +		     __field(u8, counter_type)
> +		     ),
> +
> +	    TP_fast_assign(
> +		   __assign_str(dev);
> +		   __entry->vma = vma;
> +		   __entry->vm = xe_vma_vm(vma);
> +		   __entry->asid = xe_vma_vm(vma)->usm.asid;
> +		   __entry->start = xe_vma_start(vma);
> +		   __entry->end = xe_vma_end(vma) - 1;
> +		   __entry->counter_type = counter_type;
> +		   ),
> +
> +	    TP_printk("dev=%s, vma=%p, vm=%p, asid=0x%05x, start=0x%012llx, end=0x%012llx, type=%s",
> +		      __get_str(dev), __entry->vma, __entry->vm,
> +		      __entry->asid, __entry->start, __entry->end,
> +		      __entry->counter_type == XE_ACCESS_COUNTER_TYPE_NOTIFY ? "NOTIFY" : "TRIGGER")
>  );
>  
>  DEFINE_EVENT(xe_vma, xe_vma_bind,
> -- 
> 2.34.1
> 
