Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B1F5C636CC
	for <intel-xe@archiver.kernel.org>; Thu, 16 Feb 2023 13:51:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ADB710E310;
	Thu, 16 Feb 2023 13:51:16 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0A2910E310
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Feb 2023 13:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676555474; x=1708091474;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ESKXmLjF89ZVgSUnTGPtLd2ZkmDoy9lYb+CCDaGUwJY=;
 b=CADR2XQ1gaHBbfaDIPOjqu68EsVmxBPx6/kzWKidjIG8cSRphTkNViDk
 a+IwkbTOH2EXMghpjjInL1M6IR8E6Ayjytao3hdcsMpCybB4XYxS7AeOl
 P7GZQL25G044mbXgJqiYZrJb5a0SY3kc0En6TFLSIzw+fnZpwogdLOJXe
 rUldmLY5k1vPIiUVSnNvda095CYvGFLP6rOWB50cN7cSbvP2PI0LdVM0+
 cDLcQWoTPcHEmvHOU+2He/2ibp2W2C8L+9oNbSmCYxKnnj12dWpB3OCd/
 IhkW/g+s3O0mnKRkCmM1VgALYw2ejuFdE2kEMQi0QCpIrC2IBKRzTaWcu Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="319783580"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; d="scan'208";a="319783580"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 05:51:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="999037027"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; d="scan'208";a="999037027"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga005.fm.intel.com with ESMTP; 16 Feb 2023 05:51:13 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 16 Feb 2023 05:51:13 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 16 Feb 2023 05:51:13 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.102)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 16 Feb 2023 05:51:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QR8CCsoVMXL4+zw/GwWwx+vD8JWmSe/tDvf+fVfKm2GRIC7Ru2oxRnVpd+4SFFLAnowkgUryf1Zg028sOX6VJ53S5AgOWuQFXO+FroYPdt/Xhelp2hjoWd+NAjbtzlWpEMqOTuJf+gh1kIrWfP4itcBMXuT1bNX8AsUcU8G/NiSRn+ylr5nBfpdeVuBKkAaHrFhj4j9o0pxWMSCycvT9vD+YVvzzU2dTFXS+GdQ45W/Z9HzL1EKt79Feo3Cj5QuQKz7/HrUnUxQye3TT31OvypEs5HfQy0qPnjncqBSlKo5VI+pdVIZwxXxB9oPb4QytcQb3FnlDC7hLtSI2u79L7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a+gGEbH/9r7DLPFBnA1q72+A1fTbfTfBRK4LAvAr9oY=;
 b=GcV8ATSwkbnYgjK1/vLcOsSC6OUmDHrCHtcqs1ZMHokPu1yR64JXel8BaATAoq8PTIzRUN3RQaqFTs/IYfnUAShHK68xgr5KRvzH0cc1PLXBJYFD3ds2lOs27fGa25ZQG356hXp14Cdz/2L6LZgNlzaxFQyvlzyB/xdOZtAPclXhhM2gf+QOtMC0bN18j9fwOSnSm16+djcqp/zfxKW4++NEuvZms77ki5v8L2FLVe5r0a+Z+1BgotKveBUI4ns97dfHtt57lUksJ6s3I+pZjEWhfMuneJLYp60xLjOeYUxne38DYWNMG+61XCs3xJ/kagetsnaLmDbAnX8liciq+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB5117.namprd11.prod.outlook.com (2603:10b6:a03:2d0::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.13; Thu, 16 Feb
 2023 13:51:11 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8%5]) with mapi id 15.20.6111.013; Thu, 16 Feb 2023
 13:51:11 +0000
Date: Thu, 16 Feb 2023 05:51:09 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Message-ID: <20230216135109.ecmxp7l7vfudftf6@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20230214083320.2199178-1-lucas.demarchi@intel.com>
 <20230214083320.2199178-3-lucas.demarchi@intel.com>
 <87fsb5220e.fsf@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87fsb5220e.fsf@intel.com>
