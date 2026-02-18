Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B54FE9A02C
	for <intel-xe@archiver.kernel.org>; Wed, 18 Feb 2026 22:54:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1779510E04A;
	Wed, 18 Feb 2026 22:54:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Alxl5QSw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 247BB10E04A
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Feb 2026 22:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771455274; x=1802991274;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=uBthKvshpRBhEAl3LMqpfYohByfizhgBTaQxZcan31I=;
 b=Alxl5QSwtYzn1UbATeMBvQP48ZlHncqJo8UL+/jYGy7Ql3iwes2rOFrg
 Wz0QlJgPMpOLIcuOvAoXEZmGA1f5H3Z4Mz85B9TAT02pSF9ubH+huLO68
 RpJg7UNae8hCUXEkkMVb6ywCSN2Ge01W+SD7NxdeYHnDZ3k6XBWgR19Gb
 6Ovkx5V7XJp0ey0hQkhSO5ZwSWuYR/gzyEQjNjWwTHG6dmFPMXUiUVyJc
 zq83R3GNy5f+vC+f3SxtVYX8cv/Dvs39QCgB9tvtpU0m6VKqeqPNsRq7m
 3W1baRQbkGs3OMvcrt8cC3P+7u+niwxYc+9sTkY5ysJw2ZPMhnD2ANdmK Q==;
