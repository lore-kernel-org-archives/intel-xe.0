Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49124CD6E68
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jun 2026 06:52:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A6BD10E3D2;
	Thu,  4 Jun 2026 06:52:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cAiUdReN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E452D10E3D2
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Jun 2026 06:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780555969; x=1812091969;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6s8DRQdtl2RJSebbceJmb/6rYTog5PFH4R+M+3ZstvM=;
 b=cAiUdReNHXpf0IdkYTzVCtu9qKm1FK23Te+yMIhDV5LsqsQnPpw8TkYr
 imdVEliaX0LAvJrcZsS81mDNPRYhz5d+R0vTjcbI/USAaGozuVFSzoiEa
 aLgNGAL/PI3x/84Pgtk4ZW+ELDtU4p1Be2GyVP1hN5ud3d1hIoRvn72IV
 r+I0gUOHjiqEzzCOPELGDtbL+npnaj0JkItxRyyrVy1UWe68iI9SuOE29
 p0/BDR3LeiMQRm9ek3l7Yw8+15m95xFX7j1ES0gRWNI0kzrRlmwenuzT2
 PR2BXZtj5+7j+bOrn1i+exiZVk93hz65kTt41p92drVMoRzDGlHLFTrlB w==;
X-CSE-ConnectionGUID: Krp9qMjdSpyIQbpI3eOaEQ==
X-CSE-MsgGUID: QsW4Dk8WQjyu7vmO+Hdarg==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="81557456"
X-IronPort-AV: E=Sophos;i="6.24,186,1774335600"; d="scan'208";a="81557456"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 23:52:49 -0700
X-CSE-ConnectionGUID: N9MKg5lRTZuqJNJLhAlK+g==
X-CSE-MsgGUID: BaWu9psdRq6LsGKtZRrABg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,186,1774335600"; d="scan'208";a="244540593"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 23:52:48 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 3 Jun 2026 23:52:48 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 3 Jun 2026 23:52:48 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.40) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 3 Jun 2026 23:52:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=upKVn+yOcIjp01BYdNz10cF0yu7S64rdsEo8L4mOVieXpP7a9iuVGVordoaE5uVTrMU/qE96RC9HcV6OsHrvjgptQw3GTgCey3OPDDbQwdvSnsZ8KcOAT2OZ5buAreboal7yoVbxCtD04wz83JivDRHk4T+GvWlEKnGBp0CWIvmezJ1e8uzgA92batcCIutGh2H4kS6gbRu3T/Qe4bxnz5o7hzt7aXkdFtQLqX8LjBvawAKetY0CcLWG3aOQivjs2n2FclntQF3yiRYgrV4oaEXlrXeBVSTocrGZlFLDhz48pXgoD2LO5Zg9eyRo8T0sMQE4cKz/pwdYj89LfE2pPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7HgVY2oE6/lOzkWQHc4AFuzm2P56X/P52/t5PKHVwnE=;
 b=x90uR04sVxiMfBqz27gWhiwx58GEz6R9lotWqxpTF/9wqTOsvtCfLAmdSeiH9+PLI9CHrXJV8hHMWqoFa51oMgvbMF7ez8aqxHMZoGTHOxW/5SoH6rd+YEht/QwfbR1BB2+SZjjkGuLDQyYWx43W6W2sygDx7HxvbM8v1EwUvv8XtzsvRYSdZBRCs5zv+lvKFTk2P97/YAimwxSjASlN1/6Q/jiK6z2rDM4e7BR5tjNL1RFaaet0aF1S6LljDgh3W5kNUD06K+vhzetacViomKTw2DAe3KqxaoN02hxLNVUl4pQtYfWaWeObSnVfHmIY1X6Tuc84fG4NR3tIwTXHgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 PH7PR11MB6675.namprd11.prod.outlook.com (2603:10b6:510:1ad::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.7; Thu, 4 Jun 2026 06:52:45 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0092.006; Thu, 4 Jun 2026
 06:52:45 +0000
Message-ID: <9da04b52-c43e-4afd-9d1b-8248034f58ab@intel.com>
Date: Thu, 4 Jun 2026 12:22:35 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 08/10] drm/xe: Improve wedged state management
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <michal.wajdeczko@intel.com>,
 <matthew.d.roper@intel.com>, <michal.winiarski@intel.com>,
 <matthew.auld@intel.com>, <dev@lankhorst.se>, <jani.nikula@intel.com>,
 <lukasz.laguna@intel.com>, <zhanjun.dong@intel.com>, <lukas@wunner.de>,
 <daniele.ceraolospurio@intel.com>, <badal.nilawar@intel.com>
References: <20260603101814.916948-1-raag.jadav@intel.com>
 <20260603101814.916948-9-raag.jadav@intel.com> <aiAIcAihJhDwOj5e@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <aiAIcAihJhDwOj5e@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0220.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1f3::16) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|PH7PR11MB6675:EE_
