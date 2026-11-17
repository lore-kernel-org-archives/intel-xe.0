Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F03606A31C
	for <intel-xe@archiver.kernel.org>; Tue, 17 Nov 2026 18:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eiKNrdRN;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=N56XsThE
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D27410E0A6;
	Tue, 17 Nov 2026 18:55:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6646D10E0A6
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Nov 2026 18:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794941701; x=1826477701;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=DydXk5WNTuDyCPsrLf0W02yRRI097wYLIO/wCo0tlt8=;
 b=eiKNrdRNMRIN0D8bZnfTcBX8kt+gcVdE45eR5QkIK3V2Wezs4olUzvxU
 9V/A2Ar/W9kTl8eaL9EztNal3OSqFsh6A14ti/M+CfB2iWGGjI8m2LjKI
 ceG3wwomqqh7v/top+otFtnbrvIGEcf2mB2pRWsLKcUyQOAwrsCjoiNR6
 2ftfcAEXd685ew9/n5nnnP7IBBPOJrdnyv11yxzaDgvA3MFDbfF7s7IO3
 X8epjQ2kYRhYWSj41WVtkABJxec90HFs10odQg25woqZpyDHmobj3c/Jz
 i1myWPi1puKKcrqJpJj1Q4KPwiZl86osQbTQkNSlZvhIK8r9TEP+DWZPS g==;
X-CSE-ConnectionGUID: 6Q0Seq19Sd2vUlKlnai2Ew==
X-CSE-MsgGUID: Cfc2ZljBRPGdsA4YOdOUfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3833145"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3833145"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2026 10:55:01 -0800
X-CSE-ConnectionGUID: XoeYPvHWRjivkDMset6n5Q==
X-CSE-MsgGUID: VpwGjO46SL+xpo3woGSM0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="9691064"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2026 10:54:59 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 17 Nov 2026 10:54:58 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Tue, 17 Nov 2026 10:54:58 -0800
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.32) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 17 Nov 2026 10:54:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FTPv5feebBMRPMy7XWHJ0IACSOtpZ46tag8sC30/ThGbUZyzevfdn7wt29k4xrMGlxNcgxc/kk0wwZWrzePZQZ47IONqRzoxidjtTdYXL7SYzoAHf5ozBuVJlDzS7kUCKIfnLup/x7jVyH96PyhGcEV/qBs6UOPjm4t9AkTxKYkVq7dDaHIVxhoVqssgCnTJPD2DqsxT1CgW2HcsqEgPOCTyXjIE7AFhIterzSuZUyw2hC/urMExPuoGgH7870OedNxxq5ufNQJBlxQIbUuIoHaT9RCffZhpS2dDKNx5zooc2IUBnrPjbqHlkM9OyW9OdEdusTToFnB1KH5geU6m8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JynQpb3B+rsVsw5OEZyX/jv6h+qqA5AmG6zQ8LikvjA=;
 b=qqboO/7HNzP0o3nKm9t8XoeXGYCretvg9pENNClrssNnATHkF9QYvZ9LKoSv8TJvtsDwlOXd0ncgZb+LOOtG2MANr2/cwL0HJ8sTQ+fUjUSjeS04RWyYkKPMlFDytZ8QcBM3/zlKeuNRqO4oZ6YBeSGUOVjxLSEkpETwImo0KfEB1Hg7hVHPXiovqiIbK6T0rD8B+RysuVwVGjb+zYbtj4DoRHNZHZS6m/omrZ36QZ3rAZCdUCroIul3N9aGg+9TJerxU43p9DSEX7QMfQvNM+UjD+XYPRjrUrK7fbjChtGG3f8TsbRZUZGJgsjXORroZJpmDJxQkUhura/UoE6XDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JynQpb3B+rsVsw5OEZyX/jv6h+qqA5AmG6zQ8LikvjA=;
 b=N56XsThEeKbYW0vyR6AsSctrVOIIgeZSb5o0PFVlz+ki+NPbAzoQLuE2gKMXtbwRoo+MN40idv24SA+bhiRynTpaQQYjXwe8czLZ7rCEyMWW3oRbG7e8ppAEK+yAZFRPZ2hJ46vHvZD0cvQVsO39s1c0aRCs/VXe58eeuG9DE0E=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7821.namprd11.prod.outlook.com (2603:10b6:208:3f0::22)
 by SJ0PR11MB6717.namprd11.prod.outlook.com (2603:10b6:a03:44f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 18:54:54 +0000
Received: from IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203]) by IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203%5]) with mapi id 15.21.0615.013; Tue, 17 Nov 2026
 18:54:54 +0000
