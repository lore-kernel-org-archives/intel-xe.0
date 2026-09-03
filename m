Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E722C61DD3
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 16:14:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2478710F6CC;
	Thu,  3 Sep 2026 16:14:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bcSffvFA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB40310F6CC
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 16:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788452094; x=1819988094;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Avs7zfNcdVTDYZLjd89gruavcIZZoOZwNlcMJ6xV1dM=;
 b=bcSffvFAgoKe+d3A8jfHasII3xfjBhdLW4NITWQpKwodwribhAyVrmCj
 Tpjt67LVBDjfULPhJAXLaMuNUqCwPsBT7LAwNFaJ8McQevGbeSSWwrs7F
 iK6BUewpUMOghpJArTK98ZMp0KH4j+WD0m1FQliTFCkyGUUK8aTHDM39f
 HLFE9q6R/zP41/rJfl0CG0qMAouRG2UdyUAkOY4xPu5za6nXtRlJrKM4t
 ngXLPUYvaDvCNo0o9P4ZcNUWilbI4PdkQ3/jaeeGxbwzYPlSi1z8QyEuC
 XQWnF2eF/ybyKP//XvaX1a22/cEJfLkVKNmSi0WXpxUougnAyH21v70bh w==;
X-CSE-ConnectionGUID: q/u7Qb9KSLiIneyIPA3ytA==
X-CSE-MsgGUID: 8V7QnyVVSzaA4zj++6N+lA==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="100299063"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="100299063"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 09:14:54 -0700
X-CSE-ConnectionGUID: pN/q1UVcSKu0oDQF9wSuaA==
X-CSE-MsgGUID: zAEmxP3KS1Gx95jI76w2Ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="269760659"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 09:14:55 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 09:14:54 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 3 Sep 2026 09:14:54 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.53) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 09:14:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KlraAs88OLXRk7+m8jg/8NMYJx7GaXzl3e1HQptEGmUCuTJkvIDy1ppVzoVLnk0mprU9lh0GwydtDrMLO5IoukiBJwVhHIJ9UErQ2l3WM1xFhDfwWJvt8YdAipuXlXO1Q4dRlJ+/E+1ISx2Xm9XNCzek3AcmGQ36EeO+R7UdO71e+mzOTr1a2z81+Z3EYqDjKC/tUQAZK/aV+K3AYGUr06nzjNFQzWNpA9ZpdZnfjs0iaEMEzquDkpiaxVM3lslCQERif+iIuUbvevUYOI+A/vc/3LC+QnUHB5o30MZlwCy5M1nSAnK1rTpUiKPaSakvoakdS6tI2YJur8ot06DgAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fhwtCdIO1otGl6YBfJNwuniRwSE1rGj4rBcAThDuT08=;
 b=ZlZOkP3RkwBbcXHSE9CtrNxDf5Jn5O1RXdmDL1X/y7Q0lkJ4ncxrQCIRiOOPS2915WkN0dqvhCmwPRdSQJiCZxKzyoxbNJ/PlvZIBD8LDye5SnMsmrthk9yqOTj1TYevwOUndwJaaOCOGsiN7Kt3eqEcl0KyhsiqWKoVjfmlbvnLUeHcL0dnoFxTbtQH0OHfynqayMgQ7XfSOMcPxzNW9T3xiGv/3+2PMlYA5HuVEZN8OG2k0ISBJNsSThif9ktqjac/dr/baRpRd3Z3xeCJo6+38/d59ZsyJk3Y3G1HsrIlZ4+C6p1r2m9MN1x2sNz4rX3hXx69GzvqGxdFfTivvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by BL3PR11MB6505.namprd11.prod.outlook.com (2603:10b6:208:38c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 16:14:45 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 16:14:45 +0000
Date: Thu, 3 Sep 2026 18:14:41 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Ville =?utf-8?B?U3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>, Maarten Lankhorst <dev@lankhorst.se>
Subject: Re: [PATCH v4 1/3] drm/xe/ggtt: Split GGTT into usable and shareable
 pools
Message-ID: <20260903161441.dw2jflcwa45wqq7m@intel.com>
References: <20260901164435.1395260-1-piotr.piorkowski@intel.com>
 <20260901164435.1395260-2-piotr.piorkowski@intel.com>
 <bf17ea90-0ce4-43ff-95ea-4f3fa9f60511@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bf17ea90-0ce4-43ff-95ea-4f3fa9f60511@intel.com>
X-ClientProxiedBy: DU7P195CA0014.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:10:54d::25) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|BL3PR11MB6505:EE_
X-MS-Office365-Filtering-Correlation-Id: ee7e16b9-29a6-49cd-57f4-08df09d6780d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|6133799003|18002099003|22082099003|56012099006|10067099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: j4zLgiPk/5yuPjivGzXgH0AEFn3vi4sX3Y4wD7tuys+LNOaqaF8QBVaQZdOurCjKHipjB1SMfngtI5e637B+TIj6Gx5PchtJFFztBGtClAtIG1L2bd9KNy4t92izAHw3lpbkIKBg3VrDTSfMZcUha7P569JKfwgP1QtS7U8o5m8tKq5bWubKWlNz9AuFoHVmzubPBDax/IZnMH5zYEcGazNf1HfFv0nu9MeAyL3VWunoqQ+iRZwMA9FgY/WuQ7ZIhEW7NrU5rK5jFThbOMbkh1UQNRkr72T+ScMnKY6fcasmnwYW0sSIkkJA+u0Mxf4qQPbEe/rL12e6cZjQ3YR9aRoBKqSOIbn/v3fGuba1LpSP3ncMtlGTT1ZoT8Q3eSOw1LgukELEOLam66MMj5oCTxa8hBresHk/1+2DQRUcxVWJzCKMubS4pztzBWp6vp85PB+4eh/gNbkcLmcckKGOwA5wMv6SE5EDH1Rw/Hz4B8PAL1DNQ545U2BPH3D4ktE6ls1qOVgFa7EAlHm8RgIL9DlhQqAxQGlb4+fTrAXRA7QfY7QFrqCJ/0hXQu51DyTGdKpK8++pRMQnZ38Ntk0s3XgXbJlQd4tq0IKJtonAtWNqVqLcsxkjlbZ4XYf+Wi3xt0NdjNBLF3isXM+zIgSPL5/iVrTES7SIYE6eNZMWu5M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(6133799003)(18002099003)(22082099003)(56012099006)(10067099003)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V3lEdnNvNVVhTjE4SWNNS3hlc1FnUUlhdUFWTTFRZzBBa2h5UUFRdXIzVGdt?=
 =?utf-8?B?cmpLeHJwQUpmYnFMT3dMYVhnSjhNWjlJek9CRG5BOHVqdGVtend5UTFnQWRN?=
 =?utf-8?B?K2pEVlRsSW5XUkdIemQ1ZldNNFArV0thRVBFTzJSc0lxcXRkbjNCeE54RVpj?=
 =?utf-8?B?WThnNlcvSEdsaUlyS1AzVjVqKzdTMGJZV3UwRjRUc0hMZFZ3czlaaHowRlRG?=
 =?utf-8?B?SHIzeW1yd3RraDVDQnRMcHBHNE84RDBXeXFmbEZmdjNodmJiVjdhTE5mV3Nx?=
 =?utf-8?B?RXkyOUNvZksrTWs3VnhBcitySlFtTG5waEV3VFlmdlBRam0ybmg0dy9BblpO?=
 =?utf-8?B?elNaYnZpdHFHVm1YRVBCOWJvUnUzeUhlR3JjTEFIRTg4RmcvWEQ4TGcvTzBm?=
 =?utf-8?B?b0NnYjFrSmVFV3FOWWpML1lXUk9VTW9acndjVkQzZTIxbUFJSWhTRjAybzV2?=
 =?utf-8?B?bENDSTM4dFpQVHQxQjhTYTl2ZHoxZ0ozSUhNYTkxMlh2aDY2c2pnUm5PRm94?=
 =?utf-8?B?VHF3OGsxR1hqZXgwMmt5eG9HK080UnVHSkNmTlMwTGExWGV5d21KZVhJSGx6?=
 =?utf-8?B?Qy9FcmdyR1ZPTGNuT054U0xNNmZ2ancrT3RWQWk2clY2ZTErQUd1Q3NKYVd6?=
 =?utf-8?B?Y1J0dTVCSnZjaDZraE9CbTlmeGI2dmNNTnlnRmFQaWs3RkE5VnRHMkRIWVlr?=
 =?utf-8?B?OFMvR3dqaHBDQTY3YW9rclNacUVyenZ6eFh2NVdkWmpFMVZVbVpOclRzVnFN?=
 =?utf-8?B?T0VxaEs3bXJoT1ZCY3RZUjFIc0ZxU21RaWY0bjUrSmMyMzV4RTZPQVdiUWov?=
 =?utf-8?B?VXl4eHlsVUJiY1pKb3lnSlM0MUtlem4zV2NGSGM4QU4wRkl6anNxaE1WNHRT?=
 =?utf-8?B?b2tVWHQ4WWFPUVR0b0ZhZTVXVGFmSC9HbVhYQS9uWCtnR3F0NTFBOCtLdVBw?=
 =?utf-8?B?UXdkaGE1ZVRlWXR2QjlFWEQ4YUF0eEFGS0FJeWc0RWgveUV4S3U0MFZQQytD?=
 =?utf-8?B?M2ovNCtTVUl5Wk1tbEVNZW03K1RaOGszOFlBK0EwWTZTWFdjVkVsNFZBMWt6?=
 =?utf-8?B?Zm90ZUY3YjBXZ1owWC83bTY2eFF6Tmw2VktxQm1YTVBhaU1xNkVJOFQyVWRP?=
 =?utf-8?B?NXZCUXpLck1CQkJRUkVGc3gyL0xYMzlWWmRhVTE5Ny90a21yRlRkTytQWk52?=
 =?utf-8?B?d1psWXY5amVQdmlENGE0TjcwQk5SemZwZ05VcmRzTGpyLzFNRERiSnBMMTVM?=
 =?utf-8?B?RDZnbGphVTlPRjYrL3JYOWNTaERHZm1JSldQWTY5Uy9Ea3p4UkJ4ZDZjM2NQ?=
 =?utf-8?B?dDNqNnk3QWNIeUhtVUVRcGNYR213TVcyZm01aTZVUGUxaWk0NlFmWVRKaXUv?=
 =?utf-8?B?TnJGNHBKQjNRL2s3VU5CT0ZKRkZ5ZXBnWndmbUozbWtpVlpvc1NZNGRwekRO?=
 =?utf-8?B?ZDdNSmljUzJUYmM0eEcvQlhOczdIRFR2eHA3Tk5OODRMR20yMEFrcnMvbkhq?=
 =?utf-8?B?SytJUUttUVRVeUkwTlJwMFNIRVZVMkNTV3ZRZmNlRHBPbldSSXE5VkdWN2tS?=
 =?utf-8?B?Z2lBaHpCOHpyb1NKQklFU0RGdlFRdGZvdFF2QWY1Y2ZsQzdMR1hyS2xsNWpa?=
 =?utf-8?B?OGhjQ2p2K3Z4RnhqbHBoZW9zNmVTOWN3Njl0MEgzRmUySTROK3p5WjZjeHl3?=
 =?utf-8?B?ZVppUkpxblBSN1lyQkxQZnJOTkJ5R24rRXBYQ3F0K3VKOWRuVkQxM3ZrdlVv?=
 =?utf-8?B?ZUZaM01XUWwwQVdYcWQwZi9rSm5vNVZ4NlR2TXArSXI5TUVwWXoyNjVGcytH?=
 =?utf-8?B?ZmQ4UmxxQVEyMzREQitZRnJacSt1M1pjeXlrTVk1a0pVZXZTTm53TEQ4NW1T?=
 =?utf-8?B?UXkxZnJJaHNnOTJRaFd4dXVucXYxZnZJaWlTTThhSW5Hemh6SlR4dDROeDlL?=
 =?utf-8?B?QXNEeDNnOFNZOUlxdlF4ck1YenB3WVNMdmkzN0VDYVAzbS9xUWc5VlZLam1X?=
 =?utf-8?B?Y3Yzcy9scVZkQVRjN0V5VWh0YU5RR0xwVnNPMDVoV1Nqb2M4N0RMaW1HY21v?=
 =?utf-8?B?aUY0ZWhNZFRKanphM25tYnlsMWFnZVdHMmxwRDczUzJBQWE4Z2pVTUl3eFJk?=
 =?utf-8?B?NUFlSHM2SC9JWU4va1BZZk56dTlxSjUwWVFldGNvMURWYlNIU2U4cE1MQ3NP?=
 =?utf-8?B?bVRhZU9sNnhyNjhRWXNEUTgyWnZqdmE4bTIzOE1zZjJlTmIyYjFkWUQ0UHVC?=
 =?utf-8?B?L1V2Zkt4Ykd6K0pwVVlYaG95R2RiMkoweWpyYXN2aThCeDJUMGNweHlTa29L?=
 =?utf-8?B?VmNzdVg1RmlHVjB2T1VScDN1bnVLcTNGZGxkeFhhSkN4UlpyZm9WUGFoZVlo?=
 =?utf-8?Q?jrDdWLdhpv1Jt0UE=3D?=
