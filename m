Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EC65C3DA6F
	for <intel-xe@archiver.kernel.org>; Wed, 23 Aug 2023 19:42:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA1D410E0DF;
	Wed, 23 Aug 2023 19:42:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EEAE10E0DF
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Aug 2023 19:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692819733; x=1724355733;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ZrMK4wr1YMUbS7BCRnB3FVujylt7OLZDmY5Knu+yjO8=;
 b=kBgcxu7Vki2o8CQ58P4W0xUQxlGJCnJG0GrV/0+JJbHmts1rir+7xtwO
 fBW+cUAgEssTqfCrhGKpQlxlDrQLpjgwIqa/lnfi9lfcbCYxVH95xqXCu
 4T72PobvTtHDnHas37gmSsD1eg8qOEK9WudZNysILA9ZabnAd/Y7Mj9xY
 AJGGsCYmgYaza9JJs+rHFjNWZoXYDvzbhicvKkTXsqJQ0Si3rSltMwXhe
 qAFq6RfVLwmbEjm0trw40dnHbPnigQbjQfNvKz3svt0rwbjT5E6ltu7Ad
 t+Mcf3a1uTFh8qLLHJD1R1gRAZyDTLDFzQBNYJIWIbY1nhp/aisiAe9cc g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="374232746"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="374232746"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2023 12:42:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="826846345"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="826846345"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by FMSMGA003.fm.intel.com with ESMTP; 23 Aug 2023 12:42:12 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 23 Aug 2023 12:42:11 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 23 Aug 2023 12:42:11 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 23 Aug 2023 12:42:11 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 23 Aug 2023 12:42:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bYuylbQxmvAOC0TkhxEWeSzfelvk7+vbGY5JqNPa009L9UMXhLJ6q7SaXVQSgq/GbGYI6YeanFnKmbddLnOvdJx1xd7Czes0sqTKcGu+C/sTQTrqLe0yyh3uFO//QYsYGSl3Ow5pCeEAX1qSqoTkbZobdVhSHsUByUbZSPiR8SOh6hcUpV3z2sIHw/q34fkBASWGxGwMVgGhIblNVfJsAGwEQlSjk1itgS7MTFRDO+absf26qUA1Qzqfma4ES8mSsUZws5FKizqWJmxGPozSofR9QHPhtVX+GSHajmoxOuyN+hDSoWNUB/cQRNQKO8SSMLRAeNjmZJBMpbYY1or31g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ud6yW59c5yzNEZF9febGUXwSry9PPTcr4MtAEWT/5Qk=;
 b=arAsRLz6Cx6UG4izhHapt5wqUYYJJ05oWw9RlHsi01EyUEoJ47ma16HjWJqD2SmDayoK4CgpGjV6iocRCNEewaJRokeWx6/WsKfTioJzYk/L6qlw0s8AS/ZeDAO76I0bGXndesS+Jclzu/I9zWrghJfl7QTg+q0VzoP8gtmSSHR8lK6/JIpxGF2UZd/CVSWSIs7NPtGlG2c5x6aiLiEy4QdSCENWE62QXLE3VNl+H+vInYxuM4O0sCy+B0HVDTktN3xdxIw6fEJPDfPKUYp4kgpVvPEhyip+fr4jIyjmnxnGO181rC3n9kR9X5y2Oz3gAd6nY16w46ZPCJsDA17KEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2987.namprd11.prod.outlook.com (2603:10b6:5:65::14) by
 SJ2PR11MB8449.namprd11.prod.outlook.com (2603:10b6:a03:56f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.26; Wed, 23 Aug
 2023 19:42:07 +0000
Received: from DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::55d8:709a:ac58:ae0e]) by DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::55d8:709a:ac58:ae0e%3]) with mapi id 15.20.6699.022; Wed, 23 Aug 2023
 19:42:06 +0000
Date: Wed, 23 Aug 2023 12:41:56 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Message-ID: <ZOZhBORKR73gRJvJ@orsosgc001>
References: <20230808013159.38811-1-ashutosh.dixit@intel.com>
 <20230808013159.38811-5-ashutosh.dixit@intel.com>
 <ZOTZ2EsiZOHI5hnc@orsosgc001>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZOTZ2EsiZOHI5hnc@orsosgc001>
