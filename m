Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FD32C36008
	for <intel-xe@archiver.kernel.org>; Wed, 26 Mar 2025 20:39:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D89B910E787;
	Wed, 26 Mar 2025 20:39:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R+VMZq5B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 702DE10E785
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Mar 2025 20:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743021589; x=1774557589;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=uE4cZZXJhWh4mLKeae/uO/44u3yVgSWsxZm/aLiW9r8=;
 b=R+VMZq5BfugUYjOEFfv2++I2/qYRNybJ1KNr4/rx15JRk6UkVy8cXzVJ
 vEMZsEC3PNV00QNde2LLc+y/I1p87IXwp+lDPZAQuX1BRikmKQxLzm/zU
 wFGhGV3nc3V69nt7E+p63R9/cWIMogXccrdr7IORUe2hsX0/xXQuOn/A7
 XcBb7+0Dgpx/KtRhugIVWargBZCj++BkHlZr0h3xzV1d7nTu3zXkt5M2y
 8plhAWFXJZpcVNXLOuS1h6PkFyv20UMkoMWSXbhPPESIKV0SNGDQ8tsNP
 jIXQXmIoqbHA0QAOg+j9e97LT6RmRqR8Ozhg9kSocpAvyNkaAANVDIWxV A==;
X-CSE-ConnectionGUID: X5/fPjT0TSGjcCA2dVqKPw==
X-CSE-MsgGUID: B1s2majfSKObr0ZYwhApPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="44224544"
X-IronPort-AV: E=Sophos;i="6.14,278,1736841600"; d="scan'208";a="44224544"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 13:39:40 -0700
X-CSE-ConnectionGUID: tngABNMnSv6ift7DWoygLg==
X-CSE-MsgGUID: D3dg0cdsQx6bqFwBi8jXzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,278,1736841600"; d="scan'208";a="125362228"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 13:39:40 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 26 Mar 2025 13:39:38 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 26 Mar 2025 13:39:38 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 26 Mar 2025 13:39:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QM7yeTByKLWpq79u+rFf8Z7TKBE3Eiv5oE+3IiOxRAUKPT0PAGqj06gYG8UctR6jcEJAkVOVfyQwpzQs4gxCh+cJgRr/kRxssipHZgsNmeRcfKqV3Uk1blOkuI32JS/IO9yfE9lzBL1zOdMI9JakLIdY3MEUgLXV9MeRdg5snHE5XwCGN1FzMAs7OIYM6QlMZlk8an1YS9vqJYkw9d9QtRNMW/8RF5okgaLXdMtIMSdLX6dsTJAbtF6TBsYJ+gmnvXGoGOJtd/0x0un8XU5DFijQw5R2413FQW76nAKU4vk0dipyUo5abN1H3/HwoeJJZeP1ueO1u/mN+d5/ifS0+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=juAXimJ4TbV+jSlBuXC/AfZ+3UrErrRcWHWRSYplnEI=;
 b=SgEAiyIDQjbTAVHIK+Er61VB8AJSVYPFft4saavsbzydir+rKdUyOvG3rAu1XYJH9PkvPcja4+KpCSpiUAsoKKlGfvMl1AmzA58oAvd1mZ08OVWpnP2GVOh/7Abjj9o/nlaD1rAgke5sNWyjPy2UYA7dKhHYXJHqJ2IIy/EM0gPzFZ/qesBaXCK1/Ak7E+AblTjJXtWCAF3f0lues+ZWN+sr2IWo8rvutQNd2sQUM6I/ZtJ4B6+HxjkpXoeDI4ixDVqZSyKXtoMsUQMroLdvbcT5Qa/5CIBQh/p5/sq/BICw+KXgEhALRltEnV/xhATgH4UxJDo4cOMrMYcJlCuQBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8185.namprd11.prod.outlook.com (2603:10b6:610:159::12)
 by SN7PR11MB6603.namprd11.prod.outlook.com (2603:10b6:806:271::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Wed, 26 Mar
 2025 20:39:34 +0000
Received: from CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::1be5:55ed:3261:fefb]) by CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::1be5:55ed:3261:fefb%4]) with mapi id 15.20.8534.043; Wed, 26 Mar 2025
 20:39:34 +0000
Date: Wed, 26 Mar 2025 13:39:32 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkJBVA==?= =?utf-8?Q?=3A?= failure for
 drm/xe/bmg: Add one additional PCI ID
Message-ID: <20250326203932.GH1439735@mdroper-desk1.amr.corp.intel.com>
References: <20250325224709.4073080-2-matthew.d.roper@intel.com>
 <174295539709.3303.12037445644949363716@e6b6f09ec485>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <174295539709.3303.12037445644949363716@e6b6f09ec485>
