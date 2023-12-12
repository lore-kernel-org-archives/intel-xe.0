Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71C55C4332F
	for <intel-xe@archiver.kernel.org>; Tue, 12 Dec 2023 07:51:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B24F10E4F6;
	Tue, 12 Dec 2023 07:51:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F51510E4F6
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Dec 2023 07:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702367500; x=1733903500;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Ty3G8cwGFlZWNXEtYb+K9rHT6KcwJuSwY6NChHaNcw4=;
 b=EICg2DNibKhxLhn1D1+YDUG+5szp47LGkHuZmg8kdBo8PgcT5cvhjhQ2
 tgsWcuAMcOsYkQPTO2K5Uc5SE9669KtiFv7gAgTcs3Merio6PpmBio8ge
 0PsIX6Rlg3kKSM9OGzT22CV6RGGaDNV/bs7SvAW/J81AZVj51sxq47oYs
 cvovBeVYQRS3vLCUSUJUbwmA5XYg4Ybx5Rq7Jww0M1gUr13HXQcjrZ1sS
 VxQtdOeTA4rLOY2/NR8eGokK8FX1feZ2kVKadNcj9y++oYPL2lzgR8O7R
 WTwLMt98Ri4R77v5GMXfqB0pwIXnWtKfMWSbFVbaoAoLzWdpeKE4fF26h A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="459082337"
X-IronPort-AV: E=Sophos;i="6.04,269,1695711600"; d="scan'208";a="459082337"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 23:51:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="946661964"
X-IronPort-AV: E=Sophos;i="6.04,269,1695711600"; d="scan'208";a="946661964"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Dec 2023 23:51:39 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Dec 2023 23:51:39 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 11 Dec 2023 23:51:39 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 11 Dec 2023 23:51:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PJ3eAwONTIPEfG2qvnRz8qo5tw3tQp2AfVlv4SKoDMBTnf24VK2sJeOJK468vmivVOU7vdugoYq+XYpc3W3wDev9cptjhh+UsimoElNU1D3hvH+pW0C1Hfk/cWgGPwH4iEqqimBprBVMerp/h0tTGKZ+emmwnl+4/BFIaoqONIzfWcw/rrHkdmRtnHyM+gN4DdIRxi2V6PFxORg6wte167Vnz3q06aC+EdwXSx1+qVDHYbazvbw9DuZxHn5xlvpBPcIZPLsFq0DSts49fPnCj/+NuhP3jiBK0FaLkJvJRfhrhBVAMLLT9SrHqm0dDgTkUrxAf980jQ2MuC1/0FGrgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jbn30d/6m+FhpXoprxvCRqSsUwCvjBAznlH1K2mf5fs=;
 b=XqjvNbsMDRyHlhRQdEPdLqjtNZ93kvcEj6UoMOznJHfC0WZxvAaXn7+lnWyMiVksP70IxNMefnvcamVSraCLIRmJK9j4CJEX2z8NxfbyGImaMtP9z4jslo6EaPe8Yj2D7KjHTuA1e5s8kr0cgo928WpJ1T+i4yQUomYsDI9Fyordpn+i4H1yi7yIGseD+LTQhQsLUnE/uiILbd6E9FGmCVqpHA5BJ6/AQoH4nYgl0qwqX+JKQSZDWF7DHPhIeBr/J16UghfW4CNhHAiCfp3gJDUB+V29dtOmrFpIPk+pMEp6o+w99tP//C4wcbvUSDsYRwuxGPiUgzbg0T3PH0gclQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by SA2PR11MB4956.namprd11.prod.outlook.com (2603:10b6:806:112::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.33; Tue, 12 Dec
 2023 07:51:35 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b30b:545e:3b7f:9626]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b30b:545e:3b7f:9626%2]) with mapi id 15.20.7068.031; Tue, 12 Dec 2023
 07:51:35 +0000
Date: Tue, 12 Dec 2023 08:51:33 +0100
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v3 3/9] drm/xe: Introduce GuC Doorbells Manager
Message-ID: <20231212075133.we4ftkk54smmwlmm@intel.com>
References: <20231211200424.1703-1-michal.wajdeczko@intel.com>
 <20231211200424.1703-4-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231211200424.1703-4-michal.wajdeczko@intel.com>
