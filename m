Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E07EC3DA4A
	for <intel-xe@archiver.kernel.org>; Wed, 14 Aug 2024 18:18:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1DE810E509;
	Wed, 14 Aug 2024 18:18:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JX2gIh9k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86D0510E509
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Aug 2024 18:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723659511; x=1755195511;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=cCtwB6cPT3AQMM0cSLlGMZgFBMyu1pMiQHq0FEtIfwY=;
 b=JX2gIh9kair5f/yC1abMGLXiNhqmKMkYUahJsoKaz+0Uf6aCX9MLG2hd
 FiKaxupzc0f5jMhbtP0x7hEZK088nKsRpvkPuk55pfi1AIivYuQ0qKlwJ
 wb/OxLYuLxggMLcS/FyHIdR/PlU2AuO8/l1OxCLewjrrD1VbnkhNF3GI0
 LHSf53u5VTtjMDyE1MfKep6e4Sgr07icUTeG09HEeO+UDdZ+fUti2qv9K
 dduzKK/SSBrXcGPdURv5b+i1dq3YjY+6+dDK86SF+YxCfEgUGjAF/MJqV
 cdglMxzIPOJCRJTcY7AKhC6gMX52FuPeuA9+HZNWHvlthjvRASPO24kA+ g==;
X-CSE-ConnectionGUID: YpFWIbB8SVOUsS3ZF5Xt9w==
X-CSE-MsgGUID: t0U2MmNvQraeVb1zAwCMuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="32471531"
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; d="scan'208";a="32471531"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 11:18:30 -0700
X-CSE-ConnectionGUID: us5U9BZ7T7Oy66rjNp6ERw==
X-CSE-MsgGUID: AVD1+txUR2qpNNj9NwNl1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; d="scan'208";a="63251393"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Aug 2024 11:18:29 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 14 Aug 2024 11:18:29 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 14 Aug 2024 11:18:29 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 14 Aug 2024 11:18:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M/yZAx8M6SnGcqeKIlu8IEOmYfUA/YZejMPCtku/bGuhSWHnOuY4OL2yXq1fZ08I2nuYUEQZkBEDU9pKLLJARe+aX0YyZWk6SglSqAgAz2R2ex6iWLkhv9AYrASOLoH4HjJ8rCUP5HTIErX61paZCPvSCt9I7gVGhYcuGA5HOO/56UDP10Slgu2nPCQe3YvQbG4X1wYKHdomuIuMB6nH52U6Fvw1XhuKoE1+3vOLmsB+wW/8bwmeDS0Eygtora4sBjQ6wA6K2sTZllP/qqOd3nXl76KXOMfAjppmDdiQWeKlsJZTymq0kkxvadIH2h33essMJOVMy4EfQ5Uy7pJfNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5k7D17DJQgxKvyrrroVKuU5B1mZbhQPqjSzBDrt6MZk=;
 b=JF1M7Q4aT+i6+FlOY814+QjG65REyw6h1ISUunB35gsM1PyrBVKRehvSk0Dw52cLeetnN7yG0xBqeF7MUNItyZuqR2+NK7e6P4zxtdQHe0gzRwsc9HM5uyp4KcLqpyUZAaJb/nt7Im7Fk1bv/r1egotVGCB3yNiyaTac/p2cuk0SKMvMSd4PZ7aKmawDnE/MT1uOgBx2OVS7RHPJeTzrbMYM0HfTzTi4s55/xqgYadUkoqqHRyc9CXpo/JzYb7qHwS3Y6dyaFP+7qDax7/EqSuWmATHJeb+Yrc1S+tOcQrVxNo9zGWGjBCnpRuDMh+dIh2/IV595lMbH3zudTCYprg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB7457.namprd11.prod.outlook.com (2603:10b6:8:140::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.17; Wed, 14 Aug
 2024 18:18:17 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7828.023; Wed, 14 Aug 2024
 18:18:17 +0000
Date: Wed, 14 Aug 2024 13:18:14 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH v2] drm/xe: Add driver load error injection
Message-ID: <tpla4fjc74lefz6imbsujf7zg64kz375bdt5eibv55feyrqcdj@6cmx3dq6yr7o>
References: <20240814165929.533310-1-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240814165929.533310-1-francois.dugast@intel.com>
X-ClientProxiedBy: MW4PR03CA0150.namprd03.prod.outlook.com
 (2603:10b6:303:8c::35) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB7457:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b94ac2c-5489-4e1b-e70f-08dcbc8d7835
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KrKFPaewmtf2jZQVrvnyEV8cYk+0BmozXR/bVnSWMXAvND2+zqDGeOAYQIDN?=
 =?us-ascii?Q?9MkEDkTk4on6ZxLCm+fSSyjimaDDlQzdK5VwkexQhnCQCsU6bkzhjq9Le5/X?=
 =?us-ascii?Q?xChg8JUZiU9OxOR+QQ4k1lKNkI4AM4jNAWuz1yIGhvI/AbJuTMTwvctur+tF?=
 =?us-ascii?Q?pCrmQkSYCQlMw/EeTEVepZh3guLNRymjzVQLXsy+91qmzwJjt+k8W3uA8lSk?=
 =?us-ascii?Q?K+PsIzQy/AXfk2MzOEw7io1NfiMeCL9Yhdp6uJs+4UvDobiDafBn79ObxZAh?=
 =?us-ascii?Q?LLpJNR+N82tHRBh0QpmYFBXFZa+8R1C214NIQzz9eaTSupRan/AgOvzC0IAc?=
 =?us-ascii?Q?TmJxyA7ci0XUbuR2LjXEAJKTKJIir7706V528eZ6vpbbQRMF0rwup7Dp1HF/?=
 =?us-ascii?Q?ueOpmY6Aj0HJ+qYvq9+xxTRk940vsKrWc+0def6yKA4ksl+IL4iYOdnz8P/N?=
 =?us-ascii?Q?N52PPUAeQJZvf2FGHGda3n15QwO6tfIOHztW9QMk983qhAinbMVr2X2dex3t?=
 =?us-ascii?Q?B3X4NUwy+beobZ3QEzvz2mZAssMmQQBlauMQ5rsDUcvP1eyuHa5UvNs6eTbT?=
 =?us-ascii?Q?4pjF/FJqqPGS0RmQdbjaVLMAc+doMCG3CrkmQ65IJqIRaa90e4bfc1tFvBHI?=
 =?us-ascii?Q?Lg3isnghdpSvBncgV037pGZR2RV8E3S3/qf6nAgOSLTMAWIc54dOhj6D3tIc?=
 =?us-ascii?Q?arzAnDU3NQfFDJ4D3BTuU48VlC+uyptpUr+uJViOT7ln83C+sb+KyTrtgfSg?=
 =?us-ascii?Q?39JAGGgoGk39hgGmffM+ZyK61yhlG3B6bsDdjDv4zQbjRDJNjjgTX64b+fVQ?=
 =?us-ascii?Q?3ldeMpXBsUZiGA2ZpmZLOroXv1gIdMtlmZABeu+Q4aSzJucG7YFzwVb1d2FS?=
 =?us-ascii?Q?0Mq/JfpN1OaY6q9MFEifj4aHb9CaSbZkp6IoB+dxg3/GxialI/SWj7N9PDw3?=
 =?us-ascii?Q?aKXPKRkOVZkpp8muQsrhsHGQLiq9W80Awt4FLiKbXdYuDIlhIBSOm0ByFmxl?=
 =?us-ascii?Q?rXVT0Kui1dqbFtZI7cTkJxXLK9F0X0fLROl9SE5s5Ws0ijr+l1rg828PFx3E?=
 =?us-ascii?Q?a6vYN/VklLdfha7rdZe3dxJPPCUs5T0X2MvQRBKZq4LG7RSavQsNkrhfXdXu?=
 =?us-ascii?Q?YlDManPrt5pQ3f0RnXFkTBq4NsilbIcoTJavHqJA+nQuGq5GJI+GhaiRwz37?=
 =?us-ascii?Q?5znpD8Td1Xqpx3RhOPAG/4XrWqLSGxEto+kkBlpgQvTPdLY2cOawWnvh2W6b?=
 =?us-ascii?Q?7uOWVlt7JcQ5qfl1cBTGSZJZetRFwI4MUPYmNO41vhvxd/Wv8l9QOruUIksy?=
 =?us-ascii?Q?5dHChGaerOnJpUV/qwmQ1bXaFKl0+2ruu0RZezPP1PQ0zQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?h/hoQG/p9ZzGjHFfnbxvQwhQ+iw47ti5jsI0AgVD/sDP8IpMCeyGR7k6TyBn?=
 =?us-ascii?Q?MJh2D7kWJk9u0RfpGBKM32d3QPoYN5hLV6aGb4RexawG1Q549/JBkXQG92gb?=
 =?us-ascii?Q?3g/fXQApq1fst5pozoK+TU3fT3D7D9JuVYA/egVSXn+Uad1P8R06td5tg1rH?=
 =?us-ascii?Q?pUR2v16KYaAcR0SIpBkYv0nMDjAg1Zkyp727sIuAFWQL6TwP2lkBjz0f0Rgv?=
 =?us-ascii?Q?De9B1t+f7aXk1YK+nL+2QLxghVLpV6QrI2R7JSSu/tLLXw99DxWjNk0jJwi5?=
 =?us-ascii?Q?5ikBkfO4kYl3HfdlHqDoM0j5fRqQt2BW5FCHP0QFn65+BkMCkjsy4cXkpWzA?=
 =?us-ascii?Q?w31IAjO9Yh2wuQ9GozONjI7bX+J+z38rrVqSez6wFFoxGOgQTPrZVr6iSyr1?=
 =?us-ascii?Q?EpWWQgO7cG966V3nfRERfkijj0KDAF0uIUDDm7g4Kstk39zJbYlECqo+Nh/f?=
 =?us-ascii?Q?hpEFdBFis6hrUXbnlcf1kDEn44mWborZziUnSwO7vmr80f53rqTt9Cy0LG6c?=
 =?us-ascii?Q?AT7guHBTyPYoGKMs9asGDhs29pwe9FN4FtKCyTMG9/5xH48rikbw4Wzy/hHa?=
 =?us-ascii?Q?XKfrSaFwjrEAtsOrtecDbxxmMZ2ERNopDo/xb1HUGfz7VE/ux9mD6vYt0yoP?=
 =?us-ascii?Q?OzNOb/Vp0gxGAvVZ1MRBn+MAmmjE432oHGXFwp4vdjmD8Ul0t/IBjPzXnPeP?=
 =?us-ascii?Q?ovS9rEz+ntX8ai3sKy3Pp0NPUN4F2oZck9vQhZOsaHInfhxkLqGyxhpBFLjA?=
 =?us-ascii?Q?MQIrjQfDC2mRl5f2pZ8eAWoLEBd9qQn651OCrFjbX7eKjOtF8Vo6Pg9T0xca?=
 =?us-ascii?Q?+SaRocmgHeajbDnEQxU0ievJC3BQ7HCj0T6RhimBY0E3rcKVR0o0OZL6atzk?=
 =?us-ascii?Q?HPsLzbOMDKEqJtecQ1NmsEP1LiZJyX+UkHxqJo3hfkiCrw54SkZHPWQa7VIi?=
 =?us-ascii?Q?ju+4hgbJwpnnDriCtS38wrVnZ9CQAN7rGoPxVqLjiW9rC1cKuaCXdxl1IVpk?=
 =?us-ascii?Q?Dlj6D9LIP3eQp2UpVZ77Y0T/+3NSMt3s2C8X0fQ4mSTmNLh5QUQANH6gvk3I?=
 =?us-ascii?Q?lRoBps1c2dHfBkzGFhLOBv0ivKRVGFNaf1JaB3/xQj8ZEn6QUfgnwAzpr2oV?=
 =?us-ascii?Q?ACRcSIPvIQx5rmzbCsvfpXAhxn99jWtI0kTSnTs9YpOlv6COsb2eOhzf3hkF?=
 =?us-ascii?Q?vn5vJVTHpPYIjdFIelVXvoTTmXC2g7v+QfHGhMsQKdvRy4UOMLdwdcR9Tdgi?=
 =?us-ascii?Q?TRPnIWPx+z9KmzbluclCq7WQWp8EU320ZjthAuZE/Y/ulD9TwLN+wisyF0bZ?=
 =?us-ascii?Q?vS4IzE6noKPCGAZqm7ebzi640y7ZDHeKXDjExrIfyUSE5+iYnmGT9RxxddA1?=
 =?us-ascii?Q?E0zf2ewF/tJYVzzAeKlkK06stHjuD9tvjT1JT3LH6e/dPZW4zi2c/Nemi3G4?=
 =?us-ascii?Q?zUaO6UyTuXwPwlstJAGONiuf8feuJRdB2jQZQhy39cljyREI6r3EhpnuQAeI?=
 =?us-ascii?Q?qexIj4pktgdddFufEa4KdBf95ztPUEXy4J0+Ff/tGKCK5D6uiFggKceDNIFj?=
 =?us-ascii?Q?uQRnQkZS/FvTfXs/fF2mwvm0JkE4wcvA0AaUNpU/bCo7q//Zti8sKqkUxSUe?=
 =?us-ascii?Q?DQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b94ac2c-5489-4e1b-e70f-08dcbc8d7835
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2024 18:18:17.4932 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J4qKrCGChdZD8hS6WOyh54CdWHbfurqgiqdqelLGCevhTt2dkJc+w9A8knBmdQh85ADiTcZIi7PRComzixcYLCsagSrwbfSZgOOSWKMpsBg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7457
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

