Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDD99C43458
	for <intel-xe@archiver.kernel.org>; Tue,  7 Jul 2026 12:53:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFE1A10ECC7;
	Tue,  7 Jul 2026 12:53:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="THgi856o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BCC410E4B0
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Jul 2026 12:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783428804; x=1814964804;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=HuxP/qgp2Ea960f9rBcA4Fjd4Uon8plkAUMQqFVdK9o=;
 b=THgi856oxVUczhKb9ok7sl6q5WjOP+5POCdUOZ0g2siBCFwah3bUO4jc
 UaFA2i0adSVHrNhHwBJ3321SDM3ZWhZql1jmOInmOtnJ+BVL+N6FGXODS
 L3YmC3siQl/+EE9baHluSvTSBvWK3+akXT/1rPNd9Gf5mbj+18N7QSnzc
 97PHFr/xptlMRCXDmChQRJJiib0+XxZlGkztEABt2AFPA5JLLriT5Ct1L
 sK+HVY3NXXr4wUi34Hf/vwME6gxe24dm0Ob04/F83mC3soRaSg8N3xGu0
 V6F5b+gC7HFT+mGbrE9AZ/Nbv7bRRxK7a+niT/9rGvY13OqVdBDxLx6yt A==;
X-CSE-ConnectionGUID: vRptz+BsQGWNlRLkzok+jQ==
X-CSE-MsgGUID: UfK+yWE0Scad1oqu77nnJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11839"; a="84164986"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="84164986"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2026 05:53:23 -0700
X-CSE-ConnectionGUID: 42T7hzK2Q2WY82j+CcoKSA==
X-CSE-MsgGUID: YHZDOTqrTSCe4US2/kl4iQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="255917779"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2026 05:53:22 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 7 Jul 2026 05:53:22 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 7 Jul 2026 05:53:22 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.53) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 7 Jul 2026 05:53:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uwGOKZBSHqLWXTfVm0w0lW5RXnPn/AsLZSEzNemu14z5Hvs4xj5JWawWp45ThXRHmEPNz5L32mpJfUFO3AtJZ1/hR1Ku1bGn5fNLPMgAP+oMe1GZa4tEA059nqvajkSmtT5H/2R/BP14UJPOztXoRj/SrmQoTAm4FohTx9kPAna6svX4gi7YHU9mcJS7hL2JqaNou1AB+7lBXp4EEVeWE4KEPXhnY9xecj8JCOlRI2nSog97TkJrkUnvzbSUkmjkD3LpdZmay8h/unemo/DRjqE3yxUvzFmGH5nAGog/rERCyAUT3kqTPE9aDwIukhwALwoMiyabBB6qYAavEESiJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s4I83V/wHYQh4WUatIEaKwjlvRohIn4YiF2AK3R08OI=;
 b=irWOxiA/b2AFyrHISY4ADp+m3/j7px7qO+lT4G84gCxkzixUlCfCCwHj8Yk7DWa6akXSo/vUXcQdNeIgKHpuomrOLIfoP0I+n47XJ2sfucX+7UWtGgYUod/577vPBxODYMKMSAdJnytWpkJ4WFqJbQtAzz9KfPzk8/zTOYZaWFqd7ycAmthpiVYF8zDHCwjfe77hXrXTOKNBC9K4fxHh9eQjLwmdudfI3rshS5Z/Bx+5kjxEtSdxfoNGtwOCWnhl32T5dw3z5/iTyNiGM6+62GFbdt6DGWBcJhw4t7nyebhqkuQIbfh7wWw6iaLF/1TmGRUiU9dppQrwVBkLkiuBKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by IA3PR11MB9423.namprd11.prod.outlook.com (2603:10b6:208:582::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Tue, 7 Jul
 2026 12:53:19 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.21.0181.008; Tue, 7 Jul 2026
 12:53:19 +0000
Message-ID: <8f12c08f-d874-40e0-b831-482fa89dcdf8@intel.com>
Date: Tue, 7 Jul 2026 18:23:10 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 3/7] drm/xe/xe_ras: Refactor get_counter() to return
 response structure
To: Badal Nilawar <badal.nilawar@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <daniele.ceraolospurio@intel.com>, <raag.jadav@intel.com>,
 <riana.tauro@intel.com>, <aravind.iddamsetty@intel.com>
References: <20260702111401.3680214-9-badal.nilawar@intel.com>
 <20260702111401.3680214-12-badal.nilawar@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20260702111401.3680214-12-badal.nilawar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0142.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b9::17) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|IA3PR11MB9423:EE_
