Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04C36CD98F5
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jun 2026 08:36:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A080D10EEC3;
	Wed, 17 Jun 2026 08:36:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lbM6FeRz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90B5410EEBC
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jun 2026 08:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781685370; x=1813221370;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mdtUgloDz36RRsek1SIBpYX/LdPKWRz/dlryBLVySA0=;
 b=lbM6FeRzDPhZMr9qj1LUy8TMuOXoogeDp6ocqoPakllD5n65aAs626z7
 uCHI5WU6KlnzAEkYorbPj2gfSbtuJ7+ECvlMD7OS86MUoEBZrkOSNYkJe
 GVuTNtuLWhIJYucXaeFlZz1cOLNaBhLkPvzttns7FB/Yx8763joCylaea
 ExrZ0OiKgglJa4ELZkD0KkCBKBuOcIX7X/LJI5dNQFzQ15flqQxvU7P8n
 mwe1mirIKjj92Ba1HmlCTHyo+YY4JMmUmIrCJFEXMCDpU6oDZ1DRrIXVC
 U3k3jEscM82JpSK85DddF8EAIuPoLK4aMixpCO97tKUdGFNMcOXSor4b/ g==;
X-CSE-ConnectionGUID: 09jOXIq2TMGE/HZYI0388g==
X-CSE-MsgGUID: PwzjSdSZQZ+u5K/polIiIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="70004758"
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; d="scan'208";a="70004758"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 01:36:10 -0700
X-CSE-ConnectionGUID: Gnz2zy3tRbmXs7Sw5alXNQ==
X-CSE-MsgGUID: bi8BMCZPT+2kmUunwjhi+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; d="scan'208";a="245626401"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 01:36:10 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 17 Jun 2026 01:36:09 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 17 Jun 2026 01:36:09 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.11) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 17 Jun 2026 01:36:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TOinMaSj/4jgY+9+qq5fUGpqdWigtq5rfpqtDGfQ8VJynV3jO0RDRVC3wRXxtYlyLYz+Ccaru4EY+CVO2biObO5rNIKhaBIYwQ6QQ5BFST3nOr+4y34EKEwV4cfitjhU7zo6WlQPINVDJiGwS3Ti2n0oKmzOuHnH/54a5ume7cH/vVRijYJT3MkLQMGVZfkII2Oh+ItL8GEyuBsc326ssjXYgLfm+1sqcegB0sNLeBgS6pJlyUqNWt/kejhtXSkI9PALJ2hgkUFO9uJWkCCtT4kBgsUmR8WueK/UdTsjQAUYisMmseTdln3logn8LTmFeGqVwV8izvLY0JxIMDLB4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ecbTMlcy+iJjttvPdCy7EJUr15qWFGeAMpqqbvQmSIc=;
 b=tVl99neWcBMWKuShSB+o7wW/tjcpUoiEBZTyoDa9Tun7P+DFRk39jApmJgo6Yn/PDTErf/qJ/xFNqjH1+rsg3VD7QAYtwgE5nPsGJh1vJOEFnXXpTIwxTd65WzPbFowkHiFroZUyDRwvzGM+2mYMAAWLz8fmjwKRzJ6eYDQsZ6smIU/XT0ifJs8dj9wmqQQF4t7rFwoy2axB9Z07S6s0qyPDyqPxxOB7sZnPuZYgbEmRghhMFtXxri7uUXrtee3vjPA4IMX2gwseu33Vf6SWugOsCJTEYjMq4yBYxljqFFBCZM7+tE3zwTHx0pjC3bOWDTj7X8LkSMCDziG/yVfU3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV0PR11MB9792.namprd11.prod.outlook.com (2603:10b6:408:385::5)
 by SJ2PR11MB8323.namprd11.prod.outlook.com (2603:10b6:a03:53f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Wed, 17 Jun
 2026 08:36:05 +0000
Received: from LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8]) by LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8%3]) with mapi id 15.21.0113.015; Wed, 17 Jun 2026
 08:36:05 +0000