X-CSE-ConnectionGUID: 0r3A8He4SS2AXUA6Gt8QmQ==
X-CSE-MsgGUID: eI3ft4yMQiiWxqe31pGGYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="82867021"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="82867021"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 14:54:33 -0800
X-CSE-ConnectionGUID: wFT1QTbqStqOSpTmABQKEQ==
X-CSE-MsgGUID: yUmM7pNSQ4+muMdtC8uoOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="214339410"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 14:54:33 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 18 Feb 2026 14:54:32 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 18 Feb 2026 14:54:32 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.12) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 18 Feb 2026 14:54:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IdpQo8nRljHq2saObEjWZ/tV3J3Pk4vEmmbaqsdcwEW33sb8cF/h2s+N+VDjF1RpbYWMuo8HtZiEqmVzWM+5UVB3DF7O9wGLl2AlItZuyUuiVQ7o+UAGfYmDNF9cHj+/2c4SceGiXle9N+5fJjdsGTSsCmJHSvoqJ07O465Ng3rhZO1jZgRPYkV0QkJoLWhL0VCVhxVxnK0roCtIPaUAQfpnevVPsJhfx7d2JTSxifwuOnt7rt5MJaphnRFyqcWNkVVuhG3oxQ6HWQKOk41pXHOxw9QBmLiU9xO0HJNK48g+ZTxcjVVI4hyeOc7JBunDvEF4FStMwRvRjza8PUx7fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OvrqTclIx+1lEfRE39ngYjz5G/tTdtuNdATnYEh8t98=;
 b=b62DlViOiSh6kh+IQ0/CAOWCaXPueXQp27fkNFBbQeAAXdikJ/yxwsnvK8tVl/V2vHYbcLlK7L6ZS5eh56pWDZeSOLLWR7j+xGIrfuzqViImUy0YiObKy2pJi2b/u1cZvUVUfRZdhMhuE81XtmA86vvoFm/62s61v5yhIzRjr7T3V2W5DGBw8s0/Keg7TIdFFI5b5UrZepwWeyu5pQMrDFOAUihazORPZrPK8QnZTtpaiG0z6PkRPFoQJYHulT+WVZwYqjqUe6a7LI7PLsA5o/eifkUBb5w00fT2KCWFqFR2Y++oY+bmPaiKqQjcPhbBaOZ8Wy7ySnRz3rnbTob83Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH0PR11MB4983.namprd11.prod.outlook.com (2603:10b6:510:40::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Wed, 18 Feb
 2026 22:54:30 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 22:54:30 +0000
Date: Wed, 18 Feb 2026 14:54:27 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Xin Wang <x.wang@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: restric multi-lrc to VCS/VECS engines
Message-ID: <20260218225427.GA4694@mdroper-desk1.amr.corp.intel.com>
References: <20260218055033.327926-1-x.wang@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260218055033.327926-1-x.wang@intel.com>
X-ClientProxiedBy: SJ0PR03CA0140.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::25) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH0PR11MB4983:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c14d55f-c466-4f06-b61e-08de6f40ac9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aE5HZW5KZTdkNDlsdDB3akxUanFiaXAwb2w2K2pwazA1MytOUmRka2lPMmNl?=
 =?utf-8?B?S2Q5KzU5R05VYjdyUDZmdzh5YnJWZ3NGaEdvSHBJYlA3RFRFUzI1M29MWGVh?=
 =?utf-8?B?NVN1dzMxZVNyU0FvMXNRWE1Ub3V2YXZNYlExK1pnYWxScFh1WVVFdFQ1YjFO?=
 =?utf-8?B?RmJXZGswM280L3ZreHc0U1c3U1VCd052bGRGbmVnb2F4TEFNdXVLT2I3eXUv?=
 =?utf-8?B?ZldNdEx2cGhoMENPaW1NTlBCdG1qUUp0K1RZWnJTNXNpN1Y4U2wvZ2t4dUQz?=
 =?utf-8?B?dDF2K3AwVVJQeWczMmpsZjYxQjVqeHl0M01hUHdaRms4TlhkU0l4Y0o2bUJN?=
 =?utf-8?B?WkV3WFNRYVg5RDdFN3p4TjBoVVcvN2cyUW5mT0RWcWpwMWFOOU5ocmpqYmVL?=
 =?utf-8?B?TWFXUW1IUEZheFZMTnJ2azFTd1R6Q2Z0VXpCckNON3Z3OUMvWUtMcW1NSGJE?=
 =?utf-8?B?ZU8wZXd2RVFiczJ6SWEwWjlRWkUxOS96aHpFN3RMeXROT0gzN2VXZW5pYmpl?=
 =?utf-8?B?UGYyM0xzMWQ2UUU0bmFPV3FDR1pySE5TSGJrYWJ5ZlRyZFBEd2xWdDAza1pj?=
 =?utf-8?B?Y09EMTF5M2xYZ1BReTNTUGRQNlEwVXUxZm5PcExaZUR0K1FNSTdKNWlJQjV6?=
 =?utf-8?B?ZVd5akQvcmxvOXFWTUdURTNnb2t4cWlsOHQ0ZHAyNmkrRXF2UWNVQlZqbnk3?=
 =?utf-8?B?L0VONXJhYndxMnBJRUVTcW11MVlhZU92UXlWWDRUSlNCTHhaVE5jOWhPbFlL?=
 =?utf-8?B?Qm94L3ZVWHZuYjNnLzJMUlVOMndOMkV5OGRiYVYwcTBObDJzYjE3NWpvWTZv?=
 =?utf-8?B?OW5QbE5TS1U2Z3Q2UmU4anpVcFB3aEdMWHFub2d5LzVuSiszNkhjMmRFcW55?=
 =?utf-8?B?bGpvb3RJek9aOFd6Tmszb0piRS9IV0pPQ1U4aTBacmsxUVQ5ZzhQUzA5cENt?=
 =?utf-8?B?eDFNOHI1UDJWd0dFZThkQjJrRk9BKzBmUUozbXc2UUxMd3dtRXpvRkRXM3hC?=
 =?utf-8?B?enFqLzg4aUJKTWpvN3ZGeVM2dENvTUFNM0JQc3ZRWTVKdE5vL0o3dVdLNUhC?=
 =?utf-8?B?alNHUmpROXhvR1hDc2hNRUh5ajVQSkJxY2FJQmxLZkV5UzNPZWdSZFNuZDln?=
 =?utf-8?B?dmJsUmNxcjQ2Y1Zpd01wZklscE5kUE5XMFA5S01MQklLTjZjeUZTNlVIdWo2?=
 =?utf-8?B?b1Q4SXBhSUhmSXk4VHVYQ2tuc2xVajNnVzRmRGxQRHByVEk4dkQ5eUh1aDBH?=
 =?utf-8?B?dkdkdkh2bi9WKzBMcHYrckhQQThMV0hHODhXK3NjdFlBZWI0WldOSDNJZURC?=
 =?utf-8?B?SDU1WWlOQ25sakJPSDNDZUwyQjMzWmp5cUZna2FiS3B5S3JqQmhhZTFJNVJT?=
 =?utf-8?B?aWc2ZU5BWnJBbGQzV0VhVTFJV05JSkQvM2dZc296NzlxVjM5YWlqZXV2Tmlv?=
 =?utf-8?B?ZkxvTjJsdEFmalRPbnBSbFlwOE9iK24vK0s3NDNMUXVxdk1aYVdRMmpBRXRt?=
 =?utf-8?B?VDZIbHRYVDdrWkI2Zk41cEZreVRjVU16N01Send3RmJJbTRPaFpxZkZZcUQy?=
 =?utf-8?B?bndTRGtjUXFoRmpnWTdGK1YyQklMaTJBRmtONFVTZ1Ywbnp1NGRvdmZZRVlj?=
 =?utf-8?B?TUVZdjkyTFFUeGNWYWZxYXdpNE15aG1PQlJ2L2cvUHBudldwUE80UkF0TGF1?=
 =?utf-8?B?Tkk4NVBNTHhDYTUvZTRoUnJuM1ZVL2JHbmpHTHAwNUVaQ1pqR2dPUTJxbUhB?=
 =?utf-8?B?dWQ0b3FWTzBmSEdTc3VJQmdkdHkrVVk2N28rV2FxZFJLS3lqYWIySUFkd1lS?=
 =?utf-8?B?ZGs5MmtUclhkSlQ3eEZEaXNaNXJsUklGbnEvdkVTV0FuT0s2VmZ6aXRTam45?=
 =?utf-8?B?NFF2RlhwYWJCNVM5WGRvWTRyUW12dU9ZeUhSb0RQc3dGY0VYZkplWkZPZVBS?=
 =?utf-8?B?ZWNaK2pvV3ZXeFQzNlJjKzJuU1NrZTdyYUVVbEgrTW5EajFZUHNTUTlWTENH?=
 =?utf-8?B?Q1o1VXo4ckhDcHVkc0xjQnFCL1JtdUNCbXQzcGdnaE5WUnBQTjJhZmEzMVZj?=
 =?utf-8?B?N1lNR3RLS0dkVy9NSUNrYXNENzEyZUwxTXdrSnpuTDJvM1djL3c0YzdtMWZ6?=
 =?utf-8?Q?WCGU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZHFwbndNS29ETHdqOGlOY3NOMlA4NE5qeW9jY3A4dUJTWHlCZ1RjNGd3QUM5?=
 =?utf-8?B?UlljcmtqZFJ2T2hrSFZNblZTTW91VDA4elVQVERxWXQyT2Y0clk0allydVVX?=
 =?utf-8?B?OEwrQmxkNVlpNC82MHdpQTNuM25aMStNTmFBQzVrTEgrWlFVY2owN3BabFcr?=
 =?utf-8?B?MDM4bFZNQjlTenlMWW8xYTJnSmlIeW83eE5HaFNFNy8vTnFoQjFIMTJPTWR5?=
 =?utf-8?B?K2hkRkdkcHdENUZCblBwL0ZIYlpEaytiSENoeDNFcXdnR1l5SVRSQ1lnWVRo?=
 =?utf-8?B?Qm1NY3BZUTRBMVk5SCtCSUt3R1BEWncwdjdkSzk4QS8wVGtDRmFMWmFZMGho?=
 =?utf-8?B?cXZuQUZXMFZCMXFXVENUMVg1bFQ3dVZoZEdMMVhLdVFHREQwTkREbC9Hek5M?=
 =?utf-8?B?aXJFR0xobTNWOHVsZUJEMWt1NFVyOGx0ek5lU2ZNNFpyVGlOTDEyZy9kcXQy?=
 =?utf-8?B?Wm40NyttaVd1QVROL1l6alZJVk1CNG1qZTJKZ0JDaVdkeTd5cXVYb3lGN2xM?=
 =?utf-8?B?OUJNS2ljZ2dBbmVid3kxR1dCMTYxeVZqUkxVVlI4WlBxaXgxaThPMEVUSmVG?=
 =?utf-8?B?YjYzTjc0ODN0ZUhCRU8zRmoyWGVFYXBRQWcyT0w3Z3BiSW1rVDVxWUk5Mjlm?=
 =?utf-8?B?ZGlQendsRUUvL3FLVWxFVmg5YkJvWWNwbDR6RFBnQzlJRUtZelZFQzFFdEdH?=
 =?utf-8?B?OUF0V3c4SklSZEhJckt1RHA5cXZKeHBxeE5aQ1hxdXlqV04yZDJMRmttakdE?=
 =?utf-8?B?YzFFVFczNE5FOFRRVGVPOHJCc3VzRUl5WmdsZ2xreDZZMkpuTi90MEYrNEt2?=
 =?utf-8?B?REZZRjdaNmNvR2lkWUc4cjE5MDVJNEN4dVJyZjdkZ2prV3NOdThkMzQ4R3dW?=
 =?utf-8?B?dGFROVBXZXNRRm1UMHNhL2JnNUJncEhuZWtkU2Y1WEJlQVFTYTFsL0xIMzBk?=
 =?utf-8?B?SGZNRGZBQ2wxcG90bWM3Nk9aaHU1dTVRTnlISEh4TThZYlRTQkJBYzlpRmNy?=
 =?utf-8?B?VFJFS2x5SEFwRzJOVjRvVFZWQWlRTzlMakdOZktjS1JqUmlYYWdzdG5Lb3Vs?=
 =?utf-8?B?RC8vSGtaYVhITlRlQVJ1QWRVMk8yTC93K2NNNEpBMTZjdDFvbnoxcWdUZUNa?=
 =?utf-8?B?QlBzNFkxNVo4VU1SdEhlRWY1TVdMWCtxVmtRVEdTYkVXNHViLzFjdXhia00y?=
 =?utf-8?B?YVhuc1YvbTFndUp4K1RHNlJFTDArYWRNbnljQXFpVExXSEI4MHVWbmtWUDJP?=
 =?utf-8?B?STd1bDFQY2NpMTBYWm94S21tSU96OFA5OG5aT0N3UGFITmZIdnBzMExIM3dl?=
 =?utf-8?B?SGVWVUdXTXlTaklSTTFvT0Q0ZjFnNk12bncxWVVCbkVJdHdIKzFmbW1MbkdL?=
 =?utf-8?B?ZkM3dGJvUVZIbW53Qkx4Ry92Y21yZldrMHJENmV3bGhCNEhjZkI0WkxBVFN1?=
 =?utf-8?B?QUNDNDh1UlRQOEQyaUk4ZStIRlplMHFkc2xRVmp0RlZFYTJwQTBtWWtMMkY5?=
 =?utf-8?B?RGRNYkZzNW00TW80TzhUeVg4Ym52OWIzS1preUEyak1VdGxYMHVZUG5Hb2o4?=
 =?utf-8?B?ZWh4VFoyaThkWjhQcWQrQ1BhNFgxdVB6ZERHbFVhbzN0eVNiaDN1d1RQWG8w?=
 =?utf-8?B?Tm9pRmhXTUZleUdRM1k4azhTdFVnN1RjbkFzd2paREtjUE90K0VzSE9iOHBw?=
 =?utf-8?B?bWRNYXUwaUNMUHdXSXVhVUxINk5LZ3A5YXRIdmJKMCtoSDk0UWd0TTZGeVNn?=
 =?utf-8?B?WDd4ZUljQ0JvL2Vpc21ObCttTWo1WmRPTFlZdVlydk05bXNjY2pCRSs1bUtI?=
 =?utf-8?B?dG96MEZPYkFDZ0Q3Z1d4aUlNY1ZQd1dMMkRONm9peDNGQmVpSmJ3a2ZLamxt?=
 =?utf-8?B?Qnl3T0hqeVpQZXRqc2RvU21LVHJ4a2JvWUxsN05uSmZ2VFVuQzdYeUFJQVpt?=
 =?utf-8?B?dkdSVDNjVHFoTlZRV2ZkbmlSdFhhemN0UWJKN2NyUUdkZUNnSTZJbW1zVkJG?=
 =?utf-8?B?TTdMcXpYeGhzR1NKM3UyK2Y5V3dJeEpGTnpoaThnMjFaMGNvaGpLbHVUNWVN?=
 =?utf-8?B?ZE5zenJ4dytCODk4QjMvdjZnVnl2anMvd1l0Nk9HSnRMYUxDLy9Eb0podlM1?=
 =?utf-8?B?RFR3MzVIMURZM0FLc1RhanJYcjM3U1lTZnJCY200dGg5WlNGTkJ1Z1NGV0lI?=
 =?utf-8?B?QUNwdndRbXgwenhxY0w4MDhncklmRkQxcFpOeGl6c0dzMURhRUI3UUpsSnNB?=
 =?utf-8?B?Wkw4bFNrdThtaVJWVnZIalpCOWwybi9tbjNjc3o1eGRhQ3RINGhXSmVaZWNv?=
 =?utf-8?B?WkhNVVFlbmVMSzBDY3pwWE9KcEc0SnNEWjhFWXQ0cmROU2ROWXpJVThHKzRS?=
 =?utf-8?Q?O9mwxAdbwNMK2t/E=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c14d55f-c466-4f06-b61e-08de6f40ac9f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 22:54:29.9628 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DvbwIp1IsG2nXtccKG1TEVSCY0Nh59qu2BsgA/zvoVxEn7z1c3ppScls7357wa84hVVgyI/dPTy1x/cmkfUonjYWF7naimoMIPQBVbT4HLQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4983
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

