Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 389C3C27C75
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jun 2024 12:16:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF7C410EA5B;
	Thu, 13 Jun 2024 12:16:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iXHSD74S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45DD910EA5B
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Jun 2024 12:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718280971; x=1749816971;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=MjLiKWtDyIVFdnng1vSmBcy/MJxInGWcH6ODfe9YKTQ=;
 b=iXHSD74SsCC0MdSLo6+jAoo1Zy1uvmhGHy2lf4veiDmQ9Y9QlwpEdGHr
 sjJLRvrofqmdhAEJAvZwYU8dl04NEadCUXnBl93Y+avhKAhl7dOPOKLM6
 DVzkq2dd/XTeOFwzLV8wKTMHTSycXhvBJqWYd1XdWUy/Yk54QByZkCOUG
 xGfDJv5qkN/GspxK7j0jBQ+4az7WgYxT3xBK+AHllChjdoWg7kJITwzkq
 EHP2l9hnt+48VbbQpVeVCxgNLk0yupk+jP27+S6V0OU076veMvkJcVY8A
 KIn9oiiajtl/v5yWpDJHzBcX59rM4SesXiLj6yErDkz4ZIy7ljPt5Q3E7 Q==;
X-CSE-ConnectionGUID: DsGesLDSQA6aJcDfgN/bfw==
X-CSE-MsgGUID: fhnQQGUPQa+SgtUxb/7X9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="15060606"
X-IronPort-AV: E=Sophos;i="6.08,235,1712646000"; d="scan'208";a="15060606"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 05:15:37 -0700
X-CSE-ConnectionGUID: G8ej5WPlSXuUxx4xdtVBUw==
X-CSE-MsgGUID: FchtRlYMQ7aGeFehm7uqEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,235,1712646000"; d="scan'208";a="40765517"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Jun 2024 05:15:36 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 13 Jun 2024 05:15:36 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 13 Jun 2024 05:15:36 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 13 Jun 2024 05:14:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=haTA+xL4kgErxTyPDW5ltblc1R8gx5PTFXvE9Y0UAKFK6vuBJpmOtMkjP1ktD4t3+z/ZmRCkNivOGsUbkiiS2n6Gvdf3v43iL5MLQj4NI1RxP+1AcLcYSE7Y3KZzZHe0lGfDn8zgvffv+be4cQSIUq8rDYkv/g5jAnoUXChg8VyUDuMQWKzs2hoV22ibh7idKyUenORYj4vPqxZ6rAnir4VMcSNecV1rdIsuYgT4cwctSJS0OwOV8GmWw90jAMY1oZ/8/He/Zupk82oNRbSatw/JdbOvuSQUduhfSMSSf7EcIkIkqm8nGlNy/hNSgR94QRuKj4UwebeaRUTyQK+1/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4zN6sVaX7XU7FgPZx/5LNjehoJm1yp53kvWhrkMBhDA=;
 b=c+BjZZuW/sNk4u0aKIPIUUT1yrdfrUxqODe3iAb51fGzAlZi5LqoG4z2KVJNbmRwPtkkLA41tmfVDuqnf22q8YJZTAWngy/JGzbP2D0tChKwuQ+phJTp8om40kQuz0c1MjJz1E74wGXhMheTr17S1RokCnbpBpCLJgoDlh9KUtuJEBIZRU8M2uYHldhRuE+rdzOTquotIh/lF42u1LLJwiET7R7zSRQ0Jr/TPx0ULRfTbYDaCdYsQOWDJ4o+hDc2AR0qKUwV7yBZ+k/aNeWZRfglVp2KpnOiZvkNn8glqXTi5un0mXo8H03Vg/DOZRnUkFx3V6fdkGSkkpRz92pubA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by SJ0PR11MB5117.namprd11.prod.outlook.com (2603:10b6:a03:2d0::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.24; Thu, 13 Jun
 2024 12:14:50 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.7677.019; Thu, 13 Jun 2024
 12:14:50 +0000
Date: Thu, 13 Jun 2024 14:14:47 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Subject: Re: [PATCH] drm/xe/vf: Use correct check for being a VF driver
Message-ID: <20240613121447.jgpccepgovixmepi@intel.com>
References: <20240613120749.2032-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240613120749.2032-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: VI1PR06CA0175.eurprd06.prod.outlook.com
 (2603:10a6:803:c8::32) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|SJ0PR11MB5117:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bf9ca1e-e384-4864-42b9-08dc8ba26c96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230034|1800799018|376008|366010;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dXVOblZRL2l1U3U4ZGt2akdQY1pvY3AyMm1GZW8yMEoyK1VqeEQyR1djWEJN?=
 =?utf-8?B?c01BNjc4OURiczBEVkRObDlBLzM1d0h3SStON1JtSXVsU2FSRWUwVGZqWVNG?=
 =?utf-8?B?eDlsWW94UnRibGlMa3Q5WXRncmZUVkhpMzA2STB4V1d3c2Z0dW90MzV3YXRG?=
 =?utf-8?B?Q1NjaWlDd0xvU2xhMisxSm80ekR6cmVsM0hBMWFtWlNaUWRTcGs1QzZ2Zy9N?=
 =?utf-8?B?eTFBL2YwNjFhb2RZM2M1akw5dVhXSzdIVWlESDY5bGp2bStDWHNzK2E0MFFE?=
 =?utf-8?B?YXkxT3RCQ3Voa3NvQ1huM2oxN0ZsbGNQSkhWRmpFdXBtMEZMaDUyYVVPcXFF?=
 =?utf-8?B?WnQrWFVUVEV3S3NFSkpCMXJhL2VLcnQzcHhzdDZINXZ5Yk5uZC9IVmFpenFn?=
 =?utf-8?B?ZXRmUzFuakpvb3VnK1MxRWE3N2dWeXRIWmxLdWtYQzFoOS9ENml6dG0rYkMr?=
 =?utf-8?B?aEQ1U0c5MUQrb1l0RmpNeHhTUzNQVlphdHByQTY4N05lN3ZkVGgzeWtkL1NP?=
 =?utf-8?B?NWQwTDF3Ni9lVmdQa01wbEx2cjRPSzBmd2Z0ZVZXSVBlWGZlbUxXdncyNWR6?=
 =?utf-8?B?U0txelJFSGlrcGlEMUJPTlB2WlR4SHkraWlRWm4xTlpPbFhnWmd2a21sN01K?=
 =?utf-8?B?VW8ycjVid2gzMDlINHk3dkY4elNUZ25GTVVoUUFEU3llcFZYSnVENnl2Rm8x?=
 =?utf-8?B?NS91V2NpSlNuSUk2U05zMVNZUnpFNmxoblZCb3B2d3M0Q1MvQVlNZWd5Y1FP?=
 =?utf-8?B?Mm4xYm5aeWRrandxMGV1OWdlOGZvd0pHaVprWjRxN3pZTU9UY1llcVc0REZO?=
 =?utf-8?B?dFdSMTk5VmkwdSt2M05IMHNqZkRHTGgyM3RMK3picS8ySHJJQm5Zd1FUL2lw?=
 =?utf-8?B?TUhQU3lOTHQzdHpLR3h4NElUTXlWSElBVVNkbXdPQUg3SmVCeUJVd2twS0Ew?=
 =?utf-8?B?azF3cmlpRW9LSEhxR0EraUtScVNUWGdmTTI0c004TjNrZ2UrY3U5d25nQkFo?=
 =?utf-8?B?MnVPYmFNSWlvS1FwK2Q3T2tpbS80amp1QXJoaXQxRWFUcDRZN2lQV0NEc1Jr?=
 =?utf-8?B?SmViNVJzQXF0ZXVmdTJyaHh4Ym5BUzIyRjFlVW5YQjU4bzk1QjFjdStpYlI5?=
 =?utf-8?B?bVkyMmZVQndXYmJhNi9rc1dvcEROU1ZUQUNrSkVPRHJWZWI4M2Z0MTl2ZWlG?=
 =?utf-8?B?a1hLaXBwK3ZXams1cUl3bzhIS2diam1UdFoydkRoYVNzMXp6WGRvTXY3R1Nw?=
 =?utf-8?B?dnYyMUFsWFBhZW1OdG1VLzlKamFhOFdMdnFBK0x3NEkySi9KcnNOb0c3d2VJ?=
 =?utf-8?B?NG8rdEN0enh3Wm5kbGJZZUVMNUtTT1JDOUk0V09sdmVMZkU5OHpFelZsWFZw?=
 =?utf-8?B?QS8zNDhPaWt2NjdHY0V6emthcmM1cW4xZkl2MXBSL0xOMy9sTjFpMlo1bm1T?=
 =?utf-8?B?S3hlb2NXR2UrRkk0ZFljMWhJZXYzbDY4WWNLYzI4SGJ4WDFmUHl3R0lOMVJJ?=
 =?utf-8?B?RVRPUXJUZW9TQm9xcXJXS1lMWmxhb2VRNmNGcnE2WXRGZ05NM21UVFlSNXVn?=
 =?utf-8?B?RmthK0pscm9vM1VhdlhLRXhsQVd1S0h1alpHN3JJekhXQW5PbHNXMzkxNmlM?=
 =?utf-8?B?SXRjZFBTQzkzNy9FaTBXdlVqN0UzanJvYkpFQ1h2QUx1NVpDNlZUS0JsbEV3?=
 =?utf-8?B?Z05Temdmd2FyZGh2WG9IOGhOZEhtL041NTlZOXVJejdBUGpwQnZxQUhuYlVl?=
 =?utf-8?Q?ZOa4TZ3r1pbGOeUfPFOZ6L5xcTXbjluC5tWLmcY?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230034)(1800799018)(376008)(366010); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZXR4Q285ZlNJRWhmalJUMG9kSElzWkRFL0Q3ZzNNUEpxbHk2V2hJZ0p2cFVE?=
 =?utf-8?B?ODhVNFpHOG14dFpjb2JLOGhsL0pyS1RlMndUT3JrU0tzYU1VSDc4dDNVQmFZ?=
 =?utf-8?B?MDJsN2pDcC9Scnp2bUdrbWdRS0Fob1cwNjJqMEZVek9kY2lMNkovZWRYQWRQ?=
 =?utf-8?B?Y3dvc3VTZDFyN1NQbzJ6U1NwQjhjaW5RR3dJVTNJdFRPaDVDdXM2SGxOMWNT?=
 =?utf-8?B?Z2tNYnMxY01PSWpYL3NOZkJwcGU4cUFDZStacDh6TjhVaEt1dHphbHlSaHdm?=
 =?utf-8?B?OW5wM2t5ZkVjeG4vQmxHQ1d2K0pqOTRlZHcraWhETmR4cmNwNWgrcHRKOFpW?=
 =?utf-8?B?M0hpS1NTTGJTQmJBWklGeis1VkVLK055a2doQTdaMFVQVzhyTzg4K0RTTE0r?=
 =?utf-8?B?OUZFYWZ1bTZlQTNZTHJpV2dGSGJnUW1OSVkybXQxVkFkSytNd3hsallYUVlO?=
 =?utf-8?B?NGlhcWk0TU1wdndkazdnOUpSKzBnSitMWmExSXRWeVZ0dmJRSG01UUtuOENm?=
 =?utf-8?B?ZEkyOU1IN1RYUUhhNTRKWmxiejFFZDdSbCtQeXhlY0w1V3RtWEZETTZ6ZzVU?=
 =?utf-8?B?cGc4ZDYxMmlLUW9zd2RWNXpMSWJRcmVzclhJUmE4NklDOGV5OVM2d21MckVS?=
 =?utf-8?B?MXBRWUxEOWRqM0lmRjY1ejF3UVo1cWphWGxIc002Sm5ZQ21pNnFveUlwZGNz?=
 =?utf-8?B?VGRtWXhWZGRyWWJnYVU0Y3lRNmRDSDJxWlFQMzR4SVYzbHYyQXR1cUZINmhO?=
 =?utf-8?B?bFJ1SDIvUXlwdWRLSjd1TnZzTWpCcENqb3hlemcyVWswcHJjV0tIajgrZHZH?=
 =?utf-8?B?UTE3eFM5NjBpNWR5VWZ1bU5hV0lXNmVTZW52N205OWlzTVBhbEgrMHhFbENq?=
 =?utf-8?B?V2I1TkljTXVDTkZ3ZGRCaDFBOGhOcWpzNHA3V3cyT29PbFVWa2ljc1M4NURE?=
 =?utf-8?B?YjdmbngwcmNhYUR6cXI5eE1qMGI2eXJLR2ZyVzk5UVhGSVBhRWx4eXJhWHFN?=
 =?utf-8?B?V0FDSHFDbHczcGRmS1lrZ1FKZHNud0N0Rko4ejFXcDRzMk8wQitjVjJNK05s?=
 =?utf-8?B?eFRyRm0yQjI4NmtQQ3k2OUErREhKRHhIOUFLZzNuTC8wOHl4aFI3MEs5amxQ?=
 =?utf-8?B?WitHbzFYb1ZwaXQwZ1pyREV0c3FQZmRMY2VmOEFzM3VyOU1zTklURkpLYldw?=
 =?utf-8?B?dE1TNWI2bng5OTZsZDRoTVAxblJ2RUZKT0IwYXhSdU82UFY5bWkveU5Dajh0?=
 =?utf-8?B?ejU1T2lmMmNQQmpjZEN0blA4OHNZVTcyaHJITGRIanRUSXVXTWlwUk1YYnVv?=
 =?utf-8?B?bDc2cTBLcDBmSy9DeUwwdkYwM0o5L3E5N2ZscFc2UWJyaWMxNEhMM2Y4dlFT?=
 =?utf-8?B?dVRqWTMvdDk4c0NXUUhQRHVzQnIrSlBiaDduaWwzVEdPaTQvMExXTHlOVWdL?=
 =?utf-8?B?ZmlJdzJja3dmeUFaVkVGUFhiQUVXeEtuQldoWmVqbm9WQWhFUWxLRGZDVWIv?=
 =?utf-8?B?b2RMQ0ZNbk1UcURlR3dMbU1ITU82Yzg4MDNCMzRFYU9Cb3pJMi9qN0ZaL1Ix?=
 =?utf-8?B?KytDOURGNzVKTjVzQVpNVE45dVh4ZFROZnpJZnVDdG5GVFVaRnhiVmtyTzNj?=
 =?utf-8?B?SVk2dDNDNm1zWDF2OUlwUlBiK1RPeHpIajgwdnJLcW9vTFpwWWpWT2wxK1NM?=
 =?utf-8?B?UUR6TmIvRGR2N3pKQVJIZXV1c215dlhVOVlvcGxNWis4RkJNOHB2QzJTV1RO?=
 =?utf-8?B?aHJGbnBMVzY5QVpUS2pLQnQySFRONXM4by9obGJtZDMxYTREWEpNQnFpb3Vv?=
 =?utf-8?B?T29lZ0RIUjZkUGpxVEcvVmlQRVcwOXNFM011NHpzNVRGRSt0YVQ2MTNWQlFm?=
 =?utf-8?B?bVRPaWVaT3dRbWY3VVJNWEpQMTRwNE9ONUdpOVZ2VjQ5dEJrdk9QT1dXaGVr?=
 =?utf-8?B?Tkh2YVZuVmpnTXVQTjlOS3cwcnFpcGc4cGgzOUJiWWlXeG1FYmZKNGJvYnpF?=
 =?utf-8?B?U20wOVBlSDlkcGpxdUhOWUMwdk1DUjYyM2pHSnFDU3BPckk1RDVwak1HYVZw?=
 =?utf-8?B?akl3Qk01eXNsNEErMnAxM2NnVGUxN2M2N3h1TFFhaThzWFJwYXVJYTF3VGpu?=
 =?utf-8?B?WWUxS3pVV2hhZmQ4a0RoUmxhek8yT010UWpyZUYvR21HUGVwTzV2V09uSEI5?=
 =?utf-8?B?QVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bf9ca1e-e384-4864-42b9-08dc8ba26c96
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2024 12:14:50.3549 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3CCM/b9J5dzL2isIAucCBvFf0ZRFLpQGX+GxjRxHhyXwXbM091QqlOilenQFPm02xlSp/yhNyMIO8O/hQSDNd4f3zeobV3/dBGGC7FDB8Qw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5117
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on czw [2024-cze-13 14:07:49 +0200]:
> The IS_SRIOV macro returns true also when we are running as a PF
> driver. Use correct IS_SRIOV_VF macro to skip force-wake management.
> 
> Fixes: 513ea833c201 ("drm/xe/vf: Ignore force-wake requests if VF")
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_force_wake.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
> index 5db6926120c3..b263fff15273 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake.c
> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
> @@ -97,7 +97,7 @@ void xe_force_wake_init_engines(struct xe_gt *gt, struct xe_force_wake *fw)
>  
>  static void __domain_ctl(struct xe_gt *gt, struct xe_force_wake_domain *domain, bool wake)
>  {
> -	if (IS_SRIOV(gt_to_xe(gt)))
> +	if (IS_SRIOV_VF(gt_to_xe(gt)))
>  		return;
>  
>  	xe_mmio_write32(gt, domain->reg_ctl, domain->mask | (wake ? domain->val : 0));
> @@ -108,7 +108,7 @@ static int __domain_wait(struct xe_gt *gt, struct xe_force_wake_domain *domain,
>  	u32 value;
>  	int ret;
>  
> -	if (IS_SRIOV(gt_to_xe(gt)))
> +	if (IS_SRIOV_VF(gt_to_xe(gt)))
>  		return 0;
>  
>  	ret = xe_mmio_wait32(gt, domain->reg_ack, domain->val, wake ? domain->val : 0,

Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> -- 
> 2.43.0
> 

-- 
