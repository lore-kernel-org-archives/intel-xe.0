Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80ECDC3ABB2
	for <intel-xe@archiver.kernel.org>; Thu, 29 May 2025 02:00:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F4B610E6DB;
	Thu, 29 May 2025 02:00:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T4BpcxGk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28DAD10E6E3
 for <intel-xe@lists.freedesktop.org>; Thu, 29 May 2025 02:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748484005; x=1780020005;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=LX6vyQ7BF59XpRlXpF+M4POtdN3dqKnQMRTinhU1Gl8=;
 b=T4BpcxGkCHVrM92clt2au8ajm5DHkj/43g4pFE5ETKTdCCbxdH7L/Gtr
 pXrSjrFnNLDpJZBxafyqWH1XOeIb61tNvIIMfP/ztYXTS9UBfHK+EG6tT
 Xo6cSp9MzR7uDCcQ2oXbi68JUK8X2BfiSilllMftDnVmkdTxueX2kjCBV
 ORvbClcw0kL/Wy3WG0Lmt+r2tQj1JqnkvyYktReouusintC6nA/6794cq
 I11nk5hO1apHZqipAwjOx80wPb2fb5y7gcBDe5McZcBo7ud3UqXzbcbry
 AgFRmjYsF5gb+S2NCkhchvgjjdFJxILXDtpw+TtL2foHUdTvUYKpyUyGS w==;
X-CSE-ConnectionGUID: od32x5VmRK671j7eKqq/ew==
X-CSE-MsgGUID: uS9zoF+SSgCnra/K8O7WHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="54337585"
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; d="scan'208";a="54337585"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 19:00:05 -0700
X-CSE-ConnectionGUID: yQvRtToKQGuo7KHmBrMsJg==
X-CSE-MsgGUID: fXfFw2evT5CPm0leTa2bbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; d="scan'208";a="148273760"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 19:00:04 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 28 May 2025 19:00:04 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 28 May 2025 19:00:04 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.79)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 28 May 2025 19:00:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e13UI6HEXwNqdYRmP52cjVs8FhP0b5xwNL0ZFT4v7DlhHHUtXyG5UMKUh98Mdu4/V4sCeF0xnnN7dWQ+cpwCCOeRYlLep9kRAexol7fgPvl/w9WvvlevE1yXeO80pdhcv9DrgebORpRc8CB7ZFhoSHx2J3hHmOH/hr5eZm/VtL6pPOzsxEyoSVvqhvcToN5TTYdfbW0+wfvjL9/726/yz1HDt219AVsKCmpd5ImofC49le3PfXV3ccJGsd+xZ7h6VqP/X3JFXFh/e9baBlkgyiXMxf7/XIDx8NB+C6hpaVzv/gKZ7ziWjX7iO7ca1X4s4sJjX3aWJeOGbPs+sBPlug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qIT9IfrISj18fdFjT4iOspBjuqAX9UTSsu0x3SQxiZE=;
 b=hixqTFD4o2ZydVJxotnRI2qfKlTyz5zgB2/co+F//lI0A+2f/Hc3JTJJdlcm6ELR//5GzQaGEBtICX+HZ0Zjn+RM9JXLSJ8s8nlYbEkVoEXCvDr1TTa8Pp8Px81t6DoM51Iq7G23YM8mpqDdHdF++iuATI/FhRDRhmeEVUI5vAWy0+t1ai+Dx92C1ZUee9RvyCwkeuKm7dfl8zL4D8m+eCEa/8tvya1nY9Tv3OWZNcw4YwH5WAjUNwWuLMWFM0LWOkF7owCSw0ND7IYpypnAFr12wt1faYqlPpETK3WCMT4s8XVmd0vEZKIMAWK26OBPKnZYnv/kxn2VHbBmtZCsFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH8PR11MB6901.namprd11.prod.outlook.com (2603:10b6:510:22a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Thu, 29 May
 2025 01:59:15 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.8769.025; Thu, 29 May 2025
 01:59:15 +0000
Date: Wed, 28 May 2025 18:59:12 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Riana Tauro <riana.tauro@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Stuart Summers
 <stuart.summers@intel.com>, Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v4 3/5] drm/xe: Allow to disable engines
Message-ID: <20250529015912.GX6239@mdroper-desk1.amr.corp.intel.com>
References: <20250528-engine-mask-v4-0-f4636d2a890a@intel.com>
 <20250528-engine-mask-v4-3-f4636d2a890a@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250528-engine-mask-v4-3-f4636d2a890a@intel.com>
X-ClientProxiedBy: BY3PR10CA0004.namprd10.prod.outlook.com
 (2603:10b6:a03:255::9) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH8PR11MB6901:EE_
