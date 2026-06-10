Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7244CD8CB2
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jun 2026 15:37:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96C4110EA99;
	Wed, 10 Jun 2026 15:37:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ygmh79ln";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BCFD10EA99
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jun 2026 15:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781105879; x=1812641879;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=qwhOHqEt7h9wl5h01rTIt/eIvjk7bfuK48yW2x0AHs8=;
 b=Ygmh79lnzmMamCbvtgIDTOWQhkrG2w91coQ3dJFHvQXQbIYntrKdQNn4
 UsgsGbDKVzzVqNno+z0LotHuZJKa4yEy/bF+fODlWVHWLltdm+spvm7Nc
 eRfqFufOOiY2GSI8QFcywmRpdTOSi5zIEC4iXzYK0bWb1hr4/v2nnPVKI
 jeqFySosnFMQRSBsIBY/PJ8ggHwQ3mC7W+/k2hHf07HjyXZEDy/Qu0DDi
 UyiopTj1FW6Q2wp7ssDRgGLyUHeliXVree2Jfq6zWuRvV7M3qgo1bWVW/
 IwCyY7LiCZnhNmaDa8MhyHlTADAyai1lp2/2PBgnPuD3jwAz1We1GMH5q A==;
X-CSE-ConnectionGUID: n3F5UlfFSYGGqA8wq90DQQ==
X-CSE-MsgGUID: ybZw8HQMS+ep9Y/UQ/Awwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="92577068"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="92577068"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 08:37:58 -0700
X-CSE-ConnectionGUID: /moW6AjuSwWCbvetJXOlBw==
X-CSE-MsgGUID: uPodHYydQR+u9CekWf+GUg==
X-ExtLoop1: 1
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 08:37:58 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 10 Jun 2026 08:37:57 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 10 Jun 2026 08:37:57 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.17) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 10 Jun 2026 08:37:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jdNXCuxIfSnKrvLWij/tOYZrH7uFDNAvcs+0CScGE9bPdoIY47iOKyDpZLI0+97ZzdwydP/YpeOT63XaRUONmBJJtEN7laHrdAUQpnUoM5LMTkujBFMBWxZxxgPRgSIq8sa4UXyhWZjMYuEh4ASn8duVd7YM53qwH7YXIXc+ttisklMRLDlhE4e2bh40R8SrO1FKr0WRRT4tbVICJ/mneOzBxVXEvdaZImsOxtVrlwbiSk74R2uv3X9+qeFvRkgLEpdaT6yscI4Eg9TnmP338Q+LgWrscF7a20Cc1V2qIvXwQp1/iHc8lbVlt13uvK3YFh+SHlJMOIj9mYNL7Sr3pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rcNQNiuX5GxHA3JcUYu9zBn42ASRI8PFNHTKr7ycyyM=;
 b=FuAVI53LApWXx+Dn1n+nIerImIQ+IRNIMCq9aUyApC4TPqZvAy6KJw0FVnIefbyzRn+7/lOocfeWicQhoMFWYKNCUNIdaYbyNCX3sK9TNnyfroUTNdHgIMwBvxVLGcsDf5Xl53rZ9KR/hBQ/m8GNoxq4cr6Q+Glw9lU0644uldqZEqeBOIlugLScFRWJ4OzKguZclgeJzx2IqhZ4kxW1JIpp7DyZX+81HGZMSXF8SDv0ymwfl6lKK7Kw6MZkfNv8WdwVfP+oAUlxNOpGUMe9NsnhHzCi/P373SNUDU2zFeVxT0cZV3vgGczh3dai5r7G/RIqrJl1ovf664z1G1vThQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB7726.namprd11.prod.outlook.com (2603:10b6:208:3f4::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Wed, 10 Jun
 2026 15:37:47 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0092.011; Wed, 10 Jun 2026
 15:37:43 +0000
Date: Wed, 10 Jun 2026 08:37:41 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [RFC PATCH 1/2] drm/gpusvm: Add a DMA-mapping accounting callback
Message-ID: <aimExeYtw8KZBsUq@gsse-cloud1.jf.intel.com>
References: <20260610133451.8930-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260610133451.8930-1-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SJ0PR13CA0031.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::6) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB7726:EE_
X-MS-Office365-Filtering-Correlation-Id: a23284f1-d1eb-42d9-1874-08dec70636d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|18002099003|22082099003|6133799003|5023799004|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: Cy9jOmX/kGk/iRdtWK1PUzQbSpTk0uNFUzrwUJUQBENATmHllJyO8FWdMX3nH/+L1WSe6QwiKzqM8CoE0xGe+cSFzwQGlKEQADOjFMCTLAXmD7ch23PbYPzPbVXp5jFk0Ry67swVnpu5n0voqP1FZ5DjyDqEBnkNu+RwYcLVt/igZtqDFDZpkg5kqxBLySI/zPKJ6bNWIrh9c8m6ofpf3KE0lkUKtL7M6PeDMOL7zxZts2+zA3YlBZ2qS5sefxumJZp1v+3+d1f4C+pKUgjHbah97F2wXS1x8jGxc1z49/Z5xLhsYATH7+1PMLCEh9ruQC9rngWU72tXs4brwoLUxUz0ps22/nKbrzYaN0dcQzkKyGSAnyNM2nxFsmm7GdpDMYc7dB1DTpyPXT6VOdkQcPMGRwCr/b1Spq+cHt+HfifPc+yrP3myLbzQDlg0LzRIcLSrEUvog5SHBshig2LWazULo+6FUF+KRq64GiW0mkIT1i9VZZiHfS5ZcwoyJhvjLlyJ3enxI8iFAlLspAkjIGf4vmGTUpoattS9US25gY61G0LpsZxnjSghwwqGJ/eC9NMuyRd5QSZDcqcGYUWt97CdquYVBZ1H+9IHp2XNjAq8QB67S3D168uH9SD4F8ERLNxLLNSCPfgv7+tgrQD1gmJhKL3XMo6FSax5+FRZTa8F07ex4GU2vCseJU/1a+cr
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(18002099003)(22082099003)(6133799003)(5023799004)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?clBpaDd5elNaRGJtRG5mcUJPWC9GL0ZRZ2JVNm12NDM1ZDE0QWJSMHJ3dlFR?=
 =?utf-8?B?OWdibVg5Rk10QVNvQjNaRGJ2TlNQR0RYaHhXZXppbFd2SG4vTTNjS1p2TDFI?=
 =?utf-8?B?ZW1YUThSN25VVEduZHd5aWZIMDNvdnBoa09sS2UrZ0RVQ0drQS9zam5DMFpU?=
 =?utf-8?B?VFNENTZnMXZnWitBZ0JzL3pTRXhpNXJWc3RPNnVpczBEZzRLaWNJeUZCSmx1?=
 =?utf-8?B?a1IyRCtqNmhMaEVBbXhxRTZNOURuY0JTYUZkZmsrdDRNMVhJQjVwZktqaVd4?=
 =?utf-8?B?S3ZuZjhLN011Z2E5WUE5ejcrUzBVOStHU3h6eiszTGlOZFBjT0Z4dXdBNzRl?=
 =?utf-8?B?ZUM1Q1FMeXk1RDFBVFhlNWNmQXMrYWNzS21RY1FWQWlKcWErTnFXeEZBOWwy?=
 =?utf-8?B?a2hub3dxYytoTGJ1Y09qNlBKTWVWcURFeURRcHRVRVd1R2RjdTdIOXVTVXdC?=
 =?utf-8?B?STNqZmoxcE1oQmgyTmNOVTNBOGxsZWE5bFFWc1dNZXpHYlVER0JyeGlSN2po?=
 =?utf-8?B?VTVpRUVOTUVYb29iaFBvNFkrT045NDZLOU9mM2FBM2h6UDJ2dHBqak1GRnJZ?=
 =?utf-8?B?bE5jMzk4djk0SG5WZXBJZDQ2dFkraXkvM0xrbGRvRURISHdFMTZxdmZFVmtM?=
 =?utf-8?B?VE9wd2c1bTNHdk1GSTQzZUh4bEs0d2RCZjBKV1B3WnkzdVVrWkJtVGxTNkNx?=
 =?utf-8?B?ZFl1WGFsY0hiR25oNVNaenZqUlRJZWtIMDA4SkxuaDcyTVNYc0UwVWJBZ21U?=
 =?utf-8?B?cjRJWnQ4ZmhRa2JsR1dSUUJ3OW55YUIzNXU2YnhSVDg5eFpTbC9OaFpSeU5i?=
 =?utf-8?B?ODF6clBHVGtZekphRGV6U29WZWVyR1duS2FXUCswMzFjYzY2eWlHdkdZRFM5?=
 =?utf-8?B?a3BIUjdDWG04amxDdDYwSjdHc0pQNm9Bd0ZYSXlmdDBOUmRTNEx5eWw4b2px?=
 =?utf-8?B?WUFGTFZGUkxMenV0ZXByM0RGc0U1RmNuaTY1UDJTbmtRZ3pUQ2N1T3hEeE0v?=
 =?utf-8?B?WC90T1hBQXV4bW5lS2wyN04rRXdBUE1CQjZEK0p2QUx2VUJKYVlZUkt2VmVE?=
 =?utf-8?B?YkNCWmJ0Y2dWM0JMdENIYlIzYXVLQ3hDUmk3Ny9lSTlpVk42c24wZHdrRXlo?=
 =?utf-8?B?dDQ5Zk9aL3VqREFOcDVHK0M2b2ZZQkM0RW0ycjNJWXA1WFVwVU9hb0RUUWpx?=
 =?utf-8?B?MDNpaE1BV1o5Wis1QkhZZ2RRVlMyd3VoazdRNlMzQVlmckQwOEh4YVhuWHdY?=
 =?utf-8?B?TG5NR1RBUVZWcks4eS9Kb1hjNm81VXRTTkR4czJYS21NTTY5RmE0eUk0RTE3?=
 =?utf-8?B?czhCSnc2dUxPVWVkejIyUnhyT09xVkJxYUZ1ZDRxMFB1YWp4VTBHbDgwR1NK?=
 =?utf-8?B?c0ZHNE5SV0JCbGwzanhMNEt5UUZHVm42NVZWSWMxdDZ3WEhXc3prOEFPMEhs?=
 =?utf-8?B?NGQzL2x6SmhQSDllYkpHYmp5RE5XMHNkSUFWUGQ5QzdhWGUzNCtaMDhTaVZF?=
 =?utf-8?B?WXpHV0RDalpucmp6MXloUVRseVNhU25qcFgxczAwVlIyYyszN3dYYUlNd08y?=
 =?utf-8?B?TmhUZmZlSTQ3Umord05SZlA0anFXbTc5bm4rL0ZKN3N0bFJ1d3gzRElDbEJB?=
 =?utf-8?B?WHpVMWZ4bGJiZS9OVTFxMGY3LzRmbHd1dE9GZ2RjcStwRWNpWmxiMUdPN0Iw?=
 =?utf-8?B?SHdseC96dGlvQzJBeitxNVZFc0JsM0ZUVzgrRnRINWRjcVJVM0hNajd6cFZm?=
 =?utf-8?B?UEVNRUQrWDJvQS95Ty9QWjVKSjlvSmFBR3hBZ1ZPQVU0R2U5bzA3R2syclNn?=
 =?utf-8?B?MEZvLzFmNzQ3bmtsOFpVVmVhL0kyU0p6RjNZMmFES2ZZWGY3c3g3NmRFMmE4?=
 =?utf-8?B?OTNzc3VPcEtlS0sza25Wa3pXWmN3MXFZNWYxRUtZTGJ4NnNlbzRtTThhbGx4?=
 =?utf-8?B?V2ZtYUZUUVlrV0pTVE9sVHJFT3pZQlcxYk5FbU8zMmtuZm5aak5obnJnMFRI?=
 =?utf-8?B?TXhlMFM0bEZhUmhOL0kzRU56MUpqK1BEYng2czdSMmZJMmJoMEZyT3FCS2hx?=
 =?utf-8?B?cWIwRDcwR2g1VzErdUZMcnNpckJBcHdPa1BVakNQZFBXRWdvN20zWDJZbkVp?=
 =?utf-8?B?T2pDQndLQk5qYnE2MXhzMkZ4OFZXeVVsZlA2bnZpNzZhS2QzVXB6NHNHZ1ht?=
 =?utf-8?B?c2RkK3djOWJOMVhXUnFIbHM5RDA3RWYyZ2FLcVl5Y2NQanlTM2Qwd1ByU0FR?=
 =?utf-8?B?anQ2WlA5eFhHSTBDZ3ZrZ3k3aDlvYjZPT1BMQlJZLzZpTVhxQkI3alliWWxM?=
 =?utf-8?B?bTdobktUbzlLZTVxbDExYTM1YW1MSzlDTWw0WWtQa1BmWE5Td1Ezdz09?=
