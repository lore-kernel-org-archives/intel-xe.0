Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D3A5CAC5AE
	for <intel-xe@archiver.kernel.org>; Fri, 26 Sep 2025 10:34:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D480E10E34C;
	Fri, 26 Sep 2025 10:34:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I8fzKuJR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0492910E34C
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Sep 2025 10:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758882846; x=1790418846;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=BSUISPd2BsesOXC+wWGXiqm1cb+s6OV//1jlRM1FQ1o=;
 b=I8fzKuJRVea37A3W8PuOZanSsXjrW1j2tRTzVXBgaYgkpJZenQjqBbsV
 rPktO4wbT+hWnNA59N3q/GADbFN59pbeu0zk/59Ba9yGNzGI9oH66i2fI
 ZYTgNibeFZi+Zw9gDjgALX/MjhDqfq/fbRzFQpe8WZ79LsjP2SxqS+82U
 Kx8VcdTBJ6IHIn2DisZmd2wM2voYDUGuKoHegLUoI0StzwZ+d2/sHlcB/
 QqtqgYBjpBdxs9nPEuADKUAhWh4q7/tPynXKWGwnntGo9n5UbY8fZVLuH
 okIGSqnqkXfdWcLFSh6+cEY7UezVVLhVUn/YRr2KyJA6JfStdQ+PXjb3R g==;
X-CSE-ConnectionGUID: sxisv0ENTVy/gJCmO7nm1w==
X-CSE-MsgGUID: 8o61JVAAQ3Wbw6RDvtZalQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="65061144"
X-IronPort-AV: E=Sophos;i="6.18,294,1751266800"; d="scan'208";a="65061144"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 03:34:05 -0700
X-CSE-ConnectionGUID: WsIL5pIMTi2nrmZMZYjnIA==
X-CSE-MsgGUID: cWiHdb8xRjyzLy6Ju9g5mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,294,1751266800"; d="scan'208";a="177510515"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 03:34:06 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 26 Sep 2025 03:34:05 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 26 Sep 2025 03:34:05 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.38) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 26 Sep 2025 03:34:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qb0+m7NCpafCRcO+IUR/OdiUVBB81McH2dz+IruGokgw1fexG9ed6LeCTY4VfduGZuMLXnCdWQdsBUE28Y5NDscTmTgZYymKg5I5PJK8AB/TXckXUybUzTMIEn7I9fPeTkd1FINxV9B0IFI+oQNPQO38J7x1HdFNfjRA9XHdBjg9K/t9f5r3NNgbULDR0j2Yl84fy7fEB390iMm/Y1EL8uQ814UWjNkfUIzPRBSYU+s9V8EFNF0plYTlbQLUYNCrxaT5qNlqn1B6pF87n3yUF4SCD//q/sJJxU3sEMz4YNYW1LfIZA1veCSQZbQCr7EQwQ0mrwoWwo7s5MiQsy7bKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rk2eXjbHE8qGuXUsrYcoeK0CobgTT5JLth/bFnephx8=;
 b=BvyMYFlRNXuzLzAK6lWBYf6Kz5sp84xWhiuIpoFd0Sij/wtDD1nDjyxXFR9Xp9bA+blnrn4z5f9EiK3doALc2dLoIGQtyxNJrDt+2dwrwFtKpAU3sJyhKoPE7iZlkjgS/yFwr2PXU8e76IH9yAX2r8QBeKdLORKVrr7suTK9smFpQHX/dC78naq7bMXqTriQBeD4zeO4sF1A6UpGq2vyJPFkkeN0MyPcIwWqZrBQ6Z3xrRYUdEQ8OdEDzfVaaX62xOBK6GNPZJWIcKChAJR8V7i4BoGEQuFxeNNbimp48SgzMm+8+NL80orAv/kj7Sm78f5wENQ2X0BIibUp0/45cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by PH7PR11MB6905.namprd11.prod.outlook.com (2603:10b6:510:201::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Fri, 26 Sep
 2025 10:34:02 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9160.010; Fri, 26 Sep 2025
 10:34:02 +0000
Message-ID: <09aafa59-f85b-4efb-8673-a3417a58ada0@intel.com>
Date: Fri, 26 Sep 2025 12:33:58 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/22] drm/xe: Move primary GT allocation from
 xe_tile_init_early to xe_tile_init
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20250925234628.2112163-24-matthew.d.roper@intel.com>
 <20250925234628.2112163-31-matthew.d.roper@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250925234628.2112163-31-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR06CA0190.eurprd06.prod.outlook.com
 (2603:10a6:803:c8::47) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|PH7PR11MB6905:EE_
