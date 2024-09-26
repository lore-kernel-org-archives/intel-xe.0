Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B20BCCFA19
	for <intel-xe@archiver.kernel.org>; Thu, 26 Sep 2024 11:47:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE73310EAEE;
	Thu, 26 Sep 2024 11:47:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kLGpRx7D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9863E10EAEE
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Sep 2024 11:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727351243; x=1758887243;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=xuAr6SU49Hq1FVXXaSHokvX1md8rp9sGG6LFVhVEYXA=;
 b=kLGpRx7DHZqKaP7YhcdmE469SBi5nKokICsW6tbB5t/4qsr7I8tnFub/
 jmVpRuf0zM0Gj/jZCYJBK8UXjZom5B3ruOdquk5GFMCyXqU4htV8zxebu
 RGTvjocJixr1pxoTUVhLeLqEP6+fJJferpikrUKM+bdoPVwt5Qp8aMoVM
 M5g2JAIBj6zDD2PQvaGPn+xDtfoi8/2RYnVFtlJlPmq5pwrrhwvhDF5El
 9+ytt8qVufZpaipXZAlkCwDahTdHa0fzXFvdYYLCI0eAzQnUSDFF8a7xd
 Kp0Qko6PdTkWHZ8SCiz3W5ZrbPChGiHAuFWRz6izCz/nNIVj7RBqdEtAu g==;
X-CSE-ConnectionGUID: G8z5KfVbRPWu50Qu4SdT7A==
X-CSE-MsgGUID: 6thg4h5KTzW7gb+TmViYAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="26594499"
X-IronPort-AV: E=Sophos;i="6.11,155,1725346800"; d="scan'208";a="26594499"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2024 04:47:16 -0700
X-CSE-ConnectionGUID: YEOaFYl3SDGxG3bdQQ/47A==
X-CSE-MsgGUID: kYrk1uZYTf+ncqdhhvXMqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,155,1725346800"; d="scan'208";a="72203341"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Sep 2024 04:47:14 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 26 Sep 2024 04:47:13 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 26 Sep 2024 04:47:13 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 26 Sep 2024 04:47:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yasRyQFlq0aHe2DASN+CZP5WDaMwokomhlN2iMsznEcV3hrVqgHgLT0j/HBr3w9w6iqSdOr4q9O0GIuQL3Ahyg9j+x85fdIVtkzJP8BhiURantmP/YSUWKtHSDpTvo2X30r4cNVgRQzzWqUj+qp2REK0bjpiN24FMe4z1txgZhSRgshDu3Gf8OsMKTemzfcACLGQX6Ebve3LpnaelRXY21zSEfTHivI+Y44xJ1Dx+jQ4iFQmwyRbMYAD8TGFuKod4mABFO6K9dDYgZNDwIJ4ynCDczpyJfb9H5iMC+fSpkBsg0uwFuHerMNeAwzU9uKgEF4bmheYg28PCJfluCCfdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Zzc/+B9BCzY++CJ00mi1TKfVdIQBx2oA82dcf4Icu4=;
 b=FyP/FNWUWluTK2vKCawy9OrAxCSdHZOwnrEQAt0CVc9hxuCkxRg5ZPfADGuYQREdTfek6LBjIOwH4z34RDPGLeomp817BsTx6EgaHg1Ehl7UqeBCbfK1pAzI5XWQ+QfEL2OZprybiNqJrpmDN2cqngZUphTaPRluqX8+NoR3Vh16CNh1o0I+7lgLHF3yXH2Eq1Jjm9bwsptB9d3+KJoJjb+LDTtTy7eNqc2SoMkqQOvJXVbcR/WGfzzApyZnPBftdPsw7J70pPyGXAi3pET5jQs79Ov2XkjCZusk6zqzhlXoHcwgQBj8SrVGyWUbH9YbRMT23NzYaI7o2cXDYXw2+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by SJ0PR11MB7156.namprd11.prod.outlook.com (2603:10b6:a03:48d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.28; Thu, 26 Sep
 2024 11:47:11 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%3]) with mapi id 15.20.8005.021; Thu, 26 Sep 2024
 11:47:11 +0000
Date: Thu, 26 Sep 2024 13:46:48 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Matthew Brost <matthew.brost@intel.com>, "Rodrigo
 Vivi" <rodrigo.vivi@intel.com>, Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v3] drm/xe: Use fault injection infrastructure to find
 issues at probe time
