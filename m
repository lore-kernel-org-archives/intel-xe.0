Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F23BCE7AEE
	for <intel-xe@archiver.kernel.org>; Fri, 14 Nov 2025 11:45:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21F5D10EA44;
	Fri, 14 Nov 2025 11:45:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SERTAH9C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D230D10EA44
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Nov 2025 11:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763120738; x=1794656738;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=6f8SdU65B8J/87odgha2QwQwZo9iPgr8M8Hyg7az6gY=;
 b=SERTAH9CIo7pt27PD8eayzhjvd7U1HlYI23axjTxgmCPCCBgplPEnLyp
 506UG7X0NDDFB6mA5anoQ8aFxAli/BB6jnFkjo52jcetTQugQO8uA6GQK
 C077lH5enytCb52fO7+usxfBr768/LDpFZZn7u1Jqs0+DCx1hbSw/HLDs
 QDKxkaPtbrHCrtfXG9Bndxf1+qFLYNJzd+4J1YVzllpBuCLEiiGetWQoh
 /rHtKuxP0p/9QJkpPycLsxn+tRk1tAT9tY0WB+MyVCJN3x6Uv4myCKLl8
 3mOBM/dTVk4HRj5UroXJFqjyKdVgJ5mMWocFbVA05jLR0lQ8ZQXBJJcnl Q==;
X-CSE-ConnectionGUID: M2Sy8tOuT1273L2L6TqsBw==
X-CSE-MsgGUID: ClNpq8WKT2uXS6KCUktqaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="65371079"
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; d="scan'208";a="65371079"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 03:45:37 -0800
X-CSE-ConnectionGUID: KTr0BrwjTcKnmBmVtzlFmQ==
X-CSE-MsgGUID: 6sc4jNxJST6uDmIA/SeqrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; d="scan'208";a="189054845"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 03:45:38 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 14 Nov 2025 03:45:37 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 14 Nov 2025 03:45:37 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.23) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 14 Nov 2025 03:45:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wHQ10LGd5anl2RafMiL2tI25sAW3PVGBPYKlxutpPQSVpGIc0Gzvq5IZwBFkQADg17EKW+iivpRq0Qpc+SDaF9mvG4Q+r26uNikdhD2FJrDHBMqyxpCZ5nMtGXsB1px+FNQV65YspDceRrzsptwys8POHo+CC1WwaFQUTLudPoHA6oqUS48a7gBJk0C2JeKZDmOYNClLNqqzYY1qasmfcg79Qhu5qYUxgRMj8VbnLG/h4kUBYxZP5m9JzzNgpuD05fKqthanGtUy1PkMFU5mSCgaBs3wepmMo5Z+4BdmqLsJSeZ67nWQiYMhh12lzU6fseIOU5oS0RS6Iub+OGAHxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L9XSLfeVMHO5nHmMSjn99g5OZpTIqCuNNTD9RFsoTSM=;
 b=D2o41ttSEWfVYsLgKokcM2Ax63AhMaepWISPqolBUST+TFSfVKbyaQmZuP20EPx94Kw5qrYVdpWIag/3IxsZ5KcqKLzocaIoxw3dT14QLJ7EzNutZxgVIYCG+DOXXuaTPmScTxlRv7SoaMLlSOQFEecmJh9qq8d2FLQ9STK474boC59ubkjaayJfHDg/u1t9/woDv62xkryubV0auLU+55hUFU78kzmr4HUtIuwDsSsFwC6o5es7QddFmlQBZKXHSDCIA2vu8AsEaSOiwQJG0Y+nvqEctikdatW7Mb6xAZ7kt2WE2eskFbAOu8M+dkenBlspz3RxfXLtz3Ge+gc7yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by CY8PR11MB7337.namprd11.prod.outlook.com (2603:10b6:930:9d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 11:45:34 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%7]) with mapi id 15.20.9320.018; Fri, 14 Nov 2025
 11:45:34 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251113234038.2256106-2-matthew.d.roper@intel.com>
References: <20251113234038.2256106-2-matthew.d.roper@intel.com>
Subject: Re: [PATCH] drm/xe/kunit: Fix forcewake assertion in mocs test
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <matthew.d.roper@intel.com>, Tejas Upadhyay <tejas.upadhyay@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Date: Fri, 14 Nov 2025 08:45:09 -0300
Message-ID: <176312070974.3698.10963254726498831946@intel.com>
User-Agent: alot/0.12.dev22+g972188619
X-ClientProxiedBy: BYAPR08CA0007.namprd08.prod.outlook.com
 (2603:10b6:a03:100::20) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|CY8PR11MB7337:EE_
