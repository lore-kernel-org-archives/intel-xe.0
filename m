Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF162C021AA
	for <intel-xe@archiver.kernel.org>; Fri, 21 Feb 2025 12:16:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FEC410E21D;
	Fri, 21 Feb 2025 12:16:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KzesBNi+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D817010E21D
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Feb 2025 12:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740140162; x=1771676162;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=bGV8DPw2SVKeOzLa6NGaJENF1SVBjFr580Ow2r62xrU=;
 b=KzesBNi+JEATsR1BgOQBesk9j6Mm99ylju2M08n/t2xV9PIwTyhaj+Gy
 HJdWbI+drMtyyHPWIRyFy0pqY0D0+4CThGtyPOGrjbAuwe9e3SHdIwQEb
 Xz0XSoO07t9adHWeOgf1LBL4Sw7bhXkp/hV4jh0C0kcXbnYiK7fUcJ4oG
 KahyVtj03DnoHE6RoXJSjG367LWdYhIPU1Zd+e3mKIXYtRi0ga46EqS+t
 /1SXybuQw5jFrBuRS9QE1YHx0nLcN9UXTYCNMX/eL3Be+dRt5wxQSXgeh
 mPPFYbTLnUs8kC/FF+GBv8+xnivsKh4Ljg24+eR8bzXehHayyS9vT/Mir A==;
X-CSE-ConnectionGUID: hVo7aB65RnuH2ahmPgk8Lg==
X-CSE-MsgGUID: iUDHkqpsSTmnJ2Dgx+d5JA==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="51582620"
X-IronPort-AV: E=Sophos;i="6.13,304,1732608000"; d="scan'208";a="51582620"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 04:16:01 -0800
X-CSE-ConnectionGUID: cG4BKgt+TLWNvtZFrTDviA==
X-CSE-MsgGUID: CBWYQnp3ShaFrbRc227ncQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,304,1732608000"; d="scan'208";a="120335937"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Feb 2025 04:16:01 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 21 Feb 2025 04:16:00 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 21 Feb 2025 04:16:00 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 21 Feb 2025 04:15:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nl6OkYMV6jnKOo1cFefDrY6K84H9rb/gLje+X8DKLpYThFJJFtoMYJflSB5PL8yOARQk59jTOE5UYbDXyDvTJGIbLm4Ek93LIayxNhqrF8vuOK5kczvo5gRUgpdbZLbuwEo+uCcpTcPJaLv/AzWR8MYdixkZ34Z529RFMPpgj2z7EeHmP3LwZA77jiIEYIa59r7VJcktnBh/3tVsqP199Xx73R3SsoRsDIKxgwzuqUHGarqusddiyB3u36RvUNoW5JyYvD53AWpQpFdP2CccYkawOWuce4ndMX3sgCft74AqByfiIv8L1zY3igHrkbP5pXNM/ww2FW7PHM3DkEqL0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HCtpcDsxniP8AtjYXLsz7U1Ar5Av34ZHFNMKvP89i04=;
 b=Xuac1Eze3lDRt2MGEX5rtjpBH9+OUep0ZqwC2Q/YMa6GEcjXOqMK2WuSjAnUshLefwj6RjxgCqwFBi9KCxZZuSsJL/wI9K+4zEWPQ/5CpSTlpNl5EEW0YZUeb4r5sQkR6elxUnpQxpR1H071W8dl7kytdbh+pVdvzsaaCB1PM98DsZkLlqRN2NiRY4tV64TmUxD9QVvvfUTSF7Rok5sDqEkJ2jhZ7GEVFDh1oXRANHTz8eYcKKIlNTf4aGPeoKd7gMTJOBEi7JhvWvzT4ZXKylrb0VTvFKv8Fogl8JDft8Nzw8oRhU3x5hvpF9bY1dWRzJXw4ClJGp+jFqkaRpVpzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5627.namprd11.prod.outlook.com (2603:10b6:510:e4::9)
 by SA3PR11MB8120.namprd11.prod.outlook.com (2603:10b6:806:2f3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.15; Fri, 21 Feb
 2025 12:15:42 +0000
Received: from PH0PR11MB5627.namprd11.prod.outlook.com
 ([fe80::3a92:35da:2c3e:b94b]) by PH0PR11MB5627.namprd11.prod.outlook.com
 ([fe80::3a92:35da:2c3e:b94b%5]) with mapi id 15.20.8466.015; Fri, 21 Feb 2025
 12:15:42 +0000
Message-ID: <cdca2006-e20c-4aeb-94ca-434153c00dad@intel.com>
Date: Fri, 21 Feb 2025 17:45:37 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] drm/i915/display: Use display variable in
 intel_bw.c
To: <intel-xe@lists.freedesktop.org>
References: <20250217153550.43909-1-gustavo.sousa@intel.com>
 <20250217153550.43909-2-gustavo.sousa@intel.com> <Z7N1h5KwKChOf7iV@intel.com>
 <173982273381.1836.14753842719891424686@intel.com>
