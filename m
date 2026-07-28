Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 699E2C53219
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jul 2026 06:06:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13FA110E527;
	Tue, 28 Jul 2026 06:06:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XVZULVoX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85D8110E527
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Jul 2026 06:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785218782; x=1816754782;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=QijpsSsKyQDFl4WLSFFOkMKpQAj+Q3xhOP7syoLjkBw=;
 b=XVZULVoX11hHNa89W46N+p0lvwwpxT9LHnE9Qs+Gvc4P2Z1Ch06ig2cz
 N5sJM9akNrSzGkXw6XvpEeZwBL0pjg2VhHeo5wf4t3CowDG2lfZRK8yq/
 M+AQd5R+7GcxgNuCvOw3l3KXtO+giaCLphYk9ncuS/g3yCpRu9sfbRFaD
 dOOlytpkqRRVcyX0iz3zaFJXwVG9l58JjzZ31YjoHZWs6y4ILoYqxyppD
 FpRlNkgyfM/GewMVpiZyNecSvLDvr/47M+wUND06y/DudG61R5s8stIhs
 LAr7CMiJOWIJ4AWJmJbKUdp2bDP5f+hR2o0/aHKVhHdPFrFctdNMkeNCl Q==;
X-CSE-ConnectionGUID: IjS9i7WNRCO2KxCAlFuX4A==
X-CSE-MsgGUID: EAbzJtjRSCGzFe77hDjcBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="85986838"
X-IronPort-AV: E=Sophos;i="6.25,189,1779174000"; d="scan'208";a="85986838"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2026 23:06:21 -0700
X-CSE-ConnectionGUID: zW/PJlMET/uCtBD2ItrMRA==
X-CSE-MsgGUID: ITnLB3N/QPObq2GPeUrXcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,189,1779174000"; d="scan'208";a="253285086"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2026 23:06:20 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 27 Jul 2026 23:06:20 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 27 Jul 2026 23:06:20 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.1) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 27 Jul 2026 23:06:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IAznnmL4WPkdVFczah6idbEdMmGy7bIdHV1PyFs1CN2pHwQiRlV6C5aw/haPDDHPlgNu/9OiOKMfvD23YvFTVcJuWgWGvVVrclPGsORZc7y7DmUtYLqDxY+d0UD/Aq71gB0y+WbQbLI2dp/gkEZeTY+NFO6WoGHKPqKEC0hxPxattevb2sPYASgmWXt7/S4+5MjPIQL8wqIkW6OWPkbxPJcswO7TLdzoTx9m6PbN8Go6jFHRRjaJ5MWYhDLi6u3LgAIuHpjVwUryn6YWqlKodMXUxjI6riE9KA8WPzlc9gCd0ui631s7f+5ATqH013TzYTvwxrYHGxQLv84MkBZbhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BDzLlObzQ2sdGuKr3Oy86wBdw6lQxE1rf3IfeN+kv/s=;
 b=Mi2+3vBdIt5D+91RsoghUJqN6Yk1Mjc8UJyMSI8G0WI+Cky+wiNxGIgOZ2pF7vX0N7fZXEIDkNt4F8CnAPg5PXgTegnAZpU9SZjzr0p+/VpQoaYoHD38168yWb7fs0rTbCEFZP6AHAEz+R86V8DbR3IL5t8s33d1wIjyftEHGWZ/O6k2eZAY1zWaEsU0A1rE0E2LSU2gifTrBfkPBA9sXaZ50iaavamWQ6GkuzZLY/rykMltfYovZ8E2QzZOUTUImO7PYz6vLRJq8tg7HYDkywJX80gNyA/QzXf/A+FYM5pKpOi3jOMJqza1lqPiGCd1/10uZFbXd+10unX4LpyX8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by PH8PR11MB6973.namprd11.prod.outlook.com
 (2603:10b6:510:226::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Tue, 28 Jul
 2026 06:06:17 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687%6]) with mapi id 15.21.0245.012; Tue, 28 Jul 2026
 06:06:17 +0000
