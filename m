Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D21CC678D4
	for <intel-xe@archiver.kernel.org>; Fri,  3 Mar 2023 06:21:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9FB710E5EF;
	Fri,  3 Mar 2023 06:21:26 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6ADE10E5F3
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Mar 2023 06:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677824484; x=1709360484;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=H4FY+bxqoXi0KidZvz5rztVAqU6kdN0tuoRMqxqhslE=;
 b=gQjtotrur2kBjG4nzFMhhj2dUqTkEQ6aGIezL5sKgmQKJ2DSOFgZRF/k
 U+sogQVY0a09LPtHphmK5V5VrbDHNZ2P5UtBkP6pT8aASh3X/acf1hLyA
 a66duftCsoHMVBZH8MR3mtpgAK5yMA9Cfc+QH7vMeS4QKlnaidPa55z6z
 m655/7g7azettkRF5BsVfAabpr3wxS/LY3hTVnmsXyiWj7gjOHB1e5rsy
 zlJbl/6fZpOvZyQPhjdB9+DZFw/FPasq0RIXu1j2eiFe0/5lx83GLAXDl
 BwXQx9aEXkgNWZt9qVThK9exCCLKhlfbvvQXDhLExU/XD2MK6ztD+map+ Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="397558395"
X-IronPort-AV: E=Sophos;i="5.98,229,1673942400"; d="scan'208";a="397558395"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2023 22:21:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="675249215"
X-IronPort-AV: E=Sophos;i="5.98,229,1673942400"; d="scan'208";a="675249215"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga002.jf.intel.com with ESMTP; 02 Mar 2023 22:21:24 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 2 Mar 2023 22:21:23 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 2 Mar 2023 22:21:23 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 2 Mar 2023 22:21:23 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 2 Mar 2023 22:21:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b0ofU4Y8LtiHAVsfJsEbfBZ6vSlKWU5XKhDCORLLtgXKTjQS9n5TL/4l0D8tid1GGM3y9vuVKuiHQF39n7IEx0zDq8uMod20NlZ75QN2y3EbfSDV7AUOxOPKbL07E3+rdO7WNPDK5baq7OJGmRdqP/AXt5bzKNJrQlxm8f/aaZEc+wXHpyuGEK7yDlgs/w7nphrASEHnzp/7F0uCDRkNJB2dWnBb3sp+eAgr0Hooi+AFfRRMrCk5nIRojO20q2PeI6VHQtMt3AcfGwp8ODKx44RuZOIYkS7wOJa8gXGgtYYxe5SG0LiT1MQqTuQbiXr6A4FEJ1+SWDtGXOqYfkqGJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2G4b95J9yyNZA21RfR72BGrrE30fwQ1sU8A5xW4M9YE=;
 b=BiwIej/eWXxYDNxdHU6PiaT+GweL6prUbFv0nYONXt+HOTKM12XSwsM8UVInkYY7CVBLtsSBhn9ku/WHIbO8XV1j46s4ia6ZFkqNvnxoCuvXUIArmY9//j5p6PK85UC6C911ePZjpQkcI08YGHNJiETyPOpSLrqqcseFuQYwTPNqfejPJO4MEP0jwrcs18rPQIiHVyTArJJCxQXZIwz337I3QaWljktVnkpzwIlPdB4cF0+OqUGvOh9M3SaJrdpwPqp9kteyNvyEoWzOprIuhBlxIGvv2002XoJTA69jHO81jd2ujjnGakkufWgmWMIp94x94DjUWlUn+VvBdGyJog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB7286.namprd11.prod.outlook.com (2603:10b6:8:13c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.30; Fri, 3 Mar
 2023 06:21:16 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8%7]) with mapi id 15.20.6156.018; Fri, 3 Mar 2023
 06:21:16 +0000
Date: Thu, 2 Mar 2023 22:21:13 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Message-ID: <20230303062113.n3bmnv3fg6uh6c2d@ldmartin-desk2.lan>
References: <20230302141230.2804699-1-jani.nikula@intel.com>
 <20230302141230.2804699-9-jani.nikula@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230302141230.2804699-9-jani.nikula@intel.com>
