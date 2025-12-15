Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FCD6D5B862
	for <intel-xe@archiver.kernel.org>; Mon, 15 Dec 2025 18:28:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F277110E059;
	Mon, 15 Dec 2025 18:28:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MEi41M+K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5075710E059
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Dec 2025 18:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765823289; x=1797359289;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=oV6PRCeUlfgcXh4ztCjkvJ0jkOtEtIZxkxaICreWl6g=;
 b=MEi41M+KkuI3kRb6DhQX9xL6KIvZEt8CwQkFNObaU0dFQ0ehEkWCQKb7
 KoI5m04yINkdFCj2FeINLRI9RVqCeJuNAScAqMLtoQFAypWyf1setFfcN
 LkQE8VuMSYXsUL1Yyrej+BUX5/Rc3t90twVUEgK9pb2jxPuM3mCdhQMvi
 bCZ983CUffncorlKk1OaZMTf8BS95MEswzf3Tilxuil9/I1ETuW2NJl5s
 Lfdlc/0zlNM/L1KjaQF3gIkZNrh2bTrY2box5IMBT2l08TzSfrVoNC60m
 oS0n/aaPHsd5kWVUVxQB4eGnwj0oAfXvy3EKMLzVEG34+x+zogxMH2kLk w==;
X-CSE-ConnectionGUID: 8gn3WdUsRxWc6nrTU/lgRw==
X-CSE-MsgGUID: LKzmy+tFTpyyF72Uw3Kppw==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="67696616"
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; d="scan'208";a="67696616"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 10:28:09 -0800
X-CSE-ConnectionGUID: BUTztBZ9RyerfxmRldyT1Q==
X-CSE-MsgGUID: nTt+vp2DTOOQNTj2/m6btw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; d="scan'208";a="197547114"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 10:28:08 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 15 Dec 2025 10:28:07 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 15 Dec 2025 10:28:07 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.44) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 15 Dec 2025 10:28:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cp+Br0KDMElmbR0E5qkxFryTvm797UzWCyRPSX6C9U8BZ75cbisFb+TT0KdmPVDwiXUc7g8CmGAvHFItpDdnCNmy1iU/GXcMwRDg+HLgx/y/5/4ALKjh40alegTfmEhyFm003QQc+wxpkZiKOIH5KHQQrstpU2STNI5SW6UrE7j0INEmlU8mDD3wjORz0mo4nVONDBvgf8yAoigKF/SAqpzHWUdqqSuD2jS8DzokCu2+JQQq7FaL18bxNn8+TW6UopIYylHDeu1lykyzpKyNrmWk1dYOiaKgyZRV6FUgP+YiIcbtmUQTafZgRJcq08jZ0q2oN57gTQZaUKwxCUAvoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M/Qc3VU0XM4mzatr8MPGfaV55TJkMo4zOQ2u7EzP+R4=;
 b=bTLWadf7YO3ARbNxY5+Turc6wPt6pK+1+LqHdOvkxDL22of5aavUB2FHBDrTld/6ZVX/wyT/inH9ulf/8/S4O2aDbNNCKNxtdkyMw7yPMdLWhbsyJQ1G6vPfKdjW56CAVyUC0caxjx3tOTpOIkVGzuzREO5XpIvk/o8x6Xvw3ypOgVAFqn5/lVfzFhBRTG1ntsPibCR0ANu7fDj+97R1PHxWfiFsscRWkxN4pPls7kOn+v5zIIMwVMaMPsIWkZK29OGsiXR+WOv9bVn9dnriisetYIaP5zFUHd88QgutPYeOTtchotOeGRDp/eHnLGCQ9owa1AGrP+WOVRhhvXVNnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by PH7PR11MB7479.namprd11.prod.outlook.com (2603:10b6:510:27f::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 18:28:04 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%5]) with mapi id 15.20.9412.005; Mon, 15 Dec 2025
 18:28:04 +0000
