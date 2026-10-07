Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F0CBCA5FFC
	for <intel-xe@archiver.kernel.org>; Wed,  7 Oct 2026 18:18:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBBAD10E647;
	Wed,  7 Oct 2026 18:18:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dpK9u0it";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE3B910E647
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Oct 2026 18:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791397130; x=1822933130;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=LtI7ZPER+PEMu5iZ5jep5O7ggdJs+Yx6J0rQc9Vqhkg=;
 b=dpK9u0itXp5OjA/lGUiSeb7ST1YpmOS6RobSDWOxnXu1tXKrNq030Z3j
 ik1rpv72pLeLPZVOYthO/eRBV2WwmvJbSw/vU/suO+6J3ZvuYg2zLBeFK
 bc47vBvC8dgBgYfWCCAHS7076dUbpkj0ktZZ3+r2ejWAy4X471+N6e91k
 uOsfSwE/1Aa/I17xVpwaVGrNKmzZNHOhcvJkVePNXWGTGMAa7IxCa6ha9
 vWj8uVFFb6ueeAFL3eaJTv2ELeqtpH0BpCADQyHFW++DI6kUpyDtdT0f3
 54nLJZNHgvFmRytx6OVJ7BJeFUzDB2OR0UinE24KZXp2TM9NbMVTumBK8 w==;
