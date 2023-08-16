Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A6BAC001B0
	for <intel-xe@archiver.kernel.org>; Wed, 16 Aug 2023 11:40:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B06310E35E;
	Wed, 16 Aug 2023 11:40:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6DFD10E35E
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Aug 2023 11:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692186024; x=1723722024;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Mm3tpzRiQKWXwbPNHtmYnmSeyeuIXfFcVcX3Iy0E3vk=;
 b=MR5sFiieSFZkVBBc43/Qln0OFLiYfd5V2BiKleYXh5tTUhKSjqPoi6f/
 2pWBBZAU8iF7DtWR8HITu69DQxQVWT5n4TGg4MY82dz6i/4XG016nVrX0
 I2sUmpBdwxjQFuDaxa7drJPdEKIO8SDtHZCbJUROZwwN+0Sx6T45M8Uhf
 YX05HM8uOv5/I4J2qV0trEm29gihjg8sPfz3QvD9E8EMppjINbdeSYFgS
 uiOm3/FaHFcGwop2WHarGTlNX6TGNBAEUQS3f0WnA/7wfu4DlF+MbyYBS
 BykjnE25WFsd92j7YSmPfqXF9Oh3sJtjGaPB/GkuWfd/hjgSy3IwarL36 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="352097797"
X-IronPort-AV: E=Sophos;i="6.01,176,1684825200"; d="scan'208";a="352097797"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2023 04:39:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="737275138"
X-IronPort-AV: E=Sophos;i="6.01,176,1684825200"; d="scan'208";a="737275138"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga007.fm.intel.com with ESMTP; 16 Aug 2023 04:39:47 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 16 Aug 2023 04:39:46 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 16 Aug 2023 04:39:46 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.103)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 16 Aug 2023 04:39:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cIGinRP+lxFfl80Q1CTN+ov26o+hSb7ie49FeCw/nFFCDZ8JJjPWKV8lwLZ6I9p7TUmhUVDdV6wiyBfOfTJnN+yA/Gy3Re2OHuWy3kBAOB0xNd4BCGyy5F+zqRscrDyxgwdRfhcDKRvW8yfDtqQi6H49ecJ4FIxueu9xWINjhh2WtXcO87ixEyniPGegEH1nkQ+vcYVt4MoZhlArZLaBAsE92sAyvaask2nq9JxLYLp9fJirAhSHcdJ6Ff65tzfp5V53DCjE1mHMT3vGutXCQtQEm6Qkz+0SwERz9fbK/yDBy2WHk2JTL2XeWCA40F2bxQGGbqSk9LrkcgpTDu9BoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p73SIk48dy61GfMsAfGOvpHcISyqeSD2J6gPz58q11E=;
 b=lhbX456m2WHKvZKQ/gyI5bLZVEt8IANsd559bScClDpjgt67nvJr05cFcsvn4RyFDtKLOASoecsYkkONu73V5kLJBZZ3hlmr+n0qNYdk6b0KW3OkAfGqgCy3TJunavedvhHzzdKmAIMY16aup+RvR/Oh+cz2ddLHchNPjX/FTUup2HIxl7XPAGFWOSmly8EPBIUHWnslTIKgo54niZkmX9gtEpgygGjtlC2DsA+6L4tHLcRvVf6Vi1ZOwmKkiOLLQlwehbBdCJ6FEtPzWPpEWbspA2gV0sFRlxSMHe4l2wrNO6IKDaPOgbqG+arnjRnRoXHX+KE43SUfZxnLm1B+iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by SJ0PR11MB7156.namprd11.prod.outlook.com (2603:10b6:a03:48d::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Wed, 16 Aug
 2023 11:39:39 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::f7ed:4327:5d1a:b8fc]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::f7ed:4327:5d1a:b8fc%4]) with mapi id 15.20.6678.025; Wed, 16 Aug 2023
 11:39:39 +0000
Date: Wed, 16 Aug 2023 04:39:36 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
Message-ID: <ZNy1eMpIgheAHxK6@nvishwa1-DESK>
References: <20230814160217.10707-1-niranjana.vishwanathapura@intel.com>
 <20230814160217.10707-4-niranjana.vishwanathapura@intel.com>
 <da8baf4e-08e2-449a-9b74-168f8bc80cf0@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <da8baf4e-08e2-449a-9b74-168f8bc80cf0@intel.com>
