Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD413C6FD1C
	for <intel-xe@archiver.kernel.org>; Thu, 23 Mar 2023 04:35:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C11110E041;
	Thu, 23 Mar 2023 04:35:00 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92DEA10E041
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Mar 2023 04:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679546098; x=1711082098;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=hwAHt4RJl9IG7pBdKK/Pa95PbyiFRJGI9QxcBSLfqsQ=;
 b=ba/Bvfjjij2ktStQoNE+igBVdVFpAgZwDDQMNH3Rss9ioiytEDA4p0na
 db9rp1SXS4tkWXll/XmibjTk5CNLZdr3/wQYpK0b6lq8IVqVcWTj1OHUF
 pEa+CfhJxczNjfLAHSmiVF9ccIoJPuartwF8SdSg9h39w3xJb84VKh2Td
 +8g+9FIrhb57TKTUDPdUbBu+ahleR1sKhHVJuK25Wrg5NqoDi8jvNBydx
 J2ifqBRNe3SalRWN60vZWqgmcN23T9M0q7+rDI7g4Q15M6om6+4didXzn
 Jup/AqcYZ4Af78DJ29BGFrg1hRLMDrK3n/N04vs2a1Nlny5QJVjDdSKSb g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="340932412"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; d="scan'208";a="340932412"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 21:34:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="806109575"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; d="scan'208";a="806109575"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga004.jf.intel.com with ESMTP; 22 Mar 2023 21:34:57 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 22 Mar 2023 21:34:43 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 22 Mar 2023 21:34:43 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 22 Mar 2023 21:34:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nB084ArU+j6aPVmUWcpbdiYWr+1InHd8N8mN9c3a8M2BdEQQ4B4e6UrkwE5mRLIxCcs94jX6pJV7UMest1rDkBjWBJTdPSvsKmFhtbLbOmIs+wVF5FHlczjHPSWFRwAeI7qzKf2XBrnyXOQZw6XANncycxZW3Lmdi+V3/cedx2C/THihQGeexBheZXYQLJ0snXAa570gxT7TFB98XynBDtfdnViur4rfS1NcTBXeBAfkpqY1zjvKxhL0ttSuhfTZmuJPUVzA/mA+GG7mIjizINRX640HYEGA9bhRmxUd5Ip+azXIEI1pe0Cr3K8BNFX1Ig8ewDzxfl0eHPnohxp2xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K7mSLtQot6NmT0MyfKsKqm09NAgcmPB+vQTrpvZfL9A=;
 b=ONucXDDsMX+ZiyK0zKi20/Jx321XIj/TH+nONGAXDjZEyIdcT4X9c+cCXoPramDlinoapKTBE3QPwP0qbj+C3h8VbCqUbHg2Fjft1o9JXbBuqPVsxJ6c+6NU3kEKa9RAet13cqm4qNDxLWT7fkj+RzVXxggrqG8HJ64la+/tCzH2cEKrMjarmgF4KoB072nI/24qcjmzXc0gxbwSrqnc7ocWMwJFtBd1fGqrbxSWLU/4ZyB6A/KLjC6GgfXX2DXX1vtaYnaAD+sJGddmi8bTcZLYh72huqKA2J8MHSdxeRvyBxNdOX+8dMoQPnGGmnap9E0trciRpL9tX9iCyHOcOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB6393.namprd11.prod.outlook.com (2603:10b6:208:3ae::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Thu, 23 Mar
 2023 04:34:37 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%5]) with mapi id 15.20.6178.037; Thu, 23 Mar 2023
 04:34:37 +0000
Date: Wed, 22 Mar 2023 21:34:35 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Anusha Srivatsa <anusha.srivatsa@intel.com>
Message-ID: <20230323043435.woc2bwr5txncpyfo@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20230322232812.3624914-1-anusha.srivatsa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230322232812.3624914-1-anusha.srivatsa@intel.com>
X-ClientProxiedBy: BYAPR08CA0022.namprd08.prod.outlook.com
 (2603:10b6:a03:100::35) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB6393:EE_
