Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CE60CD4F26
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jun 2026 19:12:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DA9210E11B;
	Fri, 19 Jun 2026 19:12:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L2MWR21o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DF5610E104
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Jun 2026 19:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781896330; x=1813432330;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=qndTeTCrWiieTXD8Gljuw5345IMd2FJ523Q+Y/soyAk=;
 b=L2MWR21oxlUcToAjCEw76ncz0y/3Gq7fnGdVt05QKTPs0KurV5+Rmnrr
 +nhpqUVkkI3qgKjhVtO5WTlvHtzWngDg8QtaLNZ5AQbFUcxZjNVtdyMRe
 h+BIzO/QUWnwlON1CkRsJ5WxDK7rSB2zNAxsf4fc9Rj635cczBgCshblS
 WcCe2igFSScHSqyPBvQNqAORsnmdD6mAcDv5r0jI0Mj8nsaeeR9F61Ybl
 vExf258EBl0JTTPHwOlf2LPHgcGJZenLfLrdbJLtsoYBPbPPUHiiEWEwO
 OiJIBJvYbEg4/y9aKYPlSkmfW1DKui7SOSvFGK+2lj/gM7qHlyFafjJOQ g==;
X-CSE-ConnectionGUID: TyRef8nCQIeR2xaLw12a/g==
X-CSE-MsgGUID: F6GnJUxVReqFdUu01CbBZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11822"; a="82744032"
X-IronPort-AV: E=Sophos;i="6.24,213,1774335600"; d="scan'208";a="82744032"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2026 12:12:10 -0700
X-CSE-ConnectionGUID: Bx3xQqZ1SU+sc8eyAwrk/g==
X-CSE-MsgGUID: P3BwHJrwQtOm37cQXtIHPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,213,1774335600"; d="scan'208";a="247553302"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2026 12:12:10 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 19 Jun 2026 12:12:09 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 19 Jun 2026 12:12:09 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.22)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 19 Jun 2026 12:12:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lnoztBytCKORKSOYKJjmh4Wkwi9fOpnQY25U6cSYrk2sr0m9/NjIYhDDYsJT8YhoSsZzqlbr2vW4r1r+roEpx3Heb4QHIvesd4DSUusjDbwBWJTqcf2KFpUnRfG1tHkxDg/4TiV1u8VAETeh1W0XTvahpiR3hjMpTkdwpNJ5K8+0R3m38fhf5N3nvpTBJixk9lXsJDXMiOa/pRV1yXn8264TjOoEJb7+au19SrIDfzM/5L0BkawgwRyM6Dlp0uNPY2NFLW0pCophlLKv1h8Y9Qo5yBCPO7ReETAZQOzcKxzE9n6dKywxMiggKWM+32hd2uQPnQ1AggA6LCyPyjcjAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G7o6WWcTwhzUyx1BnlAvDAnrbqg6+m0Uy5B97mtdoZw=;
 b=Lquro+b3jlXNMxEa8euxkipXdEvZGKiu9tpSwJtbXnA54gNyEMGnMHcLjQccYJBO+tByIz5LbCZ4kZ2bOlniRhuj4Vq/S8vyqnLJcrnbUkM8FNORhkOo4YHZMj4oGNuwS0CAVCYkzxhBd6LvuwBlsBgIk/GY4jU5n/kEecE6CJhuCTY9dnLbMNF2TOKW5oX7WCexvNsji+bYg+vp2OMn+3tYonIydzvZKpAutOeMx2smpcnEYf5ez+PwI/PN4zggPsmQWSKf5GgwEGmOWPL/I9ubTodvdpwCdeTaztDVbRPLG+UlPOO4jILJSafHZk54JOYqqgtf/NBOgckbxtfW2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by SJ0PR11MB5867.namprd11.prod.outlook.com (2603:10b6:a03:42a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Fri, 19 Jun
 2026 19:12:07 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%6]) with mapi id 15.21.0113.015; Fri, 19 Jun 2026
 19:12:07 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>