X-ClientProxiedBy: SJ0PR03CA0280.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::15) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB5117:EE_
X-MS-Office365-Filtering-Correlation-Id: 047990c8-b0d3-4358-f335-08db1024dcbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VAZyLCLbw2Py6ideoDkOX/dOgzbIKQNpqzJgQxm098/+JsG/u/I7Cnfvg6nco3jGQSNMnzplxRHViA9RtUqGhXgEhxYlEXAstZI2zvFrEuHMpmMlF/zL6oUJGby8qF2RCH4KQ5iMV8oVSMjXXfpbITg6kjE0VtIshUvI+w8tNmm1zHUtYciTFGSkre/6MDv35CCCdV051MablV5Uj7vzQATbh10WZU3VFBncZi2SL6POWc6DH2/C9G054C4ontQznSVqdM/TXYn+0J/yHLKFLJsxq5VzRZ/xjapSclzpe1JX2I5iPZY+TiAnZ+1ahnxXedgARVwKwjzGrnyNYV9fpXcVL3HEOeMgpU36tJgS7UrMBADIw2Btz6smIMRi0klTF+R6H2gFHcyFxri98H1Up78qYphlnOvSuZnE2CYc6UidB+Qn/vCRfW5snurz/BMMKdWWq/ADZHIwdDwVVwPPukGQgXaFPDBhiB9O8KeNPzGgo/0UZKCKr5F6rLea0KbRXeV/0zAQ/lPRapn3jq4uCcaYn4J/ULCKE/Mif6XayzkAe3Rl9s9MsVp3wlc7qpv2/6dqirieN8mRClaog+c2JTc7i9YYmIwSw/fujdiOztObsEuc3GTWBn4NYRvIcPik67axGWL+rqcX5b/+dkA4Aw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(346002)(136003)(39860400002)(396003)(366004)(451199018)(36756003)(86362001)(2906002)(5660300002)(8936002)(83380400001)(38100700002)(82960400001)(6916009)(4326008)(66946007)(41300700001)(66556008)(66476007)(8676002)(6486002)(478600001)(26005)(6512007)(9686003)(186003)(6506007)(1076003)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?0MbJ+tW8BI2wZCiIod1H5ay7gtyQa05cX4keUEgTVEL34ao7folP/kHoNe?=
 =?iso-8859-1?Q?49nl7C6Vi3xS9f3T0dJ3AfIThosS/HbRkzhebyohCp+JgBxn9M2Beqt4WM?=
 =?iso-8859-1?Q?fgQK2aRaRaLyyxRtBjuKe3bVDhMUwLGrT0CkxW4HsvWS+y08O86sD9id0l?=
 =?iso-8859-1?Q?WUlstWglXmCXwMqBYvEGhAxiGvJIlkzkkJpb9MRykfC4huqKJ9uEVzNN2t?=
 =?iso-8859-1?Q?ooJ27D3grj9vaX/fx6ZVPYKNa+zYp9dhVpQKcIXLwRY5FeC3sZ0vc0Hum+?=
 =?iso-8859-1?Q?HE5tJI7MVjl0up9dC+vUmRCHKmnCW9YrHGeuZkcRDTUUCeT+gXRKJV3yBk?=
 =?iso-8859-1?Q?5jM+DiZGAe+V1ZrtxiK4gSucbMEjtb0z44tP90pIZvsxbP/J2zkVp82UI3?=
 =?iso-8859-1?Q?YBC8y+3j/jksJw45JAVSWsYIOtLaaXiI5HGr/3mW/t4r0H5qUBiqTNm/Zt?=
 =?iso-8859-1?Q?/agw3uEYoIQriQfsPEspTus6uA7Ddp8bFiu34FeZ78K+SnO4w93Tu3dxeq?=
 =?iso-8859-1?Q?vwSE2fT29XN1D+5U1xpup0sxdvpWK0/RD6QgleQzpIalvKfm2PZ+4dqKzp?=
 =?iso-8859-1?Q?4k2xAq1+VknpS9OAyCxtZBRa3jVg+8TA/dKpABabJdrpDpe/OLIbrobFYm?=
 =?iso-8859-1?Q?WzwBH7/9pMTU1WW9Kb0hvylIeFw3+w+2EgjNgz2mPJn5+aDtr/P1QxzeNw?=
 =?iso-8859-1?Q?cyf/hlMPRxKkmDcgxHrH818Tsjem9q0FJEtcOfL3M//uxhd695DfzJNnvu?=
 =?iso-8859-1?Q?l50ytH4KJXRMqQpXSvhzW8WHXmRdIYGDoUl1ZtpTQJYJCvSiT8M0CAEbeX?=
 =?iso-8859-1?Q?BGQkDVJ/fhZ7N1aK4rMQ2ontbNkDGvl42ssU/qt8ZiyB6cIKEnIz+2Vjc0?=
 =?iso-8859-1?Q?VrY0GdtsPBUD4GVYYsLbAu0CdRHSdbj3TjwjWlPEA5fyOV6M1rQc0hRt6R?=
 =?iso-8859-1?Q?ju+QQAJ/UWF0zlDd2D4xYN3ny9trLjHqKkP7tg3C3cBl8ybi1KShnwWKwp?=
 =?iso-8859-1?Q?G/CITzYjSzEGS0bQfAat/UqSo/tJ9P28TBDCh1saNHB0GT/B6pTLevl9bQ?=
 =?iso-8859-1?Q?9+Dr/3OYsGAF0OdISZtIbaE8LxF9aLCjVSIByj5L5urGGh7PHCbEq4hRmc?=
 =?iso-8859-1?Q?Ou79FVRgnmZCZyXYI/PjJwqucA2jRUhvtiSPxQeWhusWa9aQaxFl32pF+Y?=
 =?iso-8859-1?Q?gggUn96l04jnTAXkC1GN++dgeFCnqukAjDuJo1lwD/ezR1270gNlpP6Upr?=
 =?iso-8859-1?Q?gJhbPXKGJMevxO2wWvFXpMTmjtc0ckp5E71Feg+vnEscd7VKq3Eg62mLL0?=
 =?iso-8859-1?Q?cNQXNOvccP9yaUCmRKd6ErBxGiTqsA/7U2sDGP54IG6ba1PzQaQZ8spTtc?=
 =?iso-8859-1?Q?eJ+WhXzRjKYJeyOyjwX99PLeVO+vXTHjnJa/+ZdMjloDz0nNWNFYCilImG?=
 =?iso-8859-1?Q?d3z/qqjFZCDqtdZ37ujb4025xM07vugBxbLc+5IkpoJ7Xz2UC5dNIH4NYU?=
 =?iso-8859-1?Q?8Zmq2/vDbEV483RU0wy+L5e1zsLqAwvicY1H4D0M4wZ8odZ4ckE68EBUKA?=
 =?iso-8859-1?Q?RIjD473IAyYqtOMbwmfWjcaHe7aswKZmpzYfYjDOAJf2ppoAmIJaU7yWK8?=
 =?iso-8859-1?Q?8YMHQjxUvaANaqKxexGfAg/ktyUeWPDqN9FY5ZCrAxikUik3ojLxk7yg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 047990c8-b0d3-4358-f335-08db1024dcbf
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2023 13:51:11.4318 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FNPTjy0IzCYuy2T4WbIG/uaPn0Cnsk+LCAuBkRHcNJd1YkmirsA9u8BSXsaR7RkP8SJtn7yPN7NVR3wJEYDiAz06+3QtM9j7GFis55aAdVE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5117
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe: Remove dependency on
 intel_engine_regs.h
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

