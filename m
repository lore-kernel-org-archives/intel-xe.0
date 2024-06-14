Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4C15C27C6E
	for <intel-xe@archiver.kernel.org>; Fri, 14 Jun 2024 21:42:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37A9610E2AC;
	Fri, 14 Jun 2024 21:42:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h2xtkedU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7B6210E2AD
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Jun 2024 21:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718401330; x=1749937330;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=wD08vhYixYON61lQS00WU1WqvFmQkMPSn05k9SY/hUY=;
 b=h2xtkedUrJRN3HuIpqPGbIFWhI4nlDxCHdfZKzXREAkHQqg6CYYMvke9
 RdEd7X7qmBoZkE0YtfLgA9q9nsakDdiqIkOgBykvkJVOMVXohj19E+odR
 YPK47aMGzgqIoIyAZoqbW6AmWEUybC4FRLjU0ADZTsa4zeYuuHyUvLExr
 +6jX7z3/5/yK/gZ7jEkP1ux5emoyx9/ntB3ONt1WPfsXA0eeaH2UwaWn4
 9FjGRCay09xFC46qc1ouDcre8us0+5T8ej132uXGIGStz8y+r4Z2rCjo9
 PhlUtGkRFa/G2y6rQqMIUDzYJEG4vSkNJnNZXCKiLfsxRawDcLpsoDeMB A==;
