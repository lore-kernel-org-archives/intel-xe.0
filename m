Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3304C3ABC0
	for <intel-xe@archiver.kernel.org>; Thu,  8 May 2025 05:59:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C7E310E32E;
	Thu,  8 May 2025 05:59:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KhZNcNYR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6C4B10E32E
 for <intel-xe@lists.freedesktop.org>; Thu,  8 May 2025 05:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746683939; x=1778219939;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dSI/xyFbdfYJi3MRvJcaWOqSQysA2bzoctG44AVbhY0=;
 b=KhZNcNYRA8fLL8l/GnKmxj5ny4xwP5MIcr90xDm4InjvHmBwpzzN+sD5
 IP1vYrMos7k7MLV0cFCVrbd7SKBYD9FO5XYBoB5ekPs0Bg/vL66iY1Gx+
 RkufxTEtl9IIqHGasYECy8ickkl7Cch/s+8jatBQGOUqmYciv392JvN1N
 Axb7lzQMWzxADz/I6+z972cDS7Bdfx+hZwhOudyW65ON79K31+/NidWfh
 y5w6QN2Aoum3zoB1qat6vje8HLsrY27K+gi4JYRTR74CFyIj7u6UX1JHc
 BJTM8Y0kwKbgw6C7nm1Dp/N0BR+O5YmhZqbEvP+sg1qagxdtkjStMi7zC w==;
X-CSE-ConnectionGUID: vUk8+raHTaqC4yeAWTqrgg==
X-CSE-MsgGUID: i4zD1G+7RvCffeBW2H3aDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="48355962"
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; d="scan'208";a="48355962"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 22:58:57 -0700
X-CSE-ConnectionGUID: kLHjcpHIQz6PpeVUtBkhww==
X-CSE-MsgGUID: veeil7XZSoWVixT6yXIEXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; d="scan'208";a="173394957"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 22:58:57 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 7 May 2025 22:58:56 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 7 May 2025 22:58:56 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 7 May 2025 22:58:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u2fch1eLh+b5Zd/Us8qNug7zeIeSGRp5cqC+Qek5X4hAsURgXBh0QYgwu8huIb9/HRVR/hLCRZ5JHpyrkc8RMKWiADcYZdl6jRmbAFZM+QWevPc61FIXUQ3JRCuS3dX3Rtc1N24epuBag42AEsMeDtNtfd5JCDTcDY+0BO9RhiTrTa1bV9HRELd78wDPD0GbewYVEuuyKVtNVfabtlMPrJ+0/CCiO9gMBlKQitB6RiIwJNkNUEvh0+lzYpqP8DffV8Qdx3TKB3QVzVg6h9y389Xtkhx0dyr4gqcf3mOZQRhA80hqJ8LuiINaXQZj8EBsu4KyeYXBNixfk6p7l/guNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JNSyBXbE8BVuqvwh2sGwHdWKstGCHDVpkKF0TQcs/Lc=;
 b=QFnOO7FaCm4w+/G9DvSi9bEQe64iziNVPmSdhjyZLQU7aJKdqvY4d23yhlophh/1SN3UN+DfDjHtp88SI6T0OkZvnhw8CNR1Lvh15S377Tb/63N6YzdTw57zXXr5HDQcLQ9GgtU6aXlVSfwakrIfZDeg97B/VNj8tEdPU4jne2pjf+LxPDdF750Wy82EwIo5yN6i7kkifwZsByDTbAAbSMu3gCo3D6GrJBoUCkWVgKYFr1hCQ5PIcFQvT4nZreFyEq8UUTk/DukzjL1HNrN8ju8T54jhe3JwOGj6thS0AgHq/mjx4pDnA9aQsiRFDdsTgHkxSFeYrKFbTTPtnSLnnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5703.namprd11.prod.outlook.com (2603:10b6:8:22::5) by
 IA1PR11MB8786.namprd11.prod.outlook.com (2603:10b6:208:59b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Thu, 8 May
 2025 05:58:35 +0000
Received: from DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::f734:e507:3083:e454]) by DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::f734:e507:3083:e454%4]) with mapi id 15.20.8722.020; Thu, 8 May 2025
 05:58:35 +0000
