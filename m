Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A77EC624D4
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 19:42:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 513EF10E6DF;
	Wed,  2 Sep 2026 19:42:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fq7Ze6V+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D206F10E6DF
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Sep 2026 19:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788378153; x=1819914153;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=h+wcx3P1g6UpxKde7InRgen7PP6gqAFYcPE2ntcGX9E=;
 b=Fq7Ze6V+DqxmdBv8XaWfR69BENfDhg2FfXPs5Hky/k1OsORKYyBdQbux
 1d/W9vCHg5KUrJ3xQ14yJQTnn1G9XNBAlBmVhOD0VJvtWkfckIEHg96ZS
 fXxpyIEPczw+aEHqc89OFBP0hksj9TjOoMFp743Q+rUVqtXdcRIc20BdF
 8vT0HZtW7mi2IJ3+ucwQwvQedpxv+MUEU2uUFxRrI4F6VXIOwSF5glHXb
 WzYuTGS1875f3LdTwBnmyPTxG2JKdcVHv6EXWKCio0D38+cdKFuI1+WGo
 3w01ObHOwoGqp8sOfTfTcGNj7fapDW1yGJ8hzXkoNa9AIA8pqvYnma1nu Q==;
X-CSE-ConnectionGUID: HomnzcVbSXGsAxYgvsVjsw==
X-CSE-MsgGUID: GrDiUb+RRmy6+X/N85o2Bg==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="92668282"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="92668282"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 12:42:32 -0700
X-CSE-ConnectionGUID: KMKBrI5/TA2SLuVAPLXJQQ==
X-CSE-MsgGUID: zJZn0bOXTOebEsaP9Wwezg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="293013370"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 12:42:32 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 12:42:31 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 2 Sep 2026 12:42:31 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.69) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 12:42:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dn0Tq7OGmarAWdiGe7aE+cy8fGU8xYi0Y/Eu+eriqHsac2ebFvqL+e4ML8Po0RIXy7sWKbqQf3V/VQyPJzYcwciggvbEQrBdxiTJAduHsNlTkjjMbEVGd//iIqkOiRPUQwNCUjxiQD3jREXvjnBsiIIV1U9gvKGA01QPONUTUyqnRQRgo8g05GfZM1pQPXgi94bPCcA8C6P3YP8kn0TmAkhkn5iXVg4ExGvlf+3Be29UI1dXJCXs/DOK693A1atAyc2EgYyEPQxYGkFDiEOpiWGE73oHJ9EQEhdjsOnZoxrHGl7OL772F25RrkjET6TmpLt+Ez5NJkJzDmlLxxT1LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MV8wLMTLIay2Bfx+bfnq8+MqVJgdU1BnLvsVE9Xy20c=;
 b=fsxJ8D0+9nl9RNsA8cGuxdyb7OYavie27dKfwKR7hJv+asMni1GPSLsYmIBpX7JbC2rFSSd/OmrMxO+dKAMuRgi7HCyv4bXDohn+bU9FftMvx511SUTwKlvE4bKU9eR2vypZdw6+i3rZSZr5O+GkQMO+qNkeQDxVIbLttU8RTMC5uJVzHFnNR3Lbm9GGwsud9djWdcQ/CKDNlQRBEr4grrDcVyBNft5i2Ye4oShvaAxn8piw38AuOAYrzeahOdDQfLvhDsA0IY1NZbzckGhgnqM7dhmRzU6usPOADxG+Z4EWIXsbNcogpaae3riZN0jaGZ3+Gu15EhNcfEY7jTELUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB6942.namprd11.prod.outlook.com (2603:10b6:806:2bf::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 19:42:27 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 19:42:26 +0000
Date: Wed, 2 Sep 2026 12:42:24 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 <stable@kernel.org>
Subject: Re: [PATCH v3 2/5] drm/xe/vram: report FLAT_CCS base misalignment
Message-ID: <aph8ICzvsw6Neo54@gsse-cloud1.jf.intel.com>
References: <20260902124117.918018-7-matthew.auld@intel.com>
 <20260902124117.918018-9-matthew.auld@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260902124117.918018-9-matthew.auld@intel.com>
X-ClientProxiedBy: MW3PR05CA0013.namprd05.prod.outlook.com
 (2603:10b6:303:2b::18) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB6942:EE_
X-MS-Office365-Filtering-Correlation-Id: ee2c950d-937f-4173-8ddb-08df092a5146
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|10067099003|4143699003|11063799006|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: cn3E4aycfT7N1e9DNoTPL0/If1prb1cm831tjIZfLipybKCfy3X8URgT/sUgkNLFOV2xza7F7FMPeYiBI5nG5DlMHRW2ILvC1hrirIk38vNuZx1qYk2SGM7xlv7Nr092Jwr0S3w+p7aycwwdSCqbZP/szAnP96y9hkExgdkz2rFWqjgxxuDJPgn6Py2yGs9IytnCyeBNy0DBOvtgHHRa/uEzHQZV+drsT7iqWrxVYr01UJNR7C/umr3OvwkPOg3TrgR23gTPZ/20phmBo7/vufPnbIUTV0WgEQ7zL6i2exmwqKklBwkjPfNlufcbARZbUZLAyq7o6kVaLE10FOOOwKL5tkHuhNCgsgVAYx8ZDJn2JYfTOjVeFcaZyW+4TMk4fCU5D3+BUyPw0YGuo3JSgaiZ9rp1bB7Qb6vhBdRafZiCn5e5Cb7e6cggkbe9cF/0vDMqIiIBiLlvPjLH3lhHLQh6Zk3EJh79B/4vGHNqq2gu8xcBgkm7iXLTWeVsTfjL6mQ3Z8l3XscRSkvD+QZS/OAO2nbI/zdl7+Ol7ndMoVOfzgowQ8Bsv2b22a2pFoHqKm9GZICZ0x50rG/nN4phU82r0/odNEq3Uo1wxiTKoxrFESfWTSLfrEK59F34dB9jjL4aWbmm/g1R8n1WzVR9Z7wTUy2vQpSJcZzwwXs04MM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(10067099003)(4143699003)(11063799006)(18002099003)(22082099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?2uSt7uAa8KFMNEwQdDWMaHMwv/G9z0A+jnIllSGkmwHf8fVSBfAUFixswE?=
 =?iso-8859-1?Q?4Ty8Xv4PxI7Te9mV/JjDVJ/ya64ihoTiRYc9KWzZirqt/qV3cG1fYRMFEN?=
 =?iso-8859-1?Q?vmLh7V8Mw8frEBUIAG5QFYzqu1UHWwf1hJv3D5E2WGe8hp0EF+lrMhi8Kg?=
 =?iso-8859-1?Q?fuoL6gxt5YC/RZcVXFlWEAke3jNQNfGDeav42cyuZg7sqZSSaNRscyGBku?=
 =?iso-8859-1?Q?YKoVjxctiagzv3tar9fkd/4E9/kEU65vEwEESZnoOc26iFMyHDbNIYxKCg?=
 =?iso-8859-1?Q?oZ2x5z9h7Z8nPS1JwMNI6qByGU178ZN+kX6gcrLciZxd7TTGMtwOvm5jRs?=
 =?iso-8859-1?Q?m1tDUS86snaZBrNYVU1S1gus/QOr/Hqr9mW82d7GM4yF9jcwhjkb4/qi47?=
 =?iso-8859-1?Q?vidz2LFFKmJPNzRE/xzBWVzRk2qqAss8P5yeg9VDgDuWK0l0fm8rt5bWzK?=
 =?iso-8859-1?Q?J/7xo6X9Gu8HnokZmsHPi6+eAuhZUq95+PXt38XljuFJOtamqkBLm+hpsP?=
 =?iso-8859-1?Q?p4JsY62gQAzBDDJraCMcaub1N5+tZWj18OjZ8J5LaPlYuupr30FC60RRNY?=
 =?iso-8859-1?Q?ZdzFTSyclhZhzQllquvGXN4SSABFsiDloEU9H80DmSpqw4S8NP5N9NZ7ZL?=
 =?iso-8859-1?Q?c+BJgnD3dvSR9cyf0gEnpfdC5DCyvNmq1gNlVNbGf7dwEh8xVkf9pqnFoY?=
 =?iso-8859-1?Q?NJu0couh2xIj3zI0CObeH7UtxW6THYQCmND2sph3QXdpxExF8UayEbbn/G?=
 =?iso-8859-1?Q?QCk56A1FHPqD8os7i9ddgXVZwrGt4kHY05M54baCrbvKsBB+uiON0rJ1Fe?=
 =?iso-8859-1?Q?H+IYE280WQlMKWNHY3V+oQVgI7sWzgotWawnT0rFKbNzfqUCHTFX5cFvYs?=
 =?iso-8859-1?Q?m7uIDqMDEGm9uxYrv7OhC3CddjgrKNRyXiS6tNrjwhq6mX5n/FAgzVFkEE?=
 =?iso-8859-1?Q?Cyg/h96+IAqa301pAEZLFDszqmTHhVY/zaiD4d2nCVag1wN5jVU2CssJwF?=
 =?iso-8859-1?Q?5XnDaM6P/efyz0gHftAypI7vFl44+h5II3ylWnHvdOG7bMtVorlu87Jc6i?=
 =?iso-8859-1?Q?ETbPRt6EhcARCJsiMDdTvI9AEdxp8fmHF/QLBtVWq93chvjreS5UmHmug6?=
 =?iso-8859-1?Q?tzBo7q8XtGZuzqKvh7Vq6rKNa0aCNq+ZWkRA6iHs+WXXbqg2dssSXV6YB8?=
 =?iso-8859-1?Q?6TdG9Vc9tFCfIP5yepkKsZ0iC6zvX7GYNyK2iLLW8XMYsIeODYs1UmMEB7?=
 =?iso-8859-1?Q?LIilV0eVtD5Q8lwEbJh+2d4dpCO4qVlcaaoo3dkjroq87P/jsGWG8I2gs/?=
 =?iso-8859-1?Q?lLZOP83axLGhiqqqN0qwxwQ5BT0zdLoEjB8sNaKGZlO/ohnjjhGPiMY/KY?=
 =?iso-8859-1?Q?s5I6166k3fvEZHo/hK3UkD14+uja4twDk2fPTffgFFaNZRuAjnWcuMPZa1?=
 =?iso-8859-1?Q?9XValRHHl2RdZzfsovhn2m/Q/zWtfVcyAeNhls4uWy8+itIflaKQLTqPAh?=
 =?iso-8859-1?Q?fGa928mFiqQ6Sq0oAkTpWyQjJNZYsKJK3qTuC9jGy3/YmCE+O1n+07AjLW?=
 =?iso-8859-1?Q?dh4jDojA6ITfsKDFksbZrtL6L1RyDk3FKyDLw3tIntQpw1/UKo0n80uGTC?=
 =?iso-8859-1?Q?UiRu+pyi0eMTaLxdUMDKnL6IJIwgjbJfpClepm6cf4Gk2uq3lUcbGp/0fI?=
 =?iso-8859-1?Q?7RzV3rbFJ96CiZU0++m47S+MoJuv4YXXudxbNKQ9RxgTZN+V2baclm33ET?=
 =?iso-8859-1?Q?9LwrIJPxzTY1OikSC0GFBiRVx7Nz0o8Vvm7wqRDolqmTcAwmzA0O/RJUp2?=
 =?iso-8859-1?Q?JBjfDJSqRPNdOsen7FE7a9qlKDF7bOE=3D?=
X-Exchange-RoutingPolicyChecked: nXbjiPlyjj1WpLZAYP3blw3CiZ57YxwKb94VADSHyn7L107pfLi58jqWdspm4R30fmhNTZ9R7FxyrXGVTVCOa0VBNcHqCzi7b/7qnX55CWVIt1XnubFKVwjAvuQ7YsSVNl6Dh4HVZUgLq1H3G+WihwPydj1Jn16fdD9Q2feDJtN4gJLpjm6SGTl7PGtUjhlYVcszdBztqN2Y5WBnqeQ8k6uOMX35O/fvRbodjDkeWyEcdrImom8jG4leG/muw3lbUPlKWSoTD+AgJGeHmy0guNuE/mwKP941HQaVC2EtMOptJcwU/v818jOdkDGKqtCkmcUVxd/2lQKoXiuWd+3jIA==
X-MS-Exchange-CrossTenant-Network-Message-Id: ee2c950d-937f-4173-8ddb-08df092a5146
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 19:42:26.8530 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 64YyBwn40CiJkmiX7KEyWl6Z6ut6EnnkZwNhxs1Bsgqo3Ook03UQ/pVdC6+qFJB1MSDuVLZA99/VLeCKZ2ViSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6942
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

On Wed, Sep 02, 2026 at 01:41:20PM +0100, Matthew Auld wrote:
> So we can easily check if a machine had the CCS bug, when looking back
> over bug reports where we have the same machine with newer kernel.
> 
> Example print for a machine with the CCS bug:
> 
>   FLAT_CCS base:27bbff800, aligned:no
> 
> v2 (Matt B):
>   - Unconditionally print the base + alignment
> 
> Fixes: 37173392741c ("drm/xe/vram: fix ccs offset calculation")
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: stable@kernel.org
> ---
>  drivers/gpu/drm/xe/xe_vram.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
> index 7b4478fb1697..56cff1e44530 100644
> --- a/drivers/gpu/drm/xe/xe_vram.c
> +++ b/drivers/gpu/drm/xe/xe_vram.c
> @@ -90,6 +90,9 @@ static int get_flat_ccs_offset(struct xe_gt *gt, u64 tile_size, u64 *poffset)
>  		offset |= offset_lo << 6; /* HW view bits 31:6 */
>  		offset *= num_enabled; /* convert to SW view */
>  
> +		drm_info(&xe->drm, "FLAT_CCS base:%llx, aligned:%s\n", offset,
> +			 str_yes_no(IS_ALIGNED(offset, SZ_128K)));
> +
>  		/*
>  		 * Everything below this offset is handed to the VRAM
>  		 * allocator, so it has to be the *first* address the
> -- 
> 2.55.0
> 
