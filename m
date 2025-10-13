Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C5E5CCD183
	for <intel-xe@archiver.kernel.org>; Mon, 13 Oct 2025 16:12:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CE0810E466;
	Mon, 13 Oct 2025 16:12:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nBAkyfIe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB97A10E466
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Oct 2025 16:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760371943; x=1791907943;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=UTk5wckLMk6DUxzvaykJzP7hcRAP5/mjtOLsQuXQw5g=;
 b=nBAkyfIeTssvPXjPpmLyxPB8dmkMVQ8Q43zQEj5l3XebMhtBfNljzFel
 09Z/alF4zDRcoN0yLqpNmuoEKsxqtpF4+OmKd8vt+x+utT7AW5lTJCDb6
 u9V39Ne3729Xf0qjz2xJakjgLWMhhljhVMiB6iKCrKbfaPeAik9n9ZWp8
 y7Y5Q4hxZ1R8uHJc0NsKD4fTD+WDit3E17f2xM/facoiyL5x3Ej839Bgh
 8vWYFPaJRor98+QWCAjatoVzhiNhni9AhFWqM5RRX/k8GBepYsgjC6FC8
 6xz2I20idDvfs/PeRvksvEHHjRt8bcEHpgwxx+QygRetoQFi9eKnbp9FB A==;
X-CSE-ConnectionGUID: b+K4B4D9QH2z7ram+y1VPg==
X-CSE-MsgGUID: Vp5HQ04tRxGwpcCSr+IVXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="66367404"
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; d="scan'208";a="66367404"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 09:12:17 -0700
X-CSE-ConnectionGUID: xw5lVD/fSZ+4QZFDKH0BUg==
X-CSE-MsgGUID: q/I+vQWkSjSxXfco/pnxAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; d="scan'208";a="181313683"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 09:12:17 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 09:12:16 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 13 Oct 2025 09:12:16 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.40) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 09:12:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xZfl+Xe7acvnkED5Vg0FtewEuTKExPVk8fp1Pt6jbAB0L+lQP7ABeTlP3Jcf/tbrGUkzIa+IhhJoUHKn8ibaUpTqVZep2VR+x+cVlw7/fQTCBJg4oguTaXSGYkx0k1QGhN4DOTl/w01KTLBIvuvgHXppyDntYv1CJ74KYj5tYHVVuOLtke2XloiVNAcx61qctTxLNTJacY2roQD8jE7a3HrBRJkyfmXCO8tdehD/jJnt8x4JJab6U+6XThJePP7gECArefcbp189UC5cp2qZ4D++vPNnZC6O6lT3eMDx4/PBw2zAGGqPWMgg+Mmpzf3AFJo04fMJEYZoMrGenxhcSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uD+5p/9CJ2MXUSQchlbXD6T00chS44k7y/cUPjxmELk=;
 b=Mp43N5U5P62Rj+wbkntKLfHOh+BC8PXmjd+qGWkqHQMgjTUNJIJcs2p1kdGC/8ogwCT0rHM0TxYkkk6WTPumXJZoTtUaM4N9rZgv/JrwhbpTCxEB7/F/tUHB7J91jTFJmC+YcNJBkJKVNFEUQCpzaPUjleN4CKBYyjWNG8r5QRSIj5IlAqCN5qlGEsanJvdQm9ocVLj5fFy1m4BeN44AE78f1Jr1zfPM8HJddvcFxa8shkgwl9cHDGj3MnuYhVRnC9gHK2slOthGjSPwwbceqeJqyw8pjRlc2+IxzUxmON3QDr1BqJo0JqqL79DHcqgyrytUVCirsO5NaEZPKwMiSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by DM4PR11MB5248.namprd11.prod.outlook.com (2603:10b6:5:38b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Mon, 13 Oct
 2025 16:12:14 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%5]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 16:12:13 +0000
Date: Mon, 13 Oct 2025 09:12:10 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Nitin Gote <nitin.r.gote@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.auld@intel.com>,
 <thomas.hellstrom@intel.com>
Subject: Re: [PATCH v2 3/3] drm/xe: implement VM_BIND decompression in
 vm_bind_ioctl
