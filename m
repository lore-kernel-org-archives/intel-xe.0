Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4E091093163
	for <intel-xe@archiver.kernel.org>; Fri, 20 Mar 2026 02:34:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6987A10E46E;
	Fri, 20 Mar 2026 02:34:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g8W0ybGE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ECEB10E46E
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Mar 2026 02:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773974090; x=1805510090;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3LmOsQI20jMdlLUSaCi2lPIPAxnconBTOZSxMnKSZa4=;
 b=g8W0ybGEvh8VOwm7GCfMhlDMffuIMS9q9Gf/rtIy7W/Bcbqyz0qnl3Y1
 Gle2XuFtyV/KswmMG5Dk5Vh+Ma0r1a52jWS7aun27NlepL7W3FGuzzfR9
 qcAUlPHxGc+skkV6HMPKrYL2YlrBe4q3gHRgqNQhCD8GVfOH4BFzFB9p1
 2JXzaZvEKslw1IXRnn4jR2bQaQXd/+n4I8x9yAMfnld43aLaJQc6gI22n
 RthsKsSLUp7AUN3z/TMgKBNctHRdmam66lj7Jvuq2HYNLErCXSMZekpFn
 JnFhigxAOKIGXfmi4JH+GP+YNxs6Z70CcxTzTVhlFlpfdVW7nU3M361gK g==;
X-CSE-ConnectionGUID: G/DfLlfvRN69cWBUTiZOMQ==
X-CSE-MsgGUID: SrJ4Ci+oTYu8NddWscebgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="78915342"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="78915342"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2026 19:34:49 -0700
X-CSE-ConnectionGUID: aPyUIfXWQKyyUSwF05KEyA==
X-CSE-MsgGUID: 90Y4in3KRimVfyILT1aa0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="227863771"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2026 19:34:48 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 19 Mar 2026 19:34:47 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 19 Mar 2026 19:34:47 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.52) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 19 Mar 2026 19:34:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A1zt03mjYwGg9MrDI+M8gMIGcJ+NWsUhCwL0g1ioE1RCTJECnTpCn54iEO6lAjNoTfavmKqXAjmj3bfYdT1QiACOo2qgFEd2HKJYp0051e2qjzXwCCEz0uR7p3XA1z/az+ocXEYaT7wKHSLq4s7w2byoNHQEYL/E6t2Ek+fSmDBG5qqvCNf90a34Eu3S5AslKXuUFiTBt215EwS4xfW/esTJb9vqX2Af8TsIg3hFl+k78c5GSXZBsc22VvgElGMNz7J4arILZNgPOPXJqkIk/BSJqkEiwjs8CT6F94huvjztV/lMqH5/tYjYgbscMzYiqXx7fA41syLZIpvp8rfuCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PTDXGdGnyXMVuQcZdAZQp2qfjzXL4RuAlAsnrX+gKBo=;
 b=EGJ5iIGaG5rNIIBi90iGIB5Ij96+uCEXbX3tclR4YbpE3FnDZuBuW2joUJEIv9nUfDFTYSTr7avNdicT17SjvjA+2k2nJ97Etdlw7E5rsS7xpqtTiCFfht/RzD74BI7DCN/mF1loTFbZUkMB1CLZ/k31tA/pfAPm+0/6d9R5hjE4WwTzVDaGdZZAdZaQHu6q16tJv40vAP57+y5W264F/VQepkpPCLT/hxqOvBtjcR3ytuwWZoelyzMkJDOxZLVe2vQyNYPqlS2SP71kB2uXF1DdCLPwpozSzUMIOwDGgdMygNvwGJBwbM6NR3NkQhFnK019Zmad/X3VoQEDwk+CCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN0PR11MB5709.namprd11.prod.outlook.com (2603:10b6:408:148::6)
 by IA3PR11MB9110.namprd11.prod.outlook.com (2603:10b6:208:576::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.13; Fri, 20 Mar
 2026 02:34:45 +0000
Received: from BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c]) by BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c%6]) with mapi id 15.20.9745.007; Fri, 20 Mar 2026
 02:34:45 +0000
