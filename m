Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1B37C61DB9
	for <intel-xe@archiver.kernel.org>; Thu, 27 Aug 2026 21:39:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E58910F1DA;
	Thu, 27 Aug 2026 21:39:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jjm6PRzZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B69E510F1DA
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Aug 2026 21:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787866779; x=1819402779;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=YeXkvHQr5OawPxurRHSVvLEejow8dIeamPDmxFzlDcA=;
 b=jjm6PRzZ9ZMuDeRjiIfxNuXV80+kq158R1YvJwv9kJRr56HZ6B0lojRm
 4jZSEZsvfEWXSpkN72P1iL5z6U5tCrbfKbDUKAEwU230VO2uZFcnmMoMn
 KSyG7DmaSrEyY1u4sJUZpzz/+mp6KNExL0xW+j0ZRdzRv+LFVMPQz3eMT
 a0TCLLZg5yMk947qU6btme9O1lic439Y9xmClfqYye4oVfgvR4DvWUtxr
 H4DdWbBsNMsNH/ngWEmQYDV/FrnuEaQUYXmj2Bup8N3W6LKKFO+LpWI0q
 kzWoZbvHo9dX37WZw77LDQXIA9eATJEWVk6Ky4G0j61QQXwN8G2S7eIrp g==;
X-CSE-ConnectionGUID: BLjbGOmjT++9wkhvwGBxYQ==
X-CSE-MsgGUID: bnfuZ4+DTc6rPS9vOlbJDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="87320605"
X-IronPort-AV: E=Sophos;i="6.25,247,1779174000"; d="scan'208";a="87320605"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 14:39:39 -0700
X-CSE-ConnectionGUID: c3tPEvLCTi6+as9h2OLlGQ==
X-CSE-MsgGUID: UUR0cQ24QO6VNhfs9rM2qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,247,1779174000"; d="scan'208";a="264215486"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 14:39:39 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 14:39:38 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 27 Aug 2026 14:39:38 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.23) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 14:39:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wszxcailWriFzi94Miv7fNa5VLeS92UkLEcHTP82eXf9R6yWZVi37T7TIbYqtqwGE1Kh+IGlRvsq2xhn9fnvYPCUYts7ArI1eoO6CkqFaHggaudk+m3MEV16kjtxwz8+Ja55F9PjPLBJDSG2G2kW1NducLSXLcayYHu509dqDq18Ea4XoLkhDY3aIfcdYDC6Mw/AyegGKlsAL5JQl77RlDFBeS1AWOqgyuV/9aWcFFLKLt/0FjvOAZ3hRCxMLf9dIRjnwU27aP4pLP4YMlY46VWgCTOQ7dZtkVKh4vdQCG4SDsob8gSeUK2HKsmewk1ETNP00nLF5HUm11nVDGlYeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r0gNpG+BIWkInuQUhAGDr09FOG2cHyyy2U67YKFXKDQ=;
 b=UkhLIP+D4go9yyQGHWPbMLJaBN5L1Aj94o55SoWRGZrLm4kzEzUfim7lqWpxtkWbiSFFHzXhHXKW9uS5OM65WTvZNu5c7VHrxqLBjb923tx+nyc5PnObWp35kQPXx0nKqX3/NLj2uQnKnpOWK1nV/pRULC7HLy/t7d18cOC9ETaNagtPGXIjrRjZHS+0umJ1f8W+/iuB+pY1E2dUa2DEVIJGH5N0qjwIjjBWPCa9gQ8m8oIQIQQVxefiBy7G0Ci70/P0o6/BTgoqN2RIJG4HDy/WPZPS3N9sUS/E0ffWq0nD8XW1NKAG9ziZXnDqHWoUlS0W1p/yP83tJ+T98dDFlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by IA4PR11MB9252.namprd11.prod.outlook.com (2603:10b6:208:561::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 21:39:36 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.21.0360.006; Thu, 27 Aug 2026
 21:39:36 +0000
Date: Thu, 27 Aug 2026 14:39:34 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Varun Gupta <varun.gupta@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <gustavo.sousa@intel.com>
Subject: Re: [PATCH v9] drm/xe: Add debugfs knob to control GPGPU preemption
 granularity
Message-ID: <20260827213934.GD422236@mdroper-desk1.amr.corp.intel.com>
References: <20260827072106.1138741-2-varun.gupta@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260827072106.1138741-2-varun.gupta@intel.com>
X-ClientProxiedBy: SJ0PR13CA0100.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::15) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|IA4PR11MB9252:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e9141b1-a8a0-4aa2-3984-08df0483b0ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|6133799003|10067099003|56012099006|11063799006|22082099003|18092099006|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: zM8lxRi+ZWd/YsIBkDbA4AOfJEepVGCmomp315Mhm9Dh+ACcTSMIOnYTncRvtfMumGG6voqDM8JDSZ1gnqwZrwxInlv6fCD2SGTIWFmyXOiEeIzpowNXlQeeZ8FhF16JowU+86qr0pyVD+kqbrMYW+NgOp0jTo61AH/vbAt/8ebBPXP/f/7H6yo2N0eQXQzBsho4RxbW//tt76ODY7bczlmCv2xtbYjXvtKh72z1wNskAnyO/PFN3IujHvn8wAMH+QHoaB2MrtXr86Aziq5GZU9HzcgJ6RY6ySn99TDiye2YP3XjygDSXWVWiAFxx+6AfHzCDswrQd7IkOL8qgek5QOxFUT/DUNJFhewQC0Mgudk+IxBR9i/eY2NxQTY/WIimTrEt+kcp0YfCIV8ARvYI+W4PfHB25IJje1NDpcv5os8dydzp8TJ9puYzVmlVSZ/q3SjzoS9BuuyU7n1LjvVE3OiMhQoEALa6jELerYwsK8DRxwOdszyhrq54TyjDbzun3C/EhzuNGKUAqNQ04wMuKZPbjD6os/lGXApFpChRD7EW7r++WUZerF4PYZoInDxoNm75ISWtateyUP25Hh/9pd7Jmb9pW2DF9ejy1wmCMiG7yf/Rpj+4aLoHE3Gv7Ap7D11DGqO1vbIJ3At7v7rAZ2CG7jCzCPotRovCbMRACQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(6133799003)(10067099003)(56012099006)(11063799006)(22082099003)(18092099006)(18002099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+69kGkZZaW/Z7bO3iT4JI/1bGY+Bll8gLMmvcUQrUJzTR6KJxSHak+oOfZL9?=
 =?us-ascii?Q?NV4qyheAsO640mLdTDPbk5VQMq8Ogz4du3HNiglUOB4y3St1n7HTjT+Famgb?=
 =?us-ascii?Q?gePuUj50xsZB00qWRqJBECrMj48ok3SHE5qucgyz0uwdCBpcnpan30chfxHX?=
 =?us-ascii?Q?Gata93Emkz6pFpsWAx8ElcehzN1/xzYx+Fmedll9A58wzH959NEO/uSvZRrm?=
 =?us-ascii?Q?mbD2WlsMjm6v7nexHJ6ldMia37WRigaS5RZMLrQ5ddJsHjjNoV+NhjuNDxL4?=
 =?us-ascii?Q?d5L8mpM9smM/0KiQkO9Ol3c1TWKUv93Dl3KYn9skmTczb7PYbPnEDMetI7cY?=
 =?us-ascii?Q?JI3k9DpgWO7QuXIAyCS9+YgzNhRKiMKmea8zZsSkN4qnM+78fVZFRdUkhOGo?=
 =?us-ascii?Q?8DHXTPEhakiGDk+uRssZwZ+/dvTW0UdV2EqdJ964r/WW6nTHUA7Nd9DdDSpf?=
 =?us-ascii?Q?yDbSNYK21JQuAgXZVrBbKuRQ73LcSuap501rDKq03Ipv0y3Zz/Vi21lUb3M6?=
 =?us-ascii?Q?+bH5wyHsDKEGOoBMlOAmXFtCz0apKe2F5rA9iEK6tEkFcK7WTAV3kzRJ/QQF?=
 =?us-ascii?Q?yCd73O0vRT3SelOJEv/uG4XozfRWeOS0b22XohNZyOW8IXQyE1S8Ca8GrsBv?=
 =?us-ascii?Q?CpPYkFHXsrEMQKMoQTLqzKyQIDFa1p0Tj6Fct1Go263yYLwbF/C1M1gp70bV?=
 =?us-ascii?Q?1WYuN+MMsS04sXJotizNMeOms2E5fEXgzMNHaO0c5MrGyZYrJSFwIRbneOjP?=
 =?us-ascii?Q?zldgDjU/EYEysBzD0yY4k2HpyvkMaADx7Y9wiehHJF4AP/INUj2pusneZx90?=
 =?us-ascii?Q?gQyAUq4In5DUo6vzVVE8wQEuGcBO83JO129XaTurYVc4B89EfjEGHm5uSoGa?=
 =?us-ascii?Q?Y0zTedMnKr4fvUhWjmVt1pt8MEEAY3GuaV/uK/A4ncOYNlHeUu2qCsmCSMKW?=
 =?us-ascii?Q?M7G7zJua0VjUmADZlkk/W9r4bOszbNvx7X48nYXDSbWEcWp71umrCjyr06be?=
 =?us-ascii?Q?4brvrC0xaEmC8tycO0OD7gPjNr1EtUoBfA+QfNnIPDDP2CUDBaEBCqlVznf/?=
 =?us-ascii?Q?6i4BiUYK4C5alRuJRLs1EAr5qQ6now9iE2wxjQnXLrVAg33KjGgBTCJln/Gy?=
 =?us-ascii?Q?hzFsTnS8W/GjTGs4fgIUIfnpd1H0KVUv+bBYYoHtkCD9wsYnqFOxbGs7xE2A?=
 =?us-ascii?Q?eSE4cDaTVfQ7uHBWkgPxCPGCl8AyGRLXt+8C5gLj6j6PvxgzVTF+CBMe3rIf?=
 =?us-ascii?Q?nz8qJdgl8yD8uttN5wmJz+EFNpr0z4dw1IkNqGOTbPcZewQd957h23Ixjh5s?=
 =?us-ascii?Q?8B31JmqGuh7Pd2cySK2vK1DLb81Q2FiZvvx+2oXAcZOprC9J3zzxWlK+5C1E?=
 =?us-ascii?Q?od+FnK3LTdga7EGfUePL48bHnkav5EU8JFG650hnHJTeiD6p33tjZwUjxxyu?=
 =?us-ascii?Q?JlAcczjPSNvJNkx829hI4nhm5c7B1F321Eh2uJvwOUqr6ljKhj4hR6VWZvCg?=
 =?us-ascii?Q?F7vb+sm5xa4uCB3e3ZhKcQrB4Hq736G4JkHd7jiFrI8jBGWR0tnUKF4lhGay?=
 =?us-ascii?Q?St2Kzzh8Uf14l2jtFYsd+KlYy73jLo8An48lxdsZaSjum2lxNVloT8jyku+Z?=
 =?us-ascii?Q?ShVheBcTb91AkztEjvkwlnonbcdhnOyxm8mCM5xrU6/JzINnm0k/KZflzIv/?=
 =?us-ascii?Q?hLXxGL56cAZ1V81Aj35Y1Fl5S7PR7yUp07+f/npeUKlO/1AnXCTUujK4IO0z?=
 =?us-ascii?Q?NAesXWpQilAjajhw6agx3vKAFQupE3g=3D?=
