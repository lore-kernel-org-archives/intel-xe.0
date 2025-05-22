Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B6F5C54E65
	for <intel-xe@archiver.kernel.org>; Thu, 22 May 2025 21:27:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF02B10E0F0;
	Thu, 22 May 2025 21:27:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wz0MLC53";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AD0210E0F0
 for <intel-xe@lists.freedesktop.org>; Thu, 22 May 2025 21:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747949255; x=1779485255;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=oTcF3kYk/bnmvF1Xw7YyjwDrDNtHe/DYf01+wL83vvs=;
 b=Wz0MLC53uRnZB+WQBs3hFwJNCIIoYjd8oTVaIgN2hQgScU6cQzVI11y9
 7xNEISRM2T0FwKj6nGYTMr2bn2nhZzRlJvNrsopQtNf+mCV026e5b4qmM
 7Fvf5zfW9BWWynkRD2JIW3LTQqWA88l99pfpO/oFY8CXRH/kA6KQRlLKl
 3VVJsJLts4WsDskIC4xaI21gVPUK8TpHafrWZJ4QhLl/PO8cVKrFLCT33
 Lb0x5sEBSzZStpHVbVhh8zm/EMIyGppzxD523Q5WzutuGGBFp2o8Zrlku
 6C8oXuvC0zbwRQPtuClzb/+zporc9ODNtQ6PSz5MbIU09s155R3XwEhfz A==;
X-CSE-ConnectionGUID: 3XXuLQQmTTGkd/Sr2io2oA==
X-CSE-MsgGUID: Dvl45jlyQsWwnc5tPAyAvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="52625349"
X-IronPort-AV: E=Sophos;i="6.15,307,1739865600"; d="scan'208";a="52625349"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 14:27:32 -0700
X-CSE-ConnectionGUID: 2RGcW8EfRm2UGo3IGeQfKg==
X-CSE-MsgGUID: JSos1beZSCehrTZO5m0kwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,307,1739865600"; d="scan'208";a="141298432"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 14:27:31 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 22 May 2025 14:27:31 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 22 May 2025 14:27:31 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.64)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 22 May 2025 14:27:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NDurmgA3r44PXHtqrdtanYRGJZ9JstmXiH+PEiU3+a0iqproohxoazWVKLqZJQJR/K7pzOJoGfp7M9mT/V1FwzkBwth7l5kNFo3QdSrKRj7wXuV5rWTHGy+x2JO9y3rfUBS7aTTLONzUrqQ+G0yLctw6Fp+XNHd8Is5vafGWTw5feag0iKxy1NzCACD1mvG8p/5kj7S65vtOFXqxaU9aoAikIyQT/rIdEqO1GGQw/AEJwgIEaOGjq6HL7RpBJT6WoyB6uhke00fWQUtPcWSDunmVc06stJzFl5sPfUm4Yo7jE0ZQUEWe0Lm9YTUOpEQ4x94nWUVERtmiU/bL3tw5iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e5giV3WeMKy0esGc8x5tdoMG2CGJGmFhDHHMZ5VdyaU=;
 b=TdTlVtioyj6ON3HXtLhMyNdAKcRqxSfQWseRZDLLcpDpZWKV54jT1fdJtLX6E4JFtcYgBwol6y/cysLFOKMSyh/XdBmWmnbSor0VI5yxy417XYBDnuYetPoVwsQ7iTifHikqGhrU/+yreuhnYSgiQsYVk2ErAQ6yJP0XQeizOQ4zhXo8r8X3wPb/T4QrvnNTcJcFoWWi4LC+dUv0DE5HCeMKplRaXUZmAwojAVsp+z2a/0o1O54exQAVEx0XU7el7yTM6vw80WKGa0nr0lDLv5AHKRHc1vXTJVUfEVDIbtYbWRxql92pwnt56u6Vwm/hmkZkebd9ZSsDxmTAT70LLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by MN2PR11MB4664.namprd11.prod.outlook.com (2603:10b6:208:26e::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.20; Thu, 22 May
 2025 21:26:48 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%7]) with mapi id 15.20.8769.019; Thu, 22 May 2025
 21:26:48 +0000
