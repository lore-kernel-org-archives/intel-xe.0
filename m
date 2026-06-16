Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78F56CD98E4
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jun 2026 18:51:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27D0788EBA;
	Tue, 16 Jun 2026 18:51:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z/ceG465";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DED9A88EBA
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jun 2026 18:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781635909; x=1813171909;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=3sYoOMSSYIuXzZ+ifckEmzuz2TtbhzJGVLAzGzWE/F4=;
 b=Z/ceG465mbAOPb5YiKV2IiwGPYc9lJGB2CpYzF116xt0gaYdRsWWIWv5
 PObHjnuSR3tti2RD8rqiN+13OG4NAUM0wyPsIuU8nXf7z7inc4UJoFWY2
 VtzGZu+VNthZ9B8Q85AJ0wqFBwrtRiycxmX7FsXvmmGPJFTXQFlGozUFc
 B/4QA5WfjEvDzKIbBC1wBv4JpVysxn01xNZm7zI1cUu0O/E8hdmyrlvYT
 2ki7qRQouqlucgJDrn+rthvdlSF3t2jl9Wl31d5TQIL71HVW3KBSX33cM
 RbH6njBqOAk61B2VFQOX/kPW9UG+z+BvuBm8nS4kVgvqC7f6pyVzAwrZM Q==;