X-ClientProxiedBy: FR3P281CA0101.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::10) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|SA2PR11MB4956:EE_
X-MS-Office365-Filtering-Correlation-Id: 0796c63d-738a-4b6b-81e4-08dbfae72a39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6BSzcdtgX48abFG1NYcJvtfF+ETvIwkoasZPN7wXYEKsORL56edOgAON3V1N+BMlGMvSCDFir+dqSAV4R3088wSep5wWseNGH/NqgnRhx9LiWoRzj0x+5OOVQOafRSlui4F9bM1jx01w4V7J8Vc0Dn1lBmHD2u5nUgNLtZEe8OR3nyLE5R/8VdK5Kah2k1rmdQCQ0N3eZPxZ/dI1pqyve2ED3Fe74KA8ispdNkLj1Gs0XpmPfDzgveUAKAduOQ9EWZiy3QfXD2+Ukxzd0p0LgCGHzThvoC0kMUSk93pmXWewvqjFs0gTUJdB+VP2lfPY3kxpvUiKEoI+1VX/fX6FFErhk2B0D5X4xQy11/CTAf5/akGjN2sdSEYHUPZRP6tnGQjk8lAhaK8Ff9bIpC0zj6bE4+3skXNxjrzhuFl1WOsh7DyTiqBlrYYKsrH7fT7oIQgpCGcV8QuAbFNgPLwobxfRe005q/BDlSLj+Sxrcra5lzOEawybpnEf+6tlKQeStzWxMz5a9F0Yw2BaaXCDOkZZ4HtdmFvJw1Bk9m4tQRLBKnns1Bgj79Bt3EzMxWGW
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(396003)(39860400002)(136003)(366004)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(2906002)(30864003)(41300700001)(6636002)(66946007)(86362001)(36756003)(66476007)(66556008)(38100700002)(6506007)(82960400001)(6512007)(107886003)(2616005)(478600001)(6486002)(26005)(1076003)(83380400001)(66574015)(5660300002)(8676002)(37006003)(316002)(8936002)(4326008)(6862004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OTNBd1R2MGZ3cGVmQUJZb0w4Yzd0TUNQdXlGZGpFRUw0YkdBT3JYSlE3cjBk?=
 =?utf-8?B?L2hNQXdUbm5JU2IvUG1EUmg3UnBBMmJXa21YMDRvYVpoYjlNVU9pY3orc3Vv?=
 =?utf-8?B?NGZjTmxUNHBja09PZkFFWkhuOFhGcjJ4UHQrSnlLek9iNHVubnB1cHVzdCsy?=
 =?utf-8?B?Y3BqU21YMnF5L1J4OWpvQit5R0trV2tTNU1iSllZNDdVdUJ6TDk2ZGROTUta?=
 =?utf-8?B?aHJRMGhndThRNWFMOEdRTXgrUkNVY2l4VlVmNVRzdnNhUkUxV2MxQ1ZNUm1U?=
 =?utf-8?B?SkJ4UUFaSG9PMWNrQi9sa0JWMVh0cDc0bTh1aXZYMkUwVTdHamdmV3dFWmhv?=
 =?utf-8?B?ZXpOOG5ndHV1c05Ta2VuNVBWbXo1dmpHQndXY0M5UndVcXZYMzRHcFNjZnhm?=
 =?utf-8?B?Q1Y1WHQxRjFXQkxqZ2dWVFhQdDBGeHU1ckdpcUdmQ2ZuNW9TdjJrZEFFOE9p?=
 =?utf-8?B?TXBxazdjekdrME1GRUI4UDhTOTZvNzhuTDhncjhScHg5cEkxNDJoMmpMVnRu?=
 =?utf-8?B?aDBVaGNkRHRrSzRBQk5yOTNZR1VGemRhU3FYaElJUzFlUFBaVnhLNEVZbWoz?=
 =?utf-8?B?bTIzZnpkKzBRSzcxZTlMeWY0aXVtN1Bjc0ZNcitaMW44cUNKVFdoMmZTWElI?=
 =?utf-8?B?cWJ2bnV6UnJaOE5pYnhBZ0FtQ200Z0h5YXQ3RTVQdkZ2WDQ0emhYMnUrTnFK?=
 =?utf-8?B?WXF5QzVpalYva1ZtRzhiRUx2Q1ZhUVVMb2ZmRHd5MUcza2tsRjdnTHM5Y1la?=
 =?utf-8?B?Y05UaEdPdVNKUzJueFkrZGFESDR4WXNRT21LQUczcHk1NWgwRCtJMDYrZEhT?=
 =?utf-8?B?dEZUS0RLengrSlplNEZ4d0hyTjBsY0ZsaCtIZ2xqRUl5ZFZtdENHM2VaaHNJ?=
 =?utf-8?B?R015dngzbEF2VVpxSU5ibUhBQWFOaWI3UGoycG1PQXJoL2k4VGtaOTR2Vm5s?=
 =?utf-8?B?QmQwTEJyei9EQ0htTjcyRWdrZTNZWTV3NDJmWWl6L2E4WU95VnhhUStlYVJt?=
 =?utf-8?B?MUVROG9pbU1ScXRVMjRoOHJ2eHp3WWMyQTdPRkVEcjZQUGRhUVFZQWRaNzZZ?=
 =?utf-8?B?ZVdRa0JweU1QcWFkWm9jN1hYb2xKcmtpV2ZPTjN3YlMwbkVER1piUnZzUDQ4?=
 =?utf-8?B?M1d1dHdXZVcvSFB1dEJndXpJaDB2V01jRlV0SDIveWcrblRhUXVNU3ZqWFd1?=
 =?utf-8?B?ZDYrVXdxZk0yb1VqWEhmSTRaRGxvZSsyNlU2RlN4bUpISTgyeUgvTlo5YzBI?=
 =?utf-8?B?cHc1amg0M1MzZHFnNGxtQjNsNVRCSkNUQzN6TDhtbWhqdVU2T0ZBTndzc21U?=
 =?utf-8?B?OGJTWVhiUHBjQ1VsalFTdVRYcXYxaVNaUmg4WmN2TVhBd2JMVHlIaEMrdDJi?=
 =?utf-8?B?dEV3WWQrUUR2ZnlLR0tucFhVd1Bzd0Y0ajFmYy9FR0hrWEtSMStDamxKMDg0?=
 =?utf-8?B?N1E3akpFeGJQdGphdHZQVzFXWmJUNTduQUN6WDNDbnRYcFRad0JNQ21uWnVC?=
 =?utf-8?B?dHdrbE9aYVIvOGRWYTd5SER4UGYraG9rYnFNVkdFbU1UcTBlZXA5eUduTUtj?=
 =?utf-8?B?YjJwNWtzamNqb1A5cG5BRnArek9CREh5UDMwcVhlMmhhZTg3SW9QT1FMVDFj?=
 =?utf-8?B?Vkk2KzhNU1V3cG9qSFoyV0dYSGdNWG1BMWl4Y1VORytucWNXd2VkbEVmamlj?=
 =?utf-8?B?blhiQ3BFVWRQOVNvdzc0bjRmeXFCK0I5dmduaUVXZC9jSGR2RnQzN1F2T2Na?=
 =?utf-8?B?Q1Nkd1AvbTJlTkJCNHVUNFF3MlRDYmFVaHQyWk5yaWJaeXBLbXpudFVvaHJW?=
 =?utf-8?B?Z0lkeTRVTS9ZWEYzenBmSFZuSWROMzFPeUloK2Y5WHVkNVhPK0pGUnFUYnh1?=
 =?utf-8?B?dHpLbVRhNWV6c2kxa2tjTFd5b0pzSzA4S1JJQ3NNMVZqaVA1UXBxRWV6a0pU?=
 =?utf-8?B?b2JoYUFpNzIzYzkrUDY2c05YaHp5c1J6UXUxdExYNngybUVvMmVuNVg3NVov?=
 =?utf-8?B?UXZzQmRBV01vb1c5WFF1VXNadlVHMUV4L1VPR3g4TnVYR1BEUHBaZ1JQbysw?=
 =?utf-8?B?S29LL1JWNEZqaTFadG56eWJFL1BybGMrUjZPNlo1blYvdGQ3Q2FrUkJrL2lt?=
 =?utf-8?B?a0c2bWZPY1FEaTQ4OUhlS1NjOE1FWmcrSCtrak1DYnpWWEtURWZYODdYUXdw?=
 =?utf-8?B?d3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0796c63d-738a-4b6b-81e4-08dbfae72a39
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2023 07:51:35.7261 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8QFurDxcwd1zaAD/QSCAqVB79lmPDcVJSIG/LHTr2cVKXZisD7kBBkEW2P3lUUB0Ib+P4HOOV2D5Yq7DZfaEkcyqRfxEU8OTEbw5wN7snyw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4956
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on pon [2023-gru-11 21:04:18 +0100]:
> The GFX doorbell solution provides a mechanism for submission of
> workload to the graphics hardware by a ring3 application without
> the penalty of ring transition for each workload submission.
> 
> This feature is not currently used by the Linux drivers, but in
> SR-IOV mode the doorbells are treated as shared resource and the
> PF driver must be able to provision exclusive range of doorbells
> IDs across all enabled VFs.
> 
> Introduce simple GuC doorbell ID manager that will be used by the
> PF driver for VFs provisioning and can later be used by submission
> code once we are ready to switch from H2G based notifications to
> doorbells mechanism.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
> 
> ---
> v2: fix renames, lock in fini
> v3: reorder init
> ---
>  drivers/gpu/drm/xe/Makefile        |   1 +
>  drivers/gpu/drm/xe/xe_guc_db_mgr.c | 257 +++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_guc_db_mgr.h |  22 +++
>  drivers/gpu/drm/xe/xe_guc_types.h  |  15 ++
>  drivers/gpu/drm/xe/xe_uc.c         |   5 +
>  5 files changed, 300 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_guc_db_mgr.c
>  create mode 100644 drivers/gpu/drm/xe/xe_guc_db_mgr.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index f4ae063a7005..0c2e247dc188 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -84,6 +84,7 @@ xe-y += xe_bb.o \
>  	xe_guc.o \
>  	xe_guc_ads.o \
>  	xe_guc_ct.o \
> +	xe_guc_db_mgr.o \
>  	xe_guc_debugfs.o \
>  	xe_guc_hwconfig.o \
>  	xe_guc_log.o \
> diff --git a/drivers/gpu/drm/xe/xe_guc_db_mgr.c b/drivers/gpu/drm/xe/xe_guc_db_mgr.c
> new file mode 100644
> index 000000000000..15816f90e960
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_guc_db_mgr.c
> @@ -0,0 +1,257 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#include <linux/bitmap.h>
> +#include <linux/mutex.h>
> +
> +#include <drm/drm_managed.h>
> +
> +#include "regs/xe_guc_regs.h"
> +
> +#include "xe_assert.h"
> +#include "xe_gt_printk.h"
> +#include "xe_guc.h"
> +#include "xe_guc_db_mgr.h"
> +#include "xe_guc_types.h"
> +
> +/**
> + * DOC: GuC Doorbells
> + *
> + * The GFX doorbell solution provides a mechanism for submission of workload
> + * to the graphics hardware by a ring3 application without the penalty of
> + * ring transition for each workload submission.
> + *
> + * In SR-IOV mode, the doorbells are treated as shared resource and PF must
> + * be able to provision exclusive range of IDs across VFs, which may want to
> + * use this feature.
> + */
> +
> +static struct xe_guc *dbm_to_guc(struct xe_guc_db_mgr *dbm)
> +{
> +	return container_of(dbm, struct xe_guc, dbm);
> +}
> +
> +static struct xe_gt *dbm_to_gt(struct xe_guc_db_mgr *dbm)
> +{
> +	return guc_to_gt(dbm_to_guc(dbm));
> +}
> +
> +static struct xe_device *dbm_to_xe(struct xe_guc_db_mgr *dbm)
> +{
> +	return gt_to_xe(dbm_to_gt(dbm));
> +}
> +
> +#define dbm_assert(_dbm, _cond)		xe_gt_assert(dbm_to_gt(_dbm), _cond)
> +#define dbm_mutex(_dbm)			(&dbm_to_guc(_dbm)->submission_state.lock)
> +
> +static void __fini_dbm(struct drm_device *drm, void *arg)
> +{
> +	struct xe_guc_db_mgr *dbm = arg;
> +	unsigned int weight;
> +
> +	mutex_lock(dbm_mutex(dbm));
> +
> +	weight = bitmap_weight(dbm->bitmap, dbm->count);
> +	if (weight) {
> +		struct drm_printer p = xe_gt_info_printer(dbm_to_gt(dbm));
> +
> +		xe_gt_err(dbm_to_gt(dbm), "GuC doorbells manager unclean (%u/%u)\n",
> +			  weight, dbm->count);
> +		xe_guc_db_mgr_print(dbm, &p, 1);
> +	}
> +
> +	bitmap_free(dbm->bitmap);
> +	dbm->bitmap = NULL;
> +	dbm->count = 0;
> +
> +	mutex_unlock(dbm_mutex(dbm));
> +}
> +
> +/**
> + * xe_guc_db_mgr_init() - Initialize GuC Doorbells Manager.
> + * @dbm: the &xe_guc_db_mgr to initialize
> + * @count: number of doorbells to manage
> + *
> + * The bare-metal or PF driver can pass ~0 as &count to indicate that all
> + * doorbells supported by the hardware are available for use.
> + *
> + * Only VF's drivers will have to provide explicit number of doorbells IDs
> + * that they can use.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_guc_db_mgr_init(struct xe_guc_db_mgr *dbm, unsigned int count)
> +{
> +	int ret;
> +
> +	if (count == ~0)
> +		count = GUC_NUM_DOORBELLS;
> +
> +	dbm_assert(dbm, !dbm->bitmap);
> +	dbm_assert(dbm, count <= GUC_NUM_DOORBELLS);
> +
> +	if (!count)
> +		goto done;
> +
> +	dbm->bitmap = bitmap_zalloc(count, GFP_KERNEL);
> +	if (!dbm->bitmap)
> +		return -ENOMEM;
> +	dbm->count = count;
> +
> +	ret = drmm_add_action_or_reset(&dbm_to_xe(dbm)->drm, __fini_dbm, dbm);
> +	if (ret)
> +		return ret;
> +done:
> +	xe_gt_dbg(dbm_to_gt(dbm), "using %u doorbell(s)\n", dbm->count);
> +	return 0;
> +}
> +
> +static int dbm_reserve_chunk_locked(struct xe_guc_db_mgr *dbm,
> +				    unsigned int count, unsigned int spare)
> +{
> +	unsigned int used;
> +	int index;
> +
> +	dbm_assert(dbm, count);
> +	dbm_assert(dbm, count <= GUC_NUM_DOORBELLS);
> +	dbm_assert(dbm, dbm->count <= GUC_NUM_DOORBELLS);
> +	lockdep_assert_held(dbm_mutex(dbm));
> +
> +	if (!dbm->count)
> +		return -ENODATA;
> +
> +	if (spare) {
> +		used = bitmap_weight(dbm->bitmap, dbm->count);
> +		if (used + count + spare > dbm->count)
> +			return -EDQUOT;
> +	}
> +
> +	index = bitmap_find_next_zero_area(dbm->bitmap, dbm->count, 0, count, 0);
> +	if (index >= dbm->count)
> +		return -ENOSPC;
> +
> +	bitmap_set(dbm->bitmap, index, count);
> +
> +	return index;
> +}
> +
> +static void dbm_release_chunk_locked(struct xe_guc_db_mgr *dbm,
> +				     unsigned int start, unsigned int count)
> +{
> +	dbm_assert(dbm, count);
> +	dbm_assert(dbm, count <= GUC_NUM_DOORBELLS);
> +	dbm_assert(dbm, dbm->count);
> +	dbm_assert(dbm, dbm->count <= GUC_NUM_DOORBELLS);
> +	lockdep_assert_held(dbm_mutex(dbm));
> +
> +	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
> +		unsigned int n;
> +
> +		for (n = 0; n < count; n++)
> +			dbm_assert(dbm, test_bit(start + n, dbm->bitmap));
> +	}
> +	bitmap_clear(dbm->bitmap, start, count);
> +}
> +
> +/**
> + * xe_guc_db_mgr_reserve_id_locked() - Reserve a single GuC Doorbell ID.
> + * @dbm: the &xe_guc_db_mgr
> + *
> + * This function expects that submission lock is already taken.
> + *
> + * Return: ID of the allocated GuC doorbell or a negative error code on failure.
> + */
> +int xe_guc_db_mgr_reserve_id_locked(struct xe_guc_db_mgr *dbm)
> +{
> +	return dbm_reserve_chunk_locked(dbm, 1, 0);
> +}
> +
> +/**
> + * xe_guc_db_mgr_release_id_locked() - Release a single GuC Doorbell ID.
> + * @dbm: the &xe_guc_db_mgr
> + * @id: the GuC Doorbell ID to release
> + *
> + * This function expects that submission lock is already taken.
> + */
> +void xe_guc_db_mgr_release_id_locked(struct xe_guc_db_mgr *dbm, unsigned int id)
> +{
> +	return dbm_release_chunk_locked(dbm, id, 1);
> +}
> +
> +/**
> + * xe_guc_db_mgr_reserve_range() - Reserve a range of GuC Doorbell IDs.
> + * @dbm: the &xe_guc_db_mgr
> + * @count: number of GuC doorbell IDs to reserve
> + * @spare: number of GuC doorbell IDs to keep available
> + *
> + * This function is dedicated for the for use by the PF which expects that
> + * allocated range for the VF will be contiguous and that there will be at
> + * least &spare IDs still available for the PF use after this reservation.
> + *
> + * Return: starting ID of the allocated GuC doorbell ID range or
> + *         a negative error code on failure.
> + */
> +int xe_guc_db_mgr_reserve_range(struct xe_guc_db_mgr *dbm,
> +				unsigned int count, unsigned int spare)
> +{
> +	int ret;
> +
> +	mutex_lock(dbm_mutex(dbm));
> +	ret = dbm_reserve_chunk_locked(dbm, count, spare);
> +	mutex_unlock(dbm_mutex(dbm));
> +
> +	return ret;
> +}
> +
> +/**
> + * xe_guc_db_mgr_release_range() - Release a range of Doorbell IDs.
> + * @dbm: the &xe_guc_db_mgr
> + * @start: the starting ID of GuC doorbell ID range to release
> + * @count: number of GuC doorbell IDs to release
> + */
> +void xe_guc_db_mgr_release_range(struct xe_guc_db_mgr *dbm,
> +				 unsigned int start, unsigned int count)
> +{
> +	mutex_lock(dbm_mutex(dbm));
> +	dbm_release_chunk_locked(dbm, start, count);
> +	mutex_unlock(dbm_mutex(dbm));
> +}
> +
> +/**
> + * xe_guc_db_mgr_print() - Print status of GuC Doorbells Manager.
> + * @dbm: the &xe_guc_db_mgr to print
> + * @p: the &drm_printer to print to
> + * @indent: tab indentation level
> + */
> +void xe_guc_db_mgr_print(struct xe_guc_db_mgr *dbm,
> +			 struct drm_printer *p, int indent)
> +{
> +	unsigned int rs, re;
> +	unsigned int total;
> +
> +	drm_printf_indent(p, indent, "count: %u\n", dbm->count);
> +	if (!dbm->bitmap)
> +		return;
> +
> +	mutex_lock(dbm_mutex(dbm));
> +
> +	total = 0;
> +	for_each_clear_bitrange(rs, re, dbm->bitmap, dbm->count) {
> +		drm_printf_indent(p, indent, "available range: %u..%u (%u)\n",
> +				  rs, re - 1, re - rs);
> +		total += re - rs;
> +	}
> +	drm_printf_indent(p, indent, "available total: %u\n", total);
> +
> +	total = 0;
> +	for_each_set_bitrange(rs, re, dbm->bitmap, dbm->count) {
> +		drm_printf_indent(p, indent, "reserved range: %u..%u (%u)\n",
> +				  rs, re - 1, re - rs);
> +		total += re - rs;
> +	}
> +	drm_printf_indent(p, indent, "reserved total: %u\n", total);
> +
> +	mutex_unlock(dbm_mutex(dbm));
> +}
> diff --git a/drivers/gpu/drm/xe/xe_guc_db_mgr.h b/drivers/gpu/drm/xe/xe_guc_db_mgr.h
> new file mode 100644
> index 000000000000..c250fa0ca9d6
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_guc_db_mgr.h
> @@ -0,0 +1,22 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _XE_GUC_DB_MGR_H_
> +#define _XE_GUC_DB_MGR_H_
> +
> +struct drm_printer;
> +struct xe_guc_db_mgr;
> +
> +int xe_guc_db_mgr_init(struct xe_guc_db_mgr *dbm, unsigned int count);
> +
> +int xe_guc_db_mgr_reserve_id_locked(struct xe_guc_db_mgr *dbm);
> +void xe_guc_db_mgr_release_id_locked(struct xe_guc_db_mgr *dbm, unsigned int id);
> +
> +int xe_guc_db_mgr_reserve_range(struct xe_guc_db_mgr *dbm, unsigned int count, unsigned int spare);
> +void xe_guc_db_mgr_release_range(struct xe_guc_db_mgr *dbm, unsigned int start, unsigned int count);
> +
> +void xe_guc_db_mgr_print(struct xe_guc_db_mgr *dbm, struct drm_printer *p, int indent);
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/xe_guc_types.h
> index cd80802e8918..16de203c62a7 100644
> --- a/drivers/gpu/drm/xe/xe_guc_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_types.h
> @@ -17,6 +17,19 @@
>  #include "xe_guc_pc_types.h"
>  #include "xe_uc_fw_types.h"
>  
> +/**
> + * struct xe_guc_db_mgr - GuC Doorbells Manager.
> + *
> + * Note: GuC Doorbells Manager is relying on &xe_guc::submission_state.lock
> + * to protect its members.
> + */
> +struct xe_guc_db_mgr {
> +	/** @count: number of doorbells to manage */
> +	unsigned int count;
> +	/** @bitmap: bitmap to track allocated doorbells */
> +	unsigned long *bitmap;
> +};
> +
>  /**
>   * struct xe_guc - Graphic micro controller
>   */
> @@ -31,6 +44,8 @@ struct xe_guc {
>  	struct xe_guc_ct ct;
>  	/** @pc: GuC Power Conservation */
>  	struct xe_guc_pc pc;
> +	/** @dbm: GuC Doorbell Manager */
> +	struct xe_guc_db_mgr dbm;
>  	/** @submission_state: GuC submission state */
>  	struct {
>  		/** @exec_queue_lookup: Lookup an xe_engine from guc_id */
> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> index 25e1ddfd2f86..4408ea1751e7 100644
> --- a/drivers/gpu/drm/xe/xe_uc.c
> +++ b/drivers/gpu/drm/xe/xe_uc.c
> @@ -9,6 +9,7 @@
>  #include "xe_gsc.h"
>  #include "xe_gt.h"
>  #include "xe_guc.h"
> +#include "xe_guc_db_mgr.h"
>  #include "xe_guc_pc.h"
>  #include "xe_guc_submit.h"
>  #include "xe_huc.h"
> @@ -60,6 +61,10 @@ int xe_uc_init(struct xe_uc *uc)
>  	if (ret)
>  		goto err;
>  
> +	ret = xe_guc_db_mgr_init(&uc->guc.dbm, ~0);
> +	if (ret)
> +		goto err;
> +
>  	return 0;

After the fixes you made, this series seems okay to me already:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>


>  
>  err:
> -- 
> 2.25.1
> 

-- 
