Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D99E3CA0ED1
	for <intel-xe@archiver.kernel.org>; Mon, 18 Aug 2025 16:18:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A45210E06A;
	Mon, 18 Aug 2025 16:18:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TGKLI5ei";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53CDD10E06A
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Aug 2025 16:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755533892; x=1787069892;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Iz/aEqCIbbxloDyBnP4lsbPD1nBb0MC/RDrb6wo0Swc=;
 b=TGKLI5ei/vT10gUHtdruqvRxv5cflGxxOPp62dX2mDYvnLztzhjBfgef
 Dp524p9KV81nMj/rZPVHy1LERXLLZlt6Cj+GTHfL8WlbKqaMuVCQmWtFR
 jcASJgPZ/lQ2OaySNj6j8ovf0C4Pt9LEpJN9fzuVO1WVp1KPEjB0xzoL1
 XbHBaa8cYViHFsW4tQZvjJEH1xsk80o5tz9qsj2EO9n5JfyNlMbebSJ/9
 NaXSs3l7VpSKNgqflcOtejjXkDYantxkkOTIdTY85lXa34Fj2cYH5aidy
 HMvAszObcLNXrtn1ELJiDbw2fbodUZ6EbdSiV8iD6B0UpZanZV+ncYO9a Q==;
X-CSE-ConnectionGUID: UogPdOTrRlqB/bZLYIDMaA==
X-CSE-MsgGUID: NkbgVaoWTueXE/27YPRIfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="69137508"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="69137508"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 09:18:12 -0700
X-CSE-ConnectionGUID: UwN/T6CgTaytiVGUyx5fCA==
X-CSE-MsgGUID: 7WjaQP1NTeqWRUof7LW8+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="166786592"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 09:18:12 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 18 Aug 2025 09:18:11 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 18 Aug 2025 09:18:11 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.42) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 18 Aug 2025 09:18:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iDqzlyoxSYl0L+2Dv3zlGbsWLc0bTkS/dRZ3V/uaThO+7RvrmORo4vOJd/pJERusxVzcLdHl+FkmmHpnMRIlGZVinBM/TzIG1IQhU8nFQonVtbDKO7o60QB/7fsQeCVm4E0ll6xjXTq6ODlhMwKvucVXI8O4vJXZK3rv4K/90TipIjF/MPYI2VWkRiMwPje50hlOIMK2voJ4UH6ly1FSK4AXaLStmHIC0+oP5WFMmwi7xuZWjzLBhc7SkHQxLqPcHQ9fYryK77vtF9RrZ1wDA4YitrAwV/VxCOoCOmDH73XnZMHLSBMQSPXgpBUeJ9adf1f1ihPe+wPduQTl4H6j/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2CYXwWdenUswm5NmgxpsO3mdsR1dHGfVl3mlr8y5+pE=;
 b=fl5gJqS7RGDs24TL4/2cW1BbXLFZuWNk8ZoWc6/yMAJ0cIExFxv4ayvsxnU95S+4Puxq5TXBuSWNFtPf3fS8mSCm7SjGGnaL1j8VdIqLoPryEEfvh8wFG8MzYhUrGVpFUJCe1j6dwxVcuPasfhsts79DruE9hIrQCKGHQQkE573urE+mm+fmsqaAUxQn7vvoq5PE2XEh9T2lIsoDV3GplSzdo1oHlYsRc9jEW6kSWRuHRekXX5cAQlBIqkmt4UzAICII7N/9EYa5EeE9aqtwFg+cLBi74Py9Tmy4zFAfcdwWlvMhEaSBTVJmspw38HAqD1xVz2GhmU4mxyMrf1ELLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA2PR11MB4972.namprd11.prod.outlook.com (2603:10b6:806:fb::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Mon, 18 Aug
 2025 16:18:08 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9031.023; Mon, 18 Aug 2025
 16:18:08 +0000
Date: Mon, 18 Aug 2025 11:18:05 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/6] drm/xe/kunit: Introduce xe_pci_fake_data_desc()
Message-ID: <h77lujxjdbmuoiq2iswniv5noov4zrigsjfwcdaxau2m2wrjo6@g5jbnx5gcmmj>
References: <20250801181350.180780-1-michal.wajdeczko@intel.com>
 <20250801181350.180780-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250801181350.180780-3-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR05CA0192.namprd05.prod.outlook.com
 (2603:10b6:a03:330::17) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA2PR11MB4972:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ead3aed-078d-41da-e9e0-08ddde72d1ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?T9nIFx0LcVrPXUz1rI1MXEHIktmHjXmU20PwXiGCIhZwDtB7A25GiKJM6w5M?=
 =?us-ascii?Q?eJfK1a4AezkLAf+oXy6b13UzufsF6COWo4eYyjA2CucT7n4pJ9AsvwZxm9ny?=
 =?us-ascii?Q?/yvzdODQJwWKdrE+acmMHAZBMHYlm1bB7W/vMFcKXKFlPs537r9Ka6B3EALM?=
 =?us-ascii?Q?IWanszkJQ3hl6pDq+TpONnssprokV8W9HwfOZ/AyaIr3P+PhZKojMxx0+de1?=
 =?us-ascii?Q?R+JmxJ/dqu+2bdNQL8DeVMHjGCQVWA/sssrHfUbcbbO6kxROdhgNB6m8oKP1?=
 =?us-ascii?Q?a1r2GWpvi8IV6O3IDXR14dSy2ztzjJHcTKuLOYGisiu59/sGudoJLFsercej?=
 =?us-ascii?Q?jTpO4r4tSVb+UZBqP/wGe+d2TFOmI1PgHLHmk2OnrnuyMj5q+6xorwNPeQE2?=
 =?us-ascii?Q?YHnCKVIwmyv5qN8gFxOM8yUh1S61HUj85nE224uALZY/TtW6HAacL/BkGZI2?=
 =?us-ascii?Q?nxNlvAEOkbQDrjLh0mvsr9wxoyh5soZ/9Soww1N2IPmcwjerx10CCEuZWl4l?=
 =?us-ascii?Q?VW5HqctLakst80B9Y8YRV3Ijn0xhlJu2K0RYvLIQA7UiTCNIhJXClki1nGXT?=
 =?us-ascii?Q?ELw1xfE2CMtj5utkT+KzH/25ELr2tSfR7rzpjOSyGn3FwuFQREEtWPzZDjca?=
 =?us-ascii?Q?9JiolfwiKfx6gM/1dge3xotO+bYd1DZNrB7W30OBTcFIWePqsR4ASG+463lN?=
 =?us-ascii?Q?lkYFuXTOULkssVlDsj5h06raX+C+9XxMDqNFI0lb5YWqrMMoaArDnFUlN76C?=
 =?us-ascii?Q?/6EM6mUtpobCJU+X8Lg3CAS25pnnLYmB2vYxHQH56fkAlte/wd98AnalGnIS?=
 =?us-ascii?Q?AOC2hKS4GYhrPnwcPYTGB9XOQQ5v1BaWXL4pSF3437GzqM+JFeOcDO7S7rAe?=
 =?us-ascii?Q?+9WgWZnsGVI/lxfVuiU8PzNujiQ6adwz6s2puBoZ+QpdSRq0TjfkqU/2F08R?=
 =?us-ascii?Q?lMQmLKmYV7X9kW95e4yUAA3tadLmFqPENSEXPWaqrKYauwDVHBk6NcNFfTV7?=
 =?us-ascii?Q?mhSPiyoKFrc1KTJO+C/bhchy58depi4eiZoCJJR7JycorhPa6JczbBf/OAHl?=
 =?us-ascii?Q?EPJIvV1/kWhlYK5MjiJ4MM6XjKkZ8XtEXkS7CUZua0ySJ/B8dpaD+cyyEqBd?=
 =?us-ascii?Q?gHqFXEcnsJRqDUpoTvVO6Y3uQ3vWuaRrZSb7zbSCcYL0GPUIdY6gkrDgZIox?=
 =?us-ascii?Q?acFrGDhcMDXDkkaPCHjR6cEkLKyh3jrBNivK5zhKD872rOcD+4+tzdkFM394?=
 =?us-ascii?Q?b/tJNXAiApqwVRSHkLZMBTG4ViW61xkEpvtM6wmvv+sNJs55Qw9z3WN6xia+?=
 =?us-ascii?Q?d+yaJsXxmTlCBeJemE+XAVciDUxNCJkiCc+F4jjJVqjT9o12L+VY99QQKy2l?=
 =?us-ascii?Q?QwKICpKl1o2QfmK7S5o7QRc7mYqH1j0KoYbP+GaUF4F5GLM/kESfsYHkzyUZ?=
 =?us-ascii?Q?oJDs5eE4/uc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4b2wcR738fdJeJnuHDsJXv82cK1sQosxZyHTwFiBNyNakCPFKb847vzn0Rx/?=
 =?us-ascii?Q?O2hKSWzSkmfLKHiAr5p4LReMQ3GfvCoCIojzMmeDfZrH/1FeYSsl/RsA5P9+?=
 =?us-ascii?Q?RZaXpJA0kSOgSbllgzxA/yJGTf5iEoVvNsf2Mkx50+xSi7t9ltWTg5kUpwIj?=
 =?us-ascii?Q?txzYr08/pkeM7aqzLg3k0lzLqVvKktG5uEUxQg3qhPYQfEy88d33WwbBh17A?=
 =?us-ascii?Q?Qg4MCxnjD/Zg+ev9bPPel3+Cbyxf6TxkiI6kCqBTNRHRzTdR4cDrUl3xxRI0?=
 =?us-ascii?Q?NfVPU1+7oaNKZHSUdvsJiofE5yeB6wCuL90KH7yH/TvDEM4vYrAhw7GWk15f?=
 =?us-ascii?Q?cHmma3Mpubub4pW9hHyaBpe32rqHN9mAty+yQlAD/OJMajWlPAghXwcEI1w7?=
 =?us-ascii?Q?EcjOHc+K1COr76sxrQsKlRys9nJaAGaP8WOjCx556vCHDNuQjEKFWbpapJSm?=
 =?us-ascii?Q?FZlaeaVLfYprGuN7VrA1PzjwTa1TVLsOiLn0Du0SBEdtkGAGZKL9/Gy9j98u?=
 =?us-ascii?Q?OG1zgY+KqXhIiQk646tOan07bnG+yfznwDebUX4h8gmdHq/uLYYrn7/u8gRA?=
 =?us-ascii?Q?CHUcVkRgLg4LwjEANPxAx/nF8sB7PzHIYTqNldnCmqevxqMpjKjrhn82byxQ?=
 =?us-ascii?Q?WRk4r9N7Tx3pu+a3J6sId7K+Jn0Fero4/PGa+jth7DPsIpITBzQH9nyfst/b?=
 =?us-ascii?Q?BfR9ZQblxp4Rj8pqBzKaq3w8hESzFeNfeCxOtL/5UVznSzTeqyjH4a7kH5Ss?=
 =?us-ascii?Q?1FdCbXBpZRp305uedxV/pysAjmTom0pyXA3VFg8PVG5gcEQ6gk5RnY33kBXc?=
 =?us-ascii?Q?GmhoJDjt3a0XBuEvQZSaB7e3ZdTF7XbrlQsP8LCy+cbhxXvi6PofV1yNuhNW?=
 =?us-ascii?Q?D6KMXDXECSwLieeEJp/fT2MhhhA0AbqrfheDahNLFyD6f9T/hs1UAX0yaA1O?=
 =?us-ascii?Q?qEzUhS/U947pn/GchZOuewJy/l3AXrXVr1gpUiLfb96IAL8iH4O3h7Efv5cN?=
 =?us-ascii?Q?R82CZrmMa+Y7E/g547XHRRLk1XsH/UfL8eewjzQvBqj+Z3/kzRbmJRUbn//W?=
 =?us-ascii?Q?ITOiDtlVEopPtZmimXfN/GP4U8dY5jwLwoKwZGU7OtzBBnqHKUzBtrUq5Yv7?=
 =?us-ascii?Q?zgxMm4QECCZvkRAKY+5sIFQ7kOCHaPHRqSHjnQLVzpzqUs3eSEWozv80+aK8?=
 =?us-ascii?Q?X4sE181IIC1Q9K/BXinY7Ush9WGRdvDFrqPMXL1GJm8MJ4+qUGfGi/vOMgqa?=
 =?us-ascii?Q?n3bvRh/Y0BMAYU7YN8YfO98nKNhZs/vC3zlIABA7rV9eMJDf3UJkLRmt6Wud?=
 =?us-ascii?Q?g+twh2Ir2z9ANN/lsrVxLxxdKNHgzj4xFdleBw3dveiDXWTQU9FTt8B26WnZ?=
 =?us-ascii?Q?DiObYD6VegyrEuUDXOuYAgVhoIRQyfKrEkol/ckEkJAjwN+W8Qw0CjbfbFAI?=
 =?us-ascii?Q?uozOZVcEnFk/O15eievifmjvGe5NosmVDEAyljrni3N3jkU1g2PzsaX/XjvO?=
 =?us-ascii?Q?FOa/im2GflPB5x0Izyj1UAmecpDi9FD34R9h2ImSZamVAIfYU3DPc7DRm5Gh?=
 =?us-ascii?Q?JMq4jbZ1G23Ugq21BmFtFh9Done4Rj0KURCH/QMeQk4pijXGpAXH54uGRnjb?=
 =?us-ascii?Q?VA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ead3aed-078d-41da-e9e0-08ddde72d1ec
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2025 16:18:08.8034 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WECJT9OgW/E55G/yN+XWFasuODtYvEGGCXNook+8gzJt+liS8y75/c4c01nPd03dAxTD2/Xcz0n5PadDt2S48EtBpEnzNITDW+GJpJA6TiY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4972
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

