Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 414C1C64EC4
	for <intel-xe@archiver.kernel.org>; Fri,  3 Mar 2023 06:11:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E055A10E5EE;
	Fri,  3 Mar 2023 06:11:04 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B7D110E04D
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Mar 2023 06:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677823863; x=1709359863;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7/FMDhDcqOVXNsGRtCTP53Tc9bg92rjZU/Sxu6/3Jxw=;
 b=V5GKn/Ds/yAKrmEyOhDhsaXZF5KfDsEpkZgG5rPwEWLyDSp75yeUqRMc
 jNbtv6xwDRe0KW4K7Xy3BVOxuytVZWJ2f9k3VzulmmzsBlQDl3dONquzu
 yA9S6N8kaWrtZtHGKH39SUHJrVqmFbxBnotPHY6iY+CqA7NgbrCYRlrnz
 Y9bX0M4P+61L9yoJYmY4Ryf3NDMR3SwymXGgafJoiXkBb+emhDmG+HrBn
 I2LqfgMV/U0q7vNrUC1nKLUC6ahc4SQISwu7/iIlIoFWOT65D72fgMWI6
 Ks29hgYtfQNggU4U/hxAs9jbBW594dFqN4BzfyZjUJb49WaEwymqqc8ut Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="323262595"
X-IronPort-AV: E=Sophos;i="5.98,229,1673942400"; d="scan'208";a="323262595"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2023 22:11:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="677527737"
X-IronPort-AV: E=Sophos;i="5.98,229,1673942400"; d="scan'208";a="677527737"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga007.fm.intel.com with ESMTP; 02 Mar 2023 22:11:02 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 2 Mar 2023 22:11:01 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 2 Mar 2023 22:11:00 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 2 Mar 2023 22:11:00 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.105)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 2 Mar 2023 22:11:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XyWh/ydIIdXnZ2Mhw7DrfmSWtFz03hhw+jIH/Sidgyc7b5NuYkWid4XEcQiKAJCB1UOYxLsPmm1zr1hkQXU3JOXZuplZwRdn7jJtvLzV6ZSwCEKVjxdH8KwnVQndG0UWTKoc8rWi6d0kCFozbb4nBxhUOayWyVYpJRi3tkLnOagx/uvOUvW+Vk4nlq/jLzK5YWUjFCfviJ5dfDo7h0bkLcBl0FCiD+e0cbDAasCyUlvhYBGoVBeEILv4bSC83mav3V0siv/VfTyuprARtsToKx0/UN9RDd1wijSjsh6pyfMmluJ7QAbGn4MfzSOuMvhLjflQCuFC2iY40SopBYx4Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3M9gEJ6cNnoQAimQw/y4uiZrvotNUz7aI+pFqqcgsxw=;
 b=Ua8vUcolFAIQlfDU9ZgqKvOrt9mGfTgS1fCmUj8v0J2WDdtf+hAzMds0qyUDUdn0aQT+QczKnRRoaXAK1grlgElMGfMfWMVQ/l9T3CjRrk18HLdamImF1ZnoLGINejfDpc7Y9sf6TVqMIsm8ExQ1WzW87aBRr7qtGZZAXvwBWFDfTRUr4u0XXQ4sYA3a1zjMn2xjeqbX17p/tVkU5TINJ8ET5FmhJw4BfduEy09+zgH8knO4sHOt/898AsfL/UIbDQbEX4dRBjp0hzw/Iu77P1gEOdLG5UJZTqvS5u86sosOBOSkBHkwHlvuB0q6Phf8yjHCwVJHqt/5BdjfeBtHMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ1PR11MB6228.namprd11.prod.outlook.com (2603:10b6:a03:459::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.18; Fri, 3 Mar
 2023 06:10:58 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8%7]) with mapi id 15.20.6156.018; Fri, 3 Mar 2023
 06:10:58 +0000
Date: Thu, 2 Mar 2023 22:10:51 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Message-ID: <20230303061051.yfvv7u5oljxo7bh3@ldmartin-desk2.lan>
References: <20230302141230.2804699-1-jani.nikula@intel.com>
 <20230302141230.2804699-7-jani.nikula@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230302141230.2804699-7-jani.nikula@intel.com>
