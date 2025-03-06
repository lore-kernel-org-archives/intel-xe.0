Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FCFEC282D1
	for <intel-xe@archiver.kernel.org>; Thu,  6 Mar 2025 09:56:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1126F10E928;
	Thu,  6 Mar 2025 09:56:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m/TvTp7o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 335F210E928
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Mar 2025 09:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741254967; x=1772790967;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=ldmZRA4iL447pCgnwOPi0nh2+TvuvsOHtP4O1+mjeqg=;
 b=m/TvTp7ootyeYiQgV6IlriCUr1bNJ+ArmA8i+AzO8btai7Cwm9GN6C5Y
 XPQNimfXzES+c0lKmFMDf/TKLV93wzFARfHRGOVu3RiIKhwS6+S5szMQv
 0NILDmrUA/2DAQaLQ0PBIcblMl5rNQ+XoQRZCAG75bIP2+2FUGp1FOqG/
 TkrKf4LEovK0NfMyNshuy1/6M9c/MkHJGl/lR/fz0HJ9Q7658DBb4Ro9r
 2XEmzKpT3gtTaKnkHwj7kZbkD9B9gDHR5D5qz9IQNsAfGiypPw0nVKvbT
 Cqdo6pKne0LJbQQUxg/VA30xCxwLqFvs9TsYig5ys68YY3pIN7qBZL0xy Q==;
X-CSE-ConnectionGUID: n+M0ikxTQZOS5TP0qEDN+g==
X-CSE-MsgGUID: 46d8SbsWRUS/yigHG/7TcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="52891218"
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; d="scan'208";a="52891218"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 01:56:07 -0800
X-CSE-ConnectionGUID: 4zYdAzZGTaW8YBoG+c/jCA==
X-CSE-MsgGUID: ZMkegv32RDCXBpWQGC88Mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="124182124"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 01:56:06 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 6 Mar 2025 01:56:05 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 6 Mar 2025 01:56:05 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.43) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Mar 2025 01:56:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kMJEXY3/EU5Z/dsTyfWBwPg7pB1rlkcGabDhad91qib5e3EKnepiw2tMOWcpLMyDwVH4AS8xqjdE5J8wWmS/U/qJ1MlTbArVBDmKR03KhsMdpZL+w5aSiQfB8ZKlqh3vo2M9r4ReE9a6tIIENj5FpgCfkH/dWBGkynHJkndVKXwk2kXkF6S9Zy8Oo5kbkU3hV8zJfczScbOBl8euIH5Vq66W4KuSrWnyGV+l68ViBPN1WSgUiC/DvKSCB/+BbUDQfG2lFEmvBsnkc3hmJcCfJuqGVEGuO3EzO6RzNmN/TWeUVojIDSLM6/XhxlvXryZMbTxDhpttL51b1UMzMU2hgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9nnKxciZ5FgrurgrTkqaIZ7+Z1MHrURo/XuvWpl3eCM=;
 b=m2Cz95btGCfKYPs4wnuvna9lr0WYYVOkdsLUJd6evrRUkTDn1jzzwY+cVncMTv42Xj+AicTog4ckgd5QYksm+qTsCAF+UFIT1o1JvUdqOz9fMyA5Jr5ONLpI8qNBaOLi71BhRkztU/vDdw96OTl3l1mylbLwJuOMFc6LNpyt34Z2tfcRNE7j0XOBey+E7kXtLuAiTqw1Ug2sukVuKoC4mmYe9/WuF7U90ARVR0EAT/SXlbXOVU41IZlOH66xNylZuV2l8hyO3uK/XTY9c2deOjaasC/DzAwQHYnXdpPbuOlELCyyaEl8fuUfsYFd5oVHQzvJQ7pqQv1/6N49XrFqPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS7PR11MB7949.namprd11.prod.outlook.com (2603:10b6:8:eb::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.28; Thu, 6 Mar
 2025 09:56:00 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8489.028; Thu, 6 Mar 2025
 09:56:00 +0000
Date: Thu, 6 Mar 2025 01:57:07 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw6IGZhaWx1?= =?utf-8?Q?re?= for
 Introduce GPU SVM and Xe SVM implementation (rev7)
Message-ID: <Z8lxc14+x2z6CBEO@lstrano-desk.jf.intel.com>
References: <20250306012657.3505757-1-matthew.brost@intel.com>
 <174124954379.66384.3950557289081096572@64e06c682a23>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <174124954379.66384.3950557289081096572@64e06c682a23>
X-ClientProxiedBy: MW4P222CA0011.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::16) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS7PR11MB7949:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c86ea11-3d27-46c6-989c-08dd5c951961
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0y7dKJI9xBEBd3KdzFPX7Lutfe4dZRMNPpi4XtTnX8pch3xYZJXUAlgrwt4k?=
 =?us-ascii?Q?VoYj/pHiTtkkK/JaRI1wdos5vynHqDy1bQi14z9DXcWDlKvJmhkIypV0zxw4?=
 =?us-ascii?Q?HO7S0E7KRLWfcSLhtiM3xzhfdLVY4E6pgCZ+/4xzmQLFeglZv0fjS+sM5C0j?=
 =?us-ascii?Q?yMCmv9Sm/oVmNeTcqG6nMOYRCNuaypW6EVslIm2Lc07YlrIHhUnNfBzPq1wJ?=
 =?us-ascii?Q?3/0fcFXeC66ZR5qp9j8j1hVB0YQdLaGbNvxhSKAVwIk4CkD0NVzNrYcRX64n?=
 =?us-ascii?Q?AUpNmWAVC1ZkREuge0QJvCXPfV3YEKprbssauISOBs2Cr1apNjVcjcVVAcMr?=
 =?us-ascii?Q?5PFJsrjtwgYnpVAIW8V6UtuKEvEAMfWw3V3rCw8YTTvU1a+wkchooT23wQnu?=
 =?us-ascii?Q?1yxXoxb/ZlWYDKa/S6heQGP/5GzeGqrh4JnkgT4mt3qhd9zGMGRYGB8lB2hp?=
 =?us-ascii?Q?+AgCwfP3f7lR9OAHJ/rSsOWvNbQ37sV+tNFanxoTaGcWlYYHf+m5NhdotBuN?=
 =?us-ascii?Q?9IfiADdK2Fcu1cK+G4Juzw55brVWALWi/UtBTbRSq8TCsjO9kpxTaZnqW8vt?=
 =?us-ascii?Q?PyfxCOG4B/ShzIZUEwySLeVZy8D44ooY/SlenSwIZMU/vhcnRrgqNNBFD3Rm?=
 =?us-ascii?Q?YzioRgAgTZIY5dgr60XqKIblr6OGMsbio5jntiqUP9D/WcMoKtscyfQDAw26?=
 =?us-ascii?Q?aM7LatICliCzu26pVFwllkODQRpGB5ErHoDyPk3F3UK3H8XCWELgW2PZ8pUW?=
 =?us-ascii?Q?bOMUGgwKfhhHKX4xli6e37CDWJGTvY1o/L148+1ZGj2YRfYg3l3obXJN7eGK?=
 =?us-ascii?Q?hDIDBrOMQBIwByEVM6r+KRcU5rsWqaUYpZDsn7zaeC8nXn44PQR52MUPA7nh?=
 =?us-ascii?Q?eVDhkrsrKeHC1ASUXyMNeUc3oapqom6wka51z7pHcYEayiaAkRo2azyj0JaX?=
 =?us-ascii?Q?1315e8TdXo1oC2+6L8lvPpM/5tbP2sIwzirDrfG4LxY/4zUDOv2FPnmmidku?=
 =?us-ascii?Q?6C/86cllsBg7J0G8dPKX1+xswr8BGeUkL5krH0gRg8uM7U8ikdtKiIQQ0Cx0?=
 =?us-ascii?Q?fPrUoITQaT2/gdgAJH0eVnTtzQl507NBR5srApwM0/Y5OZ95X3NvebuZ2ACD?=
 =?us-ascii?Q?Ml8tsvZ07e1Qrv5bV/kI6kM1vCHsJTYRZX0xdqJREd/323EdYLpCYOhmbuq7?=
 =?us-ascii?Q?tQ6ABDD0Si9M6FEixBaXxSpFcN4ijmHpZ2zqM+OTTJxXJAROuOcezOmY6CZm?=
 =?us-ascii?Q?9zV+Ym98pOcfRrN7rFE3ezmLFQgJhTqDuNmlL6t61GGJkWk6XeMiOrP3AUR6?=
 =?us-ascii?Q?GdUZsmcZ8iRmTmZ5sm6wLkTkazhwn8b8TMEZ8cy5gZiYvg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OObVfd1aoMEVdR6kVPdnz8id6uxzxyoiPfTGlkJUrIFWc4YRUBad+Ed9g/Vb?=
 =?us-ascii?Q?R6IfYen57nK45GhPXWLo0ElJVS0UZGyYs8hFY32fXUEi6FBi6PTEY4C8XGoR?=
 =?us-ascii?Q?bh+cBDvbX02SlQ8tMg6H4JrapYo+vRrdDPSOCHTUPBzgd2XKs+a5DKeLCc4Z?=
 =?us-ascii?Q?Vd8NkapzqtKKV6izQExjQxpNHeQcrLRp4JRQ3X5NZP+A+mUKVJsUl/9AGVt4?=
 =?us-ascii?Q?5oTHFVWjX8sFReSSuaWkpujXLbV0MInrhKKLXYHlERf1j8uKUGgtTCQDXY0o?=
 =?us-ascii?Q?Eof+l+kUaTsc7R9yI6M6/BaehYmETIBzyzLTUDJq0NFfbU/vX+IKOFrW1fBL?=
 =?us-ascii?Q?ZMqoo01dSYqaCN4ERVP9G4VBNgI15AshFM5dJPV5qfXkUFm3gn4luXHUMLdk?=
 =?us-ascii?Q?b0ZFhon1LGiBX51Uz+BN1GYhC9Q+6TXhCOArOD6VOGw0Vp0dhsTSgTjssFEM?=
 =?us-ascii?Q?PdOkKjXMLMHIjmDqFO9rj0Vg7gpWtYJu9FCwPnpHiAKGBLrHst2vea+Q05XI?=
 =?us-ascii?Q?CUYVD1UozJE7nOFSC4wN25iGRZOrlUezI+2V9Bktny6rk0NTj5vl655ojosk?=
 =?us-ascii?Q?Op3wMSPTJjz51VgDAK3aDdGqAU4p/g7JXkDv2e21Ms+TsjIUM0CW8wzz3/QM?=
 =?us-ascii?Q?GQhdB+WZd1rOm5KkWUT1gv5axObYxVroLa6PVnRK2MGjiNhYb0Sl5dIWhpuU?=
 =?us-ascii?Q?/fcpIQUcicUUnjXE0XIcmxbpQZshWSpSnoFgtl7zzwuoId2URqwLdxuXMng1?=
 =?us-ascii?Q?gQbyklaWUmonXMSn2fnFuyqf4RSAwbNY7bwQE4zWUaZAcuJJUImr4QSqdrNX?=
 =?us-ascii?Q?jbNFhmkgQmcplw5JnT6KCJ3PqYgjQef+aF2Ey/vOjvqmgt2YJwAawjQ9aQEe?=
 =?us-ascii?Q?9WX4NUfbGCyqLto+nPdpPnBK8RMArQGpaXKK50ZfAR5D8Ant4In0fXM/Grtg?=
 =?us-ascii?Q?Ox9AmDqTdMqHRK9mLatiGXMcV/R5v3qPWCbZNCLMLYnz4wUSdrTKIQN8UqUU?=
 =?us-ascii?Q?t9q9E5jvhzUB1thvA6OKQS2HPfBkv66V/tgsOChM40/IS+WcOLmTJknIw7dJ?=
 =?us-ascii?Q?2ua2dZfw9i78z7OeERQUPwsokdd8bari831Gxx2jbfcEkacJ9dhMdUlzPP5I?=
 =?us-ascii?Q?vSdQgVgGjaxLX1TcahwkmCJSZ7xPxvZgZIWLzOWjVc7+tvevQ+GqLHOv4Ykn?=
 =?us-ascii?Q?8bLRvDkEBH77x90KOcxgvTnquU7b3vVivCr1Qq0wulKYuzr8l+eDJm0/CQCJ?=
 =?us-ascii?Q?9odh9+9HuEnK36XHKnUaxCRwhX9xi7X9vDyCYeIw8nztD00B3Fr60EfjMgHY?=
 =?us-ascii?Q?1jbOez46cb+58FbOSHPUdqY5e+gJLuOWwZnw/cHhSlIR+PMeOXsCRYx5LZuj?=
 =?us-ascii?Q?Q6fq3gXPPh2c6ES1fxHtlCXAHnyJQC9ZPCRunfneMouWldBXC1YFdQj4ToYW?=
 =?us-ascii?Q?UZQCe0hOchF2REpWKjrZ5ahuvpNjsVj6Cv4StEvhLj+rbz9uA31SrmAGuUb9?=
 =?us-ascii?Q?cTW/k3BcUnaEdAV7Q6AR5hjVD2fPwE0QaWzMEFxqU6mxlq/A/GSE3fVUJTWj?=
 =?us-ascii?Q?FCRKmCjllnN7j1Xx63vrbofLRppSUdbulfjo++Z+aMTqKLCE3VniHKP97fnN?=
 =?us-ascii?Q?mw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c86ea11-3d27-46c6-989c-08dd5c951961
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 09:56:00.4424 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4VQvjGaVEZ6bIHkKQm3lMNhuOcxCKzlrSC7JnaRz69IsZcFT8X071KR9hUQH98+V0u8JJlCfLfjCAI8Ny+Lv4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7949
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

