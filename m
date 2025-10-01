Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E29B8CCA470
	for <intel-xe@archiver.kernel.org>; Wed,  1 Oct 2025 10:07:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A13C110E309;
	Wed,  1 Oct 2025 10:07:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SG1CJ7co";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DE2310E0BE
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Oct 2025 10:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759313237; x=1790849237;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=EnM7DgTf1fcAU2RYO/j5G6cEMg6iaSkuyQBVyHihKc0=;
 b=SG1CJ7coFF5QeBV3tUlpfPbRoAt5syuOyzi3xWQpkxvUPhJvsnEqAnej
 2jOIEyR3LhJPg96mNoWXYoio+D4hNC2O7/gMr/eXiTc0z5KDtD8LH1VXi
 eFsdYuae44s7gpvqLslQfIo99f5QRdfM6hMqrZcE9VMlarm/hLvgylv77
 Zf3doVCms0aMDJEUAebuopOR0k4do6J+1dnVJepHIFsoZAkH1VbIYVnE5
 QS1xzpkLUMiYp6o1AqOG4XMK73ziGeipoTPcamFuGmsHGhzAvLVwSrviy
 Dug0rT6WvhW99r51DwetZA0bkG6mS9YNGdU12KRtzNJ/HC9Dcl6n6TbJW Q==;
