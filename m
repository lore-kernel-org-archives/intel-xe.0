Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1171E7716C
	for <intel-xe@archiver.kernel.org>; Thu,  5 Dec 2024 09:07:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A51A010EE05;
	Thu,  5 Dec 2024 09:07:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kXvkqnkv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF8BD10EE02
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Dec 2024 09:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733389648; x=1764925648;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=7K25TvxDtyAeR0ZVxT2kxMn1kSuW1VzI70tGSXnlQy4=;
 b=kXvkqnkvT+HpDyATeWxbCfPiE766yOTYVG/+EajpqqYV82rxFFzPkmE9
 vIX6mG8UW498OyJBxrJDuiaCGZFWfPIL1viXVan/igaLFy4NAfJ8i+aDd
 ZoXPr3pWS8DGvi8qnxK/fkXUhQZjZ/bWdpdSxqbB3QINtqGgVMJvSxg9B
 sPykaWOK1YHxoPSGW4AJ9l7wrvOhHkhzHj+e+tKD3fD9gA6gMbEgevG2i
 1ZyyYYLboAujDZ4h7Pup1D7+1YQZyd1ydA+2nmFLRwSf/GaShkol2r+Ht
 w2ceAS/QA+lbWnxJjwTE0WrRGDiIKLM2wbVdh+nPKOGPgYuFUNgbukQhw A==;