X-MS-Office365-Filtering-Correlation-Id: e282b7e5-e336-4407-44af-08dedc26b842
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|18002099003|56012099006|5023799004|4143699003|11063799006|22082099003;
X-Microsoft-Antispam-Message-Info: SEPBWirtvo2GeM53caDMPHBBWFeKbN64460uxFoqIiCgIm0CT+LPDVMzv08FV1Qb4kmdeLDzT9o28QdwxNgnZqucSjgKWIPvNUEKQR+4qvuW9hT6qEeItKu91rSDwqB8jqT9+uxD5BAv3IjPAxcH7DaVanjEnd2r75UB85xtRdUWFC9EfUuxCdlia6Xx+4du+Zrq7C6xopmwFMVRjQd8PAIYgJGVAGXQrIOPuVRsR/KFNtRzInpaVTNi4Odg7kfFAJ7EfjyuHQ/sIPqT+QKiVTHZPSYmjy5SyCBWEovXe54Hmrp3pvxk/XxYDvDWfN9mINgWkjkfKTlZD2/c3ea7BbxnoZZ8DNXmvMLasV3mvyikgEBTZEHWkUl0i6Iuz4G7ZvTHInbMaKiLkjcqE0+zslWSkcVVMZ8VO8ked3a9Ewrjzypth0MeEzYYOJFNN77hfD54YZp0w+I83wnXprNMxfBqOfA6nGGaTn/YvYW20QpOlIY6ffS1mubSBE/aR2xEX7tR/81wf1qb0qhgDVb2nYziKzYK6AUiD5kGZ+riNDxim+7DVO4g0oH9jEfL2YV9Y6MrapG0g8Zj4pC2tnbnM8MQezIize0qdDQB7n6HtF487cUCCQtNrS21pjDH0pwUrLSozSAg8oovgspGxo3nTwurAketNrf4w4JNeB56mLQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(18002099003)(56012099006)(5023799004)(4143699003)(11063799006)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OW93ZFI1VVAyc2JUV0dZNGluTVVPcnJ5R0xvTmx6QUdwUFJndVJiVUhkTEtH?=
 =?utf-8?B?VXdRUGFwUHJIVE5vNjNobkt5cCtkL1pWbFRXVVFTeHV4aVlDQWsvbTdJTEgr?=
 =?utf-8?B?aVNuN0lwZE9jZWtnQUZ6V2NXMTdCWlFaOS9hU1c2NkFPRktoK3NEYk14RER1?=
 =?utf-8?B?VGY3MFJaWkt4UTYrV2VEK2dIOU9waW1LT1JER2FnaVY4NFNmMmxIWm9VZmtB?=
 =?utf-8?B?RkZjOVgvbEFsd1MwRG1sYzlUZ2h2WEVmNjNhMFllUDdmYWtCNWZ4MmpDWVFI?=
 =?utf-8?B?RkdXaFl6MVc1ZEFJVXpZcTlHT1BuWjEzTjdCaHFFcmlVdzNoVVozdHVyTmEx?=
 =?utf-8?B?WnZnQWdCQ1o5RzNMd1ZNYmx0aWJKanplUlJudmxGejlkYVpWa29NQ3lwOHpR?=
 =?utf-8?B?NWRTOHE1dWVmY1JyZVh3aWZMWnZrZERETGpEYnREL1BhU1QxZWhoZzZTbWh5?=
 =?utf-8?B?Qys3YzNkUGdlMkttRW5ETE9oUWF2a0t5L3M2dVJVMXJyNTZRWndYVWxsSHhl?=
 =?utf-8?B?cDVNOWxEdTJFRWlOUUkva2Y2eEt1UHVGdWplRzd2ZW0xbjJFUm9BZUxmK1Ey?=
 =?utf-8?B?NzdyWUhqYk5JMnQ0Qlh2Z2F2NjlaaTFyNGlvT0lmc2thRVZFdVlxbzlLWllz?=
 =?utf-8?B?WEpXYnE1Z2NlMTFKSW1ab1FhMVkzOEtOamUra3FHSkFJMUVoL1BzQXV0ejFq?=
 =?utf-8?B?UHZtVDU5RS9UWitTUXZOblVXbWllamE1Q0xvc2VIZXQ4SWJuZXNCVmJMa2xL?=
 =?utf-8?B?VEtIQytIR0tLdnBuZmxXcENScnMxVXFGVmpLVXBUeVNSWDQyUmVhYmQwWXZL?=
 =?utf-8?B?a01zd3FtU1ViOThseEN6aEQ5N2VEU0xHRDM5cVBSRW9rVTNWeXBmMVBUemNU?=
 =?utf-8?B?YlBRK01NdUJOaiszSitWbTNhTk5MOGtBZ0ZGYm1HOTZEN1NSbjlxVi9jOVB4?=
 =?utf-8?B?aWZyWGRrQUNQbWl3Tm1xNWJKNDVUMlczTlQrNU5UZnduekZxdGpJU0g0ZkRt?=
 =?utf-8?B?c2hXSFp6aHVZSjVnMWNtdVhsWkRITmNuUEREd0FjN3QvTk51aU05Yk5nQnZ4?=
 =?utf-8?B?UGRRWlhHWkN0MnBmTU5HanNMQVdURnZseWEzRHJDOVZBaUNnUFdIRkVuT2ZY?=
 =?utf-8?B?YkxCdzRLNCtnbGRmeldRMjBiWjRDQ2NTQkZIT2lDb0NodUErRldSSkVtV0wv?=
 =?utf-8?B?TGEvQmVvbi9vUWVhNDVYWjA3YU5nNERkUW1ESERkVWNvODFvK0wyVVRvSExC?=
 =?utf-8?B?MW4wNnYwK2tKVWhOOC9hQ1pnYXZ4MlFGQmtReW5GamNPMFhIa3c5Z3FTai9z?=
 =?utf-8?B?VUxhZTBJelUza3JMVEttQTRtU2poVCtCS0tFbFhJNVFOamJYd2EyeE1UZDBJ?=
 =?utf-8?B?dFEyeGFYS1ZMdW40U0VRUWtsQkNBa1ZId05VMEN5emN1N211WHpBb2xNMHFk?=
 =?utf-8?B?NGhkK2xZbjIyMFI3ZFpCeW5IZFBHVmN2ZGJrZnNGSWVvWjlhNVVuNG5nUmI3?=
 =?utf-8?B?ZkQvci9QemUyWks5aVQrZTQ2anR2anRTK0tkM2d2TmNjZjVmMFdDOG1MTWY1?=
 =?utf-8?B?NGo4V2xscVpJdml5SlFNZWVVazhZMUUrc2FxSVFLY2lhUEQybWlQbWk5WXRs?=
 =?utf-8?B?eG9Ma2pjOWQ2c3JHSmU1YTVQSmovS0ZPRVBUVFMrZnk1aEhmZFpFaHc5M2tu?=
 =?utf-8?B?dUtVTXZsR3hBbzdlVVBzdU9zR3ZwL2h6TEZ4SXM2NURBTW1yK0VxMy9MNTFM?=
 =?utf-8?B?b0ZMNkJMUVpEUU1YVERKUVZnNGsvbG50SVRISkoxUFhTK3U2RVpDMW5CbjNP?=
 =?utf-8?B?WGtYdFl4dVZSb0ZNL1JpbXV1VWNYRzJtR0l5T2xna2FnRy9IS2VwbW5jc2tX?=
 =?utf-8?B?UGt2aGt0TU5mUXJHaTd5VSs5S1k0Z0N3TDdmNk53VXpXTHJXT0NMeUVVeWNE?=
 =?utf-8?B?ZFFJUVR6VTdhYTdlcmVwaDQzbVMySUZRT0pRcnB2UnAzdlBIcFpxOHpiNEov?=
 =?utf-8?B?VW9Id2xCQ0dxQ0lMckpxNlI3MzRPZzVSQmVCS2xqU2ozRFg1Yy9GditwcG04?=
 =?utf-8?B?ZFpJZkxucStFMzNPUGUrVThtUmoyc2VvaXc1OXJ0VkxSZnU5VGRDK2hFcFQ4?=
 =?utf-8?B?S1hLVWVMbVlSelFMSXJOelBqUDZaZjVrdWd3QTlKbXIrYzZkTlA1ZEw0MllL?=
 =?utf-8?B?bUVTVUd6UDNsSXFzaDcwMjJ2Lzc3dXM5UTJyQzZBekU1aUttSlY0Y0lBTHBa?=
 =?utf-8?B?bUJFK3FaUlMyZllDU1J2OXJGdkRRQlU1RnFHNGV2SXBTVjRkS1JteFFxNlAz?=
 =?utf-8?B?dXRnbXNNbHFMU0J3TmZjRXAwd0Vsbm52QzF5V0RjQUN2NGF1VVFDWS9XZ1Fu?=
 =?utf-8?Q?wNxnrU5pBumBmdZk=3D?=
