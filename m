Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 712EDC5B56A
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 08:55:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 289BE10EF03;
	Wed, 12 Aug 2026 08:55:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f7eQbU2L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23CD610EEFF
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Aug 2026 08:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786524957; x=1818060957;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dYGuU0MK4L9O0eUfjJadxZeZAutkKkITxrI8dV1CbrU=;
 b=f7eQbU2LX+YhOl0IrKhwo/aG1YnbRxu+XQ4UVxynybLBCy/WAEvjfxJg
 tMTJs71ABok75Ma8UUAQ/mbYw3c7ScST+xHxmewFPQfR83qZZaKWA6w7h
 hA/fWciwGXe+5wQBqNqIQ44lU6Jxzd0tdsjosSRbkp/j1zOVPrT4EO1CY
 Fj4unmeT5LcA4TjvGld7HxrgPTp5j5QIQJb2/wmszpGK6gsuCulOFwiuk
 vjwenU6aC2wpN+pJn+ZHzNZFRGar6ua7s5GFffwOoPXpwvcze1ARwoPLg
 kD5GWMfGPTfQEuYjSSq9S7Dj2kowB4rkllblayltOdAVmMWMVc+2xyDBC w==;
X-CSE-ConnectionGUID: 9X80xYzCSK+pj7EvUpKkdA==
X-CSE-MsgGUID: KX8jScQJQ36RE+FomQ0v6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="87145797"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="87145797"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 01:55:56 -0700
X-CSE-ConnectionGUID: Es4tbXhlROizDHwOBSavHQ==
X-CSE-MsgGUID: RXHMnZLmSEuQ0CEM5w/hxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="268739813"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 01:55:55 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 01:55:55 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 12 Aug 2026 01:55:55 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.9) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 01:55:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SDjfGam3hjgFRGyQ1H/FH279DMutG5QyVEgmHHqhYTkxEXFsdcG+2Vai4ZeUQTzLFdOEkmekCsq8hBkTWwrUWzA3a2xDMBrZkliSONVFWF7yybyMdgcd0p2sKOZWTWL9u0DsrlEW8vE1a9Bzpcmu3Eff43gnhbIsbUmQbN3PWJJ9WF53E6e7WW0R8R6gc1Km90/uNVAytMdr5ray4bPOcBj8M0Bl/lgRlGn3edwZ10KMTG2b/hSHj47jGxA1B3Db/rJ9Wc5SZJDqGQFK7cA8hRjGVp+IuyaaqvIwuYABX6E4K6VXDcfWTK9iQqPZ8HQaPbh/RTfCtytpSUj/M2UtjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cRXZ67MRLYQxFrKdO976YgsELdeEUL6oodeZ0ym3r7g=;
 b=EaubG5mxd6/k55x+ZinPl1sUQe3NimbThU3lyJG/60rfYYh1E2FfadSpRal7K7DtPiU+MFSEfbgmjw1Pd35N+TXkFdrMcnMXejyE09P+z59p+l1XBdmaPOy8EQZ5hp7R5W5a3bqAMbIsGwD16lJugfwA15SqqZ+mybFnZy/5jkg35K7V5jqGNhUdr6YeYvAPscXxJKlflt34DPIgd8PJdSrXen+vpfA/UicFrtkwYMdjKPy0GU5OVWHqV7w1Dsswnb+QxclCZAJRs3vQ/q4M+Shj0Y+ORNhboMO6AOjzVIrA9LRU0ONHhlCovDjCZKf0fZVE01/L1AkVutE4hcR/Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by IA0PR11MB7742.namprd11.prod.outlook.com (2603:10b6:208:403::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.13; Wed, 12 Aug
 2026 08:55:47 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0315.011; Wed, 12 Aug 2026
 08:55:47 +0000
Message-ID: <c17e6b21-89f2-49ae-9353-af7d99140eeb@intel.com>
Date: Wed, 12 Aug 2026 10:55:43 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/23] drm/xe/log: Extend components list with hardware
 items
