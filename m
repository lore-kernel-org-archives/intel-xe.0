Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F9A6C44515
	for <intel-xe@archiver.kernel.org>; Tue, 21 Jul 2026 01:01:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AC7B10E23F;
	Tue, 21 Jul 2026 01:01:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XoB10Y/b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A82710E23F
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Jul 2026 01:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784595669; x=1816131669;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cx4UqTSDymOsA6JTg9mZ5u7puQyEyZL6puKZqxrZ49Q=;
 b=XoB10Y/bxC5KRstWLO6U+u09BYa7z9U4mPOcpIpNiT9FMxfE0DJyCGz3
 ghXOsTPQAIQptCjDNQSzJ/EGyD86QDpJTeabPkNHECpuZVujpnHRtVa/p
 9UcII8aYBuZ9RbbyWmJd6kmKavipBsQnCAS9AvHWXv7he0qVWJga/vaVM
 cYyTQqzlfcjUV88FB34u8HnLUdJS643mEinwh0keZ3chzROs42IZUIg/j
 edF0csQCDBcTKFI7mAyXqygSaHM9RlNKA+q7LTYt1Qln0Rtmm5MZrRx1g
 DQDovAv2oySM16w1RMX82HPeiRtwYDtzAxMyvtiZ7SK3OwNAe0sVcDhvh Q==;
X-CSE-ConnectionGUID: GZkWO6DrS6yr2qMNeHeORg==
X-CSE-MsgGUID: LpPLDJfxRoKdPRvB57EnrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11852"; a="72722399"
X-IronPort-AV: E=Sophos;i="6.25,175,1779174000"; d="scan'208";a="72722399"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2026 18:01:08 -0700
X-CSE-ConnectionGUID: Z3WeowLxSdyfrW7eNcibVw==
X-CSE-MsgGUID: VbOrVRfcRHeNm7NJNS/8xQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,175,1779174000"; d="scan'208";a="253262068"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2026 18:01:08 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 20 Jul 2026 18:01:07 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 20 Jul 2026 18:01:07 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.6) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 20 Jul 2026 18:01:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yB/hLRKjOmVFBPaz78ZVahLI7dPWJaWqdTRq9bumtu3sxYr7GnVjdIgraEe+HZv0o0g4kdYwRNFpxbUiANmqCos2eep1SNcFM5vR8h1qPcbk59YyH2wh1SGFIJGLDzhH+LdFBfzApVAEMaHt6IgxX/yIjbT7njRo3EDkM35Qx5w3ZhB+DD0/L9p41Dcs+hJnQ8Tx7OC4f4nnlacDlZ0A4WjC0uVHhtDP7xnd+mtJ5mGQpAmRKYknleaVYoQP2f7ZKC9NjSvuX+BMVz/S9bgKcRVs1nxy3Gn1HwCb8W1JuE/VYUCzKt1s7NKfN0ryftVymTBJrDcR9MYFrCtpPoYHwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sW2nR/hRURG2oQAmFMI5xNmnkxnt/7S/nt6AqPnGR3A=;
 b=onnDjRgBqvKPwc8GqF4EWbJsLWJsEpkgQAarCfL46+cO5yFnqd3basDDtmfNZmfvbL4+UoEgnyZuNFwQKb1P8lJOT75ujSkgG0U8wh04jYReVbUelPVXfCVKP+8mxlfiFxKTqdhyqaA3UVBOl00+BNEHDlXHLhALGSoNP9FQUNLJrTgoijbaj8BxIEuMqsVeBvtgsv7KhsIiDTHSJyVKluqLauiUYJxyYA6wOY2o8pq8Jd/vdWjvqZV4pHc4gWygklvTzAZJoGIovg/feHOjCAEaVYF5xyLP+lMwWWuQEffHgucVUL2gDYdcGpTwDM2CTXEW3ZcrzY55vXfVPkPScA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by DS4PPF1C4B3BAB7.namprd11.prod.outlook.com (2603:10b6:f:fc02::f) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 01:01:02 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::f3ff:11d0:7a52:db0c]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::f3ff:11d0:7a52:db0c%4]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 01:01:02 +0000
