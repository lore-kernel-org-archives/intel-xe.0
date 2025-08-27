Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CC35CA0EFF
	for <intel-xe@archiver.kernel.org>; Wed, 27 Aug 2025 21:34:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4123110E0D4;
	Wed, 27 Aug 2025 21:34:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SZXwzeYB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F1B410E0D4
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Aug 2025 21:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756330469; x=1787866469;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=3boIhGeYHVp/iLqvL68mkxEFEi29uAo4kp/zl6OrbDw=;
 b=SZXwzeYBm+llRUdeHE/7kzs5gKG/CAyh7OoJXmqSd5pftaahL7nnO2gp
 S2oLEVwbLHRWg+1QBgqwbBS98qIJWjZI05rW0o3xCdb9qiyMg0eGTPcLz
 0/Z56YBegXRUuAVOQVWp0j/9cdbt9W1XXh/JouJ7AqQgE0l55cysr7h/8
 hWmeOq/plSFK32ypz+xCnPewFmZfNFIYDGtRurRQceSSGE3L73YLGBFVJ
 u7GbV3c74J3Fo0+5SP5R9Ne6OBbDL7Udz2jrTj2b9G0woFIOnxaQF+ovm
 CvkAmLIVSszwCwnqXbydDMblYjyYuEznPkv0ZUaof71IJrn+zhnw58iWq g==;
X-CSE-ConnectionGUID: AJjRc/W6QZujnvOhg6Xjqg==
X-CSE-MsgGUID: yhV1rqswT66NwN+hhsQ/6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="58660452"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="58660452"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 14:34:28 -0700
X-CSE-ConnectionGUID: EDMg/CrSRza763vcU9KCKw==
X-CSE-MsgGUID: Vwdp5DlyRFq9aRSZcCXY0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="169847624"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 14:34:27 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 27 Aug 2025 14:34:27 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 27 Aug 2025 14:34:27 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.74) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 27 Aug 2025 14:34:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FEgGAyUKziHVraKVA/akG3ADR7tjFqB6wRPB9wBqu/27AB2irrIp8Xxkq/bGaS78Rwn1VySlBJVPXQM95Ta0pv6sdYbgTvRHUaIH9IpQhHVQC/XIRKaSgZhAvbRumukYi/FarpcMVSz6G1228VSmiPdpAaGXhnXn3mGJrNE4mG4jHAlVPC4//obByP867BniRybGVD0nZ6bCHCDsCL6/z7m7cLdPq7VK2rqXnHKTCGFi89Gaq06e7mAMXSjfS/KQz/hXaITpy5A0MU7L6EhLo67R0h2vIoLKFaOthGTx03eqO6yz4ucpliIWygxVGMWfM8ikijkGEmwIe12gBEedAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZYBPAnaJ2ylfp0Hp47sG4Tqyk80ocusN4nQiF+3fgxQ=;
 b=FJ4vlCm+KzfqZWx4c0w9DGfyNtciASe6Fz/I0G1wgINQOA1tWgCHi0zyFTvR5veszgGaFiQ2GjCrteQpaVRrUr/tu7tbSYYm7SzM2GUdafCpahfr35osCAd0z879c8RUx+NeKYBKrXGYbAKKCX4Kdn412zxmMGXVGo4PGNDmueD3a86eO93+JRk8CTwytn2bBTOBd5laT9PxT153VGmt+C35H0ZHJ0A7ZE1bcq3RabMkJvyHvV95gHHb+0OiBsHj3TYias8TWZ2zbHuNTTHJwFyrBLbCt9Pk90e5wUZMD4BHpsxJMsyhz8Vawfv5cIcKxLkDgm9bm7OPphRDiPQzLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7821.namprd11.prod.outlook.com (2603:10b6:208:3f0::22)
 by DS4PPFCECA32305.namprd11.prod.outlook.com (2603:10b6:f:fc02::51)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.24; Wed, 27 Aug
 2025 21:34:24 +0000
Received: from IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::2ca4:29ad:f305:6fc0]) by IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::2ca4:29ad:f305:6fc0%5]) with mapi id 15.20.9052.019; Wed, 27 Aug 2025
 21:34:23 +0000
Message-ID: <bd6117bf-5e00-45ce-81e5-4372c9f8cde0@intel.com>
Date: Wed, 27 Aug 2025 14:34:21 -0700
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe/guc?=
 =?UTF-8?Q?=3A_Test_GuC_v70=2E49=2E4_for_BMG=2C_LNL=2C_PTL=2C_PVC?=
