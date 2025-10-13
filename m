Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A321BCCD183
	for <intel-xe@archiver.kernel.org>; Mon, 13 Oct 2025 16:10:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 621DF10E466;
	Mon, 13 Oct 2025 16:10:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dUn/rs6G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6C5410E466
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Oct 2025 16:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760371827; x=1791907827;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=jE4MTXdUbx9QNXu70bY6L856W9Lg7/XTJtUvgQGc1zs=;
 b=dUn/rs6GSHddNBUOhrzpaM6l/nJUJQosQN1NlpmavDB84v9yoZkfYrkX
 wESqWkSYeNwQpvB6w7l1cQGRvS8bBbIhUQ+5KyVhXF/pLZWYRHfD3zMLi
 EqILdV+e8R0lF1tkHyU7vPaV3oOSCfZmhnJTC+U7+1NRs+7RysOF6GrNF
 g6XldtD9jkaREX0yeOAeJlrHNf5CIZnwWCpWZc/Tuhl/p80hH8IIEXt3z
 KufNyEl17jYXnIXRzSR5sr2wS9XaWAmf17lxa/MycAvPpnL2Ajtkl5VDO
 BRYNIJh0rXA5Pqm2XHQVuNkh7xg9c/T98yjKTfVhdWQQnfcZrWS3FJvz8 Q==;
X-CSE-ConnectionGUID: uMbpMu+iRhqNi53a72Z5ww==
X-CSE-MsgGUID: tW2T0Pm8TGGAUAvrUDKXTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="80153174"
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; d="scan'208";a="80153174"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 09:10:25 -0700
X-CSE-ConnectionGUID: ChWwM1YqQO2Xg9t+yhFtRg==
X-CSE-MsgGUID: TBjelytRSdaPUrAy1oB1HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; d="scan'208";a="182075385"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 09:10:25 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 09:10:24 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 13 Oct 2025 09:10:24 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.59) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 09:10:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dl4aar+kZHoMGqYCJ0vhLzGbSCVZfnxt8RFrAkpT0d/PiTWzcNLzYjK4qMJNIDWSDAZv3fPWdN8Uy8g+hNAZ8SLnck5S9QkZocCyo2KHAzRDu44rT1Eve+nJi9uKggWDzwnNAXIpR7JEvvOGVTPH/ATCpbMptwhSX6BGxs0y0IboqH8TpHcbnLr2jQj9BH1t2DjiK+ZNjncfld567zfc4fIi4Uua3J3hg4NrA4Gv31+QT/853M6NtrzN3od+/YHn1aRInqlShmKbqT5pOFhvAnPzuaK78w0f06t2KQa/MpCjAND0sA2rHTTHFs1sEy/ndPBUDgSNbdVoE5xNwUM/fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C3/ZHTf4RGSQe15CFwvsRIOpDRYLbHpJRCx7xaW2J84=;
 b=SniE3X6E/SJpG5nyfIO+LMBf4uQ0TBk5aVhT7HY4lqP70ea3jzJ1RnpQyB62unQNhsc/izIR7p/NfJjlikNrhCKFaHjjIU3REie7HgUR+Sl8GlWWKKFjfqlAgbFIc5mqCChX0k8WqZ0nmy0NJoXwVyksSS5ao01VQntmBfsRCNyCT/hUMoDL2+qAgM1RgSQdslYcIFnIi4LSiTJfNkON4ET7qjyoqJRRwvIpN3hnNrqf4gcs6SBxPzTVNiSYieEkkVIvtGEBVut2CZ/aqm97FvBGZWguPrh2lavU7NsaxgmBv41N5P1R/nub/epkQC/cCkS26u2rqO/TYY6T4Je+DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by DM4PR11MB5263.namprd11.prod.outlook.com (2603:10b6:5:38a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Mon, 13 Oct
 2025 16:10:22 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%5]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 16:10:21 +0000
Date: Mon, 13 Oct 2025 09:10:18 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Nitin Gote <nitin.r.gote@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.auld@intel.com>,
 <thomas.hellstrom@intel.com>
Subject: Re: [PATCH v2 3/3] drm/xe: implement VM_BIND decompression in
 vm_bind_ioctl
