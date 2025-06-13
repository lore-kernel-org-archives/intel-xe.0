Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47632C71148
	for <intel-xe@archiver.kernel.org>; Fri, 13 Jun 2025 16:16:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE9B810EA2A;
	Fri, 13 Jun 2025 16:16:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g91oZwO9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C785F10EA46
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Jun 2025 16:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749831381; x=1781367381;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vT6grQ9rWYOMWelQNLV90o9Mui9mLDmUjRs5Q5H6mBM=;
 b=g91oZwO9Cv7OmreUZomYXfzXBWwqJ2drDnPNHBTtRuN7hX4SpmIrmvpO
 zcBiu3RnVh4ghRMI23TnO2aF6QxLEh+bgNXMQbjn1minkFhX3UwrI+yiA
 IEmtHR8dbG5eikIsyX3EnGlXrdCG4aWjN6+TAp4NVYjdEDAbzNLJQiuOP
 EXGvuoHHU1nJUBigkmWjS30zs8WGt4nl8581yu3lbe2aPFByfomEEu2jm
 pJxGmsXWRLHtxXpYYf10dbZoU8Jikkz/QpG0DVty19hsvd4bZuApTLNfM
 1xoGZ5YZ56hL4+6P9GmP+8UdIoQ3wqioLKYxzTE7V3wF/XNgz308Fyjqs A==;
X-CSE-ConnectionGUID: 4dPKPmekQemGkw30WcnoMQ==
X-CSE-MsgGUID: FWN365FJSkateroU0999eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="63405110"
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; d="scan'208";a="63405110"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 09:16:21 -0700
X-CSE-ConnectionGUID: SLUFLjwMQqu19XrcifLiww==
X-CSE-MsgGUID: FyMoYAH7SgSrshZiWbNgGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; d="scan'208";a="147748043"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 09:16:21 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 13 Jun 2025 09:16:20 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 13 Jun 2025 09:16:20 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.40)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 13 Jun 2025 09:16:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U6kPlLx82y9VakbZyrBEDIUegDxfSb/EgEHhSGycjzdSThhJ226VbEezM7h9m35htlHcUV+SaFnha2OBZ19StFg0lqnRgr+EP/OgZ+uYGcIrHQTBozd8ZAC25lLn8w6/VSU0xzWWJOVbtU3J0l5lX6uGlgr96022DSkiW+AUfY+apUXO4iXaV2H2xx7stS5evalwDVpbK2vjO2X97MmNt//m90IdiQzv7WMbymVHA4k9XLxDPSfvshExlriwyWVfLPlWWo2RRB2GkNQ8iDsgcYE4CrE35+WSpNE8AZhbyFz1ZvShA93D+J21K9uEHmqL8gQpOLSBWXazn0Oa8kdFBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UIQD1wn9WhXTUeqiLK5RxtSpqPsEsOF/o3tnJLWk2uM=;
 b=SfQOMZb6bQ2vm/1T4sFiu5RBwZCAZ6vccztv9+CQFiQUo5WOXYTk115oRShgYnkl0RWYzoKg4F5/kITF0tyRFXjU9xpXX8X2ruiIMh2o7xCIKGMd/oBKBOCquhoHiZfiWRmRuwrEqZXTvLLGDA0Zj43t+U3drTRg3ospXfd8lz7XRS3VpM7p4dAL5+p45YVsZpKUlQabJsKcUBTKjRr5suoO9EFK+vZlH32qPpoX3MlDRvsGkt/8ZdhLqFcoZC2eGBGtoHfN14Tey5CZomY0AYn11UrWWNZC+zmEmii8S19AqFebClwLyrsWy7DZ8WqpT36QIhe81u6r1Os9K70mSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8450.namprd11.prod.outlook.com (2603:10b6:a03:578::13)
 by MW4PR11MB6572.namprd11.prod.outlook.com (2603:10b6:303:1ee::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.34; Fri, 13 Jun
 2025 16:16:03 +0000
Received: from SJ2PR11MB8450.namprd11.prod.outlook.com
 ([fe80::5c1b:f14a:ef14:121e]) by SJ2PR11MB8450.namprd11.prod.outlook.com
 ([fe80::5c1b:f14a:ef14:121e%7]) with mapi id 15.20.8835.018; Fri, 13 Jun 2025
 16:16:03 +0000
Message-ID: <def3f5f0-3bf7-4e30-9089-b0d4567cbf6f@intel.com>
Date: Fri, 13 Jun 2025 09:16:01 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] drm/xe/guc: Enable the Dynamic Inhibit Context
 Switch optimization
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Julia Filipchuk <julia.filipchuk@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
References: <20250604002454.743404-4-daniele.ceraolospurio@intel.com>
 <20250604002454.743404-6-daniele.ceraolospurio@intel.com>
