Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F38AC3600C
	for <intel-xe@archiver.kernel.org>; Mon, 31 Mar 2025 15:23:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D52C110E41E;
	Mon, 31 Mar 2025 15:23:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f+j+cS8R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C17210E41E
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Mar 2025 15:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743434628; x=1774970628;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=eJTlC61caj94UCLCAugcYxVYMT7/DUgHF9/gSMtQNdQ=;
 b=f+j+cS8R50Hc/RcTe/WUeCz+qZVXNNcoCZ0/52ZmtgmfIDzVFE/VjgwR
 3+PANXndrNT/tS8Yp4CniVtl9DWk0baf24009PnNVAsEgzvCuPWUF9wFH
 4naXqipF9Gi+sa3UvvQWtbS4BGZb1mngCJ5wkb5HMBAgdC1exzSJavEQr
 AV6ujNiMcba2oB/EaIZ6GKvbFWD9ELON9tzjgYwn2AAyfIt0fpzn0mC2d
 HMHbG21aLt7rqnsr/+iUcBH02tslStOY2e3wpyj8xlwQx6LP5/UG8kBTR
 six4GdNaDD3CWwWtpmNW95cM96aAR4h/ad/g/ZgHvfuPgeaJ46DGfFmcv g==;
X-CSE-ConnectionGUID: JJkS+tdZTbKvRTXNimsjPQ==
X-CSE-MsgGUID: qCRVR03nTDKf8aV++CfWUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="44902160"
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; d="scan'208";a="44902160"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 08:23:46 -0700
X-CSE-ConnectionGUID: MnjHPIuIQbuWsQBLfhtIiQ==
X-CSE-MsgGUID: loZIRWeNQRS4mejUcJplUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; d="scan'208";a="157037009"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 08:23:47 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 31 Mar 2025 08:23:46 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 31 Mar 2025 08:23:45 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.49) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 31 Mar 2025 08:23:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AqQ/+tSsiKMDCAiWV71PuMJOVTRgjDkZrFzL+yT3NZ1lpZbghlWuuoUfLsc1HU2VkUhTgzZ2PNW2IuYNRa4BZbRwUDDnfWv1uX5gvdwkwQ3qUWP4HmfWjkkslWbO1WoHnyKay4z8QtZGskyVKTWSmQqRXr9nEcekN9OajAstOAqnuFkifA5F/90uUZ0eydl4dmzkhsRk/uA2YXP22kKd1zb92q1xnLCItmRZ8wTdrfp9/dRX8QNDciXKn1GFg4lxECGeikTDBm9DyJZ5b3c3WQDXQiIhn2x4vHLsBSdVGJpUSWGRNf20tOJ+cbgLGmMncsqMsyvqFHAmGwTQ4OYCWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vzH/ILFa+jbao0nd1tCWIwgIUY9iWuJvRyvFLi0h6pQ=;
 b=PO3yy9bOxE3B3UwuCh/0kbmKX90OdMIKWDGopM0GFEVdec2YOuIjTn7KIS4GVkKPWXO0MM921RlPZBV3vHwgA8NpnefJwe+XCeY5qUi+VJo3bIBgyTymFcOLJFsgnZcz3bFGYZoxc7jqnRimQq5sOuSOp/tel3Cz2Q/3l7/FeQwvSKFM19gmU8/BnIZIod6hLYKLm9GxjHTAqJz5EukOGiGFs22cIMTeG4eCo2yWZKtSu4R3T+vzKttwrvUhirRjG6poMoAs13kHvx4rzC1h6032zDY/fmoXVfiG9Mph5nuCQPgVnJOf6NgtQd0pGEqXpzu3Y/DW3j8gdOslOfSCgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by CO1PR11MB5058.namprd11.prod.outlook.com (2603:10b6:303:99::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.50; Mon, 31 Mar
 2025 15:23:42 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%4]) with mapi id 15.20.8534.043; Mon, 31 Mar 2025
 15:23:42 +0000
Date: Mon, 31 Mar 2025 11:23:39 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Raag Jadav <raag.jadav@intel.com>, <intel-xe@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <riana.tauro@intel.com>
Subject: Re: [PATCH v1 1/2] drm/xe/debugfs: Expose PCIe Gen5 update telemetry
Message-ID: <Z-qzew1aK4LvL-Ir@intel.com>
References: <20250331142336.640226-1-raag.jadav@intel.com>
 <20250331142336.640226-2-raag.jadav@intel.com>
 <yujx3wbw5du2pl3po7ahwrmefsroueqf7sa4gimobelbpdfqcz@ifw4g2ctn4vg>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <yujx3wbw5du2pl3po7ahwrmefsroueqf7sa4gimobelbpdfqcz@ifw4g2ctn4vg>