X-Exchange-RoutingPolicyChecked: vj8Eg352Z+ibheTpYRqvu57TYYZk9+n6MWMvUaMn4qC2LJKRFYi9WIF9+VTIaJOdqmLwKYe3liUDVoE2oNYN08z3/zaiwvwwZMYUFodFXjC1xa78ioOymkS28Y8mDWliniHTiXeRBHYr0Ow+q0hWdrrXO0Q4zBXS0P9kKeTF5RsD2WntTNlKgGUk39aXXy/BjxqGQIVsZWQaw1ccCzlc9tCJ0NpvweZ6HGxVY7VyjTQbZQOj6/jv3DWB4IY5I4ymjG6Kta5nykAAapj+Gxn8TglpUpEklkZPEUQhisKVQ8F+0vre7pRkG8YDf9pNRKY212RV4jkX8CbA3mUGE+aKdA==
X-MS-Exchange-CrossTenant-Network-Message-Id: ee7e16b9-29a6-49cd-57f4-08df09d6780d
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 16:14:45.3964 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 12HpJtAjakoRoK/gxbZOYIeklBvU2YihMGMHzYfpwh2mbRRmEthWpIp64bjoNQmmOFiVBUlbZOqIlx7xn6kGv/OumQ3tPpFPl8zS0O/Td+g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6505
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on śro [2026-wrz-02 19:59:35 +0200]:
> 
> 
> On 9/1/2026 6:44 PM, Piórkowski, Piotr wrote:
> > From: Piotr Piórkowski <piotr.piorkowski@intel.com>
> > 
> > Driver-owned GGTT allocations and VF provisioning currently use a single
> > GGTT pool. Split it into a usable pool for driver-owned allocations and a
> > shareable pool for VF provisioning.
> > 
> > The pools are separate logical ranges and may overlap, but allocations are
> > limited to the configured size of their corresponding pool. Allocate from
> > the bottom of the usable pool and from the top of the shareable pool when a
> > shareable pool is present.
> > 
> > Add separate insertion APIs for the usable and shareable pools, together
> > with shareable hole-reporting helpers used by SR-IOV PF provisioning.
> > 
> > v2:
> >  - Rename ggtt->usable_size back to ggtt->size.
> >  - Remove the ggtt_insert_node_in_range() helper.
> > v3:
> >  - Introduce the hw_size struct field instead of the ggtt_accessible_size
> >    function.
> > v4:
> >  - Set the shareable pool size only for SR-IOV PF,
> >  - Return -ENOSPC instead of asserting when a large BO no longer fits after
> >    end is clamped to ggtt->size.
> 
> nit: you may want to move change log under ---
> 
> > 
> > Assisted-by: Claude:claude-5-sonnet
> > Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > Cc: Maarten Lankhorst <dev@lankhorst.se>
> > ---
> >  drivers/gpu/drm/xe/xe_ggtt.c               | 184 +++++++++++++++++----
> >  drivers/gpu/drm/xe/xe_ggtt.h               |  14 +-
> >  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c |  12 +-
> >  3 files changed, 176 insertions(+), 34 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> > index 63e8bf193605..1f0bd876cb35 100644
> > --- a/drivers/gpu/drm/xe/xe_ggtt.c
> > +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> > @@ -114,8 +114,10 @@ struct xe_ggtt {
> >  	struct xe_tile *tile;
> >  	/** @start: Start offset of GGTT */
> >  	u64 start;
> > -	/** @size: Total usable size of this GGTT */
> > +	/** @size: Size of the usable allocation range */
> >  	u64 size;
> > +	/** @hw_size: Size of the GGTT range assigned to device */
> > +	u64 hw_size;
> 
> hmm, "hw_size" suggests it is a HW size and currently it's fixed 4G anyway
> maybe to avoid confusion:
> 
> 	/** @start: Start offset of the assigned GGTT range. */
> 	/** @full_size: Full size of the assigned GGTT range. */
> then
> 	/** @size: Size of the GGTT range for the regular use. */
> 	/** @shareable.size: Size of the GGTT range reserved for sharing with VFs. */
> 
> btw, maybe introduction of "full_size" can be done as a separate step
> to decrease size of the current patch ?
> 
> >  	/**
> >  	 * @flags: Flags for this GGTT.
> >  	 * Acceptable flags:
> > @@ -142,6 +144,15 @@ struct xe_ggtt {
> >  	unsigned int access_count;
> >  	/** @wq: Dedicated unordered work queue to process node removals */
> >  	struct workqueue_struct *wq;
> > +#ifdef CONFIG_PCI_IOV
> > +	/** @shareable: Shareable range within GGTT */
> > +	struct {
> > +		/** @start: Shareable range start relative to @mm start */
> > +		u64 start;
> 
> do we need to cache it? likely:
> 
> 	shareable.start = start + full_size - shareable.size;

> 
> > +		/** @size: Shareable range size */
> > +		u64 size;
> > +	} shareable;
> > +#endif
> >  };
> >  
> >  static u64 xelp_ggtt_pte_flags(struct xe_bo *bo, u16 pat_index)
> > @@ -239,7 +250,7 @@ u64 xe_ggtt_size(struct xe_ggtt *ggtt)
> >  static void xe_ggtt_set_pte(struct xe_ggtt *ggtt, u64 addr, u64 pte)
> >  {
> >  	xe_tile_assert(ggtt->tile, !(addr & XE_PTE_MASK));
> > -	xe_tile_assert(ggtt->tile, addr < ggtt->start + ggtt->size);
> > +	xe_tile_assert(ggtt->tile, addr < ggtt->start + ggtt->hw_size);
> >  
> >  	writeq(pte, &ggtt->gsm[addr >> XE_PTE_SHIFT]);
> >  }
> > @@ -253,7 +264,7 @@ static void xe_ggtt_set_pte_and_flush(struct xe_ggtt *ggtt, u64 addr, u64 pte)
> >  static u64 xe_ggtt_get_pte(struct xe_ggtt *ggtt, u64 addr)
> >  {
> >  	xe_tile_assert(ggtt->tile, !(addr & XE_PTE_MASK));
> > -	xe_tile_assert(ggtt->tile, addr < ggtt->start + ggtt->size);
> > +	xe_tile_assert(ggtt->tile, addr < ggtt->start + ggtt->hw_size);
> >  
> >  	return readq(&ggtt->gsm[addr >> XE_PTE_SHIFT]);
> >  }
> > @@ -355,16 +366,31 @@ static const struct xe_ggtt_pt_ops xelpg_pt_wa_ops = {
> >  	.ggtt_get_pte = xe_ggtt_get_pte,
> >  };
> >  
> > -static void __xe_ggtt_init_early(struct xe_ggtt *ggtt, u64 start, u64 size)
> > +static void __xe_ggtt_init_early(struct xe_ggtt *ggtt, u64 start, u64 usable_size,
> > +				 u64 shareable_size)
> >  {
> > +	struct xe_gt *gt = ggtt->tile->primary_gt;
> > +
> > +	xe_gt_assert(gt, usable_size);
> > +	xe_gt_assert(gt, usable_size <= ggtt->hw_size);
> > +	xe_gt_assert(gt, shareable_size <= ggtt->hw_size);
> > +
> >  	ggtt->start = start;
> > -	ggtt->size = size;
> > -	drm_mm_init(&ggtt->mm, 0, size);
> > +	ggtt->size = usable_size;
> > +
> > +#ifdef CONFIG_PCI_IOV
> > +	if (shareable_size) {
> > +		ggtt->shareable.start = ggtt->hw_size - shareable_size;
> > +		ggtt->shareable.size = shareable_size;
> > +	}
> > +#endif
> > +	drm_mm_init(&ggtt->mm, 0, ggtt->hw_size);
> >  }
> >  
> >  int xe_ggtt_init_kunit(struct xe_ggtt *ggtt, u32 start, u32 size)
> >  {
> > -	__xe_ggtt_init_early(ggtt, start, size);
> > +	ggtt->hw_size = size;
> 
> can we move "full_size" initialization to __early() ?
> 
> > +	__xe_ggtt_init_early(ggtt, start, size, 0);
> 
> kunit can also be a PF
> do we care if it will have no shareable range at all?
> 
> >  	return 0;
> >  }
> >  EXPORT_SYMBOL_IF_KUNIT(xe_ggtt_init_kunit);
> > @@ -427,6 +453,8 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
> >  	if (ggtt_size + ggtt_start > GUC_GGTT_TOP)
> >  		ggtt_size = GUC_GGTT_TOP - ggtt_start;
> >  
> > +	ggtt->hw_size = ggtt_size;
> 
> move to __early()
> 
> > +
> >  	if (GRAPHICS_VERx100(xe) >= 1270)
> >  		ggtt->pt_ops =
> >  			(ggtt->tile->media_gt && XE_GT_WA(ggtt->tile->media_gt, 22019338487)) ||
> > @@ -439,7 +467,8 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
> >  	if (!ggtt->wq)
> >  		return -ENOMEM;
> >  
> > -	__xe_ggtt_init_early(ggtt, ggtt_start, ggtt_size);
> > +	__xe_ggtt_init_early(ggtt, ggtt_start, ggtt_size,
> > +			     IS_SRIOV_PF(xe) ? ggtt_size : 0);
> >  
> >  	err = drmm_add_action_or_reset(&xe->drm, ggtt_fini_early, ggtt);
> >  	if (err)
> > @@ -652,16 +681,55 @@ void xe_ggtt_shift_nodes(struct xe_ggtt *ggtt, u64 new_start)
> >  
> >  	xe_tile_assert(ggtt->tile, new_start >= xe_wopcm_size(tile_to_xe(ggtt->tile)));
> 
> btw, maybe we should introduce:
> 
> 	/** @bottom: Start offset of the GGTT derived frm WOPCM size. */
> or	/** @hw_start: ... */
> or	/** @real_start: ... */
> 
> or helper:
> 
> 	u64 xe_ggtt_bottom(ggtt)
> 	{
> 		return xe_wopcm_size(ggtt->tile->xe);
> 	}
> 
> to avoid referring to WOPCM beyond the ggtt_init()
> 
> >  	xe_tile_assert(ggtt->tile, new_start + ggtt->size <= GUC_GGTT_TOP);
> > +#ifdef CONFIG_PCI_IOV
> > +	xe_tile_assert(ggtt->tile, ggtt->shareable.size == 0);
> > +#endif
> >  
> >  	/* pairs with READ_ONCE in xe_ggtt_node_addr() */
> >  	WRITE_ONCE(ggtt->start, new_start);
> >  }
> >  
> > -static int xe_ggtt_insert_node_locked(struct xe_ggtt_node *node,
> > -				      u32 size, u32 align, u32 mm_flags)
> > +static int ggtt_insert_node_in_range_locked(struct xe_ggtt_node *node, u32 size,
> > +					    u32 align, u64 range_start,
> > +					    u64 range_size, u32 mm_flags)
> >  {
> > -	return drm_mm_insert_node_generic(&node->ggtt->mm, &node->base, size, align, 0,
> > -					  mm_flags);
> > +	struct xe_ggtt *ggtt = node->ggtt;
> > +	u64 range_end = range_start + range_size;
> > +
> > +	lockdep_assert_held(&ggtt->lock);
> > +
> > +	if (!range_size || range_end <= range_start)
> > +		return -EINVAL;
> > +
> > +	if (range_end > ggtt->hw_size)
> > +		return -ERANGE;
> > +
> > +	if (size > range_size)
> > +		return -ENOSPC;
> > +
> > +	return drm_mm_insert_node_in_range(&ggtt->mm, &node->base, size, align, 0,
> > +					  range_start, range_end, mm_flags);
> > +}
> > +
> > +/*
> > + * When the shareable range is present, allocations start from the bottom
> > + * to leave space at the top; otherwise they start from the top.
> > + */
> > +static u32 ggtt_usable_insert_flags(struct xe_ggtt *ggtt)
> > +{
> > +#ifdef CONFIG_PCI_IOV
> > +	if (ggtt->shareable.size > 0)
> > +		return DRM_MM_INSERT_LOW;
> > +#endif
> > +	return DRM_MM_INSERT_HIGH;
> > +}
> > +
> > +static int xe_ggtt_insert_node_locked(struct xe_ggtt_node *node, u32 size, u32 align)
> > +{
> > +	struct xe_ggtt *ggtt = node->ggtt;
> > +
> > +	return ggtt_insert_node_in_range_locked(node, size, align, 0,
> > +						ggtt->size, ggtt_usable_insert_flags(ggtt));
> >  }
> >  
> >  static struct xe_ggtt_node *ggtt_node_init(struct xe_ggtt *ggtt)
> > @@ -683,7 +751,7 @@ static struct xe_ggtt_node *ggtt_node_init(struct xe_ggtt *ggtt)
> >   * @size: size of the node
> >   * @align: alignment constrain of the node
> >   *
> > - * Return: &xe_ggtt_node on success or a ERR_PTR on failure.
> > + * Return: &xe_ggtt_node on success or an error on failure.
> 
> we still return an ERR_PTR here, not an int
> 
> >   */
> >  struct xe_ggtt_node *xe_ggtt_insert_node(struct xe_ggtt *ggtt, u32 size, u32 align)
> >  {
> > @@ -695,8 +763,46 @@ struct xe_ggtt_node *xe_ggtt_insert_node(struct xe_ggtt *ggtt, u32 size, u32 ali
> >  		return node;
> >  
> >  	guard(mutex)(&ggtt->lock);
> > -	ret = xe_ggtt_insert_node_locked(node, size, align,
> > -					 DRM_MM_INSERT_HIGH);
> > +
> > +	ret = xe_ggtt_insert_node_locked(node, size, align);
> > +	if (ret) {
> > +		ggtt_node_fini(node);
> > +		return ERR_PTR(ret);
> > +	}
> > +
> > +	return node;
> > +}
> > +
> > +#ifdef CONFIG_PCI_IOV
> > +/**
> > + * xe_ggtt_insert_node_shareable - Insert a &xe_ggtt_node into shareable range
> 
> nit: add () to the function name
> 
> nit: "Insert a new node in shareable GGTT range." ?
> 
> > + * @ggtt: the &xe_ggtt into which the node should be inserted.
> > + * @size: size of the node
> > + * @align: alignment constrain of the node
> > + *
> > + * Inserts a node into the shareable GGTT range.
> > + * Allocations always start from the top (DRM_MM_INSERT_HIGH).
> > + *
> > + * Return: &xe_ggtt_node on success or an error on failure.
> 
> return ... an ERR_PTR on failure
> 
> > + */
> > +struct xe_ggtt_node *xe_ggtt_insert_node_shareable(struct xe_ggtt *ggtt, u32 size, u32 align)
> > +{
> > +	struct xe_ggtt_node *node;
> > +	int ret;
> > +
> > +	if (!ggtt->shareable.size)
> > +		return ERR_PTR(-ENOSPC);
> > +
> > +	node = ggtt_node_init(ggtt);
> > +	if (IS_ERR(node))
> > +		return node;
> > +
> > +	guard(mutex)(&ggtt->lock);
> > +
> > +	ret = ggtt_insert_node_in_range_locked(node, size, align,
> > +					       ggtt->shareable.start,
> > +					       ggtt->shareable.size,
> > +					       DRM_MM_INSERT_HIGH);
> >  	if (ret) {
> >  		ggtt_node_fini(node);
> >  		return ERR_PTR(ret);
> > @@ -704,6 +810,7 @@ struct xe_ggtt_node *xe_ggtt_insert_node(struct xe_ggtt *ggtt, u32 size, u32 ali
> >  
> >  	return node;
> >  }
> > +#endif
> >  
> >  /**
> >   * xe_ggtt_node_pt_size() - Get the size of page table entries needed to map a GGTT node.
> > @@ -787,6 +894,7 @@ void xe_ggtt_map_bo_unlocked(struct xe_ggtt *ggtt, struct xe_bo *bo)
> >   *
> >   * This function allows inserting a GGTT node with a custom transformation function.
> >   * This is useful for display to allow inserting rotated framebuffers to GGTT.
> > + * Allocates from the usable range only.
> >   *
> >   * Return: A pointer to %xe_ggtt_node struct on success. An ERR_PTR otherwise.
> >   */
> > @@ -807,7 +915,7 @@ struct xe_ggtt_node *xe_ggtt_insert_node_transform(struct xe_ggtt *ggtt,
> >  		goto err;
> >  	}
> >  
> > -	ret = xe_ggtt_insert_node_locked(node, size, align, 0);
> > +	ret = xe_ggtt_insert_node_locked(node, size, align);
> >  	if (ret)
> >  		goto err_unlock;
> >  
> > @@ -874,10 +982,19 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
> >  	else
> >  		end = 0;
> >  
> > -	xe_tile_assert(ggtt->tile, end >= start + xe_bo_size(bo));
> > +	end = min(end, ggtt->size);
> > +
> > +	if (end < start + xe_bo_size(bo)) {
> > +		ggtt_node_fini(bo->ggtt_node[tile_id]);
> > +		bo->ggtt_node[tile_id] = NULL;
> > +		mutex_unlock(&ggtt->lock);
> > +		err = -ENOSPC;
> > +		goto out;
> > +	}
> 
> maybe as a preparation step, convert this function to use:
> 
> 	guard(xe_pm_runtime_noresume)(xe);
> and
> 	guard(mutex)(&ggtt->lock);
> 
> to minimize risk of mistakes?
> 
> >  
> >  	err = drm_mm_insert_node_in_range(&ggtt->mm, &bo->ggtt_node[tile_id]->base,
> > -					  xe_bo_size(bo), alignment, 0, start, end, 0);
> > +					  xe_bo_size(bo), alignment, 0, start, end,
> > +					  ggtt_usable_insert_flags(ggtt));
> >  	if (err) {
> >  		ggtt_node_fini(bo->ggtt_node[tile_id]);
> >  		bo->ggtt_node[tile_id] = NULL;
> > @@ -948,24 +1065,30 @@ void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
> >  			    bo->flags & XE_BO_FLAG_GGTT_INVALIDATE);
> >  }
> >  
> > +#ifdef CONFIG_PCI_IOV
> >  /**
> > - * xe_ggtt_largest_hole - Largest GGTT hole
> > + * xe_ggtt_largest_shareable_hole - Largest hole within the shareable range
> 
> as there is no 'usable' variant of this function, maybe it is
> not worth to rename it?

I disagree with that — we have two logical pools, and I think we should
specify exactly what this function applies to — we're not looking for holes
in the entire GGTT, but only in the subset called "shareable" — and the name
indicates that.


> 
> nit: remember to add () to function name
> 
> nit: maybe move closer to print_holes() to keep them under single #ifdef
> 
> >   * @ggtt: the &xe_ggtt that will be inspected
> >   * @alignment: minimum alignment
> >   * @spare: If not NULL: in: desired memory size to be spared / out: Adjusted possible spare
> >   *
> > - * Return: size of the largest continuous GGTT region
> > + * Only holes within the shareable range are considered.
> > + *
> > + * Return: size of the largest continuous shareable GGTT region
> >   */
> > -u64 xe_ggtt_largest_hole(struct xe_ggtt *ggtt, u64 alignment, u64 *spare)
> > +u64 xe_ggtt_largest_shareable_hole(struct xe_ggtt *ggtt, u64 alignment, u64 *spare)
> >  {
> >  	const struct drm_mm *mm = &ggtt->mm;
> >  	const struct drm_mm_node *entry;
> >  	u64 hole_start, hole_end, hole_size;
> > +	u64 shareable_start = ggtt->shareable.start;
> > +	u64 shareable_end = ggtt->shareable.start + ggtt->shareable.size;
> >  	u64 max_hole = 0;
> >  
> >  	mutex_lock(&ggtt->lock);
> >  	drm_mm_for_each_hole(entry, mm, hole_start, hole_end) {
> > -		hole_start = max(hole_start, ggtt->start);
> > +		hole_start = max(hole_start, shareable_start);
> > +		hole_end = min(hole_end, shareable_end);
> >  		hole_start = ALIGN(hole_start, alignment);
> >  		hole_end = ALIGN_DOWN(hole_end, alignment);
> >  		if (hole_start >= hole_end)
> > @@ -981,7 +1104,6 @@ u64 xe_ggtt_largest_hole(struct xe_ggtt *ggtt, u64 alignment, u64 *spare)
> >  	return max_hole;
> >  }
> >  
> > -#ifdef CONFIG_PCI_IOV
> >  static u64 xe_encode_vfid_pte(u16 vfid)
> >  {
> >  	return FIELD_PREP(GGTT_PTE_VFID, vfid) | XE_PAGE_PRESENT;
> > @@ -1120,27 +1242,32 @@ int xe_ggtt_dump(struct xe_ggtt *ggtt, struct drm_printer *p)
> >  	return err;
> >  }
> >  
> > +#ifdef CONFIG_PCI_IOV
> >  /**
> > - * xe_ggtt_print_holes - Print holes
> > + * xe_ggtt_print_shareable_holes - Print holes within the shareable range
> >   * @ggtt: the &xe_ggtt to be inspected
> >   * @alignment: min alignment
> >   * @p: the &drm_printer
> >   *
> > - * Print GGTT ranges that are available and return total size available.
> > + * Print GGTT ranges that are available within the shareable range and return
> > + * total size available.
> >   *
> > - * Return: Total available size.
> > + * Return: Total available shareable size.
> >   */
> > -u64 xe_ggtt_print_holes(struct xe_ggtt *ggtt, u64 alignment, struct drm_printer *p)
> > +u64 xe_ggtt_print_shareable_holes(struct xe_ggtt *ggtt, u64 alignment, struct drm_printer *p)
> >  {
> >  	const struct drm_mm *mm = &ggtt->mm;
> >  	const struct drm_mm_node *entry;
> >  	u64 hole_start, hole_end, hole_size;
> > +	u64 shareable_start = ggtt->shareable.start;
> > +	u64 shareable_end = ggtt->shareable.start + ggtt->shareable.size;
> >  	u64 total = 0;
> >  	char buf[10];
> >  
> >  	mutex_lock(&ggtt->lock);
> >  	drm_mm_for_each_hole(entry, mm, hole_start, hole_end) {
> > -		hole_start = max(hole_start, ggtt->start);
> > +		hole_start = max(hole_start, shareable_start);
> > +		hole_end = min(hole_end, shareable_end);
> >  		hole_start = ALIGN(hole_start, alignment);
> >  		hole_end = ALIGN_DOWN(hole_end, alignment);
> >  		if (hole_start >= hole_end)
> > @@ -1157,6 +1284,7 @@ u64 xe_ggtt_print_holes(struct xe_ggtt *ggtt, u64 alignment, struct drm_printer
> >  
> >  	return total;
> >  }
> > +#endif
> >  
> >  /**
> >   * xe_ggtt_encode_pte_flags - Get PTE encoding flags for BO
> > diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
> > index c864cc975a69..c441e39fdd47 100644
> > --- a/drivers/gpu/drm/xe/xe_ggtt.h
> > +++ b/drivers/gpu/drm/xe/xe_ggtt.h
> > @@ -24,6 +24,16 @@ u64 xe_ggtt_size(struct xe_ggtt *ggtt);
> >  
> >  struct xe_ggtt_node *
> >  xe_ggtt_insert_node(struct xe_ggtt *ggtt, u32 size, u32 align);
> > +#ifdef CONFIG_PCI_IOV
> > +struct xe_ggtt_node *
> > +xe_ggtt_insert_node_shareable(struct xe_ggtt *ggtt, u32 size, u32 align);
> > +#else
> > +static inline struct xe_ggtt_node *
> > +xe_ggtt_insert_node_shareable(struct xe_ggtt *ggtt, u32 size, u32 align)
> > +{
> > +	return ERR_PTR(-ENODEV);
> > +}
> 
> are you sure we need a stub?
> the PF code that uses this should be under PCI_IOV already
> 
> > +#endif
> >  struct xe_ggtt_node *
> >  xe_ggtt_insert_node_transform(struct xe_ggtt *ggtt,
> >  			      struct xe_bo *bo, u64 pte,
> > @@ -36,12 +46,12 @@ int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo, struct drm_exec *e
> >  int xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
> >  			 u64 start, u64 end, struct drm_exec *exec);
> >  void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo);
> > -u64 xe_ggtt_largest_hole(struct xe_ggtt *ggtt, u64 alignment, u64 *spare);
> >  
> >  int xe_ggtt_dump(struct xe_ggtt *ggtt, struct drm_printer *p);
> > -u64 xe_ggtt_print_holes(struct xe_ggtt *ggtt, u64 alignment, struct drm_printer *p);
> >  
> >  #ifdef CONFIG_PCI_IOV
> > +u64 xe_ggtt_largest_shareable_hole(struct xe_ggtt *ggtt, u64 alignment, u64 *spare);
> > +u64 xe_ggtt_print_shareable_holes(struct xe_ggtt *ggtt, u64 alignment, struct drm_printer *p);
> >  void xe_ggtt_assign(const struct xe_ggtt_node *node, u16 vfid);
> >  int xe_ggtt_node_save(struct xe_ggtt_node *node, void *dst, size_t size, u16 vfid);
> >  int xe_ggtt_node_load(struct xe_ggtt_node *node, const void *src, size_t size, u16 vfid);
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> > index be0a413ee17c..a5f4a3d27c3e 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> > @@ -531,9 +531,13 @@ static int pf_provision_vf_ggtt(struct xe_gt *gt, unsigned int vfid, u64 size)
> >  	if (!size)
> >  		return 0;
> >  
> > -	node = xe_ggtt_insert_node(ggtt, size, alignment);
> > -	if (IS_ERR(node))
> > +	node = xe_ggtt_insert_node_shareable(ggtt, size, alignment);
> > +	if (IS_ERR(node)) {
> > +		xe_gt_sriov_dbg_verbose(gt,
> > +					"VF%u GGTT provisioning failed: no shareable range\n",
> > +					vfid);
> 
> do we need this new dbg?
> ERR_PTR might be different than -ENOSPC so above message could be misleading
> 
> and we already print %pe in case of GGTT provisioning failure, no?
> 
> >  		return PTR_ERR(node);
> > +	}
> >  
> >  	xe_ggtt_assign(node, vfid);
> >  	xe_gt_sriov_dbg_verbose(gt, "VF%u assigned GGTT %llx-%llx\n",
> > @@ -729,7 +733,7 @@ static u64 pf_get_max_ggtt(struct xe_gt *gt)
> >  	u64 spare = pf_get_spare_ggtt(gt);
> >  	u64 max_hole;
> >  
> > -	max_hole = xe_ggtt_largest_hole(ggtt, alignment, &spare);
> > +	max_hole = xe_ggtt_largest_shareable_hole(ggtt, alignment, &spare);
> >  
> >  	xe_gt_sriov_dbg_verbose(gt, "HOLE max %lluK reserved %lluK\n",
> >  				max_hole / SZ_1K, spare / SZ_1K);
> > @@ -3549,7 +3553,7 @@ int xe_gt_sriov_pf_config_print_available_ggtt(struct xe_gt *gt, struct drm_prin
> >  	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
> >  
> >  	spare = pf_get_spare_ggtt(gt);
> > -	total = xe_ggtt_print_holes(ggtt, alignment, p);
> > +	total = xe_ggtt_print_shareable_holes(ggtt, alignment, p);
> >  
> >  	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
> >  
> 

Thanks for the review — I agree with most of your comments (though I have some doubts about
the cache start issue and the xe_ggtt_largest_shareable_hole name).

I'll take your comments into account and make changes in the next series.

Thanks,
Piotr


-- 
