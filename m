Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79284606A319
	for <intel-xe@archiver.kernel.org>; Wed, 21 Oct 2026 21:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ks9YHHNV
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FAB6112214;
	Wed, 21 Oct 2026 21:25:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 162D411221B
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Oct 2026 21:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792617895; x=1824153895;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2Yl8MrB0/nV+I5OtziplPNL0BOb21e7B/Wca43Y/UbY=;
 b=ks9YHHNVVgvn9zBMJKK5t80/oWEsnZmBhDYuv7bj//Bf5TlcR9qpzphg
 uetHSpHD9lcrgBIeafSwNulseeeRQnFknrbrfvEpsIjNNvRMfNSX2ZgQ3
 bNc3gcJoFMKHZ2PYDSs2hm7bSd0yPx9aGJMJVU3tFGAbCOWeFYZs8yCEc
 zOT57GjI1IuCX5w4PyUd7hMoXw86ZBvjmOUkhNE27LYKwc8RjuPn/Unc/
 1c2utt/xb1PBQn63npzKqNfhIcsATyCnP9ZkPg9DzkFYHTE+pa2gomOq3
 NVF+nXo3c5zHcEwY8UtVyNiy30WcGGWMI0G6VTi1AC2S4ZPCxkIr2EDS8 w==;
X-CSE-ConnectionGUID: iO16cvD1SNW/N2uuWrZAXA==
X-CSE-MsgGUID: uDxLiRy0Q9uOjD55XlHazQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1244417"
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="1244417"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 14:24:54 -0700
X-CSE-ConnectionGUID: w6Ax4UW8R/6ijUMsKghAsw==
X-CSE-MsgGUID: U91fwu2ISImo1wlpbRwndA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="3128453"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 14:24:53 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 21 Oct 2026 14:24:53 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 21 Oct 2026 14:24:53 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.51) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 21 Oct 2026 14:24:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bpDVV4Yb0+oDU1FRn3rRYveHJ6iSHl2fVgEmcFxgW0pZLO5tDJyiooUVGtsx3SCcRvpw7UQhA17G2k6til01BAKJ/Isc5X7+lg+sSItSRyT2v+qcdnwh1NHBrJF/bI/6lyqCtYcdedHj0X+sjauJh6rVYfErB462SmkWT4ONH6G2CBJThUSoba7EDjjVYYOnVRVNz1OWloG/mlS7XV2WNqQW42NeGyfzVwGVi2UOVsYRCxR47AppL+EaiwG3W//1UXiJyIaGWiCRaPwd3sqeeCtcONtk7reI7JlgWd07PvTpsvG+YV8uF4oCcNfp5r5McUOD4XZBS09mESt4wFs9Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=30plbOpZp6TVkYRZGAOvGRzodhkQWoIBuvTq0a5hFnY=;
 b=dv+FLh08Qcd/8d8SXxDxrMHa6ptXZCEj5yYyERmBmCnTlWP/UDUeHR3j6bXO9HRs3quXYJOe0VocyyMpK8ItLcsWJT37DskqFXHlSmiyfbhktCmQ6/uw+iL4xJJVkkC0W1mQWh91FjRef1rQ+2yo//KxGCvtUI+oTaUJV3TH1j1xc9NdwwGzLcl4w6LojttsS4F0hkiUmyFMcLOXFP4muItsSXHEuvaIi/vBOqFClx/elHMMn3fgrTJGt1WYAkVk4KDCPvmzQexOjSFOiHm3SSf5STA1GJOzaoMmgM428rw6YjXMCNTwG5PwknYNQ2+oZzYd9B7eKjvpYm44adLfxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4787.namprd11.prod.outlook.com (2603:10b6:303:95::23)
 by MN2PR11MB4758.namprd11.prod.outlook.com (2603:10b6:208:260::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Wed, 21 Oct
 2026 21:24:51 +0000
Received: from CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd]) by CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd%4]) with mapi id 15.21.0546.012; Wed, 21 Oct 2026
 21:24:51 +0000