X-MS-Office365-Filtering-Correlation-Id: 260d3609-9cfe-4374-43bf-08dec205e1cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|4143699003|56012099006|22082099003|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: +YDlG3GQioPgRrSTr7s59nnP32f0evGcWA8XmYfnwyP/1P6Y/M328Mua/5ulvbiVOfxBt7MG6/ry5acydTFsb/uMboyThBu7xB4D44nme5lStcwOGw4iYtdNugO1aNOF13SIkJwpNKplupbKRqd8zPOreLI8xIJXhwvdKpCktIFsxnXTVISX1zLmOLO3Q/UBWuTuCosjJaLd30uDWCLYod6BHJjdKIYn0NFVSQ7HgMQ87fPM8qRIHVghQGt+3FwjLz6X7+MOCYsXg1F5OS6cZQ5IwZvmTd7ud+qcBswkqP1pFoyrJ0GZB5TqGVZSNSCtCh+yrgmO9ulCSyngkA9jVL287x+S3mc81y1OhCHL43LOCc1qGKOA11PVd0xTX0w/VjHFidWIV6t4MwcGshc307eFH43WeiqqAy4Xsb3PaDPIJjRs3SV/QPA7GC1/TpCxd5Ft9rkesKofzXyXdq47jSb+Z3wbHnkB6m6mYI5phTTZVqw2lDxB16RuSbc11VqkRvMXA/vis1lAQANWRrUmyRg2JVnEsLtNwv6n/1ex2Df5LkQX3G26+83ZP2zo4RpnAs3qXwlwmLM8xZm/1AVE7hSTLWfVMlsMonDKdcnVLbKKxkgEO5Hisi2k7zHH5mF/qdnirSa6r60qEoFoJY8V2pH5W+ZJHSx3spD6ABs6z6w2LiIGgy67UFpk0FdvStyM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(4143699003)(56012099006)(22082099003)(11063799006)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Umt2ZTBqRzh0am9SOVIzOEhNcnVTR0hsZEljUTNKUHlPMWNlSCsrQWl4eWNU?=
 =?utf-8?B?eFdyckFmbGRXS3UrNmpyVFk1OWIxQ0tlMmpSL1dReXl5Wkw2S2hDRzVIMm84?=
 =?utf-8?B?K3FDdnROdURSai9YeFIvRTNaR1V4RGdIRnJyZFlzc3ZZSW9qZzJQODBidzNQ?=
 =?utf-8?B?aWdHMXJ5K2xpMDBZU1FxbTNvQVpYcXNHdWhJQ2U0NGJhZHlWOEZFR0pOTzcr?=
 =?utf-8?B?RXkwNUxCSFJGODBmS3VkcERyaGpiUzBvM1VTSFBWRUZ0OHhDaXFJakNCb0k3?=
 =?utf-8?B?bFBrK0ZKR1dna0JiaURHYmNkeEtobStqREZnKzlwc0ZZVEw1YWFleUo1bytN?=
 =?utf-8?B?MTFzRWxnZlEzaHBMdG9nZHhGWGZzNlNxU1V1MGxsVVFubW56ZVhRRlVMMEVH?=
 =?utf-8?B?YUdwaEsvblc4eUk5Vk8zSE80OGZVOGRQMkZIUHhQYXBnQWUrSTRUMFRJZlFh?=
 =?utf-8?B?b2ZDWnlTUW5RYi9KUGt6UjgrV09hWHZjdUVqQWNnM0NFY0VKeXRrQ29xWGdv?=
 =?utf-8?B?UXE0YmRvOVVDb3V0Wk1UOWJlTUcvSVNldWttdndxczczdExlajM0M2JISG1i?=
 =?utf-8?B?aFgzZTRlR3haUTIyYkltZlN4T3pYSGkxU3p2UUNYd1luOXNYL3dxQkhPUXQ5?=
 =?utf-8?B?RjVuamY3OWJCZ202SWtuWmdDSEFLck90cGs3M0NEUFNYczJ6aitsNE1zN3F5?=
 =?utf-8?B?UjJNb0laM2llUE5vLzE3aXlNbEVhalIzaStpM1p2cjc3ZmVWK045NmpaYkV5?=
 =?utf-8?B?RnRyVmR2WFFUUkVKb0RaUlIvdEhoa1ptcks2bHJRVm45cjFUbXhFZzZaM1JD?=
 =?utf-8?B?UCsxVXdWWWZrU1p0UTlJTWdlK1JtZUk2eVRQNXYxdEM2STl3TmV6bHJILzk0?=
 =?utf-8?B?SkFKZCtVRGRMRmZMcG9wQ2JDL29NS1A3aFZaL084Umt1Rjg4NzU1NytRUjho?=
 =?utf-8?B?TFJDMnhycUo4bFhWOTltUC9BTnVhRE5DdHBMNCtMcUhkZ1VXVkxwN0t1OUo2?=
 =?utf-8?B?MnZyL2dkY1gvSGgyckJaRmgxZWM1Nzl1Nlh5K2l6T1JLUHM3WUx3ZmV5TFQ5?=
 =?utf-8?B?dUFQSFJ0VlY4MGovYWp0ckQ3OXkyKzgxc2FTYjBrVWpZN0x1dkwrV3JKYitS?=
 =?utf-8?B?dCtvM211b0hjbktnWUtuUVRndjJsUXRabDZzTGcxVUNla245VEMzLzVxNm16?=
 =?utf-8?B?OWp6U3VqQ0srN2h5aUI3NURNbWN3T1JyenVLU2lCYjJOc1VOVEJWVGtTaGk5?=
 =?utf-8?B?UU54U2t3TnJxWWhHakNrMnRZWkRuWkorcVJnbVpucUd6TE9IMDBxYUtaZ0tq?=
 =?utf-8?B?TEJRUXViQlBqaXJTNFg3ai8wbVVnZi9iSU9vZWhEaXRiVldUM3grN1ZQNEVW?=
 =?utf-8?B?SVhKL1k5UkhNbG84cmFEZ0FCK0pXWWd6VHVlU0VlWkVaK1hwYzBHUVUyQ2dz?=
 =?utf-8?B?cmxjSGZNQ0NQMFgvYlh3QXpUTmxoUzBCMjN4SExKdFRYaURQckhDOFFDOVFi?=
 =?utf-8?B?eUVYUFB0WFBlQVVNdEc2VWM4QjNBVGd5YlZPb0xEMDZTTjJzYWR1bTh2NVlH?=
 =?utf-8?B?S3E5dEQ2c20xUDlYK2o2ZlF1SmhTQ3E2SW96L21MbHZycFhYYU9QT1lBNHJX?=
 =?utf-8?B?dkZVRGtDOWprTVVLeFNieE10Z0ZlVUVha0FYSi8xMDNtZnV2MkpYY0FyWlMr?=
 =?utf-8?B?U0tkWmw2VW1rbEppMmRaWEVBeFRPWDkva1dFd3dUcDdTOHJsdG40Rzc0Vkpq?=
 =?utf-8?B?SHNyU3pDNzNoQi83NG5IRHNQOEpidEwxa2F1S2h3YXk4OC9aazZmLzZ0Tjl3?=
 =?utf-8?B?bkRRdU92V0syT3p4UkovQjlrSFRLWGg0bDNvK2IyRytHaE5ITXlMUGdLTFd6?=
 =?utf-8?B?Mzd3UlpaNTJMSnZYSm96OUJoRGQvdlJmeTBOTUdkL1oyUzRlTDkrMGlmMXFl?=
 =?utf-8?B?dm14aVRwVEJ6RnNYTXdjNHJTVjBqVkNaT25QV1VMSWg0aGRqazVNQTZzOFdM?=
 =?utf-8?B?eFY5cU51N2VCeDdod0Y5SEo2NzNQc212Y012MjdLSlFJSU5RRVVPeCs2eUN0?=
 =?utf-8?B?VG1uRmhSV3JuL2x4SVlLTG1RSFdZaFY3cnkwajBTRlcxQWxIbWF1UzNUL3c5?=
 =?utf-8?B?LzF3K2J1Rm9JQ0NWMDUzZTZsZkxyWk5CSjMvNTJpSXZGTHB1dCtlWllIWmhk?=
 =?utf-8?B?OWZhWGhNcWNoa3dNd1BDYldiOWNtWkpyajErQlFsYTh1Q1JoZGZKVEZCZjNu?=
 =?utf-8?B?SGVxSmR2dEMzM0NMMmg2bUZZR1RwZVZSS3JZYVBWMmRoN2lvVThjSUpxNkE4?=
 =?utf-8?B?NGZQaHFna2d5emFFY1ZBU01pbmIxdGFvcGRVZVJqczl3WVBTWlAxdz09?=