On Wed, Aug 14, 2024 at 06:59:29PM GMT, Francois Dugast wrote:
>Port over i915 driver load error injection.

this sentence needs to go away, then you explain here what this is and
how it's expected to be used for tests. Also a good opportunity to
explain that this is used to fix up the current problems and avoid new
ones to be introduced, but in future it's expected to be replaced by
infra from fault-inject.h.

>
>v2: Fix style and build errors, modparam to 0 after probe, rename to
>    xe_device_inject_driver_probe_error, check type when compiled out,
>    add _return macro, move some uses to the beginning of the function
>
>Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>Signed-off-by: Francois Dugast <francois.dugast@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>---
> drivers/gpu/drm/xe/xe_device.c       | 43 ++++++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_device.h       | 25 ++++++++++++++++
> drivers/gpu/drm/xe/xe_device_types.h |  5 ++++
> drivers/gpu/drm/xe/xe_gt.c           |  2 ++
> drivers/gpu/drm/xe/xe_gt_sriov_pf.c  |  2 ++
> drivers/gpu/drm/xe/xe_guc.c          |  2 ++
> drivers/gpu/drm/xe/xe_guc_ct.c       |  1 +
> drivers/gpu/drm/xe/xe_mmio.c         |  2 ++
> drivers/gpu/drm/xe/xe_module.c       |  5 ++++
> drivers/gpu/drm/xe/xe_module.h       |  3 ++
> drivers/gpu/drm/xe/xe_pci.c          |  3 ++
> drivers/gpu/drm/xe/xe_pm.c           |  3 ++
> drivers/gpu/drm/xe/xe_sriov.c        |  2 ++
> drivers/gpu/drm/xe/xe_tile.c         |  2 ++
> drivers/gpu/drm/xe/xe_uc.c           |  1 +
> drivers/gpu/drm/xe/xe_wa.c           |  2 ++
> drivers/gpu/drm/xe/xe_wopcm.c        |  2 ++
> 17 files changed, 105 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>index 1aba6f9eaa19..6d3cdeeaadfd 100644
>--- a/drivers/gpu/drm/xe/xe_device.c
>+++ b/drivers/gpu/drm/xe/xe_device.c
>@@ -374,6 +374,10 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
> 	if (WARN_ON(err))
> 		goto err;
>
>+	err = xe_device_inject_driver_probe_error(xe, err);
>+	if (err)
>+		goto err;

	err = ttm_device_init(&xe->ttm, &xe_ttm_funcs, xe->drm.dev,
			      xe->drm.anon_inode->i_mapping,
			      xe->drm.vma_offset_manager, false, false);
	err = xe_device_inject_driver_probe_error(xe, err);
	if (WARN_ON(err))
		goto err;


