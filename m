Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A84FCD98E6
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jun 2026 05:55:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2230E10E03C;
	Fri, 19 Jun 2026 05:55:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GvZbFHxH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A91F10E03C
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Jun 2026 05:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781848534; x=1813384534;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ej4yp2f2LeaDAVG82GW9NZ8Knyxsr5FkY3noPBwG7BU=;
 b=GvZbFHxHmxJzjGdpNgfa3EaEzj1+v8VP5KmUJ5H7c14SP5rX8YigNHRY
 +z0h7jc4jJeX+qjFr39Yq0muTHsm3WU7QaVQY2Po4/sQOUgZO5e5wf7rP
 lxO/Uf9B2IzLuVJcmCaIzE81moJ8Yn6e0SRkhQxOXHdJfck3Q6dRgvONM
 BbdUf7mqi4JDJpTNvxeKuKVrkiJv9K4VmlpZDmPQkSCPdKUd77qvCXUay
 x5DsksJwAq6Oag3FMC0b8Qa34QEtrH//mKetGWPi468khXS/ICgk2AWOi
 7R5Qq6PBGvOkAOGlFJGKwakR7FUSAHO5GL7/6QfIyEA07H9M50Xu0qTG4 g==;
X-CSE-ConnectionGUID: vvefa+AXQveKPihFedG2ow==
X-CSE-MsgGUID: 8HWVW3GgTvKx+XGtACnZMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11821"; a="100126736"
X-IronPort-AV: E=Sophos;i="6.24,212,1774335600"; d="scan'208";a="100126736"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2026 22:55:34 -0700
X-CSE-ConnectionGUID: mrBqTs02RmuivphkjnjPeg==
X-CSE-MsgGUID: gjAoSIqsRSq1k2P9QYZ1Gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,212,1774335600"; d="scan'208";a="246203251"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2026 22:55:33 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 18 Jun 2026 22:55:32 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 18 Jun 2026 22:55:32 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.35) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 18 Jun 2026 22:55:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=adpeCr33w4BwSNZdKEE2OullI7GvA8S5ocsziXqNYGnVe5AahiurZYTAVDTTGuRwZG4HdV8iSrVnVKqVumjrAlZfw5Wi5A5OFDYdG5JeTIaW1vCSJIrAZKSNXQTFD7e8+HJ/xnXyGmnx59fk+DioqAqxAjsOaSwNIjYTbJUdgCDRw7tN9WDfvXpnqPHSuHm/zAQuYxX7h4mttTcrZB3685RKfSsOMT066dnRFYkqFcsiYxLDWXctRULYZJBJVwWYGAb3eLxEBEdwqEJGt6bOz1VCmIHpfz+8BJ//WNbT2PXsA4F73J1QvkFWhyJVvnsPu0m5yviiegVyRYTbGPrYnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pl81dMUbXASbbZqJFFWAZIPqcseIx+zXMTod4TtTluk=;
 b=BqBrdEsJjueen0qd/KHT8qMrQFtOPs9lxyHjwdUu5ycey/D6y1Q9jpt0syTr7DIzT2eahIHJ1GwqJ74tqYzSMqkubBrvraQgTGemmsFk6ptbnjC1JO+uWBAZU7cHAxM25oMAPezIi4MzONd+CV1EE53CGfmajqDHcptlvx0DQXU24n+44ce1NFVGuNj7fSUUFPrndhANnd5+5gjp+mfToSndVtIpyGGgZAuza+fnK7meUnYGif4BZ+cN4Dmg8v7yUOfIHyjpgc3wQRet/k+wkbleHFTwXSExpnFp4FBevbrHKVQRVbSp4mwhiCN2JXCCDOXsPP9K5jHt+1FeSWN8vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 DS7PR11MB9450.namprd11.prod.outlook.com (2603:10b6:8:26b::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.11; Fri, 19 Jun 2026 05:55:30 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0113.015; Fri, 19 Jun 2026
 05:55:30 +0000
Message-ID: <b8c810c6-d11f-4c7e-bee3-4c918e232ade@intel.com>
Date: Fri, 19 Jun 2026 11:25:22 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/1] drm/xe/hw_error: Defeature hardware error handling
 with system controller
