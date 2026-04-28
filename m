Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3463FF8875
	for <intel-xe@archiver.kernel.org>; Tue, 28 Apr 2026 23:28:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE40C10E04C;
	Tue, 28 Apr 2026 23:28:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C9QQkAaE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC84410E04C
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Apr 2026 23:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777418904; x=1808954904;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=HjLnyN1986MY21/4vwFxpCt+ba7HYjhXNpRAizRpwfY=;
 b=C9QQkAaEBUOuDuIqqXXsQvYfQXKwcCcnbwin3L3edDTgb+1g4Lgb3KVq
 nKUf2ONrF+t0KVIgeJ33EowppU4h76nuODzxKbK1xVxc3CiOrJwmEbIXD
 1zCOfXMSj6Xzt59VF29phdL3QOYisTV5Ql4gp4ldNKmsLYDyDNGX/r6Tb
 6KfVGR3M0QJQvyApuFRvgLd2J+ZRpXnC2CPh1LcJyKgDGTwaGL4CKgTX7
 VSvYKeIF6kw9PJ88maTR8nexTAAQekOFqNNLmnDfW9O/lJA8KlT/pOHaK
 rYD+ER5Mg4Q2U6UdT1xeCwZG2/DYPLlkfK4xQAL9bh37kyuN3MI8zgk7S Q==;
X-CSE-ConnectionGUID: cUwYSkmnTse5/fYFUHoTFA==
X-CSE-MsgGUID: mID70QNmTSakIei2Iuu0HA==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="89803911"
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; d="scan'208";a="89803911"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 16:28:23 -0700
X-CSE-ConnectionGUID: 4HOgHzlySnqYrLE4Z1NZaA==
X-CSE-MsgGUID: R1BGMcK9THmyfwiW9Q10vA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; d="scan'208";a="238068240"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 16:28:23 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 28 Apr 2026 16:28:22 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 28 Apr 2026 16:28:22 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.57) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 28 Apr 2026 16:28:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SuThGECoJImHA3CccLEBZUXhvBn82zCgg6/DRuqnomqwIgHS+G7O//wfjvzeD7mGJBgSvXBV2TrX4Pe5SJPFxQ9NJkVDh12vmWs5D805Rg19FjXYCCRaGCUXTKVGl3HjxjiB9HRs/zTHQjHFMl+9CzMJj2A3MwKid7d19NoL8Bxa8d+ArLje0JM7r7bcDxlILLT/VbW33AWhb423WAE2S55iMpogIQ1pqewBX4Z1kVSLa7zwU7ikF0W6u/VL/ySyGJWtlELoaiDqtoqDEzL2K5MV5Qd71AcDptgsWJaUrABLdbCF70fDWLh2va85+qj8Oy4fxqEEZvcwEWt0ql2RSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CV9bJFCwKRhFCEFnLH3IN8K2UUhxnXK1PHvKmsy9NYU=;
 b=hCVV2QF+jGxQlHaNni8zCdhcsfnjtuZynmZeqtbJ8WaZMv9r6+CIzGounGG9DHoRmj8ol9n/Ne0MENWF5OS69owE36US6DAPtf7hux+Zcoo/ZZsH/4NcUs89c7KeYtuE51hTCD/uJieq74bNf+9ky8wpnYgb144vnlwxNGg+wS2al3Yb3jDw17+Ut9G4SAAiZtALTo7FaaHR2bFbMNZiYL/vezKAnMYxH/OTa6uDN7zgqGcs26sHbKFC9+n3ADx5sk0jdx1kD+//CQQ9sZB9qhq3IrtRWR0Auyne/VjBGvkHcXY6xyxIFqE0YYiNcHze/ETtQzNiivajx3rGg0hxmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by SJ2PR11MB8540.namprd11.prod.outlook.com (2603:10b6:a03:574::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.18; Tue, 28 Apr
 2026 23:28:17 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%5]) with mapi id 15.20.9870.016; Tue, 28 Apr 2026
 23:28:17 +0000
Message-ID: <2de7d34d-6f47-4327-9290-7cebfd47a69d@intel.com>
Date: Tue, 28 Apr 2026 16:28:15 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 8/8] drm/xe/pci: Introduce PCIe FLR
To: Raag Jadav <raag.jadav@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <matthew.brost@intel.com>, <rodrigo.vivi@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <riana.tauro@intel.com>,
 <michal.wajdeczko@intel.com>, <matthew.d.roper@intel.com>,
 <michal.winiarski@intel.com>, <matthew.auld@intel.com>,
 <maarten@lankhorst.se>, <jani.nikula@intel.com>, <lukasz.laguna@intel.com>,
 <zhanjun.dong@intel.com>, <lukas@wunner.de>, <badal.nilawar@intel.com>
