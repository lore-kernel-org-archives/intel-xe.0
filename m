Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8C43C83F1A
	for <intel-xe@archiver.kernel.org>; Mon, 14 Jul 2025 22:13:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E51E10E0DB;
	Mon, 14 Jul 2025 22:13:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XoW025LS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBBCE10E0DB
 for <intel-xe@lists.freedesktop.org>; Mon, 14 Jul 2025 22:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752531229; x=1784067229;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=sPcInErLmKl23sflv7MoObX1xuC/xWpR+QtEfPbLMk0=;
 b=XoW025LSx3O1QjxLvNu3wO4N8+FrQXxG8E4EBauZw9MQcBtKxeGMLFgM
 Oe0RcTKZ1klGP6pCI3z29UFGi+6mNRlNgIOxyfc0xlvte50xxNvo7Cpaf
 +UWsy1I1L0jSEeDe8fu2TvazwDyr6CoHYf0Ey70TtvP6SHl7V+PTxtR1d
 Jm0hLqbLq8JAYufeDKlRnxh7Tv5coVZtNTGtJ2SV8sGSIYU4JMgDNU6jl
 tndhIHlZAd4jrzU7CvfVaqCGP4GLqr6KTE46WcnOy70apcAQfI1EFbEXA
 BRynZeYGaTbna9mKOvGHHNLnqIU56Bybw4ipTk8jgfgsEGUhWKJ9JjKPt A==;
X-CSE-ConnectionGUID: T8zTds5rTgyXOsXms2abPw==
X-CSE-MsgGUID: r5jKArRZQr6hFgKZecFG+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="72186201"
X-IronPort-AV: E=Sophos;i="6.16,312,1744095600"; d="scan'208";a="72186201"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 15:13:47 -0700
X-CSE-ConnectionGUID: U2StVYhLS8a10jc/HoBRcg==
X-CSE-MsgGUID: mcgRtqnPQ/OU5a2VsFlqBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,312,1744095600"; d="scan'208";a="162706795"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 15:13:47 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 14 Jul 2025 15:13:46 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 14 Jul 2025 15:13:46 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.50)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 14 Jul 2025 15:13:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E96INecCDoD75cMEdl9nziozSbCKq45Gth7xFTnxBHRBZgasJYAZ2p+d8a2Xgg7IafzJ04+NqZudISndvM4GXv9xBzBGelD24jxIQzct6UT8G/Ja19JDvo9cx6eJFkKmfUfi86sW3FZKey+TrB7G9/BNdbE/XHiR7AYat7RcNAl1y45MKbl3ubvsvPI/VAep64U1znT2uSKOxeCK/HvLKyLfLqHv2OHNwJI/qW9hndWfzijTgbjZrU7Kpfgbb9ij4x9o0TW9q3g27q3QBF2DMcw1QrUAq4n9i31oBHumwJZZA0eVZd+fuuIclLLG26z1pZrLFK5bms211P8oN261fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FEOwuHZsB8a046YwBd1w0Zjs6TXUWVUL4Byxy1QPQeg=;
 b=yulTrFgFW9R0iakuFvU3inK4mes9Ry/biHSoCfUBqr1DYRrtJVES7z94dzyXBR1PxLzKXQYSLuv2FjgDH9mpvu4bUeTWjFdcI7tzzXxJskfBqiEmVUh+LmjHOdkBXFQ6DJ1kJRGh/oihskYfjB6hzfMGxbBszCahUZnvewBDHp3NuUBWzrfVRRYl/3itK9In1h4GGCmKDhxQsT97XppBlfbS2t5Ez0yVyK4qy0cVt188wG+/xszbl1n7S412wD+Y8q9gN5fL76hGIDY55X6QfCh3euW3qBtL09RJIiWCzylUX6GdEQqi2/pjWaWgxyMbcU7X2IOZ9RJe9/EOrGWriQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by DS0PR11MB7852.namprd11.prod.outlook.com (2603:10b6:8:fc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.25; Mon, 14 Jul
 2025 22:13:44 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%5]) with mapi id 15.20.8922.025; Mon, 14 Jul 2025
 22:13:44 +0000
