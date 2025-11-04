Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13746CCF9E3
	for <intel-xe@archiver.kernel.org>; Tue,  4 Nov 2025 19:54:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEB7410E326;
	Tue,  4 Nov 2025 19:54:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aw2zZ3GB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A217B10E326
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Nov 2025 19:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762286084; x=1793822084;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=aVYdNBF6uKfBl61ErolUTYcskjc0SrwgyPG1JfdIBmI=;
 b=aw2zZ3GB5K1N+sgEg72VLEvU85dsSW3iOnCKxob3qYpyR1JATIw6dIQ4
 l3/JTC6vYZmABUJ55KL/3ed6DJ5DAm6DSWjtkG8DutdMZCjtXflkVXbLh
 KjDp8XElLgjdXZpYUK856quhtroa1xQa1DIA9WM5GSN7vaT/+D7xSKCVX
 T2Ngr47QWUCo5Wrvs/JJJ5qlKP7OBmOsnYM5WUcpMT7+EzTeOla7Dek7R
 uQSBwDQXO5fsGeAp9vKROv9ATgn9xUCUll7pbLV3AknHcPsNuZ8Tz6bK8
 92E77XjGt+VO87Gk9vmCmcIzg8AmmDc5AIkva5L83Pi9Lt6LKfpKlCJXN w==;
