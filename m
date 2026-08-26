Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAD28C61DBD
	for <intel-xe@archiver.kernel.org>; Wed, 26 Aug 2026 01:02:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82B1310EBA5;
	Wed, 26 Aug 2026 01:02:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OdF7jPjH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 139B010EBB1
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Aug 2026 01:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787706135; x=1819242135;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=RTMdr+jNwZZw0vYYO0Whc+bZhjqr5GvVLLtI0Yk/iF0=;
 b=OdF7jPjHv3NeIy6oMZPQnuZjSrUkHwLmGxgOTgKUW/+9tIRYYjFr0LzH
 2kOezP6FivKq/xyLuPBBwoXfLhbkmKaT/ks2N5QlDb5CYow8XA8ytAvvR
 F6HFeA8O09VYEs9EQMvmeGG4TkmSI0p1ZOIB6f5AVE7aBbL2D1NBQBj+g
 qymdCmfGLU4WoGj2GkIPgAEmLs8h1VDbV8E4B6ylOTk0+szGAFCxgbh0r
 8od91T/a1KFmtDdXH5BZQ1STePihlQWUXufdDeVfRb0vNdcJArRhM7NyA
 VYwbEpK9oo6x22ApetiVFWvvomNphtEGSp+7X+3+07NPuvDD1/J3KRTCA A==;
