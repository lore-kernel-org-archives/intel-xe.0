Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68D09C87FCF
	for <intel-xe@archiver.kernel.org>; Wed, 13 Aug 2025 06:58:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29C0110E1C6;
	Wed, 13 Aug 2025 06:58:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C0GmT0Na";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF91010E1C6
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Aug 2025 06:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755068298; x=1786604298;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Dwj5EgsMLEFLvxmMm7d+RfC8IJd4IcxkSscAnGJzMDQ=;
 b=C0GmT0Na5hKw6y81R03V+wbThkgqf352Nq8aA6DaQLlfvbtvTEEVNlCO
 YrOzboEcEUrBomSdFxSX4heG9OuSSMwVfgT4Y2tvDXCtnJGbW/gUqT5HX
 W+GIVquZA0mwq1MCi3sNYYqpnUUyg5/S94sW5D7l98NWHxowCHUcUXOaJ
 B1PHygXr123mQOr9MveRnVLJDGiu4yWDCQPQh2bG8P9zfLTrkYnguWT3o
 bp0MiRsgK1JTkEAqcA1z8wpBouJAtvKgzPttOW/2eij1oPYEl7W7IBPFZ
 g+/tkpqogNYIm/ZzLkly4ch7P5XQLQDsr5EGtvK9WIxxQOitoh4i2ZpPp A==;
X-CSE-ConnectionGUID: VRD71yZ9RvGpc+b60AiUUw==
X-CSE-MsgGUID: 6QJ7+0KgQSaCmF8EYARzTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="56379908"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="56379908"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2025 23:58:17 -0700
X-CSE-ConnectionGUID: MudKsHNKQCy3R0UpSQMdTA==
X-CSE-MsgGUID: OPHc+zMNSDWiAWKQWMqZCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="197252973"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2025 23:58:17 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 12 Aug 2025 23:58:17 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 12 Aug 2025 23:58:17 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.77) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 12 Aug 2025 23:58:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L+5DAMoRCjme2NMrw4Gb9gRiGd0HNDGWLjkcGawnbjMqEEcTV+7WusLVXF6J7vgMQsNh6EfOytU/geqylNeYpDulCAOOQZbX38xLfCTOwCgBB/SLm3QbNRuCjE0qquDJY5cmNvX59kMan9rnB541MbDLVAxXfjoriMEZBoJyvNC5FUVOZjzsjh2VpIjnPJNM+20BF1YTzn3ZQD2mdZ9DdjsPQdFEfzViCu6Yn8kmOysIQmHpPQ3G7CDVgDPGDptqYsW9ThVorA6Bx5yEwPjf3sLHXd//JZ/WJTLoUttge0WYYSR2nHXY5MnAjgUd5CoC2OkaWqfN/LMlAyZDRppe0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TcJ0IhDK/Kdk+iELF3YrbskynIEnznWcVpABmNq4th0=;
 b=u7Y+Lu1w1vxvNvQZh2Hn5+ir1+4XE52vnvP1vr2jp1juVtkixLWUboliKS4hdGaLufLdB0eIKVaQnQi4trtAPyIc3HQh+RCm1ApqMYM27Z1N0WLh+KbtYztF/XqJ6e9goVEGdcorN3IjisKe+RZUuypW3FqlZXiEdKUYqvQNeWUEhhSzNJ+QSGjm7NdN4Ocqwjtcl3RTmm2w6GOJJpetEoSzdGa+J96AF/pkD5Mqe7ddlJfpoQWXnHncrWQOs6ERR1lGJ4SCRERZG0MLOb6JlOd8GiD36q8ZgGrgqX1mtt5G5AuEmPRI5Tknt5Gu2ruEe64rsJo8Sm4KZqj8sObFIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 LV1PR11MB8818.namprd11.prod.outlook.com (2603:10b6:408:2b5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Wed, 13 Aug
 2025 06:58:14 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%6]) with mapi id 15.20.9031.012; Wed, 13 Aug 2025
 06:58:14 +0000
Message-ID: <531d08f5-7a3f-4f47-9c60-e55eed1088bc@intel.com>
Date: Wed, 13 Aug 2025 12:28:07 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/13] drm/xe/configfs: Allow to enable PSMI
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <prashanth.kumar@intel.com>, <dnyaneshwar.bhadane@intel.com>, Matt Roper
 <matthew.d.roper@intel.com>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>, John Harrison <John.C.Harrison@Intel.com>
