Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 308C8C7618E
	for <intel-xe@archiver.kernel.org>; Fri, 21 Apr 2023 21:27:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E80F110EF17;
	Fri, 21 Apr 2023 21:27:28 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91E3910EF17
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Apr 2023 21:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682112447; x=1713648447;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=zjt36LaJsyKLn13lXKl2TdphrtE1t6o8E1MhiHFUisE=;
 b=mAGVkRw9RtNE3KRPeW+OmP4/Ofi1Zs72kR1llGgvV8xWes4lVI5ECgmY
 7z17RCx+a54SKwGJ+XZPVKCtoloEUIUpFZLWcFV46syoYxDjQlw/AvhBM
 C+HulnTZ6rN55D/UP91vBzYt2JYnONmdtdygK8ITwsNjo1bV7kBrsZeKG
 7vQgLlwU6H9qy9w+8QidjOikDJXUYPwVa3gqcKjvbzi3I3gWQRWq0nf83
 wSANULduVXWbE/d86Gh+3OW3Pxsn9Pzhb4WdAkbfwCFEjZXyGBjeoyQmp
 b6FevivrWnIQxumQa5PF/+QD+hy5atKRfRHMPNB3hoxhz4JnECri94kdN g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="346104937"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; d="scan'208";a="346104937"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2023 14:27:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="1022034093"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; d="scan'208";a="1022034093"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga005.fm.intel.com with ESMTP; 21 Apr 2023 14:27:26 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 21 Apr 2023 14:27:26 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 21 Apr 2023 14:27:26 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 21 Apr 2023 14:27:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oP05M8ZIQk+nTHcNNG4sKhqtO1u4zCoxaptJMW7T//77tn75Zy7xQ2kxg2e/ZRkKRj1wI+cEt2JMoLnJyG6z/wt7bHUHqRKX04CLoo5wAEKcj4Akv42qm/M6P5oPZRELh/WqsBQz3/+pEdVMBChUbVBSrY6Gu4nilt+vISTOhd5kKJxP9Ns7cR/je65MqsxZXTTD+NNgfc4q3Jh/TTf17I4ofr2iVy+OZI50cMpMvuuZghEjGkAdMRPrsr8my1VzQ+8mb6ZEUpSz3kVFHWPB2CLu6RauhHaZb7aVTcPlNBw5B2sc2Tx96scjRWLKa3l/yD6Fq6WNZq30c94XTfXu5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Ys8Zj36nJOrmpZitiHsJhL0cqXKF8//ThXneb4AxOY=;
 b=ElE5zd4c/vOc+7nSHthEIB8Ef1MdfQ8TEBiWgxvqKDOxV6bIYLTFY4yBOc9hjeu8SYRA4xULlvjFWvCWravFzs8OI1648g44lR2fNm6wIwQX5aO4r8HSUpwa/IbIO8Jrp1AIORPOBvhUPzxtYh47A0cdlPgpJad5kMa9io3ExBC15K7S+xXsR26rqqbZVy3YT+Z1cjYc/E7p+Nn6UdVREeuXWrF6ZaXnmoBOhzKT2Cd0Ibj7QB5RF1wEHUeVyDDrFzKqoCuGXHKwZIglfouinaZVUWnUzjL52/k0oCtdI4403N2P3AD3vahZT3RBk/tGhwoV6Tzms0cHP8l46hhBAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH3PR11MB8094.namprd11.prod.outlook.com (2603:10b6:610:156::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Fri, 21 Apr
 2023 21:27:19 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6319.022; Fri, 21 Apr 2023
 21:27:19 +0000
Date: Fri, 21 Apr 2023 14:27:16 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Message-ID: <3tbvdpag33peyu4xechzmeagdokffu7keqjjrudsjjmwaduugx@gjodtnvlx4p3>
References: <20230419123947.543175-1-jani.nikula@intel.com>
 <20230419123947.543175-2-jani.nikula@intel.com>
 <nqx26axz3idy7up674v7i3nobnu5hjtwuyrn46ghdbzp7c2qo3@bjczno54ijhb>
 <87sfcvvsyd.fsf@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <87sfcvvsyd.fsf@intel.com>
X-ClientProxiedBy: BYAPR11CA0066.namprd11.prod.outlook.com
 (2603:10b6:a03:80::43) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH3PR11MB8094:EE_
X-MS-Office365-Filtering-Correlation-Id: 6069da07-9701-4557-d4e6-08db42af2f96
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XDvXz15EnHLx3MSBrsjstSbByHQjNb99PjIlgY2rbiDKXT/Mur5lwT9ZjR+3RThgFU2jl3Oqgngnrt6QERFUWtm5UjFNqp9QWeiU9DtH/HlA5CTR+SpGs+YZDBOaYVN8JLa8p1z5dh410rNALbSwq2Ozw4ia59a8+jNamjqBfZxiNUxwx+R9v62YtuxNlEwEKCwemuRsKLQTU5KLEt/fWmbAg2kVa2LBykjNRz9D684hSiH0Q8eGFVxxiWmY37OK4SaEgrRt1WZsBVpUfSp7Dh7/ug8JxcV0WPNUmu5XCiNiJrbFi48PGPhwC9040Qv+xJ0O3umfTBPGyLLlGyzyf+NUtUMHEKq8ATnYd91nTL/kBqtSU9okTCbFWy0nzCEdVBm6ihbbCikPrBWquWpzW6kVpXbD1S0Jf+gmZPwICYzaNMw9tUxFLL4NDJgQ4l5Eb5dwUmjwuyKf8a1HbgY63QCmWqhOAQGrlKvr55eim8ELvv4cMDuwRKpKrJO8yF02BPTt5tMoNJ3oa/0PKeonqft3Z5OAJaUYoAH3KctGwhNgRC7q4yU3Xd/q825hDRuF
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(39860400002)(376002)(396003)(136003)(366004)(346002)(451199021)(8936002)(8676002)(5660300002)(6862004)(2906002)(83380400001)(66556008)(478600001)(6666004)(6486002)(6636002)(41300700001)(186003)(316002)(4326008)(6506007)(66946007)(66476007)(6512007)(9686003)(26005)(33716001)(86362001)(82960400001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?C8lXivk7r2gNCj/ztmBK9XMhl4BzjibpTZVCqbnICL6xSJbG53NWcqeQZ+6w?=
 =?us-ascii?Q?dsWLjWKHToxoU8OuESRcZUYfF2cOdbyQAIjPg6DYOXZga/LPm9whX7uaPcbN?=
 =?us-ascii?Q?R4QpyXsfVZdUwhun6yJEIBbJ71zSDGd3iGHHTMla1Zypq+yfyfiHqpsiA1RW?=
 =?us-ascii?Q?yDGiJbMzlQkraUW+IyfgwIXNQI/Ti4glnNf+UFLGjmWi6bqTRx1UHTlcZgkF?=
 =?us-ascii?Q?9DmAxW4h/IJ7uRQ0AtQCsWRlOO9T8u3qyNv3VCmk6yeOC4ViZr94tp826coK?=
 =?us-ascii?Q?0+kiolJUobwkWjIlgdQyLwrD0m9I4i+BmMr6QEqvD7EUbITbf8YI8hdhQvAY?=
 =?us-ascii?Q?aN+znSIcufZMYb7i5Nh6kxvy3bmkKOKXg75ZqkmHY0Ngd/tG4cQzvXFTGZsR?=
 =?us-ascii?Q?OQ0oGHWdCx2G7sBwUFEUF6KteX1njVs057ilLT7Jc33nEH1Qs7ZZBdaPzF3U?=
 =?us-ascii?Q?rSV3irJ0ByZXQo9eKz8FdCrFqd/BVzdjBjAU+E5VcvahfVj+wS5gTz9IHiOv?=
 =?us-ascii?Q?txwbcw/Ckl0jAhhMZHxMsakkMxsa99WHqm6ydeKdRLV2W2Apv5Gf8JH3r9eM?=
 =?us-ascii?Q?yVf31YVjX0vVMIGY/4r36zYBI1jfPBaYdGuE49+t8+kivRvfst1qy0MdRacD?=
 =?us-ascii?Q?0eznWieYza0t8xWhJoAHhw5VYqYm6oMv5sGoAjzqW5mJDaMTkIx9FGf47EDV?=
 =?us-ascii?Q?Gp4JxH1V1GqG9wdxe8GAJdnuzhKP9eSqwcPs0GdS0P3VXHUUUhGAisb84a7M?=
 =?us-ascii?Q?ry3BIvuCdb1BL36WelmAaPEG99X2Qm7EpddN+Se9xGHsrlWfyoxNGSNv1BS4?=
 =?us-ascii?Q?KTzreITZc0bqYMB30FmARujnmNpm6hG1otQnoxhoiTsNXjeyLZrxCD0BzVNn?=
 =?us-ascii?Q?NXALf1KgKvAwbeP85KLsUlLGfmkc6etlpzzbiREabzU6jBWx3HxYIjM3RiYg?=
 =?us-ascii?Q?+cmGaQVwji0RRZrsJdV+lnNfqW2flr9SAsOddEN8m5Ho9eMATYEacDqsnTyL?=
 =?us-ascii?Q?MnPrrTjNJRF1HB4KNJKmDJWzlrtVn0U5p66mYFQPgJY8tMK0S6EcaPb6uq4Y?=
 =?us-ascii?Q?ibwWfQ4rTRf2rS8RCm443ZKch0aJCoxhERUcFvXH0zKU04Qbc0GGHSDr0ykS?=
 =?us-ascii?Q?Ou44UxnnAsDz6QdsBFOP7CZDl+oiFy/3UAlePR74CCe1j5ra1pi2lx4/tu3F?=
 =?us-ascii?Q?PJKMzAH2t4ymVPoo9M/uMrBHJWkO4/qtsgBu7rLJZr4pGgK1fQGmXXYZ7HIr?=
 =?us-ascii?Q?OM4NuHoAzUhO8tdYze476fpJUwLfGicchQgZDxFr7wy1g8IDIZzc5LmGqx9o?=
 =?us-ascii?Q?fs5PJ/Oza1vgHk1FwEs7Nwqjq7AMLo03ZGyk1zUk3N6Z9WY5l2hPlZOzptv9?=
 =?us-ascii?Q?XAhRgXNGCVhilplCLZRU6PFmo9myaRC6vV4CJ0llt1/oIs6Qf0QGNIbcpM1f?=
 =?us-ascii?Q?l180y1ANBrXJFccaGqU2Cg8P6LK2eYj8edRw9bXJNmoHgfGutNa4+dExqgVk?=
 =?us-ascii?Q?zRDPM4JHTgkKu9ErrmYX2yjSOJQypMN85xpfb8oXq6yBh5xTKYuFi3SzncGV?=
 =?us-ascii?Q?/5tLsNB43f9o26hpypju8OGpWtHB5Ag4BxLzGOuoI/1ghTcgRpbQgr0sLDlD?=
 =?us-ascii?Q?UQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6069da07-9701-4557-d4e6-08db42af2f96
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2023 21:27:19.0991 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xwH43j9OcFw4MRLO/KGViOUUfEYnkHVCpIJEbFMVJy0iT18AnmfA3zA4AR5/zuN9wYALALmvr5HDN7ltSEQ/1TtLaazXBWlOmn+yqeJ2IFM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8094
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/9] fixup! drm/xe/display: Implement display
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
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Apr 20, 2023 at 11:49:46AM +0300, Jani Nikula wrote:
>On Wed, 19 Apr 2023, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>> On Wed, Apr 19, 2023 at 03:39:39PM +0300, Jani Nikula wrote:
>>>Build the i915 display object files in i915-display sub-directory, to
>>>increase clarity over what's coming from i915, and to simplify the rule
>>>to build the object files.
>>>
>>>Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>>>---
>>> drivers/gpu/drm/xe/Makefile | 165 +++++++++++++++++-------------------
>>> 1 file changed, 78 insertions(+), 87 deletions(-)
>>>
>>>diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>>>index aceca651de57..9fa4aaad6b8f 100644
>>>--- a/drivers/gpu/drm/xe/Makefile
>>>+++ b/drivers/gpu/drm/xe/Makefile
>>>@@ -105,100 +105,20 @@ subdir-ccflags-$(CONFIG_DRM_XE_DISPLAY) += \
>>> 	-Ddrm_i915_gem_object=xe_bo \
>>> 	-Ddrm_i915_private=xe_device
>>
>> by leaving them on the same dir I was actually thinking if it would not
>> be possible to add a display/Makefile  so these additional defines here
>> are added as subdir-ccflags only there.
>
>This is my understanding, I may be wrong:
>
>* If you want subdir-ccflags-y to only apply within a subdirectory, you
>  need to descend to the subdirectory using "obj-y += subdir" and have a
>  standalone Makefile.
>
>* If you use "include $(src)/subdir/Makefile", subdir-ccflags-y
>  specified there applies to the parent directory.
>
>* If you descend to the subdirectory using "obj-y += subdir", I don't
>  think you can have the parent and subdirectory Makefiles add objects
>  to the same module.

true, but the snippet below does the trick for me. The problem is: it
doesn't work due to the include dep:

xe_device_types.h -> intel_display_core.h -> {the-display-world}.h

Anyway, here is what I used to remove the cflags from the !display
sources:

-------------------8<-----------------
Subject: [PATCH] WIP cflags display removal

---
  drivers/gpu/drm/xe/Makefile | 36 +++++++++++++++++++++---------------
  1 file changed, 21 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index ee4a95beec20..fea31cfc3de6 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -96,24 +96,13 @@ xe-y += xe_bb.o \
  	xe_wa.o \
  	xe_wopcm.o
  
-# i915 Display compat #defines and #includes
-subdir-ccflags-$(CONFIG_DRM_XE_DISPLAY) += \
-	-I$(srctree)/$(src)/display/ext \
-	-I$(srctree)/$(src)/compat-i915-headers \
-	-I$(srctree)/drivers/gpu/drm/xe/display/ \
-	-I$(srctree)/drivers/gpu/drm/i915/display/ \
-	-Ddrm_i915_gem_object=xe_bo \
-	-Ddrm_i915_private=xe_device
-
-CFLAGS_i915-display/intel_fbdev.o = $(call cc-disable-warning, override-init)
-
  # Rule to build display code shared with i915
  $(obj)/i915-display/%.o: $(srctree)/drivers/gpu/drm/i915/display/%.c FORCE
  	$(call cmd,force_checksrc)
  	$(call if_changed_rule,cc_o_c)
  
  # Display code specific to xe
-xe-$(CONFIG_DRM_XE_DISPLAY) += \
+xe-display += \
  	xe_display.o \
  	display/xe_fb_pin.o \
  	display/xe_hdcp_gsc.o \
@@ -126,7 +115,7 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
  	display/ext/intel_pch.o
  
  # Display code shared with i915
-xe-$(CONFIG_DRM_XE_DISPLAY) += \
+xe-display += \
  	i915-display/icl_dsi.o \
  	i915-display/intel_atomic.o \
  	i915-display/intel_atomic_plane.o \
@@ -197,15 +186,32 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
  	i915-display/skl_watermark.o
  
  ifeq ($(CONFIG_ACPI),y)
-	xe-$(CONFIG_DRM_XE_DISPLAY) += \
+	xe-display += \
  		i915-display/intel_acpi.o \
  		i915-display/intel_opregion.o
  endif
  
  ifeq ($(CONFIG_DRM_FBDEV_EMULATION),y)
-	xe-$(CONFIG_DRM_XE_DISPLAY) += i915-display/intel_fbdev.o
+	xe-display += i915-display/intel_fbdev.o
  endif
  
+# i915 Display compat #defines and #includes
+xe-display-ccflags += \
+	-I$(srctree)/$(src)/display/ext \
+	-I$(srctree)/$(src)/compat-i915-headers \
+	-I$(srctree)/drivers/gpu/drm/xe/display/ \
+	-I$(srctree)/drivers/gpu/drm/i915/display/ \
+	-Ddrm_i915_gem_object=xe_bo \
+	-Ddrm_i915_private=xe_device
+
+CFLAGS_i915-display/intel_fbdev.o = $(call cc-disable-warning, override-init)
+
+# Apply CFAGS to all display sources
+$(foreach d,$(xe-display), \
+	$(eval CFLAGS_$(d) += $(xe-display-ccflags)))
+
+xe-$(CONFIG_DRM_XE_DISPLAY) += $(xe-display)
+
  obj-$(CONFIG_DRM_XE) += xe.o
  obj-$(CONFIG_DRM_XE_KUNIT_TEST) += tests/
  
-- 
2.39.0