Message-ID: <aO0kal4XbxtdJGki@lstrano-desk.jf.intel.com>
References: <20251013144850.757438-1-nitin.r.gote@intel.com>
 <20251013144850.757438-4-nitin.r.gote@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251013144850.757438-4-nitin.r.gote@intel.com>
X-ClientProxiedBy: MW4PR03CA0234.namprd03.prod.outlook.com
 (2603:10b6:303:b9::29) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|DM4PR11MB5263:EE_
X-MS-Office365-Filtering-Correlation-Id: dcea341f-58a8-443f-6f45-08de0a7302c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sbSHofbR1ipQymrJFlbsatHliP9SnVCGRoIXnr/UNRtdCYJ3CN+gv1kfzqWc?=
 =?us-ascii?Q?ASTppsSlb20IRaMLGNvzwLj3NvcQnXb7lMFp9b3h9Zrbmyk+t++ihy4DB9mc?=
 =?us-ascii?Q?bvR20tq0xNqjJxp/lKmoleJHN6vKe9PUNO8J5I5nRMWNHKbx6lDmG2soFx73?=
 =?us-ascii?Q?2rFroYoA/61vFlBaWpMB+YxOOnQjr27oo2FGrKsm5TaSTH1bsL7YE0yJ2emH?=
 =?us-ascii?Q?KY9rVuS0li7Bjh7LIWotgx7I+AbUsL/RrJHbGh1SQaY6MsAx28JLKZvRkYzg?=
 =?us-ascii?Q?/W6yY0E7sCAxrX/TDRuza+Pse9i5rJ/ZWHohNqyZIUq0L4U70Fy8JdO/2llN?=
 =?us-ascii?Q?EvNDVIWzxl+nTUBdF9hPn5k7kdiEsaU58VZntLHeY+lDxTzi+ZKvPxhol3rX?=
 =?us-ascii?Q?02cWoovGx11185lIz3/jWJlhgpRZCUtPiJMWvfUWECL3d83g1kB+ieVMcpEJ?=
 =?us-ascii?Q?QDyCUAGz+gPCe56lS/18WatREm9cK6hRblGn8lOrRJf3WuN9k559eGyNVIAR?=
 =?us-ascii?Q?JmO9yp46ziYbH5tvLw7GqFGP5yT10SYivLHg2cce54JHJLSKlHl15r7lIoFY?=
 =?us-ascii?Q?LK/+uK64ujWUU2KeBln0D9lvpZN29pUxQ1P1wPVdTe1ogEzKltl11SQLeczs?=
 =?us-ascii?Q?H9H8/Ui9uzyJ2lVZ6EW8s7QMwVciJoDjDDv6ZrfYiezzCWDy0v3zZBI1RGcJ?=
 =?us-ascii?Q?9E0IQs+4jkzPxXHX7PQC48xwtDWPv3AtPwHnI8NA273Rh/cGnI6hp6SXwqq1?=
 =?us-ascii?Q?ZISfdwcNSHfO2mVt3ipXlFBpQkhVMp3bKj6uL3CQU7pgN5pRrC7GOn39bAjM?=
 =?us-ascii?Q?G17g11/H0rbU9uREL9seSlMjHKO0R2J6Nr7puCVJJJUlmgw2qVX7MomFrq5u?=
 =?us-ascii?Q?KeLnzcZqfc9KVK4rR07e+vPYeRKQ4vT4BqXDr+GcL33otJkDo/kwfReY6fA6?=
 =?us-ascii?Q?SHvP8HN15hjqCwNG3OZDtZ3HCGs9Usb1SmAMGp/2Y5gbu/5QDC6F1GHjJwgb?=
 =?us-ascii?Q?40decEzTIKSzRD9t+eJToncY9FfHS2m6UWHBBkyWA5WEzZsP/cRt2JyH5CB9?=
 =?us-ascii?Q?6mAdulpcUQIZdKu9o8csIlXrO4gbYbignA2IaxigxKPdo/dn9DV+gZyubVz6?=
 =?us-ascii?Q?aJLfwY/YIXWTUpYYhcWHlRwB8Xkry3Ev3r4zRwAdSYPRKiS0feL8zovS+Tqn?=
 =?us-ascii?Q?7vi1czr4e9c6L99TVgBpcfViLo5VFlYDNTKQhpchOfTYR30zqD17LulV6jSh?=
 =?us-ascii?Q?lbzxAoKtzNjiTYSEigIERccnwfBaFsuPJLsNiKaGQArFveB4yhZOJPSdm89U?=
 =?us-ascii?Q?VyeQPifx+YbMHgya7NcYJNzYJOCPppzUfkJ/Ra84vHLf5S9/XmbttA+g1xaR?=
 =?us-ascii?Q?L8njvHeL7CzNO7/lZ/PO6+B4rlQG2UdkRZfwHM0pk8d66iER5CDlBoRK2sVr?=
 =?us-ascii?Q?1SDTmOZNQF8nHDLJJGsruYxTKjScdse5?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Dn5p+Oy+KwRmf7KOVumr3AnZqer5AF1MbYDg+uJHiVLWpj4Co3dqpMUmTSBc?=
 =?us-ascii?Q?/mCA/110OqeMfIkpCin2EihKRTc5tn5F8HU17LFiebcIivmADYM5negNiShs?=
 =?us-ascii?Q?oeSQZDEmbi5YIs0W9EGw6TUXKyOCGEzDBqUqPj1cM2VLU5oKoooOCl22x6rP?=
 =?us-ascii?Q?2rEJWJYbj2SJtwV72R6AgXL6kv/FDu2MPXaQrXr6//eSAWhFczn1AEcKrf6j?=
 =?us-ascii?Q?pAzYF/hw2gFeNW2gR0hBzggL28sCKohSw90dtLb7E8JAAbndfKMLTaF2V67e?=
 =?us-ascii?Q?riinX9Yiq5ueoiRX0FeXNUAhDPg5IbaddbzVU73zA8mdRE7z5IWL3p+hUGqw?=
 =?us-ascii?Q?F2qsB4eZufynh6svxX9RhAQWhT/T15m1p0fMtHyeQhZQwTn73/4xK0n0c25i?=
 =?us-ascii?Q?Xz7cJgl1AJbvyr8e6vg0g+NPgOK8kn9Nys29ZZZxTvw7eFZ5S+wE1GW40L5a?=
 =?us-ascii?Q?KvOLNgINLoDXFP6hhfLAcGUm8uLmcNOOVUbRUDzpw4T84lzhl3Gna4uX3cQI?=
 =?us-ascii?Q?D35AXAQGKvjurbbqxuVSi3BGHEYZmZK6UPBX1vxHbm6TZ5UctCezZwqmnUXl?=
 =?us-ascii?Q?G0v8rdWC3XL5jntAEnxj+5E4qDJ7V/BtwUXiegwJwiROXHjYkfuUINxF3iCi?=
 =?us-ascii?Q?aihs42sLuHzWpgt0+tFK3Roi/l0ZUtDTHncFTbwZVT8KHq2KSuqmVuOY+WKS?=
 =?us-ascii?Q?b+m7WAiCl3eUb/bgif89aKuhTt69LePQBvCty6jCUJt4/bgOAQjMAdeAjqWT?=
 =?us-ascii?Q?E0DimXUL6aZHOF3EYpH7aC3O9vLOe1IPJAZw2wXOxm2lQ/ZfkptwCNlRZNqN?=
 =?us-ascii?Q?gesH6vXYEPEgIdecHhyYxwN12x4g9wRqlmqIA/ghEl7aM+mccUswtJk3izqW?=
 =?us-ascii?Q?ddEIGwLPXtmnX4NIzWjge294U8K5kWnJQT4PU9Hh2LOlBtoAdlq7nUGCPzOg?=
 =?us-ascii?Q?Z4NiXTHM7frVwXhXZm8PdKVcdh8d4L1KFCVcqc740MswhPTBW/nBHfqg3j0G?=
 =?us-ascii?Q?Pr20YNghJtCW7DjjDpzwfFcU6UCSTGYeOiAbG8PUKRaRQLO73f2IABGR7ckw?=
 =?us-ascii?Q?f0+RGP7DB14e9p6z7EO/vgpbit5Sw64wGwd80XEUOydXwrT/XogyMunsA/pv?=
 =?us-ascii?Q?7Ze35Yek1PjYV4nCrl2+/TF3D7V4ZmGhJD0kNwFfhWFJPTZWOH7yxwqKl7l5?=
 =?us-ascii?Q?aQkKNXX/oxsefEtRx+uxllqdZ8QXoweakPKlqfZYlPMhrbBS+iwTZYF/ZBDK?=
 =?us-ascii?Q?Kk7sy8sMMJJJEi+igq32fF1OdohLKr/UNC/3MxQYVW7vCmkst0xaSIRMPnzd?=
 =?us-ascii?Q?I78GTiraHaAMT4+Ppi3XsnLhh0jJeqNj3VmGNP2vUBGTBgdI90WEAGhalQ2+?=
 =?us-ascii?Q?70ceChm3FD1P80DQNa8NDuB8XL/jgwOswek/ZHxqj5DXBNFmsp8KXqtnrgPP?=
 =?us-ascii?Q?AcgkbP4fUe5q9M3xXUP+1jsi92ZBeU0tAh4tddC9ro2APUFZB5tQTprVftwh?=
 =?us-ascii?Q?bPg7F6zykM8on7r1j5Cvvcs6yUAYGqBMC6nf746KvyGiv8ymivh7/Sdsqhmp?=
 =?us-ascii?Q?jrDDbmKUfjrJwi7FFOTfGrJ4vIZD16w8IrVbDCbbOY3gRJj/fQEJRa8fbcqP?=
 =?us-ascii?Q?fA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dcea341f-58a8-443f-6f45-08de0a7302c1
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 16:10:21.8848 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EsFA1zOZq3io3A+CL4zJLQVZlXCevnFsjX8ky8EFd5Q8DO6cE8uJUqNB8b4x/1mUk52PmACkY8lLR5TfzXWR3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5263
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

