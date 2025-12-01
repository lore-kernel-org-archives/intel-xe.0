Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A852D116F1
	for <intel-xe@archiver.kernel.org>; Mon,  1 Dec 2025 16:51:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05C6C10E2BB;
	Mon,  1 Dec 2025 16:51:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FrGWj/Ue";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B94D10E2BB
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Dec 2025 16:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764607886; x=1796143886;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=CBEH9N20RLLHcSLfnUDQyObsrQODRHw5JYrQ52pfosk=;
 b=FrGWj/Ues5vXMwQVG0R4/ow/v5sT35q5/CgYSv2v/DpGErtAV7MHf6h1
 Qyv9jkGuyjONpLkurOWyVDEImYb7ZWY6u7IXGPmBgt1W72Dn+kURzAbSj
 kdHi8+8NxjOtZR2roLHHaZ7AFGRs9inBOlknV0mlg7EaOOPbkfOBveQfZ
 WSKRCJbA1sHoPkp2hrEmwLKlZsCWsmDLlJjkGXlQ79sw0N7U7rVWpLDov
 dshQAD55agEcAUH+8qLocz4KmZVVg0vnlrXsSVZBiASK7aYNEcgf90+sL
 EAac+Rw/c/CVn38x0AKC8L1LuAfzQJcUBr99PlsoA5eSeRG+rFzwxjZgX Q==;
X-CSE-ConnectionGUID: hY9N/7QLQeKMKASEQw0jDg==
X-CSE-MsgGUID: 8IKzPerpSuSDBWoBxxKsnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="77184394"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="77184394"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 08:51:26 -0800
X-CSE-ConnectionGUID: I7IWlb8TQEK8S90tk3SlbQ==
X-CSE-MsgGUID: 2dMa0qEeRIO0yoSR5OJbtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="198484051"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 08:51:26 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 08:51:25 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 1 Dec 2025 08:51:25 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.67) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 08:51:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F3MG8mE7yUFNzGNfD9h4acXgIxPEDkzs46zoqRLVLag1AevlmzEJS6T3Lr2SHxgkKh1dIlFD3a84ji1z4e+zIjCz7lNrFaEieL5ndU6foPAGzQ/OMLKrcvau/noeLNppdhkUBa4pkKii4CFkIr0vK3MF58RHY5T6NdGW3rbtO9heNLmvPVuBP4GShlzwL0aoTtXUXqupan7+mSGg5Nj6jxOfSIOzpjGPpY7CgNSmsRhBk3AJFsN0O5GhyrrJTS3nH0T9Tz7wJy+uWqNBATnM+v9KfDxEcRcG+VfMQSWyzRbHX2CA68wb/aQ1yv8NJO1lW9WHwEEbmePhlhbEeKggmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zSDW/Iika6zViUjotFsZPplVSnRUrcH5UzDslgvMjgk=;
 b=rPpySxP7+ZCJjaL++S/YCNs/WUnR0vDUe4jwcIibck5za8xQ3NN0pdc+YaU4bEcgJcW/0VzdbQOZRgA6WCk7p7qsaHwRJaoqsYMKju//jNJ/78WJi+SLSIWtJtrHBQSs0coKFEKamB9kU5/29CzNfJI+H46AWEC/+cwjFD1eItDR5nXaDJtnZgtt8tkaeJmYAtj8n89q1K61imWukh4REw9E8wqk2hDseynA5WkygTUD+XJwUMJc8dQLam6BAmcOQS0XoXSaPmHIPLH15TC8plCv6VAwLuhJS45NtYtwFIFtIyjNXIOXLtwIO0SUQ9yXJF+HBpZsMWv/7Doq9ZCrcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by LV4PR11MB9516.namprd11.prod.outlook.com (2603:10b6:408:2dd::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 16:51:23 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 16:51:22 +0000
Date: Mon, 1 Dec 2025 08:51:20 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Shuicheng Lin <shuicheng.lin@intel.com>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw6IGZhaWx1?= =?utf-8?Q?re_fo?=
 =?utf-8?Q?r?= drm/xe: Fix freq kobject leak on sysfs_create_files failure
Message-ID: <20251201165120.GE4065316@mdroper-desk1.amr.corp.intel.com>
References: <20251114205638.2184529-2-shuicheng.lin@intel.com>
 <176319543573.60065.4071985558608531736@10055242dc62>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <176319543573.60065.4071985558608531736@10055242dc62>
