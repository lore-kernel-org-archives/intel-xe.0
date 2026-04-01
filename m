Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFA07D3515C
	for <intel-xe@archiver.kernel.org>; Wed,  1 Apr 2026 09:56:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 584A310E332;
	Wed,  1 Apr 2026 09:56:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RaIdlsgm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD99E10ECD8
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Apr 2026 09:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775037401; x=1806573401;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zgY00vjCgDQjOxeTd0I385OFN1pSpl14QGshg+pi59c=;
 b=RaIdlsgm1mDcMrg1qIVayzyEtVaglDglc1ob9JktAozmLdysPas2oOIi
 BouSb6TqVX/Lptsg/5rlLRe4Ygd/tjP3+8e6XsTmseZEIFVJ6nkY66aB3
 7hSqjuQx6fGTKkPH4WkasE+p+uwiXNsQQIkaeKLBPPqG2itJVT48he/yC
 M55621h4tIwScsyL1DikBFyReSeIim9mL64bZeqArq664dZBhoFHVHZI1
 hOmI0cfTHRj0LdblBxj4I+xOFs91fmt4FskJlPwN8NnQ7MypFlK1M61IZ
 EMhTpVr2GsG7KBcQQ7X44dFQ5jXoEU+YkRRvYRE7fprGo7/UwBLbrlmFp g==;
X-CSE-ConnectionGUID: aZGmxK3IRX6i4l7t5Bra6A==
X-CSE-MsgGUID: fjKmw2tHQXSwQDU5QiMtwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="75242820"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="75242820"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 02:56:40 -0700
X-CSE-ConnectionGUID: CJbNZ5G7TMSoeg8NzJyzsw==
X-CSE-MsgGUID: hANw46THTOaVJgLrMpochw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="223339603"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 02:56:40 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 1 Apr 2026 02:56:40 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 1 Apr 2026 02:56:40 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.13) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 1 Apr 2026 02:56:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UAPIZc9wJ24OPQ7UgW1POqO4HOfLxvYOLjaSW8s8Vpyj6NREVf2Wc/FD54e+UDs5qVIXLIuBAk+Ys4iz5DeJmLVSv7CJyF8VlZtaDYpCIy/ic1ia1tdV5cz8enLE1YxRtndOIgKxsDsAM/nHVQjsMh6hBTaehaZVizYv91WEF6ivL6Nw1YaAVzC/6JipHXDGmRrf4jcytvXHhJykNusc+2QjnQRWb5bkaU2kc1jOYrtqIBy5Cidi1L2Gjk7PWUVK848DJz5UWkVXK/JAk3mPWamWxWDN3s3HgwqRSXByLYbvM3XPiN2q/LR27mERJyg2YCNB8fnf7QY0ca0ZIt7Fzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GkLaCdRmI7+cvdriZce6VRMMv8B5PpErv5It6jAzGjs=;
 b=jRpTH1InFXGFSeEWbpf8PkF2WgYPDC+qcfmqyODZoKZquW3GQ+TAzR/F6gJ2BqB2PjmHQELJhdPHrmNlNMYLFxDAogoexHnKRV6jNSAH2IrlB2mXmp5Zd2yEk3wuZamTRwSawk7zkEH1uqTJ1aVrGRZKmCvBLdsLW2flT9W4iiToMX6v+KLduemEyW2sOqCNBeU9AgRXFm1jbIeulSelV4xtuhb+zRSe1454qmsH5LZpm4Qgv0Fyxjup6K83foRIXzPBaC5flKVI5nTQW36cH9g4so6LpJZA4V17RUl2OMwVJawJLGV/xycuk1kkXkC6bBI08+IOT7QLxW0q+13DsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by PH7PR11MB7641.namprd11.prod.outlook.com (2603:10b6:510:27b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.15; Wed, 1 Apr
 2026 09:56:37 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.20.9769.014; Wed, 1 Apr 2026
 09:56:37 +0000
Message-ID: <29060666-f93b-44af-96e0-576b41db6ff8@intel.com>
Date: Wed, 1 Apr 2026 15:26:28 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] drm/xe/sysctrl: Add system controller interrupt
 handler
