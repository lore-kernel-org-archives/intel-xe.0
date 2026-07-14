Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24E32C43458
	for <intel-xe@archiver.kernel.org>; Tue, 14 Jul 2026 08:25:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE98410E032;
	Tue, 14 Jul 2026 08:25:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ijLJxbSD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7327110E032
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Jul 2026 08:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784017542; x=1815553542;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=Y+I3GOkh8GCqsX3fHrGhRAf8T7VEJaWXej11rPlJejE=;
 b=ijLJxbSDwgF7cyqJHioV4VN/ptzohiVXjOPpxB0kn+HtjNIGATnaXciO
 3nXHwAANCpvxbex3bvH75hiobMbgJJK0gbm56LTAeDfDJRGnPYfugk9/h
 kDKYkeH6YAeC7SdvgCrgxha8tbYuyxePtR9uPk2ffAulsaRkqn1GBAZvm
 7vicFOF9g/Zxx8siOMFf2oZs763h12H5IkGUvKLnAkJfs/imdhWLsCuMu
 RnmCJwSoPsN7WcwGC/G6ficlPWrnIzRan2NEuWSRZIFJ92r9+5lufCAtF
 oDS2GB9cNJXev/ukcCkOg22MpIdqxyOyvocT0/E/5rQSPjY4UG10E/uIX w==;
X-CSE-ConnectionGUID: fl4cExyJTPqsfhuiQRxvXg==
X-CSE-MsgGUID: yeT2QfI6QAGu6u8u1TJbvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11846"; a="94986726"
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; d="scan'208,217";a="94986726"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 01:25:42 -0700
X-CSE-ConnectionGUID: FNVboJ37Q1iyCN+CRC015g==
X-CSE-MsgGUID: tJh6x+qQSjmwFIDernE+BQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
 d="scan'208,217";a="285875809"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 01:25:42 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 14 Jul 2026 01:25:41 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 14 Jul 2026 01:25:41 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.48) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 14 Jul 2026 01:25:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kLDZpASNYsqtYK8jAKBuW9I6UKqnchNwoJKM+NTlUTEsOnrx8LtE8rtelk67fKYcWqw142vl6boGgAbSb6cZPxi1UYQavBOix0uQkX9ah/4QtZXz/HYUO8D1DLs8B9aDNnAaPbyQh4OOE7x/WdlJ3OGG3FpPXAi04z38mNqgCcSCudoJpaeYuIXxSX87hdVCF008LHMeNkzZOehAUibma+M2ZIg72HrES9H71YCbvZC9gWw+bHL6ifVlhBYWZoLhKpv73smanFFZ2b/YhsKBiUbJbIt2PrVjxXwAlle1jY1cmMupw2KVRjMuLAvkcrIPDXQMR0bZpTz1NRtKdgrEhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q4M84uOJt6QhhmOKEHc1IBPSrb5KPEfHdJEoPmeKXwA=;
 b=KnSOITBPwXB91zsh3alHJKU+lyGoa7oDJo5+lTVQ1CffvTXNnwxmm9Uu9nWFGOVelJrWJkNz7uEV9+65n70ofixTJFi8gGcpzJzd/bXowoc+kdfdB0F/u2fhKfLZqcyoQABslb7i4wUk67VgfN89zJe0TfkjSoavGVM78Nvsrd4v+CuVKdz2gYgtPBjmez6hEoj4uOq9UApTkWUWEi9oyrQ9asNUA06P1LWykQSi9170/t8D/R+uNXK5FgqdZFQdWlgaC8gthVp0DuJzz3ZvjJuPG3O6cuCA0fCkSu0j9S8lB9dUBkO7vJ9qZYbDm68m/TvAXfCUpqwWWw3f1Zab/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by CY8PR11MB7900.namprd11.prod.outlook.com (2603:10b6:930:7a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Tue, 14 Jul
 2026 08:25:38 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::ccc3:3fd6:58f5:927]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::ccc3:3fd6:58f5:927%5]) with mapi id 15.21.0223.008; Tue, 14 Jul 2026
 08:25:38 +0000
Content-Type: multipart/alternative;
 boundary="------------SN7DF8JzqHGIm3o0z5u0AqCh"
Message-ID: <0331512e-6881-4302-adab-910edc97fae7@intel.com>
Date: Tue, 14 Jul 2026 13:55:32 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/vf: Fix VF CCS attach/detach race with in-flight
 BO moves
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>, Matthew Auld
 <matthew.auld@intel.com>, =?UTF-8?Q?Micha=C5=82_Winiarski?=
 <michal.winiarski@intel.com>