Message-ID: <597fa916-0e3f-482c-a237-8211be2aec12@intel.com>
Date: Mon, 15 Dec 2025 10:28:03 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] drm/xe/pf: Prepare for new threshold KLVs
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20251215143739.196336-1-michal.wajdeczko@intel.com>
 <20251215143739.196336-4-michal.wajdeczko@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20251215143739.196336-4-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0045.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::20) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|PH7PR11MB7479:EE_
X-MS-Office365-Filtering-Correlation-Id: 77481def-0e62-457a-9246-08de3c07afb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d1R5a212NmptZjVzVXRZTm4rUmlVdmc0OGFBdXFaQWNrdXk2Q1lnT3B5dXh4?=
 =?utf-8?B?dHhqWWNGbGZNUk5MSTdLaHBWV252QzdGUVc0SW5RRTZpV3VtelU2NnFneFVS?=
 =?utf-8?B?dUxaRHhmZEhJMFFSdGloUlIrNVBtVUoxM1VjOEFXMjg2Uk9tRTYrRjNyeWJN?=
 =?utf-8?B?RVF6bWVEMnl5UlZmd08zaDdaNU5qYmE4RzBCNHdkUFZCTVBIdHdCaWFzRTJC?=
 =?utf-8?B?RU9DNnN4U0JreTZtUjQzSCtmTHRFYzdhSW5tRUF2MDI2N0RwaG8welc0Zjdh?=
 =?utf-8?B?ZEV4TFNOUWp4OTdKREs4b0RQVUQ5S2tCYjVPSXppM1RLaFpjWG5kY2x4SzRS?=
 =?utf-8?B?WnBvRnhtQllxbE9ETmNwTHFncGRvbmdCeGFLbnJvNmdydGJGcFNEVXhUQ05S?=
 =?utf-8?B?RkdIeUNoUGNQUzFCa2tpSGVZbDI0TDV0bHZJSlJBV2p0cGlIYlpZUDEzRmkz?=
 =?utf-8?B?UFIyT0ZNZzFHems2d1hyQ3E1aW9Da0wrZmx0WnBaRlczL3hMQWlVUGRPWktY?=
 =?utf-8?B?d3JrRm0xeEhHWUxkRlVaN2hEaWFNQWtoMlZmMGhVK3g5eDczaUlqdlJiWlBG?=
 =?utf-8?B?TzBBVzQ0MHFwYkd4WkRxWUVnd2tXOEhuOFRxT29aeHVXaGNCTmdzZFB4aVFj?=
 =?utf-8?B?cE5NY01ScUE3TXN4TFVWWWRiTWU5WUFEREROTjRjSXkvTlVZNW00bEtHdmI0?=
 =?utf-8?B?TUtOQ0VZT0VXYm5odUpTd2NDbXh3OUxHbUZvZk1KTkoyVDU4MCt0UldoSXpW?=
 =?utf-8?B?eHRraUd1V2M1eGVGZU5GQUVGV1JHb2JoejJMMVYyNWdEWmpDZkY1TEN1bUdx?=
 =?utf-8?B?WjZjQWt0eUNKQWpKMkw1Qm1KV2dGR05FZHFXSXhEblBiOHZIbktiWHV4VEdC?=
 =?utf-8?B?SVQ4ZzVnVkFDNDUvQU85WTZ4NWNRa1RlbmNNRzFWUTVId2VlRGJoU1UrLzU3?=
 =?utf-8?B?VlVyWVZyMGovVjF3YzN2K01QVEUzMUQ1QTNjVEJSazdER0xhOVVxejNITjY3?=
 =?utf-8?B?V01ub2ZSUVAyd1ZYenBvYzcyREJGWnF6cDBJRG8rN0pWNDJrV2pTM1NHM1lK?=
 =?utf-8?B?NitTNS8zckhOUFhQMnJnS2ZIdHUzS3lidHFqUWN1cW9zdUVNbk9hMXdsWW5j?=
 =?utf-8?B?aXNoZS9PbGNacUdaV1c2Q3BUZU1QZjYwWlZrT0J2T24zblBGNXBsR3BiTitx?=
 =?utf-8?B?OEgrVW5JaUVKK1BOQlQvTUV0NDFpekszQm1LNW82ZzRKaVhmTnltN2RXMEQx?=
 =?utf-8?B?UU0ydERURSt3UVpuU1NaM3E3Q1B5ZWlTWWpPOTJ4c0xhRENDRGx4NXlTRzB5?=
 =?utf-8?B?NVQxSTdEeC9WdnZGaEFRajNHTjhFdER5dnFLdnJqemZqdnZFU1d0WkNXMDIv?=
 =?utf-8?B?UXBLamF0Vng2MUlWNVRJOElVZ1BrQU9SL1RKR1pLcEh5RDFWOUxITm9uRTRW?=
 =?utf-8?B?RENHQmZpbmkzSEdHTHIzbzVoNHI5YVZCT0tKM011WlFTd1BZRDRmQkxXaDRT?=
 =?utf-8?B?VnlLTXlLa2l0bjNQcEYvSk05UlhwcEM5VStmakxrMStVY3dwa1BsemV1TVh0?=
 =?utf-8?B?TnYxQm4wM3NJNHZ0aXU0dHZBeE9nNzkxanU5TTdIUWlvbUZyd2dBNnZMN0p0?=
 =?utf-8?B?Q0xyVTBVa3R5RTRsZENjYVVqbGc2SnlMYVgzNHJnRTE0WEVhNHlFSjZjd2NG?=
 =?utf-8?B?MEN0VXh5UDZMc0I2NjJHeGREVVdXY3F6M0hONWlGMFhpeXcwdGo2WkpWYWh4?=
 =?utf-8?B?T0lIVkxFMmQrTS9jZE10Q1FGazlickNhdEJFQkFMQW1ya2toZUREZlZwV0pp?=
 =?utf-8?B?VkQ2Z0t4VnhReGxnakxRMWJWZUtjMGdqNDJmenlseFFaY0NFTnlxVHppdG1P?=
 =?utf-8?B?RDVhVkgzNHVmSStpeWtuNGszUUh0ZzlaYUh0Q2l3a1Q0ZEJGbDlPWTJnWFE2?=
 =?utf-8?Q?VEZnAWKCyn9U00E8K8rnYukQSmC9q/OK?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bE9jUSt1OTN5d3NjelZwclo3alJtbldNbTNmWENzZWV0TWowaW02ZE5aSjI0?=
 =?utf-8?B?OHpkZGRCM3U5T1pwQkxXK3lmbmxacEtQVHFkZTcvK0RldDJQRFVOcWU5YzdN?=
 =?utf-8?B?ZGQwbDlYc3RRWmJ6OVN3UVpQZ2NWd3ArT0JwQ0N5cjBxQ0FReWhwKzlmWkU2?=
 =?utf-8?B?NDZLOXQwMW5EZFZ0Y3hOaFdhellpQjlIQ1VoaDNxbWRCb2tSWjc2WnBmYTBj?=
 =?utf-8?B?Tk9rZE5qVzdhOUNqMkZpMHdXNURXM0dPcmhNbjgzMHdKMGZDNFhKVXpIOXNw?=
 =?utf-8?B?eHduWnltRkg0Q1ZYR0RoVGpBekpTeDJ2NW56bVlKT2lxd2h3eWRrWkZrczZh?=
 =?utf-8?B?b1E5WmtNMmdsRnl6SldCMys0TjZnZVJXUW9mZkpib2FPWUpaN0Z6YkdQbEM3?=
 =?utf-8?B?REtaMkpaVVk5ckpMYUlWV3phQ0Z3eis5N3Fkc245SnBhVUw5TmVSQ3NBOUlx?=
 =?utf-8?B?ckl6V3dNZFZMdnVWSGtDK0NUN1BFbHVodysxVURUNmc1NDVmUjdGa0tKRmJS?=
 =?utf-8?B?cGh4cWd6aDFKcVlBZVNDM3NBcVRmZWZhRUJsbkk1azl4QVQvamNONER5QUsw?=
 =?utf-8?B?K09HMjVZdHNKWkZ6RGNxZmpaZllZTjJ6Wkp4dmw2eEZXU0cyMWlNZExFaXow?=
 =?utf-8?B?RVpQTm43YjMyUTlhdDJvellXWVlnbkcySDFGNjJYMk94Ny9laWtsdTVzaE5l?=
 =?utf-8?B?QVBlZC95TkhucWVLYjk1WlhQNFYva0g2UGJVUXBPaktiVGVrM1JGMzVHTnVG?=
 =?utf-8?B?RzU3Unc5L1NMUlpUVlFBK0dHQW43TVA5RUdtdlRkQytvZmxTVmx4OEtrT1Q4?=
 =?utf-8?B?M0U5V0NYQ2FabEgyQjJaNTVBWUJXMnltWTJyOTJna1FRUFRLbDZWdFNtK2wx?=
 =?utf-8?B?ZnpaVTNLa2JMOUN5L1hZVzAyNkhBQWcvbk1oTWFkVDJLT29CZDlWMXB6L2Fr?=
 =?utf-8?B?Z1lqcXRseVpWR0pnbEt6dXcvSWYwdFk1R3Rwb1VDMlZmZW1WZC9aai9lZXlk?=
 =?utf-8?B?bDFOTTRaTHhBalJRTDEyQ0VoQXE4Mzk0TXhMYTlWcURBUjNHQXpXYVc4VkNl?=
 =?utf-8?B?dVhabWRucFZzYW1CcDJWSHFoM25ocmJCMGtFUGxHV2J1YW0zQ2VIL3ZGTHRK?=
 =?utf-8?B?clgrY2VrYTFzallTd1VRRWJrQlFzam1maVk0K013T21yUjNyMmVqTm9vTkRr?=
 =?utf-8?B?UWovcHJ0dnRrMlhCb3h3dk9JUUNZaVRyY01ZOTlpc2VUak5yaEh3aFdNa0l0?=
 =?utf-8?B?TCtFYmJuZDRTeTVpVmFWZXJwL2YvR3o3R3RZbk1MWnNoYjBvMkxxRlF3dzZr?=
 =?utf-8?B?TUtISTdlSEY4Q3Z4UXRPMmYzQU5YZ24vd2FRc1lSZ2Z3QWgrT2Rvci9OMjVN?=
 =?utf-8?B?bThZZTV2Umo4NWFRMXZiRHU4Y1YrTTJuQkNKYmJ6b0hoVzVIV0VoT3drNUFV?=
 =?utf-8?B?TE5HNTFTdFBES1FxMnlWQ3Ivb0tqY0JIUy9najJBWjNPTU4vOXJDRERYTFpa?=
 =?utf-8?B?bEsvb2tVY1pDV1E3QjBGUkYrREFUa0s5SGMzSHFTWXhvZW9RcnllR0tRcWlL?=
 =?utf-8?B?eW9tRGFFZmVNMTB2QzR3cW03RWN1Q1ZObTh6WGY2VmJCNFZ5QXh5L2o4eklv?=
 =?utf-8?B?SDkxQzZCV0RNQ1hUUm1UZUY3YmR3ZnZJa0xRNFBib0ZQU0NWbEdMeDU3NTE3?=
 =?utf-8?B?SjhQZ0x2YkoxZWR5WlR1ODQrWEtwVk44N1JGWTN2NEZUSzF0VlZYSi9aZTNE?=
 =?utf-8?B?SGUxNGFOcFV1ZitEMmNLb3ZBWElOaVhncTN0REFXbHpsYWVnZzlaVlRmSHA5?=
 =?utf-8?B?TEJQNFY0YW1LbnoxOWJHOEpuSkNPeUkrMXlnWkg0QlNZL2JtMjhSNm4zQngx?=
 =?utf-8?B?MGVpdHdwQWVBNEkrMjdXTk1MZUtmdGt2SlhpcUpzRjc3SDdXMGMxdXF3VDE1?=
 =?utf-8?B?ZUY5TWlJNFdZeWlNYjd3MUZKdTVyY09SVkxVM1JkMkpWVjVtamhnazh3OHUr?=
 =?utf-8?B?cXhMUXN4ZngyRkYzNEdZM29OSmZoTS9vWmxqclhLajNreW1xVS90S2YvK3BF?=
 =?utf-8?B?bnBERThyc3VKNldtL1NwbE9KOG83ZGRObzI4cFp5bHBYWGtmcGtVazlzRnJN?=
 =?utf-8?B?ejhpWWlJa0V2WlpsbUhFY0dFNmF1V2wvNks4cFc1MlFUdnB2emZIUGZxM0ww?=
 =?utf-8?Q?vogbTJXHIlozZN6c3TdZlVI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 77481def-0e62-457a-9246-08de3c07afb8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 18:28:04.5761 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lEPN3zv1lmNOjJ+CFrAVK1A4eMkSa7mzl1sdb8NYcIyVeoLfs5kVM9lfrD3nBqRhd9Eij0ALTT576G3KdXCJet8tXSpxy1W6Uv4HBGXcJ2A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7479
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



