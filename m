Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5E33CA5FB3
	for <intel-xe@archiver.kernel.org>; Thu,  1 Oct 2026 11:38:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7436C10E34C;
	Thu,  1 Oct 2026 11:38:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SqZEXqDv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 894B910E2A7
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Oct 2026 11:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790854683; x=1822390683;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uGDlFW303vf3s7cGjXNeCZ+yVoOPwaqCeRhNVc2h88s=;
 b=SqZEXqDvGhLXSOn3Ep23iovMplDARkbURjPY0c2zF8qfHgQwZnPcigQj
 /GzmP1ADb/l4mfwIXTu+4xfWAVV3jGjxe3NfWCne3pSSfA2Yi6MBH4HeD
 TcNUOzfJg5yLzQZPG0FRGR0LDSPwuV23/mNBQRFrQ1q2zFOCpQvCt/kgg
 6ozgNjSJ1TEaMj5LcNdm//4PaWnPlo0SDnbImjBeBW4UGmcOX8f88T2Wh
 Ty7jtma4ugKVhbisrjOLVrMgmg1GkJqIJgXZMzgwmTd8harrTV09pbjGG
 9DZybhTg0JOC/09U0i2RGHsjQTDcXtVv2UunFV60hbuLHcmwtlp1mW19B g==;
X-CSE-ConnectionGUID: 4E4YZP3uRrKyxzoJrYz/rw==
X-CSE-MsgGUID: pqs/nrz4RUqQ/3oB+4g2Vg==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="102280875"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="102280875"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 04:38:02 -0700
X-CSE-ConnectionGUID: 5LVUDHMgRNWIIBNczQEvYw==
X-CSE-MsgGUID: O2YYG+AYReKqa9xgEUKy7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="302215818"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 04:38:02 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 1 Oct 2026 04:38:01 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 1 Oct 2026 04:38:01 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.15) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 1 Oct 2026 04:38:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m64g8n6yfVFRby7lRyKFFtbSjN7/OimG3vIWK88NKWSdjMdPoiXltYMeRvLlCW2UiUG5tZVsKbgLn4xPj4YjV7mn9k6BPF15zv0iXUPZDrDlc2ppablehj5AUy+IO7ceBy2pOctjkKPnl+vQABu6JtgZK9LX/2lgshpVE+/jDkolN5ue0XkUgMzJ7x40xBR7mG83EXvNHxJ4gRcGLm+tKs+MHZ8ypVmYRGoOXpL1ty7qOngkeObJYjNe1LD4I7hNV/QNwiMPxBzd/dgXtO1swRGjvgxgMsAP1CLcgmOknZRwKTQxMVXPzsZcfOReEFZFDm0bItSId1U8N61va1UsrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S+Ui/6oUuTp/L20mtak/vMa0awfm2+KWYLygJMnNsh0=;
 b=RGvTpPDnjwqm1n/1MeEDWnxEV6jRCjccbsjEVYrhgPvOPBiPyqXBlVClqnk1wC4pRaHsjqS0gAiqLTAGvRmhFzM/L9Iqs7Uc7G39DhS06xzqpSmvJhcQI9l9KkyxnX6WwTaHyhkwRaXNzY3A6F0MSAoXorfKYFI2spQM3L0S4C1l6hsKoZ+eOC/8Mj9Ite5oaXjWwsYnuhBg604oz2ZWKejpEhcm0XOVLOW5WKPeWsYjw2aNA79aaaJuefd5OAPlXUdRmudSogaRlegqsGx6fAxxoNjerHQBIXCm5Qd54cSztMdQ7PUCbOtmSIHRVD7nkD35pzKz6gxyVu1eO/NC+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 MN2PR11MB4599.namprd11.prod.outlook.com (2603:10b6:208:26d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Thu, 1 Oct
 2026 11:38:00 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%5]) with mapi id 15.21.0472.015; Thu, 1 Oct 2026
 11:38:00 +0000
