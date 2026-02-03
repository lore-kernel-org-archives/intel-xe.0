Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ED59E87842
	for <intel-xe@archiver.kernel.org>; Tue,  3 Feb 2026 16:47:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C507910E712;
	Tue,  3 Feb 2026 16:47:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IIPGiBB0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 366D510E712
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Feb 2026 16:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770137250; x=1801673250;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hCfycSiDZ16EeetiC1+SnElTbsqNWPI82HhEzum7UUc=;
 b=IIPGiBB08w1Gr6nZvGDXBgGzaRGkHiNkLSHMp6fgCzJYNxCXdjjdE8b4
 245nlSDpKnW7sSpszeItsiMr44hi4WRs4/j8GHKbafASGuAr6wgzdL5JM
 JPp5sQ9ctSh9nJzPaD1A6OgfwE7Ikba/HwIgNg7yZsRvAsO4StEccDwny
 vRS8KbbkU0Dt88fMUVN5qnXyRjiC3sCOUC2HasOetQ+N+Mtw58Xy2AHsD
 M8Qm4zJyTzRVoeLUnA+gcmta14s1RZCORW2AI0VcaDfrrqsN+ZXSTHEOv
 BnAEWbYljQdLpBSwzIr8Muf9p+ds2RSQv1IQmfSBI3QItIyd/9/UKxfI8 g==;
X-CSE-ConnectionGUID: SrwcRVS4T4GWm9sirfJnjw==
X-CSE-MsgGUID: Xe9cxU3DQOy4w4ywCdF7jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="81627871"
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; d="scan'208";a="81627871"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 08:47:29 -0800
X-CSE-ConnectionGUID: PaxImoCkRbm+asZVLBMZew==
X-CSE-MsgGUID: hA6RgzF0RFubjMPts3uaJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; d="scan'208";a="214860222"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 08:47:29 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 3 Feb 2026 08:47:28 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 3 Feb 2026 08:47:28 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.64) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 3 Feb 2026 08:47:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zRTB/EEVwBa6ZWoigbBO87DlakTX2iAk8NplvURivTNHZ6K+MDsWe8pxg8MgGmo0vhMaaUE/BVsChuCaGKB+oLRdeum/mJ9sAwHOr0MZTAkmrUKfpuIZB+T0nwUCAbq/sIfHr50WhnCRt+iyjbn4Zc3k6BnnyBCzvO1VZu0Tm02LQjq1jOefVmFHmGvPxNoo1j6BkJCblDvGn7DA2UOpPB9tiDIJjTOAqRKMlAejb9SqpzfH/ylIio1enkhVf4dk0OSezMNh/xZVcK3uGNLVHZEpreefzhuJ9xYDZHhUi0mDMH1vUOjbEvGx8TkSTtkocRT5jTzIZuBI2jXhvY1+YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kk1dfqDnvhSe4sUmnmd0vcHXOTuZzwO5Y979VPe3ae0=;
 b=eLsAQZaLEhn5mE/CdGpMBgp3hMNSqcKdoDJBWgNouhZXNCiH3ne30yq4LYkBTJuHqTU6EYD+NMNCCS5pdaV8R3V1GLB1E7XMPsbCcQCktoCbeISZIlWLLLEkUN1ngoAEBy51e6z5466BDuZj/W1/PjbXfgWQ1dH3Nxc9SGL0dImVCYo9AbC9v61abKJwHqTaeF3W3OEUYJOkbJjuLHmgTqAlxMLOdWVzABfNGqY1C16SPwTwkF/GX6/eH2VP0CBxZ4PIcw4ku55QLdMpebCGaU0TPNUicJSfAurtbQmFPA118XoxxfnXYer1brxAUqjAOPX7BPPCMzYuS4BI3jjCEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by CO1PR11MB5011.namprd11.prod.outlook.com (2603:10b6:303:6d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 16:47:22 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%3]) with mapi id 15.20.9564.016; Tue, 3 Feb 2026
 16:47:20 +0000
