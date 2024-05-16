Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F647C25B74
	for <intel-xe@archiver.kernel.org>; Thu, 16 May 2024 07:17:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41E1F10E1DF;
	Thu, 16 May 2024 07:17:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k+oBZho5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 675D310E1DF
 for <intel-xe@lists.freedesktop.org>; Thu, 16 May 2024 07:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715843848; x=1747379848;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=7lTsgZHhDVxYhUft91/cU5oyPNkRbP8bshIUgudpS34=;
 b=k+oBZho5FCgzy55sOZWLjPuVhgc3qD09igfQu5uDooU4MvnX82h+H0WY
 uen9rU3QsRZy1OIa9YnTifnOSshuUERNgFQFU4abxvarlgWTISiYhnuz5
 kRXsxqWMf5kdWXngDZV2WTFFO+epnuC8rQ/TS7/5fucbz9OoZAt2aM6pG
 j9nmaSFvBv07ORmC5gn3a+KQ/EXK3G+grdxZqAcNt/69FjSllKGdgR+D5
 Hm+Nd015ngjtIPxMeELTHL4WaB5SlX8uWJ/cspNK0oxvIOtDJhkVfM/FA
 6BXGtOBXwpvEqYkVobU6iASHrZ75K/7GFlpN0eU8WC1KM5Kve7G8p3dGR A==;
X-CSE-ConnectionGUID: m/6om/T7QeSBayHFroHvmg==
X-CSE-MsgGUID: AgIRfl5DQziNq47x6LGrEg==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="12044385"
X-IronPort-AV: E=Sophos;i="6.08,163,1712646000"; d="scan'208";a="12044385"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2024 00:17:28 -0700
X-CSE-ConnectionGUID: OvHR3bTxSu+u05syOUD7BQ==
X-CSE-MsgGUID: NHxUhlT+SImg2/KA8F5weQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,163,1712646000"; d="scan'208";a="36121675"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 May 2024 00:17:28 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 16 May 2024 00:17:27 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 16 May 2024 00:17:27 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 16 May 2024 00:17:27 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 16 May 2024 00:17:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fgZBBXz0l6SYknbdqHTE47hy9K7em/WMqI3ykHHEJ8XCoS1h9MyYOQQHKv10YSsqOJwo7mWQl6KKiIeAxF3hclD3WL0p/5WQjCB8939oIihAGNJeICLaWbE57fAVDBdCine3jREIwd2Vw6DGPF+H/HS5CEkbNmDX7XBuI8h37btHd0Pskjk2VeXVImS6yXbbTUSSa3wKFQC7gImkhiHkazSyqii2ay4eOnVCVb9hj7qIR3Khgk1JmM8TH7ANXLBBCIkNk8/crAxaxWdDmnJzae9ZouWVaFnjCEzfwDP3J2bg44e5tykggzh+Vuf1Gj+ZwmtGx/ULfQJ3umV/RT1/cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Smj+pMGD3tZ8ivkBFe8WIKJ2wp6ZL5+c8OT4mYn/G8A=;
 b=Wlknc/bKj+MlOhW+h/38U3cRksYQO0NW+on/4Ztd9m1acoGL3AcMYdHhv1hAhAxZc59UDx9vZS13xfHElkJr0PsCVUiC2FEeO8KUPGl8gLhbTHJzmLBBGO0E+hXsmSQ8W9LTYZyOnEDFr1NWr8TaaPCWewszqGPguf9AAnDJ3ET2s4naMV42fACxhOopVIGOL7RPW2jWnVuOvqX4xGNx4RXg0vzg4WPorIRtvXam9N3ELuKYxhv1spzsAwnqhze2FfAwaYChvb2Up2qs5S+QuTIvtOEERjZphZpIcJKYIWQQSSz5TtcVZ4dhd6EzOc6h/hjzHOmBkimhttfyOPeXtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by CH0PR11MB5251.namprd11.prod.outlook.com (2603:10b6:610:e2::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.28; Thu, 16 May
 2024 07:17:20 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.7544.052; Thu, 16 May 2024
 07:17:20 +0000
Date: Thu, 16 May 2024 09:17:17 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 3/6] drm/xe/guc: Add VF2GUC_QUERY_SINGLE_KLV to ABI
Message-ID: <20240516071717.y7jdqupbyooa4ack@intel.com>
References: <20240512154915.2040-1-michal.wajdeczko@intel.com>
 <20240512154915.2040-4-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240512154915.2040-4-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MI2P293CA0007.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:45::7) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|CH0PR11MB5251:EE_
