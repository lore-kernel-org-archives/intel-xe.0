Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B24B10FCAD2
	for <intel-xe@archiver.kernel.org>; Wed,  1 Apr 2026 20:58:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA68810ED72;
	Wed,  1 Apr 2026 20:57:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FVs6vO3B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9B5C10ED72
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Apr 2026 20:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775077079; x=1806613079;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=2VpaXp0I7iNpiGhWjbx/pFIlThLTEtENPxKIlt+OT+4=;
 b=FVs6vO3BDoDtCve/YsF9W2y3YaPb9PczBHd4Q6xBMQSVZ3pOWJ3ZDAJI
 y5ooShzRHS55O5VlqBuDYK3ib/Qt34gPTx55PMivTAjsY+pspj2iHVh5Z
 c3xr68KkLuyFzoiI+iNeVYbAPtXQaiIQT3+dMgPNcF27x0w2nxM4HlTk/
 7A8ZsCqZ1sE5fcGTAVPYKK9hoGIRHHenZQTdbkVatyQseqUrJrlsE2n58
 uUCzlxXgXgh009X//jfumtjHMi/rzErD2MTvi11+j0PmL2MOesGtRuBfC
 BVE7pYNWD8gX3Nog29UTfDnNxVjwkmSGyyZvSgIZhpYL6bG1YkCMyM9EV A==;
X-CSE-ConnectionGUID: P1ICUuOcR4297nOesirgAA==
X-CSE-MsgGUID: NLP5nnw9To2ka8+ZFkvyWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="76015422"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="76015422"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 13:57:58 -0700
X-CSE-ConnectionGUID: Sb9lWCpFTcOY7Sd+GYaHFg==
X-CSE-MsgGUID: wD/v8C2jTYWS8GR+FCfNCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="231198809"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 13:57:58 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 1 Apr 2026 13:57:57 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 1 Apr 2026 13:57:57 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.12) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 1 Apr 2026 13:57:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jgvh6b9LCwc2Z0Ty3i8uKGzvGcRWalK/piateUP7Ca2yXQuA2IdM3kTRcJmrzai9bjXSDP9cxLLM4roQjor7okxR8PS0XsFC5hnpQV1DzrDC3/OF9cuUGfEFEkoiCpAQNkcIeXgXhj0QxXrpQQnaC2+uPG3M2HIqW0Uf9RhymSTgEkVmF49DojzzoRTVLtj6CSEt6CHIJTGHkGJiWuKxiQrzzhCBjCg8f+Jq2RetK6EcAjnKEllgs/qrNbMxu852hfuQgmkk8R7G2Oqci2QIf6UJ8k0nZB7Nt2b/MmMy7FBkjn4pF+gH2SM32a9DhQ6pC9TQ3IfFyDcCnFX4fwpSLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ekEBfD0MhPNk18JF3JWR/46imj2qKJSnY+KP9udPAR8=;
 b=PKg+CXd6zjJVtGYdaHye5oW0xr/eJU0Vvs+93v0cVJdBvROuKbbynXyJiSF7za23ODhEka/gB8jrjhVRT5UzUTKzSaRaoasmdd8FXVyOp4TgrN6rx9xrRC0Iar//6hOANp97k8mNNk+s0Y7C6j3kOT/wxZIjEXV7sBlD/PCT+vIrICXShzqsv6vVZxgZ2jyx3s9Ciw3Mom437uat1EcA4lH1urVY7iD4w5l3OBQwuDOFo2ch1rpH7DDEUt2rgPpnBPFsPQDVXKDQNIgf9/eLJ5897eV9QKi4vj1tRENgl7jAyJHHUNAV4HNKeOnq9h+Q79AVsH0lDhw586w5NXRhVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by SJ0PR11MB5024.namprd11.prod.outlook.com (2603:10b6:a03:2dd::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 1 Apr
 2026 20:57:56 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::f3ff:11d0:7a52:db0c]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::f3ff:11d0:7a52:db0c%3]) with mapi id 15.20.9769.016; Wed, 1 Apr 2026
 20:57:55 +0000