Subject: [PATCH v1 5/7] drm/xe/guc: Add start offset support to GuC ID manager
Date: Fri, 19 Jun 2026 21:11:05 +0200
Message-ID: <20260619191107.2628783-6-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260619191107.2628783-1-piotr.piorkowski@intel.com>
References: <20260619191107.2628783-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU7PR01CA0025.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50e::15) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|SJ0PR11MB5867:EE_
X-MS-Office365-Filtering-Correlation-Id: f6f9de88-cda6-47be-c2bd-08dece36a7a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 9KwyQgoX4ypcKHEJ8f6YjDC/9KZrLh+LCixEiOVGa/KSahX2W+YffqVtGB3gkhGPdcP+u9NU+Slb9dL5SItvQVsLdaU44zEN27apuuN4xPogGvkaRckX9hX/myNkbRBqGd+eDzTjrrGY+5ht5cAKiuah2h1RD23M4t4TklO/jrPh+Ks6+a6gy1xiSRREOGsAiIQgjxgtc30nh/rkswfgOxUoVWT8zirnODy3lvZDGhTkYcfl72MJISS74ZO9L8CPuSEkgBfYb9ad1QVmk6P8aNnbUrKakR4Pflxp+NqaVSYFFUL8nWW9HUaVieOceh+aVpkUIA7RHS39sW83L49mboMd3B4uYhytw5YPn4rBFYsu8mBd1yL85+dlYf/W0iFI0Zc0sY3twK4V8fuWJYKSL4wjIzswdosg1qIZ18GGrtEzTQirnWgaOmgqtFxMetpQGKCIL0yGPVUmgON1t6CSEwBahuAReGLD4OhdcLwxax4ZY6n8h0J15VGt5KEsXPep8BBghj7QiMQmjE4WuUYyMrkCzqrmU+oGG+OSBi6+DzJkFzbYLbQuJQkkFw6x7Sg6VaAb+Mm/qFz1nh96ATL2eY2OpqhOpgdMmladL1jxwYl/QOOocyy3+iOu7jDkJnDYVk6kvGBZ7SSstN654F3+b23eVDzhn5JVmFx3jsqIqPA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(56012099006)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SXNVeUVmYWxpVDNsbFZ4cjRzM2lobG9XNS9tZStXaW9qZUtnQmFDVDczSjMv?=
 =?utf-8?B?c2plTjNnU2VlTnFsMWNVWHNEUkJUdHc5VlNCM056N2lDNyt2c2RZZGZQejRx?=
 =?utf-8?B?SFM3dUg1KzlLOW1xcUhsN0cwQXNTSU9LYmdMU2gxNFpxUlhoMHh0WG5lbDVF?=
 =?utf-8?B?MDZ2MDRBMDBkNmpLa1V6R2RCTVFhbEZ5TCtTSGE1ZXp2aUpFbUNqMHJiR21t?=
 =?utf-8?B?OUt2czdjakVQeVhYUXcvSXI2Nmd2TC9xenV0MjZkTkpwWWJFVWcxaVE2VVQv?=
 =?utf-8?B?dHFsL2syN0MxaUN2MWtwa3hmOVNSV1ZlQ0lzU1JVb0RHT3hRL2hRTG9wckNp?=
 =?utf-8?B?TEVHUGhoSkIrcHVxYStJN3BDaVI5UjM5d1dzSHE0WWNYR1I2ajhBUVJBL2M0?=
 =?utf-8?B?ZlR3MWFBdkRzUjNrbVdRR25ZaWt2RDZJaDFlK3pSN2VVYzBGbi94NnlHZm1N?=
 =?utf-8?B?cWw1VzlRdTdKbFowczA3ZXN3Nm5qU0paUnY1OVVOWlRnRitjK2JJQjF5bFBj?=
 =?utf-8?B?cXRPb0dLWWg1bnVPY2lrNnArWGxXN3NvL00rM3RJdHlRandZT3J2Nm5HUXNM?=
 =?utf-8?B?cHpYaUxoSGhIQlJpdEhCSWRxT1ZBUmovQkFzaCtKZnBhcE1QbThCTXUvOVRH?=
 =?utf-8?B?eUphRC9HendpR1g4NDlIbjRyVktIZU1YbElmVHJkdFk2dGs2dnFRditIc0hF?=
 =?utf-8?B?ZkVGOWlXYkJadDhDcFUvaHBMejF0clhjMW5EQzlLdFdaVnBmSUdMWkdkdUFR?=
 =?utf-8?B?RnpSS21uL1RwSWNYWjlzY3MvVW9ET2MyVW1DVG9DVW1BeUZpczdZd0oxYWFL?=
 =?utf-8?B?Z0RocFBSelJVb0pRdXBSTzhoMzNMUjJsRlVUazdSOCtPRDJzUW1qSXJKQTg5?=
 =?utf-8?B?Nnc4Y1ZONTZocGlZeWFmN0Q3ZDZ5QnJCYmdhd25hNURzMjV5Tm0xSVpmb1lV?=
 =?utf-8?B?ZUtjUll6THJGSEtKanR3MDBZNDUyOUtRaWxyL2hxeFhBc2VySW55dWZUZDli?=
 =?utf-8?B?ZXBxVXlpd0haeTlOWCtMZy83ZzRMRXpka25lVXlHNi92WVN5d21PTWlyTGdB?=
 =?utf-8?B?NURyZUt0TktURHkrQXpqcXk0UXE2cVZUV0hoTmd5Sk4wRytTcE5NNFY1RnAr?=
 =?utf-8?B?V2RBdzJHdWloVlpyb3dhNlFxdDd5R2xEdmx5Rk9HRStReXFiVGNRWnpuL1Vv?=
 =?utf-8?B?R1JxWko1b0E0b1ppUTQ0QUFOczk5TjgzZEFYNi9lUjZtTDQ4VlY0S0d3NUpv?=
 =?utf-8?B?NnA2Z3FlSTFMM1VCS0I4azRVbnkwZXUrellxbXlvWlBZSEJIcXZVUWVrYjhn?=
 =?utf-8?B?ZU5UeHhvVmtmZ0hyektDR0RrRzJpVzhFNVdMRGlEZXoxbkZYVUhjOCtsSXRm?=
 =?utf-8?B?WDZjT1RJaG5sNGtnQXhMUHpKS3J3eThxdDRqbzE2bjkzVUxrQlZxT0xSbjNY?=
 =?utf-8?B?ZnF4cUphODRaQ3JPenVkOHFiRzBNYVRneWlKd1F3RDFuUzBZTlA5NTcybW1o?=
 =?utf-8?B?aGJnSFVuN1Q2ZmUxZnNMNnlJQmVyNkNOeWZ3WE9LM2VyUlJockVudDdoeUgv?=
 =?utf-8?B?Q0QrdWc2WmRER2h2K1BGZXUrdlpvakN4ZjZPUHVsWTVYM1YzKytlRVR3RElw?=
 =?utf-8?B?d1Y2Zit0TW1kQVBNWjFLZ2RSV1BuSFBnZkJYOWs5amJnSUIrMHEvR1BIaEhQ?=
 =?utf-8?B?SVN4TkhpeW1vVGtrTzhEN3JZMzRMMDhOY1k2cnNwV0hiNE4weTF6UmdHR3dM?=
 =?utf-8?B?YThHNmYvVGhUam5ETmNtTENZMkFyOUkrcEdCRUJzRW1EWTVCV2VWMk9tZ09h?=
 =?utf-8?B?MkJRcnp1cGZDc2JEZllOSzRQUHFCWVNOeEh5OU92Zmt0T0xPMUVVSHJiN0NL?=
 =?utf-8?B?U0E0YURvSWlRZ2ZYODNnYkJoT1pLeTFoYWlGdHFXeXN3QWRmWkV4RTR3WXZH?=
 =?utf-8?B?dGptU2UrdllYT1ZzM0k2ODN6VUlTTjhHUWlDQ3hBM0d0TTN1KzA2VnlwZ3Ru?=
 =?utf-8?B?cU5kUG5WZFJxVUZGRStYeHJiRmJXK2VBdC9rY1k4ckZ5Ty9rWVFBdmluVmp4?=
 =?utf-8?B?bHBBbHRkUHRWc1hTcitjbWNFKyt3WCtjTzF0S1IrSjViSC9vVmJvOG1GZ2xL?=
 =?utf-8?B?YUJXQmYrNkJlQVVnVmhnR1cyS3BNYWZ2QUNxZUZmZFhuUUxzN09WL2p6WGVC?=
 =?utf-8?B?NElpNUdNOWVkTzR5Q1FnUlhNS1BDUXFnQjFyT1dHNjREZFY5eU5Sa0p2N1hX?=
 =?utf-8?B?MTJ5MWJvZzBZRENENi83dmlxZmk5ck5yTWI0dWNUbWpnajZKbnpJcHhaczAr?=
 =?utf-8?B?NE5HRVhxV0hZM2hUMUZweW5wdlZiM2JoamRLM29CT3ExZjZZZy9FN1cxNVJ0?=
 =?utf-8?Q?g+gAJsmaPgGnMzNs=3D?=
