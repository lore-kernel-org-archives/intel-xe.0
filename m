Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 213DEE71094
	for <intel-xe@archiver.kernel.org>; Thu, 21 Sep 2023 16:29:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E985010E122;
	Thu, 21 Sep 2023 16:29:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 076EA10E122
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Sep 2023 16:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695313782; x=1726849782;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ymPujzmNEvFtiMwHfy0MBABrVk1Tzf8NF3tZrkFOXgU=;
 b=lmqzEl22wQcriuR73sdA+TLXf7cVNT3O6biO5s0QLbrGn2t2XKKtWo7x
 jSCRQ66vgGvF77tmRtTnKgM5IAZ2Oqfk0vvk+YmlWscUbl0PFgveSQgZv
 dKT0g7J5CFxCXY4q6F2tutK/4+p6fUHQ7gnqCu4uLGBGAfjAiSHjJkz5d
 cjJeNbIFa6fsSxvjHZJB2KbZcvuvyJMUCqdMxzHgiNmcX/yX7m0VNxSaY
 F638+n4Rs3yLIUI/igMFec//e/krw3/rPrSzDaDqjj/luQ1pk1uEqvtYT
 JQ8bhbuDZ/O/VJt41DpeAVYE6h79lNYQZvb9OCVGfWhx+lT0afIHGYzKQ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="359954857"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; d="scan'208";a="359954857"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2023 09:29:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="920796350"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; d="scan'208";a="920796350"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Sep 2023 09:29:03 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 21 Sep 2023 09:29:02 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 21 Sep 2023 09:29:02 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.108)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 21 Sep 2023 09:29:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hyxlZqansZX6d5sM/AN+sCyMVe/473S0+OaUj0KTh/CQd1KLvDvBySUd14VbiCKEb5bDbyYQl3jOT7a+quNRmjN2YH+bAUBKbDEMxLe/RzypgENL9iRoaftxojosTJ9sjJy+51ttScxbWaIoMrJk6ym64pLx/JmHLRnKV53RkuvjhDzLkFxPJQ2RkRfoxi4j0jYxGDhy+ZoAZ9rFsYt1DFnxm0uZ1NRuvgFexEkkzNUPakZgJFfNJFQNf46AUdEgOhbb/bNYPmsT2iK1LwO6iu0higXaCU5QaNWXrnCPROOHXNP34WhyHDBqTj1Sd7Lk+9BYbUT2sGqJ90ZaaWKWGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=drnYojeEWIFHhw/8vi46Vg+isBXvrqCPGlws9X5rKcY=;
 b=aRmXV75uldXc6jDjeTYpBeZ5Vk55cLUff+lyBTBs12rhsKI1UIpa3HvXEBLgIbNx3pLVE3DXpfpz7KKekPb6VSHysHvvEIpbQ8tLkiQVkVPhMgktPwOZ/nqzc1pDH8G+/bKkSPDrYAsxyr2wz9MM45ZV1ycDJ68YStOBgEYyaLHqy2OmzdAxBUTOS+oyjTkQaCq+SfMcdCSs3GeR3abrSL6HFyIuCg+qBvzx8WtwvvF7bxgjuPjo+3YzMHhMFc6Dt4kBcfHZwvp3cVeqPUYpLGzmThMaafYWGBJ537jt3y1iECL5mu7c/jKfhLYMhpaqNKhGYrMbPFna/hAfS4KI+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DS0PR11MB8666.namprd11.prod.outlook.com (2603:10b6:8:1bd::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.20; Thu, 21 Sep
 2023 16:28:59 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%6]) with mapi id 15.20.6792.022; Thu, 21 Sep 2023
 16:28:58 +0000
