Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7ABFC531D0
	for <intel-xe@archiver.kernel.org>; Mon, 27 Jul 2026 19:21:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 486F010E24D;
	Mon, 27 Jul 2026 19:21:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ck6/YBU3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61F0710E24D
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Jul 2026 19:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785180067; x=1816716067;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=qjm8azEiHMvSFuELsTtyjSrACS3fcl+lEJ5zEC2vLps=;
 b=Ck6/YBU3NQ+7fmS/f45DNMshDpQ1PcS7rv/kfpQj0TKhi8IRSyZMGMkE
 0JVqshe0rs6TR0lRkq//0+UIC8UZkf0KsHvdZAk7/r/UrAjslv7yyRfkt
 R/CnCRTKwVoKScme1OtL5qnEr2Lhu6CI/qZCL+JvCIvGtTeJ5u0jFhl4h
 QXp7J1blshwBLd1SeA0JQ+3x16h80J68eDZpcxLxrvJNG4d/IoAInCM9e
 9WXgCqs3MYZacE5TIUNykihdPrNByWi4IxOsba0pHPlybGdancLbn6FNU
 v3+1ijq28W1J3K97SwYHqu0A2kTxtuvr9wzcAzL5B6RNFzqBsPjOQJUhw g==;
X-CSE-ConnectionGUID: yVuF2QfjRWSckQTiv+g5Bw==
X-CSE-MsgGUID: MA6+VSOcRSi4thJza+aMEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="103166223"
X-IronPort-AV: E=Sophos;i="6.25,189,1779174000"; d="scan'208";a="103166223"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2026 12:21:07 -0700
X-CSE-ConnectionGUID: pGldRD1xQd6df4vL0A8UHQ==
X-CSE-MsgGUID: eCmUq+jsQKmvPHOK5cOqLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,189,1779174000"; d="scan'208";a="260142708"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2026 12:21:07 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 27 Jul 2026 12:21:06 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 27 Jul 2026 12:21:06 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.45) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 27 Jul 2026 12:21:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ryLqKKPpAriHVzW/l/rRwU5QEKIXz6HqiOYVDhK+Yx4gBLv3oAfDicLp1NlClfzI9XknvDnOn3vvZBhYjvM3uK+D7NB4rT+3o9WkM/cH7QWuo9zMY30z+IzGfCxD+OHjzyVr/kEiDyiM8uD2/L4ghZn2xIN6AGhAT49qCiUJJyX3Mn1p4c33ZM03UugjgGAFfqOlDp+xW2IWQpj7q7zShGD2WXYkK249HCNNADTDhlFKkXpJKyhaXZndWi7cvs8axAXjjueUXC6maqyavGBJ6dr0RPXDSZX/Epv7qojO20TZquoe84m2Z6p9KArBFSyDTp9Loz3lUe0lPO7asMIUzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p8KKHYh8wSTADvoas5KUb0pb3OzZeOaTX5uuGSq78go=;
 b=fAE0jOyHWqWKY6BwQZ0YVeyE57NfHf7nQWpBTlnk2C9JtNskl0xS9AfXMIynx7TZ6KeCxDRi2uqlyd38llORuM8+EZ8NvbdipnVDb/vXjB39c4AQh81kp4CybTn4vtYs+ntrJVvErNYUESBsrC3NY4P5QY9koNWEPy6wIVjBZJFHk5ecB20mH+ryOkhrx447ka2s1q6NwwKjk/F4W+APlehlYiHoIgwYuJBf4FjtAFdRajGiAvAeNvIbFgOhRzVbenfAa4Vf4OJyFSfmPWPJgZTrVuI50nCbtwRzP7HF8sOkCm851jJPptVpWO+9l7XgRmm0RC8WCGyfOyPvrYVbfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB6263.namprd11.prod.outlook.com (2603:10b6:8:a6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 19:21:02 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 19:21:02 +0000
Date: Mon, 27 Jul 2026 12:21:00 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>, Copilot
 <223556219+Copilot@users.noreply.github.com>
Subject: Re: [PATCH v8 03/12] drm/xe: Thread prefetch of SVM ranges
Message-ID: <amevnA0mPEBNWp9Z@gsse-cloud1.jf.intel.com>
References: <20260724232601.1753977-1-matthew.brost@intel.com>
 <20260724232601.1753977-4-matthew.brost@intel.com>
 <ameKMjpyQQuDWL5X@fdugast-desk>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ameKMjpyQQuDWL5X@fdugast-desk>
X-ClientProxiedBy: SJ0PR13CA0061.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::6) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB6263:EE_
X-MS-Office365-Filtering-Correlation-Id: b05f4e00-1fba-4657-e913-08deec143262
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|6133799003|56012099006|11063799006|4143699003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: a+Ccg41s3oOJcLdimJSljePvqHMMprBeyyKWJTD3vjZ9jDZeiYW473I3xhffZx+aDq1Piu2RRrSxTen4TzlBde1HrMTsCWsK3TDJkjuM8yYpiKizhC74s4rJxwo1Yn/vCooOsxzlUjkx4URrtrQhZkVb1OVIFM4dsFeXA4q9OvOFMW3+kHr6kvPbHUwoZ6mrx0IZUzm+8Gg02oJfpDYSTDCjZ5nBmrtHyQ0gGz0cb+iId5VLuy6XC38UzU17fz6K8YKdXmSZpHpQHtPU4oDV5BSfnGyzRW5pIwZxyYkyqXUYWJ4h/ZSm1JUU1hebhaD9azvJa3e4hVKJxpzsKzAmJXS2FzJmjrBdW8Mx6njfKvc8cMX6d1y3Kvwox4IXQbDMet6eYgvKSYGh6AVDuj6HjfRaYxz+sfphX6klr9NTEpkDMh07UY2LLhlQZGk2CXatdV9ZiRtMHqjhaxlVzPoijGYxzBpdAdJEYHy5dh0OvDv8AyKr1G57uQl/QSnLBBEgrUgKDHO2pZic7E85ADfzXPetarL+R5cZD9FqxhTMp15Cjk03BZEJVmkN/kjyDM5NI1jIPHtWLKO/ENmXHBXkGRpwfYz5zvVPz+B2cinAHbqFeMtR6QtuR14QK8+dH02Mljh+SsTuQPa76v+hFOfw0sh41iGyPQzgPlAHTk3FzVE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(6133799003)(56012099006)(11063799006)(4143699003)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?yllE/cFDvVYHC8LGsSF5c34BNWcUKGfu6Avs3o9eRNtuqm9N1sc6iSntoQ?=
 =?iso-8859-1?Q?EggIYbgYZa3Cb0BAr/Xp1q7DmPmkCtf3apYajZVko93uE5IQZWcR13BoJQ?=
 =?iso-8859-1?Q?xafHEVc9+R5s8pScsBQdcAdy6Ik9jXy2sBxxCmOx9fhEyhsmPWyKB01Zw0?=
 =?iso-8859-1?Q?XnAsJWTOGqhIejBqZAVUidxFWMCvoGvAD7ZyNAuCDlLU1JLkp5Nr6Kb+wO?=
 =?iso-8859-1?Q?uubSI4RPGeBwL5VaOFKNkWp5ywlwcNBaUaoydKXI7/4v0JftlZn2sT1b76?=
 =?iso-8859-1?Q?O/NuqdOhhpEqBWvlLvK83dAQ6PYKH6hdLp2FNU0euL+5LZHqmIaDnSYQfP?=
 =?iso-8859-1?Q?P2pm2+DrgvkaRsmjcv0dBQEJKlWELn05MlY2gYthWG2+gadWYk8LdFhjcD?=
 =?iso-8859-1?Q?XE+fCBRwbwJ0vSt1IEDDxLeO1JH5bkXurfvMH0TTmtmb4FBeiQgDtZS7jB?=
 =?iso-8859-1?Q?m6WAJkLNazQ0EUrXBZoNZ42GoG+gGeCz1fLh2HmFgLau+v9+qZB6mTy+uY?=
 =?iso-8859-1?Q?DVybbro3lSOHfxW7RtvBni7h9zUIPQNT83Ge0meVmQNxOhU6tzspNVKz4U?=
 =?iso-8859-1?Q?JAhx6OQAEI8/MDPO5LXTPap9+8eEVsWKHyg2YCedWvlzcsbJq1yJojta9u?=
 =?iso-8859-1?Q?zMc2SxIGKeMii1ZNJhAltlwWmK7EePSfMic7IDA26xk3giCOAeF8S3/vsr?=
 =?iso-8859-1?Q?zN32xMvBSMZhIQozbTVR694d33WZKOYoJ5z6BZ3lU47Vnd1FWE9b/JRy9v?=
 =?iso-8859-1?Q?F0C8C4SSsg25r1iydKmWwK+KYxY37a2qchN6ixMNkmeVhTTqwMfbOLZB02?=
 =?iso-8859-1?Q?kOIOiz+S+8GHXsS0ExQF4mqa1pTtphaDj3dnkfTLV3D+Jz0nNWf1OXPmO4?=
 =?iso-8859-1?Q?rYjwFGDCTdVP3GSNu/jSRO97NqpmS6F7dJwl5/gar0uy27dtufFHju7Kov?=
 =?iso-8859-1?Q?I0QGlKwvsB2ksmsx7noy+mus3mBtzb6JnPUhgA2ToTfhQ2ZNvulv/fVJOp?=
 =?iso-8859-1?Q?bZCZHh/VdIiMGueTAugIpKGHIXAuIUXD03wYeUEQ7B9eCI2RToRY7gVdaS?=
 =?iso-8859-1?Q?8+QIYI6/6zhZX88GJN/V4+cwmCsIHXEyTI3/M0V09eISWc3iyZKldjiyLI?=
 =?iso-8859-1?Q?cl3KR1fIGleDUE0zsISbHD6sE+hjoeVSiAS9nG1HiqIOGd6+xFARyj7kcw?=
 =?iso-8859-1?Q?pENGj2orkViVa+7G9hF0I6ZuHgxBhwiwfXCXXDKVq1KxONRCV3plrctcSZ?=
 =?iso-8859-1?Q?cp0tqVPsGLE3EDIeYmBGG5sz2T0bWF7uTXeMSDbLjzBYmybLOEPDRnj3N1?=
 =?iso-8859-1?Q?Am9v9tUY4bK0voYABloY3w+QKm5OA/xFWLwvfu/E9f9QvRk5qon0u+79uy?=
 =?iso-8859-1?Q?cHbjUGABimhyA2Bn31weQSwZB+UdxQFKMMaj3qQxz22R4cylRV2K7ERb/H?=
 =?iso-8859-1?Q?rZAMnt13xJhgHeo1AS2382IBBoK9e+Vop0bc1tVlWlPy4vxLM4NIump7ty?=
 =?iso-8859-1?Q?+W7PHM361JMODvbaqOuxBdy84QYx2r/AWEf7+JTzQ8VkSDYVdvuTQytFyK?=
 =?iso-8859-1?Q?2WDxfXwzap+iqLZHyzQHEaZrMRjNO0GIQCzwNBU/cf2TkI20s6bOFX0T8+?=
 =?iso-8859-1?Q?FdDcVipLnbf8hrOxJcSORuWOdoQ+jtaeXqkeRPFf2GKS7YllHi83qsd7/t?=
 =?iso-8859-1?Q?X4t20SdhLsWueJ/xZoAT89i4LQ9VDdeOwt2XgX2nB8qQzc839Jd2LBMSDE?=
 =?iso-8859-1?Q?wn3y6X3jPk4hyEyy3dXezwkcwoDNonILwpsn3+9SglKEKy57EDJBb88HpO?=
 =?iso-8859-1?Q?6JPnqiIMDw=3D=3D?=