X-CSE-ConnectionGUID: pnI/76ZcRcGricdUQL7beA==
X-CSE-MsgGUID: GG72q2sQS36wt5rKWfrX3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="68047671"
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="68047671"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 11:54:44 -0800
X-CSE-ConnectionGUID: amHLwcBxTmu6okf6Di2dWA==
X-CSE-MsgGUID: cQwf+yavTD68cK8peSYc5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="187101446"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 11:54:43 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 4 Nov 2025 11:54:42 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 4 Nov 2025 11:54:42 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.50) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 4 Nov 2025 11:54:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rNnwXyNYNLZuOYcAA0/KrqgZlKcFeSNk8iv6Q3JZZVjoWFfXZL6z+dcAgcAkQogA1rvB/fWzJx+2tSFzw16jYrV/l63ldGZapZCpma6DyHEW3+OVi7dc7JUk6i3g0/vwZswwXza/Q+Fn5lgzRxkEJQb5K5/xl3LvBxMc5hpfgc4V33v//RUkKGjgI2YuSuZSmDxz4e8hrrXEl1FmlnkXZwQ72Sw4AZkPUHUfSmg0/fV9/E6i141T3+f+EaEIiCf485kvo0mTHVE70L23j8wCn8kNAZnPIgyB0BoiBldBWuAH1bpUOxnFdf2Gj0LQY2cj+XQdjVyGtRsq11tQP2ItMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G4Dsr6KFBIyZgBkg2wKBzhShG7lT5JKRSFlMimyXU54=;
 b=QnSDpvrRxfNNlA2zcUVffhpOmPgQVAQKQaAvmgodzXVP2adfbjKHB+VtlgdJV5F2rOkRjTUyUbkvZumPfeRfeJwjt/3qMADZ7FWieR+RAbNGZIwBhhrpTSI2zAW3loW8oB6mjRVbkUmw7cKDMHm7se7/othzRpqb/ilEvsz3aTT8n5ukaKu+S3tLEZpfD/ATj7D101yicL7JF+D+N7PCxf51M7FDmVg34ZUtqdAYa4Lrp6/KZlu/1WzsOoYyWmQvxf/fSd1vtJZaYlPDYlAqwp7y3pphgNpf579DmW46W3GwJ89Y28PH846dV7GZOirD3jLp9AFa+NxZY1nzIAxdsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB5247.namprd11.prod.outlook.com (2603:10b6:5:38a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Tue, 4 Nov
 2025 19:54:40 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9275.013; Tue, 4 Nov 2025
 19:54:40 +0000
Date: Tue, 4 Nov 2025 11:54:37 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Nitin Gote <nitin.r.gote@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.auld@intel.com>,
 <michal.mrozek@intel.com>
Subject: Re: [PATCH v4 3/3] drm/xe: implement VM_BIND decompression in
 vm_bind_ioctl
Message-ID: <aQpZ/THUoUyfNDqf@lstrano-desk.jf.intel.com>
References: <20251104105305.2100460-1-nitin.r.gote@intel.com>
 <20251104105305.2100460-4-nitin.r.gote@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251104105305.2100460-4-nitin.r.gote@intel.com>
X-ClientProxiedBy: MW4P223CA0023.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::28) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB5247:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a67a640-6277-4a18-693a-08de1bdbfd8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?oCSe4dfEkyZ5GHRlmUwkgVVLEJZGUIXnUcTsXIUw2jVcUW8dgJdWhfpTun6T?=
 =?us-ascii?Q?OEUhkX/AnYemDRb/kBg4hlsyX3Sbi0zCu67DjW7AmoPLKcPMbWOOuVMX9hE3?=
 =?us-ascii?Q?gJTgixt1Xn76x5Shq95Qy7NTicYrNV41+5Z0j470C/5wwLdzrX5vxrL3eFTq?=
 =?us-ascii?Q?hIbe9sabSsCX1bN4FXe3SJUnpejCDHpoa9LU+lrjyz5W2eXYykHf1pU1JPcp?=
 =?us-ascii?Q?eCcSzFjQE8G0tho/9UZF0pM7YQ6t4IXb3QeU97HsDqRSOv5fAHU7U/WInG9L?=
 =?us-ascii?Q?u666O3n52jzdBcKJW4bjRYQSzyU9WKiP5XrnWXPhvOooZ7qwbAT65HpsbvHE?=
 =?us-ascii?Q?bbvfZIX9Yjr15IluqSW6GLSNhz/jSHLHFM2ahdETve4iHU7dEsWXpSbjnE1o?=
 =?us-ascii?Q?3v4mhpD0ugCtwa0PM1uaMSC5Ec8MZj4nmDnEC9nr5aVcWtsQGzUWiTMhIEf4?=
 =?us-ascii?Q?Mfl6QUBQb90MvAJiNotuBIjZdCivLfhzn0sGSj6v7lr889ZJ1CaCeF5kz9jD?=
 =?us-ascii?Q?n6qWQOH9Q1rplEDNPCltlG96X54Oen5pVke5STzGA+UeGMmg/8XVT09QYDav?=
 =?us-ascii?Q?Xky644wVmymQlcoI0neK+PFVwyNrAJ8T4GDCThqUKQHu8PQL6AeblP6W2nS0?=
 =?us-ascii?Q?3onSROct1aGXGXPwyRZYpKnTJmPE4+ZtStbZxORaig7h4gOc6CEf9BhXpLFU?=
 =?us-ascii?Q?tFCv9BjZpLNaaCywGRT9VOvj4K4M981ed+W/cbGPGibiW0vLUoVxVf8Vj/nu?=
 =?us-ascii?Q?5wTjxh7eM/QCidgwJ5eK8NqXf+XpPznIkGpmueznf+w7BSxkjosguhUreSjW?=
 =?us-ascii?Q?9FWijMu4i+5XQ2+qpnyR4XxW8v9mblHU4hP8M80hyc4N2199Q03xx7YzRDHh?=
 =?us-ascii?Q?NzFwOzyixYJgNc3hqaH8pf1dQ/vBEu0q8WNHqRSv5TJW5qy1SYMiy+9f/Fa6?=
 =?us-ascii?Q?mekbfHUhdjLODc9o8nyo6ey0sqoIP4ETJ0LNzMefXixH6nM1ENCIHHqESm+S?=
 =?us-ascii?Q?XqDcuMoDGwjjOrGEosDUBqJ544h+7SBkmmteXmlT05nha+WWmFC2Ac6lVjqM?=
 =?us-ascii?Q?VbC8/44e5yURKpdEHNFKQSnu5HDzB3JAPISOEa0LRgA9nCfhOeBorZDjqGIJ?=
 =?us-ascii?Q?saC3GMtfkBrBjvq9iFRWut0Xdk5BGho9CS1+7jKje3ghXu0FH6A5zpy+wbPc?=
 =?us-ascii?Q?QpgxGxGHjvdJw7PZ3ghnoSTz2Zds6kN4lp+xdEg+elnom44HPXgRnftOJvbT?=
 =?us-ascii?Q?ZrtCel6dsla8JS4nTMZAxV5P/HUm2ZQlMQ1whzYYJoV0Uw8JcVYNPtriSw6g?=
 =?us-ascii?Q?jMXhnhEdxJYr7yBBN6Drrszg+BU49ctWp5tz9H17nZF3T2nOahYe7iB98I5P?=
 =?us-ascii?Q?AHUb4BJ6AF/7mf5m0BABj6HIXuiFvXSMxvNJ8WXe/8sNaaayBA8EJAer8E9V?=
 =?us-ascii?Q?lV9QnItsXHHFuamO712bIWHCze7AnCeg?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WGBl139YqbpgHcXMCSBPGGUN7IOcIMAlvA5PeS8YmWiH8ivm5e2bQ3zzCeuc?=
 =?us-ascii?Q?iuZYRlxn3eikFzvdYGV1zxsPNZTs9to+JQDPihC5/YxN8mVKWimhG0h8GKmk?=
 =?us-ascii?Q?/p9phdyPTU/Cvh2SEzEgyyvpUBXG8Zq3rQV9gU79x7ZAR+t+ll3wgkm/Bvhz?=
 =?us-ascii?Q?d4+J4sndy6mqpuUAVJT8xh4w7oARQEF93W/7nTbvb8zWMd/1s4PB/Yj4NgVc?=
 =?us-ascii?Q?La3Hbfj8eYqB036LYIqUgwHrbtDjp9usG3R/U/BCOgzxH3D1EZlp0+H+Gglk?=
 =?us-ascii?Q?l2sWmQi4y35njIbFhEpiOW8oKEBbaPIFw+fciHkIhLHp4Dz9A0MLj3piJGdW?=
 =?us-ascii?Q?tGyDEXDEWhvoUwmp0GhmQrMx2cIQShAyScbq/jk6koV8nUnJbpCVjm0c/cne?=
 =?us-ascii?Q?NlN4nqlYP8RK5GZ0S6fDDqoVzPPLvBczNyzL4p6frTI+SxE4g+2fFPzkIS7v?=
 =?us-ascii?Q?vQZNT0xvpqFOZV94jYcNDWutIboiDXDYuc/Yny6WUSLHN0KXjH7NKoXvnV/3?=
 =?us-ascii?Q?Vd+kC6hdSrFxl7NCWON5C7w/sGTG5J1Mtyk6r0ISixAdqnHvZIV9Px2nwmm0?=
 =?us-ascii?Q?7SucaeTO7/m0CC5ax8jMyzFxmWm5N96rtTqHCNnJntI+sf9P9ICRNfMd+H//?=
 =?us-ascii?Q?fp1ptNx0w5cUIqOA0XhLVL6Qt0EwF6sloRSD95XOYPk4sgeCpSKK93eD7Kf+?=
 =?us-ascii?Q?uYwB5fr3Rhe1A4xLx+5qufwvs7vob2LmRPYFxmGWt82rvE6VpQGIS/qD4OLb?=
 =?us-ascii?Q?/+LEAKxb+mjQY4RLvA6fLJiX8RQhWMZdKqzqovB2OLxEjSiFRxWpPcSNl3W4?=
 =?us-ascii?Q?Sv48zETO07OZ8HPIrB50z+OOiZCfBmATQ5CtwF1JovbJxZyYPB4Rhf5CpRHL?=
 =?us-ascii?Q?kilF8OpoMHMQkUZRK6tc5ajLH7DS/js9AL8iXZxx7iyc6LD3FzYxV9ORWvrw?=
 =?us-ascii?Q?qUqYrfgy1Gfg/lAQmJ+seHSOHEPzOJC0cneNOFzzIxfBzFPgVcYeBclaZBtS?=
 =?us-ascii?Q?WBHZYl/LxESSPW14kHOWoxjjnIEaL2lH2/zKeh1ORlSY2CmQPCRYSDhAbgKd?=
 =?us-ascii?Q?0zoBeXw3EtMCXDKJru31EY0A6nREA038JauFCOO1mFWSvrDE2hqwvi3V4O7Y?=
 =?us-ascii?Q?9ogUIIC1mpDLZC58K3IY9SBn54rqv+hwfHEb2Gzm34SisZGd06iux6M3wbe3?=
 =?us-ascii?Q?q0aTyEaQ5HlM9JHzWwunb3R/eD6K/YgQBw9XKsbNrA4F4DTJQnp7ARs9Cr0W?=
 =?us-ascii?Q?PTANKZc7i67UI/XO4Z95AfuJvf/YKLc1icRwJ4bscOVI84o0YLd+9ZizuEZ7?=
 =?us-ascii?Q?AtOA0Ch4jz47TSWFrn7MYcrW5N9T6JdgryFxOMND+VN1Z6k5H9pbasjhuq34?=
 =?us-ascii?Q?UXZ7FV+Be1/7U4jtEFYp9kWwjfU6OjYDhCXPml+Rp3td3i9nlW0OJOlCZXfZ?=
 =?us-ascii?Q?Op7KOqrvSUDnfNGV2kg2bFV4VcifUEgEs2o7cQ6t0mbmkoFImd3qqH7SiWOY?=
 =?us-ascii?Q?VewpP9bg1ZIRGGOvUWGyZSjjFJyq6AsC0cEbW5GglRfM5pD5ZibrHNJ9+ykB?=
 =?us-ascii?Q?rIfXvqcfZZ6VOyWpomygePU+T7oVicq/QfRQ/r/hLQ6lF3zbsZYqHr/aNNcS?=
 =?us-ascii?Q?Vg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a67a640-6277-4a18-693a-08de1bdbfd8f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 19:54:40.1026 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IwTpkH1ySEFcu5FUhFQGFM6A0rYmpLPQi2Dpd9LcOuN5KO0cULuTMafop5yatHvJeEKKdKb7VFFwLG8gOKtU4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5247
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

