Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD65DC7EE33
	for <intel-xe@archiver.kernel.org>; Thu, 26 Jun 2025 20:00:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7091910E939;
	Thu, 26 Jun 2025 20:00:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yea8mjTl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C6AF10E93E
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Jun 2025 20:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750968042; x=1782504042;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uGrCk3pJfB0J998adBPa1hd1e9p42tzo6Xduynlu9H4=;
 b=Yea8mjTllZxIschoq2UnGOZruiAWoVYdvHuXGqBFmKnh1ddLgqiM6JDZ
 kOGj75HY9ZTauX/O3Ri/zL18F8fsiT+kAGhOQiRZhbkSGjWSx2G/IzMnM
 Sv7ujgaMzAbCn2Hz434dvXZ2QSs0rbxnnT4GG5+b1e7AKEzFFLD6I7zGa
 bVf+CnRsw5hQztYunBUUIpBuarB7BHe2ZqxUrD6wvxvwVlIonf/8QdvQ6
 YEeUo5a6eORU3XnmZyXTbmaYWiaGxty+sMwnvxE0fCIlWL5medWrByoOr
 5E7tLBVHarOdFmaJx8Da2AFtyFyIjDFbdy6clEp0ubjzgkT76CVbx8j9v w==;
X-CSE-ConnectionGUID: XN9iPSX7Tbuz0gNfjOyNBw==
X-CSE-MsgGUID: /038xO5fS1eNDNB0SEm6Hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="53140666"
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; d="scan'208";a="53140666"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 13:00:42 -0700
X-CSE-ConnectionGUID: +4XF1R+xSQKp1xECTKRFfw==
X-CSE-MsgGUID: mcM6tNZrQQa1ZeosxRNKVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; d="scan'208";a="153108305"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 13:00:42 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Jun 2025 13:00:41 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 26 Jun 2025 13:00:41 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.49) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Jun 2025 13:00:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sfj22n/tbTcvom3o6265VeUtbW1TcHvz3vNVIB8IL3HQ/oHAl3ZHKGJTmATkRTluejY44MMHKmEitk9IZNsJCseafQANzQiMIJIAeNskpsX3vHzZvnHozbVxEmoLf09rhsFCGKwbM+cTIYT/Hl8a6AjCuPXY83Wy9bMxv49pt/TFaa4HX1N5n8yCh+443J4lpPFlsGlCgtwHeT4a5mGuwAqxu8wHgTWH3pd4n0TLXUWIndAavaFr4//9MWUIc68UYU7gnssmDy7oCP0EAM/pcrcIrIQ2fXfixJbBNyWhSvLPWLEyRTPqhuBPKlLahusFeEYUDPtsHRuuFncuT3DhIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xnYsyDuz4EGY5QbC1r+YFG9yfpzhKCT+RdMDvFRuBYo=;
 b=wijn3PrTPnmNvW+gDwrMzeeXuQ08lgC35fDZW/C1sn7TDjZB9DmUyhq95Yxyg/33Yr4e//xcILixuyCToKM6WRwBwjWJBuM5RhCg+P88NuUDiWUEsrEtH9W23G0rvl/OGQxh3xdw8FtvZC7oErhdWPBN1T+ywrP/N+mGLEGg2QYM9bGM3RmsnDwUDF0luwHXp3p59K1JkRfKKiFztchYEHB9/NXnnz1d8kJPcKLsm1YMesBJvD6zc412qJpp25p004gJMkjSbXOg9nXf++lQ189goQNTKlXWzfspWC3apGyWL5tnF84mdH1bfqf5t8kO7G7T9FHHxWi7QJNaUqvT5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by CH2PR11MB8835.namprd11.prod.outlook.com (2603:10b6:610:285::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Thu, 26 Jun
 2025 20:00:25 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%4]) with mapi id 15.20.8857.025; Thu, 26 Jun 2025
 20:00:24 +0000
Message-ID: <474b9d57-7d52-4f16-86d1-c61a5fe1f320@intel.com>
Date: Thu, 26 Jun 2025 13:00:22 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] drm/xe/ptl: Add GuC FW definition for PTL
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20250626182805.1701096-9-daniele.ceraolospurio@intel.com>
 <20250626182805.1701096-14-daniele.ceraolospurio@intel.com>
 <ofqsdn5lbok56ekwcucazr6hwud45wzkd4nf7oni23j7fuemma@ogs6yalxcr6h>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <ofqsdn5lbok56ekwcucazr6hwud45wzkd4nf7oni23j7fuemma@ogs6yalxcr6h>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0145.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::30) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|CH2PR11MB8835:EE_