Message-ID: <fde9ef1f-2a41-4958-bf22-806f759b82e0@intel.com>
Date: Tue, 28 Jul 2026 11:36:10 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/6] drm/xe: add page size allocation control state to
 xe_device
To: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260728060132.4067990-1-naresh.kumar.g@intel.com>
 <20260728060132.4067990-2-naresh.kumar.g@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20260728060132.4067990-2-naresh.kumar.g@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0118.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::10) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|PH8PR11MB6973:EE_
X-MS-Office365-Filtering-Correlation-Id: 7884ddd8-2c80-497f-f48e-08deec6e5635
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|6133799003|4143699003|10067099003|56012099006|11063799006|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: o/b7olUsfs83yiIbj7UrGur6/v8D8lrA3g/ri0EmvCW8YVMGG2Nv3RarpxbiWsXzuk+EfoE7xdtyY+LiyZ+xaUnVuCA3GvLu2ZCr9oMC5tuDQeTP3VjD50L5F2lL9kMMUsLDX22S1kURKLUGeWntOAniFOLzxBdwXMaGnF0MTyO8281ujd0coumiyPbO9uHuXSf7pTbRXjB6jc6HTtyYe7cRHjCPoKcJzgBOoMPd5mOGwCJBQZiUe/BLwyhJ7W1WmXm/5M5K8SoS72AcT6tpCobuhB8EUoXtnjFMEoaYN5zjXWK5CyL+3hdjGWNctjecpV1FtHQvTJ67uPgMRtpO3WeA/ORbMgAETPISwkhPrI7bVMwBZlOvwTjIXJ5KVO2SXOezqs6LZ8BJAzoJB6mxukhtpropQxoOW5pXPsRa7ZkiTkiRux56FF66xoeEdcEIyhoPsP6k0nmjU8Q62X9QWR86gg6XLoSnRVo0G4agkXTjHeaZNPhhEURnWNdR67oMStwJJxfYk+hy6sPxU1KIQIMLaLCcskB/E86pD5/IeNLFDFeBYM+y7Pm2UP5zqPZbWFeODlL7xpIehTv3xX5m8sciieRdEZ4qjlfyxQfP2pM1zoiBRCRPbB318rpWz0zk9+5EW80jnFMqkDPUyRDjupgMhNKliiBHYE4XfQAjrlk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(6133799003)(4143699003)(10067099003)(56012099006)(11063799006)(3023799007)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NHJpcEhHRlBSa21GOHFsUEF2QndCZ0k4R1RiSUxEVVlXUXF3Q21NNmpRcFJV?=
 =?utf-8?B?VHA0WXkzcmFEelRtMW1UT2h3c1RKdjZ3cW9tWWMxelM0V0VrUXJ5WkQ0R2Z2?=
 =?utf-8?B?akZhSjVrajdFV25ncWFYaGVQWmI5SnZSaEdtRnFBQ0dPVDZreStEbmN1eUxt?=
 =?utf-8?B?V3pYT3BocFJ5UWc4OFJJTHU0RWxJSGJZWnVsQ1hFd3FSS1FJYXU1R3plL2ZX?=
 =?utf-8?B?VmZTcDNGbHV5VmtsR0wySnErdnZuY3lyYkYzb1BpdUVCc0Uxc1pyOTZwWHNS?=
 =?utf-8?B?YkRqZ1FvZjJQd1o3VVJ1L2oyN05jakU2N2FMNWM1bzBoQ3NFYjljNGx1cHdL?=
 =?utf-8?B?dDR0ZGpwdy9sOUNDaVZsK3FWWTRwSTdMUkdnTFZSYzBvelpUdGJTdDZhMGFN?=
 =?utf-8?B?R0ZGbXdPSWdGRWZyWENKU3ZYTXpKZUV2K1ZiNitFd2hjOHc3a2MzRVNaYVNR?=
 =?utf-8?B?TDNMRUZWVk9weUgremUrejlOSzlBdERqanNiYTFJWTd1eGJSMTFxSHFGTWlK?=
 =?utf-8?B?K3Q0c0hWYmxwTkV2aml2MnBQZVhPWFNQWmc3TmMrME9NM21obVhCOGllTGt5?=
 =?utf-8?B?QnJ1SXRzRnNJalVTVEVta04wVVNYZGxKQUZJSWl1ZDMzVzY1ckNMNTBORGU3?=
 =?utf-8?B?MTc1QjF5bFU1QzcrQ3Vyb1hRTzQ1SVNkUGs2ajkwVWdTWUpPVjB3T1plRFpa?=
 =?utf-8?B?bksydDJlOGsxa05GZ2NlU0daWnkzTHdCMFpSM0tidURrYit0N3lhZUhNWlYy?=
 =?utf-8?B?SCtHYmhZbkM5U2M5S3lzKzdneFJvdkh5d2RhTXF2dHdwRjU4dVZSMjFYenZZ?=
 =?utf-8?B?Q2RIMmZGbzJlbGNUYm1vVkU3Yy9Xa3YrTFZlY1lxSm55ZjAvSm5nRXd6RERF?=
 =?utf-8?B?V0F4QWkwOGZ1cFlOa3JuenJFOGsxVzBBZ0xMcGxtdXIxSDFrWCtLWnRMMWhi?=
 =?utf-8?B?RXpGKzFTRWFVT3NrNHl0Y3V4SGROdEN4RitzUm9HWkRxTTBwR0l3Qzc3Z21F?=
 =?utf-8?B?ZENCc1o5ZmZINzNRNkMyR3dURTFjd0Y1YWtZK3dQbUFEZVlSYWFINkdkNk84?=
 =?utf-8?B?Sm1qb3BXa01xNVpDSGNqM3UxVDNUdVcwaHJ3YTN3UmFxU2xYTFhwUWlRM01B?=
 =?utf-8?B?TytaQ0dHL3J5MllOenpXZXJCcFM1V3drVWRBSEVXck5ER1o0ZG1NMERZamNp?=
 =?utf-8?B?a01BTkFPY0k1Wkx3ci9hVFFIOVFkSlBmWkYySHprL3ZRVUhZV1hDaElIUzRt?=
 =?utf-8?B?T1lnRnBhU0wzRkRJU3JOYmtORlM2UGMvNUE5TkVSTGxzNU05b09TWEJqSHJW?=
 =?utf-8?B?SzR2TFN1bzdhY0QrNGc4VlZtUlRDald5YWtVWkUya2QwYkZ0MUt2cEVHZVA3?=
 =?utf-8?B?bkF2SmZ6aVl3OThyTkVyZ2xNeWVub1cvS3R1NUoxa2NYK3NxUEpsSGhxekw4?=
 =?utf-8?B?UnVUZyszb3d3K1N4Z3JYRHdwZS90MGtJSFY1QS9VRGVqcDBGd0VNa1R3Q3Qv?=
 =?utf-8?B?Y1hSRWZ1ajUzd09MakgvUXc4SXlzOVp1bHB2RGtWbThxZjJncHF4OW9HSHFW?=
 =?utf-8?B?QTJuZXlrUkpHZlFzSzZ1UUx0MWJXRXFEVldaQ21BcWNuMHpDNlExY3E5NlBt?=
 =?utf-8?B?WklWMWl5VElza0gwS3VZQTRCbHlUa2RPWGRKYm5FNmRIcGloRGhFd05ZVm9T?=
 =?utf-8?B?dnd1ajA1d0FPOVZwYWt6cWJDUTdoYjFnSnUwODc1RlJlWjFaSWFzZGc2UmQ2?=
 =?utf-8?B?N0NTRHlnTG4yZFNZbDVMMFVPK3NYWnpuTUJleXdleXhCcjJqeW1lT2dySW1S?=
 =?utf-8?B?K0M4NXlMNTk3N3UvdTRtbmZHUmZ3QXp5ejc1MGp1RjRkWCt1ZStFZ3Y5azh3?=
 =?utf-8?B?Mmp2d1JUbkh4akNmRmoyMlZwVlBUdWl0OHVuWjR4SFQ2NGxLUWNzWU9NSk1U?=
 =?utf-8?B?WGtjVGJlRm5SWW5jY0VIZm5vUGRGcEliZ004MXFBcFUzOCs5b3RNMTY3Qkh4?=
 =?utf-8?B?MFdGTEZRRWhmRmpZTkVIR1Zpb2ZmSW9naGl1TFdFdnp1aWJaSm1iaWRWQlhU?=
 =?utf-8?B?U0RNVHAzT3g3VG0zUXJoYVpyM2NoZi9ORFd3Ti95TWFUeEtzOVl6OUM3SnhB?=
 =?utf-8?B?c1UrbERRR2E1eFFFU0xhbXQ2THIzekZSck9pRHg0Q3FzTWM5R1MzLzZUVkJM?=
 =?utf-8?B?aW9nTFdqNVlPTVFMOHZndjdFQXhQVE9vRm5IaStQaWVwSkVSK080SGhsTzBw?=
 =?utf-8?B?Y0p5QW9SYm84Q3k1cU9JZmkvcGsvYUowSTg0SUMydVFIUi9sYnpvcDkwYWxM?=
 =?utf-8?B?R2JtajlRVitaK0lYNFJMdXQ1eVNzYUlYQzVKbFBiNlJlcDYrNU53Ny82S3R6?=
 =?utf-8?Q?UvMAA/QDinGRn/kM=3D?=
