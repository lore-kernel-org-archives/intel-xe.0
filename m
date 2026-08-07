Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B52CC5AC7A
	for <intel-xe@archiver.kernel.org>; Fri,  7 Aug 2026 21:00:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88DC110E32A;
	Fri,  7 Aug 2026 21:00:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LfkFfyD7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED5C610E32A
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Aug 2026 21:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786136452; x=1817672452;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=HswKpT1GEkeDUcQtx4EsuRfkFFMTUNb+VZ0DWifrIaw=;
 b=LfkFfyD7b/21/SCUMV3XymHfBL8GYLmdAJIn7Ev4NZ+CNyqPFrs0WsyK
 QTwjOtPxRXrIC2zfZNccuFmHutD+ezEnbqEJnOJ+uTg4WmmfaVdmnQUHY
 q50C52k6bJEWORjS7eOJ+EMeH+e3vttlsYfeT022/7Q+dsluKH2R3bjOA
 h958OFShqXsoqJqWixNp+tFiA0LxLqk98i+R9jnSi6QcgUeoaF4JrBaJC
 puCzJrX8ib63X7w6UHDvNzEqowiMc/mG5ZssAIEVHFjlcTVAPLjg6sUVa
 mRthz72XzSn7JhT8XWTuAy+3DjNWLZffCFNiovIyqC+IzEMhot/epfJ8V Q==;
X-CSE-ConnectionGUID: rNW2hXpMTrKtFgmx6F8u8Q==
X-CSE-MsgGUID: 3gvzRKFTTw2YRPZXI5SX7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11868"; a="86778471"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="86778471"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 14:00:52 -0700
X-CSE-ConnectionGUID: fbyBjCKgQb2hpejW8VOZYQ==
X-CSE-MsgGUID: /+GriVPmQiitaWa6nbGb0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="264484518"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 14:00:49 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 7 Aug 2026 14:00:48 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 7 Aug 2026 14:00:48 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.8) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 7 Aug 2026 14:00:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gEEXb6HlPm0ALmaMEHlpjeW+dKq8u+9BtSXDKm14hgi1drQ0LTldjwtxFqfRq293wvwzg9m5drZLWAbFO1iiaqnAccmTKBgaX5OZMBkedLQMd0CxDcVe1u5wOMXlktDBWv/diQM7e4AIvea308IAXpEkaDooaP/N6BqWPqj/YoBbNZ5AU5UrV8+lKUEZq7eF45nGg9nktOaLn8N+4nhNFmp93Yfv4dXEIrxnbdAe7K3jagw2hODkYdygnRFjoUsIDZLwYko/8HOykzdsKdeKP6DMgOVXUFa3PxmLPMm/4h03Pp8wV1drCDvbTyhYbvoiHI+TFi33PxypYF9r/lURqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ozkr+WV+u8YNnTIgCzCG/AZVKix45iXqYylf8jwb520=;
 b=XkksyJSWt218itpAqXktM7gGtpvrmaqPJOhwKPaFu6k/cdXWFa8YLIklf+83cG0kAzOmKMfxYVXwk0tJqDbLrAkKk60xoZS+1G092NAyOKgG2QTeg9neuWpxxuNOJgc0z/alWfN2bWzJQLNKHLHvw/VR+fLyn4hnRSgzWpjRYELeV97xxPbXmj8WaZFlkEuvvOY6xLm8z5BcKKmSIL2F9iw398VycamSbI0ZE04ZvkJR+6VcMtu3wGfCYNAxy6wp0uzzlmH+/3tDkp4WcA7Ty+o0umcOZCkdaqplS7qa8ARtx/ghjV5dEzRQcl+wuADwwlS7/rELJ3QoKbXAPxfKew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by CH3PR11MB8436.namprd11.prod.outlook.com (2603:10b6:610:173::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.21; Fri, 7 Aug
 2026 21:00:45 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%3]) with mapi id 15.21.0292.019; Fri, 7 Aug 2026
 21:00:44 +0000
Date: Fri, 7 Aug 2026 14:00:37 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <badal.nilawar@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@intel.com>,
 <riana.tauro@intel.com>, <anshuman.gupta@intel.com>,
 <matthew.d.roper@intel.com>, <michael.j.ruhl@intel.com>,
 <paul.e.luse@intel.com>, <mohamed.mansoor.v@intel.com>, <kam.nasim@intel.com>