X-ClientProxiedBy: BY5PR20CA0017.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::30) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|LV4PR11MB9516:EE_
X-MS-Office365-Filtering-Correlation-Id: ef6cee89-70da-4ae1-e936-08de30f9dbde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1BitHQcO5CjThQbYfD47j1aBkwEYioTQHsex1rKG1Kac2Z+HV4T0Hx6EdJB3?=
 =?us-ascii?Q?5kkAiQHHZ45jakdTB0NWN7nfH2lZ4F7CmpYAWJRsP4PvFHqOVDMei8Bp0gTH?=
 =?us-ascii?Q?WYvTj5EEw7CtKfwDS7gxmjoku8mGKnvSAYpes8JK5iws7TMv1uzwZhE4eBay?=
 =?us-ascii?Q?MCmXMKw7P8LCvCa4XQffJIT9elKk6heQeBd4k418bw+axZdSSs/+Vz+1/QQe?=
 =?us-ascii?Q?86xsxzS+DKC2UyXPSSn6IJVe1QlWhYvT3fvLeHNN98ZIGMJ3NlDEgI+SYKQ4?=
 =?us-ascii?Q?VPaIq8XlbUYd+5yYiiUQ5XhKPxoaVXOCoJEIuS4foB3fvkfIhcA4FwiZV4GX?=
 =?us-ascii?Q?P3sNR9H+GXE1IkSMkHoalhR10M7xgcrMYOj1s2g+0TYdI5OaZm2JKWJxZ18p?=
 =?us-ascii?Q?pDaApmrqURwlOZgORo+NCEvlSX68zkkigjgVXN7n2kCRkZK64hiUXZ8UPqB5?=
 =?us-ascii?Q?7PfKW02JnNEhuMJAJV54iLzejjC67PlMG6Bqes7TXqFVtXeDJA+e5dXBvVPo?=
 =?us-ascii?Q?XZLTDFL/wWeQOVd5eSBrsthUgxSDTr/Tf+H2LU6uJ7gNtqb14ki9U7RiUHJC?=
 =?us-ascii?Q?Aokz6owNjyHsQhqLudaJX1/c5eH2AFnlNZ5a3Myy+ipixtULIoYWXleB2wcr?=
 =?us-ascii?Q?+Exx8KQhMb+uk25AbRcQRvChkYW3MrXU6iY2KV/mbj4phMyz0I+mSKyrsTID?=
 =?us-ascii?Q?kAmplcCUXiLhYOBxX+iWsKykdCFABEV3eh2vXbVd8OEakp83wQqB4iiOPPx0?=
 =?us-ascii?Q?PRzpIIapmNPgozqzsdI59yrVd88i2BONDeT24tJz3wghfEPj+JW0U+c7eSiY?=
 =?us-ascii?Q?VeQET1nieUop8UXCTCdrHwrWuZokMWHIYzuwPvfa/457d5GsaTCgvApwRy05?=
 =?us-ascii?Q?latumPqso4PWYQMfdcOI7t9JkGYLIJ+EwkFk+xMxXVTPpkce/Z5QAiZeE1qo?=
 =?us-ascii?Q?pNYpIx9GttXD2TnkWUiLNmz4FHOsHvf7Ct1tt3SEUDBIwJZYrpla50tmJDtN?=
 =?us-ascii?Q?Mx88yc/D8+dqUw02w6YbDpCkw25sbpMgYU4xtLr+IsYxB4HBwVexgFSfSnZB?=
 =?us-ascii?Q?WP8laL1nehJuYJCfmtNeDUyAEpFuNQ/WkdEASdK/9e6XYUIrVDPa313NqbJl?=
 =?us-ascii?Q?99Jvyl8n3gVofNguNvrUZYikOzTC4g6xy2P1DOUoU8yPY5scBEqbenJyvlwr?=
 =?us-ascii?Q?YGpdnBb4wTENw/aounWR7qelCpTYS03TZ+AGe0mv1i8uL4ZFtXzVQKvPe4f9?=
 =?us-ascii?Q?iWXABianHtuXZUOzCe86YsG1Y67hMW607/3kXWNiNG7QqoMo4Xp6C3PXgxCX?=
 =?us-ascii?Q?W7wCKEbwZkCev00DRinEzMWsOu9uwX7e7Dyh+I+fYhbbzmuTPaCMyFXKXLg0?=
 =?us-ascii?Q?GkbWgpouUfOWzD5H7jbx+lvgiMsB6GT2AwEWN0L7HOgJDZf3BA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FdwRBpHMmaDPhyLzKh+y41TqlMF/VrRPQh7qeTBH3UyVAsnQWc8Jz/tz5GAl?=
 =?us-ascii?Q?VQ64sio8caTDlaG19p/tcnpSfF2Aj95piQsN7p5A5xzlArCPtRCKTPEE2rOC?=
 =?us-ascii?Q?EmMCaCX6GpBQIc/S27tD25rb47PWTt+8Ky3a42XnC+tbYT64tl6NBccFNQkn?=
 =?us-ascii?Q?+hvUaY3MZMZuQItWiNB4ewOW9dZq4KE3iqOIvsxSO3VZLeMFTIo1cLoqKJb1?=
 =?us-ascii?Q?8CwYeQRHuKCSQhcANRmgJnz7RzLqR8O8cOl/vu630NSoLU3CIL7bGFiiLQw7?=
 =?us-ascii?Q?3CNpzZiE3Vg+1tgVBWjzD6osfp1Rgg04ykgnStkR4Rn7Wm04aGqdcQISRSWj?=
 =?us-ascii?Q?RAqznuDFRspumpiCpUPosLDmbBEix7FRUvY6DE6GrPF+uLLzOwXvtirlVJvK?=
 =?us-ascii?Q?MgBMOw8+MJu10VXI9pLUAxj3P20teWNJehB118kSKTPLF5DSZcqomeizCSMx?=
 =?us-ascii?Q?Gmrh5A1gAkmyuy3nvRUjMUvY0xwmCIC10oc0fxWPxTdDQy4gE23rwgmlii9i?=
 =?us-ascii?Q?drzLLGKywJVPux1/QkKC9e9RDVKGZ4y24Ht4yWkSaPMsWdBVcWq+UiTyQVM1?=
 =?us-ascii?Q?Eug5bJ6QZXHlNrqG9uSf0bv8rLA70FWwkTxLzCRh2feRUNyzI/cifUDik6Pz?=
 =?us-ascii?Q?0fYMqrFLPm+/fOIKXg6m/M7C2jXymzB3S9LoAvQl7SbNJLAM6HvgpYUPM9Zc?=
 =?us-ascii?Q?JX4SlW66g9fp7vMnV04DfWQfQzmFqQeGqpKZl94Jt/n18F0tEN1rrJcLwlkV?=
 =?us-ascii?Q?e7AowcmJLylA+aAg/dks0ZB5CsEo4jqQ4lFoYV7Pz7zdeJHhW6yVdVm6iOjF?=
 =?us-ascii?Q?KDIHLVpXrd2mp9MgeKb9ddlofLT1kkq730slNkgqzGDXhY4WTbZgJMKBJzn0?=
 =?us-ascii?Q?roE94suJbajVp64uatgVdTOf/KPnXvAtFfYDOabhXX8CHWdPCovZS9we0Dqm?=
 =?us-ascii?Q?hP8YIukvB2PI22lV53g64Pt+12Egh436Hn0dNIMyomnd+/M1CJ2p7pc3ZL9Q?=
 =?us-ascii?Q?zWExCpai25h1WfMlOty2vgAALoCcs5onkg8DbjmDrsDHQDkFb++U2zwKd722?=
 =?us-ascii?Q?+9z1ySk9FHcY9LJlDRlzTba+r1yjV8OsFGCGvA0r9du6nFhE8aAMDzleL+wj?=
 =?us-ascii?Q?86UGRguDfY81bAWRX37NJ8fDz5JBHf0Mku86+DYHSLENoyy6QIheG7yv4ssI?=
 =?us-ascii?Q?39l/DPwrb2K3ZDEV1K6taqjYQ0OKviQP3wNXosuhcWV2SOXyC0Wj9HSiEpRe?=
 =?us-ascii?Q?s9gckc4HVCmAJQzyh7ZOQBDvJvoINJnSQFIlV1/MkrUYLPwQM6ZSXyCNCNLL?=
 =?us-ascii?Q?pBuwgrBKoKwiXllXDK38/Yc/uuk9++DhqE3DkkDopDYKmxCjJfJt9Qqc1BLg?=
 =?us-ascii?Q?LJGuMAOojDeadHL3d+vWQfPNnLZULp/0w3wOQLzxzMAO89qUfC8wGFN+j+Pc?=
 =?us-ascii?Q?X3U3g/hNe8m/J7AOWGrPXbzZN/mfSH282pxxyGIpOPhJ/5sOgH5fxiSrVi1m?=
 =?us-ascii?Q?7juzik71oR/eWlDZgPMdegRn9Vggmk3kgXqyn34EjFnchI4Ua2gte8qnILoO?=
 =?us-ascii?Q?+3snR83okFOmOO3q39a2cb0Xc9jc4uf/UQdjLr2BRkC+IoPwuxhLiErbP1Sw?=
 =?us-ascii?Q?YA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ef6cee89-70da-4ae1-e936-08de30f9dbde
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 16:51:22.9221 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4QIA9AotGlqfnewywETi4F87HAQIm+629xNQwMQaq0MGHE8q+sQyCfRgw0DHE6nkoVyE4zpOnmqYB4TLQQI8pFUZLbGJeM7W5hRYxHAEJXA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV4PR11MB9516
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

