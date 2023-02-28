Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 211F7C64EC7
	for <intel-xe@archiver.kernel.org>; Tue, 28 Feb 2023 18:55:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDE0510E00E;
	Tue, 28 Feb 2023 18:55:06 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99BAC10E00E
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Feb 2023 18:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677610504; x=1709146504;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=zXV1DC+hSI5sJu87rnGFLI06IxANVWBcRb2kBk5b7aQ=;
 b=Oo3LS/YiNxOnXWnylFs+AgLFxpYYwNCp0fOV+5LXlb5KfHbMvsWcgNq9
 C4317/a3f9GSv+CsifrBOtoSUcHchtAdyqbOICm6XYYNx19fMe75SVp5A
 vBbY1+123imiMao9erBjja/NOpzdHqT2grOKAEYy5mSKzz1U7wUkgGAb1
 YC6zaOX4ErCMAV8LlMo8fS+x0Q6UDknUMwPQUNHyFpVYxVq3rpOf0zX7c
 I+KzMqF7haO8UrEBYaQoEVpJrvr0CLktzdmR4rMQQ8KOryMUHY7Yj+iaQ
 v/gXE8D+JoZGXFh4doBN3eKBm6N+Kl1DhaFllCCKffWQ2GDCk+XP3eoY6 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="336513289"
X-IronPort-AV: E=Sophos;i="5.98,222,1673942400"; d="scan'208";a="336513289"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2023 10:54:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="738291052"
X-IronPort-AV: E=Sophos;i="5.98,222,1673942400"; d="scan'208";a="738291052"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga008.fm.intel.com with ESMTP; 28 Feb 2023 10:54:49 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 28 Feb 2023 10:54:49 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 28 Feb 2023 10:54:48 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 28 Feb 2023 10:54:48 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.104)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 28 Feb 2023 10:54:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rkeyn7WXZok6gIEFPWZ9NZUdiohIvh892jKPTJ4+Ei47nl9b/F9ZGDSSHL3YEA51U1sTsfxKm6KsAdxMlq3ZiudN0jteWgwp8ldmgigDFN6dkYQ2Tx4oyA/JW9XZNhXo9d18bgXU1LDOc1CHk9Ua8WxqEDXl11FVKGbTvtu0Kr/OQSCdiQP5AoilUAy/qnQSbikUVsGw9iHT1Hsd69gZapXO51EHqCPzDo9w++yvBn/lJX7vLJfXwymKBghh2yQAsiZLfHoxk5MBjvJOgAGuxRHgdRSUsbis9J5fQvoIh0o3MGx4/jKMmKtjh293+S+l0pQ9AGXWqaFhSEzG7xo/3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zRFL57NKQhik9b0Rbpwwh90P8O8oyYpHhZ23l8empfQ=;
 b=LObfHjingokEIrBUZJjNQ/K9LhF28O7zdqP5YuqMY0monOI2W66iEzpTv0mykBX9nW2Bl3f5DOqCqmvBrY+sQemQR56vLAHzQMFuYv8BlM3DhtSrII6vhK6B+FR/zqNXWv7+BtKE8XjZJtig5kua/AnjB1KiXG1pIsFPkivJTOkwZey35uosooop8O8WBSsejEhSsGuq67VWYcsxpQA85owvGWYcv1oNUGFQTgyjoHo9lsRM+8l5mTLD7i5TvBNtdC7k6LEvCqFa13gcLWSgnHcZvOjZ/yAJEIaR5FMKEz1px4DPvUEpRVDhCvBE5AKoZvoDU4nk2Sr8qBwHPorDeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB6056.namprd11.prod.outlook.com (2603:10b6:510:1d4::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.29; Tue, 28 Feb
 2023 18:54:46 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8%6]) with mapi id 15.20.6134.030; Tue, 28 Feb 2023
 18:54:46 +0000
Date: Tue, 28 Feb 2023 10:54:43 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <20230228185443.vbbtlylj3oam7c6u@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20230228104137.80965-1-matthew.auld@intel.com>
 <20230228104137.80965-2-matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230228104137.80965-2-matthew.auld@intel.com>
X-ClientProxiedBy: BYAPR05CA0058.namprd05.prod.outlook.com
 (2603:10b6:a03:74::35) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB6056:EE_
