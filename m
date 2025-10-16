Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C203ECCD183
	for <intel-xe@archiver.kernel.org>; Thu, 16 Oct 2025 10:55:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8442110E9B8;
	Thu, 16 Oct 2025 10:55:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gQgJDE89";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A49810E9B7
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Oct 2025 10:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760612145; x=1792148145;
 h=message-id:date:subject:to:references:from:cc:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=j9LmDIfTy3u+N3I2jdnxUd2lUV/kqo/TW71tQEL+5jg=;
 b=gQgJDE894hqbxlFjB0NuKH4TOHEm4Cf66iMwm8qoO9ouMSQxiptpSSzJ
 6knYuTziW8pIbHvhPq/9iuakvuQF4UF6mBFAQSnN0aB2a4pVgzeFzKgwW
 TBOVJV5fgWR+RO0zU1PdfUOmVZYkBG3AHVSUcxSK1nlub3oPUnyqwtfM+
 9DAzXDm0HzOlcl756G+GhsyV/UcE9qkAmie/24XRpchNaY6XOv2frUy7V
 9BNymDgCdHVRAZ/JMnGbijGueAxpQvD67Cm1c4SRR4k6rcPL2dmlZdxrx
 IGr2XX461kdbD+js1l4nY/jp7dsuDhynm5mV/jFOTfHYR8YZtBKY6r7ns A==;
X-CSE-ConnectionGUID: z5YS9V+GTrWvSqpmgqT31Q==
X-CSE-MsgGUID: YoI9DjEQS9+5I5p0YVPneA==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="62010318"
X-IronPort-AV: E=Sophos;i="6.19,233,1754982000"; d="scan'208";a="62010318"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 03:55:45 -0700
X-CSE-ConnectionGUID: Un4NrmElTCywKnz2MHkVMw==
X-CSE-MsgGUID: pSj+ijrfRqqyh10KNA2/mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,233,1754982000"; d="scan'208";a="186438089"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 03:55:45 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 03:55:43 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 16 Oct 2025 03:55:43 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.66)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 03:55:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ShX1rTE1yn4LJVlx/Dy14Ig1aP3l0bm64wV5sp7vKSeDFXtpSaN3wr/ztJ1O90mmJq1fQ21uJ7imx+4t30YufDgmo0UcByhj4XeNTqHP7gzuZj5MYaCeU8RHovPVdERhCLDO/RGzlIt9qIci00NcFfEdHcZu1f34CKCyLHw/7B8k0K9O2gg+E5AtN2WCEBX0dGFyC5FxosyCnW/G0ta5AwMDc4HBG+HncMMyJVU4XM7VE2M0mWb2M+K1CnH/cETY5lbAmhgNn3jhsvej4FyQmEV+OpLi2IJ03cn1Il71kan+UIp1I2aMmNaApQeu16GvR3Ek/pRiuOWNm7kk3ywUYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BFT1QeqvtdMXqtccXSFjGdzz2O2sBtMoMXQ5xgfLJQA=;
 b=WgCqoj07TGC2ZPMiJ6eczd5vssAP005cfkNBdcygSgTE2NdNc7hmSrYPPvfXMKWFDN1pVJoJjln1hlRjL54EVzNpceHq5kLqRREfMOf1QFqXNL7zYmCesHISyfeY8Z51JZ5oMOCy4qE6q3ISw9C8wD4JlTJbNY5BovAh7nhC9yTmBHCwEPS1zCI/JGz7s4MctqXZoJtxewSnMEqQs64f0eeTlHWoAR9aGV1q8L4Rd+mWnu9/NUqC39RqWZkjgh7naXnAJiRWceO0s1GBn9TJ+KqwxyOoPUPUUlxgaphL2PCdA9qzIJOjb+3xGbq6HR/cY/1IG59H1gj24uFm30uUcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by CH0PR11MB8215.namprd11.prod.outlook.com (2603:10b6:610:182::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Thu, 16 Oct
 2025 10:55:41 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9228.011; Thu, 16 Oct 2025
 10:55:41 +0000
Message-ID: <2e239734-4b93-4beb-9d6e-ffe688ec10bc@intel.com>
Date: Thu, 16 Oct 2025 12:55:37 +0200
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5GdWxsOiBmYWlsdXJlIGZvciBQRjogVXBkYXRl?=
 =?UTF-8?Q?_auto-provisioning?=
To: <intel-xe@lists.freedesktop.org>
References: <20251015091211.592-1-michal.wajdeczko@intel.com>
 <176056635246.19067.3887030686772278274@97596180aaec>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <176056635246.19067.3887030686772278274@97596180aaec>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0068.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:26::9) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|CH0PR11MB8215:EE_
