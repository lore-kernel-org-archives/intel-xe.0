Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4168EB271F
	for <intel-xe@archiver.kernel.org>; Tue, 10 Feb 2026 22:20:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42AC110E071;
	Tue, 10 Feb 2026 22:20:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V5bU9Uqy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 984A010E071
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Feb 2026 22:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770762024; x=1802298024;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=F8NqZCTDpcOK5uKTPMvGSDW5CrheaTKEOS5CbuSUokQ=;
 b=V5bU9UqyLTAapBMDi1+NjbMWG+ULzdAnJtOzGqQ7swIOMr9SN3f404rn
 VpGjMLYctNNpoMgTSOKv08TvA/GeC+epBPg5PjIJ/+U9y8yFXxn5k1DYO
 zQL5w4bzrk0TnS3jNphF4SNn9l9BNcthg0LUwrrF7kZqJWTKMs05I9eRi
 9nmjyDUYh42iSS2YXcFnJdxrIQKhWZDXje5beJOBjDSeNPsEg9SCbSKp7
 DkBu0tmubbjbjDOiwDK83nKPavd3j/BVaJ1QcM8H/vAOAlHp9uPkvh2uR
 j9y9tmUygffE9S9qu0OO6+FFyvh9pBsQFu5D3MwOPykHt+3wraz8wChCY g==;
X-CSE-ConnectionGUID: M8ZN9pv8Tq6Cpaje2umr8A==
X-CSE-MsgGUID: xXBnt2k3QdCFQve4AgM8dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="82224552"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="82224552"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 14:20:23 -0800
X-CSE-ConnectionGUID: BWp1mR7cSGS8OFdhaizSXw==
X-CSE-MsgGUID: BVMX/C34R02Bmi4bfcPnhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="211677968"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 14:20:21 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 10 Feb 2026 14:20:19 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 10 Feb 2026 14:20:19 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.67) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 10 Feb 2026 14:20:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=It73DAnW9dHNpASNZUPQQRjnd5mqa5RNvEu7iIBeTPRKK7Qd6kyeX40+5zECsaDNWeAvY9kYPf+IGlQaj2ZtNDpB1RTTeIMkWpOtOTLQaV8GL8/+sFdKAgF9UQRq2DW53TfOr69DX/MgV/7vN+oAq31TsukNh2LBDmNXnzw3WNqMJHv9L+koULJTj2XLvDj+04z/d9CIE+idmgwfb+pDTLz0+ldce9ZlsHVkdDMicF4rZbnZXK1AWSVmOQZcbu+oBZlFSXdB4iHQqQzIBd4HfAFyRwazf8qMmJGbnO+/2EASyYIN+RLqcNqNcVAAG2z2edIAZHnHU77PVXGbn6GDBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NK0TJbq+lfuU9L1+JoChx6+krcliHwzkZQb2PEfZYik=;
 b=F764kMkSxDTB5x6gzCNMcsG7ovIinxwwypajGVqP7zNXmUdW3OdbDQLrlldwKiQKb3mbNHBvT1VCpsTvG+7+z6aqHfdDM41PtNELhi3Xs8ZFGc8TdxnXr2nAAPYZ/4BjTR7LlgCdTD19QPc16VD02gJRXZeRTUONktf7iou9p3ggGsIUZkmI013On38TdtTAJ05AWw1q+Ow3bgNRcO2Xu0/hLmg4O9nLi83x7YTcdggZxXY7pl8um2wypgDHu0NJA2FpkHsFZtmMFDg1jYEzngrpOW/FHt5QyqwhHrJuxCVGRWwqcb3VSTN377MpylPOs6B1ZFs/ivK7HNaRsGBN7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by BL3PR11MB6339.namprd11.prod.outlook.com (2603:10b6:208:3b3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Tue, 10 Feb
 2026 22:20:15 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 22:20:15 +0000
Date: Tue, 10 Feb 2026 14:20:13 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 3/6] drm/xe/rtp: Do not break parsing when missing context
Message-ID: <20260210222013.GG4694@mdroper-desk1.amr.corp.intel.com>
References: <20260114-rtp-rule-parser-v1-0-fa9029586bff@intel.com>
 <20260114-rtp-rule-parser-v1-3-fa9029586bff@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260114-rtp-rule-parser-v1-3-fa9029586bff@intel.com>
