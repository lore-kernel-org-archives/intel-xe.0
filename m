Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79F5AF3C27D
	for <intel-xe@archiver.kernel.org>; Tue, 10 Mar 2026 09:50:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37FF010E226;
	Tue, 10 Mar 2026 09:50:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SV5Mn7Xl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF55A10E226
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Mar 2026 09:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773136212; x=1804672212;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=35Fbb09ff2eswF+HD0rh3ZE1gq5y1AHETNsNvuTcFOo=;
 b=SV5Mn7XlDTlAKFLAEOBVXFezqhSz0w8g8e9FJgRHTBJwKYGIQ7+imqA6
 vQlYReiKkJDQ1fjg2RuwMjZHLAFDLX98YB8NE+tJgKUy9KuwmOao3nCPL
 d6St/SiB+KIW1szXxUkDbSFf0zMItD4fUCRR2xtxpsQ4z3c93XvC06bYv
 znWexuOQ+cSJ7YTmslhPDnDqZNps31Vc/QgcuOHquzvagetgLK/zAqynW
 SwfUfz/i/rK/bUXgOVeJfirxKjoOWb7pWzk2zn8Lvw+9zONuQpNxiOOAW
 EEOPtnhV+hLyZyCdOy8jHY9O5PvgfjMgHnvmNWunbjmFt+3vmnFlDtifi A==;
X-CSE-ConnectionGUID: Sl3LbQngSTWWZdAeJNLtzg==
X-CSE-MsgGUID: FJL8CYnCTYKt6Uw859uVmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="84888668"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="84888668"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 02:50:11 -0700
X-CSE-ConnectionGUID: /Qr4fHU0S2WP+NzKiyakSA==
X-CSE-MsgGUID: zjVNUfmUSRuTp5Tb2+U+pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="220233220"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 02:50:11 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 10 Mar 2026 02:50:10 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 10 Mar 2026 02:50:10 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.38) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 10 Mar 2026 02:50:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gjZdD9hZhfHshj05+pPT5v2qdsoonTHpiIiAmRyjTqaU37UUJGuN4v5FdHBiWKxbIjO+AT1FGPzWfM10P9rcQj0yFGlAsFntM1Sin8JXmZdflGxjOwTDnEIxSbsWOw8QeAsgXWtaIVK2LCxiY11EJyrCmPzFUr0+siWI1McBHhYt08C4EeTSqW3zo0zcw0K6qo7u845ZAN7LRQY54KUm2uC6Fv9tTNQcDXRBRPhoCr0+fNN0E0fuSufQel4HIBrrUEs6k3f0l/uJPwqU5nBVMI9Z1bTzfqVqFPiKyCDh7Y/MJAYF9KrvB8g5XBZJnrJWVESogQY6C6vM45AhdNKEVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2D6e4xxXDdbfqx3IfMEXkSOElRd86MDOEHh1jmVt1/w=;
 b=X8WaVi6PQ/auxTWPEuJNqFzUvuQMJNDEWAF/LRCBEiI7YO1b4LMyqQRo3C/ydPdywlgjE1S5+LiAAp9BninNqdNwAAzDThCElBHTrwTqcDf8yVMEB3nx5tl+XbrtFHi7VlQIXgGCz8MUTkf0gpBKwZnEFc7BVPmoWCFWYDniOnjdCddioIlYtul1lpuIxeRSavdpvds2EOESllFutIM7XBot6FrcD3kk8zx7F4RKrwFmCxI9VcT2KF4e6/puNlColTgQFDdcqE272RBlwzw1zmfSAW9rA6UhzHV7lzw3CIv7YiEDZC0rAth26ye1ZdXWRa3Q144zSNWteHOZ/g6bKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SJ0PR11MB5895.namprd11.prod.outlook.com (2603:10b6:a03:42b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 09:50:07 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%3]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 09:50:07 +0000
