Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01DF9C369DC
	for <intel-xe@archiver.kernel.org>; Tue, 29 Apr 2025 21:40:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A990810E2EC;
	Tue, 29 Apr 2025 21:40:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="INNxaFC1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FF7B10E21F
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Apr 2025 21:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745962824; x=1777498824;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=v5eu/WQBOpieqhmu5T2TbRoL33nY4Nl+cbGaASZr4SY=;
 b=INNxaFC1cuGDRiqdE/2br6zCLuZ0gTU6Q4cRTpcwtr7WjwIScwcK+CsX
 gpwEiPc2cQ4TIWkQHF43T/esuvEedpBhiRfAjbHp/N/M1ag4vEHhBNdkU
 lejuF8kInNxFtz6+J2xKrjwO/G6UCPHZil9eHf8JG7GsMHysZaVH/xpla
 an21c0PiW6CrbTQuweqd9P0ilJtPqL2iSR59dmbMZ8jWTpqsP/YWCMo1N
 QTKssZJZQfteAQ+q6afGMK1ykz3bW/oTxQPmYBSpT13BGoI0BTnRV6DJc
 SDefRciaqawrfNSMhBOa+oLNe6bzloQBt5JsGpqgcbCJkqYAxsX4zpSWl A==;
X-CSE-ConnectionGUID: 4te4Hq5GRQirb4lrfRcVhw==
X-CSE-MsgGUID: +aTmQjuwQOSUQGzNnPfOsQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="35217085"
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; d="scan'208";a="35217085"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 14:40:22 -0700
X-CSE-ConnectionGUID: SaTpHGkvT5u2acrCaaBi5g==
X-CSE-MsgGUID: eU9wq9RrTnWOMshQcf1b6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; d="scan'208";a="138914852"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 14:40:22 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 29 Apr 2025 14:40:20 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 29 Apr 2025 14:40:20 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 29 Apr 2025 14:40:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CDtyEiQHo1E0Rc29RSSzLHoBFmjZEsjp0de6kecKKjQAc5mW47JDoDOE+RUvloUlNbz2n9Omr0D3/zVP3eJNva3Ao9aNjuYoaH4jNPBAxOR/nPoWEfyRIwVBPPfN7ieIPpOwFR7E0rHANYzXAO5Opz27uC0DIPpy3SZew3PuNzqGxUq8qxiIz8U734/OR7Swfoix3LwlAMHhEqIS4cbkNU11aFHjBp+aT9K3+cwaUzGjgIL7aHcWYhMhgVipGmZatnmEkj2GQyEjH67MVk1zYxXU64gKeVGW8F5b1eB+h+DPEeZu3p8ulaRObn7o5yOpxbcffl6YQt34YJMKLR11wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+YO3uD6Ugeez5UxLgY8iunAnhamRqwyW5BjM+amBWWU=;
 b=ZkAQuYn6DBWQ80DTVj8HkKeOvjUaZkFOCggpwKlwNwMPzY/syD/GAef2Nq576c9YX3rPyPsnu5s1Ay/Lk3kQ1mk8W0foiMVSUYM9vytkToi/evjnG9xxFT6Epn6D54afmvUwuBU59d+EY8uulG4zRev9N1bHTMcNK6YjCUtgNwfsANpkw2912tNaEczG0KLTxteptF/jECe0+kuwVfa/7BtLRVPmDWTDmVAlKIhGlGgOsNXpnEOHsZaLkr9GbZAw+nYVI+btweNitOBju4MY4mnO4682O51dxpWRGm7w4VfXPp9jyZAXxwlqMy56KZAc+6f2k05vbA5SUD1Vyhffvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA2PR11MB4905.namprd11.prod.outlook.com (2603:10b6:806:117::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.34; Tue, 29 Apr
 2025 21:39:36 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8678.027; Tue, 29 Apr 2025
 21:39:36 +0000
Date: Tue, 29 Apr 2025 16:39:33 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matt Roper <matthew.d.roper@intel.com>, 
 Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH] drm/xe: Add WA BB to capture active context utilization