X-ClientProxiedBy: BY3PR05CA0004.namprd05.prod.outlook.com
 (2603:10b6:a03:254::9) To CH3PR11MB8185.namprd11.prod.outlook.com
 (2603:10b6:610:159::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8185:EE_|SN7PR11MB6603:EE_
X-MS-Office365-Filtering-Correlation-Id: d1c52d86-43ef-4870-be2c-08dd6ca6518b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Uiavtc0DqDe5ce5QE5BMV7PFLB2yVl4hsyKXunMYPKRV+LHKMTMNhlv+iU6+?=
 =?us-ascii?Q?W4rqxoDiIyRpLUMkswYQ8afo7WLsmOCttLhM+rEtJSBBlZqLDmoxz0jIpamv?=
 =?us-ascii?Q?k+ZXX/31ZEmUD+85arW5lSiOqgapKhBBUE3Om60WpdWVN1GMPE4vzyVlPJzT?=
 =?us-ascii?Q?1Aum/qGvTfM0/95TAIKysks1EiCIbbotz/ZqGtqPKZcS6iEHGJs4H3Y7Yg2s?=
 =?us-ascii?Q?N7zVlDopC60alTqQsR2ySmcLjCUndO4g8eiY2LMCf8oFEG6cDohbe8J47Asr?=
 =?us-ascii?Q?6CLqUBW8SY/e8r2Mb+3xifz2i6nyv0RpbwNTiRtRhMe5T/QkbyQ3DqnQ+Crw?=
 =?us-ascii?Q?zg7eItbgGQi3fvjDH6l8tWhiR4O+Y53G7MmFR7YNr/hVhF2wi3c/tlEsaovo?=
 =?us-ascii?Q?mjWFMJR4QsmTzGojFqCQ6a3VwIzuhViUynHunoHE/LccIhfd9ytMiakUuBJ8?=
 =?us-ascii?Q?axdaWvA42AWC/rozXlARuvbH0QhkppTchZdvBo9gjORaUK1h9mUoFH2sHJN7?=
 =?us-ascii?Q?9H+XTcFtpPRubpEdWSJG4M4bSA21u7mE0aQHy4Pkl2O7beqZwbWY6TsRqszq?=
 =?us-ascii?Q?Lpy2IrJJlHB6QnggtMApHBf1E3uIdLeCv6XybCxt/BHUX+qX8HACaKmNP0lQ?=
 =?us-ascii?Q?f62N6IvFVEFt+6GY+X1jjX+l4tK5FaLSijD4fkoSw36Itup2MhJz4oe+K9cD?=
 =?us-ascii?Q?e1of2gR3JvFlEZ32mtMvU96+doSMqfhluL/YN5aytR4KSar8xTjVQXnAuOVd?=
 =?us-ascii?Q?7K1bz4r5i2pj5M6LJb/9wgsUnZ8ivmjc0z5mi4x9h0sfFuHP8k60QKiqlc3X?=
 =?us-ascii?Q?1SQaXVc6jD/866hFKxCBdVkjK8OG2gLwLFfTm7CSvbzl6vz40Zj+VxhlH5Pw?=
 =?us-ascii?Q?oC59j1kOSaDDwd8jt04GYwDsuKS/gei+eSHnYXBx3ZeJ5QeIbtxBGHgrM4Eq?=
 =?us-ascii?Q?cvBlv48LCObn9EvpJy3q5FVXSHUrsNMy7xu+ec3PEtOdt4gASEebFTHt8uZf?=
 =?us-ascii?Q?Eo269Zxcfzl1+4K8xHNxKU+IDYzzVGBQRxKWQsKQnip+3l+tP+X3/1sfHgNc?=
 =?us-ascii?Q?cWY0+X7lQlZh1lrcslLGpvzTx9/pW9yMh5po/HD5a8NgTkYipIsv56FH+THo?=
 =?us-ascii?Q?YJYy5ZgHHBMq8cAkjWcLvrpO82mhqJgtmJLIlWRsQIK+eyyXjx424pCGkOqp?=
 =?us-ascii?Q?HmB/eBxeKbXl7qOVN9ZwXXFxkBO4vwIX1yo6c82fZYcBzQerakEIAO0t8Mqo?=
 =?us-ascii?Q?qiTb1EhGdiCPce+3XBgk4/oq/kuXgkeprcL3VxbPdGvVxGRRpy80cnb3FVuE?=
 =?us-ascii?Q?ZQA4JOhj3crYI+GH59rgwWC6?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?i0U27Wh+bxbPGAzWrIcaZzrxDRXP1UcJyp6Qb/u0PwSdzsy0WcmY3L6ew+ae?=
 =?us-ascii?Q?SMhS3QBM7iIEkBX7aWZDxyVQzkEUvwHIgn9oslGPMa9WxWidLsgosRx1i6Tz?=
 =?us-ascii?Q?wlewSrwmiyJ/566+E6nozgLtByO5cZDnVmyb7K9p0TVTYFoHaIBjWRYjPbzL?=
 =?us-ascii?Q?RzZq6mUSTtttye4Uk6Q1KysT8gJpaVLQvL8j2zF3iByPV5l0Ylbj51aozZdY?=
 =?us-ascii?Q?17sqQzV/zxxo5WAQFlsN9ES9Dehv0C+WbAwex5Vv2zAcUhtoVV7f8CW9Dn6Q?=
 =?us-ascii?Q?O13X3Ps79cAsXTPXEWhr4eHPGPAanshNNNROGbxjNM8pQd1PwjpNJXz51D2F?=
 =?us-ascii?Q?pC14O3LkI0mqTHF03SM6QyV2sfFFSGQwoQjM0xQsSoO3fRjuM5eXHk2tlPqT?=
 =?us-ascii?Q?gehS8N12LITKLQriktWIcNM/TO/0xdArQZg+oMb0Ztx1dmTF8aHsCZPbwAP8?=
 =?us-ascii?Q?87jV83n2wpGrYo+gRvcCkji6RAm88eQcQ6OLg+Z5dgd3I2O+Xkgs8cvmBP5L?=
 =?us-ascii?Q?OyTFmV38uLnL/6+BUYVFI8sjrcB4pjn11bOaGk7QHo0MgmciJXAgbfdsUpel?=
 =?us-ascii?Q?reoALXnYK7VHCdgG84IhAPwe/jsO2bS4teUl4/+LOxjQ/LB1ZA+Y6J6k4/0a?=
 =?us-ascii?Q?4Jz54GeCIfd+pIs5rLXOh06pCWjH4mJw3UGuXEVSQ301CmRN6rszPctzC47B?=
 =?us-ascii?Q?5lGAEB/2YNgkssT3VkCFPQtAsa871j//Si+WNo2VVrWCp5xzQsj88pLZbYCx?=
 =?us-ascii?Q?YosSHwLCc7kE6nv/k8nkaTEgBEm/9Vw5rxC8sYUn2egWvPiuuViJMX2mHw+8?=
 =?us-ascii?Q?TwQJucdSHO7V4T/TScvhgL3Q90d0Kf5EBd7fC6SQS+unYdA1XNfKQWn6ScH9?=
 =?us-ascii?Q?E2EkGJ1iku7mJjN9XsoNzDUX4gdTyB8TD6ovuQaEGIpOFGPxgdUjokemOC0U?=
 =?us-ascii?Q?7wC29QElCDAuZzE4Z/pMNxsC+dh2abC1XCiLy7KBN0SclA9Z5ULU9k+NrUW+?=
 =?us-ascii?Q?o0hydUywzeIUGGsZzV+Gxi4ZDeONzAoh8ba7LHqleVpWDqVEkv9eZajHTqSS?=
 =?us-ascii?Q?NntgmBOciteg10PbmXetBuhP/J0Ms0aanD9ENj0J4xgl3qB9BC3rMpqxBQc+?=
 =?us-ascii?Q?2Gvq6HD5LD5romYNVC92uHrsH/5nzmABsHfDzYchL3OzJwVaBfM5lIBPzePD?=
 =?us-ascii?Q?nBhjb/YKNuCDf1iDiS3ukwiMecEi9Jtq4GPc59MZghJuiTbwK+khqmg3EF2L?=
 =?us-ascii?Q?VSI/6P7Kv5etmRc7w/Mb531Sbb0FdOo59j4IxeYXumZuyqIGf7YxWDWUxtWy?=
 =?us-ascii?Q?jFlQtHGhirlTsq59Hcg9vXusFGJLbykBCJ9Wy8wcALfhCntHhtzPqvgoXNr/?=
 =?us-ascii?Q?n5osMMq8p4QGX8szAzQgPt+eKEj8eX4Slohci0HVDLfANtzX6GYLtwAoc3+N?=
 =?us-ascii?Q?8eSOJuLhPHWWKNWmGACnovBD91HeXVcpjPPTkXAXMh1wmJLmpsFVnHCvSL/2?=
 =?us-ascii?Q?AxhnKk6zq/pxCGMxHL/+/MZN1NohezVnFGGK6cuaPD/BclBLi4OrSiKwFrwu?=
 =?us-ascii?Q?Pzy6t4EspNfF19CFxvlio9LIkjzyMFfnlcvAiWEYMO88kA69diXBYFkHPDnL?=
 =?us-ascii?Q?VA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d1c52d86-43ef-4870-be2c-08dd6ca6518b
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 20:39:34.6613 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XU7C93flc9tmPIRVixESbaRJIVYlcq+aQb8yyAdsp3XDN9uW31Sr2qBsOKviLWlOg/oIsvaXB7HER3OKxMiuzmMDGg0A2tLyQUMjaK5NDTo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6603
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

On Wed, Mar 26, 2025 at 02:16:37AM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/bmg: Add one additional PCI ID
> URL   : https://patchwork.freedesktop.org/series/146769/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-2853-afc2e1fea0a406eedbaf632e96cdb6832a45ebb7_BAT -> xe-pw-146769v1_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **WARNING**
> 
>   Minor unknown changes coming with xe-pw-146769v1_BAT need to be verified
>   manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-146769v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (10 -> 9)
> ------------------------------
> 
>   Missing    (1): bat-adlp-vm 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-146769v1_BAT:
> 
> ### IGT changes ###
> 
> #### Warnings ####
> 
>   * igt@xe_pat@pat-index-xehpc@render:
>     - bat-pvc-2:          [SKIP][1] ([Intel XE#976]) -> [SKIP][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2853-afc2e1fea0a406eedbaf632e96cdb6832a45ebb7/bat-pvc-2/igt@xe_pat@pat-index-xehpc@render.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146769v1/bat-pvc-2/igt@xe_pat@pat-index-xehpc@render.html

PVC (Xe_HPC) doesn't have render capabilities, so skipping on the render
dynamic subtest is expected.

It looks like full CI didn't run properly on this patch, but since it's
just an additional PCI ID and no other changes, it should be safe to go
ahead and merge this anyway.

Added the cc stable and applied to drm-xe-next.  Thanks for the reviews.


Matt

> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-146769v1_BAT that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@xe_evict@evict-beng-small-cm:
>     - bat-adlp-vf:        NOTRUN -> [SKIP][3] ([Intel XE#261] / [Intel XE#688]) +9 other tests skip
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146769v1/bat-adlp-vf/igt@xe_evict@evict-beng-small-cm.html
> 
>   * igt@xe_exec_fault_mode@twice-rebind:
>     - bat-adlp-vf:        NOTRUN -> [SKIP][4] ([Intel XE#288]) +32 other tests skip
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146769v1/bat-adlp-vf/igt@xe_exec_fault_mode@twice-rebind.html
> 
>   * igt@xe_live_ktest@xe_bo:
>     - bat-adlp-vf:        NOTRUN -> [SKIP][5] ([Intel XE#2229] / [Intel XE#455]) +2 other tests skip
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146769v1/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html
> 
>   * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
>     - bat-adlp-vf:        NOTRUN -> [SKIP][6] ([Intel XE#2229])
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146769v1/bat-adlp-vf/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
> 
>   * igt@xe_pat@pat-index-xe2:
>     - bat-adlp-vf:        NOTRUN -> [SKIP][7] ([Intel XE#977])
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146769v1/bat-adlp-vf/igt@xe_pat@pat-index-xe2.html
> 
>   * igt@xe_pat@pat-index-xehpc:
>     - bat-adlp-vf:        NOTRUN -> [SKIP][8] ([Intel XE#2838] / [Intel XE#979])
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146769v1/bat-adlp-vf/igt@xe_pat@pat-index-xehpc.html
> 
>   * igt@xe_pat@pat-index-xelpg:
>     - bat-adlp-vf:        NOTRUN -> [SKIP][9] ([Intel XE#979])
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146769v1/bat-adlp-vf/igt@xe_pat@pat-index-xelpg.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@xe_vm@shared-pte-page:
>     - bat-adlp-vf:        [ABORT][10] ([Intel XE#3970]) -> [PASS][11]
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2853-afc2e1fea0a406eedbaf632e96cdb6832a45ebb7/bat-adlp-vf/igt@xe_vm@shared-pte-page.html
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146769v1/bat-adlp-vf/igt@xe_vm@shared-pte-page.html
> 
>   
>   [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
>   [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
>   [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#976]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/976
>   [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
>   [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_8283 -> IGT_8284
>   * Linux: xe-2853-afc2e1fea0a406eedbaf632e96cdb6832a45ebb7 -> xe-pw-146769v1
> 
>   IGT_8283: e4eb2265f06fc69e37e56cb6b609e019b6071435 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_8284: 8284
>   xe-2853-afc2e1fea0a406eedbaf632e96cdb6832a45ebb7: afc2e1fea0a406eedbaf632e96cdb6832a45ebb7
>   xe-pw-146769v1: 146769v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146769v1/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
