Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0421FC43458
	for <intel-xe@archiver.kernel.org>; Wed,  8 Jul 2026 07:40:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8AC310F007;
	Wed,  8 Jul 2026 07:40:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d6m9+yj8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF98E10E581
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Jul 2026 07:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783496430; x=1815032430;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ppbwJfvslViyeQBc39SWSAjRYrhwB6S3/OBxH6o4q9w=;
 b=d6m9+yj8fk0Gto3OvpT0DX3SAcYj9lR2+fkZbzqubfG/2JOiPzsfR8fH
 VH6TXq1SCZNVaS5q3TqlIF1RsWUGwMkUNKeitlYmnT8FvKMEhWMqdCeBh
 JxJNVw+IGRFZTLOXbUoXo+YdvhSVkeSC1elMs5qriKq5lw9d2ZesoBlZB
 /asi3TkH1Jf+6oDewmzGGZn25QeR3NYvUScSmdSYO6hsziy3+rKAdoOKm
 kBD18JgDiFieudLOMfKa4FJp98da2zCRjMSK9vRhTkK4nKeQ77+rqQxPk
 SVeUHVKJ0oZXZQlvR5GiFPWl78W+9mmYXINkhvTs4PKe1OEWh5fP6VCzS w==;
X-CSE-ConnectionGUID: PsJDgFlFRfOVksfiKj+aBA==
X-CSE-MsgGUID: 6Gh5HIyGRJqgljHscU+WqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="84249553"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="84249553"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2026 00:40:29 -0700
X-CSE-ConnectionGUID: Qh2kQadwSHK++0dCPg/1zQ==
X-CSE-MsgGUID: a5AkspdESuK3c4jrCuO5qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="253131170"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2026 00:40:29 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 8 Jul 2026 00:40:29 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 8 Jul 2026 00:40:29 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.2) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 8 Jul 2026 00:40:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AHRstmDGNjEa+rWdo3EsAPOl7dmVSM6uKi+r781huwfTT6bPCqXs7zzjThZg1PRsZ0SB4GO/jypQEA09tLjGQHqLiVgNTP+W/ih8JUnqRi2V4/+kxfbsxts+bEId+yKGwiBmkXeyl6vy9pg7xw/61jhGUWolwSx9f9TidlPL1+fSbwsR+GSgyuPUppyZtD/BYBsdfdRIyBhUSYcgApA4Yt3BqD+fvCQWkmbkxMaogk5DqeRd1TX/SetjtaLcXRvDI41VRSfNqDd9n62e4y9EgeDNq74vEgRe59FKr0G7iuFLQv9BOd05lRfVXepW5rKo7/3Qtt7bEgFh2oRqRXxeQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OHrl6a6DbTJDusR2n7h2FzNs2IHzITVpHO5JvXmeAbw=;
 b=RG+7idrCf96WX1orosO4HHNqWVLBlA8ixngcDGMiZGmN7iYlyKeEHo6WuP+VTbLq5cXcRsuVkvz+Mn35Jr6orS9EbzxfRxk8ix3uQGa0z7JSRA6bWsKMVUJqXGiFsUvKTHagkXxROjaROBO9tNCHKOlj3keWku//UW4sP0QjplLzuDU1vuqEHkVapsPyzRvI/5exMrOgfhYtOc63owv8eUfdr9/Cuf5pewa1SR1ue6WiSRIUDKdwIXYc22/kafnbvrAOquG/2H8QRBtA3EyOdU+1GGZ9dKSirsacCqqYs1pOvXpoycHIrEpTySi3n8lwPom10C9OIk03odXv0RVuJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SA1PR11MB6965.namprd11.prod.outlook.com (2603:10b6:806:2bf::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Wed, 8 Jul
 2026 07:40:21 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0181.009; Wed, 8 Jul 2026
 07:40:21 +0000
Message-ID: <1642a35e-36f4-4930-b9f4-c4a64105fa06@intel.com>
Date: Wed, 8 Jul 2026 13:10:13 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/1] drm/xe/xe_ras: Add RAS GPU health indicator
To: Soham Purkait <soham.purkait@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <raag.jadav@intel.com>,
 <ravi.kishore.koppuravuri@intel.com>, <mallesh.koujalagi@intel.com>,
 <andi.shyti@intel.com>, <rodrigo.vivi@intel.com>
