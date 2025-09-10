Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3209CCA101F
	for <intel-xe@archiver.kernel.org>; Wed, 10 Sep 2025 18:52:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8B8610E9BF;
	Wed, 10 Sep 2025 18:52:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XqFQRVUx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA1D510E9BF
 for <Intel-Xe@lists.freedesktop.org>; Wed, 10 Sep 2025 18:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757530354; x=1789066354;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=owNi6R45klG7kLJfOrUfJPqAeKhiQEJSBsbnhMINAyE=;
 b=XqFQRVUxFpqPNg0nDZriDr24uhBwvvNfCSWQNPfiaUokB0bc/1Vfki07
 zcVydpUJaYrUXXVwPpAdjdifzW4340uvaFcRSgTkfOA6oRBlNLsx2LcNU
 vt3tJUQxcOggqS7kLmaSHz1EDJBWzulg7a0j0rn/2vdECvTlmEEf7FS1g
 O544tUPOuTu3A4bUbgZDhQZJdgWcwjiMgGZioMRz4eJ2Sb6DPrjIE1Whg
 7lccx6x3GJSecCpyLwUQQWqoM8+eskwGP75Zc3CsOPFxq51AJZW/A5UhN
 nErg4iH74IR81uCkRFEY4NNJChizwks3sTcW5qYmS1uoRkUKvMc2MLadM g==;