X-Exchange-RoutingPolicyChecked: Wbvq+K7qrwY5PLX5X92J3/DnWYGvwRM9Cjl2vtO/VACJU+YvV7myZcOqQRmDfXczQWaluHOfBrHse67+LUn9wWsOrftYv0HtX9nuj0XQNms+Ielpzh+498tTPSjNRASyArhaqKNJ5TMOWq90S1pMOjcI5ZPUhmyparEZWXPkrFd9L6dW9t2K/rxLM7IIv/+qkqpKJ9EGPaHOnSRHsl7VF7MqX37f00OhMH8mJ2p0Eqle2iK6MMZZnr1USxZoQvTkkUVyAN5AeQseaiNHMp1ReerB7Gzzy9oG8ILSGyKB5qhi7dpX7hjvbDgOoAcjcdHLlIeCFlNwCzT6byvzX7l37A==
X-MS-Exchange-CrossTenant-Network-Message-Id: b05f4e00-1fba-4657-e913-08deec143262
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 19:21:02.5022 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xlPp0UcbXm+6zTBq/WM+4Lls+f2bDw/BTUr6fDCbvqkgeAPR2qFekb+6ucYrYpqsYAX8FwYExatpCsLsrKgSqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6263
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

On Mon, Jul 27, 2026 at 06:41:22PM +0200, Francois Dugast wrote:
> On Fri, Jul 24, 2026 at 04:25:52PM -0700, Matthew Brost wrote:
> > The migrate_vma_* functions are very CPU-intensive; as a result,
> > prefetching SVM ranges is limited by CPU performance rather than paging
> > copy engine bandwidth. To accelerate SVM range prefetching, the step
> > that calls migrate_vma_* is now threaded. A dedicated prefetch
> > workqueue is used for threading so prefetch work is never mixed with
> > page fault or garbage collector work.
> > 
> > Running xe_exec_system_allocator --r prefetch-benchmark, which tests
> > 64MB prefetches, shows an increase from ~4.35 GB/s to 12.25 GB/s with
> > this patch on drm-tip. Enabling high SLPC further increases throughput
> > to ~15.25 GB/s, and combining SLPC with ULLS raises it to ~16 GB/s. Both
> > of these optimizations are upcoming.
> > 
> > Since the dedicated prefetch workqueue is not shared with page fault
> > or SVM garbage collector work, page fault servicing and garbage
> > collection can keep using a plain down_read() on vm->lock: there is no
> > risk of a blocked reader starving a worker that a pending writer is
> > waiting to flush, because that flushing is now confined to the
> > separate prefetch workqueue.
> > 
> > v2:
> >  - Use dedicated prefetch workqueue
> >  - Pick dedicated prefetch thread count based on profiling
> >  - Skip threaded prefetch for only 1 range or if prefetching to SRAM
> >  - Fully tested
> > v3:
> >  - Use page fault work queue
> > v4:
> >  - Go back to a dedicated prefetch workqueue (usm.prefetch_wq) rather
> >    than reusing the page fault workqueue (usm.pagefault_wq), so
> >    threaded prefetches and page fault / garbage collector work no
> >    longer contend for the same workqueue. This removes the need for
> >    down_read_trylock() based lock avoidance in the page fault and
> >    garbage collector paths.
> > 
> > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > Co-authored-by: Copilot <223556219+Copilot@users.noreply.github.com>
> > ---
> >  drivers/gpu/drm/xe/xe_device_types.h |   6 +-
> >  drivers/gpu/drm/xe/xe_pagefault.c    |  29 ++++--
> >  drivers/gpu/drm/xe/xe_svm.c          |   8 +-
> >  drivers/gpu/drm/xe/xe_svm.h          |   6 +-
> >  drivers/gpu/drm/xe/xe_vm.c           | 147 ++++++++++++++++++++-------
> >  drivers/gpu/drm/xe/xe_vm_types.h     |  15 +--
> >  6 files changed, 154 insertions(+), 57 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > index b8d1726c0513..159ee16ee6d5 100644
> > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > @@ -307,8 +307,10 @@ struct xe_device {
> >  		u32 current_pf_queue;
> >  		/** @usm.lock: protects UM state */
> >  		struct rw_semaphore lock;
> > -		/** @usm.pf_wq: page fault work queue, unbound, high priority */
> > -		struct workqueue_struct *pf_wq;
> > +		/** @usm.pagefault_wq: page fault work queue, unbound, high priority */
> > +		struct workqueue_struct *pagefault_wq;
> > +		/** @usm.prefetch_wq: threaded prefetch work queue, unbound */
> > +		struct workqueue_struct *prefetch_wq;
> >  		/*
> >  		 * We pick 4 here because, in the current implementation, it
> >  		 * yields the best bandwidth utilization of the kernel paging
> > diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
> > index 80196e874e06..fd7ef0718153 100644
> > --- a/drivers/gpu/drm/xe/xe_pagefault.c
> > +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> > @@ -303,8 +303,8 @@ static void xe_pagefault_queue_work(struct work_struct *w)
> >  
> >  		err = xe_pagefault_service(&pf);
> >  		if (err) {
> > -			xe_pagefault_save_to_vm(gt_to_xe(pf.gt), &pf);
> >  			if (!(pf.consumer.access_type & XE_PAGEFAULT_ACCESS_PREFETCH)) {
> > +				xe_pagefault_save_to_vm(gt_to_xe(pf.gt), &pf);
> >  				xe_pagefault_print(&pf);
> >  				xe_gt_info(pf.gt, "Fault response: Unsuccessful %pe\n",
> >  					   ERR_PTR(err));
> > @@ -318,7 +318,7 @@ static void xe_pagefault_queue_work(struct work_struct *w)
> >  		pf.producer.ops->ack_fault(&pf, err);
> >  
> >  		if (time_after(jiffies, threshold)) {
> > -			queue_work(gt_to_xe(pf.gt)->usm.pf_wq, w);
> > +			queue_work(gt_to_xe(pf.gt)->usm.pagefault_wq, w);
> >  			break;
> >  		}
> >  	}
> > @@ -376,7 +376,8 @@ static void xe_pagefault_fini(void *arg)
> >  {
> >  	struct xe_device *xe = arg;
> >  
> > -	destroy_workqueue(xe->usm.pf_wq);
> > +	destroy_workqueue(xe->usm.prefetch_wq);
> > +	destroy_workqueue(xe->usm.pagefault_wq);
> >  }
> >  
> >  /**
> > @@ -394,12 +395,20 @@ int xe_pagefault_init(struct xe_device *xe)
> >  	if (!xe->info.has_usm)
> >  		return 0;
> >  
> > -	xe->usm.pf_wq = alloc_workqueue("xe_page_fault_work_queue",
> > -					WQ_UNBOUND | WQ_HIGHPRI,
> > -					XE_PAGEFAULT_QUEUE_COUNT);
> > -	if (!xe->usm.pf_wq)
> > +	xe->usm.pagefault_wq = alloc_workqueue("xe_page_fault_work_queue",
> > +					       WQ_UNBOUND | WQ_HIGHPRI,
> > +					       XE_PAGEFAULT_QUEUE_COUNT);
> > +	if (!xe->usm.pagefault_wq)
> >  		return -ENOMEM;
> >  
> > +	xe->usm.prefetch_wq = alloc_workqueue("xe_prefetch_work_queue",
> > +					      WQ_UNBOUND,
> > +					      XE_PAGEFAULT_QUEUE_COUNT);
> > +	if (!xe->usm.prefetch_wq) {
> > +		err = -ENOMEM;
> > +		goto err_pagefault_wq;
> > +	}
> > +
> >  	for (i = 0; i < XE_PAGEFAULT_QUEUE_COUNT; ++i) {
> >  		err = xe_pagefault_queue_init(xe, xe->usm.pf_queue + i);
> >  		if (err)
> > @@ -409,7 +418,9 @@ int xe_pagefault_init(struct xe_device *xe)
> >  	return devm_add_action_or_reset(xe->drm.dev, xe_pagefault_fini, xe);
> >  
> >  err_out:
> > -	destroy_workqueue(xe->usm.pf_wq);
> > +	destroy_workqueue(xe->usm.prefetch_wq);
> > +err_pagefault_wq:
> > +	destroy_workqueue(xe->usm.pagefault_wq);
> >  	return err;
> >  }
> >  
> > @@ -495,7 +506,7 @@ int xe_pagefault_handler(struct xe_device *xe, struct xe_pagefault *pf)
> >  		memcpy(pf_queue->data + pf_queue->head, pf, sizeof(*pf));
> >  		pf_queue->head = (pf_queue->head + xe_pagefault_entry_size()) %
> >  			pf_queue->size;
> > -		queue_work(xe->usm.pf_wq, &pf_queue->worker);
> > +		queue_work(xe->usm.pagefault_wq, &pf_queue->worker);
> >  	} else {
> >  		drm_warn(&xe->drm,
> >  			 "PageFault Queue (%d) full, shouldn't be possible\n",
> > diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> > index cc36addb4f4f..6a470a02fee7 100644
> > --- a/drivers/gpu/drm/xe/xe_svm.c
> > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > @@ -148,7 +148,7 @@ xe_svm_garbage_collector_add_range(struct xe_vm *vm, struct xe_svm_range *range,
> >  			      &vm->svm.garbage_collector.range_list);
> >  	spin_unlock(&vm->svm.garbage_collector.list_lock);
> >  
> > -	queue_work(xe->usm.pf_wq, &vm->svm.garbage_collector.work);
> > +	queue_work(xe->usm.pagefault_wq, &vm->svm.garbage_collector.work);
> >  }
> >  
> >  static void xe_svm_tlb_inval_count_stats_incr(struct xe_gt *gt)
> > @@ -1051,6 +1051,7 @@ void xe_svm_range_migrate_to_smem(struct xe_vm *vm, struct xe_svm_range *range)
> >   * @tile_mask: Mask representing the tiles to be checked
> >   * @dpagemap: if !%NULL, the range is expected to be present
> >   * in device memory identified by this parameter.
> > + * @valid_pages: Pages are valid, result written back to caller
> >   *
> >   * The xe_svm_range_validate() function checks if a range is
> >   * valid and located in the desired memory region.
> > @@ -1059,7 +1060,8 @@ void xe_svm_range_migrate_to_smem(struct xe_vm *vm, struct xe_svm_range *range)
> >   */
> >  bool xe_svm_range_validate(struct xe_vm *vm,
> >  			   struct xe_svm_range *range,
> > -			   u8 tile_mask, const struct drm_pagemap *dpagemap)
> > +			   u8 tile_mask, const struct drm_pagemap *dpagemap,
> > +			   bool *valid_pages)
> >  {
> >  	bool ret;
> >  
> > @@ -1071,6 +1073,8 @@ bool xe_svm_range_validate(struct xe_vm *vm,
> >  	else
> >  		ret = ret && !range->pages.dpagemap;
> >  
> > +	*valid_pages = xe_svm_range_pages_valid(range);
> > +
> >  	xe_svm_notifier_unlock(vm);
> >  
> >  	return ret;
> > diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> > index 0d1f1107af5f..46be2e5c6f7f 100644
> > --- a/drivers/gpu/drm/xe/xe_svm.h
> > +++ b/drivers/gpu/drm/xe/xe_svm.h
> > @@ -134,7 +134,8 @@ void xe_svm_range_migrate_to_smem(struct xe_vm *vm, struct xe_svm_range *range);
> >  
> >  bool xe_svm_range_validate(struct xe_vm *vm,
> >  			   struct xe_svm_range *range,
> > -			   u8 tile_mask, const struct drm_pagemap *dpagemap);
> > +			   u8 tile_mask, const struct drm_pagemap *dpagemap,
> > +			   bool *valid_pages);
> >  
> >  u64 xe_svm_find_vma_start(struct xe_vm *vm, u64 addr, u64 end,  struct xe_vma *vma);
> >  
> > @@ -376,7 +377,8 @@ void xe_svm_range_migrate_to_smem(struct xe_vm *vm, struct xe_svm_range *range)
> >  static inline
> >  bool xe_svm_range_validate(struct xe_vm *vm,
> >  			   struct xe_svm_range *range,
> > -			   u8 tile_mask, bool devmem_preferred)
> > +			   u8 tile_mask, const struct drm_pagemap *dpagemap,
> > +			   bool *valid_pages)
> >  {
> >  	return false;
> >  }
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index d7e6644df4bc..7eed38b78e5f 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -2525,6 +2525,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
> >  			struct drm_pagemap *dpagemap = NULL;
> >  			u8 id, tile_mask = 0;
> >  			u32 i;
> > +			bool valid_pages;
> >  
> >  			if (xe_vma_is_userptr(vma))
> >  				vops->flags |= XE_VMA_OPS_FLAG_MODIFIES_GPUVA;
> > @@ -2569,9 +2570,11 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
> >  				goto unwind_prefetch_ops;
> >  			}
> >  
> > -			if (xe_svm_range_validate(vm, svm_range, tile_mask, dpagemap)) {
> > +			if (xe_svm_range_validate(vm, svm_range, tile_mask,
> > +						  dpagemap, &valid_pages)) {
> >  				xe_svm_range_debug(svm_range, "PREFETCH - RANGE IS VALID");
> >  				xe_svm_range_put(svm_range);
> > +				xe_assert(vm->xe, valid_pages);
> >  				goto check_next_range;
> >  			}
> >  
> > @@ -2586,6 +2589,8 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
> >  
> >  			op->prefetch_range.ranges_count++;
> >  			vops->flags |= XE_VMA_OPS_FLAG_HAS_SVM_PREFETCH;
> > +			if (valid_pages)
> > +				vops->flags |= XE_VMA_OPS_FLAG_HAS_SVM_VALID_RANGE;
> >  			xe_svm_range_debug(svm_range, "PREFETCH - RANGE CREATED");
> >  check_next_range:
> >  			if (range_end > xe_svm_range_end(svm_range) &&
> > @@ -3151,16 +3156,80 @@ static int check_ufence(struct xe_vma *vma)
> >  	return 0;
> >  }
> >  
> > -static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_op *op)
> > +struct prefetch_thread {
> > +	struct work_struct work;
> > +	struct drm_gpusvm_ctx *ctx;
> > +	struct xe_vma *vma;
> > +	struct xe_svm_range *svm_range;
> > +	struct drm_pagemap *dpagemap;
> > +	int err;
> > +};
> > +
> > +static void prefetch_thread_func(struct prefetch_thread *thread)
> > +{
> > +	struct xe_vma *vma = thread->vma;
> > +	struct xe_vm *vm = xe_vma_vm(vma);
> > +	struct xe_svm_range *svm_range = thread->svm_range;
> > +	struct drm_pagemap *dpagemap = thread->dpagemap;
> > +	int err = 0;
> > +
> > +	guard(mutex)(&svm_range->lock);
> > +
> > +	if (xe_svm_range_is_removed(svm_range))
> > +		return;
> > +
> > +	if (!dpagemap)
> > +		xe_svm_range_migrate_to_smem(vm, svm_range);
> > +
> > +	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG_VM)) {
> > +		drm_dbg(&vm->xe->drm,
> > +			"Prefetch pagemap is %s start 0x%016lx end 0x%016lx\n",
> > +			dpagemap ? dpagemap->drm->unique : "system",
> > +			xe_svm_range_start(svm_range), xe_svm_range_end(svm_range));
> > +	}
> > +
> > +	if (xe_svm_range_needs_migrate_to_vram(svm_range, vma, dpagemap)) {
> > +		err = xe_svm_alloc_vram(svm_range, thread->ctx, dpagemap);
> > +		if (err) {
> > +			drm_dbg(&vm->xe->drm, "VRAM allocation failed, retry from userspace, asid=%u, gpusvm=%p, errno=%pe\n",
> > +				vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
> > +			return;
> 
> We should set the error code like below with
> 
>     thread->err = err;
> 
> to propagate the error to user space.

So this was part an error handling fix - here this error occurs most
likely from racing CPU access and you don't want the error to be sent
back to user space, rather just don't commit the prefetch bind for the
affected range(s). Later in the pipeline should handle this but it
actually is 100% right there either as it will return -EAGAIN (retry,
possible livelock) or -ENODATA (squashes error in IOCTL, possible leak
in memory). Let me try fixing this part a bit better in a seperate patch
but this is all pre-existing issues actually so I don't think it worth
holding up the series.

Matt

> 
> Rest LGTM.
> 
> Francois
> 
> > +		}
> > +		xe_svm_range_debug(svm_range, "PREFETCH - RANGE MIGRATED TO VRAM");
> > +	}
> > +
> > +	err = xe_svm_range_get_pages(vm, svm_range, thread->ctx);
> > +	if (err) {
> > +		drm_dbg(&vm->xe->drm, "Get pages failed, asid=%u, gpusvm=%p, errno=%pe\n",
> > +			vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
> > +		if (err == -EOPNOTSUPP || err == -EFAULT || err == -EPERM)
> > +			err = 0;
> > +		thread->err = err;
> > +		return;
> > +	}
> > +	xe_svm_range_debug(svm_range, "PREFETCH - RANGE GET PAGES DONE");
> > +}
> > +
> > +static void prefetch_work_func(struct work_struct *w)
> > +{
> > +	struct prefetch_thread *thread =
> > +		container_of(w, struct prefetch_thread, work);
> > +
> > +	prefetch_thread_func(thread);
> > +}
> > +
> > +static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_ops *vops,
> > +			   struct xe_vma_op *op)
> >  {
> >  	bool devmem_possible = IS_DGFX(vm->xe) && IS_ENABLED(CONFIG_DRM_XE_PAGEMAP);
> >  	struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
> >  	struct drm_pagemap *dpagemap = op->prefetch_range.dpagemap;
> > -	int err = 0;
> > -
> >  	struct xe_svm_range *svm_range;
> >  	struct drm_gpusvm_ctx ctx = {};
> > +	struct prefetch_thread stack_thread, *thread, *prefetches;
> >  	unsigned long i;
> > +	int err = 0, idx = 0;
> > +	bool skip_threads;
> >  
> >  	if (!xe_vma_is_cpu_addr_mirror(vma))
> >  		return 0;
> > @@ -3170,42 +3239,49 @@ static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_op *op)
> >  	ctx.check_pages_threshold = devmem_possible ? SZ_64K : 0;
> >  	ctx.device_private_page_owner = xe_svm_private_page_owner(vm, !dpagemap);
> >  
> > -	/* TODO: Threading the migration */
> > -	xa_for_each(&op->prefetch_range.range, i, svm_range) {
> > -		guard(mutex)(&svm_range->lock);
> > -
> > -		if (xe_svm_range_is_removed(svm_range))
> > -			continue;
> > +	skip_threads =  op->prefetch_range.ranges_count == 1 ||
> > +		(!dpagemap && !(vops->flags &
> > +				XE_VMA_OPS_FLAG_HAS_SVM_VALID_RANGE)) ||
> > +		!(vops->flags & XE_VMA_OPS_FLAG_DOWNGRADE_LOCK);
> > +	thread = skip_threads ? &stack_thread : NULL;
> >  
> > -		if (!dpagemap)
> > -			xe_svm_range_migrate_to_smem(vm, svm_range);
> > +	if (!skip_threads) {
> > +		prefetches = kvmalloc_array(op->prefetch_range.ranges_count,
> > +					    sizeof(*prefetches), GFP_KERNEL);
> > +		if (!prefetches)
> > +			return -ENOMEM;
> > +	}
> >  
> > -		if (IS_ENABLED(CONFIG_DRM_XE_DEBUG_VM)) {
> > -			drm_dbg(&vm->xe->drm,
> > -				"Prefetch pagemap is %s start 0x%016lx end 0x%016lx\n",
> > -				dpagemap ? dpagemap->drm->unique : "system",
> > -				xe_svm_range_start(svm_range), xe_svm_range_end(svm_range));
> > +	xa_for_each(&op->prefetch_range.range, i, svm_range) {
> > +		if (!skip_threads) {
> > +			thread = prefetches + idx++;
> > +			INIT_WORK(&thread->work, prefetch_work_func);
> >  		}
> >  
> > -		if (xe_svm_range_needs_migrate_to_vram(svm_range, vma, dpagemap)) {
> > -			err = xe_svm_alloc_vram(svm_range, &ctx, dpagemap);
> > -			if (err) {
> > -				drm_dbg(&vm->xe->drm, "VRAM allocation failed, retry from userspace, asid=%u, gpusvm=%p, errno=%pe\n",
> > -					vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
> > -				return -ENODATA;
> > -			}
> > -			xe_svm_range_debug(svm_range, "PREFETCH - RANGE MIGRATED TO VRAM");
> > +		thread->ctx = &ctx;
> > +		thread->vma = vma;
> > +		thread->svm_range = svm_range;
> > +		thread->dpagemap = dpagemap;
> > +		thread->err = 0;
> > +
> > +		if (skip_threads) {
> > +			prefetch_thread_func(thread);
> > +			if (thread->err)
> > +				return thread->err;
> > +		} else {
> > +			queue_work(vm->xe->usm.prefetch_wq, &thread->work);
> >  		}
> > +	}
> >  
> > -		err = xe_svm_range_get_pages(vm, svm_range, &ctx);
> > -		if (err) {
> > -			drm_dbg(&vm->xe->drm, "Get pages failed, asid=%u, gpusvm=%p, errno=%pe\n",
> > -				vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
> > -			if (err == -EOPNOTSUPP || err == -EFAULT || err == -EPERM)
> > -				err = -ENODATA;
> > -			return err;
> > +	if (!skip_threads) {
> > +		for (i = 0; i < idx; ++i) {
> > +			thread = prefetches + i;
> > +
> > +			flush_work(&thread->work);
> > +			if (thread->err && !err)
> > +				err = thread->err;
> >  		}
> > -		xe_svm_range_debug(svm_range, "PREFETCH - RANGE GET PAGES DONE");
> > +		kvfree(prefetches);
> >  	}
> >  
> >  	return err;
> > @@ -3336,7 +3412,8 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
> >  	return err;
> >  }
> >  
> > -static int vm_bind_ioctl_ops_prefetch_ranges(struct xe_vm *vm, struct xe_vma_ops *vops)
> > +static int vm_bind_ioctl_ops_prefetch_ranges(struct xe_vm *vm,
> > +					     struct xe_vma_ops *vops)
> >  {
> >  	struct xe_vma_op *op;
> >  	int err;
> > @@ -3346,7 +3423,7 @@ static int vm_bind_ioctl_ops_prefetch_ranges(struct xe_vm *vm, struct xe_vma_ops
> >  
> >  	list_for_each_entry(op, &vops->list, link) {
> >  		if (op->base.op  == DRM_GPUVA_OP_PREFETCH) {
> > -			err = prefetch_ranges(vm, op);
> > +			err = prefetch_ranges(vm, vops, op);
> >  			if (err)
> >  				return err;
> >  		}
> > diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> > index 2f5f74fed9d2..68588b624212 100644
> > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > @@ -556,13 +556,14 @@ struct xe_vma_ops {
> >  	/** @pt_update_ops: page table update operations */
> >  	struct xe_vm_pgtable_update_ops pt_update_ops[XE_MAX_TILES_PER_DEVICE];
> >  	/** @flag: signify the properties within xe_vma_ops*/
> > -#define XE_VMA_OPS_FLAG_HAS_SVM_PREFETCH BIT(0)
> > -#define XE_VMA_OPS_FLAG_MADVISE          BIT(1)
> > -#define XE_VMA_OPS_ARRAY_OF_BINDS	 BIT(2)
> > -#define XE_VMA_OPS_FLAG_SKIP_TLB_WAIT	 BIT(3)
> > -#define XE_VMA_OPS_FLAG_ALLOW_SVM_UNMAP  BIT(4)
> > -#define XE_VMA_OPS_FLAG_MODIFIES_GPUVA	 BIT(5)
> > -#define XE_VMA_OPS_FLAG_DOWNGRADE_LOCK	 BIT(6)
> > +#define XE_VMA_OPS_FLAG_HAS_SVM_PREFETCH	BIT(0)
> > +#define XE_VMA_OPS_FLAG_MADVISE			BIT(1)
> > +#define XE_VMA_OPS_ARRAY_OF_BINDS		BIT(2)
> > +#define XE_VMA_OPS_FLAG_SKIP_TLB_WAIT		BIT(3)
> > +#define XE_VMA_OPS_FLAG_ALLOW_SVM_UNMAP		BIT(4)
> > +#define XE_VMA_OPS_FLAG_MODIFIES_GPUVA		BIT(5)
> > +#define XE_VMA_OPS_FLAG_DOWNGRADE_LOCK		BIT(6)
> > +#define XE_VMA_OPS_FLAG_HAS_SVM_VALID_RANGE	BIT(7)
> >  	u32 flags;
> >  #ifdef TEST_VM_OPS_ERROR
> >  	/** @inject_error: inject error to test error handling */
> > -- 
> > 2.34.1
> > 