X-MS-Office365-Filtering-Correlation-Id: bb87c422-1b61-4437-7e7b-08ddb4ec16ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TDUycXV3M1BBN2kzSnh4SFZLU3ZWTTlFVjJhZiszMXdSVU8zdHh6dXlMc3dI?=
 =?utf-8?B?RmtNc1k2RWdKdEdtMkNlaEJBbzhSSzlFSzlPM2hCeTJ2cWtyR3pUem8rSmwv?=
 =?utf-8?B?ZEZodldtQXZweGdONE94cUNxMmJOZUxwcGtJNkRObzkrWi9sUEp4b0MxNmtD?=
 =?utf-8?B?ZEpZeW93RnlPUkdPUGUwZnNqeFJ0NjFnOCs1cGpPUlpMSXBkY3p4YVJwOGxh?=
 =?utf-8?B?RUVVekRqVGJ1VTd2L3R5WmtLbUs3QkhWVzEwYTJjVXFjb2M2a3RvY0NSZFBR?=
 =?utf-8?B?aVJ1NGlwRCtlelgvM3RCaURzOHJKMDVnY1Y0NVoxekMxakJTUFdpSStZYmtt?=
 =?utf-8?B?ams0WjJpSFI3MTRDRFdPZk1JRlA5VjRVWk04ZDFlYzNiL0Y5YnN2UysrdVVR?=
 =?utf-8?B?RXJEVU5GUDN6L3VReENmaEEvUG9RQTBIZU1Qd0lCWXZzQ29PV3kwaTVtdXpQ?=
 =?utf-8?B?ZENjT0RxZ0hSYjBjWlBQWW5lc3BSQ0ptYk9RTUE4NjFTMjNFUVdsT2dYdGE1?=
 =?utf-8?B?clEwTzJORXl4dUZFekhQZlR0VXZxVDRPWmtjNDlZNGJUZXJKYUh3QnA4cjRP?=
 =?utf-8?B?ak01RmFHdDF5ZmxXbDFSeklqNUJtYmtJbUV5VisxSHYxWEdOVXIvVXNmc3Fj?=
 =?utf-8?B?N1psMlV1UnF4bklGa3RicXpHakpKRTdqblBFUWtmZm51WUpKRnZ2cGpSa3BQ?=
 =?utf-8?B?blh4eWdFRE83dlQ5NTBtbzg2QXRGTHZyWmhBV0s0WkhhVUdneU9ySzVpZlFH?=
 =?utf-8?B?MFhHSU1NbnhCMXhINnFZTEZMUWNDakY2WHpGSDc1L1BsbExNaWREaVNzMi9F?=
 =?utf-8?B?OXpDQTRuY0JKbXhXalR5SFU3ckI2d0g2elB3aDMwUnVsd0pIMnpCbkJrSmNi?=
 =?utf-8?B?MHcrQnNoVlJlVDlYOXVjQkYyVExVNTJ3R2FiZFFjclJJZ05xUmRyMU5ob21j?=
 =?utf-8?B?SFZHeVBDYXVzNENmSmlmaUNNUnBIaEo2dkdzMitSL3hpNjdQWFhwVmJSY2lt?=
 =?utf-8?B?TFFMa1ZUZzVhUGwwK3pUSHRtbGh5TEdRSW9GaCtsTiszT0VVNzR6bGpMdjdk?=
 =?utf-8?B?dElQM3ZBc3JwQ3lsdHNJL1VuMGJ4U255MGx5L0VrZTM2ejNQeitMK0VUVVZN?=
 =?utf-8?B?OUxKKzFGZ1RnK2RVdk9ob0dRL2ZRbzAwT0xnemZIVVJzZjJTR2V0MUdGUHhY?=
 =?utf-8?B?YVViOXZvVWdGNm1xMDBBSkVub2JYbFByeGw4SXhRK255ejBYOWhiSUFHRUsw?=
 =?utf-8?B?QkFiUW1oNjVQUHl5MFg4S3BhWHRoMHo1aW9QM0NjK3dDd00zZElHcDJUOXZs?=
 =?utf-8?B?UkszTktqYXpKTHhFZU5WMjVvOTJUcnhMNUQvUE5WV0lVNHZHNGNIN2RSZjVw?=
 =?utf-8?B?M1VKUko3SVNPM1hSUHlFclFFR2dEd2RGMVhZeGxpSCtVS2VqeHNjbGVHeHpi?=
 =?utf-8?B?VW5XbDBsOVE5Tm9NZ0JqTSt5U1dpM2ZWcElpd2NXRTA1a1A4OHZzUHg0Y0Z6?=
 =?utf-8?B?cTI5RTdZZXFrc1NnL0JydS9SbVQ1VENRY2VubWRmTW9aSkdsazl2UTh5Vkt6?=
 =?utf-8?B?clAvL0g4STM2Vm5Ed1AwWlA0RnBmUUNseVB3bklLMXpPT0s4aXZaNHRZaDFw?=
 =?utf-8?B?VnFLNXV1OUI1bEE3MU9BVVJiOHEzUSswSXR1YjFweE1ZTS9pNmMrRnJiMUxp?=
 =?utf-8?B?V2RvdGowT0h3dnZrazFKMSsvbHZXcjdOYzJrQmtycHV5WW11TlNVZk9LZGd0?=
 =?utf-8?B?dVF5SXh3Yk15OTRWd1FKRGp1ZDdrNkJIbGdwcTh0YjRudDRBeHVvYmFyUlBM?=
 =?utf-8?B?VU1IRitsa3k1NURnbFppM1Z1MXdsQkVxNGVsWUVsa1ZqRE1nbTVRTEV0S3RZ?=
 =?utf-8?B?SWFSTU0vNmx0bkRmdTFmMnhDcnJNTzd2b2tlM1ZST21VUlB6MDlwMkh0eG9n?=
 =?utf-8?Q?JbcJ4h3vv48=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NkVlL081NFlmMk1zRlp5ZWpDUjZFbk9vWVlSMlUzZ0hlVXBsNzFIQU5pRTVK?=
 =?utf-8?B?TTdxTHY5dkdaZXFCUVRvTHl0bytXenZ0L1RudE9FRmU1YWFRM0kzNUxHeHA1?=
 =?utf-8?B?SEVKUGc4bTBlMnZackVBL0x4a0hoVjVZMXdqRGhtVlVZSS9PR28rRncwZG5a?=
 =?utf-8?B?N0w4V3BIVU1WNTBDUSs4SXBKazAyNGR1aU4wNjJnaldqL1RNNDgxT3MvYnJW?=
 =?utf-8?B?d0RpUlVGVldNNllGMzliVlArREJQbFRSSE9RY1Q2L2VGL2xmdStaSmlZNkQ0?=
 =?utf-8?B?UGVHNzB4QzkreG4yUnV1M2tIdDlKV3pFUUQ1b28zQ0toZTJZT21GdnB5dk9T?=
 =?utf-8?B?ZVVEdkJLcE9UWkFycmxKMHA1aFJKbkp5QStURll2UStPM2NIN1kySThPRkMz?=
 =?utf-8?B?RTNUOVo3UkVlVGJwakduY3pwZENqNlltTlNqRGNUU0MwMTV6TG9Od1p2NkVQ?=
 =?utf-8?B?T3orbHVnRFE5T0tjMjVPczgrWnJmYWp4Rm4xUHFWdmNVZzZOd0s0clhaOWpi?=
 =?utf-8?B?cGxLZGZzRzkxRkxSSFpYeVlZdmtCOVlEb3Y1c1I4RWRRTzBncmRiTlVwT1kw?=
 =?utf-8?B?SnVUMHpROWx1MzUrUnhCQS9CQnpBZkJmL2E5QnpLTkxGYjh4NG5PS1JpQ2lT?=
 =?utf-8?B?ZFlwYVFCYUNqRHZBREFlOTVzaFlEdHZUUFJCZ25Fd0RJWWJVUjRIUUdMUHBR?=
 =?utf-8?B?OEdzdGJHZnFsWDR4eE5CYm1rZWhvSzhmbWpKWUtmeVJKSitPaFQ0TFRzWm9S?=
 =?utf-8?B?VGRnZFgzZFUvR1BmZ2xYOGhYZjc5a3ZEZ3FlTW1iRWR4a2pqNW84MEk1dTRm?=
 =?utf-8?B?bFhyOUhHUU1yTkFxWnlIQkJpb0l5UzRrRkFCU0U2ME1WRElvbzk1aFM4WGpr?=
 =?utf-8?B?cmVjUjVTSnVPSmlrRlZBTnJoaDBHYUc3YnlVSHhpOUlkUEw3WUJIY3VKZHVP?=
 =?utf-8?B?bXhNaVNMUitkRVNRRFpRWlVmMW5tQ3lHN3VGOWIxeVdvenM5UVM0Q3lLK0tq?=
 =?utf-8?B?V2pkM3c2VGxucEJZRFFBeEVqbE9acjlxZDJmOC9ibmdocitIWjF1NlhmQmlE?=
 =?utf-8?B?enl3K3dSNC9LQ1liTzZlTmdSWU9hQVdZMVdyak92NDg1M0I0MlpMaU95b1cz?=
 =?utf-8?B?VXlxN3J0bjF2NlFBLzE1MFpjMy9MTzZydTlOM2hmRnZPbGFqb0xEL2xWaFE4?=
 =?utf-8?B?cDBNTS9OVXgxL3pFNWE2UVIzeVdvWEFDWWEzMG9PRjk3eUZlOTZFeWhEMlBp?=
 =?utf-8?B?clZBWkt6MGZ3WU5iOVp1QlVOc1VJeWhmRHAxR0YxL0M2TE5rSDVwbFhqd3g3?=
 =?utf-8?B?ajNzcUN0Q0dyTmJRYVR1Ry96UENTSmptR1RpWWs1WG5id1EyNHdac1Z0RWZa?=
 =?utf-8?B?UElSYm96bXlPYnRzTG0zRGN6VitTODVzaDVmd1pGRmJhek1vR3NLM25CSytr?=
 =?utf-8?B?b0hXWUJlYnc1OWFrMzg0Um1EUElmR3VkZ2xwZ1Bobm4wNVdQbjBlWmprTUto?=
 =?utf-8?B?U3h6VXFpVVRPdzF1UEE1UzVLelJCYXg4cEJpeVAzL0ZCc0Ivdm5kMTk4d2Rk?=
 =?utf-8?B?R1ZPWmFzK1lIamtVZ0VQL3lFWlg5Q2kxci9aZjFuck9mb3hhV1RKUUZiVWtY?=
 =?utf-8?B?YmNBeUQ2WFdzNG5IdUFpR1RPV3QvM0w4V1hZK01GSDNDaDl1QmdSVmpyTCtN?=
 =?utf-8?B?am1UYUpDcEZGaS9SSHQxOFQrVU1QaWlQcVI5clhCV092TCtEUHRZN2xJMUw3?=
 =?utf-8?B?TWFUZTdUeFZ5VG5ZQW9FNW9jSy9LVVMvci9UR0YvWmJ1dmtpbU82RENYM3BL?=
 =?utf-8?B?Qlg5VHVBQU1WUkdpRXVGU3pjNGRtUjFUbjZGc3RyV2ZyVm1paUlNL0U0Q3Q1?=
 =?utf-8?B?VUlSaXJSckpmbVo3TXhjVWlseEw1SWZPRWsxQ05ObTRzZTczUVZQdU8wKzRY?=
 =?utf-8?B?MzF2QWVvSytXdldLb0Frdml3ejB2SHBXTnMvazIvR3FSN3REQTVOR09xQmdq?=
 =?utf-8?B?eUdwYTRtNmtmayswT1lpK2hhdSt0S0xCZGRJYTBPeU5FRzc2ZGRaaXZnSlFF?=
 =?utf-8?B?RGtodThab1pOT3l5Nm1UR0NzV2pIOWw2R0d1Vjd0YWFvL1g0bzZkVVlhQ3E0?=
 =?utf-8?B?U3BBZGYxbEF6M1pYYWs5NjE2WEJZNUF5eDF6b0N6YWp3NWZpSGdncWt6aWRC?=
 =?utf-8?Q?MT0CxuQZU7uSmg8x/3dYGBo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bb87c422-1b61-4437-7e7b-08ddb4ec16ef
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 20:00:24.8208 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m0Qi85ljjJROFsLLxMchu8KCkrMIhmRt46VQ5IgSv3BbpdBNYw03P6JktmGCzNnFzxv9G1fd3jFHyM+O2O1g+cC3fnWvFhz38OP6pw7SxKM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB8835
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



