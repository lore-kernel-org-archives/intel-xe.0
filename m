Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A99DBC43458
	for <intel-xe@archiver.kernel.org>; Wed,  8 Jul 2026 07:58:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CA5610E57C;
	Wed,  8 Jul 2026 07:58:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pqz1Phwy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D67C10E57C
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Jul 2026 07:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783497483; x=1815033483;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CZly/f1cIiZiACZdeabnjkxYNQHkiJRYD+iLI12DmBM=;
 b=Pqz1PhwyWBSMzqbRn19NdIbRflOAWgvBt3hwpTeuyETs+JQUJm8dYf2b
 Kl91fov8nMzNx/UCPmGMDvfmEoGlUvSLfaR82YJR9yEvyqVmjLlIgKwQR
 94pjHpjkXFMuHQU5BfEJViCT8pM/FFlLGr22m3iJjQ1Na9o5tQ7VtJ+vU
 JRqSuS2IDUMeZfvyNoQAM2ZdZFWL4NBZR+1QvLkYPznXEFb/8N3x+73LZ
 BhMq178jpvQORXA+5aymnTheiipD9cnJR5j6b5TUyYL64E+V1GWlkmYhJ
 mHC7iZ1ctnMTc8t7ue36kEMhwxbmW9BNca4Ux3pnb8JBbbeDTcEn7gZNh g==;
X-CSE-ConnectionGUID: gk3kt4zDQ6i5UcKGZDl7NQ==
X-CSE-MsgGUID: K3OPQxSPTTiAulFCL4byTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="95531141"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="95531141"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2026 00:57:57 -0700
X-CSE-ConnectionGUID: czDHgcJVQuq30XR8Ie+0IA==
X-CSE-MsgGUID: lGGkSqw6TlSCDnVaBM7wug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="254861801"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2026 00:57:57 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 8 Jul 2026 00:57:56 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 8 Jul 2026 00:57:56 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.69) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 8 Jul 2026 00:57:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hxGjK2KxW67WPrQvsoXrUYsQ+Eziy0QhLA7+77+vNX7S/sm9RyMUmVhEN/cuv6kOktwjRQAGbj/y+H9VD+2jrJ3XqDyE21GsVO1P5uVIgONacWosppZwkCYwPrn7q61ulBGjzVsZyS+/ovOffU8E+LpLRAvzCzHC5D/YKjwVNipSeuVMq80EDIzGYJp/GUOw25gm7NwzeFdYTsOlPiOJ1W+bPFWAl1eNp/jgcrLPDnSk+0HGwKOtUjZBnpNZxw34gLmHXuL/XM8Fypwm4MW3BdqhHo+2JMaNGj9eOT/oDxo8ORvv2S5OHm5zn2a1vUaC4Q8mS+qppAUpj6Qz/9V6Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b5ZvyxqTuDtUEOTLDgp4F7vB7FaxPfxGt2OUhevinRA=;
 b=HmCcYhktkbJfb31tXS9uw/Htt01iHQy4/0O0M45O/m3+q6pwQ9j20PSX0Hrjj+gCb2IFcDTLoNIRijIIhZZByUAaemPKp8PwNxoFZTO6RQWvSJdLghmQjDx0pzXQVITglhyhJTck9kopYxICy3Ko+b+nwexUVJf0viU5Dg/9lMxv+5tZtRNNqEc6v5rNRbUYuiFu6LwycDy4tOndYlLyzg1Td2C0WOTVIoipLrS6DyaKPQUUA5htk8g0tRq+RSFFyUskt4MHKWE8lOEXNyEsGLEJQYAjlm5xUY+0a3ROZbQGakpjrNbPLxVVXH4/sFdOsoW5XDTDotU8Zg0zssvSLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8706.namprd11.prod.outlook.com (2603:10b6:610:1d1::22)
 by CH2PR11MB8835.namprd11.prod.outlook.com (2603:10b6:610:285::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 8 Jul 2026
 07:57:53 +0000
Received: from CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d]) by CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d%6]) with mapi id 15.21.0181.009; Wed, 8 Jul 2026
 07:57:53 +0000
