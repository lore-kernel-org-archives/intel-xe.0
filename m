Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1284FC5DF81
	for <intel-xe@archiver.kernel.org>; Thu, 20 Aug 2026 22:20:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEF5F10E610;
	Thu, 20 Aug 2026 22:20:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nQpnmtnn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CBEA10E610
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Aug 2026 22:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787264418; x=1818800418;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=pLEjjVecQuixx72Xb/83EYs1Ue++M167vjl1E0QJQdA=;
 b=nQpnmtnnJcaSv2XmK5LpHMwV0LbmqHLs+gftjVtQ930gp3B/fBVwiZHp
 GMZJ1dxfTslyrNdtMp77oTsgpo/UxfPzUIlmFlXYuEj3l5CQ7TOr4QPSq
 YzzTcjnQmr83DeSdXfhfHDUDdFegmNAUgEj6IDdk/JNOIiVrqW1PZAJnZ
 ipPcA1pn1/rj5TjS4zp9W0gyuLA+DDeuUWxbIQamE7Ea64vWgv7unj3Y0
 j4220phC890MxNe47q91ovuAiODftlJAmQQt66lkdGHn9KXqqdgf5XTfk
 ZTpqXAGi0PDaHAbH9qYjSi8eS1YTfD9A+OZ9z1xKVjFJmmQQDkvwmL15Y g==;
X-CSE-ConnectionGUID: kvWdTUKGRxCqe1Bmeb/1Zw==
X-CSE-MsgGUID: zurUrcJ1Qf6dbvDA7rq8JQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="87937364"
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; d="scan'208";a="87937364"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2026 15:20:18 -0700
X-CSE-ConnectionGUID: gehdGj2EQ6a8uj0B8QNeAA==
X-CSE-MsgGUID: Ja9URIq7TZqAPRmAD3vHjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; d="scan'208";a="264400103"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2026 15:20:18 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 20 Aug 2026 15:20:17 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 20 Aug 2026 15:20:17 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.6) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 20 Aug 2026 15:20:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JDQOpMh/YTcC/eLkO94+uRoaANWY+Liuz/SRCqiIPKg8/DXB3BtYisXKwaNaLcMNLcljBDoMLmiNPIrMixAcFYb4SwW+aPcql5II8cKph/tN6Lth7eY0uuV0m9nW/ofEUlJTaxR+bi/EAlXu9PJeR9jFjFNRjX9Di7J2jTPEm1MBZY/o2iqM+uV3e/PGnpAVMOpjeKCtM0CUXbra0w9DXWFtSXwe4YOsDtlpdyXz3Wi5Ns2XBIhg9yjcGpqgPMlEdnOKmPoF5KfI3GDmT31mKn7NXbrIUiyBLJ81D7xmZbYc5WqtivEzefn8HcemgoCsYsohzIWeodrAPHiq3G76IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VZapnVZd2b+g7r+RkSZLGeXh8FoIgIAtU+WvyKNESxo=;
 b=ubxgGeivZiLwc5oCLSm8a4cicKj9mWXifDnllPY9o2A3eA3Ul4HlxzQjkGPAaJECCATLiaAYlVKrMFuogRrQGnhm2IIKsZ0ShRuqScIsa0Lhm3COg2YEZsTrwUfiRqS0ajpBBfUua6HVRmxsQg6DkbO+zeIaYy6WeNySJBCYAGgnwzUCVMCL0JMnAgZkcTnSYgQucpcJly/Ep4TA2aRKEOwjiL9QvRT0SVY4ny9zDWdINIdP38ZpsCs1uIttV301qj8NIey3jVf+AIzaDbD1hSFVdLRzNsZfWJepSuSmhe1YJRgxOUGovRT7hroA7oevRLLguSyI2oHEgw+m+hO6QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by CY8PR11MB6938.namprd11.prod.outlook.com (2603:10b6:930:5a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.9; Thu, 20 Aug
 2026 22:20:10 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%5]) with mapi id 15.21.0292.024; Thu, 20 Aug 2026
 22:20:10 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Varun Gupta <varun.gupta@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <matthew.d.roper@intel.com>, <stuart.summers@intel.com>
Subject: Re: [PATCH v8] drm/xe: Add debugfs knob to control GPGPU preemption
 granularity
