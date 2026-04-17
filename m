Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D50AF436B4
	for <intel-xe@archiver.kernel.org>; Fri, 17 Apr 2026 14:46:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1EC610EA57;
	Fri, 17 Apr 2026 14:46:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ir6ABEff";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F5AF10EA57
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Apr 2026 14:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776437163; x=1807973163;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=XyInD15ABBWYfuT83uadaJ3wSNDVzYIlrkZA48HHyrk=;
 b=Ir6ABEffHj9qVXo4glJfduLVNDU2jl53yJTsemnxT/6xyxENGqmy/C/u
 F0o1Y3qxqDhkvWN5IrGJUE4HBCEg+6QPz8aus+f19BcUslFfZN6Yoa+nh
 29uZQ1cp1i9qILX+8HSjDVzbekpmw9X+guTjjhd/cTKtaUbGHReCC3w+2
 hSXfUw3LSmoAVAWXnUVqiWhuho6WJui2w2EpX3n2BHQv4iD+lYCXdqHeZ
 EYD8eab1XbHocC3gySDlloNhBpRQpD1XdfaaaObMSBra0ueu1abETkUCc
 hbviJpDTkcXbS+RcnSREK67t2d7xmJHyUKEb73MU3WdV/i7MllumkZfYW w==;
X-CSE-ConnectionGUID: OS1eJS+nSkuBbQeAygZ9qQ==
X-CSE-MsgGUID: lGF8bsieSJi5pgZQdKYVMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="94853008"
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; d="scan'208";a="94853008"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2026 07:46:03 -0700
X-CSE-ConnectionGUID: nffi+fDZTVmuOM/hNpejnQ==
X-CSE-MsgGUID: xMAHJRq8THiIHOOn/dAzZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; d="scan'208";a="261463574"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2026 07:46:02 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 17 Apr 2026 07:46:01 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 17 Apr 2026 07:46:01 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.12) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 17 Apr 2026 07:45:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l6oER25fF2kuw/pRw0+/S3HYVjHQTBEPRsG2r7PGTwXHqgzU+KcEQ0o7S24Z0B6PbFKNM5qaT9UuisAWhS1xc5T6feI80sQRO+Cloub/YTWbBf1jLXyJIXjfq6um508FlVw33u4CBegebUt0rY9UkZtxlUclSpReSFql4ezp+bIKjTWTQ8SC64A9QlVaGh+9mLecXn9p0wSXvtMrLUz9WzOKaAenrYi7sQXWTCh7J3E3c+FfzqNx66lY40Q2BEWlaHW0egjzxOqSdC5QXOjkUZ0U8AbXPhmS1MhEDfb11QFbnroLrxTGDumGujw7aKKhWVp3c9/y9yMDfKmYa/yvMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=seZigSQkNfGhD8OLjz0m/ZXPo8db6xSkjXYQpIJTuCw=;
 b=A2oJ32jKHHAIy57Vl6pHeYWjSeJsJB1IuoohwO3+L+R1NIRNE4bA4wTPO9cKr07gcz59uDGJ0rwA9o/a3VGJNNXI9PNOswxOlpMA2V8e2HPkD/36CEotAxlIc4973DfLyaXqKagiNg6be90HsfouGrBAh3B3G/t8GymsEicH4TzsGr0xJo91ZvPaocfAmyUTCysZLIlUvN/Ad5E7Zi87OGLF940q/bAR8JrLsJQ5hmoomvNPTVBLsYkaZ+ec9eZTBsDjdW0lHZPvpA470UfvoCKf9rG8I+OxAoEzFSSHfzPy8tDcoCaoA6VizVQYwxxNTtGdDqLjXp3SVMzTgXAq2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by CH0PR11MB5218.namprd11.prod.outlook.com (2603:10b6:610:e1::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Fri, 17 Apr
 2026 14:45:57 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9818.023; Fri, 17 Apr 2026
 14:45:57 +0000
Date: Fri, 17 Apr 2026 10:45:53 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Soham Purkait <soham.purkait@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <riana.tauro@intel.com>,
 <anshuman.gupta@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>,
 <ravi.kishore.koppuravuri@intel.com>, <mallesh.koujalagi@intel.com>,
 <anoop.c.vijay@intel.com>
Subject: Re: [PATCH v1 1/2] drm/xe/xe_ras: Add structures and commands for
 RAS GPU health indicator
Message-ID: <aeJHoas-vaJf7zI7@intel.com>
References: <20260416093610.4085667-1-soham.purkait@intel.com>
 <20260416093610.4085667-2-soham.purkait@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260416093610.4085667-2-soham.purkait@intel.com>
X-ClientProxiedBy: BY1P220CA0026.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::17) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|CH0PR11MB5218:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f37bf50-2523-43e6-17a2-08de9c900922
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: ghDCLI3kMDZHPzOPBIzeGbuSSO8HOUM9fHOtdB65i+daTAqkXERvkYNyCaCElcG8foIegujoJ0PI/q0DGxIXLl49Zk9TMl3S+x4/2FyNZhYGadq9x9BhPlaoHpyzyTNDdktGXBnEBXOYqQK8m0kk7dLAANg8FrQaL4tOFWWAH5aCsM0EUDi2qaaKtpZeGva9dmX0Aev1Gk9eXmS+bOW87iEAogf4gMCRSVjKRaQj2a9WLefKs691Z4jayijLlSK/pGCOZTRJbLLTmEq+SpoXa/+ahK/6ciR6v60lhhGd7Uw4XZQ7AQ0cFacawywXEVTTgoE9hmFs0atakzMf/77dWNQWeuUCUK7fM9FdxWeECwSjtMgqbGocdF4S1bN3eOSYLTk8Ic3IWIhO2hvP/CCfRuyqIjL7YquStbfFowIia8okEnUb+4JUFViqYBbynQ6jOw/CHN6RA7ADt17e+b+taN2f0eKPR5+D9EfMf+riBK5hSQFHNeJdrkBik0N/uaNecYWpJDBduUgMFkoww53OapBDS2Yg9MhZIJgfFMt5Ed4blSDlTMalv2l2S+6Og9dUuUXh9SeipniJBQogTHHUGhdipx/gxHm52Kl5N87qtfmMuVbC0OV4pMZ5Z84Fq9C6z7KTcJddjK8xAxVvFfrwdaQI8opcC03YcoOdfR17z78/TJuxGq5jdp4q6H7amLvxonldm+aYVf1hMNAGUcYFtTJ0aPIaBxAdyIRag7nneL8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?bB5wRzcQjGQ/Q52PPuJXTfgXSPWRN+/PxnPG5ZUqDqbV6GLmlKW7j3oSAR?=
 =?iso-8859-1?Q?15j3N3JmlEPBd8djhKyDG4yEamSgZb5LAs25TBak1IoZiCAVY3Z8NnE5y5?=
 =?iso-8859-1?Q?IiBS/Yj28SGxLt+vi0XUGQ3xPVvXNZA6r4TOlrpNGDIj/8kAyLC7S5mQUK?=
 =?iso-8859-1?Q?8oSXlyBVQtbeQBEAmYeBgTpFaMg0/CDdqLq7kYWrDdUcCZCHJmsCKiw4q+?=
 =?iso-8859-1?Q?Yw4580HeKMYN6Efuk43scXxf+yZzvDk+ZmLnidrvFd91kNksWdL5fBSuHV?=
 =?iso-8859-1?Q?vNVw+a3Smyi+vAQotmJgBcgGct2f0yWT39L6mu/MXdMkYvjqt8M+QRTwJl?=
 =?iso-8859-1?Q?opUw3mYoqCtwBDsZdE5LuJe23xUQDP65IRrhKKzt8hpd6FOlNY8rHMFVwT?=
 =?iso-8859-1?Q?hhL1ribLE+2L2hBaqzvf+YXOkEvHoCfDsSUWEiEiSurhUk8OavRSmNsDIN?=
 =?iso-8859-1?Q?6XfYavr96D3hFt/O6QHiki2Mm8ZxgfFMdoJnf6/WuPklTbs8HeEGe2Xx0m?=
 =?iso-8859-1?Q?G/XyUgRUyt6Ayud1H/SPSgkNGLW9GJEOceKO4DWK4BLNywnBtFdffBXjm6?=
 =?iso-8859-1?Q?uW+qspu/hd6g7ohZuCpthiadwFnNHzt16bJvGgHyTlSLREoP+nUeAURouS?=
 =?iso-8859-1?Q?V3UDw2sClRl4xty1i5yxLMubovsEhHGYN8NqWRNvfy1q22fpchCwbV9L7n?=
 =?iso-8859-1?Q?9k7E9yYCMxyNlkM/chHxLFn1vNDgLcEoRPhn1RgPKsqqSniKe15USEz0c8?=
 =?iso-8859-1?Q?jC3Qeqhh3hN4c1fftbmMUtXsYrrlfvK7qtUgV7Kg8P8xiA3mBJ62h4Yzz6?=
 =?iso-8859-1?Q?yiWFMZcMcWowpiL+GZhlVBZ4r+XBpQXiW3zXsmrbBDP9l9+zemm1pYAy/X?=
 =?iso-8859-1?Q?YyXEndniM5K3/BDY/wT80yyMVS4PZtNGXaIKDO2IvFALsD6f8qq2PorIAN?=
 =?iso-8859-1?Q?kpKBk/4zxljfkl+LJpopX93WeM0BFdjgUvUmI5PylJVohZjPcOQrICOMDR?=
 =?iso-8859-1?Q?zvAFJk6KedGME/N5I/wMqkKT3RkEoQNjY4FU3iK8rwftF4vFoLkXfnoxJs?=
 =?iso-8859-1?Q?BjWIeONkjdhgk2Oq7X/LllFq1OiDv8SoVNZt64gCtn9i34dshhkJI0ylXJ?=
 =?iso-8859-1?Q?30Ylqrv/1QyRq1TKbSv5zhAkywkGwb1RWdjduszqf5KVeuTUzXW2LlTful?=
 =?iso-8859-1?Q?4jdaAyQM6jXzURkxAbSZdMDw5Ks8OaSux+h3smQlCp2X9euJE9osEJTsgt?=
 =?iso-8859-1?Q?u2A142rtokSacdQjTSp+au1Y4/iWx7UxrB2WHKznfG0uzAbVDTSwnnNtkD?=
 =?iso-8859-1?Q?G0+m7f7W6iq3rJcoPVKHHjuyC0UrlKvwKPFGnxgNid0uNrzvCIMizfDB66?=
 =?iso-8859-1?Q?ssZOkdLWpn/HaYVOJFOOvNTnEpfhdjUWXWAvb0QYfQqPVj/Hyo3JZoLAU9?=
 =?iso-8859-1?Q?ep/JSEpaREJgjR0Yn7pp5p++9+QRqS44HWl5KTV00duBsqyjautouHKjgB?=
 =?iso-8859-1?Q?CwIm/uyfPG0cP5k+qtv97JbGk6UykiSMbpKv6a0/F9yF3Kai3/TVDbpQZH?=
 =?iso-8859-1?Q?qwLP52dtKpn4RqYC412eldSYFvWc/upiuBg7WNYu4Nu/DuUEqdFBcTDPwS?=
 =?iso-8859-1?Q?SVeAjntHv5scEmnDP0AIC/DnJA8JByLv3CigBR28Y2JR/3j+GVySrgIIhv?=
 =?iso-8859-1?Q?ssTtDnobZGzQMPKnUL9q1A3V06ca3eYlXMcBz5AF/DQDkfvHy+Sbl82its?=
 =?iso-8859-1?Q?0p114dH61akJs0WPJevb5Pegw3K1/H/qcYx6ft8RXpF69EV2HZZJm9cXs9?=
 =?iso-8859-1?Q?JycNI3byug=3D=3D?=
