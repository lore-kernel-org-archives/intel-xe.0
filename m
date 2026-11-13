Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A28E60A3810
	for <intel-xe@archiver.kernel.org>; Fri, 13 Nov 2026 15:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=h+JasFE/;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=EcMQ7SuT
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE55E10E80B;
	Fri, 13 Nov 2026 15:55:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 938BE10E80B
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Nov 2026 15:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794585325; x=1826121325;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=i6+0bm6dlHHgltNmqNAcdmjllUgRcdmDEvXit/s/Mv4=;
 b=h+JasFE/O7gm1+MiufrSFkRjtQbP3mvp1g7rzX5ZQE/EbuiFd/4C9OMk
 hdGZGN9vR8TvXIbifJbr7LPL9IY1xlRTBBGPROldiNhyi0xlS/0MaiyE0
 99ykBOQca9mYJeKHnOOw5mLjY7qNRxWhxwAGNuq+L05G+sEZnD6lawnZs
 3uZqNBLKF98NMfAgm6eASgqWuUXnSr04JdEGyf7rQ1Dwa0U9N541OKeG0
 BMKIdUc2LdGsNlI/l+L7Brp67Ds9v1+zElYlLfReG5CSRUGmxrWWNKflP
 IE6aTdqLXrd81ZzDBSkFzSsSdoah5qihUZ8JbvFonPq25AIdXJuI46hrK Q==;
X-CSE-ConnectionGUID: /ARLK6NRSQahmG3FySRI/Q==
X-CSE-MsgGUID: tcxNjyJ/Rm+dLxcwXI4MXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3404214"
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="3404214"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2026 07:55:25 -0800
X-CSE-ConnectionGUID: NDvXX4iQTxqnlS21avA0ew==
X-CSE-MsgGUID: c5hWBOADTBelNw+iiww1oQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; d="scan'208";a="10855529"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa013.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2026 07:55:26 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 13 Nov 2026 07:55:24 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Fri, 13 Nov 2026 07:55:24 -0800
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.41) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 13 Nov 2026 07:55:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e69fAoDt2eJTWJu98O3TgVt4v57I5YlK+LhjF3lioAc8hoT6pUdoV3XdXs5h49+5X6LoZgdiEhLgPj6jYr6MlGiu8SzU9XbRKrEAIXWhF8L4rHoHIcOSjzT6Ar24I1hay558WWzeYZBRCDa15rZcRP8Ibb7FfQuu739J5z4CiOW8Y7lVkO+0/4SVmHsOs61O40oSdXvOs2VYxLPzzpzlyEpSwZbdcNaE7NF1rM6iPSznVaGrpJ+P/k36xFRlrQYLqN5MbS0OG25VWNbJlGbU/dcHtpRIj/zVxK9zIoZ85eKZrIxovaCXPLUteVhvejAKgVAX4bpp2X2XR0d5IqMkbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SFuwGOuT8jOccfmTsk+8Zm0wILSrSaU2kgIjcUbuyBU=;
 b=fxFdwkDGgWb/6grmHjW9Lh5FEnq1En11v2lNhQ/6IrymlQiqc/wSuKnQVeRyDsCRhRweLaKSBIBfOQxwKL5fo65zgyu1usTfXwXM5C9OBqtteWMRcS1g8RGOK4fuWeKABwuRcq8xpn9R5UFcIzlY15AUNk51zGJn7i56EmiE3fLABU1S93vteS7HMlWkoi7pTwOfvypFLKg1xiPDNCMtT50tiRK39Xd5BVjPO2Ff6usdIvTbhm26aCJeHwh/OSadF2LVq/Cqp0lTJzbB3twKblZoycnVCfGQnMuUO9a5NiO6sWjUOg8dECbfkIyN1btUEjPGMVV+wFBVur/ZuJHkRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SFuwGOuT8jOccfmTsk+8Zm0wILSrSaU2kgIjcUbuyBU=;
 b=EcMQ7SuT/Ykd03gxjam1J69s9BymUEbxyGy/DBDd9cM2Pe5v+wYvNHFboofFyG5+F/v3TDfQZS5dOg3yOjg3gebQMfpxNwOHsXaugApRnbLt2MzdQLAvB9iwtBThFZM3jmBJjZungF0EbQFU6xyQmYlYFNqX8JZgLw67OvNpgLg=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4787.namprd11.prod.outlook.com (2603:10b6:303:95::23)
 by SA0PR11MB4526.namprd11.prod.outlook.com (2603:10b6:806:96::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Fri, 13 Nov
 2026 15:55:21 +0000
Received: from CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd]) by CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd%4]) with mapi id 15.21.0615.008; Fri, 13 Nov 2026
 15:55:21 +0000