Message-ID: <883988b4-3342-43f6-845f-197ac5bd4a16@intel.com>
Date: Fri, 20 Mar 2026 08:04:37 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 05/12] drm/xe/vm: Prevent binding of purged buffer
 objects
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <matthew.brost@intel.com>, <himal.prasad.ghimiray@intel.com>,
 <pallavi.mishra@intel.com>
References: <20260303152015.3499248-1-arvind.yadav@intel.com>
 <20260303152015.3499248-6-arvind.yadav@intel.com>
 <d5bea30262495b41f0ce97ba5b62161bb8c52e3b.camel@linux.intel.com>
Content-Language: en-US
From: "Yadav, Arvind" <arvind.yadav@intel.com>
In-Reply-To: <d5bea30262495b41f0ce97ba5b62161bb8c52e3b.camel@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0188.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ac::8) To BN0PR11MB5709.namprd11.prod.outlook.com
 (2603:10b6:408:148::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR11MB5709:EE_|IA3PR11MB9110:EE_
X-MS-Office365-Filtering-Correlation-Id: edae0e74-05f8-476c-d159-08de86293f7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|18002099003|22082099003|7053199007|56012099003;
X-Microsoft-Antispam-Message-Info: jgGgIBOn0VEE0VkTHyjYDXCf8AAPfvZGkhU2plbgFRS9wW0K+/T/bB76eKqbMG0NGMMQPQrnkn8o/MvacWz2OhSxofRIVorBRrwvE2QDmauIu7pQZRwK9RxA56I0EUUliuReJNIeFpHzJyBojx6X6sgm1II/q7Ti93QKVoqYsJnp1NEdyvCXf7FFnkg7+QCv+D0JrSuETYpqDgduRmaCfqoEIE+Rl4W5hRZXM3eKSVbEDsekmH6U3naZTDQ8s0zeeUHQ3970kqpSw1sLLdL7a5EZ0W5yEaD4BvlewTSLosS3gsf/iNGONzFtQqEX/o+VkrKgrxD/Ig4WsKUgJkrINqEfV4fsD2lwesZtHPM6Rieqfgo1DZ3Da5t+u7Gfw89C0bZsWaBTDHaDwjYlKSMHerpzOhflyimllwnLaKaccj/6ZihDER1BTrDn3coAsNZoOMp0icsqVQUtN9ppvOOUx0dnsGvjar5t1WW1ZnRcG8nMsYcmohNZ4pzKeoaEc/xnt+iTynfLilVSw5XxVJkYJlVki4kS9oIv30wcEIRyk2yDcbtZRoqsyMYC61BC1BbzwuG6FwQy/zetJ5wKGY6A+a1S6Gxurs+IppCTP76p1XK1UCOd9aeSCiVG+aD/R1WcPYX6SRoLIKslGEXnxo2ehhbhQE9f0LgqbRC5gww9lfZqFH9BCn2uCbiJLTb4BrmXC7IUz8e48JNfZ+CPniAOlP6RQj5HjRIuZ6OWkmA7I3c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5709.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(22082099003)(7053199007)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a25yUCs3cG55T09nV3lDZFhSUW9NZnhUbDdqRElPVEtaV3ZHZ0thN3daYTdm?=
 =?utf-8?B?Wnl2OHRUSGlUNGxaMTdJQ1luOTFTRXdwTW1KczdnVDFOd3pZcFZMR2JXaG4r?=
 =?utf-8?B?cjQ0TkxDTnFjaGJLTllvZUdQSFAyZVRDWkZPc0JFbHlKL3JkaHV0K050UkZM?=
 =?utf-8?B?TmZFQW1NV2Q5WjVkb2hPcFJnNW1nSzdZN01SaG5GalhUSlpvVkgzckhRbTZP?=
 =?utf-8?B?d09COUJZYUhhaUVYMTQ0VkNmazgxYVpKSlRYSTNuaDB4aUZQQ3hxeUQxakRk?=
 =?utf-8?B?M1pPUVhRb3Q0TllVOHc5S2E3SVVvd0s0d0tic0ROVFdHcTRPMjB4bURZMGtv?=
 =?utf-8?B?M3hmVEh4M0NHU2NBZEpwZEYrWmdPQzdXMHFVbGxqUXlNMlg3ZlBqNC9hSzFs?=
 =?utf-8?B?dHAwelYvb2JJSHNsek9POG53bXE0MTdtMHcxMlZrS1NUSmlxY01YMFcrK1ZP?=
 =?utf-8?B?V3VVWFJtY1hYM0FabHdkbXdxQmVBQkRzdmlQWGpLNWR5UG9pZXpwTmQ1TS9D?=
 =?utf-8?B?cjlIVXJQU0c0eGRpSk9sa25zKzV6c0YyMkFKZ0JSTk0zajNHVTN2RW1Dcmxy?=
 =?utf-8?B?MmJBQ3RDMDJ1N1dqNlBXVGpJZkZSbnJNWitkNnFLZHpmMHRieUlPOVp6K1ZP?=
 =?utf-8?B?NGcyNHNmdE4xMWNkNHdFNzVCYXk4SC9tMHNLTUdzV2pZckJFeXBpVUpGRExv?=
 =?utf-8?B?THBzN3BwaEUzb0xhYUlkeG5UTHp0NFU5eWpNbzZFc0Q5OEhxbHZWWWQ4djNl?=
 =?utf-8?B?RG1nWGFIYXdUdVFBQ3Mvdkw1OCtUcyswRnBqZDJTZGZrUW8yRC9JaUQxRDFz?=
 =?utf-8?B?OUJoNTM1ZlNQc0w5UHFDdEJWVmdpZ0tKYTdZb2RQRU14a3dxUmlseTlkd1pQ?=
 =?utf-8?B?L0xBNXNjdGlNWHZEUzJYMW9KMVl2a2FoRXY0K0h3WW80Tno5SURCQUR5MGxa?=
 =?utf-8?B?MEIvWlpCbFk1OFVoOFBIRHFlOWdBRzFGTEpheUpjV0ZjVkhiSFF1ZVhRb0tD?=
 =?utf-8?B?dkFTbnhhQjhnQ0hZQUlqaW0yS3pOS0lGZ05xUlN5R2ZIUDdPUG5vWmVwYkJ0?=
 =?utf-8?B?RVFENGFYNW11TGw5Sks5SUd2WDc5NFNiSGcxNVEvdEEyVUp6VGNiOEFoS0Jw?=
 =?utf-8?B?RHd2Ri95ckFiN09CRXZ3WE9vaXoxUmwyR3B6MWVGcDBkaGV3RHkvWWdGU3ZR?=
 =?utf-8?B?a1dUcmhDVnpFajg0czF3M2p3R3FGeEJVOUlCNW1mUG8wS3QrTmEzamg4cTJl?=
 =?utf-8?B?cVc5NEJxNkZtSDhHcVJxcVJTNmZnaDNTYytNemZWejFCNEMxcWFBbnB2OXVz?=
 =?utf-8?B?MmdWUzNSdzVVbHk5cUJJeVloWWNRMnBaMXZaaXZxaEk2YnNza2pXRTJYWnpl?=
 =?utf-8?B?Z2NiRVRXUEdLOTBqT2FuMWJxcjF5SVVFMEJpZ3h0ZGoxZkxGeFBVYmFXQ0Qx?=
 =?utf-8?B?b0locExDcU1nSFZOS1diak1TWTJmdUlXa0J1RjlyaTVyZjNmL2xqVHlWUlZv?=
 =?utf-8?B?aE1PTzR1NVFScXZqU3JvL0tqcmhuUUIrNThZMUpabVk0aTRBR1A5ZFJHcWxW?=
 =?utf-8?B?ekVpSzcvaVczdTQ5SjJuOCtTeDJHVlduWC9DdFYvcXJhTmFvRE9nT0x0eGRk?=
 =?utf-8?B?ZEt3dXRzcXlZdlBCM3MyY0c3MWI4R3BYdEdvc3BlYW5PNDBqMnF5YmVTVUxW?=
 =?utf-8?B?Z0I1Q1FGaVoxMERrRlZ2VU55bnc4cU5BeWJNY25qRXhyeFpNVUVVeWtpMmVU?=
 =?utf-8?B?R2hyZHdQNmg2YVdZVy9NZlpQVzQzYkxoUGxDSUV1NzdzcTJ6VmRvQlhZNWJK?=
 =?utf-8?B?VXJaTENJQ3NyMXA5MHI2d0xiT0JKdjJhRGJVT3p0OFBSMzFkOGgyZHN4empp?=
 =?utf-8?B?czQzbHB5dHJsNjI3SnFnaU1WVmZqQkVkVlRGYXIwQmRoU2hJR2lpTTNmSXJr?=
 =?utf-8?B?SlJLT0pEdkZ5aVVEOUV5MWdGdm5pT1o4RGdrVjFHL2orWlhIdEdXSmhDZEVW?=
 =?utf-8?B?aHRINENsd0ZlbjVieCtOK1lOaHhTeVNsRnhSalpOenZmYy9xMHdONExyY21Q?=
 =?utf-8?B?VXNGbTJXeXN6M0V6MCtsckYrck90UHovRGpBdG5JRTBlall3L2xXRDFKcHcy?=
 =?utf-8?B?NkYzVDZyaDdRVm1rNjFkOFA2OG9qY05nTG5sVkJJNyttYnorakV3ZGdZbFIy?=
 =?utf-8?B?YjJSTHpwclVieFFEWXBJVFJpQjhEYjhJaG95ZzhwNE54UDNDc29tZGMraDNi?=
 =?utf-8?B?WnhtQy80aHZaczh5Zm9PRWpXei9mUXk2SGVmNGREckZ2RDFobVUvRjlLODd5?=
 =?utf-8?B?RXV4Mkk5MVRzbHFoTUFVQitpaUkyZzdHcFBIMnR0RkM1aDZJU08rUT09?=
X-Exchange-RoutingPolicyChecked: oxpS1M1fbjX6MndBYgwpYxFq3aJ2evDJaSxk0pDoDLXKihpAs9vnndIEBcz9+UQN5LcWn2cP6CfuLVCfYmP83jGdWfuhQEeNjkT3v9K58ulfemauW5NDqldECYGkvKvzND3MhnoXRZ7W32mj1yTpsTS1vAs1LGpuBUkyoF9J9M+sIGymmQRX5KBWthTIhHpfaBsbNZTnVSfo7Par0JW1NBzFLVybGfDXXedUzs7mOftpcoNeVBo9wrI6WUn3tlmx/Ux9GuFHaBxZOUQpExRQooZi/2Cj4VR3kUSt8rR+i6OOrtBm6DgZg3e96hZ7EFVPGHzREW8uVcIrXNU9NcfHXA==
X-MS-Exchange-CrossTenant-Network-Message-Id: edae0e74-05f8-476c-d159-08de86293f7e
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5709.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 02:34:45.3463 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dTaghMLOZ7+A9Qbs099dPlUIKrh6RgG860qhYWpMaHHEUD4+BGiNIhvGh5Lfwuv9DTTTDF0yz7u1HBthO0ihMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9110
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


On 05-03-2026 21:08, Thomas Hellström wrote:
> On Tue, 2026-03-03 at 20:50 +0530, Arvind Yadav wrote:
>> Add purge checking to vma_lock_and_validate() to block new mapping
>> operations on purged BOs while allowing cleanup operations to
>> proceed.
>>
>> Purged BOs have their backing pages freed by the kernel. New
>> mapping operations (MAP, PREFETCH, REMAP) must be rejected with
>> -EINVAL to prevent GPU access to invalid memory. Cleanup
>> operations (UNMAP) must be allowed so applications can release
>> resources after detecting purge via the retained field.
>>
>> REMAP operations require mixed handling - reject new prev/next
>> VMAs if the BO is purged, but allow the unmap portion to proceed
>> for cleanup.
>>
>> The check_purged flag in struct xe_vma_lock_and_validate_flags
>> distinguishes between these cases: true for new mappings (must
>> reject),
>> false for cleanup (allow).
>>
>> v2:
>>    - Clarify that purged BOs are permanently invalid (i915 semantics)
>>    - Remove incorrect claim about madvise(WILLNEED) restoring purged
>> BOs
>>
>> v3:
>>    - Move xe_bo_is_purged check under vma_lock_and_validate (Matt)
>>    - Add check_purged parameter to distinguish new mappings from
>> cleanup
>>    - Allow UNMAP operations to prevent resource leaks
>>    - Handle REMAP operation's dual nature (cleanup + new mappings)
>>
>> v5:
>>    - Replace three boolean parameters with struct
>> xe_vma_lock_and_validate_flags
>>      to improve readability and prevent argument transposition (Matt)
>>    - Use u32 bitfields instead of bool members to match
>> xe_bo_shrink_flags
>>      pattern - more efficient packing and follows xe driver
>> conventions (Thomas)
>>    - Pass struct as const since flags are read-only (Thomas)
>>
>> v6:
>>    - Block VM_BIND to DONTNEED BOs with -EBUSY (Thomas, Matt)
>>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_vm.c | 71 ++++++++++++++++++++++++++++++++----
>> --
>>   1 file changed, 60 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index c65d014c7491..4a8abdcfb912 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -2917,8 +2917,20 @@ static void vm_bind_ioctl_ops_unwind(struct
>> xe_vm *vm,
>>   	}
>>   }
>>   
>> +/**
>> + * struct xe_vma_lock_and_validate_flags - Flags for
>> vma_lock_and_validate()
>> + * @res_evict: Allow evicting resources during validation
>> + * @validate: Perform BO validation
>> + * @check_purged: Reject operation if BO is purged
>> + */
>> +struct xe_vma_lock_and_validate_flags {
>> +	u32 res_evict : 1;
>> +	u32 validate : 1;
>> +	u32 check_purged : 1;
>> +};
>> +
>>   static int vma_lock_and_validate(struct drm_exec *exec, struct
>> xe_vma *vma,
>> -				 bool res_evict, bool validate)
>> +				 const struct
>> xe_vma_lock_and_validate_flags *flags)
> Small structs like these can be passed by value rather than by
> reference. It's done elsewhere in the xe driver, but we've also seen
> people complain about ABI incompatibilities. I'd recommend passing by
> value here to make the driver style consistent.
>
> Other than that LGTM.


