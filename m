Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BF1FC19F32
	for <intel-xe@archiver.kernel.org>; Fri,  7 Mar 2025 14:46:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD5C310E0E0;
	Fri,  7 Mar 2025 14:46:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E+vD97iB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DF3210E0E0
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Mar 2025 14:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741358759; x=1772894759;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=VS0wayYosOWmAmL3tZH1aPqrYS1wkff8aZ2Wmt/SXY0=;
 b=E+vD97iBzxIthfCbTXICUv9GNJJzykdBHDijNJECkiOSnwzvbd2vbGCc
 uzo8Q7jjH5eCOYDqhTe5AHNeGfNggw6J+WhNDNX6kxvsZSxyL1Wb4ES9B
 xnYzJlSYTdUCml0hiyYoHO47wKhr+UpNNAcCuQ6vkJa1Wjpx/hLJRbdr6
 a9A1cb6ZHAO56J3PqpCsA1EKgzUjtbh/OYAM1jPWkuirArPdAdCEX92EJ
 G2Y+/7Wc8rLuwhfQ0DjLUDxqPgNSPx6UAII2mCT5ezfqBZC8sAe7dJ/0h
 0RnzSNqH/aIwmSCTHXmj8ap3gNpRRVWq3JqWQdeYLu1h8zngjg6u0HV9a A==;
X-CSE-ConnectionGUID: GjAlvqBeTWOB6D+64TZIbg==
X-CSE-MsgGUID: kEo0OHv6S5GLY0qUe26sUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="59808541"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; d="scan'208";a="59808541"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 06:45:59 -0800
X-CSE-ConnectionGUID: uzn7p0Y/SJiw9Svq/tn80Q==
X-CSE-MsgGUID: ToNIPTM0QXeMVGimOr5Bww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; d="scan'208";a="119336618"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Mar 2025 06:45:58 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 7 Mar 2025 06:45:57 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 7 Mar 2025 06:45:57 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 7 Mar 2025 06:45:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dB3CiIC/3cxQzkAb6dbt4Z7GdMajQImslaIUKYxxkD4X8qnB1+Y63JLfSFLOxbFskn1xhJ9Ubu/jUqS61XXToUhrfpC0tT22IUQx+33X+BOP5sNd+veKxab7cWjVK1vhHru1vGSvqvu2LK84yq6GM6pFDWHF/ToENbyzlcq2d9rPleqAY4L5dMMjhzAa6A6tuQgu0H57G4tFs/MF7kxDMlI4Q1/FRLPblT214zgGc1cI/lbppSIb79mHfYI+wJ3rtIs5G6RBTpxrACxWfHNhW5ius4EJiGNEguF8NPLt7XzB5bFj3NrA4QGv8419KwQBr2hLXg/ebZFJ+K/0N83LWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cXQjcN6zSDSuQvP9k98gjWh3tbZE/L8sY8araFPg6V4=;
 b=Ya/vWm7jyIedXjeJanFHHTiQDIHeiJ3/DX3RMlWSgUvKwxb4/LFGVDyYSamkiqkECRJ3uaKrtMzzmUkEOxd+pA/YQwX8AQGLg3HmK5lwrAupWDNSjmlXt9NPbeutwPJ0ELaeBFH9fF6dMeHMueEvTHeOE23kU//UBLStg2dDHFyG1Hd/HrIVfkJrP68ephTGRoTthHwiKirShnl2LvnjiBTo7695i4P4YcHYk4GDLML1z8Q/y1JgcILxJn1Lz8WPvzsG5X+7nEeVqDfrP5ICEmideHLL07HR068euouD2/lXxlgzlCHA4/T5J/BcLuLCfRlVsct01c8ZggOAV4VJ2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by MW3PR11MB4604.namprd11.prod.outlook.com (2603:10b6:303:2f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.24; Fri, 7 Mar
 2025 14:45:53 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%4]) with mapi id 15.20.8511.020; Fri, 7 Mar 2025
 14:45:53 +0000
