Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2791CECE579
	for <intel-xe@archiver.kernel.org>; Mon,  9 Sep 2024 12:15:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C675A10E4FD;
	Mon,  9 Sep 2024 12:15:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EX3LhNJg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEFF810E45C
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Sep 2024 12:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725884144; x=1757420144;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ScoK7rP1p/RKcXr2LR4Tc8XDxTi7ADOL7sZmoyV34To=;
 b=EX3LhNJguktQhMCR9XaYu+zNQN37fwZzAKC4IyBPlksoIrPNNb3LZIGt
 VDSgDJ7y9UGlw6AzUAsRE9pHhARRUAJbs8QIggMhf6q2YiO8g8Za8XUjj
 qFRUvwhXUDg7fVvhCFC5BmR9Wi3mIAUXwrLYgQNUlLxRv3QF5Cy3bVsFa
 DLxdvqhpPXY8JCyBlB08YV8dP1QymwrPRWpyLz/XTZtxzb3rqfjchQgou
 d7HufMOjdyqdkKgL6zHZmeTo7xfPlg2dx/a1bQZwV9hn1Z98/yyPrfEmr
 0OJW2jB4ORTWXCNEso3Fa4n7k3tWOuKT9GR1tBBkGMj3z2VBmb/ZmDbdL A==;
X-CSE-ConnectionGUID: 01bBq5+BTkGEzZUrCXYY/g==
X-CSE-MsgGUID: af68+3KZQ6aM+4bRDGkCXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11189"; a="24769924"
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; d="scan'208";a="24769924"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2024 05:15:42 -0700
X-CSE-ConnectionGUID: 5x6fPveaRKeP98wUeDIz1Q==
X-CSE-MsgGUID: YGz/xcRZR7OqqXmfNzANzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; d="scan'208";a="71611350"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Sep 2024 05:15:42 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 9 Sep 2024 05:15:41 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 9 Sep 2024 05:15:41 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 9 Sep 2024 05:15:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qxwstT2Fb6JE5WZG6S8yExUWy2365qCMs2Gc9rT7/vuiDDC41hJ7LrukEzdcoOYiJRyoXKAJj6oGvKhOHIWhMakgOPJzX/I8v8+lEZGM2UPCcJ3tyYFAVZTE7znbpkzoWUV0iL+07EFcM3nPNY3IRfdGS8roGHEe/lRHsx1vWd1HEao/TIN9rx96dUaTsnFzIDXic86zWl+A++2Ip/OVkdTU4ZFzU9IhwI2nTsfXrbZ0aDTzAp3p9eFDQ+vG0xneOwZvmKUwtUh8fjlIFje2U+bORF3QBnhul1rhQkT/F+UqKLyJit7VPDd6W1mZxAra9j6Wa6pbvMIDP1dlOuUB1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NmdDcCflOGc50VQrf7s0w+SlO8L4jGNCJ7GYOPRm3hE=;
 b=fqUgJbVF3i0X0MOuYCzdk5XtpRv2JKKuWuunz1cpjEejiS7Y5vCJq+WwuP2OB23kOfB7/8fGg7wi2QbQmJ5DqaDG8OIoOAsaJQbPfLhjd4xU2yJVMj49aNid2pIAmzJjf+ktbJSq5lyiWX63EyWSl4MSdMBTAn2gvbpcrVjCFfy4PutzttI+GAV1NSU3Gz91lBEc7fx9Ma8tStAoEGlG/CE7S5HLB/RRfWdPFqTmCS8rmLGnKujro7LAe4jA4aKPwN8lwAx/CnMfhjKHT7nqBzWpWfpO7J+zn37MH3bfOX1qmQ/EwaMEYdzUXv+51Glv8T1cpmIiMNLR1Ypd+ya/Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by CH3PR11MB7392.namprd11.prod.outlook.com (2603:10b6:610:145::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.31; Mon, 9 Sep
 2024 12:15:37 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%3]) with mapi id 15.20.7918.024; Mon, 9 Sep 2024
 12:15:37 +0000
Date: Mon, 9 Sep 2024 14:15:30 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: Matt Atwood <matthew.s.atwood@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 3/9] drm/xe/xe3: Generate and store the L3 bank mask
Message-ID: <Zt7m4qXwFiPs4GAE@fdugast-desk>
References: <20240906215153.31210-1-matthew.s.atwood@intel.com>
 <20240906215153.31210-4-matthew.s.atwood@intel.com>
 <20240906234315.GY5774@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240906234315.GY5774@mdroper-desk1.amr.corp.intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: WA0P291CA0013.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:1::8)
 To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|CH3PR11MB7392:EE_