X-MS-Office365-Filtering-Correlation-Id: c876ec1b-fd94-4076-d31c-08de0ca28c31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|366016|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S0dsbk5WcWJlN0Vkc1ZjM0ViYllzdkt0dFM0c3IvWDM0QWJ0UU9PeXlWd2Nq?=
 =?utf-8?B?U0N5czBOc3ZBb1loSFB0ZzMvcXl6MGk5Q3UrekFDbGxjaGNscmpiS0xmVlcr?=
 =?utf-8?B?VFRvSGF3RmdUS0hCOURXTnZSb2hwZ3pqTXpnT2pHYy93b2g4ZTl0MkNCSGhn?=
 =?utf-8?B?YWNmMHZNYUsrekJlVnBwR3pSaG52WnQ0VTdIcmZiVWl1RTMrUGxhQUNuOUs0?=
 =?utf-8?B?RkVwanZ6UktVem9YWFlUSHM1WFl1S0JHdFJWM2FPTHJ5NXh0V1p0UTUvMGJt?=
 =?utf-8?B?SEtGa2pwQ21KRlF4THQwdUVXSVkydFJCUjlYeEJMazZQT0wxbmpkQmk1c0RJ?=
 =?utf-8?B?RzRBUG9BV1c4RERJQVpLZ294QUltTDlCUjkxc0JobTl0elM3cld4Z1dLeXh2?=
 =?utf-8?B?bnZhSkZ4N2NaK2NJYWsyNDBLMlVBUFZIbit0cVVzdElQbjJXQWRXS084Ui9q?=
 =?utf-8?B?NzdHTXlMRXNGejBndFl6Wno0a2NDTWlJdndaS0FOWk9abWlGTkxHRnR5MUU3?=
 =?utf-8?B?dU9MVkVyNkhjUVhoMC9rQzlBbkRLa3V0QmxrdVpjNGpuMGtzYkgxS1hJbldN?=
 =?utf-8?B?MVZ6WEo5WUVnR3J5LzVUbWp5d09iL3ljZDQ2WnlKRlorWXpxd0QrYlVSMFky?=
 =?utf-8?B?QzkvUWlIYlo0eitCWUVqZFdDbU1IWjZteGFoWVpPaTYvVjRZaXZFbEtEMXFt?=
 =?utf-8?B?dEZTcGg5VUpHZmZWNnBpN1MvWkdyTmY1RXJodTNBWmxFZHV3dUdnYkgwVVhU?=
 =?utf-8?B?OUxDblQ4S2plRnQzb3IybFRnRThSODhjWm5NeFFxcWlkNzU0NnV6NEhkTVhk?=
 =?utf-8?B?MWV4MTlhQis1Q1VLTFJSSlY0T0ZxWW1adTNtVE5PdEI1SDFJajF3aGdISDRX?=
 =?utf-8?B?anUrbGY4ZUhTTzl0Y2FBSFNsSnhsMlBhN0tORTRka0MzdVFuWklrV1dkM2lG?=
 =?utf-8?B?bnZsejZhOVlyQk1zY3R1bHp4K0s1SG9MOVdtYmJHVmpPdk1Vb0lKQ0NoZkpS?=
 =?utf-8?B?ZDB2and0aStCU1FJNTY1UnRZdjVvbXdUbkU0dWR0bzZqUVN5L1dVZ1dDNWIw?=
 =?utf-8?B?SW5GTHkwMnlOYW5jelVtdy9BRnE1L1pPc1hnN1NXZ2dwK0c1aEpZK29MREJt?=
 =?utf-8?B?L1FJbndXRDJ0d3pER2Joa0VCbHR3c0VJSlhTUTFkNklId2x6WTN1VG1GK3ZZ?=
 =?utf-8?B?dktuYnZaaFF2WWJsYmNCVzJZdVpLWDJRVjNMZXpzTno3b2VXbk5ZSWhIUFhD?=
 =?utf-8?B?UnhMNDI2eU9rQXpFU2lsd0RIbkcvdTlVUmNoMzlhdE1jUUV1OFlVZkRFdzBX?=
 =?utf-8?B?eWhJdUR2TDJtSG8rYW12dWQzVWZ6dWNJdUdMK0RZdGRTLzRTSEtQWEczSkxz?=
 =?utf-8?B?MDlBNGhDSDBiV0ZpRlhOQ084Qys0WWFPTzJTdG9qY2RpQVVjNzJxWGFBN1l3?=
 =?utf-8?B?bWFQV28xeXJVNmJweFJ3WlZleXVsWG1TSnBRNzBWVEMvTk9jQ3IzUGRQS0tN?=
 =?utf-8?B?cDF1WHY5SjI4ZFFpMG5BMldENERyNjBZME1JZndZMnpTdDRLZ0ZvTkZ5ekhW?=
 =?utf-8?B?Q0xpejdzVGl4TEk5MHgxb0ZiS0lOOWlsNWVQc053OG9OTktXNGplY0JTcnd6?=
 =?utf-8?B?WnlYUzZrYUh3cVE5SlZLNytBSXdXdnZBWXVGK3lqR0V6cjJxUEY1TzFTQzN0?=
 =?utf-8?B?ODR2N0c5UFk0c1d2VmxUbmVraTR0VElIOGRhWTVIR0p4OXdvTzlHZllKeTJK?=
 =?utf-8?B?NXIwelo2Tjc4SDJ5RjdyaDhPL2ltcjNXUFlBMTk1cy9XYXFFR2c2Vi9EV0xs?=
 =?utf-8?B?YzVxOS9HbC85SFEzRWlCTXh5SUFOQXR4VFVHY1F4cXorRHhRdDZ4QWxzUXFM?=
 =?utf-8?B?UXU0UnF3RGpjMklVY3FOZFptaHRRYWUzWis3U3hzU0JtMXc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z0lSbEU1dlZXbzhJVk9ITXFjRU5Xclc2MlZXcVBUSk1MZEhHd1k5MWhwK1hV?=
 =?utf-8?B?cjNKWXN6RHAxa0ZKY3RDaFFBaW8ydXVpUjlQNGFLNHBndzRqNjNtTGxHT2R6?=
 =?utf-8?B?Wk5VUlhVYkdpTEl6c090Wjd5RjhXZkdaT2lEOWJrZnJlM2VWQzdtd0ROZWZ2?=
 =?utf-8?B?Q2FORnE0SW9TVlhRMjVBRVFvL01sUzVNdkZUb3Z1b3dHNCtlbkkxcWtVWXJa?=
 =?utf-8?B?eVRLS0VtUHlhbmN6UlZMU1dRLytqVjZudFpXMkVDQUM1ZEFmeXVJcW44Vm5W?=
 =?utf-8?B?ampobUJ4VkFqRkIwblJhdWZyaDJIWEh5RVZiTWxtQThhbmltSXZyVmhTY1Zm?=
 =?utf-8?B?dERGako1WGhxZkg2TEJXRzNDZXN3ODdPd2xKdjY2cS9CS1NiZnZtenN5MFhS?=
 =?utf-8?B?SmFlWkhQMnNuVFQvQUZINXVPNjhKeHlRTHp0dklCZ0JIOUltWnY2bWMzZlkv?=
 =?utf-8?B?K0g0dHd3OVcvNE1jVXBYRkhUc251anZZa3ZMRE5ieGpSaVR4MFl6UzRMaFk0?=
 =?utf-8?B?NGpDNWZBdks2Tkk0VER4SGsxOUZRS21MVW1xK2RMcVJvaFU3b29OZ0phY3Nw?=
 =?utf-8?B?MjRKK1JGVEJOMVZWSVNLZXhQd3lWNGI5TEMxdkdsOWtBRnBCNTA5WS9tVjdo?=
 =?utf-8?B?bmpLYm1INTV3MzJpc3RSYW8vNHhvVWFjMVpieDcrREJSdW9wTHdxbVlJcFpJ?=
 =?utf-8?B?c0N6UWhCbC9XOTFNczQvczVKWlpUWXdrMmtNQmRDdjc5eDIyVEpJRTZHVU1M?=
 =?utf-8?B?WVNFRWRyZitTbHhEWWlrS1NzbkE2RjE4RmhHcVU5aVRZa0k3Ui9wLzdPUlhR?=
 =?utf-8?B?RnMxRkJXSmcwRE1UNlZhejlCYjdaSVQxaE95UUtDZENRT3hOOVFJR21BNWxP?=
 =?utf-8?B?S21icS9hS293S2NFKzgxZ01lZHBjeFpJbWRtZ3ZGaGdmRTlnMEZTMHFhejZl?=
 =?utf-8?B?ZHlXZFU3SVJBNGtKb1VqeG5vRWVpQUZXM0FrdnR2NTRvdUpEeVJ5V1Z0OFdz?=
 =?utf-8?B?WHc2WWYrRjBmVUl1WmNLMWxTL1dEUk5uQzJqVVZVejNaa3ZRRk1uOGliZjRh?=
 =?utf-8?B?L0UybllaTENvUVhrcDlNZ0U3RkIxSEE5bHpoMkUwQ09YVFRtdTVwTnJSR1ZC?=
 =?utf-8?B?dkJ1RXNtckJXdDdjQXJKbU1Ma2xUU3NLdktISDdjRjYxLzlLZFF4R2owV0lI?=
 =?utf-8?B?SUtvYng5eW4zcVdnWFp3aUFCeEdtTm9oZWtUTUtLNUVIWEZuNm1KaTZoVjZ1?=
 =?utf-8?B?T0RNNTBvZzBqd1JGUVZEUnhnNnJyNDVPa01ZS25xU3hOK0sxamhhZGhMNW10?=
 =?utf-8?B?M1c4RjVEOEtiVlVrQVdYSWNDZktwdmdIUVZEcGxZSmxEQzEvZXVxTElaNFdI?=
 =?utf-8?B?SUFQMnhIT2h4ZWtYaGliQWJZdUs4SVhEd1Yrakk1MWQxTGVRR09WTEppWXNG?=
 =?utf-8?B?WEF5Y2RpRWEzRnhIUVNjb001R0Vka2o3dDlEUkRlSFZlQXFhZ1M4R3ppTTlo?=
 =?utf-8?B?d2tTZHNoTUVaUmJHVVR0SlRPMCt1a1ZzeW5oN2RzQ2ZJYVQ4N0hEWWFZZEx1?=
 =?utf-8?B?aStOS3VYQzVTanhFZFNwOXV5dzFRZFJ1K3BVOFJCRk5nRmtUejRqMCtGTFVk?=
 =?utf-8?B?UVFpSTRzUTVwL1kvK2VGbi9xaENsM2l4dnJLTHRZVE9uTStmMjlsa3hyWVhH?=
 =?utf-8?B?ZWxmUit5amRwTmExVXNsVGRnblphYnJOVG9ON01hOFFXcXRvZEZJUnFXYTkw?=
 =?utf-8?B?M0hDVkh2ZENBaUFISndKdzQ0MG00Nzc1K1p4Ujc2RUE3NzJVdzhaOWpWWVoz?=
 =?utf-8?B?YndGcXlzVGJhSVZnOFpaV2srVTZwWDlPT2hINFc1Y3M1YzR0L3VkaUZ3TXIr?=
 =?utf-8?B?bWxMS3Y3RVVrOUVuaEFqc1NFZWtaMVNMdzJFZEszVklJZUViTkFXaTVleDl2?=
 =?utf-8?B?RDNhaUF5VFc0SitZdDdMUDk5WFp5b2VEY29wM0VZbXFjSlpDWnNPOC90WWV5?=
 =?utf-8?B?Q2djRllrS2FEMTZGekF4aGs3cm5kU0tnS0wrYks5Y3hmM1dsQmpCY1BwZ2d1?=
 =?utf-8?B?RzN2SmFOU21BV3BtaUFrRG42WG10dDBXb1E4Vk95aFRqclNJSXFMaXFoSG1G?=
 =?utf-8?B?UjR1cjZNSTJ5VGVDVWI2dnk5a2d6akFJYWloYVBtczlGZHJXdVd0THFIWEQ0?=
 =?utf-8?B?QVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c876ec1b-fd94-4076-d31c-08de0ca28c31
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 10:55:41.2082 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sKInp7ZHXwxlsn18BieeM6ljBzNSMzs6/eHeTtmIZmSiR/T+9L3ijrJ0AriHnazXxlFCVLjVPI0P31RQPOL975oIQARGtVf5u+WrUa9eWBc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8215
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



