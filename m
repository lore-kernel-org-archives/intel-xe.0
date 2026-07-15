Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5383CC44501
	for <intel-xe@archiver.kernel.org>; Wed, 15 Jul 2026 13:59:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 145A410F0D2;
	Wed, 15 Jul 2026 13:59:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Oo7NFPLl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 011E310F0D8
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Jul 2026 13:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784123986; x=1815659986;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ER5KlPVhPSbP4K5ZUFGHwDoh9jVjpxrAOYj0z/rzvcg=;
 b=Oo7NFPLlYxQLFXq+zQj5qOzNAgYcg5tgnPoStyv2Wjav3xzilEhfbuuo
 tulIfDiuhsbSVhddiB8HifKNnZF/VVmVPmwnYvNyGqJYDTd7ra/zZNIG3
 7ECxwBg+LnOBwoXE0c5qOEfB0Wl0zykVVCX/KRFbo2JibUZe8VJ6oUTjQ
 fRRXkku8BFcBNEu1eD0in32Eg9NJce9aYZ5Pvy/PY7bOpTkQre8Oa6qvD
 7l7WZrlyX2LYDUMN+OUUvHUmqY5SEtt4WoTiyZpVDPW4b8FBavP8rANY7
 wnW/ThjHcR39onwIZoS585swIqUtFB9cVjeybfNmepo4Gj/3rDS1PLLIP Q==;
X-CSE-ConnectionGUID: V10yqyCtS+6UTFHrouTBww==
X-CSE-MsgGUID: IVp2XoXZSO2LJSRM7bJMwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84801277"
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="84801277"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 06:59:45 -0700
X-CSE-ConnectionGUID: pIwna+1oTVW5Yj45BpyCqg==
X-CSE-MsgGUID: WBdktKM2R8mx25OdHTnBrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="256235528"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 06:59:45 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 06:59:44 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 15 Jul 2026 06:59:44 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.5) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 06:59:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bg6YmwyjKQbWEbRwD2rS21+CmqHEs0o0W6OlSywNxkyE0O07WGeWN9fil09keVXpopg6wQ03oHh5c4VtUm+btBFpMGsk66EHU5r4KqMYYHKW8wYug1ww1MNLMpVfJ+30cS+Cz1/RlMW3AgjXzJxic47SWBy7tJ38oUxKkqk2oWHzLtoDU+a9Hg4KjZHnmXTpsLv0KEEXtbFHcFWCgpdOB5u6VaaIw8JUSMBueukubHEQTnv5dGCpUGGalYhIXmpdEPzXxHspdYMRdsHYW1vpWITbnJLsgM8IJFdoPHrjP9etmanhPW/A4+OPzGT3qE2oQ4xzzviysMLur/EwvzBXGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QeMd397zlIkLWIzR8viK9vXFJ6F7DMVQYnJTbKvx9oU=;
 b=ZWStGmAHUETmDn3g7hffLkM+LbdXgtKBNFibu4FYfvG0AMCHZnUdxpKDfRYNzYpomoDd8dFN7JcnV+QJY+4kG/EFuR5XT0A6KIVjiUOAo8/cnmhiEB9lYZ/RaxUCvXjX3IqkHFjURPjv5gYHiwx+8vEUxUAHrG3NymgiNRJUG44mFEhTxkvynMp+deFnXzaIdWzEG5ePv8bagdJ8U0V5AzWY6ErRDh/PGrvPhpC4vjNvulHOtNKVIHEuBhXTzjtEbeU7KIVvdgRTohLeVYbHKilZnI+8N94RU3TFW/QrSJQY0obvLtgws53ufs3F7l6lf6HQ7t8MUjOvXr9pC71eDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 CO1PR11MB4964.namprd11.prod.outlook.com (2603:10b6:303:9e::24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.11; Wed, 15 Jul 2026 13:59:42 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0223.008; Wed, 15 Jul 2026
 13:59:41 +0000
Message-ID: <f73f01f5-22d7-46a6-8200-c4d809aabb9c@intel.com>
Date: Wed, 15 Jul 2026 19:28:19 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11] drm/xe: Consolidate debugfs fault injection functions.
To: Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <vinay.belgaumkar@intel.com>, <karthik.poosa@intel.com>,
 <sk.anirban@intel.com>, <raag.jadav@intel.com>
