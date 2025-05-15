Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0C50C2D0CD
	for <intel-xe@archiver.kernel.org>; Thu, 15 May 2025 22:08:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8797610E96C;
	Thu, 15 May 2025 22:08:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="awaxzp4C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3403B10E96C
 for <intel-xe@lists.freedesktop.org>; Thu, 15 May 2025 22:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747346914; x=1778882914;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=EAvkG6RpdYj2imhuKN/evlues6IAr/0JvY8au2sNkmk=;
 b=awaxzp4CA5gN7pHf5SdtCyiyDEacaysaW0r8z8mUsKZcs6sNW1YJHWhi
 y2CoFXYQgWvfQ1LyyOx8KLixPRAcvTO9kcfFNFgnxdgLgmTxw7mJ+EfeT
 0CugOMQcgl6f4/1ugFboKpDNdHlYLutXlUdan7FXTzLz0BaqwDRa/lv2i
 TqMU6oHJLcyZkV8varDtPARd4BRzXN4ahqBpAkZkIu7S19GdayXnCHaan
 Gv5TKJg4sTSpsqMZ3AyRKiT+N6A1ErdJSkNGtStUIUChCiaHCjVxOVVAi
 eAUFYby4MISvb03zF83zlnQuxCLe+5+MWn+656a4ov1u9/HHCpM4hMipQ A==;