X-Exchange-RoutingPolicyChecked: TF0pYAiigCckWGFgOp7jCr8WBkLBgtVMrk4G19UyqhlrDyL1l4Ge7etibyisQSpWU0M6OYew7HpPqLLJa8W9XfZdWFX0AQ/CpGlyTato29pIgkSl3ke3nRlGPUqFFhU02gAqdXEMRz21u5VgcpZS9XU4PzrD0MgmywVmKr5xtxnsHw6UA+QkY7VWt8o1FBvxX0uqJ/waUOxX4Q6cUyqs6pfp6i3o9PnQj9VIcSxGFFaih1Ejwdpn+kHxXv8FocqCDywTZRnhvXVq1O8a6BD7XCV2tbsuBrPld8rXxDSAhY9c4vjK3oljCAr8grwHLmpZwVLZkIVPDiLp0BZnUaAqcg==
X-MS-Exchange-CrossTenant-Network-Message-Id: a23284f1-d1eb-42d9-1874-08dec70636d5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 15:37:43.8155 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0QiEhk+tVmulIDqTRen6tv8GnWMTthBbVzUNV/v9YaLDi7JsA8MuqqjXzlTwJ7e/otCiMTBAr/d0JUV9RSyoSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7726
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

On Wed, Jun 10, 2026 at 03:34:50PM +0200, Thomas Hellström wrote:
> Drivers that use the GPU SVM core to DMA-map system memory for GPU
> access may want to keep track of how many pages they have mapped, for
> example to expose statistics or to detect leaks. Doing this accounting
> in the driver around drm_gpusvm_get_pages() / drm_gpusvm_unmap_pages()
> is error prone: the number, order and kind of the dma_addr[] entries can
> change between map and unmap (migration, partial unmaps, the iova vs
> non-iova paths), which makes symmetric accounting hard to get right.
> 
> Add an optional @dma_map_account callback to struct drm_gpusvm_ops and
> invoke it once per &drm_pagemap_addr entry at the exact points where the
> entry is DMA-mapped (sign == +1) in drm_gpusvm_get_pages() and unmapped
> (sign == -1) in __drm_gpusvm_unmap_pages(). Since the map error path and
> every unmap/free path funnel through __drm_gpusvm_unmap_pages() for the
> entries that were actually mapped, the accounting is symmetric by
> construction. The callback receives the full &drm_pagemap_addr so the
> driver can use the order and the proto field to distinguish system
> memory mappings from device interconnect mappings.
> 
> The callback must also be usable by the core drm_gpusvm_pages-only API
> (mm == NULL), as used e.g. for userptr-style mappings. Relax
> drm_gpusvm_init() to allow such users to pass a restricted @ops that
> only implements the page-level hooks; the full-SVM hooks (@invalidate)
> and the chunk configuration must still be unset in that mode.
> 
> Assisted-by: GitHub_Copilot:claude-opus-4.8
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/drm_gpusvm.c | 17 +++++++++++++++--

