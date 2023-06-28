Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF00EEB64D7
	for <intel-xe@archiver.kernel.org>; Wed, 28 Jun 2023 19:09:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6742010E3A8;
	Wed, 28 Jun 2023 19:09:29 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8A4910E391
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Jun 2023 19:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687979366; x=1719515366;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Uhlhd9WFcdzxvUOUFPXYEeGVfmmS/sMs8pT5rMekGd0=;
 b=jutZjKISlNl9gMuY4Pg7OBmBaBzZc8p3mRRW2jZVv1h7+qH/H4x7H7F1
 rHKi2h5ew3G2RfEYEN2u5ASNH7T8rCPK03pAF8yArbWwvAB5ptxOrUIbq
 T4SfdzOEFEZPL5As+bJcqut8iDdgItzd+Fv1xFDu5LO6N78xh6/ABcWPF
 5O2fseqAeyetHVCu5h8BD5O8qDuxcX2Ec01jwuBSwH5YSZgu0ALheaL7C
 /m1OPzVk1qO9n6F4qBmwwMiO1H2jOKrCwBnU8ShIeTKCoIS7wXqhBchQ2
 F90JSZo2SxvgQxvaXED0/YVRnqwUQHkb3w61yViH/m0fPhOwVzQFgR99l Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="425606464"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; d="scan'208";a="425606464"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2023 12:09:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="717072262"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; d="scan'208";a="717072262"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga002.jf.intel.com with ESMTP; 28 Jun 2023 12:09:24 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 28 Jun 2023 12:09:23 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 28 Jun 2023 12:09:23 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.104)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 28 Jun 2023 12:09:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H0CME9PL1s/Lo3zQCm1JAbz22Ux9netJMI27aP/p1t9Nja7iUJjyKvVMqM5jOGSxv/YX3ByfQzwdc6HB6/3ipibjvAT/1vM2wP5eI9eVG82D2lpsGIB9jhLLRX70MdNzH3r3U4XfkSgBJ79WTUFwQj8utuEsqjrGtTTs7PZxIPusZCFOJocCIZEuGxCnrXRhPkG4cp10kqQfx3r7pV7BRkdBWNn4pC7LpAQPXnk1Z/ZWZ3gwO5fUeafnrtu9lMNAH1eKeau5gkhzU/ZbwxhNcX9YhqmZ54nYHfImJEN0da7zyqiHTUPh9N9htI1vMGd8rFNWkTFqDJhMOYAp+TX+CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=59GziK0VymvoQavm+jT6WxHbx9kNxn+KjK5w/kxTkNI=;
 b=EYKca0YM9I53RsMM84qNuONPLCMxlE3UXoI7DCaqtZuVFw1TYxiZg3Fi31uykAXfNMztJonyjPYIYHqQwPzR82kIWrwdC4fAqWN2rS+XUNWwQoKXwMxUpmHi0bvDWnT89tBjUgmL5O8NmBbmiMRwxoufiwwtoms1N5MuECoE++I6kM0EdaGFVRj9JC+7g7o2g/9BBxRzhBMsrXNQOlAsrGnHyS6GP+qgqTlLMtpSDNt5cmmlvpBKOihyoA+w6Y4QRRHDXJbcm3EsPNJejhTbB0jYTGYUUa2pm7dkrretFZegC5EwaBNmhJj5pRQHcS1UQF+3+TvuOoRcmfPx106Pkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA3PR11MB7436.namprd11.prod.outlook.com (2603:10b6:806:307::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Wed, 28 Jun
 2023 19:09:21 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%5]) with mapi id 15.20.6521.023; Wed, 28 Jun 2023
 19:09:21 +0000
Date: Wed, 28 Jun 2023 19:08:42 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <ZJyFOuFPTiETB2Vf@DUT025-TGLU.fm.intel.com>
References: <20230628125146.72041-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230628125146.72041-1-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SJ0PR05CA0193.namprd05.prod.outlook.com
 (2603:10b6:a03:330::18) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA3PR11MB7436:EE_
