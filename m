Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC7B4F45A0A
	for <intel-xe@archiver.kernel.org>; Fri, 10 Apr 2026 20:25:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B66010E066;
	Fri, 10 Apr 2026 20:25:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="esFO3axR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4D0010E066
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Apr 2026 20:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775852700; x=1807388700;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XeYaApf4/ZH6nEXEU/IxSqOsw2zaGw7ukWAWryrnh4I=;
 b=esFO3axRIzFEfh7Bq7MDX2/bh35S6trCYy4M2RpNjEZtmoabTJA+8GtB
 wcsrebu+Xy1boI8Tu6w6spjoDAvFwZLumgFJM8f5SEUrEm1AmmBN0lY2t
 eEuLF6AP2+f7UAIGQNX9Mqu6zeTAnz5rpdpywdW3UUogX2DZv0h8okrtX
 F0NgZyXWZFrt0AXxfFMtUHwq/M02S6QzHD48pfhCG5ykovwk+uDynR5xz
 pUzZCaF+opyT8KHaxTVo02s2laALclny2WxYwP/EWn76siTLfITD9dFWi
 VGJ/YVmIrYyWfEFrZPIBPqwbmDq2xRiXZWnwU3y9wl6juU6YxTW8CBezG Q==;
X-CSE-ConnectionGUID: rB+EpaDyRleiX2B6fM19pA==
X-CSE-MsgGUID: 5h5N0WmBRoCOPtqLlOgqXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="87578432"
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; d="scan'208";a="87578432"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2026 13:24:59 -0700
X-CSE-ConnectionGUID: BdYyvECQRemqr9W948AcyA==
X-CSE-MsgGUID: pvwnwPL2RiCItFuAt3w+GQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; d="scan'208";a="233250406"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2026 13:24:59 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 10 Apr 2026 13:24:58 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 10 Apr 2026 13:24:58 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.17) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 10 Apr 2026 13:24:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xlz5SVfvoVB5nrj74m8QUTwDhb5ZOKX7MWDR5r7UgRWz/hvczxbu7UEZ+RtImU58q1DEfBH41fl8se+gPwcoTdCPi2lOzKNd4b8ll8OhewjNCaOlB2b9mixd9andiH8GcU1TWpZajcKpeIw9OnxuQuLFBWS825xFuGkKAi7nG9Nsnn3QGwlke/GiG69eovkmDHmjHjIk4Cf2aFyC77NWqLkSAql/0qo8hKFaGIEWXQyYp00pJ/EZpzhZwMFcWqaY7yRa66UYwJUcHk3wCHkp5aq+F8ne0Q/Tw5TETlOIOrOxmAFTWGSW1AQzpnHkwQN3Fh6Ym0Dc15/lp33sNFGvWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KJHEimhJwIi3CI5ubLc/1WBe2E16UtnTt9MjRl0RXQQ=;
 b=XO22DXQx6c3holDTDZaYv8Zixk/HybosODnaajWDH2Z1fsjyHoXRQ2TST60eRDuplxD58DmWpRlIRCGUWJUecN14gveCo2v+dG/Yy8Lq0XURDh2NY9SoXWpH9VqbXKYck1qPAJS3IV8RHEXfJlMR/k9rhRL0txwaTHx+4Kgg4XiKBFU4bjAaAnTv3GI4zVuOcRmkx3TRYo1WNobV8uVlJ3+1Es9ap/3LG2HGUk7r5salo2jCZIG0XYnsv3xAsAT0LNgQgizosc/pWedKQ66xE6XEPIuJ9SelYx0fVKaHcwwRhQTb0hbWwxRGwyngURIVSOk5zw4cememw64itW7rmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by SN7PR11MB6948.namprd11.prod.outlook.com (2603:10b6:806:2ab::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.46; Fri, 10 Apr
 2026 20:24:55 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%5]) with mapi id 15.20.9791.032; Fri, 10 Apr 2026
 20:24:55 +0000