X-ClientProxiedBy: BY3PR05CA0040.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::15) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|BL3PR11MB6339:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c359327-1b97-4439-3e70-08de68f290f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lYXqWSG/SEQ2cRWELw4jBYVXblneFVgQeWooAIvEDfC+AuXU9I6thyD+LbMd?=
 =?us-ascii?Q?e30J1aFP9esnApQcNf8XbDq04JaC7nAExtmJEaz1VrixByT00muWqMVAHo5k?=
 =?us-ascii?Q?2w7Qr3w2XFD1iniRe2uTgTRtlfK394WOtGQRv+rKJO00BSDq/tMJrhC2kUph?=
 =?us-ascii?Q?ZssMb3lyw4HL1yZM3RwsRc+2pezksUvS5Q0X+bgkChf4N10R4u9+VbOqR7S6?=
 =?us-ascii?Q?BdWK5CkiAQQWzDbqVpmLl3bv/CZpQcsGWtX/lRrzF0tXZ6pnK4mKPBvuLow3?=
 =?us-ascii?Q?9ck6X4iVmcxrCROnaZUTRZSumlEBmBXojkMyRCm2V9A3dlxzehzWU4HtlatQ?=
 =?us-ascii?Q?F4ek/pyWWeabiW08c/nPUBOEbygGKuqS6Zr2ZjJedJwQR7OjPyCmrOYbGmUK?=
 =?us-ascii?Q?/9CFyFVzvWJ7s3gp98f5lBsHIT2KQ1/vZoKbxC3zvvkltObQqiVECtlBTjrH?=
 =?us-ascii?Q?yEDkhMvbEeHJ2jfd8BTQLZ9DefGnhC18lQOA5JVF2jVlhc0MoBtG+DrPPzXp?=
 =?us-ascii?Q?d7CYX9H0AvPRRND49im5HMQpAEQG6ychS6Q+TCXJ9la0GNIdmTMDqDK6nkAY?=
 =?us-ascii?Q?rJaxHbwW7IDyF95BVR0YgsAPRMptJxG5fTQqh2GzIHRIyK9jEyWFkYLCKSXp?=
 =?us-ascii?Q?Nz5s62SPidA7OL3l+jDqwHWKDKpuVR9FtyWd5TSFBlQpq4QR3hIYHmLyzWkA?=
 =?us-ascii?Q?yieFlMKI8dHS2wgFR3ux5jQhFk8ZM+GQAEer6O8wxRd6uXMLjKapvlXixLSJ?=
 =?us-ascii?Q?6EpvJTIUpyTHUeA0jz4O06H1jEY/042GaQznlBUCllrf6UKrSj2jefEE1up0?=
 =?us-ascii?Q?5vHuhmXx/hNdws/IF52OMOYIBAY8VRI9zyzhr5PLhkPqZJeApxXcnE2i5uB4?=
 =?us-ascii?Q?t5vxlzTLC2c2UwypvIR9cx5L7NcZO00S2V0R8EGZJyZiwLa0MkA//m4yztmv?=
 =?us-ascii?Q?YYZ+FAAQ/bwIuitq1tL42SCGZF5XjsBrRqFYJ74iLjLzwo+FJaT0+Ic6PVS2?=
 =?us-ascii?Q?7XWM+Cs/fDGsQnD6JOJCaqZbVmAjkaLaWEIFCGHFh/frfjxiF48mpc4cK8+t?=
 =?us-ascii?Q?ULZf1HXlrUYDwvax22kw8M4aZRSWrmAnTbDKt4yIrYXyzu+Vb7dxSWJm0Bgl?=
 =?us-ascii?Q?WevEeHV7pPE6hsHdoTGiVJqkN8UGhh8SPg+efy3Is/nOH6M33A+raAHG9VDt?=
 =?us-ascii?Q?Hg9pYsrg1xUi5Zi5/Z8ftN4lA0rhRrteuXX0PjRJlzc3w2cRLfhPjnGZU2ST?=
 =?us-ascii?Q?Vfcvcqfm1Ka7uVWndiUtHK5GZFCGpT50YTDCbnbg/Lvbw0kzMSutpoe9yeh5?=
 =?us-ascii?Q?ZrUoayOPqa+wuW4PV9rJ5CNZ6ifhSyNlThWxIGeZAlVQkUfug74EPaKsUs0v?=
 =?us-ascii?Q?FA8ZfRZ5ltHoQTr1F6T+cT0DiZuOHzFSWTsW3/tItg+dmcMAlv65ti6LcFt/?=
 =?us-ascii?Q?qFgEkVHhAoy+iOGFYSah6247wjtzglrcpTmL6BGBiHG3xlYlb/lZ+I5mc2HL?=
 =?us-ascii?Q?0c7/XMf/Od4xTfozMNVXE5AEJfg72XRGtJB3vklQy1kBHJAauAkKNbXdxLyD?=
 =?us-ascii?Q?4oJcCC74AKePDf0OuYM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?m3RbnvJN/hlhFUMWmzCC+ZnvnDKgIZHWsKmO4qy+XXxfjBGPbCl5BIX6X0Ch?=
 =?us-ascii?Q?ZfIfiSJsSqbSs6UqVt6VkbPMv7CBiB7NSw3z7CeZYwz1BUVW1sR2LKjhTBCg?=
 =?us-ascii?Q?IzQ5nMafabPcf2uPTXp5yf0PJh/qO8CcvLhjDraxbrIbSxQ9+xEUuPXiJuRN?=
 =?us-ascii?Q?vHH7u+Togf8imUFbJMH6GYbj3frrYHeOZt4unCAusDhdCAuEnI/TW401qijZ?=
 =?us-ascii?Q?7R57znu9BZsOHflmedmCSWLpt1wUfpcpNduhKHTQSfsKkY36MZvciuxtlAHt?=
 =?us-ascii?Q?Sa0Dqf8/fyva+JhUGfWQ7Y+WcyalVXTmOnmhSRtx05Mfsur8WpvDWixISfD2?=
 =?us-ascii?Q?rcnKIuJOTRlMCyz31mh2NVrbuTmgkEKpB8zevzFKyxfG9GW1lC94ikX8pzVi?=
 =?us-ascii?Q?PtYgg0UjaKjZ1A7LDQsoWyII1bBG4yF4LnB86WiDP54OXkoFrmLMX71WW3ha?=
 =?us-ascii?Q?zUFTR/2imjPW17RfTaN/GneFtQYzmwWVRTPxLULUrg+TC+cnO5FJKDtQQ8Z4?=
 =?us-ascii?Q?xMJwSfnDEpeQtAFQZfU/hdnJUpmgXMBIPFnn6O6cCkLCVbIFUW9BMPR/Vu/g?=
 =?us-ascii?Q?6oJC+9Vcr2qIEjum8bWo4vw3LTt6mYwz8ZJ+Z2ue/TTeZ/9sYwOOYTzUQrci?=
 =?us-ascii?Q?0pK5/ymT5NT6NbB0Kv2baCmPrssTy4m5Tcj8N3l4Ffi/YKBWSqsNAGuHHpZK?=
 =?us-ascii?Q?yoau9Zzy4dJ+MhFbwI9mtz3v7YywmZtdepMNw0gj76a56WYnl77PRFzF/P1q?=
 =?us-ascii?Q?MUSPilq8M6iAWkBW++gaZzWku+ZJk8KD8zzcugLp3MZ8jQzTkc9CCzbuNUUs?=
 =?us-ascii?Q?6Ak6sS/BEVYJ5mNEs6s76mqrrasiz5F+aQHhvjD62UqQvshVIUcCYKvzUVgx?=
 =?us-ascii?Q?dLf66eCtvMgCLH3HKJxAUJvmFBJYU6/cc0qrSyTpllNvqbIQeVUzwhRI7/ky?=
 =?us-ascii?Q?WOyKHgx6JIr0N+CsHsGLqxv2CmyaQDcT2dFGF7eHk0Qli6qhS0CQ0v68RKAl?=
 =?us-ascii?Q?h9Kzq8WbY3P3TT/Uwb4F0huSyHRdJgp4b5Jgtrd0Pvt1HBd6cZ+7mwvTfSsF?=
 =?us-ascii?Q?gvTxW2m7wVtNsvf9WRB+wCSYSvZslEzrjLLmtbi+A7vk0EBMA1iOJbNJQzYe?=
 =?us-ascii?Q?UL886UZGFeVSOvIe2fIwvPFj4dETx2GDzWPgPnthFbIH/qqBw6wqNM9iJIe8?=
 =?us-ascii?Q?6slZg5i8pLY5p4Ir3CvAOruEd8DNromRWm+At9DeDlpEow/coZBrLMDDudlz?=
 =?us-ascii?Q?n2hgblFbY/Nd/RICdmvqIwy/0EkKk6WztGoRWF03g+Q/quZr4yOH0/wiDsXh?=
 =?us-ascii?Q?/oFgMO/fpOWj7mhhvT/+MBLwUJgHDIl5g0KE2UYDb9/nAK3t/14+1XVzSaj9?=
 =?us-ascii?Q?6KPrYAnel8vpL9S+9peLIfTRZgresuwW0fogm46drpkllVnOc9IuGdhq2qcQ?=
 =?us-ascii?Q?Q2OIsHK1BjnZ2DJ+j/PR5EU1vyOZmdxHL/2XImzQ5vEoyZN3mzVvVP31GeY6?=
 =?us-ascii?Q?xt0mBfYNsnwCnNNs8YB6wUr+O2bVoqqoJhLIwl3xFq0q6NZLf0aD/uG42FKC?=
 =?us-ascii?Q?n2jMRJE8yJukCpV/ay/cFVnuaus3eVGcV98lx7OzIjQlrhQrZVykCXY8rwLn?=
 =?us-ascii?Q?MPt9ge0wQVeaKrs1L2IYSKooevInmw8tkVKRFeuyEZ2rQxn6N/AgCd+5TGDT?=
 =?us-ascii?Q?7QIilep6CGjrYuIKZXivQDvRObcgKJ6ggz2HAFvHd2jc6ChvykVekcP1Mbpa?=
 =?us-ascii?Q?DKXlebTY13ZWcgj66E+LcYxlc9G+k4U=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c359327-1b97-4439-3e70-08de68f290f4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 22:20:15.8065 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FUyUqFHDQeKfPKLVeVxJWrrpyWSe5hC3NpN8RSHG7/nAQ1/gvjgxcs4w7J1kUzBVEKyVio8MQfDnJ4x4SHkuUcPNoARZIwJibqCSTbJC6PQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6339
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