Subject: Re: [PATCH v6 1/2] drm/xe/sysctrl: Add helper to query application
 status
Message-ID: <anZHdalEPNSSEaO+@soc-5CG1426VCC.clients.intel.com>
References: <20260806120930.2072613-4-anoop.c.vijay@intel.com>
 <20260806120930.2072613-5-anoop.c.vijay@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260806120930.2072613-5-anoop.c.vijay@intel.com>
X-ClientProxiedBy: SJ2PR07CA0012.namprd07.prod.outlook.com
 (2603:10b6:a03:505::13) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|CH3PR11MB8436:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e6cca69-98a6-4ea0-1837-08def4c6f23c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|6133799003|10067099003|4143699003|11063799006|22082099003|18002099003|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info: 1Wm5+T4LW7E866esG7zrihTtKyDkVeTSbIOdEwlWJ9Jbe5x4JfxxBUW/cJ4Ig7M3cpALNwn9EYxTwLHjHfiLhwo0XzctUK7LcOECw6btNI/hg/J4+02asFHI5tvqGQgKmKEKUClK9dtPiBYNth4tqz36GKvmAf6LXJmAp07KS5QQ41XMKpZEMV7xn2XYGNerSDAIfpfdI9t5x0/AAv7LG41sOQMX7DY4XiphmnuviranlejFUgImyNXYNRx59kXzWfcnlFDcr7EVGY1uGVTIk0Qzq0Uc9x5Zmkv8MH++1hguaG7Sp85iR2H7yS+OC5oQF3+ZBPxBARfuaWx7s98QflNrhsvYsqm2lMj0tyVVcz3Dqn+ROlUnWnD7OCzqDlx0HT7QDp0I6PmER12crBUKm3JmVmjp8oUm4e9EXD9IVWouxyPAQw7vTI2RUGFe29zf5rFh5+oKSMIxfPKeRq9MsDQy8ndI3KA2UDLvWRW4kjMos0s8wQ6VyIn83SCUt5JtZrnOareUXiPYiHZkXqf92QAXSIzPS8QAp/LGKG7ESndS7FJVsJYPSIcnBd9pHuLuMIstI2K8tX64zIQ8uxfSSKds10ifgFUkqHMuYEHgyb8OCiFCckBJcvXLFJcjXxBMyj6AeSAFF7uFyK3vmBJqI0QlI3guQ3xMt8CgfX2mGBw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(6133799003)(10067099003)(4143699003)(11063799006)(22082099003)(18002099003)(56012099006)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T0N5aVRzeitnaUwwUWZHYWc3VGZ1NjcrbDNlZzVIR29qbWJaYWVPaUpoVmF2?=
 =?utf-8?B?QVZQandqZWpnc1pTbGN4OEt5bDkwK1NpcVE5VWJXNldYTXJzeElFOWtRTEIw?=
 =?utf-8?B?NVprWnAyc1hrSzVHdDVYbklLT0FodnNYU0hZbm9JTnRTTUtWQ0lUK2pndFE0?=
 =?utf-8?B?RXdvcTRURVpTc1VPWVZFTjdwZkRCYzlDUlQ0SmVDUitXd3o5NCtoUVM4L01I?=
 =?utf-8?B?c3lCMWI0d3Q0S2l5TVZjN3hJRkIwcFFlWHd2aTBQRWh2cE5PenZUSDdqODBU?=
 =?utf-8?B?R0tEY3ViOHlSK215blpHTkN6NmN5YmVqSDNJT0lYMVZQVXl5ZG95MitadEx3?=
 =?utf-8?B?VURFVXJ0NEt6TFVWbG9iR2RMOHBhVzM3cFEzR2RTbEw3WVN3dmlCZThBSXhi?=
 =?utf-8?B?ZXcra1ZVUDFKbzJjMFpERnRobkJsRU9yckQrY0l1MnBEd0lDRENtR01UYkhs?=
 =?utf-8?B?Smt0ZzJmQnJZRHp5SnJUaDNZY0s5S2ZUem1VMC85Tml3OFdMaEo1K0hxcEZW?=
 =?utf-8?B?Q0FEUFVVQkNzMUlZNndyVUg4Q1k3S0JZZjZTSmN1b2lwbHViL2NSWXV6WmEw?=
 =?utf-8?B?TzRyc3Bia0dOenhjUnBhejZEWWxMVk9NZjRYZTdxQ1pTMnNTNXJ2cFR5bWE2?=
 =?utf-8?B?M2JwTks1NU5IVWh5dGZoZzlRblVGVkovS0pHaXhyRGxYdzlLZnJGWnhlcEhG?=
 =?utf-8?B?VDBwQVQ3eDJFT3dZNm1jTndnOWF2N1AxMTdqaUNKbUZuWDNrejl1SVRqN3Vk?=
 =?utf-8?B?a0RDZnhwejNqVHNZczdFTFdnSGl5K09RbUVqSTZ5aFEzT1kvMXJBMUQyNXFT?=
 =?utf-8?B?aTZXalNVMEdZVmppb3Z1TERUV2diMS9Oa2pCL1RaNnVSNm5LbTVDY2o3cEZa?=
 =?utf-8?B?K1FleVBzZDBhMXg2SW0wZnlFN0NxbTVscnRDeHR3S3JXNGZmUXlETEJnaEFl?=
 =?utf-8?B?WGpPamR0RHIwVE81SUtGTmVlcU5BUHNLcEFmR25TZzFEQ0lkR0V6cnZHamtk?=
 =?utf-8?B?bE5xc1pQTHJmdnZxZk83SnBQa1pJaHNBQkhYaUxXNDhxZ2cvMEViY3hJZmdN?=
 =?utf-8?B?ZzNXaFhHbHkrNG5sRDZXZy9OQW82TkFMSm4zUElSU0lSWklmTkRYdWg5WitY?=
 =?utf-8?B?cEtNTVNMSmgwb0FrUFNaMXM2QUtoQUdOczZoZmF2N1dsaTB5cHNRa1FlaTM2?=
 =?utf-8?B?UGh1WXJrQTdJQ21OUE11d2t6U3hPSHpCdXNyUHU3S2NqM0VUT2dkbnNNZlJC?=
 =?utf-8?B?V0FxdFl3VU9oSUdUWWFHNFlCNTNDaEpDbXJBS09SRVNZeFlsTU1uZUZ1dXhG?=
 =?utf-8?B?Y1IyejNCbmI5UGVPWHB4Q1pXaFZrRi82Tk1ySGlqVTlNa0l1YVprMjFOY3A3?=
 =?utf-8?B?TnpWWUh6a3JkL2VzZ0VRMGd6dDZTdWFFSjYrMUpKSitxL04xZmw4MVg1TFJH?=
 =?utf-8?B?Qnh6UzJtV2lxRVhCbm1UR0R5T1laSlBuekZkOEFMUGZJcFdWWnB3UkhvM2hJ?=
 =?utf-8?B?YzI0MEVTaEp5RVE3bTRLakZVaFg1R2RjeFRNNm42TFkwWHhNaVppMUxXRW9a?=
 =?utf-8?B?eXFhbWU1NndtNEZtNC9NSlVPZkduY3ZiYUk5UGt6b2REN2dNb0hyOHJTaEtq?=
 =?utf-8?B?ZGduVGMxbmpacXByclNjRTFTTGt0ams4N25UeS8vcjNTTWFhZWlvSVZYcEZa?=
 =?utf-8?B?NnNQNmt3MERBTVdyUVk3bEh1b3pCeFI3K2tNWCtUbDd5TUhBVWdMdlZVeEN4?=
 =?utf-8?B?L3ZwN3J4REI3NTVkSExWZWE2V3hPTGp0R0FKMHFYS3ZJN1R3TWV1OFcwQnhU?=
 =?utf-8?B?NGc5aEdLRisvWjdKN3B0d1BKTlJIa2U4QmVTV2xwK3F2UXA2V0hiL093aDhm?=
 =?utf-8?B?cGVROHJJVnB3Kzc0NVppSU9jSjNvdWRYeGJKRllKcFhQbGZJTEU5VnkwNTFk?=
 =?utf-8?B?OUlHMlZzaVlPNGJ3SEZxTklkWTUzNVYwYnl2ajJpc0NGOW9KbHFtNklDWVc5?=
 =?utf-8?B?RVEzVGtDdHZzK1hkbXorbm50VjJzVnVUam52TzFNMUtxSGpmUGJKbENxNWlE?=
 =?utf-8?B?RDF2RzdhWGJwRTBOK3ZsNlRUOWl5V29vTmhmNFp0ZUk2YmZxQ09PZllock9B?=
 =?utf-8?B?d2tlUU9ERzdncjlRREpsSWFsNTZPSHBsMURSNGJVMWhGUnU0aDhueGdTcmlC?=
 =?utf-8?B?UVh2eHRwd2RqaDc5dkM3S3R1azRUOGRLSzNDdlVFTGlxMW9taEdmU2ZhYVpS?=
 =?utf-8?B?cXZHLzZCQWZGajEwL0lZdjllbDBuVnlzKytuMW1Ob0hIY3c0aTRHeEIwVG9t?=
 =?utf-8?B?YzZmWWJlc01zREEwbStzRm8remdBekxndVp6MHZ1elR2cFpESmprVzdJUVVi?=
 =?utf-8?Q?lOz9TARP84z0HoiM=3D?=
