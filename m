Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 034CA606A31D
	for <intel-xe@archiver.kernel.org>; Thu, 29 Oct 2026 08:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bNK0ROCC
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA7EC11207E;
	Thu, 29 Oct 2026 08:10:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB43511207E
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Oct 2026 08:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793261412; x=1824797412;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=h4ybpPFw3NhoiqcWB28OBvZOfnbg27il4iY3NQhTs6A=;
 b=bNK0ROCCG1kzvAcq5XFY7x1wTR2pTEVdx0cF44ag7xxc/23AotWw3d/Q
 BHIM08NACKKSubkFFBQLRv/xq0h331PNA8zqI/bBvcSIuxHH4IyCioqOP
 PJcNIoGk3YQ9xoNb+oKgJi5TdmXN3/ggxi+jkC6PO2hYUKDnc5qgTgRlC
 QUqrgy76OsNutbjfIG4D2ARhbUZRzE5/v5xkMmJ9ITQa5bedhmwb5nNRg
 oJF3vm4FyFRh/s7XB+8/bOmWWsPy6+pEdtKd5Lq1OvLEqGFbLliEKg3Hh
 sbhFyaTdEPSwAexu9zKZI1oWlDsqs1hsvZS7dUC0/e4ehpW6E9/vlqXUW Q==;
X-CSE-ConnectionGUID: tWxtSO4LS6u9FvrMlNIS2g==
X-CSE-MsgGUID: HSUMzphnQ1WSSsNqHZ4NGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1879317"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="1879317"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 01:10:12 -0700
X-CSE-ConnectionGUID: 9Y8hxc8cR5asPjKB4IIxgw==
X-CSE-MsgGUID: sWMtgMkVSGmpaQrGuJio5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5406236"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 01:10:11 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 29 Oct 2026 01:10:10 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 29 Oct 2026 01:10:10 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.51) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 29 Oct 2026 01:10:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vO//zspxWWsH+8GiHu2JYX+xUb3VEis75HjnMHNUhYi5MWHjc2ESv2eUwEBG7rtQQ6/X+ESJq7PW9dMnVfBoqKy7A22LKkdje6LSHOEo9d/lMji1680rjaGc1IM86jGd+wNNujPO0Kq/8QqeTW9U8fQOHBhAd1Ij1P/7a/vgrjIg7UQRnHEhQV4yOb/GEr4ZiCCVPspXzxpzSw7X6e5s/sHWGQ8sQtWjJmTf6+t5o6O2izRQnSld3gg/+SWv/XBGpbkeKHNHDz/zkAD3XdOmtjA8F7PpLWs4kveIHegUsb1cBnyQeLFEDCp7W2jNqyJlECqfgaymyXx8ntDNUUH3Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jwP9/QUKQ+PFz6lqv/pGbbmveIDMxIYaFS8noobOFUA=;
 b=sn45ltLWp2brEDqLYM2KRnt655fC2UVo8jF08yUine2+GGFuwFDHQ97L3N+DKxFgadpBy1QWdv5agt4nqSTPXpximA0hehq9890YY2oh1E4PAbe0LY+O1GNZI+8/xxpyFPTKrLXuoLu6aMXtj91nUi3kyHiXYBeoY7IMr+qvyle4umF/8wPp01j0eITe5GDDBJNTxn4pISZ3M84bH3grNMNWo1WO5YfwUOoqxwoT/pxBWywHGyW7MahlErcMJmgV556Aui5j95Xgr25LPzQTpvShnybwjRvq/wAQeRRiT3OsMtH6KqGnnDNMULJlMSah+uueoAZO25bmwaBIf7NxJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 08:10:08 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::44a4:1ecf:f303:d08f]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::44a4:1ecf:f303:d08f%5]) with mapi id 15.21.0546.021; Thu, 29 Oct 2026
 08:10:07 +0000
Date: Thu, 29 Oct 2026 13:39:59 +0530
From: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
To: Andi Shyti <andi.shyti@kernel.org>
CC: <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>, "Bartosz
 Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>, Danilo Krummrich
 <dakr@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: [PATCH] drm/xe/i2c: Fix use-after-free on driver unload
Message-ID: <auL_Vz1IcO4RJgzw@bvivekan-mobl1>
References: <20261009164241.923756-2-balasubramani.vivekanandan@intel.com>
 <auC-ryi8PFiPgiLE@zenone.zhora.eu>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <auC-ryi8PFiPgiLE@zenone.zhora.eu>