Date: Wed, 21 Oct 2026 14:24:49 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH 0/6] ATS/PASID SVA support and PRI-less fault servicing
Message-ID: <atktoYr4H6wjnR4m@gsse-cloud1.jf.intel.com>
References: <20261021041117.1774877-1-naresh.kumar.g@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261021041117.1774877-1-naresh.kumar.g@intel.com>
X-ClientProxiedBy: MW4PR02CA0029.namprd02.prod.outlook.com
 (2603:10b6:303:16d::34) To CO1PR11MB4787.namprd11.prod.outlook.com
 (2603:10b6:303:95::23)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4787:EE_|MN2PR11MB4758:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cf3947e-d179-4de0-593e-08df2fb9bdbc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|6133799003|18002099003|22082099003|10067099003|261021121427099003|261021123027099003|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: 4GmWbL3ZuXFEwJdhtPYf38EWJrfBeAK8vBEnWMAApSN3/pnON7Fbo+6qNFir8oC+tIP7O5wNCir06QpUa9ELjWfLyikmkF0AnxrFVaSpMU90iWXFiQ84PeWCri0aZWj4lUOaIdYLs2qNpFtRWhhd/xVjFpEEWsb8ZO6zT1lSPy3Ot13goU2n9CtdAYDjBNeCrKbhrk/gvXvOFNChlQ20EUu3Z5VMM5REWXoWarQYKQi7WobZHiSmzn2njs3oau+jNhipokcA7VIh3cfVH4HDQGiYgVJwZFt7iAdlY65bQgEFgFbTcAQAqdkJtN1bl3AMesdO29hQxNSV6eT2H0T6yFsUKMLeHPdxMdVshMkyQvQH/skpSLdNz1W0tNqUbxmmt57S6+3Bo3HHWSRgE/xWJNvu2DHkV4qtpINMG8K8Ah/28RkafRwaHJRk+OKpO9JRR82Zz5oQEXmqM4UrUeWoTgQOYqmu7Yq6uk9McsvFcYKGYMtdGNeYd82QDimDRb4oOo3MFQhW3Pj9k3BReXuGnITPzrGngE3gA6Kg7mc2vHiHr6zwIuxkEpo8uL1522XoYsCWD9INAidnEiIgj51aJ/yEw8k2BKrGS3ApFHh8ykyvqSxoNewqZQhdAkxsltXfjkWddh7NqQBYEh7mCUDt6c9IjQfGt25eZl26oCEgoxY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4787.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(6133799003)(18002099003)(22082099003)(10067099003)(261021121427099003)(261021123027099003)(11063799006)(261009223027099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HokIVerJEHz6BMuB1WO+5EbL8E7IIC8M+hWWNF10dZpD0N1GWX2P0pwCoO6O?=
 =?us-ascii?Q?wYgvSPsQGBQ/a+/isNoN/0tpBt3yy231ZKvR1SPLaGHXaHKmZnm73HrHyrSa?=
 =?us-ascii?Q?lPpCju8C7dH8BvClWcxaNXcyJxwM5VDd04LEoIVh12pU81HStn3wgh3QpqGw?=
 =?us-ascii?Q?HxO4p6+Sb+jtmdVQO3Y7ngwQrhem0Rhl2UjzO4z1PfZvAgbRoUuAbZ1Jixko?=
 =?us-ascii?Q?v6gNv3ZRHuvB+36MrEOJaA2Vb/IwTxHtyEKuRW4Yppxvzfkbs+Bq587jj03C?=
 =?us-ascii?Q?HWsjGafdsO6TXlJgT1aeExVTwfxkz0K9MGe0Sn0FSedbyyUeyz13wRrqtI29?=
 =?us-ascii?Q?0VWH0NmihJJK7tag8YfnY028DdyX4b7ISnf82CBAhnipWIVzFD86BO9R/ZGT?=
 =?us-ascii?Q?okDZKys2zpJN0RJrQRlV7O217pbdd/NQbLXpqX+MzpRKk7zu9jdtagGD+Ea2?=
 =?us-ascii?Q?FI9NowDDY7tZKbLf02i2zhLvfFr4Lnn5SyFQdNuSBjpRFWFTReppmoTM1/UT?=
 =?us-ascii?Q?lqe/pptJXjQj1FLnL+8wqcYdF9+Va4rA36c5JOdkc9AA3DOpVlA2QRnZZzd3?=
 =?us-ascii?Q?RW4Zss7oAY5hBkSe5xs7jplCt5BRIN+iWm8cikgBy/cvgcYO7UG/7pJPahd0?=
 =?us-ascii?Q?e9Nd8S/yhBhxffkTorCcYf4B+RZbb2tN74UCg8imu/bEYLbAtgHtWuGQqSWM?=
 =?us-ascii?Q?bG3w8nAmi85BumB9owgMxuSBn702Lh5HEzArP8TPhRmv+jhpjpFMzrmZ/VKB?=
 =?us-ascii?Q?WKPNMjO2eNvGgQ9t4K4yvfEdzY95ZAIK6tBnY/qKPfTSjGEXEdFCkh1ELMlG?=
 =?us-ascii?Q?FPMJERleVCuVxSekk0G7olju/b0ZqNpM4HxFDB/cqf0zAyGv5P+QjvnuypfU?=
 =?us-ascii?Q?bYf6uy4ozv6p0+qqQubrjbM3+Px2MKr+mdmCs2Ez9uet+DwqxEeePVV/Rk9q?=
 =?us-ascii?Q?1tXTZlGdJjPnE4zsixnR+meebgXfToPnHrrHTN36NdGeyQPoc+gxGScdlpAK?=
 =?us-ascii?Q?vEKto8SOg5JlYBppNExJd0clBsxYuCKMBo/GDk79dTLygnUK1qWreSljDVE+?=
 =?us-ascii?Q?JvFuTvJjQLPRR3iSjE9uLwBuYt1K+Tcn4oJNPCaJPVPkJQP1N1MzWneVbPex?=
 =?us-ascii?Q?bF43815D6jnv440tpbQVi8yGwMMibzDzKHG08VIGiFzOw4/MYrSa2HiQkB76?=
 =?us-ascii?Q?Om6pM/CSxZaGGesHDlNcgAT5UfJRPkzd+1y5gzYT1P0TMGGbEKrC80rInsqy?=
 =?us-ascii?Q?htiGlWDYvcvZqNxd5bqF2OpodRDRgx0XlSb9Y1X6lk4ehgFPZRwI4NtOfu8g?=
 =?us-ascii?Q?MJlU+xNRk1/etx0JHoJWyGquJtt94lERd4hyckaMk8UlZlLKkHq4WPZKJKs9?=
 =?us-ascii?Q?XAc9hu/P6X0VfM5/P0qMLsVIXUsb7OsJHtZixHfrL5wo96pGBALWrZvhA/+4?=
 =?us-ascii?Q?WsMgLOv4qck+6V73Q1s9gGlvtVb1W3ObhPC8obN7Xz+HfcmhN0ptx2N/loUi?=
 =?us-ascii?Q?NtW7I8/AuuloSZt9MHXQuIHJJ2D/dA0FD904llECUJEY2WYoFrFXP4DKknKS?=
 =?us-ascii?Q?ITDfrIyxeHiCki4gPrM6vvQC7+WvCvsxc6rnMHbWgGnO7g/Hs7DtM9wl4CzH?=
 =?us-ascii?Q?+SRJXRWeIto7pu4cDcCEQXm6wvk87kQkRIFyrTqTUMlzQ1Vs2RJjwxpPg2dT?=
 =?us-ascii?Q?E/au9IOwU1quDN7+1PzbacNyWE0DoT1h0q3AritXhCBF8MA25bZpEDj6t8j8?=
 =?us-ascii?Q?yQl9hsKHmQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: SGww5Cd3gHjxtTGuggzcnYleKwrTIJaqdIO15xPxot3ypcxqc/qABVYq6NTFnfe+ueqcURS4AwQiUe54WAbCYXXXAXBeX/c6ZLAen1Jh2gKJxaBDwikmQZr3CxwUu2euMuGnTUaX5b6dvf1POmzSaL63IAK+xi/NwX2hXK/5zjc1M+xFeXz1/+efVa0ACJAfM5HPN8ro2oAbLytUpvcwWDFWHc2jDmJGHeVtnGquLSFfJWh9LThWy1WNKk1U7/9HdFqNEApdo2O5Pau0Zzd+GtxsDaUoiSP2PuY/VWwvP5FlFw0Yi7rApny4pTnq6FZbhUuBiFi2b3btKL7KtRNEVQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cf3947e-d179-4de0-593e-08df2fb9bdbc
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4787.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 21:24:51.0185 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: llauL+leeCh+XUZVM2p1KfCidXEufDaArPrLQriXbIQFnwVAguBkvmpM3h2AFq/8ykWGojJ5j4gTIu0mmMX5eQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4758
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
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 21, 2026 at 09:41:11AM +0530, Nareshkumar Gollakoti wrote:
> This series adds initial Shared Virtual Addressing (SVA) support for xe
> on platforms where ATS and PASID are available but PRI is not enabled or
> not supported.
> 
> For SVA, the device must be able to issue memory transactions tagged
> with a PASID so that address translation is performed in the process
> address space rather than in a driver owned address space. This series
> adds the xe side infrastructure needed for that flow: VM support for SVA
> PASID state, PASID retriveal helpers, and programming of CTX_SYS_PASID
> for ATS and PASID enabled contexts.
> 
> On systems with PRI, device page faults can be surfaced and resolved
> through the hardware page request interface, so the driver does not need
> to implement a separate fault servicing path for SVA.
> On non PRI systems, that hardware assisted fault path is unavailable.In
> that case, the driver still needs a way to resolve faults against the
> backing process address space so execution can proceed.
> 
> To support that case, this series introduces a CPU mirror VMA and uses
> it as part of a driver managed SVM path for SVA faults without PRI.The
> purpose of the CPU mirror VMA is to provide a CPU side VMA
> representation for the address range being accesses through SVA,so the
> driver can rely on the kernel MM/VMA machinery to validate mappings and
> resolve backing pages for fault handling in the absence of PRI.In
> other words, since the device cannot issue PRI requests, the driver
> needs a CPU visible VMA context that mirrors the GPU SVA range closely
> enough to let faults be service through normal MM paths.
> 
> At a high level, this series does the following:
> 
>  1. log ATS/PASID enablement state during probe,
>  2. add VM infrastructure needed for SVA PASID support,
>  3. add a helper to retrieve the VM SVA PASID,
>  4. program CTX_SYS_PASID for ATS/PASID-enabled contexts,
>  5. add a PCI helper for ATS/PASID operation without PRI,
>  6. add a CPU mirror VMA for handling SVA faults on non PRI platforms
> 
> Patches 1-5 provide the ATS/PASID and VM/context plumbing needed for
> this flow and have been validated internally.Patch 6 adds the non PRI
> fault servicing path, and feedback on that overall approach would be
> especially appreciated.
> 

Many concerns with this series, and I'm also generally quite confused
about the flows here. Let's take a step back and dig into what you're
trying to accomplish and why.

Prior to this series:

VM bind sets up PPGTTs.
- System memory uses DMA addresses (via dma-map) with DM=0 in the entry.
  These are GPAs (no pasid) translated by the IOMMU (or via ATS).
- Device memory uses DPAs with DM=1 in the entry.
SVM is configured via VM bind and CPU page-table mirroring.
- Pagefault or prefetches create mappings, data may or may not migrate.

After this series, all I have is questions and none are explained by the
cover-letter or patch commits:

1. Is a user expected to call VM bind? It seems the answer is yes.

2. Do we need any changes to the PPGTT setup? bspec53912 seems to
indicate that we do, but I'm not seeing any PPGTT setup changes in this
series. At the very minimum, I'd expect userptr to not use dma-address
and rely a PPGTT entry with P=0, FF=0 so the PASID walk occurs.

3. Are any programming model changes required in the UMD? If so, what
are they? I'm also concerned that this becomes a blind opt-in whenever
ATS + PASID are supported, as this would surely affect performance and a
UMD should have an explicit opt-in or opt-out mechanism.

4. Is SVM just implicitly enabled? Patch 6 seems to suggest that it is.
However, if I'm reading bspec53912 correctly and force-fault is not set
in the PPGTT, non-present PPGTT entries that correspond to valid CPU
pages would simply be translated and never migrated. If we miss in the
CPU page tables (e.g., the CPU has never touched the page), migration
could still occur, but only in 4K chunks, which would be terrible for
performance.

5. If SVM is explicitly enabled (e.g., through CPU page-table mirroring
via a CPU bind), we still have all the same issues described in #4 with
migration largely being bypassed. However, we'd at least hit the CPU
mirror and could perform larger migrations.

6. The most important question is: why is this being posted at all?
Unless we have hard data showing a performance benefit, I'd prefer not
to carry this code in the upstream tree. I could see some very narrow
use cases (e.g., userptr or SVM with a preferred system-memory location)
where avoiding a DMA map might provide a small performance win. However,
we'd likely need to rework things so that FF=1 is the default SVM
configuration. Alternatively, if we wanted access-counter-driven
migration rather than first-touch migration, this might make sense. 

Matt


> Himal Prasad Ghimiray (1):
>   drm/xe/vm: Setup SVA infrastructure for PASID support
> 
> Nareshkumar Gollakoti (5):
>   drm/xe/pci: log ATS/PASID enablement state at probe
>   drm/xe/vm: add helper to retrieve VM SVA PASID
>   drm/xe/lrc: program CTX_SYS_PASID for ATS/PASID-enabled contexts
>   drm/xe/pci: add helper for ATS/PASID without PRI
>   drm/xe/pagefault: add CPU mirror VMA for SVA faults without PRI
> 
>  drivers/gpu/drm/xe/regs/xe_lrc_layout.h |  6 +++
>  drivers/gpu/drm/xe/xe_lrc.c             | 37 ++++++++++++++++
>  drivers/gpu/drm/xe/xe_pagefault.c       | 49 ++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_pagefault_types.h |  6 +++
>  drivers/gpu/drm/xe/xe_pci.c             |  7 ++++
>  drivers/gpu/drm/xe/xe_pci.h             | 15 +++++++
>  drivers/gpu/drm/xe/xe_vm.c              | 56 +++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_vm.h              |  2 +
>  drivers/gpu/drm/xe/xe_vm_types.h        |  6 +++
>  9 files changed, 184 insertions(+)
> 
> -- 
> 2.43.0
> 