To: Raag Jadav <raag.jadav@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <matthew.brost@intel.com>, <rodrigo.vivi@intel.com>,
 <riana.tauro@intel.com>, <michal.wajdeczko@intel.com>,
 <matthew.d.roper@intel.com>, <umesh.nerlige.ramappa@intel.com>,
 <soham.purkait@intel.com>, <anoop.c.vijay@intel.com>,
 <aravind.iddamsetty@linux.intel.com>
References: <20260331102346.1034100-1-raag.jadav@intel.com>
 <20260331102346.1034100-2-raag.jadav@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20260331102346.1034100-2-raag.jadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0036.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::12) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|PH7PR11MB7641:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d5bc5dc-7355-4955-707f-08de8fd4f709
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: nAig1bcCxKbAT+/lhxOcMFuwh4YTWe404AhflKIEAf663o4cFILpT3DqrFLmimdO9/53da9nRbhuJfeE/Wx75ES2eqh7ed7gEKUxj+Eoi17NOSa8Bn8mPHTfwA5mfBAlAvbvWe1U3w9FvTJx9v+Yk3UbZU60IpG/cx5mEqYtXgF3FP5PslpLLlMgpp7i+Z92p8HZNw2ImXmd2L3aWRq90W0qqyyXHGKBTK7eEpPdDf1+VaMacqRAN3DGg9B48JeFASqg8hu38wMVw7bQpCu1JzrrDyFKArWnlwt0BUlZoN4KgH1bUY1hXkLKtvXGAAPcnjv7FWCU9qvX0sRlU0Bt8U3yVqFxSQ+qkxTGmrLPWQUicLOC5ekU2kv7AUsJf1h82rW7K1op8t9mtsOIl7uB1WhgrFFXAQVca3xjB9nOekj1IMjx35usM/cehcyjI89tfj9tN9RwEfBdJFzN+huYOzwprjzDw9ZQkqFDBgTBZM6NxnDznlKGYxfhiRH+CqJI0Jjjg7O1vr8EtBWKhJilDS2e/5mOr0UAE2aPzgONY1s+kmIkn07/cM8Z/lBZnkkIc8nS64FojvWBwzYmM/CCKIuCmdoIMQLosXnTUNW4+MOuQ+X4ZUJ8PiedDfnKuSgzdDC29R/gHpn3NwD1TiNoMfWl3vo/W355bZyDrQD4z1aA3n51l47S3/83Bsc59AokbIbk7wkLEvt4XJgf5cGeHw0DP5in1YSLksPdUFQ6+Uk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aklzMmZCU3JtU3pMSC9BWlhHcWRiMkFQdnZrdmRCQlRJRDhPUWFDL2EvdDRM?=
 =?utf-8?B?TWx3R3BZd2doeFh5ckhEWnNuNUMwUVRRZk0wSDhWbVppb1R4anNRL1pMbnhz?=
 =?utf-8?B?MHV0S3BEZXBwRWpMNEpDbkc1ZzFxQzJhaEZUUGFQeloxUUszcDdGRVJ3Ymox?=
 =?utf-8?B?c09uVlhHUmxwQlRlZmxpcWVTc2pXMXBTV2lWeGpEZFROeFV3UnBmOHB2TCtU?=
 =?utf-8?B?NUJ5cS9CSW9EM1d0RE5IYW5vVy9ZeWZIaDRPZmUzL3c5NlJFalc3T2plemFR?=
 =?utf-8?B?Y2ZYMHBiMzkzc2JYSlNHemUvRzl5R01RYWdrNFQ3ekhScGlobHFONkF3Nkth?=
 =?utf-8?B?RHdsMUNOaDFMb0xXTW4yZnF1S3VzOGlqajl5c3NkOUZHanRyV2VEU0NlOGVI?=
 =?utf-8?B?a1RJRW42UVk1amZMWWhVcVd4Y3o1NkhzdzN6a3d5dDdyNzlodXRSVFJDOCs5?=
 =?utf-8?B?VTR5cWxwQytWaEtTclBDQ1crZEc5T2UzMjdodnAxeFRjZXBSQXBMaXp3enFN?=
 =?utf-8?B?a0tvZXBvZUlXZ1NKcmdmRnNVSjRaSnR2N2RRYnFiRkJJeXRnS0M2WEpuZVZL?=
 =?utf-8?B?UU8yLzQxZ2NoNTNXbW4wNDZMbks5K1MzcW4zU1VlZm94Yk1sVWl0MDJ0eEQ0?=
 =?utf-8?B?aXRSYm45c25wd0hON3ZUbjBFVWpTc1g4NlJkVk8yL3hZbDZMa3UxaFlpbHlO?=
 =?utf-8?B?MjFwcDluWUowdndibmh3alA1VXJYTnVISGF3YnlEU3dmR2loRnpQV09BaHBm?=
 =?utf-8?B?dXNsRTg0VitPT05WTEVVOWlON3kwSjF5bmFWbWM5QzJDNzVhektTRUhJbzFL?=
 =?utf-8?B?V0RaQzFVTE1kOHZWYmJGRWZHMHFpT21qWHNMRUlyVXg0VGlxVVE4dXgzNTdY?=
 =?utf-8?B?VFMvTk82K3I5Mm85SjZwZjJkblk1MTM0Tk9kWHZGSndmb1VUMmFrUGpKVzBJ?=
 =?utf-8?B?WmJBV1lreGlKd210V2haMW5QM2I5bEVweDVDb1hXWmxXWnVGOW1vME44bUhQ?=
 =?utf-8?B?eENKQllSek4rNUhjVUhtMXNBWEdKK2o5WDRwd0h6Smc2VWYzampROVU4N09H?=
 =?utf-8?B?V05HbzVJd0QzblQva0Rxa3JQMXNJWDlSa3ovUWo4UWU3VFNuTE5YV1kvMWxu?=
 =?utf-8?B?bDVrZjJaa1JrT3J2VjBDazVxVi90Wml4aVd0V3ZGTi81UmVjeGprVXlGYzl4?=
 =?utf-8?B?OU5MVjNtUGpvZTV4NXM5UHR3ZnRWR3phaTZXdTB3SDkvVmxSdE41bTNGSUZL?=
 =?utf-8?B?UkNIRUdiVkRPS3YrQllNV21CeXM5cmlmekF0MXY2YS9lMmFDSnFCT3NETndV?=
 =?utf-8?B?NHhGZ3hVU2pxMzd0K1FaYWRPNlR4RGdHV1RXRTRPMEUwdlZOOXFyQWxsZUFj?=
 =?utf-8?B?d1VZbDdvUXVBSmJFTFd2RmhKSit5WWxJTytkQkhZbThCM3o1NDB6UUVOb0pI?=
 =?utf-8?B?RDMwOXp6bTkydm5NejFmb2VkMU1yT3dYVCsxNktVeU5zZkhSWEdvTURaMkd0?=
 =?utf-8?B?M0gzYitVcVVrK1VuZVlYQkVNbDhuN0w4b1JQR0FIWjh6bXcvREhqbWdFV3hh?=
 =?utf-8?B?ZkNlUnBYUjZRUlpFREdlaXZPeDlySTVOUGQvZEd6NGg0LzZFb2F0cUE0U1pw?=
 =?utf-8?B?bDk3aXNscEJKb3hGZGg1ZXc3Vm9ReVBvbmlGTFBzTm1pU2thSHRBSjdjMlF4?=
 =?utf-8?B?SFU1bVlVV1c3aEdiR21wRWxaZ1BHSU9EZU4zcFZwdnVCd0RuUFZZUU5NYyt3?=
 =?utf-8?B?YkY3Njl0ME5lY1lTOFJvOVdxb1I2MHBFZ0Y5dmFJT01mSFdqZ1dIVzRFZ3F4?=
 =?utf-8?B?Tk1zSWdBcVk1Wm1JUHFOMW9hc1R0NEI2OGZWVEE2SmR0cmtEWVVmU0xLbE5P?=
 =?utf-8?B?L2lYV1VuYTZYb1BLcGpMRlBOcnUraXRxM2xna3FqUVFmUWsrL2FyTk15dzUr?=
 =?utf-8?B?SjFnMHZtcDJjS1lwdFJVenUrY2YrOUx5MEZCT2lTQW5scVQzSlRFTGNFMnJa?=
 =?utf-8?B?TEVKemVSTXZycmMyUjF3bGtZWlRUdGpYblpEQVVtVWFXWURPQ3g3M0d5NjBX?=
 =?utf-8?B?eldvdnN1ZmdiVWFLbEtxRHN5Q3Z5cEFCRzJwaXpSeHdqeXlBT25YbnZGV3p1?=
 =?utf-8?B?Q0xsQ1ZRRGJxMDAzV0NFb2E1emVQUitDUFhjOUhPL2VScmt0SFR3aTFrUWVL?=
 =?utf-8?B?TEVSVUh5Qmk2RDlyOHZ2R1lDQlBOaEJ1TVFVNGFtTnJITDltUEZUbmxNWGpY?=
 =?utf-8?B?bG9WYXp5WDhxZnFUMTQvOC96VWZvdVpuWjN4ZC85c3YvclZVSHRaYm8vNFJX?=
 =?utf-8?B?MVJCcG15dXFGWjR6ditDYURrdGljdTFSL0EvL0NQNUo0R1ZqRzVJeUFnNXBw?=
 =?utf-8?Q?OOO6xFx0Pqw5JLGA=3D?=
