Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 386A8D0EE14
	for <intel-xe@archiver.kernel.org>; Tue, 25 Nov 2025 18:16:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D05F010E439;
	Tue, 25 Nov 2025 18:16:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bmIVSqwe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5FF910E439
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Nov 2025 18:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764094600; x=1795630600;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=IU1EeYpu7TaHJpElewDrB5DD2mTWd59+hBmsvCs79Cw=;
 b=bmIVSqweiyHqPY1CdWWlKg1HcLUTZQWo5Z4X5atv9DVuEDtADJu+G06V
 BR5b3jwyRRl7XI/+y+TSaWVAozXhU/fbmuN+X2WPXIcvwWerIzAJtr8vH
 su3vg8olAMURnesFLkTx70/1AEEWqV3Sh/HxqhhRDTIH4Lr8QQVWQrwfI
 gwk+eTeiAOEaWluFWA1DV1qWuni+A+3mUZXhWPbq94hwoFFRGHUFQE146
 xfJW45UoxKr7Ib6HnZw3ROgdJQuALW8Jtr0cDXlKtRh2zftputlD0hyek
 2QdJf1mAGMghZ1BWHXUx2HbIkONiuZdSAr5/ZkLPCMLi3z+Hd7+XBgsAP Q==;
X-CSE-ConnectionGUID: SzN8ow2cTC6q+r4gdxfWWQ==
X-CSE-MsgGUID: T3OSdS/KTu64QUMPAAvRxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="66010317"
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; d="scan'208";a="66010317"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 10:16:40 -0800
X-CSE-ConnectionGUID: xrJOid/HTHOD3aY/2SM6oA==
X-CSE-MsgGUID: 01gByK5TS16bEdvH2pOtYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; d="scan'208";a="191962938"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 10:16:39 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 25 Nov 2025 10:16:38 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 25 Nov 2025 10:16:38 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.55) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 25 Nov 2025 10:16:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mCUXG7iOotAEmJv7qbSzV8KFq78Iyjhx0kHDiZfBAhOTvxRilkRtrTRWeH163e7YCEBeJC5rfsu0RIo40FXjHJfctXIWPps8n9VD6QzJ4dmZ8S8VySHWDKIRmRjBNg5GuHzSysbPvCjoJ25R4gURAvf+/YJ93AUM8jHFLU5HFxANaYDX6jkn65wE1FzTaCHTyqjR8q0Xf79XUeHFBEUgSG9uxpRTmIhjujjSqWGvejZRl1p/S1LQA0+UptGhd24n4hFuKfTE/iYJVokUKdzi0UfcKauLqX6ZsfLtOkQC1pPXnCLwk/39sDcvluNJbyTWNg4hinD6hpRHmbf6XKmpgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qVRAw8Lj+XSFv1/8jPfItDh9wr4kzBxZRpDNBsidhOw=;
 b=VOTR+hnKGbmHyBbluu+4hqPayX2tVSkgWFPj6I0jxNnPJQ6SjCwmywadp1iP5MtKZflxIeyhF3Drp8/oAwDvbvavJycrqcrclJlOxCxJqjp+fo3gD+cDaZRu8WpjgBxQeRS/e8gSojsvbN2D8j4Nk22T4soN93ukB4oQv2NTkAQAtiZebobxsCKAhEh4w4HGDtgZeHR+Vzi+5Jx8ld1oTDQrs3WyUusNhKs1A7prxH7eNIS9wQwXkec7XKUiHwhdk0bRGPlCIsg818bgdV7zd+8bZzCTeUfWzvtp7TZAu57TfsdYZzYf+Dtc/az0nimUx0Q1okXZa0nLjfo6aLlsvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY5PR11MB6391.namprd11.prod.outlook.com (2603:10b6:930:38::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Tue, 25 Nov
 2025 18:16:32 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9343.016; Tue, 25 Nov 2025
 18:16:32 +0000
Date: Tue, 25 Nov 2025 10:16:28 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v5 4/5] drm/xe/svm: Enable UNMAP for VMA merging operations
Message-ID: <aSXyfMxcj/ok+6fG@lstrano-desk.jf.intel.com>
References: <20251125075628.1182481-1-himal.prasad.ghimiray@intel.com>
 <20251125075628.1182481-5-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251125075628.1182481-5-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: YT1PR01CA0069.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::8) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY5PR11MB6391:EE_