Content-Language: en-US
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20250604002454.743404-6-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0096.namprd04.prod.outlook.com
 (2603:10b6:303:83::11) To SJ2PR11MB8450.namprd11.prod.outlook.com
 (2603:10b6:a03:578::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8450:EE_|MW4PR11MB6572:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bb2d9a5-3120-4f67-cc8c-08ddaa9597fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QVMxUGF6MysyenZJQjZ3ajNwT04yV01GTXVaRVdxWExsd3lIcFRkZUhDRGw3?=
 =?utf-8?B?dWlHaU1zWVJiTjVCMjd4OTB3TzRJTkF3TUhXcEVveWhoOWVKQjlDR0MyQ0Zs?=
 =?utf-8?B?RkM1d1laRCt3cjhlcnlUeURlNXcyeXdKRW9SOHdqRU9PUmZ1b2VnQjRxbnRI?=
 =?utf-8?B?RElQRkJySmZQS2o5RyswWFhqMWxKSmFwZ0t3bWNPZk1yV0ZjY09UL0dvYkdw?=
 =?utf-8?B?cTg3dlVhdkhEbmNWVWdmck0rSlpGWmYwU2tiUXBJRHorZTdCanFZSFZ6TEdJ?=
 =?utf-8?B?N3l4bDJGVTFBUzFLbTN1TkJIb3ZReWxZemJHQVVjMTZjT2tEYldMYThTNHZP?=
 =?utf-8?B?N2Ztc3c3STN5WmVWMzFkWWFuMkptalhQTTNaRFBPY0JSYVJxYi90enQzY3Vp?=
 =?utf-8?B?WmhFR3EzenlvTm9najVzNkFKSUZ1aERBTVBwNWJneG10YXhwQ1RkNUxYWDBh?=
 =?utf-8?B?anJDMStoQjRnQ3dEdGxIMWxUSkMyb2pQWldvLy9GMUxLVVRYc3lJakI4RTF6?=
 =?utf-8?B?anNDaFVlZGhqOHh5MHZkRnlmYXgvbnIxajg1U0xjazYwZnNDWEp1cGNZblVR?=
 =?utf-8?B?b0FrMkhNU1F2UXJWMWxiQjhMYzh1QW51NGNYQ0YvQSs0TUNjV0txeUM0b3NS?=
 =?utf-8?B?RGJNNTJENUNXQXkwTnp0VWVRNDBIcVkxSVJLV2IvbGJURTlBaEpFRDl2ejVs?=
 =?utf-8?B?NHVjVVVnVlYxaDd0akJHa2hZdkNnZVZsUllESmRibUtDYXlkYzNZcEJEMGtz?=
 =?utf-8?B?ZXRjYUFpRXFJZnBBeWI0WTFoM25WYU1yVmd2VVJCRklHaG1qUFlVWVNQOVJP?=
 =?utf-8?B?Z2gzb0Y3TUROT3lrU3hHanZ2c0E1eERMOWt0cmZOOUxQTnBxVitoTi9xNGVJ?=
 =?utf-8?B?ZVd6d0lUQUdTN0FKQ1ZxYTZYNk5FSm81cmowVXJNa2tOdkJ3ZExkazhQTnlu?=
 =?utf-8?B?RlZYOEdoTlNITkxCY2IyL1VHc3Jka0JWUnBnOGkxWDNQaVQ3OUthYVlqRXVU?=
 =?utf-8?B?NzNRNGRMeVNQd2JzTkhLY0JQejBEbHB5bUNYa0tvR0oySHJ5d2hxQ3Q5N3dU?=
 =?utf-8?B?NHNTUy9WU1BEZ3RDUlpvWnlSUVJPUlJYSFRmWFJZZkNRMTc2TThhRmw0b3gv?=
 =?utf-8?B?bFE2RU1COVNEZHcydWpKdmp1ODhhU0o1N3lsQ2d1RTR4WjBsYmRGSWxBc1Qv?=
 =?utf-8?B?VytKdmZISlV4dTRsQ2diSTkwQldrdFlmbVBMclNITFFwVVdyNGd2N2ZzM1Yw?=
 =?utf-8?B?WUdjVGxESnBJTDU2RkVxanE4MlMwVjJzdHBXaE5yNjRSdHJ0WDBoR3h4cS9S?=
 =?utf-8?B?M1B0K0R5b2RScEJrcXpqcnVMRkRMcXBYclU5dm1sUHQ5RitFcmhMcnNvOXEr?=
 =?utf-8?B?YjNuNHhzUzh4K0ZFU0tGcTVNN1FJVFh6WWRHU3lra3p1eUtjcm4ydWRtL3Qz?=
 =?utf-8?B?NHg5OHh6NEVjMERYYk0yT0FHTkNDelNHcDhrekg2MEtrMkZjSG9lZnBabjRo?=
 =?utf-8?B?SmlEeXdMTFBMVjl3OVBLUFlLTFBQMDNlOTJLQUxDaFFmbEZpZTl6UHJXR21J?=
 =?utf-8?B?NGZMQ3lRTjN6RnIwMHUyRzFtOElrL0RmSkFaaXc3TG1kWWpHNkJYb3oydnhC?=
 =?utf-8?B?NkNiLzJudHB0emptMUg3bkovTVRvbGpKM0pZU3RuYldmWmZ3ZkNyMWNmSEJO?=
 =?utf-8?B?VUtPUDdtSFhGNXNjdm5HbTZSRUsyUWpneFpBM3Z2Ris2WkN1a3N3bm9IZFZp?=
 =?utf-8?B?QytJTE5JcXo4MkZ4b3hISzNXOWp5ZFRTMkZTZ0VyY2JvaHd0L2xHUGVnQlJ5?=
 =?utf-8?B?R1VwRmhOVWZKZCtFWVpNYTdPckFKRVQrYUk0WWpibXllUEZhSEtXSEk3aDZJ?=
 =?utf-8?B?eGhCTVdyM0x6Y1lXaTJHVGdmazFpeUlaL2hBeEYyTDgzRlR2OWlXTXFEY1Iy?=
 =?utf-8?Q?pl/heRuYsCk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR11MB8450.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MkVSaVBMdUdkY3diemNqZEZINFRJaTBoZUNEL0VlOXp0c0dLMHowQW1COWtM?=
 =?utf-8?B?TDRpQzVYRzdGbHduQ1JxQ3VhWnUwekUwNktzQVQ0QmFiZzQrVFAvS01vSEJ4?=
 =?utf-8?B?d1NIRThDYks5NE5sWnU4MFJYV29BaG9nRVAyUlBvVmlZV2QrODI3d3JqaDhB?=
 =?utf-8?B?Q2YyUytvMXloZE9IUGRhVDE5ck9DSHB6bnhSY1RNWlEySnYva05NUy92dzdJ?=
 =?utf-8?B?dnNvRTk4U3d1SnRVL1dldnB1QWxOWGhYWG5QMllzbjFHSWZSdUo4dEpibzlB?=
 =?utf-8?B?NEJYRzVTSkNmRWVtNmVlVHAza2VPUi8wMjI4RjFza1ZVVmgzdnZPZmFkSzBr?=
 =?utf-8?B?NUdJbmEzcXNxaUUxUzdIKzl0UnNvOFhrUm41QmdYbmFSeVNKN2FhS3F3QVVX?=
 =?utf-8?B?UHF2ZDFKcEtpeVh4dHBMVTI1a1ZHOXd1OFhrNVFVRzFSWWZmeVVlYjVkK2Vn?=
 =?utf-8?B?ZW1Bb2VSQU92WGtiWjhhNzVOY0VSMUp6UzByTk1GQXIrclJIYURaam9leVVr?=
 =?utf-8?B?ck5aVFNyckZ0NSszWnpVcEVyclRyNnNvTFMzeTFaaEV3b29sWVZ3SDFwT1pL?=
 =?utf-8?B?eElKdkgxS1FqdVVRL1dWTVFNcGdaakROMmV6K3Z5TmZsWmxxTXlZL2FtTzBn?=
 =?utf-8?B?ZW42SW5aa0NYSllxQUlLNUh6UHJkMytLK0ZiK20vc3k0cUs3Vlp1U3dTNWpZ?=
 =?utf-8?B?OG5HRk8ydU0yQ3dZS3Z1ck1CTS9BWUVIRlo0aVZndzErb20zU1ZySCtUeEx1?=
 =?utf-8?B?a09rS3VpQUZCdlNSOU1TZFpMUkcxejIwQ3hEV2dBcE03UnhhRHBmL0Y4dzZW?=
 =?utf-8?B?REIwaHM4VmNkVVlJRzdUMVA1dVcxYklrMTRCczJUKzBYOFpyZWpHekM0Y05p?=
 =?utf-8?B?NEM4R01jSStDU2ExODhENUFsMy85N0pZVTE4SU9PMlo3cDBBZ3pwKytZeDJv?=
 =?utf-8?B?YUZOdnhFUU14dmxBZUNtb0lOOEpJdEtiU1RaaEhHbndnRkJWU3VVb0dYVllB?=
 =?utf-8?B?Slp6S0RKbkpkbkdrQzNncUpEYXpQYVBVd2s3WjgvUW5QMkFzQTRFMktPU2Q5?=
 =?utf-8?B?d3VxM2lPeENVc2J1WC85ODlrbUxXbTBPSDh0T1JkK3BlY1BYV1UxaEI1bURZ?=
 =?utf-8?B?NEF2QjVncVl3RkVMNXpsbWJxa0NoVy91ZnBCd2p2aXpSODd4MUJ4YlZVNXds?=
 =?utf-8?B?aHBaYVptcCs2SHNHVzdGTS93ckZTR1pjd3N2OUZyZEtzcWxOZmp4a0NGOG1x?=
 =?utf-8?B?VWFxM2Z5ZTdGT294WnJlaGJWMmpaSDVFbGZicGM2NHprTnlOc1lGeWs4eFBU?=
 =?utf-8?B?M09YcXAwQVovTGR5cE9wcFVPckJoZnA5OXdqOFFiNnRtNXFzMm04ajE1MTUw?=
 =?utf-8?B?TkRlTFRJaE9HUzE3aUErV3B1Y3lYMDNic1E1M3NrNHVudVZ0dFVzR1c3aXZC?=
 =?utf-8?B?ZkFUbTVMNmRZN2I4cEpjTytMaThpajJOTzN3MDNXNHl2amtyZlI3MzVGWGY1?=
 =?utf-8?B?K05Ic2dtcElVMHQydnZEZjdRQWREZkZBNGtlYWdFYm1va3k2OWJQNXQ0MWtO?=
 =?utf-8?B?L0YxS1pCU1REMGh2bitMMEJFMEordUZkZXM1M2FVWDArYmw0SkdRRHJpREJw?=
 =?utf-8?B?K0ZQL2xyb3ptSEoxSjNLYVg0bWRHbWNDV0h1SmUrd1hWS2Y3b0ZjZ2ZFaG9i?=
 =?utf-8?B?MEFRMzFXZVNoRWM3ZWVtSWFkMUJoWVB0aklEbFFYTWVXK0d4aFJncTM0K2hY?=
 =?utf-8?B?dmJaZkVJYm4vYlpXazQwT0VhSTRXeE0wNDZVb3c2d1NxZm5CL0pIdVF1Qm1x?=
 =?utf-8?B?UUJXMVNiMCs5d0ZGRmJ1Y1F2S1Y2aWtpMUVaNE1DWUtzUis5Y2gwQUpsWVZx?=
 =?utf-8?B?Z2VWNjNabWJUblR2RmhwclVaTVhDdWdDZFRCVTV6RnV3QzI5SEgvNkRscWly?=
 =?utf-8?B?Skl6RGc1OE5ocExzYnBQUVNZaTdnOEd0aEZ4WWxteUg3RHZLVDdxZzRhQk90?=
 =?utf-8?B?Mno4QUQ4cnNOM1lHdCtaMkU5dDlDL2ZJT3YxVTEzaXJuVUlNT3kvdmJmZHJs?=
 =?utf-8?B?TnlkWFVxSkdPQjVzL1BKNHo2K2o3dnpyckp1ZUVZakZpOU1xSjdraXE3SzN3?=
 =?utf-8?B?VUN4UFMvYXhVZTJYSEF2dFByaTU4Vy9SY0JDUVovalZORFZMS2pzQm03N1BH?=
 =?utf-8?B?VVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bb2d9a5-3120-4f67-cc8c-08ddaa9597fd
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8450.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 16:16:03.5600 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bjuEIOfrXhviKAVj0URR2gbGtVdWf0hcsoYTp+6MqhxwSHexmS+A9upN115lmKm/t55UWNrqJN/ABWzuJqvkNqzw3Vq19zAzGOnHq0A2xI8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6572
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

On 6/3/2025 5:24 PM, Daniele Ceraolo Spurio wrote:
> The Dynamic Inhibit Context Switch is an optimization aimed at reducing
> the amount of time the HW is stuck waiting on an unsatisfied semaphore.
> When this optimization is enabled, the GuC will dynamically modify the
> CTX_CTRL_INHIBIT_SYN_CTX_SWITCH in the CTX_CONTEXT_CONTROL register of
> LRCs to enable immediate switching out on an unsatisfied semaphore wait
> when multiple contexts are competing for time on the same engine.
>
> This feature is available on recent HW from GuC 70.40.1 onwards and it
> is enabled via a per-VF feature opt-in.
>
> v2: rebase
> v3: switch to using guc_buf_cache instead of dedicated alloc
> v4: add helper to check for feature availability (Michal), don't enable
> if multi-lrc is possible.
>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Julia Filipchuk <julia.filipchuk@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   drivers/gpu/drm/xe/abi/guc_klvs_abi.h | 13 ++++++++++++
>   drivers/gpu/drm/xe/xe_guc.c           | 30 +++++++++++++++++++++++++++
>   2 files changed, 43 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> index 5b2502bec2dc..0366a9da5977 100644
> --- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> @@ -134,11 +134,24 @@ enum  {
>    *      Adds an extra dword to the XE_GUC_ACTION_NOTIFY_MEMORY_CAT_ERROR G2H
>    *      containing the type of the CAT error. On HW that does not support
>    *      reporting the CAT error type, the extra dword is set to 0xdeadbeef.
> + *
> + * _`GUC_KLV_OPT_IN_FEATURE_DYNAMIC_INHIBIT_CONTEXT_SWITCH` : 0x4003
> + *      This KLV enables the Dynamic Inhibit Context Switch optimization, which
> + *      consists in the GuC setting the CTX_CTRL_INHIBIT_SYN_CTX_SWITCH bit to
> + *      zero in the CTX_CONTEXT_CONTROL register of LRCs that are submitted
> + *      to an oversubscribed engine. This will cause those contexts to be
> + *      switched out immediately if they hit an unsatisfied semaphore wait
> + *      (instead of waiting the full timeslice duration). The bit is instead set
> + *      to one if a single context is queued on the engine, to avoid it being
> + *      switched out if there isn't another context that can run in its place.
>    */
>   
>   #define GUC_KLV_OPT_IN_FEATURE_EXT_CAT_ERR_TYPE_KEY 0x4001
>   #define GUC_KLV_OPT_IN_FEATURE_EXT_CAT_ERR_TYPE_LEN 0u
>   
> +#define GUC_KLV_OPT_IN_FEATURE_DYNAMIC_INHIBIT_CONTEXT_SWITCH_KEY 0x4003
> +#define GUC_KLV_OPT_IN_FEATURE_DYNAMIC_INHIBIT_CONTEXT_SWITCH_LEN 0u
> +
>   /**
>    * DOC: GuC VGT Policy KLVs
>    *
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 46419861bfcd..b94e7bd865d5 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -583,6 +583,32 @@ static int __guc_opt_in_features_enable(struct xe_guc *guc, u64 addr, u32 num_dw
>   	return xe_guc_ct_send_block(&guc->ct, action, ARRAY_SIZE(action));
>   }
>   
> +static bool supports_dynamic_ics(struct xe_guc *guc)
> +{
> +	struct xe_device *xe = guc_to_xe(guc);
> +	struct xe_gt *gt = guc_to_gt(guc);
> +
> +	/* Dynamic ICS is available for PVC and Xe2 and newer platforms. */
> +	if (xe->info.platform != XE_PVC && GRAPHICS_VER(xe) < 20)
> +		return false;
> +
> +	/*
> +	 * The feature is currently not compatible with multi-lrc, so the GuC
> +	 * does not support it at all on the media engines (which are the main
> +	 * users of mlrc). On the primary GT side, to avoid it being used in
> +	 * conjunction with mlrc, we only enable it if we are in single CCS
> +	 * mode.
> +	 */
> +	if (xe_gt_is_media_type(gt) || gt->ccs_mode > 1)
> +		return false;
> +
> +	/*
> +	 * Dynamic ICS requires GuC v70.40.1, which maps to compatibility
> +	 * version v1.18.4.
> +	 */
> +	return GUC_SUBMIT_VER(guc) >= MAKE_GUC_VER(1, 18, 4);
> +}
> +
>   #define OPT_IN_MAX_DWORDS 16
>   int xe_guc_opt_in_features_enable(struct xe_guc *guc)
>   {
> @@ -607,6 +633,10 @@ int xe_guc_opt_in_features_enable(struct xe_guc *guc)
>   	if (GUC_SUBMIT_VER(guc) >= MAKE_GUC_VER(1, 7, 0))
>   		klvs[count++] = PREP_GUC_KLV_TAG(OPT_IN_FEATURE_EXT_CAT_ERR_TYPE);
>   
> +
> +	if (supports_dynamic_ics(guc))
> +		klvs[count++] = PREP_GUC_KLV_TAG(OPT_IN_FEATURE_DYNAMIC_INHIBIT_CONTEXT_SWITCH);
> +
>   	if (count) {
>   		xe_assert(xe, count <= OPT_IN_MAX_DWORDS);
>   

