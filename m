Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0576C61DD3
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 04:46:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71DB810E53A;
	Fri,  4 Sep 2026 04:46:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cDa1+720";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2DB610E53A
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 04:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788497191; x=1820033191;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=atjXlzpq553YW8mknT30iSPxQ+uqe9IrqHNkB8UqnKs=;
 b=cDa1+720OrPWuXX8RDPUimPSKr6HWViUmXc9esfs7dpeODvRW5PaG0NO
 5nWOBkSYTWgorLJy2ocWGLcUxFR87D18XzUJcOsWTpGQ8RcPIwiCO6TEL
 fEOr7GuLUzyIiRB1l30htgn0zyS/zE6UNhWypCUgeEa1PdvZgRyYWxF2x
 wLvZhscP+T6bPPNETmDWF3CRA/nGSqyzB1fLP2i1muoJBBIJzGv+hSHHb
 PKp6sDDaLgKgnFilNT+H7fNe2yhHJtZq4d8XciP1gZ2K/ACtngKEqoVll
 aseNzeutZJD8nKU2JzfFALNvILq17bhaFSmcmyhQTcsRKW+F9xZq91CWw Q==;
X-CSE-ConnectionGUID: 96YrHd8eRnOw5ts31r+f6g==
X-CSE-MsgGUID: kud8g9YBQ8O0MqegGC6BGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="88840766"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="88840766"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 21:46:30 -0700
X-CSE-ConnectionGUID: hvAeeUUUSla8eeFld1g4Hg==
X-CSE-MsgGUID: E5mhPOMERieLLmAfQ0xwSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="270460562"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 21:46:30 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 21:46:29 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 3 Sep 2026 21:46:29 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.21) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 21:46:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S2UaRiO/c1FeGuYGd4x723cpp8+RDfJHG1vSI4BOYqPZMHYg05lt+guGtsEpuhFXauIj4W2LGql47qbE7+FEP0vOL7URiqLXD/zu2fMLtSqBeY0NcWh+i6WNr79zMECxnF3mrIbRQ93UUNL7H++fU3/nanVM3zhuOsSb++wIJU/kS+uVSNJ8dEKmF2JbWN6bwtT2/xPQAs0LY19hHiZz6EpqYo06drahzn2Y6s2yPSCXnFm8Xlu0Z1GMdHlyeyGZWiIjqCtzxXn0pdJiyvDu8Hbw0LedE2SWZ09MlT0nlLHyYisD3H5dS9KOV38WUD5S5maC0tkoiRumob1U9UziMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x9QNj6oMAiVrlm5uiGBOEK0+76yKyxRxfbnS+fHuRV0=;
 b=dCcRBpdYiLq8ICwScsF/Rwj1sAzXJ87ZmcOQeVFhbDTkx2PABbTX7m7/7h+Ra6t5xgPUfXJ7jOCQ/DXRiLOGMvdJccGKnO/ypOMpXN9Yz01frpjBdi64LEf33z/QIIBbM7Qsuecvi2aPN0VMi87IfWw5rQYBTlCiBisWD5eeThyOfAocCV/xePiddh3C8Jx+vMEO1STK6F8WeSiI7S6wEhvpPVxFFXQDVzhrjuI3ri/YLu6VpbwG3GNp9/AGb4S784CSXq5MbINBCZ8T3ubPGO00Fi2MHbzJBoGAgl4livcFBvqEllkxrycvj0DQcwCoRCURGY/LsWSHtE1HQgeWJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN0PR11MB5709.namprd11.prod.outlook.com (2603:10b6:408:148::6)
 by BL1PR11MB5318.namprd11.prod.outlook.com (2603:10b6:208:312::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 04:46:27 +0000
Received: from BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c]) by BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c%4]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 04:46:27 +0000
Message-ID: <fa355c49-99b4-4523-9c0d-9efb3393b884@intel.com>
Date: Fri, 4 Sep 2026 10:16:12 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/vm: Handle purged BOs in VM snapshots
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>, Sashiko <sashiko-bot@kernel.org>
References: <20260903090630.3857182-1-arvind.yadav@intel.com>
 <apnHf2QWL+FOYiD7@gsse-cloud1.jf.intel.com>
