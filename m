Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A41ECD1292
	for <intel-xe@archiver.kernel.org>; Thu,  4 Apr 2024 19:06:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FBAF11342C;
	Thu,  4 Apr 2024 19:06:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JmaHok/n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 726ED113429
 for <Intel-Xe@lists.freedesktop.org>; Thu,  4 Apr 2024 19:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712257587; x=1743793587;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=IRftlEZeEP9pRywnqQXuHWYZPCwrOuclk/vsJBmBUPA=;
 b=JmaHok/nOQWjxoHOl8Dm9d109WtnVJkYVGnM+gWkIsjTlLW6eJHUA2n2
 pIwqXSvahwp7jmn42qQQ5Ki19CtaFz7uji+55jGlyn1MN2k3avLay6NLN
 KePOXkg4v3sJX31E3rnj8y1F7K3oMpzSr4QWS0bR6TQICInKU/PmkEpGb
 dYeBsA7f/2u42NDqh21LL9rgXmUYUVODOsH6e7SSqrQcD8kOEmsS8zgIo
 /woIlK8AQQ3nw6m0Vx6Wb5GwLOWk47lO1z5HbDAVRxkPns0DF7j3+JrGW
 CaP//viSmdU7BvVWqi7n0trGaXVvxzcm787j65ACmvOwo/54CoMnPUhQ8 w==;
X-CSE-ConnectionGUID: 5V7a8jFTQM2g2GxQAVXE8g==
X-CSE-MsgGUID: Jypc5zssQUuku3VAczMJew==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7434478"
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; 
   d="scan'208";a="7434478"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 12:06:26 -0700
X-CSE-ConnectionGUID: BcXTCDMCQ8WgPBcs3abLcw==
X-CSE-MsgGUID: x5P8ie1dQt+kdJv2xtkNjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; d="scan'208";a="19492944"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Apr 2024 12:06:26 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 4 Apr 2024 12:06:24 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 4 Apr 2024 12:06:24 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 4 Apr 2024 12:06:24 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 4 Apr 2024 12:06:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EV2cUHBW4wKJhgJNV5Qd4FDmOBXNvnJAixujbFuBrTujRwK0CjeaPkoS+CwbIed03sI26NZ3dEA6xk7YMpWSYMGoqsbdaJ4YP/9Twgd+mv6O9qVFqUdaGdiUeeZdd9WutjM+qOzE3GT3eEA9kJ6s28Kdznn6DgudMEPQ5g+OVrVOF0nayZ4+WnjBGdqNj6DaEZ4KHtB0egGDgHv+n7edQV5eKeHTI5Gri11wcXIovTX/QVkVlAy1fTDROrSLIDv9nj1wGQ4pGVJ8K6Nw87g4qloQjv5mjRAx3HtNIE7/2VDHTGC6WnyMjTbOYRrI7p2r6xKgMSMlptx2W8LZ4gfpuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BYNV81afHfun1ke82+O8g71RtmcvcWNZa8MljXySNGg=;
 b=BEn/Y4ui/ilH2+rmp2nIVjRVDsVZDxPKzk+E8PgmQjYS9uYpzSBSoSYE07LwvEnFXNzI+AOBZQsCmpH9CGRNerfctEv+cIRKxhKYc5Bo8YoiGAcsH1j7GpYswgI8BzEZI4xG48LnwDEBH0iWgc2+E4YZorRuIiu5dbMYaxAb5cV7+q1R4mWRQtI//aGzaMw7xVh6f0WWFQLzAPAuOsBaYP+KI5IfJOKzjsr07QVTvCBaPpB/4kTcaEYCmhn5y3p3/r7OX1HUU1DQk28byiR8zwy6mkxfNOW3r2jT9RxlwxhPwbwtVZuVtu4267ZaO8M/QMAkhPVSirUNtkh7KyNA7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by SA1PR11MB8350.namprd11.prod.outlook.com (2603:10b6:806:387::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Thu, 4 Apr
 2024 19:06:21 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::71ea:e0ea:808d:793b]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::71ea:e0ea:808d:793b%4]) with mapi id 15.20.7452.019; Thu, 4 Apr 2024
 19:06:21 +0000