Message-ID: <aO0k2rx8oqoDV/0v@lstrano-desk.jf.intel.com>
References: <20251013144850.757438-1-nitin.r.gote@intel.com>
 <20251013144850.757438-4-nitin.r.gote@intel.com>
 <aO0kal4XbxtdJGki@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aO0kal4XbxtdJGki@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: MW4PR04CA0353.namprd04.prod.outlook.com
 (2603:10b6:303:8a::28) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|DM4PR11MB5248:EE_
X-MS-Office365-Filtering-Correlation-Id: 81b6f017-bf81-4b99-9ef2-08de0a734574
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6RXKEGamIIN+DYOeUC9VKe855eahK4vdkpd9GbAVa6JwH2lJfKylYOM6l964?=
 =?us-ascii?Q?41RcMowDrdx8cGBn1kr01XSMR8BXxfuzBtFmyFvbamfXfhlMDAXMxODsfCvy?=
 =?us-ascii?Q?S3GznXxahAqpSMkqzSMRJSOgt9gtv4Ct2BUClrJQQw6Q2E4b/A7NPwm+wBDE?=
 =?us-ascii?Q?YjtY7pOY8SYHI4KpXc6Rz3KAHnM7ZOlfdUkGiGxnqeji4fWSClUTqlSpjLpq?=
 =?us-ascii?Q?gAhSXLEJgYGH45UiN//tM2C/6tx4k7Fy97xGUseC7Nmx49H5yt8VlQeJJ8RL?=
 =?us-ascii?Q?y+UiwUJk0bGezECWS1qeNRDQPiV5onCqfkR2Xl/yjUPQtpp/kD3PfIPaCAMf?=
 =?us-ascii?Q?lCXhfhQB7jeDL5FN74uljTtxKVvHclJgdc+tRhQvTsdvDNkZu3VPBIlWGU2R?=
 =?us-ascii?Q?J20RWwsVvPWh6+9MbTEm1LVmc8qfqCV44n2THpUTOhHOxKuLW7EF3N3c3ISn?=
 =?us-ascii?Q?DUKCKCpyM7TeRk65jEUNo/9t3dPtT3pWFo1zY5MpiJXi/9sjUoDouo9D7xmg?=
 =?us-ascii?Q?X61iTsTVxqHLF8uTGgQTcWFsPFiduYw8nhnOK65aCyGOjC8s4SYFCpjdsnFl?=
 =?us-ascii?Q?1VwjMnM6MRhX0cho/BPly8v0435TzrhgMrghDZkcwFtvGNUcmO1g5YfLWFUz?=
 =?us-ascii?Q?NzaZ/exdbXrmCGDNhzfMghu5/cPSo/cA1SVnXyMElNqMjHubw5LsjNKacwgl?=
 =?us-ascii?Q?QRgXyjwLuWI8W2w+XEjywezvV4BJ7kNmfRAC7BgWFu9xg8KNtqx/1un+84V+?=
 =?us-ascii?Q?WncoO3V5Acm2rqomb4Pq1GOXhmCohPYgf4y32z4bLnI3+K5941cqJ6HAOb3f?=
 =?us-ascii?Q?6lJcYPwdfuMGTzgwVP7oEAMH1S1rm8c5gfHKMNBvoPwR5xXwZlwwKofTngs7?=
 =?us-ascii?Q?jQpsWz58gJjBueq45ug2JdmDifEKkKpbM3EMyhVqTb6PZ3dDpnxFK3D40u9x?=
 =?us-ascii?Q?EJcWyrrpNvtom7u7efE9ud768/BK212gpHIEtsZyC+8qKEriw/oJKSz5Rqql?=
 =?us-ascii?Q?Hjm62c/YdqhGKJhVu/kV2oWU1iJZU4fJiaSfmemduv2m0LMUG5tFYGIoxvvS?=
 =?us-ascii?Q?L5ZXSsi9jE7Nhsl4dIvFpeMPjyOx1H7J/yqVzVfumci0FxQTZDn4QVXZbLaD?=
 =?us-ascii?Q?mRPainSkJ4WTIxtLKEGnxkTIy/TD+ni9reuvH39PK7e7OxddTbZf4azXkYHl?=
 =?us-ascii?Q?wP++C9n/3XlIJu/YfW7HHTgumGKG8BU/xWR3gpjDxXQExwKrG1lxv2OM0yK5?=
 =?us-ascii?Q?KYpo3/5dv68hI2gRD55SbQUgZQx2TvpMJihU8GUM/H/9mB1Io+Zozic0Ipo4?=
 =?us-ascii?Q?btmYoxldXge11BpM/5u0IJMBpm03j0M44lv1t/CVmcjxc6F3/iDg8fkRaX3s?=
 =?us-ascii?Q?6Qx1s3lDDXEltMIYSxdshj5jMcRK2Z3b8Gp4jLKzJHMbnbcxF/tjItN22VS3?=
 =?us-ascii?Q?PYJiToYP2l85pmfALBkaRLJKVNSurSo3?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+Duas8kHQkdErmoG38cLOp3d8Hby6d5B23j7a7BtCFD0mGXl1uDpS8+LQdEC?=
 =?us-ascii?Q?pKDc7cbbeA0iAHZAWJSyjpdhRUrZsbKTcPHbsoQRF+KuzS2SkB+/JZmr+uXh?=
 =?us-ascii?Q?3TD5b64ib5fSIw4K1xh7hnHm6NUTzawSd4MRkwv814X7aJv3H3WyjGHvBPxF?=
 =?us-ascii?Q?fvMNQAAagjiapgRw4IqvbbxOZUN0UErcPndE9/dVsmcFnT4jJiWozBztgj0i?=
 =?us-ascii?Q?bIaSv0cEiDRiz6FkDmFbz0HtryajD3wiFkKSgCGQrElk45Hwl6SFPwD9nXHq?=
 =?us-ascii?Q?PAFDwarvvSodVz6VUWqcRH9VVIZduMY/NwYN5KI0DHnvkfQ1tj65sZANNdLm?=
 =?us-ascii?Q?KvH3RNk2R3JSUr/A+0ms8VI9KCKF5T3fZmdzBllUDjCp0c/34+qW0tvrxxVu?=
 =?us-ascii?Q?2Bq0cFbdq4BOYdfKpYI4bsVpfygs8mNAw7LweK7u89CAi5X1P6FfF97+o00S?=
 =?us-ascii?Q?3SCyzNrYILrDbwfo33b5QsfZZ+aOAw1lZavtBFT1m9jYO2SZHSFlTPMVcXdP?=
 =?us-ascii?Q?feLP1WlQ3dC7JQEcNelYhu+vNtgQT0Rv/jRQSm9mL82KFaVNH5JkzhOYwXnA?=
 =?us-ascii?Q?liM1Yw5fn4K9k6iBf8oyCSL50NamrAAOIQAdOjKdc3yqIYuqZ5Hwbu443uYL?=
 =?us-ascii?Q?1wOEfN7Wi9VbQ3frxfmjEGusSHrD5n98phit6j/DcVePDHf1Ov5WwoDznK0o?=
 =?us-ascii?Q?ck+FHJRwB0ry9mDTL4jxyuPil6A8GG8l3btJXCudbRRqq9HjnvfoGfXFQi67?=
 =?us-ascii?Q?z/X468ZeecmCSTawo8WiJG2f3YXZFMYsYIf3XqCd9ajtbhqucY3WKoHHLXdd?=
 =?us-ascii?Q?fBxs8LScwSfItj5EbRXFfwAdDI3p1ho9YVlkGuk/NRGIrc7zVuDvqsubd+fJ?=
 =?us-ascii?Q?vrdxSDzPSolNJa6+sY1VcdnDVjveGe9EAOkAt7RPnxPfVGqnESCWVLGw8VxK?=
 =?us-ascii?Q?kuUaJA2xLP1I5vujDGBXs+qwo5g75fWb8SZcrPKBDjblkXQ5Mg/seoNEBhYy?=
 =?us-ascii?Q?a9uuxWIunHnYuJprafZuLeBXur4ddaFSscJi1w6DXoxtBB2lC7R55IBsnB6v?=
 =?us-ascii?Q?TK9XP0dsm+BmbDZqV42wa7Lbx5l3bVZ0czQDpL01BWvUZ7CJ8cB/Cr/fyZB7?=
 =?us-ascii?Q?B8vdkKv8m7xL2TO+Krptx2eG0Az/9IRsDPOtQVob6apLkgOsqyXZPNxh5S6a?=
 =?us-ascii?Q?CDzQO9Vc9RKdngqeh0dmLACaZV7UQULXub2iDa4pHZuPieYtaPqWhhQJSkRa?=
 =?us-ascii?Q?irjfShDu7JkzGv/od3XKVD/mGRfDl+r8N/53YAhBNO0C+UH4440aEBYQDHBG?=
 =?us-ascii?Q?bnzDPlqQeN3xMsYmW/HXSNPC3TKM9mugwbl19X6CXWA3CSekrXWD8nGxbXqC?=
 =?us-ascii?Q?DzUlgR1bjEVA8oTm8L29Q8WYkPy8wbFfLrvi2nyfS67JyEO/BOCZtxy5SQ6O?=
 =?us-ascii?Q?Q+4UAB1EamnsjD248fn92tWMEh2pADqGMKL6fvDD9tmwHrf+Rc6lwKBk+M4/?=
 =?us-ascii?Q?oLHlDoUpO5wTQmMyVFJn7KxR5lvSdqlSBvAk2Aa9V8875LfubkjpFnrLM9mJ?=
 =?us-ascii?Q?WRZV9/ImUr7Xew7RF++LVgTpZsnvas9ZmXsOHCAZIhnqKj2C9drJgxfFb4J8?=
 =?us-ascii?Q?DQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 81b6f017-bf81-4b99-9ef2-08de0a734574
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 16:12:13.8394 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BMVieSF74QGBVp32Qv8oqRtTzaCrpo87WU5PCx8OMECPnTAjVBF5bmpwc6ZxtRUxbRucmBDmM0vkrebpcxKxlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5248
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

