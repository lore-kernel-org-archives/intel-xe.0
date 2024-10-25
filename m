Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9965AD149F7
	for <intel-xe@archiver.kernel.org>; Fri, 25 Oct 2024 23:21:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 644BF10E076;
	Fri, 25 Oct 2024 23:21:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RoPDJ6i5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B16DC10E076
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Oct 2024 23:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729898496; x=1761434496;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SJkyOvhM3ByVpOcvvSte+Ho+em5lmZQCfv8lN+pLrI0=;
 b=RoPDJ6i586TTDoniDl+TO0EH6UM1G6BLYq4a6lJw8Am488R46WbOKv7P
 HMMORgSHMZ1yarskus/94jLnPiYJDXSA0HRU6L8miMe+ot09s08bpIWkq
 64m5ReJUyASNXSfEp3QUDScbcMDKj6zk06ckEgi8n5IdlC/3Yfw6OHtzA
 MGH34EfjTR/tbtrO9qiN2UVqA0cRrADYGUPIhTOl4d1rgiz0fAs/CJtKE
 Ld3T830icoi6kWf2N5i0oE59SRF1256M3AilnemHY/zJcnMcAHJLd1rsy
 8NSMc5ZKc9IihE5pnml495nh9sBUzydEZBI5ZljK1GP3Ryc8p91g68KZo Q==;
X-CSE-ConnectionGUID: wCk+NE7wSqepWzkEPvM/JQ==
X-CSE-MsgGUID: QdqMCy6FQm6RckV1HEUyiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="40129108"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="40129108"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2024 16:21:36 -0700
X-CSE-ConnectionGUID: PDwx7m5ORh+poYyjA33qdA==
X-CSE-MsgGUID: 37D4TiAIQZq8j13FvVGkrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,233,1725346800"; d="scan'208";a="118515878"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Oct 2024 16:21:35 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 25 Oct 2024 16:21:35 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 25 Oct 2024 16:21:35 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 25 Oct 2024 16:21:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sz4Ir6FXGOFbwi2sxP6Fe2Ay5iG7LbOVQub1JJCNOvgODvNE6Fkacuq1pToX7cPqrYEypCWXf6/zGt7fr1UQiHI2QCDQZWmbFsB/IT2SM9dobDtIHNSvZqrIp6e/Rpaa4ZpiV+/yedmv2rkqYO4BE+C03VU4l4Jy9cxl8lnUnxT7wB0GKuQcyTurwk4uwrKN9p0ZEmTUMRP0YkK/+6OxtKP3R9yzIgMjolm60er26gDcRGN4CEA3G22N8YaWRom3y4OmveVujIUQYwodNm6FW7jbVXlShquaTvppUat1tQ9b6L2WuKQCqcef4eDYpd19jJuCsL2lmDvQTfkbPPAoFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vr691NAzwXt6+1uZXJSAbHfCqHhZ5/3tSS8kGkK0thc=;
 b=vIzJyBBGhaNtk3RZ2tHYYrr2d95ODRAXtA+EmjlWtgjtm98Y8Zs+pWpkgUD09bcS8T6gHYEsxqe4OvygMQoflzDsajvO0ge3i8SdERRrGGlDm9ueE+EiUJ51btZ/d4SGDELxSaR1Ityja7z7WK4JKDVO28QLmV/a/PrIMmO5sKBitSCQVOoBYgxG5tM4RFNUehVytaRrEeEOMr4i5LxJh64HSVsQJ7T+wOZz9xXbrWDr1AQiS3/jZTIi6CQyviLosyMSTziX0Md0RMftOv3p6P1pzkD4b/N+zEtNaoVC9la8+KXR3yGQ4vNLqHSXkzAL0vFbhSfs7YxeN9D5VVOG6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by CH0PR11MB5315.namprd11.prod.outlook.com (2603:10b6:610:be::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.23; Fri, 25 Oct
 2024 23:21:32 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%3]) with mapi id 15.20.8093.018; Fri, 25 Oct 2024
 23:21:31 +0000
Message-ID: <bb6a79e4-96fb-4a14-b889-9a62c846c658@intel.com>
Date: Fri, 25 Oct 2024 16:21:28 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] drm/xe: Don't short circuit TDR on jobs not started
To: Matthew Brost <matthew.brost@intel.com>, "Zanoni, Paulo R"
 <paulo.r.zanoni@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Justen, Jordan L" <jordan.l.justen@intel.com>, "Briano, Ivan"
 <ivan.briano@intel.com>