X-MS-Office365-Filtering-Correlation-Id: 9191d5c7-6435-4b74-d0b6-08db780b2deb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6es9TaMskeJnf50YH9zey1E16uyXR/49nuFl4C91ZNhqKngWXpZlgW9Ooycgm408hcYEmW5MoBiO4/x2+1IjN/k8IsuD2ewPZJ7BFSekcdQBwdN9pKkEEp+5GHCVndIn5gQzCvVN7joFH2FR1n/8mrVFK/+kXZ84pzZ9Zv5QojONtsI6WwvskcHrNMQiWYfR5hrbHWE4XWzqy7+Q46Sgp1IQ9dDXUpES2HQA7FY+o5K5lJdQjolIr2uP903LzBUb4CsxFjBkGpABfyDnmo5Hz3489mf/4ef+ubiWzD6iqybES5qlxT/tP9gXkVBnEnRl1+DJDrvnkkyMe66PzHfDk2ZlRtYaUXsj86dvSBSXlVZC4+vEcC7mx6cUOXbLUqu9/rGRqXxQSCtMdyvqAuQJbannJ3lvnrLqx2djFdqggUjfJ9B+DTm0iYZfx57S5igHMRbQRJQ3xpCskoKd/EdvFkbH5XlHQB4ceJD3qmcuLJn33KcMRVNvfC7CQaCiFw7wGpSx3n1xVYbf11IWTNW8Rop/nISIchx+zLzdZ5xE9f0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(136003)(366004)(39860400002)(376002)(346002)(451199021)(82960400001)(38100700002)(86362001)(66899021)(41300700001)(8676002)(6486002)(478600001)(44832011)(5660300002)(6506007)(8936002)(26005)(6512007)(186003)(66574015)(83380400001)(2906002)(316002)(4326008)(66946007)(66476007)(66556008)(6666004)(6916009);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?tM0zDrbJN+Muz+NgdtrzX2fM5kiINhunekh4P9J3xKtB7dounbtj7PwquE?=
 =?iso-8859-1?Q?JI6C8u4QdNK+j/cRbiaek9jpakQrIKA8aAzO0LnmYDamKyo3nsggXtQul7?=
 =?iso-8859-1?Q?Gar26Sab2zg0bPRFMR8HzFYuZ3ds/wjv2hQC3CIAbRhFfAucsWMeFRZzxs?=
 =?iso-8859-1?Q?8qXNVdxPs1ixBtV9bysgXkNTk9d+RbsrYnwTzLbpqtijfTm4Wpk1VchGcP?=
 =?iso-8859-1?Q?A7Vj97NGjAz/1etXysG6xVVlvrIkhigYhcMjTwgckd63M27iFlt4ijqKmm?=
 =?iso-8859-1?Q?REVFxhaIAPXKadlYWnEyuBjkOu3oPcqXCq2sMTlLGzFf0IhgXfSqsHqQ0Y?=
 =?iso-8859-1?Q?cb9tXvRVwd/5NX40i2CY9C6eX5y6eT3a6g9kqnO87JpjOtYfAjMDXAyRkA?=
 =?iso-8859-1?Q?fm+kEPJC8E64Wk+y56CFMKA2xhyTvbxKG4FLqKPyHfTPggix7OInSsAo7u?=
 =?iso-8859-1?Q?M6eSv9Lwa21KYkDnnSvgyIeG6968nz85h5UsTcv4/V1VQLpxsZN4fudvuU?=
 =?iso-8859-1?Q?cAgdpstR8XPWSS4/DF4//s+I76My/94LG3C6z2aRjQNGkTQFHM8r9GlWQ8?=
 =?iso-8859-1?Q?ja43yIGFHb7fHxocLD1j3SxjiBFZWgCDZ8wDprwu+fsVV/5jx2gHl0Ckxw?=
 =?iso-8859-1?Q?QUWasvTuV21VTHVC9BSj6yzL+SJrm8cm1LIEvXoY8F3lhW6v09FoWGSEqd?=
 =?iso-8859-1?Q?oDx6/RHha/EvOyH1Ic5Cxlx8G+EPV4flLpNZEdd7fkgq39BWWBGqdWdEM/?=
 =?iso-8859-1?Q?JJwnJHtdmPl/K4XLd0d1swCs+8NNFL91X5OeNdAG77b0cyWKMm9GlzQYrk?=
 =?iso-8859-1?Q?W2T53EgoUHt9xxu+Rj/mqd4uUcjyPv0pimieTJw70j6gNqLKhaAcRBIzJS?=
 =?iso-8859-1?Q?4jb2O9OfzLIL0o2oFnyvEjKSXi8e/nUrZEujn9q2Kb7gygALeqofDFfAJi?=
 =?iso-8859-1?Q?lWAx8OGX/prIyXwlDJl5TzYKxNd8XmGwcGW+aPvxwh4uxuNlBSjzMe+gzo?=
 =?iso-8859-1?Q?bCsLQzF3wYnWHxCpA+KfvpVzDhkBs0FV+AW7darAkJsdZmUtyqLujS+Oa8?=
 =?iso-8859-1?Q?GXeqmzGEByO5QMnApM1OFrEO2FVuztbIKzQc8vDMHSSb51iDLa+XBUaohj?=
 =?iso-8859-1?Q?vNN6v9SbNXgz73f/VPXzXsQV5saKGCdLGtCULImtZm7x8Y/9lGZq2Fqeqy?=
 =?iso-8859-1?Q?nGEle6BIlvRL/WjDrUAbOo7t9wZSx9Ff5+Ym5pOBFcx7r/EDmhP7RsHqID?=
 =?iso-8859-1?Q?x5stKjNVYq88Na6bXRwnocPIzBCv48d4vCoPz/jQwQeAXigdiEY4gG/PFM?=
 =?iso-8859-1?Q?3bZ9K4nfHtlkNd0mmR8CIe9JIwC3VIvShoukkrz5LfIj7IU5bv2FwYiwRf?=
 =?iso-8859-1?Q?FZDwyj3EGiOOCxIUr0aZH3Vcml9mgbHR92jO/p2Cs1r+r5bhlIN2X+XI6d?=
 =?iso-8859-1?Q?l59AMjrE313xfU9UWhUtTULm9CsShTr8db4yhY6wJZ65wW00Q4eCL6FsY3?=
 =?iso-8859-1?Q?v726SExVdvpXBBuA5XiS1piwMKpvkVCs3oltesAyIVITiTAymoJrZPaO3Z?=
 =?iso-8859-1?Q?ufAs6TLgG6GOwyRI4G/Y8ow/Tim2etyEE9FuPmWP9wV+ICO2PnKAJJXY/x?=
 =?iso-8859-1?Q?L++Rhcuz2Gl7rAwonq/All1S+aZjXMnulCksBNQEhz+FAU1c/QBr/GrA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9191d5c7-6435-4b74-d0b6-08db780b2deb
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2023 19:09:21.6193 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mJJaUM9c22g1uUNtWxLTBpYLt8AU0jVI8yC4VFAv8CnV/n2kFm5uz74sg8uf/1GpflAUDowWxxz3iDyPLT/I/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7436
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3] Documentation/gpu: Add a VM_BIND async
 draft document
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
Cc: intel-xe@lists.freedesktop.org, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Jun 28, 2023 at 02:51:46PM +0200, Thomas Hellström wrote:
> Add a motivation for and description of asynchronous VM_BIND operation
> 
> v2:
> - Fix typos (Nirmoy Das)
> - Improve the description of a memory fence (Oak Zeng)
> - Add a reference to the document in the Xe RFC.
> - Add pointers to sample uAPI suggestions
> v3:
> - Address review comments (Danilo Krummrich)
> - Formatting fixes
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Acked-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  Documentation/gpu/drm-vm-bind-async.rst | 150 ++++++++++++++++++++++++
>  Documentation/gpu/rfc/xe.rst            |   4 +-
>  2 files changed, 152 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/gpu/drm-vm-bind-async.rst
> 
> diff --git a/Documentation/gpu/drm-vm-bind-async.rst b/Documentation/gpu/drm-vm-bind-async.rst
> new file mode 100644
> index 000000000000..8f9e2d5c8f0f
> --- /dev/null
> +++ b/Documentation/gpu/drm-vm-bind-async.rst
> @@ -0,0 +1,150 @@
> +====================
> +Asynchronous VM_BIND
> +====================
> +
> +Nomenclature:
> +=============
> +
> +* ``VRAM``: On-device memory. Sometimes referred to as device local memory.
> +
> +* ``gpu_vm``: A GPU address space. Typically per process, but can be shared by
> +  multiple processes.
> +
> +* ``VM_BIND``: An operation or a list of operations to modify a gpu_vm using
> +  an IOCTL. The operations include mapping and unmapping system- or
> +  VRAM memory.
> +
> +* ``syncobj``: A container that abstracts synchronization objects. The
> +  synchronization objects can be either generic, like dma-fences or
> +  driver specific. A syncobj typically indicates the type of the
> +  underlying synchronization object.
> +
> +* ``in-syncobj``: Argument to a VM_BIND IOCTL, the VM_BIND operation waits
> +  for these before starting.
> +
> +* ``out-syncbj``: Argument to a VM_BIND_IOCTL, the VM_BIND operation
> +  signals these when the bind operation is complete.
> +
> +* ``memory fence``: A synchronization object, different from a dma-fence.
> +  A memory fence uses the value of a specified memory location to determine
> +  signaled status. A memory fence can be awaited and signaled by both
> +  the GPU and CPU. Memory fences are sometimes referred to as
> +  user-fences, and do not necessarily bey the dma-fence rule of
> +  signalling within a "reasonable amount of time". The kernel should
> +  thus avoid waiting for memory fences with locks held.
> +
> +* ``long-running workload``: A workload that may take more than the
> +  current stipulated dma-fence maximum signal delay to complete and
> +  which therefore needs to set the gpu_vm or the GPU execution context in
> +  a certain mode that disallows completion dma-fences.
> +
> +* ``exec function``: An exec function is a function that revalidates all
> +  affected vmas, submits a gpu command batch and registers the
> +  dma_fence representing the gpu command's activity with all affected
> +  dma_resvs. For completeness, although not covered by this document,
> +  it's worth mentioning that an exec function may also be the
> +  revalidation worker that is used by some drivers in compute /
> +  long-running mode.
> +
> +* ``bind context``: A context identifier used for the VM_BIND
> +  operation. VM_BIND operations that use the same bind context can be
> +  assumed, where it matters, to complete in order of submission. No such
> +  assumptions can be made for VM_BIND operations using separate bind contexts.
> +
> +* ``UMD``: User-mode driver.
> +
> +* ``KMD``: Kernel-mode driver.
> +
> +
> +Synchronous / Asynchronous VM_BIND operation
> +============================================
> +
> +Synchronous VM_BIND
> +___________________
> +With Synchronous VM_BIND, the VM_BIND operations all complete before the
> +IOCTL returns. A synchronous VM_BIND takes neither in-fences nor
> +out-fences. Synchronous VM_BIND may block and wait for GPU operations;
> +for example swapin or clearing, or even previous binds.
> +
> +Asynchronous VM_BIND
> +____________________
> +Asynchronous VM_BIND accepts both in-syncobjs and out-syncobjs. While the
> +IOCTL may return immediately, the VM_BIND operations wait for the in-syncobjs
> +before modifying the GPU page-tables, and signal the out-syncobjs when
> +the modification is done in the sense that the next exec function that
> +awaits for the out-syncobjs will see the change. Errors are reported
> +synchronously assuming that the asynchronous part of the job never errors.
> +In low-memory situations the implementation may block, performing the
> +VM_BIND synchronously, because there might not be enough memory
> +immediately available for preparing the asynchronous operation.
> +
> +If the VM_BIND IOCTL takes a list or an array of operations as an argument,
> +the in-syncobjs needs to signal before the first operation starts to
> +execute, and the out-syncobjs signal after the last operation
> +completes. Operations in the operation list can be assumed, where it
> +matters, to complete in order.
> +
> +To aid in supporting user-space queues, the VM_BIND may take a bind context.
> +
> +The purpose of an Asynchronous VM_BIND operation is for user-mode
> +drivers to be able to pipeline interleaved gpu_vm modifications and
> +exec functions. For long-running workloads, such pipelining of a bind
> +operation is not allowed and any in-fences need to be awaited
> +synchronously.

