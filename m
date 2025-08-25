Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2C1ECA0FE7
	for <intel-xe@archiver.kernel.org>; Mon, 25 Aug 2025 14:14:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7578310E494;
	Mon, 25 Aug 2025 14:14:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kBdmKf8g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E31510E494
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Aug 2025 14:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756131244; x=1787667244;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=GP32/kC9XMGoy6JOu7THC7fS6k0IFBpgwK6jVCRTwqE=;
 b=kBdmKf8gL5SwlyeHmMlOKiz5PJtpKrh0ycRC6fCQOkmGD+1seT6GsW0m
 RZNGRZr/2/RauLYqkSqPPKLicAfdrQOuG8gyzp51C7b7SoUBdaYP8n6Dc
 ax+L7xO9A2ZOgWYhxbiYDJhnRny9OW3We3VWMf1GmRUT+taHD42kyigv6
 ho433w4lKcbug6BZRfmvpeY8vGjeFPmhp9jFjGMeAjTz2tLjf5rwcPnn5
 klGfZxTACRSVK2b725vnsGWXyQSTbGXcc/6XQPdeN615e5TdAwsY+mqPO
 PHHIV+vafM9TukDILNeizbeNFMHDyZ4SbD+WN8IajDIKEmtNPYtK2O3Ir Q==;