References: <20241022232756.1769013-1-matthew.brost@intel.com>
 <20241022232756.1769013-2-matthew.brost@intel.com>
 <1a5852ccbf8713023a71fc435038a80546801746.camel@intel.com>
 <Zxk1XqHRi90GG89g@DUT025-TGLU.fm.intel.com>
 <e25b8e02ceba708c71ff783c547744b7dc15cbae.camel@intel.com>
 <Zxv4tJMHrVvZH8bQ@DUT025-TGLU.fm.intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <Zxv4tJMHrVvZH8bQ@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW2PR16CA0039.namprd16.prod.outlook.com
 (2603:10b6:907:1::16) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|CH0PR11MB5315:EE_
X-MS-Office365-Filtering-Correlation-Id: e70e6d9d-7c44-432e-c239-08dcf54bc28e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QmpQdlV0anpIQUF6Qy9GekJOYlArZ3FoYytsT1NOWjVKdnNsd3JsaGdnelpM?=
 =?utf-8?B?cHNManFNckpUM1BwbU8vWEt0c21td2xQTlYvaGEwOW9jemtxY1NtR1Z1Q1U2?=
 =?utf-8?B?bWl1ZUZWLzhBb2NuamFwbC9yZVhyNUpRajVzU2lRWWJHWE5kNURIVUFqdTBV?=
 =?utf-8?B?V2ZtR1hkVUdDNWdOd1ZHeVNxSjB5bk5rclJ6Q2owZjk2NTlqZExGcWFab1Nl?=
 =?utf-8?B?WHg3dkV4MTNpT25OQXFqSy85eFRyaG04U0tTQXFxM2UwbERQVDN0MTYvb1VO?=
 =?utf-8?B?VXpHbDZIcTlkNWxKTmxzRm1IU1pzU05FdVEzM25GREhKS0wwMHdPTGo0RVpN?=
 =?utf-8?B?MVZuQ3BTcWFtMXJvRE5hakhmczRmb0h0aTBDVW5OVXpvQ3Z3OG1WYW5lRlNM?=
 =?utf-8?B?bEdhbDhKT0N6ZWNSUFJ6eXRzUmdrNHFTb2d3TVBPbFAwS1VGU1VJVWlGL3V1?=
 =?utf-8?B?aG9idUV0cmZvZ3NtR1NOaXVuV0FyY0FRZ0FuWkVLYSttODZTTis5RjdBcC9n?=
 =?utf-8?B?ZE9pZDlxbFlERkJNWmlSZHNYaFUwOHc2OGtKc3FSaHJXUlplcHFBOW5PQTNt?=
 =?utf-8?B?SisrYnFaY0xUNWlVdWxibjJabnUrLytLODJwRkZzTjdqZS9McVcvQjFVeFVN?=
 =?utf-8?B?Vkd6TEw3bVZLbU9lckVVbWoyaWpxd2hkMUV2MEw0aEUvendBcERlUW5YSzRa?=
 =?utf-8?B?Ty9sdDdRVDhFUnJkMHFMdUwzWGwxVE9nSVlhWE5JSjlpRUx3QnNacVJudlpy?=
 =?utf-8?B?SXE5M3YwaTNBMm5HYWJ1ZzNsVzZJejJxSnlJNFhEMHlRdFA5YTJrcjR6T0t3?=
 =?utf-8?B?bVdvNFJwUStBNUNGQ0Q0RUlmTVBrNkhIRWoyQzFYZjJuVlc3K0ppM2dyNWNa?=
 =?utf-8?B?LzNXaStoemlHWkFyaHZyVzB6QzV6QUk1ZHQ5ZTFpSnlVbFJNMHBsQW9JZ3RB?=
 =?utf-8?B?LzNHZ2xHVlc2TU1GQnZyS3M5Sjh3TUNJOGtadS9SLy8wclpaWXBSOWpBU0w4?=
 =?utf-8?B?Qkd3eHJ4VnVrMjExQ0tHcmc4UW96WjhtWVExY3I5SmFjczhkUjRRUWEyNXhh?=
 =?utf-8?B?U1FzYkZib0paZlp5aVFuTXFIRU5KL0FPaGlheVY1dWNMZVVkSnc0VWNpOFBw?=
 =?utf-8?B?c0Y3a3JKeGhsaWZKTmh0YjNNTXI2akM2U3BhR0liakFnK1RVcHBCWGk0Z2Jz?=
 =?utf-8?B?cU9weU00a0dCaHBNWWtNQWFKUmNVcjVFUTVZUGxXazQydVc4eDJjQWZWbkU0?=
 =?utf-8?B?cW5FT1hBbGNUdEJSQ2REN3dFMDJ6YmhaanJ5MGl5NCttNTk4akNpUy9ueXRo?=
 =?utf-8?B?YjY3U1Jyd21lZ1BoSm42a21pVUEwTWZ6WEUwSS85Z1lRVEhzcEJhc0tCWmtR?=
 =?utf-8?B?azZrb3R0WWJhN244VlFFVkl6RUdYZmxlbE5tSS9BL1RXNFVaL0Y4c05hTThQ?=
 =?utf-8?B?VS9IS2t4eWVkYmp3SmRqUWpRNVdPTFhmMzZGbThVSURQYTJLdDJwTndZMWVl?=
 =?utf-8?B?UDlqZ3ZvWkFMK2N3M3BqbFNZRmFSRmpOeW9iYmFld3BUdm1jcDlvdWVRd1du?=
 =?utf-8?B?K0RvdEFtdzRXcHBmWklKL2YzS2FDV0N1dTJ4c0phS3dHL3ZZS29lN0p1MnJU?=
 =?utf-8?B?L1JFWWt6eng0VVp4VG5xL1NiZzROQ0duSTlqVUtLYTZ0QVhRUGRKanQrM0pj?=
 =?utf-8?B?bGZuZE1WMXZORFBJZVcvV21DbUk2TGR2cGtrMmhaN292Z1dSZDd4b0JkSXNO?=
 =?utf-8?Q?X1RlC2aCwjUEwJw+rVjG7gb89brg5tMMkDWvKhJ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QVI0bUxXeUN3c1h5Lzh6VUF2SU1EVkZaTWtocTdidzV1YjNCN3ZyVU5OVXJ3?=
 =?utf-8?B?YmVIcmlMWHdzZ1NzdFlLb3RsSklyc2gwRVdsTytvWlhNSkZEcEFkMkV1WUQ1?=
 =?utf-8?B?NENLdE5Ta21IWFQyWmJIMUdlSVgzeFRWL1dGV1pvVlRrRWM3SmNyMmh4T1Jv?=
 =?utf-8?B?ZUFnYUdOeGRZVlMwY0wvZ09jcWY5NlZvcXEvTnlOQ2N1dGhycHBNSkI5OXZo?=
 =?utf-8?B?UVd1OFV5TmV0ZVN1TGVpN3ZGM1FzNlhVYTRYR0owSEJac3ZNbWxRaUtuQnll?=
 =?utf-8?B?NGFDenBIR01MWU1CWE9XeEtjUHlVUmQ3Yko0ZmExSkVZV2JhU3lYMHdpRlNU?=
 =?utf-8?B?M3JFb3A5dVJRV3lCRXN3UmJXazhlbENhTU5pY3ZudnJLUUJYb1krUWg4UXN6?=
 =?utf-8?B?RDZCNUx6QlIxSndHM05QZnM0UFZZaStsamh2aFU0T01GSDFnQlloVHBQUDBT?=
 =?utf-8?B?VnNtTEhHYnZsWjM3eWdTRGdJM21HOTk1OWxsY0Exank5UlZPdTQxLzM1ai8z?=
 =?utf-8?B?YjB5MXBIaFN0TUI5bjVMd01zemRGUnFXSVcveFBGR2lWWjF4YWFlVlhZUzA2?=
 =?utf-8?B?ZHc2QisrVVB4NEJtVC9aVExlSnFKdm5ZckZ5UXFVMnd5WFBRQXFiczExT3dt?=
 =?utf-8?B?K1hJVjc4eVR6VE5BSFZSSStEOU9xSWNtaTZiVk9TT3ZlWUd6bVFaUWtzQXhr?=
 =?utf-8?B?ZUtXaStTYzlWQ3EwbDBtdGxrNU55QVJodW1ic0dKKzdxVmZnZ2pPWjlhVFZL?=
 =?utf-8?B?dzlWK050c3p0QjB5cTFXa2FKZDJUNmFzMU5hNGpoMHVzTXZyZlpPbU1oZjNy?=
 =?utf-8?B?WVdFcERmclI4MDE4OTl4cDByZXR4T1dLTHh0aXFGdXp4T0p1N1dYc2oyMElj?=
 =?utf-8?B?d1AydUswT3EvNWpxZUdTQmFMR0tJYmRSdE51WnBabWpDd3FhWXlDdUdJVW02?=
 =?utf-8?B?TGQxdE9neGVYOGxqSXNRMGxOVHk2YjAvenMwNWlseFU0UE5kcldsanE2aUR0?=
 =?utf-8?B?K1NiM1JwL2hXOTlRWkh5MU5LbmwvWXlCQ2dzMUJFQlZudVA5RTlnZ0R2Y0o1?=
 =?utf-8?B?dE9XMG15d2pUdHd1aHlET05WMEh3NUd2TFJ2NEk5VDBsYnREek1BWmtSWkR1?=
 =?utf-8?B?ZmJuYnU5c0NxcEVZWnpiVXBTMW1tQUk3UFFPU2RNeG9lSHovUUlmR3NmVHZN?=
 =?utf-8?B?RUk4dzRGRlhvVWt2UkxMR05STzZGWWFHQXc1cnYvd1lqSVRVaWJ3N3BNUkhQ?=
 =?utf-8?B?YmxVWGFBMUpVb3o3TDYwdEcvUGlPRmdQNnhacGp2UDdsN2xIMElsWG9DQUtJ?=
 =?utf-8?B?U3Z1VjhDRzlPMEpZbW9UTzF5S1FJYWF0RzZGT3lSYXBnb29FNFNzWHJkYkth?=
 =?utf-8?B?U0ZGN0s1Vnk3RUYyZXdMOW1SOXdCQ2tFZ20zMUlnVDFORUxERmpCb0dNZFZy?=
 =?utf-8?B?Z2JEY2lNNG1TSzh4N2w0b1RMYXdRZmp2K1hMc01mKzBtMmx4eVFtSWk2VEdk?=
 =?utf-8?B?QTJYYTJPV2FkRjVqMWtiK21vTnNFMkg1WkRpblg1R09FeVhrTzFDTFhPVWJl?=
 =?utf-8?B?Z3RWM25RcGxKemVsejRDaXNvRExEN2ZNU1llKzcvRVVkMWllOTdGdXEvUUlU?=
 =?utf-8?B?ZGpFbkF2cE9iSlNZb2UreWF6L3pHSXp1dm01SllCNGM0MHVqRElKYTZ6eTUx?=
 =?utf-8?B?OWwrb2RGWkRvQUtNNkVXZENBTHAzZHB0bC9RbFlSU2tVc3l5TEQxNHplaHZ2?=
 =?utf-8?B?aGhNT1pvNWMxeEdkSmRaT2poSzNTd045S1Ntdy9hQXFyU2ZJL2tFSWxYRTFX?=
 =?utf-8?B?endNS3hJUW4zMVdsRHZwaFp2WnVNTVpxTklDVmU2TWZnMUxSbFJpNTQ1TElY?=
 =?utf-8?B?OVpyeDdaL1hSRkhMTjZKT3NmRUs2Rks1UWNWT0tTMC80OEhYcHR0UDZZeHpk?=
 =?utf-8?B?bnBKdXdNUWdzckFHZTNLWE9CYnJIOGNBeVl6TXNOVjgzclBEN1FGbmlUakZB?=
 =?utf-8?B?TTRINkFiandoZ0I4d2xIVWxyRVFIYk9GMTFJeHJBRVg5emNxQzFFNUxiMjF6?=
 =?utf-8?B?ZXJlVytUei9NMkVGVjU5cVlpYllUSG5MMXdBNEZhRnU5SmpCMENRd0tqc3Fm?=
 =?utf-8?B?RGhyUklUcG5kaE1WY21vN1V4VmZIQ3N0dkorVFo3TW9IaUZFc09SMnpMdjdY?=
 =?utf-8?B?d0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e70e6d9d-7c44-432e-c239-08dcf54bc28e
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2024 23:21:31.7541 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s6K/htiXBX4h8WeWWKJ59kRiCs8O2VJRZe40zEQF0QYo6rwjLpsMD2JGNcSNHLV5QTBjggeqghWs5r7jBb7r3CTv4CQwU/IndLuItRu4Cl8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5315
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

