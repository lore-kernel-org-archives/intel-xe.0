Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4081CCD1BB
	for <intel-xe@archiver.kernel.org>; Wed, 22 Oct 2025 15:30:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 813A310E7EF;
	Wed, 22 Oct 2025 15:30:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kw3Yf687";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3FE410E7F3
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Oct 2025 15:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761147008; x=1792683008;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Hstnfc4QjkpfhgQ2aXYBjsBYyNrGNNtX9SPLeAhhlA4=;
 b=kw3Yf6870TYpkv1bXDH87p2eAC17UEO8MWg0SeznXA831Qz0wVXDbH8y
 ZhMgW3o7WYHuzyk+RNObt6b/LhnFGnJnKWD5413FNo7MVVpoPHkiQJFi8
 9KGrP3GQcLT7KMFfXwg3S5QDCy/dXxQcCrU12A9jcYDYe8SL3IwrZZTOX
 /p4HQizj7pvWDADdMOTbaomTqtYb9yCFOeWPLeoXRX3/ckCW5XQm1EtTm
 ppfVfBXfijy1Q3YEnLT1f2NVofI7k4EOeqw8VPNqwRaPg7aoQjXdUPPnw
 igxvB4LpHctObI7tslnRqsM8F3XwsGgx+ZIhy7ye18WVgcf6sod73mNKM Q==;
X-CSE-ConnectionGUID: MhSDIboJSH23O+i8Wohl9g==
X-CSE-MsgGUID: NtJSnSCnSpe13AzxWIEYSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="73589938"
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; d="scan'208";a="73589938"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 08:30:08 -0700
X-CSE-ConnectionGUID: m3XYIjbZQq6yvX0HFnyY7A==
X-CSE-MsgGUID: hlVU+SaXTzW5rG4Z9u/hag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; d="scan'208";a="214845292"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 08:30:07 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 08:30:06 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 22 Oct 2025 08:30:06 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.66) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 08:30:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TsVWV3xaU189q7Wb0JdgxhY36rnAod5YNmerEeAhUWmY1iXldAtBdA7w2TPOp19ZeSCUUL/dH1JDMnfeFCuIQ3l6Dt9SMtVlBT5OL3MCvMrIikhp3R/gwnP6hUIJjD8nW7UCcgqInralg5Sc4ej2KtflW6Og7c9LtAsoZnZo2ycfyfskQO793tY7JLFEK52UEKTkRiCFk5QnqEN7x1vpWwQ6wkzrK2krwqn976R5KBQ3duZaZnv+Dnq2FX3p1vZKv964leC7dwlsoxM9oCY572asURdIu+JW13bEyTWX4z/APEXc+ka8E2lvXInYtmjwLonsHu9ar9/SNRtYFstUJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M6yjWpeCHX4Djjc+BQfGUsfygIGkjO+A0yRjIRhejaI=;
 b=J2yInHlHjzn/Naa4tq6akX4lJJNQmVc26QN9JDmaahyzyX37jQ0tFrt/+Km/Whz0BIjxu+vNuwgHZOz0QNuw9rf3p1g4njtvg/5EVP2F20Lol1Oi8cpyZ46jrBm29xmMLEHIKJvRW8TpFmjTYOCEXXKG26vHkz22NCu5v0orz2gD9aACQCPxYrKbCHPCwd3PUtXis660tmknoYH4TQE9ZCeBQP6RTGKcXNWaOavHz/SZFY4EAXeAH1xq55aXUUTFMO1tS1mrD8IiqQOK37qg+laZ3pstY5xnZMkcXjGkZCd3pQSEJsFBUUr8pvckK5zA77vOPqT6s5FyyUaQ5FBaQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by BY1PR11MB7983.namprd11.prod.outlook.com (2603:10b6:a03:52b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Wed, 22 Oct
 2025 15:30:04 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 15:30:04 +0000
Message-ID: <ba0ab63e-a552-4a25-8900-e01bac7b2408@intel.com>
Date: Wed, 22 Oct 2025 17:29:58 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/4] drm/xe/vf: Update pause/unpause() helpers with VF
 naming
To: Raag Jadav <raag.jadav@intel.com>, <lucas.demarchi@intel.com>,
 <rodrigo.vivi@intel.com>, <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <riana.tauro@intel.com>,
 <daniele.ceraolospurio@intel.com>, <badal.nilawar@intel.com>
References: <20251022094246.3584785-1-raag.jadav@intel.com>
 <20251022094246.3584785-2-raag.jadav@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251022094246.3584785-2-raag.jadav@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0158.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:67::7) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|BY1PR11MB7983:EE_