On 6/26/2025 12:03 PM, Lucas De Marchi wrote:
> On Thu, Jun 26, 2025 at 11:28:11AM -0700, Daniele Ceraolo Spurio wrote:
>> The first official GuC relase for PTL is 70.47.0, which maps to
>> API version 1.22.4.
>>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>
> I don't see this version in upstream firmware repo, only in our
> intel-staging branch. Is this ready or is it just for CI?

This is the final version of the code, so it is ready to be reviewed, 
but I wanted to wait for it to go through CI before moving the blobs to 
linux-firmware. The plan is to have the blobs there before I merge this.

Daniele

>
> Lucas De Marchi
>
>> ---
>> drivers/gpu/drm/xe/xe_uc_fw.c | 1 +
>> 1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c 
>> b/drivers/gpu/drm/xe/xe_uc_fw.c
>> index 4d3ace56f38a..2584ee3b0316 100644
>> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
>> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>> @@ -115,6 +115,7 @@ struct fw_blobs_by_type {
>> #define XE_GT_TYPE_ANY XE_GT_TYPE_UNINITIALIZED
>>
>> #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, 
>> major_ver)                    \
>> +    fw_def(PANTHERLAKE,    GT_TYPE_ANY,    major_ver(xe, guc,    
>> ptl,    70, 47, 0))    \
>>     fw_def(BATTLEMAGE,    GT_TYPE_ANY,    major_ver(xe, guc,    
>> bmg,    70, 45, 2))    \
>>     fw_def(LUNARLAKE,    GT_TYPE_ANY,    major_ver(xe, guc,    
>> lnl,    70, 45, 2))    \
>>     fw_def(METEORLAKE,    GT_TYPE_ANY,    major_ver(i915, guc,    
>> mtl,    70, 44, 1))    \
>> -- 
>> 2.43.0
>>

