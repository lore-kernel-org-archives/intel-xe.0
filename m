Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57B40CD98CE
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jun 2026 17:15:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E365D10EAEC;
	Fri, 12 Jun 2026 17:15:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KIAacJR+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6528710EAEC
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jun 2026 17:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781284553; x=1812820553;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=5GPvG9JE8fCCXUEGndgdPysI3Vtliou+CDf5UDjAbEc=;
 b=KIAacJR+0k1AZObSQJTe3iZFdMvCbt2PwXmNmGOSmZcha82RDp8Jnyuw
 ydU+ibunAHKjgidgaBpS0+Hn/3oLoakALsXmvDnW8dNQTdJydwKoPhhje
 WHFSkMSg9bmLHKx9QoIW5CqFiLZDqRutD/Kk7+pskBt5J5FdrBR6wTcrd
 NMT/4G1g6SnkY1Tf0hnQ+6ArJ7bxFLu6geBoX+MtFGB53mKWrwum3sonq
 YEOz/RpVZzsK4SQ8Cd/sJsvsKMOsLdbPL+Z8L7rxV5Z+pR6nwUZu8Foqp
 YBefJr7XCe4hjBBFmSN1/bHIUYtVCdfxAbpt8IygDii0LCF3AECOr0EO3 Q==;
X-CSE-ConnectionGUID: rJeVb+CqQb+LfivHPXaX2w==
X-CSE-MsgGUID: LEkFj1U+QU6Rji3kQdMHew==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="85964430"
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; d="scan'208,217";a="85964430"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2026 10:15:52 -0700
X-CSE-ConnectionGUID: oq5+2Q5RSaaUb20L/b0CeQ==
X-CSE-MsgGUID: VVUs3g7GQAuPlDmrOT9tEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; 
 d="scan'208,217";a="245966636"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2026 10:15:52 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 12 Jun 2026 10:15:51 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 12 Jun 2026 10:15:51 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.47) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 12 Jun 2026 10:15:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sVADJx/uPZu3swMSG8hzcbM+QvyWRbI5yeorIRjgfjsaFVZATvs6BUvM3dNnVyZVpET/VlZwwFfOfmxAgP/wsrPX0Z8DGGKJtwr8s2Opb6DnpeO2R8GFaD/3NeeJxzA/OuwjIxRIV18YDGCQ8MV8Cm8ap9+F8jlQ4IIPk54OKaECFrJMyhIY12ICoOmtm4NvRXwrOPS83V1KRJ23NyhQZvC7PFiZndirOCx1+WLPtAjKd+Dzcu5bCZzreALDziGL/UAUkDmFdgRE3c9ut3KflBdd1XlcSve3h3YUFTcrk/8uPlfsmD8uwllXWNuzSoyq1ujYPhBaHPHORS5GcIOXZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vwdtViqSIlecsj5NOjqFsCZnE9UhxXei/2oqR4iOX90=;
 b=YVfwycwuxlJW0QOf71OtPD85NbMv9bSLJWqifq09EGSd2/pu6v7WJOX4b942+zDcRsIhlSq174sBwW4Z2YJLRHT4ncMneF+dTBKJdtE4X9eoT+uxnUFweY3Jkhyib05hWaIkQ0tWUIWVLFpvs+M3xd08ImsGrLATnsXN7kDJ4zM5TyvvBOcXeg67cTISkXn/bJ9LsPKDQ3D2ZlA1qxo2lTJZJyP7XgAMIQ6bKu51YxXG0M/lT7ZDvAyxyyZvoQnnQzrWzJs6J1Wgs3amGt+U38efx2F+ey066y+YntfEuHnXEElY6PwGc2aVtn+3L/PlbEZcSeHi67/HZazXw5Wpog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 by BY1PR11MB8078.namprd11.prod.outlook.com (2603:10b6:a03:52a::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Fri, 12 Jun
 2026 17:15:48 +0000
Received: from CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3]) by CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3%5]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 17:15:48 +0000
Content-Type: multipart/alternative;
 boundary="------------z0mrvNAzo3XOOlKETV1fSCEu"
Message-ID: <ae7610c9-1d03-4731-bb04-a1bcffaa2dbf@intel.com>
Date: Fri, 12 Jun 2026 22:45:39 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] drm/xe/debugfs: Add debugfs for pcode information
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <riana.tauro@intel.com>, <soham.purkait@intel.com>,
 <michael.j.ruhl@intel.com>