X-MS-Office365-Filtering-Correlation-Id: 257eb960-525f-4ad6-c149-08db2b57e8dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9niNlLryJOSiBj/VXkNls3pGNpXMjmFthDu7tGZNn2fz9WFfU0Fkm2kFVzLa3KL45hJQelrf/yrjL9wLDgFBmG20bdteatl20SYcIUwD2w/Ji4UE6zdA0PjsPbimi3kiyL/QDB3GudHqRQ5EAOawGQuRsfkDkTV4e0P9bl93m7QH/oDJI0it3YODMIxOJuG/8RX+jX/Xo1L/BbG4Z9zkjs3lPDaKPyV3fs+NR3ZZu/blFz8eO8W6hzsH9eqwTcGJAszWlAwYdQdWFm2wvlFW9cmTRT9FS4qo6Tb3K0slsaL2Yc9Zsv8hGnY8BBNswxRWdxWlu5twxMtmtdqDvFpXJBcJOOgBQGR95aGsZMcGhf+Xu+V65OFdVvsbsuUCBJgEDArxxWAVFXDmbhGQT4e7wETsakRs/rI+BkIS+oeatd9NbQ66VACH4lDyR06NS/71lyqjW8LbCsBwQqj6UUuHt/mil7Td42baDc5Sh9gRO1YmTOEZ4jAKJBjnTTlbK22fycxCuCeAcl0Atih9/rxua60Ktd8ArfwpCZ9vmbEbzeIF2qluysXazoo/c/5PGZswGwTgs5TLHtKXmhlqKFgfeYtyu90du09wJw5igvVnY11UZMk/AhOu3UL8IXS6+zcK8bGPlGSdH/zIbnhV5sMvOg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(346002)(39860400002)(136003)(366004)(376002)(451199018)(36756003)(86362001)(82960400001)(38100700002)(2906002)(66476007)(41300700001)(4326008)(5660300002)(8676002)(8936002)(6862004)(66556008)(9686003)(186003)(6512007)(83380400001)(66946007)(6506007)(1076003)(6636002)(316002)(478600001)(107886003)(6486002)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?c0ALizzTsGZOrDn5qNEZFAGPtRaYpSqmY8tmoazHUnKlLTRtFWsMBfbGcjoq?=
 =?us-ascii?Q?sTHr2cRaS2lpx7qYXRdEffMZ+fzAwoNzFf8lGXSqz3oG0ctGTU6bQEExEsGX?=
 =?us-ascii?Q?cUaxhbOMxgbNJaJejdv15lqRVTSgL2UHLgnFL5KK2csLskWnz3GV3TJR//S0?=
 =?us-ascii?Q?xaFLGh2TnqptvJ3WXq8O2vgQ099k6jvqBYwgiXOvBXwYAYenXJlGathndZnL?=
 =?us-ascii?Q?G4drfI4xJj/15TwejhwtFmzfzjBodIkC8XtlprEOujJNjXhRAKNPyM+TmAvr?=
 =?us-ascii?Q?2CRQDmBfdyBWv4mvKUkkQUGDPNkWT8Bgd2IV3pnRDWVp0jQik5kBrOtbBkLe?=
 =?us-ascii?Q?j9NChdZDTHDYg8lZf1xc9+vgQ+jMRzF7CulQYQbzUHKOertptXp0TWua+KNb?=
 =?us-ascii?Q?aJhsGQkQSL1D0x9NuRMblw+uu7UrT2YSdFkBqAT+gZV7RMnU6kB9G9V8jolI?=
 =?us-ascii?Q?7IUQhLC93UD0su94fuUVpunXkMftsYOqu9w7lMgSRSFhMJ4zh5x+W38GLVEr?=
 =?us-ascii?Q?tZEgGxZqd+ajMPNokhOn81RKFC1EzvJLUXm/32GTuo3jedCFxgQJGVboDNvB?=
 =?us-ascii?Q?wSESb2pu/ELyrBnS3a4OCFow9mIArq4unY1ei8EHhzPfXJA9KuOoXYT02iCl?=
 =?us-ascii?Q?WwLdBDh8XMBjcutHtmo/V6+hds9hi1CzfhNn/ZiEionaQeBALX7CqrZrHd1Z?=
 =?us-ascii?Q?qtWMhRxTcf5v8xNP2b+aM8aYqo+y8ywfg4+TRy+IRKR/SAWjscX0h4X3dQOs?=
 =?us-ascii?Q?0d90aqE6JuoqeKq7ys0CwIwG5K6fMFABeGURnWvjXiJbm17R9i8uMn9QqG6X?=
 =?us-ascii?Q?JrpcsZgnQO4nnBXN4J4pf8tdCl3S/Wctd+81Epo9Ogt2iOkwGklRGQHFIDwp?=
 =?us-ascii?Q?JvkTqeEIavbfVP4/apoMX40aclBVe694vJ9vNe6+B010XXIQGlbkRik1Qono?=
 =?us-ascii?Q?Nu1AzS6F6Xy3ic/juY4oRewUWd5lrfVBle/IwScwQbqP065I6ZTN/XEuFwdF?=
 =?us-ascii?Q?uNzWlkg6Y+HvxXpAT6spBocjgoxSPcgJntaAkOpKIVmetWgYxi1W38X8wuFS?=
 =?us-ascii?Q?k98sHQ29KJE9YzSNiKPpIS5Dg2Exz7kKqiwZZbinmfgopoLANXmt2TgY+wmN?=
 =?us-ascii?Q?R1IS9UWBJ/F7f1fNzqvYyS9JoM3JR1jDI+UbAkyAMoL5lRCPXhl+7pYbBH06?=
 =?us-ascii?Q?x++jX++XrZgOMH1aYQxk1W9y/Q3KFFFuNoh3Qat96/4T2WmAZhHCROaX4OP0?=
 =?us-ascii?Q?2cZp7p0Y25AfLxgcVy1EN3ZfFs3iS2AFFrNO+Y0G2QL4q8qmwCkAuZgVWkWp?=
 =?us-ascii?Q?c0aQXl0f2WgRkDt3RQsOsO2lWKTZ6VuyeMORlMOjfsmYbzo+QomWLg5KamwS?=
 =?us-ascii?Q?ef8dMmRuaHmvqkgsq1HynNASqgQ1nucRySES+l8kS4grmyagARmLEwAsB2hD?=
 =?us-ascii?Q?oKTNQ5xQj7P3WHTAFqmw30gjfTBq4MJUJGbg/JSOX7CE6WDihuIJ4t1TiuVG?=
 =?us-ascii?Q?xTI5UNNgWuJK/g+KLZrsF+1yWrVKTQXh6VfTs4wdpEI91R/sq4rwDQUnp9W6?=
 =?us-ascii?Q?VvZsrD8jsGCLPvHCy69BxIGg2pFLNlBm45yUZuKvWT89E6xadcZvnfB68Qqh?=
 =?us-ascii?Q?QA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 257eb960-525f-4ad6-c149-08db2b57e8dd
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2023 04:34:37.4408 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ecGafowbIvuVXbalYEhqjPoJ4Pm9Jm9EQXvSWYB7m34lx0gTX3NFts3zcfn2ja11hXV2bg8SAKX3bvjlkjezmZnnZ9qFTjsCr1nL4Mqssiw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6393
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/3] drm/xe/huc: Macro support for loading
 unversiond HuC
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
Cc: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Mar 22, 2023 at 04:28:10PM -0700, Anusha Srivatsa wrote:
>Follow the new direction of firmware and add macro
>support for loading unversioned HuC. Keep HuC
>versioned loading support as well for platforms
>that fall under force_probe support
>
>Add check to ensure driver does not do any version check
>for HuC if going through unversioned load.
>
>v2: unversioned firmware to be the default for platforms
>not under force_probe. Maintain versioned firmware macro support
>for platforms under force-probe protection.
>
>Cc: Matt Roper <matthew.d.roper@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>Signed-off-by: Anusha Srivatsa <anusha.srivatsa@intel.com>
>---
> drivers/gpu/drm/xe/xe_uc_fw.c | 43 +++++++++++++++++++++++------------
> 1 file changed, 28 insertions(+), 15 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
>index 00408f1b73e1..4ade5b1b6d31 100644
>--- a/drivers/gpu/drm/xe/xe_uc_fw.c
>+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>@@ -50,15 +50,19 @@ static struct xe_device *uc_fw_to_xe(struct xe_uc_fw *uc_fw)
> 	fw_def(DG1,          0, guc_def(dg1,  70, 5, 2)) \
> 	fw_def(TIGERLAKE,    0, guc_def(tgl,  70, 5, 2))
>
>-#define XE_HUC_FIRMWARE_DEFS(fw_def, huc_def) \
>-	fw_def(DG1,          0, huc_def(dg1,  7, 9, 3)) \
>-	fw_def(TIGERLAKE,    0, huc_def(tgl,  7, 9, 3))
>+#define XE_HUC_FIRMWARE_DEFS(fw_def, huc_def, huc_ver) \
>+	fw_def(DG1,          0, huc_def(dg1)) \
>+	fw_def(TIGERLAKE,    0, huc_def(tgl))
>
> #define __MAKE_UC_FW_PATH_MAJOR(prefix_, name_, major_) \
> 	"i915/" \
> 	__stringify(prefix_) "_" name_ "_" \
> 	__stringify(major_) ".bin"
>
>+#define __MAKE_HUC_FW_PATH(prefix_, name_) \