Message-ID: <dfd48f5d-3238-469f-837e-8df09176a81a@intel.com>
Date: Thu, 8 May 2025 11:28:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/xe/pm: Wait for lmem ready in resume
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <rodrigo.vivi@intel.com>
References: <20250410110057.2497056-1-karthik.poosa@intel.com>
 <jg7x5qtyoo6grpdxlrlulao6dzfbabt5gp5pqtkmzftrpr5c3x@qwv6ori524k3>
Content-Language: en-GB
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <jg7x5qtyoo6grpdxlrlulao6dzfbabt5gp5pqtkmzftrpr5c3x@qwv6ori524k3>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0078.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::20) To DM8PR11MB5703.namprd11.prod.outlook.com
 (2603:10b6:8:22::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5703:EE_|IA1PR11MB8786:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ee7544d-7e62-4648-1704-08dd8df55ec1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MW9ia2JQZ0FlMG9JOTFoeFNvc1BsZVhqc1Yrd1RDdjUvTVpNb1FiUjFyWm1j?=
 =?utf-8?B?aEFVdHREK096TnVmN1VTQndTQlp1cGRFV1gvTXlkWGM2WEtiR0E5TlFSZm8x?=
 =?utf-8?B?b3dqSHRLa2daZzNRdTYrSU9KM0dlTVErdEZ5SzQrYW9aYzNOSGV0VEZXZU80?=
 =?utf-8?B?YVFyK1lKaUhnOTQwbGl5REx6OHBVR3BFT2d3dXF6UlM3WmN5VlFFeDJxM0NW?=
 =?utf-8?B?eTIwajZHWnFiWE1iTDNHZmFjVU81b25QcFNFRldubzBwNzRqT3YrVE5MekNn?=
 =?utf-8?B?RzNIQXhWNkxvVmJJWlJOa28vWHQzWkV5MlBqNldhOXZSL09ZUThPWmVPZEd2?=
 =?utf-8?B?V1hxaUYxc3l3RUZwT0ZndS9ZazU5ZGlQVDV6SDNFSGlkdDl0NGFLK2hJdE9F?=
 =?utf-8?B?RmpkYllPVHI3SURob045OC9rM3pRbEFLei9tWWxMa1YzTy9sazRCQTJrRGVr?=
 =?utf-8?B?YU9lU2YzMUxOYmgxaUJhdVV1MHpXR2lYd29Sa05wQTgzWi8wYTZ3VkQ0SWdv?=
 =?utf-8?B?NDZqWVZiNGYvZ3FmbXd6SWZtUGtlL0NKMTlqUVhPY0xGdklibnUzM1hZNngy?=
 =?utf-8?B?c1lyY0tOZ3FEakZ2dUg1Z3VlZlF6bWNNYVlnblpROHQxVURZNmhNb3RDTktl?=
 =?utf-8?B?RVdkemQzQXJKMGFXRlJsSE9xckExVmdCS2xhdGZmYnpzM2JIMzhuak5xNGhB?=
 =?utf-8?B?ZWdNcDhtK1hKVGYzdjdCbFhwMHdNNlNveUZ5SjFvZ1IrVGtiZ2paR0JOWVVq?=
 =?utf-8?B?Y3huL05mZml6b3Z4VDNpV1JUZ2xlWkcvNHNxZ0RqSVBkN2Q2SmJkdnZrRTRD?=
 =?utf-8?B?VUdpdnBKVUFUNmh5MFJtUTJxRm1RSGZMZlBxeC9wMFhTT3hRU0FaSndFTHVI?=
 =?utf-8?B?TndaOGY4VGswUC9aRlBuU0xqalpLZFUxQ090VUxaT29qRVBSR0dCVkVDYzVF?=
 =?utf-8?B?VGp0NG02eTBKS05YcVlsa0J1NjV4RGdlMCsvSjhmTTZtQWovb3hlK2Y2Mmw4?=
 =?utf-8?B?WDFiRFFKcExnOUhRcXBnZGNvajBnbkdldFlWM2U5NkNFOWRHV0ZVV2ZIKy9m?=
 =?utf-8?B?SnRXSDV0M3doRkxkM3JOMSs2Q0UwUnVJNmRHZTlaT0FtVi9tNG1sWUVVaG9Y?=
 =?utf-8?B?RFpqL3E2VXVOVVBnUlRVWHlJSmg0YVRzd1ArbTRLMnVrNzc0ZFpUdTZVQ0NL?=
 =?utf-8?B?WDFORnk0bExkcGZlNEJKdEFJLzJlRHdJaG1tNWNQeGZuanQ2ME1tdkV6OGVL?=
 =?utf-8?B?ZlJKbm1HS0dFREsvbnN2NzI0N0dsa1VGUmxJOXQwbjBrRzJUelFKZlROUGMv?=
 =?utf-8?B?MDd6S1pEZ1J5MTExRitIRXdQK0NWcFg5U2l5STNUdEVMREFUM25xWUhtRGtz?=
 =?utf-8?B?dzl2NVNESkZZbHEvTllXODI3YTdUS3RWNmtkQk1PbFQwSXByRXlJNXdpNlMx?=
 =?utf-8?B?RFVtK3A0UlN6dlFPcUJQM2xyaUlRaHdBbXNraXN5YUw2Nmo0QXB6TmFzb3ov?=
 =?utf-8?B?aWZaSGRHWmJmMlJ5WWVjeklQcFRkQkQ1RE9ZdXJsUmluWndMUVFnRUo5SGM2?=
 =?utf-8?B?d0Y5QTJKc3ZQVEVVN2ZtdTd4TXdIZndkWUJNa0tKOU9aUkVBS2hoRGZ4cUdB?=
 =?utf-8?B?NHJSZ3BrQWZGdjlIVEtuZzJZZWkvZ0lUY3ZNTnlEQlFMMFZmU0ljU3RvQnZ5?=
 =?utf-8?B?c2FmZFgrSFIyL09SZlhuYldrT3Vnd1FxZXg4SFpqYmNqeWZvdUE0d1BVTmg3?=
 =?utf-8?B?Ykwva0xnMStEMjBJcWN6YXNXcmhaOWcwNlVsNmNwdTkvTWpWRE0rcUU0Vy9k?=
 =?utf-8?B?U3k5allHL1E2RlovRGNxZ1lseXJCdXN4aTNtR3BjanRzNis0MjN0cUU0SEJV?=
 =?utf-8?B?SDFEU1J5R1BJVExqSFhvSytCcmgxSDU0UGcvRE9DNDlLSFJKRXdWZStKUlZx?=
 =?utf-8?Q?aywftnkNbdI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5703.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MXpDTWhyUzZQQ21GMkFZMnZwUmpuTlB6c1M2TTF2SjZlSzFvV3Vwb05DLzZO?=
 =?utf-8?B?SWttK0RpZ3lWKzVZZEtXOEZGd0ZYRWpuTUVSMzJDdlIvL01GUloySjJpc0l2?=
 =?utf-8?B?cjZURWxIeHFJNDQ0d1ZSV1dyQ055T1lHR0xwQ1hXVzI5VU1VTW5BQWlsblh1?=
 =?utf-8?B?eHJ5K1R5cVVpRFZjd1UyTzV4ZGFDQUxtSXRGRzk0d2t1UDRzOEp0dFNja2Ey?=
 =?utf-8?B?S2hQcTU3eWYrejd6aXN2M3lKdy9STk9DU3UvSCtCNkFjNFliWUVkOHpQa0hQ?=
 =?utf-8?B?MTgrRzBrc1NWb3o4WlBIM0JrSmt4cjRaUTh3eEYwT1ZCZm41Z2tmYWk0eDFL?=
 =?utf-8?B?WVZNdlBQem42dWdGVGhaU3FTNFhoUFZ4OGFoem9vdnFkeEU5Y1RxM2ZNaGZw?=
 =?utf-8?B?aGVHNEJYTXV2eU5FOGUxTSt2VnBPYlBXUEtBc2RjTDA3SkNVVmNtb1RIS3N5?=
 =?utf-8?B?OEYwdnorYnEyUENwVlQxcC9ac3h6YThKOFZpQjlOTHNoM1RmaFJuZmlKb2FP?=
 =?utf-8?B?M2RQU1JUM0hQOGlsZXJiaEdwc0EvVmM0bkZuRGhHeVBBR1VianlpTDYyQ3U2?=
 =?utf-8?B?QnBVakNFZ0tQVUZZaWZqOWRpcnBzVnFTOGNqTTRCTSttMHZHdUh2UWRxQjYy?=
 =?utf-8?B?NTNoLzFDbHc0aitJN2c4em41S3lIYmlMdnBLWkFLeS9iSjVFRVpOT3doTWow?=
 =?utf-8?B?M1JvTEtWdDZGMmhneHdQa21BbkljUjc2bGtDODdFZFkvbWtkc1BJaU12VXQ4?=
 =?utf-8?B?VGVVcTk1ZVVZODIva2tDb2IwL1pKR29BWnhvaUZMc1RTeXh5bzg2cUdFVStP?=
 =?utf-8?B?UU15RXNLV2FNdksyWmRUSkFoN2sra0RBK1QrcEdvR2tyYm9VcXY5S2NZUFJ0?=
 =?utf-8?B?ckcxR01QcjlDSjBuN3hWL21xZHpLTEFZTUJRTUQyZFFJbkNQSTRyL21UZVJH?=
 =?utf-8?B?dmJTZUVPbGhUemY4QzExZ3hMYllMUkdtRWo5dFZXcC92eGhmK3hyeWNuQ2ZE?=
 =?utf-8?B?UjVrR2RXcC9jOEgrdXI0Qmkxc0gzeW1wQmdqYmh4MjFJdUNnK3NQL2tBZFhi?=
 =?utf-8?B?aUlRelJmRS9WSWExWitiMDdzME8zZUNVNlU0c1dHR3dlbXMxK1ZoaFpTNlBF?=
 =?utf-8?B?UzBjU2JTR2QyOEJMU2x5c0FJcldONGZTVjZIU2hMSXFjazFCMDVQc01wRzB2?=
 =?utf-8?B?eTVwVUlsejZKR0s4cTVsNWlja0IzU21jQXBTVlIyM1ZPZnJpTzJYRzJVT3NZ?=
 =?utf-8?B?UStPQUNSQmxHaHRqTGtMTTlFbzNZNWFPVUxJQXFQM1ptemdURG9HN1hUdDA0?=
 =?utf-8?B?bmxaajY4NE5SYVdVbWlmNGNoOGZwaHVuQ0FrOUhoSFVYaHJqSnhldTVNbDQr?=
 =?utf-8?B?ZGlFYWNjaExYdG90aEV0ZnIxY0dXN0RKYmRsTkIyc0tzK3h1UFJFeHJSSE80?=
 =?utf-8?B?clJ0VnVNTUtPWC9xclJIZ1ZLSVRMbmtLQ3RtMDZPOE5FMnNDeEdDT3lUQkVZ?=
 =?utf-8?B?ekRSMnFvcFpkUGZhK0pHcG4rZ0VJc1AwaUl3T2Yvamt6WXNSOEZvb081SmJo?=
 =?utf-8?B?dUJkRXdwMTFzck8yM00vMGJDUzIzV0VCa216TkdHeXVmYlZoSE85WmlpYlFT?=
 =?utf-8?B?RG9VZld0N2RiTCsvcjFzck9vRzZyT29vaytHdFAvUENRK1NrZzZUMUs1Q1c3?=
 =?utf-8?B?RVhobjJoWFJMSE1CWldlcENWcXMya0ZsNUkySElHQkZyWHFtT1lDK3k4WFVw?=
 =?utf-8?B?NjNVRlJPQXJxbHVQZWptVC9wbnZvQ0VlNk9MQVp4KzN5a1ZYREpad1JzL245?=
 =?utf-8?B?SUJ0OUxrS2EwdzkrZy81cnVoNDEvN3piVVB2SDFpVUc3N0pHNDJUTS9ucDdy?=
 =?utf-8?B?bi9sNjkyNGVtZEEzbVZMazZrRmEwNDdGT3o0TW5GSzNPNnhkK09WUktVOGk1?=
 =?utf-8?B?OWVCSTdiM2V3bVhrK3QveVhrQ2dOb0FBWFh6MVpTbU94S0YrZ3owU0UxRjl4?=
 =?utf-8?B?UWt5NUxpNTZXS2R5OWNPYTFZM2w0cVh5bjBBclhNUTJnY2Y3MDZhcGlBYjE3?=
 =?utf-8?B?RjFNVDhOUENBSlUzWElrcC9DbitDYjdXUTNRUHFpN3lSZXArNUZjK2pxZzlF?=
 =?utf-8?B?VHpFRkFNaTFURk1tYUVzajFZVGwyS1Jvc1Yvdk5QOFlCVVU0U2JGSmxFbHVa?=
 =?utf-8?B?M2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ee7544d-7e62-4648-1704-08dd8df55ec1
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5703.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2025 05:58:35.6997 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D3iipot63lQyE9aKyncXRdY1A4lh8q1g25AEmO6Gj6jjgGHFWZJUJ7Pv8x1ddpmasYCy35sZmd+mdvXwoNHgqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8786
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


On 22-04-2025 21:30, Lucas De Marchi wrote:
> On Thu, Apr 10, 2025 at 04:30:57PM +0530, Karthik Poosa wrote:
>> Add wait for LMEM ready during system and runtime resume.
>> This wait is there in probe and is missing during resume.
>>
>> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>> ---
>> drivers/gpu/drm/xe/xe_device.c | 2 +-
>> drivers/gpu/drm/xe/xe_device.h | 1 +
>> drivers/gpu/drm/xe/xe_pm.c     | 8 ++++++++
>> 3 files changed, 10 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device.c 
>> b/drivers/gpu/drm/xe/xe_device.c
>> index 75e753e0a682..4c0d9eb51d1f 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -630,7 +630,7 @@ static bool verify_lmem_ready(struct xe_device *xe)
>>     return !!val;
>> }
>>
>> -static int wait_for_lmem_ready(struct xe_device *xe)
>> +int wait_for_lmem_ready(struct xe_device *xe)
>> {
>>     unsigned long timeout, start;
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device.h 
>> b/drivers/gpu/drm/xe/xe_device.h
>> index 0bc3bc8e6803..60bc92f9ab22 100644
>> --- a/drivers/gpu/drm/xe/xe_device.h
>> +++ b/drivers/gpu/drm/xe/xe_device.h
>> @@ -47,6 +47,7 @@ int xe_device_probe_early(struct xe_device *xe);
>> int xe_device_probe(struct xe_device *xe);
>> void xe_device_remove(struct xe_device *xe);
>> void xe_device_shutdown(struct xe_device *xe);
>> +int wait_for_lmem_ready(struct xe_device *xe);
>
> if you are exporting the function, please follow the naming:
> xe_device_*.
>
> However, I'm not sure this is really needed, particularly on pm runtime
> resume. At the very least it needs better explanation in the commit
> message. Do we have any known failures this is supposedly to fix?
>
> Lucas De Marchi
>
While there are no current issues without this check, it's a prudent 
measure to prevent any future problems.
>>
>> void xe_device_wmb(struct xe_device *xe);
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
>> index 4e112fbacada..2e59670660c1 100644
>> --- a/drivers/gpu/drm/xe/xe_pm.c
>> +++ b/drivers/gpu/drm/xe/xe_pm.c
>> @@ -182,6 +182,10 @@ int xe_pm_resume(struct xe_device *xe)
>>     if (err)
>>         return err;
>>
>> +    err = wait_for_lmem_ready(xe);
>> +    if (err)
>> +        goto err;
>> +
>>     xe_display_pm_resume_early(xe);
>>
>>     /*
>> @@ -478,6 +482,10 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>>         if (err)
>>             goto out;
>>
>> +        err = wait_for_lmem_ready(xe);
>> +        if (err)
>> +            goto out;
>> +
>>         xe_display_pm_resume_early(xe);
>>
>>         /*
>> -- 
>> 2.25.1
>>