X-ClientProxiedBy: SJ0PR13CA0101.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::16) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ1PR11MB6228:EE_
X-MS-Office365-Filtering-Correlation-Id: be513e44-fc04-47ff-31f1-08db1bae0e7b
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Sae0k8HNkDZnBGJ9rWKnq+orG61qfdGICwibNx6h82NDx+azGKfCaSgGzz39O/C+MkjqoTFmdz4Jzdq2sUMRfnRGX9wg+Li6Gy9so5EB+VRW4VmTIQ9YbrG6zyfuD/wryWM3vDl8+hwF/ckxj4QrPJQ9jT+sCCy5ZvgrtPtICnuJ2lkuo88BtjvLE1b139y2kng5VvtZvbJfof8pmUEyLZ1/CxKH2DATsXbEtyoMTsGZUGs3jXXXTMKJAsv1OO/9YEiPY87ixv0vCdTswBJhb2Ovs3MWaIioOzG526aSBYRWnzevsFZyBYoy4eL2xVFDTUVJD6OgGN42FM1PwOScMJHDXXz6ljdzggq2p1QQtpldUQvuMbgHVM2SYCa1BO6MH8urJUXrdJ+UQ/JJkndyIodTEUeUccLmF6dia7cBv+xt1bCBY2wz8wbw9OJka2CMb1wZ+ow0sf+zYr0mLZ6rZsluzV05tSeuq0ZGWa2D7WvVgl1dzXnsFVnoRNOd5h19zN0EZvOunbZpWbOeKyIT1ogiR4ONaUTWk2/r3MqZu1IDtjLoM43awgehRiqrX2xztqADMfaIupg/sY2buTE7isovzyDKHhRr86KtnGkJ1BP56KpGsPqgS2W6lguHE8XeVb9EkaC3732eb1TB9GSOJA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(376002)(396003)(136003)(346002)(39860400002)(451199018)(83380400001)(6666004)(36756003)(86362001)(38100700002)(6862004)(82960400001)(5660300002)(8936002)(478600001)(66946007)(186003)(26005)(66556008)(6486002)(1076003)(9686003)(6506007)(6512007)(316002)(8676002)(66476007)(2906002)(4326008)(41300700001)(6636002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?D36Bd+JbBKTd/tbWywtGW7Mei8aqkNk1LwUfCqkPNEFvtEdj0FxIICwy97Zo?=
 =?us-ascii?Q?dnsKUsJ8cHMWy8J3g/tUKmCjgbwg8CKDTI+6cyrv3LLm40Hf6jsQLvVrDE/t?=
 =?us-ascii?Q?dXQijf1Oh6b2U+b4f3L35/ZPCCwrl22Pd2azVmjYtKvftxTIhlNEDayMq+ue?=
 =?us-ascii?Q?8kg9OdHPquIEPxPuSi1+l4C3wUAYQXMiOsYFRLzS2MrRjv6niwXWbwV1vZ4q?=
 =?us-ascii?Q?KOfyqFg13KqGHg5laQH71cysJK80QpFgXLO/RZ5QXuDqQS0xS7AasJlh1Do/?=
 =?us-ascii?Q?923JDK6mZ9WXbnTDzRBuTj2cX+/5OyH7RYtYaGfIK2OK6GqFBufD7bfOTIcf?=
 =?us-ascii?Q?ElW87sXWOlgvygHPZ2XJQATc/TeCSJcOEAcu4K2pi32MO9XTYmCK1jqSkwBA?=
 =?us-ascii?Q?aO2fIs8y29VP2nkBvsOG0r8PxGOxqQYCs4FBj+49kqUDyBeLrUuTv41ax3nK?=
 =?us-ascii?Q?VstGWsyzLFskqAPDISIKJClH4krc/sf7+xGgNBhkY3sxxG93q5x4EeKeRIgQ?=
 =?us-ascii?Q?pUC7AThzfxIRHRoZgw/k2sLpK6JbqSpYzBpsDkmi42C3pg/0MLDsfDGVQGPy?=
 =?us-ascii?Q?Jpa/7gIYI/1K0mLZIBYce+t/AdoTK9ewVSqX9S1jtnUlhUHwYqNXqR9IxqXl?=
 =?us-ascii?Q?k/5CdsoYzY8exo/d72+JQjnsJ1zl48mcrWMP2XPosUSvU9IKlcYcR2mh686s?=
 =?us-ascii?Q?i4mzEGlmbDWDOOeYaHoMv1gpCALA6pN+FGwiBAgcaROAut+MYIpFBpYYinLp?=
 =?us-ascii?Q?O75aw3WIf3sIwNRMbuqqJ5wUCCV584N7JuXMbFEea0LozKKetDCsVZ1XHVz4?=
 =?us-ascii?Q?2iinznbNq/yvcE6xu0fjPcka2mmF3Oyr74+bz4qXkI3/knxkuQMRqKpXPwyj?=
 =?us-ascii?Q?BCIqf7qDK08GAQG8XJcghTRSr+mHABv+lWrlxle4ZAg/RDuQ22uNdZ5TV/Ic?=
 =?us-ascii?Q?Kgwlj+UewOzB8jPGcs9hiJttcpMC+Cw1smjEXKKFcEVkefitwWbDf0IS7Ttw?=
 =?us-ascii?Q?gqD7npijLFeIUUBhfLrKiGR09hYslKc8yW6KeNGTGyD6S5EmW2s5mfIXUuLP?=
 =?us-ascii?Q?lQkrjunmudK3Gz0vEOTA22pOiIH0dvSY7hX+kGT8PlLFJdmPY3zfj54XAi+C?=
 =?us-ascii?Q?7Fs+PmiuYXwJql2rDnlALmMelJhPOifVSIXqQW74/cejjAkhjYn5YTMFgs6k?=
 =?us-ascii?Q?rsfPAoB0h67H1vltw+XM25x6ewmrve9UZyV0LqWXavRHS6hKWBOY70sTFvw4?=
 =?us-ascii?Q?L/efHLFIL9dJMtIcUgyB3cvSVl8ci6XbTccV/ekM3fRezl43REeCGbiZnDSq?=
 =?us-ascii?Q?kY5NkyACootodnjLpjs4NWxqvipbIzGXuGa049M4e0+ZsjtAXMhTmQNA+m25?=
 =?us-ascii?Q?3p+eXJhCh7PeUZgbPO8aH/XuirbG7FFxK7t/8Ih8c0szsr093wzdNjVZ5x3B?=
 =?us-ascii?Q?c2+MfSoHmZyg4By4pm1yY1KoGn8cB6BT3FPKdhhVthYd5OzOo5ZfffKDjM+A?=
 =?us-ascii?Q?3QzMXdLjKZqxtf1h4UG8aUljH7ppz5tHRcAaLUH8XJunvmgordvgBzHVsEt2?=
 =?us-ascii?Q?cOlo6PpU3/6NfcxN/1j03wbW4/2eR0lK/+eRaDVoXiUt1PIbB41xV3lyn6s5?=
 =?us-ascii?Q?MQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: be513e44-fc04-47ff-31f1-08db1bae0e7b
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2023 06:10:58.5989 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 47l7xg+HOm/Ka7t50xpyaLSDxJRdLGy/BnFplTRqH2GRSlJlze+VKC84aX92so0bKWrJFazMzU663PaZzKHdL2eAJr2/b0M/QJ+lpFzj3Ck=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6228
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 6/8] drm/xe: move all top level i915 compat
 headers to a separate subdirectory
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