X-CSE-ConnectionGUID: nUl6r4+dTNe/AHq2kVVGHg==
X-CSE-MsgGUID: nyV8J2ozQeigIOgA6WBWMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="19133645"
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; d="scan'208";a="19133645"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 14:42:09 -0700
X-CSE-ConnectionGUID: ZK5dpSbTTJOMWdMnZTWu3g==
X-CSE-MsgGUID: t02K2NBQQ3OHMqCW0Rc+sA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; d="scan'208";a="71398311"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Jun 2024 14:42:09 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 14 Jun 2024 14:42:08 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 14 Jun 2024 14:42:07 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 14 Jun 2024 14:42:07 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 14 Jun 2024 14:42:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I+2tLhOI6rEdYD29XflE7DzQdL2dNXVe5lmG5uRWcyp7yJqTV7E+phjFyOfdfiiJTfypimSRexjiw1BLzEq6EG5UXTRWOzo9x/QJqfYBk6BrXVrxC1kHooK4tcv5QxAS7oZ75/JXbL9m+mp2+mdC9vUPXdTn9EQF+zg/QQAtTf+78DW5Hljqu7u/xs2vxFZ3TpXojDc2PSBvhI/ep+m3P9ayclXr8qXqlPQG7NKPHgKgV7liwHkWCVu46Yq0j2CYeBOtN8fb0lrQKh2v+GyJuy81iMzY708lbTd8FcfPYQYhlgQwEvckYO/ct3kEYvR8I/rqUFRP2moJW145DdKqJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BPW9aeLqhVFM0l4IqxI/mhPC5bJoaqWlCfsNcPC5/tg=;
 b=bqy0bdeDq6DZWL1FbAGRczjnnx47OFck6DzDF7kJV/0DuTvYH1x7+BdQ6zSUVIcZvsGTRp/DQPo5HpGrbSzRxN7dFbyympqPALA0g9yCNJUPgGXbVopekCLDUqqBZ4W0Js6Fg/GsY4qkVWDFEw+NiqqmaHUf/QUt+lQoWWRCY6p+FfwM67w6f5UX6gBetmocGN3xR/a2G4mWDMlnfR7UJVVfTh7ssUPVyEF/BZx7ty3DsIrzXFbbji0WVQ2ndy+AZebrQAZqhI0U6hjJXvR1TyLYWsQvO4FDWrVL7Ht7j7CyB/g4KKnhKYGmjhLOjVj1SzZZuhcAGo0kQl9OoHxMmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by IA1PR11MB7754.namprd11.prod.outlook.com (2603:10b6:208:421::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.26; Fri, 14 Jun
 2024 21:42:06 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7677.024; Fri, 14 Jun 2024
 21:42:06 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Auld
 <matthew.auld@intel.com>, Paulo Zanoni <paulo.r.zanoni@intel.com>, "Francois
 Dugast" <francois.dugast@intel.com>, =?UTF-8?q?Thomas=20Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe: Fix missing runtime outer protection for
 ggtt_remove_node
Date: Fri, 14 Jun 2024 17:42:02 -0400
Message-ID: <20240614214202.18430-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.45.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0048.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::23) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|IA1PR11MB7754:EE_
X-MS-Office365-Filtering-Correlation-Id: 607f8c73-36d9-4d9c-af74-08dc8cbad5c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|1800799021|376011;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R09JQUNvYXdHcmIyeTlQQWFuek0ydUNOV1JYVkFqNmhnRC95YmlveGpZK0hz?=
 =?utf-8?B?cmljRU1wZWRIcCs0MnlWWldLMEhGRE8xdHJhZU5mTWpsK3RnLzNZUmc3aUx0?=
 =?utf-8?B?amcxaVIwVWVJTlYyMHY0bXdGc0ZjWDhXa3R0TTV6SjJQRjR1alAwQk9pYnln?=
 =?utf-8?B?MlRENzI0QUwraU5WQWllYzRVckh3aXdyRTlLUkxhUXNtWGtoTEVSelFqV3l2?=
 =?utf-8?B?TVdtV2x6Vk43R0pjaWFTWGI2ZGNYSVE2bEFsUjE5R0VOc1lSTW1oQ1FMNjBM?=
 =?utf-8?B?YkNndmVSYlFMTm9tckJ6KzhCdVJEYzRJT04rSFNVVEg1VzBuR1JCWm1wK3Z6?=
 =?utf-8?B?N3hrTk02eVV0KzgvL01meVIyYjJsWlZ2QjNrR2w3aFhRNmtHYWZkVHc0eDdh?=
 =?utf-8?B?bGN5L0tzdHo1S3FpVmkwd2EzNlBWQlg5VVdXd1ZNU1BJcmJLbUQ0Vll3bmEy?=
 =?utf-8?B?bUdjci9aQVNJZ3RweG1TaTlvR3Q0ZXU2NTVESGpVWTI1em5ndVFzR3hOajNG?=
 =?utf-8?B?T3QwOG1VaWZqaERMSUdQNFcwbVlabVN6NXZidjZVdWYvZVhuWUFTcWVNSHFk?=
 =?utf-8?B?S0xndnZHaWVmeEhrazBwRGVrZW9QaEFtdTkvemZzR280MkplN2ljcEd3dnlT?=
 =?utf-8?B?WlBMaEkyRnJ3eFZ0WHliOWFoc1ExeFpja0RheGRQVTZQaVpoODJVZnMrUkxV?=
 =?utf-8?B?ZXhhQWN0VXFFVjI4Zngvb1c0NkJRT3VGNjQ2UVN1Q0J3RkZWSVRHN1JONU9Q?=
 =?utf-8?B?RlFFcVExUU5IcngwMlNtT2lzck1IWWlqSGU3YjJ2RW5ucHRLQWMxRVYwWFZF?=
 =?utf-8?B?d0ZyRWJIcWRLQ0plbGhEOEw5RWtsWmFIRmpFdndyUXVKNmlnM25NYUdNQVJE?=
 =?utf-8?B?R2VwUzlPSnk2UStpemNHb1cyWmJPU3ZTeXNHczFaSG14bE9UaVExdTkwZHkz?=
 =?utf-8?B?N29HemhmdU5kQk9OL3pXRVFYY0ZTM2UxZ21jNmZqTThYcU0raTh5R3JOVy9k?=
 =?utf-8?B?bXdWM2JBWFY3RFV3cVVkRjFQaVY4dXdFQ1JMREZlOVVFU1RkRVFoanE0dEJk?=
 =?utf-8?B?TG8zdjFibWJ1eDNoY0xBMjJud2VTbE02M3EzbHYrVHdQdUlPbmRZYjFuOG80?=
 =?utf-8?B?UEJwVHRRUndjbjdzdjYvOUk3bHVDWWdRSXZtR3JMSHY2OG1SZE0zeXk4SjRU?=
 =?utf-8?B?a2NRWFczU3ZKRVVIVDJUYXJQdXdNRzRwTTRrdzBSa0lIVW42c0ttRHl1cWZD?=
 =?utf-8?B?QVRtVmc5Z2RCQXdPQ3g4TXYvQVN6emcwQkRLcVlnb0x2cTN4VE5xczhHMFNG?=
 =?utf-8?B?MThNaC9JYUFSY1VZVnY5cm1vOXg5Z25DaXo4TW5RMmV0Ny8yNWxtVS9ZemRw?=
 =?utf-8?B?LytvMWRwLzNGOG12WGh4dGRGRlNwTi9XbkYyby8xVTV1S2ZCUisvVVJaSkh4?=
 =?utf-8?B?OXprWm0vb2xiTGxTOW5iWHpkU1Fad0Y2NWZ1a01GVUVnTm1wTjJvTGhxWG1i?=
 =?utf-8?B?V0JVN25ubTJtaDRNRDZDa1h6bDZsNjZaNW1DRFdxZ2Z1RVpFYVEyd2pKWWNJ?=
 =?utf-8?B?NFhVR05BaDBaVmoyeHlJeHo2elJwUUN1MExNeTAwME8reEhHdDhvZnFIMGlp?=
 =?utf-8?B?K3lyNmo0TTlYcHk3OUx3Y2JyT3FMQnUvdW9Fejc1ZGpaUDJNUHR4ejFsN2VO?=
 =?utf-8?B?TDVrZzZBNG9sTnZ1NUFaR0lqcjJsRFlYVTk0dk9jUmlPbkdpSmtKUW9aOHc4?=
 =?utf-8?Q?xbgKou/m7oFiGv4noYSzQD/tff0+omYiurxU+JF?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(1800799021)(376011); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cUYrNHRqMy92VWR5QUlnczhHOW5SVGVHODgzNGxvQmdFNXNuZ3J0ck92bnQr?=
 =?utf-8?B?SEpMOUZOYk91Wi85RHBjN3JuNnJFNTJQYkxHWHV2Y1dvUkYwTHd5ZDJydnpI?=
 =?utf-8?B?MlN0N2hYNlRlekxsTXlOb2JOTXE4WDNDQ21ubk91K2owSHJUU2wyb3ltMllF?=
 =?utf-8?B?dU1SNUxtM00rWlJkYitYMzhDZlRCV3N3V2VaWDhscXYvYnFJZ25iZUJBV0Rx?=
 =?utf-8?B?THFIRElkM0toNWtsVTBlemR5NnI1RSs4ZG1YcXo2U1dJWFgyN0c2dXRPVFE2?=
 =?utf-8?B?aTZJNG54TUptSlBhZExhTWJqeHJKMWcySnNObGhHQWw4UjFnclZOY2MyUWZx?=
 =?utf-8?B?UGxSbUxHRityM05WcS9DYytoRmVsR0NlZ0tzeis1ekhEMHg2SXYzUXFwUUJp?=
 =?utf-8?B?ZmlLeTQzYjRIdi9iUHFubzY1OTlRaXR6M1pHbzRTTjhlZVZ4em5hSlRUT3Mw?=
 =?utf-8?B?cEhyaDkvVlZIcHZxQmQwRmJkL3NmT0VzQ1BEUlBzTys5NCtXdFNMMkdBclRY?=
 =?utf-8?B?NU9yWlB0MCtVYmRSZFJnaCtUL1ZiZDlRdzhVVTJ5Z1BZV081bW5DWDBxZm5p?=
 =?utf-8?B?dWxYNkNhMnlVWUxwSjFndUpNUklnWVlaeWJWTElDdXZOOEhrT3JQMENZc1Y3?=
 =?utf-8?B?UENoeVdzQ21WcUozUUxLYXk3SW1PZFJHYXI2NnU3Y2U4M1kxbU4xVzh1ZFJy?=
 =?utf-8?B?U3JGTjBnQWJVTVYzL29udnNTUkd2SlhzSGhwWXE5RXNNUXBUVlhoV0VkcUFs?=
 =?utf-8?B?VWRnVGxuL0U4MU9rTlVKdUNoendCZy90WWgwdnRBY3NZL3VKSk1UcEJyY1hS?=
 =?utf-8?B?SWp1RjhJMDIvRVM3QXgyWjVONW9UZmVJL0lzV1ZvWVJ3VUhoOUF0WlRDUWJx?=
 =?utf-8?B?NGg5RER6OGpRL29MOXlXSUpPNE1HTHdqTXRCZG5GWkp4YW5IYXhLN3gwQVJL?=
 =?utf-8?B?NDNyUVVFK21UQW1iclhoTnY2dDJZNEo2TXpiRnU1czkzUHNKUmhaRWdOT2JY?=
 =?utf-8?B?My8vR1hScTVYM0NkbUw2Z1dldnlvYWY5UzF3YSswMXhKNml3Q1hXelllU2kx?=
 =?utf-8?B?UnJLWUdkSU1BNG1PZHB0NFBseWQ2Qm9RSXZjSUYrbjlvY0FoR3VtRVRKOUwv?=
 =?utf-8?B?N2dTd0sybzUrMkZsOHY1UnZJRzlhUVhEeUNnYkl2aHR6NHk2Mkt2d0tqeng0?=
 =?utf-8?B?Z0t2bWNHdm4xbHR3V1pKQzI3RFF5Z29MUXNyWTQ5bkhJclRlOVRQa1NMVTdP?=
 =?utf-8?B?ZXphZHI1NTVxcDhneHkxdFkzMkZqTUJFTi9ncnh0Skg5Z00vdXRMRnJuSktp?=
 =?utf-8?B?YmRraGc5KzJuOGFtSjN4MXBrbnQyNXV0eTE0UGVBOUt0ZTU0VEdleTQzYW0w?=
 =?utf-8?B?MzQxOFEyeStXU1V0NHZVZHVRZ1lPOXBZbG92SVdMV0NHRkY3UGwycEE3ZEl4?=
 =?utf-8?B?S0ZHbFFMNkhDdUdWM25tYWRUWE5jY2JPTlVlNzBIY2JydGJzQ1NrYmtBR0dp?=
 =?utf-8?B?cHRMeXFzN1Z3SmhLLzBSWmlRK0ltVzBQSlBBYTZLUTZ1alhWZnlyc0orZmRz?=
 =?utf-8?B?cUNjRElaMUhPeTQ4cWpZNHFXdDQ0VVhLU1RDK3UrR2d5NzEvYzdiKzVvbEky?=
 =?utf-8?B?WC9HYlNEeldHbTVOWjhSZnpWK09KWVd4dVZvVERjM1NxWlhsd09qOURiUm9P?=
 =?utf-8?B?anN6MDBHV0R2ckJWSHBwTjd0c0lHL2V1TERJL3FaVXczTE9WemJqbEtKUXZl?=
 =?utf-8?B?TXNMOHArQVRHSUE0ZXB5WVFRb2s4eVZCZENCZlNnQ3ZyM0hQT2MyUk5qQm1n?=
 =?utf-8?B?dUtyZDhVRExCeHByL0tiR0xSUHNsWkZsZm5WY0RBSTJ6ejMxKzlvV3V4bmpQ?=
 =?utf-8?B?KzlRQnYrdFgwNW5mSyt1NXNMQVFXeFYzQ1R2TUt1clFXNURrWmlLelNmYlhZ?=
 =?utf-8?B?ZWYxYzgwenlDVy9SOEJPakhab1UzTThzSTJaUVNNUTRoQXlGa2lJMUVFZnNu?=
 =?utf-8?B?bUErcGdaM0R6anpKRXNJVHN6RE0rOUFxZDI3bUxnaDVyT09KNWZSMG92MWVH?=
 =?utf-8?B?QlJ0ZC9jVUdKR0tuRXZ4THpQaFcyS3N6MUNwMVY1Slo5VVRNZWJWRzY3NXJa?=
 =?utf-8?B?NW5oalR1N04vcVVzT2xzMktWeTE0QTBROTZmdUFtam9OeHJGeEd3OHJOTlMx?=
 =?utf-8?B?S2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 607f8c73-36d9-4d9c-af74-08dc8cbad5c6
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2024 21:42:06.0050 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +v4/IHFLYyvInUmm3+FH0LZ+rPzUvdtGkjkt5DCQXyVKJPzvdxFdWaJsIXAzXuJ+wu3iXbCeS3uSd/KgdJfqKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7754
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