rather than adding another flow control

>+
> 	return xe;
>
> err:
>@@ -474,6 +478,7 @@ static int xe_set_dma_info(struct xe_device *xe)
> 		goto mask_err;
>
> 	err = dma_set_coherent_mask(xe->drm.dev, DMA_BIT_MASK(mask_size));
>+	err = xe_device_inject_driver_probe_error(xe, err);
> 	if (err)
> 		goto mask_err;
>
>@@ -577,6 +582,7 @@ int xe_device_probe_early(struct xe_device *xe)
> 		return err;
>
> 	err = wait_for_lmem_ready(xe);
>+	err = xe_device_inject_driver_probe_error(xe, err);
> 	if (err)
> 		return err;
>
>@@ -745,6 +751,10 @@ int xe_device_probe(struct xe_device *xe)
> 	for_each_gt(gt, xe, id)
> 		xe_gt_sanitize_freq(gt);
>
>+#ifdef CONFIG_DRM_XE_DEBUG

comment here:

	/* After probe finishes, stop checking for error injection */

>+	xe_modparam.inject_driver_probe_error = 0;
>+#endif
>+
> 	return devm_add_action_or_reset(xe->drm.dev, xe_device_sanitize, xe);
>
> err_fini_display:
>@@ -995,3 +1005,36 @@ void xe_device_declare_wedged(struct xe_device *xe)
> 	for_each_gt(gt, xe, id)
> 		xe_gt_declare_wedged(gt);
> }
>+
>+#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>+/**
>+ * __xe_device_inject_driver_probe_error - Inject an error during device probe
>+ * @xe: xe device instance
>+ * @err_injected: the error to inject
>+ * @err_real: the error returned by the actual function
>+ * @func: the name of the function where this is called from
>+ * @line: the line where this is called from
>+ *
>+ * This is not meant to be called directly, only through xe_device_inject_driver_probe_error.
>+ *
>+ * Return: err_real if != 0, err_injected otherwise
>+ */
>+int __xe_device_inject_driver_probe_error(struct xe_device *xe, int err_injected, int err_real,
>+					  const char *func, int line)
>+{
>+	if (xe->inject_driver_probe_error >= xe_modparam.inject_driver_probe_error)
>+		return 0;
>+
>+	if (++xe->inject_driver_probe_error < xe_modparam.inject_driver_probe_error)
>+		return 0;
>+
>+	if (err_real != 0)
>+		return err_real;

why isn't this the first check? we don't want to count any error
injection if the error was real

>+
>+	drm_info(&xe->drm, "Injecting failure %d at checkpoint %u [%s:%d]\n",
>+		 err_injected, xe->inject_driver_probe_error, func, line);
>+
>+	xe_modparam.inject_driver_probe_error = 0;
>+	return err_injected;
>+}
>+#endif
>diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
>index db6cc8d0d6b8..31270a54ccf9 100644
>--- a/drivers/gpu/drm/xe/xe_device.h
>+++ b/drivers/gpu/drm/xe/xe_device.h
>@@ -179,4 +179,29 @@ void xe_device_declare_wedged(struct xe_device *xe);
> struct xe_file *xe_file_get(struct xe_file *xef);
> void xe_file_put(struct xe_file *xef);
>
>+#define XE_DEVICE_INJECTED_ERR -ENODEV
>+#define xe_device_inject_driver_probe_return(__xe) \
>+	({ if (__xe_device_inject_driver_probe_error(__xe, XE_DEVICE_INJECTED_ERR, 0, __func__, \
>+						     __LINE__) == XE_DEVICE_INJECTED_ERR) \
>+			return XE_DEVICE_INJECTED_ERR; })

