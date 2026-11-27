Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050A9606A31C
	for <intel-xe@archiver.kernel.org>; Fri, 27 Nov 2026 12:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cy0ceIjd;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=F+jeRauB
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA51E112A97;
	Fri, 27 Nov 2026 12:46:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01549112A97
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Nov 2026 12:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795783593; x=1827319593;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9OqxO0Dg7nPel/anEjErRNYUyMwgVUt+ikQphDgBKn8=;
 b=cy0ceIjdUJUvcSHW6n3ub4PDSaQ134papFZnUpiAEInKrPB6qvnBFElK
 uY5Jf2/92otCaLsOEYhEN8J0tvid/NfkHw43OD/AxQTDFvzCG+jQvqdMD
 o4eOdIrpZU80oa2W/z0T9QPfIhfiRerjHM1u80jc+7gY0g4+afSFVEBuH
 DKCKODYtW8cF598WS9cLzOh01EdH3vfLgkvUYeffMU2uQwOpmEDtp7Jxk
 ohSbWIXib2auZsQls1u21dtA611/HPddO8ikxpVPSMueC+svmMS03jUvL
 l5Yg/8QKGNdOmxYjxY9zVIAuMpyfPfN0yFbmEixYlO1jDiB4lGhXyimpB w==;
X-CSE-ConnectionGUID: tKI17OgpT12cIyXGppBy4Q==
X-CSE-MsgGUID: J/wPbOI8SUyXf77IT0oVcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4693362"
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="4693362"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 04:46:32 -0800
X-CSE-ConnectionGUID: XrbUUswbSJGKAO9lQ305+Q==
X-CSE-MsgGUID: rVI56w1zQ7qpZWH1yymHIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; d="scan'208";a="12391543"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 04:46:33 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Fri, 27 Nov 2026 04:46:32 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Fri, 27 Nov 2026 04:46:32 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.9) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Fri, 27 Nov 2026 04:46:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rwH7ncvWArCcsRT+ommimk2Am7NvLMWlq2LvxkJQdSo2uR9mrukCEhGbCSdFokVyw/5DZAdjyL+hUJ1b45YGhku2hkgZ34VnrLh3unGwZYZQ4awe0bnNSgEO20XMMiShNKmAhNSTonMcPfXUmZrzG0pd68LqZoGO8hSwheCv/HJpNOsb1Kv0HJrvuPbCaCd5yRBI3XewK/hHtPbCptDzbnIu95ZnVfYUvzsaS1guO8mVsuNUw0rt3Or4dq5rTGsd0sjiwzZgkZ1ZqDlajW0RcFY0rGiIZnb2wAjsrGREAJ3uz2cTt6WSvws6LLD/9bOeC8U5DjthxFie40Hosoaa5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1WWCWu/NQp6sTB7h7zEZGv04JCmFUmB9EJHouaNBVlg=;
 b=HDtf4eKwsi/Wztie7GBNxcnU3ijxy6cV9JxNowSkbDs7kGlhDg+JrteUQtFzq4NAJDaNUaPHpkSLOWYwnyahAa39APgEeGXLFJsURXF8dDe/GC/TZ86oSfH7/UdO1lIhdpB0+u4MGS5mNfvZxImZ/s+dPpX9iZIBJrZqkwesOx4ig5Ohtwi5ugyFoMgxbO7Mq5KPzQalxXFTTjvVswiDObUTVPpbcB1nUzEDt5OrmeU9nHJy8DqyhKWlhoyw2kfoJ9kZoXraGSw0OPJyaynooi35FWR8TZU6BPsdzlGiQCXEXkVKYPvsaCsczHooA0CpFmCHTr1LJJToT1pCtDQifA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1WWCWu/NQp6sTB7h7zEZGv04JCmFUmB9EJHouaNBVlg=;
 b=F+jeRauBT3JKzRvGTDSiuq5Oq10xUgjanfwblKJ5nVigHYY7yCrhJjYkZ5d2SX38xmYJsNkSqG96PLOwu8M3Bi5DNSJ71Ff0/PYPqWkioda9F5LtojBc6Sw53CP5GuUsu50B5JvHqlgZEevIOFcxpBkOCej+V0Mva33VjjdyWJY=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB6195.namprd11.prod.outlook.com (2603:10b6:208:3e9::8)
 by IA3PPFED21B01E3.namprd11.prod.outlook.com
 (2603:10b6:20f:fc04::cd) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Fri, 27 Nov
 2026 12:46:29 +0000