X-Exchange-RoutingPolicyChecked: HletZBR8Cj3ibVxJSE3ydACaope2PgctqxwGjfh+Mt9ko7/aQNof5LqlcU9Oee+we17RQoIctjrIKioJcExj7q5G/4DozCd0p/GvbrpWxEn4fgK4PB/ydFMfThWcUpowifZgFi6v8qLwYxJ2L0jNZtuukv3o1iyLgNr8HBNFdzOc5ETOj9PFNbJd0sxZmC6jQyjgZerp17kPtGnIO0FI3utcVmMEOKwt7MZVdqYZBk/sORIaRXG7ItOeG3dZB8u9/3FR0rHKiwElZ+pGdAFFHU8IQKjw1i21ea5Llp26WkxQf5YtQEUzzWQt5S2gJnTp/lKB5LxS0mEqL55MDLH+gQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d5bc5dc-7355-4955-707f-08de8fd4f709
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 09:56:37.4652 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b77Uj1VUG3/m4owuiIBKli+t1hD9PxhfAIMp2Oyd+MXvTTwXzryDwf1RXwS4DpAhnIEh+qpG6s6oN+YtUFeKB8H8MKqUOV3X65tZsFzAqx0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7641
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


On 31-03-2026 03:53 pm, Raag Jadav wrote:
> Add system controller interrupt handler which is denoted by 11th bit in
> GFX master interrupt register. While at it, add worker for scheduling
> system controller work.
>
> Co-developed-by: Soham Purkait <soham.purkait@intel.com>
> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
LGTM,
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>