Date: Fri, 7 Mar 2025 09:45:49 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <matthew.d.roper@intel.com>, <lucas.demarchi@intel.com>
Subject: Re: [PATCH 1/2] RFC drm/xe: Add configfs to enable survivability mode
Message-ID: <Z8sGnSZ-45gd2YWm@intel.com>
References: <20250307142446.1790715-1-riana.tauro@intel.com>
 <20250307142446.1790715-2-riana.tauro@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250307142446.1790715-2-riana.tauro@intel.com>
X-ClientProxiedBy: MW4P221CA0023.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::28) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|MW3PR11MB4604:EE_
X-MS-Office365-Filtering-Correlation-Id: 529bfc0e-6cf7-4e10-d356-08dd5d86c2fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?1JebrRNfwK/a93bh//p7Ja5nQE6nlKa1cti9FJsoayhI+FKjCbphTmd4/o?=
 =?iso-8859-1?Q?YnlCik4C/29MwZ3YkEy0fVqUt8MXxrY2puMHePQb6SSx8G8ft3xp1Z0DRC?=
 =?iso-8859-1?Q?XFFjEXM2jGEutBZq7jOGvsxVrkyCm1US0EwRglEHECOUmhH+Fex7SZnH6h?=
 =?iso-8859-1?Q?l6nOLLxBECVpL/V+EvvmnSR4jKnKDGa7BdAUEJYtxU0DmoXSUNtU6SSC2y?=
 =?iso-8859-1?Q?83HeUzyFXdWnG6C7DmqhrWFk+6QAYgnwYDgAwPCeYCN8cLFNEPCmUe28Dc?=
 =?iso-8859-1?Q?6ezS4jF7Sx2vWjuBNhqacw2oF9w+FQK9xhvIwYfBfIt+Up7aKB+aGkZ5yy?=
 =?iso-8859-1?Q?HpIqUZpuPPN1dkM/gAPmbtugf63ZMScWHcwaNb1ZidMBrhFeRDpRwpIMgk?=
 =?iso-8859-1?Q?XFerKxK1iQ7Dv6VTFKLmrRSyXzhKtK0S1dOdajV/K0RvY9wvv4k+5m0uD6?=
 =?iso-8859-1?Q?OqXKn2nyhUsM3/AoVAA0TsGQa0TYU0yiiIqAhAdz3MpxUjnXY+xfN9mOf7?=
 =?iso-8859-1?Q?60c6i7PtvXd1F68OmS9WI4THlPugpAsnEI4YtzTrCmqNXWGnf9i4ZD3KeV?=
 =?iso-8859-1?Q?5vJ8Gpy5sCpwNcCMTUB5bkOvvqfdGvMnPEpNQVJ1uZHtY3SBBG9DNQDjNh?=
 =?iso-8859-1?Q?joaMwvsY59OhsV0F/2IXExUwCh/BygDY44t8u5M4wVKYjXdsgrk+y5OMoW?=
 =?iso-8859-1?Q?lgofNAqS4RXFjc+RZ3kkaA3rBmMBwP6RxevMR68FiU6jrhKiecW4LvWaXS?=
 =?iso-8859-1?Q?wqGyQPMo1B1zfg8r60kgT0xX9I6kBHqx+uYCsqYG8B75g70my6yGue23I7?=
 =?iso-8859-1?Q?JWkPj4bQ3bN1TOCqYw2KbiIztlwOC2Hbzon60NTPDKNH+hqld/PrdgbDnW?=
 =?iso-8859-1?Q?qeZ3NOzJsQe54DaZnTIPxOrpwaPsybLxoovEw/bPueM8daxfSWWQpivZsJ?=
 =?iso-8859-1?Q?kh6Um0Rhg2NzTuf72OBDRWf7Gwvtm/5IKp+LqF9BpgHQ9PCkwZ92F/lUkZ?=
 =?iso-8859-1?Q?RSUOJUnf7+eS4/Jov49s9dfy5mOYrmNXAPpHkgQcJ0SqTyS6j5q+2h0y+j?=
 =?iso-8859-1?Q?3zGTjCOeESk7QJy8aEYUBK9zXI4EV0JSvlVJspzs3+prt6JS2lOGGv1gsk?=
 =?iso-8859-1?Q?yC4cwM8AmTDXbSFWn4+YPh98hTC5iY4t2qKwEEJy/O4PhOIe5u+BPdplHs?=
 =?iso-8859-1?Q?oaqOea5E+NcMpnFE/svM02W6yNjZWS6VJDC64Y5bcpgIgf2Z9UkCNro3nV?=
 =?iso-8859-1?Q?97VzRCv6Bf4AUO/VrqePv7IhSLqyg7662nHJPNOjfXKJ+ZhSAB00s2BWkH?=
 =?iso-8859-1?Q?CHEGVuN/12/TenyVug09yC1GEehjZeHFCfRlgU5/PBFY5AW0UTZEjxyFX/?=
 =?iso-8859-1?Q?IWpNy/tpcizQU9QBEElokAsEXSJJQnKiAFwBGIZZOquLPc1XoHBnHKGqUn?=
 =?iso-8859-1?Q?3BbCxOz/FFUbgDvn?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Zl349ksHou+llp/khKdqJ+gmVDWNAYdmz8LdTJWmJJu196dCQhBMu75sZ0?=
 =?iso-8859-1?Q?xV7J+6TP2qUBtL6jJdzHh7KXHDfa3beZOhgUvpa3LCO5N4Cd8yT1nJVlnr?=
 =?iso-8859-1?Q?1YbzSkLoKFH/UCYPopkPcHRQNEM4NMouq2V0MzgxSPdjoz1EPe3WDkt+Ey?=
 =?iso-8859-1?Q?rwLi25GBztklRFpIwVjSQnKBPQbXlORUW5Cdl1en+4zM6dqdVE4JXLpttA?=
 =?iso-8859-1?Q?KhlA+NYkuVH0v02yXoMT8xEXFzYlLK+vD9FtNLq3g9hPMTQ7q0s7KMPhE5?=
 =?iso-8859-1?Q?eJM+x1yG/HprF6i0MpeDXCWi07cAAumlmTNz2FnR/f750wBViXQFOs3FI3?=
 =?iso-8859-1?Q?ByVQBAzt6hHwXVRgVQ8nmLQIg2lDejIRQmsMw70gtdUI5EUc29MtyqpfcC?=
 =?iso-8859-1?Q?mGonbJ+Wp/fFZtxTUKCSqz6i6NhNdSI7NAno1OzbG3nkPVJGLSYtf9ELTS?=
 =?iso-8859-1?Q?w2K5R5nLXN1nasMHP2YvfIAdrGUrCVb6gWxwjoPtph34HccxOij+yu31Y7?=
 =?iso-8859-1?Q?HtlugrthjErRTB/7rY6gq2WHnJKK1Z30XJ5jbAO+ypPvbqesxwGjehRRAK?=
 =?iso-8859-1?Q?g1rXrx/ruzAxjQi/wzsl3QbqAgpMRlWAWX+NvdM79b6Dv9OCYT/11FvM+9?=
 =?iso-8859-1?Q?jCcOqbZGHtz9a7dQuP5CFzQR0sAWJ0QQ1BFtX4VWLnmKVaUfPKzgjjhc0c?=
 =?iso-8859-1?Q?PdcImTILVxCp1uSiCFS7cbwD1Z9VhzyQIfU6zkLRJJdpFgObHJRDdjhmUX?=
 =?iso-8859-1?Q?W5dR96eTp5vzc2HBRMSsgoRi2nel1WMbmUwgT4YNNfK+8fykdsBxQVpA2j?=
 =?iso-8859-1?Q?WqkSl1V0+WK4f4rFbO1HMZeMlwqhCH/LHwZsS8TinTDRJQR+az6rAKDair?=
 =?iso-8859-1?Q?fHqYSxrY4nnY5KkUuJrLt5i/yjv/hlbuyfm+WRxzRxoNNQWj0yrZ2bnJYJ?=
 =?iso-8859-1?Q?jJViIBGb7BpSqJDrKttYtK00JMIpFUvGYfaeC75Rf3cSS74hQCh6L8jR1x?=
 =?iso-8859-1?Q?IqxxNlZVmbIHSXCwB0yhAr9USobTRwTBn9977FISWGdmw7hzd5O1hz71mb?=
 =?iso-8859-1?Q?6aDvX7z0yjRpaKyhH84X/FSJ2ue4H3cT6aNIupnPkeD+8sjBRvVbt4NqgF?=
 =?iso-8859-1?Q?WF6lWWZATo7ZnBWbtu9hIGnGPhvjfxGJkG1rpgOo8hWhHXsL7gawuo+qMf?=
 =?iso-8859-1?Q?/AtG+FFEcVIbkm+3s1f7pltnyTKd2FdTGegZLmi26PYN6V+PHRHYqH5foQ?=
 =?iso-8859-1?Q?DZ5p5UyrJrDG1QNvyRscESmqaL2hTNZz2eeIStstJtFAVOMeEstc30vdHc?=
 =?iso-8859-1?Q?DwhG1mRrdRQuC4tTaII8W9vb92chM3lV/IiD933/UFDfI60NN7MLCxMMUX?=
 =?iso-8859-1?Q?LqlBuVLRC/HCVquYC951PRmfE1p+QvkIF5GPXxjkyvYFPK79qGHEtjqn21?=
 =?iso-8859-1?Q?WrIB559FVjks1XNEWNV1dKMPsaa0GuToAwhbQNm1+RB5x1YPCBu5UiBLAa?=
 =?iso-8859-1?Q?py5mJUAKL1kmxBZA+kmuOVMXVnZHN9LCpt1B+qv1gv2f3xcu3rLiNCg+hX?=
 =?iso-8859-1?Q?SQSF41APSveE/PfNK/TbsGuNvh/Y2NlHeVd3ML6I40uzSJ3Ds9uV+OPW/w?=
 =?iso-8859-1?Q?fnNhupKD2z/kU0Ja7BIb7GVT+W/cBSK7kAlT9YQmv2+hgM1PETtg7zvg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 529bfc0e-6cf7-4e10-d356-08dd5d86c2fe
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2025 14:45:53.7269 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 28YtvSdMy8A11Q1VC/cuR8S0emOdmr+e8MYZibktbozsrjgS8s7MCz9r5YqaP1r0AL6R0HYXNR7mM/5h5R6Lnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4604
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

