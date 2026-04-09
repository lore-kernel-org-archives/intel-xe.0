Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC9A9EA3C55
	for <intel-xe@archiver.kernel.org>; Thu,  9 Apr 2026 11:27:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4472510E7CD;
	Thu,  9 Apr 2026 11:27:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nyL8e0SX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04DF810E7C8
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Apr 2026 11:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775734076; x=1807270076;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zUnolM0mcG4CR3csiz3jFJURH4y/qMAdkLWo3xrp1nE=;
 b=nyL8e0SXuztT52SSrglw7fOBTEZBGnS8YBt7VOfBDxZF6qKGcBCvNko8
 Czygt2N7W/vyEe4OamSRheT7m4DZ7XT+J3fZsvgg+0djJYFqttazS7j/9
 BL6joOMz67m2nPcz4ffdrRXEbYpqtErn/pI+ICj8L2mVMHSgCsKpZudsa
 hJCHFwnTaYIxtsrlwDifCH6QjPYX4iGiTl+BDrpjXb3fsS15hTUC5SWZD
 eKk2kBz9NlCmpi1gk6sT05bJeyTl/E2EBXnruwamJSxQzXUtOhJ2DSQyV
 zcKjxjerKd/cemGDZJkT4r+ZVB//Olbek27Xhig2f1dfn46i6FVBefRhx g==;
X-CSE-ConnectionGUID: d6SdQYAYTCuGhjfLK0lCSA==
X-CSE-MsgGUID: E49haaSQR5Gr35UnBDjBEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="94124447"
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; d="scan'208";a="94124447"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2026 04:27:56 -0700
X-CSE-ConnectionGUID: ca75bZMxSn+N4CH9jYOBnw==
X-CSE-MsgGUID: auZVJAoIQrGvFXbq093Mig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; d="scan'208";a="259191005"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2026 04:27:56 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 9 Apr 2026 04:27:55 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 9 Apr 2026 04:27:55 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.22) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 9 Apr 2026 04:27:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gBwjZWcl4xaG5JjZRfuM4WEZsxQUBWxtD+YJRTP5QN/G+qE86jcBmFg0lZ2aPAKFRXHgfUVQsxGDP+8GCvIH+4oz1pBxje6HxC9BhWPtbyo6UV+6jCOQJ+5OmDRRwEuvD2ahdAC0mW76jQWgwtaybiLtDStqoKCqZ5gCuMA/gq8gSJIHS7p/76yeX0eLes0ehnk3BegYZxbPYpbPHSnDbXPuyOAR39UR6BQMPnFKlsaIopz1kHAh8sim9zYRpMeYpWfT37J0+nE7F/BEJn/n3LcN3csztH945h629PNdab3Y8XX6hQ3o3oXVvCQTyhSMX8VayiIkjcVUQ/0hQvXmng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IIs9bYMp/xFN7ueIkVb+e+uxYMh3YXt0YAEPhPWumv4=;
 b=HEXE9485LdkQcMQh5ChVWGuglHI9NLW6zsFWWDmuHFybwARcO8yGSDAN/V/R4cr92A4yHiinLqa3hn6CxTIU2nCsrC3kS6HXNKv45JyX93LsiDIZ71sETN+8fnqovPfFBi/NXsaIrH1bnPhXNrKUpbdVSkdLOZF/UKJtpZ3iSbcjUypaI9AVyLtr4Cv8+vLc/Suu0kgcqaI7ns7pJ7WLrsQASeK1vVX0pOQs+yHn9LixTo+WtqLkoovDn1X4AvIM9vm6SpmcGmDelwr5dHCqPSkkcuuHCk3+4/uwo5Q7vZ2cOu93Q34cuaS5qJpCtCg7kXmR1T6WS+dUcr8pgJOU2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB8252.namprd11.prod.outlook.com (2603:10b6:510:1aa::14)
 by IA1PR11MB6123.namprd11.prod.outlook.com (2603:10b6:208:3ed::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Thu, 9 Apr
 2026 11:27:51 +0000
Received: from PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2]) by PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2%4]) with mapi id 15.20.9769.017; Thu, 9 Apr 2026
 11:27:50 +0000