#define xe_device_inject_driver_probe_error(__xe) \
	__xe_device_inject_driver_probe_error(__xe, XE_DEVICE_INJECTED_ERR, 0, __func__, __LINE__)

>+#define xe_device_inject_driver_probe_error(__xe, __err_real) \

#define xe_device_inject_driver_probe_error_override(__xe, __err_real)
	__xe_device_inject_driver_probe_error(__xe, XE_DEVICE_INJECTED_ERR, __err_real, __func__, \
					      __LINE__)

or with some other better name, but without changing the flow inside a
macro.

>+	__xe_device_inject_driver_probe_error(__xe, XE_DEVICE_INJECTED_ERR, __err_real, __func__, \
>+					      __LINE__)
>+
>+#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>+
>+int __xe_device_inject_driver_probe_error(struct xe_device *xe,
>+					  int err_injected, int err_real,
>+					  const char *func, int line);
>+#else
>+
>+static inline int __xe_device_inject_driver_probe_error(struct xe_device *xe,
>+							int err_injected, int err_real,
>+							const char *func, int line)
>+{
>+	return 0;
>+}
>+
>+#endif
>+
> #endif
>diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>index 5b7292a9a66d..139336ad4194 100644
>--- a/drivers/gpu/drm/xe/xe_device_types.h
>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>@@ -484,6 +484,11 @@ struct xe_device {
> 		int mode;
> 	} wedged;
>
>+#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>+	/** @inject_driver_probe_error: Counter used for error injection during probe */
>+	int inject_driver_probe_error;
>+#endif
>+
> #ifdef TEST_VM_OPS_ERROR
> 	/**
> 	 * @vm_inject_error_position: inject errors at different places in VM
>diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>index 58895ed22f6e..4c73576bc5f3 100644
>--- a/drivers/gpu/drm/xe/xe_gt.c
>+++ b/drivers/gpu/drm/xe/xe_gt.c
>@@ -378,6 +378,7 @@ int xe_gt_init_early(struct xe_gt *gt)
> 	xe_reg_sr_init(&gt->reg_sr, "GT", gt_to_xe(gt));
>
> 	err = xe_wa_init(gt);
>+	err = xe_device_inject_driver_probe_error(gt_to_xe(gt), err);
> 	if (err)
> 		return err;
>
>@@ -564,6 +565,7 @@ int xe_gt_init_hwconfig(struct xe_gt *gt)
> 		goto out_fw;
>
> 	err = xe_uc_init_hwconfig(&gt->uc);
>+	err = xe_device_inject_driver_probe_error(gt_to_xe(gt), err);
> 	if (err)
> 		goto out_fw;
>
>diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
>index ef239440963c..0d50cbb496c3 100644
>--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
>+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
>@@ -7,6 +7,7 @@
>
> #include "regs/xe_regs.h"
>
>+#include "xe_device.h"
> #include "xe_gt_sriov_pf.h"
> #include "xe_gt_sriov_pf_config.h"
> #include "xe_gt_sriov_pf_helpers.h"
>@@ -54,6 +55,7 @@ int xe_gt_sriov_pf_init_early(struct xe_gt *gt)
> 		return err;
>
> 	err = xe_gt_sriov_pf_service_init(gt);
>+	err = xe_device_inject_driver_probe_error(gt_to_xe(gt), err);
> 	if (err)
> 		return err;
>
>diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>index de0fe9e65746..61009499fddf 100644
>--- a/drivers/gpu/drm/xe/xe_guc.c
>+++ b/drivers/gpu/drm/xe/xe_guc.c
>@@ -351,6 +351,7 @@ int xe_guc_init(struct xe_guc *guc)
> 		goto out;
>
> 	ret = devm_add_action_or_reset(xe->drm.dev, guc_fini_hw, guc);
>+	ret = xe_device_inject_driver_probe_error(guc_to_xe(guc), ret);
> 	if (ret)
> 		goto out;
>
>@@ -408,6 +409,7 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
> 		return ret;
>
> 	ret = xe_guc_pc_init(&guc->pc);
>+	ret = xe_device_inject_driver_probe_error(guc_to_xe(guc), ret);
> 	if (ret)
> 		return ret;
>
>diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
>index beeeb120d1fc..29a8314b0ee1 100644
>--- a/drivers/gpu/drm/xe/xe_guc_ct.c
>+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>@@ -194,6 +194,7 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
> 	ct->bo = bo;
>
> 	err = drmm_add_action_or_reset(&xe->drm, guc_ct_fini, ct);
>+	err = xe_device_inject_driver_probe_error(xe, err);
> 	if (err)
> 		return err;
>
>diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
>index bdcc7282385c..f79ac35251c5 100644
>--- a/drivers/gpu/drm/xe/xe_mmio.c
>+++ b/drivers/gpu/drm/xe/xe_mmio.c
>@@ -137,6 +137,8 @@ int xe_mmio_probe_tiles(struct xe_device *xe)
> 	size_t tile_mmio_size = SZ_16M;
> 	size_t tile_mmio_ext_size = xe->info.tile_mmio_ext_size;
>
>+	xe_device_inject_driver_probe_return(xe);

as above, let's keep the if (...)  here rather than inside the macro.

Lucas De Marchi

>+
> 	mmio_multi_tile_setup(xe, tile_mmio_size);
> 	mmio_extension_setup(xe, tile_mmio_size, tile_mmio_ext_size);
>
>diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
>index 7bb99e451fcc..dbc737085bf1 100644
>--- a/drivers/gpu/drm/xe/xe_module.c
>+++ b/drivers/gpu/drm/xe/xe_module.c
>@@ -53,6 +53,11 @@ module_param_named_unsafe(force_probe, xe_modparam.force_probe, charp, 0400);
> MODULE_PARM_DESC(force_probe,
> 		 "Force probe options for specified devices. See CONFIG_DRM_XE_FORCE_PROBE for details.");
>
>+#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>+module_param_named_unsafe(inject_driver_probe_error, xe_modparam.inject_driver_probe_error, int, 0600);
>+MODULE_PARM_DESC(inject_driver_probe_error, "Inject driver probe error");
>+#endif
>+
> #ifdef CONFIG_PCI_IOV
> module_param_named(max_vfs, xe_modparam.max_vfs, uint, 0400);
> MODULE_PARM_DESC(max_vfs,
>diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
>index 61a0d28a28c8..d612a7ae7a4c 100644
>--- a/drivers/gpu/drm/xe/xe_module.h
>+++ b/drivers/gpu/drm/xe/xe_module.h
>@@ -20,6 +20,9 @@ struct xe_modparam {
> 	char *force_probe;
> #ifdef CONFIG_PCI_IOV
> 	unsigned int max_vfs;
>+#endif
>+#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>+	int inject_driver_probe_error;
> #endif
> 	int wedged_mode;
> };
>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>index f818aa69f3ca..97b82d5366d9 100644
>--- a/drivers/gpu/drm/xe/xe_pci.c
>+++ b/drivers/gpu/drm/xe/xe_pci.c
>@@ -626,6 +626,7 @@ static int xe_info_init_early(struct xe_device *xe,
> 				  desc->has_display;
>
> 	err = xe_tile_init_early(xe_device_get_root_tile(xe), xe, 0);
>+	err = xe_device_inject_driver_probe_error(xe, err);
> 	if (err)
> 		return err;
>
>@@ -647,6 +648,8 @@ static int xe_info_init(struct xe_device *xe,
> 	struct xe_gt *gt;
> 	u8 id;
>
>+	xe_device_inject_driver_probe_return(xe);
>+
> 	/*
> 	 * If this platform supports GMD_ID, we'll detect the proper IP
> 	 * descriptor to use from hardware registers. desc->graphics will only
>diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
>index 9f3c14fd9f33..4c05352eb01a 100644
>--- a/drivers/gpu/drm/xe/xe_pm.c
>+++ b/drivers/gpu/drm/xe/xe_pm.c
>@@ -228,6 +228,7 @@ int xe_pm_init_early(struct xe_device *xe)
> 		return err;
>
> 	err = drmm_mutex_init(&xe->drm, &xe->d3cold.lock);
>+	err = xe_device_inject_driver_probe_error(xe, err);
> 	if (err)
> 		return err;
>
>@@ -246,6 +247,8 @@ int xe_pm_init(struct xe_device *xe)
> {
> 	int err;
>
>+	xe_device_inject_driver_probe_return(xe);
>+
> 	/* For now suspend/resume is only allowed with GuC */
> 	if (!xe_device_uc_enabled(xe))
> 		return 0;
>diff --git a/drivers/gpu/drm/xe/xe_sriov.c b/drivers/gpu/drm/xe/xe_sriov.c
>index 5a1d65e4f19f..164cc119ad96 100644
>--- a/drivers/gpu/drm/xe/xe_sriov.c
>+++ b/drivers/gpu/drm/xe/xe_sriov.c
>@@ -105,6 +105,8 @@ int xe_sriov_init(struct xe_device *xe)
> 	if (!IS_SRIOV(xe))
> 		return 0;
>
>+	xe_device_inject_driver_probe_return(xe);
>+
> 	if (IS_SRIOV_PF(xe)) {
> 		int err = xe_sriov_pf_init_early(xe);
>
>diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
>index 15ea0a942f67..bc0193bd35ed 100644
>--- a/drivers/gpu/drm/xe/xe_tile.c
>+++ b/drivers/gpu/drm/xe/xe_tile.c
>@@ -124,6 +124,8 @@ int xe_tile_init_early(struct xe_tile *tile, struct xe_device *xe, u8 id)
> 	if (IS_ERR(tile->primary_gt))
> 		return PTR_ERR(tile->primary_gt);
>
>+	xe_device_inject_driver_probe_return(xe);
>+
> 	return 0;
> }
>
>diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
>index 0d073a9987c2..32e0466bf0a4 100644
>--- a/drivers/gpu/drm/xe/xe_uc.c
>+++ b/drivers/gpu/drm/xe/xe_uc.c
>@@ -59,6 +59,7 @@ int xe_uc_init(struct xe_uc *uc)
> 		return 0;
>
> 	ret = xe_wopcm_init(&uc->wopcm);
>+	ret = xe_device_inject_driver_probe_error(uc_to_xe(uc), ret);
> 	if (ret)
> 		goto err;
>
>diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
>index 564e32e44e3b..1c0c1ea8058b 100644
>--- a/drivers/gpu/drm/xe/xe_wa.c
>+++ b/drivers/gpu/drm/xe/xe_wa.c
>@@ -832,6 +832,8 @@ int xe_wa_init(struct xe_gt *gt)
> 	if (!p)
> 		return -ENOMEM;
>
>+	xe_device_inject_driver_probe_return(xe);
>+
> 	gt->wa_active.gt = p;
> 	p += n_gt;
> 	gt->wa_active.engine = p;
>diff --git a/drivers/gpu/drm/xe/xe_wopcm.c b/drivers/gpu/drm/xe/xe_wopcm.c
>index d3a99157e523..eb7f1554108d 100644
>--- a/drivers/gpu/drm/xe/xe_wopcm.c
>+++ b/drivers/gpu/drm/xe/xe_wopcm.c
>@@ -263,6 +263,8 @@ int xe_wopcm_init(struct xe_wopcm *wopcm)
> 		return -E2BIG;
> 	}
>
>+	xe_device_inject_driver_probe_return(xe);
>+
> 	if (!locked)
> 		ret = __wopcm_init_regs(xe, gt, wopcm);
>
>-- 
>2.43.0
>