Date: Fri, 13 Nov 2026 07:55:18 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <arvind.yadav@intel.com>
Subject: Re: [PATCH] drm/xe: fix UAF race between exec-queue teardown and GuC
 CT pause-abort
Message-ID: <avcy5lJdRge/D8qm@gsse-cloud1.jf.intel.com>
References: <20261113132149.2989667-2-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261113132149.2989667-2-tejas.upadhyay@intel.com>
X-ClientProxiedBy: MW4P220CA0025.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::30) To CO1PR11MB4787.namprd11.prod.outlook.com
 (2603:10b6:303:95::23)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4787:EE_|SA0PR11MB4526:EE_
X-MS-Office365-Filtering-Correlation-Id: 22ed0dae-f5c6-466d-d8a7-08df419e8557
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|10067099003|11063799006|56012099006|261028144727099003|261022105027099003|261026140227099003|261026121527099003|261022075727099003|261021121427099003|261021123027099003|261102123227099003|261009223027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: rPg49nvMxteS81EMw3H5XXdBLTyuYXvwEfAeoaT5scX6n+Bs8X7/B90Ts1r5K50fyYZqcaAlmKs8SQD1YHq0+ddSZ5sofC21X7t7lQ7e7sMqZ4P6F3IkwLgyoGUecqQ7D5RKHazexu20DQ7aGvY6+IGHWlS2ujqTWAkw+V5OmtRO1WXE7Cdyfa9x+650Anbk4Kn00whBcnuMW1TkU7PzkkPn0pBsYpnVM3RNNljLYoZfLI9z1/tkeLgCgr50KC5iXrm2bd9WduNaFhOKbm/WxVpDLuHo/Co419hDnY4hhcraAilEbz3AItDVPjZd3s3OV89bXxkj0pnem8MyCguWufsr4sSOQxNBlqbKqoBJ2MGcHbQDgfUoSRDvz6dF6Q3xe7bvg5lr66w4yB8UK7vHCX0RFfxKZIzx3QHx40UbwYy7fNLy3l5yVjIW/MRXaLK/zifhwmM1QQUoQ3IsmAQoqp94CCxZxXUepb/ZKORVRyMpsiopxVlEyomcdBDl4wvARWmIhtNL89rKt+bPN23uggcMgXaUGAW9yuFZejF3+ws8aJPDMaXsQ6NifjBpBfQ1lbdZwCrLvsEDKLjbxDoz4ZAjBuDsXkSWjulwr1XtVJOUGP6ThKRUC2GXB5dDS0TJkf1u7RUM58ZuusrzOLayqWzGPff7DRrqid82p2bw0NQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4787.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(10067099003)(11063799006)(56012099006)(261028144727099003)(261022105027099003)(261026140227099003)(261026121527099003)(261022075727099003)(261021121427099003)(261021123027099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?01Ncu/Z8xibkcAnmfkFU8d/L8vv4mQSVAdywTqBUpcvfzdmnUG12eOTL3giE?=
 =?us-ascii?Q?wtwFNboG2SOwfFWV/pFpKqDpoBRytuOOoDfniWAVam48f392WQSWMj1/+vSu?=
 =?us-ascii?Q?I5Nltd3fPpfwnHj2Z1o8WeXBx/Z3jRwPsrE//Z/rXyp6kqRI2ksnz8wx5qI4?=
 =?us-ascii?Q?JSbj5L/e1iPPH4jR/FgaIRRzYLhVDbak7E66WoGT3dFGAlm/KygFz+MmXE5a?=
 =?us-ascii?Q?qohivl1AVYp6jGuu9MrtjLCjmpSDwr+NMef9tU7o41EGn9jNSGnxOTndzXXf?=
 =?us-ascii?Q?/XQzYS45TkEYox5U8wMprIRdU4/OnRcMzuDZSMpmtQmqOck5d73KgSYm+wro?=
 =?us-ascii?Q?NQfXBpHRV7WUQMEAW0rP+yAfUP/P3POybN1xza2aKiE/kwpthtO8Cm4X/esy?=
 =?us-ascii?Q?SpneHPmXFJt3v9E83j6gtaFCDHC/uz8Lo1I0noNy934nHQOafd5AcnIY8gyx?=
 =?us-ascii?Q?C6Wc1XeGZRlqpmJdbqAOGJf6x2ZllEUHmNebScT5cfwzqKGVPrZ6bEeeza1d?=
 =?us-ascii?Q?5TbWAnCAlK6hhq5qSjtzBi8wxnWToKcvevl5xCPeRcDmlOwKyekAiccMdwSj?=
 =?us-ascii?Q?FPGkPz+WS2hWjL8AEi5115K4OWNWWycK+Yfa/dXzJzkv82HiUqyCgZwbazTN?=
 =?us-ascii?Q?H/rRU1w5BO3cKfa4yMKoUIW3ItjTu4x9KGQzZktGZdSZeDxSzarZLej+9wbH?=
 =?us-ascii?Q?BOniHGv8lapBaeCBRx8hBmH5vgXMAMpOBaJL5F9wmnRi4DK+2XeQamIrw0hS?=
 =?us-ascii?Q?uHmXzadpFv6ipfe2+zSlP5KV+TdLuPZrFDYLYHqsFpuKJCB8KhFAgKbZOtyp?=
 =?us-ascii?Q?PKCnMHZuxKGhr5+ohc057whI7Eqc7FMDHR+LpQWLNhqf0BK3ypAlRzw6C3gg?=
 =?us-ascii?Q?W9liqFNqarDi5heB8wPMtfGev3ZQWiwBzAfXA0uogXFTxkPth5BYZNvkaBaq?=
 =?us-ascii?Q?Pul/cCN3pEPEhB29Hs44L0qqw7E8Jc3f0tae+m5YQymYXVyXpiV/i5Nt0cOr?=
 =?us-ascii?Q?bEjCSe17hZSEvmsda8DbxA8YGDa71gdstFu54+EjBw3j+9Mhvh41K3jBN0sY?=
 =?us-ascii?Q?A0TJSMhgdKKBKDI5TCQscKeadk0FzwMMyGgOXGRvUc9+DGkBxD93narRcbwp?=
 =?us-ascii?Q?f3/y5iu7f/xZqdSbQcE7PJw14iNMWIhNNTAHNlXoEOACSMU/IyEifBT0IdHE?=
 =?us-ascii?Q?TvEKzBbJL3RJyNpWCHH+JF+uQgBnBWgIt/XYnnUc7U46PpCJ6/If4kQpnmkP?=
 =?us-ascii?Q?cKXfS67U3R+IcmuOFMYyIzAWoXv1+flt5zi/DNWEiLtbe0y15Ird2AfLFVgu?=
 =?us-ascii?Q?0+cVpdv7rUskgPhQe32B60+4a9pg/Okzpgo0Hj7L9QxEM8ALNx4ZLQgr44Ig?=
 =?us-ascii?Q?ULhAfrCIiN4VoY5h1NP5+j0MXJB80fOksYbc+uDhbL7GQUFEv/v6kG+dNOQA?=
 =?us-ascii?Q?g/OqPVIfkG9F5CisfCJe9qqPTuVWe+VBXyalmE2z30sRLSOcRKBLT5Iwi8o/?=
 =?us-ascii?Q?+ZdC3a28fqmYx3kQaCXBpuvVA9izK16Yv1Nl/zqO53wQfx14rS2nlkBwaJX3?=
 =?us-ascii?Q?BTIgT+R4fKl2ZLfResm9eCnonZp6eQJ4Wn0Y2Anvzl4O2juXsI+4woIjq/xg?=
 =?us-ascii?Q?aBUoEtTC92LMgTYu2gmPtGbo1IZp9wanA5dIkYh/19pgF8RcDVwwXIOAD/rj?=
 =?us-ascii?Q?3zCjNLBsQ074e1/Um+EG5jsI9U66nNA5tTtKlX/7a+f+vDZECBYF78a7OTkX?=
 =?us-ascii?Q?uVNS0fv0yA=3D=3D?=
X-Exchange-RoutingPolicyChecked: oCEGnWUO3Z2ixgob2XmcD87BZxBp7zcEhMxzb8V0uRpjtgjb1VPnAysw15yuzIrwcA19bRZjVR4mQ32snTSekXXFPwi+I6vacXo4ZMqmU+lqQM+4nsaO8trm9qSK9fAT0ItdwHNZ/Y35WGoamN1cZFG3AOWzakS1LEHI/anHUgLJ9T51Njlhc8ADe3rHpbROa50Ib+PJtuQyWmzxXZhTZ49cgxxyKB3hBuon/eL4TICgymXGdADcquqE5OeYTdNmyD5URbTbzjANs2Av2Sarb6jZdm5e+guU8p6lmnc0gjzKS0kZ4kNvldsVawWXGypYK3fDqfaQUEElJ47YXuDNfg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 22ed0dae-f5c6-466d-d8a7-08df419e8557
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4787.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2026 15:55:20.9502 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vBo81l9J2FySIHH3EvV/X2dfcZmG1FJtHrbAtpRmfzQcXIxfv8kOPaILhX4bKzrpqIzcPooLSC/oM5HVRPsZjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4526
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 13, 2026 at 06:51:50PM +0530, Tejas Upadhyay wrote:
> xe_guc_submit_pause_abort() walks guc->submission_state.exec_queue_lookup
> and unconditionally calls guc_exec_queue_kill() on every entry found,
> without verifying the queue hasn't already begun/finished its own
> independent teardown. guc_exec_queue_fini() (run once a queue's own
> refcount drops to zero via the normal close path) only erases its xarray
> entry partway through its body, via release_guc_id() -- so there is a
> window where a queue's refcount is already 0 but its xarray entry is
> still present.
> 
> This was caught as a debug assertion firing on both BMG and CRI:
> 
> 	xe 0000:00:03.0: [drm] Assertion `kref_read(&q->refcount)` failed!
> 	WARNING: drivers/gpu/drm/xe/xe_guc_submit.c:2242 at guc_exec_queue_kill+0x2e2/0x360 [xe]

xe_guc_submit.c:2242 in drm-tip is a comment:

2242          * on the hardware. Only wake any suspend waiter so it observes the

I also don't see a 'Assertion `kref_read(&q->refcount)`

What I am missing here?

Matt

> 	Call Trace:
> 	 guc_exec_queue_kill+0x2e2/0x360 [xe]
> 	 xe_guc_submit_pause_abort+0x8e/0xf0 [xe]
> 	 guc_submit_fini+0x11f/0x180 [xe]
> 	 devm_action_release+0x15/0x30
> 	 ...
> 	 device_release_driver_internal+0x230/0x270
> 	 unbind_store+0xac/0xc0                          [BMG: igt@xe_configfs, sysfs unbind]
> 	 pci_iov_remove_virtfn+0xd1/0x140
> 	 sriov_disable+0x42/0x100
> 	 pci_disable_sriov+0x23/0x40
> 	 xe_pci_sriov_configure+0x2b9/0x1350 [xe]
> 	 sriov_numvfs_store+0x136/0x1f0           [CRI: igt@xe_pmu, SR-IOV VF disable]
> 
> Pin the queue with kref_get_unless_zero() before touching it, skipping entries
> that have already independently reached a zero refcount instead of operating on
> an object that's already being torn down elsewhere.
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index d76f125f9c3a..7a3bd698f217 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -3306,12 +3306,18 @@ void xe_guc_submit_pause_abort(struct xe_guc *guc)
>  	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q) {
>  		struct xe_gpu_scheduler *sched = &q->guc->sched;
>  
> -		/* Prevent redundant attempts to stop parallel queues */
> -		if (q->guc->id != index)
> +		/*
> +		 * Prevent redundant attempts to stop parallel queues, and skip
> +		 * queues already dropped to a zero refcount via their own
> +		 * independent teardown (guc_exec_queue_fini(), xarray entry
> +		 * not yet erased)
> +		 */
> +		if (q->guc->id != index || !kref_get_unless_zero(&q->refcount))
>  			continue;
>  
>  		xe_sched_submission_start(sched);
>  		guc_exec_queue_kill(q);
> +		xe_exec_queue_put(q);
>  	}
>  	mutex_unlock(&guc->submission_state.lock);
>  }
> -- 
> 2.52.0
> 