Defer the ggtt node removal to a thread if runtime_pm is not active.

The ggtt node removal can be called from multiple places, including
places where we cannot protect with outer callers and places we are
within other locks. So, try to grab the runtime reference if the
device is already active, otherwise defer the removal to a separate
thread from where we are sure we can wake the device up.

v2: - use xe wq instead of system wq (Matt and CI)
    - Avoid GFP_KERNEL to be future proof since this removal can
    be called from outside our drivers and we don't want to block
    if atomic is needed. (Brost)
v3: amend forgot chunk declaring xe_device.
v4: Use a xe_ggtt_region to encapsulate the node and remova info,
    wihtout the need for any memory allocation at runtime.
v5: Actually fill the delayed_removal.invalidate (Brost)
v6: - Ensure that ggtt_region is not freed before work finishes (Auld)
    - Own wq to ensures that the queued works are flushed before
      ggtt_fini (Brost)
v7: also free ggtt_region on early !bound return (Auld)
v8: Address the null deref (CI)

Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Paulo Zanoni <paulo.r.zanoni@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c |  11 +-
 drivers/gpu/drm/xe/xe_bo.c             |   2 +-
 drivers/gpu/drm/xe/xe_bo.h             |   9 +-
 drivers/gpu/drm/xe/xe_bo_types.h       |   6 +-
 drivers/gpu/drm/xe/xe_ggtt.c           | 135 ++++++++++++++++++-------
 drivers/gpu/drm/xe/xe_ggtt.h           |   1 -
 drivers/gpu/drm/xe/xe_ggtt_types.h     |  23 +++++
 7 files changed, 140 insertions(+), 47 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index a2f417209124..5361e2eea78d 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -153,7 +153,7 @@ static int __xe_pin_fb_vma_dpt(const struct intel_framebuffer *fb,
 	}
 
 	vma->dpt = dpt;