On 10/16/2025 12:12 AM, Patchwork wrote:
> *Patch Details*
> *Series:*	PF: Update auto-provisioning
> *URL:*	https://patchwork.freedesktop.org/series/155971/ <https://patchwork.freedesktop.org/series/155971/>
> *State:*	failure
> *Details:*	https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155971v1/index.html <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155971v1/index.html>
> 
> 
>   CI Bug Log - changes from xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a_FULL -> xe-pw-155971v1_FULL
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with xe-pw-155971v1_FULL absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-155971v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> 
>     Participating hosts (4 -> 4)
> 
> No changes in participating hosts
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in xe-pw-155971v1_FULL:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   *
> 
>     igt@kms_big_fb@linear-8bpp-rotate-180:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a/shard-bmg-3/igt@kms_big_fb@linear-8bpp-rotate-180.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155971v1/shard-bmg-8/igt@kms_big_fb@linear-8bpp-rotate-180.html> +22 other tests fail

unrelated

(kms_big_fb:12070) igt_fb-DEBUG: igt_create_fb_with_bo_size(width=16384, height=16384, format=C8  (0x20203843), modifier=0x0, size=0)
(kms_big_fb:12070) igt_kms-CRITICAL: Test assertion failure function kmstest_dumb_create, file ../lib/igt_kms.c:1316:
(kms_big_fb:12070) igt_kms-CRITICAL: Failed assertion: igt_ioctl((fd), ((((2U|1U) << (((0+8)+8)+14)) | ((('d')) << (0+8)) | (((0xB2)) << 0) | ((((sizeof(struct drm_mode_create_dumb)))) << ((0+8)+8)))), (&create)) == 0
(kms_big_fb:12070) igt_kms-CRITICAL: Last errno: 12, Cannot allocate memory