X-ClientProxiedBy: SJ0PR03CA0294.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::29) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|SJ0PR11MB7156:EE_
X-MS-Office365-Filtering-Correlation-Id: 624f0fc0-ec84-49c2-6a78-08db9e4d7979
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PqwBAvUQxiVAjvoA5EHqzgjWtbyXuijUknN9i7IIjXU7r4hZ5Xu2jMZh1lSOGMiO/F+4xSN5OoxMSnLbpEFITG/GZZKDyitM4kumQzA1na1szBBqY1K7bm/cZpNmihqzB1amvhEraCU9/wSxI9DZKutmYcZUCR9efjBqEa5xt1e047jCbi9ZI2/ZwIx4O/ScAO3s2KIfqH304wuG7KwDIxnN6ok0+prjeCxjTGDhARQphV+Tg183Aqev/3lgphYVZzZHyu0ljV3WvT3nOLq0HudKwEAlLsxpQwrnR3ke3vGVW0lxfbkBEH0D8P+y2AUASh7JtToCjz951aSiCUo8qA8kTGgAr8aPPgX6CEb2BNGF5MRemIlouBA3xxMUebXGFOP5QzWo3oU01lBMf2R1Tr5aHsqCkMZumC3+xr7pOBgJbdzeWHUBuk1Pcls4AYRMs56OaStiBvmY1xKVUbKY8EgCAmGHJZTbIMvhBjIUKz/MwdfbzzfcN2f6dAgJXHf3ECVZMpJb2K5gnC1Mqb++J3NtXG96bBwlslSWidcREbB8s1PoT/MjY3cTF8BeOlbh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(39860400002)(396003)(136003)(366004)(346002)(376002)(1800799009)(451199024)(186009)(316002)(6636002)(66946007)(66476007)(66556008)(41300700001)(5660300002)(44832011)(38100700002)(8676002)(4326008)(8936002)(6862004)(33716001)(82960400001)(2906002)(83380400001)(26005)(478600001)(86362001)(9686003)(6512007)(6506007)(6666004)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?2x7LeRqVbDVoXw6wN20PaYh3/QBOymkFKl2IpMpjX43Ty0/YWI2kqrb5/H?=
 =?iso-8859-1?Q?NxGmftVTdIMNSamDS1HQXBWPofNNjYnlR1lSucFmOdrMfPbij0KEIKyN6J?=
 =?iso-8859-1?Q?1GGqm48ErnpZq1h3KEiUr0KxW/UYZf2JlTetfXB2UlmjA7lRb0PW0TPntG?=
 =?iso-8859-1?Q?zIBdyUWyLaDfAtvjyE6ZVCCDVAVn0Q2+ZhiPuBBQltSN6UVRJgF9EV6ivX?=
 =?iso-8859-1?Q?WbKswk3JXDP86NMHxyIFHYi3zYs3Tj+0rZDmoVeap0/rFcWLN1Sbiv4TNT?=
 =?iso-8859-1?Q?qfmXIT9IfNNd1tfh7p1Pr+ZgcwfFtFHg9/HHoKqzlQgGwpdsuY9L7EVa6x?=
 =?iso-8859-1?Q?uAFntPoa7OwUXR47zLC7A88OAdbC6AKr33kaaFEuKY+fukLxL5+lPCzYdQ?=
 =?iso-8859-1?Q?fqk6I4Y4omKFcJUbaMCe0myjWI3NpVzgbK2nIyzo1ge2wMzyRfIyttZ/GN?=
 =?iso-8859-1?Q?GrRmFQzkeM97DIDh6V3XcfTVGmycgj6s862XmNS+IgklPNkASfzrd4/W3j?=
 =?iso-8859-1?Q?eLgaDs4yubxjO0S4nlaMzZ1VAgY2MYAl7c7XJqzLgZUvfpH664LyBLKdNd?=
 =?iso-8859-1?Q?79BdFuqHxsR//cipAfR73qEiehj+GwVIrPSBPptmOFjw4hLM7cR8lPKcQU?=
 =?iso-8859-1?Q?0CAl/dbCcmXvYKSBcyH058EmKFn9sXiVX45FZ2dC8rj89tXS9P6guAqdmy?=
 =?iso-8859-1?Q?8iV2VRqQ7dVI1rhNZXZUpBFXZs028LpBiV6H8MulJdU0cV1hdaM3632Z6o?=
 =?iso-8859-1?Q?lejq1xHtybE+Ycu6tK6MdOLklQbo+vQODRRY6Ia9+zAPUtU/ls8pv35VwX?=
 =?iso-8859-1?Q?qe8CeyS9HJZmLOFh2kL9r0UC/HtKPsQtS0iN30guLhzoT6ARxgDqHQ1IoV?=
 =?iso-8859-1?Q?MtBRBgiKoB2gmVNVy3QFTNQFvsdCKbLc0p50+B33elos5NddTYB69psDLM?=
 =?iso-8859-1?Q?2pJOEKciYmyLKKQdD+2jY4jByfYs1tjcMnenVyangzqjV4HFIGZus+RIl4?=
 =?iso-8859-1?Q?PFoAWej3LRhbutLhP9CGyVQjnhKxYVfEBuEaY1g2CJ9d3jcvz87WRTGqiq?=
 =?iso-8859-1?Q?A6Mew43ChJ4/GUrUpok5lYLe/TWXffGqs2+/N8Udk7bCvOugsXe/C1wP1v?=
 =?iso-8859-1?Q?ful0EEzqQ9iwwv4Rp9gw1zis2li4kDfoMQlHRiDeUg3OTS16p9woK4M3J5?=
 =?iso-8859-1?Q?LGr8J9Umxi1cvBIlx9udmdUqqzOD7Vi6GAPI/rCBumracZX/aYkhnEFZOY?=
 =?iso-8859-1?Q?oiMXPhdKBKtLrhMNWnLu+72wcbnG0eN0IMABeBK0r8+ICmdgot1IRK/BN3?=
 =?iso-8859-1?Q?/YKdBfTbGBgG9Y2X9Iq1PxVlLAgq3X/s2dYIRD9SGdjwFShgnp0qCwY/Un?=
 =?iso-8859-1?Q?qp0oCMWRxo78TYkvTMR7Vhy5WKCSzOOgz+fg+s6JYONCrXV1niGVYLVkEw?=
 =?iso-8859-1?Q?m92blS3P0BXoicBi/PX7IGBc/QcuLxMPosCZsU3kYHclIv4M7M2sHytR7n?=
 =?iso-8859-1?Q?vx3yO/XxfHwsYyoXrTP0PmC15mkhnovlgDtwmTMpxBvjIIaJvA0dkkNrpB?=
 =?iso-8859-1?Q?b8iJipIixDZ4mikve0ySBLujmm2rQR2HkDM+QSBFJhEfhi0GHp57hZuy4m?=
 =?iso-8859-1?Q?54OqS0KsPjh+lVKZbh3g9fpx9pHGY/d0ijYwx35yb3HwGxY9Kh0ZKV6TO/?=
 =?iso-8859-1?Q?xIWkjXS+Scm33VdivNk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 624f0fc0-ec84-49c2-6a78-08db9e4d7979
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2023 11:39:39.2463 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pfh+XTEObPTKXVZHAiRVc1Rw31qhQUPsDoiW572absQqjdolhffSEuhONFRbBOIeHR0Y6kteC5R/Ng5PBK/bsQ19+HqG5wQKd0FXisXVxrCAy+KK3H4oxC7i21kS/eBe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB7156
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 3/3] drm/xe: Add
 CONFIG_DRM_XE_PREEMPT_TIMEOUT_COMPUTE
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