X-MS-Office365-Filtering-Correlation-Id: aede4691-ba36-45ec-a6b4-08ddfce83616
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aEZRQkZXOTlGTktmWllpUXcvd0NqbHRMYzZJcU02ZUZaN3ZlNVlOdTlBT1c3?=
 =?utf-8?B?MFgrUEIzVzBJMWluT2htTFBaUVZxeDZWcmFXSE4wczg5RFdLSzl1SFZoaTVZ?=
 =?utf-8?B?RWFpdm5QWU9QTjBudm1sYmhKdlhMZklBRkRwMjIzZHJQeEpIQVNkSDcyVkZS?=
 =?utf-8?B?WjA2cWxOVUxUM2dNSE9NZE81V2ljbk9XemxWTllaMmtnTDl5SGdJb28rTlNn?=
 =?utf-8?B?eGxLN1lUb0FXQTRLUnRESVpvdGIveTd3eURCN2Y2cnNPUm0wM2NhOUMxdFpD?=
 =?utf-8?B?TGlMdzdrcW5JUzRWQklSQkNWZGJVYi90OWtpZFE4VjJERHZYZFdQV2xsQ2ZX?=
 =?utf-8?B?bERYVGR0ZW5yeGljb1BXQVVQVlhOWm1MOEh3ZDNqMEhaYWxLUkFFUTY2a2JF?=
 =?utf-8?B?QWUwR3dCSVlVU0dLU2Vwd0Zuc3doTVo4Q3RyV1JIenpha3JSTENXUDNWWHNs?=
 =?utf-8?B?Q2ZLeG9wTk0yVVdkWStjN3pkU2M4cmhNSTVleTN3a2xvcjdTUmRxM3I3d25V?=
 =?utf-8?B?YW5sT0FNSDN6YmpVL1h2b1o4M05FSC85QlBaNkRaemNLQW9zOWVJUVNMMGdW?=
 =?utf-8?B?ZzJyOWZteXV2bzhiQnBFRjQ2amRDTll4cjJFTXMrQytNTXpmU28rUWo5bHJo?=
 =?utf-8?B?OG52cFRlVi81dHNwQzRaTGxRRjNTQVU5VTl4SGQ3d1R3Qm9FVmhUbjZVamdX?=
 =?utf-8?B?dnB0bGI3K3BIS1RXRHdoRmlxMWF6dlRZNUNQZlZNbWdzV0lpci9GN0h1Z1VQ?=
 =?utf-8?B?MmJLQUJnNCtwdU96eEtydWdXbG00VzBrWDM2RTFkV0h5eXk5NlZKMlRhRVRj?=
 =?utf-8?B?S0tZTnIrRGhCU1ovSVVVV3hNdXRmOHM1cnVYMWQ4Wm42cnVmbm9XRXh5VENZ?=
 =?utf-8?B?ZEpURi8vMC9EcGFCSWxzUHRlbVFGYWtJN2VSYkFaNHlVdlNPWWhzVzczTm5z?=
 =?utf-8?B?aFZyTXNJSWxYcXYySTdwd1JKV2JnQkFhSzJiZ01NM3NEOTVyOWx4aVRtM0kr?=
 =?utf-8?B?Q1E5dnJwaFF3VFZ2a0M5UGxrYzArUC9Cb0svMzVJMTY1TlRQd3B3akhzNHBo?=
 =?utf-8?B?L08yUVAzcVJCQnY1RHBSbjJ3ZjdYc3lSZm02MTNUc3MwQ3RFcDNmYkJJZjBn?=
 =?utf-8?B?YzRYOXdzb3NOdzNtMVpwZkhBOGpUaUc5VUpaTXZyN1B1U1dvc0V0UTNqcis5?=
 =?utf-8?B?K2RIVUF4L0dFRGNSYksvM0dYUE8wUmFKWXRpUEJuVVpGcG1GZ0g2dTRPNVUw?=
 =?utf-8?B?bFoxQjhqa2dXaWNlUW96bjUvVzVGaDNQRkNZaHdjaWdSblp5Nk9PUVIwMGly?=
 =?utf-8?B?ajF5dVpiVHY2REQvUGVpWlBKcTdSVDNoQW9sbkJmMlIxM3M1QWc5UG9JQVRJ?=
 =?utf-8?B?Y3cwZmxjcGlLelZJc09iY3RqU1BxdE80dFNrc3N0dVFSUWl6WjEwUmVnYk84?=
 =?utf-8?B?eGFiZ3EzbTZNaXcvMFhHWkIybWFJd1Z2UDdWQm9Ib3ZuQUJ3U3ZacWZic2xO?=
 =?utf-8?B?RitXbWFkWi9TRVpnZForS21xc0xINm8xUHZRUXI2cWJ1YlZlTGYrWnNKemFu?=
 =?utf-8?B?OGo4TjJibWpmMnViTGUxK2hodmtmZnZ1dHVhcjhtdGJvSkV2bzEyZjdyajlj?=
 =?utf-8?B?b3EwU3VlcGdrSlFMYlJlK3FyV1lrOGFreEs3YWlOUWx4TWtoMzZleWcwV0R5?=
 =?utf-8?B?WlEyOTJJcTJ1cytQcWNhenh1N2Z6Y3FPZG54Rkp0TisxZWpEdlAvZmFnVWE5?=
 =?utf-8?B?a2JJUGVhclJ0NkJXU0kvWjVUNEpDSEtHdm9lYjQxcUwwNlBjUG9mZzZpVWlF?=
 =?utf-8?B?cU4zWlNGNkVpeCs5QW0zVWhnelBoWm4zUHg0ZFAycDFWeXNBcEF2L1RGOHYy?=
 =?utf-8?B?MFBUU1NqYkhyMWR0L1hQaVRmN3B4a3VGdEFzT0J5djhDRGFLODZMaXc1MUJF?=
 =?utf-8?Q?waui41iQpF+YGWqIqGfzhZX/DIMBmgoB?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NzFkQUh3a0ZydVNPaHZoVFptYjJpMjMzYkd1THJXMGw1Rm1RMlZkYkZvS2pr?=
 =?utf-8?B?YlFTKzFwOGRlRTdKWXVvankwc2N1VWg3QnRoOG1nZUxUUHI0Q042cWNHSFpt?=
 =?utf-8?B?ZUpOTEhHVUV5RmR1YXF5SDZzUm5MalZQSTRENXI0U3dMTlVsL245VCtHRUhl?=
 =?utf-8?B?NWUvUEJvQU9rMkdmbVBPdmJYUVpFQzFzclJqZjV6RitZTWhFRW1SUEk4RHNk?=
 =?utf-8?B?eURodXExMFc3Mk4vTHBlYjdwRXhSTEtveERMYlU2RDVEclB6TTBiMHR3ODVQ?=
 =?utf-8?B?K29BWnF0UU9UNDRVMm1ROXNvczZwUE1lY0x5Nk1mR0luRFkwblA1aXFaVVp2?=
 =?utf-8?B?ZVI1Um0yamhHRHBFNzdHVS85cjhrVWlnZFVOZkxBV3lrT2F4d2dVUXMxdm0v?=
 =?utf-8?B?SUE4T29lZS9FbWV4NUt2SFRtZTdheU5qNGgwUWhQREk0OHdhK2V4aEdOMGtI?=
 =?utf-8?B?c3NsUVFpZ0ZQY1RHb05HMmpIVTM2RGlMdU81RG41dzNNNitpU2M3M1E0R0d5?=
 =?utf-8?B?TDRlWUJEaTBHL0pPNzhsNnBhVHk4WFhBc3dqYmJYdGp1ZHYvOVN0WEFMOWhO?=
 =?utf-8?B?UDhTMnJYQzMwL1RRZnNKVWVYdHJzY2w2d1orUUlicjRGa3d4QUsxNUdQSC84?=
 =?utf-8?B?YmhjZDJMenpuMmxlcEpxaFUySUJTY3RVUjVtSlFTeUN2WG5va3hYK3VOOVMy?=
 =?utf-8?B?anpVenUvWUY0bVVuZFRGdDNzSTg3bElNYnNiSkZNTVg2YWZDUDVXbmVIZEFX?=
 =?utf-8?B?dW9TbkxQTkRhL1lTdVRmUXZ6RkZhbkNDcGVKemNLbVRHL1VhRWFIK01nOXlY?=
 =?utf-8?B?eks3L3Y3bXQ3UHRSdExxbDNvdFZzQUFpU3Z6OGRRYlY5b3dtYmpPb3lCVnhr?=
 =?utf-8?B?OFE5UzdiN2JRekJsUzV6c0IzMEFaWnlweS85SVExNXZIVk53bWNkYWNLS2k5?=
 =?utf-8?B?a2xsSFc5TkViempUSno3ZjhXd0dBL1ZMQ1JveE4wOEFQNkJEN0lFbkYrT2Vm?=
 =?utf-8?B?WDNWbGM2SDhVeC9ubVorK1UvY3IzYjhvTFVJcWlPaEd5clhDdE5CVlRnNngv?=
 =?utf-8?B?MDUzYnNuT1pub1BlUlFBTmFhNjdNRmsyWHV0UHI0YTdnd0RJOGpJUmJZbGhM?=
 =?utf-8?B?b0xJUmhBL0FhWWZGTVlJQm15ZWlrWk1UWCtoRFo4R2hoNXRvRndmcU1lOUQ4?=
 =?utf-8?B?WWlGdGpBSHJ1WGl3VVpBQkM4c0JGdW53UDNFQ0Y3eVV3Ujh6V0VpMXEzeWdB?=
 =?utf-8?B?RWJTZzl2cUZuaVFHeFNGZSt6ejd6aTBNcy9IazJFbllYemhtZG1hMzV6aFBZ?=
 =?utf-8?B?UHVFNVRqYUdEYmNYeXNEdW4vQlFJeitYaVRsTGhwTHo3MktqdFJUMlJ0YWM5?=
 =?utf-8?B?QThaMkhCMG5UNnMvYUcxdDl5dUZPM0JCRTJPcGdzbXRnN1Awd21LdCsvZEpt?=
 =?utf-8?B?RnZLNU5QUGU2UnhSbVdoM3R3MFFUQi82ZDAxU1RNaFpTei9pNEdNdGd0cVJk?=
 =?utf-8?B?YUFJZDRlTE1hOUxNWFVSWlBYRWViNUZYVVNOdXdMa0lOamo3Tk03akFJK2Jr?=
 =?utf-8?B?Q3NpdHVIalRpZnVLc1U0RE91cFl5RDlZNE1vUzI0ZnVkTWpUYk9aQkxrYlgy?=
 =?utf-8?B?aTNBajVyQ2I0U3lvbXBzc0o0My8wUkNOVnVkSk5vMDRSVERVZnhuY3pzaFRk?=
 =?utf-8?B?NEhnYlhabVZoNjV6UVJ6UU13emZRUFpydXBLQUtKQmtZRXhxNDgrKzcwZkc0?=
 =?utf-8?B?WVRVTFZEL0w3OFRWa3JNdVVaUWszNmh1QzNYYVV0T2ZEVW44Y1gvWTNVK3d2?=
 =?utf-8?B?M2dsNnkwcTFWTGZYclNBQ2FOb3NjS1hzQnI3RmFhbkZ6TkdhMlJhTFVGQ0hj?=
 =?utf-8?B?OXhLK0xldnQrTVI2Tm5YVGlwZVAzaS9HVHpSNjhubkM2bnNwd1c1Yk1xYVlB?=
 =?utf-8?B?dkEyLzF0M0gvdkgzTS9LY3Q4dVUrKzFYMCttUThaamgySWZ1VTJvWjJ1TEc5?=
 =?utf-8?B?UU8wQ3Y3VTBldWNUVG1hMkxCdGVyNjM4NittaHlQNXZQeWNjcmlsdUZTclBD?=
 =?utf-8?B?Y3AxL3FTcEdCNzRLbTc0YXlYWTRyczl5SlVkV0w3bTFMSFZ2WVc1amJXQUd2?=
 =?utf-8?B?TVhWWDNwaTY5eE9UMnMwTmhrcTBqa3BGNkY5UHo1WmtvTm9ESXlIUUdIZG9T?=
 =?utf-8?B?eWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aede4691-ba36-45ec-a6b4-08ddfce83616
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 10:34:02.7494 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p30PCGJtdYb4HwLlVDxTvR1F8gdhM9H5VUDehJKbBIrlnIhXePG2cI0xmsODRvzxMnJ1xfJj5FJ1DXTsfD8RJt34jORmGpFkOPt4hWUQi/M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6905
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



