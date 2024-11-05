Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A397D1CA3A
	for <intel-xe@archiver.kernel.org>; Tue,  5 Nov 2024 07:17:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24DE610E52E;
	Tue,  5 Nov 2024 07:17:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C1VvVZPR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C876410E52E
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Nov 2024 07:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730791045; x=1762327045;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=LX+YWkoPYv5MzeD8X1poz3EsbRaFnKYRjRAVWNjP5X0=;
 b=C1VvVZPRzvigzN3oGcjZ11YLPlzjgA9evQ2uPx42+W0ZpVrBsw5xifu0
 SY7PD2vrk1oGvsyxx1GENPgYPzfiD7TmsxjRF8r1MjwnIkwOKDuT/RODn
 7o7nfdB7kRENjrUa+zkW/XwY51tALEWpdjUkF2Mn89yBHn3O1rp4Kl6pe
 XFvBHhcdYq/oW/cIBtRdhX+ktisVgiwe4rf7pt2T0Km1cUuDdzy+wWQIx
 S7D94DSJLtB7d38GU4Ojt5wcX9EVVsAeXmbUSVIoUPqszzaEecq6QPZo+
 vV2mMYrjygr1VKbrDK9TVOiGOLKZGC+via7WNVSuTvHbxQnBsLthB/wa6 w==;