>   *
> 
>     igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0:
> 
>       o shard-bmg: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155971v1/shard-bmg-4/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0.html> +4 other tests fail
>   *
> 
>     igt@kms_color@legacy-gamma@pipe-a-dp-2:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a/shard-bmg-1/igt@kms_color@legacy-gamma@pipe-a-dp-2.html> -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155971v1/shard-bmg-6/igt@kms_color@legacy-gamma@pipe-a-dp-2.html>
>   *
> 
>     igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:
> 
>       o shard-adlp: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155971v1/shard-adlp-6/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html> +1 other test fail

unrelated

(kms_cursor_legacy:2966) CRITICAL: Test assertion failure function cursor_vs_flip, file ../tests/kms_cursor_legacy.c:1387:
(kms_cursor_legacy:2966) CRITICAL: Failed assertion: igt_ioctl((display->drm_fd), ((((2U|1U) << (((0+8)+8)+14)) | ((('d')) << (0+8)) | (((0xA3)) << 0) | ((((sizeof(struct drm_mode_cursor)))) << ((0+8)+8)))), (&arg[i & 1])) == 0
(kms_cursor_legacy:2966) CRITICAL: Last errno: 28, No space left on device


>   *
> 
>     igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-dp-2:
> 
>       o shard-bmg: NOTRUN -> ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155971v1/shard-bmg-3/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-dp-2.html> +1 other test abort