On Fri, Mar 07, 2025 at 07:54:44PM +0530, Riana Tauro wrote:
> Registers a configfs subsystem called 'xe' to userspace. The user can
> use this to modify exposed attributes.
> 
> Add survivability mode attribute (config/xe/survivability_mode) to the
> subsystem to allow the user to specify the card that should enter
> survivability mode.
> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile      |  1 +
>  drivers/gpu/drm/xe/xe_configfs.c | 95 ++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_configfs.h | 12 ++++
>  drivers/gpu/drm/xe/xe_module.c   |  5 ++
>  drivers/gpu/drm/xe/xe_module.h   |  1 +
>  5 files changed, 114 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_configfs.c
>  create mode 100644 drivers/gpu/drm/xe/xe_configfs.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 9699b08585f7..3f8c87292cee 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -28,6 +28,7 @@ $(obj)/generated/%_wa_oob.c $(obj)/generated/%_wa_oob.h: $(obj)/xe_gen_wa_oob \
>  xe-y += xe_bb.o \
>  	xe_bo.o \
>  	xe_bo_evict.o \
> +	xe_configfs.o \
>  	xe_devcoredump.o \
>  	xe_device.o \
>  	xe_device_sysfs.o \
> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
> new file mode 100644
> index 000000000000..8c5f248e466d
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_configfs.c
> @@ -0,0 +1,95 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#include <linux/configfs.h>
> +#include <linux/init.h>
> +#include <linux/module.h>
> +
> +#include "xe_configfs.h"
> +#include "xe_module.h"
> +
> +/**
> + * DOC: Xe Configfs
> + *
> + * XE KMD registers a configfs subsystem called 'xe'to userspace that allows users to modify

----->                                                 ^ missing space

> + * the exposed attributes.
> + *
> + * Attributes:
> + *
> + * config/xe/survivability_mode : Write only attribute that allows user to specify the PCI address
> + *				  of the card that has to enter survivability mode
> + */
> +
> +void xe_configfs_clear_survivability_mode(void)
> +{
> +	kfree(xe_modparam.survivability_mode);
> +	xe_modparam.survivability_mode = NULL;

let's avoid xe_modparam, but more about this below...

> +}
> +
> +static ssize_t survivability_mode_store(struct config_item *item, const char *page, size_t len)
> +{
> +	char *survivability_mode;
> +	int ret;
> +	unsigned int domain, bus, slot, function;
> +
> +	ret = sscanf(page, "%04x:%02x:%02x.%x", &domain, &bus, &slot, &function);
> +	if (ret != 4)
> +		return -EINVAL;
> +
> +	survivability_mode = kstrdup(page, GFP_KERNEL);
> +	if (!survivability_mode)
> +		return -ENOMEM;
> +
> +	xe_configfs_clear_survivability_mode();
> +	xe_modparam.survivability_mode = survivability_mode;
> +
> +	return len;
> +}
> +
> +CONFIGFS_ATTR_WO(, survivability_mode);
> +
> +static struct configfs_attribute *xe_configfs_attrs[] = {
> +	&attr_survivability_mode,
> +	NULL,
> +};
> +
> +static const struct config_item_type xe_config_type = {
> +	.ct_attrs	= xe_configfs_attrs,
> +	.ct_owner	= THIS_MODULE,
> +};
> +
> +static struct configfs_subsystem xe_config_subsys = {
> +	.su_group = {
> +		.cg_item = {
> +			.ci_namebuf = "xe",
> +			.ci_type = &xe_config_type,
> +		},
> +	},
> +};
> +
> +int __init xe_configfs_init(void)
> +{
> +	int ret;
> +
> +	config_group_init(&xe_config_subsys.su_group);
> +	mutex_init(&xe_config_subsys.su_mutex);

That's strange... if we are not using the mutex here,
why do we need to initialize it ourselves?
Why isn't it done inside the config_group_init then?!

> +	ret = configfs_register_subsystem(&xe_config_subsys);
> +	if (ret) {
> +		pr_err("Error %d while registering subsystem %s\n",
> +		       ret, xe_config_subsys.su_group.cg_item.ci_namebuf);
> +		mutex_destroy(&xe_config_subsys.su_mutex);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +void __exit xe_configfs_exit(void)
> +{
> +	xe_configfs_clear_survivability_mode();
> +	configfs_unregister_subsystem(&xe_config_subsys);
> +	mutex_destroy(&xe_config_subsys.su_mutex);
> +}
> +
> diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
> new file mode 100644
> index 000000000000..491629a2ca53
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_configfs.h
> @@ -0,0 +1,12 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +#ifndef _XE_CONFIGFS_H_
> +#define _XE_CONFIGFS_H_
> +
> +int xe_configfs_init(void);
> +void xe_configfs_exit(void);
> +void xe_configfs_clear_survivability_mode(void);
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
> index 475acdba2b55..15b3cf22193c 100644
> --- a/drivers/gpu/drm/xe/xe_module.c
> +++ b/drivers/gpu/drm/xe/xe_module.c
> @@ -11,6 +11,7 @@
>  #include <drm/drm_module.h>
>  
>  #include "xe_drv.h"
> +#include "xe_configfs.h"
>  #include "xe_hw_fence.h"
>  #include "xe_pci.h"
>  #include "xe_pm.h"
> @@ -91,6 +92,10 @@ static const struct init_funcs init_funcs[] = {
>  	{
>  		.init = xe_check_nomodeset,
>  	},
> +	{
> +		.init = xe_configfs_init,
> +		.exit = xe_configfs_exit,
> +	},
>  	{
>  		.init = xe_hw_fence_module_init,
>  		.exit = xe_hw_fence_module_exit,
> diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
> index 84339e509c80..c238dbee6bc7 100644
> --- a/drivers/gpu/drm/xe/xe_module.h
> +++ b/drivers/gpu/drm/xe/xe_module.h
> @@ -24,6 +24,7 @@ struct xe_modparam {
>  #endif
>  	int wedged_mode;
>  	u32 svm_notifier_size;
> +	char *survivability_mode;

We should probably create another struct
struct xe_configfs {
       char *survivability_mode;
}

it could be here or perhaps inside a xe_configfs_types.h
that is imported wherever it is needed.

>  };
>  
>  extern struct xe_modparam xe_modparam;
> -- 
> 2.47.1
> 
