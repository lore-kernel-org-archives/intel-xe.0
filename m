Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDF2FC88E75
	for <intel-xe@archiver.kernel.org>; Fri, 18 Sep 2026 07:41:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94EA310E826;
	Fri, 18 Sep 2026 07:41:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JcNXhkmH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 109B810E826
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Sep 2026 07:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789717260; x=1821253260;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=+P0ZZurZDRNEWTnX479DQC2D/cE5JZITf/CqvZc9bio=;
 b=JcNXhkmHCn7xwXMxMxNlwUFuaJykKWKvATZBcwGvypNiD7k3t4KSfq1k
 dGK+HLxsQSl9TNjVqEvILbEnRf/HMlPGHL2x4gsRCfKkBrfAhFT6JdKFr
 hmenlReRLzy2JgK9d+ElaOhpCty83UY3lYJqkyGls8prU7Kog6aeJwOBw
 D1h1XQup6tHZaKwZsPbK1b2HKqliFOnBCD2RwNCCLSBf4AHZT7/0UCqhk
 WlJ09cudG92oWQK0oZfzW4rzZ7ir1e0uDMd8dkG/WdpF+FO/UIPyzak6R
 VjuaEXEodtI4hq4f7BtMhAx4P64TPau+Ms1fz09CbD9oYJD+wMBfh+vFo A==;
X-CSE-ConnectionGUID: 8GgqpURcRVehzlv4aY8kpg==
X-CSE-MsgGUID: i3c32dvpRr6++SUz227kyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="107708467"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="107708467"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 00:40:59 -0700
X-CSE-ConnectionGUID: DvCv0ukwTeu9YWWOoTYpoA==
X-CSE-MsgGUID: 3USnLWn5QH6d3l7rF2NVkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="269966091"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 00:40:59 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 18 Sep 2026 00:40:58 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 18 Sep 2026 00:40:58 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.23) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 18 Sep 2026 00:40:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hDPC8JpfYm9w2LLWmX5QkJtJQ6dBD4E8x4GvPhG8duPwXzSHuxujVUISsNW9Zj+aU4c9UGNWIeY3ujuUEguyTOG6NrwgR5TbPOeqp0D1O/+eFmsBTaemhQb2KssHohs1nVpXTSjDzYOvo1ekGYZq4cQY5yViQS1CQpqTz+oPfmW3UrKa7VqLqDtZVsdQdNS8Vn95ZqQBue7qHCd81dTQ5cmsA/u101hSvN/a6psi5SbPdZJHklhV8FsVNN/C4l5tZ5dZAYQLZxnl7j4L6qv4IgGuFmZdy3VVtaNAsUtq7Y0nm7aq5D9vF1RZUXzac0wZ2SGcE7g19XcQV3sHooA+Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SMCMqX91ObPQBYTypMtL3uAhl/QwqzpKTmdo2jg1cwk=;
 b=d1OdhMVER4hJ91enlse62vHpAqnKFm1aULzT9nA+A2wg+m8TsVbzmMo7oeZeMz8T6wAk11Ny4bDzRSyUzV2x/+ID8VdTHDrin/34Y3q8YGzqWOlSrn67n1w26bKTAGjuldRcR9RB5vNhW+eQqa3TWFEkCmgv56FGTV5zP9pD8ZWpKb4x/kDpY9x4Cl90Nqm6D8zdyATVnawCYQGjsiIwe/6SKJP7C/1nAcFxZBvOZiO35ieHOIR2H3AGFeJ5R24znZigvGaJcuFaoziOCAHDvxkW9zoSkfkBT+GVhHX3hRZemLqddJUDQMzaSfNadBhDgBsQxARc+Xi/Fxu4aOEJdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7551.namprd11.prod.outlook.com (2603:10b6:510:27c::12)
 by SJ2PR11MB7669.namprd11.prod.outlook.com (2603:10b6:a03:4c3::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 07:40:48 +0000
Received: from PH7PR11MB7551.namprd11.prod.outlook.com
 ([fe80::5cbf:6b33:5f0c:88a0]) by PH7PR11MB7551.namprd11.prod.outlook.com
 ([fe80::5cbf:6b33:5f0c:88a0%4]) with mapi id 15.21.0428.009; Fri, 18 Sep 2026
 07:40:48 +0000
Message-ID: <0300c6bf-3f12-4944-a8fd-370ce07fd9d3@intel.com>
Date: Fri, 18 Sep 2026 09:40:44 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/13] drm/xe/pat: Return error from
 xe_pat_init_early() on unknown platform