X-Exchange-RoutingPolicyChecked: OWKZ9DMTI5wXbu0dOs+gin75dOaqa3+uuIPjIEnqYNt2gjqkMK11AkEknhPNCnqN9k+L9cKrYrojg8aMOkqgbBlOQiqF+nOMey4UhjGqrzc1Xs7YdPRYU0Rw5kNV/01cJvRrV5gVVhmlYQeY8Ddz/yvBfl6+o9cmuxTDgjLJ6pNgd1zXB7zW0khStEbfslaMWw/gT/zcuHTW8cYgYTta9Pt+HOW7i0Y1+P/IYtk6jo0lR0yyVeKhk7VIyZnSOmsF9l+otYRkERDiP1CqVDU2flbdqr3qLkyJYYddwqHwEdaTqptDPdbDdBPb991U8itSj8Ue1Ly6EMgNe4eK7m8QmQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e9141b1-a8a0-4aa2-3984-08df0483b0ed
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 21:39:36.7315 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4OwBMsiXkX3mO3pDDTQDKEaaFeAGGdlGJtlFxATgxbRaLskQrHApVzkFrUbOfi4UFGsyejRluYv/3EcIrUrzEaSGCMIFg+USZLjD+kSQiFE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9252
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

On Thu, Aug 27, 2026 at 12:51:07PM +0530, Varun Gupta wrote:
> Introduce a per-GT debugfs knob, 'gpgpu_preemption_level', to allow
> overriding the GPGPU preemption level on a per-context basis for newly
> created LRCs.
> Add an RTP rule to enable per-context control via FF_SLICE_CS_CHICKEN1,
> allowing the preemption level to be programmed directly into the LRC
> image at CTX_CS_CHICKEN1 during context initialization.
> 
> v9:
>   - Move the per-context/GT-scoped behavior description from the enum
>     kerneldoc to the gpgpu_preemption_level member kerneldoc, and drop
>     the kzalloc zero-initialization note. (Gustavo)
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
> Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