X-CSE-ConnectionGUID: QhEuIT8eS6SI2R5NuUjsCw==
X-CSE-MsgGUID: d89/+QoAQzqLu8h3wVFYcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="53109936"
X-IronPort-AV: E=Sophos;i="6.15,292,1739865600"; d="scan'208";a="53109936"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 15:08:31 -0700
X-CSE-ConnectionGUID: gOcWQnbkSkGU44DCBPSKxA==
X-CSE-MsgGUID: PQmKvfyERgCPGCydKo1rJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,292,1739865600"; d="scan'208";a="169573594"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 15:08:31 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 15 May 2025 15:08:30 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 15 May 2025 15:08:30 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 15 May 2025 15:08:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cH36XexDPEVs31aHQa8kRdKMXb9dkuHVKoc9R19bk6gzME2uLKcpiZSYbDvhPbUC7RJxnv0dgQqRbDA2JAodDFQRCJm2mif23AvbMoSvo/gxkx7Je19MocLmAiG/zZwRNi503bPF1NHas8UxAxH7Yj1pVJtu25aHuXYIgkGYq6rc/X+yJPYMDEFt7rfoTXS6SUn5t+7HrTKnZJrqsq9FXRKGjj/0pOrNNX5pBoctOSf95HNtIeewmXfoMbrxLbr+hclVqXvjS2xL2/PLd9b86VhclxWmact2wpRtGYOhFpZGU5rnutqiEzANXQhTH0AvGVy/06YLLobeyhhR2cZumg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2179zXaGvUXx5nCI+YdnJRQS3rmSA350lOOIyCxDwSA=;
 b=UgUzZy+ODSI7b5L3WhunF4VJUAUGJPLhTQEN2UiurJZ6KYmZgVHvlRqflrKX3KPuTXea1WmbGMiljoRqOfIvuvyAXw3VeX5VaNEpyopKb86BVclq+d5RWh3ZWoayPVvF/hzTM8Egx27z7l4qwrKysfhnhxi2uMNZwvF5NiLzQbLsaMR2+nAfhmVi8v2FB5dHpveD4sV8fM0bp2NddaIv24hyG2OOOqMz+fQmzThLyZLfEsKhI/G5J+yUXfyGUtpLf/FNyBD0qKYB6DQ1jo3NknmC+BgCg9/+bvQMWKP/0+qTfU4JVLFcZscd+vSGIF/GnlR/jzCjQq437uOhXcF0mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6714.namprd11.prod.outlook.com (2603:10b6:303:20f::20)
 by SJ2PR11MB7716.namprd11.prod.outlook.com (2603:10b6:a03:4f2::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Thu, 15 May
 2025 22:08:28 +0000
Received: from MW4PR11MB6714.namprd11.prod.outlook.com
 ([fe80::e8c7:f61:d9d6:32a2]) by MW4PR11MB6714.namprd11.prod.outlook.com
 ([fe80::e8c7:f61:d9d6:32a2%6]) with mapi id 15.20.8722.027; Thu, 15 May 2025
 22:08:28 +0000
Message-ID: <72e91e4f-64b0-4b49-a82d-0c67547c968b@intel.com>
Date: Fri, 16 May 2025 00:08:23 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 7/7] drm/xe/vf: Post migration, repopulate ring area
 for pending request
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>
References: <20250513224952.701343-1-tomasz.lis@intel.com>
 <20250513224952.701343-8-tomasz.lis@intel.com>
 <0c554f88-cf3e-49cf-9fdc-376c906c2a90@intel.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <0c554f88-cf3e-49cf-9fdc-376c906c2a90@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR07CA0288.eurprd07.prod.outlook.com
 (2603:10a6:800:130::16) To MW4PR11MB6714.namprd11.prod.outlook.com
 (2603:10b6:303:20f::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6714:EE_|SJ2PR11MB7716:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ae208fe-3047-405d-eac7-08dd93fd0573
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dHc2azVxRzdhR1FLVUJhbzVDV0FhUXphYjhaWkV6Vm5jZ1FPdTdmZ250R3Jq?=
 =?utf-8?B?ZXFCL2RCUk9VNWs3RHJnMU1raE95YVoxVFlETUtZcnk0ODd5OWZUdzJJZFNy?=
 =?utf-8?B?SWtoRzVkSXJLaTVRYzIwZm9obVAvNS9mTFFTc3dDRG1JaHZOWmVMWEkzbm9w?=
 =?utf-8?B?dGhtSkkvMzJVMDRETmh3a1dMOGNaTDBTMUl3Nmt1cGhqbnVpYzBXNzF3RWZH?=
 =?utf-8?B?bWxFWUswMWhNbFlkdjk3M0JoenVoVHNaZTlXaThYS05UaXRNaUZRS1ozWENn?=
 =?utf-8?B?dW5DWVRPbTRmSkV4TkhqdkdFUkc5dGpuSCtZb2pXTDJkTVpYdE1NNjlUREEz?=
 =?utf-8?B?c3VrVjN5SUtVS2pSVnFTeWkvOHJ4aUxyajh0WktLdHhMKzB6d2dXRFg0MlVD?=
 =?utf-8?B?L0FhRC9OSnRUb3NqY0FWWlVHS3c0eU5EbWxxSEVaOUpxOUQyUFFFLzllRytC?=
 =?utf-8?B?eGpQaGtUcGlFc254bXBOSFl1VWNkR0FRUFZmcFpCK3VSYkttQTZXd3RZUzA2?=
 =?utf-8?B?bko4UktKazlveGQyYS92UTdTcDNRSU9MYXFRTUZ3ejJXR3JtTUdNTUZoRXVj?=
 =?utf-8?B?allVazRFWnZOOG04a2tsTUg2UW9EamQyQWtQV1lZcmJNdThRL0I3aDlEZWJh?=
 =?utf-8?B?azhPRGRrbXlZUmY1emM0eElUajE4NnNqOFV2VGNuVHVrQWYvNmNHY2VhNm9H?=
 =?utf-8?B?bytxdGNFbVUvanJuL2wrbEpDWW1GeWhwZHdObXFIN1Q0NFRjYytPbmlBcldN?=
 =?utf-8?B?ZnI4dUlNNmtJSExUWUJRVWdBQTNDVHFDNGhUb3NsYlpYaHU3R1VpN01DekN3?=
 =?utf-8?B?OE5pbFNOZlpwZGVMSlZaL1pjYldUWEE0RTd1N3pLek5zMjNIRklvWmJFZThN?=
 =?utf-8?B?dHBodHB2V1VpNTB2ZDNyVStjNDNsemxKeHROTkI5NDdlL0U4dUJmeXM0RDQy?=
 =?utf-8?B?L25yTnpDOW9XSkkxWlpnUTZmTzBETXRsN3RhVWJvbi9FSmZEREVoWncrc2VL?=
 =?utf-8?B?SWhWM2JaSm9kWXE2N2I5RzFrL3lvcWV2L0xUYmFwS09QZ2VuQlZzU3Y5WTgx?=
 =?utf-8?B?UFRFSE4xa3Y1UGlMUWtIV25LOFNzZlBWY0JTUWRxSUNia2VwemNqY081SFFR?=
 =?utf-8?B?b0FkOTdnaE1ZYnVDZWRZNWJGY1RSWGVwS1hST0FHTzArdkYzUy93NWFPb1Y2?=
 =?utf-8?B?aVVrVXVKM2g0ajZNR3p3dks0U2g0YURCZlNGVjkyQ1JOR2ZmT2kzaXBQQktr?=
 =?utf-8?B?TlJQa2xrSkx6ZndOeXM3cDRJbWh2RG02WlJxM2c5bHpVVHFOcFdqOVdyZVA5?=
 =?utf-8?B?VXhWWUM3d2tZbWRRaXZvalUvK3o3YUhkenhIWkxFMGw0OU5MaE5JTGhlOGNZ?=
 =?utf-8?B?cXBwcE5zMWxnQ2pMWUdNTDVORVBOQUhaMmgydmg2Vy9USnBHT0xtU09adnJL?=
 =?utf-8?B?L1JFWlUrWUpwY09ZT2dKRnQ0VzVZYjJkMjJrdVNyWUNZekUzS21UNjhldVM3?=
 =?utf-8?B?eUJHZXhZa0tIRlYrWXZqTmVtQ3U1MVR3bklHSGcrNXNyT3BsR05MZXgvWG5w?=
 =?utf-8?B?THFEcVlETEtoa2N6dENXUUgxL0ltNzkyTG1ZM3ZWWER0amtiMUQ2bmhCRlJG?=
 =?utf-8?B?Zmt2bWoxUzhJd1oxb0hJZ2YwZjRmSkpUbFNUMTJDSk5WY3RsdFprYjVhdlZz?=
 =?utf-8?B?RDZTbmNXcjlpbHFQdTg4Qytoc2QvN2xaZ0hNTk15TGZyNXY0R2ZSVEF0OTQ1?=
 =?utf-8?B?MHZaTEFRSi9MZ3NjTXZDRWxrakIyQUVoRDJRL1J2YW5JYkZIMVE1UGhhbWdJ?=
 =?utf-8?B?Z2Vqc0w2VmNmZ240OXdEZGZGb0VhbkZrcGFXTkkreFU2eXFXVXYrVFZSdW4r?=
 =?utf-8?B?WnhwdWt4K3VHSVVLMnBQZ1AwbVJ6WGZTcG1nQ1N3ZGVvRW1MZjYrOUhiSnBv?=
 =?utf-8?Q?oARQtPo+D9E=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6714.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ckZMYkVvcWQwYnpDMVFTdlRTaUk3clUyUjJVTS92b0xFUmg1ZGROREpIWTVY?=
 =?utf-8?B?Tkp6LzFzYnoxQlZ1ZXVYN2pzaGNSMzBxVTNxMVVTVFUzbFFWbUdCSWViem1L?=
 =?utf-8?B?eERWb25lamd1TWFGbnI4T3d5ZmdOVDhDQVlkT2NDUHZLdnZnQitpSlNXbTJC?=
 =?utf-8?B?T2ZkME1QSkdOVWgvTUc0bFYrdTBaTkRYWnhhTTg5eDZBc2dkWFF1eGhtLzlW?=
 =?utf-8?B?YXZFYkZMeXpCMU1VVG5VaSt3dUc2eTNtRnNVd29LKzZaSVNNeW5rR3JURFg1?=
 =?utf-8?B?cmlHMnBSbWdVMEk1d25TZnNIdmd0cW5reUtqVHVEQTQ5bi9xM3c3RWdodTRw?=
 =?utf-8?B?UTF4R0ZjY05wYkprZU55VU1yTXJJcjB5anRaMUxzVHNXM2FqWkY2Tkh0SjlI?=
 =?utf-8?B?VExoUUFSNGVZZ29yWE9KdFVnQ2VrRnpqUWs1S3pWcVZSdjZpTlJWM3pjSENY?=
 =?utf-8?B?QVdoZjMybGxIaFMxMG5TZ2FoR1pVWkVrSmFiMlhKY2Mzd1IvNHJCMC9KWURq?=
 =?utf-8?B?cmRXcjY0dHIxbXhWL0FuZXlTUkt6WXJkSVBpelplcGJ1MDhINzRMazBuSWRI?=
 =?utf-8?B?NXk5d2hYVXM0S3FySGxoWkFQWE5mUnRvS2R2RkluNEwzTUNweTN2WlpIV2RW?=
 =?utf-8?B?WFdpV3dWK2NqL0tPS1dtMXlFR3JIbU82KzU1K2tKTHdtZUJZRVhHQkR5d2or?=
 =?utf-8?B?ZmR3RjliVlpXQXVmNGhxTXRrUXM3aEpCa20xOXlvN01STlBpYTJtclVoQXVQ?=
 =?utf-8?B?MWJHTGpFcy9wZHRMeWVPMlFTb3hpRDFrM3dRbDVMWHUyeTZKUlVvM2hRSW5t?=
 =?utf-8?B?VnJwTHUzVEVyaXhrMWRjR2tvb2dTQnYrdWZlOFQzZ3RuYk9pUlBFeWxVSk9N?=
 =?utf-8?B?WVI5VkFSNTcrSGJsaitHbElWMEdsQ2h2Wll1UDRZUjNib05PeUg4TGxXZmlP?=
 =?utf-8?B?OG5ZK1R3K2VHUlJ0NmpXblJtWkRGTHN6c2o0ZlZzMCtJZDdVeVRsL1M4NUNn?=
 =?utf-8?B?bUxHOWhMSXUxMUVQclBabldpQmJ6bDBWY3FvNzY0d0dHck1yZVlqWHRPenlo?=
 =?utf-8?B?WTRpdXk4cVpyRGVaaUQyUlNQakxNZlBFVXk5MjJCa2t3eENKLzNPcTNSR0hx?=
 =?utf-8?B?OFhzM095L1lSMklib2dUNDdyWkVnQkFPRHVFdjN6VDRPSWx6VTBiTG5IWFhp?=
 =?utf-8?B?cnJNNjIrQXZ6ZXBqdzFjYzRUdlYwNDV4UFp3OGRTRGh4cXc4N21aZnovanE4?=
 =?utf-8?B?TWJJeXphcnNwRXMxWWF6Y1NWL1Jjb3FOeDhWVXJBWCtBZ2s0YXFsVit5YXlQ?=
 =?utf-8?B?OW40Y0JUcGFISVFHRmtnenVXTHRmOTNNclRaaFVKUllkeDRpNVZMUEZaSzI2?=
 =?utf-8?B?OWNocHp4ZHFqNEZYTTBubGJJVnIvWU5hb0Q1amtCYW54blVQVkJuOElqbkJR?=
 =?utf-8?B?Mjc3VEN5Sm9QT1dJVGlDM0R2WDF0bGl5Mk5rd1ZmeTZ1OGNKSnViQjZXRFpm?=
 =?utf-8?B?cEN5a053OWFhdHRzMitWaFBWaGFyazNFbVRDMXRGaWZyZ1V2WnFQMVhPZW5Y?=
 =?utf-8?B?bkxRckpnNVFBaGwvRmp2bG1HcjNaOWxhenFLN0tvUDlCbHl2SlExNHBmdVNx?=
 =?utf-8?B?N2cyWEpsY09SSVpRODFGUUF6ZUZVRkZwQzNWQmp2a2ZaTTZKZldHRkhzb1Fl?=
 =?utf-8?B?bGFiT05ZekUxWGtRSjM5UFNTVEUzZ1l2OWpiRVByK0RoNkxndmtuL2pkL0hM?=
 =?utf-8?B?Sm4xbXZwQnlHNWd5MmZZYzBhUW5pcTBGbDJkK2dwZVNWWExoTnVVcTc4Skpj?=
 =?utf-8?B?amJmYUNna2M0NnAwMStWSGFpMHAwcWZnQ0NlNFlPdnJBdENUMWtJWFljYm8v?=
 =?utf-8?B?Q1h0U0U3K2RZUGZjVzVIbTcwMXJEM3JpZEtJeXBDaTFrVVpCTEpVN3ZrT3ZR?=
 =?utf-8?B?VmhqL3dGY01JTkd6SFF2MDM2WFVGK294T0x5NXRkbklZWWxPU2x5VWJrdVRh?=
 =?utf-8?B?aUtBSnBFYWg1TThsVmowcWpjUzVGL3IxWmlCbjdHSklQcjRkRE10SUxaN3Ex?=
 =?utf-8?B?ZGdNNW5rL3ZsU1pmUnhZZHRTQ0xtWnRtTzB1bjhMZEs5MXZKTU80VS9jNDMv?=
 =?utf-8?Q?cey9f5N0QFkyPoKsTxeN0bZZE?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ae208fe-3047-405d-eac7-08dd93fd0573
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6714.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 22:08:28.7153 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hpN6E5bapbUkcIFK+tT+NXEcJ0pZ46XSO+4sCWQnikVaMXgYVBcTds4E7UW1ICWElDzLuKWjaJZimUj2UuDlbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7716
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


On 14.05.2025 20:49, Michal Wajdeczko wrote:
>
> On 14.05.2025 00:49, Tomasz Lis wrote:
>> The commands within ring area allocated for a request may contain
>> references to GGTT. These references require update after VF
>> migration, in order to continue any preempted LRCs, or jobs which
>> were emitted to the ring but not sent to GuC yet.
>>
>> This change calls the emit function again for all such jobs,
>> as part of post-migration recovery.
>>
>> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc_submit.c | 20 ++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_guc_submit.h |  2 ++
>>   drivers/gpu/drm/xe/xe_sriov_vf.c   | 23 +++++++++++++++++++++++
>>   3 files changed, 45 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>> index c485272829a6..238b6691d575 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>> @@ -766,6 +766,26 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
>>   	return fence;
>>   }
>>   
>> +/**
>> + * xe_exec_queue_jobs_ring_restore - Re-emit ring commands of requests pending on given queue.
>> + * @eq: the &xe_exec_queue struct instance
>> + */
>> +void xe_exec_queue_jobs_ring_restore(struct xe_exec_queue *eq)
> are you sure this function shouldn't be placed in xe_exec_queue.c ?
will move.
>> +{
>> +	struct xe_gpu_scheduler *sched = &eq->guc->sched;
>> +	struct xe_sched_job *job;
>> +
>> +	if (exec_queue_killed_or_banned_or_wedged(eq))
> this condition likely can be checked by the caller (in xe_guc_submit.c)
since keeping it in the moved function would require adding #includes, 
yes this makes sense.
>> +		return;
>> +
>> +	list_for_each_entry(job, &sched->base.pending_list, drm.list) {
>> +		if (xe_sched_job_is_error(job))
>> +			continue;
>> +
>> +		eq->ring_ops->emit_job(job);
>> +	}
>> +}
>> +
>>   static void guc_exec_queue_free_job(struct drm_sched_job *drm_job)
>>   {
>>   	struct xe_sched_job *job = to_xe_sched_job(drm_job);
>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
>> index 2c2d2936440d..55398e292b79 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_submit.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.h
>> @@ -33,6 +33,8 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
>>   int xe_guc_exec_queue_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32 len);
>>   int xe_guc_error_capture_handler(struct xe_guc *guc, u32 *msg, u32 len);
>>   
>> +void xe_exec_queue_jobs_ring_restore(struct xe_exec_queue *eq);
>> +
>>   struct xe_guc_submit_exec_queue_snapshot *
>>   xe_guc_exec_queue_snapshot_capture(struct xe_exec_queue *q);
>>   void
>> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
>> index c08c44dbd383..2ff1383f0b1a 100644
>> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
>> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
>> @@ -8,6 +8,7 @@
>>   #include "xe_assert.h"
>>   #include "xe_device.h"
>>   #include "xe_exec_queue_types.h"
>> +#include "xe_guc_exec_queue_types.h"
>>   #include "xe_gt.h"
>>   #include "xe_gt_sriov_printk.h"
>>   #include "xe_gt_sriov_vf.h"
>> @@ -16,6 +17,7 @@
>>   #include "xe_irq.h"
>>   #include "xe_lrc.h"
>>   #include "xe_pm.h"
>> +#include "xe_sched_job_types.h"
>>   #include "xe_sriov.h"
>>   #include "xe_sriov_printk.h"
>>   #include "xe_sriov_vf.h"
>> @@ -266,6 +268,26 @@ static void vf_post_migration_fixup_contexts(struct xe_device *xe)
>>   	}
>>   }
>>   
>> +static void xe_guc_jobs_ring_rebase(struct xe_guc *guc)
> and this one in xe_guc_submit.c ?
ok
>> +{
>> +	struct xe_exec_queue *eq;
>> +	unsigned long index;
>> +
>> +	mutex_lock(&guc->submission_state.lock);
>> +	xa_for_each(&guc->submission_state.exec_queue_lookup, index, eq)
>> +		xe_exec_queue_jobs_ring_restore(eq);
>> +	mutex_unlock(&guc->submission_state.lock);
>> +}
>> +
>> +static void vf_post_migration_fixup_jobs(struct xe_device *xe)
>> +{
>> +	struct xe_gt *gt;
>> +	unsigned int id;
>> +
>> +	for_each_gt(gt, xe, id)
>> +		xe_guc_jobs_ring_rebase(&gt->uc.guc);
>> +}
>> +
>>   static void vf_post_migration_fixup_ctb(struct xe_device *xe)
>>   {
>>   	struct xe_gt *gt;
>> @@ -348,6 +370,7 @@ static void vf_post_migration_recovery(struct xe_device *xe)
>>   	need_fixups = vf_post_migration_fixup_ggtt_nodes(xe);
>>   	if (need_fixups) {
>>   		vf_post_migration_fixup_contexts(xe);
>> +		vf_post_migration_fixup_jobs(xe);
> in patch 5/7 you've dropped FIXME so I'm surprised by this step ;)

Yes, I was considering merging this with contexts fixup as it iterates 
through the same list with same lock..

Will make sure the comment is removed here.

-Tomasz

>>   		vf_post_migration_fixup_ctb(xe);
>>   	}
>>   