unrelated

<4> [462.803151] xe 0000:03:00.0: [drm] Assertion `!(bo->flags & ((((1UL))) << (19))) || !iosys_map_is_null(&bo->vmap)` failed!
platform: BATTLEMAGE subplatform: 7
graphics: Xe2_HPG 20.01 step A0
media: Xe2_HPM 13.01 step A1
<4> [462.803185] WARNING: CPU: 1 PID: 3847 at drivers/gpu/drm/xe/xe_bo_evict.c:217 xe_bo_restore_and_map_ggtt+0x22c/0x260 [xe]
<4> [462.803496] RIP: 0010:xe_bo_restore_and_map_ggtt+0x22c/0x260 [xe]
<4> [462.803633] Call Trace:
<4> [462.803635]  <TASK>
<4> [462.803648]  xe_bo_apply_to_pinned+0xdf/0x220 [xe]
<4> [462.803748]  ? __pfx_xe_bo_restore_and_map_ggtt+0x10/0x10 [xe]
<4> [462.803848]  xe_bo_restore_late+0x2d/0x130 [xe]
<4> [462.803943]  xe_pm_resume+0x21d/0x440 [xe]
<4> [462.804117]  ? pci_read_config_word+0x27/0x50
<4> [462.804126]  ? __pci_set_master+0x33/0xe0
<4> [462.804141]  xe_pci_resume+0x60/0x70 [xe]