On Tue, Nov 04, 2025 at 04:23:05PM +0530, Nitin Gote wrote:
> Implement handling of VM_BIND(..., DECOMPRESS) in xe_vm_bind_ioctl.
> 
> Key changes:
> - Parse and record per-op intent (op->map.request_decompress) when the
>   DECOMPRESS flag is present.
> - Introduce xe_pat_index_get_comp_en() helper to check if a PAT index
>   has compression enabled via the XE2_COMP_EN bit.
> - Validate DECOMPRESS preconditions in the ioctl path:
>   - Only valid for MAP ops.
>   - The provided pat_index must select the device's "no-compression" PAT.
>   - Only meaningful on devices with flat CCS and the required XE2+
>     otherwise return -EOPNOTSUPP.
>   - Use XE_IOCTL_DBG for uAPI sanity checks.
> - Implement xe_bo_decompress():
>   For VRAM BOs run xe_bo_move_notify(), reserve one fence slot,
>   schedule xe_migrate_resolve(), and attach the returned fence
>   with DMA_RESV_USAGE_KERNEL. Non-VRAM cases are silent no-ops.
> - Wire scheduling into vma_lock_and_validate() so VM_BIND will schedule
>   decompression when request_decompress is set.
> - Handle fault-mode VMs by performing decompression synchronously during
>   the bind process, ensuring that the resolve is completed before the bind
>   finishes.
> 
> This schedules an in-place GPU resolve (xe_migrate_resolve) for
> decompression.
> 
> v4: (Matt)
>    - Introduce xe_pat_index_get_comp_en(), which checks
>      XE2_COMP_EN for the pat_index
>    - .interruptible should be true, everything else false
> 
> v3: (Matt)
>    - s/xe_bo_schedule_decompress/xe_bo_decompress
>    - skip the decrompress step if the BO isn't in VRAM
>    - start/size not required in xe_bo_schedule_decompress
>    - Use xe_bo_move_notify instead of xe_vm_invalidate_vma
>      with respect to invalidation.
>    - Nits
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
>  drivers/gpu/drm/xe/xe_bo.c       | 52 ++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_bo.h       |  2 ++
>  drivers/gpu/drm/xe/xe_pat.c      |  6 ++++
>  drivers/gpu/drm/xe/xe_pat.h      | 10 ++++++
>  drivers/gpu/drm/xe/xe_vm.c       | 40 +++++++++++++++++-------
>  drivers/gpu/drm/xe/xe_vm_types.h |  2 ++
>  6 files changed, 101 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index b0bd31d14bb9..95331285c418 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -3330,6 +3330,58 @@ int xe_gem_mmap_offset_ioctl(struct drm_device *dev, void *data,
>  	return 0;
>  }
>  
> +/**
> + * xe_bo_decompress - schedule in-place decompress and install fence
> + * @bo:   buffer object (caller should hold drm_exec reservations for VM+BO)
> + * @vm:   VM containing the VMA range
> + *
> + * Schedules an in-place resolve via the migrate layer and installs the
> + * returned dma_fence into the BO kernel reservation slot (DMA_RESV_USAGE_KERNEL).
> + * In preempt fence mode, this operation interrupts hardware execution
> + * which is expensive. Page fault mode is recommended for better performance.
> + *
> + * Returns 0 on success, negative errno on error.
> + */
> +int xe_bo_decompress(struct xe_bo *bo, struct xe_vm *vm)
> +{
> +	struct xe_tile *tile = xe_device_get_root_tile(vm->xe);
> +	struct dma_fence *decomp_fence = NULL;
> +	int err = 0;
> +	struct ttm_operation_ctx op_ctx = {
> +		.interruptible = true,
> +		.no_wait_gpu = false,
> +		.gfp_retry_mayfail = false,
> +	};
> +
> +	/* Silently skip decompression for non-VRAM buffers */
> +	if (!bo->ttm.resource || !mem_type_is_vram(bo->ttm.resource->mem_type))
> +		return 0;
> +
> +	/* Notify before scheduling resolve */
> +	err = xe_bo_move_notify(bo, &op_ctx);
> +	if (err)
> +		return err;
> +
> +	/* Reserve fence slot before scheduling */
> +	err = dma_resv_reserve_fences(bo->ttm.base.resv, 1);
> +	if (err)
> +		return err;
> +
> +	/* Schedule the in-place decompression */
> +	decomp_fence = xe_migrate_resolve(tile->migrate,
> +					  bo,
> +					  bo->ttm.resource);
> +
> +	if (IS_ERR(decomp_fence))
> +		return PTR_ERR(decomp_fence);
> +
> +	/* Install kernel-usage fence */
> +	dma_resv_add_fence(bo->ttm.base.resv, decomp_fence, DMA_RESV_USAGE_KERNEL);
> +	dma_fence_put(decomp_fence);
> +
> +	return 0;
> +}
> +
>  /**
>   * xe_bo_lock() - Lock the buffer object's dma_resv object
>   * @bo: The struct xe_bo whose lock is to be taken
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index 911d5b90461a..346b50a1247c 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -309,6 +309,8 @@ int xe_bo_dumb_create(struct drm_file *file_priv,
>  
>  bool xe_bo_needs_ccs_pages(struct xe_bo *bo);
>  
> +int xe_bo_decompress(struct xe_bo *bo, struct xe_vm *vm);
> +
>  static inline size_t xe_bo_ccs_pages_start(struct xe_bo *bo)
>  {
>  	return PAGE_ALIGN(xe_bo_size(bo));
> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
> index 68171cceea18..1b4d5d3def0f 100644
> --- a/drivers/gpu/drm/xe/xe_pat.c
> +++ b/drivers/gpu/drm/xe/xe_pat.c
> @@ -196,6 +196,12 @@ u16 xe_pat_index_get_coh_mode(struct xe_device *xe, u16 pat_index)
>  	return xe->pat.table[pat_index].coh_mode;
>  }
>  
> +bool xe_pat_index_get_comp_en(struct xe_device *xe, u16 pat_index)
> +{
> +	WARN_ON(pat_index >= xe->pat.n_entries);
> +	return !!(xe->pat.table[pat_index].value & XE2_COMP_EN);
> +}
> +
>  static void program_pat(struct xe_gt *gt, const struct xe_pat_table_entry table[],
>  			int n_entries)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_pat.h b/drivers/gpu/drm/xe/xe_pat.h
> index 05dae03a5f54..b8559120989e 100644
> --- a/drivers/gpu/drm/xe/xe_pat.h
> +++ b/drivers/gpu/drm/xe/xe_pat.h
> @@ -58,4 +58,14 @@ int xe_pat_dump(struct xe_gt *gt, struct drm_printer *p);
>   */
>  u16 xe_pat_index_get_coh_mode(struct xe_device *xe, u16 pat_index);
>  
> +/**
> + * xe_pat_index_get_comp_en - Extract the compression enable flag for
> + * the given pat_index.
> + * @xe: xe device
> + * @pat_index: The pat_index to query
> + *
> + * Return: true if compression is enabled for this pat_index, false otherwise.
> + */
> +bool xe_pat_index_get_comp_en(struct xe_device *xe, u16 pat_index);
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 00f3520dec38..36a922d0cc3d 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2300,6 +2300,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
>  				op->map.vma_flags |= XE_VMA_DUMPABLE;
>  			if (flags & DRM_XE_VM_BIND_FLAG_MADVISE_AUTORESET)
>  				op->map.vma_flags |= XE_VMA_MADV_AUTORESET;
> +			op->map.request_decompress = flags & DRM_XE_VM_BIND_FLAG_DECOMPRESS;
>  			op->map.pat_index = pat_index;
>  			op->map.invalidate_on_bind =
>  				__xe_vm_needs_clear_scratch_pages(vm, flags);
> @@ -2836,7 +2837,7 @@ static void vm_bind_ioctl_ops_unwind(struct xe_vm *vm,
>  }
>  
>  static int vma_lock_and_validate(struct drm_exec *exec, struct xe_vma *vma,
> -				 bool res_evict, bool validate)
> +				 bool res_evict, bool validate, bool request_decompress)
>  {
>  	struct xe_bo *bo = xe_vma_bo(vma);
>  	struct xe_vm *vm = xe_vma_vm(vma);
> @@ -2849,6 +2850,12 @@ static int vma_lock_and_validate(struct drm_exec *exec, struct xe_vma *vma,
>  			err = xe_bo_validate(bo, vm,
>  					     !xe_vm_in_preempt_fence_mode(vm) &&
>  					     res_evict, exec);
> +
> +		if (err)
> +			return err;
> +
> +		if (request_decompress)
> +			err = xe_bo_decompress(bo, vm);
>  	}
>  
>  	return err;
> @@ -2936,7 +2943,8 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
>  			err = vma_lock_and_validate(exec, op->map.vma,
>  						    res_evict,
>  						    !xe_vm_in_fault_mode(vm) ||
> -						    op->map.immediate);
> +						    op->map.immediate,
> +						    op->map.request_decompress);
>  		break;
>  	case DRM_GPUVA_OP_REMAP:
>  		err = check_ufence(gpuva_to_vma(op->base.remap.unmap->va));
> @@ -2945,13 +2953,13 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
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
> @@ -2960,7 +2968,7 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
>  
>  		err = vma_lock_and_validate(exec,
>  					    gpuva_to_vma(op->base.unmap.va),
> -					    res_evict, false);
> +					    res_evict, false, false);
>  		break;
>  	case DRM_GPUVA_OP_PREFETCH:
>  	{
> @@ -2975,7 +2983,7 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
>  
>  		err = vma_lock_and_validate(exec,
>  					    gpuva_to_vma(op->base.prefetch.va),
> -					    res_evict, false);
> +					    res_evict, false, false);
>  		if (!err && !xe_vma_has_no_bo(vma))
>  			err = xe_bo_migrate(xe_vma_bo(vma),
>  					    region_to_mem_type[region],
> @@ -3284,7 +3292,8 @@ ALLOW_ERROR_INJECTION(vm_bind_ioctl_ops_execute, ERRNO);
>  	 DRM_XE_VM_BIND_FLAG_DUMPABLE | \
>  	 DRM_XE_VM_BIND_FLAG_CHECK_PXP | \
>  	 DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR | \
> -	 DRM_XE_VM_BIND_FLAG_MADVISE_AUTORESET)
> +	 DRM_XE_VM_BIND_FLAG_MADVISE_AUTORESET | \
> +	 DRM_XE_VM_BIND_FLAG_DECOMPRESS)
>  
>  #ifdef TEST_VM_OPS_ERROR
>  #define SUPPORTED_FLAGS	(SUPPORTED_FLAGS_STUB | FORCE_OP_ERROR)
> @@ -3342,6 +3351,7 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
>  		bool is_null = flags & DRM_XE_VM_BIND_FLAG_NULL;
>  		bool is_cpu_addr_mirror = flags &
>  			DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR;
> +		bool is_decompress = flags & DRM_XE_VM_BIND_FLAG_DECOMPRESS;
>  		u16 pat_index = (*bind_ops)[i].pat_index;
>  		u16 coh_mode;
>  
> @@ -3376,7 +3386,9 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
>  		    XE_IOCTL_DBG(xe, obj_offset && (is_null ||
>  						    is_cpu_addr_mirror)) ||
>  		    XE_IOCTL_DBG(xe, op != DRM_XE_VM_BIND_OP_MAP &&
> -				 (is_null || is_cpu_addr_mirror)) ||
> +				 (is_decompress || is_null || is_cpu_addr_mirror)) ||
> +		    XE_IOCTL_DBG(xe, is_decompress &&
> +				 !xe_pat_index_get_comp_en(xe, pat_index)) ||