X-MS-Office365-Filtering-Correlation-Id: 933bbf10-699e-4db0-7397-08dd9e5469fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?C/iJj9UyegV85zxmIn1Jhb21E+F7A5tjOoXad39BazFsg/ZVvPSGJECmpYiR?=
 =?us-ascii?Q?TEAOCcFx+4sRlIBXIVo8UIR9E62QLQvo+UJhnkusS9QT0gf9t523j8eqAk9Y?=
 =?us-ascii?Q?ESB81cMhYiuCnFJHJKFtr12vdlSWf3aAo8yOsgznhnAzKTitSirgXLQnMkBo?=
 =?us-ascii?Q?oWSocbFDYmZ+5mF9VNZmMmlFpMwIBp6zaNGP/JkMGvkOxwv/YsuQrD1Sprni?=
 =?us-ascii?Q?NsbpBBTWeIG5yVJ/Pz56HZ5Af+zExjJb61acrOBxj10MMSVXexoXlxMJ864s?=
 =?us-ascii?Q?jis3k4sJm2Rk0bjN1o0jVgvyv8OzSlsBJNX7Si4cScztD+aPuSr+hTe91KGg?=
 =?us-ascii?Q?6ie9T3dWypX/+AbLmIhMUSQaDr1iS9uUKg9YD++6OR2vKyXLj8usIVGkXrB7?=
 =?us-ascii?Q?KWenlcbl+qTsg6puRN8TAkOxmJhKiHxOWMkHcnAERPgBKRNWtvq2vgDsogn5?=
 =?us-ascii?Q?kx9mACHWvRUqXLwJtmERBNuMdkrT8yDEYmE17PrgY/Q/BMfQaxBVxDUypZgz?=
 =?us-ascii?Q?rM57FxPqMGtbtyAQICaAuVyz5SCxonwrRV3O5iI5P63j5QKZN+V53/5iCOYW?=
 =?us-ascii?Q?FeBcKY7lTXLUgWWNCrFrQohSPB4SeXqYIlgoEZFUl+1B9PvPs63MULSnx0Rt?=
 =?us-ascii?Q?VPWBaP1ort1yeQ2SMfZXwkq5TZMbI90ElljJojTmHAoKTunkpRBKFqRnugX/?=
 =?us-ascii?Q?113V3itxIlBXRtwOMAkYyVdEraK4je68qsklZHbvMoHPnrB7o2yoTW6ko9xI?=
 =?us-ascii?Q?e+rC7039GFEQavwGX8adnRTnB2ATDzDqr3pPDzQasGoX2sVIeefPBglZG1Kp?=
 =?us-ascii?Q?Kk2cSA7GObGwoAzJOLRQYuhCizS2uTrers06RSND9DSGF0491LtDKeRdy4hB?=
 =?us-ascii?Q?94NuTYK3qQg/ps0G5Svc/QziIehcNFEsbKPczlJxDCCBV0hFeqbsutlsL3Zl?=
 =?us-ascii?Q?EFVFubHt8udJa73PiRKYiHWgT1a8Dvb4py1kthZSJ6hceF2YNh1E7zPuh3PM?=
 =?us-ascii?Q?kHcB+2xbr+gq9OnGXebflXA2a9RznOKaO+2qBcD5qy6doUOVNi+Rywu8LKJq?=
 =?us-ascii?Q?i0YqbPt5CtytSPHDEcXwp2NT4grI51aqpZsoTUKYXMLxGdzEiz5pTJWA9NLL?=
 =?us-ascii?Q?wAqo/6z4PrOK5r16DwlkAh40nHjv/Rk1XNKV09EIBVsQzUrHK+DOAdss9XCY?=
 =?us-ascii?Q?RLXcju/ceorR+niYjjE1Pd2q06l1rnXaTr5DNNkxTFY8lWqvGx8DQ+cx3ZfZ?=
 =?us-ascii?Q?okX1U9Jw6YZclQxq3PfGvsj0HkwXTo+HL6I29q3Tg0NTDxAFScTm7yyBZG7n?=
 =?us-ascii?Q?wc+ksuMOzRZvkZBgnUeyp9dy7P5KNzi43+QmHLCwh0DRHtWtDONOrLJVAlwy?=
 =?us-ascii?Q?49GyM8UoHFp0MhrbYyF1qV0mHClTbr3qslq/bfuNhV++iLX7b0x4/2wt3AEB?=
 =?us-ascii?Q?xwT3iWKlLPs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GsXkMMrHbc6D8zoF95MQ2L2NXBXcqQwmRvJNQamZwhfja4B1M/Wsc61xiFmI?=
 =?us-ascii?Q?A8V/2WYs6uH58vhP+z5cTzfVmxWYL3VzhGGdFtk8zGJ3hQ2faMKxS+WZ6Dh8?=
 =?us-ascii?Q?5N28nNicc9gXQ85Loc9J8BgCuXH6LWXnnPDOdibxv0U110WPvjJoszOUUCsZ?=
 =?us-ascii?Q?PzZ6UIjXnhKUqTCf2OBzJ7wO0F0WK3+EBn6SsPY2dWyZkC6gBup31AIWIIW9?=
 =?us-ascii?Q?3vEkwgfxfejo0dysQkEwV6OQpR0NPRzyS58UDRrUPLOqDFyLCq+pYRxnf80S?=
 =?us-ascii?Q?SJtNUTY/bS5pNMAuw/+p1Xa9Zn6SHHYPE9opAZDs1vUntNbu6JkirWI6KOkX?=
 =?us-ascii?Q?vYofATrqexM8c05xjqbWxQn1LtKTrQh/tThwtKyLn/euTEfO2OiHyu6yWRcn?=
 =?us-ascii?Q?iDfeDOddniSY0QbS+nqc6Mk+YDDtWCCffT0saa1fwbBfvcBJrtU2lenMZ9RA?=
 =?us-ascii?Q?Mm4x8X67EWsc7O2CkfZmuoA11iOp8kES1hk0qxgTIPEEmxI27I8mCJ/2/lpJ?=
 =?us-ascii?Q?iilS6TZD1cwY/mOeuBGi22y7YuJd8IXMe+fHUV2Q/4k55K4tUOcIUbBPjtYs?=
 =?us-ascii?Q?4oFl5mUHCv8Kr74xF18DRuciAQ9SOBjSsPCh71YyOWPOZlQ/zZEBQDfEiHWC?=
 =?us-ascii?Q?C+JDu/aRmiQzb3PMrxRELK2wDjCKOtzTcS+MOSJZ7bEayzi3kZ6RANoHDAxu?=
 =?us-ascii?Q?p1ah9aYiPX4cBeZJmIm/gSov13vJltT2QtU8x/FsdYBDeW4akySx+wxtlmNR?=
 =?us-ascii?Q?rZlMmbBTiX2Hc/uKYXhP38Yvi82SAxoZEa6b+WnifM04BXQekwSGIKDczRuK?=
 =?us-ascii?Q?VvKCo0Dmn0JAXaEMWcSKqrS1IBf75rrbL1nHY+mTxWi8eS6tU4b63BTP4it7?=
 =?us-ascii?Q?O/8fcurSbrkGom+JVFZSYZBcENBsctgQPHPT4JXy6Gl2B5P6qWIYnhEH4F+q?=
 =?us-ascii?Q?6VfNPyZ1/7hCb9Q3ex3uX2kRcqdJ2OMQ9GipmY9KqavB1PmeInRPk+YFg3jn?=
 =?us-ascii?Q?/g95OcaHH+qzKCfJE71jL32l9070Dqe/v7mknut0mZpGzNnpJbBP7NUMXS3B?=
 =?us-ascii?Q?PNApHHZLVazjBWX5uU15q3ci+0potFar0uontF+L0eXeumni2hD+omOJ83A7?=
 =?us-ascii?Q?AwSvIQX3srSjNB3nlE1AaKKXBCWH8nt6yu7W9QHX5qFrij5sFVyWcbJ93DQT?=
 =?us-ascii?Q?pBOoaJJKkc1AUT1ebACaBY6OjhAD8Xwo2kPe7DpUbolmqhcFqxQVtsUvGtu4?=
 =?us-ascii?Q?Lb85gIhoi5bIGlLVRiYM1qnRR++u/kC3H6sPA+1h/P1U7R5CT70uY+AWb1q8?=
 =?us-ascii?Q?3dMA7v32CqW4VUcDusdBVJFwd6/zi3Gc5kncQ0MlbGW8rgcYvlf739tgNydO?=
 =?us-ascii?Q?yv7dZKkGIxShXoybj9iF6CDzQKnrFKLRguOarYiXiWqfO8rChEZSR7xj7yo9?=
 =?us-ascii?Q?0ANSkCU+jOy88E+sCZM1ChocPF7F0SYyjk1mry+zsZJ1EHIH1UakvN+C1RDs?=
 =?us-ascii?Q?uYge8LyL658wkIvV7M4psXXDHgaylUn/6h8yYrr8qMMUgVfd+R2tL8vglm8w?=
 =?us-ascii?Q?+mC8so8SBMXCqh9rYSzmUM0E5JR+0GfWnI8nHP8KrsrrfMdGoMaxcCLIP9ur?=
 =?us-ascii?Q?eQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 933bbf10-699e-4db0-7397-08dd9e5469fe
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2025 01:59:15.0542 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Toea2vCgLQB/wu1Ox0ikafFLBsFUfIxtFt+RaesELgQAQZ57hvcqyG8q3DGXRrORyd/2XfyLpHIuqY8r2KUcLcjn1yBMcHKiCprokL/8Mh8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6901
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

