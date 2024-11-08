Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2589AD64098
	for <intel-xe@archiver.kernel.org>; Fri,  8 Nov 2024 22:30:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E99B110E29E;
	Fri,  8 Nov 2024 22:30:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FdeOktp4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0BAC10E29E
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Nov 2024 22:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731105040; x=1762641040;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=LGmBUPCnwc5JXDozC26puWktD58wryMZMFn2sOFhbGE=;
 b=FdeOktp4i32Sjl+YpUuEKiDDTigG86vubI5ju79r4XKvjG+YOKgQ/XvK
 JrVEn20vx3ifxS/hI4NTpQ5I1dNkvXhKJG6LnEMSOZfsgFNiE12/bO2bX
 o5dkRbYFTsgOW/ySyaKj4KMKNhXvLnNIu0b+bs6Q+QqiMIApoMEREvUjO
 MNq6nEfmjubKi/Em3nDfOAIvARdbqLcH+nOjMeiZtYcs+b30CgBWhQipL
 /hZclzSEwHv+TVYYs18HXipvTfmceDaGKlyQQOXQGWF4+RAMVoZpgBwS8
 9RYmkmVH6BGVwetEn0XIgUSPtr7lwYN+UigB8Fi0DyHUzchGFFzViDlMW g==;
X-CSE-ConnectionGUID: t2fW6IIkTliA16I/22bXnQ==
X-CSE-MsgGUID: ezkb2MwmQ36KpCRHuPt0iA==
X-IronPort-AV: E=McAfee;i="6700,10204,11250"; a="41626878"
X-IronPort-AV: E=Sophos;i="6.12,139,1728975600"; d="scan'208";a="41626878"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 14:30:39 -0800
X-CSE-ConnectionGUID: n17VmfA3S3mczTT+mIM08A==
X-CSE-MsgGUID: ZlRQZWLRSr688ZY2J2+4PA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,139,1728975600"; d="scan'208";a="90309530"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Nov 2024 14:30:38 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 8 Nov 2024 14:30:36 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 8 Nov 2024 14:30:36 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 8 Nov 2024 14:30:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VW/7bTih6IeNZH79frBoxtiuC8WzLl35KocZRr83DMTFuoC+oijepXkJ+KLTqv0Gax7PXqq8d/f7nvhgyyt5pNwr1LZbAP2uVwvIb+l8GEvw7uY/BZAOoiiI3eRfNffRMNQggdbhSiscOCBDYQuPmLarvimQ6wI74Wh/1IiH2jgVM6vjOMSvp9hF9jnblKdSKNtfWDcVUJToZR+jdxkymieIGq/TJd114TNuIR/iAZx/xL30IUDMBd0j4JBx31iSlqSlFMJZWC1ZSUFZ35YItnyiAIwki7Uky9jTWFCK7tPVZtD9y+pPd0+v1a0ryi2SI+xBhkB+3VXQrTEkfqtO4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PVgafAD7CisbTY1c7wKqKsph+eA34xMwPtfb5ScE81o=;
 b=nCnyKoAjlnn8dtwqf4mK+qdGOiiUFC5L+jB0VW3fLMVWEifPDdqpaD2cZWkYUu5+4aTgurHCAPsNC1euOg3Xy0MyltzGXD79kW96fKIYe8VhyOIdH4LE4RI2DD/gjwy83DZdnR4/CauyVpLUXDIWrh5WjyDVHtM3T9fFt8ogX2OJwWHvXH0I+o5GVR0HIf/Vb0vpUPiWmPUQdFAZFiGsFKlheKI5jTvJuMrnR+NKnF1gX5IY7NeFV/tp18Mc9TCJJwomSP6bNtKT6WzKIXMSYt2VjE5AEEJccTLoqxYZwSg8ApCnfwFKKBpTkp1UA5921Xf05haFyPD88PS+Mrrv1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by MN2PR11MB4646.namprd11.prod.outlook.com (2603:10b6:208:264::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.22; Fri, 8 Nov
 2024 22:30:34 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%7]) with mapi id 15.20.8114.020; Fri, 8 Nov 2024
 22:30:34 +0000
Date: Fri, 8 Nov 2024 17:30:30 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Aravind Iddamsetty
 <aravind.iddamsetty@linux.intel.com>, Bommu Krishnaiah
 <krishnaiah.bommu@intel.com>, Riana Tauro <riana.tauro@intel.com>
Subject: Re: [PATCH 1/3] drm/xe/pmu: Enable PMU interface
Message-ID: <Zy6RBoGE7dp3PMi5@intel.com>
References: <20241108181512.3461481-1-vinay.belgaumkar@intel.com>
 <20241108181512.3461481-2-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241108181512.3461481-2-vinay.belgaumkar@intel.com>