Message-ID: <c1aa9458-db61-4567-bd26-c1f2e1360f5d@intel.com>
Date: Mon, 14 Jul 2025 18:13:42 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/6] drm/xe/guc: Add LFD related abi definitions
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20250423215821.3078428-1-zhanjun.dong@intel.com>
 <20250423215821.3078428-3-zhanjun.dong@intel.com>
 <31161bf0-1b78-44b8-a3d2-9ee83178846c@intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <31161bf0-1b78-44b8-a3d2-9ee83178846c@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0033.namprd03.prod.outlook.com
 (2603:10b6:303:8e::8) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|DS0PR11MB7852:EE_
X-MS-Office365-Filtering-Correlation-Id: 855504ff-b553-4b9a-d725-08ddc323b2be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q1hnSldKSTdBTjBxbjVFN09MS2NyaVR1RnJHUjNSaDQyR0d1VUxLclExNWF6?=
 =?utf-8?B?U0hTVFdUVStsTGt6MzdZNThaZjJCVEljRGlVN0Z3d3lDeU1OSTFGSHI5emNa?=
 =?utf-8?B?LzRDRGkyTFRDa1NZc1NSVy91WUNob05PTitYaXJ4NTNucEVGcm4yd04reC9z?=
 =?utf-8?B?eFREMGRpcFdjRC9hUzRRM3laU3NVV09FaExENXZGbGhsWi9Qd2wvRUhRUERN?=
 =?utf-8?B?NzI3bThPRUJ5cWpQNFlQKzg0eFduWHZ1QW42WnVaOUZ3bFBOd21BalAzN29P?=
 =?utf-8?B?ckFnV0NVZldmN2VCUmd2V0RDNVI4Y3lrTWE1aXZTTDlZTGNWV2NEUmFYNXV5?=
 =?utf-8?B?YjM4bS9XTDdpUmpPUDNpc2owNUpOY25UeldUaVZDT2VLTkVDa1ZXTHdIVXNn?=
 =?utf-8?B?SWVDbUZoUWFqV0xqSVBnd3RJOWlFRTlhOFZwbGZBOHc4a0dPbjdkZ3pKMGd3?=
 =?utf-8?B?endyQk1hK1V3akFWMmZiTnR5R0JsQ1c1M0t5N3pzMGVoTU10dnJoR0QxcTlH?=
 =?utf-8?B?Zm5FRno1QWFlME05aWNrUFd5TE9DZmxIRGhrR3dYTVcvRzh5M3BSM1l0Vkxz?=
 =?utf-8?B?SitJWjN5RjdOdDNkS3NuS1hZVUxRMzhTOWg0c1ZxcXF6Q25FS1dJc056b0Ey?=
 =?utf-8?B?WGpJM0xueFZrZGtlTjh4b0FWcUJUOFo0RFNkLzF6NUxDUzFzU1c3Z0w1SnNU?=
 =?utf-8?B?WjNoaWhkRGo0U2poOWM1aUFMcmJxSDcveVpKNDJwdXk3WTBVOWkvVjN3T3Yy?=
 =?utf-8?B?eWsyRFhOaFp4N3o0S3VTT2JBa2FEMGJKMnJUa1V4S1hLWUl6cmNCSGl1NjRG?=
 =?utf-8?B?RVpRQ2g5Q3F6UlcySml1aU5ScjV6bXp0YWk0V1VrYnBzbnUveUluY09IOERS?=
 =?utf-8?B?SmxTcnlhRU84SWxXVHJUWDU1VVVXbXBwdDZhQlBkckIrK0hleWNrekw4RDE5?=
 =?utf-8?B?WTZXNnEvQkJ0ZVlsSDkraUZwZGU1ZmNPazlVODZqSEtxaWZnRXgvaExSTGtl?=
 =?utf-8?B?VFg5eitKUkx2K2NJMC9saTE4QzVTOVg0MS8xTitFbmZUeTFBbUZoeitsdnNi?=
 =?utf-8?B?TmZQbTd4ZFdwZ2NtaDg4dkFQMjlRdlVyeS9RQWhJTXRHYkJkWG9NSGFESmtU?=
 =?utf-8?B?TWx3VlFuQ1lWWFovM0pHTlZJREkwa2l6TE1ZcEh0alMySzZpdDFlOHpTdXk2?=
 =?utf-8?B?cVBqMVlPdUNGa0ZHNnNPWjVlT0ZwcWxYVmVIT3MwYXJQNDV5QXdBVVcydldm?=
 =?utf-8?B?ZEhMczdMOHorSkk1L2lUK2tIelFUQXZGTElLblc3aHpYakRtZSs1U3N3Z3Fk?=
 =?utf-8?B?eWMyanZXVjJuR3pXbHRKUUlvamRYUHhwNGRLd3pnMi9DRW1JTHFnZGNiZk1P?=
 =?utf-8?B?TTZobFlaR2VrZ3ZuYVNiL05CREtjdllNd1djalV5ODlDbGxObkcyMS8rTDZG?=
 =?utf-8?B?UFpEYVV1Smx2Uk4yU1I2TEpBRzl6WXBOd3FDK2J1bmVNR3F1eVZ4V3FTbjF1?=
 =?utf-8?B?UzBQaE9CanUwUnhMQ0t3WWpuR2QxZ1NIRGk0RHp5V3NqdEpmUHBrR3RVMWFj?=
 =?utf-8?B?TTQwYStsMnVpc3VtbENJV1B0aUpHVDNENTliU0NrWTJ0RFY0TVIxSUM1MW03?=
 =?utf-8?B?ckU3L21MN1dJOG5Ka0tFTzh2anVLaUlqei9VbDQwWnBIb3VobkJqUmFxZndQ?=
 =?utf-8?B?enVPN3h2NXZtc0JJNFVyYkpBUllxdXpTUitTM3pLa2M2cjlPcno5UVRHSDlE?=
 =?utf-8?B?bEFJVUhSS0Nrd1FZdWRjcm1nR1h1TldFTElSVmRoYlJENGN2c3BvaXcwK1ll?=
 =?utf-8?B?emNXbkZYUld5TlhyUmNYei9LTG9NQU9OZjd2UzJlQkM5WEdjUStSTC8vcjk3?=
 =?utf-8?B?ZUNmOE5nQitKWU5hL0FobW8yNWgwMXc3T2dGQ1hWMmt0eGZNUHpkUWp1NFFE?=
 =?utf-8?Q?pMLLLGSRgCA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y2thZkZCcmNHQW9ieG1zQ0JOcU0zdnh6a2lWT3drZmlGVWV3NTk0OXhFYVNo?=
 =?utf-8?B?a3NjSjJjaCtaWi9zQVpHTnNpQVJuRnRkYVB4ekJMV1ViaEVTZ3oyS29NYnlB?=
 =?utf-8?B?SDNqM1lMT2JFNzIwS3c3RDBwZWFVYVNlWHU1WlNXbUFCeW5XY3hxYVBwWTBC?=
 =?utf-8?B?MWZHYXNHSFNvNGdiRmdDYU1mNU1hSnlNOU0vMjFDKzVReGdSL3lIT3hhZk5G?=
 =?utf-8?B?emV2ZTg1Ums0L3FVazY2N0llcjlxZER1SVplL05IcU04NVgxVUIwUkhKR215?=
 =?utf-8?B?eThTY2ZkR0w3cFlldzBVaTl0cDBjMW1PMmRCWDN1elptUGJoWlFCZDFYSkZN?=
 =?utf-8?B?bzUwaGJvN1BHam1lS3U0ckNxYm5xMWVtd0lIQm5zckRmWVVYejhNaGVDRG1x?=
 =?utf-8?B?RXZqeXl0c3pCalA2QnNFcWc2UUtQbnJlVmkwZ0Q4Z05pLzhJNEtmSGhSL1RJ?=
 =?utf-8?B?RXVzT2VGZ0RUZEVJWmMyQzEvZFc5enJEYnhPbDk2Nnl1MmdoVkw0c3VLblpO?=
 =?utf-8?B?ZmFxTys4OElvanVPM1M5T3c2dno4Z2VUYjBISjdpdy8yK0RTRkY3UTRLQVk5?=
 =?utf-8?B?NW4zUmZXVitmWVRNMWRPaDdNSHpWMUNMY3B4U202cEptdmZtRkFST1ZWWXVP?=
 =?utf-8?B?UjlPMnFCNExnbXllTEMrcExDbWNSQk1ZenorT0g0dWZ0RmZGWEhBVFNuVi9D?=
 =?utf-8?B?OUIveVJKakpZSlJ6d1ZqTG9Hc3VsekVWMy9wYzlrSmZaM3dBakJicGFseWg1?=
 =?utf-8?B?SzN1cFZSd0U5M0JMc3plTlZWNHZkUnpFVFhHVThpRWxrMnpYQkRzQUdkcUdV?=
 =?utf-8?B?Sko5cU42andiSUNMRUNIREJ3b2llUzJ4NWFPYVVhd1pjOHBEVGx0bzYrOUJ2?=
 =?utf-8?B?cEU5RzlHcHpFUmNMVlhkelJnaDJVUUhicSs3SlZ6SVlENUpYanhxdy9ZSmRP?=
 =?utf-8?B?TTc2SjZGaXE4Q0ZpUUV2Y2h6dVQyN3NGc3IwdFFpVm5SSHBOeHBjdFpNNGlk?=
 =?utf-8?B?bnl3bWtERmZWOXNXNkx5TVpacG9UeWRPbXVPTm1Ra24veEhTZEUyWVhPaEJQ?=
 =?utf-8?B?cTRJRTV0clUySkVPQnZlU2VQT1FuZHhkOGduN2s4S0gxMlZJRWMraTJvNTdB?=
 =?utf-8?B?YWtrdGo0ZTNmQ0RZcDBPN2owTDVSQlZNMXlBek15R0FpdTlpNFZ0ZVFhWjVu?=
 =?utf-8?B?MWsvZVhQbVgzY2JtMXRRN0JrR3J5UW9UNzhValArODgyS0JUKzd1ZVYrRFpH?=
 =?utf-8?B?dTNNVFBoNXRJQWg2RFIrSUNzaFlEdU1xK08wZWV3ZVVZZ3d3OGpHRm5hTTU2?=
 =?utf-8?B?TDV6Q0RGUDVCS3YyMHpjZGthUzNKcGthamowQk1EZEcyZ1ZNeHpldXRnVy9J?=
 =?utf-8?B?WWdvZmVZVm8xbkRjTDRwZ1R0MmdaYUMvdDdpRGoycEpGa09SNk1xVmFEUDQ1?=
 =?utf-8?B?SGl5RnVkTkNqTnhuaWducDlaTHgzOTQwaVBGaHMxdW5TaFo3WTJSOWxiWDAw?=
 =?utf-8?B?eVc3K1VyNFVCN3djd1VWRTVLTWxjK0N2MWhaWktRL1hYOGhHZ2ZzeWxyME9h?=
 =?utf-8?B?OVdhYzdnb2pwR0dONGRzSmpuK1J6b1hwcHJLaGY2S0phbmxFQ052YU5ReWRG?=
 =?utf-8?B?SlZQSWtncTUwWTFiclRPMU4zYUJwcldEUHI4VHZlcmxRalVrUGlmSjhRK1hh?=
 =?utf-8?B?K1BSNGdvRTFWckF3UUtiaDVCcm4za0J5anpsZ2tpaUpNNFhwSlZvZHRYQTZX?=
 =?utf-8?B?U3h0a2xiVDlFU1JHUVpQdjJxZFVHMlZDRlJrNGdvMDFMT0g5cUxmVFluWE5t?=
 =?utf-8?B?YUpzWWc2dkZVcUplSUp5MExQb3ZJTjBnZTVGeCtXNXZKMS85WVRsSUpZN3Zh?=
 =?utf-8?B?WmsxMW1wVjlxS2JZUjY3MUlHYWozZTNEdkxJR0VNb2hqWmNQUW1kYWY2MVE4?=
 =?utf-8?B?QWI5YXczMlNFY1dHalRVKzhtRkRzeEhhVHRqYmljSDkxVWk1UnFNRlg2aWVp?=
 =?utf-8?B?ODhmemQvbEpBTXJINkFCd0lNa2ZqdG02cVFrTEtCZndKb3lLbFZzREVjbWQ0?=
 =?utf-8?B?TGVvb3FrOFZ2S1o2eW5PYWphRWM4WUpPQ2owSThsM2ljRk15R0lWcDVmZWFD?=
 =?utf-8?B?WWpxYVhvS3JmMGVtTXA1VHMxL1VybjhjRnk3MDNiNnJLUVV5b0s0d0pTSlhO?=
 =?utf-8?B?RGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 855504ff-b553-4b9a-d725-08ddc323b2be
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2025 22:13:44.7991 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ITSPkg2uvOChhFc1RhQKkdz/qfDYhzOVA1segvc6iwxBi4PEHwbLkfY26MLi8gZUeeTxGJDDUE04xJPDDzTghQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7852
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



