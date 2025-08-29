Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AD5ACA0EED
	for <intel-xe@archiver.kernel.org>; Fri, 29 Aug 2025 00:12:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A1A810EB03;
	Fri, 29 Aug 2025 00:12:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hShFJWPS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C9A810EB03
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Aug 2025 00:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756426373; x=1787962373;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=F+K3gzMNMRNv0Ayt43w6vp8NcaQyM7lZG44XTz0KCcg=;
 b=hShFJWPSVXWscHq/1DUthL0oKujAS/iI+FNC8pUSGu3ZwhMEfFNxUUcv
 ynL0BPZSH2DJ3c9mgyiV9tRBRdnQ9Sy7W5SD5HQXAD7Zj9hPdxTRUmLxk
 OkwWhKnB8BoopzEjdTG5ICeuPTBu5uzR7YWwg+lPmp/CPPXqZj8WCVEXe
 K9xXPi/MaRSuQ3MXRO+ON4gdvLhmyGgpHDpDArCTxmlZMh5EDfKouEEDx
 IS2JgdOUnAAWU5P2/6zLguhdpqXSFmibLCeWOAOTbiWTG9ZSG07wqD2sv
 volS54zMNO0wxKLLxwKULCHWyMpIsxx10Xmn3Vc2VnQ1hjIxk1Z2bksD+ w==;
X-CSE-ConnectionGUID: X99uwcgKTT6V2e8gtTx61w==
X-CSE-MsgGUID: 5nv10hTeQeKugFKgpiNL4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="62529833"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="62529833"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 17:12:53 -0700
X-CSE-ConnectionGUID: 6p4AujhCTsKOJFK1voetaQ==
X-CSE-MsgGUID: deRNZ6hYTqq/lUi/+gMFTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="170633667"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 17:12:53 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 17:12:52 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 28 Aug 2025 17:12:52 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.49) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 17:12:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ok4PA2xJJZ6lciYO5n1rF5u8x4b14NIA4MywmxPY8EZR/KdYLyn35Z0dbPAQCUkxBImH5VQVLzsLIz3wIVSU/rAufMf9Xdaf+yBxhMilBUWO4HK/dRVJA4oRb+LcGzy64MEaUzh8uuwEA+TlCZqPabU7QCzJYU0cKzJrNjtkOj3tVc7QO8cavws6f+tH/Z8tyeNJfLZbiV336he9upmboY+ib0zpGvS++8kHaWa2iVTstGkNLWewaG2S3mXhWBpmhrWhpLi4Iu480sRpdU1eYpkpePQ3wUVPUATIyxYJwm6uhYkarUskgvl2wuaMceN5yca0/9zhwh0UPy+X/gSt8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j48DHO3DI+/S1gTG38B023YvBzR+6CCF/H8KyrUSVP4=;
 b=OviKvFY4ILOf3NogU3iLK8DSuQZc9vPUa6Kq/fgeFJFVf8koHe/qTyv+oZvWZYipK+xz/yRYT1G7PyDzh6aEmz6bE5npgwr0hYPkGDXgfE2dJEONpAirVkjIG63flA3nPN+EasuU+CogXUw44N5diqyZFIJAh/ak4kXWVnB29NfgSwk9D6RM81lMMntArwGca4qtTB3Do9NooEL1RxEUcRe3rHn2pChUz9K7CZZwgkkRxD2D6sG8VSjOzuCjO9JS9n/Yr8mzxF7+fyXE8DXxmfa9zXGK4k5AA9H+4Gqeh8dnW6XYUZmn169Lnp6qajMybwjeCAPThVfUfB/Te6Dtyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by IA0PR11MB7188.namprd11.prod.outlook.com (2603:10b6:208:440::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Fri, 29 Aug
 2025 00:12:49 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%4]) with mapi id 15.20.9073.017; Fri, 29 Aug 2025
 00:12:49 +0000
Message-ID: <cf71e0a6-96da-4b21-b455-5fd6b6f17b07@intel.com>
Date: Thu, 28 Aug 2025 20:12:46 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc: Update GuC log buffer type value
To: John Harrison <john.c.harrison@intel.com>, "Summers, Stuart"
 <stuart.summers@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
References: <20250827215217.1030775-1-zhanjun.dong@intel.com>
 <658967b09cecdf0f20ad3547d4ab5ed3e016964d.camel@intel.com>
 <46a8709d-4ad8-4bc0-a1a0-3d6b7e33eb52@intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <46a8709d-4ad8-4bc0-a1a0-3d6b7e33eb52@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW2PR16CA0070.namprd16.prod.outlook.com
 (2603:10b6:907:1::47) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|IA0PR11MB7188:EE_
