Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82BA4C5CFDB
	for <intel-xe@archiver.kernel.org>; Fri, 14 Aug 2026 13:00:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2432910E555;
	Fri, 14 Aug 2026 13:00:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H67NhYx2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B00410E555
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Aug 2026 13:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786712444; x=1818248444;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=fOQfECvATEni0Aye90ocaf9jXxW67LqaLbp0AFi1qEo=;
 b=H67NhYx29sb90/5CKvLuudW+B9Mgb/erfs+7P6b2S5HOzuHTIYfY2eIy
 yHyNqY4gN/SmkOZOS3fNDo9h5SRZ7PrMiZDuyz91lGe3IBLdypx1VvaUD
 daLNQgDOH8Sb37a+7Qknh9KNr8b3mJWbSIDjlrt03RzV/G62gGqBYyO+y
 gf717/qXHYB4hfTRFkrhO5V0Tpw0a8hRucqWqxnJR81Zd+rdA1C5fNkXM
 LxrnFlORSBw+3KIU3W9M8s0lKky92N29znYXx6A95qHjUD90l7gy0jLy2
 p0suXncn4yw2epMdbqcsb8dRZ66guiB5RhVgCyP2nFP86hqi+eROlxHWN g==;
X-CSE-ConnectionGUID: XC7Ggg0MQQ+3jEEaMGEUvA==
X-CSE-MsgGUID: Mct3DpmcTtOZrA6Ihav3cA==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="87173115"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="87173115"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 06:00:44 -0700
X-CSE-ConnectionGUID: c14Kvt64RxORDhuw3TUKgw==
X-CSE-MsgGUID: h2/G1fgtRM+nMFyqPdHC6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="257996817"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 06:00:44 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 14 Aug 2026 06:00:43 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 14 Aug 2026 06:00:43 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.47) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 14 Aug 2026 06:00:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lsRFmbeVdVqVbAduw/F7MYEbNnDSWkhoaPaNJgOhKAwEiClZp5xDx6Fd15LoNzLBx4WK5p+GIIYJ9WYijESfNitGzap/86GScHwGaD3QlwmaF78+T5SXjZyvbE25gMqvZ/hESq4sT4jFrrX0oP7vH9paK8dWVAP/lb8z7AfTt2PHQIFcABTqJJ5YkR7y+Eylbyx7scVkj4FwVwdWcNZ9gJwByXMnryG59melK1b+623ShSTc02ugdxdcwpK0Ss4XtLXAT5MO+ml8RkqGhNf+OIBZu1ColtIilwPaQd/QI4eoFOX0stWEEsNeNqOz+I8UIywZly8GaBrpT1gAQAQxdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GU6mcdj8JRtLMjbqNTC3dsqCL/CWbo8lHz3KXx/Kctw=;
 b=dVI1y/h79gsS/aAkvpFtzmk1DEBtoOwBUfXGJ/DTcnJB6Fn51IcuOIbuhwjCM4jp4VhHyZ8eaDJE2mg1WOrLz36USqDAMAYCqlfxQs0d0gFsw+QB6+bRYtCp/8rK3pi/EdkGoGff8ERdv893B9SLeYvsHBs+DFKnfbaVkNZgo+RF3e+LlQoiyJ8ZD9tAL5Pw+cxH5QHcuL1aqnnQDmzUquXaTVRm/aRUA6pRTIdePAv07h6jx5dQ9XOICIigH5cA3mQVm/YLJkSWJswURKbN+VP4T+PUF2gBrcK3QOgxZQWivVKFOWXBdCAOnNPTM/Ov6YFs/kXwZKjbBeNxug06AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by LV2PR11MB5975.namprd11.prod.outlook.com (2603:10b6:408:17d::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Fri, 14 Aug
 2026 13:00:35 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%4]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 13:00:35 +0000
Message-ID: <42553db5-2467-4891-b579-431ae9fa1e4c@intel.com>
Date: Fri, 14 Aug 2026 18:30:27 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 23/32] drm/xe/survivability: Report 'Runtime Mode
 enabled' status using SIGID
To: "Tauro, Riana" <riana.tauro@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, <intel-xe@lists.freedesktop.org>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Aravind Iddamsetty <aravind.iddamsetty@intel.com>
References: <20260812191450.11690-1-michal.wajdeczko@intel.com>
 <20260812191450.11690-24-michal.wajdeczko@intel.com>
 <f203ca92-c042-46e1-be7d-773f63d9bb5f@intel.com>
 <d2bd1735-94bc-44cb-8fd2-dbde99db4ec9@intel.com>
 <5db999eb-2925-4301-ba60-8b90f56f8a5d@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <5db999eb-2925-4301-ba60-8b90f56f8a5d@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0097.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::14) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|LV2PR11MB5975:EE_
