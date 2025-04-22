Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DC78C369C2
	for <intel-xe@archiver.kernel.org>; Tue, 22 Apr 2025 19:34:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABC6910E2CB;
	Tue, 22 Apr 2025 19:34:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MLDTjEeH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5785A10E2CB
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Apr 2025 19:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745350451; x=1776886451;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=r1w7EUB/b18IZZPhe5PDRlr5m8OGP0KfBsGSh5+KxFM=;
 b=MLDTjEeHIBF5fCv67l7zSM+it42sIk2YIdKORAL9vesfwxoU4m9HCPaK
 v8IIgQA3iVA35JALaVniB+jHfiaGyN6lz+jAc9enxBbFfnSlfzn0w3Lk5
 UIIAl1JI1V1Bt7w6cgULv3ZM3tP8uiX3VX0tv20qlP+ux8CTU4/Fxwm8I
 78eyXtwBEFY/p+TD4XVmTsqrqe+YS8t2i4XapspTk0IKariI/L44J9stR
 4eIQk9arAVbpdnpV+N/HtJAtmCxTubjltSXe7mtCdtiSF9EWkKUftbkDd
 XSKc3353hvQydMUGeEYV8UeMiDon6WSLHiNumjhZsGyDvbKr8dFu65EZ+ Q==;
X-CSE-ConnectionGUID: fFZp4BN5SvKkGRODSI7q2Q==
X-CSE-MsgGUID: jKEKwolNT/a9EEE1MFWG9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="57574803"
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; d="scan'208";a="57574803"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 12:34:10 -0700
X-CSE-ConnectionGUID: ofhn9kidRQCbsObIKrEP2A==
X-CSE-MsgGUID: kT7QoKBIQX+V43btu9gBew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; d="scan'208";a="136968378"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 12:34:10 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 22 Apr 2025 12:34:09 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 22 Apr 2025 12:34:09 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 22 Apr 2025 12:34:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fvWQkjADTyzDtUKde9UKlOgXqv6Xy3UX25xKQB2TU4JDqM3qIRS57+jM/Ns3NUQNySL4PdEWu7f+/xuEfjshiOyxoTNcB4Sw4zk5ITJmM+aTww5jCj+0zv2zxmzlozhVroFFFC+AQH9xUeqRvj3xr+oorG2RobQnW4IvuGokwLj8tulIvI4UGNL6KcGFQn/g5INev6eumEhJfyaiDrr3U2NYdjaB1V6XtxqV8LZKhCa8FUULayYXeyNg8UJEnAcZhT0QCMDVWbafdHEb6+6AuurzOVRhy5de+AG1FM1/QUcX19NE+siQBuFNg95ksjaPzHcIRvd7fZ4wl9Aph/hM7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TgDdvAzqnWJORrdKTwFjfGOgi3P1+R60Zl6QhKxYXwM=;
 b=OoEYMNezYaxgOsavhbjmNTB6eEZWy+vRk5xt8fbepWYAMHzDBAJREiPpbMIb4kC49rtzIIcyCsCrf+cJMXrvuqEPRrFVt9LKjX3zOe9yFMEv4XpxOXimD/rUbGZaYGbBkHKc9qJ/wRIpuD6bzZrRxEr23Q3lab5q0JGlbmkNRlBdoEUuYAelyBXLP2aJ2MWnpZ8rN+ZmxWPl5+Fvmvbil40RlpW+oY24CvTj8+lfG7kbH3YeKo293qM71NhzIaP/WO0IrZBQzH+GAUYd76fYsJQm3r21Ya70Np7INxLiCbf5teV8+tlQ72AJSTz7/VZgiPYjenGNn1ktGECe7cACgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.33; Tue, 22 Apr
 2025 19:34:08 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%4]) with mapi id 15.20.8655.031; Tue, 22 Apr 2025
 19:34:07 +0000