On Thu, Mar 02, 2023 at 04:12:28PM +0200, Jani Nikula wrote:
>Be more explicit about which headers override i915 top level headers.
>
>Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>---
> drivers/gpu/drm/xe/Makefile                                 | 6 ++++--
> .../drm/xe/{display => compat-headers}/i915_active_types.h  | 0
> drivers/gpu/drm/xe/{display => compat-headers}/i915_drv.h   | 0
> drivers/gpu/drm/xe/{display => compat-headers}/i915_vma.h   | 0
> .../gpu/drm/xe/{display => compat-headers}/i915_vma_types.h | 0
> .../gpu/drm/xe/{display => compat-headers}/intel_pm_types.h | 0
> .../drm/xe/{display => compat-headers}/intel_runtime_pm.h   | 0
> .../gpu/drm/xe/{display => compat-headers}/intel_wakeref.h  | 0
> 8 files changed, 4 insertions(+), 2 deletions(-)
> rename drivers/gpu/drm/xe/{display => compat-headers}/i915_active_types.h (100%)
> rename drivers/gpu/drm/xe/{display => compat-headers}/i915_drv.h (100%)
> rename drivers/gpu/drm/xe/{display => compat-headers}/i915_vma.h (100%)
> rename drivers/gpu/drm/xe/{display => compat-headers}/i915_vma_types.h (100%)
> rename drivers/gpu/drm/xe/{display => compat-headers}/intel_pm_types.h (100%)
> rename drivers/gpu/drm/xe/{display => compat-headers}/intel_runtime_pm.h (100%)
> rename drivers/gpu/drm/xe/{display => compat-headers}/intel_wakeref.h (100%)