Noted,

Thanks,
Arvind

>
>
>
>>   {
>>   	struct xe_bo *bo = xe_vma_bo(vma);
>>   	struct xe_vm *vm = xe_vma_vm(vma);
>> @@ -2927,10 +2939,19 @@ static int vma_lock_and_validate(struct
>> drm_exec *exec, struct xe_vma *vma,
>>   	if (bo) {
>>   		if (!bo->vm)
>>   			err = drm_exec_lock_obj(exec, &bo-
>>> ttm.base);
>> -		if (!err && validate)
>> +
>> +		/* Reject new mappings to DONTNEED/purged BOs; allow
>> cleanup operations */
>> +		if (!err && flags->check_purged) {
>> +			if (xe_bo_madv_is_dontneed(bo))
>> +				err = -EBUSY;  /* BO marked
>> purgeable */
>> +			else if (xe_bo_is_purged(bo))
>> +				err = -EINVAL; /* BO already purged
>> */
>> +		}
>> +
>> +		if (!err && flags->validate)
>>   			err = xe_bo_validate(bo, vm,
>>   					
>> xe_vm_allow_vm_eviction(vm) &&
>> -					     res_evict, exec);
>> +					     flags->res_evict,
>> exec);
>>   	}
>>   
>>   	return err;
>> @@ -3023,9 +3044,12 @@ static int op_lock_and_prep(struct drm_exec
>> *exec, struct xe_vm *vm,
>>   	case DRM_GPUVA_OP_MAP:
>>   		if (!op->map.invalidate_on_bind)
>>   			err = vma_lock_and_validate(exec, op-
>>> map.vma,
>> -						    res_evict,
>> -						
>> !xe_vm_in_fault_mode(vm) ||
>> -						    op-
>>> map.immediate);
>> +						    &(struct
>> xe_vma_lock_and_validate_flags) {
>> +							
>> .res_evict = res_evict,
>> +							
>> .validate = !xe_vm_in_fault_mode(vm) ||
>> +								
>> 	op->map.immediate,
>> +							
>> .check_purged = true
>> +						    });
>>   		break;
>>   	case DRM_GPUVA_OP_REMAP:
>>   		err = check_ufence(gpuva_to_vma(op-
>>> base.remap.unmap->va));
>> @@ -3034,13 +3058,25 @@ static int op_lock_and_prep(struct drm_exec
>> *exec, struct xe_vm *vm,
>>   
>>   		err = vma_lock_and_validate(exec,
>>   					    gpuva_to_vma(op-
>>> base.remap.unmap->va),
>> -					    res_evict, false);
>> +					    &(struct
>> xe_vma_lock_and_validate_flags) {
>> +						    .res_evict =
>> res_evict,
>> +						    .validate =
>> false,
>> +						    .check_purged =
>> false
>> +					    });
>>   		if (!err && op->remap.prev)
>>   			err = vma_lock_and_validate(exec, op-
>>> remap.prev,
>> -						    res_evict,
>> true);
>> +						    &(struct
>> xe_vma_lock_and_validate_flags) {
>> +							
>> .res_evict = res_evict,
>> +							
>> .validate = true,
>> +							
>> .check_purged = true
>> +						    });
>>   		if (!err && op->remap.next)
>>   			err = vma_lock_and_validate(exec, op-
>>> remap.next,
>> -						    res_evict,
>> true);
>> +						    &(struct
>> xe_vma_lock_and_validate_flags) {
>> +							
>> .res_evict = res_evict,
>> +							
>> .validate = true,
>> +							
>> .check_purged = true
>> +						    });
>>   		break;
>>   	case DRM_GPUVA_OP_UNMAP:
>>   		err = check_ufence(gpuva_to_vma(op->base.unmap.va));
>> @@ -3049,7 +3085,11 @@ static int op_lock_and_prep(struct drm_exec
>> *exec, struct xe_vm *vm,
>>   
>>   		err = vma_lock_and_validate(exec,
>>   					    gpuva_to_vma(op-
>>> base.unmap.va),
>> -					    res_evict, false);
>> +					    &(struct
>> xe_vma_lock_and_validate_flags) {
>> +						    .res_evict =
>> res_evict,
>> +						    .validate =
>> false,
>> +						    .check_purged =
>> false
>> +					    });
>>   		break;
>>   	case DRM_GPUVA_OP_PREFETCH:
>>   	{
>> @@ -3062,9 +3102,18 @@ static int op_lock_and_prep(struct drm_exec
>> *exec, struct xe_vm *vm,
>>   				  region <=
>> ARRAY_SIZE(region_to_mem_type));
>>   		}
>>   
>> +		/*
>> +		 * Prefetch attempts to migrate BO's backing store
>> without
>> +		 * repopulating it first. Purged BOs have no backing
>> store
>> +		 * to migrate, so reject the operation.
>> +		 */
>>   		err = vma_lock_and_validate(exec,
>>   					    gpuva_to_vma(op-
>>> base.prefetch.va),
>> -					    res_evict, false);
>> +					    &(struct
>> xe_vma_lock_and_validate_flags) {
>> +						    .res_evict =
>> res_evict,
>> +						    .validate =
>> false,
>> +						    .check_purged =
>> true
>> +					    });
>>   		if (!err && !xe_vma_has_no_bo(vma))
>>   			err = xe_bo_migrate(xe_vma_bo(vma),
>>   					
>> region_to_mem_type[region],