X-CSE-ConnectionGUID: cRrg5L3QTJi5TBTp/RpHmA==
X-CSE-MsgGUID: wNUj/wWcSu+9WxhK2Ow0DQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="59996486"
X-IronPort-AV: E=Sophos;i="6.18,255,1751266800"; d="scan'208";a="59996486"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 11:52:33 -0700
X-CSE-ConnectionGUID: aWmswnz/TsGwxAgVN4EqFA==
X-CSE-MsgGUID: BoYY47PAQ02x/PZvrOg7tQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,255,1751266800"; d="scan'208";a="173327089"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 11:52:32 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 11:52:31 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 10 Sep 2025 11:52:31 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.53) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 11:52:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dl6ORlFePLqImOtod8auyKldSCIqY8DoGrhAgJAbtIKiHqVoaTuKou1N6eEoGI28ig1FqnNwCModlVt3msDDmfo9xbUldl0HIDibsq5ARCrPbYKlqE0hi9iLn3IB+D8nWK80U2ZUlTldZxIxbMWnLinHUUlJ9mF9tXN9SfmLRfdp6r0wI4S+fJuucIYCiMMp9oUsAGnyJXBnjRLhLBYYZutAdJdI4O6KQmmLfNr6HO+0UABpbLBcMes2/1FM0Wf0+9yN3M+SrofB7Csbp9vIC7Z9DgxsrQ+J/QPSkL5UuoUN+yEUNYaJ8dX7zsBrP2HcSQDwvyHc8iaPQXU0ATzQ7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JyDWgfn0zDHIqyjB8vsAmQrOyFb3kP1b6zSiZnfbII8=;
 b=XVTldG+VNOCt2FhItzmVEtMDFi32uO6TTS1cHoLBdmH9TIU3lFdh2lDlBsH7x+Ufl+0QDt3i+ZhOilVQV8tpVVPxTJ9ysyIU/cS5h6JBZ0wpKLFYf5w9VzlueMhNLo0sy8qRtAuLhEx71VRZ8UJkHItgfwzd1gmsBNzvzehzlCcBK8yT4s9KJ53iDTKiMq7q1ikR3nQuN3Ee2y5aBQSjkBnbORrcg+zzEfcrHo9hInAgs4PPY1DquX3wdCKHiDUEZvjcIne/uv/9j8urX8gY+Vy5G0ESP1ztX0oYLl/iftSVMtZFbwIYsomAigR9W2NZcIL5FXjF7FoQXqxRSqbbFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6391.namprd11.prod.outlook.com (2603:10b6:930:38::21)
 by CH3PR11MB8362.namprd11.prod.outlook.com (2603:10b6:610:175::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 18:52:28 +0000
Received: from CY5PR11MB6391.namprd11.prod.outlook.com
 ([fe80::d1d5:6fa6:9a2d:92e2]) by CY5PR11MB6391.namprd11.prod.outlook.com
 ([fe80::d1d5:6fa6:9a2d:92e2%5]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 18:52:28 +0000
Message-ID: <fcbe0071-82de-4fef-b77a-a1c0f90e80ca@intel.com>
Date: Wed, 10 Sep 2025 11:52:26 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/guc: Return an error code if the GuC load fails
To: "Summers, Stuart" <stuart.summers@intel.com>,
 "Intel-Xe@Lists.FreeDesktop.Org" <Intel-Xe@Lists.FreeDesktop.Org>
CC: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
References: <20250909224132.536320-1-John.C.Harrison@Intel.com>
 <9e8460e70cefba27f70a4cfba9f33c58159f4203.camel@intel.com>
Content-Language: en-US
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <9e8460e70cefba27f70a4cfba9f33c58159f4203.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0007.namprd03.prod.outlook.com
 (2603:10b6:303:8f::12) To CY5PR11MB6391.namprd11.prod.outlook.com
 (2603:10b6:930:38::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6391:EE_|CH3PR11MB8362:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f69e0c2-44e0-4689-ade4-08ddf09b306e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bm5uSU82MXBDb25UMDRPZzRKTEsxUzU0QnM2d3VVdFdMSXMxZkp0WEp0STZm?=
 =?utf-8?B?NVEvMUNwc0MvRU1RbmRYVHIweXd0MS9SNzhoNjI5dUZXT3M2Q1FQSHJqZ295?=
 =?utf-8?B?UzZFazl6UFphRWZ4YzVrMzFXYTZ2OHNleVhUL0cxZ2h4M1dBUVZDR1pReGNy?=
 =?utf-8?B?YVlhd1dKNWhndnRVL3JUYVpqRFMzZTZicFFKWkZMZHUxT0p5SW14em1FRUJr?=
 =?utf-8?B?MmxRLzFkc1RrSE44UFZ4SmthUkRoUGxlL1U3Yy9BZVJsK3FDT1A4TDViMGNO?=
 =?utf-8?B?aFpBUTNqK3V2blRWWnIyZ1JySHlSYmJHRU1aVTRuZ0VKNDdXSUpCTnlJaGVi?=
 =?utf-8?B?ZHorKzdLOHY1cCs1a1FYd1hhYTIyOTl0cjBjMVl4dFlJTkowekNkamRzbWw1?=
 =?utf-8?B?ZHpXV042bXZkcUkzeVpKUjZHQkd1dW93N0s0VE1rQ1RjbGdMT1FOSXVuMEJC?=
 =?utf-8?B?aTl4OGR4ZDNhZlV0ZTlkRUxZTExKMFR2cUFRbkVHU1pVNXRZOURIU0RjQlAx?=
 =?utf-8?B?QUY0Qy9CK2JLVUcveUtSZVBFcjRQRFdBY0lMUmx0Ym1IMFdRNmx2aG9PZ2tN?=
 =?utf-8?B?WkN0cUE2RGtZYkNxcGFvYnpoNUhpRFJXK0VDejdYSTZ3dUtOYSt5anQ5TEgx?=
 =?utf-8?B?aUpJc1JBODFLdE91ZlNmb1hsMU9sOFBwTlBaMi9ZSGVnMmdod0tOQ2lrSFBN?=
 =?utf-8?B?bStPWndrYVkxYmc5Q0N5UFZ3eG1CVnFlcS8rYldwemFTVnJQNFU1Y1VkSVdO?=
 =?utf-8?B?S2htTFA4ZDFKNmx5RnB2Uy8rcGV1blg2czRiSlVITkhnckV2a0d0am1iWE9T?=
 =?utf-8?B?WFdpQUZRTjljL1FyQ2NUS1A3VVNYY2s5MEFsSzBYUmgrUGpwWW9YdHpoWWZE?=
 =?utf-8?B?Wm9LNDFEMFlMeTlpMTR2eVFYS0lwVHhPOUJTR04ydzFqc1lac1FOdmhTNTcx?=
 =?utf-8?B?RkRiQXA3LzQ1cUpGNTBXSXZHN05ITEtSQkxxeHhaWlVwdkRTeG5WbWVJU3dv?=
 =?utf-8?B?MHdTbnBvRjZHNUxYNFJEQnBRTmF2NEYzWjFmcmxyZ1lRT3NNVHJmZWV5VWc3?=
 =?utf-8?B?RllXVThZR3M1RXJNKzYwYmhrTjhoRkZoSmV0VjdweU1RcTlvVFM2NXRIdTl1?=
 =?utf-8?B?ZFFVZWh3TjVzRzBkQVhrOW5nVnVBclBTTk9zZnMzY0dEUlBzL29YdDFKUjdq?=
 =?utf-8?B?Y0U4VEdaeEVWcEVKYmx5UGlQMFFSYTlJZWtRYnQzSUkzUjJWR0NiYTlmNVVC?=
 =?utf-8?B?ZUo5amZ4RW1TMUZCOFJrekttZ0dvZ01QeGNLSnJOVTE2TXFuUDRhYVhJYXJ5?=
 =?utf-8?B?QWF4N3R3bzExUnNuY2Z1RlJoOUVMZHNxZVNlbVZWdVpraXNIMS93Rk1VSVZ3?=
 =?utf-8?B?a3g5MHJhTEJ4M1lvcHNRMFBUejdhRVJSQ1gzQzJaTms3Nk9BakFTQVdYQ3Bo?=
 =?utf-8?B?Q0tnL0RMcGREb3ZPenZpbHZ1NHFmNUh4TUJjZ1JIQ1QyNmM3V3N4WHdNUS93?=
 =?utf-8?B?ODk1WlkrUHdPbzk3bGZMNzRNcHo2Ymh2dzAyYlZsTkJlNVR3dWlaaFphSFlO?=
 =?utf-8?B?QjBtbDNXS0JmTFErWEFXY201YTBsYVB0TDZnTDd3aDkwR25VMm9MRUdFZXoy?=
 =?utf-8?B?Yytmd25teHF0R2VEK1dlQnJTcndhZmlWdmN1NE1sd0RGSU93alBidzBHekpD?=
 =?utf-8?B?dGRtWFcweXFwWU5CSGprN2ZEYk4xS0cyZGV1c0NUekZPUGpsL0JKZ2duM0h2?=
 =?utf-8?B?RFFtcXMvVHNlaGl4ckxmbmFZM0tsVVhOcFZ0VnY1NnBrUmFVM2dwbmYxT1Rk?=
 =?utf-8?B?RXNORjF4dmtucTlNbitjbzdKYnpYVTQ5NWxqYVpLU1VIQjd4eS9ualVTTkpJ?=
 =?utf-8?B?aGJSR0NPYi92Z2ZUZktjSHZ3RXFQTko3Y0lQUnpUNVh6Q0d1RTRtZ0hoQ1VH?=
 =?utf-8?Q?YWBF8AWvkPE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6391.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S3UvNkxXUndBZ3h5dGZ3VGMwWFNnN09wV0M3NXpMbjNKYXcrQ3VqMU5GUFA5?=
 =?utf-8?B?eE1xQnRrUWt2VVpDL1hkaDA4RjRYN2RQQ3laZTB5bU80Q0NCUVovQTFXMmo2?=
 =?utf-8?B?WDFrN0JodFFCbHVEeGtoWU1LR0xlT3ZDUDlpVWVlVkJrVzEvMUg4VzhUOTdJ?=
 =?utf-8?B?UzV2cmxvWnRQSmIyUkxGQ28zQzJ0Tit4YzM1ZCt0bGVXbmJlNW94WUdvdHFQ?=
 =?utf-8?B?TXIxdTk5TkdPZ1dCd1gxQWJ4L1AreDhXQ1pnaVQ3SDEvVHpHcHAwRmdwSklQ?=
 =?utf-8?B?dG5ISm13bWJORHhVcjVUU29FN2FVbXp1ZzROcDY4a0wxS2xBRGRuenlENUhP?=
 =?utf-8?B?aEhkNU5odUZ4RWFDNjdDWE56QjNQTE1IYmRuNkhqUktlMGRwV1I4YWVIa2FU?=
 =?utf-8?B?QTFzWGsyRVRhNUh1ZmZ6TkVwK0tjV2hlZWYrM3FraXNiVXNQT2kxT0dEbzJO?=
 =?utf-8?B?RVdZTklSS0g2UWNrR2RhZUVMdWZ0QWtaa29KUWNMeit2OTZURzRPNTNGV3NN?=
 =?utf-8?B?L2RzM091WnpzY2RCM0diakt3NFNMMmZrUVJKVlE5UHpPaUNlQktET3dVRFAx?=
 =?utf-8?B?czNVU0hZRnBEbjMxb3JTY3pqK0JNYnN3TEU4cU42d2R6eUVwWEZqNHFhdmNG?=
 =?utf-8?B?QUJsQnRFMXQrT01BQzhBelczQVI5TnkySVhLZGNYb2RrRllKVGpLZjQ0T3hL?=
 =?utf-8?B?UDdJV0k4SmxRZ3VjOEROcG03T0IyNHU1OXFpamtZc3lmK0pvejZTdHhmVktQ?=
 =?utf-8?B?bTVaQWpodlprZEtZdEFCb3ZRbHFlSHJZUFcwWWV3UVJFMkdqSmRwSXF4ODZz?=
 =?utf-8?B?eTRuMVZJUjVpS2o1YTVlY0pUVGdLQnJRZE5SN2xuaW50ZlpKdFZyT1lJWXpt?=
 =?utf-8?B?a21RMWl6UHdFSURmYjRIQjhoWmpjV3ZmdG9qRlRDcmxvWGs1d2JXUXJYeFhx?=
 =?utf-8?B?cm0yMUY3VmlpNUxVb1UrbEFvL1EvN1hKenlXUzR6SDlleVJ1UldLVXNQakFZ?=
 =?utf-8?B?WnlYMmMrV1A3MlgxajUxZlJVMFFnaWk5MlpIUFZqTm1BTE41UkJQTkpNbnlo?=
 =?utf-8?B?L21DK0c2TDI2NWFJSFFHclhLU0RwdjZwUi9HZUF2MlhlYWJoem1HSnZ1VEsy?=
 =?utf-8?B?V1RLT2hJSHE5RUlxSVh2a1NxS1ZNZE9icGErNFdKNzBCcXJ2bHgyOHptTkY5?=
 =?utf-8?B?a2ZQQnRGZXZwQ1RCRmhXR2ZPOTRYbnNqQmgrS3FFbVIyUU5HNFBSTXE5aXls?=
 =?utf-8?B?VklIQWhBY3JDKzROK2pFbGthZnVBTE8vNmcyOXBYMXVkdE0xUFNTc3lNNnJm?=
 =?utf-8?B?R2NuOEU0Qnd6cnB6dFBGc0xWOTNRa1REdlFHS2thMnFoZkhFMnVVM21NRFd0?=
 =?utf-8?B?ZXNJTUZWVEpNTEJEWFJXRkNsdWpKbGFsUTh1TFkxcS96M2NnUnBxanlQalYx?=
 =?utf-8?B?RCt1YlFTU1R5V05xaGRZK2IrbldWZkUzU1BUUHBkS1YxUHZLNDZaSkxqVndL?=
 =?utf-8?B?WjBFa2FRbFAxUHpTdkVKbS8xOElZaWVVbmlUUG9tK210VklBZ2xFSWNlbHZN?=
 =?utf-8?B?UXJ0VGo5T0hQTXJZZDcwMXVDQVZLNUNEdE1GS0tqVFNsaFZvT0J3ZW9ZTWtR?=
 =?utf-8?B?YUtRaU1iekxVeW5MaXhxWGxSZ3JVdUlrS3llU2djY1psdWZLNW9KQllIaTkx?=
 =?utf-8?B?YWRBRk44Zzlyc09EK1hYd1VPVWVSbWpIeVFCRUx0R05WZUFpQ0RUMVJ5aTU1?=
 =?utf-8?B?Ry9kbG1ENTVHSzBidTdLVmtCd0laemovTnhhUXFTTjczWWl2aGFCendyeHRx?=
 =?utf-8?B?TnRidmovVlBES1Rwc2Z2RkxHQmJoM1VFZkw2RkJyUjdHM3RlSVU4a1NzVmpP?=
 =?utf-8?B?TDJMMU15WmIwTmZTTDBYWEJNQ3lYOGhuVUt2UmllaFFaYnlJMStCRSttNXVT?=
 =?utf-8?B?aTBrQ0puK0pFMXAyVUpFYmp5OHNONDJ1Z1JuOHFWSkkzSGU4ZXdCeXFKM015?=
 =?utf-8?B?TlNreDRJRHFLQUhYdUV2NENHNXBpZTFhNXFyYlIrbC9MMEZzMllVQXEvdExt?=
 =?utf-8?B?MlBqYWZROC9GbVpOV2ZNSXNWd1dTM0VwZXVzekVLdWdqVjBRVVkrQjRUaUJw?=
 =?utf-8?B?Z1dYUWwvMk9iWnJYTE1KNWFoVVM5dUtRbmFxVlpLN0RET0JlZlJLSnlpQmJx?=
 =?utf-8?B?d3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f69e0c2-44e0-4689-ade4-08ddf09b306e
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6391.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 18:52:28.1519 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bjO05/cLh3wnTpfRnKGy8ynUG7QLl6krUvO2xy+/vBIr3AAMxfz6ASkUYnNVWF2I93NYAPBioix9lYQ+wthcppr/4O4bep+Mi+ILFiFYquA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8362
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

On 9/10/2025 11:02 AM, Summers, Stuart wrote:
> On Tue, 2025-09-09 at 15:41 -0700, John.C.Harrison@Intel.com wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> Due to multiple explosion issues in the early days of the Xe driver,
>> the GuC load was hacked to never return a failure. That prevented
>> kernel panics and such initially, but now all it achieves is creating
>> more confusing errors when the driver tries to submit commands to a
>> GuC it already knows is not there. So fix that up.
>>
>> As a stop-gap and to help with debug of load failures due to invalid
>> GuC init params, a wedge call had been added to the inner GuC load
>> function. The reason being that it leaves the GuC log accessible via
>> debugfs. However, for an end user, simply aborting the module load is
>> much cleaner than wedging and trying to continue. The wedge blocks
>> user submissions but it seems that various bits of the driver itself
>> still try to submit to a dead GuC and lots of subsequent errors
>> occur.
>> And with regards to developers debugging why their particular code
>> change is being rejected by the GuC, it is trivial to either add the
>> wedge back in and hack the return code to zero again or to just do a
>> GuC log dump to dmesg.
>>
>> v2: Add support for error injection testing and drop the now
>> redundant
>> wedge call.
>>
>> CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc.c | 13 +++++++++----
>>   1 file changed, 9 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc.c
>> b/drivers/gpu/drm/xe/xe_guc.c
>> index e56c9c5c8845..5aa7289cc83e 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>> @@ -1057,7 +1057,7 @@ static s32 guc_pc_get_cur_freq(struct xe_guc_pc
>> *guc_pc)
>>   #endif
>>   #define GUC_LOAD_TIME_WARN_MS      200
>>   
>> -static void guc_wait_ucode(struct xe_guc *guc)
>> +static int guc_wait_ucode(struct xe_guc *guc)
>>   {
>>          struct xe_gt *gt = guc_to_gt(guc);
>>          struct xe_mmio *mmio = &gt->mmio;
>> @@ -1164,7 +1164,7 @@ static void guc_wait_ucode(struct xe_guc *guc)
>>                          break;
>>                  }
>>   
>> -               xe_device_declare_wedged(gt_to_xe(gt));
>> +               return -EPROTO;
> If we error out here instead of wedge would it be better to add some
> default cases to the bootrom and ukernel switch statements above so we
> make sure to catch/notify of unexpected errors rather than just return
> the protocol error?
Not following.

The switch statement is just about decoding common state values into 
human readable messages. Each case is literally: 'case X: xe_gt_err("X 
happened"); break;'. And immediately before the switches is a 
xe_gt_err("0x%X happened") to give the raw register values. If 
'load_done != 1', i.e. we have got into this block of code, then the GuC 
load failed and the driver load needs to abort. Hence, the return is 
guaranteed to be EPROTO and the only question is what useful messages 
can we print first.

John.

> Thanks,
> Stuart
>
>>          } else if (delta_ms > GUC_LOAD_TIME_WARN_MS) {
>>                  xe_gt_warn(gt, "excessive init time: %lldms! [status
>> = 0x%08X, timeouts = %d]\n",
>>                             delta_ms, status, count);
>> @@ -1176,7 +1176,10 @@ static void guc_wait_ucode(struct xe_guc *guc)
>>                            delta_ms, xe_guc_pc_get_act_freq(guc_pc),
>> guc_pc_get_cur_freq(guc_pc),
>>                            before_freq, status, count);
>>          }
>> +
>> +       return 0;
>>   }
>> +ALLOW_ERROR_INJECTION(guc_wait_ucode, ERRNO);
>>   
>>   static int __xe_guc_upload(struct xe_guc *guc)
>>   {
>> @@ -1208,14 +1211,16 @@ static int __xe_guc_upload(struct xe_guc
>> *guc)
>>                  goto out;
>>   
>>          /* Wait for authentication */
>> -       guc_wait_ucode(guc);
>> +       ret = guc_wait_ucode(guc);
>> +       if (ret)
>> +               goto out;
>>   
>>          xe_uc_fw_change_status(&guc->fw, XE_UC_FIRMWARE_RUNNING);
>>          return 0;
>>   
>>   out:
>>          xe_uc_fw_change_status(&guc->fw, XE_UC_FIRMWARE_LOAD_FAIL);
>> -       return 0        /* FIXME: ret, don't want to stop load
>> currently */;
>> +       return ret;
>>   }
>>   
>>   static int vf_guc_min_load_for_hwconfig(struct xe_guc *guc)

