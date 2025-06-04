Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9824C5B543
	for <intel-xe@archiver.kernel.org>; Wed,  4 Jun 2025 17:30:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A022110E75F;
	Wed,  4 Jun 2025 17:30:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AiRO0/cN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F8FC10E79C
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Jun 2025 17:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749058199; x=1780594199;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=wzjPvyDbKLsXImhWj6RrPDlChNITQlHB3kuIv23TjF8=;
 b=AiRO0/cNBmMOpZlhc6vo3wTCM9k/ClKxq/5hNxry1T8QMMk45DBWw2Tu
 O97NGWKpTvwuYdePL5FxZXWJvEvHr4vlLEb3+OqN8zUZsoIBJG0hFyPdl
 DGbbnd5YQigEHOL/3HubVLGrXgGUthY5av/LUa5dRp5djP1P2ZzgQzf0N
 U7AWMENizLXt4Vhc2eDOXzvf18w56GwAXdB5DKmVu/EhU9h8572ItxJQZ
 rxU0v3yhsrJfi5gkwS8XNL8EOPX2muMM+BkQZGTuwGyK6EVb3S1r1nD2j
 fsQqH5d0XDk7JUrxQjCQ2400nuBT5zODH3+FXQOCxLedMp70OT/1aPvRl g==;
X-CSE-ConnectionGUID: k/dkj4BfTGmfZza4EV/JGQ==
X-CSE-MsgGUID: JsAsQCqWSSiDvHEuC+uvYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="51022729"
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; d="scan'208";a="51022729"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 10:29:59 -0700
X-CSE-ConnectionGUID: SL6THnIHT0GUQQnfO9EMiQ==
X-CSE-MsgGUID: GFMQCWNdScm/UIB1fxgdmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; d="scan'208";a="176139419"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 10:29:56 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 4 Jun 2025 10:29:55 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 4 Jun 2025 10:29:55 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (40.107.102.81)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 4 Jun 2025 10:29:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fIJLX7VLgOQTFk4o+OkOcQMnWFdYeK9UQbPsPNssRpFKDQCSt5T4PEB46cHEpKoBxuTnBXsp+8Qt6lv11/Rnm2JxKlhTBaridp/gOzQM/Yl+fWZjsd7ksWyOUkXt4QQSow98a/RbOK5uTn5pJsS62oVeRf3+WCwK9rb3+2IYrCD1rYiF0gVJdUuTm5dEZTClQ4Yk9zOMdBltCRrf7RJ9x2nSQHhDtvI/G/ljGOvUlYDv5ca+YRUbb2KAHMMEkOViIwXn65SArNr7D20kOBNJJt3Z6uvi+Fq0YqgOO2blHmbKhgX3/l3dZ3oQ86g7HEHMMjbbAtZ8QmKOSVELOzI6tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KkffZWfUdZaXsD1HQn83TJjwB9RMukXedPxWy785HuE=;
 b=YsCKqAHr/6v4BGng8NnWWsPzhtP1PxyjsWgEjaJewzqqDKzjEz9HelT9N6hkRaSSPMQwbCvEDTIV/D2pR01aNWl9cl/AypGAupXZYWrhVdguQI2wL6Avp8aOWmlvz7TLo1jYdhMAeDdPennCWLpNc7jCYP/JjFXaljRiGswz9M+ur263XIRj3Rg6gekuqrnpaQUealWwBF9tylggaHFTCjqimZUCR147vQbXs32LDxiPE+SKNPzDsPgsomk0t1qxVvfiWG6LAHx6tYsrWYqy82qqEqDpdMby38Qcpv5bVcDOb0mySiRvA6lh0Rr6I8+w1acnFAwCNEqL0zqLMzaiZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM3PPF7468F7991.namprd11.prod.outlook.com (2603:10b6:f:fc00::f2d)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Wed, 4 Jun
 2025 17:29:53 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8769.029; Wed, 4 Jun 2025
 17:29:53 +0000
Date: Wed, 4 Jun 2025 10:31:26 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>, Matt Roper <matthew.d.roper@intel.com>, "Umesh
 Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>
Subject: Re: [PATCH 1/2] drm/xe/lrc: Use a temporary buffer for WA BB
Message-ID: <aECC7oIDIxMv2ka1@lstrano-desk.jf.intel.com>
References: <20250604-wa-bb-fix-v1-0-0dfc5dafcef0@intel.com>
 <20250604-wa-bb-fix-v1-1-0dfc5dafcef0@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250604-wa-bb-fix-v1-1-0dfc5dafcef0@intel.com>
