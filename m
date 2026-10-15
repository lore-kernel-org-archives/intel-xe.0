Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87E26CC6B38
	for <intel-xe@archiver.kernel.org>; Thu, 15 Oct 2026 16:54:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A227112419;
	Thu, 15 Oct 2026 16:54:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C7DE112419
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Oct 2026 16:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792083266; x=1823619266;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=nedrJUG7tHrPH7gb5SiBo/iZKIYLgSojbJzSXorZmfE=;
 b=hqnJEO7G9P4KAaA2tzn0Kp2+9jly0KVIfNB35rqTAAZLDlxcw0HHuHus
 RvbJcP5ZCtMvtKnyI/B2poJQrK8ZPZAPIXJrAm3h1ECdu7ls6+vSwDbc2
 KOzuJDpYU/AvleQJLrj7U6bGg112f9YO1wcHayJWBYvIcKDBeAI0uwF34
 m14obRGK0hXvbbQmOB3u4dPnNZGd6NsDgzjwtNX+55q6+HMXsaQPL/d7L
 fjv6RGIcB6dagZvUoAnFLUwX5Ek5S/bcLD87k7O7UNaghrTrPRddmzqW7
 9WfonU4zpfJgPLEVmWCuFBiujb7MSCISNqPv0w7u0TPe5ov+iEHP9Gq3E Q==;