Date: Tue, 22 Apr 2025 15:34:03 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Badal Nilawar <badal.nilawar@intel.com>, 
 Andi Shyti <andi.shyti@linux.intel.com>, Raag Jadav <raag.jadav@intel.com>,
 Ulisses Furquim <ulisses.furquim@intel.com>
Subject: Re: [PATCH 1/2] drm/xe/hwmon: Fix kernel version documentation for
 temperature
Message-ID: <aAfvK2wn_eB7yOLI@intel.com>
References: <20250421-hwmon-doc-fix-v1-0-9f68db702249@intel.com>
 <20250421-hwmon-doc-fix-v1-1-9f68db702249@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250421-hwmon-doc-fix-v1-1-9f68db702249@intel.com>
X-ClientProxiedBy: MW4PR03CA0288.namprd03.prod.outlook.com
 (2603:10b6:303:b5::23) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SJ1PR11MB6129:EE_
X-MS-Office365-Filtering-Correlation-Id: 752ea735-6472-4793-c4b8-08dd81d4a622
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?R/lmEWcGqvb87R0xEShc2F9V4dOuJnxMYdbycDjB3/epmluX1JwfuUl/hwjA?=
 =?us-ascii?Q?8myVMlm1Ja/dEHxBIccUkNfPQ7NTjYga+D1weKT5CpKdPvbYinOLB9dChm15?=
 =?us-ascii?Q?Jk3FvfOcu8ARsJ1ksEBd/6D3rkcJZqhpnskQmafNGdnlvgRJ5eDxaNxh8hbw?=
 =?us-ascii?Q?c+63n1CPxjRxbkjvg1GAeeAKpnXfBjUGhwkwVIsum56mgWTEhT/HZ/C/dAlS?=
 =?us-ascii?Q?eL7rDsEuIvT2DEk5m2FCvfW+QJsRgU63D4rAi6n4PFgTb9veBaMzAII8UXkQ?=
 =?us-ascii?Q?dVVeqsZHKUmU6TYDii2pdMXuzFhph+5Z3HCXs3ltVeVUxbucxx/Cvu8LlNGG?=
 =?us-ascii?Q?T7MF3wpGHJkRYEIZCsXfwxPmMz5cMxG7VUc9wvZAwz/j8IzGefndOshRl+OO?=
 =?us-ascii?Q?LZpLC+Pt01RUD4Kzsxy3bbU6LkISV4LHZHvBLJrFukojRGYrbMKS003mG+UB?=
 =?us-ascii?Q?A2dbeNWX4cbXZKvRBhBXAj71rtcjYBsHaWLT3/X1ISB8rud+gC9GikbwzA93?=
 =?us-ascii?Q?U6dBP/9kE0DUFIanufbXFcZQ8NnBGWLtRnGz8ECbL/Yw3WgTk+1Jcrg2vHvO?=
 =?us-ascii?Q?gf/beIPmB60ayp/LQYqQkDKsD3x58Wys+PMBj48/Ntxi2mFh/6+8DxzWo18c?=
 =?us-ascii?Q?4w8tW0tsINr8b9WxRpqN6va0HD0gcfzGgjDzQngHpUe9h3E7K82K8gsd0SoN?=
 =?us-ascii?Q?CiFskYvfnfsJauQBPWntzUG3X7nZjUh+sAuMYgENJtPYGZ/vyXfRfjWPMjlC?=
 =?us-ascii?Q?353kHyF/fh04vfE/SpQsTokY07AMb7KErIFk0tyjCL+tJgV90mXDhRfOeadA?=
 =?us-ascii?Q?NVChTc5zFzAmBKed24e4uyNrlOPgSS+sgfLuZ4mynGNAaTiJR6/yp4em3WOo?=
 =?us-ascii?Q?RkA+7eXcro9UzPFWiYT6DOx7wTyQ+ghe808epjixLZks/mxRUSmE9tspz90v?=
 =?us-ascii?Q?qtj7Hmnzp6nkIDD9tY00ZQ8nDir6iSUB+ULSq6qEut2rzJ51gu4TWNw4+M1x?=
 =?us-ascii?Q?P92W6Kn/pv1F5+1VWSS8EDeNT/TI64rCc64g3KY3dfwvABGZ7vYYQu2+Okwk?=
 =?us-ascii?Q?Jvn0wZJHriiAuzowwQwmEW+Fd6cP3zeb8WW1TkPIkKLYWz9a7dIZkDp4W2OJ?=
 =?us-ascii?Q?b39R0tWTQuiaOlsqbSJMUBxSyWGWd344hJsxdwyl8Mks8uxsVPs7+JeNeTW6?=
 =?us-ascii?Q?CosSDxMFLubKwrdyBzOMH8uUJF6l4/jhwyt5KbzlUXJCtJP4tyMP6+mRz3Xt?=
 =?us-ascii?Q?/RJXPq3PQSS2C/3INDg3imnK6doV3slw7YA+PmCSOk1/us02F+2Ixs2J1jIk?=
 =?us-ascii?Q?lypVYKIz3f/aO4V9UzwdUrtKxErc/VSAaZ7SIJ9PWvFyYTesCaAOxWIiLeUY?=
 =?us-ascii?Q?bNbpMtQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?o/+wqGDovGywqeI5GDizpof7BaWUKthUQW+AnWKa+pbaamIgKPbJsQ6C8R+z?=
 =?us-ascii?Q?6J9kT/xCbpRdhnxQLywWEb0o3FeAfFVR8pIXpOlpF0Ykn+M40jBFlr/IrZk1?=
 =?us-ascii?Q?sjKpFdJlbF/igkypOg1olp96BB5msxpPDjl7XbH25r+Ko5BKqpcBgzWoOWbQ?=
 =?us-ascii?Q?g83dCndQWj/85E7hNi9DXz8iGIu4EUmj1kW1uXj2JGIxa3sPmwsdOx79HDUT?=
 =?us-ascii?Q?W+rsYpqUIhSxmATUfDACUwFt1qrlqjP4SO1bg5oAl9pIl8ZYPbd7jHRD+xTV?=
 =?us-ascii?Q?pm3OUG2+eYOtXMEtKQU56kAChdl4AJTxuQycKz7FOe3PpNSSWaQIjnJDSaU2?=
 =?us-ascii?Q?uOfibHLVFX99rqOwOK8ryJx1QDN1HaedS8GQbj/bMNFbnW6wYjE7iwOgezxa?=
 =?us-ascii?Q?nJATuRxZ7f9GpOmrmq7WpjsLEaFjsVyJi7LZPTKXt15xpGLsDYSInqfBCgIo?=
 =?us-ascii?Q?DpGtl0i8IOVUynLQ10SngHqDLJDDthtuSLZMnU5RUGfcu05nO9nRu5m3QBls?=
 =?us-ascii?Q?2e5zqZ6ipJkp83OE5e9PrjC6Gsql/mq1G86IipP1LmU/pdXVERVPzLioW47e?=
 =?us-ascii?Q?RjkAuiiNqVQHr6nYrf9zVc4uHPFBck78EvgWlQVUzCQ4cwSa38WuvoDVmFKf?=
 =?us-ascii?Q?hvXOTx34EIaP3sVndqhWyLLVVG+TrVB4g5nc4sGUCtlCPHkJIXimRd483tdw?=
 =?us-ascii?Q?ibtV+x55QWp8UbIykuHtufwxHFG4j8G+vBYWVtyuAOn8vdonvT0LjSWKUgmA?=
 =?us-ascii?Q?u8MdbiGLugPQU112tfs24+H7dOl8oGubRZwi6gI4rbCk1XlCdGpP5xplkPl6?=
 =?us-ascii?Q?layTPbv4OuOA8Aj/gZQQNraVAGQ1a2dk/3cN2K8qq4aAo9lwFou90JBmY+6/?=
 =?us-ascii?Q?TuLeNsH9vMAg3Ktv1ivAtoq40mF0e1WdUBJgXCViMiAJQP+ZPsJXpToJtk5B?=
 =?us-ascii?Q?GqDOVig+BckKTuhW+rSzLQyarKJLSJS+AoCdOYZvnClMcviUGswiHlvq8bBm?=
 =?us-ascii?Q?gLOIixI85XqBbeRFjOPu/LWpyp+nMtUm1pXNLGC0mnXN+xUEiqGZp10eky9H?=
 =?us-ascii?Q?mymIkc6MVXt/CNq6l4jx04cXB0ulAZ6kvwyI+muI+sD0E0DjAASy8ifq6O6p?=
 =?us-ascii?Q?/0IdeqnUdiIR1Bp4JAz+xNCkAIlpJIYCfTW4ynQ/cZkmz5A1XgaPSHk3fniw?=
 =?us-ascii?Q?nq+f+adVa/XCFad5A7Byx46hD1cZ7Fsf7OKOGxQUauC4zxyNbaIJAjaQMHht?=
 =?us-ascii?Q?p2NCxOox1ivHlS2LwGjj/tlmY4jCkdAWVT/PtG0BMsyUkWDyr+hQ4KP1RDgJ?=
 =?us-ascii?Q?LymXzGjDUqWQ3VS7lWbM35yTMnXlwmZ4myp0reEYlxNkNM9H2sPei+ulJBf9?=
 =?us-ascii?Q?1+XAlVOPhm4AyoC1ewW11gYVcH4DJS3AniG/CXw9K2FraJ7D/re8XM05u3c+?=
 =?us-ascii?Q?SJrrHMfGDPNFlAsvKwuYDMXCIIuExB3KoG/J4bW2908Ini+W43yoDNX9/xEv?=
 =?us-ascii?Q?fQXKclg3EqtpwR+IAwHZZHRPVZ06uUg+0mC4bOQMKnMTLvUvuO9vzYbdfmo7?=
 =?us-ascii?Q?D2v30Nb87Mjmcq0XsGRG3mkqylYqLeg2ZM15m6BWa2iGR9NEczPjLPlcBzYF?=
 =?us-ascii?Q?1g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 752ea735-6472-4793-c4b8-08dd81d4a622
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 19:34:07.8770 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8VDN0Gqv2WCyAFvU9NNdkgx0EgQ9ooP3+gb4UGrZked5kJwZup9o1a91+z46tzvLLk9iSd4CjdohJC7NIStRHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6129
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

On Mon, Apr 21, 2025 at 08:15:38AM -0700, Lucas De Marchi wrote:
> Wrong copy and paste from other entries: these are starting to be
> supported with 6.15.
> 
> Fixes: dac328dea701 ("drm/xe/hwmon: expose package and vram temperature")
> Reported-by: Ulisses Furquim <ulisses.furquim@intel.com>
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4840
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>


Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>


> ---
>  Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> index adbb9bce15a5d..6fbab98fb639d 100644
> --- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> @@ -111,7 +111,7 @@ Description:	RO. Package current voltage in millivolt.
>  
>  What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp2_input
>  Date:		March 2025
> -KernelVersion:	6.14
> +KernelVersion:	6.15
>  Contact:	intel-xe@lists.freedesktop.org
>  Description:	RO. Package temperature in millidegree Celsius.
>  
> @@ -119,7 +119,7 @@ Description:	RO. Package temperature in millidegree Celsius.
>  
>  What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp3_input
>  Date:		March 2025
> -KernelVersion:	6.14
> +KernelVersion:	6.15
>  Contact:	intel-xe@lists.freedesktop.org
>  Description:	RO. VRAM temperature in millidegree Celsius.
>  
> 
> -- 
> 2.49.0
> 
