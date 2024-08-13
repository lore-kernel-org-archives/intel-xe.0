Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE645C52D7B
	for <intel-xe@archiver.kernel.org>; Tue, 13 Aug 2024 17:16:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A410410E3AB;
	Tue, 13 Aug 2024 17:16:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QtOzKxDu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5572910E3AB
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Aug 2024 17:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723569382; x=1755105382;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=aG/VNqB4xUR+O+1Ez0BnqHMIudpUuWrJbsqxuQieiOk=;
 b=QtOzKxDu9kaxYseMyTHeVzm0EXapNY135o3zyUN5U6IsAfas9lvNw5JT
 kt/YF/DRe2BhFMNcWe5uDFTipDCdm42fASXBbYIPVfC6XwofZmxwm+M9N
 SK3rnT2mPUw3vKMZYtxKn1ELrnc+olLqDb5nxAV5gF46mWNpDdONp3eXW
 1lN87kLmCIjuxmG/2XiHCmG7uxfX3d7aWgpuJJfGKmIiY/3TExJ5dzwU+
 baBn3av5ymRtmzTCWMzU1nRr6UFQktScjZ9CYEsT6S9cCRmuOfa1tqWzi
 cbeE1rBqC/0rUHFa1z0ZN+RREqP4K22E7wt+Jv1Tosl6eOehXaIVZ6XPX w==;