Why? I think in Xe we allow in-fences for LR workloads + pipelining.

Matt

> +
> +Also for VM_BINDS for long-running gpu_vms the user-mode driver should typically
> +select memory fences as out-fences since that gives greater flexibility for
> +the kernel mode driver to inject other  operations into the bind /
> +unbind operations. Like for example inserting breakpoints into batch
> +buffers. The workload execution can then easily be pipelined behind
> +the bind completion using the memory out-fence as the signal condition
> +for a gpu semaphore embedded by UMD in the workload.
> +
> +Multi-operation VM_BIND IOCTL error handling and interrupts
> +===========================================================
> +
> +The VM_BIND operations of the IOCTL may error due to lack of resources
> +to complete and also due to interrupted waits. In both situations UMD
> +should preferably restart the IOCTL after taking suitable action. If
> +UMD has overcommitted a memory resource, an -ENOSPC error will be
> +returned, and UMD may then unbind resources that are not used at the
> +moment and restart the IOCTL. On -EINTR, UMD should simply restart the
> +IOCTL and on -ENOMEM user-space may either attempt to free known
> +system memory resources or abort the operation. If aborting as a
> +result of a failed operation in a list of operations, some operations
> +may still have completed, and to get back to a known state, user-space
> +should therefore attempt to unbind all virtual memory regions touched
> +by the failing IOCTL.
> +Unbind operations are guaranteed not to cause any errors due to
> +resource constraints.
> +In between a failed VM_BIND IOCTL and a successful restart there may
> +be implementation defined restrictions on the use of the gpu_vm. For a
> +description why, please see `KMD implementation details`_ under [error
> +state saving]_.
> +
> +Sample uAPI implementations
> +===========================
> +Suggested uAPI implementations at the moment of writing can be found for
> +the Nouveau driver `here
> +<https://patchwork.freedesktop.org/patch/543260/?series=112994&rev=6>`_.
> +and for the Xe driver `here
> +<https://cgit.freedesktop.org/drm/drm-xe/diff/include/uapi/drm/xe_drm.h?h=drm-xe-next&id=9cb016ebbb6a275f57b1cb512b95d5a842391ad7>`_.
> +
> +KMD implementation details
> +==========================
> +
> +Open: When the VM_BIND IOCTL returns an error, some or even parts of
> +an operation may have been completed. If the IOCTL is restarted, in
> +order to know where to restart, the KMD can either put the gpu_vm in
> +an error state and save one instance of the needed restart state
> +internally. In this case, KMD needs to block further modifications of
> +the gpu_vm state that may cause additional failures requiring a
> +restart state save, until the error has been fully resolved. If the
> +uAPI instead defines a pointer to a UMD allocated cookie in the IOCTL
> +struct, it could also choose to store the restart state in that cookie.
> +
> +The restart state may, for example, be the number of successfully
> +completed operations.
> +
> +Easiest for UMD would of course be if KMD did a full unwind on error
> +so that no error state needs to be saved.
> diff --git a/Documentation/gpu/rfc/xe.rst b/Documentation/gpu/rfc/xe.rst
> index 2516fe141db6..0f062e1346d2 100644
> --- a/Documentation/gpu/rfc/xe.rst
> +++ b/Documentation/gpu/rfc/xe.rst
> @@ -138,8 +138,8 @@ memory fences. Ideally with helper support so people don't get it wrong in all
>  possible ways.
>  
>  As a key measurable result, the benefits of ASYNC VM_BIND and a discussion of
> -various flavors, error handling and a sample API should be documented here or in
> -a separate document pointed to by this document.
> +various flavors, error handling and sample API suggestions are documented in
> +Documentation/gpu/drm-vm-bind-async.rst
>  
>  Userptr integration and vm_bind
>  -------------------------------
> -- 
> 2.40.1
> 
