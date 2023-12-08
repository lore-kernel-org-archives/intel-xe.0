Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10D4EC4167B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 16:49:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D097A10EAC9;
	Fri,  8 Dec 2023 16:49:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AE7810EAC9
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Dec 2023 16:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702054162; x=1733590162;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=14LAJ6uSRoyrgYDy05WKIeenjLMqXmCJMFrFbbuMhJQ=;
 b=Cw8DeDno+hdtq5V8fhRoisuE5/+ykY6hOao2fkaeO3+XK+hYueaFPfN5
 +XKSDzkMF2Uux/4Ac0JtklYyrRTe5U5ockZkntfpd+Zj2DdL9Nlq2AyBm
 aCpAhpJv0Qx79YW/mC9+8Q1U82QjlqpEBlBsesqFNi4ZvQxxsYoe0fydF
 H0JijLQpUGmTO6cFpKIWaW44hwkIF26OciqfX9w2VztecrWrwExUHuSSd
 dyCNFqYgMkmSVkzWUjwLiXUycD9Wnw9oMNl4YXZWBmjW6INImeaVymbs5
 WCz8pfy6LA/1HokNAuSqSNl3JVBhh/8TotasJ6teHZnfUmvCWpfDDzkYM Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="374590810"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; d="scan'208";a="374590810"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2023 08:49:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="748397458"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; d="scan'208";a="748397458"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Dec 2023 08:49:21 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 8 Dec 2023 08:49:21 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 8 Dec 2023 08:49:20 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 8 Dec 2023 08:49:20 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 8 Dec 2023 08:49:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nehnb2VV1/Tq2v0zMe1o+wm7dWfEHG1FQCTLLltHZUiTWJc2B8xljXHzPIlKlx9fzkWSt+ObC/+fUcpdv444NKwFQcBn2DZLYn1vv5b0w6I96iP8USmTUQLL00jIwJFlRUJgaAuq24tjfilCn1d7Hl+HIztOsfBVfKtnc5sfMUY0J4sfuOw5PW4CEiHx728akD1edWH5RC5OJ2V2Xq8QcVptxf4Oj0xiSC1cT6MK7FlrndZClKjS8zQleE9Tf+j0Ui0uMNtuUWqkhtzB5UnqZnzxpyOTOypHDLhvx9VbkwYhmcU7vxlDzmQOjnymyuI8tKfmVqvoFnPV+Ned7eTlUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6YpCExdAx4aJ1kdCi3LkEvQqZh+072HxLJNGPnCD6a0=;
 b=fBFzQh7NaeLiQ+jfHqtFsHCDAT1NaVMYy+sMBH5U1ieXPC1Ek5F+ZcjkXfS6aLUzH8cleKcGpIzgQ7FKGdc5vfeslk2DinbqMPxMN5od9cylEFUeaDUclJW6JPGO43ez2I2uImNLcHMy+jTZhkLWYWFOcu5OyWLYrdfapiqEttXbWwbNLC/jBGxqSUJlUlDm4GB4DQpf0H6t0dSL0/XZOWe+JOproHQdf0+uh5MPW4z2+ty70Jd6JAMhK8UsqNl6hPKlxx6BEkXxGMGo3KMiT3WShlsI9XNXu886Gu1sI1j5ahzZg0/6IZYtfKEs7ISn6TpC0BBpdZEYV7TQ5Fqf6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CY8PR11MB7922.namprd11.prod.outlook.com (2603:10b6:930:7b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.28; Fri, 8 Dec
 2023 16:49:11 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7068.027; Fri, 8 Dec 2023
 16:49:11 +0000
Date: Fri, 8 Dec 2023 11:49:07 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Jouni =?iso-8859-1?Q?H=F6gander?= <jouni.hogander@intel.com>
Subject: Re: [PATCH v3 0/9] Handle remaining ifdefs in hack patch
Message-ID: <ZXNJAyY6YGoYaE78@intel.com>
References: <20231208075610.3005795-1-jouni.hogander@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231208075610.3005795-1-jouni.hogander@intel.com>
X-ClientProxiedBy: CY8PR10CA0008.namprd10.prod.outlook.com
 (2603:10b6:930:4f::17) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CY8PR11MB7922:EE_
X-MS-Office365-Filtering-Correlation-Id: efc2c5a7-4175-4e47-fe8f-08dbf80d9a73
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fGNdWrCzUa4yHQx917g+V3Yi9QiE20QBSELF6Bnzy8rrGXvokPDdEO2ljgDCxrU/Jo01vXEup52IEIlkeHuh3QqhSMfhJax4yGWpVODCl122inHyE75JL2IOgT4tYiGNypZr2VDTXlZnqPW0a6CHWOfbcdywxQKqJyRPjO5p9gV1l9a0bd0fgEyXNZ6ekI3G9fLr4/wPLyR+dwICWKMaDp/nk2ZhQAoswC3JD27S58HNr/R+3F1mdGMZTZ6iDfITXTEtTw+PRFawGIoJirzZ/jSyuLggHBHshbNsbBRSbWuMPlu3GQIyD8etx5MzRBoYbAGqMqU4iEsUbyxcZ5VHDhzhf/Ys8+NH+ovnH2oBlOgxpSJVL/23kN6zdg6NDQKh6ffegs9q6T8CnEEj0OL9/aL7vBC4popQqEWbCdjZGTxwKLmDkOYJIieojbK0/DFEXfihX1QJ05Q1OGPuQTCeIxvXJVj7cC+jdBByRIkW55UM8DW7HBPvYidHTB3YxwR2Ogsy/WuqMdkfLXFb/ncYq3mRC/5j6bvNWl1IdLRth7k2CQnY8t/bvIpgHM9/cBZ8HAAISutSxFhjwtUqmzKiPw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(39860400002)(346002)(376002)(136003)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(5660300002)(2906002)(6862004)(4326008)(8936002)(8676002)(36756003)(86362001)(44832011)(41300700001)(82960400001)(66574015)(83380400001)(107886003)(2616005)(26005)(6512007)(66946007)(6636002)(66476007)(66556008)(316002)(37006003)(38100700002)(6666004)(6506007)(966005)(6486002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?htI6PuXJIOqfm0wvWZ3yyq41AcLJbGLlXGCiRV+v76HyN/PRrBDMAAU/5M?=
 =?iso-8859-1?Q?UEuS/3ju0PS9qj9HUO3vM8YDoeF40c1i1FTVCmLZne6vMMOTCtcYRG3MHk?=
 =?iso-8859-1?Q?/aGiskcLPQDMhVwSVSK715blnmRQkJBgoxBN9iqRJFYhNAgwQxD94uS3xM?=
 =?iso-8859-1?Q?Mf6c0lEbyqmvrtnqacIXbFfYzVxTWI9hYpTUHduogD1lJejEayTEx1R1JO?=
 =?iso-8859-1?Q?UFVOMQaL+R50OZ4S9GHWaQcnhlwTr4452zj4So+8NtsbCXpBETM0D5jo5g?=
 =?iso-8859-1?Q?484aiqEok8oH8+aeYoQBaLZhUKw9e3TKTVWvhF8+mLptE0g2mamFZzQPOl?=
 =?iso-8859-1?Q?rY1RM3gvOQnW62gXziBqYCTu0t7fck12ovnshNk9TwKMUgkSsweF8atz1H?=
 =?iso-8859-1?Q?z5JiGudyyUkC7aG/KmZ/6Z5bENwXYH63IRKKEcWvI1742avw2K86q6XGE1?=
 =?iso-8859-1?Q?I+Zypxt4rsVlfAw5x0L4dnYWn0kJMz6B4+jHvyTDwrnP9S0brPPoPB+loN?=
 =?iso-8859-1?Q?r7d6MUfCW+Cmsua6wD5D9pKIHa3p0/0jVtGbfSf04a+3qhFmShLYIBg3bV?=
 =?iso-8859-1?Q?akPbsven5RuIV80cfuxOVXixOYLA6iACdbZQm0uYsVcKF8FiCEtx6tPrdM?=
 =?iso-8859-1?Q?HqrAgCSzErR6D5sWg9WMWzGcSr9ueZzFf3l37Hgm9X3VM7jgGKwd+yK8sZ?=
 =?iso-8859-1?Q?nf8nvYfg/wDhq1TkXSUhtJaCGeyOOV8BziSjAez8oGgfKfOzZ6ihio+2NH?=
 =?iso-8859-1?Q?TEUV5PGb+PFlpDX12JQlTm50VjFQVeCnWr86KrJZ4x8KtpCilam0CI4JLY?=
 =?iso-8859-1?Q?Bi4+U8Wi6Z7oeI//iWsEVkNRQflJpJAsGi++I1RrI7ed6Q7X2+DI/vUhmA?=
 =?iso-8859-1?Q?YiFt5btG+K3cagFmscLJlhv2Bl/VUU1ljbZKGLhlV2FrFpX/N7sDs4xcQi?=
 =?iso-8859-1?Q?PxBRdHoqbhLICbCSuNrVVTUQIrIaoCiiyQaiY+4B2P/SjD4GudC0NBOlKS?=
 =?iso-8859-1?Q?UjzcMtghW1Q6ehTT0drYI1CG0ftCDEvzzsrz1spUWiUawITzZfcKcC3NL0?=
 =?iso-8859-1?Q?nIWD12PT0AqaoLwLWERDtQTmMiXK2IpHEsIODqo3iH4Q1Xm4JO+HdWW2eG?=
 =?iso-8859-1?Q?H4N5Rtb0G5lsrQCxvMwvmvLeYmnDzQKhnQMYpQbhPkZVfCjDqGXC3TYHim?=
 =?iso-8859-1?Q?uCqCTCiigZov8PpqpLjmSQGROLuntVVI6b77xDb1HNpVAFijECOI0gCxQJ?=
 =?iso-8859-1?Q?YNw3STT9WmULcvKOOLTIm0Gu8/o+F7V7L/jaqq0jdjAZ60mhrHgyjOAx6S?=
 =?iso-8859-1?Q?+XlBn38vU9DdJoAQtkaUOqzyVP+XBprn/vQpQQhKeaXDj88yUphMEbhyv+?=
 =?iso-8859-1?Q?5pwVxCL4XCB+Go/3v0OyUs9RmwzCP85anQjP6u10B62AsgRPt8K+hM1qKS?=
 =?iso-8859-1?Q?R0vtj348WiUU8UXEEa/uXPdG1aylKaBnwMIAgqGzodHmgdFjxuUS9PNeze?=
 =?iso-8859-1?Q?qwrGq1X43XXqlL69dgmo2ItCKGV6Elssal7Mnoyo6EViWGlBRhskhvLSkL?=
 =?iso-8859-1?Q?hysS69MjTH+mUVkYDy1xqJQ/CLENbeDEPv6CEpWjKHxdA/N8Wolmq8JfFt?=
 =?iso-8859-1?Q?Eep+tPos1jRZhDNchx2/i30wpk03c+qgg0?=
X-MS-Exchange-CrossTenant-Network-Message-Id: efc2c5a7-4175-4e47-fe8f-08dbf80d9a73
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 16:49:11.5080 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4kEli/uVd97yh1tbuWxZfhmf3tpUzCgkwmKJY4/S5UPAD3XLIUzqREcDQQK96HXvWxSiRsn5GiCIWs38f7T3nQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7922
X-OriginatorOrg: intel.com
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

On Fri, Dec 08, 2023 at 09:56:01AM +0200, Jouni Högander wrote:
> This is removing rest of the ifdefs added by hack patch
> "drm/i915/display: Remaining changes to make xe compile" after
> intel_fb.c refactoring set is merged (still under work):
> 
> https://patchwork.freedesktop.org/series/126505/
> 
> Many patches are identical with earlier set from Maarten Lankhorst
> <maarten.lankhorst@linux.intel.com>. They are just a reordered and
> split a bit more to make more clear what is changed and why:
> 
> https://patchwork.freedesktop.org/series/125685/

Pushed, now I"m going to take care of the clean-up rebase

> 
> Patch 2. is a backport from i915 driver tree.
> 
> v3: Rebase
> v2: Patch 2. backported
> 
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Uma Shankar <uma.shankar@intel.com>
> 
> Jouni Högander (8):
>   fixup! FIXME: drm/i915/display: Remaining changes to make xe compile
>   fixup! drm/xe/display: Implement display support
>   fixup! drm/xe/display: Implement display support
>   fixup! drm/xe/display: Implement display support
>   fixup! FIXME: drm/i915/display: Remaining changes to make xe compile
>   fixup! FIXME: drm/i915/display: Remaining changes to make xe compile
>   fixup! drm/xe/display: Implement display support
>   fixup! FIXME: drm/i915/display: Remaining changes to make xe compile
> 
> Maarten Lankhorst (1):
>   drm/i915/display: Use i915_gem_object_get_dma_address to get dma
>     address
> 
>  drivers/gpu/drm/i915/display/intel_cursor.c   | 12 +++---
>  drivers/gpu/drm/i915/display/intel_display.c  | 35 -----------------
>  .../drm/i915/display/intel_display_types.h    |  4 --
>  .../drm/i915/display/skl_universal_plane.c    |  4 --
>  .../compat-i915-headers/gem/i915_gem_lmem.h   |  1 +
>  .../compat-i915-headers/gem/i915_gem_object.h | 38 +++++++++++++++++++
>  .../gpu/drm/xe/compat-i915-headers/i915_vma.h |  6 +++
>  7 files changed, 51 insertions(+), 49 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_lmem.h
> 
> -- 
> 2.34.1
> 
