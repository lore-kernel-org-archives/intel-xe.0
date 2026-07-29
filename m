Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1444C54F51
	for <intel-xe@archiver.kernel.org>; Wed, 29 Jul 2026 07:23:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 782D610EAC1;
	Wed, 29 Jul 2026 07:23:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hMx9iQi2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8E8810EAC1
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Jul 2026 07:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785309839; x=1816845839;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=k2i28nm8lpKkw3MAK5zQi/2KgO0TTDfZYTVLOCpTDkQ=;
 b=hMx9iQi2w34BPqy0PytNF2VEQ1I7j66RFLPWNj0y06EK39zTJq4/gcz6
 zHojxKsyIwQzj3hniopBi9TjO0hXYN0RKRnS6pKdp1MzqMkn5zwnIQqG3
 Mk3WfBjmF2yR3UUkI14XGdTPQqDS84r8FfhZZD6MuXZayxsDQ3VfbA5dq
 M7FK9smu9rxp3+XEs/vE69KpmQ2MzK6FdN0NpXqAKHQPlUYERYB/vsNyu
 7FEkJL4KECBGC2qMYvz+LdRJbJ1nVQ8XlF4FFisQ0dB9Q8DpFIPmUg1yL
 III36hyg4ZcpmkAcMbWf3qL5lOBKXvqTZWnKr8Oli0GfOR8TmSOhXIFFv w==;
X-CSE-ConnectionGUID: By5COjI6TYur2dCedF6wRQ==
X-CSE-MsgGUID: n/vghQd9SMqcAopN7pgqLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="73443839"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="73443839"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 00:23:58 -0700
X-CSE-ConnectionGUID: vav7K2rIQoueumP1CYKyHg==
X-CSE-MsgGUID: V0EHO9NFSemYXWzRLyxvGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="253600330"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 00:23:57 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 00:23:56 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 29 Jul 2026 00:23:56 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.26) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 29 Jul 2026 00:23:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qFUYV8uVEXI2XQQOHkSIDFEi2vVdcPw2SVFMF1RoVZgvx5FohY3IPllzvI1KG7lEMwRr4YxQKLiuuuDUO8UgObdMsrL7+bbLHGtiP3rHtKBx+a0bpqqR7YlaJKGBi/eHc1INwkRf4KLFJmXUtmlXZMJM4H6fS1cvR7Ew1g3mS6lrWesC2yuCIjY4W1AktELvgcjI80+e2TMghxt1hfioF4oTDUBvnMSBpy6mwwok1oRuUdIM59V3dNAWg51ZbVnCJsWncfwXaXNb9IsM/wMiUBgXvasQDKBJOHJSIDBZx97o55uJdqVoJPL8qTjz2mOYEeF9o3oZ9VzwNkrRANkIbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PM/zj27s7UzehI1XtWIr9J8HffgR2lqBCwCGELSvUTw=;
 b=oloIo1Fx3hxOt62sHw8DpzyJ6qzhHmUuteIji2TudUow3ViBtaRlBsr2Pt3nDYTs9YiYGvNGktirtAugAXjlW2EkwrM+1VgTd2lSYiu0Zg9JqrSHom7q/uQQ2dK8cdkJES8qDSkAULN7jvZSu2g5x1BgC+Kqn9WFRL7uxloP+mjPznfAw5enHbYktc/6J3eu7XGs7VPfrwDzvjlp2RwiV0KncXIn82vv6DyIGwJaVco/MbyH4WO92N7r7jyZzYZdae+aCVPIznNgzgcCFWd09lmi+vcJZvuIIftkV7Z5cM6roIJ/hAaD8jp9ufGzn2bTz/FvYEDj1cuI6OhwPsqIdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6209.namprd11.prod.outlook.com (2603:10b6:930:27::16)
 by IA4PR11MB9345.namprd11.prod.outlook.com (2603:10b6:208:56c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 07:23:55 +0000
Received: from CY5PR11MB6209.namprd11.prod.outlook.com
 ([fe80::a805:a5ac:cf5c:8671]) by CY5PR11MB6209.namprd11.prod.outlook.com
 ([fe80::a805:a5ac:cf5c:8671%5]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 07:23:54 +0000
Message-ID: <803f1acf-4e20-489a-a44e-abe590cbd45e@intel.com>
Date: Wed, 29 Jul 2026 12:53:43 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/22] drm/xe: Introduce xe_any helpers
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Matthew Brost <matthew.brost@intel.com>
References: <20260728161039.579-1-michal.wajdeczko@intel.com>
 <20260728161039.579-2-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20260728161039.579-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0242.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:223::9) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6209:EE_|IA4PR11MB9345:EE_
