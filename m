Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDD34E7717F
	for <intel-xe@archiver.kernel.org>; Fri, 13 Dec 2024 19:02:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B57CC10E444;
	Fri, 13 Dec 2024 19:02:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LQIjQ3Gr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C4B210E444
 for <Intel-Xe@lists.freedesktop.org>; Fri, 13 Dec 2024 19:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734116531; x=1765652531;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=iHcbCncZCuu9RwrIbjSWH5/QYvWLd4UtLFCsBuKQXYs=;
 b=LQIjQ3GruyqdJIYSd+wIq8Mpe3u6YLbIYskMGZ9FC26OxBjekTUj8MXS
 GnxpVieqxubNj6TbTocN0BdsyWixoI+tEVCs+6KAuzENA5LsnhW9kitFS
 MDiB8wJBY7pPqUDxGY98w9nGWgQObyMQ+GvdJHyZ6AT5oVHrw4FOs3JoD
 aCjB/CX5+ys26uA6xEkFYHOKlweHI3JK0nmty+cro84MjylnNFZ3k6le/
 0Jf6RzDBwcAC1UQZu9Ln3dnnCHyoZJRZjNBnVTIcRDMBXxSPo4b48Ngbg
 mQ+BeWgvXKeTLZ3tSdG4hfs4JPTHY8bEfBcd6gXzquxTdfVbQn2b3BNDi g==;