X-ClientProxiedBy: SJ0PR13CA0051.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::26) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM3PPF7468F7991:EE_
X-MS-Office365-Filtering-Correlation-Id: 77943186-fdcf-4b63-b72f-08dda38d6a8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KCOoHUUYeIbQy1EhREGih5AI5nJ3yoiiRdg6ijoPnPBQhOw5Cj0s3U1cI5DS?=
 =?us-ascii?Q?BP2LRNG35nfC1c504Ynl9FL2CQjVYEkV8mdkyUoqJRCr2dvyqQ2TgMjLp7/J?=
 =?us-ascii?Q?Qxbut5Ad4d9LsDaL26yOIltNP3H9w6rfoVDHJidqLIioaVv9LOwJ0lDp8RV/?=
 =?us-ascii?Q?UjjJnmtpclEJF9MedZ8zfInc7+U+qZVCLZ0hK1r9kCrDBVEcxWAKemSNTevc?=
 =?us-ascii?Q?dmKKvSqhIe+mhWKDf5oroIihsfBYiBkR8Qw9RwX0NI2ZnTdZFQo27dfeMRKk?=
 =?us-ascii?Q?MUFSflLHCRhO25L1Mm7i4YEKI7UGPVx8isVhsL9Ly9u6LTG4JJfylFfm31aC?=
 =?us-ascii?Q?jZis8fnXi5g2cwaGE6R8i/6/esaj9nmxj9sIiHEd1qM/LtfCiaSAfXUftTmN?=
 =?us-ascii?Q?qu3GADIz3SVB+UGSuHYIZyzQuPNq1WlfqNAnML2nm1BwnhHPCyr59riXfM+6?=
 =?us-ascii?Q?r7BISHPgYn3LLN7EAHZqOaThmj91BvMRC8OdLXj4uuDxWNvd6mZFEeb6sc95?=
 =?us-ascii?Q?UjziaVOY23YESU3LLy8QieTcS0puZCO2pAiXKaZJ8XCuIhAdbggQqf4qDr8l?=
 =?us-ascii?Q?SLqmD0viQYzCGtDqpOPPQ+PThQdPAUycaz4/XvcisdPdkDzT5y8+dw0Ou2Vb?=
 =?us-ascii?Q?SsLStqVaPXD/yune+olbNnt0JndsYVge7bXTAgC+yUEw1uFpX6i+4YJOOuP/?=
 =?us-ascii?Q?e5F8Q7JMmrHuJ9/ij4vaEclnH5dNfJBfljQbAKXu/dasg1GmxIZA3jO5BKB+?=
 =?us-ascii?Q?VdmUKdiaX1uCE7SLR3n/O+1A7qaTJJAJmgPsQbsytHG8vjqX0tZW8lJulFqh?=
 =?us-ascii?Q?83EMq7AMQTE+rvdU0b7LJl5cOPZVti4tN13cFLJ0FWB7tkku1az10W9erZl4?=
 =?us-ascii?Q?BXnJiXtODsTQOd2QL3yE3lAXlfw4LbH0PfYDKsBpk9JgIsbhQGSYXWuz8L/e?=
 =?us-ascii?Q?MEEnETEI1Gx+/VhQ6dD3P2e0BEGCnm0eFcI5es33TQg8Fkl6ER6H5gNWzHkS?=
 =?us-ascii?Q?KPScJZO8z0gJ36NZKY0hWvz7mz28gW6YJNcfinpS19rf3uwA2GKl4TLWIjYi?=
 =?us-ascii?Q?64lUBkMM7LZHKMFJAHNI5zZaAUXK2eaUao38ELjOFu57EirZzX3gOz3VFUaf?=
 =?us-ascii?Q?26tKvLNJ70SzDUvjlT+CcPj7x54Bm4kLQbjntJCao9CWOEfg4s/oBH/PPqqt?=
 =?us-ascii?Q?7T3nwNz3g6TNUMNgG4IhEi4GhsU86HouHi606vEVvfPwfyXq6MlcTxh8QLa6?=
 =?us-ascii?Q?b5laOWpDeWXtlVC5Dhvr9ls4oCR7vn34VtVlReCBjvN6fCQ9fhg/1c0pn8DG?=
 =?us-ascii?Q?8mLxsBntOik4NfuOMnPXJLpXYAOnl7aGxHeJ4vUJNhk17uAUdT9h0i6L9C+c?=
 =?us-ascii?Q?k0ngbaZ+XQjXpoCx1vWYpWiqyAdVG4KVuN0VL0oTswCyFQpAUQzcinlmbIWu?=
 =?us-ascii?Q?Wt/04X4mDSw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VQJqCFiAe5CUH8XaZzmR4DyUJ0BWM7JMydzSHlBTujU1jlSR8YdDc8z5xpxp?=
 =?us-ascii?Q?EEiIT327+3T61QF2heiwCZ6kdzGz2hdVSZfXoMigIlAb7ZPr2x5qmK8Vv0Y2?=
 =?us-ascii?Q?TZrrFun2yMP9NlDyYQHisvfrCEMayn4l/Z9A+4U3W6FSbz9EN+suvoPfVwUp?=
 =?us-ascii?Q?u18XLjHyMxTSmfcU/uMhf9ZCCS2n1vjeE8PHO3YWW+mGpeOQ7M1m284saSEf?=
 =?us-ascii?Q?2CBWr41zVzwDaF0yMNUFoR+KoxwZ5XGnphiteLzbOqz1iCulOCjm6LKIJZON?=
 =?us-ascii?Q?zhsSgLjQLh2rdPG/cG7lcDRkyuR6cn8fp9Ge2Gqjvjqtb7C/rZqX59h8//4J?=
 =?us-ascii?Q?72vfacaGHzV1x0luoeZOm+QsTN74l9VVXmmO2fvMNFnoolM/bP6QIfZm3Pfw?=
 =?us-ascii?Q?+kl88oYsWc+I6vDCGELpHqcICZiX9g/CEp66MMNcy/kRDfYOjudkMw8uhWTc?=
 =?us-ascii?Q?kdHuyjySIiMdqlANzyme5o+jXTaBgPr3tUXGz7QiKsfazpjptJ3gx6pYw+nF?=
 =?us-ascii?Q?h9fmfgi1Z+qvK2CndFqcffbGtQNp7cvbAptGug4S9KC5kBdF90uEBlAmrSxN?=
 =?us-ascii?Q?aPdFF6oC6QyQhu+aat+7OwmN5gio6wTC1EeTVnS5rs/6o8dN3E4RWgbOCmPq?=
 =?us-ascii?Q?BlOfKC7awLHm0UZ2iFv4QhLvACuyc2ul5maIjdMnB+91YWJoyztIGXwnHM3M?=
 =?us-ascii?Q?rzNyJP+IeBZzX/Al7xhEsrfKzLdwc7nkmDwgwbHfYpTPMdYI9iY5o0cHMzdV?=
 =?us-ascii?Q?y1SLjGIoBjgWUJb44MN1tqdiyfQ3zCfo7LwySTeC8mDYzaCEOUkFGPsNDDcM?=
 =?us-ascii?Q?VCJelNu+I4jQcYARV3FN84SoNWAGH3dDi1yEJMOkrideDrLPlV9vUAZjMDNq?=
 =?us-ascii?Q?b7rwUf2jpMtIKN/4wWtKVlw7G0OMH+sO1xGudE0RvbSecZJtNRZ7I8UU5N8g?=
 =?us-ascii?Q?aHZ4h/xilFcWWVyip9mW6+b8LIJTthHVZz4gJi0mqo2+96Rnk87nto6qYHh3?=
 =?us-ascii?Q?gSTne+fsdq4jwmVZ0YZOVy345bG3ZzoAXJfNhs8uCjiHh5prJz+2I+I2kjLG?=
 =?us-ascii?Q?rmuYwUwy+r4g5b1XYfeHTNTSrlOSJ6PBisNn6YEPoMMvPpkaXboa/D2xI42F?=
 =?us-ascii?Q?S4dZtuykO8N2IWln7qC0l9MOTytl9Y4GS76r1348W5br/X2cZBa9oJKgY6Dt?=
 =?us-ascii?Q?4sFcqcdKvdmrU11YfNv/OKp3OLrgTurlv3ySJcggSHLJC3kXjiIMWkWzuUhB?=
 =?us-ascii?Q?D6uR7y7RyIqP9ogK9YcGQWO4bq3vnRGueR24VXJ0EqqjbIfp+O9ucKowQUJz?=
 =?us-ascii?Q?FZ9NCjMBK6u4m0Mwob52RipGuRxrcyITx1jGNF0n4emG1DHawFGgHF2jp99i?=
 =?us-ascii?Q?lBXLNC2M+W2fl5W7TS8fKxhjwKQdDSOP6Wosfjs4M5+rAfcozrQgiD2afKmG?=
 =?us-ascii?Q?oTCCwZaNNtgr3VEE9Iq9Rom9enN9Pw6dxCaVH3rbAngp0VgK7Mr9pmKmKbAN?=
 =?us-ascii?Q?yLod9X+224TKFfj8b0pPhqlXBjYNBFDBMUvCnBdK6NrzZsvyO0gUZK12ABcx?=
 =?us-ascii?Q?GUNJjBodMAaoeRg5Bz9v4RPnrZURslp1vZqOf8Zb3Pxsa0SqYhxyvE3vhAVO?=
 =?us-ascii?Q?9A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 77943186-fdcf-4b63-b72f-08dda38d6a8d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 17:29:53.1716 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f5m0M/ldJG0pYOeuiKdbRGHgrwsRkYeyvmxOva9goh2HL8ib+tLeAIQPtstL3wvZZ4QNLs2Bp7WPv7BPyJTzFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF7468F7991
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

