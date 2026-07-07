Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F49DC43458
	for <intel-xe@archiver.kernel.org>; Tue,  7 Jul 2026 18:14:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2937B10EEBC;
	Tue,  7 Jul 2026 18:14:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ALaIaN3R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BD6710EEBC
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Jul 2026 18:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783448085; x=1814984085;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/CWITwC+76GnXPQKEg80IN8iGfvMGHrLn0+VJRp09N4=;
 b=ALaIaN3Ra+oRNXzTKtM/uVNQtFAlh3o89IwCU8yPGpCAbmwRixDUdsur
 /j9HhlZJSoLIn1yFxeDAlJ1vLj7Pqhx30iirwD/+uFRiYteF8BP421jZ0
 e1c+qy60XQm095e5rEvSS6z3dgmobAN2KZHQwNeOZawOPqCo5NuX7dGHA
 T4l23Q3nsNKTj4qgMYQWBkHWrl9lsltoAVc2W5GfcPK5gdN46gpBH2omC
 ZH6tXGo2Yfz4T1B5dy3QEGkjPTxKVjep4xzbeLf2+uzmfpLh/SjG/L/Dw
 sBg0/TdXVDETF8OQaGcy3oWt1l6xsuv9L3VAYzvKERszjmuK0NBtvebRb g==;