On Thu, Mar 06, 2025 at 08:25:43AM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Introduce GPU SVM and Xe SVM implementation (rev7)
> URL   : https://patchwork.freedesktop.org/series/137870/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c_full -> xe-pw-137870v7_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-137870v7_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-137870v7_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in xe-pw-137870v7_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute:
>     - shard-lnl:          [PASS][1] -> [ABORT][2] +1 other test abort
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-lnl-8/igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-lnl-3/igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute.html
> 

This is the only concerning failure but verified this tests sporadically
fails on BMG before / after this series.

The kernel blow up looks like UAF from the existing code:

From xe_migrate.c:xe_migrate_clear:
1180                         dma_fence_wait(m->fence, false);
1181                         dma_fence_put(fence);

I think this should be s/m->fence/fence as m->fence could be modified /
freed by another thread. I can post a seperate fix for this.

Matt

>   * igt@xe_eudebug_sriov@deny-eudebug:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][3] +1 other test skip
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-464/igt@xe_eudebug_sriov@deny-eudebug.html
>     - shard-lnl:          NOTRUN -> [SKIP][4] +1 other test skip
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-lnl-8/igt@xe_eudebug_sriov@deny-eudebug.html
> 
>   * igt@xe_eudebug_sriov@deny-sriov:
>     - shard-adlp:         NOTRUN -> [SKIP][5] +1 other test skip
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-adlp-9/igt@xe_eudebug_sriov@deny-sriov.html
> 
>   * igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd:
>     - shard-bmg:          NOTRUN -> [INCOMPLETE][6]
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-bmg-4/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd.html
> 
>   * igt@xe_oa@buffer-size:
>     - shard-lnl:          [PASS][7] -> [FAIL][8]
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-lnl-7/igt@xe_oa@buffer-size.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-lnl-6/igt@xe_oa@buffer-size.html
>     - shard-bmg:          [PASS][9] -> [FAIL][10]
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-bmg-2/igt@xe_oa@buffer-size.html
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-bmg-2/igt@xe_oa@buffer-size.html
> 
>   * {igt@xe_oa@buffer-size@rcs-0-128k} (NEW):
>     - shard-bmg:          NOTRUN -> [FAIL][11]
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-bmg-2/igt@xe_oa@buffer-size@rcs-0-128k.html
> 
>   * igt@xe_pm@s4-d3hot-basic-exec:
>     - shard-bmg:          NOTRUN -> [ABORT][12]
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-bmg-7/igt@xe_pm@s4-d3hot-basic-exec.html
> 
>   
> #### Warnings ####
> 
>   * igt@xe_oa@buffer-size:
>     - shard-dg2-set2:     [SKIP][13] ([Intel XE#4208]) -> [SKIP][14]
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-dg2-433/igt@xe_oa@buffer-size.html
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-464/igt@xe_oa@buffer-size.html
> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * {igt@xe_oa@buffer-size@rcs-0-256k}:
>     - shard-lnl:          [PASS][15] -> [FAIL][16]
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-lnl-7/igt@xe_oa@buffer-size@rcs-0-256k.html
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-lnl-6/igt@xe_oa@buffer-size@rcs-0-256k.html
> 
>   
> New tests
> ---------
> 
>   New tests have been introduced between xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c_full and xe-pw-137870v7_full:
> 
> ### New IGT tests (1) ###
> 
>   * igt@xe_oa@buffer-size@rcs-0-128k:
>     - Statuses : 1 fail(s)
>     - Exec time: [0.03] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-137870v7_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@intel_hwmon@hwmon-read:
>     - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#1125])
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-lnl-6/igt@intel_hwmon@hwmon-read.html
>     - shard-adlp:         NOTRUN -> [SKIP][18] ([Intel XE#1125])
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-adlp-8/igt@intel_hwmon@hwmon-read.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events:
>     - shard-adlp:         [PASS][19] -> [DMESG-WARN][20] ([Intel XE#4330]) +3 other tests dmesg-warn
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events.html
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events.html
> 
>   * igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1:
>     - shard-adlp:         [PASS][21] -> [FAIL][22] ([Intel XE#3884]) +1 other test fail
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-adlp-4/igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1.html
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-adlp-4/igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_async_flips@invalid-async-flip-atomic:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#3768])
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-434/igt@kms_async_flips@invalid-async-flip-atomic.html
>     - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#3768])
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-lnl-4/igt@kms_async_flips@invalid-async-flip-atomic.html
>     - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#3768])
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-bmg-4/igt@kms_async_flips@invalid-async-flip-atomic.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
>     - shard-lnl:          NOTRUN -> [SKIP][26] ([Intel XE#3279])
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-lnl-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
> 
>   * igt@kms_big_fb@4-tiled-16bpp-rotate-270:
>     - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#1407]) +5 other tests skip
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-lnl-1/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>     - shard-adlp:         NOTRUN -> [SKIP][28] ([Intel XE#1124]) +9 other tests skip
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-adlp-9/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
> 
>   * igt@kms_big_fb@linear-8bpp-rotate-270:
>     - shard-adlp:         NOTRUN -> [SKIP][29] ([Intel XE#316]) +4 other tests skip
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-adlp-4/igt@kms_big_fb@linear-8bpp-rotate-270.html
>     - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#2327]) +6 other tests skip
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-bmg-2/igt@kms_big_fb@linear-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#316]) +4 other tests skip
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-432/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
> 
>   * igt@kms_big_fb@y-tiled-32bpp-rotate-0:
>     - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#1124]) +7 other tests skip
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-lnl-7/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>     - shard-adlp:         [PASS][33] -> [DMESG-FAIL][34] ([Intel XE#4330]) +7 other tests dmesg-fail
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
> 
>   * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#1124]) +5 other tests skip
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-464/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>     - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#1124]) +14 other tests skip
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-bmg-2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
> 
>   * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
>     - shard-adlp:         NOTRUN -> [SKIP][37] ([Intel XE#2191]) +1 other test skip
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-adlp-3/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
>     - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#2191]) +1 other test skip
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-lnl-1/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
> 
>   * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
>     - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#2314] / [Intel XE#2894]) +1 other test skip
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-bmg-4/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#2191])
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-434/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
> 
>   * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
>     - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#367]) +3 other tests skip
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html
> 
>   * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#367]) +1 other test skip
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-434/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
>     - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#367]) +1 other test skip
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-lnl-7/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
>     - shard-adlp:         NOTRUN -> [SKIP][44] ([Intel XE#367]) +1 other test skip
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-adlp-9/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
> 
>   * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][45] ([Intel XE#455] / [Intel XE#787]) +59 other tests skip
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-464/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6.html
> 
>   * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][46] ([Intel XE#787]) +260 other tests skip
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-434/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][47] ([Intel XE#2907])
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-464/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
>     - shard-adlp:         NOTRUN -> [SKIP][48] ([Intel XE#2907])
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-adlp-8/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs@pipe-a-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#2669]) +3 other tests skip
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-lnl-6/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs@pipe-a-edp-1.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:
>     - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#2652] / [Intel XE#787]) +22 other tests skip
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-bmg-4/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:
>     - shard-adlp:         NOTRUN -> [SKIP][51] ([Intel XE#455] / [Intel XE#787]) +37 other tests skip
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-adlp-8/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][52] ([Intel XE#787]) +56 other tests skip
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-adlp-8/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs:
>     - shard-lnl:          NOTRUN -> [SKIP][53] ([Intel XE#2887]) +15 other tests skip
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-lnl-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
>     - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#3432]) +1 other test skip
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-lnl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html
> 
>   * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:
>     - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#3432])
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
>     - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#2887]) +17 other tests skip
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
>     - shard-dg2-set2:     [PASS][57] -> [INCOMPLETE][58] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124])
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][59] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124])
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_cdclk@mode-transition-all-outputs:
>     - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#2724]) +1 other test skip
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-bmg-2/igt@kms_cdclk@mode-transition-all-outputs.html
> 
>   * igt@kms_cdclk@plane-scaling:
>     - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#4416]) +3 other tests skip
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-lnl-5/igt@kms_cdclk@plane-scaling.html
>     - shard-adlp:         NOTRUN -> [SKIP][62] ([Intel XE#4416] / [Intel XE#455])
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-adlp-1/igt@kms_cdclk@plane-scaling.html
> 
>   * igt@kms_cdclk@plane-scaling@pipe-a-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][63] ([Intel XE#4416]) +2 other tests skip
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-adlp-1/igt@kms_cdclk@plane-scaling@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][64] ([Intel XE#4416]) +3 other tests skip
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-463/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html
> 
>   * igt@kms_chamelium_color@ctm-negative:
>     - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#306]) +1 other test skip
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-lnl-3/igt@kms_chamelium_color@ctm-negative.html
>     - shard-adlp:         NOTRUN -> [SKIP][66] ([Intel XE#306]) +1 other test skip
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-adlp-6/igt@kms_chamelium_color@ctm-negative.html
> 
>   * igt@kms_chamelium_color@degamma:
>     - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#2325]) +4 other tests skip
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-bmg-8/igt@kms_chamelium_color@degamma.html
> 
>   * igt@kms_chamelium_color@gamma:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][68] ([Intel XE#306]) +1 other test skip
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-433/igt@kms_chamelium_color@gamma.html
> 
>   * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][69] ([Intel XE#373]) +7 other tests skip
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-432/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
>     - shard-adlp:         NOTRUN -> [SKIP][70] ([Intel XE#373]) +7 other tests skip
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-adlp-3/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html
>     - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#2252]) +11 other tests skip
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-bmg-7/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html
>     - shard-lnl:          NOTRUN -> [SKIP][72] ([Intel XE#373]) +7 other tests skip
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-lnl-5/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html
> 
>   * igt@kms_content_protection@atomic-dpms:
>     - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#3278])
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-lnl-3/igt@kms_content_protection@atomic-dpms.html
> 
>   * igt@kms_content_protection@dp-mst-type-1:
>     - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#2390])
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-bmg-4/igt@kms_content_protection@dp-mst-type-1.html
>     - shard-adlp:         NOTRUN -> [SKIP][75] ([Intel XE#307])
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-adlp-3/igt@kms_content_protection@dp-mst-type-1.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][76] ([Intel XE#307])
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-464/igt@kms_content_protection@dp-mst-type-1.html
>     - shard-lnl:          NOTRUN -> [SKIP][77] ([Intel XE#307])
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-lnl-1/igt@kms_content_protection@dp-mst-type-1.html
> 
>   * igt@kms_content_protection@lic-type-0@pipe-a-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][78] ([Intel XE#3304])
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-463/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html
> 
>   * igt@kms_content_protection@srm:
>     - shard-bmg:          NOTRUN -> [FAIL][79] ([Intel XE#1178]) +3 other tests fail
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-bmg-2/igt@kms_content_protection@srm.html
> 
>   * igt@kms_content_protection@srm@pipe-a-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][80] ([Intel XE#1178]) +2 other tests fail
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-433/igt@kms_content_protection@srm@pipe-a-dp-4.html
> 
>   * igt@kms_content_protection@uevent@pipe-a-dp-2:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][81] ([Intel XE#1188])
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-432/igt@kms_content_protection@uevent@pipe-a-dp-2.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-32x32:
>     - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#2320]) +5 other tests skip
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-bmg-8/igt@kms_cursor_crc@cursor-offscreen-32x32.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-512x512:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][83] ([Intel XE#308]) +1 other test skip
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-433/igt@kms_cursor_crc@cursor-offscreen-512x512.html
>     - shard-lnl:          NOTRUN -> [SKIP][84] ([Intel XE#2321])
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-lnl-3/igt@kms_cursor_crc@cursor-offscreen-512x512.html
>     - shard-adlp:         NOTRUN -> [SKIP][85] ([Intel XE#308])
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-adlp-1/igt@kms_cursor_crc@cursor-offscreen-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-512x170:
>     - shard-bmg:          NOTRUN -> [SKIP][86] ([Intel XE#2321]) +1 other test skip
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-bmg-8/igt@kms_cursor_crc@cursor-onscreen-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-random-32x10:
>     - shard-lnl:          NOTRUN -> [SKIP][87] ([Intel XE#1424]) +2 other tests skip
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-lnl-3/igt@kms_cursor_crc@cursor-random-32x10.html
> 
>   * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
>     - shard-adlp:         NOTRUN -> [SKIP][88] ([Intel XE#309]) +5 other tests skip
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-adlp-8/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
> 
>   * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
>     - shard-dg2-set2:     [PASS][89] -> [SKIP][90] ([Intel XE#309]) +3 other tests skip
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-dg2-463/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-464/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
>     - shard-lnl:          NOTRUN -> [SKIP][91] ([Intel XE#309]) +5 other tests skip
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-lnl-8/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][92] ([Intel XE#323]) +1 other test skip
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-464/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
>     - shard-lnl:          NOTRUN -> [SKIP][93] ([Intel XE#323]) +1 other test skip
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-lnl-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
>     - shard-adlp:         NOTRUN -> [SKIP][94] ([Intel XE#323]) +1 other test skip
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-adlp-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
>     - shard-bmg:          NOTRUN -> [SKIP][95] ([Intel XE#2286]) +1 other test skip
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-bmg-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
>     - shard-bmg:          NOTRUN -> [SKIP][96] ([Intel XE#2291])
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][97] ([Intel XE#309]) +1 other test skip
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
>     - shard-bmg:          [PASS][98] -> [SKIP][99] ([Intel XE#2291])
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
> 
>   * igt@kms_display_modes@extended-mode-basic:
>     - shard-adlp:         NOTRUN -> [SKIP][100] ([Intel XE#4302])
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-adlp-8/igt@kms_display_modes@extended-mode-basic.html
>     - shard-lnl:          NOTRUN -> [SKIP][101] ([Intel XE#4302])
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-lnl-6/igt@kms_display_modes@extended-mode-basic.html
> 
>   * igt@kms_dp_link_training@uhbr-sst:
>     - shard-adlp:         NOTRUN -> [SKIP][102] ([Intel XE#4356])
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-adlp-6/igt@kms_dp_link_training@uhbr-sst.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][103] ([Intel XE#4356])
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-432/igt@kms_dp_link_training@uhbr-sst.html
>     - shard-lnl:          NOTRUN -> [SKIP][104] ([Intel XE#4354])
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-lnl-4/igt@kms_dp_link_training@uhbr-sst.html
> 
>   * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
>     - shard-bmg:          NOTRUN -> [SKIP][105] ([Intel XE#2244]) +3 other tests skip
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-bmg-4/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
> 
>   * igt@kms_dsc@dsc-with-output-formats-with-bpc:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][106] ([Intel XE#455]) +15 other tests skip
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-434/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
>     - shard-lnl:          NOTRUN -> [SKIP][107] ([Intel XE#2244]) +1 other test skip
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-lnl-7/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
> 
>   * igt@kms_fbcon_fbt@psr:
>     - shard-bmg:          NOTRUN -> [SKIP][108] ([Intel XE#776])
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-bmg-7/igt@kms_fbcon_fbt@psr.html
>     - shard-adlp:         NOTRUN -> [SKIP][109] ([Intel XE#776])
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-adlp-9/igt@kms_fbcon_fbt@psr.html
> 
>   * igt@kms_feature_discovery@chamelium:
>     - shard-bmg:          NOTRUN -> [SKIP][110] ([Intel XE#2372])
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-bmg-2/igt@kms_feature_discovery@chamelium.html
> 
>   * igt@kms_feature_discovery@display-3x:
>     - shard-lnl:          NOTRUN -> [SKIP][111] ([Intel XE#703])
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-lnl-5/igt@kms_feature_discovery@display-3x.html
>     - shard-adlp:         NOTRUN -> [SKIP][112] ([Intel XE#703])
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-adlp-4/igt@kms_feature_discovery@display-3x.html
>     - shard-bmg:          NOTRUN -> [SKIP][113] ([Intel XE#2373])
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-bmg-4/igt@kms_feature_discovery@display-3x.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][114] ([Intel XE#703])
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-464/igt@kms_feature_discovery@display-3x.html
> 
>   * igt@kms_feature_discovery@display-4x:
>     - shard-adlp:         NOTRUN -> [SKIP][115] ([Intel XE#1138])
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-adlp-3/igt@kms_feature_discovery@display-4x.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][116] ([Intel XE#1138])
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-434/igt@kms_feature_discovery@display-4x.html
>     - shard-lnl:          NOTRUN -> [SKIP][117] ([Intel XE#1138])
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-lnl-6/igt@kms_feature_discovery@display-4x.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3:
>     - shard-bmg:          [PASS][118] -> [FAIL][119] ([Intel XE#3321])
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3.html
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3.html
> 
>   * igt@kms_flip@2x-flip-vs-panning-vs-hang:
>     - shard-dg2-set2:     [PASS][120] -> [SKIP][121] ([Intel XE#310]) +1 other test skip
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-dg2-463/igt@kms_flip@2x-flip-vs-panning-vs-hang.html
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-464/igt@kms_flip@2x-flip-vs-panning-vs-hang.html
> 
>   * igt@kms_flip@2x-flip-vs-panning@bc-dp2-hdmi-a3:
>     - shard-bmg:          [PASS][122] -> [INCOMPLETE][123] ([Intel XE#2049]) +1 other test incomplete
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-bmg-7/igt@kms_flip@2x-flip-vs-panning@bc-dp2-hdmi-a3.html
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-bmg-8/igt@kms_flip@2x-flip-vs-panning@bc-dp2-hdmi-a3.html
> 
>   * igt@kms_flip@2x-nonexisting-fb:
>     - shard-bmg:          NOTRUN -> [SKIP][124] ([Intel XE#2316]) +2 other tests skip
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-bmg-4/igt@kms_flip@2x-nonexisting-fb.html
> 
>   * igt@kms_flip@2x-nonexisting-fb-interruptible:
>     - shard-adlp:         NOTRUN -> [SKIP][125] ([Intel XE#310]) +5 other tests skip
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-adlp-6/igt@kms_flip@2x-nonexisting-fb-interruptible.html
>     - shard-lnl:          NOTRUN -> [SKIP][126] ([Intel XE#1421]) +5 other tests skip
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-lnl-8/igt@kms_flip@2x-nonexisting-fb-interruptible.html
> 
>   * igt@kms_flip@2x-plain-flip:
>     - shard-bmg:          [PASS][127] -> [SKIP][128] ([Intel XE#2316]) +1 other test skip
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-bmg-2/igt@kms_flip@2x-plain-flip.html
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-bmg-4/igt@kms_flip@2x-plain-flip.html
> 
>   * igt@kms_flip@2x-plain-flip-fb-recreate:
>     - shard-bmg:          [PASS][129] -> [FAIL][130] ([Intel XE#2882]) +4 other tests fail
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-bmg-2/igt@kms_flip@2x-plain-flip-fb-recreate.html
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-bmg-7/igt@kms_flip@2x-plain-flip-fb-recreate.html
> 
>   * igt@kms_flip@flip-vs-blocking-wf-vblank:
>     - shard-dg2-set2:     [PASS][131] -> [INCOMPLETE][132] ([Intel XE#2049] / [Intel XE#3937])
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-dg2-464/igt@kms_flip@flip-vs-blocking-wf-vblank.html
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-432/igt@kms_flip@flip-vs-blocking-wf-vblank.html
> 
>   * igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp2:
>     - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][133] ([Intel XE#2049] / [Intel XE#3937])
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-432/igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp2.html
> 
>   * igt@kms_flip@flip-vs-suspend:
>     - shard-adlp:         [PASS][134] -> [DMESG-WARN][135] ([Intel XE#2953] / [Intel XE#4173]) +3 other tests dmesg-warn
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-adlp-3/igt@kms_flip@flip-vs-suspend.html
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-adlp-4/igt@kms_flip@flip-vs-suspend.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
>     - shard-bmg:          NOTRUN -> [SKIP][136] ([Intel XE#2293] / [Intel XE#2380]) +2 other tests skip
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode:
>     - shard-bmg:          NOTRUN -> [SKIP][137] ([Intel XE#2293]) +2 other tests skip
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
>     - shard-adlp:         NOTRUN -> [SKIP][138] ([Intel XE#455]) +15 other tests skip
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-adlp-1/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html
>     - shard-lnl:          NOTRUN -> [SKIP][139] ([Intel XE#1401] / [Intel XE#1745]) +1 other test skip
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-default-mode:
>     - shard-lnl:          NOTRUN -> [SKIP][140] ([Intel XE#1401]) +1 other test skip
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode:
>     - shard-lnl:          NOTRUN -> [SKIP][141] ([Intel XE#1397]) +2 other tests skip
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling:
>     - shard-lnl:          NOTRUN -> [SKIP][142] ([Intel XE#1397] / [Intel XE#1745]) +2 other tests skip
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
>     - shard-adlp:         [PASS][143] -> [DMESG-FAIL][144] ([Intel XE#324] / [Intel XE#4330]) +1 other test dmesg-fail
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-adlp-9/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_force_connector_basic@prune-stale-modes:
>     - shard-lnl:          NOTRUN -> [SKIP][145] ([Intel XE#352])
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-lnl-6/igt@kms_force_connector_basic@prune-stale-modes.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-render:
>     - shard-lnl:          NOTRUN -> [SKIP][146] ([Intel XE#651]) +13 other tests skip
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][147] ([Intel XE#651]) +21 other tests skip
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render:
>     - shard-bmg:          NOTRUN -> [SKIP][148] ([Intel XE#2311]) +36 other tests skip
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:
>     - shard-adlp:         NOTRUN -> [SKIP][149] ([Intel XE#651]) +12 other tests skip
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][150] ([Intel XE#4141]) +15 other tests skip
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:
>     - shard-adlp:         NOTRUN -> [DMESG-FAIL][151] ([Intel XE#4330]) +3 other tests dmesg-fail
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
>     - shard-dg2-set2:     [PASS][152] -> [SKIP][153] ([Intel XE#656]) +4 other tests skip
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-render:
>     - shard-lnl:          NOTRUN -> [SKIP][154] ([Intel XE#656]) +35 other tests skip
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][155] ([Intel XE#656]) +5 other tests skip
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4:
>     - shard-adlp:         NOTRUN -> [SKIP][156] ([Intel XE#1151])
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-adlp-3/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][157] ([Intel XE#653]) +21 other tests skip
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][158] ([Intel XE#2313]) +30 other tests skip
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
>     - shard-adlp:         NOTRUN -> [SKIP][159] ([Intel XE#656]) +35 other tests skip
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-adlp-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
>     - shard-bmg:          NOTRUN -> [SKIP][160] ([Intel XE#2312]) +18 other tests skip
>    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
>     - shard-adlp:         NOTRUN -> [SKIP][161] ([Intel XE#653]) +15 other tests skip
>    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-adlp-3/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html
> 
>   * igt@kms_frontbuffer_tracking@plane-fbc-rte:
>     - shard-bmg:          NOTRUN -> [SKIP][162] ([Intel XE#4439])
>    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-bmg-4/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
> 
>   * igt@kms_hdmi_inject@inject-audio:
>     - shard-lnl:          NOTRUN -> [SKIP][163] ([Intel XE#1470] / [Intel XE#2853])
>    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-lnl-6/igt@kms_hdmi_inject@inject-audio.html
> 
>   * igt@kms_invalid_mode@clock-too-high:
>     - shard-lnl:          NOTRUN -> [SKIP][164] ([Intel XE#1450] / [Intel XE#2568])
>    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-lnl-4/igt@kms_invalid_mode@clock-too-high.html
> 
>   * igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][165] ([Intel XE#1450]) +2 other tests skip
>    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-lnl-4/igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1.html
> 
>   * igt@kms_joiner@basic-big-joiner:
>     - shard-adlp:         NOTRUN -> [SKIP][166] ([Intel XE#346])
>    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-adlp-1/igt@kms_joiner@basic-big-joiner.html
>     - shard-bmg:          NOTRUN -> [SKIP][167] ([Intel XE#346])
>    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-bmg-4/igt@kms_joiner@basic-big-joiner.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][168] ([Intel XE#346])
>    [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-433/igt@kms_joiner@basic-big-joiner.html
>     - shard-lnl:          NOTRUN -> [SKIP][169] ([Intel XE#346])
>    [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-lnl-3/igt@kms_joiner@basic-big-joiner.html
> 
>   * igt@kms_joiner@basic-force-big-joiner:
>     - shard-dg2-set2:     [PASS][170] -> [SKIP][171] ([Intel XE#4328]) +1 other test skip
>    [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-dg2-463/igt@kms_joiner@basic-force-big-joiner.html
>    [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-464/igt@kms_joiner@basic-force-big-joiner.html
> 
>   * igt@kms_joiner@basic-force-ultra-joiner:
>     - shard-bmg:          NOTRUN -> [SKIP][172] ([Intel XE#2934])
>    [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-bmg-8/igt@kms_joiner@basic-force-ultra-joiner.html
> 
>   * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>     - shard-bmg:          NOTRUN -> [SKIP][173] ([Intel XE#2501])
>    [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-bmg-8/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
> 
>   * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
>     - shard-bmg:          NOTRUN -> [SKIP][174] ([Intel XE#4329])
>    [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-bmg-2/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][175] ([Intel XE#4359])
>    [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-464/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
>     - shard-lnl:          NOTRUN -> [SKIP][176] ([Intel XE#4329])
>    [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-lnl-6/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
> 
>   * igt@kms_plane@pixel-format:
>     - shard-adlp:         NOTRUN -> [INCOMPLETE][177] ([Intel XE#1035])
>    [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-adlp-4/igt@kms_plane@pixel-format.html
> 
>   * igt@kms_plane@pixel-format@pipe-a-plane-3:
>     - shard-adlp:         NOTRUN -> [WARN][178] ([Intel XE#2078]) +1 other test warn
>    [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-adlp-4/igt@kms_plane@pixel-format@pipe-a-plane-3.html
> 
>   * igt@kms_plane@plane-position-covered:
>     - shard-lnl:          NOTRUN -> [DMESG-FAIL][179] ([Intel XE#324]) +2 other tests dmesg-fail
>    [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-lnl-8/igt@kms_plane@plane-position-covered.html
> 
>   * igt@kms_plane@plane-position-covered@pipe-b-plane-4:
>     - shard-lnl:          NOTRUN -> [DMESG-WARN][180] ([Intel XE#324]) +6 other tests dmesg-warn
>    [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-lnl-8/igt@kms_plane@plane-position-covered@pipe-b-plane-4.html
> 
>   * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-1-size-64:
>     - shard-adlp:         [PASS][181] -> [FAIL][182] ([Intel XE#1471]) +1 other test fail
>    [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-adlp-8/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-1-size-64.html
>    [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-adlp-1/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-1-size-64.html
> 
>   * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:
>     - shard-dg2-set2:     [PASS][183] -> [FAIL][184] ([Intel XE#616]) +1 other test fail
>    [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-dg2-434/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html
>    [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-433/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html
> 
>   * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-2-size-256:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][185] ([Intel XE#616]) +3 other tests fail
>    [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-432/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-2-size-256.html
> 
>   * igt@kms_plane_lowres@tiling-x@pipe-b-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][186] ([Intel XE#599]) +3 other tests skip
>    [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-lnl-1/igt@kms_plane_lowres@tiling-x@pipe-b-edp-1.html
> 
>   * igt@kms_plane_lowres@tiling-yf:
>     - shard-bmg:          NOTRUN -> [SKIP][187] ([Intel XE#2393])
>    [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-bmg-2/igt@kms_plane_lowres@tiling-yf.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a:
>     - shard-adlp:         NOTRUN -> [SKIP][188] ([Intel XE#2763]) +8 other tests skip
>    [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-adlp-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b:
>     - shard-lnl:          NOTRUN -> [SKIP][189] ([Intel XE#2763]) +19 other tests skip
>    [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-lnl-6/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
>     - shard-adlp:         NOTRUN -> [SKIP][190] ([Intel XE#2763] / [Intel XE#455]) +5 other tests skip
>    [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-adlp-6/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][191] ([Intel XE#2763]) +11 other tests skip
>    [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c.html
> 
>   * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][192] ([Intel XE#2763] / [Intel XE#455]) +5 other tests skip
>    [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-434/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d.html
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b:
>     - shard-bmg:          NOTRUN -> [SKIP][193] ([Intel XE#2763]) +39 other tests skip
>    [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-bmg-8/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b.html
> 
>   * igt@kms_pm_backlight@fade-with-suspend:
>     - shard-bmg:          NOTRUN -> [SKIP][194] ([Intel XE#870])
>    [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-bmg-7/igt@kms_pm_backlight@fade-with-suspend.html
>     - shard-adlp:         NOTRUN -> [SKIP][195] ([Intel XE#870])
>    [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-adlp-9/igt@kms_pm_backlight@fade-with-suspend.html
> 
>   * igt@kms_pm_dc@dc6-dpms:
>     - shard-bmg:          NOTRUN -> [FAIL][196] ([Intel XE#1430])
>    [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-bmg-7/igt@kms_pm_dc@dc6-dpms.html
> 
>   * igt@kms_pm_dc@dc9-dpms:
>     - shard-adlp:         NOTRUN -> [SKIP][197] ([Intel XE#734])
>    [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-adlp-6/igt@kms_pm_dc@dc9-dpms.html
> 
>   * igt@kms_pm_rpm@modeset-lpsp:
>     - shard-bmg:          NOTRUN -> [SKIP][198] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836]) +1 other test skip
>    [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-bmg-4/igt@kms_pm_rpm@modeset-lpsp.html
> 
>   * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:
>     - shard-adlp:         NOTRUN -> [SKIP][199] ([Intel XE#1489]) +7 other tests skip
>    [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-adlp-6/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][200] ([Intel XE#1489]) +5 other tests skip
>    [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-432/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html
> 
>   * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:
>     - shard-lnl:          NOTRUN -> [SKIP][201] ([Intel XE#2893]) +3 other tests skip
>    [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-lnl-7/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html
> 
>   * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
>     - shard-bmg:          NOTRUN -> [SKIP][202] ([Intel XE#1489]) +10 other tests skip
>    [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-bmg-2/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html
> 
>   * igt@kms_psr@fbc-pr-sprite-render:
>     - shard-adlp:         NOTRUN -> [SKIP][203] ([Intel XE#2850] / [Intel XE#929]) +16 other tests skip
>    [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-adlp-9/igt@kms_psr@fbc-pr-sprite-render.html
> 
>   * igt@kms_psr@fbc-psr2-sprite-plane-onoff:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][204] ([Intel XE#2850] / [Intel XE#929]) +8 other tests skip
>    [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-464/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html
> 
>   * igt@kms_psr@pr-no-drrs:
>     - shard-lnl:          NOTRUN -> [SKIP][205] ([Intel XE#1406]) +4 other tests skip
>    [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-lnl-7/igt@kms_psr@pr-no-drrs.html
> 
>   * igt@kms_psr@pr-sprite-plane-onoff:
>     - shard-bmg:          NOTRUN -> [SKIP][206] ([Intel XE#2234] / [Intel XE#2850]) +20 other tests skip
>    [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-bmg-4/igt@kms_psr@pr-sprite-plane-onoff.html
> 
>   * igt@kms_rotation_crc@bad-pixel-format:
>     - shard-bmg:          NOTRUN -> [SKIP][207] ([Intel XE#3414] / [Intel XE#3904]) +2 other tests skip
>    [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-bmg-8/igt@kms_rotation_crc@bad-pixel-format.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
>     - shard-bmg:          NOTRUN -> [SKIP][208] ([Intel XE#2330])
>    [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-bmg-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][209] ([Intel XE#1127])
>    [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-464/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
>     - shard-lnl:          NOTRUN -> [SKIP][210] ([Intel XE#1127])
>    [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-lnl-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
> 
>   * igt@kms_scaling_modes@scaling-mode-none:
>     - shard-bmg:          NOTRUN -> [SKIP][211] ([Intel XE#2413])
>    [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-bmg-2/igt@kms_scaling_modes@scaling-mode-none.html
>     - shard-lnl:          NOTRUN -> [SKIP][212] ([Intel XE#2413] / [Intel XE#374])
>    [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-lnl-7/igt@kms_scaling_modes@scaling-mode-none.html
> 
>   * igt@kms_scaling_modes@scaling-mode-none@pipe-a-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][213] ([Intel XE#374]) +2 other tests skip
>    [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-lnl-7/igt@kms_scaling_modes@scaling-mode-none@pipe-a-edp-1.html
> 
>   * igt@kms_setmode@basic-clone-single-crtc:
>     - shard-bmg:          NOTRUN -> [SKIP][214] ([Intel XE#1435]) +1 other test skip
>    [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-bmg-4/igt@kms_setmode@basic-clone-single-crtc.html
>     - shard-lnl:          NOTRUN -> [SKIP][215] ([Intel XE#1435])
>    [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-lnl-1/igt@kms_setmode@basic-clone-single-crtc.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-2:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][216] ([Intel XE#899])
>    [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-432/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-2.html
> 
>   * igt@kms_vrr@flip-suspend:
>     - shard-bmg:          NOTRUN -> [SKIP][217] ([Intel XE#1499]) +2 other tests skip
>    [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-bmg-2/igt@kms_vrr@flip-suspend.html
> 
>   * igt@kms_vrr@lobf:
>     - shard-adlp:         NOTRUN -> [SKIP][218] ([Intel XE#2168])
>    [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-adlp-1/igt@kms_vrr@lobf.html
>     - shard-bmg:          NOTRUN -> [SKIP][219] ([Intel XE#2168]) +1 other test skip
>    [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-bmg-4/igt@kms_vrr@lobf.html
>     - shard-lnl:          NOTRUN -> [SKIP][220] ([Intel XE#1499])
>    [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-lnl-4/igt@kms_vrr@lobf.html
> 
>   * igt@kms_writeback@writeback-pixel-formats:
>     - shard-bmg:          NOTRUN -> [SKIP][221] ([Intel XE#756])
>    [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-bmg-7/igt@kms_writeback@writeback-pixel-formats.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][222] ([Intel XE#756])
>    [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-434/igt@kms_writeback@writeback-pixel-formats.html
>     - shard-lnl:          NOTRUN -> [SKIP][223] ([Intel XE#756])
>    [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-lnl-6/igt@kms_writeback@writeback-pixel-formats.html
>     - shard-adlp:         NOTRUN -> [SKIP][224] ([Intel XE#756])
>    [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-adlp-3/igt@kms_writeback@writeback-pixel-formats.html
> 
>   * igt@testdisplay:
>     - shard-dg2-set2:     NOTRUN -> [ABORT][225] ([Intel XE#2705])
>    [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-432/igt@testdisplay.html
> 
>   * igt@xe_compute@ccs-mode-compute-kernel:
>     - shard-adlp:         NOTRUN -> [SKIP][226] ([Intel XE#1447])
>    [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-adlp-4/igt@xe_compute@ccs-mode-compute-kernel.html
>     - shard-lnl:          NOTRUN -> [SKIP][227] ([Intel XE#1447])
>    [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-lnl-8/igt@xe_compute@ccs-mode-compute-kernel.html
> 
>   * igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][228] ([Intel XE#1280] / [Intel XE#455]) +2 other tests skip
>    [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-432/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html
> 
>   * igt@xe_copy_basic@mem-copy-linear-0xfffe:
>     - shard-adlp:         NOTRUN -> [SKIP][229] ([Intel XE#1123])
>    [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-adlp-8/igt@xe_copy_basic@mem-copy-linear-0xfffe.html
> 
>   * igt@xe_eu_stall@non-blocking-read:
>     - shard-adlp:         NOTRUN -> [SKIP][230] ([Intel XE#4497])
>    [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-adlp-3/igt@xe_eu_stall@non-blocking-read.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][231] ([Intel XE#4497])
>    [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-434/igt@xe_eu_stall@non-blocking-read.html
> 
>   * igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][232] ([Intel XE#3889]) +1 other test skip
>    [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-464/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html
>     - shard-lnl:          NOTRUN -> [SKIP][233] ([Intel XE#3889]) +1 other test skip
>    [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-lnl-1/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html
> 
>   * igt@xe_eudebug@basic-vm-bind-ufence-reconnect:
>     - shard-bmg:          NOTRUN -> [SKIP][234] ([Intel XE#3889]) +1 other test skip
>    [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-bmg-8/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html
>     - shard-adlp:         NOTRUN -> [SKIP][235] ([Intel XE#3889]) +1 other test skip
>    [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-adlp-6/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html
> 
>   * igt@xe_eudebug@discovery-empty-clients:
>     - shard-lnl:          NOTRUN -> [SKIP][236] ([Intel XE#2905]) +8 other tests skip
>    [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-lnl-7/igt@xe_eudebug@discovery-empty-clients.html
> 
>   * igt@xe_eudebug_online@breakpoint-many-sessions-tiles:
>     - shard-adlp:         NOTRUN -> [SKIP][237] ([Intel XE#2905]) +8 other tests skip
>    [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-adlp-8/igt@xe_eudebug_online@breakpoint-many-sessions-tiles.html
> 
>   * igt@xe_eudebug_online@interrupt-other:
>     - shard-bmg:          NOTRUN -> [SKIP][238] ([Intel XE#2905]) +11 other tests skip
>    [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-bmg-4/igt@xe_eudebug_online@interrupt-other.html
> 
>   * igt@xe_eudebug_online@preempt-breakpoint:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][239] ([Intel XE#2905]) +7 other tests skip
>    [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-432/igt@xe_eudebug_online@preempt-breakpoint.html
> 
>   * igt@xe_evict@evict-large-cm:
>     - shard-adlp:         NOTRUN -> [SKIP][240] ([Intel XE#261] / [Intel XE#688]) +4 other tests skip
>    [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-adlp-1/igt@xe_evict@evict-large-cm.html
>     - shard-lnl:          NOTRUN -> [SKIP][241] ([Intel XE#688]) +5 other tests skip
>    [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-lnl-3/igt@xe_evict@evict-large-cm.html
> 
>   * igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd:
>     - shard-adlp:         NOTRUN -> [SKIP][242] ([Intel XE#688])
>    [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-adlp-4/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:
>     - shard-lnl:          NOTRUN -> [SKIP][243] ([Intel XE#1392]) +9 other tests skip
>    [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-lnl-3/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html
> 
>   * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:
>     - shard-adlp:         NOTRUN -> [SKIP][244] ([Intel XE#1392]) +9 other tests skip
>    [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-adlp-8/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html
> 
>   * igt@xe_exec_basic@multigpu-once-null-rebind:
>     - shard-bmg:          NOTRUN -> [SKIP][245] ([Intel XE#2322]) +12 other tests skip
>    [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-bmg-7/igt@xe_exec_basic@multigpu-once-null-rebind.html
> 
>   * igt@xe_exec_fault_mode@twice-basic-prefetch:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][246] ([Intel XE#288]) +20 other tests skip
>    [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-432/igt@xe_exec_fault_mode@twice-basic-prefetch.html
> 
>   * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch:
>     - shard-adlp:         NOTRUN -> [SKIP][247] ([Intel XE#288]) +24 other tests skip
>    [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-adlp-9/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch.html
> 
>   * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][248] ([Intel XE#2360])
>    [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-464/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html
>     - shard-adlp:         NOTRUN -> [SKIP][249] ([Intel XE#2360])
>    [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-adlp-9/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html
> 
>   * igt@xe_exec_reset@cm-cat-error:
>     - shard-adlp:         NOTRUN -> [DMESG-FAIL][250] ([Intel XE#3868])
>    [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-adlp-8/igt@xe_exec_reset@cm-cat-error.html
> 
>   * igt@xe_exec_reset@cm-gt-reset:
>     - shard-bmg:          NOTRUN -> [INCOMPLETE][251] ([Intel XE#3592])
>    [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-bmg-7/igt@xe_exec_reset@cm-gt-reset.html
> 
>   * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init:
>     - shard-adlp:         [PASS][252] -> [DMESG-WARN][253] ([Intel XE#4173]) +1 other test dmesg-warn
>    [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-adlp-4/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init.html
>    [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-adlp-4/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init.html
> 
>   * igt@xe_gt_freq@freq_suspend:
>     - shard-lnl:          NOTRUN -> [SKIP][254] ([Intel XE#584])
>    [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-lnl-1/igt@xe_gt_freq@freq_suspend.html
> 
>   * igt@xe_mmap@pci-membarrier-parallel:
>     - shard-adlp:         NOTRUN -> [SKIP][255] ([Intel XE#4045])
>    [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-adlp-3/igt@xe_mmap@pci-membarrier-parallel.html
>     - shard-lnl:          NOTRUN -> [SKIP][256] ([Intel XE#4045])
>    [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-lnl-1/igt@xe_mmap@pci-membarrier-parallel.html
> 
>   * igt@xe_module_load@force-load:
>     - shard-bmg:          NOTRUN -> [SKIP][257] ([Intel XE#2457])
>    [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-bmg-4/igt@xe_module_load@force-load.html
>     - shard-adlp:         NOTRUN -> [SKIP][258] ([Intel XE#378])
>    [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-adlp-4/igt@xe_module_load@force-load.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][259] ([Intel XE#378])
>    [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-464/igt@xe_module_load@force-load.html
>     - shard-lnl:          NOTRUN -> [SKIP][260] ([Intel XE#378])
>    [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-lnl-5/igt@xe_module_load@force-load.html
> 
>   * igt@xe_oa@invalid-map-oa-buffer:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][261] ([Intel XE#2541] / [Intel XE#3573]) +1 other test skip
>    [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-463/igt@xe_oa@invalid-map-oa-buffer.html
> 
>   * igt@xe_oa@non-sampling-read-error:
>     - shard-adlp:         NOTRUN -> [SKIP][262] ([Intel XE#2541] / [Intel XE#3573]) +3 other tests skip
>    [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-adlp-9/igt@xe_oa@non-sampling-read-error.html
> 
>   * igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][263] ([Intel XE#1173])
>    [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-464/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html
> 
>   * igt@xe_pm@d3cold-multiple-execs:
>     - shard-adlp:         NOTRUN -> [SKIP][264] ([Intel XE#2284] / [Intel XE#366])
>    [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-adlp-1/igt@xe_pm@d3cold-multiple-execs.html
>     - shard-bmg:          NOTRUN -> [SKIP][265] ([Intel XE#2284])
>    [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-bmg-4/igt@xe_pm@d3cold-multiple-execs.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][266] ([Intel XE#2284] / [Intel XE#366])
>    [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-433/igt@xe_pm@d3cold-multiple-execs.html
>     - shard-lnl:          NOTRUN -> [SKIP][267] ([Intel XE#2284] / [Intel XE#366])
>    [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-lnl-3/igt@xe_pm@d3cold-multiple-execs.html
> 
>   * igt@xe_pm@s4-d3hot-basic-exec:
>     - shard-dg2-set2:     NOTRUN -> [ABORT][268] ([Intel XE#4268]) +1 other test abort
>    [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-433/igt@xe_pm@s4-d3hot-basic-exec.html
>     - shard-lnl:          NOTRUN -> [ABORT][269] ([Intel XE#4268])
>    [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-lnl-5/igt@xe_pm@s4-d3hot-basic-exec.html
>     - shard-adlp:         NOTRUN -> [ABORT][270] ([Intel XE#4268])
>    [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-adlp-3/igt@xe_pm@s4-d3hot-basic-exec.html
> 
>   * igt@xe_pm@s4-vm-bind-prefetch:
>     - shard-bmg:          NOTRUN -> [ABORT][271] ([Intel XE#4268])
>    [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-bmg-2/igt@xe_pm@s4-vm-bind-prefetch.html
> 
>   * igt@xe_query@multigpu-query-invalid-extension:
>     - shard-bmg:          NOTRUN -> [SKIP][272] ([Intel XE#944]) +5 other tests skip
>    [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-bmg-4/igt@xe_query@multigpu-query-invalid-extension.html
> 
>   * igt@xe_query@multigpu-query-invalid-query:
>     - shard-adlp:         NOTRUN -> [SKIP][273] ([Intel XE#944]) +2 other tests skip
>    [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-adlp-3/igt@xe_query@multigpu-query-invalid-query.html
> 
>   * igt@xe_query@multigpu-query-oa-units:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][274] ([Intel XE#944]) +3 other tests skip
>    [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-464/igt@xe_query@multigpu-query-oa-units.html
>     - shard-lnl:          NOTRUN -> [SKIP][275] ([Intel XE#944]) +2 other tests skip
>    [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-lnl-1/igt@xe_query@multigpu-query-oa-units.html
> 
>   * igt@xe_sriov_auto_provisioning@exclusive-ranges:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][276] ([Intel XE#4130])
>    [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-433/igt@xe_sriov_auto_provisioning@exclusive-ranges.html
>     - shard-lnl:          NOTRUN -> [SKIP][277] ([Intel XE#4130])
>    [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-lnl-1/igt@xe_sriov_auto_provisioning@exclusive-ranges.html
> 
>   * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:
>     - shard-bmg:          NOTRUN -> [SKIP][278] ([Intel XE#4130]) +1 other test skip
>    [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-bmg-8/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html
> 
>   * igt@xe_sriov_flr@flr-vfs-parallel:
>     - shard-bmg:          NOTRUN -> [SKIP][279] ([Intel XE#4273])
>    [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-bmg-7/igt@xe_sriov_flr@flr-vfs-parallel.html
> 
>   * igt@xe_sriov_scheduling@nonpreempt-engine-resets:
>     - shard-bmg:          NOTRUN -> [SKIP][280] ([Intel XE#4351])
>    [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-bmg-8/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@core_getversion@all-cards:
>     - shard-dg2-set2:     [FAIL][281] ([Intel XE#4284]) -> [PASS][282]
>    [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-dg2-433/igt@core_getversion@all-cards.html
>    [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-432/igt@core_getversion@all-cards.html
> 
>   * igt@fbdev@info:
>     - shard-dg2-set2:     [SKIP][283] ([Intel XE#2134]) -> [PASS][284] +1 other test pass
>    [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-dg2-433/igt@fbdev@info.html
>    [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-433/igt@fbdev@info.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:
>     - shard-dg2-set2:     [SKIP][285] ([Intel XE#2351] / [Intel XE#4208]) -> [PASS][286] +15 other tests pass
>    [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-dg2-433/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html
>    [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-433/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html
> 
>   * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
>     - shard-bmg:          [SKIP][287] ([Intel XE#2291]) -> [PASS][288] +1 other test pass
>    [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-bmg-4/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
>    [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-bmg-8/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
>     - shard-dg2-set2:     [SKIP][289] ([Intel XE#309]) -> [PASS][290] +4 other tests pass
>    [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
>    [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-432/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
> 
>   * igt@kms_feature_discovery@display-2x:
>     - shard-dg2-set2:     [SKIP][291] ([Intel XE#702]) -> [PASS][292]
>    [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-dg2-464/igt@kms_feature_discovery@display-2x.html
>    [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-434/igt@kms_feature_discovery@display-2x.html
> 
>   * igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:
>     - shard-dg2-set2:     [SKIP][293] ([Intel XE#310]) -> [PASS][294] +2 other tests pass
>    [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-dg2-464/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html
>    [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-432/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
>     - shard-bmg:          [FAIL][295] ([Intel XE#3321]) -> [PASS][296] +3 other tests pass
>    [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html
>    [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html
> 
>   * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
>     - shard-bmg:          [SKIP][297] ([Intel XE#2316]) -> [PASS][298] +1 other test pass
>    [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-bmg-4/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html
>    [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-bmg-2/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html
> 
>   * igt@kms_flip@busy-flip:
>     - shard-dg2-set2:     [SKIP][299] ([Intel XE#4208] / [i915#2575]) -> [PASS][300] +118 other tests pass
>    [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-dg2-433/igt@kms_flip@busy-flip.html
>    [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-433/igt@kms_flip@busy-flip.html
> 
>   * igt@kms_flip@flip-vs-absolute-wf_vblank@a-dp2:
>     - shard-bmg:          [FAIL][301] ([Intel XE#2882]) -> [PASS][302] +2 other tests pass
>    [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-bmg-4/igt@kms_flip@flip-vs-absolute-wf_vblank@a-dp2.html
>    [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-bmg-7/igt@kms_flip@flip-vs-absolute-wf_vblank@a-dp2.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
>     - shard-lnl:          [FAIL][303] ([Intel XE#301]) -> [PASS][304] +1 other test pass
>    [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
>    [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
>     - shard-lnl:          [FAIL][305] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][306] +1 other test pass
>    [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
>    [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a6:
>     - shard-dg2-set2:     [FAIL][307] ([Intel XE#301]) -> [PASS][308] +2 other tests pass
>    [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a6.html
>    [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a6.html
> 
>   * igt@kms_flip@plain-flip-fb-recreate-interruptible:
>     - shard-dg2-set2:     [FAIL][309] ([Intel XE#2882]) -> [PASS][310]
>    [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-dg2-464/igt@kms_flip@plain-flip-fb-recreate-interruptible.html
>    [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-434/igt@kms_flip@plain-flip-fb-recreate-interruptible.html
> 
>   * igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1:
>     - shard-lnl:          [FAIL][311] ([Intel XE#886]) -> [PASS][312] +4 other tests pass
>    [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-lnl-7/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html
>    [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-lnl-4/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html
> 
>   * igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a6:
>     - shard-dg2-set2:     [FAIL][313] ([Intel XE#886]) -> [PASS][314]
>    [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-dg2-464/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a6.html
>    [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-434/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a6.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode:
>     - shard-adlp:         [DMESG-FAIL][315] ([Intel XE#324] / [Intel XE#4330]) -> [PASS][316] +1 other test pass
>    [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-adlp-9/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode.html
>    [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:
>     - shard-adlp:         [DMESG-FAIL][317] ([Intel XE#4330]) -> [PASS][318] +8 other tests pass
>    [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html
>    [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render:
>     - shard-dg2-set2:     [SKIP][319] ([Intel XE#656]) -> [PASS][320] +4 other tests pass
>    [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html
>    [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html
> 
>   * igt@kms_hdr@invalid-hdr:
>     - shard-bmg:          [SKIP][321] ([Intel XE#1503]) -> [PASS][322]
>    [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-bmg-4/igt@kms_hdr@invalid-hdr.html
>    [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-bmg-2/igt@kms_hdr@invalid-hdr.html
> 
>   * igt@kms_rmfb@close-fd@pipe-a-edp-1:
>     - shard-lnl:          [DMESG-WARN][323] ([Intel XE#324]) -> [PASS][324]
>    [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-lnl-4/igt@kms_rmfb@close-fd@pipe-a-edp-1.html
>    [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-lnl-7/igt@kms_rmfb@close-fd@pipe-a-edp-1.html
> 
>   * igt@kms_sequence@queue-idle@pipe-a-hdmi-a-1:
>     - shard-adlp:         [DMESG-WARN][325] ([Intel XE#4173]) -> [PASS][326] +3 other tests pass
>    [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-adlp-8/igt@kms_sequence@queue-idle@pipe-a-hdmi-a-1.html
>    [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-adlp-1/igt@kms_sequence@queue-idle@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_setmode@invalid-clone-single-crtc:
>     - shard-dg2-set2:     [SKIP][327] ([Intel XE#455]) -> [PASS][328]
>    [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-dg2-464/igt@kms_setmode@invalid-clone-single-crtc.html
>    [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-433/igt@kms_setmode@invalid-clone-single-crtc.html
> 
>   * igt@xe_exec_balancer@once-parallel-rebind:
>     - shard-dg2-set2:     [SKIP][329] ([Intel XE#4208]) -> [PASS][330] +253 other tests pass
>    [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-dg2-433/igt@xe_exec_balancer@once-parallel-rebind.html
>    [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-464/igt@xe_exec_balancer@once-parallel-rebind.html
> 
>   * igt@xe_exec_basic@multigpu-once-basic-defer-bind:
>     - shard-dg2-set2:     [SKIP][331] ([Intel XE#1392]) -> [PASS][332] +5 other tests pass
>    [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html
>    [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-434/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html
> 
>   * igt@xe_module_load@many-reload:
>     - shard-dg2-set2:     [FAIL][333] -> [PASS][334]
>    [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-dg2-433/igt@xe_module_load@many-reload.html
>    [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-432/igt@xe_module_load@many-reload.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>     - shard-dg2-set2:     [SKIP][335] ([Intel XE#4208] / [i915#2575]) -> [SKIP][336] ([Intel XE#623])
>    [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-dg2-433/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
>    [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-434/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
> 
>   * igt@kms_async_flips@invalid-async-flip:
>     - shard-dg2-set2:     [SKIP][337] ([Intel XE#4208] / [i915#2575]) -> [SKIP][338] ([Intel XE#873])
>    [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-dg2-433/igt@kms_async_flips@invalid-async-flip.html
>    [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-434/igt@kms_async_flips@invalid-async-flip.html
> 
>   * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
>     - shard-dg2-set2:     [SKIP][339] ([Intel XE#4208]) -> [SKIP][340] ([Intel XE#316])
>    [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-dg2-433/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html
>    [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-432/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html
> 
>   * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
>     - shard-dg2-set2:     [SKIP][341] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][342] ([Intel XE#316]) +2 other tests skip
>    [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-dg2-433/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html
>    [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-464/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html
> 
>   * igt@kms_big_fb@y-tiled-addfb-size-overflow:
>     - shard-dg2-set2:     [SKIP][343] ([Intel XE#4208]) -> [SKIP][344] ([Intel XE#610])
>    [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-dg2-433/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
>    [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-433/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
>     - shard-dg2-set2:     [SKIP][345] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][346] ([Intel XE#1124]) +4 other tests skip
>    [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-dg2-433/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
>    [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-464/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
> 
>   * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
>     - shard-dg2-set2:     [SKIP][347] ([Intel XE#4208]) -> [SKIP][348] ([Intel XE#1124]) +10 other tests skip
>    [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-dg2-433/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
>    [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-464/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
>     - shard-dg2-set2:     [SKIP][349] ([Intel XE#4208]) -> [SKIP][350] ([Intel XE#607])
>    [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-dg2-433/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
>    [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
> 
>   * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
>     - shard-dg2-set2:     [SKIP][351] ([Intel XE#4208] / [i915#2575]) -> [SKIP][352] ([Intel XE#2191]) +1 other test skip
>    [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-dg2-433/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html
>    [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-464/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html
> 
>   * igt@kms_bw@linear-tiling-4-displays-2560x1440p:
>     - shard-dg2-set2:     [SKIP][353] ([Intel XE#4208] / [i915#2575]) -> [SKIP][354] ([Intel XE#367]) +4 other tests skip
>    [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-dg2-433/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html
>    [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-464/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html
> 
>   * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
>     - shard-dg2-set2:     [SKIP][355] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][356] ([Intel XE#455] / [Intel XE#787])
>    [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-dg2-433/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html
>    [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-464/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html
> 
>   * igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][357] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][358] ([Intel XE#787]) +6 other tests skip
>    [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-dg2-464/igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-d-hdmi-a-6.html
>    [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-434/igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-d-hdmi-a-6.html
> 
>   * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][359] ([Intel XE#787]) -> [SKIP][360] ([Intel XE#455] / [Intel XE#787]) +6 other tests skip
>    [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-dg2-434/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-6.html
>    [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-6.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
>     - shard-dg2-set2:     [SKIP][361] ([Intel XE#4208]) -> [SKIP][362] ([Intel XE#2907]) +6 other tests skip
>    [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
>    [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:
>     - shard-dg2-set2:     [SKIP][363] ([Intel XE#4208]) -> [SKIP][364] ([Intel XE#455] / [Intel XE#787]) +11 other tests skip
>    [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html
>    [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html
> 
>   * igt@kms_chamelium_color@ctm-limited-range:
>     - shard-dg2-set2:     [SKIP][365] ([Intel XE#4208] / [i915#2575]) -> [SKIP][366] ([Intel XE#306]) +3 other tests skip
>    [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-dg2-433/igt@kms_chamelium_color@ctm-limited-range.html
>    [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-464/igt@kms_chamelium_color@ctm-limited-range.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
>     - shard-dg2-set2:     [SKIP][367] ([Intel XE#4208] / [i915#2575]) -> [SKIP][368] ([Intel XE#373]) +11 other tests skip
>    [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-dg2-433/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
>    [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
> 
>   * igt@kms_content_protection@lic-type-0:
>     - shard-dg2-set2:     [SKIP][369] ([Intel XE#455]) -> [FAIL][370] ([Intel XE#1178])
>    [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-dg2-464/igt@kms_content_protection@lic-type-0.html
>    [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-463/igt@kms_content_protection@lic-type-0.html
> 
>   * igt@kms_content_protection@srm:
>     - shard-dg2-set2:     [SKIP][371] ([Intel XE#4208] / [i915#2575]) -> [FAIL][372] ([Intel XE#1178])
>    [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-dg2-433/igt@kms_content_protection@srm.html
>    [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-433/igt@kms_content_protection@srm.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
>     - shard-dg2-set2:     [SKIP][373] ([Intel XE#4208] / [i915#2575]) -> [SKIP][374] ([Intel XE#309])
>    [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-dg2-433/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
>    [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
>     - shard-dg2-set2:     [SKIP][375] ([Intel XE#4208] / [i915#2575]) -> [SKIP][376] ([Intel XE#323])
>    [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-dg2-433/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
>    [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-433/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
> 
>   * igt@kms_dsc@dsc-with-bpc:
>     - shard-dg2-set2:     [SKIP][377] ([Intel XE#4208]) -> [SKIP][378] ([Intel XE#455]) +5 other tests skip
>    [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-dg2-433/igt@kms_dsc@dsc-with-bpc.html
>    [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-434/igt@kms_dsc@dsc-with-bpc.html
> 
>   * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
>     - shard-dg2-set2:     [SKIP][379] ([Intel XE#4208]) -> [SKIP][380] ([Intel XE#4422])
>    [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-dg2-433/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html
>    [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-464/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html
> 
>   * igt@kms_feature_discovery@psr1:
>     - shard-dg2-set2:     [SKIP][381] ([Intel XE#4208] / [i915#2575]) -> [SKIP][382] ([Intel XE#1135])
>    [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-dg2-433/igt@kms_feature_discovery@psr1.html
>    [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-463/igt@kms_feature_discovery@psr1.html
> 
>   * igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
>     - shard-dg2-set2:     [SKIP][383] ([Intel XE#4208] / [i915#2575]) -> [SKIP][384] ([Intel XE#310]) +2 other tests skip
>    [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-dg2-433/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html
>    [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-464/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank:
>     - shard-bmg:          [FAIL][385] ([Intel XE#3321]) -> [SKIP][386] ([Intel XE#2316])
>    [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank.html
>    [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank.html
>     - shard-dg2-set2:     [FAIL][387] ([Intel XE#301]) -> [SKIP][388] ([Intel XE#310])
>    [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank.html
>    [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
>     - shard-dg2-set2:     [SKIP][389] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][390] ([Intel XE#455]) +2 other tests skip
>    [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
>    [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
>     - shard-dg2-set2:     [SKIP][391] ([Intel XE#656]) -> [SKIP][392] ([Intel XE#651]) +8 other tests skip
>    [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html
>    [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
>     - shard-bmg:          [SKIP][393] ([Intel XE#2311]) -> [SKIP][394] ([Intel XE#2312]) +9 other tests skip
>    [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html
>    [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff:
>     - shard-dg2-set2:     [SKIP][395] ([Intel XE#651]) -> [SKIP][396] ([Intel XE#656]) +6 other tests skip
>    [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html
>    [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
>     - shard-dg2-set2:     [SKIP][397] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][398] ([Intel XE#651]) +13 other tests skip
>    [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
>    [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:
>     - shard-bmg:          [SKIP][399] ([Intel XE#2312]) -> [SKIP][400] ([Intel XE#4141]) +5 other tests skip
>    [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html
>    [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
>     - shard-bmg:          [SKIP][401] ([Intel XE#4141]) -> [SKIP][402] ([Intel XE#2312]) +5 other tests skip
>    [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
>    [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-tiling-y:
>     - shard-dg2-set2:     [SKIP][403] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][404] ([Intel XE#658]) +1 other test skip
>    [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
>    [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
>     - shard-dg2-set2:     [SKIP][405] ([Intel XE#4208]) -> [SKIP][406] ([Intel XE#651]) +20 other tests skip
>    [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html
>    [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-onoff:
>     - shard-bmg:          [SKIP][407] ([Intel XE#2312]) -> [SKIP][408] ([Intel XE#2311]) +5 other tests skip
>    [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-onoff.html
>    [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:
>     - shard-dg2-set2:     [SKIP][409] ([Intel XE#4208]) -> [SKIP][410] ([Intel XE#656]) +12 other tests skip
>    [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html
>    [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:
>     - shard-dg2-set2:     [SKIP][411] ([Intel XE#653]) -> [SKIP][412] ([Intel XE#656]) +9 other tests skip
>    [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html
>    [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render:
>     - shard-dg2-set2:     [SKIP][413] ([Intel XE#653]) -> [INCOMPLETE][414] ([Intel XE#2050] / [Intel XE#2594])
>    [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render.html
>    [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@plane-fbc-rte:
>     - shard-dg2-set2:     [SKIP][415] ([Intel XE#4208]) -> [SKIP][416] ([Intel XE#4439])
>    [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-dg2-433/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
>    [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-434/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
>     - shard-dg2-set2:     [SKIP][417] ([Intel XE#4208]) -> [SKIP][418] ([Intel XE#653]) +27 other tests skip
>    [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html
>    [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render:
>     - shard-dg2-set2:     [SKIP][419] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][420] ([Intel XE#653]) +10 other tests skip
>    [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render.html
>    [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
>     - shard-bmg:          [SKIP][421] ([Intel XE#2312]) -> [SKIP][422] ([Intel XE#2313]) +6 other tests skip
>    [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
>    [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
>     - shard-dg2-set2:     [SKIP][423] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][424] ([Intel XE#656]) +5 other tests skip
>    [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
>    [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
>     - shard-bmg:          [SKIP][425] ([Intel XE#2313]) -> [SKIP][426] ([Intel XE#2312]) +5 other tests skip
>    [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
>    [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
>     - shard-dg2-set2:     [SKIP][427] ([Intel XE#656]) -> [SKIP][428] ([Intel XE#653]) +6 other tests skip
>    [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
>    [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
> 
>   * igt@kms_getfb@getfb-reject-ccs:
>     - shard-dg2-set2:     [SKIP][429] ([Intel XE#4208] / [i915#2575]) -> [SKIP][430] ([Intel XE#605])
>    [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-dg2-433/igt@kms_getfb@getfb-reject-ccs.html
>    [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-434/igt@kms_getfb@getfb-reject-ccs.html
> 
>   * igt@kms_joiner@basic-ultra-joiner:
>     - shard-dg2-set2:     [SKIP][431] ([Intel XE#4208]) -> [SKIP][432] ([Intel XE#2927])
>    [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-dg2-433/igt@kms_joiner@basic-ultra-joiner.html
>    [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-432/igt@kms_joiner@basic-ultra-joiner.html
> 
>   * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
>     - shard-dg2-set2:     [SKIP][433] ([Intel XE#4208]) -> [SKIP][434] ([Intel XE#2925]) +1 other test skip
>    [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-dg2-433/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
>    [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-464/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
> 
>   * igt@kms_panel_fitting@atomic-fastset:
>     - shard-dg2-set2:     [SKIP][435] ([Intel XE#4208] / [i915#2575]) -> [SKIP][436] ([Intel XE#455]) +11 other tests skip
>    [435]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-dg2-433/igt@kms_panel_fitting@atomic-fastset.html
>    [436]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-434/igt@kms_panel_fitting@atomic-fastset.html
> 
>   * igt@kms_plane_cursor@viewport:
>     - shard-dg2-set2:     [SKIP][437] ([Intel XE#4208] / [i915#2575]) -> [FAIL][438] ([Intel XE#616]) +1 other test fail
>    [437]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-dg2-433/igt@kms_plane_cursor@viewport.html
>    [438]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-433/igt@kms_plane_cursor@viewport.html
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:
>     - shard-dg2-set2:     [SKIP][439] ([Intel XE#4208] / [i915#2575]) -> [SKIP][440] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
>    [439]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-dg2-433/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html
>    [440]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html
> 
>   * igt@kms_pm_backlight@bad-brightness:
>     - shard-dg2-set2:     [SKIP][441] ([Intel XE#4208]) -> [SKIP][442] ([Intel XE#870])
>    [441]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-dg2-433/igt@kms_pm_backlight@bad-brightness.html
>    [442]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-464/igt@kms_pm_backlight@bad-brightness.html
> 
>   * igt@kms_pm_dc@dc3co-vpb-simulation:
>     - shard-dg2-set2:     [SKIP][443] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][444] ([Intel XE#1122])
>    [443]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-dg2-433/igt@kms_pm_dc@dc3co-vpb-simulation.html
>    [444]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-434/igt@kms_pm_dc@dc3co-vpb-simulation.html
> 
>   * igt@kms_pm_dc@dc5-psr:
>     - shard-dg2-set2:     [SKIP][445] ([Intel XE#4208]) -> [SKIP][446] ([Intel XE#1129])
>    [445]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-dg2-433/igt@kms_pm_dc@dc5-psr.html
>    [446]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-434/igt@kms_pm_dc@dc5-psr.html
> 
>   * igt@kms_pm_dc@dc6-dpms:
>     - shard-dg2-set2:     [SKIP][447] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][448] ([Intel XE#908])
>    [447]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-dg2-433/igt@kms_pm_dc@dc6-dpms.html
>    [448]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-434/igt@kms_pm_dc@dc6-dpms.html
> 
>   * igt@kms_pm_dc@dc6-psr:
>     - shard-dg2-set2:     [SKIP][449] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][450] ([Intel XE#1129])
>    [449]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-dg2-433/igt@kms_pm_dc@dc6-psr.html
>    [450]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-464/igt@kms_pm_dc@dc6-psr.html
> 
>   * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:
>     - shard-dg2-set2:     [SKIP][451] ([Intel XE#4208]) -> [SKIP][452] ([Intel XE#1489]) +12 other tests skip
>    [451]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-dg2-433/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html
>    [452]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-463/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html
> 
>   * igt@kms_psr2_su@frontbuffer-xrgb8888:
>     - shard-dg2-set2:     [SKIP][453] ([Intel XE#4208]) -> [SKIP][454] ([Intel XE#1122])
>    [453]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-dg2-433/igt@kms_psr2_su@frontbuffer-xrgb8888.html
>    [454]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-463/igt@kms_psr2_su@frontbuffer-xrgb8888.html
> 
>   * igt@kms_psr@fbc-psr-sprite-render:
>     - shard-dg2-set2:     [SKIP][455] ([Intel XE#4208]) -> [SKIP][456] ([Intel XE#2850] / [Intel XE#929]) +13 other tests skip
>    [455]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-dg2-433/igt@kms_psr@fbc-psr-sprite-render.html
>    [456]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-464/igt@kms_psr@fbc-psr-sprite-render.html
> 
>   * igt@kms_psr@pr-primary-page-flip:
>     - shard-dg2-set2:     [SKIP][457] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][458] ([Intel XE#2850] / [Intel XE#929]) +8 other tests skip
>    [457]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-dg2-433/igt@kms_psr@pr-primary-page-flip.html
>    [458]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-463/igt@kms_psr@pr-primary-page-flip.html
> 
>   * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
>     - shard-dg2-set2:     [SKIP][459] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][460] ([Intel XE#2939])
>    [459]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-dg2-433/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
>    [460]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-434/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
> 
>   * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
>     - shard-dg2-set2:     [SKIP][461] ([Intel XE#4208] / [i915#2575]) -> [SKIP][462] ([Intel XE#3414]) +2 other tests skip
>    [461]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-dg2-433/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
>    [462]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-433/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
> 
>   * igt@kms_tiled_display@basic-test-pattern:
>     - shard-dg2-set2:     [SKIP][463] ([Intel XE#4208] / [i915#2575]) -> [FAIL][464] ([Intel XE#1729])
>    [463]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern.html
>    [464]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern.html
> 
>   * igt@kms_tv_load_detect@load-detect:
>     - shard-dg2-set2:     [SKIP][465] ([Intel XE#4208] / [i915#2575]) -> [SKIP][466] ([Intel XE#330])
>    [465]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-dg2-433/igt@kms_tv_load_detect@load-detect.html
>    [466]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-463/igt@kms_tv_load_detect@load-detect.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak:
>     - shard-dg2-set2:     [SKIP][467] ([Intel XE#4208] / [i915#2575]) -> [FAIL][468] ([Intel XE#771] / [Intel XE#899])
>    [467]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak.html
>    [468]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-432/igt@kms_universal_plane@cursor-fb-leak.html
> 
>   * igt@kms_vrr@cmrr:
>     - shard-dg2-set2:     [SKIP][469] ([Intel XE#4208] / [i915#2575]) -> [SKIP][470] ([Intel XE#2168])
>    [469]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-dg2-433/igt@kms_vrr@cmrr.html
>    [470]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-464/igt@kms_vrr@cmrr.html
> 
>   * igt@kms_writeback@writeback-invalid-parameters:
>     - shard-dg2-set2:     [SKIP][471] ([Intel XE#4208] / [i915#2575]) -> [SKIP][472] ([Intel XE#756]) +1 other test skip
>    [471]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-dg2-433/igt@kms_writeback@writeback-invalid-parameters.html
>    [472]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-464/igt@kms_writeback@writeback-invalid-parameters.html
> 
>   * igt@xe_compute_preempt@compute-preempt-many:
>     - shard-dg2-set2:     [SKIP][473] ([Intel XE#4208]) -> [SKIP][474] ([Intel XE#1280] / [Intel XE#455]) +2 other tests skip
>    [473]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-dg2-433/igt@xe_compute_preempt@compute-preempt-many.html
>    [474]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-464/igt@xe_compute_preempt@compute-preempt-many.html
> 
>   * igt@xe_copy_basic@mem-copy-linear-0xfffe:
>     - shard-dg2-set2:     [SKIP][475] ([Intel XE#4208]) -> [SKIP][476] ([Intel XE#1123]) +1 other test skip
>    [475]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-dg2-433/igt@xe_copy_basic@mem-copy-linear-0xfffe.html
>    [476]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-433/igt@xe_copy_basic@mem-copy-linear-0xfffe.html
> 
>   * igt@xe_eu_stall@unprivileged-access:
>     - shard-dg2-set2:     [SKIP][477] ([Intel XE#4208]) -> [SKIP][478] ([Intel XE#4497])
>    [477]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-dg2-433/igt@xe_eu_stall@unprivileged-access.html
>    [478]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-463/igt@xe_eu_stall@unprivileged-access.html
> 
>   * igt@xe_eudebug@basic-vm-access-parameters-userptr:
>     - shard-dg2-set2:     [SKIP][479] ([Intel XE#4208]) -> [SKIP][480] ([Intel XE#3889])
>    [479]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-dg2-433/igt@xe_eudebug@basic-vm-access-parameters-userptr.html
>    [480]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-432/igt@xe_eudebug@basic-vm-access-parameters-userptr.html
> 
>   * igt@xe_eudebug_online@interrupt-all-set-breakpoint:
>     - shard-dg2-set2:     [SKIP][481] ([Intel XE#4208]) -> [SKIP][482] ([Intel XE#2905]) +15 other tests skip
>    [481]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-dg2-433/igt@xe_eudebug_online@interrupt-all-set-breakpoint.html
>    [482]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-433/igt@xe_eudebug_online@interrupt-all-set-breakpoint.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:
>     - shard-dg2-set2:     [SKIP][483] ([Intel XE#4208]) -> [SKIP][484] ([Intel XE#1392]) +3 other tests skip
>    [483]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-dg2-433/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html
>    [484]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html
> 
>   * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
>     - shard-dg2-set2:     [SKIP][485] ([Intel XE#4208]) -> [SKIP][486] ([Intel XE#288]) +37 other tests skip
>    [485]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-dg2-433/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html
>    [486]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-464/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html
> 
>   * igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:
>     - shard-dg2-set2:     [SKIP][487] ([Intel XE#4208]) -> [SKIP][488] ([Intel XE#2360])
>    [487]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-dg2-433/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html
>    [488]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-463/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html
> 
>   * igt@xe_oa@polling-small-buf:
>     - shard-dg2-set2:     [SKIP][489] ([Intel XE#4208]) -> [SKIP][490] ([Intel XE#2541] / [Intel XE#3573]) +10 other tests skip
>    [489]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-dg2-433/igt@xe_oa@polling-small-buf.html
>    [490]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-464/igt@xe_oa@polling-small-buf.html
> 
>   * igt@xe_pat@pat-index-xehpc:
>     - shard-dg2-set2:     [SKIP][491] ([Intel XE#4208]) -> [SKIP][492] ([Intel XE#2838] / [Intel XE#979])
>    [491]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-dg2-433/igt@xe_pat@pat-index-xehpc.html
>    [492]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-463/igt@xe_pat@pat-index-xehpc.html
> 
>   * igt@xe_peer2peer@read:
>     - shard-dg2-set2:     [SKIP][493] ([Intel XE#1061]) -> [FAIL][494] ([Intel XE#1173])
>    [493]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-dg2-432/igt@xe_peer2peer@read.html
>    [494]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-464/igt@xe_peer2peer@read.html
> 
>   * igt@xe_pm@d3cold-mmap-vram:
>     - shard-dg2-set2:     [SKIP][495] ([Intel XE#4208]) -> [SKIP][496] ([Intel XE#2284] / [Intel XE#366]) +2 other tests skip
>    [495]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-dg2-433/igt@xe_pm@d3cold-mmap-vram.html
>    [496]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-464/igt@xe_pm@d3cold-mmap-vram.html
> 
>   * igt@xe_pm@s4-mocs:
>     - shard-adlp:         [ABORT][497] ([Intel XE#4268]) -> [ABORT][498] ([Intel XE#4054] / [Intel XE#4268])
>    [497]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-adlp-4/igt@xe_pm@s4-mocs.html
>    [498]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-adlp-9/igt@xe_pm@s4-mocs.html
> 
>   * igt@xe_pm@vram-d3cold-threshold:
>     - shard-dg2-set2:     [SKIP][499] ([Intel XE#4208]) -> [SKIP][500] ([Intel XE#579])
>    [499]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-dg2-433/igt@xe_pm@vram-d3cold-threshold.html
>    [500]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-434/igt@xe_pm@vram-d3cold-threshold.html
> 
>   * igt@xe_query@multigpu-query-invalid-cs-cycles:
>     - shard-dg2-set2:     [SKIP][501] ([Intel XE#4208]) -> [SKIP][502] ([Intel XE#944]) +2 other tests skip
>    [501]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-dg2-433/igt@xe_query@multigpu-query-invalid-cs-cycles.html
>    [502]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-463/igt@xe_query@multigpu-query-invalid-cs-cycles.html
> 
>   * igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:
>     - shard-dg2-set2:     [SKIP][503] ([Intel XE#4208]) -> [SKIP][504] ([Intel XE#4130]) +1 other test skip
>    [503]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-dg2-433/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html
>    [504]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-432/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html
> 
>   * igt@xe_sriov_flr@flr-vfs-parallel:
>     - shard-dg2-set2:     [SKIP][505] ([Intel XE#4208]) -> [SKIP][506] ([Intel XE#4273]) +1 other test skip
>    [505]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-dg2-433/igt@xe_sriov_flr@flr-vfs-parallel.html
>    [506]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-433/igt@xe_sriov_flr@flr-vfs-parallel.html
> 
>   * igt@xe_sriov_scheduling@nonpreempt-engine-resets:
>     - shard-dg2-set2:     [SKIP][507] ([Intel XE#4208]) -> [SKIP][508] ([Intel XE#4351])
>    [507]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-dg2-433/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html
>    [508]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-434/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html
> 
>   * igt@xe_wedged@wedged-mode-toggle:
>     - shard-dg2-set2:     [SKIP][509] ([Intel XE#4208]) -> [ABORT][510] ([Intel XE#3075] / [Intel XE#3084])
>    [509]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c/shard-dg2-433/igt@xe_wedged@wedged-mode-toggle.html
>    [510]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/shard-dg2-463/igt@xe_wedged@wedged-mode-toggle.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
>   [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
>   [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
>   [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
>   [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
>   [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
>   [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
>   [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
>   [Intel XE#1151]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1151
>   [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
>   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>   [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
>   [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
>   [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
>   [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>   [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
>   [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
>   [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
>   [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
>   [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
>   [Intel XE#1450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450
>   [Intel XE#1470]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470
>   [Intel XE#1471]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1471
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
>   [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
>   [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
>   [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
>   [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
>   [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
>   [Intel XE#2050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2050
>   [Intel XE#2078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2078
>   [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
>   [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
>   [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
>   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>   [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
>   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>   [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
>   [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
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
>   [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
>   [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
>   [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
>   [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
>   [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
>   [Intel XE#2372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372
>   [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
>   [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
>   [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
>   [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
>   [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
>   [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
>   [Intel XE#2501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2501
>   [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
>   [Intel XE#2568]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568
>   [Intel XE#2594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594
>   [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
>   [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
>   [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
>   [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
>   [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
>   [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
>   [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>   [Intel XE#2853]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2853
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
>   [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
>   [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
>   [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
>   [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
>   [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
>   [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
>   [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
>   [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
>   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>   [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
>   [Intel XE#3075]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3075
>   [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
>   [Intel XE#3084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3084
>   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
>   [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
>   [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
>   [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
>   [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
>   [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>   [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
>   [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
>   [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
>   [Intel XE#3279]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3279
>   [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
>   [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
>   [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
>   [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
>   [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
>   [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
>   [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
>   [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
>   [Intel XE#3592]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3592
>   [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/374
>   [Intel XE#3768]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3768
>   [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
>   [Intel XE#3868]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3868
>   [Intel XE#3884]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3884
>   [Intel XE#3889]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889
>   [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
>   [Intel XE#3937]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3937
>   [Intel XE#4045]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4045
>   [Intel XE#4054]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4054
>   [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
>   [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
>   [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
>   [Intel XE#4208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208
>   [Intel XE#4268]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4268
>   [Intel XE#4273]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273
>   [Intel XE#4284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4284
>   [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
>   [Intel XE#4328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4328
>   [Intel XE#4329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329
>   [Intel XE#4330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330
>   [Intel XE#4351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351
>   [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
>   [Intel XE#4356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4356
>   [Intel XE#4359]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4359
>   [Intel XE#4416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4416
>   [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
>   [Intel XE#4439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4439
>   [Intel XE#4497]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4497
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
>   [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
>   [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
>   [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
>   [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
>   [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
>   [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
>   [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#702]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/702
>   [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
>   [Intel XE#734]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/734
>   [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
>   [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
>   [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
>   [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>   [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
>   [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
>   [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
>   [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>   [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
>   [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_8261 -> IGT_8262
>   * Linux: xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c -> xe-pw-137870v7
> 
>   IGT_8261: 8261
>   IGT_8262: 8262
>   xe-2763-3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c: 3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c
>   xe-pw-137870v7: 137870v7
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137870v7/index.html