References: <20260611165607.3653019-1-karthik.poosa@intel.com>
 <20260611165607.3653019-3-karthik.poosa@intel.com>
 <20260611205807.GH6214@mdroper-desk1.amr.corp.intel.com>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <20260611205807.GH6214@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: MA5P287CA0163.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ba::11) To CH0PR11MB5249.namprd11.prod.outlook.com
 (2603:10b6:610:e0::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5249:EE_|BY1PR11MB8078:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d415ff3-b6bd-4bb4-a30d-08dec8a63ee4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|18002099003|22082099003|56012099006|11063799006|6133799003|4143699003|5023799004|8096899003;
X-Microsoft-Antispam-Message-Info: COyv6OIeSAuHGb4+bbXar35Zsnz/tp4kRLcL1LaDO4bE2e+Yf/C24BWemrr89Fot046f7X+0JKRNUtooc5dNMjF0wi7yL3TXi2hWF9nIxOQIkjjdVeNclAP916/8Cy5ToCwAqdQhr7NyNVjeRRU6z0EA9cGgCbAXO9YOBMFImFpRJdolESDKH6cAX8dBANlH8pBrSOMCE773GxFvyjTjijmx0hJCyZlOPRO8psGGM6eMDaauEbLh5asTAXIyi+gXKYaRQPDqz3DzZ18wAIPD/xvWqvR/nORFGOashyBwVE4ymETaGEr/QCjfpS/ywXZ0o7R7SAPMQ5UJU6Cm36mqqPs7433fdwrm/OCbeYvSXc/JWGXXmi6iwdFdTbUFJvnrqXaVX/SOVJY+IUDh6hvGBLy4ZGTRx2pvaHbckhINukASxUgU64sZ2cHRtWct5mndW9twkU3d3kJmDghNNwGOYYTHepYXRTEMIzhPSHxAdNGyYWeLfITiZpN1Han1rCOFhrWGgoqzzwIKtbUf7/7ORHBt3gEQGEyq0kH8iLMfQ+KJGQfNUnlg0HwF5VE9U4qNpRMcFYVjLCrp2eah6UthqZe8NQfUe/TLGaF4oo85HQT3miQinvMZhFofB5W51/IdAiZKvtDFuWfCz53EVG640yAFw2FPItGKc5NLOntnxwy+jjM3JFGLwql6mKG3br7c
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5249.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(18002099003)(22082099003)(56012099006)(11063799006)(6133799003)(4143699003)(5023799004)(8096899003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?elpBTGYyZDZxcS8yMUt0ekVZOFB1MGxSa252UjU2VzFLMi9kUzRsaTgrYVJ1?=
 =?utf-8?B?N0I2TDVKanE2SFhrRURaZ0kyNWpEMXEzOGhVdlFRVlA5bm5IZmlyWGo3MUo5?=
 =?utf-8?B?RU1rd3IzNmpSdWR0UlVrREpxeEhLZDhCTHhZVEwxVHVhQ1RzY2hSM0JyM2Nk?=
 =?utf-8?B?bnlCaUxiWFZSbXdzdm9Hb0NkVUF6SHBmcW9qQVR2R0VoNS92RnhFTUtOeUY1?=
 =?utf-8?B?QkhRVXVGZ2lIaWg5N3lBN09McVRqTUVoVktvYnZmanlaeGM1L1lCdE1lRGxx?=
 =?utf-8?B?L2lRaWMvRUZ4NVhpbHBjU3dSUHluY2k1YXFCdUpTNHlJUnRTNHM0SENyS21Q?=
 =?utf-8?B?emwzL2NMU0JlK0k2VlRSQkE1ZzlVVTdvdGlLWGU0QTRrZHRBU1R4bHhCWElE?=
 =?utf-8?B?dEl4ZHRrVFk2TnNkK08yK0Ryd3dLRzQ5aTdUMVA4dk5OV1oxOW1pMFhrZ3Ey?=
 =?utf-8?B?SFdPVm5id2hZTWIzb1luU0pmclJ5bFhjTERXdE9RVG1hRmJrK0lQbGFuNmFM?=
 =?utf-8?B?K3B6bzVUNVorTHZwYXh2L3hTTXlmbFZ2Tks1QkJIVm1IenpicDVlSGIzdm85?=
 =?utf-8?B?NDZqVzJLTndieVYyVFB1V0cxYlo3MG5LYzZyQ0VLUW0wYmdmZzdCYlVnM1Q3?=
 =?utf-8?B?L25EcmZyWkdHRlZybk9KaFh6d0dJLzFiVE5VWHd6RUsrZWxjQlAvT3pXMWdl?=
 =?utf-8?B?V3lUb0IwTWpDNHV1eVJCV3N5QWQ3N3BwQllxVEprbEJCM2o2a05RWWIxOFMr?=
 =?utf-8?B?T3N5QXpyQkUyUG5WNnRsa2Juc3Y1bEZ3VXMrdHRVbklqV3M1QS9FVFJKeWw4?=
 =?utf-8?B?QmExclVjRzd6c3d2RG5oSXRzQ3BxRk9VY1NtcnVCWVk0d2Z1N3lWTTlvY2Ey?=
 =?utf-8?B?K3lKTk1ISkdLREpMNW5nNVFOU3p0eXFoNm15YW1TcWpNKzIzWWtDOUR1bGhN?=
 =?utf-8?B?aUtsL2VsL2dBdkp5bU95dmMvL25kaE14eXJ6RmJMM1IvMWZyYWk0eW5MaHpD?=
 =?utf-8?B?MXdhOHd0dFlUZW4xb3laZDBnaFV5V29LRis5cnZTUWFMUzBYVHQwa253eDlY?=
 =?utf-8?B?RG9qSERkMWdkVUlpVS9WbzE3QnRmaWZ3TXdZQnJhOTU3ZGhuMFNBdGtnVk9s?=
 =?utf-8?B?Q0dEbFRuK1c3T0ZwNFF4OWZGdW1tL3BzRzhqZUFXZWpKYW94OTVQYndDdW9F?=
 =?utf-8?B?RUNRWWI2THJlYUJ6dDBnUXFNTFFGRWZkUzkrOGYvWG81bHEyVVdQTWJVbnFE?=
 =?utf-8?B?TWhaMEZ4OTh3K1hTc2ZRanlyN0ovdjFHZWRMOEp1Nk1TeGIvcWhLOG15dEYy?=
 =?utf-8?B?eTI2RWliS24wV0dhY3RjWHMxZ2txcDZHckx6cFBSTG5wM1lqS0tGc2pobFg4?=
 =?utf-8?B?cFphd05PWStKdFdYSVQ4M1YrN2Z2ZmpWVjdUU2NuWXpML2hjMnowWnNadFhI?=
 =?utf-8?B?T3RNNHRSRTc0VG9OajdHcm51T0tuR2MwdTdaM01vNytUdGtUK2VyNXVaNlhP?=
 =?utf-8?B?UWFEVUFSa0VZakNxblA2RlZSWUxQcEVCdDdGRk9zRVJjbm0wV1FVY2dGdmdi?=
 =?utf-8?B?MXJCbFRuQmlZSytaRkRNajgrQkRRQlZEVm5MczJaTEtkVmF2SUVnbVdJdW85?=
 =?utf-8?B?bnM3ZTdPV2R6WGErRnVVckdKZGxzVHZBalJWQTVxUFRQWXlpaEp4YXJnL3V1?=
 =?utf-8?B?TWRVajd3dldjSkFaWjd5N0lRYnEzUGtPTlloWlYzelJYL01MUDEvMFV2b01a?=
 =?utf-8?B?VkxuM2N2R25NdkkrVlVaM0VpMXFkU0FCemxoOVNxWkpoMXpoQkRkZ2RuY2NE?=
 =?utf-8?B?QVlETmZlS0prVFBGT3p6dVJ2K0djNysrcUNxVVV3UUFiQjU4WmZ4TTIxNVNp?=
 =?utf-8?B?TE9xV1RteXVpS25FcXBOZ25wbUFMaDU5VTJPZ0NJT1NFMFI2OGVXU1d4a0tF?=
 =?utf-8?B?SVhLN1NXVTBHakJIb2xHMENkQkVCY1ZjMGc5U2N2NDQxdGZPalVnc0hMT0px?=
 =?utf-8?B?Y2VjYVRWZUFBRFRwREZKYUtXd21XU0poY0hzWFRMM202OVRhaGtVcUt2NE1h?=
 =?utf-8?B?cDU0NnpOL1JtR1FXUmJXOHFjZGwzWEh5cUNjZnNISHJsNVZEbFpRVnVJdmZo?=
 =?utf-8?B?bU83U2RjQW0rYml0YjRIME0xNld3b3d2aUpFK0RMMVU5RTU1eVJubEM1QTMv?=
 =?utf-8?B?eThOK1BJcEtxQ2d5V1Q1L05kQ2s1M2d5d25XcWRXM2dROCt1bmtTYzBPOVpW?=
 =?utf-8?B?THg3UFFlVWh6L0w4VTY2ZkZRSXpWbEsvUHp1YVVrQmlNd2FiUEMwQ3A3ZS9H?=
 =?utf-8?B?V1k1UFhpTVFuTTVjUFZkdGdhSFMwT0F1SWVUZy9aSHBqQkhIbmpvQT09?=
X-Exchange-RoutingPolicyChecked: l7aHsdDqXT0E7KS0MtTITwPMMflx4eFTiiC+Tzv6FY/yKuwt+OT5ndzIB7y1V+gdJZE3/g+hPetNX4k+2Tfvx5CEdLm3cfiD9CpwPpKp72yd7+iPNmndjJ+CMcuEcBXeddVriTRHYh5NSlDaJVyzGJqaYUZ9GN/aVMezX9Qaj1nm3OM8x4eO2YH9OvSneBnz1Hb8V4XppKpA23BWnLBztfIfWRZn+4jecRUDkmiVFXFHlv8MGQBRNddq5Z4aSTWLzWxKxWon6/2mOy3JsdINk5zDvY2Zl/fYZHnFfzixmCRCAxywyrgGbeKpTG8EY0lpJX3bQY9/gWoNWLipuVdfyA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d415ff3-b6bd-4bb4-a30d-08dec8a63ee4
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5249.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 17:15:48.2869 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QrCT5FR+d9/ZYyE85ZJwgZm/hJX46FNyxAZBovdbBIOaixGUAktb6jj0FEgNq7ieuW5Fb3j2+8JSFw5viCNkgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8078
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

--------------z0mrvNAzo3XOOlKETV1fSCEu
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 12-06-2026 02:28, Matt Roper wrote:
> On Thu, Jun 11, 2026 at 10:26:07PM +0530, Karthik Poosa wrote:
>> Introduce a pcode_info debugfs entry to report pcode details.
>> This initial implementation exposes the pcode version.
>> This can aid debugging when the pcode version is needed.
>>
>> v2:
>>   - Enable the debugfs only for supported platforms. (Micheal Ruhl)
>>
>> v3:
>>   - Move the platform check out of this patch, as it is not relevant here.
>>     This patch solely enables debugfs; debugfs creation will be determined
>>     based on the return value of get_pcode_version. (Karthik)
>>
>> Signed-off-by: Karthik Poosa<karthik.poosa@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_debugfs.c | 19 +++++++++++++++++++
>>   1 file changed, 19 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
>> index 22b471303984..65049916e42c 100644
>> --- a/drivers/gpu/drm/xe/xe_debugfs.c
>> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
>> @@ -31,6 +31,7 @@
>>   #include "xe_tile_debugfs.h"
>>   #include "xe_vsec.h"
>>   #include "xe_wa.h"
>> +#include "xe_pcode.h"
>>   
>>   #ifdef CONFIG_DRM_XE_DEBUG
>>   #include "xe_bo_evict.h"
>> @@ -161,6 +162,23 @@ static int workaround_info(struct seq_file *m, void *data)
>>   	return 0;
>>   }
>>   
>> +static int pcode_info(struct seq_file *m, void *data)
>> +{
>> +	struct xe_device *xe = node_to_xe(m->private);
>> +	struct drm_printer p = drm_seq_file_printer(m);
>> +	struct pcode_version version;
>> +	int ret = 0;
>> +
>> +	ret = get_pcode_version(xe, &version);
>> +	if (ret) {
>> +		drm_warn(&xe->drm, "couldn't read pcode version ret %d\n", ret);
>> +		return ret;
>> +	}
>> +	drm_printf(&p, "pcode version: %d.%d.%d\n", version.major,
>> +		   version.minor, version.engg);
>> +	return 0;
>> +}
>> +
>>   static int dgfx_pkg_residencies_show(struct seq_file *m, void *data)
>>   {
>>   	struct xe_device *xe;
>> @@ -219,6 +237,7 @@ static const struct drm_info_list debugfs_list[] = {
> Based on the CI results it doesn't look like we can access the register
> on SR-IOV VFs, so this debugfs is only relevant to the PF.  We probably
> need to add a pf-only list of debugfs files, similar to what we have in
> the GT debugfs code.
>
>
> Matt
Looks like that other debugfs components are already handling this.
Adding a VF check in pcode_info() should suffice here.
>
>>   	{"info", info, 0},
>>   	{ .name = "sriov_info", .show = sriov_info, },
>>   	{ .name = "workarounds", .show = workaround_info, },
>> +	{ .name = "pcode_info", .show = pcode_info, },
>>   };
>>   
>>   static const struct drm_info_list debugfs_residencies[] = {
>> -- 
>> 2.25.1
>>
--------------z0mrvNAzo3XOOlKETV1fSCEu
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 12-06-2026 02:28, Matt Roper wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260611205807.GH6214@mdroper-desk1.amr.corp.intel.com">
      <pre wrap="" class="moz-quote-pre">On Thu, Jun 11, 2026 at 10:26:07PM +0530, Karthik Poosa wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Introduce a pcode_info debugfs entry to report pcode details.
This initial implementation exposes the pcode version.
This can aid debugging when the pcode version is needed.

v2:
 - Enable the debugfs only for supported platforms. (Micheal Ruhl)

v3:
 - Move the platform check out of this patch, as it is not relevant here.
   This patch solely enables debugfs; debugfs creation will be determined
   based on the return value of get_pcode_version. (Karthik)

Signed-off-by: Karthik Poosa <a class="moz-txt-link-rfc2396E" href="mailto:karthik.poosa@intel.com">&lt;karthik.poosa@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_debugfs.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 22b471303984..65049916e42c 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -31,6 +31,7 @@
 #include &quot;xe_tile_debugfs.h&quot;
 #include &quot;xe_vsec.h&quot;
 #include &quot;xe_wa.h&quot;
+#include &quot;xe_pcode.h&quot;
 
 #ifdef CONFIG_DRM_XE_DEBUG
 #include &quot;xe_bo_evict.h&quot;
@@ -161,6 +162,23 @@ static int workaround_info(struct seq_file *m, void *data)
 	return 0;
 }
 
+static int pcode_info(struct seq_file *m, void *data)
+{
+	struct xe_device *xe = node_to_xe(m-&gt;private);
+	struct drm_printer p = drm_seq_file_printer(m);
+	struct pcode_version version;
+	int ret = 0;
+
+	ret = get_pcode_version(xe, &amp;version);
+	if (ret) {
+		drm_warn(&amp;xe-&gt;drm, &quot;couldn't read pcode version ret %d\n&quot;, ret);
+		return ret;
+	}
+	drm_printf(&amp;p, &quot;pcode version: %d.%d.%d\n&quot;, version.major,
+		   version.minor, version.engg);
+	return 0;
+}
+
 static int dgfx_pkg_residencies_show(struct seq_file *m, void *data)
 {
 	struct xe_device *xe;
@@ -219,6 +237,7 @@ static const struct drm_info_list debugfs_list[] = {
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Based on the CI results it doesn't look like we can access the register
on SR-IOV VFs, so this debugfs is only relevant to the PF.  We probably
need to add a pf-only list of debugfs files, similar to what we have in
the GT debugfs code.


Matt</pre>
    </blockquote>
    <style>a {
    text-decoration: none;
    color: #464feb;
}tr th, tr td {
    border: 1px solid #e6e6e6;
}tr th {
    background-color: #f5f5f5;
}</style>
    <div style="font-family:'Segoe UI';font-size:14px;font-style:normal;font-weight:400;line-height:20px">Looks
      like that other debugfs components are already handling this.<br>
      Adding a VF check in pcode_info() should suffice here.</div>
    <blockquote type="cite" cite="mid:20260611205807.GH6214@mdroper-desk1.amr.corp.intel.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre"> 	{&quot;info&quot;, info, 0},
 	{ .name = &quot;sriov_info&quot;, .show = sriov_info, },
 	{ .name = &quot;workarounds&quot;, .show = workaround_info, },
+	{ .name = &quot;pcode_info&quot;, .show = pcode_info, },
 };
 
 static const struct drm_info_list debugfs_residencies[] = {
-- 
2.25.1

</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------z0mrvNAzo3XOOlKETV1fSCEu--
