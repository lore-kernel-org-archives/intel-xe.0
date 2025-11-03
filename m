Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17FCCCCF9F8
	for <intel-xe@archiver.kernel.org>; Mon,  3 Nov 2025 17:31:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C837610E200;
	Mon,  3 Nov 2025 17:31:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lgfkBEKH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2732110E200
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Nov 2025 17:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762191069; x=1793727069;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=FGdQhc+pvrLKezWvkW/9C93KayH+PA4fp64xwxp1634=;
 b=lgfkBEKHlXeq/0PkozgLqX5/hARGk61PfakzRsWY/illLbOoPU5sSXK1
 RVm703DD2FaVPEPkim7/LUuo27HNPvH5YokzazmhiLIDcFcgItnaU0nPE
 Lazll8YESaaaqgokOK/C9Pet35Htpb8foRXdnUexq40iw9ZsAYLeU7vz+
 lynbv0wR3vsKXpaEnkicamcNAv61Kt6ukjXiG1ThOZaa2HFGPZZw40y8P
 yN2RO5K4iNjKPLU3QwXpfYovk8ESBrrrHtEnTmU7Yq/eSPOP3hotyuX7r
 KvXOsGAwEvitJVfwz7vYInA0M/r4vqhu6B++0Qjy5nPXlsLsF4nMg5Sce Q==;
X-CSE-ConnectionGUID: CAzPLS/uQHeCSnS0MnhwIw==
X-CSE-MsgGUID: SEaOEIsWQ0qQOVcXy28Jvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="75623541"
X-IronPort-AV: E=Sophos;i="6.19,276,1754982000"; d="scan'208";a="75623541"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 09:31:07 -0800
X-CSE-ConnectionGUID: kL6wI6A5QP2RBrrwN1RghQ==
X-CSE-MsgGUID: 7FACrU/STqOEw/iKwzAmLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,276,1754982000"; d="scan'208";a="217744917"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 09:31:07 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 3 Nov 2025 09:31:07 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 3 Nov 2025 09:31:07 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.58) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 3 Nov 2025 09:31:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z5oqhs7+79FuBJnUe/21OJscBu8L7bUdZH1L0kmAO2iWYKYypfTTbyydI9kVc3Pgf6EWP8lKMGTzx9h6kSo8ge5T2eAUm8AquvUMjSuUazOVwadt/z8xgdTZd8SxJdK7H/50NbOtMWgbI44CmjWubKlbHn79GgLulZwbxL2B1AFSdCvV0Q0tSbvjfp8+R4yvPgJZLy4C5ouKx2Cu2Z9GJaxvSTry1p6dkLBqW4YWXPILRct6htBgzAUIDY5WxYnod51OP8SB6xCA8y/c9CF/dXQO5trFByFCdjdblDTdiiXHZseIudqguTs4UN2bFg/t8qlzaEYr0dkg0axWhT9y2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YlcIecfNLxoVGDAtro+NeoE+X6wBGvGA9SGttO38Sjs=;
 b=hmH0KxqRLdxHFu/kverBXXmJHOerFy9Fd8AqbIRdtWkbn0cDnPAB9XsMTjVoQFADWaZq4HYhGQdBf8+ENwjBEc/S13eKpet03GRNzDBR8/YUKO+gj6iqfkulXaILu3U6CgrphFBHNyfrLzjzIUaDCxe0e3M9Kclmh+SwF6kfvEfmUvJSik5+ovMcS9gRJ5r4PwIlfi3tuIF7w0XQ04AXX3QMy8QIzeewckCLwjE1RXwaMBUn4g3xOPPqo7YRdfgAoiXZyZwjZLdwLGmzB5WOY5aa3Z4G88kpmDeNvjOlKTHX4eBcsWkLhvDCQYAe5lwQ2ovZGpweHtPphMrRPwNttw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB6419.namprd11.prod.outlook.com (2603:10b6:208:3a9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 17:31:04 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9275.013; Mon, 3 Nov 2025
 17:31:04 +0000
Date: Mon, 3 Nov 2025 09:31:01 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH 1/2] drm/xs/sa: Shadow buffer support in the
 sub-allocator pool