To: <intel-xe@lists.freedesktop.org>
References: <20250826205705.217905-2-julia.filipchuk@intel.com>
 <175628450244.273644.5886709831826874658@1538d3639d33>
Content-Language: en-US
From: Julia Filipchuk <julia.filipchuk@intel.com>
Organization: Intel
In-Reply-To: <175628450244.273644.5886709831826874658@1538d3639d33>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0138.namprd03.prod.outlook.com
 (2603:10b6:303:8c::23) To IA1PR11MB7821.namprd11.prod.outlook.com
 (2603:10b6:208:3f0::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7821:EE_|DS4PPFCECA32305:EE_
X-MS-Office365-Filtering-Correlation-Id: d18a9315-ba4e-433c-6066-08dde5b17d81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Zk5ZRmNBc091MEYyWklkK1FmekE4WUZhM3hwSFZyRGJRc0ZvZ3RVd3JZQUdG?=
 =?utf-8?B?ODNGVWRabnE3elFUZnhNa0xReTVaUUVxL2w0cE1HTmd4MGpjdVJoK2xUWStw?=
 =?utf-8?B?SWgrVDFSVFo0bEppY095WlhUeERnL21PcGcrV3ROUWdRdU4wZFNwUHExRnU5?=
 =?utf-8?B?WUR6RVpad3JxMzRsdW5uOHN0MC8wb081d05hRHh1R2dMUmExYk4wQkgrbGNK?=
 =?utf-8?B?SXV6U3JjekE3U1FRRnVmUzFOQ3NCVkx1S2lPYlNBdzNzNm1Vd0owNStlNWFz?=
 =?utf-8?B?VGRMaXJLQ0IxMW5LZmNWUmVVN2MwL2pmM3BFcXpDZ0pIWEV6UXQrTTY2ZVRr?=
 =?utf-8?B?OGpOeXlnbUlLV2N2aU1iMU8zWjZrSGFjejV6V2ZKUUFobkxSb0Joakp1QTlZ?=
 =?utf-8?B?SmhFRnF6Y2VrOEtSTStRUTBCT2hWTmlBcWdlWk5GcWQ2c3JreW1oanBDaUJi?=
 =?utf-8?B?a1FVR3BvdXloVzkxZzl1MEZ3cXFISkFoL3VodlhtZnE4c3pHTHJMT2ZWQTJW?=
 =?utf-8?B?U0J0NEM2LzdleEw4MEpRVHQ3RWszK2p0bndnbVJzL3pveG5qYkxMY0Jvd3pS?=
 =?utf-8?B?UWlmN1hGRUdVUytZNTlNa1BWVkl3SWNhUmhRZGVrcEFKZTF3WXZkMkpnSVBw?=
 =?utf-8?B?ZkxmNENVV20xNTMrdWtSUEgxcG1ucnpIeWlOS05IV21ZV1dpYTV1eEZNaDll?=
 =?utf-8?B?aDNFdHhmS2Y1YWw3a29wZFFNTk9vb0R4ZGJKS3U2bkx2TVdINGFnemg5MlNv?=
 =?utf-8?B?Z200azlVS3NjUkJ1ZmhtSnQ1S1VkdC9halRUQWRFQ0hTUXdFK2ZKU1ByRmxo?=
 =?utf-8?B?dUlmeHJEeEhkTktMTWtEdjNORmhtVkNXd2dZd0dUMUZkNHJFTHFBNlBLMDNa?=
 =?utf-8?B?TmxDUFNuMnJ5aE5meXFuemU0RFZPem0wd2cxSGF2ZW5IU0prK0pQVjFRK3U5?=
 =?utf-8?B?Um9tck5HRU5ELy9qN2wvZ1NkTkxlcVc4VFFMZnNtZUI2T2Rxb3V1OVZiTm5a?=
 =?utf-8?B?Nmkya1YrSURnanJLa1AzekgwWlh2aXhVODFueFNhV1NDQ0RZVVZnRUZJR0FW?=
 =?utf-8?B?cDBJWk1KcnN3ZVgrSlFHZ2FWYTBuczFtM0luTFFjMHN1NnNybjRmc2t2eFha?=
 =?utf-8?B?S1ZpdGhpTkVVWUlzcDlpQlZYc09pemtmNjdCM2FYaW5RaDFpM2ZNR29lSndB?=
 =?utf-8?B?QkVzK1lZR1h3RFRjbTBSUUd0VGJ6MTVVYzI4N0RrRjRGVDhTbEh6RE56bFFl?=
 =?utf-8?B?ZXc3YzJ5bXJFYVRLc0pVNU5SK1gxVzh4cUl1S2Y4NnkzVGtMbC80empLOVZW?=
 =?utf-8?B?Y0FNVi9IOUYyREFPaGMxbXFtcGNObHVlbTByUU9lS09WSDdSRXQxL2R4bmRO?=
 =?utf-8?B?d0ZGTHNnQkxCcEFvdXA5Q2dCVkxUOXhibVkrallmLzBmZnpDTU9hTUhTVVhu?=
 =?utf-8?B?TFVLN2kvdkpsdlowZlRhSkkxeXlHNitpTlloMDgwMnNXMHZUcmthZjFKU3R0?=
 =?utf-8?B?RlZ1N0RWcU9ZV055OWZxdk1aLytpNTB1UDJBam8xaEhSUmVHZ3NrVC9EZzZt?=
 =?utf-8?B?WXhjeVVmMEZGSlFvcFpPRTlZWnhtcW1GUmN3OVlEelVwcUV0ZWQzZG9HRXcw?=
 =?utf-8?B?N2xyajJqbUx6MkJ4Y2V3Ly80WmVXU2hwZnQ2My81M01EU1ZpRnFWclEyTW04?=
 =?utf-8?B?Rm5RaVRQRGFsUEVJNzVaVFhNQ3BRZi9oSlVtclNjbS9GcHk0czB4UFJNWm9m?=
 =?utf-8?B?NEFrOHNFUWptVU11K3dxMFdqdzRvaEdERGJGYTlycGtQeUNsYUZHYVRhY1h3?=
 =?utf-8?B?K1g4ZGg3VjgySXY1WDJaZjAxRWhFRmhIMlQxMkZrbHlKcnZZdThJNTFsV1Z0?=
 =?utf-8?Q?s+5nEkWv5F43H?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7821.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dTFaR2RUaXNSVCtnQlNVazFKUTVycEpKNEZJN1VQeGc4U0dKeXEzaEhQOHE3?=
 =?utf-8?B?ZncyWU9vOXVWVDV6bkc2dDc0Yk1zRUF5ZVlJeFdjOEFHbmtpM1k1OUpicUZ6?=
 =?utf-8?B?VkVxZ05WMGpiNVgrSjFadFRxUDNZazBpREVIOEtWenhlRGVROHVsMXEwdXRx?=
 =?utf-8?B?L2s5VzRpMlN0UEFkWEgwZDluL3lpSkNlSElyTmprNnJiL2g5L05FZk1VVktq?=
 =?utf-8?B?VzBGZWJBd0dUemFWd2RMRXprTXZpT0lZUW5FVkljY3BTWDBDWDNtTTBkUzhp?=
 =?utf-8?B?WVUvZnhzanBRamJOREFnYk9SUk5IRGgzOE1CZzI4VldjTW16YzBEbEdqK1Ft?=
 =?utf-8?B?TDQrWlExajNYUmxmMUpYMG0wUHNPcVFlZ2RpZ3NEYVNXSkxoVHNYVUVnTS9j?=
 =?utf-8?B?ZmZmVitNZXQ2TXRBTU5JOXExY2xKWVVXWTFKbnBvOU5ab1pOM3dQVWdYSmRS?=
 =?utf-8?B?WXoydkVZcVVGdFA5VXBXTWlZRzg1dFhwdnFyUk82K05aNkxBZHJHeExqSmRI?=
 =?utf-8?B?OTdnNnZjMGRPVkdMZEFuUkc1OUF2VXpIV0pKYVQ5bFp4R01JN1gzRUdVbVRY?=
 =?utf-8?B?ZUFnQ0E5V3BQR2hoZTcvSDNIK080Szl4SDVEbnZCZ01uOWs4M3F3Y3h2UFRN?=
 =?utf-8?B?OFoxVG4rWldjRVAwY1V2UXVRQmwyVUxwd3p1STl0YU51cG1WTEdZRFRnK0VE?=
 =?utf-8?B?aEtpd0Z0OXNhYmZabnZoRWpxYkJYdnVsdUlrSEliR0FIOEN1RXpzUnJHRmRW?=
 =?utf-8?B?QUcya3l5bzcxcWRXb2YwTjZrQk40WWsvQjZPSXVxNUlkclBkdXZGOEIxSEpo?=
 =?utf-8?B?THpBUUxHYnZrU21keUtNbzRpcCtsaEJhaHU0bWpoYkJjQ2JCS09rMlpkSkEx?=
 =?utf-8?B?VzhLdXJodlJxZFd6WlZvdGpBNnU3SUplV3IwNEVZSEh2S3lKZitVV214aGYr?=
 =?utf-8?B?cFlrV1pCL2N4OWpPTFE5eDBBRURPZlhSaG1aamFSRDRrdzJJemJYa3lBYlZE?=
 =?utf-8?B?Z05nUWl2RWZtUEt0dlBnWDZMK1dSVU56UDIzSGptYlphZFBhMm9hUGxJbVpN?=
 =?utf-8?B?VU1Wc3pLYlFPcFU0dTJJZmxQUW1KUTA3MXdzbXVGQnYrdE9CRStGQmczNlgv?=
 =?utf-8?B?SjJCWm5acVExaC9aZTA5RmNTZUZyS2pZeGdkZml4WHpFYVBTL00yMmNUcjBU?=
 =?utf-8?B?bWFQb3dsd1lzVW1Nd1RRbWhaTHU0d1lKMzFSSkZNdnpjZHh5Q1A3RkkwQmc2?=
 =?utf-8?B?eUNTSTFhdFlLeFJXRk1uNmJhWC9RVXk1RlpFdlB2SlJpRHoxblkyTjZXUDQ0?=
 =?utf-8?B?N0tUeFJiQkw4UXdaYWwyc2ZRN1lPZHBmblE4eEpnaWVPRkhpeU16djZTK1Y2?=
 =?utf-8?B?T3Q3c0RTOFFIMzV3Q09sTndFa2Z6cldCcU9Lbm9FY0lvaklZK0QwZExHTEdl?=
 =?utf-8?B?blNWakNieklMbHRSZ1BZMDkydzBwZzB1Tzc4RjVlZkpuVmx6M1FhV3dPY1JD?=
 =?utf-8?B?anZoNU5JdXRmdElLdGtIZnBxOERLWkU0eko4ZGhnSGZrdExwUUJTbXh2Vm8x?=
 =?utf-8?B?MndvRWRmQkI1T2Q5TzY1ei82TWNFNEVLbjVrazNnZjl2THMxSVhTRXpZQmpT?=
 =?utf-8?B?WDZUT2VSdGlrenV3bnl4K3IyRHVHZEp4Sm5KSXFrdlBEbjh3SXBVb3NrOWRD?=
 =?utf-8?B?bnc5UFVFTmVMd2srby82NEU0dmNYWVZ1WXAvU3phV2pYeXJsOFhuU0U1cjBw?=
 =?utf-8?B?UjRuSEl3bGpQREtVMHdYU2hUdGhzY0F0dlBkcmFNcHhzUDVUK1Bka0JHMU4w?=
 =?utf-8?B?RFFZa0xjTmJNV0F1SkMzZDRvWVNDeWtydGJ2MDdrWE5yM2wrOU9STENSczVN?=
 =?utf-8?B?REtMSzBvRVV5MHJBaVNtUFJqN3A3NUwrQmkvV0d6R2xRMXBWOVlpbEhzbTJl?=
 =?utf-8?B?a00xMkxXWm9vcElmMVZBS3ZsdFlYbGhDdDllTm9wQ2dteGZjZzFadUVBV01C?=
 =?utf-8?B?QnhBQlZXZ2VsaGV2MG9yRmRwWXcvNCtBYjB3c1NiUnlRcjl6aHRrSzF2ZGlP?=
 =?utf-8?B?VU9VRnJVSHdEMThDTFJYYkVPYnZlc2xCNjE1aCtyYXljbzE5K0t5VzJTMmZZ?=
 =?utf-8?B?U0Iycmc5RHVSL25FZXZqRlRTZlduOWhPMWUxVHU4VHN3L3Q0WDJOcXMzRXJJ?=
 =?utf-8?B?M3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d18a9315-ba4e-433c-6066-08dde5b17d81
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7821.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 21:34:23.7377 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9wx/mpk71PHggSCW67CW1IS5ads5/SIZha8UyeUoTxA0pJsb87UEj4iuvKWugAUFpz10ymBBFEYDe2BgOe0dzSH1dLPI6PLM9gXdKBBD/4I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFCECA32305
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

On 8/27/2025 1:48 AM, Patchwork wrote:
> #### Possible regressions ####
> 
>   * igt@xe_exec_threads@threads-cm-fd-rebind:
>     - shard-bmg:          [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/
> xe-3623-3a2760f3080e5188b19cdb4640cec5eb0926d578/shard-bmg-4/
> igt@xe_exec_threads@threads-cm-fd-rebind.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153535v1/shard-bmg-5/
> igt@xe_exec_threads@threads-cm-fd-rebind.html

Failure unrelated to change. Repeated rare failure.