X-ClientProxiedBy: MW4P223CA0024.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::29) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|MN2PR11MB4646:EE_
X-MS-Office365-Filtering-Correlation-Id: 52af9efc-c0fe-4fff-b15f-08dd0044f5a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?AAin5OLrJI8szIzxh4jh6kFD1qfaqt4STrxkxZkFs41B85I8I3FDBy2y2z?=
 =?iso-8859-1?Q?oS64xNXVu0ei+p3BGgQstwtE70AP+ZrwhRXp1HxkQG2vz6ZQbT85znIvB+?=
 =?iso-8859-1?Q?XOGRpn+NifTXn73Sa1AZsYzE9ZXFbMqvrcO9dOAht7VctAYXQYoA/SzsW9?=
 =?iso-8859-1?Q?wm5o028BxeQWcCz8DoeyUBo8Oj3+cQJ1AsMJEVlN81rvEqhVtS/MWeQ+sL?=
 =?iso-8859-1?Q?gI74M1MvlqgrM0VSnFRdik0caSw+Leu07OgpDA8k/wQC4Mb+hx9tgEzV5l?=
 =?iso-8859-1?Q?ulhDiion8UA70SlhKGL9KbHNXP6AYB/qYcc0Rg6Xx1gp9kGlIi6zrByZid?=
 =?iso-8859-1?Q?MO+F1rBHiTBoCSkLsoJNXhuGDC7D92xnprapVbBjEow3FJy5+ogbJgRqtC?=
 =?iso-8859-1?Q?hhjEvQ1la0vWA780rUduRVjQXg9i1iuuErFBksFy/hLSf3JFSTVSxI4o66?=
 =?iso-8859-1?Q?g+3Fj9r85qxRr8ONHfXjTx0NkHMe4+KMzdLsFIkUZe9HbUnJWKiLw1dwFb?=
 =?iso-8859-1?Q?cTLlb3PAcSwlOh2LbsxzASDjUzdB28fQSp7VZESRBAiL2ddH60ep/3O8U0?=
 =?iso-8859-1?Q?3ZojQGTigVrnQ4cqf0O2QBbC6ePvUWWDnlxV2FRJNOYOVRX4OjjDd9GWPJ?=
 =?iso-8859-1?Q?cge2YkQZpQvVI6V8JBnlvwo/kVEyMwdEg/zvJasqe2nF4eJYelZ6ks8hPA?=
 =?iso-8859-1?Q?49CSsOpQDLXFhTB/pFKFyRv8GoLMh2qi/adXNYJfA26iRWyNwpNo4k4zuS?=
 =?iso-8859-1?Q?DWm81hM2FcwezSiy+e/+hebkWvp6Z2sFdQ1YwMdbTutiLXfydXyjQa1BoL?=
 =?iso-8859-1?Q?JKrfqD0PV4qmAUvVJOdxMWgKPC0/+7zilRxhMYAYCuK5+2Fl9UUH57cFyE?=
 =?iso-8859-1?Q?YKwkDN5EijBfK5qgzvn4KQzutmRjoJV2FxGarub86MHQQ1m3l/1ykbalCS?=
 =?iso-8859-1?Q?O979wUQpasvNEdHgqSujFkGK/J2PVQzcwe86SzstM0C+zC+jRfELKSfLy3?=
 =?iso-8859-1?Q?r6VKUOWUcJin79Pkvi5FqiBe5dFM/Rda6gMaVba76RJnK76Cs9HgAEAzjv?=
 =?iso-8859-1?Q?m63hF8j4fo7j0oPUjguq2/Oj3eQQ5GZ/T6j6O5vTE8qe2exfMxTRzS/5VT?=
 =?iso-8859-1?Q?T5neSJJSPx6Yz58ZhlA1Qtm8ohny8rqw//AMtwunWChKR4KLILB0xOBsdE?=
 =?iso-8859-1?Q?Z0tHD9O11ypQnW0QSpSSrDfc98wdvdDWYaItTSyqcbg5kENi+ITCF3ufSa?=
 =?iso-8859-1?Q?PhZ5lT6+PgRmyBTWtGITFgkiTvqYxU+0pPoi1VDEp/KPri1B4B88jk+kkR?=
 =?iso-8859-1?Q?Pt6v?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?xWc5ujIZ4MOpq/vvu+xHiBlwyfdkmWJgpDPj0dKTlLcca0JdJEIZeC8SbD?=
 =?iso-8859-1?Q?cRsLzYKjB784CdXxUNcPrWwd78711jmjNRbeuY0CgO7UBaE2EJgp/sH+Pg?=
 =?iso-8859-1?Q?DV4cI+SIevKolKpTkKacxEZGJV+P2KH3627fQ7YTz9E1aW5bYq+GLjByRi?=
 =?iso-8859-1?Q?YaZr4Dyz4qBrYaxaodh0JI+IMYjmLZS4vYdMyV3QW391Q6FEJiIkPe9D25?=
 =?iso-8859-1?Q?nwF7xSuJxXOEDQdjEoZfFOlDnp7gBMtfbWAiHgK6b7Me7QiNXSbywlzOPG?=
 =?iso-8859-1?Q?rab7nna8YHLPSrX+QIOhqpipte0oaW/fExQWnd8B30gWE9zVhKoNb3xGkO?=
 =?iso-8859-1?Q?Dd9kczlcjgUb78YSEZAIcjdww3jP555in9+DebubZUgcNOF35Zvg1sZQAo?=
 =?iso-8859-1?Q?Sb8nnCN0yhi67PcDtRo4zYeg/H5pT/sGawcg3U0xuZvhtnyb9hyPaTzEtF?=
 =?iso-8859-1?Q?77JbWVpcrGAjZUaF1a2B8q0erTrJS5ACrW5BvUXMfZjuxxfv/bzA8iO4UD?=
 =?iso-8859-1?Q?OmgN/VHeR/jOL3ViyaH/HB1iJKeBkJbGg6C+eE/CInfMk98OdOFV8cPIu2?=
 =?iso-8859-1?Q?LjlkUwz2+d+SIfqkwzbH+9uqA7+fS+d9tHEeczahWa+iIINhs9XA5q9Tjs?=
 =?iso-8859-1?Q?iVqc4OLlXuePM624UbC5wNdvWtyjzkYwPwPJxoL6ybfdgyGK+dBtFy+9w1?=
 =?iso-8859-1?Q?vJC23Ua7IeWDbVpvRAaY1b6nWQ0158u9DXIlyJ1EFwa1ZNMqKf0LQGVTMI?=
 =?iso-8859-1?Q?0kBfzjuHZvFcnFdBa3M8KNjPHwE6XWfMvv6D0rXr+/le1zvgqpFkJFXGBY?=
 =?iso-8859-1?Q?aEoWPbPz06A/jd3ssEuWTnVRZ+GYVDacLYwUOE79nt0pKC1CWbn9ml9UeC?=
 =?iso-8859-1?Q?vlefGbrjDzq1/swMY8SMrr7gpqqNAiSdNFd/GrsdjBLRWCsgUbaNCLeolM?=
 =?iso-8859-1?Q?zYad+RomsFNnKss9aRYmyVex9ljpiAPT52Tcj9rnb7zxqpbnJnsIxNr8D9?=
 =?iso-8859-1?Q?brrCokhZNhy1OP/Yg8bh1Odxz5/2/KCtkgeu2lT3ZBLDS7ceW4COL8XI0r?=
 =?iso-8859-1?Q?mPl791ESmqFG86s42RgOM0bIyHGiAe4wyOWgl1eqApeTya/W5QLw1jj5l3?=
 =?iso-8859-1?Q?r9c8CMlXu1vNlPjuN8rYHym1zGJGqWlFQTGJ4hsFe6wVTCZ5mmHfGTv4q8?=
 =?iso-8859-1?Q?RAOepnWlsq7Z1MTGEQGghQQdwIQFzlfcsdii9ythB5ChxoPhgJwmlG99Pj?=
 =?iso-8859-1?Q?ET9/1zzzEza7eIM8QPxDus8LK7GcbI579OIqivF2Pmbn2VfN2ReUcz3yIc?=
 =?iso-8859-1?Q?1zQv57RLc+cCfvVfPRQf50nJHIrGkyJZ3IQEjYIvEZSBB0qWb1QUAWU0mz?=
 =?iso-8859-1?Q?GxOe2TWk3gRuiFFxO/28vvwuQIQBHrfhKOBpqBwQ9OIWxlcN4HRw2CsFxg?=
 =?iso-8859-1?Q?OKaF2tD4K2ZEQ0OgI3DaXdD3r2bPut3AgnpucwgIGyv4eP/pmvsOndLDKi?=
 =?iso-8859-1?Q?R/dj8CdMa44XzVLFtbUPVtJkKhqu3nrItuDfB16PtaTZ8H9vpKzzp7i8dA?=
 =?iso-8859-1?Q?zbp5ahnScIwSyIXVFY5IcasqJhA1DcxPVDxN3oAZxyMAYMeDuOKJkTk3tk?=
 =?iso-8859-1?Q?d3RySLAt0xjb/4JM8TEBzTI7bhHyYmthV7id+A3QalYz2BmKQBttRG+g?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 52af9efc-c0fe-4fff-b15f-08dd0044f5a8
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2024 22:30:33.9496 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nAiHlgehrQIAzhHatjmrkCCfc83m6JWanSwJFJH/DF2LizryDMqDhjcxRaSFrNtTR9SxYS4H5TTeWbmepN2y3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4646
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