To: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@Intel.com>,
 <intel-xe@lists.freedesktop.org>, Matt Roper <matthew.d.roper@intel.com>
References: <20260908104550.1283933-1-dnyaneshwar.bhadane@intel.com>
 <20260908104550.1283933-9-dnyaneshwar.bhadane@intel.com>
 <0425ad1e-6ed9-4fa0-a768-c5d0871b1bb8@intel.com>
 <a4fe2692-700d-4a88-ba1d-6806e6ea4b12@Intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <a4fe2692-700d-4a88-ba1d-6806e6ea4b12@Intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM7PR03CA0019.eurprd03.prod.outlook.com
 (2603:10a6:20b:130::29) To PH7PR11MB7551.namprd11.prod.outlook.com
 (2603:10b6:510:27c::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7551:EE_|SJ2PR11MB7669:EE_
X-MS-Office365-Filtering-Correlation-Id: 5633b217-b397-4fd5-faa7-08df1558280c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|56012099006|10067099003|4143699003|6133799003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: NOEP8amnuhVUSgXFDXgZVWVNLpdLeuNZCaTm42LCQXeg/Hy+3fbwvyCkIIGlqBGaACCYtgzn08eS58fSQNuDeq5mHWmH9l+e4ixYpUPKfJFTc+uM4viURuEE9TerfydaAq+xZ27vj9zUTqxcGmB+FEdcRgsvPrCsu74+qtkKEfaie7uTpay7r/bZY9whkHCtJmzQtC5EkEwga2H/+qmu4xs8m6yAERbPqFzSW4MSL4NLd226xCOyC9TgK0zpRPwLRnQukNUZ+01iUJgjG3ELvSCWTWKsxHWXybd3JXGwidNkAsKD6idAqosO4vjwTm8Y06Y3bDCBw1/ZgYxv26lz4GRr18qB4oZZgaYZKKIcCl1fivAVjx0NzjZUrYRgMVw8ILZGUqD126XmHiSCiPLAdEtLHQ2j5LepmVPfyEp1Z/ZhtuIv/r7LdGJkYcQQuaHngQx9hkvYazmxc/cKzp+ufaXoL22/ybe86zcUdoW8qCvldAVpQaFc8KVy1A+lyE5TUqFjS1Kkzsv8s3BcWv0Bkfwktj5gIWYbCEduIHXG+btwrHX5WwAeVkym6yugZmXVZ0UY4CQ+Rc/Bi2Z1c39dLDZ41bHIzYxz3ynfrwiy1h0G6HuWRXSkPEiDoK15Z0Gj
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7551.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(56012099006)(10067099003)(4143699003)(6133799003)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YW1hOGlwbEQycHd2dUJZeWZXb2o2b1RUMWNEdXZGTWhzR2ttUnVFai9uS3Nq?=
 =?utf-8?B?a3BsVTlqVFd4Vy9YbVpSTy9pcXRqbG43c0R4MmtpdjlTNktiUjMrUE1QNmdS?=
 =?utf-8?B?MU1HQ2Znc0duRmxUL1g4bTh2V2xFVzhud3NxZXg5YmFBMEw5Nm5FRHZBMndG?=
 =?utf-8?B?YVFFNWhhUzNuT2hrZHdTcjM2dk1NY3ZjdDFDWEd3MkpxT0Qvam00eEl0UWhH?=
 =?utf-8?B?eGRxN0JxOEZCR3BCaldmT3JobUFVT0hzMnBiRnU0MWtzam55Y0ZKSDhOTFhG?=
 =?utf-8?B?QTBYUCtmWFYvbDhEZUYrbklBbFVoeEpjOUhIamtzS2RZK2FjQU1OaS9rUzNN?=
 =?utf-8?B?TjBZdy93QnIrMUtaZnFScys4TU9tdjBiZ1Q3a05TNDdzUENObUoyY3JsSDhV?=
 =?utf-8?B?ZW1UM2hCV3ZNRjhCbzJaV0o5R2N5VHBGQUp6ZTkzREhoeWtYWC9kOUNWK1NN?=
 =?utf-8?B?N1JSQ29FRkZIS2FVWVg4a3JMVEp1RlVZTWVWRHhKMVJVU21tcWkvNmExRXNC?=
 =?utf-8?B?Z1FxOGRtdDB3amE1bVFFcGtraG1QamQvaEhxL3hSSThkSXRlVVdSU1dhaGF0?=
 =?utf-8?B?OVNLdmtwcW83WmpsRCtzMXg1dDJ6aHFnRVBhOFJ0dnZSN0MwYjJDTms3RUFr?=
 =?utf-8?B?dWZiQmt4c1FQaENmVHplRkJEY2t5cm1tWW1Td0lRaGJYRS9zNmJNeklyRmFQ?=
 =?utf-8?B?Z0VCSDF5NmROTS9xZGF0eHhGZGdFRTFmUWJnRU9XdEU4cUljZnZwNDcrbmNB?=
 =?utf-8?B?U3lMU2JQUFpCeVZzUlRXZG9tdHVvbC84RFdmOG5zdkJKc0lmN3lVdC85eE1C?=
 =?utf-8?B?cC9zcmRGMFZhSGVNdHhVb2ZEa1JudTRtYyswa2dXZDBQWlJHcHZvZWNWNnkw?=
 =?utf-8?B?eisxbXVJTVJDRE94Ni9BTTIzYzlZN0xldlA5eUFFTDh0RmR4REpHeFhlV2ds?=
 =?utf-8?B?cldZTFFKSWtBQ09VRWpvaFF0bGxEMERoTEN2US9sczRrbEswRXpLSlhiZnp4?=
 =?utf-8?B?TnE0UytaNHdoNXhseUlOMUtxWmQzU045S2VlaklTOC85NFpWVUlabVQrRHlP?=
 =?utf-8?B?N3BRUmVUY3hmbkFTbzZtb2c0T0o0TDdzY0ZGWWdjQ2Zrd3NsKzRrWGpIdTlk?=
 =?utf-8?B?Zlg2ekMyalVUb0RjVHM3VS9vSXNzRVVFNUNmTFU4SEpXWCtRK2xzMjhienVj?=
 =?utf-8?B?eW9zTEtpV051blhObVZMT09CRmJ5Z3AzbG9YR1JzODR2VmZsWkNnZWNpOWFq?=
 =?utf-8?B?dU9xeU13RkZUVys0WE5udlJMR3FlWnY3aGhkeVRtWGRqQkc0cEhOODVoVzlG?=
 =?utf-8?B?cGxuWDBjYW5Kbll1MTBFNnpzZklpL0NpQXNHYk80anRQekhoQnYyeWh5MTVk?=
 =?utf-8?B?T1kvZnN5aWhKdllHWVhmeVdoY3lHQnJ1RGR1aFNUMGtVbUlFRmdLM1RYeFEx?=
 =?utf-8?B?QkdRYWhWK1ZPc0VJVDBLa2FrTGNzRlg1R0VnR0tRVnhycGd0V0RxOVhuRU5q?=
 =?utf-8?B?UmhQV2V1akFGTnc4elhIVmM2U3hEWjA0bXdVWm1sMzlWT003WmdXaXJqWEg0?=
 =?utf-8?B?U3ZpL2wxRzRzZHVVOUhvU093NE1wVjI1Y2E5M0V2TWNVWW4wWm5YQlhPSnpx?=
 =?utf-8?B?ampBNUY4dVV5c0NTb1ExclhhRU1TdlNvc2lzYnhBR1ZGZ0RMU0kvS2E1bG90?=
 =?utf-8?B?NWhQUzBrVEtjY0FxUGFEREhZdjVMTWlkWk9Ncmw0d0h3ME1FYmF6NXk1cE8w?=
 =?utf-8?B?Wk1VaTZhekd3elpSa2x6QVZTaXNSVTlQVGg3bkx3SGRNd0pNKzRWNTRrL21m?=
 =?utf-8?B?NHoyUlF5bTZWcDZJVGZxakZrU0lwYUZycjIrbGorcDZLR2c2OW45OFg1N2or?=
 =?utf-8?B?eUY3VXg2dkM0TGhVUkQxVHBPMXFhWW5EZmxQbHp6Wm02TFVvdkFGVkRZdzFh?=
 =?utf-8?B?b1I1amhSakRWV1FjYTJ4Z1A1NHZndEZqVm1VbkxwUDlGMTZCWHhIRGFSd1Bt?=
 =?utf-8?B?OGpxaTNLTGxwRDkvbm5RMktBZmFBWHlOYjRIMGpDSzlWQW83YUV5YTdBZE0z?=
 =?utf-8?B?ZzlUandUTEFCOHQ1NW1HWm5YMjlMdVgwaW52V0xkYjRHNklGTmQwRXRVdzM1?=
 =?utf-8?B?SGtkNjFMc3NBTm85RktCV2MzZWx2QnNmdFpkd2U0Wjk2eXl0TWlDWER2Mk5U?=
 =?utf-8?B?STh2cnBWbzlDM3VUemZBbk51UEh6WGZmZzJhYVJwZTQvWFBGdWRWVTMvakkx?=
 =?utf-8?B?ZHhWeFN1ZjBqcXRzNlNaUFNOdE9OSzhrVWtWRXhwYnR1eVN3emlGSEFGWmhQ?=
 =?utf-8?B?UTJpLy9zakorOTA3VFhCSURTZ2Z2Y2pxZWNua3JjOGFUeVBjMHJKR21vWXo2?=
 =?utf-8?Q?UCa8BG1ULRu3ylFE=3D?=
X-Exchange-RoutingPolicyChecked: rGJamZkQM0DGXSJnuegpUTquMWPlawmy8jrNc3euBM3VsL07O+KFX2uUkjKsYsFUNmu+rGa6Z6dSYAgL1frxzcU7bQCBZFsxxz5Y8EB/rchZvP8/PVp70qdgoEG+ajFuj8hxcAjNQNeHHe/lNyVPChHWVix1bUZ9tgwKynL/dHdRA/N2hHCybwHseoWVsGAHfb8q/QpBUq0PuMMGYcTAA41ZHwDzdaKT9sQCMW/x/iSxruv/80WBZkMOfEDccIU5TPCCTHbyI02mS0VjqKMATqfrUm4Mw6EBkoFwBe7dabQFFXr/jR0VEHHN6HbG+/ABan4HODXj/Gba8QL20zKWbg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5633b217-b397-4fd5-faa7-08df1558280c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7551.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 07:40:48.4285 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SS3zvhfXuhVCeEafvlstvSZhWbAudDMn5sNrsR8B5+0NxQKj7M0X39ClaWRI3TZOHGN1Q73hcQtCnPZ0Q/otl6p6HDGiaqLyVr541WdswQ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7669
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



On 9/18/2026 6:31 AM, Dnyaneshwar Bhadane wrote:
> 
> 
> On 09-Sep-26 12:07 AM, Michal Wajdeczko wrote:
>>
>>
>> On 9/8/2026 12:45 PM, Dnyaneshwar Bhadane wrote:
>>> xe_pat_init_early() currently only logs an error when the platform's
>>> graphics version doesn't match any known PAT table, but continues
>>> probing with an uninitialized pat.ops. This can lead to a NULL
>>> pointer dereference later when pat.ops is used.
>>>
>>> Change xe_pat_init_early() to return an int and propagate -ENODATA
>>> to xe_device_probe() so the driver fails to load cleanly instead of
>>> continuing in a broken state.
>>>
>>
>> Fixes: ??
> Hi, For the missing pat we should not process the further as we need proper IP specific xe->pat.ops assigned before moving from this function. so early exit from the driver probe would limit the pat->ops null pointer in xe_pat_init access.?

I know what's broken, as I pointed that out in [1]

what I meant here, that maybe we need to add the proper "Fixes:" tag with the commit that introduced that possible NPD

[1] https://patchwork.freedesktop.org/patch/744652/?series=171725&rev=1#comment_1371831

>>
>>> Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_device.c |  4 +++-
>>>   drivers/gpu/drm/xe/xe_pat.c    | 14 +++++---------
>>>   drivers/gpu/drm/xe/xe_pat.h    |  2 +-
>>>   3 files changed, 9 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>>> index 8583b2e9ecf4..b7f78d45dee1 100644
>>> --- a/drivers/gpu/drm/xe/xe_device.c
>>> +++ b/drivers/gpu/drm/xe/xe_device.c
>>> @@ -960,7 +960,9 @@ int xe_device_probe(struct xe_device *xe)
>>>       int err;
>>>       u8 id;
>>>   -    xe_pat_init_early(xe);
>>> +    err = xe_pat_init_early(xe);
>>> +    if (err)
>>> +        return err;
>>>         err = xe_sriov_init(xe);
>>>       if (err)
>>> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
>>> index a5fe1beec652..8af92e3c4c17 100644
>>> --- a/drivers/gpu/drm/xe/xe_pat.c
>>> +++ b/drivers/gpu/drm/xe/xe_pat.c
>>> @@ -590,7 +590,7 @@ static const struct xe_pat_ops xe3p_xpc_pat_ops = {
>>>       .entry_dump = xe3p_xpc_pat_entry_dump,
>>>   };
>>>   
>>
>> now it's time to add kernel-doc
> Yes, I will add this in document.>> -void xe_pat_init_early(struct xe_device *xe)
>>> +int xe_pat_init_early(struct xe_device *xe)
>>>   {
>>>       xe->pat.idx[XE_CACHE_WB_COMPRESSION] = XE_PAT_INVALID_IDX;
>>>       xe->pat.idx[XE_CACHE_NONE_COMPRESSION] = XE_PAT_INVALID_IDX;
>>> @@ -678,22 +678,18 @@ void xe_pat_init_early(struct xe_device *xe)
>>>           xe->pat.idx[XE_CACHE_WT] = 2;
>>>           xe->pat.idx[XE_CACHE_WB] = 0;
>>>       } else {
>>> -        /*
>>> -         * Going forward we expect to need new PAT settings for most
>>> -         * new platforms; failure to provide a new table can easily
>>> -         * lead to subtle, hard-to-debug problems.  If none of the
>>> -         * conditions above match the platform we're running on we'll
>>> -         * raise an error rather than trying to silently inherit the
>>> -         * most recent platform's behavior.
>>> -         */
>>
>> can't we leave this comment as-is?
> Noted. Thank you Michal
> 
> Dnyaneshwar, >
>>>           drm_err(&xe->drm, "Missing PAT table for platform with graphics version %d.%02d!\n",
>>>               GRAPHICS_VER(xe), GRAPHICS_VERx100(xe) % 100);
>>> +        return -ENODATA;
>>> +
>>>       }
>>>   +    xe_assert(xe, xe->pat.ops);
>>>       xe_assert(xe, xe->pat.ops->dump);
>>>       xe_assert(xe, xe->pat.ops->program_graphics);
>>>       xe_assert(xe, MEDIA_VER(xe) < 13 || xe->pat.ops->program_media);
>>>       xe_assert(xe, GRAPHICS_VER(xe) < 20 || xe->pat.ops->entry_dump);
>>> +    return 0;
>>>   }
>>>     void xe_pat_init(struct xe_gt *gt)
>>> diff --git a/drivers/gpu/drm/xe/xe_pat.h b/drivers/gpu/drm/xe/xe_pat.h
>>> index 7060f66e1d63..66e335fb3b0c 100644
>>> --- a/drivers/gpu/drm/xe/xe_pat.h
>>> +++ b/drivers/gpu/drm/xe/xe_pat.h
>>> @@ -43,7 +43,7 @@ struct xe_pat_table_entry {
>>>    * xe_pat_init_early - SW initialization, setting up data based on device
>>>    * @xe: xe device
>>>    */
>>> -void xe_pat_init_early(struct xe_device *xe);
>>> +int xe_pat_init_early(struct xe_device *xe);
>>>     /**
>>>    * xe_pat_init - Program HW PAT table
>>
> 