On Thu, Feb 16, 2023 at 03:06:25PM +0200, Jani Nikula wrote:
>On Tue, 14 Feb 2023, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>> Create xe_regs/xe_engine_regs.h file with all the registers and bit
>> definitions used by the xe driver. Eventually the registers may be
>> defined in a different way and since xe doesn't supported below gen12,
>> the number of registers touched is much smaller, so create a new header.
>>
>> The definitions themselves are direct copy from the
>> gt/intel_engine_regs.h file, just sorting the registers by address.
>> Cleaning those up and adhering to a common coding style is left for
>> later.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_execlist.c            |  5 +-
>>  drivers/gpu/drm/xe/xe_guc_ads.c             |  6 +-
>>  drivers/gpu/drm/xe/xe_hw_engine.c           |  2 +-
>>  drivers/gpu/drm/xe/xe_lrc.c                 |  3 +-
>>  drivers/gpu/drm/xe/xe_mmio.c                |  2 +-
>>  drivers/gpu/drm/xe/xe_reg_sr.c              |  2 +-
>>  drivers/gpu/drm/xe/xe_reg_whitelist.c       |  3 +-
>>  drivers/gpu/drm/xe/xe_regs/xe_engine_regs.h | 81 +++++++++++++++++++++
>>  drivers/gpu/drm/xe/xe_wa.c                  |  2 +-
>>  9 files changed, 96 insertions(+), 10 deletions(-)
>>  create mode 100644 drivers/gpu/drm/xe/xe_regs/xe_engine_regs.h
>>
>> diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
>> index d555d77cbf49..254e1a6688c2 100644
>> --- a/drivers/gpu/drm/xe/xe_execlist.c
>> +++ b/drivers/gpu/drm/xe/xe_execlist.c
>> @@ -3,9 +3,11 @@
>>   * Copyright © 2021 Intel Corporation
>>   */
>>
>> +#include "xe_execlist.h"
>> +
>>  #include <drm/drm_managed.h>
>>
>> -#include "xe_execlist.h"
>> +#include <xe_regs/xe_engine_regs.h>
>
>Why the system include <> instead of ""?

At the time I thought "if this is included from another dir, then it's
not relative".

But... We are using "  for all xe includes: I already changed this to
`#include "regs/xe_engine_regs.h"` in the next version (not sent yet
though)

Lucas De Marchi