On Fri, Nov 08, 2024 at 10:15:10AM -0800, Vinay Belgaumkar wrote:
> From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
> 
> Basic PMU enabling patch. Setup the basic framework
> for adding events/timers. This patch was previously
> reviewed here -
> https://patchwork.freedesktop.org/series/119504/
> 
> The pmu base implementation is still from the
> i915 driver.
> 
> v2: Review comments(Rodrigo) and do not init pmu for VFs
> as they don't have access to freq and c6 residency anyways.
> 
> v3: Fix kunit issue, move xe_pmu entry in Makefile (Jani) and
> move drm uapi definitions (Lucas)
> 
> v4: Adapt Lucas's recent PMU fixes for i915

I believe this already deserves

Co-developed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> Co-developed-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile          |   2 +
>  drivers/gpu/drm/xe/xe_device.c       |   6 +
>  drivers/gpu/drm/xe/xe_device_types.h |   4 +
>  drivers/gpu/drm/xe/xe_module.c       |   5 +
>  drivers/gpu/drm/xe/xe_pmu.c          | 577 +++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_pmu.h          |  26 ++
>  drivers/gpu/drm/xe/xe_pmu_types.h    |  70 ++++
>  7 files changed, 690 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_pmu.c
>  create mode 100644 drivers/gpu/drm/xe/xe_pmu.h
>  create mode 100644 drivers/gpu/drm/xe/xe_pmu_types.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index a93e6fcc0ad9..c231ecaf86b8 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -299,6 +299,8 @@ ifeq ($(CONFIG_DEBUG_FS),y)
>  		i915-display/intel_pipe_crc.o
>  endif
>  
> +xe-$(CONFIG_PERF_EVENTS) += xe_pmu.o
> +
>  obj-$(CONFIG_DRM_XE) += xe.o
>  obj-$(CONFIG_DRM_XE_KUNIT_TEST) += tests/
>  
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 0e2dd691bdae..89463cf7cc2c 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -759,6 +759,9 @@ int xe_device_probe(struct xe_device *xe)
>  	for_each_gt(gt, xe, id)
>  		xe_gt_sanitize_freq(gt);
>  
> +	if (!IS_SRIOV_VF(xe))
> +		xe_pmu_register(&xe->pmu);
> +
>  	return devm_add_action_or_reset(xe->drm.dev, xe_device_sanitize, xe);
>  
>  err_fini_display:
> @@ -803,6 +806,9 @@ void xe_device_remove(struct xe_device *xe)
>  
>  	xe_heci_gsc_fini(xe);
>  
> +	if (!IS_SRIOV_VF(xe))
> +		xe_pmu_unregister(&xe->pmu);
> +
>  	for_each_gt(gt, xe, id)
>  		xe_gt_remove(gt);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index bccca63c8a48..0cb8d650135a 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -18,6 +18,7 @@
>  #include "xe_memirq_types.h"
>  #include "xe_oa.h"
>  #include "xe_platform_types.h"
> +#include "xe_pmu.h"
>  #include "xe_pt_types.h"
>  #include "xe_sriov_types.h"
>  #include "xe_step_types.h"
> @@ -509,6 +510,9 @@ struct xe_device {
>  		int mode;
>  	} wedged;
>  
> +	/** @pmu: performance monitoring unit */
> +	struct xe_pmu pmu;
> +
>  #ifdef TEST_VM_OPS_ERROR
>  	/**
>  	 * @vm_inject_error_position: inject errors at different places in VM
> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
> index 77ce9f9ca7a5..1bf2bf8447c0 100644
> --- a/drivers/gpu/drm/xe/xe_module.c
> +++ b/drivers/gpu/drm/xe/xe_module.c
> @@ -14,6 +14,7 @@
>  #include "xe_hw_fence.h"
>  #include "xe_pci.h"
>  #include "xe_pm.h"
> +#include "xe_pmu.h"
>  #include "xe_observation.h"
>  #include "xe_sched_job.h"
>  
> @@ -96,6 +97,10 @@ static const struct init_funcs init_funcs[] = {
>  		.init = xe_sched_job_module_init,
>  		.exit = xe_sched_job_module_exit,
>  	},
> +	{
> +		.init = xe_pmu_init,
> +		.exit = xe_pmu_exit,
> +	},
>  	{
>  		.init = xe_register_pci_driver,
>  		.exit = xe_unregister_pci_driver,
> diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
> new file mode 100644
> index 000000000000..7ce66c022e27
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_pmu.c
> @@ -0,0 +1,577 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#include <drm/drm_drv.h>
> +#include <drm/drm_managed.h>
> +#include <drm/xe_drm.h>
> +
> +#include "regs/xe_gt_regs.h"
> +#include "xe_device.h"
> +#include "xe_force_wake.h"
> +#include "xe_gt_clock.h"
> +#include "xe_mmio.h"
> +#include "xe_macros.h"
> +#include "xe_pm.h"
> +
> +/**
> + * CPU mask is defined/initialized at a module level. All devices
> + * inside this module share this mask.
> + */
> +static cpumask_t xe_pmu_cpumask;
> +static unsigned int xe_pmu_target_cpu = -1;
> +
> +/**
> + * DOC: Xe PMU (Performance Monitoring Unit)
> + *
> + * Expose events/counters like C6 residency and GT frequency to user land.
> + * Perf tool can be used to list these counters from the command line.
> + *
> + * Example commands to list/record supported perf events-
> + *
> + * $ ls -ld /sys/bus/event_source/devices/xe_*
> + * $ ls /sys/bus/event_source/devices/xe_0000_00_02.0/events/
> + *
> + * You can also use the perf tool to grep for a certain event-
> + * $ perf list | grep rc6
> + *
> + * To list a specific event at regular intervals-
> + * $ perf stat -e <event_name> -I <interval>
> + *
> + */
> +
> +static unsigned int config_gt_id(const u64 config)
> +{
> +	return config >> __XE_PMU_GT_SHIFT;
> +}
> +
> +static u64 config_counter(const u64 config)
> +{
> +	return config & ~(~0ULL << __XE_PMU_GT_SHIFT);
> +}
> +
> +static void xe_pmu_event_destroy(struct perf_event *event)
> +{
> +	struct xe_device *xe =
> +		container_of(event->pmu, typeof(*xe), pmu.base);
> +
> +	drm_WARN_ON(&xe->drm, event->parent);
> +
> +	drm_dev_put(&xe->drm);
> +}
> +
> +static int
> +config_status(struct xe_device *xe, u64 config)
> +{
> +	unsigned int gt_id = config_gt_id(config);
> +
> +	if (gt_id >= XE_MAX_GT_PER_TILE)
> +		return -ENOENT;
> +
> +	switch (config_counter(config)) {
> +	default:
> +		return -ENOENT;
> +	}
> +
> +	return 0;
> +}
> +
> +static int xe_pmu_event_init(struct perf_event *event)
> +{
> +	struct xe_device *xe =
> +		container_of(event->pmu, typeof(*xe), pmu.base);
> +	struct xe_pmu *pmu = &xe->pmu;
> +	int ret;
> +
> +	if (!pmu->registered)
> +		return -ENODEV;
> +
> +	if (event->attr.type != event->pmu->type)
> +		return -ENOENT;
> +
> +	/* unsupported modes and filters */
> +	if (event->attr.sample_period) /* no sampling */
> +		return -EINVAL;
> +
> +	if (has_branch_stack(event))
> +		return -EOPNOTSUPP;
> +
> +	if (event->cpu < 0)
> +		return -EINVAL;
> +
> +	/* only allow running on one cpu at a time */
> +	if (!cpumask_test_cpu(event->cpu, &xe_pmu_cpumask))
> +		return -EINVAL;
> +
> +	ret = config_status(xe, event->attr.config);
> +	if (ret)
> +		return ret;
> +
> +	if (!event->parent) {
> +		drm_dev_get(&xe->drm);
> +		event->destroy = xe_pmu_event_destroy;
> +	}
> +
> +	return 0;
> +}
> +
> +static u64 __xe_pmu_event_read(struct perf_event *event)
> +{
> +	struct xe_device *xe =
> +		container_of(event->pmu, typeof(*xe), pmu.base);
> +	const unsigned int gt_id = config_gt_id(event->attr.config);
> +	const u64 config = event->attr.config;
> +	struct xe_gt *gt = xe_device_get_gt(xe, gt_id);
> +	u64 val = 0;
> +
> +	switch (config_counter(config)) {
> +	default:
> +		drm_warn(&gt->tile->xe->drm, "unknown pmu event\n");
> +	}
> +
> +	return val;
> +}
> +
> +static void xe_pmu_event_read(struct perf_event *event)
> +{
> +	struct xe_device *xe =
> +		container_of(event->pmu, typeof(*xe), pmu.base);
> +	struct hw_perf_event *hwc = &event->hw;
> +	struct xe_pmu *pmu = &xe->pmu;
> +	u64 prev, new;
> +
> +	if (!pmu->registered) {
> +		event->hw.state = PERF_HES_STOPPED;
> +		return;
> +	}
> +again:
> +	prev = local64_read(&hwc->prev_count);
> +	new = __xe_pmu_event_read(event);
> +
> +	if (local64_cmpxchg(&hwc->prev_count, prev, new) != prev)
> +		goto again;
> +
> +	local64_add(new - prev, &event->count);
> +}
> +
> +static void xe_pmu_enable(struct perf_event *event)
> +{
> +	/*
> +	 * Store the current counter value so we can report the correct delta
> +	 * for all listeners. Even when the event was already enabled and has
> +	 * an existing non-zero value.
> +	 */
> +	local64_set(&event->hw.prev_count, __xe_pmu_event_read(event));
> +}
> +
> +static void xe_pmu_event_start(struct perf_event *event, int flags)
> +{
> +	struct xe_device *xe =
> +		container_of(event->pmu, typeof(*xe), pmu.base);
> +	struct xe_pmu *pmu = &xe->pmu;
> +
> +	if (!pmu->registered)
> +		return;
> +
> +	xe_pmu_enable(event);
> +	event->hw.state = 0;
> +}
> +
> +static void xe_pmu_event_stop(struct perf_event *event, int flags)
> +{
> +	struct xe_device *xe =
> +		container_of(event->pmu, typeof(*xe), pmu.base);
> +	struct xe_pmu *pmu = &xe->pmu;
> +
> +	if (!pmu->registered)
> +		goto out;
> +
> +	if (flags & PERF_EF_UPDATE)
> +		xe_pmu_event_read(event);
> +
> +out:
> +	event->hw.state = PERF_HES_STOPPED;
> +}
> +
> +static int xe_pmu_event_add(struct perf_event *event, int flags)
> +{
> +	struct xe_device *xe =
> +		container_of(event->pmu, typeof(*xe), pmu.base);
> +	struct xe_pmu *pmu = &xe->pmu;
> +
> +	if (!pmu->registered)
> +		return -ENODEV;
> +
> +	if (flags & PERF_EF_START)
> +		xe_pmu_event_start(event, flags);
> +
> +	return 0;
> +}
> +
> +static void xe_pmu_event_del(struct perf_event *event, int flags)
> +{
> +	xe_pmu_event_stop(event, PERF_EF_UPDATE);
> +}
> +
> +static int xe_pmu_event_event_idx(struct perf_event *event)
> +{
> +	return 0;
> +}
> +
> +struct xe_ext_attribute {
> +	struct device_attribute attr;
> +	unsigned long val;
> +};
> +
> +static ssize_t xe_pmu_event_show(struct device *dev,
> +				 struct device_attribute *attr, char *buf)
> +{
> +	struct xe_ext_attribute *eattr;
> +
> +	eattr = container_of(attr, struct xe_ext_attribute, attr);
> +	return sprintf(buf, "config=0x%lx\n", eattr->val);
> +}
> +
> +static ssize_t cpumask_show(struct device *dev,
> +			    struct device_attribute *attr, char *buf)
> +{
> +	return cpumap_print_to_pagebuf(true, buf, &xe_pmu_cpumask);
> +}
> +
> +static DEVICE_ATTR_RO(cpumask);
> +
> +static struct attribute *xe_cpumask_attrs[] = {
> +	&dev_attr_cpumask.attr,
> +	NULL,
> +};
> +
> +static const struct attribute_group xe_pmu_cpumask_attr_group = {
> +	.attrs = xe_cpumask_attrs,
> +};
> +
> +#define __event(__counter, __name, __unit) \
> +{ \
> +	.counter = (__counter), \
> +	.name = (__name), \
> +	.unit = (__unit), \
> +}
> +
> +static struct xe_ext_attribute *
> +add_xe_attr(struct xe_ext_attribute *attr, const char *name, u64 config)
> +{
> +	sysfs_attr_init(&attr->attr.attr);
> +	attr->attr.attr.name = name;
> +	attr->attr.attr.mode = 0444;
> +	attr->attr.show = xe_pmu_event_show;
> +	attr->val = config;
> +
> +	return ++attr;
> +}
> +
> +static struct perf_pmu_events_attr *
> +add_pmu_attr(struct perf_pmu_events_attr *attr, const char *name,
> +	     const char *str)
> +{
> +	sysfs_attr_init(&attr->attr.attr);
> +	attr->attr.attr.name = name;
> +	attr->attr.attr.mode = 0444;
> +	attr->attr.show = perf_event_sysfs_show;
> +	attr->event_str = str;
> +
> +	return ++attr;
> +}
> +
> +static struct attribute **
> +create_event_attributes(struct xe_pmu *pmu)
> +{
> +	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
> +	static const struct {
> +		unsigned int counter;
> +		const char *name;
> +		const char *unit;
> +	} events[] = {
> +	};
> +
> +	struct perf_pmu_events_attr *pmu_attr = NULL, *pmu_iter;
> +	struct xe_ext_attribute *xe_attr = NULL, *xe_iter;
> +	struct attribute **attr = NULL, **attr_iter;
> +	unsigned int count = 0;
> +	unsigned int i, j;
> +	struct xe_gt *gt;
> +
> +	/* Count how many counters we will be exposing. */
> +	for_each_gt(gt, xe, j) {
> +		for (i = 0; i < ARRAY_SIZE(events); i++) {
> +			u64 config = ___XE_PMU_OTHER(j, events[i].counter);
> +
> +			if (!config_status(xe, config))
> +				count++;
> +		}
> +	}
> +
> +	/* Allocate attribute objects and table. */
> +	xe_attr = kcalloc(count, sizeof(*xe_attr), GFP_KERNEL);
> +	if (!xe_attr)
> +		goto err_alloc;
> +
> +	pmu_attr = kcalloc(count, sizeof(*pmu_attr), GFP_KERNEL);
> +	if (!pmu_attr)
> +		goto err_alloc;
> +
> +	/* Max one pointer of each attribute type plus a termination entry. */
> +	attr = kcalloc(count * 2 + 1, sizeof(*attr), GFP_KERNEL);
> +	if (!attr)
> +		goto err_alloc;
> +
> +	xe_iter = xe_attr;
> +	pmu_iter = pmu_attr;
> +	attr_iter = attr;
> +
> +	for_each_gt(gt, xe, j) {
> +		for (i = 0; i < ARRAY_SIZE(events); i++) {
> +			u64 config = ___XE_PMU_OTHER(j, events[i].counter);
> +			char *str;
> +
> +			if (config_status(xe, config))
> +				continue;
> +
> +			str = kasprintf(GFP_KERNEL, "%s-gt%u",
> +					events[i].name, j);
> +			if (!str)
> +				goto err;
> +
> +			*attr_iter++ = &xe_iter->attr.attr;
> +			xe_iter = add_xe_attr(xe_iter, str, config);
> +
> +			if (events[i].unit) {
> +				str = kasprintf(GFP_KERNEL, "%s-gt%u.unit",
> +						events[i].name, j);
> +				if (!str)
> +					goto err;
> +
> +				*attr_iter++ = &pmu_iter->attr.attr;
> +				pmu_iter = add_pmu_attr(pmu_iter, str,
> +							events[i].unit);
> +			}
> +		}
> +	}
> +
> +	pmu->xe_attr = xe_attr;
> +	pmu->pmu_attr = pmu_attr;
> +
> +	return attr;
> +
> +err:
> +	for (attr_iter = attr; *attr_iter; attr_iter++)
> +		kfree((*attr_iter)->name);
> +
> +err_alloc:
> +	kfree(attr);
> +	kfree(xe_attr);
> +	kfree(pmu_attr);
> +
> +	return NULL;
> +}
> +
> +static void free_event_attributes(struct xe_pmu *pmu)
> +{
> +	struct attribute **attr_iter = pmu->events_attr_group.attrs;
> +
> +	for (; *attr_iter; attr_iter++)
> +		kfree((*attr_iter)->name);
> +
> +	kfree(pmu->events_attr_group.attrs);
> +	kfree(pmu->xe_attr);
> +	kfree(pmu->pmu_attr);
> +
> +	pmu->events_attr_group.attrs = NULL;
> +	pmu->xe_attr = NULL;
> +	pmu->pmu_attr = NULL;
> +}
> +
> +static int xe_pmu_cpu_online(unsigned int cpu, struct hlist_node *node)
> +{
> +	struct xe_pmu *pmu = hlist_entry_safe(node, typeof(*pmu), cpuhp.node);
> +
> +	/* Select the first online CPU as a designated reader. */
> +	if (cpumask_empty(&xe_pmu_cpumask))
> +		cpumask_set_cpu(cpu, &xe_pmu_cpumask);
> +
> +	return 0;
> +}
> +
> +static int xe_pmu_cpu_offline(unsigned int cpu, struct hlist_node *node)
> +{
> +	struct xe_pmu *pmu = hlist_entry_safe(node, typeof(*pmu), cpuhp.node);
> +	unsigned int target = xe_pmu_target_cpu;
> +
> +	/*
> +	 * Unregistering an instance generates a CPU offline event which we must
> +	 * ignore to avoid incorrectly modifying the shared xe_pmu_cpumask.
> +	 */
> +	if (!pmu->registered)
> +		return 0;
> +
> +	if (cpumask_test_and_clear_cpu(cpu, &xe_pmu_cpumask)) {
> +		target = cpumask_any_but(topology_sibling_cpumask(cpu), cpu);
> +
> +		/* Migrate events if there is a valid target */
> +		if (target < nr_cpu_ids) {
> +			cpumask_set_cpu(target, &xe_pmu_cpumask);
> +			xe_pmu_target_cpu = target;
> +		}
> +	}
> +
> +	if (target < nr_cpu_ids && target != pmu->cpuhp.cpu) {
> +		perf_pmu_migrate_context(&pmu->base, cpu, target);
> +		pmu->cpuhp.cpu = target;
> +	}
> +
> +	return 0;
> +}
> +
> +static enum cpuhp_state cpuhp_state = CPUHP_INVALID;
> +
> +/**
> + * xe_pmu_init() - Setup CPU hotplug state/callbacks for Xe PMU
> + *
> + * Returns: 0 if successful, else error code
> + */
> +int xe_pmu_init(void)
> +{
> +	int ret;
> +
> +	ret = cpuhp_setup_state_multi(CPUHP_AP_ONLINE_DYN,
> +				      "perf/x86/intel/xe:online",
> +				      xe_pmu_cpu_online,
> +				      xe_pmu_cpu_offline);
> +	if (ret < 0)
> +		pr_notice("Failed to setup cpuhp state for xe PMU! (%d)\n",
> +			  ret);
> +	else
> +		cpuhp_state = ret;
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_pmu_exit() - Remove CPU hotplug state/callbacks for Xe PMU
> + */
> +void xe_pmu_exit(void)
> +{
> +	if (cpuhp_state != CPUHP_INVALID)
> +		cpuhp_remove_multi_state(cpuhp_state);
> +}
> +
> +static int xe_pmu_register_cpuhp_state(struct xe_pmu *pmu)
> +{
> +	if (cpuhp_state == CPUHP_INVALID)
> +		return -EINVAL;
> +
> +	return cpuhp_state_add_instance(cpuhp_state, &pmu->cpuhp.node);
> +}
> +
> +static void xe_pmu_unregister_cpuhp_state(struct xe_pmu *pmu)
> +{
> +	cpuhp_state_remove_instance(cpuhp_state, &pmu->cpuhp.node);
> +}
> +
> +/**
> + * xe_pmu_unregister() - Remove/cleanup PMU registration
> + */
> +void xe_pmu_unregister(void *arg)
> +{
> +	struct xe_pmu *pmu = arg;
> +
> +	if (!pmu->registered)
> +		return;
> +
> +	pmu->registered = false;
> +
> +	xe_pmu_unregister_cpuhp_state(pmu);
> +
> +	perf_pmu_unregister(&pmu->base);
> +	kfree(pmu->base.attr_groups);
> +	kfree(pmu->name);
> +	free_event_attributes(pmu);
> +}
> +
> +/**
> + * xe_pmu_register() - Define basic PMU properties for Xe and add event callbacks.
> + *
> + */
> +void xe_pmu_register(struct xe_pmu *pmu)
> +{
> +	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
> +	const struct attribute_group *attr_groups[] = {
> +		&pmu->events_attr_group,
> +		&xe_pmu_cpumask_attr_group,
> +		NULL
> +	};
> +
> +	int ret = -ENOMEM;
> +
> +	spin_lock_init(&pmu->lock);
> +	pmu->cpuhp.cpu = -1;
> +
> +	pmu->name = kasprintf(GFP_KERNEL,
> +			      "xe_%s",
> +			      dev_name(xe->drm.dev));
> +	if (pmu->name) {
> +		/* tools/perf reserves colons as special. */
> +		strreplace((char *)pmu->name, ':', '_');
> +	}
> +
> +	if (!pmu->name)
> +		goto err;
> +
> +	pmu->events_attr_group.name = "events";
> +	pmu->events_attr_group.attrs = create_event_attributes(pmu);
> +	if (!pmu->events_attr_group.attrs)
> +		goto err_name;
> +
> +	pmu->base.attr_groups = kmemdup(attr_groups, sizeof(attr_groups),
> +					GFP_KERNEL);
> +	if (!pmu->base.attr_groups)
> +		goto err_attr;
> +
> +	pmu->base.module	= THIS_MODULE;
> +	pmu->base.task_ctx_nr	= perf_invalid_context;
> +	pmu->base.event_init	= xe_pmu_event_init;
> +	pmu->base.add		= xe_pmu_event_add;
> +	pmu->base.del		= xe_pmu_event_del;
> +	pmu->base.start		= xe_pmu_event_start;
> +	pmu->base.stop		= xe_pmu_event_stop;
> +	pmu->base.read		= xe_pmu_event_read;
> +	pmu->base.event_idx	= xe_pmu_event_event_idx;
> +
> +	ret = perf_pmu_register(&pmu->base, pmu->name, -1);
> +	if (ret)
> +		goto err_groups;
> +
> +	ret = xe_pmu_register_cpuhp_state(pmu);
> +	if (ret)
> +		goto err_unreg;
> +
> +	ret = devm_add_action_or_reset(xe->drm.dev, xe_pmu_unregister, pmu);
> +	if (ret)
> +		goto err_cpuhp;
> +
> +	pmu->registered = true;
> +
> +	return;
> +
> +err_cpuhp:
> +	xe_pmu_unregister_cpuhp_state(pmu);
> +err_unreg:
> +	perf_pmu_unregister(&pmu->base);
> +err_groups:
> +	kfree(pmu->base.attr_groups);
> +err_attr:
> +	free_event_attributes(pmu);
> +err_name:
> +	kfree(pmu->name);
> +err:
> +	drm_notice(&xe->drm, "Failed to register PMU!\n");
> +}
> diff --git a/drivers/gpu/drm/xe/xe_pmu.h b/drivers/gpu/drm/xe/xe_pmu.h
> new file mode 100644
> index 000000000000..d07e5dfdfec0
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_pmu.h
> @@ -0,0 +1,26 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#ifndef _XE_PMU_H_
> +#define _XE_PMU_H_
> +
> +#include "xe_pmu_types.h"
> +
> +struct xe_gt;
> +
> +#if IS_ENABLED(CONFIG_PERF_EVENTS)
> +int xe_pmu_init(void);
> +void xe_pmu_exit(void);
> +void xe_pmu_register(struct xe_pmu *pmu);
> +void xe_pmu_unregister(void *arg);
> +#else
> +static inline int xe_pmu_init(void) { return 0; }
> +static inline void xe_pmu_exit(void) {}
> +static inline void xe_pmu_register(struct xe_pmu *pmu) {}
> +static inline void xe_pmu_unregister(void *arg) {}
> +#endif
> +
> +#endif
> +
> diff --git a/drivers/gpu/drm/xe/xe_pmu_types.h b/drivers/gpu/drm/xe/xe_pmu_types.h
> new file mode 100644
> index 000000000000..4da96b8fadd1
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_pmu_types.h
> @@ -0,0 +1,70 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#ifndef _XE_PMU_TYPES_H_
> +#define _XE_PMU_TYPES_H_
> +
> +#include <linux/perf_event.h>
> +#include <linux/spinlock_types.h>
> +
> +enum {
> +	__XE_NUM_PMU_SAMPLERS
> +};
> +
> +#define XE_PMU_MAX_GT 2
> +
> +/*
> + * Top bits of every counter are GT id.
> + */
> +#define __XE_PMU_GT_SHIFT (56)
> +
> +#define ___XE_PMU_OTHER(gt, x) \
> +	(((__u64)(x)) | ((__u64)(gt) << __XE_PMU_GT_SHIFT))
> +
> +struct xe_pmu {
> +	/**
> +	 * @cpuhp: Struct used for CPU hotplug handling.
> +	 */
> +	struct {
> +		struct hlist_node node;
> +		unsigned int cpu;
> +	} cpuhp;
> +	/**
> +	 * @base: PMU base.
> +	 */
> +	struct pmu base;
> +	/**
> +	 * @registered: PMU is registered and not in the unregistering process.
> +	 */
> +	bool registered;
> +	/**
> +	 * @name: Name as registered with perf core.
> +	 */
> +	const char *name;
> +	/**
> +	 * @lock: Lock protecting enable mask and ref count handling.
> +	 */
> +	spinlock_t lock;
> +	/**
> +	 * @sample: Current and previous (raw) counters.
> +	 *
> +	 * These counters are updated when the device is awake.
> +	 */
> +	u64 sample[XE_PMU_MAX_GT][__XE_NUM_PMU_SAMPLERS];
> +	/**
> +	 * @events_attr_group: Device events attribute group.
> +	 */
> +	struct attribute_group events_attr_group;
> +	/**
> +	 * @xe_attr: Memory block holding device attributes.
> +	 */
> +	void *xe_attr;
> +	/**
> +	 * @pmu_attr: Memory block holding device attributes.
> +	 */
> +	void *pmu_attr;
> +};
> +
> +#endif
> -- 
> 2.38.1
> 
