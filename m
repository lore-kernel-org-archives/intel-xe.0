Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C708C7115B
	for <intel-xe@archiver.kernel.org>; Mon, 23 Jun 2025 16:13:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC6FF10E3E8;
	Mon, 23 Jun 2025 16:13:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Px6mIST5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9185F10E3E8
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Jun 2025 16:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750695231; x=1782231231;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=b7sSbqPrys7m0emQzp1AfjOgLbFZY/57Slza9VNlbR0=;
 b=Px6mIST5OI1Dpxdj0jIiur0Q3MeLxFLO5dw4tkUMgf9318b7X88MsDMY
 lit9Mxuz0793s5VXho6Zc0V8hdRx2xpkwtl9ThEu0R2/dWdIRPx4DUW3I
 Lux59mcwjY5GMjnPtni4toMmKVNPJuCEYZMWoDS3Y0HTv0GhctwUvZWfx
 dI8uv4vE/t9eKJXwGl+80ufoytBnn9VyypAdu1jLAF2cNtLof4qM8xZVk
 DhrcCgM5EtTUlBzJH6FZeGqN9U4ARtxc57/XqSrme5VM66YYbe6YpSAuJ
 TelUD/3gofWbG7XlrbsbZ9aKwUk/0qRgAWYQlNTiSzjfT0BeOJLPYD76g A==;
X-CSE-ConnectionGUID: qzyyuQCXT5ey97mg9DoW3Q==
X-CSE-MsgGUID: lAja1D5fRAGwmH+/ijFs5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="55546364"
X-IronPort-AV: E=Sophos;i="6.16,259,1744095600"; d="scan'208";a="55546364"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 09:13:50 -0700
X-CSE-ConnectionGUID: lXdc/HfyRdOyhY1WGiNiDA==
X-CSE-MsgGUID: PK/2hNqjTqmzS+f/BCL9hQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,259,1744095600"; d="scan'208";a="157134045"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 09:13:50 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 09:13:49 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 23 Jun 2025 09:13:49 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.49)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 09:13:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nleOY+JzTU9aHUAJCOVbQ7HsXFtaB2iO9qEYFkMph2k8hnxx9gmpQdxtTdxSKLPi2xiRXdK0tVtJ9N5zFR3oKSSP7bzwVXq9ypkpVALm5ifKxqUsAx1zmXJLTyzeSBHLulaxhBydtkzEjlIpTbyOCiIBPl/HUQhKw9q9RnxWIjV3SFfC/VydGxpqMlqRkXhaR47ZzqIYZEVGC744gYlGVLYcqiFNCtI1BVqjNMvTMPxs3oAryzmfOcbngdkbFpV/eZJKQv6G9nnjstOoesq8uD0mLsOvdVC65mlkfLOqVr/61s/AhFW7n5ix0lSqCVbjWaWvOuR7kwqSNXWWeAm85g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jAysm/Iy+Lp35jQcXVNE2Szx5Uo9M+hiuLWndlFlPbM=;
 b=FNYHpeRO81y2W7NWQdkpYHeap9n2QbPVNGCb6NcG+xaDqHpHAjECbHiKrTPcxXKbUDznOHqmfbHf6Uh89NlExiXsvpAzB/zbi8A5/BNTwMk5k6ze5M6WhYWBiN58NKWi7N3n10Y7JhUPxkyptE7e4Rqx4IAZkH7ezHOvwqz0vLDucmKmkmWwUeycPljhRsIMRQJx34ZT951jGNyWvIIgrwTjYuG8XpSrNI/HQbZhC6vMZKUCt6qBMZXGP7isDEFvukcC1JNgC0VAAP3pYkv8FgHaNTROESFgongoE+8ACLTxeWxMQqCL4PFI6HxGyrT8EGQdmZdYamQVuRjQ09mrzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ5PPF89507EDE4.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::83e) by BL1PR11MB6004.namprd11.prod.outlook.com
 (2603:10b6:208:390::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Mon, 23 Jun
 2025 16:13:47 +0000
Received: from SJ5PPF89507EDE4.namprd11.prod.outlook.com
 ([fe80::7ac3:745d:bc52:83e8]) by SJ5PPF89507EDE4.namprd11.prod.outlook.com
 ([fe80::7ac3:745d:bc52:83e8%4]) with mapi id 15.20.8835.023; Mon, 23 Jun 2025
 16:13:47 +0000
Date: Mon, 23 Jun 2025 09:13:44 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkJBVA==?= =?utf-8?Q?=3A?= failure for
 drm/xe: Create and use SoC WA infrastructure
Message-ID: <aFl9OEjch58FvALc@msatwood-mobl>
References: <20250620214920.718179-1-matthew.s.atwood@intel.com>
 <175046031065.98943.9333446488996990324@1538d3639d33>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <175046031065.98943.9333446488996990324@1538d3639d33>
X-ClientProxiedBy: BY3PR04CA0026.namprd04.prod.outlook.com
 (2603:10b6:a03:217::31) To SJ5PPF89507EDE4.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::83e)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF89507EDE4:EE_|BL1PR11MB6004:EE_
