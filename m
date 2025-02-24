Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9122EC021A4
	for <intel-xe@archiver.kernel.org>; Mon, 24 Feb 2025 22:15:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BBC910E037;
	Mon, 24 Feb 2025 22:15:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k/qWwvdn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEA3D10E037
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Feb 2025 22:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740435322; x=1771971322;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rkBUgdu7XdVA5FWuAfeL8I0Sm3lsGPllIJk4hTdnQYc=;
 b=k/qWwvdnUudVJJscAzo92cnBxDlQ0KkEFBxp3iXpce19kIh7fH+hcHB3
 gGgjys9w8Xan9t8mD5DhP7bOL+4nDTcE7jFQDeXpMrlCX03M4oohW2eNn
 +uSuAwXr/XRcWroq0eoQDQLoBjU6sOc2fFQP5+UumJqsGsi9ytMKhZGJw
 xEQxKE2f+ylCuUgnNaBrABAWkxdnGpV2Xna+vfJnyxnwf2WuSG86ZfUad
 IlKTMRCpOl8nCK71lxcliAHVKfTmRJcDk5u7KGuXu1VKaA1OPXiPbMALV
 6gLQC64tvQdRBXgILGI0R9Xr4UBcT1n4shUZIxJBnYvIwzc60Anjx7O72 w==;