On Mon, Oct 13, 2025 at 08:18:50PM +0530, Nitin Gote wrote:
> Implement handling of VM_BIND(..., DECOMPRESS) in xe_vm_bind_ioctl.
> 
> Key changes:
> - Parse and record per-op intent (op->map.request_decompress) when the
>   DECOMPRESS flag is present.
> - Validate DECOMPRESS preconditions in the ioctl path:
>   - Only valid for MAP ops.
>   - The provided pat_index must select the device's "no-compression" PAT.
>   - Only meaningful for VRAM-backed BOs on devices with flat CCS and the
>     required XE2+ hardware (reject with -EOPNOTSUPP otherwise).
>   - Use XE_IOCTL_DBG for uAPI sanity checks.
> - Implement xe_bo_schedule_decompress():
>   - Locate and invalidate any overlapping VMA.
>   - Schedule an in-place resolve via the migrate/resolve path.
>   - Install the resulting dma_fence into the BO's kernel reservation
>     (DMA_RESV_USAGE_KERNEL).
> - Wire scheduling into vma_lock_and_validate() so VM_BIND will schedule
>   decompression when request_decompress is set.
> - Handle fault-mode VMs by performing decompression synchronously during
>   the bind process, ensuring that the resolve is completed before the bind
>   finishes.
> 
> This schedules an in-place GPU resolve (xe_migrate_resolve) for
> decompression.
> 
> v2:
>    - Move decompression work out of vm_bind ioctl. (Matt)
>    - Put that work in a small helper at the BO/migrate layer invoke it
>      from vma_lock_and_validate which already runs under drm_exec.
>    - Move lightweight checks to vm_bind_ioctl_check_args (Matthew Auld)
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.c       | 53 ++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_bo.h       |  3 ++
>  drivers/gpu/drm/xe/xe_vm.c       | 48 ++++++++++++++++++++---------
>  drivers/gpu/drm/xe/xe_vm_types.h |  2 ++
>  4 files changed, 92 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 7b6502081873..e9b28c8462c6 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -3307,6 +3307,59 @@ int xe_gem_mmap_offset_ioctl(struct drm_device *dev, void *data,
>  	return 0;
>  }
>  
> +/**
> + * xe_bo_schedule_decompress - schedule in-place decompress and install fence
> + * @bo:   buffer object (caller should hold drm_exec reservations for VM+BO)
> + * @vm:   VM containing the VMA range
> + * @addr: start GPU virtual address of the range
> + * @range:length in bytes of the range
> + *
> + * Schedules an in-place resolve via the migrate layer and installs the
> + * returned dma_fence into the BO kernel reservation slot (DMA_RESV_USAGE_KERNEL).
> + * Returns 0 on success, negative errno on error.
> + */
> +int xe_bo_schedule_decompress(struct xe_bo *bo, struct xe_vm *vm,

s/xe_bo_schedule_decompress/xe_bo_decompress

> +			      u64 addr, u64 range)