Message-ID: <9f7f7a35-74d4-419e-8369-8c9aba24152d@intel.com>
Date: Fri, 10 Apr 2026 13:24:53 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] Reapply "topic/for-xe-CI: drm/xe/cri: Define GuC
 firmware for CRI"
To: Julia Filipchuk <julia.filipchuk@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20260406211759.817577-9-julia.filipchuk@intel.com>
 <20260406211759.817577-15-julia.filipchuk@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20260406211759.817577-15-julia.filipchuk@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR10CA0013.namprd10.prod.outlook.com
 (2603:10b6:a03:255::18) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|SN7PR11MB6948:EE_
X-MS-Office365-Filtering-Correlation-Id: 5418e4df-a322-4013-b62e-08de973f3a60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: /d1FIMjCUX8n/2vz1TDbYi2NoFI3y1Wg8ztdqyOYdnEZ1N68+pQ3TYIWBkTDXwLldgmAVPPO7QZBNCssxmIug5grebfSme7SniznUP+YIjEI5VeO9ZRmEfa+GYaHwMXMrqI4ekQ43jrRRKlIDf8OkpGn551JrzFc/SBXddMZGDJcPYU1YhfUVayW7DFdqp17vFoaawng8CjlO86KzhqK2QNkznjsDeBOE9+yExybxrAc3mFlnk/NTNA+q4dklCE29VOuKiPfAyftDPSxiwG56j5Q6bM3RAIjN11uSz+VXCnsoyodiOVj0vFFTMfbMhz8foxnEVIkuLhS2oCAVqwqCVdRfTv/n3rFipBD69RrenmMlMXFLhgpVi6nWtZuGPvaCMETg8GtxNoNZyxTBDxOTiM+9p+gFXBe8jxbv+OrytgCxDXpCMkOE2hpUhQiRLHYe8ZDQfqVATbnR9PzDzJ2h9tRkO8+U0GV2OZ79Ttks09ZUJ5nNaz5BKDivceVHpHHvbYhTIGTPKYBaWzw7syG5RY6vyGJf0vYjzevhiIryU4JS2Li0uaK4jpHCzY6MFUh/r4I8Wy7VZ6molsC1qihGcCVuI2ZVmYKd3ofPSmUjEkb3FtTBsRBxSr9Tn9IHRkNfzNP3gV7WyOq4ou1R6Ik6eJJT/2zVtevPVMTjuCVjVJDCaJ9BI1cDGLUqx/8lmXe2r7Zg/D0fCP65yGnA1WBemezP0ug+8AsxLvtardGIGc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NnorcUp0SGVGc2FwMEVTNkZGNG5zd3hyck9pbDBXaWtUYXRETlE2Wk5xNDlW?=
 =?utf-8?B?M3ZPV09pNVQ0b3cyTHpuY0hCYnl0YncyVmpkMXVySXZycjBOMzBaWURwRW9C?=
 =?utf-8?B?T0x0TnliWk1mL1VmTFNLOENIWGp4a2Y2elVDSStIOUVpb0JsRzFFV3I1THFX?=
 =?utf-8?B?bCtPVGx0RWtzZVNQWUFHRlFmZEZGM0JHdkNvRHNzeHE3WFZkMDFMUHdveHBD?=
 =?utf-8?B?Ym1GYTRremZodkJiZVpuOUkvZUh4UmxCYmczREtHNENWeklTYlBuUGdyby9r?=
 =?utf-8?B?MnZBcnZVVkJLOTIxWW9nVUpjekExL0lhSzNJL0VoNHJ4WnBjUzFyKzlPTFRm?=
 =?utf-8?B?Q3B2SXpvVFpYTjltL1pVTkx0NEw5R3pOZGhoOVEreFRmZ2p2K3BQbjIrbVpX?=
 =?utf-8?B?YUFzdWNoclgwOCtDNitiTXRlbzRneFVCM1RDb3hvN2Q4SW1iQ2xmSDFuOEFy?=
 =?utf-8?B?OSsyQkJmeTZNZit1a21ralJjYlNJQWdBWEhjTGhGd21zQlRBb3RYcWs5MFND?=
 =?utf-8?B?NG1BbEY3dFZ1K2VGQXFVZ2l6SGFReFA2SVo2eUhwME1ITWl1clhYaHNQTWUw?=
 =?utf-8?B?dUtOTU9LbHBGT3lFdDJqUG83NHIyQkRUcmhLY2dhZXgvamd4QUd6NDk4RWRE?=
 =?utf-8?B?RHlmeDNFd2UrWDVvUUtiRjRyYS9vWVFHMkhSdmJmZnhKOFhBaDJsanZoaG5D?=
 =?utf-8?B?am1CY01JaTlsVjI1VXcrTmFUakJCVTlUNm96dG92bmVTTml4K2xURW1CY2hv?=
 =?utf-8?B?MmNBY04zWFZqcW1YcWxHU2QyMXZMMXhvZDBFY2R3aUdCb1kzUUJLTk55aDJm?=
 =?utf-8?B?RUVOZFlGRGIrQml3bkNLM1d2UzlUNWhsNmV6Z0FaQThhWml3enlTTHptdTBW?=
 =?utf-8?B?VDRoVXF0KzBxS2IxeDVGcno0TkIyd2FpL1QreXFGR3lrTURzQ0p3UkFOSytI?=
 =?utf-8?B?dTg0eXdTVENQd2VuUTJObkZKVU9sNTVqcEdvRmY2ZzNzeHBMZmd0SllZbGpq?=
 =?utf-8?B?RTRNb0M3OWc1R2VsSFVXVFFPZjNDejh6MXlLRVlWNHlkMTNSWXljWnhxVlpG?=
 =?utf-8?B?MlJEdUoremF2bEdtRmVGWmF6VTJKUkFGVTZuSUl6QUU0WjZFNjVSdHkzNUpP?=
 =?utf-8?B?OUNPSjRtN0JwY0svUERNSDZHZnArU1p6bFFQL1J6cmc5WmVHbDVSOEpBWFRw?=
 =?utf-8?B?b2N5TUR1Yk1sTzFBdGVsR0JwRVhvRzMvN1VjMGpKK3V0VEphUkpuQ2sxUVBQ?=
 =?utf-8?B?Vm9jMXJmMWFXdXVxLzFTY3F2SWQzd29BRE4zSWc2aHpxUnBta2V0cFdhelV1?=
 =?utf-8?B?MjFKZHJoMTlDUzMvSWhpQW1IeFczZzRxUmR1S3gweW1jVDZFVVBUNFB1ckdq?=
 =?utf-8?B?ejNWSGgvMFBybThiaGN3Mzd3NDl3VWYwZUJRTWdUUGJibXdackxHd2cyeFZ5?=
 =?utf-8?B?WWh5NjAvWU5Dc0ZqK0twTjFRa0VVQWJoYlRaYmtNNHF4MEtEbkJxMk5xdzRU?=
 =?utf-8?B?eGFPN09QQkZZclg5ajh4RkZKaXBLaC9LMDBlell1MFQ3aUtpT0pTUjRSS21s?=
 =?utf-8?B?Wk5LRFc0MDVTcjNCckZmcEFobXcxTmo5Vk42Tlk5THhDQzJaOXE4VjVuSndy?=
 =?utf-8?B?YnFyZGYvQkZYemRMUUpUVXRrUE8rc1NLcjduNmFTelpEbHZmTjlBb1JnNGxZ?=
 =?utf-8?B?QWQyREpBZ2lSUEtaY2REaXhtQ1pzRStEa1JBdzZvei92OXQ1MWhkWW1VNmtB?=
 =?utf-8?B?aFFxQ2VoMTNvLzB2am9RTGdyNmdtb1dtWjFVSWJqL3ZCWHA2d0J0M0FTN3Z3?=
 =?utf-8?B?NnVGZnE0Mzh0Z25pZ29XOVVSekc2N3JPUWdFYXRSYW9DUU9QcGlveWNjRG5P?=
 =?utf-8?B?WVNRRXpwTG5ZSDQ2dWVESUdDb0pacFh2OVArc1VBcDJDejZzMGpLNzBGSmFu?=
 =?utf-8?B?dG5tdjVWSW42M01rY3hqM3FHdWhPY1pGVzg1R3NidUwwdlk3eklWL3E3UXlC?=
 =?utf-8?B?b1NzbC9sQ0NjcGdqanJsbUpqT0dISk1oWTlYdVUwRzB6VGcyeEMrMUo4WkNn?=
 =?utf-8?B?REF2ZzAvM0hWbDNRbUNYdG54ZDkvSTY2dEN6KzlmaDluLzlBaVZiM21rNGtD?=
 =?utf-8?B?U1lzeWFRZ0J2c2l3eTF4ZUFQZ09mcWxmWGNzVU1uRjNqQ1dEb2ZPU3IwTHZG?=
 =?utf-8?B?N3dHRHVzbU0raFI4RFl0MVlqL055UDA0dkt5UEZKUVpBRnM4THRPY2RaWGlO?=
 =?utf-8?B?RW9sZ29HSGtEK2toRzdzT0hmMG5YYmY1M3ZoTGF4UDI2K2RXaTJ5T0taZTlE?=
 =?utf-8?B?S1F2MHRyUTNIL0syVkZOdXJDcGpHaS9jSStRSEdYTFNTRDZSeXd4UmVpM2t0?=
 =?utf-8?Q?uQqL3ZkE8yNUW6K0=3D?=