X-ClientProxiedBy: MW4PR04CA0243.namprd04.prod.outlook.com
 (2603:10b6:303:88::8) To DM6PR11MB2987.namprd11.prod.outlook.com
 (2603:10b6:5:65::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2987:EE_|SJ2PR11MB8449:EE_
X-MS-Office365-Filtering-Correlation-Id: 9eefa687-c502-4c4d-dabd-08dba4110850
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CmWwtl4F2cm7ByXi8vWWtHnfVyZ5ixWXT52qJLEklL8xpIzEEjXRk76uUiEHd0FlTxXPO72+ZXCLS4R/XJM7hJF3NF0orOpryOBuUEeBFHLMcQJA1h3XMf3qeqvx1NJC6GldGMG/5uoPkM3nfWBCemiTTabmUD694CT//69sGZOnA9+M+rquTjMHyizvreoq5uD71tYMCej34IjvkeQ/na484088rzINPUXN9tTDGg45w90Qmn4yAVR6lZj9FY7aXT3yBu83QrCR62aXEHqvWfRChX5o3FnQIZLYxHLUPm93usH2cggpDCIFTzhoRoRnoMLB2nyCV8MZgPFP2tebmme2T57LXO8Ec0MTrx9MBM7XWA4X08Fl6uC6qxXGYAXivkPmk3DkvtxUtZOONAtJ+3uIIJ8ty3PzMbPorGUOS6JzMXE+XwWHqBngtK8lV52YZEIbLGsph4ZG6c5n7fDezp2OHfgOgwX2uanT38i+mws47pexGvOGvzs1pM3JkfqzSNW+y+l5dA1UyRtUjPaRc4JV8lxwPLPzM59ZbPICIALY8/RVpks+g8HTh9uqnD9F
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2987.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(366004)(346002)(39860400002)(396003)(136003)(376002)(451199024)(186009)(1800799009)(30864003)(83380400001)(2906002)(6506007)(66946007)(6486002)(478600001)(6862004)(26005)(5660300002)(8676002)(4326008)(8936002)(38100700002)(6666004)(9686003)(6636002)(66476007)(316002)(66556008)(6512007)(41300700001)(82960400001)(86362001)(33716001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?alZPa1NlSDBuWFo0TzlyZzY3RmlmSzdIazN5Z0xDNEsxaTNLYTFyTVg0ajNJ?=
 =?utf-8?B?RG9wTDl3cTdEdDVYaEpKeDIyVzQrZTV1ZkV6ZDUrNG5QTHVmM0g1V0dSRUZE?=
 =?utf-8?B?SXRQOUdZNWhCNFZ5ajlXTEZ2bHRlQWt0UGdXRnBZa3U4aXJXWnNTMjNRMWFZ?=
 =?utf-8?B?ZFRyS3U5eHA1S0NpdXd2RmF0cjh4VEhJbGNCbnJ5NDc3UW9vMS9MNkVSamFs?=
 =?utf-8?B?THNKdlozOVVGU05CTDh1MktvdnRaNmM5UEJLMVQxeXBwczBxWnNyd2ErNnRr?=
 =?utf-8?B?b3dOL2R0bFB2ZVN3eWlPZzczbUUvbVVVYUlUM2tiMDVZcTdERzBEY1A2VjBS?=
 =?utf-8?B?N0g2aHRGMXc2K3cvcy9BU0FMYkVRUG1NTTE5N1lWWTdsaWFLZ2dmTjJwcVVu?=
 =?utf-8?B?ZHF0eWNXUWFKRlN0Y1ZmamU4Z2NsS3hzTE51c0dHTFhzU3Y4VkJxSXdXT3cx?=
 =?utf-8?B?T3lYOXZReTRLaDhlZUVTMU9YZ05IUDM2dFlMb1NESzFXSUZvblRvNG1TbEtv?=
 =?utf-8?B?MTMvb0N6UjNzMXJmeG05YXllM0FoNEFKZWltbEJJZ0lFeUU5Z1NOVWVxRDBp?=
 =?utf-8?B?eWloR1NWS0oyemdNb1VmeHVLVFRZaHdidGhIdXZCakw0eGlERjR6OUduMitx?=
 =?utf-8?B?bVd0REEyZHVuTXVEckJxQlk5SEs0UHY4dkxSZXFZVWF2R29ybjd3QjFxVVF0?=
 =?utf-8?B?OG04alAvSVlMMDdpOVVpQks1V0I2RHU5MnE4Ui9YdjVJSm1KZnlaaE5WY2pK?=
 =?utf-8?B?Y2hwWmJGdk9LY2JaL2xxS3hkamFjWXQ3ZWpla2JMMHVNckpLQzhmTzJFbWJV?=
 =?utf-8?B?L3MrKys0NGFMTGlaOTY0MXFjdjkyYmtnOFUzSDlkZlBmVndQZlAyQVJTZHFI?=
 =?utf-8?B?bER0MHl6VDl5Z2RzZXJnVVNnbW1HdVhJakRTQzdsNTQrSWNpZm5xSUxjck9F?=
 =?utf-8?B?dWdldm85NUhLbUIvTWNpUEpFM1pkRXB0STM3MVRLeklod0tLOVNzWHJ6TWJL?=
 =?utf-8?B?VXZjdnRGRFdmMS9yeGJuNXNldElZZGNRVS9saXlWdFQ3LzZWcEJvMURDd3ps?=
 =?utf-8?B?ZmJYNERxZmM1Nmd3NVhsZWgwV2VEcXM3TWZNa2hSSTdjZUYwRVlpTzlYcktW?=
 =?utf-8?B?QlQ3bm9jV3M4Q2NQZFZOY3NXY3FvZ0JUOUV6UEV5c0RmU1dCMHEzVG1UM2tX?=
 =?utf-8?B?eFA4ZCtxdVo1SXArSGpPVERLcXFxa2crNzR5RmtCZ0tNamhrU1lwTVpKY3ZL?=
 =?utf-8?B?TUNlUzNTYmRPOGcrTTVIN3ZhMXVVZ3dSUmtJSUhId2UwTnlYcTdnQzhoSVZZ?=
 =?utf-8?B?Qkl5ci9oRVBXZ1BBeC9OS1dHc21jbEJITEZGeThIOCsyN2RaUEFpdE9QTlda?=
 =?utf-8?B?ck9XOXJ0M0UwYWovY1ZuaXZjUndZbVV4UStFRlVPY1lTSlowQTVCSUtMV21K?=
 =?utf-8?B?eHhZU2NOWkQzV21Dd1puVkNRdS9SaGRuWjZBRXFxOEFTeXUvUjMreTBKalpO?=
 =?utf-8?B?SWNTWGt0YW5RUHltOG5qS2VGQlRvTlh3WWJTQlVIUGYzdEg4R0hENWY2QlhL?=
 =?utf-8?B?R0dXSDZQQ3cxaVBrTTAzZkx6R2tmUVYrdmx3MXNzRnN6THFxZXZYMGFIRkJH?=
 =?utf-8?B?TVFVSnpCVEJubWV5Y1NkTTllK2UyYjNPbC9aZGxLczcxSWFmY3prbjF4U1p3?=
 =?utf-8?B?NEFVQ016Y2lyd1ZkdG9wSzFIN0g1K3c5N1V4MFp6cjcwb3dWTTV0UTZJZE1i?=
 =?utf-8?B?NkQzMzVWQ2FTQ2dmaWcyVDVaSytORXFQY1hMUDQ0bTVKN0t2akc5blRtbUo2?=
 =?utf-8?B?Mk5DZm5Mc1FsMElhWktiRTBmSmI5ckoxZWF0Q1VMRU5VOGZBTi9Xby9jN1FB?=
 =?utf-8?B?bHppMWxSa3FaSVhOZTBDSml4Zjd0V3pJdGxlVUdPZ21vc1luZm1LenVsUXdY?=
 =?utf-8?B?QUlBWVg0cWhVU3l5U2ErYnZreHlxRzB3TjJGSElvams3WnFhWit5SzB6SDJi?=
 =?utf-8?B?eXFORU40MyszOWVRTUxjRUk4akkxWkhsY0lsb0VaelBQU3V6TWtNNVVhcEwx?=
 =?utf-8?B?Yy9sY1lRYU9rbkNrbXQ1R0N5c0R2ZUZEbkdJcmkvd2NndG0zSnR5MlJNaEI3?=
 =?utf-8?B?ejZOYnBZNE5rSTJqV2RCN3RybXlZem94R3ZEcyt3M3ZDMTQzcmlKUVJtTjE2?=
 =?utf-8?Q?41Kaq74yhyNcoumpkAm3Ctc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9eefa687-c502-4c4d-dabd-08dba4110850
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2023 19:42:06.6262 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hz75TYe+4Sxw/dJlvhnLfUajXjH/PLhnd6AUQFElnWtQHukMqCZAD6ypH9evzCPAi0t9nATCR8MZjoxyB20E5zxhtH9I30+FcRE1OqTcgL8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8449
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 04/10] drm/xe/oa: Module init/exit and
 probe/remove
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

On Tue, Aug 22, 2023 at 08:52:56AM -0700, Umesh Nerlige Ramappa wrote:
>On Mon, Aug 07, 2023 at 06:31:53PM -0700, Ashutosh Dixit wrote:
>>Perform OA initialization at module init and probe time:
>>
>>* Setup perf_stream_paranoid and oa_max_sample_rate files in /proc
>>* Setup metrics sysfs directories to expose which metrics configurations
>> are available
>>* Setup OA groups which associate hw engines with OA units
>>* Initialize OA units
>>
>>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>>---
>>drivers/gpu/drm/xe/Makefile             |   1 +
>>drivers/gpu/drm/xe/xe_device.c          |  11 +
>>drivers/gpu/drm/xe/xe_device_types.h    |   4 +
>>drivers/gpu/drm/xe/xe_gt_types.h        |   4 +
>>drivers/gpu/drm/xe/xe_hw_engine_types.h |   2 +
>>drivers/gpu/drm/xe/xe_module.c          |   5 +
>>drivers/gpu/drm/xe/xe_oa.c              | 310 ++++++++++++++++++++++++
>>drivers/gpu/drm/xe/xe_oa.h              |  18 ++
>>8 files changed, 355 insertions(+)
>>create mode 100644 drivers/gpu/drm/xe/xe_oa.c
>>create mode 100644 drivers/gpu/drm/xe/xe_oa.h
>>
>>diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>>index 1b59702cd9f98..01280233ff271 100644
>>--- a/drivers/gpu/drm/xe/Makefile
>>+++ b/drivers/gpu/drm/xe/Makefile
>>@@ -84,6 +84,7 @@ xe-y += xe_bb.o \
>>	xe_mmio.o \
>>	xe_mocs.o \
>>	xe_module.o \
>>+	xe_oa.o \
>>	xe_pat.o \
>>	xe_pci.o \
>>	xe_pcode.o \
>>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>>index 766df07de979c..1c54cac0a117f 100644
>>--- a/drivers/gpu/drm/xe/xe_device.c
>>+++ b/drivers/gpu/drm/xe/xe_device.c
>>@@ -25,6 +25,7 @@
>>#include "xe_irq.h"
>>#include "xe_mmio.h"
>>#include "xe_module.h"
>>+#include "xe_oa.h"
>>#include "xe_pcode.h"
>>#include "xe_pm.h"
>>#include "xe_query.h"
>>@@ -323,6 +324,10 @@ int xe_device_probe(struct xe_device *xe)
>>			goto err_irq_shutdown;
>>	}
>>
>>+	err = xe_oa_init(xe);
>>+	if (err)
>>+		goto err_irq_shutdown;
>>+
>>	err = xe_display_init(xe);
>>	if (err)
>>		goto err_fini_display;
>>@@ -333,6 +338,8 @@ int xe_device_probe(struct xe_device *xe)
>>
>>	xe_display_register(xe);
>>
>>+	xe_oa_register(xe);
>>+
>>	xe_debugfs_register(xe);
>>
>>	err = drmm_add_action_or_reset(&xe->drm, xe_device_sanitize, xe);
>>@@ -361,10 +368,14 @@ static void xe_device_remove_display(struct xe_device *xe)
>>
>>void xe_device_remove(struct xe_device *xe)
>>{
>>+	xe_oa_unregister(xe);
>>+
>>	xe_device_remove_display(xe);
>>
>>	xe_display_unlink(xe);
>>
>>+	xe_oa_fini(xe);
>>+
>>	xe_irq_shutdown(xe);
>>}
>>
>>diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>>index f84ecb976f5d4..3b487905306b7 100644
>>--- a/drivers/gpu/drm/xe/xe_device_types.h
>>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>>@@ -16,6 +16,7 @@
>>#include "xe_gt_types.h"
>>#include "xe_platform_types.h"
>>#include "xe_step_types.h"
>>+#include "xe_oa.h"
>>
>>#if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
>>#include "ext/intel_device_info.h"
>>@@ -376,6 +377,9 @@ struct xe_device {
>>	 */
>>	struct task_struct *pm_callback_task;
>>
>>+	/** @oa: oa perf counter subsystem */
>>+	struct xe_oa oa;
>>+
>>	/* private: */
>>
>>#if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
>>diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
>>index 35b8c19fa8bf5..d6053f85dbb60 100644
>>--- a/drivers/gpu/drm/xe/xe_gt_types.h
>>+++ b/drivers/gpu/drm/xe/xe_gt_types.h
>>@@ -13,6 +13,7 @@
>>#include "xe_reg_sr_types.h"
>>#include "xe_sa_types.h"
>>#include "xe_uc_types.h"
>>+#include "xe_oa.h"
>>
>>struct xe_exec_queue_ops;
>>struct xe_migrate;
>>@@ -346,6 +347,9 @@ struct xe_gt {
>>		/** @oob: bitmap with active OOB workaroudns */
>>		unsigned long *oob;
>>	} wa_active;
>>+
>>+	/** @oa: oa perf counter subsystem per gt info */
>>+	struct xe_oa_gt oa;
>
>I don't see a reference to this, so thought we could drop it. OR can 
>you point me to where this is used?

yikes, not this. I wanted to comment on the xe_oa member in xe_device 
structure. The xe_oa is not used... I think.

Umesh

>
>Umesh
>
>>};
>>
>>#endif
>>diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
>>index 97d9ba31b5fc7..92bb30433353c 100644
>>--- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
>>+++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
>>@@ -144,6 +144,8 @@ struct xe_hw_engine {
>>	enum xe_hw_engine_id engine_id;
>>	/** @eclass: pointer to per hw engine class interface */
>>	struct xe_hw_engine_class_intf *eclass;
>>+	/** @oa_group: oa unit for this hw engine */
>>+	struct xe_oa_group *oa_group;
>>};
>>
>>/**
>>diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
>>index de85494e2280b..460e8161c6f21 100644
>>--- a/drivers/gpu/drm/xe/xe_module.c
>>+++ b/drivers/gpu/drm/xe/xe_module.c
>>@@ -11,6 +11,7 @@
>>#include "xe_drv.h"
>>#include "xe_hw_fence.h"
>>#include "xe_module.h"
>>+#include "xe_oa.h"
>>#include "xe_pci.h"
>>#include "xe_sched_job.h"
>>
>>@@ -53,6 +54,10 @@ static const struct init_funcs init_funcs[] = {
>>		.init = xe_register_pci_driver,
>>		.exit = xe_unregister_pci_driver,
>>	},
>>+	{
>>+		.init = xe_oa_sysctl_register,
>>+		.exit = xe_oa_sysctl_unregister,
>>+	},
>>};
>>
>>static int __init xe_init(void)
>>diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
>>new file mode 100644
>>index 0000000000000..d44ef611c76eb
>>--- /dev/null
>>+++ b/drivers/gpu/drm/xe/xe_oa.c
>>@@ -0,0 +1,310 @@
>>+// SPDX-License-Identifier: MIT
>>+/*
>>+ * Copyright © 2023 Intel Corporation
>>+ */
>>+
>>+#include <linux/anon_inodes.h>
>>+#include <linux/nospec.h>
>>+#include <linux/sizes.h>
>>+#include <linux/uuid.h>
>>+
>>+#include <drm/xe_drm.h>
>>+#include <drm/drm_drv.h>
>>+
>>+#include "regs/xe_oa_regs.h"
>>+#include "xe_gt.h"
>>+#include "xe_device.h"
>>+#include "xe_oa.h"
>>+
>>+static u32 xe_oa_stream_paranoid = true;
>>+static int xe_oa_sample_rate_hard_limit;
>>+static u32 xe_oa_max_sample_rate = 100000;
>>+
>>+static const struct xe_oa_format oa_formats[] = {
>>+	[XE_OA_FORMAT_C4_B8]			= { 7, 64 },
>>+	[XE_OA_FORMAT_A12]			= { 0, 64 },
>>+	[XE_OA_FORMAT_A12_B8_C8]		= { 2, 128 },
>>+	[XE_OA_FORMAT_A32u40_A4u32_B8_C8]	= { 5, 256 },
>>+	[XE_OAR_FORMAT_A32u40_A4u32_B8_C8]	= { 5, 256 },
>>+	[XE_OA_FORMAT_A24u40_A14u32_B8_C8]	= { 5, 256 },
>>+	[XE_OAM_FORMAT_MPEC8u64_B8_C8]		= { 1, 192, TYPE_OAM, HDR_64_BIT },
>>+	[XE_OAM_FORMAT_MPEC8u32_B8_C8]		= { 2, 128, TYPE_OAM, HDR_64_BIT },
>>+};
>>+
>>+static struct ctl_table_header *sysctl_header;
>>+
>>+void xe_oa_register(struct xe_device *xe)
>>+{
>>+	struct xe_oa *oa = &xe->oa;
>>+
>>+	if (!oa->xe)
>>+		return;
>>+
>>+	oa->metrics_kobj = kobject_create_and_add("metrics",
>>+						  &xe->drm.primary->kdev->kobj);
>>+}
>>+
>>+void xe_oa_unregister(struct xe_device *xe)
>>+{
>>+	struct xe_oa *oa = &xe->oa;
>>+
>>+	if (!oa->metrics_kobj)
>>+		return;
>>+
>>+	kobject_put(oa->metrics_kobj);
>>+	oa->metrics_kobj = NULL;
>>+}
>>+
>>+static u32 num_oa_groups_per_gt(struct xe_gt *gt)
>>+{
>>+	return 1;
>>+}
>>+
>>+static u32 __oam_engine_group(struct xe_hw_engine *hwe)
>>+{
>>+	if (GRAPHICS_VERx100(gt_to_xe(hwe->gt)) >= 1270) {
>>+		/*
>>+		 * There's 1 SAMEDIA gt and 1 OAM per SAMEDIA gt. All media slices
>>+		 * within the gt use the same OAM. All MTL SKUs list 1 SA MEDIA.
>>+		 */
>>+		drm_WARN_ON(&hwe->gt->tile->xe->drm,
>>+			    hwe->gt->info.type != XE_GT_TYPE_MEDIA);
>>+
>>+		return OA_GROUP_OAM_SAMEDIA_0;
>>+	}
>>+
>>+	return OA_GROUP_INVALID;
>>+}
>>+
>>+static u32 __oa_engine_group(struct xe_hw_engine *hwe)
>>+{
>>+	switch (hwe->class) {
>>+	case XE_ENGINE_CLASS_RENDER:
>>+		return OA_GROUP_OAG;
>>+
>>+	case XE_ENGINE_CLASS_VIDEO_DECODE:
>>+	case XE_ENGINE_CLASS_VIDEO_ENHANCE:
>>+		return __oam_engine_group(hwe);
>>+
>>+	default:
>>+		return OA_GROUP_INVALID;
>>+	}
>>+}
>>+
>>+static struct xe_oa_regs __oam_regs(u32 base)
>>+{
>>+	return (struct xe_oa_regs) {
>>+		base,
>>+		GEN12_OAM_HEAD_POINTER(base),
>>+		GEN12_OAM_TAIL_POINTER(base),
>>+		GEN12_OAM_BUFFER(base),
>>+		GEN12_OAM_CONTEXT_CONTROL(base),
>>+		GEN12_OAM_CONTROL(base),
>>+		GEN12_OAM_DEBUG(base),
>>+		GEN12_OAM_STATUS(base),
>>+		GEN12_OAM_CONTROL_COUNTER_FORMAT_SHIFT,
>>+	};
>>+}
>>+
>>+static struct xe_oa_regs __oag_regs(void)
>>+{
>>+	return (struct xe_oa_regs) {
>>+		0,
>>+		GEN12_OAG_OAHEADPTR,
>>+		GEN12_OAG_OATAILPTR,
>>+		GEN12_OAG_OABUFFER,
>>+		GEN12_OAG_OAGLBCTXCTRL,
>>+		GEN12_OAG_OACONTROL,
>>+		GEN12_OAG_OA_DEBUG,
>>+		GEN12_OAG_OASTATUS,
>>+		GEN12_OAG_OACONTROL_OA_COUNTER_FORMAT_SHIFT,
>>+	};
>>+}
>>+
>>+static void xe_oa_init_groups(struct xe_gt *gt)
>>+{
>>+	const u32 mtl_oa_base[] = {
>>+		[OA_GROUP_OAM_SAMEDIA_0] = 0x393000,
>>+	};
>>+	int i, num_groups = gt->oa.num_oa_groups;
>>+
>>+	for (i = 0; i < num_groups; i++) {
>>+		struct xe_oa_group *g = &gt->oa.group[i];
>>+
>>+		/* Fused off engines can result in a group with num_engines == 0 */
>>+		if (g->num_engines == 0)
>>+			continue;
>>+
>>+		if (i == OA_GROUP_OAG && gt->info.type != XE_GT_TYPE_MEDIA) {
>>+			g->regs = __oag_regs();
>>+			g->type = TYPE_OAG;
>>+		} else if (GRAPHICS_VERx100(gt_to_xe(gt)) >= 1270) {
>>+			g->regs = __oam_regs(mtl_oa_base[i]);
>>+			g->type = TYPE_OAM;
>>+		}
>>+
>>+		/* Set oa_unit_ids now to ensure ids remain contiguous. */
>>+		g->oa_unit_id = gt->tile->xe->oa.oa_unit_ids++;
>>+	}
>>+}
>>+
>>+static int xe_oa_init_gt(struct xe_gt *gt)
>>+{
>>+	u32 num_groups = num_oa_groups_per_gt(gt);
>>+	struct xe_hw_engine *hwe;
>>+	enum xe_hw_engine_id id;
>>+	struct xe_oa_group *g;
>>+
>>+	g = kcalloc(num_groups, sizeof(*g), GFP_KERNEL);
>>+	if (!g)
>>+		return -ENOMEM;
>>+
>>+	for_each_hw_engine(hwe, gt, id) {
>>+		u32 index = __oa_engine_group(hwe);
>>+
>>+		hwe->oa_group = NULL;
>>+		if (index < num_groups) {
>>+			g[index].num_engines++;
>>+			hwe->oa_group = &g[index];
>>+		}
>>+	}
>>+
>>+	gt->oa.num_oa_groups = num_groups;
>>+	gt->oa.group = g;
>>+
>>+	xe_oa_init_groups(gt);
>>+
>>+	return 0;
>>+}
>>+
>>+static int xe_oa_init_engine_groups(struct xe_oa *oa)
>>+{
>>+	struct xe_gt *gt;
>>+	int i, ret;
>>+
>>+	for_each_gt(gt, oa->xe, i) {
>>+		ret = xe_oa_init_gt(gt);
>>+		if (ret)
>>+			return ret;
>>+	}
>>+
>>+	return 0;
>>+}
>>+
>>+static void oa_format_add(struct xe_oa *oa, enum drm_xe_oa_format format)
>>+{
>>+	__set_bit(format, oa->format_mask);
>>+}
>>+
>>+static void xe_oa_init_supported_formats(struct xe_oa *oa)
>>+{
>>+	switch (oa->xe->info.platform) {
>>+	case XE_ALDERLAKE_S:
>>+	case XE_ALDERLAKE_P:
>>+		oa_format_add(oa, XE_OA_FORMAT_A12);
>>+		oa_format_add(oa, XE_OA_FORMAT_A12_B8_C8);
>>+		oa_format_add(oa, XE_OA_FORMAT_A32u40_A4u32_B8_C8);
>>+		oa_format_add(oa, XE_OA_FORMAT_C4_B8);
>>+		break;
>>+
>>+	case XE_DG2:
>>+		oa_format_add(oa, XE_OAR_FORMAT_A32u40_A4u32_B8_C8);
>>+		oa_format_add(oa, XE_OA_FORMAT_A24u40_A14u32_B8_C8);
>>+		break;
>>+
>>+	case XE_METEORLAKE:
>>+		oa_format_add(oa, XE_OAR_FORMAT_A32u40_A4u32_B8_C8);
>>+		oa_format_add(oa, XE_OA_FORMAT_A24u40_A14u32_B8_C8);
>>+		oa_format_add(oa, XE_OAM_FORMAT_MPEC8u64_B8_C8);
>>+		oa_format_add(oa, XE_OAM_FORMAT_MPEC8u32_B8_C8);
>>+		break;
>>+
>>+	default:
>>+		drm_err(&oa->xe->drm, "Unknown platform\n");
>>+	}
>>+}
>>+
>>+int xe_oa_init(struct xe_device *xe)
>>+{
>>+	struct xe_oa *oa = &xe->oa;
>>+	struct xe_gt *gt;
>>+	int i, ret;
>>+
>>+	/* Support OA only with GuC submission and Gen12+ */
>>+	if (XE_WARN_ON(!xe_device_guc_submission_enabled(xe)) ||
>>+	    XE_WARN_ON(GRAPHICS_VER(xe) < 12))
>>+		return 0;
>>+
>>+	oa->xe = xe;
>>+	oa->oa_formats = oa_formats;
>>+
>>+	for_each_gt(gt, xe, i)
>>+		mutex_init(&gt->oa.lock);
>>+
>>+	/* Choose a representative limit */
>>+	xe_oa_sample_rate_hard_limit = xe_root_mmio_gt(xe)->info.clock_freq / 2;
>>+
>>+	mutex_init(&oa->metrics_lock);
>>+	idr_init_base(&oa->metrics_idr, 1);
>>+
>>+	ret = xe_oa_init_engine_groups(oa);
>>+	if (ret) {
>>+		drm_err(&xe->drm, "OA initialization failed %d\n", ret);
>>+		return ret;
>>+	}
>>+
>>+	xe_oa_init_supported_formats(oa);
>>+
>>+	oa->xe = xe;
>>+	return 0;
>>+}
>>+
>>+void xe_oa_fini(struct xe_device *xe)
>>+{
>>+	struct xe_oa *oa = &xe->oa;
>>+	struct xe_gt *gt;
>>+	int i;
>>+
>>+	if (!oa->xe)
>>+		return;
>>+
>>+	for_each_gt(gt, xe, i)
>>+		kfree(gt->oa.group);
>>+
>>+	idr_destroy(&oa->metrics_idr);
>>+
>>+	oa->xe = NULL;
>>+}
>>+
>>+static struct ctl_table oa_ctl_table[] = {
>>+	{
>>+	 .procname = "perf_stream_paranoid",
>>+	 .data = &xe_oa_stream_paranoid,
>>+	 .maxlen = sizeof(xe_oa_stream_paranoid),
>>+	 .mode = 0644,
>>+	 .proc_handler = proc_dointvec_minmax,
>>+	 .extra1 = SYSCTL_ZERO,
>>+	 .extra2 = SYSCTL_ONE,
>>+	 },
>>+	{
>>+	 .procname = "oa_max_sample_rate",
>>+	 .data = &xe_oa_max_sample_rate,
>>+	 .maxlen = sizeof(xe_oa_max_sample_rate),
>>+	 .mode = 0644,
>>+	 .proc_handler = proc_dointvec_minmax,
>>+	 .extra1 = SYSCTL_ZERO,
>>+	 .extra2 = &xe_oa_sample_rate_hard_limit,
>>+	 },
>>+	{}
>>+};
>>+
>>+int xe_oa_sysctl_register(void)
>>+{
>>+	sysctl_header = register_sysctl("dev/xe", oa_ctl_table);
>>+	return 0;
>>+}
>>+
>>+void xe_oa_sysctl_unregister(void)
>>+{
>>+	unregister_sysctl_table(sysctl_header);
>>+}
>>diff --git a/drivers/gpu/drm/xe/xe_oa.h b/drivers/gpu/drm/xe/xe_oa.h
>>new file mode 100644
>>index 0000000000000..ba4ba80fd34cb
>>--- /dev/null
>>+++ b/drivers/gpu/drm/xe/xe_oa.h
>>@@ -0,0 +1,18 @@
>>+/* SPDX-License-Identifier: MIT */
>>+/*
>>+ * Copyright © 2023 Intel Corporation
>>+ */
>>+
>>+#ifndef _XE_OA_H_
>>+#define _XE_OA_H_
>>+
>>+#include "xe_oa_types.h"
>>+
>>+int xe_oa_init(struct xe_device *xe);
>>+void xe_oa_fini(struct xe_device *xe);
>>+void xe_oa_register(struct xe_device *xe);
>>+void xe_oa_unregister(struct xe_device *xe);
>>+int xe_oa_sysctl_register(void);
>>+void xe_oa_sysctl_unregister(void);
>>+
>>+#endif
>>-- 
>>2.41.0
>>