X-CSE-ConnectionGUID: fDCIChpORBSA/L63MwScag==
X-CSE-MsgGUID: 2lX98Bk+Ttm1i7JFhE6IiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="52210650"
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; d="scan'208";a="52210650"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 14:15:17 -0800
X-CSE-ConnectionGUID: mnVbvImLQDOBVuaOZbn74g==
X-CSE-MsgGUID: cdoIZ5V2RpOPFwK5+bkQAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="116029014"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 14:15:17 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 24 Feb 2025 14:15:16 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 24 Feb 2025 14:15:16 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 24 Feb 2025 14:15:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PdblWPIFT2bhjskUjBSbMa9u+OvCdAjY3OKonHDHIjUpRikC2Zj8Qr6tyz4rGkCTSrqIdxz8bDhCljz0KWnLL0uzM/VeZb6JGLmXDjqUXFZQ8mEk1I4T/aHEb3d9PScQSlXjysRoAjikboQnp7oPcqz9IbuRfQEW3uw0/bzq0IMHI8RJiXya8/tWi6h4NgHb+azlLb59RGLDRCOFRcs+eibyL9BmVTmrfC6TTF2PtV5UGZho7fLZMDYnLJ4pu7OC6i/aBvd5YrLB9+7uQN5Kwz4jZ09CnDwHf31JZYUwkvxBc9yE9Soz2lI7s8C0mD2iaBCANWMa9/j8RdwUc3M6OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H5VDTeYDaatIEzZs4IlObv0+goaCYPTYzeyaOJ4OjWU=;
 b=uDVvTJwQNlGOnz2OEmp22QIHUiRPnEXqD0JVQRpQftI106lpTVVsnshAdO49bUxuQbp6YsYlu19sQEw0f32GMlHlf2W+pn2vruXNqquDhR0Dwpb58s5C1YPpnELag1mWvF1gIXWsa8wngLxoG9DG7dC6yfv4oS1pCqiwv4eMF1nJ1mpV7LCzQxpJnAi7hiqLdhMvucYytwofjVwdyXeSHKoXN0EZUj12fbIokI9BKbiuvs8ZRMMLjZLtPLG6iePUpUh/R9d0KPVJF1ZdmGGXxdj7cPnGVu5qqbHP1JcZm7toZAdQuO3P96dBUGv1WNWr2K3Rn1l5xfrokmbS0WXREw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by PH8PR11MB7990.namprd11.prod.outlook.com (2603:10b6:510:259::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Mon, 24 Feb
 2025 22:14:42 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 22:14:42 +0000
Message-ID: <8a5b6c4b-c06b-4bbc-bd15-f1b62ef07436@intel.com>
Date: Mon, 24 Feb 2025 14:14:39 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] drm/xe/devcoredump: Remove IS_ERR_OR_NULL check
 for kzalloc
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>, Shuicheng Lin
 <shuicheng.lin@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20250219212631.1788586-1-shuicheng.lin@intel.com>
 <20250220001710.1803749-1-shuicheng.lin@intel.com>
 <20250220001710.1803749-3-shuicheng.lin@intel.com>
 <60047a3a-9919-486f-8fe1-4c2f90c110d9@intel.com>
 <wtk56h75pu66dnnqx6az6dxyfhvgqbovp6sdihtenuhxuoneh5@yo2joqcv75sk>
 <ab15704b-20d9-43c1-abe8-607e070c2cdf@intel.com>
 <veg3pgmivlvwgur3fb7k4da4aqad335b5tfrd6sdnq3g6ne3wh@mjhypez7eqn4>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <veg3pgmivlvwgur3fb7k4da4aqad335b5tfrd6sdnq3g6ne3wh@mjhypez7eqn4>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0140.namprd03.prod.outlook.com
 (2603:10b6:303:8c::25) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|PH8PR11MB7990:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d238918-b62c-46e0-303c-08dd5520a317
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aERva3RidWpBMG5pSjNFYnZOdEFBekVJclVwM25uSkV2VTFaSkhiMm1nZEUz?=
 =?utf-8?B?YUtBYVJLTW9uM3dSRGZKQlAyNUhzVEk5Umh6TWlpS0FOdE8xR29WMlc0YmQ3?=
 =?utf-8?B?R2d5N1NUL1Y3R3hFY3pwdi9BY1pYczVxWXl1SEpVOWVsWUY2T2hWaGZuTDVX?=
 =?utf-8?B?ZnpmclRORnZnUURPM3h2UHhUd1dPZEpFek1KWkd0TTNua3IrSmp5OW1YU3Ew?=
 =?utf-8?B?bWxqVktOa1JmRk5LY1BiN1RjNktmb215SDN1K3hXMVpFR3NWM1g0NnhGSllI?=
 =?utf-8?B?ZTJRRVNsUG5zWUxoNHZWQnVDZWx0bG9rbytqcnhKbmVPVGZ4NUhad1MrbjZS?=
 =?utf-8?B?VkIzQlN3SjhBRWJKZmtubVhaSnhsbmUwdjZNVEkrRDR2ZWJ0MHM4U3B4SHNs?=
 =?utf-8?B?a3dFR0E5NlJNdmo3UUcyc0ZFSjgyemNBUStIOGlCOVpKRHJMS2xBTy9jc2RU?=
 =?utf-8?B?OVFuWnNZRnlDaEgvN2tSclV0QkxUS1Zrd3RiZityWUM2ZDZxNlk4anlmOVND?=
 =?utf-8?B?OVUxZGVZTUdwck1xeFRsQ2drSVpmYjVDbGNUSVQvNlo5VjJlSmtPVi9iQzZZ?=
 =?utf-8?B?UTh0NGo1UWhBM0xKZ0ZOZk1wSGhEVUs4ZTVRZXpscVFQNzl2SEw2THBEVktp?=
 =?utf-8?B?VS9WOWNSQmFiZ2ZMNjdLNE1MZUJZWXdISGJOb2JTNFhyM1ZSYStNcy82dmFx?=
 =?utf-8?B?Nitra3VNR21ZYWVLMDZQWmhodTJuUEZrVm1pZU9ETm5qY1NWY1hYdFRPLzc3?=
 =?utf-8?B?M3JuYlkyYzdLVEVzRnJsZTF0bHZzM0thUTlndUpOYVdlUGNKNm9RSzA2NVBz?=
 =?utf-8?B?Z2dYQTIvQmlzYkpkcjYzTURqbEVZQXVZY2lUamFCYUNldWlhQzZ5R0JWVmdE?=
 =?utf-8?B?ZU5LUTJ5MUt4YXFMUEQrZEdIYjlVV0lWNHI2Ukl2NSt2UjZEZmlpczZINEw4?=
 =?utf-8?B?NEtTT1h5U1krbFFTS1NZa29SM3RpMVNaTDFROTJpNGk2TlRJdWxWTzh5TUp2?=
 =?utf-8?B?djdweVZPazk3ZUh3azNvMCtBZEtBVmQ4ajVCS1VId3hiaXpFS3h6S1dHbU1U?=
 =?utf-8?B?eDM1dlE4djhrRnZHN3c3RW9HWk43bnora01SM2NDUitrTENhcjd6RDVOQXhn?=
 =?utf-8?B?OVFBZk93OFZGQ0IvSGs4NHhSTnBRRkJmcElvWExFOE56NXVQbjFYKzRvYXpp?=
 =?utf-8?B?QXN0ekZrcWRFazBFTEFKY3pXYVkzb21UT3I4dEtkbFJUcGg2TVRDQWhDcUo1?=
 =?utf-8?B?dGhPRnVTU3pvc3hGYnI3cEpKNTdvOENjTFhlbXRxL2hIKzZ6ZTZqSHpvZm5J?=
 =?utf-8?B?ZTZHZmJaWXRMYzdoUkJhcjZtYi80aENnVUd2Ry9GTDkvRjNvTmQvUWwzS040?=
 =?utf-8?B?ZHg4TDl5UWpXQ3RqQThiL1lRZ0Vpc2NTd1ZMVW9KM3NmelVXaUQyZFU4cGJD?=
 =?utf-8?B?aWpLa29KZUJpUTJLVVZZdkgwLytBamhPVnphT2g5eHNUY3RYeGQzV1NseFo0?=
 =?utf-8?B?dDhTVURmQ1ptaGVQWXlLM2hkTXJrZVcvVkpoVkxhNzhSeC9yUHMvd0pvQnZv?=
 =?utf-8?B?RENtUmFrdmJXRUFpajYzc1dFb0pTeEdjaVo4VTRidmtHKzh5ZW5Sc1RlVVFs?=
 =?utf-8?B?a2FoZTZHQ3dhYzFnQ3ZDbFZNUFFKTUlIeGxsejBiVjJ0TjNCNm1Ta2Y3bktZ?=
 =?utf-8?B?NTU0QUlWZmh0ZE45K1dQV3pGaWZaUGFWL3FVemJIcjZITlExZk9mU1lFWXpG?=
 =?utf-8?B?NFZqMThjTFpsK1BpbHNuclpabENWdzNPZGVGMUM1Wit0aEF4OVBQQWQ3Z0VL?=
 =?utf-8?B?VkttZitOTzl6cGFIYU9EYUtiR1N3TE95WFRaUlpCYkcrSC9FbTV6M1ZNOWNq?=
 =?utf-8?Q?2iHb6/2KeXkBA?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0RtUWorR1JWSjB5YjFNR1dzaEJMQS9HMDlCbnVyZ0hkbkpzY2J3aTkzRk9l?=
 =?utf-8?B?cmhIRXptcEgrMEZqek14ZUMvMXJleGVQcU8wZnFlaXQ1MGttSVd4THpkMk5B?=
 =?utf-8?B?QkwyMGRQbTdkNzhaRkZQY3I0eWR6bWdTUU10QlBFU0JWVThaTGdYdXZ1TnFw?=
 =?utf-8?B?RDF4TnFkbjliTlZ3aHVhQjhnbFRjb1JoQ2V0SWF3d2dzQXdrNWt1VWhySGFG?=
 =?utf-8?B?cEV3STlaV1BmUkc0cHVvdHFOTnl3ZDlzV3ppc0JtSiszYmVRVU9qVDUwdXYy?=
 =?utf-8?B?UjBDM0RqbmhVU0pWUmFoMHFsNGdiVXZUYmU4QWhyZ0VWblBoQ3VXdW96ZFN4?=
 =?utf-8?B?ZkRrWWFEbG1SNC9TQWdmSy8rMUtEZXh2Wk9sYndsRzJjeU94bmxXaVN0VWdL?=
 =?utf-8?B?QlZxM2JBb0g4dGRYM3lCczI1NE1WeEdHS1ROVGttVjMyMUZuU3lDemQ5TjFH?=
 =?utf-8?B?TnNNcFJMWFJjL3FhdWNOQTFIYjN4UUhmVHZRZ1l5K3lkMGROWDN6WVB3THo2?=
 =?utf-8?B?MmhZNzhzOTArVVMxakJVZmdQZjhDcVhwMThVUGYybk1kVDdVWDRycTA0b3d6?=
 =?utf-8?B?a0VYYk1hckRiRDdZaHoyRVYwTmxwRFFiY3h5YWdKYVNva1ZNbnhodElkaktS?=
 =?utf-8?B?ZW5idWNKWjRITk9ybFc1UkdQcHpvMUdZZTNidWZ3aGtKNmx2OFpSRSszWWFv?=
 =?utf-8?B?VnVZek50OEgrdk5xTkxqRk0rZlltbmprVzhIM3kxV3J0anFyWC9tQnVVTm9t?=
 =?utf-8?B?blV2TWRDRFlGR0Voc3RDUW91UEsxckt3bVVNMWhHUFhkZXM4L1RkSCtTNW10?=
 =?utf-8?B?NzZPY0ZJdXhocWQwejJZR0lncHZITDN5N1E2ZlNEZ1djaXJ5ZWZ0enlKbUxM?=
 =?utf-8?B?YzhWd2Z4NjNWeTUzaE0wSjhLWUJvaGgzUGIzQzV4YnBtL3NNYnlKRHk1dnU4?=
 =?utf-8?B?d1dsakY2WERJTDVOY0lSMlJPZEpBZFFOMU96UU9DY1JMcDNGL2pHU3NPbTl2?=
 =?utf-8?B?OHdtMmU5UGcyMWpNbkg3cVZhWFJvRFVnREw1L0tveWdtanBmV2hSSUN6L1Zs?=
 =?utf-8?B?SVViSmVrVU5RZ3NkZ0lPcGYvZmhWODVaQys5bzZiWHhlY1lnenF5dEJ1WThL?=
 =?utf-8?B?RklLbFNybExKYlV2cUROL1M1RnNGcFBWTDdxNTZPZTVlTlRxVytwY0FRSGdH?=
 =?utf-8?B?YThMQTJXVzNjbFBaOFR6TWdVTkVFYllIUWRWUlI4ZUpXYlBzOUpkdjVseTFD?=
 =?utf-8?B?OWQ2VTgrSmx2VDJOZnAzeENWTnZCN0kxTUJjTUY5Tm1pY1RjR3kwZUZFVSt1?=
 =?utf-8?B?YXhqRDYzaE9hbTFNN2EwSmUzNGhkRithMU5EZkZ4SjlYVGRiazNrVVFrMmY4?=
 =?utf-8?B?bmNnOFpmamFsdlNxbmFUc1dVcE4vRFZqeVFKL0k0WllCNFUyUDNvUU95MW92?=
 =?utf-8?B?Zk1GNlZLbXZxWTE3dFNXNU9ZQTFkbUJYTm5ZMFJGNFhUeFNNTFNVWEhIMmtO?=
 =?utf-8?B?TFJKWHRxUDR5VHVnVnF3cjhjeG5UQkc5NytRNXZDalNzNEpmQWdYMy85NnJt?=
 =?utf-8?B?V3lJdkE2ZXBrNllBYU9SQmMweTJOaGZlWUI0TVo4aWdKUE5jUmM1THV2bXJB?=
 =?utf-8?B?NUY4dnNmT1AvOHZndjdvaDlpWS9UcHdXanhZQmRXYkJ6MkdMNjNMb25hYWpC?=
 =?utf-8?B?VzExUVVTY1p2NEdTc3ZwK0dUYkwySll6ck11QmRuQXZLVHplcGRKNUt6Sm1m?=
 =?utf-8?B?TTlNSGVLdXRLS2dra1hwbmk4TUllRmlVSkJjd3EySHE0amp4TW4vcHhncHB3?=
 =?utf-8?B?c2dLMmVrRGpibm00eW4xMnh6RkM4VlpSclZodzM5eFhDRi9kZVJmWFRva29L?=
 =?utf-8?B?aVc0VnY3N3RSdDZtbXp3MnY3WTBEV0ViKzJLblBmT053amp2UU5wYndOdjNj?=
 =?utf-8?B?ZTYydTN3RmpaVXF3UHdpRk5INlFwUHY3ekt0Q1Rsc1NkQ0kzNGsxVzlrRVpW?=
 =?utf-8?B?SnNxYXJjNmhqUlg4eXRlaVcwOXgrTWwyOElXRVMyNDk5MTV2MjYxVDVZeDZy?=
 =?utf-8?B?MXBVZDhLUlczaE04MHI0L2FRSDhiVlIydkx2bmZsWHJXd2h4L0twUldLU2JS?=
 =?utf-8?B?WisyRGgwNTUwQ3NvU0h0QWRSSGRiOHpnOGV6Z2pDNVczUThNdCtHUWtacllZ?=
 =?utf-8?B?Mnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d238918-b62c-46e0-303c-08dd5520a317
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2025 22:14:42.1892 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h2LiYATz/D5yLfV5B1RwplZtAuF5RwkYDrVBgCvw6tJeIJlh6ZSfqf0fw84MnlDb9cxfHL7hUe8/+Wae4QOQrBOLm2vX2ecDRoATkjTaKMg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7990
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