X-MS-Office365-Filtering-Correlation-Id: 77381297-517d-4efa-df3c-08ddb270eed4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NlpaUjFpMmRYWDlrZ0NXRmdEdnNicXFvaEpNRUNxUVBsRm1EdHhTNWNxMDZl?=
 =?utf-8?B?QU9XUHcwMUpCS29NSGR2WkNIa1ppa1F6WDZSdEJ6aUdEU2t2bkFuS09KSVdy?=
 =?utf-8?B?UjlmNDYrQzdVdnhBODhza0JQNVN1ZXpMbUlYZHNsV2RYQlA1Q3gxUzBYL1Rp?=
 =?utf-8?B?RlhQUmlMdVAwWk80VTNYYW5PMmpkMmYxZm16RE93bCtjMTM1QlZjZThVekps?=
 =?utf-8?B?TURmM1hJczBlMXZKcWNvdjBDNk8vaGZzcUNnNzZFc3U5VWIrNHdDMGpicmN2?=
 =?utf-8?B?N3BVOVgxbEVxOTFUTWFmU0ZNRXpBRksycW1nOERHRzNOdGM4UmtFZE9wZW5k?=
 =?utf-8?B?VDYwZUNyRUJIMzRoUTZUeFgwdk9jMkRMamgzN1VZVGJtUzZiUG5sSUluRmpZ?=
 =?utf-8?B?aUFQL1h0eVE4NHJ2d2hrRzFQS0FtbkR3QVNudlQ5NDZkWnJqa1p3TzcyU2hQ?=
 =?utf-8?B?b0x6N0l5a0hES1IzWU54eldXWVN1bjlsL05IQlJESnp0NkRDOWxLREdYbm91?=
 =?utf-8?B?U2tvOEtjS043bitHVHVjSDR6bFh1RXEzV0JicW9FeDNmMDBhQ08vZm1MTEY2?=
 =?utf-8?B?dHVXVzJXY3BRNVF6dkZpNC9xbHIzdWM4eXJjM25BczZDVjlDV2dyMkJkVk5n?=
 =?utf-8?B?Rk1LUW94ZVo1NUdWZGgxSjRPd1RtbXFxWW9LQTZzRkpjbEQyUHBaRjE2ZGR3?=
 =?utf-8?B?YXc2RjN5bG5CVTI1ckhHSk4wSDhDM1QvR0VvV2dHazdvTUNrS2ZoWU0yS3po?=
 =?utf-8?B?Y0Z4ZC9aYzRNM2c3c3FQSFViWG1LR1MxbkVUbHZtUDdQc1hSTk8xQnRnb0o5?=
 =?utf-8?B?dEFHdnk3eXpWa0NDMkNmY3hUL0xpKzI1ZE90T1NHZjBNbmoyZ3JoSkhiU05v?=
 =?utf-8?B?M0Vsd0xuQXBuYldLYmcva2ZDbDRMdUdQZC94NitFYTh3VTZqOHJ5TUZ5TEF2?=
 =?utf-8?B?QUVFeDNjRUFOVkJ0TVpQYVF1bTdyWlVaeUJBczBEVFRENktTU20zaGNPZkVl?=
 =?utf-8?B?MnNwUHdMdFFHS2hSWW15c2FWSTFWeGIwUnc4WnNndlZCY2Z1cko2RFVtZWVa?=
 =?utf-8?B?ckdIYWpnS0lTN2lUVGlsYVZzUGFKNHdqeFg5aG53S003TVFtVWdqNFRJc29o?=
 =?utf-8?B?NVpuUzVBNlQ0OFNxZXNFWDkrb1RvdWRTT09lc1kwc3dvMHN4WlpRbWFMZHI5?=
 =?utf-8?B?OXpOY0VuUGQ1eVRHamlCR0IxWFRPa045eDZNaExHVkIwa09ENFVLdS95dWpl?=
 =?utf-8?B?UitHcDRiMVJ2ZE5vYlZnQks5T240SmdxMUNpS1ZtbUFDUUoxc0RTaEVMSmgw?=
 =?utf-8?B?QkV3WUhnYkpuZmVaOWJMSDlKdStpVGhidHhqVzV2OUNBVHV1cC9GTUZZdUIr?=
 =?utf-8?B?QzlMZ05lYkVJMWJHS2FKeWdPUVU4UlRWT0R5MEc3WTVNWExYalBpQ3Y3dGt5?=
 =?utf-8?B?Q1AyekI3MXAvS2ozbXBOS0dGczJmS0hydjdPZFNpK0RIT3lVeGppNzQ4Z3E3?=
 =?utf-8?B?eXVQY3JtdXQ3SWNwS2FBZVd2Yjd4eXljUVRxZGVpaGl4K2tuY0ZMNkpNdmlv?=
 =?utf-8?B?eHhHdjlyNWczV3FGRDhEaWNpSS9mQWg3Y0xlYjZySC9QOWlwcGdTd1RPZEV3?=
 =?utf-8?B?b25QcGxEcW9Ya2FWa2JTT3dVUE1wZHk4ejg1a1JUdzd4VzVKMTN4NFRpbUlL?=
 =?utf-8?B?dnFMWVpocUFQQWpaUVFsVW5zbXYwMUYrZVNOMzEvTmpoZmY5aU40dG1NZEUw?=
 =?utf-8?B?LzJBMTc4bkh2MDhuSDgvd2hNWHg2ZUJXdkNwNW44OG5JQllHQ2U5MW5wOHhE?=
 =?utf-8?Q?SrL31e8Glwn5qZMy/IiE1Q3YZwvfQFpPfcpvs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ5PPF89507EDE4.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MnM3aU51VUE0cTRjais4UGNSZHJJT0lDU2Z0TlN2dGlGdThBSE9tdGV0YWE0?=
 =?utf-8?B?UDNHbWZ2RnozdEE1aHo2TUZGV1A0V2JyUWlqdmN4THZ6SWlUZmYza21yQm1i?=
 =?utf-8?B?dWwrZForZW5GNmtlbkJ3enBkUkxFeUdBY0EwakVkOFZXSEtSUzhZVGZzcVFj?=
 =?utf-8?B?dW1vMXRBL2ZMc0xsS1YxVmJyck5HTTBxaHZIWXNWT3hsRHV2WE1kZkhYcEFC?=
 =?utf-8?B?VUNUWEFLdVF3anZqQ21PTDRzV0dxbHdBVFBQNzhjOGVoOVJ6YXNDdzY3NUVk?=
 =?utf-8?B?Q1UwM1ozd00yQmhtN3FDbXd5dUpSUTJVK0FMWVVnMDdQcG10S0kva1hFQ3pT?=
 =?utf-8?B?dWlpcGVseHJHMmVoYmxNT3M4ZVYzMlRpMy8wZ2hiS0hmd0htM1JUQkFacFU4?=
 =?utf-8?B?Y0UyZFVWMSs3LzlFczgzam1DR1FjNmtDK24wNDFIMVhlTUh0ZVpPMS9QRkZ3?=
 =?utf-8?B?VTJUU0pERm5wb3BLejBIbHQxbmVsU2VEL3NvNzkrbVNVOSs1NXhGQ1c5cXg2?=
 =?utf-8?B?dHp3SUVCQlhQN0hYcTkycVV3djZPa1Y3RDZYZmhwcHc1N3JLMWxhcnpIOHRO?=
 =?utf-8?B?eWp4RWdiNDBUcWsvUVhnU1FlMGlhUmtTL2M2M0VZU0lpU242M0J4UU1RZXV2?=
 =?utf-8?B?YzZFQUFGY2VVRlFaempUeVpZZVIzdEQzQjF3ZU5ISmJZYkVEVE0rblcwTHAz?=
 =?utf-8?B?YURyZjJlbUFrWjZsb3A1bXpYaTdjbWxrMkE5dFZCbkxOcFRNeWszaUNmRVFl?=
 =?utf-8?B?bElubW1PMVY4MTJqUUNaS3R0Uk5ER1N2OVJad240L3NHSTFqbWdZYVVuUmsv?=
 =?utf-8?B?VkhSOFhQazk0N3lnQmNUU29LU3JTSVB6MkJTNVYrYzgwYjB3YkVuNUM2bWhN?=
 =?utf-8?B?WVdObW42UmRHRk1Sd21PV01maVZEbGVMRmVyV1lESlNHRFNBcUZFSFdhaEwy?=
 =?utf-8?B?UUJvS3RzeVp1d1RxdVpQNVlNQ3RwQk9abzJSOGZJa0xzTDBMb1RseExNZnVk?=
 =?utf-8?B?VUFxWUlnek5IcUpQeGZMVTJJNCtUOTZVUGJuTkF5OWZBa040SldLdHpKdDU5?=
 =?utf-8?B?TWFlT0dKaHlaNlB6Y1E4bnJRc0lQRlV0WVVSb1JUSitBOXowcUhuOG5yWjh1?=
 =?utf-8?B?NFpGMmwvSVJDRFdHV3JpZm9uSkVrUmI2R0RvclZXbzN3QndybytsUk5vOURN?=
 =?utf-8?B?MzdVNkFOMEJJRlIwdkhvWHV2S3UzSzAwcGFQQzZ0TEYxUENSN2FwdWRvbUpV?=
 =?utf-8?B?WWRvREwxQ3VBWCtBRDB1T2Q5ODYxNEVSMi9QUHBaWTYxaVRyNTYzd3E0elFp?=
 =?utf-8?B?dEozV1AwUVNGVS9Ya29FL2pZYU5DTFlSY2dPTVRtZ2d5a0tqTjVIU2xsVHhy?=
 =?utf-8?B?c3FHbVdUSmJWdDlORTlNRDl2SWd6NEx5UzZFSndjNjhQeFhMdlU0LzI3NEtl?=
 =?utf-8?B?aW9Dc1M1U21nOWozUXFseHQ1dHBHQU5aV2twbDVxK3dRM2E0TDBIeGt5UEhT?=
 =?utf-8?B?Tk5DMDREbW5USE1UUTZtQ2NIYUJYUXZEbHV3d3QrQ1ZMeTY3MnBQd1k0ek1l?=
 =?utf-8?B?SDVlTC85M1dmK2JMSkVsOGN6VmU2V3JVZ3crcnpmSWgvblRrdGpnaHV3Qk9w?=
 =?utf-8?B?TWxHWTUweVoyZ1V5ODVvLysxQ3BTYzFKSC85Ulk5aWFJZWpFeUxMUVhlR2tK?=
 =?utf-8?B?NlVobFJmcVFNTGhGT0owR3JkTG5iZlIzeEJIMERUYndad1B5ai9jNmU3akR1?=
 =?utf-8?B?cUpnemRJR2tJSG9BQ0R0ZllXWUJCKzdyNWh6SGVzdkVjblNSNGJQTHBiL2RM?=
 =?utf-8?B?N2RhZFYzcFhCOTRvT3F0dUxyQXpyVCtZS2Nib1BUUWNjblZxVlJNclJnVVpr?=
 =?utf-8?B?TkVsMGVFVlZaSnFjdXUzYkQ4ZTZlTmNjYzl5aVZRNHhmNHZsK1M5dDU1b21u?=
 =?utf-8?B?ck8wYXZFRlRMTTlWRVpSajBGUC9VWVVzcmZyZ0tJMU5SQW5TbCtUd0ZUN3Rx?=
 =?utf-8?B?c0J4ZVNObzRKWVpZK0swc0wzYTl5TFIvS1RELzVUR2oyeWt3ZjMvM24weThk?=
 =?utf-8?B?R2pCVGJHUXFTNVZ6YkVDMVVlSDF5U1krZUZvY0ROLzQwYkYvU0xjZ1JTZHZh?=
 =?utf-8?B?SEN3bFNybkdWd2Y1TkdWRFRvTE9VNDNmR3pxY3NHSEJGZHQya1Q3R2owMmpu?=
 =?utf-8?B?UWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 77381297-517d-4efa-df3c-08ddb270eed4
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF89507EDE4.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 16:13:47.1761 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VV/rS6Z+qW9Bto47pirpUMXzzEPQ6n/ZbWWwrsZKlzC3rBJ8NnPvV8Llv2XWm4NN4vFgG3jc6Q7sN+mjIzUtBp00LdqWED2o2o5Ge6tV+GU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6004
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