References: <20260714062440.3421225-1-matthew.brost@intel.com>
Content-Language: en-US
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
In-Reply-To: <20260714062440.3421225-1-matthew.brost@intel.com>
X-ClientProxiedBy: MA5P287CA0154.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d7::13) To LV3PR11MB8695.namprd11.prod.outlook.com
 (2603:10b6:408:211::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8695:EE_|CY8PR11MB7900:EE_
X-MS-Office365-Filtering-Correlation-Id: 9abfc2a4-87d2-445e-db26-08dee1817c1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|18002099003|22082099003|6133799003|8096899003|56012099006|11063799006|3023799007;
X-Microsoft-Antispam-Message-Info: aZuNyysDdt359b/TPGB8Kzc6eUY2OqJTCq42cAWY3vMv2c4m3Y2rQO1aAoyTHYmkYkB4V+bB4Yn0XcUXScfpUQs7lJbCuXBuAZAP7jbE+CiGRuQ3OZkkyzeih4xXqgL9r0yaYfV2LhQAv/mjmShzhPovliNzAZAotcw2pMtiL/pzxYDtczFWgQ4V//5kmJO2AZWmhnsWYnZReblKJct9+FaaJmaqQpZ7algIWk5zWVCSrdtWsMFklktx7wG1gf9bAHbIXcd00csm4Eb5p3v/fyRiNbEYk+wKAeWpGH2Gl0KEk7n9Rt8KJ2n5XLZt14VVvOBzQ98NuhdKSVjpUfBsXL8uwSDlxd1MNDAY9xTrJKH5bDvXoRoDJ49qfAmnJoMv5ktKQhMaE9hWSCyfsYGs1mKjRoLkL5GOp1oIDA5HgFllb0oLoSUZTmc0qbgHFdwPI6LHrPgT8ncv/7uEf+hNeTWoDDMdJGhZcCMK6FCkp0ds/0iYllLOdKEE9oK77BNmtpLjm90QN/VqicbE7SItWSk33RG6Acc2z7sq09xy4zQWKs4P5VdcRWSmLtS9ZlGtvRuJuQje66m6cmhA6grvnhxwjHEYAYcyPSfyMaDjb+j8IVIE9VCKD9uDuHWUiSRDSr91VyZ6PDiuzlZ+xy+6i3njT7LpeDWzVTgaaNt2ntg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(18002099003)(22082099003)(6133799003)(8096899003)(56012099006)(11063799006)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NEN5UElSajB6aW42Q1RVWnJFSFFoZEdhTXBDSmJqaHVWNEFnMjdEeCs1Z2Ex?=
 =?utf-8?B?aDk0aUx3MnNINElqb0wxU1Bmc0tualBscUpZLzhsRTJBQUtiZmpaYVBKWi9k?=
 =?utf-8?B?aktsWXovaDl3eUluRjdhMUFWOW9MYXpoYTE1eVhVcWdQSU9qVmRUelJEdW0y?=
 =?utf-8?B?Vm5KVjJPWG1HMi91RzhrUmpEdnMwdTlOZ1Izbll4K1JjV1IzWk05WG5wRWNi?=
 =?utf-8?B?MHFXR05KNVkzQmdWQUFuSWdnK0N4Tlo5Z2FZT2dQeXgrNDU0YnRlbm05MGho?=
 =?utf-8?B?djFIY1AvV2RpTHdmNUVFV1k5d3FnTEdOU2ZtcTZDY1pCNzB3R1ZzZmw0aGtv?=
 =?utf-8?B?cmVjQmllSTJyaDFtUFdVdEd4WVNsNWQ5RGNIMjhVTldCWWVXSU5yaFNraEVB?=
 =?utf-8?B?Q2I5b08rVVJFanREYzlGa21RZ2FReXhkZHJPZUR2ZGhGK2V0cGJ5UFRTUjdx?=
 =?utf-8?B?SUVyQTJmdTZVbWVsT1p1TmdwRDZmMVV6bDljdUVCY0YzRUZCN05VZU9aUm8r?=
 =?utf-8?B?VmVnQ1VuUzB1UElodTY0VzlFU0FaQm5SN1hobThaSnVUT204cENjQjNLSnZU?=
 =?utf-8?B?ekdQRnBqOC9WSklsMFcvQ3VlUStHdzF2a2lVRTlxcXJXbDgzRFBVZ1VEclJT?=
 =?utf-8?B?dmVEbHZFSHJ3NXUzckZLT0MweldDOG1LWlQ4NGlaNWxEQWNlMXo0dGZTZzEx?=
 =?utf-8?B?Y2U0ajBVeFZQS2tRWUhxU1QzYnVNNVdlOTRWWEZIejFwTWtzeG9rT2ZuaEM3?=
 =?utf-8?B?WmJOQXVPcDBKUFdhRWJvRi9vZlBidTlQOUF5Z3FtTHJvOGNPWlV6Z0VlZzRI?=
 =?utf-8?B?ckViUnBBd0p2dGgyQmxYZS9IQ09WMmlwWDZ0OVZLMCtzQW93cytHRmZwdlR2?=
 =?utf-8?B?ekFUL3c4SVpvdWRMdkJwSFFiU0xiVWFXMnpHdC9TTXZRSm5VR3QzYWpFcDcz?=
 =?utf-8?B?REZDYlcrTk45azc0NTdZVWhjODRnYnhsQ3RORHc2WlNVNDdqM3VGaTRwblNH?=
 =?utf-8?B?QkJGNGxPUFA4eTkwelZBOCtRRkt0ZElNYXY3bG9ZdVV1eERxeWMyRE96STY2?=
 =?utf-8?B?TGdQbGZ1ejRQdEtuVkI2NDgvM2NDZEI2RkZ1dUhiRWcvQ0g3QXVMZ3Y2U3Az?=
 =?utf-8?B?KzRreHcyOHpUVHNROUMrL0N5aEJ0UEtDTWhkVmNtdmpDRGJRQjVtMlNvQ096?=
 =?utf-8?B?RndDRVVvYmI4cHVsNjM4aDlZU2NGTm1VR3E2NTNsSDhMeU45dVJjQkNXOG1Z?=
 =?utf-8?B?dStnbFFFeXZnTDZuNHZyMm01eW9qY3JsTGpkamU3eXlqK1h6aHlXWFJlMXdw?=
 =?utf-8?B?VDh1cXc2VHZ6cEY5OFFhYW1wVGRXTEhxemF5YmtVWWtENGp0UHFVbTFtbDIr?=
 =?utf-8?B?ZVVZMDloQ1pqeVh4ZTZHYVdLWWsvWUJMcHp3eTF1ZDk2ZGJGazd2TjJGQW1M?=
 =?utf-8?B?RytVMWJiRUkwOWIrOWNNbE9Fa3d4eWNkUXJ5eFFnMUFrUnFlTG9HK3RiVWRs?=
 =?utf-8?B?bTY5M1Z1VHMwVFpGSUtFa3lsSmFCendmWUlDcWpPNytCczFXeWVNM0RWRzdh?=
 =?utf-8?B?dUpJa3FnVjRMaGN5N2Y3VFdPZUp5VzZaSndrYXc2U0lxRTU4OTdCeTBPQ1BQ?=
 =?utf-8?B?Tit6Q0x3Tk5DalppSnh6eGhySWRtOHBBaEFsdk0wRGRrUWdiL1RSRUZ5b2hW?=
 =?utf-8?B?TkRpUWlkbG42TDZZaldwU3orSFFhOXk5aVA0dFVIWFFTUmFPbzduVVBXYW1X?=
 =?utf-8?B?VXFoeUdPdnUvYm5YNlV2d2R1SHdSckNnQUxINU9TY0ZVSnZKVUQxbmtROTRa?=
 =?utf-8?B?OWk2MXVtenZJU0UvZ0EweVRkQno3ZDh2Tk5DbUFkZDVvcG9WZjZZQjJlVFVr?=
 =?utf-8?B?YWgzNHJUY1FtRjlEL1p6QUhrTXdzcklzVU9XQjZjZTBPOXk1SnVYR0ZRK1hY?=
 =?utf-8?B?MG93bm1PVngyWXE3T2tKRFpDb2hGOEt1U3hpdG9JK2txQ1dxRlVnQXhaMmJz?=
 =?utf-8?B?MWdBcE1SYUoxalVQVWJjYkNTU0tlS2xSU3k0bFp2UFlISGZURW1FZGttQ2xS?=
 =?utf-8?B?UWt1bWsvMmplNDRreTBtZkVETWY0N0ZSU2xtQzZTOUkyUWtPSVJ1ZmVSbmU4?=
 =?utf-8?B?djU0ekswN3BaczV1dU9pb0h6bVE0cFNrVHBReG8vNStJS3d5RENZc0dnUmZ5?=
 =?utf-8?B?ZlZ3M1FJR0Z0UGVvVEdYdVhDaHRldzE0VVk0WXJ4Y01wWFBLNHFuckUvTG1T?=
 =?utf-8?B?aDhLdW9wU0R1T0lMVHVkMUk2cGplVHFJa2M5UXJBZi85ZDdXZ1FZbDdPN2Rk?=
 =?utf-8?B?UllQSTVjV3U4U3Q2czlLUlUyK2hVaW5NOTM2NThmUUZYTisvY1NoUG13Szdj?=
 =?utf-8?Q?+5OIciMRQXD+/m1M=3D?=
X-Exchange-RoutingPolicyChecked: XfNugh8D/WNuIaLkJHH+Gu8ywGIYiYedmkASKd/zgz1HlCnnH6Vg1MYci+QIqwo5WkTrO6ObATMbN8RLCWyIb3+hpkf6McnJxgNjPuhf7uSVP7m5B4NKgPqLuGVvNtRmyYjFJBJMh1mECQX9uRRlZ5nHtwb0w6eN6rTI1KrY++lWOh+/ynRMHcX8gnbc3J+rw7Kt1I3CYms3Ta1VQsoH/QJJsmIDZrJtxhA/vIOHC8BH81F77wg7cjVXyyB5vIW/8579k42r1XCSD8EfRVS1SRqiR0PocPeMfbTYgB5ytyciX/8d79c3rRMY8d4vYq3tsFsbYjrQlTdi5RrxHyphBQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9abfc2a4-87d2-445e-db26-08dee1817c1f
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 08:25:38.4274 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EYV+hRETJ0E1Blp2lpuZ8zhZ211LM5gH/TzdTvwyzb02rt0xEJiSN0VoEgHzhUS6yY3V35+yucTGMpRpq4C0+mK5hTPUeg82C6s7GxfMejA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7900
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

--------------SN7DF8JzqHGIm3o0z5u0AqCh
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 14-Jul-26 11:54 AM, Matthew Brost wrote:
> xe_bo_move() attaches VF CCS read/write batch buffers (BBs) to a BO
> after it transitions NULL/SYSTEM -> TT, and detaches them after it
> transitions TT -> SYSTEM. Both operations were done synchronously on
> the CPU immediately after building the move's copy/clear fence,
> without waiting for that fence to signal. This creates two races with
> VF migration:
>
> - Attach happens too late relative to the copy job it is meant to
>    protect. If the copy job is submitted before the CCS BBs are
>    attached, a VF migration event that pauses execution mid-copy can
>    observe partially copied CCS metadata without the attach state
>    needed to correctly save/restore it.
>
> - Detach happens too early relative to the copy job that moves data
>    out of TT. The CCS BBs are torn down right after the copy fence is
>    obtained, while the actual blit may still be in flight. A VF
>    migration event that pauses execution mid-copy can then race the
>    save/restore path against the still-running blit, and the CCS BBs
>    it would need to make sense of the paused state have already been
>    removed.
>
> Fix both races:
>
> - Move the attach call to before the copy/clear job is submitted, so
>    the CCS BBs are already registered by the time the copy runs. On
>    attach failure, unwind and bail out of the move. xe_migrate_ccs_rw_copy()
>    now takes the destination resource explicitly, since bo->ttm.resource
>    is not updated to the new resource until after the move commits.
>
> - Detach only after explicitly waiting for the copy fence to signal,
>    instead of tearing down the CCS BBs immediately after obtaining it.
>
> While here, also fix xe_sriov_vf_ccs_attach_bo() to properly unwind and
> propagate errors: the per-context loop previously never broke out on
> error, silently discarding earlier failures. Unwind by clearing each
> attached context directly via xe_migrate_ccs_rw_copy_clear() instead of
> reusing xe_sriov_vf_ccs_detach_bo(), which requires both contexts to be
> attached before it will clean up either one.
>
> Fixes: 864690cf4dd6 ("drm/xe/vf: Attach and detach CCS copy commands with BO")
> Cc: Michal Wajdeczko<michal.wajdeczko@intel.com>
> Cc: Matthew Auld<matthew.auld@intel.com>
> Cc: Michał Winiarski<michal.winiarski@intel.com>
> Cc: Satyanarayana K V P<satyanarayana.k.v.p@intel.com>
> Assisted-by: GitHub_Copilot:claude-sonnet-5
> Signed-off-by: Matthew Brost<matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_bo.c           | 34 +++++++++++++++++++---------
>   drivers/gpu/drm/xe/xe_migrate.c      |  5 +++-
>   drivers/gpu/drm/xe/xe_migrate.h      |  1 +
>   drivers/gpu/drm/xe/xe_sriov_vf_ccs.c | 20 ++++++++++++++--
>   drivers/gpu/drm/xe/xe_sriov_vf_ccs.h |  3 ++-
>   5 files changed, 48 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 85e6d9a0f575..7916aea0c9cb 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1102,6 +1102,21 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>   		xe_pm_runtime_get_noresume(xe);
>   	}
>   
> +	/*
> +	 * Attach CCS BBs before submitting the copy job below so a VF
> +	 * migration racing the copy sees valid, up to date attach state.
> +	 */
> +	if (IS_VF_CCS_READY(xe) &&
> +	    ((move_lacks_source && new_mem->mem_type == XE_PL_TT) ||
> +	     (old_mem_type == XE_PL_SYSTEM && new_mem->mem_type == XE_PL_TT)) &&
> +	    handle_system_ccs) {
> +		ret = xe_sriov_vf_ccs_attach_bo(bo, new_mem);
> +		if (ret) {
> +			xe_pm_runtime_put(xe);
> +			goto out;
> +		}
> +	}
> +
>   	if (move_lacks_source) {
>   		u32 flags = 0;
>   
> @@ -1139,22 +1154,19 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>   		ttm_bo_move_null(ttm_bo, new_mem);
>   	}
>   
> -	dma_fence_put(fence);
> -	xe_pm_runtime_put(xe);
> -
>   	/*
> -	 * CCS meta data is migrated from TT -> SMEM. So, let us detach the
> -	 * BBs from BO as it is no longer needed.
> +	 * Detach must wait for the copy above to complete: a VF migration
> +	 * racing an in-flight copy must still see valid CCS BBs, so don't
> +	 * tear them down until the copy fence has signaled.
>   	 */
>   	if (IS_VF_CCS_READY(xe) && old_mem_type == XE_PL_TT &&
> -	    new_mem->mem_type == XE_PL_SYSTEM)
> +	    new_mem->mem_type == XE_PL_SYSTEM) {
> +		dma_fence_wait(fence, false);
>   		xe_sriov_vf_ccs_detach_bo(bo);
> +	}
>   
> -	if (IS_VF_CCS_READY(xe) &&
> -	    ((move_lacks_source && new_mem->mem_type == XE_PL_TT) ||
> -	     (old_mem_type == XE_PL_SYSTEM && new_mem->mem_type == XE_PL_TT)) &&
> -	    handle_system_ccs)
> -		ret = xe_sriov_vf_ccs_attach_bo(bo);
> +	dma_fence_put(fence);
> +	xe_pm_runtime_put(xe);
>   
>   out:
>   	if ((!ttm_bo->resource || ttm_bo->resource->mem_type == XE_PL_SYSTEM) &&
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 92d5e81ceac2..c84e14e86a82 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -1142,6 +1142,8 @@ static int emit_flush_invalidate(u32 *dw, int i, u32 flags)
>    * @tile: Tile whose migration context to be used.
>    * @q : Execution to be used along with migration context.
>    * @src_bo: The buffer object @src is currently bound to.
> + * @new_mem: The (not yet committed) destination resource @src_bo is being
> + *          moved into; src_bo->ttm.resource is still the old resource.
>    * @read_write : Creates BB commands for CCS read/write.
>    *
>    * Creates batch buffer instructions to copy CCS metadata from CCS pool to
> @@ -1153,12 +1155,13 @@ static int emit_flush_invalidate(u32 *dw, int i, u32 flags)
>    */
>   int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
>   			   struct xe_bo *src_bo,
> +			   struct ttm_resource *new_mem,
>   			   enum xe_sriov_vf_ccs_rw_ctxs read_write)
>   
>   {
>   	bool src_is_pltt = read_write == XE_SRIOV_VF_CCS_READ_CTX;
>   	bool dst_is_pltt = read_write == XE_SRIOV_VF_CCS_WRITE_CTX;
> -	struct ttm_resource *src = src_bo->ttm.resource;
> +	struct ttm_resource *src = new_mem;
>   	struct xe_migrate *m = tile->migrate;
>   	struct xe_gt *gt = tile->primary_gt;
>   	u32 batch_size, batch_size_allocated;
> diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
> index 965c45889c72..78e5b63f3ebe 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.h
> +++ b/drivers/gpu/drm/xe/xe_migrate.h
> @@ -138,6 +138,7 @@ struct dma_fence *xe_migrate_resolve(struct xe_migrate *m,
>   
>   int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
>   			   struct xe_bo *src_bo,
> +			   struct ttm_resource *new_mem,
>   			   enum xe_sriov_vf_ccs_rw_ctxs read_write);
>   
>   void xe_migrate_ccs_rw_copy_clear(struct xe_bo *src_bo,
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> index 09b99fb2608b..6787564629c6 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> @@ -404,6 +404,8 @@ void xe_sriov_vf_ccs_rw_update_bb_addr(struct xe_sriov_vf_ccs_ctx *ctx)
>   /**
>    * xe_sriov_vf_ccs_attach_bo - Insert CCS read write commands in the BO.
>    * @bo: the &buffer object to which batch buffer commands will be added.
> + * @new_mem: the (not yet committed) destination resource @bo is being moved
> + *          into; bo->ttm.resource is still the old resource at this point.
>    *
>    * This function shall be called only by VF. It inserts the PTEs and copy
>    * command instructions in the BO by calling xe_migrate_ccs_rw_copy()
> @@ -411,7 +413,7 @@ void xe_sriov_vf_ccs_rw_update_bb_addr(struct xe_sriov_vf_ccs_ctx *ctx)
>    *
>    * Returns: 0 if successful, negative error code on failure.
>    */
> -int xe_sriov_vf_ccs_attach_bo(struct xe_bo *bo)
> +int xe_sriov_vf_ccs_attach_bo(struct xe_bo *bo, struct ttm_resource *new_mem)
>   {
>   	struct xe_device *xe = xe_bo_device(bo);
>   	enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
> @@ -430,7 +432,21 @@ int xe_sriov_vf_ccs_attach_bo(struct xe_bo *bo)
>   		xe_assert(xe, !bb);
>   
>   		ctx = &xe->sriov.vf.ccs.contexts[ctx_id];
> -		err = xe_migrate_ccs_rw_copy(tile, ctx->mig_q, bo, ctx_id);
> +		err = xe_migrate_ccs_rw_copy(tile, ctx->mig_q, bo, new_mem, ctx_id);
> +		if (err)
> +			goto err_unwind;
> +	}
> +	return 0;
> +
> +err_unwind:
> +	/*
> +	 * Clean up any contexts already attached. Can't reuse
> +	 * xe_sriov_vf_ccs_detach_bo() here as it requires both contexts
> +	 * attached before cleaning up either one.
> +	 */
> +	for_each_ccs_rw_ctx(ctx_id) {
> +		if (bo->bb_ccs[ctx_id])
> +			xe_migrate_ccs_rw_copy_clear(bo, ctx_id);
>   	}
>   	return err;
>   }
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
> index 00e58b36c510..e1034d852104 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
> @@ -11,11 +11,12 @@
>   #include "xe_sriov_vf_ccs_types.h"
>   
>   struct drm_printer;
> +struct ttm_resource;
>   struct xe_device;
>   struct xe_bo;
>   
>   int xe_sriov_vf_ccs_init(struct xe_device *xe);
> -int xe_sriov_vf_ccs_attach_bo(struct xe_bo *bo);
> +int xe_sriov_vf_ccs_attach_bo(struct xe_bo *bo, struct ttm_resource *new_mem);
>   int xe_sriov_vf_ccs_detach_bo(struct xe_bo *bo);
>   int xe_sriov_vf_ccs_register_context(struct xe_device *xe);
>   void xe_sriov_vf_ccs_rebase(struct xe_device *xe);

LGTM.

Acked-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>

--------------SN7DF8JzqHGIm3o0z5u0AqCh
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 14-Jul-26 11:54 AM, Matthew Brost
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260714062440.3421225-1-matthew.brost@intel.com">
      <pre wrap="" class="moz-quote-pre">xe_bo_move() attaches VF CCS read/write batch buffers (BBs) to a BO
after it transitions NULL/SYSTEM -&gt; TT, and detaches them after it
transitions TT -&gt; SYSTEM. Both operations were done synchronously on
the CPU immediately after building the move's copy/clear fence,
without waiting for that fence to signal. This creates two races with
VF migration:

- Attach happens too late relative to the copy job it is meant to
  protect. If the copy job is submitted before the CCS BBs are
  attached, a VF migration event that pauses execution mid-copy can
  observe partially copied CCS metadata without the attach state
  needed to correctly save/restore it.

- Detach happens too early relative to the copy job that moves data
  out of TT. The CCS BBs are torn down right after the copy fence is
  obtained, while the actual blit may still be in flight. A VF
  migration event that pauses execution mid-copy can then race the
  save/restore path against the still-running blit, and the CCS BBs
  it would need to make sense of the paused state have already been
  removed.

Fix both races:

- Move the attach call to before the copy/clear job is submitted, so
  the CCS BBs are already registered by the time the copy runs. On
  attach failure, unwind and bail out of the move. xe_migrate_ccs_rw_copy()
  now takes the destination resource explicitly, since bo-&gt;ttm.resource
  is not updated to the new resource until after the move commits.

- Detach only after explicitly waiting for the copy fence to signal,
  instead of tearing down the CCS BBs immediately after obtaining it.

While here, also fix xe_sriov_vf_ccs_attach_bo() to properly unwind and
propagate errors: the per-context loop previously never broke out on
error, silently discarding earlier failures. Unwind by clearing each
attached context directly via xe_migrate_ccs_rw_copy_clear() instead of
reusing xe_sriov_vf_ccs_detach_bo(), which requires both contexts to be
attached before it will clean up either one.

Fixes: 864690cf4dd6 (&quot;drm/xe/vf: Attach and detach CCS copy commands with BO&quot;)
Cc: Michal Wajdeczko <a class="moz-txt-link-rfc2396E" href="mailto:michal.wajdeczko@intel.com">&lt;michal.wajdeczko@intel.com&gt;</a>
Cc: Matthew Auld <a class="moz-txt-link-rfc2396E" href="mailto:matthew.auld@intel.com">&lt;matthew.auld@intel.com&gt;</a>
Cc: Michał Winiarski <a class="moz-txt-link-rfc2396E" href="mailto:michal.winiarski@intel.com">&lt;michal.winiarski@intel.com&gt;</a>
Cc: Satyanarayana K V P <a class="moz-txt-link-rfc2396E" href="mailto:satyanarayana.k.v.p@intel.com">&lt;satyanarayana.k.v.p@intel.com&gt;</a>
Assisted-by: GitHub_Copilot:claude-sonnet-5
Signed-off-by: Matthew Brost <a class="moz-txt-link-rfc2396E" href="mailto:matthew.brost@intel.com">&lt;matthew.brost@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_bo.c           | 34 +++++++++++++++++++---------
 drivers/gpu/drm/xe/xe_migrate.c      |  5 +++-
 drivers/gpu/drm/xe/xe_migrate.h      |  1 +
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c | 20 ++++++++++++++--
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.h |  3 ++-
 5 files changed, 48 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 85e6d9a0f575..7916aea0c9cb 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1102,6 +1102,21 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 		xe_pm_runtime_get_noresume(xe);
 	}
 
