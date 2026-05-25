Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58965CD5BB1
	for <intel-xe@archiver.kernel.org>; Mon, 25 May 2026 18:57:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1682610E1EA;
	Mon, 25 May 2026 18:57:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DLtdOO9h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E5F710E1EA
 for <intel-xe@lists.freedesktop.org>; Mon, 25 May 2026 18:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779735454; x=1811271454;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=hyM0vpnZ3JiRBiEJ6o6kLAPzmkMcNrk8uP6aggHvob8=;
 b=DLtdOO9hkQ/63e1/ydTeLPg/IhMPBdflH4NTSLuJt8D7gCV4kxJpUh8R
 7URxFKR6HhRpH3qJ8+GI/jjGt/DI21TbDscChnmCSMahYfR5v/cotHSxG
 SFu9FfGijHXpYFqQ+wd0eBdnsRDGMD0a0UPUg7t48LAgbVLNGu+kMZQNN
 MRaNaqLKBYDtvSZ11iToVlHm8ZnVPnQjK8TVEw5D7JgXYw8mmmqsZk+VG
 z5JBnEXxh5P0h3+fxoaELmRFjjbO4NY6BHO6we03Km6jLDSx2i5lOcZTp
 mz51vOTt8JSgs6TXmhQ1UpekW8o2nnn5O3zjLZDTDAEcwC3IsbE1qJKun g==;