X-Exchange-RoutingPolicyChecked: BGvfCr3KqVevsZ3t26qsav76lJZud4kawDIGDr1yj5juox/BQoDjCJfsM5gfLa4Nh0bJMikaGaGwW0HYAIbpPuBsNoDobOhgqb1/L2NbOkVC41cZ0ntIUzhvGiiuTs2mfZePRbYwda4WbuF+ownT6M/Yzw/xQQs/HrB6Qoa4498JRtP+v1b1m1+ELrD1srFf3IilZSHUwex9ksJc9hImA2FH78QvztcGM28zYHYg3u1d4z9H6N+4sqUa9syVK2Zuj830B3ZhgZNsOWkeDMu9EzhtbIZZQczHSgUxqruJM5L3w8VblwrW8v08zY9lJmB3NLr02soAk89aD+4cdTZ2nQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: e282b7e5-e336-4407-44af-08dedc26b842
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 12:53:19.3111 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qeuMlMosnU8Uv178mloz60fK71HK802FkhvRjHlAqwj1mJTFDL2OJXhOPfxyqSNfW5g6ZsC4z/QxGTd72rjs8/xdXEDlDrn01p/S4LOwhjI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9423
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


On 02-07-2026 04:44 pm, Badal Nilawar wrote:
> Return the complete response structure from get_counter() instead of
> only the counter value. This allows callers to access additional
> response fields, such as has_info_queue for CPER record building.
>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> Assisted-by: Copilot:claude-sonnet-4.6
> ---
>   drivers/gpu/drm/xe/xe_ras.c       | 23 +++++++++++++++--------
>   drivers/gpu/drm/xe/xe_ras_types.h | 10 ++++++++--
>   2 files changed, 23 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 85b0202467f6..e594d4d3a23f 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -157,12 +157,12 @@ void xe_ras_counter_threshold_crossed(struct xe_device *xe,
>   	}
>   }
>   
> -static int get_counter(struct xe_device *xe, struct xe_ras_error_class *counter, u32 *value)
> +static int get_counter(struct xe_device *xe, const struct xe_ras_error_class *counter,
> +		       struct xe_ras_get_counter_response *out)
>   {
>   	struct xe_ras_get_counter_response response = {0};
response is not required, we can directly use "out".
>   	struct xe_ras_get_counter_request request = {0};
>   	struct xe_sysctrl_mailbox_command command = {0};
> -	struct xe_ras_error_common *common;
>   	size_t rlen;
>   	int ret;
>   
> @@ -183,12 +183,11 @@ static int get_counter(struct xe_device *xe, struct xe_ras_error_class *counter,
>   		return -EIO;
>   	}
>   
> -	common = &response.counter.common;
> -	*value = response.value;
> -
> -	xe_dbg(xe, "[RAS]: get counter %u for %s %s\n", *value, comp_to_str(common->component),
> -	       sev_to_str(common->severity));
> +	xe_dbg(xe, "[RAS]: get counter value %u for %s %s\n", response.value,
> +	       comp_to_str(response.counter.common.component),
> +	       sev_to_str(response.counter.common.severity));
>   
> +	*out = response;
>   	return 0;
>   }
>   
> @@ -207,12 +206,20 @@ static int get_counter(struct xe_device *xe, struct xe_ras_error_class *counter,
>   int xe_ras_get_counter(struct xe_device *xe, u8 severity, u8 component, u32 *value)
>   {
>   	struct xe_ras_error_class counter = {0};
> +	struct xe_ras_get_counter_response response;
Safe to initialized response = {0}.
> +	int ret;
>   
>   	counter.common.severity = drm_to_xe_ras_severity(severity);
>   	counter.common.component = drm_to_xe_ras_component(component);
>   
>   	guard(xe_pm_runtime)(xe);
> -	return get_counter(xe, &counter, value);
> +
> +	ret = get_counter(xe, &counter, &response);
> +	if (ret)
> +		return ret;
> +
> +	*value = response.counter_value;

counter_value is not member of response. should get compilation error.

Thanks,
-/Mallesh

> +	return 0;
>   }
>   
>   /**
> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
> index fc496888b3f8..befdaf297103 100644
> --- a/drivers/gpu/drm/xe/xe_ras_types.h
> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
> @@ -155,8 +155,14 @@ struct xe_ras_get_counter_response {
>   	u64 timestamp;
>   	/** @threshold: Threshold value for the counter */
>   	u32 threshold;
> -	/** @reserved: Reserved  */
> -	u32 reserved[57];
> +	/** @reserved: Reserved for future use */
> +	u32 reserved:9;
> +	/** @has_info_queue: Set if info queue is available */
> +	u32 has_info_queue:1;
> +	/** @reserved1: Reserved for future use */
> +	u32 reserved1:22;
> +	/** @info_queue: Initial info queue data (first chunk) if available */
> +	struct xe_ras_info_queue_response info_queue;
>   } __packed;
>   
>   /**