X-MS-Office365-Filtering-Correlation-Id: bad1aea0-d43c-4bae-96d7-08de2c4ec2f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?PRIg/nWHtvej3yDNin+5qOCzv5VZzJCxCh5UrKF+9yYZvWpDFZrdtQvc6g?=
 =?iso-8859-1?Q?aSmrPRb8ALTbdUWWgfIHcrZY7kjNhhPuvuNe0SR5ZkFDZOnq9mcyk0llQp?=
 =?iso-8859-1?Q?bznj2n6N9amwqP+FOaP/dn8+RtXhJaO/EdCp2SYYw5woI4PgPEk6fl10Vw?=
 =?iso-8859-1?Q?v4h+Y9KdJnqDWq5t8wT0oyA4VZpsZu4T9ueJiyC7Y0g1+3IBKMLFb9L5vF?=
 =?iso-8859-1?Q?k6SfIsdEap7CWuZv6Tb8wd+vo9PU5BBJOUFMve9yEiMIg4OiJV4WpJJ7xf?=
 =?iso-8859-1?Q?BJRZDQO5TwrDVBnG1xlA2UQT+61S3aH8Bci6K7iMC6sJDVwJCcOLr1pqpE?=
 =?iso-8859-1?Q?4HIA5ahKyqKWFJVHnvtfWvaNE7C8TBbGU0EV44LOlMOZWD0vt6eMI8mjDe?=
 =?iso-8859-1?Q?woTjfS0voij2E52Aj+zBn5BL4wg9ZHie1JYwFqv0CNtS7zYftvp/NjkwVL?=
 =?iso-8859-1?Q?h8rXWu5rxRMtBdyBU40cF9hrUTElhVytVrFAXBpo/S2EB9v8qkR5GdCBwP?=
 =?iso-8859-1?Q?CxU/4TG89lyw1xbvQeXP30PvQu2QHOuWBkUj+qTeI3CRZy69pcWaqJIlLC?=
 =?iso-8859-1?Q?IqaS2sVr9SBloX7K9CqFKAx9TsTmaAAq4uk7jppUX2gF7vT0L3w+j2zeC0?=
 =?iso-8859-1?Q?bMS1Mu8BmYoUYGcaIQWW1gvNSOQFbHNBI1/3IEPozimaYfm+7hERjQe8tW?=
 =?iso-8859-1?Q?ICtfONDY/W9X3tsrZAi7ILkYeX8tdsyIbtW6I+dxfadgXiCMgRdM1nyD0a?=
 =?iso-8859-1?Q?8idvE/7zFausjiXY/F8Mlx7yqzrY3347IHKeepuVHfil7RVRhv8FC8rIEX?=
 =?iso-8859-1?Q?iJBy+uEJBpntLzy56shDVYTOLLSiiKVhU+U2WFGRirx8Jdr9IBM+WcWXtv?=
 =?iso-8859-1?Q?K+IZvv9x4rtC15Bfk+PivbMakXbOF4JLM24yyZfxeG4enqHtmB3xfY7FiY?=
 =?iso-8859-1?Q?ATnz3GrsxQErzBpnA1FqquuuTXCRXQApqgIfUOZgCyNMolkEpjmzKsicx9?=
 =?iso-8859-1?Q?gEld8E6vjZLzGFxDAX1hwWTzLvjGK9E5kusMjsm7zgxWgfIpl8dw9IlNYC?=
 =?iso-8859-1?Q?qIEacoyhC9MtBXx+Kt15czPw16rT7n63FvjeeY4CWGMQhbBO1mI2HDpv4Y?=
 =?iso-8859-1?Q?RC4t0rUkr86jfSetRTlf1+r3Fthqods0WDcghorMfKbJEC/Oh4oc3XFN1J?=
 =?iso-8859-1?Q?x5hKbd5Ug0kQX8T7D7LssOsdxa+31W+AEE56K4R3BCeA9tC47zW9bXTXvI?=
 =?iso-8859-1?Q?kQI7vRA81EhbV5epUMCbQlcUXLcE7wXCE0BpxUrolgOs4IEaAakmvrg6/m?=
 =?iso-8859-1?Q?cnWmyxrKdbFJsImEyukQpI9qhIfLAyNtNO4XQX0Mi2mwXMpA3N3WX1qm2M?=
 =?iso-8859-1?Q?dsAY3EP3a6Z+i8sdUcvSGvoGtY2N6iX48gHxjIt2/ouhZS3wkzfEkz2QFB?=
 =?iso-8859-1?Q?96RR2FUkUA/4cSMFc6nGBUVoij915l7lhDlOeIk8/QBz0KPdbBeFHMGpcn?=
 =?iso-8859-1?Q?c24nMgi+vPoUqggUY7nfyq?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?VJu7Tv/KP0JBsnOyJE4ZEGZzIJ7gzbHgIfO3RY5qzU0mOQxNybXXW80Ill?=
 =?iso-8859-1?Q?Trp8e9/xWuGdLr5iWOatmciwmMWcA6CuWkUxPk7sm8f4XggOR0Tnnakp51?=
 =?iso-8859-1?Q?Xu8L+bx+y7lG47SU1vtexQtTvW7RpXMJ8aaNX6Wqj7A5p81mybUOACMM5e?=
 =?iso-8859-1?Q?hpc+TLSctFm9Li3gsuSg9vvkOz6YITw4VmRpLvL7TWHo+rR45TEY3XTgz3?=
 =?iso-8859-1?Q?nv0/tUJoaV6LO2iIY4vqJ9qwdxXIL5bLrl5LSXEWIiw+fvAc2F2QR+KTbb?=
 =?iso-8859-1?Q?hzS0myokRbKxm4ZR/XrQbIVu7xFfePLKp5KRrBh5xQnAUzwUr4EbxOvGOb?=
 =?iso-8859-1?Q?/0mWBZGVa1YrfH8j1qJd7b+FlE8EzfEnEQ+w5qwPvWgNiH57Lzf1mtnCGA?=
 =?iso-8859-1?Q?uyLM8rLZUBFsRh1nRvf2DWjucB6eMpWWPQhmfeEojkIKHbFEWxUJYhK5nh?=
 =?iso-8859-1?Q?4ItohKQKPDpAHSfFjHs770GdUcDPtTVp7XF0NNQ1qmwLvHgESPhDZfvSGK?=
 =?iso-8859-1?Q?yijohi9HUuFeZ3SrhjsGkt7IE+/uPUZ5QeUQI5eSsaozB05tK45B6rfh4V?=
 =?iso-8859-1?Q?qZX6Vo8Bc9wdosqP+sCkLWomzqhvP1YTm1Ejax6HGtAzPkEE0WiepVkD/T?=
 =?iso-8859-1?Q?pt11X9+4+yZwz14bjhm2yBSIHDh/OjTvKNHIqoNmbXYi9+BtT/iPFBmMPw?=
 =?iso-8859-1?Q?3ZDuS7MPYH1oKT/e9uQmeC17ehu8/a42w+1zWoPAFBzEeTMIUaPjQKqwtS?=
 =?iso-8859-1?Q?Sa3bdo83y/HtOBF7d4QJvwcZ+cuvPs+Nh/AQ0UkF+/VTW3wsNpBjHzq9Ny?=
 =?iso-8859-1?Q?uXBIjn/gLM/P4dgCbHeekckovV6DBCPz2M1n0JivSIPEiaoTe3zqCmmCn4?=
 =?iso-8859-1?Q?YJRX8LRXiijSJpus+O14aA5OGrOg65X9eQc6fD981kfd0PYPBEMxbTIBKy?=
 =?iso-8859-1?Q?01UM45jE+P9e7QNbGNPPFae4wDhrm4dA0ZLB6bVYdIgxzTc66ya+lI+kfp?=
 =?iso-8859-1?Q?0tqnSdOZznCyeEHpp7SqFjW1UrjvABOnNWyhOWwwxCMmwVP/drb+xafT7b?=
 =?iso-8859-1?Q?OYFzhD68wGmx93KtS8lFsACr0vX4FIzuuix6kSxbYPEKXVfspBM5LyfV4k?=
 =?iso-8859-1?Q?07DXs+Cr/LcmcKSIb/RG2TAsF0m6hLzhhBGYXdft3ns52TlaEvdq9Wodyi?=
 =?iso-8859-1?Q?HHbX5u3s0tRMqA7fRfNST+herVyk8l14Ei7X+hINADA4ZOJgAV8ZPz0/7O?=
 =?iso-8859-1?Q?Dj/LHH3s42ArvMH3XfyXGfTjgiwJeSFtqHGYSNsP0UNa3j5Jza3D1VwfTs?=
 =?iso-8859-1?Q?vzyo7kThrJgr4854j22m3pfg/hDsZosQ57r/jsmhlxuZ9MBux5PrXB8qzR?=
 =?iso-8859-1?Q?qW2+C8osfBUj8RF6FI+QLKwwAFDE+FZeFIPVuLLdYTMh7JDiSJrd/irtF+?=
 =?iso-8859-1?Q?vuadTFRMbba49DHDIKlmCI3+nBKS4gsbpCQN68HEw58051e9IdTl7vlO91?=
 =?iso-8859-1?Q?m/8gRwGgiiRRRD3aJgBd2LR6iyDLQ5yQeOQX/hSiwM3BCggLaZ59d2XlIt?=
 =?iso-8859-1?Q?Fck4qGTaN+r/rEuyiwIITRM/gpV+Q05LdBChkjrbKwkkHPAMWBEni9HuR/?=
 =?iso-8859-1?Q?IYl4lld4mFN3rIM8qf4V25sEffHSWGIbWtW6/ekfjNfk92zXOGGJ3mZQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bad1aea0-d43c-4bae-96d7-08de2c4ec2f6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 18:16:32.4214 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TYZ0WjpNsR8WpCdwZWKucWajFo+XGoWouNKXK1KmcbYE6xgmGU+KWJtkG/aVuJewtyn+CcgBMlp2fr7qMB34cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6391
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