X-CSE-ConnectionGUID: zXGhh8J5ReK+RLNSUfO8NA==
X-CSE-MsgGUID: h0w3KrYrSgmAU0YL8C9viA==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="60619936"
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; d="scan'208";a="60619936"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 03:07:17 -0700
X-CSE-ConnectionGUID: aX6luI3GSbqMKRZiTqbb2g==
X-CSE-MsgGUID: 8VTkh3z7ShuMg5Gvuo5Hkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; d="scan'208";a="182776217"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 03:07:17 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 1 Oct 2025 03:07:16 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 1 Oct 2025 03:07:16 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.67) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 1 Oct 2025 03:07:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S/SyB65aO7ngM7ZzufoqE5PakDx8/WFvjHMNsHJW6Enx/ryv37IHwn9hPiFadL2fkJ1RoPVencxlLiUj2az74YgqVRF/gbnx6tuirS+Zgo4ldAL4k7Lj8Vf4fpLEO7ugbdd6k3fVB8C4sR65H8NKBZhElM/8R6Cm0etly+DjExUC6WTRahw81DAGufGpyHv3JHDV8CIQ/YcYflGoraTlRwPnuOksYT1p/8Y4pWDrzdGccsecyxMUhGqOccODRqz+yvnVKtY2bTCBcKWIk7mz8/aYaP4LydqAcaefpTpmhRN+O/VypKwa7/Fs+4cmPWQDsm/f21EWd01ga0XrE5k/fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=log+pI9y3JKPocz4P3ERKTzP1qNUB2rGoF3RydQLtmM=;
 b=QbGyT0QA8fA3zCa7NVtPk4Q2a0xArDqz9dpZbqpDkXiWc399Lk794g20EsgEf72XA1E3N1x/Wgxa9YYjuuFi/3WLopYDQSJPATKpH+zCss5hU2BkoGxGXnNh6l4Qfewe/qenE7ieislhXQBnROlepEK4NtQAawdZMuhikXJKo2AN3qAuwd0Os40rmiCHQ2QNYnecg77eE6uod6B1zA458hq5ZCv7v6TygC7wCSQIgny5T1k5N3fvGXkEDbaC1OubX4elJxBW5vrNwCuyGMn+PE+p8UgJxQYRd0TvwvuS75FQRcCyK53k8xBTXCdSFPPlS46C9fxkWMQKX/NrzqoTHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SN7PR11MB6828.namprd11.prod.outlook.com (2603:10b6:806:2a3::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Wed, 1 Oct
 2025 10:07:08 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9160.017; Wed, 1 Oct 2025
 10:07:07 +0000
Message-ID: <0ce62511-3c46-4d1a-aef9-8c5f5a4f4d0a@intel.com>
Date: Wed, 1 Oct 2025 12:07:04 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/23] drm/xe: Read VF GMD_ID with a
 specifically-allocated dummy GT
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20250930225618.140071-25-matthew.d.roper@intel.com>
 <20250930225618.140071-32-matthew.d.roper@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250930225618.140071-32-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0016.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::12) To LV2PR11MB6024.namprd11.prod.outlook.com
 (2603:10b6:408:17a::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SN7PR11MB6828:EE_
X-MS-Office365-Filtering-Correlation-Id: d8cb2cc6-0a3f-4f68-4f12-08de00d24761
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UStwa1EwZk1TMFV0WTVRRVZIT0xuaXU2amp6a2JWb1BWclFNM3RiQStYNlhE?=
 =?utf-8?B?VHZncTRjREk3SFBQTnBHbHdwcnJFNFhnVU1ZNWFIQzQ1TUtjamdZaHowOW4z?=
 =?utf-8?B?Tzh0M0ZjTHlFTkc3MEU1ZTYrVWsyZG1DUldSano2WHRYNHBXZmRCQzZ3MS9Q?=
 =?utf-8?B?MTQ4OWh5ZUNkNUZldm9SSE9EN0NCZnFMcmo3Ym53cEJhd09QRlEzTEl5aUhV?=
 =?utf-8?B?QjRSNTdrK21qOWRTdk5zaElQUkR3N25FUFZMVW9vSDIxSE5OeGRxaEhQaWZm?=
 =?utf-8?B?SGJTZ0E5MXpQNkF2QVU1ODdCaCtsdTd2WmJlVUpwUEUxT1Q4aEFFZk1iSzJt?=
 =?utf-8?B?bm5BNFpIcTdRNklGbENhR3dISzdiTXZsdmFad2d3UWtjSlIyUlpNb3pDQU1W?=
 =?utf-8?B?MFFCd3hTSlVnSFcvanFHa1FmbFB1THBIa0tIaE9LOW1pZ1B2SDd2SDlZYW9o?=
 =?utf-8?B?VmJKMmtDSEloMDJ4Q2UrcExaaTNUQTd4QU4vVTBLRnhWcm4xZzVrSmRMSlhZ?=
 =?utf-8?B?Wll6YnpRZWdVbk5nNmxrcUJoU3BDUFRRTWRMVUVyV3g4emRjYXFHUEtWSHgw?=
 =?utf-8?B?NjBJY005QlRnUjd2OENiZDBXaGwwbUJlQXlsQzlTbmZLRC9rU3JvaEg5Wjdi?=
 =?utf-8?B?WVhhNXNhMDJjdDNaS2xYYzVPMnlDRGJDVFhEdDkvZHk2MldpNUVFZE5TZWl2?=
 =?utf-8?B?anUzT2lWeWQyOGF5NjVxVUxXemd1NTVyd285NXJ4cXRIam1hOEZhSFZEVEU2?=
 =?utf-8?B?YTRCWDBTWFkzWVN3OGdpV3NzZFEzNFBTcUY0R1JNYVMvWjRlUVV1U1E5eUFz?=
 =?utf-8?B?MEduYmJQN3RwSEsvS25FUkRTZnJ1UUlRYkpXQzZUT2VOU2FjQm9yQkR4eURI?=
 =?utf-8?B?WUMvVzVRQXJQUXdmMENQRytkaXY0ZW42SlhMZ0VhT0tKa1ovZzlNMFM1WWNi?=
 =?utf-8?B?U3kyaUFLdGZzS1MwK0dkQ2g4ZmpNanFseVNOK2IzQi9PR0RmVGtKTWh1U3ZD?=
 =?utf-8?B?ZVhOcVJlOGIrdHZHbnVBY2RaRFNRVVgrRCtTQi9rRENBU0JsOXNjekM1QTFP?=
 =?utf-8?B?WTA0cXBHZ0Fjc0dOK0c0cVBoODNBQk0vMTMzRFFUMVl3czFVT2VKSHl1cm5B?=
 =?utf-8?B?elU5Ylcya0R2NjZoVTJpWG9objFZMWlZSjZZa2FldHRYOHBncGlVTS9mOUh4?=
 =?utf-8?B?UjM5ajJTTUlhNWU1OHp1OXZ1OEtOMGRuM1ZuYW56bzZLTUc1WnhYSTY4RjFI?=
 =?utf-8?B?Tk15YkVvQWZ3SVo5SnI2TEFhOGE1VGFGcHdkNnNITUlYZisxbTc4SWVvMTZQ?=
 =?utf-8?B?U09LcFNYNnE2V1ovRUJoRFUrRk4zejQxaGxVS0pmOUlMMmMzNUREUlB1S0ZI?=
 =?utf-8?B?VkJPeFpERmppWmZoUDZZT0xWay9aN2FDRGNlZDJlSXE5ZWdrTkRTQTdWaXMv?=
 =?utf-8?B?VWhhSitna2ExLytWNDZUQ2cxSnhsSmlFZXNwM3F1bFVGbFJMcUgvaGN6cXcr?=
 =?utf-8?B?NFRlWHBqRXlPWnJOLy9tVk5sYWoydll4NEFCTEN4YUpmL241a3laQTB2Yi9v?=
 =?utf-8?B?Nk5iVVFMVXE2V3NJZi9CRzJodzdPSUprcFRsa2J4STVRK0YzL00wbU1TdDJt?=
 =?utf-8?B?UjkvV2MxbzBVR1I2Qk4yTUVEZ0tUOEJsTG9hSEdQejRRdkI0ZFowam1qNHRV?=
 =?utf-8?B?ZnAvMUs5WGs3ejI4ZldaVlpncmFFbWpKR0lnYzZVUXFDMlUySmJzaVlITFFl?=
 =?utf-8?B?N1ltK0Y0NU1aK3pBRWFLejVLd0puOVA5K0dXaFV1dmhQb2FteDVKVURlRGcz?=
 =?utf-8?B?ZGUvcUF0bGg3UzFPOTJrOENqbmNnRUhXUUc3LzBhRGVLOE80UkkwTHlkMjUx?=
 =?utf-8?B?aENYZUgzZlJ2Ty90RWF3OE10a3VFTkZuaEZ2WUM5NXROS2MwQ1hYZTFwdlN4?=
 =?utf-8?Q?xDsxf/WA5jeXw0KtQSz4IrYs5ZDzntm8?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a1lVaFhsNTJsY0paQjUwVnFnRk1CdWNXMzdTek9xNWtQQlNQUGI3bWFRREhq?=
 =?utf-8?B?SDB1STE2M1BsbzhwRU5HU1NkMzlvWWtubWg5R0JzQ0tXMlNrQnRyM0tXLzJW?=
 =?utf-8?B?U2l1aW1FN2hsRkhoVmVqdHFxRWtTTStiRmJuMGVDRU9aZjNBcHR5eVF6YzZE?=
 =?utf-8?B?dGVnYlhTOHVvVzEvMUExZUxNN3RZbnF2NVFObDNZcVcrVlFURnowa1h1dEF2?=
 =?utf-8?B?aGtBN1dheE5uOTJGeWJzdDBvZjh1VGZXd1pCUExEeFNrNHhCOWJsckxGK2tx?=
 =?utf-8?B?ZGRjTHBCeGNwRzdyak5TYjMyZ2R4QjhaZUhhb3BUUnpacGNNZjhmWkt5b044?=
 =?utf-8?B?Q3U3RlZvMFU0MGFVeHV0NVFzb1RlVnVxQ2NqU3ZjcW43S3E2cFZTT3hQY05w?=
 =?utf-8?B?a01oYlFaSFdrYmNMZ0hSa1JGZE5VTmh5ZE85WmdGL2FFWmZ1SHBxR0pKOC9i?=
 =?utf-8?B?d0tBL3BqNVhsa2xWcHF0bGZtZTZDVVRMV3RYN3Z4UUd6SUdKeEsvYzk3emFG?=
 =?utf-8?B?bE9VSENTQUhYQWcwOXVQckhtRzNqbDFHaU9manpodm1UN0cyeStSQUxZamRQ?=
 =?utf-8?B?b0NCMGMwaURSYlQ3d0tpcUFvRGgwZEhkVHN0ajk5L1hPcy8vdE1TUjFiZlZF?=
 =?utf-8?B?eWowM3kvbVErUmlublBkY3NqRDZaY0ZIQ3pWc1RVMEtDelM2MzNZTEZNcStq?=
 =?utf-8?B?K2dqZVFGd0J5UzNjSHVVZFRsQmExM1lDVFlRcHE0QkkvaWNYb0VhNXQ0N0Nj?=
 =?utf-8?B?dFFXWlJkVXZiRG9QK3JHRUsraVpVM3N1UnhQbWJ4R2VGUmN4OTg1aThQVFU4?=
 =?utf-8?B?eks4T1YxSTZNUG9vcllyMWd6MkRGU1FhUERaVmNDdFdCL3dyRkZPMFVHcWZa?=
 =?utf-8?B?czZUL2pENUNXYXoxaXFRYUFNU3lhRUJXUUxvbkgwdHI1NDJqck1hVVdaYUl4?=
 =?utf-8?B?cmh4akdUdDZDVUpvT3VKbkphYjFMU0N0VllsRFQ2Um9YeXQweWRVdVl2R0N1?=
 =?utf-8?B?NkI3WWJjRkZGV2RNeWlGOUU0UHlGSDhkaHdSd05XUWVqWG04d1pUOEtwcE8z?=
 =?utf-8?B?bWo2cUJSc0p2dmVYRWZqeGVkaEdSeDArMTU5VmhadzJFdjlpazFpNUxjUU9U?=
 =?utf-8?B?LzF1MGUwRTduaEw0TG1zZllxRDdZcFptRVpTdTFLdzZQamJPcTVTYTZBRW1C?=
 =?utf-8?B?eHA1TitSNHlEOUZwaFZyODd2NE1SYkozV3oyOEhmMHVWbWd4S01ScklxeE5B?=
 =?utf-8?B?N0hVYlNoSk9wS01OMFZyb0JiM3l2ODRhalp6K01TU1ZvbkN5eXJzWUVmTS92?=
 =?utf-8?B?b2thV2h3OUNFeHZ5VzlDU0lxOWpUS0pOVWt4c1AzM1k5NlAzNFdFdndhNEpt?=
 =?utf-8?B?Z2RIUGJ4WjFaZG9nbWZXcnpZOWV6ajZRdDUybHF4dytPOHQzQXE4Z3dlM24x?=
 =?utf-8?B?K243QnhCUjdOY09ucUZPSFR4V0VPcGJ4SFhWTU5VVDZpUE5yTFRJdjkrMUUr?=
 =?utf-8?B?TEovbXNiOC8rVkRQakhCQjIySHI1bnl3UlJyamVtazFDNHY0c2JXMGxlN0hK?=
 =?utf-8?B?WjdRaXFmY1FXY3Q0cW0rdnI5TWlIQ2NqNzgwdFpFdW5CTkU4a3ZZMzZEdXVk?=
 =?utf-8?B?MjBmN251SHpIN3FoSUJHS3lhZG1YN3ZheWJTaHB1bGQ5TzlYd0tOeFRwUnl2?=
 =?utf-8?B?TEZNaWRHUnR6YmFKd1BRcEVtSU5oV29idHh4Ym4rRFNtUVoxbUNxTVM1OTNp?=
 =?utf-8?B?Y3hJTGsreDhvRitubHA1V1FJcFlKTEVHRHNQS2RKZTZqY0N0bkhiMUkyamQw?=
 =?utf-8?B?QWlsZ3FBenhXTjdickVhRXBlK3NaeW5uUjhSSTRtNE5oOVlIV29Gd0UxT3R5?=
 =?utf-8?B?ZUg2anRrdlFsQW9NNXExSVVoeWgxQmlmYXYzN202UE04UDdjOEkwSzhyWlpR?=
 =?utf-8?B?RWFMSkdRTnAzOHFxNXhZUUJtYUY2WHN0WHZVQTFoblZpcUV5MjhzQ3dCaWsx?=
 =?utf-8?B?QUtEUThtZk5tVVZISVorUkJvdjIzZ1UxVWFrVitqUGVTMlVNN05BNUMwUHZt?=
 =?utf-8?B?SC8yTHBKZThQSjBMMzRJZTJDdVFjZkpsOXduS3lnOFZtS3NYeEd0V0RLSkNi?=
 =?utf-8?B?UEFDRCs5bDRucmFVYW9IdTVRclFqSjZnUUFnSk83VXVVY2JmMlZYbGlncDJM?=
 =?utf-8?B?NXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d8cb2cc6-0a3f-4f68-4f12-08de00d24761
X-MS-Exchange-CrossTenant-AuthSource: LV2PR11MB6024.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 10:07:07.7211 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8E5xicDdL1RAMZC96cfstPhTrImV5pdEI/kJZ4qtdIlz3CafiVUnbfvQN3DedqptkIUvPLgndEMBh1CaKQNH7PpnrlsChaHHTpmjNK/U/1M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6828
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



On 10/1/2025 12:56 AM, Matt Roper wrote:
> SRIOV VF initialization has a bit of a chicken and egg design problem.
> Determining the IP version of the graphics and media IPs can't be done
> via direct register reads as it is on PF or native and instead requires
> querying the GuC.  However initialization of the GT, including its GuC,
> needs to wait until after we know the IP versions so that the proper
> initialization steps for the platform/IP are followed.
> 
> Currently the (somewhat hacky) solution is to manually fill out just
> enough fields in tile 0's primary GT structure to make it look as if the
> GT has been initialized so that the GuC can be partially initialized and
> queried to obtain the GMD_ID values.  When the GT gets properly
> initialized during the regular flows, the hacked-up values will get
> overwritten as part of the general initialization flows.
> 
> Rather than using tile 0's primary GT structure to hold the hacked up
> values for querying every GT on every tile, instead allocate a dedicated
> dummy structure.  This will allow us to move the tile->primary_gt's
> allocation to a more consistent place later in the initialization flow
> in future patches (i.e., we shouldn't even allocate this GT structure if
> the GT is disabled/unavailable).  It also helps ensure there can't be
> any accidental leakage of initialization or state between the dummy
> initialization for GMD_ID and the real driver initialization of the GT.
> 
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/tests/xe_pci.c |  6 ++-
>  drivers/gpu/drm/xe/xe_pci.c       | 61 +++++++++++++++++--------------
>  2 files changed, 38 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
> index 0f136bc85b76..969f1dacade8 100644
> --- a/drivers/gpu/drm/xe/tests/xe_pci.c
> +++ b/drivers/gpu/drm/xe/tests/xe_pci.c
> @@ -307,8 +307,8 @@ const void *xe_pci_id_gen_param(const void *prev, char *desc)
>  }
>  EXPORT_SYMBOL_IF_KUNIT(xe_pci_id_gen_param);
>  
> -static void fake_read_gmdid(struct xe_device *xe, enum xe_gmdid_type type,
> -			    u32 *ver, u32 *revid)
> +static int fake_read_gmdid(struct xe_device *xe, enum xe_gmdid_type type,
> +			   u32 *ver, u32 *revid)
>  {
>  	struct kunit *test = kunit_get_current_test();
>  	struct xe_pci_fake_data *data = test->priv;
> @@ -320,6 +320,8 @@ static void fake_read_gmdid(struct xe_device *xe, enum xe_gmdid_type type,
>  		*ver = data->graphics_verx100;
>  		*revid = xe_step_to_gmdid(data->step.graphics);
>  	}
> +
> +	return 0;
>  }
>  
>  static void fake_xe_info_probe_tile_count(struct xe_device *xe)
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 37ae49f4b648..9fb5df10844d 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -464,7 +464,7 @@ enum xe_gmdid_type {
>  	GMDID_MEDIA
>  };
>  
> -static void read_gmdid(struct xe_device *xe, enum xe_gmdid_type type, u32 *ver, u32 *revid)
> +static int read_gmdid(struct xe_device *xe, enum xe_gmdid_type type, u32 *ver, u32 *revid)
>  {
>  	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
>  	struct xe_reg gmdid_reg = GMD_ID;
> @@ -473,21 +473,19 @@ static void read_gmdid(struct xe_device *xe, enum xe_gmdid_type type, u32 *ver,
>  	KUNIT_STATIC_STUB_REDIRECT(read_gmdid, xe, type, ver, revid);
>  
>  	if (IS_SRIOV_VF(xe)) {
> -		struct xe_gt *gt = xe_root_mmio_gt(xe);
> -
>  		/*
>  		 * To get the value of the GMDID register, VFs must obtain it
>  		 * from the GuC using MMIO communication.
>  		 *
> -		 * Note that at this point the xe_gt is not fully uninitialized
> -		 * and only basic access to MMIO registers is possible. To use
> -		 * our existing GuC communication functions we must perform at
> -		 * least basic xe_gt and xe_guc initialization.
> -		 *
> -		 * Since to obtain the value of GMDID_MEDIA we need to use the
> -		 * media GuC, temporarily tweak the gt type.
> +		 * Note that at this point the GTs are not initialized and only
> +		 * tile-level access to MMIO registers is possible. To use our
> +		 * existing GuC communication functions we must create a dummy
> +		 * GT structure and perform at least basic xe_gt and xe_guc
> +		 * initialization.
>  		 */
> -		xe_gt_assert(gt, gt->info.type == XE_GT_TYPE_UNINITIALIZED);
> +		struct xe_gt *gt = kzalloc(sizeof(*gt), GFP_KERNEL);

nit: we can use __free(kfree) here ...

> +		if (!gt)
> +			return -ENOMEM;
>  
>  		if (type == GMDID_MEDIA) {
>  			gt->info.id = 1;

it looks that it is still crashing in xe_gt_mmio_init() called from below

<1> [146.543510] BUG: kernel NULL pointer dereference, address: 0000000000000028
<1> [146.543528] #PF: supervisor read access in kernel mode
<1> [146.543538] #PF: error_code(0x0000) - not-present page
<4> [146.543611] RIP: 0010:xe_gt_mmio_init+0x27/0x1b0 [xe]
<4> [146.544175] Call Trace:
<4> [146.544182]  <TASK>
<4> [146.544196]  read_gmdid+0x12b/0x2a0 [xe]
<4> [146.544601]  xe_info_init+0x50e/0xc90 [xe]
<4> [146.544948]  ? drmm_kmalloc+0x87/0x100
<4> [146.544968]  ? xe_device_probe_early+0xdf/0x230 [xe]
<4> [146.545253]  ? pci_write_config_word+0x27/0x50
<4> [146.545274]  xe_pci_probe+0x163/0x600 [xe]

likely due to NULL gt->tile

> @@ -503,12 +501,7 @@ static void read_gmdid(struct xe_device *xe, enum xe_gmdid_type type, u32 *ver,
>  		/* Don't bother with GMDID if failed to negotiate the GuC ABI */
>  		val = xe_gt_sriov_vf_bootstrap(gt) ? 0 : xe_gt_sriov_vf_gmdid(gt);

... so in case of bootstrap error we can easily return actual error,
instead of returning plain 0.00 version

>  
> -		/*
> -		 * Only undo xe_gt.info here, the remaining changes made above
> -		 * will be overwritten as part of the regular initialization.
> -		 */
> -		gt->info.id = 0;
> -		gt->info.type = XE_GT_TYPE_UNINITIALIZED;
> +		kfree(gt);
>  	} else {
>  		/*
>  		 * GMD_ID is a GT register, but at this point in the driver
> @@ -526,6 +519,8 @@ static void read_gmdid(struct xe_device *xe, enum xe_gmdid_type type, u32 *ver,
>  
>  	*ver = REG_FIELD_GET(GMD_ID_ARCH_MASK, val) * 100 + REG_FIELD_GET(GMD_ID_RELEASE_MASK, val);
>  	*revid = REG_FIELD_GET(GMD_ID_REVID, val);
> +
> +	return 0;
>  }
>  
>  static const struct xe_ip *find_graphics_ip(unsigned int verx100)
> @@ -552,18 +547,21 @@ static const struct xe_ip *find_media_ip(unsigned int verx100)
>   * Read IP version from hardware and select graphics/media IP descriptors
>   * based on the result.
>   */
> -static void handle_gmdid(struct xe_device *xe,
> -			 const struct xe_ip **graphics_ip,
> -			 const struct xe_ip **media_ip,
> -			 u32 *graphics_revid,
> -			 u32 *media_revid)
> +static int handle_gmdid(struct xe_device *xe,
> +			const struct xe_ip **graphics_ip,
> +			const struct xe_ip **media_ip,
> +			u32 *graphics_revid,
> +			u32 *media_revid)
>  {
>  	u32 ver;
> +	int ret;
>  
>  	*graphics_ip = NULL;
>  	*media_ip = NULL;
>  
> -	read_gmdid(xe, GMDID_GRAPHICS, &ver, graphics_revid);
> +	ret = read_gmdid(xe, GMDID_GRAPHICS, &ver, graphics_revid);
> +	if (ret)
> +		return ret;
>  
>  	*graphics_ip = find_graphics_ip(ver);
>  	if (!*graphics_ip) {
> @@ -571,16 +569,21 @@ static void handle_gmdid(struct xe_device *xe,
>  			ver / 100, ver % 100);
>  	}
>  
> -	read_gmdid(xe, GMDID_MEDIA, &ver, media_revid);
> +	ret = read_gmdid(xe, GMDID_MEDIA, &ver, media_revid);
> +	if (ret)
> +		return ret;
> +
>  	/* Media may legitimately be fused off / not present */
>  	if (ver == 0)
> -		return;
> +		return 0;
>  
>  	*media_ip = find_media_ip(ver);
>  	if (!*media_ip) {
>  		drm_err(&xe->drm, "Hardware reports unknown media version %u.%02u\n",
>  			ver / 100, ver % 100);
>  	}
> +
> +	return 0;
>  }
>  
>  /*
> @@ -690,6 +693,7 @@ static int xe_info_init(struct xe_device *xe,
>  	const struct xe_media_desc *media_desc;
>  	struct xe_tile *tile;
>  	struct xe_gt *gt;
> +	int ret;
>  	u8 id;
>  
>  	/*
> @@ -705,8 +709,11 @@ static int xe_info_init(struct xe_device *xe,
>  		xe->info.step = xe_step_pre_gmdid_get(xe);
>  	} else {
>  		xe_assert(xe, !desc->pre_gmdid_media_ip);
> -		handle_gmdid(xe, &graphics_ip, &media_ip,
> -			     &graphics_gmdid_revid, &media_gmdid_revid);
> +		ret = handle_gmdid(xe, &graphics_ip, &media_ip,
> +				   &graphics_gmdid_revid, &media_gmdid_revid);
> +		if (ret)
> +			return ret;
> +
>  		xe->info.step = xe_step_gmdid_get(xe,
>  						  graphics_gmdid_revid,
>  						  media_gmdid_revid);

