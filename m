Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BEBDC678D4
	for <intel-xe@archiver.kernel.org>; Fri,  3 Mar 2023 06:30:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30C8410E5EE;
	Fri,  3 Mar 2023 06:30:34 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8371C10E5EE
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Mar 2023 06:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677825030; x=1709361030;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=VR9zwLMbWdx7KsUmWftlvRoSm3Og7Y0BXCrxFGaj5Gk=;
 b=bJMKQNkfTh85S9sYGFOezImz2mRI9o88HRarw3hD6evRQv0EfBjnMNhn
 ujP50YsYxMM9cmqja5Cwv9WHM9hPPC3q7BCQtPTrTy689Lp62eMW0lxtY
 IOdeAowbVlb2bMlrGweIAwBwvWSOR0fDxBH87ocPTeyqjSgAdunNqeyMs
 BAWHMN0vmnw44A2+LvjSya21+ImxBwdjRCu6G9T4Xumd/8lfpz54khpMK
 LCHZCm9CNBR/m/sF1jYpVdJjX6PwriryR2FPo9K5YOLmAJxCHAvEkQPKv
 1PZuPkrUj9/zWce4qM5kWtUtw/4SzZNQEdxCgYU1JuIzpcrlYuDjOVfeS A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="397559652"
X-IronPort-AV: E=Sophos;i="5.98,229,1673942400"; d="scan'208";a="397559652"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2023 22:30:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="705535490"
X-IronPort-AV: E=Sophos;i="5.98,229,1673942400"; d="scan'208";a="705535490"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga008.jf.intel.com with ESMTP; 02 Mar 2023 22:30:31 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 2 Mar 2023 22:30:30 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 2 Mar 2023 22:30:30 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 2 Mar 2023 22:30:30 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.103)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 2 Mar 2023 22:30:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UU+zWyQWyTMl06U5zY2mcGuMCVkd5NUZbpPGszD6wJShoRbs3XJHFS4ZMH8C8dHY9BvvG4HXn9zeCGFdkC9JaZqTuBad5bEVpbxyUycg6jkmEtNbntm9aYdDN2/mLPGyo+DUOTsA5eEv6maF+dXpjtJumzErzleV8/SaCzrO9TqDYuFTVOrRbMwNuzOpL8ivKXSp1poXMuARHUsGAEYe/RNa0wU6yZuzf01imyxqMwUU+jV6FLZEg2ugoKwjbHdrANf0t6sAESpI/PKOqWW/1F+8xsoGT7/maYwM08TS0gaTyoqjq7T8o6oEnBAodWL+kYA69kLLaCb9FWgJeCoscg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ERUfjtmANiyyb7Re6TLAjJrO6LmUcowKKB7VxiQZ148=;
 b=XZ+OgBRQkFMiUpNkKSDeph3kPrL8aMaXmeMSxoePVCQ3m6yHBbrXG+GBqdGTHR6MkdVPbRUREi8HTDXqBAR3JmODM0AZrhh3dFS026veE6gS2vBP4wK0KKXJ7O8dLwByBdbTmRUfogjwDObwTsYncV+GPaE3Ywq4X5As69wiW5lHhD8a75M8nXnq2XDktEUpxwkKM6TKUq2hMUY4kSx5JnUAvMqGYQDV7CrB/BdcDAFjlPGk3Gt60wAAhrBT5Sq2fggOE0uppKZoAzCSHiKbWpwcVXUjHNsrndE+j6LWzl+UZUM8iNkidEbAtG5EtBcXd4NqLdPXUt3QUVVQPZljag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB6673.namprd11.prod.outlook.com (2603:10b6:510:1ab::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.30; Fri, 3 Mar
 2023 06:30:27 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8%7]) with mapi id 15.20.6156.018; Fri, 3 Mar 2023
 06:30:20 +0000
