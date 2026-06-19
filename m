Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43D44CD98F2
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jun 2026 18:05:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F335C10E0E1;
	Fri, 19 Jun 2026 18:05:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gjUXWG+h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13FFB10E0E1
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Jun 2026 18:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781892329; x=1813428329;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=8Ufhd4cfRCVZQXKI4ElXk5a7m6F+uG1rPozQIxz6Zqo=;
 b=gjUXWG+heWk01Sk4k07XNG9omoTHB4JOfZghaUkg+nOXcnoMehGxJO1B
 b47t0Cam34k3Flncn98HT+L2xhQdhLomTaoMIoPZf+kcpUO6K8izu+A5c
 ivY+1Y7hQK1YbcrXip1HgIVGpH87ESxiliS48EG5HIoVSs/KfNLkhO5Co
 yZQu+J8hkoKOgBSxl6b50NWMR/sFX1py0YxRILw5hH5e1m4PA8iuLJq1y
 PgMN8WvhaJJu+FEeJORSWgvA6VSKkpei6FFFD+HqyQpIVuXl1wOSUagam
 HU0QgGsztPfvvRrMy6gsUNytUm53x/V5LtJniH2m2cfDUR1Rtj43xIsqO g==;
X-CSE-ConnectionGUID: s+lOhah/Q/it5nFN7vyy5w==
X-CSE-MsgGUID: FSl74bjsRhShrLdFrlfU0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11822"; a="93851230"
X-IronPort-AV: E=Sophos;i="6.24,213,1774335600"; d="scan'208";a="93851230"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2026 11:05:28 -0700
X-CSE-ConnectionGUID: Lu/TBp+/RBO+0hduCUSLSw==
X-CSE-MsgGUID: RL/urTjtR56vgwmUnfA5KA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,213,1774335600"; d="scan'208";a="252583075"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2026 11:05:27 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 19 Jun 2026 11:05:27 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 19 Jun 2026 11:05:27 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.53) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 19 Jun 2026 11:05:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TmPI11QzpXz6+lYELoUTz2myAQJfjYG6XqOVJygFufMTMQtLS8loWbnEVBtAZzcdqIvdvjFciDFqiOwWcwUzobdZKZm7mUISwJl0yp+40ImYvJ0rWqcZ7HpXiI7MvL0lFstYSbUtXDhVFTqfu2F8ghnSojzxs3SecAeXBjTbzGw7M9CFKdOJncmxiRyT6jX4vkX6F9AFhhFAOXhA6JVIjPYgEAPSQdnPPU0AMGyYR5HlfjQIwrZM+Ktdg6bLa1u+EmTgkFIpwfX24T1IxLqY1zbmCG/Mrcs9W/2yjkLayJ7sIS8xZqLmtG8QYPgoKBMWp8ph24QBrlwkjQ+XrvrX3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gPqn3kKwUDoR2kzT59SVNfBdwH+uYieQgn3/4Ipubi4=;
 b=HRQJssjsRCTICofbpE+9PpdDT/QdiQ4Kh0+h+e43aKTNifH8oxYojF7ldQ1+lrIEgIAFAUCBu8h33oA4SJjE7XbhBnufzg5jM0qEsw2Lm7TLJkZ3/NcL2Qq0M8DLaK9Va2FEkgtUVDo1CtM/hiK3NhIHNkJx9IzLhTIfa2cmKKYC2v5ACvrmaKB3WLUNIGWH6STlXlmlBawp0eP5Yso6LQ9r4QCIjSzoktzh4H1eSLW4BKMIJN+YbRe+T/Z1b8l1gof10tYuEfUtxUVJ1JYMNTx8xgGBB+oYAFqPo4R7vgy+nN1acUaUaAyepuobhGVqUIVB4kAGfKs6lduzQHOR9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB6266.namprd11.prod.outlook.com (2603:10b6:208:3e6::12)
 by LV1PR11MB8819.namprd11.prod.outlook.com (2603:10b6:408:2b3::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Fri, 19 Jun
 2026 18:05:24 +0000
Received: from IA1PR11MB6266.namprd11.prod.outlook.com
 ([fe80::eda2:e570:4314:8720]) by IA1PR11MB6266.namprd11.prod.outlook.com
 ([fe80::eda2:e570:4314:8720%5]) with mapi id 15.21.0113.015; Fri, 19 Jun 2026
 18:05:24 +0000
Message-ID: <1ebdeefd-2d89-4864-8bb4-d8003d317220@intel.com>
Date: Fri, 19 Jun 2026 23:35:19 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 9/9] drm/xe: Add tile_count to xe_probed_info
To: <intel-xe@lists.freedesktop.org>
References: <20260609-xe-probe-info-v1-0-21e83e188e60@intel.com>
 <20260609-xe-probe-info-v1-9-21e83e188e60@intel.com>
