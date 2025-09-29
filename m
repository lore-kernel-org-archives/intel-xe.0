Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0930CCAC5B0
	for <intel-xe@archiver.kernel.org>; Mon, 29 Sep 2025 21:56:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B30BB10E3D1;
	Mon, 29 Sep 2025 21:56:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T/WhAY2D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D84E110E3D1
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Sep 2025 21:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759183002; x=1790719002;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=uYxKOigeujQgr431hKvi8vNabKqsBxWN2wcLPF9Xghs=;
 b=T/WhAY2DMtIVkwtTtJd18JzI087MRlJGDX9SHf/rfW+QK05gXPx7bCMs
 Whe5eDyfJWP/UvnWq8mpeVjKwyQw0IurveNOlloqMeKwycV3GVC9PEHod
 XLQ6AmZMkKG4ZiNglsHqhm+oVmFtY9vsAtOo4m9/Pzr0Y+AHXjNAEiU0n
 IRQY03VHlPAzCwGR0CT+Sn3JcNq2ZaPxUBoS20cIdzDZV14OTSsVECCte
 uACEubRhwMu72J09fm0yxaVTTaG9dJ+I86yKNfqC1cBxPNqFjnr7S1lzy
 iTDUdYyJyC/+TXgi4R+zU3o30o1u7gNok1tSBwToXvBjF4R+Jl3g6+aQX w==;
