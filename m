Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36A3ACCD199
	for <intel-xe@archiver.kernel.org>; Thu, 16 Oct 2025 22:25:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E55F710E0DE;
	Thu, 16 Oct 2025 22:25:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aD3GqVOf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51D9C10E0DE
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Oct 2025 22:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760653512; x=1792189512;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ud5wXTrVfhmG7GCJL2rhJu4rVC83cHfEtaa0umMty0Q=;
 b=aD3GqVOfs+dyfL3Jnz6dzRYYAMAw4lb/+j0JaOfxZdbRvUjE8mJPfiz8
 ZAN2E9Yce1hJ2Ng1Z/mfi+UeHNYEEWA4BZ8ajlCzlNOPx8yRrWkxcKp/e
 36VsTUYq9CwZu/ZQrMZ0HP7kjwefQFX3yoHSoWhTle80M1tivoo0oNufi
 2WqH0bGEk14mUgIw+XORceGkt9FZ6oMnIkF191LHDnIlIrtZVuv0VIFYW
 lxhxS9otbLdiIjVNMJbPVYcqNQNLuAGBBg4diJYmVWdBnvWR/RAXglrlq
 s72RbEXEczQ2QuAcDTH3diLLs8p0SM0CZsYFdLzYHkRRSZ4hJ8JG25eJ/ g==;
X-CSE-ConnectionGUID: KiJ+Rc1dTc2fBqPrZeRlkQ==
X-CSE-MsgGUID: /U2ABwyzTFWnC4/Qv10NSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="80495110"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="80495110"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 15:25:12 -0700
X-CSE-ConnectionGUID: WjJ9Lq3mSS+IrY5zYdF2xQ==
X-CSE-MsgGUID: 5SVMvhbZQP+V433akLSZng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="183051983"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 15:25:12 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 15:25:11 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 16 Oct 2025 15:25:11 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.53)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 15:25:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uZ1oIk3T/WKZr7WZFf0uGEHRtYOSTjUauADC3SaTn+QQejgrCoXuV5ci7Q1rVnScswJP3tJ/WlK+8GjDtmWFh+ERCWlxThuXX53jQzlfJROnQYpIxKuqZAgm92UEyP2udMe69telf9cD4yxzctkkVXUN37958sMuH6za3v5q2xEqugKHlWTXq6O8r4je4Bkdj+BJofOgE0DrECGVCrD8x/lVKSQ9FyKPexgUTeSse9aMd87PwiJQmnVBGybNwDKDaVGfUaRf5VCT+4qyPqiVcdNzWz1JXo8CEUv4WPyG4Ma8emE2i8hjHKstj08kUsXRYtAKQeOi6a+0NwDPPNfSKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C8GakX1pF6mY80V2uFQJzdJx9gMD2GpUGYt+ql8TPzw=;
 b=SfOd1ng//AAVSTf+jVUoLnbVfktG3bwRddkukMconLp++3FUGnm4RpuTsAPRnx/VRXsWAP1mTJSDLV85uwcIr2vbbC/58BuWnxysnDmE0RJAsqMZRMN1ESwjegfG2m/aHil0SLwtl/pAEkHhuPrANPwcJ+AuguZY9ui4ptjvzWtrzFzc9kOAGub8ERhG7uNiwacDdPhBsH60j5zHb7UqJFrrJ5k6n3iTmX8ztUsMZpCI/QOVWOuXvzh2B1DJEYCiFoXCI59CsGynqzlOnH9hpmxTwsaaqJMu1lUFz9nNJzzCLiz2WuWhFTWR/rWVcQwYnmmZsqqjPA70eijTyMdrlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by CY8PR11MB7315.namprd11.prod.outlook.com (2603:10b6:930:9e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Thu, 16 Oct
 2025 22:25:09 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9228.011; Thu, 16 Oct 2025
 22:25:09 +0000
Message-ID: <0ed38cf2-4b3e-41f2-a1b7-a16533e3896a@intel.com>
Date: Fri, 17 Oct 2025 00:25:04 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] drm/xe/vf: Do not disable VF migration on ATS-M
To: Tomasz Lis <tomasz.lis@intel.com>, <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Satyanarayana K V P
 <satyanarayana.k.v.p@intel.com>
References: <20251016120511.856792-1-tomasz.lis@intel.com>
 <20251016120511.856792-6-tomasz.lis@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251016120511.856792-6-tomasz.lis@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIZP296CA0019.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:2a8::6) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|CY8PR11MB7315:EE_