On 10/25/2024 12:59, Matthew Brost wrote:
> On Fri, Oct 25, 2024 at 01:32:33PM -0600, Zanoni, Paulo R wrote:
>> On Wed, 2024-10-23 at 17:41 +0000, Matthew Brost wrote:
>>> On Wed, Oct 23, 2024 at 10:47:05AM -0600, Zanoni, Paulo R wrote:
>>>> On Tue, 2024-10-22 at 16:27 -0700, Matthew Brost wrote:
>>>>> Short circuiting TDR on jobs not started is an optimization which is not
>>>>> required. On LNL we are facing an issue where jobs do not get scheduled
>>>>> by the GuC for an unknown reason. Removing this optimization allows jobs
>>>>> to get scheduled after TDR fire once which is a big improvement. Remove
>>>>> this optimization for now while root causing job scheduling issue on
>>>>> LNL.
>>>> I just tested it and it seems to do what it promises. Thanks! Having a
>>>> 5 second hiccup is still horribly bad, but it is - checks math notes -
>>>> infinitely better than waiting forever for a syncobj that will never be
>>>> signaled.
>>>>
>>>> This patch will *tremendously* help Mesa CI, since we can reproduce
>>>> this bug all the time with Vulkan CTS tests.
>>>>
>>>> Suggestions:
>>>>
>>>> - Can we get a message on dmesg every time this hiccup happens? We're
>>>> not sure if it's happening on real workloads on people's machines, so
>>>> maybe having some sort of indication "oops, we just unstuck the batch
>>>> you submitted 300 frames ago!" would help.
>>>>
>>> We will add 'notice' level message if this occurs.
>> I may be wrong, but from what I understand, 'notice' level is something
>> that will *not* show up on people's dmesg if they are using distros'
>> default config. This message signals a bug is happening, we need to
>> make sure it appears in dmesg by default. The whole point is to be able
>> to figure out if this is happening in the wild. Can we promote this to
>> KERN_WARNING?
>>
> I'm honestly not sure what shows up where. 'notice' is same level as our
> job timeout message though. If we need to raise this level, the job
> timeout message should also be raised. To be safe, will roll both of
> these changes out in a series - I wanted to refactor my latest rev of
> this patch anyways.
>
> Matt
These are two different things, though. One (job timeout) is reporting a 
bug in user code, the other (job not started) is a temporary hack to 
workaround a problem on a specific platform. Yes?

