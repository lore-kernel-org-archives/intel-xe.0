Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD4E2C83F17
	for <intel-xe@archiver.kernel.org>; Thu, 10 Jul 2025 18:31:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6577810E238;
	Thu, 10 Jul 2025 18:31:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cQlM77zF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41FEB10E238
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Jul 2025 18:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752172294; x=1783708294;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2OKztp5NcjaVTfhbHv/hqjrAOakGYqqwHE82wOwVdms=;
 b=cQlM77zFvXUD3zxOKXi4bIHpu+cTTbEuOdCiUlJApXsJTTazwNFTu1fq
 wPaeE7lNfUZex5LEkkFbrzgjEEx5n1IY+o3OgW/4DlksvuSSXmEWmHbpN
 t6GREMteAlNx9FPUN3MYfj5NWTwyLfk1qeoUrsBavJfJBHBkBqkMW9Rkl
 DYMRVHPpV1PaEhhSvt1DFCa9rkxWBsAm2QhHz1Oy4mBQ5udzP0Edm80yq
 NorQsAlWHLEljXYLOtbwj2yAvnEvh8a+MPmH0KfZHRK8MFJFdv+YvdEAF
 5pcrii+zUnHzqvYYAupw7Q+6X+o3bQb5G4D2CTZhyazVlrtmWnhcaqCXr g==;
X-CSE-ConnectionGUID: 2h9fBLVfTUutqHuxIRG7xA==
X-CSE-MsgGUID: iukOnsXGRT2mkjklozF8Dg==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="65164322"
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; d="scan'208";a="65164322"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 11:31:31 -0700
X-CSE-ConnectionGUID: K08seT1pSGaNm9bcPcebtg==
X-CSE-MsgGUID: wjo77eBjQS+LQqGZ78YG8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; d="scan'208";a="155940836"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 11:31:29 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 11:31:28 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 10 Jul 2025 11:31:28 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.50)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 11:31:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O5LMoWUHgh9fRo04HMeBp+mbhd9hqG1KrvqBVhhUvEhEWTvDasJi/0DABKGKmKesicNYCM4j9449x2uU+gx4QLk5tco4o30mblfDsFdwUizzLW9bXTk89CHO6xY/KfR5ys6kXX4ZJ6yAmqpj8YBd0tncYcDOI96lAIbS3DcsQNF5rRT7umWj5Tdfk+4w7qHmUzbTbGgcLQRzsoX14bakI5WrkeRI6fH+Yeph1wSw5lEb4/Yg9tQ/IVLWtFXNmTXhu2rMaCKu2BMqS8cuH59WxMLfV0hEmMnS9fJ6ikWwAf1j7htSCi1wBMTn70/DQYuhYPzu8Y15znQTVNTyUFfdyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LtdGpTEUOtNPv0ASJmGc321yhPKRJyt7KTtWCdH+R0c=;
 b=xuoVIhI268XDfZZHSnKuCLn4e9wx0tmVn9K13RV6xME8M3H9jSZQbKsVQqYTATm8axTJrsR5EgBtIc7o24nq4xcwvPj+L4K25K5+/2XKiGZLeiA0voTG5qNxXO3CawW/sxK7NOCi+BpD+HFm4ttPp9skNslK6igUGV6SKMUebTNN58JwtnassvBIZhqaE1uLTXx/Tp1bs5ADC5JisK/ml/Z0xU4NEOHzMzWjR8zgZTsXbGM6pnytgLYHSl36zrpIu7bBa/H42GFyZUe6gBOXDyFTmajX5qw7Jy7xfAVU2hXCU7yYgEYsW45JJS1iWayk+u6OYdIuEvBNagnc20FQqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW3PR11MB4522.namprd11.prod.outlook.com (2603:10b6:303:2d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Thu, 10 Jul
 2025 18:31:25 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8901.024; Thu, 10 Jul 2025
 18:31:25 +0000
Date: Thu, 10 Jul 2025 11:33:09 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 0/3] Cancel ongoing H2G requests when stopping CT
Message-ID: <aHAHZQBEcIu7VWtt@lstrano-desk.jf.intel.com>
References: <20250709174038.1876-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250709174038.1876-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MW4PR04CA0228.namprd04.prod.outlook.com
 (2603:10b6:303:87::23) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW3PR11MB4522:EE_
