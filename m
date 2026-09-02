Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD7F9C624D4
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 18:43:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D24F10E43A;
	Wed,  2 Sep 2026 18:43:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ha/LJQW5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03F6710E43A
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Sep 2026 18:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788374607; x=1819910607;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Si/L68pGg5Nwrgleorw1Rw1kM/vfmF7aKnTt0GwUY/M=;
 b=ha/LJQW5xxSuOlJMgl1N//PkSbfYzO75cwiTEngcXmLJW7H0koFj8ux3
 k5JKZ8dk+s2v2dDd+KXB5K2NKaMifGydMEwxz4F/LEZ8VgeI+FKNmkJSG
 toRdY+F+GOJm01h1OLOItHYi9hQ7Fht6cBVYRn2wtddD5ac03/Jx/QKXP
 AKWRKYDFQXRefAnUioa6JzCTmorM/HjWEUMf/5LmKRkUZsxyvVaGnKRE9
 SuDcQPQ4gHobLccUEVuHlcbVC505b27AtZOCaxU8OCTBjnDEwKqFQKmJ6
 0LzoKq907fatYbTkOvqmtp2WZAgOilsFZ5TVYZPamyqODP3h+NBtK6TUN Q==;
X-CSE-ConnectionGUID: YOtzABrPQp+Z1Ia/Pz+U3A==
X-CSE-MsgGUID: m1Ltf6xBTvGUv/Zed4Rcvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="92711010"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="92711010"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 11:43:08 -0700
X-CSE-ConnectionGUID: ewJJPs0qTYq1rXD8r/psJw==
X-CSE-MsgGUID: xt4j3Ee+R2Cto0yGEFvKpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="267732362"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 11:43:08 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 11:43:07 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 2 Sep 2026 11:43:07 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.65) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 11:43:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iKYwBTT4fg63YbTJT3D1LOI2QMdIZ2b+zqNtm4CtijiL0ga6KBn7odNQvj+sy4zcRHwYfPhDvF2zlTgwcbOUcXtA1BScLaFZIxRWakDpmonzSEikWVaGDl3MPj62SKgkWF/wRUYIOaeRAah/lBgQTK5Vn3k3vhq0rBQ/arLpatiBv3Sv5zR2WZ85F4GdVuf4KZ2H/Ay++45GLO6bwUNxLXX6133LjIOcm+U1hW3PJZr89WupCb9ZFtD8LaNp5IDmg5SBAPUBVcpx6+EmWY8rJy7myvZx+3MTuKOdqOc0tD4PjDK7Wu9+Qu6a3bLVRrE7RebzWuD+zkXxUbppUchMow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CR/uDXM0v5kMKhkxu6VuZnsfdyrl9h9uZJPpTgDK530=;
 b=fZaVrslYYDN+P/PSEYwbrdBvSFXO80zamdNip1638//oXbbMUcxWuHx4//ahIGTcMysgOyQEYs3wQuUYPBpXbosWUaPeJOcO36c5sBXPtp3u39QyFCeIvRzFmXVySjKvF+zZE27j0JVbqulyR4TTa80jIPpKa+mTbxpv0gLBgVtfq2wpgTBzSrVezu5lYMY7aHsaSjH1zideQhJC448VeGDR21JG+ub/r/+PMg3H+KZTEc+2hGwNeQreMGQrL5rXQMfyG0LIro6DwBIqg6pTGH3TfJaHSq4PLf+Wn5FxOcxUztinHRQiZyux1qD7TeKBn9VddEw4csv5KxMZf1wmnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by CHAPR11MB9656.namprd11.prod.outlook.com (2603:10b6:610:2fe::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Wed, 2 Sep
 2026 18:43:05 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 18:43:05 +0000
Date: Wed, 2 Sep 2026 14:43:00 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Karthik Poosa <karthik.poosa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <sk.anirban@intel.com>, <mallesh.koujalagi@intel.com>,
 <soham.purkait@intel.com>
Subject: Re: [PATCH v2 2/5] drm/xe/hwmon: Use VRAM temperature sensor count
 from thermal config on CRI
Message-ID: <aphuND-AkxP4_XQw@intel.com>
References: <20260902175507.3910573-1-karthik.poosa@intel.com>
 <20260902175507.3910573-3-karthik.poosa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260902175507.3910573-3-karthik.poosa@intel.com>