X-MS-Office365-Filtering-Correlation-Id: 62b5eb07-3c64-4fe1-eab7-08db19bd42db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pcTqHekyzq8s3FnMJ63NInyRh8aSLHwG9dv+fVX88ZiSi8Xdxi3pgkwJIX4sbA+puxuQ1eplH3YGVa1pWWpPdz74yZZ5ZB6N58ejvkiSzZ4i6JdmS9X+jii3g+Pg1+3DcoowOvjLC1QM7LS40nSnhRxpKenNbRnQsL64pMGY7Pj/hC7C1k+UejpkZ+JDuV6Y1D50PQfoQoD+rQCiWZlpH0NPQceVnSRLBEi3yb9OSj5YwsICrnR5SZPrR8F7vu9cSQ59wyMmo7ph9Vnk+LdG6ReqHQXrnpTp3QmOTkAuRzhaNM9D587fzJwZRS1DSdvuPHrKJuwBUwVt0RbjZHO5Vtrt9jusuP2zbGelzBUlYjuPsJacCN5Bqh7oMYhJwXskBPMC6AZsM+UJa35S5aYLBmufiJmG5wxYwY9Jw2+d1wCKJ/oCF0I9M/xVQLSsQh1vbSIihx6mQGGTXPmGz49qV+6h+g1S7zF4ynlg9sh0VwtAid5HLRhiAGHm26vSgHuH2SXwCX3QqLRS3LwHrVJiHZXQ6SfjxITelimc5aR+4vCOlSHMl7RNJOLFtn3308/XILuoVsVgS0Fj1i/OoZGLecZSf2yZro7nIJPgmomGgws=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(346002)(136003)(39860400002)(376002)(396003)(451199018)(83380400001)(6636002)(316002)(36756003)(4326008)(82960400001)(38100700002)(8676002)(6506007)(186003)(26005)(9686003)(1076003)(966005)(6486002)(6666004)(66476007)(8936002)(66556008)(66946007)(2906002)(86362001)(6512007)(41300700001)(6862004)(478600001)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?64MRftjd3DASNp+sxhvfVGMRqboB4AfPrPVW1NhRhr+ExwCqfafWgKIed+pe?=
 =?us-ascii?Q?KNF6YtkaGVJPApAbaOlDEe1cQadxQQvlD8DuwUfZam09BzYkMdVUF83BZzAx?=
 =?us-ascii?Q?0E3CRvYtOuqZB9RQS21x2P9mx9b+HFKHMEG8K2mQcFqUc3X/NLfc82YamqdD?=
 =?us-ascii?Q?D+Vzyp2R8isYgpVXYiSJJMn462h2+D6T1KivPEJP/pYyURbFF0fXGWcp8I5J?=
 =?us-ascii?Q?qVTFRNQs/GYeVIAdoB8+dewIlpBczriVBE8kmwCTZ1390jbiV0UDvyPWvFps?=
 =?us-ascii?Q?gfObvC2dbZmk4oHcnzOhY/y6uJnUcl2vNLme2I+OmaoAvbJoNSzDcWq8RLQs?=
 =?us-ascii?Q?3mHlPNpvGXuSuQC2OboRvmX9H4B06Eus0fN1ukF3CmQ8mOen2Gf67rWR4eFY?=
 =?us-ascii?Q?QGfFSwZ9+893UcoFgX7ovhHsnF6fAqwWCxXqHkbZEc3L8xPgHFMA4sn2retp?=
 =?us-ascii?Q?0OGV0MgKO/+el8fpiortw/mmwwOJesuIap+hO0u+V77SuJAdaU23Eic8tMNZ?=
 =?us-ascii?Q?9nivqh9U6v8NPJb55PBl5Toww/d4jcNAOnMtOK1fApucLIAjmGZf/3nQsBCe?=
 =?us-ascii?Q?uu9TInTM8at8P7aZJs+tgkx/QksbsJWFW/G8N65CXnMPUHRJTWUZZEXIk1aJ?=
 =?us-ascii?Q?8BSAurKJcWz0A+yCgoTI9+8ZGIqd11ztkhRGPGz5jTskWWtlJGqtKejHoa+3?=
 =?us-ascii?Q?mWTA432hdxWDI22TfOpzYEguWjG63jK0t2sX5Pk74OPgCImkBqKYFFrroxcc?=
 =?us-ascii?Q?AYBjQr6uICwMIoIjBRaKzsVXmU6YwhBbamQF2jLL9z6MWyld/2nV5Dt11/bo?=
 =?us-ascii?Q?Hbcj8s/A5fb+kVsbN6IgqWFUPT7pO1UfTZTQZ3RB/Ml1pzO1ohMo7yvCYL1D?=
 =?us-ascii?Q?c67fe+QSyyOMIrUAQn25//BHQBY3Y6/JZxFKeU+/c/+22ZFDzo5QKfHoNAvJ?=
 =?us-ascii?Q?fN9Sp+gathfkqxCS6hpYgnDrGNowGw590pmJ5rys7WeQrHic/YPeEwN6Bk7f?=
 =?us-ascii?Q?4QHH3auR/+CnRYwyygeH676n+mxibpPR6JNKogBfnvCfLPgssT3SEJJ5NUs1?=
 =?us-ascii?Q?vNlsF6XgCBGKDpr8OHhL3v58JNM7ErJLZpu+NeizSjllR+BTU2GAy+BhCtoK?=
 =?us-ascii?Q?U5vl8ZoIyCKP1ebHTTmZa/UocyLLdyVYqzChLt7HntVY1ldk/1HKOfKQgz4h?=
 =?us-ascii?Q?VpOel3FdHCtWb4+XiVet6n2vXjisoSYIQOyQaqs5Aanh+lih4l8IVpx9UsBp?=
 =?us-ascii?Q?g8Ng2xd3uEmYVepDME9ljlRnTEZZ/nnVJkgZkS8Nj6FBu1wbRMH0bjBEsRYF?=
 =?us-ascii?Q?2bZpW5XyCwHRQzMrRbIiW+kVVo8K7623w93IVQHXcDPcnH4m5EDlFwP44QQe?=
 =?us-ascii?Q?EVbgxKoW4fA+ajkDwn4tHL96RFlMi1RlnSFwlqrYGIW1E7M5V89GohKNS49O?=
 =?us-ascii?Q?y2IZWLx/XoIQ+P59Wz3V3XrO0mjNkYcihdaLHaVTwvlGRa9+E9o6l047/Pq3?=
 =?us-ascii?Q?su646WWIVucHS/33ahpjMpqLg1knFfblKYMvJOyN+a7jhEtn41iRHJ3UreuH?=
 =?us-ascii?Q?XznDFZEXF/gZrC43sY739Kuij0u4wYBf1Tfmif1dtoCuXLV7Qcl5Qw+6O0dC?=
 =?us-ascii?Q?MA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 62b5eb07-3c64-4fe1-eab7-08db19bd42db
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2023 18:54:46.6466 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eUNi6LtMHVR5++jUILJBsALdrugOahHx2jM2yD7U+/th0R7sUOZYjGVVy+vvBvqc3hviJcQAfAQSkX+2S2fKpcCX6VwTcBUUwbUOa4buogU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6056
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 01/14] drm/xe/display: fix IS_ALDERLAKE_P()
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