Content-Language: en-US
From: "Bhadane, Dnyaneshwar" <dnyaneshwar.bhadane@intel.com>
In-Reply-To: <20260609-xe-probe-info-v1-9-21e83e188e60@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0178.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1af::14) To IA1PR11MB6266.namprd11.prod.outlook.com
 (2603:10b6:208:3e6::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB6266:EE_|LV1PR11MB8819:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f46827e-1792-4498-0822-08dece2d55fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|56012099006|11063799006|4143699003|22082099003|18002099003|3023799007|6133799003;
X-Microsoft-Antispam-Message-Info: LEpQk1+4BErYGZ1UkYVZB9ljCeVE+5qOS4bRf9fgBsnF9UTnt5b7fzAxImDNtZM+veTsN3i6c5V5lL9mB78OGzC9+4AaX22jzOd36AsbLOiF/VF2NKVOLnzTWOMjJOozQW+GvxihwEwfPrXDIyT8ipqLDJz1NK+ZDE6EtxBQlpyIv5AmAQ/OJJ+Yo0o2bmx8WwkKI8faIdZXwn3L0xWVRTiAYF32N2mFJmVMAo6FCqbgH51JsBvh6yQJJlfY0x17brxD6ObBWoi/bb+38WFI/MkhcoEVVIF15FTYbDOTg/j8UD9f+B2eIQIwiciKI9ASdrOmKkBcQaVFpx/1NCvq1ceBHYwpNkT9qTvvrjEGKOPBCMvzlGrnhuVPFtjZ5MOcUL0RjQAF83jf2ryJqU7M8LEmsdC04nD6DKNzPJLNnuqih8ZKz/L8QfB1KhNV/EL2GeCs6/c5Vl/KNvaaXkPyrep24ZD2jEqWJHgH7f5pgZbJsTYWaFTpGq1Z3nrAeI5ZnFnaRpkjlZsVfmZOEbJOz5kqzLSH1tSwDwTn/Zd4cPRIFM5OXDFJYzr+t0ejAHeIZJ9QqMWqPWf6P6evyz1weZdJ4aGijbrsFW3e7sXOK0wLyKunWgSC91ZeVJr0xXCO9qkRdRhrmbVTWpo7lgOtqHOWoj+ywrhTKoUkN5FUEl4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6266.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003)(3023799007)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TVY4YXNVcmxJNnJvUlA0YnBLNHorSW50MVBDdVY4dUJlRWhLUVdxMnUxdmQy?=
 =?utf-8?B?N3hnaEhYaVYrc0ZVWTNCakxKRktJZUU2TUZJTzZ2dHF5bjIvZ09FTEg4S0x4?=
 =?utf-8?B?U2xJTE8rSUswdkg3SnBPZ3VVNzVDYmpOSEk0YWp5OEtZb2tLcisxMi9RNUh1?=
 =?utf-8?B?S2lKRFV3V3lBREQ4dWxkM2tTMy9jUWRhTUxyOFZRbjlhWVVRNE5QNExVckdY?=
 =?utf-8?B?U216eklSTHEzSlJ1YkE4bjZTd1hWNW5LNWZwZVdWMlpPTkR0VncyWXVERW8z?=
 =?utf-8?B?L2xrK2dnWE5PanNsejFhNmhRQ1Vxd2JMa2hGMG1venJ6Qks2czBTSGg0Z0xD?=
 =?utf-8?B?TUhKVU95SVY0eXJPcGM0b3hudjkrY3k2V1NvQi95dTZaQ0hsQ0NHYmE4N252?=
 =?utf-8?B?Z3BBOTZZUU1QaGpkSWE3VHZacmErWndRTmhWV2hHNi9QUnEzZXdtZndoRjVV?=
 =?utf-8?B?WDNKTHFPQlZvM1UvMTBneUZLMndJMjBDMEVzZjZseWQyeUhzdGh0UDFDZjZX?=
 =?utf-8?B?N2V1WHBKSWY4US92d25xYWw0ZEtYcGF4YkdHWHgyYndWd0ppNDFhMVFzR2Np?=
 =?utf-8?B?b3Nocm9GMVJidGtQMmpqN2xjQzhpdGpxZktTVTBDRVFKbnVkSU1hZHBqSTh0?=
 =?utf-8?B?RElmU0d4Vi9kODFNYm1xdmZiczBZQlF6UmhvU0JLSUhOWTR3WXVIUVZoclFk?=
 =?utf-8?B?b1l5YW91STBjT0liOXRycjRDanV3MFdvL2t5OXdiNk9SOU5TTFdFQzZlcEdk?=
 =?utf-8?B?VzV1cmZzdGl6QWVBMmZzMXl5c055OXJLM25yRWN1d3ViRWFIMEZRWTFneHdq?=
 =?utf-8?B?OHVyWU9UcFkrSE90ZGd6SEl4cEVvRUo0R29JelozUnJ5R08yTXVzZENsTWtQ?=
 =?utf-8?B?Qzc4REt3em5CeitINzRjdzI1b1ZtZmFnYnBOd1VFS21yZ3BlTVlxb0Y0MWtE?=
 =?utf-8?B?bThBUEE3OXNGN3JEK1Z4TlA1WUMxVTRaTWVDaWVHS3VranpHekRZSUQxNVRo?=
 =?utf-8?B?RlJYMUQ4NkVKdHpKaEdFbWF1TVpKNXFaaGE4KzNiMFl6a1NhK3RQRVRIcnlx?=
 =?utf-8?B?V2VmMUdVTW9WenlJcnNpY2wvYkNzb3BFQ3p0OGowNnF3MTF0TEwvZEcva0c0?=
 =?utf-8?B?SzBXVDllSE9BWm5GQnlPaU00S2k1Mzd2YmR2K3p3Rldtbyt0U0RPWXpyanJj?=
 =?utf-8?B?dTB6V1JrNExnZmtVb1M3cW5iMm0zZGd2RlJsSjRCYTkyZDQwcXNkcHFhVFZO?=
 =?utf-8?B?c09rOE84QkNVd1o0SE8yWWJEOUQ5SStMOTdaNGNZb3g3K1NHWTI2L0ZMT1o2?=
 =?utf-8?B?bEZsTGZZdEVnZTd5bHFFSVdlc2hLWGljaWQrTkx1UkJJSmpNQkRXekF2Ynky?=
 =?utf-8?B?MjRRc2UyY00rMDMyWkNJQVN3ZE9xMUYxc2YwWXpCLzFnRjFrQUdlZ08wZ0Nl?=
 =?utf-8?B?a0pFTUZrVGc2R1Z6ak1mRm04akZsQWdHdkpWNGI1YjNhcFVhczZIRWhyelBB?=
 =?utf-8?B?c0h4dllPRUNmajRUV3p2VGpHVUpLQnl3NFpkcWtlQzRkZ1czRUhVYlIyK2xL?=
 =?utf-8?B?bHNoTUxIVmZVbWh3eHY4c3hIc1RwZm9LSmdyL3Q1LzZacy9LUE5wQVBpYm1X?=
 =?utf-8?B?ZGl1Mlc5Y1dtalVoYzYxdDdLVGJUa2c2b3laMElOcGM0RmpKSWRDcHJ1RjRJ?=
 =?utf-8?B?Z21iNno3MVJsN3k5WU94cDdaaDZveUJuOFdwMWRxZjMzVHVKL015RjhaVjZt?=
 =?utf-8?B?czcza25uNWxRdEYyQmF3N1U5Mkpkek0zZVRvdzBtWWhXNFVYUTg0aksxVjdS?=
 =?utf-8?B?ekQzUFBzQnZGemx2V2JtUElBOThGSWEwTVBxMHZZVi9SVkM1SHZUajNtT21k?=
 =?utf-8?B?MHE5cUxzTG1SZkRZTjRlT0tkbFJNcmpLeURtaS9ZOXpkQ0d5NWI4bmJDajRn?=
 =?utf-8?B?U1Q5MGRRUDh3WnVjbjhBbHA5TU8zMnRZai9VeXM0cnAwdmhjelJvQWZUNE43?=
 =?utf-8?B?VUpBV0c0TU05c3FRSlZHZDhsYVdzOFJXRTVQSXdSZnp1ZitGSVFLYU8vOWlX?=
 =?utf-8?B?MHN3QzlIeDFxODQ5TS9YTFVyQkQ4ZjRER1gxTlg5d245enppUzhycVgxZXlr?=
 =?utf-8?B?clJKcDFCa0RTWk16YS9BNVFaV2JrNmhsRXA1TFZjSlBEaUtrWFUxSjVveHJX?=
 =?utf-8?B?MVVVYTNOWkh0bFYrbWF3c3N5REFtb2NIUC9ZMXVxZzFQaHhGS1I4K2lNNGhC?=
 =?utf-8?B?TUt0MEx2eXZ2RFZzbVJLWHlDbHNnTEE3aGRkajlGMWNJZ3ZlLzhiUkFUd1Fr?=
 =?utf-8?B?M1c5VThvNEVVQ096dWY5VFRFZkorTUlPU3p1eVdaNTVYb3hwVzJIZ2FKekRu?=
 =?utf-8?Q?x9zWYXUa34k5snng=3D?=
