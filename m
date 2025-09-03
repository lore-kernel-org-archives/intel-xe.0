Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B285CA1012
	for <intel-xe@archiver.kernel.org>; Wed,  3 Sep 2025 17:58:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AC3D10E1B6;
	Wed,  3 Sep 2025 17:58:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="biy6wypT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F116210E1B6
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Sep 2025 17:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756922319; x=1788458319;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=41AV+UQLDGtRlvhV003X9DzAjeShBiXAsOFQ60Em8kI=;
 b=biy6wypT36AxY1cEzUw4bULgg0sbai2cFD0ZxxqTgyDzGZaHCXuroEYY
 SdwV+yQ7Ukyy4L3AGEP1iFAvT5CXKtQ8Dz3cQw/BdCEehgyU7LODpChsN
 EFXUKnkt8zyvj1IFC2ltvIBaJMHkjcvsHR7sDwH3VXyR0lbBTbMt0yezp
 F1sPAplYti3uc8iKOKFmjL5zl0ILxPJFhHj8vOAfibw3TkSgQU214KUh4
 1pE41+S5MNY7WmYB1gmMvtVQOoMtXHUmb33J8nZuwEnQpzWjuI5anxgzR
 O/byJhDbs992j2Btxg3XPjMRggiCTUcIFlBldnnufztKI9XlYSJkdRAQX Q==;