X-Exchange-RoutingPolicyChecked: bR0h89APatUkx0+xDjat5EqaVkdgPSOEv8qMGSm8qq01F4LOHKgXArGbIIBRAAwJcHZqoAaxXNiR7FOY81wr7bR78CQ5aBb6dDLsyCxXQgYK07Q8vgVYX5Zl8gkvFGryUGg4WCYiYRfqjuPDsc94RSsq/ujPme/77Xu3dawtMqq6dIOadkCOlnmuV3Rxqiq+bBnPjH2VZS03A1XijriUEKsJS15Ahh/yPpMCU5L+DRmqVFFI32Wj2dj9ejw4AN00rkrXLyRfse/F5JE8rz0r5Ve5Ha/dUHIICgS41SUl9P85sD5vmogdJJS9lxEOvnGfPKfD8EgKlh/2hFfket4sIA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f37bf50-2523-43e6-17a2-08de9c900922
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 14:45:57.7844 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NmJumx8++KnHZKn9X2mhZml/7VGJxyyF4GWcOA9AQ0p6tbYD/WdQRCCiRj3efUjyK+uQ1aC1scTeWSx1/rhKUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5218
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

On Thu, Apr 16, 2026 at 03:06:09PM +0530, Soham Purkait wrote:
> Add the sysctrl commands and response structures for GPU health
> indicator supported by RAS.
> 

