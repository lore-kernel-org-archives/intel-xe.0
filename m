Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5A38C9832F
	for <intel-xe@archiver.kernel.org>; Mon, 28 Sep 2026 09:17:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A101B10E878;
	Mon, 28 Sep 2026 09:17:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BMlBRQGp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C83F010E878
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Sep 2026 09:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790587040; x=1822123040;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=U2EKM3K085P9eKrWx1z5mOCNVHu75utZEX7mwZ8+B1k=;
 b=BMlBRQGp8XJ6hzFB/icDGNxf0uj2kyFhz85CdrwCBezAA9z2WCDx80GK
 EwPiapW9oV+SXmgUXNr2C3EabcFGi0YxHtmlR5W2+HqXIY2edy4X/j+Zk
 5hU06EGoOkUj6GyD6jv8OwLCKm1Lf0L3LGENeWY06BkE54hdQ7tlRI5fV
 GZSdYeE1OzTin9BhfhQm9PQbwfqsMELH0wdNMnL4JOGxve6NvvgmlG08E
 UIs8fNDMSXrGjQ0PmrovWvZTswnEYOdxVBe9QrWJzcym70t8tJ1yRggDS
 5XhUCPwebbaJZXU09zcBGqT9sLQnDzzZO7w5yBtSVOXiqr7Idjbw0fZAZ g==;
X-CSE-ConnectionGUID: Nwmm4dz4ShaHJreTnng6BA==
X-CSE-MsgGUID: zj9Q+hl9TG+LosB5l/ynMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="94162292"
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; d="scan'208";a="94162292"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 02:17:20 -0700
X-CSE-ConnectionGUID: i8hH0zOGQDa7IRYI08ahjQ==
X-CSE-MsgGUID: S43UcQMZTw+TtreGdrWNVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; d="scan'208";a="302945153"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 02:17:19 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 02:17:18 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 28 Sep 2026 02:17:18 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.38) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 02:17:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SbGismHQ+wkbpkIq74hvjGSqDGBSaUlhSakWRpLD5LPQA2HxxB7ien/M3FS7pWRp/4yfEu/eYehFaqHJEiFmsAAuwhhK3OOGoeNLH14xdgkHyK0gJpwfhwUEYTqKqIZpsbjsoRioy/6oxopyQBGAo4HqVcIeC7e/lSKf0CgPxro9WNFvdJPF4j6+IwvI/Rkj5Q8Oymg7neN0MEATvLE/ZOcZe18v+qMj0frr//xWXN00ypD5v3MwmhYQwDhmcC3zXuD53+5mGBD4lt31uo2+crhCWek+24d0gg/hX8f72Cykh26AJhhLU+IiSpGTNmf9Ma2w64EjKaAIn0Dohjcbaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WWKV3jya9MewWIEQ/n50boMb/HkE6JJquirkpriXk4Q=;
 b=DHrZJVrvJDjfTyod7bIQhStPXcSEmS5HE3bk11boLLXWOQZnRw8dQbJFNyVtrSXx+7XKLxkyZ6t55uUQYeGAWnRGYlH8hUGoCtJ0Gl6DuTFFkH7ON+17jhUlQmSAIhWl+yTziH7ca+NyCH3+CuDvWwT137T3lep1qIkmAMWJam6fZT0hGCHp/fsEM6q5TajOtqSTxVwikYHRCferM77/y/tuC0RW/JAKnpg9FH2cO2VZ9O7Bpok210AE6B+DbIy0xgVnP4MyxuBEM3rqyUW+cLmYoTD5+2wdo/cPDtjYj3gZ3l7pOOKwMmxRG/aCru4P+I4JkfXrnXkDriWcIMPbyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by PH7PR11MB8275.namprd11.prod.outlook.com
 (2603:10b6:510:1ae::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 09:17:17 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687%6]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 09:17:16 +0000