X-Exchange-RoutingPolicyChecked: rJENwDtRV2DVVBPBkG+tBUduy6hHUpkCBkMS8jA2r7w5m52977lz0I18fwY1BHxmDqiyi3zVGUaxHCv+aYbk3plDkQ55OiAFu50gqtMngDgVhos+1wuqHbkZCP0HYYqhAWpEOKWfJvUWIyKUkRp7J/NRrqGye+G1pgXiCcWyBI935uUDqTEAj3jChTyTpv+jR4W0/YtSqVyIW4tO5irhKlEFk2uD7ooNSgyTKH2QB/TiCUBo6p/WKg3wjvUcxCrt6PBRhQIcxmP2ucAbeCrY6wFw+eIUzulGeqTI5V8HGvlDv/IKsaA/yiY6xXmtHQ1L+KRJeKTgNzRR7LbQ+I3Jqg==
X-MS-Exchange-CrossTenant-Network-Message-Id: f6f9de88-cda6-47be-c2bd-08dece36a7a9
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 19:12:07.0845 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Y8dg7IOEFY6OaW77bqQmOgUiBnjGVsdtxj4YZ7SQPy00eZ9qLQZLQfHoHmQs/1k1Cxemt5g3p6TwR7/+n437hbJTUYCi/JJj5GbnOlSHB8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5867
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

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