X-ClientProxiedBy: SJ0PR03CA0133.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::18) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB7286:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a56e214-85a8-44a4-9272-08db1baf7e5a
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DRz84Q3TaBOv8MRRZNdnSWMBTYTB8qpuDBDUJKR/n+oNfk+BcKP+iJwo+AvtgQfaYvFPHl/nwrgKkY+nAp45pt0MmJCkBqYtcUi/qnU3yOGpO7sjo+r8Cu1LFvLUPxJHFzapYjXitR0LsvnMkhtC7SYI880ypAwDaDsaOpNYK1GlroAbr7KtQhuiyrtBgLfVaBP1RSi3W8iEwXXXPtwAKMsJBXOYO+boB/7PW5pbN/gEwROrgJgorbq0PrecjQ1HWmIGMvNrSVi5WXjO/FfPasjTQ69TIjSPrdAfFoz6YeLC7p+NANDlOQovltmXGIL4JKE6HO/OHaTrkSX0efQp8GV6STZzj1020ajTa0HQZldOv/W1x7SdgIyg5XDxZ/MCReMVd0iB4MFT9k63zNCpj1vBuk16saGcJ/JV3OlR9bTZ1bkXODA+IxU9sjbQvMkNomElxzkokBshKH2zV4QqP1E1okkZepvEdKR7JGTg8s12E8yqFkS3QSSBgsj/eLnqxDsh1/4De+rwC1sj3xGfmp2Sr+kgh29376GYnkFPJGcSmd/jdUBPclB5ieY89H0x4yJT9VfMDcBhejA7yUeTAJTeHb/zN0QrsLP4opVD01Xz8ytOFJZjwpM+hI87aa1CiKbdi3w/0RYTZjwZeHH4XvD4Ab4WTsMpxycTGJfQmu3qfzouh6/sD+kx+6jYu4q/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(136003)(376002)(346002)(396003)(39860400002)(451199018)(38100700002)(8936002)(82960400001)(86362001)(4326008)(66556008)(8676002)(41300700001)(2906002)(66476007)(6862004)(66946007)(5660300002)(83380400001)(26005)(1076003)(186003)(6512007)(6506007)(9686003)(6486002)(316002)(6636002)(478600001)(6666004)(36756003)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?apINGbyCk7fyrBzzZMI9mY+KjiAOHPGqdYBJqvTWCGjwwtcVoAqfDYK7cCf7?=
 =?us-ascii?Q?TtnZ8aW3DcNRy6hDa+N6HYgckFp1XRDjkCaG6BkT73ezfkg3jvYdnrRoNI9+?=
 =?us-ascii?Q?XriXu+F//HVERCywicZVZSjXEtBiygRWvkXtDmkqmVDG71AIQ9ZNvMjuNcNV?=
 =?us-ascii?Q?8zBE+gn4sikpj9JEsnrMVy9sNfxKWV7uPBK3qjvYu0Vvp/oyHO5zS3iQclg0?=
 =?us-ascii?Q?iK9GI0xdlHFfFkMgcd3bgOvQr4RVndaV4ilNbLhxKPxR2tbUuKMuiAvvTn7a?=
 =?us-ascii?Q?r/amlOwc0csYl2yKSFCk4bMrKeluDgjOWWCs7359Ilned5q7AQBOCS/VUCTc?=
 =?us-ascii?Q?4WGp1kN2qe/ybHDaFyt/HW40voadlbi6gFbAeau2h71Il0UfaUXYHXXZuvk8?=
 =?us-ascii?Q?0244UAPehh/7Ssoe7JCG0FW9XxOUI+CGzLoLMSPHk+wdyVFsShFi96d8L1vW?=
 =?us-ascii?Q?RhHO0BnXZXcUJAsWC1h3Os2ni0OXbVfcPo5upES7zkJJbHl23TrshNZqJ/B7?=
 =?us-ascii?Q?cc87E1nDn7H11BHnrMfO9mye9uyXmuwT/4r88GHGBgHGKB3I+EABzaahLuLj?=
 =?us-ascii?Q?jI2UFseW7NpqpDSoEx2jgh6nSBZWsjE8cRf3hwTuNEik5Vk/u7y0dTbiRzR8?=
 =?us-ascii?Q?6/jCfMphnU6IhEZwdE334JxC/5dckPQZPBlWJ0bAYk8yxaybFHwGR5+KXuvf?=
 =?us-ascii?Q?kJR6iB+coCrcMAPP+PkZfXckQKmPltX4xA8trFgtR0ENoVK8Z3Ha9++qsCzZ?=
 =?us-ascii?Q?uyUl1Ykxfvd030EEKLYZjj8n5V8zkta7OVodpIwagFfHQFBMs3+EVvwFGezF?=
 =?us-ascii?Q?tpXgJ5E8i2ykDuhKLoOxEiSW8O4SOpt4Hxvxj1+4w+8rXeBIzedYuoex4oRB?=
 =?us-ascii?Q?qEQQ1exgewfLGuBlO6xbHJc3oQ3Cjqo8RsizuGO7Tl2woc2fkgwY82eYutzy?=
 =?us-ascii?Q?K9h7mI/jfMGGBulkH31cgJ41i+19/0NRMCzgoyZtMCWHHNmqbuLY0HhEMQPL?=
 =?us-ascii?Q?yz1G4ZUlL86NDG0ACQJNUz4zEcYPHy/6hk0oP6W2fznGeRk1SQEJq2/qVJuX?=
 =?us-ascii?Q?jSRrps5sS80hLwzmLDAOcxSOI59xlm2as3SITIpxsb/P7dKPloCkAbHi5WmC?=
 =?us-ascii?Q?3ybm0wmcO35X9pBOFFG4s5QQTE0WuZYLv/pVqrcOXc6R3pOzSt7HRg+KODcc?=
 =?us-ascii?Q?Ok0q0KDmNnqJBuBLzN6un9JPhVwlBpLxCfn9xXxrX/h4EDyzT0ZpJrtN4DE6?=
 =?us-ascii?Q?O/SEXyUpYP4HbtaAjRBccsycqvfn9M6Di3RoGVQve9AREp3jWpQxyKJX1CDm?=
 =?us-ascii?Q?Iw6MXaFKqKnfTXHlxhctWjQX7IyCQMNLcUH9cjJ1Jn0y1JRTF+7lnh7x3yna?=
 =?us-ascii?Q?inl7Iz2cxTGL1tt64l+eeY35Qtv7wMHpXqGzRbiKV6HNmbDWR96QKVXU73kW?=
 =?us-ascii?Q?aCyj0KXjDrGDrNKdHVAvUwCVFpVnwoTer7IaaUYbGecIDcfZOmkvGr2D8g96?=
 =?us-ascii?Q?KzOsCE5Kex8aDsIuGGy21uBZQAahLsK2oYhTE8c3gjfn2t+ntbs+I/fG8epv?=
 =?us-ascii?Q?FEPdtEYcmlMloDiVg4Pn48VJzqy5ihE8UrwDqVdk5gsqF5PbNmv2cumXO3P7?=
 =?us-ascii?Q?IQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a56e214-85a8-44a4-9272-08db1baf7e5a
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2023 06:21:15.8023 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +e5A+4yDvKtaU4rFvuuj4xhtTf6OKKW6zwUjL8TJ6pcMsNRr1DwPYK9Np5pqCaG50UbbO4ay3a0YT9DiyziUSinAULSh0kLqEzRfrVmDU7A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7286
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 8/8] drm/xe: drop top level i915 from include
 path
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