Message-ID: <725c0e92-617a-4729-acb4-c31efc2facb2@intel.com>
Date: Mon, 28 Sep 2026 14:47:08 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/6] drm/xe/xe_ras: Track offlined pages by firmware to
 avoid duplicates
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <mallesh.koujalagi@intel.com>, <tejas.upadhyay@intel.com>
References: <20260928061830.417395-8-riana.tauro@intel.com>
 <20260928061830.417395-14-riana.tauro@intel.com>
 <a1741726-0042-4133-ad2e-fa6633f7e002@intel.com>
Content-Language: en-US
In-Reply-To: <a1741726-0042-4133-ad2e-fa6633f7e002@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0065.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b3::7) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|PH7PR11MB8275:EE_
X-MS-Office365-Filtering-Correlation-Id: c9d6863f-6611-411d-ba58-08df1d414a27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|4143699003|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: le1ntxzy+8sViDggN4X3mTz4NIfCZSgXpjefYJQGjakR+CSN0L0Z27TQiJHS2xyoxyVTJMOiWFilIyeZGLFgdaGhsnsm/Qq6wG/dppT/u2PnaHClhJq5QWAGmsIERIl+IvT5Y4m39OYEI5SSr6gNuL7puguy/4UZMM51sVxW24kUFBo6YZSUzt/VUnnVmOFUUVlDnirQvXyXR/hg0IwCzl7jopcowsmSCrvYa4pAlS/L28rY1ueCynQok7WnJbr0L5GkyTK73D8v1A9QhHQ6ZN9tkSns09vmFBpFHRWem4aJcRhFwhR8WmXf5qvm8u688sz70Crw9zkELrZ9qSP/q6cfGpUFrKOUzIuzgb6V/cYVekHb7javB8Z2q3sPvnVcHUe4ZGv9OUsQ/Wr2aE9vPtWwsbFvxAcY9w/Nvo7gj83OslVe/Bm/UdJKuVoUmvhcduCN4YuvcSflzD+zmQUmVYcKbOQ8/vTkksnWXwNjhrA9iee7CjEpdBAbZHwwXqjl0Yhea3e7uXbNFrfHYcxuOfO4F94729pPifLMqONJ/sY9xEXdqzJAjDjIWBC8fbiNSv7Huf6WH1zKcUx7MKCG+FFvhbSIci7z248we5Vc0yf2+nVwksMNEFsEFzcZ7o1OCugly/RO8dmz+OC0rh4T5OnY1nnpJw14/OC8jRJXOis=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(4143699003)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SEE4RVpLS1o1RzFwUDNUSmkrVkFhL3A4QXI1dXlKS2VCYjJIekxqK3krVlFt?=
 =?utf-8?B?L3VYWDJMYmVLYTRPRGc3bG9SNjczMTFGM2p1ZUlSaUNrNitZbDdtbkg4YXR1?=
 =?utf-8?B?OEhuMFB1ZjljK3VzcUFqSlpYN2F3bUJreW82QWd5QTFJcXZFUlh5L3lKQXNI?=
 =?utf-8?B?eHF0c3MwclVYbW4rd3YzMDdCNmJIdENMZUVMVVo1TVJrUllJSW8vUVY4V0Q2?=
 =?utf-8?B?a0preFUrbko2alQvWWh2Q3JpNHBQc29kaTM0NlZrYi9lcmRnZmxDdlQzNkdG?=
 =?utf-8?B?VG9kTTBXRmlpSVhtTVo2TTZQemYwc20vdnl2ejA4b3liRUdiWXhBamZvT2xD?=
 =?utf-8?B?WmxBTGJ5LzZIZW9UdVVFTkJJclBQdUFQK1N2clVsYWRTRlhjZG9ya3dHaUxa?=
 =?utf-8?B?OG15MFhQbkc4SHZtOERPMzlhZGdWazY1R3BpMVFjVzl6VHdNYnVRREcwS0lm?=
 =?utf-8?B?KzRiRFI3Y2tuVVFRUFUrWXJkNndRczk4Zy8rVzdTUzRXN0QwNlBZbVhWNVJL?=
 =?utf-8?B?SDNOVkV5QVMrK29wV1c2cFF0TGRSZmc4ekRPNWFKeE03RStlTVVnMmJINjV6?=
 =?utf-8?B?UnVLTnNGUTArcjY5N20xR000THdRdmd2OTNZNlJZSWVnWldIZlcvU1hDZWtr?=
 =?utf-8?B?MUNub1ZKMG1LMHkvUVNCWFpmdnAvWlI3TXNHV0V4WWJMZDNJWEpoL3ZGWSs5?=
 =?utf-8?B?bXF5MzlUT0U3TmRGTzZGVDl6QUpHZEM1dVExZGU3aWJHV1hDU2p3ZDltaDNS?=
 =?utf-8?B?SHp0TE00T1VPNnRRVmxBRWlrV3lLTFlDY3N2NWtVVGhHMGpWbGVCNFIzM1hj?=
 =?utf-8?B?aWVkM3JXNWFETHlQckVBUVZ5N0lyZzBQWjQxYkRxSFg3VjR0Vi84d3dpZVJN?=
 =?utf-8?B?OXpYQmRTUUxhdGhaajZaWlJTcllXQ0NYM09vYy8zaHpCY0JaMVAzS2JxZ0Vk?=
 =?utf-8?B?RDltWnE5d01oaHFMWEJ0c25qb2hxdEFBWjVZZXE4UVhza0tUcC83SENTOFpx?=
 =?utf-8?B?NWpIQThxb0h5a29PTXRUdVNuVzRBNlVnTC9YMklvdnA2NDhoNjJweFpHN2g1?=
 =?utf-8?B?SkFmY3F4WmQzOHlHYXFCWTY1OTY2K1lBUElkYVJpeDFzVnlsQzhqcjFXcUFG?=
 =?utf-8?B?R2V1T2s2Y0hoSzR4SEdoYmVyQlk0elRxZW55RFBtMFpjdk1WZHQ0UVVxK2hj?=
 =?utf-8?B?VXFVRUMra3prSmh4N3FJWHlKVGdYSDFDcGVYakdONWhkWXVIN3ZvUnhvSXdx?=
 =?utf-8?B?dm9zdTltcG8zYWVTSE1GVVFDcW9tNXArTEVVZU0zYUd2azBaSllqUTR1aEh2?=
 =?utf-8?B?eWNZVXFuLzdsMFV1MnljVmNaQzV4ZjNEcWxyRWZHSU9pbVg3STFBZjdGU1g1?=
 =?utf-8?B?Y1pmSmhqbDJ6cWM0aExtaTRTVnpqZVliandTQkZKRWhsc0pOSmxDa1lqZXhR?=
 =?utf-8?B?djVacTdGUUNVVGNYRlJkVEwwUTdoQlVQM0tCYS9lYm9KZWdXSE5HM2YvTTJn?=
 =?utf-8?B?NUpIMlEwZXFWdUZaZnhCZXdoUEc1VjFwM1ZGc2pYR3p0ZWZUWk9oMFJ4Mmhs?=
 =?utf-8?B?L3k0WXg0VWJoMEVmOC9DdEU1OC9EN3RYbEpUKy8wUXVDWERkb2hqWVFZMnhj?=
 =?utf-8?B?UWVJSk5PWHR4enJGTk04RG90QkpDb2MrRDlIaStzUkQxVjN0SmxBa2xKdDFC?=
 =?utf-8?B?UnJZK2x2c3dXSkV1SnM2aE05eHpQRlE3bGxqR2p6NHRyN1R0VUFFVWtqZGlW?=
 =?utf-8?B?VWxxcXVGK29oTDJ5Ymxvd21xT24xNFFWc3E2Y1RIb3I0R3pHdjNyakpianRj?=
 =?utf-8?B?OWRvYVVIRzA4QVUrRWgrY2JZU2xOZEdIK1RZS2VKSlJ4ZXJpVEhnbDdLUDVw?=
 =?utf-8?B?YlJTNmVRcmhOSkZudXFhbFNYT2FjQ1o2Z0lFNWI5RHFaTkxWTWpoUVhCMWhP?=
 =?utf-8?B?d2t3MnU5UUVYUWl0aURMMjgvRDhJV1hBU3laUlNHd3N2Z2wxbXBuaFY5OGcx?=
 =?utf-8?B?Tk1XYzZNNHpOYXpGcnBuTHFlSGt2R3Z0MlZvMTNhUjkyOVF5azJIN2F1eGVr?=
 =?utf-8?B?dnRQWkVtVnBtci9IalVNMkdlWXFCeDZ0NnZuSGxQRjg1ZGk5NHpmRnlud0JB?=
 =?utf-8?B?NWNxTTFuWFl5ZGNvNlFBQ2IrTEZyNVdYT2xHZS96SU1HRWZxS0dHMTJZNFY0?=
 =?utf-8?B?L1A2VHNOR0Z1Qy9PZ1FQSnZ2VW1RYkplcVYyWFJ4T1N1YVR4T0FEZGtOR3hr?=
 =?utf-8?B?WU9SNVJuWUcwOEFQZHg0cXJoblNSQ0x5UkVLcWdvTkNnZHlmV0U1WGxVMHBn?=
 =?utf-8?B?WFdVOFBMTWVDYXhpMTdqS01mMHdvZFhSbzZqSlZlWStQaEVqOUlwenREL29j?=
 =?utf-8?Q?JT5uQRDsA3UmznqM=3D?=