Date: Thu, 2 Mar 2023 22:30:18 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Message-ID: <20230303063018.ga5hqckqv644vts4@ldmartin-desk2.lan>
References: <20230302141230.2804699-1-jani.nikula@intel.com>
 <20230302141230.2804699-9-jani.nikula@intel.com>
 <20230303062113.n3bmnv3fg6uh6c2d@ldmartin-desk2.lan>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230303062113.n3bmnv3fg6uh6c2d@ldmartin-desk2.lan>
X-ClientProxiedBy: BY5PR16CA0024.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::37) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB6673:EE_
X-MS-Office365-Filtering-Correlation-Id: 154660b3-20da-44c7-63f5-08db1bb0c2da
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Katw2cycKHS8vQP5upBG4hLETThBU3dGHYEv+Vb0bejadAwLxXUU99Rdsen60L005fA2xeyBUV25z2d0Ztm6MzSwqiMJer/vDJBJtthR+2OqvtiH16UyoJlWaUrch45zrd2QDJuzbGzC4eHa4aKO7SCYJGqYyULCu/bRXUD2QgxoP2MWzK7H6ujLn9v0gj/JLzhUKGWtSpq+XyYcfzSWZA0h+yfGx2jVabhXVfw0NRqhkfp0Ds1Vczr/lZlGItbMu/h8+d41NaOhUgl33BNCg53VUEA7j3IXVaFc8VWW2LRyL8caurBSEPWSa7lxegPNp/HR4OZ5yQiJnuQgDRxtkigaQkRKqOpEGeOm1rahRVLkkgQR13C+Z8T/xzLPELoACRNVBXKnlIoSYFiAAARrX/wpfHBp/50T7h9D2oEleMTN0Q3v7OIJ4aJSvzu+2znVLTHYkEdZwIad29ahz9FbrpHf/AXm5vPbCVsS9hRkT0CoHlRAEMApr8+alvKk0bwR9qnAfNUVPwnVWmSSjzLq/TO1WE2OP0c8GDNkMnY1LEloVKs7sSbeijvytDMONbtXtR+fHiYwf6kWwFbapokBnMZdtUfKZVq5gaAMBV2CgXDPacjZp2ok8+3WHLMy/daqFIyp3wxy5cWndeYTVE7K6Fcx8uRYzcjf8t2AyzXfOYodySOQfoQ/z5w02hSdlc8M
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(136003)(366004)(376002)(396003)(346002)(39860400002)(451199018)(36756003)(66946007)(82960400001)(38100700002)(86362001)(5660300002)(8936002)(66476007)(2906002)(41300700001)(66556008)(8676002)(4326008)(6862004)(83380400001)(1076003)(26005)(186003)(6636002)(6512007)(6486002)(9686003)(6506007)(478600001)(316002)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZXFfRzfb6iwTb9wbc4y0+63lbSrxGHpIVhuIbIc1Tr/aNHYH6JfGPubaJAqQ?=
 =?us-ascii?Q?IldaSwO53fEW/RmCbYW9nC2laEwGHsr0OgF+KcXhaF9pO7u4Nt5wkeJNYMb7?=
 =?us-ascii?Q?C34rXn5iDKaR3yAjp5uA8zjLZoXnh/4xaQjIq8D7qjsPMzEycPWD2JfCPIiK?=
 =?us-ascii?Q?1P6j5tXwhtrq3US+VL3r7wWKbb208Y+8Ib7DFdTvsd6ZIYXlaX1VrcHuenfJ?=
 =?us-ascii?Q?/Qn4ki4B0IICha6g848EX9B/CQnSiSsYjDw33o3MfNDgG0DG2pY+1Cgd6yGw?=
 =?us-ascii?Q?74uFmPKUWlRL6qRCkpJp4ZL61trMmGDKXR2oheFt3RTmcwdBrZKsznbYvAyK?=
 =?us-ascii?Q?pfHWq9SLB7ADyYsf9w+UDL4Wqs64Marp1eVEYZqVQvwQS4W56HrRZdlZwm6z?=
 =?us-ascii?Q?zYLzyO5YLzYqUvDKx6HJahln1hXVDNQaJc1mZrPJYJzrBoI9kEeeD5hTrlJ/?=
 =?us-ascii?Q?H1bhn7HjDIyAxl9jvTzwXQcI8lhQCNop/zKn9fmO2VBypGBBFc4Cv4YSq4ts?=
 =?us-ascii?Q?pmfCad/xIMG6r08WG4cI+gdPnmR9OosiMyJR4YboNPvwU6OzNzP5TLjBFw8z?=
 =?us-ascii?Q?Ec5CIUNZL28/rmmHoxBUB0IZ+vVcWyKgc3Hhowk5e7py4xETsrrWZvx9ZFGZ?=
 =?us-ascii?Q?xnGGbSEAqwJ4mc0t7KNh4WwQMOjJtcLRKGFq89PdwV6E9/wojAndAu/r5IWq?=
 =?us-ascii?Q?7o0O18GYXisT+QDRxbfOKTirmEZ65u10ogldqwc66QebMMyAyrjqGoDMAE1Y?=
 =?us-ascii?Q?UvgpP6/40HW5hHLExYShnsyzmeDWd09i9sanLx4sadQTtLrCusL4ENKPbzJw?=
 =?us-ascii?Q?JZgOFlriZgI3YE8wTG6K3bRxlMvzdDORZ80Id4YvyDlWcy9ZHfKM0rRqen/m?=
 =?us-ascii?Q?qk0blVMenlrZM81BlEp1WWzZBNFhMQ51hIWB0KQFqEeYHR3E2fNyb2sBPVdM?=
 =?us-ascii?Q?aADN7llH7WPrWaE6IgXG/jnMlzJfcOdgZDzM+O6+uzLagTCkcGyepaR/4IfC?=
 =?us-ascii?Q?EZzeFEEnc07hNi4BN8QiFpP4FUhy45Ig3zXylfZnXyZeksjRtWmuTVJzfiLH?=
 =?us-ascii?Q?mKtx4Uiy7F4vHhgnuEOLKtigdnKWxNkFyUI7VPL/63o2OnQUPDL2IHLb5U9T?=
 =?us-ascii?Q?2q1veW/ApSfd021aPXkxWibOKZSCq2Oa8tS1HxC3dytH2K3ubyR9n1FF4NO3?=
 =?us-ascii?Q?x72GT3tupFDsedmdphyEUzAycHYdGhAnko6l30kDPKTp0FXszO3SvWjJne+E?=
 =?us-ascii?Q?523UhjTYkjQAR7J15MFOIv3KuthCEc+DXYpm6lLxOhNTToJCGnHu8UDeH9Mt?=
 =?us-ascii?Q?zYqfmFAtIF5oVOIQQK55jkSMKywBVs5V5F96+Kvt2hpjwFIKF53RHkIgss56?=
 =?us-ascii?Q?V+ufQNCpH7qq/CtNcuX/PXCeNgJjXnTuHt6H+2oXFS9X3ocV7ukYZsBOgQWM?=
 =?us-ascii?Q?RG2nhCZZu2WUnlzIU1/bBIlfA3UDTZQUFfQSqErcyblPITcf2yu/kKvyGuTZ?=
 =?us-ascii?Q?nNNlzH589QHHCuB0GVu2cEGIXNBU8ArG3dIF47wYi3ckvUl8L/TtmzeiwSRH?=
 =?us-ascii?Q?UhWVkM/fhMHFjWUb3KlqxLbMnPDAAOiZYYN858s5nOBR0oUA+pWO0AzGYt47?=
 =?us-ascii?Q?Sw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 154660b3-20da-44c7-63f5-08db1bb0c2da
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2023 06:30:20.4561 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qPEMa7EmlWif9SBfbF2rUFaBgSeErpJUy4OgeshBDVs9lczaNA1hxjoe8/ArDZsxAZ8JtmILktFG98zED4mNOPtDzLJIhweUAih69UcIzqU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6673
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