X-MS-Office365-Filtering-Correlation-Id: 636a3135-69fb-46e0-da65-08de0d02dd5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aHg3Q3ZCYThVNEVnSU1kNExzVkZCTE91eU5DWTQ0bm5reUhMOVFSdG1mY0pl?=
 =?utf-8?B?dGdnbWVCZTVhbDNYVE1sZUMrSUEzQWVSU2pPRFlzRUZGWjl2MlJrM3BCN0RV?=
 =?utf-8?B?WW1reTdXQnI5UFRpT0U1alc5M1JXaXFrQytGMmlQUklVUzN6Z3lEK2pVVmYw?=
 =?utf-8?B?RHRzNUJtbk8yUzV0NG5zZTdMQzFWWTRCc2xGeWxYanEzWmJiY1k5c0ZwNms2?=
 =?utf-8?B?RjRVZi9neDVwYVMwOGZLd0h2dnZEellDczRmb28yWEx4OXV6b0dYY0xtSW9j?=
 =?utf-8?B?OTFUMGpFZThBVEE4bm45QkhCeFlYZmREbnFjYVVxU3NvQjVVa3o1MTNOd2Vr?=
 =?utf-8?B?K1M2M1lFK3FJUlpKSDBHLzl2Q1VEd3I1VDVXb2crUk9nZWFXejVWaDNZamc5?=
 =?utf-8?B?dDc0MU40azhBUXYwTGFZdDE4TFk2bXFUSk9TcG1JeGlzUjRpSDVjKy91Vjlh?=
 =?utf-8?B?Lzh2VWc3Y0Z4OXJUbHd5bStjM1FCbGtpMGNma1BmR1dwbFdod0hyaGM4cExr?=
 =?utf-8?B?TnhEL01JcHlKd3EvVVZRWmJGdXA2d3IzTUlBeGZMWXVMOEw0VHZKa3Jaekdm?=
 =?utf-8?B?dXlOMnlpbi9DVm5UMk1EWUdST1ArS1ozQzJpYk1JbGVtWnIrRDBhOXc3MnBJ?=
 =?utf-8?B?YXVFazNaL25VTWJmK05GQmhkWGN6YTBXUHBBQ3Zmd05yRUdUUWJkNWZwUjdj?=
 =?utf-8?B?NzhvMW5UNldTZjBmWWNyVzl2K3U2eklxL0lFUERtMCtjOTlkdjBzZFNWYlZr?=
 =?utf-8?B?WkRZcWZXdTZtK2F1MEExM2dpbEZnNnV3ZG14NEVpKzd6Njl5T0VuR2NSVWxP?=
 =?utf-8?B?RGpzR3FvQ1hWNzB6QTFpZ1Z2TGxmak9NeXZCdU80eUZMR21mOVdjT1pIOGQr?=
 =?utf-8?B?ckliRlB6OXN2WGFQOWdUZ2I3Q3lPWURxaGVqRkVoQWpISGFIcUNEdUJYdmh6?=
 =?utf-8?B?RVg0TWN6OVRrR1YxQkxVbkRXU2RIVjhpVWpIMkhOd3lyc1ZXYUU5YUZvbnB4?=
 =?utf-8?B?YmZvdmp1U3pFeHlOUDFhT0d3ak4vOHl0OGxxTFY1dUludnJyOFM4ZVJJRDVw?=
 =?utf-8?B?dnd4SVVEcDl5ajh1dzR3L2pjeFZ5NXYvN1JCYUJwNURJZ3hVMDh0RUwwbTh1?=
 =?utf-8?B?ZXEyWXBLblpwZG5DOWRvcmtCUjQyYXFTWkNaSFdOTXhXT21qQ1BaUForY2oz?=
 =?utf-8?B?NG8vU3RNUEQ5KzdmWnZZelM5cmMwZXhTUW45a3dYSy9QMnB1bDQ1ejRIZUZ6?=
 =?utf-8?B?Z1Jka1Fjd1dRc1ZGRS9CNHRFd0F0VFhVdUlrdytmK1VlZmZsMnlwMHk4ckdz?=
 =?utf-8?B?TUdqU3VoQnhYL0l2MG8wTjFXZGpUenp5aFJVc1JucTNVZGdEMXdKYXVzVHJJ?=
 =?utf-8?B?cHVST0FPckVWa0kyZE51Nyt1WDBYdWFzQnFZaVB5V3JRakNhK2o2U0RpZjBJ?=
 =?utf-8?B?d0w5b1NDK3Q5QkJwSU5ZbWdGNG9TRUxUdy9POXRWZEpPcEJMdXJJQ1ZqUksx?=
 =?utf-8?B?UG40RjY1YVdWOGQxbDBOeDduV2VBL0szRFgvZTlFNFRzZ3JHaEdOR3M1OEFZ?=
 =?utf-8?B?cVd4SUtGWWFPTm0xdUUrZFpPZkpjTVNhcjZCYTdpNE41SEdzOURjOFlKRC84?=
 =?utf-8?B?a1hiM0dUTGFWblVYSlladWszeVBxK2huUHpTRFZCenJBUm51dHBtSlNsZTBa?=
 =?utf-8?B?TERYaHdCYW91dlpSUVdSUWlBOCs4YmFYWE5qWXcySDNGSUNqRk1CZ1RHSXhk?=
 =?utf-8?B?K2dKZ3FYVXovOFhPTitPM041VmJjYVZYSkE1S01kcGdTd2hoVzl4NlBZMlgv?=
 =?utf-8?B?YzZRc2VWMU52cUVNdVd5RGk1NXFCK3h1anhCOWVLZTlwbElLRWJjNkRQb21X?=
 =?utf-8?B?Z0xtakRFL1MzYVg3YmttRThmNjdjdldFVWZieXBGc2Y3UHN1RUxBNFJmV2Nw?=
 =?utf-8?Q?alcDYvH7J+4mODFJzEBOeAFIfUgEXR8e?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UDJlNzhWTm9PU09NaTZEWlN6OW1UV1Z1a3RNK0ljOGhlVFlKNDcybDhucE0w?=
 =?utf-8?B?WGk1elhkcHJOWk9KckUvMDFGTHFSbnY0RmZIZUZYT25sK3dabE81RzEySDF1?=
 =?utf-8?B?OTMxNEJXdVU3T0NyQWJ6UElsTXR4OUF3YkREUGplQWlaZ1M0VU1XdjBRMnBO?=
 =?utf-8?B?Y0FUbEhBendmYWQra0cxcUVUWVBubStzQzRWYjhzY0FNUUV5cThJeStmeEgr?=
 =?utf-8?B?dWhyWnRyVFBaemppTWhLUHY5eWN3aFFzOUFCMDBOSFppaTB5YzJZanY2R2Fa?=
 =?utf-8?B?ZjRENGp0S2taNVpjTEkvZWFJNW90NnI3T3dhWlI2YjdORjV1eTRRc1hQek5N?=
 =?utf-8?B?QUgwQklQQWtpeXFaYnBnb1daRUJsZW1ZVGZBK0tuOW5GU05Rb2NYcXRqMTQv?=
 =?utf-8?B?T0NPUWNpRmRGamc5VjlPdTlhYzlmVHZic2VZVjdwMDlYTWFJUnpLaktYOG15?=
 =?utf-8?B?TTJDSDFSOG5yUW94aWFOeFBiREVvTzM2WlhxVXhEYm1DL0JNUHYxUHdtRW05?=
 =?utf-8?B?ay9oakVNbGVLSHU4UHBvVjYrSWF5UE5FSi9BaWcyaDEwS3hKRzNlMWJ4aVhG?=
 =?utf-8?B?SVBJeTdYZTR4a1RJUTBxb3ZBbU1JYkJMSmplWC9tRVJVQ3NoS2NnSk5vd2hu?=
 =?utf-8?B?Q1d2ZFlVaS9TR2c1STF6TE1vQ3N3SnB3K0xYRld1S3dtTVNVaENoNHVjd25i?=
 =?utf-8?B?dmg2UkVLQUszY0lOTTFPNVI1cXROL3B2UTZrQ0ZTcCtDSmlObklCVFg1QXpK?=
 =?utf-8?B?Q2wrRjdCRGFFK1llUGhlcG11MlFxdjhtbGk4TFBXSWdyQ09TbE10NFZvbjND?=
 =?utf-8?B?dTFRVDJKS3EvU0R4Wm4xdUsxd3cya1JZbldWWG9kcjVnUVUvc010bHJJT0VT?=
 =?utf-8?B?c3hlUWlSb1VBRWt1TWlqM3phWHBxbzBPVVB4eG1jVWNsZ25DOHlNNjk4TkFP?=
 =?utf-8?B?Zkhwb3VQeEdvSWExdDhzSHlZbUcrVGRVMVFOS2FDYTA2dXVsQXR2dllXQWV1?=
 =?utf-8?B?K1Zqck1KenRxZ2IwaDRFQ1AxUEZnN2NsamVmNDNHTzFFMFJac2g4NDBiRVBO?=
 =?utf-8?B?WDJsWlJ2WkRFVjY5YnQ0M05RUmY2bXBtR2REZGlsdHpSVmVrZGl0K3VYbmtZ?=
 =?utf-8?B?VTNYdXpkV2R1M3puN3kzL0xxUU5tbE9KTWdtN3BEbzFsM0pSK0ZnZnlrVlZ5?=
 =?utf-8?B?UHZaT0FGT3BDK0huMzd6UGVRY1JwbFZZOHdhS25hQTJ1YmZ1aEVlRTM0TFh3?=
 =?utf-8?B?cVcrWkNXUEtBbWFBekVOay95Umdtd0I3TktOUHpKcGpHbDh2UEtWTU5zbi9Y?=
 =?utf-8?B?WkFGTGxHU0lZR0lpNnFvR0JUUUp2a1plTUZPMENSY0VxRHF5ajZLakFvU2My?=
 =?utf-8?B?NEVVWW9NbWQwY1FHancyVjdJV3E0U3hHc3ROL2FyZVA2Y1ZiNkd0ckVDU09t?=
 =?utf-8?B?dXF6b3JUL004aUV2OVJyR2E0ZThLNXJmRkhxSnpVSmJGUmdrc050eDczTERL?=
 =?utf-8?B?VkdJdVNFSEkzKzA5NmxXUHhNcE9xMXk1cDVmMTRRZ2xoVTlZYTFrRHJ0T0lX?=
 =?utf-8?B?VHU5WGxqaC9ETmc1RE9HQ1NvSFduNUpHZ3cvRlQ1RGM2WkNJWE90SmlXUUl4?=
 =?utf-8?B?VW5TODVhNXZTRytwTDh4Ylo5SVRQQkprTVd1WjZuL0ZuUzZGQ1RUM0hWMkN2?=
 =?utf-8?B?M0UxNlBwSGFZY1paemNiNU55bDRoZ0RwamZ3cEJmcmRQQlVlY1NYcGNQdktZ?=
 =?utf-8?B?MzFONCtqNEZqQUs1TERzWmJrak5OdlNPOE80OUtXTWJUczdFMTlKTVhPZ1U2?=
 =?utf-8?B?MGhVRjRXMUJ5Ykl5TERXaDd5QVpnQUNVUW5aSlNtNHl2YXFQMmRFdjFhTUlU?=
 =?utf-8?B?QjZDZFpIWlFrQ3ZGeXNiekJyZTgwSS84SGJ5amd2NjJwMFRQQ1N3QTlNbUFD?=
 =?utf-8?B?eFpkVEE0YmUrZHh0WmpEVEpSdkNqWnl6ZEZxQmVmZ1l6d0dQNUx6V1QzWmdM?=
 =?utf-8?B?NUNKK0kzQ2NCWkFEUUVZb1RPcGpNQzZLMmJJd3NUSjVMUnE1cjRBcVdCWjBE?=
 =?utf-8?B?OFhaWmdXVFZQSFc5RVFNdnBsdDR6TFExdEpVTk1GQWxVbUhlQlhxTW84ZU1p?=
 =?utf-8?B?SzBEcnF1N0dRR0xXVm9ON29RVTU1ZjYzczJycHVBNFg3c3RBUG4rdDBHbHl1?=
 =?utf-8?B?TUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 636a3135-69fb-46e0-da65-08de0d02dd5b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 22:25:08.9338 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rvmu9aG73xAQyzJ0au2MLe43g0fxH10G7Z/4liRllCnNNCxIncrXQTD15k/4K9QFIhhhKvNVh0DhlRj1XbXM1ouJhKJKrHXPyTgidDJCWVo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7315
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