To: Raag Jadav <raag.jadav@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <matthew.d.roper@intel.com>, <mallesh.koujalagi@intel.com>
References: <20260618153209.110899-1-raag.jadav@intel.com>
 <20260618153209.110899-2-raag.jadav@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <20260618153209.110899-2-raag.jadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0043.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::14) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|DS7PR11MB9450:EE_
X-MS-Office365-Filtering-Correlation-Id: 99fbcf47-ad2a-4c93-fe79-08decdc75e95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|18002099003|22082099003|11063799006|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info: bLpDPl681YcjgvE6QiifNoCVMCJuxEyjFiFsN7gNUt3R/vP8M2sl8IWV3Wot+4WAiq+oD4Anowk9doWtsY+qZbHyUVb4v3SCvDGoZEukSRMIQoWLDxzZVKEWkCmgnYtn3vez4sCUOoRP28WVjftRzA85DcZwfdLLzZiUdXAPj9mFIeLmboDsc5DJx3zlO1kQiBM7CpUXaWjmYa2aZpvzInX077/y11UWxUap4uZIGXDCVcQB6Ao666vNLg72e+k2qKrcdSL7vFGR1QTFJENUvAqv/NapgTIn9Nj5ReydbE7Oig0OKLJB04VYWpmYGOArpqr68WeDRG/c2ebq5f2358WyHhyIq8L1vqdZanVW5jGkr6Mo3p+Rm8jm+CpF1nd4Nx+KZBMq/V3bgF4oDvph9DxKWBOOVEGRJqoOfYwDV2DLvfE8IL5CQnKaTuco6fto1Gy0ng/cSV1+3ueMJ7hOZT4W9wSv8YPQvQ2T0/OBBQmTWlA0NGzjxYPQwzMtPA+tpeX53iiuQmudF8ajttstpWgySk7lKGoOP8qEChA6ImY9Zg/1oGZa9p5c6JgshnBacVUSPaeLd3q64CLv1Of9jcMiuuH47h7/Gbah4R2HOeyWFX35VMnYGHs9HPuhDpKobN6S1/IkhYv7UspcPa1Hdpse4g6MLDLazVKUNNu1QTc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(18002099003)(22082099003)(11063799006)(56012099006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WnVaa2VIVnhJK3NNMlhkZkVqM2ZtU0V6Q0NpZ1NRVkRrMXU4aWliU3JPek9m?=
 =?utf-8?B?YVptUlJkS2hTeVdsMUQ2Y0lWSlJtTHJpblcwTldQdnB1RFpWV1FERXNvdkk2?=
 =?utf-8?B?NDJORzcvemRzb0RDWEJCMU1xV3BjNGtaSzh6dzdmQXRrSnkxcjdENjUvQXMv?=
 =?utf-8?B?QzFKeWFucVA3RUloRXlxVDV6KzZNaE5WNGJjTWJLWFBVYUYvWUY2SXducGYv?=
 =?utf-8?B?SlhkQjUwZGRpdklFc1BIbTd5Q2VvaS9vZEV4UjhtRW5VVksxM0hGSjR4ckJS?=
 =?utf-8?B?Q29pNDRLN2xET0Y0MFUwOTliTUNFOEpWYXZhanBucEo1MWRITTNFT0tsODJI?=
 =?utf-8?B?SVIwUENwdlpLdVFnRGN2dmd0VGtFdEREd2NYd0FnTys3NVR1Qml5WkZPbnll?=
 =?utf-8?B?QlNyRTdtMjV3M3ZGSmxSRkdXSnJndzIwNnlqSVVCb1NUb2ZSQmpCQUFsWmZG?=
 =?utf-8?B?YlFlVytVWGRXbHdHUk1YMjI4WVp5YVB2ZVpHQk9Tc0hTd0cwTHdrQkxSYUxp?=
 =?utf-8?B?cVJpUVVmbE1maVVHUnFDNm5WY2FVcE1JazVWYk5jRXRBaVVpbnJqZ3BDSFh6?=
 =?utf-8?B?U0tNb2RMdlhuZVFxOHhrQ3NUbUp6R0IzakMxSE5vTDdnVG5CSno3UTg5RDhK?=
 =?utf-8?B?NEtiOFBtM0JZaVNmZW9VNGw0enhINmpxQkdkNXNpRXNLUktTSjlYdXYybWxj?=
 =?utf-8?B?cS80NzhUNDhoWVlQemdaTmVaQTIvdkdDZjdubksrdW05VGtZUXJDWVNxeHpW?=
 =?utf-8?B?MXRYWmxhNkJqQTJUNUNkQTdUd0ZyZXlVTHVBT0xndDh5eU1FYWt4MEE3VFF2?=
 =?utf-8?B?MExWK09hR2xtb0ZrUk02ZWg2UUJLdnFKck5NWVdVeGFtL3Z1WnAzdk9zZ2Jw?=
 =?utf-8?B?YkNZbWRicDRMTnl5blkzbGJIRlVhYzM3a0FZQTlOajZaZnJJb2E4dHpHc1VU?=
 =?utf-8?B?end5alRreVNOY1daUzJZWkkzQ0RQYStFdnNzNVZWMzBUWmhKOHlINkl2YlAr?=
 =?utf-8?B?eGJFMFN2cVR5SlhGbHEyQWRqMmJhdmFlYnNsbU0yakdxcTlGUlZCZHNESElw?=
 =?utf-8?B?RmszS01udnpDVGVjZjlDMlNaZTRjaUxpcGw3K3JxWkYyMkdnVWZKUXVvbWZU?=
 =?utf-8?B?Ui9MODh1UXJQVzA2eG02NHVMcnJ0WlVYMnZEcTdFRi9qbGkwTGtjU3lEdmUw?=
 =?utf-8?B?OFN2NHlwTkNWRHB3WmMvaDh6bXdLYnlGUStUcFN6cE4vRGkwZ2ZoekdGbWZD?=
 =?utf-8?B?M2EvdnhxOXF1aTd2WWxQWjRUNkl1Y05hclVYUDlTVGc0RGgxdGFJOUJveVRX?=
 =?utf-8?B?bXFwM2hLNUVXWVBmNXFpZUR3ZHJrZXBFV0VPQWI0SFdKajc0SjJGZDFNZFVZ?=
 =?utf-8?B?WkF3Wi9JZFNiU1hOeGNwa053RVlZQ0lhdi94djFFa2l5cllveTdFS3J3eEEx?=
 =?utf-8?B?a3l5emFQb0JtQlBBVTMyaHQyQVJlcVVIOGpJZzRGYk9QRlF1UU44ZWdrenpX?=
 =?utf-8?B?K2hJcWJLNXhJaTFaNm5OZTV6V0oyZXZjMlU5UUlpZmdRa2FldE5CTVpXdkgv?=
 =?utf-8?B?djNoVk5PLzdRMnI2R0E5N0xyOXZmNEdIUFR6QlJ2R2dOVlBaU25GbDJnSTd5?=
 =?utf-8?B?QXlIcmxyeEhHUnNDaW1DS2xNejVCdk42akU3Yk0zZTBVU3ZpMjNIY0lFOExy?=
 =?utf-8?B?ZUgrWi9HQy9ZT2hOR3NWYVFkRTlsM2VaU3c2UVFFVjNZOTZqOWlXekluN1BL?=
 =?utf-8?B?bmFPbzk0K1ovTEJBWmszK3Voam1XZXBCQmJJY2FBS1pGMGxtb09UbVBJQzI0?=
 =?utf-8?B?TXRNcUdPaEFwbHV6czBjV0RsclI2WXpCeE9JWUJmU3o2endQRFhsZDB5dUwz?=
 =?utf-8?B?OVc3cDBwaE9wNzA3cVU4b0ZLdUlLakdiMytzR1VJWTE2Z0lkUDRkbFZiNUhw?=
 =?utf-8?B?R3BlVzd1bkZmdDJoOTNhRjBEUUtSRHk4WlAzamVtb1NadGIvbWtiTzJoSkZ2?=
 =?utf-8?B?akoxbXU0ZjVZMXg0eDI0L1pnVnlwcS9LL1duL3QxQXFvdHdGZDV6aVZKUmp0?=
 =?utf-8?B?TWQ0NHdpTnZZd1VqeGZwSHZlTG5EWGMwaWhCOUhwcURTYVZyL0QrR2h5ckF2?=
 =?utf-8?B?QVBGMHQ3SXlmeHc0VjF2bVFrRnFrcHRqWEhMWDU2Y2xLa0xJdDhDcFczK0Jh?=
 =?utf-8?B?MTJTNDd3djlIMXdJZnlzRG8rRGI0WTFac01qTzBsMnpZV2lmWDJERzd2RDFp?=
 =?utf-8?B?bkNpNWxOQ1Z6UG5WQlEyRnk4K0NENk56aUxxdjF3aGV1b2g1RmROM0I1Wkt2?=
 =?utf-8?B?MTZvc2Rqd09oUmtJL1JHUUtnZUhXaWk3YlIyWHkwS1d4RENqQ0pDQT09?=
X-Exchange-RoutingPolicyChecked: Hqi00/YiR+kZiq+YgZDTyfPWEweAQVabfhlOaR7AULszTQGdHRs9B3ub/l80k4Hi03bFq+gBe7vimxWB3DaA+UvXbyNS7ivysajyRL0b4/0BiXEPVSuV3PFP+7iDzngvM8aSiPhzulnC11M4xtOWS/t5qDKaYikssaDT05EQZwELzRk7poTjbEG11f3Z8d5JckJFCEdJIWwuCkTG3zRYfPSDn5lyDzMhAtg5CoSSclYFth+XnN7GBqQpmhUlOYJDA0yUWZjPwKxvQ3+uj3JvseJiD6wPsm6JkkwbdDKF4E2cayang2/UlaBBAqVMmo2CwZQXLrS51e6mfOFQBd8VAw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 99fbcf47-ad2a-4c93-fe79-08decdc75e95
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 05:55:30.6018 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n0/mCEKmhgjHN2q4VO5aKWdIusGM5X7/7ZbmnsiRsLKmH0RfMhIBJOR4vAUpQx/xyfzWmG6NceI6zxxQuCjuVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB9450
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


On 18-06-2026 21:01, Raag Jadav wrote:
> Hardware errors are reported through System Controller on the platforms
> that support it, and never routed as direct IRQ to SGUnit. Defeature
> their handling to prevent unexpected side effects.
>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>

Thank you. Added Tag from previous rev
Pushed to drm-xe-next

> ---
>   drivers/gpu/drm/xe/xe_hw_error.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
> index 3c1dc9f83d1a..4a4b363fc844 100644
> --- a/drivers/gpu/drm/xe/xe_hw_error.c
> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
> @@ -437,6 +437,16 @@ static void hw_error_source_handler(struct xe_tile *tile, const enum hardware_er
>   	if (!IS_DGFX(xe))
>   		return;
>   
> +	/*
> +	 * Hardware errors are reported through System Controller on the platforms that
> +	 * support it, and never routed as direct IRQ to SGUnit. So we should never be
> +	 * here for those platforms.
> +	 */
> +	if (xe->info.has_sysctrl) {
> +		drm_err_ratelimited(&xe->drm, HW_ERR "Invalid error routing\n");
> +		return;
> +	}
> +
>   	spin_lock_irqsave(&xe->irq.lock, flags);
>   	err_src = xe_mmio_read32(&tile->mmio, DEV_ERR_STAT_REG(hw_err));
>   	if (!err_src) {