Message-ID: <bec292a8-68c6-4ee4-9003-f92376722302@intel.com>
Date: Mon, 20 Jul 2026 18:01:00 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] drm/xe: Add debugfs for IA/GT bias
To: Michal Wajdeczko <michal.wajdeczko@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20260715235824.116991-1-vinay.belgaumkar@intel.com>
 <20260715235824.116991-3-vinay.belgaumkar@intel.com>
 <al3-Kf5iZD1dNR0w@intel.com> <57651a6c-1751-4697-85e2-018731e4deac@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <57651a6c-1751-4697-85e2-018731e4deac@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR03CA0019.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::24) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|DS4PPF1C4B3BAB7:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ba10e75-d5fa-4030-8461-08dee6c388be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|22082099003|18002099003|10067099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: jKRcx/iL48VuwZqPJPyJPg8DiKFv+QqElkQ054IzYJEtdgNQbK742RaSQZYADyCfpxZ7ShxF2sLiOuQwz38k9T01683a8928KxJNL6bIzQQfQYtOrcxhHe/WsQ9I8MDRvAuNZtD9WlPP6Zs+Cacm498BYvsrPeXLpo/v+hHqpIhK+9kdqYUpw/Ns6XAb3nsVOInPc3vDazJ5tuh5vIodDbM8HQJduy0Wb2SsbMCQq7zuMblQRRgA6Rl2VDMoEi1XNgY4pPXnrh5HU8kaHjriv9s1FZye5u7hnEorBXNIddeDMyBx/RHZwC0r0OqRJGIXdY0FEPe1CbdzkwkhHrnudU/nSiJp71RPU93yp4X3sFkc8pshxRqiYUOgPd2HOBZpKtJpjc2tHNYUiB8ryzSxyuIkqfpJmmd5MDvdvr0WMlb+wVRpqExBGg7zOq1ClrsQI5XbN9znJHkIFraJ99v02HJSdxT0U04aqp7Il9Wo7kFk3Vs5nrmvUS2X+XOdRuAOLXCM5AQsasEqgO6NfWh9CLM7IzEhbnTcdfKImGHOYMrHkibPGnBZOht/7NpvS3Jh9ActxY511SSS8q0nYP6pUvEECTbbnkTkqhE57z9adfYdQiHolb+H9XY4OnFgtjve1b/eiawCwB4qahheDEdDuykbbbdfCRAzQj5hYLoKg+E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(22082099003)(18002099003)(10067099003)(4143699003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M0FMVG5aZXZyTXBEMjQ3Z25aQVpNbGZBaVBmSXNhWjA4TURIb0RCSGJ3L2lV?=
 =?utf-8?B?aEdXTEc0Rlp0SG9lWnpDU29pRjBQTlZ0djhwSHkzNTdFeThFY1kzNDJha2ZK?=
 =?utf-8?B?Z285R2VGcjhESlJUdjdwRUt2bG13NG10Q0t1SFpIbEdRbjljaWJoMlVDdFVz?=
 =?utf-8?B?WHZyRlUxL0tWWmtsSXp2ZlJyUFVKd3VGeDB6QXljWWZNZkZKdE1pN2VrVUxl?=
 =?utf-8?B?L1RxTGFJK2J4ZW5EUXo3amtycGhpU1JyS0xObnQ2bkhOMnB4Y0szMDlOak1q?=
 =?utf-8?B?ZWZEM0RPUEdxOTg3WnNDbHBDUUwydGwvQnF2aHVGb0hqL3BZWENORHpmTTE0?=
 =?utf-8?B?ZXVDUEM2ZGJ1K2RNaGU3T2ZqdldVSlNCdW1RaVYwYVFxTkNlRzQ4OUpDZ01P?=
 =?utf-8?B?ZUI5Mm9icjhFbUtRWnpGc0RSNHhBQk96WklFWWNUZkY5bzhyUWticEJPbmRX?=
 =?utf-8?B?U01rV2JzS3lBUFZYT2ZzOUFCeEFGZDhPWHl2QkFuNjlYZlVkbEpiOHBQUjds?=
 =?utf-8?B?KzJGWHVSbGRoTithaWdxUDhXNWN4WTlYejZVVTlrT3JldE40V1JGUVA4bndB?=
 =?utf-8?B?NFJXY3J4Nng5cC9LeHZ3TFpQNnkvMUhxamVVcTRkOXZMQVdaMVA4Rnh0cTNT?=
 =?utf-8?B?M0dEcGd1OGZNMlVKNnkvTzRJNjZESzFNbnNaMWYwMTJTRnUyRGM2QUhVUi9j?=
 =?utf-8?B?NTlnZEpraXlGWkhITThxcHYwRE9zVUxlZUduQmNSVm0wWlA0MHFGU0lIRGM4?=
 =?utf-8?B?VGxmSDVZTmorTFhSQnRuVjhxazFHNXptMGVvemEzeXdvbFNVaUJPRVdKSUkr?=
 =?utf-8?B?TTBobEJtaHZTRSt2VHJEd2h1SUNacm10aGpZYkEzbGpYOW8zTGhVcmxTYUk0?=
 =?utf-8?B?NWFkSE54aS9OT1BXbFVoOW1pWkFpYm9jVUpMWXY4Zm1rNTNQUmFjaTkvU0hO?=
 =?utf-8?B?UWcrR1U3SmRFTFE0bExLYUM5NEIrOW5Ddlh5VjV0Z3NPUGFXckh0OG52YWdX?=
 =?utf-8?B?WStPaTA2VEwzTFBWcFFhNG44aUcyL2xQT0NpenAwQjRhS1BXNmt6ajQzcU5m?=
 =?utf-8?B?Mm9CV2JhTDVlMEJTSVpkNVFvZmJRQTJsUUVDSk1zRHBYRGx2OXV3ajl0SHo0?=
 =?utf-8?B?VktZZmtHSDVLWmxhVzVFK1BvTWlUbmN1RGNUNlZheHhtUW80UUhyV0pDY1ZI?=
 =?utf-8?B?b1V5ZWhTL05OcUc1WE5QekVJdUs3dUZkbUE0Sk9OKzg1cWI2dVNHbE1KdEo3?=
 =?utf-8?B?YWhkN3ZQUTZsWFQvQkIzbHJVcVZYREV4QW40dnhXN1RVWEdCd0RxaERXRWt3?=
 =?utf-8?B?aG9CQkpHMTNmc05wbkxBMmd0WStVNml0dGZ0bWtCWFlYR0JGRjNVNnRPSEJJ?=
 =?utf-8?B?YkZwb01yUUpPM0VPb0JVM00xdTlZUlpvYzB3b2p0dTk0NXlqQ1N3Q2xqSHVh?=
 =?utf-8?B?M3U3M2RxdjBZZCtCMGl1MURvc25OUnRucHhxNDN3K2F5Y2RQVThGcFlJaUxU?=
 =?utf-8?B?amhGUnpoTDZ1UitIcEhRNFgvVkdwNzVCdTYxTGNVazA2T3gxalNtNWNoNzc2?=
 =?utf-8?B?eFBEZE44UmhaTTN1WlZXZ2ZLczlCaEk4OUhFRXNKQ0FSdzFyd1ZtZkU3eU9Q?=
 =?utf-8?B?TVN3aXNPUm5ZSTdsMWppRlRaTXJKVjZZS3RiaEhScmFjUVBURW5ZbktlR0hB?=
 =?utf-8?B?QitvVE94Q2IwYW5ib21mSERFeDVPYUdmQi9YZitBR1V2VmJwVGsvcmdlVVZE?=
 =?utf-8?B?QlFrK1VsOGFNUnUySFdnMytramFFdUNOd1hrc3RwVEVpUFZFRDBLVGFTbHhH?=
 =?utf-8?B?K0VXWS9ZMFI4bjdVbjhDWHU2OXRNVFVIb2ZCK0dNVDZYWnJZcGxYaVY0T1A3?=
 =?utf-8?B?S3NESlFhc3o0ZVA1a3V0bjRUS0hYYWNFWk1BS2UzTHpNbHFIVTRsUDNKRm9y?=
 =?utf-8?B?QkRJb3VyMHNHSkJWaUJEYm9DU1l3ZmFFbVlpZGVWY1RGWUxlWFhQc2JMQUJQ?=
 =?utf-8?B?VjJYMEdlbW1aN2l4WCsyb3BpUENNVnRyR2NyQnEybVN6RGgvNjJXaWNQVHBR?=
 =?utf-8?B?bzlaWS8xUitTM1hLSDYxYnNhM2oxOTdvNitDWEk3NzZIRGVNWXNJV2hlY0M4?=
 =?utf-8?B?bGFvNWtqUERqS0w2MmVzSUd0NFpQTngzd2dxeFZlZGg0NW0wMnFnOVNYd1Nu?=
 =?utf-8?B?V09uQmR5eFFrQlZtTEpKaHpOVUlZMUlXR0o1MnFuZHpsVWJvVjlDbE1FbUJ0?=
 =?utf-8?B?YnFDK1ZKc2pHME4yemplbW1NUEJWbjVaUmF4SHJlcGdTdUZxa0ZWcGg1QUUv?=
 =?utf-8?B?RUd3dVBXbVRFYmErMXg0NlBNUVdsZVVFV0VSc1FLUWNDbmNlQWtIU2VlVzNw?=
 =?utf-8?Q?BBLfufkeCRCBA+LI=3D?=
X-Exchange-RoutingPolicyChecked: IcgvjTen2uMW9H8z0/q+qYUiElwvB5Y9PPHe8Xs0pffJNFKghigkGzgN7ZLason6xh/vE02IgwWOuAI/FHkGwnR2ObeirGeE5haijwoX4WhL6ykFJZdcMFDEAXz1BghEhdcr3HIWw1OVJWY+z5x2u727454lAFKBxv4CbKGWR2ZHR9hEV+UwgOfg3eAy6wYzW+dRU2Q+uFweyFl0WSW/v2WRHzYg25ONnUKsGrcB9iDn+caN2XGw/45VFT62AXy4SYQiPaBlKL9ZVVrvZeMZ9ho8fqgw4cgMscJOSe3y4MWo19eOnuOi36gsKfL9JMGNx3IzWh+Hov4f/LILj3TEqw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ba10e75-d5fa-4030-8461-08dee6c388be
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 01:01:02.2509 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N2ANqZ3i/wnoDIW7LrLw8icg8bt8gmjZkIZb/cUOZHorJcm0HltafmYzoiiQfP/ozEH7D5t8Rp6QddFK8tWZIu2XdYcULbQ8s3wSYLU5ruk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF1C4B3BAB7
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


On 7/20/2026 9:21 AM, Michal Wajdeczko wrote:
>
> On 7/20/2026 12:53 PM, Rodrigo Vivi wrote:
>> On Wed, Jul 15, 2026 at 04:58:24PM -0700, Vinay Belgaumkar wrote:
>>> GT_IA_PERF_BIAS_REG indicates power budget between IA and GT.
>>> Lower 16 bits correspond to IA and upper to GT. Higher value
>>> indicates more bias towards that plane. The values are in U1.15
>>> format.
>>>
>>> $ cat /sys/kernel/debug/dri/0/gt0/ia_gt_bias
>>> 0x80004000 (GT: 1.000, IA: 0.500)
>>>
>>> This interface will allow us to observe power budget changes while
>>> running workloads and also, if needed, tune it.
>>>
>>> v3: Add a helper function for U1.15 decode (Michal)
>>> v4: Validate input values (Rodrigo)
>>>
> as you are adding new reg, can you please add Bspec: reference here?
sure.
>
>>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/regs/xe_gt_regs.h |  4 ++
>>>   drivers/gpu/drm/xe/xe_gt_debugfs.c   | 83 +++++++++++++++++++++++++++-
>>>   2 files changed, 86 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>> index 08251c7a1a4b..4f1404c6c209 100644
>>> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>> @@ -634,6 +634,10 @@
>>>   #define GT_GFX_RC6_LOCKED			XE_REG(0x138104)
>>>   #define GT_GFX_RC6				XE_REG(0x138108)
>>>   
>>> +#define GT_IA_PERF_BIAS_REG			XE_REG(0x138158)
>>> +#define   GT_BIAS				REG_GENMASK(31, 16)
>>> +#define   IA_BIAS				REG_GENMASK(15, 0)
>>> +
>>>   #define GT0_PERF_LIMIT_REASONS			XE_REG(0x1381a8)
>>>   /* Common performance limit reason bits - available on all platforms */
>>>   #define   GT0_PERF_LIMIT_REASONS_MASK		0xde3
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
>>> index c38bcacb27e4..407393a90909 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
>>> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
>>> @@ -10,6 +10,7 @@
>>>   #include <drm/drm_debugfs.h>
>>>   #include <drm/drm_managed.h>
>>>   
>>> +#include "regs/xe_gt_regs.h"
>>>   #include "xe_device.h"
>>>   #include "xe_force_wake.h"
>>>   #include "xe_gt.h"
>>> @@ -22,6 +23,7 @@
>>>   #include "xe_guc_hwconfig.h"
>>>   #include "xe_hw_engine.h"
>>>   #include "xe_lrc.h"
>>> +#include "xe_mmio.h"
>>>   #include "xe_mocs.h"
>>>   #include "xe_pat.h"
>>>   #include "xe_pm.h"
>>> @@ -336,6 +338,83 @@ static int force_reset_sync_show(struct seq_file *s, void *unused)
>>>   }
>>>   DEFINE_SHOW_STORE_ATTRIBUTE(force_reset_sync);
>>>   
>>> +#define U1_15_MAX		0x8000
> this looks more like U1_15_ONE, as U1_15_MAX would be 0xFFFF (~ 1.999969)
ok.
>
>>> +#define U1_15_INT_BIT		REG_BIT(15)
>>> +#define U1_15_FRACTION_BITS	REG_GENMASK(14, 0)
> as these are regular U1.15 definitions, no need to use REG variants
ok.
>
> #define U1_15_INT_BITS		GENMASK(15, 15)
> #define U1_15_FRAC_BITS		GENMASK(14, 0)
>
>>> +
>>> +static void decode_u1_15(u16 num, u16 *whole, u32 *frac)
>>> +{
>>> +	u16 frac_bits;
>>> +
>>> +	/*
>>> +	 * In U1.15 format, uppermost bit is integer value and the
>>> +	 * rest 15 are the fraction. We calculate up to 3 decimal places.
>>> +	 */
>>> +
>>> +	*whole = num & U1_15_INT_BIT ? 1 : 0;
> 	*i = FIELD_GET(U1_15_INT_BITS, value);
>
>>> +	frac_bits = REG_FIELD_GET(U1_15_FRACTION_BITS, num);
>>> +	*frac = ((u32)frac_bits * 1000) / U1_15_MAX;
> this wrap to 000 resolution doesn't look like a pure U1.15 concept
>
> maybe introduce a separate helper:
>
> 	u1_15_decode_decimal(u16 value, u16 *i, u16 *frac, int digits)
> 	{
> 		u1_15_decode(value, i, frac);
> 		*frac = (*frac * 10 ^ digits) / (FIELD_MAX(U1_15_FRAC_BITS) + 1);
> 	}
will do.
>>> +}
>>> +
>>> +static int ia_gt_bias_show(struct seq_file *s, void *unused)
>>> +{
>>> +	struct xe_gt *gt = s->private;
>>> +	struct xe_device *xe = gt_to_xe(gt);
>>> +	u32 val;
>>> +	u32 ia_frac, gt_frac;
>>> +	u16 ia_raw, gt_raw;
>>> +	u16 ia_int, gt_int;
>>> +
>>> +	guard(xe_pm_runtime)(xe);
>>> +	val = xe_mmio_read32(&gt->mmio, GT_IA_PERF_BIAS_REG);
>>> +
>>> +	ia_raw = REG_FIELD_GET(IA_BIAS, val);
>>> +	gt_raw = REG_FIELD_GET(GT_BIAS, val);
>>> +
>>> +	decode_u1_15(ia_raw, &ia_int, &ia_frac);
>>> +	decode_u1_15(gt_raw, &gt_int, &gt_frac);
>>> +
>>> +	seq_printf(s, "0x%x (GT: %u.%03u, IA: %u.%03u)\n",
>>> +		   val, gt_int, gt_frac, ia_int, ia_frac);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static bool is_valid_u1_15(u32 val)
>> this function name seems to be misleading since it validates
>> the entire u32...
>>
>>> +{
>>> +	/* Validate both IA and GT values */
>>> +	if (REG_FIELD_GET(IA_BIAS, val) <= U1_15_MAX &&
>>> +	    REG_FIELD_GET(GT_BIAS, val) <= U1_15_MAX)
>>> +		return true;
>>> +	else
>>> +		return false;
>> just
>>
>> return (REG_FIELD_GET(IA_BIAS, val) <= U1_15_MAX &&
>>         REG_FIELD_GET(GT_BIAS, val) <= U1_15_MAX);
>>
>> or perhaps just use this directly in the function below...
> and maybe as:
>
> 	if (REG_FIELD_GET(IA_BIAS, val) > U1_15_ONE)
> 		return -EINVAL;
> 	if (REG_FIELD_GET(GT_BIAS, val) > U1_15_ONE)
> 		return -EINVAL;
ok.
>
>>> +}
>>> +
>>> +static ssize_t ia_gt_bias_write(struct file *file,
>>> +				const char __user *userbuf,
>>> +				size_t count, loff_t *ppos)
>>> +{
>>> +	struct seq_file *s = file->private_data;
>>> +	struct xe_gt *gt = s->private;
>>> +	struct xe_device *xe = gt_to_xe(gt);
>>> +	u32 val;
>>> +	int ret;
>>> +
>>> +	ret = kstrtou32_from_user(userbuf, count, 0, &val);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	if (!is_valid_u1_15(val))
>>> +		return -EINVAL;
>>> +
>>> +	guard(xe_pm_runtime)(xe);
>>> +	xe_mmio_write32(&gt->mmio, GT_IA_PERF_BIAS_REG, val);
>>> +
>>> +	return count;
>>> +}
>>> +
>>> +DEFINE_SHOW_STORE_ATTRIBUTE(ia_gt_bias);
>>> +
>>>   void xe_gt_debugfs_register(struct xe_gt *gt)
>>>   {
>>>   	struct xe_device *xe = gt_to_xe(gt);
>>> @@ -368,7 +447,6 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
>>>   	debugfs_create_file("stats", 0600, root, gt, &stats_fops);
>>>   	debugfs_create_file("force_reset", 0600, root, gt, &force_reset_fops);
>>>   	debugfs_create_file("force_reset_sync", 0600, root, gt, &force_reset_sync_fops);
>>> -
> unrelated

will remove.

Thanks,

Vinay.

>
>>>   	drm_debugfs_create_files(vf_safe_debugfs_list,
>>>   				 ARRAY_SIZE(vf_safe_debugfs_list),
>>>   				 root, minor);
>>> @@ -378,6 +456,9 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
>>>   					 ARRAY_SIZE(pf_only_debugfs_list),
>>>   					 root, minor);
>>>   
>>> +	if (xe_gt_is_main_type(gt) && !IS_DGFX(xe) && !IS_SRIOV_VF(xe))
>>> +		debugfs_create_file("ia_gt_bias", 0600, root, gt, &ia_gt_bias_fops);
>>> +
>>>   	xe_uc_debugfs_register(&gt->uc, root);
>>>   
>>>   	if (IS_SRIOV_PF(xe))
>>> -- 
>>> 2.38.1
>>>
