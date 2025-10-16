Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F13CFCCD194
	for <intel-xe@archiver.kernel.org>; Thu, 16 Oct 2025 12:15:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9563010E9C6;
	Thu, 16 Oct 2025 12:15:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PZiQJ6Sy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A912B10E9C6
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Oct 2025 12:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760616958; x=1792152958;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=oEJbVmM9j2JlkAEmYrJbRg3ctONUOS4wCDETRR1/iTM=;
 b=PZiQJ6SycpBd+o18MdhxX8J3uudWfzjKPc1SYr6dslKRCAs4Vynz1vTd
 FcMdTF6/H85u3ZM4/VweO42rGyfMgOolAHg9BW/vWO1aOUoz3DnZ4VHfp
 2CAVJinfmk+P8xpZdhCynYbDscdat4hv+65ftVJlsVWBX8UelaFfEe7i/
 /bS4uuXzMLkhCOU0E0+/eW09lyRvND7Vqkuqtc1AZyJCfTyYoV64mNqJp
 l23eJ2aPmmVpAvODqI9gOAFpCvZzItqM24spZGnW8dAqHT0VHnDtoULyZ
 4Hjg4b1gfzvVjHXGROyvU1ORok3XHwOAu5rOw66iydtx9+amaK48Pv59l w==;
X-CSE-ConnectionGUID: RShGeaXzRPqLSIrms0pyrg==
X-CSE-MsgGUID: 8mh0yBV4T9+FekcKuThBfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="62900630"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="62900630"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 05:15:58 -0700
X-CSE-ConnectionGUID: pP1hiALqRH6mmWnxvZl0ug==
X-CSE-MsgGUID: EnL/dJHwRUOInyOB8VpNmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="182117685"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 05:15:58 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 05:15:57 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 16 Oct 2025 05:15:57 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.29) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 05:15:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DBNDbHmmRGcDXomsGmxH2Uw7fEYazv3wH8NDKG5pTMSLBz0IRioyAg7pVsP4twuqGN8xaaYe1q9ltol2vmJPL+vHbqjP1Lp0gdFjPwLku7VK7TzizQ4K+kjgxuQibr+KJEjyWfVpBuSE4dlOiTGvbEJ4bmDWqtHZbnBAUvr6/2aztXrpjYC0KUYBDKl0R7lqLhZmtoFlX2WkrlojXCVJrWn6KvmR+2GWOrIbN6vHFbBD/oBj967r94W7a4f7eVVYW0ItpdRHxFtzmTS5sNoNUzOozgqVRo9e2x4MC7wbMnosDL1kN2pl7IIQIkMQwDJbPCT+slsrnB+4iWOtIvr/4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mgptDMibI4MywXLhC7HJNlyZgR8vyk1us6gs3OJRoO8=;
 b=xRdVVSyUDUOSK88shtRtmQJ9a9XA11O/FVfHs5ZIvHkK4eXEJYVxdl74q05mwnMnAhTqpi0pn8/dStoczmQDPRAcelfICk0JxzK9VEO0YQSXvaaMf7vdkvr4sNtA7f7cBAQXiBmR4rvjmMHayzJnW4vQjA7rbpw1Xbhni+Xz6MD2k0Do0mqjQ1LEsBWSedJhEPGhAGIfG+GsTyPl0f3M1fY7QllbTxab7aeN4WrDSwxQpYNOwcClmBCEobZ1rpKG6/zTzyOvpq1o2p/N40/FNB1Uk01b/mKmQCP7yLJScN+yRsdhlVT/ll4IoBYA0iN3LKTVwfTh2rww9S/kJkwN3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SN7PR11MB7565.namprd11.prod.outlook.com (2603:10b6:806:344::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Thu, 16 Oct
 2025 12:15:36 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9228.010; Thu, 16 Oct 2025
 12:15:36 +0000
Date: Thu, 16 Oct 2025 08:15:32 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH v6 1/3] drm/xe/migrate: Atomicize CCS copy command setup
Message-ID: <aPDh5OdHWFF410x6@intel.com>
References: <20251010123900.15278-5-satyanarayana.k.v.p@intel.com>
 <20251010123900.15278-6-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251010123900.15278-6-satyanarayana.k.v.p@intel.com>
