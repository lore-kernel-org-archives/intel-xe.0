Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C491EC4453A
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jul 2026 21:11:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 520FA10E4D3;
	Wed, 22 Jul 2026 21:11:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="El1VwWtQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E78C810E4D0
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Jul 2026 21:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784754682; x=1816290682;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=mg8+zUpysCzt+WI/G5oJ21rwNNsg99v+GlXhCUt1Jj8=;
 b=El1VwWtQ9vy/flv+fIV+HsbYV3S1rPHpSv+DduhzGDjPjdJ1VvXCMAYk
 qHrCEFnR5UnOrudRNq/faKr8DXB3UsQnpkEguXfmyiFJOhJDXaz/ibKLn
 q39LZ4nXMsUQc1PJA4TL4grad8xUGJ4Lk64N05RDoziDDs6UpMxg7JTYX
 VfJ0hC7USHiZO1Yi4M0r7wu3iA7uYELXUwxBXSJul4TE2H0Y93S2dSGOo
 0z21ouoxt07zQdE5PMUJYh49It1FUVZnv2p1S7DwUL3axqqs2Rg3BcdEp
 6VwT8ANf9ARUfcNh0vUXwgWFFbnQHixg2U5UTyQorHoljXnij2ZKVhHRd g==;
X-CSE-ConnectionGUID: pZ69hMOPSNKhaB5X7xUxQw==
X-CSE-MsgGUID: iLyctkjeSEiWtDEEzdpNHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="108192026"
X-IronPort-AV: E=Sophos;i="6.25,179,1779174000"; d="scan'208";a="108192026"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2026 14:11:22 -0700
X-CSE-ConnectionGUID: JedYlrVwSO++xf2llT63+Q==
X-CSE-MsgGUID: X14KM6dpTGaTe7/vDOzgJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,179,1779174000"; d="scan'208";a="258274743"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2026 14:11:23 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 22 Jul 2026 14:11:22 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 22 Jul 2026 14:11:22 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.51) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 22 Jul 2026 14:10:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y9Htd/ydaI5ztOmHDkWg+EuDxd4aHHHZhb6ZNrNDG2LDhuFezxPuSg4LeNwUv5UxaEafvvxlPLBDYGpbCNnyAOBskqdedg4/Q7OF0zzIADvOUBuNeJsiZI0wwplJyd4e0pnqMKEc5f6wLLAa3FGCRbmVrwHPIx1RpViQX5wJ4Km02ADr1nPaPr0iqcmI4py6kresUQ7AVj1cRL7W/WyxE1Em5w9+oDL2Lnobb5KoXqGv15IGnn+Ss7jOc+koLbbensPbScOzlj9YdMo7Nxa8YCMXz1RNtlyqJIsmFEsPrkYQ8Z6qt/k/9VDIrfjVysH7wwXqBkT5Px0UIgownHZQfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aTjmjsubcmnJ3XJBama2RpET/v9sw4DsImC2REEqg40=;
 b=qr93vEZp0nw+5aYAGXc6z6cY2sJvV3kvP7pCA3ac/YQ4rHoN+pmLFlsFWNQEKp0DmM9UWVyfn5cwn7e18yySR4VBJPpfp83FGY2W12bIOqEGEzl53TOIIooxsVT2tvQf/ZVgjHexroKjr2s16YWD8MvMdqQiLp4fgMFbEPQ+b9UyNgxG8waruNaf1EZF0nHnxdu/XT4TZupFs02xJw9xWeSNGyDalA+03F5FCaYfBp37C19QjwM4VUfCpfksYiYDEM/j7c0dZRMzCoe8By28ZWlnCxNNlLBa8u0vZGxSvtkFeK44GCd0MUFi96BLJM4tGtfS5gB8nuTi1OHvoSN1Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23)
 by LV1PR11MB8843.namprd11.prod.outlook.com (2603:10b6:408:2b5::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 21:10:34 +0000
Received: from CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe]) by CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe%4]) with mapi id 15.21.0223.017; Wed, 22 Jul 2026
 21:10:31 +0000
