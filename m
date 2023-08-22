Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 475AAEE4993
	for <intel-xe@archiver.kernel.org>; Tue, 22 Aug 2023 15:53:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C9A810E3A2;
	Tue, 22 Aug 2023 15:53:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC1C110E3A2
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Aug 2023 15:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692719585; x=1724255585;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=woFykmPssFAptc/M/r1eUYBN7v+Vsm5Apd2Q5i9LvR4=;
 b=bwpzVKlDfMAYVm0onembpkjt1EvW6KUXByzsBK9zV6miQmlfv9oPUrot
 7kYWuEkbnd3k/8GKq0PbW074jxDC5J/8auQip26W0ZgzIebfZsZhSGCPz
 NGX+2AEIuVvKOqglfn5mkGJTvFrU/g4iKP/fbHenfKQIDcRN1HPhgSRU2
 yxF/nsS/KXFAUycKiR3l44NK8i911eXI/dsdZu7/LjgG635iUdFZu8BRv
 Qwxa4Med72/SDTKYA75aDvtE7+c8U9ltgZ8uAJbEDhCKrfg5sCtX3DM0p
 QzNYy4Zv43khXoB6RqKBRdoZuQLTWfkw9/GNBS4/dfxZFW0oazvK+9IlJ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="437848768"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; d="scan'208";a="437848768"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2023 08:53:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="850675823"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; d="scan'208";a="850675823"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga002.fm.intel.com with ESMTP; 22 Aug 2023 08:53:03 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 22 Aug 2023 08:53:02 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 22 Aug 2023 08:53:02 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 22 Aug 2023 08:53:02 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 22 Aug 2023 08:53:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OQmgQoPYvUNDcLMVWTteZVYbYIVcnPnYuJlw+ByKavIGc5OxQG0A3+WwGtc2yYryzwihklbLJkBSOlZCik55knVuR75Kt8qX+btPYvViXDPYJuvhQhzdOy0Ks/gfi1s++YFCv5Iolc+bIWeB2kc/wG3kuUr6+hkqvL2qvQD96GbQTqOuju91GwkS+GFidbAovupx+dB3axXdjQy/F41eYtoR/S+Qp/ZT1+L9I2j0yVPWhMYZ3MvL9yBXkGlLtW/+tr+ceMAwTvQP6lYp65Nf6VCugVkjVcucB3X0GwzGEb98tBWHk6PZaf/TE7GXnoTEyHtKjkIfOBmRJMCmF7VcSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k62cMZFa4IPpVHnyMYQTPYMb84ny6r1/yxNaU97gylE=;
 b=lVpGXpFEYk6FVYzgYFEe8B0GmZOYXAHj6UlhEri256YMylLbsYGUMVqaPtYRkn+Q8VCr3u30NNYdirAi9Y6HPZcZ4ta7JlkdiEzV/rQCU/+EqMKW6CTkoIdaAi9I9NuXdG9fzSNLGk1U45XgRpO35WrnYu+rGUmcxTWZygbZbaVYG2BKpAYUKFQzvEnKroe97ALHxqVmbcxtJ5O5aLI4N8A5Gn9JPfTEXZ6sf3BS2/vSA62xj/nymBExMWUgTBfVQkduStBH52U6b6LcZW6TyYeCjx8jz0wjUBT1G80bL/7PHaUy/hcH36eeGo9gU1MtZ2RrqQ80cizfWy4/+ymICw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2987.namprd11.prod.outlook.com (2603:10b6:5:65::14) by
 SA0PR11MB4525.namprd11.prod.outlook.com (2603:10b6:806:9d::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.24; Tue, 22 Aug 2023 15:52:59 +0000
Received: from DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::55d8:709a:ac58:ae0e]) by DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::55d8:709a:ac58:ae0e%3]) with mapi id 15.20.6699.022; Tue, 22 Aug 2023
 15:52:59 +0000
Date: Tue, 22 Aug 2023 08:52:56 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Message-ID: <ZOTZ2EsiZOHI5hnc@orsosgc001>
References: <20230808013159.38811-1-ashutosh.dixit@intel.com>
 <20230808013159.38811-5-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230808013159.38811-5-ashutosh.dixit@intel.com>
