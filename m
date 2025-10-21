Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48308CCD1A2
	for <intel-xe@archiver.kernel.org>; Tue, 21 Oct 2025 02:08:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D02D210E049;
	Tue, 21 Oct 2025 02:08:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZAj6xxAj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7E3B10E049
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Oct 2025 02:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761012519; x=1792548519;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=rg4aO7IyqaRx3R2hnStECpyO+hQKRiWvWXdZXdx9l+8=;
 b=ZAj6xxAjZ3hi7Yy8hEq4tgnBE+HQZV9cU/XXl4au8BlpKYbxroGQwDuH
 JCe1FqN80KC+uVTdqubb6GrMapDkfsw+s8LXbwW4+g80Yoks161ScvV35
 B01sMwg8kojgNKAYSpGC1RFKHA3b6uT3dlik38X1e+wAk475TamEwCkEh
 nmom0wHZADn+c/NHJjsPiDeEg8RV/+mdzgiNGU589ASedpNyl3jgPj8B0
 2jc0DKLTCLatMMFa+kLMaQtJ+tOjTkAKUkwG+pr7LYa2uVmYLgp5SIPCt
 q9ik2Nko2Vl1mlD+OsKvdvX1IPzo85+2sK2ibYrXMjeq34rrTl/wUmt5V w==;
X-CSE-ConnectionGUID: mlV4PgXoR1+LBIiiepanMQ==
X-CSE-MsgGUID: /3XfdetkSlmtDeTBC8tk7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63032832"
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="63032832"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 19:08:38 -0700
X-CSE-ConnectionGUID: O4bRfQpCSv2OVAEQ5S+69Q==
X-CSE-MsgGUID: bH5hPY7URMKsBOflG/F7DQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="183180090"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 19:08:28 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 19:08:27 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 20 Oct 2025 19:08:27 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.41) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 19:08:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lO9UdTplcBrFCFacifuvsvoyRXKLwKN1IhpQXRjU8PE/S74phDawJUhPx4Zpy4jTv2g/aEhQ8APVZ1gXVoP5rF3yRasDxxdcrbdEeKMm7tfGaTaDowjZN9D6YhI/5I2eSpYtH1NOgk8Bg98MdMpq65r9F4vVX5QFFuqASl65syX9N47iVosKY/zTT8P9nmvseUrmtCSyloBQxSqCiEh0sI2T3k6hJuteNHukH9ba7EMQwBHFtbDENwDoNCRQAxa7g8y06lr5AQcc8haLLGrl+fpwkCNWnlO20aTkNGnX0bH+AwQyJGdZ5SyTpPPfG+35NRQONb5CrdIkOU4Oa0IBPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mHNFhBy+zW2h5ZVLAhtdcAnLxtBoKOeqSFEaePx/UVU=;
 b=UDHwzcq7TQr69KL3NbckCEca+47OT5ovkiRtdBnqAUld2wQ6Iiuc9Qcmr2l/XGJpr/1m9GknYXxu/ldMUbpocjNnFJ2lmIrODD+kaZeqgUbNTA1R981OW4pcgAM3ctg7v9n25SkviSeWaP+xKq4T3Dz4+yuCOBxj5cfz1gZjU0hSVNyO6fe+PyhU7T12EMx1vBEgXMVVtGmMDuMnykg2zjQLck1CPzuMNbNxgX6braBCnOZMJKdQ7dd54GzlvSu/44DYbPv+PVdp2XzX0gqR4/DO16JFBqFPocbloOF6cBb3AZslYMP9l1/0zhSt7WEg8U37MgqPlNllu7N2BoYnRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB7410.namprd11.prod.outlook.com (2603:10b6:8:151::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Tue, 21 Oct
 2025 02:08:14 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9228.015; Tue, 21 Oct 2025
 02:08:14 +0000
Date: Mon, 20 Oct 2025 21:07:47 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matt Roper <matthew.d.roper@intel.com>, 
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v2 1/2] drm/xe/tests/pci: Convert GT count check to
 general device check
