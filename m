Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F8C7CEE343
	for <intel-xe@archiver.kernel.org>; Wed,  9 Oct 2024 19:28:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6696E10E7E5;
	Wed,  9 Oct 2024 19:28:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IkaMPnhF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6334510E7E5
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Oct 2024 19:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728502099; x=1760038099;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=++y3DiJUupJDVPAlpj0lMWH/KPZoeM/BqZp1r4vHMoY=;
 b=IkaMPnhF7jJ5QbdExq6pLuxLYq9ojEOcgBjT76SktoD2lAy+L+FYlN25
 8YVZDOE8MULfyp13lSZU8Ryzf39cMwlT4SYF2Ex9vb5koXUMZtzSRmc4n
 ACIGRSwFFmACzXTyskgnyGHykd2vttOYiNWnNUQD5AtHykNxZPq38ei+Z
 GvQzM9hAYiRnQbLk0jQrjx//M2iZRNFte4QRDMrxMWU8xYlsceZHXewQi
 ydzttg2dDHTwORpmZxZFCPWYN2irY+5MUKzJXvgVGp1bfcuCtLnsM85yG
 6eyRdVicy78hMEXcKlaQI7ghZMRrOG3D+NNsSP+BwXOcSBurpSE8D3II/ A==;
X-CSE-ConnectionGUID: 73cahSXNR7GaA7sOvVCwCw==
X-CSE-MsgGUID: XvNKQCSPQeiva8h4XfWFtw==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="27959059"
X-IronPort-AV: E=Sophos;i="6.11,190,1725346800"; d="scan'208";a="27959059"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 12:28:19 -0700
X-CSE-ConnectionGUID: ZVzyeGZ0Sm2iE67v+uMf0g==
X-CSE-MsgGUID: v92MnU0yS8yhVSBN/Cog/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,190,1725346800"; d="scan'208";a="76020940"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Oct 2024 12:28:19 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 9 Oct 2024 12:28:18 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 9 Oct 2024 12:28:18 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 9 Oct 2024 12:28:18 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 9 Oct 2024 12:28:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eui8CdrKlMsuyhP7YHh3kaycAFoDznYlAV4lXpIjEltkGFZPuIoWSPt3mnLn5P5jAHR9P8GAZ3732Y+/+zpWpWh8cksYtfs+8ST2HO+1IYssZhhty7ec8Y/0TWH2cTOw1XQmHD7o3sEGGoGnyK2feoHFTR4LuXEZz+p8yzGvKxconQpOpQOhCQXODtKHVPm+NCEHrGB/X3Z8MqU4jMvLaWe9J6UP5hWsjhxK7wa7Ea7KMBb/4VKDWV7mRAj/fhYk73ksGnWu6mBE/gMUeAEZFviH6/Q+uwfwH5hhQRtfCz1jD88wTBew8HoQE64eIS1azuoClsKkqL5/OfJQdfzz0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ET4PFA8oyIwg+LDPscHxFuTUAzLjx2WKai9/Ivxm8F4=;
 b=ZqEgTmvG7TG2tPAgDfOwoFZpE2ChnNJEEkXHhN594Oz3M5OdhbWsgPakwiBRRe3mvNAXUcKSsre7cRxAvxZHiLsAG5iI4Ns36wnX9EBMEcg56jROWUHhsfzczsavS/eoSDe1qtvoA5kcc1JfBAv8aF/Chkgh/L7MFwsr0d3HSRX1Pnq9s2EgXuL/i9cbr7oD6v/+q0ufQ+UT6VusP9MZasELQJIfxNoCbtji+2Rj7jDbcE3lO9rWiVuFtjADswsDjsIXc1r3Dpf1HzAvWCjaRDwU0dh8XG/8RCcB2NkOHhd7MivrOkxyRUO0Q282TMxc4kRQueDtZusO1pLkX2Pcsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SJ0PR11MB5184.namprd11.prod.outlook.com (2603:10b6:a03:2d5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Wed, 9 Oct
 2024 19:28:09 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.8026.020; Wed, 9 Oct 2024
 19:28:09 +0000
Date: Wed, 9 Oct 2024 12:28:07 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Aradhya Bhatia <aradhya.bhatia@intel.com>
Subject: Re: =?utf-8?B?4pyXIENJLkZVTEw=?= =?utf-8?Q?=3A?= failure for
 drm/xe/xe2lpg: Extend Wa_15016589081 for xe2lpg
Message-ID: <20241009192807.GQ4891@mdroper-desk1.amr.corp.intel.com>
References: <20241009065542.283151-1-aradhya.bhatia@intel.com>
 <172848235024.1210224.3614686023791347061@2413ebb6fbb6>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <172848235024.1210224.3614686023791347061@2413ebb6fbb6>
X-ClientProxiedBy: SJ0PR05CA0204.namprd05.prod.outlook.com
 (2603:10b6:a03:330::29) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SJ0PR11MB5184:EE_
X-MS-Office365-Filtering-Correlation-Id: 88d503ba-5c4b-4552-90f8-08dce898821f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4VSPLXWPxWkh2gepzv1slqFKptMCO6EVHG6ZVaMhvBs947NiT1FBEJyLcB/6?=
 =?us-ascii?Q?gftxKeREDckhjHSA2q/hk7nBns5hY2LPefJmJUEg5OVfXbw3YmAkBXR17p0j?=
 =?us-ascii?Q?Hy2vsF/VBtRcGRzUnSfyUyqIOcHvqQPHYdsNdNqj9QwiYyqPMMQxUnnIom7R?=
 =?us-ascii?Q?BIua8cHYocPP+4zAfIkECEklVa+qUiH8LgE1ljfUsr4esLLSOm1m9bOEjLBW?=
 =?us-ascii?Q?FmVrs6ytGHIJ9xikrM9Lxf3+I2VrC5kxJhIR6tf/ounmKzljhB2Sb2sh1l72?=
 =?us-ascii?Q?1aHj3y+5oqfCEjRaVYXNzJUcivLkU+nINomKgb84uSW0rLwRDMzpt84eyfqG?=
 =?us-ascii?Q?O23K6rUejx1C+2zGEcDqe5Wr5zwFq/HXXiiCBIOLsXb7u7fG+Q09PVHt4Ew8?=
 =?us-ascii?Q?qXl/S87pOgKIsMVzpBeP0g6ooMjc6a3ZrQWiBX2Fo9IfciSJjdwx/Jq2v4fV?=
 =?us-ascii?Q?dXk87a0Q/gSxgge71O9ap5cBwyDB2fuaswkTD0irW/Vr0uyCNW7du47KKiU1?=
 =?us-ascii?Q?qEkwDYMshNJLYKkf/e6tProFfVUkhl3cVVBSX2OAvJhx9JTlhnyiKuViDSHy?=
 =?us-ascii?Q?OcoTY7QRSKYAy/O1w1xcdQgPyGFRYzTPdzE1ZW4wXjFUEfy0qK8Wfd0sNw3f?=
 =?us-ascii?Q?82QFhDdkZX/KGvGsbjzC60Vh6EIXC8ICSD3OVqKuq4KBRmuDqiQqqQvLRWAN?=
 =?us-ascii?Q?wQH2hwVZT0aZRfkf3rwgichV6VorbOy30aS+iAQQ0Y4Ov6jmXPQjdEOkJRrb?=
 =?us-ascii?Q?EySGbBCUV72x+fAE7w0bnQLbWxZe86yAVgEax4UKjVfjfOyR9PdTdCFRLAM8?=
 =?us-ascii?Q?xYNjjXrMspbgoPyqtJhswfelXvXAP483tnG+zrKF6bWlulUjmELY7QC92HmQ?=
 =?us-ascii?Q?7sk5AO/kpRvAvubtbk/wo0QaCfPieTAJSSQvY4PFSYcwKKpvJ3OfjNcA4A1A?=
 =?us-ascii?Q?x5/znOfWruTgmFCstgOdvk5hRolalIFygwhlkJ39NECuo1XJn8iyzud7yplp?=
 =?us-ascii?Q?cQx4vKqBA2RTBuZppnNbVhI9buUWthbMC2j7nG5hUwPsctrdgHxtN8SGRgMQ?=
 =?us-ascii?Q?IMjVBUNPoM2BfqUS7m2gzxLOYGA63OTp7h0hDlHuX7LLKc2B/Uj/MM8FX7Ga?=
 =?us-ascii?Q?utphKpTIZiXfTMoFxd9lzEYomsHW9iU8WtLwF0CQxd5hh/0rNOX4Ka+F3mYD?=
 =?us-ascii?Q?9ZcFX6aLGDf3l+JRQ5gTmqKbeR+ky5C0xXke9D1izg8NRyRYm91JdmIRGAw?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Xw74Gt2zWjY8y1SkNiBovR2muoeZSC7rSEe0tUlTZ3ca2n6lGSNY0htcXTv+?=
 =?us-ascii?Q?YIh+ykjzraWuAbebnhEIk+6/4kVCoG5bJiC/mUt97VH1b42jKs5GjM66VrM9?=
 =?us-ascii?Q?Ennwnil+RVAKKW5Xn4umNy4Pd5/qlJVOBUWugpym6rjOMPyrssV2e1y7yn/s?=
 =?us-ascii?Q?mmKjrHjToy3GEk9DDMreM0E97a4WMHiLR/u7dyD3Rxp9Xz0d9E+8051ocefb?=
 =?us-ascii?Q?A1cNGeuyGVWxLqEWkFQws7r4/ROYuj8839lUhY6alqy98Cw2W308rJp/iwya?=
 =?us-ascii?Q?pBc4XKNwneOueyJieBCausMNqpRTrHOUpGd/ddyc9PIBgj8Mg3V31604SPEu?=
 =?us-ascii?Q?55VEeG51Qd8aD0WogBrGFRVhhTXhJfnF9VdJo2QPxepklT9n02lZKltWSzJW?=
 =?us-ascii?Q?2V3pyyogdCPGghCHiYeuI8a4Z6yTWjjbcLqrMYnjyCRzRLsOI+0iYrE/z3He?=
 =?us-ascii?Q?ATArYJ1MKZigTmzyn3JXMnLhaTsUoqwEiSN6bKPdt1YBC5Gh9r0Gg9E5sIAC?=
 =?us-ascii?Q?HFgLhA39XSIwweuR07xHW27U5bZjmwdrl4/D/CrKtESpjJmxoLZ2BPCccI/j?=
 =?us-ascii?Q?bK6gfFOSQqjSKP6hEDtYDKgQsjYD0/KFUEenCv9nyVzHTm/FvcjuehtgAYYK?=
 =?us-ascii?Q?fBoGOFYiCZ744g0f5y6Cod6UY2vJM3U/zrhWz8aupp5u6e2m27Zz0Rit6VqJ?=
 =?us-ascii?Q?09SZrzbf0HfrMSTZMiXQtcTi5Gl+a6GHS5ho7Spj8lz5VmdE4YVz9Cw6FDyj?=
 =?us-ascii?Q?KHKuJ139hH/mdWuJFkPn2n1jKQLke6Z2l7Gog1lSugu1xlvGUqmHto2o2jXw?=
 =?us-ascii?Q?PrJPI185aIr3sBPk2qXthWhqDEv8hYu0gQ0NfVSmyQ/DoorRfo6cvfndXOjg?=
 =?us-ascii?Q?F64ON4l3L3Y/4tWdX8Wyj+yFBIMtcv1ZrX3xpqY6+aPOpoXaM5EW0f84Quue?=
 =?us-ascii?Q?9JzB4uQieO/bcfHaho9zOVNEAnkqPac95ZmSyW4MSm/2rr+L7QXbb8DHGNql?=
 =?us-ascii?Q?ATy4mI1jGDOXRpzWw1m/+zGllMSAK6pIc4yeBS8pf2PSHMbcN/p0rNJEdFc1?=
 =?us-ascii?Q?RgAMVVbp5mzaThN++Ieu2PfvX8IvXWvCYNE1dGy6tXeowHwt/D6clXK9lUiN?=
 =?us-ascii?Q?CC8f6vicXwNMqcnMVqci9sgxmcEfMVfXuW+CfR5lSUJgQ9POHx/RPZinUS17?=
 =?us-ascii?Q?68OF1KmbgyoIHvoFhOVBEUeubuSNcZGV5zhGxG83c4FF8E1anxSLBB4L/dB8?=
 =?us-ascii?Q?jF9EhxN0LxOhLMyMRKyWhfTAGKoqLSSHe2GRlJu9JezBuDf3poPKlPhep53O?=
 =?us-ascii?Q?frR+/96NYfvEbtbyt0MrrS9eCtUxqYeb25LxTlB2H+QOUOf/hRIeobkQtbEF?=
 =?us-ascii?Q?W/ntanH1JNwH0Udn9sGMLY9CTodWq6cHdGzA5Ocllmwthv3t+JavWm9wvB2V?=
 =?us-ascii?Q?rN5gNtNG3SnLRJ31wFY8wHibda1wV13LW4BkjFF2Og+9U5Q4Degshit8OSm8?=
 =?us-ascii?Q?930r5EKa0iKlxJn9g9a2OWxOtJuKGMXSmmxtl4dTSmHTxeqbtfcsD53KQbZA?=
 =?us-ascii?Q?sn/VAl9OMNYo+F8IzN7NJVkRMURugoRsURoPwuTUDnwBz7wKN9NCLM8zJKfE?=
 =?us-ascii?Q?Ig=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 88d503ba-5c4b-4552-90f8-08dce898821f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2024 19:28:09.7189 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w7d2kC9cmPwJI3e6f5K3Qs4uLqqfR3IwNSsuPPZAmRgNoEWWDCHZPwTTJrlx7054Hn4HNkBZBBs4yy1OFJR17B0Zr55YMuZaGsN8oSY6v1o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5184
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

On Wed, Oct 09, 2024 at 01:59:10PM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/xe2lpg: Extend Wa_15016589081 for xe2lpg
> URL   : https://patchwork.freedesktop.org/series/139750/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-2028-2c8a08f54befdd831076e0854fe311569c209835_full -> xe-pw-139750v1_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-139750v1_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-139750v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in xe-pw-139750v1_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:
>     - shard-dg2-set2:     [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2028-2c8a08f54befdd831076e0854fe311569c209835/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html
> 
>   * igt@kms_flip@absolute-wf_vblank:
>     - shard-dg2-set2:     [PASS][3] -> [DMESG-WARN][4] +9 other tests dmesg-warn
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2028-2c8a08f54befdd831076e0854fe311569c209835/shard-dg2-436/igt@kms_flip@absolute-wf_vblank.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-dg2-435/igt@kms_flip@absolute-wf_vblank.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
>     - shard-lnl:          [PASS][5] -> [FAIL][6] +1 other test fail
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2028-2c8a08f54befdd831076e0854fe311569c209835/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

None of these display failures are related to the LNL GT workaround
being added in this patch.

Applied to drm-xe-next.  Thanks for the patch and review.


Matt


> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * igt@kms_async_flips@async-flip-suspend-resume@pipe-c-hdmi-a-3:
>     - {shard-bmg}:        [PASS][7] -> [DMESG-WARN][8] +2 other tests dmesg-warn
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2028-2c8a08f54befdd831076e0854fe311569c209835/shard-bmg-3/igt@kms_async_flips@async-flip-suspend-resume@pipe-c-hdmi-a-3.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-bmg-6/igt@kms_async_flips@async-flip-suspend-resume@pipe-c-hdmi-a-3.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a3:
>     - {shard-bmg}:        [PASS][9] -> [FAIL][10]
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2028-2c8a08f54befdd831076e0854fe311569c209835/shard-bmg-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a3.html
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a3.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-139750v1_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_big_fb@4-tiled-16bpp-rotate-180:
>     - shard-adlp:         NOTRUN -> [SKIP][11] ([Intel XE#1124])
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-adlp-4/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html
> 
>   * igt@kms_big_fb@linear-64bpp-rotate-0:
>     - shard-dg2-set2:     [PASS][12] -> [DMESG-WARN][13] ([Intel XE#877])
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2028-2c8a08f54befdd831076e0854fe311569c209835/shard-dg2-464/igt@kms_big_fb@linear-64bpp-rotate-0.html
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-dg2-466/igt@kms_big_fb@linear-64bpp-rotate-0.html
> 
>   * igt@kms_big_fb@y-tiled-16bpp-rotate-180:
>     - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#1124]) +3 other tests skip
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-lnl-7/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][15] ([Intel XE#1124])
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_bw@linear-tiling-3-displays-3840x2160p:
>     - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#367])
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-lnl-7/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html
> 
>   * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs:
>     - shard-adlp:         NOTRUN -> [SKIP][17] ([Intel XE#455] / [Intel XE#787]) +3 other tests skip
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-adlp-4/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html
> 
>   * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][18] ([Intel XE#787]) +5 other tests skip
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-adlp-4/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-1.html
> 
>   * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
>     - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#2887]) +3 other tests skip
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-lnl-3/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html
> 
>   * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][20] ([Intel XE#787]) +13 other tests skip
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-dg2-432/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html
> 
>   * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#455] / [Intel XE#787]) +3 other tests skip
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-dg2-432/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html
> 
>   * igt@kms_chamelium_color@ctm-max:
>     - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#306]) +2 other tests skip
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-lnl-7/igt@kms_chamelium_color@ctm-max.html
> 
>   * igt@kms_chamelium_frames@hdmi-cmp-planes-random:
>     - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#373]) +1 other test skip
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-lnl-3/igt@kms_chamelium_frames@hdmi-cmp-planes-random.html
> 
>   * igt@kms_chamelium_frames@hdmi-crc-multiple:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#373])
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-dg2-432/igt@kms_chamelium_frames@hdmi-crc-multiple.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
>     - shard-adlp:         NOTRUN -> [SKIP][25] ([Intel XE#373])
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-adlp-4/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-128x42:
>     - shard-lnl:          NOTRUN -> [SKIP][26] ([Intel XE#1424]) +1 other test skip
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-lnl-7/igt@kms_cursor_crc@cursor-sliding-128x42.html
> 
>   * igt@kms_cursor_edge_walk@128x128-top-edge:
>     - shard-lnl:          [PASS][27] -> [FAIL][28] ([Intel XE#2577]) +1 other test fail
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2028-2c8a08f54befdd831076e0854fe311569c209835/shard-lnl-6/igt@kms_cursor_edge_walk@128x128-top-edge.html
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-lnl-6/igt@kms_cursor_edge_walk@128x128-top-edge.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
>     - shard-lnl:          [PASS][29] -> [FAIL][30] ([Intel XE#1475])
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2028-2c8a08f54befdd831076e0854fe311569c209835/shard-lnl-6/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-lnl-6/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
> 
>   * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
>     - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#1508] / [Intel XE#599])
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-lnl-3/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
> 
>   * igt@kms_dsc@dsc-with-bpc-formats:
>     - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#599]) +1 other test skip
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-lnl-3/igt@kms_dsc@dsc-with-bpc-formats.html
> 
>   * igt@kms_feature_discovery@display-4x:
>     - shard-adlp:         NOTRUN -> [SKIP][33] ([Intel XE#1138])
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-adlp-4/igt@kms_feature_discovery@display-4x.html
> 
>   * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
>     - shard-adlp:         NOTRUN -> [SKIP][34] ([Intel XE#310])
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-adlp-4/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank@cd-hdmi-a6-dp4:
>     - shard-dg2-set2:     [PASS][35] -> [FAIL][36] ([Intel XE#301])
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2028-2c8a08f54befdd831076e0854fe311569c209835/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank@cd-hdmi-a6-dp4.html
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank@cd-hdmi-a6-dp4.html
> 
>   * igt@kms_flip@2x-flip-vs-suspend-interruptible:
>     - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#1421]) +3 other tests skip
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-lnl-3/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
> 
>   * igt@kms_flip@blocking-wf_vblank:
>     - shard-lnl:          [PASS][38] -> [FAIL][39] ([Intel XE#886]) +13 other tests fail
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2028-2c8a08f54befdd831076e0854fe311569c209835/shard-lnl-6/igt@kms_flip@blocking-wf_vblank.html
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-lnl-1/igt@kms_flip@blocking-wf_vblank.html
> 
>   * igt@kms_flip@flip-vs-suspend:
>     - shard-lnl:          [PASS][40] -> [INCOMPLETE][41] ([Intel XE#2049]) +1 other test incomplete
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2028-2c8a08f54befdd831076e0854fe311569c209835/shard-lnl-6/igt@kms_flip@flip-vs-suspend.html
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-lnl-6/igt@kms_flip@flip-vs-suspend.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#455]) +4 other tests skip
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
>     - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#1401] / [Intel XE#1745])
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-default-mode:
>     - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#1401])
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:
>     - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#1397] / [Intel XE#1745])
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode:
>     - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#1397])
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-pgflip-blt:
>     - shard-adlp:         NOTRUN -> [SKIP][47] ([Intel XE#651])
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff:
>     - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#651]) +3 other tests skip
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt:
>     - shard-adlp:         NOTRUN -> [SKIP][49] ([Intel XE#656]) +2 other tests skip
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][50] ([Intel XE#651]) +3 other tests skip
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-tiling-4:
>     - shard-adlp:         NOTRUN -> [SKIP][51] ([Intel XE#1151])
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-tiling-4.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][52] ([Intel XE#653]) +2 other tests skip
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc:
>     - shard-lnl:          NOTRUN -> [SKIP][53] ([Intel XE#656]) +10 other tests skip
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render:
>     - shard-adlp:         NOTRUN -> [SKIP][54] ([Intel XE#653])
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render.html
> 
>   * igt@kms_getfb@getfb-reject-ccs:
>     - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#605])
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-lnl-3/igt@kms_getfb@getfb-reject-ccs.html
> 
>   * igt@kms_joiner@basic-force-ultra-joiner:
>     - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#2934])
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-lnl-3/igt@kms_joiner@basic-force-ultra-joiner.html
> 
>   * igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-3:
>     - shard-lnl:          [PASS][57] -> [DMESG-WARN][58] ([Intel XE#324])
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2028-2c8a08f54befdd831076e0854fe311569c209835/shard-lnl-5/igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-3.html
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-lnl-1/igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-3.html
> 
>   * igt@kms_plane_cursor@viewport:
>     - shard-dg2-set2:     [PASS][59] -> [FAIL][60] ([Intel XE#616]) +1 other test fail
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2028-2c8a08f54befdd831076e0854fe311569c209835/shard-dg2-435/igt@kms_plane_cursor@viewport.html
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-dg2-464/igt@kms_plane_cursor@viewport.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][61] ([Intel XE#361]) +1 other test fail
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20:
>     - shard-dg2-set2:     [PASS][62] -> [DMESG-WARN][63] ([Intel XE#2566])
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2028-2c8a08f54befdd831076e0854fe311569c209835/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20.html
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-b:
>     - shard-dg2-set2:     [PASS][64] -> [SKIP][65] ([Intel XE#2763]) +2 other tests skip
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2028-2c8a08f54befdd831076e0854fe311569c209835/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-b.html
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-b.html
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c:
>     - shard-lnl:          NOTRUN -> [SKIP][66] ([Intel XE#2763]) +7 other tests skip
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-lnl-3/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c.html
> 
>   * igt@kms_pm_dc@dc6-psr:
>     - shard-adlp:         NOTRUN -> [SKIP][67] ([Intel XE#1129])
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-adlp-4/igt@kms_pm_dc@dc6-psr.html
> 
>   * igt@kms_pm_rpm@legacy-planes-dpms:
>     - shard-lnl:          [PASS][68] -> [INCOMPLETE][69] ([Intel XE#1620] / [Intel XE#2864])
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2028-2c8a08f54befdd831076e0854fe311569c209835/shard-lnl-3/igt@kms_pm_rpm@legacy-planes-dpms.html
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-lnl-8/igt@kms_pm_rpm@legacy-planes-dpms.html
> 
>   * igt@kms_pm_rpm@legacy-planes-dpms@plane-68:
>     - shard-lnl:          [PASS][70] -> [DMESG-FAIL][71] ([Intel XE#1620] / [Intel XE#2990])
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2028-2c8a08f54befdd831076e0854fe311569c209835/shard-lnl-3/igt@kms_pm_rpm@legacy-planes-dpms@plane-68.html
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-lnl-8/igt@kms_pm_rpm@legacy-planes-dpms@plane-68.html
> 
>   * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][72] ([Intel XE#1489])
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-dg2-432/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html
> 
>   * igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:
>     - shard-adlp:         NOTRUN -> [SKIP][73] ([Intel XE#1489])
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-adlp-4/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html
> 
>   * igt@kms_psr2_su@page_flip-nv12:
>     - shard-lnl:          NOTRUN -> [SKIP][74] ([Intel XE#1128])
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-lnl-3/igt@kms_psr2_su@page_flip-nv12.html
> 
>   * igt@kms_psr@fbc-psr2-no-drrs:
>     - shard-adlp:         NOTRUN -> [SKIP][75] ([Intel XE#2850] / [Intel XE#929])
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-adlp-4/igt@kms_psr@fbc-psr2-no-drrs.html
> 
>   * igt@kms_psr@pr-suspend:
>     - shard-lnl:          NOTRUN -> [SKIP][76] ([Intel XE#1406])
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-lnl-3/igt@kms_psr@pr-suspend.html
> 
>   * igt@kms_psr@psr-cursor-plane-move:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][77] ([Intel XE#2850] / [Intel XE#929]) +2 other tests skip
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-dg2-432/igt@kms_psr@psr-cursor-plane-move.html
> 
>   * igt@kms_psr@psr2-primary-page-flip@edp-1:
>     - shard-lnl:          [PASS][78] -> [FAIL][79] ([Intel XE#2948]) +1 other test fail
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2028-2c8a08f54befdd831076e0854fe311569c209835/shard-lnl-8/igt@kms_psr@psr2-primary-page-flip@edp-1.html
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-lnl-8/igt@kms_psr@psr2-primary-page-flip@edp-1.html
> 
>   * igt@kms_rotation_crc@primary-rotation-90:
>     - shard-adlp:         NOTRUN -> [SKIP][80] ([Intel XE#327])
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-adlp-4/igt@kms_rotation_crc@primary-rotation-90.html
> 
>   * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
>     - shard-lnl:          NOTRUN -> [SKIP][81] ([Intel XE#1437])
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-lnl-3/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
>     - shard-lnl:          [PASS][82] -> [FAIL][83] ([Intel XE#899])
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2028-2c8a08f54befdd831076e0854fe311569c209835/shard-lnl-6/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
> 
>   * igt@kms_vrr@cmrr@pipe-a-edp-1:
>     - shard-lnl:          [PASS][84] -> [FAIL][85] ([Intel XE#2159]) +1 other test fail
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2028-2c8a08f54befdd831076e0854fe311569c209835/shard-lnl-3/igt@kms_vrr@cmrr@pipe-a-edp-1.html
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-lnl-5/igt@kms_vrr@cmrr@pipe-a-edp-1.html
> 
>   * igt@xe_eudebug@multiple-sessions:
>     - shard-lnl:          NOTRUN -> [SKIP][86] ([Intel XE#2905]) +2 other tests skip
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-lnl-7/igt@xe_eudebug@multiple-sessions.html
> 
>   * igt@xe_eudebug@sysfs-toggle:
>     - shard-adlp:         NOTRUN -> [SKIP][87] ([Intel XE#2905]) +1 other test skip
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-adlp-4/igt@xe_eudebug@sysfs-toggle.html
> 
>   * igt@xe_eudebug_online@single-step-one:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][88] ([Intel XE#2905]) +1 other test skip
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-dg2-432/igt@xe_eudebug_online@single-step-one.html
> 
>   * igt@xe_evict@evict-large-external:
>     - shard-lnl:          NOTRUN -> [SKIP][89] ([Intel XE#688]) +3 other tests skip
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-lnl-3/igt@xe_evict@evict-large-external.html
> 
>   * igt@xe_exec_basic@multigpu-once-bindexecqueue:
>     - shard-lnl:          NOTRUN -> [SKIP][90] ([Intel XE#1392])
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-lnl-3/igt@xe_exec_basic@multigpu-once-bindexecqueue.html
> 
>   * igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-race:
>     - shard-adlp:         NOTRUN -> [SKIP][91] ([Intel XE#288]) +2 other tests skip
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-adlp-4/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-race.html
> 
>   * igt@xe_exec_fault_mode@once-userptr:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][92] ([Intel XE#288]) +1 other test skip
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-dg2-432/igt@xe_exec_fault_mode@once-userptr.html
> 
>   * igt@xe_module_load@load:
>     - shard-lnl:          NOTRUN -> [SKIP][93] ([Intel XE#378])
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-lnl-7/igt@xe_module_load@load.html
> 
>   * igt@xe_oa@oa-regs-whitelisted@ccs-0:
>     - shard-lnl:          NOTRUN -> [FAIL][94] ([Intel XE#2514])
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-lnl-4/igt@xe_oa@oa-regs-whitelisted@ccs-0.html
> 
>   * igt@xe_pm@d3cold-basic:
>     - shard-lnl:          NOTRUN -> [SKIP][95] ([Intel XE#2284] / [Intel XE#366]) +1 other test skip
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-lnl-3/igt@xe_pm@d3cold-basic.html
> 
>   * igt@xe_pm@s2idle-multiple-execs:
>     - shard-dg2-set2:     NOTRUN -> [ABORT][96] ([Intel XE#1358])
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-dg2-432/igt@xe_pm@s2idle-multiple-execs.html
> 
>   * igt@xe_pm@s4-exec-after:
>     - shard-adlp:         [PASS][97] -> [ABORT][98] ([Intel XE#1358] / [Intel XE#1607])
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2028-2c8a08f54befdd831076e0854fe311569c209835/shard-adlp-8/igt@xe_pm@s4-exec-after.html
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-adlp-9/igt@xe_pm@s4-exec-after.html
> 
>   * igt@xe_pm@s4-multiple-execs:
>     - shard-lnl:          [PASS][99] -> [ABORT][100] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794])
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2028-2c8a08f54befdd831076e0854fe311569c209835/shard-lnl-8/igt@xe_pm@s4-multiple-execs.html
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html
> 
>   * igt@xe_pm@vram-d3cold-threshold:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][101] ([Intel XE#579])
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-dg2-432/igt@xe_pm@vram-d3cold-threshold.html
> 
>   * igt@xe_pm_residency@toggle-gt-c6:
>     - shard-adlp:         [PASS][102] -> [FAIL][103] ([Intel XE#958])
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2028-2c8a08f54befdd831076e0854fe311569c209835/shard-adlp-9/igt@xe_pm_residency@toggle-gt-c6.html
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-adlp-1/igt@xe_pm_residency@toggle-gt-c6.html
> 
>   * igt@xe_query@multigpu-query-invalid-size:
>     - shard-adlp:         NOTRUN -> [SKIP][104] ([Intel XE#944])
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-adlp-4/igt@xe_query@multigpu-query-invalid-size.html
> 
>   * igt@xe_query@multigpu-query-mem-usage:
>     - shard-lnl:          NOTRUN -> [SKIP][105] ([Intel XE#944])
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-lnl-3/igt@xe_query@multigpu-query-mem-usage.html
> 
>   * igt@xe_wedged@basic-wedged:
>     - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][106] ([Intel XE#2919])
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-dg2-432/igt@xe_wedged@basic-wedged.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_async_flips@async-flip-suspend-resume@pipe-c-dp-2:
>     - {shard-bmg}:        [DMESG-WARN][107] -> [PASS][108] +1 other test pass
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2028-2c8a08f54befdd831076e0854fe311569c209835/shard-bmg-3/igt@kms_async_flips@async-flip-suspend-resume@pipe-c-dp-2.html
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-bmg-6/igt@kms_async_flips@async-flip-suspend-resume@pipe-c-dp-2.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:
>     - shard-adlp:         [DMESG-WARN][109] ([Intel XE#324]) -> [PASS][110] +1 other test pass
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2028-2c8a08f54befdd831076e0854fe311569c209835/shard-adlp-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html
> 
>   * igt@kms_atomic_transition@modeset-transition-nonblocking:
>     - shard-lnl:          [FAIL][111] ([Intel XE#1701]) -> [PASS][112] +1 other test pass
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2028-2c8a08f54befdd831076e0854fe311569c209835/shard-lnl-4/igt@kms_atomic_transition@modeset-transition-nonblocking.html
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-lnl-1/igt@kms_atomic_transition@modeset-transition-nonblocking.html
> 
>   * igt@kms_big_fb@linear-64bpp-rotate-180:
>     - shard-dg2-set2:     [DMESG-WARN][113] ([Intel XE#877]) -> [PASS][114]
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2028-2c8a08f54befdd831076e0854fe311569c209835/shard-dg2-435/igt@kms_big_fb@linear-64bpp-rotate-180.html
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-dg2-464/igt@kms_big_fb@linear-64bpp-rotate-180.html
> 
>   * igt@kms_big_fb@x-tiled-64bpp-rotate-0:
>     - shard-lnl:          [FAIL][115] ([Intel XE#1659] / [Intel XE#1874]) -> [PASS][116]
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2028-2c8a08f54befdd831076e0854fe311569c209835/shard-lnl-4/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-lnl-1/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
>     - {shard-bmg}:        [FAIL][117] ([Intel XE#2436]) -> [PASS][118] +1 other test pass
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2028-2c8a08f54befdd831076e0854fe311569c209835/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
>     - shard-dg2-set2:     [INCOMPLETE][119] ([Intel XE#1195] / [Intel XE#1727]) -> [PASS][120]
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2028-2c8a08f54befdd831076e0854fe311569c209835/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6:
>     - shard-dg2-set2:     [INCOMPLETE][121] ([Intel XE#1195]) -> [PASS][122]
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2028-2c8a08f54befdd831076e0854fe311569c209835/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html
> 
>   * igt@kms_cursor_edge_walk@64x64-top-edge:
>     - shard-lnl:          [FAIL][123] -> [PASS][124] +2 other tests pass
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2028-2c8a08f54befdd831076e0854fe311569c209835/shard-lnl-3/igt@kms_cursor_edge_walk@64x64-top-edge.html
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-lnl-3/igt@kms_cursor_edge_walk@64x64-top-edge.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
>     - {shard-bmg}:        [DMESG-WARN][125] ([Intel XE#2791] / [Intel XE#877]) -> [PASS][126]
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2028-2c8a08f54befdd831076e0854fe311569c209835/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
>     - shard-lnl:          [FAIL][127] ([Intel XE#1475]) -> [PASS][128]
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2028-2c8a08f54befdd831076e0854fe311569c209835/shard-lnl-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-lnl-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
>     - shard-dg2-set2:     [FAIL][129] -> [PASS][130]
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2028-2c8a08f54befdd831076e0854fe311569c209835/shard-dg2-466/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-dg2-433/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
> 
>   * igt@kms_cursor_legacy@torture-move@all-pipes:
>     - shard-dg2-set2:     [DMESG-WARN][131] ([Intel XE#1620]) -> [PASS][132] +1 other test pass
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2028-2c8a08f54befdd831076e0854fe311569c209835/shard-dg2-464/igt@kms_cursor_legacy@torture-move@all-pipes.html
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-dg2-432/igt@kms_cursor_legacy@torture-move@all-pipes.html
> 
>   * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1:
>     - shard-lnl:          [FAIL][133] ([Intel XE#886]) -> [PASS][134] +4 other tests pass
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2028-2c8a08f54befdd831076e0854fe311569c209835/shard-lnl-3/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1.html
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-lnl-5/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4:
>     - shard-dg2-set2:     [FAIL][135] ([Intel XE#301]) -> [PASS][136] +6 other tests pass
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2028-2c8a08f54befdd831076e0854fe311569c209835/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6:
>     - shard-dg2-set2:     [FAIL][137] ([Intel XE#1204]) -> [PASS][138]
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2028-2c8a08f54befdd831076e0854fe311569c209835/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6.html
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@a-dp2:
>     - {shard-bmg}:        [FAIL][139] ([Intel XE#301]) -> [PASS][140] +3 other tests pass
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2028-2c8a08f54befdd831076e0854fe311569c209835/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank@a-dp2.html
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank@a-dp2.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling@pipe-a-valid-mode:
>     - shard-adlp:         [DMESG-WARN][141] ([Intel XE#1033] / [Intel XE#1727]) -> [PASS][142] +1 other test pass
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2028-2c8a08f54befdd831076e0854fe311569c209835/shard-adlp-6/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling@pipe-a-valid-mode.html
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-adlp-1/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc:
>     - shard-lnl:          [DMESG-WARN][143] -> [PASS][144] +1 other test pass
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2028-2c8a08f54befdd831076e0854fe311569c209835/shard-lnl-5/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc.html
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-4:
>     - shard-lnl:          [DMESG-WARN][145] ([Intel XE#324]) -> [PASS][146] +6 other tests pass
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2028-2c8a08f54befdd831076e0854fe311569c209835/shard-lnl-5/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-4.html
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-lnl-1/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-4.html
> 
>   * igt@kms_plane@plane-position-hole@pipe-a-plane-4:
>     - shard-lnl:          [DMESG-FAIL][147] ([Intel XE#324]) -> [PASS][148] +2 other tests pass
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2028-2c8a08f54befdd831076e0854fe311569c209835/shard-lnl-4/igt@kms_plane@plane-position-hole@pipe-a-plane-4.html
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-lnl-1/igt@kms_plane@plane-position-hole@pipe-a-plane-4.html
> 
>   * igt@xe_drm_fdinfo@utilization-others-idle:
>     - shard-lnl:          [FAIL][149] ([Intel XE#2667]) -> [PASS][150] +1 other test pass
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2028-2c8a08f54befdd831076e0854fe311569c209835/shard-lnl-3/igt@xe_drm_fdinfo@utilization-others-idle.html
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-lnl-5/igt@xe_drm_fdinfo@utilization-others-idle.html
> 
>   * igt@xe_evict@evict-beng-threads-large:
>     - shard-dg2-set2:     [TIMEOUT][151] ([Intel XE#1473]) -> [PASS][152]
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2028-2c8a08f54befdd831076e0854fe311569c209835/shard-dg2-466/igt@xe_evict@evict-beng-threads-large.html
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-dg2-433/igt@xe_evict@evict-beng-threads-large.html
> 
>   * igt@xe_gt_freq@freq_reset_multiple:
>     - shard-lnl:          [DMESG-FAIL][153] ([Intel XE#1620]) -> [PASS][154]
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2028-2c8a08f54befdd831076e0854fe311569c209835/shard-lnl-5/igt@xe_gt_freq@freq_reset_multiple.html
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-lnl-6/igt@xe_gt_freq@freq_reset_multiple.html
> 
>   * igt@xe_pm@s4-d3hot-basic-exec:
>     - shard-lnl:          [ABORT][155] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][156] +1 other test pass
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2028-2c8a08f54befdd831076e0854fe311569c209835/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.html
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-lnl-7/igt@xe_pm@s4-d3hot-basic-exec.html
> 
>   * igt@xe_pm@s4-multiple-execs:
>     - shard-adlp:         [ABORT][157] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794]) -> [PASS][158]
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2028-2c8a08f54befdd831076e0854fe311569c209835/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-adlp-4/igt@xe_pm@s4-multiple-execs.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y:
>     - shard-adlp:         [DMESG-WARN][159] ([Intel XE#324]) -> [DMESG-WARN][160] ([Intel XE#1033])
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2028-2c8a08f54befdd831076e0854fe311569c209835/shard-adlp-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html
>    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
>     - shard-adlp:         [FAIL][161] ([Intel XE#1231]) -> [DMESG-FAIL][162] ([Intel XE#324])
>    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2028-2c8a08f54befdd831076e0854fe311569c209835/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
>    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
> 
>   * igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1:
>     - shard-adlp:         [TIMEOUT][163] -> [SKIP][164] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
>    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2028-2c8a08f54befdd831076e0854fe311569c209835/shard-adlp-6/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1.html
>    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-adlp-1/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:
>     - shard-adlp:         [TIMEOUT][165] -> [FAIL][166] ([Intel XE#1861])
>    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2028-2c8a08f54befdd831076e0854fe311569c209835/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html
>    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render:
>     - shard-adlp:         [TIMEOUT][167] -> [SKIP][168] ([Intel XE#656])
>    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2028-2c8a08f54befdd831076e0854fe311569c209835/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render.html
>    [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_plane@pixel-format-source-clamping:
>     - shard-adlp:         [INCOMPLETE][169] ([Intel XE#1035]) -> [INCOMPLETE][170] ([Intel XE#1035] / [Intel XE#1195])
>    [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2028-2c8a08f54befdd831076e0854fe311569c209835/shard-adlp-3/igt@kms_plane@pixel-format-source-clamping.html
>    [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-adlp-4/igt@kms_plane@pixel-format-source-clamping.html
> 
>   * igt@kms_plane@plane-position-hole:
>     - shard-lnl:          [DMESG-FAIL][171] ([Intel XE#324]) -> [DMESG-WARN][172] ([Intel XE#324])
>    [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2028-2c8a08f54befdd831076e0854fe311569c209835/shard-lnl-4/igt@kms_plane@plane-position-hole.html
>    [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-lnl-1/igt@kms_plane@plane-position-hole.html
> 
>   * igt@kms_pm_dc@dc9-dpms:
>     - shard-adlp:         [SKIP][173] ([Intel XE#734]) -> [FAIL][174] ([Intel XE#1204])
>    [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2028-2c8a08f54befdd831076e0854fe311569c209835/shard-adlp-3/igt@kms_pm_dc@dc9-dpms.html
>    [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-adlp-8/igt@kms_pm_dc@dc9-dpms.html
> 
>   * igt@kms_setmode@basic@pipe-a-edp-1:
>     - shard-lnl:          [FAIL][175] ([Intel XE#2947]) -> [FAIL][176] ([Intel XE#2883])
>    [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2028-2c8a08f54befdd831076e0854fe311569c209835/shard-lnl-1/igt@kms_setmode@basic@pipe-a-edp-1.html
>    [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-lnl-4/igt@kms_setmode@basic@pipe-a-edp-1.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-dg2-set2:     [SKIP][177] ([Intel XE#1500]) -> [SKIP][178] ([Intel XE#362])
>    [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2028-2c8a08f54befdd831076e0854fe311569c209835/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>    [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   * igt@xe_evict@evict-mixed-many-threads-large:
>     - shard-dg2-set2:     [TIMEOUT][179] ([Intel XE#1473]) -> [FAIL][180] ([Intel XE#1000])
>    [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2028-2c8a08f54befdd831076e0854fe311569c209835/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-large.html
>    [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-large.html
> 
>   * igt@xe_pm@s3-vm-bind-userptr:
>     - shard-dg2-set2:     [FAIL][181] ([Intel XE#2028]) -> [ABORT][182] ([Intel XE#1794])
>    [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2028-2c8a08f54befdd831076e0854fe311569c209835/shard-dg2-464/igt@xe_pm@s3-vm-bind-userptr.html
>    [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-dg2-432/igt@xe_pm@s3-vm-bind-userptr.html
> 
>   * igt@xe_pm@s4-d3hot-basic-exec:
>     - shard-dg2-set2:     [DMESG-WARN][183] -> [ABORT][184] ([Intel XE#1358])
>    [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2028-2c8a08f54befdd831076e0854fe311569c209835/shard-dg2-464/igt@xe_pm@s4-d3hot-basic-exec.html
>    [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/shard-dg2-432/igt@xe_pm@s4-d3hot-basic-exec.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
>   [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
>   [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
>   [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
>   [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
>   [Intel XE#1151]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1151
>   [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>   [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
>   [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
>   [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
>   [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>   [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
>   [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
>   [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
>   [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
>   [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
>   [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
>   [Intel XE#1620]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620
>   [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
>   [Intel XE#1701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701
>   [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
>   [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
>   [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
>   [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
>   [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
>   [Intel XE#2028]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028
>   [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
>   [Intel XE#2159]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2159
>   [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
>   [Intel XE#2364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364
>   [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
>   [Intel XE#2436]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2436
>   [Intel XE#2472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472
>   [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
>   [Intel XE#2514]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514
>   [Intel XE#2566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566
>   [Intel XE#2577]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2577
>   [Intel XE#2667]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2667
>   [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
>   [Intel XE#2791]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2791
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>   [Intel XE#2864]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2864
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
>   [Intel XE#2919]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919
>   [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
>   [Intel XE#2947]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2947
>   [Intel XE#2948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948
>   [Intel XE#2990]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2990
>   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>   [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
>   [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
>   [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
>   [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
>   [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
>   [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
>   [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
>   [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
>   [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#734]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/734
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
>   [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
>   [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>   [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-2028-2c8a08f54befdd831076e0854fe311569c209835 -> xe-pw-139750v1
> 
>   IGT_8061: 8061
>   xe-2028-2c8a08f54befdd831076e0854fe311569c209835: 2c8a08f54befdd831076e0854fe311569c209835
>   xe-pw-139750v1: 139750v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139750v1/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
