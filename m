Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E98A1C4332F
	for <intel-xe@archiver.kernel.org>; Tue, 14 Nov 2023 18:52:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E59010E0EC;
	Tue, 14 Nov 2023 18:52:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9289210E0EC
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Nov 2023 18:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699987975; x=1731523975;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=LV9OvMziANKu3X4ODF7zE4c20Kgo5weN1gA8JE03h8s=;
 b=SAhdYSpd1Xm02yImGohBFJFGKJSvAiaCTTM+9vyeJhj03Jmzyj5TE+iH
 QjayPE5X71V/is6LqHsn+x3lJ/lnwKhZDmRmCNR0bdaqhmFYZEpLIcxUk
 vhW6RukiA4MnoxQ0Xabh2h6zQXMdf1u8hPAIQiokODTZtzRF3rGom16S/
 OvFcPhdb85MNC+v47oB9vMDdI2n3fc53+YP8RToowVU5TiTjgktMeDPZI
 bwKAEGv9mJUjT1cjpY1x3lXH4YnQJf32eExgntuRV6e8vvRVCHLlTGXaF
 WhSinQfOXszlYk0AkBvjMxAk9sYfePBqA8bOBZpOAusWVuPXCQKrkJolo g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="370072273"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="370072273"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 10:52:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="938211597"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="938211597"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2023 10:52:44 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 10:52:44 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 10:52:43 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 14 Nov 2023 10:52:43 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 14 Nov 2023 10:52:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h7XdmHEGXMFwENKm0CTgsKMCkiG7v+xgT9G42rZmXaFvcP6GuAhrKfjPCQSCWynMxe63xW0FcZ5/MoGhSMm/TTX2xtgyCTNQmHuvKZWtRf6jNEl+HQaKtafVvFcwRJ7o9AmysyjqYBGLKr05qeGkEQgBMM3yNRrk9G/PMoMTmzYrWSrxWA9V5vt3HZD5JKoakQpQnZ/OQkqwtu6xP7pXEfIBeJ/qUaQkEwIwfg/pMtvVYAeLo6oTAcDWYhStMKjzkwhJu0JYq3T8IYcOKQbNd1EkEmjWgcSzTSof0Cb84MPI8UMlSNbrPiZ/eIvpr3ntpvSMwhsWJrBvzbG7ylkARA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cvoDGaIhrkF1U0EnsLhrAe2C0XzWgoknIX0AJxVLzU0=;
 b=Q2Em79FVFnKNITVU0x/aUXwggbI+rE0Abny046i9t18vQE0bJ1GgqPFenVBhjjczRNk/xAOCXPU/fwbweAvtEvMea0SkcAteEHO5t3klzFX0gNijiMjmG+4GXBlv80cnev2bbhZYukvLBwPe1dHR4FFM1MPyiG2K8fUIzv7pM76l1yxD5vicc6NwMDnItSf6DKZZsaEZRWc+ZAJvdkr0RiFLyB01y0pTYuS2CkItDZvzlL1TKjiwJ4lJ+46cBf+t7NvQP5+nTZ75/W9MEjkpGZ0d+pt6T6H+8ROzi8y4ZtCyZmLdHGnfCtpUyo1nNp/y9//C+r1QBhzT72qHhu9IEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA1PR11MB5803.namprd11.prod.outlook.com (2603:10b6:806:23e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Tue, 14 Nov
 2023 18:52:40 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7002.015; Tue, 14 Nov 2023
 18:52:39 +0000
Date: Tue, 14 Nov 2023 13:52:36 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Jouni =?iso-8859-1?Q?H=F6gander?= <jouni.hogander@intel.com>
Message-ID: <ZVPB9NT9cySANtdX@intel.com>
References: <20231114130443.2503708-1-jouni.hogander@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231114130443.2503708-1-jouni.hogander@intel.com>
X-ClientProxiedBy: BYAPR21CA0013.namprd21.prod.outlook.com
 (2603:10b6:a03:114::23) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA1PR11MB5803:EE_