Message-ID: <iy5fneu7goe5dzqmawkkep5pdtkbr5xn5s6oyqklzm22gdsul7@25wccgtulxgk>
References: <20251020-xe-kunit-dma_mask_size-va_bits-vm_max_level-v2-0-27b03971bc7e@intel.com>
 <20251020-xe-kunit-dma_mask_size-va_bits-vm_max_level-v2-1-27b03971bc7e@intel.com>
 <176100466430.3231.16362806979991981230@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <176100466430.3231.16362806979991981230@intel.com>
X-ClientProxiedBy: BYAPR05CA0043.namprd05.prod.outlook.com
 (2603:10b6:a03:74::20) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB7410:EE_
X-MS-Office365-Filtering-Correlation-Id: fef5554a-a51f-48e2-60d9-08de1046b112
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PvcgGVJOLjIzt5iV+1fwaAYdblninuNu/l5TAW4XKYPVJyspigKy7aYx3Jto?=
 =?us-ascii?Q?zfuJc9zY5VWmdeR0Ovi/IbK6rWGxin09CkPd+pJx7/EyVSk+U5qiWwLiiYdf?=
 =?us-ascii?Q?+EOSpnOlrezqE2MkaDiNVIGj2f6ksucecvg4ULYaU3Biy5GH0CD+HWOHcOw+?=
 =?us-ascii?Q?r7dEuVULH9Ee+Rl2gC30+pcZ1n8bRk+ybcn1lQOjcztULz5guL1+kQQTTUbH?=
 =?us-ascii?Q?FxielExWCf8zZQHs9ETOZwph2d8QwhnKuOIvDtIPKN6tBswmgdBqfvU9SdpN?=
 =?us-ascii?Q?ZEtM+V15075IX8bfnBOYsMgXhormAwguXb2GSKIyEaKZGNOZ8DDAUqBJNi/9?=
 =?us-ascii?Q?ZsHlSC/vb9CpjgbX7X6zvRcKg6tQnKfvkDVkMhVyjjha7Ms4Xb78jrNbvI+j?=
 =?us-ascii?Q?o/suuwvbRCDA0Dy0hc4yWJD0K6lEsMSMwGF4E+WRPNTX04TQA/cIejcTMXGC?=
 =?us-ascii?Q?w3s39He3XGBIwOqHZl1ZVKniSezjejwe4SAuQ403TE902oDK3DmfQdlHCh7F?=
 =?us-ascii?Q?RHEf46Jn/D4Dd+IxNwMRCM35bEhSt+dZ85Osn3stFyHVNN9QTTL6qHfpoZVW?=
 =?us-ascii?Q?jAQHaoEiaucx+htFKGuE9+cwVxVyHFHqV1ceMlvGd3btKNHOXDfo+mDG5Rtp?=
 =?us-ascii?Q?4vmjRLF+ng+L9KvZHr0kmJMbAgZmXJR6PCJqgL9SPcYWKYjMTpYq7E9/ZPif?=
 =?us-ascii?Q?SOCLn/y1rCO4/QuFtVieAEHoDIFBUxeze+Gw03yvUUZAzzmDzsnDkVFNN9Ke?=
 =?us-ascii?Q?izWg/8H8ViJdEA49i14p7ctBSUqAGqze4pMol2saCDNGZWwLwFbBAg0Gk/2Q?=
 =?us-ascii?Q?Y8VexFJtmeuS+vlclaxWSDXfEVLwxXaY0MXPcmN/tOcBGtvXowhjjeuA8GDQ?=
 =?us-ascii?Q?7pGHCeNFbAjl46v++7aN2Khog9iPLG7Aoc8IFGIXVt48trcJQlHtbQHB/LTs?=
 =?us-ascii?Q?e8sOvyqemUHtndu0MAsOwlYHdWyPQg3ayLzjz6PTbVfv0guXxF4H1+ry0Yv1?=
 =?us-ascii?Q?915H01Tq8YzNGjcZBShd33ZAGnPxkYHQ/6LtReIcw0SVb88hxoj0TigVx2sA?=
 =?us-ascii?Q?bbKvSiQVk7lPRamQF+qbdS6jxoYPxVPF20Csy05708TTHqUsqWNxRSYmfYMo?=
 =?us-ascii?Q?WEdKEGTken7qegC4i3hGCoyBYGsgolYcBA8HWUqiDvTmkR26e2g7VUq3NEh7?=
 =?us-ascii?Q?lYHjMyxBH734Xgc4+Hav3M6eN9oT1ZVMqHiQoydmdPgKWi7coAGTFKuLDefP?=
 =?us-ascii?Q?Uwwz3LjTlmbwofyuFJcUaFSIB5QptixEPKU/xBii/dGYTkrRluobOHjIe8eq?=
 =?us-ascii?Q?s4zizzSmUzRRYZoXkZepo/LKsqxcdO7BZ+W6rSfu6BUb6RCRDtCaWFaJXgY0?=
 =?us-ascii?Q?jqUfrmtnhGYoRIXIACwKSPpm8I10Whn72V43PYqNlYIuHql/R1GUUui85QBn?=
 =?us-ascii?Q?bn4NlbpJrVfDBD67SdikFeJbkttOqbre?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2sLTv7uz4FNdNZXi6X6gqwgaotFgUCFF9Pa3uUThAd2deBr42zr0MX69RNqM?=
 =?us-ascii?Q?HVKg5eH9g4eYPh+ZJc8LVHPvGpAWwPx0WNKJ0q3S7CxD+Nto9rlQtfHNET9N?=
 =?us-ascii?Q?JKX+5PwG5GArYobnWbLmmHR3EdZhUXvMVte/dMmiM6FtNfxXzfMadKy0sG1/?=
 =?us-ascii?Q?dZKX31ALtIlgo3+owVyXB2EcCf5L3VSLgRQaKGACkOHkHEcBzyo2azN/yYJV?=
 =?us-ascii?Q?OJ1YMNK3hCtfAr6feAfD/C7pX5b7gXyN9Fk8G+vN3gfWIvqEg1VfXjsnVZue?=
 =?us-ascii?Q?9n9RZhT3BytgrcVDwLc2PcIZz9xtBlc0K4J1ZcqxZCdv2OzJhYBM814hWhA4?=
 =?us-ascii?Q?t03KKHm+fp5Q4M172PprBWOBopNoy223SIge0gApVEEj2wnhnpPO2HLM17ym?=
 =?us-ascii?Q?Y5zC8oSz949Q6KUUgbNdFAlIOd4sSm8IMH9aoM6XIrXs2HoVD9DZuhZlhjxO?=
 =?us-ascii?Q?jUGGalMqy6XDhMo/0bukoyxPG+ZIO7oJXn9WQlFN3cxWrwM3LTOAi2Ju3NId?=
 =?us-ascii?Q?/ZBEqH0T6XY075pqrY2HjkiS6l9BZIRa9UDFku+D8rfsuyZXMrMdV86m99mT?=
 =?us-ascii?Q?IRoRZhS5lIAvkv8QYOsTTBezOkLtUiXjOh+5jfRfc1xZnfgIbMUgut+m3zqm?=
 =?us-ascii?Q?sB6P54xUXKLLtUAjcU/A2tdmaxecAeGEEHyATz8eNwUCqSD1+Gz8Cvw10VD/?=
 =?us-ascii?Q?lzT9pKTZ/w6fqMKyJYPDeHSvFd5J7XOVHTFh5spw4AJ2L6sGMFFAGEWz9Tly?=
 =?us-ascii?Q?ynbqa6FjpkRMzsVr+eI4GuTDlNezUfldXacdF8mtlHB/OlgPTj5sMgqMxmgC?=
 =?us-ascii?Q?4362Csk8Z0otWuaH9Jvbn9CxDWQEvZg9L4gndVpmYSaOJHEe3WevcpJ9oxTd?=
 =?us-ascii?Q?TRNJAoz/JuQ15EO0hESSPGlBM9XTyBJnNaRhIEZRPIupwpcRRnAFoY2TL25D?=
 =?us-ascii?Q?pA8DjZipAIPewP1M2e8x+1VUDO/VNLKWd9aKysxUaDZwT5/AGQVbGC5Nb8tz?=
 =?us-ascii?Q?vC8XBXF3kqTKmL98pcP9AL7wXhggoMevjfLug2Vu40blJMlYKQfZupxNLNIT?=
 =?us-ascii?Q?kzGHHXcN8Zrb36Pd7vfqQ5nJMURrx9ysYtA9m0U//96Weff4c4u9P9KDYiTv?=
 =?us-ascii?Q?V9AON76xjECaZReAGjzUMS6saXzpIRvaBiilLZPiltWa15nYf13p/E20Dy5N?=
 =?us-ascii?Q?a42mlDwq1gXSqDoAo+ZQL18NrNgOQWEtPMekMmQcQKS+KZ2PWDdUw4mwy3WT?=
 =?us-ascii?Q?Fppqe4jjx4GPZ0GM0KjJjC/o5CsmZsR+iYSRyxyy1t9Zo84hw5d3RydweicG?=
 =?us-ascii?Q?wniiqBzUNnZzftAkuYvxRJa5nng+4rAaP5Nuqz0DasgIXPOm4EryU2rDPPSX?=
 =?us-ascii?Q?cta3nrjYcQoFToteOIC0DWc5csDd5FXtNzknzsC68tYz/KC5KslLuJ6RFPI0?=
 =?us-ascii?Q?sgX2//pxWGT/k033Fxix0q0uaBw6ZCrthmsyeXO8yHhP3Avvz96wltEfV7vn?=
 =?us-ascii?Q?it8BtCDJP2FX4Xt7CuaMdix3OSZCDCN4luYe652V1YyFGt10waO0N2626p+N?=
 =?us-ascii?Q?X0E9G4JzQTfraHDzNPSFx/3lbvGr2CkEJEPCICYDc6shXSWhLRmF6PymhoSc?=
 =?us-ascii?Q?tA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fef5554a-a51f-48e2-60d9-08de1046b112
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 02:08:13.9449 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P57wUQktj3XljNTUO+5TsDcXVc7i+Pn/yTIxXqZo1zavODXwNpZrBrvYawTD/FLeLcQI05q9X3BvX6qWM57hTtP72Oyso+nwaKLmaJDWA/0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7410
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

On Mon, Oct 20, 2025 at 08:57:44PM -0300, Gustavo Sousa wrote:
>Quoting Gustavo Sousa (2025-10-20 20:45:56-03:00)
>>We already have check_graphics_ip() and check_media_ip() as general
>>functions to check the IP descriptors.  The check in
>>check_platform_gt_count() is simple enough such that we can convert the
>>function to a more general device check.  In an upcoming change, we will
>>also add some checks for other members of struct xe_device_desc. As
>>such, rename check_platform_gt_count() to check_platform_desc().
>>
>>While at it, use inline (unsigned int) casting of max_gt_per_tile to
>>keep checks for each member localized; and use KUNIT_EXPECT_*() variants
>>of the macros to allow multiple issues to be reported.
>>
>>v2:
>>  - Use (int) instead of (unsigned int) casting. (Michal)
>
>Whoops. It's actually the other way around.  I'll fix it when applying.

or just follow the kernel docs[1] and don't add changelogs to the patch
themselves.

>
>>  - Use KUNIT_EXPECT_*() instead of UNIT_ASSERT_*() macros. (Michal)
>>
>>Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

[1] https://docs.kernel.org/process/submitting-patches.html#commentary