Message-ID: <19a07566-261f-4e4d-886f-138c045dd195@intel.com>
Date: Thu, 1 Oct 2026 17:07:50 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/6] drm/xe/xe_ras: Add support to query page offline
 queue and list
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Gupta, Anshuman" <anshuman.gupta@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "aravind.iddamsetty@linux.intel.com"
 <aravind.iddamsetty@linux.intel.com>, "Nilawar, Badal"
 <badal.nilawar@intel.com>, "Jadav, Raag" <raag.jadav@intel.com>,
 "Koppuravuri, Ravi Kishore" <ravi.kishore.koppuravuri@intel.com>, "Koujalagi, 
 Mallesh" <mallesh.koujalagi@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>
References: <20260928061830.417395-8-riana.tauro@intel.com>
 <20260928061830.417395-10-riana.tauro@intel.com>
 <DS0PR11MB8718FB6941FCBB29011AF8C8818A2@DS0PR11MB8718.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <DS0PR11MB8718FB6941FCBB29011AF8C8818A2@DS0PR11MB8718.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0328.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:222::15) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|MN2PR11MB4599:EE_
X-MS-Office365-Filtering-Correlation-Id: 97e3f376-117d-4e5c-e880-08df1fb071fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|11063799006|56012099006|10067099003|6133799003|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: ddgv99YiJV3gzvOjrwKjTf/ift/yTiUaKfAEjWCzgJhERd1ocU+yjDF2EVlBMuGe08BLNSJin1PdEpeQBpytHEtdd0G/Hv7lQ93c/K01185Vw5WF+TgM+YVYlt6G2mme+Ph6obPlS6EzQtj1nshC1DSwj2AWBTnpb56kbmvbDHP8fz/rkJgVFXlQkQIaz9r3JuI6oW+3gvOmtqb1M4V4ERuSOgSitAzl3+rlc81Xt10gzGNhralfvrLW3chJ/2fBNNI9ZP6xtJ8NmN0BFs4FZLD0GyGgj9kBKrchLCItO1TsCQdaioRCsJtJq5uhFeLtwd4p+yYaHuLShu29iYekJ40mwz+tbUGfELIjF2kR4GHm2FpKAoW8yF/e/4iLi1+/GLtnwia9/wDHJaEGhwh9vlJpSB0lE2XgmE4dQURZD1woJzWS5yi3pOFJf3n5JkiQRQY5F8neWrH4Y1LRSuOsO+Y/1aR5xW8Uaj39tF/g0w0lhpmtUa1mSulaiF/iYmSyl7ogZ4EN/XWMnAj+SqSQED6ufD9shk6JpN7zTxd8Oi1TVuCcIFoSmGsX1IHGmr+bTXLnXEpBwtkus6U0Qe2TlZIxjsIP/PoTN4goIxRy6IKWbWkKcePlzmfNDVeK65P+qj/3Jo3WkNiJcWhvCGMr05nIDVUrd9svZpyXjdv2T9c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(11063799006)(56012099006)(10067099003)(6133799003)(4143699003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L2dQT091aVRRWHNPMWVmNEIwVlhFS2dlNmErV3g1RjZtV3BDLzZDWmd2eHZl?=
 =?utf-8?B?Z0UwckZqdGlOMWhzQTBWeXBzSkhpaHBOeU14U0Z2K1c1ZCsvNm9TMGwxMnBT?=
 =?utf-8?B?WnFKTEVZa245YUIzNFJwZkVHS1NTTnpnQUs0aTUyWkwxZ25DWU9XemduR3VW?=
 =?utf-8?B?Q05VeVZuYjZQaUVyMVdLazR2bzJVT0pSV3dVMy9EZ2RVVjRYemVNR0pYYUlX?=
 =?utf-8?B?WTlQejlUcXF6eXpkRWpwZnBjV3VMbHluQWZSKzU1eTJ2UEZ0blN4SEEzQkFt?=
 =?utf-8?B?NzcxZE1uYkJMRVNSODQ5SlZSOUxxM1g5dUtwL1hzOFVaM0ZYbHVTdUswOGNH?=
 =?utf-8?B?Sm1rZ2h0bzlJa3RHQm5CSVIrZmFQY0lEc2UyU2FtNEEzZks5SnZGSmFhMjlI?=
 =?utf-8?B?di9sckNrckFqRkNRQSsxbDFIM2gvNHZnc0xnNTdjRG40R1A0aFlLTmVyK0ds?=
 =?utf-8?B?QXo3bmhjVnRnM3hVUlVteVI5QjFYZEJSRDM5ekJDOEt0THU5QjNkNmJuYkYx?=
 =?utf-8?B?SGQybFU4dkdBRFl4cWlOWHFsSjdmclljWHQ0QktBRzQyRjM1dzk0UndINHVN?=
 =?utf-8?B?bXVoWGp1eGdvNWlEdStOVVBteU80R3N2a0xOamN6d2NzSm5QRjJtc2VmQ2Fi?=
 =?utf-8?B?c1ZpUng4OHE4QkwzVlUvQllZRnpKWjk2bjdaM096ZVgxbWJVNGNSSXpuaGtM?=
 =?utf-8?B?Z1VEaDk0YlRKTG1IRlR6QkdzMmV6V2lPek83aHN6M3lmQmxGb2tGMVNFNlRx?=
 =?utf-8?B?L2dta0d5dVlSUnJRZUNsU1V4Q1o4eTZ0SmNKODcvYVIvY1FWRGpyTEw3SVor?=
 =?utf-8?B?RVk0S2Z4cEUyTlRaMThoR2o5aThVMjNkc3BEdjd6K0RoNGo3Mk9GVnFOVzdj?=
 =?utf-8?B?KzV3Sjl3Y0kxWTgyOHExME5nWU9WU3lYMW05MjhhZ2h4QVA3cEpDeVpsbjdO?=
 =?utf-8?B?R3laVE80RkxVZE0yYUFnS1RBdUt0ckMvdWxteU13akVGVHNNMlZLZjEzaXhB?=
 =?utf-8?B?bFNOUkRWVnZvVVd1SWR2YTZBY2s3VjRLSzA1bnd3cENxdXJSYVhxZzRHQmU4?=
 =?utf-8?B?NmIrYm44blZSc0pIVkc0L2pTSmV3VWhLNjByeXRDcHBWM09EVFp0aEJ1Z2Jh?=
 =?utf-8?B?cjZydlBIRWd5dnBmdVBnSTdTM3E2QVRiNUplckZ4cEczY0JoblZsaDE1Tkt5?=
 =?utf-8?B?bXY4NHNobWRxWE9YK292VUdIYnZTcmNraXB6TmRPbUIxQVVSQk1jNkN3Zk1R?=
 =?utf-8?B?aytRTVhEVnhZVWpacmY2bGhKQTdjckVuQllHTGxVdGxYckI2WmdtL0tIdHQy?=
 =?utf-8?B?MXFITEw1Z0ZEbVdrc0Y3WDRsK3dqaVJ0M1JSUElpNzZNU21QRGpNYWVvRURa?=
 =?utf-8?B?cWwvNWoyNUpRTUFuS0tkZkVZVlp6ZU5yOXRWaG8wR1JHdnJOMTRTTTNMeldW?=
 =?utf-8?B?WXBsWCtpZmI1S0R1T25zcU1TTEs5VWUyNlQvNWtYVnh3c2lwZnFFZm9jNGlS?=
 =?utf-8?B?OGtOVU9xbWVkenppaHNJckt6S3gxaFQ3L3FaV3JmM0M0b0FORHE0L1VIS2t0?=
 =?utf-8?B?TXorUERNYnZWb2FNYktIMFVNRnhpVzREalVFVkRBYzlCTlZCYk1ibGRMZE5I?=
 =?utf-8?B?UDdqVzBEVnV5ekh4TWVaV2l0OElhaDBvZDkxdXlHSVBsdXFxQWVlMEs2MUVI?=
 =?utf-8?B?L0xacXVOd1RrVENQRzl1RzdqNkl6QlFkRGZ1SnpuS0hFNG9tMU1IR0tkbm9s?=
 =?utf-8?B?VzdRVVRpbGZuSzZpNjZSbjB4K3lJbEQrUU5xc0ZEWjgwTzF6NmNZbnJ3cGJw?=
 =?utf-8?B?c2NCWGNuc1dQc0p0VXlrOTUwWVBCZXdURHdORmN6WU9Va0ZjKzQrUWN3WktF?=
 =?utf-8?B?V2xndGk0QmhGOXVTaEtTUkt0S0MvN3NCUkY5R2VpYS9qa2txTEpYQmQ4dVVa?=
 =?utf-8?B?ekZXNmpEV2xxWC83SHZ5ZW5KcUhhZ0VJeVpPZTRCajFnK2htVXBlT2tEYXRt?=
 =?utf-8?B?ajJzWW1XYWhKM3lybmxTUDVha1QxK2dMUHdBUFBmQTdpbUdUNjdiOXI5S2Iv?=
 =?utf-8?B?MldDZkg0R1BYQlUxZ2J2SGYxSzFTMkt5UTlabW00UkxLbWg4aUtlemt1SDV0?=
 =?utf-8?B?Nk1pYkpMTUIyaGRQVUZieFZtc1lpNWdDTjUzaW0yWTgzam9jelpkeXkzU2xY?=
 =?utf-8?B?VGpPdVZCcGdUYXp0Zk5MY3RXbTQ5OWNaOXhJZXVUeE1ScEN6bHZsMjhrSm5C?=
 =?utf-8?B?RTFXcXI5bTFIRlUzaWd6WGNrL1F5bzRDdWh2VHpkRjBmVHkvRFZhTm91ak5K?=
 =?utf-8?B?SmRub0ROQnNRUHcyZDdqMmt0d2IrZERpNWNMMno0TFVKbXVwVWc1UT09?=
X-Exchange-RoutingPolicyChecked: NETsTfBPD91Qc6pmcWzFQ4sTpCpy+vYTCYlXcoBQ5y7JIBcDOqrJ1KPRVWFkoEz//WI6P3y4QBfjw+L3XAS1/XlemICRne7KXUuPKwF1/vXa44i6IhpafYwW1zAWFOdvNDrXbqFtsUg+EHVgv9EmpNjK0bUFuuqb2RYZxn76ERI5qr+Kj7QkHRKLt/ZgBvqvGjtpakM9ua4N2GvZu4LMuhYFDYVJQKf1vRrJ6l7/5TwEfJm9P+TyWJOq86vd4qorGkDghzNnUsRAhAd01tspd3Lpy+STcpry9md71u7/XkSOhMTn14inZMkrY7iWgQ7s5B8Idnx7roiXX6l6GxmOGQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 97e3f376-117d-4e5c-e880-08df1fb071fa
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 11:37:59.9546 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rH5d3SWGURA42zeXwfyzo2IV4+ie3yqrKLFn45ohRGaZegCTSo1DdOFpXDJhqb66a15gJrd2Tqq6p1wDflwUtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4599
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


On 01-10-2026 16:54, Upadhyay, Tejas wrote:
>
>> -----Original Message-----
>> From: Tauro, Riana <riana.tauro@intel.com>
>> Sent: 28 September 2026 11:49
>> To: intel-xe@lists.freedesktop.org
>> Cc: Tauro, Riana <riana.tauro@intel.com>; Gupta, Anshuman
>> <anshuman.gupta@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>;
>> aravind.iddamsetty@linux.intel.com; Nilawar, Badal
>> <badal.nilawar@intel.com>; Jadav, Raag <raag.jadav@intel.com>;
>> Koppuravuri, Ravi Kishore <ravi.kishore.koppuravuri@intel.com>; Koujalagi,
>> Mallesh <mallesh.koujalagi@intel.com>; Upadhyay, Tejas
>> <tejas.upadhyay@intel.com>; Ghimiray, Himal Prasad
>> <himal.prasad.ghimiray@intel.com>
>> Subject: [PATCH v3 2/6] drm/xe/xe_ras: Add support to query page offline
>> queue and list
>>
>> Add support to query page offline list and queue from firmware during
>> module load. The page offline list command retrieves pages that are already
>> offlined by the firmware. The page offline queue command retrieves the pages
>> pending to be offlined by the firmware.
>>
>> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>> v2: rebase
>>      store total pages once per response (Sashiko)
>>
>> v3: common function for offline and queue (Himal)
>> ---
>>   drivers/gpu/drm/xe/xe_ras.c                   | 74 +++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_ras_types.h             | 35 +++++++++
>>   drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |  4 +
>>   3 files changed, 113 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c index
>> 1225c561a872..752754f09314 100644
>> --- a/drivers/gpu/drm/xe/xe_ras.c
>> +++ b/drivers/gpu/drm/xe/xe_ras.c
>> @@ -335,6 +335,77 @@ static bool ras_counter_is_valid(struct xe_device
>> *xe, struct xe_ras_error_class
>>   	return true;
>>   }
>>
>> +static void get_offline_pages(struct xe_device *xe, u32 cmd, void *req, size_t
>> req_size,
>> +			      void *resp, size_t resp_size,
>> +			      struct xe_ras_offline_common *common, bool
>> offline) {
>> +	struct xe_sysctrl_mailbox_command command = {0};
>> +	struct xe_ras_offline_list_request *list_req;
>> +	u32 total_pages = 0, count = 0;
>> +	ssize_t rlen;
> size_t rlen;
Sure will fix

>
>> +	int ret, i;
>> +
>> +	list_req = req ? req : NULL;
> equivalent to list_req = req

I had initially added all conversions. missed this while removing . yeah 
will fix it

>
>> +
>> +	xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP,
>> cmd, req, req_size, resp,
>> +				  resp_size);
>> +
>> +	do {
>> +		memset(resp, 0, resp_size);
>> +
>> +		if (list_req)
>> +			list_req->index = count;
>> +
>> +		ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
>> +		if (ret) {
>> +			xe_log_err(xe, SYSCTRL, ret, "failed to get page offline
>> data, cmd=%#x\n",
>> +				   cmd);
>> +			return;
>> +		}
>> +
>> +		if (rlen != resp_size) {
>> +			xe_log_err(xe, SYSCTRL, -EINVAL,
>> +				   "unexpected page offline response length
>> %zu (expected %zu), cmd=%#x\n",
>> +				   rlen, resp_size, cmd);
>> +			return;
>> +		}
>> +
>> +		for (i = 0; i < common->pages_returned && i <
>> XE_RAS_NUM_PAGES; i++)
>> +			handle_page_offline(xe, common->page_addresses[i],
>> offline);
>> +
>> +		count += common->pages_returned;
>> +		if (!common->pages_returned)
>> +			break;
>> +
>> +		if (!total_pages)
>> +			total_pages = common->total_pages;
>> +
>> +		if (count > total_pages) {
>> +			xe_log_err(xe, SYSCTRL, -EINVAL,
>> +				   "Pages returned exceed total pages %u,
>> returned %u, cmd=%#x\n",
>> +				   total_pages, count, cmd);
>> +			return;
>> +		}
>> +	} while (common->additional_data);
>> +}
>> +
>> +static void get_queued_pages(struct xe_device *xe) {
>> +	struct xe_ras_offline_common response = {0};
>> +
>> +	get_offline_pages(xe, XE_SYSCTRL_CMD_GET_OFFLINE_QUEUE, NULL,
>> 0, &response,
>> +			  sizeof(response), &response, true); }
>> +
>> +static void get_offlined_list(struct xe_device *xe) {
>> +	struct xe_ras_offline_list_response response = {0};
>> +	struct xe_ras_offline_list_request request = {0};
>> +
>> +	get_offline_pages(xe, XE_SYSCTRL_CMD_GET_OFFLINE_LIST,
>> &request, sizeof(request),
>> +			  &response, sizeof(response), &response.common,
>> false); }
> Please consider following if it looks ok. To make it less confusing and naming it what it actually does,
>
> /*
>   * Fetch the next batch of page addresses for @cmd from firmware and process
>   * each one locally via handle_page_offline(). @notify_fw controls whether
>   * firmware is told back (XE_SYSCTRL_CMD_PAGE_OFFLINE) once a page has been
>   * handled - see the two callers below for why that differs per source.
>   */
> static void xe_ras_process_offline_pages(struct xe_device *xe, u32 cmd, void *req,
>                       size_t req_size, void *resp, size_t resp_size,
>                       struct xe_ras_offline_common *common, bool notify_fw)
process_offline_pages is indeed better than get_offline_pages. Will 
avoid confusion
Will change it. File prefix is used in xe driver for non-static functions.