Add support for managing context IDs starting from a given start ID.
Introduce a start field to the ID manager and update allocation
and release paths to operate on IDs in the range
[start, start + limit).
This allows using subranges of context IDs instead of always
starting from 0.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c | 41 ++++++++++++---
 drivers/gpu/drm/xe/xe_guc_id_mgr.c            | 50 +++++++++++++------
 drivers/gpu/drm/xe/xe_guc_id_mgr.h            |  2 +-
 drivers/gpu/drm/xe/xe_guc_submit.c            |  2 +-
 drivers/gpu/drm/xe/xe_guc_types.h             |  2 +
 5 files changed, 74 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c b/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
index 4e4b1c890000..cf533e7b1961 100644
--- a/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
@@ -28,9 +28,9 @@ static void bad_init(struct kunit *test)
 {
 	struct xe_guc_id_mgr *idm = test->priv;
 
-	KUNIT_EXPECT_EQ(test, -EINVAL, xe_guc_id_mgr_init(idm, test_idm_to_guc(idm), NULL, 0));
+	KUNIT_EXPECT_EQ(test, -EINVAL, xe_guc_id_mgr_init(idm, test_idm_to_guc(idm), NULL, 0, 0));
 	KUNIT_EXPECT_EQ(test, -ERANGE,
-			xe_guc_id_mgr_init(idm, test_idm_to_guc(idm), NULL, GUC_ID_MAX + 1));
+			xe_guc_id_mgr_init(idm, test_idm_to_guc(idm), NULL, 0, GUC_ID_MAX + 1));
 }
 
 static void no_init(struct kunit *test)