X-MS-Office365-Filtering-Correlation-Id: ceadf3d4-88bf-4c53-4268-08defa040796
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|10067099003|4143699003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: Rkhk8RanzYRLKWqOLvdgALlWDxLfeH4WZoREtFxHC65nyoN+Vc9BDgEpRakm3UXLSu960lBhdXb8SFcpFxAip2kiwxSV3zVqBze3/aEqfgccQ4GbnD/gdsDt0xFEsLdtGuSlEvswDBy1fW8D978Gg3YjSZCjZtz5e8JaTiB7m5qURUUCRofkViPAmyChGZAdSNWyvioDPBzoVPXLd7lmq1h9gJ8tmzmq+RJ7qedghxqexnBy3vi80sGCPLiD69xrBQ0iFOlxzjxcLjr988az/ehhr5um7T/LILx/docGYoyAdXIB4Ch58d/0Y8oEGdPKkbuHMMeqmjnXfquBKRquSI4deuSluHkhkOAN5r+p6+p8b669fwoQ8Kr10M/CeMKGLmVzc7xRtKW8XvDgWZr8w39Gdvore+/OZysAj6LNHLHo21WZ49jal0iKLm3yMRM5iiDGZVAg7Dxeg5bcmw3pTESnS3KzNOTY6SoLmdlBXbLxc2LM7QViJtci+uRBiGYKakAuNqAQTBjAKMP/ptvI7XPRya6btLsIsqYJSyC/MIIz8cdZyd/6sFPYMGlUm9w8vRKzE/msm4HYEkvjj48AWKNxWenP3zKobnZuSQVicj4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(10067099003)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aGhkazdtbkYxV245dDJ5dllsVTRJRjU0R3FWREd6d3pOOCt2dzZ0U0xsQTU2?=
 =?utf-8?B?dEZObmdmTjlrR2R1aFIvZmVnUHVNb3YrNHVwY0JmTmVmMFRMWHZNOGVvOVFQ?=
 =?utf-8?B?RWlqOUowVms0ZGY4MDJpeXgvYkZkM3lqRmJPOU1pMWxqUEp5UndwYmRBZnM0?=
 =?utf-8?B?VzZlWGZPL1d3YWdJTFhsS2Ztbk9OQXRrNFUxQjJYNUhENElNZlQ2d0hJUkxN?=
 =?utf-8?B?bUZ1L293OFUzc0IzQjgwdkhaYlFtWG9VallwWm5qUW1zaDdaVlFlZ2tIUWJy?=
 =?utf-8?B?Ty9DRTVVYTlnT29wa0JhSmNtclRSak1TQlp0T1ZOUmdYNnpKRWtTSkMrMnIz?=
 =?utf-8?B?YnhuWjB2cUVjKzFXaFF3bDJnNkxKS3JvSFp6M3cxMmNwS1dkM005TUVmQ3k2?=
 =?utf-8?B?cS84REVpRXhxWENwbDhQOEFwbXNQQ3JNbXJpcGs5ZUtIelEzdXkrTE5wSzhj?=
 =?utf-8?B?dnZEYWxucnI4cGlkUUZSbkJ0c2pmZi9FdllNRFFpbE5JWXp1K0N6U1VNc0NC?=
 =?utf-8?B?elpiWnRQZFFLaE9oTDY5QzJSci80NWF3eWJFZ2R6Yk43TTRqc1Bvc29NOWZ2?=
 =?utf-8?B?d0VCd0o4M1JNUDllVFpLSVMxWFVUQjJ1dS8zdHJndldlQUo3cXZsTnp0eVli?=
 =?utf-8?B?L0VMcUxaZm0xTkxYdXZCMXVxeGJjcExScHIzTUlNQ3Brd05SQ1ViSDRhM1Bi?=
 =?utf-8?B?UFJPV2dxRGloS0Q1b2ZDdXEzUkxYc0c3UkYzQlJCUWQwY3VIY3RVS01YRDZP?=
 =?utf-8?B?aFV5NTJhL1QxTjZNTnQyUGdMSXFxZGgzMHBvemplOVA4UGVzT1l6UUxOcUNJ?=
 =?utf-8?B?TVlHckFKNnRlUXNLU0loUlYyVFc1Q3ZWT3AxSDhRUEozQ2plV2l0U3JRSXZi?=
 =?utf-8?B?aXNuOWZyNHJEZXJkOHEyWmRRUFp2VlNWRE8yTjRUWXR3SDFHaXJCUk5tU2Jv?=
 =?utf-8?B?WHR3MVE3ZGJPZERKQyszZEdUK3gwcUZ4Zmp1VDVCY3hESmhXa0FEYytmVHBn?=
 =?utf-8?B?VTQzZnlGbm5sT0FqSEFIWWhyNzIxekVFQmdUaEk0amllWHdySHExdmswQzha?=
 =?utf-8?B?SEMvdG9POS9RNDdUb0ZkQWNDWEhvWWN0YUErenBtRXU3akR6UllqWlA5R25w?=
 =?utf-8?B?T1UxS2JqUE1wVU9BSUJPZFZrYjRLSG13TWlFajI1VEZQYjNjOFNaYWFjdGpS?=
 =?utf-8?B?ai9YZHBPdXZBbFp5M1BpQlRJSW9pcEpYSjVQaXdBcllmaHRmYTBCSFdCWUZE?=
 =?utf-8?B?eHU5THc4STJCeE9RcHQ1dm1lOWVldDU5czBkYVhUeHEyUGhDN3FBT0FOV1hq?=
 =?utf-8?B?MGROQkpmTU5maXA2SVZvL25Wem1EaXJnaFg2SEI4SDdLVDdVYUczay93Zlh3?=
 =?utf-8?B?eFl5THpCVEUwNHNIRVkyQnc0c2M0dHpwVDkyNWJVclJGSG5relNGUEVXM3Zy?=
 =?utf-8?B?cU41VXN3ejk0MFEybFBBNHh5Q2FTRUhNa2N2MXg5cFpRTk1INWRwU1doVldr?=
 =?utf-8?B?NlpDT3MyeUwxMzlxTFpVZCtMYkRJMStuRGkrYnpyK2s0Njdidk5rdmFwYWF3?=
 =?utf-8?B?d3E3SlE2bHYrTzZrTWpzYnV0NHh4QTk4YWROYVNFdXpxdkVvamJoRXVMSGFl?=
 =?utf-8?B?MlRNMys5L2dtYW5RS3ZaeUpSU2hlNWpZUVd6RVJoSzR6SUh1NGUyK1AxNVVm?=
 =?utf-8?B?VnhXR2MzNjBLSEZwVzgyQldQS2hIWlhMcDBZdXVxelUyTDJkbE81NmJ4NjBh?=
 =?utf-8?B?Z0w2OWs5MWFURGJCQVBXTWsvYm5kWTlzdFRkRDltN3AxaDhZdGhtL2hhU3NS?=
 =?utf-8?B?cHZNeTJUOVRNbmhSV3hFRHpxZ3BJSHhPZ1N1dGF2bVJBY2hmZTRPTFptSXht?=
 =?utf-8?B?QnRwekpENTVKMFczWFJOTDJUM2dtb1ZzNEYwZTdQMU1DRWJWZ3NKUDN5ajFE?=
 =?utf-8?B?WDhycFh5bGc1em96OEFtSWF2eUVTenNlR2RBYWtFdktpak1UZU9BUWhNVWw4?=
 =?utf-8?B?ajNvdW5zZjFQRzJValhzdEJXZVJSOXNSK2pzTU91WlowOEVRYml1aUgyWjRK?=
 =?utf-8?B?UWcrbFZtajkyMVZyVnhQRlRkb2tPeS94RHV3TUcrRWRFWk50WXVXQXA0MlVw?=
 =?utf-8?B?RDY0TXg5VzlrL1djL21vcXA5cDBoZzRWbXJPTnpGSnlJNHFtZEtwT0pVd29q?=
 =?utf-8?B?bTcxdEFQaVllWlpmVjJWU1pKakNJaFVxdEJ6RkVvRE1EUnNrOTNnOHkyV09p?=
 =?utf-8?B?RkZRcW80QTNEUERRT1dqMzNMMHgrdHlVZFdmZ1RGQUZJUXVYR1ZyN2xwenlD?=
 =?utf-8?B?MmE5VmN4UGVpaVlLOXRwb1dhVy9jVnVUTm9HdHZQNzVUaEpNY1ZKdVhiS1ox?=
 =?utf-8?Q?qe5gA75ekdHwqCP4=3D?=