The caller has the VMA, just pass it in rather than looking it up here
but I don't even this the VMA is needed - more on that below.

> +{
> +	struct xe_tile *tile = xe_device_get_root_tile(vm->xe);
> +	struct xe_vma *existing_vma = NULL;
> +	struct dma_fence *decomp_fence = NULL;
> +	int err = 0;
> +
> +	/* Validate buffer is VRAM-backed  */
> +	if (!bo->ttm.resource || !mem_type_is_vram(bo->ttm.resource->mem_type)) {
> +		drm_err(&vm->xe->drm, "Decompression requires VRAM buffer\n");
> +		return -EINVAL;
> +	}

I think we should just slightly skip the decrompress step if the BO
isn't in VRAM. It is possible we have evicted the BO system memory
already behind the user and decrompression isn't required then.

> +
> +	/* Find overlapping VMA */
> +	existing_vma = xe_vm_find_overlapping_vma(vm, addr, range);
> +	if (existing_vma) {

See above a lookup isn't required as the caller has the VMA already. 

> +		drm_dbg(&vm->xe->drm,
> +			"Found overlapping VMA - automatic invalidation will occur\n");
> +
> +		/* Invalidate the VMA */
> +		err = xe_vm_invalidate_vma(existing_vma);

xe_vm_invalidate_vma is only valid on faulting VM. I think you want to
call xe_bo_move_notify here as that will do all the correct things wrt
to invalidtaions.

> +		if (err)
> +			return err;
> +	}
> +
> +	/* Schedule the in-place decompression */
> +	decomp_fence = xe_migrate_resolve(tile->migrate,
> +					  bo, bo,
> +					  bo->ttm.resource, bo->ttm.resource,
> +					  false);
> +
> +	if (IS_ERR(decomp_fence))
> +		return PTR_ERR(decomp_fence);
> +
> +	/* Install kernel-usage fence */
> +	dma_resv_add_fence(bo->ttm.base.resv, decomp_fence, DMA_RESV_USAGE_KERNEL);

I believe you need to call dma_resv_reserve_fences before
xe_migrate_resolve to ensure dma_resv_add_fence will succeed.

> +	dma_fence_put(decomp_fence);
> +
> +	return 0;
> +}
> +
>  /**
>   * xe_bo_lock() - Lock the buffer object's dma_resv object
>   * @bo: The struct xe_bo whose lock is to be taken
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index 353d607d301d..b5dd8630cde5 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -308,6 +308,9 @@ int xe_bo_dumb_create(struct drm_file *file_priv,
>  
>  bool xe_bo_needs_ccs_pages(struct xe_bo *bo);
>  
> +int xe_bo_schedule_decompress(struct xe_bo *bo, struct xe_vm *vm,
> +			      u64 addr, u64 range);
> +
>  static inline size_t xe_bo_ccs_pages_start(struct xe_bo *bo)
>  {
>  	return PAGE_ALIGN(xe_bo_size(bo));
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 179758ca7cb8..32bc6d899c36 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2304,6 +2304,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
>  			op->map.is_cpu_addr_mirror = flags &
>  				DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR;
>  			op->map.dumpable = flags & DRM_XE_VM_BIND_FLAG_DUMPABLE;
> +			op->map.request_decompress = flags & DRM_XE_VM_BIND_FLAG_DECOMPRESS;
>  			op->map.pat_index = pat_index;
>  			op->map.invalidate_on_bind =
>  				__xe_vm_needs_clear_scratch_pages(vm, flags);
> @@ -2858,7 +2859,7 @@ static void vm_bind_ioctl_ops_unwind(struct xe_vm *vm,
>  }
>  
>  static int vma_lock_and_validate(struct drm_exec *exec, struct xe_vma *vma,
> -				 bool res_evict, bool validate)
> +				 bool res_evict, bool validate, bool request_decompress)

We have to many bool here but can clean this up in a follow up.

>  {
>  	struct xe_bo *bo = xe_vma_bo(vma);
>  	struct xe_vm *vm = xe_vma_vm(vma);
> @@ -2871,6 +2872,17 @@ static int vma_lock_and_validate(struct drm_exec *exec, struct xe_vma *vma,
>  			err = xe_bo_validate(bo, vm,
>  					     !xe_vm_in_preempt_fence_mode(vm) &&
>  					     res_evict, exec);
> +
> +		if (err)
> +			return err;
> +
> +		if (request_decompress) {
> +			int ret = xe_bo_schedule_decompress(bo, vm,
> +							    xe_vma_start(vma),
> +							    xe_vma_size(vma));

As stated above, start / size are not needed.

> +			if (ret)
> +				return ret;
> +		}


I'd write this like:

if (request_decompress)
	err = xe_bo_schedule_decompress(...))

>  	}
>  
>  	return err;
> @@ -2958,7 +2970,8 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
>  			err = vma_lock_and_validate(exec, op->map.vma,
>  						    res_evict,
>  						    !xe_vm_in_fault_mode(vm) ||
> -						    op->map.immediate);
> +						    op->map.immediate,
> +						    op->map.request_decompress);
>  		break;
>  	case DRM_GPUVA_OP_REMAP:
>  		err = check_ufence(gpuva_to_vma(op->base.remap.unmap->va));
> @@ -2967,13 +2980,13 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
>  
>  		err = vma_lock_and_validate(exec,
>  					    gpuva_to_vma(op->base.remap.unmap->va),
> -					    res_evict, false);
> +					    res_evict, false, false);
>  		if (!err && op->remap.prev)
>  			err = vma_lock_and_validate(exec, op->remap.prev,
> -						    res_evict, true);
> +						    res_evict, true, false);
>  		if (!err && op->remap.next)
>  			err = vma_lock_and_validate(exec, op->remap.next,
> -						    res_evict, true);
> +						    res_evict, true, false);
>  		break;
>  	case DRM_GPUVA_OP_UNMAP:
>  		err = check_ufence(gpuva_to_vma(op->base.unmap.va));
> @@ -2982,7 +2995,7 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
>  
>  		err = vma_lock_and_validate(exec,
>  					    gpuva_to_vma(op->base.unmap.va),
> -					    res_evict, false);
> +					    res_evict, false, false);
>  		break;
>  	case DRM_GPUVA_OP_PREFETCH:
>  	{
> @@ -2997,7 +3010,7 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
>  
>  		err = vma_lock_and_validate(exec,
>  					    gpuva_to_vma(op->base.prefetch.va),
> -					    res_evict, false);
> +					    res_evict, false, false);
>  		if (!err && !xe_vma_has_no_bo(vma))
>  			err = xe_bo_migrate(xe_vma_bo(vma),
>  					    region_to_mem_type[region],
> @@ -3305,7 +3318,8 @@ ALLOW_ERROR_INJECTION(vm_bind_ioctl_ops_execute, ERRNO);
>  	 DRM_XE_VM_BIND_FLAG_NULL | \
>  	 DRM_XE_VM_BIND_FLAG_DUMPABLE | \
>  	 DRM_XE_VM_BIND_FLAG_CHECK_PXP | \
> -	 DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR)
> +	 DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR | \
> +	 DRM_XE_VM_BIND_FLAG_DECOMPRESS)
>  
>  #ifdef TEST_VM_OPS_ERROR
>  #define SUPPORTED_FLAGS	(SUPPORTED_FLAGS_STUB | FORCE_OP_ERROR)
> @@ -3322,7 +3336,6 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
>  {
>  	int err;
>  	int i;
> -

No related.

>  	if (XE_IOCTL_DBG(xe, args->pad || args->pad2) ||
>  	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
>  		return -EINVAL;
> @@ -3363,9 +3376,9 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
>  		bool is_null = flags & DRM_XE_VM_BIND_FLAG_NULL;
>  		bool is_cpu_addr_mirror = flags &
>  			DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR;
> +		bool is_decompress = flags & DRM_XE_VM_BIND_FLAG_DECOMPRESS;
>  		u16 pat_index = (*bind_ops)[i].pat_index;
>  		u16 coh_mode;
> -

Not related.

>  		if (XE_IOCTL_DBG(xe, is_cpu_addr_mirror &&
>  				 (!xe_vm_in_fault_mode(vm) ||
>  				 !IS_ENABLED(CONFIG_DRM_XE_GPUSVM)))) {
> @@ -3397,7 +3410,9 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
>  		    XE_IOCTL_DBG(xe, obj_offset && (is_null ||
>  						    is_cpu_addr_mirror)) ||
>  		    XE_IOCTL_DBG(xe, op != DRM_XE_VM_BIND_OP_MAP &&
> -				 (is_null || is_cpu_addr_mirror)) ||
> +				 (is_decompress || is_null || is_cpu_addr_mirror)) ||
> +		    XE_IOCTL_DBG(xe, is_decompress &&
> +				 pat_index == xe->pat.idx[XE_CACHE_NONE_COMPRESSION]) ||

The above check doesn't look right. I think you may to check pat_index
against enabling compression and reject it.

>  		    XE_IOCTL_DBG(xe, !obj &&
>  				 op == DRM_XE_VM_BIND_OP_MAP &&
>  				 !is_null && !is_cpu_addr_mirror) ||
> @@ -3417,8 +3432,8 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
>  				 op == DRM_XE_VM_BIND_OP_PREFETCH) ||
>  		    XE_IOCTL_DBG(xe, prefetch_region &&
>  				 op != DRM_XE_VM_BIND_OP_PREFETCH) ||
> -		    XE_IOCTL_DBG(xe,  (prefetch_region != DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC &&
> -				       !(BIT(prefetch_region) & xe->info.mem_region_mask))) ||
> +		    XE_IOCTL_DBG(xe, (prefetch_region != DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC &&
> +				      !(BIT(prefetch_region) & xe->info.mem_region_mask))) ||

Not related but is a good cleanup.

>  		    XE_IOCTL_DBG(xe, obj &&
>  				 op == DRM_XE_VM_BIND_OP_UNMAP)) {
>  			err = -EINVAL;
> @@ -3433,6 +3448,12 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
>  			err = -EINVAL;
>  			goto free_bind_ops;
>  		}
> +
> +		if (is_decompress && (XE_IOCTL_DBG(xe, !xe_device_has_flat_ccs(xe)) ||
> +				      XE_IOCTL_DBG(xe, GRAPHICS_VER(xe) < 20))) {
> +			err = -EOPNOTSUPP;
> +			goto free_bind_ops;
> +		}
>  	}
>  
>  	return 0;
> @@ -3686,7 +3707,6 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  		u64 obj_offset = bind_ops[i].obj_offset;
>  		u32 prefetch_region = bind_ops[i].prefetch_mem_region_instance;
>  		u16 pat_index = bind_ops[i].pat_index;
> -

Not related.

Matt

>  		ops[i] = vm_bind_ioctl_ops_create(vm, &vops, bos[i], obj_offset,
>  						  addr, range, op, flags,
>  						  prefetch_region, pat_index);
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index 413353e1c225..7d652d17b0dc 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -357,6 +357,8 @@ struct xe_vma_op_map {
>  	bool dumpable;
>  	/** @invalidate: invalidate the VMA before bind */
>  	bool invalidate_on_bind;
> +	/** @request_decompress: schedule decompression for GPU map */
> +	bool request_decompress;
>  	/** @pat_index: The pat index to use for this operation. */
>  	u16 pat_index;
>  };
> -- 
> 2.25.1
> 
