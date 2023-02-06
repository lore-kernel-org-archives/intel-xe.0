Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3388C05027
	for <intel-xe@archiver.kernel.org>; Mon,  6 Feb 2023 22:35:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD5AF10E448;
	Mon,  6 Feb 2023 22:35:28 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7E2E10E448
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Feb 2023 22:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675722926; x=1707258926;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=dJJsYccvY+ZaiXPJNRe+vSLFlLDj2uC5Vy/2nncKTdg=;
 b=cmG1loTHrIbq8jwqGPo0vNp2+ov6cT18JlhszRgmJVlfx4CKcw9rbCFO
 A3IaQSuP1Y125FZKA53QOWSm1hXiPUfj5mDyDZmwTbsmCWL4RtA2dlSr/
 HsUzgK7i4xFhNPmgSxXxLDSVIuNfg4Jk0MoPv/VRFBQ4MSshvK6aob3Zs
 o6rmzkk3Ahg2yE7TFlaCNUAtSEpvJ3DkpXJnQAoBn7Eeo7emN1l7dzSkO
 Jx7YUsIrWFHENZ4kzq7MFWVKJSxBKlkhOAWDyW5E8WhMtGu8+H1P6GkWx
 udCAFtlyo6/u1voH1iZpV0SR4dufDHuuw8WWb5WPGViDZl1e22S9zS1P/ g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="329347950"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; d="scan'208";a="329347950"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2023 14:35:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="644215699"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; d="scan'208";a="644215699"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga006.jf.intel.com with ESMTP; 06 Feb 2023 14:35:12 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 6 Feb 2023 14:35:11 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 6 Feb 2023 14:35:11 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.103)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 6 Feb 2023 14:35:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JkgH4b5Xay7ivOTgWGHgdpA1mon8OPMO0TcI3nJiXIgDjjaxRLjYCzssntmFaC4hPGGuRr485se1m27TuwxUngbGd4dyeKB67Haj2Ep2yD+yd3XQiKlnU3q9ZjGDEj1NrdihJBXqTRrNkHaIu10GUOrcy+pY/wIozeohr4uiStWVjg/yRA8QGTCn1tvMFAIjZ6/EE+nTm4KxEYk/agHtD8T27ikpDnfXKYwnI8RCP1NdxW1LKoE9iE4r8jSwbMkM1BW6XhlXhkKZTlTtAxI3OhWk81YdL+fSwIgsHz1a3YMMJh+OOt54ygH4S9ZJsggzQsyhKGSrm8/w+YUFRTJucw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mZ/ZAsLfw6JYyaw3q86E+wAHT4z9P95KW65LL+UlVd8=;
 b=NEaAyQRX7aDu7Lz9zs7OEZJG67kfIWNrDAW9M1zCQgTTGrfQK/LdhYGK4Us5k4jskRGpDu2DjRdnCRXcdmCxVRyPYQtWqKLeFYj6DrbGdErjKqIo0hys/iSO92BByqbC8DT6Da4UHo87k6Bo7XA2OzVl0F5BzUABz7tsiHbktrYIvY2tnnxU7U/MAVXDH+tLSED7dK7sjE6KMXRzs2k4QmcdN++vpffZ2bPyI0ZMsEkqH5lPM1r5J1FZ0YEEELLb/xCQ1kb5tUZUIG34+O8FAaDS219qFnOoLlenc4I32RebpKRZBDwU0Wmpql0nAWNEzVVNX4+hiifvseX6gZRYlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB7458.namprd11.prod.outlook.com (2603:10b6:8:145::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34; Mon, 6 Feb
 2023 22:35:09 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::593:877e:dd33:5b7a]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::593:877e:dd33:5b7a%7]) with mapi id 15.20.6064.031; Mon, 6 Feb 2023
 22:35:09 +0000
Date: Mon, 6 Feb 2023 14:35:06 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <20230206223506.gtobjxi5snmmmjd4@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20230203201758.573775-1-rodrigo.vivi@intel.com>
 <20230203201758.573775-4-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230203201758.573775-4-rodrigo.vivi@intel.com>
X-ClientProxiedBy: MW4PR04CA0308.namprd04.prod.outlook.com
 (2603:10b6:303:82::13) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB7458:EE_
