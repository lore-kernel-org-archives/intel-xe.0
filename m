Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CADBC87FCF
	for <intel-xe@archiver.kernel.org>; Wed, 13 Aug 2025 15:32:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C19610E744;
	Wed, 13 Aug 2025 15:32:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KegWh7cs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9871210E749
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Aug 2025 15:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755099149; x=1786635149;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=1bo+JDqgVlV2NklbQtWB5H+LYfuWrGsu6ES6WwnlyKY=;
 b=KegWh7csTh+uB8QTiBE5ibyMzsvmlTTGhZjyvZxUwCEmdhhkfCwSW/qt
 SA00pO7ugb2g4qgQTeTgKh/dws0UTayTngXAitMsxwO9d5GjFJc8GamCA
 /IjaomUc9Au6wv21Peepv5Q6Doyt7QNFHWwY8PcQt931aViVxWrze1nLT
 q3VQ8SvfQMhZ9Rikj4sih1/QGHLniwIev5lE6D5F6h+EzW2Hqk3z1aKHh
 mLlDwMEJ+uZL7MJJW3zaBR5BBMtfy4DlQFxargJ9rP8CmPL6a9XCXq4Lr
 BpQsCyC3uV7rOG/ZU8/cdnnXEIvJ1d0X2gGMTVdX7LVPT0Wh6W4wDaU0G w==;
X-CSE-ConnectionGUID: dbfwtggGSYa8b90WCMvUnw==
X-CSE-MsgGUID: rvqogYL/SXe4IGKDFrNg+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="57302538"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="57302538"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 08:32:11 -0700
X-CSE-ConnectionGUID: OCLIA6ZAQsqS7THelS+vsQ==
X-CSE-MsgGUID: +M6VuCi7RqGuyHUJ+nbz3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="166872869"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 08:32:10 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 13 Aug 2025 08:32:09 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 13 Aug 2025 08:32:09 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (40.107.102.86)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 13 Aug 2025 08:32:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WNZv/Pn8hDXQos+Dh5IVqYg1yBqYwy6Dedr6bZ3WsnvvAgX0lIOtvaodDuRJh3r2twHCxI9vaVe7U0YYxkdfhsFZsawj81/6PITRNe85buqMHW/LHHEIN189zuopTf7ux5YSVI8hqaiVRmCmxmzjnlpayBIPxMLLm1jVDyRWwdBGVFZJF2/2R2VZlHs5a+caNAccxyfC+FOcy/Z3xHN0uTHSqZpbLpYNXCq6jsaklh45itULziv6QkBd6HSiRAEQt6BkR4L2pCea1P9RZtkpA0E6Y+fH7y6TnzONhVP71ht9poxBFT1/1pdAqetcucl9nTlP3Alx0ADUhFofz8hoKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rBNQnXKwJRn2Epr99M0rBIPgjsE0AspQ10u6TY0md0s=;
 b=mUTc3dwhhENAuXxqBUF0rHao6a8PPhVvVCUvT+5DeRl7OmACrirZXTNjX/2qxRbSoIAoG4g2Wvww28aMQ3KuavIsDq+MsYojFv9AxRQLL1lhoQtEQa8v64DlueiOzAdFBuWE/LfA3juFA5euaGGIVqaJrCId0lfhj5J3CzjUpnUaqciz9l4Uc5KRIelkNp9f1fn6EVtT/vIGCiJLpuBMwv+3aFNkOGpfgk1eiZRzzRhzO/UIgLTNgy4jH79rCMrkefZyKybeVXrdin1/ye63DxEKlToYz+E72BRC1uwVqiyaZaYaz2+SkfTTHW3KMmWVtYKuNw08drZk0RCl4sXrmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB7704.namprd11.prod.outlook.com (2603:10b6:a03:4e7::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.13; Wed, 13 Aug
 2025 15:32:06 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9031.014; Wed, 13 Aug 2025
 15:32:06 +0000
Date: Wed, 13 Aug 2025 08:32:04 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Jani Nikula <jani.nikula@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Subject: Re: [PATCH 07/15] drm/xe: Convert SVM validation for exhaustive
 eviction
Message-ID: <aJyv9J8I/NGYpmHj@lstrano-desk.jf.intel.com>
References: <20250813105121.5945-1-thomas.hellstrom@linux.intel.com>
 <20250813105121.5945-8-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250813105121.5945-8-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: BYAPR07CA0084.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::25) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB7704:EE_