X-ClientProxiedBy: SA1P222CA0172.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c3::28) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|CHAPR11MB9656:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bdd83a5-be9c-4546-9e8b-08df09220672
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|10067099003|18002099003|22082099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: 4KU5L0cCtd2wQW4Vl8j8Xm2b7pRPOHCbqAmaz8n396N0bEa3IWTjQ7anrYnMKVsJQN1UYodKoDF9kY0O4NCaubNG+I5AfmqoGjjuo6WorwRO9csNDFt98Hhyx/2KcIk68DebZMet+ASolNmX7Dt9MAn+GK0UNg7H4XJlI5yaOVzuu+oUrZ7fx18MlnYzaGED3l6S7paecnAS3c1Fsyx/Dl0qDyiqg5rBMuGP43ztdzvZOYQh4ydozlZ/uCNT3zyao41J/N5B7asxC2USKnpeStS0+uenreZ/X2HenLd7akR24N41ay3pLt5PJSJ8cCEgaLJz/oaMqxcCU64wmFX2aJVxAAgGvKbpQ1m2yKqWlHAZKfJe4MFo/YhK/RzIUd9sZXMfAblPS/0sBG87XYh9gShz3ZfjB11gxTQ24JVK8tXs1GyJClqErv//UOVQmg0YI2AmyscG4lrkNdR2ZmaALtuK4wtU2FfHD6fB7P4DVGsS08xxOuKKxsR5Y9Kvod+0pmS+Ak88BJiFagaFqMzZmtmNDJP/z2QHUb5vkk69c8+diB6Nu+4LTFWoX2AnPeX9qT3Ov1KvkXuIYN9ua2WErQqN5se4E6CIQ7qw+3SCefwULfYew8Ae/5MyI66+dzDSVNuFw+llDGC5xH/EU8/Gq31+EysuWfigltnB9YB/H1U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7187.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(10067099003)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?E0OWd3kuxQXMV+RREGxQ9/x4kiwqcirZ3GOeVI4J3QASPej3kt8OzT4r7p83?=
 =?us-ascii?Q?4boj2qt4SME9SQCfN9DmK/uX8fGYBpdtvBVTeq+b4o+33DKhurC2GaBOJdDI?=
 =?us-ascii?Q?aaLd0MY7qj9xTNGiP7ie1pfGfIOYlfHpCPG7e9R73FbJi23DGIOQQ5tZWxVQ?=
 =?us-ascii?Q?uZcRcFGWOjw1K3KSihkXR15biFbFs6bw2eFz2Oz6KXPAMNVFz7vTJISnmZnJ?=
 =?us-ascii?Q?Db7asxGomBToXusjWVECiKUuLsFXgPqPdPgJA9SUX0kL7sv9MT6WwDkkyaWx?=
 =?us-ascii?Q?1FEYCkHoCdcrx0rgYhiKhdtgPVxeSjGuZjD6U4otoy/IP7dJseiG4i63W/ct?=
 =?us-ascii?Q?fQPyjC7a53dhiY7L04Bx8dfv9TPYddIwRYtfSWaNlZNjRRck45KTN4pr0ioz?=
 =?us-ascii?Q?aZoTkwzuBWE6OppKR09oAg5P4Bhtw2hI45cA2njCjEfsqU5+IkiU/99cpoif?=
 =?us-ascii?Q?h80ByjnKG9Qmu7EZae7Jh7hRK2C63Mw/hJgdhp4OShpSOCd7wIH9gJAgNdF/?=
 =?us-ascii?Q?YlqGnuTcP9R4aeYiR17ZH3vVsCLslLawNG2buA2DM5tXx1Ys6ioUyjta2nn4?=
 =?us-ascii?Q?VkYhpmlKjwQHDgdZrcrWMqtIxv5YUA9fcqC1TUfcgRel6UdO2SDGo59rJHhs?=
 =?us-ascii?Q?QPQD2NNfX7HiBGFxhs42WbBbGyI8Wr8gR9BOEJ4Q703RxwFqtq/khnmMzDEK?=
 =?us-ascii?Q?35mrLOSm//CxEOkEz8kHLBfqFYJAoVrj2j+oYr/mLwPGzHabhgJ0W/9VFt/k?=
 =?us-ascii?Q?0v7IS6z0pFZqUfUPRGPT0gqeZXo09kBf6G248pGK/LcwAHBErdgX5tjmHEP9?=
 =?us-ascii?Q?BMxFz5Y2gShCOvlUFmllA5VJCr2js3zCoCmmVptdRx/sxPVT3CM+PRzkemzd?=
 =?us-ascii?Q?/WnfSJFoLh/xQFO7rm5AxYdKOldeoC4ad8GkVmfU3tRXcOPtnS3MFO/q+NRt?=
 =?us-ascii?Q?mRKunkX6lYNG8k+01rncIabMqSvPfn9+DeuFoMMgtk/J4XTXqZFfV11OV0TR?=
 =?us-ascii?Q?5adIZyjcbx++jsQTMbzsToaeBhuj35TT3VFC8Ng9ZC1NX+UuZd9JEcb97R9G?=
 =?us-ascii?Q?ef7vW0Ru8xoHzokE9pzjuerT6whluecxFafvxEf7JLOy0qS4fXNbIy4WZst+?=
 =?us-ascii?Q?/om8MoX/D56rAZ6yezxz/ytUw4i/FSiz5tkgexlo+R6qYdtxKKtkCIcndRDf?=
 =?us-ascii?Q?ifRTRQuSz8oVL8B9R3xaY+E0+jIG7EzsNXvBfhXotj+NhJhHkjMV/3nHILqw?=
 =?us-ascii?Q?S7SonIk52Aca7ynOf7Df1QcUS6bIPLMEvXLOmdtfnVdnmvJKEmjUmvkAwarJ?=
 =?us-ascii?Q?gqw4EKoKYOK/53t20/khwipVUug1iJTG+mGaEX0qpxsTiNIt0D9oRW2smJKe?=
 =?us-ascii?Q?pElny4+JY/lJGpaa/BZRAutGKcBjQh5ArC5o7XKXA907CJ0ZLR4wc6vD2zO6?=
 =?us-ascii?Q?S8SKAazfKjVUazvHKNkb0rsoQqDpNJTY/PmrnhQuR8AWCVYPnnmlXTGYpS5I?=
 =?us-ascii?Q?qqE5XWQQeSmQ0OyQXw47rutX32d0LsUgzdu+fg4JfSSunOpNJ9S0X9pkJY9y?=
 =?us-ascii?Q?G/3bhUowcFQqb//wo6XqSzGJQTLO5ceaFZXSKW1Fx+Lv7C3HcI13JGJoCd2G?=
 =?us-ascii?Q?DKicrZN3OgqrtvCX09E2wXdJDSO11B8SH27ihh8pguz1omC25i2WF79Vwkhp?=
 =?us-ascii?Q?DnC6UsFVyytF6BgkJJQeHvlPTkCTw5YSCn3z5s7pH06CHc3EHBn0HvZkLV64?=
 =?us-ascii?Q?b6/r3Gzo7A=3D=3D?=