X-MS-Office365-Filtering-Correlation-Id: 82f8449a-a647-4eec-7f8a-08de117fdf40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MmEvMmFNWlJ2dW5HVzQxeldkVnBWdXNOZEdCdlQrdHUrV0kyM2JackFVTC9B?=
 =?utf-8?B?QkVoL1VTdUlrSmlhRnhEcHg5aU53UFB5WWc3WlB6SUE2WTA0OElyc2RNZ2ps?=
 =?utf-8?B?TStqazNOdGJDN1BJSHA2emErbldDWWVQVzJBeWdYaGlrWVFmV21jWC9WRXpH?=
 =?utf-8?B?cjhFd0lmOFdhOWphb2VKRjFES0cyR0ZqT2g4Z1V3NENsLzdyZVJ5M2FmQmUr?=
 =?utf-8?B?aGpYYWRaWGcyNGJqRXAyOHRKYk5hRVA4b1ZRSWFoa0xGbzZ3VGJ0SnBtK1cw?=
 =?utf-8?B?OS8zTW1BYVVWcktPOXNEMTMrVDZwRjZCemhLYko5M0tORXBKSWlpdFZTN1k1?=
 =?utf-8?B?MFpYRnJtWWZlNUVDbE1YTUFFbXNndGVQRkxRZllpanlFcG0ySzN0MTFoYTZ3?=
 =?utf-8?B?b0pTZ0E3TGd4NytTczU2Y1pSRzd6bU5oc1N2T2g0L0czWWJLdExFV1YwODdU?=
 =?utf-8?B?N1lBb1dWOU9rT29oQmd2OE4xTnFlME1sSXFuVENTcVJ1TnBCdWw0Qnh3S21l?=
 =?utf-8?B?bTZRRzIrWjhIQWJXRUQwNVVQOEFxVXNxNWZjbGRQMkNFdGJ2K3VsdjYxMWxu?=
 =?utf-8?B?V1VLdXhSMUhucllxRmlnVW9BeDByU0c2L3I3WjltOEFhblZrQWRmTFZvQW82?=
 =?utf-8?B?OTMyUitSdkVDbHVpdGtRbno1STlmYlliUGNXVCtkcUg3MTMrQ2JtaXFMaEtZ?=
 =?utf-8?B?cVBMMzJVOHJ1S21hR3k0aGQ2UFIvYXF3WEZPMW9TaWFCZEYvd2xpb0liMVU3?=
 =?utf-8?B?QVU5RnM3eXE2V1l4dXhmQmNqK29TQjdjbTdGSk5zTDNXSkVFNmdVQ01QK1Jt?=
 =?utf-8?B?ejAzZEdVTGJVN2FrZnBLZjVmL0JhemhiK0NoM3lISHRFZ0psNE5zdTFla290?=
 =?utf-8?B?M1Vwd2N6V1J0VkdUdkIxZ0pseE56VnlhalBvWEFXV3VPOGYyVjB6azdYVnVp?=
 =?utf-8?B?UGZVazBqaXF3eEhqdzJjY0FlVFBoanFqZ2JoUWozNFFpemFacGtPZlN1cWRH?=
 =?utf-8?B?dExuZm9NdnhRU0hPUzgrem5yL0UyRUk0YzFYdmlVSFFnL3RsVU9OOHhKaWhH?=
 =?utf-8?B?elRlMDZHYzNwanliSVhHQ0V0MWluWm1xSnB4NUx6K0lKb0FMaHozcHNrMUhu?=
 =?utf-8?B?RytRc2VsSWk5ZEtvemlldTgweVprYmg1am0wRGcrSmxiVlVWNmJPNXlObWU3?=
 =?utf-8?B?akF4WmdNbDNiSmdScm5KdWE5cVMwcVZmc3FYZWxTanI1UTJ6SHhDK0VHeitX?=
 =?utf-8?B?R0pSU0dsbTNsL2VsaDdudTFCMnBES2xpS3JHN2x0cFZieWRjc3ZrR2dhOW5s?=
 =?utf-8?B?TWFmZ20vZGZhSDJ3RzZtK3MxZElWbDRWc3dqWGh0aXVCZ0lOT3dQRE1rYmE5?=
 =?utf-8?B?ZHBHNW1jTnpGYXA1elEyUFZzb0FUdWZwT0J4UnJWVmErWjFTSVM4NVJjTWZx?=
 =?utf-8?B?bjNhUHZaMS9RSVB6a2lRaXpuNWhNMCtNZWd6K0hDTHhxVU13NE5OR1FCSUYv?=
 =?utf-8?B?ZTVXTWhlcjdsTzlCTWNLRGx3M2FYaTlsUlN2QkxpM0xiVUkwTEphS2dLbThD?=
 =?utf-8?B?V0RnV2lpanp1bHdPTmRXQnJCekRHeG9RamtMbW9HUWRtRlZyUEpuMFQyb0ND?=
 =?utf-8?B?QzdnU3ZpSll5YTlsV3d3ZTVMdzZxMHRHVkF1YXRrdmJ2anl0TGUrOFZKWm1B?=
 =?utf-8?B?MnY2Qlk4WDB4Mnc5bFpXK29CNVJtRDNwQnZ5STRFYTlwcHRERS9uNHBuWmJ5?=
 =?utf-8?B?VUwrZDVYT1ZHa0NrUm9RWEc3UHFuUFU4R3o0Z2VzVHpTbkVEbkxsQWZzdFZR?=
 =?utf-8?B?QmtXVjVuNU8xYUFoaWsvbVBaY1dHdWV0UzJSWlFjWUhuZVE0UXJ2aTZTc0ow?=
 =?utf-8?B?aVBQOW8vRjFVUGYrM1JVWFkyRitmMXk4ZllTa1RWdm1sY2ZsejM4NktBcEZt?=
 =?utf-8?Q?T+mR6Q8p0p8ymFeAWCWjfST1E3ub9nER?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cnFPUmRVY0Frb2pha0xjZnU0c0J1L050WGFiMnQ0WkFnZHdSbzJrMDJKUWZv?=
 =?utf-8?B?K0poRjF0OXRtMFRoZXVSUzRTSlI1eVZsNG12RDc0bk1zNkE0dVJWVG11eS9l?=
 =?utf-8?B?MzlhMXN2MHRndDFIVVdOek8vUkhHTVU2cnFuMDY2eGhUeG1GQzlCSzg4cG8r?=
 =?utf-8?B?QWpOMnJhSGZmWFNPdXlBSnhrbzBuMUVia21NTVBkVldISWIxcHgvbStTbTZw?=
 =?utf-8?B?bHFQZzh6V01reGZiT0JSd3NyeDZ4V1VvZWhZTmlrcStpOWxFemhMcmczS01U?=
 =?utf-8?B?V3dXdjYrRWhxZkU5ZnlwY0xuSk0rQkNNS3hUTjVoS29GWGdOUkJNQWZFd0Rs?=
 =?utf-8?B?aXJuZGVtWkRHUEYyeHM3NzlXQ1BnNmRUUjZaUnBybFVHQ3U1QzFZS0RMRmdF?=
 =?utf-8?B?N0ROSks1T09FK3l0Yy9MbXlQRXJGK3J4UnJ3WXVKRVZpTDNEUElhRXMyWHpG?=
 =?utf-8?B?bmtpd0h1L1VZV3J1TkJyZEZZMUM0V2VBMWdybVZDZ2JlWXd5QzN0WHBxVTRC?=
 =?utf-8?B?QzJ0ZmpyTXV1NHFGazVQengyak5JaE5HVzVmRmtMbXptK2dPdGZSV3VmRkRv?=
 =?utf-8?B?Mzl3QWlRTk5ka1hGOW16eHR2QmczeXRudkhzT0VySVZJK2tYTmtaVERrU1gz?=
 =?utf-8?B?TjJCOFIwKzZoY0NySSs0YTNyWlZUQ0lRVE1yeFovUjd4RWlUU3JYQ3JhRzBs?=
 =?utf-8?B?cnNrVGM3bWNaMWowM1l0TzNzMmNpTzRJaVBJU3B3K2ltRElwU05KM3h2L3JT?=
 =?utf-8?B?b2pqTnljZG4xaGtXVEZEU2NsbFJoYk9GamdHQVJVWU1CcFVFTXNPblBYUjhl?=
 =?utf-8?B?Z1BhRHhkRjdISnVWN0p3cUlqd0ZQYW0zL1phazZnd0lTMTM2R3dESHdyc3VK?=
 =?utf-8?B?eVExM1BzYkJ5UlBCbExtR21IR3hmNHZyS3VZQzZNZTlWZmZ3cnZZR25ZTFdu?=
 =?utf-8?B?QWNGQzdRdGlJdmJHbkh1MnliQjhHVThvSzl6b2JnRGcvNDVSVmpjaC9WREJh?=
 =?utf-8?B?amdXREpCUk1tWDZCdldjYXoxZnduSG9yZlEwRUlvNE9XWjV0YXZQdGIyU0FS?=
 =?utf-8?B?OTlwaFRhVGprK0FkeWZ2c3EreUlwNzE4bWkvMUFrRWRKWGFiWFRFMlVhK3V0?=
 =?utf-8?B?VmFWd042YVpRemgySllUN3dGaXA1YzV5U3hiSEhUdGczSmREMmZrenVtU3Bo?=
 =?utf-8?B?eG5vVTZ6c3hZdkJOTmJ1Q3lpTjNCV2hZMDVIelFFeHdwT1BxcXNTY0dWNmJF?=
 =?utf-8?B?NWxxMnorV1NLUTlPZWpuVXAyMEFaRjlXd3dnaktjWnVqUFRFN1BlZ092bGR0?=
 =?utf-8?B?L1o0TWV1azg5bjdDT0hYU2NzUFRESWQ0SmZUS0lGYzIrc2RTeWVDZmQ5Zm53?=
 =?utf-8?B?dXljUUlmRVhQcVFSMmhtQUNTcHBwZmRGeTllNzJieXFBbnMrVnc2T2ZydERj?=
 =?utf-8?B?c2dXNEdacEdzNThRL05qOXlKL2VIT3RtanROQXk1VjBCT3kvTXBLMll1bG1K?=
 =?utf-8?B?UEJISjhVU1lNYjJveWhZMzNtMXN6QmtWYnNmK3pyZnllNmt3UGF2UmU4Y2Ji?=
 =?utf-8?B?a05sL3dOMlQ3aFAyMFdjUHcwRUVFb2hHVFNaRjFJZG5aNEtrRVpGVGV0TEc2?=
 =?utf-8?B?UmEweC9MNTh2UHA3NkhmQ3VjYXN6UWlGMWhrR0FvQTdDa1V5N0RUcnRORThU?=
 =?utf-8?B?WVZnS29oSjZJa21Zd1lMdi9uRDhxcGN0T1hlTm1GVkFTeEpWbmRiaWNWdjhh?=
 =?utf-8?B?YlFYK1ZXVFRGemFQcm1ad1pHb1lwYVdZdlczeVVoNWNjWGhhN3NUNkxjUzRp?=
 =?utf-8?B?MEcwblI0dW93WUJranFzak44eGgxd3JlUWdsZjVRZnBhajFRd1JmRkEzMDNS?=
 =?utf-8?B?QWNmbGZrR0RtRWExTjFXU050RTJsMS9VbngvV2hQZitZaGc5cDNBM1FkTGkv?=
 =?utf-8?B?L0tDbkdhamk4SUdmdlhKS3BjYm5rZkx5OXZSU0JtbzRYald0WVBTM2E0V3JQ?=
 =?utf-8?B?Y1g3UG13Z0l6KzhtaTlLYUJZMWFvTVJFc3N6YWxaM1F4bTNxSHRKejZ5SzZ6?=
 =?utf-8?B?disxTDNKK3FhdXgzcENBNlMvWkFrMWVxWnpCT01HWTlFeHB3TmFkdEZIbDhL?=
 =?utf-8?B?U3oxNjJIb3hXeWhLY1RWQ0R3b04rZGFwK2VoQlhQVTdGUXJNWGdHZ2N5OHpD?=
 =?utf-8?B?aGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 82f8449a-a647-4eec-7f8a-08de117fdf40
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 15:30:04.0700 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2u9kOiJxLRPP4IM/XWNSncNzRWC27tAdhFdxr7dnP2vfqMekxnQX3oyDlPP5fDFiSmALKPtBlj53XCOdo3BZp0RtAIXDS6Xi5kov2SqwubU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB7983
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