On Wed, Aug 16, 2023 at 04:05:39PM +0530, Ghimiray, Himal Prasad wrote:
>Hi Niranjana,
>
>On 14-08-2023 21:32, Niranjana Vishwanathapura wrote:
>>Allow preemption timeout for compute engines to be specified as a
>>config option. The purpose is actually to give compute tasks longer
>>time to reach a pre-emption point after a pre-emption request has been
>>issued. This is necessary because Gen12 does not support mid-thread
>>pre-emption and compute tasks can have long running threads.
>
>Description mentions setting longer preemption time for compute 
>engine. Whereas
>
>code changes are doing it for RCS and CCS classes  both. Might be 
>better to modify it.
>

Thanks Himal for the review.
The Kconfig description mentions it correctly as for compute capable
engines. Got missed in the commit description.

BTW, I noticed that we probably only need this for GEN12 platforms.
Hence, I will remove this patch from the patch series for now.

>>
>>v2: Change unit to microseconds (Tejas)
>>
>>Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>>---
>>  drivers/gpu/drm/xe/Kconfig.profile | 12 ++++++++++++
>>  drivers/gpu/drm/xe/xe_hw_engine.c  |  8 +++++++-
>>  drivers/gpu/drm/xe/xe_hw_engine.h  |  5 +++++
>>  3 files changed, 24 insertions(+), 1 deletion(-)
>>
>>diff --git a/drivers/gpu/drm/xe/Kconfig.profile b/drivers/gpu/drm/xe/Kconfig.profile
>>index a3655ee6978e..dd7f155371fa 100644
>>--- a/drivers/gpu/drm/xe/Kconfig.profile
>>+++ b/drivers/gpu/drm/xe/Kconfig.profile
>>@@ -31,6 +31,18 @@ config DRM_XE_PREEMPT_TIMEOUT
>>  	  an arbitration point and yield to HW before the timer expires, the
>>  	  HW will be reset to allow the more important context to execute.
>>+	  Value should be within the DRM_XE_PREEMPT_TIMEOUT_MIN/MAX limits.
>>+	  This is adjustable via XE_ENGINE_SET_PROPERTY_PREEMPTION_TIMEOUT.
>>+config DRM_XE_PREEMPT_TIMEOUT_COMPUTE
>>+	int "Preempt timeout for compute engines (us, jiffy granularity)"
>>+	default 7500000 # microseconds
>>+	help
>>+	  How long to wait (in microseconds) for a preemption event to occur
>>+	  when submitting a new context to a compute capable engine. If the
>>+	  current context does not hit an arbitration point and yield to HW
>>+	  before the timer expires, the HW will be reset to allow the more
>>+	  important context to execute.
>>+
>>  	  Value should be within the DRM_XE_PREEMPT_TIMEOUT_MIN/MAX limits.
>>  	  This is adjustable via XE_ENGINE_SET_PROPERTY_PREEMPTION_TIMEOUT.
>>  config DRM_XE_PREEMPT_TIMEOUT_MAX
>>diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
>>index 8e5153cada31..e9ce34faa2da 100644
>>--- a/drivers/gpu/drm/xe/xe_hw_engine.c
>>+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>>@@ -340,7 +340,11 @@ hw_engine_setup_default_state(struct xe_hw_engine *hwe)
>>  static u32 get_default_preempt_timeout(struct xe_hw_engine *hwe)
>>  {
>>-	return XE_HW_ENGINE_PREEMPT_TIMEOUT;
>>+	if (hwe->class == XE_ENGINE_CLASS_RENDER ||
>>+	    hwe->class == XE_ENGINE_CLASS_COMPUTE)
>>+		return XE_HW_ENGINE_PREEMPT_TIMEOUT_COMPUTE;
>>+	else
>>+		return XE_HW_ENGINE_PREEMPT_TIMEOUT;
>>  }
>>  static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
>>@@ -570,6 +574,8 @@ int xe_hw_engines_init_early(struct xe_gt *gt)
>>  	BUILD_BUG_ON(XE_HW_ENGINE_PREEMPT_TIMEOUT < XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN);
>>  	BUILD_BUG_ON(XE_HW_ENGINE_PREEMPT_TIMEOUT > XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX);
>>+	BUILD_BUG_ON(XE_HW_ENGINE_PREEMPT_TIMEOUT_COMPUTE < XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN);
>>+	BUILD_BUG_ON(XE_HW_ENGINE_PREEMPT_TIMEOUT_COMPUTE > XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX);
>>  	for (i = 0; i < ARRAY_SIZE(gt->hw_engines); i++)
>>  		hw_engine_init_early(gt, &gt->hw_engines[i], i);
>>diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
>>index 71968ee2f600..cee0b40a62a2 100644
>>--- a/drivers/gpu/drm/xe/xe_hw_engine.h
>>+++ b/drivers/gpu/drm/xe/xe_hw_engine.h
>>@@ -35,6 +35,11 @@ struct drm_printer;
>>  #else
>>  #define XE_HW_ENGINE_PREEMPT_TIMEOUT (640 * 1000)
>>  #endif
>>+#ifdef CONFIG_DRM_XE_PREEMPT_TIMEOUT_COMPUTE
>>+#define XE_HW_ENGINE_PREEMPT_TIMEOUT_COMPUTE CONFIG_DRM_XE_PREEMPT_TIMEOUT_COMPUTE
>>+#else
>>+#define XE_HW_ENGINE_PREEMPT_TIMEOUT_COMPUTE XE_HW_ENGINE_PREEMPT_TIMEOUT
>
>In case of config being disabled, why not have longer preemption 
>timeout for ccs and rcs engines ?
>

If this compute config is disabled, that means user wants to default config
to apply for these engines as well.

Niranjana

>BR
>
>Himal GHimiray
>
>>+#endif
>>  #ifdef CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN
>>  #define XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN
>>  #else