X-CSE-ConnectionGUID: xVr+qk5/TOOQ832PJTt14w==
X-CSE-MsgGUID: so8LodCURK6gxUPuvejA3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="80526990"
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; d="scan'208";a="80526990"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 11:57:34 -0700
X-CSE-ConnectionGUID: gjrCOV8vSaGNjgVIvU5/2Q==
X-CSE-MsgGUID: C9C6Q9x5SqaMYQerYOvSbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; d="scan'208";a="240841987"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 11:57:33 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 25 May 2026 11:57:32 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 25 May 2026 11:57:32 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.43) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 25 May 2026 11:57:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VwJirdt3IgvBx5isrAjul3dF3yQ446ROduMuKvYhAWg7SZ18YEzPf/259OMiKY0kOJXd0lOeFWCrE+8+OehOpmnNFL1986fo/0XNRvYQSK9gdx0c1UDphM4zKdA8ak6IdhJNQB/LzNVgc4YFpa5hN8mAFNzhdEPqehZ5ZpQnA9oaeWsgqO1wcYthW28T6/6Mj+86xWfP9wnT56YY3Mzvq32mlK6WAOdjVi1wnFkTooCD/Id++PUPYQ0lQ7FTVHEaiXv0ZlGxWEfLZheG0s7Qivlop+eGtDDIBC6yW4J3USHZGhQawgDWt/oiUd8ywRDAEvgj7qIzq3S2jX8fr/KO8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sloXLFysnl7Zo3JH3MI5+m0IKnV6Fr/7Bk1wQ9sYnx4=;
 b=aKgKBWZ5mKMRT2t/JhPc8Z2/Qkr/eS2Fy+sTWVXomG9xGw7tjBzNUDeDFBa4xLEmSdKfaAvlrt+qSpfArxHBjzLzY/f7nGKvJRtlqmcZ0UvpjHdNvV7wQsysYomCAt1reYgV4vRo2x35Oi8Tf3TCWynDqCpDypxfRiEzHBPMi3ogmZw1SxxfgEdzxrKIShffV3tdHdhuP+sdR5LysTpFGmM6aegf7IUrBDijsvUZP4NDmFhIvelmzTYLulSiWM2UYw96SyWC14pd6AqoAafYXzK4CkM0SSv4Oss9duw5Eh1vkv2WZixed4rWPTUJDqJJfWmAZwx45iv1mNrTOVc06g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SA1PR11MB6920.namprd11.prod.outlook.com (2603:10b6:806:2bb::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.18; Mon, 25 May
 2026 18:57:27 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0048.019; Mon, 25 May 2026
 18:57:27 +0000
Message-ID: <cb7116e6-e713-41e6-a687-8e814ff2dcde@intel.com>
Date: Mon, 25 May 2026 20:57:24 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] drm/xe: Separate early xe_device initialization
To: Gustavo Sousa <gustavo.sousa@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20260525160529.15890-1-michal.wajdeczko@intel.com>
 <20260525160529.15890-5-michal.wajdeczko@intel.com>
 <87bje3ic4o.fsf@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <87bje3ic4o.fsf@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR04CA0113.eurprd04.prod.outlook.com
 (2603:10a6:803:64::48) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SA1PR11MB6920:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e10501a-b593-4fd3-9855-08deba8f773b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|56012099003|18002099003|22082099003|6133799003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: wMtDJuFbEjo9+EZRtFrLrIJncyDJ3fcRudJ+3xuQKJuXCAEGt74aMRV6p7QC2itkETS4BY7QaemVUhUCRTFn1JC4zMEo2y2fAjuNy+KBTjed72rz4+9T28WEBBV397qzmAcuxde4pCcQsQISWm0bowlQxQmLOY1m3V1Kf6IDq2tSVQXOiDl34uJWnF7O921HZRqa1zj42Crc1l5iSB9imoTlTbcH11yEAnt5iZBwZ3qUWxku3ueRgH2qEm54j7ZXr5tLNg1wEqv1C3i2F40GkrjSZ6PdAmKfGdAOVGA1HnpILEm8R4BIQZzEEu85cVV3ncAETEUXsJ7qgX9gelchIH8qeiArLlv3KbGsfi8tdOBTK7ajw0ngvcUA8lp3FTRat3F12iODJKYMy/QTq4UB8qaNzX3aVhKEE0ng1glohMgXvtz0Eb+LPqb24Twc4XCOWdoJXlmxh8D+fu/7D3tzSsYg5m9KiWT8tCQWP6MQ8Jr6AMXXdrFvGIHpxQkiEhGX4YDTawnFx1t7TEzMniAnOMB7alCeYH9YkZpwDXmemzoTTi0/EHwY+L5R7bWjgKOuMaURb60tVPnd+oAN5kvJ5lR7GFoEiIxk81ktPZmwhgXuscmT5leTITh/FkIoo669tluacJcMeOCN3tEBz2RMRBStLsEqAuliURf8LXqVtyiA7Xch0dsVaKAPsXfufzyz
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(18002099003)(22082099003)(6133799003)(4143699003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SEU4VkJsMllTcURzbEhsZE95elpjQ0hMZTgyNVk5dENOYjhVRmtYdjlXbDE0?=
 =?utf-8?B?Si91WFBLYW5nQTFqYjdnczNTYUNia1gwWC9MZ1ZhaVVKWG0rMEY0bWp4Zk5X?=
 =?utf-8?B?Z21LVi9VU2JZdlJIcU9tUXMvdzRXb3BDbHRyNzM2eFlzSUFaZ0xFQ0p1ai8x?=
 =?utf-8?B?cWNGbitQLys3eFlDdVVsVk8xSkdWb0RGN2ttK3Y4ODBIY0R2MGNRZEk2QlIv?=
 =?utf-8?B?UDY2blk5ZGJTRk9xL21SNW10NnFUWWZFZ0VvWjVwWjlOODVtTTlITU9zc3Jm?=
 =?utf-8?B?cHQ5aURMVkZoc1hPWmF6dmVXRWo1VnN5ZkZnZk5zQWVsQWU2cnJXKzRaSXd6?=
 =?utf-8?B?Z2E3TWx2MzQrd0ZDZDJIVjhNRHI1TUcrYm1yUUJrK0dVR2Zwa0dqRTAyU25a?=
 =?utf-8?B?b3FISkdzR085bDdYVWY4RDFaekxhSC9RemZ2UFpvRkQ5ajhJSHJxRlZERVhV?=
 =?utf-8?B?anJLeXM3WUN1R0Fwb0dISUltQk5GVG9iLzgrdU5UN1p1aHYwTmpSd09GS3ZL?=
 =?utf-8?B?Nkx5akk4cmhSTkxjSHk0QzdTU3lyV2lTemI2ZjR4QWdwdlJROVBDakJUZEh1?=
 =?utf-8?B?YTVhNzFaQUJsTVF1QzRUMzE2cDB3cXNrT1pZaUFBRlVJK1kxcTRydmxWc0ox?=
 =?utf-8?B?aUhNTnhFNEx6M2o2VmNqME1tS0Y4TDJPcVF3S0hjaW9zMkE5VmFkRTJNa0Fo?=
 =?utf-8?B?NGhzNExTb0ZGUndSRE9LWkZYMHZWN3JxeTFmdnU3RlhhM1FGWU52Zk40VU9B?=
 =?utf-8?B?SVVqSXgxZU5vQzNHUlF3dUpjRDRsVDNYR1V2TEhSb3c2cHZQYkozcGhrMHE0?=
 =?utf-8?B?TnVtVzFLaFR1czNycXoxckJEWHNZaFpST1l1eFJjbXpRcXBYY1Jyczd5RFlO?=
 =?utf-8?B?RjRwSk5OcE4rM2xCb1VYT2hvM2RMcVV6eitBdU1YOXJ1MW8veFlPS3NEV1BI?=
 =?utf-8?B?Rk9sbWVOemlFMmZCNExmd3NVdEVsUlhrMnZyMWNCeDBjb2luMHVONCtpUjgz?=
 =?utf-8?B?TDhrUXJFa01OQkFKY25JcUFDUmJqZCsyektuMFNmNk01cEliU1lmRDU3Zlpl?=
 =?utf-8?B?bmlQWlh6TFVFYS9YaHMwOWR5TWJzZFN1dkRnYXBmb1NmMkpDaWxaenlBbG44?=
 =?utf-8?B?ZTBzUTFTbXlKY0M4QjJybkxCUk0zZzE5SGpyTmxOMzlJOTRSRlF5TFJnSVp2?=
 =?utf-8?B?WW12S3lwYTV3K0VKZFJ4bDBvS0JwM3cxMElxa0ZyZXdPY0ZTRHZ0empNdnE5?=
 =?utf-8?B?R2JsVDM4WndiRjlPVk8vMEIxWVhyY2JOVXlMUU5YaXEvbitnRVAxTFErL1Zh?=
 =?utf-8?B?MnlvUVRLOUVlUXlvb1A2M0dndGRlNUZVb21hNklabnU3QUJFUEtuUnY3NHM4?=
 =?utf-8?B?VWFBdnpGOEJ6TVdLQjZrM0RTb3N2ZEFGRlhzQmRhUkZqeWhIQ2tteVBlbkkw?=
 =?utf-8?B?S2pianRuVUlPSVVWVThRTU1SaE1wbng0T3l2WTRxRjVZZzlWTnlsaFFhS2Ro?=
 =?utf-8?B?NldXM3lnbEVJY2NJb3lJeGtxUDhNWEJSdTgwNy93L3hRTGlvaVJxOFBqRXMz?=
 =?utf-8?B?TFplWS9nQ1Jxai9BZGVCQ1NXeUFGYnlLTTA5TWhFZW8yYkZQaDJaYVFCYWJW?=
 =?utf-8?B?Ykt3QmZlRVp1eXRkN25vRERId09WYnZsZlVnOVdUTzVaRG5USXhIOUR1SWZr?=
 =?utf-8?B?TFQ3OUpHNEJmUUV3TytCYnA3Y0RwWUFDZVJ5NVlYVVIvenMvb2MzVDZuc3d4?=
 =?utf-8?B?bjZYZDJXem9KeEI2L0VnRkFXQ0RNWkF6bVhGZlFWWWgxbGNhdmJhcEdIampy?=
 =?utf-8?B?VjRmdzFJbllFZk5KQ0NKdmtoMi9OYjlBS3QxU243dTJGT04wdVVmWmhpdjY0?=
 =?utf-8?B?Q0RaZkE1MUFEbnhwS0FKQUNVY2pUUUZSTTh1YmcxYnVQekVTaWh1S08vZm1K?=
 =?utf-8?B?OEhvRTZpZU9tYnpVc3RQemhvUHJ1VXNKaDBmUllQMTlVQWRYRXE4UEkzYjZP?=
 =?utf-8?B?WXdxUTc1WWdsWVJpckFtaUxkZ1NVeG45RStyWjJTTDlrd0pRUWxBdi85R2FX?=
 =?utf-8?B?SHlFZjQxbmVjUVBMUXY1T3RqMVJmU3ZQUkZuWjd1ckllbFEvODJEQ1ZIK3NF?=
 =?utf-8?B?djdKbWUrTDJQUi9ETmMzT01mYzJZQlNFbFozL01vRGx6Q3dVRVJkRzIvaEdD?=
 =?utf-8?B?U3B0d1BLSTQ1ZU1YYzFmRUxGem9GV0h6clF6SVV6Q1JZV3BrSlFHeDhOUjhz?=
 =?utf-8?B?Z2xDM2RNVWF4M0twR3JERWZSTWtac0MvVFFUZ0JhbURwUUhmR3ZqamNJSVh4?=
 =?utf-8?B?QkcyZDRvTUtPdDJMSDd4KzBKNFFaNXlTVUkwMTVYdThNcDB2RGErRENMYjJZ?=
 =?utf-8?Q?r2IyUkk4Kz1e4GpA=3D?=
X-Exchange-RoutingPolicyChecked: BmAgtcuV+w5H38l+X2yOr0cPFICRKdrNO0s3SMrzA0WansKIN4VnYtyoZtlkdLC+fRFDezSfNS3chqmT2gAhs+cAazJ5S4c9nZFmsRYdKTD7xQPHSNhKmkefGWg2F6UojIPjwi4neBXE8n+yNY30p8cHdyxwhGtBrgMt6wIv8OAsNLkgG7WUKhY2QG59TfnqrseXoTfrWViJ4RszwJ+jbdG2wMPa+HXflO4/1HZ4Py2FhMKD5bs5VwWupQ9dab4LYKjz9icLFsYA3uxgUB0CSMak5Md63UScvZDA8qPncrhdYa1U/gRL3F1bV3B2fs4tRoN52XZOWuqQ0Khs8wtubA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e10501a-b593-4fd3-9855-08deba8f773b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 18:57:27.7921 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HRRPal3/fmdZSrLsxjifXtxkayVHKyj9C29FdHIDe7s1LdvDimwuZVhxLqbU5xJ+Qd8/GgatXRJ9HSyDo0mjpfHcKI+zPpvlhA6i7r9hKk8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6920
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



On 5/25/2026 8:21 PM, Gustavo Sousa wrote:
> Michal Wajdeczko <michal.wajdeczko@intel.com> writes:
> 
>> We would like to initialize more of the xe_device struct also from
>> the kunit code, as it should be safe to use most of the generic drm
>> or xe components without doing any additional tweaks. Separate early
>> xe initialization code to a new function, so it can be reused.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_device.c | 39 ++++++++++++++++++++++++----------
>>  drivers/gpu/drm/xe/xe_device.h |  1 +
>>  2 files changed, 29 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> index b498147dcf61..7ba407f73a02 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -506,27 +506,45 @@ struct xe_device *xe_device_create(struct pci_dev *pdev)
>>  	if (IS_ERR(xe))
>>  		return xe;
>>  
>> +	err = xe_device_init_early(xe);
>> +	if (err)
>> +		return ERR_PTR(err);
>> +
>> +	return xe;
>> +}
>> +ALLOW_ERROR_INJECTION(xe_device_create, ERRNO); /* See xe_pci_probe() */
>> +
>> +/**
>> + * xe_device_init_early() - Initialize a new &xe_device instance
>> + * @xe: the &xe_device to initialize
>> + *
>> + * Return: 0 on success or a negative error code on failure.
>> + */
>> +int xe_device_init_early(struct xe_device *xe)
>> +{
>> +	int err;
>> +
>>  	err = ttm_device_init(&xe->ttm, &xe_ttm_funcs, xe->drm.dev,
>>  			      xe->drm.anon_inode->i_mapping,
>>  			      xe->drm.vma_offset_manager, 0);
>> -	if (WARN_ON(err))
>> -		return ERR_PTR(err);
>> +	if (err)
>> +		return err;
>>  
>>  	xe_bo_dev_init(&xe->bo_device);
>>  	err = drmm_add_action_or_reset(&xe->drm, xe_device_destroy, NULL);
> 
> Curious: are the drmm_* calls going to work fine for the automated
> teardown when they are called from a kunit context?

that's correct, see:

WARNING: drivers/gpu/drm/xe/tests/xe_kunit_helpers.c:67 at my_drm_fini+0x72/0x80, CPU#0: kunit_try_catch/20
drm-kunit-mock-device test_data.drm-kunit-mock-device: [drm] WARN_ON(true)
CPU: 0 UID: 0 PID: 20 Comm: kunit_try_catch Tainted: G        W        N  7.1.0-rc5-g547691814d7b-dirty #1020 VOLUNTARY
Tainted: [W]=WARN, [N]=TEST
Stack:
 607ffcd5 00000000 00000000 00000001
 ffffff00 607ffcd5 00000009 60029a90
 6086f348 60064b86 605cf832 a088bcb0
Call Trace:
 [<60029a90>] ? _printk+0x0/0x65
 [<60064b86>] ? dump_stack_lvl+0x6f/0xb8
 [<605cf832>] ? my_drm_fini+0x72/0x80
 [<600231a3>] ? __warn.cold+0x82/0x1cf
 [<601aacb0>] ? kfree_const+0x0/0x40
 [<60023384>] ? warn_slowpath_fmt+0x94/0xa1
 [<60409500>] ? __drm_dev_dbg+0x0/0xb0
 [<605cf832>] ? my_drm_fini+0x72/0x80
 [<603fb4a7>] ? drm_managed_release+0xa7/0x190
 [<605ec9a0>] ? devres_log+0x0/0xc0
 [<603e6590>] ? devm_drm_dev_init_release+0x60/0x90
 [<605ecb75>] ? release_nodes+0x55/0x80
 [<6069ae80>] ? mutex_lock_nested+0x0/0x20
 [<605ee3f7>] ? devres_release_all+0x97/0xf0
 [<605e68c0>] ? bus_notify+0x0/0x60
 [<60695df0>] ? mutex_unlock+0x0/0x20
 [<605e6f54>] ? device_unbind_cleanup+0x14/0xb0
 [<605e88e6>] ? device_release_driver_internal+0x266/0x2c0
 [<60669f50>] ? kobject_put+0x0/0x150
 [<602ef010>] ? sysfs_remove_file_ns+0x0/0x20
 [<605e64fd>] ? bus_remove_device+0x11d/0x1b0
 [<6069ae80>] ? mutex_lock_nested+0x0/0x20
 [<605dfc1f>] ? device_del+0x1bf/0x5f0
 [<60075330>] ? um_set_signals+0x0/0x60
 [<60075320>] ? um_get_signals+0x0/0x10
 [<606a2160>] ? _raw_spin_lock_irqsave+0x0/0xa0
 [<605e0064>] ? device_unregister+0x14/0x40
 [<60375cde>] ? kunit_remove_resource+0x8e/0xd0
 [<606a24d0>] ? _raw_spin_unlock_irqrestore+0x0/0xb0
 [<60375323>] ? kunit_cleanup+0x63/0xb0
 [<60377a70>] ? kunit_generic_run_threadfn_adapter+0x0/0x30
 [<60377a86>] ? kunit_generic_run_threadfn_adapter+0x16/0x30



> 
> What about devm_* calls? From a quick look, I know that at least
> xe_bo_pinned_init() will make one of those.

kunit device follows device model, it is just created on a dummy bus,
but everything else works fine, see:

WARNING: drivers/gpu/drm/xe/tests/xe_kunit_helpers.c:60 at my_dev_fini+0x6f/0x80, CPU#0: kunit_try_catch/20
drm-kunit-mock-device test_data.drm-kunit-mock-device: [drm] WARN_ON(true)
CPU: 0 UID: 0 PID: 20 Comm: kunit_try_catch Tainted: G                 N  7.1.0-rc5-g547691814d7b-dirty #1020 VOLUNTARY
Tainted: [N]=TEST
Stack:
 607ffcd5 00000000 00000000 00000001
 ffffff00 607ffcd5 00000009 60029a90
 6086f348 60064b86 605cf7af a088bd00
Call Trace:
 [<60029a90>] ? _printk+0x0/0x65
 [<60064b86>] ? dump_stack_lvl+0x6f/0xb8
 [<605cf7af>] ? my_dev_fini+0x6f/0x80
 [<600231a3>] ? __warn.cold+0x82/0x1cf
 [<605ee3b5>] ? devres_release_all+0x55/0xf0
 [<60023384>] ? warn_slowpath_fmt+0x94/0xa1
 [<605ec9a0>] ? devres_log+0x0/0xc0
 [<605cf7af>] ? my_dev_fini+0x6f/0x80
 [<605ecb75>] ? release_nodes+0x55/0x80
 [<6069ae80>] ? mutex_lock_nested+0x0/0x20
 [<605ee3f7>] ? devres_release_all+0x97/0xf0
 [<605e68c0>] ? bus_notify+0x0/0x60
 [<60695df0>] ? mutex_unlock+0x0/0x20
 [<605e6f54>] ? device_unbind_cleanup+0x14/0xb0
 [<605e88e6>] ? device_release_driver_internal+0x266/0x2c0
 [<60669f50>] ? kobject_put+0x0/0x150
 [<602ef010>] ? sysfs_remove_file_ns+0x0/0x20
 [<605e64fd>] ? bus_remove_device+0x11d/0x1b0
 [<6069ae80>] ? mutex_lock_nested+0x0/0x20
 [<605dfc1f>] ? device_del+0x1bf/0x5f0
 [<60075330>] ? um_set_signals+0x0/0x60
 [<60075320>] ? um_get_signals+0x0/0x10
 [<606a2160>] ? _raw_spin_lock_irqsave+0x0/0xa0
 [<605e0064>] ? device_unregister+0x14/0x40
 [<60375cde>] ? kunit_remove_resource+0x8e/0xd0
 [<606a24d0>] ? _raw_spin_unlock_irqrestore+0x0/0xb0
 [<60375323>] ? kunit_cleanup+0x63/0xb0
 [<60377a70>] ? kunit_generic_run_threadfn_adapter+0x0/0x30
 [<60377a86>] ? kunit_generic_run_threadfn_adapter+0x16/0x30

> 
>>  	if (err)
>> -		return ERR_PTR(err);
>> +		return err;
>>  
>>  	err = xe_shrinker_create(xe);
>>  	if (err)
>> -		return ERR_PTR(err);
>> +		return err;
>>  
>>  	xe->atomic_svm_timeslice_ms = 5;
>>  	xe->min_run_period_lr_ms = 5;
>>  
>>  	err = xe_irq_init(xe);
>>  	if (err)
>> -		return ERR_PTR(err);
>> +		return err;
>>  
>>  	xe_validation_device_init(&xe->val);
>>  
>> @@ -536,7 +554,7 @@ struct xe_device *xe_device_create(struct pci_dev *pdev)
>>  
>>  	err = xe_pagemap_shrinker_create(xe);
>>  	if (err)
>> -		return ERR_PTR(err);
>> +		return err;
>>  
>>  	xa_init_flags(&xe->usm.asid_to_vm, XA_FLAGS_ALLOC);
>>  
>> @@ -555,7 +573,7 @@ struct xe_device *xe_device_create(struct pci_dev *pdev)
>>  
>>  	err = xe_bo_pinned_init(xe);
>>  	if (err)
>> -		return ERR_PTR(err);
>> +		return err;
>>  
>>  	xe->preempt_fence_wq = alloc_ordered_workqueue("xe-preempt-fence-wq",
>>  						       WQ_MEM_RECLAIM);
>> @@ -569,16 +587,15 @@ struct xe_device *xe_device_create(struct pci_dev *pdev)
>>  		 * drmm_add_action_or_reset register above
>>  		 */
>>  		drm_err(&xe->drm, "Failed to allocate xe workqueues\n");
>> -		return ERR_PTR(-ENOMEM);
>> +		return -ENOMEM;
>>  	}
>>  
>>  	err = drmm_mutex_init(&xe->drm, &xe->pmt.lock);
>>  	if (err)
>> -		return ERR_PTR(err);
>> +		return err;
>>  
>> -	return xe;
>> +	return 0;
>>  }
>> -ALLOW_ERROR_INJECTION(xe_device_create, ERRNO); /* See xe_pci_probe() */
> 
> So, there are things allocated/initialized in xe_device_create() that
> get deallocated/finalized in xe_device_destroy().  With this change, we
> now have things extracted out of xe_device_create() into
> xe_device_init_early(), and it appears that xe_device_destroy() is now
> really the counterpart of the latter than the former.
> 
> I think we should just call the function xe_device_init() and then
> rename xe_device_destroy() to xe_device_fini().