Message-ID: <ZvVJKGc_ltNgYDsl@fdugast-desk>
References: <20240925155546.76630-1-francois.dugast@intel.com>
 <87jzey21i8.fsf@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87jzey21i8.fsf@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: ZR0P278CA0171.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:45::9) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|SJ0PR11MB7156:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d829d60-f0c4-4f90-bdbb-08dcde20f54b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+n2auk9wnpmWqqb/ZKLPZKSDf1EVaa9FDVDtQxB1ZZbnKkKgy81s4Xi12u0B?=
 =?us-ascii?Q?Adxnk8Rq4ntDyWbClLYYVu4I+LAQ1UnhwXUDhreMp0/QtorlGJhZ0C2lTV1d?=
 =?us-ascii?Q?oKaCnnQKXDUdl7qKJ+z7NuLBf5UjUJOnA49bgoBCjq64YNWGjlNOK64WS1Xn?=
 =?us-ascii?Q?fKujT3CHVnAewfNC7Fi0QheS4lLYpTY/t5z/35zDFv3AaIWhWVEHJVoKKmmd?=
 =?us-ascii?Q?rB0MzOIfwNxYmfZEA3fSg/0AUWm6jY5XwIaw0WHdS3v6wjdDzyebk9YEdApI?=
 =?us-ascii?Q?Ze35KBty9A+W6bOTa0Ju84BBmVlDBQsy5Z2Azjecs1u1pSkAGQSMj7tR/mw6?=
 =?us-ascii?Q?O590ReHrlUTBcZTpaUDwcpcSEISLTr0j/1iZQ3iYcGQXR91qH++gPyWzFbNF?=
 =?us-ascii?Q?AIfX1eiFbxiTsVdc9ZNxS6OJ5FS+FUcpDp+um9+km1jck7U3rNdRH4qwZUuP?=
 =?us-ascii?Q?H87lYQl/WJPtWGNGmkfu4AHWX9T1uEpHbWDsJ4ZV47nYuym//6cIe50s9tH6?=
 =?us-ascii?Q?VLB2RNPFj6BaRWC+tdgNw9xE7eO0nviQfrUlx7RxiOs2TFoKh2JWZyq/fZrs?=
 =?us-ascii?Q?ZAbybCcQsqjzHaSNXG7ONWdyxuvCicXZWx/ueArGLWLxO55kHMdeYa/91RDr?=
 =?us-ascii?Q?OSdWhToQhcbQrVqJXEcQ6nIo+sk0ZJPqTrhbbWsl3zB7RN0HkbHWCgDcYj7Y?=
 =?us-ascii?Q?efshc4O8hWsA/O9+EAO9LG8aKMmgWKpTXwIpfCyLGFFD32GQDYpAcA5dTWqS?=
 =?us-ascii?Q?fhLyGVUKbjQhBgHxInXxUWLBJ+/qdkjVrTUMtZeBwlpZ0NU+GUrRug0+o11b?=
 =?us-ascii?Q?LlUPtrfUn3eFjFKB+jSu2G6S7H1utOqp3nzFvJBmU5eQeb7EAaG5izEibFQe?=
 =?us-ascii?Q?qfm37mwGcAQpT7XlkCyHjqqnOb7C6pXFcQ5RdEUI8Kjz4Fy1c4qOOg8t0eoi?=
 =?us-ascii?Q?VjwlHQEliiwubQggcO6BP3nFIJTZVpR3m2vkggOqObZp36ZDzVNxplOoFPRT?=
 =?us-ascii?Q?TWrGAOnslZacZq+/MA3kN1EFK5nQ+4En3pvCN/UPMevvRQbKv+1aUoR02yme?=
 =?us-ascii?Q?UBH56wPXfRbbLX1K+TrhS31K8/git7kTLK0PgOiOTromk2MAeaqqPSvD12J2?=
 =?us-ascii?Q?B2RJWOnOlF0BLMX0yfL/FJuoDolOj6Aeus1AuWh+oHdifq6QnmlSFVD65e80?=
 =?us-ascii?Q?ei9BnEGvv1j3scPYhLOWDz9LlLRZiZLxZJHGPbBDFNIR6YK/vNirYxuIo4V6?=
 =?us-ascii?Q?qakgPorWHiG8qLMMs7oWmZCiO/a2kgBUecBrcRFRz8ixr3+t4Vfqvo/qEctt?=
 =?us-ascii?Q?T8PBgznrW5hjyGGYVHLwqqi0pXxw71bt3O99i1R+vSmJiA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ntp0stQu2bUC+31OUlVl42KgZppR5iu9taD4IXUZ0Tuz07wjXkLaloutysM3?=
 =?us-ascii?Q?70Zgg7vG/O4ldVLe2fF7dkf11Y/JkhI9WbJDrztZ0hHK8JgeYUzRPp/sVZiO?=
 =?us-ascii?Q?j7jle931GlyFtG3fwwLBPX46JBoS/moJe75Mm28HjuHnj/Or4LhlXm80yvSi?=
 =?us-ascii?Q?WbbF6WkezI4Wlh1jfiRStKXm9yg8peFVLw/h83gg71g32qdHhd/mRVJZ6dhF?=
 =?us-ascii?Q?YJM9UW2DTY5CtKZjUblnag7D2OQ29QyyudEwr49jd01GJCVVErJDDnfHmSHE?=
 =?us-ascii?Q?Z7bI0teUdfVGu870W5wfU5g+xBNM5xaFkbpTbG5n2opOlqL/tu20VowUEhW8?=
 =?us-ascii?Q?fwvITZnbEaJ8MTI1e5Jz35RiqC5PHWhYjjzgJKECS83oWJGd2DSh45zGBrb9?=
 =?us-ascii?Q?zajWhfRD2z4a3mxms0I2Sb5rNlRIa4uB1b+0JLKt2liOJ6ILMNEa8lno9NIE?=
 =?us-ascii?Q?Iq1dcIt9j1PiGCmH625oOHgx7YI+4m5eb73SWuZQGGbvuzuuXlIBSskpEXLC?=
 =?us-ascii?Q?5yQkl5AHaa+MwJq7avn87dyv6MfKLEEBTDbCaN6JqY0WgpjqTP8ZKPe07gyO?=
 =?us-ascii?Q?AheWpg6kzNkcrnQe8a8ZT5uquDVsm+w9uy6UCKD6vq0FwzWsOfqUSU7XoG0H?=
 =?us-ascii?Q?b9DrU9bs2anEz1u7zEYvwWfJtEjM2O0BXD2pjqiJq3kiyIM7I3VBTY4F/bWi?=
 =?us-ascii?Q?Pjg0wbSQ4Te4sfCeLyUBnUB5S7DPcPGV8OB4MwWnjYayGyVRTYX6hBZY2gdZ?=
 =?us-ascii?Q?3/RI9yZkuGAqw/NqcvlzoYaXvMiU7dJSy05EDihIPAaqmSVr8b0YCQh3dn9v?=
 =?us-ascii?Q?cq0nTE/TnKMDzk5CfJv+lgIKZIRJzl+aRa1gCjoenZan+7c17kuNq1nFq4NR?=
 =?us-ascii?Q?FuGsD2AbpfcuBJOFKWJSpQcL1r32WldG90O0X+NU54sIYd3zZGNkD9u3h738?=
 =?us-ascii?Q?BNvOANAnWrvtI1HR615GA1I83tqz74j6kOpK3qTX9G4A0qSG1lfdf6xb7LEF?=
 =?us-ascii?Q?4pw5YIf/OKlqlcfa66POg+mhzG+CsEzKHQtSlQ9idF0169FdcNAIu5gV2L+g?=
 =?us-ascii?Q?/CZrmsoX2EQ1q87l2sQwsc/TKQ6BWXjoOOiXmO7fpdFv5ylIRjJn8IBxas55?=
 =?us-ascii?Q?4Z86s+vO8oHY0JQ0U3+QWdzDMHA6hasVWQhw5IiTKewY81fI1CsVcWRUlkDL?=
 =?us-ascii?Q?Daa4ZNKz0h2q3JDkJCQ8+VO3dvJHuXTgX9LylQcrn0juEgkxwe9UHTzw4z68?=
 =?us-ascii?Q?Cy5HWEbEARIHw2XGHmvuMY5/3nFVEGOQdvu0NDrALKteQOBZMxF4MziYWVdq?=
 =?us-ascii?Q?o7rcx5BMyC9/usoFx27x05uy8BVhGVSUhj8dz03yxwE0OIMmAo+b+mPviXOl?=
 =?us-ascii?Q?ftRNJuW/E/Z3pidlMdSCsmvTdhLSc6I7FgyMwAHY6SBJOhH5eZ9J1QpqNUao?=
 =?us-ascii?Q?GYzv9f1Z/O4IXDPtnTCB5MphYx4vA+v4hiqbqwzRbLaieOG7pBgXRslBu/wY?=
 =?us-ascii?Q?dxTeSBinAMjxpnbK/llE8VejP7LteE4azzJ0SLqkCW5q/aYE2BXV71LBNpHq?=
 =?us-ascii?Q?j5v9xRtqSGbqUixPWoPFreocNm/quVtcizI4UpamYymsgsZ51H2Y00dOQUoA?=
 =?us-ascii?Q?ZQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d829d60-f0c4-4f90-bdbb-08dcde20f54b
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2024 11:47:11.6287 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mfp+ScGtMAokrZLWF8f0MNuxycmmyKf3Nd03ZFArRg02XlLxE/boyQMfmLtQs6lDS0Pk2hNF4eaBXAl6OQjSkFHyk09jWTMznQGy3qsmQck=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB7156
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

On Thu, Sep 26, 2024 at 12:43:59PM +0300, Jani Nikula wrote:
> On Wed, 25 Sep 2024, Francois Dugast <francois.dugast@intel.com> wrote:
> > +/*
> > + * The ALLOW_ERROR_INJECTION() macro is added to conditionally skip execution at
> > + * runtime and use a provided return value, in order to test errors paths in the
> > + * callers. The requirements for the error injectable functions are not strictly
> > + * fullfilled but this is acceptable because the caller only propagates the error
> > + * up the stack without cleanup of resources potentially allocated here.
> > + */
> 
> I'm curious on the details of "The requirements for the error injectable
> functions are not strictly fullfilled". It's repeated many times, but
> not explained. Maybe I'd like the info spoon fed to me instead of having
> to figure it out for myself. ;)

Understandable! I will make it more explicit in the next revision. Any
suggestion to avoid the duplication?

Francois

> 
> BR,
> Jani.
> 
> 
> -- 
> Jani Nikula, Intel
