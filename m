Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35B95C71157
	for <intel-xe@archiver.kernel.org>; Tue, 17 Jun 2025 23:35:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BCC810E08B;
	Tue, 17 Jun 2025 23:35:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kvQK9QUh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A20310E08B
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Jun 2025 23:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750203318; x=1781739318;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=B7LmxCPdfkt26yoSVt3njCAblHb4OQHxsTJSIps7RHE=;
 b=kvQK9QUhDeK4QzKL5GrPdTsSTv40ieO14GEvXiLto1nXL6WljtgIJQn7
 1L/+8M2ASGNxRdC9jQ9PzNKOIaYKgJXlIiTdY4JPbL4/9qJZYHvQhHblR
 njtAMTWmOrEM4OPdyxaSctPKjV7OXBwHQQDDBaBQElemUgHsRR5Y2GHV7
 68m6H3TwqlERUwVwtg0xKDGBjPruS4P+dkgK2gAAakrDdx9A7DcZhTcOg
 BPhyx5+dLr2CnihMlMRIQcZpxHy0FcT0MG6DuW+AK4CdvHBWBkVbP4aa+
 HkREIVCU4Xjz+4h3SLCykFj3kQRowK2G/GuNkK4j/T+QntbY6+nmAIhk+ A==;
X-CSE-ConnectionGUID: v//O8TKjT9qtOLzhyibQuQ==
X-CSE-MsgGUID: HXFvNgl4Tn6661j/B4t1Ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="63823263"
X-IronPort-AV: E=Sophos;i="6.16,244,1744095600"; d="scan'208";a="63823263"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 16:35:15 -0700
X-CSE-ConnectionGUID: evQs5D5bSImXIh7yBZT2xA==
X-CSE-MsgGUID: 6JrJZOtySfabPg/nxFwhag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,244,1744095600"; d="scan'208";a="153719934"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 16:35:16 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 17 Jun 2025 16:35:14 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 17 Jun 2025 16:35:14 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.57)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 17 Jun 2025 16:35:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yNS2qrKs2wITZiKAM56ZmaOcRCeCykqz5mU8QbQtH08YHiRr7Ok45FzHrp1bKPweNx/M0UWdf+njfKsCDBJxM/p7mlbcNl+sVL4aZy83k28LHeuGtRT42aNj0xhnkG3+clkHSgooeMtV4STrNGDCFH7wcjtdbVMA9tAE4fcI8yxhac8aPqMvCc6bIaiV39BgpQdJN36hoeJIDRVhEAIHYrbNxmC4uJMH0OCxMBr9h4Jc9ng0jt86AgPXU7QzWgKWYlNkPHUnZOWCVTCLg6EszCZ8ZZ59yo7ThYB/67qsusxiDFjZLpHT8N6XuVzTCX/0jm45k0hyhj8kHGxw8AxerA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H6O5C68pNu0GClnqvDEaArgyyyAG9tfycL3VtOtGSjg=;
 b=rVAGEe+6ZpXGRSOmro5qUYFBOdO+WvA/5kOlTpOUG12W9dBkEzvjfzBCpWSJNvMfq/DiwXc50UJuGBnPjH8b9m953OFu5TRVYIvGHVrTT6I/SyGxT6PbNuttgBuTalw64shAKB/hSjxbTyhTwH8ZKEdhK7aVSdy4idbV1MCXYOmZBVW8FVZtJ8PidmMWaRNVNCMSA+TR4oFVdkZkFWvDUWZZBx8nCG4VLabpEyWYFZbcMBKXk7PHMtR94Ilsm/Czzy0/ZPwn9nLgrt3FF6xu9bu6yQPv8cvYW2WTsDqe5IfP80ASMlhfg17HFsH8tg/EmSinLaPbWS+c1tnzGtJsag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB6651.namprd11.prod.outlook.com (2603:10b6:510:1a9::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.19; Tue, 17 Jun
 2025 23:35:05 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8857.016; Tue, 17 Jun 2025
 23:35:05 +0000
Date: Tue, 17 Jun 2025 16:36:42 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, =?utf-8?Q?Micha=C5=82?= Winiarski
 <michal.winiarski@intel.com>, Tomasz Lis <tomasz.lis@intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Subject: Re: [PATCH v7 1/3] drm/xe/vf: Create contexts for CCS read write
Message-ID: <aFH8CvE82sWl0DNd@lstrano-desk.jf.intel.com>
References: <20250616150805.26780-1-satyanarayana.k.v.p@intel.com>
 <20250616150805.26780-2-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250616150805.26780-2-satyanarayana.k.v.p@intel.com>
X-ClientProxiedBy: MW4PR04CA0229.namprd04.prod.outlook.com
 (2603:10b6:303:87::24) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB6651:EE_
X-MS-Office365-Filtering-Correlation-Id: 9dccd958-7466-4bec-0251-08ddadf7965f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aEIxaDh3Y2twdmJ5OUQyMXNHem1EckhGU2Fubm5GSDRaMFkwRHNYYXB1aS80?=
 =?utf-8?B?QXBucDNMOTl4QlJPeHVWWFZGMnRFUmJIV2ovUWR2NTZ0NWw0WlQ3Y2J5WHU1?=
 =?utf-8?B?dG90MVJlZEIzTnZ4WTdqakJaeTllSWVLSE16T21Gem5YWnl6ZHp0MVFWQi9h?=
 =?utf-8?B?eDRaUjAzTUFGaHZTVTdSYmJRcFFqeXdDYWVyUlM3RHE5UGhSZDZoMXRIWDRm?=
 =?utf-8?B?ei9RUktOTS9zZ2RudU9JcWZLUElrZmc2NVRJa0Y3akdQb0w0VVV0NkRuN1Z6?=
 =?utf-8?B?Yk5meXAyVU1TNUJVS0ZjRGRCK0NyN3ZoRGNOb0ZwQ0RtbWpjdUR6bUx2SjQx?=
 =?utf-8?B?bnZPUngyUkFUNlNvTDhxVGlVUktQZ1gvUWR0dnhSanNZYzNxZEtwWGNIZUdW?=
 =?utf-8?B?Ukk1cUlmK1VGMzZlYVoxMnE5N2Q2Sk9wdjZrSHNmMmhsOEtnR1greHNLZEts?=
 =?utf-8?B?WEMxU0htME43Mk5DZWdyYmNDcFViN0ZGaUlwNXRkQzg5aHgxMERDZDZFTEM4?=
 =?utf-8?B?QTgxQmxEa2dqQ3ZQa0hoaVN1aXRDWUFEcTRZNGwwR29Cc0tDRnpzSWNvelhE?=
 =?utf-8?B?ck9uRUM0cDZyeHE1Vm9ISm51MlJkNVY1alJCV3hWUjFSM1lPOHBjaVVMdWpX?=
 =?utf-8?B?R0wyWXFuSkFxVDk4ek5GWkhnNjRybTI3dXVUNEhaTWdSSmQ1V2RqYS80U0tQ?=
 =?utf-8?B?QmlXb1U1UjNtcXhvWTZZVk52SXp2RHR4d3VZdi9mTUZtWFhDd0gxSWg4OU5L?=
 =?utf-8?B?bUVrRFdrVGJTVjY3Z0RRZWFqbnpCSWpVOHhFZVU2R0QyT1hhUjFNdmFRSzZv?=
 =?utf-8?B?R01rSzQrM0MybitZU1UyNmlxbTBVNFU1ODQ2MEV5QnYrbGdEdXJheHIvV3V3?=
 =?utf-8?B?YW0vQWtzZ0grZTFoQmRNWlRvUTlLVW9SYThHcGxHbXNINFJZZXEvUzZhQXc2?=
 =?utf-8?B?K2ROTWkxNzM2UHVtV3p5VUw1UGZjMWkzdnFVdkdUVndLMlNVbDlzOU1FcDE3?=
 =?utf-8?B?YlFpRnhGdCs0TGtoSHl4c1lSdEIvVStLV1p3Yk9PMU12aFNiUTJmRWxEcnpi?=
 =?utf-8?B?dlU0RDdQVGhOVk5obnpBbExWWmttQktDOWh1YWV3MGxpT2pPdVBWVFF3dDFO?=
 =?utf-8?B?Zm1JaWV3em8rZ0lKZlcxa1hZWndVMGtOUUNOMmxZWmRpOVJzaXBaZHpQcndi?=
 =?utf-8?B?SGZ1dmtEU1cxNUFLZlpxaGlyZVJsMmNLU2FoWkI4OU5BaVFlaSt2dmRBZWdx?=
 =?utf-8?B?Q2FEYmVvS0J0bGlYU2liQVlPZlIrTFl0aHVIS09oUzJCZG5ibzNTYXpqeWE5?=
 =?utf-8?B?Q1VlWHVsQ0FEaXJlS0hLcnF5YzRtL2hhNC9UK0p0V1YwOE1UdnNxdTBhK0ZQ?=
 =?utf-8?B?MmhpWVBEVDBwOEVldlRkMXhEK1lNZWtSYUNBbXRyVW5ENUVkWTlBSzZTWGR1?=
 =?utf-8?B?MXJIMG1QSWliMnpWM3k0K3N4N3R1am41S3VBY3Z4T1poMXc5OGR3WGc5ak1N?=
 =?utf-8?B?WlhtQmNPajYxVzUrNUM2a1krTnlsYXk2aEZmRUF1ei9mb0p2bmJkUUtXWGty?=
 =?utf-8?B?ZmpBQUorcXVoNXJ1Mnc1ZjFrSjZ6Q1hYRXF4U1drKzg1VU5OK3grOFE5ejVs?=
 =?utf-8?B?ME5BbjA5cVU5K3pFUmpac2NMQzJFZTU3b1hxUkxnWE9PUEVyenU4aXBoSENx?=
 =?utf-8?B?YXMxeVNTbVlWbHVmcElKWVZhek1vdVpPZjhuVmtrTmhWcytpbnNpUHA5MVYv?=
 =?utf-8?B?REFzZC9NRXFoUnowUm5xUjJqL1M3K21tL28zM0lkSEZiY1o1M1REV2t0QTdX?=
 =?utf-8?B?YWI5cGczNTFUbTVRRExQdStKZVo3elNSRmRKTUxnajZQeG44aVpubzhzUThw?=
 =?utf-8?B?RG5kd01ZY1lGLzY1T3R3MXJiVnY4ZndYcFp4TzRDWWY2Vnc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UzV3R25nakxQWUIwTFhoRGY5Q2Y3SnBvRGYwTlJJeEkxd2RvT0hWRXFucUJI?=
 =?utf-8?B?eUlkTHRzQTNxRCtmenFVRDhCZklROHFGN0FUZVRQOFB2cHhhNmJGVFFPTWNH?=
 =?utf-8?B?TFVWRE1VY2RNaXBhUnVXeWNId1FWVVl2dlBqOHJ5eFY0MnpESUg0NzBOVy9i?=
 =?utf-8?B?WkV1dDk4b2R2LzBXbytrSEcyRDlwTi9TbjJ0UEUzWnJ1Ym5QaXRKTmZLb1dB?=
 =?utf-8?B?cGlCWnVwaHh5OS9zMkNTcUEvd05TeFBRS0pXNmxGb1BGVzdrNnVkbUR0UzNu?=
 =?utf-8?B?RzViSTB0ZmlHa0ROT29iMHJla0FTWVRZdUdMbGJHVkZiLzV3TGRPQWNJVXp1?=
 =?utf-8?B?V1JYNTYxMHhsT0x5Ukh5dmhwUjBIQUF3MjBPS2hyV1FzYnBDeUFramtFRDhs?=
 =?utf-8?B?Wng0VHcyM3R4N1NERUloQi9BVCtldWYvYjdIM0hFak5oVlBTK3lKYUtkTFFU?=
 =?utf-8?B?Y05MdTd3L3ZFeHJrMUh5SjZRQ3lHMFJmYjZmaSs1WjBhM2FmUFFrdnowWEtl?=
 =?utf-8?B?bmtWWUV5Sis0WWczMktnb2dkTjZRQmNnNFkwNFFURGF6elpBUDh3NnRKcDVT?=
 =?utf-8?B?dmdJdWh4bnIxVmZtNHpQampocWU2UmVEMGdzR0I3cjNRWS9CV1c3Mnk3U2FS?=
 =?utf-8?B?YUlUcjVCWGZiczRGYnNxVHZZMEszUUZqbXlxK2h1TGJSVHJaQXV3U2FPc3Y5?=
 =?utf-8?B?em5aSnBuRGt0Ry9jL0RtN2VUT1pmeDd5cHI4RndBTlJDcEg1a3hTZEljUW1q?=
 =?utf-8?B?aVNCM3ZCZ0FQMWZ4OEEzS01VcFZBRmVWbklUQWc2bkpwNllRSU4xai9KQ0Z3?=
 =?utf-8?B?YVRpRHdOQ3ZOcjZSYUF3cU4zTU9zR2RHbXEvcVJXdGcxbWk5RnNIcjFBRFBr?=
 =?utf-8?B?eVNaRkNnWlZlTjdtd3hQNGFNeWJhK2dzY1ZLSHdsT3kwdVBYbnpsUXpBdFNE?=
 =?utf-8?B?bmFtWUVDUFo5TE9wTDdyMnduTzRmMXdlYmRtaU5mc3BzMm01U0hMK2d6UlU5?=
 =?utf-8?B?NFduenFmcG16Z2s1WHM2ais3SlRGOGxTY29Tb3RyNkJtanpJU2RTd05EUVRT?=
 =?utf-8?B?U0dBMlc2M2Y1dWtTd2U1NDc1VTJwTHdhRHdIWGNGNDE4MzFUYTVzMW5ZUndB?=
 =?utf-8?B?ZDlQZkNBS3hqNHU3WVVNWmVxL2l6U2piMTNMK1pjWG5YRE15eVJ4dWlHSEdU?=
 =?utf-8?B?bUVQS0tsaW1IOXhmZjJyaXFhZXUzVnRERmtsZ045VVBSMTBvVDZ1QjYrVkEx?=
 =?utf-8?B?akt3Ui9hdElScktaem9YbkgyTTR3WUgxM0g5dk1NNCs2ZG5IdjFxTVNRQnhX?=
 =?utf-8?B?SmV2VGhVS0pVR0pxRjNhMXhoQVJXTTZHNThSVUNrU2YzazNxNVJTV3oyVHcr?=
 =?utf-8?B?czVOUnc3aC9ZUXM1RkFseVZDMHZwMno5S2pYdzRjRm1NbytQWU9uenJCLzBu?=
 =?utf-8?B?eFFTSzFHQloyNlFKSGYwbWlzL05VclNobVdDNkdjNDZ1alFlVGVpQ0JYeTB1?=
 =?utf-8?B?S1RIWlN3NDFDSWxWZWxnUC9KRHNxRkorRWMycmJEYjRzKzQwT3lQVWRXVXpz?=
 =?utf-8?B?THBjdW1Lc2hUNW5hQjNaSVY0QVJXZGVuV1cwa2xsUUVXbWoxVzJZVTJBeWov?=
 =?utf-8?B?UFBycFBwN21yL0dCb2tSc2FyWldESFhjQ2dnZnp2N2NqaXRNTmpwdGhoUzg3?=
 =?utf-8?B?UjdzS05lOVN2WGxjRE5wMytLd0p2RXZIaEJCWTRkWjFKdDYwYTZydFppb2V6?=
 =?utf-8?B?RGZxcVlxYkFPL2llY0NXcU42MDRkZTBpWHNlK1BUVmMvK1hOYlNLUFlBR2hq?=
 =?utf-8?B?azdRN1UwUThtME9jcmRaUkF3L1ZxSGZIeXBrMTVpVGJ4aHpudUZKM0ZaUmtj?=
 =?utf-8?B?YzlCQWNSakVpV2xJeG5RM0FSS0VPQTdJRDFackFHVUNqUzJwZDNURjc0K1Fr?=
 =?utf-8?B?cGV4allIN3pseVFJdDFMdzZnT3RRdW1KWGdrZGR0ZVVVSlNrcXBTNjdVcklx?=
 =?utf-8?B?eGxlZm9FMm5ubkZybzBqcllYZ0c1MjVPOUtHd0ova213bmh2bkRSVXJjWFVs?=
 =?utf-8?B?SElMTit3VTFvVnNWRGRBdk4zYU4zZ1JvVnYxQXF4SUxndVVYRTN4L0ozOEFn?=
 =?utf-8?B?SjN6TEVxaks1T3lBSGxXNGpoeVlidk5aRXByRzNramdXMW43ZitPaXdPKzkv?=
 =?utf-8?B?ZHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dccd958-7466-4bec-0251-08ddadf7965f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 23:35:04.9714 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VgkrUvQCAK8x5leHXwAclcSpWa0VcPkmxFSNb1yviHVNf0ZAVV7YJL8hC4srBfJw3KTLGpcpjQO0/aXJnx/2FQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6651
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

On Mon, Jun 16, 2025 at 08:38:03PM +0530, Satyanarayana K V P wrote:
> Create two LRCs to handle CCS meta data read / write from CCS pool in the
> VM. Read context is used to hold GPU instructions to be executed at save
> time and write context is used to hold GPU instructions to be executed at
> the restore time.
> 
> Allocate batch buffer pool using suballocator for both read and write
> contexts.
> 
> Migration framework is reused to create LRCAs for read and write.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Michał Winiarski <michal.winiarski@intel.com>
> ---
> Cc: Tomasz Lis <tomasz.lis@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> 
> V6 -> V7:
> - Fixed review comments (Michal Wajdeczko & Matthew Brost).
> 
> V5 -> V6:
> - Added id field in the xe_tile_vf_ccs structure for self identification.
> 
> V4 -> V5:
> - Modified read/write contexts to enums from #defines (Matthew Brost).
> - The CCS BB pool size is calculated based on the system memory size (Michal
> Wajdeczko & Matthew Brost).
> 
> V3 -> V4:
> - Fixed issues reported by patchworks.
> 
> V2 -> V3:
> - Added new variable which denotes the initialization of contexts.
> 
> V1 -> V2:
> - Fixed review comments.
> ---
>  drivers/gpu/drm/xe/Makefile                |   1 +
>  drivers/gpu/drm/xe/xe_device.c             |   4 +
>  drivers/gpu/drm/xe/xe_device_types.h       |   4 +
>  drivers/gpu/drm/xe/xe_gt_debugfs.c         |  36 ++++
>  drivers/gpu/drm/xe/xe_sriov.c              |  19 ++
>  drivers/gpu/drm/xe/xe_sriov.h              |   1 +
>  drivers/gpu/drm/xe/xe_sriov_types.h        |   5 +
>  drivers/gpu/drm/xe/xe_sriov_vf_ccs.c       | 210 +++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_sriov_vf_ccs.h       |  13 ++
>  drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h |  45 +++++
>  10 files changed, 338 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
>  create mode 100644 drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
>  create mode 100644 drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index f5f5775acdc0..3b5241937742 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -140,6 +140,7 @@ xe-y += \
>  	xe_memirq.o \
>  	xe_sriov.o \
>  	xe_sriov_vf.o \
> +	xe_sriov_vf_ccs.o \
>  	xe_tile_sriov_vf.o
>  
>  xe-$(CONFIG_PCI_IOV) += \
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 7e87344943cd..c45f105eab0e 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -926,6 +926,10 @@ int xe_device_probe(struct xe_device *xe)
>  
>  	xe_vsec_init(xe);
>  
> +	err = xe_sriov_late_init(xe);
> +	if (err)
> +		goto err_unregister_display;
> +
>  	return devm_add_action_or_reset(xe->drm.dev, xe_device_sanitize, xe);
>  
>  err_unregister_display:
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index ac27389ccb8b..b932b679b40e 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -22,6 +22,7 @@
>  #include "xe_pmu_types.h"
>  #include "xe_pt_types.h"
>  #include "xe_sriov_types.h"
> +#include "xe_sriov_vf_ccs_types.h"
>  #include "xe_step_types.h"
>  #include "xe_survivability_mode_types.h"
>  #include "xe_ttm_vram_mgr_types.h"
> @@ -234,6 +235,9 @@ struct xe_tile {
>  		struct {
>  			/** @sriov.vf.ggtt_balloon: GGTT regions excluded from use. */
>  			struct xe_ggtt_node *ggtt_balloon[2];
> +
> +			/** @sriov.vf.ccs: CCS read and write contexts for VF. */
> +			struct xe_tile_vf_ccs ccs[XE_SRIOV_VF_CCS_CTX_COUNT];
>  		} vf;
>  	} sriov;
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> index 848618acdca8..404844515523 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> @@ -134,6 +134,30 @@ static int sa_info(struct xe_gt *gt, struct drm_printer *p)
>  	return 0;
>  }
>  
> +static int sa_info_vf_ccs(struct xe_gt *gt, struct drm_printer *p)
> +{
> +	struct xe_tile *tile = gt_to_tile(gt);
> +	struct xe_sa_manager *bb_pool;
> +	enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
> +
> +	if (!IS_VF_CCS_READY(gt_to_xe(gt)))
> +		return 0;
> +
> +	xe_pm_runtime_get(gt_to_xe(gt));
> +
> +	for_each_ccs_rw_ctx(ctx_id) {
> +		drm_printf(p, "ccs %s bb suballoc info\n", ctx_id ? "write" : "read");
> +		drm_printf(p, "-------------------------\n");
> +		bb_pool = tile->sriov.vf.ccs[ctx_id].mem.ccs_bb_pool;
> +		drm_suballoc_dump_debug_info(&bb_pool->base, p, bb_pool->gpu_addr);
> +		drm_puts(p, "\n");
> +	}
> +
> +	xe_pm_runtime_put(gt_to_xe(gt));
> +
> +	return 0;
> +}
> +
>  static int topology(struct xe_gt *gt, struct drm_printer *p)
>  {
>  	xe_pm_runtime_get(gt_to_xe(gt));
> @@ -303,6 +327,13 @@ static const struct drm_info_list vf_safe_debugfs_list[] = {
>  	{"hwconfig", .show = xe_gt_debugfs_simple_show, .data = hwconfig},
>  };
>  
> +/*
> + * only for GT debugfs files which are valid on VF. Not valid on PF.
> + */
> +static const struct drm_info_list vf_only_debugfs_list[] = {
> +	{"sa_info_vf_ccs", .show = xe_gt_debugfs_simple_show, .data = sa_info_vf_ccs},
> +};
> +
>  /* everything else should be added here */
>  static const struct drm_info_list pf_only_debugfs_list[] = {
>  	{"hw_engines", .show = xe_gt_debugfs_simple_show, .data = hw_engines},
> @@ -419,6 +450,11 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
>  		drm_debugfs_create_files(pf_only_debugfs_list,
>  					 ARRAY_SIZE(pf_only_debugfs_list),
>  					 root, minor);
> +	else
> +		drm_debugfs_create_files(vf_only_debugfs_list,
> +					 ARRAY_SIZE(vf_only_debugfs_list),
> +					 root, minor);
> +
>  
>  	xe_uc_debugfs_register(&gt->uc, root);
>  
> diff --git a/drivers/gpu/drm/xe/xe_sriov.c b/drivers/gpu/drm/xe/xe_sriov.c
> index a0eab44c0e76..87911fb4eea7 100644
> --- a/drivers/gpu/drm/xe/xe_sriov.c
> +++ b/drivers/gpu/drm/xe/xe_sriov.c
> @@ -15,6 +15,7 @@
>  #include "xe_sriov.h"
>  #include "xe_sriov_pf.h"
>  #include "xe_sriov_vf.h"
> +#include "xe_sriov_vf_ccs.h"
>  
>  /**
>   * xe_sriov_mode_to_string - Convert enum value to string.
> @@ -157,3 +158,21 @@ const char *xe_sriov_function_name(unsigned int n, char *buf, size_t size)
>  		strscpy(buf, "PF", size);
>  	return buf;
>  }
> +
> +/**
> + * xe_sriov_late_init() - SR-IOV late initialization functions.
> + * @xe: the &xe_device to initialize
> + *
> + * On VF this function will initialize code for CCS migration.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_sriov_late_init(struct xe_device *xe)
> +{
> +	int err = 0;
> +
> +	if (IS_VF_CCS_INIT_NEEDED(xe))
> +		err = xe_sriov_vf_ccs_init(xe);
> +
> +	return err;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_sriov.h b/drivers/gpu/drm/xe/xe_sriov.h
> index 688fbabf08f1..0e0c1abf2d14 100644
> --- a/drivers/gpu/drm/xe/xe_sriov.h
> +++ b/drivers/gpu/drm/xe/xe_sriov.h
> @@ -18,6 +18,7 @@ const char *xe_sriov_function_name(unsigned int n, char *buf, size_t len);
>  void xe_sriov_probe_early(struct xe_device *xe);
>  void xe_sriov_print_info(struct xe_device *xe, struct drm_printer *p);
>  int xe_sriov_init(struct xe_device *xe);
> +int xe_sriov_late_init(struct xe_device *xe);
>  
>  static inline enum xe_sriov_mode xe_device_sriov_mode(const struct xe_device *xe)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_sriov_types.h b/drivers/gpu/drm/xe/xe_sriov_types.h
> index ca94382a721e..8abfdb2c5ead 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_types.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_types.h
> @@ -71,6 +71,11 @@ struct xe_device_vf {
>  		/** @migration.gt_flags: Per-GT request flags for VF migration recovery */
>  		unsigned long gt_flags;
>  	} migration;
> +
> +	struct {
> +		/** @initialized: Initilalization of vf ccs is completed or not */
> +		bool initialized;
> +	} ccs;
>  };
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> new file mode 100644
> index 000000000000..ff5ad472eb96
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> @@ -0,0 +1,210 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#include "instructions/xe_mi_commands.h"
> +#include "instructions/xe_gpu_commands.h"
> +#include "xe_bo.h"
> +#include "xe_device.h"
> +#include "xe_migrate.h"
> +#include "xe_sa.h"
> +#include "xe_sriov_printk.h"
> +#include "xe_sriov_vf_ccs.h"
> +#include "xe_sriov_vf_ccs_types.h"
> +
> +/**
> + * DOC: VF save/restore of compression Meta Data
> + *
> + * VF KMD registers two special contexts/LRCAs.
> + *
> + * Save Context/LRCA: contain necessary cmds+page table to trigger Meta data /
> + * compression control surface (Aka CCS) save in regular System memory in VM.
> + *
> + * Restore Context/LRCA: contain necessary cmds+page table to trigger Meta data /
> + * compression control surface (Aka CCS) Restore from regular System memory in
> + * VM to corresponding CCS pool.
> + *
> + * Below diagram explain steps needed for VF save/Restore of compression Meta Data::
> + *
> + *    CCS Save    CCS Restore          VF KMD                          Guc       BCS
> + *     LRCA        LRCA
> + *      |           |                     |                              |         |
> + *      |           |                     |                              |         |
> + *      |     Create Save LRCA            |                              |         |
> + *     [ ]<----------------------------- [ ]                             |         |
> + *      |           |                     |                              |         |
> + *      |           |                     |                              |         |
> + *      |           |                     |       Register save LRCA     |         |
> + *      |           |                     |           with Guc           |         |
> + *      |           |                    [ ]--------------------------->[ ]        |
> + *      |           |                     |                              |         |
> + *      |           | Create restore LRCA |                              |         |
> + *      |          [ ]<------------------[ ]                             |         |
> + *      |           |                     |                              |         |
> + *      |           |                     |       Register restore LRCA  |         |
> + *      |           |                     |           with Guc           |         |
> + *      |           |                    [ ]--------------------------->[ ]        |
> + *      |           |                     |                              |         |
> + *      |           |                     |                              |         |
> + *      |           |                    [ ]-------------------------    |         |
> + *      |           |                    [ ]  Allocate main memory.  |   |         |
> + *      |           |                    [ ]  Allocate CCS memory.   |   |         |
> + *      |           |                    [ ]  Update Main memory &   |   |         |
> + *     [ ]<------------------------------[ ]  CCS pages PPGTT + BB   |   |         |
> + *      |          [ ]<------------------[ ]  cmds to save & restore.|   |         |
> + *      |           |                    [ ]<------------------------    |         |
> + *      |           |                     |                              |         |
> + *      |           |                     |                              |         |
> + *      |           |                     |                              |         |
> + *      :           :                     :                              :         :
> + *      ---------------------------- VF Paused -------------------------------------
> + *      |           |                     |                              |         |
> + *      |           |                     |                              |         |
> + *      |           |                     |                              |Schedule |
> + *      |           |                     |                              |CCS Save |
> + *      |           |                     |                              | LRCA    |
> + *      |           |                     |                             [ ]------>[ ]
> + *      |           |                     |                              |         |
> + *      |           |                     |                              |         |
> + *      |           |                     |                              |CCS save |
> + *      |           |                     |                              |completed|
> + *      |           |                     |                             [ ]<------[ ]
> + *      |           |                     |                              |         |
> + *      :           :                     :                              :         :
> + *      ---------------------------- VM Migrated -----------------------------------
> + *      |           |                     |                              |         |
> + *      |           |                     |                              |         |
> + *      :           :                     :                              :         :
> + *      ---------------------------- VF Resumed ------------------------------------
> + *      |           |                     |                              |         |
> + *      |           |                     |                              |         |
> + *      |           |                    [ ]--------------               |         |
> + *      |           |                    [ ] Fix up GGTT  |              |         |
> + *      |           |                    [ ]<-------------               |         |
> + *      |           |                     |                              |         |
> + *      |           |                     |                              |         |
> + *      |           |                     |  Notify VF_RESFIX_DONE       |         |
> + *      |           |                    [ ]--------------------------->[ ]        |
> + *      |           |                     |                              |         |
> + *      |           |                     |                              |Schedule |
> + *      |           |                     |                              |CCS      |
> + *      |           |                     |                              |Restore  |
> + *      |           |                     |                              |LRCA     |
> + *      |           |                     |                             [ ]------>[ ]
> + *      |           |                     |                              |         |
> + *      |           |                     |                              |         |
> + *      |           |                     |                              |CCS      |
> + *      |           |                     |                              |restore  |
> + *      |           |                     |                              |completed|
> + *      |           |                     |                             [ ]<------[ ]
> + *      |           |                     |                              |         |
> + *      |           |                     |                              |         |
> + *      |           |                     |  VF_RESFIX_DONE complete     |         |
> + *      |           |                     |       notification           |         |
> + *      |           |                    [ ]<---------------------------[ ]        |
> + *      |           |                     |                              |         |
> + *      |           |                     |                              |         |
> + *      :           :                     :                              :         :
> + *      ------------------------- Continue VM restore ------------------------------
> + */
> +
> +static u64 get_ccs_bb_pool_size(struct xe_device *xe)
> +{
> +	u64 sys_mem_size, ccs_mem_size, ptes, bb_pool_size;
> +	struct sysinfo si;
> +
> +	si_meminfo(&si);
> +	sys_mem_size = si.totalram * si.mem_unit;
> +	ccs_mem_size = sys_mem_size / NUM_BYTES_PER_CCS_BYTE(xe);
> +	ptes = DIV_ROUND_UP(sys_mem_size + ccs_mem_size, XE_PAGE_SIZE);
> +
> +	/**
> +	 * We need below BB size to hold PTE mappings and some DWs for copy
> +	 * command. In reality, we need space for many copy commands. So, let
> +	 * us allocate double the calculated size which is enough to holds GPU
> +	 * instructions for the whole region.
> +	 */
> +	bb_pool_size = ptes * sizeof(u32);
> +
> +	return round_up(bb_pool_size * 2, SZ_1M);
> +}
> +
> +static int alloc_bb_pool(struct xe_tile *tile, struct xe_tile_vf_ccs *ctx)
> +{
> +	struct xe_device *xe = tile_to_xe(tile);
> +	struct xe_sa_manager *sa_manager;
> +	u64 bb_pool_size;
> +	int offset, err;
> +
> +	bb_pool_size = get_ccs_bb_pool_size(xe);
> +	xe_sriov_info(xe, "Allocating %s CCS BB pool size = %lldMB\n",
> +		      ctx->ctx_id ? "Restore" : "Save", bb_pool_size / SZ_1M);
> +
> +	sa_manager = xe_sa_bo_manager_init(tile, bb_pool_size, SZ_16);
> +
> +	if (IS_ERR(sa_manager)) {
> +		xe_sriov_err(xe, "Suballocator init failed with error: %pe\n",
> +			     sa_manager);
> +		err = PTR_ERR(sa_manager);
> +		return err;
> +	}
> +
> +	offset = 0;
> +	xe_map_memset(xe, &sa_manager->bo->vmap, offset, MI_NOOP,
> +		      bb_pool_size);
> +
> +	offset = bb_pool_size - sizeof(u32);
> +	xe_map_wr(xe, &sa_manager->bo->vmap, offset, u32, MI_BATCH_BUFFER_END);

Does this work? I'd expect the prefetch mechanism to fetch into the next
and fault.

As I suggest in last patch I think this needs to be:

offset = bb_pool_size - sizeof(u32) - prefetch_size;

Then don't allocate the 'sizeof(u32) - prefetch_size' in the SA.

Matt

> +
> +	ctx->mem.ccs_bb_pool = sa_manager;
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_sriov_vf_ccs_init - Setup LRCA for save & restore.
> + * @xe: the &xe_device to start recovery on
> + *
> + * This function shall be called only by VF. It initializes
> + * LRCA and suballocator needed for CCS save & restore.
> + *
> + * Return: 0 on success. Negative error code on failure.
> + */
> +int xe_sriov_vf_ccs_init(struct xe_device *xe)
> +{
> +	enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
> +	struct xe_migrate *migrate;
> +	struct xe_tile_vf_ccs *ctx;
> +	struct xe_tile *tile;
> +	int tile_id, err;
> +
> +	xe_assert(xe, IS_SRIOV_VF(xe));
> +	xe_assert(xe, !IS_DGFX(xe));
> +	xe_assert(xe, xe_device_has_flat_ccs(xe));
> +
> +	for_each_tile(tile, xe, tile_id) {
> +		for_each_ccs_rw_ctx(ctx_id) {
> +			ctx = &tile->sriov.vf.ccs[ctx_id];
> +			ctx->ctx_id = ctx_id;
> +
> +			migrate = xe_migrate_init(tile);
> +			if (IS_ERR(migrate)) {
> +				err = PTR_ERR(migrate);
> +				goto err_ret;
> +			}
> +			ctx->migrate = migrate;
> +
> +			err = alloc_bb_pool(tile, ctx);
> +			if (err)
> +				goto err_ret;
> +		}
> +	}
> +
> +	xe->sriov.vf.ccs.initialized = 1;
> +
> +	return 0;
> +
> +err_ret:
> +	return err;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
> new file mode 100644
> index 000000000000..5df9ba028d14
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _XE_SRIOV_VF_CCS_H_
> +#define _XE_SRIOV_VF_CCS_H_
> +
> +struct xe_device;
> +
> +int xe_sriov_vf_ccs_init(struct xe_device *xe);
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h b/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
> new file mode 100644
> index 000000000000..6dc279d206ec
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
> @@ -0,0 +1,45 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _XE_SRIOV_VF_CCS_TYPES_H_
> +#define _XE_SRIOV_VF_CCS_TYPES_H_
> +
> +#define for_each_ccs_rw_ctx(id__) \
> +	for ((id__) = 0; (id__) < XE_SRIOV_VF_CCS_CTX_COUNT; (id__)++)
> +
> +#define IS_VF_CCS_READY(xe) ({ \
> +		struct xe_device *___xe = (xe); \
> +		xe_assert(___xe, IS_SRIOV_VF(___xe)); \
> +		___xe->sriov.vf.ccs.initialized; \
> +		})
> +
> +#define IS_VF_CCS_INIT_NEEDED(xe) ({\
> +		struct xe_device *___xe = (xe); \
> +		IS_SRIOV_VF(___xe) && !IS_DGFX(___xe) && \
> +		xe_device_has_flat_ccs(___xe) && GRAPHICS_VER(___xe) >= 20; \
> +		})
> +
> +enum xe_sriov_vf_ccs_rw_ctxs {
> +	XE_SRIOV_VF_CCS_READ_CTX,
> +	XE_SRIOV_VF_CCS_WRITE_CTX,
> +	XE_SRIOV_VF_CCS_CTX_COUNT
> +};
> +
> +struct xe_migrate;
> +struct xe_sa_manager;
> +
> +struct xe_tile_vf_ccs {
> +	/** @id: Id to which context it belongs to */
> +	enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
> +	/** @migrate: Migration helper for save/restore of CCS data */
> +	struct xe_migrate *migrate;
> +
> +	struct {
> +		/** @ccs_rw_bb_pool: Pool from which batch buffers are allocated. */
> +		struct xe_sa_manager *ccs_bb_pool;
> +	} mem;
> +};
> +
> +#endif
> -- 
> 2.43.0
> 
