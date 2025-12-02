Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 778ABD12669
	for <intel-xe@archiver.kernel.org>; Tue,  2 Dec 2025 18:54:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3782A10E679;
	Tue,  2 Dec 2025 18:54:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VGkJcQBi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29D0510E679
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Dec 2025 18:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764701678; x=1796237678;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=QkR1xLjr6P72QwCCMZG4Q3MENNvKUQAB8x5Vlir4qO0=;
 b=VGkJcQBiE/zeJfzIH2URR8F/3o1b6ZnVCsctnNNIBZyJoDcY/6tuwFFO
 wKsxKPWsW6TXNL8igGhwyy/bktkue3EYZU1DKebRM+rJfocRSEUNivSMr
 flrC0qkgstEgxdz9gY3G8dPQbftXtOImpNrpU2kB24rS8b3S1FQMemFl1
 RFIFjruRej7KGX5LvVUJmFy+CvAu/Aj6QoNACQPJv7rymJOCuMEFNVJPD
 sY33tjPqjHNrF3/MiL+T3zhePjCOi0LIqwcqvTehsHe68HISB9JzJ254b
 Ouc/rn+tqbq74MI2CNuYoZ6IYdq99FLDPiWvjvH/SMxB0Okau4WwLP3xa g==;
X-CSE-ConnectionGUID: N8fOmoP0SBG2tIqEzlw2qA==
X-CSE-MsgGUID: d4dcz5ZPSgOWOeKGM5LxJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="65686485"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="65686485"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 10:54:38 -0800
X-CSE-ConnectionGUID: +ThNNOecS2yRHMukNFZWVQ==
X-CSE-MsgGUID: /gCAh6bYShKftIsMIATGvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="193752209"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 10:54:38 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 10:54:37 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 10:54:37 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.25) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 10:54:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jL0AiJRfdsKbHamyRJYvk5rgvtQzN11jdm+1Vu4SgT6Y/lAxtIuWi8iOVP+OOp8EmeWb8Rfr6C/oxXg+vbTfOHe4X4N4mFvW5Yb/XWWRcdl+UQYZKq90eRPmNgtESc6Fq6pMEVQNEj5qRece8yRZYuqegFshoVcZAI0NjNQwC5l/yDmGiNRdcvCQrZv+PkVateNxI3Rn7duigga0MUCrVaANAmjWK5MW4Sqze1fpiJ9OtkFgB+HrWkF8TGjguDVMxeUgXx5xAhkf9N12xIONTAPg+JqsYHgy/d0Pv2O6lRYog2ctcrIG2Cq9+7QnWBrYTJmEIOaYayQ3c4ArdiFWVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6SDKi9MLq21+ciHZCkOebjOlPlk7qJF47XTJJGBwgq4=;
 b=QwkzelD0KSe0MA56bJKe5ZYnsrI7eshMpfX8yK067OdDVnnNRpL8zhnPAoTA7d3QeQ3LBePFN8i+5v3oyaXNot1YUquBbpj7DgcGHq/ETCgUf78AyIlGrGzMOuELYcbrOwk0lCx1HagjOkdrQ/3oAQb7n1DbMx3QLC51ET3mFi2wrLQbIgLo/edrNnnUZmrDxqWWHPsbLsU+4L+i3r0RRiy6IUQINq9NYH4RtfewnNFuQflUiK8PBS8O+0YDjNTUvMC5q+Hu7NjiGAMBIGv3D3ovsmuqDiEE03baBK1kaFvobQ+ieJTCDeXZKlu+ms79ZRXAB67vJHi2V0zefVWENQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA0PR11MB4733.namprd11.prod.outlook.com (2603:10b6:806:9a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 18:54:35 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9388.003; Tue, 2 Dec 2025
 18:54:35 +0000
Date: Tue, 2 Dec 2025 10:54:32 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Arvind Yadav <arvind.yadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <pallavi.mishra@intel.com>
Subject: Re: [RFC v2 6/9] drm/xe/bo: Prevent mmap of purged buffer objects
Message-ID: <aS816PhP1pXYe0kc@lstrano-desk.jf.intel.com>
References: <20251201055309.854074-1-arvind.yadav@intel.com>
 <20251201055309.854074-7-arvind.yadav@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251201055309.854074-7-arvind.yadav@intel.com>
X-ClientProxiedBy: MW4PR04CA0288.namprd04.prod.outlook.com
 (2603:10b6:303:89::23) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA0PR11MB4733:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c57a42d-ccff-4970-e473-08de31d43c90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?gMXrnXkNuBG0zNPKrsP7NbN7LdCefNxjiF/Z6yo897/kqiKSPg1FhsS4v0?=
 =?iso-8859-1?Q?C93ykcIVcVle9gcehChupnXUaGsxfyggT8DKKYStShvQXL/H2J6HufMx2B?=
 =?iso-8859-1?Q?B+fjgMnJlEmjGXLGuq9Xauw3zoYvBVfqENemuXLLEC7vwxgyBshR17Xchw?=
 =?iso-8859-1?Q?Tn2YxaubTUXiXg7MYXODLeKfX0Ha7BQSktdt0irQAAml6J2XbcwX39VCH2?=
 =?iso-8859-1?Q?4IkazSvd+c63qrPapa7qVJI/SVgFLdBs02i6dBp8CvuLS643GgrmZ5D9m4?=
 =?iso-8859-1?Q?PLoMniMbmorQbwxBaeyXm7XYCzOCigzSKBbQ3QhZoAtRXNeMZXdODZ3HjL?=
 =?iso-8859-1?Q?7sjTGS7ux0hB7nrq4AxF/rDfmBtYoNwKdqKVNDfSv9b5yPL4q9rhWNUvvY?=
 =?iso-8859-1?Q?K2JsQuojOp76RKdgjNA/Ng3SDL3uBiU6HyVvdmuPVsoaU0DCTNGZ00WdMQ?=
 =?iso-8859-1?Q?8ysKUh0jKGONTCSr7DPNgzmKwYt54wXFHvZMuEYXOtnSl+Lqry261abXwK?=
 =?iso-8859-1?Q?pBVKCjKfMftFpj1w1eDI2iywxkEk4L4OcX75klZ0/ULzE5KllfavLsq67c?=
 =?iso-8859-1?Q?mCN87KbeDk1CiWbeuzlnpGOcFapWRDWkp5N7+o1CBROiNS/miJpZ/6Johd?=
 =?iso-8859-1?Q?h2SFF/qQTVSmL/GQAxIWo77/qKebTJL8t/xwGnkJQKlrCsw/nW23D/g+8B?=
 =?iso-8859-1?Q?GlSlN9SubksroPu521r9H7dPgY2P5xV5GgTAyTTDq1xjauThqxFlNQJxVi?=
 =?iso-8859-1?Q?SN3ZVtt3uN8ON+5C+qYa7bKXww1x4P1PrznodS7bhsfIJOHj+P4YqxbqA7?=
 =?iso-8859-1?Q?7CT3y/3MsNch4c8dcnasPxKDdPg7l+IHtNfFw3D+h4qF439hsHWfkjRUC/?=
 =?iso-8859-1?Q?s0qlQJExzPj+K2RwfYvZVPW12U6TzC9x3BRp8Y94Ew6pZidrsghipbLY2U?=
 =?iso-8859-1?Q?/r8R75/dZCYJappU9mB+gMkjsihInst3zxLvaPe3XyXzvaa0tOQwMl0YE4?=
 =?iso-8859-1?Q?y6P7xhWbtMPXQHcRYc4D8IIxMULZ6eQlxkmDOxUMaZt61nxKipdiAYAxgF?=
 =?iso-8859-1?Q?Th2nDcog3s4NXV6O0N2YgJGmc5LOB//ku6MJcd/9gn6A/2Zfo3WKFhTHbF?=
 =?iso-8859-1?Q?NemnF/btg+lljgAeOw7JE7SFcQyepnJhX37XsZB5JGYTFhLj1VN+omp5Rr?=
 =?iso-8859-1?Q?RA9jE891SWprAUa0pzTJeyH66dU+iWbAxAyPJ8oO0z79M97Jzw5OtrlDUf?=
 =?iso-8859-1?Q?09yRfMyxIZBnMnoz0JmGtM8otUUPVcwZCFPNsJLhhDnoytLgZ9qQdsa6NN?=
 =?iso-8859-1?Q?i5WTmU+i365/cvMw7NrydtGyEmZIu7XGw0Ogo1q6iXDXaQVJDCCItYdnT+?=
 =?iso-8859-1?Q?ByU8lSD1RngLfduWsEqHCdQioclH08SN3fJB2Eg68XNDBdlkGH5g1pSbPJ?=
 =?iso-8859-1?Q?sXGu5xuMHxrldTIW4bo4BSqFNtqv6q7F0xAikvoOetpUAh7YZXpBTAAgs4?=
 =?iso-8859-1?Q?6WTBlLFFiUNipw3hF+cjZ6?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?hxRYrl0LSvvohGe96c7yqarOXQlerjBsAv8AYm71ZYLOZYagS6oc9XVach?=
 =?iso-8859-1?Q?phOe7YAEwj+0hyOeeY7qT6LFWeaT3YtTGlYJCVkFUJIjQD6IEy39O3hve7?=
 =?iso-8859-1?Q?vdI4KEE/ErA6nNFP4FFbS0azwix7bCE009b7UTgZwt+san9n3TKYE7e66A?=
 =?iso-8859-1?Q?urbpH0O+3irPFxRPZSVgStcm0ztaW1Onp5MYpJIGuKTqiW8bybQjcKrEnk?=
 =?iso-8859-1?Q?wqoeQpRrkhqWiXsS5jir6BEqKfwUj5vqAMd0cyVD11Lc0c6yVe+wurTq19?=
 =?iso-8859-1?Q?3voaADf0Ab3b+VOTzS8ZtVSV3qNlLE4+Yv8qaLR6fa9MBvNiDFg9PDgYNJ?=
 =?iso-8859-1?Q?HDRunC2x1p4bELTP+1axxWHIPMXAFEgHw5XYo0fZ2jG3ovXPv2vVok6OsH?=
 =?iso-8859-1?Q?yMsUFTX9+/HbYX2O0L1SDdSqyYdhH8VbI6nZQLWHWChY2dRyTrkM9u45SH?=
 =?iso-8859-1?Q?y1KfWHruJKZ+D+KqMK+qv44NWCl3MWp/KCt/gFdm/N+z731a/ijpUKyQdf?=
 =?iso-8859-1?Q?4vmo11W/+STre1fe3rTJcOCcIk4CLxvvWF5RgJT81ruOxoYc8nOVbMs+Ol?=
 =?iso-8859-1?Q?CNGqlf8b5Ql3lnmXzyZXQSkHB2qsiqBgwraVqKobcy1SpL29F/nhO+rWbD?=
 =?iso-8859-1?Q?pEedjNIEOawSNk2wZHsP/U7mm4XGUa3c82lgFhT01CLKQX4bAFZo6ADbMe?=
 =?iso-8859-1?Q?lGsezs6/oHzpitxQZsWj0NXZ/LCmxOpq4Jvt0LJEigUGJ1cfOvDOfDP1Pf?=
 =?iso-8859-1?Q?SaoG99p2FsQtz6Xv9R9Xwy8uEAgBzt1OylkWl2bPoA/7h/IFN6iGyzAzqZ?=
 =?iso-8859-1?Q?s6hvT1F9dFI8lpOGtbch+PSdaG+CPZwus3H+MyT1utKjL8mPWKY/g0WG5J?=
 =?iso-8859-1?Q?mkyJTb8kBvoGj5unKxOvES9zZtMc5p29lHGGK0LVSyOQxeoyufH0BCT4RN?=
 =?iso-8859-1?Q?lGNjOzl4haXlYIV8Qj7UTy6mJJZD1t55iW6Bh+HUUIkncHPR9w6+e41Kpn?=
 =?iso-8859-1?Q?4H8weDerxrBaMpun6xAi/2eZy8bZiHj0hYEE2FdFPqWWZMPt3I52TFU2vF?=
 =?iso-8859-1?Q?94VyH+yh7SoMhKaC/GmnvzsL0o3exaOeXurup8YRA7ePaUzkAtgf0nf/0V?=
 =?iso-8859-1?Q?YT40xc7SGnwvni7sD+PYL6ccWP7727rWNdBsFWiX7mq3BsjOKN5qAt3L1X?=
 =?iso-8859-1?Q?j4yeCaxWl95tgCnZjBPEqR+fvvjVfI6X683NAqQ9wCxIOSeVu+KB3GcR62?=
 =?iso-8859-1?Q?ywxYv3Ch4fsycGx41+y9SD/bp6Gio0qcnikOH6Lz3g3n6w8U2DpQE88TDi?=
 =?iso-8859-1?Q?esGHkiwDnwZ00I+83VmuG2ul/tsinWBJlljTuAg03Nh4NcmHzHlkP3wXxV?=
 =?iso-8859-1?Q?BgYpFdy3N5Txha1ti3ZjkEe5wrR27c/QkUCUy6wvf9HQzy1xuqQXeJNQBG?=
 =?iso-8859-1?Q?sk3187HjLPdnYXIz5MZt1o7ircWWLTGr1ufNwEDvMWYqrLVvExyzeE2iqM?=
 =?iso-8859-1?Q?2yeyNW9VzzyG6Hz98fOv1hwIN6+CWZq8sxZzLOUHZb/wbhFgLFzRzaBxiI?=
 =?iso-8859-1?Q?hGkhFfu9Agy18X9ZiJjxaOibnTz6TGOclS1YAPUVY++kq5gbWE9XJh8jqc?=
 =?iso-8859-1?Q?l1pCTX8bp9NbIJAUQ1V9dexTZ9QoALDGTLYjIU82clR/RTt6IfDJubJQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c57a42d-ccff-4970-e473-08de31d43c90
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 18:54:35.3349 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vTZJSMYJdFkxDn8XkOSDUA0WS+5jOyU9b/JD16EUmhcZHS6sC3857Az3j0xC+icp6lVql5ZFaWGTE+vE6EKJTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4733
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

On Mon, Dec 01, 2025 at 11:20:16AM +0530, Arvind Yadav wrote:
> Fail DRM_IOCTL_XE_GEM_MMAP_OFFSET with -EINVAL when called on purged
> buffer objects to provide early error detection instead of allowing
> deferred SIGBUS on memory access.
> 
> Problem:
>   The mmap offset ioctl (DRM_IOCTL_XE_GEM_MMAP_OFFSET) returns a file
>   offset that userspace can pass to mmap() to map GPU memory into its
>   address space. For purged BOs, the backing store has been freed, but
>   the VMA node offset remains valid. Without this check:
> 
>   1. Userspace successfully gets mmap offset for purged BO
>   2. mmap() succeeds (VMA is created but has no backing pages)
>   3. Any memory access triggers CPU page fault
>   4. xe_bo_cpu_fault() detects purged state and returns VM_FAULT_SIGBUS
> 
> v2:
>   - Fix reference counting: use drm_gem_object_put() instead of xe_bo_put()
>     to properly balance drm_gem_object_lookup() (review feedback).
>   - Added xe_bo_is_purged(bo) instead of atomic_read.
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 7f5bcf114ed4..dbbfb58ac657 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -3346,6 +3346,7 @@ int xe_gem_mmap_offset_ioctl(struct drm_device *dev, void *data,
>  	struct xe_device *xe = to_xe_device(dev);
>  	struct drm_xe_gem_mmap_offset *args = data;
>  	struct drm_gem_object *gem_obj;
> +	struct xe_bo *bo;
>  
>  	if (XE_IOCTL_DBG(xe, args->extensions) ||
>  	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
> @@ -3375,6 +3376,16 @@ int xe_gem_mmap_offset_ioctl(struct drm_device *dev, void *data,
>  	if (XE_IOCTL_DBG(xe, !gem_obj))
>  		return -ENOENT;
>  
> +	bo = gem_to_xe_bo(gem_obj);
> +
> +	/*
> +	 * Reject mmap offset requests for purged BOs.
> +	 */
> +	if (xe_bo_is_purged(bo)) {

I don't think this is needed. A subsequent CPU page fault would just
fail with SIGBUS. As discussed in patch 2/5 we'd have the BO's dma-resv
lock there too making this check race free.

Matt

> +		drm_gem_object_put(gem_obj);
> +		return -EINVAL;
> +	}
> +
>  	/* The mmap offset was set up at BO allocation time. */
>  	args->offset = drm_vma_node_offset_addr(&gem_obj->vma_node);
>  
> -- 
> 2.43.0
> 