X-MS-Office365-Filtering-Correlation-Id: 776f01a2-634c-42a3-ad34-08dde690c9de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y2sza0xnSEtnZEV1eGpjdVVjT0ZaTzRISXJKU2ZUdk42aXhnS1FmMXY3V2gv?=
 =?utf-8?B?eFpwVDhncjFuVk5lUGZWdGRnSXJBQjBWTDNNVjZPRCtKdHZKUVlNUXpqbkYy?=
 =?utf-8?B?MGlFQWNRQTRkUTgxOFE0eFBLQnZHOEg1TFNnRXpaOEEydE5kek5DdmZqUGpL?=
 =?utf-8?B?eE5SdVA2ZDdwNGlMeHk5cjBmMlFMN2hSWmdkTU5xdHRGc3NOVjZjdDMyNEJz?=
 =?utf-8?B?YjRlMHpiZUZSaFlFM3Q4TVZMY0NCMjdNQUJ1R2hxR25xeXlvaDJtRTVuMW9S?=
 =?utf-8?B?YjllV3NSUE42UlJXWksxRHB6MGZHRHQ2TDR3MWF6S2ZwRGhCNnF3Z3ZVYTVO?=
 =?utf-8?B?OTBIV3g0TjdaYi9DMGFXbS9tUXVzUHlrQ2hwNFNUMDl6Y0pRMTZENmI2dm5S?=
 =?utf-8?B?RDhpL2trNGpaTUFjVjlxcktaS1F0anhBeXlJWEdUN2lXYkN0ZC9oRGI3bDJo?=
 =?utf-8?B?RG9IWmpIdVdHc1JIL1lZMmJpQ3Qxc2tQelVWWVF5NWNDd2wzKzl0SnFFdDdF?=
 =?utf-8?B?VXhFSy9DT05Ob2lqVmZQUkVuck5nYVhYU1RVbWJYQ1FRcHM5QmNNelprNFJ1?=
 =?utf-8?B?ZW92Y1ovK3BmZFpjNXVlc3N6MFN5YllsY3MvZVBzSk0zT1FvSUJJNjRTY2VT?=
 =?utf-8?B?NiswdWNuWGRNZnRuWkZZckI3ZXl3ZmtyOXdJbnZ4S09CNGR3TW9YMEYwOEZJ?=
 =?utf-8?B?NTU0SitKUFFwSDZvSmNTeitZTVA5b1BwRUY2NU4yRU5HQ3dmUUtIRGhSaU9w?=
 =?utf-8?B?enYwR3Z4TUdiRGtiWXJpbVVJSHMrbnc0dzJDWHI4bU5jWGdiaWNWS3RodTBa?=
 =?utf-8?B?UGdRK29DeFVJWDZaaHRTenRHTUhTN1NJUlh4VGxzTnBYS3BnN3pZT2FjTnRJ?=
 =?utf-8?B?dlorbFUxQy9YZ1dHZ0dsdzc2Z2h2TGxGd1RLd2k3cnptWFZOZ0NWeTNtTDdK?=
 =?utf-8?B?dkgxUnBqODJsb0libmFqaEo2RTRaUkd6cjdERVJKRjBYOTFWclEzVkVvUHRl?=
 =?utf-8?B?eDQwWjU2RmFKWEVDMHFpMjdHbjFPSmxFY0ZuVHVIa0NqbXhpRmRGVUF3TW41?=
 =?utf-8?B?SHUwZmJlanFpZ0hCUzAwazlQc3RXL1hWVk8vRXRoNkhMWWFJQWpwakt2QytF?=
 =?utf-8?B?MkE2bC9QZU5obUhYQUo1V3JyaUU1RURxQTJjV01lNk9vMGEyc09pcFY4SytO?=
 =?utf-8?B?TnpieUw4NFpnS1owRU9Mb3p4Smg4UjJaaTJtYUJBcjVwd2ZTV256Y0tpL2RH?=
 =?utf-8?B?YkM4eVg5dUlSRklOOVVUMlY4TUNJdkZSYWdMWnJJMTdNRmd2d3VpY2dwOHpC?=
 =?utf-8?B?U0FnVFhIWng5N2FoNktrbVh0WStqMXV6UUt1blhKWUl4NDJFMXFHL0pRM0t0?=
 =?utf-8?B?UTRtdFgybGpTQlp6ZGVEZ3d0NllJNWlYVTZTc1pPZEFma3V3Wi9ITkJKOFhM?=
 =?utf-8?B?TzdMbHplcGF5M00xakFrVEFmdmxyMjdmeWc4SnFZN25PWUNwVUgyZWJuOXNm?=
 =?utf-8?B?U1ZEVlV6UkpaVUxweTJYRVZDVEhVaGJQaUErMlpPdnhlN0g5VVZFZkdpdTFB?=
 =?utf-8?B?cGxUUHVFR0JCUWxpM0Y4YWdkRHByMFFWTitYdXFCSFpqQ2FGc0REVnlEY2xR?=
 =?utf-8?B?K3N0N0M1NzBzWmN4SzlDZGIrRU0xbXU1RjZWYlR0QVlCOGRyaHhDRDNJclFo?=
 =?utf-8?B?ZTBrRHptRWQweE0rRkZFcmpRVE81eTNISzg1dTB1NGwyK0gyRUpWL3JxaEF4?=
 =?utf-8?B?T3dJOWxheURzd3BpcXBsenN5eUtPd0llNXpjdDgxSkM2TkNBTEJkYW11R3RC?=
 =?utf-8?B?Rk1ENGtOMDVwVFNoZ0s1b1cyMFFoUVc2ZkZPVDNkRTRZTFNEenhIbllJL0Rn?=
 =?utf-8?B?c29obk9OVXJKTFZlZzFNWUkyd1VnKzhzckFtd05VVlhrMjUwSFo4c3NVanFH?=
 =?utf-8?Q?/ZZxZRxoIlY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aTJVR01TL05SZ3BoYWlBY2pFb1FkT0lNenhDY0hoWmF3eUVDdWZFYUk0aXlH?=
 =?utf-8?B?TWRBQWpHekFFaVVrZ2tNbFVyZ21HSTNzeGl0S3BOSkJPZSs1TEtTMFZOellk?=
 =?utf-8?B?NWJ6TVFDWVRFT3hkUWtSOG9xRk52c1FXMGh3UCs4VFBJMnVNQXVSK3Vud002?=
 =?utf-8?B?NVA5YUhGRjdWUEYwSTA1Tjlhc1pzRWM4MS83Nnp4VnFoYWdPOGtIN1dONVY0?=
 =?utf-8?B?Y3lEdWQ3OWEzNTZpdGJiZWNmMUxvTTJOMmY3ZjFJU1liS0RSR0ZWUXFGQkNq?=
 =?utf-8?B?YkpDcUc3ays5VGNvU2pzUHB5OFo4T3J6cktFeU92QVpDM2tJMzZHbzdpSVFi?=
 =?utf-8?B?TzNKMGI0dk01SDJmOXAvT1hnL2o2VjdhVzFMWE5JRDRZM2pJdGxLNVJ1UVFX?=
 =?utf-8?B?VnB1Z2k0NmNwUCtteHZVMEZKaXNyWEZEY3A0QnBXOWowZGhXUkxBRmhwMW9Q?=
 =?utf-8?B?bHhxenBLU2wwSFJFalR5aElPSDhuRkFVN3BaRjRhRlEwdjBzeTFNc1ZrUzBB?=
 =?utf-8?B?QkZGaDh6K2J2b04vV3V5M3JuOHl0MFpjOGczQ2FRMTAydzVxUnBqN3dTWmxt?=
 =?utf-8?B?M0pUK1V5N0lZRTRRaWQySTlGa0ZjblJlSHd4N0RNajN1Q3B3UzFyQ2Jxa0l4?=
 =?utf-8?B?bkIrRm91WHFpUjhtRUlvNWUrNFlBcHZ3RVZqVnlCNUp4NmdQOHJ2RzU3SHBC?=
 =?utf-8?B?T0Y2M3l4amJXT2dpeEZYZ3VXODVWWTEySnZkcEpKTnNlOWdDRnZZT3BnbUJx?=
 =?utf-8?B?QmlVQ2Z5aG1nMlp4cE4zWGwzQmk2WG5GUlppQTA5aXVKTktiSFBTZ1hRWVM2?=
 =?utf-8?B?cGNXU1ZlM3JIWkV1UzBVOU9hYTA4cXRYODk0dHBmbEphbTFiUmhkMjhNaHA3?=
 =?utf-8?B?MUV0TGFFelFDdnFybmRYVTl6ZXBEYzUxelpRVGRlWW8wemdBeVV1Q1lUSGxC?=
 =?utf-8?B?Zmo1eHRmMjVYZE1ua21WRHN3TENpVkVVd0JlNEcwbGh3S1dYMFhVcnBvQk9F?=
 =?utf-8?B?aUlINnI1Tk92Mk85K3JIbFNLRk15d3RhU1lkT1JyS0pGWmQyWkxaZE44eThJ?=
 =?utf-8?B?bTBHMnVSTTVJUjRwZVZRMzhqbnI5Um9KVk5OK2FjOWg4b1hmR0lGT0w5TDEw?=
 =?utf-8?B?c05iUHVUb283K0dlZXVzblJFczF1UXplUVNIbTJZTHlaOW1oYklvRkRaWDJ1?=
 =?utf-8?B?bmlUNVZCZXlZM3daaUt6eTdCYnByU3hYc2N4Z3RxWjVGcURuaG1GRUdjZXcw?=
 =?utf-8?B?aTRNbzVmT2phTTR6c1FhcXZUd2J2clJxSmxuS05hMDRkNU1VSDlMUU1JazEv?=
 =?utf-8?B?dHRHajh4TkRDeDZtVzMyaHorN1VaL3JSaDAxZ2txOUJNVWozd28xOVJhZkUx?=
 =?utf-8?B?N1VKSnQ3RFlOb3hJdDhuWUF0NnBQV0lOZFY5cUlyVXN2TmtEMEZWakxvOEpR?=
 =?utf-8?B?aTY2d3Y3c0IrYUlnTzFBeWNrTWNleVFBSkRQdHNlKzB0d0dOYVhGQmlkMzF2?=
 =?utf-8?B?NjlzVUxNT2FMZkVscTJiQld4UHo4SVVtQUFZalJ6cHg1QnNRSUdybm1EeG5K?=
 =?utf-8?B?OHdCY3hLVnkyOVQ0cnQrYm9mVldENmdnZ0loR2VBZ0QwT2s2YWtxenpNUEw5?=
 =?utf-8?B?M3YxdXpWU05TUXZMMnZyN0JvS0dCVVlsM203N05tODN0eUpzblhKUEgrdDJM?=
 =?utf-8?B?Wjc5dnRRM2QyZFpRMjd2RUNuQktaTnF4d3FRNnRGZWR4QVdKTGZoSitwRGE0?=
 =?utf-8?B?SDNjL3BYSHY2WTNrZU43bXhxVmN1TUdEMUdKVTRGMFN5UTdOZ0taYjBPY0Qx?=
 =?utf-8?B?NlNjSHRhQ3JFb3AzRTl3NXhGZkd2Y0I0ZTFGNzVKVWpnNDdISk5wVGxmcmdO?=
 =?utf-8?B?SmkrR1Y5cmNQeTVYNU9xakxFbzJ5dStTcXk1aVFsUVF1MWxXTFB1Uzl0MVNl?=
 =?utf-8?B?YjFrZ244TWh4YjNCUzZlSmpGa1Q2aW9wdHNPS2xPN2hCRmhFV0RQak9uYzg0?=
 =?utf-8?B?RHUxZm1YWnBUTDR0RnFyNWIxa1p5clhWdkR6SmJlNDFyRmtTeWhYZXZ4MXNq?=
 =?utf-8?B?WlU3U3gwUlNRbGNPR0ZjbTdlWFdMcGZQQ1htd1B6QWlwTGl4ME1NbWdESVg3?=
 =?utf-8?B?Y2U3UTZ1a0VqRDZyRmE4S1RFZnlaanE1Tm9TMjhqbVF5RmdHbHZTam44VEtq?=
 =?utf-8?B?NkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 776f01a2-634c-42a3-ad34-08dde690c9de
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2025 00:12:49.4937 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OB65bo9ZZRgUnBvCF0Ooi/QzJA+5LfpzHmk90z+nDSyKmWXLKK4SyuHfFZhmpDgppaPUR7LuawXe3EDnV33fHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7188
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