On Tue, Nov 25, 2025 at 01:26:27PM +0530, Himal Prasad Ghimiray wrote:
> ALLOW UNMAP of VMAs associated with SVM mappings when the MAP operation
> is intended to merge adjacent CPU_ADDR_MIRROR VMAs.
> 
> v2
> - Remove mapping exist check in garbage collector
> 
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_svm.c      |  3 ---
>  drivers/gpu/drm/xe/xe_vm.c       | 10 +++++++---
>  drivers/gpu/drm/xe/xe_vm_types.h |  1 +
>  3 files changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index e895a95af126..46977ec1e0de 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -314,9 +314,6 @@ static int xe_svm_range_set_default_attr(struct xe_vm *vm, u64 start, u64 end)
>  	has_default_attr = xe_vma_has_default_mem_attrs(vma);
>  
>  	if (has_default_attr) {
> -		if (xe_svm_has_mapping(vm, xe_vma_start(vma), xe_vma_end(vma)))
> -			return 0;
> -
>  		start = xe_vma_start(vma);
>  		end = xe_vma_end(vma);
>  	} else if (xe_vma_start(vma) == start && xe_vma_end(vma) == end) {
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 2681039f3221..a7a21966e390 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2246,8 +2246,10 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
>  
>  	switch (operation) {
>  	case DRM_XE_VM_BIND_OP_MAP:
> -		if (flags & DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR)
> +		if (flags & DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR) {
>  			xe_vm_find_cpu_addr_mirror_vma_range(vm, &range_start, &range_end);
> +			vops->flags |= XE_VMA_OPS_FLAG_ALLOW_SVM_UNMAP;
> +		}
>  
>  		fallthrough;
>  	case DRM_XE_VM_BIND_OP_MAP_USERPTR: {
> @@ -2729,7 +2731,8 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
>  
>  			if (xe_vma_is_cpu_addr_mirror(vma) &&
>  			    xe_svm_has_mapping(vm, xe_vma_start(vma),
> -					       xe_vma_end(vma)))
> +					       xe_vma_end(vma)) &&
> +			    !(vops->flags & XE_VMA_OPS_FLAG_ALLOW_SVM_UNMAP))
>  				return -EBUSY;
>  
>  			if (!xe_vma_is_cpu_addr_mirror(vma))
> @@ -4315,6 +4318,8 @@ static int xe_vm_alloc_vma(struct xe_vm *vm,
>  
>  	if (is_madvise)
>  		vops.flags |= XE_VMA_OPS_FLAG_MADVISE;
> +	else
> +		vops.flags |= XE_VMA_OPS_FLAG_ALLOW_SVM_UNMAP;
>  
>  	err = vm_bind_ioctl_ops_parse(vm, ops, &vops);
>  	if (err)
> @@ -4391,7 +4396,6 @@ int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t start, uint64_t range)
>  static bool is_cpu_addr_vma_with_default_attr(struct xe_vma *vma)
>  {
>  	return vma && xe_vma_is_cpu_addr_mirror(vma) &&
> -	       !xe_svm_has_mapping(xe_vma_vm(vma), xe_vma_start(vma), xe_vma_end(vma)) &&
>  	       xe_vma_has_default_mem_attrs(vma);
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index ccd6cc090309..3bf912bfbdcc 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -467,6 +467,7 @@ struct xe_vma_ops {
>  #define XE_VMA_OPS_FLAG_MADVISE          BIT(1)
>  #define XE_VMA_OPS_ARRAY_OF_BINDS	 BIT(2)
>  #define XE_VMA_OPS_FLAG_SKIP_TLB_WAIT	 BIT(3)
> +#define XE_VMA_OPS_FLAG_ALLOW_SVM_UNMAP  BIT(4)
>  	u32 flags;
>  #ifdef TEST_VM_OPS_ERROR
>  	/** @inject_error: inject error to test error handling */
> -- 
> 2.34.1
> 
