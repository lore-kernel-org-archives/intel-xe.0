Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 374A6CA5FF0
	for <intel-xe@archiver.kernel.org>; Mon,  5 Oct 2026 18:06:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4EB810EE30;
	Mon,  5 Oct 2026 18:06:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T9pWDsZM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB06710EE43
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Oct 2026 18:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791223588; x=1822759588;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ODX3dm2nU8V1DNt2BaClMfec3aahHeuefNy0QGYaRDs=;
 b=T9pWDsZMSzyAuVMa7H/v8au9l3leNoW51eZ93nkcrZ7PDBtRiLa8YJRD
 Nf9Qar6JnvtesbZHwZeG5uuhqa116gxc5MDvlglOIbkdpcOLe9pdNa/L5
 4KwUuy/qIU1lLTnT6azHn+sH7ZxoecNiThupkK7W8/9ffRS8zO+RXDDX6
 BdrgwU2cec/quT/fEWlAd8ZyXFJCtwiWZtTReclx3d4rLM290yffVIFPe
 QNPpRHT50HOaWjVmvjM/Aun+Wqw0SmpCIIKLKQN4M0y4wjYkG+cP6u0qD
 MgQUIVY5Me/a3sxQkFVQNzQv7+cRplBezD6WxhBN095VMF7//pNPasRa4 A==;
X-CSE-ConnectionGUID: ZM3FYHo7TYix8ExyctlCKg==
X-CSE-MsgGUID: sQ9TyZHTT2ebfDJwyq6Czw==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="95717823"
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; d="scan'208";a="95717823"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 11:06:28 -0700
X-CSE-ConnectionGUID: v5oIYpy4RPiLgknBajX3mA==
X-CSE-MsgGUID: fta33oKuTIWA5i0B81SAWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; d="scan'208";a="284980208"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 11:06:28 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 5 Oct 2026 11:06:27 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 5 Oct 2026 11:06:27 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.65) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 5 Oct 2026 11:06:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cU05MO6Qo4zqnhkfveUPskkOj2NnhCpLAmMDls12w7mgmDmoi4G1mHxykT20U2QLTphGO+cWadh+l2uZIv51nwEN+razVosu2UspjSMSP3GHJ5ZzvO6vugNvfsEWY+6kb/kmvhyLG9mmg3UfXAh1UBlS7AzsLi79VdG+dTAbdOIjyG3uibyLWxxjYcXg15XHIa3eowKI3AR2bbjD0YfqGM8fYe6Gz0n/ZiL4HWmKiWCdaYuKgzTMqAPXSjsYqfqpoIbWDRmTrreQYTJ9vGYgIv+Ey6VR8+yUt9lnw+Yz3E3X8K1jbYoXdM59qOb/FzxDL3UgX+UQf4QE4XCD/gaY5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jrTDi/JTDrL1fKypC2rsgegGqPiyyIyfmlKF9sz1EmE=;
 b=qnUYh+QYK3BJWK3wg8ZLFgatm5ccjj0NR2yIyN22qYLG0Sm2hy6GWoux5f8W/c8xRh7TrkeAqBrxey9027jCGBlUB2/wIY7Oa6WkL8x+SLeza+QQFErgt8+ECLx/9bBVC1sBOQsCiHNSYi/5XovXxhiIv+itng+Qtdm8VPWgbVNFBUCJ+iD9gYl5ZPdW1Al4Edu1K30PNj5sSriqOsH7Y5V95Aa8pA1n6timSYvkgDhWSYQXzBjUDFuZUG7mWOnKpZAa15quuFmibv+aJcUFanQtlWincPnlrAMxLwTmjxgJjrGoYNXKiSn+kbIsaU+p6p/d/MqJT0JleHABIBnN+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by PH0PR11MB5093.namprd11.prod.outlook.com (2603:10b6:510:3e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Mon, 5 Oct
 2026 18:06:21 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%6]) with mapi id 15.21.0472.015; Mon, 5 Oct 2026
 18:06:21 +0000
