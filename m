Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25CABCCFA13
	for <intel-xe@archiver.kernel.org>; Mon, 10 Nov 2025 09:46:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D94C910E36E;
	Mon, 10 Nov 2025 09:46:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X3zj+W4A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29E4310E36E
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Nov 2025 09:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762768002; x=1794304002;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yigm95NYYK0odq7Rkul+HxVRvClb3ZwwOjc0ojEpfIU=;
 b=X3zj+W4AE6s3vIKqbKsOkCxd6wxoKimbfjiSgZm2TZFTY5HXwZlis+wX
 tBrxjjIQ0YxqYykcAjC9NML2adjZK8vBirqTQmOIHu4Fp7fjxvHAbk8HJ
 XF2eDa/4Oc3btZ4ChbSuvThUvB2rNLoe6r4HYU9XjMKEYBjf4cdHLO3VF
 3Vq6YymI08oQZJUI5z823hyNDMBNc3mjvuvglYxcDU88CbWs+oX7CzFT9
 NiNV7kLEiQHSGdgd3jL6SFLc+I941V6jnHBl2/atiLJQjE9jw3zVF4zZy
 1FR6GTrhPH4ppaelFUyvYwK4eP5TxZ6RO4UoPOmxYRwXY1zOZnK+Rm3Sd Q==;
X-CSE-ConnectionGUID: qlawkjRzSRmaGztH2NkUvg==
X-CSE-MsgGUID: yA5hK5rKSxOBedROG3OILA==
X-IronPort-AV: E=McAfee;i="6800,10657,11608"; a="75108748"
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; d="scan'208";a="75108748"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 01:46:42 -0800
X-CSE-ConnectionGUID: 26hMe2P1RcWptLu1Id5hVg==
X-CSE-MsgGUID: ysGm1qEUTWmeeIzbUCw8Mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; d="scan'208";a="188794440"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 01:46:42 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 01:46:41 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 10 Nov 2025 01:46:41 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.25) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 01:46:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D5nkM48Q98IT1oNcSLylz75/x5BAZnHRT6YlP15B+fxZEy/2KsTHodS2J1mksGRTRAD7/GUAB6an6ecdI4Lcfz7z+cqMsQoWY9+UCrTrmKzL4tBDZUl5Cj4X4HIvvsjXq5ZaqLo0PqnuzMsRK9oavhUboyR1gPQ8Dob4FZMXmpUkCzMsxxhJaYg2WXWKB4vcVGd06UP2ttDuCwloKO+nYkFP68KQiAuRAAfh5LGOMTikY/jep4ZUtNDdxRkDdMJJMH2TqMtWrlUVBmAs3bfk4Oek9TCDbizeQQtLNt+QRNCcReyYy34shgq+QvoNLpWflEoibpSoUZLBp7NnHKKo/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vfKh9RnHuqPjryDZU/53xwRBssAytP2rFAM5MPPR3M8=;
 b=Z3zFN+zZYl/arpfDMXXHqHgbKRP/B9/K+MZLbTu9cvWKRCtr1PB/FHEQgLSPJCURLgsvWe8Y7edXgv9bPjSDpAXDsSqzwUaPfMmthBMfe/Lf2dwXEyss5EE1aouRJTSX3EhWQPgf4Y9wQDOmLyeDwCTwvnyN4GWrC/+lWXE/vHg20wk25wUSzmVDdxdecspteSXctxAThK3Z9AJpi2cMAyplK4rxr76PPBazZKR/zvV0/S41YHSLtOzdEcVNYv0b/FxB2WtfA37Pb+SyjCW7GnNN5eXVQD609LpTM3CUdp1ipcikRNeWjH/ccL4j9PpkM8sYGwg9CUnNKMpvKzDOoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB8252.namprd11.prod.outlook.com (2603:10b6:510:1aa::14)
 by SA2PR11MB5162.namprd11.prod.outlook.com (2603:10b6:806:114::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Mon, 10 Nov
 2025 09:46:34 +0000
Received: from PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2]) by PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2%5]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 09:46:33 +0000
Message-ID: <4109ed73-1c14-4903-973b-b05cd6c2fa54@intel.com>
Date: Mon, 10 Nov 2025 15:16:26 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/2] drm/xe/guc: Eliminate RPe caching for SLPC
 parameter handling
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <riana.tauro@intel.com>,
 <karthik.poosa@intel.com>, <raag.jadav@intel.com>, <soham.purkait@intel.com>, 
 <mallesh.koujalagi@intel.com>, <vinay.belgaumkar@intel.com>