Message-ID: <c33e0a6d-b4f8-4bb1-9046-ced814253b88@intel.com>
Date: Thu, 22 May 2025 14:26:45 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] drm/xe/pxp: Decouple queue addition from PXP start
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20250522204602.3921904-5-daniele.ceraolospurio@intel.com>
 <20250522204602.3921904-8-daniele.ceraolospurio@intel.com>
Content-Language: en-US
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20250522204602.3921904-8-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0175.namprd03.prod.outlook.com
 (2603:10b6:303:8d::30) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|MN2PR11MB4664:EE_
X-MS-Office365-Filtering-Correlation-Id: 48f57007-e5e9-403d-7e46-08dd99775be0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RElIODdBY3hCdS8ydTh1U0tya2NoWjBRbGo3b0FpalM1Uy9OL1g2QnAvSzRH?=
 =?utf-8?B?c1pEeWsyeStPYXdTMXlaeWdkaVF3YlFFSVB1NnAvZEljbE5SbjdjbmorMjVI?=
 =?utf-8?B?eVA0UkpwcStVbWpSWnFtU0tETUtaQlBVTmlJODBwTnVFeGxzWmg2TUt1TklX?=
 =?utf-8?B?akNLZCtHU2tNL3VZalpkWlpxbXhGVWxxeGpzeDZBSEpmL0hwejdxNFZkQVRS?=
 =?utf-8?B?cElqNjlUU0ZBUEMxN0QrQk95TlZlR2RqUTVkaEZ6YlJYblMzWEk1c3U1VUNV?=
 =?utf-8?B?ZDhPVDJMVEdWL0xTRllKN0h1OWRrVVBEbzdQQWpKYVlHakFBcGkwSk5ITGov?=
 =?utf-8?B?MVY3VmdHeS9jN0pSSy9JZDZwbzFwSC96eXI1cXdaR01rR29XTlFFOUFpV0hX?=
 =?utf-8?B?V2NZQTBaY1plbVpEc3JuOGVhVmY1UGJ1MDRPWDZldytGUTVOTnZNUXk5WFlE?=
 =?utf-8?B?OU1DWVoxTWpsN3NaNnVqT1RYc2R1UTI3d1pseklGQ3lKbGI0RC83Zk9jR0xL?=
 =?utf-8?B?eENiZ1ZRRS84M2I1L09lTStnaUpGYVF2NzVBTzZvWEpESjg5cFYyM2k1SWtE?=
 =?utf-8?B?QkxIbHJFNUZlT2d6MmkzYTNZa0RHbnpIcDBlRUhUNFg4Vkl4eExHeTJmUnR1?=
 =?utf-8?B?eDk3c2JkUnpNc3VDSnhiY0NvRXRmYlVTRUMzeUZvMmpUaGNLaTJEWWxhamVC?=
 =?utf-8?B?RFRBUDJsT29EWk81TjhNMlFxeEg4eWlnSktoTjRITzZkZlBxNWw5alBvMFp3?=
 =?utf-8?B?OE5XVUsyVDNPSnF2YnBWZkJPNnlLM245WlhQazVxV1pETmNJSUgxU21zYXNx?=
 =?utf-8?B?WHFJaWlkbElNMklsVkxLVnNLOGRoN1NXajdNa3JYanpLZ2V1eW5jVm53UFla?=
 =?utf-8?B?dmREd0pscGY0bzhyeXVzbGpSUituM2xSZUM2dURnN293NXRLejZlS2xsdFdG?=
 =?utf-8?B?V1o3QkZDOUtVV2pDTk94d25HWFp4K2lIbUUwd1dEWUU0REc4UjFEZkRSVEU4?=
 =?utf-8?B?KzZKWjc2N0tDRU8yemEvWUtIeFRJNDcwSFUzOHU0Zm5hOXNDTFg3ZjdtRzE4?=
 =?utf-8?B?VGJoa21Ka3ZlektrNlpBMFp1b1c3QjVsWi9aZGhVMllhUTEwRThGeWV6c0k2?=
 =?utf-8?B?QXExZVBqc2JieUV0YTN1MXlUeGNsZ0VwZmIyZ21mZkZ4bU1XVDZYY3c4WUFi?=
 =?utf-8?B?M2lyTmpxZy9JaWtIRVhoQjhrOE9pMVQwRjFhN0UyMkdKNDNKQlpqQytDVVla?=
 =?utf-8?B?L25lYTVJaTEvVCtrWXlPcGltb1NmS0xOOWtoZ1d4b1BOTU54Y3o1SGlJNzY4?=
 =?utf-8?B?bkdOOWowTHhrN3psZGVNZmJoQmMrWXdzMkFzQmxkTUJqMEZ3Y0lKNlVlOFUx?=
 =?utf-8?B?MllYQTZxeWVaS2IveG1RYXdNQ1RkcXIwMXNiS2VqZlYxdjBaNVZqMHN2OE04?=
 =?utf-8?B?SzZBUEhMQ09lZDBVYkM3Z1JEMDBtUUpHREVPNmN4czV6ZmY4dHRjMFl1dVpF?=
 =?utf-8?B?MThzVkFYTVI5SXN3TVBqQnNyWFN3Y3dvZzkxZHo3UXRHL3cyb1NTL2xRcllY?=
 =?utf-8?B?ZkZ3QjZPc3Y4RkhGQ093QVJVMTc1cWE2WHFGKzkwVzN3cGVmMW5Mbksxc0ta?=
 =?utf-8?B?MCtwcll5M2dUZ3VvbjZnN2l2YzNkZklhdFIyd0F3ay9CanFEMGVmK1l1elVT?=
 =?utf-8?B?RHBkNXBBL3JmM1RFZDZLb3hNUitUdE1CQVgzNjVsNGlIdGFTOHNiaUIyY0RL?=
 =?utf-8?B?QTB5YUVISDkrZ2lYL05QYVVORVhCdHpOWHROQlhoQlVUTVExT1UzYWFZZkR2?=
 =?utf-8?B?V0xEMUlIMUl2UkVsNDBuSUwvNklicklQZW80Wkd2dllZM2pleUUwVjFIMUN0?=
 =?utf-8?B?NmNjcms2TGliQWRzeHl5Z000aCsxeksrL2VpRTVnL1AxRDFDTWg2cnIzUW5N?=
 =?utf-8?Q?qgdxSOajEs8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MWJ3cktPMU1JQzdPTHhKaVR2RGZUSnRKTUdtVlI3Zzluaks2VXZhMU5EUHJm?=
 =?utf-8?B?UWhVY2gzOVFrUHE1LzI5Qnk0M01NbzJyTEcwNmJUaC9qS3RGK0VSbjU2UVFB?=
 =?utf-8?B?MUExTEx2R2FFZnpZVkxyNzNtOWo2NjdBb0QvTmpHaVk2N0VYdDJnVHRxR2tJ?=
 =?utf-8?B?OVA2L3BMOXdNQjFBaDQzZDYwSFo2UjlBd0c5ZkRWTGVJVWdTOWd3aDkrbmV0?=
 =?utf-8?B?RVN4bnA5SThHSzZLTWtpaTFsRi9BeWxHdkNHaGprZjIvTy9hQUwveEsxWGxL?=
 =?utf-8?B?ZC9KRGEvWGFkVUFwUlY2bVVkcFZhcTh2U1M3TWIzKzhRZ0ZPVHMzalBGdUNm?=
 =?utf-8?B?QXBxVnFCQ2JMSkcra05Vc004TEhMWEZVZEdnNThsMlgyQkF6aE54U3VtZUJY?=
 =?utf-8?B?RXp0UG5iOXphZnZGQ1ZIbHhEMXBIYmNUZUU1MU54eDJRNmoxa1VwMTNFQThY?=
 =?utf-8?B?Snp0S0x5ODNJSS9VampUOWdENTZJWm9YeEpTVHZjTitWdnVrRGZYWW9uOWNC?=
 =?utf-8?B?SEc3d2RlU1V6V2c2TlFaTGFOQ0t6NlYzdGluWWIzRHBkTE1FUVkzS2pnUllh?=
 =?utf-8?B?NlBpTk93RFpTTDVUQWJaQWdaVURjMmxrSGFMT1BFejY3SWtoQ0NRMVU3d2xG?=
 =?utf-8?B?U2d5OGx1dGNpUm9pQjM0TGRVTGdVMUhONGE0ZjQwMTBVOWY0TjhZMS9sOXY2?=
 =?utf-8?B?YXc2ZlVtd2ltWHo3QVV3MEk3ZGlpTmdjRTREYytTKzc3VmFnVmN4QytkVnRX?=
 =?utf-8?B?c2ticmM2L25ic0FQZTc3SHByWkFXdEd4YlBWaXhIdEE3MXFSWGtkRHRLU2I0?=
 =?utf-8?B?ZmxDS1U1S3NWbHV6U2ZuZHBuU3VDWUVldHcwY0hzRnd4OXE4dUt1bzNtOCs5?=
 =?utf-8?B?TU9nUk51RG82NjRjRytUdHpoR25HZnRKV0poOU9vU2ZFVGJ5dmdaNVU3Q3py?=
 =?utf-8?B?bVBpNXNZZTk1WWI3SDQ2YWVLMDc2c0FqNkJCL1pxUU04R1dIVlF0UmhHV1l6?=
 =?utf-8?B?UlFvcEJMTnFWeGtGTHNqSGRIR1VLdmFRSE83RVVmdVpsRkFyemx3NUlLa0xI?=
 =?utf-8?B?VDJleFZmWEIrNktURjM3YWE2Qk9xODlTRGlOQWNBWWdhL2pmaGoxanBIdDEz?=
 =?utf-8?B?V2RsTHhKc29McXVWaDF2TDk0cUdzQVZmT1U1Q21MMmVTdFppTUdaQ09aTEZN?=
 =?utf-8?B?RUpJTTVLRWVJemZkcEtFaFRJMGlXMFU2ZUthOVFLaEJlSUVLcUtQZS82bEQ5?=
 =?utf-8?B?RXJyYWJvTEZhWFI3MkhldHprdVpDdEZPeXkwM1h6aWtiaXBWSUpvQnluN2xZ?=
 =?utf-8?B?NURzdllQMDRBT096TkdjVFliVzErUDRnQ0xTNkVjUTlhNitXbjR1VEtUME1v?=
 =?utf-8?B?OWNyZlJnNmJ4cTBlb1djOVgzekJRNytWSnFWUG02WWJ0cnlMRnVIemtGUXJB?=
 =?utf-8?B?SjQreER1TWxSMzBraFZvdkJjY0lxdUgvTEpROHcxZGFrRkE1NFNRVnVLMlJU?=
 =?utf-8?B?RWwvV0xSeGFpSGZUMUJub1ZRNGVFb0x0U1FXWjhGNmNrSGt3cUl4amxZSkJn?=
 =?utf-8?B?L0RpOTlrcFVWeHFrMlNRRlNkck1CeGJXRmloMXpacEZ4U3d2M2RYbk9KSStY?=
 =?utf-8?B?RVl6MDQrM3dxbzF0bE5BTU9oVlRpQXZHd1M5RGo5eUM4Rkt2REpZOFI5eUJp?=
 =?utf-8?B?dGViTnJhNlpBa2RndUJDak9hWFRlUnZWYUN1TzE2b2FNdkpUM3UrTytlRlBQ?=
 =?utf-8?B?bUFKNXhwZXo1Q3ltOGd2eUlGL2lsWUpOb2QydVdONlpJRC8vUFhIb0htWllJ?=
 =?utf-8?B?WGdSSW9iWEZ1dlY2dXd2eWRJVFFXZ21pMUtxWTZ6VElmTzFHbkxBLytCV2U3?=
 =?utf-8?B?N2FFaVZ3UWlwNmNKalNVZnlqWHRKdjJydHFveU5LZjBoYkNMTGlLYmFaQXpo?=
 =?utf-8?B?cnhWbkQ1ZWhreFovTzRENzA2Snp0UWtHUUF1eFNDd2VlZ05JRUVyVm1QMlpy?=
 =?utf-8?B?bDlaMkdNallMR1p0OGpOUWNlSk93M2JSOXRQeVArdGYxVnBYTnpxeGpWUEtJ?=
 =?utf-8?B?V2I4Ukp3ZkZRNldGbW5XWjNnaWNYUEFETlJqSUZNaHNGZGlNVFBFTXhoalRo?=
 =?utf-8?B?aEJnU2JhTkVPZnNtWHRUZDI0Z1BFdTZPNkVsY1JoclhBd3ptUGsxbUNrWnUx?=
 =?utf-8?B?d3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 48f57007-e5e9-403d-7e46-08dd99775be0
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 21:26:48.0229 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S1a9RyCVacwiDCPixT8SW0MUwUgHHseZ40qm4HUgvsjeGxQQ6NND67TfZlOsS94clFmrfjkD/58zDTjEjDK3olBWgZEQtyrNxrJtl1Ti0qg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4664
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