On 2025-08-28 6:12 p.m., John Harrison wrote:
> On 8/28/2025 11:59 AM, Summers, Stuart wrote:
>> On Wed, 2025-08-27 at 17:52 -0400, Zhanjun Dong wrote:
>>> Update GuC log buffer type value, make buffer types equal to
>>> guc_log_buffer_type in intel_guc_fwif.h.
>> This is just to maintain consistency with i915? Can you add in the
>> commit message that intel_guc_fwif.h is in the i915 driver?
> This has nothing to do with aligning with i915. It is about aligning 
> with the GuC! And there is no actual ABI definition for this enum.
Yes, align with GuC spec.
This enum should map to guc_uk_log_buffer_type_t.
> 
>>
>>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/abi/guc_log_abi.h | 2 +-
>>>   drivers/gpu/drm/xe/xe_guc_log.c      | 2 +-
>>>   2 files changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/abi/guc_log_abi.h
>>> b/drivers/gpu/drm/xe/abi/guc_log_abi.h
>>> index 554630b7ccd9..b1819679fa35 100644
>>> --- a/drivers/gpu/drm/xe/abi/guc_log_abi.h
>>> +++ b/drivers/gpu/drm/xe/abi/guc_log_abi.h
>>> @@ -10,8 +10,8 @@
>>>   /* GuC logging buffer types */
>>>   enum guc_log_buffer_type {
>>> -       GUC_LOG_BUFFER_CRASH_DUMP,
>>>          GUC_LOG_BUFFER_DEBUG,
>>> +       GUC_LOG_BUFFER_CRASH_DUMP,
>>>          GUC_LOG_BUFFER_CAPTURE,
>> Can you move GUC_LOG_BUFFER_TYPE_MAX in here as the last enum also to
>> align with i915?
>>
>>>   };
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_log.c
>>> b/drivers/gpu/drm/xe/xe_guc_log.c
>>> index c01ccb35dc75..470c83ead543 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_log.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc_log.c
>>> @@ -330,7 +330,7 @@ u32 xe_guc_get_log_buffer_offset(struct
>>> xe_guc_log *log, enum guc_log_buffer_typ
>>>          enum guc_log_buffer_type i;
>>>          u32 offset = PAGE_SIZE;/* for the log_buffer_states */
>>> -       for (i = GUC_LOG_BUFFER_CRASH_DUMP; i <
>>> GUC_LOG_BUFFER_TYPE_MAX; ++i) {
>>> +       for (i = 0; i < GUC_LOG_BUFFER_TYPE_MAX; ++i) {
>> I see that i915 is going from i = GUC_LOG_BUFFER_DEBUG and not from 0.
>> Should we do that here too?
> Not sure why that was done. The intention appears to be to skip over 
> 'uninteresting' entries at the start, but there aren't any. So starting 
> from zero seems more plausible to me.
> 
> However, such a loop is fundamentally broken if being applied to the 
> actual in memory structures. In this particular function, it is fine 
> because we are only looping over KMD internal stuff (functions, not even 
> data in this case!).
> 
> But the capture code does things like:
>          log_buf_state_offset = sizeof(struct guc_log_buffer_state) * 
> GUC_LOG_BUFFER_CAPTURE;
> 
> And that is officially broken. There is no mention of buffer ordering in 
> the GuC API spec. The official method for finding a specific buffer is 
> to loop through them all and look at the 'marker' fields to determine 
> the type. As it happens, GuC has always used a specific order for the 
> buffers (which should match what i915 was using but not what Xe was 
> using). But there is no guarantee that ordering will not change for some 
> reason.
> 
> So we really should fix the driver.
> 
> That means moving that enum out of the abi file and creating a new 
> 'find_buffer_idx()' type function that things like the capture code can 
> call. Or just scanning through all the buffers at init time and saving 
> named offsets to each. The capture code can then just use that directly 
> rather than calculating it each time.
> 
> John.
In spec, layout split into 4 sections:
First 4K is for buffer state structures
2nd, General log event
3rd, GuC crash dump
4th, Error state capture

So, for section 2-4, type and order are fixed.
In 1st section, each guc_log_buffer_state_t, describe the 2,3,4 section, 
means:
guc_log_buffer_state_t[0] is for 2nd section,
guc_log_buffer_state_t[1] is for 3nd section,
guc_log_buffer_state_t[2] is for 4nd section,

My understand is: as the target sections are fixed, the order of 
guc_log_buffer_state_t[0-2] should also has fixed order.
Let me confirm it with spec owner.

Regards,
Zhanjun Dong

> 
>>
>> Thanks,
>> Stuart
>>
>>>                  if (i == type)
>>>                          break;
>>>                  offset += xe_guc_get_log_buffer_size(log, i);
> 