On Fri, Jun 20, 2025 at 10:58:30PM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe: Create and use SoC WA infrastructure
> URL   : https://patchwork.freedesktop.org/series/150584/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-3284-3dde2e2646b2619f765de9c226bfe0dda7bf1f17_BAT -> xe-pw-150584v1_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-150584v1_BAT absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-150584v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (9 -> 8)
> ------------------------------
> 
>   Missing    (1): bat-adlp-vm 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-150584v1_BAT:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_module_load@load:
>     - bat-dg2-oem2:       [PASS][1] -> [ABORT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3284-3dde2e2646b2619f765de9c226bfe0dda7bf1f17/bat-dg2-oem2/igt@xe_module_load@load.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150584v1/bat-dg2-oem2/igt@xe_module_load@load.html
>     - bat-atsm-2:         [PASS][3] -> [ABORT][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3284-3dde2e2646b2619f765de9c226bfe0dda7bf1f17/bat-atsm-2/igt@xe_module_load@load.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150584v1/bat-atsm-2/igt@xe_module_load@load.html
>     - bat-pvc-2:          [PASS][5] -> [ABORT][6]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3284-3dde2e2646b2619f765de9c226bfe0dda7bf1f17/bat-pvc-2/igt@xe_module_load@load.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150584v1/bat-pvc-2/igt@xe_module_load@load.html
>     - bat-adlp-7:         [PASS][7] -> [ABORT][8]
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3284-3dde2e2646b2619f765de9c226bfe0dda7bf1f17/bat-adlp-7/igt@xe_module_load@load.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150584v1/bat-adlp-7/igt@xe_module_load@load.html
These are caused by my assumption that tile0 would alwyas have a
media_gt, our call to XE_SOC() needs to have a check into xe_device
to ensure that there is a media gt.
> 
>   
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-3284-3dde2e2646b2619f765de9c226bfe0dda7bf1f17 -> xe-pw-150584v1
> 
>   IGT_8419: 8419
>   xe-3284-3dde2e2646b2619f765de9c226bfe0dda7bf1f17: 3dde2e2646b2619f765de9c226bfe0dda7bf1f17
>   xe-pw-150584v1: 150584v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150584v1/index.html