Message-ID: <eaecdefd-dfdd-43aa-ab50-d0f241a62b5d@intel.com>
Date: Thu, 4 Apr 2024 12:06:17 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe/guc: Port over the slow GuC loading support
 from i915
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <Intel-Xe@lists.freedesktop.org>
References: <20240206201153.2773996-1-John.C.Harrison@Intel.com>
 <20240206201153.2773996-3-John.C.Harrison@Intel.com>
 <4ec5q2znrsevf3ihnzv6vvcztufpioxlwmy6342k7mam2tkq5l@6istqc7flazw>
 <b0a3b750-ffee-4735-8342-036f010eefa4@intel.com>
 <muilerdtlcqpju2pstbbxspws7tkxyg5dxah7n23co3se77hpx@njdbgtobuusy>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <muilerdtlcqpju2pstbbxspws7tkxyg5dxah7n23co3se77hpx@njdbgtobuusy>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0386.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::31) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|SA1PR11MB8350:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4M+MqdYnT5DXmgbB0fHEb9CMwvcO4lkfZ+nimW0p0FC/HsA8Plpo1DCjKNv7vb7xbLUymlZMGv1csaOlnaTU1TraU2Hg5sIIDLeHyKzK6SQJdpKlpMn1kKRXgmH8/8vXh7Sg+d+C3YZub8dnmzPx+r3RUMkgOms2M57qfxdnUnXtgFbMSYgFF+caO/070Rj/xalrk76EUrYX/W8kJLs9dON6RMmspKy5IRjot0wBk/kWWZIJbtOF28LDsDLWLMLjNn0MvHEo1THVYHe3y66uN/k2CnNRlMcX/9q8kJiiubzNE81FHCjXmbrMQ0aP/1NM7rAWLUlrLmfgVodCpUuWuu+6Fzf5f7zuXw5v5aKn29BFCdWjo7eSOLQkn9k0GQPm8rIhERRrq4buIb/c1sbI8+4i2FpxHToCAHwdfOSLYngMCd2OVk86U4yPJitKjKzQkGL4uGIS68V88/qosQSkpp24ggPMWKQsHAIm+2dl51Fpt0JOF0ftZ7NtLn14EIb0/FW9t47+bs5zzM+9wmskUYio9Rhy8+SZsRXwL6y40YfG4z3zDskuoMgyG0c9bws0OagaaSJvVeGMLWlK+NNYcPhFlUYlwPdr2T2PNS2OGT3Zsk8OIhyomGY1naptbVpPBZvroZsSqZxfUUj5+jtymiMeYRzcUk+gY+Vf/X/RvV8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?djJvYXFwbUUxekFJMmtkdTFhb3RFZGlHUlFydlFWOTlMejBtdTdzTW5CbXVy?=
 =?utf-8?B?UkRQQmtBQ1l2MVlvTlNaS2hXZlZHQi8rODUwVktYTVAzNzFYalFDV0RuVldr?=
 =?utf-8?B?UTh0cTljNEozZmQwVXp1Y0ZpaXM5enNqSEtqSWdQZHdlWDlqZEY1cU50TnhP?=
 =?utf-8?B?eWJ6d3Q4VElRTDVnZnQ5alBOd29rbmRHZWVETHZHOHJBMHA1UXdKc1lXV1ZE?=
 =?utf-8?B?aHpRWnQ0R1ZoSG11T1NCR1J0RjJrZFVPdDMrNmNKd0lnSU4ycDN4a1poYTZE?=
 =?utf-8?B?VHEraHc0aFJhMnU1MXNYcGdiTmtMenpYZUhWSmtaYUd4dC9DZXloSjh3OGFU?=
 =?utf-8?B?NGFHMTFXM3NTanR0dHAvMWNoSHkydk1XUkdPRThIWUQxSkRtazZQbDZFNHNB?=
 =?utf-8?B?VFBXVnFRQzd5VWtxNnduY2w0VWhkcnlza0RFeWwzZkZ4c1NiZnZvaXZHM3RZ?=
 =?utf-8?B?N3FqZFNSSmN6RzlyWWluZjQwV1B1RENRVENVZHVCcHEvblBzaXRvck02WUFi?=
 =?utf-8?B?U1ZtS0k2ZlpoVCtsQ1lMMkpZdHVWbHpaejJiL0dCTzFBOWp2dit3YURDUGlW?=
 =?utf-8?B?ekJLbWlNUU01Y2JjWk9MbjJCL1p1UG9DY2NrVXBrS3BrYzRhN1JrbU9CN0w2?=
 =?utf-8?B?YTMzcDkrRUY0dVBzQmowdVNOMG1IelpiUk9tWjJEeC9GSlVKdjBpZ3kxZ2FX?=
 =?utf-8?B?M200Wk5iaGtIK0pBcytPc2QvMTNqOWhtU3ViOU1HUFVja25LQ0xsOExHODdG?=
 =?utf-8?B?M3UydTRWV3p5SGQzZGRQK3BETTB5OGMxK1pKSENseldqazdSL1hEMWp6a0kv?=
 =?utf-8?B?aW9HMnhaZ1p0dGJJTStNWnNsTTZtL2tIYWNlTGZFSFJZTXJ3Zmg3MzRTNVds?=
 =?utf-8?B?YS9RUnpPcStiVEVpS1VJb2k0SElmSXlId3dGNnE4NldzOWpQem1ETVphNWkx?=
 =?utf-8?B?N0ZOb3FybUE0NlZIZ3krZFovY0tnT0ZYMWNiTDlIRlZNRkk1YlAwWFE2NTd3?=
 =?utf-8?B?SllxQnFIQVc4eHZNUVZWVUovclhucWMxcC9OQTRaNC9JSGFNSW5ja2lKNUpC?=
 =?utf-8?B?WE5reFIwZXNzUWpJdWYvSlJzTzZxWkc0K1hxcUZTcFZWaVV1R3pjUldHOWlM?=
 =?utf-8?B?aHdMaWovNmNRMGYxVTZwc3JiUzFRSnd6aGhYenNid01CYlZ4cmsxbTZYU3F0?=
 =?utf-8?B?R1Rqb2lhMEFZRjJFMkt6dGthdmJtaXJXYXZzMllXZVVlS2NoU1lYak4yRkJn?=
 =?utf-8?B?SW1uZlVRd2J5NXJaOUUzcXE2NTdxRFNjL3BNTHNnSHR4dzkyWlMwa1I5SEFZ?=
 =?utf-8?B?dG10RjFia0pEYUFPTWJwQzJ5MzRxdmNVQ2xPcUZrTkhFR0ZoYkxOQnpCOVhx?=
 =?utf-8?B?S0gxekZSQ3ZzWml6cGlrelhkeEIvNnFkejczRHpGcUl6TmtER2U1T1YyT1hC?=
 =?utf-8?B?OUIrUHVwZ0cwRE9PUys2WHpEN2FXNlNHT2dZTy85blkydFAwL2xkcEZjTk9z?=
 =?utf-8?B?TVd6WW0ra0w1WTlFRjFwdGd2aUVmUzBBZ3llVHFmNFZ2TnY2RmRlRTRaRS9Q?=
 =?utf-8?B?S0c3c1RtMitsdnlVWitjVVRiTURSQ255RUkyQkdwZkxaaFV0N3JIa2p1cDd2?=
 =?utf-8?B?ZWF1dEdwdnBUY21LeURlaStCaXFKRm9QK3ZwK0hPMmR6cC9ZNk9XdW1MUkFl?=
 =?utf-8?B?Zm1EN1cwbGVBK2x6WjJNVVkwcFY0OStIV2VRZG0zbElZZ2dSMTlXVFBYZWJH?=
 =?utf-8?B?YkxsMGNLV0k3LzRadzIwNGNuVkI5U2VlSWZLd01rZGdLblNubFBua1o0aVlU?=
 =?utf-8?B?SHdKZ0tsaEF5MlVZUkdHL1BlMTdtaEorTFk5Y0NRb3hEQzJtOUFEQ3hYelcx?=
 =?utf-8?B?U1VXS1YzcjAvV3BxbnU0V1BHNEt4ektZbGtQa0ZRdXR6dWxPNEdKV3JEaXhm?=
 =?utf-8?B?SVE1MEFuUHJWUFB6TG9ma1FYU2RWNlJmTm9LcHZEcVhHWG5mNVh4TDVkdXdL?=
 =?utf-8?B?QnpBOUcrUWpuakRseTVNTHJpcFhxLy9VSnB0MCs2clM2ZDdDaHlaeGNrckZN?=
 =?utf-8?B?OUJwS3N5Yk5hU25CanA1QmFPUVcvdDZMZzZJaXdTOHBOdUh5U3JlcFJnZUlH?=
 =?utf-8?B?cXk1cU1Ga2x1WWVHM0hlVENRYTVMUFJGRllTTXdOVkdyTWdLS3ZlNG9ndEZU?=
 =?utf-8?B?Q2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1829ebe3-2080-4158-f408-08dc54da5065
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2024 19:06:21.2370 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tAXgD1NGyAH3gsfWJb7WvpUuGSOTorOskzMPTKYEGJfLuTrmkUOIHU8fUOZ5cgYEJ6BnCf1ZOgIAe8U1QjRvyXXRLM6dMeLoFnUapX7NzNA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8350
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