On 12/15/2025 6:37 AM, Michal Wajdeczko wrote:
> We want to extend our macro-based KLV list definitions with new
> information about the version from which given KLV is supported.
> Prepare our code generators to emit dedicated version check if
> a KLV was defined with the version information.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com> #v1

My r-b stands.

Daniele

> ---
> v2: rebased after patch split, use new macro
> ---
>   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    | 19 ++++++++++++-------
>   drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c   |  9 ++++++---
>   .../drm/xe/xe_guc_klv_thresholds_set_types.h  |  5 +++++
>   3 files changed, 23 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index 59c5c6b4d994..6e8507c24986 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -269,7 +269,8 @@ static u32 encode_config_ggtt(u32 *cfg, const struct xe_gt_sriov_config *config,
>   }
>   
>   /* Return: number of configuration dwords written */
> -static u32 encode_config(u32 *cfg, const struct xe_gt_sriov_config *config, bool details)
> +static u32 encode_config(struct xe_gt *gt, u32 *cfg, const struct xe_gt_sriov_config *config,
> +			 bool details)
>   {
>   	u32 n = 0;
>   
> @@ -303,9 +304,11 @@ static u32 encode_config(u32 *cfg, const struct xe_gt_sriov_config *config, bool
>   	cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_PREEMPT_TIMEOUT);
>   	cfg[n++] = config->preempt_timeout;
>   
> -#define encode_threshold_config(TAG, ...) ({					\
> -	cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_THRESHOLD_##TAG);			\
> -	cfg[n++] = config->thresholds[MAKE_XE_GUC_KLV_THRESHOLD_INDEX(TAG)];	\
> +#define encode_threshold_config(TAG, NAME, VER...) ({					\
> +	if (IF_ARGS(GUC_FIRMWARE_VER_AT_LEAST(&gt->uc.guc, VER), true, VER)) {		\
> +		cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_THRESHOLD_##TAG);			\
> +		cfg[n++] = config->thresholds[MAKE_XE_GUC_KLV_THRESHOLD_INDEX(TAG)];	\
> +	}										\
>   });
>   
>   	MAKE_XE_GUC_KLV_THRESHOLDS_SET(encode_threshold_config);
> @@ -328,7 +331,7 @@ static int pf_push_full_vf_config(struct xe_gt *gt, unsigned int vfid)
>   		return -ENOBUFS;
>   
>   	cfg = xe_guc_buf_cpu_ptr(buf);
> -	num_dwords = encode_config(cfg, config, true);
> +	num_dwords = encode_config(gt, cfg, config, true);
>   	xe_gt_assert(gt, num_dwords <= max_cfg_dwords);
>   
>   	if (xe_gt_is_media_type(gt)) {
> @@ -2518,7 +2521,7 @@ ssize_t xe_gt_sriov_pf_config_save(struct xe_gt *gt, unsigned int vfid, void *bu
>   			ret = -ENOBUFS;
>   		} else {
>   			config = pf_pick_vf_config(gt, vfid);
> -			ret = encode_config(buf, config, false) * sizeof(u32);
> +			ret = encode_config(gt, buf, config, false) * sizeof(u32);
>   		}
>   	}
>   	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
> @@ -2551,11 +2554,13 @@ static int pf_restore_vf_config_klv(struct xe_gt *gt, unsigned int vfid,
>   		return pf_provision_preempt_timeout(gt, vfid, value[0]);
>   
>   	/* auto-generate case statements */
> -#define define_threshold_key_to_provision_case(TAG, ...)				\
> +#define define_threshold_key_to_provision_case(TAG, NAME, VER...)			\
>   	case MAKE_GUC_KLV_VF_CFG_THRESHOLD_KEY(TAG):					\
>   		BUILD_BUG_ON(MAKE_GUC_KLV_VF_CFG_THRESHOLD_LEN(TAG) != 1u);		\
>   		if (len != MAKE_GUC_KLV_VF_CFG_THRESHOLD_LEN(TAG))			\
>   			return -EBADMSG;						\
> +		if (IF_ARGS(!GUC_FIRMWARE_VER_AT_LEAST(&gt->uc.guc, VER), false, VER))	\
> +			return -EKEYREJECTED;						\
>   		return pf_provision_threshold(gt, vfid,					\
>   					      MAKE_XE_GUC_KLV_THRESHOLD_INDEX(TAG),	\
>   					      value[0]);
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> index 0fd863609848..ece9eed5d7c5 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> @@ -21,6 +21,7 @@
>   #include "xe_gt_sriov_pf_monitor.h"
>   #include "xe_gt_sriov_pf_policy.h"
>   #include "xe_gt_sriov_pf_service.h"
> +#include "xe_guc.h"
>   #include "xe_pm.h"
>   #include "xe_sriov_pf.h"
>   #include "xe_sriov_pf_provision.h"
> @@ -301,9 +302,11 @@ static void pf_add_config_attrs(struct xe_gt *gt, struct dentry *parent, unsigne
>   				   &sched_priority_fops);
>   
>   	/* register all threshold attributes */
> -#define register_threshold_attribute(TAG, NAME, ...) \
> -	debugfs_create_file_unsafe("threshold_" #NAME, 0644, parent, parent, \
> -				   &NAME##_fops);
> +#define register_threshold_attribute(TAG, NAME, VER...) ({				\
> +	if (IF_ARGS(GUC_FIRMWARE_VER_AT_LEAST(&gt->uc.guc, VER), true, VER))		\
> +		debugfs_create_file_unsafe("threshold_" #NAME, 0644, parent, parent,	\
> +					   &NAME##_fops);				\
> +});
>   	MAKE_XE_GUC_KLV_THRESHOLDS_SET(register_threshold_attribute)
>   #undef register_threshold_attribute
>   }
> diff --git a/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h b/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h
> index 0a028c94756d..5f84da3d10d3 100644
> --- a/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h
> @@ -24,6 +24,11 @@
>    * ABI and the associated &NAME, that may be used in code or debugfs/sysfs::
>    *
>    *	define(TAG, NAME)
> + *
> + * If required, KLVs can be labeled with GuC firmware version that added them::
> + *
> + *	define(TAG, NAME, MAJOR, MINOR)
> + *	define(TAG, NAME, MAJOR, MINOR, PATCH)
>    */
>   #define MAKE_XE_GUC_KLV_THRESHOLDS_SET(define)		\
>   	define(CAT_ERR, cat_error_count)		\

