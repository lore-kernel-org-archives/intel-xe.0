Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0386C54F4C
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jul 2026 06:26:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47E5910E520;
	Tue, 28 Jul 2026 06:26:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VwZG/pNy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84DEB10E520
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Jul 2026 06:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785220001; x=1816756001;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Gbtx7FVNuu0ktdCnz3DhtWA7lWdnDXJpGaAJswvIGp0=;
 b=VwZG/pNy4b+cgSApUCSh1NbuJPW4ftAtxiNXj0UNaunrclU4bpJSFBAW
 w1iuvUo51i4DdGQG0JiwqUyjiGX8TIUC1bcyb62H1Re7uygeXAuj+Y3BS
 NrfdhlKr4x/i3DGFXGZ+gDtKCmIRN2NKd5RJhJgMHbbHCVFPrFe/BYcyf
 gipm2trWRj60wBT/cy8ddVaFz7QCa8rCmYtXlHdwpwsjvjIL8Ujkanebs
 nrdbr8yBDZmnBdsjxH9UbCbeL0TtQBBM1uLWpc6MMOfdDiM2JKk0GFHpD
 PPyxAF96ZKFRXy2NcZOnJAabSTUY33seUDih9aKOLD9dGdyKrYzU361V+ A==;
X-CSE-ConnectionGUID: iaKb/ctqSOWfzzMIIVuSUw==
X-CSE-MsgGUID: sb2OITU/QkWdW61Q5Wc3dg==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="96383680"
X-IronPort-AV: E=Sophos;i="6.25,189,1779174000"; d="scan'208";a="96383680"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2026 23:26:40 -0700
X-CSE-ConnectionGUID: cMCZY3FdSYG4QeOAtURZOQ==
X-CSE-MsgGUID: 0U/Rl/uoQeeVEkTtvyC5uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,189,1779174000"; d="scan'208";a="289575679"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2026 23:26:40 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 27 Jul 2026 23:26:39 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 27 Jul 2026 23:26:39 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.29) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 27 Jul 2026 23:26:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qN0yVvms12omepXzRBX06EEm6LI2KTqAt54+a3I19MaY6YxxcXjFlJIHxysKdtWIwmP5Jbay0GCrsHp7yTfnHLnsBrtN545RCgyiRzYunLb3ODzlC4FGLflLJ8beNq2PBmS/ZhaRDWKQ6ptZa7iKCYPj5N86TjNoDmIyR6Riip3Yqa6UszP67aE14bC2yUKNPi9tr3UzOdyG81LoPtmTeOan/34GFSnpncDCPvUeQVkOaA4ocmrkxNiNs0XOGs8VjcjNntuffEWi3YQQ4pWEehprrWm76dBGMJhijD0Y1JRBvfaR4G7ePmUsfTBkU/NgUDD5LLYjEyUi02tBpN2noQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IN0aTFZb+dZvw0CLKqX9CS2DdfkRTRhU0WnCHvpsLFE=;
 b=fzO1Qqafg96yVy+kzNwg0X3Qm3vlwCAE/izrDfVoIqtNefrSRnP5vkmARbuhBbZCKpVXG8/YhUCVhD8K4jDe5Ei6Ep4b3tpYF9iU51PKHsPBGbAVvat599HzcyAVk9Y/Oc5wJolDHkzERVQXFx8fWbArWVZ2gW9WP1VwszD3cneSGemqB4cbD+2gE0ZPrmR6H69xD1U1EoLByTWF22+XYIMPRZ8hoWaabkhcX1RySgh18VNjCP3znkYoe/lrRCFPmzwp/Nn7+gWh3uHDXRRdLtcnutyuijDmEEz++1ePKqnuh59edKOP6OW4gVpvM6PiDV/2fC/fGPQ6G93+cSrCMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by IA4PR11MB9132.namprd11.prod.outlook.com
 (2603:10b6:208:56d::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Tue, 28 Jul
 2026 06:26:37 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687%6]) with mapi id 15.21.0245.012; Tue, 28 Jul 2026
 06:26:36 +0000
Message-ID: <ad708389-4855-43e9-acec-a46ced10fd45@intel.com>
Date: Tue, 28 Jul 2026 11:56:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/debugfs: Add knob to wedge on first page fault
To: Arvind Yadav <arvind.yadav@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <matthew.brost@intel.com>, <thomas.hellstrom@linux.intel.com>,
 <tejas.upadhyay@intel.com>
