Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDEBBC282C6
	for <intel-xe@archiver.kernel.org>; Mon,  3 Mar 2025 22:07:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B709110E15E;
	Mon,  3 Mar 2025 22:07:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CSogcTTC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65C3910E15E
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Mar 2025 22:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741039620; x=1772575620;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=04nIJ7EVaF/XZLNr9Lk4ccn8sgR36iahm5o6lmYx0Mg=;
 b=CSogcTTCVSf+vs6eLmZvb5gjkoPwhamYmhOcbPZ4BO9K6+8AyDEpd2Za
 6NbXQSYAW01bVJSD9TPPtvXKk/bxmwbFvC180ugwPqaPWpfwqlKiOFQHm
 687ZhjkN1eHq9oFhxFgaS4cs6XfOrvzxdLYtq4HjQpAx39KF+oTjsVGnO
 ac4EYntDR1wq7gbG+/KT+S4/otI+ve+tucUuZEmjSu5lQzYx+fXr0qHI+
 m5uAXFxFWayWl0cYjDySkihXOkU6auuPv8+4C45nQ4BQjdaFIoMRCpY/r
 /0qg2JV61Iq053jogh4bxAgGpzhjO3W0gnjVdhpP3iaQwiUPVXdiXWEju w==;
X-CSE-ConnectionGUID: 73XXF1t7QmqVGn0T0Vq4Wg==
X-CSE-MsgGUID: +3vCsm0ITdC+bawFmKqVjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="41180069"
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; d="scan'208";a="41180069"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 14:07:00 -0800
X-CSE-ConnectionGUID: P9LNVCJ0SxKULXS+h2rGhQ==
X-CSE-MsgGUID: Q2Fm1yZiQJuUd8ytwdVg2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; d="scan'208";a="148981179"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Mar 2025 14:07:00 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 3 Mar 2025 14:06:59 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 3 Mar 2025 14:06:59 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 3 Mar 2025 14:06:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H/gjeGXC/fJOXB/aJtK5aer03RVgesREwqgFM6+xUHn5x1qGZgLdlUNXlnzMg/Cx7yDabTYquIfE0cEbMx3J6BIw5Rzs5nZyfzMyc4ZWv/Xkw/ZRC5TKQJCmfCOIASlB2ULr/4R1+MIIW+TiH1LXQljZtHgpwJjp2jidIqUULnRVhlisgflT5UQyr4aoPl6vO6Vf2iNGS89zyYD5MrxDL2K6CCKOJlxLSv1l8WHZSwsyEtTv9hI+yAJknmxa61US9JD2yytK1So1fYjvoiMb3zT9QZMiyEmbRGwNeVL5Fqbj3632ZKMQeW3kjuTYzvaWo1MMZL7JWZmmKJzVoUe9oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yiv3m1jcxthIsrCdwm3weJ/Q+pJ8+d5GC+NgTA1Nie4=;
 b=teq6nqUtYMKLGNYtcFs0JnZiwzYlYcRhiQEAGKzFC/16K89ywgtGn1X6jAiAELdpHJFvK2nu14u3EInA+nQ7RDWFKNLylF/hw76TEnusUAJvJ+h+VJYR7wp6iif1hB4AAG1goPefs7GQc22uOfB4GPtPMrwohxBmV1D7UV2uEgAaw7zeyvADPcBfSkwo6Idaesa9p9iOUBoTBVSu4GXrzGlC7vTB+hROX0kt6aGAXplstta1OwDNaFK5iLwgnMNhSnGyuVpneiBOzAMLb1wsibzpJvLN3ByD92kSx5EnCiQyO1g8ckPyS4hmzR82oxrX0hKKzj1BCVcZ9tZAtBt4cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by IA0PR11MB7306.namprd11.prod.outlook.com (2603:10b6:208:438::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.28; Mon, 3 Mar
 2025 22:06:53 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.8489.025; Mon, 3 Mar 2025
 22:06:52 +0000
Date: Mon, 3 Mar 2025 14:06:49 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, =?utf-8?Q?Micha=C5=82?= Winiarski
 <michal.winiarski@intel.com>
Subject: Re: [PATCH 3/5] drm/xe: Avoid reading RMW registers in emit_wa_job
Message-ID: <20250303220649.GC3175483@mdroper-desk1.amr.corp.intel.com>
References: <20250303173522.1822-1-michal.wajdeczko@intel.com>
 <20250303173522.1822-4-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250303173522.1822-4-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR05CA0007.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::12) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|IA0PR11MB7306:EE_
