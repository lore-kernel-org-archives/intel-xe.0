Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7554C79FB6
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 11:02:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A35310E111;
	Wed,  9 Sep 2026 11:02:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mBshTSIC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C7C110E111
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Sep 2026 11:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788951766; x=1820487766;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=wRwKIjtMTsIVHYfxsrd02QjNT5Nn/HiCjXhBNqUAD7o=;
 b=mBshTSICz5d9jCzDcnJbOn9E6OVV/cPH3hZKgaoUfLwCmSj2pySodrJy
 Fj7P/PVzC9lAUW4NfMP7i9SaJrmX0u5+wa72ZAgHo3ZCT1Vx4zbx61y57
 5RTjDA6EvDTIiDOQsl7szmxNF07FqbFxVCVYI6XtEuFtW3oIS1dLQGjPw
 g8R24/80pS3NRZTCE0cWymR9EV5mRHqoG7xF4g9TaEjTX4XZp2+cbZ5ay
 jEtfVBCQB1PcOJvKzu9NEn5GguXRBkdv9JB+hGjdqgLqYuZAawxZ7VSnY
 jRXMAYjB8kDNhNj+AQLmCwTkNz0t2KMa4aJAXCqo+IqgHXR6qTAcBovId A==;
X-CSE-ConnectionGUID: kkn1M2AjTqiHrO1nR30G1A==
X-CSE-MsgGUID: qboAMO1zSC+2/icKUJkC8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="91888383"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208,217";a="91888383"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 04:02:46 -0700
X-CSE-ConnectionGUID: MSoKUsRWTPiTS4c9G+vG3g==
X-CSE-MsgGUID: xhyZ4hwyR96EWZwKspyP9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
 d="scan'208,217";a="267610923"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 04:02:45 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 04:02:45 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 9 Sep 2026 04:02:45 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.65) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 04:02:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dwR8lWxcDv54JDrH/4cJji2Uyw2LL19yFYKdg7BuKouzyaxgPhEPgZ8JytIDFLwfE5hyoL/Q1q6uhKCLYwtzuQOxp1STiT56rlWXUW0XdFKbJ7ykSGJQzBeTfRmpuOHCSAi+1ylrTqpZPKwJLjqNrFeM6ru6nkg3lEZgMerq+KQiEGCqi9BYrAmLT44396nIqIQxsesEUxArKxtTT1y9OWs25NOLv+9/BCf2gC8HsrOa0s6s+qpMHv/RtzZ+yJUKRz6+wwJeYyZTpBFF2nL2jySnn5eBDbGkaHEPWTSchvfystJSDMfLNlpMy8uhcLfjitQmpJFJGZcx80zK8EjyHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ioa3P3OxHUdZF2NRLJzHW+igmxpG6rDdUghVo8LvEbE=;
 b=KVAv6Mud0l22nGw/PDZHmrKIZbOntJmW/bZKG0KvLbzf2kGhjdSwUlC2tXWFyhBx7ezTkqdI4aaqJ07IOQ/QNP0G9Jotx63Be/qEjJh6ZOvXEUpdvyayDB/5Wx5PNAyEOQNx8b4ZfO5qVdRgijbrs+5o8MqFWalD1sjboR90iJ0CZ0PdNnFbC/a1Bt5Wb4dyS7a67zxcnlTnFpNO3t1gU9k+cr5z49sWPUM3a5RUknOjmrWD2YXaFTgVfkQYnRln/k0E/YI2ZZgr34yz11dVQ/QMMNmQCgs1mN2MY23Yzrk3Vb0+5CI/mACQYlKA1hbav8ClZ2Mm8o0JMCqk5fOr+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by CYYPR11MB8429.namprd11.prod.outlook.com (2603:10b6:930:c2::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Wed, 9 Sep 2026
 11:02:20 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%4]) with mapi id 15.21.0406.007; Wed, 9 Sep 2026
 11:02:19 +0000
Content-Type: multipart/alternative;
 boundary="------------7XhbIeb9tPhO0hcnZMYB2lDW"
Message-ID: <e54e1f08-a16d-4acf-82bc-8b73ccc794ea@intel.com>
Date: Wed, 9 Sep 2026 16:32:12 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] drm/xe/log: Relax location ID recognition
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20260904170531.516-1-michal.wajdeczko@intel.com>
 <20260904170531.516-7-michal.wajdeczko@intel.com>
 <f0f7e21a-6d90-498c-92bc-e8227a393d8d@intel.com>
 <37ba4065-9a0d-4c97-93db-e34ebb99da77@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <37ba4065-9a0d-4c97-93db-e34ebb99da77@intel.com>