Message-ID: <79b30bcc-b056-454b-a5ac-8035f7ce76c3@intel.com>
Date: Wed, 1 Apr 2026 13:57:53 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] drm/xe: Fix null pointer dereference in
 devcoredump cleanup
To: Zhanjun Dong <zhanjun.dong@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20260326181017.2060209-1-zhanjun.dong@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <20260326181017.2060209-1-zhanjun.dong@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0195.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::20) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|SJ0PR11MB5024:EE_
X-MS-Office365-Filtering-Correlation-Id: 228e4f7b-89c4-4842-a9dd-08de9031592b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: +4WQR4lrn1yBXJsm0kxF7aNExw19T2lUnjRgQcV6swJzzR10DRu9ranZrR/MpsZhyZCDcS5Hydojjqhje5E0wpHIfgsPreFO8bOD2KiU0LOjut7w4Lgpr+sfQ6+CQu1buhT1YYGdNpf6qkJ5ZPg77Hdi2OrItEDSfYSLIY6m/lEm+2oaFsvxPXJn3o3IY474zWr1d3vbCgmhhxR+ooi5TPD5bzLK9uGoX1K5RYrqOqnRYF7DdtUqDar4MQTIMo/jVUTHNFaOSiwpI2X7/J2g0Tn8lPVbsQ7Odj+f1iu6nVlC++EwAJvVPI0bSBof4q6Eg1Pt9W/EAphFxSP6IYQTRu/VdJgno7/ruGzDN/xl2t1JF/m/UgpMIId32jhSxueKD8tjrpU0mKBj35PDYgVbCeK+RkMTxBny8XNC67MoPUaZrjqRiVAoMysYzRkfhuXJwsZfW9X/oC76nJGOsRmIOqOoxfT8CqDVj7s73eiRMYV3hxAe5n9aSRXNasFwXcMfwUURPbulUjZr03cwO2a6uzhxi9C/rQBiioDsADDSm4/aLwbD4OQGbLw5tzxO6WuZkX1P6szcabpE/Vc37z2huPkCy32zS0zHsVy3QUIAs40PLsL8s0CDVbWB4u/kkdHIrqTbNABj0h1ff0/bQA7w29/nHpLCEZD1oCouX6jKxlRkscnTk3xgdmjQR9SfqvZeWMGVK7GAE8MdRCWG1RlMNIBbptlWsIN9Ygm48w4ZxjA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SmE1MFZFU0tPR3h2Y0haMGpVRVJ2THhJMUd4dSs1RGtvSFppMFdqOGZac3JK?=
 =?utf-8?B?eG5KT1A5WDM4cktPN2pNT0lTN0pTbmRrbm5ELzRiSEpuOHdmV0JYR0FaQU5n?=
 =?utf-8?B?aVFiakpXUFoza0VFQmxNdjU4WUpDZDBvV0pCYzFNbEpna2l6eU9YSVRuN0d6?=
 =?utf-8?B?TDA5TjdCd2pTWVdvd3k0d2d4L3hNUngwQnRXUEd6K0tUVEZKcU0yTzdDT3lo?=
 =?utf-8?B?cWxXK1BnZ0tuQmVoa29pdGd1dHhwV0xQZzJiVmhUcERHUVNralJBTENZZS9S?=
 =?utf-8?B?YUdNUXh5UFE5TTkvenRXWWVTamExSEtlRXZRQ0VIajJFalQvMDlDUkUyZVhY?=
 =?utf-8?B?SWM2L2lzQnpjRmoxNm1kN0hWandFZFNWWWJuU045elZZZDNUekRJVmJqTTND?=
 =?utf-8?B?Yy9JQ09ONGt6T3MxQzhMMnRpNXM2QTNZNkJqUWozL2xzekI4SjFicnlmQlZI?=
 =?utf-8?B?K25LMTEvc2FlUHpzTnR5aW4ySXNXRzJMN2xmN3NVeUtOaHV4NVVYd09TWW5Y?=
 =?utf-8?B?OXBUTysxckdaNm1ybkJGdE8rSFc3bTBXVDZ4eUFGT29IYWdGUUE3b0lXRG5v?=
 =?utf-8?B?Z1h0dXg0WVB3OVJhSjVmWFlWTGJDWnZwb3YzMFBnQkQvWXN6amJ3VExmWE8w?=
 =?utf-8?B?RllLcVNvVExIZ1RmbW51VHByMHk2aGJTT3ZDL3ZUeUZYWVZjenVEeWVGb2Ex?=
 =?utf-8?B?VmYxc0tpdFhlL29DVzJQd3dTMkNrekhtSjNFUVlQaGtnenpUdlBDOUV0TUVN?=
 =?utf-8?B?RUxFN09YT21Hc2Y4UWFMQkFIQkFsdUVtOUZBY2NEVlNpNjJkSWg5aWMvdFRv?=
 =?utf-8?B?V0x5WmFqejdkd2x3N0NydlhHOStYMWZSdFFnaXc5bXc2c0pPWlBVM1FxUHZU?=
 =?utf-8?B?MHZSWUFpUzhRWnFiYmYyQ3Z3bS9VQ2pROTFjakxmWjBiam5qd3c0Y1BZbGht?=
 =?utf-8?B?aWFBeTA0WlRuQ1ZoQW5oYlF6L2wrazlxT09UU1JodWh1UjJTaEtOa2tremlU?=
 =?utf-8?B?WTIxV0VGVjZ2TzAzSGFTdFByQUVJVm9LV1NXQ0NBZDhIWFFKcjVDYytKTWVP?=
 =?utf-8?B?MTZXK012QmZIVFRZV3Z6L251c1AydHlBRG1UdU93eHV2Mkg0dkhqQ0hZaGZS?=
 =?utf-8?B?Mk4veUF4TlRNeGNsbzI3UXkwV0Myc0pOS3h2ZmdZeGVITFl4a2t3VkF0N2NO?=
 =?utf-8?B?K3M5Q2g4OHRqakZpS1pVQUdjMWxnWnNxNHhkOGFJNFhyTmIzMmpSNjVXVzgv?=
 =?utf-8?B?enVVd2hMVnRXSDFFejl0RVZTMEdWVUhBWUQ5V0NtZ0lSN0JJNDMyTGZudFBG?=
 =?utf-8?B?dHhIQ0dqOHpWMzJXWWpkRmNYbzcxSDJkOXl0UitZUk1UcDF2cm9VZ1h2V1hO?=
 =?utf-8?B?MVBEQ0Uva3pzQjdzT2lsbGpNM0xFRDYwcnZTcm42ZzJKZ1BrUnkvQmpJUi96?=
 =?utf-8?B?eFJIU2J3UFBTSE53SzRjRDNOWTJaZzhrcWVoVzF3NTlxVkRzYUlTRVVPdzU2?=
 =?utf-8?B?S0cwcTVSRjF3NW9XK1Y5ODhucjgxamxINW9QMWxhVlo2OTFaVDlDVWxtUGMr?=
 =?utf-8?B?S2FESDZNRWk0THE1RFZzektZNFg0NlBQTWFHZkxNblFqV1k1RjRjc1RnUXMy?=
 =?utf-8?B?K3NTcXJtb0UvUmp4OFhRUGQ0bGpiYjR3eWdneEZnWG85THRoSnJmQVppejRa?=
 =?utf-8?B?WVpDd0NiaE1ZOCtUUUUvMFVNL0VtZEJObVJhMUJmVVR1RlJlNjNnT1JGajQ5?=
 =?utf-8?B?clhJa3VGdHFTS1NaTjh1eXNHRDFCallDZ3YyWmNxeGQ4V3N6THo3enZERDFJ?=
 =?utf-8?B?cFZPck9TcHBTRWVqNSt6c1JyazlxVXg0cDA1K0RLQ2I5Q1l6YUNhbTA2RnRm?=
 =?utf-8?B?NkZDOVRrZ01mUGphancwN1VxQXFSU0lKQ3V6akxuWEhiQlQ4WGlnZSsrRXY2?=
 =?utf-8?B?SUJ5VTJ0cVY0WCs1L21uMGRhUm1MdXlxeFZqN1lIbXlkaTFIZGxpTERkdVND?=
 =?utf-8?B?Tk5hVTRZOUtjWlJCKzhka1JwSDJsaEwxTDRRVm5iVEVxdmRvaDBldm5jV0xl?=
 =?utf-8?B?VEIydHR3a2p4VDMzNUl2bmRqN2RiNE9SN3Rld3I3VjkrVUY5UEIyTkF6WHpW?=
 =?utf-8?B?aHlRMkU3a2xCRWFvYld1czZtcmVnSUxXM0JabGRPRjF2NnoyTzlRZElMZVpT?=
 =?utf-8?B?U2krS3F4d3lqeDYzQkxkblgrb2xIUUliMHU2RCtJU1ZYMWgxeDJBc3dxQndx?=
 =?utf-8?B?Mzc5TVRxZmcwUlA1cDdsMkFVVXRCdk5WcmJ5bWU5ZUc3T0x4eHlGMEtDb1BF?=
 =?utf-8?B?bkxKQlQ0RVJNY3BCMEFGRzBNMmkwRUZSdHBEek5EUXJiSkdscmpGR21OVE9S?=
 =?utf-8?Q?gONTWYr2zgPE/ZsQ=3D?=