On 2025-06-28 8:50 a.m., Michal Wajdeczko wrote:
> 
> 
> On 23.04.2025 23:58, Zhanjun Dong wrote:
>> Add GuC LFD (Log Format Descriptors) related ABI definitions.
>>
>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>> ---
>>   drivers/gpu/drm/xe/abi/guc_log_lfd_abi.h | 279 +++++++++++++++++++++++
>>   1 file changed, 279 insertions(+)
>>   create mode 100644 drivers/gpu/drm/xe/abi/guc_log_lfd_abi.h
>>
>> diff --git a/drivers/gpu/drm/xe/abi/guc_log_lfd_abi.h b/drivers/gpu/drm/xe/abi/guc_log_lfd_abi.h
>> new file mode 100644
>> index 000000000000..d7eb207f1560
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/abi/guc_log_lfd_abi.h
>> @@ -0,0 +1,279 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2025 Intel Corporation
>> + */
>> +
>> +#ifndef _ABI_GUC_LOG_LFD_ABI_H_
>> +#define _ABI_GUC_LOG_LFD_ABI_H_
since LFD is (Log Format Descriptors), this could be changed to
_ABI_GUC_LFD_ABI_H_
file name should be changed as well

>> +
>> +#include <linux/types.h>
>> +
>> +#include "abi/guc_log_lic_abi.h"
>> +
>> +/* Magic keys define */
>> +#define LFD_DRIVER_KEY_STREAMING		0x8086AAAA474C5346
>> +#define LFD_LOG_BUFFER_MARKER_2			0xDEADFEED
>> +#define LFD_CRASH_DUMP_BUFFER_MARKER_2		0x8086DEAD
>> +#define LFD_STATE_CAPTURE_BUFFER_MARKER_2	0xBEEFFEED
>> +#define LFD_LOG_BUFFER_MARKER_1V2		0xCABBA9E6
>> +#define LFD_STATE_CAPTURE_BUFFER_MARKER_1V2	0xCABBA9F7
> 
> no GUC prefix (or GUC_LOG prefix as in GUC_LOG_LIC)
sure, will do
s/LFD_/GUC_LFD_
for aboved defines