Received: from IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391]) by IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391%5]) with mapi id 15.21.0662.004; Fri, 27 Nov 2026
 12:46:29 +0000
Message-ID: <52bbc5ec-fe76-4995-a8b1-2f5e0fcc9207@intel.com>
Date: Fri, 27 Nov 2026 13:46:24 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] drm/xe/vf: Support PCIe FLR
To: =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <satyanarayana.k.v.p@intel.com>,
 <tomasz.lis@intel.com>, <raag.jadav@intel.com>
References: <20261125080621.599255-1-lukasz.laguna@intel.com>
 <20261125080621.599255-3-lukasz.laguna@intel.com>
 <20261127094820.3luzfcm2dfzzks3h@intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <20261127094820.3luzfcm2dfzzks3h@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR0502CA0032.eurprd05.prod.outlook.com
 (2603:10a6:803:1::45) To IA1PR11MB6195.namprd11.prod.outlook.com
 (2603:10b6:208:3e9::8)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB6195:EE_|IA3PPFED21B01E3:EE_
X-MS-Office365-Filtering-Correlation-Id: 91386393-1ce2-4fca-3099-08df4c8474d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|376014|10067099003|56012099006|261026121527099003|261026140227099003|261022105027099003|261021121427099003|261021123027099003|261028144727099003|261102123227099003|22082099003|18002099003|11063799006|4143699003|6133799003|261009223027099003;
X-Microsoft-Antispam-Message-Info: X6AgH/KokItm0hgm2DE4roeQBWN6MMfwuRlwTlGwf7PgqLEMNhJZbGoy30VOxwWG0JjJgDo3x0iBItEhwf+VNk9FomTHivAvchb+Ij6cPZnal/xLFoDlxJCcc93xScLvU0vVVc1jOFhgLbpwFDCAZ358UOXvS7BGOjYZfpMllloMDlOg/2KvZeGJPPXG0h1YeNnhPn/AF+STBCIQnrkOIjqcoaCsbeLSpVRRwhcGeLm8qzvKiVLIUwAWNCAtGjl6edSUfcO2Dby5LZCBlXaS8Auaw60x6UfWHGWzv21kKsF87IPu9LfaOiQ8sgaiWVG5tLIzs0JinVo1c9SIgneJh8n7EYAtDIZErg1nTf/myvGqDH6qYnsMhrtE5c/8KhhwQnOs+Gd+7bUK/wzBZ0Hlbw/i+RvPxX/E+En6Sqk+kwyfPYCAGbCq/JRGV+KsLsteui6HtG2ZoxnmucUEQQsaX1Ps6Pn1W2FSxnBuO/qH5nL2OdqFdxeZAj/uKgxSUFSPpPZgL4/OslK5sl8j/phu7i4w225mzbjWJQ9ylxI0mh0AymM8S8g+64TaRUTNa7xt5Jfhm/qAOWjs/mJJufGg/MY+XKOqFaUH4Ha8LaSssGWoPNeV3zdReEAFiimyYD37H7+Aq6+rky1BwVTiqMz8jJ1c9bksuOUSN6dcYtiwDIQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6195.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(10067099003)(56012099006)(261026121527099003)(261026140227099003)(261022105027099003)(261021121427099003)(261021123027099003)(261028144727099003)(261102123227099003)(22082099003)(18002099003)(11063799006)(4143699003)(6133799003)(261009223027099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YnNLUUR0NmJiYjg3ZFBjdTQ5THNLbC9FL1E3ODd6V2pJa1hMaEFTZUs0NXhm?=
 =?utf-8?B?VTVHYTkrRzZvVDhnaThBaE8vWXhqZEJjTUpKd2tKY3dWcVNWd2o2WVRFTmw2?=
 =?utf-8?B?RURnaWlqbS9JS2c4elNSTmpXYjZ5STRlY0JVbEN6VmI3TGpadlhPcHQ5d0Mr?=
 =?utf-8?B?a3Q2RkZnRk94RXVLamJ2R0xrVWIyZHJuN29tdnVNV3JIRmNpdW1FRWxWWWtt?=
 =?utf-8?B?QnN2N3l2OXl4WXNSNGhNOVFrVU00MC9EQXhWWHBDZk5CbjkzNTJXbFRhZmRK?=
 =?utf-8?B?WGRueURpNGRsTGxKamVJeHRKdk8xTkROY1hTdVNGeG5UMjM4bW5ycHhVSHdi?=
 =?utf-8?B?RTg4WThCUkdhYXF1aHRFcFRDUXNka3BaazV1UFdoS0Vnem9iRmdaSkovUnJF?=
 =?utf-8?B?SkZVcUJuOS9Wc2NZK3dxTmZ0QzZIcCt2cmlydGVhaGtTbU1rclU2QUVpb3pu?=
 =?utf-8?B?TjFqYkZoYkNkQVBqalJKU0tRSEx6aXM5TjdwelNZSDZwQ2orWmFGZTVJRGVh?=
 =?utf-8?B?Vkh5MmJrbkZKUXkxdzNBUVorWllKQWI3Y3MvTzk3Z3c2aTJobjFqL2w3Y2V1?=
 =?utf-8?B?blRONlpLNlNlYnVycGtOSUVtcnNmZG1hZkg1ZHRJd2RlYXFROWc5VXFMQzFH?=
 =?utf-8?B?L2l4clhGQWNtTGg1MERXbkNiUGlKSmIxZGsrajBmOERVYkZQRHBXa0dxUDhD?=
 =?utf-8?B?aWRGSXhxZHZQMUdldzFGSmFCN3B5aExvbWkwRUZUQUxEaStITmtIb0Nmdm1M?=
 =?utf-8?B?Y3djV1pMajBzTk1CeUVncjZ5cjdBcXZHSzZTVlVwTUd4WEd0YWxqZXlxL1c3?=
 =?utf-8?B?SmwyRUNRdDlxLzJlNElJK1RycTVnYXVFR0FMTFpNOThkNmlEa2dZVDB2M0Ja?=
 =?utf-8?B?dnlXUm1ZTEZBV0FQOUFaMDhyUHNpTVhNTCtDR1JxN2Y2SGtMWmpmZXNhMjNp?=
 =?utf-8?B?M0FMNGZJNGdGOEQ1ZkVPQWtxUlkrSTRTVUkzcVdHUEN6Yk5GMFNwVm5HSXNr?=
 =?utf-8?B?RmhRcnFiQzBneWVtN3FEREZjSkNrK3RETkdBTy9Qd1dTcHBaVERYKytZVm5X?=
 =?utf-8?B?QnVSSTNWWEdZcE15WmwwbGN6by9PcVMvY2t5c0QrVkpwNk5BNHhoN0tZSWZ6?=
 =?utf-8?B?dHhkS1hKWmJrSURSZi9wTlJJSklqTU1CTU41cVlnaTVSTitLVmMzYVZ6RTdW?=
 =?utf-8?B?em9JU0JIRFMvOWR1MmZkbnJlNEgyNldoYTNYMHZVRDB0bzZzaXFLb2pldTVz?=
 =?utf-8?B?NldzdkRIbEhiM0I2bFY3NlpEeTBzb2hkMjU0RmdZUkZRdUVRcnFQcnJraGsv?=
 =?utf-8?B?ZUlPL3RnU202ZW9JVERmVFlZQi9wNmNWQU9rQTFwSjBkVC9mejdXY1d0U3RC?=
 =?utf-8?B?UFYyODRxSzdXVlF4UHl6Zk5Kclh4MVhmOUphamZtMzJUYkplZDJvQTFnS3RX?=
 =?utf-8?B?NkNSSHIzNzhGT0ZDNytMbTNURnI2M3VieWIyamtVT25nLzFXUzFDb1VyWnBW?=
 =?utf-8?B?dThVdThJaGl2dk5iNk13dGZycVVUT0QvelFmS1MvMmtiN1NjT3gyM0l3Sitm?=
 =?utf-8?B?MkRpOVN3eWI1elR4UFd0azVRMFIvUzN6TFZ0djlCUTgrejQ5R3ptNzRpT0pC?=
 =?utf-8?B?bkpWZ0k1VGZJWHlRK0xtMmQrTmY5K0pSZ3k0SHVxSzhsWFlIZUpLSlR6aVRZ?=
 =?utf-8?B?cWIyd2xtQ2FkMlBoSloyQjJsMGNGblFUWitLM2tqSWVGR25NU2srNHRsYkRY?=
 =?utf-8?B?Uk9BbWJpdDcvWk5LdUZScXdqSUExcVJOMytoRStmWHJwN0xkUWFvMEtyUmZS?=
 =?utf-8?B?aDg3YTRuVE12QXk1SEEwQXJSQ1N4U0JSQ1cxV3dDQU5iazMzV3B1MDY1S1ZW?=
 =?utf-8?B?azhyMHZORmo3N2gvcWthMzA3WWdBakM4OEc5YkNQblBQQkl6dUxPc2gyT29S?=
 =?utf-8?B?YzFDQ1c5NXRLYnAwT0orL1gzRjBEcGU3TXNocW9DbXdLYWd1V2l4NnMyOGpn?=
 =?utf-8?B?d1pBY0pBemZyZk0xT2V3UFBGd0hXTzM4RGZqUlRwZWpldm1yMnBBSEFTMFZK?=
 =?utf-8?B?b2tHekw3RXVtZDZFck9vRm9EL2E3Q3JtSlRkTnlpZGdoQkE4YU5ScGwySm11?=
 =?utf-8?B?WUZEZWtkTXV0K3NGS0h1bVdrWllLbThiekdiUDhLY2hMa1h6TXg1cnBYdHJj?=
 =?utf-8?B?Yjl4cVU5YW5PZTdOdWhlbEp1dVA1ZDdPNjRrcis5Zk1OYmdjUUNvbTZKdjJB?=
 =?utf-8?B?b1VjL01YWjJNQ05SUFFNRk8yOUtJOEJiRzNWd1ZqUkdDU3lrU1VnQUI4YmFE?=
 =?utf-8?B?MktIMXN4ZG9lT2M2RklVckxNcFlwUlNrSVczeDFNWEJSRVZNa0tpUT09?=
X-Exchange-RoutingPolicyChecked: DqZklDsV2f7NAQ9sKiu7G2ODP/hQ1xEAtc2bsgDA8lmI3ryDNmJfkheqVwmkHHDhiftE253XerO87hNtb9Dza+seKpMsGcQbKYv+XKY5BbbfIAug2G/xK7VTI6UWq+MnS90aQkHNUa0kDitpqgHyXmMlCXzQHdTkepZl11xeY0xzfPG4RkAx2cWx80Ufr2ylYukbOB0gJA8bCWshLYxVfbTzeE5yyrRYYJz8cfkm01ZhohGC6lL12OVBGm6zY7Cijfq4hjVnm8EhGvVCZAET8YKwxDDRYkPpZXOr7kVI7SEoQQrIYCxhlEpbCWshDCIpTNfUcs4V7D4F5iFFjabjng==
X-MS-Exchange-CrossTenant-Network-Message-Id: 91386393-1ce2-4fca-3099-08df4c8474d1
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6195.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 12:46:29.2593 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yCgPgGXOLyPsN2L1sZccDBnul1AlWBb6jgWekLW0PaXVqB9kx2xh9gY7Q6T/QeAemN/fjEH+GBALsWrg99wvGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PPFED21B01E3
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


On 11/27/2026 10:48, Piotr Piórkowski wrote:
> Lukasz Laguna <lukasz.laguna@intel.com> wrote on śro [2026-lis-25 09:06:20 +0100]:
>> Allow PCIe FLR handling on VFs.
>>
> nit: maybe "on discrete VFs"? xe_pci_reset_skip() still skips
> !IS_DGFX(), so integrated VFs remain unsupported.

ok

>> VF FLR isn't complete when the PCIe FLR finishes. The PF still has to
>> sanitize the VF resources: it resets the VF GGTT entries and clears the
>> VF LMEM. Once done, it notifies GuC with FLR_FINISH. Until then, GuC
>> asks the VF to retry its requests.
>>
>> Re-initialization after FLR assumes that the FLR has already completed
>> and that hardware state and VRAM contents are gone. It restores GGTT
>> mappings of kernel BOs and rebuilds the migrate page tables, so if it
>> started before the PF finished its cleanup, that cleanup could wipe
>> the restored state.
>>
>> Add an SR-IOV post-FLR step to the reset handler, called before device
>> re-initialization. On a VF, it resets the GuC VF state over MMIO until
>> GuC accepts the request, which means the PF has completed the VF FLR
>> cleanup.
>>
>> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
>> ---
>> v2: Log an error when SR-IOV post-FLR actions fail
>>      Improve xe_sriov_post_flr() kernel-doc
>> v3: Explain VF FLR flow ordering in commit message (Raag)
>> ---
>>   drivers/gpu/drm/xe/xe_pci_error.c |  9 ++++++++-
>>   drivers/gpu/drm/xe/xe_sriov.c     | 31 +++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_sriov.h     |  1 +
>>   3 files changed, 40 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
>> index fc6ff71d84a0..9b54ae2d392f 100644
>> --- a/drivers/gpu/drm/xe/xe_pci_error.c
>> +++ b/drivers/gpu/drm/xe/xe_pci_error.c
>> @@ -16,6 +16,7 @@
>>   #include "xe_pm.h"
>>   #include "xe_printk.h"
>>   #include "xe_ras.h"
>> +#include "xe_sriov.h"
>>   #include "xe_sriov_pf_helpers.h"
>>   #include "xe_survivability_mode.h"
>>   #include "xe_wa.h"
>> @@ -234,7 +235,7 @@ static void xe_pci_error_resume(struct pci_dev *pdev)
>>   
>>   static inline bool xe_pci_reset_skip(struct xe_device *xe)
>>   {
>> -	return !IS_DGFX(xe) || IS_SRIOV_VF(xe) || xe_sriov_pf_num_vfs(xe) || xe->info.probe_display;
>> +	return !IS_DGFX(xe) || xe_sriov_pf_num_vfs(xe) || xe->info.probe_display;
>>   }
>>   
>>   static void xe_pci_reset_prepare(struct pci_dev *pdev)
>> @@ -293,6 +294,12 @@ static void xe_pci_reset_done(struct pci_dev *pdev)
>>   	/* Unprepare early in case we fail */
>>   	xe->flr_prepared = false;
>>   
>> +	err = xe_sriov_post_flr(xe);
>> +	if (err) {
>> +		xe_err(xe, "PCI reset: SR-IOV post-FLR actions failed\n");
>> +		goto out;
>> +	}
>> +
>>   	/*
>>   	 * We already have the data structures intact, so try to re-initialize the device.
>>   	 * This will be similar to system resume flow, except we'll also need to recreate
>> diff --git a/drivers/gpu/drm/xe/xe_sriov.c b/drivers/gpu/drm/xe/xe_sriov.c
>> index ec254b950daf..506f5a7bb335 100644
>> --- a/drivers/gpu/drm/xe/xe_sriov.c
>> +++ b/drivers/gpu/drm/xe/xe_sriov.c
>> @@ -11,6 +11,7 @@
>>   
>>   #include "xe_assert.h"
>>   #include "xe_device.h"
>> +#include "xe_gt_sriov_vf.h"
>>   #include "xe_mmio.h"
>>   #include "xe_sriov.h"
>>   #include "xe_sriov_pf.h"
>> @@ -174,3 +175,33 @@ int xe_sriov_init_late(struct xe_device *xe)
>>   
>>   	return 0;
>>   }
>> +
>> +/**
>> + * xe_sriov_post_flr() - Perform SR-IOV specific post-FLR actions.
>> + * @xe: the &xe_device
>> + *
>> + * This function should be called after PCIe FLR, before the device is
>> + * re-initialized.
>> + *
>> + * Return: 0 on success or a negative error code on failure.
>> + */
>> +int xe_sriov_post_flr(struct xe_device *xe)
>> +{
>> +	struct xe_gt *gt;
>> +	int err;
>> +	u8 id;
>> +
>> +	if (IS_SRIOV_VF(xe)) {
> nit: an early return would save one level of indentation:
>
> 	if (!IS_SRIOV_VF(xe))
> 		return 0;

We'll need if (IS_SRIOV_VF(xe)) and IS_SRIOV_PF(xe)) when adding support 
for FLR of PF with VFs enabled, so I prefer to keep current form.

>> +		/*
>> +		 * Wait for GuC to become responsive. This indicates that PF completed
>> +		 * VF FLR cleanups and it's safe to start VF re-initialization.
>> +		 */
>> +		for_each_gt(gt, xe, id) {
>> +			err = xe_gt_sriov_vf_reset(gt);
>> +			if (err)
>> +				return err;
>> +		}
>> +	}
>> +
>> +	return 0;
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_sriov.h b/drivers/gpu/drm/xe/xe_sriov.h
>> index 72e55543c30e..444d1ad74926 100644
>> --- a/drivers/gpu/drm/xe/xe_sriov.h
>> +++ b/drivers/gpu/drm/xe/xe_sriov.h
>> @@ -19,6 +19,7 @@ void xe_sriov_probe_early(struct xe_device *xe);
>>   void xe_sriov_print_info(struct xe_device *xe, struct drm_printer *p);
>>   int xe_sriov_init(struct xe_device *xe);
>>   int xe_sriov_init_late(struct xe_device *xe);
>> +int xe_sriov_post_flr(struct xe_device *xe);
>>   
>>   static inline enum xe_sriov_mode xe_device_sriov_mode(const struct xe_device *xe)
>>   {
> All of the above are minor, so with or without them:
>
> Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

Thanks

>> -- 
>> 2.43.0
>>