On Fri, Aug 01, 2025 at 08:13:46PM +0200, Michal Wajdeczko wrote:
>We already use struct xe_pci_fake_data to provide custom config of
>the fake PCI device and soon we will be using thios struct also as

						^^^ typo

>direct parameter for the parameterized Xe KUnit tests.
>
>Add function to generate description based on that config data.
>
>For platform or subplatform name lookup pciidlist which already
>have definitions of all supported platforms.
>
>Examples:
>
>  TIGERLAKE
>  TIGERLAKE A0
>  TIGERLAKE SR-IOV PF
>  ...
>  PANTHERLAKE
>  PANTHERLAKE SR-IOV PF
>  PANTHERLAKE 3000 3000
>  PANTHERLAKE 3000 A0 3000 A0
>  PANTHERLAKE 3000 A0 3000 A0 SR-IOV VF
>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>---
> drivers/gpu/drm/xe/tests/xe_pci.c      | 101 +++++++++++++++++++++++++
> drivers/gpu/drm/xe/tests/xe_pci_test.h |   1 +
> 2 files changed, 102 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
>index 81bc86647499..5c6403785984 100644
>--- a/drivers/gpu/drm/xe/tests/xe_pci.c
>+++ b/drivers/gpu/drm/xe/tests/xe_pci.c
>@@ -12,6 +12,107 @@
> #include <kunit/test-bug.h>
> #include <kunit/visibility.h>
>
>+static const struct xe_device_desc *lookup_desc(enum xe_platform p)
>+{
>+	const struct pci_device_id *ids = pciidlist;
>+	const struct xe_device_desc *desc;
>+
>+	for (; ids->vendor || ids->subvendor || ids->class_mask; ids++) {

why ids->class_mask? for xe we should never match with vendor set.

>+		desc = (const void *)ids->driver_data;
>+		if (desc->platform == p)
>+			return desc;
>+	}
>+	return NULL;
>+}
>+
>+static const struct xe_subplatform_desc *lookup_sub_desc(enum xe_platform p, enum xe_subplatform s)
>+{
>+	const struct xe_device_desc *desc = lookup_desc(p);
>+	const struct xe_subplatform_desc *spd;
>+
>+	if (desc && desc->subplatforms)
>+		for (spd = desc->subplatforms; spd->subplatform; spd++)
>+			if (spd->subplatform == s)
>+				return spd;
>+	return NULL;
>+}
>+
>+static const char *lookup_platform_name(enum xe_platform p)
>+{
>+	const struct xe_device_desc *desc = lookup_desc(p);
>+
>+	return desc ? desc->platform_name : "INVALID";
>+}
>+
>+static const char *__lookup_subplatform_name(enum xe_platform p, enum xe_subplatform s)
>+{
>+	const struct xe_subplatform_desc *desc = lookup_sub_desc(p, s);
>+
>+	return desc ? desc->name : "INVALID";
>+}
>+
>+static const char *lookup_subplatform_name(enum xe_platform p, enum xe_subplatform s)
>+{
>+	return s == XE_SUBPLATFORM_NONE ? "" : __lookup_subplatform_name(p, s);
>+}
>+
>+static const char *subplatform_prefix(enum xe_subplatform s)
>+{
>+	return s == XE_SUBPLATFORM_NONE ? "" : " ";
>+}
>+
>+static const char *step_prefix(enum xe_step step)
>+{
>+	return step == STEP_NONE ? "" : " ";
>+}
>+
>+static const char *step_name(enum xe_step step)
>+{
>+	return step == STEP_NONE ? "" : xe_step_name(step);
>+}
>+
>+static const char *sriov_prefix(enum xe_sriov_mode mode)
>+{
>+	return mode <= XE_SRIOV_MODE_NONE ? "" : " ";
>+}
>+
>+static const char *sriov_name(enum xe_sriov_mode mode)
>+{
>+	return mode <= XE_SRIOV_MODE_NONE ? "" : xe_sriov_mode_to_string(mode);
>+}
>+
>+/**
>+ * xe_pci_fake_data_desc - Describe struct xe_pci_fake_data parameter
>+ * @param: the &struct xe_pci_fake_data parameter to describe
>+ * @desc: output buffer with minimum size of KUNIT_PARAM_DESC_SIZE
>+ *
>+ * This function prepares description of the struct xe_pci_fake_data parameter.
>+ *
>+ * It is tailored for use in parameterized KUnit tests where parameter generator
>+ * is based on the struct xe_pci_fake_data arrays.
>+ */
>+void xe_pci_fake_data_desc(const struct xe_pci_fake_data *param, char *desc)
>+{
>+	if (param->graphics_verx100 || param->media_verx100)
>+		snprintf(desc, KUNIT_PARAM_DESC_SIZE, "%s%s%s %u%s%s %u%s%s%s%s",
>+			 lookup_platform_name(param->platform),
>+			 subplatform_prefix(param->subplatform),
>+			 lookup_subplatform_name(param->platform, param->subplatform),
>+			 param->graphics_verx100,
>+			 step_prefix(param->step.graphics), step_name(param->step.graphics),
>+			 param->media_verx100,
>+			 step_prefix(param->step.media), step_name(param->step.media),
>+			 sriov_prefix(param->sriov_mode), sriov_name(param->sriov_mode));
>+	else
>+		snprintf(desc, KUNIT_PARAM_DESC_SIZE, "%s%s%s%s%s%s%s",
>+			 lookup_platform_name(param->platform),
>+			 subplatform_prefix(param->subplatform),
>+			 lookup_subplatform_name(param->platform, param->subplatform),
>+			 step_prefix(param->step.graphics), step_name(param->step.graphics),
>+			 sriov_prefix(param->sriov_mode), sriov_name(param->sriov_mode));
>+}
>+EXPORT_SYMBOL_IF_KUNIT(xe_pci_fake_data_desc);

