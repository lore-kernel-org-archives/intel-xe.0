Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEED8606A319
	for <intel-xe@archiver.kernel.org>; Mon, 19 Oct 2026 17:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TRZtYUJc
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A96E10EF05;
	Mon, 19 Oct 2026 17:06:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2270C10EF56
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Oct 2026 17:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792429593; x=1823965593;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=9PFfjIQrk6v7Y7NxYO8EUhPIP+MCfc74XGz2YCLCagU=;
 b=TRZtYUJcAr0BU4lJPERMyktct193FGrKGlNnXux3fdg6rmtLOjEcRcu4
 AhJLZ6S3t35PtE9H4qGPZictxxaQPq0umVngbjYa0eF8Vmo/YLjfnF5vH
 GqXAW4pgJun6tlLgyyO7mDivt0MarU62AZ+OObhxl9mKEVyFTcCLZM7YR
 6bJnTqPxtFLO1Pr/PNIx3KzqIU6uhxHj4Vs4C8p7jGXHQy0log4ySw4er
 y6dIZQ/vIeNek+G6pFleWiPq/1XPbOwvxFa4kCBbppZtzM2Rk9/HXg4MW
 XekUsa7lG/bIF2J9v2MDnA7D2HnVbnf2+H719TYf6MrSasdSV+whIt7Nv Q==;
X-CSE-ConnectionGUID: xr5d6vB1RWC20LbG9HOQWQ==
X-CSE-MsgGUID: J0yHXFiLSp2IvfcAlLLZVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1002156"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="1002156"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 10:06:27 -0700
X-CSE-ConnectionGUID: 9AwlYCTqTIKM76gRpbf/hA==
X-CSE-MsgGUID: +YPgABwfRVW4Vqgu8C1NdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2688596"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 10:06:27 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 19 Oct 2026 10:06:26 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 19 Oct 2026 10:06:26 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.26) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 19 Oct 2026 10:06:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sB9RfLK5dCGPN595wLKyt3zjwFWADL5mJwqrnboZdIjVV98hdqfqO/7ZKEhzAnW4DMn0kPVaW1l61wr+a+Uz1+X1gdDGi/vu17mp1uD8Y7dWZUknpd36zBJiIfIh6RpGLzpu6kxmXPFuBw1DajLRyFO5mxneWUW7lqb2+rxlcR903uYFwN04z0R5zulKqQiCOzWcCUz1yipxG4gyN8WuArq4jHiWKxzNG+yKLuYOBCMoMpqSEIgJocIKKVF5adNFX6TdE8+0GBks96ZDenjCmGXRW4+7mQNl6Fw3/Crr29pYfggR/d2YXkocOji8okxfvw9JYTd8XwDKZGe4fkS31Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=27OsRpdHGq2rdxwVWyyX8wx+tPU0dLfIExBH6oPcCLI=;
 b=XB2kPjuXDAIjBQA57FUy31UungnHO+Hz2BIgnMOE2Df+IJalK6OxHr11j+1zJMcDmf9DrChkrjvx+X0gdMJ4Bi514Z1wsZA92GtR5xduh2Te04esQWmKQb2Ho6HRZ+8e2vlR+02YFhzrKy6eD6t3VP1BeJajuzV90tFmbLW9MsIIE1T1+NvPos8Te/CpCVo5LFPWIZZwefzPFMXRm0gr8ZoHxZjY+Z/ZgTVaakKlsc0Bqj04yp4fvz4SMzsHevP9DnMwUSpdvS28G2Mo4jaSdGHVMIs0gmx/MiLZdz5SeIc+y8OWvXQxGO+h6x8unX9TtxBI5d5lt8tZ6ZRGkfHPlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH0PR11MB4934.namprd11.prod.outlook.com (2603:10b6:510:30::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 17:06:24 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%6]) with mapi id 15.21.0522.017; Mon, 19 Oct 2026
 17:06:24 +0000
Date: Mon, 19 Oct 2026 10:06:21 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>,
 kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] drm/xe: Fix build with DRM_XE=y and CONFIGFS_FS=m