X-Exchange-RoutingPolicyChecked: xg2D+vPUlpDXzf3ahzLEfaKNNE1+C5ruIVX1UP+6bwa3wgjSLRyC90jLS2qSnEtFfhlJxE887GX4Me25hJ5IXsURcaie9LYWuzA37UAcRBsgboR+MxKgzVRJ4irWzM4b9TAx7Gdc1PooAki0pfMLL6oyQ1sWTHQt8CAzZSUmS1TCXI/3pYwf9qes/0pyp0nFQorKtuOiiaOYMYTfVhfDQqXwDz21Ovz/WoxBQiotJwcvn3PhQ14R2DSFh7qXJu9EQ3y93eGhYUMuHscdLxNYhzGL5C4+T6NhuTZsX9FzJehi8rblgsLzb5FqWXfuHSNgESpgrnCAW3lQSpTYFCj2ZQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bdd83a5-be9c-4546-9e8b-08df09220672
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 18:43:05.4296 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Aii+vfiqZtkJ4xIkbV0XNt8TILsaL5I6cEb8QUWMoXV3SX1WzjKdNicoNGKgLgw+FlcgsKzaKRSBvp4hWSUt8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CHAPR11MB9656
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

On Wed, Sep 02, 2026 at 11:25:04PM +0530, Karthik Poosa wrote:
> Read the number of VRAM temperature sensor channels from the second byte
> of READ_THERMAL_CONFIG on CRI platforms. Use the reported count to avoid
> exposing hwmon attributes for unavailable VRAM temperature sensors, while
> retaining the maximum supported channel count on non-CRI platforms.
> 
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> ---
> v2:
>  - Address review comments from sashiko-bot@kernel.org.
>  - Address review comments from Badal and Raag.
>  - Update HWMON_CHANNEL_INFO() to supports maximum VRAM channels of CRI.
> 
>  drivers/gpu/drm/xe/xe_hwmon.c     | 102 ++++++++++++++++++++++++++++--
>  drivers/gpu/drm/xe/xe_pcode_api.h |   1 +
>  2 files changed, 96 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 9433b47a19c8..a7c04c25e1c2 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -39,7 +39,8 @@ enum xe_hwmon_reg_operation {
>  	REG_READ64,
>  };
>  
> -#define MAX_VRAM_CHANNELS      (16)
> +#define XE_MAX_VRAM_CHANNELS	(80)
> +#define BMG_MAX_VRAM_CHANNELS	(16)

