Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63AE4C5B552
	for <intel-xe@archiver.kernel.org>; Tue, 10 Jun 2025 04:58:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2896010E258;
	Tue, 10 Jun 2025 04:58:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jMdjB5iA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC70F10E258
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Jun 2025 04:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749531495; x=1781067495;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=7+yS65CpfjwZqQvHum8pX76tvVRPwRHAwZ+YkhgPS5g=;
 b=jMdjB5iAnif+TdQ4LmrNKBP9maOEi/B7tqi2slI0X1xvHqkzWiakbADM
 xvuNWgQhy2xcNQth6gvtG+pgf3lYGWPUhEL+0z18EfoSyaY0Renw4IA1f
 ZCRzbqnsjkcNzBxdZ9LJ+GxBYSm9v7XfkV65f6+RPYjSru1dZ93QBBz6J
 e0qld29jBXWhb3ImF93DKPejc4reKZ7gUgJtdq3ZLuVWd06kwobb06otz
 zwfGnHQUFBapCGTuhUVxdvHJS1SQDBsqc5mXupgYxiHj3fxwDsHwXFPI4
 StjmCdU0HS9pWrYNMd0wW0LBo4Ceiu3iFAMYwIGISKSd4oiySMom5pAch w==;
X-CSE-ConnectionGUID: xbiHDxa5SHaxt7Uf3CNXTQ==
X-CSE-MsgGUID: p6B6IUZPRZeg1TFD9e+2BQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="69185148"
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; d="scan'208";a="69185148"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 21:57:42 -0700
X-CSE-ConnectionGUID: JKQJDUbVTVGvQJ4PM8vMmg==
X-CSE-MsgGUID: IO8bAfeIT3SMBNEHoUYBAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; d="scan'208";a="147653273"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 21:57:41 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 9 Jun 2025 21:57:40 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 9 Jun 2025 21:57:40 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.84) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Mon, 9 Jun 2025 21:57:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DW9fRvV0c8NsQo/0bAVOkxbMbCfeFbDoULsMA2Jhow96CG2F81pZLeF+hDOW4pQKSpgbxOYUr6RiCVzmtG4YO2GGvCz+rdRgHv8sQR6r1MLdEY8sakL0eq7sqU77DdLuCMep3vX/lfSc4D/Ry1AwMZvOe/zOj1ItN1CH1hkWycGkXr62E7tmZZWvonO7HBRjAPsDzFEXzLo8madayV+1y7mhlPNcmKdO0/i7hAwxziEGWW4XNohUqLo2Hu8wlWvr2bIN9imjix7y6nQF+ohlMfr61Hm5/9llOVthcur8zc7MP+1Qy7qp6LoLO0qDE0T0YfuE1fe4B2sxHRCW1Z788A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0hrdBm9k5VarW/3HsgtMIKSmoO4Z8l29+o0lGmRTSjE=;
 b=RMau+49/gacvAyH9j+UNXZgUJAlD765OpLteAGAlF6HKxP8tO40m4R8bBYuTGyBIPOHw9oBeG0IgrnHNF1AFkNL3Ff5m0cNkEfyPH/0SQDFPth9syI7F+g50Jzi+Ud0EV0lTOVsXpJzji9FwBJh9hOaNtRrMA6WM8yx4OCeMg4RMGDzUEviPldWVGHKPgLHrG00mhHQTnupGno38cOa1HMSmSUOojEopE5NySeHGRSCAzchqOqP/KE2RaJ/2+D3MfqfaKUcAkGSYPg494X3bgL5Vn8TX7vsroAznpXmhT+DUqvaeq8vIBBsFdMCCme4a1Wys23gbHVD02dnTsOSvBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by PH0PR11MB4822.namprd11.prod.outlook.com
 (2603:10b6:510:39::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.28; Tue, 10 Jun
 2025 04:57:11 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::2ae2:110b:2487:40ed]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::2ae2:110b:2487:40ed%6]) with mapi id 15.20.8813.024; Tue, 10 Jun 2025
 04:57:11 +0000