On 5/22/2025 1:46 PM, Daniele Ceraolo Spurio wrote:
> Starting PXP and adding a queue to the PXP queue list are separate
> actions. Given that a queue can only be added to the list if PXP is
> active, the 2 actions were bundled together to avoid having to
> re-lock and re-check the status to perform the queue addition after
> having done so during the PXP start. However, we don't save a lot of
> complexity by doing so and we lose in clarity of code, so overall it's
> cleaner to just keep the 2 actions separate.
>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>   drivers/gpu/drm/xe/xe_pxp.c | 143 ++++++++++++++++++++++--------------
>   1 file changed, 87 insertions(+), 56 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_pxp.c b/drivers/gpu/drm/xe/xe_pxp.c
> index b5bc15f436fa..32ee38e11811 100644
> --- a/drivers/gpu/drm/xe/xe_pxp.c
> +++ b/drivers/gpu/drm/xe/xe_pxp.c
> @@ -504,36 +504,41 @@ int xe_pxp_exec_queue_set_type(struct xe_pxp *pxp, struct xe_exec_queue *q, u8 t
>   	return 0;
>   }
>   
> -static void __exec_queue_add(struct xe_pxp *pxp, struct xe_exec_queue *q)
> +static int __exec_queue_add(struct xe_pxp *pxp, struct xe_exec_queue *q)
>   {
> -	spin_lock_irq(&pxp->queues.lock);
> -	list_add_tail(&q->pxp.link, &pxp->queues.list);
> -	spin_unlock_irq(&pxp->queues.lock);
> +	int ret = 0;
> +
> +	/*
> +	 * A queue can be added to the list only if the PXP is in active status,
> +	 * otherwise the termination might not handle it correctly.
> +	 */
> +	mutex_lock(&pxp->mutex);
> +
> +	if (pxp->status == XE_PXP_ACTIVE) {
> +		spin_lock_irq(&pxp->queues.lock);
> +		list_add_tail(&q->pxp.link, &pxp->queues.list);
> +		spin_unlock_irq(&pxp->queues.lock);
> +	} else if (pxp->status == XE_PXP_ERROR || pxp->status == XE_PXP_SUSPENDED) {
> +		ret = -EIO;
> +	} else {
> +		ret = -EBUSY; /* try again later */
> +	}
> +
> +	mutex_unlock(&pxp->mutex);
> +
> +	return ret;
>   }
>   
> -/**
> - * xe_pxp_exec_queue_add - add a queue to the PXP list
> - * @pxp: the xe->pxp pointer (it will be NULL if PXP is disabled)
> - * @q: the queue to add to the list
> - *
> - * If PXP is enabled and the prerequisites are done, start the PXP ARB
> - * session (if not already running) and add the queue to the PXP list. Note
> - * that the queue must have previously been marked as using PXP with
> - * xe_pxp_exec_queue_set_type.
> - *
> - * Returns 0 if the PXP ARB session is running and the queue is in the list,
> - * -ENODEV if PXP is disabled, -EBUSY if the PXP prerequisites are not done,
> - * other errno value if something goes wrong during the session start.
> - */
> -int xe_pxp_exec_queue_add(struct xe_pxp *pxp, struct xe_exec_queue *q)
> +static int pxp_start(struct xe_pxp *pxp, u8 type)
>   {
>   	int ret = 0;
> +	bool restart = false;
>   
>   	if (!xe_pxp_is_enabled(pxp))
>   		return -ENODEV;
>   
>   	/* we only support HWDRM sessions right now */
> -	xe_assert(pxp->xe, q->pxp.type == DRM_XE_PXP_TYPE_HWDRM);
> +	xe_assert(pxp->xe, type == DRM_XE_PXP_TYPE_HWDRM);
>   
>   	/*
>   	 * Runtime suspend kills PXP, so we take a reference to prevent it from
Just spotted that this block of code needs to be removed. It is now done 
at the level above in xe_pxp_exec_queue_add() and therefore should not 
do a second pm get at this level.

John.

> @@ -543,30 +548,24 @@ int xe_pxp_exec_queue_add(struct xe_pxp *pxp, struct xe_exec_queue *q)
>   
>   	/* get_readiness_status() returns 0 for in-progress and 1 for done */
>   	ret = xe_pxp_get_readiness_status(pxp);
> -	if (ret <= 0) {
> -		if (!ret)
> -			ret = -EBUSY;
> -		goto out;
> -	}
> +	if (ret <= 0)
> +		return ret ?: -EBUSY;
> +
>   	ret = 0;
>   
>   wait_for_idle:
>   	/*
>   	 * if there is an action in progress, wait for it. We need to wait
>   	 * outside the lock because the completion is done from within the lock.
> -	 * Note that the two action should never be pending at the same time.
> +	 * Note that the two actions should never be pending at the same time.
>   	 */
>   	if (!wait_for_completion_timeout(&pxp->termination,
> -					 msecs_to_jiffies(PXP_TERMINATION_TIMEOUT_MS))) {
> -		ret = -ETIMEDOUT;
> -		goto out;
> -	}
> +					 msecs_to_jiffies(PXP_TERMINATION_TIMEOUT_MS)))
> +		return -ETIMEDOUT;
>   
>   	if (!wait_for_completion_timeout(&pxp->activation,
> -					 msecs_to_jiffies(PXP_ACTIVATION_TIMEOUT_MS))) {
> -		ret = -ETIMEDOUT;
> -		goto out;
> -	}
> +					 msecs_to_jiffies(PXP_ACTIVATION_TIMEOUT_MS)))
> +		return -ETIMEDOUT;
>   
>   	mutex_lock(&pxp->mutex);
>   
> @@ -574,11 +573,9 @@ int xe_pxp_exec_queue_add(struct xe_pxp *pxp, struct xe_exec_queue *q)
>   	switch (pxp->status) {
>   	case XE_PXP_ERROR:
>   		ret = -EIO;
> -		break;
> +		goto out_unlock;
>   	case XE_PXP_ACTIVE:
> -		__exec_queue_add(pxp, q);
> -		mutex_unlock(&pxp->mutex);
> -		goto out;
> +		goto out_unlock;
>   	case XE_PXP_READY_TO_START:
>   		pxp->status = XE_PXP_START_IN_PROGRESS;
>   		reinit_completion(&pxp->activation);
> @@ -586,8 +583,8 @@ int xe_pxp_exec_queue_add(struct xe_pxp *pxp, struct xe_exec_queue *q)
>   	case XE_PXP_START_IN_PROGRESS:
>   		/* If a start is in progress then the completion must not be done */
>   		XE_WARN_ON(completion_done(&pxp->activation));
> -		mutex_unlock(&pxp->mutex);
> -		goto wait_for_idle;
> +		restart = true;
> +		goto out_unlock;
>   	case XE_PXP_NEEDS_TERMINATION:
>   		mark_termination_in_progress(pxp);
>   		break;
> @@ -595,29 +592,25 @@ int xe_pxp_exec_queue_add(struct xe_pxp *pxp, struct xe_exec_queue *q)
>   	case XE_PXP_NEEDS_ADDITIONAL_TERMINATION:
>   		/* If a termination is in progress then the completion must not be done */
>   		XE_WARN_ON(completion_done(&pxp->termination));
> -		mutex_unlock(&pxp->mutex);
> -		goto wait_for_idle;
> +		restart = true;
> +		goto out_unlock;
>   	case XE_PXP_SUSPENDED:
>   	default:
>   		drm_err(&pxp->xe->drm, "unexpected state during PXP start: %u\n", pxp->status);
>   		ret = -EIO;
> -		break;
> +		goto out_unlock;
>   	}
>   
>   	mutex_unlock(&pxp->mutex);
>   
> -	if (ret)
> -		goto out;
> -
>   	if (!completion_done(&pxp->termination)) {
>   		ret = pxp_terminate_hw(pxp);
>   		if (ret) {
>   			drm_err(&pxp->xe->drm, "PXP termination failed before start\n");
>   			mutex_lock(&pxp->mutex);
>   			pxp->status = XE_PXP_ERROR;
> -			mutex_unlock(&pxp->mutex);
>   
> -			goto out;
> +			goto out_unlock;
>   		}
>   
>   		goto wait_for_idle;
> @@ -639,27 +632,65 @@ int xe_pxp_exec_queue_add(struct xe_pxp *pxp, struct xe_exec_queue *q)
>   	if (pxp->status != XE_PXP_START_IN_PROGRESS) {
>   		drm_err(&pxp->xe->drm, "unexpected state after PXP start: %u\n", pxp->status);
>   		pxp->status = XE_PXP_NEEDS_TERMINATION;
> -		mutex_unlock(&pxp->mutex);
> -		goto wait_for_idle;
> +		restart = true;
> +		goto out_unlock;
>   	}
>   
>   	/* If everything went ok, update the status and add the queue to the list */
> -	if (!ret) {
> +	if (!ret)
>   		pxp->status = XE_PXP_ACTIVE;
> -		__exec_queue_add(pxp, q);
> -	} else {
> +	else
>   		pxp->status = XE_PXP_ERROR;
> -	}
>   
> +out_unlock:
>   	mutex_unlock(&pxp->mutex);
>   
> -out:
> +	if (restart)
> +		goto wait_for_idle;
> +
> +	return ret;
> +}
> +
> +/**
> + * xe_pxp_exec_queue_add - add a queue to the PXP list
> + * @pxp: the xe->pxp pointer (it will be NULL if PXP is disabled)
> + * @q: the queue to add to the list
> + *
> + * If PXP is enabled and the prerequisites are done, start the PXP default
> + * session (if not already running) and add the queue to the PXP list.
> + *
> + * Returns 0 if the PXP session is running and the queue is in the list,
> + * -ENODEV if PXP is disabled, -EBUSY if the PXP prerequisites are not done,
> + * other errno value if something goes wrong during the session start.
> + */
> +int xe_pxp_exec_queue_add(struct xe_pxp *pxp, struct xe_exec_queue *q)
> +{
> +	int ret;
> +
> +	if (!xe_pxp_is_enabled(pxp))
> +		return -ENODEV;
> +
> +	/*
> +	 * Runtime suspend kills PXP, so we take a reference to prevent it from
> +	 * happening while we have active queues that use PXP
> +	 */
> +	xe_pm_runtime_get(pxp->xe);
> +
> +start:
> +	ret = pxp_start(pxp, q->pxp.type);
> +
>   	/*
>   	 * in the successful case the PM ref is released from
>   	 * xe_pxp_exec_queue_remove
>   	 */
> -	if (ret)
> +	if (ret) {
>   		xe_pm_runtime_put(pxp->xe);
> +		return ret;
> +	}
> +
> +	ret = __exec_queue_add(pxp, q);
> +	if (ret == -EBUSY)
> +		goto start;
>   
>   	return ret;
>   }

