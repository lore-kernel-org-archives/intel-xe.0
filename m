Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6FC3CA5FC1
	for <intel-xe@archiver.kernel.org>; Wed, 30 Sep 2026 08:36:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F74110F240;
	Wed, 30 Sep 2026 08:36:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XSu4QF4e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B44B210F247
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Sep 2026 08:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790757382; x=1822293382;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=opBYJmzGBMgLXe16wKZn/j8MJ9LO8qqfpT/W35pGz2M=;
 b=XSu4QF4eDPwQXwefg1PkvopzP51u7gZq/mztvm/gvqizAsVQN+iS00gt
 cWL8R5UKljqDCm+Du7WmQQHE+GjqhXuxwnQzgcxzUP6n1xwKl7C/p2iHT
 Rpgjgef4e/zeTVXB9Uvk6fc8FhOcjxlfLRb+Ka3Q/em+3IxPsHsIqtKNz
 Lk42tbMqf4hQfdBaCM6fHMGWvOaskDsLor0/D3jSImoK8pBSo6yenoTuV
 TXGue4QtGOvKmiJqelDSk3bEnhiXtxDwSuoLlZG2kycB8Ma/UBdDty4Y8
 GCSHPrDUJhLEN7Aiw1+4LYs5DYLKl8huHW3Q2H9YFXN/7nUtKN2gUhZ+4 Q==;
X-CSE-ConnectionGUID: I3x2dY6CSNqVQtQ3HZyA+Q==
X-CSE-MsgGUID: 6PlU+JXxQTG9DNzGnWUghA==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="90531355"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208,217";a="90531355"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 01:36:21 -0700
X-CSE-ConnectionGUID: 6j74/BZvTYCvd/a1OSvpOQ==
X-CSE-MsgGUID: zqXEdl3nTTyrDg+WoTG/fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
 d="scan'208,217";a="275184901"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 01:36:21 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 30 Sep 2026 01:36:20 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 30 Sep 2026 01:36:20 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.6) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 30 Sep 2026 01:36:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wBPnKOZZEUIRY4qnwrJMQ75ZQgn9w4Y+j8o5jPLM/ZTCUtz8Oh9kJHmX+4oKryn/2aWbF54CT+pu0M42rmUwHsLbqz5IwWRCtkPuk7wzjpErlbA6QyR2mTXEuHAIcn20iXh89cfqbV/1ajMUdGwIdAQpk8IbeAfKmZasklTT33qPDnkXBY9snxJ6LUvANqLpuF4wzFPox4s1r2LVxHMF+NubJX+JJUvp0M7GnP2w03dKsl4uQWi8LhudJ2cQingGeF/UUKX3LuScjDNVXkocq+mP0tuIm3994EqnQaRWxcJD8M01k4sRho/8+05Du+Cnvye0ie2aeiEWvXUn+PJjLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3+JQIpngWyN1E2HhGUR8l6ElLVYSCx/sIeFWINI8LiU=;
 b=oveFL+ztJ1a1Co+HH1CWetNTbAkfqzdj65o2CWcvYPiu9ZYTDzCeVWP+XT9BPlOZEd+FPsh2yjGT5zQf8i/O0h29rzy0Y1FhyUk87qCmbla/wjfktUTTo3e8pzkwG96T7dcFP8sTNEjTzOKHHPvNF56v3+kytpzdJ4RQGVYjpqikFamm5JoV+gabYJIkL9HngLxuEh1UqTpoRCUMoZ7j8fp5AtFGTtALylLa9goVy1Yc3PAjndZ+QHBiQ2J6DL3wFqHh5w0mP8P9E4mV+JqXpThCw27j/XNnsIQ+C70bEfzx4Nh/knGBunhFBW99KOqKudd6i652CpDwF9sYWJkDpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by SA2PR11MB4842.namprd11.prod.outlook.com (2603:10b6:806:f8::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Wed, 30 Sep
 2026 08:36:13 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%4]) with mapi id 15.21.0451.014; Wed, 30 Sep 2026
 08:36:13 +0000
Content-Type: multipart/alternative;
 boundary="------------UAHMwOV09PsXZAndcwdPpA3W"