X-ClientProxiedBy: BY5PR17CA0008.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::21) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SN7PR11MB7565:EE_
X-MS-Office365-Filtering-Correlation-Id: 9312f40e-4ad4-4d0c-cffc-08de0cadb63a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vy1ph+gLqquXa0iq/5XEsE3Kenfm12Pz/qUNTcHAm2HsUYzIP4NB+s6j2FBy?=
 =?us-ascii?Q?eQed4Ug4ZCtVyXUPUd+TEmwMcKitMB5gHVk7Ko2ONX5Wf9bjjtv6nIDoLsEZ?=
 =?us-ascii?Q?CS9+WHy9SgvEmJ/fK5GwNkm0pGKyI4eddHmTqftFtYXK9bYMVzb+v7ucqSQp?=
 =?us-ascii?Q?iXI6nxPCTlfZF1L7IV/t8K2IO1X8sXygfRdk2RBGrqYVfD/u97gYqfKervg8?=
 =?us-ascii?Q?vV6/i+10iWtCGUgcv8KLM02So9NtNaLwepiyjj6msYs+ZClKqH5C+jlsRImZ?=
 =?us-ascii?Q?QIGwablLIVQYccPphA+udeChNUnFFzrv2P9Eiph8WBysHpBD6oiT53zgj5Ex?=
 =?us-ascii?Q?bRL2SI9D5Tbm2XP370+k1h/5JzS76FMdXe6x1ZWjXuIbNscyeIqlDiR1wr8f?=
 =?us-ascii?Q?+QTNKS2Rc5Pm0d0100JhxAVKBfy5Zj3hhstCAUJwa/lDjKJug04BvF4Dtn+s?=
 =?us-ascii?Q?cZgJ8te8lWcVLSHbO7m4Wd+h+jtfGGRXULHKlPLgPOtDuR2sk7Ftgbumaarq?=
 =?us-ascii?Q?ACIc1z2p/lor3xaglp4NYVGMS8uD6VwQTd1EMlp9+Tm5conPUXotIXTR6ZQY?=
 =?us-ascii?Q?jAW7LIe/X8CKksZheV9IifDCMpIGKZwUarQTPgUU2pWwD5XStdg8ku9/EUk2?=
 =?us-ascii?Q?8lKcmg3fpAOi1ZZKzjiAU1aDZ1BCwnyhexpXxHta7XZgmDJzcIdLtpUUoTYO?=
 =?us-ascii?Q?QG+i6NIm52CvVUT+aYBNzcKELXyE2mP32isnpUEjDaxeWON3mnY4K/JYHICs?=
 =?us-ascii?Q?5yYqxz2wuppsvPbBOK7ghFw1R2keAbXOw78spf6LvnhAXosEC3NLY2S1IDTc?=
 =?us-ascii?Q?ajG8U6x6k8l+CdswhB2g8fjoV2iHmjbUSTQ4TLzPy8DzMH+hypIXbDKkSW53?=
 =?us-ascii?Q?UOLWwxVDJQEJjLeF3ZmmQn1OH/GM4B7P81E6rk6+5CQXJXkdszcKLTAEga4A?=
 =?us-ascii?Q?xg+ct5H6bWkb/a0nQ9zcJSP9e+MU8qGnWmN6sWGTJkwtEN9SvSgwzpoKVEtx?=
 =?us-ascii?Q?xMuDYADO5OEiRDcgRstyNpIOat2B4QhdG0W59x7pk/yx5GvylG+egjoFsgWG?=
 =?us-ascii?Q?UBod3FGa6PEj0/8v36D7LDavY13HNovk/jc4Xg7QUILqPjoOmpw5H4iIbCMr?=
 =?us-ascii?Q?FkO/MZkzY5TSp4IEPuxXnnht37O2ZmrIzQsK1625ltih9zM5IEabQo6X52Dl?=
 =?us-ascii?Q?GPRv3XAi/jf2PuAe36s64l3m6wrDfsc3tXvsKt+9FqYXKg0GvpJ0NPmOtCJz?=
 =?us-ascii?Q?gCTkxI4y7h5oa/lio9CrUOsdkABDXUJj+wJJT3IzWjg1vRmQpnwsh/fgPAYy?=
 =?us-ascii?Q?nC29rUOWIQXMEALO9jP2RyZdgP1a3k37Sva7gx2wgxuW98yKUpjhQ+WNnriy?=
 =?us-ascii?Q?TPO29qvolxFQ7lKkja3jXkrTFLmzMcqsdmSvUGJlxAl9foQ4j8byx1sXOUcf?=
 =?us-ascii?Q?l0G/cOHL6hWRHQH88BGMDaZtu9KZX4nX?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?++VGlEq3jOit6KYCIEIgW42ZA3HF0t7yEC/+ivvznkioKFMjUE8CXB7GAGk4?=
 =?us-ascii?Q?ZayRKxDoS6O1d1PlhtJbSKJomCYw1qyHeMXFV3EW7eL4npnoxkFu7IXV45Yl?=
 =?us-ascii?Q?d1piSghqPn1bR6McMJRplHySU3krLVbj8bHSpZ/gscVGApQo5VtlLuMYivpl?=
 =?us-ascii?Q?Z3SE9sVNW6MDEMMphqaQHU8YUpXEQstjarSx7HpRPAUoekaK98N32PtbdyLs?=
 =?us-ascii?Q?wx5gHPo2VWTGyP9A+30cXzzAL67UjYsi3DPS3sQsHrfULis9r23xnsUXmPKL?=
 =?us-ascii?Q?DqUQB73wgmtQCKltyVHMAUcU6j8TS6xE1Z4UmU2oMfXaxaD0f2/rOO2vdRXc?=
 =?us-ascii?Q?rRMOMOo1qp+1a8CzImQFSnGZN/7fDrzdP4B0uVsYoKMkSt45iM7+Ox0iPiIL?=
 =?us-ascii?Q?rpeCrYsXiGLbHbnT9ZDpzXqgDHodJ3dvhleLpRn5R/pPIWyDQh4HgUpyvTXm?=
 =?us-ascii?Q?r3w7c+dlaQHTjlO3RkvX3YH+oZLfR1aR03PfF8HoIbS5tku22C0xnfCZZ/tp?=
 =?us-ascii?Q?L3Ir2h5XNC1q97LswOvhPk70T8EesZkXj+LfXeqkyhJqSBtEzoQ0GvHZvcov?=
 =?us-ascii?Q?5Uo1GVZRgiTjnVjhiTEfRsWH7raDFsaYSWrdWxj/o7YSJ5zv1WjSPOT4wL9p?=
 =?us-ascii?Q?mFNHvQHplNnf8l+PG+9ucc4WQaVn9B0gLcRk5SJb9+pMAeQ3iUoyLRcC2sn+?=
 =?us-ascii?Q?rtYHCGYNuhrLWbY//RD0UFQ+xQoUKBERFJ1sthxaz3dpdo/KojIyJVGZVW5Z?=
 =?us-ascii?Q?/tzLMUjCSgjF7XPIKWxU3xeLfrcMALWJxsnrc2brmU0An8CnDcQWXs1684U3?=
 =?us-ascii?Q?087KwQ5L+4CbW50YqcCUFINZWuDp1U7D+bstm5iaS8pKiSyWkvkmwk8sfV8C?=
 =?us-ascii?Q?aP/zICXF8VHEypZzoeC00Xcb36HRNyPTiA/1RU8fx9N/8TONuVXz4ZJFwS7J?=
 =?us-ascii?Q?AXEp26tuOoUi/mFAokdwPFj3ABkxtOu5ji6TtFlY0OA/ltj89AlTdj2XpmXG?=
 =?us-ascii?Q?1E6uQ5TxKPEQh4D6SO1Rx+I23u4pnQe3/ZihABJw4Y3ljPre2jWcK/2Mx9V3?=
 =?us-ascii?Q?tBxBFGPYFQENm4bXWmYQrTRusoqlE2FzPRZ/t9Rp2cgNXjXkbk055vP1ij1o?=
 =?us-ascii?Q?/VkHXXkoFIwiiJK4OHY44cbnsDj7QbKdzjTixGEhTW5S85HzwtRy9XeKMxZD?=
 =?us-ascii?Q?xAkrKa8roFJz9sBGe5GEgJKusVpQUUulnCuCuowQuPGmb3ZbpdXz9NIrKbSH?=
 =?us-ascii?Q?PsxEhp7kRiCf53ANmWal9H5RMtDS50/Gq1H4MlnD+fzvuCI0xjTO7D4Vc4wS?=
 =?us-ascii?Q?xWzpz+UkgxTtMGD094S560pCCbQMa6zxkbD3g5r4P/VWUtgW4ceAN60Ipb1H?=
 =?us-ascii?Q?+KbiC7llvUGWzAf4DidXy8l1wY2QbRZ5S11ZKu4wkjwne1Fo2RY9IppHsxMz?=
 =?us-ascii?Q?qRD7KXwwAbuflZcXD1R4Y+58V6CnJ+vEWl4DJV1Bpz7OGS92a2y+U2tfs/54?=
 =?us-ascii?Q?xN5wIKUp9ROxtUwgJ73GVjmCFWaV72j84IK80zDokmMQR17/XXp1OXkBOxLS?=
 =?us-ascii?Q?saFOjoTxQIIYzFULi+b6hTwtfhGft6WyNEapkvG9?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9312f40e-4ad4-4d0c-cffc-08de0cadb63a
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 12:15:36.2982 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AXA6jnuke8okE3ba2hcvJ+kN6vYStHxFCCCKQfdRX0GVWol9yqiD6eiutweHJDW1UHlwlz80MDhsILD5jd0M6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7565
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