Content-Language: en-US
From: "Yadav, Arvind" <arvind.yadav@intel.com>
In-Reply-To: <apnHf2QWL+FOYiD7@gsse-cloud1.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0023.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::12) To BN0PR11MB5709.namprd11.prod.outlook.com
 (2603:10b6:408:148::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR11MB5709:EE_|BL1PR11MB5318:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b11795e-f363-4830-45db-08df0a3f7ae0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|6133799003|10067099003|56012099006|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 3ey9FyORRompbPHv2pjyCrB+I16AR7jg/yMqhfJ7nHzdudXtQsnlAFOszuBHKUqRu1gjFUGXzeXHO1j2rcUaZe54N9LHCJCLsL523+UIWE3SFmD169ar0/OphtyD6KnQwbZ2TACNNvsVYBlgoqRdwtsSmo/1pjo42Im2BEmBr6R17ODjWK3uqgUrS6cXG3SlXmiifiEv+YjTXMxK/cq/UJtUzFR2zLnD3z40IiUQsyT+8H/sNVnFsEFMP9UD56alFxuTbwZi0YWoVLrOrzNxHlDUf1kvZZZGhn3T/AEzexZZGyMjaBqaOOfFkPaZLMMrdPqLYH1menRmnEBrttk/D64x5yB61xef28zVUjsr1rZO8iFx1XnHtPYzLfwBxTadBZuYTvIVAk/AVFxFDk/WycD4lCDP2+LoxFgF4UlT347D0NIOSMm3qVW0BRBOiYiTvB1c5zNg4Q3E8RJVRKDq7+kQBN017hP74HqbkyaBi82T+nx2RBapt6dAdHfMkYBYtUXgvk0/lCv4CZyBGx80gHkatZn52jYJVYxQAMHSg3DNATupIl+pAzttb90Zw5p1FDo5EHQfbtFbKRpirRueXouPndxnaWaytFcDEAArQOE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5709.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(6133799003)(10067099003)(56012099006)(4143699003)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aEI2MU1PcjFaSzVSTTQ0S2pjU0dLSGlBQWxCVFo1UHZ6WExqS0VGYkxveHhK?=
 =?utf-8?B?Z2E2alVnMGJ4ODE1T2xZYVM1ZnVJSDd4bkhRcFNERU9KeGlqNjJBL2Fzam9u?=
 =?utf-8?B?ZHBYKyszVlFtQVJlUVZab25YRU1adTRuM3RsNThiNmEyUnZrbi9FN09pQ2lN?=
 =?utf-8?B?NVI0Zjd3ZExwZUJVVzB6UXJYakNvUzYrb0VhTUNCK2VGb0YyN2RlY2R2UG5w?=
 =?utf-8?B?QmkwZW5nU0Qrejk4MW9EUUFnNnkyZW5UQk9PVm5YMnVycUY1cWxLRURXaFFt?=
 =?utf-8?B?UFNtTTdmalMveWQ2YW9XblMyV3JaQTMzNnh0Y3hYSVRhQXV2NXJtbkx6RlBH?=
 =?utf-8?B?QXdycHJPRys4THMyVWpZekVwSklPdGFDWVFCdnUvV1k0ZzlSTEtHYWpFT2Jr?=
 =?utf-8?B?OFR5dklBQmhBOTFQdGJCdEJiRERYNkVQeFlFZk44WVljTnRFYXV0WGNHaDRJ?=
 =?utf-8?B?bk1Tbnp0MFR6bjJzYUJzbnY3WElyMEJLMEJ2U0RLa3FyN3g5Rnk0UjIzUjND?=
 =?utf-8?B?YkY1a1RzcXRzOFZ2QWVVeG5SUElRb3dsSTRCM2o3U3BrTEZjOFZuQm01KzAz?=
 =?utf-8?B?YU1hRmVSU25yYmpOUmZqOWN1SENwYXkyL0tybWkwUkkrVDJpQkVybVFtbXg0?=
 =?utf-8?B?WnNhV3IwbWtHeGh5UVJBMHJ6NGcwT3c3VkZIV3lST3RkeGhtaVpNQXNrMGlP?=
 =?utf-8?B?OEVMYy9XZU5JSDVTVGRxaHlJZ1U2a05oTit5YWkwQ1NmVkdnTnM0Ull1S0ZK?=
 =?utf-8?B?YW8yYXBFbHh3Mno5NVMxTTZXOWJsaHFQZTNVWUZGNHRza3JDVFFHVW1BcmM4?=
 =?utf-8?B?Y1c4T0lTZENqNG1QOXJjNFFwWFYzWnlodU51T2NmZHNwZHNhN3hpNDR2b3VF?=
 =?utf-8?B?b3VQMDFNNWVwK1hXLzArY0Jad09pMUFacmNuUzduaWd1dmVGK20zNXpDSnQ3?=
 =?utf-8?B?MytKemdWaGZEZTJmNkNTY1I0bnZiUjFCQWVhcnN2KytZYXpZbVZrTjgyQ0tN?=
 =?utf-8?B?MXR1a1plbWllSjRwb003VDBrRjVSbWY1YXRyVFVxeWp0bEVNQkIxMkwwNHIz?=
 =?utf-8?B?bXJxZXVlZHBSQ2drVzBscEFaNlkyYW8wOHM0Y0hnbzR6Y3NTVm0xSFdDalhi?=
 =?utf-8?B?dHdxY1Q0N29zNWtHMFQxTjFhdnRidFV2V3hnTjIxV2QrMmFCVkZJRHJnQkFU?=
 =?utf-8?B?QUc5SUhCVWp6bng1RmtRUjdtRFVjWTVOR1hKbVRBR2tWcXlLNG4yWGVsRElS?=
 =?utf-8?B?alJjMnpmTWs5aTBkYktDNS9JdkR0aHRRbTNqbkpyNlBUQ3gydnBPY0RtZG1I?=
 =?utf-8?B?U1lMbnBaYy9ieVp2ZlNzdXhWNDByT2FFNWppVzFPczQxcGtJY0ppNVhSTEZF?=
 =?utf-8?B?UGt1WVMyK0gxRURuVzFjcHEwT3dycEp0a0lEV215R2hyd3ZrSnpCK1c2cXdO?=
 =?utf-8?B?azdCcXFOUzljUnFTRHROcXV2ckdqOSszSE5XMWFjSHBUWkVUMTZMVmVxRDJ6?=
 =?utf-8?B?WVlrb3pkWDRSand2OXZLRGlESnBBZVZqVzNreGxwcUxCT1lSM0ZYS2t2dGxH?=
 =?utf-8?B?akc4OEhPM0hkZC9GZXc5RlRSVVBuTWVwUDYxcW80LzVUbXFRekVaYWx4alNr?=
 =?utf-8?B?MUZQSWtXWXZiOTc4bTFEU0NCQmcxSDNUOXJSbWwwSUFJYXprTEVUekg3U21B?=
 =?utf-8?B?Q2ZNUjFjMFdzdjZLT09ma05heWk3QWREVDR1WWUrSUFSTUVzOXpOM0dnQXc5?=
 =?utf-8?B?aDB4K3lKZ2N2QjYwSU92eU1vWFR5Q2J5OVl1RWNKdHhscCtEZG9zUXA4S3hw?=
 =?utf-8?B?MjZCWXhhS05jbjVncEVhS1ZGdElqN25Reks1RWlWVU5hWm1zd0xCcklzWkhS?=
 =?utf-8?B?a1ZLUXlURkhkcG4vVWJRQWVTdlJkT1V6RHpnWDVWTFRYbzgvRnczK1JRZWc5?=
 =?utf-8?B?SEdvMGRNR05EeVFyNE9YcDU2eDRING5rQjUxQ1ViSk8zZmdHbHR1YWJyZHlG?=
 =?utf-8?B?TFlibTA3Qy8rVC84WjVTcGIzNllwU29hV3pXZ0RlT2ZGV0htK2s1SkhUN05R?=
 =?utf-8?B?eHYzUnEyUkF1RTBCQUgvcnNGTWZZK2EvTFowZjZXMXFUVmRxNlFrSVdmeTVq?=
 =?utf-8?B?L1JhN1NPR1ZGYm9GYVZXR1hJSjFkL0hDSmJ6OXJvcHQyeC9DejhmRGJNM0NZ?=
 =?utf-8?B?ckEyeHZQZFU5UWVXeTNaMVNCbDBPbXZ5SUpwZGdaeUFJNGFHS0VBYjlhRVhM?=
 =?utf-8?B?RlRsakJFMU9ibkNMc2o5YmJQaDJjZHRubFk1cng0RklOcWV5T2lsbTdzMTFl?=
 =?utf-8?B?N04yWDcwUWFZcndxY0xVNUlneWRkVGNMV0UzTEFEUEVxMjdEWUt3dz09?=
X-Exchange-RoutingPolicyChecked: HX/3IP3HsVQHW19rOzckez2pspHIbC5EnSCTxB2z1enIFpdThTjxnOOuylAQElHax/nTZkMRchWdogvu21bWDJ3lvGBjRjM0FxTF43rOug/YWM9oHAN1MERoM0fYS/gjYiV1byZmNRcjarF9sP1fBtpt1R83o9J/DmNKH+AGphcOrpchmg/IjQ/BCoTuIkNWHKL0lh5Ku13JK3CRmUqY8Zv20hvyelpouEGgG24AbMZ0nKdpTnIfMs917jKQY0elo7nX4joYPMqxPssIz99KevELcjBU2AfHq4od2kNCBs29ZplTQKnMDyOJdg+iakPOnqvkW3HHOtf5agE8HPNG9g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b11795e-f363-4830-45db-08df0a3f7ae0
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5709.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 04:46:27.1835 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vKQru4TMaYH1ARkZrGUeJQKNi1XTDoHEbAOSECiUL4iKl/P7uloT/iTzSPhGX8FntsDPYnNOGeng5Za1Qr/MdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5318
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


On 04-09-2026 00:46, Matthew Brost wrote:
> On Thu, Sep 03, 2026 at 02:36:30PM +0530, Arvind Yadav wrote:
>> A purged BO can remain in a VM after its TTM resource has been freed.
>> xe_vm_snapshot_capture() can then dereference a NULL resource while
>> capturing a devcoredump.
>>
>> Record -ENODATA for the affected VMA instead of dereferencing
>> the resource.
>>
>> Fixes: ad9843aac91a ("drm/xe/madvise: Implement purgeable buffer object support")
>> Reported-by: Sashiko <sashiko-bot@kernel.org>
>> Closes: https://sashiko.dev/#/patchset/20260831064942.315720-17-tejas.upadhyay%40intel.com?part=4
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_vm.c | 28 +++++++++++++++++-----------
>>   1 file changed, 17 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index 19b3d0be7928..77a851d9e373 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -4666,17 +4666,23 @@ struct xe_vm_snapshot *xe_vm_snapshot_capture(struct xe_vm *vm)
>>   			snap->snap[i].cpu_caching = bo->cpu_caching;
>>   			snap->snap[i].bo = xe_bo_get(bo);
>>   			snap->snap[i].bo_ofs = xe_vma_bo_offset(vma);
>> -			switch (bo->ttm.resource->mem_type) {
>> -			case XE_PL_SYSTEM:
>> -			case XE_PL_TT:
>> -				snap->snap[i].uapi_mem_region = 0;
>> -				break;
>> -			case XE_PL_VRAM0:
>> -				snap->snap[i].uapi_mem_region = 1;
>> -				break;
>> -			case XE_PL_VRAM1:
>> -				snap->snap[i].uapi_mem_region = 2;
>> -				break;
>> +			snap->snap[i].uapi_mem_region = -1;
>> +
>> +			if (!bo->ttm.resource) {
> I think technically this can change at any moment, so this is a TOCTOU
> issue with the switch below.
>
> The value is only stable while holding the dma-resv lock, which we can't
> take here because we're in the signaling path.
>
> To at least avoid a NULL pointer dereference, could we do something
> like:
>
> res = READ_ONCE(bo->ttm.resource);
>   
> if (!res)
> 	error;
> else
> 	switch (res->mem_type)


Thanks for review.
Agreed, I will use READ_ONCE to avoid a NULL pointer dereference.

>
> KASAN could still complain if res is freed after the read, but the
> kernel wouldn't explode, which is objectively better than both the
> current situation and this patch.
>
> Maybe someone has a better solution that fully closes this race? I'm
> actually spotting a few other issues in xe_vm_snapshot_capture_delayed()
> where eviction can race as well and those should be cleaned up too.
>
> Perhaps we should open a broader Jira covering all devcoredump paths
> that access BOs which may be moving, and clean up all of these issues in
> a separate series.


I will open a separate JIRA for remaining races in devcoredump.


Thanks,
Arvind

>
> Matt
>
>> +				snap->snap[i].data = ERR_PTR(-ENODATA);
>> +			} else {
>> +				switch (bo->ttm.resource->mem_type) {
>> +				case XE_PL_SYSTEM:
>> +				case XE_PL_TT:
>> +					snap->snap[i].uapi_mem_region = 0;
>> +					break;
>> +				case XE_PL_VRAM0:
>> +					snap->snap[i].uapi_mem_region = 1;
>> +					break;
>> +				case XE_PL_VRAM1:
>> +					snap->snap[i].uapi_mem_region = 2;
>> +					break;
>> +				}
>>   			}
>>   		} else if (xe_vma_is_userptr(vma)) {
>>   			struct mm_struct *mm =
>> -- 
>> 2.43.0
>>
