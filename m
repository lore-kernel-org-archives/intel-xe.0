Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E150C021B2
	for <intel-xe@archiver.kernel.org>; Tue, 25 Feb 2025 22:04:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D05F010E7FA;
	Tue, 25 Feb 2025 22:04:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kVnAGmsY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A7F410E7FA
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Feb 2025 22:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740521076; x=1772057076;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=y33ygMBNMzZ5JSMOe/3fb2yFU+h1jEz7DY3bdOY5fso=;
 b=kVnAGmsYx1D5RwEGeLpBrr4C1frOnJOyYCM39F3Abp6GN74oq4u0SXm2
 BlR2Fe3JcfaggG+U8ayGrPzckNcmqkZgeSRsYijUffs/MyTDjc6wvccBO
 Brx9WGt8tsPOT1ywCN+KEy6nGn4UTZaEtVsE6cJP0LFr/Hina/MInaGAV
 dMRD2BQ5rAsRcsPYoqTU4T13ng0WIOo/uicQSsBAJsgQ7RULSPRB6uGI9
 BQgeK7QQCxrHHF6oBZJOGMzOQ/YdTxQ6YFKiH2kn3GagstxDbEazKA0in
 s6Pb8vEqrMOBCvuemmbx2GDC2htF0w+XLTChvdvgye9V0+5aOvq6eqY+F Q==;