As Andy pointed out, please improve the commit message.

> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_ras_types.h             | 65 +++++++++++++++++++
>  drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h | 15 +++++
>  2 files changed, 80 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_ras_types.h
> 
> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
> new file mode 100644
> index 000000000000..a05cfd971acd
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
> @@ -0,0 +1,65 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _XE_RAS_TYPES_H_
> +#define _XE_RAS_TYPES_H_
> +
> +#include <linux/types.h>
> +
> +/**
> + * typedef xe_ras_health_status_t - Device health status values (8-bit)
> + *
> + * Three-state health indicator value reported by system controller commands.
> + *
> + * The expected values are:
> + * - 0: ok  - The device is healthy and operating within normal parameters.
> + * - 1: warning  - The device is experiencing minor issues but is still operational.
> + * - 2: critical  - The device is in a critical state and may not be operational.
> + */
> +typedef u8 xe_ras_health_status_t;

Please use enum instead of this...

> +
> +/**
> + * struct xe_ras_health_get_input - Input for XE_SYSCTRL_CMD_GET_HEALTH
> + */
> +struct xe_ras_health_get_input {
> +	/** @reserved: Reserved for future use, must be 0 */
> +	u32 reserved[2];
> +} __packed;
> +
> +/**
> + * struct xe_ras_health_get_response - Response for XE_SYSCTRL_CMD_GET_HEALTH
> + */
> +struct xe_ras_health_get_response {
> +	/** @current_health: Current health status (OK/WARNING/CRITICAL) */
> +	xe_ras_health_status_t current_health;
> +	/** @reserved: Reserved for alignment */
> +	u8 reserved[3];
> +} __packed;
> +
> +/**
> + * struct xe_ras_health_set_input - Input for XE_SYSCTRL_CMD_SET_HEALTH
> + */
> +struct xe_ras_health_set_input {
> +	/** @new_health: New health status to set */
> +	xe_ras_health_status_t new_health;
> +	/** @reserved: Reserved for alignment */
> +	u8 reserved[3];
> +} __packed;
> +
> +/**
> + * struct xe_ras_health_set_response - Response for XE_SYSCTRL_CMD_SET_HEALTH
> + */
> +struct xe_ras_health_set_response {
> +	/** @operation_status: Status of set operation (RAS_STATUS_*) */
> +	u32 operation_status;
> +	/** @current_health: Health status after this change */
> +	xe_ras_health_status_t current_health;
> +	/** @reserved: Reserved for alignment */
> +	u8 reserved[3];
> +	/** @reserved_2: Reserved for future expansion */
> +	u32 reserved_2[2];
> +} __packed;
> +
> +#endif /* _XE_RAS_TYPES_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> index 89456aec6097..fc73e02c3202 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> @@ -10,6 +10,21 @@
>  
>  #include "abi/xe_sysctrl_abi.h"
>  
> +/**
> + * enum xe_sysctrl_mailbox_command_id - RAS Command ID's for GFSP group
> + *
> + * @XE_SYSCTRL_CMD_GET_HEALTH: Get current health status
> + * @XE_SYSCTRL_CMD_SET_HEALTH: Set new health status
> + */
> +enum xe_sysctrl_mailbox_command_id {
> +	XE_SYSCTRL_CMD_GET_HEALTH = 0x0B,
> +	XE_SYSCTRL_CMD_SET_HEALTH = 0x0C
> +};
> +
> +enum xe_sysctrl_group {
> +	XE_SYSCTRL_GROUP_GFSP = 1
> +};
> +
>  /**
>   * struct xe_sysctrl_mailbox_command - System Controller mailbox command
>   */
> -- 
> 2.34.1
> 