Message-ID: <5j337myfuaurqwhfswcv52vx652lqws4rqg7gpnydkk3hdif45@mgv2ptjocqx5>
References: <20250425191039.1551559-1-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250425191039.1551559-1-umesh.nerlige.ramappa@intel.com>
X-ClientProxiedBy: MW4PR04CA0160.namprd04.prod.outlook.com
 (2603:10b6:303:85::15) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA2PR11MB4905:EE_
X-MS-Office365-Filtering-Correlation-Id: d6ffb3db-a703-4953-a252-08dd8766563a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RANkxCjUSS1XI+z7V+7US52uet00IND7NUqN4JERh/3moNJfLDtv7CUJ6ytG?=
 =?us-ascii?Q?OdhKtdObri6/EKvAfpAwHDmewKu1uSeJL2OTfKBHSIVYPrqNWjwO7LVyw+wJ?=
 =?us-ascii?Q?8UWQDVCFOZtwCxjj4xFIUEIgvd/t8pIf12OA+cXX5MYwLwx0KNrbR/1B4aC2?=
 =?us-ascii?Q?SgqWbIORbN+UUbN/N+qq/KWMvzRuI/e4q65S7nShUH/xvQBYHtrSUDpAwHIN?=
 =?us-ascii?Q?JPnCOofir+qtwop/EyPpJER1HvhXlQ3ah9dwh0PyhPwOLOIzhqtbtC6PA/8u?=
 =?us-ascii?Q?DuQgcPeNiAOpfHbagbQ7N4Ha4KfJtJBeDT7Jar/6hn9n540dv7eccp96k1Kj?=
 =?us-ascii?Q?hsfD9AA0Fv/gOhVc29fFqApF9AT8u2Qx/aLdIM3XUExC/CQ4tUAX38KZR3ag?=
 =?us-ascii?Q?jCmBuzyBQ+4e1xmiDcZg4rqf9pNOnK03WBaTSDHHUoMzzGyDlKEhq9Lm3en+?=
 =?us-ascii?Q?tDpzZokarrlDf9EAtiM+J0etWc2J3sCTixjmkHAo7wnHbYDWroXt6KmJUBuM?=
 =?us-ascii?Q?B8MGoohIRqkxxXtT9o1fCjvMC3rt6zwQwH8mBGm6ty50Z87vep6S+mhnIA67?=
 =?us-ascii?Q?qFffEcu7ttf7muhPYKdmUCpGD0VO1jZgwM3N5lYhM9CEMEXoraJmiVkO/B/5?=
 =?us-ascii?Q?Z3NF3BvIWacFDwCjETdhxK7CoGBC1P3DILn3Flxhi6P8eKIR1499PGMOFc6Z?=
 =?us-ascii?Q?KiKl5x02/vc08bXY5DMzGP0bQL1/2rWCV+Gd30ks74iRzm+mxdtycqoyyegB?=
 =?us-ascii?Q?3XENFZbXbVPAcQUQ1d5GOsuEkrTQiNBLqAJAzXEkIZCKEuNwQmMztJF7RbHn?=
 =?us-ascii?Q?tJOm8yoQ1c8jgna+PikLlMBVQCOnTdxYizBo1E1PxASQa0+iHyKww6E2u0Ga?=
 =?us-ascii?Q?oTd/j9dNvV530PJj1ynI2/XJGfdLGpBnohUBpwLpBqClgZD4XHRGiN3nK78s?=
 =?us-ascii?Q?IdaHbEltySzFoF3T3wFWsdgSVBX9QHqR5VRFeM6gDrk9fxvbVer2Ibb8q2RU?=
 =?us-ascii?Q?BhVKc12NX9sVsMKsZmEw6zz4VVZzaIXHxDn5tZGI6H6NEFUa3yAMlaaPuDYt?=
 =?us-ascii?Q?tEe96sIkC3xFNgpDUCtRJLDRqbG8UyNRcLaCWuFZToK5CfZk0YRfwiqAHmrn?=
 =?us-ascii?Q?hWIZCvI+u1qGBLUQhS97RCzcpyyMk5YiTLiJikun3rOxuOVznAsqhc6wgXbC?=
 =?us-ascii?Q?b+f7+p/99Ag2kZe3aIBEHIqfM91Vb02dFM734iFkz5E4u23NjonYIRThSLyj?=
 =?us-ascii?Q?lR0VjMfjXxrqA4dwbWzfqfmSsAbJ2F8padQ2//rawbiG2zfeTDhUDyFC5TxC?=
 =?us-ascii?Q?A4zG+fJR0rFn0CpQ6u2dhfFCzxksfpbTAVMRoFaILOn1GNcP3wCZQSMA2gsN?=
 =?us-ascii?Q?yVWzpTGsxWo8xCmEOaeYL3JqHL+SeP+g/VqFU9jdr9xB2cescg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?En3sgn0oMr1pTf/9lwDrIMGcJK6cBsEVfnWhnoR0aoP4AJV9eLsbX3mzaePg?=
 =?us-ascii?Q?hV6Y1satN2pjClJVtHYARSYDj7JYtNb5f95H/zh9LVbknKFrkHAMIdkVkJE5?=
 =?us-ascii?Q?bn689anjd/BdHcs+27kf4zNV7YSvZIRXDW6cPfKfKrR4l4mY/FSetJm3ciSi?=
 =?us-ascii?Q?5ZsE2G+Ss0LhJG4wRDsGvBPI6O5Clz4X6+pQqMqMgab5zw6NYYTRQw3OkWc/?=
 =?us-ascii?Q?p7VD0+6w2fj4mnLj/sLjjl0M+inpgIkd2kGr3p1A1yDCyLRpv3Kfipiu5z3q?=
 =?us-ascii?Q?/qOjSptIrI0Ec/6ySpJN+8uymRhIH9H3jeQLY6U/HabhgKKufRcvQVIMiD6M?=
 =?us-ascii?Q?9Xc/GSdqMpTIP1sAVMTp7KMJJd0DgxmEVvevZfyoLEByQOMWI5TvqSKR5dmB?=
 =?us-ascii?Q?CWNli+GEw/rH2O9iJ2SP06I8JQL/mgRwU8v5WIbkcgHX0byfozz1pa0IeGdr?=
 =?us-ascii?Q?qGItsiRiaJFsIxL7OcM6+fJ+eh1q4RAsk/nfmDPxYXDHCjW31ght6xLPNRjs?=
 =?us-ascii?Q?TLv0qEXKv5o89MafONPcJnAyRUccebKmNZwU328gnhgY4Ueb/SmOOSHXhjFu?=
 =?us-ascii?Q?SOlgF90tn0rW910ZJbMVGf8sgrQrsRUtFCQ0GivFOe/Vt51SRUkqTwFoWlIk?=
 =?us-ascii?Q?tb/dMTgAyQTnemotdi/7O9etU1ZooEC5GhG/IQSr4SA3is4gA8h/U6/N6Em8?=
 =?us-ascii?Q?FIa6/YdE6121QSvXjkCLIvnz77EZ4e3l2W2FuVlBCkiFmwhn88tNBe+SjP/0?=
 =?us-ascii?Q?83b97Xd9MmHaDqSKDlJ0HI4Fzo0ZNGulMlCbRYKTdZ3ZF3TlCbUKSV95xdSn?=
 =?us-ascii?Q?NPltlxyc2M/KPlk5nOPiAddvQar0ZmB7pqgKA5gSGamI09+Vo+xfN2Pvrm6E?=
 =?us-ascii?Q?wrQGNu3N8ZSFez4r3uCvT1phuRmQ+TDkMYRE4vH/IDrYTBaLQY0OixF/eJnS?=
 =?us-ascii?Q?PUqCvgkwzgPABLgWbJozRXBIFeH1l3jpLqlCY/wk78Z+hiZtxTEbhLSmakzA?=
 =?us-ascii?Q?uMO9iLsfeQwwtxxdhIsPmTcKi41KhkzlpJy9KzB6BwDq9FqMgjxKU/QXMBqR?=
 =?us-ascii?Q?ykX7ArCkk6eTGYFBj9t7b4HmazbsV6wqurswD/JQt96DSX+O240oHUhTZn7j?=
 =?us-ascii?Q?DN+UI9a7X2jeMywzgRYeJK+ou+PTQHqXyBDhMCqX9Li84AuvkcA7Ptfx2y71?=
 =?us-ascii?Q?8cnaqwc+DrOl+a9O4FkbN3rYOSXILNZfQaYOk5SJiWTLVjwHtqLW6q5P9nDk?=
 =?us-ascii?Q?dhA6wDIaDw8XfaR43wHbaY8Fr4Bl+YM8sYgzE0azXt/DVVwM9YblymrlGBrm?=
 =?us-ascii?Q?iY2LPz0/f4cDQqL3oEAJF5iyHArbaiUOsw7cU/RwT9lrOWsQgj80rLsjybdj?=
 =?us-ascii?Q?msHLsFyfl0T0RO65D2gARiGYkKrjs3HTM9txD4Jop/UV1myXQ3IIVpFATBjl?=
 =?us-ascii?Q?cceViraRpBZRZDhJ8mypXcbechQnt5RUpvdxgt7U/2/CIZYfpWIkF8e7K/cn?=
 =?us-ascii?Q?KBv1mtnMoa0T5Ou9B/uWmjBym8OR93rXhLAfyZEg49dVRiosMT0pZi1bNOlm?=
 =?us-ascii?Q?AJ0pn53LgpdM+kP/xLuwiXG92ENtUMIJzuZdv5C3Y7G3JwsiH7zAP5fcYmSf?=
 =?us-ascii?Q?vA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d6ffb3db-a703-4953-a252-08dd8766563a
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 21:39:36.3055 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G+5QFx7FQfqF/wtRWzfAmGQkz73G1q+WWXTu5DZ0Rklsrv0q448iFR7AmyJ5SrjsSbk1l7SCLCGqQW3a6SbhUliESq+t/FdAaOTcnV7b5vY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4905
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