X-Exchange-RoutingPolicyChecked: jZC4I3YzCY9mnZ9jkk3h3sxO1XfKp8FdYDVahPieN0oT4ENIzVVk4sj+uYVZuj/dzG1XMIQXERudy2HpFFb5ZN4ykH9iZKaEnWeMhL+Ce61A8YR0u9wHdRU1poM4DeRDxAJ9eHvbSXVi6rCW4zUPLZnficKLX95zUyLvOmLDm1W5+SDqreK9nJDOELLftpEnlkAWzHgIaBWwLKBwTG/bmv6AOlm67o8lQhRftat+mv6trgoAHVxJlriQ59aYr2/PbC60+uB6NNTm8KgQtBttfzpSsYwFrEhiVntYI86lcBPUcT9j80sivmajPxq8XIlZel2YReFPmFCCi9wJnCq3TQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7884ddd8-2c80-497f-f48e-08deec6e5635
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 06:06:17.3953 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OONHpT/BeZskgLFDhtWm7zU/Erk76jE9VJph7TjE1gg4If0It2To5uKCXx+gShXgygdbjrXgogXrBIJlNxJZL2wwjEAXyYgc3kKdn6w6DMg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6973
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



On 28-07-2026 11:31, Nareshkumar Gollakoti wrote:
> Introduce xe_page_size_alloc_ctrl_mode and add page_size_alloc_ctrl
> state to struct xe_device along with mutex lock.
> 
> The new control supports forcing user BO allocations to 2M pages,
> forcing them to 1G pages, or using a mixed round-robin mode across
> 4K, 64K, 2M, and 1G page sizes. Track the current mixed-mode index
> in xe_device so allocation policy can be applied consistently.
> 
> v2
> - make cur_index to atomic as update need in later patch to
>    avoid race/concurency (sashiko)
> v3
> - reworded comments
> - protect mode/index updates with a mutex for proper concurrency handling
> 
> v4(sashiko)
> - move xe_debug_page_size_alloc_ctrl_init() before drm_dev_register(),
>    so mutex and control states are initialized
>    before any userspace visibility
> 
> v5(Himal)
> - Guard all the debug page size policy code under CONFIG
> - Squash Kconfig patch to have Kconfig entry for DEBUG_PAGE_SIZE
> - Add inline to check debug page size support and exact mode
>    configured if it is supported.
> 
> v6 (fix CI build)
> 
> v8 (Himal)
> - use drmm_mutex_init to avoid leak with mutex_init
> - call xe_debug_page_size_alloc_ctrl_init unconditionally
> - Add missed mixed mode check on xe_debug_page_size_mode_not_none check
> - Add xe_debug_page_size_mode_is_mixed() function
> 
> v9
> - make xe_debug_page_size_alloc_ctrl_init() return int
> - fail probe if drmm_mutex_init() for page_size_alloc_ctrl.lock fails
> 
> Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

