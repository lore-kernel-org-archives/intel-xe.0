Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44224CA5FF0
	for <intel-xe@archiver.kernel.org>; Tue,  6 Oct 2026 08:36:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3C5F10E20F;
	Tue,  6 Oct 2026 08:36:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gi7/pMd2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84C8F10E20F
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Oct 2026 08:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791275764; x=1822811764;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=x40SjEP00tMRGiOlN5YTL5x83xAdzL0vRkfX4vVNRls=;
 b=gi7/pMd2ply6Ah5UcLF4nmGgusJUA+h3mIXvuj1DMsqA4ZmCo+S4yXwG
 YZIUDnyWfYbpI6iwP/hC5qESEWeiHD2vd215GKMQmhMjHydvbUAQoaCRM
 xSj1bKArcY2Q6hklXmxanbG82GiCT2qeNIK/87uXY1wXzdqcguIlc8yiF
 n23Kcnm7+U5N8YRptecQwXXtUOA294Jg5C5FQd8r+FFVaJuHKAb6oxKUd
 q4bJHCFq1yGNTZCF3Wmx21EjhWlx7RRAvgZmnEHkMzW6tzb1bradNuokU
 N6seRSspGsI+8vv6LQOh9kXpj9r1v6OBfN+/E3yDNYe54zUpT6zFkyK1W A==;
X-CSE-ConnectionGUID: tC1S5tZBQHqDkurmslikBg==
X-CSE-MsgGUID: V5gz9lf/TDmHR1TuDcewSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="9483"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="9483"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2026 01:35:59 -0700
X-CSE-ConnectionGUID: msBmfXmKQnalt/7YVf6rwQ==
X-CSE-MsgGUID: iletOq4USRylmxIbl5gn1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; d="scan'208";a="285197766"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2026 01:35:58 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 6 Oct 2026 01:35:58 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 6 Oct 2026 01:35:58 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.45) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 6 Oct 2026 01:35:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nExTp+yHb/22VKSu8XOasBD7XNVD/SFmulZXM7ljw3NE+yO+9YjMThrkHaZEQYi3uh+Cyi/nMZrNh4cyVilMitxI5lLEBdpkvxpQjeQ/oRBXLn7AncJXC6fXnRlsIgj3G4fCwsBfnXT3pDTjx9KxT2FXGJoXkv2D886ybkzwqj+9V8qH+IBw7zv8RtciN4zre3zpj/QXtJVxnDiewqFV2tk6Uz1JF4jFpuQONPBXWUkoVijHJcSm9LAYjwrhL7L3Q7cuz2F904D7sBhh+6qytM+IvOfx5q+MIYJGkGzIQPFwxx32NlZ1R7Rfz4kNYQPCg26i/Lh5dfbBn36sDBDNUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/CGt1dXTNff5w8ygyaoHCu4DQnQOUaLyFE6t16xaR3o=;
 b=TtMWREk2dLd6NWukwJqrEX1/J3r+9i1joh4g2NIT9dYzDe7iQif/UzL6FARLs3SZnHNAXyUhn/n0EvvtQxwqw+Cq/OFxBtbwGtfL1k56QePy4Ds0Rp/QP3N0WdFnkAMZYjTO77h02rlQq44gxNmJRvdwITVKkCH4tRZbcd7Tmb76jECN2BkaR0Hgdw+zcM+vgQbJetyJMbqwQRZjDU4+QJQ/j2TE28YXyO1W1fAVZpSsTQTKtAHJOyHcrGUChF6c4GuGvt7PNJR1uRsZiiYRRSVOdaISGeejTgCq10IajeXApS0BXvZXCVGh4LwD1/4fd6EaY1500zCV97JVBoWNpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3SPRMB0029.namprd11.prod.outlook.com (2603:10b6:208:57e::9)
 by SN7PR11MB6924.namprd11.prod.outlook.com (2603:10b6:806:2ab::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.22; Tue, 6 Oct
 2026 08:35:50 +0000
Received: from IA3SPRMB0029.namprd11.prod.outlook.com
 ([fe80::de1f:3bf4:8ae4:9c50]) by IA3SPRMB0029.namprd11.prod.outlook.com
 ([fe80::de1f:3bf4:8ae4:9c50%3]) with mapi id 15.21.0472.016; Tue, 6 Oct 2026
 08:35:49 +0000
Message-ID: <866ddae9-3df8-4bdc-a9bf-48efbb49135e@intel.com>
Date: Tue, 6 Oct 2026 14:05:43 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/4] drm/xe/guc: Split GuC ID manager into usable and
 shareable pools
To: <intel-xe@lists.freedesktop.org>
References: <20261005085132.3720685-1-piotr.piorkowski@intel.com>
 <20261005085132.3720685-2-piotr.piorkowski@intel.com>
