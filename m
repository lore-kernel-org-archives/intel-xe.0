Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CC9CC021B3
	for <intel-xe@archiver.kernel.org>; Fri, 21 Feb 2025 15:02:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAF6F10E2A4;
	Fri, 21 Feb 2025 15:02:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WWfXgqFi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE31410E2A4
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Feb 2025 15:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740150137; x=1771686137;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UxAcmHkkDm6JzYTS+l/bULKW/yUb0dWnmFTp9xixE6c=;
 b=WWfXgqFizF5H4RIcUJurFSkmIQKUPenBGHWMlp/JAtn1/A+f71avJfAw
 Mu/pnlDyvcZjsj+1v/oiVaW3zR08pnVszBtAHyIOdfrnU+HFlLkr9dn1h
 V8XQ6FA0ayzQvoRv6LYh/pyYBIdrHhVKeZ66NSH6dHZHhmkGVgaDYKkQe
 JsdLtzO3KSmEinXj8yaSikdFnrNWMMGf4xBbtSQm3Mo2biYH7hKzONp1s
 ywBY2Cpoh+QNixOExoxDEAVuPyGcif7SLIlsiR/+np+ea+k84jeWfBggx
 vC+yPdL62FiEVQ2yxMSwKfRt+WfWdbXBMA7FeNe41K3iz2v3UQNzfBnTd Q==;
X-CSE-ConnectionGUID: yQ5ewMypQU+qy4fiRa91cQ==
X-CSE-MsgGUID: rzFXMao2S7qy8K3OQHbGJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="41173874"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="41173874"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 07:02:16 -0800
X-CSE-ConnectionGUID: nr636H2NSCmklHp0K0T4CA==
X-CSE-MsgGUID: xUK8aZW+Rgi7IqTWCBRxZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; d="scan'208";a="120372291"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Feb 2025 07:02:17 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 21 Feb 2025 07:02:15 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 21 Feb 2025 07:02:15 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.46) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 21 Feb 2025 07:02:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R++sT3NbyafYB9iZh9oox2rzGXlwhtnKNexhnhIL3/YIqNjh7Zx3+imCNXWlA8MPYPq9ehXSKGiGPxSUR2C5461M3N2abdhZNWFfOKtQrOigaYRemW9t5/Tl4Pg6TazFoIIBNsFXw9pi5ZbX2GfEj+Ra4Xjj3qieZ1TuvYJTI2nEZqYBRcY7jZP+wbm8hTIog6URTyn1FpYWnmK/uGs1lrPjcY0zkmdk3w1LV2lK8kM8Bf67ROnyhaRQg+YIPgNdcntGeZPs9m/+HezIMYjIBIKGi6m37eTFesNxqPmYCvxkx873JGreFPKK2esLg/DyyRlK9uD/yny1TgIMtHAYbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wvF6nBbP9IKOe+GdxO1bgEe52Vmm8xsrXO/o6Htprh8=;
 b=ePl4pTUWFwiFC1hsQMNhK/i8KLyrLwTxjnGfO3ncR20Qzia8tXWaa/g0y1wYMU84M35eLNRGUF+hszXAvV7rewKwEkNyEu9QFmA4rJrz1cCiPmhMIx/J/p2Ytkn3KtbxnIb6OSISnt5O4RJM3u0nafFOngY6wWJZk3pnJyd4N4VdFuBn/UdrCUug8HKDeW8iZWRFvbd5T+p898xI7bPCo9usySSvajRXQHKDaFHOXMpYuGTcdNkFifeQghCqZhxlpeTHqoOWeSdSH+DzA+qk0fyvIGaW9cPlFE5qjNTH2oYoR1/LVCj7+DEx6Ua3ai3x3sFiYW6yaw6e9+eSz+OBIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5703.namprd11.prod.outlook.com (2603:10b6:8:22::5) by
 SJ1PR11MB6273.namprd11.prod.outlook.com (2603:10b6:a03:458::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8466.16; Fri, 21 Feb 2025 15:02:12 +0000
Received: from DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::f734:e507:3083:e454]) by DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::f734:e507:3083:e454%7]) with mapi id 15.20.8466.016; Fri, 21 Feb 2025
 15:02:09 +0000
