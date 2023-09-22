Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3B2ACD4850
	for <intel-xe@archiver.kernel.org>; Fri, 22 Sep 2023 18:57:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F39810E6F8;
	Fri, 22 Sep 2023 18:57:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C920210E6F8
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Sep 2023 18:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695409059; x=1726945059;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/kcbqCVZyXVyeUgFF/pEQylGk9vZx8bBBvCE3SFhWuU=;
 b=SGDopQRlzPS2eyHqfuec10KOmdLZV9jbAHp5YrNnNLPS5lRlsg+9DdMy
 t5Iclw0Jy/5DcD2VmR1/55FI/ymPz8kTySeaas97IVIthIxnRDUGB3ZHS
 QMJFH+7zg19/9Q17Y2KJFIHLIBKAgviz0bX7C5ffzllwtT6ay1iLco/ZM
 f+vIADyGEvVI4NjvfboIU8UpClUZ0ydDuCmvS+PCQCKpbNWUprZGtW3Md
 oKVjgUgToBC7nWy5W3rvT9YuGQ3yFKtpYPo5EahMQBTJqZiAPtd007aFb
 +b2tuvU6pVH6k4UOMbUI6HTD3FLNEIBVOjf0ykqHGY8HcW1biDPon4zcZ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="380814617"
X-IronPort-AV: E=Sophos;i="6.03,169,1694761200"; d="scan'208";a="380814617"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2023 11:57:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="1078486254"
X-IronPort-AV: E=Sophos;i="6.03,169,1694761200"; d="scan'208";a="1078486254"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Sep 2023 11:57:36 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 22 Sep 2023 11:57:36 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 22 Sep 2023 11:57:35 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 22 Sep 2023 11:57:35 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 22 Sep 2023 11:57:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lm2w6+DMK0VkjO3JP8DLD07i1nMyS9AcFDbET5gl7xwhAqwZbrep9U/EdML+IByQTQ3E272fJty+c3c3tQWhGJ4ceHn7eRZZlFYZnyo7M2KaIkSl2NGo03jbUamLBQuOMd5EvsUPMVpMwTdP6s/u0xIy+xfiMmx+flKKHDgTSsXvIPRTISFWvjZUvvCbopy/Jkr9k7ThR2fi2My0fMzsV5/6T1n6ln7GxvYZZyoO1EESdndqrXnrt2bFBa8Voa0OiDf2DFyBrkA+oGRM3Pji+YPKMLmuKyvvh6MyMz9Q1aV0sYxaAqz/WCLgQVzlCitngMszMrnatPBaToBrnAU+hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0qe8J1zPTQGVGPYh4kd1ZBqjYq6C8Q0EV1dbyBqXcDM=;
 b=DMO2NPWH0j67N0HUyBUkCrXgDoVAWdss7u5HXup8pn/mNSPqi07650vH1t6eSQS1rkNI/AidHsfzyKJc928VR/5jFVZHiKMcmajYj7Rhc3LYveatvmcikcvQ4Ny+A2vs/RiPMoiXsTLTbXkMFpvt9RJCtmLbmNMPHwqNRyP/3r6nnu53bJuOXq6pP/vxaZvKkraXkCItzTwxBe6zTSoWBX2whpN1gDssFWKdZHMPAHudTervDmxHCRXvXCdE+NT9lrCiBnE63mSz4/83WQ0r+iJH9yh8mxDPXzdaaEF+hi7RSr8PuyMldOzzWxgRKX0aUQAk5UtxIL/CpOUGeVgCTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA3PR11MB7612.namprd11.prod.outlook.com (2603:10b6:806:31b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.23; Fri, 22 Sep
 2023 18:56:33 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%7]) with mapi id 15.20.6813.017; Fri, 22 Sep 2023
 18:56:33 +0000
Date: Fri, 22 Sep 2023 14:56:27 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Zhang, Carl" <carl.zhang@intel.com>
Message-ID: <ZQ3jW8OwB3M3LdDs@intel.com>
References: <20230919142504.91652-1-rodrigo.vivi@intel.com>
 <PH0PR11MB5579513043AA7308CDC8C47687F8A@PH0PR11MB5579.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <PH0PR11MB5579513043AA7308CDC8C47687F8A@PH0PR11MB5579.namprd11.prod.outlook.com>