X-Exchange-RoutingPolicyChecked: FPzDv0WM6Qib3dWsCleX6L7OcEHYXy2GZf5tHPxF4BrU7aolJ0pzfxj6vfOKs3LzukJb+kv4v/4sHy7MP++mUjXx6fRIuK+DThxNcpMsxRAFpnuJZQlhGlYh84dsileCw0uc2h40kNFHP7X9bpSQCapJ5jx5RBx6uSP9hTLbr0UioiaY52vlR30I10mP0hkDgI6cYVN0jK6uUb+etGll6iwV8B5jA+JzqaMcjuFJ0cTGDloWRrPFNjWyFOuOiJZ4lzJ1kIp5oPXprTB8E6gt8pVEKIznQgPzYTKqwdFm51AcldiSju/P1wY6Y66C345hQ9c1PKosjxqiu+b1rMib4A==
X-MS-Exchange-CrossTenant-Network-Message-Id: ceadf3d4-88bf-4c53-4268-08defa040796
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 13:00:35.0659 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NVt0+v4gv69JdSPPfycKQXpzF7NcipSKSo2TLUFC7JfGk8MViqbRYuQupYstBjXv/CmAjLwdNSchBQ5neHxS4jIVSTDXW0xzuI2QXNdYwTY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB5975
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