Please remove the parenthesis...
Also invert the prefix logic...

BMG_ would be read like started on BMG and continued after that
while XE_ was the original one...

clearly not your intent, but that is how we should read, so
fix it please....

>  
>  enum xe_hwmon_channel {
>  	CHANNEL_CARD,
> @@ -48,7 +49,8 @@ enum xe_hwmon_channel {
>  	CHANNEL_MCTRL,
>  	CHANNEL_PCIE,
>  	CHANNEL_VRAM_N,
> -	CHANNEL_VRAM_N_MAX = CHANNEL_VRAM_N + MAX_VRAM_CHANNELS - 1,
> +	/* Compile-time upper bound; actual channel count is hwmon->temp.vram_count */
> +	CHANNEL_VRAM_N_MAX = CHANNEL_VRAM_N + XE_MAX_VRAM_CHANNELS - 1,
>  	CHANNEL_MAX,
>  };
>  
> @@ -142,12 +144,14 @@ struct xe_hwmon_thermal_info {
>  		/** @data: temperature limits in dwords */
>  		u32 data[DIV_ROUND_UP(TEMP_LIMIT_MAX, sizeof(u32))];
>  	};
> -	/** @count: no of temperature sensors available for the platform */
 +	/** @count: temperature sensors count from READ_THERMAL_CONFIG */
>  	u8 count;
> +	/** @vram_count: number of VRAM temperature sensors available for the platform */
> +	u8 vram_count;
>  	/** @value: signed value from each sensor */
>  	s8 value[U8_MAX];
> -	/** @vram_label: vram label names */
> -	char vram_label[MAX_VRAM_CHANNELS][MAX_LABEL_SIZE];
> +	/** @vram_label: vram label names, dynamically allocated based on vram_count */
> +	char (*vram_label)[MAX_LABEL_SIZE];
>  };
>  
>  /**
> @@ -271,7 +275,7 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
>  				return BMG_PACKAGE_TEMPERATURE;
>  			else if (channel == CHANNEL_VRAM)
>  				return BMG_VRAM_TEMPERATURE;
> -			else if (in_range(channel, CHANNEL_VRAM_N, MAX_VRAM_CHANNELS))
> +			else if (in_range(channel, CHANNEL_VRAM_N, hwmon->temp.vram_count))
>  				return BMG_VRAM_TEMPERATURE_N(channel - CHANNEL_VRAM_N);
>  		} else if (xe->info.platform == XE_DG2) {
>  			if (channel == CHANNEL_PKG)
> @@ -777,6 +781,70 @@ static const struct hwmon_channel_info * const hwmon_info[] = {
>  			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>  			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>  			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>  			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL),
>  	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL | HWMON_P_CRIT |
>  			   HWMON_P_CAP,
> @@ -810,6 +878,17 @@ static int xe_hwmon_pcode_read_thermal_info(struct xe_hwmon *hwmon)
>  	drm_dbg(&hwmon->xe->drm, "thermal config count 0x%x\n", config);
>  	hwmon->temp.count = REG_FIELD_GET(TEMP_MASK, config);
>  
> +	if (hwmon->xe->info.platform >= XE_CRESCENTISLAND) {
> +		hwmon->temp.vram_count = REG_FIELD_GET(VRAM_COUNT_MASK, config);
> +		if (hwmon->temp.vram_count > XE_MAX_VRAM_CHANNELS) {
> +			drm_warn(&hwmon->xe->drm, "VRAM channel count %d exceeds max %d, clamping\n",
> +				 hwmon->temp.vram_count, XE_MAX_VRAM_CHANNELS);
> +			hwmon->temp.vram_count = XE_MAX_VRAM_CHANNELS;
> +		}
> +	} else {
> +		hwmon->temp.vram_count = BMG_MAX_VRAM_CHANNELS;

looking this code here and thinking about the defines, inverting the defines
will also end up with an ugly code anyway...

So let's do this:

define a platform info:

u8 has_fixed_vram_channels:1

set this true only on older platforms...

then

#define MAX_VRAM_CHANNELS	80
#define FIXED_VRAM_CHANNELS	16

	if (hwmon->xe->info.has_fixed_vram_channels)
		hwmon->temp.vram_count = FIXED_VRAM_CHANNELS;
	else
		hwmon->temp.vram_count = REG_FIELD_GET(VRAM_COUNT_MASK, config);

	if (hwmon->temp.vram_count > MAX_VRAM_CHANNELS) {
		drm_warn(&hwmon->xe->drm, "VRAM channel count %d exceeds max %d, clamping\n",
			 hwmon->temp.vram_count, MAX_VRAM_CHANNELS);
		hwmon->temp.vram_count = MAX_VRAM_CHANNELS;
	}

>  	return ret;
>  }
>  
> @@ -1507,7 +1586,7 @@ static int xe_hwmon_read_label(struct device *dev,
>  			*str = "mctrl";
>  		else if (channel == CHANNEL_PCIE)
>  			*str = "pcie";
> -		else if (in_range(channel, CHANNEL_VRAM_N, MAX_VRAM_CHANNELS))
> +		else if (in_range(channel, CHANNEL_VRAM_N, hwmon->temp.vram_count))
>  			*str = hwmon->temp.vram_label[channel - CHANNEL_VRAM_N];
>  		return 0;
>  	case hwmon_power:
> @@ -1636,6 +1715,15 @@ int xe_hwmon_register(struct xe_device *xe)
>  
>  	xe_hwmon_get_preregistration_info(hwmon);
>  
> +	if (hwmon->temp.vram_count) {
> +		hwmon->temp.vram_label = devm_kcalloc(dev, hwmon->temp.vram_count,
> +						      MAX_LABEL_SIZE, GFP_KERNEL);
> +		if (!hwmon->temp.vram_label) {
> +			xe->hwmon = NULL;

ouch, please, while at it refactor this function to the most common xe style:

	if (!hwmon->temp.vram_label) {
		ret = -ENOMEM;
		goto err_null_hwmon;
	}

-	xe->hwmon = NULL;
-	return PTR_ERR(hwmon->hwmon_dev);
+ 	ret = PTR_ERR(hwmon->hwmon_dev);
+ 	goto err_null_hwmon;
	}

return 0;

err_null_hwmon:
	xe->hwmon = NULL;
	return ret;

> +			return -ENOMEM;
> +		}
> +	}
> +
>  	drm_dbg(&xe->drm, "Register xe hwmon interface\n");
>  
>  	/*  hwmon_dev points to device hwmon<i> */
> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
> index 94575c476e3d..e1079eff72c6 100644
> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
> @@ -57,6 +57,7 @@
>  #define   PCODE_THERMAL_INFO			0x25
>  #define     READ_THERMAL_LIMITS			0x0
>  #define     READ_THERMAL_CONFIG			0x1
> +#define       VRAM_COUNT_MASK			REG_GENMASK(15, 8)
>  #define     READ_THERMAL_DATA			0x2
>  #define       PCIE_SENSOR_GROUP_ID		0x2
>  #define       PCIE_SENSOR_MASK			REG_GENMASK(31, 16)
> -- 
> 2.25.1
> 