> 
>> +#define GUC_LOGFILE_LFD_HEADER_MAGIC		0x8086
> 
> inconsistent prefix
will change to:
GUC_LFD_HEADER_MAGIC		>
>> +
>> +/* The current major version of GuC-Log-File format. */
>> +#define GUC_LOG_FILE_FORMAT_VERSION_MAJOR	0x0001
>> +/* The current minor version of GuC-Log-File format. */
>> +#define GUC_LOG_FILE_FORMAT_VERSION_MINOR	0x0000
> 
> shouldn't those names refer somehow to LFD ?
GUC_LOG_FILE_FORMAT_VERSION_xxx	=> GUC_LFD_FORMAT_VERSION_xxx>
> better defined as 1u and 0u to avoid errors on 32bit arch
> 
>> +
>> +/** enum guc_lfd_type - Log format descriptor type */
>> +enum guc_lfd_type {
> 
> decide whether GuC log definitions will include "log" tag or not:
> 
> 	guc_loc_lic
> 	guc_log_lfd
> vs
> 	guc_lic
> 	guc_lfd
This looks better>
> 
>> +	/**
>> +	 * @GUC_LFD_TYPE_FW_REQUIRED_RANGE_START: Start of range for
>> +	 * required LFDs from GuC
>> +	 */
>> +	GUC_LFD_TYPE_FW_REQUIRED_RANGE_START = 0x1,
>> +	/**
>> +	 * @GUC_LFD_TYPE_FW_VERSION: GuC Firmware Version structure. LFDs
>> +	 * payload is guc_lfd_data_fw_version
>> +	 */
>> +	GUC_LFD_TYPE_FW_VERSION = GUC_LOG_LIC_TYPE_GUC_SW_VERSION,
>> +	/**
>> +	 * @GUC_LFD_TYPE_GUC_DEVICE_ID: GuC microcontroller device ID.
>> +	 * LFDs payload is guc_lfd_data_guc_devid
>> +	 */
>> +	GUC_LFD_TYPE_GUC_DEVICE_ID = GUC_LOG_LIC_TYPE_GUC_DEVICE_ID,
>> +	/**
>> +	 * @GUC_LFD_TYPE_TSC_FREQUENCY: Frequency of GuC timestamps. LFDs
>> +	 * payload is guc_lfd_data_tsc_freq
>> +	 */
>> +	GUC_LFD_TYPE_TSC_FREQUENCY = GUC_LOG_LIC_TYPE_TSC_FREQUENCY,
>> +	/**
>> +	 * @GUC_LFD_TYPE_GMD_ID: HW GMD ID. LFDs payload is
>> +	 * guc_lfd_data_gmdid
>> +	 */
>> +	GUC_LFD_TYPE_GMD_ID = GUC_LOG_LIC_TYPE_GMD_ID,
>> +	/**
>> +	 * @GUC_LFD_TYPE_BUILD_PLATFORM_ID: GuC build platform ID. LFDs
>> +	 * payload is guc_lfd_data_build_platformid
>> +	 */
>> +	GUC_LFD_TYPE_BUILD_PLATFORM_ID = GUC_LOG_LIC_TYPE_BUILD_PLATFORM_ID,
>> +	/** @GUC_LFD_TYPE_FW_REQUIRED_RANGE_END: End of this range */
>> +	GUC_LFD_TYPE_FW_REQUIRED_RANGE_END = 0x1FFF,
>> +	/**
>> +	 * @GUC_LFD_TYPE_FW_OPTIONAL_RANGE_START: Start of range for
>> +	 * required LFDs from GuC
>> +	 */
>> +	GUC_LFD_TYPE_FW_OPTIONAL_RANGE_START = 0x2000,
>> +	/**
>> +	 * @GUC_LFD_TYPE_LOG_EVENTS_BUFFER: Log-event-entries buffer. LFDs
>> +	 * payload is guc_lfd_data_log_events_buf
>> +	 */
>> +	GUC_LFD_TYPE_LOG_EVENTS_BUFFER = 0x2000,
>> +	/**
>> +	 * @GUC_LFD_TYPE_FW_CRASH_DUMP: GuC generated crash-dump blob.
>> +	 * LFDs payload is guc_lfd_data_fw_crashdump
>> +	 */
>> +	GUC_LFD_TYPE_FW_CRASH_DUMP = 0x2001,
>> +	/** @GUC_LFD_TYPE_FW_OPTIONAL_RANGE_END: End of this range */
>> +	GUC_LFD_TYPE_FW_OPTIONAL_RANGE_END = 0x3FFF,
>> +	/**
>> +	 * @GUC_LFD_TYPE_KMD_REQUIRED_RANGE_START: Start of range for
>> +	 * required KMD LFDs
>> +	 */
>> +	GUC_LFD_TYPE_KMD_REQUIRED_RANGE_START = 0x4000,
>> +	/**
>> +	 * @GUC_LFD_TYPE_OS_ID: An identifier for the OS. LFDs payload is
>> +	 * guc_lfd_data_os_id
>> +	 */
>> +	GUC_LFD_TYPE_OS_ID = 0x4000,
>> +	/** @GUC_LFD_TYPE_KMD_REQUIRED_RANGE_END: End of this range */
>> +	GUC_LFD_TYPE_KMD_REQUIRED_RANGE_END = 0x5FFF,
>> +	/**
>> +	 * @GUC_LFD_TYPE_KMD_OPTIONAL_RANGE_START: Start of range for
>> +	 * optional KMD LFDs
>> +	 */
>> +	GUC_LFD_TYPE_KMD_OPTIONAL_RANGE_START = 0x6000,
>> +	/**
>> +	 * @GUC_LFD_TYPE_BINARY_SCHEMA_FORMAT: Binary representation of
>> +	 * GuC log-events schema. LFDs TLV payload is
>> +	 * guc_lfd_data_binary_schema
>> +	 */
>> +	GUC_LFD_TYPE_BINARY_SCHEMA_FORMAT = 0x6000,
>> +	/**
>> +	 * @GUC_LFD_TYPE_HOST_COMMENT: ASCII string containing comments
>> +	 * from the host/KMD. LFDs TLV payload is
>> +	 * guc_lfd_data_host_comment
>> +	 */
>> +	GUC_LFD_TYPE_HOST_COMMENT = 0x6001,
>> +	/** @GUC_LFD_TYPE_KMD_OPTIONAL_RANGE_END: End of this range */
>> +	GUC_LFD_TYPE_KMD_OPTIONAL_RANGE_END = 0x7FFF,
>> +	/** @GUC_LFD_TYPE_RESERVED_RANGE_START: Start of reserved range */
>> +	GUC_LFD_TYPE_RESERVED_RANGE_START = 0x8000,
>> +	/** @GUC_LFD_TYPE_RESERVED_RANGE_END: End of this range */
>> +	GUC_LFD_TYPE_RESERVED_RANGE_END = 0xFFFF,
>> +};
>> +
>> +/** enum guc_lfd_os_type - OS Type LFD-ID */
>> +enum guc_lfd_os_type {
>> +	/** @GUC_LFD_OS_TYPE_OSID_WIN: Windows OS */
>> +	GUC_LFD_OS_TYPE_OSID_WIN = 0x1,
>> +	/** @GUC_LFD_OS_TYPE_OSID_LIN: Linux OS */
>> +	GUC_LFD_OS_TYPE_OSID_LIN = 0x2,
>> +	/** @GUC_LFD_OS_TYPE_OSID_VMW: VMWare OS */
>> +	GUC_LFD_OS_TYPE_OSID_VMW = 0x3,
>> +	/** @GUC_LFD_OS_TYPE_OSID_OTHER: Other */
>> +	GUC_LFD_OS_TYPE_OSID_OTHER = 0x4,
>> +};
>> +
>> +/**
>> + * struct guc_logfile_lfd_data - Log format descriptor (LFD).
>> + * A type of KLV with custom field-sizes + magic numbers.
>> + */
>> +struct guc_logfile_lfd_data {
> 
> guc_log_lfd_header ?
guc_logfile_lfd_data is outdated, spec changed, it should be guc_logfile_lfd

again, logfile_lfd should be 'lfd'
so maybe

guc_lfd_header

looks better?

> 
>> +	/** @dw0: A 32 bits dword, contains multiple bit fields */
>> +	u32 dw0;
>> +	/* Expected value: 0x8086. Helpful in detecting file errors. */
>> +#define GUC_LOGFILE_LFD_MAGIC			GENMASK(15, 0)
>> +	/*
>> +	 * File descriptor type (the 'T' in TLV) is used to identify how
>> +	 * to interpret `data` below. For the range of types, see
>> +	 * guc_lfd_type
>> +	 */
>> +#define GUC_LOGFILE_LFD_DESC_TYPE		GENMASK(31, 16)
>> +	/** @desc_dw_size: Number of dwords the `data` field contains. */
>> +	u32 desc_dw_size;
> 
> just 'dw_size' like in LIC, or maybe just 'size' ?
I like dw_size, easy to read>
>> +	/** @data: Data defined by File descriptor type. */
>> +	u32 data[] __counted_by(desc_dw_size);
>> +} __packed;
>> +
>> +/**
>> + * struct guc_logfile_fmt_ver - GuC Log File Format Version.
>> + * Major-Minor is not a fractional number (i.e. Ver 1.3 would be older
>> + * than 1.12)
>> + */
>> +struct guc_logfile_fmt_ver {
> 
> guc_log_lfd_version
to be changed to guc_lfd_version>
>> +	/** @dw0: A 32 bits dword, contains multiple bit fields */
>> +	u32 dw0;
>> +	/*
>> +	 * Guc-Log-File Format minor version. Must be
>> +	 * GUC_LOG_FILE_FORMAT_VERSION_MINOR
>> +	 */
>> +#define GUC_LOGFILE_FMT_VER_MINOR_VERSION	GENMASK(15, 0)
>> +	/*
>> +	 * Guc-Log-File Format major version. Must be
>> +	 * GUC_LOG_FILE_FORMAT_VERSION_MAJOR
>> +	 */
>> +#define GUC_LOGFILE_FMT_VER_MAJOR_VERSION	GENMASK(31, 16)
>> +} __packed;
>> +
>> +/**
>> + * struct guc_lfd_data_guc_devid - GuC Device ID.
>> + * This is mandatory fw LFD data
>> + */
>> +struct guc_lfd_data_guc_devid {
>> +	/**
>> +	 * @guc_devid: GuC microcontroller device ID defined as described
>> +	 * in GUC_LOG_LIC_TYPE_GUC_DEVICE_ID
>> +	 */
>> +	u32 guc_devid;
>> +} __packed;
>> +
>> +/**
>> + * struct guc_lfd_data_tsc_freq - GuC TSC Fequency.
>> + * This is mandatory fw LFD data
>> + */
>> +struct guc_lfd_data_tsc_freq {
>> +	/**
>> +	 * @tsc_freq: GuC timestamp counter frequency as described in
>> +	 * GUC_LOG_LIC_TYPE_TSC_FREQUENCY
>> +	 */
>> +	u32 tsc_freq;
>> +} __packed;
>> +
>> +/** struct guc_lfd_data_gmdid - GMD ID. */
>> +struct guc_lfd_data_gmdid {
>> +	/** @gmd_id: GMD ID as described in GUC_LOG_LIC_TYPE_GMD_ID */
>> +	u32 gmd_id;
>> +} __packed;
>> +
>> +/** struct guc_lfd_data_build_platformid - GuC build platform ID. */
>> +struct guc_lfd_data_build_platformid {
>> +	/**
>> +	 * @platform_build_id: GuC build platform ID as described in
>> +	 * GUC_LOG_LIC_TYPE_BUILD_PLATFORM_ID
>> +	 */
>> +	u32 platform_build_id;
>> +} __packed;
>> +
>> +/**
>> + * struct guc_lfd_data_log_events_buf - GuC Log Events Buffer.
>> + * This is optional fw LFD data
>> + */
>> +struct guc_lfd_data_log_events_buf {
>> +	/**
>> +	 * @log_events_format_version: version of GuC log format of buffer
>> +	 */
>> +	u32 log_events_format_version;
>> +	/**
>> +	 * @log_format_buf: If `log_format_version` == 1, array of
>> +	 * guc_log_format_version_1. If `log_format_version` == 2, array
>> +	 * of guc_log_format_version_2. Dword size determined by
>> +	 * guc_logfile_lfd.`desc_dw_size` - 1
>> +	 */
>> +	u32 log_format_buf[];
>> +} __packed;
>> +
>> +/**
>> + * struct guc_lfd_data_os_id - OS Version Information.
>> + * This is mandatory host LFD data
>> + */
>> +struct guc_lfd_data_os_id {
> 
> guc_lfd_data_os_info
sure>
>> +	/**
>> +	 * @os_id: enum values to identify the OS brand (1=Windows,
>> +	 * 2=Linux, etc..). See guc_lfd_os_type for the range of types
>> +	 */
>> +	u32 os_id;
>> +	/**
>> +	 * @build_version: ASCII string containing OS build version
>> +	 * information based on os_id. String is padded with null
>> +	 * characters to ensure its DWORD aligned. Dword size determined
>> +	 * by guc_logfile_lfd.`desc_dw_size` - 1
>> +	 */
>> +	char build_version[];
>> +} __packed;
>> +
>> +/**
>> + * struct guc_lfd_data_fw_version - GuC FW Version.
>> + * This is mandatory fw LFD data
>> + */
>> +struct guc_lfd_data_fw_version {
>> +	/**
>> +	 * @guc_sw_version: The full version of the GuC microkernel that
>> +	 * generated the logs as described in
>> +	 * GUC_LOG_LIC_TYPE_GUC_SW_VERSION.
>> +	 */
>> +	struct guc_sw_version guc_sw_version;
>> +} __packed;
>> +
>> +/**
>> + * struct guc_logfile_header - Header of GuC Log Streaming-LFD-File Format.
>> + * This structure encapsulates the layout of the guc-log-file format
>> + */
>> +struct guc_logfile_header {
> 
> guc_log_lfd_buffer (like in LIC)
LFD to be saved as a file, so buffer is not a good match here, maybe:
guc_lfd_file_header>
>> +	/**
>> +	 * @magic: A magic number set by producer of a GuC log file to
>> +	 * identify that file is a valid guc-log-file containing a stream
>> +	 * of LFDs: Expected value: 0x8086AAAA474C5346.
>> +	 */
>> +	u64 magic;
>> +	/**
>> +	 * @version: Version of this file format layout as per
>> +	 * guc_logfile_fmt_ver
>> +	 */
>> +	struct guc_logfile_fmt_ver version;
>> +	/**
>> +	 * @lfd_stream: A stream of one or more guc_logfile_lfd LFD data
>> +	 */
>> +	struct guc_logfile_lfd_data lfd_stream;
> 
> just 'data' and [] to show it is open-ended?
> 
>> +} __packed;
>> +
>> +#endif
> 