Message-ID: <ecb8add7-4bf1-4821-826a-fb5cc91b5f32@intel.com>
Date: Wed, 30 Sep 2026 14:06:05 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/12] drm/xe/lmtt: Report invalidation errors using
 structured xe_log API
To: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <michal.wajdeczko@intel.com>
References: <20260928092114.1610203-1-dnyaneshwar.bhadane@intel.com>
 <20260928092114.1610203-11-dnyaneshwar.bhadane@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20260928092114.1610203-11-dnyaneshwar.bhadane@intel.com>
X-ClientProxiedBy: MA5P287CA0193.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1aa::7) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|SA2PR11MB4842:EE_
X-MS-Office365-Filtering-Correlation-Id: 12b66334-63c3-42be-5b8c-08df1ecde2dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|10067099003|56012099006|11063799006|4143699003|8096899003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: UFNcfbs9pZ4taEKgcsP4NctHgn4GVPewXnHbcuHkw0rBDOG+fDQ1fWpRq4SKJG1w878uoPfRWa4cQvp6DfLBBPsawaStH+cPImJXCmopIS4Efx1fK1WhZQZf1ZT7s9XX8DU00H/a6DPyiHHDK0pmOLoQU/bWJApWtHQLnO1IrgOYCZQ+kneUfH9bmmTfN3TDLOny/pAF3N2NgnbqtAAXLPWxkhhETz7YAdjVZUDUDa7QVC8jFXPd8Ayd8sCrXFzDi4J+0vVX+7h2P4bb6HJ0Sq2FQfs7/7eE2u2zwh+ORqtJmosF2Hca3c5YTQyyYG0KaNVUkq733lqe5/mhkFM+OYBH+9T4tuSQw39rlrpewwV3XqNGJC/5JSVg/WcKv7VzRwQGCpyDUMM5QyLtrhbuDkaxopfTjkkouHx8q3Ubd2Yim79u8TymTUfL7zLvdavEL10/ZBNVZJ/FIP1PkCxiC32GiJNSjHxgUfko8YWGeg8sS4kdqSUU8xt2wp5KkLeWYF5/6g9FAIkGW0cjWM8poBjqXdtj58VqNWz+HKfPnh2cqA9/bKnzC5j2dnuWGveVopOeGfqrPeZmYKupvbNME9ljKl7/RJMw5QUzVH4xgQv2qGQpuwWVm2bDnWqH0sKJKPHLH30JDCcvrERDgG9r7M9hRAyjwQr14PwbgNpzYsU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(10067099003)(56012099006)(11063799006)(4143699003)(8096899003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VXVqdTRYalJQUkZJZHJwRm0zQkNvRVdVbVFDeEdtRmtDek5kbnpaR0tKNFJB?=
 =?utf-8?B?eFFOY3BFN20yU3pka0NKTjBKRHRHMEozcWpuQXcyZ09nVkRkRElJSXcrS2k1?=
 =?utf-8?B?ZldERGowa1FHQ2hPU1kwL3B5SXh4WjZHdWR6RG8wL1ZNZWFLOWRhSXVVNVg4?=
 =?utf-8?B?dTlodi90Zkd3OXkyRS9YK29VNFR6RW5XV0F3TWg0OEVwSDljL0ZNMUROWFRz?=
 =?utf-8?B?M240Slk1NWpTTEc1cGNEcFZ3aysrQ3Rncnhub0l2bDhCa1BXaHdSeURwdGVn?=
 =?utf-8?B?Qm5XbjYrUlozWS9zMWN1RVczT0sxQkp6ajlyN2RUSnR6cS9nQzRQbmtFNlds?=
 =?utf-8?B?d3FCYjJ6UkpPUXRVNVJINEgvOVVVVHVpbks2ZWFYVnhsbWo4bW9Ucy9LZ1dH?=
 =?utf-8?B?MTI0elhoWlVUcWdmelM0cGh6aXZZOXZuMTR5SjB0VW5hQVhTOG85V01FZkxF?=
 =?utf-8?B?N1YwTzUyenhLOCs3cXJSdUM2dVRkSnNOT2RVOTltY0hhWW1hY2xpYmF3UmdW?=
 =?utf-8?B?UFN6N2lDUXI0Vk5URHdNRUE0NnBGN0ZXV3lveDdhNWxBeDZWRUljYU1TTm0r?=
 =?utf-8?B?alRpSkZyZlg1aTl4V1d6Z0xRUCtuMnNHMlRDYUR6cTl2SXpvelRCVlNtVkZP?=
 =?utf-8?B?RkJvNEpQRjBaV0NCVmV4Y2VoSDZoN042OVdlOUpaTUFQNCtNTmFNMzFMVkxo?=
 =?utf-8?B?Y2RHMGRvYnB5WFZOL1d0QVdpNDRhMjZ5TFd2ZUE0a2Q0U0M2QWFDNW1oWVZP?=
 =?utf-8?B?TE9RRVZma3lhRFZkQWx4Nk53aDNWZHkwNFlaUjQwSG0ydGpFS2J5VVFMbE1m?=
 =?utf-8?B?ZWZ3QUk1WVUyMFByQzBBV28wbWthWkUzNk95T1pHQ1k5MkdBbFlrdFVrLzh4?=
 =?utf-8?B?SUFrV1dwWDFWcnN2Y2JNM3NaMjBTcUlmQVl0ZG91L3pCU2diYWpBYXB0M2hj?=
 =?utf-8?B?aHM3L0tkQzd1SWdRMTVHTmxKNThHTjBScHFJb0szRWNHOWltQndoN25mcWE3?=
 =?utf-8?B?MGtPVXRicXQyNDB0RTR0d3RZZHhuSWFDUTFtN240NXZuMklmQ2tBN1pCeGdW?=
 =?utf-8?B?WWpjcy8vZ2c3OVN0MjVvOWo3MXV5dFpld1VPWktWcnhaaHJmQ3U4MHZrQ05a?=
 =?utf-8?B?T01jVjVpcHVNZUJGREx0ZXVnMDZjL09NYUpCYlhMQmloNE5rb251d0psbUdx?=
 =?utf-8?B?K2UwdFZQTGJwRTJ1dHI0MGVwMFdCK1ExSXI0U0JEbmF5TWNTanBJQ1EzRGEz?=
 =?utf-8?B?MkNnS05QeXFzbWRCc1l2VDM2bzlJb0dpclo2MW45clhiNmtpcGs1UWlTZUVr?=
 =?utf-8?B?SmpaYTI3UjdiSDhoWDlKeHpKYXZiM2JBVWowazJ4YVIxMDUxM2NPYnBJVGNJ?=
 =?utf-8?B?MkRtdjYrRHJhcGNOcFJXdnBFdTRTR0gvMVJySjJFMlBmWlN2cUpjMnJnTjRZ?=
 =?utf-8?B?UmN0bnZrRHQ5U2l6WEk5ZlRQdFV6dFBlU2ZkWVk4RGt1K2R3c3JDZ0JBVmps?=
 =?utf-8?B?V01iVWV5WDdCbXlOaCsrengxSG14Zzh5RUUxeS9oUzkvOUNnRDZycjQyOWF5?=
 =?utf-8?B?N2pVK0F1VzNZVzRVZ3liVmJoVm1peUxleVY3YklqczVQd2d5TEtEejVZZG9X?=
 =?utf-8?B?Tmx2ck1sZElMd25lNHk5MzM4MEZjeHhlWW55cHU0ekdvaW1uTVA1SDFKY3Bt?=
 =?utf-8?B?WFdLRTNUVU5zRmswZW9PdVhrSUZIQmdvTG9VR2FpbVBTQzNWR09mcHViQ3ZB?=
 =?utf-8?B?andCL0N6T0dYMk9uTnlHT2ZEcjB0aXhickVjZm13VWJzaFhMMENPNEJ2V1l0?=
 =?utf-8?B?bnoyRUdUQ1pCQjJHQ0d5Yi9IbmJORy9iTXYwWkN2eFhHazNxQ01RK05IcXJy?=
 =?utf-8?B?ZEplQ2RGWHhSWXVGYTd5QWw2d1ZsaG16Q09sT1hEQWhDNmU1a2t4VVFmeDAx?=
 =?utf-8?B?WlFHcTFJZmh1T1RCUDJLSVUrUWJ2VUhsSjYzQk9LNDliLzUyWDVUcnhpUzJa?=
 =?utf-8?B?MVBacFVQdERqbE5FU1ZRQlVMalNNOGxyQTZUZVdYdkhQTlhDanlaN3BjR0dI?=
 =?utf-8?B?dXdKU1NQOG96anBHTUZHeUR0YkVoZ0w4eHEvcDlKeFlyNTBDTjNUQkh4N2Nz?=
 =?utf-8?B?VFp5Q1U2bm9IdlFFRmVadDZmQVdiYlUzOTZnbXN0cGJmUGg2MDJBMWhzaVg1?=
 =?utf-8?B?OGJoTXBoZTE5Z1JmNGR3RlRaVUl1Vm12STg3b1h1Mm1aNHY5ckRSSGlkREpw?=
 =?utf-8?B?SUxoRjl5WVNwYzFEVjJTVEZqNmNMSnZUaEhJTVQvUytwd2JlSWk4R0lVUjR0?=
 =?utf-8?B?akdXbnRweDJNNUsrSzF0QlA5OG9ndCtaN05NajlpZ3QxeEZVRVBXYnM2ak5H?=
 =?utf-8?Q?Nd+6/Sy01uVALmEM=3D?=
X-Exchange-RoutingPolicyChecked: 1pU56SALzd5zVsTIVDAaKusJ/oBEWgc8Cwen7QaWBJVTVdqgaKO8NkHTnizautWXOttlUOvXe6w6wesxYLKuZv9V8EBHBRUFcHngvd4hM4B6WHE46ybV+9EcS+2LB8298l8GAR+4ROryTjI6bqw7VWMhR04p/dbhASrTFpw/b6KgvjsCjbtRRd4nTsuJdZlFZlXY+nDRas3fJ2OCvG7qt8Hp2GXvxvQdw6jpM8al8TKf6Z8FPfoPk+QD0or+6GEklFcDJcNsRr+psxqhFMCAIoMcrVltjaumxb+diLIcr9fVU5i7dJdVXJhVMutCs+nPcy1NMyKWQt4ZTRVsncDwvQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 12b66334-63c3-42be-5b8c-08df1ecde2dd
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 08:36:13.4817 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tOwo9ochXjNu71nd+nhI/2/QA+0zMFpWvkA/uvdiQODpmGpnQ1KGTIkrJgkVOieWhHEkAFNmpM1xNOFZQaTeVOMhkUXcNVY07lIu5oYUvcw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4842
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

--------------UAHMwOV09PsXZAndcwdPpA3W
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 28-09-2026 02:51 pm, Dnyaneshwar Bhadane wrote:
> Replace xe_tile_sriov_err() with xe_log_err() using the LMTT component
> tag for LMTT and MERT invalidation failures, preserving the SR-IOV
> prefix in the log message.
>
> v2:
> - Drop logging error type in log (Mallesh)
>
> Signed-off-by: Dnyaneshwar Bhadane<dnyaneshwar.bhadane@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_lmtt.c | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_lmtt.c b/drivers/gpu/drm/xe/xe_lmtt.c
> index 0c726eda9390..fe77b3ec0680 100644
> --- a/drivers/gpu/drm/xe/xe_lmtt.c
> +++ b/drivers/gpu/drm/xe/xe_lmtt.c
> @@ -14,6 +14,7 @@
>   #include "xe_bo.h"
>   #include "xe_tlb_inval.h"
>   #include "xe_lmtt.h"
> +#include "xe_log.h"
>   #include "xe_map.h"
>   #include "xe_mert.h"
>   #include "xe_mmio.h"
> @@ -302,14 +303,15 @@ void xe_lmtt_invalidate_hw(struct xe_lmtt *lmtt)
>   
>   	err = lmtt_invalidate_hw(lmtt);
>   	if (err)
> -		xe_tile_sriov_err(tile, "LMTT invalidation failed (%pe)",
> -				  ERR_PTR(err));
> +		xe_log_err(tile, LMTT, err, "%s invalidation failed.",
Add trailing newline
> +			   xe_sriov_printk_prefix(xe));
hmm, We see lmtt_assert(lmtt, IS_SRIOV_PF(xe)); beginning of function, 
please check xe_sriov_printk_prefix? right.
>
>   	if (xe_device_has_mert(xe) && xe_tile_is_root(tile)) {
>   		err = xe_mert_invalidate_lmtt(xe);
>   		if (err)
> -			xe_tile_sriov_err(tile, "MERT LMTT invalidation failed (%pe)",
> -					  ERR_PTR(err));
> +			xe_log_err(tile, LMTT, err,
> +				   "%s MERT invalidation failed.\n",
> +				   xe_sriov_printk_prefix(xe));
ditto
>   	}
>   }
>   
--------------UAHMwOV09PsXZAndcwdPpA3W
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 28-09-2026 02:51 pm, Dnyaneshwar
      Bhadane wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260928092114.1610203-11-dnyaneshwar.bhadane@intel.com">
      <pre wrap="" class="moz-quote-pre">Replace xe_tile_sriov_err() with xe_log_err() using the LMTT component