My understanding is that bad userland is not supposed to generate kernel 
warnings. A warning (or error) is reserved for something that is not the 
user's fault but is a problem with the system. So the regular job 
timeout should not be at warning level. The temporary hack on the other 
hand, could be (if I understand the change correctly).

John.

>
>>>> - Since we don't know how long until the real fix, can this be tagged
>>>> for stable? If it turns out this requires special GuC, it would be even
>>>> more valuable to have this in stable since those tend to take more to
>>>> propagate to people's machines.
>>> I don't see any reason why this can't be backported, will include required tags.
>>>
>>> Matt
>>>
>>>> Thanks a lot!
>>>>
>>>>> Cc: Paulo Zanoni <paulo.r.zanoni@intel.com>
>>>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>>>> ---
>>>>>   drivers/gpu/drm/xe/xe_guc_submit.c | 4 ----
>>>>>   1 file changed, 4 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>>>>> index 0b81972ff651..25ab675e9c7d 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>>>>> @@ -1052,10 +1052,6 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>>>>>   		exec_queue_killed_or_banned_or_wedged(q) ||
>>>>>   		exec_queue_destroyed(q);
>>>>>   
>>>>> -	/* Job hasn't started, can't be timed out */
>>>>> -	if (!skip_timeout_check && !xe_sched_job_started(job))
>>>>> -		goto rearm;
>>>>> -
>>>>>   	/*
>>>>>   	 * If devcoredump not captured and GuC capture for the job is not ready
>>>>>   	 * do manual capture first and decide later if we need to use it