+	/*
+	 * Attach CCS BBs before submitting the copy job below so a VF
+	 * migration racing the copy sees valid, up to date attach state.
+	 */
+	if (IS_VF_CCS_READY(xe) &amp;&amp;
+	    ((move_lacks_source &amp;&amp; new_mem-&gt;mem_type == XE_PL_TT) ||
+	     (old_mem_type == XE_PL_SYSTEM &amp;&amp; new_mem-&gt;mem_type == XE_PL_TT)) &amp;&amp;
+	    handle_system_ccs) {
+		ret = xe_sriov_vf_ccs_attach_bo(bo, new_mem);
+		if (ret) {
+			xe_pm_runtime_put(xe);
+			goto out;
+		}
+	}
+
 	if (move_lacks_source) {
 		u32 flags = 0;
 
@@ -1139,22 +1154,19 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 		ttm_bo_move_null(ttm_bo, new_mem);
 	}
 
-	dma_fence_put(fence);
-	xe_pm_runtime_put(xe);
-
 	/*
-	 * CCS meta data is migrated from TT -&gt; SMEM. So, let us detach the
-	 * BBs from BO as it is no longer needed.
+	 * Detach must wait for the copy above to complete: a VF migration
+	 * racing an in-flight copy must still see valid CCS BBs, so don't
+	 * tear them down until the copy fence has signaled.
 	 */
 	if (IS_VF_CCS_READY(xe) &amp;&amp; old_mem_type == XE_PL_TT &amp;&amp;
-	    new_mem-&gt;mem_type == XE_PL_SYSTEM)
+	    new_mem-&gt;mem_type == XE_PL_SYSTEM) {
+		dma_fence_wait(fence, false);
 		xe_sriov_vf_ccs_detach_bo(bo);
+	}
 