On 2/24/2025 13:38, Lucas De Marchi wrote:
> On Thu, Feb 20, 2025 at 05:36:19PM -0800, John Harrison wrote:
>> On 2/20/2025 15:54, Lucas De Marchi wrote:
>>> On Thu, Feb 20, 2025 at 05:29:56PM +0100, Michal Wajdeczko wrote:
>>>> On 20.02.2025 01:17, Shuicheng Lin wrote:
>>>>> kzalloc returns a valid pointer or NULL if the allocation fails.
>>>>> It never returns an error pointer. It is better to check for NULL 
>>>>> directly.
>>>>>
>>>>> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
>>>>> Cc: John Harrison <John.C.Harrison@Intel.com>
>>>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>>>> ---
>>>>>  drivers/gpu/drm/xe/xe_devcoredump.c | 4 ++--
>>>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c 
>>>>> b/drivers/gpu/drm/xe/xe_devcoredump.c
>>>>> index 60d15e455017..81b9d9bb3f57 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
>>>>> @@ -426,8 +426,8 @@ void xe_print_blob_ascii85(struct drm_printer 
>>>>> *p, const char *prefix, char suffi
>>>>>          drm_printf(p, "Offset not word aligned: %zu", offset);
>>>>>
>>>>>      line_buff = kzalloc(DMESG_MAX_LINE_LEN, GFP_KERNEL);
>>>>> -    if (IS_ERR_OR_NULL(line_buff)) {
>>>>> -        drm_printf(p, "Failed to allocate line buffer: %pe", 
>>>>> line_buff);
>>>>> +    if (!line_buff) {
>>>>> +        drm_printf(p, "Failed to allocate line buffer\n");
>>>>
>>>> btw, since this line will be included in the output, where one could
>>>> expect ascii85 data, shouldn't we print that diagnostic message with
>>>> some special prefix to make it clear there is nothing to parse? like
>>>>
>>>>     "# Failed to allocate internal data\n"
>>>>
>>>> also since caller may have already provided a prefix, shouldn't we 
>>>> also
>>>> include it in this diagnostic message?
>>>>
>>>>     "%s%s# Failed to allocate internal data\n",
>>>>     prefix ?: "",
>>>>     prefix ? ": " : ""
>>>
>>> or stop printing and return an error. we are missing the `.error: ...`
>>> already that is used in other places.
>>>
>>> $ git grep '\.error: ' -- drivers/gpu/drm/xe
>>> drivers/gpu/drm/xe/xe_vm.c:             drm_printf(p, "[0].error: 
>>> %li\n", PTR_ERR(snap));
>>> drivers/gpu/drm/xe/xe_vm.c:                     drm_printf(p, 
>>> "[%llx].error: %li\n", snap->snap[i].ofs,
>> This is the place that should be printing an error. The whole point 
>> of this helper is that it wraps up all the blob output. However, do we 
>
> note that this is not printing an error in the log. This is adding the
> error message in the place that is supposed to have the *data* for that
> key. That's why there was supposed to be a .error key to accompany this
> behavior.  Right now if you look only at the devcoredump you have no
> clue the data is actually an error message, not real data.
Argh! Yes, getting myself confused. The '.data' is part of the prefix. 
We should trim the prefix down to just the bit in square brackets and 
have the helper print the size, the data and/or the error keys as 
appropriate. Although not sure how that would work with the GuC log 
being split across multiple bo's. It might be worth pushing support for 
split bo's in to the helper as well. Let it take care of everything.


>
>
>> need to distinguish between a non-capture-process error (e.g. bad VM 
>> object) versus an error in the capture itself (e.g. out of memory 
>> converting the binary data to a text string)?
>>
>> Not sure what error routes there are in the VM capture? Are they 
>> things that are important to include in the devcoredump because they 
>> have significant meaning about what caused the hang? Or are the only 
>> possible errors related to the capture process itself - failing to 
>> allocate memory to store the capture or such?
>>
>> If the only errors are capture related then yes, just change this 
>> line to print "[%prefix].error: %errno\n". But if there is use to 
>> distinguish between bad VM objects and failed captures, then maybe 
>> this one should be "[%prefix].capture_error: %errno\n" or something?
>
> -ENOMEM vs something else would already be a very good indicative.
But for a VM, can there be an ENOMEM error because the VM itself failed 
to allocate (and thus caused the app to dereference a null pointer on 
the GT and thus hit the crash)? Or can the ENOMEM only come from the 
devcoredump code trying to cache and/or convert the object into a 
dumpable entity?

Maybe there is no value to differentiating where the error came from. 
Maybe a bad VM or other object just won't exist and won't be included in 
the devcoredump in the first place. But I'm not familiar with that code 
so just wanting to make sure we have thought about the possibility.

John.

>
> This discussion can continue. For now applying these patches that are
> orthogonal.
>
> Applied both to drm-xe-next.
>
> thanks,
> Lucas De Marchi
>
>>
>> John.
>>
>>
>>>
>>> Lucas De Marchi
>>>
>>>
>>>
>>>
>>>>
>>>>>          return;
>>>>>      }
>>>>>
>>>>
>>