X-CSE-ConnectionGUID: k+iNi4NPS6SzWhWU1udZHQ==
X-CSE-MsgGUID: qoN5WgzcRseIw6Qk5/62Qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="57544945"
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; d="scan'208";a="57544945"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 07:13:58 -0700
X-CSE-ConnectionGUID: KwLmxsGcT5ekw/z7ujqoZg==
X-CSE-MsgGUID: t1OSn58zQBe801L7fIy09w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; d="scan'208";a="173490206"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 07:13:57 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 25 Aug 2025 07:13:57 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 25 Aug 2025 07:13:57 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.41) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 25 Aug 2025 07:13:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rJuokNAiku4jT79Li7rLOTmyoHq0t0ZAHoqc0o/dMHTLXr7qFYGrrySPH1IfIgnUIVNnJlm4A44IkVh0JYQwClGxbwCVenDCF9/UnOrM3BYBPmikYgeouOapjsyKRyqwteandSmdS3fh+l6wgf5YKx88EinVj6L4j1SUG0+HhrKSZov1q7TGM+QiPfTA/ZqQplcCcCwI16TtAQ5PG4NhvIFPyuc+nLROhgHCK2KWGDUlkl9nzCk1CZn29PxRozJ+Fp1jH/Yla1JZzGrYTOmwoIo1kGWNuvJU0bM7w5t/cBMe9WT7saU7U4xSxWE6EKWx1egREPZsWCIVt9/5IrMviQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=skGmaB8pQOStHhkNCS8H546FCY/vEfGjZ9PY1tMX/TA=;
 b=uEuMe83rj4iKd9RmTKaQfTgbBEiLh5LdnMONA29tK4TG9Fim8uz4tLbCzuobXTzfGJN3C4oK0QrI/MKcphKUK3c3BE9eJSbv+Gl3zLrfCP1qmO5wLDHtYf/rrkyeRs7OcRzewQSIAkaUvTfXfwty6ROyZCMhvhVDCBqvxroSi7oWntyoI+7JlFlRFVVNoiPavcFaLwHAxHrvPEdTD6lTYNkYOGyjwfJHw6rLowRzz9sHqxCpvBYDbH8nGIfxsC+v3RQuBdv3G01WOx39y4nZioP4bidL7IjHNIakaLcw0bMOFvcEIdXZzn53BfJjxAVzbd1fhfMw0zDfznC8fHOyQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CYXPR11MB8710.namprd11.prod.outlook.com (2603:10b6:930:da::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Mon, 25 Aug
 2025 14:13:55 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9052.019; Mon, 25 Aug 2025
 14:13:55 +0000
Date: Mon, 25 Aug 2025 09:13:52 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <alexander.usyskin@intel.com>,
 <stuart.summers@intel.com>
Subject: Re: [PATCH] drm/xe/nvm: Use root tile mmio
Message-ID: <l5w7x7r3hnepbiivjx7gkliykvebederbx7tsqxlibnm7h2v5k@ohepki64nt4g>
References: <20250825103537.2551837-1-riana.tauro@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250825103537.2551837-1-riana.tauro@intel.com>
X-ClientProxiedBy: SJ0PR03CA0135.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::20) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CYXPR11MB8710:EE_
X-MS-Office365-Filtering-Correlation-Id: a7b311ad-9fda-4104-b167-08dde3e19ffa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xAA2z+f77ceVT0NgyZkRYAVDUwejnkh65IW1BBHWyVWyR1mJOMzyBRlChRvy?=
 =?us-ascii?Q?p4o+8Ktr8CYsTSHFfA5huaSm7H7HqzaFuEFitnbRELPGFOmPsxZlaRIRVJCs?=
 =?us-ascii?Q?ZmgBTAG7lJE2VfLCrOLjxAD28Rp4Uq3FboyRgF8enH9Vopw+Z3ogR/oqo8UM?=
 =?us-ascii?Q?62v9Y1uyASxuuGGR8WupQfDcn0wBDjLl26T//BulSQiyjr+cgCiZiWUGwKBr?=
 =?us-ascii?Q?T712teAHGek+CclobSRO110OdKXQTdyghLGctSrz1ltoRYhf5CKpjRtUeY8j?=
 =?us-ascii?Q?7keX1eafW1qUFkjarEIxIsVvFjXi4yIwuvGzXbo8uUIi3CfFGuFeSfTTf0hb?=
 =?us-ascii?Q?OuVkFDOnFzeonXSdusLp30iprfgm+KYy0l88ER7YYzFI90XYz3RXDEo/aye+?=
 =?us-ascii?Q?VvyyCKzRan6shRt1cyPSzN3PJwGjxVaIR4PSGVhz+sxgNyFyIfFzNjaltcKG?=
 =?us-ascii?Q?PsA6bnWoLIlRfqlcNgOxGw++2UEr97yRGRDhG7MCGvSzLO69539+p/YYAtzi?=
 =?us-ascii?Q?02Tzurcgm4KdP/CwonhlD2ZumZQuppYjD0D+d4Ef5Ot5Fnuc7cod+hhzLW/D?=
 =?us-ascii?Q?W013e6dS2jbTToH8WqMnLPwvnBliYldDecwylG7fiJtosQGFnh1Nh6j9sC4X?=
 =?us-ascii?Q?ibftBdTbNlvASouqLUly7n5vVX1b+mSw7Gds+t38i1wgUVLjNj1tU+RO+UKR?=
 =?us-ascii?Q?P/CwFrd5vaT8mWPDdKzH7ALNWMEdgFcICw63PTRBIVaowl/VaU1tmAGj7sRJ?=
 =?us-ascii?Q?UT2sD5/vt1GQLu+F6xFIVa3ZST6wwQ1i7/WbUsepdgpjszP7tPIiCaDjJawo?=
 =?us-ascii?Q?fJeFpqVdnG5Z3qHZz6H/oZX5YCLqroT0WipYFIZ/6YuLrJMxchjNDt2fIPTz?=
 =?us-ascii?Q?jmU0Ddw3Eo6d5sxxp4cJqBe3DCQD9dwbyCMmNULd7lLyYEwMvcPTGPPy+4wE?=
 =?us-ascii?Q?B794Lfja+8IKxF3UqbvhBnYL4EvfTum4+uhO7EJg9mI3GGDcBJXgUqWiMwd/?=
 =?us-ascii?Q?kLfrIwqfNfrU+hlrNPrTDUWWc8wulX0tmXdF1A4KTPckn2QPWHKwqN88cAdz?=
 =?us-ascii?Q?bckZxILZMlmSTNtd/yxVCE2LfkMOGKBbG9fmORWXRIhMB4zChxt4iMT5tJxJ?=
 =?us-ascii?Q?W030dKa+4DU8lCywg3CxzZvqe3JPX3OCbOsEeQvEWeecTzyurnF6OtSWU2eb?=
 =?us-ascii?Q?YtDtj+y+hNwQNvfAEMmKdvYF3zjLoDh5013z0v0xR5HBYG11QVKarDfBTdqI?=
 =?us-ascii?Q?qHlAVhVteCzzln4oC/Ccx1GbERzODlk7PHNMHx28NLhlYyUtLc6BdlxrtwGT?=
 =?us-ascii?Q?oPFEQwkfSmoyEm9Tv7ZQCTv+zbQ8J79a2otx+aKr1Kgrg+PWlZ9flW7vywUg?=
 =?us-ascii?Q?kr9xLauyqIGnr1PK9iNilHdWEM+cF8XmAvWh4M4MzeSssIEQofLQfPP9sGoe?=
 =?us-ascii?Q?NxmhdwCfFxo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?A3UWsKIHdH0bnkHfyb7tAkF6HGzXNrrf6uNsv5wmufAE0DDmZvh5eV5qdB9I?=
 =?us-ascii?Q?ypm/2zHOftShyf+CoTEDjpmYs7r2BAiJrHlJqcg1kqZVMj1a/zk/cKd+Xkik?=
 =?us-ascii?Q?FeHgz9uNproeFRnnUaTKsQ7o+eSq0XdulQL7S7Qu5J1OuppuDPDaKP1P6OIY?=
 =?us-ascii?Q?aV1hB2vP1RWll5fiFyTDhG14ipnycHwVEqCcwje7M1/P+CTWU4ovaE2bvz32?=
 =?us-ascii?Q?A7AR+BM3ZTdpWmv/ZX9Rlnd12skFgSYdwz/kcy0Y8YSdOmLewJ/On56C+gt3?=
 =?us-ascii?Q?pcWsdy2iksjpprxMmstNHXcp7kN0SOWc3G7Ew/3PJC2CCGOGxClNTRfc/J+C?=
 =?us-ascii?Q?eMdQ7ccJeHK6HQBro9EEjDPgoLfu5UCEUIUwzwbFuG92w3eNMwarlnrVo7vm?=
 =?us-ascii?Q?f7uYljZ6CmFcchjuj2Jn46IlTnUG46XVd6vzm6gDUWGeoPwMzQJUZv1e0XUx?=
 =?us-ascii?Q?aBwQDTKXtKJE9FHYXvKuyQuWu5rOMgF8094aDkyPtTYLzKH+FW7Pkwm3zkCY?=
 =?us-ascii?Q?wUVp9de4YnEJYqTO5m47siSBl7WYopIJFZuEng1oyUouY7FkE49sHNXOMyVv?=
 =?us-ascii?Q?AmJYUT8a4ThJWIv48dKcbNbjw8QFLdH/hNlH9aI8yPRKt5VqmeoLc31u+3mH?=
 =?us-ascii?Q?2O4k7f8np9zVSVivHvmi2wLaGiQ5yWZsumMUjG7iV6q/uq+i8aUzLKdDTE6e?=
 =?us-ascii?Q?5nQvKXXGmDzqtXGQuEceMJrRNTgAtAl4XjN+9BGfj39BaknRGyIszFaUdIIN?=
 =?us-ascii?Q?Oelp/tLXVWXt6uN1URUb9cQYsS/vfSdbmt/cG8XbTaoahBtyUH8ene27VWZj?=
 =?us-ascii?Q?d7/7nVYJy8thw5vamutGlfDPs19zk5tX2jOSV4nS7EGoqtwAUpRwv6kGpaxE?=
 =?us-ascii?Q?+To3MED49Y+qW23RGLUhvEXl3i46pPNtufbEUUkbIRCwiZShDJ8ou+bvYEvJ?=
 =?us-ascii?Q?AAMkNaz4iJQEar5U9lPafDGeI6ckFd8pDB0fNYiMvUTMUDv4GB6o7+bFS4jm?=
 =?us-ascii?Q?OBDbxmPHCLY1nnw1JpJGnOc4Ovmyxu2xGitygyJfXsG23++/KB8ki8B+DUpS?=
 =?us-ascii?Q?QbHsGRnOUzhxQl/KIg6Lyk7xxra7JS7Du/iVfJH6l2AcIQJlQGMLFpblhfrl?=
 =?us-ascii?Q?i1t8hnsbrIJi+HtJRCIXy1CVbg20mtZTD6dfrUxxbH6WtXFgUE1bG1EmJFbp?=
 =?us-ascii?Q?mOagdRjW2The3a05zC22wdrOU7eepv7Xd9Mk9QCrX2HGZ3UidJS6HYedCRjr?=
 =?us-ascii?Q?LTGYXD/vExjh3mmNC+jSWDYEioMA6SGg3wVpqRao0nCnsSI2n0FHTxO5c+jq?=
 =?us-ascii?Q?OEnVZnwYeNYVG8GHtdJggh4cv5H36wj5Eooz7CwELxAT3I9ZD+m+HkDTf12+?=
 =?us-ascii?Q?iCIeLrWa7taVljqXZHMdZVUs8hTkes3WPB8UwrIApq1PrM4c0ZO09AruDTxd?=
 =?us-ascii?Q?gdmqJWzKnzfxb3yZ4luHVh/nJkIVWZmJUKGkb9gunViLLHgs62PuB9MTaNK2?=
 =?us-ascii?Q?zZ5Yqh1TR8eub1VIa7+av/aByIzU2V6kkTMx/92qZvwow7gKITaJeFCLiGWO?=
 =?us-ascii?Q?ZIcP5FGfXmQNLc7oxfEHEYk2OZH6mjRujR1O1XwT/FTr2euJxBSJDnUeyIqA?=
 =?us-ascii?Q?mw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a7b311ad-9fda-4104-b167-08dde3e19ffa
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2025 14:13:55.0191 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i1cAfO7UzNLH5FLTMIfz6QNexOcv5sLAW8+gBX4mmZa9e9dIbDlWzWu1kZOhwIok0hgP5ns8hOLqYuDFriGXnU8abp3NBJB2Dn9vaflTt10=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8710
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