Message-ID: <9d18fe09-196d-4766-b82e-5561de15dec7@intel.com>
Date: Wed, 8 Jul 2026 13:27:43 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/1] drm/xe/xe_ras: Add RAS GPU health indicator
To: "Tauro, Riana" <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <raag.jadav@intel.com>,
 <ravi.kishore.koppuravuri@intel.com>, <mallesh.koujalagi@intel.com>,
 <andi.shyti@intel.com>, <rodrigo.vivi@intel.com>
CC: <anoop.c.vijay@intel.com>
References: <20260708061221.4006706-3-soham.purkait@intel.com>
 <20260708061221.4006706-4-soham.purkait@intel.com>
 <1642a35e-36f4-4930-b9f4-c4a64105fa06@intel.com>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <1642a35e-36f4-4930-b9f4-c4a64105fa06@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0158.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1cf::6) To CH3PR11MB8706.namprd11.prod.outlook.com
 (2603:10b6:610:1d1::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8706:EE_|CH2PR11MB8835:EE_
X-MS-Office365-Filtering-Correlation-Id: 32d98ebf-bada-4f30-cf50-08dedcc69cc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|18002099003|921020|22082099003|3023799007|56012099006|11063799006|4143699003|6133799003;
X-Microsoft-Antispam-Message-Info: BfkLLeNI2xp8s7lpxs4cx2ZY8ANO/ds+XXNYigMCckrgZy4Rgcugy25dxqN3zSjHtIIBYDfFqw9eJnIa/nY04E5A+mR0UefjZJboqD4ykjqBoRJ8w5uePVEqDsk1DZF0uSf1BYfrpYSd+XNO6PD9o79S4qx9anEDY8lWzpG8XWJdjd1n3drckYtlJXwHCGvsS1Mo85EkLlQU23m0nB2geCao4PQmRil3mIlI9Iua9IfNZUxxZ2eXwYYNh74SHTLQ/2r6uYLixLZZH1qXOchRkYSWZ8orP8iYw1xtmdoiVfmlFW5vNeTS44JTduVybMkvrjcIOHpc6CbVUn/CJl1so6MQ/fwUKqBc7M3dj4m0LKtGeUttFiw6q0Z03BxWsUoDqTh3qVrmCR1zCJWFZhWGCTcKWsRlz6OotWQKm6nYjYvqZLYOjCdqNTwlK0o1iTUfC1yakj/159zrXuKkc4bitZYKAkWlbGvXPEeHEGKLimN6NIlqy7c7aqq0C3AD4EKPXkzJvlUw+bnEvmRHAeLJy++0p3G01vVYzaV+G29koHA8Oc0VrXKOQogFGjXu5uxVnbSGBxLs/4y1aFK0zbXgFM155BZbSXTY9M8+krJ32LuysACZM67qXiAFvLC68aoOE2O1spOhJ7t/DcSfeV4amFQ36VvYOv5FnjfXzqY2t0QNKLc+Yi+wevZ3Y8XhwZjjrjzWdMttwXnpxKQPHcYinA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8706.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(18002099003)(921020)(22082099003)(3023799007)(56012099006)(11063799006)(4143699003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YkxHVmtFMW1kRDVQRHVzNzJDWXVvSTAxakp5cnVuOXlYRnVpK3JqUTVNdkJh?=
 =?utf-8?B?eVhNQUcrWTZkMnhTNVBKRUNaanJNblJ1OWh2UldTa0ZTMVE2VmVZNEhFR1Z1?=
 =?utf-8?B?alNEakFFczkva1RxKzRmdGZoaTV3bFJRY2tlb1VlVmxWZGZpOThYL3lUdGRi?=
 =?utf-8?B?Y3FhYWVEeDVReFRieHRHMnNoUFQxZlo2WTdYR0NXOTZYLzJsUGNuc3RHNjhV?=
 =?utf-8?B?Z3ZVbjVHaExoU0t3MmExS1V5aW9LK1YzZU9yUXl1akZrM2wxcHRBL0x1VWNC?=
 =?utf-8?B?dkFMeGpvQWZNM2hvaE9HcThVeGRoUkRlTS9Oa290d2FEMCtVWHNxclVWelNj?=
 =?utf-8?B?MTJKQ0dtcC9xNUlscDlnb1MxaEN4TW1NcE1GdUp5citmc1Y0djBiNmpvYmUx?=
 =?utf-8?B?N1VFUWpOUzJNTndwTzN0YUxhU0Q3WHRxNmlmQUVwQXphVzh3ZG9kZHpFYnBx?=
 =?utf-8?B?ZmwxWUYvVDZya0VDcmdpcW9OZU0zOTRKWEhoSk4rK3Z0dk9OdVhld2Y5QXZG?=
 =?utf-8?B?UFVXUDNWLy8xLzVDcHRLYjNDbzE2TjI4Q0pkM2Y5aVdZUEptZGZYdlFzQTBB?=
 =?utf-8?B?cHVEMzEzajEyRDlwbGo3Rm9sejR3d00rcXRYZHIzZ1o5N1YvTEVYckVpdU9i?=
 =?utf-8?B?Z2JGUjhYaXZ4SllidXlZbDlUY2FyYzNDZ0RVNTcreTJrN3NGeDAyaDcyY1lT?=
 =?utf-8?B?RVhZaVBGU1RvOStNNDJIQjVsRWM3Sy9RUndKeHV1bjgza2N1TnJyNm5mZTRj?=
 =?utf-8?B?aFlRZUpyZjBRUTdxbEFGNUtsMkpTUUgrdWNjaWZoVCsxcHFiQTlZVGVEc00w?=
 =?utf-8?B?UUtwL21iUU10cFAwL0Qza0FGUHNNNWgyaGhmbndsUERxVHBhck9rdTdFaG1k?=
 =?utf-8?B?bXU4Nkp3MXJqODJDSEdZaU9EcWtDQnlqclBXdXhWVzVuTWorendGc2dXdVpD?=
 =?utf-8?B?NUVNZmlCZ3p3UjBTSG1GQjZBUCttZVdoVmFDMXFKUC80SzNJV0hWWEQwUkVP?=
 =?utf-8?B?VWdTT09RMnEvMTJRWVNpSUxxb3I5aGp3dS9HOFRGcTh1eFdLL2NrbmhVY3hI?=
 =?utf-8?B?QldPWWs4RGIveXgxSi9TZkRSNVlaUEFVWUsxdXh0cG9yWWlxWlRrQU5jZ3pk?=
 =?utf-8?B?Zm03cVFjRXRnbEhzN3IrNGNEYW5MRHFpd1lLbTNiQmp2SUhDTFpBUTlheDJq?=
 =?utf-8?B?Ukl5ODhZODdYRDRxZjFGYnFkeGRsc3FOcWp5clAvZWVZdVluWWRrMmQ2NXNo?=
 =?utf-8?B?VkVSMjB0eHM2SHJHalJhbmRaV1MzSC9KM3dVYm56bXZpcFhUdlQ0b2hEM2tv?=
 =?utf-8?B?dEREQ1NEWmFwaDBFM1N0aEdKaDdVck1lb1B0cWxCcTE5c0V6MFdJUFFVZ1Rs?=
 =?utf-8?B?YUFQam91ZGtzZnpZVzVJdDRhWkdMSXNlK29yRkxsNmlwTDliS0JJUGhjeDVC?=
 =?utf-8?B?OXRmcVBROThGN3lESmtGTTM3SDhiMU9SWXFvSENsV1pxcHY2cjBVS1JERkJy?=
 =?utf-8?B?ZGx6VzZwL210Qjloa3p5cTg0b3lKQ01MaXB0SGlYK0FxbFJTUDZVT2ZDekhI?=
 =?utf-8?B?dnJwUzJyNnFLdzJWb2R6ZkhCOUExa2ZDVVFtSXB3SGtLeS9WK0UrOVZuMjJJ?=
 =?utf-8?B?aUF0b1N6ZFBLcUZqTG9TZEpxVVV2Qnk2YUEvN1dyYjNXcGVuUEVmaUcwWGJF?=
 =?utf-8?B?Y25NVmEwdWxCMmp4RXJXN0hGam1FZzFNR1cwZG5razJNWVNQK2pQRFFSRGZO?=
 =?utf-8?B?eGJPaVJ4OVN1c1U5SlowbG51V3FDaWovaU9OMkJTcHJVeHpZY1FEb2VNSzFM?=
 =?utf-8?B?cENRQ3VOcWF3dCtPT0JTTitiTTJEdjMzRWk0L2dGN3pEamgxVFVvTUQyODlW?=
 =?utf-8?B?VFB4ZXliWHF6dnUyOUFUZmE2M3dxYlgydld5ZTBnY3Z4ZE1zMmZHVlR4cFh0?=
 =?utf-8?B?RDhzL3Rqa0poUVk0UUZ6OXd6cE5ZUThmNU9VKzk3NUNVbGR6OGRGNVpxZ1Rt?=
 =?utf-8?B?NDlBdGlkR0V2TmFYMTRJNHA2QXk2RDBZajdoS2E3MkZFVGxOVGY4MVg0K3JZ?=
 =?utf-8?B?R0phMzN6Nm1GZ3F0VEc4YnBzWnAzQ0Rvb05HMzhwaW5YZ3NrVW1IbmI5Vm14?=
 =?utf-8?B?ZUlxam8za2JMY1lKQTUxeGl4Vnc2czdLbUcxYmpwUDJBNXdoTXI5YVBFUzJ0?=
 =?utf-8?B?MzlVQ1hxWU1EMlkxVGtIbmxFY2d1c3YySG10NWdjcVFkclZtK25xb292T2gw?=
 =?utf-8?B?YXVsSkx2enBnbVNvcjdJbGl0dzNOcHRJWkxleTJoMEtTMUhrV2ZzSndndWl2?=
 =?utf-8?B?MWo3cVgrS1hRcDNZMkxDR2RJdUxUYzdpcm4xZlBoRGE3NklDeEZkSENJT1Vw?=
 =?utf-8?Q?eDWdKDtd3xdGwIUM=3D?=
X-Exchange-RoutingPolicyChecked: sD/arJK42BAS9dPTNkNMNzprP17f3uLohmMwH4yqUiWN+2+4bXCopepVkwOeBjgb6j/hvDlLDWDCTaZx/msFqQnXqNNQQf6GeNorjIId/4cUTw2Jt0dKkZqqgRg5AcXCj6SwK7BOQBfmdTxlAFl5JWOUe7oyqPXvPSq0ebOAK96IcJOpNPxA3BLkshoDfJK4M0aVPVRpT5cvjmucsWbklr4b3WpqrMELDiMpSQ3EWBLLTxHNaeE+2j9APNy8u2oT2Z2W+EgvYggdhX9db1cdkvZOEqkA3gZufYuFCkEczeNKpStWYOSs8dWrgjhZ+nHSBqaS0myYdI0GIDq6Oxno5A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 32d98ebf-bada-4f30-cf50-08dedcc69cc2
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8706.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 07:57:52.9773 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7uldekq0bvcQd2GH7iBwoCyubxeht0TpRs5Asb83YpHsF0/bDVo0US+u/HBpnbMb6oYDVnmD2Pv9lSGZQ0mxdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB8835
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

Hi Riana,

On 08-07-2026 13:10, Tauro, Riana wrote:
>
> On 08-07-2026 11:42, Soham Purkait wrote:
>> Add a sysfs interface that reports the current GPU health state and
>> lets admin users and management tools update it but is readable by all
>> users. Requests are routed through the sysctrl mailbox. The interface
>> is present only on platforms that support the GPU health indicator.
>>
>> The interface is a single read/write file at the device level:
>>
>>    $ cat /sys/.../device/gpu_health
>>    ok
>>
>>    $ echo critical > /sys/.../device/gpu_health
>>
>>    $ cat /sys/.../device/gpu_health
>>    critical
>>
>> v1:
>>   - Add enum for health status. (Andi, Rodrigo)
>>   - Return error number instead of error message in _show/_store. (Andi)
>>   - Move GPU health sysfs init error logging to xe_ras_init. (Andi)
>>   - Return only the current health state for sysfs read. (Andi, Rodrigo)
>>   - Add documentation for sysfs interface. (Andi, Rodrigo)
>>
>> v2:
>>   - Make logs and structures consistent with their counterparts. (Riana)
>>   - Drop unnecessary variables. (Andi, Riana)
>>   - Add correct KernelVersion. (Raag)
>>
>> v3:
>>   - Add missing blank line before #endif. (Badal)
>>
>> v4:
>>   - Add consistent "gpu" nomenclature to the gpu health indicator
>>     DOC blocks. (Riana)
>>   - Add Kdoc for gpu health indicator. (Anshuman)
>>
>> v5:
>>   - Rename struct fields to response.health, request.health. (Riana, 
>> Raag)
>>   - Use devm_device_add_group instead of custom sysfs init/fini. (Raag)
>>   - Rename health enum to shorter XE_RAS_HEALTH_*, drop redundant
>>     invalid-input log, and minor log/format cleanups. (Raag)
>>
>> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
>> Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
>> Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
>> ---
>>   .../ABI/testing/sysfs-driver-intel-xe-ras     |  30 ++++
>>   Documentation/gpu/xe/xe_device.rst            |   9 ++
>>   drivers/gpu/drm/xe/xe_ras.c                   | 139 ++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_ras_types.h             |  57 +++++++
>>   drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |   4 +
>>   5 files changed, 239 insertions(+)
>>   create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-xe-ras
>>
>> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-ras 
>> b/Documentation/ABI/testing/sysfs-driver-intel-xe-ras
>> new file mode 100644
>> index 000000000000..9612b97b0f88
>> --- /dev/null
>> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-ras
>> @@ -0,0 +1,30 @@
>> +What:        /sys/bus/pci/drivers/xe/.../gpu_health
>> +Date:        April 2026
>> +KernelVersion:    7.2
>> +Contact:    intel-xe@lists.freedesktop.org
>> +Description:
>> +        This file exposes the current gpu health state and allows 
>> the gpu
>> +        health state to be updated.
>> +
>> +        This sysfs file is present only on Intel Xe platforms that 
>> support
>> +        the gpu health indicator interface for RAS. Reading the current
>> +        health state is available to all users, while updating the 
>> health
>> +        state is restricted to administrative users only.
>> +
>> +        Read returns a single line containing one of the valid 
>> values for
>> +        the current gpu health state. Writing one of the valid values
>> +        updates the current gpu health state.
>> +
>> +        The valid values for the gpu health state are:
>> +
>> +            ok
>> +                The gpu is healthy and operating within normal
>> +                parameters.
>> +
>> +            warning
>> +                The gpu is experiencing minor issues but remains
>> +                operational.
>> +
>> +            critical
>> +                The gpu is in a critical state and may not be
>> +                operational.
>> diff --git a/Documentation/gpu/xe/xe_device.rst 
>> b/Documentation/gpu/xe/xe_device.rst
>> index 39a937b97cd3..6fdba960c2d9 100644
>> --- a/Documentation/gpu/xe/xe_device.rst
>> +++ b/Documentation/gpu/xe/xe_device.rst
>> @@ -8,3 +8,12 @@ Xe Device Wedging
>>     .. kernel-doc:: drivers/gpu/drm/xe/xe_device.c
>>      :doc: Xe Device Wedging
>> +
>> +.. _xe-gpu-health-indicator:
>
> Where is this used?
>
>> +
>> +====================
>> +GPU Health Indicator
>> +====================
>> +
>> +.. kernel-doc:: drivers/gpu/drm/xe/xe_ras.c
>> +   :doc: GPU Health Indicator
>> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
>> index 74d5016d9ffe..d1214a213d6e 100644
>> --- a/drivers/gpu/drm/xe/xe_ras.c
>> +++ b/drivers/gpu/drm/xe/xe_ras.c
>> @@ -65,6 +65,13 @@ static const char *const xe_ras_components[] = {
>>   };
>>   static_assert(ARRAY_SIZE(xe_ras_components) == XE_RAS_COMP_MAX);
>>   +static const char * const gpu_health_states[] = {
>
> status or states. Use any one consistently.
>
>> +    [XE_RAS_HEALTH_OK]        = "ok",
>> +    [XE_RAS_HEALTH_WARNING]        = "warning",
>> +    [XE_RAS_HEALTH_CRITICAL]    = "critical",
>> +};
>> +static_assert(ARRAY_SIZE(gpu_health_states) == XE_RAS_HEALTH_MAX);
>> +
>>   static u8 drm_to_xe_ras_severity(u8 severity)
>>   {
>>       switch (severity) {
>> @@ -332,6 +339,132 @@ int xe_ras_clear_counter(struct xe_device *xe, 
>> u8 severity, u8 component)
>>       return 0;
>>   }
>>   +static ssize_t gpu_health_show(struct device *dev, struct 
>> device_attribute *attr, char *buf)
>> +{
>> +    struct xe_ras_get_health_response response = {0};
>> +    struct xe_sysctrl_mailbox_command command = {0};
>> +    struct xe_ras_get_health_request request = {0};
>> +    struct xe_device *xe = kdev_to_xe_device(dev);
>> +    const char *health;
>> +    size_t rlen;
>> +    int ret;
>> +
>> +    xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, 
>> XE_SYSCTRL_CMD_GET_HEALTH,
>> +                  &request, sizeof(request), &response, 
>> sizeof(response));
>> +    guard(xe_pm_runtime)(xe);
>> +    ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
>> +    if (ret) {
>> +        xe_err(xe, "sysctrl: failed to get health %d\n", ret);
>> +        return ret;
>> +    }
>> +
>> +    if (rlen != sizeof(response)) {
>> +        xe_err(xe, "sysctrl: unexpected get health response length 
>> %zu (expected %zu)\n",
>> +               rlen, sizeof(response));
>> +        return -EIO;
>> +    }
>> +    if (response.health >= XE_RAS_HEALTH_MAX) {
>> +        xe_err(xe, "sysctrl: invalid health state %u\n",
>> +               response.health);
>> +        return -EIO;
>> +    }
>> +
>> +    health = gpu_health_states[response.health];
>> +
>> +    xe_dbg(xe, "[RAS]: get health: %s\n", health);
>> +
>> +    return sysfs_emit(buf, "%s\n", health);
>> +}
>> +
>> +static ssize_t gpu_health_store(struct device *dev, struct 
>> device_attribute *attr,
>> +                const char *buf, size_t count)
>> +{
>> +    struct xe_ras_set_health_response response = {0};
>> +    struct xe_sysctrl_mailbox_command command = {0};
>> +    struct xe_ras_set_health_request request = {0};
>> +    struct xe_device *xe = kdev_to_xe_device(dev);
>> +    const char *health;
>> +    size_t rlen;
>> +    int state;
>> +    int ret;
>> +
>> +    state = sysfs_match_string(gpu_health_states, buf);
>> +    if (state < 0)
>> +        return -EINVAL;
>> +
>> +    request.health = state;
>> +
>> +    xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, 
>> XE_SYSCTRL_CMD_SET_HEALTH,
>> +                  &request, sizeof(request), &response, 
>> sizeof(response));
>> +    guard(xe_pm_runtime)(xe);
>> +    ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
>> +    if (ret) {
>> +        xe_err(xe, "sysctrl: failed to set health %d\n", ret);
>> +        return ret;
>> +    }
>> +
>> +    if (rlen != sizeof(response)) {
>> +        xe_err(xe, "sysctrl: unexpected set health response length 
>> %zu (expected %zu)\n",
>> +               rlen, sizeof(response));
>> +        return -EIO;
>> +    }
>> +
>> +    ret = ras_status_to_errno(response.status);
>> +    if (ret) {
>> +        xe_err(xe, "sysctrl: set health command failed with status 
>> %#x\n",
>> +               response.status);
>> +        return ret;
>> +    }
>> +
>> +    if (response.health >= XE_RAS_HEALTH_MAX) {
>> +        xe_err(xe, "sysctrl: invalid health state %u\n",
>> +               response.health);
>> +        return -EIO;
>> +    }
>> +
>> +    health = gpu_health_states[response.health];
>> +
>> +    xe_dbg(xe, "[RAS]: set health: %s\n", health);
>> +
>> +    return count;
>> +}
>> +
>> +static DEVICE_ATTR_RW(gpu_health);
>> +
>> +static struct attribute *gpu_health_attrs[] = {
>> +    &dev_attr_gpu_health.attr,
>> +    NULL,
>> +};
>> +
>> +/**
>> + * DOC: GPU Health Indicator
>> + *
>> + * On Intel Xe platforms that support the GPU health indicator 
>> interface,
>> + * the driver exposes a sysfs attribute at the device level as:
>> + *
> code block would be appropriate
>
>> + * ``/sys/bus/pci/drivers/xe/<BDF>/gpu_health``
>> + *
>> + * Reading the attribute returns a single line containing the 
>> current GPU
>> + * health state. Writing one of the valid values updates the same. 
>> Reads
>> + * are available to all users; writes are restricted to administrative
>> + * users only (attribute permissions ``0644``).
>
> Can these be set by firmware too? Worth mentioning incase an admin had 
> never set
Does this  falls under the scope of this doc ?
> the value and sees a warning.
>
> Do we need to mention when user needs to use this?
>
>
>> + *
>> + * The valid values for the GPU health state are:
>> + *
>> + * - ``ok``:
>> + *    The GPU is healthy and operating within normal parameters.
>
> Have you generated the document?
yes.

Thanks,
Soham.
>
>> + * - ``warning``:
>> + *    The GPU is experiencing minor issues but remains operational.
>> + * - ``critical``:
>> + *    The GPU is in a critical state and may not be operational.
>> + *
>> + * See Documentation/ABI/testing/sysfs-driver-intel-xe-ras for the ABI
>> + * specification.
>> + */
>> +static const struct attribute_group gpu_health_group = {
>> +    .attrs = gpu_health_attrs,
>> +};
>> +
>>   /**
>>    * xe_ras_init - Initialize Xe RAS
>>    * @xe: xe device instance
>> @@ -340,6 +473,8 @@ int xe_ras_clear_counter(struct xe_device *xe, u8 
>> severity, u8 component)
>>    */
>>   void xe_ras_init(struct xe_device *xe)
>>   {
>> +    int ret;
>> +
>>       if (!xe->info.has_drm_ras)
>>           return;
>>   @@ -350,4 +485,8 @@ void xe_ras_init(struct xe_device *xe)
>>         if (IS_ENABLED(CONFIG_PCIEAER))
>>           ras_usp_aer_init(xe);
>> +
>> +    ret = devm_device_add_group(xe->drm.dev, &gpu_health_group);
>> +    if (ret)
>> +        xe_err(xe, "Failed to initialize GPU health sysfs, 
>> err=%d\n", ret);
>>   }
>> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h 
>> b/drivers/gpu/drm/xe/xe_ras_types.h
>> index 6688e11f57a8..4c4fbc42c956 100644
>> --- a/drivers/gpu/drm/xe/xe_ras_types.h
>> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
>> @@ -10,6 +10,21 @@
>>     #define XE_RAS_NUM_COUNTERS            16
>>   +/**
>> + * enum xe_ras_health_status - gpu health status values
>> + *
>> + * @XE_RAS_HEALTH_OK: gpu is healthy and operating normally.
>> + * @XE_RAS_HEALTH_WARNING: gpu has minor issues but is still 
>> operational.
>> + * @XE_RAS_HEALTH_CRITICAL: gpu is in a critical state and may not 
>> be operational.
>> + * @XE_RAS_HEALTH_MAX: Sentinel value for validation
>> + */
>> +enum xe_ras_health_status {
>
> If you removed status from enum, remove from name as well.
>
>> +    XE_RAS_HEALTH_OK = 0,
>> +    XE_RAS_HEALTH_WARNING,
>> +    XE_RAS_HEALTH_CRITICAL,
>> +    XE_RAS_HEALTH_MAX
>> +};
>> +
>>   /**
>>    * struct xe_ras_error_common - Error fields that are common across 
>> all products
>>    */
>> @@ -121,4 +136,46 @@ struct xe_ras_clear_counter_response {
>>       /** @reserved1: Reserved for future use */
>>       u32 reserved1[3];
>>   } __packed;
>> +
>> +/**
>> + * struct xe_ras_get_health_request - Request structure for 
>> obtaining gpu health
>> + */
>> +struct xe_ras_get_health_request {
>> +    /** @reserved: Reserved for future use. */
>> +    u32 reserved[2];
>> +} __packed;
>> +
>> +/**
>> + * struct xe_ras_get_health_response - Response structure for 
>> obtaining gpu health
>> + */
>> +struct xe_ras_get_health_response {
>> +    /** @health: Current gpu health, see &enum xe_ras_health_status */
>> +    u8 health;
>> +    /** @reserved: Reserved for future use */
>> +    u8 reserved[3];
>> +} __packed;
>> +
>> +/**
>> + * struct xe_ras_set_health_request - Request structure for setting 
>> gpu health
>> + */
>> +struct xe_ras_set_health_request {
>> +    /** @health: New gpu health to set, see &enum 
>> xe_ras_health_status */
>
>
> Let's use short description . "gpu health to be set" or just gpu health
>
>> +    u8 health;
>> +    /** @reserved: Reserved for future use */
>> +    u8 reserved[3];
>> +} __packed;
>> +
>> +/**
>> + * struct xe_ras_set_health_response - Response structure for 
>> setting gpu health
>> + */
>> +struct xe_ras_set_health_response {
>> +    /** @status: Status of set health operation, see &enum 
>> xe_ras_response_status */
>> +    u32 status;
>> +    /** @health: Resulting current gpu health, see &enum 
>> xe_ras_health_status */
> Let's use short description . "current gpu health" or just gpu health
>> +    u8 health;
>> +    /** @reserved: Reserved for future use */
>> +    u8 reserved[3];
>> +    /** @reserved1: Reserved for future use */
>> +    u32 reserved1[2];
>> +} __packed;
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h 
>> b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> index 6e3753554510..d4da6e9ef774 100644
>> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> @@ -25,11 +25,15 @@ enum xe_sysctrl_group {
>>    * @XE_SYSCTRL_CMD_GET_COUNTER: Get error counter value
>>    * @XE_SYSCTRL_CMD_CLEAR_COUNTER: Clear error counter value
>>    * @XE_SYSCTRL_CMD_GET_PENDING_EVENT: Retrieve pending event
>> + * @XE_SYSCTRL_CMD_GET_HEALTH: Retrieve current health status
>
> gpu health
>
> Thanks
> Riana
>
>> + * @XE_SYSCTRL_CMD_SET_HEALTH: Set new health status
>>    */
>>   enum xe_sysctrl_gfsp_cmd {
>>       XE_SYSCTRL_CMD_GET_COUNTER        = 0x03,
>>       XE_SYSCTRL_CMD_CLEAR_COUNTER        = 0x04,
>>       XE_SYSCTRL_CMD_GET_PENDING_EVENT    = 0x07,
>> +    XE_SYSCTRL_CMD_GET_HEALTH        = 0x0B,
>> +    XE_SYSCTRL_CMD_SET_HEALTH        = 0x0C,
>>   };
>>     /**