I believe this makes sense and is useful for debugging/profiling — the
same applies to the next patch.

I do have a question, though: drm_pagemap also performs DMA mapping for
migrations. Should we include those in the accounting as well, or was
there a reason this was intentionally omitted?

Matt

>  include/drm/drm_gpusvm.h     | 19 +++++++++++++++++++
>  2 files changed, 34 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
> index 958cb605aedd..c18f15c77e94 100644
> --- a/drivers/gpu/drm/drm_gpusvm.c
> +++ b/drivers/gpu/drm/drm_gpusvm.c
> @@ -393,8 +393,15 @@ int drm_gpusvm_init(struct drm_gpusvm *gpusvm,
>  			return -EINVAL;
>  		mmgrab(mm);
>  	} else {
> -		/* No full SVM mode, only core drm_gpusvm_pages API. */
> -		if (ops || num_chunks || mm_range || notifier_size)
> +		/*
> +		 * No full SVM mode, only core drm_gpusvm_pages API. A
> +		 * restricted @ops that only implements the page-level hooks
> +		 * (e.g. @dma_map_account) is allowed; the full-SVM hooks must
> +		 * not be set.
> +		 */
> +		if (num_chunks || mm_range || notifier_size)
> +			return -EINVAL;
> +		if (ops && ops->invalidate)
>  			return -EINVAL;
>  	}
>  
> @@ -1162,6 +1169,8 @@ static void __drm_gpusvm_unmap_pages(struct drm_gpusvm *gpusvm,
>  			else if (dpagemap && dpagemap->ops->device_unmap)
>  				dpagemap->ops->device_unmap(dpagemap,
>  							    dev, addr);
> +			if (gpusvm->ops && gpusvm->ops->dma_map_account)
> +				gpusvm->ops->dma_map_account(gpusvm, addr, -1);
>  			i += 1 << addr->order;
>  		}
>  
> @@ -1584,6 +1593,10 @@ int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
>  				(addr, DRM_INTERCONNECT_SYSTEM, order,
>  				 dma_dir);
>  		}
> +		if (gpusvm->ops && gpusvm->ops->dma_map_account)
> +			gpusvm->ops->dma_map_account(gpusvm,
> +						     &svm_pages->dma_addr[j],
> +						     1);
>  		i += 1 << order;
>  		num_dma_mapped = i;
>  		flags.has_dma_mapping = true;
> diff --git a/include/drm/drm_gpusvm.h b/include/drm/drm_gpusvm.h
> index 8a4d7134a9a7..87ad2dcaa7c4 100644
> --- a/include/drm/drm_gpusvm.h
> +++ b/include/drm/drm_gpusvm.h
> @@ -75,6 +75,25 @@ struct drm_gpusvm_ops {
>  	void (*invalidate)(struct drm_gpusvm *gpusvm,
>  			   struct drm_gpusvm_notifier *notifier,
>  			   const struct mmu_notifier_range *mmu_range);
> +
> +	/**
> +	 * @dma_map_account: Account a DMA-mapping change (optional)
> +	 * @gpusvm: Pointer to the GPU SVM
> +	 * @addr: The address descriptor of the chunk being (un)mapped
> +	 * @sign: +1 when @addr has just been DMA-mapped, -1 when it is being
> +	 *        unmapped
> +	 *
> +	 * Called once per &drm_pagemap_addr entry, when the entry is
> +	 * DMA-mapped by drm_gpusvm_get_pages() (@sign == +1) and when it is
> +	 * unmapped (@sign == -1), so the driver can keep symmetric accounting
> +	 * of the pages it has mapped for GPU access. The @addr->proto field
> +	 * can be used to distinguish system-memory mappings from device
> +	 * interconnect mappings. May be provided in both full SVM mode and the
> +	 * core drm_gpusvm_pages-only mode.
> +	 */
> +	void (*dma_map_account)(struct drm_gpusvm *gpusvm,
> +				const struct drm_pagemap_addr *addr,
> +				int sign);
>  };
>  
>  /**
> -- 
> 2.54.0
> 