X-MS-Office365-Filtering-Correlation-Id: 71630c4f-1d0b-4d0e-e997-08dc75783976
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RG1CbjY1WWNoR2hOTTZ3aDJCcFBSd0VyZWVWN0FZKy9VTm1JVzlLakkzcXBV?=
 =?utf-8?B?SitrYUI1c0Z6bEk5K09zZitsVitlQWxlTThjeU03K0RWU0dYd1l4UkdleVpN?=
 =?utf-8?B?RHJtYnpOQ1JMcXIycTJzRCtNaG5zSlZvbGxJeExTS0Z4VEY4R3gzLzRmVmJH?=
 =?utf-8?B?dnhXYWFyTFVCN21KU1VTbDNxVGk0VFlKRm1HeXlKT1gxQ2k0Y1pEbVdDVUNy?=
 =?utf-8?B?cGR3aFRvYk1hdHhaQy95ejdoMkluUjYyTEQ1OWJKam1lazBlRlBvZkdYY0ZO?=
 =?utf-8?B?N1pCTnJMYnUvTEIwS3dvVWw4eXd5UU84UE0yZGFhL3F4Z3U3Z2duR0w0Y0di?=
 =?utf-8?B?R3dnOUFZSHYwUHRnK3N2Si84RUNhVEM5M1daNzJEVDIwQ1FpUEZSbS9rUlNm?=
 =?utf-8?B?TUR6SjlSK2hERWkvMWRJYjNEN1IvVzNjYzJseW1DbGhUUTNJdXU1cmVrcjJF?=
 =?utf-8?B?K2ZiejVKTElIM2RwZlRmVGhYT3ROTDdueU1wSzI2RjVMZm9NTjFsU1h6V2No?=
 =?utf-8?B?SStnQ0dsUzh0UGJpam5PaXI3VXlwdlFQTU9jM1V3cFEybEZXcFZVUDMxNlgv?=
 =?utf-8?B?SGxQWUJ5WWM0Y0pGL2pEWHRUWFdFUjdZMlhBS0pIQldweVMxalVRT2xYM0dK?=
 =?utf-8?B?b1lIbUhHQUtEVEtXOHlza2p2em1xbmtUb0tXcHhIcFJSWHNnN0xaY2hjRVFN?=
 =?utf-8?B?Z0YraWt6MGUvNmNRdkNZTnZiSzNPMjk4bm9kWEw0S21VaHZTSFZZREhJMTM5?=
 =?utf-8?B?Yi9KUHlNTFg5UEJWNzBKYU54VTFtOWxxeVNVUTh2ZU56RnZFWFZqaklIc1Jk?=
 =?utf-8?B?UjRYVUlSazlNczRyMkI0NjVxMlNlTkUwSzVIYWRYTDlxbG80dDFmejdlMEIx?=
 =?utf-8?B?Vkh1a1JhaWxOTWFMY3BrOUJ5U3RIYUxqYWkwc3BoQW0zNHdFRXk0OVRpTCtC?=
 =?utf-8?B?UEpFOVd1MDhFd2l4Q25VbUFpdkVQd09TRmFmWTdyUTlhbEZOMHVMc3JMTGpq?=
 =?utf-8?B?czNtUkVxRkFQV3ZYSXFKZklxdHZwVW5kK05YZ0oxaERQaTJzYUtoOG5DaXRy?=
 =?utf-8?B?cXFyTSthMkxpWUt2NDQrZEQwc1paaER1Y1dkN08wQnlZa3cxaVJwMUU4aWVk?=
 =?utf-8?B?amVkajNnQUF6cjRkakQ1WHRiM1AyYW5PUUNGOGFRR2d3QUNrTVFBZmpwM2xY?=
 =?utf-8?B?K2FIL2ppOWoybk9GWlFtbGNTTWZ6YXJVNFRMN2hwbUpMSVFSUVJBYTRnRjdu?=
 =?utf-8?B?cnBkeHZrT3g0TkxZaUFzQWRyc2dYdXpRbWJIZkJUcGY0L2xOckhEQjhWR0t2?=
 =?utf-8?B?d0YzTElzSkc2RFozcWxsQk5WYTJFNm5RbDNHNS9vMVhnWmNqRlVzTkQ1clkx?=
 =?utf-8?B?Ukp2TFg4d0RrM2ZmcFhlN3JuRU0reDJCcEZlY29UQzUyR2VzK29zT3NFdi9N?=
 =?utf-8?B?SHJGT1IxRmhDNWFKSXI4U1EycU5WdWEwUDZ5SVd4UzVWbHVyQUlOMHpoWWU0?=
 =?utf-8?B?YnZRSHVWS0xDT01qb0c2Nzh1VmZZcVN2THpEeHZxRW1laDF3eXBJRUR2MWNr?=
 =?utf-8?B?QjNqUk5QOFVVQlJoZGQwOVpjblhvK2tjeEtYM1ZzOHROcWpSZHh2SmUvNlYw?=
 =?utf-8?B?MXpoUWN0YzJ3YnlZdElvOFE3MHVjNUk4azkxZXpFRmhEZUZ6TzZFOVp4c0Q3?=
 =?utf-8?B?TzBzM255TEhoMDBhclVDOHBCY2RweTVEdlRXcVNMSlNDRWZNb1dObC9BPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SThkWUtuaFRhNjNSbElpdUVyV21wMDNlZzlKRksyZnZmN1dsWjBMQ21uNGU2?=
 =?utf-8?B?TWorbThxb1RLaVcwbTNMdjBGOW90T01rZ0puSm8xZTd3QXFSblRWWUNwU0Yz?=
 =?utf-8?B?STdSSEdkK3pNbkFXT2Q1bU9ZQVRqZzZqNzRocU9NL2czUitVMmNWT050WWtq?=
 =?utf-8?B?bk1RT21aSnd6UHBpb3hPKzdpTzN6alBVc3R3T2x1a0VCL1VMbE52djRvVUgw?=
 =?utf-8?B?eENRek5pRUxOZVR0REkzTlFaRkQreWNWNy9hdG9jbGVIeWlnVFFnY1FuZmt1?=
 =?utf-8?B?aTBoNElHK1g1NmR1OGEzc2FmTkJ4TlpweXNrY2RPUnR1WVBQV1JvZjNWbTFI?=
 =?utf-8?B?dXJIYUtKTjlaei9tYkp0aVh1c0tDSDdybEJFeitRTXBFLzlZenBNNkMzcjZw?=
 =?utf-8?B?UElERXJhVzU4NkhoOTlzZ25GdkVyR0NzWmJaSDlVbmptOTlWMTVkYlUybU42?=
 =?utf-8?B?VElsWEtjS2pUMXZIa2pUUGc5TkN5aDJHWFh0YzZCVERiVFR1WnlSMU5kM3lV?=
 =?utf-8?B?THFiSzJvdzV0ZWsxQ3ZqSEVpbU83Ym9uOFR3MnFRN0NUTTNLZk45UzhNOWpP?=
 =?utf-8?B?NDhQU0hlSXFOTzRRZlJsMS9DNzNXbjgyRkJOSWRLdXl6M1hGa1F0OHZ0b210?=
 =?utf-8?B?elFITGZNczJoOUV3a2FhK01hTm9xdHo5dTQyQ3dXK2hGWGwzby9sdGxvR3hu?=
 =?utf-8?B?VjJnRnVvc1RkTGRCbWg0aC9wSE8zVGFPS1ZkcU9UcW1QMmxnT3RIcFpkVE4r?=
 =?utf-8?B?WHA5aTFCUjBsU1Vma2tZd1N1cW82V3BsRUxWOFdKZTRQTHo4ZEhkUi84enFY?=
 =?utf-8?B?OUswRTdRa0FIcFFZWnhYNU4rd1hUSkpxcG5NOTcrOWhUV1R0RCtJdnNkSmVz?=
 =?utf-8?B?K3lXVDB3MUEzb3UwM2ZDc0dpb0ZQNHIzQ2MwV3Nyd1dCV2puMklwWjNVWThm?=
 =?utf-8?B?QXJ1dW1RL3pQdCszODRiZDA0TkpxVW9FOW0yOWpYWjdVZW1qVXFXYWVYdnhK?=
 =?utf-8?B?YWJjdzZPaUoybWhqL25uQnJIaXl4WEFYQ0pRL1RVMVhIRlh5RkRqM0dyUWs2?=
 =?utf-8?B?cjNQWTNCQkttMEwzWk9xNE1YVlVYY1lsUEpIRlowWk1iRVB3b3VqN0dldDRM?=
 =?utf-8?B?UDJTeVp6WWtwS0tMN25mdWF4Nkt0SjFBcG45dit2ME1EZCtGUlNURlJYck9o?=
 =?utf-8?B?VkJsVU1wcTUxa1lrMnJUYzFsUVN1V2VmWnBKekJZVTBDbHBVYkR5M2l4RENl?=
 =?utf-8?B?a29oOG90UXgwaDdTQ2JIWkF4aE9ZcEw0WStRSklCRGxOS3dtcmwzR2JRcUpM?=
 =?utf-8?B?NEVDcjVaMk9NSDN3dU5jN3FOZGx5R2ZUYlRiZ0FBMUJZdXNmek40TVZ4a0Iz?=
 =?utf-8?B?ZkU4SEMvMGNCY1pZNUlUazRna1MvcExaZ0ZzRE8xYkkzQnc4ZllEdWZGa3My?=
 =?utf-8?B?WGJYRkdReXZwWEJCTlQ1dUxwNWt5MWxsL2xjSGxaa2VsdFpIZy9hN0VycHBL?=
 =?utf-8?B?RjAyYlJHS2Z5WW9uMEhLLy9BTnpCWTlSYWlKUTFSaTdSVW9sOGg5RmFnZlIz?=
 =?utf-8?B?YmVES2pURndHeDNsR3FCUi9Kc2VWVnBaOE5yTTJMbzdhNEhaUEwrMk5MbWZv?=
 =?utf-8?B?U2pNNHF6WmJGWXlDRitpUWNGekhBY3VsTitPaFRXejNmWXluVmdKczE0dWU3?=
 =?utf-8?B?dlUwY1dRamdLUHIrdFlJTS82ZHNTU0tNcCsyL2o2MG16NFdnc0hhekg3Mm0w?=
 =?utf-8?B?WmU4Y0ViRDFzYjZPdlJwZHlzZjZuSURXbHlwM3pSd252bFZTRHg1ZHljNWxK?=
 =?utf-8?B?eGJ1bkR4YTFJcm9UdThHSm1nSzJ1TU52Y08vMUFWNUU4WVhvRHNXNUUvQk42?=
 =?utf-8?B?UTV1bzcxaCt2cmpMQzlZZGN2dGQrSTdrYXd1YnBtYnpiVjY1VG5DcVpyaTFM?=
 =?utf-8?B?UkhVUjc0cW5UL3hmR00xVFJFWWJmdmxjYjlFeUFXdmFPN25LUHphVG9YS2Vh?=
 =?utf-8?B?M1NDVE1nbmNpSTgveEorYmFEdGNpdG1kUEdwVnEybGdPVldjYVhlNUF6eUdv?=
 =?utf-8?B?dVBlS2YvVE9POG56dTl3TForVVZHK3VnNzdtVG5tQm5Fdk5hY29tSWd6SlZv?=
 =?utf-8?B?MzF5dlVBUnhlbWNMc2g1bkNybDZMYkpuSzV0dk9JSVFhNlhCT2JzeXlIYkd3?=
 =?utf-8?B?TUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 71630c4f-1d0b-4d0e-e997-08dc75783976
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2024 07:17:20.1940 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j7pm7nt1dZ5k0kVQyPK51oNlAFKhJHGpJ8NbMO3QPY9sCRJSNbKc23Id0Sqdypj16VmeU0d3PmT4m6KEVQ7yE4pAMtMM3pu0eaOiu4wxElw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5251
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on nie [2024-maj-12 17:49:12 +0200]:
> In upcoming patches we will add support to the VF driver to
> read its configuration from the GuC using special H2G actions.
> Add necessary definitions to our GuC firmware ABI header.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  .../gpu/drm/xe/abi/guc_actions_sriov_abi.h    | 56 +++++++++++++++++++
>  1 file changed, 56 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
> index dbe6eb47dd31..d5307b363537 100644
> --- a/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
> @@ -471,4 +471,60 @@
>  #define VF2GUC_VF_RESET_RESPONSE_MSG_LEN		GUC_HXG_RESPONSE_MSG_MIN_LEN
>  #define VF2GUC_VF_RESET_RESPONSE_MSG_0_MBZ		GUC_HXG_RESPONSE_MSG_0_DATA0
>  
> +/**
> + * DOC: VF2GUC_QUERY_SINGLE_KLV
> + *
> + * This action is used by VF to query value of the single KLV data.
> + *
> + * This action must be sent over MMIO.

NIT: Earlier in the file you used such a phrase. Maybe it is worth using it
     everywhere for MMIO message:

* This message must be sent as `MMIO HXG Message`_.


> + *
> + *  +---+-------+--------------------------------------------------------------+
> + *  |   | Bits  | Description                                                  |
> + *  +===+=======+==============================================================+
> + *  | 0 |    31 | ORIGIN = GUC_HXG_ORIGIN_HOST_                                |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   | 30:28 | TYPE = GUC_HXG_TYPE_REQUEST_                                 |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   | 27:16 | MBZ                                                          |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   |  15:0 | ACTION = _`GUC_ACTION_VF2GUC_QUERY_SINGLE_KLV` = 0x5509      |
> + *  +---+-------+--------------------------------------------------------------+
> + *  | 1 | 31:16 | MBZ                                                          |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   |  15:0 | **KEY** - key for which value is requested                   |
> + *  +---+-------+--------------------------------------------------------------+
> + *
> + *  +---+-------+--------------------------------------------------------------+
> + *  |   | Bits  | Description                                                  |
> + *  +===+=======+==============================================================+
> + *  | 0 |    31 | ORIGIN = GUC_HXG_ORIGIN_GUC_                                 |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   | 30:28 | TYPE = GUC_HXG_TYPE_RESPONSE_SUCCESS_                        |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   | 27:16 | MBZ                                                          |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   |  15:0 | **LENGTH** - length of data in dwords                        |
> + *  +---+-------+--------------------------------------------------------------+
> + *  | 1 |  31:0 | **VALUE32** - bits 31:0 of value if **LENGTH** >= 1          |
> + *  +---+-------+--------------------------------------------------------------+
> + *  | 2 |  31:0 | **VALUE64** - bits 63:32 of value if **LENGTH** >= 2         |
> + *  +---+-------+--------------------------------------------------------------+
> + *  | 3 |  31:0 | **VALUE96** - bits 95:64 of value if **LENGTH** >= 3         |
> + *  +---+-------+--------------------------------------------------------------+
> + */
> +#define GUC_ACTION_VF2GUC_QUERY_SINGLE_KLV		0x5509u
> +
> +#define VF2GUC_QUERY_SINGLE_KLV_REQUEST_MSG_LEN		(GUC_HXG_REQUEST_MSG_MIN_LEN + 1u)
> +#define VF2GUC_QUERY_SINGLE_KLV_REQUEST_MSG_0_MBZ	GUC_HXG_REQUEST_MSG_0_DATA0
> +#define VF2GUC_QUERY_SINGLE_KLV_REQUEST_MSG_1_MBZ	(0xffffu << 16)
> +#define VF2GUC_QUERY_SINGLE_KLV_REQUEST_MSG_1_KEY	(0xffffu << 0)
> +
> +#define VF2GUC_QUERY_SINGLE_KLV_RESPONSE_MSG_MIN_LEN	GUC_HXG_RESPONSE_MSG_MIN_LEN
> +#define VF2GUC_QUERY_SINGLE_KLV_RESPONSE_MSG_MAX_LEN	(GUC_HXG_RESPONSE_MSG_MIN_LEN + 3u)
> +#define VF2GUC_QUERY_SINGLE_KLV_RESPONSE_MSG_0_MBZ	(0xfffu << 16)
> +#define VF2GUC_QUERY_SINGLE_KLV_RESPONSE_MSG_0_LENGTH	(0xffffu << 0)
> +#define VF2GUC_QUERY_SINGLE_KLV_RESPONSE_MSG_1_VALUE32	GUC_HXG_REQUEST_MSG_n_DATAn
> +#define VF2GUC_QUERY_SINGLE_KLV_RESPONSE_MSG_2_VALUE64	GUC_HXG_REQUEST_MSG_n_DATAn
> +#define VF2GUC_QUERY_SINGLE_KLV_RESPONSE_MSG_3_VALUE96	GUC_HXG_REQUEST_MSG_n_DATAn
> +


LGTM:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

>  #endif
> -- 
> 2.43.0
> 

-- 