References: <20260423100017.1051587-1-raag.jadav@intel.com>
 <20260423100017.1051587-9-raag.jadav@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20260423100017.1051587-9-raag.jadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR10CA0028.namprd10.prod.outlook.com
 (2603:10b6:a03:255::33) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|SJ2PR11MB8540:EE_
X-MS-Office365-Filtering-Correlation-Id: abc8a918-1edd-4ef4-086e-08dea57dd371
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: MRjdUf+IRJEu2MJFAeWo2ZpyYvanpgMIR9ZzN4WkhohUHIwD4JbKKcHl+gfnIbagzzzp3sk7OJawilFjnR35bVd9DEobkxy9oo2ixU+sVQ+lHC8bBRfNXWurokBh2+1/+nnSpJnox+WRWQP+6CN2g0TJIf/fm49eOH91Ca8DhNyKHqwcS7IkrWbrRtwLyj9BAzz68H75UtvgM7/ZIJovg2IqrchnUSakgmS0HtTtkOUg/sDS8TPwfX/wQ5DrDvB9cp9oyT56dtdRKfBBBmD16aPz8KAn1GidvlQAqDWrCbkrVQnyIPYAZxr9fSMeIkR8FPj10/IeB64QVUdgCgrauW10MSN94JPGxyWyP+QwqZg8zqSEaW6etrA2e34liWktQ7eDGs5Rf71SXiqK2dNVCt+1dhXRW5Ek39DZdxT364bzUfbuIOgyEvTeGt5A/7Xmm1Ox8NCMbhL3od8P9fbquTuG7twa68XQ5+EtDw443IC1RPshTZdJORl7U6EPF5wwiO5XKXYD7fy0trj2hyGh8IUPyt/8NDpiMyBeBTq0RSj+dmRgnC6KRk9tdRam66bFmlUFcSAV0SRDHsa8jnOt/bc4tWxnrofYPGQaCgo4d/sAw2oKCLqaqsBv0Z3gbwxYvOJF0GvEWprFpeGIvhi6AuvkgUTS1mCAB8zZt2aZWXniEHdX/YKbJPd/d0IC7Kmbiy9roQY82Gh+uCg1tHUB4P0PHj7uKxoSvIij/YIRV5Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bitMR1RMZ3FPS2p1Q1JXcVZFZVJwM2hJUGJUWWhWMHZSZUVnTlNiTmlqcTJD?=
 =?utf-8?B?TStpajAyRDNzTEhyY1dzdk9NN0V0TzhIemk5TEdvV1UzUUpaZjA5MlJmL3lD?=
 =?utf-8?B?UytZeStFMnBFOUFlNklwRXN2Q094NUNvV0FSZWRqUkVmM2E5NGFzeFVEcVl3?=
 =?utf-8?B?M2krdGVyRkkxTG9sUyt2TU9LRHcrWEtOT2hQZGxMOHUxbFRpUDY3RnN1OHJo?=
 =?utf-8?B?NGRvUC9vQ09XOFVkSWRPajAxRWgzQ3ErcWR0cVlSOElYZHVsbnM4S2lhUU9v?=
 =?utf-8?B?M3pkTVJWNWFOQndmcWEzUU5SZW52WnJYT0JaTFpZVmVWUWJZOGtJVUc5c1pU?=
 =?utf-8?B?MXAwSEFkQjF4ZU41OTdid0ZvRG9FUHFod3pIblFwdVNnU25RUkEvbU9PdG03?=
 =?utf-8?B?VVp1UDFuTE80T3JxM1dCUDVITUNOYmxVVTVacXZZc1JFaG55ZlRwd1BqUkNK?=
 =?utf-8?B?eDJoVFN5dTFGS2ZMeXFicW1aTUErN0lvVkVTd2JBbEZZWElpeEpyNTB1LzNM?=
 =?utf-8?B?eU9DTHJrWFUwdk1MMnNqZ1JJZXJkSVY0dWJjNHJ1R3h2c1daZlY0OHp0Q1lN?=
 =?utf-8?B?b1hVMjJSK3RVSkhpSVJ5T2VQQWZKRXlmVklma1VVL2NBRDZkNjBEZDFpcEtO?=
 =?utf-8?B?ZmNqYjB4RytZZVI0czZCb1RJSkhsK3JVVWJZM0RUU1BoYzRXQmVqRHZMTzBm?=
 =?utf-8?B?V2pmdGZiOXB2UjJBM3dCU0RKK2lpWkVVeXVvck5rWUpwdE5sVFZMZWFLVkM1?=
 =?utf-8?B?ZGtmUDBFZ0dHZHdMQ1RrM3FQeG9PdDlKMEwzaTZtQlBCdEJrVE94OG92R3Vz?=
 =?utf-8?B?aW9uMm5UTHBORVdxMmxqQjZaaVMrRGtDN1d3a3VhNU8vMGY5Qzl2ZkIvRUFw?=
 =?utf-8?B?ejFtSlpqM3BGQ0FabytaanFkTWtxcXNKenA1cWJDclVBUFFMdHlRenhZTnFS?=
 =?utf-8?B?Sm1WdWtyeGFldTZ6WVJhdUZNQTAwQ1ZrcEcza3hXTjFTSnd1a3dsL0p3bHR2?=
 =?utf-8?B?T1Y3U2pITmIvTmVVSFNYSHJPeTBRL2c4bkJvYUJkS1RyMWtLRzhZNGN2YUJ3?=
 =?utf-8?B?Q0NoVGRycjN1NndXRUxyemhXUEVYVU4zWUpxYmQrdXh5NE5xY3kwZU5pQTlw?=
 =?utf-8?B?dm1RdHo2eEZxY0p1NnJIU1ZvTFR6TjNNb1ZyUzhSTXJ2WTJZN0JNbWhyQzIx?=
 =?utf-8?B?NEd0b0g3b3JxbWlLMmlwTFNqVldEakVYcXk5dW1XK2JxTVp4ZjQ3ZFBjTTdN?=
 =?utf-8?B?OEcxYnJjQndYdGsvaThsdHVWOHFLa2U2SlFoNVQxbTgxV2tGREtqZHpHMm9t?=
 =?utf-8?B?MG9VOFp0STBtdVN3WkxzMThXV2R1a2d1MVlUOU1RcHZuZ2c1K0xIWGh3aStN?=
 =?utf-8?B?bXhCSXVCNGhoWW5wV21ZY0FYbjZJaUc4SkRUL0QwZ25FS2k1cVN2Z25OSitk?=
 =?utf-8?B?Y2dDQ0J1dmRDQS9yYkVpb3pQWi9mZHBvSzZaaUdoUHFpbkRQbThoYngwY2M2?=
 =?utf-8?B?T09HWUxyNTJ5OTA3NUdyNE1DT3k3MnVXY2VPSWNEV253cytkSkh1QlcxVTNo?=
 =?utf-8?B?VDV3UThEUjhYSHdUV05UemFEa1ZUM2JMQTc1NldLNTh1YjNGWUlhRnNWbytk?=
 =?utf-8?B?RTdGN2RyaDRvU3dHNDNPazdWT3FBS1hNdC8rQ0FqWWljbkRyZFM3SHhuc2xP?=
 =?utf-8?B?VTVtU2lWUXBBZzFKSkh2cWhNNHA5RVV3QXlvRmxQK1h2djV2WUI3NlhIUjhU?=
 =?utf-8?B?cmI0dlJiUjVxSlhMMVRxVFFKZFByUk1KT0QzTFA2dER1elZ0L1QvL2JDLzlq?=
 =?utf-8?B?VDBQc3l6U2NoRHNncytrb0R1THdkMGp1UlNmekFDdVpsOE5zajZXSmNHMDgr?=
 =?utf-8?B?Z1o3cmFwUFVlcWJoVExnZWx3N2ljMTFxVFU4cFBWWDNmRG12T29UajFNUFhz?=
 =?utf-8?B?aGI5OTM4QVFBZjROdnVlZ1U4dkp4Y3JTRXlBNHlTRTRzbFJPY2poemtuRENQ?=
 =?utf-8?B?bFp0RjRMUlpmUUdtODlJVVk1R3lsMkZrTGFGWWVyY3lIUnN2MU1xY0xlaXdL?=
 =?utf-8?B?MGFYak5MbGk4WHhjN2FtZUtDZFRRSGNMb0UxVXRLUTFhM3gvVnQ2ajRURkZv?=
 =?utf-8?B?QjJwelQ0THpkM2ZPSUdHQXpzRjBrSkM4VFFrUUYwbDRPQkZYaUo2dTZnYmdt?=
 =?utf-8?B?VnFtV1hCZDJnVEIvTXc3cGlCWFptalJwWkR0aTREMndlTnlhUmJLN3dINlhB?=
 =?utf-8?B?bCtBZ0lSS1cxOVVoWnFpaTZ6SlJiS1JMRlNUdVpSdzRmL1B1Q0NwM2Vmcy9u?=
 =?utf-8?B?eWFMbHpPTmJLTWdxNnRhc1VBYlZzZ0QxMmlRUlBLSTdINFo2OFRIR3FnWkV6?=
 =?utf-8?Q?g1xOFMqFsPdKwwMk=3D?=