Message-ID: <20261019170621.GF1329272@mdroper-desk1>
References: <20261016191838.GH578251@mdroper-desk1>
 <20261016193254.3042071-2-rodrigo.vivi@intel.com>
 <9411b525240f8b79c2d828a887d1679518374689@intel.com>
 <20261019152559.GE1329272@mdroper-desk1>
 <4810b908f782874431348ea1509975a7a30f5148@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <4810b908f782874431348ea1509975a7a30f5148@intel.com>
X-ClientProxiedBy: SJ0PR13CA0235.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::30) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH0PR11MB4934:EE_
X-MS-Office365-Filtering-Correlation-Id: 6337c090-c841-4e84-8ce6-08df2e034e19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|6133799003|22082099003|18002099003|10067099003|4143699003|11063799006|5023799004|56012099006;
X-Microsoft-Antispam-Message-Info: RQE02rpqnO59Ca2qAWQAq9AWXyNXqYp2xeAJAIg+Okz6cKfw0V4twZ4SU2dte3pPSl8J0VVaLeW+vAZeAD3ymoqYxdEnqziAvf0axWJSOXSPZknZL0SP9EzesUq09QIfHIUhlBV7lVqCX1J6lr6j0iLJJpShgCjHRfyHv9IdEC36EZgQGO6JLQQ39CageT8gUmz1AcN3aOvg+fEzA1VoOmxNLrX+1fm2DFs8F9zmBuTsvTl2RH8ZLA1PzQpvr30DVWtqcMCuzMPRaiacjpbxqH5Jazuel/j7MHRvWVAhxJ8yVkRDSb8wq0ilyzH8aR2CyOQ2tbcbUJjnvyXp+jpP2AtffgOKzSLXc6TUIz+7Uz942almlxbQxsO4UR5PXadQh5Qs4/KzmBiy/k+MSDr8czTpo9dJo3tHux54aCZjFFcvfdjYHKI7B/7QNi9R/0bLvF3gxl9VSHrkJ0Z2HvNtkWN6NZbnlKnljeHWeQXtstt48RmhBOl1zE7Xc3DDRQUOjQypgUHTKPFO80JThTQzq/MejlnF4UzsQg9UKcnhy2DK3bVt7m/7rRXdo1wEd+hTYDde1eEkPK2+qVwneLvL1iNaQ5fV1ecHR/zhFy4i7CP/IWOqitVi0TThevkoi/wQXVkE52gEQl+9YYsHJnXy0JV9lFUvCohk96KIX10fyPg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(6133799003)(22082099003)(18002099003)(10067099003)(4143699003)(11063799006)(5023799004)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UBDweWC1oVIwEaOdyuIDAZcq2HNaO3vKrqYUyVfI3aBaLbhQc/kdHiqM9Yl/?=
 =?us-ascii?Q?vISOV7GI3LQub/zSYxWzY6kywZ1V3PXUAYOI3lISI2bDSG+IBmos6VnihB0p?=
 =?us-ascii?Q?RPbald5KYB/2I4rttwajVgASrXCmJ7uY7KcqNad2lqkcR+UO1ijaSTpg50RP?=
 =?us-ascii?Q?kxXYIijqEI/Y0IqEyaWFb1td2B8ie4dDMDW9opVzFhYbHEyryCicYvSTtoOu?=
 =?us-ascii?Q?+rWsRLacx/SkmSEYUNd7myp795lPVKsFwkjIRI3BS+0/fNSfwkJaC/wxvC7F?=
 =?us-ascii?Q?6DO1m10imhkev7pqv118sk4ng1klNqyo0ILX4eWu3aRUcgDQ3RLwtyDFRu9r?=
 =?us-ascii?Q?03jfc8R9Ws4xn3Rk+OtuienkYy2sMtFuJfajszn5sKgmtVrgH1lvWCjh49HV?=
 =?us-ascii?Q?3W+sC/4NMuK8BCPNHxx2PlfmPIpzDIME8Vz4xHCuXFv3+IbGfQ9oAj7/EjoU?=
 =?us-ascii?Q?Ebr9iF9svexd3rS8zAuTnwCVK6wTkRGl0mNL6dVJSOdzVmX71P2b+Rf4xrDJ?=
 =?us-ascii?Q?Oic3TfPt6tWTt1xKALOpoKBbTZDPP/0vDe5ub9E8qP7cTgbXyvRyGz7MLR4G?=
 =?us-ascii?Q?zXAvDhN8KtA/4RXTw08mbT1c+l1CkhqSff+oSxCPwP6ef9J8LyKsQ+RhlL6M?=
 =?us-ascii?Q?ICJnR7nI/Hj19kGqf4wDJ147Nu5E1HRIh1ey9KBjXMTXtwUHXxVzs+p5L1e1?=
 =?us-ascii?Q?FaAkvXKWk4CHtCXoasW7qbvhIw1O9J7vqvcFe6nUT5Ybg3X18Y1RADUFKXzR?=
 =?us-ascii?Q?i46pC7udW5HqI6BR98XnYXZheccYPl6fyJtIxrY6hgC/RDRAhCN5q7itbMiG?=
 =?us-ascii?Q?ZCtnnb56Imknz6fVxz3ANtFqVxQaVSxwlsBxHNsYUfGn1vu2txlrQCwE5mV+?=
 =?us-ascii?Q?/Ldyhsf8uhE1gjL9OzIR6i+CxUnJj27C3GB/pZPDDKKjslcOP/LHU2VEXiRG?=
 =?us-ascii?Q?mKYw4GTcaLZKqXf+mSGDc4w7c28I/0SwNnSPpkpx0Vsll7SBwvSeh8Es8ovl?=
 =?us-ascii?Q?UuBpTtDmKs2Dyf8sy08b1FFWwtsbsCyp/miDeu8Tku4Y2jUqWE1UU9Ziv+I2?=
 =?us-ascii?Q?eeVjRlaVCGr6rzoKauO2rfL5dkXQglfYxjuMjG70Q7jqJFlqHo5+Vtx2E6TZ?=
 =?us-ascii?Q?qXJHZWVxs7daIDoxGaiwCIQ0f0VKFaSsRv6q3SJRujUBf1lD2uc60fmWuGjN?=
 =?us-ascii?Q?nZ5pCDZ0ZswAr7SFcbrLZJz+85E06W5KkTY487CDQAMl0yonyHcIDXzOlh1h?=
 =?us-ascii?Q?8gTvgaStXWbsjcRSHY4ubL4Mq7avz33TduT6Fl6R8exiBBQ3/g94Ag/GCx8r?=
 =?us-ascii?Q?eRDoKX3PINGLtP3NO3frf5rsJKtrVnQj0SbgF6+YpEwxRxlZW7jQ9TzoA3MH?=
 =?us-ascii?Q?LxiRB9R7WlSKe0BPGRtK5H8XX/40cA/9UXL2U0dyW5YzmxfA7rgaAwgv8+94?=
 =?us-ascii?Q?IGFKQya15NzLVZfMHZgqiBaPCv3IzrCfPSSs8GRXKsK33AwkQBvRN5a9+ZTO?=
 =?us-ascii?Q?7go5KtJB/orw4x1CCcsKR0KGxtab/J9fkjoGRgBxEj+u8JmLGTUQi3b9skGh?=
 =?us-ascii?Q?Kjcyx1pjGbuUxCNeaCBzE6rm/mxGa63k+tzU+wFBdQmFLePRb6YEAkj3FxXM?=
 =?us-ascii?Q?JxpDMCir4MXl2midV/+6oBwVKkJRWUsVLGnkXj5Tj0moIS26/AHSP58Z4PDS?=
 =?us-ascii?Q?0P6L8pGOunzE+bhp8y7Tdr71PkbvAeaxpiRAQEDaWiQ952f2apK9UAJR43w0?=
 =?us-ascii?Q?RoxP0oTnBGbWkKxXiHPBW7UCZAJgL+c=3D?=