Date: Wed, 22 Jul 2026 17:10:27 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH] drm/xe/nvls: Drop force_probe requirement
Message-ID: <amExwzj4sF1lbBfH@intel.com>
References: <20260722-nvl_s-drop-force_probe-v1-1-db944d940cff@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260722-nvl_s-drop-force_probe-v1-1-db944d940cff@intel.com>
X-ClientProxiedBy: SJ0PR03CA0389.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::34) To CO1PR11MB5073.namprd11.prod.outlook.com
 (2603:10b6:303:92::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5073:EE_|LV1PR11MB8843:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bd4ec2c-66bf-406e-9fa1-08dee835a9d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|22082099003|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: g/xGPb6X1ktsKiMb12Dbbv5533CSGpbNn+Jd7y46AKDsI4y8446mumr74whbC5MUWzTicye7RTrWIob8v9aGmVpi9+FzMffr3BtnQrdmEd15yOp4maB8yo6I2FMEpxrydu2yFGaFzeHTG/gnyy8UixAqWuWtTDTZUZhY9gAlVY8IvI8auG4ey6vovuStSmVKNKbJMNkSfq6m1eMkhbYpeCVSsQQVQTEV+EYcmY6q0B+CT0ptkgGA5+MB2wQkdJSvBuw2FQhKMi2fCTvQILIZ5nW9td1vlCDCSvc8sXDA+PvGhUW2JDOogAcecYBBCZ1mYr0i5RYmRiS7CNKncHmWrBsAFcKOeL1qAOzacsCxbSDqkqOX1uoHKWEXZmJj63QjAXfIlQEHkc2T3f9LqgQux7jhlhKOB5NW45H4qS+A40h/1ApJy9DAxnvs5FePxzwSVzzEqdJFfOha62agRFwOGXgd3SQNvhVsWVVSNi0x5gmjsLu6RTQVYhSVr6PF6QfV+1tC0+kwfWsn2PlOh8A04nzHkuwBWhoEh1yjFWfm6ry0OfcPW1oBamzle5GH90jIpowWVbJTikK3TZ6/3CHy9xjPZ4U12C/mzWLDUCN/s5z/eLhN2mk6RIV75v+fTUUiN6/LyA+KcLPCiSkk06ujPf9zJBCJV15w/TWlZyQ1juM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5073.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?DIbnz7UU1u8ktRWIZHxh1p7b1O3VItMoP065XaO6EuRJzD1h4VSWIjAiNh?=
 =?iso-8859-1?Q?FeoV7u9CX6Uc8ykcsQMjI04f6CYhIvsiKjlwBJIpfQ0KamscWkPXAJqdmb?=
 =?iso-8859-1?Q?ZDPNRVCPE9KlI3S0B4uqWJ355b8JOc9iIJ9xJfc0ySnEqEl8cSMSEeN0CN?=
 =?iso-8859-1?Q?0RmtRYb2pqsZ626HeTpChvS3CDQwCi1o6FWHDkK4ef1Gk8C/U48itEsK4l?=
 =?iso-8859-1?Q?MIPg4qHlKQzQMEyN2mnkQy0nCZVsOFZEVqN+JIcSBGioqjQ/q585LN0CH1?=
 =?iso-8859-1?Q?ehAC6JcRP8Qs6jl8x7QeTWmvRtA0OM8IDrOljpOjV9+Wo13ivNXz794I2q?=
 =?iso-8859-1?Q?hVzaRc3jPX8+DULIERNlm9cwrhkZaq8TtnD5OwrA14sdRf/GorS1bd/0dH?=
 =?iso-8859-1?Q?REWhMo3OifhoSdZhBsFlDKKGu7JPawgsHmT+HWHxjxZV+zRS1dfS7pyLxW?=
 =?iso-8859-1?Q?2ZIyq4BAIHvw6lRopdP6003yBjR2CkfxhWC9CnyL66Iddw61Dgm3WUesi8?=
 =?iso-8859-1?Q?9ahFQ4d5M2RfPXHxt+3OfWkWF/3n8ejQttWukeBcsZE86YlEHqk4OQbzbJ?=
 =?iso-8859-1?Q?JN7hBNDetBz3+TQlfYMsZNP6+vL5l7NW76n4PgYtpFcB5uQ/zKqp6QbRwe?=
 =?iso-8859-1?Q?ghYJAHa+lL2spBVqhR6S9BsapdD5U5UdJKgZYnbcigi1bACbQzDR7Cjznc?=
 =?iso-8859-1?Q?vrmZbR6G6udisjLFcRYvJY9GOHFofoM296TmDXCmBe+imm3wHkla4gb4s9?=
 =?iso-8859-1?Q?gqbBKiH+OHXw2fxuYBVmJcGJOxMa8zvqIPKRNoxsKuGthJDAXYQM2f/GzA?=
 =?iso-8859-1?Q?Z9pbSK98+0591O6M7PzA8dNod1v0iGO4zXxXBptKsFvZGBzpIkH38cnoej?=
 =?iso-8859-1?Q?Uh+rp7VV4Nk8RrQf97uhys2NJ7yvyQAXuy59HFgbk5gORopXPAtRWUDqmx?=
 =?iso-8859-1?Q?0CD6JaNrTN6cOO9uPr5NJoAtToZFJPuAE5KzNOtXnaaOEYiQqXngG80xFF?=
 =?iso-8859-1?Q?u30oPSeVcP8ONR4uMTc1d3oMH/n+iBk6wD+yOnV7ge2fwZ7KUpfCc7k9jm?=
 =?iso-8859-1?Q?GU+85y+Dg5avsE+y89Y+5eLRIVcosVRW0/jSlBvtme1frQP8htWmNj8ojO?=
 =?iso-8859-1?Q?sN6cf30OgcXPqyVx0tziCaVLe/NNrsj1mB06pz47JUksPt8pSOCPstVD+C?=
 =?iso-8859-1?Q?agSqjIXj+itGhakNsDoTqBnJmaPFeI32hsYYA549tyB7r0Po5sOwtcBvvU?=
 =?iso-8859-1?Q?YWIAUaNqoN9tr86Yw+K/3Riz3TcPxytt7e++GtXmPbULxupgS/bZXmcHT5?=
 =?iso-8859-1?Q?324kM6vQ4uFXmBzN0u0YaSBBec37qeiHJxX1W+Ay3NZbYxuLVuAEGbVpCn?=
 =?iso-8859-1?Q?k2I6zTCdian5fe9eeWROOAznb2elKqL9POLmtUkX3jxW9oSKnYEMkIreMQ?=
 =?iso-8859-1?Q?WaAcbxV9IgGePVabe4Sdu0wRsvWvnQGVN8Bso+muzvF/7/sfvsp85h1h4n?=
 =?iso-8859-1?Q?0AZSVT94OF42vlDwsFGl/q/2vBSxcqPUqUUx6JuAGSPbEEIWYGurqmcZcw?=
 =?iso-8859-1?Q?nwHRMcuINU3CVGUFICP58z88qdMZIfUJo3aYUvXQkLaafI5oNse/ovxxli?=
 =?iso-8859-1?Q?FWOCguF8ztC/TECf6N/ez+My9cAZG2uIKGBRaDP0u3z+33HO/YUVClBd8j?=
 =?iso-8859-1?Q?N8AVU0aRv43N7vUKC55z792avBMFel/kBFZRxIG9JVd5Mrh+SCNQ8v9usY?=
 =?iso-8859-1?Q?QyCsxxYnHicrXx8ECGQ74/tkAnuozt4I0BSFVtI60tKMyOXRF6mSaWImcB?=
 =?iso-8859-1?Q?Fu0L4pCVIg=3D=3D?=
X-Exchange-RoutingPolicyChecked: l5QYp+dOFYazM1rk7N/2O7YNkeHMg1gFt7R9J5jNcg5KxqNA8LUbxpPAYU1ZE70659wjVtiaVpahaqgZhT40UKGdm6s6O0Qf7qKb0k/4640rGtmzwrqS78D4Q/E+H13lvbs1JUsYzQ/Z2tEzKcjxc3aJU2LSFUJ0d1N59j099oGqp68MiGTKOjvly93br+OfunttwL05+12HnrYu1l2OiFOlFkHDAxYG/NLIYcG7UheLa11/8FLZ7ZFgxOnMEyrqBITfqiI4zq4CIIvgb8aNejfoAAGhbc8/DzM/X9C76gXFrje27W7Klmol6Bwx1zZQinokgEQww3zngMdTVYYuoA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bd4ec2c-66bf-406e-9fa1-08dee835a9d2
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5073.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 21:10:31.5802 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hfXCqQ+p0pym1hbLfFw1wcRYjpvbZYNO3Qyvr3psWY5b3eYEb+zuE9ZHVeqLAZKbVwlV2Jg8UICqUVrIdAw2Ag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR11MB8843
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

On Wed, Jul 22, 2026 at 09:52:57AM -0300, Gustavo Sousa wrote:
> NVL-S is stable enough for us to drop force_probe requirement. Let's
> do that.
> 
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_pci.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 123ffd4c1ee9..36d62927b969 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -461,7 +461,6 @@ static const struct xe_device_desc nvls_desc = {
>  	.has_sriov = true,
>  	.max_gt_per_tile = 2,
>  	MULTI_LRC_MASK,
> -	.require_force_probe = true,
>  	.va_bits = 48,
>  	.vm_max_level = 4,
>  };
> 
> ---
> base-commit: cfee1b098ebceda0381298e945031733a5aec8dd
> change-id: 20260722-nvl_s-drop-force_probe-5f9699142548
> 
> Best regards,
> --  
> Gustavo Sousa <gustavo.sousa@intel.com>
> 
