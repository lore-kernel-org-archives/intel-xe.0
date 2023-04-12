Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F48AC77B6F
	for <intel-xe@archiver.kernel.org>; Wed, 12 Apr 2023 16:21:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FAD810E0C7;
	Wed, 12 Apr 2023 16:21:51 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6870610E0C7
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Apr 2023 16:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681316509; x=1712852509;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=vu6k2yGinGAymeshDGo5Eig+GdKtWItXEqqn+WhKlG8=;
 b=FReUj3xGhcCCN/waNBJ2B4TNsCitWZfwx2TfrKZ1PVTger6YvpIppTVs
 2GXGlx9YFu+r6v1bu5fUz3TmgJrgjL/AXe/+0l4AwscwdxxNCieYN7W81
 sE1HEh9JehBTlZLo66wWj0zVa3DiLJ4qjaIJxdJvC6QWziuckHovSlJqF
 TuxdPwdqARuq3Bc3OnF/VnT7DKr47BsGnPDbmwK89h6Uk+ngZ23sNAP14
 fGPAKa2W2DyhUZU3Aqwx+By73i2o8veSScc8sT3TchMSbEoz0ODRKLMEl
 4LFwOwvSi9Lg5ll7mYlAIpuvX5EVlbBMev3Tl0ZKH+Dzsjl7tYh6MLyM3 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="328059925"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="328059925"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 09:21:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="721636327"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="721636327"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga001.jf.intel.com with ESMTP; 12 Apr 2023 09:21:22 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 12 Apr 2023 09:21:21 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 12 Apr 2023 09:21:21 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 12 Apr 2023 09:21:21 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 12 Apr 2023 09:21:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h3WlCaPLLahor6GG2EngYug/Mz/rFZoJyjqXcjnvQfCO0oMtDSbTfg0z1FiBOnyCGugtVbAN2oTT9OCDT7t4DJNlMlmx+itI0l0ctfCdLZnAzWLd7xUZeCUOSKZ2fywnxBgFjTONARvAva014fVsX5OKhlZqpXlf6UbP5OZeM7FbjaVFOgLUEIopdz4FkM0tz2PxVqXXMp2QGu554ddnUosO5DRtSuoMP1vE4rK1XxeJErnN1pLWT32vieP8rCib6IuPtu0yITOns2/YD4BbX8qX0+lQ6AiaQy/9FbsTSrH37h7nbyhk2GYeu+tX1eBwKrbWxLQMSdi0BnCWnMNdig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aTD4rjdS2NZ5aCuZR4H19HoF2yOnD+Ih9+/aeq3vGE8=;
 b=ZVUQxztZ9QUK3u+WVTzpYXWdJnlkNUuBPoQJJRBrYeY/11vvkkkhvpR1MOAB4mtOrvC97OKOnFbwiDZYjXfA2XV6jp3YxFT+1eBCV1d4NLd1ozRO3GFVOmGIKZnO+AWV44DOVf6PeaxWcLREVxUmIQT6uQkOsOb12J8a6Zgb7PRIgUClkgI+HOuH5XQgZdjfcfWVucQ7T7oOyGNyvXwZhuF2xHuapJKPOJft8LgziyX9JbHYGwsgt/VbPp5P5aAHlHvZeMAs6Zemi/lFKEoxXNQQUe6PgToPKF63/mtKxuqb9m1mYRZDQCNCmo3eqAPsZtUVDy8sSWFAiCc0BuhArg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MN2PR11MB4725.namprd11.prod.outlook.com (2603:10b6:208:263::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Wed, 12 Apr
 2023 16:21:19 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6298.030; Wed, 12 Apr 2023
 16:21:19 +0000
Date: Wed, 12 Apr 2023 09:21:16 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Message-ID: <20230412162116.xldqatabrmbezakx@ldmartin-desk2.lan>
References: <20230412082054.3314568-1-lucas.demarchi@intel.com>
 <20230412082054.3314568-3-lucas.demarchi@intel.com>
 <87mt3dqqux.fsf@mkuoppal-desk>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <87mt3dqqux.fsf@mkuoppal-desk>
X-ClientProxiedBy: SJ0P220CA0024.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::32) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MN2PR11MB4725:EE_
X-MS-Office365-Filtering-Correlation-Id: ff1e7be6-8cb8-4634-6f18-08db3b71f2d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E5JWInlTD0onYV6tloDtUBDtx0oneEFsF68MObwN7gBb5DKmesqjp3K92lGwoCh8tha1/cyssuqD0mLoBYZFBiKs9wM6cxVE+0clAtye+xKqMCPLq8GCVCy/RWZ17eUqCRYuaQb4lvpqyMatYqU4bzqP1Uag+NPZ/ymeWTdJ5OxGI1ts28ApoQa/ZL93p/MoD0j8T4ipogOdLpSWtHAm9e+ev0+W9d3ZzE+VMk+TDNlTU2zgb58KbUx1FYInptB135zWF/kpALryWKyBvO3830mIcpRAbkluWx0yuDjr3AO1DAnCn20MAw7wQOXtq44qXQD77qtgccmImHC82UgXwTuPtDsLAmh5xrmukgun1zFB8VjoKG1NF5RJO6yd2o48wwR1dB685TmXHo7bv//Czb35DKdiCq3jyXBpZNB9XLkLn1S8/FqUKaPMp6NaXQFQkQefIq0u3MYuNzTLdkUfW4fXTHrTLn0/+daffdnFv0r7Bovsk0UoiZTBZTAFaoXFyTttFJTbaL7lPWfPDiyA28aTxKW941q0yf39TDZauzg4qdWG04+OIRCaPgZCH1/u
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(396003)(39860400002)(346002)(376002)(136003)(451199021)(6916009)(5660300002)(8936002)(36756003)(86362001)(83380400001)(82960400001)(26005)(1076003)(6506007)(6512007)(9686003)(38100700002)(186003)(8676002)(478600001)(316002)(54906003)(6486002)(6666004)(41300700001)(4326008)(66946007)(66556008)(66476007)(3716004)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ryFodHH/TO6aLORMyOLCIfw1M5qzzeTq/7btCpDJTxbHLPHCvXMRo7ILv+N6?=
 =?us-ascii?Q?BwrgO4O9wBWuwrBUvmRWvutvGrtv5+p5FpWjSF1TC7tDz/W6uEp+c4+p5+Jq?=
 =?us-ascii?Q?OEe5luuPHgKnUQ6A0P0sgmkTnCLZbchMdCcS4CWiEYwRpbTijZj+s4K2EFSb?=
 =?us-ascii?Q?ONX1kTcqS8yc8O7/WWJ2KR+yg4J2tDT2PJu5s/rVFvS0iWYIWIG1W478rSZh?=
 =?us-ascii?Q?ZbmU9/Rv+PmVv4YXSQ5gsNqN1Rjn+zzDcdHh8mLgPHVFi8285CGF7at+/Hb6?=
 =?us-ascii?Q?BeiAe8d+0x5g4Sw7MzflsZaJMcbm5YM+6KFTrysl4ewDsaigG72/PmrIrc9L?=
 =?us-ascii?Q?/Nxd96yFVAAaK/8lIDPtWVi01LDW+drshCIj5sZtNkTwZrdhAfen5xsv/aJG?=
 =?us-ascii?Q?qFXfIPYJcSdjfhT4tjUKi8ec1x0l7bM6p/VAcsgsYmSF+ZZG7IUKyYfGeEvF?=
 =?us-ascii?Q?EGc+5zLlOUgxD/9KV7pQJXpaJ9CvcZ+4SVkY2CEeISc+K5FVp1QlcJGJk9qt?=
 =?us-ascii?Q?5Gz6ir18jsdo4UZ9XR8cFvAUPGVyvCMqgJucupnYwuRoXj1GimrsgjDEFfOl?=
 =?us-ascii?Q?oC0DwqA6zBCaZwEs29jJ9x7Cs3cRnFEIIw799qc5VgCxGf69zxfZMOld9pHS?=
 =?us-ascii?Q?/PEw7zWW6L82fBWJgIsRa974trfwBpv+rtFKjdEQMwI+xmjBy3qGbwZs/Mqm?=
 =?us-ascii?Q?Gk6dRCX6sxryLSdu8NT/gye17/uPZdl/biEti0t/cpvph/P+BVZmN4GNI15h?=
 =?us-ascii?Q?pojUR9NIe4kEI7mtefy9AMLX9BSzzJYESna3ktpUMKFd8F+3Yq1RT33vfLne?=
 =?us-ascii?Q?DjIGNMOfjPJNF82MRYsADoejdUnaPque+oHSId7YJFHaIMef1przDpleqEgq?=
 =?us-ascii?Q?+pE98F4rYWLIXtnlNG/VsiUfWTRvrh0YUVPNqclztWRwikfpPkL5UmSnteZP?=
 =?us-ascii?Q?Bw9bb3ZGaho8XDdiTGxO7R6ic6TQ7O1pu0mASDkzWw2Rl6WQRzXIjQVnUODq?=
 =?us-ascii?Q?Ho2RNq11GxuJIxAu9m3C9agb/N9uYmEqS/We5VBlQGOqyx5RmVg9kEyBYuJV?=
 =?us-ascii?Q?53NaSHp9pLmeiSNh3Jr5ADxWqgY57Fu2Xi5hO8UUOl6ebS52Qw2Tx/kBIuK2?=
 =?us-ascii?Q?IRaTasnt5y5RFuTTczWPIP3yHMbxCxOT/+EawSZKsGjf+8sytzL9XoAZQ7Te?=
 =?us-ascii?Q?JeuCW3UhA5JJIxfC8XyQLr17Tvri5EwF3Q/v5MHLjJ+8bz0mXgfqtH5SDcvy?=
 =?us-ascii?Q?gL6131PteYaFgeyw0rPsFoeTJdHYquw7/zBzZAkGq3O8IFpNt/U976XoUIX1?=
 =?us-ascii?Q?ZdypXdG9t5wukpxJ8vAzDXR4N/ISBfnWcpFYp1JW0nbByLaG3wzp9N4y3Jjq?=
 =?us-ascii?Q?zzGR/bWVIcAlC/k7oYNXo4CbZfLBZYCkadbfvSon4riezGBbFTuD1CNYVFOQ?=
 =?us-ascii?Q?WXuqKtTb3KJsM02i6898i00h9VZMdF3zVzhTTgdhDgRYBGjreXJ0NxPy6N4N?=
 =?us-ascii?Q?1e8cP32sSCGJPd4zlwbhEq3MIn6fgxHXOK4yaafzzs1d6KpHjeimTwRI6DSk?=
 =?us-ascii?Q?kKY3/qbWwrpv7tS8TANaBxYeyDTEapE36cBqwmRg0ACe1jnGSzjN0NqJ+8ix?=
 =?us-ascii?Q?/A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ff1e7be6-8cb8-4634-6f18-08db3b71f2d4
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2023 16:21:19.6631 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zx46kfmI1qSaZoAJsEm3E468QrnbFVjBwrZ3pRnuRY+D8pZGWa2MLqGg192VMdwXYwNMAguMkHSAcWK6hMat3x8gv/x7PdWDoXofZCvAuzE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4725
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC 2/2] drm/xe: Register OOB workarounds
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
Cc: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Apr 12, 2023 at 02:31:18PM +0300, Mika Kuoppala wrote:
>Lucas De Marchi <lucas.demarchi@intel.com> writes:
>
>> Some workarounds can't be implemented in the xe_wa.c as entries
>> on a table since they need to be spread throughout the driver.
>> Provide a mechanism to allow "registering" these workarounds so they can
>> later be dumped together with the others.
>>
>> This uses a trick to define the static const entry when checking if the
>> workarounds is "enabled". That entry is put in a specific section so
>> later we can access all the entries in that section. Normally the linker
>> provides the __start_<section>/__stop_<section> symbols. However since
>> the kernel itself uses a linker script, this doesn't work, hence provide
>> our own custom linker script to do what is missing.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/Makefile       |  2 ++
>>  drivers/gpu/drm/xe/xe.lds         |  8 ++++++++
>>  drivers/gpu/drm/xe/xe_guc.c       |  6 +++---
>>  drivers/gpu/drm/xe/xe_rtp_types.h |  8 ++++++++
>>  drivers/gpu/drm/xe/xe_wa.c        | 14 ++++++++++++--
>>  drivers/gpu/drm/xe/xe_wa.h        | 10 ++++++++++
>>  6 files changed, 43 insertions(+), 5 deletions(-)
>>  create mode 100644 drivers/gpu/drm/xe/xe.lds
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index aceca651de57..9cbcc0ed06b2 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -216,6 +216,8 @@ ifeq ($(CONFIG_DRM_FBDEV_EMULATION),y)
>>  	xe-$(CONFIG_DRM_XE_DISPLAY) += display/intel_fbdev.o
>>  endif
>>
>> +LDFLAGS_xe.o := -T $(srctree)/$(src)/xe.lds
>> +
>>  obj-$(CONFIG_DRM_XE) += xe.o
>>  obj-$(CONFIG_DRM_XE_KUNIT_TEST) += tests/
>>
>> diff --git a/drivers/gpu/drm/xe/xe.lds b/drivers/gpu/drm/xe/xe.lds
>> new file mode 100644
>> index 000000000000..a2187eab2c8b
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe.lds
>> @@ -0,0 +1,8 @@
>> +SECTIONS
>> +{
>> +    .rodata.__xe_wa_oob	ALIGN(8) : {
>> +        __start___xe_wa_oob = .;
>> +        *(__xe_wa_oob)
>> +        __stop___xe_wa_oob = .;
>> +    }
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>> index ee71b969bcbf..608ac2a022e8 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>> @@ -20,6 +20,7 @@
>>  #include "xe_mmio.h"
>>  #include "xe_platform_types.h"
>>  #include "xe_uc_fw.h"
>> +#include "xe_wa.h"
>>  #include "xe_wopcm.h"
>>
>>  static struct xe_gt *
>> @@ -134,9 +135,8 @@ static u32 guc_ctl_wa_flags(struct xe_guc *guc)
>>  	struct xe_gt *gt = guc_to_gt(guc);
>>  	u32 flags = 0;
>>
>> -	/* Wa_22012773006:gen11,gen12 < XeHP */
>> -	if (GRAPHICS_VER(xe) >= 11 &&
>> -	    GRAPHICS_VERx100(xe) < 1250)
>> +	if (XE_WA("22012773006",
>> +		  GRAPHICS_VER(xe) >= 11 && GRAPHICS_VERx100(xe) < 1250))
>>  		flags |= GUC_WA_POLLCS;
>
>Now the entry will appear regardless if it was activated.

you mean "appear in the debugfs"? Listing all of them was intentional
and marking some as "active" would be a future patch on top.

I didn't implement that since I'm really on the fence regard the 2 or 3
possible approaches and I think it'd be easier

My idea here is basically like was described in the coverletter. During
init we'd do:

	idx = 0;
	for each wa in oob section {
		wa->idx = idx++;
	}

Then on the WA side, instead of having XE_WA() just returning the
condition, it would evaluate the condition and write to
xe->oob_workarounds.active[wa->idx]. Downside is that WAs would change
state and only be "active" when executed, which depends on the code
paths.

But the alternatives detailed in the cover letter make it a little bit
different: I think most of the conditions could be executed on init
rather than where it's called.  For that we'd need to either

a) convert the checks to "normal RTP rules", but without actions
    since the actions are to be done on the caller side