X-CSE-ConnectionGUID: SLhN2egJTyiCBwPiE0qR7A==
X-CSE-MsgGUID: FRVuD14FSu+eeDhv72UiFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="33572142"
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; d="scan'208";a="33572142"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 01:07:28 -0800
X-CSE-ConnectionGUID: /a3+2+xXQB2KdVkWOcfPjA==
X-CSE-MsgGUID: Iv55gFKXSMaLsWeIfmEDFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; d="scan'208";a="94383377"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Dec 2024 01:07:27 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 5 Dec 2024 01:07:26 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 5 Dec 2024 01:07:26 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 5 Dec 2024 01:07:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l0BVxaQWOkbz5LeJGGE+gZRpnJRp6t0eJRK2d8IMDi0yr3tBJMzXPJtcwZZVg2zFCyVoEC7x9sPFSUShx0QPemMM2SMr9KBCbAyDK1H4Ep4AjWJ//OZU0kqAk3THLR1Sok4x4dQxerNZCpoyOXg0B9A8zKaEcELGHmQIpcw3Dm1+rYQisZjoiPn1xBKKzodYMnl7Nf9nfJcR4R5sRH9zsHAOAQePiX6htYvSYdx42ZCDKtPbhhzqZE5lPc7+2xpsEU71NrV2SY+D5Z+dH2ClVQGEhCO+J6HNah/q19XyRgcWgYR9ObwzQYXdYZ7hXl24c6hrV/sRNUyFQPXHXlGp2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dpx369yEwPT5h9Cg5Ov6jDjV8l6ZVBOeHQ2azcieV0g=;
 b=uWfA93V87ZYInDgxQDHgGABZEYuWVgq5dUl1SroNf6Ew+JWVI98Uu5Uindecq0UiOSQz5cZp8jCggbCZ93tEpS/rzR7vkX6QrGvwrqrMDlCA38Cjg8XrDTA1Llq/qFlShAbG+ARUPXyLgEzHHkzrhvENYun6+/ECmJKGBX+x8IZxs5kuu2DBZJea2YA1aDkorhwP4IjwQBk4sGjtmB3clCzXxin/29rBpzqos+OTws+EyNt+7UWXSRIIXewauWziNghSNzmxWdosxeL67Bnu3hT8IT3Y/gwuEcP6+Yf6oMozJ8pbKAh7lGiK1TY2ztVD6BMaZL8XVpSBbb1fihn1Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by DS0PR11MB7652.namprd11.prod.outlook.com (2603:10b6:8:14e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.11; Thu, 5 Dec
 2024 09:07:24 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.8230.010; Thu, 5 Dec 2024
 09:07:24 +0000
Date: Thu, 5 Dec 2024 10:07:22 +0100
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Ilia Levi <ilia.levi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <niranjana.vishwanathapura@intel.com>,
 <koby.elbaz@intel.com>, <yaron.avizrat@intel.com>
Subject: Re: [PATCH v5 4/5] drm/xe/irq: Manage MSI-X interrupts allocation
Message-ID: <20241205090722.ccen4n6q22m5pt45@intel.com>
References: <20241128125345.1115-1-ilia.levi@intel.com>
 <20241128125345.1115-5-ilia.levi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241128125345.1115-5-ilia.levi@intel.com>
X-ClientProxiedBy: DU2PR04CA0281.eurprd04.prod.outlook.com
 (2603:10a6:10:28c::16) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|DS0PR11MB7652:EE_
X-MS-Office365-Filtering-Correlation-Id: d8ece381-6ec9-43b7-7204-08dd150c3bdb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bUVuaUgwS294NWl4YTJHY0VIVGZjdVpWTmtlSDJmMVFacUJTcGNmMFU2SndI?=
 =?utf-8?B?czhmQkJRZitQQmFjeVNSK1lHdU13RFQvRzVNZnQ0R0NHeWNJbEhNS2JxYlNU?=
 =?utf-8?B?ekVvY2dQdGtLTDRiV1RBekh4T21RMWtyR3QvS1AzT0gzMjM2UGxsSU5wUnQ2?=
 =?utf-8?B?bHUzNlljK2o2UUhmRktjeW5namZWVzNGdzRBZFlOTFduUG9CY1BFOGdhOG0r?=
 =?utf-8?B?RE1CMThNQU0zem9lWFJhUW92M0hhS21vZS92ZnJudFNCQy8rdklSK3hYaG82?=
 =?utf-8?B?SE9vczV1TjEwUWx3cDNNRFh3emtQaE94MVdBZ3V1azdOQ2p2Y3prRVdZbXRD?=
 =?utf-8?B?MHY1VTVpeVNTYlF6N0oxRyt6aFlTMmxkSmI3citDeVpTK25lL05nRnJpcHg4?=
 =?utf-8?B?eE85em9QWU9MeHc5TVFCN0ovKzhaT1h0RC84TjNuVEdkM0cxdnhLRVRvVVE2?=
 =?utf-8?B?cllyaXYyTmVXNTVGejNMR0hGa293WnVzSm1qS0J3RUhtN1ZPMTZESEZZOFNZ?=
 =?utf-8?B?VVZ5ZHdIN0pVVWJMUVczMFNVWDFQWjBzT1hqZk8yWm1FYnFFVnZuMjhLbDN6?=
 =?utf-8?B?Q2dOQmV6eGkxRHZNWXZTV0tHQU53NnBOR1B4ODF6alNSRXFMcVFLZXJlaDlq?=
 =?utf-8?B?QTByZTY1MXpFVjBxRXFUYlpFQlpGUkFNd2J6aDR0M3k0QW1oNTZuZWhzbC9y?=
 =?utf-8?B?djVPYW1NRlIxTHN0b09GaXU3UytQcFdkSWFyUStZSXhxVWFPSVpaem5jeXZI?=
 =?utf-8?B?bTZSQWFLVlI3eXBYR01zSUVNQjA1SkxpaktrSUpqajR1RXR1YUtIN3NXWUNY?=
 =?utf-8?B?SVViQzVvUEErTERyU1BLWVJ3TTc4TnJYSWl4eDVER25reXVOTEdTYllJMWV4?=
 =?utf-8?B?RDdSK3JqWWl5NW1ZMVVQWXlyamJoT2xvVStySHpIblVHNFhEQ05HNXVuTU1N?=
 =?utf-8?B?RlBQMzBBT1NEdkl0YklOTXA5V0lRcUR2amZUdzZRWURZWndmckdIb2VtS3RY?=
 =?utf-8?B?S05JVWNIY2lNT1VJaWFXOVpBbTdFR09pNXlpaE1rZ3ZtSFlCUHhPLzA5NTRk?=
 =?utf-8?B?SCtTcU9sMjdsclR6Y0dzaThvd2JGTkc5djJnM3JLc0NvV1FzRUNoTjk0cVM5?=
 =?utf-8?B?ZVExdDl0NUR5b0lENU5wTitGZENmUEFFd2NHYzFKY0xRVG5yeVhyZXpZK2pD?=
 =?utf-8?B?S2QyY0Vxc3dFdXdTOUFFVHR6enJEVWZMMUJUZEVvYzEraXI2L3ExSHVxRzBa?=
 =?utf-8?B?OWZ1QmxsYTNaYjVZSExUWmxNcDhkOUpnbDRJa3FSWkVUT0tldlRMM2l6bmhS?=
 =?utf-8?B?b01pSERsZTN2RWMza3crNDMza2tWandybEtFR2s3K1FRMjdRQitzU2d3TmxR?=
 =?utf-8?B?VDQ4dFBXWVdMQ2pWY1ZWU3dtQUtpMVNyYU1DeW1PMHQyRjYwV1VXdHlYRk5W?=
 =?utf-8?B?dHg3WW9vd2w0S0NsQVRsdHY4WmRrZ2V2TVdOOE1XZ1pRbHp5QnE4aFRXS2c2?=
 =?utf-8?B?RFBjcERaaXFiMU1yS0QxaTVPZ21kZ0MwbDA1clo5a1FQd0luYm9sZFFRZkQ4?=
 =?utf-8?B?dnNtWVQ2aklPTmZLbjQ5OGllN1E4QlRYS3lCMXZZN3ZFaWtaay91WG00UHpF?=
 =?utf-8?B?OUlBY0ZPbnFGczU4b1BtdUJkSmVkWk93bGwzaVBnQW9jS3JSclM4Q3B3ZUti?=
 =?utf-8?B?MytqYWFTZWE2SG1NT2tCbG5Pd09qSFJYczR2bHdwdDgxckZNNVBOT25QSzNJ?=
 =?utf-8?B?SEl2Q1hTK3QrRXI1K1YyTC91NHlnWTY1R0VUamFrR3F3OFFkQ2FNcTZtR2lM?=
 =?utf-8?B?a2dWTHBjeTUxd0NuUncxdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UHY0YVFKWVIwcWlnd0dIaW9ydGZtRHFXSUs2T0ZONEtPUkZER3RyQUJ6VDVF?=
 =?utf-8?B?bVZoSlFRN1dzcXVTd0dzcFFZbTd4VWV4TXdjcUpLazR6RWQ1UDZlbktLVUw0?=
 =?utf-8?B?bkFiS21aY1k2UXc4N0JCL3pFVE9EemE2VUJ4WFg2WEcrdFdQNTh3TnIzRU5v?=
 =?utf-8?B?ZG9SRFo1S2RzNncyTm1OeldKVnF1NjU4cldSMnRjMStaRVRqSXV6TVNUTnZi?=
 =?utf-8?B?Nmp6Q2hoQll6bDFZaXMxKzJlSUt4UEQxN0FZNmJrc0pjdWJWcnMrbFhCTGxs?=
 =?utf-8?B?dys2RGJ1Tmw1ZUxFaDQ4VDB3d3JWQ1hhZE5xRVZoaE1BSlJkVWhrUjg5Zm9Y?=
 =?utf-8?B?aVFNY2RqaUNjVzV2VTR6MENSTVl1cG9QQVRqeVgzUlRUaEZNRG5VUWxsall2?=
 =?utf-8?B?UVJQRE14dTBzYjBBQm8wL2dTK1I1azVWSEprN2w1Qi9BVmFTMDU1OGJIUnk4?=
 =?utf-8?B?MGFGTGlHNlVnU3phVWFsa3IybHBBQVNjT2lHNzBBZi81aXQ2SU9hN0V1MjBq?=
 =?utf-8?B?bE5EdldEenZYVWd6QXg1QzFiRGxrWEpndE9yUWpBKzZ1KzByeXUzYVA2M29Q?=
 =?utf-8?B?eG43eWUwZko4T3ZNWFpSVVVvdHg3S1ZiOGh1TjVPb2Q2UWhhRkc4OHY3QmFj?=
 =?utf-8?B?czdkcUpnOFdDZkV2TUQ4d0tjbkszWFBEY3BuV1hPZjBuTmlGQ2cxNDgveFUz?=
 =?utf-8?B?MmF5TUkydGlBRkxSckJPSkJERjhFS1FsL2JZTEdPcjg0aC9Ud3NuT1QrdUQ0?=
 =?utf-8?B?aU91Tyt5NTVtME1DbWNpMmZXZmNEQzlEM2drb3kveXdIVTNIeitCRzMrVGVx?=
 =?utf-8?B?T1U1Y0lEalJSWENNUHJTYXR6TUdyQ2NzaThONW9ueXNWY2JHQ3RNa0oxRUFr?=
 =?utf-8?B?NnRudXJMMDJZcHdIRG84bk9rY2VoOVlUbEoxamdWUmVWbUtMOWFML1BMblBZ?=
 =?utf-8?B?TDE1aHgwTmhKMHQ4Zi83NGExelNyLzl5NWpuNlZnRTZMT2NwMkcweGNsdXoy?=
 =?utf-8?B?djh5UStNdklFNTMwa0RuazFBMnJkME1scU85OGFiY0lVd3gwS0wrWVh6eTY4?=
 =?utf-8?B?UXd6K2tNY3daWkQ0eWpFK081QkNRN0FXYmV3aEx1T29mbnJoa1AxdW4xMG9E?=
 =?utf-8?B?NUJJZTdTeS8zU3Z6Ujd2UHpKbzFPRngxeUxRVkxvdUs1SkpsRU9OMWNmNjJs?=
 =?utf-8?B?R3p2M1pXMUk3dHBTeXRwRE5UQkxSZE1TZGJRNmFodzJWT09RT1I2NmN5cTJz?=
 =?utf-8?B?VkljeWQyWUUxRVJCb1dwSWhmdjRMbFRsTjdRejZNWVoyTFZsQWtmNXNKNmw1?=
 =?utf-8?B?T09yaTU4bXBIeEYwYkhkY3RIVmg4bWxYYmVFSFo5WFEzaHN4bm40LzlIYVpR?=
 =?utf-8?B?VDVUZnIzUWZBeUlGNUZDS3ZzWVphd3U1ZjF5YzFvdWVhUThUNGxGdjc3Tnoz?=
 =?utf-8?B?VEkzRG1SYzNUNlhLYytOVWZ3SkdGUHVQZ1dyUUx3QkRQU3lkQlp2bEJVdTZp?=
 =?utf-8?B?eDQyOFdUSXR6OUVzbVdJNWIwOTRmWTJFRm52bVQzZUlQMUZIOGhDQTJxdEtx?=
 =?utf-8?B?aHdPZmVnOXcyK1pSaVhGNHNIMDJKRWJSUjNmYk5MWHNsWWh6aHd5YmlyYWU2?=
 =?utf-8?B?WjJlRU9DNFVZMGtZL1R6Q2ZJbGJjMkgzTVVjRVdQL3VUYjZkVzJYd0dvMEg4?=
 =?utf-8?B?d1Q0bTJ3RDlHbHJsOG94ajFmZlU3bHE3MXZ1YS9zM1VUZUdrVzBIbVNmSmN0?=
 =?utf-8?B?UnFtQldOalI2S0wvM3lZREFWZUE3eG8yemZYd29ZTExNQnhKejFTenE4Qkoz?=
 =?utf-8?B?OThzMUFaSFRmR3IxRG9HTXVTWVp6QnJXakhVdWlyQ0lzUUE0L2ZCeEZiOGQ1?=
 =?utf-8?B?cktYbVpiYTVqR21la1V3TEZ4QWdkdndwaVVJdFFra1hwR1IzdTVuTFFER3dv?=
 =?utf-8?B?eDlEZHh1NVBMem9wUlcrTWI5K1E3dHFmZk0xM3VJbWhBd2lyZEJIWmRZYzdO?=
 =?utf-8?B?T3dRc1ZndjBpTHdzbUhkdzhnMHRRcUJ3R1Ird0l5czVkdDhRYjFEZjUxbjdm?=
 =?utf-8?B?NDFwVkkraG40eFlneklVUGxOV3RSOXN6YmZoV3FWeVBSdDZ3dXRTN0h1RDhT?=
 =?utf-8?B?NlNkZzNtaElseEtFazZQdXM2WHlvaHRSV1NGYXo0K3gwUEZaZDFPbnpvQkts?=
 =?utf-8?B?UXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d8ece381-6ec9-43b7-7204-08dd150c3bdb
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2024 09:07:24.6021 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WLys1TW8WawNtQYSSrkWS5wN5fPxm3uGbGMyNVSqIBL5kjAYVJdmiAW0Ebpv9MaXUjcI4n4wZJedEqStI1oXm5CKVV08j/tGSYT+d8E8OPA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7652
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

Ilia Levi <ilia.levi@intel.com> wrote on czw [2024-lis-28 14:53:44 +0200]:
> Expose functions to request and free MSI-X interrupts.
> 
> The request has two flavors:
> - Static MSI-X allocation, for known MSI-X interrupts (e.g. GuC-to-host)
> - Dynamic MSI-X allocation, which uses the next available MSI-X interrupt
> 
> Signed-off-by: Ilia Levi <ilia.levi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device_types.h |  2 +
>  drivers/gpu/drm/xe/xe_irq.c          | 96 ++++++++++++++++++++++------
>  drivers/gpu/drm/xe/xe_irq.h          |  5 ++
>  3 files changed, 83 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index ed638067aa26..1a3ded5a97c1 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -353,6 +353,8 @@ struct xe_device {
>  		struct {
>  			/** @irq.msix.nvec: number of MSI-X interrupts */
>  			u16 nvec;
> +			/** @irq.msix.indexes: used to allocate MSI-X indexes */
> +			struct xarray indexes;
>  		} msix;
>  	} irq;
>  
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index b8a0b9bbf24c..32f5a67a917b 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -830,6 +830,7 @@ static int xe_irq_msix_init(struct xe_device *xe)
>  	}
>  
>  	xe->irq.msix.nvec = nvec;
> +	xa_init_flags(&xe->irq.msix.indexes, XA_FLAGS_ALLOC);
>  	return 0;
>  }
>  
> @@ -879,8 +880,32 @@ static irqreturn_t xe_irq_msix_default_hwe_handler(int irq, void *arg)
>  	return IRQ_HANDLED;
>  }
>  
> -static int xe_irq_msix_request_irq(struct xe_device *xe, irq_handler_t handler,
> -				   const char *name, u16 msix)
> +static int xe_irq_msix_alloc_vector(struct xe_device *xe, void *irq_buf,
> +				    bool dynamic_msix, u16 *msix)
> +{
> +	struct xa_limit limit;
> +	int ret;
> +	u32 id;
> +
> +	limit = (dynamic_msix) ? XA_LIMIT(NUM_OF_STATIC_MSIX, xe->irq.msix.nvec - 1) :
> +				 XA_LIMIT(*msix, *msix);
> +	ret = xa_alloc(&xe->irq.msix.indexes, &id, irq_buf, limit, GFP_KERNEL);
> +	if (ret)
> +		return ret;
> +
> +	if (dynamic_msix)
> +		*msix = id;
> +
> +	return 0;
> +}
> +
> +static void xe_irq_msix_release_vector(struct xe_device *xe, u16 msix)
> +{
> +	xa_erase(&xe->irq.msix.indexes, msix);
> +}
> +
> +static int xe_irq_msix_request_irq_internal(struct xe_device *xe, irq_handler_t handler,
> +					    void *irq_buf, const char *name, u16 msix)
>  {
>  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>  	int ret, irq;
> @@ -889,17 +914,41 @@ static int xe_irq_msix_request_irq(struct xe_device *xe, irq_handler_t handler,
>  	if (irq < 0)
>  		return irq;
>  
> -	ret = request_irq(irq, handler, IRQF_SHARED, name, xe);
> +	ret = request_irq(irq, handler, IRQF_SHARED, name, irq_buf);
>  	if (ret < 0)
>  		return ret;
>  
>  	return 0;
>  }
>  
> -static void xe_irq_msix_free_irq(struct xe_device *xe, u16 msix)
> +int xe_irq_msix_request_irq(struct xe_device *xe, irq_handler_t handler, void *irq_buf,
> +			    const char *name, bool dynamic_msix, u16 *msix)
> +{
> +	int ret;
> +
> +	ret = xe_irq_msix_alloc_vector(xe, irq_buf, dynamic_msix, msix);
> +	if (ret)
> +		return ret;
> +
> +	ret = xe_irq_msix_request_irq_internal(xe, handler, irq_buf, name, *msix);
> +	if (ret) {
> +		drm_err(&xe->drm, "Failed to request IRQ for MSI-X %u\n", *msix);
> +		xe_irq_msix_release_vector(xe, *msix);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +void xe_irq_msix_free_irq(struct xe_device *xe, u16 msix)
>  {
>  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>  	int irq;
> +	void *irq_buf;
> +
> +	irq_buf = xa_load(&xe->irq.msix.indexes, msix);
> +	if (!irq_buf)
> +		return;
>  
>  	irq = pci_irq_vector(pdev, msix);
>  	if (irq < 0) {
> @@ -907,24 +956,25 @@ static void xe_irq_msix_free_irq(struct xe_device *xe, u16 msix)
>  		return;
>  	}
>  
> -	free_irq(irq, xe);
> +	free_irq(irq, irq_buf);
> +	xe_irq_msix_release_vector(xe, msix);
>  }
>  
> -static int xe_irq_msix_request_irqs(struct xe_device *xe)
> +int xe_irq_msix_request_irqs(struct xe_device *xe)
>  {
>  	int err;
> +	u16 msix;
>  
> -	err = xe_irq_msix_request_irq(xe, guc2host_irq_handler,
> -				      DRIVER_NAME "-guc2host", GUC2HOST_MSIX);
> -	if (err) {
> -		drm_err(&xe->drm, "Failed to request MSI-X IRQ %d: %d\n", GUC2HOST_MSIX, err);
> +	msix = GUC2HOST_MSIX;
> +	err = xe_irq_msix_request_irq(xe, guc2host_irq_handler, xe,
> +				      DRIVER_NAME "-guc2host", false, &msix);
> +	if (err)
>  		return err;
> -	}
>  
> -	err = xe_irq_msix_request_irq(xe, xe_irq_msix_default_hwe_handler,
> -				      DRIVER_NAME "-default-msix", DEFAULT_MSIX);
> +	msix = DEFAULT_MSIX;
> +	err = xe_irq_msix_request_irq(xe, xe_irq_msix_default_hwe_handler, xe,
> +				      DRIVER_NAME "-default-msix", false, &msix);
>  	if (err) {
> -		drm_err(&xe->drm, "Failed to request MSI-X IRQ %d: %d\n", DEFAULT_MSIX, err);
>  		xe_irq_msix_free_irq(xe, GUC2HOST_MSIX);
>  		return err;
>  	}
> @@ -932,16 +982,22 @@ static int xe_irq_msix_request_irqs(struct xe_device *xe)
>  	return 0;
>  }
>  
> -static void xe_irq_msix_free(struct xe_device *xe)
> +void xe_irq_msix_free(struct xe_device *xe)
>  {
> -	xe_irq_msix_free_irq(xe, GUC2HOST_MSIX);
> -	xe_irq_msix_free_irq(xe, DEFAULT_MSIX);
> +	unsigned long msix;
> +	u32 *dummy;
> +
> +	xa_for_each(&xe->irq.msix.indexes, msix, dummy)
> +		xe_irq_msix_free_irq(xe, msix);
> +	xa_destroy(&xe->irq.msix.indexes);
>  }
>  
> -static void xe_irq_msix_synchronize_irq(struct xe_device *xe)
> +void xe_irq_msix_synchronize_irq(struct xe_device *xe)
>  {
>  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> +	unsigned long msix;
> +	u32 *dummy;
>  
> -	synchronize_irq(pci_irq_vector(pdev, GUC2HOST_MSIX));
> -	synchronize_irq(pci_irq_vector(pdev, DEFAULT_MSIX));
> +	xa_for_each(&xe->irq.msix.indexes, msix, dummy)
> +		synchronize_irq(pci_irq_vector(pdev, msix));
>  }
> diff --git a/drivers/gpu/drm/xe/xe_irq.h b/drivers/gpu/drm/xe/xe_irq.h
> index 24ff16111b96..a28bd577ba52 100644
> --- a/drivers/gpu/drm/xe/xe_irq.h
> +++ b/drivers/gpu/drm/xe/xe_irq.h
> @@ -6,6 +6,8 @@
>  #ifndef _XE_IRQ_H_
>  #define _XE_IRQ_H_
>  
> +#include <linux/interrupt.h>
> +
>  #define XE_IRQ_DEFAULT_MSIX 1
>  
>  struct xe_device;
> @@ -17,5 +19,8 @@ int xe_irq_install(struct xe_device *xe);
>  void xe_irq_suspend(struct xe_device *xe);
>  void xe_irq_resume(struct xe_device *xe);
>  void xe_irq_enable_hwe(struct xe_gt *gt);
> +int xe_irq_msix_request_irq(struct xe_device *xe, irq_handler_t handler, void *irq_buf,
> +			    const char *name, bool dynamic_msix, u16 *msix);
> +void xe_irq_msix_free_irq(struct xe_device *xe, u16 msix);
>  
>  #endif

LGTM:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

> -- 
> 2.43.2
> 

-- 