@@ -51,7 +51,7 @@ static void init_fini(struct kunit *test)
 {
 	struct xe_guc_id_mgr *idm = test->priv;
 
-	KUNIT_ASSERT_EQ(test, 0, xe_guc_id_mgr_init(idm, test_idm_to_guc(idm), NULL, -1));
+	KUNIT_ASSERT_EQ(test, 0, xe_guc_id_mgr_init(idm, test_idm_to_guc(idm), NULL, 0, -1));
 	KUNIT_EXPECT_NOT_NULL(test, idm->bitmap);
 	KUNIT_EXPECT_EQ(test, idm->total, GUC_ID_MAX);
 	__fini_idm(NULL, idm);
@@ -64,7 +64,7 @@ static void check_used(struct kunit *test)
 	struct xe_guc_id_mgr *idm = test->priv;
 	unsigned int n;
 
-	KUNIT_ASSERT_EQ(test, 0, xe_guc_id_mgr_init(idm, test_idm_to_guc(idm), NULL, 2));
+	KUNIT_ASSERT_EQ(test, 0, xe_guc_id_mgr_init(idm, test_idm_to_guc(idm), NULL, 0, 2));
 
 	mutex_lock(idm_mutex(idm));
 
@@ -86,7 +86,7 @@ static void check_quota(struct kunit *test)
 	struct xe_guc_id_mgr *idm = test->priv;
 	unsigned int n;
 
-	KUNIT_ASSERT_EQ(test, 0, xe_guc_id_mgr_init(idm, test_idm_to_guc(idm), NULL, 2));
+	KUNIT_ASSERT_EQ(test, 0, xe_guc_id_mgr_init(idm, test_idm_to_guc(idm), NULL, 0, 2));
 
 	mutex_lock(idm_mutex(idm));
 
@@ -105,12 +105,40 @@ static void check_quota(struct kunit *test)
 	mutex_unlock(idm_mutex(idm));
 }
 