tag for LMTT and MERT invalidation failures, preserving the SR-IOV
prefix in the log message.

v2:
- Drop logging error type in log (Mallesh)

Signed-off-by: Dnyaneshwar Bhadane <a class="moz-txt-link-rfc2396E" href="mailto:dnyaneshwar.bhadane@intel.com">&lt;dnyaneshwar.bhadane@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_lmtt.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_lmtt.c b/drivers/gpu/drm/xe/xe_lmtt.c
index 0c726eda9390..fe77b3ec0680 100644
--- a/drivers/gpu/drm/xe/xe_lmtt.c
+++ b/drivers/gpu/drm/xe/xe_lmtt.c
@@ -14,6 +14,7 @@
 #include &quot;xe_bo.h&quot;
 #include &quot;xe_tlb_inval.h&quot;
 #include &quot;xe_lmtt.h&quot;
+#include &quot;xe_log.h&quot;
 #include &quot;xe_map.h&quot;
 #include &quot;xe_mert.h&quot;
 #include &quot;xe_mmio.h&quot;
@@ -302,14 +303,15 @@ void xe_lmtt_invalidate_hw(struct xe_lmtt *lmtt)
 
 	err = lmtt_invalidate_hw(lmtt);
 	if (err)
-		xe_tile_sriov_err(tile, &quot;LMTT invalidation failed (%pe)&quot;,
-				  ERR_PTR(err));
+		xe_log_err(tile, LMTT, err, &quot;%s invalidation failed.&quot;,</pre>
    </blockquote>
    Add trailing newline
    <blockquote type="cite" cite="mid:20260928092114.1610203-11-dnyaneshwar.bhadane@intel.com">
      <pre wrap="" class="moz-quote-pre">
+			   xe_sriov_printk_prefix(xe));</pre>
    </blockquote>
    hmm, We see lmtt_assert(lmtt, IS_SRIOV_PF(xe)); beginning of
    function,&nbsp;&nbsp;<span style="white-space: pre-wrap">please check xe_sriov_printk_prefix? right.</span>
    <blockquote type="cite" cite="mid:20260928092114.1610203-11-dnyaneshwar.bhadane@intel.com">
      <pre wrap="" class="moz-quote-pre">

 	if (xe_device_has_mert(xe) &amp;&amp; xe_tile_is_root(tile)) {
 		err = xe_mert_invalidate_lmtt(xe);
 		if (err)
-			xe_tile_sriov_err(tile, &quot;MERT LMTT invalidation failed (%pe)&quot;,
-					  ERR_PTR(err));
+			xe_log_err(tile, LMTT, err,
+				   &quot;%s MERT invalidation failed.\n&quot;,
+				   xe_sriov_printk_prefix(xe));</pre>
    </blockquote>
    ditto
    <blockquote type="cite" cite="mid:20260928092114.1610203-11-dnyaneshwar.bhadane@intel.com">
      <pre wrap="" class="moz-quote-pre">
 	}
 }
 
</pre>
    </blockquote>
  </body>
</html>

--------------UAHMwOV09PsXZAndcwdPpA3W--