X-Exchange-RoutingPolicyChecked: eL2JQ+TQ6PTaI1Kyok9MmDh53iowMxzpotwPs/qqoat+qvWxBkbXAlhf0yshSh9B5IBYiokVHg3gLCcAoPW/j1SaPwfTAsjAgdcG7XEEIrYZKgIm+Jex8BdJG7DzPsJSH66rmOcy+LoWr+pFtJN19SHPQJIJu2VcQQ/RgtED8BQTLR7iKRu7JayngwLypQlplcjqOBBLv1ocfNcnA7YXVdu7OdWnq8+nc5sqvwDLni/7/+5tbFvOc1KEKJLMabclu1KCDQ8Z8h+2HruAchfKvHJn+dv+8uYk0/UoqYmB2c0836hOzGWEsnroFP4vgBfN2Pfu3d80iK+h7mKG4sAS9Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e6cca69-98a6-4ea0-1837-08def4c6f23c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 21:00:44.0730 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E48Cte6NX2/BUnnL2YLeazKQcqMR+0DHto5k0kXuKSsh+fb4EDreZoxNiAQ+Cpjk9/bmbQqP5G5ffERmxd8EeXkBQp5DbM6Rmc24unW0pkU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8436
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

On Thu, Aug 06, 2026 at 05:09:31AM -0700, Anoop, Vijay wrote:
>From: Anoop Vijay <anoop.c.vijay@intel.com>
>
>Add xe_sysctrl_check_app_status() to query the state of a System
>Controller application using get_app_status_by_id mailbox command.
>
>The helper maps xe_sysctrl_app_id values to firmware application
>IDs and returns the reported application state. Add a convenience
>wrapper to check diag firmware application readiness.
>
>Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
>---
>v2: (Badal)
>- Return SysCtrl firmware application states instead of errno for
>  application lifecycle conditions
>
>v3: (Riana, Badal)
>- Replace string-based app identifiers with enum xe_sysctrl_app_id
>- Use get_app_status_by_id (opcode 0x05)
>- Move mailbox definitions to xe_sysctrl_mailbox_types.h
>- Return enum xe_sysctrl_fw_status consistently
>- Map communication failures to COMM_FAILURE
>- Add INITIALIZED state and status helpers
>- Fix Diagnostics typo
>
>v4: (Anshuman)
>- Make xe_sysctrl_check_app_status() internal
>- Remove unused app identifier
>
>v5: (Anshuman)
>- Rename OOBMSM status helper to use xe_sysctrl_* prefix
>- Remove xe_is_diag_fw_ready() helper
>
>v6: (Riana)
>- Use xe_sysctrl_create_command() helper instead of manual FIELD_PREP
>  header packing
>- Rename xe_sysctrl_get_app_status_by_id_{req,resp} to shorter names
>- Use hex constant for application ID
>- Move oCode application readiness helper to a separate patch
>- Add xe_sysctrl_is_diag_fw_ready() helper.
>---
> drivers/gpu/drm/xe/xe_sysctrl.c               | 63 +++++++++++++++++++
> drivers/gpu/drm/xe/xe_sysctrl.h               |  1 +
> drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h | 63 +++++++++++++++++++
> 3 files changed, 127 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_sysctrl.c b/drivers/gpu/drm/xe/xe_sysctrl.c
>index 1db20be8158b..35b8b8b85a48 100644
>--- a/drivers/gpu/drm/xe/xe_sysctrl.c
>+++ b/drivers/gpu/drm/xe/xe_sysctrl.c
>@@ -13,9 +13,11 @@
> #include "xe_device.h"
> #include "xe_mmio.h"
> #include "xe_pm.h"
>+#include "xe_printk.h"
> #include "xe_soc_remapper.h"
> #include "xe_sysctrl.h"
> #include "xe_sysctrl_mailbox.h"
>+#include "xe_sysctrl_mailbox_types.h"
> #include "xe_sysctrl_types.h"
>
> /**
>@@ -130,3 +132,64 @@ void xe_sysctrl_pm_resume(struct xe_device *xe)
>
> 	xe_sysctrl_mailbox_init(sc);
> }
>+
>+static enum xe_sysctrl_fw_status
>+xe_sysctrl_check_app_status(struct xe_device *xe, enum xe_sysctrl_app_id app_id)
>+{
>+	struct xe_sysctrl_app_status_req req = {};
>+	struct xe_sysctrl_app_status_resp resp = {};
>+	struct xe_sysctrl_mailbox_command cmd = {};
>+	size_t out_len = 0;
>+	u32 flags;
>+	int ret;
>+
>+	if (!xe->info.has_sysctrl)
>+		return XE_SYSCTRL_FIRMWARE_APP_NOTSUPP;
>+
>+	req.app_id = (u8)app_id;
>+
>+	xe_sysctrl_create_command(&cmd, XE_SYSCTRL_GROUP_CORE, XE_SYSCTRL_CMD_GET_APP_STATUS_BY_ID,
>+				  &req, sizeof(req), &resp, sizeof(resp));
>+
>+	ret = xe_sysctrl_send_command(&xe->sc, &cmd, &out_len);
>+	if (ret)
>+		return XE_SYSCTRL_FIRMWARE_COMM_FAILURE;
>+
>+	if (out_len != sizeof(resp)) {
>+		xe_err(xe, "sysctrl: unexpected get app status response length %zu (expected %zu)\n",
>+		       out_len, sizeof(resp));
>+		return XE_SYSCTRL_FIRMWARE_COMM_FAILURE;
>+	}
>+
>+	flags = resp.flags;
>+
>+	if (!(flags & XE_SYSCTRL_APP_RESP_VALID))
>+		return XE_SYSCTRL_FIRMWARE_APP_INVALID;
>+
>+	if (!(flags & XE_SYSCTRL_APP_RESP_BOOTED))
>+		return XE_SYSCTRL_FIRMWARE_APP_NOT_LOADED;
>+
>+	if (!(flags & XE_SYSCTRL_APP_RESP_INITIALIZED))
>+		return XE_SYSCTRL_FIRMWARE_APP_BOOTED;
>+
>+	return XE_SYSCTRL_FIRMWARE_APP_INITIALIZED;
>+}
>+
>+/**
>+ * xe_sysctrl_is_diag_fw_ready() - Check if diag firmware is fully initialized
>+ * @xe: xe device instance
>+ *
>+ * Returns true if diag firmware has reached the initialized state, indicating
>+ * it is ready to handle requests. Returns true also on platforms without System
>+ * Controller support, as there is no firmware gate to wait on.

When there's no system controller, you still return true? What does that 
mean? On all such platforms Diag FW is already available/loaded? If so, 
please clarify in the comment. 

>+ *
>+ * Return: true if diag firmware is initialized or sysctrl is not present, false otherwise
>+ */
>+bool xe_sysctrl_is_diag_fw_ready(struct xe_device *xe)
>+{
>+	enum xe_sysctrl_fw_status status =
>+		xe_sysctrl_check_app_status(xe, XE_SYSCTRL_APP_DIAG);
>+
>+	return status == XE_SYSCTRL_FIRMWARE_APP_INITIALIZED ||
>+	       status == XE_SYSCTRL_FIRMWARE_APP_NOTSUPP;
>+}
>diff --git a/drivers/gpu/drm/xe/xe_sysctrl.h b/drivers/gpu/drm/xe/xe_sysctrl.h
>index 090dffb6d55f..8dc576796890 100644
>--- a/drivers/gpu/drm/xe/xe_sysctrl.h
>+++ b/drivers/gpu/drm/xe/xe_sysctrl.h
>@@ -20,5 +20,6 @@ void xe_sysctrl_event(struct xe_sysctrl *sc);
> int xe_sysctrl_init(struct xe_device *xe);
> void xe_sysctrl_irq_handler(struct xe_device *xe, u32 master_ctl);
> void xe_sysctrl_pm_resume(struct xe_device *xe);
>+bool xe_sysctrl_is_diag_fw_ready(struct xe_device *xe);
>
> #endif
>diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>index d0341538ad05..5e39d2a9c2b0 100644
>--- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>@@ -14,9 +14,11 @@
>  * enum xe_sysctrl_group - System Controller command groups
>  *
>  * @XE_SYSCTRL_GROUP_GFSP: GFSP group
>+ * @XE_SYSCTRL_GROUP_CORE: Core group
>  */
> enum xe_sysctrl_group {
> 	XE_SYSCTRL_GROUP_GFSP			= 0x01,
>+	XE_SYSCTRL_GROUP_CORE			= 0xFF,
> };
>
> /**
>@@ -38,6 +40,67 @@ enum xe_sysctrl_gfsp_cmd {
> 	XE_SYSCTRL_CMD_SET_HEALTH		= 0x0C,
> };
>
>+/**
>+ * enum xe_sysctrl_core_cmd - Commands supported by Core group
>+ *
>+ * @XE_SYSCTRL_CMD_GET_APP_STATUS_BY_ID: Retrieve application status by ID
>+ */
>+enum xe_sysctrl_core_cmd {
>+	XE_SYSCTRL_CMD_GET_APP_STATUS_BY_ID		= 0x05,
>+};
>+
>+/**
>+ * struct xe_sysctrl_app_status_req - Get application status request
>+ *
>+ * @app_id: Application ID for which to retrieve status
>+ */
>+struct xe_sysctrl_app_status_req {
>+	u8 app_id;
>+} __packed;
>+
>+/**
>+ * struct xe_sysctrl_app_status_resp - Get application status response
>+ * @flags: Application status flags (see XE_SYSCTRL_APP_RESP_* definitions)
>+ */
>+struct xe_sysctrl_app_status_resp {
>+	u32 flags;
>+} __packed;
>+
>+/** XE_SYSCTRL_APP_RESP_VALID - app_id is recognized by System Controller firmware */
>+#define XE_SYSCTRL_APP_RESP_VALID		BIT(0)
>+/** XE_SYSCTRL_APP_RESP_BOOTED - application has completed its boot sequence */
>+#define XE_SYSCTRL_APP_RESP_BOOTED		BIT(1)
>+/** XE_SYSCTRL_APP_RESP_INITIALIZED - application has completed all post-boot initialization */
>+#define XE_SYSCTRL_APP_RESP_INITIALIZED		BIT(2)