Message-ID: <1043e6d6-d7c4-4a05-af29-4e99a03b97dc@intel.com>
Date: Tue, 17 Nov 2026 10:54:52 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe/gsc: Define GSC firmware for NVL-P
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Alan Previn <alan.previn.teres.alexis@intel.com>
References: <20261117002529.1925156-3-daniele.ceraolospurio@intel.com>
Content-Language: en-US
From: Julia Filipchuk <julia.filipchuk@intel.com>
Organization: Intel
In-Reply-To: <20261117002529.1925156-3-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0204.namprd04.prod.outlook.com
 (2603:10b6:303:86::29) To IA1PR11MB7821.namprd11.prod.outlook.com
 (2603:10b6:208:3f0::22)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7821:EE_|SJ0PR11MB6717:EE_
X-MS-Office365-Filtering-Correlation-Id: e001b684-948a-42e2-3995-08df44dc4478
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|261026140227099003|261028144727099003|261022075727099003|261021121427099003|261022105027099003|261022115727099003|261102123227099003|56012099006|11063799006|10067099003|22082099003|18002099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: 84vlvCiyvsKk6zqhltWZGPUVkrZcuYODBa+bxtxR5ZNeS6PgOYjB0TOJevA6g3YJNhjPkRVLyG/30xgfcMIr0eIiQrCu+MiMrbWeY65DDvAaGPEEpuwi3lNPFCK4gDYWN60S5vOLTAkJMOCbog1TiAA2v09w1LD33auhM2ZR+rYkgtendmBTrGExrQ9B+ZyOtEUthH6WgdsbGPzUdhdKxAEw/Slz+0izIh7eNXX4MpkT9JB0fpRBPjOWu/00sfqHQi6byhOeWNp46qqn0unUrMSL8jIb6g3WCBlK0TtaopY++261ZQkTsOS70F9HNGpRRUnfmK0Ys7gJVXRamFg6sYqa7e8/9/fZ0MU0jmJhGnYPkW0bVj6MKdZFK1TuPFkz5IDqE8oP4fNUT3Z0Z2VtfCUaY9I3PVXepxMKRsP3y9sy9V9Nv2R22y1jEC4wN0pGKHndN12kXCAVnzxVJV3evfq8DqKp/7Eh+UfERB3YszQIWFiNjF7I7OA35uTMha7P9/dBGMxfQt05jzjAeQvicO8wz583DbJRL4xRwo1AS4Xhx1/3UJenWDWv8wGQVE3idhRUt8iCPg3bxmVJV9T5wB7fVuadK3k2XptE9HNCnqfJRPcQHeMo80k+/U2kwnv57vsHN73eYFxilVsYN0kqTunCFg1h3ty6/j331KfeIrY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7821.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(261026140227099003)(261028144727099003)(261022075727099003)(261021121427099003)(261022105027099003)(261022115727099003)(261102123227099003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003)(261009223027099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dXQxaGdJY1hwSVpINmQrNGRNRGZKK1hNQmt2NUdLbEFYWmNabGJFVzBzTThn?=
 =?utf-8?B?dUlwWGNyU1QzU0hEUmRPeGp5ZFR5YnVacU9wNTJRQzZ4a1ZzQzRQN1YxaGNi?=
 =?utf-8?B?dnhlVVRkOHdrOXZhWVpwYWx4VW9WK1IyOUdLSDcrTVpNK2FGS2NGT0RFNm1I?=
 =?utf-8?B?UVkwalZ5Y1lHeU5ncllTRU1PWkVyRlA3UDlSSXBnQzdhb2FRdnBFcGNseUxN?=
 =?utf-8?B?a2pVZ0tSaGNtSjQvWkVBTkNhVmhPcGFKUWRoaGlkUEI5MUN2TlVsRjRNSStS?=
 =?utf-8?B?T1c0bmNiUzYrUERSb0FRZENkckZWNHhyN3ErNnVlM0RQUHhUdkxYS0NmTmJ6?=
 =?utf-8?B?S2Q1Q0NySTJ0ejZsM3lCemxjUkdoSXFZSzlMZGRiZ0UzcWlxWjNjTk9Ia2xm?=
 =?utf-8?B?RE80QUhieTA3YUdudGNjSjVQRkVycCtUSkJGVEkwQkwraElGWDB2TWxDRkhx?=
 =?utf-8?B?OEhRZ0tFTkVDUzh4VXhHbnI3VEgyaUhFOXlNVGdkZ1BzOVMwMVZCYWRLY3U1?=
 =?utf-8?B?L0Z5L3JqVitSdG9WbkFUaGNmWUpJczJsbklTNjY5bk5HbDZoYjRrY1ZNRjBJ?=
 =?utf-8?B?SjFaSkFJMDNVWDBZYTZYcTh0ZVg3UFBrRmtxV0tNSHUrbW5GK2Q0UEk0dUxs?=
 =?utf-8?B?T2pUMkhMZ1RudjhNdXEwNnFNQVplajZON0FIaDUyTEM5d1E3TFhkdmw4bER5?=
 =?utf-8?B?TUJYdXhSdE5IbUhHcTUxMDgwK2VxekVZYUJueGliOEM1dzhFWHNUbkI2L1Iw?=
 =?utf-8?B?TEZ3TEJNdnhsT0F3ZjA5RGZjbzVKR2JTYldlSEtmYzltdWNRWmtMNzB4SVlQ?=
 =?utf-8?B?MEpadWV3MG95b3hMMVg1VGZhaVFJZGhVR2JsM1BaeUVUQmRxYVVhR2RyYmU1?=
 =?utf-8?B?bmx3bGtPOUNFbEsyUitidHg0Sm5mM25ORTFkL3cvZzhPbzk5b2xERkVpaUMv?=
 =?utf-8?B?NDI4ZG9GWWpPcU5rNi84SWVxK25uNmwxTzZ3dzNRbGFmUFZuS3pVNm9FY2dT?=
 =?utf-8?B?YVI2MldCOEVLdXNRejlaMGFFbFRDUWZtNlZqVktMcld2MEhFU1FFVERyZjNU?=
 =?utf-8?B?V3hHdHdkQzl0NHZHVU54aU8rQWxXTHhsV091YWJML1FoRVlXeXo2OHFsY0xy?=
 =?utf-8?B?WmhYMzNCRE5hcHhGdit4WC9aK1BjOFRsMUVac1BPU0ZqelFvZ1JkaDlrK01V?=
 =?utf-8?B?UmdQSUlkd3lQakJVTHNvMTRheldFZU1PU1NlUlNyWklVcTRWT0dma3BZb2g2?=
 =?utf-8?B?ZlY4bXdBSFZjdHVyMDE1UWN6T09zdFhqRG9nOW5aMTdHQ2ZCMjVpb2JCV0ta?=
 =?utf-8?B?OGQ1WFVGazByak9DQVdwMnNFUFBYeG9obnpxMGgyMjZMQk1JVHQ5OFQrSWtS?=
 =?utf-8?B?R1pLTFhQM0pYdGxINzVHRDJrMlpRRFpBWU16Y29melRoNVJOekJVZmlWZFQr?=
 =?utf-8?B?Sk9hMmQwMWRxc1NFMlI5Z2wzS2Y2OSszZHFrWHowUTNJaThGblJuSE84THlx?=
 =?utf-8?B?c0Z5QlNoNTRHd3Fuc3VTNmVOZzk5SnUrN2xCbXYyTllJMCtnUjV2bnNiY1dt?=
 =?utf-8?B?Q2cyZGtVZzdDQVkwV0VVSmdJeFBZQ3RzWkFyS1UvTjIwQk92S2xQTXc1TDBa?=
 =?utf-8?B?MlpqR2h4MnF5bEVwd2RSbmVKL1g4TUl4b1cxZHRKMldlUWVPQ3VtT3lBRHAz?=
 =?utf-8?B?bW9TVEVpdjJGUVJ4RGtiZzNra1NuTUgyQnh6aDEyZ29wMEE1V1A5Z0xDSXYr?=
 =?utf-8?B?VWNOWVJ2cXNZWkxuNVpURzZ1R2t3Y2dGcVdHTjRCSWsvQ1pZZDBCUU9ZaHl6?=
 =?utf-8?B?azE2ekM5QmFIR0dlKy82QmpPdnRyY1NNRG8zVWJFYzhrL2JQa2dwdXhVR2pQ?=
 =?utf-8?B?WTNPS3lKUWI0bGhYNDRiTHZpdURCalowTXVYL280d0xLVTVYVE80MjdzUEJO?=
 =?utf-8?B?NzVZaWFySGx2dHZJekIrT3VFZ3hXYndHbjljVkxoa2JOOHZNZUF6M2JPVEJ3?=
 =?utf-8?B?QTRUcDA4b1U3ZXgvbEJ2ZEJSd01kU1puWXJCd2daVTB3Zmo4TFEvdnZkOE54?=
 =?utf-8?B?WFI5c2U1YWd0OE9MdDUxODkwb1ExNUV2TEt5MDRvaHJlc1ZaTjV2Nm9TZnZp?=
 =?utf-8?B?Q0sxeDAvVGdCelpxOXhuVjl6RlJkZnBGVFN1WVVwTXA5dDVydWtYNEUzKzNI?=
 =?utf-8?B?dTFRYmxMbVZjOGZkekVuaU5HZEFjVUJHdGhVbmlBZCtJeHdQOWQ1bHBlNTNl?=
 =?utf-8?B?L2U4eEdURTB6cDBhaHlYeUVEeU1Gb0tkY3lGR1VRWmFxZTlIQ3VVdGVBSWZr?=
 =?utf-8?B?Szh0eS9KVUtaelJDZHVaeEd4TTdPT2JPTXY2K3pmdDd1bmx5VlA5ZDJQcG1y?=
 =?utf-8?Q?4igQ6/KNSG2U9Ll4=3D?=
X-Exchange-RoutingPolicyChecked: vxjjF822xWQib/PgHS5ccfgSFmMT1vCWmj9rHDL698KB0OVe7ucB0SJ2HynlbhlHO3ngGMzz9wMwh1z1x1xrHr4Xk9whkH3PdCRwVgYVgRauE9N8I+fbEaXU6L0o12W6Skjd06JsocFzYEocbR+bSn6bGfBl79/LTTj9DDllbVY6N4my2wYoD3+9KfiDBkdKimV7iqbSKv7liioKaRLCNJcr4o6LDz0zYyqrYe22Qm2XGc/fzaoGyg8ptDagpIUeJbIEU6IC/6x8ycQ784LH0J6IN41sN4CaZ6zyUAcQNy5VLmbeNqo96pYwnNs25/ptpWcAS8/7D5RhrRWuI21ZLQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: e001b684-948a-42e2-3995-08df44dc4478
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7821.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 18:54:54.4849 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qdQuKAXpICGEs2L+aU+N0f2jT1XBgwcQB3e+IsjbTvCiS8eITAE+Kpav+/72k4EsaYkpjkJmOF2sakC2dNrkFDypolhNyf0iTWHTcpQukdk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6717
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

LGTM.

Reviewed-by: Julia Filipchuk <julia.filipchuk@intel.com>

On 11/16/2026 4:25 PM, Daniele Ceraolo Spurio wrote:
> NVL-P uses the same GSC image as NVL-S, but requires a newer version (at
> least build 1242).
> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> Cc: Julia Filipchuk <julia.filipchuk@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_uc_fw.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> index c042075a36e5..af6ee1f6742a 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> @@ -147,6 +147,7 @@ struct fw_blobs_by_type {
>  
>  /* for the GSC FW we match the compatibility version and not the release one */
>  #define XE_GSC_FIRMWARE_DEFS(fw_def, major_ver)		\
> +	fw_def(NOVALAKE_P,	GT_TYPE_ANY,	major_ver(xe,	gsc,	nvl,	108, 1, 0))	\
>  	fw_def(NOVALAKE_S,	GT_TYPE_ANY,	major_ver(xe,	gsc,	nvl,	108, 1, 0))	\
>  	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	major_ver(xe,	gsc,	ptl,	105, 1, 0))	\
>  	fw_def(LUNARLAKE,	GT_TYPE_ANY,	major_ver(xe,	gsc,	lnl,	104, 1, 0))	\
> @@ -778,6 +779,21 @@ static int uc_fw_request(struct xe_uc_fw *uc_fw, const struct firmware **firmwar
>  			goto fail;
>  	}
>  
> +	/*
> +	 * NVL-S and NVL-P use the same GSC binary, but NVL-P requires a
> +	 * newer version (at least build 1242)
> +	 */
> +	if (uc_fw->type == XE_UC_FW_TYPE_GSC && xe->info.platform == XE_NOVALAKE_P) {
> +		if (uc_fw->versions.found[XE_UC_FW_VER_RELEASE].build < 1242) {
> +			xe_gt_info(gt, "%s firmware too old (got build %u, wanted at least 1242)\n",
> +				   xe_uc_fw_type_repr(uc_fw->type),
> +				   uc_fw->versions.found[XE_UC_FW_VER_RELEASE].build);
> +			err = -ENOTSUPP;
> +
> +			goto fail;
> +		}
> +	}
> +
>  	*firmware_p = fw;
>  
>  	return 0;