On Sat, Nov 15, 2025 at 08:30:35AM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe: Fix freq kobject leak on sysfs_create_files failure
> URL   : https://patchwork.freedesktop.org/series/157601/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-4110-5f250ba2e3bb0b4541473f2bd5dd8a8f22305b61_FULL -> xe-pw-157601v1_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-157601v1_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-157601v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (4 -> 4)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-157601v1_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc:
>     - shard-bmg:          [PASS][1] -> [DMESG-WARN][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4110-5f250ba2e3bb0b4541473f2bd5dd8a8f22305b61/shard-bmg-6/igt@kms_pipe_crc_basic@suspend-read-crc.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157601v1/shard-bmg-2/igt@kms_pipe_crc_basic@suspend-read-crc.html

https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6576

> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-dp-2:
>     - shard-bmg:          NOTRUN -> [DMESG-WARN][3]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157601v1/shard-bmg-2/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-dp-2.html

Same issue reported above.


Applied to drm-xe-next.  Thanks for the patch and reviews.


Matt


> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-157601v1_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][4] ([Intel XE#316]) +1 other test skip
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157601v1/shard-dg2-466/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@linear-64bpp-rotate-270:
>     - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#2327]) +1 other test skip
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157601v1/shard-bmg-8/igt@kms_big_fb@linear-64bpp-rotate-270.html
> 
>   * igt@kms_big_fb@y-tiled-16bpp-rotate-180:
>     - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#1124]) +3 other tests skip
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157601v1/shard-bmg-2/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html
> 
>   * igt@kms_big_fb@y-tiled-16bpp-rotate-90:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][7] ([Intel XE#1124]) +3 other tests skip
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157601v1/shard-dg2-434/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
>     - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#607]) +1 other test skip
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157601v1/shard-bmg-2/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
> 
>   * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
>     - shard-bmg:          [PASS][9] -> [SKIP][10] ([Intel XE#2314] / [Intel XE#2894])
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4110-5f250ba2e3bb0b4541473f2bd5dd8a8f22305b61/shard-bmg-7/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157601v1/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
> 
>   * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][11] ([Intel XE#2191]) +1 other test skip
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157601v1/shard-dg2-466/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html
> 
>   * igt@kms_bw@linear-tiling-3-displays-1920x1080p:
>     - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#367])
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157601v1/shard-bmg-2/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2:
>     - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#2652] / [Intel XE#787]) +12 other tests skip
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157601v1/shard-bmg-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
>     - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#3432])
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157601v1/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
> 
>   * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-b-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][15] ([Intel XE#787]) +6 other tests skip
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157601v1/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-b-dp-4.html
> 
>   * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-d-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157601v1/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
>     - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2887]) +6 other tests skip
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157601v1/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
>     - shard-dg2-set2:     [PASS][18] -> [INCOMPLETE][19] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345] / [Intel XE#6168])
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4110-5f250ba2e3bb0b4541473f2bd5dd8a8f22305b61/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157601v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-dp-4:
>     - shard-dg2-set2:     [PASS][20] -> [INCOMPLETE][21] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#6168])
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4110-5f250ba2e3bb0b4541473f2bd5dd8a8f22305b61/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-dp-4.html
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157601v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-dp-4.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][22] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#6168])
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157601v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html
> 
>   * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#373]) +1 other test skip
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157601v1/shard-dg2-434/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html
> 
>   * igt@kms_chamelium_frames@vga-frame-dump:
>     - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2252]) +5 other tests skip
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157601v1/shard-bmg-8/igt@kms_chamelium_frames@vga-frame-dump.html
> 
>   * igt@kms_content_protection@srm:
>     - shard-bmg:          NOTRUN -> [FAIL][25] ([Intel XE#1178]) +1 other test fail
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157601v1/shard-bmg-8/igt@kms_content_protection@srm.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-max-size:
>     - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#2320]) +1 other test skip
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157601v1/shard-bmg-8/igt@kms_cursor_crc@cursor-offscreen-max-size.html
> 
>   * igt@kms_cursor_crc@cursor-random-max-size:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#455]) +6 other tests skip
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157601v1/shard-dg2-466/igt@kms_cursor_crc@cursor-random-max-size.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
>     - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#2321])
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157601v1/shard-bmg-2/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
> 
>   * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
>     - shard-bmg:          [PASS][29] -> [SKIP][30] ([Intel XE#2291]) +2 other tests skip
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4110-5f250ba2e3bb0b4541473f2bd5dd8a8f22305b61/shard-bmg-8/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157601v1/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
> 
>   * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
>     - shard-bmg:          [PASS][31] -> [SKIP][32] ([Intel XE#1340])
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4110-5f250ba2e3bb0b4541473f2bd5dd8a8f22305b61/shard-bmg-8/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157601v1/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
> 
>   * igt@kms_dp_link_training@non-uhbr-mst:
>     - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#4354])
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157601v1/shard-bmg-2/igt@kms_dp_link_training@non-uhbr-mst.html
> 
>   * igt@kms_dsc@dsc-fractional-bpp:
>     - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#2244])
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157601v1/shard-bmg-8/igt@kms_dsc@dsc-fractional-bpp.html
> 
>   * igt@kms_feature_discovery@psr1:
>     - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#2374])
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157601v1/shard-bmg-8/igt@kms_feature_discovery@psr1.html
> 
>   * igt@kms_flip@2x-flip-vs-dpms-on-nop:
>     - shard-bmg:          [PASS][36] -> [SKIP][37] ([Intel XE#2316]) +7 other tests skip
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4110-5f250ba2e3bb0b4541473f2bd5dd8a8f22305b61/shard-bmg-7/igt@kms_flip@2x-flip-vs-dpms-on-nop.html
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157601v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-on-nop.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible:
>     - shard-lnl:          [PASS][38] -> [FAIL][39] ([Intel XE#301]) +1 other test fail
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4110-5f250ba2e3bb0b4541473f2bd5dd8a8f22305b61/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157601v1/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
> 
>   * igt@kms_flip@flip-vs-rmfb:
>     - shard-adlp:         [PASS][40] -> [DMESG-WARN][41] ([Intel XE#4543] / [Intel XE#5208])
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4110-5f250ba2e3bb0b4541473f2bd5dd8a8f22305b61/shard-adlp-2/igt@kms_flip@flip-vs-rmfb.html
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157601v1/shard-adlp-8/igt@kms_flip@flip-vs-rmfb.html
> 
>   * igt@kms_flip@flip-vs-rmfb@b-hdmi-a1:
>     - shard-adlp:         [PASS][42] -> [DMESG-WARN][43] ([Intel XE#4543]) +3 other tests dmesg-warn
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4110-5f250ba2e3bb0b4541473f2bd5dd8a8f22305b61/shard-adlp-2/igt@kms_flip@flip-vs-rmfb@b-hdmi-a1.html
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157601v1/shard-adlp-8/igt@kms_flip@flip-vs-rmfb@b-hdmi-a1.html
> 
>   * igt@kms_flip@flip-vs-suspend@b-hdmi-a1:
>     - shard-adlp:         [PASS][44] -> [DMESG-WARN][45] ([Intel XE#2953] / [Intel XE#4173]) +4 other tests dmesg-warn
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4110-5f250ba2e3bb0b4541473f2bd5dd8a8f22305b61/shard-adlp-2/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157601v1/shard-adlp-8/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
>     - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#2293] / [Intel XE#2380]) +3 other tests skip
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157601v1/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode:
>     - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#2293]) +3 other tests skip
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157601v1/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-mmap-wc:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][48] ([Intel XE#6312]) +1 other test skip
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157601v1/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc:
>     - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#2311]) +14 other tests skip
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157601v1/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-onoff:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][50] ([Intel XE#651]) +2 other tests skip
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157601v1/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#5390]) +10 other tests skip
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157601v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][52] ([Intel XE#653]) +11 other tests skip
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157601v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][53] ([Intel XE#658])
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157601v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#2313]) +14 other tests skip
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157601v1/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html
> 
>   * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][55] ([Intel XE#2925])
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157601v1/shard-dg2-434/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
> 
>   * igt@kms_panel_fitting@legacy:
>     - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#2486])
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157601v1/shard-bmg-8/igt@kms_panel_fitting@legacy.html
> 
>   * igt@kms_pm_backlight@brightness-with-dpms:
>     - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#2938])
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157601v1/shard-bmg-2/igt@kms_pm_backlight@brightness-with-dpms.html
> 
>   * igt@kms_pm_backlight@fade-with-dpms:
>     - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#870])
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157601v1/shard-bmg-8/igt@kms_pm_backlight@fade-with-dpms.html
> 
>   * igt@kms_pm_dc@dc6-dpms:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][59] ([Intel XE#908])
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157601v1/shard-dg2-466/igt@kms_pm_dc@dc6-dpms.html
> 
>   * igt@kms_pm_rpm@modeset-lpsp:
>     - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836]) +1 other test skip
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157601v1/shard-bmg-2/igt@kms_pm_rpm@modeset-lpsp.html
> 
>   * igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][61] ([Intel XE#1406] / [Intel XE#1489]) +2 other tests skip
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157601v1/shard-dg2-466/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
>     - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#1406] / [Intel XE#1489]) +3 other tests skip
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157601v1/shard-bmg-8/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html
> 
>   * igt@kms_psr@pr-sprite-render:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][63] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +2 other tests skip
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157601v1/shard-dg2-466/igt@kms_psr@pr-sprite-render.html
> 
>   * igt@kms_psr@psr-cursor-plane-onoff:
>     - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +7 other tests skip
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157601v1/shard-bmg-2/igt@kms_psr@psr-cursor-plane-onoff.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][65] ([Intel XE#1127])
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157601v1/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][66] ([Intel XE#3414])
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157601v1/shard-dg2-466/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
> 
>   * igt@kms_rotation_crc@sprite-rotation-90:
>     - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#3414] / [Intel XE#3904]) +1 other test skip
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157601v1/shard-bmg-2/igt@kms_rotation_crc@sprite-rotation-90.html
> 
>   * igt@kms_setmode@invalid-clone-single-crtc-stealing:
>     - shard-bmg:          [PASS][68] -> [SKIP][69] ([Intel XE#1435])
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4110-5f250ba2e3bb0b4541473f2bd5dd8a8f22305b61/shard-bmg-8/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157601v1/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
> 
>   * igt@kms_sharpness_filter@filter-scaler-upscale:
>     - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#6503])
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157601v1/shard-bmg-8/igt@kms_sharpness_filter@filter-scaler-upscale.html
> 
>   * igt@kms_tiled_display@basic-test-pattern:
>     - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#2426])
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157601v1/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern.html
> 
>   * igt@xe_compute_preempt@compute-preempt-many-vram-evict@engine-drm_xe_engine_class_compute:
>     - shard-bmg:          [PASS][72] -> [ABORT][73] ([Intel XE#3970]) +1 other test abort
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4110-5f250ba2e3bb0b4541473f2bd5dd8a8f22305b61/shard-bmg-8/igt@xe_compute_preempt@compute-preempt-many-vram-evict@engine-drm_xe_engine_class_compute.html
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157601v1/shard-bmg-4/igt@xe_compute_preempt@compute-preempt-many-vram-evict@engine-drm_xe_engine_class_compute.html
> 
>   * igt@xe_eu_stall@invalid-sampling-rate:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][74] ([Intel XE#5626])
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157601v1/shard-dg2-466/igt@xe_eu_stall@invalid-sampling-rate.html
> 
>   * igt@xe_eudebug@basic-vm-bind-metadata-discovery:
>     - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#4837]) +5 other tests skip
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157601v1/shard-bmg-8/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html
> 
>   * igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][76] ([Intel XE#4837]) +3 other tests skip
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157601v1/shard-dg2-466/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html
> 
>   * igt@xe_evict@evict-mixed-many-threads-small:
>     - shard-bmg:          [PASS][77] -> [INCOMPLETE][78] ([Intel XE#6321] / [Intel XE#6606])
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4110-5f250ba2e3bb0b4541473f2bd5dd8a8f22305b61/shard-bmg-4/igt@xe_evict@evict-mixed-many-threads-small.html
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157601v1/shard-bmg-6/igt@xe_evict@evict-mixed-many-threads-small.html
> 
>   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate:
>     - shard-bmg:          NOTRUN -> [SKIP][79] ([Intel XE#2322]) +4 other tests skip
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157601v1/shard-bmg-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html
> 
>   * igt@xe_exec_fault_mode@many-basic-prefetch:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][80] ([Intel XE#288]) +6 other tests skip
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157601v1/shard-dg2-434/igt@xe_exec_fault_mode@many-basic-prefetch.html
> 
>   * igt@xe_exec_system_allocator@process-many-large-mmap-huge-nomemset:
>     - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#4943]) +8 other tests skip
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157601v1/shard-bmg-2/igt@xe_exec_system_allocator@process-many-large-mmap-huge-nomemset.html
> 
>   * igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][82] ([Intel XE#4915]) +96 other tests skip
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157601v1/shard-dg2-466/igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc.html
> 
>   * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][83] ([Intel XE#2229])
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157601v1/shard-dg2-434/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
> 
>   * igt@xe_oa@mmio-triggered-reports-read:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][84] ([Intel XE#6032])
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157601v1/shard-dg2-434/igt@xe_oa@mmio-triggered-reports-read.html
> 
>   * igt@xe_oa@syncs-ufence-wait:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][85] ([Intel XE#3573]) +1 other test skip
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157601v1/shard-dg2-466/igt@xe_oa@syncs-ufence-wait.html
> 
>   * igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][86] ([Intel XE#6566])
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157601v1/shard-dg2-434/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html
> 
>   * igt@xe_pm@s2idle-d3cold-basic-exec:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][87] ([Intel XE#2284] / [Intel XE#366])
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157601v1/shard-dg2-466/igt@xe_pm@s2idle-d3cold-basic-exec.html
> 
>   * igt@xe_pm@s3-multiple-execs:
>     - shard-dg2-set2:     [PASS][88] -> [INCOMPLETE][89] ([Intel XE#6255])
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4110-5f250ba2e3bb0b4541473f2bd5dd8a8f22305b61/shard-dg2-436/igt@xe_pm@s3-multiple-execs.html
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157601v1/shard-dg2-435/igt@xe_pm@s3-multiple-execs.html
> 
>   * igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_compute0:
>     - shard-lnl:          [PASS][90] -> [FAIL][91] ([Intel XE#6251]) +3 other tests fail
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4110-5f250ba2e3bb0b4541473f2bd5dd8a8f22305b61/shard-lnl-4/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_compute0.html
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157601v1/shard-lnl-8/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_compute0.html
> 
>   * igt@xe_pxp@pxp-stale-bo-exec-post-suspend:
>     - shard-bmg:          NOTRUN -> [SKIP][92] ([Intel XE#4733]) +1 other test skip
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157601v1/shard-bmg-8/igt@xe_pxp@pxp-stale-bo-exec-post-suspend.html
> 
>   * igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][93] ([Intel XE#4733]) +1 other test skip
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157601v1/shard-dg2-434/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html
> 
>   * igt@xe_query@multigpu-query-gt-list:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][94] ([Intel XE#944])
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157601v1/shard-dg2-466/igt@xe_query@multigpu-query-gt-list.html
> 
>   * igt@xe_query@multigpu-query-hwconfig:
>     - shard-bmg:          NOTRUN -> [SKIP][95] ([Intel XE#944]) +1 other test skip
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157601v1/shard-bmg-2/igt@xe_query@multigpu-query-hwconfig.html
> 
>   * igt@xe_render_copy@render-stress-4-copies:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][96] ([Intel XE#4814])
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157601v1/shard-dg2-466/igt@xe_render_copy@render-stress-4-copies.html
> 
>   * igt@xe_sriov_flr@flr-each-isolation:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][97] ([Intel XE#3342])
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157601v1/shard-dg2-466/igt@xe_sriov_flr@flr-each-isolation.html
> 
>   * igt@xe_sriov_scheduling@nonpreempt-engine-resets@numvfs-random:
>     - shard-adlp:         [PASS][98] -> [ABORT][99] ([Intel XE#5466] / [Intel XE#5545]) +1 other test abort
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4110-5f250ba2e3bb0b4541473f2bd5dd8a8f22305b61/shard-adlp-8/igt@xe_sriov_scheduling@nonpreempt-engine-resets@numvfs-random.html
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157601v1/shard-adlp-4/igt@xe_sriov_scheduling@nonpreempt-engine-resets@numvfs-random.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:
>     - shard-adlp:         [FAIL][100] ([Intel XE#3908]) -> [PASS][101] +1 other test pass
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4110-5f250ba2e3bb0b4541473f2bd5dd8a8f22305b61/shard-adlp-3/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157601v1/shard-adlp-3/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4:
>     - shard-dg2-set2:     [INCOMPLETE][102] ([Intel XE#6168]) -> [PASS][103]
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4110-5f250ba2e3bb0b4541473f2bd5dd8a8f22305b61/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157601v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [DMESG-WARN][104] ([Intel XE#1727] / [Intel XE#3113]) -> [PASS][105]
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4110-5f250ba2e3bb0b4541473f2bd5dd8a8f22305b61/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157601v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-64x64:
>     - shard-adlp:         [DMESG-WARN][106] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][107] +6 other tests pass
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4110-5f250ba2e3bb0b4541473f2bd5dd8a8f22305b61/shard-adlp-2/igt@kms_cursor_crc@cursor-rapid-movement-64x64.html
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157601v1/shard-adlp-4/igt@kms_cursor_crc@cursor-rapid-movement-64x64.html
> 
>   * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
>     - shard-bmg:          [SKIP][108] ([Intel XE#2291]) -> [PASS][109] +4 other tests pass
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4110-5f250ba2e3bb0b4541473f2bd5dd8a8f22305b61/shard-bmg-6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157601v1/shard-bmg-2/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
> 
>   * igt@kms_fbcon_fbt@psr-suspend:
>     - shard-lnl:          [FAIL][110] ([Intel XE#4164]) -> [PASS][111]
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4110-5f250ba2e3bb0b4541473f2bd5dd8a8f22305b61/shard-lnl-4/igt@kms_fbcon_fbt@psr-suspend.html
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157601v1/shard-lnl-8/igt@kms_fbcon_fbt@psr-suspend.html
> 
>   * igt@kms_flip@2x-nonexisting-fb:
>     - shard-bmg:          [SKIP][112] ([Intel XE#2316]) -> [PASS][113] +7 other tests pass
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4110-5f250ba2e3bb0b4541473f2bd5dd8a8f22305b61/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157601v1/shard-bmg-7/igt@kms_flip@2x-nonexisting-fb.html
> 
>   * igt@kms_flip@basic-flip-vs-modeset@b-hdmi-a1:
>     - shard-adlp:         [DMESG-WARN][114] ([Intel XE#4543]) -> [PASS][115] +1 other test pass
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4110-5f250ba2e3bb0b4541473f2bd5dd8a8f22305b61/shard-adlp-3/igt@kms_flip@basic-flip-vs-modeset@b-hdmi-a1.html
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157601v1/shard-adlp-6/igt@kms_flip@basic-flip-vs-modeset@b-hdmi-a1.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
>     - shard-lnl:          [FAIL][116] ([Intel XE#301]) -> [PASS][117] +1 other test pass
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4110-5f250ba2e3bb0b4541473f2bd5dd8a8f22305b61/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157601v1/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
> 
>   * igt@kms_flip@flip-vs-suspend:
>     - shard-bmg:          [INCOMPLETE][118] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][119] +1 other test pass
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4110-5f250ba2e3bb0b4541473f2bd5dd8a8f22305b61/shard-bmg-7/igt@kms_flip@flip-vs-suspend.html
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157601v1/shard-bmg-5/igt@kms_flip@flip-vs-suspend.html
> 
>   * igt@kms_hdr@static-toggle-dpms:
>     - shard-bmg:          [SKIP][120] ([Intel XE#1503]) -> [PASS][121]
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4110-5f250ba2e3bb0b4541473f2bd5dd8a8f22305b61/shard-bmg-6/igt@kms_hdr@static-toggle-dpms.html
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157601v1/shard-bmg-8/igt@kms_hdr@static-toggle-dpms.html
> 
>   * igt@kms_plane_multiple@2x-tiling-none:
>     - shard-bmg:          [SKIP][122] ([Intel XE#4596]) -> [PASS][123]
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4110-5f250ba2e3bb0b4541473f2bd5dd8a8f22305b61/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-none.html
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157601v1/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-none.html
> 
>   * igt@kms_pm_dc@dc6-dpms:
>     - shard-adlp:         [FAIL][124] ([Intel XE#718]) -> [PASS][125]
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4110-5f250ba2e3bb0b4541473f2bd5dd8a8f22305b61/shard-adlp-2/igt@kms_pm_dc@dc6-dpms.html
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157601v1/shard-adlp-8/igt@kms_pm_dc@dc6-dpms.html
> 
>   * igt@kms_setmode@basic:
>     - shard-lnl:          [FAIL][126] ([Intel XE#6361]) -> [PASS][127] +1 other test pass
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4110-5f250ba2e3bb0b4541473f2bd5dd8a8f22305b61/shard-lnl-3/igt@kms_setmode@basic.html
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157601v1/shard-lnl-7/igt@kms_setmode@basic.html
> 
>   * igt@kms_vrr@cmrr@pipe-a-edp-1:
>     - shard-lnl:          [FAIL][128] ([Intel XE#4459]) -> [PASS][129] +1 other test pass
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4110-5f250ba2e3bb0b4541473f2bd5dd8a8f22305b61/shard-lnl-2/igt@kms_vrr@cmrr@pipe-a-edp-1.html
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157601v1/shard-lnl-5/igt@kms_vrr@cmrr@pipe-a-edp-1.html
> 
>   * igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
>     - shard-lnl:          [FAIL][130] ([Intel XE#2142]) -> [PASS][131] +1 other test pass
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4110-5f250ba2e3bb0b4541473f2bd5dd8a8f22305b61/shard-lnl-1/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157601v1/shard-lnl-5/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
> 
>   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr:
>     - shard-adlp:         [DMESG-FAIL][132] ([Intel XE#3868] / [Intel XE#3876] / [Intel XE#5213] / [Intel XE#5545]) -> [PASS][133]
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4110-5f250ba2e3bb0b4541473f2bd5dd8a8f22305b61/shard-adlp-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr.html
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157601v1/shard-adlp-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr.html
> 
>   * igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:
>     - shard-dg2-set2:     [DMESG-WARN][134] ([Intel XE#5893]) -> [PASS][135]
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4110-5f250ba2e3bb0b4541473f2bd5dd8a8f22305b61/shard-dg2-436/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157601v1/shard-dg2-466/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html
> 
>   * igt@xe_pm@s3-vm-bind-prefetch:
>     - shard-dg2-set2:     [TIMEOUT][136] -> [PASS][137]
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4110-5f250ba2e3bb0b4541473f2bd5dd8a8f22305b61/shard-dg2-436/igt@xe_pm@s3-vm-bind-prefetch.html
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157601v1/shard-dg2-466/igt@xe_pm@s3-vm-bind-prefetch.html
> 
>   * igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_enhance0:
>     - shard-lnl:          [FAIL][138] ([Intel XE#6251]) -> [PASS][139]
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4110-5f250ba2e3bb0b4541473f2bd5dd8a8f22305b61/shard-lnl-4/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_enhance0.html
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157601v1/shard-lnl-8/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_enhance0.html
> 
>   * igt@xe_pmu@gt-frequency:
>     - shard-dg2-set2:     [FAIL][140] ([Intel XE#4819]) -> [PASS][141] +1 other test pass
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4110-5f250ba2e3bb0b4541473f2bd5dd8a8f22305b61/shard-dg2-435/igt@xe_pmu@gt-frequency.html
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157601v1/shard-dg2-436/igt@xe_pmu@gt-frequency.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_content_protection@atomic:
>     - shard-bmg:          [FAIL][142] ([Intel XE#1178]) -> [SKIP][143] ([Intel XE#2341]) +1 other test skip
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4110-5f250ba2e3bb0b4541473f2bd5dd8a8f22305b61/shard-bmg-7/igt@kms_content_protection@atomic.html
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157601v1/shard-bmg-6/igt@kms_content_protection@atomic.html
> 
>   * igt@kms_content_protection@uevent:
>     - shard-bmg:          [FAIL][144] ([Intel XE#1188]) -> [SKIP][145] ([Intel XE#2341])
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4110-5f250ba2e3bb0b4541473f2bd5dd8a8f22305b61/shard-bmg-8/igt@kms_content_protection@uevent.html
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157601v1/shard-bmg-6/igt@kms_content_protection@uevent.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible:
>     - shard-adlp:         [DMESG-WARN][146] ([Intel XE#2953] / [Intel XE#4173]) -> [DMESG-WARN][147] ([Intel XE#2953] / [Intel XE#4173] / [Intel XE#4543]) +1 other test dmesg-warn
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4110-5f250ba2e3bb0b4541473f2bd5dd8a8f22305b61/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible.html
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157601v1/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
>     - shard-bmg:          [SKIP][148] ([Intel XE#2312]) -> [SKIP][149] ([Intel XE#2311]) +15 other tests skip
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4110-5f250ba2e3bb0b4541473f2bd5dd8a8f22305b61/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157601v1/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render:
>     - shard-bmg:          [SKIP][150] ([Intel XE#5390]) -> [SKIP][151] ([Intel XE#2312]) +5 other tests skip
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4110-5f250ba2e3bb0b4541473f2bd5dd8a8f22305b61/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render.html
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157601v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
>     - shard-bmg:          [SKIP][152] ([Intel XE#2312]) -> [SKIP][153] ([Intel XE#5390]) +5 other tests skip
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4110-5f250ba2e3bb0b4541473f2bd5dd8a8f22305b61/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157601v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt:
>     - shard-bmg:          [SKIP][154] ([Intel XE#2311]) -> [SKIP][155] ([Intel XE#2312]) +10 other tests skip
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4110-5f250ba2e3bb0b4541473f2bd5dd8a8f22305b61/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt.html
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157601v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
>     - shard-bmg:          [SKIP][156] ([Intel XE#2312]) -> [SKIP][157] ([Intel XE#2313]) +14 other tests skip
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4110-5f250ba2e3bb0b4541473f2bd5dd8a8f22305b61/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157601v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
>     - shard-bmg:          [SKIP][158] ([Intel XE#2313]) -> [SKIP][159] ([Intel XE#2312]) +11 other tests skip
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4110-5f250ba2e3bb0b4541473f2bd5dd8a8f22305b61/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157601v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
> 
>   * igt@kms_hdr@brightness-with-hdr:
>     - shard-bmg:          [SKIP][160] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][161] ([Intel XE#3544])
>    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4110-5f250ba2e3bb0b4541473f2bd5dd8a8f22305b61/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html
>    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157601v1/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html
> 
>   * igt@kms_plane_multiple@2x-tiling-y:
>     - shard-bmg:          [SKIP][162] ([Intel XE#5021]) -> [SKIP][163] ([Intel XE#4596])
>    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4110-5f250ba2e3bb0b4541473f2bd5dd8a8f22305b61/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-y.html
>    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157601v1/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-y.html
> 
>   
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
>   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>   [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
>   [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
>   [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
>   [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
>   [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
>   [Intel XE#2142]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142
>   [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
>   [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
>   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>   [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
>   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>   [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
>   [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
>   [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
>   [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
>   [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
>   [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
>   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>   [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
>   [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
>   [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
>   [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
>   [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
>   [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
>   [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
>   [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
>   [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
>   [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
>   [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
>   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>   [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
>   [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
>   [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>   [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
>   [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
>   [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
>   [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
>   [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
>   [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
>   [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#3868]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3868
>   [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
>   [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
>   [Intel XE#3908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908
>   [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970
>   [Intel XE#4164]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4164
>   [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
>   [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
>   [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
>   [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
>   [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
>   [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
>   [Intel XE#4814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814
>   [Intel XE#4819]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4819
>   [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
>   [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
>   [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
>   [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
>   [Intel XE#5208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208
>   [Intel XE#5213]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5213
>   [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
>   [Intel XE#5466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466
>   [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
>   [Intel XE#5626]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5626
>   [Intel XE#5893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5893
>   [Intel XE#6032]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6032
>   [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
>   [Intel XE#6168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6168
>   [Intel XE#6251]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251
>   [Intel XE#6255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6255
>   [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
>   [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
>   [Intel XE#6361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6361
>   [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#6566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6566
>   [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
>   [Intel XE#6606]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6606
>   [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
>   [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>   [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-4110-5f250ba2e3bb0b4541473f2bd5dd8a8f22305b61 -> xe-pw-157601v1
> 
>   IGT_8625: 69d0aa3606a205aec90d6145bb20cbae755e8559 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-4110-5f250ba2e3bb0b4541473f2bd5dd8a8f22305b61: 5f250ba2e3bb0b4541473f2bd5dd8a8f22305b61
>   xe-pw-157601v1: 157601v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157601v1/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