+static void check_start_offset(struct kunit *test)
+{
+	struct xe_guc_id_mgr *idm = test->priv;
+	const unsigned int start = 16;
+	const unsigned int limit = 4;
+	int id;
+
+	KUNIT_ASSERT_EQ(test, 0,
+			xe_guc_id_mgr_init(idm, test_idm_to_guc(idm), NULL, start, limit));
+	KUNIT_EXPECT_EQ(test, idm->start, start);
+	KUNIT_EXPECT_EQ(test, idm->total, limit);
+
+	mutex_lock(idm_mutex(idm));
+	id = xe_guc_id_mgr_reserve_locked(idm, 1);
+	mutex_unlock(idm_mutex(idm));
+	KUNIT_ASSERT_EQ(test, id, start);
+
+	mutex_lock(idm_mutex(idm));
+	xe_guc_id_mgr_release_locked(idm, start, 1);
+	mutex_unlock(idm_mutex(idm));
+
+	KUNIT_ASSERT_EQ(test, xe_guc_id_mgr_reserve(idm, 2, 0), start);
+	KUNIT_ASSERT_EQ(test, xe_guc_id_mgr_reserve(idm, 1, 1), start + limit - 1);
+
+	xe_guc_id_mgr_release(idm, start, 2);
+	xe_guc_id_mgr_release(idm, start + limit - 1, 1);
+}
+
 static void check_all(struct kunit *test)
 {
 	struct xe_guc_id_mgr *idm = test->priv;
 	unsigned int n;
 
-	KUNIT_ASSERT_EQ(test, 0, xe_guc_id_mgr_init(idm, test_idm_to_guc(idm), NULL, -1));
+	KUNIT_ASSERT_EQ(test, 0, xe_guc_id_mgr_init(idm, test_idm_to_guc(idm), NULL, 0, -1));
 
 	mutex_lock(idm_mutex(idm));
 
@@ -129,6 +157,7 @@ static struct kunit_case guc_id_mgr_test_cases[] = {
 	KUNIT_CASE(init_fini),
 	KUNIT_CASE(check_used),
 	KUNIT_CASE(check_quota),
+	KUNIT_CASE(check_start_offset),
 	KUNIT_CASE_SLOW(check_all),
 	{}
 };
diff --git a/drivers/gpu/drm/xe/xe_guc_id_mgr.c b/drivers/gpu/drm/xe/xe_guc_id_mgr.c
index f1e69650fb7e..8eaf2ca46f37 100644
--- a/drivers/gpu/drm/xe/xe_guc_id_mgr.c
+++ b/drivers/gpu/drm/xe/xe_guc_id_mgr.c
@@ -5,6 +5,7 @@
 
 #include <linux/bitmap.h>
 #include <linux/mutex.h>
+#include <linux/overflow.h>
 
 #include <drm/drm_managed.h>
 
@@ -54,6 +55,7 @@ static void __fini_idm(struct drm_device *drm, void *arg)
 
 	bitmap_free(idm->bitmap);
 	idm->bitmap = NULL;
+	idm->start = 0;
 	idm->total = 0;
 	idm->used = 0;
 
@@ -65,10 +67,13 @@ static void __fini_idm(struct drm_device *drm, void *arg)
  * @idm: the &xe_guc_id_mgr to initialize
  * @guc: the owning &xe_guc
  * @lock: mutex protecting this manager, or NULL to use an internal lock
- * @limit: number of IDs to manage
+ * @start: first GuC context ID to manage
+ * @limit: number of IDs to manage; the manager handles the range
+ *         [@start, @start + @limit)
  *
  * The bare-metal or PF driver can pass ~0 as &limit to indicate that all
- * context IDs supported by the GuC firmware are available for use.
+ * context IDs supported by the GuC firmware starting from @start are
+ * available for use.
  *
  * Only VF drivers will have to provide explicit number of context IDs
  * that they can use.
@@ -76,7 +81,7 @@ static void __fini_idm(struct drm_device *drm, void *arg)
  * Return: 0 on success or a negative error code on failure.
  */
 int xe_guc_id_mgr_init(struct xe_guc_id_mgr *idm, struct xe_guc *guc,
-		       struct mutex *lock, unsigned int limit)
+		       struct mutex *lock, unsigned int start, unsigned int limit)
 {
 	int ret;
 
@@ -92,14 +97,21 @@ int xe_guc_id_mgr_init(struct xe_guc_id_mgr *idm, struct xe_guc *guc,
 	idm_assert(idm, !idm->bitmap);
 	idm_assert(idm, !idm->total);
 	idm_assert(idm, !idm->used);
+	idm_assert(idm, idm->start < GUC_ID_MAX);
 
-	if (limit == ~0)
-		limit = GUC_ID_MAX;
-	else if (limit > GUC_ID_MAX)
-		return -ERANGE;
-	else if (!limit)
+	if (limit == ~0) {
+		limit = GUC_ID_MAX - start;
+	} else {
+		unsigned int end;
+
+		if (check_add_overflow(start, limit, &end) || end > GUC_ID_MAX)
+			return -ERANGE;
+	}
+	if (!limit)
 		return -EINVAL;
 
+	idm->start = start;
+
 	idm->bitmap = bitmap_zalloc(limit, GFP_KERNEL);
 	if (!idm->bitmap)
 		return -ENOMEM;
@@ -176,25 +188,31 @@ static int idm_reserve_chunk_locked(struct xe_guc_id_mgr *idm,
 	bitmap_set(idm->bitmap, id, count);
 	idm->used += count;
 
-	return id;
+	return id + idm->start;
 }
 
 static void idm_release_chunk_locked(struct xe_guc_id_mgr *idm,
-				     unsigned int start, unsigned int count)
+				     unsigned int first_id, unsigned int count)
 {
+	unsigned int bitmap_pos;
+
+	if (WARN_ON(first_id < idm->start))
+		return;
+	bitmap_pos = first_id - idm->start;
+
 	idm_assert(idm, count);
 	idm_assert(idm, count <= idm->used);
-	idm_assert(idm, start < idm->total);
-	idm_assert(idm, start + count - 1 < idm->total);
+	idm_assert(idm, bitmap_pos < idm->total);
+	idm_assert(idm, bitmap_pos + count - 1 < idm->total);
 	lockdep_assert_held(idm_mutex(idm));
 
 	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
 		unsigned int n;
 
 		for (n = 0; n < count; n++)
-			idm_assert(idm, test_bit(start + n, idm->bitmap));
+			idm_assert(idm, test_bit(bitmap_pos + n, idm->bitmap));
 	}
-	bitmap_clear(idm->bitmap, start, count);
+	bitmap_clear(idm->bitmap, bitmap_pos, count);
 	idm->used -= count;
 }
 
