Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1675606A31A
	for <intel-xe@archiver.kernel.org>; Mon, 23 Nov 2026 10:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jjCJQpTF;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=TwQtMUYj
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9374F10EBAA;
	Mon, 23 Nov 2026 10:05:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1311410EBAA
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Nov 2026 10:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795428306; x=1826964306;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pFT/t46Sm7CJ5RUiAd9TbwDKMiUSzP/yGo/Ctr9exPo=;
 b=jjCJQpTFSqZSwhd3xcR1AcRZ49VlXfIKZ7Wbxr3sB4qUkHTEct1KE9MX
 cPoIO91hlwgEyVyNXuZTlYEweLQrzIWSIt4B5DAHLn65zoTB8qKfcDuFB
 fk4dJUSU0n07V3c0oG+ohte500XTnVrn7WaXgLr6M+QG3U/HcJpTBqX5F
 w9aOtQhNm0Uoi0k9zN4h3ScI8Q8Oeg0V3eOPCjP1Tr/kCupKBqkLCW4fY
 OIJWEIaBUIa7zI5l1tQR9K6N1TrlAgSyNfl4wM+XbkFLbblfSbDLvf/k0
 rsId5LvsJpDmZAw6rENb/KUCao9T3NYqZ2JDikH1sF6YF2yZwxJOk1IJA A==;
X-CSE-ConnectionGUID: GguusJsLQlWCtTYNPcSIyQ==
X-CSE-MsgGUID: aMwlYgcKSLitaAED/+7PYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4318063"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4318063"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 02:04:59 -0800
X-CSE-ConnectionGUID: qqmcEw/zRWytxcF1/T8LHA==
X-CSE-MsgGUID: XFcSHoe2SOCMzWGNPvWjzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; d="scan'208";a="11566009"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 02:05:00 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Mon, 23 Nov 2026 02:04:58 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Mon, 23 Nov 2026 02:04:58 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.20) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 23 Nov 2026 02:04:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MfDXMUx9VACdu2GQdjWR9YJEYKQ+umlEaCk7QyHOx7QpwVazAYNzfLtsG05oPRSXCwvn1mkm2dYHQcHA9VetuxPYjng1WGTMH6EXIWeEIsNYI9NnzpB6xZXp3tcocYJ98xKR9wMKSXDaXGHqmfzzLxjVvVINITusQdbe91YxMj/yhM8pxFFY3NjxhiZO4qMhhpUOEXMHRrhirwDjqsbiil+E1Lq3DkfNY7OQshKRoDo+oU6o5P0AI2lkpH8EFwLrYe0ZkzaJr1gCe4D1Qo5wn1tTsVBXicqYAL1cCGtAYHxm7dV58AO9PyzobCpsI6rsf72avUYoj1Ggm/5CHr/t+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UhD2saCj90jjThwh6OdePTGAYObsoLV6+PFrCvTqMQg=;
 b=C7yvyi3gIZ6tc38PLxgt90EegZaMAE2hKRzr7E/qztgw2ao6eCc1RnPZDWoX8wzLdIOjR99kGHpbzA2L7MySXJsvBGMAp2sEa16LxAZo6is9+s5n1EwHdUI/b3s/Uy72PhDRWqIdNE8fo4DB75yUpB5oNZsH2YbYX8cvwif897BXrr/n6mcaO+JyTAFwNISxw2mXGAOuwwEYCYwVY44p7ycV4Ga+i0DVRDfz/9fz1hkvBaFcHpWe58BMAwywP5xFZtHi5Zo3ZNYZAaUdYCPsyo4SY+OGPQoZXgHNv2WjZouCwIas8H2hdROcnP/3Jm2hefz/x4FvOoIT/Itp9Vn/zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UhD2saCj90jjThwh6OdePTGAYObsoLV6+PFrCvTqMQg=;
 b=TwQtMUYjwASfEbMXv5n/bKei394Q6wvol7armO3Hby8RWrpPXwfiToVL0C2ZBfUlngTN5CxQ9ZEeVKt32a4ZRuPnYAKHFxdMraUnXbPk+j4bNbMar0ger62U1LrC/MTfEC86NJpnLgUweFxkcxLPSQzoqUpmkoffhPTCckwap00=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by DM4PR11MB7255.namprd11.prod.outlook.com
 (2603:10b6:8:10d::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Mon, 23 Nov
 2026 10:04:54 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::3a:cd0a:2af8:5837]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::3a:cd0a:2af8:5837%3]) with mapi id 15.21.0639.011; Mon, 23 Nov 2026
 10:04:54 +0000
Message-ID: <46fd2879-11c1-4600-8aa1-8e7f4d4af248@intel.com>
Date: Mon, 23 Nov 2026 15:34:46 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] drm/xe/guc: Scale suspend wait timeout with preempt
 timeout