Date: Mon, 5 Oct 2026 11:06:19 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH 1/1] drm/xe/oa: Zero OA buffer at allocation
Message-ID: <asPnG0gMju1mlIca@soc-5CG1426VCC.clients.intel.com>
References: <20261005054011.2542699-1-krishnaiah.bommu@intel.com>
 <20261005054011.2542699-2-krishnaiah.bommu@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20261005054011.2542699-2-krishnaiah.bommu@intel.com>
X-ClientProxiedBy: MW3PR05CA0001.namprd05.prod.outlook.com
 (2603:10b6:303:2b::6) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|PH0PR11MB5093:EE_
X-MS-Office365-Filtering-Correlation-Id: b0e3c884-f56c-46b2-dd0b-08df230b5c6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|11063799006|56012099006|4143699003|18002099003|10067099003|22082099003;
X-Microsoft-Antispam-Message-Info: Ke7EFCu5CFKsZmYqS7nX3LAPPKszFucM9XnKDOIMqKIboj+o0fxbUSWiKqLgUgA+9wIQIwpJE/ii07l4HX74vJlbQonw/FeeI+78mbTUy7tKZggEZU1rL9JSl0IoRPe8e/75lHs+Tq8SSQCWvgUl6zh9wuXQf/bcD/Qhpf4TYrD0VdrTgO9Q0zOsXcEGuPuUSuVWlp5ae7Tp077VgfXYt7TRWv4gbuuM9fUyzncWmjykVlR/Yt4FZasx4Vp0/9su0Ul6Thkwul8rJKnA4jHMyNJc8ihkGNtMtXuPiGkeS8PqK9hqKG3aTdvhpaCYlAxERaxonzPEjgu1NtSkI/JevlX6V6C0nWvdlYtY4QRK9+MM9LToS8cTSLYPSoTKqrg8k7OzakCy1au+yvNK2oq0F6T/TBOok4ETe2T6ZHWM+6OZWqywzIRWjQQQAfZ7qcxD4bWrWJGHxrL652lIBnVjmnDmI9af53bOM50LzZ31VKNDWdJ0YshuQiYzysl4mKo6qOdlavPjTHqkOFHr+zR2x+Co6fpznPTNOaJnVAFXMkFi0pTeR134EVNGOvLq6VUvSTD379uiOP6aB/y14VCo1+nAaQeDwR7x0/K0wKV9ZvFm9CBYjtsuNOsxczhjTIkCEpGPIbY5AjnIbRfs6cwzlcTcnlvR/giFzsGVl0BMuOA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(11063799006)(56012099006)(4143699003)(18002099003)(10067099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZTJsOHNQWlp6QnlVWHViT1ZyeWRUMWRYeGdHNjBOTkpNM1pmZm1BZDNRR0RJ?=
 =?utf-8?B?RzgwY3VZeWtJb0w0MkJtejZBQSt0Z0QzMm1NS3RJQWxqS1ZXa1c5ZUNvRjNq?=
 =?utf-8?B?Rjl2bThsSW9kNXRkdXZCKzVvK2JITDBxODIyaVgxV05PRUpTWGhPSzJUcTBC?=
 =?utf-8?B?S3hNZnV1ZThXc3NCMlVud3hXL1M5U0hFakdQNUdYeS9qalFncVFJNVhEME9l?=
 =?utf-8?B?eDJ0L2Qxb3dlZHd2S2E0MENId0g4MkRrWFRpZ0VRWGMxL2xqNDM2YW5NUitZ?=
 =?utf-8?B?WGpEd0hDZm96Z1JyaDRBU1BhQk1zUXozVHNIcEZKYUtWRVNvUGlWUVRsSDB4?=
 =?utf-8?B?WkZjNnNtUDdNQlJ4bFdmZXJCNmZpeUUxam9PZVhtMjVMV3Azc3pudkxkWHJX?=
 =?utf-8?B?eE5GWi9renpxZU5xdW1KSGN1K3J1Tk5MVTNyOUQ0a1RTWVdTLzh5eWI5a1Bz?=
 =?utf-8?B?a3VzZno1OWxNcXBCNy83ems5NE5YNm1FSFNEUVZWckR0YUFNczMreCtGTWhm?=
 =?utf-8?B?M2FCMi9qWFRDSUoxRjAranBIbjRUQ0hyemNkMDg5M2V4SUlGSUtCOThEZnBT?=
 =?utf-8?B?aHV2TENRSDMxZy9BRW1LYnJaOU9TK2p5Qk9GNUVDSEtHczhIZjJxRktnQzVm?=
 =?utf-8?B?NnRGUHdWckIzVXBTWTh3SEhSQ3UrVkVweVRRVUx5RkxiUGcrOS8zK2FuWFRy?=
 =?utf-8?B?cmRhaVVMOTRVME9ua21LZmRsZUtiMVEzQU9pbEw4TjlZTlBTQkxmVHFFUHBy?=
 =?utf-8?B?WmlKM3VCbGR0alUrakV0Q1N5b0daUi9ZOURVVGE5L3VYTWp5Z0M3aVNYalo2?=
 =?utf-8?B?anBMaFBGQmJ4ZG5NLzFIVnVFMlBCWE5rWmlRM0F0ejV1V0hMWnF4UEZWdGQx?=
 =?utf-8?B?RTVtN0s5YSsvdm5IMm9Tdjlya2UwOExtamdnMk5DK1MyQmY0Vm0rZDVia003?=
 =?utf-8?B?dUxzaEpVU2F6aDFzNmRZUUlJaWRkM3F0QjNDa1VQV3hHTlczL0NjTWxHV2U0?=
 =?utf-8?B?QWQveitxOUxvbDZMWTczcWhVcEczbXg1TFB4Ym1iNlIzZkVZZXE1SDU3Wllq?=
 =?utf-8?B?SmlZbWJhUE1xNHFFY0VBSURaUG5CNy9YNC9xemI1NlBNMWZyMXJXQ1d6cGRi?=
 =?utf-8?B?ZTRVOUZqL1Iwc0Qxbm4vaHN0Y2FycVJ1c3M5dGdqa1liaVlmWGZoU1pTcTRR?=
 =?utf-8?B?QTNZMzl6U0xLaEVZVm44WGFvcTlQb0M4Sk1sU1ppbnBuZXpDZXZqOUJKellE?=
 =?utf-8?B?cnE4RTFEQ09iemMyVkJ1VXRzM1F6Yzh1RnludEtneFdXUU5NVVNFcCtSKzhF?=
 =?utf-8?B?Zzl1WE1aYXBYcHVxU3hBcHdJS0lvYjNmbmhHUVhwL1NNL3V2eTNOQWo4M3Jn?=
 =?utf-8?B?aUhEdS9FMzIzVml2VERhbUZYRy9nSnVJNUQ5RkVUSHNmbkxGVHI5YTErVlNG?=
 =?utf-8?B?TW1BZm9vQmsxamM1bGJSMW10TUNCdTJnY0dQbmxhMG1KaTE3KzlvNW8xVkUr?=
 =?utf-8?B?OUlING1SdlAvNXJqazdVU3hsMTFaWVA1RU9UTllJbzBISnpoVEZodksxd1F4?=
 =?utf-8?B?MWNkbGlTcWk2cWRKOTZSMzlDMHFyWk9XNEJrbDFmS3hGSVQ5b3FIazJYazU5?=
 =?utf-8?B?WDhnRHJnYlcyaUJSNVRpRDJLSDg0eWpwRE1LM2ZXRUc3WUMvZmNUd3g4dkU2?=
 =?utf-8?B?RVBPd29SZlJIb3R3Z2l6bzk4QWxzQ0J3RUlVUk5hbERTdEllZmVDbW9zbDR2?=
 =?utf-8?B?QTZJVnVIL2l4eFNiaDZkYjM4aVZwYW1mVkVOTk5McU1QWkZHa1lFV1QzNVp6?=
 =?utf-8?B?T1VFMEc3NnZHWkovZmlpVlNtT2o4SWd4THg3V3pOOXpsY1d0L2tUcDNvSFY1?=
 =?utf-8?B?UEkzWEJYVTRwU0ZiYTN3eERHOHFnd1lBdUlCcHR5SzkxbnNZa1lWYUhFT0RK?=
 =?utf-8?B?YzFJSXA2clFVNDhkdjJ6M0F2enQ5NFFMMXVjei9KdGJuRG9aQjhEdUNLMmVY?=
 =?utf-8?B?MXQvUG0wM240MkwwdE9lenB5OU9vOTU4VEJDcUdHZHpyalo4Q3FRclJSbzJk?=
 =?utf-8?B?REc4b21FZnpBUGNleTNyL1o3NTZSUG5QaWhpVXJvTGhxOXAxeW85cUE4bExy?=
 =?utf-8?B?Y21zV3JzUzVmWGN3aXJDVldjV0JITmNJMGtUSkNWWDRGY2dXWVZsVTQ4OTZZ?=
 =?utf-8?B?RmFMRWxsTDI3WDdXL2p1WDNZU3B4YlVFK1dGQmhycTNRYklHak5ZWjBmQ2hL?=
 =?utf-8?B?emI0SDNsanRIT0VuMmVmbWlXWW5yVlQyNjZVZ2Q1MXJHb3hoMVNrai9iTXk3?=
 =?utf-8?B?Qzh1aTJNMnVSZUhJVHhHL2JCN01CZDBDWGQ0alRUSlRVRnRpL2FSVjJaNmpH?=
 =?utf-8?Q?Eu4/U240MWriviWJTPO4cPnDGXaZ/suI4EDyQ?=
X-Exchange-RoutingPolicyChecked: GF2pW0K0dJYtdGMXGYiQsRPLQ4znsA4HWdxFOuwW7qt/c2jcKeO8w5+jU9kFWFcVpzkaERUVc8v9w5J41y1DQRQHNLCGhGW5GOkkyhNjCNWx0GgvCRGwlmXEkhst//bqMgDiYhX+H7VxXHHP2OC55qg7Oj6oYZPE84YxscZeGV4GqhoOcahRH0Va+5MDQeMzOfPYyrpYpUiZTKEmuDg3iruqg9huC1fqQu2E6YrSuvd8yFNe8gAUz7DBDBXe68R7XMRVT/jw1JC9+NhCuszT43pWjFgm/RjyRWK7ILEP5fW17rSMJ4dYRLYN3i6Oc7OHGryG/e6gFHxuFJ0CJJ1uvQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: b0e3c884-f56c-46b2-dd0b-08df230b5c6d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 18:06:21.4189 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +j/piyEGXNGlljQkL+cXcqaKjASuxhEKWWKxrQ9aBsIrKGVwFh8h3qOsGMGx9b/6rPZ55mTQ/lzaKpS8E1r3L8O+vhb1FrzlxLxKsfeuWF4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5093
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

On Mon, Oct 05, 2026 at 11:10:11AM +0530, Bommu Krishnaiah wrote:
>Zero the OA buffer immediately after allocation because kernel BO pages
>are not guaranteed to be initialized. This prevents stale data exposure
>through mmap and fixes the xe_oa tail-address-wrap test.
>

Thanks for addressing this.

If this fixes an upstream bug, please include the Closes: tag.
Note that single patch does not need a cover letter.

>Fixes: 392bf22238ff ("drm/xe/oa/uapi: OA buffer mmap")
>Assisted-by: GitHub Copilot
>Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
>Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
>---
> drivers/gpu/drm/xe/xe_oa.c | 7 +++++++
> 1 file changed, 7 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
>index a3484e943c55..3bb8bbef4c37 100644
>--- a/drivers/gpu/drm/xe/xe_oa.c
>+++ b/drivers/gpu/drm/xe/xe_oa.c
>@@ -914,6 +914,13 @@ static int xe_oa_alloc_oa_buffer(struct xe_oa_stream *stream, size_t size)
> 	if (IS_ERR(bo))
> 		return PTR_ERR(bo);
>
>+	/*
>+	 * ttm_bo_type_kernel BOs are not zeroed on allocation, so the buffer can
>+	 * hold stale data from previously freed pages. Since the OA buffer is
>+	 * mmap'able by userspace, clear it here to avoid leaking kernel memory.
>+	 */
>+	xe_map_memset(stream->oa->xe, &bo->vmap, 0, 0, xe_bo_size(bo));
>+

With Himal's comments incorporated, this is

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Regards,
Umesh
> 	stream->oa_buffer.bo = bo;
>
> 	stream->oa_buffer.bounce = kmalloc(stream->oa_buffer.format->size, GFP_KERNEL);
>-- 
>2.43.0
>