X-CSE-ConnectionGUID: ILbDLJkvS1eTDIe3izWpjQ==
X-CSE-MsgGUID: A5aTC6GuQPKw/pm785xUXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30474412"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30474412"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 23:17:25 -0800
X-CSE-ConnectionGUID: DeyEu5UoSDuFOEnBDa2/vw==
X-CSE-MsgGUID: dMZpnB8DTWyPntTqdtfiNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; d="scan'208";a="89045035"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Nov 2024 23:17:25 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 4 Nov 2024 23:17:24 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 4 Nov 2024 23:17:24 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 4 Nov 2024 23:17:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ddq51FBnvpuNO3bfO/vJcjSWe9Lr6s2/q4VQYATMDap1VkmYnWq46tC4c5HA+DdCQwDq5ac5FLaPgGlrayWGUO5yjU6vgVBDlFEP2kBxsmj1Mk7YLHd6hwESQXXb641AhAbj+6LwUNNyn6sXL3wWd/GFR0/Lg9ImerH2ZBnx03hite4UXH+9e7t7kJEg1tHY2P+cgP596p604ocRlcJWg7Nib+ZIV//G7kdjgeVbP1URJG1x5NJNmf2Dl3KgD8eOhpI7w8KmC+c4Oba+JvJWlN/vghRgdBTdz1b23DJ9TTCKwheasf8/tj2CZGVgOqTdF9nel7hY8Dq/0jvoJRkIaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UZRz7sVdMppWAV/vE4+Nmn0lcRKV6EQeSarpCbhD5ls=;
 b=W1bTWHXDC3P4AuUnIsqZAZ/+uylST4AlTYNTP7JfVA34DguW20FhehMAMFnQQZbmNRkLUpMtFcGNj3e+BLCP0ihjY6MrHAPi2ecO/3dlFrCsVSBXqww3enQvmVUKyukNsuAuY2jsmH6TeAtP2QVuzidcQAc8AmNDQf5LylMSEI07QZyTaI15Fu6/HlUOlGhVB+DkNbbh0ubTFS903HHgeUZWqzXbYGU4yr58xlSV+yDn2oRBkUMXvk1SNwcSQGFe9uLj+2MYktj2yQXuX4N5YhSjiBU/qNY0HAUc7w7+gAvjd6JhUuqvHjErQBKBtZB2gFb0nSVMjz90AjNncOdAaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA2PR11MB4826.namprd11.prod.outlook.com (2603:10b6:806:11c::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.31; Tue, 5 Nov
 2024 07:17:20 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8114.028; Tue, 5 Nov 2024
 07:17:20 +0000
Date: Tue, 5 Nov 2024 01:17:18 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Use lowercase for asserts
Message-ID: <bn4pxsygtr64v34ohioctc5cohrvpbyswjlxxnxe6wvzsw6u42@lry3u4qstaht>
References: <20241104140813.1992885-1-lucas.demarchi@intel.com>
 <2a9c8689-f953-4f2c-a66c-111b085b20c0@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <2a9c8689-f953-4f2c-a66c-111b085b20c0@intel.com>
X-ClientProxiedBy: MW4PR03CA0175.namprd03.prod.outlook.com
 (2603:10b6:303:8d::30) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA2PR11MB4826:EE_
X-MS-Office365-Filtering-Correlation-Id: 51c936d2-29e4-4485-13ae-08dcfd69e318
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?yKjFZz5lJHtaILv7e+isR9iLNHexMsMVC07OhNxn1escVfgFMjehQVBfzfso?=
 =?us-ascii?Q?qpHw9Hzr+rudXJN2gzMgu5wt/tDgESk85+a64lVGNKPZvDT+oZZjgfr0IWmF?=
 =?us-ascii?Q?XDTXVZGjE4p7LblAT5qQGFH4hMrnSFEOcnlnVBL9taWnbf9jTKn1jVjsQepD?=
 =?us-ascii?Q?Fm3T435Kha1+tziuQYVxrqDEERHZr54YsKTEP+J3PhW4zo+SX00RO4bcM85R?=
 =?us-ascii?Q?PdVOsI84BIwrtRDaz0ImnqxDrgI7+CGL/A1TOaNWUUURsTVQD0niwVgDQOHy?=
 =?us-ascii?Q?leTJixAYClUG3W68/Q3Z627P1chbfWtUagBUgvlxQeob57H4bEsHvLcer9x6?=
 =?us-ascii?Q?nRAIld7tBxKla4PKtLRIGAFZDNg1DuaODh2vFuAk7/kNLxq3AwL9eao/mG3e?=
 =?us-ascii?Q?2mcG3XJBzrbmvJyZ4YDSSWF1SiV6pzJ7LisitAvPr9Hf3N95Ygxdh8ETmfKw?=
 =?us-ascii?Q?I8YqD15fWFrbrhn0U6pRaa/I9tXsg7hdKv/JrnqAlnYMhiY0hHzds9xHE7nX?=
 =?us-ascii?Q?65s7P87o9vBUyWzTQLHyIUBaYzUcDJCX0MlEdppZsoFjeOkpe9/9O7L72uVC?=
 =?us-ascii?Q?mm5BsYIQ/7/uiY+SZY9tvI55NYSuP7xgjRCzFK/rPqmmUJTF+RvhF/xZeBQH?=
 =?us-ascii?Q?7s+olyTLy5PLQTNSRBjSzdVGWShKvpvZgZkr+njiWkiqkfv6oIbX9c6/OsKT?=
 =?us-ascii?Q?i6QAe6ciGt9u0wQwghLMPJ+howxZbJ2s4y/NvvlAFjQ8RlsukdQXLXANcE/k?=
 =?us-ascii?Q?PxB6RR1fjISYmYt0EzGL1qG9wOPsEkQ0iwUaCvYNSz8Xu4b2C38XGFzu4zCB?=
 =?us-ascii?Q?uvsffFl1P7kPGyqzXRHWhFfaNuqrYgzXd/H/JKV2mARpRsvFj7wl5f+kXuAW?=
 =?us-ascii?Q?bBaKHji0hLDi9OTXJTVWhXhkbxvjsG/OYfV1AxuP/S8Yb2N1xb/4Y+LKcJAY?=
 =?us-ascii?Q?P07i4LuCqisz7MTdDFmRQogvFTtH3yfGxL1tfVILa4X873nEaHzj6/je4Inj?=
 =?us-ascii?Q?IjWVMW7q+nWQzCeRn93nNnXJT4oeXzrOajktzTlZWzYISTTb89v1OcWZyUka?=
 =?us-ascii?Q?FfjznP+0yVYW3ALGwUvV1eGauumTDCvjCX3XnYF3WPUwCaA+TrmCh8g8jNTw?=
 =?us-ascii?Q?tNqiG+FYadAeDsLdA9ADXIJ50fG3tbOKncZZRl71o+LsxucneoV2HqY/wGLg?=
 =?us-ascii?Q?7m4qNLEZza62BjoEYLldfM7kNfBpLKUMpK5+mwZBnJUoJ3RPLcYU+k1AQ4eq?=
 =?us-ascii?Q?+Ad1f9ZQKgwXwz7MMKCY/RXHx306biXZ6r2vMWjjbeslDKBJsnLPEq8lKCFW?=
 =?us-ascii?Q?F1g=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VGIN6fUR7cOvf7sM3hej879aZ2EjPs48hnZAbeHDINee9mwH2kX/DKkTzNdQ?=
 =?us-ascii?Q?boztwQZ5mlFS95HR7fWxnNzx0FBdLIyWtgJzebiQZyo5fd8zDHDMaaZ/ozD7?=
 =?us-ascii?Q?dQwHmHlXcRnG8KhbE3aN/uf/bb9Ul9CajUKAjQOmrbEZ/fIC21uJAfv6IZ/0?=
 =?us-ascii?Q?7sJdBS9PooGhwSt/GVp0NKkldNQpOKh5oXfI4buzsbVR7xNVBlN2ezgxVlnS?=
 =?us-ascii?Q?mFkR52HZUv58qKruiIme0hstLYIgOzq2+cOP7HFXORo/sCwv8gGyQHxzcrji?=
 =?us-ascii?Q?2C3SV8miifrpaDHaCAIKjfowHxrsQjLs854wSsMbRbcEHniXKDuHRBsM0fGh?=
 =?us-ascii?Q?64oCPta8Js9mf5jc9OSDNA2RaFmXSErP7vJ+TJhwyujUKa7e8ihUEISrOJJE?=
 =?us-ascii?Q?XpgMhNh3ev6Krt6MawpiBnw6QwS/nowGmrOKZxPU7sf6sjcri8knVgI0XZiZ?=
 =?us-ascii?Q?E2fzMEQX0m26UU6W8X+9UiQUZrdGN+Lm/aOUOovhIup0nfdjYZ1IFtlRaCY4?=
 =?us-ascii?Q?wXFOplqgbNGeNAa3KbKrgplRcY2T7xKosZdOc3244HwLSUgAhJXxoKIX8hB3?=
 =?us-ascii?Q?RParVbfkYV+YAELc++Hhug8EjtUb6IvEI7JEKCXyZkePQHCDDYUrnLppR4EA?=
 =?us-ascii?Q?fn3EFG1SlWejAVYQw/nejNdBpUjWr8rizBPwZ4B1CpJV7TFG4+LdGt+x3gvl?=
 =?us-ascii?Q?Mr+ZOmQFLcMpzQ9v1/IWRqsY/qX2+uGihqdAIBzdKzl+KABnS6EQCrA9yEhe?=
 =?us-ascii?Q?BxXzi2P/imjX0zqpw5fns0+Hc/11cnhflYXWJpjATmMyoBJxsBXUMnv5vcOZ?=
 =?us-ascii?Q?uyhUT5GcaWV/IWtJoXbkSRuWI9FEZbALlgZjE9aEsXlZcQkoi99RlrC3qVjd?=
 =?us-ascii?Q?b9CD9j2wV2JS1kkhDqjCN7F0laCWyjQvZpfzmwHbWBccMHSQK2BpP3MpcpEp?=
 =?us-ascii?Q?qEkqeJKVVyJbYM4wVn0/cBSOqbPphyHeU9QQ8Pd7KOV+nvQdIbdMmDJ7QEh5?=
 =?us-ascii?Q?iiGIHyJcw13fEZr1qi2Z6fklO1/vBJFHsmT0aXsLLDgJ360Qi7eqTKw1tibi?=
 =?us-ascii?Q?9fSHlom9HYt2l6npKjLc/o7Ez/Sag/yNuXnqUIRtBS7FG9aa7EmfnZyGLRUC?=
 =?us-ascii?Q?H0L18O37cBxipLm2XIIltJok0qviplkhSKBYBBtUVj/S6lNQBrtIdx274KIW?=
 =?us-ascii?Q?6TAiPaCRkjp6sDuNpGTNUFWzPNJ6COZVgph1aWI64m/pmZSV0G1dQqy4Aoos?=
 =?us-ascii?Q?8+zuLERfW2cfAC6Q480VvCELfK0M7ZhwL5BEk7CLEWtOJEZKiRMprn9N5bwb?=
 =?us-ascii?Q?oZ+s3pXKlYvspNPVRi/Tod8fXOXaK4IUvkKEjvZMt4v27h/aDBzxC7gGa34W?=
 =?us-ascii?Q?x9emyv7SPmrWn9uLCpqztkPOiar+lZ83bwwyRmBnI498OTsxqazdjwEn9Fud?=
 =?us-ascii?Q?eYjGVnoppllcBGJtv4Y3idmsggn9RjpHhlGwksbFuebJvL+qxS8VEc4FMuho?=
 =?us-ascii?Q?Bfc8DvpsftliwBOVIiQpuYAxedrWTlUPmL6PKazSIdWlmGW+8WmwNAQb4HJk?=
 =?us-ascii?Q?Kq5g998/eOtE54gx5mRdlMW0uB19IUOfN4n4LT3q7y7aqJ0LoCSXV1hr42dp?=
 =?us-ascii?Q?dw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 51c936d2-29e4-4485-13ae-08dcfd69e318
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 07:17:20.4603 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bq9H772iK22oSHfPfKKGuctPZjmpaYbTYTwSLYxqGC9p6BoUFXPz3b3XJKGss896yaiNvJ8noHKHnT/eXygL0/yF6fjaMqJu3l5+j3t/Faw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4826
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

On Mon, Nov 04, 2024 at 04:05:43PM +0100, Michal Wajdeczko wrote:
>
>
>On 04.11.2024 15:08, Lucas De Marchi wrote:
>> The rendered html documentation for "Xe ASSERTs" doesn't look nice with
>> the mixed caps and gives the impression it was a typo. Just use
>> lowercase to improve it.
>
>some background: in initial version those assert macros were named
>xe_ASSERT() to follow the drm_WARN() style, hence this leftover
>
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_assert.h              | 8 ++++----
>>  drivers/gpu/drm/xe/xe_gt_sriov_pf_helpers.h | 2 +-
>>  drivers/gpu/drm/xe/xe_sriov_pf_helpers.h    | 2 +-
>>  3 files changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_assert.h b/drivers/gpu/drm/xe/xe_assert.h
>> index 04d6b95c6d878..831cb62107496 100644
>> --- a/drivers/gpu/drm/xe/xe_assert.h
>> +++ b/drivers/gpu/drm/xe/xe_assert.h
>> @@ -14,7 +14,7 @@
>>  #include "xe_step.h"
>>
>>  /**
>> - * DOC: Xe ASSERTs
>> + * DOC: Xe asserts
>
>nit: maybe this should follow Title Case Style, so this would be:
>
>  * DOC: Xe Asserts
>
>but up to you,
>
>Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Ok, I changed it and re-submitted. Thanks

Lucas De Marchi
