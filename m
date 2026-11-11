Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D4B606A330
	for <intel-xe@archiver.kernel.org>; Wed, 11 Nov 2026 04:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=G03CFtze
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D55010E114;
	Wed, 11 Nov 2026 04:45:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F16C10E114
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Nov 2026 04:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794372337; x=1825908337;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/i193LCX+HeMBohn+XwoLKIi0V8zBAnwMe5JQ/OldKA=;
 b=G03CFtzemBJREyiwE70IN0saBMhIJ4iuyQ4ZIfBK9Bw7wUuaLjJ8EXAo
 KirDlhxWSJHpTxuZqz7tW2OAWN6zBsDwzGNDgzImAgGtd6Eqyq6alFpPK
 1rDT1mv7rE1GPiMK6VFoWi8XE9O0CgqKLZGn6yrMRWaXtycbiUybp4exR
 KeUDC2kD9ABidcEty61TZG4HcAsUwwbsUqhBHFmNjmhNoF+0piwJAaurk
 prwFS0gddIrO7EKemJtMa/ED6HinKjA+Rz1z7bJmmX8W87o1Td+9U3960
 ikJ7T3scBlfNMajqRK8laaGyrgG895yvRmDb2WyVeDJ7O8Mzhn5voDErt A==;
X-CSE-ConnectionGUID: e4EQGoBrSEyvpH63eiLMuw==
X-CSE-MsgGUID: eeoA9238ThSYadEJXv04ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3172323"
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="3172323"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 20:45:36 -0800
X-CSE-ConnectionGUID: 5EELGm5ZQyOTO2m9pFJ66w==
X-CSE-MsgGUID: Lq66GSdxQcWa4M1CUHILaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="8209132"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 20:45:35 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 10 Nov 2026 20:45:35 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Tue, 10 Nov 2026 20:45:35 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.61) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 10 Nov 2026 20:45:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lvh1AX4TQ3dgeVPzhKZwNH9rkLlG10dAS53+LBWLlNbwFC4gcCrHFZs8lsAl+VOM3gS9ZVTE9xP4mKZEjKUSQO9v5ZmCXL6tp+/b6QPtdMfUbZ6IaFrEjM6WKs8v9pSLVypeIjyYOf+XSt1LpLFQrr4v92vK+9R8XgG5YY4CGMiK/fZ6sY/ziHkH6SejSUL6Cag6aciJJu+tvA02dqoeXo9vmBuMQR+doEQOqnhuX3Mg73MnUGl0QZytHvZQvD7MZFbTWS/hYxTUlGvE4GW8nqq+gNUWYNKft1ZtgVgKSnebBxbjg7wA6GYrONTGb7JLYoEKakYUDfwGqsg9QqTaWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pkPD8qH0aDx5TCG9ejc9JxoxU8TzxQVYcwHj0gmpxVg=;
 b=rOs0C7FsOu8LzxIPezjrYqNL8zX85IOmfaJCRz0PXHKk+iPQbYPE2Kn8ODiUqFqKe9nuj0TXkZpXuCZ/y/P4eCeyj/hSOU0BqU0davYdunt3fbrJt9FohpQvm+u1DCxCxyrmaZNnhr3SwyhZN2gZipjjjBjUv7orUcRH3H+cy3Pqvj7uOVqIfqdljtFlffnMHPMfuDUHZ1m4Zk6UI0khACxez2drla+VVYfd3XJI7oHQpLRVINXgsRvIA/9XG+AIrk25eYcZHz7Pmbr34qVaKbfux67BARQ3NszF4MSw3C9tINtLivD6bQbZEhVv/4mp9miOHXFWEyjyW/0nZsAxgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 BL3PR11MB6531.namprd11.prod.outlook.com (2603:10b6:208:38e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 04:45:33 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 04:45:32 +0000
Message-ID: <f16bdbfd-919f-471f-a954-d5e0a7f36159@intel.com>
Date: Wed, 11 Nov 2026 10:15:26 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/8] drm/xe/hw_error: Initialize hw_error_work per tile
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <mallesh.koujalagi@intel.com>, <badal.nilawar@intel.com>
References: <20261106071944.2693854-10-riana.tauro@intel.com>
 <20261106071944.2693854-12-riana.tauro@intel.com>
 <avMQ0euV7JlPysFr@black.igk.intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <avMQ0euV7JlPysFr@black.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0068.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b3::16) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|BL3PR11MB6531:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d5bf433-14ab-43ae-285e-08df3fae9e57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|11063799006|4143699003|261022075727099003|261022105027099003|56012099006|261021121427099003|261026140227099003|261026121527099003|261102123227099003|261021123027099003|261028144727099003|10067099003|261009223027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: gtEVMidk7nSW9dY0/EqTzG+TbrNyQ5LO/KhA2kMbwOc6W5xvR168LMeYAb7wyCYwABztv2D72GORTa3YVZ5rFoYPvAeOzj3utnH/Ostj2+HpjMDSLB7ieB6dOG/pi+YYRy2QOPVUI72IaPwX4eemaedAWGspsXo06puoMFGaLTlexc4kxIRxZfQF5UUTVhyN3HAE32mDVCf0lDxZtiZ4WVlzMUHfCeOwfwC3u7f+ZoPwkfAifxn7qzxe3/TnnGRFVAUNCcCFYiCtU+JtAAi6EnUWp7QWrwjSkJsYAuFe9RYld5sTEfI0sFDpEgYsVu1S/hJBU0OSIig4X2JNH1bZH0Y9lh4TYz4LhLF2L6A980jCCgtcyQcIe6AiMo6s+jOTtQxwdhl9YNABUxHWaoP8W2JswI0zSrsNxS5vB0BH2YejAqZBgLOMMP8UCro4bBYSD4YrVVxcd/yVCqu/o1scjb86BKMoLYb6XkkkQYxojroBVYG0pZaMBnrwPoI7mamreqRLDIoIJR2cxl+ti3Jfc9wS1ZswkGILFKvzL3wzlfmSs+K64OXdLuTfDCx5w2+i4kB0pMXkQdCU94bQAeLS838RaC26kIoYoWi7q2iTt9Dxw/GN2eAUB4VLgSyTgViM0UFSdFm7n0F6w4b1gbccqAPjEKBCCUp2eblQmMZtngI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(11063799006)(4143699003)(261022075727099003)(261022105027099003)(56012099006)(261021121427099003)(261026140227099003)(261026121527099003)(261102123227099003)(261021123027099003)(261028144727099003)(10067099003)(261009223027099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YUd3OER6RWRYbFJjbjY1NVR4c0ZPT2VWV3JaQ3FCS1Z1VGFqZkV1N01qL1VM?=
 =?utf-8?B?cVgzN3h1ZitLUVFqOFpqdUpGRXFMaGpvcUZ5OU9OeEZTTWMrbXp4YkhIcFhK?=
 =?utf-8?B?MWxodEZuSWg1Q3BZUVRYc0xPVHhkV0VybURweUh0cEVNSkh3K3BJYWRiT3M3?=
 =?utf-8?B?VVJ4dTF3aUs5R09CTFVxeG1QSFBJajhGVnlHOUxUb2E0YlFBRDN2Q2N5RHNX?=
 =?utf-8?B?eDFNVnJ4aURtRDJ3b0lrMndNT1ArdE5nLzdnaTRZbEpIa3pXRkp6aVpqeUFX?=
 =?utf-8?B?bXRabGx6QnN2SnlQNVljbERRZDJSdW1IWmJMV1pEem1raUhkNmJZWmo0dENy?=
 =?utf-8?B?bjZEZnVhZTFUbjFmV2syQlhQblZwaURzWFVucENjK2FVVDZWcUs0UlhJeXNF?=
 =?utf-8?B?UWgwKzVjOXQzQm9aSWxBZTRMVGJXYndBbWtZdHh0S1pWdlJxSERJc0tLSTBH?=
 =?utf-8?B?ZGJqY3pGMCtwODd0SFgxTTI5TmhQTytnWGpOMTFWSVo2NWluS1dRSkc5WE11?=
 =?utf-8?B?UytkUHVUKzdOSzAvQWFlVTA1RkVVNDQyQWxaU3ZZMnYwNGtBRE96eHZZZnpB?=
 =?utf-8?B?QWhsd0o5RjR5V1czTHdXR1VES0dXNm9VYUw5eU1ScXBGSTRpUm1vOEEzb1Qv?=
 =?utf-8?B?ZDErRjA2d0VSOFgzNDZEM3luYlZ2alZGSUVnSTNJRVk5Y0RjUzY5ZCtHc1NB?=
 =?utf-8?B?NjZuc3lqQ0xtQmhYMDd1Y0dNVGNPRlZMaDhUYnZXTFJoOWpDQXF2SGM5T2to?=
 =?utf-8?B?cXBZWmtZUFNEZ0JuTzRhZUtPR1BVaXowUFlUMXc1WTZzWkpDeTlXbzNrZCsz?=
 =?utf-8?B?ZWFoNE9WT1VuY1lIV0lkNUh3d1Y5eVc1MDZicWFYOUpDUk14VDZIblVINVhq?=
 =?utf-8?B?OHhTOHhsYkRtN1c1MW82SUJ2dGNPN3hHUG1nRitXRlBNYk9jK2xKZTZEczlq?=
 =?utf-8?B?ZU5pT1A2U2YvNXE3QjROR2JNK2tkK1pYNDhoNWZJUFUwN2FFOGNzdUZ0WG54?=
 =?utf-8?B?VjNoWEVJYjA5ckFIM0xjM3ZMM0N1ZU0yM1hkVFU0OUlnTmkrMDVEbDNucXFi?=
 =?utf-8?B?UXpqa01ZY0Z3R1lSSEdoRmhSeDNZbXpDSVQrejIvUlhzc25LZmZoRFVnTEJh?=
 =?utf-8?B?aFVHTEw2eC9JYjE5bit0QXE2eERiWlBOeStadWt4bHl6ODZUVlM5WDBOcGhm?=
 =?utf-8?B?SXZleFRtS3lhNVZtUjFTWkRvRHNZUDJNZ0pVczNsM3dXZ2tKZlduUjlwV28z?=
 =?utf-8?B?V1kxUm1rY2dxZlpoU0xmdHloTUlGb0hlYTZXU09na2ZXZ3Z5U080TFU1YU11?=
 =?utf-8?B?RXphcXFLbGFnc3JXKzZMb2ZLSXgvZDlKeERHelF4K25OUGIvS2gzSThpdThF?=
 =?utf-8?B?WHNaS2Fud05VTTFqVXNYZ2VEaWFVdWg3anYveEEyaWRtSFdCaVl6OHJpelJY?=
 =?utf-8?B?YllqajVMME9WY2p4SWRUTlR0WFpOTWswelpmV2JndEwvaHZMVVhwdDU5YTJW?=
 =?utf-8?B?K3EyZnhhd2pmUjYvajVtQmNnMWp6UDluemNBNlB0L0VaOTd6UXdaQkZVQW93?=
 =?utf-8?B?K0kvM3RvdHpCYmVJcENESkZvOUUza3RiZGJkYmVDN1RkaUxVbnJBOVFjQU8w?=
 =?utf-8?B?UzRKWG8rNyt3MVQ4RENLRnNoVThBQ1JrSUI0cEJtdUIwTHlZbjBOdXRrNWJW?=
 =?utf-8?B?anQ1cWdQVWlGNU05cHd5YzRqdnlFQjh1aDNnY1VEU0hvV3g4TUM5VDEzOURo?=
 =?utf-8?B?YTNpeFRicmZ6bktjZmRMOXhTajJjVXNPUTVpZ21kRWJuK1djUTVhWTE5bVdH?=
 =?utf-8?B?L29SZDJveWNEcDR2SWEvc3Bjdy9PZDQrSEw4ZEdUb0VsMGkxMEg5WWFwNU9J?=
 =?utf-8?B?TnJzTFdOMFBTZmprcmM1SEJNbC9ETDRaWTg0ZGordmhmVXFXUGIySExadmsw?=
 =?utf-8?B?TDVEam4zNW95ekp4U0Y5ZmMvWE5UQTFHaTRCeDdsVFBXNVhhOUZNQlBoUVhD?=
 =?utf-8?B?cktROFFCR0lOenUrYkEzQTNobVExYkNpMGQzT0xnZzJ1My8wS3pTQU5DWkdX?=
 =?utf-8?B?RXNXdkFNQThISWdUSkFRcktvbmx4T3p5bjJlOFdHQnlESEo5NXJUT0VqRU1H?=
 =?utf-8?B?azlkak5QMWp6UjVnbEUzMDlBWkNqNWJ5RDhTUDJrSjd3MU41bWFVYjZnb25S?=
 =?utf-8?B?cEhJWkN0U3Q0YXVLRWlUbHZmeVBsVVFxTlJWdSswUVBsQTRERStpRWh5aGpy?=
 =?utf-8?B?NjZCaWVDcDNRdGRFN1NneDNtNU85SmtQZm9IcVUvMm9UUk5sRG5KME00WG80?=
 =?utf-8?B?aXdtQnczL3N1VTdYMEJGRHQ4cHhWVnN2YzFvaGJrUmlxalVWckljUT09?=
X-Exchange-RoutingPolicyChecked: nPZqichP91YO+Vb8Fx0MtDdwFEfkvVYSzfPpOEuts65ccGeJWNXZUpqJZsLeiPObJxt6ZyuV9LTHmQ9xGW7h7nB8xGDt3LMk6ED4dE54mUzOKLTsxKFSPtxcHb3zsnOqRwEzEelvWtbWBggyILg7kW4WVQsQGFDORlP0jiVj4QY+gqC3dwaCrVjE0zhfl7PLWgUeER8brKdl+s0f8MQvYUaqsFcaMah/sHvR7J4tft/FqpdCxDaOykdFwWeHKXC8RJQzap4bwJLpQYk5mQ9z7bNYN1R8mgzrM2TZRtmNiqFROw3rLzfTYJ5LiwGWhtwLnRFDXcE3oCH783WuGstogw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d5bf433-14ab-43ae-285e-08df3fae9e57
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 04:45:32.7437 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: epdx3zAfxoXv7iACLl6i9G5eEN0Jq3ug6MP+I2NF4EsaIUfWh2aJyV6E7aMxdy7uFHcNoxwqifoAbmw1fCelSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6531
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 10-11-2026 18:10, Raag Jadav wrote:
> On Fri, Nov 06, 2026 at 12:49:47PM +0530, Riana Tauro wrote:
>> From: Raag Jadav <raag.jadav@intel.com>
>>
>> Since hw_error_work is now being reused generically, initialize it per tile
>> so that we don't hit uninitialized work for non-root tile. While at it,
>> disable hw_error_work on fini to prevent UAF during unwind.
>>
>> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
>> Reviewed-by: Riana Tauro <riana.tauro@intel.com>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>> v2: add dgfx and sriov check (Sashiko)
>>
>> v3: retain original patch and fix unload issue in later patches
>> ---
>>   drivers/gpu/drm/xe/xe_hw_error.c | 20 ++++++++++++++++++--
>>   1 file changed, 18 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
>> index a934b649575c..f7031b341ce0 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_error.c
>> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
>> @@ -537,6 +537,19 @@ static void process_hw_errors(struct xe_device *xe)
>>   	}
>>   }
>>   
>> +static void hw_error_fini(void *arg)
>> +{
>> +	struct xe_device *xe = arg;
>> +	struct xe_tile *tile;
>> +	u8 id;
>> +
>> +	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe))
> Why is this needed? fini is not even registered for these cases.
> Not everything is a bug because AI says so :)

This is added so that it can be re-used in error_detected in patch [7/8]

Riana

>
> Raag
>
>> +		return;
>> +
>> +	for_each_tile(tile, xe, id)
>> +		disable_work_sync(&tile->hw_error_work);
>> +}
>> +
>>   /**
>>    * xe_hw_error_init - Initialize hw errors
>>    * @xe: xe device instance
>> @@ -546,12 +559,15 @@ static void process_hw_errors(struct xe_device *xe)
>>    */
>>   void xe_hw_error_init(struct xe_device *xe)
>>   {
>> -	struct xe_tile *tile = xe_device_get_root_tile(xe);
>> +	struct xe_tile *tile;
>> +	u8 id;
>>   
>>   	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe))
>>   		return;
>>   
>> -	INIT_WORK(&tile->hw_error_work, hw_error_work);
>> +	for_each_tile(tile, xe, id)
>> +		INIT_WORK(&tile->hw_error_work, hw_error_work);
>>   
>>   	process_hw_errors(xe);
>> +	devm_add_action_or_reset(xe->drm.dev, hw_error_fini, xe);
>>   }
>> -- 
>> 2.47.1
>>