X-MS-Office365-Filtering-Correlation-Id: cfbb667d-f697-47a3-bfbe-08ddda7e8f82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?5HY1oidPiMyPAOmPuj5BZDxGGA33aaQfREyhtAh1J39p0rUshglXpeDHu2?=
 =?iso-8859-1?Q?htRrPL48SdOZnlXSNUHqAWO4Fk61qytYNTB7b0GOxa/qFbCXLQiA8b9oBw?=
 =?iso-8859-1?Q?+WvIuZi7Pc7dDlP9+Vmry6nfK3M4XdttDyQYElZ/xp5xowhWT4JHEmRH3Z?=
 =?iso-8859-1?Q?bv21YGvb+dYOgQlJl7NmVKjgeuFlSjp2zIFS3iaIVl8YA8HavWyY7zPBL9?=
 =?iso-8859-1?Q?eAPBTFdLreDWrUj1nudXFMViJRmtMDAvDbA4OOkovRPbuot9Zs+v3MJSe9?=
 =?iso-8859-1?Q?71/ph1sW+2nJZHbNcrcAiBou5yKiDh8RLPvAXh4ba9sU7R6dVTAHzVGRPi?=
 =?iso-8859-1?Q?bekfylLmNQI+VcQjx64nrv15/c8giskFXPUNabMVW0r8mcyxfUT6R7tNAK?=
 =?iso-8859-1?Q?H9NzsoPZ1w5Og+bzhK04ouV1kJpWX9pNyyUrPkD6RgdyzWKodWD7vBMfAo?=
 =?iso-8859-1?Q?lHaa6VEeda+iStF8SdVNE0I8HLvmw3Ygn4/gO3KFa4iNJZaWIcTd3P/D8T?=
 =?iso-8859-1?Q?tVnoW1RFyKU+H+4n55L6ls7UeniVT46kWNXKwbpyE0f1VeE/Q7soGkzRF4?=
 =?iso-8859-1?Q?jY+U1IdzwM46XwGcd80SHMU+rjs0Aa4nmGnw5V4fi7enEou1omSj6L7GJI?=
 =?iso-8859-1?Q?oTEmuMRgfB8XpUhGEeSRCDXt+npeiiwSue7whhXJ29a5HetOcB0+AKV/qK?=
 =?iso-8859-1?Q?imyGQqpypnPMVVrs60A+g5gBlLRxHj9loNK8tzBLQrwk1b4GeusJCJBW9G?=
 =?iso-8859-1?Q?3GLBW/5NFLp2DEb0esTv53kYUX4vjJV39BqWbt+ey+Xu7/c3KGv0QpH/Lv?=
 =?iso-8859-1?Q?7W7OxsJqgaYTeb71GJDhV/LnIEMOR4OetKgxwB2fy1hagK/M5VbOjTkz7c?=
 =?iso-8859-1?Q?1g1UbTRtC8a60vRlm/VC4fTge+GpWZlKZWZAyFvyXrfwanykMpNT+/jG11?=
 =?iso-8859-1?Q?5e7xuow6hb+amohdYGhONnT0dy5ZkRAlw9xZCQtqn8l9ix+ifb2kvzBA+Z?=
 =?iso-8859-1?Q?Oj4WCdhwL35YZwmwSWemyIJc9EI6hO611moI6fUrk+k9/lrj4ztyf+H8nx?=
 =?iso-8859-1?Q?azQRS9b9rB7QOcukZ2sIy9hTDFLC/Llthhf+/3Bj/7ogap8BJWzm/W1Y6s?=
 =?iso-8859-1?Q?aAEzOQDqj61dodHkOPdFe2HZsp+5/Vh1Bx1smWVPuuGmfclqKxTzj24eH6?=
 =?iso-8859-1?Q?pN2RR8+xVoeW+J8uFg+e7wu9uudBb1xUlDgIbYssfwRbwayJB2PIiVMuuQ?=
 =?iso-8859-1?Q?eH1caaRnQMo8LwmF/dvBouWOABGB27GenhLSlA2zi4w7m75aygdijIKxkv?=
 =?iso-8859-1?Q?1l3BdISZPv2LIpnJGlVD8eAAHK2Js+I8VNYsorgGA1qVcRZYjtgQ7iVgoI?=
 =?iso-8859-1?Q?JZ2SaxQIJODtWc4FyS9nduCCr1evx1Lb+tRw9HOAKQURHeujQz93Q+ofOc?=
 =?iso-8859-1?Q?+SdK/KHRnDqUREfxj6B8+7UquTJzW3aB1ZrdD3yqiGyzMu1Kk6ZMgi3/EA?=
 =?iso-8859-1?Q?c=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?cf8ulTT6PHBTSHoqLbHC3sR+W8eRQpLq6hUr/riGyB9RetdQtSWgKYPlvI?=
 =?iso-8859-1?Q?MDThMXpdBdfDNfNjsvyszpwJNlI9gcEPBhwWSWulUX64xF+Osebla7bJQp?=
 =?iso-8859-1?Q?6mb4CMuQCpqIQMWD4q6Gtzf9ShBoaVpooyiYr8ZiX8XnSIrtsc0nuhy8Ij?=
 =?iso-8859-1?Q?ePPWj5DerE5Gl/BIMt9GeHyeh5xkp3HkkKgrZvDpz59yve3aOzhOFQzfry?=
 =?iso-8859-1?Q?o00Q5RPoxOodmh3ZAikSi2AzOhBv+lFgUuUP89nXUPgaWjoLgOLIQ8Cm3A?=
 =?iso-8859-1?Q?VSzNymYf/nkC9XKGNbtctKE6QrUJbY3M/NCOJL+4zZfUMwQEKVdyGtFkuk?=
 =?iso-8859-1?Q?cgoOzSuWFJ5IM7EZEIfpwaYt1tkB7gEEmIBUeMspaTN11qAxSpTyIi7sL7?=
 =?iso-8859-1?Q?ddhk/uqz/ggXxd39xO6LIr8CN/wTAcIW73qTaYa7t6oJbRvlCf1LU9kBnl?=
 =?iso-8859-1?Q?2uVLGpYR2RlM1Nc2zPDrdA96mP2Six2TzDLyvHKruzNwKC4aM3e6ZHg9Dc?=
 =?iso-8859-1?Q?1hGWvRRXD2DWcsCpSSD5Z2y8xPV/Y5oXfBiZC5Yis/ZlxdWpFqqSCWKaao?=
 =?iso-8859-1?Q?BejEz4Cm3Tnv1c+7myji3TZjqP0+aI82kk1pjHfEejQUtCw9T6poenkYiO?=
 =?iso-8859-1?Q?LkeKC871f8vMo3UTZpYBUmDizFgXWuIrdqyoc2xxS9bo+xCn3fNJvjKKpf?=
 =?iso-8859-1?Q?aoje0eSGv+n0EqPLF7y59DRttIq/N/Wevh1dxkK9o20UH5LN3+P0S4Y1qm?=
 =?iso-8859-1?Q?8LbUVg0X95Ix4KOvvI1MkaNlmVw9EdT7/Qo8A6ZooXHcdVqYRIu/Mf94Ko?=
 =?iso-8859-1?Q?UIruF+qxibPQRGJcJh6pRxLOq/D0EDg4YVCRQ4jCNWH0pHSZHQLVTeHp3G?=
 =?iso-8859-1?Q?SFWVHaW2G0irZEk/NC9aAyyb272FF+Kh8d9J/V3cfQMD0II92lqJG5QFPO?=
 =?iso-8859-1?Q?+qb5BVAojfSVEUJQdBk7wVJzyj71slFn87w/qCzVVeh/MegxX6XZWrl5De?=
 =?iso-8859-1?Q?DFGhRnN3UMrd7IsrqQ4NHaX3N4FBy77b5VHKR4rb/l9+y6xqXD0kQY8aj+?=
 =?iso-8859-1?Q?1Rzl7UCpyq02wfNYEFufiKYBlapjRYisVL36/lZliL3NcP+EKGb2bGgTA2?=
 =?iso-8859-1?Q?JrI7hOz7ccQXp9/s4fKRaxTZA88ilerliXzfJ0aU+pbdIRengeXzbqciwb?=
 =?iso-8859-1?Q?UEPKT7zeV7ckTnYfvEbv0mwdWYuYMIbZA6TLFlcQtmyaFhxiI1gG8DsxRY?=
 =?iso-8859-1?Q?YdqXo6xCDW7bs0MFDVLnj7jHGpoK1JWdkntaYtkRB5MtQOIa0KwEFduwPC?=
 =?iso-8859-1?Q?+C4a7vdCSJfd8ADvYAfx4AetNGHwtkCVlhiauViLprvG8jytotCgbUfwsg?=
 =?iso-8859-1?Q?gFkragYaSzlzMp6e9zbEE3SmI33snVg9PrTUkJ1ehS9nR339FleOZ/fiTk?=
 =?iso-8859-1?Q?P67aVDzlz+Ro+VQBvA04kpyWWZTcvMQYwZ3LJC9zj8Imkerf9bAf3S5ZdJ?=
 =?iso-8859-1?Q?Seq5C6xdEN8jwIQmRmPGLDRLRWDC7uRikBOCp2FjvE7vdx4O+UVzUmc1kG?=
 =?iso-8859-1?Q?UJ4q5M/0PxdD65DutUsvb65uheS380aWU6zT40G/0tAo5VM3vXcNjiK70B?=
 =?iso-8859-1?Q?nwPmbnDTUh3X/4tJmPjhvfT6pgfLVB4MPERyUXsf/w6cWI0BkuJ4H8+A?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cfbb667d-f697-47a3-bfbe-08ddda7e8f82
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2025 15:32:06.7729 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DKkO6jxfqsWevDo8Dv182/D8saZglSCVQI6UWlN2WAZY1GHpd1D/ZbroQzh4I2Xe5bFsuMevIvJHdmz07VABpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB7704
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

