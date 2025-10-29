Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93A70CCF9EE
	for <intel-xe@archiver.kernel.org>; Wed, 29 Oct 2025 18:04:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 577C510E81D;
	Wed, 29 Oct 2025 18:04:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aWYpH6kj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D37B010E81D
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Oct 2025 18:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761761069; x=1793297069;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=b9kcwcAouvB7W2ZaqBg0xL7ErroNuWA89saaLJ4eTNI=;
 b=aWYpH6kjEGY7jYBORTiFcdXF6t7X9bqmvfWl68HVk9mrEIKQk/+uLjDU
 ALXtYCfUo38L2mAPFs1qnW0MdtrKBAmBMKSRZCjPzmtyeKmSfIhAaeFwK
 ldjgQ0cMFpnigJSWDT2nqypg4PwRM0mHdzc7UAHETIQ2Jg6Ek2HwOTn0l
 wMXNrjXOf9yrgdq3O49iclpXOmo+/IEdIGyYtVfJimNLJTUGcICfPVkOp
 zLSBxhdn862jyk2N2MsFZJ7nF1LAhcnbT5Glm8JZSs0+qsbqBglVaNDfh
 6UL2YY7gUgYipR/iXgwYpWa/jRzdYjDlJZv9D2tzT5Cy4MjE95BEyIdfK Q==;