X-Exchange-RoutingPolicyChecked: pN+jiDT0r7L3klufeJ6hMsxb0+QVmKsJFxxb1LcglSZ6l0S2I9Ek+gSq//7AHYQSwRfNLRX3XaiuAIyWqtplKfWs5cQLiww49uIyU3mKNLPI1fq8KO74RZTVhfApNMz3arDVM/r8jRc6BocqkKbwjDzjovpTgqFzhyI8cHP7tcCVo4OZUfFlQFmEHqcZlNOIAmxco9SdhCGDz+/qmQuo4+tY1BcsXOMZ0tiaPQ6e8fKn3ukSp81DuMFfLLj6lIC4J4BCXZcd22k4d+R40hZMQPgi08ptNyaM7nvUQeoYqQxThZvA8NMtfui8eXs5hkJNhTDBWyg4QFVKUgGiMz9jZw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5418e4df-a322-4013-b62e-08de973f3a60
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 20:24:55.2364 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H7p5jT5+yigPdTTxc5F2f2exteGNGTm6YTlZu9dZqTpTRjH2K4LFa29omKYHLjfx25dhR5iwvwObnmj83ILUZYhczPO0fzmWzl+Quppf4aA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6948
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

Same as the previous patch, this is also not a straight re-apply.

Acked-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

On 4/6/2026 2:17 PM, Julia Filipchuk wrote:
> This reverts commit 865c5dca8ec799e62aafeb3be27d87a37f8cf06e.
>
> Update CRI to use GuC v70.60.0
>
> Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_uc_fw.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> index 6709a27e664b..2b27b0678417 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> @@ -115,6 +115,7 @@ struct fw_blobs_by_type {
>   #define XE_GT_TYPE_ANY XE_GT_TYPE_UNINITIALIZED
>   
>   #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)					\
> +	fw_def(CRESCENTISLAND,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	cri,	70, 60, 0))	\
>   	fw_def(NOVALAKE_S,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	nvl,	70, 60, 0))	\
>   	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	ptl,	70, 60, 0))	\
>   	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	major_ver(xe,	guc,	bmg,	70, 60, 0))	\