On 4/4/2024 11:51, Lucas De Marchi wrote:
> I was checking the new version for this patch and remembered I had
> already said somthing. You replied and I forgot to reply back. See
> below.
>
> Other feedback I will give in the new version (if there is any).
>
> On Tue, Feb 06, 2024 at 05:51:24PM -0800, John Harrison wrote:
>> On 2/6/2024 13:36, Lucas De Marchi wrote:
>>> On Tue, Feb 06, 2024 at 12:11:51PM -0800, John.C.Harrison@Intel.com 
>>> wrote:
>>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>>
>>>> GuC loading can take longer than it is supposed to for various
>>>> reasons. So add in the code to cope with that and to report it when it
>>>> happens. There are also many different reasons why GuC loading can
>>>> fail, so add in the code for checking for those and for reporting
>>>> issues in a meaningful manner rather than just hitting a timeout and
>>>> saying 'fail: status = %x'.
>>>>
>>>> Also, remove the 'FIXME' comment about an i915 bug that has never been
>>>> applicable to Xe!
>>>>
>>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>>> ---
>>>> drivers/gpu/drm/xe/abi/guc_errors_abi.h |  26 +++-
>>>> drivers/gpu/drm/xe/regs/xe_guc_regs.h   |   2 +
>>>> drivers/gpu/drm/xe/xe_guc.c             | 197 +++++++++++++++++++-----
>>>> drivers/gpu/drm/xe/xe_macros.h          |  32 ++++
>>>> 4 files changed, 214 insertions(+), 43 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/abi/guc_errors_abi.h 
>>>> b/drivers/gpu/drm/xe/abi/guc_errors_abi.h
>>>> index ec83551bf9c0..d0b5fed6876f 100644
>>>> --- a/drivers/gpu/drm/xe/abi/guc_errors_abi.h
>>>> +++ b/drivers/gpu/drm/xe/abi/guc_errors_abi.h
>>>> @@ -7,8 +7,12 @@
>>>> #define _ABI_GUC_ERRORS_ABI_H
>>>>
>>>> enum xe_guc_response_status {
>>>> -    XE_GUC_RESPONSE_STATUS_SUCCESS = 0x0,
>>>> -    XE_GUC_RESPONSE_STATUS_GENERIC_FAIL = 0xF000,
>>>> +    XE_GUC_RESPONSE_STATUS_SUCCESS                      = 0x0,
>>>> +    XE_GUC_RESPONSE_NOT_SUPPORTED                       = 0x20,
>>>> +    XE_GUC_RESPONSE_NO_ATTRIBUTE_TABLE                  = 0x201,
>>>> +    XE_GUC_RESPONSE_NO_DECRYPTION_KEY                   = 0x202,
>>>> +    XE_GUC_RESPONSE_DECRYPTION_FAILED                   = 0x204,
>>>> +    XE_GUC_RESPONSE_STATUS_GENERIC_FAIL                 = 0xF000,
>>>> };
>>>>
>>>> enum xe_guc_load_status {
>>>> @@ -17,6 +21,9 @@ enum xe_guc_load_status {
>>>>     XE_GUC_LOAD_STATUS_ERROR_DEVID_BUILD_MISMATCH       = 0x02,
>>>>     XE_GUC_LOAD_STATUS_GUC_PREPROD_BUILD_MISMATCH       = 0x03,
>>>>     XE_GUC_LOAD_STATUS_ERROR_DEVID_INVALID_GUCTYPE      = 0x04,
>>>> +    XE_GUC_LOAD_STATUS_HWCONFIG_START                   = 0x05,
>>>> +    XE_GUC_LOAD_STATUS_HWCONFIG_DONE                    = 0x06,
>>>> +    XE_GUC_LOAD_STATUS_HWCONFIG_ERROR                   = 0x07,
>>>>     XE_GUC_LOAD_STATUS_GDT_DONE                         = 0x10,
>>>>     XE_GUC_LOAD_STATUS_IDT_DONE                         = 0x20,
>>>>     XE_GUC_LOAD_STATUS_LAPIC_DONE                       = 0x30,
>>>> @@ -34,4 +41,19 @@ enum xe_guc_load_status {
>>>>     XE_GUC_LOAD_STATUS_READY                            = 0xF0,
>>>> };
>>>>
>>>> +enum xe_bootrom_load_status {
>>>> +    XE_BOOTROM_STATUS_NO_KEY_FOUND                      = 0x13,
>>>> +    XE_BOOTROM_STATUS_AES_PROD_KEY_FOUND                = 0x1A,
>>>> +    XE_BOOTROM_STATUS_PROD_KEY_CHECK_FAILURE            = 0x2B,
>>>> +    XE_BOOTROM_STATUS_RSA_FAILED                        = 0x50,
>>>> +    XE_BOOTROM_STATUS_PAVPC_FAILED                      = 0x73,
>>>> +    XE_BOOTROM_STATUS_WOPCM_FAILED                      = 0x74,
>>>> +    XE_BOOTROM_STATUS_LOADLOC_FAILED                    = 0x75,
>>>> +    XE_BOOTROM_STATUS_JUMP_PASSED                       = 0x76,
>>>> +    XE_BOOTROM_STATUS_JUMP_FAILED                       = 0x77,
>>>> +    XE_BOOTROM_STATUS_RC6CTXCONFIG_FAILED               = 0x79,
>>>> +    XE_BOOTROM_STATUS_MPUMAP_INCORRECT                  = 0x7A,
>>>> +    XE_BOOTROM_STATUS_EXCEPTION                         = 0x7E,
>>>> +};
>>>> +
>>>> #endif
>>>> diff --git a/drivers/gpu/drm/xe/regs/xe_guc_regs.h 
>>>> b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>>>> index 92320bbc9d3d..a30e179e662e 100644
>>>> --- a/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>>>> +++ b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>>>> @@ -40,6 +40,8 @@
>>>> #define   GS_BOOTROM_JUMP_PASSED REG_FIELD_PREP(GS_BOOTROM_MASK, 0x76)
>>>> #define   GS_MIA_IN_RESET            REG_BIT(0)
>>>>
>>>> +#define GUC_HEADER_INFO                XE_REG(0xc014)
>>>> +
>>>> #define GUC_WOPCM_SIZE                XE_REG(0xc050)
>>>> #define   GUC_WOPCM_SIZE_MASK            REG_GENMASK(31, 12)
>>>> #define   GUC_WOPCM_SIZE_LOCKED            REG_BIT(0)
>>>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>>>> index 868208a39829..82514d395704 100644
>>>> --- a/drivers/gpu/drm/xe/xe_guc.c
>>>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>>>> @@ -16,6 +16,7 @@
>>>> #include "xe_device.h"
>>>> #include "xe_force_wake.h"
>>>> #include "xe_gt.h"
>>>> +#include "xe_gt_freq.h"
>>>> #include "xe_guc_ads.h"
>>>> #include "xe_guc_ct.h"
>>>> #include "xe_guc_hwconfig.h"
>>>> @@ -427,58 +428,172 @@ static int guc_xfer_rsa(struct xe_guc *guc)
>>>>     return 0;
>>>> }
>>>>
>>>> +/*
>>>> + * Read the GuC status register (GUC_STATUS) and store it in the
>>>> + * specified location; then return a boolean indicating whether
>>>> + * the value matches either completion or a known failure code.
>>>> + *
>>>> + * This is used for polling the GuC status in an xe_wait_for()
>>>> + * loop below.
>>>> + */
>>>> +static inline bool guc_load_done(struct xe_gt *gt, u32 *status, 
>>>> bool *success)
>>>
>>> bogus inline
>>>
>>>> +{
>>>> +    u32 val = xe_mmio_read32(gt, GUC_STATUS);
>>>> +    u32 uk_val = REG_FIELD_GET(GS_UKERNEL_MASK, val);
>>>> +    u32 br_val = REG_FIELD_GET(GS_BOOTROM_MASK, val);
>>>> +
>>>> +    *status = val;
>>>> +    switch (uk_val) {
>>>> +    case XE_GUC_LOAD_STATUS_READY:
>>>> +        *success = true;
>>>> +        return true;
>>>> +
>>>> +    case XE_GUC_LOAD_STATUS_ERROR_DEVID_BUILD_MISMATCH:
>>>> +    case XE_GUC_LOAD_STATUS_GUC_PREPROD_BUILD_MISMATCH:
>>>> +    case XE_GUC_LOAD_STATUS_ERROR_DEVID_INVALID_GUCTYPE:
>>>> +    case XE_GUC_LOAD_STATUS_HWCONFIG_ERROR:
>>>> +    case XE_GUC_LOAD_STATUS_DPC_ERROR:
>>>> +    case XE_GUC_LOAD_STATUS_EXCEPTION:
>>>> +    case XE_GUC_LOAD_STATUS_INIT_DATA_INVALID:
>>>> +    case XE_GUC_LOAD_STATUS_MPU_DATA_INVALID:
>>>> +    case XE_GUC_LOAD_STATUS_INIT_MMIO_SAVE_RESTORE_INVALID:
>>>> +        *success = false;
>>>> +        return true;
>>>> +    }
>>>> +
>>>> +    switch (br_val) {
>>>> +    case XE_BOOTROM_STATUS_NO_KEY_FOUND:
>>>> +    case XE_BOOTROM_STATUS_RSA_FAILED:
>>>> +    case XE_BOOTROM_STATUS_PAVPC_FAILED:
>>>> +    case XE_BOOTROM_STATUS_WOPCM_FAILED:
>>>> +    case XE_BOOTROM_STATUS_LOADLOC_FAILED:
>>>> +    case XE_BOOTROM_STATUS_JUMP_FAILED:
>>>> +    case XE_BOOTROM_STATUS_RC6CTXCONFIG_FAILED:
>>>> +    case XE_BOOTROM_STATUS_MPUMAP_INCORRECT:
>>>> +    case XE_BOOTROM_STATUS_EXCEPTION:
>>>> +    case XE_BOOTROM_STATUS_PROD_KEY_CHECK_FAILURE:
>>>> +        *success = false;
>>>> +        return true;
>>>> +    }
>>>> +
>>>> +    return false;
>>>> +}
>>>> +
>>>> +/*
>>>> + * Wait for the GuC to start up.
>>>> + *
>>>> + * Measurements indicate this should take no more than 20ms 
>>>> (assuming the GT
>>>> + * clock is at maximum frequency). However, thermal throttling and 
>>>> other issues
>>>> + * can prevent the clock hitting max and thus making the load take 
>>>> significantly
>>>> + * longer. Indeed, if the GT is clamped to minimum frequency then 
>>>> the load times
>>>> + * can be in the seconds range. As, there is a limit on how long 
>>>> an individual
>>>> + * usleep_range() can wait for, the wait is wrapped in a loop. The 
>>>> loop count
>>>> + * is increased for debug builds so that problems can be detected 
>>>> and analysed.
>>>> + * For release builds, the timeout is kept short so that user's 
>>>> don't wait
>>>> + * forever to find out there is a problem. In either case, if the 
>>>> load took longer
>>>> + * than is reasonable even with some 'sensible' throttling, then 
>>>> flag a warning
>>>> + * because something is not right.
>>>> + *
>>>> + * Note that the only reason an end user should hit the timeout is 
>>>> in case of
>>>> + * extreme thermal throttling. And a system that is that hot 
>>>> during boot is
>>>> + * probably dead anyway!
>>>> + */
>>>> +#if defined(CONFIG_DRM_XE_DEBUG)
>>>> +#define GUC_LOAD_RETRY_LIMIT    20
>>>> +#else
>>>> +#define GUC_LOAD_RETRY_LIMIT    3
>>>
>>> why? so developers don't reproduce the issues happening on normal
>>> system?
>> Not sure I follow.
>>
>> For CI runs, we want to cope with as much as possible. Anything above 
>> the limit below will be flagged as a CI failure, but if a load were 
>> to take 4 seconds then having the driver actually complete the load 
>> and keep going to run further testing is better than it aborting the 
>> load and killing the entire CI run. Especially given Xe's current 
>> penchant for causing kernel panics if something fails to start 
>> correctly.
>>
>> Whereas, for end users, we want a timeout that is short enough for 
>> them to not reach for the power button because their system has hung. 
>> As noted, the load should never be in the seconds range unless 
>> something is really badly wrong. But that's still not something we 
>> want to force on an end user.
>
>
> The problem I have with this thinking is that I don't want CI passing
> and then failing for end users. If CI is completely blocked because our
> timeout wasn't enough, then let it explode so we can fix it. Unless
> there's a reason (e.g. slower machine / environment / etc) for a longer
> timeout/retry we shouldn't make it 8x more just for passing CI.
> If the justification was that "in CI we enable a lot of other debug
> stuff x, y, z that impact this", then it could be acceptable. But then
> the ifdef could also be about those other things. One that comes to mind
> is kasan.
>
> Lucas De Marchi

The point is not to make CI pass. The point is to get a CI failure that 
says "GuC took forever to load, GT freq was abysmal, go fix your PCode 
bug or replace the fan on the CI system" as opposed to a CI failure that 
says "GuC failed to load, no clue why, please waste many days trying to 
repro and debug". And to not totally abort the driver load so that 
nothing else can be tested. So in the case where it is just a PCODE bug 
that only manifests during initial driver load (e.g. uninitialised data 
at start of day), testing continues and the whole run is not a total waste.

Note that the 'excessive init time' message is a warn not a dbg. It will 
cause a CI failure.

John.