On Wed, Jun 04, 2025 at 08:03:05AM -0700, Lucas De Marchi wrote:
> In case the BO is in iomem, we can't simply take the vaddr and write to
> it. Instead, prepare a separate buffer that is later copied into io
> memory. Right now it's just a few words that could be using
> xe_map_write32(), but the intention is to grow the WA BB for other
> uses.
> 
> Fixes: 82b98cadb01f ("drm/xe: Add WA BB to capture active context utilization")
> Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_lrc.c | 24 ++++++++++++++++++++----
>  1 file changed, 20 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 63d74e27f54cf..bf7c3981897de 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -941,11 +941,18 @@ static void xe_lrc_finish(struct xe_lrc *lrc)
>   * store it in the PPHSWP.
>   */
>  #define CONTEXT_ACTIVE 1ULL
> -static void xe_lrc_setup_utilization(struct xe_lrc *lrc)
> +static int xe_lrc_setup_utilization(struct xe_lrc *lrc)
>  {
> -	u32 *cmd;
> +	u32 *cmd, *buf = NULL;
>  
> -	cmd = lrc->bb_per_ctx_bo->vmap.vaddr;
> +	if (lrc->bb_per_ctx_bo->vmap.is_iomem) {
> +		buf = kmalloc(lrc->bb_per_ctx_bo->size, GFP_KERNEL);
> +		if (!buf)
> +			return -ENOMEM;
> +		cmd = buf;
> +	} else {
> +		cmd = lrc->bb_per_ctx_bo->vmap.vaddr;
> +	}
>  
>  	*cmd++ = MI_STORE_REGISTER_MEM | MI_SRM_USE_GGTT | MI_SRM_ADD_CS_OFFSET;
>  	*cmd++ = ENGINE_ID(0).addr;
> @@ -966,9 +973,16 @@ static void xe_lrc_setup_utilization(struct xe_lrc *lrc)
>  
>  	*cmd++ = MI_BATCH_BUFFER_END;
>  
> +	if (buf) {
> +		xe_map_memcpy_to(gt_to_xe(lrc->gt), &lrc->bb_per_ctx_bo->vmap, 0,
> +				 buf, (cmd - buf) * sizeof(*cmd));
> +		kfree(buf);
> +	}
> +
>  	xe_lrc_write_ctx_reg(lrc, CTX_BB_PER_CTX_PTR,
>  			     xe_bo_ggtt_addr(lrc->bb_per_ctx_bo) | 1);
>  
> +	return 0;
>  }
>  
>  #define PVC_CTX_ASID		(0x2e + 1)
> @@ -1125,7 +1139,9 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>  	map = __xe_lrc_start_seqno_map(lrc);
>  	xe_map_write32(lrc_to_xe(lrc), &map, lrc->fence_ctx.next_seqno - 1);
>  
> -	xe_lrc_setup_utilization(lrc);
> +	err = xe_lrc_setup_utilization(lrc);
> +	if (err)
> +		goto err_lrc_finish;
>  
>  	return 0;
>  
> 
> -- 
> 2.49.0
> 