On Fri, Oct 10, 2025 at 06:09:02PM +0530, Satyanarayana K V P wrote:
> The CCS copy command is a 5-dword sequence. If the vCPU halts during
> save/restore while this sequence is being programmed, partial writes may
> trigger page faults when saving IGPU CCS metadata. Use the VMOVDQU
> instruction to write the sequence atomically.
> 
> Since VMOVDQU operates on 256-bit chunks, update EMIT_COPY_CCS_DW to emit
> 8 dwords instead of 5 dwords.
> 
> Update emit_flush_invalidate() to use VMOVDQU operating with 128-bit
> chunks.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> 
> ---
> V5 -> V6:
> - Fixed review comments (Rodrigo)

what review comments?

Next time, please specify exactly what has been changed due to the
review comments addressed. This line here doesn't help at all.

> 
> V4 -> V5:
> - Fixed review comments. (Matt B)
> 
> V3 -> V4:
> - Fixed review comments. (Wajdeczko)
> - Fix issues reported by patchworks.
> 
> V2 -> V3:
> - Added support for 128 bit and 256 bit instructions with memcpy_vmovdqu
> - Updated emit_flush_invalidate() to use vmovdqu instruction.
> 
> V1 -> V2:
> - Use memcpy_vmovdqu only for x86 arch and for VF. Else use memcpy
>   (Auld, Matthew)
> - Fix issues reported by patchworks.
> ---
>  drivers/gpu/drm/xe/xe_migrate.c | 105 +++++++++++++++++++++++++-------
>  1 file changed, 84 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index ad03afb5145f..8f7fb3f561e7 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -5,7 +5,9 @@
>  
>  #include "xe_migrate.h"
>  
> +#include <asm/fpu/api.h>
>  #include <linux/bitfield.h>
> +#include <linux/cpufeature.h>
>  #include <linux/sizes.h>
>  
>  #include <drm/drm_managed.h>
> @@ -33,6 +35,7 @@
>  #include "xe_res_cursor.h"
>  #include "xe_sa.h"
>  #include "xe_sched_job.h"
> +#include "xe_sriov_vf_ccs.h"
>  #include "xe_sync.h"
>  #include "xe_trace_bo.h"
>  #include "xe_validation.h"
> @@ -644,18 +647,61 @@ static void emit_pte(struct xe_migrate *m,
>  	}
>  }
>  
> -#define EMIT_COPY_CCS_DW 5
> +/*
> + * Some GPU sequences span more than two dwords. If a vCPU halts during
> + * save/restore while such a sequence is being programmed, a torn write can

I saw in the previous reply that you have told that the full flow is documented
somewhere else. But the problem is that every developer reading this phrase
here in the future and looking to the code below will ask the same question over
and over: What? Why assembly code is needed? how the hack can the cpu halt
while the commands are getting executed in the gpu? why doesn't this buffer
gets written first and submitted later?

Please make sure that there is enough information here so we don't have to
keep justifying this over and over in the future.

> + * trigger page faults when saving iGPU CCS metadata. Use a single x86 vector
> + * store (VMOVDQU) under kernel_fpu_begin()/end() to emit the sequence as one
> + * instruction, ensuring it is not preempted mid-write when the vCPU halts.
> + *
> + * Do not use this for dGFX: on non-x86 hosts the VMOVDQU instruction may not
> + * be available.

This is not what I asked. Please add a return with error message (warn?!) if DGFX
reaches this path ever...

> + */
> +static void memcpy_vmovdqu(void *dst, const void *src, u32 size)
> +{
> +#ifdef CONFIG_X86
> +	kernel_fpu_begin();
> +	if (size == SZ_128) {
> +		asm("vmovdqu (%0), %%xmm0\n"
> +		    "vmovups %%xmm0,   (%1)\n"
> +		    :: "r" (src), "r" (dst) : "memory");
> +	} else if (size == SZ_256) {
> +		asm("vmovdqu (%0), %%ymm0\n"
> +		    "vmovups %%ymm0,   (%1)\n"
> +		    :: "r" (src), "r" (dst) : "memory");
> +	}
> +	kernel_fpu_end();
> +#endif
> +}
> +
> +static void emit_atomic(struct xe_gt *gt, void *dst, const void *src, u32 size)
> +{
> +	u32 instr_size = size * BITS_PER_BYTE;
> +
> +	xe_gt_assert(gt, instr_size == SZ_128 || instr_size == SZ_256);
> +
> +	if (IS_VF_CCS_READY(gt_to_xe(gt))) {
> +		xe_gt_assert(gt, static_cpu_has(X86_FEATURE_AVX));
> +		memcpy_vmovdqu(dst, src, instr_size);
> +	} else {
> +		memcpy(dst, src, size);
> +	}
> +}
> +
> +#define EMIT_COPY_CCS_DW 8
>  static void emit_copy_ccs(struct xe_gt *gt, struct xe_bb *bb,
>  			  u64 dst_ofs, bool dst_is_indirect,
>  			  u64 src_ofs, bool src_is_indirect,
>  			  u32 size)
>  {
> +	u32 dw[EMIT_COPY_CCS_DW] = {MI_NOOP};
>  	struct xe_device *xe = gt_to_xe(gt);
>  	u32 *cs = bb->cs + bb->len;
>  	u32 num_ccs_blks;
>  	u32 num_pages;
>  	u32 ccs_copy_size;
>  	u32 mocs;
> +	u32 i = 0;
>  
>  	if (GRAPHICS_VERx100(xe) >= 2000) {
>  		num_pages = DIV_ROUND_UP(size, XE_PAGE_SIZE);
> @@ -673,15 +719,23 @@ static void emit_copy_ccs(struct xe_gt *gt, struct xe_bb *bb,
>  		mocs = FIELD_PREP(XY_CTRL_SURF_MOCS_MASK, gt->mocs.uc_index);
>  	}
>  
> -	*cs++ = XY_CTRL_SURF_COPY_BLT |
> -		(src_is_indirect ? 0x0 : 0x1) << SRC_ACCESS_TYPE_SHIFT |
> -		(dst_is_indirect ? 0x0 : 0x1) << DST_ACCESS_TYPE_SHIFT |
> -		ccs_copy_size;
> -	*cs++ = lower_32_bits(src_ofs);
> -	*cs++ = upper_32_bits(src_ofs) | mocs;
> -	*cs++ = lower_32_bits(dst_ofs);
> -	*cs++ = upper_32_bits(dst_ofs) | mocs;
> +	dw[i++] = XY_CTRL_SURF_COPY_BLT |
> +		  (src_is_indirect ? 0x0 : 0x1) << SRC_ACCESS_TYPE_SHIFT |
> +		  (dst_is_indirect ? 0x0 : 0x1) << DST_ACCESS_TYPE_SHIFT |
> +		  ccs_copy_size;
> +	dw[i++] = lower_32_bits(src_ofs);
> +	dw[i++] = upper_32_bits(src_ofs) | mocs;
> +	dw[i++] = lower_32_bits(dst_ofs);
> +	dw[i++] = upper_32_bits(dst_ofs) | mocs;
>  
> +	/*
> +	 * The CCS copy command is a 5-dword sequence. If the vCPU halts during
> +	 * save/restore while this sequence is being issued, partial writes may trigger
> +	 * page faults when saving iGPU CCS metadata. Use the VMOVDQU instruction to
> +	 * write the sequence atomically.
> +	 */
> +	emit_atomic(gt, cs, dw, sizeof(dw));
> +	cs += EMIT_COPY_CCS_DW;
>  	bb->len = cs - bb->cs;
>  }
>  
> @@ -993,18 +1047,27 @@ static u64 migrate_vm_ppgtt_addr_tlb_inval(void)
>  	return (NUM_KERNEL_PDE - 2) * XE_PAGE_SIZE;
>  }
>  
> -static int emit_flush_invalidate(u32 *dw, int i, u32 flags)
> +/*
> + * The MI_FLUSH_DW command is a 4-dword sequence. If the vCPU halts during
> + * save/restore while this sequence is being issued, partial writes may
> + * trigger page faults when saving iGPU CCS metadata. Use
> + * emit_atomic() to write the sequence atomically.
> + */
> +#define EMIT_FLUSH_INVALIDATE_DW 4
> +static int emit_flush_invalidate(struct xe_exec_queue *q, u32 *cs, int i, u32 flags)
>  {
>  	u64 addr = migrate_vm_ppgtt_addr_tlb_inval();
> +	u32 dw[EMIT_FLUSH_INVALIDATE_DW] = {MI_NOOP}, j = 0;
> +
> +	dw[j++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW |
> +		      MI_FLUSH_IMM_DW | flags;
> +	dw[j++] = lower_32_bits(addr);
> +	dw[j++] = upper_32_bits(addr);
> +	dw[j++] = MI_NOOP;
>  
> -	dw[i++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW |
> -		  MI_FLUSH_IMM_DW | flags;
> -	dw[i++] = lower_32_bits(addr);
> -	dw[i++] = upper_32_bits(addr);
> -	dw[i++] = MI_NOOP;
> -	dw[i++] = MI_NOOP;
> +	emit_atomic(q->gt, &cs[i], dw, sizeof(dw));
>  
> -	return i;
> +	return i + j;
>  }
>  
>  /**
> @@ -1049,7 +1112,7 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
>  	/* Calculate Batch buffer size */
>  	batch_size = 0;
>  	while (size) {
> -		batch_size += 10; /* Flush + ggtt addr + 2 NOP */
> +		batch_size += EMIT_FLUSH_INVALIDATE_DW * 2; /* Flush + ggtt addr + 1 NOP */
>  		u64 ccs_ofs, ccs_size;
>  		u32 ccs_pt;
>  
> @@ -1090,7 +1153,7 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
>  	 * sizes here again before copy command is emitted.
>  	 */
>  	while (size) {
> -		batch_size += 10; /* Flush + ggtt addr + 2 NOP */
> +		batch_size += EMIT_FLUSH_INVALIDATE_DW * 2; /* Flush + ggtt addr + 1 NOP */
>  		u32 flush_flags = 0;
>  		u64 ccs_ofs, ccs_size;
>  		u32 ccs_pt;
> @@ -1113,11 +1176,11 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
>  
>  		emit_pte(m, bb, ccs_pt, false, false, &ccs_it, ccs_size, src);
>  
> -		bb->len = emit_flush_invalidate(bb->cs, bb->len, flush_flags);
> +		bb->len = emit_flush_invalidate(q, bb->cs, bb->len, flush_flags);
>  		flush_flags = xe_migrate_ccs_copy(m, bb, src_L0_ofs, src_is_pltt,
>  						  src_L0_ofs, dst_is_pltt,
>  						  src_L0, ccs_ofs, true);
> -		bb->len = emit_flush_invalidate(bb->cs, bb->len, flush_flags);
> +		bb->len = emit_flush_invalidate(q, bb->cs, bb->len, flush_flags);
>  
>  		size -= src_L0;
>  	}
> -- 
> 2.51.0
> 