Message-ID: <c933d0d6-3fda-4068-98da-78b1a4f214d4@intel.com>
Date: Thu, 9 Apr 2026 16:57:42 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Add fault-injection support for CRI throttle
 reasons
To: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Tauro Riana <riana.tauro@intel.com>, Gupta Anshuman
 <anshuman.gupta@intel.com>
References: <20260316052929.2069009-1-ravi.kishore.koppuravuri@intel.com>
Content-Language: en-US
From: "Anirban, Sk" <sk.anirban@intel.com>
In-Reply-To: <20260316052929.2069009-1-ravi.kishore.koppuravuri@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0134.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d5::11) To PH7PR11MB8252.namprd11.prod.outlook.com
 (2603:10b6:510:1aa::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB8252:EE_|IA1PR11MB6123:EE_
X-MS-Office365-Filtering-Correlation-Id: a9ffa578-b133-4dcd-40cb-08de962b0881
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|18002099003|56012099003|22082099003; 
X-Microsoft-Antispam-Message-Info: jtmH5czldhl9wNYVKT7oAsVZx495IgKv0SQe+z2rB4mhNx0dbZ+lHqSPdWQSpRxAoorXcUEzuzz6qQ9dwpSgj2BEYW2DDW8Bun/flzIIaBx6k7PxnWe0OOtQKygmL/3uD40VlR4iUbZn2kWIspke1UVk7ixm0r4BgMVv0vb5WmzrnwOysUbL5aus7Xjle/HP110rU9LRnJ4wngh+QJ0hbbLgnnrRyTWKkDHr1Lhts4RS8r0HgWk8+Yj3pNVxceDt4txDtmw6pcJ4bdNljBiMPy/WwdIZ/zS9/zRIdxa3JjSF2YKW5UQF3YYyO0+8Gb6bTN7gGWUxJtjEastL7EqVW61m8vs/LFnR7FsFVxzRytCis4Qd2g3PrgnLfUOxdUsLmvpwECKSZTv8o04QYn034ypcEt1WVn7KNiEILqWcavbpOR2q9E8jtqJ+Wdz+ohzmMTAdBJ04rJlOpGgoBjJI0ksaYe2FD7kj/5WGYwGoXtrUgGvByA/HocZO+hJITWI+L6sGbc3EpvD6nzUygYeO2xta3mowZNskSRIIQvsj5sVQMSU6NbybgHDvfJEXRl4QCwIYoFZinBU5MOowAvMQshv7SaNIh20/I88iSqW2scLvcf1p2RCi9vfgbVzc+JM4aRcRMjpv/vhwuNmC/FJNKsoNtPAjq2dMIBc4NLA+jB3CXNZQCPJGzFUJOpYfzj3+B0c6epfYPxU43VGx8YW7etCr8hMLKeMgV2jbQIM6YPo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB8252.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TzRqaUkwNDM1eEw0UDJNY2wyVExyekp6YU0zbHpGeTl2NWd1bTM1TFl6SXEv?=
 =?utf-8?B?SU9OOVRranRZcGhVdE1BTVAvOUF5bHlrZGZDMFFvcXZPcW4yYUJBNzhGWTVN?=
 =?utf-8?B?bFArbkwxUHB0MVJYNS9TNVlRUXBGNTNGRXlKeHRudUE2ajdZSUdHdnZnWGFQ?=
 =?utf-8?B?QW5ka0Nla05iMU1HbmtDWTFnbHArZU1KKytvamVveFhIeVRSOGtKeUQrc0kx?=
 =?utf-8?B?RVVRMExQS2pWM3hpS2pkMSsyK3pYaVZUaVcvcmRLVnlvSitLek83dFZpWEcz?=
 =?utf-8?B?cG0xTXg1clBPNytBYTNkVTdzRzNpMEMxcXBxMlF4Q0dKMWJ0NStVL1FQOFZY?=
 =?utf-8?B?M2QxZVhQNFljV2E4aFRBQlh2YVpkd1RqR0IrNzdPSy8vMnVTR0wyTzk2ajlM?=
 =?utf-8?B?NXp3ak5rM3lyd21nc003TE96ZGlIQXpGdEVoVUlNT0NkNWY0c0lKY3RHdVFy?=
 =?utf-8?B?ZW00Q3FhNWV2Uks0N1dPWXU4ZkVRSVZuRzJ0ZzAzd1JSL0ZLNlJ6c3QxTTlj?=
 =?utf-8?B?K1pDdzkzOXhBV2EzcG90djFMQ3VlanNGZzhQYlNKS3dQN3lJSzJRWFBMWG5p?=
 =?utf-8?B?T1g0TjhLQ2dUUlZadTFwK25Rek16K2RiNkhjMHgvS3JVQld2LytCdEN0UFE0?=
 =?utf-8?B?VVA3emliTklSdVM1cGhGYiszWkdBaE1QeGNBcTViL1RwQ2J0RnRuZnlKcmNO?=
 =?utf-8?B?N2NNdmNsc0JoOGMzL3EwZlRGQXo1RUFiRVkxdWJXeEczTHZHS2VpZWtZLys5?=
 =?utf-8?B?aUl5dUZ3OGJMWWZTL2hjRXdhSGNleGRlQi9nY2pYZnJyUFgxQWJUNnlZRDBs?=
 =?utf-8?B?UGhFcU1ZajR5U3pDa21kd0xmbFM5RVhSN3ppVTZnUlMxMElhVjBGWXNWVitl?=
 =?utf-8?B?WmZ6c0lkcnNMcFZWc3plM3UvcklPdnNFN2dwczRiczVOV1RvcG84aDFlTVE1?=
 =?utf-8?B?UkF3a1oraExHeElObXdvT3h3N2ZmNE82UkEzT0habVhDaDR0YUQ1d3BoRmFo?=
 =?utf-8?B?TkdwOFVoUXBaVzRONmxnemVTREJXKzZWZjRXdDBzOVI2THFNeDFjMC9XbWFw?=
 =?utf-8?B?UjFQUjVUSmpEMitmWE5YeUdjZUtFV3NySytKSGFiUHBnT0Q1WVpsSFcyZDY5?=
 =?utf-8?B?S3ozdVlNb2xIY2F4d0thbFRhbk54ZHpCQm5kTWJKaWJGOVZscjEyc1ZHSzg1?=
 =?utf-8?B?OGQxWnBHNE9pdWRyZWRYVHlRZ2loWEtqYmpZcVR5UW9XOFB0WnNKR2Q1TjE3?=
 =?utf-8?B?N0dwUEZzdWZFVDlCUXB6MGs3aUx1aWZla08zLzgwS1JhWHdqRHl6V0k4YVlI?=
 =?utf-8?B?dnV6aHg5eFBjdFNPQi9hckFTUzJOakVpeW5vdklkRjJVYzM0Nk1jcmJhWXNU?=
 =?utf-8?B?amw0NVJ5MHB6amlkYkl5UDZjNUdFbDJ2SVZUYjVxbzVIeVNweFNZYmJweVYy?=
 =?utf-8?B?WHMzSjBKNVRjZFpsNUsyTmJieWlFdlBSZlRCem1YeHVpK1dnN2l5UXh5bjFB?=
 =?utf-8?B?VWhYSmNFNUdTeXJRYWFEbG1vd2hlQXlFMFBnRmVCeTdCNXNlUW9wa2sybUJZ?=
 =?utf-8?B?c1dvRVpQUCtYRXFKdUx2bVVwRmNsZ0RHd0g4a2pKYkhVSForVXBiR2FOayt6?=
 =?utf-8?B?d3JmazNYeTI0OHNZeG15ZFFCRDFpYUcycUNmWnZBcnI2RXIrS0paMzBpNC9t?=
 =?utf-8?B?UkZ6d0lycU5IV00xR2xQQU9TakR1a2orekhRYWhaZlFFR1A2b01JTnBjVnU4?=
 =?utf-8?B?bTd3ekQyL2p3NmVnS2l0Qy80U3ZjVnF4OTNBK0V0NVZKYTg2aXN1TE1TYmJr?=
 =?utf-8?B?R2NSZ25QaU1RWGNYWDMzczJXQzRuWnVMNURYWXpIZGZ4ZGdHcWFDeEI3SVFh?=
 =?utf-8?B?M2h0K3lPdGJuK3RjM2dsZktuYTA3TXM2Ykg5WE9iS3B2TGQ2dGk3MnV4SUtj?=
 =?utf-8?B?K0t5ZGFESXBjN01oQ0tPMFAyOEpYMEZyaTlSYjMwMVpJcUlvMlY2QTN2ZXF2?=
 =?utf-8?B?ajBFSW1uRWdPM0hjMENPdUVRWEpYbTFXR3BiSkxscy9ibDZ0M0wwa2xOakZ4?=
 =?utf-8?B?L2h5RFhZb3ZaWFJrZWFrTVE2a0dLZ0szN1NjeDdXbEVEdmtIeWw4cmNuMVlQ?=
 =?utf-8?B?ckk0QUhPWTNVTjZURS9HNWVNUGpSTzhTNmNIRkR1cVlkRXVZenlJZUxEZkRF?=
 =?utf-8?B?MkNZUWtsN3FnWjNJWUdqZUk2MHlWZmJpWmhhWkJVa0U5VGdPR0xtOS9xU3Zx?=
 =?utf-8?B?b1VyTnlBNk5aYTF4bEVjS2xRODdjd0Nyck5CNGtweVRJbGE5WXBLblJTYVN2?=
 =?utf-8?B?V0R4NjdhQW1qS1JvOGJHNThzbjhZdnU4Y25sSU01NURxUHhRNzRXZz09?=
X-Exchange-RoutingPolicyChecked: DfdgwCRfzbseIa1LgiNGwhqykiveZ3/jYfHG4AgPXB1FgkH6nvUIllNdtwv/TAAS4rrJJqTCfZrWCLM6Tf5DCmlewqkRC4za3kgNGcwYExkSEUQ6mnQLjZteMfPeY4xgO647qC+TrDSF7rn1tFZUHYQCXfnEm3qBOM9MHaHPVKqgwz8nL9LiMNDQL6c/hH/lB6mz+4zewWWbxKC8RRA1P5z/MOuNV+NHOBonaMsc0z1+b0JJPru0IRxXshcSxWM7+0aaRyQC5FfiQt1Z8+I1+xOSierajSuT/h6anEFdzzX7bMCQcdeWakfG0go2eft8rCgPJKt1bPSPlyuude0MRQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: a9ffa578-b133-4dcd-40cb-08de962b0881
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8252.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 11:27:50.7703 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: exYtOmoKS1/5f40PrshYCgh9fVvNMNKcm6SyfHBJ6gR0iaBQsepMcpnuXJo6qcWGYj06gRaxfADHAw3lWPfcoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6123
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

Hi Ravi,

On 16-03-2026 10:59 am, Ravi Kishore Koppuravuri wrote:
> Introduce fault injection capability for
> xe_gt_throttle_get_limit_reasons() to enable robust testing of throttle
> reason reporting under failure scenarios. This patch incorporates error
> injection hooks that allow checking the behavior of the frequency
> throttling. It ensures that the error handling is properly implemented
> and handled.
>
> Required kernel configuration:
> CONFIG_KUNIT=m
> CONFIG_KUNIT_DEBUGFS=y
> CONFIG_FAIL_FUNCTION=y
> CONFIG_FAULT_INJECTION=y
> CONFIG_FAULT_INJECTION_DEBUG_FS=y
> CONFIG_FUNCTION_ERROR_INJECTION=y
>
> Usage example:
> Setup fault injection for throttle function
>
> FAILTYPE=fail_function
> FAILFUNC=xe_gt_throttle_inject_errno
>
> echo > /sys/kernel/debug/$FAILTYPE/inject
> echo $FAILFUNC > /sys/kernel/debug/$FAILTYPE/inject
> printf %#x -1 > /sys/kernel/debug/$FAILTYPE/$FAILFUNC/retval
>
> echo N > /sys/kernel/debug/$FAILTYPE/task-filter
> echo 10 > /sys/kernel/debug/$FAILTYPE/probability
> echo 0 > /sys/kernel/debug/$FAILTYPE/interval
> echo -1 > /sys/kernel/debug/$FAILTYPE/times
> echo 0 > /sys/kernel/debug/$FAILTYPE/space
> echo 1 > /sys/kernel/debug/$FAILTYPE/verbose
>
> Sample result of verifying throttle reasons on Battlemage platform
> ```
> root@DUT2107BMGFRD:/home/gta# cat /sys/devices/pci0000:00/0000:00:01.0/0000:01:00.0/0000:02:01.0/0000:03:00.0/tile0/gt0/freq0/throttle/reasons
> thermal
> ```
> This enables comprehensive testing of error paths in fetching the
> frequency throttle reason.

Let’s incorporate these details into the cover letter.

> Cc: Tauro Riana <riana.tauro@intel.com>
> Cc: Gupta Anshuman <anshuman.gupta@intel.com>
> Cc: Sk Anirban <sk.anirban@intel.com>
> Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt_throttle.c | 37 ++++++++++++++++++++++++++++-
>   1 file changed, 36 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt_throttle.c b/drivers/gpu/drm/xe/xe_gt_throttle.c
> index 1e7e3a31aa69..07b3ca5eaa9a 100644
> --- a/drivers/gpu/drm/xe/xe_gt_throttle.c
> +++ b/drivers/gpu/drm/xe/xe_gt_throttle.c
> @@ -5,6 +5,9 @@
>   
>   #include <drm/drm_managed.h>
>   
> +#include <linux/error-injection.h>
> +#include <linux/limits.h>
> +
>   #include <regs/xe_gt_regs.h>
>   #include "xe_device_types.h"
>   #include "xe_gt.h"
> @@ -81,11 +84,36 @@ static struct throttle_attribute *kobj_attribute_to_throttle(struct kobj_attribu
>   	return container_of(attr, struct throttle_attribute, attr);
>   }
>   
> +static noinline int xe_gt_throttle_inject_errno(void)
> +{
> +	return INT_MAX;
> +}
> +ALLOW_ERROR_INJECTION(xe_gt_throttle_inject_errno, ERRNO);
> +
> +static u32 xe_gt_throttle_injected_limit_reasons(int err, u32 mask)
> +{
> +	if (err == INT_MAX)
> +		return 0;
> +
> +	if (err >= 0)
> +		return 0;

Imo better to add support for bit 0 as well & also combine these statements.


Thanks,

Anirban

> +
> +	err = -err;
> +
> +	if (err > 31)
> +		return 0;
> +
> +	return BIT(err) & mask;
> +}
> +
>   u32 xe_gt_throttle_get_limit_reasons(struct xe_gt *gt)
>   {
>   	struct xe_device *xe = gt_to_xe(gt);
>   	struct xe_reg reg;
> +	int err;
> +	u32 injected;
>   	u32 mask;
> +	u32 reasons_val;
>   
>   	if (xe_gt_is_media_type(gt))
>   		reg = MTL_MEDIA_PERF_LIMIT_REASONS;
> @@ -98,7 +126,14 @@ u32 xe_gt_throttle_get_limit_reasons(struct xe_gt *gt)
>   		mask = GT0_PERF_LIMIT_REASONS_MASK;
>   
>   	guard(xe_pm_runtime)(xe);
> -	return xe_mmio_read32(&gt->mmio, reg) & mask;
> +	reasons_val = xe_mmio_read32(&gt->mmio, reg) & mask;
> +
> +	err = xe_gt_throttle_inject_errno();
> +	injected = xe_gt_throttle_injected_limit_reasons(err, mask);
> +	if (injected)
> +		return injected;
> +
> +	return reasons_val;
>   }
>   
>   static bool is_throttled_by(struct xe_gt *gt, u32 mask)