-	if (IS_VF_CCS_READY(xe) &amp;&amp;
-	    ((move_lacks_source &amp;&amp; new_mem-&gt;mem_type == XE_PL_TT) ||
-	     (old_mem_type == XE_PL_SYSTEM &amp;&amp; new_mem-&gt;mem_type == XE_PL_TT)) &amp;&amp;
-	    handle_system_ccs)
-		ret = xe_sriov_vf_ccs_attach_bo(bo);
+	dma_fence_put(fence);
+	xe_pm_runtime_put(xe);
 
 out:
 	if ((!ttm_bo-&gt;resource || ttm_bo-&gt;resource-&gt;mem_type == XE_PL_SYSTEM) &amp;&amp;
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 92d5e81ceac2..c84e14e86a82 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -1142,6 +1142,8 @@ static int emit_flush_invalidate(u32 *dw, int i, u32 flags)
  * @tile: Tile whose migration context to be used.
  * @q : Execution to be used along with migration context.
  * @src_bo: The buffer object @src is currently bound to.
+ * @new_mem: The (not yet committed) destination resource @src_bo is being
+ *          moved into; src_bo-&gt;ttm.resource is still the old resource.
  * @read_write : Creates BB commands for CCS read/write.
  *
  * Creates batch buffer instructions to copy CCS metadata from CCS pool to
@@ -1153,12 +1155,13 @@ static int emit_flush_invalidate(u32 *dw, int i, u32 flags)
  */
 int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
 			   struct xe_bo *src_bo,
+			   struct ttm_resource *new_mem,
 			   enum xe_sriov_vf_ccs_rw_ctxs read_write)
 
 {
 	bool src_is_pltt = read_write == XE_SRIOV_VF_CCS_READ_CTX;
 	bool dst_is_pltt = read_write == XE_SRIOV_VF_CCS_WRITE_CTX;
-	struct ttm_resource *src = src_bo-&gt;ttm.resource;
+	struct ttm_resource *src = new_mem;
 	struct xe_migrate *m = tile-&gt;migrate;
 	struct xe_gt *gt = tile-&gt;primary_gt;
 	u32 batch_size, batch_size_allocated;
diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
index 965c45889c72..78e5b63f3ebe 100644
--- a/drivers/gpu/drm/xe/xe_migrate.h
+++ b/drivers/gpu/drm/xe/xe_migrate.h
@@ -138,6 +138,7 @@ struct dma_fence *xe_migrate_resolve(struct xe_migrate *m,
 
 int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
 			   struct xe_bo *src_bo,
+			   struct ttm_resource *new_mem,
 			   enum xe_sriov_vf_ccs_rw_ctxs read_write);
 
 void xe_migrate_ccs_rw_copy_clear(struct xe_bo *src_bo,
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
index 09b99fb2608b..6787564629c6 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
@@ -404,6 +404,8 @@ void xe_sriov_vf_ccs_rw_update_bb_addr(struct xe_sriov_vf_ccs_ctx *ctx)
 /**
  * xe_sriov_vf_ccs_attach_bo - Insert CCS read write commands in the BO.
  * @bo: the &amp;buffer object to which batch buffer commands will be added.
+ * @new_mem: the (not yet committed) destination resource @bo is being moved
+ *          into; bo-&gt;ttm.resource is still the old resource at this point.
  *
  * This function shall be called only by VF. It inserts the PTEs and copy
  * command instructions in the BO by calling xe_migrate_ccs_rw_copy()
@@ -411,7 +413,7 @@ void xe_sriov_vf_ccs_rw_update_bb_addr(struct xe_sriov_vf_ccs_ctx *ctx)
  *
  * Returns: 0 if successful, negative error code on failure.
  */
-int xe_sriov_vf_ccs_attach_bo(struct xe_bo *bo)
+int xe_sriov_vf_ccs_attach_bo(struct xe_bo *bo, struct ttm_resource *new_mem)
 {
 	struct xe_device *xe = xe_bo_device(bo);
 	enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
@@ -430,7 +432,21 @@ int xe_sriov_vf_ccs_attach_bo(struct xe_bo *bo)
 		xe_assert(xe, !bb);
 
 		ctx = &amp;xe-&gt;sriov.vf.ccs.contexts[ctx_id];
-		err = xe_migrate_ccs_rw_copy(tile, ctx-&gt;mig_q, bo, ctx_id);
+		err = xe_migrate_ccs_rw_copy(tile, ctx-&gt;mig_q, bo, new_mem, ctx_id);
+		if (err)
+			goto err_unwind;
+	}
+	return 0;
+
+err_unwind:
+	/*
+	 * Clean up any contexts already attached. Can't reuse
+	 * xe_sriov_vf_ccs_detach_bo() here as it requires both contexts
+	 * attached before cleaning up either one.
+	 */
+	for_each_ccs_rw_ctx(ctx_id) {
+		if (bo-&gt;bb_ccs[ctx_id])
+			xe_migrate_ccs_rw_copy_clear(bo, ctx_id);
 	}
 	return err;
 }
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
index 00e58b36c510..e1034d852104 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
+++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
@@ -11,11 +11,12 @@
 #include &quot;xe_sriov_vf_ccs_types.h&quot;
 
 struct drm_printer;
+struct ttm_resource;
 struct xe_device;
 struct xe_bo;
 
 int xe_sriov_vf_ccs_init(struct xe_device *xe);
-int xe_sriov_vf_ccs_attach_bo(struct xe_bo *bo);
+int xe_sriov_vf_ccs_attach_bo(struct xe_bo *bo, struct ttm_resource *new_mem);
 int xe_sriov_vf_ccs_detach_bo(struct xe_bo *bo);
 int xe_sriov_vf_ccs_register_context(struct xe_device *xe);
 void xe_sriov_vf_ccs_rebase(struct xe_device *xe);</pre>
    </blockquote>
    <p>LGTM.<span style="color:black"><br>
      </span></p>
    <p><span style="color:black">Acked-by: Satyanarayana K V P
        <a class="moz-txt-link-rfc2396E" href="mailto:satyanarayana.k.v.p@intel.com">&lt;satyanarayana.k.v.p@intel.com&gt;</a></span></p>
    <blockquote type="cite" cite="mid:20260714062440.3421225-1-matthew.brost@intel.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------SN7DF8JzqHGIm3o0z5u0AqCh--
