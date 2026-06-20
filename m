Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C82B7CD4F26
	for <intel-xe@archiver.kernel.org>; Sat, 20 Jun 2026 16:00:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63F4410E220;
	Sat, 20 Jun 2026 16:00:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XhmkTPYW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E93BD10E220
 for <intel-xe@lists.freedesktop.org>; Sat, 20 Jun 2026 16:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781971258; x=1813507258;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=OFMThWCfD940z3qCpOYfZz+JR1bcDVuhNQGr+QCh28k=;
 b=XhmkTPYWvHDOlMt4Sb/gNPUOnFzY8nDtwd4SwvWNST4uH8jsuSPXcwTd
 oIbdbuIEM7FYlFtlim6pFHe0oCPe8SDfjfJPGsAn2tnk9vapn8QqyTmIG
 E+9eHWvL7KMwf+I78v/YIqsQeSwElC3XSB+BQx2Rm3UozXOwijVJ/N6F/
 TwrkhyYjSTefwidKMaSIVfn+zFfVCKHmisW9aL4otNPge3Tf9cga9INto
 hPWgbIjl9v0G6trKQ1pvcf4PDGKckKNAQnLPA7pI5UnoowMtG0cxgwI81
 MSb21bgfWuoyMsoOXC+vE/5AX1wjFKAZ/WrOXFCp2LBf/AJwxb2A6vy1/ A==;
X-CSE-ConnectionGUID: f+3tvXQnRbG+MqBWs8mPLA==
X-CSE-MsgGUID: UFXHrQQOTwO06rm6rh3uGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11823"; a="86616445"
X-IronPort-AV: E=Sophos;i="6.24,215,1774335600"; d="scan'208";a="86616445"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2026 09:00:57 -0700
X-CSE-ConnectionGUID: 7TvDlHuET4q4yChUfVnjxQ==
X-CSE-MsgGUID: DApblk/5Qoyj7G9tb8T0bQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,215,1774335600"; d="scan'208";a="253172515"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2026 09:00:57 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sat, 20 Jun 2026 09:00:56 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sat, 20 Jun 2026 09:00:56 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.66)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sat, 20 Jun 2026 09:00:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B4eXm3RtgSsYfwhMo9e6K3MZYUTM9aMx7AKGvJ5kn7jrjgYpJNKRN5fN6v3WChG0le3us9gWvGatKLSwArYVMwyWhK57bLJaBEaMnfLnpD+docwLwrSK5+eKV5GB8qXpPWgN7nFVT+w6oAthtYug4BDJ13lvChN94ehq/ZfIg9KQIZ2rzrcD1Sqrx1gUAdyd5q4e3aTDPaPolqsKxQ0ECkSyfh+ePS2lq3Uc3cQ/R1/z+wSVcKqJkI88M4lc+XxMNbOPCQoM1u3OzPfSg+6y4Vuxb0hhsI1XuLwYxawTYEJE3oCb5Cudhztl7PQ6aHQoebAxrQFhUbwnMIlDf54zIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PBDNq7Z7rjhvPUSVQRM0BvSY6KIVu2RgFfmzAbrOO7Y=;
 b=RuFtzjDALpPBBeqHHkJ4ob6jPWms84CTpjQemlfiZ1WBdbvaihbnF3gjE8yyL2pfvjEj+jvkT5bL6HfyzspMfK0YcihMuvpuE1MS+lU5QfcjKS2lK9eFkEBHJymT8l5nmNgDBD8V+y4v15lC4t5zrUa4hJoSQOmeMo2wZgvFYhi7XxlImeRpNMDeXBVjf+/uNwx0k0AQiysjNcIikGS8LdW02iBzd95FCfYZVHR09NsPtOzKnwcB8Z97eEpcEZkRNEVVpE2qm3JaUmEZYgBoberjxg43cxvFdmhNXS0uXdtWagoi0tsS1IevgQqhQb1edRHfBa1UKb3PLKOJ/HoLIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DS7PR11MB5989.namprd11.prod.outlook.com (2603:10b6:8:70::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Sat, 20 Jun
 2026 16:00:47 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0113.015; Sat, 20 Jun 2026
 16:00:47 +0000
Message-ID: <c57b5183-77f3-4dc7-bc2d-25e92618b60a@intel.com>
Date: Sat, 20 Jun 2026 18:00:42 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] drm/xe/guc: Use ID manager to get total number of
 contexts