X-CSE-ConnectionGUID: q2ufOiwBR9aYf/ktR1OD9g==
X-CSE-MsgGUID: m/X1PFOqR5CON0aboaUG2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="66723524"
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; d="scan'208";a="66723524"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 14:04:35 -0800
X-CSE-ConnectionGUID: A7rQoQ6RQ2mkNwnuHrvkFw==
X-CSE-MsgGUID: nGjS3KcdR1GKJFpDMrUrSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; d="scan'208";a="117133263"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 14:04:35 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 25 Feb 2025 14:04:34 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 25 Feb 2025 14:04:34 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 25 Feb 2025 14:04:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=misvqp/ppjw7ibN2fMLHSDPpQrgo9XYkHxvdDwdXoIOW6vnzlro9vY4tN0nnW6S7EhjivKj3ZzigLly+zbGKUT61Szy7XgGqycxQsyOPu87GmZIbA+mC9a8OFEMMzsdI7HpBLakwNSBHB+8FEZeHYucb/Yqmzegtx3g8DAcHqwh5zqdNgDDLQdtgFoE09rULedBLJ8/dt5b21+Q2bIX24vltwgH9J2tq2wMatzdQVVgQMo99JXxvQpl1UuRDs17exH9XXtWzgTuysLqJHy09QczPNzZpj4voRHZSaieNOZebPfwNEYtmPSHD1z9Z/R4Uz1ILbsLmHZT8P7h5i20aOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L5qlQUnonfGKIfi9I6L6GHkK7/M3PS0eweJDhHPAowM=;
 b=HdrXXkVNUfIQmHKVqF0mVxIHD3QdMJA4yDYCtRQbqGfC0eWvgla/sHprS3sDQGjnir7Le/rPoBDzvQF5dvEIcOxJa2XHa2ivn4yEWHk6y1qGfkQC0Ul1ubPx0OsSUgNj+oPcJOHU3lyQejHpJD7mKdyj4RjLPV1C68eCW8wkbEMLeWX0qrFwi1D/gfuDwPhbISWtVXnQHFk4dAeyb568fw/Q7ZRaIpoGYCFfbaY4u37odNQaVOIod/tbvUNLVLe4E5sbFvw9JpnYs66ZT57ShKTx1dalnqcGrw0lDuoeohPx1LU6BI5sXTFfhrArH5hJC3DCFBHG/hiy7T4kGmxA0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB6989.namprd11.prod.outlook.com (2603:10b6:806:2be::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.18; Tue, 25 Feb
 2025 22:04:32 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 22:04:32 +0000
Date: Tue, 25 Feb 2025 14:05:36 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Oak Zeng <oak.zeng@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <Thomas.Hellstrom@linux.intel.com>,
 <jonathan.cavitt@intel.com>
Subject: Re: [PATCH 3/3] drm/xe: Allow scratch page under fault mode for
 certain platform
Message-ID: <Z74+sDCUGzb9dY2Q@lstrano-desk.jf.intel.com>
References: <20250204184558.4181478-1-oak.zeng@intel.com>
 <20250204184558.4181478-3-oak.zeng@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250204184558.4181478-3-oak.zeng@intel.com>
X-ClientProxiedBy: MW4PR03CA0242.namprd03.prod.outlook.com
 (2603:10b6:303:b4::7) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB6989:EE_
X-MS-Office365-Filtering-Correlation-Id: 76b45915-6623-40a1-b3b1-08dd55e861cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?oQ3y2BAk7JV8RC8Qy4Skf+iuWa/Lpz00E79dSxN5riPejOqwLPsXG1YbrYt+?=
 =?us-ascii?Q?DcDy1w2fGxAvv7+KaAEF+rTJ0nUs2NuZtaKxahQ35uVlfevYGcdozLmLMEgh?=
 =?us-ascii?Q?cxrS250B5fGSf2f4RRXjL5vEaheGo2ZrK5FdOXCE33cHcPBSZzHy3S3kU0bQ?=
 =?us-ascii?Q?LXcl8DWGAi5UoXPHW1lgceZ/rH3+SjwlphgmN+uWu/9HnUwhWJ7FbB64bJm8?=
 =?us-ascii?Q?sCAWAQifmoHenYFw9Yy2yNUCbXF4tYdCebYCh5+9mW7qEiTgJ0KNy5o/wBkc?=
 =?us-ascii?Q?3ktwLrxzzBmZctUh/24QSJp6BqbWZiKIQ37EVkp0ztrMwwvRGMY2VVgnTNZr?=
 =?us-ascii?Q?Pjvcu4O+o+LTgn7glfbgL7ocELzcFGbajMK+hchsfj/7/u7OubcWjxyzlEO/?=
 =?us-ascii?Q?tA5Xk3n8TP4HhMiYkvelfKjoD4x2kTcEDqqpDXV4kysDR1wycoHosmXA4M3i?=
 =?us-ascii?Q?PyY8KS8imAFuYBKUFessPFAIQZexxTQmnkD9HfBLX+JdHMvhkH7iseXWik27?=
 =?us-ascii?Q?GqN1KLzGknlpDU1f99f4Aes68i5LNlYmCIdEz4HsURzTRlyqBVx7fXQLIzJH?=
 =?us-ascii?Q?vzAthO+T4xQrG4Pfyj935Ozb+cI/3ITULcgzy6acY9KukMw8puzED3YkIMUq?=
 =?us-ascii?Q?miF0Katkl4VTb2a1cSmqi30VR3cLA8nPROpNO3C4syifO6G6bEqZV3DGobCw?=
 =?us-ascii?Q?6FTFEohesrgxAB18cnNDiojvhuahP2fluwc1742kFbUFGSVqcn/xoEH3GJhR?=
 =?us-ascii?Q?JWriecqJkj4wse8tmqiYSyiXEwNnRWFJtongEpMB7C6GG0yX3gWtJvzZ83JM?=
 =?us-ascii?Q?MtBiHnZvg8RrIDWQw1BR3WlDBnZJkmXn82LqBADfxWnujNHHAQWS12IU4H0R?=
 =?us-ascii?Q?qsfaZUskM7PRizrHUu67lDTF5TL2gahi5C2nE4roTqZaWDqH2oNMPF7ySG5q?=
 =?us-ascii?Q?juXsgC2Zc1Ww6dJKyYg9qEbgcMMbbV2yCIcImejwVH+KSy0mY/Gwey3I/B6f?=
 =?us-ascii?Q?x3CZSlgz6gXhID2ivY1v+H1A0kxpb8SxuU1iYrz3E38L+wSPBub7wX3Rf+H2?=
 =?us-ascii?Q?nrlwfP1sG6SaDHWA6ETHO8xJrSGN2THYHrAIZWON4F6+Rp74YhUt8xqxPfT1?=
 =?us-ascii?Q?dncM/vNi3Wh47NyO9gq0UynLgqaUdJO8w2M9eAmHN4bVI06hJTnURKyUO3Fz?=
 =?us-ascii?Q?hBUlNm1ldhFfwNDuvkDRcx4K7QxBLUSPSs1ZVL/Ek4zqmr/0lmUHWQlVX9LT?=
 =?us-ascii?Q?aIBTzQjfc9pleO70R74cYE8lvYeGKcN/OGfOB0QJ0z1Ns3shtu3X+QN4dHrR?=
 =?us-ascii?Q?r85Yvn7mPHZHDUiVKhoWsTcdMKdVTTMk4wE4xHSsg4wVgw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?T6AZUEsY1h1jw5kcw/ijoeJ6C9Lx2Y/ILwF7w81tzBIqRkRfTPyKXIsYnKGa?=
 =?us-ascii?Q?Fd9R2FYkaGfkxPoaCn4P9vb1ND85h5csLE/nhandzCZTpZ3VPHHXnaS/VKUh?=
 =?us-ascii?Q?CEPWtEFKziQ5VD4iK4mwZ/dcWECUnylvuTDDf0FjUUpd4YIf4kjbQ0Bcxj5q?=
 =?us-ascii?Q?vm6lMY8WfGGY03N22s7Wn1jWqgu3rv7b+qIG0ceupA6EeTqMtWPSymIGTLBD?=
 =?us-ascii?Q?0n+1FbkYqpUGIFccdnMi66d81iOjiAYw7KgSNyI5GIkS8sNX6FmwpE0SIN7C?=
 =?us-ascii?Q?eRHrSBSOdC9jesOaGRFJ7mSYJPBoYs35supBlGKJu8EPrPt/2IRzWOXvH6aV?=
 =?us-ascii?Q?kuA+12bdEGMwwLYUl8Q6tFUGCgNuftoIny8d0oSZIMHGhzto7hyviiWvtSpa?=
 =?us-ascii?Q?FChm54iWKx1pCfYg8AGnnEGow8Xm37KoSXSOGfgdlkiec0gqPmpw9zPDnkxU?=
 =?us-ascii?Q?uZUjrQqDjYlptOJW7VrsVU1aVD/ZIvulMKUvcDXSvzdVDl5K58+IpsWh2Rnz?=
 =?us-ascii?Q?imJHKhcKeQnysZ/OENr0xvYeJPi7qxS+sDl51E/QSLqRfWCxeokrjuu//row?=
 =?us-ascii?Q?JYEsTsjng1Ozjqef2O9XhVlf7Zk/DebvVszaplJwRHY4PJtdq3fVU5dB7fwA?=
 =?us-ascii?Q?PjHdu3Bgt4FcKXklhYZ13NM+Y7xIGN3SZ1Q61qeE3CV76MJhxqmzFIa2jbiZ?=
 =?us-ascii?Q?LIUOgmOETMAx+eMlPDwrBqDZ6z7aYHhHnVJlQoUVIMCeMvUuafoV0bV7ALFE?=
 =?us-ascii?Q?QNVWhrSEhBN4ss1UAS4okM2cwbBjV7XythkjpqBNqGUNPwXX3+aEWz/ezkpn?=
 =?us-ascii?Q?8KQ7cuBuV7qFN+HrY+fh27Ayi7gJ5mdXxLieTmmW0tk00sJB/io4bnAyraqS?=
 =?us-ascii?Q?9qIdMyp0cS1AZleWpzDlT863wX27PE5PoAfLPOBAZUJsTerm2P3hIe0jPK65?=
 =?us-ascii?Q?YK8jDA0gCltr47AtA3oXeFN+mFR/faa8cbbSjvNugVW+rnlrgbexdsSaEiFf?=
 =?us-ascii?Q?P8kqYhPgkrVcivYi6e/HSWj7BI+wCKs/vOkEiIopx4xj9VQtqAVGALtRsioi?=
 =?us-ascii?Q?d9JWF+dx+Dg1/DVSMkdNegvcFYkMWSaHnfjB4F6MfiVIEWr2ZAaJxVRKIPQx?=
 =?us-ascii?Q?+zr28p7mabcgtlpmL1M4AtGswC+sPy3O9hl8+jfolI7ppUgIkdJdQRiRtnjL?=
 =?us-ascii?Q?V2EIeiHvgS5EyV1lQAP46hjVtr1L3L0I+EOhSA9n5jwltJUI2ZAjyok+/kIN?=
 =?us-ascii?Q?zJvBZXpgAuFhpDJX00z6kOJhXjn/k/m4mB5f1PnGaWYTF3YR+Y75/mkQxiBR?=
 =?us-ascii?Q?0iJrQVHpLRy38TS62jWGr5b4J5wUd/fO6vFkrMJMthndfNCDUa3qWC7zzaXe?=
 =?us-ascii?Q?HoBR5z9wf6xHVh/QhNb+Gp3qHgIfg9k2h2JM+KyeK1SfvIwZ6CIG828zNdJM?=
 =?us-ascii?Q?h2KNGNeJc83CSEGOtFrFhUgVDF5dFdbnoQWaJqzeDU9C0N1QiZLLHRmsXGed?=
 =?us-ascii?Q?40RnyzjXb7g3ypIGhaK96vjCB/3A+05qAoemRvdi/7sI2y0fxsUs92myNgf2?=
 =?us-ascii?Q?bKqw6wsJHh+wd8ecBuYgWyYvF5IZuYN1BgFQuGkcUVC4I0Rbw9kpiEvKvI2F?=
 =?us-ascii?Q?+g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 76b45915-6623-40a1-b3b1-08dd55e861cf
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 22:04:31.9245 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nOKHHCopXsyM2PnySfNBhw7iv6glFIMy373JkiYYBKLMgulJpZ4EmiFP/e9my+F4KcseWttZ+RlnJ06Iq3AkPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6989
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

On Tue, Feb 04, 2025 at 01:45:58PM -0500, Oak Zeng wrote:
> Normally scratch page is not allowed when a vm is operate under page
> fault mode, i.e., in the existing codes, DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE
> and DRM_XE_VM_CREATE_FLAG_FAULT_MODE are mutual exclusive. The reason
> is fault mode relies on recoverable page to work, while scratch page
> can mute recoverable page fault.
> 
> On xe2 and xe3, out of bound prefetch can cause page fault and further
> system hang because xekmd can't resolve such page fault. SYCL and OCL
> language runtime requires out of bound prefetch to be silently dropped
> without causing any functional problem, thus the existing behavior
> doesn't meet language runtime requirement.
> 
> At the same time, HW prefetching can cause page fault interrupt. Due to
> page fault interrupt overhead (i.e., need Guc and KMD involved to fix
> the page fault), HW prefetching can be slowed by many orders of magnitude.
> 
> Fix those problems by allowing scratch page under fault mode for xe2 and
> xe3. With scratch page in place, HW prefetching could always hit scratch
> page instead of causing interrupt.
> 
> A side effect is, scratch page could hide application program error.
> Application out of bound accesses are hided by scratch page mapping,
> instead of get reported to user.
> 
> igt test: https://patchwork.freedesktop.org/series/144334/. Test result on
> BMG:
> 

I'd include the IGT information in the cover letter, not the patch.

> root@DUT1130BMGFRD:/home/szeng/dii-tools/igt-public/build/tests# ./xe_exec_fault_mode --run-subtest scratch-fault
> IGT-Version: 1.30-gde1a3cb42 (x86_64) (Linux: 6.13.0-xe x86_64)
> Using IGT_SRANDOM=1738684805 for randomisation
> Opened device: /dev/dri/card0
> Starting subtest: scratch-fault
> Subtest scratch-fault: SUCCESS (0.080s)
> 
> Without this series, the test result is:
> 
> root@DUT1130BMGFRD:/home/szeng/dii-tools/igt-public/build/tests# ./xe_exec_fault_mode --run-subtest scratch-fault
> IGT-Version: 1.30-gde1a3cb42 (x86_64) (Linux: 6.13.0-xe x86_64)
> Using IGT_SRANDOM=1738686046 for randomisation
> Opened device: /dev/dri/card0
> Starting subtest: scratch-fault
> (xe_exec_fault_mode:5047) CRITICAL: Test assertion failure function test_exec, file ../tests/intel/xe_exec_fault_mode.c:349:
> (xe_exec_fault_mode:5047) CRITICAL: Failed assertion: __xe_wait_ufence(fd, &exec_sync[i], 0xdeadbeefdeadbeefull, exec_queues[i % n_exec_queues], &timeout) == 0
> (xe_exec_fault_mode:5047) CRITICAL: Last errno: 62, Timer expired
> (xe_exec_fault_mode:5047) CRITICAL: error: -62 != 0
> Stack trace:
>   #0 ../lib/igt_core.c:2266 __igt_fail_assert()
>   #1 ../tests/intel/xe_exec_fault_mode.c:346 test_exec()
>   #2 ../tests/intel/xe_exec_fault_mode.c:537 __igt_unique____real_main407()
>   #3 ../tests/intel/xe_exec_fault_mode.c:407 main()
>   #4 ../sysdeps/nptl/libc_start_call_main.h:74 __libc_start_call_main()
>   #5 ../csu/libc-start.c:128 __libc_start_main@@GLIBC_2.34()
>   #6 [_start+0x2e]
> Subtest scratch-fault failed.
> 
> v2: Refine commit message (Thomas)
> 
> Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 813d893d9b63..c0372f083d42 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1752,6 +1752,11 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
>  	if (XE_IOCTL_DBG(xe, args->extensions))
>  		return -EINVAL;
>  
> +	if (XE_IOCTL_DBG(xe, args->flags & DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE &&
> +			 args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE &&
> +			 !(NEEDS_SCRATCH(xe))))

Same comment as patch #1, I'd drop this macro.

Do we need a query uAPI so the UMD can test upon process open if the VM
supports scratch page + faults? Or should we just not restrict VM
scratch page + faults ever and have it choose based on platform
recommnedation?

Matt

> +		return -EINVAL;
> +
>  	if (XE_WA(xe_root_mmio_gt(xe), 14016763929))
>  		args->flags |= DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE;
>  
> @@ -1765,10 +1770,6 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
>  	if (XE_IOCTL_DBG(xe, args->flags & ~ALL_DRM_XE_VM_CREATE_FLAGS))
>  		return -EINVAL;
>  
> -	if (XE_IOCTL_DBG(xe, args->flags & DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE &&
> -			 args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE))
> -		return -EINVAL;
> -
>  	if (XE_IOCTL_DBG(xe, !(args->flags & DRM_XE_VM_CREATE_FLAG_LR_MODE) &&
>  			 args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE))
>  		return -EINVAL;
> -- 
> 2.26.3
> 