X-MS-Office365-Filtering-Correlation-Id: 794606d5-10b9-480d-a44e-08deed4257eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|56012099006|11063799006|10067099003|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: d++A1B1kaYuPA+57CgwQsjtCGWqr7CgFyNHAf6vQjcXWF27PNrcdLet9djuRtuXylzDGV0GthKJbdhKskJmyKbToBtKgRl03hnHpUSer5cDoor6Y/M9B1OjHbZHzdilBkvEQL1TMqIWnakVxieo9Z467TDlCi9XpJ8raBob07CzipSbj7lON92UI+kxYT+/0SqhFdWaPScoJ/uAr9r5/BgpmzhSbIScF7JF+9mJG8tVZfD74RGSIPXAzKSNhGjvXhcsxTwKd9qoY7/SC+iPhRh+MILobTXagMjoXL97lejezDkqW8Bi2yYvl1ni8AGCjjUPCMWVuFed4BYJn522fuHr8bt+Gejg+WNEN6N+546NA+dsrqdP6QbLEk+2UgED7TqJypigR6Wle9s1QP3YWoul2SqabJPPihze1DbC6X9OWyvLopm+LIcQVd1GfVi1EgtPi7R7T1k7ypc0QXefk4/pyuKP22w1L4P/PK1o4IOAsR8vzn1VYubAl1DW1TfiNp8u9qHDjp2BtSD3Vl6co9Wi3f7ncFef3nAKGZkMfqEcrPH8mJufcxyjcvoWWk4VIZI5wMllKy5tSZnncfSTJbmShaQ6vK9LGkaS+aigAxchqtm8j1/TpeMmDz5jHp3I3QtyA5LnsqofDKL8fvrlJs85qsMHLuXd6JYmQBJy3HRA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6209.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(56012099006)(11063799006)(10067099003)(4143699003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SkFVVE9lTjJYTUJYendJZjVLSFloSGJMeXdST05QY244UE9nbVAzSVVMNEMy?=
 =?utf-8?B?RElEWTlIdkYrSU5nbmFuazJYbitpSTJyeW1HR3V3dW53eFFDMXpIUGtldWhs?=
 =?utf-8?B?OUozRnZKMXRXUE9IaTJubytHUFhqaUlGekNvQ0FwT0UvVFVmT1QzM0IvQXNP?=
 =?utf-8?B?a09JV25RNUkwdDAwY3ljaDkxelFuT2tOa2lnd0cwd0FwMFhta1NMbENtVjJF?=
 =?utf-8?B?dU5BZjhKbVNJYnBWbExXbFpkOE5FNWttZUVyZkp5ZnVXL2pkNUcrSGFvdFRC?=
 =?utf-8?B?RElnR2RMc1FHYnlkd2VmbnVMZkdJV0dNWnAyRHBYWGE3TGdybHpTNkhOckwv?=
 =?utf-8?B?MVlCeUthSWlWQS9TVjd3RkVpYzlOb21qZnBoSnIvS1oxZFBCUXVCTzF2OTcz?=
 =?utf-8?B?M2toWUJYb3dDbDAxQUxUNWJwQ1FzcUdqVm9FQzhLOFVjSE5yUC9Xd2puWTFW?=
 =?utf-8?B?Mk1KWVZkOEZ6VmxsYXozWnRNdjJud3VqOUxaanBXQU11YWNXTndKMTZGOEgr?=
 =?utf-8?B?MjVzNFFhbUhmaEN5dGZCZHhLUWoxWXA3U3Mzdm5VNnhOd3VYbDdjcEhVQlk1?=
 =?utf-8?B?MlZ0cUpOaGxGcUFrWnlzOXYzRk8xOXpFVnB5b1pHOGhHSlJLNnpybFlVRmM2?=
 =?utf-8?B?TGFwbnI1dFVQenNMdmRETHI0NXFpTzVHWExkMklibkQyNUoya29pMlpwWDJ5?=
 =?utf-8?B?ZzBsVnZFRjBZYXhCUmtxZjNsTFhZaTR3ZjF3L2hMRG52ZzNHSndkaFBwSlUz?=
 =?utf-8?B?dWIxRlpDcmVqckNOejNsMGtYNnN3dlNXT1IzYXQ1SmFkTXdvQ1lxalFiZUZK?=
 =?utf-8?B?YWpDSUIwck5ncng0Y283aTNIYXFmSmJxTXBnQXZpWnZYaGNKOXR5Yy95Y2lr?=
 =?utf-8?B?VFhxK2Znb2RzdUVGNFFrV0tjRFlhdnFjTXNOZUhFd3RVcGRKUzRNYzJKdDlI?=
 =?utf-8?B?Vlc3Q3ZtRFFFVXlOVWxCbVAvVHI4OUxQYnhMNC9Td053UHdFYzIyNTVJaGgz?=
 =?utf-8?B?cmJyZHNIOFM4cDJ5ejBmMDNvdlg3b0hHNVFOTU9RTFQ3bVpqTFlaTzhvY1FZ?=
 =?utf-8?B?ZUhNUmEzd2NLRXovLyt2Y2FjWEppYklKbFAwVThjMVp3eWtxOFYxaXQrZDcr?=
 =?utf-8?B?dmtkZFBpWUVaQ2VqTXdadEpEc3J1OTh5T2c3RGRsbzlaMnpBUmpGa0Jmcm1u?=
 =?utf-8?B?ZnViUFRMcmlrdnN0S3pOdzNlUXEzNFpBek5sLzdjVmNXbVNSZUc0VHZucHdN?=
 =?utf-8?B?VFlLeU1iWDN2MHJDK1MzYStqcjlIVWk0b2NCSk0vd1pPNE9xUVl0VVUzWkwv?=
 =?utf-8?B?am1RRzFuZlNoTk90aFd3THg0WWx6MTlCM0M3TDZWUUVTOXdhYjBETVEySEhI?=
 =?utf-8?B?djVmMkV5T3Ruc3NJZDA4VTRVM3I3aWNhMHFqS3N2eHVxVFRjQ3JyQWgzTUFq?=
 =?utf-8?B?YWlIcHdzTWRrY2hiMFhWV0RwRkpRQU1GNXpTcFdRRnUvSmpPdFlONGc2bVk5?=
 =?utf-8?B?bVh5UmFYbElGU09VV3NHNENUSnJ0cW9NdGc5M2tBcVdhcm9hMFlPVnZXS3R2?=
 =?utf-8?B?SExVaDZ0Z0p3aWZaVWdYaHNxS1VvMjhzaEhOWTRJRnJwUzFDMy83dWdIenNQ?=
 =?utf-8?B?R2ZULzFUT0VxNk9vdmc3NndiMDBicEdhY01KL09EUm1xa0orMVAzOFhKb1Jo?=
 =?utf-8?B?OVJtWHk5ZFoxUSswaCt1NXRnSE1zWmUybDhyaGhPOUI2YU1pbncrbHBKVlpK?=
 =?utf-8?B?c2Y2YnNVMHJETFE3d0JNRlcwbHNSMU5kckVkUThrT0ZRSS9OR2dvNHpoWmFv?=
 =?utf-8?B?dGJ4elZ4OXhmZ2w2ZnlLWEE3L2IvQlZvTXdZTnJ5a1hyeGlYajhLZGg1MFpo?=
 =?utf-8?B?bGlEdnNTRmR0b2VLc05RL1h4RWhnODVTK0VmR1BiMlBhMUhPVW11QnhKeXlR?=
 =?utf-8?B?K0w1TnlDSHlrV2tkVW4yNzRLN2RlN2dEWE5kaUxLWVNuTFk4ZXRIUU0wNm1j?=
 =?utf-8?B?LzlYTXJaNy9MbDZtY3o4OE5lSlEwWGk5cXMvWGY5V1RYdXRudkpxZmUvUnNE?=
 =?utf-8?B?V00yUFhoaWdBbXhjclI2cGV5QmpzV09SQzlEQUtxb3hQdjU4cmFDckJGNTRW?=
 =?utf-8?B?SzFkbnR0b1VHcThzTHRJVGlQYkZYMzI5OEthSTc1b1R2MmJwWHBTUW1EL1hQ?=
 =?utf-8?B?WWRlbHczRUF5OEdnY3Y2OXFuU3hGQml2NDJ1aHo0by9Zd2x1WGJUb0pZcDcv?=
 =?utf-8?B?WXpVQUk1UGtxWlp2WmVtaHdibTFiWXVrTE44a1llSWV6V0czUk4xVWp6WnNK?=
 =?utf-8?B?M29HdVZxbGVKK0l0MjAxbjFxbjgwbFJPTXFhY3VkL0dML3BpMVdRVGgreElB?=
 =?utf-8?Q?pM7A8asAfnkXJFmo=3D?=
X-Exchange-RoutingPolicyChecked: bQTG6D8zmMygnDpLhi1lVplmCfYCPoAsBiZ0STtlVPictyAV4qfFwFpYthtyoBkSXjYGumlb7wrN6CtCtnpAIuIsvRjrKxWhwACpDV6Hnnb756HaB9VF+MTkmt+fmlGNB3JgDopw9R8WLA7JAm7o9Hk9Snlli6GgG1D7lSUNBVfkZ+kiqS0E3WV/EQOWfPOLILiToyayM0JJrftdGTEu8vCYDVZwHIzLit/xdoP5rB0mnmza+2buuwRrvU3aL19h6OMRCU/WiQnlU+zYbZvoOwMoQWP3C9ZG2Z0OJj/qhbjqC1FQ/aSO+pgNLGivOybAK+JImYdZ1bJRJykdrsAv9g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 794606d5-10b9-480d-a44e-08deed4257eb
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 07:23:54.7856 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 52GSP76sUl62aFR+ana+Rbk12Kv6aaNxj/d3IwutSlLOU1uaQddeH/qv+mMabFOTulA49qc+2bs4lNlXgvvYKMaON9AxAmXnn3OmHb9f1Gg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9345
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


On 28-07-2026 09:40 pm, Michal Wajdeczko wrote:
> In upcoming patches we want to define macros that will work with
> either xe_device or xe_tile or xe_gt pointers. To make them work
> and to allow compiler optimizations, introduce set of helpers
> that will return either expected pointer type or NULL or make
> necessary conversions to/from the struct xe/device/pci_dev.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
> v2: add include (Sashiko) and const support (Mallesh)
>      reuse existing to_xe() helpers (Michal)
> ---
>   drivers/gpu/drm/xe/xe_any.h | 112 ++++++++++++++++++++++++++++++++++++
>   1 file changed, 112 insertions(+)
>   create mode 100644 drivers/gpu/drm/xe/xe_any.h
>
> diff --git a/drivers/gpu/drm/xe/xe_any.h b/drivers/gpu/drm/xe/xe_any.h
> new file mode 100644
> index 000000000000..a2b1e42fbc5c
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_any.h
> @@ -0,0 +1,112 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _XE_ANY_H_
> +#define _XE_ANY_H_
> +
> +#include "xe_device.h"
> +
> +/**
> + * xe_any_if_type() - Get the pointer only if it is @type pointer.
> + * @any: any pointer
> + * @type: data type to look for
> + *
> + * Return: the @type pointer or NULL.
> + */
> +#define xe_any_if_type(any, type)						\
> +	_Generic((any),								\
> +		 type * : (any),						\
> +		 const type * : (any),						\
> +		 default : NULL)
> +
> +/**
> + * xe_any_if_gt() - Get the pointer only if it is &xe_gt.
> + * @any: any pointer
> + *
> + * Return: the @xe_gt pointer or NULL.
> + */
> +#define xe_any_if_gt(any)	xe_any_if_type((any), struct xe_gt)
> +
> +/**
> + * xe_any_if_tile() - Get the pointer only if it is &xe_tile.
> + * @any: any pointer
> + *
> + * Return: the @xe_tile pointer or NULL.
> + */
> +#define xe_any_if_tile(any)	xe_any_if_type((any), struct xe_tile)
> +
> +/**
> + * xe_any_if_xe() - Get the pointer only if it is &xe_device.
> + * @any: any pointer
> + *
> + * Return: the @xe_device pointer or NULL.
> + */
> +#define xe_any_if_xe(any)	xe_any_if_type((any), struct xe_device)
> +
> +/**
> + * xe_any_if_pdev() - Get the pointer only if it is &pci_dev.
> + * @any: any pointer
> + *
> + * Return: the @pci_dev pointer or NULL.
> + */
> +#define xe_any_if_pdev(any)	xe_any_if_type((any), struct pci_dev)
> +
> +/**
> + * xe_any_to_xe() - Obtain the &xe_device pointer.
> + * @any: the &pci_dev or the &xe_device or &xe_tile or &xe_gt pointer
> + *
> + * Return: the @xe_device pointer or backpointer.
> + */
> +#define xe_any_to_xe(any)								\
> +	_Generic((any),									\
> +		 struct xe_device * : (any),						\
> +		 const struct xe_device * : (any),					\
> +		 struct xe_tile * : tile_to_xe((struct xe_tile *)(any)),		\
> +		 const struct xe_tile * : tile_to_xe((const struct xe_tile *)(any)),	\
> +		 struct xe_gt * : gt_to_xe((struct xe_gt *)(any)),			\
> +		 const struct xe_gt * : gt_to_xe((const struct xe_gt *)(any)),		\
> +		 struct pci_dev * : pdev_to_xe_device((struct pci_dev *)(any)),		\
> +		 struct device * : kdev_to_xe_device((struct device *)(any)))
> +
> +/**
> + * xe_any_to_dev() - Obtain the &device pointer.
> + * @any: the &pci_dev or the &xe_device or &xe_tile or &xe_gt pointer
> + *
> + * Return: the @xe_device pointer or backpointer.
> + */
should be device pointer right.
> +#define xe_any_to_dev(any)							\
> +	_Generic((any),								\
> +		 struct device * : (any),					\
> +		 default : xe_any_to_xe(any)->drm.dev)
> +
Add const struct device* as well.
> +/**
> + * xe_any_to_pdev() - Obtain the &pci_dev pointer.
> + * @any: the &pci_dev or the &xe_device or &xe_tile or &xe_gt pointer
> + *
> + * Return: the @pci_dev pointer or backpointer.
> + */
> +#define xe_any_to_pdev(any)							\
> +	_Generic((any),								\
> +		 struct pci_dev * : (any),					\
> +		 default : to_pci_dev(xe_any_to_dev(any)))
Please add struct pci_dev * : &((struct pci_dev *)(any))->dev  and const 
struct pci_dev *.
> +
> +/**
> + * xe_any_id() - Get the identifier of the underlying object.
> + * @any: the &pci_dev or the &xe_device or &xe_tile or &xe_gt pointer
> + *
> + * Return: the identifier of the object, or 0 if nor applicable/available.
> + */

Typo: please change "nor" to "not"

With all above cosmetic changes.

Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>

> +#define xe_any_id(any)								\
> +	_Generic((any),								\
> +		 struct xe_gt * : ((struct xe_gt *)(any))->info.id,		\
> +		 const struct xe_gt * : ((const struct xe_gt *)(any))->info.id,	\
> +		 struct xe_tile * : ((struct xe_tile *)(any))->id,		\
> +		 const struct xe_tile * : ((const struct xe_tile *)(any))->id,	\
> +		 struct xe_device * : 0,					\
> +		 const struct xe_device * : 0,					\
> +		 struct pci_dev * : 0,						\
> +		 struct device * : 0)
> +
> +#endif