X-CSE-ConnectionGUID: hYnUwEd+Sk6H5tcAa4/bOA==
X-CSE-MsgGUID: Rf/z3H5uRhyoTzyTal6n5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="82163224"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="82163224"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 11:51:49 -0700
X-CSE-ConnectionGUID: 3DBCO2NYSZ237sNRY7pXzw==
X-CSE-MsgGUID: Ig8iaKyPSOy5S34X6EzM9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="246960497"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 11:51:48 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 16 Jun 2026 11:51:48 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 16 Jun 2026 11:51:48 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.65) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 16 Jun 2026 11:51:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A7wQW5hhcNR8JkRr/Afw5jjbIv+bgA/Cv6S43ocicQzmkcf1JeUnhHCa6avDzKeej3Le6TtTBlai1pG8p4hwVoOPLiTXznq0Uc0h5IiqPiLBr8v2RJf0+zMF551tTNfmFKcSd1PZTwMD5R3ZGwNJnc1ivKMaIEd1YiDZPtxzIhuW3u4i6k1uso+S+nbl/3IS1sJw7AlBAVYjBtf7zaKbezjTT7NpT+aJLwJMegxO/dMMDLrg7eDwoUP0LUC6ewHTSANytn1m0vQTjgrYeAUxhiL0iOXTHBa+ALEot6punAohCk/3dfCRwEtSXYHuLpl6h1aVpu8UDdDJxPonYI7MTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LGfzBrBv3aYbZjqAuPkNIGpWIawnCbEFD72Ke5RbLik=;
 b=D6QF3pxY3h1PdqV/AjfE2Slb1z7t/9v1t3wWWMop0MGwcrACHkGqYipCmBWFXfaBUoMe6oH39xHDMOlDuPnwkCMiUve+vMN4ez+2kmUrhp8n+zZ5wqFiRSpGezKCWuSU2qQ4jBLzxhKCuobEV+x6NGdJ6vhzDHoniOdevC0Z9yinBJV66OPrt3lv1LYqAkaYNu8/F3ztpCd2pDhWhsdS//B7xtG1WBR4iGUQ8sv+MvFEodw4e66JylPt7PHikdrwHHcNVlxaTH0J9wd4dTfDQxUgvlyJlKQsg68uvm66jIAcNqCV4aPyQLhzCgMVwxi0SWr5Dn4WRA90bIN02p2KGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8284.namprd11.prod.outlook.com (2603:10b6:806:268::21)
 by IA1PR11MB6393.namprd11.prod.outlook.com (2603:10b6:208:3ae::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 18:51:40 +0000
Received: from SN7PR11MB8284.namprd11.prod.outlook.com
 ([fe80::65e5:898b:2231:bf65]) by SN7PR11MB8284.namprd11.prod.outlook.com
 ([fe80::65e5:898b:2231:bf65%4]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 18:51:40 +0000
Date: Tue, 16 Jun 2026 11:51:27 -0700
From: Violet Monti <violet.monti@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/9] drm/xe: Add framework for info probing
Message-ID: <ajGbLyL1Is86P24D@vmonti-desk>
References: <20260609-xe-probe-info-v1-0-21e83e188e60@intel.com>
 <20260609-xe-probe-info-v1-1-21e83e188e60@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260609-xe-probe-info-v1-1-21e83e188e60@intel.com>
X-ClientProxiedBy: SJ0PR05CA0204.namprd05.prod.outlook.com
 (2603:10b6:a03:330::29) To SN7PR11MB8284.namprd11.prod.outlook.com
 (2603:10b6:806:268::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8284:EE_|IA1PR11MB6393:EE_
X-MS-Office365-Filtering-Correlation-Id: a5991a4c-21f2-440b-79eb-08decbd84d5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|22082099003|18002099003|4143699003|6133799003|56012099006|5023799004|11063799006;
X-Microsoft-Antispam-Message-Info: 0/triRemFvQma8S/UCYuYzB/EVDd7vp6AosqfpPMIvBLxJr02D00DONfJpmnyO3eudf+rsekDgTUxH0QlSJkqaC43U05Pzdqm9jCBr5HzE4mvQFJYoMNf/TYx+sAKNzBHJFIpTZ1+NQd++GngyHB9XpMfjpyaMz4WlXFTmSL1i9/YrgX0E10zhQdKJ3MJ4OzpP4IIj7iG+iG1kwRfN8BOWtivJYdqdQmXnq5ga6q0SMYkMjD/d7DFSCzamn5afDYBpkfyzXv0izAZih6tA4zbBMjfowshnw0NZOo7FOZd9l23iNjME+oYT3lnE4sYfSY1hJXCh/J+hpSlbU9FEv6HmSiOV/XMw6INKckG8EmshWMCKVQSDWEU1lx1RWuMyOnYscOus1KKel6lglc/LYklOmqwFBzk2ZYmqiqnbWVwFDTJGLCpM7HlCtwcbOR54KzrWWb7Cwd31QNnTiYxlKbsfPbgrpX0p0vBQwOPEV7u9wfHAKinj8kHPi3R8/3p9f50MZUl8vikYyuTZADDS6hHXbrBFbiRSdAGRocUZ5dYrYt0tif9brG0I12n2ro5yFe5W29TZ3svDEWOCh3IM5API4Xq+QziuSA7pxRoxaWtbU6FKxPnPmV4nY+ksiVS0XE9A2CHazWgKEogzWuaTg6vQN8L3PvhPCCgzU32GSJf7d92C5HoDPDrdnqe0EZnEpC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB8284.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(22082099003)(18002099003)(4143699003)(6133799003)(56012099006)(5023799004)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RfARA10QkWFluIFbJjMjMqMTPBxyytLs+f8mOW04GktEgjX0Fmdejf564WOt?=
 =?us-ascii?Q?dNyvzwwGQ1QAfF3VI4BSsDSNTRs/7FHy+aCFqScDMgpd2CK6P4K1GRMX0rEN?=
 =?us-ascii?Q?7+Nfnbyt/Bf3wleRl+2Nia2VMMEmdWtotSNtes5uImXdTxFJ+oqt7VsBvQYh?=
 =?us-ascii?Q?3zGnH9E5f+COy2468sbNpGOkQEfUCByDIWmhSEbugjk2Fj+nnv/ATSB9MU5Y?=
 =?us-ascii?Q?VRgaU4VMGf4kgGGhE27NR9+sIADuz+5HncBT/ijX1krjc4kzO3zB+hqniAgL?=
 =?us-ascii?Q?xhsoQBPVO7fJlLYYpZZ/xbJJaVGgYCmaDYJrA0bCxeINJKcWSfgqD7Vy8wmT?=
 =?us-ascii?Q?VmOyxXNjBv2jl5uQm1+9i8puNDKq3bdLMhx9aNvR+9gzFWPzHPPQmxvCfcV0?=
 =?us-ascii?Q?jltXIHpx4zoXCmIORm5UWW1z0fKk3dL+cs2jsnbnxsvqWd6vd7r1kREu6kK1?=
 =?us-ascii?Q?eH0adHecEy8ZQ60AmB84AnbrB7ZFJB5kOoD37uBDptD8hsFEsSn5N+8s+3lz?=
 =?us-ascii?Q?ohA9JInhefbQ2+1pMhd7s6m7QYKO1JU2kwPtzZO7YKumawbxs0+qAxk3fT0o?=
 =?us-ascii?Q?LLoAnSwfgxERL9v5sloPftE53uigJTaV7yF87R3AdBG2sXz1Q2ljnlc+oS6u?=
 =?us-ascii?Q?eMBDdfuUqZD3xHbpllC3pcXuzD0+dgoUz1qwIc7VeEERyQ4WkkO/U/yVqZfL?=
 =?us-ascii?Q?PILv26KUTll34ssFtrIvrD1wiKOkp2S6dR0ZWF/zr7RqjbkEIFTwkjChJjdh?=
 =?us-ascii?Q?nvANo+6NwWmyLKu9INT8c3UHsNlzfilVIsQJ/sizQSp/HGC7N1IK5JJrkPiP?=
 =?us-ascii?Q?hM7/5J9ocXytIpp/ryGaGSHJW5OJxBzoeGDJi+L0jcJU7iUzZnTtU+qnGFC9?=
 =?us-ascii?Q?uVz2+g7cNNeLVWDJ25pmcQqPWr3I5yHYVCl5Q1M03+oMdX3gBxAIL+5kIwYJ?=
 =?us-ascii?Q?WpWzwoossvbJBnxEDGRkHIR2Cnq2lVP6T3aYFpqA8e6XdYlaAxy25rDLxiIp?=
 =?us-ascii?Q?i4ak6gDQSoQyYO9/9l2FGIS2+bn6J5QqzuLIR+V+DxJFJOlnuvr1tEupz12/?=
 =?us-ascii?Q?CNYp26VMRdZ9kYyl4g6Hzwk+rVm0SXDMSZnsS5j5Ds7TAdY1CSVYBsaqi8FI?=
 =?us-ascii?Q?nmJBe7HR+XLVr95DXne9mPIJ+triTMGeZTwR5CZ2ReVDuD5NitX5aA7bTN0c?=
 =?us-ascii?Q?SgnG99oNKXjOxrQ/3kA46NCOKFjVzC+GY83gRAQ+6Abrvik4NflkYW2XWqjh?=
 =?us-ascii?Q?OVp8CicGuJ1gbancsNfSZDtJFtnVcSWhQkhY9FgYKG/9oFfr0JORYKRh+JZz?=
 =?us-ascii?Q?iB7GAg2mbIPJWu18qY9EGjgeOLwlrcfs5EKhVdggMiK0RIatYbBpKAhle7Pn?=
 =?us-ascii?Q?njIkcAG96i5bsnmzX12/mkaLRFBP3eRg62z0SE+XvjymBg+Nut+YAPzXfKuR?=
 =?us-ascii?Q?P4Myd/maajzFRsbAAFGRaddij1cq7/OidYZikAivHdBH+IDNK1qSAOWD9JX2?=
 =?us-ascii?Q?NWSoB8Kqi7t4fEXVJS8iVqnPRlnmpUlYIJJTK8U2HKEhmjTSsLa0w0LssWjA?=
 =?us-ascii?Q?JCZKvU5uknvvlkoTynojZxpPfbhBKhp/UkTdSAI7qXSaK1bO2V+QFCE4VbLH?=
 =?us-ascii?Q?zqA2gOseYBfEZPjp8Ao2z8qMjtMCzbQ98GTq3xSYcz9lrW2jQe76XvMGgeLz?=
 =?us-ascii?Q?qehNUYvH/qiq2qV+BJ8Q4wDJokKMcGafpOofEG2Psmgz6/Ws1nj3Z1f143lq?=
 =?us-ascii?Q?aQ+i6edBog=3D=3D?=
X-Exchange-RoutingPolicyChecked: O1aoTIjguhvdoYMCai1KmLrPcIutAZX63BmDeawHmcoFMScgQULSNZtPLdtw0Ff+MRsV77jUvUYjpptTN0H3pwCGsNGoTqBhooJgz3Nlhs8a1AbI9msPI39TXZKzazT9k66z2VFMBZzySmq2ZmbAuar+KVqEZdPhcrl+1gOiaH3SXXCbRkjt1E1TsVlHsYD6Iv497aMkU7rzYTVdhyMJzBMrQhzJcbkhuwfcGsN9vsli9orxxVTl1XTX5bchZk+BtNcfGgNh11iG7eQ0nELjb7DxwnQTWZuVVUsoULWH7XmjAFhVbmW68I3HLAeD4MA2AulVwO/9otUCPbcACPEj2Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: a5991a4c-21f2-440b-79eb-08decbd84d5e
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8284.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 18:51:40.6010 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SH7WRKhLY8K2ESerUVAjTSVQ9gLqTlYZnps9jlLX0WNEGXaMBKtpmvpLZafz3sOXdM2wJCnv8PX23YVDMtqzow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6393
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

On Tue, Jun 09, 2026 at 05:17:33PM -0300, Gustavo Sousa wrote:
> Functions xe_info_init_early() and xe_info_init() currently probe some
> information from the hardware while doing initialization of info
> fields.  Besides mixing responsibilities, another issue from this
> approach is that kunit tests need to implement static stubs for the
> probing part.
> 
> Let's prepare the ground to ensuring that those functions stop probing
> the information from the hardware by creating the necessary framework
> for extracting the probing bits out of them.  Do that by creating a
> new struct type called xe_probed_info and the functions responsible
> for populating it.
> 
> In upcoming changes, we will gradually refactor the code so that all
> info needed by xe_info_init_early() and xe_info_init() that is probed
> from the hardware is passed to them via struct xe_probed_info.
> 
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>

Reviewed-by: Violet Monti <violet.monti@intel.com>

> ---
>  drivers/gpu/drm/xe/tests/xe_pci.c | 16 +++++++++++++--
>  drivers/gpu/drm/xe/xe_pci.c       | 41 +++++++++++++++++++++++++++++++++++----
>  2 files changed, 51 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
> index 9240aff779da..51d032a9e01a 100644
> --- a/drivers/gpu/drm/xe/tests/xe_pci.c
> +++ b/drivers/gpu/drm/xe/tests/xe_pci.c
> @@ -338,13 +338,21 @@ static void fake_xe_info_probe_tile_count(struct xe_device *xe)
>  	/* Nothing to do, just use the statically defined value. */
>  }
>  
> +static int fake_probe_info(struct xe_device *xe,
> +			   struct xe_probed_info *probed_info)
> +{
> +	return 0;
> +}
> +
>  int xe_pci_fake_device_init(struct xe_device *xe)
>  {
>  	struct kunit *test = kunit_get_current_test();
>  	struct xe_pci_fake_data *data = test->priv;
> +	struct xe_probed_info probed_info = {};
>  	const struct pci_device_id *ent = pciidlist;
>  	const struct xe_device_desc *desc;
>  	const struct xe_subplatform_desc *subplatform_desc;
> +	int err;
>  
>  	if (!data) {
>  		desc = (const void *)ent->driver_data;
> @@ -379,8 +387,12 @@ int xe_pci_fake_device_init(struct xe_device *xe)
>  	kunit_activate_static_stub(test, xe_info_probe_tile_count,
>  				   fake_xe_info_probe_tile_count);
>  
> -	xe_info_init_early(xe, desc, subplatform_desc);
> -	xe_info_init(xe, desc);
> +	err = fake_probe_info(xe, &probed_info);
> +	if (err)
> +		return err;
> +
> +	xe_info_init_early(xe, desc, subplatform_desc, &probed_info);
> +	xe_info_init(xe, desc, &probed_info);
>  
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 78fc2e4dcfc6..7f1da6d25011 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -737,13 +737,27 @@ static void init_devid(struct xe_device *xe)
>  	xe->info.revid = pdev->revision;
>  }
>  
> +struct xe_probed_info {
> +	/* Nothing for now. */
> +};
> +
> +/*
> + * Probe from the hardware the info required by xe_info_init_early().
> + */
> +static int xe_probe_info_early(struct xe_device *xe,
> +			       struct xe_probed_info *probed_info)
> +{
> +	return 0;
> +}
> +
>  /*
>   * Initialize device info content that only depends on static driver_data
>   * passed to the driver at probe time from PCI ID table.
>   */
>  static int xe_info_init_early(struct xe_device *xe,
>  			      const struct xe_device_desc *desc,
> -			      const struct xe_subplatform_desc *subplatform_desc)
> +			      const struct xe_subplatform_desc *subplatform_desc,
> +			      struct xe_probed_info *probed_info)
>  {
>  	int err;
>  
> @@ -910,6 +924,15 @@ static struct xe_gt *alloc_media_gt(struct xe_tile *tile,
>  	return gt;
>  }
>  
> +/*
> + * Probe from the hardware the info required by xe_info_init().
> + */
> +static int xe_probe_info(struct xe_device *xe,
> +			 struct xe_probed_info *probed_info)
> +{
> +	return 0;
> +}
> +
>  /*
>   * Initialize device info content that does require knowledge about
>   * graphics / media IP version.
> @@ -917,7 +940,8 @@ static struct xe_gt *alloc_media_gt(struct xe_tile *tile,
>   * present in device info.
>   */
>  static int xe_info_init(struct xe_device *xe,
> -			const struct xe_device_desc *desc)
> +			const struct xe_device_desc *desc,
> +			struct xe_probed_info *probed_info)
>  {
>  	u32 graphics_gmdid_revid = 0, media_gmdid_revid = 0;
>  	const struct xe_ip *graphics_ip;
> @@ -1073,6 +1097,7 @@ static void xe_pci_remove(struct pci_dev *pdev)
>   */
>  static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  {
> +	struct xe_probed_info probed_info = {};
>  	const struct xe_device_desc *desc = (const void *)ent->driver_data;
>  	const struct xe_subplatform_desc *subplatform_desc;
>  	struct xe_device *xe;
> @@ -1117,7 +1142,11 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  
>  	pci_set_master(pdev);
>  
> -	err = xe_info_init_early(xe, desc, subplatform_desc);
> +	err = xe_probe_info_early(xe, &probed_info);
> +	if (err)
> +		return err;
> +
> +	err = xe_info_init_early(xe, desc, subplatform_desc, &probed_info);
>  	if (err)
>  		return err;
>  
> @@ -1136,7 +1165,11 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  	if (err)
>  		return err;
>  
> -	err = xe_info_init(xe, desc);
> +	err = xe_probe_info(xe, &probed_info);
> +	if (err)
> +		return err;
> +
> +	err = xe_info_init(xe, desc, &probed_info);
>  	if (err)
>  		return err;
>  
> 
> -- 
> 2.53.0
> 

-- 
--
Violet Monti