X-MS-Office365-Filtering-Correlation-Id: e3437d5e-ef2c-4b23-9320-08dcd0c91ce1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RNkVBwTL2rX6PrFoEZB5rnrr+efQdCE9k7cALvYmyfCZEiZCfioFENaZcV95?=
 =?us-ascii?Q?m92Lm5Oz5aXLSKe2zB092KYNYwhoGOznDWgk3U/n5Wc/1+RJT6qU4ORa33DD?=
 =?us-ascii?Q?vEzVeGD9APKPUBQmyVIKAUkwucHZKrlLGdKSFH8jEAodGv1pjYOLNTPp7fu5?=
 =?us-ascii?Q?98brZKbPXz7QPZfk5ackXW97kBSoBUnZR6ljOt5YBMKH/PqTWEUdt4AfvatV?=
 =?us-ascii?Q?ViG599u0HHSv9rDGkssF6dyAftiVYKLFZLidU+aip3oj6wQC2aPVF+zOa+20?=
 =?us-ascii?Q?+7zPNWbtjDD94mw+1E1gNqjHp6HGN4GMM/nUtng/dYDw7ZKAJ5naHwcaan8s?=
 =?us-ascii?Q?HifwheLXyTp8pL3jKmT9fE1tBlWo3Aep2e/f2xqRvwkcdwU72wvR6NGQw95L?=
 =?us-ascii?Q?k1ePazH4DW2QDjTGubE0Ai0+kcvTAoFB43xyzKkowWb//osJLvLwZL2aKLrl?=
 =?us-ascii?Q?H7c5tMxhf0VJ3kWFkfJUIGzO+kPWXIgfH2Kd7YC8qEH5i7fbhL8v1QVG8a2g?=
 =?us-ascii?Q?3HmfJGclOqYA0u8D/kVQ75JmriB4zmwOrhWjc+b1JSww0xP6fTfT4r/QL9EV?=
 =?us-ascii?Q?932SjWg2oMPqA7sQ54FpYhidl4s2Lwj+MSbmO/yz56Eeit9q+cDVlSAheDOa?=
 =?us-ascii?Q?0cbrhw/45FjVsrsBV9Acyf8L6SaBWmFn9HfQ1aYMsVrA54jLM3FlSRYtIN4c?=
 =?us-ascii?Q?4mfr6VQBs2KT29VVxgpCOttpTkQS3I4zznFDcgW8f9NPB/Pkb0io6lPnuF2l?=
 =?us-ascii?Q?mq8qglQQtDd5kxCh54FGywhX2zgwziu0ynL8aaTfrO72I7nAl0CmRGVEmaxC?=
 =?us-ascii?Q?dk2LTdyfDv+BxQYWm1fqeRPq6JuIN5xEgwoAka0G/DsNff0rrod2pvXJmW7b?=
 =?us-ascii?Q?T/YckiEuVPu5ik1qOjsUbSkulYSlgrdMdsXzGyNea7Yo6QVvUVkpUwlQ5KFN?=
 =?us-ascii?Q?mPzVBMeF/I8TdLXR9VH4qpIJcp6JIMvapjjnIP72hT631cd7OI3Ul0CcQzzP?=
 =?us-ascii?Q?oHnOrEJgKXSmz326/K9p701j6YigtMOe+5sOrH0MSvWhAhlhsw+y682Ri/jF?=
 =?us-ascii?Q?gKUxrxPL/2OZtPFrXzTIbQ+G4IBe/5LM4UyTl3fPgaNgum3DgrSmrBlpdx7K?=
 =?us-ascii?Q?V3fngwnrrX2AGCz5DhQ0bAxKbUNVqG0fgeWtaCrFz7WPDkxTRFOOVueIs1Jg?=
 =?us-ascii?Q?AWJLji6+7X4IOsbuvt1pEiofA7hLoun7c4Ul8/M3GDD5CziP70GKSXG8G8Nk?=
 =?us-ascii?Q?0taWgEyhrb4v06zYkQR7qxmN17mvUSliDiyDa64ApUNrTDPaHCjkNNwpcWUm?=
 =?us-ascii?Q?UqLGPM0nkEg4SKM/726Qswe3GVfJATmvK661dx0TeNlkKw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?J43F3Qnkm3c+CLgcIibhuHQN2EtyhZDCEV1VOM/kkIRpMvt/iKEjh9DvMUSg?=
 =?us-ascii?Q?CqowgW8X9b3aDX9KGJAg3GV2FGs0HOHwKHUwxtgMbcLIK7hl9WsDLvfamsaj?=
 =?us-ascii?Q?mIOsgLuAeWi+7iHYBKRx7QJTO1mfH9zehSP7Sg0L2lLYDW1YENDWpfu9enVN?=
 =?us-ascii?Q?60ltH2f3jmKTPyxdMMO92ESaIQJJF/ph40YXms5n0PAjan4QwpIrbeVlhQzK?=
 =?us-ascii?Q?t2DotyM02k+ZkgAZYTdI74eNxWVxnjfTgq1O1IE8V1QTwZ6ejctBnKVFXzPx?=
 =?us-ascii?Q?5f1vgpUFlLFN3Z581eHgJLQmcjxpm0TH0xSwpg4TAEOWVp5if6ddJqzGfvwn?=
 =?us-ascii?Q?dEXFLpEsvEnZjAKHk804grSBYqUcHcuiZegSqBzBzj8b/1zLdvlj6ehmJkVU?=
 =?us-ascii?Q?f3w3OjPywaoG3rWc4L0zUqiXQR5Kr9VsAtKM3W7CftYyiZyeVvLLyfsDrkBe?=
 =?us-ascii?Q?B3WcJrCj/jqAHrjIdbTrXymAdKxdxK6cg3pw3bZ68M3vQnMjAeLvfkgJnzlX?=
 =?us-ascii?Q?cJn+R43ZNhNVb/+4a57QsbZof92zKt+3DqYMp6bbKkOmeJNZGTV2oEc9p4AS?=
 =?us-ascii?Q?5wtn1efzPM/pkjw3Rhhjqne8Oc1MLbbVU9GYgqC1dWdA+eY+gbxLawGPl4VY?=
 =?us-ascii?Q?tDdipfonER+7UazsuJOsoFMHNJr6o2P3YIdlhD2YoQIphcPx/jj/PTqGO4VH?=
 =?us-ascii?Q?4eyqQMn0NJ3VrKskA3mwst+mgo6YAFYknWfUjoEbg+kP9C5qfvzgEySFcxbt?=
 =?us-ascii?Q?mtSylzHLTcQ6QccuGqunGMcn/hM7XDa5QoDnSGE8ejcfLAa+u0pka1a1YASE?=
 =?us-ascii?Q?kabN6BAaZj4rAtSQMvB5DrpfJ+Dj400pUZDXLILvfPN2YME+3MV9YqvX8qgh?=
 =?us-ascii?Q?Wv+bO9Zlv+gbQW+QjVFYAPv/arjJGr2eUYAjQdqFqcK0bK+ia+1lr4VvMBFI?=
 =?us-ascii?Q?Od+hnpzD6I+c5uv/k5FYzMZ4sJX9FAN/Euu9Zd5ayYRRCkqV9AAe4xCgLIaL?=
 =?us-ascii?Q?2/NT2Xanf3NLsc5P4SzYg6fBG/WLWfmbsSvT9mVI2Lkp9eb6oD0Vg1KGiOZN?=
 =?us-ascii?Q?/y3iTwjvOi3KlwH3vZkS9ikeHbKlIzDedP2449Dx6uGSMBZxLzY48yHyR/Vh?=
 =?us-ascii?Q?rMdko4AM8+IlU+/zNV2CUfngXFXvNEGnqBNhuEhTQNETRc+c6P/QIy2GtS+o?=
 =?us-ascii?Q?MF+MpVhe7JQBIXSriC7nYMv5mWL2/APBrLhP1zkG/xiVpj7KmusM+GSqcOBX?=
 =?us-ascii?Q?yDBVv10PllkrajBTX9DgMBSM1mJTzzhOGV/P4WRHwOBO8HZBeAAcxyGN4cNz?=
 =?us-ascii?Q?0anAD1fzsx34GECnrn15nwsgLPMO043EGwt5RlCr8DKXHmYdJZu0PtTVd0Zn?=
 =?us-ascii?Q?kx2Esg6MekdglJTRK7W6kaoOJ+U/p6gfUurmnX5rm9xV4gLGQ35ANRm6uYFH?=
 =?us-ascii?Q?q6RfBrkqlvHRsPQw9KaE6IGcEVoMjTaSXze2HJ6Jbnrv0iwG3lZbM0vyyGgf?=
 =?us-ascii?Q?woAOD/uuPX/04sQ4kGoWE0a+zsDPQ2d56Ks0LqFlEBr5y6CtIDeBi0XnPBbL?=
 =?us-ascii?Q?TdASxwszJbM6CGuNH/hbB5BY//p0/i3hrEgAQ+8kFKgYEeD8Moa8yACKzCFF?=
 =?us-ascii?Q?kw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e3437d5e-ef2c-4b23-9320-08dcd0c91ce1
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2024 12:15:37.2515 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0ungFLAMYrkowcnDi9/TvFNJgjWBlCRMslZsEurLBw9jqa+XiSKpzw5WLrOvUIyW7VAD8YzfR3C2UzNtST1q8IVrU1/nyQoSHBVxewLM5WQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7392
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