X-MS-Office365-Filtering-Correlation-Id: 3420b1e5-a690-4b2b-0afc-08db089266bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hXbZW8PCnUGnE0YmMb4Jpow3YD1U/c3klr2CUzoykohR0vv0Q7VK8FmsZfcQ1buhAmnXdeVZ1yLSunWj3KX+f9JcwPIDjKvOuvo507S5WocvqfklMCKPjx84STaKPaK4RW2IPLLl4WxPv8KiMkulUNfpoPVnDU+ssQ9uOo+cCT57AHAY1Z2suOn6vcTfmoebG4D2jy4FJpWjN4KwX3bbeMBAS2EbqHHtbudFuZ+mkdCVtSPXfadACx0zDJoQHr/jpSicsA6lVYNyx9jhk3EPSREWi9pnBq1feOr/uQJz2nr5ZEpUI2L17yyoMbWEBvXtLNR7A3WCdZNFY9vMRxJcC/cC76oivlw1JzvI8T9EEBlbf4KgRfZ66U3f8IZ9ojfC4/5fOs/236dTy/MJc2EOv/fPOKdiG/TjdImkBYMuqXx7Tl7axzYFAWoxhBf8lEaAQOsrH9Hi3ayj3mQfoUHIdUWJAzFpCqGSPWvJiogITeUhmibbRpVmjIUNOgKZ/TR4xFdjXbTHG47mpY5WoxMTPdePBQIE94YCJN+Dy9hH8nowDAb+aziuX3U3SnKvfmBd0YnPsXnAJ/7Y3kt9Z8oHZrxzJFazago5D+3O6GYMoJSIWM6i51ANdfZxGAHbNFOPIsjBCAVqBdT7f66Qmv7WSim7qAC7iYcQiusE7j5x+njpULCvi6kU6a0ffcKkEZGz
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(396003)(39860400002)(346002)(136003)(366004)(451199018)(38100700002)(2906002)(86362001)(82960400001)(9686003)(6486002)(6512007)(6506007)(26005)(1076003)(186003)(66556008)(36756003)(66476007)(83380400001)(316002)(66946007)(41300700001)(478600001)(8676002)(4326008)(6666004)(6636002)(8936002)(6862004)(5660300002)(550224004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5WIOQxVXL18kMhAaEGWjC/C0xjLebJNIBxWg6UAzz/dWo3edbmPmWhCDRIz8?=
 =?us-ascii?Q?hrX7mqNZJ1ATjH+MGsDMP4kK+2t4KMEiY/USfhVyIrpemzbrX/muDlA5h7gw?=
 =?us-ascii?Q?oCTmetV+pjI0Wfa4+Do4sZCjWzQaPEj0pXi92PQxcwKPb/lRXN6s6uPfqq/v?=
 =?us-ascii?Q?byc8qeejb32/htOwO3MKUs4zvT16i/SIzTTXf1BG7qpO0/Bt7X1mxK12kWz8?=
 =?us-ascii?Q?pV68T6iC+KkVaus8ECYtnF1vrRSEjDCpR1paIszJb0fW/DM/R43Dbd/t4MsN?=
 =?us-ascii?Q?kLtlwRoWcTJ9AjmSaXYSp/e5hTAX8o+5nEHlrko3/slHdnepURyo1yaKouDy?=
 =?us-ascii?Q?mrdKp8EuNiOsI6yMBUmHAcW26BJBV9QBEUMhMjxE5t+4Njpn8JaRviy3OHOt?=
 =?us-ascii?Q?vivXqLFPx5PV9qY9XzcmSWXI7YtcCS8GEK3vaNmSEEwWhUf6bYedc2oKE7jN?=
 =?us-ascii?Q?FaYo3p74RZRSFTSl/2wUl1kbByqymVOU19la/7lMuLh+8NSzr9MwpWd70pOe?=
 =?us-ascii?Q?zlQhrWDnR4LKv+4vAnGz4DTPPdQuMFLeRxSmfnCE6mBCvEyxi+fuvMX5ZNUj?=
 =?us-ascii?Q?W2DGFxQRwnA7bUjpwQRaVOSQKMLKsdUgAprC9K8Fj0Jv9vsPsJA7C3hiFwKe?=
 =?us-ascii?Q?frEgjK1tTITzrizGuOrZWD5N/brwRrOS+SJq7K57MZxP28vl+1aT+nitwhCe?=
 =?us-ascii?Q?/OatMEVwbljAIwBgOqOVimu+8/mKr8a0ASCndNg1DiS7AmyTarlFFcDwyuNI?=
 =?us-ascii?Q?md8DgiBnvm+ov/E8nX9qDfNnR8lXczZqMeKdGuWfGprGPGBES+xxmT0P1yTi?=
 =?us-ascii?Q?pV26nudP5Ljenm1dRbU6YocWZ5yB4Or82U8C7KAy5GnACfMSLLb4ib9xb9cn?=
 =?us-ascii?Q?bGCLuH9zgzLGrTn6ho8iTXj6ANlNJ/FOmCxnLd8O5eS8z9HTI2QfRG+OHJDW?=
 =?us-ascii?Q?gpETDJ0Shjm4vVBhCOkEkkj8yHlkGayAlZCsyBN5g1R/WDY65Mw2FGWjrekD?=
 =?us-ascii?Q?V5xYf3+ZDJt5f2PGZNALyKG67hr6Ya27ume/2HEBCOG94KJv1dcXOveO9Z7p?=
 =?us-ascii?Q?ZeIOvaYGDGtElGXGIopaM3O0Qk2YqH3YNgwe4IVKj3bSGZnPTkXSuDk5ejKg?=
 =?us-ascii?Q?hodFHXqXJp/xdCd4kZyTtB1n9ZQN3J6hYwQZ9T9O+QPxqBSKbD0fpHdRhsTG?=
 =?us-ascii?Q?A5XxLC2R3P/uNP3vX9Vx9QT8buAd0YfXNHwlBO+rFlafIUxJqjFozwtxMD9A?=
 =?us-ascii?Q?xfIInUGfE1pC/FvMDyGTaR0eGQ53o08yqVsDhZvirYiOtotIWJllSwqRq1W/?=
 =?us-ascii?Q?HZuvFlvBPn0b2Z6GK5WJAsVMOkuRO8T4TgWHizB4QCU/pLxPuMPi6pfGkTsU?=
 =?us-ascii?Q?Vhm+CZXEf1W+DIP3kdiRQjNI/pYnv2qcZLXYkqD6uHztolLJhjiOQ6rz4+vr?=
 =?us-ascii?Q?mq0tHbKbZOxXR25rwmnE+pYSFYdZttC4yARWTvjLkc0U2Q1jAK4IBfp0X4D0?=
 =?us-ascii?Q?MdBjDW71q4DcWKIwmskyzcEBNlWJmcG4yRpWfGJQJ125ldJRvUYr4eN+R7IQ?=
 =?us-ascii?Q?2pUt0PQ6s+wDaLzP7n7r5rtNHHtllPRX83Rd7OimBNXzrBrh3F/rwdi5Ztn8?=
 =?us-ascii?Q?4A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3420b1e5-a690-4b2b-0afc-08db089266bf
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2023 22:35:08.9162 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mHs9m7cVYHdaPq7Yp0FreVh+hXoe2eszbIw1MrpU1WwgH9Vnnr9qXfpDMeyo6Av8LfNaazWRAzRRrqgRh6m2p/MR+XZYPrdilthBGX4tbOg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7458
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 3/4] drm/xe: allow building XE_DISPLAY
 without ACPI
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
Cc: Maarten Lankhort <maarten.lankhorst@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Feb 03, 2023 at 03:17:57PM -0500, Rodrigo Vivi wrote:
>From: Mauro Carvalho Chehab <mchehab@kernel.org>
>
>It is not needed to make XE_DISPLAY dependent on ACPI. All it is
>needed is to not include intel_acpi and intel_opregion.
>
>Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
>Cc: Maarten Lankhort <maarten.lankhorst@linux.intel.com>
>Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>---
> drivers/gpu/drm/xe/Kconfig.debug | 1 -
> drivers/gpu/drm/xe/Makefile      | 8 ++++++--
> 2 files changed, 6 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/Kconfig.debug b/drivers/gpu/drm/xe/Kconfig.debug
>index 6f7123e90563..6726caa63acc 100644
>--- a/drivers/gpu/drm/xe/Kconfig.debug
>+++ b/drivers/gpu/drm/xe/Kconfig.debug
>@@ -99,7 +99,6 @@ config DRM_XE_USERPTR_INVAL_INJECT
> config DRM_XE_DISPLAY
> 	bool "Enable display support"
> 	depends on DRM_XE && EXPERT
>-	depends on ACPI
> 	default y
> 	help
> 	  Disable this option only if you want to compile out display support.
>diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>index 76cabaee562f..3d716b71e54f 100644
>--- a/drivers/gpu/drm/xe/Makefile
>+++ b/drivers/gpu/drm/xe/Makefile
>@@ -132,7 +132,6 @@ $(obj)/display/intel_%.o: $(srctree)/drivers/gpu/drm/i915/display/intel_%.c FORC
> # Display..
> xe-$(CONFIG_DRM_XE_DISPLAY) += \
> 	display/icl_dsi.o \
>-	display/intel_acpi.o \
> 	display/intel_atomic.o \
> 	display/intel_atomic_plane.o \
> 	display/intel_audio.o \
>@@ -185,7 +184,6 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
> 	display/intel_lvds.o \
> 	display/intel_modeset_setup.o \
> 	display/intel_modeset_verify.o \
>-	display/intel_opregion.o \
> 	display/intel_panel.o \
> 	display/intel_pipe_crc.o \
> 	display/intel_pps.o \
>@@ -209,6 +207,12 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
> 	display/ext/intel_pch.o \
> 	display/ext/intel_pm.o
>
>+ifeq ($(CONFIG_ACPI),y)
>+	xe-$(CONFIG_DRM_XE_DISPLAY) += \
>+		display/intel_acpi.o \
>+		display/intel_opregion.o

extra tabs here look agains the coding style, but it is what this file
is doing in other places, so ok.

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>+endif
>+
> obj-$(CONFIG_DRM_XE) += xe.o
> obj-$(CONFIG_DRM_XE_KUNIT_TEST) += tests/
>
>-- 
>2.39.1
>