-	vma->node = dpt->ggtt_node;
+	vma->node = dpt->ggtt_region->node;
 	return 0;
 }
 
@@ -203,8 +203,8 @@ static int __xe_pin_fb_vma_ggtt(const struct intel_framebuffer *fb,
 	if (xe_bo_is_vram(bo) && ggtt->flags & XE_GGTT_FLAGS_64K)
 		align = max_t(u32, align, SZ_64K);
 
-	if (bo->ggtt_node.size && view->type == I915_GTT_VIEW_NORMAL) {
-		vma->node = bo->ggtt_node;
+	if (bo->ggtt_region && view->type == I915_GTT_VIEW_NORMAL) {
+		vma->node = bo->ggtt_region->node;
 	} else if (view->type == I915_GTT_VIEW_NORMAL) {
 		u32 x, size = bo->ttm.base.size;
 
@@ -322,8 +322,9 @@ static void __xe_unpin_fb_vma(struct i915_vma *vma)
 
 	if (vma->dpt)
 		xe_bo_unpin_map_no_vm(vma->dpt);
-	else if (!drm_mm_node_allocated(&vma->bo->ggtt_node) ||
-		 vma->bo->ggtt_node.start != vma->node.start)
+	else if (vma->bo->ggtt_region &&
+		 (!drm_mm_node_allocated(&vma->bo->ggtt_region->node) ||
+		  vma->bo->ggtt_region->node.start != vma->node.start))
 		xe_ggtt_remove_node(ggtt, &vma->node, false);
 
 	ttm_bo_reserve(&vma->bo->ttm, false, false, NULL);
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 74294f1b05bc..95ed2687c5e2 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1072,7 +1072,7 @@ static void xe_ttm_bo_destroy(struct ttm_buffer_object *ttm_bo)
 
 	xe_assert(xe, list_empty(&ttm_bo->base.gpuva.list));
 
-	if (bo->ggtt_node.size)
+	if (bo->ggtt_region)
 		xe_ggtt_remove_bo(bo->tile->mem.ggtt, bo);
 
 #ifdef CONFIG_PROC_FS
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 6de894c728f5..998ddab3ab6d 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -194,9 +194,12 @@ xe_bo_main_addr(struct xe_bo *bo, size_t page_size)
 static inline u32
 xe_bo_ggtt_addr(struct xe_bo *bo)
 {
-	XE_WARN_ON(bo->ggtt_node.size > bo->size);
-	XE_WARN_ON(bo->ggtt_node.start + bo->ggtt_node.size > (1ull << 32));
-	return bo->ggtt_node.start;
+	if (XE_WARN_ON(!bo->ggtt_region))
+		return 0;
+
+	XE_WARN_ON(bo->ggtt_region->node.size > bo->size);
+	XE_WARN_ON(bo->ggtt_region->node.start + bo->ggtt_region->node.size > (1ull << 32));
+	return bo->ggtt_region->node.start;
 }
 
 int xe_bo_vmap(struct xe_bo *bo);
diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
index 86422e113d39..f45b1c4bbb6d 100644
--- a/drivers/gpu/drm/xe/xe_bo_types.h
+++ b/drivers/gpu/drm/xe/xe_bo_types.h
@@ -14,6 +14,8 @@
 #include <drm/ttm/ttm_execbuf_util.h>
 #include <drm/ttm/ttm_placement.h>
 
+#include "xe_ggtt_types.h"
+
 struct xe_device;
 struct xe_vm;
 
@@ -38,8 +40,8 @@ struct xe_bo {
 	struct ttm_place placements[XE_BO_MAX_PLACEMENTS];
 	/** @placement: current placement for this BO */
 	struct ttm_placement placement;
-	/** @ggtt_node: GGTT node if this BO is mapped in the GGTT */
-	struct drm_mm_node ggtt_node;
+	/** @ggtt_region: GGTT region node if this BO is mapped in the GGTT */
+	struct xe_ggtt_region *ggtt_region;
 	/** @vmap: iosys map of this buffer */
 	struct iosys_map vmap;
 	/** @ttm_kmap: TTM bo kmap object for internal use only. Keep off. */
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 8ff91fd1b7c8..b80fb2043ffc 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -101,6 +101,7 @@ static void ggtt_fini_early(struct drm_device *drm, void *arg)
 {
 	struct xe_ggtt *ggtt = arg;
 
+	destroy_workqueue(ggtt->wq);
 	mutex_destroy(&ggtt->lock);
 	drm_mm_takedown(&ggtt->mm);
 }
@@ -191,6 +192,8 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 	else
 		ggtt->pt_ops = &xelp_pt_ops;
 
+	ggtt->wq = alloc_workqueue("xe-ggtt-wq", 0, 0);
+
 	drm_mm_init(&ggtt->mm, xe_wopcm_size(xe),
 		    ggtt->size - xe_wopcm_size(xe));
 	mutex_init(&ggtt->lock);
@@ -389,27 +392,112 @@ void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 {
 	u16 cache_mode = bo->flags & XE_BO_FLAG_NEEDS_UC ? XE_CACHE_NONE : XE_CACHE_WB;
 	u16 pat_index = tile_to_xe(ggtt->tile)->pat.idx[cache_mode];
-	u64 start = bo->ggtt_node.start;
+	u64 start;
 	u64 offset, pte;
 
+	if (XE_WARN_ON(!bo->ggtt_region))
+		return;
+
+	start = bo->ggtt_region->node.start;
+
 	for (offset = 0; offset < bo->size; offset += XE_PAGE_SIZE) {
 		pte = ggtt->pt_ops->pte_encode_bo(bo, offset, pat_index);
 		xe_ggtt_set_pte(ggtt, start + offset, pte);
 	}
 }
 
+static void ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
+			     bool invalidate)
+{
+	struct xe_device *xe = tile_to_xe(ggtt->tile);
+	struct xe_ggtt_region *ggtt_region = container_of(node,
+							  typeof(*ggtt_region),
+							  node);
+	bool bound;
+	int idx;
+
+	bound = drm_dev_enter(&xe->drm, &idx);
+
+	mutex_lock(&ggtt->lock);
+	if (bound)
+		xe_ggtt_clear(ggtt, node->start, node->size);
+	drm_mm_remove_node(node);
+	node->size = 0;
+	mutex_unlock(&ggtt->lock);
+
+	if (!bound)
+		goto out;
+
+	if (invalidate)
+		xe_ggtt_invalidate(ggtt);
+
+	drm_dev_exit(idx);
+out:
+	kfree(ggtt_region);
+}
+
+static void ggtt_remove_node_work_func(struct work_struct *work)
+{
+	struct xe_ggtt_region *ggtt_region = container_of(work,
+							  typeof(*ggtt_region),
+							  delayed_removal.work);
+	struct xe_device *xe = tile_to_xe(ggtt_region->ggtt->tile);
+
+	xe_pm_runtime_get(xe);
+	ggtt_remove_node(ggtt_region->ggtt, &ggtt_region->node,
+			 ggtt_region->delayed_removal.invalidate);
+	xe_pm_runtime_put(xe);
+}
+
+static void ggtt_queue_remove_node(struct drm_mm_node *node, bool invalidate)
+{
+	struct xe_ggtt_region *ggtt_region = container_of(node,
+							  typeof(*ggtt_region),
+							  node);
+
+	queue_work(ggtt_region->ggtt->wq, &ggtt_region->delayed_removal.work);
+}
+
+void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
+			 bool invalidate)
+{
+	struct xe_device *xe = tile_to_xe(ggtt->tile);
+
+	if (xe_pm_runtime_get_if_active(xe)) {
+		ggtt_remove_node(ggtt, node, invalidate);
+		xe_pm_runtime_put(xe);
+	} else {
+		ggtt_queue_remove_node(node, invalidate);
+	}
+}
+
+static struct xe_ggtt_region *ggtt_region_init(struct xe_ggtt *ggtt)
+{
+	struct xe_ggtt_region *ggtt_region = kzalloc(sizeof(*ggtt_region),
+						     GFP_KERNEL);
+
+	if (!ggtt_region)
+		return ERR_PTR(-ENOMEM);
+
+	INIT_WORK(&ggtt_region->delayed_removal.work, ggtt_remove_node_work_func);
+	ggtt_region->ggtt = ggtt;
+
+	return ggtt_region;
+}
+
 static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 				  u64 start, u64 end)
 {
 	int err;
 	u64 alignment = XE_PAGE_SIZE;
+	struct xe_ggtt_region *ggtt_region;
 
 	if (xe_bo_is_vram(bo) && ggtt->flags & XE_GGTT_FLAGS_64K)
 		alignment = SZ_64K;
 
-	if (XE_WARN_ON(bo->ggtt_node.size)) {
+	if (XE_WARN_ON(bo->ggtt_region)) {
 		/* Someone's already inserted this BO in the GGTT */
-		xe_tile_assert(ggtt->tile, bo->ggtt_node.size == bo->size);
+		xe_tile_assert(ggtt->tile, bo->ggtt_region->node.size == bo->size);
 		return 0;
 	}
 
@@ -417,9 +505,14 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 	if (err)
 		return err;
 
+	ggtt_region = ggtt_region_init(ggtt);
+	if (IS_ERR(ggtt_region))
+		return PTR_ERR(ggtt_region);
+	bo->ggtt_region = ggtt_region;
+
 	xe_pm_runtime_get_noresume(tile_to_xe(ggtt->tile));
 	mutex_lock(&ggtt->lock);
-	err = drm_mm_insert_node_in_range(&ggtt->mm, &bo->ggtt_node, bo->size,
+	err = drm_mm_insert_node_in_range(&ggtt->mm, &bo->ggtt_region->node, bo->size,
 					  alignment, 0, start, end, 0);
 	if (!err)
 		xe_ggtt_map_bo(ggtt, bo);
@@ -443,43 +536,15 @@ int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 	return __xe_ggtt_insert_bo_at(ggtt, bo, 0, U64_MAX);
 }
 
-void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
-			 bool invalidate)
-{
-	struct xe_device *xe = tile_to_xe(ggtt->tile);
-	bool bound;
-	int idx;
-
-	bound = drm_dev_enter(&xe->drm, &idx);
-	if (bound)
-		xe_pm_runtime_get_noresume(xe);
-
-	mutex_lock(&ggtt->lock);
-	if (bound)
-		xe_ggtt_clear(ggtt, node->start, node->size);
-	drm_mm_remove_node(node);
-	node->size = 0;
-	mutex_unlock(&ggtt->lock);
-
-	if (!bound)
-		return;
-
-	if (invalidate)
-		xe_ggtt_invalidate(ggtt);
-
-	xe_pm_runtime_put(xe);
-	drm_dev_exit(idx);
-}
-
 void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 {
-	if (XE_WARN_ON(!bo->ggtt_node.size))
+	if (XE_WARN_ON(!bo->ggtt_region))
 		return;
 
 	/* This BO is not currently in the GGTT */
-	xe_tile_assert(ggtt->tile, bo->ggtt_node.size == bo->size);
+	xe_tile_assert(ggtt->tile, bo->ggtt_region->node.size == bo->size);
 
-	xe_ggtt_remove_node(ggtt, &bo->ggtt_node,
+	xe_ggtt_remove_node(ggtt, &bo->ggtt_region->node,
 			    bo->flags & XE_BO_FLAG_GGTT_INVALIDATE);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
index 4a41a1762358..75511b5f43eb 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.h
+++ b/drivers/gpu/drm/xe/xe_ggtt.h
@@ -30,7 +30,6 @@ int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo);
 int xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 			 u64 start, u64 end);
 void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo);
-
 int xe_ggtt_dump(struct xe_ggtt *ggtt, struct drm_printer *p);
 
 #ifdef CONFIG_PCI_IOV
diff --git a/drivers/gpu/drm/xe/xe_ggtt_types.h b/drivers/gpu/drm/xe/xe_ggtt_types.h
index d8c584d9a8c3..202d7f3085ba 100644
--- a/drivers/gpu/drm/xe/xe_ggtt_types.h
+++ b/drivers/gpu/drm/xe/xe_ggtt_types.h
@@ -34,6 +34,29 @@ struct xe_ggtt {
 	const struct xe_ggtt_pt_ops *pt_ops;
 
 	struct drm_mm mm;
+	/** @wq: Dedicated unordered work queue to process node removals */
+	struct workqueue_struct *wq;
+};
+
+/**
+ * struct xe_ggtt_region - GGTT region node
+ * It needs to be initialized before the drm_mm_node insertion in the GGTT.
+ */
+struct xe_ggtt_region {
+	/** @ggtt: Back pointer to xe_ggtt where this region will be inserted at */
+	struct xe_ggtt *ggtt;
+	/** @node: The drm_mm_node itself */
+	struct drm_mm_node node;
+	/**
+	 * @delayed_removal: Information for removal through work thread when
+	 * device runtime_pm is suspended
+	 */
+	struct {
+		/** @delayed_removal.work: The work struct for the delayed removal */
+		struct work_struct work;
+		/** @delayed_removal.invalidate: If it needs invalidation upon removal */
+		bool invalidate;
+	} delayed_removal;
 };
 
 #endif
-- 
2.45.1