On Thu, Mar 02, 2023 at 10:21:13PM -0800, Lucas De Marchi wrote:
>On Thu, Mar 02, 2023 at 04:12:30PM +0200, Jani Nikula wrote:
>>Add stub headers under compat-headers/ to be explicit about which
>>headers are needed from i915. These also act as a TODO list of what to
>>fix. Remove top level i915 from include path.
>>
>>Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>>---
>>drivers/gpu/drm/xe/Makefile                           | 7 +++----
>>drivers/gpu/drm/xe/compat-headers/i915_fixed.h        | 1 +
>>drivers/gpu/drm/xe/compat-headers/i915_reg.h          | 1 +
>>drivers/gpu/drm/xe/compat-headers/i915_reg_defs.h     | 1 +
>>drivers/gpu/drm/xe/compat-headers/i915_utils.h        | 1 +
>>drivers/gpu/drm/xe/compat-headers/intel_mchbar_regs.h | 1 +
>>drivers/gpu/drm/xe/compat-headers/intel_pci_config.h  | 1 +
>>drivers/gpu/drm/xe/display/intel_display_core.h       | 2 ++
>>drivers/gpu/drm/xe/regs/xe_reg_defs.h                 | 2 +-
>>9 files changed, 12 insertions(+), 5 deletions(-)
>>create mode 100644 drivers/gpu/drm/xe/compat-headers/i915_fixed.h
>>create mode 100644 drivers/gpu/drm/xe/compat-headers/i915_reg.h
>>create mode 100644 drivers/gpu/drm/xe/compat-headers/i915_reg_defs.h
>>create mode 100644 drivers/gpu/drm/xe/compat-headers/i915_utils.h
>>create mode 100644 drivers/gpu/drm/xe/compat-headers/intel_mchbar_regs.h
>>create mode 100644 drivers/gpu/drm/xe/compat-headers/intel_pci_config.h
>>create mode 100644 drivers/gpu/drm/xe/display/intel_display_core.h
>>
>>diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>>index 42a34597f16c..166f47324377 100644
>>--- a/drivers/gpu/drm/xe/Makefile
>>+++ b/drivers/gpu/drm/xe/Makefile
>>@@ -101,16 +101,15 @@ xe-y += xe_bb.o \
>># i915 Display compat #defines and #includes
>>subdir-ccflags-$(CONFIG_DRM_XE_DISPLAY) += \
>>	-I$(srctree)/$(src)/display/ext \
>>-	-I$(srctree)/$(src)/compat-headers \
>>	-I$(srctree)/drivers/gpu/drm/xe/display/ \
>>	-I$(srctree)/drivers/gpu/drm/i915/display/ \
>>-	-I$(srctree)/drivers/gpu/drm/i915/ \
>>	-DBUILD_FOR_XE=1 \
>>	-Ddrm_i915_gem_object=xe_bo \
>>	-Ddrm_i915_private=xe_device
>>
>>-# XXX: Needed for i915 register definitions. Will be removed after xe-regs.
>>-subdir-ccflags-y += -I$(srctree)/drivers/gpu/drm/i915/
>>+# XXX: Needed for #include "display/intel_display_core.h" in xe_device_types.h
>>+subdir-ccflags-y += \
>>+	-I$(srctree)/$(src)/compat-headers
>
>
>I don't think this can be removed now with the "Encapsulate display"
>series applied... we should rather not drop it from the block
>above.
>
>Lucas De Marchi
>
>>
>>CFLAGS_display/intel_fbdev.o = $(call cc-disable-warning, override-init)
>>
>>diff --git a/drivers/gpu/drm/xe/compat-headers/i915_fixed.h b/drivers/gpu/drm/xe/compat-headers/i915_fixed.h
>>new file mode 100644
>>index 000000000000..e55fed3cbe9e
>>--- /dev/null
>>+++ b/drivers/gpu/drm/xe/compat-headers/i915_fixed.h
>>@@ -0,0 +1 @@
>>+#include "../../i915/i915_fixed.h"
>>diff --git a/drivers/gpu/drm/xe/compat-headers/i915_reg.h b/drivers/gpu/drm/xe/compat-headers/i915_reg.h
>>new file mode 100644
>>index 000000000000..36d863f4848b
>>--- /dev/null
>>+++ b/drivers/gpu/drm/xe/compat-headers/i915_reg.h
>>@@ -0,0 +1 @@
>>+#include "../../i915/i915_reg.h"
>>diff --git a/drivers/gpu/drm/xe/compat-headers/i915_reg_defs.h b/drivers/gpu/drm/xe/compat-headers/i915_reg_defs.h
>>new file mode 100644
>>index 000000000000..128a9a330c13
>>--- /dev/null
>>+++ b/drivers/gpu/drm/xe/compat-headers/i915_reg_defs.h
>>@@ -0,0 +1 @@
>>+#include "../../i915/i915_reg_defs.h"
>>diff --git a/drivers/gpu/drm/xe/compat-headers/i915_utils.h b/drivers/gpu/drm/xe/compat-headers/i915_utils.h
>>new file mode 100644
>>index 000000000000..a88a5196c79d
>>--- /dev/null
>>+++ b/drivers/gpu/drm/xe/compat-headers/i915_utils.h
>>@@ -0,0 +1 @@
>>+#include "../../i915/i915_utils.h"
>>diff --git a/drivers/gpu/drm/xe/compat-headers/intel_mchbar_regs.h b/drivers/gpu/drm/xe/compat-headers/intel_mchbar_regs.h
>>new file mode 100644
>>index 000000000000..f7c0585f277b
>>--- /dev/null
>>+++ b/drivers/gpu/drm/xe/compat-headers/intel_mchbar_regs.h
>>@@ -0,0 +1 @@
>>+#include "../../i915/intel_mchbar_regs.h"
>>diff --git a/drivers/gpu/drm/xe/compat-headers/intel_pci_config.h b/drivers/gpu/drm/xe/compat-headers/intel_pci_config.h
>>new file mode 100644
>>index 000000000000..741ef99dc0e4
>>--- /dev/null
>>+++ b/drivers/gpu/drm/xe/compat-headers/intel_pci_config.h
>>@@ -0,0 +1 @@
>>+#include "../../i915/intel_pci_config.h"
>>diff --git a/drivers/gpu/drm/xe/display/intel_display_core.h b/drivers/gpu/drm/xe/display/intel_display_core.h
>>new file mode 100644
>>index 000000000000..5be8d246ee27
>>--- /dev/null
>>+++ b/drivers/gpu/drm/xe/display/intel_display_core.h
>>@@ -0,0 +1,2 @@
>>+/* FIXME: Remove once xe_device_types.h does not need this for CONFIG_DRM_XE_DISPLAY=n */
>>+#include "../../i915/display/intel_display_core.h"

this comment is not very accurate. This can only be removed when/if we
get to remove completely the display headers from xe_device_types.h. If
you remove this now, it will break with CONFIG_DRM_XE_DISPLAY=y

Lucas De Marchi

>>diff --git a/drivers/gpu/drm/xe/regs/xe_reg_defs.h b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
>>index 5f6735697d9c..631cd6d1ffa6 100644
>>--- a/drivers/gpu/drm/xe/regs/xe_reg_defs.h
>>+++ b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
>>@@ -6,6 +6,6 @@
>>#ifndef _XE_REG_DEFS_H_
>>#define _XE_REG_DEFS_H_
>>
>>-#include "../../i915/i915_reg_defs.h"
>>+#include "compat-headers/i915_reg_defs.h"
>>
>>#endif
>>-- 
>>2.39.1
>>