To: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Brost
 <matthew.brost@intel.com>
References: <20261120160826.2045426-2-himal.prasad.ghimiray@intel.com>
 <c2a0f66e-f6f0-419d-8fa2-e10339808394@intel.com>
Content-Language: en-US
From: Himal prasad Ghimiray <himal.prasad.ghimiray@intel.com>
In-Reply-To: <c2a0f66e-f6f0-419d-8fa2-e10339808394@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0072.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b3::12) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|DM4PR11MB7255:EE_
X-MS-Office365-Filtering-Correlation-Id: 3328ae0b-3917-4824-da7f-08df49493846
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|261026121527099003|261026140227099003|261028144727099003|261021123027099003|261021121427099003|261022105027099003|261102123227099003|11063799006|4143699003|56012099006|10067099003|18002099003|22082099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: JqRsoUGyE/hLnN+wvE5cZUlMgVmhutCOsQ5renalcVvCqRnCYTYLOxoQW1Yrbd82/RMEosUK1nBFjn29P5txoPlFasGA6AWdjwRUF7iafY0OpFNufC0zeVXJUEtfaoU/P2M0l+mepcPW5txAvaUYBUa/D3QH55PwT0rgwoaMLy2EjMLaBxzoG8pmeEv2UHuHH1YTEqocSW64MXqSN++yB60u9pXgvENQh+Sm7CVXoATJIKGZ8vjFtnZSxGpc0hF6ol6MQzTQNx9KJH3rSaOuxyLXhHROxrWNSQ7r64ObcCowjptLoGDe7i7adw7VQSXMNZQZArPMtkPDmsmKT9SrPJCeEzCpGXMerbQD3XZHxM42FcYY0lkSDEFZ+/tpr2OzFeSJrunI5u9T+Ys5VhED29HjM7FyToOLrQon23+AfI01UQBrNRoc6yBUuNICRiWJsiOibP/AtBSXsR3wAJr93eWfG+GdiLoSRzwh1gztrrYjOkOuqieS57a3gaeNdF3YqycgVbh0aRuE0SKAoF9xiIL3PMc3ISSBnMlBs5dnMIoQZRWspU60UVAEETO5LpfxQtS77YZV/CCTkugWh9pcZnbJQAOOtX22VnETdxvv7cjL3/+JswLhBrJ5yp8rgF8fJoudQGvISSppsF+ukPwTOlkiOIa3Nzq4bICTpS5pw2M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(261026121527099003)(261026140227099003)(261028144727099003)(261021123027099003)(261021121427099003)(261022105027099003)(261102123227099003)(11063799006)(4143699003)(56012099006)(10067099003)(18002099003)(22082099003)(261009223027099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QTlUcHZzLzNKazUrWG5yQ0lMbkFsOWNMZk9KeS95WjRlbUxPZGtGUFUwaHB1?=
 =?utf-8?B?MVdJQThPa0tFR2VMdEN1YnpxbnVJZWVSc1IyN3lyaElvcmY3S1d5U2wwUDNN?=
 =?utf-8?B?VlZOWE1uY3lpN0RiQTdVZ0hHUkZNTFRVVXlpd0I3Nm55N3lMWUhuWVViOW55?=
 =?utf-8?B?cSs1TUdlWndOTzRpMFg4U3p2VmhBV0YzT3ZVbm1DcnEwZjNneG1QVXN0VlhQ?=
 =?utf-8?B?Y2lMendWSVozcUZuMlRsNzZtaWhBeHpDanIzMkczUUorVWhtT2d5WFZ1eUhi?=
 =?utf-8?B?NG9ZUmxqYTNtQlFJUmRGVmZ0QVlyOHJ0S0NTc01HZ2NaUlZidnNLeTVvd0pV?=
 =?utf-8?B?b1ZJdGY3bExwZmJ6SzB3UTZZYUQ0Wm1EMk9rYU5qRURvY041TndXRUxFaVpw?=
 =?utf-8?B?K2tkYkZIU1lSclByUlBWaFNWOVYzeFkrU1lmeUNrc3JwZ0t3VHdsK3YrRFNy?=
 =?utf-8?B?OUticUt1M0hMTVpkejhNODhXaVdyYXlYY0E0NE9lcmN0WUxxWklvOFZwaWYz?=
 =?utf-8?B?eXlBQWduQzdNWTRUT3gxV3VmM25uSVhYNWlHYUw0RUkwcERCUDhWeVU2dDJu?=
 =?utf-8?B?TWhDNmpnekN6SjJZYUZLYjBOS2dwSTYzdzhOSXVhbE1nbXJNV1loOW9USUhp?=
 =?utf-8?B?a1JidnZxR3pFMzFhNXE4eklMUEV3cm9tTjc0M2ZWSTF2enVSS2ZEdHZQRk96?=
 =?utf-8?B?Mnh2dnl1cVlaelpOY1pCMkdPdkd6VzE0bU5Wd2hDeDNVUk1iUnIrQ3RvRU1Y?=
 =?utf-8?B?Sm90dkROb3E1VnRNaWNQNHlTdFFPekdWeGlDcEZWVUdJZnk1RU0vM0ZvR0x6?=
 =?utf-8?B?emd5L3RiRmptVjNNNWJQQzVUSTRZKzdkM3JNNlhINmwyN2tRZFh0bndSbUkx?=
 =?utf-8?B?SVEzUlZIZmlDMGdKc1hHMkxFYURvdXJiWkczeGY0SDNUUDM5V3lkWVNWLzEv?=
 =?utf-8?B?OG5Uc3ZHK0IvNy9EY2pTN3RNdG16SzNLUjI2N2ZXR0xTU01pL045Z1BrQnBr?=
 =?utf-8?B?MmpWbnprdS9XRWsyTC9NTjBLS3JUVDkrOENSU1R0Yi9XTk81WUwwb1grV1BR?=
 =?utf-8?B?UmpwTW01QkdyUHk0cGNXcFpUOE1yd0JqTGZtdC9yY0xxNCtxaSswamlDYnkz?=
 =?utf-8?B?V01qQldJaDRqVFJEaWxmZ0FSdUloaHJCYS9ycEtnZ2hxYzc0NUtSekNrSERz?=
 =?utf-8?B?Y3V0WVBVWlR5cXNBVUJWemdBZmxoam15eU5DRmxSTndsVU55Z3psLzJiUE14?=
 =?utf-8?B?ejNpZmNDRmRjckJoL0s5M1R4Z0NUckRGOE9UbWRhcWNLNkM5d0FEaWkyVmJI?=
 =?utf-8?B?ckFCMmNwMXI4ck5Mb1UralJQN2RTRE9LZWZzdEMyTmcyRnJmd2JLQ01EekdM?=
 =?utf-8?B?M1Vpc3NiZjhpeEswR0UxMUQ1Um1leFZ3S1pHVVB3RVhhOER5T1o3SUlrRUI5?=
 =?utf-8?B?eEg3QnE5TE1WRFk3WTV4ZXQ0U3dWbndDaUpmcHN5cDNTOHUzQTBpTFZDT0Zx?=
 =?utf-8?B?emp1MzBoOW1USVFmalRtcFV6UEVxRUdQU3RGMG9jV1JFNW9TNlFGSEFTVFVm?=
 =?utf-8?B?MTMrSGQ1NFpxTkVRKzdFZGxIZFIzQXI5QnJiaDQyUXpMNDFaOUhZbmgwZUVP?=
 =?utf-8?B?S3I2Tm9lSVM5cmoyVG1CNEgrTTE5L2dLUHJWb2FtTldxbEdMK1BGMWZ1SFFn?=
 =?utf-8?B?elE5T3VaV3ZvRUU4MVNrQjBQT1NaR1d6YlErdXVpcUUrSkQ1a1hGTko0VGtk?=
 =?utf-8?B?S1pqbUY3RXBlZDVnQnFWTE4rck5CODZCVTl0MVMzQmpQaExGYnlnc2ZySUVs?=
 =?utf-8?B?TXV4T0V0cGVHVVVkc1FaNUZmVHBhV0VPOEhRT0dEeGJLa29PalJuREJyQnBu?=
 =?utf-8?B?WkltajZGVWIrNEhKeFM0YjRBWDlOTzJFR2VYZll4a1NWcnNvZk8yMW15Q3Fk?=
 =?utf-8?B?RU0rMDhKVWgrS1BHTG5iazFVYXE5Mlo0b3NZU2ZRRTRDSVVyZlNrM3Q0LzV6?=
 =?utf-8?B?TG1SYk0zT1ltdndWL3k2RFpRQlBXV2FtQk9sSEdRa2p3N0J5QnhERFlqdE1k?=
 =?utf-8?B?T0dlZm1JaTFMNVY0cGltb0dVSlBnQkVQVmhyNVRFQzc0WXd2ZU5nV2FGZFI0?=
 =?utf-8?B?QTBQUWR0YWptbjBMMVhkTUdBSjc4SkgzMW9MNk40cWpqZ01nRU9MZ0JYQW9n?=
 =?utf-8?B?RE41blhRZ0NIYW1EZWg0b1BHaTFicG5mWXpvaTU5VDdtazRxQnhrOW1zYWV5?=
 =?utf-8?B?cUNKTklSVm1qbjh6VHNIOXlFUkdkYzlWRjRjcWJFejAyNW8veUFlMFJHR2tS?=
 =?utf-8?B?cjZjUXB4L1d1WGtSL25KVXhlUDhsMVNiaEZTdFprL2pLaUhIWHlodlVSTjdQ?=
 =?utf-8?Q?YSiE2hQuTBcZzN3s=3D?=
X-Exchange-RoutingPolicyChecked: EEim1kgBnYBnT7sseQT2/qULDAoBCLYMwvK9JhI6BUyfY0jEPuXi53YczSmKEro+9X0ctg+4ugV/dmEzQ/pjUXrniYhEKCpqVqJD1mLwDgRIHC8OXqgRctLGNVvoGB0hGMp3DxE9tvX/z5vWhe1+QR/rnumMm3cD79wa8T0CzcRlVInVIQsWA791lab+EdPtx9zGRR7+tQH3E155MKxiUgFGDLPmHZ4jsS5y6Qk4BxgrT8X4rSHu0u8tL6jC+9m+PYBksEQpHaky8cayNOsSU+WOCOuRi9ASz1hsNLXTFjYU3w4dUfi9Od9DCV6a86hoM94ayNRplhFHhu1jiJIZTg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3328ae0b-3917-4824-da7f-08df49493846
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 10:04:53.9924 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vjnUM5KEsiFKMqJZUkdF/tqUydzeA8vCmsRe7MrmIcKQW2lu/9Mr51JAlR8aeqpETSLYHtDmbVhuR1oybolmjJn0ELKwVsBTKu2njP8YBDg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7255
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
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 20-11-2026 22:50, Matthew Auld wrote:
> On 20/11/2026 16:08, Himal Prasad Ghimiray wrote:
>> The suspend wait uses a fixed 5s timeout, but preempt_timeout_us can be
>> set up to 10s via sysfs, causing queues to be banned while GuC is still
>> legitimately preempting. Extend the timeout by preempt_timeout_us and
>> min_run_period_ms.
>>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc_submit.c | 20 ++++++++++++++++----
>>   1 file changed, 16 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c 
>> b/drivers/gpu/drm/xe/xe_guc_submit.c
>> index 9e7c2778029c..0898ee29f460 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>> @@ -2532,8 +2532,20 @@ static int 
>> guc_exec_queue_wait_suspend_done(struct xe_exec_queue *q, bool blocki
>>   {
>>       struct xe_guc *guc = exec_queue_to_guc(q);
>>       struct xe_device *xe = guc_to_xe(guc);
>> +    long timeout;
>>       int ret;
>>   +    /*
>> +     * The SUSPEND worker may sleep up to min_run_period_ms before 
>> disabling,
>> +     * and GuC may then take up to preempt_timeout_us (sysfs tunable 
>> up to
>> +     * XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX) to preempt the context. 
>> Keep the
>> +     * historical 5s as slack on top of both.
>> +     */
>> +    timeout = HZ * 5 +
>> + usecs_to_jiffies(READ_ONCE(q->sched_props.preempt_timeout_us));
>
> Does it makes sense to apply the preempt_timeout for 
> xe_exec_queue_is_multi_queue_secondary()? It sounds like in theory 
> that is more a sw thing wrt to completing the suspend/preempt? It 
> rather happens via primary?

Good point. will address it.


>
>> +    if (q->vm)
>> +        timeout += msecs_to_jiffies(q->vm->preempt.min_run_period_ms);
>> +
>>       /*
>>        * A kill does not clear suspend_pending, the queue may still 
>> be running
>>        * on the hardware, so exec_queue_killed() is what ends the 
>> wait in that
>> @@ -2546,16 +2558,16 @@ static int 
>> guc_exec_queue_wait_suspend_done(struct xe_exec_queue *q, bool blocki
>>   retry:
>>       if (blocking) {
>>           if (IS_SRIOV_VF(xe))
>> -            ret = wait_event_timeout(guc->ct.wq, WAIT_COND, HZ * 5);
>> +            ret = wait_event_timeout(guc->ct.wq, WAIT_COND, timeout);
>>           else
>>               ret = wait_event_timeout(q->guc->suspend_wait, WAIT_COND,
>> -                         HZ * 5);
>> +                         timeout);
>>       } else if (IS_SRIOV_VF(xe)) {
>>           ret = wait_event_interruptible_timeout(guc->ct.wq, 
>> WAIT_COND ||
>> -                               vf_recovery(guc), HZ * 5);
>> +                               vf_recovery(guc), timeout);
>>       } else {
>>           ret = wait_event_interruptible_timeout(q->guc->suspend_wait,
>> -                               WAIT_COND, HZ * 5);
>> +                               WAIT_COND, timeout);
>>       }
>>         if (!blocking && vf_recovery(guc) && !xe_wedged(xe))
>