> ---
>   drivers/gpu/drm/xe/Kconfig.debug     | 16 ++++++++++
>   drivers/gpu/drm/xe/xe_device.c       | 25 +++++++++++++++
>   drivers/gpu/drm/xe/xe_device.h       | 48 ++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_device_types.h | 31 ++++++++++++++++++
>   4 files changed, 120 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/Kconfig.debug b/drivers/gpu/drm/xe/Kconfig.debug
> index 01227c77f6d7..79118d9efd93 100644
> --- a/drivers/gpu/drm/xe/Kconfig.debug
> +++ b/drivers/gpu/drm/xe/Kconfig.debug
> @@ -86,6 +86,22 @@ config DRM_XE_KUNIT_TEST
>   
>   	  If in doubt, say "N".
>   
> +config DRM_XE_DEBUG_PAGE_SIZE
> +	bool "Enable debug control for user BO page-size allocation"
> +	depends on DRM_XE_DEBUG && DEBUG_FS
> +	help
> +	  Expose a debugfs knob to override user BO page-size allocation
> +	  handling for validation and debug. Supported modes include forced
> +	  2M, forced 1G, and a mixed mode that exercises 4K, 64K, 2M, and
> +	  1G page-size paths on platforms that support them.
> +
> +	  This is an unstable debugfs interface intended for development and
> +	  validation only. Its layout, contents, and existence may change or
> +	  be removed at any time with no regression warranty.
> +
> +	  Recommended for driver developers only.
> +	  If in doubt, say "N".
> +
>   config DRM_XE_DEBUG_GUC
>           bool "Enable extra GuC related debug options"
>           depends on DRM_XE_DEBUG
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 4eed9a251e65..7007b6113760 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -921,6 +921,27 @@ static void xe_device_wedged_fini(struct drm_device *drm, void *arg)
>   		xe_pm_runtime_put(xe);
>   }
>   
> +#ifdef CONFIG_DRM_XE_DEBUG_PAGE_SIZE
> +static int xe_debug_page_size_alloc_ctrl_init(struct xe_device *xe)
> +{
> +	int err;
> +
> +	err = drmm_mutex_init(&xe->drm, &xe->page_size_alloc_ctrl.lock);
> +	if (err)
> +		return err;
> +
> +	xe->page_size_alloc_ctrl.mode = XE_PAGE_SIZE_ALLOC_CTRL_MODE_NONE;
> +	xe->page_size_alloc_ctrl.cur_index = 0;
> +
> +	return 0;
> +}
> +#else
> +static int xe_debug_page_size_alloc_ctrl_init(struct xe_device *xe)
> +{
> +	return 0;
> +}
> +#endif
> +
>   int xe_device_probe(struct xe_device *xe)
>   {
>   	struct xe_tile *tile;
> @@ -1073,6 +1094,10 @@ int xe_device_probe(struct xe_device *xe)
>   	if (err)
>   		return err;
>   
> +	err = xe_debug_page_size_alloc_ctrl_init(xe);
> +	if (err)
> +		return err;
> +
>   	err = drm_dev_register(&xe->drm, 0);
>   	if (err)
>   		return err;
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index a03760d0ce38..6c4cfaebc44a 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -212,6 +212,54 @@ static inline bool xe_device_wedged(struct xe_device *xe)
>   	return atomic_read(&xe->wedged.flag);
>   }
>   
> +#ifdef CONFIG_DRM_XE_DEBUG_PAGE_SIZE
> +static inline bool xe_debug_page_size_supported(struct xe_device *xe)
> +{
> +	return IS_DGFX(xe);
> +}
> +
> +static inline bool xe_debug_page_size_mode_not_none(struct xe_device *xe)
> +{
> +	enum xe_page_size_alloc_ctrl_mode mode;
> +
> +	if (!xe_debug_page_size_supported(xe))
> +		return false;
> +
> +	mode = READ_ONCE(xe->page_size_alloc_ctrl.mode);
> +
> +	return mode == XE_PAGE_SIZE_ALLOC_CTRL_MODE_ONLY_2M ||
> +	       mode == XE_PAGE_SIZE_ALLOC_CTRL_MODE_ONLY_1G ||
> +	       mode == XE_PAGE_SIZE_ALLOC_CTRL_MODE_MIXED;
> +}
> +
> +static inline bool xe_debug_page_size_mode_is_mixed(struct xe_device *xe)
> +{
> +	enum xe_page_size_alloc_ctrl_mode mode;
> +
> +	if (!xe_debug_page_size_supported(xe))
> +		return false;
> +
> +	mode = READ_ONCE(xe->page_size_alloc_ctrl.mode);
> +
> +	return mode == XE_PAGE_SIZE_ALLOC_CTRL_MODE_MIXED;
> +}
> +#else
> +static inline bool xe_debug_page_size_supported(struct xe_device *xe)
> +{
> +	return false;
> +}
> +
> +static inline bool xe_debug_page_size_mode_not_none(struct xe_device *xe)
> +{
> +	return false;
> +}
> +
> +static inline bool xe_debug_page_size_mode_is_mixed(struct xe_device *xe)
> +{
> +	return false;
> +}
> +#endif
> +
>   void xe_device_set_wedged_method(struct xe_device *xe, unsigned long method);
>   void xe_device_declare_wedged(struct xe_device *xe);
>   int xe_device_validate_wedged_mode(struct xe_device *xe, unsigned int mode);
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 860ad322237f..03a7bb08adf7 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -61,6 +61,23 @@ enum xe_wedged_mode {
>   	XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET = 2,
>   };
>   
> +#ifdef CONFIG_DRM_XE_DEBUG_PAGE_SIZE
> +/**
> + * enum xe_page_size_alloc_ctrl_mode - User BO page-size allocation control modes
> + * @XE_PAGE_SIZE_ALLOC_CTRL_MODE_NONE: Use the normal allocation policy
> + * @XE_PAGE_SIZE_ALLOC_CTRL_MODE_ONLY_2M: Force user BO allocations to 2M pages
> + * @XE_PAGE_SIZE_ALLOC_CTRL_MODE_ONLY_1G: Force user BO allocations to 1G pages
> + * @XE_PAGE_SIZE_ALLOC_CTRL_MODE_MIXED: Select page sizes in round-robin order
> + *     (4K, 64K, 2M, 1G)
> + */
> +enum xe_page_size_alloc_ctrl_mode {
> +	XE_PAGE_SIZE_ALLOC_CTRL_MODE_NONE = 0,
> +	XE_PAGE_SIZE_ALLOC_CTRL_MODE_ONLY_2M,
> +	XE_PAGE_SIZE_ALLOC_CTRL_MODE_ONLY_1G,
> +	XE_PAGE_SIZE_ALLOC_CTRL_MODE_MIXED
> +};
> +#endif
> +
>   #define XE_BO_INVALID_OFFSET	LONG_MAX
>   
>   #define GRAPHICS_VER(xe) ((xe)->info.graphics_verx100 / 100)
> @@ -478,6 +495,20 @@ struct xe_device {
>   	/** @late_bind: xe mei late bind interface */
>   	struct xe_late_bind late_bind;
>   
> +#ifdef CONFIG_DRM_XE_DEBUG_PAGE_SIZE
> +	/**
> +	 * @page_size_alloc_ctrl: User BO page-size allocation
> +	 * debug control state
> +	 */
> +	struct {
> +		/** @page_size_alloc_ctrl.mode: xe page size allocation control mode */
> +		enum xe_page_size_alloc_ctrl_mode mode;
> +		/** @page_size_alloc_ctrl.cur_index: Round-robin index used by mixed mode */
> +		u32 cur_index;
> +		/** @page_size_alloc_ctrl.lock: Protects @mode and @cur_index */
> +		struct mutex lock;
> +	} page_size_alloc_ctrl;
> +#endif
>   	/** @oa: oa observation subsystem */
>   	struct xe_oa oa;
>   