Content-Language: en-US
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
In-Reply-To: <20261005085132.3720685-2-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0199.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b2::11) To IA3SPRMB0029.namprd11.prod.outlook.com
 (2603:10b6:208:57e::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3SPRMB0029:EE_|SN7PR11MB6924:EE_
X-MS-Office365-Filtering-Correlation-Id: b2794566-b9e9-494f-3e25-08df2384d327
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|22082099003|18002099003|10067099003|4143699003|5023799004|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: fiMTrqBTz7GSu+hdyUJQ3YT/scPuFDVsttsF8qibzg/2dlaJA5H85uBO4k8NTXk3Bx94T4A6gl0O/vMzlgok5msWwM7x4Gy3X1buRhuMLNSvWkCsF/HzAR7O3Wco3myEJ+FPz0O8B2Hu2HFw2rcbOOFwJRnpEIAws8ilXvrk8wn7y5oNeJiPxXUs2iLQCCO1eCVtJ5Rjtah/As31d6a8LILcKMTI3eqepH6ZR/4C5/Ux4eKZ12qYOJZ65/CTTEWfhLxzmgCsYs6L5+fbfW/5IkKgyruNAKED/Se7ktAHUHaWZUTal5Hl0PvcH/TyTAghEr0GWnoIwHDb77KOEs1Qr0/VRf2+MPVJTM6bmDcw20fbRrZsXPpU+gv2XJPjlq3gQtVnKSBPdca5MmEt1FPOenYk2t1zm9ZjI32+aJMZnqH+DzUh//GUWMTnOjb4AEUeGbNkvLYVsRbEqoIIB0T7G3TLRKC3yWwiAcF8fEuih9g0+abKfmd+qUhaDusXUTV4JgmoKIfjVYsFcLDF1XJbj5plLsHHCzP61BIaXmwVcj05gZ9oPqWx5xjp5yLorsma/p9goscuQar1t+xLI0GHBdA6SP83TcWcCn7a6jyFGy+AwXBxj8Gj43MSilagRQWQEMIdMr/m7ePraIyku/kdaqW1GfhaYdSwIZOheXW0rrc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3SPRMB0029.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(22082099003)(18002099003)(10067099003)(4143699003)(5023799004)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?blBVMUpZelcxUjhnakd5T3ZxUUY4WDh3NjVaUjdxQmxPa3Zqd2dwN3BRTldB?=
 =?utf-8?B?SmkvZFpyT0k2UHRjL2NidmtKcmdSQW4yT3NlRVloVC9vQVJiL1JramNuRjJh?=
 =?utf-8?B?VmRRQjVpY2M2a3JCRmNJSzF1TFZFNnh5K0w1WjVHS05lQUtOUGtwTStNaXdN?=
 =?utf-8?B?ZTQ1MGE2eThGTlJnTzh1T0EraFF4YjRmVUcyTmF3RDRUb0tKWi9yMnBBSUwv?=
 =?utf-8?B?ajlianNkczFnaCtTWFBzR2FXZzcrVnNtTi8wK21MRkJUMm00WXl0RzVhREdS?=
 =?utf-8?B?U1ZRZnBHUmF0WnpkOVNZZk82dG9ESFhmTUlUYWJwaXZadE56c0FVVXFBL2Y1?=
 =?utf-8?B?K09WbzZSMmRSaHNkTEV6MGZTOGloUmdtMDNUekRrYm41NFhJeFZhcE1IbzRK?=
 =?utf-8?B?NlovM0Nwd2R0SDJZVndZM2FjU0FFMHBobVRJRDVVcExTSjVZUjJKUXdZM0RY?=
 =?utf-8?B?MGgxWkExMmc3b3B0enZqalFwcjlud3ZEeDc4eC9tU2luY0VyL0FwTjNaelda?=
 =?utf-8?B?eWtDS3B3bWV6QlBIYk5XN0tmZnZyVDVwQmFRNFJNKzFEejcva01HQWFaSk5z?=
 =?utf-8?B?UzljRnJvbXYyVUNOWWtRLzVBNVM5TGVHaFhyQ2I1cEt3QkxaUnpyTWJzeFkz?=
 =?utf-8?B?am9NbFppb0tsbS9Bd3NYaDJGMGRCQnhTUVhHelQvbmdHSGhIanpPbCtlOEdC?=
 =?utf-8?B?US9jSVpVN3FzTXd1T2F1d0lod1UxZXc3dUhrTkU5b3FUY2hxbGU4YnJZQWtv?=
 =?utf-8?B?c0RvbGEzRXJRNG9GN0dhUlduSW16dEI3S3lPUnBudFIxeGRWb1RQMndReGlw?=
 =?utf-8?B?c3c1RzZJbnZCY2g4MHhxRXY5cTJvUGRIWnN4enBBT0pmazZoSU1VckdkU3dw?=
 =?utf-8?B?ajFVQm1TeFFvSFJsTTZGYTJVUkxGVlF2d0dlTE85ZUpVb2VibkZZT281dWdW?=
 =?utf-8?B?UUM5ZWpIVTBSZDVIWFFyY0tWeGw3alQzYk5IMXRWYjFSQjhhSHZ1cDJ3Z0Rk?=
 =?utf-8?B?OE51RS9GN0ZDdFpTUmxLdmYyVVB2d1ZQV0FXMXRLclNSUVBYcHgzZVBVTUIr?=
 =?utf-8?B?VnY2Ukkyc2Y3eTd0SmRNRlJWTDVLbU95YXJxdGNBMndHWFRveDlGSllwRklY?=
 =?utf-8?B?dEFIQjBZSUlaMFRMVVhIWkJaS2JhUWhzZ3FQQUxUUVVuc2hIVnU0SEJXOHc4?=
 =?utf-8?B?bWhYOVFQQ2NVSnhiY0pFb1VJeFRjenUwakc5SkFxcWFLcHlid1FRQzB6QjFu?=
 =?utf-8?B?K2xKQzNKWHBWRXJNYTZSWXF1bHlkckZWSzVsbzZJUGtXOGh0R0ZkQkJpbnJR?=
 =?utf-8?B?Z2dHMFdMUDk2Q1ppczYvaFZ2UC93b2RQV2tsbjZGNXJ2a1poQjBEMStjb3Vt?=
 =?utf-8?B?UzAwTVgyK2lYYzB1cDgzei9OTklSTEprQ1d2bWRkY1lqbVQzd0Vra0VIREdW?=
 =?utf-8?B?amR3ZWYvWE9hdDNManRqTTE4VnB4RFNHWTY0Q2E1MjRBUXBFMnNRZm1HUGls?=
 =?utf-8?B?NjhtU2dJaGNRdmRSZW1yUFdKRm80VXM5K1BNSDZ5NVBNZWhlTElTUmp5dXgv?=
 =?utf-8?B?RWFmWEk5bzViWVl2RDBGa0loVDNLdVlVMXI0NVdHV1VYVTR5UU45UDhmelhT?=
 =?utf-8?B?Yk5QM1NlbU5acmZzVVl3UFpieE5jT2RJeEhWN3dXeG1JRXU1Vnh4Z2pwOGNq?=
 =?utf-8?B?bm1RcDl6UmpqZXhIdWZKcmo0eWZyQzdOcFk3NEpYS3U0ZERXZnEvT0g4WWgw?=
 =?utf-8?B?bFdBNVNvMVdNcFJNSDBxaUMvcHFRNm1abFB3a2UrQTBqNHBQS0oxMGZoK2ox?=
 =?utf-8?B?YnlXQ3RoL0kyMzkyMXVKWnAxQm1OeC8xdjQ1eWVDMzRQUnBzQVlpTnNPZmtX?=
 =?utf-8?B?bExiNUsyMTdpZkFZVmg3OE9oSlBqWmRYeXlGYm1GNjFiWmVlU3FsQVV3Z2tH?=
 =?utf-8?B?MGR6Nk1QRng3Q01QTnNWVlFiL2Y2TWdIdEdlUTl4bk1yYkdtQ3NmY0F1OTQ3?=
 =?utf-8?B?RG0yWkJLeTVWTkZheEN2YVZ0UVdiMjI1SkpXSjZ6RzZibEVTV1cwaW1RdldX?=
 =?utf-8?B?ZXVqcXdWUGQ0bDhiZllMZXdMUFdFUUJaeVFQS3U2WmQzaWE0SXhJeHlhMmxF?=
 =?utf-8?B?dXNJSmU0ci9JZG9NaDd3WHJNSndwMDRlV0VqNUJRRzFqRmVzbCs5Q0RnNmtZ?=
 =?utf-8?B?cFNKOXc0VTN2WE91TFN4eDlTaXo5ZGViTVZGUStWaWEvZHB0WGwrZncyRVo2?=
 =?utf-8?B?Nk5Cbk9pQXBiSmRxRXBBeitTejJHYXRWNmxYTStoMDZhVmhwRW85dTNqekJz?=
 =?utf-8?B?d2QySzc4d0ZWdmRjOXlDM3RsbGhGM3JYOGZjVjBYQ0lwYTY4ZXArRHJFTG1P?=
 =?utf-8?Q?wUVnHAKdMgLdyRlQ=3D?=
X-Exchange-RoutingPolicyChecked: LRKguN3GC1LCQjnQrMwAtfLHpbOMKnX2KAVZJhit9DSd06IU3WKvUzoc2tC57SeILD06O3lumjCFfrbcVkayLgijL8bOFIUKDf0B7oXmkrUI/5HQbBC2zFP8+W1hlQwsamqIdDnAZj1MqZhmksv4cQKwIx+q0879NziLP3xbKED1iZF78iXRnaGjYBRV3A12d9Fq8yIwRokdi9vt9IdXUfM3yRmF+vjP7pVEDveuILqDavs030wt9BzhftfbGKZ330r+UsgbJJeiCspgTVqkq2ynF81suzsl79QcGtAEx1qu3FytXCS9hX4hPhM9enc+6UVrRfk1a9WWorIDMBnvmQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: b2794566-b9e9-494f-3e25-08df2384d327
X-MS-Exchange-CrossTenant-AuthSource: IA3SPRMB0029.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 08:35:49.8619 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8pFg8/jjuOO8kg24sUXUcmWiWF8GxL4vUhq1oFTFbdRMOOjwEpOq9RsdIZWc6iNmawB3MpnqEH5AjFrQ/8tqomRjYcczMSlwl6sswoMl50A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6924
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


On 05-Oct-26 2:21 PM, Piórkowski, Piotr wrote:
> From: Piotr Piórkowski <piotr.piorkowski@intel.com>
>
> Modify the GuC identifier manager so that it distinguishes between
> usable GuC IDs allocated for GuC submissions, and shareable those that
> can be shared with VFs. Both pools are represented as a single bitmap
> and may overlap.
> Let's Replace the single-pool accounting model with separate usable and
> shareable pools, add helpers for pool accounting and limits, and update
> debug reporting.
>
> For now, let's keep the current allocation behaviour by mapping both pools
> onto the same GuC ID space. This prepares the ID manager for separate
> management of submission IDs and VF allocations in following changes.
>
> v2: Do not change how VF IDs are allocated in the legacy path (Sashiko)
>
> v3: Fix shareable spare quota accounting to include
>      PF-exclusive usable IDs.
>
> v4: Do not apply spare quota to VF-exclusive shareable IDs (Sashiko)
>      Drop redundant checks and asserts (Satya)
>
> Assisted-by: Claude:claude-5-sonnet
> Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>   drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c |  57 +--
>   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    |   2 +-
>   drivers/gpu/drm/xe/xe_guc_id_mgr.c            | 443 ++++++++++++++----
>   drivers/gpu/drm/xe/xe_guc_id_mgr.h            |  20 +-
>   drivers/gpu/drm/xe/xe_guc_types.h             |   8 +-
>   5 files changed, 405 insertions(+), 125 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c b/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
> index ee30a1939eb0e..78d3de46b7572 100644
> --- a/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
> +++ b/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
> @@ -24,8 +24,8 @@ static void bad_init(struct kunit *test)
>   {
>   	struct xe_guc_id_mgr *idm = test->priv;
>   
> -	KUNIT_EXPECT_EQ(test, -EINVAL, xe_guc_id_mgr_init(idm, 0));
> -	KUNIT_EXPECT_EQ(test, -ERANGE, xe_guc_id_mgr_init(idm, GUC_ID_MAX + 1));
> +	KUNIT_EXPECT_EQ(test, -EINVAL, idm_init(idm, 0, 0));
> +	KUNIT_EXPECT_EQ(test, -ERANGE, idm_init(idm, GUC_ID_MAX + 1, 0));
>   }
>   
>   static void no_init(struct kunit *test)
> @@ -43,12 +43,12 @@ static void init_fini(struct kunit *test)
>   {
>   	struct xe_guc_id_mgr *idm = test->priv;
>   
> -	KUNIT_ASSERT_EQ(test, 0, xe_guc_id_mgr_init(idm, -1));
> +	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, GUC_ID_MAX, 0));
>   	KUNIT_EXPECT_NOT_NULL(test, idm->bitmap);
> -	KUNIT_EXPECT_EQ(test, idm->total, GUC_ID_MAX);
> +	KUNIT_EXPECT_EQ(test, idm_total(idm), GUC_ID_MAX);
>   	__fini_idm(NULL, idm);
>   	KUNIT_EXPECT_NULL(test, idm->bitmap);
> -	KUNIT_EXPECT_EQ(test, idm->total, 0);
> +	KUNIT_EXPECT_EQ(test, idm_total(idm), 0);
>   }
>   
>   static void check_used(struct kunit *test)
> @@ -56,19 +56,19 @@ static void check_used(struct kunit *test)
>   	struct xe_guc_id_mgr *idm = test->priv;
>   	unsigned int n;
>   
> -	KUNIT_ASSERT_EQ(test, 0, xe_guc_id_mgr_init(idm, 2));
> +	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, 2, 0));
>   
>   	mutex_lock(idm_mutex(idm));
>   
> -	for (n = 0; n < idm->total; n++) {
> +	for (n = 0; n < idm_total(idm); n++) {
>   		kunit_info(test, "n=%u", n);
> -		KUNIT_EXPECT_EQ(test, idm->used, n);
> -		KUNIT_EXPECT_GE(test, idm_reserve_chunk_locked(idm, 1, 0), 0);
> -		KUNIT_EXPECT_EQ(test, idm->used, n + 1);
> +		KUNIT_EXPECT_EQ(test, bitmap_weight(idm->bitmap, idm_total(idm)), n);
> +		KUNIT_EXPECT_GE(test, xe_guc_id_mgr_reserve_usable_locked(idm, 1), 0);
> +		KUNIT_EXPECT_EQ(test, bitmap_weight(idm->bitmap, idm_total(idm)), n + 1);
>   	}
> -	KUNIT_EXPECT_EQ(test, idm->used, idm->total);
> -	idm_release_chunk_locked(idm, 0, idm->used);
> -	KUNIT_EXPECT_EQ(test, idm->used, 0);
> +	KUNIT_EXPECT_EQ(test, bitmap_weight(idm->bitmap, idm_total(idm)), idm_total(idm));
> +	idm_release_chunk_locked(idm, 0, idm_total(idm));
> +	KUNIT_EXPECT_EQ(test, bitmap_weight(idm->bitmap, idm_total(idm)), 0);
>   
>   	mutex_unlock(idm_mutex(idm));
>   }
> @@ -76,25 +76,12 @@ static void check_used(struct kunit *test)
>   static void check_quota(struct kunit *test)
>   {
>   	struct xe_guc_id_mgr *idm = test->priv;
> -	unsigned int n;
> -
> -	KUNIT_ASSERT_EQ(test, 0, xe_guc_id_mgr_init(idm, 2));
>   
> -	mutex_lock(idm_mutex(idm));
> +	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, 2, 0));
>   
> -	for (n = 0; n < idm->total - 1; n++) {
> -		kunit_info(test, "n=%u", n);
> -		KUNIT_EXPECT_EQ(test, idm_reserve_chunk_locked(idm, 1, idm->total), -EDQUOT);
> -		KUNIT_EXPECT_EQ(test, idm_reserve_chunk_locked(idm, 1, idm->total - n), -EDQUOT);
> -		KUNIT_EXPECT_EQ(test, idm_reserve_chunk_locked(idm, idm->total - n, 1), -EDQUOT);
> -		KUNIT_EXPECT_GE(test, idm_reserve_chunk_locked(idm, 1, 1), 0);
> -	}
> -	KUNIT_EXPECT_LE(test, 0, idm_reserve_chunk_locked(idm, 1, 0));
> -	KUNIT_EXPECT_EQ(test, idm->used, idm->total);
> -	idm_release_chunk_locked(idm, 0, idm->total);
> -	KUNIT_EXPECT_EQ(test, idm->used, 0);
> -
> -	mutex_unlock(idm_mutex(idm));
> +	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_reserve_usable(idm, 2), 0);
> +	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_reserve_usable(idm, 1), -ENOSPC);
> +	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_usable(idm, 0, 2), 0);
>   }
>   
>   static void check_all(struct kunit *test)
> @@ -102,14 +89,14 @@ static void check_all(struct kunit *test)
>   	struct xe_guc_id_mgr *idm = test->priv;
>   	unsigned int n;
>   
> -	KUNIT_ASSERT_EQ(test, 0, xe_guc_id_mgr_init(idm, -1));
> +	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, GUC_ID_MAX, 0));
>   
>   	mutex_lock(idm_mutex(idm));
>   
> -	for (n = 0; n < idm->total; n++)
> -		KUNIT_EXPECT_LE(test, 0, idm_reserve_chunk_locked(idm, 1, 0));
> -	KUNIT_EXPECT_EQ(test, idm->used, idm->total);
> -	for (n = 0; n < idm->total; n++)
> +	for (n = 0; n < idm_total(idm); n++)
> +		KUNIT_EXPECT_LE(test, 0, xe_guc_id_mgr_reserve_usable_locked(idm, 1));
> +	KUNIT_EXPECT_EQ(test, bitmap_weight(idm->bitmap, idm_total(idm)), idm_total(idm));
> +	for (n = 0; n < idm_total(idm); n++)
>   		idm_release_chunk_locked(idm, n, 1);
>   
>   	mutex_unlock(idm_mutex(idm));
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index 6947aeed458ed..de1ac58e31412 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -1182,7 +1182,7 @@ static u32 pf_estimate_fair_ctxs(struct xe_gt *gt, unsigned int num_vfs)
>   {
>   	struct xe_guc_id_mgr *idm = &gt->uc.guc.submission_state.idm;
>   	u32 spare = pf_get_spare_ctxs(gt);
> -	u32 fair = (idm->total - spare) / num_vfs;
> +	u32 fair = (xe_guc_id_mgr_max_usable(idm) - spare) / num_vfs;
>   	int ret;
>   
>   	for (; fair; --fair) {
> diff --git a/drivers/gpu/drm/xe/xe_guc_id_mgr.c b/drivers/gpu/drm/xe/xe_guc_id_mgr.c
> index e845425d670be..8f90a5337fe4c 100644
> --- a/drivers/gpu/drm/xe/xe_guc_id_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_guc_id_mgr.c
> @@ -34,6 +34,34 @@ static struct xe_device *idm_to_xe(struct xe_guc_id_mgr *idm)
>   
>   static void idm_print_locked(struct xe_guc_id_mgr *idm, struct drm_printer *p, int indent);
>   
> +static unsigned int idm_total(struct xe_guc_id_mgr *idm)
> +{
> +	if (idm->usable > GUC_ID_MAX - idm->shareable)
> +		return GUC_ID_MAX;
> +
> +	return idm->usable + idm->shareable;
> +}
> +
> +static unsigned int idm_shareable_start(struct xe_guc_id_mgr *idm)
> +{
> +	return idm_total(idm) - idm->shareable;
> +}
> +
> +static unsigned int idm_used_usable(struct xe_guc_id_mgr *idm)
> +{
> +	lockdep_assert_held(idm_mutex(idm));
> +
> +	return bitmap_weight(idm->bitmap, idm->usable);
> +}
> +
> +static unsigned int idm_used_shareable(struct xe_guc_id_mgr *idm)
> +{
> +	lockdep_assert_held(idm_mutex(idm));
> +
> +	return bitmap_weight(idm->bitmap, idm_total(idm)) -
> +	       bitmap_weight(idm->bitmap, idm_shareable_start(idm));
> +}
> +
>   static void __fini_idm(struct drm_device *drm, void *arg)
>   {
>   	struct xe_guc_id_mgr *idm = arg;
> @@ -41,25 +69,56 @@ static void __fini_idm(struct drm_device *drm, void *arg)
>   	mutex_lock(idm_mutex(idm));
>   
>   	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
> -		unsigned int weight = bitmap_weight(idm->bitmap, idm->total);
> +		unsigned int weight = bitmap_weight(idm->bitmap, idm_total(idm));
>   
>   		if (weight) {
>   			struct drm_printer p = xe_gt_info_printer(idm_to_gt(idm));
>   
>   			xe_gt_err(idm_to_gt(idm), "GUC ID manager unclean (%u/%u)\n",
> -				  weight, idm->total);
> +				  weight, idm_total(idm));
>   			idm_print_locked(idm, &p, 1);
>   		}
>   	}
>   
>   	bitmap_free(idm->bitmap);
>   	idm->bitmap = NULL;
> -	idm->total = 0;
> -	idm->used = 0;
> +	idm->usable = 0;
> +	idm->shareable = 0;
>   
>   	mutex_unlock(idm_mutex(idm));
>   }
>   
> +static int idm_init(struct xe_guc_id_mgr *idm, unsigned int usable, unsigned int shareable)
> +{
> +	bool overlap = usable > GUC_ID_MAX - shareable;
> +	unsigned int total;
> +	int ret;
> +
> +	if (!usable)
> +		return -EINVAL;
> +	if (usable > GUC_ID_MAX || shareable > GUC_ID_MAX)
> +		return -ERANGE;
> +
> +	idm_assert(idm, !idm->bitmap);
> +	idm_assert(idm, !shareable || IS_SRIOV_PF(idm_to_xe(idm)));
> +	total = overlap ? GUC_ID_MAX : usable + shareable;
> +
> +	idm->bitmap = bitmap_zalloc(total, GFP_KERNEL);
> +	if (!idm->bitmap)
> +		return -ENOMEM;
> +
> +	idm->usable = usable;
> +	idm->shareable = shareable;
> +
> +	ret = drmm_add_action_or_reset(&idm_to_xe(idm)->drm, __fini_idm, idm);
> +	if (ret)
> +		return ret;
> +
> +	xe_gt_dbg(idm_to_gt(idm), "using %u GuC ID%s, %u GuC ID%s shareable with VFs\n",
> +		  idm->usable, str_plural(idm->usable), idm->shareable, str_plural(idm->shareable));
> +	return 0;
> +}
> +
>   /**
>    * xe_guc_id_mgr_init() - Initialize GuC context ID Manager.
>    * @idm: the &xe_guc_id_mgr to initialize
> @@ -68,90 +127,156 @@ static void __fini_idm(struct drm_device *drm, void *arg)
>    * The bare-metal or PF driver can pass ~0 as &limit to indicate that all
>    * context IDs supported by the GuC firmware are available for use.
>    *
> - * Only VF drivers will have to provide explicit number of context IDs
> - * that they can use.
> - *
>    * Return: 0 on success or a negative error code on failure.
>    */
>   int xe_guc_id_mgr_init(struct xe_guc_id_mgr *idm, unsigned int limit)
>   {
> -	int ret;
> -
> -	idm_assert(idm, !idm->bitmap);
> -	idm_assert(idm, !idm->total);
> -	idm_assert(idm, !idm->used);
> -
>   	if (limit == ~0)
>   		limit = GUC_ID_MAX;
> -	else if (limit > GUC_ID_MAX)
> -		return -ERANGE;
> -	else if (!limit)
> -		return -EINVAL;
>   
> -	idm->bitmap = bitmap_zalloc(limit, GFP_KERNEL);
> -	if (!idm->bitmap)
> -		return -ENOMEM;
> -	idm->total = limit;
> +	return idm_init(idm, limit, 0);
> +}
>   
> -	ret = drmm_add_action_or_reset(&idm_to_xe(idm)->drm, __fini_idm, idm);
> -	if (ret)
> -		return ret;
> +/**
> + * xe_guc_id_mgr_max_usable() - Get maximum number of usable GuC context IDs.
> + * @idm: the &xe_guc_id_mgr to query
> + *
> + * Return: maximum number of GuC context IDs that can be used by @idm for GuC submission.
> + */
> +unsigned int xe_guc_id_mgr_max_usable(struct xe_guc_id_mgr *idm)
> +{
> +	return idm->usable;
> +}
>   
> -	xe_gt_dbg(idm_to_gt(idm), "using %u GuC ID%s\n",
> -		  idm->total, str_plural(idm->total));
> -	return 0;
> +/**
> + * xe_guc_id_mgr_max_shareable() - Get maximum number of shareable GuC context IDs.
> + * @idm: the &xe_guc_id_mgr to query
> + *
> + * Return: maximum number of GuC context IDs that can be shared with VFs.
> + */
> +unsigned int xe_guc_id_mgr_max_shareable(struct xe_guc_id_mgr *idm)
> +{
> +	return idm->shareable;
>   }
>   
> -static unsigned int find_last_zero_area(unsigned long *bitmap,
> -					unsigned int total,
> -					unsigned int count)
> +static int idm_reserve_chunk_usable_locked(struct xe_guc_id_mgr *idm, unsigned int count)
> +{
> +	int id;
> +
> +	idm_assert(idm, count);
> +	lockdep_assert_held(idm_mutex(idm));
> +
> +	if (!idm->usable)
> +		return -ENODATA;
> +
> +	id = bitmap_find_next_zero_area(idm->bitmap, idm->usable, 0, count, 0);
> +	if (id >= idm->usable)
> +		return -ENOSPC;
> +
> +	bitmap_set(idm->bitmap, id, count);
> +
> +	return id;
> +}
> +
> +static unsigned int idm_find_last_zero_area_in_range(unsigned long *bitmap,
> +						     unsigned int range_start,
> +						     unsigned int range_end,
> +						     unsigned int count)
>   {
> -	unsigned int found = total;
> -	unsigned int rs, re, range;
> +	unsigned int found = range_end;
> +	unsigned int rs, re;
> +
> +	for_each_clear_bitrange(rs, re, bitmap, range_end) {
> +		unsigned int start = max(rs, range_start);
> +		unsigned int end = min(re, range_end);
> +		unsigned int range;
>   
> -	for_each_clear_bitrange(rs, re, bitmap, total) {
> -		range = re - rs;
> +		if (start >= end)
> +			continue;
> +
> +		range = end - start;
>   		if (range < count)
>   			continue;
> -		found = rs + (range - count);
> +
> +		found = start + (range - count);
>   	}
> +
>   	return found;
>   }
>   
> -static int idm_reserve_chunk_locked(struct xe_guc_id_mgr *idm,
> -				    unsigned int count, unsigned int retain)
> +static int idm_reserve_chunk_shareable_locked(struct xe_guc_id_mgr *idm, unsigned int count,
> +					      unsigned int spare)
>   {
> +	unsigned int shareable_start = idm_shareable_start(idm);
> +	unsigned int total = idm_total(idm);
>   	int id;
>   
>   	idm_assert(idm, count);
>   	lockdep_assert_held(idm_mutex(idm));
>   
> -	if (!idm->total)
> +	if (!idm->shareable)
>   		return -ENODATA;
>   
> -	if (retain) {
> +	if (shareable_start < idm->usable) {
>   		/*
> -		 * For IDs reservations (used on PF for VFs) we want to make
> -		 * sure there will be at least 'retain' available for the PF
> +		 * Spare is meaningful only for IDs that are shared between usable and
> +		 * shareable pools. For non-overlapping pools, shareable reservations do
> +		 * not reduce PF usable capacity, so there is nothing to retain.
>   		 */
> -		if (idm->used + count + retain > idm->total)
> -			return -EDQUOT;
> +		id = idm_find_last_zero_area_in_range(idm->bitmap, shareable_start, total, count);
> +		if (id >= total)
> +			return -ENOSPC;
> +
>   		/*
> -		 * ... and we want to reserve highest IDs close to the end.
> +		 * Only IDs taken from the overlapping part reduce PF usable capacity,
> +		 * so a chunk located entirely in the VF-exclusive part is never limited
> +		 * by the spare.
>   		 */
> -		id = find_last_zero_area(idm->bitmap, idm->total, count);
> +		if (spare && id < idm->usable) {
> +			unsigned int used_usable = bitmap_weight(idm->bitmap, idm->usable);
> +			unsigned int need_overlap = min(id + count, idm->usable) - id;
> +
> +			if (used_usable + need_overlap + spare > idm->usable)
> +				return -EDQUOT;
Can we write a helper to check these limits and return error?
> +		}
>   	} else {
> -		/*
> -		 * For regular IDs reservations (used by submission code)
> -		 * we start searching from the lower range of IDs.
> -		 */
> -		id = bitmap_find_next_zero_area(idm->bitmap, idm->total, 0, count, 0);
> +		id = bitmap_find_next_zero_area(idm->bitmap, total, shareable_start, count, 0);
> +		if (id + count > total)
> +			return -ENOSPC;
Same as above.
> +	}
> +
> +	bitmap_set(idm->bitmap, id, count);
> +
> +	return id;
> +}
> +
> +static int idm_reserve_chunk_locked(struct xe_guc_id_mgr *idm, unsigned int count,
> +				    unsigned int retain)
> +{
> +	unsigned int total = idm_total(idm);
> +	int id;
> +
> +	idm_assert(idm, count);
> +	lockdep_assert_held(idm_mutex(idm));
> +
> +	if (!total)
> +		return -ENODATA;
> +
> +	if (retain) {
> +		unsigned int used = bitmap_weight(idm->bitmap, total);
> +
> +		if (used + count + retain > total)
> +			return -EDQUOT;
Same as above.
> +
> +		id = idm_find_last_zero_area_in_range(idm->bitmap, 0, total, count);
> +	} else {
> +		id = bitmap_find_next_zero_area(idm->bitmap, total, 0, count, 0);
>   	}
> -	if (id >= idm->total)
> +
> +	if (id >= total)
>   		return -ENOSPC;

Same as above.

Otherwise LGTM.

-Satya.

>   
>   	bitmap_set(idm->bitmap, id, count);
> -	idm->used += count;
>   
>   	return id;
>   }
> @@ -160,9 +285,8 @@ static void idm_release_chunk_locked(struct xe_guc_id_mgr *idm,
>   				     unsigned int start, unsigned int count)
>   {
>   	idm_assert(idm, count);
> -	idm_assert(idm, count <= idm->used);
> -	idm_assert(idm, start < idm->total);
> -	idm_assert(idm, start + count - 1 < idm->total);
> +	idm_assert(idm, start < idm_total(idm));
> +	idm_assert(idm, start + count - 1 < idm_total(idm));
>   	lockdep_assert_held(idm_mutex(idm));
>   
>   	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
> @@ -172,22 +296,61 @@ static void idm_release_chunk_locked(struct xe_guc_id_mgr *idm,
>   			idm_assert(idm, test_bit(start + n, idm->bitmap));
>   	}
>   	bitmap_clear(idm->bitmap, start, count);
> -	idm->used -= count;
> +}
> +
> +static int idm_release_chunk_in_range_locked(struct xe_guc_id_mgr *idm,
> +					     unsigned int start,
> +					     unsigned int count,
> +					     unsigned int range_start,
> +					     unsigned int range_end)
> +{
> +	lockdep_assert_held(idm_mutex(idm));
> +
> +	if (!count)
> +		return -EINVAL;
> +
> +	if (start < range_start || start >= range_end)
> +		return -ERANGE;
> +
> +	if (count > range_end - start)
> +		return -ERANGE;
> +
> +	idm_release_chunk_locked(idm, start, count);
> +
> +	return 0;
>   }
>   
>   /**
> - * xe_guc_id_mgr_reserve_locked() - Reserve one or more GuC context IDs.
> + * xe_guc_id_mgr_reserve_usable_locked() - Reserve one or more usable GuC context IDs.
>    * @idm: the &xe_guc_id_mgr
> - * @count: number of IDs to allocate (can't be 0)
> + * @count: number of usable GuC context IDs to reserve (can't be 0)
>    *
> - * This function is dedicated for the use by the GuC submission code,
> - * where submission lock is already taken.
> + * This function is dedicated for use by the GuC submission code when the
> + * submission lock is already held.
>    *
>    * Return: ID of allocated GuC context or a negative error code on failure.
>    */
> -int xe_guc_id_mgr_reserve_locked(struct xe_guc_id_mgr *idm, unsigned int count)
> +int xe_guc_id_mgr_reserve_usable_locked(struct xe_guc_id_mgr *idm, unsigned int count)
>   {
> -	return idm_reserve_chunk_locked(idm, count, 0);
> +	return idm_reserve_chunk_usable_locked(idm, count);
> +}
> +
> +/**
> + * xe_guc_id_mgr_reserve_shareable_locked() - Reserve one or more shareable GuC context IDs.
> + * @idm: the &xe_guc_id_mgr
> + * @count: number of shareable GuC context IDs to reserve (can't be 0)
> + * @spare: number of usable IDs to keep available for the PF
> + *
> + * This function is dedicated for use by the PF driver, which expects the
> + * reserved range of IDs to be contiguous. The function expects that the
> + * caller has already taken the lock.
> + *
> + * Return: ID of allocated GuC context or a negative error code on failure.
> + */
> +int xe_guc_id_mgr_reserve_shareable_locked(struct xe_guc_id_mgr *idm, unsigned int count,
> +					   unsigned int spare)
> +{
> +	return idm_reserve_chunk_shareable_locked(idm, count, spare);
>   }
>   
>   /**
> @@ -206,60 +369,175 @@ void xe_guc_id_mgr_release_locked(struct xe_guc_id_mgr *idm, unsigned int id,
>   }
>   
>   /**
> - * xe_guc_id_mgr_reserve() - Reserve a range of GuC context IDs.
> + * xe_guc_id_mgr_release_usable_locked() - Release one or more usable GuC context IDs.
> + * @idm: the &xe_guc_id_mgr
> + * @id: the first usable GuC context ID to release
> + * @count: number of usable GuC context IDs to release
> + *
> + * This function is dedicated for use by the GuC submission code when the
> + * submission lock is already held.
> + *
> + * Return: 0 on success, or a negative error code on failure.
> + */
> +int xe_guc_id_mgr_release_usable_locked(struct xe_guc_id_mgr *idm, unsigned int id,
> +					unsigned int count)
> +{
> +	return idm_release_chunk_in_range_locked(idm, id, count, 0, idm->usable);
> +}
> +
> +/**
> + * xe_guc_id_mgr_release_shareable_locked() - Release one or more shareable GuC context IDs.
>    * @idm: the &xe_guc_id_mgr
> - * @count: number of GuC context IDs to reserve (can't be 0)
> - * @retain: number of GuC context IDs to keep available (can't be 0)
> + * @id: the first shareable GuC context ID to release
> + * @count: number of shareable GuC context IDs to release
>    *
> - * This function is dedicated for the use by the PF driver which expects that
> - * reserved range of IDs will be contiguous and that there will be at least
> - * &retain IDs still available for the PF after this reservation.
> + * Return: 0 on success, or a negative error code on failure.
> + */
> +int xe_guc_id_mgr_release_shareable_locked(struct xe_guc_id_mgr *idm, unsigned int id,
> +					   unsigned int count)
> +{
> +	return idm_release_chunk_in_range_locked(idm, id, count,
> +						 idm_shareable_start(idm), idm_total(idm));
> +}
> +
> +/**
> + * xe_guc_id_mgr_reserve_usable() - Reserve one or more usable GuC context IDs.
> + * @idm: the &xe_guc_id_mgr
> + * @count: number of usable GuC context IDs to reserve (can't be 0)
> + *
> + * Return: ID of allocated GuC context or a negative error code on failure.
> + */
> +int xe_guc_id_mgr_reserve_usable(struct xe_guc_id_mgr *idm, unsigned int count)
> +{
> +	guard(mutex)(idm_mutex(idm));
> +
> +	idm_assert(idm, count);
> +
> +	return idm_reserve_chunk_usable_locked(idm, count);
> +}
> +
> +/**
> + * xe_guc_id_mgr_reserve_shareable() - Reserve one or more shareable GuC context IDs for VFs.
> + * @idm: the &xe_guc_id_mgr
> + * @count: number of shareable GuC context IDs to reserve (can't be 0)
> + * @spare: number of usable IDs to keep available for the PF
> + *
> + * This function is dedicated for use by the PF driver, which expects the
> + * reserved range of IDs to be contiguous.
>    *
>    * Return: starting ID of the allocated GuC context ID range or
>    *         a negative error code on failure.
>    */
> -int xe_guc_id_mgr_reserve(struct xe_guc_id_mgr *idm,
> -			  unsigned int count, unsigned int retain)
> +int xe_guc_id_mgr_reserve_shareable(struct xe_guc_id_mgr *idm, unsigned int count,
> +				    unsigned int spare)
> +{
> +	guard(mutex)(idm_mutex(idm));
> +
> +	idm_assert(idm, count);
> +
> +	return idm_reserve_chunk_shareable_locked(idm, count, spare);
> +}
> +
> +int xe_guc_id_mgr_reserve_locked(struct xe_guc_id_mgr *idm, unsigned int count)
> +{
> +	return idm_reserve_chunk_locked(idm, count, 0);
> +}
> +
> +int xe_guc_id_mgr_reserve(struct xe_guc_id_mgr *idm, unsigned int count,
> +			  unsigned int retain)
>   {
>   	int ret;
>   
>   	idm_assert(idm, count);
>   	idm_assert(idm, retain);
>   
> -	mutex_lock(idm_mutex(idm));
> +	guard(mutex)(idm_mutex(idm));
>   	ret = idm_reserve_chunk_locked(idm, count, retain);
> -	mutex_unlock(idm_mutex(idm));
>   
>   	return ret;
>   }
>   
>   /**
> - * xe_guc_id_mgr_release() - Release a range of GuC context IDs.
> + * xe_guc_id_mgr_release() - Release one or more GuC context IDs.
>    * @idm: the &xe_guc_id_mgr
> - * @start: the starting ID of GuC context range to release
> + * @start: the first GuC context ID to release
>    * @count: number of GuC context IDs to release
>    */
>   void xe_guc_id_mgr_release(struct xe_guc_id_mgr *idm,
>   			   unsigned int start, unsigned int count)
>   {
> -	mutex_lock(idm_mutex(idm));
> +	guard(mutex)(idm_mutex(idm));
> +
>   	idm_release_chunk_locked(idm, start, count);
> -	mutex_unlock(idm_mutex(idm));
>   }
>   
> -static void idm_print_locked(struct xe_guc_id_mgr *idm, struct drm_printer *p, int indent)
> +/**
> + * xe_guc_id_mgr_release_usable() - Release one or more usable GuC context IDs.
> + * @idm: the &xe_guc_id_mgr
> + * @id: the first usable GuC context ID to release
> + * @count: number of usable GuC context IDs to release
> + *
> + * Return: 0 on success, or a negative error code on failure.
> + */
> +int xe_guc_id_mgr_release_usable(struct xe_guc_id_mgr *idm, unsigned int id, unsigned int count)
> +{
> +	guard(mutex)(idm_mutex(idm));
> +
> +	return xe_guc_id_mgr_release_usable_locked(idm, id, count);
> +}
> +
> +/**
> + * xe_guc_id_mgr_release_shareable() - Release one or more shareable GuC context IDs.
> + * @idm: the &xe_guc_id_mgr
> + * @id: the first shareable GuC context ID to release
> + * @count: number of shareable GuC context IDs to release
> + *
> + * Return: 0 on success, or a negative error code on failure.
> + */
> +int xe_guc_id_mgr_release_shareable(struct xe_guc_id_mgr *idm, unsigned int id,
> +				    unsigned int count)
> +{
> +	guard(mutex)(idm_mutex(idm));
> +
> +	return xe_guc_id_mgr_release_shareable_locked(idm, id, count);
> +}
> +
> +static void idm_print_range_locked(struct xe_guc_id_mgr *idm,
> +				   struct drm_printer *p,
> +				   int indent,
> +				   const char *name,
> +				   unsigned int range_start,
> +				   unsigned int range_end,
> +				   unsigned int used)
>   {
>   	unsigned int rs, re;
>   
>   	lockdep_assert_held(idm_mutex(idm));
>   
> -	drm_printf_indent(p, indent, "total %u\n", idm->total);
> +	drm_printf_indent(p, indent, "%s used %u\n", name, used);
> +	for_each_set_bitrange(rs, re, idm->bitmap, range_end) {
> +		rs = max(rs, range_start);
> +		re = min(re, range_end);
> +
> +		if (rs < re)
> +			drm_printf_indent(p, indent, "%s range %u..%u (%u)\n",
> +					  name, rs, re - 1, re - rs);
> +	}
> +}
> +
> +static void idm_print_locked(struct xe_guc_id_mgr *idm, struct drm_printer *p, int indent)
> +{
> +	lockdep_assert_held(idm_mutex(idm));
> +
> +	drm_printf_indent(p, indent, "total %u\n", idm_total(idm));
>   	if (!idm->bitmap)
>   		return;
>   
> -	drm_printf_indent(p, indent, "used %u\n", idm->used);
> -	for_each_set_bitrange(rs, re, idm->bitmap, idm->total)
> -		drm_printf_indent(p, indent, "range %u..%u (%u)\n", rs, re - 1, re - rs);
> +	idm_print_range_locked(idm, p, indent, "usable", 0, idm->usable,
> +			       idm_used_usable(idm));
> +	idm_print_range_locked(idm, p, indent, "shareable",
> +			       idm_shareable_start(idm), idm_total(idm),
> +			       idm_used_shareable(idm));
>   }
>   
>   /**
> @@ -270,9 +548,8 @@ static void idm_print_locked(struct xe_guc_id_mgr *idm, struct drm_printer *p, i
>    */
>   void xe_guc_id_mgr_print(struct xe_guc_id_mgr *idm, struct drm_printer *p, int indent)
>   {
> -	mutex_lock(idm_mutex(idm));
> +	guard(mutex)(idm_mutex(idm));
>   	idm_print_locked(idm, p, indent);
> -	mutex_unlock(idm_mutex(idm));
>   }
>   
>   #if IS_BUILTIN(CONFIG_DRM_XE_KUNIT_TEST)
> diff --git a/drivers/gpu/drm/xe/xe_guc_id_mgr.h b/drivers/gpu/drm/xe/xe_guc_id_mgr.h
> index 368f8c80e4c7d..209f99831f1b4 100644
> --- a/drivers/gpu/drm/xe/xe_guc_id_mgr.h
> +++ b/drivers/gpu/drm/xe/xe_guc_id_mgr.h
> @@ -9,13 +9,29 @@
>   struct drm_printer;
>   struct xe_guc_id_mgr;
>   
> -int xe_guc_id_mgr_init(struct xe_guc_id_mgr *idm, unsigned int count);
> +int xe_guc_id_mgr_init(struct xe_guc_id_mgr *idm, unsigned int limit);
>   
> +unsigned int xe_guc_id_mgr_max_usable(struct xe_guc_id_mgr *idm);
> +unsigned int xe_guc_id_mgr_max_shareable(struct xe_guc_id_mgr *idm);
> +
> +int xe_guc_id_mgr_reserve_usable_locked(struct xe_guc_id_mgr *idm, unsigned int count);
> +int xe_guc_id_mgr_reserve_usable(struct xe_guc_id_mgr *idm, unsigned int count);
> +int xe_guc_id_mgr_reserve_shareable_locked(struct xe_guc_id_mgr *idm, unsigned int count,
> +					   unsigned int spare);
> +int xe_guc_id_mgr_reserve_shareable(struct xe_guc_id_mgr *idm, unsigned int count,
> +				    unsigned int spare);
>   int xe_guc_id_mgr_reserve_locked(struct xe_guc_id_mgr *idm, unsigned int count);
> +int xe_guc_id_mgr_reserve(struct xe_guc_id_mgr *idm, unsigned int count, unsigned int retain);
>   void xe_guc_id_mgr_release_locked(struct xe_guc_id_mgr *idm, unsigned int id, unsigned int count);
> +int xe_guc_id_mgr_release_usable_locked(struct xe_guc_id_mgr *idm, unsigned int id,
> +					unsigned int count);
> +int xe_guc_id_mgr_release_shareable_locked(struct xe_guc_id_mgr *idm, unsigned int id,
> +					   unsigned int count);
>   
> -int xe_guc_id_mgr_reserve(struct xe_guc_id_mgr *idm, unsigned int count, unsigned int retain);
>   void xe_guc_id_mgr_release(struct xe_guc_id_mgr *idm, unsigned int start, unsigned int count);
> +int xe_guc_id_mgr_release_usable(struct xe_guc_id_mgr *idm, unsigned int id, unsigned int count);
> +int xe_guc_id_mgr_release_shareable(struct xe_guc_id_mgr *idm, unsigned int id,
> +				    unsigned int count);
>   
>   void xe_guc_id_mgr_print(struct xe_guc_id_mgr *idm, struct drm_printer *p, int indent);
>   
> diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/xe_guc_types.h
> index 3dbcb1331690e..6da43691e54c5 100644
> --- a/drivers/gpu/drm/xe/xe_guc_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_types.h
> @@ -42,10 +42,10 @@ struct xe_guc_db_mgr {
>   struct xe_guc_id_mgr {
>   	/** @bitmap: bitmap to track allocated IDs */
>   	unsigned long *bitmap;
> -	/** @total: total number of IDs being managed */
> -	unsigned int total;
> -	/** @used: number of IDs currently in use */
> -	unsigned int used;
> +	/** @usable: number of IDs being managed for GuC submission */
> +	unsigned int usable;
> +	/** @shareable: number of IDs that can be shared with VFs */
> +	unsigned int shareable;
>   };
>   
>   /**