References: <20251104195735.1606126-4-sk.anirban@intel.com>
 <20251104195735.1606126-5-sk.anirban@intel.com> <aQ63pHic8tUHW13w@intel.com>
Content-Language: en-US
From: "Anirban, Sk" <sk.anirban@intel.com>
In-Reply-To: <aQ63pHic8tUHW13w@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0003.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:174::13) To PH7PR11MB8252.namprd11.prod.outlook.com
 (2603:10b6:510:1aa::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB8252:EE_|SA2PR11MB5162:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e472f3b-ad5a-4c2f-99ef-08de203e086d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eWlSeFI2T3lVcWZpeWNWdWM1U09DZXpSSEkvWWVqbXdScGNXdElnZ2JYMnNr?=
 =?utf-8?B?QndOVGpmbTNGaEo0ZkpTRUVMWCs0djNQWncyeHl5d044SmZQMVF6dDIva205?=
 =?utf-8?B?VUY1ZHdNS2VJOUM5eGU0SHVkU1pnZFRzYXV0VFcyK1BrZUV6Y3hlSjg5elRN?=
 =?utf-8?B?UTA1Tm5PdjB6Y21IWE5seEVtbXFBSUQ5WFVWeWlHTGZBbFNFTHl6NnRwdWJ4?=
 =?utf-8?B?MjBPenR0bnNGT0ljQ0hLQitYcTN3bHVFL0VVbytHdExMSnlVK1dWUUZLek1q?=
 =?utf-8?B?QnVGZDkvTURqUU1Zd1hhdW15ZU1nOFZwM3h5MDhpWVJEdmpoS2lmTkJaUkt2?=
 =?utf-8?B?UmQzSzdVQTZDMDByNS9NWmtvRDhCVUdxQmxjSlV0dk9zNGxRVU1DM3MrRnZu?=
 =?utf-8?B?aDZmdlBFMDA4Y1NBdklTbnRNLzJTSE1xSEtHSURYWG9xVlRiRWp6UTRjeWxS?=
 =?utf-8?B?YllSSGN0bTFKUHRZL09BL2NyRC9mMThIbVpHZHlKMlU5TnJ1aVgzbVk5endr?=
 =?utf-8?B?TE1nMmhrZVFsN1J4MStlWmdZL0J4SmRTU1BBREhXcXRMZVdvYXQzd25RWmhw?=
 =?utf-8?B?Z0E4L2krMDFkUDZDemRlZGdORkhWQytXeU1Qa3MrNlZZZ1d5dHAyc2dZa29u?=
 =?utf-8?B?ZWdmZnhiQ2hzcHdrVDlOWlUwL2xOb3VpK082WDFZU0pDU2E1MXY0M0lXUUdn?=
 =?utf-8?B?dWpIOEo5cnJCbi9tR1VqemtrdW5QRUZtZU1hQWlkWERTNDBGaEZhWDZkeUI5?=
 =?utf-8?B?Vm9taFVkTElkRGxRMTlybWNseGlNU0w3NHRieW9xRkc5a0thTko5U1dVNS9T?=
 =?utf-8?B?VjY2c0RUNGxPQVIyUDNUWVRXZ0JjMVZIRGJsNVF6THcxSnNQU1h4cHI4ZEVE?=
 =?utf-8?B?akh2SVVEMGp6aytGVDI0c1gyemYxbHV3SmY3YUVtbUN0R1p6eVVHaGp4Ykdi?=
 =?utf-8?B?MnpMSjZtS1ZjeUYwWFlhaENYajY4aDhSVlFrYzhMd2d4bjNMN2VFVFhjeFps?=
 =?utf-8?B?cWQ1Z2JwblM3QTlqNW1sSm9NZFJvOHhnaVdjVEI0Ukt3WFppdFFXWkgrMDVB?=
 =?utf-8?B?akFoNzU0Tk5rdTJldzB3d2tObWxvUktkWXVGTWhjWStVMXNRMjhhTmVTeTdZ?=
 =?utf-8?B?aW1ST21PVkFUeUp6L2tWMjljSndrOFFCVXRBYXdXRzFkVGlQMjJZYTFIMGxt?=
 =?utf-8?B?VitFOGtGUjhBMW5vUlh0WUlsckxNVTJNVnhVTFlWS2FVL3Z4My9CTkVSWllQ?=
 =?utf-8?B?bk8vRHFFZGhhcmZBVVZucTlTMGlabUxjNU9BQU1Zd3hnaENQcWk4bmhUTXlH?=
 =?utf-8?B?d2RyQ1ZIWEo0bFZQanhQY3VqenNMenEzR2F2ZUIvcVBvTFlyaXYyUm9yTkhL?=
 =?utf-8?B?NmhhdW5PbHYvOVNHME5DdGU0NVRXbHNiZEF0V3UxemM1ZzBHZWdnUXB5cFNy?=
 =?utf-8?B?ZlQ4bFNmcjJUd2M1Z3RvVFhkMjJwMU1meEVUQ1loaWdHWGlZYUZNUzk5OVU0?=
 =?utf-8?B?QWk5dkF5NENJaVl0WnMyelhieThnRUtZeEhEZUhGczY3NWVPR1hhcSt3NEd4?=
 =?utf-8?B?YS8wMm9hQUJSTXJMS2pDTmlEcmVGWEl4a1pXSUQ0VnFUTStqWWZvRHBVamxm?=
 =?utf-8?B?VlhzQjJwQkFkMWtHT2Z1RmhGUU5XbUVsWG1YK2l5L25rblFWbjRDK252YXJR?=
 =?utf-8?B?V1Q3eTduNk0rV0kzOWZjS0wwaGkwN0V4bnlqOUo2aytKeU1hWE9UQTUxRXFI?=
 =?utf-8?B?R3lKZEptTStJTVNPRlBFZzZDdzJOMVQxZXI5THphV2tiSWxHRlhrbEkrWWZL?=
 =?utf-8?B?UnVvc2VYclV1YWxiUEd0YTg1TkRiRWczZ1kzcHVZbnVDTVoxczRVaTNKd3J2?=
 =?utf-8?B?MTlHSHV3TG9qeHJJbENJU1UxcWxVTXZYdVJGKy94N2dHR3c9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB8252.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NmQzVWk5T2VkTkVKM2FPNHpHdTQya1d0TTJqR3Qzb0FuWmZwS1hjVEl6ZXo5?=
 =?utf-8?B?ZW5kZnloaTk5OTcvcHg0V1I3MkhnNXEwTFVIUlh6cXlGSW91QWVSU1oxVU96?=
 =?utf-8?B?c0JSNjdRRXh4bldZZ2s3NkYwNzFtTXFLN0d4SVZBcC9wY3BwWDRzYlArOWlh?=
 =?utf-8?B?MDZCV2dvWUtvZTlranRDZmNDYTdLMFMzMjJ1dHBjQXdaZENSekQ3S1V1a2N6?=
 =?utf-8?B?RFVJcERMa0FPWlNhUnpJbFNUQVZBMU1kVTRXaGs1bmdtc1RJenVmWUI2K3Uz?=
 =?utf-8?B?UTY1Vmtyckdsell1SlBjY01jVmFBK0pySEhsS1djTHlhMlhZbWNpYmVjOXFD?=
 =?utf-8?B?SVdvYllUWU9mT2lFVlY2TmdtRzdtUjh5eWdOS1NlenRncmQ4MEY2N2RDT0hP?=
 =?utf-8?B?NVRGaUlkQThhSm5Na3lTaGpnanlOWWRoQzBhZUM3eG9CQ3FyY01PTExkUHZu?=
 =?utf-8?B?a1hoUmJnR3grKzlVZVlxNmxaTExPWXFEL3JRNmxhWnV0VmJJdjNneUdoT0N4?=
 =?utf-8?B?SnJIczBFbWRiTzNzK1RUc1o0MXArSlB5bW8wa1FralFRTTd1dUVIb25KazJ0?=
 =?utf-8?B?L3RFRUxlaWxrVVd4VWRpand2QWRoZXZHTnhlZW1QK1JPMUFJOEZCcmhCOVFR?=
 =?utf-8?B?U3psTEpYbWlVa0xTU1U4elpkL3JlVTNVbEY4K0ttZEVBSUIzTUtiMlgzRnA1?=
 =?utf-8?B?SWRwVVB1Y1l2SmFXMEpYa0JMODJ4UlI0SExBU2ZkM0JNQVl6RVRxei9MNWk1?=
 =?utf-8?B?dUZab2F1TzEvVkRWM1NXcEdqZzZPWFRERjI1Qm5ad0JxdW9taUpyQlJFdFdL?=
 =?utf-8?B?K2QwdG9HQVRRK2NzRFFMbFFsYTdIT2tTY0VpVmQ0SlprVkdNZ1hHTWJ3Z2hm?=
 =?utf-8?B?TTBTOVVQMFgvQ3FYdktIaWtHV2JqTEh2YXlaamw5VEhoWmd4bUFxbjhZckRr?=
 =?utf-8?B?NThRS2x1VXE4T1Vla0w1M2ZvdUJrL0xTWElkYUJKZy9HSUFvTDlkcjdJQWRQ?=
 =?utf-8?B?MDQ3SVRwMVJleENoRmsrb2dNS21wV1BtVWl6YUhyeEgzMnVLWmYzUzBzLytl?=
 =?utf-8?B?WlFGTGVxMFdIbUpTSW5VSmFubnoxR1NKck01RlFlQklPZHNidDJnWS9PWTZP?=
 =?utf-8?B?YWNNUEd4WG9iVmRtL1ZreDg5WFBOd3Z4aVRhY2J6SmY2VEw5RlROb3QxOWlv?=
 =?utf-8?B?K3A0ZXlZWVNoSDkzb1JLWFd2eTl1STEzcUs4L1Q3WkZKVCt6ZVNidzlVaGFm?=
 =?utf-8?B?R2ppTjBWZGtyWlRpNjQyK1lubDg2Ym1NcGJ0Wm40emJZYVBNZit5b3U3Q0ZB?=
 =?utf-8?B?MkN0eFc2U2FzSTNNUndEMFc5MUlROHlxMkJ2RjZSRURGV3dLVitsbEdMUWs5?=
 =?utf-8?B?dVFIQ0k3NENHSmN0ZnNYbkkxQVZPOHlRSGExSHM1V015Tm1reXZReVpodXBC?=
 =?utf-8?B?Rkwxdk1MMzduSHFKUXY4THlMVUJUL3llMFNUM2cyTzAzcmpiRzlCcGtyV1l0?=
 =?utf-8?B?U0NndCtpREVxWm5vWk5jM1lnb3k0S2hIdlp0M0x2Vk0vSGtBYjVIdGZmZ2tw?=
 =?utf-8?B?QlU0T1A2MTRqRXBsWTYvOEQ2bXZ1ZGpYYmNSK1N4Zm16cTAwMUowaURXTlFV?=
 =?utf-8?B?Y1RWNUZ1RjlWamt1bFJHbmFDSmFQd0prRnhIaGZVUHNQVkFrandqdGFtTGhm?=
 =?utf-8?B?UjZOcnZLU1JvZms3dHkyMmFtV0RmVndyUW1ETHlsTitJV0ZnQngvRmYzcnd6?=
 =?utf-8?B?UnNweHRmNHVYeVlXMUlxeTNmUnc4bEd6MXdNTHhhcHFhQzI4U29TUEpPSDhR?=
 =?utf-8?B?WkRPYmlxZkVma0tvb1ZObi9sVkt2dnVKditsNTdLS1RJcTE3R1VsRlNlUVBT?=
 =?utf-8?B?M3FSUDhCWFVMZnQ1SHpLdGJlS09BRStENTI0dmZCOU5LRmphQzRzWUlZb0c5?=
 =?utf-8?B?TnBqbXhRQ0tOQ1BMbXo1ZXFGUEUzUFlubDVGUEVOWTl3a0E2YnErTUR0VWNH?=
 =?utf-8?B?QTNYa1VaN3JZTzdra1Brd3FJaHh3aEdtd3piRlhneFVCYUtoR0RTVTZVVW53?=
 =?utf-8?B?d1ZVMFlYcFUydW04Q3ZUeHBZOUVhOFdqdllKcVNMQ2FMYkVHaTNlNkcweU5G?=
 =?utf-8?Q?6Brpq+zoqYxnuqlm/we1Oc1f+?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e472f3b-ad5a-4c2f-99ef-08de203e086d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8252.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 09:46:33.8598 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sbf/u+4r/bFP71TgN31Ow83vMWxyRwnFAEF2H1KF75AALq4Nlm7/tB6euI+yQL06ThsN6VOvGZoLrM1+lX/Z4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5162
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

Hi,

On 08-11-2025 08:53, Rodrigo Vivi wrote:
> On Wed, Nov 05, 2025 at 01:27:37AM +0530, Sk Anirban wrote:
>> RPe is runtime-determined by PCODE and caching it caused stale values,
>> leading to incorrect GuC SLPC parameter settings.
>> Drop the cached rpe_freq field and query fresh values from hardware
>> on each use to ensure GuC SLPC parameters reflect current RPe.
>>
>> v2: Remove cached RPe frequency field (Rodrigo)
>> v3: Remove extra variable (Vinay)
>>      Modify function name (Vinay)
>> v4: Maintain a separate function for PVC (Rodrigo)
>> v5: Avoid RPn update while fetching RPe frequency (Rodrigo)
> dang, now I regret on having asked that... I'm not trusting on the
> CI results any longer.
>
> Did you run this full xe_gt_freq tests in your machine?
> I forgot the machine that made us to introduce this rpn hack...
I can revert those changes, but since RPn is fused and won’t change—as 
Vinay also confirmed—I considered removing it entirely.
I ran over 500 iterations on LNL, and all passed successfully for the 
specific test.

Thanks,
Anirban
>
>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5166
>> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc_pc.c       | 68 ++++++++++++++--------------
>>   drivers/gpu/drm/xe/xe_guc_pc_types.h |  2 -
>>   2 files changed, 35 insertions(+), 35 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
>> index ff22235857f8..efa9318c4587 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>> @@ -331,7 +331,7 @@ static int pc_set_min_freq(struct xe_guc_pc *pc, u32 freq)
>>   	 * Our goal is to have the admin choices respected.
>>   	 */
>>   	pc_action_set_param(pc, SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY,
>> -			    freq < pc->rpe_freq);
>> +			    freq < xe_guc_pc_get_rpe_freq(pc));
>>   
>>   	return pc_action_set_param(pc,
>>   				   SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
>> @@ -376,7 +376,7 @@ static void mtl_update_rpa_value(struct xe_guc_pc *pc)
>>   	pc->rpa_freq = decode_freq(REG_FIELD_GET(MTL_RPA_MASK, reg));
>>   }
>>   
>> -static void mtl_update_rpe_value(struct xe_guc_pc *pc)
>> +static u32 mtl_get_rpe_freq(struct xe_guc_pc *pc)
>>   {
>>   	struct xe_gt *gt = pc_to_gt(pc);
>>   	u32 reg;
>> @@ -386,7 +386,7 @@ static void mtl_update_rpe_value(struct xe_guc_pc *pc)
>>   	else
>>   		reg = xe_mmio_read32(&gt->mmio, MTL_GT_RPE_FREQUENCY);
>>   
>> -	pc->rpe_freq = decode_freq(REG_FIELD_GET(MTL_RPE_MASK, reg));
>> +	return decode_freq(REG_FIELD_GET(MTL_RPE_MASK, reg));
>>   }
>>   
>>   static void tgl_update_rpa_value(struct xe_guc_pc *pc)
>> @@ -409,24 +409,22 @@ static void tgl_update_rpa_value(struct xe_guc_pc *pc)
>>   	}
>>   }
>>   
>> -static void tgl_update_rpe_value(struct xe_guc_pc *pc)
>> +static u32 pvc_get_rpe_freq(struct xe_guc_pc *pc)
>>   {
>>   	struct xe_gt *gt = pc_to_gt(pc);
>> -	struct xe_device *xe = gt_to_xe(gt);
>>   	u32 reg;
>>   
>> -	/*
>> -	 * For PVC we still need to use fused RP1 as the approximation for RPe
>> -	 * For other platforms than PVC we get the resolved RPe directly from
>> -	 * PCODE at a different register
>> -	 */
>> -	if (xe->info.platform == XE_PVC) {
>> -		reg = xe_mmio_read32(&gt->mmio, PVC_RP_STATE_CAP);
>> -		pc->rpe_freq = REG_FIELD_GET(RP1_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
>> -	} else {
>> -		reg = xe_mmio_read32(&gt->mmio, FREQ_INFO_REC);
>> -		pc->rpe_freq = REG_FIELD_GET(RPE_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
>> -	}
>> +	reg = xe_mmio_read32(&gt->mmio, PVC_RP_STATE_CAP);
>> +	return REG_FIELD_GET(RP1_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
>> +}
>> +
>> +static u32 tgl_get_rpe_freq(struct xe_guc_pc *pc)
>> +{
>> +	struct xe_gt *gt = pc_to_gt(pc);
>> +	u32 reg;
>> +
>> +	reg = xe_mmio_read32(&gt->mmio, FREQ_INFO_REC);
>> +	return REG_FIELD_GET(RPE_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
>>   }
>>   
>>   static void pc_update_rp_values(struct xe_guc_pc *pc)
>> @@ -434,20 +432,10 @@ static void pc_update_rp_values(struct xe_guc_pc *pc)
>>   	struct xe_gt *gt = pc_to_gt(pc);
>>   	struct xe_device *xe = gt_to_xe(gt);
>>   
>> -	if (GRAPHICS_VERx100(xe) >= 1270) {
>> +	if (GRAPHICS_VERx100(xe) >= 1270)
>>   		mtl_update_rpa_value(pc);
>> -		mtl_update_rpe_value(pc);
>> -	} else {
>> +	else
>>   		tgl_update_rpa_value(pc);
>> -		tgl_update_rpe_value(pc);
>> -	}
>> -
>> -	/*
>> -	 * RPe is decided at runtime by PCODE. In the rare case where that's
>> -	 * smaller than the fused min, we will trust the PCODE and use that
>> -	 * as our minimum one.
>> -	 */
>> -	pc->rpn_freq = min(pc->rpn_freq, pc->rpe_freq);
>>   }
>>   
>>   /**
>> @@ -561,9 +549,23 @@ u32 xe_guc_pc_get_rpa_freq(struct xe_guc_pc *pc)
>>    */
>>   u32 xe_guc_pc_get_rpe_freq(struct xe_guc_pc *pc)
>>   {
>> -	pc_update_rp_values(pc);
>> +	struct xe_gt *gt = pc_to_gt(pc);
>> +	struct xe_device *xe = gt_to_xe(gt);
>> +	u32 freq;
>>   
>> -	return pc->rpe_freq;
>> +	/*
>> +	 * For PVC we still need to use fused RP1 as the approximation for RPe
>> +	 * For other platforms than PVC we get the resolved RPe directly from
>> +	 * PCODE at a different register
>> +	 */
>> +	if (GRAPHICS_VERx100(xe) == 1260)
>> +		freq = pvc_get_rpe_freq(pc);
>> +	else if (GRAPHICS_VERx100(xe) >= 1270)
>> +		freq = mtl_get_rpe_freq(pc);
>> +	else
>> +		freq = tgl_get_rpe_freq(pc);
>> +
>> +	return freq;
>>   }
>>   
>>   /**
>> @@ -1022,7 +1024,7 @@ static int pc_set_mert_freq_cap(struct xe_guc_pc *pc)
>>   	/*
>>   	 * Ensure min and max are bound by MERT_FREQ_CAP until driver loads.
>>   	 */
>> -	ret = pc_set_min_freq(pc, min(pc->rpe_freq, pc_max_freq_cap(pc)));
>> +	ret = pc_set_min_freq(pc, min(xe_guc_pc_get_rpe_freq(pc), pc_max_freq_cap(pc)));
>>   	if (!ret)
>>   		ret = pc_set_max_freq(pc, min(pc->rp0_freq, pc_max_freq_cap(pc)));
>>   
>> @@ -1340,7 +1342,7 @@ static void xe_guc_pc_fini_hw(void *arg)
>>   	XE_WARN_ON(xe_guc_pc_stop(pc));
>>   
>>   	/* Bind requested freq to mert_freq_cap before unload */
>> -	pc_set_cur_freq(pc, min(pc_max_freq_cap(pc), pc->rpe_freq));
>> +	pc_set_cur_freq(pc, min(pc_max_freq_cap(pc), xe_guc_pc_get_rpe_freq(pc)));
>>   
>>   	xe_force_wake_put(gt_to_fw(pc_to_gt(pc)), fw_ref);
>>   }
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc_types.h b/drivers/gpu/drm/xe/xe_guc_pc_types.h
>> index 5e4ea53fbee6..f27c05d81706 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc_types.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc_types.h
>> @@ -21,8 +21,6 @@ struct xe_guc_pc {
>>   	u32 rp0_freq;
>>   	/** @rpa_freq: HW RPa frequency - The Achievable one */
>>   	u32 rpa_freq;
>> -	/** @rpe_freq: HW RPe frequency - The Efficient one */
>> -	u32 rpe_freq;
>>   	/** @rpn_freq: HW RPN frequency - The Minimum one */
>>   	u32 rpn_freq;
>>   	/** @user_requested_min: Stash the minimum requested freq by user */
>> -- 
>> 2.43.0
>>