there is yet another small pending series that introduces drmm_alloc_workqueue
and after that converts all WQ initializations into self-contained statements

didn't include here, as it touches include/drm so can be done in its own pace

but with that xe_device_destroy (which should never be called that way)
will be greatly reduced, and even possibly completely removed after moving
registration of some cleanup steps to xe_bo_dev_init and/or ttm_init

> 
>>  
>>  static bool xe_driver_flr_disabled(struct xe_device *xe)
>>  {
>> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
>> index 27cd2329b99f..975768a6a9c8 100644
>> --- a/drivers/gpu/drm/xe/xe_device.h
>> +++ b/drivers/gpu/drm/xe/xe_device.h
>> @@ -44,6 +44,7 @@ static inline struct xe_device *ttm_to_xe_device(struct ttm_device *ttm)
>>  }
>>  
>>  struct xe_device *xe_device_create(struct pci_dev *pdev);
>> +int xe_device_init_early(struct xe_device *xe);
> 
> Right now we do not have any external users for this function.  We could
> keep it static until we get to use them in kunit.

my kunit series just got too big so I've started posting smaller chunks
don't really want to go into static/public noise just for few days delay
between series

> 
> That said, I think it would also make sense to separate it completely
> from xe_device_create(), i.e., have xe_pci.c call the two functions
> instead of xe_device_init_early() being implicitly called by
> xe_device_create().  I think that would be more alligned with the
> function names.

hmm, maybe

but that would likely require also extracting call to

	aperture_remove_conflicting_pci_devices

and I'm not ready for that

so IMO it's better to keep "xe_device_create()" as "Allocate and initialize"
as we have now in the kernel-doc ;)

> 
> --
> Gustavo Sousa
> 
>>  int xe_device_probe_early(struct xe_device *xe);
>>  int xe_device_probe(struct xe_device *xe);
>>  void xe_device_remove(struct xe_device *xe);
>> -- 
>> 2.47.1