our dep here to be in xe.ko seems to be pciidlist. Would it make sense
to simply export that instead and then move all this into
drivers/gpu/drm/xe/tests/xe_pci_test.c? There some potential name
clashes. tests/xe_pci.c is more to export what's needed for the tests
than to add helper functions like these.

Lucas De Marchi

>+
> static void xe_ip_kunit_desc(const struct xe_ip *param, char *desc)
> {
> 	snprintf(desc, KUNIT_PARAM_DESC_SIZE, "%u.%02u %s",
>diff --git a/drivers/gpu/drm/xe/tests/xe_pci_test.h b/drivers/gpu/drm/xe/tests/xe_pci_test.h
>index 32452bd65bff..1195839999ab 100644
>--- a/drivers/gpu/drm/xe/tests/xe_pci_test.h
>+++ b/drivers/gpu/drm/xe/tests/xe_pci_test.h
>@@ -24,6 +24,7 @@ struct xe_pci_fake_data {
> };
>
> int xe_pci_fake_device_init(struct xe_device *xe);
>+void xe_pci_fake_data_desc(const struct xe_pci_fake_data *param, char *desc);
>
> const void *xe_pci_graphics_ip_gen_param(const void *prev, char *desc);
> const void *xe_pci_media_ip_gen_param(const void *prev, char *desc);
>-- 
>2.47.1
>