X-MS-Office365-Filtering-Correlation-Id: 76421b31-f5ec-4ebb-7bf0-08de23735264
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a2x0ZDdGRCtRcmhKNXJaWEx3dnh2bzZkSHNLYVRWZGRZRVlNd3NzNEZQSjJV?=
 =?utf-8?B?RnVRSlo4ZVQ0cUVqZ3NsWEhZSlArWTlRZ0pnaVlwaW03NUYwU0YwN2ZKMHBM?=
 =?utf-8?B?eTViajVqVlBSY1FCWmJuMXFTMkNvTDJPUWd5VGVrd00xdXg5dHAxd2w1K0Uy?=
 =?utf-8?B?eG1XbnVMUXY5QUIrNTlHS0VPeEUrOHdtdjJQVXpwQU9uVnJwMEpCK3ZwUSti?=
 =?utf-8?B?SnZjbk8rTEpXTUk0aXNhV0VHSjJyOU9uR3ZlQlBzWDdWUVBiR1d3eVk3Sitl?=
 =?utf-8?B?aHN6VENyZ1NwM0tXeGhpYUg0cVlqeVdkZmtQUHFLU3o3eFNRYmpVYlZvVFEx?=
 =?utf-8?B?S2U3SE8yVXlSTU5tMEI3ZHVBN3l4YnhrVTVhUUZQYXNSU3FpVGQxSTIvT2hr?=
 =?utf-8?B?QTUyMHdpbW1nTjhFekhVanJnZXZzaTllbGJ6NCtrZDE0bFlIWStYanNXSlFN?=
 =?utf-8?B?Vkx5cDl4QlJLaU9HY013VDZkV3NmSUJNd0ZtTzZ1VnN1M3RSTmQ5TEpOWGUr?=
 =?utf-8?B?N0s4ank1S1FRekUrZmFJQTkzNS9qUjE2Ti82cHRsTGNWRUVFbStGdmVVL01C?=
 =?utf-8?B?M0g3NGE3RFQrV3p5Ny82SEk0RjR2RDQ0TnhsSjVwc2pQLzJ0UDM2Vm05UXNH?=
 =?utf-8?B?czBDclUrWlllT2pmSDRCLzFSLzNBNVU0VFJqcVF2OFdudUkxbm5TTnliRjlY?=
 =?utf-8?B?cXhYL1JnTHR2bk1FODRKcGFKb3dVSkljc1crTCtDTjZwSGNZcWgrUC8wWXFP?=
 =?utf-8?B?cnRZcHduL3RPbWkxeG52NUJkMlE1V0gwbTFQYm9XUGxUWGtoSHdZWit0bFhL?=
 =?utf-8?B?dm5LRFZxOVZHNWdzMEp5RUxWaFA4YUlQT0hEclZ3S2lXaGE4VHoxbUhqZ1Q1?=
 =?utf-8?B?ZC9aaHduVVB1ZTQ4OUtjTTFuWEx5emVqeWRPWmNpK0E2RlFaVmNjUGZSZWZQ?=
 =?utf-8?B?T1J3UjQ2dDdZR0lwanpIUDY0Y2RQRkMwVlY1S3dxWmpaWlNGeEFNUHcyYmNL?=
 =?utf-8?B?M01tQ2NUV05XcmNnOVUvRFZMdWFMbVVSbEN1NFIzM1dVT1F0SWtwOVdMekdT?=
 =?utf-8?B?em9jRmY5ak9ZRjBlSzFSS0dnb05QMVpNZ0xwY0xlM1FpRFg1ZTRkNStwaktG?=
 =?utf-8?B?dmZneXdoazdDdm5ia3ZlTmZvZjUrakNDTVZEMUJsZVFJYlFFbWliNTMxMWEr?=
 =?utf-8?B?QmowOXpCZkNtMWUvdG5samNTVnl5MXpYRlZHbjQvMGQzdnBDbzA5L0Vxd1NL?=
 =?utf-8?B?bFlSOSswUGJhQkxEZTJxL0NPU3Yzelp1ekRRbEMvdmFzK2FLbWtRQzhlUnVE?=
 =?utf-8?B?TExkUnJVTXhHZXl0NGVvamg5MG5XVWhrNjkvcVF1L3JJUnNPK2FZa0tBOU9M?=
 =?utf-8?B?VzM1M2FNNDYyQ3h5amIwelVQQlU5T3REY3Uvc3J1YkF4ZWlTS0k1MGlBeWRT?=
 =?utf-8?B?OU5qakE2N2N2L29SNVpwL0RBTGY3dGJFc1FkZzI1aTYzbVIzc0preHVYNVBP?=
 =?utf-8?B?S2YvdlBHV0dQeUxUelVqZ0Fha1NaZlQySUdiNEZpM3hzalRpSjltWU02MGlq?=
 =?utf-8?B?bVZUWmxFVU1pc2hUVnN0bERYTE1wL3c5VHd3bCtqTnVZLzh1bk82eGpYN3NB?=
 =?utf-8?B?UzNrY3dQSTlJbGJJSUxuMitMd2ZCclBOR2w0RkFHN0NEeVZ5ZnlnK2VGM1BS?=
 =?utf-8?B?V1ptdU5TUTNKSTR4K0E1QzVhdVBwQ2k3cklLKyt5ZU1CZHJhU2hPMmthVHRO?=
 =?utf-8?B?aG01bjJ2cVlxbDdJenlVY29PQ0VWSFg1bTBwaGpkVjBQWDRUSU56UldIVDVI?=
 =?utf-8?B?VmxqMGxOWGQxdUZDd1BqSmRBb3VRdE1JVW5HM1VxSGMwMWw0R202UXRTTHA5?=
 =?utf-8?B?aGxDaFkyOTNRK241U0h0ZkdXVFhzYnFpZmZrWU5rY0hFNVUwdVdLVWxWcDhG?=
 =?utf-8?Q?9Ms7/XO5bOvgOcz1H+4sx/3cby2oAViU?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cEtvVmNKS1pXak05elJKMWhPekJWOWxkbnhCN0g1ekZpQ3htUkhPTnM4bkRx?=
 =?utf-8?B?blN3V3diRGNHZDY2c3kwUllKbGYrUU5pdmh4SmZFNFR3OS9rbk9jRmtaTGxM?=
 =?utf-8?B?U3N4YjdQbWl1TzZ6ZzM3ZTZ1cThVMTZHRkZLZUsrdFhwNEtWdHhKVGRqQXM4?=
 =?utf-8?B?ZW5KS3dEc21LNEcwUHExTCtVM0FVTUZPNmk3Ym9sS1hiK3l5TXBxcUg0b2ZB?=
 =?utf-8?B?aGI5MXhCazJaWnV2RCtqUzJoWXhZbXNKQ0NhbGxNWUJMNEt6bUMrMVlkaHFu?=
 =?utf-8?B?RmFyeSs3T2QveUVqOGoza0dyTVlUVkx0bGZ3ZUlPdytHUWZzUElIMTBKRmRQ?=
 =?utf-8?B?Zy9Jc0IrT29ITStPYUJyVzg2Q1QwRkhtenp5K1N4cW9NcU9kSFAwTlVacXdC?=
 =?utf-8?B?SDFleXN4ODd0Z2hMdW9DMXhKQTRZbkZvdXJ4K2dIVkc4c0UxcXJaOTFUSEJ1?=
 =?utf-8?B?YzU2SHhtbjhYLy9vZUJXRnFLMEkzN21NQzUxVmVXeWFLb29nWGVRTzRhNWRZ?=
 =?utf-8?B?OHNwWUU1TkNqL2FBVjdzR3FpNUYzMlg3SHhOZ2dlVDRnc2R6R0NGVFZJT2V2?=
 =?utf-8?B?UHErM0xNM3pvNEVIN2dsVDJoR3BVeWExN0sxY2xySVhqaDl5b1JvR0gwRDdq?=
 =?utf-8?B?VzJZQUpoYW9IM1VDZ0xiY2pBNTJBS3FpaTVUTmpqa3lJUWFjRnMreEVVcld6?=
 =?utf-8?B?SDFUZUtoMUtEeFErYnEvSEtrSkV0d0xLVmpaaEpUemVEVGtuUjBGelREcmM1?=
 =?utf-8?B?VmNURXJXVkNOZDB2aEtEczltQnpudmxUUFFIbW94TnBlVlNWajdZQnhwSU5L?=
 =?utf-8?B?eUpWYXA5WHdNVGQ5clQ2ZmVLRldVdW9jY1h0SmI1MnRRWEp1Skhjd1cwUUl3?=
 =?utf-8?B?cFlIYVJuTVJNVFRWeUpOZWVoZytGUE4xSzhoNldVclptcHgxdXY3NGZLblc2?=
 =?utf-8?B?WWFVYTJoUXkyNVc5c212QU9YbFhrU0NLUkdqOU1uOGxaZDM0T1dIKytBY0F6?=
 =?utf-8?B?ZEZUODNQQjk4YWtTdGtNbWRaejBJTXpGaWI4b251bkFxeXpjcXJxVlhIVDds?=
 =?utf-8?B?Ujl0ZFFKRTBObGt0TUZHYjZHenBER0xyMmlrNTl2cEtwV3BYOEM5V3RGVkRE?=
 =?utf-8?B?RkRPZ09NR25kS2YxSlNxSXg2ME5PVUQwT3pndGhFSnVIY2haVml2RlNSVCtD?=
 =?utf-8?B?clJ6QnIvT1FyeFp5enYzQjYra2h1R3pYek43T01JUG5yOXVRcXVuN0FYWWdr?=
 =?utf-8?B?YjVjZ0V1TEZOQTRrVXFZeThIekdnUlZQNFdIOEZ0ZXEzQXFaaXcxbVJaaDhD?=
 =?utf-8?B?dW1tVlJ3QTZtVTQ2WHZLeWhjTkUySmgwSUZBS3prVWs0cUlBQ1kyRHFJRStq?=
 =?utf-8?B?TjVneTVWcEJRdWN6L3ZoRlJhSVNhWTU4OHVtYk1WWDByWHV5Qkhqd0RCbFdm?=
 =?utf-8?B?dHdMcGZtTzRtb2U5Z3hEYmZmRDBvYWczbUMzK2h6TVhzOUYvQ0N5dThPWmpa?=
 =?utf-8?B?Vk1UYThDcGlMcFMvMFFoTlFJTzU4RUt3SllyOXRYQmdvaVE0WHVjZ1pXWVJ5?=
 =?utf-8?B?b2tGYVBPSUZsMzZwcGZsUEg4ZnBoV3ZyNys3UnlveURqWFJKUC95N1FDMGtv?=
 =?utf-8?B?Z0R5a1hQdnpETTZRSGNNTVExOFF2VHQyME8rOVBqNmx1OWY2RktNRGpsVnNr?=
 =?utf-8?B?VmRuN0ZkQmlwOWFST2sxUTdneDQ2YmVxVVlUSnlvL3Y1b1N0VDRoMnNYeUN1?=
 =?utf-8?B?MFEzak1pYXA5eGxYTENOa3QvRzJtbXRETExoUU8vclEvbnBIa2doUHBmeG92?=
 =?utf-8?B?QWNkUFVDOCtyOWw2bGJ5ZE1DelQ1S3dYMEhEd2hSRnhYR0JvZzQ0VVNhT3Vu?=
 =?utf-8?B?enQ5ZGdFWEgxaXpQU3BkZW1jNWhJazZCSDFqamdnNVlseEV2SnJEUlZRSVRh?=
 =?utf-8?B?Qm5WNUVROXVTVEZMQjRxM3ltWFpEc1hHR0VHNFFFSUt0NHZBbmlOK0RHUXRM?=
 =?utf-8?B?UTFrdDFZWThTakttbk1qNWZYdjdLTDVJU215YzBoWEdtd1plTlIvUmFtaWcw?=
 =?utf-8?B?TEp5NlRVSmlBYmh0M1JhNFFLNy9SN2dvMVFzUDRrLzc4aVVWM0Nha3M5cHBj?=
 =?utf-8?B?LzdmZmxqVU9EWHN2aVdOdGRJYXE1SitRa21GWWdORjBTYnZGbG1FUE1lL294?=
 =?utf-8?B?WGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 76421b31-f5ec-4ebb-7bf0-08de23735264
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 11:45:34.5954 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9YMzh7BNcfkbHpqi4sCSM4h4nWg6Z3gaDI1PR9hzsJ1x+z7iRFifRZgh6xAWhjkh9n4Cn/PCey0Sbo5grULLIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7337
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

