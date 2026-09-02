Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25F3DC61DD6
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 12:56:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C76B410F1A1;
	Wed,  2 Sep 2026 12:56:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jhmq1zYt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8F4810F1A1
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Sep 2026 12:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788353808; x=1819889808;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KbPwSAOCAexCHoKEo+H5h9qb7gA6u6EiJs4eycVi+BU=;
 b=jhmq1zYt2CziodXch+LEJJwv4+lSkIAJVPDjIrJP1F1Dp7voophACBNY
 gOJWibOeOj5tijReUKfYDjfK4I67Pvrhn9We0SCvts4KDxma6kiCH3WFh
 T1+nw86UM3oeMMgilLbGBkD6QVhLNBZVCEABtmBcAkBVtBBzl38O4NFWW
 vHDnXdaQ7QevqhU73YFAX16Meg7+KoLMgLnbIvryRonMYYQBmVoFYqOHM
 Axvjjdkxk71ElHZ3hUExqv92HqSUlovUsdQ3ywEl98s8iPwVr6PlhLFK4
 06wG1U21ZIlEnluXT9VUCk59WIB3B2wPcS5NCNEJECJEy0JwaBf4y692x w==;
X-CSE-ConnectionGUID: svntDLwpSv2qe76OV05S2w==
X-CSE-MsgGUID: SttsaW4zSkOu+tFv+tZ8TQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="111578910"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="111578910"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 05:56:48 -0700
X-CSE-ConnectionGUID: UKW7uWCWS9yLqzVeGGeoqQ==
X-CSE-MsgGUID: nDIgqLx7SA6sHuL8JHr5Hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="265703453"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 05:56:47 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 05:56:46 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 2 Sep 2026 05:56:46 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.58)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 05:56:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=et3EKWv7PcaUt7UNRp5HGdrC+bNFrLVRk63XY6bNnhN7NQrvsbmf/LdGj4wjTJaG+c/beoqO+sTnrDK7KFtIIQQ9BdbSaF8E8u+Fs4qZKjxdVYJr4eKePCTO4rX64TS5cvKvuRCZjZA3bsFlaroHpuK2mvG8Ujn4wIaMBjBkj081K2ucDGdL9gW2ppeLrHwIouKWqYJFbzXuBvv6AWQCm9AyHkAZFs4om0Zn3qs9//FVTTZHnx+0YgPp/MB3cxt/9tzZ/XH4fwLmpqpJfrdYXSkooV7At3be5aSrxEKBmN2QEf8xQTkC1tgBkyGd2PoAw57x6QOFDYr6lctgkVr5Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PzVjbC2AaJOftswOk8p22st9KyJS1ddwiSfw1yhEEds=;
 b=hCWE/39pEl1mXCc/D3yiVxYIyfo6eZ3BboqsOBaON5BhPkISy740QRgDk3XcU0UVY4Hvnt+oVv70Kfxl0FAUChDhRsE0EneNc33/rT4/OUdPWTmPIn34Cy+RS9ggj5/1HsIx2vWkwns1WmzjXpydvL3QGXqykQWS2AwRUm8WaEx/32MchpP9WMN6guqswF84+mN6npZbZTHzZo/GlMeTq9UCGQptHQfctYJN8G9x3736jZkxc30MeY9+KvrjfCBEnBba5RQAZjlLTcewLHZQZlKua5h2QbcG1EmgyD836KRC3rEcmOn8FHqCK6XQi587Ulo+I64EcKnkajTVSEtGLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7551.namprd11.prod.outlook.com (2603:10b6:510:27c::12)
 by DS0PR11MB7972.namprd11.prod.outlook.com (2603:10b6:8:124::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 12:56:43 +0000
Received: from PH7PR11MB7551.namprd11.prod.outlook.com
 ([fe80::5cbf:6b33:5f0c:88a0]) by PH7PR11MB7551.namprd11.prod.outlook.com
 ([fe80::5cbf:6b33:5f0c:88a0%4]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 12:56:42 +0000
Message-ID: <50f9e238-660e-4b40-b2a4-b15fd9bc4a26@intel.com>
Date: Wed, 2 Sep 2026 14:56:37 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] drm/xe/guc: Use different error codes for GuC load
 errors
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <daniele.ceraolospurio@intel.com>, <aravind.iddamsetty@intel.com>,
 <mallesh.koujalagi@intel.com>, <alan.previn.teres.alexis@intel.com>,
 <julia.filipchuk@intel.com>
References: <20260901211204.131972-7-umesh.nerlige.ramappa@intel.com>
 <20260901211204.131972-8-umesh.nerlige.ramappa@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260901211204.131972-8-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0390.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f7::15) To PH7PR11MB7551.namprd11.prod.outlook.com
 (2603:10b6:510:27c::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7551:EE_|DS0PR11MB7972:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b569e53-38f9-470c-9e6e-08df08f1a311
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|4143699003|10067099003|11063799006|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: ds2J7gz/zws8LLeu/OwCEIbw5TqU7eQi/Xj3OjyO9lyg20+QEof7u3H6on9hjEBmwodWQu6Ai9VLSEFG5O9Z0TdLvCwUwxUOdTeybCyl3E8coj0ONhZXAnlGW1p33zIWb7yaXYn07v1NbKvnnxzQYZBGyMIMXzaKIAogyvvzuTdcSWa3LfRsBQV4tLMV7pXeG48pOo/hrvUzaeD4XU4cp2NATMi+r+stf0gBVECJTCK9YLD0uGZdFnTvF+IKmELfjNAUv9kwxnz6RSgsFo0CyUd2wiWmxAnDbCTApRUe0R1w9Q2s/fBlI+Fbne1BENSIOAGPoC5Ov7g5e84y7sx98PE85virAG0cD44gNCoK4tM7lzLIuHsQ0C+R/rM0H+XyewgzFVjmVHzC5VyPn9/zWqIYjEUzPiDBf3ADXol5KIw6QHXPjsG+bQXSlXDh9tw3d2qhihmSzuQRLjXKql3BWjoL5W6t/Wev2wj0At7xuwJBZXSvfjOoTSoXAQEE9snhuncyOfmeBu85jx3cv5CvcGi8wXrbO6C4RzQ51M7s2jxk8pLZHJnWecAUCh1RNoohwrhDFV1k4BgPUcjlQGDoCNsTiawDoJbY0Pau1hvbu9WcInD8RvpygTXaj8fYm3yIXbR3IvqytiMbdqtvVCGdr67PcZ8AMb38v/n511419BA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7551.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(4143699003)(10067099003)(11063799006)(18002099003)(22082099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ck9xMko5UGs4b3A4Q0RjSjFzU0VFYkR4S2VFMU9UV29oZUtXK1pIOFpMRm1l?=
 =?utf-8?B?OHdqQUpnV0UzMXo4UDg2aTBlbjFXY3NqTFMrNnFoRXJZTzJaTSszUDNQdmhI?=
 =?utf-8?B?bHBTNkE5RmJpYzJRZ0phVjJhTUJDS1h4akE1YmhDbVJxZStsaDk4MmM0LzJS?=
 =?utf-8?B?eGNzOVFBa3F0NWtNeDlZbTZoYStzSHg1MEg3MzBpc3hMS1lwMFhOVVJXUFU1?=
 =?utf-8?B?MGwvMnpJWFQyYUJETXQrTjdlVnpDcXorZG5FQmdLSlZsSDVjbGNtNStkTzQv?=
 =?utf-8?B?enJQT1YwZyt6Z3hqZk9jZ3EySHBScGJMOHc1V3NYeTVPOGY1R3VYdnNuYUtC?=
 =?utf-8?B?WTRUZXVmVmxoNmxtMnZBZGJkTDVHOVVvUlFvd1BGNjN0Yk9BRjhwQWJsb3VU?=
 =?utf-8?B?MjNaUWM2amt4RlQ2T3ZXOXZKUFhXL2xISmFhcW05NWRGRGRvYlV6Z1NQazVJ?=
 =?utf-8?B?KzFlcUxqU0VhbEhNWEV0Yk9ucWRtOWQwOW53d0NHbm12RXpnTW9sSm9ZTDBr?=
 =?utf-8?B?NFBkemRqQUFNVFF1bG96QWJuME15dEIzN090WlpWNlBweGo3LzRlOHQ1UUVL?=
 =?utf-8?B?ZGhOWVBweFZZSW5TTHNBOTRkTWpIY2tyc0lsRzN6ak1Cb2lGNGx2UENMRXEw?=
 =?utf-8?B?UUlBeU9Kd3VUT2pMQmhPeTF3WGVGYVVzVXU1YjEvYTl4eHc2bGZhVkNxK1g4?=
 =?utf-8?B?cDRFWHkzZGxaMlR0V1ZNRnREakh2aFpkMVcybVFQa2tHdVpoVnB5ODdwUlRS?=
 =?utf-8?B?bTFGMTA3a3N3VTZYMGdlN0IwOHFHVmdZTGU2Yk4vbnBDREE0QkNNMEkrVDVY?=
 =?utf-8?B?cjJCb083eGU5a3VVNkE1cmd4VlBLM3dibENIdlRFZFNBS24wdEVyMXpVQWhL?=
 =?utf-8?B?R1pYaFkyUVhCRERudTFlWWhadklLQ0FkQlVWOVRpOUlzMHU3RGFTaTNoWTha?=
 =?utf-8?B?VlJ5Z3UyblB5bUZzaWtZSkJuOHZ4aWhJbzZkbmlwWlJnNnRpNDlUdG9KcjE3?=
 =?utf-8?B?dGZlTHJYeUx5dm16cjVZeEMzZWRBMUR0TjhDcW1XMW9KOGNWUjdlWU85ZmUz?=
 =?utf-8?B?TFlSWmVKM0pSQ0VnVWFSdTZxbE9HbTZkS2pocmJMTlBUTmtFd3liNjE3b2VL?=
 =?utf-8?B?RnFGNVE3SmdDQUdqSWt0YmNpeXNtdm9qVGttWTcvdnFUT21XZXdwZ05saU10?=
 =?utf-8?B?bE1RZmwrOXR2eDBZbk41V0tNbE94NlB3YkJBNFd3QmRtcEpFcnVmQjdwMnRH?=
 =?utf-8?B?Y296c280NlJGZndyRlE3amFuTUZJVDRoZ1AzSWsvTWxtQVIwcWpDaVoyd3pv?=
 =?utf-8?B?N3AxcmNlZlJROENYbjJPdTlYc2Y4NFVnUS9RVEVsKzRGcStTL1ZzYmdHa3A3?=
 =?utf-8?B?S3cvVnJnZjhVL1p5S2lnNFc5RS9yQnJvcllWelMyYWtVeVJwb3N3bGp3eThl?=
 =?utf-8?B?N3poY002cGtVU2poSTh2WXR2WVlaUzlVSWx5WVNQRjZOYkhKQXRiRHZhUVI4?=
 =?utf-8?B?THdiSERUeHVrM3Nwcnp1cDd2TzJyaEJnWVpQRXVSNEZJUWk1NW9XalNiQ21D?=
 =?utf-8?B?eWdBL1NrNzdBWERLVXg4UHozV3gyTkJ1RUFtclJtNjArMEJuRE9RNVZJeDZG?=
 =?utf-8?B?UVhhbnNESUNxZGhLQ3dQdGU2a1FSaWkyeEQwRHZSenlieEZhMVlyZFQwL1lh?=
 =?utf-8?B?ZzdBWEFydEN4MC90RVc2SGU0Q1Q1cGNyWlQ4bENjb21acFptYndheHlSWE9m?=
 =?utf-8?B?amZabXQwUkNETWpDYVhuOWRQU21XOXR3MUovWThtVDViYmswWi96RkE2ejk5?=
 =?utf-8?B?OHE0SFd0NGpIelZBSUFwVDAzUXl0cUYySkwza2F6MFRMbm5FRWRQTkFKSThu?=
 =?utf-8?B?WWVnV1U5OTNxWkg4bkFCbkdOeU91c0loRFowWjV5bjR0OHVtVW9sUDMzUmxk?=
 =?utf-8?B?aDV3bFpoajZtRkl1ZXhvN0tVQVFzMm9yRzROS2hyUUk3cGdqUHFXNWpjOUxJ?=
 =?utf-8?B?MDR3d0dzNCtuWmFFMDVlZkg5L0tFWStDaDJsNnVPcjN3UEsreE16cVA0dVJm?=
 =?utf-8?B?ZmxBY1REOUhqRWZSbTBEd3VLb1RrMmI4cWt0Y1BZNHRaYWcvbGc4WVJwM01B?=
 =?utf-8?B?ejdKRUJFSW05OUZJRzJiWEFmNzVCV2hsVTZscnllRW9LNDNFZlFxcnhXcmkz?=
 =?utf-8?B?S1NNRFdtNk5wOEcwWk9VVUp5dVdPZWF0WFIxSjZQQ2hySlozdXB2RDBLWEo5?=
 =?utf-8?B?UG91bVZpY0pUaHRUZ1NmRFYxQzByQkRJMVVNRXMrdmtYSnRZWGV6VjhqNzlF?=
 =?utf-8?B?UitVVWQwZXpIL0hPaUJFWWtlT1BqOXU1NndCRmtENmNmWmZnQk1hM2hTWkRE?=
 =?utf-8?Q?Wxum1rgMPuNKGLrI=3D?=
X-Exchange-RoutingPolicyChecked: YB5YmBIS+wbTz4S+2IdAb0T2IzhyNmni4pThJ1Sp4w+yKRg4sFbnNVlk6sbTuBJbIQZBnuAjhtWahuPKqLRK+962b8V9lPbKNi5txCdfraSpXxbMJywk28/oSNjerVcIghegKxAEUvnxsWIpE1b6+jkNK92aW2VC9vYHFdDmsSnhAADuJe1zKgLP0qXQc33q+6pVqPFalaU3gg+Vrr6GzTd1B8qIuwR9yAvcLQXj1WQylT3NJAu5VDqv0+98J+wgJ1/aI+lJFKNrzid/ibW3Q4wZ3IxPY3kEUANCCxYQhpGpajVgZDBrRhrZSF0BxMm9a4JrPpXKAaB+84QNdL9otw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b569e53-38f9-470c-9e6e-08df08f1a311
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7551.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 12:56:42.7629 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BfkPx1LVGlOYwea2CYgwMKFNoy7VcEs2rBDoNxndlEoSqKIJduzkMYAuTXXOF6kHk8k5/n0Aziq607vMjjOcbfQnnJADVwVo6CA5JT2i6aM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7972
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



On 9/1/2026 11:12 PM, Umesh Nerlige Ramappa wrote:
> From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> 
> Instead of always returning -EPROTO no matter what goes wrong, use
> different error codes based on the error type.
> 
> v2: split to its own patch
> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc.c | 22 ++++++++++++----------
>  1 file changed, 12 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index c7f8bbd4cb92..5285d4cecbc8 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -1144,8 +1144,8 @@ static void print_load_status_err(struct xe_gt *gt, u32 status)
>   * Check GUC_STATUS looking for known terminal states (either completion or
>   * failure) of either the microkernel status field or the boot ROM status field.
>   *
> - * Returns 1 for successful completion, -1 for failure and 0 for any
> - * intermediate state.
> + * Returns 0 for successful completion, -EBUSY for any intermediate state and
> + * other errno values for failure cases.
>   */
>  static int guc_load_done(struct xe_gt *gt, u32 *status, u32 *tries)
>  {
> @@ -1157,20 +1157,22 @@ static int guc_load_done(struct xe_gt *gt, u32 *status, u32 *tries)
>  
>  	switch (ukernel) {
>  	case XE_GUC_LOAD_STATUS_READY:
> -		return 1;
> +		return 0;
>  	case XE_GUC_LOAD_STATUS_ERROR_DEVID_BUILD_MISMATCH:
>  	case XE_GUC_LOAD_STATUS_GUC_PREPROD_BUILD_MISMATCH:
>  	case XE_GUC_LOAD_STATUS_ERROR_DEVID_INVALID_GUCTYPE:
>  	case XE_GUC_LOAD_STATUS_HWCONFIG_ERROR:
>  	case XE_GUC_LOAD_STATUS_BOOTROM_VERSION_MISMATCH:
> +		return -ENOEXEC;
>  	case XE_GUC_LOAD_STATUS_DPC_ERROR:
>  	case XE_GUC_LOAD_STATUS_EXCEPTION:
> +		return -EIO;
>  	case XE_GUC_LOAD_STATUS_INIT_DATA_INVALID:
>  	case XE_GUC_LOAD_STATUS_MPU_DATA_INVALID:
>  	case XE_GUC_LOAD_STATUS_INIT_MMIO_SAVE_RESTORE_INVALID:
>  	case XE_GUC_LOAD_STATUS_KLV_WORKAROUND_INIT_ERROR:
>  	case XE_GUC_LOAD_STATUS_INVALID_FTR_FLAG:
> -		return -1;
> +		return -EINVAL;
>  	}
>  
>  	switch (bootrom) {
> @@ -1184,7 +1186,7 @@ static int guc_load_done(struct xe_gt *gt, u32 *status, u32 *tries)
>  	case XE_BOOTROM_STATUS_MPUMAP_INCORRECT:
>  	case XE_BOOTROM_STATUS_EXCEPTION:
>  	case XE_BOOTROM_STATUS_PROD_KEY_CHECK_FAILURE:
> -		return -1;
> +		return -ENOEXEC;
>  	}
>  
>  	if (++*tries >= 100) {
> @@ -1197,7 +1199,7 @@ static int guc_load_done(struct xe_gt *gt, u32 *status, u32 *tries)
>  			  *status, ukernel, bootrom);
>  	}
>  
> -	return 0;
> +	return -EBUSY;
>  }
>  
>  static int guc_wait_ucode(struct xe_guc *guc)
> @@ -1213,21 +1215,21 @@ static int guc_wait_ucode(struct xe_guc *guc)
>  	before_freq = xe_guc_pc_get_act_freq(guc_pc);
>  	before = ktime_get();
>  
> -	ret = poll_timeout_us(load_result = guc_load_done(gt, &status, &tries), load_result,
> -			      10 * USEC_PER_MSEC,
> +	ret = poll_timeout_us(load_result = guc_load_done(gt, &status, &tries),
> +			      load_result != -EBUSY, 10 * USEC_PER_MSEC,
>  			      GUC_LOAD_TIMEOUT_SEC * USEC_PER_SEC, false);
>  
>  	delta_ms = ktime_to_ms(ktime_sub(ktime_get(), before));
>  	act_freq = xe_guc_pc_get_act_freq(guc_pc);
>  	cur_freq = xe_guc_pc_get_cur_freq_fw(guc_pc);
>  
> -	if (ret || load_result <= 0) {
> +	if (ret || load_result) {
>  		xe_gt_err(gt, "load failed: status = 0x%08X, time = %lldms, freq = %dMHz (req %dMHz)\n",
>  			  status, delta_ms, xe_guc_pc_get_act_freq(guc_pc),
>  			  xe_guc_pc_get_cur_freq_fw(guc_pc));
>  		print_load_status_err(gt, status);
>  
> -		return -EPROTO;
> +		return ret ?: load_result;
>  	}
>  
>  	if (delta_ms > GUC_LOAD_TIME_WARN_MSEC) {

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