On Mon, Oct 13, 2025 at 09:10:18AM -0700, Matthew Brost wrote:
> On Mon, Oct 13, 2025 at 08:18:50PM +0530, Nitin Gote wrote:
> > Implement handling of VM_BIND(..., DECOMPRESS) in xe_vm_bind_ioctl.
> > 
> > Key changes:
> > - Parse and record per-op intent (op->map.request_decompress) when the
> >   DECOMPRESS flag is present.
> > - Validate DECOMPRESS preconditions in the ioctl path:
> >   - Only valid for MAP ops.
> >   - The provided pat_index must select the device's "no-compression" PAT.
> >   - Only meaningful for VRAM-backed BOs on devices with flat CCS and the
> >     required XE2+ hardware (reject with -EOPNOTSUPP otherwise).
> >   - Use XE_IOCTL_DBG for uAPI sanity checks.
> > - Implement xe_bo_schedule_decompress():
> >   - Locate and invalidate any overlapping VMA.
> >   - Schedule an in-place resolve via the migrate/resolve path.
> >   - Install the resulting dma_fence into the BO's kernel reservation
> >     (DMA_RESV_USAGE_KERNEL).
> > - Wire scheduling into vma_lock_and_validate() so VM_BIND will schedule
> >   decompression when request_decompress is set.
> > - Handle fault-mode VMs by performing decompression synchronously during
> >   the bind process, ensuring that the resolve is completed before the bind
> >   finishes.
> > 
> > This schedules an in-place GPU resolve (xe_migrate_resolve) for
> > decompression.
> > 
> > v2:
> >    - Move decompression work out of vm_bind ioctl. (Matt)
> >    - Put that work in a small helper at the BO/migrate layer invoke it
> >      from vma_lock_and_validate which already runs under drm_exec.
> >    - Move lightweight checks to vm_bind_ioctl_check_args (Matthew Auld)
> > 
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Matthew Auld <matthew.auld@intel.com>
> > Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_bo.c       | 53 ++++++++++++++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_bo.h       |  3 ++
> >  drivers/gpu/drm/xe/xe_vm.c       | 48 ++++++++++++++++++++---------
> >  drivers/gpu/drm/xe/xe_vm_types.h |  2 ++
> >  4 files changed, 92 insertions(+), 14 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > index 7b6502081873..e9b28c8462c6 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -3307,6 +3307,59 @@ int xe_gem_mmap_offset_ioctl(struct drm_device *dev, void *data,
> >  	return 0;
> >  }
> >  
> > +/**
> > + * xe_bo_schedule_decompress - schedule in-place decompress and install fence
> > + * @bo:   buffer object (caller should hold drm_exec reservations for VM+BO)
> > + * @vm:   VM containing the VMA range
> > + * @addr: start GPU virtual address of the range
> > + * @range:length in bytes of the range
> > + *
> > + * Schedules an in-place resolve via the migrate layer and installs the
> > + * returned dma_fence into the BO kernel reservation slot (DMA_RESV_USAGE_KERNEL).
> > + * Returns 0 on success, negative errno on error.
> > + */
> > +int xe_bo_schedule_decompress(struct xe_bo *bo, struct xe_vm *vm,
> 
> s/xe_bo_schedule_decompress/xe_bo_decompress
> 
> > +			      u64 addr, u64 range)
> 
> The caller has the VMA, just pass it in rather than looking it up here
> but I don't even this the VMA is needed - more on that below.
> 
> > +{
> > +	struct xe_tile *tile = xe_device_get_root_tile(vm->xe);
> > +	struct xe_vma *existing_vma = NULL;
> > +	struct dma_fence *decomp_fence = NULL;
> > +	int err = 0;
> > +
> > +	/* Validate buffer is VRAM-backed  */
> > +	if (!bo->ttm.resource || !mem_type_is_vram(bo->ttm.resource->mem_type)) {
> > +		drm_err(&vm->xe->drm, "Decompression requires VRAM buffer\n");
> > +		return -EINVAL;
> > +	}
> 
> I think we should just slightly skip the decrompress step if the BO

Typo. s/slightly/silently 

By silently I mean just return 0.

Matt

> isn't in VRAM. It is possible we have evicted the BO system memory
> already behind the user and decrompression isn't required then.
> 
> > +
> > +	/* Find overlapping VMA */
> > +	existing_vma = xe_vm_find_overlapping_vma(vm, addr, range);
> > +	if (existing_vma) {
> 
> See above a lookup isn't required as the caller has the VMA already. 
> 
> > +		drm_dbg(&vm->xe->drm,
> > +			"Found overlapping VMA - automatic invalidation will occur\n");
> > +
> > +		/* Invalidate the VMA */
> > +		err = xe_vm_invalidate_vma(existing_vma);
> 
> xe_vm_invalidate_vma is only valid on faulting VM. I think you want to
> call xe_bo_move_notify here as that will do all the correct things wrt
> to invalidtaions.
> 
> > +		if (err)
> > +			return err;
> > +	}
> > +
> > +	/* Schedule the in-place decompression */
> > +	decomp_fence = xe_migrate_resolve(tile->migrate,
> > +					  bo, bo,
> > +					  bo->ttm.resource, bo->ttm.resource,
> > +					  false);
> > +
> > +	if (IS_ERR(decomp_fence))
> > +		return PTR_ERR(decomp_fence);
> > +
> > +	/* Install kernel-usage fence */
> > +	dma_resv_add_fence(bo->ttm.base.resv, decomp_fence, DMA_RESV_USAGE_KERNEL);
> 
> I believe you need to call dma_resv_reserve_fences before
> xe_migrate_resolve to ensure dma_resv_add_fence will succeed.
> 
> > +	dma_fence_put(decomp_fence);
> > +
> > +	return 0;
> > +}
> > +
> >  /**
> >   * xe_bo_lock() - Lock the buffer object's dma_resv object
> >   * @bo: The struct xe_bo whose lock is to be taken
> > diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> > index 353d607d301d..b5dd8630cde5 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.h
> > +++ b/drivers/gpu/drm/xe/xe_bo.h
> > @@ -308,6 +308,9 @@ int xe_bo_dumb_create(struct drm_file *file_priv,
> >  
> >  bool xe_bo_needs_ccs_pages(struct xe_bo *bo);
> >  
> > +int xe_bo_schedule_decompress(struct xe_bo *bo, struct xe_vm *vm,
> > +			      u64 addr, u64 range);
> > +
> >  static inline size_t xe_bo_ccs_pages_start(struct xe_bo *bo)
> >  {
> >  	return PAGE_ALIGN(xe_bo_size(bo));
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 179758ca7cb8..32bc6d899c36 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -2304,6 +2304,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
> >  			op->map.is_cpu_addr_mirror = flags &
> >  				DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR;
> >  			op->map.dumpable = flags & DRM_XE_VM_BIND_FLAG_DUMPABLE;
> > +			op->map.request_decompress = flags & DRM_XE_VM_BIND_FLAG_DECOMPRESS;
> >  			op->map.pat_index = pat_index;
> >  			op->map.invalidate_on_bind =
> >  				__xe_vm_needs_clear_scratch_pages(vm, flags);
> > @@ -2858,7 +2859,7 @@ static void vm_bind_ioctl_ops_unwind(struct xe_vm *vm,
> >  }
> >  
> >  static int vma_lock_and_validate(struct drm_exec *exec, struct xe_vma *vma,
> > -				 bool res_evict, bool validate)
> > +				 bool res_evict, bool validate, bool request_decompress)
> 
> We have to many bool here but can clean this up in a follow up.
> 
> >  {
> >  	struct xe_bo *bo = xe_vma_bo(vma);
> >  	struct xe_vm *vm = xe_vma_vm(vma);
> > @@ -2871,6 +2872,17 @@ static int vma_lock_and_validate(struct drm_exec *exec, struct xe_vma *vma,
> >  			err = xe_bo_validate(bo, vm,
> >  					     !xe_vm_in_preempt_fence_mode(vm) &&
> >  					     res_evict, exec);
> > +
> > +		if (err)
> > +			return err;
> > +
> > +		if (request_decompress) {
> > +			int ret = xe_bo_schedule_decompress(bo, vm,
> > +							    xe_vma_start(vma),
> > +							    xe_vma_size(vma));
> 
> As stated above, start / size are not needed.
> 
> > +			if (ret)
> > +				return ret;
> > +		}
> 
> 
> I'd write this like:
> 
> if (request_decompress)
> 	err = xe_bo_schedule_decompress(...))
> 
> >  	}
> >  
> >  	return err;
> > @@ -2958,7 +2970,8 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
> >  			err = vma_lock_and_validate(exec, op->map.vma,
> >  						    res_evict,
> >  						    !xe_vm_in_fault_mode(vm) ||
> > -						    op->map.immediate);
> > +						    op->map.immediate,
> > +						    op->map.request_decompress);
> >  		break;
> >  	case DRM_GPUVA_OP_REMAP:
> >  		err = check_ufence(gpuva_to_vma(op->base.remap.unmap->va));
> > @@ -2967,13 +2980,13 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
> >  
> >  		err = vma_lock_and_validate(exec,
> >  					    gpuva_to_vma(op->base.remap.unmap->va),
> > -					    res_evict, false);
> > +					    res_evict, false, false);
> >  		if (!err && op->remap.prev)
> >  			err = vma_lock_and_validate(exec, op->remap.prev,
> > -						    res_evict, true);
> > +						    res_evict, true, false);
> >  		if (!err && op->remap.next)
> >  			err = vma_lock_and_validate(exec, op->remap.next,
> > -						    res_evict, true);
> > +						    res_evict, true, false);
> >  		break;
> >  	case DRM_GPUVA_OP_UNMAP:
> >  		err = check_ufence(gpuva_to_vma(op->base.unmap.va));
> > @@ -2982,7 +2995,7 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
> >  
> >  		err = vma_lock_and_validate(exec,
> >  					    gpuva_to_vma(op->base.unmap.va),
> > -					    res_evict, false);
> > +					    res_evict, false, false);
> >  		break;
> >  	case DRM_GPUVA_OP_PREFETCH:
> >  	{
> > @@ -2997,7 +3010,7 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
> >  
> >  		err = vma_lock_and_validate(exec,
> >  					    gpuva_to_vma(op->base.prefetch.va),
> > -					    res_evict, false);
> > +					    res_evict, false, false);
> >  		if (!err && !xe_vma_has_no_bo(vma))
> >  			err = xe_bo_migrate(xe_vma_bo(vma),
> >  					    region_to_mem_type[region],
> > @@ -3305,7 +3318,8 @@ ALLOW_ERROR_INJECTION(vm_bind_ioctl_ops_execute, ERRNO);
> >  	 DRM_XE_VM_BIND_FLAG_NULL | \
> >  	 DRM_XE_VM_BIND_FLAG_DUMPABLE | \
> >  	 DRM_XE_VM_BIND_FLAG_CHECK_PXP | \
> > -	 DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR)
> > +	 DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR | \
> > +	 DRM_XE_VM_BIND_FLAG_DECOMPRESS)
> >  
> >  #ifdef TEST_VM_OPS_ERROR
> >  #define SUPPORTED_FLAGS	(SUPPORTED_FLAGS_STUB | FORCE_OP_ERROR)
> > @@ -3322,7 +3336,6 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
> >  {
> >  	int err;
> >  	int i;
> > -
> 
> No related.
> 
> >  	if (XE_IOCTL_DBG(xe, args->pad || args->pad2) ||
> >  	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
> >  		return -EINVAL;
> > @@ -3363,9 +3376,9 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
> >  		bool is_null = flags & DRM_XE_VM_BIND_FLAG_NULL;
> >  		bool is_cpu_addr_mirror = flags &
> >  			DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR;
> > +		bool is_decompress = flags & DRM_XE_VM_BIND_FLAG_DECOMPRESS;
> >  		u16 pat_index = (*bind_ops)[i].pat_index;
> >  		u16 coh_mode;
> > -
> 
> Not related.
> 
> >  		if (XE_IOCTL_DBG(xe, is_cpu_addr_mirror &&
> >  				 (!xe_vm_in_fault_mode(vm) ||
> >  				 !IS_ENABLED(CONFIG_DRM_XE_GPUSVM)))) {
> > @@ -3397,7 +3410,9 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
> >  		    XE_IOCTL_DBG(xe, obj_offset && (is_null ||
> >  						    is_cpu_addr_mirror)) ||
> >  		    XE_IOCTL_DBG(xe, op != DRM_XE_VM_BIND_OP_MAP &&
> > -				 (is_null || is_cpu_addr_mirror)) ||
> > +				 (is_decompress || is_null || is_cpu_addr_mirror)) ||
> > +		    XE_IOCTL_DBG(xe, is_decompress &&
> > +				 pat_index == xe->pat.idx[XE_CACHE_NONE_COMPRESSION]) ||
> 
> The above check doesn't look right. I think you may to check pat_index
> against enabling compression and reject it.
> 
> >  		    XE_IOCTL_DBG(xe, !obj &&
> >  				 op == DRM_XE_VM_BIND_OP_MAP &&
> >  				 !is_null && !is_cpu_addr_mirror) ||
> > @@ -3417,8 +3432,8 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
> >  				 op == DRM_XE_VM_BIND_OP_PREFETCH) ||
> >  		    XE_IOCTL_DBG(xe, prefetch_region &&
> >  				 op != DRM_XE_VM_BIND_OP_PREFETCH) ||
> > -		    XE_IOCTL_DBG(xe,  (prefetch_region != DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC &&
> > -				       !(BIT(prefetch_region) & xe->info.mem_region_mask))) ||
> > +		    XE_IOCTL_DBG(xe, (prefetch_region != DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC &&
> > +				      !(BIT(prefetch_region) & xe->info.mem_region_mask))) ||
> 
> Not related but is a good cleanup.
> 
> >  		    XE_IOCTL_DBG(xe, obj &&
> >  				 op == DRM_XE_VM_BIND_OP_UNMAP)) {
> >  			err = -EINVAL;
> > @@ -3433,6 +3448,12 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
> >  			err = -EINVAL;
> >  			goto free_bind_ops;
> >  		}
> > +
> > +		if (is_decompress && (XE_IOCTL_DBG(xe, !xe_device_has_flat_ccs(xe)) ||
> > +				      XE_IOCTL_DBG(xe, GRAPHICS_VER(xe) < 20))) {
> > +			err = -EOPNOTSUPP;
> > +			goto free_bind_ops;
> > +		}
> >  	}
> >  
> >  	return 0;
> > @@ -3686,7 +3707,6 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> >  		u64 obj_offset = bind_ops[i].obj_offset;
> >  		u32 prefetch_region = bind_ops[i].prefetch_mem_region_instance;
> >  		u16 pat_index = bind_ops[i].pat_index;
> > -
> 
> Not related.
> 
> Matt
> 
> >  		ops[i] = vm_bind_ioctl_ops_create(vm, &vops, bos[i], obj_offset,
> >  						  addr, range, op, flags,
> >  						  prefetch_region, pat_index);
> > diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> > index 413353e1c225..7d652d17b0dc 100644
> > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > @@ -357,6 +357,8 @@ struct xe_vma_op_map {
> >  	bool dumpable;
> >  	/** @invalidate: invalidate the VMA before bind */
> >  	bool invalidate_on_bind;
> > +	/** @request_decompress: schedule decompression for GPU map */
> > +	bool request_decompress;
> >  	/** @pat_index: The pat index to use for this operation. */
> >  	u16 pat_index;
> >  };
> > -- 
> > 2.25.1
> > 