X-Exchange-RoutingPolicyChecked: VG1+oDokOFAwjexpmXwIPeWEX1QpeM9ArTA/bGNp6YP83geRdOvdZKMSYcGSkiQLt5aNAiVTUvCBpxIPEUc0a/MZcEbSjN61oM1+U8ir8FbkufYZ/ApxBnYU3P2fO4YcInvEjsVnGBbQxx9Zqsp/oBYn7EJ0q15I7qrpIS6nD3nUJb+NkGzWQaLSSATW9VtCDkJXzcE4F4TGnnrBfH3M7jG/f8h4zXZJLwaM/EVFs/QCpw5Io/4gYFHl6vgP0Pri3ScpEs4bUlq3ENmVXFb3wgtoBZF8QAMHd7xRUt3zBnS5yZefMnUAK0VHiYf7P4oN7aZHWOoc5WGMueY9o0iXrw==
X-MS-Exchange-CrossTenant-Network-Message-Id: c9d6863f-6611-411d-ba58-08df1d414a27
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 09:17:16.7823 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /rXLLO9kKBca/bci30dpLba8jxB2SaXKWgiSmT0IHRIyPENsh5fnA2dLW6BLbfG8bSiguyjsR5RZ19Nvf/cGyhj+DdQdetnd7VSX4tYD63A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8275
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