X-ClientProxiedBy: BY5PR04CA0017.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::27) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA3PR11MB7612:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e0e9cdc-a761-4fb3-306c-08dbbb9da33c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a6v3lwuzcILDt/DjSxLzT6VUT6BZ/Io3/QiFVP2uqe0NpJslYp+scPL56xRqZlT/zZLbJCOaFd8JswEyS4ss3eiGKJer2ZZsB4Sipg4SKXG9+lfeQdpz/B+rv/KesPhpwSad0AocRCSNUqvxuADHoeqGE9nFpXjzvbF+jtrw6IXUj2a6AxPETy0Vhckl54RpWFQqjZFvlrzVlPyEIMQWpxarz/UgUNAM6eVbmWwjPeO4v6hRppy4Kz3ELVjUdxHou450SCgDfCA8fx8d+DP3qZgl09FrksE5+/RXjcAfFqzFTkav+L1IV+yQ5Nlsu0NFs/qDdFTxA07PLhrn1zN1MR73G+LaSNYLvxb7ws8aPGQdp4YWllDhkozIhi4Mu27b3lyKmlyFxejyYRJJTyT4E7CKbiC/zwuehoodKaWI6SmjdHH2Wl3uTZu8Z1hyvgBFLBg06VBqMcBuT4aZy6IhBYV6vPj8kSdsg6e/+gGlpTvD8a5kWPjXwR5kBGMClh+8qie8+LqJiJf+LLehombSXWd+S6KYNxfNDvV9HdNu2Gki/lsHkBg5oaoDec0v/ulE54xpPzdrSF7gBbaS1mT3yw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(366004)(376002)(39860400002)(346002)(396003)(451199024)(1800799009)(186009)(2906002)(8676002)(8936002)(4326008)(6862004)(41300700001)(44832011)(5660300002)(37006003)(6636002)(66946007)(54906003)(316002)(66476007)(66556008)(966005)(478600001)(6666004)(6486002)(53546011)(2616005)(6512007)(107886003)(26005)(6506007)(83380400001)(82960400001)(38100700002)(36756003)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qicCQLebUPGjolSr4YcW+YP8xbWsnqL642G5lmABL3J7zRJ9fK+GM7e02ZYD?=
 =?us-ascii?Q?LjmxGwDeNYZO0BBtw67SU5kmHjbXigsiNi/vs0ckShjDIax8hUBKSb9KKeFd?=
 =?us-ascii?Q?yN4tGIxmnKoUAgJmqzIZwLVQHHgBm8f8AQuuKTEu6kiSdFR4GAIJTz6LXK6W?=
 =?us-ascii?Q?21FU3SpweOhOMdQk2744eacJ//OVc9rzWAoW2ApMOnP+zs2dg7MfTR9J1lyy?=
 =?us-ascii?Q?z8Lw8oBxeUPE7b+2PNMU4Ai8KdZezXkA6yoFPq8k1a6IAWpHW25gf2lrZR+k?=
 =?us-ascii?Q?oZ1KkadRQESMQsu7Feo4qm4YX3jS2k+duScqdk9E3e5QxjylHHBzpdhbmFbK?=
 =?us-ascii?Q?AuBureyViRvtvb5plie1uKBqF/KN7AoPDIbNz/i9D6EmhEXBBjBGU/gnpiNC?=
 =?us-ascii?Q?Wngz0R0/08VWXO3zZEMQoEMjcpz3oUbNUhD59OobAGB9rY9xlcIPaL2G9S4l?=
 =?us-ascii?Q?NAMqHVMtTzt1THKIp3MJXceD/jpM0nsZ7bv9+5LI+PGK6KrhmSnwsyRTk4iG?=
 =?us-ascii?Q?tonjBmdf/Eoxjo6O4bjxUpwXG6lOQAxVaQr7/qAu/kmjOYRAZ1+eVuaWbokF?=
 =?us-ascii?Q?7rdsQSCzIsHwCfwbkFcTe4+vGEZcdKDSNWVwqDPCPZMw1fokk5VX9g+Q5IsI?=
 =?us-ascii?Q?LMPPxTHE9mHdKCQL1IqtycPfwJxgIjyoz/mBTebolW2cW3t4zL1jpdXOcpz9?=
 =?us-ascii?Q?4OuXsKvnT6ZuCPafgELzBZLn171e2ILrnedlCg/lBfFDKV4OaC4VNjy3fo0X?=
 =?us-ascii?Q?3u0vC0Rg/payBhEm+244FywqxOCz6uzQgVMnBfVJjNPJxraaJgjg7gD7p5+H?=
 =?us-ascii?Q?k49t37umEVlbWyGSgDKDJKc6utt0eNfzyXxcUzmNabongTjyhcjUfSPinmUg?=
 =?us-ascii?Q?dsbE+xF2dzR6DYf+InPwK65UQ3ZNH1rAbWrT2rDx0umMROenQ24tCjYpQUDm?=
 =?us-ascii?Q?7zfnIVq3za5fjVgR3PvCwC+isFfpSnOgOcZEzjYEUXbMHN2ltufTcwPr61JT?=
 =?us-ascii?Q?bbw2VHKkvWRn5k5q0psDd6unL6r+Qc02knq4KPUMcbH/RbCJnhAe8XgdYHGE?=
 =?us-ascii?Q?TA6eDGVpzLW5dPDbWRbo2E+BOfQsOPjHGJXHY+GfrEbw79X+b8/nAERdrN24?=
 =?us-ascii?Q?oapL3DwlgC/BPcVA9PzuWw7hs++/R4dg53HLR1mbQqf5vuKFY/0DvoNRI7tJ?=
 =?us-ascii?Q?7WNplNQZ1qvcQwtZWx2jjRokur55MoAdcBEmxihAI3P67pwaueRakk4Lc9c3?=
 =?us-ascii?Q?cgbirMjAs9JPpVIEp0wSPQRyoisgpWaLgW7JRmyq2DCrZh6sv8QBTikHF+6U?=
 =?us-ascii?Q?Qnq8+QBzreXGyhPc42tM2+hrYkkrVFI+BCORJsBKe1wY2eLXsN9Uf0yNbIaa?=
 =?us-ascii?Q?74atr3l7zHu9NurvUqC+rBdo+LRoe8QZjf3fNgs+aSCAmtXmQt0wEdGrUTsg?=
 =?us-ascii?Q?67ju44dbFxgqPEx2mblF2jwPwFNH2kXBwdUqJIb7tDQo6o+8mtXYD9dZ+96o?=
 =?us-ascii?Q?HH/0xwR2zSe6qHWmDadgdMfyijT5kGqQHfo0Y+us9GjBzLZBwhIyZe4sJMi3?=
 =?us-ascii?Q?61yemMqWK67DWPVkMIwMKoDrsqB7Uwa6i2P4UkMk?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e0e9cdc-a761-4fb3-306c-08dbbb9da33c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2023 18:56:32.9435 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X7jkv56afHROlEzIlKzjgsT3D1ABoGHMuGPHsy1JFszvb4xZ4KdHokurVCaSsHKDE/DcEKPoUKQgjTcpmGMo5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7612
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 00/17] uAPI Alignment - take 1
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
Cc: "Kopryk, Kamil" <kamil.kopryk@intel.com>, "Hazubski,
 Filip" <filip.hazubski@intel.com>, "Chaberek,
 Jakub" <jakub.chaberek@intel.com>, "Yu, Effie" <effie.yu@intel.com>, "Dunajski,
 Bartosz" <bartosz.dunajski@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Sep 21, 2023 at 11:06:24AM -0400, Zhang, Carl wrote:
> Hi Rodrigo,
> Have a quick review,  several questions:
> 1. we need add pad in drm_xe_engine_class_instance, in the future, media may need to distinguish slim vdbox and full vdbox , or other special configurations. 
> So, reserve one word  should be suitable for future use. and then the structure length become 8 bytes.

it makes sense. let's do that.

> 
> 2.  no clear description about DRM_XE_DEVICE_QUERY_HWCONFIG, even we know it is in intel_hwconfig_types.h

Yes, it is that.
We also need to make that clear.

> 
> 3.  about query GT, if the there are multiple tile , and it is symmetrical, which one will be MAIN, which is REMOTE?

right now, in an hypothetical scenario where we have 2 tiles with 2 render GTs,
we would have 2 main GTs and 2 remote GTs. Is this a problem?

> 
> 4. no method to query HuC readiness . 

We are already discussing this and the trend is to extend the uc_fw_version that
Jose implemented for guc to also work for huc.

> 
> 5. XE_QUERY_CONFIG_NUM_PARAM is only used to represent the number of query type? And it is actually useless, no one should use it.

I agree. Let's remove it.

> 
> 6.
> +/** struct drm_xe_ext_set_property - XE set property extension */
> +struct drm_xe_ext_set_property { 
> It should be VM set property extension ( XE_VM_EXTENSION_SET_PROPERTY)?

Please take a look to patch 11
https://lore.kernel.org/all/20230920192940.135004-12-rodrigo.vivi@intel.com
It looks like a generic struct for all the possible set_property makes more
sense.

> 
> ps. I still not clear why we need extension for single bind operation. :) 