On 10/22/2025 11:42 AM, Raag Jadav wrote:
> Now that pause/unpause() helpers have been updated for VF migration
> usecase, update their naming to match the functionality.
> 
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---

...

> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
> index b49a2748ec46..cb5cc2cc9497 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.h
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.h
> @@ -20,10 +20,10 @@ int xe_guc_submit_reset_prepare(struct xe_guc *guc);
>  void xe_guc_submit_reset_wait(struct xe_guc *guc);
>  void xe_guc_submit_stop(struct xe_guc *guc);
>  int xe_guc_submit_start(struct xe_guc *guc);
> -void xe_guc_submit_pause(struct xe_guc *guc);
> -void xe_guc_submit_unpause(struct xe_guc *guc);
> -void xe_guc_submit_unpause_prepare(struct xe_guc *guc);
>  void xe_guc_submit_pause_abort(struct xe_guc *guc);
> +void xe_guc_submit_vf_pause(struct xe_guc *guc);
> +void xe_guc_submit_vf_unpause(struct xe_guc *guc);
> +void xe_guc_submit_vf_unpause_prepare(struct xe_guc *guc);

can we have this "vf" as a suffix instead?

   void xe_guc_submit_pause_vf(struct xe_guc *guc);
   void xe_guc_submit_unpause_vf(struct xe_guc *guc);
   void xe_guc_submit_unpause_prepare_vf(struct xe_guc *guc);