X-Exchange-RoutingPolicyChecked: L6elv0d0Eiq2oKsMzd3FEuXMbnXOtR096aEA1Ox+LNl1R+NhtE5QTY7GXXzRwf8fbhNEnKRR51fglQFdzFeclk5KdSp0vmIL4Fa4Qh718X1JyFena9/1vnaVoIjhL9eZTiPJ+W/QS1bMwbh53jCfqlzbY/ha/XqoBfgZ+lO//oFOF/FOTvRO1fFh1SE6mbEdgOGanyaap8nKbnVY/UPYoJ64QhW8IskrI/A15kjQq6phuga9Y8YssUoTkK84VA+02y64tHlq9yqjCzIVdrkSL2KNNGvYzbIHU3Rczu7TMZDQtHJws+2/V0vgffmK1/NAB2pJxf4rNg/433ybapE1xw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f46827e-1792-4498-0822-08dece2d55fc
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6266.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 18:05:24.7659 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /T/u57GHLNjgWixmDVH/S8/KiLVr96/+Xh1P3fqgejGkd9fd+rNgL8Y0rdDbGtxMJpbqCW7teKIMqtousYuxTrwRfY1TgAF+ci2X8AOtsPM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR11MB8819
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



On 10-Jun-26 1:47 AM, Gustavo Sousa wrote:
> On multi-tile platforms, we need to probe the hardware for the number
> of tiles that are present in the platform.  That means that we should
> do that as part of xe_probe_info() instead of xe_info_init().  Do
> that.
> 
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>