CC: <anoop.c.vijay@intel.com>
References: <20260708061221.4006706-3-soham.purkait@intel.com>
 <20260708061221.4006706-4-soham.purkait@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <20260708061221.4006706-4-soham.purkait@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0155.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ac::7) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SA1PR11MB6965:EE_
X-MS-Office365-Filtering-Correlation-Id: b71e9377-a50b-47ce-20cd-08dedcc42a3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|56012099006|3023799007|4143699003|6133799003|11063799006|22082099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info: whyZDt+Wan70T6DRO85/tzGnWY7WAi/70YZ7RwPjk8sgaTyn5bqoIMF22qeC1rzm58o97aLZ8R7gokiB/TnJOj7mA5Y0zBZ+c+YuXkK8IeMhXx0n0nOD+4eXtr/T1nRh41hBcMZzhlpKKBo24QTs+RTCcKcMMeE7TCjUE1Bc1r+Q/+GzvmpMSNg11Vd2ul1SgRzDygjlAom88uh6YSkgPf9kH3C6UyzCxpA1fJE7kELxEz2qKrXb4KFEXYRCaKcfsasbx5p9T1Klc1jLfsKeHUmkoh5epj2EQOWcIKje6InfQDbhPLpADnyD09QaPlUaYw5owmR7lOTvwPUd6bAbUU2gIlysGhZrehrn5U/0F1hrHL+dIuq9MOAIdAyQbwjwZhkoVij4KVlWUYlDBgvdyh3+mhD+HWfpKrbwmsSi4NSUgjZ5MUG4vkXuWdpTWLYLci0ONPGU1vDUvKjWXxpeBGdxzagiofIsD+GFkCfvvbxjPYJeX9PlIGw11NkI1KTIWO38kItabJybFSnvvlm9QuXz/mU4G+QAcErKJJ34njSUbfpO15dIuREPRH58HcGm0RNjLqQGtjWQnq0j/1M0r/GZLg4/V9Im9hxmTrRWEXABczdR9kvS+UXhL9uXWpKEUDTUuQbF4wofZx06RvNEEJYse5usJ9oHgUPxZQDdSwbGwCcacSuszuIs1kbE0y26YfkuBRzJaXFDtrSBxwn5xg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(56012099006)(3023799007)(4143699003)(6133799003)(11063799006)(22082099003)(18002099003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RnI0bUo0Z2JZM3ZBaWNJR1lPYnNadnF1V0lKWnpJUGJhanhFVEpXbmN0WVdL?=
 =?utf-8?B?N3ZNQ3N4dU05WllENUErVkt2UEZObUhnVTYrYVV2NG5wSk5HWlRDbjFwcUw3?=
 =?utf-8?B?NjFlZ282Tmhxclo3RWh6Qm9UaDB0MlpVZ1F2aXZyTTRJS1hJUjhnbmxVbElW?=
 =?utf-8?B?V01ianN0d2FoNUQ5aFpJYlZxOUZKOEwyUlZ0V0UzalZSbEw0ZlV1c0NrMUEw?=
 =?utf-8?B?RlZ1dGFlaHo2bkpiUHVTaHY0OUFNMU4rbzdzeW9qd3dPSm5qeHBWNkViWFJZ?=
 =?utf-8?B?c1drZWFMQzVocTNoc1FSeFg3U2d0YlczcTNNdG8rbkRmT0ZyWDcwejhwcnQ5?=
 =?utf-8?B?cGh5Q1VnMHJ5dHZiTTNXU3hrbkprbzdnY3Z1dTk2cS91NHpMZnVJNW1aQkZZ?=
 =?utf-8?B?OGpqTVNRRWo4MFMvSUNoS1BuSHJCWjR3TlAyTmJhWHRHZGhxZHNTd1hRaTRF?=
 =?utf-8?B?Q0VDK3RWRHBaSmtheTg1cTdXUGtodWNmRVRZNnVXbFQ5ZWFQZTJjR0F5M3d3?=
 =?utf-8?B?c1M2SWJUaFZDSm1wU1BRZ3R1Z0YvZmV4a1VHOWFPdjg3L2dJSFpWd2l2eXN0?=
 =?utf-8?B?REpIY3ArQ0VxQmVTdnlhaDF4QVV4RzhPMC9qL1BjNC9ja3E3TnBvd3FTV2or?=
 =?utf-8?B?aDFPMnVFd1pwS2xNcTFQdEJTQVBnaDltbDY3WkdJMngyTVlsVVI2c09xdHBD?=
 =?utf-8?B?WHhBTmxFOFB3aWFxaERRYUJSNG80UlBhcTJDVExac2Vxb1pzdmxJQ0xLdkxo?=
 =?utf-8?B?T2ZiMk5kMmdQS3dDUHJ1cyt0dHQ0SElYRis4NjdEU1N5b21PaTExdlJJallw?=
 =?utf-8?B?MFFiUm5FMTRvMEErcTZxNWdsRjlFZjd3TnJqSmhWWGtPalR6OTh1cERHa093?=
 =?utf-8?B?U0pDQ2xCcnZJNmN5WVV6M0RoREJmdDdIbnl1Z1ZXRnlQOGFZSWd4U0VlMW9w?=
 =?utf-8?B?RVFsRFBaLzVKa0x4OEt6OXRQUlhscncwTzM1S0JrMWFVUUdXV29sc1gwbDBw?=
 =?utf-8?B?bHNvejI3Y1hQZ0JtUlN2UG16M1k2M0R6SWI3K2J3MlIvYndDUmxBRjJnZHBL?=
 =?utf-8?B?RkdaY2xCanJYb0NBU1lHS0RyOWpmSm94TkZRVzVhTERjdUpJN05vUFRNN2Yz?=
 =?utf-8?B?d1BvdmV5UjdTSEtYWWhxY0ZpbGJYbnBwZE1vaGR3QU1vdHB4NEEySXhQcTBJ?=
 =?utf-8?B?TW90UUhoUHJrVFYzdnNhK2pqVnNnQndEZGQ2amRYSUpjb3pXRVdRbExnc2Ns?=
 =?utf-8?B?WEEwWDZyeEpvc1dWdFVOcFZQenJKV2lMNVVSMFpDRFFSU24wYXBMR05aOTd6?=
 =?utf-8?B?UGQ0SDkwMEd4NHo1U280Y2JqWUtET0J6NW1pdTZUZ0wxS3JVUjBFQzVnSmw2?=
 =?utf-8?B?RUloanhoS1AwUmdOcTZ2eHUrZ1U1aStJSDlFang4N3QvY3V2azFqZE1nTnBw?=
 =?utf-8?B?MHRSZjRBUUtyUlREUnQyYnZRWHhMRjYyQ0tpSnJHZ3c3d0YzRGNWTElQY0Z6?=
 =?utf-8?B?TUdjS1ZNTlcxUXhXNFM1RnhOOUZ1OUVMSlY3QXF5ekZDWTNXZUtVK0YxeGtT?=
 =?utf-8?B?SHhiWlkxb3IvWUJPd2NJWTZFb1JmS0w3c3JZWFNNZ25YOGt2djlsc0kzQW5N?=
 =?utf-8?B?dmJ3dUt0YUVWQ29YcHhJTmRjbUhsWmJjU1ZxTjZTZlhMSlRCeVBZLzdxQWx0?=
 =?utf-8?B?VGpXdDNvcFNpS1Y0L3l0Y1Zad3U5UHBDTWtxeGkxS1N6SVRRY25YWERoNEtQ?=
 =?utf-8?B?TFh6VjViaXBLbG1ybEVhZTZIZFBvNVE0NENHWnNIcHNZcEZITCtrd0pLVzFC?=
 =?utf-8?B?S283Y1VlM2E3ZS9lekFtVjNPSmdKd2V1eVBvbEEzY0Y4WllMdzZ5L1dqb25M?=
 =?utf-8?B?cFNLOXZ2TjU3RUZucU5sZGlqbFcrN1oxckc1bUJ1Ly9JcmhLTTByN0JZeDFl?=
 =?utf-8?B?Yk1kTVdnNE5kNEcraG1WckJzdkMySG1zOHEwUit6MlREbVp3YUVBeXd2OHp6?=
 =?utf-8?B?YkRWN2dOL1hIMHpQMXVPcSt0dVFsWllmNVpxSndlLzVrYk1oVGJrUUtWWlpU?=
 =?utf-8?B?LzlPcTBaQW01TEd4eWx0b3FSbElFZDRwVFZuTExHVGJveVlZbWk3QlNJZDlI?=
 =?utf-8?B?NEdtZXhDdE94UmJVNjdyaEZ3QVdGM0lLTE5UOVNYZDhvQ1huYnZRUmhaNy9D?=
 =?utf-8?B?UHZqQkJTZ0ladWRqOXBXYjJIUmtuc00rcW5hUkZVbS9MZXlTMTNySmYzWjVy?=
 =?utf-8?B?QUREbG5udkRZZmhBSDlGTC9lanpIZ3luK1piTXk4SEp0L3pnemdieHhjMXhN?=
 =?utf-8?B?NnB2T0VLa0pyVWxWbnhQazlHeDRLMllZTCtTWXc5b21yOE5EYUpvdz09?=
X-Exchange-RoutingPolicyChecked: GeWWaz0YUVVjO0UVJ4WAXxYpDyKVdwE9eXdohn+WlyoUhCAGpubhwF5sYBpn8gpX5CAWIFuYbLKYsptUE1hkfHyiWoR2z4t5TsrlE61PBoiJBfJM8tPANvN495bZleW1BNtkYRtOSVElc9905Gk1X/q0Ne5Em7K9USAyKnsNgbce2kVfm3/ekmMjzn+Rqdfac9pq5Mhw72/NtzWOlRQOH88HRY0wea/rJD52iZkPldnmORA9o4wI6dFo5oOliEIV0YFYZRYISby3ti7YnrxiKIzWeSxrxFTTvSI8Fsb0gQ18M8ObgmDFhOnXImyO5e4G4/nGNc9LGFo1dpbo/KlAZQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: b71e9377-a50b-47ce-20cd-08dedcc42a3c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 07:40:21.5505 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y9pcmHyvqBiuqGEYhHNEqlX0bNWAa1np+WFPEO04Rv5tZZAkBdeMxiwxTxk23GgVuOx7VMeBOIWI8FRRm6RGmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6965
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


On 08-07-2026 11:42, Soham Purkait wrote:
> Add a sysfs interface that reports the current GPU health state and
> lets admin users and management tools update it but is readable by all
> users. Requests are routed through the sysctrl mailbox. The interface
> is present only on platforms that support the GPU health indicator.
>
> The interface is a single read/write file at the device level:
>
>    $ cat /sys/.../device/gpu_health
>    ok
>
>    $ echo critical > /sys/.../device/gpu_health
>
>    $ cat /sys/.../device/gpu_health
>    critical
>
> v1:
>   - Add enum for health status. (Andi, Rodrigo)
>   - Return error number instead of error message in _show/_store. (Andi)
>   - Move GPU health sysfs init error logging to xe_ras_init. (Andi)
>   - Return only the current health state for sysfs read. (Andi, Rodrigo)
>   - Add documentation for sysfs interface. (Andi, Rodrigo)
>
> v2:
>   - Make logs and structures consistent with their counterparts. (Riana)
>   - Drop unnecessary variables. (Andi, Riana)
>   - Add correct KernelVersion. (Raag)
>
> v3:
>   - Add missing blank line before #endif. (Badal)
>
> v4:
>   - Add consistent "gpu" nomenclature to the gpu health indicator
>     DOC blocks. (Riana)
>   - Add Kdoc for gpu health indicator. (Anshuman)
>
> v5:
>   - Rename struct fields to response.health, request.health. (Riana, Raag)
>   - Use devm_device_add_group instead of custom sysfs init/fini. (Raag)
>   - Rename health enum to shorter XE_RAS_HEALTH_*, drop redundant
>     invalid-input log, and minor log/format cleanups. (Raag)
>
> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
> Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
> Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>   .../ABI/testing/sysfs-driver-intel-xe-ras     |  30 ++++
>   Documentation/gpu/xe/xe_device.rst            |   9 ++
>   drivers/gpu/drm/xe/xe_ras.c                   | 139 ++++++++++++++++++
>   drivers/gpu/drm/xe/xe_ras_types.h             |  57 +++++++
>   drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |   4 +
>   5 files changed, 239 insertions(+)
>   create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-xe-ras
>
> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-ras b/Documentation/ABI/testing/sysfs-driver-intel-xe-ras
> new file mode 100644
> index 000000000000..9612b97b0f88
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-ras
> @@ -0,0 +1,30 @@
> +What:		/sys/bus/pci/drivers/xe/.../gpu_health
> +Date:		April 2026
> +KernelVersion:	7.2
> +Contact:	intel-xe@lists.freedesktop.org
> +Description:
> +		This file exposes the current gpu health state and allows the gpu
> +		health state to be updated.
> +
> +		This sysfs file is present only on Intel Xe platforms that support
> +		the gpu health indicator interface for RAS. Reading the current
> +		health state is available to all users, while updating the health
> +		state is restricted to administrative users only.
> +
> +		Read returns a single line containing one of the valid values for
> +		the current gpu health state. Writing one of the valid values
> +		updates the current gpu health state.
> +
> +		The valid values for the gpu health state are:
> +
> +			ok
> +				The gpu is healthy and operating within normal
> +				parameters.
> +
> +			warning
> +				The gpu is experiencing minor issues but remains
> +				operational.
> +
> +			critical
> +				The gpu is in a critical state and may not be
> +				operational.
> diff --git a/Documentation/gpu/xe/xe_device.rst b/Documentation/gpu/xe/xe_device.rst
> index 39a937b97cd3..6fdba960c2d9 100644
> --- a/Documentation/gpu/xe/xe_device.rst
> +++ b/Documentation/gpu/xe/xe_device.rst
> @@ -8,3 +8,12 @@ Xe Device Wedging
>   
>   .. kernel-doc:: drivers/gpu/drm/xe/xe_device.c
>      :doc: Xe Device Wedging
> +
> +.. _xe-gpu-health-indicator:

Where is this used?

> +
> +====================
> +GPU Health Indicator
> +====================
> +
> +.. kernel-doc:: drivers/gpu/drm/xe/xe_ras.c
> +   :doc: GPU Health Indicator
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 74d5016d9ffe..d1214a213d6e 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -65,6 +65,13 @@ static const char *const xe_ras_components[] = {
>   };
>   static_assert(ARRAY_SIZE(xe_ras_components) == XE_RAS_COMP_MAX);
>   
> +static const char * const gpu_health_states[] = {

status or states. Use any one consistently.

> +	[XE_RAS_HEALTH_OK]		= "ok",
> +	[XE_RAS_HEALTH_WARNING]		= "warning",
> +	[XE_RAS_HEALTH_CRITICAL]	= "critical",
> +};
> +static_assert(ARRAY_SIZE(gpu_health_states) == XE_RAS_HEALTH_MAX);
> +
>   static u8 drm_to_xe_ras_severity(u8 severity)
>   {
>   	switch (severity) {
> @@ -332,6 +339,132 @@ int xe_ras_clear_counter(struct xe_device *xe, u8 severity, u8 component)
>   	return 0;
>   }
>   
> +static ssize_t gpu_health_show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	struct xe_ras_get_health_response response = {0};
> +	struct xe_sysctrl_mailbox_command command = {0};
> +	struct xe_ras_get_health_request request = {0};
> +	struct xe_device *xe = kdev_to_xe_device(dev);
> +	const char *health;
> +	size_t rlen;
> +	int ret;
> +
> +	xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, XE_SYSCTRL_CMD_GET_HEALTH,
> +				  &request, sizeof(request), &response, sizeof(response));
> +	guard(xe_pm_runtime)(xe);
> +	ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
> +	if (ret) {
> +		xe_err(xe, "sysctrl: failed to get health %d\n", ret);
> +		return ret;
> +	}
> +
> +	if (rlen != sizeof(response)) {
> +		xe_err(xe, "sysctrl: unexpected get health response length %zu (expected %zu)\n",
> +		       rlen, sizeof(response));
> +		return -EIO;
> +	}
> +	if (response.health >= XE_RAS_HEALTH_MAX) {
> +		xe_err(xe, "sysctrl: invalid health state %u\n",
> +		       response.health);
> +		return -EIO;
> +	}
> +
> +	health = gpu_health_states[response.health];
> +
> +	xe_dbg(xe, "[RAS]: get health: %s\n", health);
> +
> +	return sysfs_emit(buf, "%s\n", health);
> +}
> +
> +static ssize_t gpu_health_store(struct device *dev, struct device_attribute *attr,
> +				const char *buf, size_t count)
> +{
> +	struct xe_ras_set_health_response response = {0};
> +	struct xe_sysctrl_mailbox_command command = {0};
> +	struct xe_ras_set_health_request request = {0};
> +	struct xe_device *xe = kdev_to_xe_device(dev);
> +	const char *health;
> +	size_t rlen;
> +	int state;
> +	int ret;
> +
> +	state = sysfs_match_string(gpu_health_states, buf);
> +	if (state < 0)
> +		return -EINVAL;
> +
> +	request.health = state;
> +
> +	xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, XE_SYSCTRL_CMD_SET_HEALTH,
> +				  &request, sizeof(request), &response, sizeof(response));
> +	guard(xe_pm_runtime)(xe);
> +	ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
> +	if (ret) {
> +		xe_err(xe, "sysctrl: failed to set health %d\n", ret);
> +		return ret;
> +	}
> +
> +	if (rlen != sizeof(response)) {
> +		xe_err(xe, "sysctrl: unexpected set health response length %zu (expected %zu)\n",
> +		       rlen, sizeof(response));
> +		return -EIO;
> +	}
> +
> +	ret = ras_status_to_errno(response.status);
> +	if (ret) {
> +		xe_err(xe, "sysctrl: set health command failed with status %#x\n",
> +		       response.status);
> +		return ret;
> +	}
> +
> +	if (response.health >= XE_RAS_HEALTH_MAX) {
> +		xe_err(xe, "sysctrl: invalid health state %u\n",
> +		       response.health);
> +		return -EIO;
> +	}
> +
> +	health = gpu_health_states[response.health];
> +
> +	xe_dbg(xe, "[RAS]: set health: %s\n", health);
> +
> +	return count;
> +}
> +
> +static DEVICE_ATTR_RW(gpu_health);
> +
> +static struct attribute *gpu_health_attrs[] = {
> +	&dev_attr_gpu_health.attr,
> +	NULL,
> +};
> +
> +/**
> + * DOC: GPU Health Indicator
> + *
> + * On Intel Xe platforms that support the GPU health indicator interface,
> + * the driver exposes a sysfs attribute at the device level as:
> + *
code block would be appropriate

> + *	``/sys/bus/pci/drivers/xe/<BDF>/gpu_health``
> + *
> + * Reading the attribute returns a single line containing the current GPU
> + * health state. Writing one of the valid values updates the same. Reads
> + * are available to all users; writes are restricted to administrative
> + * users only (attribute permissions ``0644``).

Can these be set by firmware too? Worth mentioning incase an admin had 
never set
the value and sees a warning.

Do we need to mention when user needs to use this?


> + *
> + * The valid values for the GPU health state are:
> + *
> + * - ``ok``:
> + *	The GPU is healthy and operating within normal parameters.

Have you generated the document?

> + * - ``warning``:
> + *	The GPU is experiencing minor issues but remains operational.
> + * - ``critical``:
> + *	The GPU is in a critical state and may not be operational.
> + *
> + * See Documentation/ABI/testing/sysfs-driver-intel-xe-ras for the ABI
> + * specification.
> + */
> +static const struct attribute_group gpu_health_group = {
> +	.attrs = gpu_health_attrs,
> +};
> +
>   /**
>    * xe_ras_init - Initialize Xe RAS
>    * @xe: xe device instance
> @@ -340,6 +473,8 @@ int xe_ras_clear_counter(struct xe_device *xe, u8 severity, u8 component)
>    */
>   void xe_ras_init(struct xe_device *xe)
>   {
> +	int ret;
> +
>   	if (!xe->info.has_drm_ras)
>   		return;
>   
> @@ -350,4 +485,8 @@ void xe_ras_init(struct xe_device *xe)
>   
>   	if (IS_ENABLED(CONFIG_PCIEAER))
>   		ras_usp_aer_init(xe);
> +
> +	ret = devm_device_add_group(xe->drm.dev, &gpu_health_group);
> +	if (ret)
> +		xe_err(xe, "Failed to initialize GPU health sysfs, err=%d\n", ret);
>   }
> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
> index 6688e11f57a8..4c4fbc42c956 100644
> --- a/drivers/gpu/drm/xe/xe_ras_types.h
> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
> @@ -10,6 +10,21 @@
>   
>   #define XE_RAS_NUM_COUNTERS			16
>   
> +/**
> + * enum xe_ras_health_status - gpu health status values
> + *
> + * @XE_RAS_HEALTH_OK: gpu is healthy and operating normally.
> + * @XE_RAS_HEALTH_WARNING: gpu has minor issues but is still operational.
> + * @XE_RAS_HEALTH_CRITICAL: gpu is in a critical state and may not be operational.
> + * @XE_RAS_HEALTH_MAX: Sentinel value for validation
> + */
> +enum xe_ras_health_status {

If you removed status from enum, remove from name as well.

> +	XE_RAS_HEALTH_OK = 0,
> +	XE_RAS_HEALTH_WARNING,
> +	XE_RAS_HEALTH_CRITICAL,
> +	XE_RAS_HEALTH_MAX
> +};
> +
>   /**
>    * struct xe_ras_error_common - Error fields that are common across all products
>    */
> @@ -121,4 +136,46 @@ struct xe_ras_clear_counter_response {
>   	/** @reserved1: Reserved for future use */
>   	u32 reserved1[3];
>   } __packed;
> +
> +/**
> + * struct xe_ras_get_health_request - Request structure for obtaining gpu health
> + */
> +struct xe_ras_get_health_request {
> +	/** @reserved: Reserved for future use. */
> +	u32 reserved[2];
> +} __packed;
> +
> +/**
> + * struct xe_ras_get_health_response - Response structure for obtaining gpu health
> + */
> +struct xe_ras_get_health_response {
> +	/** @health: Current gpu health, see &enum xe_ras_health_status */
> +	u8 health;
> +	/** @reserved: Reserved for future use */
> +	u8 reserved[3];
> +} __packed;
> +
> +/**
> + * struct xe_ras_set_health_request - Request structure for setting gpu health
> + */
> +struct xe_ras_set_health_request {
> +	/** @health: New gpu health to set, see &enum xe_ras_health_status */


Let's use short description . "gpu health to be set" or just gpu health

> +	u8 health;
> +	/** @reserved: Reserved for future use */
> +	u8 reserved[3];
> +} __packed;
> +
> +/**
> + * struct xe_ras_set_health_response - Response structure for setting gpu health
> + */
> +struct xe_ras_set_health_response {
> +	/** @status: Status of set health operation, see &enum xe_ras_response_status */
> +	u32 status;
> +	/** @health: Resulting current gpu health, see &enum xe_ras_health_status */
Let's use short description . "current gpu health" or just gpu health
> +	u8 health;
> +	/** @reserved: Reserved for future use */
> +	u8 reserved[3];
> +	/** @reserved1: Reserved for future use */
> +	u32 reserved1[2];
> +} __packed;
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> index 6e3753554510..d4da6e9ef774 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> @@ -25,11 +25,15 @@ enum xe_sysctrl_group {
>    * @XE_SYSCTRL_CMD_GET_COUNTER: Get error counter value
>    * @XE_SYSCTRL_CMD_CLEAR_COUNTER: Clear error counter value
>    * @XE_SYSCTRL_CMD_GET_PENDING_EVENT: Retrieve pending event
> + * @XE_SYSCTRL_CMD_GET_HEALTH: Retrieve current health status

gpu health

Thanks
Riana

> + * @XE_SYSCTRL_CMD_SET_HEALTH: Set new health status
>    */
>   enum xe_sysctrl_gfsp_cmd {
>   	XE_SYSCTRL_CMD_GET_COUNTER		= 0x03,
>   	XE_SYSCTRL_CMD_CLEAR_COUNTER		= 0x04,
>   	XE_SYSCTRL_CMD_GET_PENDING_EVENT	= 0x07,
> +	XE_SYSCTRL_CMD_GET_HEALTH		= 0x0B,
> +	XE_SYSCTRL_CMD_SET_HEALTH		= 0x0C,
>   };
>   
>   /**