On Wed, May 28, 2025 at 02:54:06PM -0700, Lucas De Marchi wrote:
> Sometimes it's useful to load the driver with a smaller set of engines
> to allow more targeted debugging, particularly on early enabling.
> 
> Besides checking what is fused off in hardware, add similar logic to
> disable engines in software. This will use configfs to allow users
> to set what engine to disable, so already add prepare for that. The
> exact configfs interface will be added later.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_configfs.c  | 15 +++++++++++++++
>  drivers/gpu/drm/xe/xe_configfs.h  |  2 ++
>  drivers/gpu/drm/xe/xe_hw_engine.c | 20 ++++++++++++++++++++
>  3 files changed, 37 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
> index cb9f175c89a1c..8320d57ef5a80 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.c
> +++ b/drivers/gpu/drm/xe/xe_configfs.c
> @@ -226,6 +226,21 @@ void xe_configfs_clear_survivability_mode(struct pci_dev *pdev)
>  	config_item_put(&dev->group.cg_item);
>  }
>  
> +/**
> + * xe_configfs_get_engines_allowed - get engine allowed mask from configfs
> + * @pdev: pci device
> + *
> + * Find the configfs group that belongs to the pci device and return
> + * the mask of engines allowed to be used.
> + *
> + * Return: engine mask with allowed engines
> + */
> +u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev)
> +{
> +	/* dummy implementation */
> +	return U64_MAX;
> +}
> +
>  int __init xe_configfs_init(void)
>  {
>  	struct config_group *root = &xe_configfs.su_group;
> diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
> index ef6d231b3024b..79d001b647740 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.h
> +++ b/drivers/gpu/drm/xe/xe_configfs.h
> @@ -14,11 +14,13 @@ int xe_configfs_init(void);
>  void xe_configfs_exit(void);
>  bool xe_configfs_get_survivability_mode(struct pci_dev *pdev);
>  void xe_configfs_clear_survivability_mode(struct pci_dev *pdev);
> +u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);
>  #else
>  static inline int xe_configfs_init(void) { return 0; }
>  static inline void xe_configfs_exit(void) { }
>  static inline bool xe_configfs_get_survivability_mode(struct pci_dev *pdev) { return false; }
>  static inline void xe_configfs_clear_survivability_mode(struct pci_dev *pdev) { }
> +static inline u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev) { return U64_MAX; }
>  #endif
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 33681169b8570..3439c8522d013 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -17,6 +17,7 @@
>  #include "regs/xe_irq_regs.h"
>  #include "xe_assert.h"
>  #include "xe_bo.h"
> +#include "xe_configfs.h"
>  #include "xe_device.h"
>  #include "xe_execlist.h"
>  #include "xe_force_wake.h"
> @@ -805,6 +806,24 @@ static void check_gsc_availability(struct xe_gt *gt)
>  	}
>  }
>  
> +static void check_sw_disable(struct xe_gt *gt)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +	u64 sw_allowed = xe_configfs_get_engines_allowed(to_pci_dev(xe->drm.dev));
> +	enum xe_hw_engine_id id;
> +
> +	for (id = 0; id < XE_NUM_HW_ENGINES; ++id) {
> +		if (!(gt->info.engine_mask & BIT(id)))
> +			continue;
> +
> +		if (!(sw_allowed & BIT(id))) {
> +			gt->info.engine_mask &= ~BIT(id);
> +			xe_gt_info(gt, "%s disabled via configfs\n",
> +				   engine_infos[id].name);
> +		}
> +	}
> +}
> +
>  int xe_hw_engines_init_early(struct xe_gt *gt)
>  {
>  	int i;
> @@ -813,6 +832,7 @@ int xe_hw_engines_init_early(struct xe_gt *gt)
>  	read_copy_fuses(gt);
>  	read_compute_fuses(gt);
>  	check_gsc_availability(gt);
> +	check_sw_disable(gt);
>  
>  	BUILD_BUG_ON(XE_HW_ENGINE_PREEMPT_TIMEOUT < XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN);
>  	BUILD_BUG_ON(XE_HW_ENGINE_PREEMPT_TIMEOUT > XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX);
> 
> -- 
> 2.49.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