References: <20260715085159.424040-2-mallesh.koujalagi@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <20260715085159.424040-2-mallesh.koujalagi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0061.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d3::6) To IA0PR11MB7955.namprd11.prod.outlook.com
 (2603:10b6:208:3dd::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|CO1PR11MB4964:EE_
X-MS-Office365-Filtering-Correlation-Id: ad7513af-5498-469f-b6b5-08dee27950a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|6133799003|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: xuywnm6hTDTAC4C55i4p9llyZji1RixK3MWlSUpl+I/mH2/5FFwJf9fe3bI86kl8kXArDztbw6CJlXMpvysHV1xn3FWvIzYqWZeCVoP5SJ/byZVYtFMenPeE/eXY16xpJ9ZQCQHuJtvMuNB6UBlvN/ijdYw23cIwixKSqJN7DKFLT/7uKsEpJwAN/IBA4BZl/6CLuEObL1fHmtUQEAAX0oSQtZfZ+WCfBsMCktyfEJdPYx9c487hihJZEUu6pMOdyvTb/prlVEY8mZzgVCOZAurmzFNKjdFPv3ZXwUUWcEe+yMky7xpBVSS175a+PQPW2sgDK+t8HnOOxB/wZ5+11yWxiFk2wMEadC1BEDDNMtWpylpYYfv9hp77sHlU/qXYjCCzK/lipXb3Em6OzjmNGrl4kdfSKbsT52djbnvD4z0arHWH8Vpex0BabUPpESah4IIojStzka0wjUF8yJDREOU0JxSgtFcaCy9SQKPcNoLLD3hUc8JyK4vutIxWJGgXIcJHz/xAUV/nOb1vWeFs+r1lvlM2X7E99DUK3/5IYEJRlrKub7DXGClpoXU4yXSs1RJkKyAYubKqFFDf170CEDhMkEvTyVuoT+JTzMRfeylUoDoRh1f1FsBAXuR3aKeVUOQKOlcoKDBfLjchFS2lsPfl+IsdGNLJPRAdaYCwZ/Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(6133799003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aVhqcDIzeXFNaThJTzlsZkhqVGdhaW9ETlRoNGUrRi80bEliWmFycTZ2S1g2?=
 =?utf-8?B?VGsvQ2x2ZkFzODNxSzQ2U1gvV1BXWGZBQjBLMzYzcXdldGpTS3JHbnlNbjNN?=
 =?utf-8?B?RW1UMkxwaWZmenJadDF5aEM4NlFqNXZuMXdyYzY3a1FCbExIVFIvMVlHdjB2?=
 =?utf-8?B?L2k1RC9QSVhleFRrOTJOS2xOb08vb1JNVkNBTVRiVVZQdHZvaVZzM21McmxH?=
 =?utf-8?B?WVltTERyR1FRb3AwWFVKc2ZGeXV2bkkvTldhWmx3MzQzZHQ1VHhueTVTQ3RW?=
 =?utf-8?B?cjdVT1pNbFU4WWN2YkNWT0ZTclJRaStJaTM2YUV3Y0Zpd1JSWlNHZFgrdGs2?=
 =?utf-8?B?Zi9lOWtTbDJ0OFBwbGh1RWJ1VStwdXJaV0gxcjM5T2praGdBemxQSkRxL3ZM?=
 =?utf-8?B?bmJUelBxQmNEYXNiQk9xRFM4Vk5YYU5KclhmdXJPenZQdFZyeFBKeHdEaXV4?=
 =?utf-8?B?Q1pMdmIrQ3IzeTBnVENPSWdTQ01IeXA5WG5yT0VoMFJJdk1IRkVURWVrVFYx?=
 =?utf-8?B?VEM1dnl5d0pWekZCcHVIelkvdUdzTnBkcjZuU0JoeTNTdmtVY1Mrd3N4b1cw?=
 =?utf-8?B?dVNQK1Y3bHY4ZG9JQ3RiTnY5Zmp6a0x2Q2dOMXZQUjFvVldONzNPWlFsakw1?=
 =?utf-8?B?N0VSTURJOTlHT0ptM3FoL0dHVmZoMlo3aWlLTmJYY1NpbmQxVXlkcFhvZStX?=
 =?utf-8?B?djFxb2VBb3FqSmF4NXVFT1NZbDBaQ3VkNXJUSW10WVI0c1JaaWhnYW9JZEhi?=
 =?utf-8?B?aTBzdTh1YTluSGtWa1dsN2pzWWNDT3pmMG9FeFlMb3dTaVlPM3FQQ0JqY2hF?=
 =?utf-8?B?bWV3WmRZblJxVlBLaW0zMUl0WDkxMmZTWlpOZmlFYTRsNzFwUnB1S25uKzJh?=
 =?utf-8?B?WmpyRmVJa3A1YjVnRWgwYW1hRFNqV2Q2b0FrWXRiQzlRWGJZd3lvandhNnl4?=
 =?utf-8?B?RHVJZi9wUEdyWVNRV0ROVW1JKy9rRGpyWFBiMEk0MW1EUEpvNmNoRjhTUkpk?=
 =?utf-8?B?SHEzRmpvS1Ezcm0zS3B5Y3BxTlJHZ283d1NDVFJ2NWk4Y2dKTmg1Q3NxWGto?=
 =?utf-8?B?eWVlTkZ2TFpRdnQrb29DMUNmaWlmYW5WTTJrd1RRaXRuNjRHQU5vb1JGUEt1?=
 =?utf-8?B?OVc4Wk4wclkvRFRCVzBYclZGN1F2a1U0WThBOXZ2ei9uRUltOFpSZFVjcWdk?=
 =?utf-8?B?Qm5RSk9BNlUzbTYvbUV1cHhKV3NCRmtWcEhSY0JHY0N5WnhDL2twMXcwc0s0?=
 =?utf-8?B?aW5pVGRUeHlSWmRwUGM3WGlRWkcwWHRTaWNnSVlxaVdNUWxqRWJkY2VjbG4r?=
 =?utf-8?B?UkNqZ29WTVFpbytnRDJxU0xWcnFUSXhQVFRISUlDcWtMbHFhMlJPMjBpMkJm?=
 =?utf-8?B?dHZaUGdrMEVrYlhWSDVhYUpmTDVWNzlxeU1iVnZkbm1DK1Y3SUJFQTNmNjNx?=
 =?utf-8?B?NzRzeThBV3Z3SkdJbHRDRjdoQ1RvVjdLTS83L2VrWWM5MXR5N0ROazBtWTNK?=
 =?utf-8?B?T2FjWSt4dU1Jazhja254anhTNVlURUYzZ1FBYjQ1aWRtZG9xNXh0UFJ4SWtN?=
 =?utf-8?B?WWFIdmxkVHhFTFkvQ1hFc1dWYWFMbnNnWWRNc3NmTWZlaUNNOEgvazZpUzRD?=
 =?utf-8?B?ZjByV3ZnVjJDWFV5VXIrNkV6NERmdGFLUUcweGVLM3NNckwzWUdKM0FWQzh0?=
 =?utf-8?B?STF0OEY4QVVmT3VtVURXSGowa0pJZXNmNDhCSVBhVVV3YXBrVFJTaXF0bGI4?=
 =?utf-8?B?RUp2Y0hvQVFKU2Z0ZlJmbkM5eEhvYmV4emlseVovOGIzUDJxd29iVHdpWjdI?=
 =?utf-8?B?L1FsMWFZMDlmU3l2OTZIalRJY1l0Z1FQZDR5UUtJQzVOMDZycGxnQVpaRGp6?=
 =?utf-8?B?V0xkbXZGMmlsZ1NzTVN4Yk5Ua2gzcTh6TjkycFpxOXJaUVJERmVsazMvS2ZE?=
 =?utf-8?B?Z0hxM09iYko0NVpFQnZZbWZtOEIzalhGS2E4TmtjRHVXSGl2OGVWbmlIYXRU?=
 =?utf-8?B?SmcxZ05rRHBsczUzK2ZOb28wYVp1TmRtWDgxaUgzMGZjbHZ4SDgyQ2JxNVE1?=
 =?utf-8?B?QlBVcDcxbEpLeDNGcjVLT0dndlVMTW9NTjE0UFFZS3Q1L3ZtOVNhQ1ZZa1Fv?=
 =?utf-8?B?bnBYNHhWV3ViTHRaNVRreXBhb0pDNWtXS1RwYVZnaEtINmJaMTBUVTNVN1pI?=
 =?utf-8?B?VU12U0xBUEJGVGJERWc0OWdHM0piTTlpRWxsRjNXNkl5YVRlKzlzME9GRUcx?=
 =?utf-8?B?MGR5SE0rODlOZFc2ck9QM1ZnTnBMVmRUSGkxSnpwVFk5WThqUmVoRjFVcHdn?=
 =?utf-8?B?QkdkbFFBc2dLaG5YYXhzdEtRcHY1T3VWdCtHM00vVkxKM0E0UGVadz09?=
X-Exchange-RoutingPolicyChecked: sf20lvIEaTp4qvTgjM2rJr4WuDfo4tXe0yljXOF9BPYDArfTtDudkq/zpipREGj6exhzaNM1rH/aj2T3QJmYX/2ASZ5092I2qKn7B2hvH+eklDDuFfX+LQronvY+o2OXOgmCInFcFOixsNGOXVhQs6cNbCHW9OuwWSt2ovgmqYJJ5jdP2CAe0Cfs+y4O5iFAgjX7B0o+xhZXvYG6B5mHHgOJxX6Im40tfjhZB4r7tWNlUL1c5FHER1uRq80nmCZF0kZLsZ/P03PlWR7z7dSMbNB3lvHkt15E+NNEMVP2yxgYblByjQL0pNpAgUnOiWV9ygIAw6z3lvQToluV5fpMGA==
X-MS-Exchange-CrossTenant-Network-Message-Id: ad7513af-5498-469f-b6b5-08dee27950a3
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7955.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 13:59:41.7138 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1aQrffw8QtgdixBNrsYZT0t/anB8N4go/Wp06b40JywOkRPyj/thg5kSiJ8gKjy9UotXn666opQWuVQQPwOICw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4964
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


On 15-07-2026 14:21, Mallesh Koujalagi wrote:
> The fault injection code was scattered: the GT reset
> hook lived in xe_gt.h as an inline function with its own global
> variable, the CSC hook had a separate global in xe_hw_error.c with
> an extern declaration, and each was individually registered in
> xe_debugfs.c. Adding a new error type meant editing many files and
> copy-pasting the same boilerplate.
>
> Debugfs interface (under /sys/kernel/debug/dri/0/):
>   - fail_gt_reset         - GT reset failure
>   - inject_csc_hw_error   - CSC firmware error
>
> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>

LGTM

Reviewed-by: Riana Tauro <riana.tauro@intel.com>


> ---
> v2:
> - Add multiple platform support. (Vinay)
> - Handle VF properly.
> - Rename to XE_FAULT_GT_RESET/XE_FAULT_CSC_HW_ERROR and
>    create xe_fault_inject_types.h file including those name.
>
> v3:
> - Solved patch apply issue on tip.
>
> v4:
> - Add proper header file.
>
> v5:
> - Properly refer FAULT_ATTR_INITIALIZER. (Vinay)
> - Change xe_fault_inject_descs to xe_fault_inject_entry.
> - Change 2025 to 2026.
>
> v6:
> - Change return comments of xe_fault_inject(). (Riana)
> - Remove full description of xe_fault_inject_debugfs_register().
>
> v7:
> - Move all fault inject helper functions in xe_debugfs.c (Riana)
> - Update commit message.
>
> v8:
> - Assign .attr pointer with DECLARE_FAULT_ATTR macro. (Riana)
> - Remove CONFIG_FAULT_INJECTION block.
>
> v9:
> - Add single availability callback.
> - Make an abstracted function. (Riana)
> - Fix xe_fault_inject_entry struct.
>
> v10:
> - Swap attr and is_visible in xe_fault_inject_entry.
> - Add is_visible instead of available. (Riana)
> - Add FAULT_ACTION macro.
>
> v11:
> - Resolve linker issue. (Sashiko)
> - Make header order correctly.
> - Add comments.
> ---
>   drivers/gpu/drm/xe/xe_debugfs.c  | 54 ++++++++++++++++++++++++++++++--
>   drivers/gpu/drm/xe/xe_debugfs.h  |  6 ++++
>   drivers/gpu/drm/xe/xe_gt.c       |  5 +--
>   drivers/gpu/drm/xe/xe_gt.h       |  8 -----
>   drivers/gpu/drm/xe/xe_hw_error.c | 11 ++-----
>   5 files changed, 62 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index 8c391c7b017a..5a3877fcb0f0 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -5,6 +5,7 @@
>   
>   #include "xe_debugfs.h"
>   
> +#include <linux/bits.h>
>   #include <linux/debugfs.h>
>   #include <linux/fault-inject.h>
>   #include <linux/string_helpers.h>
> @@ -42,6 +43,55 @@
>   DECLARE_FAULT_ATTR(gt_reset_failure);
>   DECLARE_FAULT_ATTR(inject_csc_hw_error);
>   
> +static bool csc_hw_error_available(struct xe_device *xe)
> +{
> +	return !IS_SRIOV_VF(xe) && xe->info.platform == XE_BATTLEMAGE;
> +}
> +
> +/*
> + * Fault injection table.  Each entry registers a debugfs attribute; add a
> + * matching FAULT_ACTION() below for every entry added here.
> + */
> +static struct {
> +	const char *name;
> +	struct fault_attr *attr;
> +	bool (*is_visible)(struct xe_device *xe);
> +} xe_fault_inject_entry[] = {
> +	{ .name = "fail_gt_reset",
> +	  .attr = &gt_reset_failure },
> +	{ .name = "inject_csc_hw_error",
> +	  .attr = &inject_csc_hw_error,
> +	  .is_visible = csc_hw_error_available },
> +};
> +
> +/*
> + * FAULT_ACTION(name, fault_attr) - generate xe_fault_<name>() accessor.
> + * Add one entry per row in xe_fault_inject_entry[].
> + */
> +#define FAULT_ACTION(name, fault_attr)			\
> +bool xe_fault_##name(void)				\
> +{							\
> +	return should_fail(&(fault_attr), 1);		\
> +}
> +
> +FAULT_ACTION(gt_reset, gt_reset_failure)
> +FAULT_ACTION(csc_hw_error, inject_csc_hw_error)
> +
> +static void xe_fault_inject_debugfs_register(struct xe_device *xe,
> +					     struct dentry *root)
> +{
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(xe_fault_inject_entry); i++) {
> +		if (xe_fault_inject_entry[i].is_visible &&
> +		    !xe_fault_inject_entry[i].is_visible(xe))
> +			continue;
> +
> +		fault_create_debugfs_attr(xe_fault_inject_entry[i].name, root,
> +					  xe_fault_inject_entry[i].attr);
> +	}
> +}
> +
>   static void read_residency_counter(struct xe_device *xe, struct xe_mmio *mmio,
>   				   u32 offset, const char *name, struct drm_printer *p)
>   {
> @@ -583,8 +633,6 @@ void xe_debugfs_register(struct xe_device *xe)
>   		drm_debugfs_create_files(debugfs_residencies,
>   					 ARRAY_SIZE(debugfs_residencies),
>   					 root, minor);
> -		fault_create_debugfs_attr("inject_csc_hw_error", root,
> -					  &inject_csc_hw_error);
>   	}
>   
>   	/*
> @@ -642,7 +690,7 @@ void xe_debugfs_register(struct xe_device *xe)
>   
>   	xe_psmi_debugfs_register(xe);
>   
> -	fault_create_debugfs_attr("fail_gt_reset", root, &gt_reset_failure);
> +	xe_fault_inject_debugfs_register(xe, root);
>   
>   	if (IS_SRIOV_PF(xe))
>   		xe_sriov_pf_debugfs_register(xe, root);
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.h b/drivers/gpu/drm/xe/xe_debugfs.h
> index 17f4c2f1b5e4..cd56f7442b99 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.h
> +++ b/drivers/gpu/drm/xe/xe_debugfs.h
> @@ -6,11 +6,17 @@
>   #ifndef _XE_DEBUGFS_H_
>   #define _XE_DEBUGFS_H_
>   
> +#include <linux/types.h>
> +
>   struct xe_device;
>   
>   #ifdef CONFIG_DEBUG_FS
> +bool xe_fault_gt_reset(void);
> +bool xe_fault_csc_hw_error(void);
>   void xe_debugfs_register(struct xe_device *xe);
>   #else
> +static inline bool xe_fault_gt_reset(void) { return false; }
> +static inline bool xe_fault_csc_hw_error(void) { return false; }
>   static inline void xe_debugfs_register(struct xe_device *xe) { }
>   #endif
>   
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index d904527a8898..dfdacc0f6de9 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -21,6 +21,7 @@
>   #include "regs/xe_gt_regs.h"
>   #include "xe_assert.h"
>   #include "xe_bb.h"
> +#include "xe_debugfs.h"
>   #include "xe_device.h"
>   #include "xe_eu_stall.h"
>   #include "xe_exec_queue.h"
> @@ -926,7 +927,7 @@ static void gt_reset_worker(struct work_struct *w)
>   
>   	xe_gt_info(gt, "reset started\n");
>   
> -	if (xe_fault_inject_gt_reset()) {
> +	if (xe_fault_gt_reset()) {
>   		err = -ECANCELED;
>   		goto err_fail;
>   	}
> @@ -986,7 +987,7 @@ void xe_gt_reset_async(struct xe_gt *gt)
>   		return;
>   
>   	/* Don't do a reset while one is already in flight */
> -	if (!xe_fault_inject_gt_reset() && xe_uc_reset_prepare(&gt->uc))
> +	if (!xe_fault_gt_reset() && xe_uc_reset_prepare(&gt->uc))
>   		return;
>   
>   	xe_gt_info(gt, "reset queued from %ps\n", __builtin_return_address(0));
> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> index a6cfaa1af23f..65a4655b0994 100644
> --- a/drivers/gpu/drm/xe/xe_gt.h
> +++ b/drivers/gpu/drm/xe/xe_gt.h
> @@ -6,8 +6,6 @@
>   #ifndef _XE_GT_H_
>   #define _XE_GT_H_
>   
> -#include <linux/fault-inject.h>
> -
>   #include <drm/drm_util.h>
>   
>   #include "xe_device.h"
> @@ -38,12 +36,6 @@
>   	xe_gt_is_media_type(gt_) ? MEDIA_VER(xe) : GRAPHICS_VER(xe); \
>   })
>   
> -extern struct fault_attr gt_reset_failure;
> -static inline bool xe_fault_inject_gt_reset(void)
> -{
> -	return IS_ENABLED(CONFIG_DEBUG_FS) && should_fail(&gt_reset_failure, 1);
> -}
> -
>   struct xe_gt *xe_gt_alloc(struct xe_tile *tile);
>   int xe_gt_init_early(struct xe_gt *gt);
>   int xe_gt_init(struct xe_gt *gt);
> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
> index 4a4b363fc844..5f2abc9485ff 100644
> --- a/drivers/gpu/drm/xe/xe_hw_error.c
> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
> @@ -4,12 +4,12 @@
>    */
>   
>   #include <linux/bitmap.h>
> -#include <linux/fault-inject.h>
>   
>   #include "regs/xe_gsc_regs.h"
>   #include "regs/xe_hw_error_regs.h"
>   #include "regs/xe_irq_regs.h"
>   
> +#include "xe_debugfs.h"
>   #include "xe_device.h"
>   #include "xe_drm_ras.h"
>   #include "xe_hw_error.h"
> @@ -25,8 +25,6 @@
>   						 (PVC_COR_ERR_MASK & REG_BIT(err_bit)) : \
>   						 (PVC_FAT_ERR_MASK & REG_BIT(err_bit)))
>   
> -extern struct fault_attr inject_csc_hw_error;
> -
>   static const char * const error_severity[] = DRM_XE_RAS_ERROR_SEVERITY_NAMES;
>   
>   static const char * const hec_uncorrected_fw_errors[] = {
> @@ -167,11 +165,6 @@ static_assert(ARRAY_SIZE(pvc_master_local_nonfatal_err_reg) == XE_RAS_REG_SIZE);
>   						 pvc_master_local_fatal_err_reg : \
>   						 pvc_master_local_nonfatal_err_reg)
>   
> -static bool fault_inject_csc_hw_error(void)
> -{
> -	return IS_ENABLED(CONFIG_DEBUG_FS) && should_fail(&inject_csc_hw_error, 1);
> -}
> -
>   static void csc_hw_error_work(struct work_struct *work)
>   {
>   	struct xe_tile *tile = container_of(work, typeof(*tile), csc_hw_error_work);
> @@ -517,7 +510,7 @@ void xe_hw_error_irq_handler(struct xe_tile *tile, const u32 master_ctl)
>   {
>   	enum hardware_error hw_err;
>   
> -	if (fault_inject_csc_hw_error())
> +	if (xe_fault_csc_hw_error())
>   		schedule_work(&tile->csc_hw_error_work);
>   
>   	for (hw_err = 0; hw_err < HARDWARE_ERROR_MAX; hw_err++) {