X-MS-Office365-Filtering-Correlation-Id: b192f620-cb56-441c-db96-08ddbfdffa71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Q/AzY8pQFsMOPPuhhpxS0EYLXCgkO9UkBWEBnZfynx3saMBZ/8lVHVWGtaz/?=
 =?us-ascii?Q?/qveZ2dxCynBZgXpcC69s8A/EP5qZCXJMDMl/6IPTpjdBEyVQMq76rW8AsoI?=
 =?us-ascii?Q?8Q+Zl0+De5T9wk6htByyTbuf54641NsYxuYXfXV2wOzRyFT8rce62IR0toNs?=
 =?us-ascii?Q?8vvGHMvyJZWANb5UFtv8YX2IutHsaqf6/s2d5pmR2rRx1SOB6IjxLHN7nBui?=
 =?us-ascii?Q?+31CZHrL/zPIOxJEE8fwJHQWk2ZCrgjPW9U6kC3isyzpnNOGM05j00STN07d?=
 =?us-ascii?Q?Am7TtclHykOW2IyPdh49Lq8cSNq/jMUMwoKxRZy4PH6hNgD540jPc/Wq3nT3?=
 =?us-ascii?Q?gUzcz6kMijheg3VO1Emq9oeyW5pEzvVCu6VqpFyF/JgOupvIUw/m9jK+Q76l?=
 =?us-ascii?Q?n0A0gjAbbGRF1X6qddnk0+4FrKRK0UUXcAR7LsW9C49a6K1iJuJqHxFJxPfN?=
 =?us-ascii?Q?jihUl5E+TrWZbq7BuxKQ2udT8pj7qjBpr/3iyp2W7UhDknCrzd4kQDomhPz3?=
 =?us-ascii?Q?w0mwQ6iPdv9N0u0mAXupNWv2Cmt1YZuo7a4AWno1+rmAuKXCaR6eIc6qQ1ej?=
 =?us-ascii?Q?BQgnMzguGAoQSadeCTn0+OTxZKCdgBY2ypjPy2mq9kmoA3niWukjZnZj11rP?=
 =?us-ascii?Q?nl+MA8rgulml1p3egdRWuqgfSoOhCPbxUPEJNgDGb/5nH/mbkPYB+YKMcyCb?=
 =?us-ascii?Q?DshPWRgCIDXgApRAMqFs26YejKliR58njpxmj1jgbCSG65eJtjy7OjjztK4b?=
 =?us-ascii?Q?yAmVgXA7XXbtbmp1iisN2niZMDYZiGtn0A2yWhNlVuyuOZ9+MKnf9THFw8rI?=
 =?us-ascii?Q?gUNZOmO9N97UbzZlX70KopDiCuq7hKd1ogCrvz7vN/3ZpkeaTkjUyBFtQW4d?=
 =?us-ascii?Q?ci8wqQCkRYUtERK2D6p/WL04oGmO32NIPtSVGMOqPX8OdvPz+bmmfKKygE03?=
 =?us-ascii?Q?t8l7UfzzFRUEKciS81c/F9B96zRK9b4YLwUDpqaJBA+xNJ+39g8tnfjgPRuw?=
 =?us-ascii?Q?LTerSgO1X1XHi39WiGWgWsjfC38mXMuQtRAQoRadQ7/H7cpPNEn0Gx38Ywas?=
 =?us-ascii?Q?qH+nsLJ9SttreW6/B4lAwkzXhaYv3yNL/TmWFvzaxFGYvIAnBw3A0tmwGqwK?=
 =?us-ascii?Q?9sTcH5M1e7JI8odNKcR7lhpQL3joMsr5AZJpxXY9lLwyX8v5urLpTjgaUdSu?=
 =?us-ascii?Q?s+xnosqCOPRkaaRyI0Cr8kJTjHelekvA2JTb8EQO+I+U9mSISTAjT+lGxIe2?=
 =?us-ascii?Q?hYjrFyaINhae0gzjauKJH8xIIfXFClMqD9ETiWiI/qx0yxtwyjcBATe3fZqw?=
 =?us-ascii?Q?d39Kvgwz02ahGCRGnXJsY1jUHZxNO247XTLLHwqHg0EGg83J/53c92zt3rfU?=
 =?us-ascii?Q?jqs280QpnfPKdIzR/jcR1m1m6HqDt1zd1ysfITvfS2qxOBavVwbtqG7OxL/8?=
 =?us-ascii?Q?Og17tqqizjk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ed2nTvG1OJj+XnKipgAmSNFT5yq3cnUHL9URXI7vxBawjqU0lYgiKeGxOZm+?=
 =?us-ascii?Q?/u6+TkYmFFanYsoDFyXjoZEFKjcjBUZYNIaalfWrs4cTAikAk9ca4ELn+xBn?=
 =?us-ascii?Q?iqJidg6mkdYniUC9n8QlwOsKC5GdFmpQDon8WYpsCI2sRLN6KWK9WGRxNg/D?=
 =?us-ascii?Q?gtGGlkRGZfFUR0WyET9VlXYerKl7Dxqwc8Y5Nk+inoJ8XCMIqrr2noyXwNT3?=
 =?us-ascii?Q?uNzaTVkgEaw48HZIWCDDxWlosEeeHr8IlvZEMfg3pByqUbd4D7BtueOUV+Gs?=
 =?us-ascii?Q?SdxUIG0aztePkdfnqH8jQLs7NWDzXr7JSOFWGz/uZCiXOaX+aRzBrczyezIZ?=
 =?us-ascii?Q?CcV1oRy/UP6A5Nf5xrb65OcfudW6+bloXrDFmNIamfEwbFbymnW9Oxel+AHr?=
 =?us-ascii?Q?sObqYbskpNwrXFH44ZPDKBJUkgoSncUjp0CHqGhoDd32aOUXW0ESVbHvSshz?=
 =?us-ascii?Q?Sgcwo1oGJGbYh3JQr6tvU1AqwAeMq0n3pVS8lJYTN/pVVotn11+nLylR3UW0?=
 =?us-ascii?Q?bBCXwgA5yjHazImGfNzJswaqdQFoTzveipqxUThR31M/9PF0xybzNcgw0zkv?=
 =?us-ascii?Q?+FK+BSvqdJLEx69hTS/GD5v2JaTeBvXKEypfpUYM2BRdw7Hrm8Cd+dT/txDo?=
 =?us-ascii?Q?BbRmjPbcRNE8qkIHgRNPAxhkVmiCcp0gBKQiGH5rUN/I5uZbSCfSVEmvauGi?=
 =?us-ascii?Q?2tJ6VfK0W8y9JVj6Z5IKKaBw+0NbYMa5nKqF8VRBWi7fiLHhlUcYE3ekjBvF?=
 =?us-ascii?Q?102P49Bl0cLso+smL4UJUWAfExUAgUbalbXpoC6u2rD3JO1d5K2OPrz9usXb?=
 =?us-ascii?Q?zSdgSk/5Jdyxqs6iMcZj5QP2LvbOhhVbw4UhrKANwzddWnQixsZl/uJHfMXt?=
 =?us-ascii?Q?p0hlp9CosLDzG1B0ChkKR17Ce6NsjLMuFtuq1/T//cj5Moqb3yEaqirwL+ov?=
 =?us-ascii?Q?zsdmTDOLfo/nfQytKcUdQyolCA0dOV7rU7qA509ZGfAR2m1xeKryiclq16ly?=
 =?us-ascii?Q?4Jy0DKOX6gKV2ED/yrCvHqO2moZbUBZrjzZOlwh0FDbJJETWotLDbGl+6sHS?=
 =?us-ascii?Q?2q+Rv5eZb9vq38C4W8pSA/3523rWJXfnojbbK2PkxS33qEaXh8iH6QazlS6R?=
 =?us-ascii?Q?SZ3t2TVFJUvYgcd//qEuTTFnli/NmIogHS0Xa6A7zqnGOmNdtjOSAdnh9O7t?=
 =?us-ascii?Q?CrYOyh00AFiCdJGIfhD4uJDGQg+HWoncJmdZTeC1w3cVmfTX3RBAmshuDxr4?=
 =?us-ascii?Q?ShfCYI8vWQqNBq09CVzzm98vU22Xi99AOjVuo99/hbe1pBPBKIbEiZCp06Nk?=
 =?us-ascii?Q?qFzzR8t07Ptc0q1YShVDbT2C0TU0SGBBFj618ffdKjytPszhZyYR4nNZ3whA?=
 =?us-ascii?Q?kQVYwjIDP9YOMFtmEQG/Gl435VHd/lraV+gWjvKdX1pCjSpWxMOeCf5jHC55?=
 =?us-ascii?Q?+AQbKc+Nnze0J4etr0JC1eFod28FjGC0SmvK3WYK3FIigg1jcdszVeg4F82a?=
 =?us-ascii?Q?sC/ObeDfGZcKBB6qzpRxfBUTIYS5fwBanB/BepHyxlSqwF5HZqwQCQEHsqFY?=
 =?us-ascii?Q?9S4WQboziqw9i+6POrxFx8EbyhfYee2Qb/Ye2UbyV2UOcIoeE5hT9DWFq/Nh?=
 =?us-ascii?Q?rA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b192f620-cb56-441c-db96-08ddbfdffa71
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 18:31:25.8195 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AAOG5AX8v/BiVQHjtyjpXj2QvjAx/kPmBf4kXoKcCkUKv+mU+WjPLpM1lwVC6Xc7yIi0/rzKgTRou/hfuDPjdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4522
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

On Wed, Jul 09, 2025 at 07:40:35PM +0200, Michal Wajdeczko wrote:

For the series:
Acked-by: Matthew Brost <matthew.brost@intel.com>

> Michal Wajdeczko (3):
>   drm/xe/guc: Rename CT state change helper
>   drm/xe/guc: Move state change logger to helper
>   drm/xe/guc: Cancel ongoing H2G requests when stopping CT
> 
>  drivers/gpu/drm/xe/xe_guc_ct.c | 39 +++++++++++++++++++++++++++++-----
>  1 file changed, 34 insertions(+), 5 deletions(-)
> 
> -- 
> 2.47.1
> 
