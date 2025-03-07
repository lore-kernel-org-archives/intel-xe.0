Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3208FC282D1
	for <intel-xe@archiver.kernel.org>; Fri,  7 Mar 2025 03:05:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E63C310E088;
	Fri,  7 Mar 2025 03:05:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LD1cz62b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE1AA10E088;
 Fri,  7 Mar 2025 03:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741316707; x=1772852707;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=bdu3pSXvWKgaZE8hvWg4GHboq+ihYVgPpHwb+xDZTQQ=;
 b=LD1cz62b5iZSlVBpAtLVNL/cGUsLGwdNJK9+h9IiJ15KR6fGSJanCRwD
 J14p29S5nxx1hgebf+BrHOd8QiMJHKsatYONLqeM235GR2zQuLKjxVvRQ
 1iAVY+j3OsqoQkarCYg7caDr5snNeiXE4mUrrcgNUHVTnLBu5n46Ox40w
 tDKmkFKWkrClMvXp1Eh8QIZeT49Cby9spATSTIMpYs5DhoxlPk+j24sSU
 UllT4SAOSOejtkuZ1RJIRwIvH+b7gtcR0A/EK+NBd5ogvw9+UIOAvFhzg
 78lxOVvmmYpOjjYfTv8SGC0LfdexxjlOXCUyzlnSXBbi5KgeK63/P9rl4 Q==;