X-CSE-ConnectionGUID: RyD8ycfaQQaJvH8OM3AkHg==
X-CSE-MsgGUID: M58i/LsmSIC//GP6RHWUsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="62916685"
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; d="scan'208";a="62916685"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 11:04:29 -0700
X-CSE-ConnectionGUID: SkfzC3e7TcCJfxPIbtxLpw==
X-CSE-MsgGUID: 9HpQTTsKTBWA8AxK/F+ALw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; d="scan'208";a="190908526"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 11:04:28 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 29 Oct 2025 11:04:28 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 29 Oct 2025 11:04:28 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.29) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 29 Oct 2025 11:04:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=klmT7NL3/n3yFFIePCwZb5WAAXNHlWh8OwGe7GWBR7+f5fGRwS02/HCzhk/It2oCnP5/3GbHIBlM8vs2CijtE7y/XtUvElthB3JXLMnvW11X7mi/UefCVfJmHeNtvnsO3TZxJIxQ3YoPErydwtwWscoNaevpIcJRrRcd+BNA+VrHUT50iVJTYTGPqwkTuWo7a3Vpgz9p/WPSFY2HZX6tfSmzoHO3NkbxYk5RYnDE/RYp6mnc+2+WwVlGiimelk0xMiluT+vln8op28GRTdPG/kzALD9IhOWBXm/+NwsSi8WL9afBgzpHQ7IBGXUZB7HpI4nlfJurIm+VW5qAAGudaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jeeb4CVDC5EcMfoUVhVPfDnUyX2iHcHNY4VMcPMT9Mc=;
 b=AR0YoBsP7FS9YPKGexlyEu/rgH6F6MLLwf4fpgkhgyeAFhlSHJk8TfrM3EoF1KLo7b6EYQVhHWatnUB8ABicbxNqWnukvE+7plqJthxQri/i5uM5jEcFbYIR15El712O2sWvcTNVGk9hyf4UwG7xwiXACxkET0Vyh/5aSmOBfHrZJeRvn/r2cR4FOmVEe9xBczHw+d1xKva4qfllhfbQQEegJrGX/De6xdcfxdFpYnWNEnApq1zKxQkaaZdrlOzg96nMjy89f0d2QWH4WIquIqxyYkoBkFRwRUsaSV4ay+eTJY0D0REdx8z7FjcuklMn4y3Ysbjq0fA3Q/y0SMHD2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by PH0PR11MB5781.namprd11.prod.outlook.com (2603:10b6:510:14a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Wed, 29 Oct
 2025 18:04:24 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9253.018; Wed, 29 Oct 2025
 18:04:24 +0000
Date: Wed, 29 Oct 2025 14:04:19 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Sk Anirban <sk.anirban@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <riana.tauro@intel.com>,
 <karthik.poosa@intel.com>, <raag.jadav@intel.com>, <soham.purkait@intel.com>, 
 <mallesh.koujalagi@intel.com>, <vinay.belgaumkar@intel.com>
Subject: Re: [PATCH v5 1/2] drm/xe/guc: Eliminate RPe caching for SLPC
 parameter handling
Message-ID: <aQJXIw7zBBy38Dhi@intel.com>
References: <20251029112014.3747915-4-sk.anirban@intel.com>
 <20251029112014.3747915-5-sk.anirban@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251029112014.3747915-5-sk.anirban@intel.com>
X-ClientProxiedBy: SJ0PR03CA0054.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::29) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|PH0PR11MB5781:EE_
X-MS-Office365-Filtering-Correlation-Id: c5fe9fd1-4f5d-440b-5fae-08de171597b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9gESnHX+o3D5tJh0u18hJjn4uXI+Vxhojle+n27HrNqqDbeefTYefBRTvoIZ?=
 =?us-ascii?Q?hf2FhG4tODmaIL9RxLkKithnNU43JEnbTmXFLeqGLCxT/Y01YahG/2F2Pu7/?=
 =?us-ascii?Q?yxAPF+AOzCg8rT1PDb5cRkCCEOjpN+vSlxX4dkeoWj36LOUtOG3CeDY2n7SH?=
 =?us-ascii?Q?AN/7C+r5w3dkCKmx4rCMJ1Z8/kXugRwbEwc+AzS7ZQerJdbInKM0aGrKgr3L?=
 =?us-ascii?Q?EtRjVNJMAPr1B8jA0fNATzIL50JPO12M102aCahrR/PfSpFefTXczMX9+1Gq?=
 =?us-ascii?Q?5FeFv99hARi+1xqsK/fAgoOBm6sJu0oaMXyoVSo8isRdHrYbnvk9zuX0NpzO?=
 =?us-ascii?Q?wsvWctJmmjwNwpw766WcyreSjZlXwOYfXAw8boLE+OAvf4JtR+ulFiqFYpjj?=
 =?us-ascii?Q?bQarjugAwOt31WnKFTO5TMz8oZueyuVe+8Y31FIhGXAXT5tMBSjV07dag5Bc?=
 =?us-ascii?Q?roPLY+iKKex9gV07NPdz4dPhQB6kVf4go/307tJZPt4Xpjfwk9tTJk2qww/x?=
 =?us-ascii?Q?Ng9omCLu0zBLM2nwynAHKAJ3eBB55ExsephfFOxvMfB6TQXoOzHm2hWFqPTL?=
 =?us-ascii?Q?92RihHDq6vMWCUu3VINjGq3Ozs9VPq9py+PHgeITZAUrhZByXtpVaHBeZtRD?=
 =?us-ascii?Q?Pbt6eLhbXtY1dj5v4FGwipGeb3GMVmpThqdGQZYNYEVOXoQvJwVf5hH8cAJH?=
 =?us-ascii?Q?BhNE+JxER4eswOFV85wBYjYQUjE6tntt0i+yhouMxIuDR8sZJjqTotgl5s84?=
 =?us-ascii?Q?d9/qXQW3+ahWq8V+s6a2cy4Ec8KEOMALp8FyNY3rQu5UskZeJ4pun+wIqyJE?=
 =?us-ascii?Q?Ta4KQMKLMlCG8r72JNxSegosgx/wDRABGDngLOLoLA6Ex6i28lBc/J+/Krv1?=
 =?us-ascii?Q?orW0MFG9n20RssUjJETf53NTkWoz5Uml60ZIeAtqBTWbnrvIVQPnQVJaYDJg?=
 =?us-ascii?Q?2kyCB1/Qm5COkX4cncwrN13xW3owLql/2hvSksB4bTmeKRSRmTabllR4FQXe?=
 =?us-ascii?Q?s6uAOITtsiLY3BMLlzPrE3Kqr3P+143jJ8AjEYKvhpQDWj/LWKEon8F/Poyd?=
 =?us-ascii?Q?N11w8UTWV8Rkb7VzOwJWTlL1KOoIVq0ltCPdpBDlyl2Db4qJYKJ9J2XXqYMi?=
 =?us-ascii?Q?C6kEZ/9VW9t/ZjGB+G0K+lRxqN7E2ESwXj5L0XPxqmNRyWl4HaNsh4Eh3tlI?=
 =?us-ascii?Q?DhAnncOk9wLtA7nBHkY5Si5CgWnkAkp6lbGm4lKU5gkuxC2F0ru6NNEfxzpJ?=
 =?us-ascii?Q?cPxDVgWWvBTs5BjxFZr75Oh3+M5D4JcZEN3wcUvgWj1RypOboBpOWk21c+Px?=
 =?us-ascii?Q?GG/B8OoSzXx6V1CPs3ljTYBADkk66TmGVQyInAdkkX0/etfKlHuPFtGHcqck?=
 =?us-ascii?Q?4y6rcNtCG656Brntz9xQ2KrZvW0ut2O4EVhuqxXPq1iFIBmyew=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?99m7GTJge4D/9qOcTFSHHuwuHpD0PV1Mamy1lWnyrbTvM0F5/E6WyEn4sc7O?=
 =?us-ascii?Q?UG+p16J1+iLQyd6MrLj/ZSfYDV/FyU3fWCy39lHbe/YGUm/vlY4hThlhq7Zh?=
 =?us-ascii?Q?0XmuEwjMnhfIdJkVWx1DPW6JfXfREcDprVnCCjZ8RA0NOMz03ls1j54BcJ48?=
 =?us-ascii?Q?ZnDrmvZaR2/DFp3kiIncgZfaLvYmZlwagb5QMZwIKauZkz43GDaUlUY4XeCo?=
 =?us-ascii?Q?a6GfOk0wk7XhHSOg1v/pvRUm9R6Lr2OprcMGNgQNJ8ADSRIcVyyhtQ5twaUp?=
 =?us-ascii?Q?GuiVAwX8oNt8GwRrIlgBxSd8hqYLfN9DyXqT8iZnmyGqvrSZgAWL1OFRNrOJ?=
 =?us-ascii?Q?LB+gh+geqHnAIEYqKgrs5Jx44PZYGMRXWszLa915ODaZIorQroVsO2NaSxQl?=
 =?us-ascii?Q?5U25kbYyBPk+plwJAYiQ+DYJYWhpruezjklrPmAdJmBibm2ROHkZsH89zsIi?=
 =?us-ascii?Q?LI6pyernMlTIDV0WrsETZzXUOha1a777qZsGuXh6k281zSCOKmIOSg3UJISa?=
 =?us-ascii?Q?qws/BBCuv8o6yMhewpt0crD1EKEcuiG2rxA4/YfjnWWILLm46jeA6suW4fSs?=
 =?us-ascii?Q?prUHPqwUXx8VvdJPUo0elpQYxz/r3pxIqrkSfBsfCfwRYIoOdorIl5vKEGTq?=
 =?us-ascii?Q?1fWR75wt+peoHoMXt8Bvxsr1WnrhLGVAAmJWEEWTSxwVwK5gGwWIdZktBQ1V?=
 =?us-ascii?Q?SltGDhHHd5SUB56aag276xuFqITWRgouJOYVXo5zvJ7BgsE1vmswE25CwSn9?=
 =?us-ascii?Q?q6kGHMTGDiFsvauoRCjtjl33w6mAMBxzAtbRiLjXXinC9vm7+5RizvjypttJ?=
 =?us-ascii?Q?1/OTf+VXavR0Slo9ZgZZVvlP5C3yJwVqIy54gBXEbTnrbsG3ucgwmqGp+jVd?=
 =?us-ascii?Q?1C8x5iRJojHOTLj6wINpHsE6jN2e19nblec9CLBMl4nfSZ8YpfWK+0ep5RR8?=
 =?us-ascii?Q?RpLSbkSUjUDErtxscRoOzBx6IRmTsfLfmOmbd1e4dQmXJZpSnMXfX1Oopyxb?=
 =?us-ascii?Q?d0I8fkLdVUJ1hm8i75dAUwIT7G6s3meH063OoV7F3SQKnFA8NZdAEvvW95r5?=
 =?us-ascii?Q?Qmef/XbApppqqlDJ43fWvBXQQzSJZmlIPpNooXMuThZsyKzWw/T6WNwRL+/k?=
 =?us-ascii?Q?X3WP0jIprebqLwvi58Z4vyORVpatTtHqNT7NoiTccSEJNzQH99xl5NcNAcp9?=
 =?us-ascii?Q?D8F/B3GGQ5wavbqVfyF/Ab6Bu3AszoRS4p4y9S9KBM8c0nb6jMKO0Rfoplzz?=
 =?us-ascii?Q?WKFOtdrk4fF0IX2mAKws+9pagNIp0IFYH88BMVjhFxVZrhQoUBhKonfMsrru?=
 =?us-ascii?Q?pKaOmf5ElfEcP/u81Zt5VzaPZZHHZ2AGcKvrUaxWQnI27z+QcMb7utt3S6YZ?=
 =?us-ascii?Q?ylpEwv2ZeiY7mPryjSzJ7OT0P8vF/65FwZGpHgS+9TyuW2Mqcd6TgKH63YTQ?=
 =?us-ascii?Q?Mr5AbEk3GgmwqmF815+6WpM+hIrinWFFoAj56wF18vVGS9lCypxPNiDZnk9/?=
 =?us-ascii?Q?eTSoqVUNz5Pc55ZVMNlr2/rEDQekTA1VolNaR284c8QuzPJ25Vk8r2eWihim?=
 =?us-ascii?Q?J/sEjrkWDOkQzjLz9zw6NSaI7v+yoYY1gOuhWuP3wz5vdGOYW9uoRvVxTv24?=
 =?us-ascii?Q?Uw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c5fe9fd1-4f5d-440b-5fae-08de171597b8
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 18:04:24.3390 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YKltWiNwyeugBi7IECo6fSrUzQybLDJXw/O+PwTc0l9UO1qPW77EIz6qcXLis70vGlOGQ8Vi4SZvsAm7t3mADQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5781
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