Message-ID: <3467c712-8507-45c7-8ac7-2a32265ceb29@intel.com>
Date: Wed, 17 Jun 2026 14:05:55 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/1] drm/xe/xe_ras: Add RAS GPU health indicator
To: Soham Purkait <soham.purkait@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <riana.tauro@intel.com>, <anshuman.gupta@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <raag.jadav@intel.com>,
 <ravi.kishore.koppuravuri@intel.com>, <mallesh.koujalagi@intel.com>,
 <andi.shyti@intel.com>, <rodrigo.vivi@intel.com>
CC: <anoop.c.vijay@intel.com>
References: <20260610093353.2538576-3-soham.purkait@intel.com>
 <20260610093353.2538576-4-soham.purkait@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20260610093353.2538576-4-soham.purkait@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0167.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1cf::8) To LV0PR11MB9792.namprd11.prod.outlook.com
 (2603:10b6:408:385::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV0PR11MB9792:EE_|SJ2PR11MB8323:EE_
X-MS-Office365-Filtering-Correlation-Id: fee26f3c-1155-4d1f-dc53-08decc4b78a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|18002099003|6133799003|22082099003|921020|4143699003|56012099006|11063799006|3023799007;
X-Microsoft-Antispam-Message-Info: hBSEyfEVzW4QXOsbRq6MgVDzzwYbrLXcu3qdNpY2NVQt+ZzdNK0KcGgBCRWxBWTMZcAD2fknGT+xjEVIhgkoDZj7lCY3FvCF7isw+W7F1wpPK+UfLvzx9NTe+tcm7BgkTN0ouomua3An78XQVa/cJc6k6Cmh9Nyub5IF7gHqPM+YDwm5wcg+aamc2h5uFjBuCV4u3occeaAYaMfTxn0UioQT7U+WL60fkJqxRbwRMwGc29kkiOAiYJ+hud6txzw83tUpk7ALCjwDgq24fnUzoaJUWOOf8MsCqD/U4yNNfYToBngwk8ZI0aat1dgLKPMXsvpE4/G8guoZYcuX1bgTjmFano9YFwEBTgITlz3TFwN3k3PiPbnkx4xZSycNmXGE2ZN3bQC61uUy71CFPl65mv+w5WAznvAXm9fVUtvz5KezJchatuYHs3OHKk/V1Sf0WFWTKr8oa5nfGzv8H20Vskw6MHxlbMQIKR0iwDOXzZ0rvMTb9ieRTIwzhuz/+hHVUjnWmcg8fF2O7iTxvflQgZuw6LnucpnZ2PGPyBE7DAcm48p9L9qVMDPChaiIS16lhoqkFYV4UiuazmIh9xMHLnnSYeIN7yOicuDQNd+5nTcMJhVMduQM+GDJeptVgPGFC1Kc2FSAj2ms0g/nzF4qF+uzdGEhyct5aYa2BzbheCo2hnzH3vsYhHMRQRwATRWY0WW+EuHxfGlW9I23hzkiVpzANlwLUT+8wk1Wl6ig9us=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV0PR11MB9792.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(18002099003)(6133799003)(22082099003)(921020)(4143699003)(56012099006)(11063799006)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OTEzanhjZTZ6citvSmE3NWpMS0ZrdjROeU1LTTdRSVpCcS9PVkwxZzgyNDFE?=
 =?utf-8?B?cFVDM1RDSkkrMkpON2ozdmZ2WkxlRnl2bGMrWXFzZ3ZjRlk3ZlYydDZJRTIx?=
 =?utf-8?B?YnhTRmdPdkVsbGdJV0hiVmw2cXJrNEVZWDFqVmNIUVQzWnNiSEFRQkFEQjJ1?=
 =?utf-8?B?N2Z3RS9JNytoazQ2T3I2RXRJNDRjbHhFL0wrbFdwU0Q0a0M2RWV2VlZuUC9E?=
 =?utf-8?B?ZFhXc0w0RnlGdW41T0FBZkQ1aVV4MWpRTnJ4djNZNDZSeE9WL2tMbkhMSzZu?=
 =?utf-8?B?bmovWTJuR0hEaVVLNk1PQ1VKZHZXYS9KZ2tRV3poVWMwK0V3Ui9CNzBzSjJX?=
 =?utf-8?B?VTRnRzRwYW05c1NqQTNqZVpkKzFXbGVVOHRPR2JTdXUwRU5UeWp4QXdIWWgw?=
 =?utf-8?B?ZUpQUUtSS2NmU0FXbU4wZXk5S3FaaWh6SHVTVDJuS3BpdzJwRUxPd0pxNWhw?=
 =?utf-8?B?RW9kVEtxNS92bnFJSlJHcnZzclRUZ0Q2aGJqWDJwODg0bDJoY3RXRmFyRkZ1?=
 =?utf-8?B?anlUblAzdDY1OG1mUnN6RHBjMk9meVdrMFBwQlZkQklXTUlXOGQzSUJVeVBq?=
 =?utf-8?B?bHFVdDhTUTgybGhOYzNHVzRad2NUNmJtakptUGhaME01RTR5bEhXRVdYc1gx?=
 =?utf-8?B?TlhsZVhQRnkvMWRVVFA1WGMvZXEzajhLcXpmUXgyYm9XUFIveUluSzN0dkda?=
 =?utf-8?B?VEdHWmM0TGpNVFMwZjFjbkczSThKNGh4TzFIZm9XeWV2REhMRFhwUmpHWUlR?=
 =?utf-8?B?dDg1TWhIcnAxVjhLbjF2cURWbGE1WkJjWkZvZ0pZeGgwZWZZYmVRZEp5Y3lu?=
 =?utf-8?B?MHU3K0JrTTdaajJZZ1preGRhN2FzenlqaUpkYmtwSkdhVCtQUnNCZmtWSUVV?=
 =?utf-8?B?R1BqZGQ0MmdSdnVnQ2JCTG5xL2VzZ2R6cDkvVGJCR3lYaVRFQllQZlhQbWE5?=
 =?utf-8?B?MGp6emZwWjU1ZVZCVENqakx6bW0xTnZHMCtYVkgrZnJrR2xSbHNNWnVUbUpp?=
 =?utf-8?B?c2lMSUlvOTE2YTdmd1ROTHBScVV0MGc3Z1FSU2h2M3E4Ym04aGJJZWY3L0Y3?=
 =?utf-8?B?L3FmRyt5djJkMGY0TitJS01TN2JVZFpnQXFGK3RmcUs0amxFZWRPeEI4Q1Ji?=
 =?utf-8?B?SXIzbkoxdWJsVkY4SHNhYWJFUkovc2grbEhtUEdUNC8ydnVlTDdqeE1iV001?=
 =?utf-8?B?eWJrcWdIdHAwdGJKcExuZWY0VzBRMXEyUFUwTnJIOEI4aTZkV3Q3dVhGQ3pt?=
 =?utf-8?B?TjhXV1ZLQ0RLRk96OGNmNExJWmZpVXVVeDhmd0pxYzZUY0taSFRid1Vwb1Uy?=
 =?utf-8?B?MEhIQVhRaXhpMURMd1hVcnRPT0ZBQytpZG9xV05EaWJTZmsxaFh5TU4yWkJn?=
 =?utf-8?B?b3o5WEpoMjVZVkpVNmF3UTB4REJHMHUxamdzTWM2UlJtalVIdGhuZHVlVERU?=
 =?utf-8?B?aXNsMTFxKy8vZnRUNmp6U0Q3ZHd4ODk3Tys0cnk4b3c3MjBXWFhkWmNrbjV2?=
 =?utf-8?B?QjRleGwvMCtha0VJbUYrZzhJUmxrU2RKYVhZVUlyUVQ3YzBQK0taZVB6REFC?=
 =?utf-8?B?V2lLaC93OWl6K3NDWDM4U1VSVkNiQ1VydTRpVUgrdjdEbXVYRnVEZDh0alRO?=
 =?utf-8?B?bXJGT1AxamhVUnJHWjljb1NjUHgzbGkvaVVCVUhNOURkVmJRV0ptbWE0UTFY?=
 =?utf-8?B?aWRMOXJOblBaTk42VHB0QW84aWtJVkV6YUdiaVhld2w5bVFKZVVwd0RpTlUy?=
 =?utf-8?B?MGJJSkgvZFdueHl3NkRVaTNXQUh0VmR4b2pyM2ZFR0JLeGZiNE1EdnRZeVI4?=
 =?utf-8?B?aHBMTXE0UGs3TUFXSkY5K2VXbkJGdmh0RmNEVDJUZnJ4N1dONGdLOGdVcVhB?=
 =?utf-8?B?bXVqaGVFamZHWUl1eGJCL2lHcktIU2Z1d0hWeHdQemFkeWVoVFovT3lJYlFJ?=
 =?utf-8?B?R1lnWUNRVlFXd0N1YWkzUWxCZC9jYk1XTHFRMzFWZlQzd1RsWTh4M3JqTFBx?=
 =?utf-8?B?WWl3UlZZSHIvRTc2djRNWFpEVXN0K1BjV1NvTFpjMnN5dXVJbmlUclBTR0pK?=
 =?utf-8?B?Z0NJQ1FJVmdwdjRPVnJtUEZEaktucUdRd01zWnBPL3lZNnVKTUZZd2NUQTND?=
 =?utf-8?B?amlMUGI3aElQaFVVMlpGNUZnTnltQ2JQYWt1d3k3M2NkNTV5VGkyQUhvZVlH?=
 =?utf-8?B?NVhrSkhNUWtEQTIySGhkdVNQVXozOUlHamhRY01qcWVqTUtpTnJrSzFRc3F4?=
 =?utf-8?B?TFRRVCtlNDJ2Y3JjYmt5cTFsb1MxT0Fsbk9UMGFLVnNlTUdFRXpEN1hFSmhD?=
 =?utf-8?B?ZTVEdE5GYkdob1c2dkhHVU5TS2t6TEdUVFZsM2Y3bGR1SityRFord2U5a2pD?=
 =?utf-8?Q?Jxx9oMcC2RgyGkfw=3D?=
X-Exchange-RoutingPolicyChecked: b+4ihwBmaaj6peU9vXTpni5XdxV5oemAmKQMCvwt2o9VRJUejAEkaTAHGANl1Qe7aE46hKuYDPxp9zvEnAfJvUdiTGT08+J3UXAEZoowYCpbCXEAwyoYOlOP5CK7hp3/tmLDWOZE2UwJrMIYqlUlu2t5wr7tjJx43aMScWQQyRyZJ1Ecf503d9bFUAdqoGeDAdxF/xuvJ0FhyA6TjYMAc4UXGm+bcb49AA966DbhGeMFPNMm6cHMLH/lE0BmcpAlB/I9BsFAtAtm73PtRAUnZhi4J0A+G27J/PFkdXtqvvAA2hNm6GBM2BdtzjrHltfpXmDILO5CEoaeFe2lsfF6tw==
X-MS-Exchange-CrossTenant-Network-Message-Id: fee26f3c-1155-4d1f-dc53-08decc4b78a3
X-MS-Exchange-CrossTenant-AuthSource: LV0PR11MB9792.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 08:36:05.5045 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JM6hFsTGKKNnPYiUxPvFtraaatx7k0krZXlV0+iiJV/ijeWnLtQ58VlTyB73xkq16pbG9ioq69LaNCzZoW85Jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8323
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


On 10-06-2026 15:03, Soham Purkait wrote:
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
> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
> Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>   .../ABI/testing/sysfs-driver-intel-xe-ras     |  30 +++
>   drivers/gpu/drm/xe/xe_ras.c                   | 177 ++++++++++++++++++
>   drivers/gpu/drm/xe/xe_ras.h                   |   1 +
>   drivers/gpu/drm/xe/xe_ras_types.h             |  60 ++++++
>   drivers/gpu/drm/xe/xe_sysctrl_mailbox.c       |  28 +++
>   drivers/gpu/drm/xe/xe_sysctrl_mailbox.h       |   3 +
>   drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |   4 +
>   7 files changed, 303 insertions(+)
>   create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-xe-ras
>
> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-ras b/Documentation/ABI/testing/sysfs-driver-intel-xe-ras
> new file mode 100644
> index 000000000000..c7f2cf8bb6ad
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-ras
> @@ -0,0 +1,30 @@
> +What:		/sys/bus/pci/drivers/xe/.../gpu_health
> +Date:		April 2026
> +KernelVersion:	7.2
> +Contact:	intel-xe@lists.freedesktop.org
> +Description:
> +		This file exposes the current GPU health state and allows the GPU
> +		health state to be updated.
> +
> +		This sysfs file is present only on Intel Xe platforms that support
> +		the GPU health indicator interface for RAS. Reading the current
> +		health state is available to all users, while updating the health
> +		state is restricted to administrative users only.
> +
> +		Read returns a single line containing one of the valid values for
> +		the current device health state. Writing one of the valid values
> +		updates the current device health state.
> +
> +		The valid values for the device health state are:
> +
> +			ok
> +				The device is healthy and operating within normal
> +				parameters.
> +
> +			warning
> +				The device is experiencing minor issues but remains
> +				operational.
> +
> +			critical
> +				The device is in a critical state and may not be
> +				operational.
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 4cb16b419b0c..b7efd607aadf 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -4,11 +4,14 @@
>    */
>   
>   #include "xe_device.h"
> +#include "xe_pm.h"
>   #include "xe_printk.h"
>   #include "xe_ras.h"
>   #include "xe_ras_types.h"
>   #include "xe_sysctrl.h"
>   #include "xe_sysctrl_event_types.h"
> +#include "xe_sysctrl_mailbox.h"
> +#include "xe_sysctrl_mailbox_types.h"
>   
>   /* Severity of detected errors  */
>   enum xe_ras_severity {
> @@ -31,6 +34,16 @@ enum xe_ras_component {
>   	XE_RAS_COMP_MAX
>   };
>   
> +/* RAS response status codes */
> +enum xe_ras_response_status {
> +	XE_RAS_STATUS_SUCCESS = 0,
> +	XE_RAS_STATUS_INVALID_PARAM,
> +	XE_RAS_STATUS_OP_NOT_SUPPORTED,
> +	XE_RAS_STATUS_TIMEOUT,
> +	XE_RAS_STATUS_HARDWARE_FAILURE,
> +	XE_RAS_STATUS_INSUFFICIENT_RESOURCES
> +};
> +
>   static const char *const xe_ras_severities[] = {
>   	[XE_RAS_SEV_NOT_SUPPORTED]		= "Not Supported",
>   	[XE_RAS_SEV_CORRECTABLE]		= "Correctable Error",
> @@ -50,6 +63,33 @@ static const char *const xe_ras_components[] = {
>   };
>   static_assert(ARRAY_SIZE(xe_ras_components) == XE_RAS_COMP_MAX);
>   
> +static const char * const gpu_health_states[] = {
> +	[XE_RAS_HEALTH_STATUS_OK]		= "ok",
> +	[XE_RAS_HEALTH_STATUS_WARNING]		= "warning",
> +	[XE_RAS_HEALTH_STATUS_CRITICAL]		= "critical"
> +};
> +static_assert(ARRAY_SIZE(gpu_health_states) == XE_RAS_HEALTH_STATUS_MAX);
> +
> +static int ras_status_to_errno(u32 status)
> +{
> +	switch (status) {
> +	case XE_RAS_STATUS_SUCCESS:
> +		return 0;
> +	case XE_RAS_STATUS_INVALID_PARAM:
> +		return -EINVAL;
> +	case XE_RAS_STATUS_OP_NOT_SUPPORTED:
> +		return -EOPNOTSUPP;
> +	case XE_RAS_STATUS_TIMEOUT:
> +		return -ETIMEDOUT;
> +	case XE_RAS_STATUS_HARDWARE_FAILURE:
> +		return -EIO;
> +	case XE_RAS_STATUS_INSUFFICIENT_RESOURCES:
> +		return -ENOSPC;
> +	default:
> +		return -EPROTO;
> +	}
> +}
> +
>   static inline const char *sev_to_str(u8 severity)
>   {
>   	if (severity >= XE_RAS_SEV_MAX)
> @@ -91,3 +131,140 @@ void xe_ras_counter_threshold_crossed(struct xe_device *xe,
>   			comp_to_str(component), sev_to_str(severity));
>   	}
>   }
> +
> +static ssize_t gpu_health_show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	struct xe_ras_get_health_response response = {0};
> +	struct xe_sysctrl_mailbox_command command = {0};
> +	struct xe_ras_get_health_request request = {0};
> +	struct xe_device *xe = kdev_to_xe_device(dev);
> +	enum xe_ras_health_status health;
> +	size_t rlen = 0;
> +	int ret;
> +
> +	xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, XE_SYSCTRL_CMD_GET_HEALTH,
> +				  &request, sizeof(request), &response, sizeof(response));
> +	guard(xe_pm_runtime)(xe);
> +	ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
> +	if (ret) {
> +		xe_err(xe, "sysctrl: failed to send get health command %d\n", ret);
> +		return ret;
> +	}
> +
> +	if (rlen != sizeof(response)) {
> +		xe_err(xe, "sysctrl: unexpected get health response length %zu (expected %zu)\n",
> +		       rlen, sizeof(response));
> +		return -EIO;
> +	}
> +	if (response.current_health >= XE_RAS_HEALTH_STATUS_MAX) {
> +		xe_err(xe, "sysctrl: invalid health state %u\n",
> +		       response.current_health);
> +		return -EIO;
> +	}
> +
> +	health = (enum xe_ras_health_status)response.current_health;
> +
> +	xe_dbg(xe, "[RAS]: get health:%s\n", gpu_health_states[health]);
> +
> +	return sysfs_emit(buf, "%s\n", gpu_health_states[health]);
> +}
> +
> +static ssize_t gpu_health_store(struct device *dev, struct device_attribute *attr,
> +				const char *buf, size_t count)
> +{
> +	struct xe_ras_set_health_response response = {0};
> +	struct xe_sysctrl_mailbox_command command = {0};
> +	struct xe_ras_set_health_request request = {0};
> +	struct xe_device *xe = kdev_to_xe_device(dev);
> +	enum xe_ras_health_status health;
> +	size_t rlen = 0;
> +	int ras_status;
> +	int state;
> +	int ret;
> +
> +	state = sysfs_match_string(gpu_health_states, buf);
> +	if (state < 0) {
> +		xe_err(xe, "[RAS]: invalid health state '%.*s'\n",
> +		       (int)strcspn(buf, "\n"), buf);
> +		return -EINVAL;
> +	}
> +
> +	request.new_health = (u8)state;
> +
> +	xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, XE_SYSCTRL_CMD_SET_HEALTH,
> +				  &request, sizeof(request), &response, sizeof(response));
> +	guard(xe_pm_runtime)(xe);
> +	ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
> +	if (ret) {
> +		xe_err(xe, "sysctrl: failed to send set health command %d\n", ret);
> +		return ret;
> +	}
> +
> +	if (rlen != sizeof(response)) {
> +		xe_err(xe, "sysctrl: unexpected set health response length %zu (expected %zu)\n",
> +		       rlen, sizeof(response));
> +		return -EIO;
> +	}
> +
> +	ras_status = ras_status_to_errno(response.status);
> +	if (ras_status) {
> +		xe_err(xe, "sysctrl: set health command failed with status %d\n",
> +		       response.status);
> +		return ras_status;
> +	}
> +
> +	if (response.current_health >= XE_RAS_HEALTH_STATUS_MAX) {
> +		xe_err(xe, "sysctrl: invalid health state %u\n",
> +		       response.current_health);
> +		return -EIO;
> +	}
> +
> +	health = (enum xe_ras_health_status)response.current_health;
> +
> +	xe_dbg(xe, "[RAS]: set health:%s\n", gpu_health_states[health]);
The [RAS] prefix is redundant here as xe_dbg macro already includes 
driver/subsystem context.
> +
> +	return count;
> +}
> +
> +static DEVICE_ATTR_RW(gpu_health);
> +
> +static void gpu_health_sysfs_fini(void *arg)
> +{
> +	struct device *dev = arg;
> +
> +	device_remove_file(dev, &dev_attr_gpu_health);
> +}
> +
> +static int gpu_health_sysfs_init(struct xe_device *xe)
> +{
> +	struct device *dev = xe->drm.dev;
> +	int err;
> +
> +	err = device_create_file(dev, &dev_attr_gpu_health);
> +	if (err)
> +		return err;
> +
> +	err = devm_add_action_or_reset(dev, gpu_health_sysfs_fini, dev);
> +	if (err)
> +		return err;
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_ras_init - Initialize Xe RAS
> + * @xe: xe device instance
> + *
> + * Initialize the RAS GPU health sysfs interface.
> + */
> +void xe_ras_init(struct xe_device *xe)
> +{
> +	int ret;
> +
> +	if (!xe->info.has_sysctrl || IS_SRIOV_VF(xe))
> +		return;
> +
> +	ret = gpu_health_sysfs_init(xe);
> +	if (ret)
> +		xe_err(xe, "[RAS]: failed to initialize GPU health sysfs, err=%d\n", ret);
ditto.
> +}
> diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
> index ea90593b62dc..8acfd0ffe48e 100644
> --- a/drivers/gpu/drm/xe/xe_ras.h
> +++ b/drivers/gpu/drm/xe/xe_ras.h
> @@ -11,5 +11,6 @@ struct xe_sysctrl_event_response;
>   
>   void xe_ras_counter_threshold_crossed(struct xe_device *xe,
>   				      struct xe_sysctrl_event_response *response);
> +void xe_ras_init(struct xe_device *xe);
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
> index 4e63c67f806a..4767bcf315a3 100644
> --- a/drivers/gpu/drm/xe/xe_ras_types.h
> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
> @@ -10,6 +10,21 @@
>   
>   #define XE_RAS_NUM_COUNTERS			16
>   
> +/**
> + * enum xe_ras_health_status - Device health status values
> + *
> + * @XE_RAS_HEALTH_STATUS_OK: Device is healthy and operating normally.
> + * @XE_RAS_HEALTH_STATUS_WARNING: Device has minor issues but is still operational.
> + * @XE_RAS_HEALTH_STATUS_CRITICAL: Device is in a critical state and may not be operational.
> + * @XE_RAS_HEALTH_STATUS_MAX: Sentinel value for validation
> + */
> +enum xe_ras_health_status {
> +	XE_RAS_HEALTH_STATUS_OK = 0,
> +	XE_RAS_HEALTH_STATUS_WARNING,
> +	XE_RAS_HEALTH_STATUS_CRITICAL,
> +	XE_RAS_HEALTH_STATUS_MAX
> +};
> +
>   /**
>    * struct xe_ras_error_common - Error fields that are common across all products
>    */
> @@ -70,4 +85,49 @@ struct xe_ras_threshold_crossed {
>   	struct xe_ras_error_class counters[XE_RAS_NUM_COUNTERS];
>   } __packed;
>   
> +/**
> + * struct xe_ras_get_health_request - Request structure for GFSP GET_HEALTH
> + *
> + * GET_HEALTH takes no input parameters; the reserved payload is kept to
> + * preserve the firmware wire layout and allow future extensions. The
> + * driver must zero all reserved fields.
> + */
> +struct xe_ras_get_health_request {
> +	/** @reserved: Reserved for future use. */
> +	u32 reserved[2];
> +} __packed;
> +
> +/**
> + * struct xe_ras_get_health_response - Response structure for GFSP GET_HEALTH
> + */
> +struct xe_ras_get_health_response {
> +	/** @current_health: Current GPU health, see &enum xe_ras_health_status */
> +	u8 current_health;
> +	/** @reserved: Reserved for future use */
> +	u8 reserved[3];
> +} __packed;
> +
> +/**
> + * struct xe_ras_set_health_request - Request structure for GFSP SET_HEALTH
> + */
> +struct xe_ras_set_health_request {
> +	/** @new_health: New GPU health to set, see &enum xe_ras_health_status */
> +	u8 new_health;
> +	/** @reserved: Reserved for future use */
> +	u8 reserved[3];
> +} __packed;
> +
> +/**
> + * struct xe_ras_set_health_response - Response structure for GFSP SET_HEALTH
> + */
> +struct xe_ras_set_health_response {
> +	/** @status: Status of set health operation, see &enum xe_ras_response_status */
> +	u32 status;
> +	/** @current_health: Resulting current GPU health, see &enum xe_ras_health_status */
> +	u8 current_health;
> +	/** @reserved: Reserved for future use */
> +	u8 reserved[3];
> +	/** @reserved1: Reserved for future use */
> +	u32 reserved1[2];
If firmware wire layout permits then how about combining reserved fields 
in single appropriately sized array.
> +} __packed;

Missing blank line here.

Thanks,
Badal

>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> index 3caa9f15875f..9507f68bc2eb 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> @@ -293,6 +293,34 @@ static int sysctrl_send_command(struct xe_sysctrl *sc,
>   	return 0;
>   }
>   
> +/**
> + * xe_sysctrl_create_command() - Create system controller command
> + * @command: Sysctrl command structure
> + * @group_id: Command group ID
> + * @cmd_id: Command ID
> + * @request: Pointer to request buffer (can be NULL)
> + * @request_len: Size of request buffer
> + * @response: Pointer to response buffer
> + * @response_len: Size of response buffer
> + *
> + * Helper function to build sysctrl command to be sent via %xe_sysctrl_send_command()
> + */
> +void xe_sysctrl_create_command(struct xe_sysctrl_mailbox_command *command, u8 group_id, u8 cmd_id,
> +			       void *request, size_t request_len, void *response,
> +			       size_t response_len)
> +{
> +	struct xe_sysctrl_app_msg_hdr header = {0};
> +
> +	header.data = FIELD_PREP(APP_HDR_GROUP_ID_MASK, group_id) |
> +		      FIELD_PREP(APP_HDR_COMMAND_MASK, cmd_id);
> +
> +	command->header = header;
> +	command->data_in = request;
> +	command->data_in_len = request_len;
> +	command->data_out = response;
> +	command->data_out_len = response_len;
> +}
> +
>   /**
>    * xe_sysctrl_mailbox_init - Initialize System Controller mailbox interface
>    * @sc: System controller structure
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
> index f67e9234de48..fb434cc165b2 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
> @@ -23,6 +23,9 @@ struct xe_sysctrl_mailbox_command;
>   #define XE_SYSCTRL_APP_HDR_VERSION(hdr) \
>   	FIELD_GET(APP_HDR_VERSION_MASK, (hdr)->data)
>   
> +void xe_sysctrl_create_command(struct xe_sysctrl_mailbox_command *command, u8 group_id, u8 cmd_id,
> +			       void *request, size_t request_len, void *response,
> +			       size_t response_len);
>   void xe_sysctrl_mailbox_init(struct xe_sysctrl *sc);
>   int xe_sysctrl_send_command(struct xe_sysctrl *sc,
>   			    struct xe_sysctrl_mailbox_command *cmd,
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> index 84d7c647e743..f82e3fb9b5ef 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> @@ -23,9 +23,13 @@ enum xe_sysctrl_group {
>    * enum xe_sysctrl_gfsp_cmd - Commands supported by GFSP group
>    *
>    * @XE_SYSCTRL_CMD_GET_PENDING_EVENT: Retrieve pending event
> + * @XE_SYSCTRL_CMD_GET_HEALTH: Retrieve current health status
> + * @XE_SYSCTRL_CMD_SET_HEALTH: Set new health status
>    */
>   enum xe_sysctrl_gfsp_cmd {
>   	XE_SYSCTRL_CMD_GET_PENDING_EVENT	= 0x07,
> +	XE_SYSCTRL_CMD_GET_HEALTH		= 0x0B,
> +	XE_SYSCTRL_CMD_SET_HEALTH		= 0x0C,
>   };
>   
>   /**