X-ClientProxiedBy: MA0PR01CA0017.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::12) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|LV3PR11MB8695:EE_
X-MS-Office365-Filtering-Correlation-Id: f709b8ab-af6b-4633-d1e1-08df35940b6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|22082099003|18002099003|5023799004|261028144727099003|4143699003|11063799006|56012099006|261021135927099003|261009221727099003|261022105027099003|261009223327099003|261022075727099003|261021121427099003|261021123027099003|261026140227099003|261009220027099003|261009223027099003|261009221227099003|10067099003;
X-Microsoft-Antispam-Message-Info: RzsDtBnzKQPNnHbXFsGL3qII3mFjiTxBFX+YTlIOYJedDLYHQ0gMw86LiPbjwEFzBLfgymfVJ2enQwYoGaDWRTNb6nhqiq6EIFS8pPU+9qPECr+P3xnbHk2ihv0zoZAacE7KtxqmEc+f/snuVR7oo2v3QSeuIgmISPvO2tCNPI+XW0KYo/hTZ0E+Yy0Oiski0sURtUphYjILpKERwjuBx/GZi8qL9TFsd2zLxf+lj0FuH67kvmAxvrxBge8DrWj1zMb1RsaLCE3kpsXIzzFhsYnQhKmsqDz5xQOpA5C3JWhrm8WWgL7Z7y2yVY1ET8dECLw8uFZsr5mO3P93Z7PzBe6Zhz5R2X0TPZwveELtpFplDM9u8VeNwiGKqD1msSPQ42FEP9WokegUfZHZ9xPSSBh0gHc8ccRCCMeQs8k0XbsZR4VCOhDppA/Tn2tM/mTUgpJWGQyXXidj5fQF7xb5oydH9x/qvuco3jz24wjHDcN/z1H1STq2mBj/9dU3Q9JYsEFk7Sc46xd2njqQwt1SnbkATku7if4pVr9monMkhaM3oZ/4KBlXQW1Rf4TgeJWEtjA+1RtQFhEJ1qy0WXdjlfEPYLruThHz6MwxmffoFJXNeGVA/DU/n5pykCY4stL8sNzs49/Xv08dMC/kSW012VasOAOtHwvSce7s10vOZSo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(22082099003)(18002099003)(5023799004)(261028144727099003)(4143699003)(11063799006)(56012099006)(261021135927099003)(261009221727099003)(261022105027099003)(261009223327099003)(261022075727099003)(261021121427099003)(261021123027099003)(261026140227099003)(261009220027099003)(261009223027099003)(261009221227099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eUgzSXZNRHAxM0xvelJYNWNCRy95NDZOazJycTMrUmRmRVd2WVhvaEVTUzcv?=
 =?utf-8?B?a3NRc0ozYWxqRVNXRUFiVndJSERjTWZuakVyKytsZk1BWnYwbUcxSGZtTk5j?=
 =?utf-8?B?eWtJdG9icE4zU0JiZDFHR2ZyeFBYV2tiM3c2VmorcHJ4ZnBZVFBGemJOMnBZ?=
 =?utf-8?B?ZWs4ME91WG1RM0lYQUh4eUY5VWJ0UEhoWXF2WmY3V1ZVVXJJbE5vekw2Nkxw?=
 =?utf-8?B?T3FFeUxwWUF2U0p5cWt1eFhjbnV0cGM4TEMvNmRSR2JYRTNKb3U5RDNjb1J2?=
 =?utf-8?B?dElRcWtsWVI5dGlkZlVFL25RdmFqd0ZOQ3RSUEhyMktvTHVGN2tHR1FUS0hV?=
 =?utf-8?B?dzVrWGsxUUh4dVRjUUIwWEtIcFdpNWlWc21nS25QN2IwQ3NLb1FoOTJ2bGdK?=
 =?utf-8?B?MU1UOWY3U0ptbzd1WG90ZGFHZlhHemdWVFBHaWllclQ1b2xVTERveXk4NUNk?=
 =?utf-8?B?U2tuYkdtd2RUVmh3WjlrY1I3bGdKZkxhWnVIMjF5bWswYXdjZ0dxR3M1aVV3?=
 =?utf-8?B?ZmNKTU1UMGVDVHQwUUtxR2FPaXNTWkU1U25DbzdqY1p2aDFkcWdxNTB5V0wz?=
 =?utf-8?B?WVZsMklGV2RDUTgxRXdCZ2dhMGIzOHFaTWZsWTJTbGN1bVYrKzBCM2NsSTJU?=
 =?utf-8?B?WmhVMGlUZWp1YWdORCtIMXZNOUR5WCtibW9EaEk5RndzOTltL3RQRmJJbTY1?=
 =?utf-8?B?VHZHMDJvYWhyRmkrcFVGWDlDVDFrMXNxU0NHdEQ0L1R4aS9xSStLYVIrRUhT?=
 =?utf-8?B?YzMzeEx5UkQrdXJnVEdLek44NmVqNjVaeTlBL01hQ2FjSmZ4SXA1bG5WRkc3?=
 =?utf-8?B?SWFmMXY2bUVsdzRYU2RCSWhBWWE5a29saDMvNE5NZzkxKzQ2VkJtTkJFL1M5?=
 =?utf-8?B?S3QrbDhlT0w4T2ZLOTNVKzZQdkdwTlhScVFGOCs5VWZDYVdscFZ0NjNZcTk0?=
 =?utf-8?B?UWp2bFZkWnEvaHc2dDUrdk4vcHJvQmcvYU9XTWNKTjg3cWM3SUg4eXBvTFZm?=
 =?utf-8?B?a1Nhc0NweWhQcEdkRDk3MjU2YjBPUGpIbmpDK2U4NGdiS2tFZ1NKRzhHclpa?=
 =?utf-8?B?VzV4Z05jdG9Denh5ODh3KzgxVXp5S04rVGI2QlNOWmx3WEVaem9VNytnYmhs?=
 =?utf-8?B?dml3ZWhmbHpBbkVlSzJxMUNHVGJoZ2NMZ2Q4MWY2ZUpEWW8xcWc1b0pwa3A0?=
 =?utf-8?B?VUUzMjlHN0NVMTFJSFl4dTg1TzRMWlRoWjBLL1hHbkx4WTUxRk5OTzRiVWVD?=
 =?utf-8?B?ZjcwbkFpQkV1Y01kdEhobjJFMHVDNEhjblU3RmFocHRicWVUNzhjZ0tZS3pF?=
 =?utf-8?B?eWxTNlN4bkpFWDdpVDN0dk9FaHpycFlyelNGazAyL3lZZkJjNnMzSkRhMC9M?=
 =?utf-8?B?cXdMU1pEQTNjRlB0UzBLc2QzQTliczZlSC9TOWRYK3l1NEpLUFQxRnZqVW1S?=
 =?utf-8?B?blVjSFlZU2NTaGdSVTBNc0FOQU11b1l4N2RHYTd6Nko0TEZ6THJYNlFYcGZT?=
 =?utf-8?B?emp1YUl6Z0p0T0N4eTJhMGY1bWhYQkMwZ2t4SncyQ3BOckltbEZwWG1IeWhO?=
 =?utf-8?B?VWpXaXRmb2V4SEE5NkxzSHV4N2h3YTE0ZE5IbGFUdTkvVGlzRDFKdHRYZGIx?=
 =?utf-8?B?VTY5elFMc3hWaWRJdEZ4eEljYXlJdzIrUHY5NGRpQjlwUHVTM0JGTVMzQkVN?=
 =?utf-8?B?QTJKWFlqNi80a0t1bWVQN1Q5QlpsRW9HUFIxZ0lTN29KOUxzRi93UEgwaWVH?=
 =?utf-8?B?bnprUG91b0lmd0l4Si9SQWlIQTh5Y2QzMkJSeDkzOWY2eFN3SVNOR1hzOXh5?=
 =?utf-8?B?OWVoS2RKR05JUDBCVjN5VnF0Vi9kbGlWNEMrRlJzRTFVTmM5b25KQktwblF1?=
 =?utf-8?B?bGwzRVFaOElZdlQvQW9FeGtUTlhPQXNZc1JCZVlHb1ZnbllRYW1jeGk4RWkr?=
 =?utf-8?B?Ym9qdGdXdjBtWmJsWWJJUm83a0ljTzFRRTRPYWpBWGRsdWdnZWlReXpSY2ZZ?=
 =?utf-8?B?c1hDRkdmUDBzVGk4N0R6dWFXNG04ZmYwbTZCT2JIR1lsdEF6c2lUQ0NsbE5u?=
 =?utf-8?B?Q3g2MGJUT3didVduZEV2TmlTaDdyN09kZ2xkL1FuSkMzeDdZWG52eXdzUHBW?=
 =?utf-8?B?cXJtVnYrSXYyVEorQVZTNFRmZUw3R3NubFlldmFvMFRqMXRERzVGdHNWdWsv?=
 =?utf-8?B?d2lvaWdLdnFLUytiWStvY05Od2hUR1FvbSt4ZGhzY1locWRWS3BWek5NZ0hY?=
 =?utf-8?B?NEsyRzg5bkI0YVJKWllySi92cTV1NUQwTWk5N1dBbTZUQ2diYjg5cVNSckZ5?=
 =?utf-8?B?ZU9VVHhKYVg1SDFsRk0rU3NqVkVsbWIzS0ZFNjRqMUUwN1oyY3BnbXpYczA3?=
 =?utf-8?Q?SRBo0Y4HSlDhhW/PU+BzgFfPpNMZp3zxjsG/5?=
X-Exchange-RoutingPolicyChecked: gR2mqdcMoaeTbNAFqFoFOgg2KIkG0RDFq/3u5H6uf7ZIlVL0s4cafV+rY1neQKfyal71NQZaNh4G0YnI6q1Ds98rpYT1gRzvQK//c3glc/cKZw404efyYwPg0/S3TAeJcphFYs46CpNiFUoRaEi2enK1zgnNv93oM7sUxQCSN6BQVcAzI9E5tbyQlyBlhtyLyLz0+41xl2Me3ndfXkiIIgDqbB9okoXX9ZWcoae7bxTcJP2jusT09wIcnQyTKHAphuxjDT0xWyEJ83zJ/NnaDm+7PnX26qwxiQ1C8Xx7IQQo/GSHI6KzryAfr/V+MU/uc0zL/StvA6p9t8jOTigdjQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: f709b8ab-af6b-4633-d1e1-08df35940b6c
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 08:10:07.6348 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hkTTZKtA4SPvWtfffX/fGOTsuPUq252bXXU7g/2CwZvCX2vKNYPFjM+OQC3ku7bzUPo75UjZitShr8Rd30ECfzsc8GnBk0KcNqtKHzvK6e44v0bb0JL8B0/PxhAY3RVg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8695
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 27.10.2026 16:11, Andi Shyti wrote:
> Hi Balasubramani,
> 
> On Fri, Oct 09, 2026 at 10:12:42PM +0530, Balasubramani Vivekanandan wrote:
> > The kernel crashes when unloading the xe driver on CRI:
> > 
> >  Oops: general protection fault, probably for non-canonical address 0x6b6b6b6b6b6b6b73
> >  RIP: 0010:platform_device_release+0x80/0x90
> >  Call Trace:
> >   device_release+0x44/0xa0
> >   kobject_put+0x9b/0x250
> >   put_device+0x13/0x30
> >   platform_device_unregister+0x29/0x40
> >   xe_i2c_remove+0x80/0xa0 [xe]
> >   devm_action_release+0x16/0x30
> >   release_nodes+0x3d/0x140
> >   devres_release_all+0x96/0xd0
> > 
> > This started after commit 0f485f88656af ("drm/xe/i2c: use
> > device_create_managed_software_node()"), which attaches a managed
> > software node to a platform device created with platform_device_alloc().
> 
> ...
> 
> > We can fix it by removing the dependency on i2c->dev in
> > xe_i2c_notifier(). It is using it to match against the right adapter.
> > Instead of using the device, use its parent to match.
> > 
> > Fixes: 0f485f88656af ("drm/xe/i2c: use device_create_managed_software_node()")
> > Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> > Cc: Danilo Krummrich <dakr@kernel.org>
> > Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> 
> The patch looks fine to me but I still see that there are some
> concerns. Like Danilo's points are valid, can those be addressed
> later?

My thinking is to go back to managed software node once it's limitation
is addressed.
Though the concern raised by Danilo is technically possible, we won't be
hitting it because the software node is only shared with the i2c adapter
device and Xe driver deletes the adapter device during module unload.

Regards,
Bala

> 
> For now:
> 
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
> 
> Let's wait a little and if nothing arises I can apply this for
> XE.
> 
> Thanks,
> Andi