X-CSE-ConnectionGUID: NEQxaDXaTA2G7F0ZgpimIg==
X-CSE-MsgGUID: Xjeuxax6RhadXZdLNYqsTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11285"; a="34488860"
X-IronPort-AV: E=Sophos;i="6.12,232,1728975600"; d="scan'208";a="34488860"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2024 11:02:11 -0800
X-CSE-ConnectionGUID: qbaif30hRcCfwb0wqStsmA==
X-CSE-MsgGUID: yqE7hczfTlyLuHJomAdSpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="96481399"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Dec 2024 11:02:10 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 13 Dec 2024 11:02:09 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 13 Dec 2024 11:02:09 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 13 Dec 2024 11:02:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JxObjQnd/ea6qSTLrI/yZkaCAyhG6lVgEt1X3+47Lpn1c+v2plRJ37lKChF9bocDHfW+lJO7irHPXxP+XJ1O3mxqIKBEttn6ay7GI+LU4tZooIaYH/7riFf+otXXJoTQ1HFWUqN1VCDYCD8a7CSvIdKkjb0jD2I+ZnPrEgEL/uQW7G+bntZXVNk9KeEnLnTvksxHQvL5rYJwp3LmtqcW5gXMXKmizXYK8K6oatLNt3I7Wf3nO8YEB9lkX25/yAMIAA8KIbpb5f3uxnzed6gknVx+0h6WFCoPJHlqiZx1WamGCF8jV0M8X/cR5XakY0FxygT5gkKzl1vtrt1SJl7wXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iHcbCncZCuu9RwrIbjSWH5/QYvWLd4UtLFCsBuKQXYs=;
 b=JyM3iEgstScalY5MTRhM1LX5SdvY2ZWYLCA49jXcKXEH3aD7o1Nxrrzvhza1hKsmtkHwMwpTIkjMEc+xVqe6W9z0zrVmeQjqe7yFO+YeZXX0tEaOMj0kWNmaxFn4jBXQSrULsq5bF8o2+90L4fTsOxIlkmTGXJ5KFFSs7esvggzFhccb/YExGMp+2NYrPOtcyuSTE18ljGkHfN11ykMsvIt+kPzRvkwpeHU03dyAxf9w5NXUmF+e5Z22rHkOtuLJ9GM05SE9uhUukuyv+A1kJVIH37ac6JEZTMybv+gveniRPQAKxca2BvyBtKQz/T9lzmCuCZkUcvLj0vCdO3bN8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by BL1PR11MB5254.namprd11.prod.outlook.com (2603:10b6:208:313::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.17; Fri, 13 Dec
 2024 19:02:03 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.8251.015; Fri, 13 Dec 2024
 19:02:03 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Harrison, John C" <john.c.harrison@intel.com>,
 "Intel-Xe@Lists.FreeDesktop.Org" <Intel-Xe@Lists.FreeDesktop.Org>, "Souza,
 Jose" <jose.souza@intel.com>
CC: "Harrison, John C" <john.c.harrison@intel.com>, "Filipchuk, Julia"
 <julia.filipchuk@intel.com>, "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH] drm/xe: Revert some changes that break a mesa debug tool
Thread-Topic: [PATCH] drm/xe: Revert some changes that break a mesa debug tool
Thread-Index: AQHbTYR5pHreaCgN6UaswcTSQRsRC7Lke05g
Date: Fri, 13 Dec 2024 19:02:03 +0000
Message-ID: <CH0PR11MB54446FA573DF1DDD356C3129E5382@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20241213172833.1733376-1-John.C.Harrison@Intel.com>
In-Reply-To: <20241213172833.1733376-1-John.C.Harrison@Intel.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: jose.souza@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|BL1PR11MB5254:EE_
x-ms-office365-filtering-correlation-id: 08df8480-64f2-4f39-2a31-08dd1ba8a14c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?M0tlMXgza1pXU2RHSUJMbUZFSFRMYWlVenNnakVyaWpra3Z1ck9WdGRESjQ5?=
 =?utf-8?B?MkpCeTc3UUFhZGdSYzVRcG9VVEpqbUl6VnVNYVQ1c25Ud1lrc0ZDZVVsQnhD?=
 =?utf-8?B?SHVON3dYMm5XWGNqRE03STkrVjlDbWdmRnFBeCs2MlVFaE5HVjdvdGQ1cUJn?=
 =?utf-8?B?bTZXSFNtSlVvaTBYaUFpdzVKSUNPT0NXSXdidHNXam9RRzUvVEFqcGh6SE5k?=
 =?utf-8?B?L0ZzeWxDQkRlNGErWjZqQk12V2Y5STZESTJDY1UyYmJTNFg3bzBjUGY1QVFM?=
 =?utf-8?B?REhLZmd4cXBsVWJuSEsvcHFXMm94VGd0OS9IN0dBcHpWeXFkMGdHeDJrTzF3?=
 =?utf-8?B?eVhDRGgrMjhvMVoxVWQ4R1VYcWVGYWozWEFoVm8wcGFOS0pZV0t2N1JaeEo2?=
 =?utf-8?B?Rmc0VkFqQkE4Z3pRa2FnOXloR2V0WFp5RmV0b1MzUGdCYnFxNWRTbVZSOVVi?=
 =?utf-8?B?b0pJYVl4U3pQdlZmUkxZcDJDS3VNUXdCcWc3dW9oZzV6R3BWQXFzbWtraFg4?=
 =?utf-8?B?NnNnRXUrUlRzaEw4dXluRjRuQThrUlgzQ1hUNTFDNEtJWXF1MHVWc2U5dVpW?=
 =?utf-8?B?cSthUVd5ME8xVDhsRmFrYlJUWnJ3S0FPOTJSR0EwMkpBRUNnV2pvMnFnWENr?=
 =?utf-8?B?d01PS09LRk9GRmN0ODR4bVBDOUtlQ2pxZXJDSGdvMFNCZDVEajlYdG9jZWwy?=
 =?utf-8?B?bjlKRWh4anNjR1dCdXUyc1RWMEczOFJUWDNzZFB4aFpCeE5BYStmQ0ZYYTVz?=
 =?utf-8?B?ekc1TXFJNDJDc3dNZ1lhU0NTWC9tL00wcDJWZkp5bHcyRnBlTG5BZVBPMXRZ?=
 =?utf-8?B?amlaWTZSSXFhTklsVWRYdlVERktZbTBUdmhkbnN2SktadmgyV3JyZGE1Rk9P?=
 =?utf-8?B?MGRlcEdieEdoN0hyNnI1QjRlc05INUpmMFYwNTRmUUE0OElZcHhrTTE5QVNm?=
 =?utf-8?B?R0xTN2k1MmNmaDlVYVl0V255eE1zZVlueGx0Z3kzRkRyYUJQRXRBcXBWeUlX?=
 =?utf-8?B?V3RMQzJONUJNdUZKaEZPL0F2SUs5aFhoUjJub0k5bG9FbEpUSFNlMEVhVDY0?=
 =?utf-8?B?SXM5ZHZrYTBTRHdsNDN3dThoQjdFM2lEZU95ZE4yVjJiY3VwYm5SbzVkaWl6?=
 =?utf-8?B?WlAxOG9TNmhTaEZQb0Y0Wk5FVitBa1owemE5aktPZ0xHNDNkamJlbVpPQ2ha?=
 =?utf-8?B?NHliYkZRdU1MNUlPZ1hySkxjcGxFd3dzM2VwdzdXS3k5WnRCVlN5TjdlV1VF?=
 =?utf-8?B?SmM4bi9rSUZKTFZlY0xYZXltSk9lY1lyUU9sZFI5a0JzeW9PcXVQUUFZUDMy?=
 =?utf-8?B?ZEtKeDI5aFpPWDhDUFZkTUZXOVRIU1Z5K1NkMms4cjVFZi9HekZDV3FVL0JS?=
 =?utf-8?B?dDFwaUZkRHR6ekc2MHVNTjV6RHJHM1RKK3dnWmZDdW9IUzdoZCsrUG5jclZF?=
 =?utf-8?B?dHBGMTUxSmQzTDB3STJ3NFlZZjA1UU5JVnVPeGdSbXlsU0VhbEM5dnI5MzRq?=
 =?utf-8?B?SVJobVEvbVRpbmJjZjVEYnNNazNqL2pIcXJUcHNKLzlEVExkcHEvN3kzRTkr?=
 =?utf-8?B?Yjl4UTNtd0Qvd3lQd2p5ZWpndnNKWmhCQ2xVWHNSMmExcUZueXE5cGRWd0FX?=
 =?utf-8?B?ZlkzVFNabXFwYTFoZ2swUk9ZdDFGcWlwVHFoR0E0VitEblZWbkFvWCtpb0Y4?=
 =?utf-8?B?N0cxaHQ3eVJpSGFqVXUxVGorb0ozRUdSNWlsQzlsZnVRbnVJbWFqUHBJbDM0?=
 =?utf-8?B?MXd2dDZraU5xNS9LOUpqZDZsUmVab1JBczdReE1sdEo0QklJNEhJOXZpS1Bs?=
 =?utf-8?B?ZjdzVFJjSy9MRXZaRXlSMi80SkN5Wi9BbFNCWVA1Skw1S2svWDR2eXVSbXM0?=
 =?utf-8?B?eTVBV2N5S3MyeWRmNDd6alBSaFhnV2c4Vk1ubEgxTHhhM3c9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eDYvYVZmTEdRRmZoam9sL1JIcnlxYWtJZDgvcnJhdTNaWXRXQ3QzNVVmakNZ?=
 =?utf-8?B?NS9DaU02K2tERE84TFplVzNzSWF0bEZGbTQzRkFyZXNhVmY3dUhUcWE1bWJZ?=
 =?utf-8?B?SVRwSEVVZkNvbVluRC92dlZHS1ZlcUk4K1VzYUZFVGdDUkxzZENRbm1mU2Zs?=
 =?utf-8?B?OC95bHlPQ2VxRU9hUkJlc1JVMm1sSzFSUVBsZEN6Tm5GZGNjejJlZEJBWm05?=
 =?utf-8?B?RFNwV1dOTkp2MFVyWXptRjZvelFicWU2ZHVLYkdmS20yTG5seFowb3hNN0R0?=
 =?utf-8?B?UHliRW1KSUdRbTY1RGNzRXhSMk1SM1IxdWlDUXp2MXJHUDVuZ0tHc0QxdDVL?=
 =?utf-8?B?LzB2WVFseXBGNUptRXpDanEyRnI1WFZjTEVnVmQzMEZGYXU3N3dSZnVPMlpX?=
 =?utf-8?B?MWl6NHBKWHpmdk5oTEdXOUNPb2dvSm1ZcGFRY0VaeEdYV04zbnZVMEwwaVZw?=
 =?utf-8?B?MEs0a09tdnVBZ2JWZ1BNb2d2TFN4c2VNbm5LTFNJeGsyTHlYTXY1TjZxOTZV?=
 =?utf-8?B?RDA5cmZLWm9ISmxvMkZwVmVqTzZxaGlCQndDSEw1ZXRxZ2ZhT1FwR2ZraGtO?=
 =?utf-8?B?TUQzUXYrUWsyMWxCRTBnUC9OeWR4cmhJVW51NUFKRWpDemtTMkZwSWhGYVFi?=
 =?utf-8?B?Yk50S2hXS2tXL0Z0TlFndXd6d3JXc3A3N1dyYVJqT1hEK09EM1ExMVFURDhS?=
 =?utf-8?B?SmdqdE5Idk1rWHlnRHdrSzkraHV3S2Q0cm5RSmVuL1RTUmZLZWFFdGRlaG5m?=
 =?utf-8?B?WFp2dVFrVXdoZmtNN1FFQkFCSHNsb3N1YlJSS0ptNi9Fc2tJV1BDN1RjUTRh?=
 =?utf-8?B?Y2o5OGJuMTZ6NFQ5a3I3Wk9BdXlvcTdFblVzTFBhRmpkbkFPWTlXdU9PNkZ4?=
 =?utf-8?B?OWo1VXRmMWxMY3cvc1k3TDJ4L2pDM0hIaFJmaFBMa25Qbkw0MHVHN1BNeTRa?=
 =?utf-8?B?Mld6OHV4TjF2NEU1QWNxMWNjZTkyMTd4ZHA2VmlqQXRla2xHcm9QVE01OEF1?=
 =?utf-8?B?cHgraXRGa3JvZVd6UHZES1NpOUFFcjV2KzN3alh1Z1hWcHZJVENnc1BacGkw?=
 =?utf-8?B?NE9iR2lTV010U0RRUkFUVFVxQUxBc3F6TUpTeXlDQkdFcWxLK0c0czltNW05?=
 =?utf-8?B?dVhQSWVodWdtZ2I1NC8wakQ0Rm8xaVB0QkJZRjc2WCtobFpnbHVEaDlBNmYz?=
 =?utf-8?B?a3hWWDNQNHZlcTNld05vTWhUNzU0cSsxelhLeEpqLzVtYTVjOFpqMXI5THRm?=
 =?utf-8?B?SUlkeURCMno5TWp6dithL2FlbmZOZmE1WGkzbllZRVJTYXE0WnRQY21PNHpF?=
 =?utf-8?B?dnZXMnMrd1VhMG5SV21pMmxCbnlJWDUwYUlqZmhWTmVSSGtiWGVSbUJIcDE4?=
 =?utf-8?B?bVl4cHAvNWYrR3Fxd2M3ZE03Z0pMNnl3NUNMU3hQK3g5NFlFanErZTBtMHRl?=
 =?utf-8?B?VXBOZTlYMTdkbHBkeXZ1Zzhja0w3aDhyWHFpNnJyVlZaU2xjOEVPdlVQMUxs?=
 =?utf-8?B?T2FLUlRMVW93U21NSU9ndVRiVWtaWkU5UzlxTVloVHRtYzBvRTZuMDJmeFlu?=
 =?utf-8?B?V3lzckFVbFBWYnprZzd1YldHSFNSYk9uRFlEZGRxRlgyNVJSektYdTRCN3A0?=
 =?utf-8?B?SXhZQStvYk53anBaZVZzTWp2bTZ2R3FtNlIwQy9oMjFRMjB0R2FyTTN5WE1S?=
 =?utf-8?B?eFZBVlNMWEdEV2dEajhhUWk2MVh0NEIwWG0xNk5EM01Gd2NuN01ibXgzMENw?=
 =?utf-8?B?YnRMZWh2ZCtURUlESWVXVXBPZTVTRURFWkVKaW5TelNmZHI0TFdPTUR1aUtW?=
 =?utf-8?B?UlFpQW5lUzFNT0lnRmJmdkxnanhZT3BXVGhmOTFubzNHNSs3ZjJtZFltOWVa?=
 =?utf-8?B?SG1iQlZmVlRUaG5CdjdIczZFbjArZUNQZFhROUNhTERaelMydlNSVnVmZlVV?=
 =?utf-8?B?NWR3RlA2Q2I5TW1lc045THVOTVBYZWRMV2w1WWR5VUkzMW9IQ082NC9COHlK?=
 =?utf-8?B?MnRYRkhSL0tzWkd0Ym9PaGJaTDRiT3BXQUtCdy9WRXMrdEZ5Tk9GclpnRGRZ?=
 =?utf-8?B?enMwYnViVVFPN3Mxb2dhRy9IQmpPdTdFenNLNkNOclUyblJIcGl1MVdwR1FE?=
 =?utf-8?Q?Ih5IfBNeq1T8F82hERQgUazeD?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08df8480-64f2-4f39-2a31-08dd1ba8a14c
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2024 19:02:03.1041 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6WSc3nW9nzpRlG2hFn+5BU7Jm/a63Az0VmX6yBJJh0wdp3HkRILPHwo+RPcYJGDYwAhErns2+4ozlhDwoCI8BkWodRc1mTtLjy/vjWLremM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5254
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

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEludGVsLXhlIDxpbnRlbC14ZS1ib3Vu
Y2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIEpvaG4uQy5IYXJyaXNvbkBJ
bnRlbC5jb20NClNlbnQ6IEZyaWRheSwgRGVjZW1iZXIgMTMsIDIwMjQgOToyOSBBTQ0KVG86IElu
dGVsLVhlQExpc3RzLkZyZWVEZXNrdG9wLk9yZw0KQ2M6IEhhcnJpc29uLCBKb2huIEMgPGpvaG4u
Yy5oYXJyaXNvbkBpbnRlbC5jb20+OyBGaWxpcGNodWssIEp1bGlhIDxqdWxpYS5maWxpcGNodWtA
aW50ZWwuY29tPjsgRGUgTWFyY2hpLCBMdWNhcyA8bHVjYXMuZGVtYXJjaGlAaW50ZWwuY29tPjsg
VGhvbWFzIEhlbGxzdHLDtm0gPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPjsgVml2
aSwgUm9kcmlnbyA8cm9kcmlnby52aXZpQGludGVsLmNvbT47IGludGVsLXhlQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZw0KU3ViamVjdDogW1BBVENIXSBkcm0veGU6IFJldmVydCBzb21lIGNoYW5nZXMg
dGhhdCBicmVhayBhIG1lc2EgZGVidWcgdG9vbA0KPiANCj4gRnJvbTogSm9obiBIYXJyaXNvbiA8
Sm9obi5DLkhhcnJpc29uQEludGVsLmNvbT4NCj4gDQo+IFRoZXJlIGlzIGEgbWVzYSBkZWJ1ZyB0
b29sIGZvciBkZWNvZGluZyBkZXZjb3JlZHVtcCBmaWxlcy4gUmVjZW50DQo+IGNoYW5nZXMgdG8g
aW1wcm92ZSB0aGUgZGV2Y29yZWR1bXAgb3V0cHV0IGJyb2tlIHRoYXQgdG9vbC4gU28gcmV2ZXJ0
DQo+IHRoZSBjaGFuZ2VzIHVudGlsIHRoZSB0b29sIGNhbiBiZSBleHRlbmRlZCB0byBzdXBwb3J0
IHRoZSBuZXcgZmllbGRzLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogSm9obiBIYXJyaXNvbiA8Sm9o
bi5DLkhhcnJpc29uQEludGVsLmNvbT4NCj4gRml4ZXM6IGMyOGZkNmMzNThkYiAoImRybS94ZS9k
ZXZjb3JlZHVtcDogSW1wcm92ZSBzZWN0aW9uIGhlYWRpbmdzIGFuZCBhZGQgdGlsZSBpbmZvIikN
Cj4gRml4ZXM6IGVjMTQ1NWNlN2UzNSAoImRybS94ZS9kZXZjb3JlZHVtcDogQWRkIEFTQ0lJODUg
ZHVtcCBoZWxwZXIgZnVuY3Rpb24iKQ0KPiBDYzogSm9obiBIYXJyaXNvbiA8Sm9obi5DLkhhcnJp
c29uQEludGVsLmNvbT4NCj4gQ2M6IEp1bGlhIEZpbGlwY2h1ayA8anVsaWEuZmlsaXBjaHVrQGlu
dGVsLmNvbT4NCj4gQ2M6IEx1Y2FzIERlIE1hcmNoaSA8bHVjYXMuZGVtYXJjaGlAaW50ZWwuY29t
Pg0KPiBDYzogIlRob21hcyBIZWxsc3Ryw7ZtIiA8dGhvbWFzLmhlbGxzdHJvbUBsaW51eC5pbnRl
bC5jb20+DQo+IENjOiBSb2RyaWdvIFZpdmkgPHJvZHJpZ28udml2aUBpbnRlbC5jb20+DQo+IENj
OiBpbnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCg0KUmV2aWV3ZWQtYnk6IEpvbmF0aGFu
IENhdml0dCA8am9uYXRoYW4uY2F2aXR0QGludGVsLmNvbT4NCg0KVGhvdWdoLCB3ZSBzaG91bGQg
ZGVmaW5pdGVseSBjb25maXJtIHdpdGggdGhlIE1lc2EgdGVhbSB0aGF0IHRoZSBNZXNhIGlzc3Vl
DQp0aGlzIHBhdGNoIHJlc29sdmVzIGlzIGFjdHVhbGx5LCB3ZWxsLCByZXNvbHZlZC4NCg0KRm9y
d2FyZGluZyB0byBAU291emEsIEpvc2UgZm9yIGNvbmZpcm1hdGlvbi4NCi1Kb25hdGhhbiBDYXZp
dHQNCg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZjb3JlZHVtcC5jIHwgMTUg
KysrKysrKysrKysrKystDQo+ICAxIGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZj
b3JlZHVtcC5jIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmNvcmVkdW1wLmMNCj4gaW5kZXgg
NzE2MzZlODBiNzFkLi42OTgwMzA0Yzg5MDMgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9kZXZjb3JlZHVtcC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZj
b3JlZHVtcC5jDQo+IEBAIC0xMTksNyArMTE5LDExIEBAIHN0YXRpYyBzc2l6ZV90IF9feGVfZGV2
Y29yZWR1bXBfcmVhZChjaGFyICpidWZmZXIsIHNpemVfdCBjb3VudCwNCj4gIAlkcm1fcHV0cygm
cCwgIlxuKioqKiBHdUMgQ1QgKioqKlxuIik7DQo+ICAJeGVfZ3VjX2N0X3NuYXBzaG90X3ByaW50
KHNzLT5ndWMuY3QsICZwKTsNCj4gIA0KPiAtCWRybV9wdXRzKCZwLCAiXG4qKioqIENvbnRleHRz
ICoqKipcbiIpOw0KPiArCS8qDQo+ICsJICogRG9uJ3QgYWRkIGEgbmV3IHNlY3Rpb24gaGVhZGVy
IGhlcmUgYmVjYXVzZSB0aGUgbWVzYSBkZWJ1ZyBkZWNvZGVyDQo+ICsJICogdG9vbCBleHBlY3Rz
IHRoZSBjb250ZXh0IGluZm9ybWF0aW9uIHRvIGJlIGluIHRoZSAnR3VDIENUJyBzZWN0aW9uLg0K
PiArCSAqLw0KPiArCS8qIGRybV9wdXRzKCZwLCAiXG4qKioqIENvbnRleHRzICoqKipcbiIpOyAq
Lw0KPiAgCXhlX2d1Y19leGVjX3F1ZXVlX3NuYXBzaG90X3ByaW50KHNzLT5nZSwgJnApOw0KPiAg
DQo+ICAJZHJtX3B1dHMoJnAsICJcbioqKiogSm9iICoqKipcbiIpOw0KPiBAQCAtNDE2LDYgKzQy
MCwxNSBAQCB2b2lkIHhlX3ByaW50X2Jsb2JfYXNjaWk4NShzdHJ1Y3QgZHJtX3ByaW50ZXIgKnAs
IGNvbnN0IGNoYXIgKnByZWZpeCwNCj4gIAljaGFyIGJ1ZmZbQVNDSUk4NV9CVUZTWl0sICpsaW5l
X2J1ZmY7DQo+ICAJc2l6ZV90IGxpbmVfcG9zID0gMDsNCj4gIA0KPiArCS8qDQo+ICsJICogU3Bs
aXR0aW5nIGJsb2JzIGFjcm9zcyBtdWx0aXBsZSBsaW5lcyBpcyBub3QgY29tcGF0aWJsZSB3aXRo
IHRoZSBtZXNhDQo+ICsJICogZGVidWcgZGVjb2RlciB0b29sLiBOb3RlIHRoYXQgZXZlbiBkcm9w
cGluZyB0aGUgZXhwbGljaXQgJ1xuJyBiZWxvdw0KPiArCSAqIGRvZXNuJ3QgaGVscCBiZWNhdXNl
IHRoZSBHdUMgbG9nIGlzIHNvIGJpZyBzb21lIHVuZGVybHlpbmcgaW1wbGVtZW50YXRpb24NCj4g
KwkgKiBzdGlsbCBzcGxpdHMgdGhlIGxpbmVzIGF0IDUxMksgY2hhcmFjdGVycy4gU28ganVzdCBi
YWlsIGNvbXBsZXRlbHkgZm9yDQo+ICsJICogdGhlIG1vbWVudC4NCj4gKwkgKi8NCj4gKwlyZXR1
cm47DQo+ICsNCj4gICNkZWZpbmUgRE1FU0dfTUFYX0xJTkVfTEVOCTgwMA0KPiAgI2RlZmluZSBN
SU5fU1BBQ0UJCShBU0NJSTg1X0JVRlNaICsgMikJCS8qIDg1ICsgIlxuXDAiICovDQo+ICANCj4g
LS0gDQo+IDIuNDcuMA0KPiANCj4gDQo=