Message-ID: <aQjm1Zp+ZzVFJnpE@lstrano-desk.jf.intel.com>
References: <20251103152006.1954098-1-satyanarayana.k.v.p@intel.com>
 <20251103152006.1954098-2-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251103152006.1954098-2-satyanarayana.k.v.p@intel.com>
X-ClientProxiedBy: BY3PR05CA0019.namprd05.prod.outlook.com
 (2603:10b6:a03:254::24) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB6419:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ad5e4af-9e51-4a5f-459a-08de1afec3c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?C7lsL/C9wkm0qPacK+NAr6jpZUpABueKn+/9R7HxnRaNu0npaMmeUxQlTMzP?=
 =?us-ascii?Q?nNWn3AMMqesX99A4oK6LGeYN4hcqspSTrLYwqQttbdp+0O9td2juARXJ4ALx?=
 =?us-ascii?Q?2LeS659XUWsLyx9ALvyCGToOE4V6jKt9Mvfwsp+BwfyTHj1Ee/egD+MqXYr0?=
 =?us-ascii?Q?9UXx/6DaddEbd5WTR8/tuMzx8qBQSEX9wICRE7k6+lHpv1xK9azLkP8YySvG?=
 =?us-ascii?Q?A8LlVf6YALOAtF8YT1dAm47f6Bh2XK4iOaGtzg9OuxsxH0k7DS5sjuUlCGuw?=
 =?us-ascii?Q?BAe4YQwsrscc5FtJNftK92b4io/f0/aFaoXMnUQFkbbAzV41S7hx9Oh11DUz?=
 =?us-ascii?Q?GKNHjz4CrYLCGWy7Bl56x/TI3M/0OHNr8Nys5jvpj5ydVgam1NtTtuQGdeCj?=
 =?us-ascii?Q?MILrs3oYgsvLZElX5NCMBffa5WNm2tNvUA9HunEHjHBZHQALjoOF9R2ROJIb?=
 =?us-ascii?Q?ERb1nLc5iRYwQeYkn+Fl1nC1YOUW6R+no3SvWFqB3+SsJT4hqzufpTdJ0Fu1?=
 =?us-ascii?Q?B+PE/rUIdg/EDSns1kCQjZGPyPGPKAVTZuAP0O4e3sj4aq9WEJp7Ez81QCNS?=
 =?us-ascii?Q?RXApDiY1YINw5gy3Y1oQkIhZ3FkxiL3j2mf9gCgLonQxhbbSjrbdviDOaWmU?=
 =?us-ascii?Q?/R+ewMSBYQUu5P6zx/UBaCWHMG5HbpHLpjQuTVbQL8k+uPsjALnqPZYbWIaS?=
 =?us-ascii?Q?9Y0iga1cx4Qz3a5eqP18jQVWSQjOlkq0X8WNQ5MJYwI2S2HkCwv6AmX+lonk?=
 =?us-ascii?Q?hJa6iWJiBFVmSlXFsrEmG8EtAw0xDPMkhK03zaIWL1q8GwZIExAOMmlk62FJ?=
 =?us-ascii?Q?1OuxNqHsx2Pi/Xrb9fU4kS/LHDjIRhADxJbR1J9PzT2ZPxs9CQqIFJt1Gi3h?=
 =?us-ascii?Q?ZM9p8AXt7YvxstfzrvRsb9HZXhz2dxjX5EEbrhvuFQrRL3SnGruPNdzWRbhn?=
 =?us-ascii?Q?qGCcZO23Z7KnbBQd2IkTeRniJIC/UCYkfLN27nahOayt89uRRO6m/gZrz0W9?=
 =?us-ascii?Q?TNJ0mz8kEoB4pZ/xwSKpZDh/Vdjj10RWH9p9TleM6b0zaS+CUG6UKNGK61h0?=
 =?us-ascii?Q?ATu2+X2GPQnNAHOQjoaY9GDAwNvZU454jgDK3KXGUWkeLl34ZNuRKYb5XkLP?=
 =?us-ascii?Q?lY/eOeiPQFror99ciP52SpZ/uoMMRMUGBK9eUeALhqk2Z3pveN93CDbeqjvJ?=
 =?us-ascii?Q?ZJWHEWrH0f6dix9dIaoyOv376OPbvOjUzkA8uhfU98gOmO64ASm0Abyi2WNH?=
 =?us-ascii?Q?2X8WJOz5ubYqnzEk85rSgcjbNb/srUOtBJLgOEZWqKplo0da2F257MUQOuTl?=
 =?us-ascii?Q?P6ze5g5kDJv5atl4vJPRZlGZ/WDmnne+e8P4TXqCadY4Ys7Wzj4cUEnk7dRf?=
 =?us-ascii?Q?Um9jq/T1peK5eU8R8EhWd34tEen4XnIZeWFRcanaNo/YCGUBYezdSzgKawzX?=
 =?us-ascii?Q?3hb1BjVw69iPX0eo8f28lXbM5eX1hqUv?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nJ+rM3eOwSYQd4H7cLc0UxQZ2TNP62Ke4ykhq6nVaOGh178zFOMv6eCqwlws?=
 =?us-ascii?Q?tN2t3Tn9iJFOtxHuaSVo6WPXousyYFQoWDnt6XVUT+r39JfVxu2fUY9aZqO1?=
 =?us-ascii?Q?MZuNA37UmbNlNdkJEbT8UEBYfVm+TY7HORR9eDBFECstElSMLsx/pHj8rnES?=
 =?us-ascii?Q?VbO2DV2SxD+uDpjyz726OGzxopvaWRC6I42YjzMa3psTkYRVSy4F6GGLwvTH?=
 =?us-ascii?Q?tIEm7QaeXMIGbQ9yUJIAg3qUzFjBl1/dpbQVeJT4BzCT2GyGCRFAHjxe9jm+?=
 =?us-ascii?Q?X00bEjBfd6hDtT8xeBr8TZeTu0G4zI6uyQhpvb7R+en2oP/UxIaVslfPhEdt?=
 =?us-ascii?Q?rawMTlMmGcA9XQ90o4f5ZctiWRBTqg02WnK5jNjLpldCkAjJDQUd3ZYP6ZDR?=
 =?us-ascii?Q?hXZ6WSHPgxbTP+elms658zNRWC/Lh4wETbE5i5FO/JvsXoeuaxqQtHXZVW0G?=
 =?us-ascii?Q?jpRsqlPRi4USI9Yb48bsmTlwQ6RKCQ+DoUwW3Q6VfCsu42nxQ3p9dfL0AGx1?=
 =?us-ascii?Q?pE5yn1QTHry3FK3VN8kIvM5QGzUWW1ehUIuHvsK9HR3FekwCAsqCLkIJEDKT?=
 =?us-ascii?Q?zx7n+jVQfpDNi+n8gImbykjeehiqwbh8Jv/uoXQonJH8Jgi6pEiFDbALrZOj?=
 =?us-ascii?Q?zSZ7Vizn6w3XQ9YS5kYL9l0mrmldosTTfvhaVW/7T4nwD00Ww/4a40GoOyEP?=
 =?us-ascii?Q?vLQYckDZ+nod4qzQ/HvZdP3mo1pbpjwuYUS6O/4XgaAXkjb6C8Vgdy+ixG2l?=
 =?us-ascii?Q?d8V502RRuyGVib9SIN6g1Xa45OEunwPL9caFI+4k1fWHHh/QkAuOx/JUkuNU?=
 =?us-ascii?Q?xZGqmW54/f0j8ZKQeOe2E80pqBqMtrndBbFW3ootXq22DwoQ+68FXldJznV1?=
 =?us-ascii?Q?yIcPnowqhtKtLoWwGRaRTTilWcqrOxl/DYwDJSK0wwF4M+P9iBZd0gkDZODf?=
 =?us-ascii?Q?ESEo52DtIYvzL+4UGxcfrQohnOtquD+K0uRX8Xuy3KVwLdYImR78iOennpb6?=
 =?us-ascii?Q?lnUfzsiELrut2rS1GKgffR7joVW/Oyr5XYHYzNYfoS0Cl+PoTsXRXE3xkDVv?=
 =?us-ascii?Q?naBigZdpSXk4dHjZ9FZBNw7yTpdPxKgrAdcrocujFeRp3npiqzCYC5wNKvcS?=
 =?us-ascii?Q?OebqZ0qp6foRFlwLjDkMLAH7XJHBLwZpOl5kxVbuydrgiwuR5ghRUuwBnBGC?=
 =?us-ascii?Q?GIlLEbk+bdxj744Q1vhTKKBP1YnVwi6sihPByh+FtaOWnD4cmtydUQRkMBLi?=
 =?us-ascii?Q?Ag4z6paQdLUAxih7UmQjc3zjfrKrQZuUzPKraVU1UDcXKFEuHGcLf8UpanHC?=
 =?us-ascii?Q?OzdogbzTctzBUD9wl/LqspJaxVL6IR/dKoaBBkZWUgC0HYaXDzQLEh2JiP8s?=
 =?us-ascii?Q?fuWZIuogBLnfaNAujxKWsLMmTZas4mxZDZV5cT2iKbz89rcQ8JPohsev+yrb?=
 =?us-ascii?Q?QEadWP6ShRFUVT684cw4jZRBckempWKciyd80BDPdRSvKnJO/FsBPmcQZ0Uz?=
 =?us-ascii?Q?JXbofju5YjgI5XM3PXIHTX2wwcrwuPyv8aCXo882gPwT08XNAd4LF7hGd7u4?=
 =?us-ascii?Q?riq1Xvyf8fvOdkoYpY1tBWFhxt/lKTEITY2fhQyEsjdUVJ8ctLSjKez7/R97?=
 =?us-ascii?Q?oA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ad5e4af-9e51-4a5f-459a-08de1afec3c4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 17:31:04.3189 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oLtMkkarM+78hIGF1eGfwqdJEPbmL+4TomnB/KHut3CY042xG5KG9pypoWPRpkgXR057sU3UkAtaIpsFoArqqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6419
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

