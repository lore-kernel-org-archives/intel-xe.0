Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E84A7CDE03C
	for <intel-xe@archiver.kernel.org>; Thu, 26 Sep 2024 21:48:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A715910E199;
	Thu, 26 Sep 2024 21:48:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mTF/7O9V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B05210E199
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Sep 2024 21:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727387316; x=1758923316;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VoJfPLQiIRszEsk0HmLdSbDrp4mq9ZqFNGzWHSyfCAY=;
 b=mTF/7O9V6Fwag4ACtdGivS/DnHkqMpVuFyOISawd5r49u7R9YSYAwrAS
 naLQ5as1qMadhb10nTC59beox3XtB8KNmLsPbjITamc2W3OYJzTfr0KeZ
 W3Bz75+Cji5Qm6iBHIyWIlbG90Hnq+60/4HV7SoU1NiSas+Q9POcLl/a8
 JjLPTLC5Th6K8LwSsxoRFSWFKbYmnqn8FAe3fg6UaGXf8GiC0Gq3Ivyvr
 lt0bWR7MpfFaP4APc6tXMC1PhGCdzdIzoUHMESBqqd9f3HfABoj/CZAaU
 Zy1NcxzLnBVZKYr2YoZQ1xJiJuZ3GXHfSoxeiGMPyZY3CdcyovqBbJbMt Q==;