I think caller doesn't care about the above bits, so these defines can 
just move to your c file.

>+
>+/**
>+ * enum xe_sysctrl_fw_status - System Controller firmware application lifecycle states
>+ *
>+ * @XE_SYSCTRL_FIRMWARE_APP_INVALID: app_id is not recognized by firmware
>+ * @XE_SYSCTRL_FIRMWARE_APP_NOT_LOADED: application is known but has not yet booted
>+ * @XE_SYSCTRL_FIRMWARE_APP_BOOTED: boot sequence completed, post-boot init pending
>+ * @XE_SYSCTRL_FIRMWARE_APP_INITIALIZED: application fully operational
>+ * @XE_SYSCTRL_FIRMWARE_APP_NOTSUPP: System Controller not available on this device
>+ * @XE_SYSCTRL_FIRMWARE_COMM_FAILURE: communication with System Controller firmware failed
>+ */
>+enum xe_sysctrl_fw_status {
>+	XE_SYSCTRL_FIRMWARE_APP_INVALID,
>+	XE_SYSCTRL_FIRMWARE_APP_NOT_LOADED,
>+	XE_SYSCTRL_FIRMWARE_APP_BOOTED,
>+	XE_SYSCTRL_FIRMWARE_APP_INITIALIZED,
>+	XE_SYSCTRL_FIRMWARE_APP_NOTSUPP,
>+	XE_SYSCTRL_FIRMWARE_COMM_FAILURE,
>+};
>+
>+/**
>+ * enum xe_sysctrl_app_id - Known System Controller application identifiers
>+ *
>+ * @XE_SYSCTRL_APP_DIAG: diag application (firmware ID 13)
>+ */
>+enum xe_sysctrl_app_id {
>+	XE_SYSCTRL_APP_DIAG	= 0x0D,
>+};

The helpers to check diag and oobmsm states do not take in APP ID, so 
the app ids should move to your C file.

Thanks,
Umesh

>+
> /**
>  * struct xe_sysctrl_mailbox_command - System Controller mailbox command
>  */
>-- 
>2.43.0
>