References: <20260717082243.337548-1-arvind.yadav@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20260717082243.337548-1-arvind.yadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0013.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::13) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|IA4PR11MB9132:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d4a1a01-7aa0-4588-b167-08deec712d07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|10067099003|5023799004|11063799006|56012099006|6133799003|10086099003|18092099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: f9IcSX+M5Ch6nTZ0km4JeOsGS1/fkMoEdnvJhopC1ga3oduPUEh7lUR2urJiE+BcyD0jlehwD+hjR3LyVgSoYGbiZIrYYA3h9WLqCg6CXbSHjnkhDbte5tX2XDb+cRnEp2bhscLW/j2JfggCqZhFQcsPwbs88/8nAhJLVRoIxOMAB6L2som2xqiO+2rORNuneHi1PEied7qnQpqgwhw98Y94i5sqpAiADXQhFgDaUxtAs/bFpcr3QAJXdYrRjWXCsxduByNHGVtn2FFYbq3/aqtNqdrAWVwOB5F9FPMjlxr+psOY3Uym7YqLhPx+IpbrogiSIynUPRySpBDs9EQ+eIJ8QHHVdB09y4uwIo1WqhDu/u/s003l1MQQ8w119wd4Xfskp+y7F9LKSfPkQyB0RS0MtP9b2dqxqlFvdxfGqmFk4Rwe7TGDs5Oztp9wFLbB/3kYFBnUTQEMcsjKNKAa9HKBhGjj3IuLX+XXan8k/N2QYhaxsOTXEzar8ZLTo2wKYZKxH04YBMAoAvSJruaJITvTXFy8dU6YfPaZi1yA4ur3mOqasmbkTeapl/Ay7rucPfTYt0gLdQJuT5jI3YPOWeRQ4aeMFgAPu6eF1pWBRLMiJNryAMRy9QyE7sIOBrc0nDHM6jfESi1NLDrMraFntx6NU0gaGE5dwqZuoocI6sE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(10067099003)(5023799004)(11063799006)(56012099006)(6133799003)(10086099003)(18092099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eW5zSzNFcFQ2SDdpYkZOVlBuSWxQYWhwQjlESlp0UmpveUhCTXFLeDk3SW1G?=
 =?utf-8?B?Ny9JeTNPM3VOcS9KeVBZMXc5T3BSb3NoR3JkQTNzL2REUDZ1TGF1OTZYais2?=
 =?utf-8?B?bmE2WTlzUUJBTXZUWVpxbWZJNytwVkZyV2MxdkVqbG55QVQvNzFmaFFJdUgw?=
 =?utf-8?B?b0pQYXh3emdsWU9yaU9uYk1RT3dpS2Q3ejJZM1prNHZSYlBkQk5HOEZHY09t?=
 =?utf-8?B?WW1pZUVvcWVqOWltdHJ6WHJqQzRSYlVRNmJ1S3VYbjMySEhmUjhmUldhdGNS?=
 =?utf-8?B?T0pVRGdWOFQrWk4rTHBuREdjSFNSQnB3emkvWjhhOEJLR2k2ZmE0VWozeE5D?=
 =?utf-8?B?TzFPNUFIYkFPRitzNDE5Q0JqTU1MQWJrZG9zSXJwMWkwUE1CWDFJVWRVUk50?=
 =?utf-8?B?cE5qdnNOREV2ZDRIQUg2L2grQWduZHN5SjlJc09CVHdUV1Q2VUREMWl6aUdx?=
 =?utf-8?B?MWVVWjdFaCsrNmJTcjRsdmRXaDl1dERMd3VGczA0K2FQYzN2WUdjaTZuK05L?=
 =?utf-8?B?ZkFnYW43anBESVJHSXBkRVJtWFFQbTFYSmlYM2ErcWJCWEtsZ01iNE9UZHRa?=
 =?utf-8?B?UG1qNmt2U2lKNDZROEdUYkVpWFczclBtK2NBWmpyUThNUzZuQ3ZuRW1BejNq?=
 =?utf-8?B?L2Y2QzY4SVNtT3hWSGx1ZnlkdHlnV3J4QW9JQWpEYlQwSEY3dFhobkxCajYr?=
 =?utf-8?B?YkRMcUNTZytVVUxpYnZ1NVNaM0NsblJZWWc4M29JaFhRWVk2UngzUVByYTVh?=
 =?utf-8?B?Q3BYKytZOVdxR2FYNTRFUnlHY24wOW9lNFNBWTdJVVVneG1EU2lNMVNDbVds?=
 =?utf-8?B?NmdEbVZIajU2Wm5tZFpONWE3RkQzNEFTN0FYbHRpOGhNb0VFSzhRTWE0Mnl4?=
 =?utf-8?B?UG5xTUJqSFZpQ2p0MWgvR1psRXZJMU9qbDRSUFczYUhJUWxGTnhtZEV1Wkhw?=
 =?utf-8?B?VWJmNkNmK1VVckR2UEhTYlpvSDdiQmwrWmZEcE1sY3NBWDZWZWVJSmExWHlt?=
 =?utf-8?B?UTBaRDlsTjMzU1VDY2l1eWsvMnJ5Z1BLdjhLUHJJeXN1aTRyVlkva0QrOE1m?=
 =?utf-8?B?Q0tiWVVycXlydHBsdERKdHlheG9tZC9IbGQwbEo1T0gzdWQxT2gyUi9UZlJk?=
 =?utf-8?B?VzBIM21adnpWcC9MU2kvY0lSdVdwK0FqMDZXL0N2K1krR3N3VDdBejlvczJ3?=
 =?utf-8?B?aGIvZHRzYTlqOGVoZkpjQ3pldTVueEFLQlo0a1ZXeHRZNnZsdFlUVjNpc0Fl?=
 =?utf-8?B?QUVHaEpvMmdIWlNzcEl6ckExYllscGFjaEhVMTk0VTJ5NWpmY3BETUMvWm0r?=
 =?utf-8?B?ZXVqYnRsSHdmZllxbG50UWJVdkZsODRjS2VTeWZQS0lCcFBQV2NMK0lzM3Va?=
 =?utf-8?B?Vk9KbWdCVktjQ2FMdTZiZW04Y254d2ptTVVFTXVuZWM5WHN6b2l4RjJxOXp1?=
 =?utf-8?B?YW9Lbk1JQWxET1M3bzhBY05jWGF1ZXFPOGpVbEplaHo0ZE9mdXVQOE1LUGpK?=
 =?utf-8?B?L1U0TFc0L3lDNlJLU0VOQ09ybVplUXVyVGlDcHdobUpEcUIrZEFmWFU2bmZ1?=
 =?utf-8?B?N0VZMjZ3SDZCN2J5YjBzYS9NaG9PdmlXY1NyL3VkZytzbDdlWFFhcjczU296?=
 =?utf-8?B?elpuSDVsTHE4cjNZNEt3NHQvbGFmckpyaldxNWw5eVRBRm1vUDVGUVc0NW1M?=
 =?utf-8?B?NEpabEJWa29WTEozN3Q1ZjJ1bXArdVNsd2RHV3E2Wmd0R0hpR0JnQ3pvS3VI?=
 =?utf-8?B?TlpSYlFzWms3RmVIMDVmRDRKSm5pVnBEVUY4YVFyN1dqcTBIQ2VwWnZ3WWhy?=
 =?utf-8?B?c0hzSE9BUmFxS2poTFBLSTRhMHdSU05kUS9YbUVWKytKT0ZOZHk4RDVPeG9S?=
 =?utf-8?B?RXd6QmppTDNINjZyNWk4TXBtV1NESnl6ZXlVZFJLMWdOaEdkYisvajJLVmMy?=
 =?utf-8?B?MTh2eEg0K25GY29zWmNlQktHMUtrSkN3em1MdVhTak5idXp6NWl6R0lVMEVa?=
 =?utf-8?B?NTZNTnZzaGJVTWJNRlN0Y0dkZG9QMlh1L0J4K003TXFSbHJydzdBMjN5MCtJ?=
 =?utf-8?B?OHRvNnlRV2VSR1pVS0tFYTJOTnNqQWw5UDFHRGQ0Y0RqdS8xZTdvNC8yajVr?=
 =?utf-8?B?ejJnZnRDREhKMDdnbUxTdXVHazMvdHA0UzRWd0xwTWN6VHZ3QzlveDNPT2Z2?=
 =?utf-8?B?bUlJQTJqdGJWNENZUEVYbmZ6NGtTQ2dHa1QzemwySVgzSDdsNmFxdzFHQWY3?=
 =?utf-8?B?QXhCZ3ZzcnlkazI4L3ZGU0RPczhCSVRxbjhvSVhzMHY5TlZFcHdEcjNsTk1X?=
 =?utf-8?B?a1g5R1JDSmR1YVhOTXNrSkRUZzVRUVRtbWp1cVVQNEFmcUh5TVFHTlpwc29u?=
 =?utf-8?Q?xoQvoQaobTZaNq3Q=3D?=
X-Exchange-RoutingPolicyChecked: bBo79H43QCoJcId5qg5i6gk9Tv5iKRymgPelIF9s2ws5hpmnGkBi7fLKkwZmb7zufzpdeX5y8CKmb3GQFKWV7mTqomIBr0WwKiuz6Tc3PJIwdqf5THIPMUasD4JoCY9ZbV16uXW7767/BJwLXLxtxNOTnGWC8iHs131AepmOX2mfWc3QWoNpfMwEjb19bHVrk378tgiKcIYyHIwHLxJpxx/hr9SqjMck+qsaRQMP4L8C3Wqp3WUpzj84Q3QprAVkIWhOmWBn8sUhUTLz8XMjcgWQa1WbNiwm7wccnvmytyJB31hKpIX9XVnUzxbSvKSMIa/Mafvvx3ZoxAlDrIUD0w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d4a1a01-7aa0-4588-b167-08deec712d07
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 06:26:36.8584 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yUORsOW0hKNw8s/FLHhSpveGlOKnxhlIELDL0O1kgbc/rnflfRJum0EGfA7KyIMtpR8cMMGPQLgzJblOA9SkyIumvYgk1HHpGkL5NmE2+Pc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9132
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



On 17-07-2026 13:52, Arvind Yadav wrote:
> Add a debugfs knob to wedge the device on the first GPU page fault.
> 
> This is intended for debug where preserving the faulting HW
> state is more useful than servicing the fault. When enabled,
> the first page fault is printed and the device is declared wedged
> without servicing or acknowledging the fault.
> 
>    echo 1 > /sys/kernel/debug/dri/<card>/wedge_on_first_pagefault
> 
> v2:
>    - Move first-pagefault debug state under xe->wedged. (Matt)
>    - Queue the wedge operation on the GT ordered workqueue. (Matt)
>    - Drop xe_pagefault_save_to_vm() from the debug path. (Matt)
>    - Cancel pending first-pagefault wedge work in pagefault fini.
>    - Re-arm pf_wedge_triggered before enabling wedge_on_first_pagefault.
>      (Sashiko)
>    - Use release/acquire ordering between debugfs enable and PF worker.
>      (Sashiko)
>    - Do not clear the latch on disable. (Sashiko)
> 

LGTM
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_debugfs.c      | 48 ++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_device_types.h | 17 ++++++++++
>   drivers/gpu/drm/xe/xe_pagefault.c    | 34 ++++++++++++++++++++
>   3 files changed, 99 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index 5a3877fcb0f0..e65e233fdfcd 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -614,6 +614,49 @@ static const struct file_operations disable_late_binding_fops = {
>   	.write = disable_late_binding_set,
>   };
>   
> +static ssize_t wedge_on_first_pagefault_show(struct file *f, char __user *ubuf,
> +					     size_t size, loff_t *pos)
> +{
> +	struct xe_device *xe = file_inode(f)->i_private;
> +	char buf[8];
> +	int len;
> +
> +	len = scnprintf(buf, sizeof(buf), "%d\n",
> +			READ_ONCE(xe->wedged.on_first_pagefault) ? 1 : 0);
> +
> +	return simple_read_from_buffer(ubuf, size, pos, buf, len);
> +}
> +
> +static ssize_t wedge_on_first_pagefault_set(struct file *f,
> +					    const char __user *ubuf,
> +					    size_t size, loff_t *pos)
> +{
> +	struct xe_device *xe = file_inode(f)->i_private;
> +	bool val;
> +	int ret;
> +
> +	ret = kstrtobool_from_user(ubuf, size, &val);
> +	if (ret)
> +		return ret;
> +
> +	if (val) {
> +		atomic_set(&xe->wedged.pf_triggered, 0);
> +
> +		/* Clear the latch before making the enable visible. */
> +		smp_store_release(&xe->wedged.on_first_pagefault, true);
> +	} else {
> +		WRITE_ONCE(xe->wedged.on_first_pagefault, false);
> +	}
> +
> +	return size;
> +}
> +
> +static const struct file_operations wedge_on_first_pagefault_fops = {
> +	.owner = THIS_MODULE,
> +	.read = wedge_on_first_pagefault_show,
> +	.write = wedge_on_first_pagefault_set,
> +};
> +
>   void xe_debugfs_register(struct xe_device *xe)
>   {
>   	struct ttm_device *bdev = &xe->ttm;
> @@ -665,6 +708,11 @@ void xe_debugfs_register(struct xe_device *xe)
>   	debugfs_create_file("disable_late_binding", 0600, root, xe,
>   			    &disable_late_binding_fops);
>   
> +	/* Debug: wedge on first page fault to freeze HW state for inspection. */
> +	if (xe->info.has_usm)
> +		debugfs_create_file("wedge_on_first_pagefault", 0600, root, xe,
> +				     &wedge_on_first_pagefault_fops);
> +
>   	/*
>   	 * Don't expose page reclaim configuration file if not supported by the
>   	 * hardware initially.
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 022e08205897..f0862ca9cb5d 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -496,6 +496,23 @@ struct xe_device {
>   		unsigned long method;
>   		/** @wedged.inconsistent_reset: Inconsistent reset policy state between GTs */
>   		bool inconsistent_reset;
> +		/**
> +		 * @wedged.on_first_pagefault: Debug knob to wedge the device on the
> +		 * first GPU page fault instead of servicing it, freezing HW state
> +		 * for inspection. Only exposed on USM-capable devices.
> +		 */
> +		bool on_first_pagefault;
> +		/**
> +		 * @wedged.pf_triggered: One-shot latch for @on_first_pagefault to
> +		 * ensure a single wedge is triggered per arming.
> +		 */
> +		atomic_t pf_triggered;
> +		/**
> +		 * @wedged.pf_worker: Declares the device wedged for
> +		 * @on_first_pagefault from the GT ordered workqueue, where
> +		 * stopping GuC submission is safe.
> +		 */
> +		struct work_struct pf_worker;
>   	} wedged;
>   
>   	/** @devres_group: devres group */
> diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
> index dd3c068e1a39..7580baeb277a 100644
> --- a/drivers/gpu/drm/xe/xe_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> @@ -288,6 +288,14 @@ static void xe_pagefault_save_to_vm(struct xe_device *xe, struct xe_pagefault *p
>   	xe_vm_put(vm);
>   }
>   
> +static void xe_pagefault_wedge_work(struct work_struct *w)
> +{
> +	struct xe_device *xe = container_of(w, struct xe_device, wedged.pf_worker);
> +
> +	/* GuC submission stop/start must run from the GT ordered workqueue. */
> +	xe_device_declare_wedged(xe);
> +}
> +
>   static void xe_pagefault_queue_work(struct work_struct *w)
>   {
>   	struct xe_pagefault_queue *pf_queue =
> @@ -299,11 +307,34 @@ static void xe_pagefault_queue_work(struct work_struct *w)
>   	threshold = jiffies + msecs_to_jiffies(USM_QUEUE_MAX_RUNTIME_MS);
>   
>   	while (xe_pagefault_queue_pop(pf_queue, &pf)) {
> +		struct xe_device *xe;
>   		int err;
>   
>   		if (!pf.gt)	/* Fault squashed during reset */
>   			continue;
>   
> +		xe = gt_to_xe(pf.gt);
> +
> +		/*
> +		 * Debug mode: if armed via debugfs, wedge on first fault instead of
> +		 * servicing. Print the fault, then declare the device wedged from the
> +		 * GT ordered workqueue (where stopping GuC submission is safe).
> +		 */
> +		if (unlikely(smp_load_acquire(&xe->wedged.on_first_pagefault))) {
> +			if (!atomic_xchg(&xe->wedged.pf_triggered, 1)) {
> +				xe_pagefault_print(&pf);
> +				xe_gt_err(pf.gt,
> +					"wedge_on_first_pagefault: freezing HW after first fault\n");
> +				queue_work(pf.gt->ordered_wq, &xe->wedged.pf_worker);
> +			}
> +
> +			/*
> +			 * Do not service or ack. Stop processing this queue so the
> +			 * captured state stays close to the first fault.
> +			 */
> +			return;
> +		}
> +
>   		err = xe_pagefault_service(&pf);
>   		if (err) {
>   			xe_pagefault_save_to_vm(gt_to_xe(pf.gt), &pf);
> @@ -380,6 +411,7 @@ static void xe_pagefault_fini(void *arg)
>   	struct xe_device *xe = arg;
>   
>   	destroy_workqueue(xe->usm.pf_wq);
> +	cancel_work_sync(&xe->wedged.pf_worker);
>   }
>   
>   /**
> @@ -397,6 +429,8 @@ int xe_pagefault_init(struct xe_device *xe)
>   	if (!xe->info.has_usm)
>   		return 0;
>   
> +	INIT_WORK(&xe->wedged.pf_worker, xe_pagefault_wedge_work);
> +
>   	xe->usm.pf_wq = alloc_workqueue("xe_page_fault_work_queue",
>   					WQ_UNBOUND | WQ_HIGHPRI,
>   					XE_PAGEFAULT_QUEUE_COUNT);