References: <20250808-psmi-v3-0-a111e9f1e4b7@intel.com>
 <20250808-psmi-v3-7-a111e9f1e4b7@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20250808-psmi-v3-7-a111e9f1e4b7@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0122.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::16) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|LV1PR11MB8818:EE_
X-MS-Office365-Filtering-Correlation-Id: 76e03b8f-ac0f-4c04-ea3a-08ddda36c610
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a3FwUjBubjRWOVJXdXc0elBtTTkxaDFweHFVRUxJRlJrWDB0eERjckcveUxP?=
 =?utf-8?B?amt5TGJWSTBEdUN4Sk8yQkpvbjZ4SXRrNzNyYS9CZis2alBZalFDazAvWG1w?=
 =?utf-8?B?dnR6dUVuOXdkbm9wRlRCVllpVzlNeDZkTkdlL3d1elZOOTB4UUhJMVB0eTBs?=
 =?utf-8?B?R0F1UksxYVlwNEl5bDk3ODJNRDY5enFucWlPVU51ZFd2ZnVpL1c3TXpLVmY5?=
 =?utf-8?B?YSt2SVZiRHlaT0FNMGRMYlFGdkMxcWMrS1hpdk5wUWQ1QVFVMEdGNWtHR1Jx?=
 =?utf-8?B?dWdGWUY5RTZucVVEU0d5a0dHUTBLd09oTjB6QncvWWVEdW52MGNMV3krbkRi?=
 =?utf-8?B?WVArUkxHeEt5NzNQSEhJZEZwVkxKUVlIQzBaSFQ5czVidXBYVVIzaVZhYlRP?=
 =?utf-8?B?NE5GdXNnRmdIRFB4b00zS2wySVI4MHZJUWZuNTZpZE5hQXY4VFkyaDkxQ0hR?=
 =?utf-8?B?cGdSdWxaTXRLcUVta0J1QkhWU0JBL0RzUWZyMVRPdm1PRVl1alZYVVFrSndE?=
 =?utf-8?B?b3VvZnl1Mld2THdKbnFNZ0ZvblBCUW1STDNZUTRyMk05MXNYQTNoRUwwa2c3?=
 =?utf-8?B?emhSanhqRnp3U0JBK280bmVLZkFRRFk0UFV6MUx2OCtGZklBellZYVIxbHpU?=
 =?utf-8?B?Q2VXdWkwQm0yYXVoQVhUbUU3aXRRN1pDOHRkT0FYTUo0L09lVUU4NkY5OXBY?=
 =?utf-8?B?VStLVkMyYmVKV1luRjdtVE9RcFhOTDFKbGRCU3MwRUdlQXhMaU1Ob0FXZWpt?=
 =?utf-8?B?K3RtcVVlSXFDckxtOTEyYlJ5ZnBvMytTV2JVZEJBOElTRWdicjN0MzVNYkhq?=
 =?utf-8?B?THhSTEtxQ3BTVEo0bEE4TWd3dlE1WmNQeUFtd2U0L0xpd3BLWC9MZ0RpM2Q3?=
 =?utf-8?B?ckNjZTRJa2xDK0lYMDFsOGVVT29GeWY3Qk9CcHVjUzJQdkhrVG44a1M0Vmpa?=
 =?utf-8?B?VkMrTnFIMGh2cjVPL3dZZStNMjA1bGJuelJvdVQ1cnY1Mzc5cUtPUmt4dW52?=
 =?utf-8?B?QVBWcm13WnFGVmNmV0ZlV2xLY1hxaEFHT1EyNGhLbzM1VlJQVXRpem1OR3h3?=
 =?utf-8?B?UDJxMzg1Z1lqRGxwVXdzQmdYaFgrWXpDNEY5ZW1nY0w0QTI3NHhGTkpHMVJ3?=
 =?utf-8?B?MjdKNnE1VVZ4QnZReG1PSFpISnluaEpyaUp6SjNRU1FKc3JBVEJ6bk5iSEFL?=
 =?utf-8?B?VzY2RnlOOWdMZDJ0ckJBMmFhTlhEeFp6eWVQaDQ2bTB6b1ByOXJzeWRtdU9W?=
 =?utf-8?B?VG5wS0dVTGFUdzlxbGQrSDZqQ2tsdVRadmtlcjdBQWMwam9sYjRCZEJXSXNK?=
 =?utf-8?B?am9vcjQ4WHR6c21PL2VqampXUFg3bWw2SjdMR2lKSm1iOERMbi8xRmp5NjM3?=
 =?utf-8?B?NEFSWnJEOThoazlmVEtKVDBoTm9FT2t1NXdad3VMRndnU3RUVGVuakozTDFY?=
 =?utf-8?B?b2xGRGRnOXNNZm1tUlhtdVNNV0JTWTJYaXlXRFBDU0tsa3g4MUY1L1Z0NFJF?=
 =?utf-8?B?eTN6d24weEJDc2FqWW1WOEgwbDVKUE0zRzUyVmpEbGZreXFJa3MwSElBMTNh?=
 =?utf-8?B?QU5sOUN5K3dZekdYbVNvRnZJMWx2dU9FbFcyeStGbGtWakxCMnFCejV0OUdK?=
 =?utf-8?B?dDBGSVhBd05RdXlOVHcrMjJFZVVJT1pUdDhWRXpoQlJkQmoxQTV0cm4rVEk0?=
 =?utf-8?B?V3Q3MG9wYmdqTXpKTUVkUmFDMjFRRURWTUN0eUF4czUrQ1NhNHJBUis3a0VU?=
 =?utf-8?B?YzVQYUpZMStnYkhOZ0ZZWVNrSWR4cEtmRGpHTTJydWp2ZnhBMmYrdVBtV2p2?=
 =?utf-8?B?T0txUGJGVUVvMDZQdis5MUM3OGcxM0p5TzRxVHl6RXRzeFFpQ1pYbXZXem5h?=
 =?utf-8?B?QmlaSnl4dzFvbWR2K3hMeURzd21uNTFQSVhsU1ZnRy8zWStzRmZRWE9mSk9O?=
 =?utf-8?Q?wsYqDEZMyYI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U2p4bzBEQ3ZhTWc2VElYekRhdjRpdE51eHNRTXNyVHRGRm45VmFjOFI0QzFq?=
 =?utf-8?B?UW9oQ1BZeUx3NzFyczJGZ3RuZlhqWDYyTFVCZzVuQ2lVeUtXeVR4SEJRYitR?=
 =?utf-8?B?TWMzTkdSeGZMa2NxZmdMOUtPZEUyWWlCUmJENEloMFdJanloVnkwNXk5c2k2?=
 =?utf-8?B?Y09rSjlkcjlBVHJoNVJQMVJBVzdqalhlVUJlVTdBL001K1dPWVUrUzdpaDdK?=
 =?utf-8?B?NGViUFpnVlVNcnVBM3lianM5T1kyOWlxTXBwd09kdnFwQi83R3VJTEZ0Z3Ju?=
 =?utf-8?B?bUREVm9ya0twTElaZHZqNWtyNE5IR0d5Ly8zT0VSTHpZdEV1cXhuTDNzOVJy?=
 =?utf-8?B?ajVGaEVYSmJTQW45MW4rT1FKMDdOSlFKcVIxUEQ5b1V3TFc5OUVkRnhRZEhj?=
 =?utf-8?B?RjJBN290S2NKUUFMWURaajcrN2RsV29XVnFuWm1VQmF3c1JuWWhkZUgvY3Qw?=
 =?utf-8?B?b04xSHh0UDZOUXF6aVRzMjdXc0hFWnJzdzl3Q3Y5U0U5aEh2dmc1TW9hRHFB?=
 =?utf-8?B?KzkwRnVITjM4Q1VyblFkZ09jU0N1QkhIT0VsYWM5dHZWQjNrWGswQUJXN01v?=
 =?utf-8?B?aGxmU1VyL0hTMUxlcURYNmFxT1hNQVNCNEpOZis5N3dnZUFBd1hHRmxCcEYz?=
 =?utf-8?B?SmJQVmhhUTE4Tm1OYis1ZmxzQk02aExJQy9WU1Q0WkdXRWJRSm9xQ3lUOHVn?=
 =?utf-8?B?TFFWWnZ5MWt6bTF4RlNIZkY0dEs0T2lvVnNXdnpacG5IaXpTQlR0UVpQV0p0?=
 =?utf-8?B?QmJwZHVBSWYzemprRmNMVVo4SkxFZUFuczh2ZXMzYko2WG45OWNMdTFDcWhj?=
 =?utf-8?B?aUpGdnFhQ3dHbk9XYlUzSTdkdXMwdlRrU1k5QUI0ZUx6OFJtemhZd2lVTitr?=
 =?utf-8?B?QjJ0TlI5VnNDVkc1TjMyOURoZHozSWM1R3J1blh4aHlqaGRwZlh3YURvUHU0?=
 =?utf-8?B?QVROVitGeTQ4VmVmbE53SHZHNW9TL3RPT0laOVBlVzJOdkdwcVdHclVkYjRD?=
 =?utf-8?B?SVN3YU5zZ2l0QkMvSm1oK1lYTUhiUEIyckhIb2U1TEZHTEx3NDAwSmRPQ3lW?=
 =?utf-8?B?eGRDWDNNb0dUSlFreTFIV0VMaStrdGNTLy94alJ3ZU4vb0tQL3BxSzh5UjU0?=
 =?utf-8?B?Qys3bXJaWjZFVndkRjhxcDNzOTVKZkNxSm8zZXlRNlFOdHRRcHl0OWg0M0sz?=
 =?utf-8?B?L1ZiT0VMLzcxOHU2VkRpMWxhaEJxaVpWZ2twbVlHSjJQdjRMTmVJUkM3bzI3?=
 =?utf-8?B?VW1xRXUxSjhnajd1WWRCUmRPY0x3T3ZiMFZWWFNIeW54ME1PQmpnWnZKSFJx?=
 =?utf-8?B?Z0d5QmFnTEczaVNZQWNHb2dUQi9zRGEyMzZudkRUZDBsbVhrbzIyM2lVN0Vj?=
 =?utf-8?B?RUIrUkNERUlXSzVzdXZoSlhrWGo3OUZManhPZ0UxUEk4M1FDb0Ntb21XV3FO?=
 =?utf-8?B?T01lZ0Uwd3czRG9FN1NOVnlpSHFGOXNLRkI0SXRJVDVzMWp1MSsxSkp4K25j?=
 =?utf-8?B?UHcwOTB3d2pRZWh2QWVoVzREc0Y5bzVuV0pJdGZPYXEzVlUxbkVKQnBjd0pY?=
 =?utf-8?B?YVRYOU9KVHhiQmdnMytSV2NVVitkZHZySjRxOGZoSk1Ob25HL0pLWUFTL1pj?=
 =?utf-8?B?ZjdHQm1Vd09PMWErQmlJNDgwL3hjNFY2NmIxV0dsMkg2WURPZ2Y2aTVJWFdG?=
 =?utf-8?B?a0RpdEYwU05nRkdJZFNDVnJabmlBTWtoSGt2RjZ6ZVdLUno1REJkWVhNNzBC?=
 =?utf-8?B?L2M1cExyWkkwTEwwRzYrSzBwclhqaHA1ZUpuUG45YWJqTkhMR0hwWUpNWHdO?=
 =?utf-8?B?NmUxRzc5MmZVa0o5Ky9XeTgwTzhEc0x1NXpwelM4WDkrNE94ZExMNEwxZnNu?=
 =?utf-8?B?TVZMQ0ZqcE9udVRKY3c1cFJ0T0VVYmJ1NjdCVEgyNDVVUkRvaWx2K0pmYVZo?=
 =?utf-8?B?eEJRbWNzdXZ2V3k2RlUvM3pvSHBIejZZMitBcUZQREFIb01vQiswc0xRdER6?=
 =?utf-8?B?Ry9RcTV0WDByTkg0dEUvbEJXdEl3bkVuSFdReVhuSGxCNE54SFltMTBoc0F5?=
 =?utf-8?B?WlpOT21sQkdDL3d5MFRNK2ZqZjlzODlpNDdlTVl1NTQweCtPbG5ha0g0dmw1?=
 =?utf-8?Q?nnejl7cHH0w6BhV/ZWTzbNWBi?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 76e03b8f-ac0f-4c04-ea3a-08ddda36c610
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2025 06:58:14.6287 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iUuNfKr5gHcvUv0Hnn1ejG49gO816Wsk7U9KCOIdo7Ia1/Q6WeWo/Vgizk9IQoghC9OXUvwEAOfsHkweF8u1qA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR11MB8818
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