On Wed, Jan 14, 2026 at 07:49:53PM -0300, Gustavo Sousa wrote:
> With the current implementation, the RTP framework will cause parsing of
> the rule set to be interrupted if one rule requires a context item (gt
> or hwe) that is missing (i.e. when the value is NULL).
> 
> This is arguably a semantic error instead of a syntactic one, meaning
> that RTP should not interrupt parsing the rules.  With the current
> behavior, we would miss detecting other errors that could appear in the
> remaining rules and could also prevent valid rules joined by "OR" from
> being evaluated.
> 
> Make sure that we do not stop parsing the rule set when detecting
> missing context and let's add rtp_rules_test_cases to reflect that.
> 
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> ---
>  drivers/gpu/drm/xe/tests/xe_rtp_test.c | 28 ++++++++++++++++
>  drivers/gpu/drm/xe/xe_rtp.c            | 60 ++++++++++++++++++++++------------
>  2 files changed, 68 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.c b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
> index b2286dd9d92a..19c7142b2fe4 100644
> --- a/drivers/gpu/drm/xe/tests/xe_rtp_test.c
> +++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
> @@ -177,6 +177,34 @@ static const struct rtp_rules_test_case rtp_rules_cases[] = {
>  		.expected_err = -EINVAL,
>  		XE_RTP_RULES(OR, FUNC(match_yes)),
>  	},
> +
> +	/* No match because hwe is NULL. */
> +	{
> +		.name = "engine-class",

Nitpick:  The names for these tests doesn't really make it clear what's
being tested.  Something like "missing-context-engine-class" might be
better?

I'm wondering if an even more useful test would be one that scans our
actual RTP tables and just looks for anything on gt_was[] or oob_was[]
that has an engine class rule, or anything on device_oob_was[] that has
either an IP version rule or an engine class rule.  If we catch those
mistakes during early kunit testing, then we shouldn't really need to
worry about what the behavior would be if one of them survived to be
parsed on a live device.

Anyway, the rest of the patch looks fine, so aside from improving the
names,

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>


Matt

> +		.expected_match = false,
> +		XE_RTP_RULES(ENGINE_CLASS(RENDER)),
> +	},
> +
> +	/*
> +	 * Missing context (hwe==NULL) does not cause parsing to stop, hence we
> +	 * expect a match.
> +	 */
> +	{
> +		.name = "engine-class-or-yes",
> +		.expected_match = true,
> +		XE_RTP_RULES(ENGINE_CLASS(RENDER), OR, FUNC(match_yes)),
> +	},
> +
> +	/*
> +	 * Missing context (hwe==NULL) does not cause parsing to stop, hence we
> +	 * expect a syntax error.
> +	 */
> +	{
> +		.name = "engine-class-or-or-yes",
> +		.expected_match = false,
> +		.expected_err = -EINVAL,
> +		XE_RTP_RULES(ENGINE_CLASS(RENDER), OR, OR, FUNC(match_yes)),
> +	},
>  };
>  
>  static void xe_rtp_rules_tests(struct kunit *test)
> diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
> index e955df6c22ca..e0bed5ac1369 100644
> --- a/drivers/gpu/drm/xe/xe_rtp.c
> +++ b/drivers/gpu/drm/xe/xe_rtp.c
> @@ -61,60 +61,76 @@ static bool rule_matches_with_err(const struct xe_device *xe,
>  				xe->info.subplatform == r->subplatform;
>  			break;
>  		case XE_RTP_MATCH_GRAPHICS_VERSION:
> -			if (drm_WARN_ON(&xe->drm, !gt))
> -				goto error;
> +			if (drm_WARN_ON(&xe->drm, !gt)) {
> +				match = false;
> +				break;
> +			}
>  
>  			match = xe->info.graphics_verx100 == r->ver_start &&
>  				(!has_samedia(xe) || !xe_gt_is_media_type(gt));
>  			break;
>  		case XE_RTP_MATCH_GRAPHICS_VERSION_RANGE:
> -			if (drm_WARN_ON(&xe->drm, !gt))
> -				goto error;
> +			if (drm_WARN_ON(&xe->drm, !gt)) {
> +				match = false;
> +				break;
> +			}
>  
>  			match = xe->info.graphics_verx100 >= r->ver_start &&
>  				xe->info.graphics_verx100 <= r->ver_end &&
>  				(!has_samedia(xe) || !xe_gt_is_media_type(gt));
>  			break;
>  		case XE_RTP_MATCH_GRAPHICS_VERSION_ANY_GT:
> -			if (drm_WARN_ON(&xe->drm, !gt))
> -				goto error;
> +			if (drm_WARN_ON(&xe->drm, !gt)) {
> +				match = false;
> +				break;
> +			}
>  
>  			match = xe->info.graphics_verx100 == r->ver_start;
>  			break;
>  		case XE_RTP_MATCH_GRAPHICS_STEP:
> -			if (drm_WARN_ON(&xe->drm, !gt))
> -				goto error;
> +			if (drm_WARN_ON(&xe->drm, !gt)) {
> +				match = false;
> +				break;
> +			}
>  
>  			match = xe->info.step.graphics >= r->step_start &&
>  				xe->info.step.graphics < r->step_end &&
>  				(!has_samedia(xe) || !xe_gt_is_media_type(gt));
>  			break;
>  		case XE_RTP_MATCH_MEDIA_VERSION:
> -			if (drm_WARN_ON(&xe->drm, !gt))
> -				goto error;
> +			if (drm_WARN_ON(&xe->drm, !gt)) {
> +				match = false;
> +				break;
> +			}
>  
>  			match = xe->info.media_verx100 == r->ver_start &&
>  				(!has_samedia(xe) || xe_gt_is_media_type(gt));
>  			break;
>  		case XE_RTP_MATCH_MEDIA_VERSION_RANGE:
> -			if (drm_WARN_ON(&xe->drm, !gt))
> -				goto error;
> +			if (drm_WARN_ON(&xe->drm, !gt)) {
> +				match = false;
> +				break;
> +			}
>  
>  			match = xe->info.media_verx100 >= r->ver_start &&
>  				xe->info.media_verx100 <= r->ver_end &&
>  				(!has_samedia(xe) || xe_gt_is_media_type(gt));
>  			break;
>  		case XE_RTP_MATCH_MEDIA_STEP:
> -			if (drm_WARN_ON(&xe->drm, !gt))
> -				goto error;
> +			if (drm_WARN_ON(&xe->drm, !gt)) {
> +				match = false;
> +				break;
> +			}
>  
>  			match = xe->info.step.media >= r->step_start &&
>  				xe->info.step.media < r->step_end &&
>  				(!has_samedia(xe) || xe_gt_is_media_type(gt));
>  			break;
>  		case XE_RTP_MATCH_MEDIA_VERSION_ANY_GT:
> -			if (drm_WARN_ON(&xe->drm, !gt))
> -				goto error;
> +			if (drm_WARN_ON(&xe->drm, !gt)) {
> +				match = false;
> +				break;
> +			}
>  
>  			match = xe->info.media_verx100 == r->ver_start;
>  			break;
> @@ -125,14 +141,18 @@ static bool rule_matches_with_err(const struct xe_device *xe,
>  			match = xe->info.is_dgfx;
>  			break;
>  		case XE_RTP_MATCH_ENGINE_CLASS:
> -			if (drm_WARN_ON(&xe->drm, !hwe))
> -				goto error;
> +			if (drm_WARN_ON(&xe->drm, !hwe)) {
> +				match = false;
> +				break;
> +			}
>  
>  			match = hwe->class == r->engine_class;
>  			break;
>  		case XE_RTP_MATCH_NOT_ENGINE_CLASS:
> -			if (drm_WARN_ON(&xe->drm, !hwe))
> -				goto error;
> +			if (drm_WARN_ON(&xe->drm, !hwe)) {
> +				match = false;
> +				break;
> +			}
>  
>  			match = hwe->class != r->engine_class;
>  			break;
> 
> -- 
> 2.52.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