X-MS-Office365-Filtering-Correlation-Id: 13752407-710d-4ca2-0b90-08dd5a9fb3eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Rm80ZHRMdTR2ckYxbTFJcW1VM3JRVDFGZnVvU3RwUi96aGVPK3NabFBPVXRq?=
 =?utf-8?B?UEgwUGNKWWRhc3BONVJMa1JHYWdtZ2dxdWpYaGdhWWVnc3F4aFpHK2c2M3lm?=
 =?utf-8?B?QnRCSlhQcThXOHpub2tFV3FQS20zcVVCUjZ2c21zaTl2RWVueW04S0crMlJh?=
 =?utf-8?B?OERQQUJmQjIySnhRMTcweFhRWG1oM2RFVllXakg1Q1NzMVg5QTNyRGdTTzNh?=
 =?utf-8?B?NnhEU08vUnQxdzVxT2VaRFJrWFQveGs2MWtLMXZmV2MxeWJ2SW4wSituc2hZ?=
 =?utf-8?B?ZXN1NG41UCs2NmpET2FtT3F4SUgzd2M1NDYyWlZ5clVBZXVDRGlwYUdhdWFk?=
 =?utf-8?B?amhNQ3haYmdjWCtWdUZLR2VkMm1yZm9oeFhHV2lJcnI4UjMzbXgwOXFLL2p3?=
 =?utf-8?B?TlRvc2ZXdTRHbUM4cURXZEZ1N2cxK2xjSWZGZWhjeGF5T05PbFB1WVJwZ0JQ?=
 =?utf-8?B?L2wxbUhLTFhQaHpQYXZSVktlZDJTNXpKQ0NaTzdSZHFyVVVadEJycWlsajRl?=
 =?utf-8?B?Rm5vR3JHcDRseVVTQnJ2clZxZGJRR2xkVi8yTldJeVFpTFkvbWZTb1FQZ3ky?=
 =?utf-8?B?TWswcHI3NUN4a2FtSkU4Tk53VGlGNW5hVllWT0VjeXVwM25xUHZNQkZWVGUv?=
 =?utf-8?B?SVFGVm1pZUN0bm5iVnJnOTcrNjAvTzB3NEEzdVhKa2E5NTJtRWs3S3BYNzV3?=
 =?utf-8?B?Z1RoaE4zbXpGSE40V1NVemlvdHhQK1J6TkFUTW5QM2xOSGE4cUo4ZW4wUkxr?=
 =?utf-8?B?NUhxbEQxYmI3eHk5a05Gb1NWVVRtc3BCNzlOUE1iN2pSb3d5MHpqMFlZckNW?=
 =?utf-8?B?Z1V5NHd0U3RWTk9nWnRaS2RhNURuNXZQelRaSlIzSEVuUEtCajJZRkpMOHZK?=
 =?utf-8?B?RkJjd2xxUEdyT0d5a1J3QWh2aW01dllJdk9GL2xwdk9VMXZORTJWampNUDRB?=
 =?utf-8?B?clRNOUdENVBFQk1jY21pck1sUkhyTFZYais2R1NpVm5EMWNEaDVPV1EvSGRN?=
 =?utf-8?B?SlRCblcwNU43eUpwNkNCekJOQnZ3dHNOWUZUWWxKQUcwdmgzZnFVM21ScUFV?=
 =?utf-8?B?cG5yNEFkNWM0U3NsS2U0Z0RrclJkRCt1UGdKUk54b1pMb0VwVDZNa0ZsNkxS?=
 =?utf-8?B?aGg0VkllRGtUK3FndDd3a0VROXBadEV4NldTZVBsNktDNDZQaXVHVHo2RnhJ?=
 =?utf-8?B?dlNocjJMckFuNUlld3ZabE9wU3dNUEJQcVBhM1ZBTjNRVzd6R2JxSE1MY1Ur?=
 =?utf-8?B?bHI4amtwUDhyTzJ1L3NHNTArSkEzUmx6YllJTW9qaENYV2tZTURtS1lhazV1?=
 =?utf-8?B?TVF3eWtoaURoSTdTVzVWZDE1VThPWHhsc0hzT0NCakttbXFFaUo5dHFiSmhx?=
 =?utf-8?B?cis4R2k2RlpJL3NBN2JXeDJxSS9UUFNnQ1hlV3VrN2JrN1NGMlE5WGh4dE9Y?=
 =?utf-8?B?RWNWcm9VV2N2RHhTTkdNcWdwQjVGZ29aNk1lZ0JJTlBOMks1ZGJvNS9US0RE?=
 =?utf-8?B?djF2OFpZQnJCNklVcVRRZjhob0I3UWtXUzRmbGYzalAyUWVrM0s2dVJkS3pa?=
 =?utf-8?B?eFg4L2ZkTENjOVRaOUd5TTNUaWx0MDB5U0tqQXM5N3BWYzFBcTFPY2NhQ1JP?=
 =?utf-8?B?N0ZkWUdmKzhvV0luYllTSmtKdFNoeWkvc2RWUkhMYncwUXhPSHRLdloxSEVw?=
 =?utf-8?B?T1k2Mk5DTzZsbXZQTEMyREhSWTI3Z2pOSVNRM0tFdXBmMDdZb0F1YTBCUDJB?=
 =?utf-8?B?aGFxK3pCRW9rQVQvWnpTdkE5RUNaenpWaUNFVnQ2eVIwZEhmWFpEamxtZTJi?=
 =?utf-8?B?bFR2TjRTRllZdUFQR3ovYStOZ0V4Rm9kRkY1bnBuZkRLWUMyRnZWSS94NEwx?=
 =?utf-8?Q?dPtjHp92+1D5N?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MTc5RkQ5ejJmeXAvTnN5RnVkYVloS3dtbmJaa0s4RnhqVUF1NEhRK1RmZk5h?=
 =?utf-8?B?a1BmeFFBMUl6bVYxckc5bkxBRkJkWi9iTnJQZ1ZtTjBFdmV2Wm9WNDlNdHc4?=
 =?utf-8?B?TmxsODk2Vk9aWWJXUVVLcks4ZmY3MEZRK2l4blYzNTdPQkRxalBidDFIdTlR?=
 =?utf-8?B?M09ib3AxaDRBRHhWdkdjZWpzckRZbjVsQUhtMndXZ2VuZXp2WWMwS0d3SlVl?=
 =?utf-8?B?dkt4SmlScDBqa0FrSDB4cHVQZnFiQS9Ia3hZcXVVejJLc3VtL1didzJ0N3Bj?=
 =?utf-8?B?OFB2K1JhYm5BQzZ5aVZ5WHNSSXdBV0dZSFlvU0pXRFA1YzR1Z1gzNFRnaGo0?=
 =?utf-8?B?N1NZYldKbEw4Y3VNM0NUT21velI2S3NOUld4a2VzV1lPbkVPeVBDSUVXZzln?=
 =?utf-8?B?VGNkOVBxSXA1bEg5Wk9RZFlVSllFL0hEWlk1dUErK1V6MXNPMmRpY0ZSOFgr?=
 =?utf-8?B?b21Sc2Y1TXpOeVV2MXordEhEV0lMcDlMZkFqd2pScFNFZmR0SUluMVk2bzdF?=
 =?utf-8?B?UUkyZTdMd1RZNkFUcEc4WS9zZFZxUWlhR2dkcERndXhDdHBPWlM4QlQzanVD?=
 =?utf-8?B?Vi9wQzd1YU50U1RzRjFuM1RNdm9rdlF4eWsxb0hNTGxMdmhZTUZLdmZoZ0w2?=
 =?utf-8?B?MDVUbVlJdjQ0a21DZFFNZCtIRktxVjFGVGlZRGdZcW93VmxzUjZ6OUdtVjA5?=
 =?utf-8?B?TVNPTGVSTXRGWCtxWXFtOGMvS3ZDL01jRWwwdmdBenN2YlhGZ3duOVQ2bkFk?=
 =?utf-8?B?eGZoM2Zlbnh3MXk4K1R4ZlN3OFZYTXdmbGN1YzlvMy93QWRkRW91ckZBQzFR?=
 =?utf-8?B?bGJUT0gzVmkzcm9ESmV0eUt1NThic3dVbnNjZG1pSCtNS3BKRDAwcys1MzMv?=
 =?utf-8?B?ZUlCUENWY0ltaExMQ0kyYWdhTEc5Myt3ZUxaUEhWZHdRVjZRUVFHbS9nclJB?=
 =?utf-8?B?bHl3c3YvWFpqcnZMWlRPYnI4elQ5elhhbC81Tk5sTitqLzQ4Z0EyckNnbmVD?=
 =?utf-8?B?MTlyQkhVM1BjQm52aS9SVUN0NXdPcTFjUlRoZks2bmpxd2Z6bGVvTVZaM3dm?=
 =?utf-8?B?WjRpRDg1VEhvS1NIb2FGR0tNUWJ0cnprbWhwWUtMdHpUTytQRVd6WU1WeFNo?=
 =?utf-8?B?WHFHd2o2ekJUemxNaEt1SWFmdDVIY2NhcHgyMGZtVVo3NTFwT2xQd0tQRDha?=
 =?utf-8?B?NTkyRkYrTG1zbGdLK3RFSHExbGs2cjdOd0Q5SkhMN2NVbnEyRFdJcFlnSkg1?=
 =?utf-8?B?RTQzWndnRFlGL0ZIVnA4cVBKbzEvQXZud2xyMzkxYmJ5d2R2TWZSSUcyYVla?=
 =?utf-8?B?MlY1OFZFcXAxcmtPaGhqejNEenVxa0llUzhVZjRRK2FXMlRxWHN1Q3BKblli?=
 =?utf-8?B?YmV0TEpsUlZvVHRieGRhNVNnZTBjM3V4bUxhSjV3dFRJOVpaVWwrcUVwKzRx?=
 =?utf-8?B?ZXhNOGdrOWJpWDYvZFYyazUzajFJeUZySG9FNWhsMzV3MGZyRUdUVUpNb3dM?=
 =?utf-8?B?VWxBR2RpMHJLQmNMeStydkVxeVlhZTdiNG9hVGxuOUV0RWIxNjZSVnpRa1NS?=
 =?utf-8?B?N0tVeHRHVEJ1bXY4WFZhL2ZQbXNFS25SRXBDSS9hRTJJQy85d1RPZGRoN012?=
 =?utf-8?B?bzlwR3ZNSERYRE1RMEZ5NG1xV2poa0pMNjhESEh1bUw3SlY2bXhsTm1IcUFS?=
 =?utf-8?B?NEIvWVZyeEZVejEvTHJzaW9ST1JOTE9TQzFHL3hDWU9mUVErUElLaXRxTnl2?=
 =?utf-8?B?dGxWRm5BUTJOSnJ3OW8wMlFrK0l1UnkyU2JqWENyMG1Ed2QrMEVtOGhnN2g3?=
 =?utf-8?B?QmY2ZGRVcWJGUHRkejlFcnY3U1FjWDRDR3J6RWh0a1NlTUVyR3VhNHhuTExh?=
 =?utf-8?B?N1gwRFRFZ05tNzlWZ0dzb2dxOEtCRThRT1MwUHBOQ2wyNUwzdVhTaWpMZlMx?=
 =?utf-8?B?d3ZNeitsc1RMblNnODhaUDFsall1WUR2WGVZMEZ2eGg1TU9kZ1JEVCtSSFdx?=
 =?utf-8?B?NzJBTnA4UjY2bFhuc1J0MFk4SXNyMnNVbUFsSndhLzkvblYrOUZ3dnIzQm80?=
 =?utf-8?B?NG9ORjVXcDZOd3M4YlJLU3g3a0d4RnViVlcvWmVXSEZGdzZsTVlySjJMRGV2?=
 =?utf-8?B?TWY0QUxtcjVobWFWS2pudUIrUm1aSFd5YVc4YngzWm5NOCswd0xvQWtpR09h?=
 =?utf-8?B?UkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 13752407-710d-4ca2-0b90-08dd5a9fb3eb
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2025 22:06:52.3155 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KlgO4043wMbSCJdJ2ccLA2f/yGbTM5rvrOTbI0V09bfLXSulW4YYRXxyj2EwQ3KtFg8GjUmHkukb1Go4fmYrRhfBwP2egGf7e0EvxEmfB3s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7306
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

