Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 695CAD12669
	for <intel-xe@archiver.kernel.org>; Tue,  2 Dec 2025 18:57:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 078B210E67E;
	Tue,  2 Dec 2025 18:57:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ir9x4Mz5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8556510E67E
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Dec 2025 18:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764701845; x=1796237845;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=GM98Orfx5nRbN7qLJCt1+qB91PWtWHNnSoaAom7q/gg=;
 b=ir9x4Mz553y2B2z91BqmOzAzOMob7kQ83lk8ci+EudcBjGmVGj64c0sY
 1SetXrpMdmT6UVekNzOlQ2rZYShR58f3D5iLZKkMxAVg7lRAKvIVFjMu2
 fiRPZu2Vy0wZ0jDK4xeQ1CVaSEtStpyOCOEq+N3F6PiNFPtRp0iIidQiJ
 VUYmrdVZwXq4R2h+a2jIuug1pM7JSWacre8wQNXgDAGE3WlR5pBIdtTdY
 vhkBJ0jX+zOEubddttGWNk5i5w11B1ymC44oIIbho7gsHiAtpzO6M+7ds
 XoLHW0qoDs5eBqB1cFbNywO4HMlluS2vu8b9eZexRGL3MFPq0VipboMBY g==;
X-CSE-ConnectionGUID: DkCQbwHtS6uhesXweJW5mg==
X-CSE-MsgGUID: WCQrtgANTfS4JqtA41dXPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66574413"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="66574413"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 10:57:25 -0800
X-CSE-ConnectionGUID: 9yLGlFR1RwaLIPkzdppHVQ==
X-CSE-MsgGUID: 17U7SwxASROFjUUSASflmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="194698858"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 10:57:24 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 10:57:23 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 10:57:23 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.49) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 10:57:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W2j8HALu4Tjn0JV+i8S9Wx1ZzLExz+MbMoFCNkfwgDASJSQN+Sgj3GSWIrQY46/ti2FXLx/0FmmkXkMfrZjRBpuD4nOagJ3ellhfYgYJvOVXfqVj/VRPv59b0I7fpK1/RnUPDV2uTUftQg777HaDBAjwrScUfq+kI6C2DqsrPwboVQ6O89pAXBFy5myIFyrCIxMn6BwRd2J/d5ZHJHCTFComN8653gaBVJKReDEYKBV7ouOznkjCYwuEgv5Oju2eZYUXAYoqDFXmqZuRQ4PsszPJ+rS7+WtEuGfnAL44xP7Rkwd0kdBH66upBdoTrgWJuAfnJptzP8/7kFs2aO4Mcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lz33R6VHJLo1MdgRSR04cjVJj/9JknriCxUnZ59TuYw=;
 b=wiNhh11/Q4TmKIB8b4AyrjbeHkFfoprFZSIlwR967woV+2EkBlpYU+Mn8PPusvag2qma1yPC+NzbEtqqALrpuuro9oIGHbcTDclEr6gorXOw0DmOhObG5HlHV7uS/pwHslM5G4QTCEExIqgHWwIjmxTNDsZdCCDZWFwmjAcTCg4u+7e4k1tyh3NMCyysycbZUb/wCPCpZH+xNWg/HfwtoIGEEGRMcTq/w81a00LAfnqoxmoyjajSUpjwIbygXbR8q4qltRgMB/0wWn2hPnjWz5lJa6Y7lnECispx7835r227rxzutrLxFolBfkNtP4D/kZ3uAauP1isjDFeOlTWzqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB6814.namprd11.prod.outlook.com (2603:10b6:a03:483::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 18:57:15 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9388.003; Tue, 2 Dec 2025
 18:57:15 +0000
Date: Tue, 2 Dec 2025 10:57:13 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Arvind Yadav <arvind.yadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <pallavi.mishra@intel.com>
Subject: Re: [RFC v2 7/9] drm/xe/vm: Prevent binding of purged buffer objects
Message-ID: <aS82icGw/SCOP+3j@lstrano-desk.jf.intel.com>
References: <20251201055309.854074-1-arvind.yadav@intel.com>
 <20251201055309.854074-8-arvind.yadav@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251201055309.854074-8-arvind.yadav@intel.com>
X-ClientProxiedBy: MW4PR03CA0136.namprd03.prod.outlook.com
 (2603:10b6:303:8c::21) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB6814:EE_
X-MS-Office365-Filtering-Correlation-Id: d4c60a92-507e-413b-8403-08de31d49c26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?F6Dh/a/SqY6JSykTKg8nOfo+oGP/Zs1/ookek+KFKl4Yzxw/VCH1fCMSYm?=
 =?iso-8859-1?Q?q6kWlV3U+MBEsE4P9x1eksf7PR776FIv3WoyxHgm5zibYMU/CfbxrcR6Fn?=
 =?iso-8859-1?Q?Xng1uEZ793abP3sMBqRCA7GNmZXKHTMy12pEo/I2FWPiq4X6ko+ZW6U+o7?=
 =?iso-8859-1?Q?6SbrliYM8KZb/HNkQfZ2BVyRfkw9nOzfvxdzLC7AYpf4D1bceh1YeP79jz?=
 =?iso-8859-1?Q?pmmc0t4jng4Lf7ZGzN7WlWSzAU+WAuA6ZVHDWbj8WNox/cySU5Z90AJJdl?=
 =?iso-8859-1?Q?Nyn/BK+9t3iCiDx878t+kJRMBhVi3JspMY1WaTwTOowezsE9JMqMOFeVtI?=
 =?iso-8859-1?Q?ORhIxm+qyDnnuKLiMOCUrS5aZ+P9ca4f3fBBil7hZaMouMdVqXFdoDJtVd?=
 =?iso-8859-1?Q?g+Fzmxq3MF1zMC7yZz5qGHxy+6OgSOZvC5TI0SdNGNkdhemkdL6Pv8Kp3t?=
 =?iso-8859-1?Q?ALeoov3C8lOPYGNO/eguyqv1fqOZN6cWVf+NE+9/GIAPXa4EPAuy6/YcRx?=
 =?iso-8859-1?Q?/Cr6fBkyFDL4Ckn3JwbJAivoEjNnLu+X5wVruBr6qLSEsLrLpEJYGydR9m?=
 =?iso-8859-1?Q?EoNZyfKIwK5N6KoX9f0YzDvw/MkjyMVs+RFvC8W2qljLEeoFPvUznSdh0w?=
 =?iso-8859-1?Q?ZlyySey/uN5JPDKwO6Sjz6Sx7Y9EXsQ8xbN108LMBI3Sw6OfT8YYRfJ1qa?=
 =?iso-8859-1?Q?YQu2lA08rFeuuubw6n8xCW8SnDBqaOhe9iOJD3c3LUE5yHFi7+hrOLNEfe?=
 =?iso-8859-1?Q?JMzsIWHu1Ldu4MtViIVKPlmnnk1TqRM0K/tOd7POMz+ZeLIObqDCLNR1ss?=
 =?iso-8859-1?Q?tqMLkHqmmf2D4J4DvXLS48hmbRkckGlu9YTwdYFPIqdiGfCh4sZz9bO+mU?=
 =?iso-8859-1?Q?6fDP31Z1kqctsKSjAfchK08D7ILzSuVAGuxzQmzC3ZDBI0nk/eG5HK937r?=
 =?iso-8859-1?Q?kwcTLxu33dXIHNfHCBGi3e50eRc+ve8V8Rk3Tl46hWiatOWeKf0Adozc+0?=
 =?iso-8859-1?Q?AxBxmRsw4C70OhjE5wqPLPZjUFZ5sDYnGN7ENKzFWuBTdYGfCZqvZAZUz9?=
 =?iso-8859-1?Q?MpoFEgkTPb78Wvt+Xb1ub+VKFyjSpXzw4yMW2Fn4Uq2CkDgl5ff+Z96wcI?=
 =?iso-8859-1?Q?URPADIWFQg7OIbcqGEaUvOyEWjN4S80gQZdin7UId7tHxijL8HKNt4kYlN?=
 =?iso-8859-1?Q?wjMoiKeti+xLqUjuqR67M/v6TBUK4U8I1B034vLl39DKDueoMaZHagx3z6?=
 =?iso-8859-1?Q?iOtzS8EYmDxY+QUuMTO45Y8BGLb62UG+Woi308QnV8EApi4FQ0brKjXOpB?=
 =?iso-8859-1?Q?F6nn7ua4WqZWLdCCv8Ud+5fbfgLbU+JiovL5QIcySF1HWIC7Rm1PMk2gOx?=
 =?iso-8859-1?Q?FJR6dVCExvVQrZYNPUeekKLbwzIKc7odrpu9P3sX1+aFdtokoHAbKQxP7x?=
 =?iso-8859-1?Q?/IpNKUNGwwXR2Ol2uosKgDmVs2UuHgbPYM7D0u0AayqBDFa0UJtccYQqRv?=
 =?iso-8859-1?Q?l/LIb6HYizYouRFstg8AZM?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Od1iHeZG0QEOSfjgYEy9y80ZY2GwAEb+Wt4p+oA/nVEHfLFImJxDWL++Ea?=
 =?iso-8859-1?Q?FM+N3VLrPN+4g7BhNN/yOmISHa54y8XQPNt7aGpm5JEDqFrAlZ1bHf7WPd?=
 =?iso-8859-1?Q?x66wKOt3bLkL5oZAg9EmjwaMbwmhID/PKBDqU/MaNNdpcX76FI+9jeRp6/?=
 =?iso-8859-1?Q?48v0Lcq5gkIiDwAeKeynxGcYLEX67xYVxukAsfoyjKfNSAq7tN+Qlq5SQh?=
 =?iso-8859-1?Q?lUD8Y/vc9866J6PMioAYBL8/GkmrEpd3/X18DaeaqlTTlb754hoDSaojSs?=
 =?iso-8859-1?Q?F6OPD+uGF6pbhO6RYkxvX0SpcNGHt4O4xLtD76iCsQpZoAnZ7V+vxIqXZA?=
 =?iso-8859-1?Q?+PLffTdRFRM87fCjCtcsgjt/EmhJoftEjqPyzq0djawVi0upvVJDv2kvxl?=
 =?iso-8859-1?Q?i162zH1bm2oq6b2DsPAeiSbasV/Lhi2CMbt0nMRxMVzFB6LwQNc7tSoBGL?=
 =?iso-8859-1?Q?rbEvN/i9HlO0P0+HJlvu9XJZCiP7Z9/xoQkM2WiGQgoQPe8jb5iv+WMvRR?=
 =?iso-8859-1?Q?4hGvizGzXmvg4EbWxT6XvvK/v/1Y/aPfwS53JSlGZoilV9sown+VbehcnE?=
 =?iso-8859-1?Q?3wg7Lr3tkB/MrzGs3WDj5v3eVTHEqaUbv1PW+wS5XnnvxmqbraZgo7DHel?=
 =?iso-8859-1?Q?J3v64IMdBb47Rlc1N0ACLIWd7laftLhAH/qckAEVUL++8FaPzY1R4ZRIpt?=
 =?iso-8859-1?Q?Ag3CywbSbG+VzG++OvgM7qh5LlXrt7n9Lkx7EZVL/IVRyPA70AaViFO4ZZ?=
 =?iso-8859-1?Q?Tap9CvbIphNt+ihG4lvU+xClNnIkyElwyco7LptWI+Lg6BPU6y5dFmbEEV?=
 =?iso-8859-1?Q?ZbZL5BT77F9tQ2UoajvZYwvU4fHuxqw6780twP26qejDelffFUm3aiMmqs?=
 =?iso-8859-1?Q?UYtiy1mOnHLbhbCd9CIwIwbAK1YDz6teSHTxTeFZiQdtbZVNDywi882dkt?=
 =?iso-8859-1?Q?1f63z0MOOKlyimphR0K9vOnxYSD28FGVLLOumt9fFKhrmFYXoX+Cf2Aecs?=
 =?iso-8859-1?Q?+JS8Y4dSfTYctSqScm79yey00fZPmeDrdKs5rTixtDkCibA5cYCewtxoqy?=
 =?iso-8859-1?Q?W/ZoLo6zkaBsHzhcYN4vPW2V87D3iFf5wuqOO/9AsRpOhkHIei1EMvcQkX?=
 =?iso-8859-1?Q?OtSp+7/1nx2FViQDKo8bzMO1bTokukBu7h4Llc/EetayUlu7j47tHPfGZd?=
 =?iso-8859-1?Q?r2NIxUDNEbJ2wW25QT/57CudYwbymac6L0m/zAIBH/IicwQmjI3HdsJcPh?=
 =?iso-8859-1?Q?grnEWUzrhWgobi3Z6WNdyOQZ1qU2OvGzss84xZIB8OAm9A+y3323XnZItp?=
 =?iso-8859-1?Q?JMdqcFZcFD2H8tW8Q+VdqQsvCXA4DRczEOKbK4mxZpK5AkvRrFmbz072N9?=
 =?iso-8859-1?Q?uoeCmnBSPPsNkB7TnKQzgH8trAqaNMiFDgj7wGAHlkrtknc1kFH4fsQ4s+?=
 =?iso-8859-1?Q?qNAw61BusrhJ3uE19ViIJiE4Xs9AGlWsZIOoKHhUYXh+LR71KgiPLfi4UK?=
 =?iso-8859-1?Q?Ty8Imz/c6YrkwW8NO8m43ynZaljW/WVjM4V72N6PAlRB/VczCzyrQuPObr?=
 =?iso-8859-1?Q?uSm0uLJk6yHVaEjwcOtle9OzDy4kWluzPkRP9d49XuCz5tA3D3fkGScoor?=
 =?iso-8859-1?Q?d/WPvh0gaeQPQCu7n1ai6hQkVXjZNEH+AQSxdY1DjMCT7TraXXgqqIkQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d4c60a92-507e-413b-8403-08de31d49c26
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 18:57:15.7057 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ohbHlxG4ujxKXPoKsw+JJDCJ3UOAyoT9eEsvInFwnYoe8vPtccrtPGwOVYlDeug75GkOBqnS+o7mimUT4iF6cw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6814
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

On Mon, Dec 01, 2025 at 11:20:17AM +0530, Arvind Yadav wrote:
> Add validation in xe_vm_bind_ioctl_validate_bo() to reject MAP and
> PREFETCH operations on purged buffer objects with -EINVAL.
> 
> Problem:
> When a BO is purged (XE_MADV_PURGEABLE_PURGED state), its backing pages
> have been freed by the kernel. Without this check, VM_BIND operations
> would proceed:
> 
>  1. DRM_XE_VM_BIND_OP_MAP: Attempts to create GPU mappings to freed memory
>     - xe_vma_ops_alloc() creates VMA pointing to invalid BO
>     - Page tables populated with stale/invalid addresses
>     - GPU access leads to undefined behavior or hangs
> 
>  2. DRM_XE_VM_BIND_OP_PREFETCH: Attempts to migrate non-existent pages
>     - Triggers BO validation in TTM
>     - ttm_bo_validate() fails or crashes (no backing store)
>     - Wasted work for permanently invalid BO
> 
> With this check:
>   - MAP/PREFETCH immediately fail with -EINVAL at ioctl boundary
>   - Clear error message at syscall (better UX than deferred GPU hang)
>   - Prevents creation of invalid GPU page table entries
> 
> v2:
>   - Clarify that purged BOs are permanently invalid (i915 semantics)
>   - Remove incorrect claim about madvise(WILLNEED) restoring purged BOs
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index d03e69524369..cc946bff9607 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3482,6 +3482,13 @@ static int xe_vm_bind_ioctl_validate_bo(struct xe_device *xe, struct xe_bo *bo,
>  		return -EINVAL;
>  	}
>  
> +	/* Purged BOs are permanently invalid; reject new MAP/PREFETCH. */
> +	if (XE_IOCTL_DBG(xe,
> +			 xe_bo_is_purged(bo) &&
> +			 (op == DRM_XE_VM_BIND_OP_MAP ||
> +			  op == DRM_XE_VM_BIND_OP_PREFETCH)))
> +		return -EINVAL;

I'd move this check to later in the bind pipeline once we have BO's
dma-resv lock to make this race free. I think vma_lock_and_validate is
likely the correct function after drm_exec_lock_obj but before
xe_bo_validate. Or you could just make xe_bo_validate fail if the object
is purged.

Matt 

> +
>  	/*
>  	 * Some platforms require 64k VM_BIND alignment,
>  	 * specifically those with XE_VRAM_FLAGS_NEED64K.
> -- 
> 2.43.0
> 