On 28-09-2026 14:30, Ghimiray, Himal Prasad wrote:
> 
> 
> On 28-09-2026 11:48, Riana Tauro wrote:
>> A memory scrubber can report multiple errors at the same address. Track
>> pages already successfully offlined by the firmware so that subsequent
>> reports for the same address are removed from the firmware queue instead
>> of issuing redundant page offline requests.
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>> v2: use xe page shift (Sashiko)
>> ---
>>   drivers/gpu/drm/xe/xe_device.c    |  4 ++-
>>   drivers/gpu/drm/xe/xe_ras.c       | 44 ++++++++++++++++++++++++++++---
>>   drivers/gpu/drm/xe/xe_ras.h       |  2 +-
>>   drivers/gpu/drm/xe/xe_ras_types.h |  3 +++
>>   4 files changed, 47 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/ 
>> xe_device.c
>> index 205cb4e7f9e8..1ec7c74cbd58 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -957,7 +957,9 @@ int xe_device_probe(struct xe_device *xe)
>>       if (err)
>>           return err;
>> -    xe_ras_init(xe);
>> +    err = xe_ras_init(xe);
>> +    if (err)
>> +        return err;
>>       /*
>>        * Now that GT is initialized (TTM in particular),
>> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
>> index cfc7f07e9ced..7dee1c804eeb 100644
>> --- a/drivers/gpu/drm/xe/xe_ras.c
>> +++ b/drivers/gpu/drm/xe/xe_ras.c
>> @@ -20,6 +20,9 @@
>>   #include "xe_sysctrl_mailbox_types.h"
>>   #include "xe_ttm_vram_mgr.h"
>> +/* Any non-null entry marks the page as offlined by firmware */
>> +#define XE_RAS_PAGE_OFFLINED        xa_mk_value(1)
>> +
>>   #define CORE_COMPUTE_UNCORR_TYPE    GENMASK(26, 25)
>>   /*
>>    * Uncorrectable error type for core compute errors.
>> @@ -210,6 +213,7 @@ static int send_page_offline_cmd(struct xe_device 
>> *xe, u64 page_address,
>>       struct xe_sysctrl_mailbox_command command = {0};
>>       struct xe_ras_page_offline_request request = {0};
>>       struct xe_ras_page_offline_response response = {0};
>> +    struct xe_ras_state *state = &xe->ras.state;
>>       size_t rlen;
>>       int ret;
>> @@ -249,11 +253,16 @@ static int send_page_offline_cmd(struct 
>> xe_device *xe, u64 page_address,
>>           xe_log_err(xe, SYSCTRL, ret, "page offline command failed 
>> with status %u\n",
>>                  response.status);

if (!ret && action == XE_RAS_PAGE_ACTION_OFFLINE)
     xa_store(...);

>> +    if (action == XE_RAS_PAGE_ACTION_OFFLINE)
>> +        xa_store(&state->offlined_pages, page_address >> XE_PTE_SHIFT,
>> +             XE_RAS_PAGE_OFFLINED, GFP_KERNEL);
>> +
>>       return ret;
>>   }
>>   static int handle_page_offline(struct xe_device *xe, u64 
>> page_address, bool send_cmd)
>>   {
>> +    struct xe_ras_state *state = &xe->ras.state;
>>       enum xe_ras_page_action action;
>>       u64 addr;
>>       int ret = 0;
>> @@ -297,7 +306,11 @@ static int handle_page_offline(struct xe_device 
>> *xe, u64 page_address, bool send
>>                  page_address);
>>           return ret;
>>       case -EEXIST:
>> -        action = XE_RAS_PAGE_ACTION_OFFLINE;
>> +        if (xa_load(&state->offlined_pages, page_address >> 
>> XE_PTE_SHIFT))
>> +            action = XE_RAS_PAGE_ACTION_REMOVE;
>> +        else
>> +            action = XE_RAS_PAGE_ACTION_OFFLINE;
>> +
>>           xe_log_err(xe, DEVICE_MEMORY, ret,
>>                  "Double-bit ECC error detected at physical address 
>> 0x%llx, page soft-offlined\n",
>>                  page_address);
>> @@ -341,6 +354,8 @@ static void get_offline_pages(struct xe_device 
>> *xe, u32 cmd, void *req, size_t r
>>   {
>>       struct xe_sysctrl_mailbox_command command = {0};
>>       struct xe_ras_offline_list_request *list_req;
>> +    struct xe_ras_state *state = &xe->ras.state;
>> +    unsigned long index;
>>       u32 total_pages = 0, count = 0;
>>       ssize_t rlen;
>>       int ret, i;
>> @@ -370,8 +385,15 @@ static void get_offline_pages(struct xe_device 
>> *xe, u32 cmd, void *req, size_t r
>>               return;
>>           }
>> -        for (i = 0; i < common->pages_returned && i < 
>> XE_RAS_NUM_PAGES; i++)
>> +        for (i = 0; i < common->pages_returned && i < 
>> XE_RAS_NUM_PAGES; i++) {
>>               handle_page_offline(xe, common->page_addresses[i], 
>> offline);
>> +            /* The pages are already offlined by firmware */
>> +            if (!offline) {
>> +                index = common->page_addresses[i] >> XE_PTE_SHIFT;
>> +                xa_store(&state->offlined_pages, index,
>> +                     XE_RAS_PAGE_OFFLINED, GFP_KERNEL);
>> +            }
>> +        }