X-Exchange-RoutingPolicyChecked: me9RWtgbQyEWW4je7y4pyHb82sZnGShI/SPK820IUWmHsR5VTBLl3bMLf7h/KPOEJ3FRVzxQf/OXMzGs4fYMb6Y6a30/hzv5vI+nBWryNaBRtFjW96WTtzRzckN+nlMdbFDlMOEPBSlnsy1Reaua9cJxWNqRsZnYS7BMOOmNvIShqYSripYqgJewkVqo2vpGTQyMKSlUheIgE9rtBskMsFVagMr3Oh7zGs0XBVj76K/y5TNm6RFviQm2L2+Nuf2kJhSNQO2aIri1qS8U6XnhabcRdieFMja+Q9XP1nPlgRYNY46U+RzwT0rLRKoHEjlw6m9kEqqgkZMjAb0JJ9nifQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6337c090-c841-4e84-8ce6-08df2e034e19
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 17:06:24.1616 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gf4jPXyC5QrmkZSGsAe9Lik+Jm0+Yvo00UNKlLIzImTua7c2Q0SogzgP13sPoDOIaNBJgQWaXwiJFY54RLCnWZP2YrEFvamteICNm+CvzgA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4934
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 19, 2026 at 07:53:31PM +0300, Jani Nikula wrote:
> On Mon, 19 Oct 2026, Matt Roper <matthew.d.roper@intel.com> wrote:
> > On Mon, Oct 19, 2026 at 06:21:29PM +0300, Jani Nikula wrote:
> >> On Fri, 16 Oct 2026, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
> >> > When xe is built-in but configfs is a module, xe_configfs.o is not
> >> > linked into xe, while IS_ENABLED(CONFIG_CONFIGFS_FS) in xe_configfs.h
> >> > still exposes the real declarations, leading to undefined references.
> >> >
> >> > Use IS_REACHABLE() so this case falls back to the stubs, the same as
> >> > CONFIGFS_FS=n.
> >> 
> >> I think using IS_REACHABLE() is almost always a mistake. It's a hack to
> >> avoid link errors when something in a module needs something that is
> >> built-in. It's a combo that should be handled at Kconfig level, not at
> >> build level.
> >
> > But isn't this situation exactly the case that it's intended for?  Xe
> > doesn't "need" configfs, but will use it if it's present and usable.  In
> > cases where configfs is built as a module, then it will not be usable by
> > any built-in driver (including Xe), and that's perfectly fine; we just
> > treat that the same as the 'n' case.
> 
> Yeah, but there's zero discoverability for the user, or the developer
> looking at a future bug report, with IS_REACHABLE().
> 
> The user enables two configs, the Kconfig doesn't enforce a relationship
> between the two, but they still fail to work together. How is the user
> supposed to know?
> 
> With the proxy kconfig option you at least get a hint at what's
> required. And you could make it more comprehensible with e.g. something
> like this:
> 
> config DRM_XE_CONFIGFS
> 	def_bool y
> 	depends on DRM_XE && CONFIGFS_FS
> 	depends on CONFIGFS_FS=y || DRM_XE=m
> 
> Anyway, that's just my opinion. Obviously using IS_REACHABLE() is
> "simpler" from Kconfig perspective, but I think explicit is better than
> implicit.

If we're worried about bug report clarity, wouldn't it be more obvious
if just add a print during init?  Something like:

    if (IS_ENABLED(CONFIG_CONFIGFS_FS) &&
        !IS_REACHABLE(CONFIG_CONFIGFS_FS))
            xe_notice(xe, "ConfigFS as module not reachable from built-in Xe.\n");

which provides immediate information to the end user, but doesn't imply
that they need to change their config if they don't care about using
Xe's configfs support and only want it for use with other modules.  I
don't think most end users would understand how/why a proxy option like
DRM_XE_CONFIGFS isn't getting set, and even to kernel developers the
kconfig dependency stuff is always super clear.


Matt

> 
> 
> BR,
> Jani.
> 
> 
> -- 
> Jani Nikula, Intel

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