On 10/16/2025 2:05 PM, Tomasz Lis wrote:
> The ATS-M does support VF migration, and it has graphics ver below
> the currently allowed range. Experimental support of this platform
> should therefore be available.
> 
> This change allows experimental VF migration support on ATS-M. It
> is also explicitly not allowing ADL, by adding condition on MEMIRQ.
> Supporting VF migration through MMIO interrupts would require
> some special handling in order to achieve reliability.
> 
> v2: Add MEMIRQ condition
> 
> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_sriov_vf.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
> index 5fb042c05112..fb2b3d41c610 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
> @@ -159,10 +159,13 @@ static void vf_migration_init_early(struct xe_device *xe)
>  		return vf_disable_migration(xe,
>  					    "experimental feature not available on production builds");
>  
> -	if (GRAPHICS_VER(xe) < 20)
> -		return vf_disable_migration(xe, "requires gfx version >= 20, but only %u found",
> +	if (GRAPHICS_VER(xe) < 12)
> +		return vf_disable_migration(xe, "requires gfx version >= 12, but only %u found",
>  					    GRAPHICS_VER(xe));

maybe just drop it completely and only rely on memirq support ?

it's available from 12.50, see

static inline bool xe_device_has_memirq(struct xe_device *xe)
{
	return GRAPHICS_VERx100(xe) >= 1250;
}

>  > +	if (!xe_device_has_memirq(xe))
> +		return vf_disable_migration(xe, "requires memory-based IRQ support");
> +
>  	xe->sriov.vf.migration.enabled = true;
>  	xe_sriov_dbg(xe, "migration support enabled\n");
>  }