Every ioctl in xe is extensible by design as documented in the xe_drm.h.
That apparently matches the Vulkan extensibility and the desire is to
maintain that everywhere so we minimize the changes of creating new
versions of the ioctls later.

> may raise more question in following days. 

Thank you so much for all the review and comments so far.

> 
> thanks
> Carl
> 
> > -----Original Message-----
> > From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> > Sent: Tuesday, September 19, 2023 10:25 PM
> > To: intel-xe@lists.freedesktop.org
> > Cc: Hazubski, Filip <filip.hazubski@intel.com>; Kopryk, Kamil
> > <kamil.kopryk@intel.com>; Chaberek, Jakub <jakub.chaberek@intel.com>;
> > Dunajski, Bartosz <bartosz.dunajski@intel.com>; Souza, Jose
> > <jose.souza@intel.com>; Yu, Effie <effie.yu@intel.com>; Zhang, Carl
> > <carl.zhang@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>
> > Subject: [PATCH 00/17] uAPI Alignment - take 1
> > 
> > As a result of the uAPI review efforts started by Thomas[1], we have identified
> > many updates on our uAPI that would lead to breakage in the compatibility.
> > What it is not acceptable after we are merged upstream. So, let's break it
> > before it is too late, and start upstreaming a good, reliable and clean uapi.
> > 
> > Most of this work on putting these patches together for a single shot was led
> > by Francois.
> > 
> > The IGT counter part of this series is available as well[2].
> > 
> > [1] -
> > https://lore.kernel.org/all/863bebd0c624d6fc2b38c0a06b63e468b4185128.c
> > amel@l\
> > inux.intel.com/
> > [2] - https://lore.kernel.org/all/20230919142000.91363-1-
> > rodrigo.vivi@intel.com
> > 
> > Ashutosh Dixit (1):
> >   drm/xe/uapi: Use common drm_xe_ext_set_property extension
> > 
> > Francois Dugast (4):
> >   drm/xe/uapi: Separate VM_BIND's operation and flag
> >   drm/xe/vm: Remove VM_BIND_OP macro
> >   drm/xe/uapi: Remove MMIO ioctl
> >   drm/xe/uapi: Fix naming of
> > XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY
> > 
> > Matthew Brost (4):
> >   drm/xe: Fix xe_exec_queue_is_idle for parallel exec queues
> >   drm/xe: Deprecate XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE
> >     implementation
> >   drm/xe: Rename exec_queue_kill_compute to
> >     xe_vm_remove_compute_exec_queue
> >   drm/xe: Remove XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE from
> > uAPI
> > 
> > Rodrigo Vivi (5):
> >   drm/xe: Kill XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS
> > extension
> >   drm/xe/uapi: Document drm_xe_query_gt
> >   drm/xe/uapi: Replace useless 'instance' per unique gt_id
> >   drm/xe/uapi: Remove unused field of drm_xe_query_gt
> >   drm/xe/uapi: Rename gts to gt_list
> > 
> > Umesh Nerlige Ramappa (3):
> >   drm/xe: Fix array bounds check for queries
> >   drm/xe: Set the correct type for xe_to_user_engine_class
> >   drm/xe: Correlate engine and cpu timestamps with better accuracy
> > 
> >  drivers/gpu/drm/xe/xe_device.c           |   1 -
> >  drivers/gpu/drm/xe/xe_exec_queue.c       |  99 +++-----
> >  drivers/gpu/drm/xe/xe_exec_queue_types.h |   6 +-
> >  drivers/gpu/drm/xe/xe_gt_types.h         |   2 +-
> >  drivers/gpu/drm/xe/xe_mmio.c             | 102 ---------
> >  drivers/gpu/drm/xe/xe_pci.c              |   4 -
> >  drivers/gpu/drm/xe/xe_query.c            | 187 +++++++++++++--
> >  drivers/gpu/drm/xe/xe_vm.c               | 221 +++++-------------
> >  drivers/gpu/drm/xe/xe_vm.h               |   1 +
> >  include/uapi/drm/xe_drm.h                | 280 ++++++++++++-----------
> >  10 files changed, 402 insertions(+), 501 deletions(-)
> > 
> > --
> > 2.41.0