X-MS-Office365-Filtering-Correlation-Id: f5cb20da-2a09-4c99-44df-08dbe542e02c
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7kGYDsPVrPM1kHDCPXhzCidnyxNtwSCXr6hoU+Ch590JKI/avvCGRQcpEhlv/dh+EAHeLiQI+uUtLn1WVsiRHnOnpvf+8uk097uCKMPVOQcxJo+8svljGbcyurWizh1HkZgxcmRy4gBVlNatxxP3Zr4OVZrqsBCGS2oDAw8+W+R9da9Msvd6tTOvfO8WaXrcbSAJwCbyatKvY6e9jK4oYYoyRQ/w0HS0hBYpoK2ZNsTf2Qu34X9igwEZT9tanqDT/ZErpvUZS/67INttlZrd/YgpkW7P5hvZ0dU2LPprsOV2hmQoLeVxS/+kxKFi90yNUJdrNI4f7tX4GAivjJCdPnNhOBmhYPA/jSrVHZaQMDk/RbJKGWVuVfiQUhQyUCz39M+NnPBkV1l/FOVb0ge9qUc1ixy0XZF5We/7SQd5vGOitsEE/091e+1PE04wxKRmOdfmweJowqyQSZOV6V6XNqWuxfOu6YNCNW/S1U9SH+US45Oi8yxEzbhGjyVQMVnLYNwN/iK5iXiaoKP2hCrTEN3T1U2tjn4S0bKKMnF8dIY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(136003)(346002)(39860400002)(396003)(230922051799003)(451199024)(186009)(64100799003)(1800799009)(37006003)(6666004)(6512007)(6486002)(478600001)(2616005)(966005)(6506007)(38100700002)(36756003)(86362001)(83380400001)(82960400001)(66476007)(66946007)(5660300002)(2906002)(66556008)(44832011)(316002)(107886003)(41300700001)(6636002)(26005)(8676002)(8936002)(4326008)(66574015)(6862004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?6EiEmA7BMxjQ7xebsKc8qNzkhAFG5k8+jpccYysZuFlu512IXtdh2UXRIE?=
 =?iso-8859-1?Q?wn+t2um+h3d3Y5M61DW2S1cusxNftKE/j9Ktx4qcYtYNulVKcdZdHDukFz?=
 =?iso-8859-1?Q?TwlzHQw973lMzWFDbe+POHGsfD/CK2SVfy+U37jBwFdq1/4eChtIU47Ddf?=
 =?iso-8859-1?Q?qpy85sFZGsru063eFxFgytVGtHsU6Pvbai6mwssqCInXeO4HaYR6z+ipj2?=
 =?iso-8859-1?Q?SZl7/qNZllAS0UhYNtqeKOO169/m6d8E5DCGr4eqmTjlVpn03PKUL6M4+Q?=
 =?iso-8859-1?Q?YH8yn/STYaSt4jvzPkAhUm8z4xuB+hKW/YZ47dIcjIada1IsD9ZL6YUIW/?=
 =?iso-8859-1?Q?gRcLHJ4KBXBCceT37+BTxKW/l8M7ESeVUu4+8tPQ1v4Kt+VWj59TotuTv7?=
 =?iso-8859-1?Q?yOv55jOE4GT2fKygOzQ4O4eLc5zDoHS6GKV5IgvTfuih/2BJJV9DwGQy5r?=
 =?iso-8859-1?Q?hP3Yo9E9AGI5qWPEHX5HAklPNVDVP3MM1fId2Np8Igi/9X43ofZoHFAQC/?=
 =?iso-8859-1?Q?WajG/f5f1Ooo11le8J/qFvawQVWOqcBtQan1caPqUf9PeRVqDA55SIgjRX?=
 =?iso-8859-1?Q?/q+EMHuBlcnZ3SM8E5nl5sBS4MpBLPGTFMKOQ2XBIuFqeuJIR86bwmId+d?=
 =?iso-8859-1?Q?9TzUxisNzw2APTBehXQgFwWbDdcm6nMJyX/IpxLAyT6ipWIE/dz8CzjPmX?=
 =?iso-8859-1?Q?qbYSliPu9oDmp0AnPxvByeh7pyi2Qp7MVoo8xcQI1AXVuBmBRPblV4QzGr?=
 =?iso-8859-1?Q?WlWf6v7G1+Juw7tyb8MNnKBJdU001Q0sMT0mdUZVsrZx8pJhdCesLP6hyk?=
 =?iso-8859-1?Q?yX7K/3RxWQBeoIskJ0ypPMK34c7aqX8/CGYxlAI9BJCCGbiAWH/7WiaVwp?=
 =?iso-8859-1?Q?18lKheNcA3llYGszoRLNiVRxKFZAg3yuBBrzxqy152nvxTm0gAJMo18DVO?=
 =?iso-8859-1?Q?0QvctpZ21+GFJvjd3zMpqpXLflJdBagH7/W4UuFuTUCG7wG4Cz1zdwNXPD?=
 =?iso-8859-1?Q?OvCEDZ2kYFbjPMIIkJsCEjP9ZdMBxB+x/TxLkECRwPVOq9pRNPlfG0k19/?=
 =?iso-8859-1?Q?FNaqOS/xgdLnV30eMlWCiSEVkoJgqKQRYd6Kppmgy/jt4xjLVePdmwK1bi?=
 =?iso-8859-1?Q?5kzVE1qqn6tVDkz1oGxuzoqQwi0LIUuu27xtn2IBx4f9i1wNAOaSK1Eyuk?=
 =?iso-8859-1?Q?RnQs3zC8n4L5wd9Lc4IXdZymOCTrNC4tShDFqsKGWFRLQH+mEEBSBLb1zN?=
 =?iso-8859-1?Q?ay3ZlftYQ9nPRh1VcvkUli8OwVAMQDcJZ1Xo5X8jIn7XmFoi0ntNDM40kP?=
 =?iso-8859-1?Q?zTy5imP9hwhSttpfaRySeywwFJZPDBFGymAen2wG8DxcjsnhhGhF/Su5Hi?=
 =?iso-8859-1?Q?64ypk+I7CpUzAwYJjZYj0l7vlrUfJFfwwBQpM6gnvzBI2sfW2jGov/eH/i?=
 =?iso-8859-1?Q?VZNOncAgG0RsIdHbTQ57BFAh/n/DnY+FXn6+B4PtNtQPF0zY+6q0hl3k49?=
 =?iso-8859-1?Q?KR9BU9W3Ywkj1/lcdIy7ifZLr1JLiRKR2XUt8j+CZtgG9fgAstoI0Ozdbm?=
 =?iso-8859-1?Q?YZdb1CF92L9VvdweEC+37OSS4evTZgveDruUNRuo4phaLmCnfZPNokDiGd?=
 =?iso-8859-1?Q?O9vdXU0TIwF/zKixY8cs+tfCNLqL2b4Yib?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f5cb20da-2a09-4c99-44df-08dbe542e02c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 18:52:39.7516 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f8WcympZwzvi35X9+QJtqOFhXjm+dbdlqlpS0eRhx7UfXKLiTVDN4NVQXqA4Ac+FYoYQY3EBs4KhO9BoQpXzuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5803
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 0/9] Intel_fbdev.c refactoring
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