Date: Tue, 10 Mar 2026 15:19:56 +0530
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <badal.nilawar@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@intel.com>,
 <riana.tauro@intel.com>, <anshuman.gupta@intel.com>,
 <matthew.d.roper@intel.com>, <michael.j.ruhl@intel.com>,
 <paul.e.luse@intel.com>, <mohamed.mansoor.v@intel.com>, <kam.nasim@intel.com>
Subject: Re: [PATCH v8 4/6] drm/xe/sysctrl: Add System Controller
 initialization
Message-ID: <aa/pREyHze/6OzCr@soc-5CG1426VCC.clients.intel.com>
References: <20260302081002.3275868-8-anoop.c.vijay@intel.com>
 <20260302081002.3275868-12-anoop.c.vijay@intel.com>
 <aa6NFdwrIkXbZoY/@soc-5CG1426VCC.clients.intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aa6NFdwrIkXbZoY/@soc-5CG1426VCC.clients.intel.com>
X-ClientProxiedBy: MA5P287CA0260.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f1::13) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SJ0PR11MB5895:EE_
X-MS-Office365-Filtering-Correlation-Id: 95ae0789-4288-4db8-a09b-08de7e8a692b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 4vxjM53lgrtLN2TkNUwp73yTbaWqpvJAS3+2H1UGfT1+zCyQPKN4XCDOcd9dOQ77eharRgS3fquDWuah3qOe7NJl5D1GQKAZEricJRlgJc6b0IyvTDembBmAx/oi0emH9iJl06ZsGXXlL9+Q+pnm9NEzDeHHNSgkw00eo6ovtJ/wuKlgYLW1I+oWWaLCkc0ogPL+H9U3HlZYngps6ez05myhy34NDbG+Zz4ZozYjk1CW1Cigwa7iOUy34ttvdezPXZJ4QMeJ1hC/ZIiMTsIkqwpUYNBneoPIBQqDoh5R/n4jg7xr40p2vkPx7z6jbbYjfMjCuUiuT7EJeQ/A1j/UBng0bAjwp3Ut8KlyTbn2COvw0PUoopJTEa5QB1RernSutHM+xGVo7NDwKTOINvk4bheKzbCLUrQ1e4M1pYxZ8Zc4N5LcBX7L+gsXivEGxpO0wDgzHSVnBplpca13j4QScdXO42PkBBy20TT73SZj5oft3Lgfh58mA4GyoNM2a89wsthV7y0A+a34h3s+XR3/a1JLypxiLiEzm3Q1W5kAVyCaIRFYP+5PXWJP3396W5vfwO2gdLKZuHUkJ14i5QyqksFZYRVclenDwcOoBEgQlwkVYG5zSN79Pzuu33Apm69eOxlDE4LQXi98zkSU5sbXUHQQbbf+v+lRS7HzuEm3kjBsA/48b+7enbyT4naT+tce0893a/fRqeCFa/dXWNT3MZghuyJyELqLtOkqUIOapTg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cEprczhvazhsNExZWWE4a0dDUDdHOUdIRGpHajdtZFh4dWpuWFJGeVM5RnQ5?=
 =?utf-8?B?M0JreHhyVEFlcmk3R290ZE40RTBkN2EwekQrbS9UMFJVbFE1VXc1ZnpzaXFM?=
 =?utf-8?B?b3FqUzhuWSs3Q09va0d5b0F4Y2pWQzBENWZ3NVlvajk0QjltU0RKUjRuaGdU?=
 =?utf-8?B?bXkvUWZUcm5pSmF6b2dWUTFza1BjRFgzMzF5a1VJVm5qeUdRUEJzZTYwditR?=
 =?utf-8?B?SlBSMUJWZksvSmQ1TUM5STdydEFpNlViWnJqVGVNOSs2L2o1U3loa2daNTBq?=
 =?utf-8?B?bGhIUUF6YWhGaUQvZ1dmaFFjYWZucjh5L0UzdUpiWThhakp0S2tNQXVzSUYx?=
 =?utf-8?B?MXVRM05SZTcxUnNrcHRrZEhnRGtDL1JvNUFLdFR5RjlLbzlvcDVTQlE2cTVV?=
 =?utf-8?B?L3RzZnNmVmQxY1NKbENySmRRbnhlcXZRWXV3cW1DUUk4YkU1SjlacEsya3Rw?=
 =?utf-8?B?YWF5anJrcGpVblBxRjlSc1hNRDBnMHV6UkhsbnRtQWtnclE2OVBLS0NjcjA2?=
 =?utf-8?B?NUJRSTFId1lUVSt3V2syeDFOU2JIdlhrZXpqbWM3L0VrUkUvbFRyWWZjb29k?=
 =?utf-8?B?azVabXNPRlRHYUxGaGVHQUNCVE5TcTNoYlpnWlFZTUNYYkZDcUZtUlJIWkZ5?=
 =?utf-8?B?eHEyVm5Xd0Q4Z0l1YW9uaUZ4S21neFd2NlBHUmE1d25QMU13K1kzUUU4enZU?=
 =?utf-8?B?WXBSM2t5dXlCSUdhSk9PTmdIa2ZsQTlmL0ZpbjFPam5xVFFDR0diUURvbUxr?=
 =?utf-8?B?VXVXQUdSVmkyTURjdlVBM0FSZlFIZHBXUnI3dE5xMGtnOUgzeURDajlPZ1RG?=
 =?utf-8?B?SUhpK3kyZFVDMFoxeUU5MUFyY3VhbTFHSEF3M1B0b0dFVzhnb2s2M2drb1N1?=
 =?utf-8?B?c1VyNHhUQUY5T255TjJqUzBBNm1FQ3cxVU1mUTdUcXpVQWhBclFyOEJzWHJ0?=
 =?utf-8?B?N281M3dvdzFIMkRKYi9MaGh4MnZMR045enF2WldDNWl3SVRFQ0dyeUVWVUQ1?=
 =?utf-8?B?L1V1bGtiVGZkbERKZTJ3WW9oSmVBR05xK3lWbkQ2czBmRFgwZHRyRHlQWGg1?=
 =?utf-8?B?T0Yzb1QxZXlTMi9qMDBwY2M3TVducXFucWFaaExGN3RNT1hBWmQyWlhwNk1s?=
 =?utf-8?B?NkZQSThWcmFsS3F2MEtUZUNWdkNnSGsvQjJRRklja0hDUXRia1BWZFA3NFlB?=
 =?utf-8?B?cXQzK2s0UXpUTFFzSVFmYThpcjBMMTE1Ky91S2NoWXUzdUcwTlhkTzhXTUFo?=
 =?utf-8?B?WUVtMmFxQWJLU0RyWnVjQUljSHVpdzdocWozb0I3bEFDUWVjbUU4azJhWUhu?=
 =?utf-8?B?ZVFvTmtNanR2Q2Z5TEFBZUNmNG8xQkpkMzVuTEszWU40Q1VFa055ZGZOYjkv?=
 =?utf-8?B?ZktLQStMVDdJMDVhWDRYMHpxQ21uODMxdlNRWXdlSXJRUnROM0dHbGJPcnds?=
 =?utf-8?B?Y29xZjFESlhUNHE2TFlmRU5ZVnNSTUp3bVRyRFRZUTc3eEJiZ2pXSFJUc0Zq?=
 =?utf-8?B?MUc0Y0RZbnBxM0ZmekcxaVVmMit5RWtnUFB2c0laMVRPdkZYdDJwanRlVmRP?=
 =?utf-8?B?OFY4WWVzaEN5THpvQ2M4emJlV2R0OGRLUmxKTnZCd2plbE52bXNrK0lEbHJ6?=
 =?utf-8?B?V2ZrZmFCc0EzRFI2USt1RGFhVGV1WkF0ZFhZcjdlcURWRWJMWURCQkkxLzZk?=
 =?utf-8?B?c2d5M1VhVFZ0ckhYcWZRWjRGa2cyWEZjcjBhbWJCYkVJakpGbGc3aVZZc3R0?=
 =?utf-8?B?QTh1MGdnWGlTRytkZXpPY2o3ZVV0R1FRMkRtblJMTU1FMG9BV0p5TnBiY01Q?=
 =?utf-8?B?RDI3WDRjSjFGSk5hWU9QTTFiTkl0WCswVGZhTEdlRGFwK1lPaWQ1VGZiZnAw?=
 =?utf-8?B?UVhHUUk0blJHV2RNc3IydHQ1ZjI4ZE44VGppdXU4ZEczc0pWTjU4Z1J4a0RW?=
 =?utf-8?B?UjVhSkxXU3hsUzBQSnRKUkZCWE40T2lPL0hwUTJSZ1RaK0hKVWRjWW0wZDJE?=
 =?utf-8?B?MThKLytiSzNiK1JpT1d6eDl3WUx5NDNIYkRORUs4U3BWSDJYTjdnNlhNRmc1?=
 =?utf-8?B?S2pEZkd0c085TnRQL28rc0VJaTcrQ2toRU5rQnRjdmkwdlRqL2JMODBGR2pH?=
 =?utf-8?B?N0ZNbHJYcnhtWnNwaEdUNklWRzJYQ0J6NlZhWXZFclQ2M29BcWFGZ2E3OVFI?=
 =?utf-8?B?ZE12aDVtY2czZC8wS1lNc0lpVXNFalV0ZTdvUHI4a1RnNWxZRXhpUm9SQi9u?=
 =?utf-8?B?eGU3MkpQTGw3WVFCdm9uM3d0czYva2FNSTJodkY0eGxxWUNGbkMzRDBBS0FO?=
 =?utf-8?B?T0IvMEJWSWZaeVNockZrV1AyL2tmUDBHTy93MEk1ODhtS0poRmhKZUNDRXhh?=
 =?utf-8?Q?gcOORNx1PXZPg2ck=3D?=