maybe compat-i915-headers to be explicit?

Lucas De Marchi

>
>diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>index 18257cd7227d..42a34597f16c 100644
>--- a/drivers/gpu/drm/xe/Makefile
>+++ b/drivers/gpu/drm/xe/Makefile
>@@ -99,7 +99,9 @@ xe-y += xe_bb.o \
> 	xe_wopcm.o
>
> # i915 Display compat #defines and #includes
>-subdir-ccflags-$(CONFIG_DRM_XE_DISPLAY) += -I$(srctree)/$(src)/display/ext \
>+subdir-ccflags-$(CONFIG_DRM_XE_DISPLAY) += \
>+	-I$(srctree)/$(src)/display/ext \
>+	-I$(srctree)/$(src)/compat-headers \
> 	-I$(srctree)/drivers/gpu/drm/xe/display/ \
> 	-I$(srctree)/drivers/gpu/drm/i915/display/ \
> 	-I$(srctree)/drivers/gpu/drm/i915/ \
>@@ -220,7 +222,7 @@ obj-$(CONFIG_DRM_XE) += xe.o
> obj-$(CONFIG_DRM_XE_KUNIT_TEST) += tests/
>
> ifneq ($(CONFIG_DRM_XE_DISPLAY),y)
>-	skipdisplay:=-not -path display/\* -not -path xe_display.h
>+	skipdisplay:=-not -path display/\* -not -path compat-headers/\* -not -path xe_display.h
> endif
>
> # header test
>diff --git a/drivers/gpu/drm/xe/display/i915_active_types.h b/drivers/gpu/drm/xe/compat-headers/i915_active_types.h
>similarity index 100%
>rename from drivers/gpu/drm/xe/display/i915_active_types.h
>rename to drivers/gpu/drm/xe/compat-headers/i915_active_types.h
>diff --git a/drivers/gpu/drm/xe/display/i915_drv.h b/drivers/gpu/drm/xe/compat-headers/i915_drv.h
>similarity index 100%
>rename from drivers/gpu/drm/xe/display/i915_drv.h
>rename to drivers/gpu/drm/xe/compat-headers/i915_drv.h
>diff --git a/drivers/gpu/drm/xe/display/i915_vma.h b/drivers/gpu/drm/xe/compat-headers/i915_vma.h
>similarity index 100%
>rename from drivers/gpu/drm/xe/display/i915_vma.h
>rename to drivers/gpu/drm/xe/compat-headers/i915_vma.h
>diff --git a/drivers/gpu/drm/xe/display/i915_vma_types.h b/drivers/gpu/drm/xe/compat-headers/i915_vma_types.h
>similarity index 100%
>rename from drivers/gpu/drm/xe/display/i915_vma_types.h
>rename to drivers/gpu/drm/xe/compat-headers/i915_vma_types.h
>diff --git a/drivers/gpu/drm/xe/display/intel_pm_types.h b/drivers/gpu/drm/xe/compat-headers/intel_pm_types.h
>similarity index 100%
>rename from drivers/gpu/drm/xe/display/intel_pm_types.h
>rename to drivers/gpu/drm/xe/compat-headers/intel_pm_types.h
>diff --git a/drivers/gpu/drm/xe/display/intel_runtime_pm.h b/drivers/gpu/drm/xe/compat-headers/intel_runtime_pm.h
>similarity index 100%
>rename from drivers/gpu/drm/xe/display/intel_runtime_pm.h
>rename to drivers/gpu/drm/xe/compat-headers/intel_runtime_pm.h
>diff --git a/drivers/gpu/drm/xe/display/intel_wakeref.h b/drivers/gpu/drm/xe/compat-headers/intel_wakeref.h
>similarity index 100%
>rename from drivers/gpu/drm/xe/display/intel_wakeref.h
>rename to drivers/gpu/drm/xe/compat-headers/intel_wakeref.h
>-- 
>2.39.1
>