On 14-08-2026 12:36 pm, Tauro, Riana wrote:
>
>
> On 13-08-2026 18:16, Michal Wajdeczko wrote:
>>
>> On 8/13/2026 1:40 PM, Mallesh, Koujalagi wrote:
>>> On 13-08-2026 12:44 am, Michal Wajdeczko wrote:
>>>> Report 'Runtime Mode' status using various xe_log() helpers.
>>>>
>>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>> Cc: Riana Tauro <riana.tauro@intel.com>
>>>> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>>>> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>>>> ---
>>>>   drivers/gpu/drm/xe/xe_survivability_mode.c | 10 +++++++---
>>>>   1 file changed, 7 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c 
>>>> b/drivers/gpu/drm/xe/xe_survivability_mode.c
>>>> index ebd288986c11..5d3315ac735c 100644
>>>> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
>>>> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
>>>> @@ -18,6 +18,7 @@
>>>>   #include "xe_mmio.h"
>>>>   #include "xe_nvm.h"
>>>>   #include "xe_pcode_api.h"
>>>> +#include "xe_printk.h"
>>>>   #include "xe_vsec.h"
>>>>     /**
>>>> @@ -405,7 +406,7 @@ void 
>>>> xe_survivability_mode_runtime_enable(struct xe_device *xe)
>>>>       struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>>>>         if (!IS_DGFX(xe) || IS_SRIOV_VF(xe) || xe->info.platform < 
>>>> XE_BATTLEMAGE) {
>>>> -        dev_err(&pdev->dev, "Runtime Survivability Mode not 
>>>> supported\n");
>>>> +        xe_log_err(xe, SURVIVABILITY, -EOPNOTSUPP, "Runtime Mode 
>>>> not supported!\n");
>>>>           return;
>>>>       }
>>>>   @@ -413,11 +414,14 @@ void 
>>>> xe_survivability_mode_runtime_enable(struct xe_device *xe)
>>>>       create_survivability_sysfs(pdev);
>>>>         survivability->type = XE_SURVIVABILITY_TYPE_RUNTIME;
>>>> -    dev_err(&pdev->dev, "Runtime Survivability mode enabled\n");
>>>> +    xe_log_info(xe, SURVIVABILITY, "Runtime Mode enabled!\n");
>
> This should be xe_log_err
>>>> xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_VENDOR);
>>>>       xe_device_declare_wedged(xe);
>>>> -    dev_err(&pdev->dev, "Firmware flash required, Please refer to 
>>>> the userspace documentation for more details!\n");
>>>> +
>>>> +    xe_log_info(xe, SURVIVABILITY, "Firmware flash required!\n");
>>> IMO, we need to use xe_log_err (recoverable) here instead of 
>>> xe_log_info.
>
> Same here.
>
>>>
>>> Already mentioned in original changes [1], runtime firmware errors 
>>> cause device unstable:
>>>
>>> [1] 
>>> https://gitlab.freedesktop.org/drm/tip/-/commit/a2ca0633a0fef925a0d8125d8f3e4495a5ecb310
>> but in recent comment [2] you said that Arch team wanted that to be 
>> logged as info rather than fatal
>>
>> [2] 
>> https://patchwork.freedesktop.org/patch/743324/?series=171022&rev=3#comment_1373731
>>
>> @Riana, @Rodrigo, @Aravind ?
>>
>> I need a decider here
>>
>>>
>>> As I know xe_survivability_mode_runtime_enable function need to 
>>> carry errno as parameter to pass into xe_log_err,
>>>
>>> however we need to create separate refactor patch for that in future.
>
> Why do we need error no here? It should be 0.

To pass correct errno to SIGID helper function.

btw, for that we need refactor code, which we can handle in future.


@Michal

Please post complete code to check.


Thanks,

-/Mallesh


>
> Thanks
> Riana
>
>
>>>
>>>
>>> With above changes:
>>>
>>> Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>>>
>>>> +    xe_info(xe, "Please refer to the userspace documentation for 
>>>> more details how to flash the firmware on %s!\n",
>>>> +        xe->info.platform_name);
>>>>   }
>>>>     static void log_survivability_info(struct xe_device *xe)