X-CSE-ConnectionGUID: b6zKNufPR0WTN9Pca7G1HA==
X-CSE-MsgGUID: b+y3O7jfTBK/5GPb8yR9yA==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="68869"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="68869"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 11:18:49 -0700
X-CSE-ConnectionGUID: fWXW7I5nTP6WAboO1r4Vqg==
X-CSE-MsgGUID: k9m03MwmQ/2BeRHFPjOmxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; d="scan'208";a="305493835"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 11:18:49 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 7 Oct 2026 11:18:49 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 7 Oct 2026 11:18:49 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.28) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 7 Oct 2026 11:18:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yUU/O2SUQG89+luwEyzoHWDvi2wmjSme6HKt9+WvB79yMZMIeyNngrqvFAjBwtCc7Y6pwhqarAWJYaAHCBwmioMs2zb/VCww0wjHnPtoclYVvJhrIiaorvLLFm4RenVadK8w/Apt9ppIUlUWjGCAsSFMxmhdAHizzD+8SHP3T2KrcrYn/M0B/DA2IK8SrXwEDRKQKUqAB7zG6mlcyIS5zeuEr31dtr40DYJ6JuLj6FM2fVu+PmXoFOUs4sazaU1PedzaFbd+QLH9Vt6n2i6AfFfFeRcxXJ0EkPdJ+Kxx1+R0V5pXgDtxexsrJpnaHRrsTAQbG6YGIIgsRlA3MsT5aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0IynkxVFLHiHFoMw/F1WqldFD3tbfqqbq9cbP8PbtWs=;
 b=WTReHzA5GgOo/vu2Up+Vnzd8XdSViklQqMKK5EN/c2/ZXZaoOAo+mJqRIXB3qfGU2KmQQllkVzais9tazGAkdl7/3kD5nooms49ye0UVma+NJNcBJPjeugtfWoTM88vhISlhU20MJeTBlkxvm8J9hMn8qNQoq2aUXIXZdjV0ShTTvRT8nPqT0rQnxV+oSbkXVrmCxFhbLXtuD5mqv5veN6NfQ0i50CjUNZYlGgGJJkvJGxmw+pd3Nyifylu9ONefjTzUuKHmuuoiEi/wjhI73LSWh2a55BoVmmUyWDDRG0kAVSJXgxn1FcrCqOXWJRj71J1Ej1WAMfYv4P46ct8x2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB7180.namprd11.prod.outlook.com (2603:10b6:610:148::5)
 by SJ0PR11MB5006.namprd11.prod.outlook.com (2603:10b6:a03:2db::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Wed, 7 Oct
 2026 18:18:39 +0000
Received: from CH3PR11MB7180.namprd11.prod.outlook.com
 ([fe80::70dc:90b2:50b4:31a8]) by CH3PR11MB7180.namprd11.prod.outlook.com
 ([fe80::70dc:90b2:50b4:31a8%7]) with mapi id 15.21.0451.026; Wed, 7 Oct 2026
 18:18:39 +0000
Date: Wed, 7 Oct 2026 14:18:26 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Karthik Poosa <karthik.poosa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <sk.anirban@intel.com>, <mallesh.koujalagi@intel.com>,
 <soham.purkait@intel.com>
Subject: Re: [PATCH v8 04/15] drm/xe/hwmon: Add helpers to validate thermal
 sensor readings
Message-ID: <asaM8vEEIAX3J2P0@intel.com>
References: <20261006033534.3583967-1-karthik.poosa@intel.com>
 <20261006033534.3583967-5-karthik.poosa@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261006033534.3583967-5-karthik.poosa@intel.com>
X-ClientProxiedBy: SI1PR02CA0047.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::15) To CH3PR11MB7180.namprd11.prod.outlook.com
 (2603:10b6:610:148::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB7180:EE_|SJ0PR11MB5006:EE_
X-MS-Office365-Filtering-Correlation-Id: 86bf75ce-c452-4454-0c05-08df249f68b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|11063799006|56012099006|4143699003|18002099003|22082099003|3023799007|10067099003;
X-Microsoft-Antispam-Message-Info: gdA6lPWICblEfZydDNL8ZOWwiOR+lTtoH+8fDhEUEF0Ppzr2e61IQCT2ZCXImZaKtExMkHDCFh29I6YFahrPencMUeoey+R/KnsKyGM6/Z3qROCfcgFxxCxNK7NeAX9Xaucq8m+J8793QLRWdkbD/fMU+Ouyt3dM8+tL4aoqSmaUpL3EqJ2qh3jkZIr3W+E4lERcFazqeX55BOYpF3pmHK7NCOb80xdjqwv7pZmxnlgP3q5r3FfvI3V0X5XSL+a7DwCVEQdBFf5ng3plJaxNvoNz3eH3pLP09J12Y1d+youjxf9TWLKOHVt44UcRdojgXNNBRUM6iAHP6UrwITBtYk7eRYKPPFe2/qm32ZqIRuyhTBf2NHEIpF8oLD8hMFW2b9rSYN6D2Wp+PKJDAvBcLjakAw0ysCwF8N1hSL9QBP42EGr2ubrCkhfF1Ew9qNzadWx0QffcKVlvFAN/7dLV3J71+Q3/3HSbqUbTvDB/5H2J74rJ9Ry71fSB8ZajR1lL8Qiu/TFXbuNkvW1J4C93VN0sanN0mqv6msaecNQJaNtLRGsNYsYzM4aNaGO3hBcCmQktODd1NTN6ZgVffuWGmRLWCIrXcRNNJTkAkd4nSZo6I8VsWjXd/Cy7gp0PquzA0JNNqueQGspjIi51ZQRj2JWEsnZgtCAP5gdbYZZSuiI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB7180.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(11063799006)(56012099006)(4143699003)(18002099003)(22082099003)(3023799007)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?mexta8vzr17d41vkzW5MiwnHvnpyxpjyEJp5IcWv9uMEdXtaOAt7UEDFuD?=
 =?iso-8859-1?Q?Lkliy9q4PRGzJY6IE0H/sGKT1cF45mL1w+UvtwFUCrtobomDllf/x938Ay?=
 =?iso-8859-1?Q?b07dyIcL7w3vhFtK4Inc6jGxBW/HBMgc9mZm7HDO3eYCYiQ2nDcqkHA+bT?=
 =?iso-8859-1?Q?wOl6G+3uEJ2NCQt5CWzLVx0nINwBvGPAJ/TORu5GWJOtN0uh01fej5/FWe?=
 =?iso-8859-1?Q?2U3GqH2elkmOujA6j5JMrd+Y4+nlkrSBmPML+fp/vt/7Q8wQWFkMvBur+C?=
 =?iso-8859-1?Q?Bd0xY36v4gM0BxAsp0HJ8RN4nd47bPidcrKaq3v6sORMXf9RfkJCOeth9z?=
 =?iso-8859-1?Q?hvk/NsMAQztBfx5rRElAZhwX0/fvJYRXaucVpLGML3PQC8TYE6Wp7hqTKv?=
 =?iso-8859-1?Q?PoIqMQC6Fb0JWZq9OhL06BYugzET+dspzlk7Q7r80oIDnO2qTj+5Cy+zHe?=
 =?iso-8859-1?Q?PwvwQS96JOFFffCXbGDKy0KhKUK79XHdioOOWimkrPsIXbkjmOIeH/Gs3I?=
 =?iso-8859-1?Q?Rj4cHY6n25vy7ZP0PV9HH9HPAt1YEr2CTmP+emjwloFryhGIYjOQ+omD+i?=
 =?iso-8859-1?Q?HKHmM9iNKspioIbfpkeEvfX0tWzFlkHFvvcYgrsHflnMogUH40SJaykZHH?=
 =?iso-8859-1?Q?3ZsUndSmPcmDupcXKbDUHAhdec4ywjHHU9wrnX89hErB8EqTJia3nKeghG?=
 =?iso-8859-1?Q?ZgSYpq7oVKYlD4j1+X7cdUKV3samkkStLhHxpElEqZLaNX/17sGnOVixLn?=
 =?iso-8859-1?Q?sMs9HfYzyJaCkVVUBQ4LV9tSW0M3VAgLmPaFnnLrznzw8scXbvyQzIZY5z?=
 =?iso-8859-1?Q?LXPDmxoGfcsXrwxnU6v2nck1l4LVE63l2uSk2e42bjzKD0R014iWDxB/ki?=
 =?iso-8859-1?Q?5JbAbmcjJQC1MvumD9TX4tK7bocvA+h/LwamyPPdCf8FwUcH0hH/NtSG7N?=
 =?iso-8859-1?Q?uRe9mrGMAWbSwR6LzAnXe+rg/aOGhaMr2tRK5wclGcJorAmPBF1yEEZfY+?=
 =?iso-8859-1?Q?a51MC12vgaw4khg2Gtk2GZZELYhY/+h0EpL7h95e0q1gTKnh2IwTgR2NoI?=
 =?iso-8859-1?Q?YUNv48XuFoPP9Y0TOVouyw2paqM9hj/y5/rJqpmg+sdRJw7Ejh/r8IBJOJ?=
 =?iso-8859-1?Q?WaXF2Ec6TiWGB8LbliMQ8hOUKpTLhkH5ZY2xkcgetcmv2VN9a5mKSkPkkz?=
 =?iso-8859-1?Q?NU4vaT2UDwc4517O08RUYtqiT9cnqNzes5wgv5ZUi7FcGkGCFYMJTZPEM/?=
 =?iso-8859-1?Q?5MuS2g2yG6izD0nNikra4NseVrjdYKMMJjvlu/+fFjZ39L3Eh14W5mfRt0?=
 =?iso-8859-1?Q?iHpE19aOAp9tJjELZ6pX2LGc93lqjgjw1yYvP9/1QJ2eZiqk1+LoDTlutK?=
 =?iso-8859-1?Q?JV7uVOOmk41PWwKppF8JQIDz+arC6olr+jp1Gqef5vl3m2Fu5O26Hmn6ZG?=
 =?iso-8859-1?Q?D6YufoW6O+qjPmLXifP1VG7l6404FWaEvDd24EZGJN3dxJfpR6lTeS4oxf?=
 =?iso-8859-1?Q?e9BPR/fUc1LqPUViWl2mFzZBZRKrOf6nUQ11y5s9t/JXF1Z3fOwxFCS0i1?=
 =?iso-8859-1?Q?Q9YYKGDZsz2pL3FflZWxWdfRV5g0+2mbpQdnrUCjw2d06eXVXc9ulgziF7?=
 =?iso-8859-1?Q?txU9jd5q/U9Xiu1PkkCj0VIJkaAbcaeR/1O1m4S2V7V6FpjwX4cHg17Kon?=
 =?iso-8859-1?Q?BYlUz6Qb3UwwfdVe0XEEgebWt7arhcGqqeLPfrGTrDQkDhlKwa+haJ4GDH?=
 =?iso-8859-1?Q?GCu+o27DO+ZWyHkZ/P/IEGkcV0wTmgW/evGRcOqgVaTIIeNQTiEI9f8IsP?=
 =?iso-8859-1?Q?WQIVtdw22lBnH9juRtU9MaKjB1p8kUk=3D?=
X-Exchange-RoutingPolicyChecked: VTyPnYWqK/StZ/o4h51W9uUmtT7dMA9vDADMRpzj0KSeFjtGyDsEaUEWVehfmne+4ORstb+5eajxALKXbA9RTeGquiDoAsl+VhQz7xbqaRpmktBL4nOwbPF6O58sHhYRyo6u7go2wBi6EnIKJLUNQR46+lGMSCgdC1vHMIZ1HoD7gfb6alFLUKp2nddd0lOpXBo2/axS/bdYOOso1b2j8GxyH7ZDxGOQ50MbrRDjhmZBRdLBAnXLo+HDOyiHoVRl+50RKnLcbGslw8nPjxTETzeRZlggveIIsTS9OQ0w3s9BP5NFnqLUXrPa702nccM36O76JYKtmlTigFIj6irN9g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 86bf75ce-c452-4454-0c05-08df249f68b2
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB7180.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 18:18:38.9497 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K7m+/XS7oYYq/t9QdxYDAaUBKW4wpUJ0vJAaMlbAwqZ/st2hcZngM5gGrop7BuXK7oHRfZ48NPHSFfPY4CM+uQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5006
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

On Tue, Oct 06, 2026 at 09:05:23AM +0530, Karthik Poosa wrote:
> Add mmio_temp_valid() and mbx_temp_valid() to check whether a temperature
> sensor reading is valid. An MMIO value of 0xFFFFFFFF or a mailbox value of
> 0xFF indicates the sensor is unavailable.
> 
> Gate these checks behind has_temp_sentinel, enabled on CRI currently.
> 
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
> 
> v2:
>  - Rename info.has_mbx_temp_sentinel to has_temp_sentinel. (Rodrigo)
>  - Return true from mmio_temp_valid() and mbx_temp_valid() for platforms
>    not having support for temperature sentinels. (Rodrigo)
> 
> v3:
>  - Revert the unconditional validation of temperature readings on
>    non-sentinel platforms.
>    This avoids creating spurious VRAM temperature channels when the
>    corresponding sensors are unavailable.

my rv-b remains

> 
>  drivers/gpu/drm/xe/xe_device_types.h |  2 ++
>  drivers/gpu/drm/xe/xe_hwmon.c        | 20 ++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_pci.c          |  2 ++
>  drivers/gpu/drm/xe/xe_pci_types.h    |  1 +
>  4 files changed, 25 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 4e0e1bc040c1..beb0ceaabb3f 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -227,6 +227,8 @@ struct xe_device {
>  		u8 has_sriov:1;
>  		/** @info.has_sysctrl: Supports System Controller */
>  		u8 has_sysctrl:1;
> +		/** @info.has_temp_sentinel: Device has temperature-unavailable sentinels */
> +		u8 has_temp_sentinel:1;
>  		/** @info.has_usm: Device has unified shared memory support */
>  		u8 has_usm:1;
>  		/** @info.has_64bit_timestamp: Device supports 64-bit timestamps */
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 33d0ca7d86e4..5bbcb81529db 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -104,6 +104,9 @@ enum sensor_attr_power {
>  /* Index of memory controller in READ_THERMAL_DATA output */
>  #define TEMP_INDEX_MCTRL	2
>  
> +/* Mailbox sentinel reported for an unavailable temperature sensor */
> +#define TEMP_MBX_INVALID	0xFF
> +
>  /* Mailbox temperature is sign-magnitude: bit 7 sign, bits 6:0 magnitude. */
>  #define TEMP_MBX_SIGN		BIT(7)
>  #define TEMP_MBX_MAG		GENMASK(6, 0)
> @@ -824,6 +827,23 @@ static int xe_hwmon_pcode_read_thermal_info(struct xe_hwmon *hwmon)
>  	return ret;
>  }
>  
> +static inline bool mmio_temp_valid(const struct xe_hwmon *hwmon, u32 value)
> +{
> +	/*
> +	 * On platforms lacking temperature sentinel support, a value of 0 is treated
> +	 * as invalid. While 0°C is theoretically possible, it is highly unlikely for
> +	 * a discrete GPU in normal environments, making it a reasonable fallback
> +	 * indicator for invalid or uninitialized temperature readings.
> +	 */
> +	return hwmon->xe->info.has_temp_sentinel ? value != U32_MAX : value != 0;
> +}
> +
> +/* Mailbox temperature is sign-magnitude (bit 7 sign, bits 6:0 magnitude). */
> +static inline bool mbx_temp_valid(const struct xe_hwmon *hwmon, u8 value)
> +{
> +	return hwmon->xe->info.has_temp_sentinel ? value != TEMP_MBX_INVALID : value != 0;
> +}
> +
>  /* Decode an 8-bit sign-magnitude mailbox temperature to degrees Celsius. */
>  static int mbx_temp_decode(u8 value)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index e44b74b9aa27..111d0aa45b10 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -486,6 +486,7 @@ static const struct xe_device_desc cri_desc = {
>  	.has_soc_remapper_telem = true,
>  	.has_sriov = true,
>  	.has_sysctrl = true,
> +	.has_temp_sentinel = true,
>  	.max_gt_per_tile = 2,
>  	MULTI_LRC_MASK,
>  	.require_force_probe = true,
> @@ -817,6 +818,7 @@ static int xe_info_init_early(struct xe_device *xe,
>  	xe->info.has_sriov = xe_configfs_primary_gt_allowed(to_pci_dev(xe->drm.dev)) &&
>  		desc->has_sriov;
>  	xe->info.has_sysctrl = desc->has_sysctrl;
> +	xe->info.has_temp_sentinel = desc->has_temp_sentinel;
>  	xe->info.skip_guc_pc = desc->skip_guc_pc;
>  	xe->info.skip_pcode = desc->skip_pcode;
>  	xe->info.needs_scratch = desc->needs_scratch;
> diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
> index 448bbe5ba1d7..15eedac8467a 100644
> --- a/drivers/gpu/drm/xe/xe_pci_types.h
> +++ b/drivers/gpu/drm/xe/xe_pci_types.h
> @@ -61,6 +61,7 @@ struct xe_device_desc {
>  	u8 has_soc_remapper_telem:1;
>  	u8 has_sriov:1;
>  	u8 has_sysctrl:1;
> +	u8 has_temp_sentinel:1;
>  	u8 needs_scratch:1;
>  	u8 skip_guc_pc:1;
>  	u8 skip_pcode:1;
> -- 
> 2.25.1
> 