X-Exchange-RoutingPolicyChecked: eOnzLivARL/Q0igZ3+ziTCsLSTQ/c5gR470R8MKpbKVoOB/VgQVe/U05HE4xpqZLPs/38INvtPU5I/KZt6CWC5T5y/A2fbZI+fYGKrt+KGTEAnW3zDsT+ZMt96+yFvI+bhqHfSPCtfF23fGh2HQX7rzkpvcuAHjHBrfuWfRMzO+20ffhMPzrlx1z9Iffv3kZuLELiTvE0RZ/ih27XeKYj9pcYfWWKaJ6R5i+3ktjhgterw/+zXybFH7ElmGmDT7EnWFuzAQlsQxhJ+QsPtyxZulJeAl7L7zphv9mjH0ZRMXvdCoukkv3y3QxjiDnDeXNqYOaGFC++x2ccQKlrZyp2Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 95ae0789-4288-4db8-a09b-08de7e8a692b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 09:50:07.1959 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cVU2gAvyV75fznqCeo8QeHBv/UnEUi2FYNfpgAGDl/3UdOyMH1Hlv4pCOV7Sst5lBJJmy3cXeLfzrcHrrMJvuc1UqyAgGlZEs1gEzmbp+Cw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5895
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

On Mon, Mar 09, 2026 at 02:34:21PM +0530, Umesh Nerlige Ramappa wrote:
>On Mon, Mar 02, 2026 at 12:10:06AM -0800, Anoop, Vijay wrote:
>>From: Anoop Vijay <anoop.c.vijay@intel.com>
>>
>>Add initialization infrastructure for System Controller subsystem:
>>- xe_sysctrl_init() and cleanup handler
>>- Integration into xe_device_probe()
>>- Makefile build inclusion
>>
>>Initialization flow will check platform support via has_sysctrl flag and
>>configure mailbox region through SOC remapper interface
>>
>>Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
>>---
>>v8 (Matt, Michal, Shuicheng):
>>- Fixed include order
>>- Added VF check
>>- Converted runtime checks to assertions
>>- Added sc_to_xe() helper
>>- Fixed kernel-doc syntax
>>---
>>drivers/gpu/drm/xe/Makefile     |  1 +
>>drivers/gpu/drm/xe/xe_device.c  |  5 ++
>>drivers/gpu/drm/xe/xe_sysctrl.c | 82 +++++++++++++++++++++++++++++++++
>>drivers/gpu/drm/xe/xe_sysctrl.h | 21 +++++++++
>>4 files changed, 109 insertions(+)
>>create mode 100644 drivers/gpu/drm/xe/xe_sysctrl.c
>>create mode 100644 drivers/gpu/drm/xe/xe_sysctrl.h
>>
>>diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>>index ff778fb2d4ff..07e028fa50e8 100644
>>--- a/drivers/gpu/drm/xe/Makefile
>>+++ b/drivers/gpu/drm/xe/Makefile
>>@@ -122,6 +122,7 @@ xe-y += xe_bb.o \
>>	xe_step.o \
>>	xe_survivability_mode.o \
>>	xe_sync.o \
>>+	xe_sysctrl.o \
>>	xe_tile.o \
>>	xe_tile_sysfs.o \
>>	xe_tlb_inval.o \
>>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>>index 3462645ca13c..1d61bb504e9b 100644
>>--- a/drivers/gpu/drm/xe/xe_device.c
>>+++ b/drivers/gpu/drm/xe/xe_device.c
>>@@ -65,6 +65,7 @@
>>#include "xe_survivability_mode.h"
>>#include "xe_sriov.h"
>>#include "xe_svm.h"
>>+#include "xe_sysctrl.h"
>>#include "xe_tile.h"
>>#include "xe_ttm_stolen_mgr.h"
>>#include "xe_ttm_sys_mgr.h"
>>@@ -985,6 +986,10 @@ int xe_device_probe(struct xe_device *xe)
>>	if (err)
>>		goto err_unregister_display;
>>
>>+	err = xe_sysctrl_init(xe);
>>+	if (err)
>>+		goto err_unregister_display;
>>+
>>	err = xe_device_sysfs_init(xe);
>>	if (err)
>>		goto err_unregister_display;
>>diff --git a/drivers/gpu/drm/xe/xe_sysctrl.c b/drivers/gpu/drm/xe/xe_sysctrl.c
>>new file mode 100644
>>index 000000000000..2751fe25a6ff
>>--- /dev/null
>>+++ b/drivers/gpu/drm/xe/xe_sysctrl.c
>>@@ -0,0 +1,82 @@
>>+// SPDX-License-Identifier: MIT
>>+/*
>>+ * Copyright © 2026 Intel Corporation
>>+ */
>>+
>>+#include <linux/device.h>
>>+#include <linux/mutex.h>
>>+
>>+#include <drm/drm_managed.h>
>>+
>>+#include "regs/xe_sysctrl_regs.h"
>>+#include "xe_assert.h"
>>+#include "xe_device.h"
>>+#include "xe_mmio.h"
>>+#include "xe_printk.h"
>>+#include "xe_soc_remapper.h"
>>+#include "xe_sriov.h"
>>+#include "xe_sysctrl.h"
>>+#include "xe_sysctrl_mailbox.h"
>>+#include "xe_sysctrl_types.h"
>>+
>>+/**
>>+ * DOC: System Controller (sysctrl)
>>+ *
>>+ * The System Controller (sysctrl) is an embedded microcontroller in Intel GPUs
>>+ * responsible for managing various low-level platform functions. Communication
>>+ * between the driver and the System Controller occurs via a mailbox interface,
>>+ * enabling the exchange of commands and responses.
>>+ *
>>+ * This module provides initialization routines and helper functions to interact
>>+ * with the System Controller through the mailbox.
>>+ */
>>+static void sysctrl_fini(void *arg)
>>+{
>>+	struct xe_device *xe = arg;
>>+
>>+	xe->soc_remapper.set_sysctrl_region(xe, 0);
>>+}
>>+
>>+/**
>>+ * xe_sysctrl_init() - Initialize System Controller subsystem
>>+ * @xe: xe device instance
>>+ *
>>+ * Entry point for System Controller initialization, called from xe_device_probe.
>>+ * This function checks platform support and initializes the system controller.
>>+ *
>>+ * Return: 0 on success, error code on failure
>>+ */
>>+int xe_sysctrl_init(struct xe_device *xe)
>>+{
>>+	struct xe_tile *tile = xe_device_get_root_tile(xe);
>>+	struct xe_sysctrl *sc = &xe->sc;
>>+	int ret;
>>+
>>+	if (!xe->info.has_sysctrl)
>>+		return 0;
>
>I don't see a case where has_sysctrl and has_soc_remapper_sysctrl can 
>exist independently, so you could safely replace has_sysctrl with 
>has_soc_remapper_sysctrl and drop has_sysctrl. If you do that, the 
>below assert makes sense. If not, there will be a disconnect between 
>the 2 flags and that can be hard to maintain (as in has_sysctrl does 
>not imply that xe->soc_remapper.set_sysctrl_region is defined)
>
>Rest LGTM,

For now, this is fine

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

>
>Umesh
>
>
>>+
>>+	if (IS_SRIOV_VF(xe))
>>+		return 0;
>>+
>>+	xe_assert(xe, xe->soc_remapper.set_sysctrl_region);
>>+
>>+	xe->soc_remapper.set_sysctrl_region(xe, SYSCTRL_MAILBOX_INDEX);
>>+
>>+	ret = devm_add_action_or_reset(xe->drm.dev, sysctrl_fini, xe);
>>+	if (ret)
>>+		return ret;
>>+
>>+	sc->mmio = devm_kzalloc(xe->drm.dev, sizeof(*sc->mmio), GFP_KERNEL);
>>+	if (!sc->mmio)
>>+		return -ENOMEM;
>>+
>>+	xe_mmio_init(sc->mmio, tile, tile->mmio.regs, tile->mmio.regs_size);
>>+	sc->mmio->adj_offset = SYSCTRL_BASE;
>>+	sc->mmio->adj_limit = U32_MAX;
>>+
>>+	ret = drmm_mutex_init(&xe->drm, &sc->cmd_lock);
>>+	if (ret)
>>+		return ret;
>>+
>>+	return 0;
>>+}
>>diff --git a/drivers/gpu/drm/xe/xe_sysctrl.h b/drivers/gpu/drm/xe/xe_sysctrl.h
>>new file mode 100644
>>index 000000000000..d5d8735038ae
>>--- /dev/null
>>+++ b/drivers/gpu/drm/xe/xe_sysctrl.h
>>@@ -0,0 +1,21 @@
>>+/* SPDX-License-Identifier: MIT */
>>+/*
>>+ * Copyright © 2026 Intel Corporation
>>+ */
>>+
>>+#ifndef _XE_SYSCTRL_H_
>>+#define _XE_SYSCTRL_H_
>>+
>>+#include <linux/container_of.h>
>>+
>>+#include "xe_device_types.h"
>>+#include "xe_sysctrl_types.h"
>>+
>>+static inline struct xe_device *sc_to_xe(struct xe_sysctrl *sc)
>>+{
>>+	return container_of(sc, struct xe_device, sc);
>>+}
>>+
>>+int xe_sysctrl_init(struct xe_device *xe);
>>+
>>+#endif
>>-- 
>>2.43.0
>>