On Tue, Nov 14, 2023 at 03:04:34PM +0200, Jouni Högander wrote:
> This patch set is removing all the ifdefs from intel_fbdev.c. This is
> done by splitting i915 specific code into it's own source file and
> similar source file is created for Xe for Xe specific code.
> 
> Remaining ifdefs are dropped by adding some compatibility headers.
> 
> Some of the patches are similar as in set from Maarten Lankhorst
> <maarten.lankhorst@linux.intel.com>:
> 
> https://patchwork.freedesktop.org/series/126200/
> 
> Patches 3 and 9 are supposed to be sent to
> intel-gfx@lists.freedesktop.org. Let's first agree if this is
> acceptable solution from Xe point of view.
> 
> v2: Add missing forward declarations into intel_fbdev_fb.h
> 
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
for the series.

We can push the i915 here as well and after landing in drm-intel-next
we can replace them by the proper cherry-pick -x

> 
> Jouni Högander (9):
>   Revert "FIXME: drm/i915/display: Allow fbdev to allocate stolen
>     memory"
>   fixup! FIXME: drm/i915/display: Remaining changes to make xe compile
>   drm/i915/display: split i915 specific code from intel_fbdev
>   fixup! drm/xe/display: Implement display support
>   fixup! drm/xe/display: Implement display support
>   fixup! drm/xe/display: Implement display support
>   fixup! drm/xe/display: Implement display support
>   fixup! drm/xe/display: Implement display support
>   drm/i915/display: use intel_bo_to_drm_bo in intel_fbdev
> 
>  drivers/gpu/drm/i915/Makefile                 |   3 +-
>  drivers/gpu/drm/i915/display/intel_fbdev.c    | 203 +-----------------
>  drivers/gpu/drm/i915/display/intel_fbdev_fb.c | 116 ++++++++++
>  drivers/gpu/drm/i915/display/intel_fbdev_fb.h |  21 ++
>  drivers/gpu/drm/xe/Makefile                   |   1 +
>  .../compat-i915-headers/gem/i915_gem_mman.h   |  17 ++
>  .../compat-i915-headers/gem/i915_gem_object.h |  11 +
>  .../gem/i915_gem_object_frontbuffer.h         |   4 +-
>  .../gpu/drm/xe/compat-i915-headers/i915_drv.h |   2 +
>  .../xe/compat-i915-headers/i915_gem_stolen.h  |   4 +-
>  .../gpu/drm/xe/compat-i915-headers/i915_vma.h |   6 +
>  drivers/gpu/drm/xe/display/intel_fbdev_fb.c   | 101 +++++++++
>  drivers/gpu/drm/xe/display/intel_fbdev_fb.h   |  21 ++
>  13 files changed, 312 insertions(+), 198 deletions(-)
>  create mode 100644 drivers/gpu/drm/i915/display/intel_fbdev_fb.c
>  create mode 100644 drivers/gpu/drm/i915/display/intel_fbdev_fb.h
>  create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_mman.h
>  create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h
>  create mode 100644 drivers/gpu/drm/xe/display/intel_fbdev_fb.c
>  create mode 100644 drivers/gpu/drm/xe/display/intel_fbdev_fb.h
> 
> -- 
> 2.34.1
> 