X-Exchange-RoutingPolicyChecked: WK5I5Z269lVYFB1YpACdDrMFtdxpc3TDhZ6QQe03ehwrj0J87wPFuMuB/71rLUfnhTDsQHkocgD+0RfMaCM/tv0lE2UrDl/QXmLDsG0Y2fg63atoOM33R2+G1GSNzmCZYPJVr9TjYmmEq2vOVvAodVimxN2rS2HCuXSQDZ7h4orKpum12rSieoyOPJzHmHyNntk78loNmdgHLaKa/HiayDUMjPk6ML1TBlqHZ+RuaQVa51hWTSJZ5LHaxks1l6fm0XgDeL+RNVjWi6LLp5eD8b2mOXOsAhaEE4hzykzSMaESFs5t9tUDG2004P824dNTfvlkTDgVpZYWXf9GLUFTJg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 260d3609-9cfe-4374-43bf-08dec205e1cd
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 06:52:45.5852 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WezNn7A5CvGHCNwojnrL9qawjm/YEC8t6xYnmiWtbznJgYrgUMV5M3VSLzFvExKieqqq37JdkvM8wTqt2J3Phw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6675
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


On 6/3/2026 4:26 PM, Rodrigo Vivi wrote:
> On Wed, Jun 03, 2026 at 03:47:08PM +0530, Raag Jadav wrote:
>> Currently, wedged state is serving a single usecase where the device is
>> declared wedged, but this doesn't allow any wedged state management for
>> runtime usecases. In preparation of usecases which requires to facilitate
>> temporary device wedging, convert wedged.flag to wedged.ref which serves
>> as a driver internal refcount and blocks critical path execution during
>> device lifetime and while at it, introduce wedged.fini and use it as a
>> cleanup indicator during driver unwind which operates independent of the
>> refcount.
>>
>> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_device.c       |  5 +++--
>>   drivers/gpu/drm/xe/xe_device.h       | 12 +++++++++++-
>>   drivers/gpu/drm/xe/xe_device_types.h |  6 ++++--
>>   3 files changed, 18 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> index 9e0cbad8adb0..d77f8f054a1a 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -917,7 +917,7 @@ static void xe_device_wedged_fini(struct drm_device *drm, void *arg)
>>   {
>>   	struct xe_device *xe = arg;
>>   
>> -	if (atomic_read(&xe->wedged.flag))
>> +	if (atomic_read(&xe->wedged.fini))
>>   		xe_pm_runtime_put(xe);
>>   }
>>   
>> @@ -1413,7 +1413,8 @@ void xe_device_declare_wedged(struct xe_device *xe)
>>   		return;
>>   	}
>>   
>> -	if (!atomic_xchg(&xe->wedged.flag, 1)) {
>> +	if (!atomic_xchg(&xe->wedged.fini, 1)) {

Just curious. Why do we need runtime pm reference held throughout till 
the end of driver unload?
Even if this is needed why not associate releasing runtime pm wakeref 
with the flr_on_fini flag.

I was facing a similar issue for uncorrectable series and i was thinking 
of releasing runtime
pm wakeref based on flr_fini.

Thanks
Riana


>> +		xe_device_wedged_get(xe);
>>   		xe->needs_flr_on_fini = true;
>>   		xe_pm_runtime_get_noresume(xe);
>>   		drm_err(&xe->drm,
>> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
>> index d61fdb362f91..14677729aa24 100644
>> --- a/drivers/gpu/drm/xe/xe_device.h
>> +++ b/drivers/gpu/drm/xe/xe_device.h
>> @@ -194,9 +194,19 @@ bool xe_device_is_l2_flush_optimized(struct xe_device *xe);
>>   void xe_device_td_flush(struct xe_device *xe);
>>   void xe_device_l2_flush(struct xe_device *xe);
>>   
>> +static inline void xe_device_wedged_get(struct xe_device *xe)
>> +{
>> +	atomic_inc(&xe->wedged.ref);
>> +}
>> +
>> +static inline void xe_device_wedged_put(struct xe_device *xe)
>> +{
>> +	atomic_dec(&xe->wedged.ref);
>> +}
>> +
>>   static inline bool xe_device_wedged(struct xe_device *xe)
>>   {
>> -	return atomic_read(&xe->wedged.flag);
>> +	return atomic_read(&xe->wedged.ref);
>>   }
>>   
>>   void xe_device_set_wedged_method(struct xe_device *xe, unsigned long method);
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>> index 32dd2ffbc796..66e673e4e3e7 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -485,8 +485,10 @@ struct xe_device {
>>   
>>   	/** @wedged: Struct to control Wedged States and mode */
>>   	struct {
>> -		/** @wedged.flag: Xe device faced a critical error and is now blocked. */
>> -		atomic_t flag;
>> +		/** @wedged.fini: Needs cleanup on fini */
>> +		atomic_t fini;
> to me it is easier to see this as a 'permanent' flag than
> a flag to 'clean' on 'fini'.
>
> but up to you...
>
> either way:
>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>
>> +		/** @wedged.ref: Refcount for wedged device, blocks critical path execution */
>> +		atomic_t ref;
>>   		/** @wedged.mode: Mode controlled by kernel parameter and debugfs */
>>   		enum xe_wedged_mode mode;
>>   		/** @wedged.method: Recovery method to be sent in the drm device wedged uevent */
>> -- 
>> 2.43.0
>>