Date: Thu, 21 Sep 2023 12:28:54 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Jouni =?iso-8859-1?Q?H=F6gander?= <jouni.hogander@intel.com>
Message-ID: <ZQxvRsTev0CAbyYh@intel.com>
References: <20230921111434.3051325-1-jouni.hogander@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230921111434.3051325-1-jouni.hogander@intel.com>
X-ClientProxiedBy: BYAPR07CA0001.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::14) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DS0PR11MB8666:EE_
X-MS-Office365-Filtering-Correlation-Id: a23a5fe5-3dfc-442c-b3c5-08dbbabfdb7a
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GfdBnHWXK3zpS+hIl4LB+mHtpcGQ3gZlGsVZiCDfS9jh9pEbxGb2QIWO9EqaROOhCImFeoG1U5Smyrw+y5xJir6WEBaNI70KvXlJ5KG3sxXJbGGs/OKs6XjwhCB7j0hQHLNdNSi4Vx0cnTYVQi5Ix2dbxIWObrHeVZMhDKQeK0j/jHyYj5ikvA+0CJqe91dXTgIwCPuOVxg42EzMZhT5diGf0Bi6agWCrCVbGnGn0IkoxvMix4lMwdfGNtRS6381ZZq7uH0wM0NGzwjLQLMqM/THdQM3k6Al6oBqfHWhifHw09PnPeaKNZXKYRZoHNXIomSq9Gklj7OQLEvjcE+FlV6mMIQSY/uNkVZUAQnLqfHWIR6yDEYW2RomYstP3wLTspbR1LTmk4scApyXF/T3C9XxbD25H8uD8MJRNp/Ar2EfyojPQ5nrgdGZQf/sV2AwyN282vD7r73bxamL+NaIlboi+g+JBVh0sLbrv7DwQLHHsvb+knkn1TH/d6of3eyHp2J8J8RbGzJc56uqmoKtiBkoOP5nngE2f9XQsNDkeLGfbL8LbLYKX1SbZRYmZX0A
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(346002)(136003)(376002)(366004)(186009)(451199024)(1800799009)(478600001)(86362001)(41300700001)(5660300002)(82960400001)(2906002)(44832011)(6862004)(8676002)(38100700002)(4326008)(8936002)(66476007)(66556008)(6636002)(66946007)(37006003)(316002)(83380400001)(107886003)(66574015)(36756003)(2616005)(26005)(6506007)(6486002)(6666004)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?pIxNY/YsdAyBLdnJksx5O0IxHzfF7rcZ0U4V8dG8e3FcQ7UV8sdMSFFkRP?=
 =?iso-8859-1?Q?gzzjvLeN41OcdrEZ8B02tKtvvIq837wTorV0jyOYTJQWoYkifdbh4qDWfz?=
 =?iso-8859-1?Q?IN8oUjroZTGe3JYkIPKgyhu6Yx+5eFhEG2mZj4eZkn5hggLTBrsJQHbsMO?=
 =?iso-8859-1?Q?891j+MEG78tAe17+oEj3HQHyRa9kDMFPKi2w83Eg0JtZUdooPKqdUFpdW5?=
 =?iso-8859-1?Q?FL/0VJv4/5DvC7k3i3mZGXbz7d1tG6XIDymGReHrGnIxuaILNQD9ovncYD?=
 =?iso-8859-1?Q?myFDUh+x+r2LMGBSl0MHKQwGfD6MpiYG8z/g8h7cBmkxJHcyaQCXZ0hHPl?=
 =?iso-8859-1?Q?8ilU/87rWBH/Ayq0R2yvRowNx13PuM+yKw6cxYMIZ78ZLh+xIcIrxYjPrY?=
 =?iso-8859-1?Q?LM4VKDWP6sBDqnwaXgffTLUW0Hk6HWpr63QdY5OplvNY1XAVjVtWoBlzOM?=
 =?iso-8859-1?Q?TWzOTFaMMyScVR2Jn5YoDfts/VzOPmEyQ2a4u5BPt9ghY1iHLyVVRwIzPM?=
 =?iso-8859-1?Q?sE5edZtCbvWd7TOEwGBIRdrSmhqmgwJwgnSfipbVclquLqpDp/RDm0iBp5?=
 =?iso-8859-1?Q?q8OjwRodestjB0qq11Io6ajjgiL+PQoJSNa42DyBHulQqkvRFNb/JTBJMZ?=
 =?iso-8859-1?Q?FkQD2H8odOtd/ve1D9lES73alc+8ZuJWWQTxMZFDKwZrGWO0yMsa9zIXH7?=
 =?iso-8859-1?Q?Gy40H6bOQQCA5HgOdDE7mqcxSdExB4Uq6ZLBzALPTSml5OZQstLEilo2ls?=
 =?iso-8859-1?Q?ogfjDGg/rVYzwR0NN/yUqy6QqdL170Yit/3Ap4V6GTPBzMUE33sn10EGLR?=
 =?iso-8859-1?Q?sfRERayvdfgV4kxbCJ8TsFvMKJabSOcXABJPP+Qrp9QMus9/FeRfz9e0uj?=
 =?iso-8859-1?Q?/XrXb5sa5f61x1Yww3I9i8M4t1Sj1wtjsUGPMDQeRJCAkCTrOlpYZ8Trrv?=
 =?iso-8859-1?Q?p4uC6siwij6YO9mGx1G6DuAEdVf/L7qVqq9B3myikThAw8j7Y0EmJG3qbL?=
 =?iso-8859-1?Q?m2C5SbSPcx2kVK4pgxIfWlXaSD6QFtrTfLUDlbOxosIrjmAWQSJCvPgwnA?=
 =?iso-8859-1?Q?9F6jVx7DNI21Md/FIv4XozikSCISksosobd32EhLY4qBlahCGenxpTfDEw?=
 =?iso-8859-1?Q?CyqkVDCxLIElbo98vAV+A9/I1D8HT/e4+MzSe8dDiVP8YxcGV828sfd1gh?=
 =?iso-8859-1?Q?bQtsSsJkVB2vvBag7UgZ3NYhV+msorQLzuy7qRkuzRaveK4XfIv1cKdaIW?=
 =?iso-8859-1?Q?b3gIayXEYyc2RGqU3BEGN0HVq5/CgLZe7BSKDbi111SU+TtPMBY5+veI5y?=
 =?iso-8859-1?Q?Q2sKXv2KrfEGCvRxr9pidvCWiGL2gq2gGMOhaBOz32LRuq3avwzeVn1Ruc?=
 =?iso-8859-1?Q?Wo14qZo5mQvflJh2ePovJh7sW/T1P34A3hZFX4KoZAZqAln1+7ibDcyIY7?=
 =?iso-8859-1?Q?CDyhRnOROIIzArhdABQYfg7NmtPmj/W8TGLydUZUeoDfe9IzWkuzaulHRG?=
 =?iso-8859-1?Q?TuaYAka1K/Bz6JW1P0rinKtwvxLo286+c05imB6pYi570VGzcKDp2q2P5o?=
 =?iso-8859-1?Q?6DQuaPHUmcEao5nswFMh2lObwbrv0VdPbzyLXD8bd7QJfRoD4uCXrJSdDj?=
 =?iso-8859-1?Q?7Fyhd6NFZDS/TjHUQ0SDEoCH2UjVttqxom6LJ34bVkQZvK8Ex6wPkq+w?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a23a5fe5-3dfc-442c-b3c5-08dbbabfdb7a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2023 16:28:58.9537 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9iNn7axCpT0nGQFSg3Mm3QgXZC6B/1HvaIpUh/HOFWVNbvTL3w/ROpWdQyZfjLZY10l27O2ELRg3xAKFGNelLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8666
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 0/4] Xe runtime pm refactoring
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
Cc: Jani Nikula <jani.nikula@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Sep 21, 2023 at 02:14:30PM +0300, Jouni Högander wrote:
> These patches are dropping some ifdefs added to build Xe runtime pm
> code.
> 
> v2:
>   - Remove xe_runtime_pm completely from DRM driver patch
>   - Add xe_runtime_pm struct pointer to xe_device in display fixup
>   - Add define (xe_runtime_pm -> intel_runtime_pm) instead of rename
> 
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Vinod Govindapillai <vinod.govindapillai@intel.com>

for the series:

Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>


> 
> Jouni Högander (4):
>   Revert "FIXME: drm/i915: runtime pm changes"
>   drm/i915: Remove runtime suspended boolean from intel_runtime_pm
>     struct
>   fixup! drm/xe: Introduce a new DRM driver for Intel GPUs
>   fixup! drm/xe/display: Implement display support
> 
>  .../drm/i915/display/intel_display_power.c    | 25 ++++++++++---------
>  drivers/gpu/drm/i915/i915_driver.c            |  3 ---
>  drivers/gpu/drm/i915/i915_gpu_error.c         |  2 +-
>  drivers/gpu/drm/i915/intel_runtime_pm.c       |  1 -
>  drivers/gpu/drm/i915/intel_runtime_pm.h       |  4 +--
>  .../xe/compat-i915-headers/intel_runtime_pm.h |  2 ++
>  6 files changed, 18 insertions(+), 19 deletions(-)
> 
> -- 
> 2.34.1
> 