On Thu, Mar 02, 2023 at 04:12:30PM +0200, Jani Nikula wrote:
>Add stub headers under compat-headers/ to be explicit about which
>headers are needed from i915. These also act as a TODO list of what to
>fix. Remove top level i915 from include path.
>
>Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>---
> drivers/gpu/drm/xe/Makefile                           | 7 +++----
> drivers/gpu/drm/xe/compat-headers/i915_fixed.h        | 1 +
> drivers/gpu/drm/xe/compat-headers/i915_reg.h          | 1 +
> drivers/gpu/drm/xe/compat-headers/i915_reg_defs.h     | 1 +
> drivers/gpu/drm/xe/compat-headers/i915_utils.h        | 1 +
> drivers/gpu/drm/xe/compat-headers/intel_mchbar_regs.h | 1 +
> drivers/gpu/drm/xe/compat-headers/intel_pci_config.h  | 1 +
> drivers/gpu/drm/xe/display/intel_display_core.h       | 2 ++
> drivers/gpu/drm/xe/regs/xe_reg_defs.h                 | 2 +-
> 9 files changed, 12 insertions(+), 5 deletions(-)
> create mode 100644 drivers/gpu/drm/xe/compat-headers/i915_fixed.h
> create mode 100644 drivers/gpu/drm/xe/compat-headers/i915_reg.h
> create mode 100644 drivers/gpu/drm/xe/compat-headers/i915_reg_defs.h
> create mode 100644 drivers/gpu/drm/xe/compat-headers/i915_utils.h
> create mode 100644 drivers/gpu/drm/xe/compat-headers/intel_mchbar_regs.h
> create mode 100644 drivers/gpu/drm/xe/compat-headers/intel_pci_config.h
> create mode 100644 drivers/gpu/drm/xe/display/intel_display_core.h
>
>diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>index 42a34597f16c..166f47324377 100644
>--- a/drivers/gpu/drm/xe/Makefile
>+++ b/drivers/gpu/drm/xe/Makefile
>@@ -101,16 +101,15 @@ xe-y += xe_bb.o \
> # i915 Display compat #defines and #includes
> subdir-ccflags-$(CONFIG_DRM_XE_DISPLAY) += \
> 	-I$(srctree)/$(src)/display/ext \
>-	-I$(srctree)/$(src)/compat-headers \
> 	-I$(srctree)/drivers/gpu/drm/xe/display/ \
> 	-I$(srctree)/drivers/gpu/drm/i915/display/ \
>-	-I$(srctree)/drivers/gpu/drm/i915/ \
> 	-DBUILD_FOR_XE=1 \
> 	-Ddrm_i915_gem_object=xe_bo \
> 	-Ddrm_i915_private=xe_device
>
>-# XXX: Needed for i915 register definitions. Will be removed after xe-regs.
>-subdir-ccflags-y += -I$(srctree)/drivers/gpu/drm/i915/
>+# XXX: Needed for #include "display/intel_display_core.h" in xe_device_types.h
>+subdir-ccflags-y += \
>+	-I$(srctree)/$(src)/compat-headers