X-CSE-ConnectionGUID: 0K8tx3VyRjCLIZmh+32o2g==
X-CSE-MsgGUID: 6pb++Ww8TZitsoeoiTGk/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="26387827"
X-IronPort-AV: E=Sophos;i="6.11,156,1725346800"; d="scan'208";a="26387827"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2024 14:48:36 -0700
X-CSE-ConnectionGUID: FMB6N/G/R9mOZ4OqoLZxSg==
X-CSE-MsgGUID: KQ1f66JMR6CdapUvIZIr5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,156,1725346800"; d="scan'208";a="95651498"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Sep 2024 14:48:35 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 26 Sep 2024 14:48:35 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 26 Sep 2024 14:48:34 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 26 Sep 2024 14:48:34 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.46) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 26 Sep 2024 14:48:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GGS87WHAiPiknIydewngaJ2bKmGkdkWXngK6enxduUSG8BaW+7iccmCAqTzjaeFMJDV9Qga7g+kHhBpMh6hdnlTJ1Q5onG7/1UtpRhILUFfBjdUeQj4KBaba3CmyFHgUWS6b6fHf1BsGQyYJrboIK71/5mYiwTvPuy60CSxKbKb0AucckHO+9Suejt2OfGaADY7WRCqk4P12RrdjWbvgfulmexuQeX74Q3pEZ2sE2+twsRQkAMVI2NaOX3UM4SzcTx8uFkCtEfjyZ2KtE8AhcDEb2RKVc4kg/rKhYFEvpySkxXRojDvM2Vw/aXMNgvKmVpNMv3tuOl9U1dKELonYtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R5TSBVQJFIssctloG6m2Ef4KhF3Ml5giFoURWmKiBVk=;
 b=uIAIQh9Y7qwbZ4EPkGUIE1mhMyOZdR5Y2kKGFiB5xV7Njha76RjTQtTyKRlsEZjIo1J/D37O7UL7hx8bDKKKPsQHlAz2lCl9WMRNVzIdgkNRLg/aM7O9N2z6h769CD4G9C4kzmhXDENgmk52OI9RVB92F7S8DOp/ezyuqj5DwtMlc2YDEl1OuEcyutki/AQx1Kgtr/VpsHiQmT8EhKvjC3keYQ6AUDmLVJiMdSjVot6IoP9U7XZTOSVXlQGz86Rrz3JWuq/13dTbTjqUbhKBjYlWdmZ/utfFKfFTqKWEpypdYOMMGOhxoQAudyApheyVDunIgdrtXlpMh8LD3NaWyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6714.namprd11.prod.outlook.com (2603:10b6:303:20f::20)
 by LV8PR11MB8680.namprd11.prod.outlook.com (2603:10b6:408:208::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Thu, 26 Sep
 2024 21:48:32 +0000
Received: from MW4PR11MB6714.namprd11.prod.outlook.com
 ([fe80::e8c7:f61:d9d6:32a2]) by MW4PR11MB6714.namprd11.prod.outlook.com
 ([fe80::e8c7:f61:d9d6:32a2%7]) with mapi id 15.20.7982.022; Thu, 26 Sep 2024
 21:48:31 +0000
Message-ID: <4e4954f4-202a-4e07-89f8-cefc7cc1b90a@intel.com>
Date: Thu, 26 Sep 2024 23:48:26 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] drm/xe/vf: Defer fixups if migrated twice fast
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>
References: <20240924202553.1541574-1-tomasz.lis@intel.com>
 <20240924202553.1541574-5-tomasz.lis@intel.com>
 <7c70dbc5-889c-4571-92c9-b8ac3ea0c9f9@intel.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <7c70dbc5-889c-4571-92c9-b8ac3ea0c9f9@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0019.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::23) To MW4PR11MB6714.namprd11.prod.outlook.com
 (2603:10b6:303:20f::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6714:EE_|LV8PR11MB8680:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d082821-7694-41af-25ef-08dcde74f6af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MFEzN2VTbU5zYWgyb3RGOHJKR09UbjhNTm84RWRYSnpiR1ZxTmRXNnlxT3d6?=
 =?utf-8?B?ZkpQUHRKaEREZ2NxV1hqanFQNnZTWVgvZkZMQnBsWFowMVd0Q2MvbURzZTV5?=
 =?utf-8?B?RzJ3dkVVZHdYSU9SazdEVmI4OEVLQXJyOTBUSDFrdzFYNllocnNMVzQzVW1R?=
 =?utf-8?B?RnRKd3M2eHlWME1mdWs2NFV2OHRleEpuN01pZnNUUWdHYWZiNkxZSjJ4UUY4?=
 =?utf-8?B?RlpoRE11amloVFB3M1Z6UW55RVIrR1BWSkVuWS9VbmdoVVFoMDNQdi9GUGdS?=
 =?utf-8?B?am5tOUY2MmxqT1Z5eDU0ZFZmMTZPZFlHdmJYZGZaY1JoQWJNOVBraW4zNU1Z?=
 =?utf-8?B?ZkIxMnorV2t0aW5ZeWowd1ZQby9ESk1XVUVJUlkyTU5BeHE4UFNlTzVaK0p6?=
 =?utf-8?B?SlQ1dHM5Uk9KWk5wcVdYSDNDV1lqbVV6eU41WUYzaG9kcTNCUEtLUGtvMjhV?=
 =?utf-8?B?MFZxaFRNbmRYNjgwU1daa01nQ1p4bGdtU1FPK0phdm9RTU12YXFPWkd4VzY5?=
 =?utf-8?B?bSt4Zng1MHJNT3pCQWZSZXcwYVVJb282eUtTVVhuSnUxTlRQYWNTaksySUxX?=
 =?utf-8?B?Vm1abDFpNGRsckFIcHB1R2UxWmtuVXZ2cHJjb2IzR2MwRDlSZjhoZGVJUHVX?=
 =?utf-8?B?MzdyZXl6aklQMDFTZkh5MmwxTTNkcHpPZXR2dzd2WkRNemk2WW9FVERmMTZ5?=
 =?utf-8?B?SjlhT09INXEzenJUcThXdmFqNHd5RHpRWm1Vd2FyM1NwNjdETkEwQ3E5V2gw?=
 =?utf-8?B?T2NzNkFjejFFNlB1aGI5cmRRc0RKbnB3RlBQQm8yRXdqaDR0VTJyV3VNNnMy?=
 =?utf-8?B?bTVlcTJpNSt0VTRPZHd6RGlJUTN1aVRHOHdvQzdRN2RCbHZFRUxGMEJ4WXJx?=
 =?utf-8?B?MHlrcUl6aE1lV3JTWGZXN0hGdjZxdUFEOVJnU0QvaE1LVkVKK0VxcU8wM2Qx?=
 =?utf-8?B?YmxENXdlV1lkTDVQa0h1ZHhkdGpXMVU4SzAzam1BeDhweEJOaGJoWkVWTVh4?=
 =?utf-8?B?RHJQSnNLRW5nRUhTTGJ3ZzlkcUozdjExemtMTUFkOW5keVd0NDh2VFQyNHdJ?=
 =?utf-8?B?YWQ2YnNIT2RZT1NNN2lQbGtBS0Z1czdqaEsyQVVZdEc5Q1hNWVU2ckNhbnow?=
 =?utf-8?B?NWpORGxSWjdXTnZVUElQSVU1ajRJK1hjYXg2Q2dCdWQ0dXdueTVrZTJRVlVi?=
 =?utf-8?B?VDFDSFVuV0xUMm13S1g1YlNJQ2JSM21lKzdYc3d5U2hHYkwrUGZaUVpZNEJU?=
 =?utf-8?B?blVvZ1VJSUVJeUVxcXlTUUk0YTVMdExCTlRIZlhMVXlsRWFWWXFvUmpCUE5y?=
 =?utf-8?B?UHdkRHJjZnFQYWxWSVFzRThKY1BqVHg2M0JQeGNHYmlMWXZaNHptZ29DRy9T?=
 =?utf-8?B?c2ZYQ2l2ejk4Y2NOUDR4d3k1UmVRK3R0bHFTMGNEN0RBZzVES0JjaDFEUE02?=
 =?utf-8?B?aG9lRlNSbHJ3TjJuQ0l1S0Q4OXNUd1dOaUZtelF4Yk9IRW1BVU0rZW5NUUNs?=
 =?utf-8?B?cmppRUhNbjlVenlyekNmV3V0Q3duSHBtMUpVbm9SVGczWTVaRkgydzJSMEEw?=
 =?utf-8?B?aVd6SWoxVm8rQlgvK1VuNUlvWDlSb3FBbXJwRGYvKzBXLzV3ZjBLNDVlS3pL?=
 =?utf-8?B?QW1ycEpUbU03eEkwZ051bHJJRU1DZDZ5ZnIyenVyMlBHeVBJWENNd3JuOW04?=
 =?utf-8?B?UGEzenl6eVBqRUY5eGlCUDNTQ1oyTk9wWlkybTlRYnFEWXM2RmNpL0JOZEF6?=
 =?utf-8?B?RVNtNkhFK05aTDhoRGFPbm04NVVLY3pzTUZUZFE0S2R2Q3o5THh0NVJWQSsx?=
 =?utf-8?B?K000UXBPRWdhVDFJMXkzdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6714.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MjY0d1hpS29tRzAzems2OG50V1pHK1dFS0E0d01DZnp0cFZ3THhub1dyWHBL?=
 =?utf-8?B?NkI4OWgwTDNJdlJ1a1pSK0N5OWtFNVh3dEdUVWx5a0dXUjUxTjI0L3JLUUY4?=
 =?utf-8?B?aGtlNXJ4TDhYWmw5aXpKVHdPbWx6VTVia2NnRGxMZDRHMEgwazJlNE9haWJQ?=
 =?utf-8?B?U1QyOUtRT05oWWttdjVmQThpV3VxNzNidFFITThialp4TkxLcVVjT1NVdWh6?=
 =?utf-8?B?K0lpU3piZEVpSEpBd2czcU1UbEhRcjlnZUJCOWZaTkVyREdibTJzSTV6VHQx?=
 =?utf-8?B?U1pLWlVBVkNrM3EwNFIrL2s2NUYzM0htQncxYWpxeXZ3bTBDdy9Za2NiL091?=
 =?utf-8?B?YTU3NVFZYXBmQnRXUncvRlQ4TnJuejF6bVBmTlF5Y25BbHA4YzNISXE4RjlQ?=
 =?utf-8?B?Znk0eWptdy9vSEdkS3FTNXljNWpNd1Avb01hUDVzNjVXVkFrcTFZSVc2VjBO?=
 =?utf-8?B?ZlFVK0I1THVjakMwU1dxRmMveVJCQndmb3Y1bkdTaWxDOEFpZXNydDN0aHNY?=
 =?utf-8?B?WmNQMWRDUjd6Y3JzUzFScHJMZTVFcEZGL3BNckZYNmNaTitraTVISUNHeWZm?=
 =?utf-8?B?Q3N5ZE5jV0xOWnRKS3B0aFoydU82UVNhdDFYL01zSGV1Vi9KVHlWcnkrdEtI?=
 =?utf-8?B?MzVkVXQ0a2ZBTERVaHZFT0tOL0dmdERhd3o4MURlYlRncURNSjZnT3F4YURr?=
 =?utf-8?B?OUp5NGZMS0tGZXBaQXdzR1RVM21vWFFyYm5NVG1pVmVIZFArdE8vckJFMVhX?=
 =?utf-8?B?dFVyOENUUzFrM2I5T1M5RndhT1dwRHQ5dWJWd3QrZGJsNDNNeGtwS2FDV2Iz?=
 =?utf-8?B?YktFWFdua2JlYXdTWVlZdU1SQW9CUGR2Q1hJMHJTV0NPTG5EUHNKMGtFeXpN?=
 =?utf-8?B?c2xDZDZzaVJHUXp0WHFvY0dIVFNlaFM1Qi9HNWdTLzEwSnErNmpjdXF6cXd6?=
 =?utf-8?B?ZzZ2QUhHZkZibjJRdi9JR09WSXpjS1dxMEtFd1BkSUN1S1lCZWhPUjhXN2o5?=
 =?utf-8?B?V2xYMktpeERTZ3ltTG5BYUM4eHJQRDNENFV6SlBWcDdJQ3pNTWk3UGpNbmZQ?=
 =?utf-8?B?UzBmRTRxWk5RSHpKNDZ4cC91eGlmL0hIMzBNV3hhcDFDdVdtUjNrWUV3RTZH?=
 =?utf-8?B?OGJzRmJRUTMxeExUalk5bVg2eUtMR1YwVXFXanpjeEErUi9mdURZbVVyQVJ2?=
 =?utf-8?B?ZCsvb1Z6bHRmd1ZEWk9aM2tVUzN2N3Q5bERFQk1EWTRvMGVSd0NtRG52Q3px?=
 =?utf-8?B?MUYwMjgyb1crUWRYM2FLS1J2UmY0UXNMaDZlbEJJSzh4N0Q5dDdvTDJHMUV1?=
 =?utf-8?B?WStzc0VVR1A1WDQrYW5DTjhqeXk0Z0V5NWRLc252WDY4NFVyUGJnWlAySWxF?=
 =?utf-8?B?Z08wWEUyTmh4aW9xdjdQM2srekU5N1pQaTlPVFVQcEZxSDdXdThYQVJIRGdr?=
 =?utf-8?B?cXUrWmpCb2N2bFRDeHpxdkpFc1BkSnJ5ZzZGaVlaL1QvdXo5OWVuM3ByUWhI?=
 =?utf-8?B?cUhobDBCQnp2ekdqS1NRdkF0RE1Lc2czcjZKaHNxVW9BUnZWd2FMS25Ybm9X?=
 =?utf-8?B?a0VEbkFQOEloUW5sRUtKZnVzcTFLMSs5M2ZkWmp2LzNZbERZSnhGZTRXQlJh?=
 =?utf-8?B?R3A5emhubUNiLytGbUZEZEdhZHlyWWhyWEp2OVVBRFdjaXJGT3p6ekhLNGk5?=
 =?utf-8?B?UHlTc3NjQUgrRXhsTTZlUE5BdTRkUUZrWGdhRFRLdUpZclQxcjNjZnNmNlpI?=
 =?utf-8?B?bnVILy9YcUFWTlpaNGVDZVoxTmY1Uld2WXVLV2duaE1Sem9IU21EQlMrUjFR?=
 =?utf-8?B?RnpybGNmZm14UXhNUW9sM0RKRG01c1RxTk90V1pEWnd4dXM3V1FuY1FTNzNN?=
 =?utf-8?B?OU1WV1hLMUdQSjFSK0xBOWJjVnNONStGcGFOTUJaL29OL3Z0cVV0T0VyUWxM?=
 =?utf-8?B?WEdPQW1DR25pZ2xhQ0JDSW5Salc1eExZQkkzSkxaWHdDRjA3dmxYUzdnMzRq?=
 =?utf-8?B?YjlKTGE0S0RTZXRGclJ3SWF3NTBnTElHeTBEdE51MkJNWi9xZkNuZGZLbC8y?=
 =?utf-8?B?a0FRbm5MT0N4ZUt0cmtWdGl3TWxDcU1KMXF6V055Q1kwd3loajAya05ZZzc4?=
 =?utf-8?Q?sNQJHSzQUntpuFLIebs7Icocj?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d082821-7694-41af-25ef-08dcde74f6af
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6714.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2024 21:48:31.8484 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q7iG9dn9UNNvRhdptcHSNe6YhVPx70SoY43B2lgIGo3DgOe9Q/KWeZfiFoFdvSJngDFpa0LVD3RPRJFgliTBnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8680
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


On 26.09.2024 16:35, Michal Wajdeczko wrote:
>
> On 24.09.2024 22:25, Tomasz Lis wrote:
>> If another VF migration happened during post-migration recovery,
>> then the current worker should be finished to allow the next
>> one start swiftly and cleanly.
>>
>> Check for defer in two places: before fixups, and before
>> sending RESFIX_DONE.
>>
>> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_sriov_vf.c | 25 +++++++++++++++++++++++++
>>   1 file changed, 25 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
>> index fe5eefa736c8..f326e507d73e 100644
>> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
>> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
>> @@ -52,6 +52,19 @@ static int vf_post_migration_requery_guc(struct xe_device *xe)
>>   	return err;
>>   }
>>   
>> +/*
>> + * vf_post_migration_imminent - Check if post-restore recovery is coming.
>> + * @xe: the &xe_device struct instance
>> + *
>> + * Return: True if migration recovery worker will soon be running. Any worker currently
>> + * executing does not affect the result.
>> + */
>> +static bool vf_post_migration_imminent(struct xe_device *xe)
>> +{
>> +	return xe->sriov.vf.migration.gt_flags != 0 ||
>> +	work_pending(&xe->sriov.vf.migration.worker);
> make sure scripts/checkpatch.pl --strict is not complaining
ok
>
>> +}
>> +
>>   /*
>>    * vf_post_migration_notify_resfix_done - Notify all GuCs about resource fixups apply finished.
>>    * @xe: the &xe_device struct instance
>> @@ -63,11 +76,17 @@ static void vf_post_migration_notify_resfix_done(struct xe_device *xe)
>>   	int err, num_sent = 0;
>>   
>>   	for_each_gt(gt, xe, id) {
>> +		if (vf_post_migration_imminent(xe))
>> +			goto skip;
> hmm, what if new migration happen right here? this is still racy and
> likely needs to be solved at GUC-VF protocol level, not by adding more
> check points in the driver

This is how the current spec works.

"At the end of patching, check if a new MIGRATED interrupt has been 
received"

We cannot guarantee no issues if the 2nd migration happens in this short 
period. It would be a really bad luck if someone actually ran into the 
issue where one of GuCs slips through the checks here, and that would 
cause engine hang. Even then, everything would continue after skipping 
the one job.

For the check points, there are exactly 2: before fixups and before 
RESFIX_DONE. we're not adding more.

-Tomasz

>
>>   		err = xe_gt_sriov_vf_notify_resfix_done(gt);
>>   		if (!err)
>>   			num_sent++;
>>   	}
>>   	drm_dbg(&xe->drm, "sent %d VF resource fixups done notifications\n", num_sent);
>> +	return;
>> +
>> +skip:
>> +	drm_dbg(&xe->drm, "another recovery imminent, skipping notifications\n");
>>   }
>>   
>>   static void vf_post_migration_recovery(struct xe_device *xe)
>> @@ -77,6 +96,8 @@ static void vf_post_migration_recovery(struct xe_device *xe)
>>   	drm_dbg(&xe->drm, "migration recovery in progress\n");
>>   	xe_pm_runtime_get(xe);
>>   	err = vf_post_migration_requery_guc(xe);
>> +	if (vf_post_migration_imminent(xe))
>> +		goto defer;
>>   	if (unlikely(err))
>>   		goto fail;
>>   
>> @@ -85,6 +106,10 @@ static void vf_post_migration_recovery(struct xe_device *xe)
>>   	xe_pm_runtime_put(xe);
>>   	drm_notice(&xe->drm, "migration recovery ended\n");
>>   	return;
>> +defer:
>> +	xe_pm_runtime_put(xe);
>> +	drm_dbg(&xe->drm, "migration recovery deferred\n");
>> +	return;
>>   fail:
>>   	xe_pm_runtime_put(xe);
>>   	drm_err(&xe->drm, "migration recovery failed (%pe)\n", ERR_PTR(err));