@@ -276,13 +294,15 @@ static void idm_print_locked(struct xe_guc_id_mgr *idm, struct drm_printer *p, i
 
 	lockdep_assert_held(idm_mutex(idm));
 
+	drm_printf_indent(p, indent, "start %u\n", idm->start);
 	drm_printf_indent(p, indent, "total %u\n", idm->total);
 	if (!idm->bitmap)
 		return;
 
 	drm_printf_indent(p, indent, "used %u\n", idm->used);
 	for_each_set_bitrange(rs, re, idm->bitmap, idm->total)
-		drm_printf_indent(p, indent, "range %u..%u (%u)\n", rs, re - 1, re - rs);
+		drm_printf_indent(p, indent, "range %u..%u (%u)\n",
+				  rs + idm->start, re - 1 + idm->start, re - rs);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_guc_id_mgr.h b/drivers/gpu/drm/xe/xe_guc_id_mgr.h
index d0ce8ce85b7a..168c5b8d3710 100644
--- a/drivers/gpu/drm/xe/xe_guc_id_mgr.h
+++ b/drivers/gpu/drm/xe/xe_guc_id_mgr.h
@@ -12,7 +12,7 @@ struct xe_guc;
 struct xe_guc_id_mgr;
 
 int xe_guc_id_mgr_init(struct xe_guc_id_mgr *idm, struct xe_guc *guc,
-		       struct mutex *lock, unsigned int count);
+		       struct mutex *lock, unsigned int start, unsigned int count);
 
 unsigned int xe_guc_id_mgr_total(struct xe_guc_id_mgr *idm);
 
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 154d6129ea44..22fb4e8ce6ce 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -312,7 +312,7 @@ int xe_guc_submit_init(struct xe_guc *guc, unsigned int num_ids)
 		return err;
 
 	err = xe_guc_id_mgr_init(&guc->submission_state.idm, guc,
-				 &guc->submission_state.lock, num_ids);
+				 &guc->submission_state.lock, 0, num_ids);
 	if (err)
 		return err;
 
diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/xe_guc_types.h
index 717cac854724..5fd50961d9da 100644
--- a/drivers/gpu/drm/xe/xe_guc_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_types.h
@@ -60,6 +60,8 @@ struct xe_guc;
  * is initialized and used.
  */
 struct xe_guc_id_mgr {
+	/** @start: first GuC context ID managed by this instance */
+	unsigned int start;
 	/** @bitmap: bitmap to track allocated IDs */
 	unsigned long *bitmap;
 	/** @total: total number of IDs being managed */
-- 
2.34.1