Content-Language: en-US
From: "Vodapalli, Ravi Kumar" <ravi.kumar.vodapalli@intel.com>
In-Reply-To: <173982273381.1836.14753842719891424686@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR01CA0146.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::16) To PH0PR11MB5627.namprd11.prod.outlook.com
 (2603:10b6:510:e4::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5627:EE_|SA3PR11MB8120:EE_
X-MS-Office365-Filtering-Correlation-Id: d462161f-3db7-4a0a-f2e0-08dd52717606
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RkhIOUM3bFhkUUhCMUQxaEpQTEF3VWs5Zy9ZSCtyb0xvY1lubmhMZkozRHk5?=
 =?utf-8?B?R1p1Uy9zeExoUTYzZmo5S3hQbW00N1lLYzM3OTJmNmJOREpFSnFucWIxTHIz?=
 =?utf-8?B?NVRXekVGVzBQbXVZbUFxaUxOK1pEZmZaRUZzbDROUkw2N2pjMTY2WDJGNUVj?=
 =?utf-8?B?OFZzaGo0dnh6R1U4TTdXWmRWS0o4T0Z6QmF4MEdyN3IweUNSR08ybjlycWN6?=
 =?utf-8?B?T0hsUVhOc2ZCQ01FRzY4MjIrVUlPSGNtY00weUVYUTA3S3ZtU0p6aEpJWkxl?=
 =?utf-8?B?WDF1QUtiM0JSUkxHTDV3eVlXM09TakRIYWQvY0o5dXZYYjY3dHYxQzdMeTFS?=
 =?utf-8?B?VWMwUHhtMXpLKys3aFQvcEZUK2V4NnEzK1dFUU9PbDlUSGFDeVJIemt6YTJn?=
 =?utf-8?B?eUpkUDRNWWJ2RnpLbnhtSFprTzROaWUzQTFkQjJ3QjNITThCTTBMUG5WWjUr?=
 =?utf-8?B?aGVFNDF4Um94VkhlYWUyN2grSGJXS0xWQUZIRUUzWVBIeVlFZHlVZ0llSGFS?=
 =?utf-8?B?NnBTeXZBVVlPaDNGMEpySlRjT1M5OTh5aHNMSGRSUUtUOGlvL3BRdFZzUW9M?=
 =?utf-8?B?Y1A4MXQxNm1SOFAzVzFvcW1WcW4vcDNDNUVNRlcrVTJjR2dWREE4RGwwYVBJ?=
 =?utf-8?B?ZSsrK1pwbzJUQjh2VGdzVHdLYVUwNUJQdjRJWTlFaTlROUhPTjZwN1FzL0JW?=
 =?utf-8?B?UWpOTHVyZUN6bm1RWjhQUzdCb29waE1CSk5uZ1NoQk9KRXorMSt2cUFBT29t?=
 =?utf-8?B?UEs3bXRsSG9FWC9XVTl0TWtLRUljMmFKc2NsSUxEV1k4eStYUCtRN2VlU1ZY?=
 =?utf-8?B?QVZWRE44bDhyMDNIV0lQOXRQSDQ0RzQ5UndraXQ0cW5TbVlVNFZaUVB4bDVV?=
 =?utf-8?B?cTdKYXppK25qRVJ4eXhRTmM2dlFyMHh3UE5UVXFvK3NCTXpYd2xNbFhBcUhw?=
 =?utf-8?B?dDlQeCs5ZUpWSXdkWlpYNTJxbmptVEZYQ0dISjdweE8wOXFZK3ltckpIOTQr?=
 =?utf-8?B?UFFTQkJ0RjVUWFhxREhnNy92ZjdBS09BeHVRVE1ydjYrVW0wNE95SjFQTlhM?=
 =?utf-8?B?R0xaZ3o3NWNPYm5pVmtUNVdaMDZoWDRsKzVZVktSSnR3WjBwMHFMSGlFKzdR?=
 =?utf-8?B?bGtPREtRMnhGTkZmcnUyM0lSaXI4dzIyYlJmMHNyeHErVWZYaXZkK3JSd2s3?=
 =?utf-8?B?SHNvSWljZ3prdC8yWWUzeHhUdWY0THltOG9lMWRSYUpwdTFWcU5FZlk4eVRz?=
 =?utf-8?B?ZXRpVFAwaCsyY1lOUUhFWHdZSEYrcUhwWjFNQ2d4VzZHYXVmb2xnTDRESjN6?=
 =?utf-8?B?cnFndlBYV1BaNUsvMS9TS2lTNEJmb09LOVYzU0JpMkpGQXloR0hMemUreVJB?=
 =?utf-8?B?SFI2OTRZK3FIQ09CbkJ4RGlkd1E1VXBicUdveVBaZkpoZzdrWXBYcTBUMERl?=
 =?utf-8?B?Z1BhL3lxcmtJd0tSMTJLQThFZmFJUktmSWdIVHhPZGFzMTAxSHo0dU5CZWhv?=
 =?utf-8?B?cGVDTnplMzdHRTV6MlpQbnlIVHExNXJhelI4Q2x3K0ZUVVRrWEZmNGM3d3R5?=
 =?utf-8?B?N3NOT3N4THFXOFFaaCtEa1NWQTNzQkxRWkk4WThnRU8vWWIzYzlsTkk3WWY3?=
 =?utf-8?B?T1E1cTRFQU02VjYySytOc2svOTY0dDZWVW9adUJlWUh4d1pSU2VFWnZKS0Jz?=
 =?utf-8?B?Z3M1UFdEYjE4T2FaNWRPdXFYOW9zeVViRjNJS2RzNFdwMnp5RUxaZjBQYWFR?=
 =?utf-8?B?eThlZjdRMElKQUlEVzFjSk9raEdoRE9xVjZRTjB0Q1VXTURHVWtQd0tCZHN4?=
 =?utf-8?B?THNhSDhRUEV3cEt5cVVVZWhSeTZydkpZd3dLeTNSNkVRL28xSXRPRStmeFcy?=
 =?utf-8?Q?Z8G1ZL11r3Uw7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5627.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UjcwdmhZY1JrTVJVOU9yWU9CYmYrUHh0YWpzSFk5OGJ5NXdOdGlOK1d5MGtP?=
 =?utf-8?B?Wlk4YUs0d3pCUHRhaVBLYVVTVWFPYzVQdmltUzBCUnptOTFFTklXd3dOZC8x?=
 =?utf-8?B?UU9hTHAxRUtSUWlQWG1YcEg1c01vbzNZR3FNTG0wKzVwR3NSdHpsWlczaEZm?=
 =?utf-8?B?NVU0RHNzclBJQW1lNVpIZUJRQndlbVdibXZtdWpjeU5uZHd0OVltcmdwZnZq?=
 =?utf-8?B?Q0pCaFlDdTdBSVA1QnErS1FnVjd0eWJqV0tTS1B0S3FaM2NnRG1IdVhramRE?=
 =?utf-8?B?eXNKK2FkTXcydytmeldzdVdzbDk1Y3JoclplcC96Z0JJMUw5VDBhSDVPT09U?=
 =?utf-8?B?RGdRanV2UFFUeTV4L1FNenlsaW5KUEJ6SktrbFhiTG1GWVd4MVpBTldTM1Bi?=
 =?utf-8?B?aTJrdWJCQnBXK1VBa3FsTmdwcDcrLytTMCtKM0xoL0ZqeGtrU1oraWlMSk9G?=
 =?utf-8?B?Zm4vd0dmYm1zUHE1TWdhRnhEanY2QmFieWRxbHQ2VzF2dklxWU00RUJBclh6?=
 =?utf-8?B?amJDZ3d4TzI0dkV1WTVhblRFNlRmbnpuOU9zdGVHUyttcFRXRlhKNFcwUWZT?=
 =?utf-8?B?ay9nbTdHR25jM2lwRlhXUjAvb2pXOXZjOXNyZWpjbVNKUEk0TXVCTjk4Skhi?=
 =?utf-8?B?WVczTDlVNVdFVHFqN1cxNWx3RkZ2V0NSZHNwTXNFS2pjem1SQkxEYUFnaHEy?=
 =?utf-8?B?N3pPbitTNDBrdFBySWdQWGYrams3bmJEM1R5RmRmbndHUjkvN1MrWlFrTzBP?=
 =?utf-8?B?NldYbURGVzdsRTZTVXFhOHExMWg5Ui9FV3hvd0hacTRoWHg5WjZPTGQybmV1?=
 =?utf-8?B?OUxRemxUc3haSTNrQVAzUi9YN0NEUWNZdXgrcTQ0WktWRjZwNFlwOXFDK1Z0?=
 =?utf-8?B?djZxTHU1UHpyWlBwRXY3SjNETldYQU1ERjZBQ3ZLemVqZVhMNzJ5MmluYUZP?=
 =?utf-8?B?Z0daMmdTWG5kSmFEQzFzL2VuUXpIcEdWaEYvQjlUK3ppS0NITFhQZ083MEx4?=
 =?utf-8?B?QS9VclZxTU1ISHNja0lKazBKQVQweEYwVjlFYzBkZ1F4Y1BwUWxORm1HN1BE?=
 =?utf-8?B?WHpNQm9SRGtTeml2dWRvc2VaTDNteTBSREZZRnlQa1k1bVhNc3FFUEdqa08z?=
 =?utf-8?B?WGFyNzE5b3J3dCtJK3ZjWVYrYkIvTFhQakEzdHAzWWNleXlXTkpmdlk3RE1X?=
 =?utf-8?B?cEZ3SWhJaVVFdmY3bjJrMzBLTU5NYzVwamgrSUJSeHFvUzRzdHpLdktRTGFS?=
 =?utf-8?B?OVl3YmxzTDhmZGFIcUo4a0UrSFZqSzRSVFM0c0VPcUtGSXNnL2w3TjcvWHoy?=
 =?utf-8?B?RGNPV202YkYzclhCeHdheElXdWFZOE5HUjNVbEdBSkloNjN4amROOWlUUzc4?=
 =?utf-8?B?T2xwQ1M3SG5kN1FYVi9MejNUZGJzR2JxTkx4ZW0veEJ5QXk4OXZmWTVMaHha?=
 =?utf-8?B?MTh1TzVDNG5DOTBxWitIRXU3dVNjL3IxUzVZUG5uTWNKOTduakQwM3cxSGQw?=
 =?utf-8?B?NlIvSld0WXdRd2ozd0hGSkdtRnJGV1VUWWJ3TXpKL2xjWWNweHlDNWZ4UFlJ?=
 =?utf-8?B?ZnVsUDBpMkp3S0ZRNHhJVWhPaEdpMnN1WGJTcEF3MUIwT0JPclB6WEhtb0lM?=
 =?utf-8?B?NGxRRm1aeXY0dXBsS3Z5Y2d2eWd0SnBsblIvQjR6Z1dQeFJXbHhTVGNsQkRs?=
 =?utf-8?B?bXhFT1h4cnhLNVNOc0ZDcjVhZE5aK0dTZ05qcDlySVBLVEIzOTUwQ0ttRUc2?=
 =?utf-8?B?MFF2b0huRUJINGtaRTRHTGR3QUt1bFJnSWZQL21GeDZIOTdKWnVDMEdJS2E3?=
 =?utf-8?B?cTFmMHd5bVZvWWtiTjE3T3M5bm5JM3Z3enByUm8xNXVmOS9OVkVxVUh0QjFY?=
 =?utf-8?B?cjROZTF1SWVrRTV3ZG5LY0dVWUtDVDA3WUErb0hCSi9JWjJoZzVKYU9CNnRY?=
 =?utf-8?B?WFUzNVh6di9uZ3pWaGkxUG42UFBac0l2ODJXVy9IOHk2TTRRTSt0a1NJcU9p?=
 =?utf-8?B?NndZOHl4TXZOWVpoOEpaZC9sa2V4UndDMExDUk84UEJrMkwyZENhRWh5ZXFm?=
 =?utf-8?B?U1Nrc1NtZzJEVEx4VkpZOTRyK2gzWEVwS2hNUXQ4c1ZyQ2pTcC9LOTE1d2Zu?=
 =?utf-8?B?ejlCMEFVUUJrR1ZmcUZrZ3ZybUwrUDdCKys2Q1lEVjZBa0FOMDVtc0cxZkI2?=
 =?utf-8?Q?Tw3rWzWCwSVWKNo7pFQb/Yc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d462161f-3db7-4a0a-f2e0-08dd52717606
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5627.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2025 12:15:42.4532 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: otvrHVpiA09uSscjuztC3iXDKAI/sOjnIukSIuSzQtggkSlY0AXVSAWeztSq4WnGJAizo3rRhJoY0DuoTzTgyTMsyq2LzyV8aYSkrJYq6Ko=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8120
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



On 2/18/2025 1:35 AM, Gustavo Sousa wrote:
> Quoting Ville Syrjälä (2025-02-17 14:44:39-03:00)
>> On Mon, Feb 17, 2025 at 12:35:23PM -0300, Gustavo Sousa wrote:
>>> Update intel_bw.c to use a "display" variable to refer to members of the
>>> display struct. While this change does not move that file to completely
>>> use struct intel_display as part of it's internal and public interface,
>>> this should help with a future transition.
>> Is there a particular reason you're not converting the whole
>> thing? I'd prefer to see a full conversion here.
> May original intent was patch #3, but then I thought I could help with
> the conversion with patches #1 and #2, since I would be using
> DISPLAY_VER()...
>
> I guess I was just lazy in not doing the full conversion :-P
>
> How should I approach this? Would you like the conversion in a single
> patch?

It will be good if you do conversion in separate patch

Regard's
Ravi Kumar V

> I think maybe adding one patch after #2 for converting the internal API and
> another one on the public API could keep the series easier to
> follow/review.
>
> --
> Gustavo Sousa
>
>>> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>>> ---
>>>   drivers/gpu/drm/i915/display/intel_bw.c | 106 ++++++++++++++----------
>>>   1 file changed, 60 insertions(+), 46 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/display/intel_bw.c b/drivers/gpu/drm/i915/display/intel_bw.c
>>> index 23edc81741de..0fb41e6cd8ae 100644
>>> --- a/drivers/gpu/drm/i915/display/intel_bw.c
>>> +++ b/drivers/gpu/drm/i915/display/intel_bw.c
>>> @@ -124,8 +124,9 @@ static int adls_pcode_read_psf_gv_point_info(struct drm_i915_private *dev_priv,
>>>   
>>>   static u16 icl_qgv_points_mask(struct drm_i915_private *i915)
>>>   {
>>> -        unsigned int num_psf_gv_points = i915->display.bw.max[0].num_psf_gv_points;
>>> -        unsigned int num_qgv_points = i915->display.bw.max[0].num_qgv_points;
>>> +        struct intel_display *display = &i915->display;
>>> +        unsigned int num_psf_gv_points = display->bw.max[0].num_psf_gv_points;
>>> +        unsigned int num_qgv_points = display->bw.max[0].num_qgv_points;
>>>           u16 qgv_points = 0, psf_points = 0;
>>>   
>>>           /*
>>> @@ -151,6 +152,7 @@ static bool is_sagv_enabled(struct drm_i915_private *i915, u16 points_mask)
>>>   int icl_pcode_restrict_qgv_points(struct drm_i915_private *dev_priv,
>>>                                     u32 points_mask)
>>>   {
>>> +        struct intel_display *display = &dev_priv->display;
>>>           int ret;
>>>   
>>>           if (DISPLAY_VER(dev_priv) >= 14)
>>> @@ -170,7 +172,7 @@ int icl_pcode_restrict_qgv_points(struct drm_i915_private *dev_priv,
>>>                   return ret;
>>>           }
>>>   
>>> -        dev_priv->display.sagv.status = is_sagv_enabled(dev_priv, points_mask) ?
>>> +        display->sagv.status = is_sagv_enabled(dev_priv, points_mask) ?
>>>                   I915_SAGV_ENABLED : I915_SAGV_DISABLED;
>>>   
>>>           return 0;
>>> @@ -400,13 +402,14 @@ static const struct intel_sa_info xe2_hpd_sa_info = {
>>>   
>>>   static int icl_get_bw_info(struct drm_i915_private *dev_priv, const struct intel_sa_info *sa)
>>>   {
>>> +        struct intel_display *display = &dev_priv->display;
>>>           struct intel_qgv_info qi = {};
>>>           bool is_y_tile = true; /* assume y tile may be used */
>>>           int num_channels = max_t(u8, 1, dev_priv->dram_info.num_channels);
>>>           int ipqdepth, ipqdepthpch = 16;
>>>           int dclk_max;
>>>           int maxdebw;
>>> -        int num_groups = ARRAY_SIZE(dev_priv->display.bw.max);
>>> +        int num_groups = ARRAY_SIZE(display->bw.max);
>>>           int i, ret;
>>>   
>>>           ret = icl_get_qgv_points(dev_priv, &qi, is_y_tile);
>>> @@ -422,7 +425,7 @@ static int icl_get_bw_info(struct drm_i915_private *dev_priv, const struct intel
>>>           qi.deinterleave = DIV_ROUND_UP(num_channels, is_y_tile ? 4 : 2);
>>>   
>>>           for (i = 0; i < num_groups; i++) {
>>> -                struct intel_bw_info *bi = &dev_priv->display.bw.max[i];
>>> +                struct intel_bw_info *bi = &display->bw.max[i];
>>>                   int clpchgroup;
>>>                   int j;
>>>   
>>> @@ -460,15 +463,16 @@ static int icl_get_bw_info(struct drm_i915_private *dev_priv, const struct intel
>>>            * as it will fail and pointless anyway.
>>>            */
>>>           if (qi.num_points == 1)
>>> -                dev_priv->display.sagv.status = I915_SAGV_NOT_CONTROLLED;
>>> +                display->sagv.status = I915_SAGV_NOT_CONTROLLED;
>>>           else
>>> -                dev_priv->display.sagv.status = I915_SAGV_ENABLED;
>>> +                display->sagv.status = I915_SAGV_ENABLED;
>>>   
>>>           return 0;
>>>   }
>>>   
>>>   static int tgl_get_bw_info(struct drm_i915_private *dev_priv, const struct intel_sa_info *sa)
>>>   {
>>> +        struct intel_display *display = &dev_priv->display;
>>>           struct intel_qgv_info qi = {};
>>>           const struct dram_info *dram_info = &dev_priv->dram_info;
>>>           bool is_y_tile = true; /* assume y tile may be used */
>>> @@ -477,7 +481,7 @@ static int tgl_get_bw_info(struct drm_i915_private *dev_priv, const struct intel
>>>           int dclk_max;
>>>           int maxdebw, peakbw;
>>>           int clperchgroup;
>>> -        int num_groups = ARRAY_SIZE(dev_priv->display.bw.max);
>>> +        int num_groups = ARRAY_SIZE(display->bw.max);
>>>           int i, ret;
>>>   
>>>           ret = icl_get_qgv_points(dev_priv, &qi, is_y_tile);
>>> @@ -514,7 +518,7 @@ static int tgl_get_bw_info(struct drm_i915_private *dev_priv, const struct intel
>>>           clperchgroup = 4 * DIV_ROUND_UP(8, num_channels) * qi.deinterleave;
>>>   
>>>           for (i = 0; i < num_groups; i++) {
>>> -                struct intel_bw_info *bi = &dev_priv->display.bw.max[i];
>>> +                struct intel_bw_info *bi = &display->bw.max[i];
>>>                   struct intel_bw_info *bi_next;
>>>                   int clpchgroup;
>>>                   int j;
>>> @@ -522,7 +526,7 @@ static int tgl_get_bw_info(struct drm_i915_private *dev_priv, const struct intel
>>>                   clpchgroup = (sa->deburst * qi.deinterleave / num_channels) << i;
>>>   
>>>                   if (i < num_groups - 1) {
>>> -                        bi_next = &dev_priv->display.bw.max[i + 1];
>>> +                        bi_next = &display->bw.max[i + 1];
>>>   
>>>                           if (clpchgroup < clperchgroup)
>>>                                   bi_next->num_planes = (ipqdepth - clpchgroup) /
>>> @@ -577,17 +581,18 @@ static int tgl_get_bw_info(struct drm_i915_private *dev_priv, const struct intel
>>>            * as it will fail and pointless anyway.
>>>            */
>>>           if (qi.num_points == 1)
>>> -                dev_priv->display.sagv.status = I915_SAGV_NOT_CONTROLLED;
>>> +                display->sagv.status = I915_SAGV_NOT_CONTROLLED;
>>>           else
>>> -                dev_priv->display.sagv.status = I915_SAGV_ENABLED;
>>> +                display->sagv.status = I915_SAGV_ENABLED;
>>>   
>>>           return 0;
>>>   }
>>>   
>>>   static void dg2_get_bw_info(struct drm_i915_private *i915)
>>>   {
>>> +        struct intel_display *display = &i915->display;
>>>           unsigned int deratedbw = IS_DG2_G11(i915) ? 38000 : 50000;
>>> -        int num_groups = ARRAY_SIZE(i915->display.bw.max);
>>> +        int num_groups = ARRAY_SIZE(display->bw.max);
>>>           int i;
>>>   
>>>           /*
>>> @@ -598,7 +603,7 @@ static void dg2_get_bw_info(struct drm_i915_private *i915)
>>>            * whereas DG2-G11 platforms have 38 GB/s.
>>>            */
>>>           for (i = 0; i < num_groups; i++) {
>>> -                struct intel_bw_info *bi = &i915->display.bw.max[i];
>>> +                struct intel_bw_info *bi = &display->bw.max[i];
>>>   
>>>                   bi->num_planes = 1;
>>>                   /* Need only one dummy QGV point per group */
>>> @@ -606,12 +611,13 @@ static void dg2_get_bw_info(struct drm_i915_private *i915)
>>>                   bi->deratedbw[0] = deratedbw;
>>>           }
>>>   
>>> -        i915->display.sagv.status = I915_SAGV_NOT_CONTROLLED;
>>> +        display->sagv.status = I915_SAGV_NOT_CONTROLLED;
>>>   }
>>>   
>>>   static int xe2_hpd_get_bw_info(struct drm_i915_private *i915,
>>>                                  const struct intel_sa_info *sa)
>>>   {
>>> +        struct intel_display *display = &i915->display;
>>>           struct intel_qgv_info qi = {};
>>>           int num_channels = i915->dram_info.num_channels;
>>>           int peakbw, maxdebw;
>>> @@ -631,28 +637,28 @@ static int xe2_hpd_get_bw_info(struct drm_i915_private *i915,
>>>                   const struct intel_qgv_point *point = &qi.points[i];
>>>                   int bw = num_channels * (qi.channel_width / 8) * point->dclk;
>>>   
>>> -                i915->display.bw.max[0].deratedbw[i] =
>>> +                display->bw.max[0].deratedbw[i] =
>>>                           min(maxdebw, (100 - sa->derating) * bw / 100);
>>> -                i915->display.bw.max[0].peakbw[i] = bw;
>>> +                display->bw.max[0].peakbw[i] = bw;
>>>   
>>>                   drm_dbg_kms(&i915->drm, "QGV %d: deratedbw=%u peakbw: %u\n",
>>> -                            i, i915->display.bw.max[0].deratedbw[i],
>>> -                            i915->display.bw.max[0].peakbw[i]);
>>> +                            i, display->bw.max[0].deratedbw[i],
>>> +                            display->bw.max[0].peakbw[i]);
>>>           }
>>>   
>>>           /* Bandwidth does not depend on # of planes; set all groups the same */
>>> -        i915->display.bw.max[0].num_planes = 1;
>>> -        i915->display.bw.max[0].num_qgv_points = qi.num_points;
>>> -        for (i = 1; i < ARRAY_SIZE(i915->display.bw.max); i++)
>>> -                memcpy(&i915->display.bw.max[i], &i915->display.bw.max[0],
>>> -                       sizeof(i915->display.bw.max[0]));
>>> +        display->bw.max[0].num_planes = 1;
>>> +        display->bw.max[0].num_qgv_points = qi.num_points;
>>> +        for (i = 1; i < ARRAY_SIZE(display->bw.max); i++)
>>> +                memcpy(&display->bw.max[i], &display->bw.max[0],
>>> +                       sizeof(display->bw.max[0]));
>>>   
>>>           /*
>>>            * Xe2_HPD should always have exactly two QGV points representing
>>>            * battery and plugged-in operation.
>>>            */
>>>           drm_WARN_ON(&i915->drm, qi.num_points != 2);
>>> -        i915->display.sagv.status = I915_SAGV_ENABLED;
>>> +        display->sagv.status = I915_SAGV_ENABLED;
>>>   
>>>           return 0;
>>>   }
>>> @@ -660,6 +666,7 @@ static int xe2_hpd_get_bw_info(struct drm_i915_private *i915,
>>>   static unsigned int icl_max_bw_index(struct drm_i915_private *dev_priv,
>>>                                        int num_planes, int qgv_point)
>>>   {
>>> +        struct intel_display *display = &dev_priv->display;
>>>           int i;
>>>   
>>>           /*
>>> @@ -667,9 +674,9 @@ static unsigned int icl_max_bw_index(struct drm_i915_private *dev_priv,
>>>            */
>>>           num_planes = max(1, num_planes);
>>>   
>>> -        for (i = 0; i < ARRAY_SIZE(dev_priv->display.bw.max); i++) {
>>> +        for (i = 0; i < ARRAY_SIZE(display->bw.max); i++) {
>>>                   const struct intel_bw_info *bi =
>>> -                        &dev_priv->display.bw.max[i];
>>> +                        &display->bw.max[i];
>>>   
>>>                   /*
>>>                    * Pcode will not expose all QGV points when
>>> @@ -688,6 +695,7 @@ static unsigned int icl_max_bw_index(struct drm_i915_private *dev_priv,
>>>   static unsigned int tgl_max_bw_index(struct drm_i915_private *dev_priv,
>>>                                        int num_planes, int qgv_point)
>>>   {
>>> +        struct intel_display *display = &dev_priv->display;
>>>           int i;
>>>   
>>>           /*
>>> @@ -695,9 +703,9 @@ static unsigned int tgl_max_bw_index(struct drm_i915_private *dev_priv,
>>>            */
>>>           num_planes = max(1, num_planes);
>>>   
>>> -        for (i = ARRAY_SIZE(dev_priv->display.bw.max) - 1; i >= 0; i--) {
>>> +        for (i = ARRAY_SIZE(display->bw.max) - 1; i >= 0; i--) {
>>>                   const struct intel_bw_info *bi =
>>> -                        &dev_priv->display.bw.max[i];
>>> +                        &display->bw.max[i];
>>>   
>>>                   /*
>>>                    * Pcode will not expose all QGV points when
>>> @@ -716,8 +724,9 @@ static unsigned int tgl_max_bw_index(struct drm_i915_private *dev_priv,
>>>   static unsigned int adl_psf_bw(struct drm_i915_private *dev_priv,
>>>                                  int psf_gv_point)
>>>   {
>>> +        struct intel_display *display = &dev_priv->display;
>>>           const struct intel_bw_info *bi =
>>> -                        &dev_priv->display.bw.max[0];
>>> +                        &display->bw.max[0];
>>>   
>>>           return bi->psf_bw[psf_gv_point];
>>>   }
>>> @@ -725,6 +734,7 @@ static unsigned int adl_psf_bw(struct drm_i915_private *dev_priv,
>>>   static unsigned int icl_qgv_bw(struct drm_i915_private *i915,
>>>                                  int num_active_planes, int qgv_point)
>>>   {
>>> +        struct intel_display *display = &i915->display;
>>>           unsigned int idx;
>>>   
>>>           if (DISPLAY_VER(i915) >= 12)
>>> @@ -732,10 +742,10 @@ static unsigned int icl_qgv_bw(struct drm_i915_private *i915,
>>>           else
>>>                   idx = icl_max_bw_index(i915, num_active_planes, qgv_point);
>>>   
>>> -        if (idx >= ARRAY_SIZE(i915->display.bw.max))
>>> +        if (idx >= ARRAY_SIZE(display->bw.max))
>>>                   return 0;
>>>   
>>> -        return i915->display.bw.max[idx].deratedbw[qgv_point];
>>> +        return display->bw.max[idx].deratedbw[qgv_point];
>>>   }
>>>   
>>>   void intel_bw_init_hw(struct drm_i915_private *dev_priv)
>>> @@ -854,10 +864,10 @@ static unsigned int intel_bw_data_rate(struct drm_i915_private *dev_priv,
>>>   struct intel_bw_state *
>>>   intel_atomic_get_old_bw_state(struct intel_atomic_state *state)
>>>   {
>>> -        struct drm_i915_private *dev_priv = to_i915(state->base.dev);
>>> +        struct intel_display *display = to_intel_display(state);
>>>           struct intel_global_state *bw_state;
>>>   
>>> -        bw_state = intel_atomic_get_old_global_obj_state(state, &dev_priv->display.bw.obj);
>>> +        bw_state = intel_atomic_get_old_global_obj_state(state, &display->bw.obj);
>>>   
>>>           return to_intel_bw_state(bw_state);
>>>   }
>>> @@ -865,10 +875,10 @@ intel_atomic_get_old_bw_state(struct intel_atomic_state *state)
>>>   struct intel_bw_state *
>>>   intel_atomic_get_new_bw_state(struct intel_atomic_state *state)
>>>   {
>>> -        struct drm_i915_private *dev_priv = to_i915(state->base.dev);
>>> +        struct intel_display *display = to_intel_display(state);
>>>           struct intel_global_state *bw_state;
>>>   
>>> -        bw_state = intel_atomic_get_new_global_obj_state(state, &dev_priv->display.bw.obj);
>>> +        bw_state = intel_atomic_get_new_global_obj_state(state, &display->bw.obj);
>>>   
>>>           return to_intel_bw_state(bw_state);
>>>   }
>>> @@ -876,10 +886,10 @@ intel_atomic_get_new_bw_state(struct intel_atomic_state *state)
>>>   struct intel_bw_state *
>>>   intel_atomic_get_bw_state(struct intel_atomic_state *state)
>>>   {
>>> -        struct drm_i915_private *dev_priv = to_i915(state->base.dev);
>>> +        struct intel_display *display = to_intel_display(state);
>>>           struct intel_global_state *bw_state;
>>>   
>>> -        bw_state = intel_atomic_get_global_obj_state(state, &dev_priv->display.bw.obj);
>>> +        bw_state = intel_atomic_get_global_obj_state(state, &display->bw.obj);
>>>           if (IS_ERR(bw_state))
>>>                   return ERR_CAST(bw_state);
>>>   
>>> @@ -889,7 +899,8 @@ intel_atomic_get_bw_state(struct intel_atomic_state *state)
>>>   static unsigned int icl_max_bw_qgv_point_mask(struct drm_i915_private *i915,
>>>                                                 int num_active_planes)
>>>   {
>>> -        unsigned int num_qgv_points = i915->display.bw.max[0].num_qgv_points;
>>> +        struct intel_display *display = &i915->display;
>>> +        unsigned int num_qgv_points = display->bw.max[0].num_qgv_points;
>>>           unsigned int max_bw_point = 0;
>>>           unsigned int max_bw = 0;
>>>           int i;
>>> @@ -925,7 +936,8 @@ static u16 icl_prepare_qgv_points_mask(struct drm_i915_private *i915,
>>>   
>>>   static unsigned int icl_max_bw_psf_gv_point_mask(struct drm_i915_private *i915)
>>>   {
>>> -        unsigned int num_psf_gv_points = i915->display.bw.max[0].num_psf_gv_points;
>>> +        struct intel_display *display = &i915->display;
>>> +        unsigned int num_psf_gv_points = display->bw.max[0].num_psf_gv_points;
>>>           unsigned int max_bw_point_mask = 0;
>>>           unsigned int max_bw = 0;
>>>           int i;
>>> @@ -965,8 +977,9 @@ static int mtl_find_qgv_points(struct drm_i915_private *i915,
>>>                                  unsigned int num_active_planes,
>>>                                  struct intel_bw_state *new_bw_state)
>>>   {
>>> +        struct intel_display *display = &i915->display;
>>>           unsigned int best_rate = UINT_MAX;
>>> -        unsigned int num_qgv_points = i915->display.bw.max[0].num_qgv_points;
>>> +        unsigned int num_qgv_points = display->bw.max[0].num_qgv_points;
>>>           unsigned int qgv_peak_bw  = 0;
>>>           int i;
>>>           int ret;
>>> @@ -995,17 +1008,17 @@ static int mtl_find_qgv_points(struct drm_i915_private *i915,
>>>                           tgl_max_bw_index(i915, num_active_planes, i);
>>>                   unsigned int max_data_rate;
>>>   
>>> -                if (bw_index >= ARRAY_SIZE(i915->display.bw.max))
>>> +                if (bw_index >= ARRAY_SIZE(display->bw.max))
>>>                           continue;
>>>   
>>> -                max_data_rate = i915->display.bw.max[bw_index].deratedbw[i];
>>> +                max_data_rate = display->bw.max[bw_index].deratedbw[i];
>>>   
>>>                   if (max_data_rate < data_rate)
>>>                           continue;
>>>   
>>>                   if (max_data_rate - data_rate < best_rate) {
>>>                           best_rate = max_data_rate - data_rate;
>>> -                        qgv_peak_bw = i915->display.bw.max[bw_index].peakbw[i];
>>> +                        qgv_peak_bw = display->bw.max[bw_index].peakbw[i];
>>>                   }
>>>   
>>>                   drm_dbg_kms(&i915->drm, "QGV point %d: max bw %d required %d qgv_peak_bw: %d\n",
>>> @@ -1037,8 +1050,9 @@ static int icl_find_qgv_points(struct drm_i915_private *i915,
>>>                                  const struct intel_bw_state *old_bw_state,
>>>                                  struct intel_bw_state *new_bw_state)
>>>   {
>>> -        unsigned int num_psf_gv_points = i915->display.bw.max[0].num_psf_gv_points;
>>> -        unsigned int num_qgv_points = i915->display.bw.max[0].num_qgv_points;
>>> +        struct intel_display *display = &i915->display;
>>> +        unsigned int num_psf_gv_points = display->bw.max[0].num_psf_gv_points;
>>> +        unsigned int num_qgv_points = display->bw.max[0].num_qgv_points;
>>>           u16 psf_points = 0;
>>>           u16 qgv_points = 0;
>>>           int i;
>>> -- 
>>> 2.48.1
>> -- 
>> Ville Syrjälä
>> Intel