X-ClientProxiedBy: BYAPR05CA0029.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::42) To DM6PR11MB2987.namprd11.prod.outlook.com
 (2603:10b6:5:65::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2987:EE_|SA0PR11MB4525:EE_
X-MS-Office365-Filtering-Correlation-Id: 808183bc-228a-4e78-b558-08dba327dbd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J3uwrSy6QeggEyEm5iGtKIlDW+hcO3Kzn9d80gfrL+yszL4jQ6mkhvzCOfWhxA1uIhM1AC2hfHR1Ek6coSz16JJOOr3ShLihuUqAfp8ESaiKdZUS5Ao70Rd33278WYAxzU5EORZWE5r79UYX3pE66tHweptTQlAJOFkpGMdsHpKIr7olqOE83AWgAXKxy5Gn3UDZ8j9eIFDqOTki7Ebg87kBKpfK9Oq7F/omf274QIAuxkqv8QkcohYMKGNagNlhXNjgRr8/xWgw+ZcE1jJyY2foo4ZQ8XgaRIC6gcUUXoS7x0R1pg+Pb6lIkaBsjd0eDnNS7D0S4vAi0FTpqYGRNMAZhNBRMZ63HyFowwgY3mv1SF32CsqvfiVnmnaev/gW3Tiz3XCRmfSAQHawQdjJWoWjMrEK1SBH2WZoBY7+YA8fa7/WD0M2/OmonOs/F1UfXT8eg2+dPa2J7i1d5/1lZP+q7vfqyYpxCe9RN4p6GjcSav5zminEPMcpFIdzO52K6Vtxnv8g5ezshv87TeqP5aZIzxXhXe6CL4FVyQdlPKhwOgmI7gFtho05lgI5mmoL
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2987.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(346002)(39860400002)(366004)(136003)(396003)(376002)(451199024)(186009)(1800799009)(2906002)(30864003)(83380400001)(6506007)(6486002)(38100700002)(5660300002)(26005)(86362001)(8676002)(4326008)(8936002)(6862004)(316002)(9686003)(6512007)(6636002)(66556008)(66476007)(82960400001)(478600001)(66946007)(6666004)(41300700001)(33716001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bXZzeUpPUjZPdGxpQ0xabnRwMkJ6Q0F3SlVHaE92RzZ5N1diZDYvMVJsR0o2?=
 =?utf-8?B?cWxKRG5OU1lQL2M0YmlRazFGZ0VucjF4MklxWUFjK2Z1ajZjMHY2NHNKbU9u?=
 =?utf-8?B?TDBhTEJXcGppSzlNUUpvalEyQnJiczUraWdyMjBmbXRhUFNwRTVMQktEYm5X?=
 =?utf-8?B?dERiUm5kTHprbUsrWG0vMDFvdk54dFlqd3dFcHVZenZNNXd0NnlwNzE1OUNp?=
 =?utf-8?B?aUlPVjh1QnhJMHlCYm81aUtmTlgweWhMQllHRXZwLzA4RWsrUk9ENHFzTk5J?=
 =?utf-8?B?SGFIYjJsU0JSMHpnZVBkbzYwU3JWaFBLS0xvVVJYWmlTb2ZWN0lFWERkT1JM?=
 =?utf-8?B?eHYyR0d6dTBDdXdHZWY3Tm53dGJ0Vm1YR1VhTEZSVVRxTTAvTWU0UHRtUFl1?=
 =?utf-8?B?SUo4NUx1VElVaTYwdTB2OXhVbHJYN2dnVk9pWURSTFVtc1NoRExXWEdnUUNN?=
 =?utf-8?B?MnZMQ05kOHo1N3JVTTRwZzFPTzJWREs0TWk0YzR6eUQyYmF5NVVBeFc1ZWZk?=
 =?utf-8?B?Yko1akN6STJGNU5HQmlyTUhmZEYrTlRadVBTVXlQTE4xUXJiYkJkdS9kaVA2?=
 =?utf-8?B?TlBjTXR2czNTOTZhTC95VWtVZnBqRXE2LzVGVmhuWGNDNFc2eFdVSy9Cd21S?=
 =?utf-8?B?N1dScnQzU1pRbHY0VU5WZGZGNHlxQ2Y0TGFGaHZXbmRTaUo3MEpkc25kN1Fx?=
 =?utf-8?B?WXovSXZDaHYxdVVOU3RWNytlYVBlbDZ0UzR3d0ltdldXWkhpMnFxVkRoZXlk?=
 =?utf-8?B?UTBzSU9PbHFBYmdaWmNuVUpNNTRaQ1VEdXNXZ09uZWhQNGZldG5UZXR2cWJ4?=
 =?utf-8?B?ZzVNVEo1cGxlMkhmUnQ0NnNRVFBzbTRNS0F5NmxkVVN5NFlxOXE4bkpFR1BJ?=
 =?utf-8?B?ODlUS2EwSU5CeEc5eVpjdVJaV2RkUllyWDZ1UGE4TVlQek4xMkRCOHUzMkJW?=
 =?utf-8?B?T0M0MDYwQmN2WllsSVFQVllKbHdqWTNlcDNhanVGalNaYjhnRFllcjhQOThr?=
 =?utf-8?B?a3FsTU5pa0lOK2x0cGM3b29ZYmJ2SjBFeVBuRHZUOEQzaFVEZWxTWGhPWk1x?=
 =?utf-8?B?ODBVOG9Hc1dVL1ZiVHlnVGNNRThUWXFNbkh5eXhsMkFGVDhBSUoxaEMxbzdS?=
 =?utf-8?B?eTVlMHEyb0VjM0Vhb0pyMDByNUQvYmFIc242RGQrOGJJVGRVUVkwb2lmbGlO?=
 =?utf-8?B?RDJkN01jMDhLVnRwT3RUUDYzYmNlYmN3VjRaYjhoekxKalBLTWFWTHZSdXVp?=
 =?utf-8?B?Z2prQzNDM0VCZVdRa0g1QlZ4aVNYVlBOYUlRUXpNUzBDMFBkVGwwcC9QQ0x6?=
 =?utf-8?B?Z0hPOHJqeS9RRkxERFphdjJVelJxeVZERWl1RW9HN0FSM2k2UVZacjJoN3FN?=
 =?utf-8?B?WXJwakUvRXBjbjJyZS9lemtFa2NHOTEyc2xpWkRrUmphK0FXUG4wOGdzaGdG?=
 =?utf-8?B?MHkzcG0wSXdEaENRaG8wd0lCcWtLUHBtRWpUbGZrYzhkcFNTWEJsWUk3WUNY?=
 =?utf-8?B?NGhVVHZabHF5a2FFZnlHd3VteitVZVBoaTRub0ZqWGxnazJ1MzhDS3Z3Y01q?=
 =?utf-8?B?UFJ1YW9sc1BZQTF6R0RZSEVDOWE4dGpIUFhiaFgxczRFZDlQK3JrdGhjYW1F?=
 =?utf-8?B?ZndDSzROSWEzQm5ZMUR5MjJFcDV2Y3lZTE5pK1B2M1g1alEzZytONFBFdVJZ?=
 =?utf-8?B?NjRwSW4xek43UVM5bW1xZlJvQ2pVaEdaZ1lCbVdJK1BLTExUb01qSDh1Zmt1?=
 =?utf-8?B?dGp3Nnk5WEo5RmM1STR5U21pa1lnSFdaOXo4SER6MnZSN1B5RjVwZlkrNm0x?=
 =?utf-8?B?amkrOXBJTFE2NHVZWTRvTFh1bmhWM2NLb0RZTWJXZ2orSHczUWYvcUFLc2NV?=
 =?utf-8?B?ZUt1RmJkZXh4UzRZMG1OaFpKZWhicDBFOGVJb2d3RkJxMVJTNHdyc2VINENn?=
 =?utf-8?B?aUVZUmRRbkIyU0prZzhoMkVmYVk0YU13Ukc5Q0lpL1Bvc2RkS3NEMnFuUHo5?=
 =?utf-8?B?TlJ5WTk4ZDU1UGxhVTIyK1FLeUdWME0yOXg4bmdoT05WY2JkMkhNUHFUbi9t?=
 =?utf-8?B?ZTczUjNPa2xZeStma1YxYWpUNXRzczlCZDgyK2RNcTRZM0kwSy9jaHA1VitI?=
 =?utf-8?B?ejRVeU15cWZ3RnRzMDhXb1o5enRaVEZra0M4MldVTlNEeXdWaEdBbng5SEd4?=
 =?utf-8?Q?qeyjLV6OAQgWT8o9mmEvRzw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 808183bc-228a-4e78-b558-08dba327dbd0
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 15:52:59.2136 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 44Rq1wNYWeoOmlZFPLGCvuCYHwc70m8M8fUEbOO/0yrlPRZuWZQLTBUEba6LwckPvTjcH46a3TH24Y5kgEqCvuNz4kz6lMS0rmo1T9SDjbI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4525
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

On Mon, Aug 07, 2023 at 06:31:53PM -0700, Ashutosh Dixit wrote:
>Perform OA initialization at module init and probe time:
>
>* Setup perf_stream_paranoid and oa_max_sample_rate files in /proc
>* Setup metrics sysfs directories to expose which metrics configurations
>  are available
>* Setup OA groups which associate hw engines with OA units
>* Initialize OA units
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>---
> drivers/gpu/drm/xe/Makefile             |   1 +
> drivers/gpu/drm/xe/xe_device.c          |  11 +
> drivers/gpu/drm/xe/xe_device_types.h    |   4 +
> drivers/gpu/drm/xe/xe_gt_types.h        |   4 +
> drivers/gpu/drm/xe/xe_hw_engine_types.h |   2 +
> drivers/gpu/drm/xe/xe_module.c          |   5 +
> drivers/gpu/drm/xe/xe_oa.c              | 310 ++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_oa.h              |  18 ++
> 8 files changed, 355 insertions(+)
> create mode 100644 drivers/gpu/drm/xe/xe_oa.c
> create mode 100644 drivers/gpu/drm/xe/xe_oa.h
>
>diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>index 1b59702cd9f98..01280233ff271 100644
>--- a/drivers/gpu/drm/xe/Makefile
>+++ b/drivers/gpu/drm/xe/Makefile
>@@ -84,6 +84,7 @@ xe-y += xe_bb.o \
> 	xe_mmio.o \
> 	xe_mocs.o \
> 	xe_module.o \
>+	xe_oa.o \
> 	xe_pat.o \
> 	xe_pci.o \
> 	xe_pcode.o \
>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>index 766df07de979c..1c54cac0a117f 100644
>--- a/drivers/gpu/drm/xe/xe_device.c
>+++ b/drivers/gpu/drm/xe/xe_device.c
>@@ -25,6 +25,7 @@
> #include "xe_irq.h"
> #include "xe_mmio.h"
> #include "xe_module.h"
>+#include "xe_oa.h"
> #include "xe_pcode.h"
> #include "xe_pm.h"
> #include "xe_query.h"
>@@ -323,6 +324,10 @@ int xe_device_probe(struct xe_device *xe)
> 			goto err_irq_shutdown;
> 	}
>
>+	err = xe_oa_init(xe);
>+	if (err)
>+		goto err_irq_shutdown;
>+
> 	err = xe_display_init(xe);
> 	if (err)
> 		goto err_fini_display;
>@@ -333,6 +338,8 @@ int xe_device_probe(struct xe_device *xe)
>
> 	xe_display_register(xe);
>
>+	xe_oa_register(xe);
>+
> 	xe_debugfs_register(xe);
>
> 	err = drmm_add_action_or_reset(&xe->drm, xe_device_sanitize, xe);
>@@ -361,10 +368,14 @@ static void xe_device_remove_display(struct xe_device *xe)
>
> void xe_device_remove(struct xe_device *xe)
> {
>+	xe_oa_unregister(xe);
>+
> 	xe_device_remove_display(xe);
>
> 	xe_display_unlink(xe);
>
>+	xe_oa_fini(xe);
>+
> 	xe_irq_shutdown(xe);
> }
>
>diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>index f84ecb976f5d4..3b487905306b7 100644
>--- a/drivers/gpu/drm/xe/xe_device_types.h
>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>@@ -16,6 +16,7 @@
> #include "xe_gt_types.h"
> #include "xe_platform_types.h"
> #include "xe_step_types.h"
>+#include "xe_oa.h"
>
> #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
> #include "ext/intel_device_info.h"
>@@ -376,6 +377,9 @@ struct xe_device {
> 	 */
> 	struct task_struct *pm_callback_task;
>
>+	/** @oa: oa perf counter subsystem */
>+	struct xe_oa oa;
>+
> 	/* private: */
>
> #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
>diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
>index 35b8c19fa8bf5..d6053f85dbb60 100644
>--- a/drivers/gpu/drm/xe/xe_gt_types.h
>+++ b/drivers/gpu/drm/xe/xe_gt_types.h
>@@ -13,6 +13,7 @@
> #include "xe_reg_sr_types.h"
> #include "xe_sa_types.h"
> #include "xe_uc_types.h"
>+#include "xe_oa.h"
>
> struct xe_exec_queue_ops;
> struct xe_migrate;
>@@ -346,6 +347,9 @@ struct xe_gt {
> 		/** @oob: bitmap with active OOB workaroudns */
> 		unsigned long *oob;
> 	} wa_active;
>+
>+	/** @oa: oa perf counter subsystem per gt info */
>+	struct xe_oa_gt oa;

I don't see a reference to this, so thought we could drop it. OR can you 
point me to where this is used?

Umesh

> };
>
> #endif
>diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
>index 97d9ba31b5fc7..92bb30433353c 100644
>--- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
>+++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
>@@ -144,6 +144,8 @@ struct xe_hw_engine {
> 	enum xe_hw_engine_id engine_id;
> 	/** @eclass: pointer to per hw engine class interface */
> 	struct xe_hw_engine_class_intf *eclass;
>+	/** @oa_group: oa unit for this hw engine */
>+	struct xe_oa_group *oa_group;
> };
>
> /**
>diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
>index de85494e2280b..460e8161c6f21 100644
>--- a/drivers/gpu/drm/xe/xe_module.c
>+++ b/drivers/gpu/drm/xe/xe_module.c
>@@ -11,6 +11,7 @@
> #include "xe_drv.h"
> #include "xe_hw_fence.h"
> #include "xe_module.h"
>+#include "xe_oa.h"
> #include "xe_pci.h"
> #include "xe_sched_job.h"
>
>@@ -53,6 +54,10 @@ static const struct init_funcs init_funcs[] = {
> 		.init = xe_register_pci_driver,
> 		.exit = xe_unregister_pci_driver,
> 	},
>+	{
>+		.init = xe_oa_sysctl_register,
>+		.exit = xe_oa_sysctl_unregister,
>+	},
> };
>
> static int __init xe_init(void)
>diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
>new file mode 100644
>index 0000000000000..d44ef611c76eb
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_oa.c
>@@ -0,0 +1,310 @@
>+// SPDX-License-Identifier: MIT
>+/*
>+ * Copyright © 2023 Intel Corporation
>+ */
>+
>+#include <linux/anon_inodes.h>
>+#include <linux/nospec.h>
>+#include <linux/sizes.h>
>+#include <linux/uuid.h>
>+
>+#include <drm/xe_drm.h>
>+#include <drm/drm_drv.h>
>+
>+#include "regs/xe_oa_regs.h"
>+#include "xe_gt.h"
>+#include "xe_device.h"
>+#include "xe_oa.h"
>+
>+static u32 xe_oa_stream_paranoid = true;
>+static int xe_oa_sample_rate_hard_limit;
>+static u32 xe_oa_max_sample_rate = 100000;
>+
>+static const struct xe_oa_format oa_formats[] = {
>+	[XE_OA_FORMAT_C4_B8]			= { 7, 64 },
>+	[XE_OA_FORMAT_A12]			= { 0, 64 },
>+	[XE_OA_FORMAT_A12_B8_C8]		= { 2, 128 },
>+	[XE_OA_FORMAT_A32u40_A4u32_B8_C8]	= { 5, 256 },
>+	[XE_OAR_FORMAT_A32u40_A4u32_B8_C8]	= { 5, 256 },
>+	[XE_OA_FORMAT_A24u40_A14u32_B8_C8]	= { 5, 256 },
>+	[XE_OAM_FORMAT_MPEC8u64_B8_C8]		= { 1, 192, TYPE_OAM, HDR_64_BIT },
>+	[XE_OAM_FORMAT_MPEC8u32_B8_C8]		= { 2, 128, TYPE_OAM, HDR_64_BIT },
>+};
>+
>+static struct ctl_table_header *sysctl_header;
>+
>+void xe_oa_register(struct xe_device *xe)
>+{
>+	struct xe_oa *oa = &xe->oa;
>+
>+	if (!oa->xe)
>+		return;
>+
>+	oa->metrics_kobj = kobject_create_and_add("metrics",
>+						  &xe->drm.primary->kdev->kobj);
>+}
>+
>+void xe_oa_unregister(struct xe_device *xe)
>+{
>+	struct xe_oa *oa = &xe->oa;
>+
>+	if (!oa->metrics_kobj)
>+		return;
>+
>+	kobject_put(oa->metrics_kobj);
>+	oa->metrics_kobj = NULL;
>+}
>+
>+static u32 num_oa_groups_per_gt(struct xe_gt *gt)
>+{
>+	return 1;
>+}
>+
>+static u32 __oam_engine_group(struct xe_hw_engine *hwe)
>+{
>+	if (GRAPHICS_VERx100(gt_to_xe(hwe->gt)) >= 1270) {
>+		/*
>+		 * There's 1 SAMEDIA gt and 1 OAM per SAMEDIA gt. All media slices
>+		 * within the gt use the same OAM. All MTL SKUs list 1 SA MEDIA.
>+		 */
>+		drm_WARN_ON(&hwe->gt->tile->xe->drm,
>+			    hwe->gt->info.type != XE_GT_TYPE_MEDIA);
>+
>+		return OA_GROUP_OAM_SAMEDIA_0;
>+	}
>+
>+	return OA_GROUP_INVALID;
>+}
>+
>+static u32 __oa_engine_group(struct xe_hw_engine *hwe)
>+{
>+	switch (hwe->class) {
>+	case XE_ENGINE_CLASS_RENDER:
>+		return OA_GROUP_OAG;
>+
>+	case XE_ENGINE_CLASS_VIDEO_DECODE:
>+	case XE_ENGINE_CLASS_VIDEO_ENHANCE:
>+		return __oam_engine_group(hwe);
>+
>+	default:
>+		return OA_GROUP_INVALID;
>+	}
>+}
>+
>+static struct xe_oa_regs __oam_regs(u32 base)
>+{
>+	return (struct xe_oa_regs) {
>+		base,
>+		GEN12_OAM_HEAD_POINTER(base),
>+		GEN12_OAM_TAIL_POINTER(base),
>+		GEN12_OAM_BUFFER(base),
>+		GEN12_OAM_CONTEXT_CONTROL(base),
>+		GEN12_OAM_CONTROL(base),
>+		GEN12_OAM_DEBUG(base),
>+		GEN12_OAM_STATUS(base),
>+		GEN12_OAM_CONTROL_COUNTER_FORMAT_SHIFT,
>+	};
>+}
>+
>+static struct xe_oa_regs __oag_regs(void)
>+{
>+	return (struct xe_oa_regs) {
>+		0,
>+		GEN12_OAG_OAHEADPTR,
>+		GEN12_OAG_OATAILPTR,
>+		GEN12_OAG_OABUFFER,
>+		GEN12_OAG_OAGLBCTXCTRL,
>+		GEN12_OAG_OACONTROL,
>+		GEN12_OAG_OA_DEBUG,
>+		GEN12_OAG_OASTATUS,
>+		GEN12_OAG_OACONTROL_OA_COUNTER_FORMAT_SHIFT,
>+	};
>+}
>+
>+static void xe_oa_init_groups(struct xe_gt *gt)
>+{
>+	const u32 mtl_oa_base[] = {
>+		[OA_GROUP_OAM_SAMEDIA_0] = 0x393000,
>+	};
>+	int i, num_groups = gt->oa.num_oa_groups;
>+
>+	for (i = 0; i < num_groups; i++) {
>+		struct xe_oa_group *g = &gt->oa.group[i];
>+
>+		/* Fused off engines can result in a group with num_engines == 0 */
>+		if (g->num_engines == 0)
>+			continue;
>+
>+		if (i == OA_GROUP_OAG && gt->info.type != XE_GT_TYPE_MEDIA) {
>+			g->regs = __oag_regs();
>+			g->type = TYPE_OAG;
>+		} else if (GRAPHICS_VERx100(gt_to_xe(gt)) >= 1270) {
>+			g->regs = __oam_regs(mtl_oa_base[i]);
>+			g->type = TYPE_OAM;
>+		}
>+
>+		/* Set oa_unit_ids now to ensure ids remain contiguous. */
>+		g->oa_unit_id = gt->tile->xe->oa.oa_unit_ids++;
>+	}
>+}
>+
>+static int xe_oa_init_gt(struct xe_gt *gt)
>+{
>+	u32 num_groups = num_oa_groups_per_gt(gt);
>+	struct xe_hw_engine *hwe;
>+	enum xe_hw_engine_id id;
>+	struct xe_oa_group *g;
>+
>+	g = kcalloc(num_groups, sizeof(*g), GFP_KERNEL);
>+	if (!g)
>+		return -ENOMEM;
>+
>+	for_each_hw_engine(hwe, gt, id) {
>+		u32 index = __oa_engine_group(hwe);
>+
>+		hwe->oa_group = NULL;
>+		if (index < num_groups) {
>+			g[index].num_engines++;
>+			hwe->oa_group = &g[index];
>+		}
>+	}
>+
>+	gt->oa.num_oa_groups = num_groups;
>+	gt->oa.group = g;
>+
>+	xe_oa_init_groups(gt);
>+
>+	return 0;
>+}
>+
>+static int xe_oa_init_engine_groups(struct xe_oa *oa)
>+{
>+	struct xe_gt *gt;
>+	int i, ret;
>+
>+	for_each_gt(gt, oa->xe, i) {
>+		ret = xe_oa_init_gt(gt);
>+		if (ret)
>+			return ret;
>+	}
>+
>+	return 0;
>+}
>+
>+static void oa_format_add(struct xe_oa *oa, enum drm_xe_oa_format format)
>+{
>+	__set_bit(format, oa->format_mask);
>+}
>+
>+static void xe_oa_init_supported_formats(struct xe_oa *oa)
>+{
>+	switch (oa->xe->info.platform) {
>+	case XE_ALDERLAKE_S:
>+	case XE_ALDERLAKE_P:
>+		oa_format_add(oa, XE_OA_FORMAT_A12);
>+		oa_format_add(oa, XE_OA_FORMAT_A12_B8_C8);
>+		oa_format_add(oa, XE_OA_FORMAT_A32u40_A4u32_B8_C8);
>+		oa_format_add(oa, XE_OA_FORMAT_C4_B8);
>+		break;
>+
>+	case XE_DG2:
>+		oa_format_add(oa, XE_OAR_FORMAT_A32u40_A4u32_B8_C8);
>+		oa_format_add(oa, XE_OA_FORMAT_A24u40_A14u32_B8_C8);
>+		break;
>+
>+	case XE_METEORLAKE:
>+		oa_format_add(oa, XE_OAR_FORMAT_A32u40_A4u32_B8_C8);
>+		oa_format_add(oa, XE_OA_FORMAT_A24u40_A14u32_B8_C8);
>+		oa_format_add(oa, XE_OAM_FORMAT_MPEC8u64_B8_C8);
>+		oa_format_add(oa, XE_OAM_FORMAT_MPEC8u32_B8_C8);
>+		break;
>+
>+	default:
>+		drm_err(&oa->xe->drm, "Unknown platform\n");
>+	}
>+}
>+
>+int xe_oa_init(struct xe_device *xe)
>+{
>+	struct xe_oa *oa = &xe->oa;
>+	struct xe_gt *gt;
>+	int i, ret;
>+
>+	/* Support OA only with GuC submission and Gen12+ */
>+	if (XE_WARN_ON(!xe_device_guc_submission_enabled(xe)) ||
>+	    XE_WARN_ON(GRAPHICS_VER(xe) < 12))
>+		return 0;
>+
>+	oa->xe = xe;
>+	oa->oa_formats = oa_formats;
>+
>+	for_each_gt(gt, xe, i)
>+		mutex_init(&gt->oa.lock);
>+
>+	/* Choose a representative limit */
>+	xe_oa_sample_rate_hard_limit = xe_root_mmio_gt(xe)->info.clock_freq / 2;
>+
>+	mutex_init(&oa->metrics_lock);
>+	idr_init_base(&oa->metrics_idr, 1);
>+
>+	ret = xe_oa_init_engine_groups(oa);
>+	if (ret) {
>+		drm_err(&xe->drm, "OA initialization failed %d\n", ret);
>+		return ret;
>+	}
>+
>+	xe_oa_init_supported_formats(oa);
>+
>+	oa->xe = xe;
>+	return 0;
>+}
>+
>+void xe_oa_fini(struct xe_device *xe)
>+{
>+	struct xe_oa *oa = &xe->oa;
>+	struct xe_gt *gt;
>+	int i;
>+
>+	if (!oa->xe)
>+		return;
>+
>+	for_each_gt(gt, xe, i)
>+		kfree(gt->oa.group);
>+
>+	idr_destroy(&oa->metrics_idr);
>+
>+	oa->xe = NULL;
>+}
>+
>+static struct ctl_table oa_ctl_table[] = {
>+	{
>+	 .procname = "perf_stream_paranoid",
>+	 .data = &xe_oa_stream_paranoid,
>+	 .maxlen = sizeof(xe_oa_stream_paranoid),
>+	 .mode = 0644,
>+	 .proc_handler = proc_dointvec_minmax,
>+	 .extra1 = SYSCTL_ZERO,
>+	 .extra2 = SYSCTL_ONE,
>+	 },
>+	{
>+	 .procname = "oa_max_sample_rate",
>+	 .data = &xe_oa_max_sample_rate,
>+	 .maxlen = sizeof(xe_oa_max_sample_rate),
>+	 .mode = 0644,
>+	 .proc_handler = proc_dointvec_minmax,
>+	 .extra1 = SYSCTL_ZERO,
>+	 .extra2 = &xe_oa_sample_rate_hard_limit,
>+	 },
>+	{}
>+};
>+
>+int xe_oa_sysctl_register(void)
>+{
>+	sysctl_header = register_sysctl("dev/xe", oa_ctl_table);
>+	return 0;
>+}
>+
>+void xe_oa_sysctl_unregister(void)
>+{
>+	unregister_sysctl_table(sysctl_header);
>+}
>diff --git a/drivers/gpu/drm/xe/xe_oa.h b/drivers/gpu/drm/xe/xe_oa.h
>new file mode 100644
>index 0000000000000..ba4ba80fd34cb
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_oa.h
>@@ -0,0 +1,18 @@
>+/* SPDX-License-Identifier: MIT */
>+/*
>+ * Copyright © 2023 Intel Corporation
>+ */
>+
>+#ifndef _XE_OA_H_
>+#define _XE_OA_H_
>+
>+#include "xe_oa_types.h"
>+
>+int xe_oa_init(struct xe_device *xe);
>+void xe_oa_fini(struct xe_device *xe);
>+void xe_oa_register(struct xe_device *xe);
>+void xe_oa_unregister(struct xe_device *xe);
>+int xe_oa_sysctl_register(void);
>+void xe_oa_sysctl_unregister(void);
>+
>+#endif
>-- 
>2.41.0
>