On 9/26/2025 1:46 AM, Matt Roper wrote:
> During the early days of the Xe driver, there were cases where we
> accessed some fields in the primary GT's xe_gt structure before the GT
> itself was formally initialized; this required that the structure itself
> be allocated during xe_tile_init_early().  A lot of refactoring of the
> device probe has happened since that time and there's no longer a need
> to allocate the primary GT early.  Move the allocation into
> xe_tile_init() where GT initialization happens and where we're doing the
> allocation of the media GT.

except that it doesn't work for the VFs:


<6> [178.503309] xe 0000:03:00.1: [drm] Running in SR-IOV VF mode
<1> [178.503346] BUG: kernel NULL pointer dereference, address: 0000000000000008
<1> [178.503364] #PF: supervisor read access in kernel mode
<1> [178.503373] #PF: error_code(0x0000) - not-present page
<4> [178.503441] RIP: 0010:read_gmdid+0x111/0x450 [xe]
<4> [178.503898] Call Trace:
<4> [178.503904]  <TASK>
<4> [178.503912]  ? trace_hardirqs_on+0x1e/0xd0
<4> [178.503928]  ? add_dr+0x90/0xc0
<4> [178.503945]  xe_info_init.isra.0+0x455/0x9e0 [xe]
<4> [178.504281]  ? xe_device_probe_early+0xea/0x230 [xe]
<4> [178.504565]  ? pci_write_config_word+0x27/0x50
<4> [178.504581]  ? __pci_set_master+0x5b/0xe0
<4> [178.504598]  xe_pci_probe+0x168/0x610 [xe]


> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pci.c  | 4 ++++
>  drivers/gpu/drm/xe/xe_tile.c | 4 ----
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 976002aae301..bd21940a6541 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -745,6 +745,10 @@ static int xe_info_init(struct xe_device *xe,
>  	for_each_tile(tile, xe, id) {
>  		int err;
>  
> +		tile->primary_gt = xe_gt_alloc(tile);
> +		if (IS_ERR(tile->primary_gt))
> +			return PTR_ERR(tile->primary_gt);
> +
>  		gt = tile->primary_gt;
>  		gt->info.type = XE_GT_TYPE_MAIN;
>  		gt->info.id = tile->id * xe->info.max_gt_per_tile;
> diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
> index d49ba3401963..10545654f9eb 100644
> --- a/drivers/gpu/drm/xe/xe_tile.c
> +++ b/drivers/gpu/drm/xe/xe_tile.c
> @@ -149,10 +149,6 @@ int xe_tile_init_early(struct xe_tile *tile, struct xe_device *xe, u8 id)
>  	if (err)
>  		return err;
>  
> -	tile->primary_gt = xe_gt_alloc(tile);
> -	if (IS_ERR(tile->primary_gt))
> -		return PTR_ERR(tile->primary_gt);
> -
>  	xe_pcode_init(tile);
>  
>  	return 0;