On Mon, Mar 03, 2025 at 06:35:20PM +0100, Michal Wajdeczko wrote:
> To allow VFs properly handle LRC WAs, we should postpone doing
> all RMW register operations and let them be run by the engine
> itself, since attempt to perform read registers from within the
> driver will fail on the VF. Use MI_MATH and ALU for that.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Michał Winiarski <michal.winiarski@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>

It always confuses when reading code like this that MI_LRR and
MI_MATH_STORE use opposite orders for src/dest registers.  But
everything here looks correct.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt.c | 84 ++++++++++++++++++++++++++++----------
>  1 file changed, 63 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 10a9e3c72b36..8068b4bc0a09 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -12,8 +12,10 @@
>  
>  #include <generated/xe_wa_oob.h>
>  
> +#include "instructions/xe_alu_commands.h"
>  #include "instructions/xe_gfxpipe_commands.h"
>  #include "instructions/xe_mi_commands.h"
> +#include "regs/xe_engine_regs.h"
>  #include "regs/xe_gt_regs.h"
>  #include "xe_assert.h"
>  #include "xe_bb.h"
> @@ -176,15 +178,6 @@ static int emit_nop_job(struct xe_gt *gt, struct xe_exec_queue *q)
>  	return 0;
>  }
>  
> -/*
> - * Convert back from encoded value to type-safe, only to be used when reg.mcr
> - * is true
> - */
> -static struct xe_reg_mcr to_xe_reg_mcr(const struct xe_reg reg)
> -{
> -	return (const struct xe_reg_mcr){.__reg.raw = reg.raw };
> -}
> -
>  static int emit_wa_job(struct xe_gt *gt, struct xe_exec_queue *q)
>  {
>  	struct xe_reg_sr *sr = &q->hwe->reg_lrc;
> @@ -194,6 +187,7 @@ static int emit_wa_job(struct xe_gt *gt, struct xe_exec_queue *q)
>  	struct xe_bb *bb;
>  	struct dma_fence *fence;
>  	long timeout;
> +	int count_rmw = 0;
>  	int count = 0;
>  
>  	if (q->hwe->class == XE_ENGINE_CLASS_RENDER)
> @@ -206,30 +200,32 @@ static int emit_wa_job(struct xe_gt *gt, struct xe_exec_queue *q)
>  	if (IS_ERR(bb))
>  		return PTR_ERR(bb);
>  
> -	xa_for_each(&sr->xa, idx, entry)
> -		++count;
> +	/* count RMW registers as those will be handled separately */
> +	xa_for_each(&sr->xa, idx, entry) {
> +		if (entry->reg.masked || entry->clr_bits == ~0)
> +			++count;
> +		else
> +			++count_rmw;
> +	}
>  
> -	if (count) {
> +	if (count || count_rmw)
>  		xe_gt_dbg(gt, "LRC WA %s save-restore batch\n", sr->name);
>  
> +	if (count) {
> +		/* emit single LRI with all non RMW regs */
> +
>  		bb->cs[bb->len++] = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(count);
>  
>  		xa_for_each(&sr->xa, idx, entry) {
>  			struct xe_reg reg = entry->reg;
> -			struct xe_reg_mcr reg_mcr = to_xe_reg_mcr(reg);
>  			u32 val;
>  
> -			/*
> -			 * Skip reading the register if it's not really needed
> -			 */
>  			if (reg.masked)
>  				val = entry->clr_bits << 16;
> -			else if (entry->clr_bits + 1)
> -				val = (reg.mcr ?
> -				       xe_gt_mcr_unicast_read_any(gt, reg_mcr) :
> -				       xe_mmio_read32(&gt->mmio, reg)) & (~entry->clr_bits);
> -			else
> +			else if (entry->clr_bits == ~0)
>  				val = 0;
> +			else
> +				continue;
>  
>  			val |= entry->set_bits;
>  
> @@ -239,6 +235,52 @@ static int emit_wa_job(struct xe_gt *gt, struct xe_exec_queue *q)
>  		}
>  	}
>  
> +	if (count_rmw) {
> +		/* emit MI_MATH for each RMW reg */
> +
> +		xa_for_each(&sr->xa, idx, entry) {
> +			if (entry->reg.masked || entry->clr_bits == ~0)
> +				continue;
> +
> +			bb->cs[bb->len++] = MI_LOAD_REGISTER_REG | MI_LRR_DST_CS_MMIO;
> +			bb->cs[bb->len++] = entry->reg.addr;
> +			bb->cs[bb->len++] = CS_GPR_REG(0, 0).addr;
> +
> +			bb->cs[bb->len++] = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(2) |
> +					    MI_LRI_LRM_CS_MMIO;
> +			bb->cs[bb->len++] = CS_GPR_REG(0, 1).addr;
> +			bb->cs[bb->len++] = entry->clr_bits;
> +			bb->cs[bb->len++] = CS_GPR_REG(0, 2).addr;
> +			bb->cs[bb->len++] = entry->set_bits;
> +
> +			bb->cs[bb->len++] = MI_MATH(8);
> +			bb->cs[bb->len++] = CS_ALU_INSTR_LOAD(SRCA, REG0);
> +			bb->cs[bb->len++] = CS_ALU_INSTR_LOADINV(SRCB, REG1);
> +			bb->cs[bb->len++] = CS_ALU_INSTR_AND;
> +			bb->cs[bb->len++] = CS_ALU_INSTR_STORE(REG0, ACCU);
> +			bb->cs[bb->len++] = CS_ALU_INSTR_LOAD(SRCA, REG0);
> +			bb->cs[bb->len++] = CS_ALU_INSTR_LOAD(SRCB, REG2);
> +			bb->cs[bb->len++] = CS_ALU_INSTR_OR;
> +			bb->cs[bb->len++] = CS_ALU_INSTR_STORE(REG0, ACCU);
> +
> +			bb->cs[bb->len++] = MI_LOAD_REGISTER_REG | MI_LRR_SRC_CS_MMIO;
> +			bb->cs[bb->len++] = CS_GPR_REG(0, 0).addr;
> +			bb->cs[bb->len++] = entry->reg.addr;
> +
> +			xe_gt_dbg(gt, "REG[%#x] = ~%#x|%#x\n",
> +				  entry->reg.addr, entry->clr_bits, entry->set_bits);
> +		}
> +
> +		/* reset used GPR */
> +		bb->cs[bb->len++] = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(3) | MI_LRI_LRM_CS_MMIO;
> +		bb->cs[bb->len++] = CS_GPR_REG(0, 0).addr;
> +		bb->cs[bb->len++] = 0;
> +		bb->cs[bb->len++] = CS_GPR_REG(0, 1).addr;
> +		bb->cs[bb->len++] = 0;
> +		bb->cs[bb->len++] = CS_GPR_REG(0, 2).addr;
> +		bb->cs[bb->len++] = 0;
> +	}
> +
>  	xe_lrc_emit_hwe_state_instructions(q, bb);
>  
>  	job = xe_bb_create_job(q, bb);
> -- 
> 2.47.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
