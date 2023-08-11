Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83B0BC04A94
	for <intel-xe@archiver.kernel.org>; Fri, 11 Aug 2023 00:29:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 356E010E616;
	Fri, 11 Aug 2023 00:29:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEC8D10E616
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Aug 2023 00:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691713784; x=1723249784;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=k5yXt7RJbAaw54YcdHDppQdfIYMUI8RTrwqJhe8nKWA=;
 b=ZQwKTJHgZ6ECotRLNC9Gr9kEKHauDZ173gjGFxf10ysnVHZyoF3KF3oi
 ljBAcICScdQZ6lBZQS15jTCX8XvK14gG6BW5b21Oz3f5t2YBpuH16afwu
 xEuHqJ74hdjSS9Awdso/fkVTEdGQKklv5vsrwxZgccNYQXZSlKpZXEZVI
 kasqUrh8XJvAyb68J+XTd2v5BxQyt8QN0dmTX8k2fiwVktnBQ2KItvB/B
 1K8TtF/Gj2zQhIRN6ybLDosiKbKYSn2f8DHpb4LpJX+9c91X0Hmr8Sux9
 KtdEyiFgzTqhLXKSSmHZItSKrnkWi1VmOHTvcL5kxyrWeU5/tXEnQSxTl A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="351164678"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; d="scan'208";a="351164678"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2023 17:29:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="802462823"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; d="scan'208";a="802462823"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga004.fm.intel.com with ESMTP; 10 Aug 2023 17:29:44 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 10 Aug 2023 17:29:44 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 10 Aug 2023 17:29:44 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 10 Aug 2023 17:29:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NVo05a4amIC/IWtFZpO4LyXoMvmkYrELwhmO+nnThDbpf8Gu8xz4eVCniiWm+/Z2mGzbOO6r6Svg+S1glmiWIG1JmN2qEtVKU2F/5lfRMhAyFmXEdqc2YzD/2L2v3/pd/bM/TDvDiA/A9Y6BDgxn9TBTMxuChecORInGI8pyzSMEt4Z/AV1EK4n04hJSHGPi/7lTPotDdKeGZNt0qAZ8X3Pi6MC3fQb1b5WFCSa3DVL+xtdu/aLFbd56WS3SNzOCPW/5YA21TAmlYM6qNE48PlaUu/pK67OehVc1TMq6vLucYPmAW5oCAdNyvulLfD96lRbeTZeQcNoYfVpAJTziJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k1McJDS0PaTbTPSAQRNrqRi6GEnWF8NwIdwDkkGc+5Y=;
 b=EbiupusexJHQy6ChEDi7i+DsiJQivzt9XXr82ywiChpLCH/u9yewB6YRlKAdZxG2jRRDcD1RMIGcmfDBKlnVjdOnvL0C+zwCPBw50AIe7pAP2rRF0fSMW89xNjPMnKPRKMHZnPRKAFVxoKO5cmePJ768H3q7kRIrgUzyUOGtHpnW6HMx/BCchzzFIaH39j7aG9CMkjXDx2EMffQJtfYzzS0GYdJukB0dtnRMziAwEYmQMf7aD52igx0fAZWFVM+m7spwSBrfEXbxWFOBz1LUjUMrtY5YDfWNCpXicjQmJnNq0u/x2gBpGGqqlaGxyebn4gjNz/+xxmjNClgfoqwB+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA1PR11MB8544.namprd11.prod.outlook.com (2603:10b6:806:3a3::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Fri, 11 Aug
 2023 00:29:41 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6652.029; Fri, 11 Aug 2023
 00:29:41 +0000
Date: Thu, 10 Aug 2023 20:29:37 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Message-ID: <ZNWA8TxN1ZtdYuhV@intel.com>
References: <20230809190453.1927134-1-jani.nikula@intel.com>
 <169161122546.10297.4625741320570358620@emeril.freedesktop.org>
 <ZNVZb3H4uBHtU9K7@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZNVZb3H4uBHtU9K7@intel.com>
X-ClientProxiedBy: SJ0PR03CA0114.namprd03.prod.outlook.com
 (2603:10b6:a03:333::29) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA1PR11MB8544:EE_
X-MS-Office365-Filtering-Correlation-Id: 04eabedd-c27c-46bb-47e0-08db9a020d95
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i2ZPF7YE+z+S4v6dfCbSr/ZSPY33JtlIEwh1p1GLVbVOQKAK7BaVcKb/zP+M2TsvRI7Nf0d4L8B1nsIaIYT7DHCoSMuB70qy0IMPHq8ZLCnluR00SmqVAV7gUNSKSdYetEf+nUijtpO9x15RG5s6Mw0faPFx5eNTyVzyScA0HzXxyszzYBesBCVrwLUV2nUMSDgNnAzN1P9msPy71fVPwW2b7psh2f072mSJ3rKrGgkwr/RLxzdYoZKNhecDcKHl6oXzvKy/lxXO2q8tH6V7hsGfJc20OnQdjmy16FaIibyKhgoHbr7XROXXCl6exnM6N1crvsDVqjX7G5gEPIrKJqTNnCkrsf32y1xh8kYe64qvRz/hN4Hs7zuTezYxI++xALbGbmC1hGJ2wMllm6LuKbJzeF+VFbt1C7YN9T3sR79zhRHFO+Z0C9lVwwAwnPt0Qk34NVzMjeLHQP8llgroX3UXwKNarLkVGfOTMWKi+hdowaORE+wyTcTvzmH3tUDhunC0qsAhrGmk2u+we5V78iSFoNiuPONbKbeKVDqJWK4Ah4tG4Y2qZR3RYhUzHCQp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(346002)(366004)(376002)(396003)(136003)(1800799006)(186006)(451199021)(2616005)(66946007)(6506007)(66556008)(66476007)(6916009)(26005)(6666004)(107886003)(478600001)(36756003)(38100700002)(83380400001)(6512007)(41300700001)(44832011)(966005)(6486002)(4326008)(316002)(2906002)(86362001)(82960400001)(5660300002)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3ImjR5xTSYihlxcyYLjt+HS33tagyzq8KEcSJ+8NgWfx4IV2uETJtwA4vijT?=
 =?us-ascii?Q?RswbVVyR4e5nSPgh3IpW1rQw4vqm6TsDjQLHILHSnOR3m5TdRIdsXvab5aek?=
 =?us-ascii?Q?763C0bj9fWFVi+B0ztYd4uBUmQGqcQRM87RbNMVFjyzAY+TWF+VR+LD70LPJ?=
 =?us-ascii?Q?ErP8qRmUoMAn12p7lx9AVrbR2Va3zOxm0JpGHzRJDg2IIEYXxV9wz4AQVLBL?=
 =?us-ascii?Q?OrTSIWI0oR/Z35htPa1f2qYb9684t/LaV8CeraJFsXVMOQjREN1CxD0EOv/P?=
 =?us-ascii?Q?x3DrmcvpaIrfM/JwA8Jqw9aMJeAc7wQ2o+JZ/rLU+eCGF0roLl3Q0umCLnf7?=
 =?us-ascii?Q?y81KdRy8JvajNPcVQmR4p9d75T6ynYWM5Q3GWmT+vLPkC0U5mtEYkvS6Fqev?=
 =?us-ascii?Q?vuRJfTXKqgExry1qc7Dut4wT2KSYUwgk3farc9nK4JFek92z2O0PEK7m25rA?=
 =?us-ascii?Q?0B3nd0AoCCea1famSwYB4Oo8hO4RRumX+aSvxUjj4tY+7xR/rj0JXeXHVnWn?=
 =?us-ascii?Q?xuD9/Gtfvhz9fFL2mpWC5/UveEe6yp4tAzNUab3TilddUr1weJml1L2IU1D5?=
 =?us-ascii?Q?Dzv1skLkxLuFvnxoHmf0rmNaDHdHBzqIiiantNaYKwfxf/C/fQKNkitoMTI8?=
 =?us-ascii?Q?HZp7nlP78tARrR9qLSPUonihaFXF+gWKK0hHoFjaTotnLA04VoC6r14kHs+2?=
 =?us-ascii?Q?I3TjvEmQzZuAboAfCy7YxK/kKJLAjpk/iZyWccRBnsAAHK6YKGK6Ai0RVbQe?=
 =?us-ascii?Q?UuWqncNVYvee1d/x86nwf0y7rKDENIRyorHWt5Ehb+HQ5KNYHTSOG85b6wO4?=
 =?us-ascii?Q?SBy0GMkTNaQoh2k4K9hPKWwQk0SQlTLoAyE7CbwIn/yzrP4k+nrT6+KogiMs?=
 =?us-ascii?Q?z+ogedrvKmkTx4Hm9oAAqc6YbGTFn36ELH2LwlDOdBk4tz38upNAxYUEAVDV?=
 =?us-ascii?Q?CVS9vcE55T1FwPrlTAZxvPXGQlb+rihIg3VBw60GoEnNedt8/MwUFGVGOKBP?=
 =?us-ascii?Q?9tHzn4WBgMDr+adU3kHKHB55zNJ+zeu+2LTDvwMAsKfESMgeKhmCeItHnbS5?=
 =?us-ascii?Q?1E0Irc5bPDiBeXf0JDySKTL5+7I6CXoUD35DAPCOBJUGjKfuPuW5qoFacf71?=
 =?us-ascii?Q?SfJwsFbFh56WMSI0N35atTfQbDJyGre3ejpbVcQSeJMa1xDq80rdpP5sp6aZ?=
 =?us-ascii?Q?1m3ZqN/PH0PJPLqp5aUpSuBaC7DK6EePlYF6BCPL8TBNEz1EzHiJgbuCwMjN?=
 =?us-ascii?Q?DegJH2WA9zOZxYgGZQxs6cQQh8dqt22uCox7QCJrgbjGYgdDkyfgicEAjL4d?=
 =?us-ascii?Q?hA7qmsL0zdtIEXvurrvnetRs1ubs7XOpQfBCuHFlxobmeIUJwjxwTp3PhiWr?=
 =?us-ascii?Q?5eBmfPuFTOC/D7q/t9Goz43kBB9ci8WaSJY+GJNFltf6q0ylzMLrt8IjGoxl?=
 =?us-ascii?Q?DFv5T7xs/QyZPTvqumupaI2kIPnkz22zUAzw8OgSgM4tA3icFpaNVBhX5rzn?=
 =?us-ascii?Q?+thoZzYe1QhxZUS/fGhQdUBOWwidi8k5QoTU1i9nH9u2+r891NmRffCsl7MC?=
 =?us-ascii?Q?jBX8L3iy4T0WFC+j2/wCV0udTg66MB6VSlhPecqULVlG4suaRoeTc4+2oiVv?=
 =?us-ascii?Q?6w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 04eabedd-c27c-46bb-47e0-08db9a020d95
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2023 00:29:41.3711 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EXjSSw1Zh4ms3ZsB2sahW2IyIWA9n1yhbqL5PZrCS/APViZBJxrr3+rojus5Lys/qIXnB1fjFElKQrk38LEcUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8544
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] 
 =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_series_st?=
 =?utf-8?q?arting_with_=5Bv2=2C1/9=5D___drm/i915/display=3A_add_I915_condi?=
 =?utf-8?q?tional_build_to_g4x=5Fhdmi=2Eh?=
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
Cc: Jani Nikula <jani.nikula@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Aug 10, 2023 at 05:41:03PM -0400, Rodrigo Vivi wrote:
> On Wed, Aug 09, 2023 at 08:00:25PM -0000, Patchwork wrote:
> >    Patch Details                                                                
> >                                                                                 
> >    Series: series starting with [v2,1/9] drm/i915/display: add I915             
> >            conditional build to g4x_hdmi.h                                      
> >    URL:    [1]https://patchwork.freedesktop.org/series/122242/                  
> >    State:  failure                                                              
> >                                                                                 
> >    Participating hosts:                                                         
> >    bat-pvc-2                                                                    
> >    bat-atsm-2                                                                   
> >    bat-dg2-oem2                                                                 
> >    bat-adlp-7                                                                   
> >    Missing hosts results[1]:                                                    
> 
> maybe it broke the build without CONFIG_DRM_XE_DISPLAY?

I have verified this locally that it is not true and I have tested in DG2 and
triggered a retest in CI.

The retest still didn't run in PVC and I couldn't get a PVC working to test there,
but I cannot see how that would fail in PVC and not fail in DG2 without display.

So, I just pushed this patches since it is better to have them before my next
rebase.

> 
> >    bat-pvc-2                                                                    
> >    Results: [2]xe-pw-122242v1                                                   
> > 
> > References
> > 
> >    Visible links
> >    1. https://patchwork.freedesktop.org/series/122242/
> >    2. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122242v1/index.html