X-CSE-ConnectionGUID: ZWsJyNNlTtCwe6GSRBuI5w==
X-CSE-MsgGUID: jAq3QgvTRMSQd+rSlWcCkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="88019997"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="88019997"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2026 11:14:44 -0700
X-CSE-ConnectionGUID: /9apiEUeSCOjJ0m8niyroQ==
X-CSE-MsgGUID: PFcofSavRY6Nv3rXM9PxzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="254144015"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2026 11:14:45 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 7 Jul 2026 11:14:44 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 7 Jul 2026 11:14:44 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.37) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 7 Jul 2026 11:14:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tOw+yrDyRw4hVDlmPToZ7W+lUpLUgt0ylSark6dOYjW9seSrd6mlvfBL3+IEypGu5xhc9kgVnycJUEBVqv/vwyrmghozvlUrXFsepqZLKwPQkhIsRazpNxcDJiATbQWBlEF6AxGfSBMF3YtiYCGqqHiNlr7DnPs8Fbn6zRoKw7MUryCHGdmk/+OAmUVBXp63E+WTwyBqq6gKJTzH1sXVzPerKIDgp8dB+UaSplIFU9if1UZlGSXZzxnguOqbDEHHe/fFOTsiQCEILziG7tXYKVaYbmmcoqNYIChPzfwLzMlu64lmWUEVbId7itQM13668bycvTf9gquEst1fYinu3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XLXV/iTkUPvoXHuepUJSqeLGub7ORAEg0ndXNR9kKGg=;
 b=ZqyZCjgcOoWECZdEFxucZQ457NPr9sIX9bDZ0c0BN2ne5VFJ0s3DZwTS40nJQRXulMGcw+wsMcI9GyFRhqprALm86AskJuHIH3MCoE76frRTGYZBtDBcNmAGgGztC06q3pvpsp8aAZEtBYAgTcDPQjFLWFu9mG5QwbfO+Kyp72oWOymiygHALNXUCEVWpq4D/HfNpWi5EOpmIxQd/+6gfp2bBW8PYcQheb6tlViHJ+1JYN7ISEsKng+apfRW8+0h8ybms7BT/fTGnlpDvPr9QyXhWqkg9MbN96a9oujo09HLnwpytvFr2Fe5B6LtJUb/Mc0YUibxqk2ZlOsHigMoZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA2PR11MB4985.namprd11.prod.outlook.com (2603:10b6:806:111::8)
 by CYXPR11MB8753.namprd11.prod.outlook.com (2603:10b6:930:d5::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Tue, 7 Jul
 2026 18:14:40 +0000
Received: from SA2PR11MB4985.namprd11.prod.outlook.com
 ([fe80::4fb4:c6d2:2c42:1e4f]) by SA2PR11MB4985.namprd11.prod.outlook.com
 ([fe80::4fb4:c6d2:2c42:1e4f%3]) with mapi id 15.21.0181.012; Tue, 7 Jul 2026
 18:14:40 +0000
Message-ID: <5d11c80c-ff71-424c-8fbe-e86db545cf7d@intel.com>
Date: Tue, 7 Jul 2026 11:14:40 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] drm/xe/guc: Define GuC firmware for NVL-S
To: Julia Filipchuk <julia.filipchuk@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matt Roper <matthew.d.roper@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
References: <20260707175638.30935-8-julia.filipchuk@intel.com>
 <20260707175638.30935-12-julia.filipchuk@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20260707175638.30935-12-julia.filipchuk@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0013.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::18) To SA2PR11MB4985.namprd11.prod.outlook.com
 (2603:10b6:806:111::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PR11MB4985:EE_|CYXPR11MB8753:EE_
X-MS-Office365-Filtering-Correlation-Id: ba796d61-56a3-4bea-7672-08dedc539cc7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|11063799006|4143699003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: unFk5vkYAfNzMRXF64fMt3asbdOEVFjPqCmLPxY3NRG5ATG3DxWpPeFN02OOuks21PCsjhkF/Wo+HiWqXwfIQEJkeu9quh7o6bK0b40KKbU4ab4ii2FoCM5NzQjmBXIBsed638Vfsm9XU5pzXlIa7x5qYGTZu5MgIXQPqjNg79xAWal5Feh+Zb2kwY1TY0Mi099gSbP30ZdRUdZnJ4QKBNCX9l8muRPF/VynTEX6ipdcrrYQMYpwAjrPon997s7EgpgmtUfaKHBMwtO674OLWVeScVHWooEGRn1lZAjBsRG0uDOK727l/1UQHWBuBlfLWKY2GI90rJgCQO/H2jg1xnul8VpyjA2UP+kkN1Zz8TnjD7EVUcvrEB0he4cuzAkUDUWTZ/4dl8HJUL1/d8vC6NZvMKD2rbEKwn2ufJQMbFBMsPEjJxUgmMUDgFFGKlEvZ5mk52ZPwN8AtZciF6u652HMNBbBCwI4zPahYmpf21qdFlUgdxiO7hy56J325pLfat5ud7idLSZk0vrdsy3SUMLqBNcOVH2unPciY1eeyawug6HbeB0GIpR4u5aS88MlhLr3FgtieT2cPeBQAVcHeIEOFs6F1pDL1miXTOwCu/6YUt7RtlHFhO6esKE8QpLe
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4985.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(11063799006)(4143699003)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dlJuRTdPZlRzTWFIMkQwVDZINEh3S0lUY1hYQUhMYnRwdDMvWDd6OERZKzBp?=
 =?utf-8?B?Z0JHclgvVG5oZVpSQ3ZwRlVDMjFEcTdpOXhWY3ROcTdSQlNSV3pWdk5kc2tV?=
 =?utf-8?B?eXlwb1JJMk13WHJ5ZFgzdFN3TmM5QXhMcVNWazJqZFAwTGl2S3R2anltYkxl?=
 =?utf-8?B?R29qWVIzdkVjUFdKb1ZEbk13b3pEU0kwaDBjRWFwREprVi8rM2FEcU1mVDhE?=
 =?utf-8?B?eEl6N2MxSlQ5dUxQQ2dGT0RpUm9FQ1JRdUp6WkFSNUt2cmxYUUFwTU93aHJG?=
 =?utf-8?B?Rk9SNjlRVDR3bFZwWFN1V25kMVpnNWNqNHZLanFxWGs4RWJsV2puVnh3TlBS?=
 =?utf-8?B?Q3JXenVVdHQ2dEpTaWsxQU95WkZCdmJlVnhjYzJoV3JSWUZqdTROeFljS1dO?=
 =?utf-8?B?U1FZNUxaNlB0R3J5WndUaFN0YXlDMDNLcFFWeGhhQnk3S0RKbDVBM0tHZVNh?=
 =?utf-8?B?cS8vakFVTEdaNDE1SmVETHlEMC9tWWZUbFY2T05QZGpBNndBcjhITG9DeWN6?=
 =?utf-8?B?ZFE0cG4rUjl5Qmk3Y21Nc1czZTRBL3l0U2YzWWk3RTR6VC9DSDhKOWlKaFk1?=
 =?utf-8?B?RGdZdTBJUTkyL2FmajBVSDFySGxUaU83Y09GZTFhU2RZa2F0UU8weWtLbm5F?=
 =?utf-8?B?dmhIWWNPbUJCYVFyL1VjQzFFR2Q0cWNCSTI4RVdEcG50Rk15M0M4VkVPWnhR?=
 =?utf-8?B?ZEFhQmZ4QWtKeXJRd09CYjlUd1kwcEt1Y2pXay9nSWQ4ZThXVVVRN0VnYWtE?=
 =?utf-8?B?VmRrOE9WS2hNRDIybEZMVlJwME1yZWpuQlc5SDkyQU50T01KbUQrYnBJL2hQ?=
 =?utf-8?B?MFpmcVN5RGtkbmhzelZVdEt4ckhqOEZ2eGxkSkdRTTZzM0hGeHZpT28xMTNZ?=
 =?utf-8?B?RXJFM3dxcEh3aW5kOExtQkVXZFk4eGhLVXNOb0dFTTVHMy9KbHZSRXpZSFVY?=
 =?utf-8?B?L3B0T25Ga1ZaRmxFUVdjbUFybUlRdnZOZmpqdHpqL2pvZ3REUDdJbUdLZkJl?=
 =?utf-8?B?ZEQremI1NFhvcTJvTDZqRldER3czWVlnMTZYV1JtMW5ybm84cHhNWStSaUlU?=
 =?utf-8?B?L3BSYlVGQ0xKYkVsNE1abTJ3d3MyUkM4NkhiN21RYkZvV1BWYXZ3azl4WkRW?=
 =?utf-8?B?dUExbFdnQ2t1MmJKQVBiY3ZOcCtaNno4T0I0TkpnMFpmcTBWczJ2dlhkaUxh?=
 =?utf-8?B?c1Y1b1VPdVBtdXlWSWJHVkRiU0VUb1ZCVnlERVl2ZFdTNkdRbTg0OUpFR2lD?=
 =?utf-8?B?clY2K3U2Y0JXMkJROTM5UVhLNjhtMjYyOEhVdDh2a2RYTGYwWHpxSWNhTXhQ?=
 =?utf-8?B?YytuVEhSNElJdlF2Z05rNys2Z2IySUdJbkVsL2xRMytxK1c0RUtwc1JmTlRB?=
 =?utf-8?B?ZXlOVTVQajhoT29oRUFlTjBmWHpGQ0NBSExTZXZEU1FoNG5LMFhjcVAwaEI1?=
 =?utf-8?B?NnpEalpFb1ZPTTZEMzRlYW9JdzRYK094cEZ1b1JCeU5DZUNEOHFIaGhla3pz?=
 =?utf-8?B?R253VWJZbUZSMmV1TmJubHRiY3VXTit0TExUWWVEMmdIaWZSYVFpK3prZjlM?=
 =?utf-8?B?MjZMbUt2TTBzN2RwbW1KQlB2b3FhbEgva0lQeERjS1hJcG9sMlBFYXFhdStY?=
 =?utf-8?B?QXRKU3krWGY5M1A2V3RJazllUmxqaWpCb0xESHhFQ1RySDdLUDlZMi8yaHNw?=
 =?utf-8?B?Rjh6R1lWYTNQNnQvd3RobHZQSE9TUE9uQkhBL1dmZFVKU21mOVQ5YUtBemV6?=
 =?utf-8?B?bXpDMnB5cFh3QWtTZ0I4ODEvNlExbFYvTFdXbDVnMTdqS0hWOER2UXV6cXhp?=
 =?utf-8?B?cEdXR016elM4dHNQcis3MTBhY29ndmd5K01nWkZ4WmpLSVEzb0NIdWM5cDdL?=
 =?utf-8?B?V0lzS1dMZ2g5a3RrbXRtZ1ZMbDZkSTBGTDVvVDQ2cDdaU0xhZFZsV2lSSENR?=
 =?utf-8?B?YVo3TTl6MzNsYnltWWhQNlIvT2Jtbzc0Zmo1WGRJTWxvbXNmYVFvU0ZFZWVv?=
 =?utf-8?B?MnZCSEpPTVVKOVVpZ0pFNUNSMStZK3VTS09WTTJscUJGdXR1OTZOcUpLK0FT?=
 =?utf-8?B?RkhFODNUcCtnbVpVNlpHNVNTbmlkbURTeExVcitFcGFscXlWdmNyM0JkUlpP?=
 =?utf-8?B?aDZ2ZjNxOUxiL2tNZllIb0szbDRoYkRWSmRNNW12TGdONldrRWtVR3NjeTZ4?=
 =?utf-8?B?NTdmK1ZMeVJuekx4QTRNZDlrdHZXOWM1UzlrbXJyK2QvbzNId1RhVFBqMGZj?=
 =?utf-8?B?dk9UdmV2MmdBMnE5R1RabFBka3FjTFArQ0d0M3I2QUdUcnJTUGZQY25KcjBt?=
 =?utf-8?B?Qkw5RUtoWGlNRjFkTGpORFJaTWlIQVlGOVUwVGVnYUhVMzBMMXNEd3Zuc01w?=
 =?utf-8?Q?QX7cwZb6l5n0Q2a8=3D?=
X-Exchange-RoutingPolicyChecked: fSEvm2kX1O39hTBBs+LsnK+IYrB8lqrQ7g/bIHe5IP4OHe2zcbhUcMRlkmaWbWhS3RfF/l9blLoEsJkIIvdHpoISVe2y4oFo510TS6MGCfo/eRRlWOiykvU5TUeCcI4ctOOWMbbQrFfBa5BKZIrqwai8g9LUW/i3LaCOgbV9JG7iQputUIOVoKlaHOIh84VVtwlfm4BPsOFbnEPazNvNYWTJQuOsNMz+F+FUjMkKsG8a6lxDn3z9JwrUK7SG2KImQl3VKLnJLuLG3kztOvuPHMyL8BVsw/x7evGvN95HGknwAZaWokEkrUgieVspdRlL/sv9rDMyS1wKJmnHIAR2eQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: ba796d61-56a3-4bea-7672-08dedc539cc7
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4985.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 18:14:40.5400 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: drbPEMRWNGkP2p1AhcZKybJlT4ULqZkZ+e6HUIiGQ8zagl5nHhqgGIVF/78I5kLk+uSHm0r6RosNfsinHkm/21xlgVwLUSMZYgzGqWHHiz4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8753
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



On 7/7/2026 10:56 AM, Julia Filipchuk wrote:
> From: Matt Roper <matthew.d.roper@intel.com>
>
> GuC firmware 70.71.0 (UAPI 1.37.2) is the first official GuC firmware
> for Novalake S. Recommend this version for NVL-S platform.
>
> Although NVL-S is similar Xe3 to PTL/WCL, it requires a unique GuC
> firmware.

I'd just drop this sentence about NVL being similar to PTL

> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
> Link: https://lore.kernel.org/r/20251016-xe3p-v3-12-3dd173a3097a@intel.com
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> Link: https://patch.msgid.link/20260108181956.1254908-9-julia.filipchuk@intel.com
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Link: https://patch.msgid.link/20260529193558.185436-12-daniele.ceraolospurio@intel.com
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Link: https://patch.msgid.link/20260618222536.3351750-12-julia.filipchuk@intel.com
> Acked-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>

This is the first time we require a major-only FW for NVL and the first 
time we look for 70.71.0, so IMO we should consider this a new patch and 
not an update of what we had posted previously in topic/xe-for-CI. I 
think we should get rid of all those tags except for your s-o-b and that 
you should take authorship of the patch since it is fundamentally 
different to the for-CI version.

Daniele

> ---
>   drivers/gpu/drm/xe/xe_uc_fw.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> index 498c89452779..65f0136859d7 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> @@ -115,6 +115,7 @@ struct fw_blobs_by_type {
>   #define XE_GT_TYPE_ANY XE_GT_TYPE_UNINITIALIZED
>   
>   #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)					\
> +	fw_def(NOVALAKE_S,	GT_TYPE_ANY,	major_ver(xe,	guc,	nvl,	70, 71, 0))	\
>   	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	ptl,	70, 54, 0))	\
>   	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	major_ver(xe,	guc,	bmg,	70, 54, 0))	\
>   	fw_def(LUNARLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	lnl,	70, 53, 0))	\