X-CSE-ConnectionGUID: ZrohKBXXQm27QNQdztgKVg==
X-CSE-MsgGUID: GIwsgU5ITBGdCJSwUoTqRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="46134486"
X-IronPort-AV: E=Sophos;i="6.14,227,1736841600"; d="scan'208";a="46134486"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 19:04:57 -0800
X-CSE-ConnectionGUID: MBwbL9EzQUqnmBjScuQUYw==
X-CSE-MsgGUID: 7SGAYgxYQXO3LpwuOGY10A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,227,1736841600"; d="scan'208";a="119210199"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 19:04:56 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 6 Mar 2025 19:04:56 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 6 Mar 2025 19:04:56 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Mar 2025 19:04:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TcFtmIpTUyw5cmE+9KnRoE8ROV6JmUwVE23M3zT++GJ89qjGSRR1iGhAbOCdGi+dcaplrGl7+Z0wKo6iO3Dy551d7zecqzWX4CnRbUIMZMmQJ4HXVYdKHR6VPBC3uK9S6hjyUsZr3FNFlKsAawHM5dM/YgmA1djCvmGSegzjvNwDg3APIRCG/q7fV+dcyWNrXDPPnewxk4lXlyMjirDTxNy6/FBY0NNn0Way73wAmtWFQyScqERFN2QvnLtITFiOPuscKKzSB9qjGxeBYedvyjJJBQDsDrHet8xKgdIyLut0u9e3T+5Ese/3weSlCflizdVJGRGPU8hcpKtS7J8Ksw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XYUp3wrMiiZkzeP+L5ikj4h+plxKphk0LHr/OV5GElY=;
 b=vEguKytH9ETx1YOD0YS2uTa3GJmB4UvZl3e6VmUSiX/gBGgC0mDpPuoLr5ha8vYbmGm70NStOBzetPs0FQ/L+94EY9WHY2h5V5iy3XnW6HKuR1Udxn2XebE52+r0FbW/jabeFLhobxgd5B4u9FTraqZIdzBABxe0b+HWrHL1jpBGFnJAszWLlSic6AksMOpMsDTsd8eFcdXYx5QWKeod5S8Cb1Tx2H90Px5unDka8scTKLy00HThjKq31C84biaCpUtrMj98jqLT7fJFZmg3g7PCCI6s+5yI8s4ymkSI5Xmgehw6mZAiFoXdx4i3C1yiTlhc/ZqCQUd9r/Hhqcm4AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY5PR11MB6319.namprd11.prod.outlook.com (2603:10b6:930:3d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.22; Fri, 7 Mar
 2025 03:04:48 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8511.017; Fri, 7 Mar 2025
 03:04:48 +0000
Date: Thu, 6 Mar 2025 21:04:44 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <I915-ci-infra@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIENJLkJ1aWxkOiBmYWlsdXI=?= =?utf-8?Q?e?= for
 drm/client: Build the tests with CONFIG_DRM_KUNIT_TEST=m
Message-ID: <ri5jmtau3vivcirk44scyhwcdsbfcvpz67ugqgtxh2v6plvbcm@tbihorldmyok>
References: <20250303094808.11860-1-ville.syrjala@linux.intel.com>
 <174099615126.85071.11536405173709166652@b555e5b46a47>
 <Z8WgdR0W_P2QCPxQ@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z8WgdR0W_P2QCPxQ@intel.com>
X-ClientProxiedBy: MW4PR03CA0055.namprd03.prod.outlook.com
 (2603:10b6:303:8e::30) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY5PR11MB6319:EE_
X-MS-Office365-Filtering-Correlation-Id: 250d7b00-3385-40f4-ef4f-08dd5d24d21f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|27256017;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?ceeALjubiugL0lwjMD0dNSqzNNdlWZ0kKYfDGNbOZ031i9jI+i/y8eqgxW?=
 =?iso-8859-1?Q?Xn6L/M8RpGIYOODqBTKk2qNox9U5Q6k9zPlZ4bzuIzYLDSKGgwKfUijw2A?=
 =?iso-8859-1?Q?k6o2ohN+00PqkMQuq70mflBW8aQAmUoriPp9USM6wsqLjmJWUFiW7T9okk?=
 =?iso-8859-1?Q?Gts5IEjtKhhnKxolbDzXHUBOMDPafLj0T1ciMSlPz7WgEiHc2cZ64rnGc/?=
 =?iso-8859-1?Q?OqHmWE8Sev8f26V2c0LisKdpiV+9SiWt6VaJCBf8hBoY8DJdA3iZ6GGOiX?=
 =?iso-8859-1?Q?grNjC1F8sV84s+He0mzUN8xqufiw6nUuqc4xFA3ECXkhIPpyU1z14vg9zp?=
 =?iso-8859-1?Q?9tBKmoHV0su9fnnhAIxBaoqZM14BsQKyjXkRUXglTnRiDacMi6da9N0CUq?=
 =?iso-8859-1?Q?1L+RoibogVnncTbBtk78WoTWDHIu3p9X3UqEAToBqVyvLmmQ97oJb4gyFD?=
 =?iso-8859-1?Q?W7ljUKuUGIx3fOO4q0HVgREwm+rlrOgjHN10WD/OUYKzYEbl9GH3j/IQ7h?=
 =?iso-8859-1?Q?L3Jy2T1xEoGf/+VYePI5s8EpoHpVUac2T2Dj2GNJlYnkk7j+XL4R5vILzi?=
 =?iso-8859-1?Q?DGU6hSXdDIO/keujAVvSXKZSa4pZBY1WQVnFuCtsRSTPIVD1SkFGVOgWKq?=
 =?iso-8859-1?Q?FvV2PIGq81cBICgiFBR4VatzgUxOmBYfNNagEKSgyD2NrNzl2pDXQp67HI?=
 =?iso-8859-1?Q?OFD0q9mxXYypSaggygRFazHBSblvnwF959IUrVBFBB+ieiAWGwgOwdznEl?=
 =?iso-8859-1?Q?qUgLVhb7L0LCmkGET/M8NOvp+gcR0y2olZMNG6M/WqtprsTrrKBfr8ME/m?=
 =?iso-8859-1?Q?eD6Lj5Q1C5ZJEwHu3/oXUN4efZBAX9AqD3eDyFWahXCkBzsDipwvQ+DRcl?=
 =?iso-8859-1?Q?Hehr2R32Yk8qOPPj7VaWDMA/bP8kOic6yncjp7NUKeDQ3YP/qRxGY3aUCQ?=
 =?iso-8859-1?Q?9deLnLXjKyqai9vIFKTM16RYIvNMZbBSEE/KwW12dsCGqT3mntnl/NRlNt?=
 =?iso-8859-1?Q?fPsINnmgzohG9E7HyYdN1mBqWBxSfuwiYjXw5WiIQJ2A+N+KSdO833rhXe?=
 =?iso-8859-1?Q?1x1JKxRErMwUm+qQR16NMXPWVAaBUuRQs3uTe6icUxQlwuloppBa8KE+2x?=
 =?iso-8859-1?Q?0TLVmldGe/8T0bfUTj2eYls3xdNb9N3zxtP5oI2Y0dkfj5Zof7QJXXa7ou?=
 =?iso-8859-1?Q?aLHWYkniSyxZeLIMkPiVZK5DsoV/EKqhCsHzdYxo0pd8FkoLAFKwlINESh?=
 =?iso-8859-1?Q?fiMQgF17oALHw6SQNLG3FO+VK+AW94hX7rxEr9RjpoGIaWnpZf+sGTItu5?=
 =?iso-8859-1?Q?MsKuOIeL6FnXlpigbdnOS44tTU1R32qL6JAaseB2TF2IF7+ne8GFLRA7Ct?=
 =?iso-8859-1?Q?e1Ts8TtkUB/lmoVMZKQ+SbYyxYWGoLAJm7TpOdy9xtIt7qzAS5XwU4fzPO?=
 =?iso-8859-1?Q?uW/dMxrMaCu6pYk8?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(27256017); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?5HDTiWbtbo0HOFdKHCyGHRU5fmzG+lYMEaqQg9DKhjLU8t4xrCgWdAlaEF?=
 =?iso-8859-1?Q?nN30FleqNnVp4iHxBbE2kizxqux1elu718l6aew/vEG3NKiOnW4C8XgV4z?=
 =?iso-8859-1?Q?DrRQf7fdQVHeRK0DLvrbDw+x0U/q3Vn13FH2PqODj1Ix0fRIPP7IxxACtw?=
 =?iso-8859-1?Q?W9sBLF/LTpgJeZMQ6uGSU8A8hcWMBiGR3XsnY7aFYOb1fn0DzCUWWXlS2z?=
 =?iso-8859-1?Q?1h9vY0IsJmKVpDKm2h/qPyL8cNUNXzUn2XqVLOIbpQHDp9AQmxI9KOha6b?=
 =?iso-8859-1?Q?e6GG9Yj0RMpI1OuJ2n+ujM34IJ0XshHSFqdXkl4dLKdzUxVDR0vWq01QAL?=
 =?iso-8859-1?Q?GiXtqlyAipwpQGtcRVVpHj+pW2BWZDnrVynDOXGLSeVxKjuXQ4fCOI4A25?=
 =?iso-8859-1?Q?gjtB9I1NRlS5zVpcK749Z4daxgBOTCcvbuHCul4qJbu8ykxoQin1Ojfk5B?=
 =?iso-8859-1?Q?LmF4J5wDPGiksI7i4uKZT9i6BgeBMLB/HBQne6haLdq8U0P4+6IGU93Fcp?=
 =?iso-8859-1?Q?maNiYh3rLWNxSNQhfDNKx0aoKc0A2AhhtBysCrpgAwY36/7Pvk42klQ2hM?=
 =?iso-8859-1?Q?ihpLiiDvPN+8eirj7EYvhURI37rTuCedC5eBkhgCbacixn6C7EJakCvWZA?=
 =?iso-8859-1?Q?ExgUSwRh6gUowQh9Ka8bEL9iqywTvQbO/8gwWRXMYA/izsz2kwxasblKAd?=
 =?iso-8859-1?Q?lW/s7c2IRwiUmbotdCyL0dsFcv8wcGrBzgLnZQ2fG44fHVPnymhuaaheVp?=
 =?iso-8859-1?Q?GQAS2a+pH6dRP/IJnZy1WCNjCG4hdlSfmvU4+weqMXZ+0mfiNrsd9YW2uD?=
 =?iso-8859-1?Q?ga0Ou1Sd0tbkD2oBvHZ+FgbkUnyNjJ5NAL5c/bx5zmB+n8zBF9+jJKvQnG?=
 =?iso-8859-1?Q?X/NMpLWDCGZPnTx1csfAojTRHpfYKidUQR92yAUu/r0FICWty8ucBDMbYL?=
 =?iso-8859-1?Q?gSSFtXl7Fkazxr3YA40BRjXL7+aE2OpQlF9PMNS9YqkruVyEMcPgR0kCxO?=
 =?iso-8859-1?Q?H+L2bap5AlHwIIXImDEmdKQxy+TEuEOpPvPwwtb8wljxuMeHB0uQvMZ+wF?=
 =?iso-8859-1?Q?0eKZfR/KPgUrt2vBKYMbVB5P7n/2tRlAoXSMJhGaED/enqF0yPKYxtYwHn?=
 =?iso-8859-1?Q?Tv08nQNodpgSRl3/T4Cxw3+T3aoQMfoYAMKDZ9kXiMmiPlV3dya0MsQDbr?=
 =?iso-8859-1?Q?mtTQUREGTig1SN+mQ3she2LvZVc+RHUZ60MCCmXRW9ZlwdXiLiLbycxY3q?=
 =?iso-8859-1?Q?2ZCW3VPhvhL2ZNYN/htfl98tp2ApQK5wSqy4qQ/FU/lesHQgp9KnI9ETjw?=
 =?iso-8859-1?Q?t8fJJfd5RFtZJGQZQhLuhIzTamf+7fKkpWLkQub1W8+SjyTEGhFL7DwhoJ?=
 =?iso-8859-1?Q?xPcDhsTa1Ru3ThiiuwpJwyRNrhFqi3P2pyj0uKYduAzfu8NzaEHF+HPKJ8?=
 =?iso-8859-1?Q?ECMfRfPLvk0fCoMHRJlBJr4UTusAX4HAnclZWB3F+fKs4B6gocaIcDDda5?=
 =?iso-8859-1?Q?VAQBwm0NbeMaLaEXXXAGMO557jahBMYBwN8pLsKpFa2mJ2rp0nMzZpRCgK?=
 =?iso-8859-1?Q?jGLC+eCST7pBMudjcULMCOJLFJetSWt9Y2CFF4GXsP38mXq5weFQ+tfCPL?=
 =?iso-8859-1?Q?XOyhJzZEda5lIzohs7RPMoNSE3yhOe9ZKOa4mba6TlAfdGO/+115Kv0Q?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 250d7b00-3385-40f4-ef4f-08dd5d24d21f
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2025 03:04:48.3650 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u1rPDUlqG8ierTcZ2xVJtJ3ZgIV1JXi2tC60xCddGD1RW+Yaz4o/fcGS20v4Ca8uXHwoHyFlflU37T8IjCSLA5MOtotmb2c/LLdXxgvoh3g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6319
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

On Mon, Mar 03, 2025 at 02:28:37PM +0200, Ville Syrjälä wrote:
>On Mon, Mar 03, 2025 at 10:02:31AM -0000, Patchwork wrote:
>> == Series Details ==
>>
>> Series: drm/client: Build the tests with CONFIG_DRM_KUNIT_TEST=m
>> URL   : https://patchwork.freedesktop.org/series/145706/
>> State : failure
>>
>> == Summary ==
>>
>> LD [M]  net/ipv6/netfilter/nf_tproxy_ipv6.ko
>>   LD [M]  net/ipv6/netfilter/nf_reject_ipv6.ko
>>   LD [M]  net/ipv6/netfilter/nf_dup_ipv6.ko
>>   LD [M]  net/ipv6/netfilter/nft_reject_ipv6.ko
>>   LD [M]  net/ipv6/netfilter/nft_dup_ipv6.ko
>>   LD [M]  net/ipv6/netfilter/nft_fib_ipv6.ko
>>   LD [M]  net/ipv6/netfilter/ip6t_ah.ko
>>   LD [M]  net/ipv6/netfilter/ip6t_eui64.ko
>>   LD [M]  net/ipv6/netfilter/ip6t_frag.ko
>>   LD [M]  net/ipv6/netfilter/ip6t_ipv6header.ko
>>   LD [M]  net/ipv6/netfilter/ip6t_mh.ko
>>   LD [M]  net/ipv6/netfilter/ip6t_hbh.ko
>>   LD [M]  net/ipv6/netfilter/ip6t_rpfilter.ko
>>   LD [M]  net/ipv6/netfilter/ip6t_rt.ko
>>   LD [M]  net/ipv6/netfilter/ip6t_srh.ko
>>   LD [M]  net/ipv6/netfilter/ip6t_NPT.ko
>>   LD [M]  net/ipv6/netfilter/ip6t_REJECT.ko
>>   LD [M]  net/ipv6/netfilter/ip6t_SYNPROXY.ko
>>   LD [M]  net/ipv6/ah6.ko
>>   LD [M]  net/ipv6/esp6.ko
>>   LD [M]  net/ipv6/esp6_offload.ko
>>   LD [M]  net/ipv6/ipcomp6.ko
>>   LD [M]  net/ipv6/xfrm6_tunnel.ko
>>   LD [M]  net/ipv6/tunnel6.ko
>>   LD [M]  net/ipv6/mip6.ko
>>   LD [M]  net/ipv6/ila/ila.ko
>>   LD [M]  net/ipv6/ip6_vti.ko
>>   LD [M]  net/ipv6/sit.ko
>>   LD [M]  net/ipv6/ip6_tunnel.ko
>>   LD [M]  net/ipv6/ip6_gre.ko
>>   LD [M]  net/ipv6/fou6.ko
>>   LD [M]  net/ipv6/ip6_udp_tunnel.ko
>>   LD [M]  net/packet/af_packet_diag.ko
>>   LD [M]  net/8021q/8021q.ko
>>   LD [M]  net/llc/llc.ko
>>   LD [M]  net/llc/llc2.ko
>>   LD [M]  net/tls/tls.ko
>>   LD [M]  net/key/af_key.ko
>>   LD [M]  net/bridge/netfilter/nft_meta_bridge.ko
>>   LD [M]  net/bridge/netfilter/nft_reject_bridge.ko
>>   LD [M]  net/bridge/netfilter/nf_conntrack_bridge.ko
>>   LD [M]  net/bridge/netfilter/ebtables.ko
>>   LD [M]  net/bridge/netfilter/ebtable_broute.ko
>>   LD [M]  net/bridge/netfilter/ebtable_filter.ko
>>   LD [M]  net/bridge/netfilter/ebtable_nat.ko
>>   LD [M]  net/bridge/netfilter/ebt_802_3.ko
>>   LD [M]  net/bridge/netfilter/ebt_among.ko
>>   LD [M]  net/bridge/netfilter/ebt_arp.ko
>>   LD [M]  net/bridge/netfilter/ebt_ip.ko
>>   LD [M]  net/bridge/netfilter/ebt_ip6.ko
>>   LD [M]  net/bridge/netfilter/ebt_limit.ko
>>   LD [M]  net/bridge/netfilter/ebt_mark_m.ko
>>   LD [M]  net/bridge/netfilter/ebt_pkttype.ko
>>   LD [M]  net/bridge/netfilter/ebt_stp.ko
>>   LD [M]  net/bridge/netfilter/ebt_vlan.ko
>>   LD [M]  net/bridge/netfilter/ebt_arpreply.ko
>>   LD [M]  net/bridge/netfilter/ebt_mark.ko
>>   LD [M]  net/bridge/netfilter/ebt_dnat.ko
>>   LD [M]  net/bridge/netfilter/ebt_redirect.ko
>>   LD [M]  net/bridge/netfilter/ebt_snat.ko
>>   LD [M]  net/bridge/netfilter/ebt_log.ko
>>   LD [M]  net/bridge/netfilter/ebt_nflog.ko
>>   LD [M]  net/bridge/bridge.ko
>>   LD [M]  net/bridge/br_netfilter.ko
>>   LD [M]  net/sunrpc/sunrpc.ko
>>   LD [M]  net/sunrpc/auth_gss/auth_rpcgss.ko
>>   LD [M]  net/sunrpc/auth_gss/rpcsec_gss_krb5.ko
>>   LD [M]  net/kcm/kcm.ko
>>   LD [M]  net/l2tp/l2tp_core.ko
>>   LD [M]  net/l2tp/l2tp_ip.ko
>>   LD [M]  net/l2tp/l2tp_netlink.ko
>>   LD [M]  net/l2tp/l2tp_eth.ko
>>   LD [M]  net/l2tp/l2tp_debugfs.ko
>>   LD [M]  net/l2tp/l2tp_ip6.ko
>>   LD [M]  net/dccp/dccp.ko
>>   LD [M]  net/dccp/dccp_ipv4.ko
>>   LD [M]  net/dccp/dccp_ipv6.ko
>>   LD [M]  net/dccp/dccp_diag.ko
>>   LD [M]  net/sctp/sctp.ko
>>   LD [M]  net/sctp/sctp_diag.ko
>>   LD [M]  net/rds/rds.ko
>>   LD [M]  net/rds/rds_tcp.ko
>>   LD [M]  net/9p/9pnet.ko
>>   LD [M]  net/9p/9pnet_fd.ko
>>   LD [M]  net/9p/9pnet_xen.ko
>>   LD [M]  net/9p/9pnet_virtio.ko
>>   LD [M]  net/psample/psample.ko
>>   LD [M]  net/vmw_vsock/vsock.ko
>>   LD [M]  net/vmw_vsock/vsock_diag.ko
>>   LD [M]  net/vmw_vsock/vmw_vsock_vmci_transport.ko
>>   LD [M]  net/vmw_vsock/vmw_vsock_virtio_transport.ko
>>   LD [M]  net/vmw_vsock/vmw_vsock_virtio_transport_common.ko
>>   LD [M]  net/vmw_vsock/hv_sock.ko
>>   LD [M]  net/vmw_vsock/vsock_loopback.ko
>> make[1]: Leaving directory '/kernel/build64-default'
>> make[1]: *** [/kernel/Makefile:251: __sub-make] Error 2
>> make: *** [Makefile:251: __sub-make] Error 2
>
>This mail is completely useless. Can someone fix the CI to report useful
>things?

see https://lore.kernel.org/intel-xe/814f9bcb9c7ee22af45bd5278255af247c6664fa.camel@intel.com/

Lucas De Marchi

>
>> + cleanup
>> ++ stat -c %u:%g /kernel
>> + chown -R 1003:1003 /kernel
>>
>
>-- 
>Ville Syrjälä
>Intel