I don't think this can be removed now with the "Encapsulate display"
series applied... we should rather not drop it from the block
above.

Lucas De Marchi

>
> CFLAGS_display/intel_fbdev.o = $(call cc-disable-warning, override-init)
>
>diff --git a/drivers/gpu/drm/xe/compat-headers/i915_fixed.h b/drivers/gpu/drm/xe/compat-headers/i915_fixed.h
>new file mode 100644
>index 000000000000..e55fed3cbe9e
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/compat-headers/i915_fixed.h
>@@ -0,0 +1 @@
>+#include "../../i915/i915_fixed.h"
>diff --git a/drivers/gpu/drm/xe/compat-headers/i915_reg.h b/drivers/gpu/drm/xe/compat-headers/i915_reg.h
>new file mode 100644
>index 000000000000..36d863f4848b
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/compat-headers/i915_reg.h
>@@ -0,0 +1 @@
>+#include "../../i915/i915_reg.h"
>diff --git a/drivers/gpu/drm/xe/compat-headers/i915_reg_defs.h b/drivers/gpu/drm/xe/compat-headers/i915_reg_defs.h
>new file mode 100644
>index 000000000000..128a9a330c13
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/compat-headers/i915_reg_defs.h
>@@ -0,0 +1 @@
>+#include "../../i915/i915_reg_defs.h"
>diff --git a/drivers/gpu/drm/xe/compat-headers/i915_utils.h b/drivers/gpu/drm/xe/compat-headers/i915_utils.h
>new file mode 100644
>index 000000000000..a88a5196c79d
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/compat-headers/i915_utils.h
>@@ -0,0 +1 @@
>+#include "../../i915/i915_utils.h"
>diff --git a/drivers/gpu/drm/xe/compat-headers/intel_mchbar_regs.h b/drivers/gpu/drm/xe/compat-headers/intel_mchbar_regs.h
>new file mode 100644
>index 000000000000..f7c0585f277b
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/compat-headers/intel_mchbar_regs.h
>@@ -0,0 +1 @@
>+#include "../../i915/intel_mchbar_regs.h"
>diff --git a/drivers/gpu/drm/xe/compat-headers/intel_pci_config.h b/drivers/gpu/drm/xe/compat-headers/intel_pci_config.h
>new file mode 100644
>index 000000000000..741ef99dc0e4
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/compat-headers/intel_pci_config.h
>@@ -0,0 +1 @@
>+#include "../../i915/intel_pci_config.h"
>diff --git a/drivers/gpu/drm/xe/display/intel_display_core.h b/drivers/gpu/drm/xe/display/intel_display_core.h
>new file mode 100644
>index 000000000000..5be8d246ee27
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/display/intel_display_core.h
>@@ -0,0 +1,2 @@
>+/* FIXME: Remove once xe_device_types.h does not need this for CONFIG_DRM_XE_DISPLAY=n */
>+#include "../../i915/display/intel_display_core.h"
>diff --git a/drivers/gpu/drm/xe/regs/xe_reg_defs.h b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
>index 5f6735697d9c..631cd6d1ffa6 100644
>--- a/drivers/gpu/drm/xe/regs/xe_reg_defs.h
>+++ b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
>@@ -6,6 +6,6 @@
> #ifndef _XE_REG_DEFS_H_
> #define _XE_REG_DEFS_H_
>
>-#include "../../i915/i915_reg_defs.h"
>+#include "compat-headers/i915_reg_defs.h"
>
> #endif
>-- 
>2.39.1
>