X-CSE-ConnectionGUID: V7ul2NQLRvaBkDxRkyVlsg==
X-CSE-MsgGUID: v6GrSyZbS1+eLfijQo0cfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="61349555"
X-IronPort-AV: E=Sophos;i="6.18,302,1751266800"; d="scan'208";a="61349555"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 14:56:40 -0700
X-CSE-ConnectionGUID: td7bwIO6R76g0svhs+fK9g==
X-CSE-MsgGUID: r5Qgk7KzQhGaonkIKktyVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,302,1751266800"; d="scan'208";a="215502516"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 14:56:40 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 14:56:39 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 29 Sep 2025 14:56:39 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.33) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 14:56:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=htcX8Zu3AHLKjhrjY2LYkEZJYs6/O8ZmazYDvEuHoOPl+StqVpWAvYTr+4nBwppSs+nVUn2rAwjDv1EfnTletdUolCrJwUn4OcUiJSac5A6TRM/UiEFeHL5UoBEOz9fJn06nRsI7bcpiGcrnP7IkhJ02XJShoEZwTSneOulqDk1KTat/zrlmRKKNG1hcQSKLPLTVLBDN+jFr/y0oWVOHTyhb8UXGCVdAEkR404JMgQiko3gIL3LI897R/BJspRFp1Qb4CujRJBGe2B9/tpKPg2dGrq87+7EsaB01OMBkzH24BJlW/2mqBrDBfQCPmMe5c/sTG4qw9U59Z+5Gb5c+nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fhrptjgvghBTYJEufG8LznEeER4jLGiUpzGuaJHNq7g=;
 b=C5K7ZqDwmtE67aqLs5sKCu79iYi0riqGXi5UCJmGCcIAhF1WECrH/2QGRbFHOKJAwdkljQTWWeE+uRq0NNs/fQ9KfQILYYCAUPxVJ+zOriPtgjm+nYPhjAAheY4hW3YyKWPW+gOGA9FE0sPUk+CfAmRzF+WNxXG18Epf5Q+NlzcmLLbjzvxb8bks0yvlbEGIT/I1i1dHz68A2IVpUDdlR/UnUmmWPcuf4K9Eol4u2ME+mDwCdo1Xe8M1dRj8n1n0P6gkZAQk/FnBkAtFNfnn19rBqXXX0tg7EuXFCjDt39/3Gq544uV5h0Uz95DYuxl8Re4clcYenZjPtlZIcOphBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by IA4PR11MB9035.namprd11.prod.outlook.com (2603:10b6:208:55e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.14; Mon, 29 Sep
 2025 21:56:37 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 21:56:37 +0000
Message-ID: <4754ddfc-02d4-4cf5-9598-685467f29193@intel.com>
Date: Mon, 29 Sep 2025 23:56:34 +0200
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Refactor_PF?=
 =?UTF-8?Q?_debugfs?=
To: <intel-xe@lists.freedesktop.org>
References: <20250928140029.198847-1-michal.wajdeczko@intel.com>
 <175907515738.373897.13722613399322630480@1538d3639d33>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <175907515738.373897.13722613399322630480@1538d3639d33>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR06CA0129.eurprd06.prod.outlook.com
 (2603:10a6:803:a0::22) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|IA4PR11MB9035:EE_
X-MS-Office365-Filtering-Correlation-Id: 80e8073f-3b89-43aa-3b6a-08ddffa31000
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|376014|366016|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eE9xbFNxZGlVNW9qK3ZsV2VlMFkrUDJ0bVpscXZCMTVybWVKaGxzNUJZa0hG?=
 =?utf-8?B?SlpQUnJrQ2FHOXlidFpZQXp5SUdvekhKN2Z5QTVlMEp5RW14UjhXMzlhaTJF?=
 =?utf-8?B?UEVPZnpyaDE4aDZZSklHdXFGNUJUdlRaZk9hcUc5cWpGTTczMGFkVnZnVTJv?=
 =?utf-8?B?THRjbDNpMHN0aEJoSnVhK1FLbjJlZTN4Y2FhUno3MDJVZ0w1N1pJdHJoNVVH?=
 =?utf-8?B?ZzJnVnVaNWhDMzdmeDNHczMxckxyNlV1alpNem5tR1NNRHlrMWpaKy9QY2Ru?=
 =?utf-8?B?NzVucldndnVQVVdnb1RuNDNmcmsrZmIwcmYzTmdVMXk2dWNqbk81NzducE10?=
 =?utf-8?B?ejh4Mml5cUREMUVrVXNQdVloa2pOVHp6RFdMM0wyR3NQSDBxa3VhUy96Rk9U?=
 =?utf-8?B?RVRQN1JITXNaektvSktOcHhhNWxhbmRGV0NIZDZSalJjTExtV3JtN2hQUUhT?=
 =?utf-8?B?NU90dVFzMWR5UE5ncjdxSC9md2RkZmpjTVl1K0UvbHhzUkxmTFZseFFEanVu?=
 =?utf-8?B?Q2FraEdaY0VuL1MrbFdrRmlsUlRoS09tRnB5WGFaa0srUkxuMkpUSFozNmJa?=
 =?utf-8?B?eC9OR2g3ajlwQWQydXp0OGw4V3ZCaUpWb29XQTBkN3VtUW9QaktPRk8ydVVh?=
 =?utf-8?B?Q0Fic3Nzbm96WjRDWjlNZU90N0ZaMzJhTnlvVUFPenZwbGE5YTFxanJNcm5M?=
 =?utf-8?B?OVprNmsrRXRkcHdwTVNwOHQwbFR4WUtHci9xNlBVazhkOUdLaWErN3F4aW1Z?=
 =?utf-8?B?UEo1bllta3BSYXBoa0l5NDZCVlROR0N5cnJjTzlyeXZXa0dOSmZWSkl2TFhq?=
 =?utf-8?B?dFUvTWVqdUwxM1pzNWhGTFlHakVzNTZUV3NkV3E2OVR5dHZ0bVVVNXFYNmpV?=
 =?utf-8?B?QUxOeE5QSmludkRtMEhucCs4WVBJN1lOK3lBbk9RSGgxSG5xZXVtUURjdDNI?=
 =?utf-8?B?RURKRHhMdWl5RlRVRkRKRVhtZzNLRnNDUGRDaitSSFFiUzlucnRGZ2hzdnB2?=
 =?utf-8?B?WkFySUxnQUx5bUVvMHNNZDFRbzZsdlNLMFRnUUJEdGZFZmRwd0c4QkhITEUr?=
 =?utf-8?B?Z2R5MDJ3VDBKbnd3b2EzVDZFK1dJN3dEOWpTZFU3aUw0YTZ1RlJhQXhIVkxG?=
 =?utf-8?B?QmJOMkRLdmtXcnRnQURDOWZnTXNDa0hrZkFudVBmUldUTXNLSmI1VGszRmdK?=
 =?utf-8?B?RXZ6ZVBpekRPaTRGV0pZbTVMVHFvQW9WTzJ3Z0d5SHRBUUNVYkR1ZFZrNnd3?=
 =?utf-8?B?aVI3RU45dHYxL2FjMXFWamRESWpsbzUxbW5PUjVmUW5UblRQSGhZWnYzMmJ4?=
 =?utf-8?B?Sk4rRFg0TFVvNE9DV05pTnU5Y1VLYmxiQVZpK20wcHA5NlppRTFmMjljcXBY?=
 =?utf-8?B?NXU2Q3Z3dEVFL1N1UitkajNxc2tLV2VlNlNXc0M0VWoxaENYenhNMU5SRGVV?=
 =?utf-8?B?Q1ZxZTlGd01MMjQzR3o0TEJvL0NEbmo3VnlvYUlFcndVZEVZUFhnb0s4a1NK?=
 =?utf-8?B?YW5ZTjNuK2ZLOXNuUjdpaFFyV3hLUFFDTXkzQkRhMHJZNWdaNy8yQ2h6bGxw?=
 =?utf-8?B?aWpaRWVvQncxOVBmNklaZGQ3Q3gwTmNTYkdxUXJqZFp5TDQ1MnVtcDh2QllZ?=
 =?utf-8?B?WEtPekpnKzl0OGw1eW1NRWNFS3hHb3h6VkZzK1JaWWtRTGVqWENyLy9DSy8r?=
 =?utf-8?B?Y2ZUU1NuVk9xVFY0MHVtNTltZE95cnFSN2RzM0t1dlJFV2JhQmNMY3hKc0Rs?=
 =?utf-8?B?WFUwazYrUFE2R2VLaWNhZUh6eS9yVVNQbDRRcU1jYjIxK0I2NzdYdEtTZExD?=
 =?utf-8?B?SkhjUmZRdk1aWWVtV3NZMUk1TS9YNDFnNHhGSDhGY2RLTzlNczBNMC9FU2J6?=
 =?utf-8?B?YVVUUHo3Z0dGWXJTOTZjM1BjVzNFK1IrZ01ZRWJTTHF5Mmc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QmZnNGN3bDVSaWwwQnB1TStGN2pQKzdCYnNXWmpLcnJOTkNIUUllUmJJbDE4?=
 =?utf-8?B?bFI4VTAyMUtoQzRTWnFMRGVJYnBTa3hjbUVLUThCRUU4cGRzeDRhSXVyS0tm?=
 =?utf-8?B?UG5QNXNNc2pvdTZxSnU0MExHOTNaVU5VTmtDNEpnUnJOQTVuaU9uMzkzUlRT?=
 =?utf-8?B?bmN2VHVaOVArR2NzRGJpc056bWdZV0F3Y04zWnhDQXRMaFl2aUVpYmlqOXF0?=
 =?utf-8?B?N0w0eTdDNEhCb0RnZzViZk53bFJUa0FDTjgyakJZQmtKYzBCRm51RS9YeWli?=
 =?utf-8?B?TFl2dHpjcktHYlE4K3JWY2VhbDl4UkxEZGhBYlZjTnV2UEk1UC9KcG9nMG94?=
 =?utf-8?B?ai9JenZ0b2cwVXFmV3pLbEV0Y216NklmaGlSMU12dTN6a09hSXVpYnBGblVX?=
 =?utf-8?B?Vlh4ZlRYYzl5bmlFTHd0UEErY2k4b2liVzY5V2orbFQ2Mm5QWVpPLzFjSkNE?=
 =?utf-8?B?eEt6Tm83Wk1HdGRuUjY2UzJPUFk5djdxTjRhdk1meTlZcDNFWDZrendBK1FD?=
 =?utf-8?B?U1lPQ1FXQWNWME9YbXU5akIzaThzdkUvTWQxWFRNRllXTkJUQk01OEQvSDZs?=
 =?utf-8?B?NE5YZytOcGl6WjZiMVhTakhJVDE4ZVNNeGtkR3k2MThkYjVsNW91WEFiWm9L?=
 =?utf-8?B?V1Ftc3lQTjFobGpXUVR2ZEpkTFpmTTVsTVc2QmlJa3JlSHp2MEdrQlRyMlI4?=
 =?utf-8?B?UFhNeGNReG5sMmFpOUlHOFZ2bWx6ZDY4YjQ5ZkcrdDhLTHA5Z1B2Ukd6ZjZj?=
 =?utf-8?B?eS9TQjRuM2x2V2NOVDJEdjRnTk56QVZkZUQzemFPVldwUVViTGh6LytjYWtJ?=
 =?utf-8?B?SUF3SFlZUmhGeUYrT1V2K0hFd210UytGb2cwekVQTkVKTGt2NVZFRm55YWRv?=
 =?utf-8?B?aW1tZW5GQ3ZXZitxZFl0VXo1ZWFsWW1jNUNOQUNwM3dYYWI2NUYyRUZqZEtZ?=
 =?utf-8?B?RDlTQkdCSTg5MGF5NDYyVlIzZkVEa1N5SVJhUEtCNTlyckdDcXNhVzBGeUhV?=
 =?utf-8?B?V09uQWpvMUtBUXM3dEU1Zk5Td3MvbGxVRUFmZnhNSzFMQ0srTnVLc1FlZDN0?=
 =?utf-8?B?TkxCRWlsVFNRWGdqN2duOGhUUm5BazA0OFczbmpGcjRnVmRqdUtiOGdmQndv?=
 =?utf-8?B?UUFnUXJMeVo4VEVqNjhsL3FNTGdnSDI5c1R6VFFLV1IvVnR0K3A3L1Rob3Nz?=
 =?utf-8?B?TDIrL1Y3dGVZdkRaeHFqTzhwcU84YUppSEJaMThiTThFa1c4dERzelpZbVUv?=
 =?utf-8?B?SVdHUHFXR1VmTEU1eC93MGdUVk9yVjR1eWxWUnRMWnlPOHVNQ2J1KzhDVTFI?=
 =?utf-8?B?N0Vydzl6dDIzREdYV1k3cUp5L2RBRHViS0l3Z0ttS1JSNXZDdkZyUm1qelEw?=
 =?utf-8?B?UFVIK2wvei9YZXNvOUptREpHQXR5YVNMeW0yc2drYjAyQUo5TGJKUFFtTTJD?=
 =?utf-8?B?eCtZM1AzTzBHREw2c21sRnFCeEMrM1QvQnc3dHkyUEUrbE5EMitPRGdwY3JV?=
 =?utf-8?B?NWx4dXZST1MvdE42QUxoMEZyb2gwaVBRRG0vRGFmYTcvdHRPTVhjck9FYmxa?=
 =?utf-8?B?Znh4WUFzOEdUTzBOR3JEMjdJRzFEQnhzSGRraFVUZEtodUk0TWRqanFySXU1?=
 =?utf-8?B?ZmcwZ1RFOFBYVlBnbW1LbGhjVUdOdjVEOExiT2FtaVI1dG5ha3hIU284c3Jj?=
 =?utf-8?B?TU40RHhsVk5zQ0lJWG9UeXZqUjFoMUpWdzFPNm01NnNtdW5VLzhlVDNORitm?=
 =?utf-8?B?czh6dHhhWGZsWFpGMFcxSWdUcUZ3NGtNcGpaNG9GTGtkczUrdDhha09PWk5z?=
 =?utf-8?B?MlZCNlZOS2NVTms5YU9sS0RUMEFNQXlSeGRFTXFLQXZiSUx5NWtFZzMzSFpo?=
 =?utf-8?B?M2JOdU9vazJaS3cwclF6b0E1VlRNNWJvRjFEQWRRckxNUDFScENhdEFkRGhz?=
 =?utf-8?B?Z2d0OGN2akFOTVlvK29vWGxqcDlLUXMxRjYyRm10Q0hyc0ZLUTJQdVBzQlVM?=
 =?utf-8?B?TTE1QXR2T2RzY0Zmc25PV1UxQ3Z2eFBvUWFhUkZIQ3c4L01zT2dMSmU5Sk9U?=
 =?utf-8?B?K3hySXJveDV0bWVaTUl0Rjh5WXA4ajVxVVQ2MkZpTmY0bFE4OUs0bTVKSzVK?=
 =?utf-8?B?Zk9zTERMZURoVWhDTzdpMWpYaVRQVHJzZ0hOUEVtQUY3OEFTS1BOd3RSMkEz?=
 =?utf-8?B?Wmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 80e8073f-3b89-43aa-3b6a-08ddffa31000
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 21:56:37.1840 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XPDV+SLuBo5vBEzi7aDTaOjYfHmHRua2MUvr1pxDP1o0yN+V4k7k6+4vexNHhOcr3movdUWjarj8IRV8mguGt/fVWouaWuA6lBjRfrN63x8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9035
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



On 9/28/2025 5:59 PM, Patchwork wrote:
> *Patch Details*
> *Series:*	Refactor PF debugfs
> *URL:*	https://patchwork.freedesktop.org/series/155147/ <https://patchwork.freedesktop.org/series/155147/>
> *State:*	failure
> *Details:*	https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155147v1/index.html <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155147v1/index.html>
> 
> 
>   CI Bug Log - changes from xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412_FULL -> xe-pw-155147v1_FULL
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with xe-pw-155147v1_FULL absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-155147v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> 
>     Participating hosts (4 -> 4)
> 
> No changes in participating hosts
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in xe-pw-155147v1_FULL:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4:
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3835-3008c5c8e2fade05918e6d8c456572c91f30d412/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155147v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html>
> 

unrelated

<7> [ 52.288483] xe 0000:03:00.0: [drm:xe_pci_probe [xe]] SR-IOV support: no (mode: none)

<3> [190.039490] xe 0000:03:00.0: [drm] *ERROR* Tile0: GT0: CT write: non-zero status: 4294967295