Message-ID: <bbda9792-7126-4961-8767-b435780f0cff@intel.com>
Date: Fri, 21 Feb 2025 20:32:01 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/xe/hwmon: expose fan speed
Content-Language: en-GB
To: Raag Jadav <raag.jadav@intel.com>, <lucas.demarchi@intel.com>,
 <rodrigo.vivi@intel.com>, <matthew.d.roper@intel.com>,
 <andi.shyti@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <riana.tauro@intel.com>, <badal.nilawar@intel.com>
References: <20250210100515.2205584-1-raag.jadav@intel.com>
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <20250210100515.2205584-1-raag.jadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0085.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::6) To DM8PR11MB5703.namprd11.prod.outlook.com
 (2603:10b6:8:22::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5703:EE_|SJ1PR11MB6273:EE_
X-MS-Office365-Filtering-Correlation-Id: 7538544e-19be-4ed6-1a06-08dd5288b6aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Yk5IKzg5UkgzNzZrcUxYMUxhQ1BlWWFXNmY3M3c2Zjk1QzY0ckw3QzZaRTBZ?=
 =?utf-8?B?K2JqY0d2eENGaHUxWU9MVGRya1NXTUREdDlZb3UxblRyZGd1K1VsYWhCT1dk?=
 =?utf-8?B?eFZPNFhkRDAxbEp4SzF2dmdSakVGVGJsdlhKbklEMTFvYklHaDBZWWQyUzND?=
 =?utf-8?B?bDdLM0t0TmozcVJ3WlZzOWNMblhNbTVBY0d1NnkvbkRjekQ4Z2ZwSTlROFFK?=
 =?utf-8?B?RmNYMEw2UTl2d2xMbEhSaFZwdlFaRUpKaHAzTUsvYzFXTHZ5cU9nUFhxUXAx?=
 =?utf-8?B?ZG8xZlJvdTlldUVWdTRnMHB2MWVCWWJ1QTYzb2xHem1zQ2RzSnZZbkQ0eTVi?=
 =?utf-8?B?aWtRREthUWliK2lmMTZVenN4Y0lkWW1aSDhva0NhbUZrY3ZiNGJxWlFOdmw4?=
 =?utf-8?B?MnNuZGdxcG4vTkFidjI1a1U3R3N0VXdCS2VrTFkwTUdNL2NCRXM4WDlKblpZ?=
 =?utf-8?B?cm1ielh0ZDMzajdoQ3ZrTGpORWdOUGhQNTJxaDBqNE1sQjFNaGtaRm5tU3FD?=
 =?utf-8?B?Ukk0ZEI4bmhVRVZvakNmZGhtZWdaczE0S0hWVHRYekVoTVRnTWNpcU11M2k0?=
 =?utf-8?B?bWV4Nk5lVkd6b25VdVNwWnJZV0N4U3FOVktKNWxiUDJqRFRaT3N2Z2VsNGNI?=
 =?utf-8?B?TWJRQVhUd1RUSjVMUi9XZXJzZWd1VkxpWjhKTEJGS0JOWlpRbDAydTM3bFBI?=
 =?utf-8?B?bSt4Uk55MG55azBnUEt2RVdXYlNqcVJ3ZElLTUQ3dzRTcXlCY25EQ1RtcUZ1?=
 =?utf-8?B?cm1yTHpjQm00WVNuQzhpMTJjRFg0czk3MlJYby9NTkdPQk5hNHlUT1VLaDAy?=
 =?utf-8?B?MkZFRXR0NnJZeG5OU0c0RWFRMWQ3K1pWTHozQUE5ZDFpTGRuTUxkVDJQOENx?=
 =?utf-8?B?QXY1ZmJMalVSQmdMbS9UZmc3eXdrNDVaL0gvZWpqbisySlB5T0lhVFlNZ2V3?=
 =?utf-8?B?RllQR25vNGsvMzJhU0pFZVVpcytvbFlOdTVnU2tTSWtVRm54bzRnUEhaMUU5?=
 =?utf-8?B?S2JudXBrdzBHclpRWVp5QUpGS0MzWEpvdUovUjZRYWk1ZThHbTJYY3BXMEJV?=
 =?utf-8?B?cDhjYXZhamNWbElib3VHR1Z3N3p3QTZDcXhpQXVJWHVzQVpVUkh5U0lXUEg2?=
 =?utf-8?B?RWpJNVN0ZXlWQnprSGdIaU42c2F0MnZOK0xENnJocWU0RWlGQkxzSE9ZRkMy?=
 =?utf-8?B?YkF0M1NJclpORFhZNG5sQjE0WnRWWUNXU1dTWHZkTzBzZHpoUldVdnArdVh6?=
 =?utf-8?B?QU1UODBpbWdLT0ZhUmZ4UTZna2kzbnNwZjB6MS9xMUlJWWgwUzdYbUNxK0pl?=
 =?utf-8?B?TUtCMXpIbVlCL05FU0E5cDY5a3pNRndPbXBIZ1A5SWxJd1lXSU5nYmI3NXdh?=
 =?utf-8?B?VFVjTEJYOVM4WmxTTEh2aFhlREp4U1A4QldrT1pldVJabnQ1OEdCRmVnWEla?=
 =?utf-8?B?bExUL3EwOUJZL3dIbW1IcCtNRyt5NEI4TG9pOWFsMEY3Um9TQU1CaExVWTJs?=
 =?utf-8?B?bnpPVDdmeENuSTBhNWZJQTJZbGJGMnZDaXlnV05lb0QrZTdFaTJDeGhMclNm?=
 =?utf-8?B?NEZpSHdjTEoxSU53OTIvTWNpdktQOVRpcHJrQnZyOVpzbmwwUmlXRzlYN2RM?=
 =?utf-8?B?MHVtQjc0dzN0YkZvcFpSTnJycVdUWFlDL1hsRmlQTWpsVnJYLzdHT2ZoVGxu?=
 =?utf-8?B?dlVFSllabjdLdTQwdFErZXoyenlQQk5PWk1uN2xuUG4xMFVhem9lZ3JEejNz?=
 =?utf-8?B?eU40Q1dsY0lXUWNUa29yZXFLZVI0a0IzVzhiazl1ZVdxSVE0TTJ0cnV0ckJS?=
 =?utf-8?B?OEg3MXE1S0ZJb1kvVFkwd2wvRUkyYy9ySHc5SW5aL1NOQzNNNGlCOXZ6OThE?=
 =?utf-8?Q?OH3SoT+zXj4DF?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5703.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WmRrYWdzNktpZFBFSVIwdnFXYVYvanJySVU5Wi9rUkhjSE10Qk5USVdTNXoz?=
 =?utf-8?B?dnR1VlNZeW1uUmU1d3FkaytYZnZNMisrUFBsWUdWaGlkZVMxM0pnRW9GK1Na?=
 =?utf-8?B?bUNZMUFoSkxnME1sLzZKQlBBVDZOT2RodW9tbGxFMWlBRm9pOFNjTW5RT0RK?=
 =?utf-8?B?dDB6d2V0UGRkMjM0eHE5akdPcUpSQk1KMHFVSHpreldPVXp4emxuSXcyMGJP?=
 =?utf-8?B?MW1Gb3lmOUYwKzFuaEZ5VVFmTkdXcW5QeFIrY1BuNE92bUZUcEdpYzNPcWlQ?=
 =?utf-8?B?RG4rUTJDZTk0bVFxK3pxVEVLNWVGR2F1ZldQWVdtaFMzZkxqdmEydjI1S1hn?=
 =?utf-8?B?Z0thVXF5a21YSzg5bmVBRGpBdXNDaXgwNEUxbGVZb3RwVFJOc0Z2VUZWVy9n?=
 =?utf-8?B?M1JXMG5MNVpTMjJGTStIdUVBQ2FaRlNnQnRZOSszb1ppdmV4WFFIeloycGk2?=
 =?utf-8?B?ZmY5Vmo5NU9XOHRmcGU3RlJNN2xyaEV2YVFPY3dUcW05dTlXcU4wa1liK3NJ?=
 =?utf-8?B?WkRKZGEyZ3RNcDZjVmhBLzJhOUl0amkvdU1iWldxODQyOTdzdU5XaXQ3aXhz?=
 =?utf-8?B?V3VwaytjVXdQWXpCWElFVWhGN3RpU01lZ3VIUmNUR0drT2k1bjhUWGpOa2k2?=
 =?utf-8?B?RFhvaXowSVE0SHRRMzZ5QmlQV0VkVWpGZ0MrNFY3dS9ub2grYVUxQ1JsTHdG?=
 =?utf-8?B?aVJwRU1kd3AranVhMUd2YXVobDltSWhQUVBCNDFtckpCUE1OaE4zS1pwL1Mx?=
 =?utf-8?B?eVo3cUFSNFdQMitrRTliREpsZ3Q1QW5EcjNvMTFiZHdYSTBFZ0lzM00xbTI1?=
 =?utf-8?B?UTlxbXhYeE5MV2lFRHRMclV6N2dYSTFOUGc3RlpkTXEvOHZReFFYMGFlVGNP?=
 =?utf-8?B?WklPUEhHYW5TSzNNeGhzc1lydWR6bUFLWGdOd1FENnh6a3RmYnFhbVdURlJN?=
 =?utf-8?B?Y205VCs2YXJvdkdadDF5SFhRUERLcXRWQ3kwT2YzcFJ2a1B6eE5KRGhhcVlw?=
 =?utf-8?B?UENMY3ZZOUZ3ejhub28rQXEwQlZaa2k0VDQxZzBPejNNSzVCNG9YeXhHbEY5?=
 =?utf-8?B?Wkw2SkVRajZSUjVRN0h4ZzFvQzJPUFBxd0pPRDE3SzZ1K2QxUldObUZGZ0ZF?=
 =?utf-8?B?K3g2N0hxS3BrS2xtVmhKWE1Oc3Z0bG54OGJMRE5YOStXSmxVaTV3OGc1cWsz?=
 =?utf-8?B?QXVaVGVZaDdzWDIzNHpmTkRNM090WjJtWHppY0JVR1p5SVNpZlpPTlQ1NjFn?=
 =?utf-8?B?cXBPaTFHOFVMam55N2Z2Z1h4SWc5Mi9zM1FBdXVVLzNvS2FTQTZ0dTcyNlFp?=
 =?utf-8?B?ZHE1L0tYUnltZ0xCWDZyWVlraGd5Qm12WWdwUytpd2QwbVd5NFcvOTlDenNI?=
 =?utf-8?B?czRPL2cxaW5Fd0lxYTNEOHQyS2RoYlRINnhCanFLL2QyYWRVQldpN3NxYkR5?=
 =?utf-8?B?NXd4c1Vja29CSS9Vb0FwZ3NMSlViT3ZiUUVTTmk5VHpQVFV2eUUxR0M3REJ6?=
 =?utf-8?B?UXNVbE00Z21CRWRsOXdzaFN4d3JCYVBETHFjRC9QTTZsblpmSHNwamx1RW5U?=
 =?utf-8?B?bmhEam5iQ3pWM0ZIL2NESEpBZGJxZDJkQWIxUnhEcjdmVkNrNzZxNFU0enJy?=
 =?utf-8?B?VE9wYjVHOUhMbXBYNjJQSkQ2YW9NYU00c1FlUmFrVDUzdVkvYXkwcmp6bFdQ?=
 =?utf-8?B?ZTJmUVNPNlo5eWhodERoYTN5UHZHdzk1aERzQW9RNFM3OEt1SkluSzhqNSsz?=
 =?utf-8?B?VGpBUG1XV3FKMy9RRWh3YkhPeWc2bXFaRDkvWktuZjV2bi8zMExtQUk0NkR0?=
 =?utf-8?B?SUUyZUQ3eVNwbmF4dkc5b0xRTE42WVlNRjAveVQ4UFc0djc3Y3RrVzYwNktV?=
 =?utf-8?B?Q2ZSYVk4SFlaTHNiVEFJbmV4UDJwdlRMTTRtUkJZaVUvUG9sYlo2YjdlRys5?=
 =?utf-8?B?Ry9TbE1hRW15dTZaSVlKalBocFlWTkhXeWYxYVB0cStqRnJEejBJY0RrdWQr?=
 =?utf-8?B?blNBM3Zyd3EyRlA5MFlFMmZVM0k0czAyNUk2T2kzM2Z6ejJtNlJyYU1tNDdB?=
 =?utf-8?B?bVQxS0NSMGhWSENPeERGMHY3Y05Oc25HYXZpTnZIS2FWWWNXSUNQRktrelRq?=
 =?utf-8?B?OFI5VkFtNEVBTDV1TW1jOE4vN2VRWmRMMTltd1BRRWtTSFFoK0NSeWdRQTBO?=
 =?utf-8?B?bGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7538544e-19be-4ed6-1a06-08dd5288b6aa
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5703.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2025 15:02:09.6113 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9ezWP7+8Lfpo3BIdFFt5mLgqulIuWYF7Sh4UrVUU0CxAkpr6xMTGpIkNh9B9pLYL5Q5HsOByVXODC00E1Szlgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6273
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


On 10-02-2025 15:35, Raag Jadav wrote:
> Add hwmon support for fan1_input, fan2_input and fan3_input attributes,
> which will expose fan speed of respective channels in RPM when supported
> by hardware. With this in place we can monitor fan speed using lm-sensors
> tool.
>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
>   .../ABI/testing/sysfs-driver-intel-xe-hwmon   |  24 ++++
>   drivers/gpu/drm/xe/regs/xe_pcode_regs.h       |   3 +
>   drivers/gpu/drm/xe/xe_hwmon.c                 | 124 +++++++++++++++++-
>   drivers/gpu/drm/xe/xe_pcode_api.h             |   3 +
>   4 files changed, 153 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> index 9bce281314df..adbb9bce15a5 100644
> --- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> @@ -124,3 +124,27 @@ Contact:	intel-xe@lists.freedesktop.org
>   Description:	RO. VRAM temperature in millidegree Celsius.
>   
>   		Only supported for particular Intel Xe graphics platforms.
> +
> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/fan1_input
> +Date:		March 2025
> +KernelVersion:	6.14
> +Contact:	intel-xe@lists.freedesktop.org
> +Description:	RO. Fan 1 speed in RPM.
> +
> +		Only supported for particular Intel Xe graphics platforms.
> +
> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/fan2_input
> +Date:		March 2025
> +KernelVersion:	6.14
> +Contact:	intel-xe@lists.freedesktop.org
> +Description:	RO. Fan 2 speed in RPM.
> +
> +		Only supported for particular Intel Xe graphics platforms.
> +
> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/fan3_input
> +Date:		March 2025
> +KernelVersion:	6.14
> +Contact:	intel-xe@lists.freedesktop.org
> +Description:	RO. Fan 3 speed in RPM.
> +
> +		Only supported for particular Intel Xe graphics platforms.
> diff --git a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
> index 8846eb9ce2a4..c7d5d782e3f9 100644
> --- a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
> @@ -21,6 +21,9 @@
>   #define BMG_PACKAGE_POWER_SKU			XE_REG(0x138098)
>   #define BMG_PACKAGE_POWER_SKU_UNIT		XE_REG(0x1380dc)
>   #define BMG_PACKAGE_ENERGY_STATUS		XE_REG(0x138120)
> +#define BMG_FAN_1_SPEED				XE_REG(0x138140)
> +#define BMG_FAN_2_SPEED				XE_REG(0x138170)
> +#define BMG_FAN_3_SPEED				XE_REG(0x1381a0)

Can you rename macros without having platform names, as this register is 
available for both DG2 and BMG, like FAN_1_SPEED.

>   #define BMG_VRAM_TEMPERATURE			XE_REG(0x1382c0)
>   #define BMG_PACKAGE_TEMPERATURE			XE_REG(0x138434)
>   #define BMG_PACKAGE_RAPL_LIMIT			XE_REG(0x138440)
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 7f327e334212..f1f95655d9fb 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -5,6 +5,7 @@
>   
>   #include <linux/hwmon-sysfs.h>
>   #include <linux/hwmon.h>
> +#include <linux/jiffies.h>
>   #include <linux/types.h>
>   #include <linux/units.h>
>   
> @@ -27,6 +28,7 @@ enum xe_hwmon_reg {
>   	REG_PKG_POWER_SKU_UNIT,
>   	REG_GT_PERF_STATUS,
>   	REG_PKG_ENERGY_STATUS,
> +	REG_FAN_SPEED,
>   };
>   
>   enum xe_hwmon_reg_operation {
> @@ -42,6 +44,13 @@ enum xe_hwmon_channel {
>   	CHANNEL_MAX,
>   };
>   
> +enum xe_fan_channel {
> +	FAN_1,
> +	FAN_2,
> +	FAN_3,
> +	FAN_MAX,
> +};
> +
>   /*
>    * SF_* - scale factors for particular quantities according to hwmon spec.
>    */
> @@ -61,6 +70,16 @@ struct xe_hwmon_energy_info {
>   	long accum_energy;
>   };
>   
> +/**
> + * struct xe_hwmon_fan_info - to cache previous fan reading
> + */
> +struct xe_hwmon_fan_info {
> +	/** @reg_val_prev: previous fan reg val */
> +	u32 reg_val_prev;
> +	/** @time_prev: previous timestamp */
> +	u64 time_prev;
> +};
> +
>   /**
>    * struct xe_hwmon - xe hwmon data structure
>    */
> @@ -79,6 +98,8 @@ struct xe_hwmon {
>   	int scl_shift_time;
>   	/** @ei: Energy info for energyN_input */
>   	struct xe_hwmon_energy_info ei[CHANNEL_MAX];
> +	/** @fi: Fan info for fanN_input */
> +	struct xe_hwmon_fan_info fi[FAN_MAX];
>   };
>   
>   static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon_reg,
> @@ -144,6 +165,16 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
>   			return PCU_CR_PACKAGE_ENERGY_STATUS;
>   		}
>   		break;
> +	case REG_FAN_SPEED:
> +		if (xe->info.platform == XE_BATTLEMAGE || xe->info.platform == XE_DG2) {
> +			if (channel == FAN_1)
> +				return BMG_FAN_1_SPEED;
> +			else if (channel == FAN_2)
> +				return BMG_FAN_2_SPEED;
> +			else if (channel == FAN_3)
> +				return BMG_FAN_3_SPEED;
> +		}
> +		break;
>   	default:
>   		drm_warn(&xe->drm, "Unknown xe hwmon reg id: %d\n", hwmon_reg);
>   		break;
> @@ -454,6 +485,7 @@ static const struct hwmon_channel_info * const hwmon_info[] = {
>   	HWMON_CHANNEL_INFO(curr, HWMON_C_LABEL, HWMON_C_CRIT | HWMON_C_LABEL),
>   	HWMON_CHANNEL_INFO(in, HWMON_I_INPUT | HWMON_I_LABEL, HWMON_I_INPUT | HWMON_I_LABEL),
>   	HWMON_CHANNEL_INFO(energy, HWMON_E_INPUT | HWMON_E_LABEL, HWMON_E_INPUT | HWMON_E_LABEL),
> +	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT, HWMON_F_INPUT, HWMON_F_INPUT),
>   	NULL
>   };
>   
> @@ -480,6 +512,14 @@ static int xe_hwmon_pcode_write_i1(const struct xe_hwmon *hwmon, u32 uval)
>   			      (uval & POWER_SETUP_I1_DATA_MASK));
>   }
>   
> +static int xe_hwmon_pcode_read_num_fans(const struct xe_hwmon *hwmon, u32 *uval)
> +{
> +	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
> +
> +	return xe_pcode_read(root_tile, PCODE_MBOX(FAN_SPEED_CONTROL,
> +			     FSC_READ_NUM_FANS, 0), uval, NULL);
> +}
> +
>   static int xe_hwmon_power_curr_crit_read(struct xe_hwmon *hwmon, int channel,
>   					 long *value, u32 scale_factor)
>   {
> @@ -705,6 +745,77 @@ xe_hwmon_energy_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
>   	}
>   }
>   
> +static umode_t
> +xe_hwmon_fan_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
> +{
> +	struct xe_device *xe = hwmon->xe;
> +	u32 uval;
> +
> +	switch (attr) {
> +	case hwmon_fan_input:
> +		if (xe_hwmon_pcode_read_num_fans(hwmon, &uval))
> +			return 0;
> +
> +		/* Platforms that don't return correct value */
This can be rephrased to - "Platforms that don't support fan pcode 
mailbox cmds"
> +		if (xe->info.platform == XE_DG2)
> +			uval = 2;
> +
> +		return channel < uval ? 0444 : 0;
> +	default:
> +		return 0;
> +	}
> +}
> +
> +static int
> +xe_hwmon_fan_input_read(struct xe_hwmon *hwmon, int channel, long *val)
> +{
> +	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
> +	struct xe_hwmon_fan_info *fi = &hwmon->fi[channel];
> +	u64 rotations, time_now, time;
> +	u32 reg_val;
> +	int ret = 0;
> +
> +	mutex_lock(&hwmon->hwmon_lock);
> +
> +	reg_val = xe_mmio_read32(mmio, xe_hwmon_get_reg(hwmon, REG_FAN_SPEED, channel));
> +	time_now = get_jiffies_64();
> +
> +	/*
> +	 * HW register value is accumulated count of pulses from PWM fan with the scale
> +	 * of 2 pulses per rotation.
> +	 */
> +	rotations = (reg_val - fi->reg_val_prev) / 2;
> +
> +	time = jiffies_delta_to_msecs(time_now - fi->time_prev);
> +	if (unlikely(!time)) {
> +		ret = -EAGAIN;
> +		goto unlock;
> +	}
> +
> +	/*
> +	 * Calculate fan speed in RPM by time averaging two subsequent readings in minutes.
> +	 * RPM = number of rotations * msecs per minute / time in msecs
> +	 */
> +	*val = DIV_ROUND_UP_ULL(rotations * (MSEC_PER_SEC * 60), time);
> +
> +	fi->reg_val_prev = reg_val;
> +	fi->time_prev = time_now;
> +unlock:
> +	mutex_unlock(&hwmon->hwmon_lock);
> +	return ret;
> +}
> +
> +static int
> +xe_hwmon_fan_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
> +{
> +	switch (attr) {
> +	case hwmon_fan_input:
> +		return xe_hwmon_fan_input_read(hwmon, channel, val);
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
>   static umode_t
>   xe_hwmon_is_visible(const void *drvdata, enum hwmon_sensor_types type,
>   		    u32 attr, int channel)
> @@ -730,6 +841,9 @@ xe_hwmon_is_visible(const void *drvdata, enum hwmon_sensor_types type,
>   	case hwmon_energy:
>   		ret = xe_hwmon_energy_is_visible(hwmon, attr, channel);
>   		break;
> +	case hwmon_fan:
> +		ret = xe_hwmon_fan_is_visible(hwmon, attr, channel);
> +		break;
>   	default:
>   		ret = 0;
>   		break;
> @@ -765,6 +879,9 @@ xe_hwmon_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
>   	case hwmon_energy:
>   		ret = xe_hwmon_energy_read(hwmon, attr, channel, val);
>   		break;
> +	case hwmon_fan:
> +		ret = xe_hwmon_fan_read(hwmon, attr, channel, val);
> +		break;
>   	default:
>   		ret = -EOPNOTSUPP;
>   		break;
> @@ -843,7 +960,7 @@ xe_hwmon_get_preregistration_info(struct xe_device *xe)
>   {
>   	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
>   	struct xe_hwmon *hwmon = xe->hwmon;
> -	long energy;
> +	long energy, fan_speed;
>   	u64 val_sku_unit = 0;
>   	int channel;
>   	struct xe_reg pkg_power_sku_unit;
> @@ -867,6 +984,11 @@ xe_hwmon_get_preregistration_info(struct xe_device *xe)
>   	for (channel = 0; channel < CHANNEL_MAX; channel++)
>   		if (xe_hwmon_is_visible(hwmon, hwmon_energy, hwmon_energy_input, channel))
>   			xe_hwmon_energy_get(hwmon, channel, &energy);
> +
> +	/* Initialize 'struct xe_hwmon_fan_info' with initial fan register reading. */
> +	for (channel = 0; channel < FAN_MAX; channel++)
> +		if (xe_hwmon_is_visible(hwmon, hwmon_fan, hwmon_fan_input, channel))
> +			xe_hwmon_fan_input_read(hwmon, channel, &fan_speed);
>   }
>   
>   static void xe_hwmon_mutex_destroy(void *arg)
> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
> index 2bae9afdbd35..e622ae17f08d 100644
> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
> @@ -49,6 +49,9 @@
>   /* Domain IDs (param2) */
>   #define     PCODE_MBOX_DOMAIN_HBM		0x2
>   
> +#define   FAN_SPEED_CONTROL			0x7D
> +#define     FSC_READ_NUM_FANS			0x4
> +
>   #define PCODE_SCRATCH(x)		XE_REG(0x138320 + ((x) * 4))
>   /* PCODE_SCRATCH0 */
>   #define   AUXINFO_REG_OFFSET		REG_GENMASK(17, 15)