I think polarity of this the check on xe_pat_index_get_comp_en is wrong.

Otherwise everything else LGTM.

I will ask Matt Auld to give this series a look ahead of merging as he
is our local compression expert and he may spot something I have missed.

Matt

>  		    XE_IOCTL_DBG(xe, !obj &&
>  				 op == DRM_XE_VM_BIND_OP_MAP &&
>  				 !is_null && !is_cpu_addr_mirror) ||
> @@ -3396,8 +3408,8 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
>  				 op == DRM_XE_VM_BIND_OP_PREFETCH) ||
>  		    XE_IOCTL_DBG(xe, prefetch_region &&
>  				 op != DRM_XE_VM_BIND_OP_PREFETCH) ||
> -		    XE_IOCTL_DBG(xe,  (prefetch_region != DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC &&
> -				       !(BIT(prefetch_region) & xe->info.mem_region_mask))) ||
> +		    XE_IOCTL_DBG(xe, (prefetch_region != DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC &&
> +				      !(BIT(prefetch_region) & xe->info.mem_region_mask))) ||
>  		    XE_IOCTL_DBG(xe, obj &&
>  				 op == DRM_XE_VM_BIND_OP_UNMAP) ||
>  		    XE_IOCTL_DBG(xe, (flags & DRM_XE_VM_BIND_FLAG_MADVISE_AUTORESET) &&
> @@ -3414,6 +3426,12 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
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
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index 830ed7b05c27..87f0c04468f5 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -351,6 +351,8 @@ struct xe_vma_op_map {
>  	bool immediate;
>  	/** @read_only: Read only */
>  	bool invalidate_on_bind;
> +	/** @request_decompress: schedule decompression for GPU map */
> +	bool request_decompress;
>  	/** @pat_index: The pat index to use for this operation. */
>  	u16 pat_index;
>  };
> -- 
> 2.25.1
> 