Message-ID: <a0d9ee8a-4c9d-42ba-a09e-ce005802b759@intel.com>
Date: Tue, 10 Jun 2025 10:27:05 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Reorder 'Get pages failed' message
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20250610045649.3149801-1-matthew.brost@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250610045649.3149801-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0080.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::10) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|PH0PR11MB4822:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fad861b-ffdc-4279-9e71-08dda7db4294
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eEpzREpCalNQMTRQeHVrUFZZM0hwOHJpaDRNMjFmYnZKb1BzSWw4N2NxOGMr?=
 =?utf-8?B?NDI3ZlhkY0NQNGR6MmJyLzBZTU1DY1dZRk9wcFNnSDNlLzk2ZlVwM3BzTGhX?=
 =?utf-8?B?ME5DTWRvUk1mOUR6UnFVUEVGMVJjbEpvWmsyVld5K3RqY2pWWVlpYkJZbkwx?=
 =?utf-8?B?Vzd3aDJnOWg3Q2pvMGF5RDNrMEgrN293WHV6WUk4NE9CdUlHNEFvc0RocWJZ?=
 =?utf-8?B?N0hNNjd4bGZSTkRZd1Z6S2g3OHN1MHZweVp0dER4UHNjYlEyc05HQnJyZGNU?=
 =?utf-8?B?RDZlam5ib1NKb252U240WERLZ0F2cDYxVEwyRFUzTHc5dVp1b0MwOGN5dlo2?=
 =?utf-8?B?SDdnL3VkMWErT1BYWGJhajFwbUllN0s4SVAwbjU5dm9wSzk1QVdnNk1xaXNQ?=
 =?utf-8?B?RS9iMGdSRlhsZkRKWnJpeUFLNExlNEZtcTJKd21pbC9QaHpuU2ErOCt1Qlpq?=
 =?utf-8?B?UjhEdTYxa0MwSDhyN3VTNno5QjZrUkI5Y0tMVXVCVFVCMG5JaDkwVXp0U1dM?=
 =?utf-8?B?dnM2SHRLS1QwWU1maVJpeldZVmdnMjJYR3BpM0FGbm0zU09GK2ordnFKYVhs?=
 =?utf-8?B?em5zYUVQR3pmSmNESUk1M1FFRWJZWXk1UjFFOUtycjJrNUdnZk9hVStmaGtL?=
 =?utf-8?B?TFdCbFFkZ0ZKWkp2bVpHVGxRQTFaZnNZYlBJWmE2M2JuS0tGa2FCcWhKMFRl?=
 =?utf-8?B?SGZkeHV4UVdvaXd0QlBDZUY5TlRrN1VpSi9abDhvNHc4U0hNL1IwMjBleWJ5?=
 =?utf-8?B?bVV2STdVKzh1K242TTlUdXE4d2FpMGhQbkxkZHY2b0NkbEVleUdybzdYNjZW?=
 =?utf-8?B?bHdZcUFHNXFtNzFXRWZGb05OdW1ReTFXRjlKRk9FdlMwL0hEWUtxYnNVd3Iy?=
 =?utf-8?B?ZmFvNlVyKzhwSGtLRWxGUmZ2c1FrZTREMU1vejZtTE1OK2p3TVYzck1pclh1?=
 =?utf-8?B?ekFBL1pRbnlZZThaWXFrVERyZkJ4VUpvSFZlVnM1UmpSaUNnTHJYeDl6anNY?=
 =?utf-8?B?VHFVbzRITGJ5QXVGN0daaGhXQnlwYkhPVXRmMXV3Q3JZY2hPU2dMWmpGWExx?=
 =?utf-8?B?cXFac3RkZzdqUExlQmhkenRTUzdJZnFZVGtKbWhrdkJuNkdVcXZRVENuUk05?=
 =?utf-8?B?bHQxTG1USlk1all6THlwcTVZZERUb3pFMTU0NW5DZE5mc2l3VURMUVJScXR3?=
 =?utf-8?B?bGw2cGM2Q3lnM2VxWCtMMW1GUFRyNVpnSFRrVE9uTWlhbFI4eTVpQXhZSjUw?=
 =?utf-8?B?c3JtRlFEYlNkR0dxeGFZRXRIdXk0OFh1U2xpeWY1UVU2Wm0zV0VYZVNzUzQ1?=
 =?utf-8?B?U3NVOGQ3QjRvRGVyZG04cUFHT1F5Uk1xdHlGbHc5c3NJblFiS1ZVeW1QZ3RS?=
 =?utf-8?B?cmRlQ2YySHEvaW94cytZV1BOWm9tZW01dG5Za3hFZ3l2QndVcTNsc0Z0L1NH?=
 =?utf-8?B?NXhJalliQ013a0Y3czJEbjZINTFHMDR0UHpxQkdJcEt2SjJjSE9aODFUNk45?=
 =?utf-8?B?Q3dWdXk1ckN1SXVJc3lUZExQbVR2bHJ4UDl1U1ZMYmdrN2NRcU5SQjJOdk9B?=
 =?utf-8?B?aEVZcm5tVDNuQ016eUNOeXBwNGxUSlZBb0dxZmZaYTlKbGUvWVNhQ1FLWWwr?=
 =?utf-8?B?aHFpWDRoWlBjajlLNlRRQjlmTkU3a1d4OTQ4cjBiQmt6QXdUVEkzMldOdGd4?=
 =?utf-8?B?K1lQMmUzWVhFSm94STBNdXlnc2pxKzFZZk1HbUVRMks1RlVhZkd3VDZqYm9L?=
 =?utf-8?B?d2c4dUhUYktmTUhSdzhIYmhJVEpxOGNwT3IxS0RsOEVVSlBOcGhGcHVkMWVv?=
 =?utf-8?B?K21KaWhNNkRtMk1MSHhEMHRQSm9BZGo1T1JPYXRpQ2Z0SVhRWXMwYmlFd1R3?=
 =?utf-8?B?UitUa2M3SzhnOHI1YVNoblBCRVdlRnYxclF0bndQVUhTZ0E9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VHJWTGhwaTg3TjZyVmlxZklhakNHMXM0aFJLRk1iZjUrVmptNjNVanBWWENJ?=
 =?utf-8?B?WFhQcDA4dkx0bDM3VGt3cldQdTd2U1cvSEFyUFhmNXJRTDZOKzAwNFlJZHJI?=
 =?utf-8?B?QThOMDc2ZDl5cEpLN1BGbkVuSXhteGdYdTh3MkFHdUZKSzdBUXd5a3hBbGZP?=
 =?utf-8?B?SHExQk1VNE5WNGZ3Z1hvS0JydzBVWHNYOHdJTWZUczBTM3JsYlRDSjN2Rkh0?=
 =?utf-8?B?TlVnMnlMbEtmME9JQkRBWUVZQTVySDNKTGMxMDZyWXYrZUhUMU1iZnU3QVh5?=
 =?utf-8?B?T2pxS2grZFcxdUlzMlJObURGVkFyenlFMlE0Yjhmc0R1V3VrK0ZETytDSVV1?=
 =?utf-8?B?Y0NrSHlEREZ3RHJFRm9zeG9wVmJHVVZjeG5PSTZCSTY2Um9nSnJURmpXR3hr?=
 =?utf-8?B?cmlCTTVrQ3k3VGR1Z0NzNk1ocExhdzRrRzBqNWRRRmFXNjg0WTIybXd4THk4?=
 =?utf-8?B?ZE54Ui9TSTZpZ21pS1ZPbm9rRGNQWC94YmlIa3hyTGVObU9CeUYzcE9BKzVk?=
 =?utf-8?B?b1JmaUdTQVNTZmlTS285OW1pTEVzTTdpZGNObU51YUd6U2I1VFpSRUJpUnZQ?=
 =?utf-8?B?c1lMRlRqRlVIZ3lWRVg0OEpkdVZJVlNvOFpBa1RndENXVTdzNVNTK1h0dmM4?=
 =?utf-8?B?enoxR1ZSNUVoNWR0SVo2UC9EamV0MTV3c25QejI2VDU5Y2l5dGszbnN6TlVo?=
 =?utf-8?B?N0JZOER1T2NKNTJZVTZEaS8vTW9ONHV3dUYxUFRhMDBJZnJMNmV3elRVaVlr?=
 =?utf-8?B?Vll1QVhNYTZqcGNPNHdSN2RxUVZlZlJRMCtVU3IwZkZnTy91aGZVUEdXcFdx?=
 =?utf-8?B?RFhhSk9zSjlVTzZUMzEwZUN6Tk1PV1Z1czREZkJkRHVmRTdLeGZGRWVnSnVL?=
 =?utf-8?B?VzR0RG1TMHFZbDdtK3RwS3hjMS9FcEVkYUFLWnhYcHpta0FPU29VUlpXR3cw?=
 =?utf-8?B?eE1FNTBnN1pMQ1d1b1p0aEdRaWMrWGhtTnJLU2UzRk1CN1hTSXUyb0NZeWRM?=
 =?utf-8?B?L1Y5VkdlbUpFZEUrUkFRZzJaNllYY3ZORHUrOU1MajZHNzc1NmRRa2wvOHNn?=
 =?utf-8?B?bkl3NVBzNXFzVnV0ZEVJbzBsWVJ5cnBLZVVrVnYxUk9jME5qaFhJTDFQMVhF?=
 =?utf-8?B?ZGU2TUhXdjhMd2pHWGVvVGhmMWoxREY4YWRUOEpGVlBkNmk3NFF0SGsxcDNu?=
 =?utf-8?B?Rmt0T0xHYVl2S011Ui9lOTZ4YUVzSWJCMlNLMmtxcVBXT0gvRTFhK29yYU1E?=
 =?utf-8?B?OGRrR1hyM0pUWmx2N0psbk5JbEh2dllnMlFsWnRTd1JJbnB3SDZwRnBEZTI2?=
 =?utf-8?B?cTE3cXBiU3AyUFpvVVdGM3dWeTh6aUYyVUtqc0tUTmM0YjhiVVBHN3lqdW5m?=
 =?utf-8?B?OFZJWVRObGVDcmZaYTFkVFhXNFRZWW9WenlSUDljS2x2V2lhN3RlQ0w0dUVW?=
 =?utf-8?B?R09RakR2NHZoZ1pNazI3azRXRWtJcU5XM25qZDlnNU9CY21QaDRHM3k1K1Rn?=
 =?utf-8?B?MTMxd3NPcTc3dlVCV0Jma2ZoQ0cxNVpvYmh5ZzFrTTU0MVlDTi9BT2NCYTVS?=
 =?utf-8?B?RmNNMC9Da2VsNjZZcTRjNjdDV21tVzBRZDdFQlZqOUd3Qm80aW9UV25VcDFH?=
 =?utf-8?B?SmZsSVYzRDVjTjQyTDVTc3hDTzhDZ3dma3RpSXJvdFlvcUlKek56N0pBTitM?=
 =?utf-8?B?eHhaRUFhZlYzemovR3B4ZWNuUTNjc3JBeGxsUmhtRms1K3JUZlM3bnVZdmha?=
 =?utf-8?B?b1locWlJZStEYytaNk0rR04zUXU4WWpCeVk4SU9EZ3JLYVo5bVkrcXQxNWo3?=
 =?utf-8?B?emtCTGdjM1Q2WE5wanlkcTY5OHYyd1RMdzduWHViQXRtRGphcTZzSms5RW9s?=
 =?utf-8?B?dG5aczBObUJZTUFOU041cFBha1V3czhVc2ZhbW03dmJ2YzJxcVlvV0hsVGZD?=
 =?utf-8?B?TjkzaDJtMHgwalYwVThCL3hCNEFjeENMbkk3ci9QS2ErbXh5R0JMMG1lRWsy?=
 =?utf-8?B?VHh4T05BK1lxZmtyZWorYzM1RDM0TEs0Mzg0bVJtdUtLZUtKdHpBVlFCRmp2?=
 =?utf-8?B?cm8zcFUzVi92cFcvczNQdzZaRHlpL0pjQ0pRK2R3YlU5a3U3TUx4ZVpXWnZ0?=
 =?utf-8?B?VG1zdmhUU21WN2xpY2xBVzFjRkxzSDdXUVZRSVJBeUM4aFVPcFkxMDVjUlB0?=
 =?utf-8?Q?yDFdFm4yqa+c3uH3JNBI8SI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fad861b-ffdc-4279-9e71-08dda7db4294
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 04:57:11.6324 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jinpwrcb4simOodaLa/zWtN2C3Hht+HHN9Xa49Hvt0UMYrDQdw77PaKIEZ0f25QjlH45frhdJ7eN+BxC2/DC606JV16V/2eprQ+8UMLPcoc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4822
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



On 10-06-2025 10:26, Matthew Brost wrote:
> Print the error from get pages failing, not the cast to -ENODATA.

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_vm.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 18f967ce1f1a..d18807b92b18 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2924,10 +2924,10 @@ static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_op *op)
>   
>   		err = xe_svm_range_get_pages(vm, svm_range, &ctx);
>   		if (err) {
> -			if (err == -EOPNOTSUPP || err == -EFAULT || err == -EPERM)
> -				err = -ENODATA;
>   			drm_dbg(&vm->xe->drm, "Get pages failed, asid=%u, gpusvm=%p, errno=%pe\n",
>   				vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
> +			if (err == -EOPNOTSUPP || err == -EFAULT || err == -EPERM)
> +				err = -ENODATA;
>   			return err;
>   		}
>   		xe_svm_range_debug(svm_range, "PREFETCH - RANGE GET PAGES DONE");