To: "Tauro, Riana" <riana.tauro@intel.com>, "Mallesh, Koujalagi"
 <mallesh.koujalagi@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Aravind Iddamsetty
 <aravind.iddamsetty@intel.com>
References: <20260730152121.576-1-michal.wajdeczko@intel.com>
 <20260730152121.576-12-michal.wajdeczko@intel.com>
 <f70d047f-021a-4ac0-892e-3af837aca082@intel.com>
 <ce505796-9927-4b5c-86e4-4657d51f30b7@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <ce505796-9927-4b5c-86e4-4657d51f30b7@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA1P291CA0003.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::6) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|IA0PR11MB7742:EE_
X-MS-Office365-Filtering-Correlation-Id: c9824a1d-4673-4cb8-2257-08def84f8069
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|10067099003|56012099006|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: LgCHFgDboxp7b7oKsUT1b1FMiubiASahihD3MrZKRybZoI3r9v862vEZkHFOLy8VBRNe7/nr5R6HlCFYrQrEKsiycbX6gwX5KCtBXKJYxNhUr9Lwk1SZ9bxNmaZbOHImzntAzle3masIrWPU+kYp+xV676CqceD/rfVX4nqZLRfmXro5BpyAQD27l5+XuTfPZV5yLt2GFC0IkqplGWvp9eE0mB5YgmuUqAdm/gAt0ND4CrsCt5RaNkSCTSXrEb6oXRLyOrtaNK4eECtsvntNwTWt71cYUoYw8v4pNCvqL5xi8gb8XZ1igfQC/NXro/oPhpnOSr6vuaF/kGjG0klP8z+WkQfOAUHBrHUN+nrpUgfUvAQpz0eFT08cOGpVkmC+RhFh5QpNUb1McNZpxU1BDyngXZHI4SSvI3wwgjQJmagR/79P5oyPUeavkP6F9tn0IdTMe/O+CPMvMC//VSoa3KFMOQrPYjL55dCiEAoMxWGm6yzg5tqTi1PwWrBsgRqNAfT+mewSAqhc8aaDF0JmY4pUvxGEGbqtn2D/2LnEq4hOsDVl80BHbxIBzTD7VGYIeyDc/uyUX51trlFZgJ9yuADFjoI7kf295UPQ/EKuS7YTyBKvVl9Fih04iIZzjx4Iubo0hZx6qgJBYTMyn/bRJSvYptobNxLkdggQXxoU2XU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(10067099003)(56012099006)(4143699003)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Sk43bFN3WHpwNWFsY0JjNVErVDFzeDVjdUg3Nk00ejE2OGphbE01bjlWalRP?=
 =?utf-8?B?M0g2b09rSVAxcVEzby8rTjZxUzBvaS9pMnVMeFkwL096YmVRQjdSamtyTXlM?=
 =?utf-8?B?czJHaG9zSWJVNzdLNUNCTTNtUGdEdmM4ZUJQdUxHS3p6RWtaQVRuM2JjcG9m?=
 =?utf-8?B?TGVicC9RNEtnYjJwaXFtOHRKZkhLak96NnZuTWpINDdXMGMrOG1nbEtvR09o?=
 =?utf-8?B?UWE1RkJvOCtKb29QMXRHcktvOUpzRGlLWDU1NG5qWkl5UndTc01KL2h5TXN3?=
 =?utf-8?B?bnVVV3cvMzd5Qjh5QlFuRk5JMU4wY2dHSmQ0RTBVNGNzWVh4bGY2b0pDYUwr?=
 =?utf-8?B?ZHZmZm92OVdOa2FJU3krMWhQd1RBRWM5V0V0blh0RUwraS9RRURTRVpwK0Ux?=
 =?utf-8?B?TlZ4d2FqdzZBbGQ3L2pJQ3ljQmZMZEd4bDU0VjlVSFgxMEZyc2tkNU9ZdUlx?=
 =?utf-8?B?U1BoNGJkWjVCdG1Wc2ZSKzYzS3JoczdwSVZTZTZFSjIydzJ6Q1dEYlVaVXpu?=
 =?utf-8?B?R3QzQTVHWVl1ZjByODdYOTlCWHpUcnhVbjZRN3hSUmxVZVdBUklkYjRLU3lJ?=
 =?utf-8?B?WC9LUUdSRnlTUDcwKzd0TzlFc0FyY01lNkNvcjNYUy91OGdoT3V4QWIveXR1?=
 =?utf-8?B?SUpXNEMzVVk2cXlmWnRtSVBVei84T2E0S0xudlBFck9QZkJyWnJuZElXRHo2?=
 =?utf-8?B?TGpVSjFrTkZUUkVEZFY5T1lBRFdabHRsd2cyTENSZjZxZ3Z1QUpuenZHSURh?=
 =?utf-8?B?dm42VzRXdXVNa2hrZEZsbTJBLzR2b2ladnRvTVAzaWExOTBFelVwR0pvWWo0?=
 =?utf-8?B?K3JSUE9hWVZzNlhLdDVYbW5IaVMzb2FXOW5FZVJqTjMvSU5LcWI0TlNUQ0h5?=
 =?utf-8?B?NlVJTEorUHQvUURWZVF3dnNkV1ExcUFlZ2NtOGlRdTRRblJ0ZzZwZnhpZXV0?=
 =?utf-8?B?YjZZSXBNS2d2bXpOVm44bVI0bnNSR2JwNlZuV3NMNmpwdVFCTW1IMnJiY0k4?=
 =?utf-8?B?SEMwQW85OEN5aVUrZk0vTVZZYzEwZWVzMmJId2lUMHhJc09ISVp2aVJJSFg3?=
 =?utf-8?B?MytKdHhyam5KbFdYYitpZHBUR0pIdThud2tmY3lkZjE1MlV3UTFUNG9iOTZT?=
 =?utf-8?B?VjZYMEpKNXV1YTdHaGM5cjdGZW1uY2JLUkVlVVluV1UwajhLOE1rT0JNbmZZ?=
 =?utf-8?B?Qlo0MEw4ejBEMnllMU9yUGVUY3JKcEVkbXZwYXY4TEMrTFdsWTBRdjMyZklU?=
 =?utf-8?B?NmRWa2JPRVJ3dlRuLzdtY1E1aXVnam1XcTZWS1N1cXI1bE1pTGNFeUZscEgz?=
 =?utf-8?B?eCtpWEo3elVYRndQcllIaUtOY01CWEtZR1JGcVB5Z0tHb0d4RkNpZ1N2WlZ5?=
 =?utf-8?B?dGlYak9zNUZiUERlTCtTZlZBZlhRenhLbWlOMzVHTlZjbVNPWU4xeTBUOTVT?=
 =?utf-8?B?bzZmelBDTjIwbDI5Q3NadElQSzRmZ3ljTjB6N1h3SisxVUhaN0tKa2ExYXZW?=
 =?utf-8?B?dUo1NDg4ZXlmeUQzbDFKR3RhV2hYQkhxTTNWSzU0S0plckw4b1pxdkxVTHAw?=
 =?utf-8?B?SGsyLzFNMGY3UXFPMXUvc0RpTDd5TTB6Ym8wazlpdCt6RjAva0RnUnhldlAx?=
 =?utf-8?B?dGk5RGdHc1ZpZldvWUpnYTRjaTZVc1BCMGM0akNqZXJVK2h6NWd5U1Y3OEgr?=
 =?utf-8?B?ZTZ0d0FlMnM3OGNDSVNDaW5NNTlYVi9tOHhNRER5allRekJoTFNBamZoSXpz?=
 =?utf-8?B?WnA2VE9hVFdMa0xuS0dGZVVWdzZKUXl1ZlZVZ1Uyc2VyVHdLUW1uRmp5SlFF?=
 =?utf-8?B?UGxDaStpSXJ6MkFCeEc4SW1BYnlEaStsTDhVd05OaTFybFhsM0d1cjg3dHEv?=
 =?utf-8?B?TUJXL0h3SVNMbHpoQi92NE02Syt0bDM1WHhhVEZiQTRHVnVqb1VES0tKNnpG?=
 =?utf-8?B?a2FDOC9XeVF6MWc5VHh2R25IaVpxWEt4MW9PZlY4MWRZNGxZczhIUExBRStn?=
 =?utf-8?B?OEFHOXpMMHl1KzF0V0tDVXFYbGJOeU9UNnBxU1JTdXFsdFcrWDdmTWx5c25V?=
 =?utf-8?B?cEUvNy9MS0JYZXdDRVJXZ0xaSDV6enVjUXFGTXpWS1RORFp6WWxMWGRPUUx0?=
 =?utf-8?B?QS80ZktiQU9IOGN5enJ5UlVIRnc3NXV2VnRXc002QmM5WnN5dW9QU3ZySm5F?=
 =?utf-8?B?dFdMK3lyQ0kvMFdsTWtXeWwrZzhmdUlZUFZjNUl1d3VtZCs5RTFnNjZtMXVp?=
 =?utf-8?B?MTVkamtmd1IwTTRUN3I3TzRCT0xWdjlOTzZONVo3UWpCWHYyMzQzbzdpeVV5?=
 =?utf-8?B?dmlqRWQvZmkybEVIbktLZ0lqYjBLbTIyaHVnYmpDVllPZkw3Vnl5aWtsNmNJ?=
 =?utf-8?Q?UQajpAJfu4xS/fUk=3D?=