On Mon, Aug 25, 2025 at 04:05:37PM +0530, Riana Tauro wrote:
>To allow initialization of nvm during early probe for future usecases,
>use root tile instead of root gt to access mmios, as gt is not
>yet initialized at early probe.
>
>v2: fix commit message (Lucas)
>
>Signed-off-by: Riana Tauro <riana.tauro@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_nvm.c | 8 ++++----
> 1 file changed, 4 insertions(+), 4 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_nvm.c b/drivers/gpu/drm/xe/xe_nvm.c
>index 61b0a1531a53..9ca4a5ae1693 100644
>--- a/drivers/gpu/drm/xe/xe_nvm.c
>+++ b/drivers/gpu/drm/xe/xe_nvm.c
>@@ -39,17 +39,17 @@ static void xe_nvm_release_dev(struct device *dev)
>
> static bool xe_nvm_non_posted_erase(struct xe_device *xe)
> {
>-	struct xe_gt *gt = xe_root_mmio_gt(xe);
>+	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
>
> 	if (xe->info.platform != XE_BATTLEMAGE)
> 		return false;
>-	return !(xe_mmio_read32(&gt->mmio, XE_REG(GEN12_CNTL_PROTECTED_NVM_REG)) &
>+	return !(xe_mmio_read32(mmio, XE_REG(GEN12_CNTL_PROTECTED_NVM_REG)) &
> 		 NVM_NON_POSTED_ERASE_CHICKEN_BIT);
> }
>
> static bool xe_nvm_writable_override(struct xe_device *xe)
> {
>-	struct xe_gt *gt = xe_root_mmio_gt(xe);
>+	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
> 	bool writable_override;
> 	resource_size_t base;
>
>@@ -72,7 +72,7 @@ static bool xe_nvm_writable_override(struct xe_device *xe)
> 	}
>
> 	writable_override =
>-		!(xe_mmio_read32(&gt->mmio, HECI_FWSTS2(base)) &
>+		!(xe_mmio_read32(mmio, HECI_FWSTS2(base)) &
> 		  HECI_FW_STATUS_2_NVM_ACCESS_MODE);
> 	if (writable_override)
> 		drm_info(&xe->drm, "NVM access overridden by jumper\n");
>-- 
>2.47.1
>
