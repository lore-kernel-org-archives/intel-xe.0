Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3910BC76196
	for <intel-xe@archiver.kernel.org>; Thu,  6 Apr 2023 20:06:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC48710ECB9;
	Thu,  6 Apr 2023 20:06:17 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C925210ECB9
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Apr 2023 20:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680811576; x=1712347576;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ZmFKY/hRhqRigQpekhldYcRqYEXv4gIU6ODXf/ulEV0=;
 b=kcFPJIaY6PbDt3ljHsormXVUjS0kedYcIMoU73modvIyeN1uGmjkOco0
 54ysIC8mWcGI8fYDVQRa7e8RqZq9beLiX9Z+D+nnxl8L6c93xCtvffgSs
 lGzdsGEtmyCy77leq5xUaUx45/a9FeRlnf3TgGubXNoq+ru5Y+cYxpU1i
 R3IIuokglsn7+eGMsN+dGSkkYbXkrGj4qcmELBvKilGK1lsQ3SEvXyREI
 SZkIojX3gj1m+qhL43ofHPUR87kf1DvvvJf7/xQi0xjNbN9xNCiRLk94g
 MbQvmCCzqNT6pXitXpgOalSXZOayPa6qbCEfSqDwjIV/bf19FxRM7klS4 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="370665782"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; d="scan'208";a="370665782"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2023 13:06:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="756455148"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; d="scan'208";a="756455148"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga004.fm.intel.com with ESMTP; 06 Apr 2023 13:06:15 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 6 Apr 2023 13:06:13 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 6 Apr 2023 13:06:13 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 6 Apr 2023 13:06:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XgyHbzIMuf75U2PriFqD3RO6HoERcSI7Ti1zX+NMcKdW/txjNa/io6WOmKEU7fRVfF+vJiX0syDn4gzUGy2gE8prLni6tKLxLOqAgUBCvQ2HSu8CUIfEaffCKWYDBYCeZk8Br3YxGciZNVGYAN70vYFpKnmrzNfRSTxsMu0RuKMYGwGVKE51K96iPjZ66Ktmj396aMaJcJAcU3ustHU7GEUPqiv/TgA2qtBGDHfF2ew2Qd7tZ5ula+RieHGsTUtvEfl3ZGf1Fw/HQ+n2miqwMMar2EAO0GbKVlWVa2Y1Qt1sl0zPEP6ecotJZm1KmBog34No3uKnFumLNeRCVmhPYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a4P+mOTLPtc1L27IUlkDl8DkYdr9sLVQIR+HGePfmzA=;
 b=PGCa7SDl5s7MhdxR2ZEtsGMXlXzXFr3tW7ixubNVecjDc/zs6HoO85R2A2js71H30gc/gyTGRMEBaRY6v6IKvZD3U7kLscM6CvvwFWZP/nBy5dsNqXrX6+w5dgZaMm9FKw4YJ7Gc8AaEA87tS8e8QgUhEB0AJ0PeOMceUgWh0fTn7RVEbGUdZ9FHRePqQf3E7wNRPVy4QvSraBJp1noeidsCG45fpyYF5QPESbzU7ZPTDH2e4giIffg6mG4PvrUFCwLYzpr3Tc8QRj2fdctZOIg0naH6+Q9PKLbJ5Ll6BlPdsIXLXNrGCbVgJsQDXCCfr52iF8WAR0tNPnBy0s1WKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CO1PR11MB4819.namprd11.prod.outlook.com (2603:10b6:303:91::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Thu, 6 Apr
 2023 20:06:11 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%6]) with mapi id 15.20.6277.030; Thu, 6 Apr 2023
 20:06:11 +0000
Date: Thu, 6 Apr 2023 13:06:09 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <20230406200609.vhhssqamuzcn7qgl@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20230405170815.524853-1-yu.bruce.chang@intel.com>
 <20230405172857.gf6ubjtrhyjkxztg@ldmartin-desk2.lan>
 <CY8PR11MB6940D86EF2BABB63945DE52BC3909@CY8PR11MB6940.namprd11.prod.outlook.com>
 <20230405182952.m65hoo6khvprjjzq@ldmartin-desk2.lan>
 <CY8PR11MB694007773EFAEB6AC9BA42EFC3909@CY8PR11MB6940.namprd11.prod.outlook.com>
 <ZC8bYD8aegpT7M7s@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZC8bYD8aegpT7M7s@intel.com>
