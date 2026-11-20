Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D91606A6F9
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 19:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WyClTocq;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=gMSeQjaI
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E98E10E070;
	Fri, 20 Nov 2026 19:27:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C38DE10E070
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Nov 2026 19:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795202818; x=1826738818;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=nK60WRDyBM5rnJyxbMns4bguTDA/XHc9bCIEMJXdXTE=;
 b=WyClTocqQNBg7GH9A6RDsOeHOwhD8lvmjUhj8Q8bzG/YEiJmkK0Rdoos
 k04eEMLdbM0aXFIXgm6DtBq5nN8e9zmleUqcCKykHwguQnmxubVqaEJCE
 ruBhNpuRTunWCiDDPp2C0jnfvkkX5x3UcI6TbbEbMch3jbK8d3iU94bJ3
 2Goy14kgTTTiIEIkm53iajVsQ4r6H04XF7vjA7Xofx0zYm2Z9QZUGIAdN
 4qviVezsegTdhqb2ua/D2mdoco6YMaC2jjj+8ZYhnOv8W12mBU+g35Rst
 jrm1OcGvu0P6WWl1pj9UNTuiEkYSwbfrwEaC6Gqu25CvswkUStjs8YGec A==;
X-CSE-ConnectionGUID: kS1o/8xaShWqv0Y7H1sgRg==
X-CSE-MsgGUID: UGEsVRbMQUecIvzEGNWD/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4168515"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="4168515"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 11:26:57 -0800
X-CSE-ConnectionGUID: uUEIdIizS2e6b9DP1MEzUQ==
X-CSE-MsgGUID: bRbwLJiVTMiiyLapVT0B5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; d="scan'208";a="12596896"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 11:26:57 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 20 Nov 2026 11:26:56 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Fri, 20 Nov 2026 11:26:56 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.16) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 20 Nov 2026 11:26:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yYYWZKLwYVJvXgh+4dn177iuJ6itghP5Z7gMjuz5x2WM2rGtvzWcDG5bw8Oe5AY8EsEFfKyT1EgIhvWqlJ8qrckjl4MWb8DbKrmV7fJR1oVzDEkBuWH+VUYVqVox85Q+TYSI0L0j+9drTq/Yo+JYCcmEagi0gb4YkHr0hHsKA3nVeu3Lm6BrKjuEaBL7Y7WYpT2DSGqrnIsP+OwWezvwF8UhKEoaaeE5ZS13bgyA1A/agr8zH57xDgZPrS2eVu1cqH/PtolYAv/GTU2i6EoZserJQGZWkjR1IY5iLTaKTInqcGPZqs0z2TcmkWoxiWvPyzv7idEJHcSr6Dj+Rmj11g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NYtisqfZWbm+odFhQ0It7frfwagdH0SYXbwldMFCkhs=;
 b=PonIn/QQHs4Xyq7nxKhY7yJMSvGjfYLrMpN44ZVS4NYoWMnO9rbVPdw9rO/6OvE4NbPb0Ul/uyu2xyDgmwUbah2c8khDsZrwJ0ZLeSpjMaQWb/DsYgcs7/2mrOvt3FQ1Qq/PST5uCjxRCYHAz/2/4zGXpuuuszC12w1H54Yt4DMeIxxgFy+j+pIYDp1GbCq8a2FprdXbY5diPDV4PqtM8w0NwzfcA+swvRRZuLIA9oo5gwbJUAg5uMcv2HJTdXJ+PLskzCmVL3NEIFMu218vueinm9dGfsdj8N6Nv2TVYbLPwd25qAwwmvzd1UUB4LZIwaLXIKDlud9VEAMCsHjSYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NYtisqfZWbm+odFhQ0It7frfwagdH0SYXbwldMFCkhs=;
 b=gMSeQjaIjIqdOI2ivB61TrPDq6/tGWNcoXnduuyvUqo0gVIscUgVjIbYek5nx+9gTysw6mjUBB8wcqaPeGEuIjtjrVkcmIQuc2k1TwMU721KnKKdjshjf9Efty7Z6Wt1w6IHIfGgaG+cKN46B9WUxWbSanA8QPSVrZFno8QxaC4=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by PH7PR11MB7076.namprd11.prod.outlook.com (2603:10b6:510:20f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 19:26:45 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0639.011; Fri, 20 Nov 2026
 19:26:44 +0000
Date: Fri, 20 Nov 2026 14:26:39 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
 <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>,
 <matthew.brost@intel.com>, <thomas.hellstrom@linux.intel.com>,
 <airlied@gmail.com>, <simona@ffwll.ch>, <david.e.box@linux.intel.com>,
 <anoop.c.vijay@intel.com>, <badal.nilawar@intel.com>,
 <matthew.d.roper@intel.com>, <james.ausmus@intel.com>
Subject: Re: [PATCH v20 03/19] drm/xe/vsec: VSEC requires soc-remapper
Message-ID: <awCe73VTezspXdbU@intel.com>
References: <20261120021929.473553-21-michael.j.ruhl@intel.com>
 <20261120021929.473553-24-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261120021929.473553-24-michael.j.ruhl@intel.com>
X-ClientProxiedBy: SJ0PR13CA0104.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::19) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|PH7PR11MB7076:EE_
X-MS-Office365-Filtering-Correlation-Id: 84a6c550-cd5b-4cd9-807b-08df473c362e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|22082099003|18002099003|11063799006|261026140227099003|4143699003|56012099006|261022105027099003|261028144727099003|261021121427099003|261009223027099003|261102123227099003|261026121527099003|10067099003;
X-Microsoft-Antispam-Message-Info: RtMBcjfPStuNI/ghEcaDPHHgbtjzdV6Wbx75wKXkjZD1AdoFOquRbFw4acGZtXAq7CG7aHRqdFWD9DU5nCB8Te06+72WeSqVMAVw+oBMVqXAFiQv1MVJgE6QPI3XqKPVYS2tsu4DV6vqmx/tq8PqZYbb9zZeu7MwZ+OfHDlwDuVKM9SlJxyuShE2MGfwCGCJwMCQL+Wfo1Yjq8M4o52qhN8NqgVW4Kylm7s2KkCEpQ5BqE8Zjkko72SVu/waqfZeZorpkCox0Xb2SCyeYYzMtfcgRplu0drCfcr8x9eiD/KDuYpJI0S7eAkN4NUmSnFXcYCrKMkTihK5L59O2jczrBsLGlPMrPnOBtdtyvvyJV9uVeP/jKZZPs+teWJyQEYhVR5m04pEkykkgOFFUJUUKWEqhV1LNclKUc7sc2ZshtWg0pT/dBMT9HoBVCyen/JchVfmgVxrywC8P1vddUYx0mzerbRtinOSluCzS4E4LvuQ5iFAq10si4w7bvJPyHMI3GjO7Aux64Y2VJwpNJXI/hZtOCVfCaxSusKGLooaVMgmf3FdKLLGJLxD2GyL6wv2cvN0pgeIVO4AZeaYt01nfhJsyUupJ2Xd/tLxugQU66M+AR1u6jdkMn1gBRx0+V+hE+s/9+dwfeg2SVx4fFdORANfqN/9cnG/21DTW4acE9E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7187.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(22082099003)(18002099003)(11063799006)(261026140227099003)(4143699003)(56012099006)(261022105027099003)(261028144727099003)(261021121427099003)(261009223027099003)(261102123227099003)(261026121527099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?75fsEkt89+nYaGr6wt2k78Fs1z5RlJGIAoP579zVLCRknznbcRrMY9nRgnkw?=
 =?us-ascii?Q?rt2+fwb4camK7hKBmq7Eeee7heBqyI/7fXCV0JVdRj4yMGP4YWVl5xS6lTJ0?=
 =?us-ascii?Q?YU2pv2EPdm9KH/OmJKAtJ2a9OOutF7UKAxab49ETOC0683w5H5+zRD5kvt1G?=
 =?us-ascii?Q?w5NLn68/Dc1aCG16MWdL2gXecGMN+rZJJykUwFDQdsK7Wzm2eTlINAiXE038?=
 =?us-ascii?Q?9RIB6J4SQ2YW4RzUCnD5/XetOOQtM3W/gyxQFdElJGH8yFelo17sX/MOnSYm?=
 =?us-ascii?Q?XWf7B6oDvRLjFaP2FwQkCjJAoRJ+7rEHfGfh2WKpZxAIDmdU05kQn/kPBVHh?=
 =?us-ascii?Q?IXrA6wE10F7voBsLOvDvNVRXXdpVnJETaZrYtD+U72JyAZHYXmOhPILmq7MD?=
 =?us-ascii?Q?3M1RVQFA0bv35JFHcOAmzuaDIYhxC6dfiVPPxLTh9NB7770tH5TCtXfyjUhN?=
 =?us-ascii?Q?OwnbdRdfKfwjuPiQDwaJuRIORIdkA1m3uUVn6fe9oia7QTsjxauDA8HBwC2m?=
 =?us-ascii?Q?eutbPkt2g2+Ddf3l2s2j0GoU9YqsYEyMaJQEjgc/GM4qthHp4r6Dmz+WlgNe?=
 =?us-ascii?Q?h4wUh83+fBlD4ECzjQjhb0eJJbCgx0Rr9PrY2ZanD7zFPgPUPNKVksFO0fSp?=
 =?us-ascii?Q?uqbfxYksTMidoOaD+daq4EZ73/BYhHxPidtLa0YwPN8k+7DPiM/+NRipvxMg?=
 =?us-ascii?Q?yDXe+Aa0bELtMuuUyQHxsyXDlmIr4p4UGRw8D5vyu7RCEVVXCDOTdzcCNH2Q?=
 =?us-ascii?Q?golo/IfHCUikkkjikbmNZL6D7E8KwZnsHicKdjbys3+yGyyfsEM4lXEsMold?=
 =?us-ascii?Q?/8pQvL4eY8RJ40/vhNOf3LRfH0Ccbr0eX16EE2w0I0RfAuBOHXCGjgAX2DqA?=
 =?us-ascii?Q?femGwPFpaJaO6waGhdbb+o8KV1ToiuLjrtb/sRVz9/um0E+TBR1THOBA6n7n?=
 =?us-ascii?Q?y3PnD5MOvt3HLv9d+p7RQLlLHr4ImwY9vN4HeOuDIKOrUBHd4OmIU82a62/B?=
 =?us-ascii?Q?omhY0kv/qtsiwxKvCHfO8qIRwjyEBHWN30TiYHeP0Z2MutrHsGuCp326JxIC?=
 =?us-ascii?Q?lzvTbMFBWBvstFK+SdEMpQFLZ8b+xJzmHGrQ2+18OAx7UMMgLEiiso2Xp2xk?=
 =?us-ascii?Q?C5/gks+jzm8AVWqrqjLOB/DFGv6h6gbSySdCot6MD/t+3nIKBzjKbjsqy9+k?=
 =?us-ascii?Q?+blm8c0XQc2gHFHsZzSWR6eoRuMvoRh5TZXEYOXk+4DuziM92Qr1BL5Hl3Xn?=
 =?us-ascii?Q?tEgimcdDixT6S8uA972n5ozfCwj6JgkYjQXMWExZPzxyWxhtoLCqXqLrZz99?=
 =?us-ascii?Q?ygg1jfzjsvKC99mTi9+DZhVEwZIA2Ryu4GhHMoZZWldzDL9JiWC4Bir2WxjW?=
 =?us-ascii?Q?+9gb0huAUO07sR5WSguhVO2xs9PyWiQizuWfd4Mx/Vkhf9IpulbDybHx3xij?=
 =?us-ascii?Q?UteQYSWiWvLzHomb0amAjmb+45NNAs8Zg9Wcxtwt5zZzH3XsPAlX0Onw9uxw?=
 =?us-ascii?Q?5frw01GOktr+LBSmZhaEFjHG8htu5TtCDkclxOCRUEdbCyQj8RxEwccZkKyR?=
 =?us-ascii?Q?Xv2H8k+LcwEFV9R5adsNyw5C+YEHN/GrKcI+IUTBZplymom6l/Hr3ByRSCb9?=
 =?us-ascii?Q?GjK/M3qkln7s8924smz0hGS5OGhKdHVUdK7gTP89KVWOnkxf/lBRkZ6jVt9C?=
 =?us-ascii?Q?1StGINXkqL5dntyMlDFc8mvby6/BCuYIGpA4DvHf880XREmy93MVYoOrYSba?=
 =?us-ascii?Q?R2H0NSzJOw=3D=3D?=
X-Exchange-RoutingPolicyChecked: GRFQyywXjoWEKapxXaA/ojj3idI9QXkqjL05jmISUVQjGrbvjJmBTQ/NKaMF4i8UtUL9orsFCI2i8EIBmwiiH43NqM2RmnWBTo1mMKTn55ktZ1dDAqmWcQkT2u+uFLzo6tYfUUOp2W2cCiU+IY6RGLbpYWhYhcwtN4no+Y3SPvD0EDKfQ97n1xxpjgK3PvHCXXJt+Rv7JkWPPCXS212mkONb3BL5saKHLm9MMqqf69xPJXlxa8gJJlPNFKMyM/0piX2hcNj/IM1xD4segJpnhR/Tww4GlvnQtFoSUmclJlheQC/e/HW9qv6u71hS+LqdihRHWpgJgHjJox0ZMcKP8Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 84a6c550-cd5b-4cd9-807b-08df473c362e
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 19:26:44.7446 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r1IprSQGh4IMKDtRFNWZ9QptIUmcksScTR3KJ73XQ+9JugtuGyFnVK4b5+ae0lf3Btj0Pbmdm3BkvlqWTBI4sA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7076
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 19, 2026 at 06:19:33PM -0800, Michael J. Ruhl wrote:
> Survivability mode includes xe_vsec_init().  VSEC requires
> the soc remapper to be initialized.
> 
> Add the correct init to allow correct VSEC behavior.
> 
> Fixes: 32eab46a6160 ("drm/xe/soc_remapper: Use SoC remapper helper from VSEC code")
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_survivability_mode.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
> index 91a0680e449b..10f9de4eb03b 100644
> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
> @@ -21,6 +21,7 @@
>  #include "xe_nvm.h"
>  #include "xe_pcode_api.h"
>  #include "xe_printk.h"
> +#include "xe_soc_remapper.h"
>  #include "xe_vsec.h"
>  #include "xe_wedge.h"
>  
> @@ -354,6 +355,7 @@ static int enable_boot_survivability_mode(struct pci_dev *pdev)
>  
>  	xe_heci_gsc_init(xe);
>  
> +	xe_soc_remapper_init(xe);
>  	xe_vsec_init(xe);
>  
>  	if (survivability->fdo_mode) {
> -- 
> 2.43.0
> 