On 8/8/2025 10:59 PM, Lucas De Marchi wrote:
> Now that additional WAs are in place and it's possible to allocate
> buffers through debugfs, add the configfs attribute to turn PSMI on.
> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_configfs.c | 66 +++++++++++++++++++++++++++++++++++++---
>   drivers/gpu/drm/xe/xe_configfs.h |  2 +-
>   2 files changed, 63 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
> index 17b1d6ae1ff6a..8cf6b1375b7d4 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.c
> +++ b/drivers/gpu/drm/xe/xe_configfs.c
> @@ -77,6 +77,16 @@
>    * available for migrations, but it's disabled. This is intended for debugging
>    * purposes only.
>    *
> + * PSMI
> + * ----
> + *
> + * Enable extra debugging capabilities to trace engine execution. Only useful
> + * during early platform enabling and requiring additional hardware connected.

%s/requiring/requires

> + * Once it's enabled, additionals WAs are added and runtime configuration is
> + * done via debugfs. Example to enable it::
> + *
> + *	# echo 1 > /sys/kernel/config/xe/0000:03:00.0/enable_psmi
> + *
>    * Remove devices
>    * ==============
>    *
> @@ -89,8 +99,9 @@ struct xe_config_group_device {
>   	struct config_group group;
>   
>   	struct xe_config_device {
> -		bool survivability_mode;
>   		u64 engines_allowed;
> +		bool survivability_mode;
> +		bool enable_psmi;
>   	} config;
>   
>   	/* protects attributes */
> @@ -98,8 +109,9 @@ struct xe_config_group_device {
>   };
>   
>   static const struct xe_config_device device_defaults = {
> -	.survivability_mode = false,
>   	.engines_allowed = U64_MAX,
> +	.survivability_mode = false,
> +	.enable_psmi = false,
>   };
>   
>   static void set_device_defaults(struct xe_config_device *config)
> @@ -243,12 +255,38 @@ static ssize_t engines_allowed_store(struct config_item *item, const char *page,
>   	return len;
>   }
>   
> -CONFIGFS_ATTR(, survivability_mode);
> +static ssize_t enable_psmi_show(struct config_item *item, char *page)
> +{
> +	struct xe_config_group_device *dev = to_xe_config_group_device(item);

To have consistency with other functions, we can use

struct xe_config_device *dev = to_xe_config_device(item);

> +
> +	return sprintf(page, "%d\n", dev->config.enable_psmi);
> +}
> +
> +static ssize_t enable_psmi_store(struct config_item *item, const char *page, size_t len)
> +{
> +	struct xe_config_group_device *dev = to_xe_config_group_device(item);
> +	bool val;
> +	int ret;
> +
> +	ret = kstrtobool(page, &val);
> +	if (ret)
> +		return ret;
> +
> +	mutex_lock(&dev->lock);
> +	dev->config.enable_psmi = val;
> +	mutex_unlock(&dev->lock);
> +
> +	return len;
> +}
> +
>   CONFIGFS_ATTR(, engines_allowed);
> +CONFIGFS_ATTR(, survivability_mode);
> +CONFIGFS_ATTR(, enable_psmi);

alphabetical?

Thanks
Riana

>   
>   static struct configfs_attribute *xe_config_device_attrs[] = {
> -	&attr_survivability_mode,
>   	&attr_engines_allowed,
> +	&attr_survivability_mode,
> +	&attr_enable_psmi,
>   	NULL,
>   };
>   
> @@ -443,6 +481,26 @@ u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev)
>   	return engines_allowed;
>   }
>   
> +/**
> + * xe_configfs_get_psmi_enabled - get configfs enable_psmi setting
> + * @pdev: pci device
> + *
> + * Return: enable_psmi setting in configfs
> + */
> +bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev)
> +{
> +	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
> +	bool ret;
> +
> +	if (!dev)
> +		return false;
> +
> +	ret = dev->config.enable_psmi;
> +	config_item_put(&dev->group.cg_item);
> +
> +	return ret;
> +}
> +
>   int __init xe_configfs_init(void)
>   {
>   	int ret;
> diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
> index c14588b86e833..603dd7796c8b2 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.h
> +++ b/drivers/gpu/drm/xe/xe_configfs.h
> @@ -16,7 +16,7 @@ void xe_configfs_exit(void);
>   bool xe_configfs_get_survivability_mode(struct pci_dev *pdev);
>   void xe_configfs_clear_survivability_mode(struct pci_dev *pdev);
>   u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);
> -static inline bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev) { return false; }
> +bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev);
>   #else
>   static inline int xe_configfs_init(void) { return 0; }
>   static inline void xe_configfs_exit(void) { }
> 