and applied to drm-xe-next.  Thanks for the patch!


Matt

> ---
>  drivers/gpu/drm/xe/regs/xe_lrc_layout.h |  2 +
>  drivers/gpu/drm/xe/xe_gt.c              |  6 +++
>  drivers/gpu/drm/xe/xe_gt_debugfs.c      | 66 +++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_types.h        | 29 +++++++++++
>  drivers/gpu/drm/xe/xe_lrc.c             | 33 +++++++++++++
>  drivers/gpu/drm/xe/xe_wa.c              |  4 +-
>  6 files changed, 139 insertions(+), 1 deletion(-)
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
> index 6805e0d3bf21..478e047031f4 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -610,6 +610,12 @@ static int gt_init_with_gt_forcewake(struct xe_gt *gt)
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
> index ea78b57b1c31..361a70234d1f 100644
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
> @@ -17,6 +19,7 @@
>  #include "xe_gt.h"
>  #include "xe_gt_mcr.h"
>  #include "xe_gt_idle.h"
> +#include "xe_gt_printk.h"
>  #include "xe_gt_sriov_pf_debugfs.h"
>  #include "xe_gt_sriov_vf_debugfs.h"
>  #include "xe_gt_stats.h"
> @@ -413,6 +416,65 @@ static ssize_t gt_ia_bias_write(struct file *file,
>  }
>  DEFINE_SHOW_STORE_ATTRIBUTE(gt_ia_bias);
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
> @@ -446,6 +508,10 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
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
> index a8bbfbdf3849..628911346455 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -35,6 +35,24 @@ enum xe_gt_eu_type {
>  	XE_GT_EU_TYPE_SIMD16,
>  };
>  
> +/**
> + * enum xe_gpgpu_preempt_level - Per-context GPGPU preemption override mode
> + *
> + * Selects the preemption granularity programmed into CS_CHICKEN1[2:1] for
> + * newly created Xe2+ RCS LRCs.
> + *
> + * @XE_GPGPU_PREEMPT_DEFAULT: Keep platform default preemption granularity.
> + * @XE_GPGPU_PREEMPT_MID_THREAD: Force mid-thread preemption level.
> + * @XE_GPGPU_PREEMPT_THREAD_GROUP: Force thread-group preemption level.
> + * @XE_GPGPU_PREEMPT_COMMAND: Force command-level preemption.
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
> @@ -156,6 +174,8 @@ struct xe_gt {
>  		 * feature.
>  		 */
>  		u8 has_xe2_blt_instructions:1;
> +		/** @info.has_wmtp_disabled: hardware fuse indicates WMTP is disabled */
> +		u8 has_wmtp_disabled:1;
>  		/**
>  		 * @info.num_geometry_xecore_fuse_regs: Number of 32b-bit fuse
>  		 * registers the geometry XeCore mask spans.
> @@ -224,6 +244,15 @@ struct xe_gt {
>  	 */
>  	u32 ccs_mode;
>  
> +	/**
> +	 * @gpgpu_preemption_level: GPGPU preemption granularity override.
> +	 *
> +	 * Effective only when FF_SLICE_CS_CHICKEN1[FFSC_PERCTX_PREEMPT_CTRL] is
> +	 * enabled via RTP. Affects only LRCs created after the value is
> +	 * changed; existing contexts keep their previously programmed value.
> +	 */
> +	enum xe_gpgpu_preempt_level gpgpu_preemption_level;
> +
>  	/** @usm: unified shared memory state */
>  	struct {
>  		/**
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 35b4e8289b5f..25fe9dbc9141 100644
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
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