X-CSE-ConnectionGUID: rG6NAbSKTi686AGapjXH/g==
X-CSE-MsgGUID: TRmSe510TSWCtQLur7GIhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="33156060"
X-IronPort-AV: E=Sophos;i="6.09,286,1716274800"; d="scan'208";a="33156060"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 10:16:18 -0700
X-CSE-ConnectionGUID: /bFT2o5oTKCXa24UFMDQCA==
X-CSE-MsgGUID: oXzOc/zkQr6jORPdZVy0mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,286,1716274800"; d="scan'208";a="63665398"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Aug 2024 10:16:17 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 13 Aug 2024 10:16:16 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 13 Aug 2024 10:16:16 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 13 Aug 2024 10:16:15 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 13 Aug 2024 10:16:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KiupvAbRctGLIgvLyyeLiBqYKeAX8sG7nXyn86eLw9Gxbz5AbF1lMucxhq7NyWsvbjVV6zqk9KHJxD+Dp/29hrBvb2w7AH9kEfumJFbm1Y4btRxwwyuoXP5nq2Oi7wNRkpDxmZQ9XCQacgz3jXsIn+eY97Lh3fwg40jeqheqGkhZrwFeHFklbjiyxXeFUMDkXIL6twaWhEGOalMOo1w+mf5GBH2dntydcy+jBKcM0WJ6Hrx+oWbLjw8zQgG3T1fxwM84/8Pa3yRuCSpgj9TDvdoG+RwsY92oT1BvpO+kgAMBxFKMI0+Sw0KtEd5jaLO8Dmo9viUPt8piAamgBIzI2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=19NAsm0DczTJip6BmYR04RGEA42Io9NYGxT4Jk2xUwg=;
 b=M1Hv902ZBw26rCgfsM+oorPenW17rCyeMIgfzIYQzEg2U1FGaG7m5Goa24pZMabJRH7t5lXE3Mou4l296HF8WBuIMZnJVF8if0cHzedPVeeoibvuU7YGZxAbnoQ6cUDPfRV1+LibBB7mhlVacqDCApnXt4eCAkgfGD6pjzY/0kcLR3zvYEhbypn5l8+HLaF7Ih5Gjv5sYWntmUNwjS9BeQtB44qZHkDI6ERL/rRUgkB1c04D+CVrbt42k5YMh96yWKujGZDjhEuyfZ+SHaBzTeTM9UnEr5gOmb7+fMwXFLRBKOL0HmHfpEruIcvoZms4OP24QLSP4p3ftiGJ+c4V2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH8PR11MB7023.namprd11.prod.outlook.com (2603:10b6:510:221::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.31; Tue, 13 Aug
 2024 17:15:49 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.7828.031; Tue, 13 Aug 2024
 17:15:48 +0000
Date: Tue, 13 Aug 2024 10:15:45 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIENJLkZVTEw=?= =?utf-8?Q?=3A?= failure for drm/xe:
 Name and document Wa_14019789679
Message-ID: <20240813171545.GJ5091@mdroper-desk1.amr.corp.intel.com>
References: <20240812181042.2013508-2-matthew.d.roper@intel.com>
 <172350950858.596184.12119525279155093440@2413ebb6fbb6>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <172350950858.596184.12119525279155093440@2413ebb6fbb6>
X-ClientProxiedBy: BYAPR21CA0017.namprd21.prod.outlook.com
 (2603:10b6:a03:114::27) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH8PR11MB7023:EE_
X-MS-Office365-Filtering-Correlation-Id: e90bd94b-c378-4a4b-2bf5-08dcbbbb935c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?SzEGAHIN1nw3VUmE5If2WBiC5Z4tX9Y6KAheipCkBIeXnhoCy2jlfRdmyqRa?=
 =?us-ascii?Q?dQQNRCoYiX7U+pIVQlvlC49eYcSGuLewoLKKcyU2eAcMD3iltyC+NpfVC1nB?=
 =?us-ascii?Q?8X7FVACik8h4b2gRtholux3FhgQia5laPUwpFrcrsqHHcFfkJYxRD6V65Rfb?=
 =?us-ascii?Q?z9kRaJA7KTdIB2FTNJZwSiMNR6dNhz8TdnlajalcKP68vwGwd4ONNHm9i3Ai?=
 =?us-ascii?Q?Ot59+yTP+XHacSEj0Niq3BDaO9PYoXHTie1dXSuGErmddQxD4uA/VCodMRO8?=
 =?us-ascii?Q?cnDDZcpEXPPbpquYAe6H1g9AVbzTH7zszoPpnYv96nTv6h7dXmBaR+5rJycl?=
 =?us-ascii?Q?2x6neMDCYQjYM/pzb7LWZI1KzkFaHoYNHWquTDsNYlBmiww4XHSkTAncqCzP?=
 =?us-ascii?Q?31hCLutRoNyZ/z+nMyzxguEFgrmT66WENB+UZlRAie9Pv9fjy9COggJDZf2d?=
 =?us-ascii?Q?R5jIRB+MxHa7PjvmQ5UUPI/syuwrbZ+pKITd8qIIcBZIH1CNxg8x03BBU4uL?=
 =?us-ascii?Q?sdQVo025JTkYPkJ+E8v0c9n6gv9c77/rJWfLT8wNkC5y2pnbb6twFXSKGP+4?=
 =?us-ascii?Q?g4FdKdm/iBQ0TESS9FnJMEFaTYfy221Q84ubSj8lTgck6O0qmRk3xC22pMLv?=
 =?us-ascii?Q?Jo396YhNWjQ7bxjBXWo8jcMDS+7laYbY9JI0jw1s6brkJ5G3AShxa1wjG7/o?=
 =?us-ascii?Q?Zg2JoSsCOmxzodWh4KxUqx8qV5U4gHXbm4a7ElSbWe5V3Hu6Nut+1JjeUjVk?=
 =?us-ascii?Q?z3Q4xCypz/wrVWwnh9/O3hobsT47qX6xWLgTqhpEgshU+FBI0vDcKVGa1xt9?=
 =?us-ascii?Q?7w2/DvZxFS5+XJtCoAXq9BqJDk1TrFdTZbxq6EqBr1LLlqgG9rvH5fXMh2L/?=
 =?us-ascii?Q?exw0XuvSjO25LoobpHXAFn/z7Ymp6WIhxpc0GyvE/ewTAN/DgBWKQCIMvzSy?=
 =?us-ascii?Q?PxZfh9G033KWPtS4fgvLfnE53PbdbupB5+A8fgGDXHOh/X2gozxPLKvRjkhW?=
 =?us-ascii?Q?wXU/5Rbq27NgUz64Pcg4YF9cDs96ZXyFKcjvYPr2xuEs6k3rTszTrnRGIBXy?=
 =?us-ascii?Q?/TqjJIZg9tBj5FFwVeUQjaOZrSqYBHGgr10fTMzl0tEBoOvcu6NX2Gx8P5Th?=
 =?us-ascii?Q?PVrHIgapyJMANHuS6VuMwCrJFWuAKcVZ3uwZMfqlwadf3qR3VXFWZiXNjoHw?=
 =?us-ascii?Q?YxxdOWsCOWSStEaNi4B7yeWkCZb7UUTZcPF8nTJ8mfUF071H5fOuukrP1sYn?=
 =?us-ascii?Q?/L9FigXUZA0c7KXRNoY/Q9qHeZtc8AQ1qTcNdGBxeK9C3EKCgSvm6kpjbBz6?=
 =?us-ascii?Q?eNo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QB8BCDKIJIZqZ0PXbh/48Z0gYrfYwos2ZTdkK5B45C/BIgtR6i+j68pS/ys/?=
 =?us-ascii?Q?1Ud1TUbZIZmgqHwDLcJxGB8/bjQ5z9oFb42tpjoJSOMUccqNZNeyA3JQVp9C?=
 =?us-ascii?Q?83oe3Ne5YNp7Mtjf2mBXXcdGVeAmFNFHkKTr5ACvy4YM8av/gowHDwM8jpCL?=
 =?us-ascii?Q?k1F7UT6BOQ2w0gchORPGI9hrlECfgo98Av1Sovrg8UCxZhVQPifyArMMt11Q?=
 =?us-ascii?Q?9Xi+tQojf3g06KL00UlV3pTiT/71SngFiNF1u8jbi597pYTNlYi+5tLX/QSb?=
 =?us-ascii?Q?5phMHHt9Bh19Qlel1GfBATaWMe2G/xVKdBvktJGL+eIltQmlkM4UHGrrFl7Y?=
 =?us-ascii?Q?vZEl6UOVQEwr/Gc5SBKwbWwctRaV3FSLgWudTGB082kaGLi96x0j99V5ONW6?=
 =?us-ascii?Q?xhkOPDuRG+9RhNiTSoufwVQOPWOg8m+D+ChJe1HlhetyC4eHvkV3lxtEAf8D?=
 =?us-ascii?Q?85iZkPXhDSRqzU8dMsDR6XV2H5Zmd0ZjvQnjLNXZKVo0bYenlyvVICke7TDl?=
 =?us-ascii?Q?fZQ5tGjeIwIBk6uGCPIb01uA5cvP+6bul5JgGGDJtfpK9BF3qhqS7qXO8d3L?=
 =?us-ascii?Q?woQaMEhoJRodgwTxayJZ1u07JcFGKY5lTCxiP5v0KevCwd6PvKzIaElp6JEJ?=
 =?us-ascii?Q?yRZYoBT6Khr1xnpGi2S9SjasU5LbffuExDw8wBn/csQ1Mp3jLNpMou77hyNB?=
 =?us-ascii?Q?55JF4m0nwseMEHyinM//7kiIeTgvzBQW9UUEdy3Rfn2famqclc5pzmuNqJ2o?=
 =?us-ascii?Q?6xWKz/Xp9wQxFyTVYSRuXNvTeQthDxqO8bM2OK3la7r1B141BoPtbsZdLhi2?=
 =?us-ascii?Q?LcCO50atwpq1HQbUkIfjFHCccK9yUaIH15QpR7p4gqEdl7As8fXdfV8Ei2RD?=
 =?us-ascii?Q?rXMR5vvW+o1RTN1uzXYh8r1FdO0eL4VlsbUpO/ny740TgzWuJE/DFJ7IkXno?=
 =?us-ascii?Q?mQa0mVQVoF3sLlWWUFkPa7Qh3L+8J34x7z6SsoRZ/32a4FN8etwRPZ/ueEzj?=
 =?us-ascii?Q?bim1D+AJ0AvVqrJH1jQu+QR9z5kEWwix5/S1vsG7vFWZcEjN4TiZkvfQ6LLa?=
 =?us-ascii?Q?5EBqj7RGiDOxawW21nze8ZNQi/ySAqrlPxkzo8LYBdqqDsm+GNB6yi9xecfS?=
 =?us-ascii?Q?VPt3Rkh4kXCjL1P2n1qlLiXUgmQymBnhllnwSpk1/N1SDahpWPNO/Oi6n1K2?=
 =?us-ascii?Q?GsDk5BTfrVaNO0XnxPhlevQoZfgsy778OGtAsQ+t4h9dxHUNxRA+c/qe5x0+?=
 =?us-ascii?Q?3mDS9n+op+nTeeIPpZ2AOe+3+VdY3hn4AA2wkZL0IhERdPKvmdiejm6XwF9P?=
 =?us-ascii?Q?XxbRcB+nkLrIWTjyPyy5RRUlCrp24KuQm3GFF0X6vWJyiGI1pK497uGIybS8?=
 =?us-ascii?Q?v95qda86myFDZsNa+RXX6BzbQJ8i3U1x0RO8ENihMPgqDjRn2rgraDL+KBZR?=
 =?us-ascii?Q?dRZeREUWrm0+nx3kjIiLUGIlqXmEeJ1O1Oth86qvQcIxF0erDBNPwZVWuMFC?=
 =?us-ascii?Q?NbQojchQeAcN2H19XBABjK6duf4N6B4bNHE77Bvt+Pu/l7kXJ9BWVLfVTipR?=
 =?us-ascii?Q?bQvWLETb6szn5CrmEOJ0IdYo/CKhL5X8VoA5GBcfOcWQK9e8AygTqGnK+TUO?=
 =?us-ascii?Q?EQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e90bd94b-c378-4a4b-2bf5-08dcbbbb935c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2024 17:15:48.8193 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: skQHSKF7wIhf/xxYaMTA4RLRj67dP7TuFePhH1hL7VupruL12PJLG1ZSLeevcqP2pDKgKOAkPWMCLX5A9MIpYJBYTRfmf6UMwguGqY/59b0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7023
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

On Tue, Aug 13, 2024 at 12:38:28AM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe: Name and document Wa_14019789679
> URL   : https://patchwork.freedesktop.org/series/137200/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093_full -> xe-pw-137200v1_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-137200v1_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-137200v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in xe-pw-137200v1_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_cursor_crc@cursor-offscreen-64x64@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     [PASS][1] -> [DMESG-WARN][2] +2 other tests dmesg-warn
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093/shard-dg2-434/igt@kms_cursor_crc@cursor-offscreen-64x64@pipe-d-hdmi-a-6.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-64x64@pipe-d-hdmi-a-6.html

https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1705

> 
>   
> #### Warnings ####
> 
>   * igt@xe_oa@closed-fd-and-unmapped-access:
>     - shard-dg2-set2:     [SKIP][3] ([Intel XE#1201]) -> [SKIP][4] +4 other tests skip
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093/shard-dg2-435/igt@xe_oa@closed-fd-and-unmapped-access.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-dg2-432/igt@xe_oa@closed-fd-and-unmapped-access.html

Expected skip for DG2:

        /* Currently only run on Xe2+ */
        igt_require(intel_graphics_ver(devid) >= IP_VER(20, 0));


Patch applied to drm-xe-next.  Thanks Jonathan for the review.


Matt

> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * igt@kms_cursor_legacy@torture-move@pipe-b:
>     - {shard-bmg}:        [PASS][5] -> [DMESG-WARN][6]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093/shard-bmg-2/igt@kms_cursor_legacy@torture-move@pipe-b.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-bmg-1/igt@kms_cursor_legacy@torture-move@pipe-b.html
> 
>   * igt@kms_flip@2x-absolute-wf_vblank-interruptible@bc-dp2-hdmi-a3:
>     - {shard-bmg}:        [PASS][7] -> [INCOMPLETE][8] +1 other test incomplete
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093/shard-bmg-2/igt@kms_flip@2x-absolute-wf_vblank-interruptible@bc-dp2-hdmi-a3.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-bmg-1/igt@kms_flip@2x-absolute-wf_vblank-interruptible@bc-dp2-hdmi-a3.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-137200v1_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>     - shard-lnl:          NOTRUN -> [FAIL][9] ([Intel XE#1659])
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-lnl-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
> 
>   * igt@kms_big_fb@linear-16bpp-rotate-270:
>     - shard-lnl:          NOTRUN -> [SKIP][10] ([Intel XE#1407]) +2 other tests skip
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-lnl-4/igt@kms_big_fb@linear-16bpp-rotate-270.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
>     - shard-lnl:          NOTRUN -> [SKIP][11] ([Intel XE#1124]) +7 other tests skip
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-lnl-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb:
>     - shard-lnl:          NOTRUN -> [SKIP][12] ([Intel XE#1467])
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-lnl-1/igt@kms_big_fb@yf-tiled-addfb.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
>     - shard-lnl:          NOTRUN -> [SKIP][13] ([Intel XE#1428])
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-lnl-4/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
> 
>   * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
>     - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#1512]) +2 other tests skip
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-lnl-4/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
> 
>   * igt@kms_bw@linear-tiling-3-displays-3840x2160p:
>     - shard-lnl:          NOTRUN -> [SKIP][15] ([Intel XE#367])
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-lnl-1/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:
>     - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#1399]) +10 other tests skip
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-lnl-4/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html
> 
>   * igt@kms_chamelium_color@gamma:
>     - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#306]) +1 other test skip
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-lnl-1/igt@kms_chamelium_color@gamma.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
>     - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#373]) +6 other tests skip
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-lnl-1/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-512x170:
>     - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#1413]) +1 other test skip
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-lnl-4/igt@kms_cursor_crc@cursor-onscreen-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-random-32x10:
>     - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#1424]) +3 other tests skip
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-lnl-1/igt@kms_cursor_crc@cursor-random-32x10.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
>     - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#309]) +6 other tests skip
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
> 
>   * igt@kms_dsc@dsc-with-bpc-formats:
>     - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#599]) +5 other tests skip
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-lnl-8/igt@kms_dsc@dsc-with-bpc-formats.html
> 
>   * igt@kms_flip@2x-plain-flip-ts-check:
>     - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#1421]) +5 other tests skip
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-lnl-1/igt@kms_flip@2x-plain-flip-ts-check.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
>     - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#1401] / [Intel XE#1745]) +2 other tests skip
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-default-mode:
>     - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#1401]) +2 other tests skip
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:
>     - shard-lnl:          NOTRUN -> [SKIP][26] ([Intel XE#1397] / [Intel XE#1745])
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode:
>     - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#1397])
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#656]) +28 other tests skip
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-tiling-y:
>     - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#1469])
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:
>     - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#651]) +13 other tests skip
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html
> 
>   * igt@kms_hdr@bpc-switch-suspend:
>     - shard-lnl:          NOTRUN -> [FAIL][31] ([Intel XE#2028]) +1 other test fail
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-lnl-1/igt@kms_hdr@bpc-switch-suspend.html
> 
>   * igt@kms_hdr@invalid-hdr:
>     - shard-dg2-set2:     [PASS][32] -> [SKIP][33] ([Intel XE#1201] / [Intel XE#455])
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093/shard-dg2-463/igt@kms_hdr@invalid-hdr.html
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-dg2-433/igt@kms_hdr@invalid-hdr.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1:
>     - shard-lnl:          [PASS][34] -> [FAIL][35] ([Intel XE#2028]) +8 other tests fail
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093/shard-lnl-6/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1.html
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-lnl-1/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     [PASS][36] -> [DMESG-WARN][37] ([Intel XE#2019])
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093/shard-dg2-433/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-6.html
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-dg2-434/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-6.html
> 
>   * igt@kms_plane@plane-position-covered@pipe-b-plane-4:
>     - shard-lnl:          [PASS][38] -> [DMESG-WARN][39] ([Intel XE#324])
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093/shard-lnl-4/igt@kms_plane@plane-position-covered@pipe-b-plane-4.html
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-lnl-2/igt@kms_plane@plane-position-covered@pipe-b-plane-4.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [PASS][40] -> [FAIL][41] ([Intel XE#361]) +2 other tests fail
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#498]) +3 other tests skip
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-lnl-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b-edp-1.html
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:
>     - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#2318]) +7 other tests skip
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-lnl-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html
> 
>   * igt@kms_pm_dc@dc5-dpms-negative:
>     - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#1131])
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-lnl-1/igt@kms_pm_dc@dc5-dpms-negative.html
> 
>   * igt@kms_psr@pr-no-drrs:
>     - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#1406]) +5 other tests skip
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-lnl-4/igt@kms_psr@pr-no-drrs.html
> 
>   * igt@kms_rotation_crc@bad-tiling:
>     - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#1437]) +1 other test skip
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-lnl-8/igt@kms_rotation_crc@bad-tiling.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
>     - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#1127])
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-lnl-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#362])
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-lnl-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   * igt@xe_evict@evict-beng-large-cm:
>     - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#688]) +5 other tests skip
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-lnl-4/igt@xe_evict@evict-beng-large-cm.html
> 
>   * igt@xe_evict@evict-beng-mixed-threads-large:
>     - shard-dg2-set2:     [PASS][50] -> [INCOMPLETE][51] ([Intel XE#1195] / [Intel XE#1473])
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093/shard-dg2-463/igt@xe_evict@evict-beng-mixed-threads-large.html
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-dg2-466/igt@xe_evict@evict-beng-mixed-threads-large.html
> 
>   * igt@xe_exec_basic@multigpu-once-userptr:
>     - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#1392]) +6 other tests skip
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-lnl-1/igt@xe_exec_basic@multigpu-once-userptr.html
> 
>   * igt@xe_mmap@small-bar:
>     - shard-lnl:          NOTRUN -> [SKIP][53] ([Intel XE#512])
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-lnl-4/igt@xe_mmap@small-bar.html
> 
>   * igt@xe_pm@s4-basic-exec:
>     - shard-adlp:         [PASS][54] -> [ABORT][55] ([Intel XE#1358] / [Intel XE#1794])
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093/shard-adlp-8/igt@xe_pm@s4-basic-exec.html
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-adlp-9/igt@xe_pm@s4-basic-exec.html
> 
>   * igt@xe_pm@s4-d3cold-basic-exec:
>     - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#2284] / [Intel XE#366]) +1 other test skip
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-lnl-4/igt@xe_pm@s4-d3cold-basic-exec.html
> 
>   * igt@xe_pm@s4-vm-bind-unbind-all:
>     - shard-adlp:         [PASS][57] -> [ABORT][58] ([Intel XE#1794])
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093/shard-adlp-2/igt@xe_pm@s4-vm-bind-unbind-all.html
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html
> 
>   * igt@xe_pm_residency@gt-c6-freeze:
>     - shard-lnl:          [PASS][59] -> [FAIL][60] ([Intel XE#2028] / [Intel XE#2512]) +1 other test fail
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093/shard-lnl-6/igt@xe_pm_residency@gt-c6-freeze.html
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-lnl-1/igt@xe_pm_residency@gt-c6-freeze.html
> 
>   * igt@xe_query@multigpu-query-invalid-extension:
>     - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#944]) +1 other test skip
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-lnl-1/igt@xe_query@multigpu-query-invalid-extension.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-3:
>     - {shard-bmg}:        [DMESG-WARN][62] ([Intel XE#1033]) -> [PASS][63]
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-3.html
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-3.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y:
>     - shard-adlp:         [DMESG-WARN][64] ([Intel XE#324]) -> [PASS][65]
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y.html
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x:
>     - shard-adlp:         [DMESG-WARN][66] -> [PASS][67]
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x.html
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
>     - shard-adlp:         [FAIL][68] ([Intel XE#1426]) -> [PASS][69] +1 other test pass
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093/shard-adlp-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-adlp-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
>     - shard-lnl:          [FAIL][70] ([Intel XE#1426]) -> [PASS][71] +1 other test pass
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093/shard-lnl-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-lnl-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [FAIL][72] ([Intel XE#1426]) -> [PASS][73] +3 other tests pass
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093/shard-dg2-433/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-dg2-466/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-b-hdmi-a-3:
>     - {shard-bmg}:        [FAIL][74] ([Intel XE#2436]) -> [PASS][75]
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-b-hdmi-a-3.html
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-b-hdmi-a-3.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-64x64:
>     - {shard-bmg}:        [DMESG-WARN][76] -> [PASS][77] +3 other tests pass
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093/shard-bmg-4/igt@kms_cursor_crc@cursor-offscreen-64x64.html
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-64x64.html
> 
>   * igt@kms_flip@flip-vs-absolute-wf_vblank:
>     - shard-lnl:          [FAIL][78] ([Intel XE#886]) -> [PASS][79] +2 other tests pass
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093/shard-lnl-3/igt@kms_flip@flip-vs-absolute-wf_vblank.html
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-lnl-6/igt@kms_flip@flip-vs-absolute-wf_vblank.html
> 
>   * igt@kms_flip@flip-vs-suspend@b-hdmi-a3:
>     - {shard-bmg}:        [INCOMPLETE][80] -> [PASS][81] +1 other test pass
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093/shard-bmg-7/igt@kms_flip@flip-vs-suspend@b-hdmi-a3.html
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-bmg-3/igt@kms_flip@flip-vs-suspend@b-hdmi-a3.html
> 
>   * igt@kms_flip@flip-vs-suspend@c-dp4:
>     - shard-dg2-set2:     [INCOMPLETE][82] ([Intel XE#1195] / [Intel XE#2049]) -> [PASS][83]
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093/shard-dg2-466/igt@kms_flip@flip-vs-suspend@c-dp4.html
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-dg2-435/igt@kms_flip@flip-vs-suspend@c-dp4.html
> 
>   * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:
>     - shard-adlp:         [FAIL][84] ([Intel XE#1874]) -> [PASS][85] +1 other test pass
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html
> 
>   * igt@kms_plane@plane-position-covered@pipe-a-plane-1:
>     - shard-lnl:          [DMESG-FAIL][86] ([Intel XE#324]) -> [PASS][87]
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093/shard-lnl-4/igt@kms_plane@plane-position-covered@pipe-a-plane-1.html
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-lnl-2/igt@kms_plane@plane-position-covered@pipe-a-plane-1.html
> 
>   * igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3:
>     - shard-lnl:          [DMESG-WARN][88] ([Intel XE#324]) -> [PASS][89] +2 other tests pass
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093/shard-lnl-3/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-lnl-6/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html
> 
>   * igt@kms_pm_rpm@modeset-stress-extra-wait:
>     - shard-lnl:          [DMESG-FAIL][90] ([Intel XE#1620]) -> [PASS][91]
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093/shard-lnl-1/igt@kms_pm_rpm@modeset-stress-extra-wait.html
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-lnl-4/igt@kms_pm_rpm@modeset-stress-extra-wait.html
> 
>   * igt@xe_evict@evict-beng-mixed-many-threads-small:
>     - shard-dg2-set2:     [TIMEOUT][92] ([Intel XE#1473] / [Intel XE#402]) -> [PASS][93]
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093/shard-dg2-432/igt@xe_evict@evict-beng-mixed-many-threads-small.html
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-dg2-463/igt@xe_evict@evict-beng-mixed-many-threads-small.html
> 
>   * igt@xe_evict@evict-cm-threads-large:
>     - {shard-bmg}:        [TIMEOUT][94] ([Intel XE#1473]) -> [PASS][95] +1 other test pass
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093/shard-bmg-6/igt@xe_evict@evict-cm-threads-large.html
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-bmg-8/igt@xe_evict@evict-cm-threads-large.html
> 
>   * igt@xe_evict@evict-threads-large:
>     - shard-dg2-set2:     [TIMEOUT][96] ([Intel XE#1473]) -> [PASS][97]
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093/shard-dg2-435/igt@xe_evict@evict-threads-large.html
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-dg2-433/igt@xe_evict@evict-threads-large.html
> 
>   * igt@xe_exec_basic@many-basic-defer-mmap:
>     - shard-lnl:          [FAIL][98] -> [PASS][99]
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093/shard-lnl-7/igt@xe_exec_basic@many-basic-defer-mmap.html
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-lnl-7/igt@xe_exec_basic@many-basic-defer-mmap.html
> 
>   * igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-race:
>     - shard-lnl:          [INCOMPLETE][100] -> [PASS][101]
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093/shard-lnl-1/igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-race.html
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-lnl-4/igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-race.html
> 
>   * igt@xe_pm@s2idle-exec-after:
>     - shard-lnl:          [FAIL][102] ([Intel XE#2028]) -> [PASS][103] +2 other tests pass
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093/shard-lnl-1/igt@xe_pm@s2idle-exec-after.html
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-lnl-5/igt@xe_pm@s2idle-exec-after.html
> 
>   * igt@xe_pm@s4-mocs:
>     - shard-lnl:          [ABORT][104] ([Intel XE#1794]) -> [PASS][105]
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093/shard-lnl-2/igt@xe_pm@s4-mocs.html
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-lnl-1/igt@xe_pm@s4-mocs.html
> 
>   * igt@xe_pm@s4-multiple-execs:
>     - shard-lnl:          [ABORT][106] ([Intel XE#1358] / [Intel XE#1794]) -> [PASS][107]
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-lnl-8/igt@xe_pm@s4-multiple-execs.html
> 
>   * igt@xe_pm_residency@toggle-gt-c6:
>     - shard-lnl:          [FAIL][108] ([Intel XE#958]) -> [PASS][109]
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093/shard-lnl-3/igt@xe_pm_residency@toggle-gt-c6.html
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-lnl-6/igt@xe_pm_residency@toggle-gt-c6.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:
>     - shard-adlp:         [DMESG-WARN][110] ([Intel XE#324]) -> [DMESG-WARN][111] ([Intel XE#1033])
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs:
>     - shard-dg2-set2:     [SKIP][112] ([Intel XE#1201] / [Intel XE#801]) -> [SKIP][113] ([Intel XE#801]) +23 other tests skip
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093/shard-dg2-434/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-dg2-432/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html
> 
>   * igt@kms_async_flips@invalid-async-flip:
>     - shard-dg2-set2:     [SKIP][114] ([Intel XE#873]) -> [SKIP][115] ([Intel XE#1201] / [Intel XE#873])
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093/shard-dg2-432/igt@kms_async_flips@invalid-async-flip.html
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-dg2-463/igt@kms_async_flips@invalid-async-flip.html
> 
>   * igt@kms_big_fb@linear-32bpp-rotate-90:
>     - shard-dg2-set2:     [SKIP][116] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][117] ([Intel XE#316]) +3 other tests skip
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093/shard-dg2-434/igt@kms_big_fb@linear-32bpp-rotate-90.html
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-dg2-432/igt@kms_big_fb@linear-32bpp-rotate-90.html
> 
>   * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
>     - shard-dg2-set2:     [SKIP][118] ([Intel XE#316]) -> [SKIP][119] ([Intel XE#1201] / [Intel XE#316])
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093/shard-dg2-432/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-dg2-463/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>     - shard-adlp:         [DMESG-FAIL][120] ([Intel XE#324]) -> [FAIL][121] ([Intel XE#1231]) +2 other tests fail
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>     - shard-adlp:         [FAIL][122] ([Intel XE#1231]) -> [DMESG-FAIL][123] ([Intel XE#324])
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
> 
>   * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
>     - shard-dg2-set2:     [SKIP][124] ([Intel XE#1124]) -> [SKIP][125] ([Intel XE#1124] / [Intel XE#1201]) +9 other tests skip
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093/shard-dg2-432/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-dg2-463/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>     - shard-adlp:         [FAIL][126] ([Intel XE#1242]) -> [FAIL][127] ([Intel XE#1231])
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-16bpp-rotate-0:
>     - shard-dg2-set2:     [SKIP][128] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][129] ([Intel XE#1124]) +10 other tests skip
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093/shard-dg2-435/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb:
>     - shard-dg2-set2:     [SKIP][130] ([Intel XE#619]) -> [SKIP][131] ([Intel XE#1201] / [Intel XE#619])
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb.html
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-dg2-463/igt@kms_big_fb@yf-tiled-addfb.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
>     - shard-dg2-set2:     [SKIP][132] ([Intel XE#607]) -> [SKIP][133] ([Intel XE#1201] / [Intel XE#607])
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-dg2-463/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
> 
>   * igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p:
>     - shard-dg2-set2:     [SKIP][134] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][135] ([Intel XE#367]) +3 other tests skip
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093/shard-dg2-434/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-dg2-432/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html
> 
>   * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
>     - shard-dg2-set2:     [SKIP][136] ([Intel XE#1201] / [Intel XE#2191]) -> [SKIP][137] ([Intel XE#2191])
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093/shard-dg2-434/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-dg2-432/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html
> 
>   * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
>     - shard-dg2-set2:     [SKIP][138] ([Intel XE#2191]) -> [SKIP][139] ([Intel XE#1201] / [Intel XE#2191])
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093/shard-dg2-432/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-dg2-463/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html
> 
>   * igt@kms_bw@linear-tiling-3-displays-3840x2160p:
>     - shard-dg2-set2:     [SKIP][140] ([Intel XE#367]) -> [SKIP][141] ([Intel XE#1201] / [Intel XE#367]) +4 other tests skip
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093/shard-dg2-432/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-dg2-463/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html
> 
>   * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][142] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][143] ([Intel XE#787]) +118 other tests skip
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093/shard-dg2-434/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-dg2-432/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-b-dp-4:
>     - shard-dg2-set2:     [SKIP][144] ([Intel XE#787]) -> [SKIP][145] ([Intel XE#1201] / [Intel XE#787]) +62 other tests skip
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-b-dp-4.html
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-dg2-463/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-b-dp-4.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:
>     - shard-dg2-set2:     [SKIP][146] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][147] ([Intel XE#455] / [Intel XE#787]) +33 other tests skip
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html
> 
>   * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
>     - shard-dg2-set2:     [SKIP][148] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][149] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +17 other tests skip
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-dg2-463/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html
> 
>   * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
>     - shard-dg2-set2:     [SKIP][150] ([Intel XE#1152]) -> [SKIP][151] ([Intel XE#1152] / [Intel XE#1201]) +3 other tests skip
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093/shard-dg2-432/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-dg2-463/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html
> 
>   * igt@kms_chamelium_color@ctm-red-to-blue:
>     - shard-dg2-set2:     [SKIP][152] ([Intel XE#1201] / [Intel XE#306]) -> [SKIP][153] ([Intel XE#306])
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093/shard-dg2-434/igt@kms_chamelium_color@ctm-red-to-blue.html
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-dg2-432/igt@kms_chamelium_color@ctm-red-to-blue.html
> 
>   * igt@kms_chamelium_color@gamma:
>     - shard-dg2-set2:     [SKIP][154] ([Intel XE#306]) -> [SKIP][155] ([Intel XE#1201] / [Intel XE#306]) +1 other test skip
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093/shard-dg2-432/igt@kms_chamelium_color@gamma.html
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-dg2-463/igt@kms_chamelium_color@gamma.html
> 
>   * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
>     - shard-dg2-set2:     [SKIP][156] ([Intel XE#373]) -> [SKIP][157] ([Intel XE#1201] / [Intel XE#373]) +9 other tests skip
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093/shard-dg2-432/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-dg2-463/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html
> 
>   * igt@kms_chamelium_hpd@vga-hpd:
>     - shard-dg2-set2:     [SKIP][158] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][159] ([Intel XE#373]) +10 other tests skip
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093/shard-dg2-434/igt@kms_chamelium_hpd@vga-hpd.html
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-dg2-432/igt@kms_chamelium_hpd@vga-hpd.html
> 
>   * igt@kms_content_protection@dp-mst-type-0:
>     - shard-dg2-set2:     [SKIP][160] ([Intel XE#1201] / [Intel XE#307]) -> [SKIP][161] ([Intel XE#307])
>    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093/shard-dg2-434/igt@kms_content_protection@dp-mst-type-0.html
>    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-dg2-432/igt@kms_content_protection@dp-mst-type-0.html
> 
>   * igt@kms_content_protection@dp-mst-type-1:
>     - shard-dg2-set2:     [SKIP][162] ([Intel XE#307]) -> [SKIP][163] ([Intel XE#1201] / [Intel XE#307])
>    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093/shard-dg2-432/igt@kms_content_protection@dp-mst-type-1.html
>    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-dg2-463/igt@kms_content_protection@dp-mst-type-1.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
>     - shard-dg2-set2:     [SKIP][164] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][165] ([Intel XE#308]) +1 other test skip
>    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093/shard-dg2-434/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
>    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-dg2-432/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
>     - shard-dg2-set2:     [SKIP][166] ([Intel XE#1201] / [Intel XE#323]) -> [SKIP][167] ([Intel XE#323])
>    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
>    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
>     - shard-dg2-set2:     [SKIP][168] ([Intel XE#323]) -> [SKIP][169] ([Intel XE#1201] / [Intel XE#323]) +1 other test skip
>    [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
>    [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-dg2-463/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
> 
>   * igt@kms_fbcon_fbt@psr-suspend:
>     - shard-dg2-set2:     [SKIP][170] ([Intel XE#776]) -> [SKIP][171] ([Intel XE#1201] / [Intel XE#776]) +1 other test skip
>    [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093/shard-dg2-432/igt@kms_fbcon_fbt@psr-suspend.html
>    [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-dg2-463/igt@kms_fbcon_fbt@psr-suspend.html
> 
>   * igt@kms_feature_discovery@chamelium:
>     - shard-dg2-set2:     [SKIP][172] ([Intel XE#701]) -> [SKIP][173] ([Intel XE#1201] / [Intel XE#701])
>    [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093/shard-dg2-432/igt@kms_feature_discovery@chamelium.html
>    [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-dg2-463/igt@kms_feature_discovery@chamelium.html
> 
>   * igt@kms_feature_discovery@display-4x:
>     - shard-dg2-set2:     [SKIP][174] ([Intel XE#1138]) -> [SKIP][175] ([Intel XE#1138] / [Intel XE#1201])
>    [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093/shard-dg2-432/igt@kms_feature_discovery@display-4x.html
>    [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-dg2-463/igt@kms_feature_discovery@display-4x.html
> 
>   * igt@kms_feature_discovery@psr1:
>     - shard-dg2-set2:     [SKIP][176] ([Intel XE#1135] / [Intel XE#1201]) -> [SKIP][177] ([Intel XE#1135]) +1 other test skip
>    [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093/shard-dg2-435/igt@kms_feature_discovery@psr1.html
>    [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-dg2-432/igt@kms_feature_discovery@psr1.html
> 
>   * igt@kms_flip@flip-vs-suspend:
>     - shard-dg2-set2:     [INCOMPLETE][178] ([Intel XE#1195] / [Intel XE#1551] / [Intel XE#2049]) -> [DMESG-WARN][179] ([Intel XE#1551])
>    [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093/shard-dg2-466/igt@kms_flip@flip-vs-suspend.html
>    [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-dg2-435/igt@kms_flip@flip-vs-suspend.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:
>     - shard-dg2-set2:     [SKIP][180] ([Intel XE#651]) -> [SKIP][181] ([Intel XE#1201] / [Intel XE#651]) +29 other tests skip
>    [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html
>    [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:
>     - shard-dg2-set2:     [SKIP][182] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][183] ([Intel XE#651]) +27 other tests skip
>    [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html
>    [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
>     - shard-dg2-set2:     [SKIP][184] ([Intel XE#1201] / [Intel XE#658]) -> [SKIP][185] ([Intel XE#658])
>    [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
>    [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
>     - shard-dg2-set2:     [SKIP][186] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][187] ([Intel XE#653]) +30 other tests skip
>    [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
>    [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
>     - shard-dg2-set2:     [SKIP][188] ([Intel XE#653]) -> [SKIP][189] ([Intel XE#1201] / [Intel XE#653]) +27 other tests skip
>    [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html
>    [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html
> 
>   * igt@kms_getfb@getfb-reject-ccs:
>     - shard-dg2-set2:     [SKIP][190] ([Intel XE#1201] / [Intel XE#605]) -> [SKIP][191] ([Intel XE#605])
>    [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093/shard-dg2-434/igt@kms_getfb@getfb-reject-ccs.html
>    [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-dg2-432/igt@kms_getfb@getfb-reject-ccs.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
>     - shard-dg2-set2:     [SKIP][192] ([Intel XE#455] / [Intel XE#498]) -> [SKIP][193] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) +3 other tests skip
>    [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html
>    [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][194] ([Intel XE#498]) -> [SKIP][195] ([Intel XE#1201] / [Intel XE#498]) +5 other tests skip
>    [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6.html
>    [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][196] ([Intel XE#1201] / [Intel XE#2318]) -> [SKIP][197] ([Intel XE#2318]) +5 other tests skip
>    [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6.html
>    [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][198] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) -> [SKIP][199] ([Intel XE#2318] / [Intel XE#455]) +3 other tests skip
>    [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6.html
>    [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6.html
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
>     - shard-dg2-set2:     [SKIP][200] ([Intel XE#2318] / [Intel XE#455]) -> [SKIP][201] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) +3 other tests skip
>    [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
>    [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-dg2-463/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][202] ([Intel XE#2318]) -> [SKIP][203] ([Intel XE#1201] / [Intel XE#2318]) +5 other tests skip
>    [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html
>    [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-dg2-463/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html
> 
>   * igt@kms_pm_dc@dc3co-vpb-simulation:
>     - shard-dg2-set2:     [SKIP][204] ([Intel XE#1122]) -> [SKIP][205] ([Intel XE#1122] / [Intel XE#1201]) +1 other test skip
>    [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093/shard-dg2-432/igt@kms_pm_dc@dc3co-vpb-simulation.html
>    [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-dg2-463/igt@kms_pm_dc@dc3co-vpb-simulation.html
> 
>   * igt@kms_pm_dc@dc5-psr:
>     - shard-dg2-set2:     [SKIP][206] ([Intel XE#1129] / [Intel XE#1201]) -> [SKIP][207] ([Intel XE#1129])
>    [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093/shard-dg2-434/igt@kms_pm_dc@dc5-psr.html
>    [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-dg2-432/igt@kms_pm_dc@dc5-psr.html
> 
>   * igt@kms_pm_dc@deep-pkgc:
>     - shard-dg2-set2:     [SKIP][208] ([Intel XE#1201] / [Intel XE#908]) -> [SKIP][209] ([Intel XE#908])
>    [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093/shard-dg2-434/igt@kms_pm_dc@deep-pkgc.html
>    [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-dg2-432/igt@kms_pm_dc@deep-pkgc.html
> 
>   * igt@kms_psr2_sf@overlay-plane-update-continuous-sf:
>     - shard-dg2-set2:     [SKIP][210] ([Intel XE#1489]) -> [SKIP][211] ([Intel XE#1201] / [Intel XE#1489]) +3 other tests skip
>    [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093/shard-dg2-432/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html
>    [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-dg2-463/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html
> 
>   * igt@kms_psr2_sf@plane-move-sf-dmg-area:
>     - shard-dg2-set2:     [SKIP][212] ([Intel XE#1201] / [Intel XE#1489]) -> [SKIP][213] ([Intel XE#1489]) +2 other tests skip
>    [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093/shard-dg2-434/igt@kms_psr2_sf@plane-move-sf-dmg-area.html
>    [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-dg2-432/igt@kms_psr2_sf@plane-move-sf-dmg-area.html
> 
>   * igt@kms_psr2_su@page_flip-xrgb8888:
>     - shard-dg2-set2:     [SKIP][214] ([Intel XE#1122] / [Intel XE#1201]) -> [SKIP][215] ([Intel XE#1122]) +1 other test skip
>    [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093/shard-dg2-434/igt@kms_psr2_su@page_flip-xrgb8888.html
>    [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-dg2-432/igt@kms_psr2_su@page_flip-xrgb8888.html
> 
>   * igt@kms_psr@fbc-psr-sprite-render:
>     - shard-dg2-set2:     [SKIP][216] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][217] ([Intel XE#929]) +13 other tests skip
>    [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093/shard-dg2-434/igt@kms_psr@fbc-psr-sprite-render.html
>    [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-dg2-432/igt@kms_psr@fbc-psr-sprite-render.html
> 
>   * igt@kms_psr@psr2-basic:
>     - shard-dg2-set2:     [SKIP][218] ([Intel XE#929]) -> [SKIP][219] ([Intel XE#1201] / [Intel XE#929]) +12 other tests skip
>    [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093/shard-dg2-432/igt@kms_psr@psr2-basic.html
>    [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-dg2-463/igt@kms_psr@psr2-basic.html
> 
>   * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
>     - shard-dg2-set2:     [SKIP][220] ([Intel XE#1149]) -> [SKIP][221] ([Intel XE#1149] / [Intel XE#1201])
>    [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093/shard-dg2-432/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
>    [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-dg2-463/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
>     - shard-dg2-set2:     [SKIP][222] ([Intel XE#1127] / [Intel XE#1201]) -> [SKIP][223] ([Intel XE#1127])
>    [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
>    [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
>     - shard-dg2-set2:     [SKIP][224] ([Intel XE#1127]) -> [SKIP][225] ([Intel XE#1127] / [Intel XE#1201])
>    [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
>    [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-dg2-463/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
> 
>   * igt@kms_rotation_crc@sprite-rotation-270:
>     - shard-dg2-set2:     [SKIP][226] ([Intel XE#327]) -> [SKIP][227] ([Intel XE#1201] / [Intel XE#327]) +1 other test skip
>    [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093/shard-dg2-432/igt@kms_rotation_crc@sprite-rotation-270.html
>    [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-dg2-463/igt@kms_rotation_crc@sprite-rotation-270.html
> 
>   * igt@kms_scaling_modes@scaling-mode-full-aspect:
>     - shard-dg2-set2:     [SKIP][228] ([Intel XE#455]) -> [SKIP][229] ([Intel XE#1201] / [Intel XE#455]) +22 other tests skip
>    [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093/shard-dg2-432/igt@kms_scaling_modes@scaling-mode-full-aspect.html
>    [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-dg2-463/igt@kms_scaling_modes@scaling-mode-full-aspect.html
> 
>   * igt@kms_tv_load_detect@load-detect:
>     - shard-dg2-set2:     [SKIP][230] ([Intel XE#1201] / [Intel XE#330]) -> [SKIP][231] ([Intel XE#330])
>    [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093/shard-dg2-434/igt@kms_tv_load_detect@load-detect.html
>    [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-dg2-432/igt@kms_tv_load_detect@load-detect.html
> 
>   * igt@kms_vrr@flipline:
>     - shard-dg2-set2:     [SKIP][232] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][233] ([Intel XE#455]) +13 other tests skip
>    [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093/shard-dg2-434/igt@kms_vrr@flipline.html
>    [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-dg2-432/igt@kms_vrr@flipline.html
> 
>   * igt@kms_writeback@writeback-fb-id-xrgb2101010:
>     - shard-dg2-set2:     [SKIP][234] ([Intel XE#1201] / [Intel XE#756]) -> [SKIP][235] ([Intel XE#756])
>    [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093/shard-dg2-435/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
>    [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-dg2-432/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
> 
>   * igt@xe_compute_preempt@compute-preempt:
>     - shard-dg2-set2:     [SKIP][236] ([Intel XE#1280] / [Intel XE#455]) -> [SKIP][237] ([Intel XE#1201] / [Intel XE#1280] / [Intel XE#455]) +1 other test skip
>    [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093/shard-dg2-432/igt@xe_compute_preempt@compute-preempt.html
>    [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-dg2-463/igt@xe_compute_preempt@compute-preempt.html
> 
>   * igt@xe_copy_basic@mem-copy-linear-0x369:
>     - shard-dg2-set2:     [SKIP][238] ([Intel XE#1123] / [Intel XE#1201]) -> [SKIP][239] ([Intel XE#1123])
>    [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0x369.html
>    [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0x369.html
> 
>   * igt@xe_copy_basic@mem-copy-linear-0xfd:
>     - shard-dg2-set2:     [SKIP][240] ([Intel XE#1123]) -> [SKIP][241] ([Intel XE#1123] / [Intel XE#1201])
>    [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfd.html
>    [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-dg2-463/igt@xe_copy_basic@mem-copy-linear-0xfd.html
> 
>   * igt@xe_copy_basic@mem-set-linear-0x3fff:
>     - shard-dg2-set2:     [SKIP][242] ([Intel XE#1126] / [Intel XE#1201]) -> [SKIP][243] ([Intel XE#1126])
>    [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093/shard-dg2-435/igt@xe_copy_basic@mem-set-linear-0x3fff.html
>    [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0x3fff.html
> 
>   * igt@xe_exec_fault_mode@once-bindexecqueue-rebind-prefetch:
>     - shard-dg2-set2:     [SKIP][244] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][245] ([Intel XE#288]) +24 other tests skip
>    [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093/shard-dg2-434/igt@xe_exec_fault_mode@once-bindexecqueue-rebind-prefetch.html
>    [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-dg2-432/igt@xe_exec_fault_mode@once-bindexecqueue-rebind-prefetch.html
> 
>   * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
>     - shard-dg2-set2:     [SKIP][246] ([Intel XE#288]) -> [SKIP][247] ([Intel XE#1201] / [Intel XE#288]) +24 other tests skip
>    [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html
>    [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-dg2-463/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html
> 
>   * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
>     - shard-dg2-set2:     [SKIP][248] ([Intel XE#1201] / [Intel XE#2360]) -> [SKIP][249] ([Intel XE#2360])
>    [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093/shard-dg2-434/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html
>    [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-dg2-432/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html
> 
>   * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
>     - shard-dg2-set2:     [SKIP][250] ([Intel XE#1201] / [Intel XE#2229]) -> [SKIP][251] ([Intel XE#2229])
>    [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093/shard-dg2-434/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
>    [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-dg2-432/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
> 
>   * igt@xe_oa@polling-small-buf:
>     - shard-dg2-set2:     [SKIP][252] -> [SKIP][253] ([Intel XE#1201]) +3 other tests skip
>    [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093/shard-dg2-432/igt@xe_oa@polling-small-buf.html
>    [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-dg2-463/igt@xe_oa@polling-small-buf.html
> 
>   * igt@xe_pat@display-vs-wb-transient:
>     - shard-dg2-set2:     [SKIP][254] ([Intel XE#1337]) -> [SKIP][255] ([Intel XE#1201] / [Intel XE#1337])
>    [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093/shard-dg2-432/igt@xe_pat@display-vs-wb-transient.html
>    [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-dg2-463/igt@xe_pat@display-vs-wb-transient.html
> 
>   * igt@xe_pat@pat-index-xehpc:
>     - shard-dg2-set2:     [SKIP][256] ([Intel XE#979]) -> [SKIP][257] ([Intel XE#1201] / [Intel XE#979])
>    [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093/shard-dg2-432/igt@xe_pat@pat-index-xehpc.html
>    [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-dg2-463/igt@xe_pat@pat-index-xehpc.html
> 
>   * igt@xe_pm@d3cold-mmap-system:
>     - shard-dg2-set2:     [SKIP][258] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366]) -> [SKIP][259] ([Intel XE#2284] / [Intel XE#366]) +1 other test skip
>    [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093/shard-dg2-434/igt@xe_pm@d3cold-mmap-system.html
>    [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-dg2-432/igt@xe_pm@d3cold-mmap-system.html
> 
>   * igt@xe_pm@s2idle-d3cold-basic-exec:
>     - shard-dg2-set2:     [SKIP][260] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][261] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366]) +1 other test skip
>    [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093/shard-dg2-432/igt@xe_pm@s2idle-d3cold-basic-exec.html
>    [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-dg2-463/igt@xe_pm@s2idle-d3cold-basic-exec.html
> 
>   * igt@xe_query@multigpu-query-invalid-cs-cycles:
>     - shard-dg2-set2:     [SKIP][262] ([Intel XE#944]) -> [SKIP][263] ([Intel XE#1201] / [Intel XE#944]) +3 other tests skip
>    [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093/shard-dg2-432/igt@xe_query@multigpu-query-invalid-cs-cycles.html
>    [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-dg2-463/igt@xe_query@multigpu-query-invalid-cs-cycles.html
> 
>   * igt@xe_query@multigpu-query-uc-fw-version-huc:
>     - shard-dg2-set2:     [SKIP][264] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][265] ([Intel XE#944]) +2 other tests skip
>    [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093/shard-dg2-434/igt@xe_query@multigpu-query-uc-fw-version-huc.html
>    [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/shard-dg2-432/igt@xe_query@multigpu-query-uc-fw-version-huc.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
>   [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
>   [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
>   [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
>   [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
>   [Intel XE#1131]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1131
>   [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
>   [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
>   [Intel XE#1149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149
>   [Intel XE#1152]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152
>   [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>   [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
>   [Intel XE#1242]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242
>   [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
>   [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
>   [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
>   [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
>   [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
>   [Intel XE#1413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413
>   [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>   [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
>   [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
>   [Intel XE#1428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428
>   [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
>   [Intel XE#1467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467
>   [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
>   [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
>   [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
>   [Intel XE#1551]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551
>   [Intel XE#1620]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620
>   [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
>   [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
>   [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
>   [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
>   [Intel XE#2019]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019
>   [Intel XE#2028]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028
>   [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
>   [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
>   [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
>   [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
>   [Intel XE#2318]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318
>   [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
>   [Intel XE#2382]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2382
>   [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
>   [Intel XE#2436]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2436
>   [Intel XE#2472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472
>   [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
>   [Intel XE#2512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2512
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
>   [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
>   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>   [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
>   [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
>   [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
>   [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
>   [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
>   [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
>   [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
>   [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
>   [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
>   [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
>   [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
>   [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
>   [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
>   [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#801]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/801
>   [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
>   [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
>   [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
>   [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>   [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
>   [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093 -> xe-pw-137200v1
> 
>   IGT_7966: f16c5f500adc5fa41bd52a3ef2a84165da4fb596 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-1755-4f95bd933f4dacd22752bf8d6e548e8cc445d093: 4f95bd933f4dacd22752bf8d6e548e8cc445d093
>   xe-pw-137200v1: 137200v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137200v1/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