X-CSE-ConnectionGUID: v33pBjWtTWOoymZU2f63OQ==
X-CSE-MsgGUID: Kd6f1zsrSmSmTVp8k3aAAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="88104213"
X-IronPort-AV: E=Sophos;i="6.25,243,1779174000"; d="scan'208";a="88104213"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 18:02:15 -0700
X-CSE-ConnectionGUID: kgixSagBTEa6psgKeuQgUA==
X-CSE-MsgGUID: qQSzYkOySSK3uaXVxKO0UA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,243,1779174000"; d="scan'208";a="270923690"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 18:02:14 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 25 Aug 2026 18:02:14 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 25 Aug 2026 18:02:14 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.47) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 25 Aug 2026 18:02:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FQifDm6c46+CYDZZCFZFyGK1d8xcz5rvAFY6D3az6lPUEZA9SUJPuNt31V15RC6P/a7LJn+OzN75G7rWoc9nziiLZmzxOecF2mjAf4wRV3mAmqbGCH44dkZfHi1jUUXGyqs0LsKLU+BToRsYcaHHBHzOOKgK01J10pafkPObUIWTrIATI3DHjirgjnJ2r1ZdAkfo/qrJB3AXgppotPIYSPawGGlkK+tqSW+mnwK48l3B5/pef9NBhJFzcevmVvFPe28GOMqs5a+vsnWHEhF20H40TMPeoKzCg2JzFuI8PQcABBlhj+3zmmSxsGvZSBEeL1kwQ4Jt5k2EBVM47ON8wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OLIvJNl/cu5OWjUNSizgjbhZw9pJtjZLEHMwSZQzaj4=;
 b=hEwugf+QnZCQNej5LsfGKz4ZU8s+EuqmooF435aJBTsRDAKaxBZZ8fSVxQYLik2mNO2Q0a+0699WiiaM0hCxEvO0K5cHxKIKva80McLTNWM7uD8aSWKMMCMqe/CFUIF3cqQt/wBAkx7T6EET4MaWGoDM3gLTRX43n2O7F1ItU7mxxVPXHLKdYmMoNHpFoy8OfQBwG76m70Sw5FGpcANdYidIXd4Pvom8xmqPhjq6kbAGvB0S+/V1lHODo0CWoQ+OUw8yNTjimw8dqzM2y4PciirHGUXLPILnQ8FqPxwles+ggsXjCXMD1qGddR95Y41/Ptxnd/hRt7jN3GtpibHI5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7752.namprd11.prod.outlook.com (2603:10b6:208:442::20)
 by DS0PR11MB7405.namprd11.prod.outlook.com (2603:10b6:8:134::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Wed, 26 Aug
 2026 01:02:04 +0000
Received: from IA0PR11MB7752.namprd11.prod.outlook.com
 ([fe80::848a:3e54:c19b:11ce]) by IA0PR11MB7752.namprd11.prod.outlook.com
 ([fe80::848a:3e54:c19b:11ce%7]) with mapi id 15.21.0339.012; Wed, 26 Aug 2026
 01:02:04 +0000
Date: Tue, 25 Aug 2026 21:01:58 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <daniele.ceraolospurio@intel.com>, <raag.jadav@intel.com>,
 <riana.tauro@intel.com>, <mallesh.koujalagi@intel.com>,
 <aravind.iddamsetty@intel.com>, <michal.wajdeczko@intel.com>,
 <himal.prasad.ghimiray@intel.com>, <arvind.yadav@intel.com>
Subject: Re: [PATCH v2 06/11] drm/xe/cper: Log CPER records for aggregate
 counter retrival
Message-ID: <ao47Bm_Vbqn3c2bR@intel.com>
References: <20260825175916.1103841-13-badal.nilawar@intel.com>
 <20260825175916.1103841-19-badal.nilawar@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260825175916.1103841-19-badal.nilawar@intel.com>
X-ClientProxiedBy: SJ0PR13CA0115.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::30) To IA0PR11MB7752.namprd11.prod.outlook.com
 (2603:10b6:208:442::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7752:EE_|DS0PR11MB7405:EE_
X-MS-Office365-Filtering-Correlation-Id: 42cd739d-5723-457d-0ecd-08df030da498
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|6133799003|10067099003|11063799006|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: NnGVyAWg740GKUWosSw7XKPwXipHGoWsko1F8gXbG+rGEnnndZDBND9afiM3OhgP9NHmPf3NwM9Phc606j7P45ivwQhHjrYv1510hOpo2f7l/8ZKSZGsytMs34mD4Mcj/6dkdMgq0mIy3BYuH5+RbEbC8l1UEbaXAaPcG6ENh8PqB2AnSf4TK05E29W5K0Uu2izQvmHWAQokvNtJK0yAtrJ8LoGZdVtJnncXnmfxaryuDZCPI4RSMsbRNLZidxqywEGNMAi6/NHerxQvkFXyegPBbHrUOP0cgms1mR40QCg+AgOtdKdFUxkf7gx6ZTYOFKGk6rTQ/NCUKMG5Z6gsB0HHC/2K4KrHceK8x1u4obldhrqjmqxRowZa6+tZ3KAOeFunD/4fBqhu8vox25HiayIEJ0t35pW11lkPXTa8Tzr42To+l0MvKEpCbOL1/6exQ05wKq0Jkpe81xwFEjiBc9+c1tYhGUSoRGQ41tA5vNvo341fiXQD4XfBDExKYjr1NGRm+KFyr9zHHOc1pQPHSE8nKriSVpuOnBMn7x6QtnD7C73n/3OxunhvytBeHwotP7Ypkzumi2dOx9ecdC8ktCpl+oeDs8oOk838nhu4jk5JNyAHPR3E0M7iHg2f11hHA/6S+IVZjU9Tw3jy+W8aPxtgHD+IlR8BIh6Sf90EzAY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7752.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(6133799003)(10067099003)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Vn+7HYd/KS9CsxQbUG9FBY4yb2eGkUkMPmHLAqgvh3/CopODftBh8YYJxNRi?=
 =?us-ascii?Q?gnWXcvu4ygzKJbHGCEtnmMDqxV7TEYldnyq3eXCCF26vg5TOjT+Bf8ywQiKl?=
 =?us-ascii?Q?0nxco2cU61SyQuBRjJMkMtQvC01TBDErBXYeHYADilofRxZ4Kg7tXkqcvuQ6?=
 =?us-ascii?Q?PpO6YvHgQoGXoUOyuvIgv+9An70BPEVf6n80UBjxYhqTvOu4pxyiVdW970yv?=
 =?us-ascii?Q?Qe/y37I6LexvyBgblNPT6+2GN1+pKHMOc8frR8pCUrQFx008PQVKy9UPL+NS?=
 =?us-ascii?Q?jgLC3a9s2USwHvHX1AAbPEiJ2qSJuZK4DadbHSSEcNPEPvGhLL+WN20gm5yX?=
 =?us-ascii?Q?vxwKLimDIIvMWke7XLuEW1A+/hgAOZ3CtqaBjzwWdrqxLlj2rgxopcEPwRE1?=
 =?us-ascii?Q?fob3mLc9mE/ihYwRxlV8LiFVpCT5y//WZw3j7amaC3bYFblclA5nxqgikkWv?=
 =?us-ascii?Q?vj5aOlJ70FBfn02uL8ggqAm5q4JVLo7Y0HAcqIsgqHj9JkHk4r2fRlRsGvBm?=
 =?us-ascii?Q?7Z2gQudRtJgwqGjRcewAjymQK4QGPfIZTqrjwkLQKA8Iz0gMoEYFUwGK0LGe?=
 =?us-ascii?Q?8OP0eF/w4umvjXUWeMnxg76kJvPl1mtYcDkMF7bqE+Z+2h5TyciquB7vir45?=
 =?us-ascii?Q?L0ZMsWOfswKQkadA4vPJGDzrEFfqe46HP3kYJs0SV6EKT5L0BqFaci3gZ0W+?=
 =?us-ascii?Q?fCKqb9OOANFbbvc5w41WnHCtRYgGs3dx2+OiUoAxt4mYkUTXOl33GbS7FePk?=
 =?us-ascii?Q?i9ACSUdS9QTmDLqAqLdUUouqaTzK+Xg2viP3GEJI1f8OgTB+maFOXnWH4mDS?=
 =?us-ascii?Q?STD01G3lQl9R94dCvHW/aEKFPTAtAdBrE0796PZZqcG1xjDptT49mcuboag5?=
 =?us-ascii?Q?3s1JhwL0udyRn/ipSfoQuGTPj8fDcPOHDjMZgZf+UwSP/XEe5/izlrnO807t?=
 =?us-ascii?Q?4OaFiR0KdRlJGUfXiVc36APVymSE5TZL/KLMclTdsfgmoF9OAJRIdDBxLXR5?=
 =?us-ascii?Q?tfWBX3eGrlGA00/WO2cHfrhA9LP3uCjIZ7keBuLF8bA1LJTPo3gVwDvFJXcI?=
 =?us-ascii?Q?8rSP+vKRVXFfxjDdler23JGNeTO0E3aHbuvFdiA4df+5av9Hkrq4XbwBVkSO?=
 =?us-ascii?Q?9kj98+EN3IpclxP5MQan+nTqG3SIXqqUwQ6s9O82sP/BpWxoVQE6i+WXTEqh?=
 =?us-ascii?Q?tmuWqVOAO2w4e7Qkp7iyb2Az00e+OPdYcnUk2WNVLd+VqEtr52REbzYo49EU?=
 =?us-ascii?Q?osIOVt4cdjU47uUmQols3WL8uIOzuSsaVHfFXhIeYg1rniQqBSfiav/VblXp?=
 =?us-ascii?Q?t1exnJOV3JCFgSFehy3GNiWX/tz2tDrjwdrQdDRFLeHUAZ+UL/bbvXBOKogz?=
 =?us-ascii?Q?187Hd6UNiGAqp9H6iU9DajjA3V7DGwIE6hZPWjdt0zTA27a0GFge7UZMm77A?=
 =?us-ascii?Q?K3mCCClggMP3mPrbL+gHOWb2LL5mIEHGizrKCSNknyksgs5CVL29LIKXWBHB?=
 =?us-ascii?Q?8zlVDcpPgmNtb4XxFHOOYu2Fd0funQ3NazadAedKNhmCxYARmXdQ1OsI0WPz?=
 =?us-ascii?Q?mMDZkJBJ3hE54vRPs94lfpp7MERKrqw5LnKoXsybMzUrfNwNxbe7Sq/3F5Q8?=
 =?us-ascii?Q?BuZ7LlkUw9HYVqsUiSZY22wEQD+hK+P/1s1pTmPcbTx9VMQRKb0c3To80kA7?=
 =?us-ascii?Q?wc37WeMAj6YCWYUXJFi3yh0KvSc6C1/kCmiGHAYtKl+KPK4RjEXPyky61CJJ?=
 =?us-ascii?Q?vCoPHnpvtQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: LPLkWuSqcVplMlYsQLb2iSZ7uvWPBbkJQVkFjD+SN7R8U3e6dUKBhrmpGPot54TmC/qUsUmOcNy7zB7wwi7V84MJQuLxW+Hbu6kEpYLCo9lxow4acLCSo2bgf+WXt4Yls7SdOosQysn1m7wTAYbwe6j73HDD0pSHMPXWWDMPkW+ybiCqS+btB9wfDSEPztVdaF1Mxejwqn+qe6A8lyc5tPwcwrD2QAQSCzti1z5GIHZYpEjrdhnQ64Tp8OEdYsogRwKNg3eCas5SIxUFLitISycHQAYPrkVv7UyuyjiZVcKfU/uRM8+Ye1L3lwf854IPM0vtDtbHu6ayho3ssf2mDg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 42cd739d-5723-457d-0ecd-08df030da498
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7752.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 01:02:04.6836 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0R5LDe5UvFLJGdvvGx9aITrhvYekUB8LXRtaOnNZwpf+ySnGQQ/AHOK+59ujmYDAEFHJfm9B7of2aUoA8GZEGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7405
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

On Tue, Aug 25, 2026 at 11:29:23PM +0530, Badal Nilawar wrote:
> Log CPER records for aggregate counter retrieval from userspace.

please add a better commit message.

> 
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_ras.c | 92 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 92 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 27c78800b5d2..ff9d917b8e29 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -204,6 +204,34 @@ static inline const char *comp_to_str(u8 component)
>  	return xe_ras_components[component];
>  }
>  
> +static u32 ras_comp_to_hw_sigid(u8 component)
> +{
> +	switch (component) {
> +	case XE_RAS_COMP_DEVICE_MEMORY:
> +		return XE_SIGID_DEVICE_MEMORY;
> +	case XE_RAS_COMP_CORE_COMPUTE:
> +		return XE_SIGID_CORE_COMPUTE;
> +	case XE_RAS_COMP_PCIE:
> +		return XE_SIGID_PCIE;
> +	case XE_RAS_COMP_FABRIC:
> +		return XE_SIGID_FABRIC;
> +	case XE_RAS_COMP_SOC_INTERNAL:
> +		return XE_SIGID_SOC_INTERNAL;
> +	default:
> +		return U32_MAX;
> +	}
> +}
> +
> +static u8 ras_sev_to_cper_sev(u8 ras_sev)
> +{
> +	switch (ras_sev) {
> +	case XE_RAS_SEV_CORRECTABLE:   return CPER_SEV_CORRECTED;     /* 2 */
> +	case XE_RAS_SEV_UNCORRECTABLE: return CPER_SEV_RECOVERABLE;   /* 0 */
> +	case XE_RAS_SEV_INFORMATIONAL: return CPER_SEV_INFORMATIONAL; /* 3 */

if we have to write the numbers themselves we don't need enums and defines.
Please remove these comments....

> +	default:                       return CPER_SEV_RECOVERABLE;
> +	}
> +}
> +
>  static bool ras_counter_is_valid(struct xe_device *xe, struct xe_ras_error_class *counter)
>  {
>  	u8 severity = counter->common.severity;
> @@ -749,6 +777,66 @@ prepare_cper_error_info(struct xe_device *xe,
>  	return einfo_arr;
>  }
>  
> +static void emit_hw_error_cper(struct xe_device *xe,
> +			       struct xe_ras_error_class *error_class,
> +			       struct xe_ras_get_counter_response *resp,
> +			       u32 sig_id, u8 severity)
> +{
> +	struct xe_ras_get_counter_response local_resp = {};
> +	struct xe_ras_get_counter_response *counter_response = resp;
> +	struct xe_cper_sec_intel_err_hdr ihdr = {};
> +	struct xe_cper_einfo_entry *einfo_arr = NULL;
> +	u32 einfo_count = 0;
> +	u32 i;
> +
> +	if (!counter_response) {
> +		counter_response = &local_resp;
> +		if (get_counter(xe, error_class, counter_response)) {
> +			xe_err(xe, "[RAS]: CPER: failed to get counter, skipping record\n");
> +			return;
> +		}
> +	}
> +
> +	if (counter_response->has_info_queue) {
> +		einfo_arr = prepare_cper_error_info(xe, counter_response,
> +						    error_class, &einfo_count);
> +		if (!einfo_arr)
> +			xe_err(xe, "[RAS]: CPER: failed to build einfo from info queue\n");
> +	}
> +
> +	if (einfo_count > 0) {
> +		for (i = 0; i < einfo_count; i++) {
> +			struct xe_cper_sec_intel_err_hdr entry_ihdr = {};
> +
> +			xe_cper_init_intel_err_hdr(xe,
> +						   (const u8 *)&einfo_arr[i].hdr.error_class,
> +						   einfo_arr[i].timestamp,
> +						   sig_id,
> +						   einfo_arr[i].hdr.counter,
> +						   &entry_ihdr);
> +
> +			xe_cper_record_emit(xe, severity, &INTEL_CPER_NOTIFY_GPU_ERROR,
> +					    &entry_ihdr, einfo_arr[i].einfo,
> +					    einfo_arr[i].einfo_size);
> +		}
> +	} else {
> +		xe_cper_init_intel_err_hdr(xe,
> +					   (const u8 *)error_class,
> +					   counter_response->timestamp,
> +					   sig_id,
> +					   counter_response->value,
> +					   &ihdr);
> +		xe_cper_record_emit(xe, severity, &INTEL_CPER_NOTIFY_GPU_ERROR,
> +				    &ihdr, NULL, 0);
> +	}
> +
> +	if (einfo_arr) {
> +		for (i = 0; i < einfo_count; i++)
> +			kfree(einfo_arr[i].einfo);
> +		kfree(einfo_arr);
> +	}
> +}
> +
>  /**
>   * xe_ras_process_errors() - Process and contain hardware errors
>   * @xe: xe device instance
> @@ -886,6 +974,10 @@ int xe_ras_get_counter(struct xe_device *xe, u8 severity, u8 component, u32 *val
>  		return ret;
>  
>  	*value = response.value;
> +
> +	emit_hw_error_cper(xe, &counter, &response,
> +			   ras_comp_to_hw_sigid(counter.common.component),
> +			   ras_sev_to_cper_sev(counter.common.severity));
>  	return 0;
>  }
>  
> -- 
> 2.54.0
> 