> ---
> v2: Use system_percpu_wq instead of dedicated (Matthew Brost)
> v4: Handle IRQ before sysctrl initialization (Mallesh)
> ---
>   drivers/gpu/drm/xe/regs/xe_irq_regs.h |  1 +
>   drivers/gpu/drm/xe/xe_irq.c           |  2 ++
>   drivers/gpu/drm/xe/xe_sysctrl.c       | 39 ++++++++++++++++++++++-----
>   drivers/gpu/drm/xe/xe_sysctrl.h       |  1 +
>   drivers/gpu/drm/xe/xe_sysctrl_types.h |  7 +++++
>   5 files changed, 44 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/regs/xe_irq_regs.h b/drivers/gpu/drm/xe/regs/xe_irq_regs.h
> index 9d74f454d3ff..1d6b976c4de0 100644
> --- a/drivers/gpu/drm/xe/regs/xe_irq_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_irq_regs.h
> @@ -22,6 +22,7 @@
>   #define   DISPLAY_IRQ				REG_BIT(16)
>   #define   SOC_H2DMEMINT_IRQ			REG_BIT(13)
>   #define   I2C_IRQ				REG_BIT(12)
> +#define   SYSCTRL_IRQ				REG_BIT(11)
>   #define   GT_DW_IRQ(x)				REG_BIT(x)
>   
>   /*
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index 9a775c6588dc..e9f0b3cad06d 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -24,6 +24,7 @@
>   #include "xe_mmio.h"
>   #include "xe_pxp.h"
>   #include "xe_sriov.h"
> +#include "xe_sysctrl.h"
>   #include "xe_tile.h"
>   
>   /*
> @@ -525,6 +526,7 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
>   				xe_heci_csc_irq_handler(xe, master_ctl);
>   			xe_display_irq_handler(xe, master_ctl);
>   			xe_i2c_irq_handler(xe, master_ctl);
> +			xe_sysctrl_irq_handler(xe, master_ctl);
>   			xe_mert_irq_handler(xe, master_ctl);
>   			gu_misc_iir = gu_misc_irq_ack(xe, master_ctl);
>   		}
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl.c b/drivers/gpu/drm/xe/xe_sysctrl.c
> index 2bcef304eb9a..afa9654668a2 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl.c
> +++ b/drivers/gpu/drm/xe/xe_sysctrl.c
> @@ -8,6 +8,7 @@
>   
>   #include <drm/drm_managed.h>
>   
> +#include "regs/xe_irq_regs.h"
>   #include "regs/xe_sysctrl_regs.h"
>   #include "xe_device.h"
>   #include "xe_mmio.h"
> @@ -30,10 +31,16 @@
>   static void sysctrl_fini(void *arg)
>   {
>   	struct xe_device *xe = arg;
> +	struct xe_sysctrl *sc = &xe->sc;
>   
> +	cancel_work_sync(&sc->work);
>   	xe->soc_remapper.set_sysctrl_region(xe, 0);
>   }
>   
> +static void xe_sysctrl_work(struct work_struct *work)
> +{
> +}
> +
>   /**
>    * xe_sysctrl_init() - Initialize System Controller subsystem
>    * @xe: xe device instance
> @@ -55,11 +62,7 @@ int xe_sysctrl_init(struct xe_device *xe)
>   	if (!xe->info.has_sysctrl)
>   		return 0;
>   
> -	xe->soc_remapper.set_sysctrl_region(xe, SYSCTRL_MAILBOX_INDEX);
> -
> -	ret = devm_add_action_or_reset(xe->drm.dev, sysctrl_fini, xe);
> -	if (ret)
> -		return ret;
> +	xe_assert(xe, xe->soc_remapper.set_sysctrl_region);
>   
>   	sc->mmio = devm_kzalloc(xe->drm.dev, sizeof(*sc->mmio), GFP_KERNEL);
>   	if (!sc->mmio)
> @@ -73,9 +76,33 @@ int xe_sysctrl_init(struct xe_device *xe)
>   	if (ret)
>   		return ret;
>   
> +	ret = devm_mutex_init(xe->drm.dev, &sc->work_lock);
> +	if (ret)
> +		return ret;
> +
> +	xe->soc_remapper.set_sysctrl_region(xe, SYSCTRL_MAILBOX_INDEX);
>   	xe_sysctrl_mailbox_init(sc);
> +	INIT_WORK(&sc->work, xe_sysctrl_work);
>   
> -	return 0;
> +	return devm_add_action_or_reset(xe->drm.dev, sysctrl_fini, xe);
> +}
> +
> +/**
> + * xe_sysctrl_irq_handler() - Handler for System Controller interrupts
> + * @xe: xe device instance
> + * @master_ctl: interrupt register
> + *
> + * Handle interrupts generated by System Controller.
> + */
> +void xe_sysctrl_irq_handler(struct xe_device *xe, u32 master_ctl)
> +{
> +	struct xe_sysctrl *sc = &xe->sc;
> +
> +	if (!xe->info.has_sysctrl || !sc->work.func)
> +		return;
> +
> +	if (master_ctl & SYSCTRL_IRQ)
> +		schedule_work(&sc->work);
>   }
>   
>   /**
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl.h b/drivers/gpu/drm/xe/xe_sysctrl.h
> index f3b0f3716b2f..f7469bfc9324 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl.h
> @@ -17,6 +17,7 @@ static inline struct xe_device *sc_to_xe(struct xe_sysctrl *sc)
>   }
>   
>   int xe_sysctrl_init(struct xe_device *xe);
> +void xe_sysctrl_irq_handler(struct xe_device *xe, u32 master_ctl);
>   void xe_sysctrl_pm_resume(struct xe_device *xe);
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_types.h b/drivers/gpu/drm/xe/xe_sysctrl_types.h
> index 8217f6befe70..13fbf2990280 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_types.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_types.h
> @@ -8,6 +8,7 @@
>   
>   #include <linux/mutex.h>
>   #include <linux/types.h>
> +#include <linux/workqueue_types.h>
>   
>   struct xe_mmio;
>   
> @@ -27,6 +28,12 @@ struct xe_sysctrl {
>   
>   	/** @phase_bit: Message boundary phase toggle bit (0 or 1) */
>   	bool phase_bit;
> +
> +	/** @work: Pending events work */
> +	struct work_struct work;
> +
> +	/** @work_lock: Mutex protecting pending events */
> +	struct mutex work_lock;
>   };
>   
>   #endif