On Mon, Nov 03, 2025 at 03:20:05PM +0000, Satyanarayana K V P wrote:
> The existing sub-allocator is limited to managing a single buffer object.
> This enhancement introduces shadow buffer functionality to support
> scenarios requiring dual buffer management.
> 
> The changes include added shadow buffer object creation capability,
> Management for both primary and shadow buffers, and appropriate locking
> mechanisms for thread-safe operations.
> 
> This enables more flexible buffer allocation strategies in scenarios where
> shadow buffering is required.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Suggested-by: Matthew Brost <matthew.brost@intel.com>

CI looks like it had issues, but this patch looks correct:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_buf.c      |  2 +-
>  drivers/gpu/drm/xe/xe_sa.c           | 51 +++++++++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_sa.h           | 19 +++++++++--
>  drivers/gpu/drm/xe/xe_sa_types.h     |  3 ++
>  drivers/gpu/drm/xe/xe_sriov_vf_ccs.c |  3 ++
>  5 files changed, 74 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_buf.c b/drivers/gpu/drm/xe/xe_guc_buf.c
> index 3ce442500130..c36fc31e0438 100644
> --- a/drivers/gpu/drm/xe/xe_guc_buf.c
> +++ b/drivers/gpu/drm/xe/xe_guc_buf.c
> @@ -30,7 +30,7 @@ static int guc_buf_cache_init(struct xe_guc_buf_cache *cache, u32 size)
>  	struct xe_gt *gt = cache_to_gt(cache);
>  	struct xe_sa_manager *sam;
>  
> -	sam = __xe_sa_bo_manager_init(gt_to_tile(gt), size, 0, sizeof(u32));
> +	sam = __xe_sa_bo_manager_init(gt_to_tile(gt), size, 0, sizeof(u32), 0);
>  	if (IS_ERR(sam))
>  		return PTR_ERR(sam);
>  	cache->sam = sam;
> diff --git a/drivers/gpu/drm/xe/xe_sa.c b/drivers/gpu/drm/xe/xe_sa.c
> index 63a5263dcf1b..3551e726843e 100644
> --- a/drivers/gpu/drm/xe/xe_sa.c
> +++ b/drivers/gpu/drm/xe/xe_sa.c
> @@ -29,6 +29,7 @@ static void xe_sa_bo_manager_fini(struct drm_device *drm, void *arg)
>  		kvfree(sa_manager->cpu_ptr);
>  
>  	sa_manager->bo = NULL;
> +	sa_manager->shadow = NULL;
>  }
>  
>  /**
> @@ -37,12 +38,14 @@ static void xe_sa_bo_manager_fini(struct drm_device *drm, void *arg)
>   * @size: number of bytes to allocate
>   * @guard: number of bytes to exclude from suballocations
>   * @align: alignment for each suballocated chunk
> + * @flags: flags for suballocator
>   *
>   * Prepares the suballocation manager for suballocations.
>   *
>   * Return: a pointer to the &xe_sa_manager or an ERR_PTR on failure.
>   */
> -struct xe_sa_manager *__xe_sa_bo_manager_init(struct xe_tile *tile, u32 size, u32 guard, u32 align)
> +struct xe_sa_manager *__xe_sa_bo_manager_init(struct xe_tile *tile, u32 size,
> +					      u32 guard, u32 align, u32 flags)
>  {
>  	struct xe_device *xe = tile_to_xe(tile);
>  	struct xe_sa_manager *sa_manager;
> @@ -79,6 +82,26 @@ struct xe_sa_manager *__xe_sa_bo_manager_init(struct xe_tile *tile, u32 size, u3
>  		memset(sa_manager->cpu_ptr, 0, bo->ttm.base.size);
>  	}
>  
> +	if (flags & XE_SA_BO_MANAGER_FLAG_SHADOW) {
> +		struct xe_bo *shadow;
> +
> +		ret = drmm_mutex_init(&xe->drm, &sa_manager->swap_guard);
> +		if (ret)
> +			return ERR_PTR(ret);
> +
> +		shadow = xe_managed_bo_create_pin_map(xe, tile, size,
> +						      XE_BO_FLAG_VRAM_IF_DGFX(tile) |
> +						      XE_BO_FLAG_GGTT |
> +						      XE_BO_FLAG_GGTT_INVALIDATE |
> +						      XE_BO_FLAG_PINNED_NORESTORE);
> +		if (IS_ERR(shadow)) {
> +			drm_err(&xe->drm, "Failed to prepare %uKiB BO for SA manager (%pe)\n",
> +				size / SZ_1K, shadow);
> +			return ERR_CAST(shadow);
> +		}
> +		sa_manager->shadow = shadow;
> +	}
> +
>  	drm_suballoc_manager_init(&sa_manager->base, managed_size, align);
>  	ret = drmm_add_action_or_reset(&xe->drm, xe_sa_bo_manager_fini,
>  				       sa_manager);
> @@ -88,6 +111,32 @@ struct xe_sa_manager *__xe_sa_bo_manager_init(struct xe_tile *tile, u32 size, u3
>  	return sa_manager;
>  }
>  
> +void xe_sa_bo_swap_shadow(struct xe_sa_manager *sa_manager)
> +{
> +	struct xe_device *xe = tile_to_xe(sa_manager->bo->tile);
> +
> +	xe_assert(xe, sa_manager->shadow);
> +	lockdep_assert_held(&sa_manager->swap_guard);
> +
> +	swap(sa_manager->bo, sa_manager->shadow);
> +	if (!sa_manager->bo->vmap.is_iomem)
> +		sa_manager->cpu_ptr = sa_manager->bo->vmap.vaddr;
> +}
> +
> +void xe_sa_bo_sync_shadow(struct drm_suballoc *sa_bo)
> +{
> +	struct xe_sa_manager *sa_manager = to_xe_sa_manager(sa_bo->manager);
> +	struct xe_device *xe = tile_to_xe(sa_manager->bo->tile);
> +
> +	xe_assert(xe, sa_manager->shadow);
> +	lockdep_assert_held(&sa_manager->swap_guard);
> +
> +	xe_map_memcpy_to(xe, &sa_manager->shadow->vmap,
> +			 drm_suballoc_soffset(sa_bo),
> +			 xe_sa_bo_cpu_addr(sa_bo),
> +			 drm_suballoc_size(sa_bo));
> +}
> +
>  /**
>   * __xe_sa_bo_new() - Make a suballocation but use custom gfp flags.
>   * @sa_manager: the &xe_sa_manager
> diff --git a/drivers/gpu/drm/xe/xe_sa.h b/drivers/gpu/drm/xe/xe_sa.h
> index 1be744350836..8a674eccc0e2 100644
> --- a/drivers/gpu/drm/xe/xe_sa.h
> +++ b/drivers/gpu/drm/xe/xe_sa.h
> @@ -14,12 +14,14 @@
>  struct dma_fence;
>  struct xe_tile;
>  
> -struct xe_sa_manager *__xe_sa_bo_manager_init(struct xe_tile *tile, u32 size, u32 guard, u32 align);
> +#define XE_SA_BO_MANAGER_FLAG_SHADOW	BIT(0)
> +struct xe_sa_manager *__xe_sa_bo_manager_init(struct xe_tile *tile, u32 size,
> +					      u32 guard, u32 align, u32 flags);
>  struct drm_suballoc *__xe_sa_bo_new(struct xe_sa_manager *sa_manager, u32 size, gfp_t gfp);
>  
>  static inline struct xe_sa_manager *xe_sa_bo_manager_init(struct xe_tile *tile, u32 size, u32 align)
>  {
> -	return __xe_sa_bo_manager_init(tile, size, SZ_4K, align);
> +	return __xe_sa_bo_manager_init(tile, size, SZ_4K, align, 0);
>  }
>  
>  /**
> @@ -69,4 +71,17 @@ static inline void *xe_sa_bo_cpu_addr(struct drm_suballoc *sa)
>  		drm_suballoc_soffset(sa);
>  }
>  
> +void xe_sa_bo_swap_shadow(struct xe_sa_manager *sa_manager);
> +void xe_sa_bo_sync_shadow(struct drm_suballoc *sa_bo);
> +
> +static inline void xe_sa_bo_swap_guard_lock(struct xe_sa_manager *sa_manager)
> +{
> +	mutex_lock(&sa_manager->swap_guard);
> +}
> +
> +static inline void xe_sa_bo_swap_guard_unlock(struct xe_sa_manager *sa_manager)
> +{
> +	mutex_unlock(&sa_manager->swap_guard);
> +}
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_sa_types.h b/drivers/gpu/drm/xe/xe_sa_types.h
> index cb7238799dcb..1085c9c37d6b 100644
> --- a/drivers/gpu/drm/xe/xe_sa_types.h
> +++ b/drivers/gpu/drm/xe/xe_sa_types.h
> @@ -12,6 +12,9 @@ struct xe_bo;
>  struct xe_sa_manager {
>  	struct drm_suballoc_manager base;
>  	struct xe_bo *bo;
> +	struct xe_bo *shadow;
> +	/** @swap_guard: Timeline guard updating @bo and @shadow */
> +	struct mutex swap_guard;
>  	void *cpu_ptr;
>  	bool is_iomem;
>  };
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> index 797a4b866226..9959d619addc 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> @@ -162,9 +162,12 @@ static int alloc_bb_pool(struct xe_tile *tile, struct xe_sriov_vf_ccs_ctx *ctx)
>  	offset = 0;
>  	xe_map_memset(xe, &sa_manager->bo->vmap, offset, MI_NOOP,
>  		      bb_pool_size);
> +	xe_map_memset(xe, &sa_manager->shadow->vmap, offset, MI_NOOP,
> +		      bb_pool_size);
>  
>  	offset = bb_pool_size - sizeof(u32);
>  	xe_map_wr(xe, &sa_manager->bo->vmap, offset, u32, MI_BATCH_BUFFER_END);
> +	xe_map_wr(xe, &sa_manager->shadow->vmap, offset, u32, MI_BATCH_BUFFER_END);
>  
>  	ctx->mem.ccs_bb_pool = sa_manager;
>  
> -- 
> 2.43.0
> 