X-Exchange-RoutingPolicyChecked: ggOlX5Fy/wsOLo9TdvUZB+iX06GrB3hH8RuinQl5YydIU/wE2DSCARG9w9balwFzWfeOh21FOKjtAggnrwD3oMJmONwEJk1Bus41SCOiYpyXojgN3EDWNR4KAA1v1uRfH4tTsXmHn8cJKadzbrryOIJgUZbUlHCX8WCkzkHGAa0yeRb6JyIoyXAENZRnn4NZ2AKAPPmLpEr/iF1p/b73kTWIdy6E4RYvOGJ9E4Fj7Z+V+sq3krkCL4QOUbnB5zuZ4AVx9ZcSawBfF/z2VWGgZuB1j0hdfmvu+p2ptEkus4YMiJjPPCgiwPFYqHrYpKlTdd49TfnAwUg2TCO+WW5I7w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 228e4f7b-89c4-4842-a9dd-08de9031592b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 20:57:55.8468 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VDVdBvm2MIh0szRbTEXNY/ihZL3YKCop2GWqQKZ2BAWiLF9yCQb59Z1SfQ1ow1RHHRlyXUwkM2W2VUJZj5PIDRpeGwMh4f+SHb4fez41/Gc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5024
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


On 3/26/2026 11:10 AM, Zhanjun Dong wrote:
> In xe_devcoredump_snapshot_free(), ss->gt may be NULL when the snapshot
> was never fully populated (e.g., when cleanup is triggered without a
> prior capture). Guard the xe_guc_capture_put_matched_nodes() call with
> IS_ERR_OR_NULL() to prevent a null dereference.
>
> In xe_devcoredump_free(), the deferred work is only queued when a
> coredump is captured, so guard cancel_work_sync() with a check on
> coredump->captured.
>
> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_devcoredump.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
> index 558a1a9841a0..ec206f512795 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> @@ -149,7 +149,8 @@ static void xe_devcoredump_snapshot_free(struct xe_devcoredump_snapshot *ss)
>   	xe_guc_ct_snapshot_free(ss->guc.ct);
>   	ss->guc.ct = NULL;
>   
> -	xe_guc_capture_put_matched_nodes(&ss->gt->uc.guc);
> +	if (!IS_ERR_OR_NULL(ss->gt))
> +		xe_guc_capture_put_matched_nodes(&ss->gt->uc.guc);

How about the other pointers being used here? Like ss->guc and ss->ge?

Thanks,

Vinay.

>   	ss->matched_node = NULL;
>   
>   	xe_guc_exec_queue_snapshot_free(ss->ge);
> @@ -254,7 +255,8 @@ static void xe_devcoredump_free(void *data)
>   	if (!data || !coredump_to_xe(coredump))
>   		return;
>   
> -	cancel_work_sync(&coredump->snapshot.work);
> +	if (coredump->captured)
> +		cancel_work_sync(&coredump->snapshot.work);
>   
>   	mutex_lock(&coredump->lock);
>   