Quoting Matt Roper (2025-11-13 20:40:39-03:00)
>The MOCS kunit test calls KUNIT_ASSERT_TRUE_MSG() with a condition of
>'true;' this prevents the assertion from ever failing.  Replace
>KUNIT_ASSERT_TRUE_MSG with KUNIT_FAIL_AND_ABORT to get the intended
>failure behavior in cases where forcewake was not acquired successfully.
>
>Fixes: 51c0ee84e4dc ("drm/xe/tests/mocs: Hold XE_FORCEWAKE_ALL for LNCF re=
gs")
>Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
>Cc: Gustavo Sousa <gustavo.sousa@intel.com>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>---
> drivers/gpu/drm/xe/tests/xe_mocs.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/tests/xe_mocs.c b/drivers/gpu/drm/xe/tests=
/xe_mocs.c
>index 0e502feaca81..6bb278167aaf 100644
>--- a/drivers/gpu/drm/xe/tests/xe_mocs.c
>+++ b/drivers/gpu/drm/xe/tests/xe_mocs.c
>@@ -49,7 +49,7 @@ static void read_l3cc_table(struct xe_gt *gt,
>         fw_ref =3D xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>         if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL)) {
>                 xe_force_wake_put(gt_to_fw(gt), fw_ref);
>-                KUNIT_ASSERT_TRUE_MSG(test, true, "Forcewake Failed.\n");
>+                KUNIT_FAIL_AND_ABORT(test, "Forcewake Failed.\n");
>         }
>=20
>         for (i =3D 0; i < info->num_mocs_regs; i++) {
>--=20
>2.51.1
>