On Fri, Sep 06, 2024 at 04:43:15PM -0700, Matt Roper wrote:
> On Fri, Sep 06, 2024 at 02:51:47PM -0700, Matt Atwood wrote:
> > From: Francois Dugast <francois.dugast@intel.com>
> > 
> > On Xe3, the register used to indicate which L3 banks are enabled on
> > the system is a new one called MIRROR_L3BANK_ENABLE. Each bit
> > represents one bank enabled in each node.
> > Extend the existing topology code for Xe3 to read this register and
> > generate the correct L3 bank mask, which can be read by user space
> > throug the topology query.
> > 
> > Bspec: 72573, 73439
> > 
> > Cc: Matt Roper <matthew.d.roper@intel.com>
> > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
> > ---
> >  drivers/gpu/drm/xe/regs/xe_gt_regs.h |  3 +++
> >  drivers/gpu/drm/xe/xe_gt_topology.c  | 11 ++++++++++-
> >  2 files changed, 13 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > index 0d1a4a9f4e11..8ed855b31e95 100644
> > --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > @@ -218,6 +218,9 @@
> >  
> >  #define MIRROR_FUSE1				XE_REG(0x911c)
> >  
> > +#define MIRROR_L3BANK_ENABLE			XE_REG(0x9130)
> > +#define   XE3_L3BANK_ENABLE			REG_GENMASK(31, 0)
> > +
> >  #define XELP_EU_ENABLE				XE_REG(0x9134)	/* "_DISABLE" on Xe_LP */
> >  #define   XELP_EU_MASK				REG_GENMASK(7, 0)
> >  #define XELP_GT_SLICE_ENABLE			XE_REG(0x9138)
> > diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
> > index 0662f71c6ede..56571380a2b5 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_topology.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_topology.c
> > @@ -129,7 +129,16 @@ load_l3_bank_mask(struct xe_gt *gt, xe_l3_bank_mask_t l3_bank_mask)
> >  	struct xe_device *xe = gt_to_xe(gt);
> >  	u32 fuse3 = xe_mmio_read32(gt, MIRROR_FUSE3);
> >  
> > -	if (GRAPHICS_VER(xe) >= 20) {
> > +	if (GRAPHICS_VER(xe) >= 30) {
> > +		xe_l3_bank_mask_t per_node = {};
> > +		u32 meml3_en = REG_FIELD_GET(XE2_NODE_ENABLE_MASK, fuse3);
> 
> This is a 16-bit mask...
> 
> > +		u32 mirror_l3bank_enable = xe_mmio_read32(gt, MIRROR_L3BANK_ENABLE);
> > +		u32 bank_val = REG_FIELD_GET(XE3_L3BANK_ENABLE, mirror_l3bank_enable);
> 
> ...and this is a 32-bit mask...
> 
> > +
> > +		bitmap_from_arr32(per_node, &bank_val, 32);
> > +		gen_l3_mask_from_pattern(xe, l3_bank_mask, per_node, 32,
> > +					 meml3_en);
> 
> ...so when we combine them the resulting mask could potentially be up to
> 16 * 32 = 512 bits.  Even if Xe3 platforms don't really have so many
> banks to use all of those bits, we could still read such values from the
> registers (e.g., if a PCI link glitch or other temporary issue causes
> the fuse registers to read out as 0xFFFFFFFF).  Since
> XE_MAX_L3_BANK_MASK_BITS is currently just 64, we can potentially run
> past the bounds of the allocated memory for the bitmask and probably
> cause a kernel panic.  So I think we need to extend that define to 512
> bits to cover all possible values, even if we don't expect to ever see
> them on a properly functioning system.

This would make the query response unnecessarily large and maybe misleading
if we know already we do not need this size.

I believe the scenario you described is currently not possible. This line
in gen_l3_mask_from_pattern() would warn if the mask would go beyond
XE_MAX_L3_BANK_MASK_BITS:

    xe_assert(xe, !mask || patternbits * (__fls(mask) + 1) <= XE_MAX_L3_BANK_MASK_BITS);

Even with the test in xe_assert() compiled out, we should be fine as long
as the last argument passed to the linux/bitmap.h functions bitmap_*() is
XE_MAX_L3_BANK_MASK_BITS, which is the case in gen_l3_mask_from_pattern().

Francois

> 
> 
> Matt
> 
> > +	} else if (GRAPHICS_VER(xe) >= 20) {
> >  		xe_l3_bank_mask_t per_node = {};
> >  		u32 meml3_en = REG_FIELD_GET(XE2_NODE_ENABLE_MASK, fuse3);
> >  		u32 bank_val = REG_FIELD_GET(XE2_GT_L3_MODE_MASK, fuse3);
> > -- 
> > 2.44.0
> > 
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