X-Exchange-RoutingPolicyChecked: p92lQ9L1P3uqGMbzssU5T8JOpdOs15tURGVDVgJMaLI+ppO+SXdVihQnGXXyQmSPiuA+rd9AvWxN/tOydYhdX7EHAEK+O28yC07gVCkRWHKkXeAHOijkTlfl6Qno37PUKiBPjCujvMFbnGUgervB203VMc08d60zcsRBTHoShX7/9thixhN/AJo24p94HrKD34Sa8oqioWCHK53ljeaQBuBDRccqtl63MhSCq8HPGM9Gpfaj9vR/NQi06jStCjqxEVIENhlkj1vBYOZ9lbM9NxLskLAf2wQsSiBjux/tyjttebv5TdC87KnnA6K0wsyVwG96nfOi78wAPlGmQ7+WTA==
X-MS-Exchange-CrossTenant-Network-Message-Id: abc8a918-1edd-4ef4-086e-08dea57dd371
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 23:28:17.1851 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7PriS0PXDPbZUi4AhcWKv4eCAKAh7kCrmLmkNhFQNJj/XQhknVtove1zLx3IuANrv+YK4Sq2VZU37kLkCoi0egJo5YciifKbSan5AfVMAVU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8540
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

<snip>

I haven't gone through the code yet, but I wanted to ask some questions 
regarding the approach first.