In-Reply-To: <20260721123549.990426-1-varun.gupta@intel.com>
References: <20260618042421.483657-1-varun.gupta@intel.com>
 <20260721123549.990426-1-varun.gupta@intel.com>
Date: Thu, 20 Aug 2026 19:20:08 -0300
Message-ID: <87qzjsa0yv.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0339.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::14) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|CY8PR11MB6938:EE_
X-MS-Office365-Filtering-Correlation-Id: 11720b8c-fe7b-4a0a-2fc5-08deff0932b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|6133799003|18002099003|22082099003|18092099006|11063799006|4143699003|56012099006|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info: SoH0sNC82oN3dbxplwBOPl6x5QnIL5fBY0sgwk+o0suE7cEjZtCQQsW+oZVu2+ap63cEvWWobmyKNRbIJXwW4u/10vDVVMwzrwkfTp+PcmkjHpqon3Oqw+wjb2RX2cltMz6GfAcO/UXyxX74WCXTx6PoJF0uztjO0AbbPh5ifica8UG3vBx++JVVd1oX/P5O1fq5+Q1gArTh2UiVPtxXUbrw3qupPmRYvubyvfrRhaKBu1Mr7SgzsQYG3iE88RWdPmb3xmNOMBSQ0/Vuh967JhMKti/tRkoGi46uM6vuEiLzK9G83sCigAIL6RSWevXx65PEUjbywnB7dn/DCUPzHfYyvbrZQoMK/rWx/bGK/UEaXgHeHjfEY2ESP7DqtuOvLsONPY9Funza5Wy5lSYtMgYY9DD0ir3p/JAwYhyEDrkpxSBN8nsqITdREL03pKPIdWYbFndQfodz9J1cvBdydV2xApxa4jtIKrAyUPmtNP010o/KIoY2MDbl6pxxkXDXkF/+/h+hN5JbH0TGqf6+Rh3W3PpncwsZ5LIHRxjB3Y9SBFyHyoIyCSEjEqTo2pxzfrFBUNpa46N+CQl1lbZakygbPeSbAWUWsi7l+wmb2znT09yKLlPfYmY+HVLmqRC8bqocZJihcZvNihP78gQJOhvEavZlnlWnsxDJEC06mcE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(6133799003)(18002099003)(22082099003)(18092099006)(11063799006)(4143699003)(56012099006)(10067099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PuxVrjJOIR9WKm+NCtKVxbMfxDqY1IkLSjlLrGJrHveqncr7hse+gRt3qLqO?=
 =?us-ascii?Q?a0WbPKG9ZEt0xRoI7XPWSH/NCT/IcCJvSHkC5MQXO/1cKuYBmvXI33Lq9M61?=
 =?us-ascii?Q?E+3M6cpGkE83VjwvYEwr4SvOlwEImGh3viNZ1PDdcG/rXhY6cGaEP/N85znJ?=
 =?us-ascii?Q?/PCkUlT7lvri1XxUcsjjlS/VtfeiF/Lj3vKwycyAe/6H9hv7KXIzczQZoeY9?=
 =?us-ascii?Q?WZKs7ZsvNXcmnTghuYUSk8838LKrflHqYBkHeiycCakZq4Yorzcql3yMqmOn?=
 =?us-ascii?Q?45I72XGQBX3vdxjupsUtFdpdSsth4/wWJ8t1VdTO41/BHUj7yaWCAdrg80P/?=
 =?us-ascii?Q?CwLgf2MeM++bm4t2tXCKC+TuiI/s89mGPscrj/6Fi9cdMZAcQbIRbeG1LmcC?=
 =?us-ascii?Q?dpSHtDTXx0tGmQs+Iu6MkyRnEQbnw9aRE4xDHszqqobXgxsA0XRPTD0LTypV?=
 =?us-ascii?Q?ELcokuC0u7KloCzqc8GWghV5DYPs0nQPPAYcvhBEayzmVG1tnhM2Nar4fkTE?=
 =?us-ascii?Q?qdLKAQlxLYhZ4nfnGqHvD2x9lSxxRCo/x6EdKCqWDG3wrobWXzBvWGKmCl5z?=
 =?us-ascii?Q?vkT91AX7npV4LcmirlFRYlp/OJrzYqykpDrCSvAhVmYdlgSTMouP1AAuOZnf?=
 =?us-ascii?Q?29xa3FBszD8pokfo8Xce63Z12+sEUiq0J0J29W7rzDPFe3AJDMOFBwB6qc1A?=
 =?us-ascii?Q?ufWde81LfuXKZ2MSbvX905N4el6g483X2FsopEZiA99mq1TVMl/9XiwA2umK?=
 =?us-ascii?Q?u9hU2N11Bto6o4fq1gJRKOp4tPfr5WJUGR7sqRjDQaoKCQzA+mqwg0au0kOv?=
 =?us-ascii?Q?rwZ3e0OWbpxeHzmU1Y8sCpclQvGhcnIKWwpqe6DrUtgjESRfYvbHN0yNdMCj?=
 =?us-ascii?Q?XjzAVOzcP+7NOOARC05aPrG4f3I6J+I5FTkeIvG2HN1bK2n1/ijUYdHDnyGt?=
 =?us-ascii?Q?faL95QruerkRTkzZoqIt4mg8ih/Bh1gTfFDQjiJ3nLiq2dJKf2Cw4fV/N+nJ?=
 =?us-ascii?Q?JmcmETja7+5DJH9NWBSQ8i3f5v5bVHcIj9VdHA1ch12E9BESYuQsFFHv8COI?=
 =?us-ascii?Q?YvnkO6pI7Gp5PwikWOoEXh3K1DfH9Kk6OyvKUOdMqq17SUl/g9+MjPzzH4dW?=
 =?us-ascii?Q?E7kT+NbQ44X0f7C4Gp0S1ID4f1+QyzwxphBLg7id0g3rFFzOA8nC5p7zJ+wH?=
 =?us-ascii?Q?zoh2kss72wOaYsi+VSw1iLhKbDaEm9+8xgsK/k9Rig5oCCdvVsoFypVCL5q7?=
 =?us-ascii?Q?aXysIUj5t0RJI6dsYk8leVfRBC6PZ/TOqC/2g4B5uBUo+zLHWc0M9YPVDyMo?=
 =?us-ascii?Q?RgeVbg20L1hk0cYifDVYyhjzXBk5MniFaZxWGd0W7LIomM2pPZnykHik+w+Z?=
 =?us-ascii?Q?+PcZKbkwy2j1PIDm78kOYlgb7ZfSCr3l8yyyGz3VgqqJ+6id8Yl+kIPMgpCP?=
 =?us-ascii?Q?HXGWY2qIxFRttbBdwHTHMBiBgY0ppgf2Iok4OvOhfGoTKtoH80EkLB6h5SFN?=
 =?us-ascii?Q?MP2lVA4eh33P4RZT1K4bo/VflM8Y3k2WL7iAd0W6QF2GcBT0A4v4N2N2j92+?=
 =?us-ascii?Q?B6UAMW2b4P1Oh4CDpJIAqEK073GRswN1V4p+YRhpU0oT0x95RjfId58hkvvw?=
 =?us-ascii?Q?hNGQ6PSPws0ug31Vcq39RCQpjINnup9TqMpdMCWmUWg1wJRYixof+eghx4fn?=
 =?us-ascii?Q?7mZcnSthZo0ZGoTOAigjtvWDi6pevAr0ayK8nWinZ8r4sUTWv4sCL4n0cNHX?=
 =?us-ascii?Q?kmVpanZbkw=3D=3D?=
X-Exchange-RoutingPolicyChecked: magq0tbZDLiZiHT8aF/uASR79SCqj0SEluDAYQrQ7G4w/mDgf23s7vTn/NZo7benCA/4Ob+s2ARyy4c5mZ/70Rm3ypBrJrfiZFCDIwNbZYOHitCo0UoTyEbFCT3dZVIwAyRnjMXyClQpzrfmiIJLOReFaEKgr9TupXuGtIuyRvElKdyzes6WBRMVntxrhMThmlleNMfH54hprygUS0FDB/sAKXzRTfU/3Gl1EMt9SoRMAwrmFgpH36xd186OG9mqRxSdq6iagBpJXDW5a+aKqNygcvapwxFnR+dNUfttPfRf13VNnHUIWhDFECtEMs/GPLZ1InlRYZSQnp/YwNMcJA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 11720b8c-fe7b-4a0a-2fc5-08deff0932b4
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 22:20:10.6176 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0GdlWl45ZdrwzXfO3eU1GIctLwTdg9EC0yHYHvMpbAsrhpACyzy9gBUtM9sG72ccjDCjT2IKDWCj1PZl/7khag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6938
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

Varun Gupta <varun.gupta@intel.com> writes:

> Introduce a per-GT debugfs knob, 'gpgpu_preemption_level', to allow
> overriding the GPGPU preemption level on a per-context basis for newly
> created LRCs.
> Add an RTP rule to enable per-context control via FF_SLICE_CS_CHICKEN1,
> allowing the preemption level to be programmed directly into the LRC
> image at CTX_CS_CHICKEN1 during context initialization.
>
> v8:
>   - Encapsulate LRC preemption programming into
>     xe_lrc_set_gpgpu_preemption_level() (Gustavo)
>   - Add xe_gt_WARN and early return for unexpected preemption level values
>     to prevent invalid CS_CHICKEN1 programming. (Gustavo)
>   - Change -EPERM to -EINVAL for MTP fused off check (Gustavo)
>   - Combine FF_SLICE_CS_CHICKEN1 RTP rule using OR macro (Gustavo)
>
> v7:
>   - Restrict XEHP_FUSE4 read to Xe2+ primary GTs to prevent invalid
>     Media GT accesses and SR-IOV warnings. (Sashiko)
>
> v6:
>   - Add missing xe_gt_printk.h include to fix compilation failure.
>
> v5:
>   - Use correct offset for CTX_CS_CHICKEN1. (Matt)
>   - Restrict to the RCS engine. (Matt)
>   - Drop LRC layout table modifications; dummy layouts do not need late
>     context registers. (Matt)
>   - Stash WMTP fuse state at boot to remove pm/forcewake from debugfs.
>     (Matt)
>   - Rename debugfs knob to 'gpgpu_preemption_level'. (Matt)
>   - Use simple_write_to_buffer() and remove unnecessary READ_ONCE/
>     WRITE_ONCE macros. (Matt)
>   - Do not restrict debugfs visibility for SR-IOV VFs. (Matt)
>
> v4
>   - Fix incorrect NOP padding in the RCS context layout. (Sashiko)
>
> v3:
>   - Wrapped XEHP_FUSE4 forcewake read with xe_pm_runtime_get/put to
>     prevent PCIe aborts/timeouts when the GPU is in D3hot/D3cold. (sashiko)
>   - Fixed NOP macro truncation by splitting padding offsets larger than
>     0x7f into multiple NOPs, ensuring correct context layout. (sashiko)
>   - Converted CTX_CS_CHICKEN1 initialization to a read-modify-write
>     sequence to avoid overwriting golden context mask bits. (sashiko)
>   - Removed the FF_SLICE_CS_CHICKEN1 workaround for CCS engines, as
>     compute engines lack this 3D fixed-function register, which was
>     causing GuC "illegal register" panics on initialization.
>
> v2:
>   - Dropped the WA BB/MI_LRI path; per Bspec, CS_CHICKEN1 is context
>     save/restore state at DW 0x00E2, so we map CTX_CS_CHICKEN1 and program
>     it directly in LRC init via xe_lrc_write_ctx_reg(). (Matt)
>   - Split Xe2 CCS context offsets into a dedicated xe2_ccs_offsets array
>     to map CS_CHICKEN1 without polluting other XCS engines.
>   - Converted the debugfs interface from a binary boolean to a
>     multi-option string knob ("default", "mid-thread", "thread-group",
>     "command"). (Gustavo)
>   - Restricted file creation to the Physical Function
>     (!IS_SRIOV_VF). (Gustavo)
>   - Added kernel tainting (TAINT_USER) when deviating from
>     defaults. (Gustavo)
>   - Added power-safe hardware fuse check (FUSE4 register 0x9114[20],
>     CFEG_WMTP_DISABLE) before allowing MTP selection. (Matt)
>
> Signed-off-by: Varun Gupta <varun.gupta@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_lrc_layout.h |  2 +
>  drivers/gpu/drm/xe/xe_gt.c              |  6 +++
>  drivers/gpu/drm/xe/xe_gt_debugfs.c      | 66 +++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_types.h        | 34 +++++++++++++
>  drivers/gpu/drm/xe/xe_lrc.c             | 33 +++++++++++++
>  drivers/gpu/drm/xe/xe_wa.c              |  4 +-
>  6 files changed, 144 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
> index 4ab86fc369fd..6f7abc0181b5 100644
> --- a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
> +++ b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
> @@ -37,6 +37,8 @@
>  #define CTX_QUEUE_TIMESTAMP		(0xd0 + 1)
>  #define CTX_QUEUE_TIMESTAMP_UDW		(0xd2 + 1)
>  
> +#define CTX_CS_CHICKEN1			(0x12e + 1)
> +
>  #define INDIRECT_CTX_RING_HEAD		(0x02 + 1)
>  #define INDIRECT_CTX_RING_TAIL		(0x04 + 1)
>  #define INDIRECT_CTX_RING_START		(0x06 + 1)
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 783eb6d631b5..64532bf1f801 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -608,6 +608,12 @@ static int gt_init_with_gt_forcewake(struct xe_gt *gt)
>  	 */
>  	gt->info.gmdid = xe_mmio_read32(&gt->mmio, GMD_ID);
>  
> +	if (GRAPHICS_VER(gt_to_xe(gt)) >= 20 && xe_gt_is_main_type(gt))
> +		gt->info.has_wmtp_disabled = !!(xe_mmio_read32(&gt->mmio, XEHP_FUSE4) &
> +			CFEG_WMTP_DISABLE);
> +	else
> +		gt->info.has_wmtp_disabled = 0;
> +
>  	/*
>  	 * Wa_14026539277 can't be implemented as a regular GT workaround (i.e.
>  	 * as an entry in gt_was[]) for two reasons: it is actually a device
> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> index c38bcacb27e4..6211c0b6d00b 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> @@ -6,6 +6,8 @@
>  #include "xe_gt_debugfs.h"
>  
>  #include <linux/debugfs.h>
> +#include <linux/panic.h>
> +#include <linux/string.h>
>  
>  #include <drm/drm_debugfs.h>
>  #include <drm/drm_managed.h>
> @@ -15,6 +17,7 @@
>  #include "xe_gt.h"
>  #include "xe_gt_mcr.h"
>  #include "xe_gt_idle.h"
> +#include "xe_gt_printk.h"
>  #include "xe_gt_sriov_pf_debugfs.h"
>  #include "xe_gt_sriov_vf_debugfs.h"
>  #include "xe_gt_stats.h"
> @@ -336,6 +339,65 @@ static int force_reset_sync_show(struct seq_file *s, void *unused)
>  }
>  DEFINE_SHOW_STORE_ATTRIBUTE(force_reset_sync);
>  
> +static const char * const gpgpu_preemption_level_names[] = {
> +	[XE_GPGPU_PREEMPT_DEFAULT]      = "default",
> +	[XE_GPGPU_PREEMPT_MID_THREAD]   = "mid-thread",
> +	[XE_GPGPU_PREEMPT_THREAD_GROUP] = "thread-group",
> +	[XE_GPGPU_PREEMPT_COMMAND]      = "command",
> +};
> +
> +static int gpgpu_preemption_level_show(struct seq_file *m, void *unused)
> +{
> +	struct xe_gt *gt = m->private;
> +
> +	seq_printf(m, "%s\n", gpgpu_preemption_level_names[gt->gpgpu_preemption_level]);
> +
> +	return 0;
> +}
> +
> +static ssize_t gpgpu_preemption_level_write(struct file *file,
> +					    const char __user *ubuf,
> +					    size_t len, loff_t *offp)
> +{
> +	struct seq_file *m = file->private_data;
> +	struct xe_gt *gt = m->private;
> +	enum xe_gpgpu_preempt_level new_level;
> +	char buf[16];
> +	ssize_t copied;
> +	int idx;
> +
> +	if (*offp)
> +		return -EINVAL;
> +
> +	copied = simple_write_to_buffer(buf, sizeof(buf) - 1, offp, ubuf, len);
> +	if (copied < 0)
> +		return copied;
> +
> +	buf[copied] = '\0';
> +	idx = sysfs_match_string(gpgpu_preemption_level_names, strim(buf));
> +	if (idx < 0)
> +		return idx;
> +
> +	new_level = (enum xe_gpgpu_preempt_level)idx;
> +
> +	if (new_level == XE_GPGPU_PREEMPT_MID_THREAD && gt->info.has_wmtp_disabled) {
> +		xe_gt_warn(gt, "MTP fused off in hardware, cannot select mid-thread\n");
> +		return -EINVAL;
> +	}
> +
> +	if (new_level != XE_GPGPU_PREEMPT_DEFAULT) {
> +		add_taint(TAINT_USER, LOCKDEP_STILL_OK);
> +		xe_gt_notice(gt,
> +			     "GPGPU preemption overridden to '%s' (applies to new LRCs only)\n",
> +			     gpgpu_preemption_level_names[new_level]);
> +	}
> +
> +	gt->gpgpu_preemption_level = new_level;
> +
> +	return copied;
> +}
> +DEFINE_SHOW_STORE_ATTRIBUTE(gpgpu_preemption_level);
> +
>  void xe_gt_debugfs_register(struct xe_gt *gt)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
> @@ -369,6 +431,10 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
>  	debugfs_create_file("force_reset", 0600, root, gt, &force_reset_fops);
>  	debugfs_create_file("force_reset_sync", 0600, root, gt, &force_reset_sync_fops);
>  
> +	if (GRAPHICS_VER(xe) >= 20 && (gt->info.engine_mask & XE_HW_ENGINE_RCS_MASK))
> +		debugfs_create_file("gpgpu_preemption_level", 0600, root,
> +				    gt, &gpgpu_preemption_level_fops);
> +
>  	drm_debugfs_create_files(vf_safe_debugfs_list,
>  				 ARRAY_SIZE(vf_safe_debugfs_list),
>  				 root, minor);
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index e5588c88800a..97bd943309b3 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -35,6 +35,33 @@ enum xe_gt_eu_type {
>  	XE_GT_EU_TYPE_SIMD16,
>  };
>  
> +/**
> + * enum xe_gpgpu_preempt_level - Per-context GPGPU preemption override mode
> + *
> + * Selects the preemption granularity programmed into CS_CHICKEN1[2:1] for
> + * newly created Xe2+ RCS LRCs.
> + *
> + * The per-context override is effective only when
> + * FF_SLICE_CS_CHICKEN1[FFSC_PERCTX_PREEMPT_CTRL] is enabled via RTP.
> + *
> + * This setting is GT-scoped and affects only LRCs created after the value is
> + * changed; existing contexts keep their previously programmed value.

Nitpick: I think this paragraph doesn't really apply to the description
of the type.  It would probably better if it was moved to the kerneldoc
for the gpgpu_preemption_level member (where the "GT-scoped" part would
be already implicit).

> + *
> + * @XE_GPGPU_PREEMPT_DEFAULT: Keep platform default preemption granularity.
> + * @XE_GPGPU_PREEMPT_MID_THREAD: Force mid-thread preemption level.
> + * @XE_GPGPU_PREEMPT_THREAD_GROUP: Force thread-group preemption level.
> + * @XE_GPGPU_PREEMPT_COMMAND: Force command-level preemption.
> + *
> + * Zero-initialized via kzalloc, so XE_GPGPU_PREEMPT_DEFAULT is the safe
> + * default (no override from platform policy).

Nitpick: Similarly, this "zero-initialized via kzalloc" is more a
description of the instances of xe_gt than to the enum type itself.  I
think we could just drop this paragraph.

> + */
> +enum xe_gpgpu_preempt_level {
> +	XE_GPGPU_PREEMPT_DEFAULT = 0,
> +	XE_GPGPU_PREEMPT_MID_THREAD,
> +	XE_GPGPU_PREEMPT_THREAD_GROUP,
> +	XE_GPGPU_PREEMPT_COMMAND,
> +};
> +
>  #define XE_MAX_DSS_FUSE_REGS		4
>  #define XE_MAX_DSS_FUSE_BITS		(32 * XE_MAX_DSS_FUSE_REGS)
>  #define XE_MAX_EU_FUSE_REGS		1
> @@ -151,6 +178,8 @@ struct xe_gt {
>  		 * feature.
>  		 */
>  		u8 has_xe2_blt_instructions:1;
> +		/** @info.has_wmtp_disabled: hardware fuse indicates WMTP is disabled */
> +		u8 has_wmtp_disabled:1;

I guess now we could have a follow-up patch to make
xe_rtp_cfeg_wmtp_disabled() use this field.

With the nitpicks from above,

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

That said, I think we should also wait for Matt Roper's feedback in case
I missed some important detail.

--
Gustavo Sousa

>  		/**
>  		 * @info.num_geometry_xecore_fuse_regs: Number of 32b-bit fuse
>  		 * registers the geometry XeCore mask spans.
> @@ -219,6 +248,11 @@ struct xe_gt {
>  	 */
>  	u32 ccs_mode;
>  
> +	/**
> +	 * @gpgpu_preemption_level: per-GT GPGPU preemption granularity override.
> +	 */
> +	enum xe_gpgpu_preempt_level gpgpu_preemption_level;
> +
>  	/** @usm: unified shared memory state */
>  	struct {
>  		/**
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 3e7c995085d0..6e22e964e708 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -1486,6 +1486,36 @@ void xe_lrc_set_multi_queue_priority(struct xe_lrc *lrc, enum xe_multi_queue_pri
>  	lrc->desc |= FIELD_PREP(LRC_PRIORITY, xe_multi_queue_prio_to_lrc(lrc, priority));
>  }
>  
> +static void xe_lrc_set_gpgpu_preemption_level(struct xe_lrc *lrc, struct xe_gt *gt)
> +{
> +	enum xe_gpgpu_preempt_level level = gt->gpgpu_preemption_level;
> +	u32 level_bits;
> +	u32 val;
> +
> +	if (level == XE_GPGPU_PREEMPT_DEFAULT)
> +		return;
> +
> +	switch (level) {
> +	case XE_GPGPU_PREEMPT_MID_THREAD:
> +		level_bits = PREEMPT_GPGPU_MID_THREAD_LEVEL;
> +		break;
> +	case XE_GPGPU_PREEMPT_THREAD_GROUP:
> +		level_bits = PREEMPT_GPGPU_THREAD_GROUP_LEVEL;
> +		break;
> +	case XE_GPGPU_PREEMPT_COMMAND:
> +		level_bits = PREEMPT_GPGPU_COMMAND_LEVEL;
> +		break;
> +	default:
> +		xe_gt_WARN(gt, true, "Invalid GPGPU preemption level: %d\n", level);
> +		return;
> +	}
> +
> +	val = xe_lrc_read_ctx_reg(lrc, CTX_CS_CHICKEN1);
> +	val &= ~PREEMPT_GPGPU_LEVEL_MASK;
> +	val |= REG_MASKED_FIELD(PREEMPT_GPGPU_LEVEL_MASK, level_bits);
> +	xe_lrc_write_ctx_reg(lrc, CTX_CS_CHICKEN1, val);
> +}
> +
>  static int xe_lrc_ctx_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe, struct xe_vm *vm,
>  			   void *replay_state, u16 msix_vec, u32 init_flags)
>  {
> @@ -1589,6 +1619,9 @@ static int xe_lrc_ctx_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe, struct
>  	if (xe->info.has_asid && vm)
>  		xe_lrc_write_ctx_reg(lrc, CTX_ASID, vm->usm.asid);
>  
> +	if (GRAPHICS_VER(xe) >= 20 && hwe->class == XE_ENGINE_CLASS_RENDER)
> +		xe_lrc_set_gpgpu_preemption_level(lrc, gt);
> +
>  	lrc->desc = LRC_VALID;
>  	lrc->desc |= FIELD_PREP(LRC_ADDRESSING_MODE, LRC_LEGACY_64B_CONTEXT);
>  	/* TODO: Priority */
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 139434946f8f..c94fe7753f9a 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -343,7 +343,9 @@ static const struct xe_rtp_table_sr engine_was = XE_RTP_TABLE_SR(
>  	  XE_RTP_ACTIONS(SET(SAMPLER_MODE, ENABLE_SMALLPL))
>  	},
>  	{ XE_RTP_NAME("FtrPerCtxtPreemptionGranularityControl"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1250), ENGINE_CLASS(RENDER)),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1250), ENGINE_CLASS(RENDER), OR,
> +		       GRAPHICS_VERSION_RANGE(2000, XE_RTP_END_VERSION_UNDEFINED),
> +		       ENGINE_CLASS(RENDER)),
>  	  XE_RTP_ACTIONS(SET(FF_SLICE_CS_CHICKEN1(RENDER_RING_BASE),
>  			     FFSC_PERCTX_PREEMPT_CTRL))
>  	},
> -- 
> 2.43.0