X-ClientProxiedBy: MW4P222CA0016.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::21) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|CO1PR11MB5058:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e533a7d-e4de-47c4-b7c4-08dd70680562
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2vXN4ydh3+YUo2GGCHbGtuLyonQBVj7LG7mzZL4KFz/cKkbpYcv7MJ2U4CJN?=
 =?us-ascii?Q?HyZF12PBQ8ktgOkZYGMBykrWUYLVzEix9lNcQPi6inVjf7a8UWeNnIznAyDo?=
 =?us-ascii?Q?hcKTH9/DkorRCVOrsMpilbQdKBP0uApN5ixHxe2aWzKpx8gW2iGeiF2DFq//?=
 =?us-ascii?Q?8JtQaF3sq1l5UL2U+WyT9OqsUCmseSqn1Hd8ma/WC9/XpYTGj1keHbS+4rro?=
 =?us-ascii?Q?FOFBUfVxxH4vHN6CieDLHv+WXa6CYgKTYVHvsJVPk4xCYoEorAfSj572K2do?=
 =?us-ascii?Q?GmTShekGbfyzRGRZwuGCDI7KNVZ8Hn0ucPgAeUCzA3bQOQhUhMITav5z2f/B?=
 =?us-ascii?Q?JBau1dAgmpg13Mh9k4/ny/cjlfqkOtreXPNpAYgxbp7RtuKB+e7mg+nJXC+T?=
 =?us-ascii?Q?nmXSc33cSKJr06AKThEMoWP3IvlSJosvCqaVC/ClQ8qYuTtPCQa6Xc0tYPYo?=
 =?us-ascii?Q?3EuccAmnHqA8QGkkxBGHWWeektJO1OyJkonJ3WcZtOJ1rvBd+BZ2dci9zbs9?=
 =?us-ascii?Q?oHj2s6hvzJ8NhirhVD1XYcA819GSg0tMJiTh5AXLv3x6hsfJIpYUHE3P67F2?=
 =?us-ascii?Q?wPOyZX8/uLZEyOJGhOklvPzhctzuXwex7bpKzafFNsqkeiKT4PVu/yhYznZD?=
 =?us-ascii?Q?+RxcH2Wuy2NhIN7U9TkAU6SHhg/wZgY9M0h9aO0UhSVl7iNrVzTay8hgq7PF?=
 =?us-ascii?Q?4Fcl9ZiwymUEoW5YXnFvGoP0Wl4RMCNdamzOtfNqhJhaBjT9q3FiHEC08zdz?=
 =?us-ascii?Q?+nozruDclogFhkAPtrFHOkvSC4mVtXWa/m5XGtzYeGSx5btWCZEKMLnPfUic?=
 =?us-ascii?Q?vpBF4GQs3qrlBk2Td41m61urZayh/GRYeMd9mDMFULqVg/7BsOwFdcFvZBA6?=
 =?us-ascii?Q?N5n/7t7nwI2P/+npg+lMrapNUcdbGq+18yz8d8VJKuSJbda9lb4vO3PJrgxq?=
 =?us-ascii?Q?v0uZlnfJu61L92wVPNGIjEAxrNa9PnlZoK1MCxeQTaqZ/6ck+Dv+wcsJlfa/?=
 =?us-ascii?Q?5SLLP42kplaqJ7H12OeMHffZu+TmmULzyAcglJalJxEuAhviOyGmF+LFTCOn?=
 =?us-ascii?Q?QFK8HrRjqznVloZbZRzLT5GppsjgS9lWRldYL5rTXbJgQqtmznSDWrDZE8CF?=
 =?us-ascii?Q?hLew45Hp+HFTo8w0gRv59gPeOyPFdPQx8Ksz5F+R5grP64RBlKtEtjA6QosU?=
 =?us-ascii?Q?OjDOTxNzxQryAxU9HfPIVREJbk2PVCUbLSBawi1HKiu013LYeK6zgjkUgR/1?=
 =?us-ascii?Q?TyfYM/oefhfdOcP+6SrSaE5W9kbbHxsRm5ih8cBtRfM1jlb7VPibWaoK+Ezf?=
 =?us-ascii?Q?BHkQU129DXjnMNceU3MmhlgljS/nY6xvR2I1j0qey7pkD0pAzvD/1O32VyGL?=
 =?us-ascii?Q?SU1ULItuFGuIbGMyA/m+5YlbwPAO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xFCdu1pvrmt/kMV0QkWElobS1WPn55FpGp46/diPihBqpZl7pula33wrtfAY?=
 =?us-ascii?Q?PLXsTM5ga/gKJmgkr4BjuMJjzAPgchPHPIF7BIeKeX4thG6fY/IlUeCC10hp?=
 =?us-ascii?Q?ZbbEd2I+UVYRk4QHxAypQRjHpbzNo/Clo1nHhe57BAKo4n/vqCO0JkvYaagD?=
 =?us-ascii?Q?QSu/S5pgbxavKNHugqTEUYZV14Ex6Mr1AmozZ1AbSCEnJv+RZjX31TrQexvE?=
 =?us-ascii?Q?Bv3QvrcGGB+Np6RbDQSuee56S8FyRU/Ovv8kOZkQpr3VcFRNMTBJ3MyTAwq/?=
 =?us-ascii?Q?57Q6hK04oTxLbY/x4iFd1KCfCmhtyiQYcUuquxSrKm1jfMUOVsZKtqkGr2uA?=
 =?us-ascii?Q?MSTbb/GFTjju7O7Pp85j33rUMNPamx1LTkYBzejeXK/t5iVb/oS17dF5oFAz?=
 =?us-ascii?Q?HmKECYfgq0R3xmA0B5NznEPF+q+Ux79gePKm2r/E2LqonunhNpcUeTu4Sx6W?=
 =?us-ascii?Q?UjWL6fR83GvKzyo6y4+G8MuHyADGkbMWAzHYTZ7/SbfnmdPIk536LOwCAFSw?=
 =?us-ascii?Q?I6tNRy4RObkVyIaKkNVapNPlBFIMiEFPDa5giAXJ3iJ5CUoZDQHfBkox2MRH?=
 =?us-ascii?Q?sDU0uC7tTxcempVUXapMoZifStNAzWHC5B75kYd/4JTu6wU41SDV23AQv6bm?=
 =?us-ascii?Q?yoRPAkTJGHu64ufMmmSr7YpJJrjdps92Rk2h9FC3t8ftMP0StHiZb0UVi9rX?=
 =?us-ascii?Q?3jNH8Xg6B0YX0qqZej37K5gyX+VMFcmv6D3g234tSzDhudTWYipOf6rOQYrT?=
 =?us-ascii?Q?jBm8xvESDJPZaPvsc9SBqabfEqKIP/t6Nb91B5WxqToz1nnbzQ8DnbBpShjk?=
 =?us-ascii?Q?ueGoicp1wprYuYNZET2ls27go1yDDU8LYgTCFaPA/8VG1ZZUu2jdVIOlUZDc?=
 =?us-ascii?Q?ovczVR8RdrU3WLY2qLrMVtTmXUDQXqDW3AsAzsQaazC9kkvCP3bOa6HpJI59?=
 =?us-ascii?Q?6md6q8OoT07TtYsqPJlQKjziPvuIS4zY9Gy8SafV77vqIVUXpStfujRgg5qW?=
 =?us-ascii?Q?/A5HbV37BN/0KdXVbo9N0XIrLli9vZc5Esy9LIo+I9ISjhuK6BQMm7vB//AU?=
 =?us-ascii?Q?+xiC6QQb1oiaCkIhtHgIkreYnqGkRuNfD6j3aSbf0j0NRaC3iMZcMq0RcIOE?=
 =?us-ascii?Q?k1vi4K20OIqjZnUAOJakVpNTa7tFRUNqyt4f1HoLE25hEypMVDl7eRkCkOvs?=
 =?us-ascii?Q?1qsp3QLGD668h3ihqmQVVa/u1I/Fb8Gur5VB+oBRPKUHiuBdc4LichrEaari?=
 =?us-ascii?Q?k5unTZSRdmBXi9FZrBrfM1qJplEgoYyWeHanUrDpRr4as1glavjQXYRl1Kvb?=
 =?us-ascii?Q?kGdRzfvx8hpEbH4vR2k43fl6OQggkLkkXmDiIE/CcPbIipCz0dhm71gzA9/s?=
 =?us-ascii?Q?7Fs8rzZXzqbDtIl8jnkPUuPG2kC7Ep/783tzL2j3c6NDxCatGjxMFBK2adaP?=
 =?us-ascii?Q?WEBBaViEayh3lCq68VSGJd2q67utCuAalbgyY5QKJUrxp0bvP/wU7DS7q7v9?=
 =?us-ascii?Q?8ybzs1hFm41TFZvhfRgzI98bQS1vNT+/USzGUq1CYAFEt262XOAPnuZTIg7z?=
 =?us-ascii?Q?Fl84/hPcVL0bQbaoETHoopUsLA29+7XrwxsoZCRDshPLa5T6n51KvTkhvUVi?=
 =?us-ascii?Q?tw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e533a7d-e4de-47c4-b7c4-08dd70680562
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 15:23:42.7812 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oN5vOtUJTJ/Xo6W+mKL85Z9AM+zFTonQYdavEonPDZixV4ta/rMK64fNtFCu99fcirWeYZvtaAYPCT3kwVZwIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5058
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