X-CSE-ConnectionGUID: wglHxSSlTW+wK4jnm4Ll3Q==
X-CSE-MsgGUID: 7u5pBt5bS7+ZGiR3e8mF8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="850154"
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="850154"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 09:54:26 -0700
X-CSE-ConnectionGUID: TIWKnKBwQ7abaQo10wZ6jA==
X-CSE-MsgGUID: C0OC9XJMQTWVqzrhJpnbOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="1672666"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 09:54:26 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 15 Oct 2026 09:54:25 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 15 Oct 2026 09:54:25 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.10) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 15 Oct 2026 09:54:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w98AylObqs+laNlj4NkSNP+BZpyeunwDnVdqsBgLr7snhMea6xb6vtXbQ/YEnkYf80yoIxJB6B3G5pikbXbem+hhnGKU5fil15+FzoCDZYoR7cWymxG9jC/W8h5X/dpInVzkQjUMb5xrPrtzhFFdXiI4VWBTz1uuVEwengRmKS1Piv9hcvw7zmeR8qVYgh0rusL94er+cZpPJKBLyiBoljbCIYjJfMlctJDeyM8h6IcgzhTb94Zn3FWCqdZveExsljqqnGVZX1eWhGONzv9Ge8wMbbQbraNUhCWHsuPnU9B2reOXNOiCyJdRrcYvARBSpkpBfHI7u+gwjamn/5jF6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dsXcfBxO82Z6L+L3SZJHe0kjMr+rA5L224MB+dZXvBg=;
 b=yXx8tPYOmILnrD4H3bIyCbmm7KftubOLrw+L5e89aVetYDLz4S7Vrs2ZFyrZqpu+xpykXxJzZ1SzNOUbcRhGLCk7sHV8nfo5JSqy8p4HmxqQ3/S4F2pvdzM/W1DoRHG1EURIzfpHGyj05/eDmGzvjq2LeAo/FNwBTkNqABAJHskkioayZA5QzJDw7UaK8LiUJjPMNYseOw64rS/HTu/agepN9UtNaGsMk4Bl82Z4JMW/cg/WKbvKN0N+2VsVOJfvRLOACzPAFW68Hini6mRNyP262JjvRGvIN5HiUqKvAGAtJ/X9Z+BEuv5ijn5dr5urIgh8SVGzd+apliypR4tmpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH8PR11MB852307.namprd11.prod.outlook.com
 (2603:10b6:610:32c::22) by SJ0PR11MB7701.namprd11.prod.outlook.com
 (2603:10b6:a03:4e4::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Thu, 15 Oct
 2026 16:54:20 +0000
Received: from CH8PR11MB852307.namprd11.prod.outlook.com
 ([fe80::5f8e:c1ed:445a:a4b7]) by CH8PR11MB852307.namprd11.prod.outlook.com
 ([fe80::5f8e:c1ed:445a:a4b7%4]) with mapi id 15.21.0522.013; Thu, 15 Oct 2026
 16:54:20 +0000
Message-ID: <d09c54cc-3e3f-436d-88d0-1bef0b7b3f26@intel.com>
Date: Thu, 15 Oct 2026 22:24:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/9] drm/xe/hwmon: expose pwm[1-3]_enable
To: "Purkait, Soham" <soham.purkait@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <rodrigo.vivi@intel.com>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <sk.anirban@intel.com>, <mallesh.koujalagi@intel.com>
References: <20260717041757.2759084-1-karthik.poosa@intel.com>
 <20260717041757.2759084-6-karthik.poosa@intel.com>
 <07319064-e31e-47d2-a95f-a6fcd3a9db82@intel.com>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <07319064-e31e-47d2-a95f-a6fcd3a9db82@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0211.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ab::17) To CH8PR11MB852307.namprd11.prod.outlook.com
 (2603:10b6:610:32c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR11MB852307:EE_|SJ0PR11MB7701:EE_
X-MS-Office365-Filtering-Correlation-Id: 752a1f1b-1c07-4a01-9c97-08df2adcf4cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|11063799006|260925021911599003|56012099006|260925022911599003|260925021311599003|4143699003|5023799004|261009223027099003|18002099003|22082099003|18092099006|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: jWk+y+yVt+Kv2I1tr25E/F9ESzmy/PJJiWXuTbYonTXWm6GjHLaFgtQ/YmWIld8cXWpGD4ILcZpPbEEgQ+4okb2Z8aJm/tXPtAxgK9+nj2pg7ZNjn++VOyEkcdvu+QoQG4nmVXj66mlKbyW+uZOfL3bzn0mvNbNQ4qeVc95H7fkiTIKhme4NsvdZe51Uyq2o1HXSn3ftd/Ct/wk1UOfO1c/nN6ob4lF50gYBeTSJJmZwmlThis1Tbeore/LakaUV3T+Tyk38tgXqVwy+AdcTR0jHOnnRtsllLtL1nEoWcUGS7O3s1is5EgkpQ7tKEOPRB1ONeL5jBfsxaHOVOay0EATE0GEjkPZqg33fACCz5Dyi+C2f1tutB2l7Tz7xLTj7FL7r0iwiYCJFaL01TF3Q7U5g3/dm+nFMi27vfa8IqrdSCn/WLYmpvssh22/gLeqYQ0rfYOaTnjAig4I7nrMQ2yeTURp/mz8aa/ohzoM5HvAfjjic0hIuMkMrSob0YRhkXzhhUeEuQzDcIJyc2Ehd0eGeTDxb2fQ5rmxdV96ALOHS/tLVYjeSzwNujuF/IcGmOyGYODfvUB8LJaiCVQ1AsTguGl42NHKJOMfsJDecTF9Yq6Jzm8X0GCUJXl5hTOfmTAjgRwJBH+Ljgt0HClslndUFwaEo4hU4sRwT2ZjZmm0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH8PR11MB852307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(11063799006)(260925021911599003)(56012099006)(260925022911599003)(260925021311599003)(4143699003)(5023799004)(261009223027099003)(18002099003)(22082099003)(18092099006)(6133799003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SHBBcHlxRDZxOUV5MWFEd09LakVNTW5FTVYxNFd2djJTZ3VNdVpzVUZFenUr?=
 =?utf-8?B?WG1CNWxSYjgzb3lNTXIxbnBVaXBzb2JxNXJTSGdQN3A5bmExalUralpvVERv?=
 =?utf-8?B?cWVZVkNHZVk0V1o5QjBEZUJUOHhrM2hibGRMYlUya1NoUytMK1AvbkNuOTRh?=
 =?utf-8?B?SkFGZ1I4bVd0UVRlUkt3cVRpcDFSY01yMnczZ2x1Ylg0QkhWZzE1dnByQnpW?=
 =?utf-8?B?RlBKZ3lXTzU1MHpxSVc5aVlBSTVUYmF0TGt2d0lNQ1FhelRBQlRnTkdUNHRo?=
 =?utf-8?B?Wi9kSkxvMWRBbVBLNHFkdnlpMmF1VEFXZW54WlRocFVQcmVvKzVUQm00YkVR?=
 =?utf-8?B?YWtHZmZHWjdlOXA1cnJJS0hrMTZYb012bGkrc1lGNWRNUW4rQlZ3OW5EWkdz?=
 =?utf-8?B?dmlsQXZmMkswZWc2V2tqQlVBNHBsTXAxdWJxdHZ5c3dqRGtRa0E2cnBPcmlU?=
 =?utf-8?B?S3Q4cy9meEtaWW5GNE1CcUdiTW5yZUJPRjU4eC9BV3IwQ0pSL2tOd0x5c3ll?=
 =?utf-8?B?eEQ3aHluVktxQWhUV0RtV05CaUZ1ZFRBOEZwR2oraHVTWWtkb0o1a1BtYzdD?=
 =?utf-8?B?NzlMVTNZT3Q3TGxDdjlUUUM3VEp6NXRtM2xjemFhR1BqTXdXVnFhQ0VyM3NK?=
 =?utf-8?B?Yjk2ZHhUUEIzNzJSQTQwTjVETXBhVGNPeU5CdW9ocTFxNzRJY1J0aWRQZjUy?=
 =?utf-8?B?M0tzbWNXWTR1TWUxUit2MTRyQy9aS0g3TUw2NVRaZkpZSlQxT2U2SXJJcktY?=
 =?utf-8?B?QTdjellGZE9rNkxjNWpPczVLYkpOeHFJRUJzZWpmeC9hOUpqOUJVVVZGcEp1?=
 =?utf-8?B?RDlDWnNnU2M5VlJDRmdzT2dyallzbkhNWm1udjgrVnVrd3FhTE9wNDdxZm1l?=
 =?utf-8?B?ai9ZNmtTQUVYZklDQWI3MUFyOC82dzdUYVlNTnNwOWZpQVZ4eGtvcHJlUnh4?=
 =?utf-8?B?ejU4QWlRekFmc0d4SWxMV1p1TVFDNlZibmU4SnFPZytMQnF4WlZuQmd4Um8v?=
 =?utf-8?B?TDgrc2kzaXBsRDBGYmh3TkluOU4rNldKYS9wenVsT09VTEIwUXhhQkhjZjBw?=
 =?utf-8?B?bWI3K2loUUdmMzY0N2FFR3pBZ1dNVTU4VzNFckpENElMemgxT0dzVWdDNUcv?=
 =?utf-8?B?TVExV28xOXl1dWdyVVp2d0NISFNDeHkyeDBpVzZETTFJM3A2emZqK3psTmtQ?=
 =?utf-8?B?V3Y2aG5meEVIbzdiNTFzczlydklFR2Fldm1NTFRBeFNDK2pES3NaU0Ezc2NU?=
 =?utf-8?B?dWRXSHJGSlNzYTFQbHJZQ2ZqWE5IaEZOVFhIMkhsSzZSeTFWejhTeWloZ1Jx?=
 =?utf-8?B?RFdJY00rMTJSSE1SVWZvRlZ2clc5NTlXRXFPek1pZHUzM0w3RDNzSXIrd2cy?=
 =?utf-8?B?MCtFeVdickxiQVhEOERkdWp5d09LckNZSW5zbUhpbUdWWUdqYllQQ2hVdWdn?=
 =?utf-8?B?c0tkbnV2eDBpaTlSUXNQRnFZQmFSelJWZ21Yd1NMSjN3SGVYSDVnODJXaS91?=
 =?utf-8?B?RlVqeENnVGlCbWxuOEFidXlacHBtajJidERxS2VSVXhlbDVpRElXZEY5M0hO?=
 =?utf-8?B?K3JaUUcrL21MMnk4SktJUElObGpNWmNIQ1dHcmZ4NDZIWmtIbm9vSEZRYjB5?=
 =?utf-8?B?eXdhTzVRMVZCQU5zdHQvdUlSZ3hlRi8vMVZGSjdQaWFvcDl2Q1NKbjhDRjVG?=
 =?utf-8?B?WmVJT0cvaXc4UWNEWGhlTU9aa2JVU3RrUHRhNkJkVDhZNkdSSHpYTTFWOFRq?=
 =?utf-8?B?ZmpsODdjajgxQ3ZRcUg4TGVjbUxKNnhYRGdSckZVektwN0pFRUo3TXJWa3lV?=
 =?utf-8?B?TVBRbkhIYUFZRkdqeHZMdlAvYWs4cjVaL3RYWldPMktHOEpJZXBpeWZ1bWN6?=
 =?utf-8?B?MThDQ3VRM0dkUURxQ0h4ZmJPMDA5MFkzMFppU3FKbW91OTV6L2NJS21VUTNl?=
 =?utf-8?B?T3NFRlAwajM4aUUybXZ5RE1JK2d2eTVhR2EzTGFiTWxOVnlIWlVLZEMwQXV4?=
 =?utf-8?B?dTF2SFNsMnM2SVFBQ3ZOaDdYdFpuTUN0Y1ZqVlgyMkdydGVuM0FmbDFoWk9w?=
 =?utf-8?B?NUY4K0VnQzJyV3FPaG5lMlFzM1gxSFA4K1VhRWhRL0xyZEt5QXpWWm5MUURD?=
 =?utf-8?B?RGloZ3A2VU4xcTg3R0VEZm9SeEoxQW9pRlZNRWNSOGNFN0RlbGUrZkFMdVU3?=
 =?utf-8?B?RHlWU2U4K25xTjRRK1ZHNCtsaTVhZ2VwUU9Ub0hRRkFpdlhRWmZLMWdObFhk?=
 =?utf-8?B?QjU4RlRlenJUWFF5VXIvaU1rMVlZY3dVRzdYaUE0RUl3akNuNEZ6RmplNjBP?=
 =?utf-8?B?NjFnbXZQNkZUbU5XYjJtZmZtOVAza0IySGlDcmJSS3orUis3ek1ZUT09?=
X-Exchange-RoutingPolicyChecked: oFJMwf4zLgogRAeJJFvBxM1AlztNz+hpvwDBVUV7+AqwoW3EbL4SfmwSZPUpiDMV1/7jvyPIk65YuBGB3JKBHlXwtOkqQ2nr7gj7ab4thu5g+7AhVxcE0p2+trjbcBm744SNXSvIREvuZIdnap/nHB/yD2y6oh4nZ+ahFW2lwfQVLFymVd8TZLpe8VzvNoNfxh2nO1eDvVsS51TD9TFxRMDontrvpdsi9Xj7WUXnHqeJZ89zxoX2Uxil6Xuy7G7AxU82fhM3Br7Z6e3hD1jTF1CxBxB2HG6GZW5h1tT4tKsGahrhXH2XirhGMW5eXHGZzWjetRsZJpD51lrts0SCoA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 752a1f1b-1c07-4a01-9c97-08df2adcf4cc
X-MS-Exchange-CrossTenant-AuthSource: CH8PR11MB852307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 16:54:20.1759 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f34xEvdS+t7/Eo+KXz8SmdiEqIarWp3MjGzJ09PaLY1wWNPVgfiiuVehRAWvVzs9xHEVg7geFkdClt2NTbwNhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB7701
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


On 02-09-2026 11:27, Purkait, Soham wrote:
>
> Hi Karthik,
>
> On 17-07-2026 09:47, Karthik Poosa wrote:
>> Expose pwm[1-3]_enable for fan control mode selection.
>> Value of 0 runs fan at full speed.
>> A value of 1 keeps user fan-table control active, while value 2
>> switches back to firmware control.
>>
>> Update Xe hwmon ABI documentation for pwm[1-3]_enable.
>>
>> v2:
>>   - Use xe helpers for dmesg logs.
>>   - Update kernel version in Xe hwmon documentation.
>>   - Correct level of some dmesg logs.
>>
>> Signed-off-by: Karthik Poosa<karthik.poosa@intel.com>
>> Assisted-by: Codex:gpt-5-4
>> ---
>>   .../ABI/testing/sysfs-driver-intel-xe-hwmon   | 11 +++
>>   drivers/gpu/drm/xe/xe_hwmon.c                 | 91 ++++++++++++++++++-
>>   2 files changed, 100 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>> index 7383898890aa..effc7d38ce1f 100644
>> --- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>> @@ -330,3 +330,14 @@ Description:    RW. Target fan PWM duty value in the range 0..255. 0 is zero
>>                   fan speed and 255 is 100% fan speed.
>>   
>>                   Only supported for particular Intel Xe graphics platforms.
>> +
>> +What:          /sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/pwm[1-3]_enable
>> +Date:          July 2026
>> +KernelVersion: 7.2
>> +Contact:intel-xe@lists.freedesktop.org
>> +Description:   RW. Fan control mode selector.
>> +
>> +               Use value 0 to run fans at full speed. Use value 1 to enable
>> +               user table control and value 2 to use firmware default behavior.
>> +
>> +               Only supported for particular Intel Xe graphics platforms.
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
>> index d3379727b1a9..fa9dbadd5fd6 100644
>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>> @@ -123,6 +123,15 @@ struct xe_hwmon_energy_info {
>>   	long accum_energy;
>>   };
>>   
>> +enum xe_fan_pwm_enable_mode {
>> +	/** @XE_FAN_PWM_FULL_SPEED: force all user table points to full speed */
>> +	XE_FAN_PWM_FULL_SPEED = 0,
>> +	/** @XE_FAN_PWM_MANUAL_USER_TABLE: use the driver-managed user table */
>> +	XE_FAN_PWM_MANUAL_USER_TABLE = 1,
>> +	/** @XE_FAN_PWM_AUTO_STOCK_TABLE: use the firmware stock table */
>> +	XE_FAN_PWM_AUTO_STOCK_TABLE = 2,
>> +};
>> +
>>   enum fan_table_type {
>>   	/** @STOCK_FAN_TABLE: firmware-provided fan table */
>>   	STOCK_FAN_TABLE,
>> @@ -169,6 +178,10 @@ struct xe_hwmon_fan_info {
>>   		u32 max_rps;
>>   	/** @min_pwm: minimum fan PWM */
>>   	u32 min_pwm;
>> +	/** @pwm_enable_mode: current xe_fan_pwm_enable_mode */
>> +	u8 pwm_enable_mode;
>> +	/** @is_full_speed: flag indicating if fan is in full speed */
>> +	bool is_full_speed;
>>   };
>>   
>>   /**
>> @@ -803,7 +816,9 @@ static const struct hwmon_channel_info * const hwmon_info[] = {
>>   	HWMON_CHANNEL_INFO(energy, HWMON_E_INPUT | HWMON_E_LABEL, HWMON_E_INPUT | HWMON_E_LABEL),
>>   	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT | HWMON_F_MAX, HWMON_F_INPUT | HWMON_F_MAX,
>>   			   HWMON_F_INPUT | HWMON_F_MAX),
>> -	HWMON_CHANNEL_INFO(pwm, HWMON_PWM_INPUT, HWMON_PWM_INPUT, HWMON_PWM_INPUT),
>> +	HWMON_CHANNEL_INFO(pwm, HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
>> +			   HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
>> +			   HWMON_PWM_INPUT | HWMON_PWM_ENABLE),
>>   	NULL
>>   };
>>   
>> @@ -1033,7 +1048,8 @@ static int xe_hwmon_activate_user_fan_table(struct xe_hwmon *hwmon, u8 fan,
>>   	}
>>   
>>   	fi->fan_table[USER_FAN_TABLE].fan_control_point_count = point_count;
>> -
>> +	fi->pwm_enable_mode = XE_FAN_PWM_MANUAL_USER_TABLE;
>> +	fi->is_full_speed = is_full_speed;
>>   	return 0;
>>   }
>>   
>> @@ -1046,6 +1062,11 @@ static int xe_hwmon_set_user_fan_pwm(struct xe_hwmon *hwmon, u8 fan, u8 pwm)
>>   	int ret;
>>   	int point;
>>   
>> +	if (fi->pwm_enable_mode == XE_FAN_PWM_AUTO_STOCK_TABLE) {
>> +		xe_dbg(hwmon->xe, "fan %d manual table is not active, cannot set pwm\n", fan);
>> +		return -EINVAL;
>> +	}
>> +
>>   	/* Read user table fan point count, if it is not set, activate the user table */
>>   	ret = xe_hwmon_get_fan_point_count(hwmon, fan, &point_count, USER_FAN_TABLE);
>>   	if (ret)
>> @@ -1078,6 +1099,9 @@ static int xe_hwmon_set_user_fan_pwm(struct xe_hwmon *hwmon, u8 fan, u8 pwm)
>>   		xe_dbg(hwmon->xe, "failed to update fan %d user table count, ret=%d\n", fan, ret);
>>   		return ret;
>>   	}
>> +
>> +	fi->pwm_enable_mode = XE_FAN_PWM_MANUAL_USER_TABLE;
>> +	fi->is_full_speed = false;
>>   	return 0;
>>   }
>>   
>> @@ -1134,6 +1158,9 @@ static int xe_hwmon_read_fan_control_info(struct xe_hwmon *hwmon)
>>   			       fi->fan_table[STOCK_FAN_TABLE].fcp[point].speed);
>>   		}
>>   
>> +		/* Set PWM enable mode to automatic i.e stock table in use. */
>> +		fi->pwm_enable_mode = XE_FAN_PWM_AUTO_STOCK_TABLE;
>> +
>>   		/* Read minimum fan PWM */
>>   		ret = xe_hwmon_pcode_read_fan_control(hwmon, FSC_READ_FAN_MIN_PWM, fan,
>>   						      &fi->min_pwm);
>> @@ -1585,6 +1612,7 @@ xe_hwmon_pwm_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>>   
>>   	switch (attr) {
>>   	case hwmon_pwm_input:
>> +	case hwmon_pwm_enable:
>>   		return 0644;
>>   	default:
>>   		return 0;
>> @@ -1669,6 +1697,9 @@ xe_hwmon_pwm_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
>>   		*val = DIV_ROUND_CLOSEST(fi->fan_table[USER_FAN_TABLE].fcp[0].speed *
>>   						U8_MAX,	100);
>>   		return 0;
>> +	case hwmon_pwm_enable:
>> +			*val = fi->is_full_speed ? XE_FAN_PWM_FULL_SPEED : fi->pwm_enable_mode;
>> +		return 0;
>>   	default:
>>   		return -EOPNOTSUPP;
>>   	}
>> @@ -1677,11 +1708,15 @@ xe_hwmon_pwm_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
>>   static int
>>   xe_hwmon_pwm_write(struct xe_hwmon *hwmon, u32 attr, int channel, long val)
>>   {
>> +	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
>> +	struct xe_hwmon_fan_info *fi;
>>   	int ret = 0;
>>   
>>   	if (channel < 0 || channel >= FAN_MAX)
>>   		return -EINVAL;
>>   
>> +	fi = &hwmon->fi[channel];
>> +
>>   	mutex_lock(&hwmon->hwmon_lock);
>>   
>>   	switch (attr) {
>> @@ -1692,10 +1727,62 @@ xe_hwmon_pwm_write(struct xe_hwmon *hwmon, u32 attr, int channel, long val)
>>   		}
>>   		ret = xe_hwmon_set_user_fan_pwm(hwmon, channel, (u8)val);
>>   		break;
>> +	case hwmon_pwm_enable:
>> +		if (val == XE_FAN_PWM_FULL_SPEED) {
>> +			/* Set fans at full speed. */
>> +			ret = xe_hwmon_activate_user_fan_table(hwmon, channel, true,
>> +							       STOCK_FAN_TABLE);
>> +			if (ret) {
>> +				xe_warn(hwmon->xe,
>> +					"full speed enable for fan %d failed, ret=%d\n",
>> +					channel, ret);
>> +			}
>> +		} else if (val == XE_FAN_PWM_MANUAL_USER_TABLE) {
>> +			/*
>> +			 * Manual fan speed control using user fan table.
>> +			 * If user fan table is not programmed, it would be initialized with
> nit: s/programmed/populated/
ok
>> +			 * clamped stock points which allows manual control with some
>> +			 * default points.
>> +			 */
>> +			ret = xe_hwmon_activate_user_fan_table(hwmon, channel, false,
>> +							       USER_FAN_TABLE);
>
> How can USER_FAN_TABLE be the source of itself ? Should it be 
> STOCK_FAN_TABLE ?
>
it can be when user want to update user table again.
the shall be changed to active table in next revision.
>
> Thanks, Soham
>
>> +			if (ret) {
>> +				xe_warn(hwmon->xe,
>> +					"failed to activate user fan table for fan %d, ret=%d\n",
>> +					channel, ret);
>> +			}
>> +		} else if (val == XE_FAN_PWM_AUTO_STOCK_TABLE) {
>> +			/* Switch to stock table specifying the user points to 0. */
>> +			ret = xe_pcode_write_timeout(root_tile,
>> +						     PCODE_MBOX(FAN_SPEED_CONTROL,
>> +								FSC_WRITE_NUM_FAN_CONTROL_POINTS,
>> +								channel),
>> +						      0, XE_PCODE_FAN_CONTROL_TIMEOUT_MS);
>> +			if (ret) {
>> +				xe_warn(hwmon->xe,
>> +					"failed to disable user fan table for fan %d, ret=%d\n",
>> +					channel, ret);
>> +				break;
>> +			}
>> +			xe_dbg(hwmon->xe,
>> +			       "automatic control enabled for fan %d using stock table\n",
>> +			       channel);
>> +			       ret = 0;
>> +		} else {
>> +			ret = -EINVAL;
>> +		}
>> +		break;
>>   	default:
>>   		ret = -EOPNOTSUPP;
>>   		break;
>>   	}
>> +
>> +	/* Update PWM enable mode and full speed status if no error occurred */
>> +	if (!ret && attr == hwmon_pwm_enable) {
>> +		fi->pwm_enable_mode = val;
>> +		fi->is_full_speed = (val == XE_FAN_PWM_FULL_SPEED);
>> +	}
>> +
>>   	mutex_unlock(&hwmon->hwmon_lock);
>>   
>>   	return ret;