this name

>+        "i915/" \
>+        __stringify(prefix_) "_" name_ ".bin"
>+
> #define __MAKE_UC_FW_PATH(prefix_, name_, major_, minor_, patch_) \

clashes with this name. I suppose you mentioned to have

__MAKE_UC_FW_PATH_VERSIONED() vs __MAKE_UC_FW_PATH()

>         "i915/" \
>        __stringify(prefix_) name_ \
>@@ -69,15 +73,19 @@ static struct xe_device *uc_fw_to_xe(struct xe_uc_fw *uc_fw)
> #define MAKE_GUC_FW_PATH(prefix_, major_, minor_, patch_) \
> 	__MAKE_UC_FW_PATH_MAJOR(prefix_, "guc", major_)
>
>-#define MAKE_HUC_FW_PATH(prefix_, major_, minor_, bld_num_) \
>-	__MAKE_UC_FW_PATH(prefix_, "_huc_", major_, minor_, bld_num_)
>+#define MAKE_HUC_FW_PATH(prefix_) \
>+	__MAKE_HUC_FW_PATH(prefix_, "huc")
>+
>+#define MAKE_HUC_FW_VERSION_PATH(prefix_, major_, minor_, patch_) \
>+	__MAKE_UC_FW_PATH(prefix_, "huc", major_, minor_, patch_)
>+
>
> /* All blobs need to be declared via MODULE_FIRMWARE() */
> #define XE_UC_MODULE_FW(platform_, revid_, uc_) \
> 	MODULE_FIRMWARE(uc_);
>
> XE_GUC_FIRMWARE_DEFS(XE_UC_MODULE_FW, MAKE_GUC_FW_PATH)
>-XE_HUC_FIRMWARE_DEFS(XE_UC_MODULE_FW, MAKE_HUC_FW_PATH)
>+XE_HUC_FIRMWARE_DEFS(XE_UC_MODULE_FW, MAKE_HUC_FW_PATH, MAKE_HUC_FW_VERSION_PATH)
>
> /* The below structs and macros are used to iterate across the list of blobs */
> struct __packed uc_fw_blob {
>@@ -93,9 +101,12 @@ struct __packed uc_fw_blob {
> 	UC_FW_BLOB(major_, minor_, \
> 		   MAKE_GUC_FW_PATH(prefix_, major_, minor_, patch_))
>
>-#define HUC_FW_BLOB(prefix_, major_, minor_, bld_num_) \
>+#define HUC_FW_BLOB(prefix_) \
>+	UC_FW_BLOB(0, 0, MAKE_HUC_FW_PATH(prefix_))
>+
>+#define HUC_FW_VERSION_BLOB(prefix_, major_, minor_, bld_num_) \
> 	UC_FW_BLOB(major_, minor_, \
>-		   MAKE_HUC_FW_PATH(prefix_, major_, minor_, bld_num_))
>+		   MAKE_HUC_FW_VERSION_PATH(prefix_, major_, minor_, bld_num_))

I think this is getting super complex and hard to follow and it still
doesn't fix the guc situation :(

>
> struct __packed uc_fw_platform_requirement {
> 	enum xe_platform p;
>@@ -122,7 +133,7 @@ uc_fw_auto_select(struct xe_device *xe, struct xe_uc_fw *uc_fw)
> 		XE_GUC_FIRMWARE_DEFS(MAKE_FW_LIST, GUC_FW_BLOB)
> 	};
> 	static const struct uc_fw_platform_requirement blobs_huc[] = {
>-		XE_HUC_FIRMWARE_DEFS(MAKE_FW_LIST, HUC_FW_BLOB)
>+		XE_HUC_FIRMWARE_DEFS(MAKE_FW_LIST, HUC_FW_BLOB, HUC_FW_VERSION_BLOB)
> 	};
> 	static const struct fw_blobs_by_type blobs_all[XE_UC_FW_NUM_TYPES] = {
> 		[XE_UC_FW_TYPE_GUC] = { blobs_guc, ARRAY_SIZE(blobs_guc) },
>@@ -299,15 +310,17 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
> 	uc_fw->minor_ver_found = FIELD_GET(CSS_SW_VERSION_UC_MINOR,
> 					   css->sw_version);
>
>-	if (uc_fw->major_ver_found != uc_fw->major_ver_wanted ||
>-	    uc_fw->minor_ver_found < uc_fw->minor_ver_wanted) {
>-		drm_notice(&xe->drm, "%s firmware %s: unexpected version: %u.%u != %u.%u\n",
>-			   xe_uc_fw_type_repr(uc_fw->type), uc_fw->path,
>-			   uc_fw->major_ver_found, uc_fw->minor_ver_found,
>-			   uc_fw->major_ver_wanted, uc_fw->minor_ver_wanted);
>+	if (uc_fw->major_ver_wanted) {
>+		if (uc_fw->major_ver_found != uc_fw->major_ver_wanted ||
>+		    uc_fw->minor_ver_found < uc_fw->minor_ver_wanted) {
>+			drm_notice(&xe->drm, "%s firmware %s: unexpected version: %u.%u != %u.%u\n",
>+				   xe_uc_fw_type_repr(uc_fw->type), uc_fw->path,
>+				   uc_fw->major_ver_found, uc_fw->minor_ver_found,
>+				   uc_fw->major_ver_wanted, uc_fw->minor_ver_wanted);
> 		if (!xe_uc_fw_is_overridden(uc_fw)) {
> 			err = -ENOEXEC;
> 			goto fail;
>+			}

missing indentation in the whole block.

I think this may work for HuC, but I think we will need to rewrite parts
of what this is doing here as it's getting very complex.

Lucas De Marchi

> 		}
> 	}
>
>-- 
>2.25.1
>