X-Exchange-RoutingPolicyChecked: PIJB/bxZAFfjITPEhsk+PPSSWyiuQAuWd8g/FwWd+pyWG+g3sfaRKR74YY8cRPb/2NqUcTH3LI15oFJ6zJSOuf8bB7sCvX32DS7fDrjxIIuJgvv3drTIOfDiIzAXyn7gFXOd1qiUZDqpwHuiSpvQlcZ2lRsSaWfU21+eSC9NxB4531cTWMR2vOpWQ4x7SeIV69fBFC5+oShHzmee/XD3CBhrC3NYACFl6bfX2SZMMsx+s1qalZf2ehtmRAXNtZJWQSmwBTrPuA9TN8m8IJcv/2Cnm9zhnHYWWMg1vyRdYqBWGFrq1Jh4qd9FyTWA2QRuRPDlfLq3ZJLugBuMCgURZg==
X-MS-Exchange-CrossTenant-Network-Message-Id: c9824a1d-4673-4cb8-2257-08def84f8069
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 08:55:47.5061 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GTrhnECmQIg/5lxZpmBo+6bImm/3JRene8cvPyl5wk4CK0UQzZswOoOeRGSzKPTLYLbcnQFlIZ/NJ50ZLPVT27qqBwWHQ7Ryc3iPAbVr5Fc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7742
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



