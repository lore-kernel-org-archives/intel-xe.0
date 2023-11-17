Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36188C072A2
	for <intel-xe@archiver.kernel.org>; Fri, 17 Nov 2023 18:49:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F196810E14A;
	Fri, 17 Nov 2023 18:49:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3246410E14A
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Nov 2023 18:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700246944; x=1731782944;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=egDIfPxf2bDo2WiPObdk/iMcSjL+90qLxVU8MesLc/o=;
 b=YpSqfinWFzk9Wk0LAcGBjLZmPMdgEsn/pKr4h9/R8ahKS8muL4O6nYf8
 miTUXTeFcDghQgmPM6LcoxEv/eWqASj1E1B7sRld43bTc3EaNCWH3jJ5C
 +Ur8xmy2Gumv6sDLmUPiC8BFJgXxxJmKYUOte3Bnygr44UqFTbbWCBe/m
 krqn7p2TsF2z4uvnDHezTQR5oT1lu8kRlVNavp9j5EgP+bB2a3vPYIoyO
 Nvr2vDgHVmzglNNX1Tif43eCbo7GCmXNLv0bSoDzeZqImMq/XQlJXBhmF
 q2g0mrmFEeoGoUvdwSMybZg9fHrEraJEAcp0VSSk9bdtifH/sps+eHJPW w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="4496277"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="4496277"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2023 10:49:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="715607613"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; d="scan'208";a="715607613"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Nov 2023 10:49:03 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 17 Nov 2023 10:49:02 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 17 Nov 2023 10:49:02 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Fri, 17 Nov 2023 10:49:02 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Fri, 17 Nov 2023 10:49:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IhJ3XLUi/uVwuT3uaqLRsQeTO2/n7JssMf/4k8k5MA5MQC1xXV8chs47YaNMN3QAy2tr3UedW7+8ZJRxItw5zdztJAIwhfIao4gPLcjPEro8ZEI2TWicizQa9zKYWP3lhApaifYr59usCu1bysWTjSXd0eIpDbwGEI0ph4GcrG/D6BJiTJpqOnjzV8Zh2DxUZfbEstb3xcSnUqO28NdcH9kMQhsJN7n2slDHS6zhM3vc35k9mUiNncMbFIeNDQ+vxgtRPPmQsOwdQwg8BQhuSutZ/FQf7nnRnSxXq8WnGf9eOpb50yG+unOvSeU1CNotUPXcOBeLnlX+8WhVrgUkdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D0nbocQNshNz9/qwtNjcAOLQePCI0n77overNmZ4wPE=;
 b=hKQFdpXDcxtTLzpDuz3kQOGG1+HmLChD/19UXjtrgq2RYI5W8a0csbzQb/PjqVxm54gL/oYpvW7rVmMIuAFfqvPwlEuijXMwG9RR3Sradw/O8btKXjnbcPPellbrg0CO9dRmyl3EjutPdu5YSMWgdvsJAviOLrVw5EodDAQ8pHnDeGWdV44aaT1mgYCMdHt6ZP0UWpyPB9+d4/+H/PqLCMG5l1w0g/TDlRDDOzu+fd3pRIq0OtWzyPq/JdT+QHk5nsTYNBfI2Yn4DY/r7DzyWv0FDwQ7Z6VA7tK8kKl18DgUiS+4zlntotx5XxrT+RfGrs6eMMRlfsD7wm3VVpq4DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN8PR11MB3556.namprd11.prod.outlook.com (2603:10b6:408:8d::31)
 by SJ1PR11MB6249.namprd11.prod.outlook.com (2603:10b6:a03:45a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.17; Fri, 17 Nov
 2023 18:49:00 +0000
Received: from BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::78eb:ce50:6f36:7b2c]) by BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::78eb:ce50:6f36:7b2c%7]) with mapi id 15.20.7002.022; Fri, 17 Nov 2023
 18:49:00 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20231117175624.535520-2-lucas.demarchi@intel.com>