On Wed, Aug 13, 2025 at 12:51:13PM +0200, Thomas Hellström wrote:
> Convert SVM validation to support exhaustive eviction,
> using xe_validation_guard().
> 

Do we not need to validation guard + xe_vm_set_validation_exec around
xe_vm_range_rebind, given that on first fault of range we can allocate
PTs?

Matt

> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_svm.c | 63 ++++++++++++++++++-------------------
>  1 file changed, 30 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 39e3aa6df25a..ba85665d85d4 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -699,51 +699,48 @@ static int xe_drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
>  	struct xe_device *xe = vr->xe;
>  	struct device *dev = xe->drm.dev;
>  	struct drm_buddy_block *block;
> +	struct xe_validation_ctx vctx;
>  	struct list_head *blocks;
> -	struct drm_exec *exec;
> +	struct drm_exec exec;
>  	struct xe_bo *bo;
> -	ktime_t time_end = 0;
> -	int err, idx;
> +	int err = 0, idx;
>  
>  	if (!drm_dev_enter(&xe->drm, &idx))
>  		return -ENODEV;
>  
>  	xe_pm_runtime_get(xe);
> -	exec = XE_VALIDATION_UNIMPLEMENTED;
> -
> - retry:
> -	bo = xe_bo_create_locked(vr->xe, NULL, NULL, end - start,
> -				 ttm_bo_type_device,
> -				 (IS_DGFX(xe) ? XE_BO_FLAG_VRAM(vr) : XE_BO_FLAG_SYSTEM) |
> -				 XE_BO_FLAG_CPU_ADDR_MIRROR, exec);
> -	if (IS_ERR(bo)) {
> -		err = PTR_ERR(bo);
> -		if (xe_vm_validate_should_retry(NULL, err, &time_end))
> -			goto retry;
> -		goto out_pm_put;
> -	}
>  
> -	drm_pagemap_devmem_init(&bo->devmem_allocation, dev, mm,
> -				&dpagemap_devmem_ops, dpagemap, end - start);
> -
> -	blocks = &to_xe_ttm_vram_mgr_resource(bo->ttm.resource)->blocks;
> -	list_for_each_entry(block, blocks, link)
> -		block->private = vr;
> +	xe_validation_guard(&vctx, &xe->val, &exec, 0, err, false) {
> +		bo = xe_bo_create_locked(xe, NULL, NULL, end - start,
> +					 ttm_bo_type_device,
> +					 (IS_DGFX(xe) ? XE_BO_FLAG_VRAM(vr) : XE_BO_FLAG_SYSTEM) |
> +					 XE_BO_FLAG_CPU_ADDR_MIRROR, &exec);
> +		drm_exec_retry_on_contention(&exec);
> +		if (IS_ERR(bo)) {
> +			err = PTR_ERR(bo);
> +			xe_validation_retry_on_oom(&vctx, &err);
> +			break;
> +		}
>  
> -	xe_bo_get(bo);
> +		drm_pagemap_devmem_init(&bo->devmem_allocation, dev, mm,
> +					&dpagemap_devmem_ops, dpagemap, end - start);
>  
> -	/* Ensure the device has a pm ref while there are device pages active. */
> -	xe_pm_runtime_get_noresume(xe);
> -	err = drm_pagemap_migrate_to_devmem(&bo->devmem_allocation, mm,
> -					    start, end, timeslice_ms,
> -					    xe_svm_devm_owner(xe));
> -	if (err)
> -		xe_svm_devmem_release(&bo->devmem_allocation);
> +		blocks = &to_xe_ttm_vram_mgr_resource(bo->ttm.resource)->blocks;
> +		list_for_each_entry(block, blocks, link)
> +			block->private = vr;
>  
> -	xe_bo_unlock(bo);
> -	xe_bo_put(bo);
> +		xe_bo_get(bo);
>  
> -out_pm_put:
> +		/* Ensure the device has a pm ref while there are device pages active. */
> +		xe_pm_runtime_get_noresume(xe);
> +		err = drm_pagemap_migrate_to_devmem(&bo->devmem_allocation, mm,
> +						    start, end, timeslice_ms,
> +						    xe_svm_devm_owner(xe));
> +		if (err)
> +			xe_svm_devmem_release(&bo->devmem_allocation);
> +		xe_bo_unlock(bo);
> +		xe_bo_put(bo);
> +	}
>  	xe_pm_runtime_put(xe);
>  	drm_dev_exit(idx);
>  
> -- 
> 2.50.1
> 