> {
>      ...
>      for (i = 0; i < common->pages_returned && i < XE_RAS_NUM_PAGES; i++)
>          handle_page_offline(xe, common->page_addresses[i], notify_fw);
>      ...
> }
>
> /*
>   * Firmware's pending queue: addresses it hasn't finished offlining yet.
>   * Drain it and ack each page back so firmware can dequeue it.
>   */
> static void xe_ras_drain_offline_queue(struct xe_device *xe)
> {
>      struct xe_ras_offline_common response = {0};
>
>      xe_ras_process_offline_pages(xe, XE_SYSCTRL_CMD_GET_OFFLINE_QUEUE, NULL, 0,
>                       &response, sizeof(response), &response, true);
> }
>
> /*
>   * Firmware's persisted (flash) list of already-offlined pages. Just replay
>   * them into local VRAM tracking on driver load; firmware already has them.
>   */
> static void xe_ras_restore_offlined_pages(struct xe_device *xe)

Drain does make sense for queue but restore doesn't for list. We are not 
restoring the pages, they are still offlined.
Wouldn't it be better to just retain the  command names. Adding 
description is better . will add that in new rev.

Thanks
Riana


> {
>      struct xe_ras_offline_list_response response = {0};
>      struct xe_ras_offline_list_request request = {0};
>
>      xe_ras_process_offline_pages(xe, XE_SYSCTRL_CMD_GET_OFFLINE_LIST, &request,
>                       sizeof(request), &response, sizeof(response),
>                       &response.common, false);
> }
>
> Tejas
>> +
>>   static struct pci_dev *find_usp_dev(struct pci_dev *pdev)  {
>>   	struct pci_dev *vsp;
>> @@ -1049,6 +1120,9 @@ void xe_ras_init(struct xe_device *xe)
>>   	if (IS_ENABLED(CONFIG_PCIEAER))
>>   		ras_usp_aer_init(xe);
>>
>> +	get_queued_pages(xe);
>> +	get_offlined_list(xe);
>> +
>>   	ret = devm_device_add_group(xe->drm.dev, &gpu_health_group);
>>   	if (ret)
>>   		xe_err(xe, "Failed to create GPU health sysfs, err=%d\n", ret);
>> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h
>> b/drivers/gpu/drm/xe/xe_ras_types.h
>> index f119489bcdf2..021ffbd6d4e2 100644
>> --- a/drivers/gpu/drm/xe/xe_ras_types.h
>> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
>> @@ -10,6 +10,7 @@
>>
>>   #define XE_RAS_NUM_COUNTERS			16
>>   #define XE_RAS_NUM_ERROR_ARR			3
>> +#define XE_RAS_NUM_PAGES			25
>>   /* Error bits in IEH global error status register */
>>   #define XE_RAS_SOC_IEH_PUNIT			BIT(1)
>>   /* Device memory error categories */
>> @@ -330,6 +331,40 @@ struct xe_ras_page_offline_response {
>>   	u32 reserved;
>>   } __packed;
>>
>> +/**
>> + * struct xe_ras_offline_common - Common structure for offline list and
>> +queue  */ struct xe_ras_offline_common {
>> +	/** @total_pages: Total number of queued pages */
>> +	u32 total_pages;
>> +	/** @pages_returned: Number of pages returned in this response */
>> +	u32 pages_returned;
>> +	/** @page_addresses: Array of page addresses (4KB aligned) */
>> +	u64 page_addresses[XE_RAS_NUM_PAGES];
>> +	/** @additional_data: Indicates if more data is available */
>> +	u8 additional_data;
>> +	/** @reserved: Reserved for future use */
>> +	u8 reserved[3];
>> +} __packed;
>> +
>> +/**
>> + * struct xe_ras_offline_list_request - Request for get offline list
>> +command  */ struct xe_ras_offline_list_request {
>> +	/** @index: Zero-based index into the offline page list */
>> +	u32 index;
>> +} __packed;
>> +
>> +/**
>> + * struct xe_ras_offline_list_response - Response from get offline list
>> +command  */ struct xe_ras_offline_list_response {
>> +	/** @max_entries: Total no of pages that can be stored in flash */
>> +	u32 max_entries;
>> +	/** @common: Common offline page information */
>> +	struct xe_ras_offline_common common;
>> +} __packed;
>> +
>>   /**
>>    * struct xe_ras_get_health_request - Request structure for obtaining gpu
>> health
>>    */
>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> index a01576bf2e73..3a71ed446949 100644
>> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> @@ -31,6 +31,8 @@ enum xe_sysctrl_group {
>>    * @XE_SYSCTRL_CMD_SET_THRESHOLD: Set error threshold
>>    * @XE_SYSCTRL_CMD_GET_PENDING_EVENT: Retrieve pending event
>>    * @XE_SYSCTRL_CMD_PAGE_OFFLINE: Instruct firmware to offline/remove a
>> page
>> + * @XE_SYSCTRL_CMD_GET_OFFLINE_LIST: Retrieve list of all offlined
>> + pages from flash
>> + * @XE_SYSCTRL_CMD_GET_OFFLINE_QUEUE: Retrieve list of offlined
>> queued
>> + pages from firmware
>>    * @XE_SYSCTRL_CMD_GET_HEALTH: Retrieve gpu health
>>    * @XE_SYSCTRL_CMD_SET_HEALTH: Set gpu health
>>    */
>> @@ -42,6 +44,8 @@ enum xe_sysctrl_gfsp_cmd {
>>   	XE_SYSCTRL_CMD_SET_THRESHOLD		= 0x06,
>>   	XE_SYSCTRL_CMD_GET_PENDING_EVENT	= 0x07,
>>   	XE_SYSCTRL_CMD_PAGE_OFFLINE		= 0x08,
>> +	XE_SYSCTRL_CMD_GET_OFFLINE_LIST		= 0x09,
>> +	XE_SYSCTRL_CMD_GET_OFFLINE_QUEUE	= 0x0A,
>>   	XE_SYSCTRL_CMD_GET_HEALTH		= 0x0B,
>>   	XE_SYSCTRL_CMD_SET_HEALTH		= 0x0C,
>>   };
>> --
>> 2.47.1