On Wed, Feb 18, 2026 at 05:50:33AM +0000, Xin Wang wrote:
> Remove multi-lrc support on non‑media engines for ModSched
> platforms, since GuC firmware no longer supports this and
> there’s no valid use case.
> 
> Signed-off-by: Xin Wang <x.wang@intel.com>

Ack on tightening our uapi checks here.  It was an oversight that this
restriction wasn't already in place since we usually try to avoid
allowing uapi cases that we have no userspace consumer for.  It's been
somewhat of a moot point until now since width > 1 requires multiple
engines of a given type and our currently supported platforms with
force_probe lifted simply don't have that:

 - There's never more than one RCS.
 - Our current platforms have 2 BCS engines, but only one is exposed to
   userspace.
 - All current Xe2/Xe3 platforms except BMG only have a single CCS
   engine.  BMG does have two CCS engines [although you need to adjust
   ccs_mode to see both of them], so technically someone could have
   tried to use this on BMG CCS, but I don't think there's any actual
   userspace that would try to do this aside from an IGT test that
   blindly creates exec_queues without paying attention to what the
   underlying engine type is.

But should we move this check higher in the function, before we ever
bother with a VM lookup?  Then we won't need to release the VM lock and
put the VM back.

Also, do we need the GRAPHICS_VER check?  While there may be more cases
of multiple engines of a type existing on Xe1 (e.g., multiple BCS
engines on PVC), there's still no expected uesrspace consumers.  Plus
Xe1 platforms aren't officially supported by this driver; if you
manually force Xe to load on those platforms you've already tainted the
kernel and all bets are off in general.


Matt

> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 66d0e10ee2c4..9f5e9d78c8c6 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -1200,6 +1200,15 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>  			return -ENOENT;
>  		}
>  
> +		/* multi-lrc is only supported on VIDEO_DECODE and VIDEO_ENHANCE engines */
> +		if (XE_IOCTL_DBG(xe, args->width > 1 && GRAPHICS_VER(xe) > 20 &&
> +				 !(eci[0].engine_class == DRM_XE_ENGINE_CLASS_VIDEO_DECODE ||
> +				   eci[0].engine_class == DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE))) {
> +			up_read(&vm->lock);
> +			xe_vm_put(vm);
> +			return -EOPNOTSUPP;
> +		}
> +
>  		/* SRIOV sched groups are not compatible with multi-lrc */
>  		if (XE_IOCTL_DBG(xe, args->width > 1 && has_sched_groups(hwe->gt))) {
>  			up_read(&vm->lock);
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