X-CSE-ConnectionGUID: ozprFWbsStyKywRZacHIAg==
X-CSE-MsgGUID: P6otBYWCQpGDbpf33wA4Tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="59103488"
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; d="scan'208";a="59103488"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 10:58:37 -0700
X-CSE-ConnectionGUID: i15c3PE5SxCr3cKoHz0nOw==
X-CSE-MsgGUID: eBinTl3rRu2Pd/eHMiZzRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; d="scan'208";a="195314187"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 10:58:37 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 3 Sep 2025 10:58:36 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 3 Sep 2025 10:58:36 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.78)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 3 Sep 2025 10:58:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JyGWVEnbjuKf0kPVxKurvTTRUOERm+Xn9znIAUwOKg1aMEXFR4QVtpQw1gosRPmNj2qQu+DvgX847P8jYiwIAXLN+65uVlIBcmib9YDQKUSiHtvhBSiKStUkIjbOhuJ/iCeVRx5sF3O9AXRpFxWotQZvgfmBFuhyv5U+FXfr2gNIPYeJWqAAnUSpueCiAQV1/g2kDa6LnY7Awj3LU0pykbxRU57wnr/rnYhP/rAm374ctHRU+3zkorTsC6I+MFsDNYKNdIul+G1XxSl4jj2R+LYfJtsdSa0+9p3LCrSx4mE5nsJQBYnGqhFDSS+C8JBDKOITMC4Mbfg54NzYlYxWLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LJZ10q19JWd+hwfetcw7Kby2/evKxGSh3SO0edodzxM=;
 b=Ivjv/pkLJlErmMPQrqWuy/NWnpsFsN6JcT9UXb2l90ztNIoIftMVGjvfMERLh8Fe2ac8dns55ExttaQ4+6PxFvhnie7H5OhmFiU1ASL++tLls+W3c5PeYTIrXG+PyERTYxqgpU0JRs9RzBPB3/2UiBTE4nOLK+b85V83vjHjFWBpt4cU5n7RKAwlCtJiFF4CuVMr3ZG9DcaYKVVQz0SGZmLRvniCEJyBTtqYB5TTf4krkkZJMenlg9h4zjoYOf9vsNbe/QsqZODeJojg3Xs5k7MwYHVDo4MErmkb9yUfHKG4K0uivILVr79udC9vzV+IujrtzAPINRwMmRjJ14bpkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA0PR11MB4638.namprd11.prod.outlook.com (2603:10b6:806:73::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Wed, 3 Sep
 2025 17:58:34 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9094.015; Wed, 3 Sep 2025
 17:58:33 +0000
Date: Wed, 3 Sep 2025 10:58:31 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Jani Nikula <jani.nikula@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Subject: Re: [PATCH v4 06/13] drm/xe: Convert the CPU fault handler for
 exhaustive eviction
Message-ID: <aLiBx5vkRAidvyRp@lstrano-desk.jf.intel.com>
References: <20250902124021.70211-1-thomas.hellstrom@linux.intel.com>
 <20250902124021.70211-7-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250902124021.70211-7-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: MW4PR03CA0262.namprd03.prod.outlook.com
 (2603:10b6:303:b4::27) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA0PR11MB4638:EE_
X-MS-Office365-Filtering-Correlation-Id: a48f107e-f3dc-4908-b718-08ddeb137f9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?uX1dkjvSSKH3l/ENIQtuXRPT2jHWP83atzH+/cQpoVtWL02tI5Ma8Y3jq0?=
 =?iso-8859-1?Q?ycVXv0vRIY7iCSlBx8aU7eY+DRLNGPwYtohyhLVp0oK5lNovV9LQSn1r4U?=
 =?iso-8859-1?Q?XWJgZC7JciCoryqd7gq5zupZwQag/97uniDd7wKP5YFPxFeppJQKYzgMaK?=
 =?iso-8859-1?Q?/DLrwEbK44OkHCkZJwE9w6SshF9jB2+EK63GRuw/8//N5ZVy8ZWjPTaiWi?=
 =?iso-8859-1?Q?zXWoC5TB+AFmKfs9SfUy3bD437FFe6nfTo3W9mM6Sn+LwV7ymHtgP3G3Lg?=
 =?iso-8859-1?Q?bFLAxmFgQpwxj28MwPiFkpoYzFEOvij8jnZRFYkxMRFbNKkaqRawE19MhH?=
 =?iso-8859-1?Q?7dIvF+TUze2KA/NEIIKQc9b9Kr4VqkogrYEsBpO2zKujEPnL+pJQsurTcr?=
 =?iso-8859-1?Q?0ne4qtKOT8RFRiOB3NEMeH9YWmyoxGEMHIsKw2Nk9KROEqlcOQQwZFJBwM?=
 =?iso-8859-1?Q?XGKpTmYwk0LsVA3c2OdHgyHOVBqp71SmiZR9eVh9ecjRI8lXILyCEzDZhR?=
 =?iso-8859-1?Q?vtkI6hQb61112VlwrpZSjOncfM2ojXAKXKHysbo31jxcc2/8r/Ib7L8/D+?=
 =?iso-8859-1?Q?MxRonP/DPQIrnyP8w7F4Jj5lPA81U6666OEth2iLZMbR0gYh1mnA0grm/u?=
 =?iso-8859-1?Q?+lDjPskAPD5BFg13cQqZCOnGjglKNqESfQiVtBYzOpdSvN46/IJy5ewvHH?=
 =?iso-8859-1?Q?bjejNn5W38fmF8CKH58V3ZnKh6GUH+k6zZXg2hgHiCOlrBhJw34QezsmQ0?=
 =?iso-8859-1?Q?/v8crj9fCv0Qecaj896M4RW5gfINV4dEzqTLUS7eVByTso4JgkwzhTrynw?=
 =?iso-8859-1?Q?EgnopwdIrOFvhZYHNIeXTeA68I5k52ylGh7mSTqKqiuZHPFjv5U9VMBlav?=
 =?iso-8859-1?Q?a4xhHd6FavM/oPWZjRf4MfvCxoeN7nMaBaQc3t6VVjs+K0JnW36yl4vRHK?=
 =?iso-8859-1?Q?vYctF4hRO4RGveN/jFhkw1azx2/Ig6CrHn7gtAMQfUcnB/NwQZrjjSOr9B?=
 =?iso-8859-1?Q?IevhlT6qrVHyUCby9XPYQq3ABWaLHKoLtKxjw+fAmw166958FVzL4p4cE+?=
 =?iso-8859-1?Q?lmuTOAMTqZpd31LQuxdOX5seV0cDMhtWtwgUuEi2sueSKmwwXuRTbqu1QS?=
 =?iso-8859-1?Q?c0xYBaGbySiulyi5+vFUmWM2zAY1oCkKA+1UQiRcpDSTHLIxQ6vAggtMlx?=
 =?iso-8859-1?Q?qLPBnAFScW1duZ2e0xckOKnOqNP8m7izJSIs91tzz/PZyskZoDmOay2WEN?=
 =?iso-8859-1?Q?iPRtLgTR/k9U7ILisV9usJu0ojhvcKdu+szV3HDpwcRRd1AJZMtNU4NOcU?=
 =?iso-8859-1?Q?UX1AkYlFa6nZCyGBL+BfWp5iVX2DUlCNoYPiZqW+9d1b52U0RqVkWjtzkT?=
 =?iso-8859-1?Q?cFJ0R+hFVu8nX4Ra9Kn2TQlc39Nc9B9keGcMZ/tas9jQ57+XvwloA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?BQ4lZmGftWOErwcSyWWDDrvFyMpP3c3tccalgriF3FvbpY8CpGbrM5UBTO?=
 =?iso-8859-1?Q?AIjlUVGFmDhkznbm2NAcOQwfBz1kFXvDKZVLSwXEN4UZgNxxoJWBvFHkBX?=
 =?iso-8859-1?Q?6ttY5e6aPOVZa857kZsEwKV3QMpUuz3qkYYJKSKz67/3ojAu9mt19gdWTd?=
 =?iso-8859-1?Q?AOkPIaaUOsz8XbL+CZ/ohwTwT+VGxzDeNR/h8HbOeIwhe/wk3neHKQdcSx?=
 =?iso-8859-1?Q?EpAqlizjl/nPi2Z8NLYhJUVfKLA20/Oe7k/d1Tn+d+5ielZFxfdJfVJbPi?=
 =?iso-8859-1?Q?ts1qTHVJj6E077pIMVrT2uzl60Qi/2U7PhGnRBFv/Y6zD7TbI0dlIO7bjM?=
 =?iso-8859-1?Q?1qAvFDcPWFZXFS0oXUsf50Ahpg6o6m3017o9JmE+JGG92wLbFw/FAw85YP?=
 =?iso-8859-1?Q?VWD/MgDJTd3vQ5dXOZqPvnvLDU81TxsIuYigzynXjjyo1k9nBfP94n54iX?=
 =?iso-8859-1?Q?CMa4ESe9Dwnc4Y31evNL6CNbtaa97Y9n0y0NWWy0p5ZOHf2CmkH54R3RNm?=
 =?iso-8859-1?Q?eNmGvgm5CMXjDKv1XoaTmdSP1A0dOYswXq8enI68Mb7pMMC9g6bQVwCL7F?=
 =?iso-8859-1?Q?oY8F9RR8MNspXu+yA60guinY/f14HO8DKsoesjgihXssqwUR/hbmX7U9hC?=
 =?iso-8859-1?Q?JeyzKf43AMPvNfqokyjXWb78XqPdIWCTWCYkhKWkN8NS7rebEY0hbEQwh/?=
 =?iso-8859-1?Q?FEnCursURvraVWeVjVZeoTtHjc0KQLsxPRhFxC+H5KCUO22J7wY4MKXD/1?=
 =?iso-8859-1?Q?WvGglYsh/8kuaw+6EevusV3iBqUKGADtrmIujeZhBUxWCz4eaWNrSkatwR?=
 =?iso-8859-1?Q?3EhbiZsVuHsUsfXvFkvyqc/4fBXHTfW0pbU6uF4Fa8y5ed47OYLVdt9pEn?=
 =?iso-8859-1?Q?e20VGRbBzKO4KSFL4ZWy3k6NAmNPRxjIVYP5hJlaiSPwr6X14u7+Wx95j/?=
 =?iso-8859-1?Q?P0Buk/XSgOIOUFPsHsLWqk4bQP8od86b7dG7s451y2ALRA6+FJAxsemW9j?=
 =?iso-8859-1?Q?pWRD7HR4W0j8GpS68yZaFkf45Q4susaSIwRIds7VOMJdIY17boEwKkrSDV?=
 =?iso-8859-1?Q?0l1O0vcSMvQ9r4Y3wqhfeEJI/gjliuWmExzwobGdYdDVevdm0VIpe9dNaM?=
 =?iso-8859-1?Q?ALMJRox+MQiFB7BbbDl7UrWkEFtPf5FZofSouVQgdWNf9G2e81RjGP70Fa?=
 =?iso-8859-1?Q?LAe5kQxYBql4I3FuSNSSM60uQ4yaTBEOcZJUczItKVxTFi5zihv9gYs+Qm?=
 =?iso-8859-1?Q?otO1D0bIVPRaBCpZ3uOcAv1oaKSbiDi4HAmVQKrGFxzd4MYppACUNZp7Z2?=
 =?iso-8859-1?Q?hbcLj1MVYs4qgZr8ZEPQnWmGF1xhKNqnvt3danG5O0M5CbUFTmUPCoB95e?=
 =?iso-8859-1?Q?X4M023gh+PfsYswnChV7Ws72bt4Z9b9dDgUidmZBSypbq5x4s7ax1bGZyP?=
 =?iso-8859-1?Q?k7wS3/lTNZvVpmQa6tp6aypc96TOL72IFmISI1Q7rm+g1E57SHxqCWbFk+?=
 =?iso-8859-1?Q?yfZPisz0QzngbXV/+XrFIEju5YS+hMq8m7KkTmBP7Fl9+bQh7b1jIP8btM?=
 =?iso-8859-1?Q?7oyN73D/AxIzhUydrTscnuIFJv1hw6KZ7j+Av80enIPAzhx/1TENkgfJFC?=
 =?iso-8859-1?Q?VfhgOP6vTnzUVr8KxT0zh/siXcmC5NMVSN+hn149o66ybkwGCWl26Mzw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a48f107e-f3dc-4908-b718-08ddeb137f9b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 17:58:33.6144 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HpHaXaQgL46hcEIOkGAGz9NbMYto6BoPypfNebS69xCQ7GD4AaTraq9kz3r5+AXRBIHi+xH5ka9v/ugakcJssg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4638
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

On Tue, Sep 02, 2025 at 02:40:14PM +0200, Thomas Hellström wrote:
> The CPU fault handler may populate bos and migrate, and in doing
> so might interfere with other tasks validating.
> 
> Rework the CPU fault handler completely into a fastpath
> and a slowpath. The fastpath trylocks only the validation lock
> in read-mode. If that fails, there's a fallback to the
> slowpath, where we do a full validation transaction.
> 
> This mandates open-coding of bo locking, bo idling and
> bo populating, but we still call into TTM for fault
> finalizing.
> 
> v2:
> - Rework the CPU fault handler to actually take part in
>   the exhaustive eviction scheme (Matthew Brost).
> v3:
> - Don't return anything but VM_FAULT_RETRY if we've dropped the
>   mmap_lock. Not even if a signal is pending.
> - Rebase on gpu_madvise() and split out fault migration.
> - Wait for idle after migration.
> - Check whether the resource manager uses tts to determine
>   whether to map the tt or iomem.
> - Add a number of asserts.
> - Allow passing a ttm_operation_ctx to xe_bo_migrate() so that
>   it's possible to try non-blocking migration.
> - Don't fall through to TTM on migration / population error
>   Instead remove the gfp_retry_mayfail in mode 2 where we
>   must succeed. (Matthew Brost)
> 

This version doesn't appear to have the checks around
TTM_TT_FLAG_EXTERNAL / TTM_TT_FLAG_EXTERNAL_MAPPABLE mentioned here [1].

Was not not including these intentional or an oversight?

Matt

[1] https://patchwork.freedesktop.org/patch/670282/?series=152882&rev=2#comment_1229753

> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/display/xe_fb_pin.c |   2 +-
>  drivers/gpu/drm/xe/xe_bo.c             | 240 ++++++++++++++++++++-----
>  drivers/gpu/drm/xe/xe_bo.h             |   3 +-
>  drivers/gpu/drm/xe/xe_dma_buf.c        |   6 +-
>  drivers/gpu/drm/xe/xe_gt_pagefault.c   |   2 +-
>  drivers/gpu/drm/xe/xe_validation.c     |   3 +-
>  drivers/gpu/drm/xe/xe_vm.c             |   1 +
>  7 files changed, 205 insertions(+), 52 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> index 4b0748e6fdd6..d7a8448a43dc 100644
> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> @@ -314,7 +314,7 @@ static struct i915_vma *__xe_pin_fb_vma(const struct intel_framebuffer *fb,
>  		goto err;
>  
>  	if (IS_DGFX(xe))
> -		ret = xe_bo_migrate(bo, XE_PL_VRAM0, exec);
> +		ret = xe_bo_migrate(bo, XE_PL_VRAM0, NULL, exec);
>  	else
>  		ret = xe_bo_validate(bo, NULL, true, exec);
>  	if (!ret)
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index d417d6c7f526..c3151f3874da 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1725,68 +1725,213 @@ static bool should_migrate_to_smem(struct xe_bo *bo)
>  	       bo->attr.atomic_access == DRM_XE_ATOMIC_CPU;
>  }
>  
> -static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
> +/* Populate the bo if swapped out, or migrate if the access mode requires that. */
> +static int xe_bo_fault_migrate(struct xe_bo *bo, struct ttm_operation_ctx *ctx,
> +			       struct drm_exec *exec)
> +{
> +	struct ttm_buffer_object *tbo = &bo->ttm;
> +	int err = 0;
> +
> +	if (ttm_manager_type(tbo->bdev, tbo->resource->mem_type)->use_tt) {
> +		xe_assert(xe_bo_device(bo),
> +			  dma_resv_test_signaled(tbo->base.resv, DMA_RESV_USAGE_KERNEL) ||
> +			  (tbo->ttm && ttm_tt_is_populated(tbo->ttm)));
> +		err = ttm_bo_populate(&bo->ttm, ctx);
> +	} else if (should_migrate_to_smem(bo)) {
> +		xe_assert(xe_bo_device(bo), bo->flags & XE_BO_FLAG_SYSTEM);
> +		err = xe_bo_migrate(bo, XE_PL_TT, ctx, exec);
> +	}
> +
> +	return err;
> +}
> +
> +/* Call into TTM to populate PTEs, and register bo for PTE removal on runtime suspend. */
> +static vm_fault_t __xe_bo_cpu_fault(struct vm_fault *vmf, struct xe_device *xe, struct xe_bo *bo)
> +{
> +	vm_fault_t ret;
> +
> +	trace_xe_bo_cpu_fault(bo);
> +
> +	ret = ttm_bo_vm_fault_reserved(vmf, vmf->vma->vm_page_prot,
> +				       TTM_BO_VM_NUM_PREFAULT);
> +	/*
> +	 * When TTM is actually called to insert PTEs, ensure no blocking conditions
> +	 * remain, in which case TTM may drop locks and return VM_FAULT_RETRY.
> +	 */
> +	xe_assert(xe, ret != VM_FAULT_RETRY);
> +
> +	if (ret == VM_FAULT_NOPAGE &&
> +	    mem_type_is_vram(bo->ttm.resource->mem_type)) {
> +		mutex_lock(&xe->mem_access.vram_userfault.lock);
> +		if (list_empty(&bo->vram_userfault_link))
> +			list_add(&bo->vram_userfault_link,
> +				 &xe->mem_access.vram_userfault.list);
> +		mutex_unlock(&xe->mem_access.vram_userfault.lock);
> +	}
> +
> +	return ret;
> +}
> +
> +static vm_fault_t xe_err_to_fault_t(int err)
> +{
> +	switch (err) {
> +	case 0:
> +	case -EINTR:
> +	case -ERESTARTSYS:
> +	case -EAGAIN:
> +		return VM_FAULT_NOPAGE;
> +	case -ENOMEM:
> +	case -ENOSPC:
> +		return VM_FAULT_OOM;
> +	default:
> +		break;
> +	}
> +	return VM_FAULT_SIGBUS;
> +}
> +
> +static vm_fault_t xe_bo_cpu_fault_fastpath(struct vm_fault *vmf, struct xe_device *xe,
> +					   struct xe_bo *bo, bool needs_rpm)
> +{
> +	struct ttm_buffer_object *tbo = &bo->ttm;
> +	vm_fault_t ret = VM_FAULT_RETRY;
> +	struct xe_validation_ctx ctx;
> +	struct ttm_operation_ctx tctx = {
> +		.interruptible = true,
> +		.no_wait_gpu = true,
> +		.gfp_retry_mayfail = true,
> +
> +	};
> +	int err;
> +
> +	if (needs_rpm && !xe_pm_runtime_get_if_active(xe))
> +		return VM_FAULT_RETRY;
> +
> +	err = xe_validation_ctx_init(&ctx, &xe->val, NULL,
> +				     (struct xe_val_flags) {
> +					     .interruptible = true,
> +					     .no_block = true
> +				     });
> +	if (err)
> +		goto out_pm;
> +
> +	if (!dma_resv_trylock(tbo->base.resv))
> +		goto out_validation;
> +
> +	err = xe_bo_fault_migrate(bo, &tctx, NULL);
> +	if (err) {
> +		/* Return VM_FAULT_RETRY on these errors. */
> +		if (err != -ENOMEM && err != -ENOSPC && err != -EBUSY)
> +			ret = xe_err_to_fault_t(err);
> +		goto out_unlock;
> +	}
> +
> +	if (dma_resv_test_signaled(bo->ttm.base.resv, DMA_RESV_USAGE_KERNEL))
> +		ret = __xe_bo_cpu_fault(vmf, xe, bo);
> +
> +out_unlock:
> +	dma_resv_unlock(tbo->base.resv);
> +out_validation:
> +	xe_validation_ctx_fini(&ctx);
> +out_pm:
> +	if (needs_rpm)
> +		xe_pm_runtime_put(xe);
> +
> +	return ret;
> +}
> +
> +static vm_fault_t xe_bo_cpu_fault(struct vm_fault *vmf)
>  {
>  	struct ttm_buffer_object *tbo = vmf->vma->vm_private_data;
>  	struct drm_device *ddev = tbo->base.dev;
>  	struct xe_device *xe = to_xe_device(ddev);
>  	struct xe_bo *bo = ttm_to_xe_bo(tbo);
>  	bool needs_rpm = bo->flags & XE_BO_FLAG_VRAM_MASK;
> -	struct drm_exec *exec;
> +	bool retry_after_wait = false;
> +	struct xe_validation_ctx ctx;
> +	struct drm_exec exec;
>  	vm_fault_t ret;
> -	int idx, r = 0;
> +	int err = 0;
> +	int idx;
>  
> -	if (needs_rpm)
> -		xe_pm_runtime_get(xe);
> +	if (!drm_dev_enter(&xe->drm, &idx))
> +		return ttm_bo_vm_dummy_page(vmf, vmf->vma->vm_page_prot);
>  
> -	exec = XE_VALIDATION_UNIMPLEMENTED;
> -	ret = ttm_bo_vm_reserve(tbo, vmf);
> -	if (ret)
> +	ret = xe_bo_cpu_fault_fastpath(vmf, xe, bo, needs_rpm);
> +	if (ret != VM_FAULT_RETRY)
>  		goto out;
>  
> -	if (drm_dev_enter(ddev, &idx)) {
> -		trace_xe_bo_cpu_fault(bo);
> +	if (fault_flag_allow_retry_first(vmf->flags)) {
> +		if (vmf->flags & FAULT_FLAG_RETRY_NOWAIT)
> +			goto out;
> +		retry_after_wait = true;
> +		xe_bo_get(bo);
> +		mmap_read_unlock(vmf->vma->vm_mm);
> +	} else {
> +		ret = VM_FAULT_NOPAGE;
> +	}
>  
> -		xe_validation_assert_exec(xe, exec, &tbo->base);
> -		if (should_migrate_to_smem(bo)) {
> -			xe_assert(xe, bo->flags & XE_BO_FLAG_SYSTEM);
> +	/*
> +	 * The fastpath failed and we were not required to return and retry immediately.
> +	 * We're now running in one of two modes:
> +	 *
> +	 * 1) retry_after_wait == true: The mmap_read_lock() is dropped, and we're trying
> +	 * to resolve blocking waits. But we can't resolve the fault since the
> +	 * mmap_read_lock() is dropped. After retrying the fault, the aim is that the fastpath
> +	 * should succeed. But it may fail since we drop the bo lock.
> +	 *
> +	 * 2) retry_after_wait == false: The fastpath failed, typically even after
> +	 * a retry. Do whatever's necessary to resolve the fault.
> +	 *
> +	 * This construct is recommended to avoid excessive waits under the mmap_lock.
> +	 */
>  
> -			r = xe_bo_migrate(bo, XE_PL_TT, exec);
> -			if (r == -EBUSY || r == -ERESTARTSYS || r == -EINTR)
> -				ret = VM_FAULT_NOPAGE;
> -			else if (r)
> -				ret = VM_FAULT_SIGBUS;
> -		}
> -		if (!ret)
> -			ret = ttm_bo_vm_fault_reserved(vmf,
> -						       vmf->vma->vm_page_prot,
> -						       TTM_BO_VM_NUM_PREFAULT);
> -		drm_dev_exit(idx);
> +	if (needs_rpm)
> +		xe_pm_runtime_get(xe);
>  
> -		if (ret == VM_FAULT_RETRY &&
> -		    !(vmf->flags & FAULT_FLAG_RETRY_NOWAIT))
> -			goto out;
> +	xe_validation_guard(&ctx, &xe->val, &exec, (struct xe_val_flags) {.interruptible = true},
> +			    err) {
> +		struct ttm_operation_ctx tctx = {
> +			.interruptible = true,
> +			.no_wait_gpu = false,
> +			.gfp_retry_mayfail = retry_after_wait,
> +		};
> +		long lerr;
>  
> -		/*
> -		 * ttm_bo_vm_reserve() already has dma_resv_lock.
> -		 */
> -		if (ret == VM_FAULT_NOPAGE &&
> -		    mem_type_is_vram(tbo->resource->mem_type)) {
> -			mutex_lock(&xe->mem_access.vram_userfault.lock);
> -			if (list_empty(&bo->vram_userfault_link))
> -				list_add(&bo->vram_userfault_link,
> -					 &xe->mem_access.vram_userfault.list);
> -			mutex_unlock(&xe->mem_access.vram_userfault.lock);
> +		err = drm_exec_lock_obj(&exec, &tbo->base);
> +		drm_exec_retry_on_contention(&exec);
> +		if (err)
> +			break;
> +
> +		err = xe_bo_fault_migrate(bo, &tctx, &exec);
> +		if (err) {
> +			drm_exec_retry_on_contention(&exec);
> +			xe_validation_retry_on_oom(&ctx, &err);
> +			break;
>  		}
> -	} else {
> -		ret = ttm_bo_vm_dummy_page(vmf, vmf->vma->vm_page_prot);
> +
> +		lerr = dma_resv_wait_timeout(tbo->base.resv,
> +					     DMA_RESV_USAGE_KERNEL, true,
> +					     MAX_SCHEDULE_TIMEOUT);
> +		if (lerr < 0) {
> +			err = lerr;
> +			break;
> +		}
> +
> +		if (!retry_after_wait)
> +			ret = __xe_bo_cpu_fault(vmf, xe, bo);
>  	}
> +	/* if retry_after_wait == true, we *must* return VM_FAULT_RETRY. */
> +	if (err && !retry_after_wait)
> +		ret = xe_err_to_fault_t(err);
>  
> -	dma_resv_unlock(tbo->base.resv);
> -out:
>  	if (needs_rpm)
>  		xe_pm_runtime_put(xe);
>  
> +	if (retry_after_wait)
> +		xe_bo_put(bo);
> +out:
> +	drm_dev_exit(idx);
> +
>  	return ret;
>  }
>  
> @@ -1830,7 +1975,7 @@ int xe_bo_read(struct xe_bo *bo, u64 offset, void *dst, int size)
>  }
>  
>  static const struct vm_operations_struct xe_gem_vm_ops = {
> -	.fault = xe_gem_fault,
> +	.fault = xe_bo_cpu_fault,
>  	.open = ttm_bo_vm_open,
>  	.close = ttm_bo_vm_close,
>  	.access = xe_bo_vm_access,
> @@ -3060,6 +3205,8 @@ static void xe_place_from_ttm_type(u32 mem_type, struct ttm_place *place)
>   * xe_bo_migrate - Migrate an object to the desired region id
>   * @bo: The buffer object to migrate.
>   * @mem_type: The TTM region type to migrate to.
> + * @tctx: A pointer to a struct ttm_operation_ctx or NULL if
> + * a default interruptibe ctx is to be used.
>   * @exec: The drm_exec transaction to use for exhaustive eviction.
>   *
>   * Attempt to migrate the buffer object to the desired memory region. The
> @@ -3072,7 +3219,8 @@ static void xe_place_from_ttm_type(u32 mem_type, struct ttm_place *place)
>   * Return: 0 on success. Negative error code on failure. In particular may
>   * return -EINTR or -ERESTARTSYS if signal pending.
>   */
> -int xe_bo_migrate(struct xe_bo *bo, u32 mem_type, struct drm_exec *exec)
> +int xe_bo_migrate(struct xe_bo *bo, u32 mem_type, struct ttm_operation_ctx *tctx,
> +		  struct drm_exec *exec)
>  {
>  	struct xe_device *xe = ttm_to_xe_device(bo->ttm.bdev);
>  	struct ttm_operation_ctx ctx = {
> @@ -3084,6 +3232,7 @@ int xe_bo_migrate(struct xe_bo *bo, u32 mem_type, struct drm_exec *exec)
>  	struct ttm_place requested;
>  
>  	xe_bo_assert_held(bo);
> +	tctx = tctx ? tctx : &ctx;
>  
>  	if (bo->ttm.resource->mem_type == mem_type)
>  		return 0;
> @@ -3110,8 +3259,9 @@ int xe_bo_migrate(struct xe_bo *bo, u32 mem_type, struct drm_exec *exec)
>  		add_vram(xe, bo, &requested, bo->flags, mem_type, &c);
>  	}
>  
> -	xe_validation_assert_exec(xe_bo_device(bo), exec, &bo->ttm.base);
> -	return ttm_bo_validate(&bo->ttm, &placement, &ctx);
> +	if (!tctx->no_wait_gpu)
> +		xe_validation_assert_exec(xe_bo_device(bo), exec, &bo->ttm.base);
> +	return ttm_bo_validate(&bo->ttm, &placement, tctx);
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index c6bb90ca5c2e..8a057d39f0a8 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -284,7 +284,8 @@ uint64_t vram_region_gpu_offset(struct ttm_resource *res);
>  
>  bool xe_bo_can_migrate(struct xe_bo *bo, u32 mem_type);
>  
> -int xe_bo_migrate(struct xe_bo *bo, u32 mem_type, struct drm_exec *exec);
> +int xe_bo_migrate(struct xe_bo *bo, u32 mem_type, struct ttm_operation_ctx *ctc,
> +		  struct drm_exec *exec);
>  int xe_bo_evict(struct xe_bo *bo, struct drm_exec *exec);
>  
>  int xe_bo_evict_pinned(struct xe_bo *bo);
> diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
> index 78a827d4e726..2fdfeaf59fb1 100644
> --- a/drivers/gpu/drm/xe/xe_dma_buf.c
> +++ b/drivers/gpu/drm/xe/xe_dma_buf.c
> @@ -64,7 +64,7 @@ static int xe_dma_buf_pin(struct dma_buf_attachment *attach)
>  		return -EINVAL;
>  	}
>  
> -	ret = xe_bo_migrate(bo, XE_PL_TT, exec);
> +	ret = xe_bo_migrate(bo, XE_PL_TT, NULL, exec);
>  	if (ret) {
>  		if (ret != -EINTR && ret != -ERESTARTSYS)
>  			drm_dbg(&xe->drm,
> @@ -102,7 +102,7 @@ static struct sg_table *xe_dma_buf_map(struct dma_buf_attachment *attach,
>  
>  	if (!xe_bo_is_pinned(bo)) {
>  		if (!attach->peer2peer)
> -			r = xe_bo_migrate(bo, XE_PL_TT, exec);
> +			r = xe_bo_migrate(bo, XE_PL_TT, NULL, exec);
>  		else
>  			r = xe_bo_validate(bo, NULL, false, exec);
>  		if (r)
> @@ -170,7 +170,7 @@ static int xe_dma_buf_begin_cpu_access(struct dma_buf *dma_buf,
>  
>  	/* Can we do interruptible lock here? */
>  	xe_bo_lock(bo, false);
> -	(void)xe_bo_migrate(bo, XE_PL_TT, exec);
> +	(void)xe_bo_migrate(bo, XE_PL_TT, NULL, exec);
>  	xe_bo_unlock(bo);
>  
>  	return 0;
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> index ec6f6d520a9c..a054d6010ae0 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> @@ -87,7 +87,7 @@ static int xe_pf_begin(struct drm_exec *exec, struct xe_vma *vma,
>  	if (!bo)
>  		return 0;
>  
> -	return need_vram_move ? xe_bo_migrate(bo, vram->placement, exec) :
> +	return need_vram_move ? xe_bo_migrate(bo, vram->placement, NULL, exec) :
>  		xe_bo_validate(bo, vm, true, exec);
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_validation.c b/drivers/gpu/drm/xe/xe_validation.c
> index b90fda3dd5f4..826cd09966ef 100644
> --- a/drivers/gpu/drm/xe/xe_validation.c
> +++ b/drivers/gpu/drm/xe/xe_validation.c
> @@ -241,7 +241,8 @@ int xe_validation_exec_lock(struct xe_validation_ctx *ctx,
>   */
>  void xe_validation_ctx_fini(struct xe_validation_ctx *ctx)
>  {
> -	drm_exec_fini(ctx->exec);
> +	if (ctx->exec)
> +		drm_exec_fini(ctx->exec);
>  	xe_validation_unlock(ctx);
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 38d50ec3d939..d3060c5b2e8f 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3166,6 +3166,7 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
>  		if (!err && !xe_vma_has_no_bo(vma))
>  			err = xe_bo_migrate(xe_vma_bo(vma),
>  					    region_to_mem_type[region],
> +					    NULL,
>  					    exec);
>  		break;
>  	}
> -- 
> 2.50.1
> 