On 8/12/2026 8:55 AM, Tauro, Riana wrote:
> 
> On 04-08-2026 11:35, Mallesh, Koujalagi wrote:
>>
>> On 30-07-2026 08:51 pm, Michal Wajdeczko wrote:
>>> Update our super macro with new top level hardware components.
>>>
>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> LGTM,
>> Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>>> ---
>>> v2: follow enum xe_ras_component values (Aravind)
>>> ---
>>>   drivers/gpu/drm/xe/abi/xe_log_abi.h | 12 ++++++++++++
>>>   1 file changed, 12 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/xe/abi/xe_log_abi.h b/drivers/gpu/drm/xe/abi/xe_log_abi.h
>>> index 4861a5b58c10..b3373d4b29d5 100644
>>> --- a/drivers/gpu/drm/xe/abi/xe_log_abi.h
>>> +++ b/drivers/gpu/drm/xe/abi/xe_log_abi.h
>>> @@ -129,6 +129,10 @@ enum xe_log_location_bits {
>>>    *     @SIGID is the default xe_sigid for the component (without the XE_SIGID_ prefix)
>>>    */
>>>   #define DEFINE_XE_LOG_COMPONENTS(define) \
>>> +    DEFINE_XE_LOG_SOFTWARE_COMPONENTS(define) \
>>> +    DEFINE_XE_LOG_HARDWARE_COMPONENTS(define)
>>> +
>>> +#define DEFINE_XE_LOG_SOFTWARE_COMPONENTS(define) \
>>>       /* */                                    \
>>>       define(SYSTEM, 1, PCI, SW, "Linux PCI Subsystem")            \
>>>       define(SYSTEM, 2, DRM, SW, "DRM")                    \
>>> @@ -156,6 +160,14 @@ enum xe_log_location_bits {
>>>       define(DRIVER_FIRMWARE, 3, GSC, RUNTIME_FW, "GSC")            \
>>>       define(DRIVER_FIRMWARE, 16, PCODE, DEVICE_FW, "PCode")            \
>>>       define(DRIVER_FIRMWARE, 17, SYSCTRL, DEVICE_FW, "System Controller")    \
>>> +
>>> +#define DEFINE_XE_LOG_HARDWARE_COMPONENTS(define) \
>>> +    define(HARDWARE, 1, DEVMEM, DEVICE_MEMORY, "Device Memory")        \
> 
> DEVICE_MEMORY

do you mean s/DEVMEM/DEVICE_MEMORY ?

> 
>>> +    define(HARDWARE, 2, HWCORE, CORE_COMPUTE, "Core Compute")        \
> 
> Core_compute

and here s/HWCORE/CORE_COMPUTE ?

> 
>>> +    /*     HARDWARE, 3, RESERVED */                        \
>>> +    define(HARDWARE, 4, PCIE, PCIE, "PCIe Interface")            \
>>> +    define(HARDWARE, 5, FABRIC, FABRIC, "Fabric")                \
>>> +    define(HARDWARE, 6, SOC, SOC_INTERNAL, "SoC Internal")            \
> SOC_INTERNAL

and here s/SOC/SOC_INTERNAL ?

(btw, is there a plan for SOC_EXTERNAL ?
if no, why do we want to keep _INTERNAL suffix ?
> 
> Let's retain the names same as UAPI to avoid unnecessary confusion while collecting CPER logs.

but those listed here are our local component names
and just today there is 1:1 relation between those
HW components and HW SIGIDs, but maybe one day there
will be more components that would map into existing
SIGIDs (compare COMP_GUC/HUC --> SIGID_RUNTIME_FW)

the SIGID enum names are intact
	XE_SIGID_DEVICE_MEMORY
	XE_SIGID_SOC_INTERNAL
	..
and btw I'm not sure that we ever convert SIGID enum values
(202, 205) into any user facing friendly names

and the idea for having a shorter component names was that
we are doing dmesg decoration and print friendly component
and/or location name (except SIGID, which is a raw integer)

	[drm] ERROR SIGID=104 (-EPROTO) Tile0: GT0: GUC: blah
	[drm] ERROR SIGID=202 (123456789012) Tile0: DEVMEM: blah
	[drm] ERROR SIGID=205 (123456789012) Tile1: SOC: blah

having those lengthy names does not look nice:

	[drm] ERROR SIGID=202 (123456789012) Tile0: DEVICE_MEMORY: blah
	[drm] ERROR SIGID=205 (123456789012) Tile1: SOC_INTERNAL: blah

besides, in dmesg only "SIGID=%u" chunk is part of our contract

in CPER, all SIGID and component and location will be stored
as plain numbers and how those numbers will be decoded is beyond us

btw, maybe component decoration should be before location?

	[drm] ERROR SIGID=104 (-EPROTO) GUC: Tile0: GT0: blah
	[drm] ERROR SIGID=202 (123456789012) DEVICE_MEMORY: Tile1: blah
	[drm] ERROR SIGID=205 (123456789012) SOC_INTERNAL: Tile1: blah

(see patch 4/23)

> 
> These names were asked to be retained similar to actual hardware error classification even for uapi.
> 
> ++@Aravind
> 
> Thanks
> Riana
> 
> 
>>>       /* eod */
>>>     /**