Do we need change order for
get_offlined_list and get_queued_pages ?

Missed them earlier.>>           count += common->pages_returned;
>>           if (!common->pages_returned)
>> @@ -1098,6 +1120,13 @@ static const struct attribute_group 
>> gpu_health_group = {
>>       .attrs = gpu_health_attrs,
>>   };
>> +static void ras_fini(void *arg)
>> +{
>> +    struct xe_device *xe = arg;
>> +
>> +    xa_destroy(&xe->ras.state.offlined_pages);
>> +}
>> +
>>   /**
>>    * xe_ras_get_disable_page_offline - Get the page offline user policy
>>    * @xe: xe device instance
>> @@ -1125,15 +1154,18 @@ u32 xe_ras_get_max_pages(struct xe_device *xe)
>>    * @xe: xe device instance
>>    *
>>    * Initialize Xe RAS
>> + *
>> + * Return: 0 on success, negative error code otherwise
>>    */
>> -void xe_ras_init(struct xe_device *xe)
>> +int xe_ras_init(struct xe_device *xe)
>>   {
>> +    struct xe_ras_state *state = &xe->ras.state;
>>       int ret;
>>       xe_drm_ras_init(xe);
>>       if (!xe->info.has_sysctrl)
>> -        return;
>> +        return 0;
>>       /*
>>        * TODO: Replace platform check with xe- 
>> >info.has_disable_vram_page_offline
>> @@ -1145,10 +1177,14 @@ void xe_ras_init(struct xe_device *xe)
>>       if (IS_ENABLED(CONFIG_PCIEAER))
>>           ras_usp_aer_init(xe);
>> +    xa_init(&state->offlined_pages);
>> +
>>       get_queued_pages(xe);
>>       get_offlined_list(xe);
>>       ret = devm_device_add_group(xe->drm.dev, &gpu_health_group);
>>       if (ret)
>>           xe_err(xe, "Failed to create GPU health sysfs, err=%d\n", ret);
>> +
>> +    return devm_add_action_or_reset(xe->drm.dev, ras_fini, xe);
>>   }
>> diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
>> index 561c656e2ad3..e41a52869085 100644
>> --- a/drivers/gpu/drm/xe/xe_ras.h
>> +++ b/drivers/gpu/drm/xe/xe_ras.h
>> @@ -19,7 +19,7 @@ int xe_ras_get_counter(struct xe_device *xe, u8 
>> severity, u8 component, u32 *val
>>   int xe_ras_clear_counter(struct xe_device *xe, u8 severity, u8 
>> component);
>>   int xe_ras_get_threshold(struct xe_device *xe, u8 severity, u8 
>> component, u32 *threshold);
>>   int xe_ras_set_threshold(struct xe_device *xe, u8 severity, u8 
>> component, u32 threshold);
>> -void xe_ras_init(struct xe_device *xe);
>> +int xe_ras_init(struct xe_device *xe);
>>   enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device 
>> *xe);
>>   bool xe_ras_get_disable_page_offline(struct xe_device *xe);
>>   u32 xe_ras_get_max_pages(struct xe_device *xe);
>> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/ 
>> xe_ras_types.h
>> index e09b50a6f77b..50d70e2e2fd3 100644
>> --- a/drivers/gpu/drm/xe/xe_ras_types.h
>> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
>> @@ -7,6 +7,7 @@
>>   #define _XE_RAS_TYPES_H_
>>   #include <linux/types.h>
>> +#include <linux/xarray.h>
>>   #define XE_RAS_NUM_COUNTERS            16
>>   #define XE_RAS_NUM_ERROR_ARR            3
>> @@ -417,5 +418,7 @@ struct xe_ras_state {
>>       bool disable_page_offline;
>>       /** @max_pages: Total number of pages that can be stored by 
>> firmware */
>>       u32 max_pages;
>> +    /** @offlined_pages: XArray of pages offlined by firmware */
>> +    struct xarray offlined_pages;
> 
> Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

Sashiko comments look valid and Need addressing.
> 
>>   };
>>   #endif
> 