References: <20231117175624.535520-1-lucas.demarchi@intel.com>
 <20231117175624.535520-2-lucas.demarchi@intel.com>
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
Date: Fri, 17 Nov 2023 15:48:54 -0300
Message-ID: <170024693456.47595.16682612878519093049@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: BY5PR16CA0030.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::43) To BN8PR11MB3556.namprd11.prod.outlook.com
 (2603:10b6:408:8d::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR11MB3556:EE_|SJ1PR11MB6249:EE_
X-MS-Office365-Filtering-Correlation-Id: e2d935c3-e2e5-421c-ded1-08dbe79ddcbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gFigIF/iqrGXXih5Pbsw7MGOAFRukVYDdRcIcUfIE3nLHMHkQvdw/mA3GzAe0EBXrTCh0a4eKayZaIzMKdrlr0pyE2nGE/5V1fu3eIGYxM/ZhS7Z/yjb1g/dSvETZsbZWeRV+xM9V6BXB4ESPb7oB47Id4hMzUzvu34+Zm2VtRgXbDeHkKQ7XvPqmXFIrx+i6H4XqziVX6MBbCVen6EZRBg7CyPhg1aNnWgwF8bLxZkxhPAQ4YU8rRxk2VBBnwoetUtCMInbDbPnGGxiFTIIu5Ay1udyEXj0RkzzSvGYxAgode+Rk2z2hvxcjq9y4DNwCWE8kGTPHT1flu0L3UkuBlFK0UpzejLP0ZP/Xvnt/D8cLqmsnYSMm+nFKyY8lLCjlF9oRfMi1sej4Rd2SUkc0oh3wtUkNqh+6QNOVLnVwNWAJgTw8O8oiPqyt8tfvmrTkDUBbZiSnvjloJV0aY6C8E1hwSAknVP7I7I1xORb9eGvWtMr/bfHrlA3pI+nU7QCNUdD6Hwjv4iQAw64IfJepeq49t5dkcWksjT0so5UR8YcKvK3Egx2C9p8lPhfcI/ONtvHaTOl3cNAjd/+Ru9WfKVsYMl+lGJpjf4K9sImo3zsrZpPYS5S2YEtuBJpE+uR
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR11MB3556.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(346002)(366004)(376002)(396003)(136003)(39860400002)(230922051799003)(230173577357003)(230273577357003)(186009)(64100799003)(1800799009)(451199024)(8936002)(83380400001)(8676002)(4001150100001)(9686003)(6512007)(2906002)(26005)(44832011)(6666004)(6506007)(4326008)(478600001)(41300700001)(38100700002)(107886003)(6486002)(82960400001)(316002)(66946007)(5660300002)(33716001)(86362001)(66556008)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MVpmUnV6NGRlcHpoQ0d6ZHZFSEN5STRIbkpTMzlBTE9Tb0orSUU3ajE5dFVv?=
 =?utf-8?B?V2ZLaFM4QUkyR2RXNVRRQjBjVkR2VGM5UUYyMm5yVEdkYUlXN2l6L0dJOTRx?=
 =?utf-8?B?WWdDdGF6VWxkME85Z2ZtZDVXM3U5R1haV0hvWjFvQmZBTElvTWh4SVJCc2tn?=
 =?utf-8?B?TEpybVhic2c5WmFnY3BzeGNLY0NySlFhQmFsNFYyS3I2VDllS0VBWWFqQWdz?=
 =?utf-8?B?MWF3c2hIREhOVmFlbXFkeWpHWGcydHRycHNBTnNRS3JqbzZUakVwekVMbTY0?=
 =?utf-8?B?K0ZoeDBRTTZubXdQT21NWWNnMmNzK3NtTTBDTXJ6MUZyLytja1Q5YXVzbG1O?=
 =?utf-8?B?MTlieDhjakFzeldJRTJiWDJwQW5qNXlabHVtQTlLdGlRVVVzcVpLZVAzZ2pK?=
 =?utf-8?B?YkJjcGllT1IwaEdBd2FKYjdyQ3hQaEluUDVpNFZ6ckVWMXNFYVNCSWJLNmor?=
 =?utf-8?B?QmRkOUl6Sk10QklNVTNsdis5NkdqNXhncnVta2xzSWtLZHUyMEFhVkNtTHJG?=
 =?utf-8?B?R2dxR1BqTXZCM0lJalZnRkJsbXU0cGREUjFhWSs1Mm43UXBSMXhIRDcza2Yr?=
 =?utf-8?B?SGdoOGVXNzVSWTczc0hsNnVSdmw2cGZGRGpPRW1wRUpTSjVSQmxjWVh4d0lO?=
 =?utf-8?B?SmZwdWFTbW82TG10YlJWZGNPOUJzRVhEaFRaaVpPNS9RNmIyVm1LaUJaQ21q?=
 =?utf-8?B?ck8xanp3bktMVUM1WDByaXpXMjV3cUdSNngyb2k2V3RtT1lDSlNjRnlsMjFj?=
 =?utf-8?B?Z0MrMlFJK0ZrUEk1SDRQdnJaL0U5b2JUWHEyUzQyZmtuYmZDWFYyczFxeWtL?=
 =?utf-8?B?ZEdxNDNBY1prR3NNbW9xd09nR2dRR1czTUwrMWQ1RXNrKysyVWY1Y2NnVkZp?=
 =?utf-8?B?Wk1SWEZCcEJkK2s0eU1RSEJYUGRzL3duY25EMEFnRTNmU1BON3FvckkwZ2t6?=
 =?utf-8?B?dE1WdWtzdjZ1ZElLYUhIQ1EzME93czk5V1BkTjN1c2hnM3VJdmtETFZ6b1F2?=
 =?utf-8?B?UHNVd0oyV3B0ZWVvNFBOTjBlc3d1bE5VdmtJMnYyeFlta0hzcVlqK0I5RTFn?=
 =?utf-8?B?azBHNDE1YWRBNnh3V0EraDhGaXQzNklyWEptUU80MllSV3NZRXNVM1dyNVZM?=
 =?utf-8?B?UEd1QWR0aVlzcFY3c1oyamgzRDhMbmdNU2F2aDhOMlgzTDF6QnRnSVBYQmZF?=
 =?utf-8?B?SU90QkVHVnp5NkxDdlNtOEpSZnFJYlBCaU9UVUpYQ3BEN3VmSlNHQW5iNks4?=
 =?utf-8?B?eVRSdUtQcE1iTmJaNVRGV0hLSmNCcTRLMi9wMm5GU2h2cHhveTVvQlhsNXRI?=
 =?utf-8?B?WVI0Ni9IK1VkWVhwekdOSFJmNS90MkNCSXFMdFAybzN0bDR2L011K01pMmNk?=
 =?utf-8?B?bysrRFYyMmVieWdGM0tvU1VsTWJYRFhpejVibjlGMGlOaWY4dkc3ZTZMeTJG?=
 =?utf-8?B?b2tLVGJyb0oyL0FTVTlZTlEzL013Y3UxNUdHNnQ4elRLRVl5K202RllFemM2?=
 =?utf-8?B?aW0zelNxbE05S2IwTXhGN1AvaG1LYmlBYTdDY1lLTVZ4S3o0cnplbWZOVndN?=
 =?utf-8?B?UERwODl1cGd1Q25wN0dRcUJ6T0dGeUhhUllzVE13Tzdjci85ZGFKb3E3THl0?=
 =?utf-8?B?QlQ5T2plTjVpYzFjS3phVGNNUkU4b1NJWnROM1pTcndsaUFHNWpRUng4M2N1?=
 =?utf-8?B?bXgvZ2VDRXFxRlFwSE9ObUIzVmY0SWdtOVV5Q0E3MzBZNG12a1o1bG5HbHoz?=
 =?utf-8?B?YXBQUFhaYUlXUjZENUVyR2hqaWorN2xQeW5idW9RNnllVUtXNnloaDJKL3dy?=
 =?utf-8?B?S1NETjhhSjBxdGliYW5tRktXVEcxbElTczM2b1NMRW5RVUN0Q0NHRW5QbnR0?=
 =?utf-8?B?c3NTeWg0N1JSMWtOMUtRR0xRYXpPNkROTXRmTjl1ZVFBYmp3ckVwdUZBOGlW?=
 =?utf-8?B?Y0M4eS9QWVk2b0F0U0tnaXp6Wko2UmZocUJCNjVMdnVyUTArcWxIbnFmZ3dk?=
 =?utf-8?B?bnJmTmRCc1d6NStaclZYaTdXbzErekpYNGNNOE9rQ2lpVFFjVEoyd0c0S2ts?=
 =?utf-8?B?alp5dUc0T1htL0hISml5c25VTDg4M2taazNXZm16VWFDWTBBQjk1ektXdXpj?=
 =?utf-8?B?WisrTlBSYjcwV2tUWXZMRWtHVHUwYWNXcGg1MFlIY1FMeVdCNGJCQkpsSDdS?=
 =?utf-8?B?ZkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e2d935c3-e2e5-421c-ded1-08dbe79ddcbd
X-MS-Exchange-CrossTenant-AuthSource: BN8PR11MB3556.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2023 18:49:00.4090 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NUmlchFamyI1K4Detes0MgsatMlyNj+3mh8gwIxsi7q2XlJ/SJtSSqaKjWfvRfelA/vPBhgMXJtjgzL4a0E+Sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6249
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] fixup! drm/xe/display: Implement display
 support
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Quoting Lucas De Marchi (2023-11-17 14:56:23-03:00)
>Add missing header to fix warning while building with W=3D1:
>
>          CC [M]  drivers/gpu/drm/xe/display/intel_fbdev_fb.o
>        ../drivers/gpu/drm/xe/display/intel_fbdev_fb.c:14:25: error: no pr=
evious prototype for =E2=80=98intel_fbdev_fb_alloc=E2=80=99 [-Werror=3Dmiss=
ing-prototypes]
>           14 | struct drm_framebuffer *intel_fbdev_fb_alloc(struct drm_fb=
_helper *helper,
>              |                         ^~~~~~~~~~~~~~~~~~~~
>        ../drivers/gpu/drm/xe/display/intel_fbdev_fb.c:77:5: error: no pre=
vious prototype for =E2=80=98intel_fbdev_fb_fill_info=E2=80=99 [-Werror=3Dm=
issing-prototypes]
>           77 | int intel_fbdev_fb_fill_info(struct drm_i915_private *i915=
, struct fb_info *info,
>              |     ^~~~~~~~~~~~~~~~~~~~~~~~
>        cc1: all warnings being treated as errors
>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>---
> drivers/gpu/drm/xe/display/intel_fbdev_fb.c | 2 ++
> 1 file changed, 2 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/display/intel_fbdev_fb.c b/drivers/gpu/drm=
/xe/display/intel_fbdev_fb.c
>index 961b26e267ec..51ae3561fd0d 100644
>--- a/drivers/gpu/drm/xe/display/intel_fbdev_fb.c
>+++ b/drivers/gpu/drm/xe/display/intel_fbdev_fb.c
>@@ -3,6 +3,8 @@
>  * Copyright =C2=A9 2023 Intel Corporation
>  */
>=20
>+#include "intel_fbdev_fb.h"
>+
> #include <drm/drm_fb_helper.h>
>=20
> #include "xe_gt.h"
>--=20
>2.40.1
>