On Tue, Feb 28, 2023 at 10:41:24AM +0000, Matthew Auld wrote:
>On ADL-P we currently trigger:
>
>xe 0000:00:02.0: drm_WARN_ON(!((dev_priv)->info.platform == XE_ALDERLAKE_S) && !(dev_priv && 0))
>WARNING: CPU: 3 PID: 338 at drivers/gpu/drm/xe/display/ext/intel_pch.c:32 intel_pch_type+0xce/0x2f0 [xe]
>

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/231

or maybe just "References" ?


>Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>


Lucas De Marchi

>---
> drivers/gpu/drm/xe/display/i915_drv.h | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/display/i915_drv.h b/drivers/gpu/drm/xe/display/i915_drv.h
>index da83a957dd86..06348cb03f44 100644
>--- a/drivers/gpu/drm/xe/display/i915_drv.h
>+++ b/drivers/gpu/drm/xe/display/i915_drv.h
>@@ -73,7 +73,7 @@ static inline struct drm_i915_private *kdev_to_i915(struct device *kdev)
> #define IS_ROCKETLAKE(dev_priv)	(dev_priv && 0)
> #define IS_DG1(dev_priv)        IS_PLATFORM(dev_priv, XE_DG1)
> #define IS_ALDERLAKE_S(dev_priv) IS_PLATFORM(dev_priv, XE_ALDERLAKE_S)
>-#define IS_ALDERLAKE_P(dev_priv) (dev_priv && 0)
>+#define IS_ALDERLAKE_P(dev_priv) IS_PLATFORM(dev_priv, XE_ALDERLAKE_P)
> #define IS_XEHPSDV(dev_priv) (dev_priv && 0)
> #define IS_DG2(dev_priv)	IS_PLATFORM(dev_priv, XE_DG2)
> #define IS_PONTEVECCHIO(dev_priv) IS_PLATFORM(dev_priv, XE_PVC)
>-- 
>2.39.2
>