To: =?UTF-8?Q?Pi=C3=B3rkowski=2C_Piotr?= <piotr.piorkowski@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260619202935.2701499-1-piotr.piorkowski@intel.com>
 <20260619202935.2701499-2-piotr.piorkowski@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260619202935.2701499-2-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VIVP296CA0009.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:357::9) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DS7PR11MB5989:EE_
X-MS-Office365-Filtering-Correlation-Id: 8464bb5d-5191-491c-0063-08decee51767
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|4143699003|18002099003|56012099006|11063799006|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: DVqKkwQpOvqma/08hXvJn8NHUua76VfJUGIvKOcNE+Wh5+5Ziwz+50uGv1eEh1L3GlAcohP+MG/SuQUgUPHlKKbwPlFSrYZ03ZvnJnoAocOi/yvrMqDUr2RMLRz9wOz8Qg7GBjrNNk77AFoMkNKGU7nPvD5IeGs4IWkOicrS5j2y+q9nEXCCiTXpzuCVIZu3hqxYWADOCsimZl6e7pJ24nYziiveuLxqV6Zb06T28OM/9t5FIDGszY3XNsTG1MRcH0xkesa0LxAaAOXo3fxroOSUVKirY9wgYfqpCCs4aguxiPiI08fdU07gtgkNp/n3NWZiBGpnk5Q5X5YVEGrcAH/ZjtbyoqWLZPQQ8XfdKBMnlIX1+C+3nthcETC6u8arkhQVrtEXUqUw3ou1DdVnlS7aHl4g9YOjOsOdPeu51jJ9g6vCbOSL41ELqoRJsadhsd6uAzVcKRSBKsPteASZ3qe1Y3YmQJaDpVx/f9CqfNX1KQA2BBd5/HgBXo9AuE2xkUFhDPut6iogkb+93XKF8Jg3qnuhs7M0ySGx+0y1PzToI02Yoi2wvS4ndj4ZUP74tCa6c+evp4+udmE5zVPPs/59dFM/7bOB9Lw6LeTi1lnJ9VvfPpo0UJcXOP5YN04GuMhlxpZTk+a0td3MgN2wd5VJchS1RrJyUOhJZ/doHoQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(4143699003)(18002099003)(56012099006)(11063799006)(22082099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TVBENk9tVWlEMVg2NTQ3ODJEaytjL29oTW04Y0FaWVp0SDJlRWpVby9laksr?=
 =?utf-8?B?OUFJNnhJanZwNkN6eHN5TlV0Tmp1a1Q5b24vS2VtcmtaNDN4K1V2MEEzVmFk?=
 =?utf-8?B?amFNY3Y3Smx5bm8yUWdpaHdmais4aCtucFVUdXZyUjd3cWJRWU9BeFdFNWJK?=
 =?utf-8?B?ODdRbjIrVFR2bE1aTVJoczc2U2xhNWVSMnpjQlovdFY1L0xGRUw0eGlBSjhW?=
 =?utf-8?B?dmozVWhTZkNKTU4wT0Z4cjJaVzFhWGg1ZHo3Y2RaRSsrdFFLMWdSUUd4UUl3?=
 =?utf-8?B?OVg5YkRWNHZPaXplOSsvWXBqaGJORGh3b3ByUFhINElGcXJkQjAwSlFCdWJj?=
 =?utf-8?B?eSt2VFFWdzFMaTUzSGxpTFlBSW94S0lmdFVuanRjaWFENzNnNVhwMFArVk43?=
 =?utf-8?B?ck5pS0x2RzFLTmpTNWpGMWtlYTJsQVE0V2xtaHBLRk1WOGZhb1A0NExwc0ZL?=
 =?utf-8?B?eExYTHRsWWdkNFA0NFFzMGVZUlhqeHZxa3ZrTGd0YldjcXJ0SnhQSGpLMDNL?=
 =?utf-8?B?UTFIeW5VemQ0eVkrSmZBOWZOV3g0QUgzL2tCeHo5RjBwYUxQYTUzN3lSaGRX?=
 =?utf-8?B?dktQbW95NXJERGV2Y2l6bC9FRUd6QTJ6bUM0aHRyb1Vma2VjaTF5QmtnMWNB?=
 =?utf-8?B?aHVvUktBRDY3T2g2dlBqYkhsMVFDM1l4ck53c2NtL0VaTFpsSW5iVllrZHp1?=
 =?utf-8?B?OEEyMDBTZVRDT2JxblVmd0NMODhtb0dvT2RqTC9LRTVSc1lNU3h3SitJYWtI?=
 =?utf-8?B?YmU5K1hBQjRpOW5yV0wyTEg2UUJ3RUFmUVphSFk3aS9zK2Evc0lPSGI2cmZw?=
 =?utf-8?B?MkltODROeXdrZ1FsMXFHT2JwTk5ST2VuZGI3SVVyaHo3YzdTSnA2anN2cHBP?=
 =?utf-8?B?TDl6bENYVXhCTVB2MTBOcVRZT0VLZkhBVm5waFowOEVUaU1hRGRlK0JpK0Vw?=
 =?utf-8?B?Q0RXanhQL1UvRHVZTVl5ZG00MVpUTjVEVVNMbkE2akZ4cUpXSEg4ZHNKSjZt?=
 =?utf-8?B?UXNRb3BrM3VNV2lSN2lZRVd2dVhzbnRTS1p6OUFpR25vVkxkZGFyMnp2STVj?=
 =?utf-8?B?V0wzYlEyakpiU2w3MWxhRTRFYVhxc1dXODl2MDB5MG1BWGtxQ2g0S1RzYlN2?=
 =?utf-8?B?VGlGRmw1eC9pdTMvV2dFWExaVG5XOHFZU0YyME0zWWQrQ1pJbmJuTFgxYTFU?=
 =?utf-8?B?OFhKMnBMZnNHRXozUUYzSTJNVFREVjVwdCtYTGR6bjk2V2JIcnBpY2NzODM2?=
 =?utf-8?B?akowM3hHM3M2SEJNK0xTeUFvMmNIaGFMZDdGQ2NOWXJUcXBYM0l6RnVQMGpJ?=
 =?utf-8?B?cy9xZ25FQ0ZqSHBUTlhvSktzNlZPYmo4VkMzUXdxeHhMVloxNmxIT2UyY1Ft?=
 =?utf-8?B?ZU1na1lpTmhpVG1RTjZwRmxpYlNMSlhPWkFZOVBYc0hNRndMaDFYWnJHRC9r?=
 =?utf-8?B?cWJYVGVEaVFpUWlNMDdVeFh3bzhOTmtaUkVQVlF3UW5WWlZjeU9hMDdCYWE5?=
 =?utf-8?B?aEJQY0dvKzdUUGc3UlRZbTIyWDhKYjZHYkd4d0hyTmEramNteTFzODVHbGE2?=
 =?utf-8?B?c2lCVm1hemloZUlVMk5GSEs5ZjEyTkpYVzFDUEt5eDZ0MEtNU21NenZqa1pV?=
 =?utf-8?B?ZDBqNXQxN2JOdURPV1d3QndjUlRnMmh6aHFCQlpTcHVBa3VFQjNqS0lhcHBa?=
 =?utf-8?B?SUtZekhta093MmxBN2JRcVhEcDJnZ2g4b3NpaktFWkEweGRpSk42R3UwcGh4?=
 =?utf-8?B?K3luOExZQWZocTEzekpsbzVOL2dMbEdjUExKUUladnRXQXN0R2hleTdnZWhw?=
 =?utf-8?B?TkJFTkVTek1zSG53T3ZCb3pPVEkyRHhtYnpybmFxVUFiRzdacHV1UzRxa0Ry?=
 =?utf-8?B?TTBiZWVFV2VIR1gxOFdkR2ppekxJZnVJMXp6L3hMNHI0ZUoyOFR6a04xamNn?=
 =?utf-8?B?Z0ZpVU11QVErQ0RPMThFZTBMTnNLTzBsWWFSbmxUcVdaQkp3RWF2NUhjNXU5?=
 =?utf-8?B?Z09BSHI1MnRiM05abkpsend6ZWY1WGZ2YnhqdDJwaWlqWGNiOEU5RnZrTGxv?=
 =?utf-8?B?N1BadFFuMm84RktHYmQ0azI5YWlmemQ0Uk4vZG5yQ2EvZU02VmN4ZURIQ0N6?=
 =?utf-8?B?K3BpQXU0TklncFNEMkprTFlJQXAva3B3bGtySEpvclhMYU9MaVVyTXcrY2hX?=
 =?utf-8?B?UzRIY1dRekc0UDAvWHZaZFBCSkI3cmZDNkZWRXVpRVJMZ3hhdkdRSzNvSElk?=
 =?utf-8?B?WUxQWWhqWmVTcXF0TjNRbDlxTTlJSUNVQmpBcnQxYWY0UW5Jdm8ydmo0MlhF?=
 =?utf-8?B?VHlhK1Ezei9tN2UvV0tiVHg4N3VSMU1ZSlNiMVY0Y0hUeXA4RXF5eXkxdVNh?=
 =?utf-8?Q?vbWymshkuFZDA5TI=3D?=
X-Exchange-RoutingPolicyChecked: EM4BGj2dE+X85DV08IgCPpXozVEi/fDOS+fk0142ugXmx8vEnFoTsbNuFZBAD77kncqMUURSYtFxYm4kO+wZrGYi8W4ppCmJZ3pvQ2oyvfIqDxutotq+oseNrurx8e6Sc5Q+oB9XAL0C5+u4D/F2OTdOWhlLKzqDSHNMaeT12S/y7tyVFHp9dCykCvYfA/MVibkjzm+BedRgz6qoM6dGWIdBqu5kvC9ChjwoAMmX8MwzelwaxGquHYftlpSxA9T2Ocg0XA7xQfuhtQIELlebbDNC8+hHcbqOYsqfEfowVsJgWScUI2SNbPpT+cCRnr8aLPuPjbLEBu4Xk6VFSHlbMg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8464bb5d-5191-491c-0063-08decee51767
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2026 16:00:47.3566 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2IujxYHT7tDEb4MiNcZJojTalPR/pyLpwRlgoAtN3oTW5+0ZDqD3Eom9oOa5g8bvmxz3Iqqa1w1BpUrpvb/CdLIXJmYD+UxoBA8Rizl2raE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB5989
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



On 6/19/2026 10:29 PM, Piórkowski, Piotr wrote:
> From: Piotr Piórkowski <piotr.piorkowski@intel.com>
> 
> Add a helper to return the total number of GuC context IDs
> managed by the ID manager and use it instead of the fixed
> GUC_ID_MAX constant.
> Update code to use the actual number of available contexts
> from the ID manager instead of relying on a hardcoded limit.
> 
> v2: fix kunit tests

nit: we can keep change log under --- line

> 
> Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  .../gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c    |  3 +++
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c            | 11 ++++++-----
>  drivers/gpu/drm/xe/xe_guc_id_mgr.c                    | 11 +++++++++++
>  drivers/gpu/drm/xe/xe_guc_id_mgr.h                    |  2 ++
>  drivers/gpu/drm/xe/xe_guc_submit.c                    |  2 +-
>  5 files changed, 23 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c b/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
> index e6eaa94d4d30..debe4b7bdb03 100644
> --- a/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
> +++ b/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
> @@ -7,6 +7,7 @@
>  #include <kunit/test.h>
>  #include <kunit/test-bug.h>
>  
> +#include "xe_guc_id_mgr.h"
>  #include "xe_kunit_helpers.h"
>  #include "xe_pci_test.h"
>  
> @@ -101,6 +102,8 @@ static int pf_gt_config_test_init(struct kunit *test)
>  
>  	pf_set_admin_mode(xe, false);
>  	KUNIT_ASSERT_EQ(test, xe_sriov_init(xe), 0);
> +	KUNIT_ASSERT_EQ(test,
> +			xe_guc_id_mgr_init(&gt->uc.guc.submission_state.idm, ~0), 0);
>  
>  	/* more sanity checks */
>  	KUNIT_EXPECT_EQ(test, GUC_ID_MAX + 1, SZ_64K);
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index 2c9b85b84b1b..aa77bd4cbca3 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -872,7 +872,7 @@ static int pf_set_spare_ctxs(struct xe_gt *gt, u32 spare)
>  	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
>  	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
>  
> -	if (spare > GUC_ID_MAX)
> +	if (spare > xe_guc_id_mgr_total(&gt->uc.guc.submission_state.idm))

maybe also introduce helper

	uint pf_get_max_guc_ids(gt)
	{
		return xe_guc_id_mgr_max_shareable(&gt->uc.guc.submission_state.idm);
	}

to keep this long idm reference in one place

>  		return -EINVAL;
>  
>  	if (spare && spare < pf_get_min_spare_ctxs(gt))
> @@ -916,7 +916,7 @@ static int pf_provision_vf_ctxs(struct xe_gt *gt, unsigned int vfid, u32 num_ctx
>  
>  	xe_gt_assert(gt, vfid);
>  
> -	if (num_ctxs > GUC_ID_MAX)
> +	if (num_ctxs > xe_guc_id_mgr_total(&gt->uc.guc.submission_state.idm))
>  		return -EINVAL;
>  
>  	if (config->num_ctxs) {
> @@ -1136,18 +1136,19 @@ int xe_gt_sriov_pf_config_bulk_set_ctxs(struct xe_gt *gt, unsigned int vfid,
>  static u32 pf_profile_fair_ctxs(struct xe_gt *gt, unsigned int num_vfs)
>  {
>  	bool admin_only_pf = xe_sriov_pf_admin_only(gt_to_xe(gt));
> +	struct xe_guc_id_mgr *idm = &gt->uc.guc.submission_state.idm;

if possible keep vars sorted in rev-xmas-tree order

and cache the value to avoid double function call

>  
>  	if (admin_only_pf && num_vfs == 1)
> -		return ALIGN_DOWN(GUC_ID_MAX, SZ_1K);
> +		return ALIGN_DOWN(xe_guc_id_mgr_total(idm), SZ_1K);
>  
> -	return rounddown_pow_of_two(GUC_ID_MAX / num_vfs);
> +	return rounddown_pow_of_two(xe_guc_id_mgr_total(idm) / num_vfs);
>  }
>  
>  static u32 pf_estimate_fair_ctxs(struct xe_gt *gt, unsigned int num_vfs)
>  {
>  	struct xe_guc_id_mgr *idm = &gt->uc.guc.submission_state.idm;
>  	u32 spare = pf_get_spare_ctxs(gt);
> -	u32 fair = (idm->total - spare) / num_vfs;
> +	u32 fair = (xe_guc_id_mgr_total(idm) - spare) / num_vfs;
>  	int ret;
>  
>  	for (; fair; --fair) {
> diff --git a/drivers/gpu/drm/xe/xe_guc_id_mgr.c b/drivers/gpu/drm/xe/xe_guc_id_mgr.c
> index e845425d670b..0738fc277bd2 100644
> --- a/drivers/gpu/drm/xe/xe_guc_id_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_guc_id_mgr.c
> @@ -102,6 +102,17 @@ int xe_guc_id_mgr_init(struct xe_guc_id_mgr *idm, unsigned int limit)
>  	return 0;
>  }
>  
> +/**
> + * xe_guc_id_mgr_total() - Get total number of managed GuC context IDs.
> + * @idm: the &xe_guc_id_mgr to query
> + *
> + * Return: total number of GuC context IDs managed by @idm.
> + */
> +unsigned int xe_guc_id_mgr_total(struct xe_guc_id_mgr *idm)

maybe we should have two functions:

	xe_guc_id_mgr_max_usable(idm)		// for submission
and
	xe_guc_id_mgr_max_shareable(idm)	// for provisioning

then we can update them based on the new init functions, different
per each SRIOV mode:

	static int idm_init(idm, usable, shareable, lock)
	{
	// assert(usable <= GUC_ID_MAX)
	// assert(shareable <= GUC_ID_MAX)
	// assert(shareable ^ !PF)
	// assert(usable == GUC_ID_MAX || (usable + shareable <= GUC_ID_MAX))
	// assert(lock || !shareable)
	// managed = min(GUC_ID_MAX, usable + shareable) 
	// usable_lock = guc.lock
	// shareable_start = GUC_ID_MAX - shareable
	}

native:
	int xe_guc_id_mgr_init(idm)
	// usable = GUC_ID_MAX
	// shareable = 0

regular-PF:
	int xe_guc_id_mgr_init_shared(idm)
	// usable = GUC_ID_MAX
	// shareable = GUC_ID_MAX
	// shareable_lock = guc.lock

new-admin-PF:
	int xe_guc_id_mgr_init_split(idm, limit, ext_lock)
	// usable = limit
	// shareable = GUC_ID_MAX - limit
	// shareable_lock = ext_lock

VF:
	int xe_guc_id_mgr_init_small(idm, count)
	// usable = count
	// shareable = 0


> +{
> +	return idm->total;
> +}
> +
>  static unsigned int find_last_zero_area(unsigned long *bitmap,
>  					unsigned int total,
>  					unsigned int count)
> diff --git a/drivers/gpu/drm/xe/xe_guc_id_mgr.h b/drivers/gpu/drm/xe/xe_guc_id_mgr.h
> index 368f8c80e4c7..25c6f026449a 100644
> --- a/drivers/gpu/drm/xe/xe_guc_id_mgr.h
> +++ b/drivers/gpu/drm/xe/xe_guc_id_mgr.h
> @@ -11,6 +11,8 @@ struct xe_guc_id_mgr;
>  
>  int xe_guc_id_mgr_init(struct xe_guc_id_mgr *idm, unsigned int count);
>  
> +unsigned int xe_guc_id_mgr_total(struct xe_guc_id_mgr *idm);
> +
>  int xe_guc_id_mgr_reserve_locked(struct xe_guc_id_mgr *idm, unsigned int count);
>  void xe_guc_id_mgr_release_locked(struct xe_guc_id_mgr *idm, unsigned int id, unsigned int count);
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 9458bf477fa6..537985f4d3b7 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -2753,7 +2753,7 @@ g2h_exec_queue_lookup(struct xe_guc *guc, u32 guc_id)
>  	struct xe_gt *gt = guc_to_gt(guc);
>  	struct xe_exec_queue *q;
>  
> -	if (unlikely(guc_id >= GUC_ID_MAX)) {
> +	if (unlikely(guc_id >= xe_guc_id_mgr_total(&gt->uc.guc.submission_state.idm))) {
>  		xe_gt_err(gt, "Invalid guc_id %u\n", guc_id);
>  		return NULL;
>  	}