X-ClientProxiedBy: MA5PR01CA0070.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b7::10) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|CYYPR11MB8429:EE_
X-MS-Office365-Filtering-Correlation-Id: d679c5c8-5fee-417b-8914-08df0e61d10d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|4143699003|11063799006|10067099003|56012099006|22082099003|18002099003|6133799003|3023799007|8096899003|13003099007;
X-Microsoft-Antispam-Message-Info: zI+tk01QrEYWBtv5c7eUz2G8HZXfeXEOZMLvyAIyry81x90HxITZSwRTkXqHYt8in9Dz4zrIz9bHKJTmH8tIP8cpamrnELuNQugG5lr5cdJPbYh3Ou4NvYiDK0NiEIdwLoGgzTt8utP/PLVIMR4s8l+gzFPssDUoSuKvELpIqIfN9ERrOY9nVY4WacvvkQfRkrGLGNJISMU/fIup+gO0CY0GQPCto9fy+eU/LVfd8ovU2BGiBoKxQHWxZkFJxU7+DGrbPI0XECOFbyXllk2HbP1PU5RTQ/6YHWhM8BP4SFA4eeFr0YgLRSnNv3uxbUHTkoa6I8jUJdf5V1gYGZHCQ0Uoe/3/NdiCJePCWK9G+NDb+vvH1JDQydcq9gOa4cq493LlodNmeEUjCEILfF14rUQmzD1pJ6/32yLjyZ62zDkgDFsIC1w/Y0bvsaZ7mT3yxb0m43I7JgQbLH0GUtwIFm+fJZo1dq5TPKm2Y3+Ay6OfHqY2A3bm2dkdy8C7c68Fhd521TOSdKoSjEs628dyFJEqPpbhlRgf40kw9YwQ+bmHQuZKL8aOIGPHfYUQsYvXDdScGC60BZ9TRbJsmsJRA41ddnirDYawnXKaYOaPy8Zoja3oGXo2FctxLzaPDSxV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(4143699003)(11063799006)(10067099003)(56012099006)(22082099003)(18002099003)(6133799003)(3023799007)(8096899003)(13003099007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SEdReEU5VVp4SXY3eUFkZERJVzQ3Z21YU015NytCZm5QL1ZYQ3gyT1MrVDNz?=
 =?utf-8?B?R0hHT1lYcUdqQTVzbUdwV1ZWRTFDRGhlWENxVHJPdjZORmZZRnMyQ3pmMmlL?=
 =?utf-8?B?bStpNllNVlBCU0pvdlBpOFF6NlRvYitURjdRVVN6OHVZVGJYc3RZcDBsN01x?=
 =?utf-8?B?aHI4VG5YV25qQWVnWHl2SUQrYkxYZk5XbmMwUVNxemxTb3VhM3lvbmZCTjRM?=
 =?utf-8?B?SDZ1TUZpYldtMlBUaDhBU0VNSy9wbnh6MWlzclFUa2tHTDM2T3RlMFI1aFIz?=
 =?utf-8?B?S0I3aGVHN1lvOWFla0pQdlFQSGJUbCsxUSt4UU55QVA5UlNJNXBGK0FmMFlo?=
 =?utf-8?B?RkN6RmJjTGY5c3o2VXlzUjVSQ3ZUVXEvd0NTd2ZLWVR3eDkzVVVBUkMvK2pq?=
 =?utf-8?B?QW4xMnlTZXJWdTgrZlNLd2NGRklvR3IzNVRWdGdaWXg1bCtlSTR3My9oY3A0?=
 =?utf-8?B?TWlGbzdRcmdjS1gxTmM2TnJON2pnbUtMQ0htazEvQytOSFlzM0JiVk5VeXNt?=
 =?utf-8?B?em1LenpreW9Jb2FlRmdhVUJ6ckFEaVYweUs0Sy8xdlZEcFgrR0Y4Z25CTHdK?=
 =?utf-8?B?cW8xWitMNjFqSU1FV0wyc0VqOFlqdjU2bGw0cmdiY2RTaGt1T0wwaGJaRGNw?=
 =?utf-8?B?aVhUTVc4VmNQSkNkRHZxRzM5eVpPL2xsRUlaa2MyajJtMDNNU1RMTDIvNFZi?=
 =?utf-8?B?N2xsaWRLNnIrVVhWN1B6MHhTUFJKVWx3a0JKRWY1OVplSVA2ZmRoNVVoMjZn?=
 =?utf-8?B?aTVTcHhUanU2Tjc4WnRNL1FuMmJHQ3N4eGdmL25lZjdZZkhsUDR0V2M0Y3NR?=
 =?utf-8?B?amlFQm9KaGJnQUxJT0pUak1aK1p1cjVJd0xSUk1FalMzQnFEZEJiYW5mWkpE?=
 =?utf-8?B?engvK1JpNFdNYlJUSlJ0elJERWpadVlvR3l6VHJVMWVDK0FPeGk0QzQwM2pO?=
 =?utf-8?B?ZERQN1R6cDNnVTlldU9NbVdOVGV1bCtVTm9WdWsvaG9sQmduMlpUWWFTcGNu?=
 =?utf-8?B?QTNlVG9ycElOeDUwYmZqTHRuakhjMlFsMDZKejQxNjRtRDdlZGRmZVYyOHJK?=
 =?utf-8?B?Wm5WL0k2bHMvaXdLMnZNTlpPaFZWNklMT0gwWWUzaVViUEVTTFNGZ2JaVWwz?=
 =?utf-8?B?cW9rYWhkYk01Qjlka2tJbi84T1hpR1RMU0t0aFFtRlpzcERYUEpIRjRZb2Zj?=
 =?utf-8?B?QWt4QldxL3JYYlJTdDNPdXZ1MUl0N1BXc2M2V0lHSE00L2NQRTdwS1BZdFBo?=
 =?utf-8?B?RHc3L3FCRVRWcGhnUEhqQmppOWFIT3RFbU80OG5rQVNaeHd3akdJZUVvMzFy?=
 =?utf-8?B?bzg2ZlZTdG44S29KZm1OUzlxREFuNGtjbXdXQmkydWFmNDdGWCtaSzZXcWVS?=
 =?utf-8?B?ZVpkMktHSW1rV2c1M2ZoZ2hQRDZKc25YVW1GYlJCSjVpN0h5djZQdHdqVURo?=
 =?utf-8?B?dE9JcUZjZk1wVHFJSVVEcm1rNjI1clBqSHdveXljTGZVYUJJV2lvV1ZuZXgw?=
 =?utf-8?B?a1hMa1BpSncvdVRPMmMrTm5lNTlLS2tLT1R6RmFXT21ZQnZVdmhQY2twL2lE?=
 =?utf-8?B?aDVMZmw4R1hMZE8xdGxaeGxxbDFGNnV3bHdJNTZ1ckV5LzR1OWlXZ0NUMGMy?=
 =?utf-8?B?VkRkSGRkUWdHZzZmVWswYXUrWFBqZnl0UzVNOXdrenVSMUoxZjk0cXRwL1JK?=
 =?utf-8?B?elJreXVFRjVKaWZndHB4aDBBYWtQSFZvekZvcWl5WlpkbE5rN0k5Z21KRlRo?=
 =?utf-8?B?T0J6Mlh0NzJDMXRCenA2VG1wWjRIcm1ZaEo3eGZEQlcwM2x3VWZDcEpadUc5?=
 =?utf-8?B?c2lpTzdSZWhkR3ZNU0dlcHZnZG43SmhyZEVMZU40RTRrNFJQRlZFaUplTnlN?=
 =?utf-8?B?aFVTdy9rUWlHVk1UN2c1T1NYWHczcjVyVC96Zjc1NC9xdnlQUTFBS3ZVTFdv?=
 =?utf-8?B?eVA2Z3UvRFVDd3M2MlVwOFplTWMyM3pya0FmVXV5SjhEdmtLOXNsN2J3Zm1t?=
 =?utf-8?B?SWdUNDZmT3dVZ1F3NndzUS9xV0FMN1R2TDZGUTRVb2VpdXFtaS9HZ3hMcTV4?=
 =?utf-8?B?T29vb3VxVzRXTHB5MHhnV0p2aVhEVlJRSHNQczBiZXVmUmlpVks0ZlpiYjNQ?=
 =?utf-8?B?L1dsaTBaY3lNbXkyd2ZUYWxMVkVsd296bEoyT3E3SDFZeFJyWmh1TzJWZEQv?=
 =?utf-8?B?SWp3cUpVT3lhaFNvakNCcGNnVDMvQnArSXo2bHI2NXAzU3hxdWh3MVR5Yzla?=
 =?utf-8?B?SzBvZ1Q2clowN09YZWJwNkFCaFJOUCtKbFFaU2l6bTMwczBhU0gzd25YSTNX?=
 =?utf-8?B?NHZQWVZpTTBoSGNWakJzcTQyQ3QzUzR2cTlPVmo0c0t3Zk9rdmJUQS9pODhz?=
 =?utf-8?Q?oez9xp9eIJCFPWVA=3D?=
X-Exchange-RoutingPolicyChecked: huUmdHLMEMjyCrEDEDvsBVfjGID5AU80NRVfhv2Ak3TDyC0Uba1Wot6+O1Ac+ZDrcxugZvfsk37UY6mlA8Wz5jyHkVSHhLP7VzdqEN7HcVzJ/BAJin32sKUe/oX1kRompeA6c7r4DypjPwgFYUe61OhBo7ersvknz05/9GQoQ9Y+yhnYHzWwHeVvAeVi9ha/UWb7YaT/mWnGk32T3te3QMV1cWs+2tnHEIk0eSVJDny2gaZwEQl/oooxgOkfjPZwJUrpk6BGs/n1LIFxDmSAdIOAoXuttgvZAK5NlTyZol21gollNHoBIlw3xZGSg/LT/Jg94Uwh7+1eEW230HQiBA==
X-MS-Exchange-CrossTenant-Network-Message-Id: d679c5c8-5fee-417b-8914-08df0e61d10d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 11:02:19.6481 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T69oK+xttMLUGTfPINnBki7MOAed447jG61FQ5repyoUxfTFOC9638wshWxLZCutHv7dXc2UCA2HTJJh3V4zpnSuLnlYA4T3pnhyq9t8fg8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8429
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

--------------7XhbIeb9tPhO0hcnZMYB2lDW
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 09-09-2026 03:12 pm, Michal Wajdeczko wrote:
>
> On 9/9/2026 11:00 AM, Mallesh, Koujalagi wrote:
>> On 04-09-2026 10:35 pm, Michal Wajdeczko wrote:
>>> It turned out that during early probe phase, VFs use detached from
>>> the xe_device, temporary xe_gt objects, which when used as location
>>> in xe_log() macros, will be treated by the dmesg decoration code as
>>> bogus, possibly triggering a WARN, and the output will look like:
>>>
>>>   [drm] *ERROR* SIGID=104 (-ETIMEDOUT) LOC3.0? GUC: MMIO request ...
>                                           ^^^^^^^
> [here] ----------------------------------^^^^^^^
>
>>> instead of expected:
>>>
>>>   [drm] *ERROR* SIGID=104 (-ETIMEDOUT) Tile0: GT0: GUC: MMIO request ...
>>>
>>> Relax the tile/GT id validation and instead of looking for the real
>>> objects, only check if encoded id is within the range of possible
>>> tiles or GTs on the current xe device, using data from the device
>>> descriptor rather then the object list.
>> nit: 'rather than'
>>
>> Please mention invalid id case, how it's going to render like
>>
>> Warn + Tile3?  GT9? now.
> invalid ID it is shown [here] and in the cover letter
>
> regarding a WARN, it will not show up in production builds,
> but it would look like:
>
>   [ ] xe 0000:00:02.1: LOG: unrecognized location 3.0
>   [ ] WARNING: drivers/gpu/drm/xe/xe_log.c:97 at __xe_log_emit+0x3ba/0xaa0 [xe], CPU#9: sh/5268
>   [ ] Tainted: [W]=WARN
>   [ ] RIP: 0010:__xe_log_emit+0x3ce/0xaa0 [xe]
>   [ ] Call Trace:
>   [ ]  <TASK>
>   [ ]  ? mark_held_locks+0x46/0x90
>   [ ]  ? __xe_mmio_wait32+0x87/0x170 [xe]
>   [ ]  xe_guc_mmio_send_recv+0x354/0xc10 [xe]
>   [ ]  ? dev_printk_emit+0xa0/0xe0
>   [ ]  xe_guc_mmio_send+0x10/0x20 [xe]
>   [ ]  vf_reset_guc_state+0x47/0x100 [xe]
>   [ ]  ? rcu_read_unlock+0x1c/0x80
>   [ ]  xe_gt_sriov_vf_bootstrap+0x2f/0xcb0 [xe]
>   [ ]  ? xe_gt_mmio_init+0x30/0x1e0 [xe]
>   [ ]  ? __drm_dev_dbg+0xa9/0xe0
>   [ ]  ? __kmalloc_large_noprof+0x115/0x130
>   [ ]  read_gmdid+0xf3/0x310 [xe]
>   [ ]  ? xe_device_probe_early+0x143/0x710 [xe]
>   [ ]  ? xe_pci_rebar_resize+0x17e/0x2e0 [xe]
>   [ ]  ? __pci_set_master+0x61/0x100
>   [ ]  xe_pci_probe+0x554/0xac0 [xe]
>   [ ]  ? mark_held_locks+0x46/0x90
>   [ ]  ? __pm_runtime_resume+0x5b/0x90
>   [ ]  ? _raw_spin_unlock_irqrestore+0x67/0x90
>
I was looking:

*Valid case:*

[drm] *ERROR* SIGID=104 (-ETIMEDOUT) Tile0: GT0: GUC: MMIO request ...

* Invalid case now:*

*xe 0000:03:00.0: LOG: invalid GT identifier: 5*

:

xe 0000:03:00.0: [drm] *ERROR* SIGID=104 (-ETIMEDOUT) Tile5? GT5? GUC: 
MMIO request ...

right?

>>> Fixes: 1151b9f6f465 ("drm/xe/log: Add component/location decorations to dmesg")
>>> Signed-off-by: Michal Wajdeczko<michal.wajdeczko@intel.com>
>>> ---
>>> Cc: Rodrigo Vivi<rodrigo.vivi@intel.com>
>>> Cc: Mallesh Koujalagi<mallesh.koujalagi@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_log.c | 40 ++++++++++++++++++++++++-------------
>>>   1 file changed, 26 insertions(+), 14 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_log.c b/drivers/gpu/drm/xe/xe_log.c
>>> index 5549ef6966fd..29eb16db3320 100644
>>> --- a/drivers/gpu/drm/xe/xe_log.c
>>> +++ b/drivers/gpu/drm/xe/xe_log.c
>>> @@ -10,6 +10,7 @@
>>>   
>>>   #include "xe_device.h"
>>>   #include "xe_log.h"
>>> +#include "xe_pci_types.h"
>>>   #include "xe_printk.h"
>>>   
>>>   static void log_emit_cper(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
>>> @@ -52,18 +53,24 @@ static const char *log_component_prefix(u32 component)
>>>   	return component ? log_unknown_component_prefix(component) : "";
>>>   }
>>>   
>>> -static struct xe_gt *get_gt_safe(struct pci_dev *pdev, u8 id)
>>> +static bool allowed_tile_id(struct xe_device *xe, u8 tile_id)
>>>   {
>>> -	struct xe_device *xe = pdev_to_xe_device(pdev);
>>> +	return tile_id < 1 + xe->desc->max_remote_tiles;
>>> +}
>>>   
>>> -	return xe ? xe_device_get_gt(xe, id) : NULL;
>>> +static bool allowed_gt_id(struct xe_device *xe, u8 gt_id)
>>> +{
>>> +	return gt_id < (1 + xe->desc->max_remote_tiles) * xe->desc->max_gt_per_tile;
>>>   }
>>>   
>>> -static struct xe_tile *get_tile_safe(struct pci_dev *pdev, u8 id)
>>> +static u8 gt_id_to_tile_id(struct xe_device *xe, u8 gt_id)
>>>   {
>>> -	struct xe_device *xe = pdev_to_xe_device(pdev);
>>> +	return gt_id / xe->desc->max_gt_per_tile;
>> hmm, we need to check max_gt_per_tile should not be zero to avoid hard Oops. I know in real scenario, max_gt_per_tile
>>
>> value is greater than 0 and less than equal to XE_MAX_GT_PER_TILE, however rogue user can write kunit test case and manipulate it, to avoid such scenario, we need to handle it.
> desc->max_gt_per_tile are const and are defined in xe_pci.c, so ordinary user can't change that
Agreed!
>
> we also have a test check_platform_desc [2] to make sure no developer will define max_gt_per_tile as 0
>
> and we can't really control rouge user that will prepare and use invalid descriptor for kunit,
> but even then, it will crash just that kunit, so who cares?

I know we can't control rogue user, his intention might be different. 
IMO, at least we can alert it right?  Upto you, how are u going to take 
rogue user case.

>
> [2]https://elixir.bootlin.com/linux/v7.3-rc1/source/drivers/gpu/drm/xe/tests/xe_pci_test.c#L63

I saw max_gt_per_tile, kunit check where it's should be greater than 0 
and less than equal to XE_MAX_GT_PER_TILE to avoid such scenario.

Thanks,

-/Mallesh

>> Thanks,
>>
>> -/Mallesh
>>
>>> +}
>>>   
>>> -	return xe && id < xe->info.tile_count ? &xe->tiles[id] : NULL;
>>> +static const char *location_suffix(bool valid)
>>> +{
>>> +	return valid ? ":" : "?";
>>>   }
>>>   
>>>   static const char *log_location_prefix(struct pci_dev *pdev, u32 location, char *buf, size_t size)
>>> @@ -76,17 +83,22 @@ static const char *log_location_prefix(struct pci_dev *pdev, u32 location, char
>>>   			goto unrecognized;
>>>   		strscpy(buf, "", size);
>>>   	} else if (type == XE_LOG_LOCATION_TYPE_TILE) {
>>> -		struct xe_tile *tile = get_tile_safe(pdev, id);
>>> +		struct xe_device *xe = xe_any_to_xe(pdev);
>>> +		bool valid = xe ? allowed_tile_id(xe, id) : false;
>>> +		const char *pad = location_suffix(valid);
>>>   
>>> -		if (!tile)
>>> -			goto unrecognized;
>>> -		snprintf(buf, size, "Tile%u: ", id);
>>> +		pci_WARN(pdev, !valid && IS_ENABLED(CONFIG_DRM_XE_DEBUG),
>>> +			 "LOG: invalid tile identifier: %u\n", id);
>>> +		snprintf(buf, size, "Tile%u%s ", id, pad);
>>>   	} else if (type == XE_LOG_LOCATION_TYPE_GT) {
>>> -		struct xe_gt *gt = get_gt_safe(pdev, id);
>>> +		struct xe_device *xe = xe_any_to_xe(pdev);
>>> +		bool valid = xe ? allowed_gt_id(xe, id) : false;
>>> +		const char *pad = location_suffix(valid);
>>> +		u8 tile_id = xe ? gt_id_to_tile_id(xe, id) : 0;
>>>   
>>> -		if (!gt)
>>> -			goto unrecognized;
>>> -		snprintf(buf, size, "Tile%u: GT%u: ", gt->tile->id, id);
>>> +		pci_WARN(pdev, !valid && IS_ENABLED(CONFIG_DRM_XE_DEBUG),
>>> +			 "LOG: invalid GT identifier: %u\n", id);
>>> +		snprintf(buf, size, "Tile%u%s GT%u%s ", tile_id, pad, id, pad);
>>>   	} else {
>>>   		goto unrecognized;
>>>   	}
--------------7XhbIeb9tPhO0hcnZMYB2lDW
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 09-09-2026 03:12 pm, Michal
      Wajdeczko wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:37ba4065-9a0d-4c97-93db-e34ebb99da77@intel.com">
      <pre wrap="" class="moz-quote-pre">

On 9/9/2026 11:00 AM, Mallesh, Koujalagi wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
On 04-09-2026 10:35 pm, Michal Wajdeczko wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">It turned out that during early probe phase, VFs use detached from
the xe_device, temporary xe_gt objects, which when used as location
in xe_log() macros, will be treated by the dmesg decoration code as
bogus, possibly triggering a WARN, and the output will look like:

 [drm] *ERROR* SIGID=104 (-ETIMEDOUT) LOC3.0? GUC: MMIO request ...
</pre>
        </blockquote>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">                                         ^^^^^^^
[here] ----------------------------------^^^^^^^

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">
instead of expected:

 [drm] *ERROR* SIGID=104 (-ETIMEDOUT) Tile0: GT0: GUC: MMIO request ...

Relax the tile/GT id validation and instead of looking for the real
objects, only check if encoded id is within the range of possible
tiles or GTs on the current xe device, using data from the device
descriptor rather then the object list.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
nit: 'rather than'

Please mention invalid id case, how it's going to render like&nbsp;

Warn + Tile3?&nbsp; GT9? now.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
invalid ID it is shown [here] and in the cover letter

regarding a WARN, it will not show up in production builds,
but it would look like:

 [ ] xe 0000:00:02.1: LOG: unrecognized location 3.0
 [ ] WARNING: drivers/gpu/drm/xe/xe_log.c:97 at __xe_log_emit+0x3ba/0xaa0 [xe], CPU#9: sh/5268
 [ ] Tainted: [W]=WARN
 [ ] RIP: 0010:__xe_log_emit+0x3ce/0xaa0 [xe]
 [ ] Call Trace:
 [ ]  &lt;TASK&gt;
 [ ]  ? mark_held_locks+0x46/0x90
 [ ]  ? __xe_mmio_wait32+0x87/0x170 [xe]
 [ ]  xe_guc_mmio_send_recv+0x354/0xc10 [xe]
 [ ]  ? dev_printk_emit+0xa0/0xe0
 [ ]  xe_guc_mmio_send+0x10/0x20 [xe]
 [ ]  vf_reset_guc_state+0x47/0x100 [xe]
 [ ]  ? rcu_read_unlock+0x1c/0x80
 [ ]  xe_gt_sriov_vf_bootstrap+0x2f/0xcb0 [xe]
 [ ]  ? xe_gt_mmio_init+0x30/0x1e0 [xe]
 [ ]  ? __drm_dev_dbg+0xa9/0xe0
 [ ]  ? __kmalloc_large_noprof+0x115/0x130
 [ ]  read_gmdid+0xf3/0x310 [xe]
 [ ]  ? xe_device_probe_early+0x143/0x710 [xe]
 [ ]  ? xe_pci_rebar_resize+0x17e/0x2e0 [xe]
 [ ]  ? __pci_set_master+0x61/0x100
 [ ]  xe_pci_probe+0x554/0xac0 [xe]
 [ ]  ? mark_held_locks+0x46/0x90
 [ ]  ? __pm_runtime_resume+0x5b/0x90
 [ ]  ? _raw_spin_unlock_irqrestore+0x67/0x90

</pre>
    </blockquote>
    <p>I was looking:</p>
    <p><b>Valid case:</b></p>
    <pre wrap="" class="moz-quote-pre">[drm] *ERROR* SIGID=104 (-ETIMEDOUT) Tile0: GT0: GUC: MMIO request ...</pre>
    <p><b>&nbsp;Invalid case now:</b></p>
    <p><b>xe 0000:03:00.0: LOG: invalid GT identifier: 5</b></p>
    <p>:</p>
    <p>xe 0000:03:00.0: [drm] *ERROR* SIGID=104 (-ETIMEDOUT) Tile5? GT5?
      GUC: MMIO request ...</p>
    <p>right?</p>
    <blockquote type="cite" cite="mid:37ba4065-9a0d-4c97-93db-e34ebb99da77@intel.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">Fixes: 1151b9f6f465 (&quot;drm/xe/log: Add component/location decorations to dmesg&quot;)
Signed-off-by: Michal Wajdeczko <a class="moz-txt-link-rfc2396E" href="mailto:michal.wajdeczko@intel.com">&lt;michal.wajdeczko@intel.com&gt;</a>
---
Cc: Rodrigo Vivi <a class="moz-txt-link-rfc2396E" href="mailto:rodrigo.vivi@intel.com">&lt;rodrigo.vivi@intel.com&gt;</a>
Cc: Mallesh Koujalagi <a class="moz-txt-link-rfc2396E" href="mailto:mallesh.koujalagi@intel.com">&lt;mallesh.koujalagi@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_log.c | 40 ++++++++++++++++++++++++-------------
 1 file changed, 26 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_log.c b/drivers/gpu/drm/xe/xe_log.c
index 5549ef6966fd..29eb16db3320 100644
--- a/drivers/gpu/drm/xe/xe_log.c
+++ b/drivers/gpu/drm/xe/xe_log.c
@@ -10,6 +10,7 @@
 
 #include &quot;xe_device.h&quot;
 #include &quot;xe_log.h&quot;
+#include &quot;xe_pci_types.h&quot;
 #include &quot;xe_printk.h&quot;
 
 static void log_emit_cper(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
@@ -52,18 +53,24 @@ static const char *log_component_prefix(u32 component)
 	return component ? log_unknown_component_prefix(component) : &quot;&quot;;
 }
 
-static struct xe_gt *get_gt_safe(struct pci_dev *pdev, u8 id)
+static bool allowed_tile_id(struct xe_device *xe, u8 tile_id)
 {
-	struct xe_device *xe = pdev_to_xe_device(pdev);
+	return tile_id &lt; 1 + xe-&gt;desc-&gt;max_remote_tiles;
+}
 
-	return xe ? xe_device_get_gt(xe, id) : NULL;
+static bool allowed_gt_id(struct xe_device *xe, u8 gt_id)
+{
+	return gt_id &lt; (1 + xe-&gt;desc-&gt;max_remote_tiles) * xe-&gt;desc-&gt;max_gt_per_tile;
 }
 
-static struct xe_tile *get_tile_safe(struct pci_dev *pdev, u8 id)
+static u8 gt_id_to_tile_id(struct xe_device *xe, u8 gt_id)
 {
-	struct xe_device *xe = pdev_to_xe_device(pdev);
+	return gt_id / xe-&gt;desc-&gt;max_gt_per_tile;
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
hmm, we need to check&nbsp;max_gt_per_tile&nbsp;should not be zero to avoid hard Oops. I know in real scenario,&nbsp;max_gt_per_tile

value is greater than 0 and less than equal to XE_MAX_GT_PER_TILE, however rogue user can write kunit test case and manipulate it, to avoid such scenario, we need to handle it.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
desc-&gt;max_gt_per_tile are const and are defined in xe_pci.c, so ordinary user can't change that</pre>
    </blockquote>
    Agreed!
    <blockquote type="cite" cite="mid:37ba4065-9a0d-4c97-93db-e34ebb99da77@intel.com">
      <pre wrap="" class="moz-quote-pre">

we also have a test check_platform_desc [2] to make sure no developer will define max_gt_per_tile as 0

and we can't really control rouge user that will prepare and use invalid descriptor for kunit,
but even then, it will crash just that kunit, so who cares?</pre>
    </blockquote>
    <p>I know we can't control rogue user, his intention might be
      different. IMO, at least we can alert it right?&nbsp; Upto you, how are
      u going to take rogue user case.</p>
    <blockquote type="cite" cite="mid:37ba4065-9a0d-4c97-93db-e34ebb99da77@intel.com">
      <pre wrap="" class="moz-quote-pre">

[2] <a class="moz-txt-link-freetext" href="https://elixir.bootlin.com/linux/v7.3-rc1/source/drivers/gpu/drm/xe/tests/xe_pci_test.c#L63">https://elixir.bootlin.com/linux/v7.3-rc1/source/drivers/gpu/drm/xe/tests/xe_pci_test.c#L63</a>
</pre>
    </blockquote>
    <p>I saw&nbsp;<span style="white-space: pre-wrap">max_gt_per_tile, kunit check where it's should be greater than 0 and less than equal to </span><span style="white-space: pre-wrap">XE_MAX_GT_PER_TILE to avoid such scenario.</span></p>
    <p><span style="white-space: pre-wrap">
</span></p>
    <p><span style="white-space: pre-wrap">Thanks,</span></p>
    <p><span style="white-space: pre-wrap">-/Mallesh</span></p>
    <blockquote type="cite" cite="mid:37ba4065-9a0d-4c97-93db-e34ebb99da77@intel.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
Thanks,

-/Mallesh

</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">+}
 
-	return xe &amp;&amp; id &lt; xe-&gt;info.tile_count ? &amp;xe-&gt;tiles[id] : NULL;
+static const char *location_suffix(bool valid)
+{
+	return valid ? &quot;:&quot; : &quot;?&quot;;
 }
 
 static const char *log_location_prefix(struct pci_dev *pdev, u32 location, char *buf, size_t size)
@@ -76,17 +83,22 @@ static const char *log_location_prefix(struct pci_dev *pdev, u32 location, char
 			goto unrecognized;
 		strscpy(buf, &quot;&quot;, size);
 	} else if (type == XE_LOG_LOCATION_TYPE_TILE) {
-		struct xe_tile *tile = get_tile_safe(pdev, id);
+		struct xe_device *xe = xe_any_to_xe(pdev);
+		bool valid = xe ? allowed_tile_id(xe, id) : false;
+		const char *pad = location_suffix(valid);
 
-		if (!tile)
-			goto unrecognized;
-		snprintf(buf, size, &quot;Tile%u: &quot;, id);
+		pci_WARN(pdev, !valid &amp;&amp; IS_ENABLED(CONFIG_DRM_XE_DEBUG),
+			 &quot;LOG: invalid tile identifier: %u\n&quot;, id);
+		snprintf(buf, size, &quot;Tile%u%s &quot;, id, pad);
 	} else if (type == XE_LOG_LOCATION_TYPE_GT) {
-		struct xe_gt *gt = get_gt_safe(pdev, id);
+		struct xe_device *xe = xe_any_to_xe(pdev);
+		bool valid = xe ? allowed_gt_id(xe, id) : false;
+		const char *pad = location_suffix(valid);
+		u8 tile_id = xe ? gt_id_to_tile_id(xe, id) : 0;
 
-		if (!gt)
-			goto unrecognized;
-		snprintf(buf, size, &quot;Tile%u: GT%u: &quot;, gt-&gt;tile-&gt;id, id);
+		pci_WARN(pdev, !valid &amp;&amp; IS_ENABLED(CONFIG_DRM_XE_DEBUG),
+			 &quot;LOG: invalid GT identifier: %u\n&quot;, id);
+		snprintf(buf, size, &quot;Tile%u%s GT%u%s &quot;, tile_id, pad, id, pad);
 	} else {
 		goto unrecognized;
 	}
</pre>
        </blockquote>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------7XhbIeb9tPhO0hcnZMYB2lDW--