X-ClientProxiedBy: BYAPR03CA0003.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::16) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CO1PR11MB4819:EE_
X-MS-Office365-Filtering-Correlation-Id: a5af71e7-4715-490b-af02-08db36da5e38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yCy8gUjFkk8cOrV3Smf22wgOz5hWsC44s/OwRjzNNmm5yVUboxymuIUrFBjG37kPnDOQL5BG5QEeNRgZ+8QO7NopS0rj1b2s8SoXOCHQdQcsV3+sKBz2zCF4dK/FoxWSiNmyjXc+S/GxNoBhRrry00GMJDgDNDHFXoLTRmx9WFgFg6qzj5hkW1ZCrjtDVxBr85oh50qjObnXBm70qggiFn1UpBJIwSJNR7U/OAwnFk56aGpOTfkYsi2PmNDnLsDGg1XHSgEA7s2v52FBCiRrxfgQpDm0NLr/6Bo9oYqqicNiNTH66GhgCYDINv58vHtc2CXjVIEUTGvz5D/N+Nj1H2wcCA9PQAr/MIKiXQRnewu3BRBYKuqiugfsOvLhm+1H9HMrGh0kcuu157cswn//t8D9mn1lBjgs1H1Y8JaP9yzjmtfdjTgXGZgdF6NcrwVKY6UJbH3ZPOhADMioY6F1B6ftvODLCYRIrLcZ8rvaqylRi4LzEgazv1b2/WXAIOrZhojID4TwaLmgVUfxw18Hsg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(396003)(136003)(346002)(376002)(366004)(451199021)(2906002)(36756003)(86362001)(966005)(6862004)(186003)(53546011)(6486002)(6512007)(1076003)(9686003)(6506007)(83380400001)(26005)(8676002)(66946007)(38100700002)(66556008)(4326008)(316002)(478600001)(66476007)(82960400001)(5660300002)(8936002)(54906003)(41300700001)(6636002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0VY/xNhuz8emB6FtR0Gt2/9kqYVvtpxk9iG+YEhht2RIYwiVL7OUpVqFZRbg?=
 =?us-ascii?Q?RPBq6IudEJJyhFJHOfWK9/fVITxPkE/538xgrVV4CwcANmitQTH8ol6+eYZo?=
 =?us-ascii?Q?JmWpA2Q5RcvZ7Xz9h6OHfhuh+2dkhT4az/89VWYulqmeeebH/i5cyOdbh49i?=
 =?us-ascii?Q?E+P2hllokDKMspFCREeLJszkII9Wozmie/shuStKO7fAWQjSFYQklTJgBn3G?=
 =?us-ascii?Q?UvSRoumKQwHhtu6KIB1KOdohFApfo6sX0hvREdismfP/4G7KebTxtoyl7yl0?=
 =?us-ascii?Q?Qpm8jbL95S8kRpFXLjK1AEMvQjOoN9onsknPzzpLmq5GDbt/N99terOg3aGp?=
 =?us-ascii?Q?1gWeMF8CqGmlx6e2vZzn775QgaXIhc/NytISd+t5tS70KE5Lm6t+6aLZMaXW?=
 =?us-ascii?Q?b5/55btIHxdKhsio9o+2frD/qyh0z+Mr0SSz4GJXe7PrJiy9xeewoxvNnkti?=
 =?us-ascii?Q?H1eaPB3aAXgNYyH4bbgh6Hm8W0upavz94jf1NqqGcskSAcfxPR6Jh29NSTC8?=
 =?us-ascii?Q?H6ABzMAY251hNH8q+OdJ+UkPvYfzoQYqtc+M1Joc76BC5xkotry/495aBmNw?=
 =?us-ascii?Q?283Ah/hrPqcV9cQuyBi2sowRH0zntyXFUowWAOm5A48onVl32C6WnjWElWwG?=
 =?us-ascii?Q?ENdwc5nZU3j9EhvAAlKl2wZw5fC3sdNDjITTBqhOazP0Tpv2YtBqpysSmncU?=
 =?us-ascii?Q?N7ongwlFoYycuJlpYG8w+2fGAOomne1Z0rczpanBYNVa70B4Er2xsYKIWON7?=
 =?us-ascii?Q?7yMLBh4fymqOdOaD5bDXDYBX1391l0paSKmZNPKvGnIpUcTfjC3P/2zxwQdt?=
 =?us-ascii?Q?6BHnCKcfyDtCwvWoKqx7k7thhzpxPGeJgeAOxI5Sa0YxBBXjCnVJmXz/mLM6?=
 =?us-ascii?Q?ItaBLgIO4bMpLEnqlko2DYMRDAky3nh1l668nD7X3OaOrkMjDMz1g7+aMpO8?=
 =?us-ascii?Q?4ppbhY7nO1mbnlmm1JaVktUq4AIuQgbqeuQh6yGN2N0UxnM3anflq2lhWtMr?=
 =?us-ascii?Q?8Ybs52KjCNeFWth5ojEWa7PZKb2JhWNL3FlFAFwnk1vsBtb+xTvh0lrOHF8X?=
 =?us-ascii?Q?iGs7lLCiEelwty9re7kQXRYo5CgQp+FRrxB38Uz+CrFt9KRjfXSjZgWtDX1q?=
 =?us-ascii?Q?SE9NTGVoZBrOAF36rkaR+GwCtodOH21P90XTHRfDNmQGPXkwgoJGma3jd/cF?=
 =?us-ascii?Q?dZG6rsmgVuR2yv+HE6xYShyC3d8FIpM89WZ1WYvWtOY/uyPhPR8hP18yKKbC?=
 =?us-ascii?Q?9cpDDwzjGAyHMf4za1BGLcyySIOKiaC1vqvK/MqTG1hHMzXYf1eLhJs+2i6g?=
 =?us-ascii?Q?E5GAO1Fh0eUvnSeAJdVcDysz5MeDAIRk0vEG2OZi6ZJg+LBXu+RwPrpr6jen?=
 =?us-ascii?Q?zuUOqrZZpkotqv50OrvZURHo+B0WTunVQkcJrxKWjUYI2hPfbKM+ArIQFyfI?=
 =?us-ascii?Q?xRViIkJ8m0AlGw5eGcE3cCwHCVjsE96YbjGtN6g7wU2XThUEkdu/EIpdkc29?=
 =?us-ascii?Q?cplAYiBP6YS6tOr6PzY2agUdzydOIVisuzH737Aal6Ba3cWxZqzuHzIup6J/?=
 =?us-ascii?Q?+QPWG38SuE2BFN8wBo+7k50q/H045f/KDYvW05qyIgIaqVZ4Rs9vOFgw9jpE?=
 =?us-ascii?Q?gA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a5af71e7-4715-490b-af02-08db36da5e38
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2023 20:06:11.6802 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eFGStIU7MKH5nfRoQ/Y6EDwWtTctdrqeyNUdNwXAURJ/ZwoTRxn+uNw/2Agqpolo8MjUwcDLnoJCF68k3LI1W1R/6KRW2OW+WHxWA0qaEAY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4819
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: follow up on the patch to fix pvc
 unload issue
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
Cc: "Chang, Yu bruce" <yu.bruce.chang@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Apr 06, 2023 at 03:20:00PM -0400, Rodrigo Vivi wrote:
>On Wed, Apr 05, 2023 at 07:52:17PM +0000, Chang, Yu bruce wrote:
>>
>>
>> > -----Original Message-----
>> > From: De Marchi, Lucas <lucas.demarchi@intel.com>
>> > Sent: Wednesday, April 5, 2023 11:30 AM
>> > To: Chang, Yu bruce <yu.bruce.chang@intel.com>
>> > Cc: intel-xe@lists.freedesktop.org; Vivi, Rodrigo <rodrigo.vivi@intel.com>
>> > Subject: Re: [Intel-xe] [PATCH] drm/xe: follow up on the patch to fix pvc
>> > unload issue
>> >
>> > On Wed, Apr 05, 2023 at 11:14:51AM -0700, Chang, Yu bruce wrote:
>> > >
>> > >
>> > >> -----Original Message-----
>> > >> From: De Marchi, Lucas <lucas.demarchi@intel.com>
>> > >> Sent: Wednesday, April 5, 2023 10:29 AM
>> > >> To: Chang, Yu bruce <yu.bruce.chang@intel.com>
>> > >> Cc: intel-xe@lists.freedesktop.org; Vivi, Rodrigo
>> > >> <rodrigo.vivi@intel.com>
>> > >> Subject: Re: [Intel-xe] [PATCH] drm/xe: follow up on the patch to fix
>> > >> pvc unload issue
>> > >>
>> > >> On Wed, Apr 05, 2023 at 05:08:15PM +0000, Chang, Bruce wrote:
>> > >> >created xe_ttm_sys_mgr.h as suggested by Lucas also fixed a compile
>> > >> >warning found by Lucas
>> > >>
>> > >> Let's rather make this a fixup so we don't keep breaking and fixing the
>> > build.
>> > >> We are still rebasing the tree, so let's keep this as part of the original
>> > commit.
>> > >> Please commit with --fixup=01362fbe5e53
>> > >>
>> > >Thanks Rodrigo for helping fix this!
>> > >
>> > >> >
>> > >> >Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> > >> >Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> > >> >Signed-off-by: Bruce Chang <yu.bruce.chang@intel.com>
>> > >> >---
>> > >> > drivers/gpu/drm/xe/xe_device.c      |  1 +
>> > >> > drivers/gpu/drm/xe/xe_device.h      |  1 -
>> > >> > drivers/gpu/drm/xe/xe_ttm_sys_mgr.c |  1 +
>> > >> >drivers/gpu/drm/xe/xe_ttm_sys_mgr.h | 13 +++++++++++++
>> > >> > 4 files changed, 15 insertions(+), 1 deletion(-)  create mode
>> > >> >100644 drivers/gpu/drm/xe/xe_ttm_sys_mgr.h
>> > >> >
>> > >> >diff --git a/drivers/gpu/drm/xe/xe_device.c
>> > >> >b/drivers/gpu/drm/xe/xe_device.c index 4fb9aff27686..85caf81ae686
>> > >> >100644
>> > >> >--- a/drivers/gpu/drm/xe/xe_device.c
>> > >> >+++ b/drivers/gpu/drm/xe/xe_device.c
>> > >> >@@ -27,6 +27,7 @@
>> > >> > #include "xe_pcode.h"
>> > >> > #include "xe_pm.h"
>> > >> > #include "xe_query.h"
>> > >> >+#include "xe_ttm_sys_mgr.h"
>> > >> > #include "xe_ttm_stolen_mgr.h"
>> > >>
>> > >> needs to be sorted alphabetically. See
>> > >> f4b0bb728995 ("drm/xe: Sort includes")
>> > >>
>> > >What if those headers have dependency? Such as ggtt will depend on
>> > >either vram_mgr or sys_mgr.
>> >
>> > headers are always self-contained. If they depend on something they should
>> > either include or fwd declare. We prefer fwd declarations so we keep header
>> > dependencies to a minimum.
>> >
>> Make sense!
>>
>> > >
>> > >> > #include "xe_vm.h"
>> > >> > #include "xe_vm_madvise.h"
>> > >> >diff --git a/drivers/gpu/drm/xe/xe_device.h
>> > >> >b/drivers/gpu/drm/xe/xe_device.h index d9d1b09a8e38..d277f8985f7b
>> > >> >100644
>> > >> >--- a/drivers/gpu/drm/xe/xe_device.h
>> > >> >+++ b/drivers/gpu/drm/xe/xe_device.h
>> > >> >@@ -116,5 +116,4 @@ static inline bool xe_device_has_flat_ccs(struct
>> > >> >xe_device *xe)  }
>> > >> >
>> > >> > u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size); -int
>> > >> >xe_ttm_sys_mgr_init(struct xe_device *xe);
>> > >>
>> > >> there was a blank line here that needs to remain
>> > >>
>> > >So, there needs to be a blank line before #endif It seems the original
>> > >file was missing the blank line already.
>> >
>> > I thought it was there already before your patch. It's not a requirement, but
>> > it's better to follow the same style everywhere
>> >
>> > >
>> > >I did a quick check, there are about 7 headers violates this.
>> >
>> > let's add the newline in them
>> >
>> Ok, I will do it
>>
>> > >
>> > >Is there a way to enforce using a script to help insert a line before
>> > >push/code review?
>> >
>> > we are going to have hooks to plug in the CI infra. This can be one of the
>> > checks. See https://gitlab.freedesktop.org/drm/xe/ci/-/merge_requests/10
>> >
>> >
>> > >
>> > >> > #endif
>> > >> >diff --git a/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
>> > >> >b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
>> > >> >index cf5f4f73d4dc..9c2f7d4936d8 100644
>> > >> >--- a/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
>> > >> >+++ b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
>> > >> >@@ -12,6 +12,7 @@
>> > >> >
>> > >> > #include "xe_bo.h"
>> > >> > #include "xe_gt.h"
>> > >> >+#include "xe_ttm_sys_mgr.h"
>> > >>
>> > >> some thing here, this is the header for this specific file. It should
>> > >> follow what we do everywhere else and be the first include.
>> > >> See f4b0bb728995 ("drm/xe: Sort includes")
>> > >>
>> > >This was from the original code as well.
>> >
>> > original code? xe_ttm_sys_mgr.c is being added now
>> >
>> It was a rename: was xe_ttm_gtt_mgr.c.
>>
>> I will change it.
>>
>> > >
>> > >I think it would be great to put this requirement in a coding standard so it
>> > will be easily to follow.
>> > >Not sure if a script is a better idea instead of relying on developers.
>> >
>> > eventually we are going to have that, when the CI hooks mentioned above.
>> > Right now we rely on people following what is around, which is always a great
>> > way to know how to follow the coding style.
>> >
>> > >
>> > >> >
>> > >> > struct xe_ttm_sys_node {
>> > >> > 	struct ttm_buffer_object *tbo;
>> > >> >diff --git a/drivers/gpu/drm/xe/xe_ttm_sys_mgr.h
>> > >> >b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.h
>> > >> >new file mode 100644
>> > >> >index 000000000000..3d70c452a660
>> > >> >--- /dev/null
>> > >> >+++ b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.h
>> > >> >@@ -0,0 +1,13 @@
>> > >> >+/* SPDX-License-Identifier: MIT */
>> > >> >+/*
>> > >> >+ *  * Copyright (c) 2022 Intel Corporation
>> > >>
>> > >> we are in 2023
>> > >>
>> > >Yes, I also realized this, I assume this needs to be cleaned up for all
>> > >files. Maybe better to have a separate task to clean up all files every year?
>> > Some files are still in 2021.
>> >
>> > not really. We don't bother updating them even if we could. But when we
>> > add new files, we should put the year we are in.
>> >
>> This was also a rename from existing xe_ttm_gtt_mgr.h to xe_ttm_sys_mgr.h
>>
>> I can make the change.
>
>Lucas and Bruce, I'm really sorry for having rushed the patch and the fixup.
>My bad.
>So, let's have a final clean patch. Even if the best to do now is a double
>revert with a clean patch on top, so on the next rebase we can remove the
>previous versions and the reverts. Or another fixup!. Up to you and just
>let me know so I can try to help here, but next time without rushing it out.

I will send a fixup! commit 

Lucas De Marchi

>
>>
>> Thanks,
>> Bruce
>>
>> >
>> > thanks
>> > Lucas De Marchi
>> >
>> > >
>> > >> Lucas De Marchi
>> > >>
>> > >> >+ *   */
>> > >> >+
>> > >> >+#ifndef _XE_TTM_SYS_MGR_H_
>> > >> >+#define _XE_TTM_SYS_MGR_H_
>> > >> >+
>> > >> >+struct xe_device;
>> > >> >+
>> > >> >+int xe_ttm_sys_mgr_init(struct xe_device *xe);
>> > >> >+
>> > >> >+#endif
>> > >> >--
>> > >> >2.25.1
>> > >> >