On Wed, Oct 29, 2025 at 04:50:16PM +0530, Sk Anirban wrote:
> RPe is runtime-determined by PCODE and caching it caused stale values,
> leading to incorrect GuC SLPC parameter settings.
> Drop the cached rpe_freq field and query fresh values from hardware
> on each use to ensure GuC SLPC parameters reflect current RPe.
> 
> v2: Remove cached RPe frequency field (Rodrigo)
> v3: Remove extra variable (Vinay)
>     Modify function name (Vinay)
> v4: Maintain a separate function for PVC (Rodrigo)
> v5: Update RPn while fetching RPe frequency
> 
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5166
> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_pc.c       | 75 ++++++++++++++++------------
>  drivers/gpu/drm/xe/xe_guc_pc_types.h |  2 -
>  2 files changed, 42 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index 3c0feb50a1e2..08deaa64aa85 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -330,7 +330,7 @@ static int pc_set_min_freq(struct xe_guc_pc *pc, u32 freq)
>  	 * Our goal is to have the admin choices respected.
>  	 */
>  	pc_action_set_param(pc, SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY,
> -			    freq < pc->rpe_freq);
> +			    freq < xe_guc_pc_get_rpe_freq(pc));
>  
>  	return pc_action_set_param(pc,
>  				   SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
> @@ -375,7 +375,7 @@ static void mtl_update_rpa_value(struct xe_guc_pc *pc)
>  	pc->rpa_freq = decode_freq(REG_FIELD_GET(MTL_RPA_MASK, reg));
>  }
>  
> -static void mtl_update_rpe_value(struct xe_guc_pc *pc)
> +static u32 mtl_get_rpe_freq(struct xe_guc_pc *pc)
>  {
>  	struct xe_gt *gt = pc_to_gt(pc);
>  	u32 reg;
> @@ -385,7 +385,7 @@ static void mtl_update_rpe_value(struct xe_guc_pc *pc)
>  	else
>  		reg = xe_mmio_read32(&gt->mmio, MTL_GT_RPE_FREQUENCY);
>  
> -	pc->rpe_freq = decode_freq(REG_FIELD_GET(MTL_RPE_MASK, reg));
> +	return decode_freq(REG_FIELD_GET(MTL_RPE_MASK, reg));
>  }
>  
>  static void tgl_update_rpa_value(struct xe_guc_pc *pc)
> @@ -408,24 +408,22 @@ static void tgl_update_rpa_value(struct xe_guc_pc *pc)
>  	}
>  }
>  
> -static void tgl_update_rpe_value(struct xe_guc_pc *pc)
> +static u32 pvc_get_rpe_freq(struct xe_guc_pc *pc)
>  {
>  	struct xe_gt *gt = pc_to_gt(pc);
> -	struct xe_device *xe = gt_to_xe(gt);
>  	u32 reg;
>  
> -	/*
> -	 * For PVC we still need to use fused RP1 as the approximation for RPe
> -	 * For other platforms than PVC we get the resolved RPe directly from
> -	 * PCODE at a different register
> -	 */
> -	if (xe->info.platform == XE_PVC) {
> -		reg = xe_mmio_read32(&gt->mmio, PVC_RP_STATE_CAP);
> -		pc->rpe_freq = REG_FIELD_GET(RP1_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
> -	} else {
> -		reg = xe_mmio_read32(&gt->mmio, FREQ_INFO_REC);
> -		pc->rpe_freq = REG_FIELD_GET(RPE_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
> -	}
> +	reg = xe_mmio_read32(&gt->mmio, PVC_RP_STATE_CAP);
> +	return REG_FIELD_GET(RP1_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
> +}
> +
> +static u32 tgl_get_rpe_freq(struct xe_guc_pc *pc)
> +{
> +	struct xe_gt *gt = pc_to_gt(pc);
> +	u32 reg;
> +
> +	reg = xe_mmio_read32(&gt->mmio, FREQ_INFO_REC);
> +	return REG_FIELD_GET(RPE_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
>  }
>  
>  static void pc_update_rp_values(struct xe_guc_pc *pc)
> @@ -433,20 +431,10 @@ static void pc_update_rp_values(struct xe_guc_pc *pc)
>  	struct xe_gt *gt = pc_to_gt(pc);
>  	struct xe_device *xe = gt_to_xe(gt);
>  
> -	if (GRAPHICS_VERx100(xe) >= 1270) {
> +	if (GRAPHICS_VERx100(xe) >= 1270)
>  		mtl_update_rpa_value(pc);
> -		mtl_update_rpe_value(pc);
> -	} else {
> +	else
>  		tgl_update_rpa_value(pc);
> -		tgl_update_rpe_value(pc);
> -	}
> -
> -	/*
> -	 * RPe is decided at runtime by PCODE. In the rare case where that's
> -	 * smaller than the fused min, we will trust the PCODE and use that
> -	 * as our minimum one.
> -	 */
> -	pc->rpn_freq = min(pc->rpn_freq, pc->rpe_freq);
>  }
>  
>  /**
> @@ -560,9 +548,30 @@ u32 xe_guc_pc_get_rpa_freq(struct xe_guc_pc *pc)
>   */
>  u32 xe_guc_pc_get_rpe_freq(struct xe_guc_pc *pc)
>  {
> -	pc_update_rp_values(pc);
> +	struct xe_gt *gt = pc_to_gt(pc);
> +	struct xe_device *xe = gt_to_xe(gt);
> +	u32 freq;
>  
> -	return pc->rpe_freq;
> +	/*
> +	 * For PVC we still need to use fused RP1 as the approximation for RPe
> +	 * For other platforms than PVC we get the resolved RPe directly from
> +	 * PCODE at a different register
> +	 */
> +	if (xe->info.platform == XE_PVC)

I believe it would be better to convert this to the graphics version here
instead of the platform name. But no block since it was already a platform check
above.

> +		freq = pvc_get_rpe_freq(pc);
> +	else if (GRAPHICS_VERx100(xe) >= 1270)
> +		freq = mtl_get_rpe_freq(pc);
> +	else
> +		freq = tgl_get_rpe_freq(pc);
> +
> +	/*
> +	 * RPe is decided at runtime by PCODE. In the rare case where that's
> +	 * smaller than the fused min, we will trust the PCODE and use that
> +	 * as our minimum one.
> +	 */
> +	pc->rpn_freq = min(pc->rpn_freq, freq);

setting rpn_freq inside this get_rpe function makes no sense.

I'm sorry I forgot about this when I told you to kill the other function.
It should stay there, but be called update_rpn instead...

> +
> +	return freq;
>  }
>  
>  /**
> @@ -1021,7 +1030,7 @@ static int pc_set_mert_freq_cap(struct xe_guc_pc *pc)
>  	/*
>  	 * Ensure min and max are bound by MERT_FREQ_CAP until driver loads.
>  	 */
> -	ret = pc_set_min_freq(pc, min(pc->rpe_freq, pc_max_freq_cap(pc)));
> +	ret = pc_set_min_freq(pc, min(xe_guc_pc_get_rpe_freq(pc), pc_max_freq_cap(pc)));
>  	if (!ret)
>  		ret = pc_set_max_freq(pc, min(pc->rp0_freq, pc_max_freq_cap(pc)));
>  
> @@ -1339,7 +1348,7 @@ static void xe_guc_pc_fini_hw(void *arg)
>  	XE_WARN_ON(xe_guc_pc_stop(pc));
>  
>  	/* Bind requested freq to mert_freq_cap before unload */
> -	pc_set_cur_freq(pc, min(pc_max_freq_cap(pc), pc->rpe_freq));
> +	pc_set_cur_freq(pc, min(pc_max_freq_cap(pc), xe_guc_pc_get_rpe_freq(pc)));
>  
>  	xe_force_wake_put(gt_to_fw(pc_to_gt(pc)), fw_ref);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc_types.h b/drivers/gpu/drm/xe/xe_guc_pc_types.h
> index 5e4ea53fbee6..f27c05d81706 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_pc_types.h
> @@ -21,8 +21,6 @@ struct xe_guc_pc {
>  	u32 rp0_freq;
>  	/** @rpa_freq: HW RPa frequency - The Achievable one */
>  	u32 rpa_freq;
> -	/** @rpe_freq: HW RPe frequency - The Efficient one */
> -	u32 rpe_freq;
>  	/** @rpn_freq: HW RPN frequency - The Minimum one */
>  	u32 rpn_freq;
>  	/** @user_requested_min: Stash the minimum requested freq by user */
> -- 
> 2.43.0
> 