Message-ID: <fd704376-8dd5-46c2-8861-0c4586ad3fff@intel.com>
Date: Tue, 3 Feb 2026 17:47:16 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/2] drm/xe: Add a wrapper for SLPC set/unset params
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Riana Tauro <riana.tauro@intel.com>
References: <20260128022320.1054591-1-vinay.belgaumkar@intel.com>
 <20260128022320.1054591-3-vinay.belgaumkar@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260128022320.1054591-3-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR06CA0160.eurprd06.prod.outlook.com
 (2603:10a6:803:c8::17) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|CO1PR11MB5011:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c11ed64-dbe9-4f23-dcb4-08de6343e5cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|376014|1800799024|18082099003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YmEvaTBnMGJ6aGZiVmtQdnUzY2tpMnpZOStCeUhGcXdSZ0FhT1dWeVFodFVk?=
 =?utf-8?B?RjFMZzgxeEFNbXlZeG9pcURGUFMrTlcwV3JxQnVQZVpEQm5MYm9RSjY5YlpS?=
 =?utf-8?B?N1c4RUJ2dXVGYkxLbzhFQ1huTG9NbkdxbnpwU0R3Y1NMd3hneERyWXFNUExl?=
 =?utf-8?B?T3JNcjR2TlNTK0pjVXlMTUZ1emFyOGt1N01QVjIvWjJaVGVqbXFnbUtpUzU5?=
 =?utf-8?B?Y2xJYy9wQkVrTFN2UE03dGJDZVFzNmtveHVBbE81cWk5UFlQa3lyY2RXNTh5?=
 =?utf-8?B?d0VlQUlwMzJ0RXlVNFptOFExS0IweEcxU2UxUW90TTZUemVjVm5LcHd1Z1l5?=
 =?utf-8?B?QU9iZ1UyK3BFa3lkT3VTZGhzbEllbC9MTGVZdjdJUmdlTVFJOThZZVpMamli?=
 =?utf-8?B?VUFCcURsSmZ1KzB3dlYwRGttTm83TzZ2NWJmM1Zsbmo2d3ZNdE9EYkNIZEpC?=
 =?utf-8?B?TG9OV3ZYVzBuM3NYQ2w3K0Z6RFNQTEIrVjV1V1REYSsrcmV1TUVRV2hFMFAx?=
 =?utf-8?B?clgrNmZRZzNqalZ3eFNBRXJrcEZITEZGVWVJbEZNbHFsRUlPK1Z2aERLQ3lv?=
 =?utf-8?B?cFZqRVZFZHdTeSt2OVYrVDBJOVlDazV6MW5ZVUpJNkpXYTh0Y0R5NVNHVGs5?=
 =?utf-8?B?bldYQ3JKaHhBdG56aFV6eDUwdFBZZ2NUYTBDWUUrdWRuaytjTzYzb09rNDkw?=
 =?utf-8?B?TTB0c3FPOHlzc3VGR01nS2F3UWg0NlVRTXJCWW5TRTRScitpR2VHN3NmWDh0?=
 =?utf-8?B?YjU5MHRHOGxyOTRDRHZ6NGdXdlhJb01OcFRIMjJzUjZiN2FFZGtzUm96QWNM?=
 =?utf-8?B?RVB3cDdCWjZxd1F5SEdvcWtLVjhjS0tQM0pvb1dKYzRZaFYydXBiWGIydUlq?=
 =?utf-8?B?TGdpQVhDL0JzQ3NHbkY2NmRWMDhnWkMrZzQ0S2tHb2diZE9vaWpDUkhERWtp?=
 =?utf-8?B?VXlvY0h3WWhTcTNCdEkxaGRwMGNOR3B0VUl3Nml3bS81Z2txeXNPNFdUR1Ay?=
 =?utf-8?B?NVlZK2JtaUwzSURIN0FSNCtmT2RDYXhua0xab3FZbzdjN2JwdGJxeFEyNEpV?=
 =?utf-8?B?MDJpSll2MkVpb2lMaDlXZ25jRHlMalNwL0RGZHdmY25teGMyTFlmaWR2VTRt?=
 =?utf-8?B?MmxkRDRHTXlReTlSUFpLU0NzRWJ6Q0FrdC9aM0djQTBjMm5qZ3lTZC9mTDhi?=
 =?utf-8?B?YURERjJPdjAzc3MvL1J2L2ZCdjZ5NitOTFZvbi92cFZTUVlFYldYY3h6YjVq?=
 =?utf-8?B?YW5lc2RpcDdVRFZOZ3IzT3pwS1RaNUEyWkRHb0crMHYzNitZbVUrdkJpV3dy?=
 =?utf-8?B?RmpraHlmVmRwUFdjcnA1dkVrUW0yV1c5SEtBYXVKcHpXKytNUGZqVWcyd20z?=
 =?utf-8?B?SWQ0SmZFNzRGUUVhOWFuc1o2clZaT2YwL1NRRUw2YmZxdVpTc3FrVldCaUtI?=
 =?utf-8?B?VTlSdXZWMXNzSTV1akZKOXFuUS82d24zYXNwTHRTR1BiRlMvVWhCdkJhTDl4?=
 =?utf-8?B?UlBybmcxaFJ4WFB1TUNTTWRoWVZwMHozRlVBUnZhTmZ6T0NVVUZqcmk3U1A0?=
 =?utf-8?B?NGEvS0JkU2lMdWdIY3h3REk1Sk9CYWxUZ1VSajRsWCtnTVhJZExrMm9rSFRm?=
 =?utf-8?B?aEN1TVVtaHpNK3FNdVdPTnBRekFQMHBFMGNXeitnemFhTHFIMTQ0L1UzUXVr?=
 =?utf-8?B?c3hOcnpQR2Y1dU1LQSt4TlZNaUt3MUVvNUxaSUVNbWptcC9mRUhkUzhpeHhV?=
 =?utf-8?B?WGhiRS9vVHJoV2owZHhja21lL1ZLdU44QXRjanlzMVREWE16Nms3eWVFRzVz?=
 =?utf-8?B?TzdCUE1WeXNiQ09SSm42T05SV1U2T0swRkQ2UklNMlBIV0dLT08vUm1OWURV?=
 =?utf-8?B?M1NFeW9uQVRVcmlUQ0Y1OGdLVFVuMnA3VHh4TXppSmJPcUtPbVdkMS9aZWg3?=
 =?utf-8?B?RiszZnRmTS95SE9XbmNEdm13MXAxQzBkQ0piZDljc3g0T2piQmpLMG5iYTRP?=
 =?utf-8?B?d0FIWWNJVkZ0eTJPdU1sSGkyakQ5SW1INW5OcDFSc09xVEo2V1Q3bzMxalhL?=
 =?utf-8?B?SzNRaXBqbFBNTzZRQ3RYUUptY2dPcHJpZkljMDhpcEJLWGFabmNPakhtTXM1?=
 =?utf-8?Q?hwis=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(18082099003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TnJpMjBxeXM5eEdRTkR5Wk5EM3N4TXNTa1YvTEQ1K2VGSkFKWEdKWjBvNWZi?=
 =?utf-8?B?Ylg2dnIzZGdQL09WMmJ6YlJKaUVsdkNBZzd2MkNxOEZHbzVwQ3hkcGtSeDJI?=
 =?utf-8?B?K1p1dlJVZjdIUVVjL1N5cXExWVRxL2g2cU5rRlZOL3YvZVZ4RVVaMzhzYnRG?=
 =?utf-8?B?V0xZSUJzcmlKMmx6RXU1RHgzWHJVR21yZXhhdjBVVVVrV3lvc3Nna2RVN29K?=
 =?utf-8?B?Qm96YWQ1c2hKbi9jendyaWNmWko2VHhLYmRDMWlaMlBCU0srdmo2S2JwdXNp?=
 =?utf-8?B?SFZadHNQL3hpZng2cFdnQXdNcEpONklqWTAwa2VQN211T2IrVkJZOHc4VTQ5?=
 =?utf-8?B?YmFUVFZYUTNLT1YwNmorTFhQdGdlVEE3NnI2VHVSZE5yMmtnQVB4akl2Y0o1?=
 =?utf-8?B?YWJhR0NRbWpaNkhSRys3UEJCNlN6aWF2MThYTHpDOGlJVEFUMDZXTDZLOHR6?=
 =?utf-8?B?U2FjY2x3NmcvVWsxQzBLSE8vT011VE82ZHJUcUZBeTMyN2MwS3ZXdzZiNzcr?=
 =?utf-8?B?QWRpMkhSUHJmK010RlQ2TC9CeFJtWWN0VEJKQUVDNE5BMmFJMmw1emJkMHk2?=
 =?utf-8?B?U3E2MC9NMmxYK1l1U2VRNTU4bkx5Tk5SelpXTWxudVNzb3JaS0lmeGhpNWVy?=
 =?utf-8?B?Y2VSZWpRbFVnVDhyY0dOTStoQ3FhNmRlMzZQOHl4b2w5MTdYRG1GdHFHS1BP?=
 =?utf-8?B?SnBWWVJOa0FlNm13TDQrTzlpNkhtejMySzNqN3o2VHdvaWpMVWYwUmVuOEFZ?=
 =?utf-8?B?bDVXRHg2RnV4a3JFWDUwbjVYL2FiRUd2UENPUXZiMXcwTjNrbWgxbUdxMGJH?=
 =?utf-8?B?VXFTNW9sUmE3ZGkzK1l5bUczYi93U0xob0hiUDBVUCsrQlY3cFdyd2liUVY0?=
 =?utf-8?B?YXdlNFZHSG5relAxbmdrQTRWT0ZwWlk3MjIvKzNRaU1BN1RoK2hvamJaeldh?=
 =?utf-8?B?RXR1TVJsaGhKMXJjSHF1NWc0UE00aEpYRVFEbVM4bklWQUw2S3B3LzRwMjJU?=
 =?utf-8?B?OW1qdzhILzF0elpDd3NCVnBpMVk1MFdXSjlvUlQxTXhXVkZQQTdoVFFqTnpR?=
 =?utf-8?B?bVdnZm1lbEF3RmM3aVpMUm1ibjF3aGVkc3QxV2ZBMXd5MENOSnR6blZQeWdk?=
 =?utf-8?B?Q3NWcTUraFRpa0VkS2l3bU1BMGFqQ2FUdytGbVlwQXliUHg0WC82dW14TWxr?=
 =?utf-8?B?bGNlZGlCek9KTHk4NTB5WXRWaWU2TWdpZ3JtWC9CR0lzY29LMzY3TURrZXpM?=
 =?utf-8?B?c3MrWDBXeUY3YkRoeTZRK29wU0RjcjFHRmxNWjdaQ21OUmE2d01qaWFSZjNm?=
 =?utf-8?B?T0hLbkY4NVQ1TjkxRStlWlpUVWM5emQ0Y3pJQmphZnUvQ1lBTkxuMUdESzdG?=
 =?utf-8?B?Mlh4NmtnZ0VLWEwwUDlBZzdCZjA2NGFTUkYvbzEwaUlha2hMOHQwZFhzSElt?=
 =?utf-8?B?YlYwSXV4Y2ZJYWxVSEpaVkhrK1p6aGVvdi82aElHR05VOGx5MnE0N0ttNzNh?=
 =?utf-8?B?ME5jNmF3d2pNak5HTlNrV2NBV0NyWnB6cXZKZGRERnU5VGJYYzI5VDFFeGhr?=
 =?utf-8?B?SzQ1bXdtQWpOQ0t1QnR2Q3VSVEJZdzhVeTFTdzdyN2RqVEZtZEVKcVJPODBw?=
 =?utf-8?B?TmRkRmhHd1VpTjduM2JzNGFWOGhHZ0dTY1lTdk02M0dhY2tJK3liM3NHbEZW?=
 =?utf-8?B?UXBkOVgzUFllSXZXcnpMV2pzTFZvbk9EN2JWOXcwTWljbmM5TG5kZWgyZzZx?=
 =?utf-8?B?L2hSR2RGbE9jMUFLQ09jalJGMUYwcjZ4angvUWZsKzB4dTg2cHdwTVpUbUJQ?=
 =?utf-8?B?VjVuVW1ISm5qeFZoSy9Vek1IRkFaNXVYUHZ0RzdUYjBZR2pxbE56d1p4c3JF?=
 =?utf-8?B?NFJkQmRyeVI1R21CRTJuTEZaU2dsTnArVmRNZWxYdnJnbnVXR0xZWk1lVWpO?=
 =?utf-8?B?Y3owUmtkYmFLeXBDbVpXTDhlK2dSOTR3eWgrZ1VsZzJtTHgrMWJ3VUtnSFVm?=
 =?utf-8?B?b1ZJeUdtZ3MxTUl2S1Z6K2pxYng0bjY1QW95anBkSFM4eHdITFpJSEwvOTFR?=
 =?utf-8?B?QlhDM2hyZURTVGo0N1pGVU81MnBPNUhkbVRsK3ZONFZHL0hIQ2d1ZndPMkVy?=
 =?utf-8?B?REJNaTZnV2RqY0lVVWdTWmtxQTVUd243Z3c3a0xHZVNwSUZqeEdRTG04SXMz?=
 =?utf-8?B?Ynl5YkZ1aElrSmRNQkV2ZVhoMzFWYmdrd0JUSm1pY2VMSExXRVh2VGFsSEVF?=
 =?utf-8?B?aEM0OXB0dnExNDZjeTNDVG0zWWwvMWJzbWZnSEdVK0NndUVFdU5IM1BxNWRQ?=
 =?utf-8?B?YmZkU2lZQ0tnQURlSVcxWHZVWVc3ckhMTFBiN3RZd21HbTVTYjJDdXg1Q1o2?=
 =?utf-8?Q?HmRLBLB4LhL1151U=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c11ed64-dbe9-4f23-dcb4-08de6343e5cf
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 16:47:20.4621 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2kC1bsQ3e6bGnCQBuKjolxv8EuUe5OyKZRw//usf1E3o0vy8W6WAia4YX9WfGfk7O5Dt5QnKYn8upg3zuyT1SQAEUYJZPOG+UB8uO64O3UA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5011
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



On 1/28/2026 3:23 AM, Vinay Belgaumkar wrote:
> Also, extract out the GuC RC related set/unset param functions
> into xe_guc_rc file. GuC still allows us to override GuC RC mode
> using an SLPC H2G interface. Continue to use that interface, but
> move the related code to the newly created xe_guc_rc file.
> 
> Cc: Riana Tauro <riana.tauro@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Reviewed-by: Riana Tauro <riana.tauro@intel.com>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
> v2: xe_guc_rc functions to use guc pointer instead of gt (Michal W)
> v3: Assert if runtime pm ref is not held (Michal W)
> v4: Review comments (Riana)
> v5: Use noresume instead of full resume, update title (Michal)
> ---
>  drivers/gpu/drm/xe/xe_guc_pc.c | 56 +++++++++++++++++++---------------
>  drivers/gpu/drm/xe/xe_guc_pc.h |  5 ++-
>  drivers/gpu/drm/xe/xe_guc_rc.c | 30 ++++++++++++++++++
>  drivers/gpu/drm/xe/xe_guc_rc.h |  3 ++
>  drivers/gpu/drm/xe/xe_oa.c     |  9 +++---
>  5 files changed, 70 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index 878eb273c3e6..21fe73ab4583 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -264,6 +264,37 @@ static int pc_action_unset_param(struct xe_guc_pc *pc, u8 id)
>  	return ret;
>  }
>  
> +/**
> + * xe_guc_pc_action_set_param() - Set value of SLPC param
> + * @pc: Xe_GuC_PC instance
> + * @id: Param id
> + * @value: Value to set
> + *
> + * This function can be used to set any SLPC param.
> + *
> + * Return: 0 on Success
> + */
> +int xe_guc_pc_action_set_param(struct xe_guc_pc *pc, u8 id, u32 value)
> +{
> +	xe_device_assert_mem_access(pc_to_xe(pc));
> +	return pc_action_set_param(pc, id, value);
> +}
> +
> +/**
> + * xe_guc_pc_action_unset_param() - Revert to default value
> + * @pc: Xe_GuC_PC instance
> + * @id: Param id
> + *
> + * This function can be used revert any SLPC param to its default value.
> + *
> + * Return: 0 on Success
> + */
> +int xe_guc_pc_action_unset_param(struct xe_guc_pc *pc, u8 id)
> +{
> +	xe_device_assert_mem_access(pc_to_xe(pc));
> +	return pc_action_unset_param(pc, id);
> +}
> +
>  static u32 decode_freq(u32 raw)
>  {
>  	return DIV_ROUND_CLOSEST(raw * GT_FREQUENCY_MULTIPLIER,
> @@ -1045,31 +1076,6 @@ int xe_guc_pc_restore_stashed_freq(struct xe_guc_pc *pc)
>  	return ret;
>  }
>  
> -/**
> - * xe_guc_pc_override_gucrc_mode - override GUCRC mode
> - * @pc: Xe_GuC_PC instance
> - * @mode: new value of the mode.
> - *
> - * Return: 0 on success, negative error code on error
> - */
> -int xe_guc_pc_override_gucrc_mode(struct xe_guc_pc *pc, enum slpc_gucrc_mode mode)
> -{
> -	guard(xe_pm_runtime)(pc_to_xe(pc));
> -	return pc_action_set_param(pc, SLPC_PARAM_PWRGATE_RC_MODE, mode);
> -}
> -
> -/**
> - * xe_guc_pc_unset_gucrc_mode - unset GUCRC mode override
> - * @pc: Xe_GuC_PC instance
> - *
> - * Return: 0 on success, negative error code on error
> - */
> -int xe_guc_pc_unset_gucrc_mode(struct xe_guc_pc *pc)
> -{
> -	guard(xe_pm_runtime)(pc_to_xe(pc));
> -	return pc_action_unset_param(pc, SLPC_PARAM_PWRGATE_RC_MODE);
> -}
> -
>  static void pc_init_pcode_freq(struct xe_guc_pc *pc)
>  {
>  	u32 min = DIV_ROUND_CLOSEST(pc->rpn_freq, GT_FREQUENCY_MULTIPLIER);
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
> index 1b95873b262e..0678a4e787b3 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.h
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.h
> @@ -9,15 +9,14 @@
>  #include <linux/types.h>
>  
>  struct xe_guc_pc;
> -enum slpc_gucrc_mode;
>  struct drm_printer;
>  
>  int xe_guc_pc_init(struct xe_guc_pc *pc);
>  int xe_guc_pc_start(struct xe_guc_pc *pc);
>  int xe_guc_pc_stop(struct xe_guc_pc *pc);
> -int xe_guc_pc_override_gucrc_mode(struct xe_guc_pc *pc, enum slpc_gucrc_mode mode);
> -int xe_guc_pc_unset_gucrc_mode(struct xe_guc_pc *pc);
>  void xe_guc_pc_print(struct xe_guc_pc *pc, struct drm_printer *p);
> +int xe_guc_pc_action_set_param(struct xe_guc_pc *pc, u8 id, u32 value);
> +int xe_guc_pc_action_unset_param(struct xe_guc_pc *pc, u8 id);
>  
>  u32 xe_guc_pc_get_act_freq(struct xe_guc_pc *pc);
>  int xe_guc_pc_get_cur_freq(struct xe_guc_pc *pc, u32 *freq);
> diff --git a/drivers/gpu/drm/xe/xe_guc_rc.c b/drivers/gpu/drm/xe/xe_guc_rc.c
> index 55eeee7b1011..a20b20e3dab3 100644
> --- a/drivers/gpu/drm/xe/xe_guc_rc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_rc.c
> @@ -13,6 +13,7 @@
>  #include "xe_gt_printk.h"
>  #include "xe_guc.h"
>  #include "xe_guc_ct.h"
> +#include "xe_guc_pc.h"
>  #include "xe_guc_rc.h"
>  #include "xe_pm.h"
>  
> @@ -127,3 +128,32 @@ int xe_guc_rc_enable(struct xe_guc *guc)
>  
>  	return guc_action_setup_gucrc(guc, GUCRC_FIRMWARE_CONTROL);
>  }
> +
> +/**
> + * xe_guc_rc_set_mode() - set GUCRC mode

nit:
	... - Set new GuC RC mode.

> + * @guc: Xe GuC instance
> + * @mode: new value of the mode.
> + *
> + * Function to set GuC RC mode to one of the enum values.
> + *
> + * Returns: 0 on success, negative error code on error
> + */
> +int xe_guc_rc_set_mode(struct xe_guc *guc, enum slpc_gucrc_mode mode)

nit: maybe instead of exposing enum from the GuC ABI just provide explicitly named helper(s)?

	int xe_guc_rc_set_no_rc6_mode(guc);
	int xe_guc_rc_set_static_mode(guc);
	int xe_guc_rc_set_dynamic_mode(guc);


> +{
> +	guard(xe_pm_runtime_noresume)(guc_to_xe(guc));
> +	return xe_guc_pc_action_set_param(&guc->pc, SLPC_PARAM_PWRGATE_RC_MODE, mode);
> +}
> +
> +/**
> + * xe_guc_rc_unset_mode() - revert to default mode
> + * @guc: Xe GuC instance
> + *
> + * Function to revert GuC RC mode to platform defaults.
> + *
> + * Returns: 0 on success, negative error code on error
> + */
> +int xe_guc_rc_unset_mode(struct xe_guc *guc)
> +{
> +	guard(xe_pm_runtime_noresume)(guc_to_xe(guc));
> +	return xe_guc_pc_action_unset_param(&guc->pc, SLPC_PARAM_PWRGATE_RC_MODE);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_guc_rc.h b/drivers/gpu/drm/xe/xe_guc_rc.h
> index 35fabb82cb0e..36d41329dd0a 100644
> --- a/drivers/gpu/drm/xe/xe_guc_rc.h
> +++ b/drivers/gpu/drm/xe/xe_guc_rc.h
> @@ -7,9 +7,12 @@
>  #define _XE_GUC_RC_H_
>  
>  struct xe_guc;
> +enum slpc_gucrc_mode;
>  
>  int xe_guc_rc_init(struct xe_guc *guc);
>  void xe_guc_rc_disable(struct xe_guc *guc);
>  int xe_guc_rc_enable(struct xe_guc *guc);
> +int xe_guc_rc_set_mode(struct xe_guc *guc, enum slpc_gucrc_mode mode);
> +int xe_guc_rc_unset_mode(struct xe_guc *guc);
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index abf87fe0b345..f7752719b74f 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c
> @@ -29,7 +29,7 @@
>  #include "xe_gt.h"
>  #include "xe_gt_mcr.h"
>  #include "xe_gt_printk.h"
> -#include "xe_guc_pc.h"
> +#include "xe_guc_rc.h"
>  #include "xe_macros.h"
>  #include "xe_mmio.h"
>  #include "xe_oa.h"
> @@ -875,7 +875,7 @@ static void xe_oa_stream_destroy(struct xe_oa_stream *stream)
>  
>  	/* Wa_1509372804:pvc: Unset the override of GUCRC mode to enable rc6 */
>  	if (stream->override_gucrc)
> -		xe_gt_WARN_ON(gt, xe_guc_pc_unset_gucrc_mode(&gt->uc.guc.pc));
> +		xe_gt_WARN_ON(gt, xe_guc_rc_unset_mode(&gt->uc.guc));
>  
>  	xe_oa_free_configs(stream);
>  	xe_file_put(stream->xef);
> @@ -1765,8 +1765,7 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
>  	 * state. Prevent this by overriding GUCRC mode.
>  	 */
>  	if (XE_GT_WA(stream->gt, 1509372804)) {
> -		ret = xe_guc_pc_override_gucrc_mode(&gt->uc.guc.pc,
> -						    SLPC_GUCRC_MODE_GUCRC_NO_RC6);
> +		ret = xe_guc_rc_set_mode(&gt->uc.guc, SLPC_GUCRC_MODE_GUCRC_NO_RC6);
>  		if (ret)
>  			goto err_free_configs;
>  
> @@ -1824,7 +1823,7 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
>  	xe_force_wake_put(gt_to_fw(gt), stream->fw_ref);
>  	xe_pm_runtime_put(stream->oa->xe);
>  	if (stream->override_gucrc)
> -		xe_gt_WARN_ON(gt, xe_guc_pc_unset_gucrc_mode(&gt->uc.guc.pc));
> +		xe_gt_WARN_ON(gt, xe_guc_rc_unset_mode(&gt->uc.guc));

nit: it looks that all callers of the unset_mode() always use only WARN,
there is true error handling, so maybe this WARN should be moved to unset_mode()

nit2: is there any solid reason why these 'unset' in OA are called _after_ RPM and FW are put?

>  err_free_configs:
>  	xe_oa_free_configs(stream);
>  exit:

just nits, so

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