it may not be to horrible to drop the `if` in th `if (XE_WA(...))` and
just write it like:

	XE_WA(xe, name, rtp-rules, action);

and allow "action" to be any statement

b) migrate to the table approach I mentioned, so the callers would
have:

	if (XE_WA(xe, name) {
		<actions>
	}

Lucas De Marchi

>Would it add value to have it only listed if it was activated, or even
>both: implemented  and activated as separate entries.
>
>-Mika
>
>>
>>  	/* Wa_16011759253 */
>> diff --git a/drivers/gpu/drm/xe/xe_rtp_types.h b/drivers/gpu/drm/xe/xe_rtp_types.h
>> index e87f1b280d96..4f7832d074bd 100644
>> --- a/drivers/gpu/drm/xe/xe_rtp_types.h
>> +++ b/drivers/gpu/drm/xe/xe_rtp_types.h
>> @@ -101,4 +101,12 @@ struct xe_rtp_entry {
>>  	u8 flags;
>>  };
>>
>> +/**
>> + * struct xe_rtp_entry - Entry in a special section, used for "out-of-band"
>> + *			 definitions
>> + */
>> +struct xe_rtp_oob_entry {
>> +	const char *name;
>> +};
>> +
>>  #endif
>> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
>> index 100315c03014..26fb91aae014 100644
>> --- a/drivers/gpu/drm/xe/xe_wa.c
>> +++ b/drivers/gpu/drm/xe/xe_wa.c
>> @@ -72,8 +72,8 @@
>>   *      engine registers are restored in a context restore sequence. This is
>>   *      currently not used in the driver.
>>   *
>> - * - Other:  There are WAs that, due to their nature, cannot be applied from a
>> - *   central place. Those are peppered around the rest of the code, as needed.
>> + * - Other/OOB:  There are WAs that, due to their nature, cannot be applied from
>> + *   a central place. Those are peppered around the rest of the code, as needed.
>>   *   Workarounds related to the display IP are the main example.
>>   *
>>   * .. [1] Technically, some registers are powercontext saved & restored, so they
>> @@ -92,6 +92,9 @@
>>  #define _MMIO(x)	_XE_RTP_REG(x)
>>  #define MCR_REG(x)	_XE_RTP_MCR_REG(x)
>>
>> +extern const struct xe_rtp_oob_entry __start___xe_wa_oob[];
>> +extern const struct xe_rtp_oob_entry __stop___xe_wa_oob[];
>> +
>>  __diag_push();
>>  __diag_ignore_all("-Woverride-init", "Allow field overrides in table");
>>
>> @@ -665,6 +668,7 @@ void xe_wa_process_lrc(struct xe_hw_engine *hwe)
>>  void xe_wa_dump(struct xe_device *xe, struct drm_printer *p)
>>  {
>>  	const struct xe_rtp_entry *entry;
>> +	const struct xe_rtp_oob_entry *oob_entry;
>>
>>  	drm_printf(p, "Workarounds\n");
>>
>> @@ -679,4 +683,10 @@ void xe_wa_dump(struct xe_device *xe, struct drm_printer *p)
>>  	drm_printf(p, "\tLRC\n");
>>  	for (entry = lrc_was; entry && entry->name; entry++)
>>  		drm_printf(p, "\t\t%s\n", entry->name);
>> +
>> +	drm_printf(p, "\tOOB\n");
>> +	for (oob_entry = __start___xe_wa_oob;
>> +	     oob_entry < __stop___xe_wa_oob;
>> +	     oob_entry++)
>> +		drm_printf(p, "\t\t%s\n", oob_entry->name);
>>  }
>> diff --git a/drivers/gpu/drm/xe/xe_wa.h b/drivers/gpu/drm/xe/xe_wa.h
>> index 97d104b7e566..212fc9b4efe6 100644
>> --- a/drivers/gpu/drm/xe/xe_wa.h
>> +++ b/drivers/gpu/drm/xe/xe_wa.h
>> @@ -6,6 +6,8 @@
>>  #ifndef _XE_WA_
>>  #define _XE_WA_
>>
>> +#include "xe_rtp_types.h"
>> +
>>  struct drm_printer;
>>  struct xe_device;
>>  struct xe_gt;
>> @@ -19,4 +21,12 @@ void xe_wa_dump(struct xe_device *xe, struct drm_printer *p);
>>
>>  void xe_reg_whitelist_process_engine(struct xe_hw_engine *hwe);
>>
>> +#define XE_WA(name__, cond__) ({					\
>> +	static const struct xe_rtp_oob_entry entry__			\
>> +	__used __aligned(8) __section("__xe_wa_oob") = {		\
>> +		.name = name__,						\
>> +	};								\
>> +	cond__;								\
>> +})
>> +
>>  #endif
>> --
>> 2.39.0