On Mon, Mar 31, 2025 at 09:52:28AM -0500, Lucas De Marchi wrote:
> On Mon, Mar 31, 2025 at 07:53:35PM +0530, Raag Jadav wrote:
> > Expose debugfs telemetry required for PCIe Gen5 firmware update for
> 
> telemetry?? it doesn't seem anything related to telemetry here.

telemetry is definitely not a good word here...

> 
> > discrete GPUs.
> > 
> > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > ---
> > drivers/gpu/drm/xe/xe_debugfs.c   | 93 +++++++++++++++++++++++++++++++
> > drivers/gpu/drm/xe/xe_pcode_api.h |  4 ++
> > 2 files changed, 97 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> > index d0503959a8ed..67c941abf4fe 100644
> > --- a/drivers/gpu/drm/xe/xe_debugfs.c
> > +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> > @@ -17,6 +17,9 @@
> > #include "xe_gt_debugfs.h"
> > #include "xe_gt_printk.h"
> > #include "xe_guc_ads.h"
> > +#include "xe_mmio.h"
> > +#include "xe_pcode_api.h"
> > +#include "xe_pcode.h"
> > #include "xe_pm.h"
> > #include "xe_pxp_debugfs.h"
> > #include "xe_sriov.h"
> > @@ -191,6 +194,89 @@ static const struct file_operations wedged_mode_fops = {
> > 	.write = wedged_mode_set,
> > };
> > 
> > +/**
> > + * DOC: PCIe Gen5 Update Limitations
> > + *
> > + * Default link speed of discrete GPUs is determined by FIT parameters stored
> > + * in their flash memory, which are subject to override through user initiated
> > + * firmware updates. It has been observed that devices configured with PCIe
> > + * Gen5 as their default speed can come across link quality issues due to host
> > + * or motherboard limitations and may have to auto-downspeed to PCIe Gen4 when
> > + * faced with unstable link at Gen5. The users are required to ensure that the
> > + * device is capable of auto-downspeeding to PCIe Gen4 before pushing the image
> > + * with Gen5 as default configuration. This can be done by reading
> > + * ``pcie_gen4_downspeed_capable`` debugfs entry, which will denote PCIe Gen4
> > + * auto-downspeed capability of the device with boolean output value of ``0``
> > + * or ``1``, meaning `incapable` or `capable` respectively.
> 
> It doesn't seem like something to have in debugfs. If this is for end
> users, they may not even have debugfs mounted or available at all.

I was one pushing it more towards debugfs, but I now believe this is sysfs as is.

The admin needs this information before upgrading the IFWI.

> 
> Please clarify what's being used for this firmware upgrade.

The final goal is to have the fwupdtool. Some work that Tomas had started.
We are still clearing the path for that. But also there are some igsc tools
that can be used now to flash the fw...

And likely that XPU manager soon plugging into that.

> 
> > + *
> > + * .. code-block:: shell
> > + *
> > + *    $ cat /sys/kernel/debug/dri/<N>/pcie_gen4_downspeed_capable
> > + *
> > + * Pushing PCIe Gen5 update on a auto-downspeed incapable device and facing
> 
> Isn't the ability to downgrade the link to Gen4 something controlled by
> the firmware? Why would we push a Gen5 firmware that can't downgrade to
> Gen4?

There are safe combinations out there that works well and safely in gen5.
No need to downgrade. But in many cases it is safe to check the gen4 downgrade
possibility and status...

> 
> > + * link instability due to host or motherboard limitations can result in driver
> > + * not being able to successfully bind to the device, making further firmware
> > + * updates impossible with RMA being the only last resort.
> 
> when starting survivability mode, can't we always force it to gen4 to
> avoid this kind of issues?

We, we cannot choose that from software.

> 
> Lucas De Marchi