>   *
> 
>     igt@xe_compute_preempt@compute-preempt-many-all-ram:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155971v1/shard-dg2-436/igt@xe_compute_preempt@compute-preempt-many-all-ram.html>

unrelated

<4> [388.734979] xe 0000:03:00.0: [drm] VM worker error: -12


>   *
> 
>     igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a/shard-bmg-2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html> -> DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155971v1/shard-bmg-2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html>
>   *
> 
>     igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a/shard-bmg-5/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd.html> -> ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155971v1/shard-bmg-7/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd.html> +6 other tests abort


unrelated

<1> [331.175806] BUG: kernel NULL pointer dereference, address: 0000000000000001
<1> [331.175819] #PF: supervisor read access in kernel mode
<1> [331.175824] #PF: error_code(0x0000) - not-present page
<4> [331.175857] RIP: 0010:xe_vm_insert_vma+0x1c/0x1b0 [xe]
<4> [331.176097] Call Trace:
<4> [331.176100]  <TASK>
<4> [331.176103]  ? vm_bind_ioctl_ops_create+0xa9/0x8d0 [xe]
<4> [331.176361]  ? lock_is_held_type+0xa3/0x130
<4> [331.176371]  vm_bind_ioctl_ops_parse+0x709/0xa00 [xe]
<4> [331.176541]  xe_vm_bind_ioctl+0x1103/0x1850 [xe]
<4> [331.176728]  ? __pfx_xe_vm_bind_ioctl+0x10/0x10 [xe]
<4> [331.176950]  drm_ioctl_kernel+0xb3/0x120
<4> [331.176958]  ? drm_ioctl_kernel+0xb3/0x120
<4> [331.176965]  drm_ioctl+0x2d4/0x5a0
<4> [331.176970]  ? __pfx_xe_vm_bind_ioctl+0x10/0x10 [xe]
<4> [331.177144]  ? trace_hardirqs_on+0x1e/0xd0
<4> [331.177150]  ? _raw_spin_unlock_irqrestore+0x51/0x80
<4> [331.177156]  ? __pm_runtime_resume+0x5b/0x90
<4> [331.177163]  ? xe_pm_runtime_get_ioctl+0x61/0x150 [xe]
<4> [331.177249]  xe_drm_ioctl+0x53/0x80 [xe]


>   *
> 
>     igt@xe_sriov_auto_provisioning@fair-allocation:
> 
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a/shard-adlp-2/igt@xe_sriov_auto_provisioning@fair-allocation.html> -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155971v1/shard-adlp-8/igt@xe_sriov_auto_provisioning@fair-allocation.html>

but

Test requirement not met in function __igt_unique____real_main316, file ../tests/intel/xe_sriov_auto_provisioning.c:343:
Test requirement: !(ret)
contexts_provisioned: Failed ranges check on gt0 (-34)

this is now somehow expected, as it looks that some earlier test did some tweaks in the VFs provisioning causing 'auto' mode to be disabled:

<7>[  344.422273] xe 0000:00:02.0: [drm:pf_update_policy_bool [xe]] PF: Tile0: GT0: policy key 0x8001 'sched_if_idle' updated to 'disabled'
<7>[  344.422465] xe 0000:00:02.0: [drm:xe_sriov_pf_provision_set_mode [xe]] PF: mode auto changed to custom by sched_if_idle_set [xe]

so there is no more VFs auto-unprovisioning, and some of VFs resources may remain allocated and must be explicitly released by the test

FYI: @Marcin
>   *
> 
>     igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155971v1/shard-adlp-6/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html>
> 
> 