On Fri, Apr 25, 2025 at 12:10:39PM -0700, Umesh Nerlige Ramappa wrote:
>Context Timestamp (CTX_TIMESTAMP) in the lrc accumulates the run ticks
>of the context, but only gets updated when the context switches out. In
>order to check how long a context has been active before it switches
>out, two things are required:
>
>(1) Determine if the context is running:
>
>To do so, we program the wa bb to set an initial value for CTX_TIMESTAMP
>in the lrc. The value chosen is 1 since 0 is the initial value when the
>lrc is initialized. During a query, we just check for this value to
>determine if the context is active. If the context switched out, it
>would overwrite this location with the actual CTX_TIMESTAMP MMIO value.
>Note that wa bb will run after the context has been restored, so reusing

AFAICS it's part of the "context restore" which is composed by, in
order: Ring Context Restore, Engine Context Restore (with possible jump
to Indirect Ctx, controlled by the INDIRECT_CTX_OFFSET) and lastly
Context Restore Batch Buffer.

>this lrc location will not clobber anything.
>
>(2) Calculate the time that the context has been active for:
>
>The CTX_TIMESTAMP ticks only when the context is active. If a context is
>active, we just use the CTX_TIMESTAMP MMIO as the new value of
>utilization. While doing so, we need to read the CTX_TIMESTAMP MMIO
>for the specific engine instance. Since we do not know which instance
>the context is running on until it is scheduled, we also read the
>ENGINE_ID MMIO in the wa bb and store it in the PPHSWP.
>
>Using the above 2 instructions in a WA BB, capture active context
>utilization.
>
>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>---
> .../gpu/drm/xe/instructions/xe_mi_commands.h  |   4 +
> drivers/gpu/drm/xe/regs/xe_engine_regs.h      |   4 +
> drivers/gpu/drm/xe/regs/xe_lrc_layout.h       |   1 +
> drivers/gpu/drm/xe/xe_lrc.c                   | 168 +++++++++++++++++-
> drivers/gpu/drm/xe/xe_lrc_types.h             |   6 +
> 5 files changed, 181 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
>index eba582058d55..9153a7cd2ceb 100644
>--- a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
>+++ b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
>@@ -62,6 +62,10 @@
> #define MI_LOAD_REGISTER_MEM		(__MI_INSTR(0x29) | XE_INSTR_NUM_DW(4))
> #define   MI_LRM_USE_GGTT		REG_BIT(22)
>
>+#define MI_STORE_REGISTER_MEM		(__MI_INSTR(0x24) | XE_INSTR_NUM_DW(4))
>+#define   MI_SRM_USE_GGTT		REG_BIT(22)
>+#define   MI_SRM_ADD_CS_OFFSET		REG_BIT(19)
>+
> #define MI_LOAD_REGISTER_REG		(__MI_INSTR(0x2a) | XE_INSTR_NUM_DW(3))
> #define   MI_LRR_DST_CS_MMIO		REG_BIT(19)
> #define   MI_LRR_SRC_CS_MMIO		REG_BIT(18)
>diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>index da713634d6a0..cc698136a6f6 100644
>--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>@@ -43,6 +43,10 @@
> #define XEHPC_BCS8_RING_BASE			0x3ee000
> #define GSCCS_RING_BASE				0x11a000
>
>+#define ENGINE_ID(base)				XE_REG((base) + 0x8c)
>+#define   ENGINE_INSTANCE_ID			REG_GENMASK(9, 4)
>+#define   ENGINE_CLASS_ID			REG_GENMASK(2, 0)
>+
> #define RING_TAIL(base)				XE_REG((base) + 0x30)
> #define   TAIL_ADDR				REG_GENMASK(20, 3)
>
>diff --git a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
>index 57944f90bbf6..210be0ef12f2 100644
>--- a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
>+++ b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
>@@ -11,6 +11,7 @@
> #define CTX_RING_TAIL			(0x06 + 1)
> #define CTX_RING_START			(0x08 + 1)
> #define CTX_RING_CTL			(0x0a + 1)
>+#define CTX_BB_PER_CTX_PTR		(0x12 + 1)
> #define CTX_TIMESTAMP			(0x22 + 1)
> #define CTX_INDIRECT_RING_STATE		(0x26 + 1)
> #define CTX_PDP0_UDW			(0x30 + 1)
>diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>index 855c8acaf3f1..11eabe4216ef 100644
>--- a/drivers/gpu/drm/xe/xe_lrc.c
>+++ b/drivers/gpu/drm/xe/xe_lrc.c
>@@ -24,6 +24,7 @@
> #include "xe_hw_fence.h"
> #include "xe_map.h"
> #include "xe_memirq.h"
>+#include "xe_mmio.h"
> #include "xe_sriov.h"
> #include "xe_trace_lrc.h"
> #include "xe_vm.h"
>@@ -654,6 +655,7 @@ u32 xe_lrc_pphwsp_offset(struct xe_lrc *lrc)
> #define LRC_START_SEQNO_PPHWSP_OFFSET (LRC_SEQNO_PPHWSP_OFFSET + 8)
> #define LRC_CTX_JOB_TIMESTAMP_OFFSET (LRC_START_SEQNO_PPHWSP_OFFSET + 8)
> #define LRC_PARALLEL_PPHWSP_OFFSET 2048
>+#define LRC_ENGINE_ID_PPHWSP_OFFSET 2096
>
> u32 xe_lrc_regs_offset(struct xe_lrc *lrc)
> {
>@@ -697,11 +699,21 @@ static inline u32 __xe_lrc_parallel_offset(struct xe_lrc *lrc)
> 	return xe_lrc_pphwsp_offset(lrc) + LRC_PARALLEL_PPHWSP_OFFSET;
> }
>
>+static inline u32 __xe_lrc_engine_id_offset(struct xe_lrc *lrc)
>+{
>+	return xe_lrc_pphwsp_offset(lrc) + LRC_ENGINE_ID_PPHWSP_OFFSET;
>+}
>+
> static u32 __xe_lrc_ctx_timestamp_offset(struct xe_lrc *lrc)
> {
> 	return __xe_lrc_regs_offset(lrc) + CTX_TIMESTAMP * sizeof(u32);
> }
>
>+static u32 __xe_lrc_bb_per_ctx_ptr_offset(struct xe_lrc *lrc)
>+{
>+	return __xe_lrc_regs_offset(lrc) + CTX_BB_PER_CTX_PTR * sizeof(u32);
>+}
>+
> static inline u32 __xe_lrc_indirect_ring_offset(struct xe_lrc *lrc)
> {
> 	/* Indirect ring state page is at the very end of LRC */
>@@ -731,6 +743,8 @@ DECL_MAP_ADDR_HELPERS(ctx_job_timestamp)
> DECL_MAP_ADDR_HELPERS(ctx_timestamp)
> DECL_MAP_ADDR_HELPERS(parallel)
> DECL_MAP_ADDR_HELPERS(indirect_ring)
>+DECL_MAP_ADDR_HELPERS(bb_per_ctx_ptr)
>+DECL_MAP_ADDR_HELPERS(engine_id)
>
> #undef DECL_MAP_ADDR_HELPERS
>
>@@ -880,6 +894,58 @@ static void xe_lrc_finish(struct xe_lrc *lrc)
> 	xe_bo_unpin(lrc->bo);
> 	xe_bo_unlock(lrc->bo);
> 	xe_bo_put(lrc->bo);
>+	xe_bo_unpin_map_no_vm(lrc->bb_per_ctx_bo);
>+}
>+
>+/*
>+ * xe_lrc_setup_utilization() - Setup wa bb to assist in calculating active
>+ * context run ticks.
>+ * @lrc: Pointer to the lrc.
>+ *
>+ * Context Timestamp (CTX_TIMESTAMP) in the lrc accumulates the run ticks of the
>+ * context, but only gets updated when the context switches out. In order to
>+ * check how long a context has been running before it switches out, two things
>+ * are required:
>+ *
>+ * (1) Determine if the context is running
>+ * To do so, we program the wa bb to set an initial value for CTX_TIMESTAMP in
>+ * the lrc. The value chosen is 1 since 0 is the initial value when the lrc is
>+ * initialized. During a query, we just check for this value to determine if the
>+ * context is active. If the context switched out, it would overwrite this
>+ * location with the actual CTX_TIMESTAMP MMIO value. Note that wa bb will run
>+ * after the context has been restored, so reusing this lrc location will not
>+ * clobber anything.
>+ *
>+ * (2) Calculate the time that the context has been running for
>+ * The CTX_TIMESTAMP ticks only when the context is active. If a context is
>+ * active, we just use the CTX_TIMESTAMP MMIO as the new value of utilization.
>+ * While doing so, we need to read the CTX_TIMESTAMP MMIO from the specific
>+ * engine instance. Since we do not know which instance the context is running
>+ * on until it is scheduled, we also read the ENGINE_ID MMIO in the wa bb and
>+ * store it in the PPHSWP.
>+ */
>+
>+static void xe_lrc_setup_utilization(struct xe_lrc *lrc)
>+{
>+	u32 *cmd;
>+
>+	cmd = lrc->bb_per_ctx_bo->vmap.vaddr;
>+
>+	*cmd++ = MI_STORE_REGISTER_MEM | MI_SRM_USE_GGTT | MI_SRM_ADD_CS_OFFSET;
>+	*cmd++ = ENGINE_ID(0).addr;
>+	*cmd++ = __xe_lrc_engine_id_ggtt_addr(lrc);
>+	*cmd++ = 0;
>+
>+        *cmd++ = MI_STORE_DATA_IMM | MI_SDI_GGTT | MI_SDI_NUM_DW(1);
>+        *cmd++ = __xe_lrc_ctx_timestamp_ggtt_addr(lrc);
>+        *cmd++ = 0;
>+        *cmd++ = 1;

some wrong indentantion here.

>+
>+	*cmd++ = MI_BATCH_BUFFER_END;
>+
>+	xe_lrc_write_ctx_reg(lrc, CTX_BB_PER_CTX_PTR,
>+			     xe_bo_ggtt_addr(lrc->bb_per_ctx_bo) | 1);
>+
> }
>
> #define PVC_CTX_ASID		(0x2e + 1)
>@@ -900,6 +966,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
> 	int err;
>
> 	kref_init(&lrc->refcount);
>+	lrc->gt = gt;
> 	lrc->flags = 0;
> 	lrc_size = ring_size + xe_gt_lrc_size(gt, hwe->class);
> 	if (xe_gt_has_indirect_ring_state(gt))
>@@ -920,6 +987,14 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
> 	if (IS_ERR(lrc->bo))
> 		return PTR_ERR(lrc->bo);
>
>+	lrc->bb_per_ctx_bo = xe_bo_create_pin_map(xe, tile, NULL, SZ_4K,
>+						  ttm_bo_type_kernel,
>+						  bo_flags);
>+	if (IS_ERR(lrc->bb_per_ctx_bo)) {
>+		err = PTR_ERR(lrc->bb_per_ctx_bo);
>+		goto err_lrc_finish;
>+	}
>+
> 	lrc->size = lrc_size;
> 	lrc->tile = gt_to_tile(hwe->gt);
> 	lrc->ring.size = ring_size;
>@@ -1026,6 +1101,8 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
> 	map = __xe_lrc_start_seqno_map(lrc);
> 	xe_map_write32(lrc_to_xe(lrc), &map, lrc->fence_ctx.next_seqno - 1);
>
>+	xe_lrc_setup_utilization(lrc);
>+
> 	return 0;
>
> err_lrc_finish:
>@@ -1245,6 +1322,21 @@ struct iosys_map xe_lrc_parallel_map(struct xe_lrc *lrc)
> 	return __xe_lrc_parallel_map(lrc);
> }
>
>+/**
>+ * xe_lrc_engine_id() - Read engine id value
>+ * @lrc: Pointer to the lrc.
>+ *
>+ * Returns: context id value
>+ */
>+static u32 xe_lrc_engine_id(struct xe_lrc *lrc)
>+{
>+	struct xe_device *xe = lrc_to_xe(lrc);
>+	struct iosys_map map;
>+
>+	map = __xe_lrc_engine_id_map(lrc);
>+	return xe_map_read32(xe, &map);
>+}
>+
> static int instr_dw(u32 cmd_header)
> {
> 	/* GFXPIPE "SINGLE_DW" opcodes are a single dword */
>@@ -1792,21 +1884,93 @@ void xe_lrc_snapshot_free(struct xe_lrc_snapshot *snapshot)
> 	kfree(snapshot);
> }
>
>+static u32 get_ctx_timestamp(struct xe_lrc *lrc, u32 engine_id)
>+{
>+	static u32 base[XE_ENGINE_CLASS_MAX][XE_HW_ENGINE_MAX_INSTANCE] = {
>+		{
>+			RENDER_RING_BASE,
>+		},
>+		{
>+			BSD_RING_BASE,
>+			BSD2_RING_BASE,
>+			BSD3_RING_BASE,
>+			BSD4_RING_BASE,
>+			XEHP_BSD5_RING_BASE,
>+			XEHP_BSD6_RING_BASE,
>+			XEHP_BSD7_RING_BASE,
>+			XEHP_BSD8_RING_BASE,
>+		},
>+		{
>+			VEBOX_RING_BASE,
>+			VEBOX2_RING_BASE,
>+			XEHP_VEBOX3_RING_BASE,
>+			XEHP_VEBOX4_RING_BASE,
>+		},
>+		{
>+			BLT_RING_BASE,
>+			XEHPC_BCS1_RING_BASE,
>+			XEHPC_BCS2_RING_BASE,
>+			XEHPC_BCS3_RING_BASE,
>+			XEHPC_BCS4_RING_BASE,
>+			XEHPC_BCS5_RING_BASE,
>+			XEHPC_BCS6_RING_BASE,
>+			XEHPC_BCS7_RING_BASE,
>+			XEHPC_BCS8_RING_BASE,
>+		},
>+		{ 0 },
>+		{
>+			COMPUTE0_RING_BASE,
>+			COMPUTE1_RING_BASE,
>+			COMPUTE2_RING_BASE,
>+			COMPUTE3_RING_BASE,
>+		},
>+	};
>+	u32 c = REG_FIELD_GET(ENGINE_CLASS_ID, engine_id);
>+	u32 i = REG_FIELD_GET(ENGINE_INSTANCE_ID, engine_id);

humn... do we really need this mapping? Couldn't we lookup a hwe from
class + instance and then xe_hw_engine_mmio_read32() It doesn't seem like
this lookup belongs here.

>+	u32 mmio_base = base[c][i];
>+
>+	if (xe_gt_WARN_ONCE(lrc->gt, !mmio_base,
>+			    "Unexpected engine c:i %d:%d for context utilization\n",
>+			    c, i))
>+		return 0;
>+
>+	return xe_mmio_read32(&lrc->gt->mmio, RING_CTX_TIMESTAMP(mmio_base));
>+}
>+
> /**
>  * xe_lrc_update_timestamp() - Update ctx timestamp
>  * @lrc: Pointer to the lrc.
>  * @old_ts: Old timestamp value
>  *
>  * Populate @old_ts current saved ctx timestamp, read new ctx timestamp and
>- * update saved value.
>+ * update saved value. With support for active contexts, the calculation may be
>+ * slightly racy, so follow a read-again logic to ensure that the context is
>+ * still active before returning the right timestamp.
>  *
>  * Returns: New ctx timestamp value
>  */
> u32 xe_lrc_update_timestamp(struct xe_lrc *lrc, u32 *old_ts)
> {
>+	u32 ctx_lrc, ctx_reg, engine_id;
>+
> 	*old_ts = lrc->ctx_timestamp;
>
>-	lrc->ctx_timestamp = xe_lrc_ctx_timestamp(lrc);
>+	ctx_lrc = xe_lrc_ctx_timestamp(lrc);
>+	if (ctx_lrc == 1) {

so in the rare case this clashes with a real sched-out value, the
outcome will be that we will read a bogus timestamp and the math will be
totally invalid. Maybe start using the entire u64 counter for this since
it would then not wrap in practice?

Lucas De Marchi

>+		engine_id = xe_lrc_engine_id(lrc);
>+		ctx_reg = get_ctx_timestamp(lrc, engine_id);
>+		if (!ctx_reg)
>+			lrc->ctx_timestamp = *old_ts;
>+		else
>+			lrc->ctx_timestamp = ctx_reg;
>+
>+		/* read lrc again to ensure context is still active */
>+		ctx_lrc = xe_lrc_ctx_timestamp(lrc);
>+	}
>+
>+	/* If context switched out, just use the lrc value */
>+	if (ctx_lrc != 1)
>+		lrc->ctx_timestamp = ctx_lrc;
>
> 	trace_xe_lrc_update_timestamp(lrc, *old_ts);
>
>diff --git a/drivers/gpu/drm/xe/xe_lrc_types.h b/drivers/gpu/drm/xe/xe_lrc_types.h
>index 71ecb453f811..1c973d71ba98 100644
>--- a/drivers/gpu/drm/xe/xe_lrc_types.h
>+++ b/drivers/gpu/drm/xe/xe_lrc_types.h
>@@ -28,6 +28,9 @@ struct xe_lrc {
> 	/** @tile: tile which this LRC belongs to */
> 	struct xe_tile *tile;
>
>+	/** @gt: gt which this LRC belongs to */
>+	struct xe_gt *gt;
>+
> 	/** @flags: LRC flags */
> #define XE_LRC_FLAG_INDIRECT_RING_STATE		0x1
> 	u32 flags;
>@@ -53,6 +56,9 @@ struct xe_lrc {
>
> 	/** @ctx_timestamp: readout value of CTX_TIMESTAMP on last update */
> 	u32 ctx_timestamp;
>+
>+	/** @bb_per_ctx_bo: buffer object for per context batch wa buffer */
>+	struct xe_bo *bb_per_ctx_bo;
> };
>
> struct xe_lrc_snapshot;
>-- 
>2.43.0
>