LGTM,
Reviewed-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>

> ---
>   drivers/gpu/drm/xe/tests/xe_pci.c | 11 ++---------
>   drivers/gpu/drm/xe/xe_pci.c       | 27 +++++++++++++--------------
>   2 files changed, 15 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
> index 31ec41aa997d..8df9029afcd3 100644
> --- a/drivers/gpu/drm/xe/tests/xe_pci.c
> +++ b/drivers/gpu/drm/xe/tests/xe_pci.c
> @@ -311,17 +311,13 @@ const void *xe_pci_id_gen_param(struct kunit *test, const void *prev, char *desc
>   }
>   EXPORT_SYMBOL_IF_KUNIT(xe_pci_id_gen_param);
>   
> -static void fake_xe_info_probe_tile_count(struct xe_device *xe,
> -					  const struct xe_device_desc *desc)
> -{
> -	xe->info.tile_count = 1 + desc->max_remote_tiles;
> -}
> -
>   static int fake_probe_info(struct xe_device *xe,
>   			   const struct xe_device_desc *desc,
>   			   struct xe_pci_fake_data *data,
>   			   struct xe_probed_info *probed_info)
>   {
> +	probed_info->tile_count = 1 + desc->max_remote_tiles;
> +
>   	if (!data || desc->pre_gmdid_graphics_ip) {
>   		probed_info->graphics_ip = desc->pre_gmdid_graphics_ip;
>   		probed_info->media_ip = desc->pre_gmdid_media_ip;
> @@ -382,9 +378,6 @@ int xe_pci_fake_device_init(struct xe_device *xe)
>   	xe->sriov.__mode = data && data->sriov_mode ?
>   			   data->sriov_mode : XE_SRIOV_MODE_NONE;
>   
> -	kunit_activate_static_stub(test, xe_info_probe_tile_count,
> -				   fake_xe_info_probe_tile_count);
> -
>   	err = fake_probe_info(xe, desc, data, &probed_info);
>   	if (err)
>   		return err;
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 6b2daad87316..1b5df4384689 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -728,6 +728,7 @@ static int handle_gmdid(struct xe_device *xe,
>   struct xe_probed_info {
>   	u16 devid;
>   	u8 revid;
> +	u8 tile_count;
>   	struct xe_step_info step;
>   	const struct xe_ip *graphics_ip;
>   	const struct xe_ip *media_ip;
> @@ -819,25 +820,21 @@ static int xe_info_init_early(struct xe_device *xe,
>   	return 0;
>   }
>   
> -/*
> - * Possibly override number of tile based on configuration register.
> - */
> -static void xe_info_probe_tile_count(struct xe_device *xe,
> -				     const struct xe_device_desc *desc)
> +static void xe_probe_tile_count(struct xe_device *xe,
> +				const struct xe_device_desc *desc,
> +				struct xe_probed_info *probed_info)
>   {
>   	struct xe_mmio *mmio;
>   	u8 tile_count;
>   	u32 mtcfg;
>   
> -	KUNIT_STATIC_STUB_REDIRECT(xe_info_probe_tile_count, xe, desc);
> -
> -	xe->info.tile_count = 1 + desc->max_remote_tiles;
> +	probed_info->tile_count = 1 + desc->max_remote_tiles;
>   
>   	/*
>   	 * Probe for tile count only for platforms that support multiple
>   	 * tiles.
>   	 */
> -	if (xe->info.tile_count == 1)
> +	if (probed_info->tile_count == 1)
>   		return;
>   
>   	mmio = xe_root_tile_mmio(xe);
> @@ -850,10 +847,10 @@ static void xe_info_probe_tile_count(struct xe_device *xe,
>   	mtcfg = xe_mmio_read32(mmio, XEHP_MTCFG_ADDR);
>   	tile_count = REG_FIELD_GET(TILE_COUNT, mtcfg) + 1;
>   
> -	if (tile_count < xe->info.tile_count) {
> +	if (tile_count < probed_info->tile_count) {
>   		drm_info(&xe->drm, "tile_count: %d, reduced_tile_count %d\n",
> -			 xe->info.tile_count, tile_count);
> -		xe->info.tile_count = tile_count;
> +			 probed_info->tile_count, tile_count);
> +		probed_info->tile_count = tile_count;
>   	}
>   }
>   
> @@ -975,6 +972,8 @@ static int xe_probe_info(struct xe_device *xe,
>   {
>   	int err;
>   
> +	xe_probe_tile_count(xe, desc, probed_info);
> +
>   	err = xe_probe_ips(xe, desc, probed_info);
>   	if (err)
>   		return err;
> @@ -1002,6 +1001,8 @@ static int xe_info_init(struct xe_device *xe,
>   
>   	graphics_ip = probed_info->graphics_ip;
>   	media_ip = probed_info->media_ip;
> +
> +	xe->info.tile_count = probed_info->tile_count;
>   	xe->info.step.basedie = probed_info->step.basedie;
>   	xe->info.step.graphics = probed_info->step.graphics;
>   	xe->info.step.media = probed_info->step.media;
> @@ -1037,8 +1038,6 @@ static int xe_info_init(struct xe_device *xe,
>   		xe->info.has_soc_remapper_telem = 0;
>   	}
>   
> -	xe_info_probe_tile_count(xe, desc);
> -
>   	for_each_remote_tile(tile, xe, id) {
>   		int err;
>   
> 