> +
> +/**
> + * DOC: PCI Error Handling
> + *
> + * Xe driver registers PCI callbacks which are called by PCI core in case of
> + * bus errors or resets.
> + *
> + * Currently only PCI Function Level Reset (FLR) callbacks are supported. Since
> + * most of the Endpoint Function state is lost on PCIe FLR, the flow is pretty
> + * much similar to system suspend/resume flow with a few notable exceptions.

IMO we need a couple of lines to describe what the impact of FLR is on 
the HW. Something like:

"PCI FLR clears VRAM and resets the state of all the HW units. 
Therefore, the contents of all exec queues and BOs in VRAM are lost and 
the HW needs a full re-init".

> + *
> + * Prepare phase:
> + * - Temporarily wedge the device to prevent userspace access

I'm not convinced that wedging is the correct approach here, because the 
expectation from the apps POV is that wedging is permanent, so they 
won't try again later. Maybe we can have a separate flr_in_progress flag 
and return something like -EBUSY or -EAGAIN when the FLR is in progress?

> + * - Stop accepting new submissions

This is done as part of the above step and it isn't a separate one, right?

> + * - Kill exec queues which signals all fences and frees in-flight jobs
> + * - Skip memory eviction due to untrustworthy VRAM contents

Note that the VRAM contents are not necessarily untrustworthy at this 
points since the FLR hasn't happened yet. However, if the admin is 
triggering an FLR it is likely that something is broken (whether memory, 
GuC, GT or something else), so we shouldn't try to touch the HW anyway.

> + * - Remove all memory mappings since VRAM contents will be lost

Dumb question, but what happens if a userspace app has an object mapped 
and they try to access it from the CPU after this step?

> + *
> + * Re-initialization phase:
> + * - Recreate kernel bos due to skipped eviction in prepare phase
> + * - Restore kernel queues which were killed in prepare phase
> + * - Reload all uC firmwares
> + * - Bring up GT and unwedge to allow userspace access
> + *
> + * Since VRAM contents are lost, the user is expected to recreate user memory
> + * and reload context.

How is the user expected to realize that they need to re-create their 
BOs? A queue can be killed for different reasons and normally that 
doesn't imply that any associated BO is now invalid.

Daniele

> + *
> + * TODO: Add PCIe error handling callbacks using similar flow.
> + *
> + * Current implementation is only limited to re-initializing GT.
> + * This needs to be extended for a lot of components listed below.
> + *
> + * - Proper re-initialization of GSC and PXP for integrated platforms
> + * - SRIOV cases which need synchronization between PF and VF
> + * - Re-initialization of all child devices of Xe
> + * - User memory handling and MM corner cases
> + * - Display
> + */
> +
>

