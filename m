Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0333FC3DA49
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jul 2024 17:12:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD2E210EB12;
	Thu, 11 Jul 2024 17:12:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IAuC4k2u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15A2410EB1F
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jul 2024 17:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720717942; x=1752253942;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=2qCHo7H4ckphJePoQjyQvzLKonLF/CdsQdTuhbYULf8=;
 b=IAuC4k2utH5V0Lg6pEfzkOh9D6owho1vOuzdTodQDAZK/nX3gAsiKEbp
 bY9St/+WX/WewUKfxDjvV8gCQNP1Q9v8Syy0FiIyys5nbsVpdkL05RoNK
 5XQUA7BA5ethbeM97OQWMWJlIMowrPhEi7KEA7we6CG2qo5U1I+K6fo6Z
 t6buCrRTRwZ4DDMwMjs5mSaEqfDDlNTZMsUy1O54knxBUWA6U4Ifbmjvh
 U6CLlz/1mRXt9cd5RHWerRWNgFR13E8JWsduSXakynyheTCnRD5XuKwxl
 goBOubp2pxdUmkwicC+Pich0rurluod5KqH4sR3IcvH1NCjIwEv/R02e8 g==;
X-CSE-ConnectionGUID: rnQx4yocRY20svk4lKHHyg==
X-CSE-MsgGUID: 0DpWYf/CRLiDqC9WAq7RaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="35553784"
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; d="scan'208";a="35553784"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 10:12:13 -0700
X-CSE-ConnectionGUID: oWlYdqAVQim9apnCAqslYQ==
X-CSE-MsgGUID: nn4r19l6RyWM3ooO3iOndg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; d="scan'208";a="48633002"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Jul 2024 10:12:13 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 11 Jul 2024 10:12:12 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 11 Jul 2024 10:12:12 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 11 Jul 2024 10:12:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZzLIBzno9/dhWOltcDsHkKiv7AXzXMOBT2uvjBI8HS9xHejXIgiHhMV6jd6ngW++duXJwO9hwE7cSAlFUM/YtdRcdDAPak5h/fEKRQKsuH4doEiG2ZAjh3rp011paG8oe7Qej5BB/fBqZ2kF05xMTw/8NGEVufV24oT24hBy26JH1CyqeBPvfLZkh3ExoIyoET9jhgsxQjetcz3mc48xfrIP6IVyfg4vtX+bnXwl7XHQgVGT+HoYqZbXY/bV1Ndmylj6FYlDeL/3HVmzPg9tAMjtpaGmcqlYePntPVnd3gkjEj7FHx68szL4SjPgf2F2Os2mj5z7U2gOEVL35GkLeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eoSFyT0VvAphFcgaT5zSnTtvbmA9YvuncSs9jTbbgZQ=;
 b=nQgwYAYuaoV6bWsVI2w6moQto7kilbcujVdeplduecDfhtmTwpU4F4a6K1//D/3GvjqyiezhiwyOPALKjJXCA/1eWQqwSLhORu7fUog+5oJXFTWGX7eH79YhMO6acyQ9Ar4jD0PJHiBNhWWdM0GqRleI88e71pBovA7kGUE3VQX9H4CczeZEcUas9HbcUevkTBj1vX9S0LNCQ+XEBxutkuQwki0q9B6HEn1L5wPbG4IVCg7nQRyxUtoe6LJQvJhtUpKwdc6sNr83HiEgm7CYAGMZTJChP3xIFPfodh6ecG8IrKXEv1ZTeVyVXi7tijKxgziVEZ9+4wu1DdjBW8IKVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2859.namprd11.prod.outlook.com (2603:10b6:5:c9::14) by
 CY8PR11MB7107.namprd11.prod.outlook.com (2603:10b6:930:51::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7741.33; Thu, 11 Jul 2024 17:12:07 +0000
Received: from DM6PR11MB2859.namprd11.prod.outlook.com
 ([fe80::4063:4fec:bf76:f095]) by DM6PR11MB2859.namprd11.prod.outlook.com
 ([fe80::4063:4fec:bf76:f095%3]) with mapi id 15.20.7762.016; Thu, 11 Jul 2024
 17:12:07 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH 02/12] drm/xe: Introduce GGTT documentation
Date: Thu, 11 Jul 2024 13:11:45 -0400
Message-ID: <20240711171155.173717-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240711171155.173717-1-rodrigo.vivi@intel.com>
References: <20240711171155.173717-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0010.namprd05.prod.outlook.com
 (2603:10b6:a03:254::15) To DM6PR11MB2859.namprd11.prod.outlook.com
 (2603:10b6:5:c9::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2859:EE_|CY8PR11MB7107:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ac855c7-06a2-4adf-ee6d-08dca1cc97f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+4vVTNlSEKs8MTUWJbrakYilc4+1139swGft1BI16WVNdS/0u7OtIQQzM9lB?=
 =?us-ascii?Q?/l05hMlH8AvXAq5+ANzYKLSMoqSdTy6bP55ZdWetZm/QleDiKRUgG2MA6SHF?=
 =?us-ascii?Q?Sveg6wSQA3Yn0XwP7eLljlbAI5Xb+oo6FHJII7ka+IlMSallGPotKBBZt7XJ?=
 =?us-ascii?Q?UzVfmBdbavzJ9hrPk0r1ZtjfaApCKgVbSKZnEap+5VbWB4MLnknJ/rsXUWCd?=
 =?us-ascii?Q?CRzvKRaTSi6cFkjlFYiqVUM3bRICkWvrZ4aYgBslT4DnW2XRZjyYCRo1fgNs?=
 =?us-ascii?Q?68iyVsaiIc7SsAjrM+u2c/n1XeuG8eZ16ggg822iL7xKCrAxFAB8iWRghLvI?=
 =?us-ascii?Q?C1vkaDNEM3lHCTpuzxvxA7bszvLXdaVG5MqcVGc28ayUBK8iRXGnRZziFvtQ?=
 =?us-ascii?Q?nr/5K/7lFNik6TV+FPK5yF/8sGgjY/IcbAU+Dci7R+mgJSaCpn5erBYFgGqZ?=
 =?us-ascii?Q?B2vhM8moZfEncIFQai8Z1xLuZAJlsSN9LB4vn4GG3UHtZl22By00lTfLT8kZ?=
 =?us-ascii?Q?gmq55BKJF41tyVdytTAq8prv+Z3lVNLrk0iNuZS1RLPHZBPMAiE/yL2TR3pI?=
 =?us-ascii?Q?CGsfkRsWh8ghSsjllbj14mGljA90U5BlB1pbDBUuOqXdBJKLy5w3zsctIWaR?=
 =?us-ascii?Q?xGr70WKlUB3Mhv9wN4t5R1N5k6Y3B/zvNBfO7c4ZJ/mKDP2XkQQRV/C+k+yZ?=
 =?us-ascii?Q?yROwKOH5TT4ubn0MWRVrjMXUanoTEt8G3l3XyTzvGAgFTO0ew5zuiZgQSjSa?=
 =?us-ascii?Q?T6KG2OAZ8mDVPh/2iVbvORWEdyLClGKAcmAdOjsws2WyMTFw7cAIqvfFajWn?=
 =?us-ascii?Q?MrnSEWg84uwrh97ZXlg2vQUuFX/O046ilLSCyne/P2ubeSyN16p62VCyXBkP?=
 =?us-ascii?Q?ahSWSlp+iOxSwh1+Rim5aD1FculfW4nQIDBarCv/UhnvMlduD7a1NM8qMbqK?=
 =?us-ascii?Q?a3I4yFRozPsXJJW12m8OG/ovRPMlM8enB9QRN0bInv7MXfl/DARKHKibY28K?=
 =?us-ascii?Q?BLnWjPKUCoFBRWfCzerRMR8qzsw2kbWb7EOkWXb5HGhTTSxMrQAkKn5w3B+E?=
 =?us-ascii?Q?ZZiPhstuTr0psYTGHvD09vddFsV41UGC8tt+j6Ofk2ktUWM062RrvfoGrueU?=
 =?us-ascii?Q?RKGfGuFBZnY4K5VnvTkyUaKB8x0kYqy3DCh4WJpglyVrc6PpPMem2TYo4EFM?=
 =?us-ascii?Q?5606DCfYRAsxQMKnI+NdMtnjAgUZwaHwHJN8QfY8bbmbxlcDqkvf9RmRXWJd?=
 =?us-ascii?Q?vXtelj3Jjf92a09jiFH9aKd4M82lpGA2gA5m9jw+sPE5KPeB3jmi2GXEPq7z?=
 =?us-ascii?Q?LlSx8bnlOLfgjSewH3iz+aPs3XTC+xo7UFp6SYUpJYvCGg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7ZQR4hSUyonEMahiuTmD05aRdK/aMDyT8lB6lWGpTCTaKv7mD8OxPT4xjwXc?=
 =?us-ascii?Q?p68+UCuQ5UzjJO0g0lcOHUwhacbDZYGm02Y+NinxRkiAOeemw5H0HhJtwpT6?=
 =?us-ascii?Q?llqNI50TLgx+UbQnx8AbgV6nFiPdHzXmCA5KzlZXlJlhOdNDWrx51CNjmzoG?=
 =?us-ascii?Q?UUHw9Blgk5/Bm5bnHVgfrjau5jzOo49q+Phyzcj2+slrwRf6BQtWkANYQK6o?=
 =?us-ascii?Q?kIP8ae6RzUgonSP7fnYPKqzG3V2hng80IImOrq915SLi1K9jHPhfDZhVIn7t?=
 =?us-ascii?Q?ZgtSVDp5chNMkYvBafS32Iya0uSc6aKmHqsWX9wfxYFQAqJPLXZUgCGaquRT?=
 =?us-ascii?Q?sZRfWhxKrAwWyIuRA/ol2gzHS96NURYH+1ntEVS6nJTPNupCOt5ROc1Iis2m?=
 =?us-ascii?Q?dfvEjCiBY/zM66ZsHxVHEhiEBIcONFnhU6COTcLq6B0dXfgN9CjkYSRydvV9?=
 =?us-ascii?Q?ewpAOCGpfJsORr64EYBCmSRxtOwI2voQdVx8l9Dfr64XaVD2qZQq1uuJSPn+?=
 =?us-ascii?Q?jkAAeup8d2q6w2eES/uC68uxe++3Ws+baziNIBhjhNHD5zA50kg0aN/tqVfZ?=
 =?us-ascii?Q?psYxGA8K072y4u8xyqOI4uxsVmpfMCBV+lKps1BANQLGHnu/aumIlXTVMUgv?=
 =?us-ascii?Q?idYhrJZM9QKSNwFgn/0bua+jzZjSjL50y3VAY9oljifzPQ6PD8NWpQk5Us1g?=
 =?us-ascii?Q?kIpOIj1I8WWeQeQ8FnLMoZM05zz4AfiC2ZKjuEKrBMhT4dugzVH2XI5a8DSz?=
 =?us-ascii?Q?dy1i72M7yXVchRd8NOaqaNy8K8Ot75vsPU+L5bDc90hHQbRC42E3kRNdiBt8?=
 =?us-ascii?Q?yMZovPJ8V12HKI+K55OcLzmjImSgabEMX+BCA0Lm9In4tgPa8vpehuZGBdes?=
 =?us-ascii?Q?5TX0LnlqxoTknL/cCv9xd01LCbT85s9rdFsPnWnLGJYG4nFB6CJ0LnD5T7wF?=
 =?us-ascii?Q?tl8f/HUKF4mFD5vqxY/lhoVKHTovPp7Gp77WoV7AJN0UohRw3OBAmK8Lttn1?=
 =?us-ascii?Q?FcQOev2H9TnB+a0dSCoQdAbugm4nHKxcSiEn4ccgktKB2r8T7tq0V29H4gOP?=
 =?us-ascii?Q?SUgpqYBG/KrawbMfENf19zDXuCXmc9DQLZzfTquOGZXFshs9M8kgqb5y7kwR?=
 =?us-ascii?Q?awDd33S957GDJ5koeQxUP1DUS5l/anKLvhGHZRkZNpMTNkA+3ccuo+sUytNe?=
 =?us-ascii?Q?kuoqFBUMks4SMskyCT2BFbyAvMeX6mE4Pnd4S38d/WH4exKTZk1Sj/bFRUWa?=
 =?us-ascii?Q?0dIO+fSUM8/X6f/o/hGpbOSJWDG0I5MV/9+/MadDfO6Loc0EwbDuKHAtgA8J?=
 =?us-ascii?Q?sbUHT/pJ/1IPURbTSmUextcC2T1/n1AyIBPhQ2GYt00cKWegD+zPcbAoE33P?=
 =?us-ascii?Q?REugGKGb8LKK7lkFl0dJH1j+y0+t3sTaOAcQTE2EhFKL0bpFj1kgjUOOAQjU?=
 =?us-ascii?Q?dpUWjWCg3TFv4F10iTWuvaro8BC+VqE6E0QREopyUk+qwg8AwjmjXBZD9ImO?=
 =?us-ascii?Q?s3q6+Ja4jp/nKW8vMQxeBnFBSg2eTs77FDdI8EuT6Ltf/wUlmUBfOnqS0E56?=
 =?us-ascii?Q?+3Kmc0zy5jr+dEHjxcENykwO3//+mqjztg5HGQncqu7+i8KqnOkMo++Ljv4V?=
 =?us-ascii?Q?jA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ac855c7-06a2-4adf-ee6d-08dca1cc97f2
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 17:12:07.6243 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vee8aMhFXJVIH8XhURBae1p7hqD+Z9GRQxjxiXt2gYJLO6DrFGbzyAC6isLeC2y1bL4f5KHDYXKzfuXtEQ7JFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7107
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Document xe_ggtt and ensure it is part of the built kernel docs.

v2: - Accepted all Michal's suggestions
    - Rebased on top of new set_pte per platform/wa function pointer

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com> #v1
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 Documentation/gpu/xe/xe_mm.rst     |  15 ++++
 drivers/gpu/drm/xe/xe_ggtt.c       | 136 +++++++++++++++++++++++------
 drivers/gpu/drm/xe/xe_ggtt_types.h |  32 +++++--
 3 files changed, 148 insertions(+), 35 deletions(-)

diff --git a/Documentation/gpu/xe/xe_mm.rst b/Documentation/gpu/xe/xe_mm.rst
index 6c8fd8b4a466..95864a4502dd 100644
--- a/Documentation/gpu/xe/xe_mm.rst
+++ b/Documentation/gpu/xe/xe_mm.rst
@@ -7,6 +7,21 @@ Memory Management
 .. kernel-doc:: drivers/gpu/drm/xe/xe_bo_doc.h
    :doc: Buffer Objects (BO)
 
+GGTT
+====
+
+.. kernel-doc:: drivers/gpu/drm/xe/xe_ggtt.c
+   :doc: Global Graphics Translation Table (GGTT)
+
+GGTT Internal API
+-----------------
+
+.. kernel-doc:: drivers/gpu/drm/xe/xe_ggtt_types.h
+   :internal:
+
+.. kernel-doc:: drivers/gpu/drm/xe/xe_ggtt.c
+   :internal:
+
 Pagetable building
 ==================
 
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index add14f3dea1f..709ef48f2fdb 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -30,6 +30,39 @@
 #include "xe_wa.h"
 #include "xe_wopcm.h"
 
+/**
+ * DOC: Global Graphics Translation Table (GGTT)
+ *
+ * Xe GGTT implements the support for a Global Virtual Address space that is used
+ * for resources that are accessible to privileged (i.e. kernel-mode) processes,
+ * and not tied to a specific user-level process. For example, the Graphics
+ * micro-Controller (GuC) and Display Engine (if present) utilize this Global
+ * address space.
+ *
+ * The Global GTT (GGTT) translates from the Global virtual address to a physical
+ * address that can be accessed by HW. The GGTT is a flat, single-level table.
+ *
+ * Xe implements a simplified version of the GGTT specifically managing only a
+ * certain range of it that goes from the WOPCM (Write-Once Power Control Module)
+ * to a predefined GUC_GGTT_TOP. This approach avoids complications related to
+ * the GuC (Graphics Microcontroller) hardware limitations. The GuC address space
+ * is limited on both ends of the GGTT, because the GuC shim HW redirects
+ * accesses to those addresses to other HW areas instead of going through the
+ * GGTT. On the bottom end, the GuC can't access offsets below the WOPCM size,
+ * while on the top side the limit is fixed at GUC_GGTT_TOP. To keep things
+ * simple, instead of checking each object to see if they are accessed by GuC or
+ * not, we just exclude those areas from the allocator. Additionally, to simplify
+ * the driver load, we use the maximum WOPCM size in this logic instead of the
+ * programmed one, so we don't need to wait until the actual size to be
+ * programmed is determined (which requires FW fetch) before initializing the
+ * GGTT. These simplifications might waste space in the GGTT (about 20-25 MBs
+ * depending on the platform) but we can live with this. Another benifit of this
+ * is the GuC bootrom can't access anything below the WOPCM max size so anything
+ * the bootom needs to access (e.g. a RSA key) needs to be placed in the GGTT
+ * above the WOPCM max size. Starting the GGTT allocations above the WOPCM max
+ * give us the correct placement for free.
+ */
+
 static u64 xelp_ggtt_pte_encode_bo(struct xe_bo *bo, u64 bo_offset,
 				   u16 pat_index)
 {
@@ -164,12 +197,16 @@ static const struct xe_ggtt_pt_ops xelpg_pt_wa_ops = {
 	.ggtt_set_pte = xe_ggtt_set_pte_and_flush,
 };
 
-/*
- * Early GGTT initialization, which allows to create new mappings usable by the
- * GuC.
- * Mappings are not usable by the HW engines, as it doesn't have scratch /
+/**
+ * xe_ggtt_init_early - Early GGTT initialization
+ * @ggtt: the &xe_ggtt to be initialized
+ *
+ * It allows to create new mappings usable by the GuC.
+ * Mappings are not usable by the HW engines, as it doesn't have scratch nor
  * initial clear done to it yet. That will happen in the regular, non-early
- * GGTT init.
+ * GGTT initialization.
+ *
+ * Return: 0 on success or a negative error code on failure.
  */
 int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 {
@@ -194,29 +231,6 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 	if (IS_DGFX(xe) && xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K)
 		ggtt->flags |= XE_GGTT_FLAGS_64K;
 
-	/*
-	 * 8B per entry, each points to a 4KB page.
-	 *
-	 * The GuC address space is limited on both ends of the GGTT, because
-	 * the GuC shim HW redirects accesses to those addresses to other HW
-	 * areas instead of going through the GGTT. On the bottom end, the GuC
-	 * can't access offsets below the WOPCM size, while on the top side the
-	 * limit is fixed at GUC_GGTT_TOP. To keep things simple, instead of
-	 * checking each object to see if they are accessed by GuC or not, we
-	 * just exclude those areas from the allocator. Additionally, to
-	 * simplify the driver load, we use the maximum WOPCM size in this logic
-	 * instead of the programmed one, so we don't need to wait until the
-	 * actual size to be programmed is determined (which requires FW fetch)
-	 * before initializing the GGTT. These simplifications might waste space
-	 * in the GGTT (about 20-25 MBs depending on the platform) but we can
-	 * live with this.
-	 *
-	 * Another benifit of this is the GuC bootrom can't access anything
-	 * below the WOPCM max size so anything the bootom needs to access (e.g.
-	 * a RSA key) needs to be placed in the GGTT above the WOPCM max size.
-	 * Starting the GGTT allocations above the WOPCM max give us the correct
-	 * placement for free.
-	 */
 	if (ggtt->size > GUC_GGTT_TOP)
 		ggtt->size = GUC_GGTT_TOP;
 
@@ -262,6 +276,12 @@ static void xe_ggtt_initial_clear(struct xe_ggtt *ggtt)
 	mutex_unlock(&ggtt->lock);
 }
 
+/**
+ * xe_ggtt_init - Regular non-early GGTT initialization
+ * @ggtt: the &xe_ggtt to be initialized
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
 int xe_ggtt_init(struct xe_ggtt *ggtt)
 {
 	struct xe_device *xe = tile_to_xe(ggtt->tile);
@@ -382,6 +402,18 @@ void xe_ggtt_deballoon(struct xe_ggtt *ggtt, struct drm_mm_node *node)
 	mutex_unlock(&ggtt->lock);
 }
 
+/**
+ * xe_ggtt_insert_special_node_locked - Locked version to insert a &drm_mm_node into the GGTT
+ * @ggtt: the &xe_ggtt where node will be inserted
+ * @node: the &drm_mm_node to be inserted
+ * @size: size of the node
+ * @align: alignment constrain of the node
+ * @mm_flags: flags to control the node behavior
+ *
+ * To be used in cases where ggtt->lock is already taken.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
 int xe_ggtt_insert_special_node_locked(struct xe_ggtt *ggtt, struct drm_mm_node *node,
 				       u32 size, u32 align, u32 mm_flags)
 {
@@ -389,6 +421,15 @@ int xe_ggtt_insert_special_node_locked(struct xe_ggtt *ggtt, struct drm_mm_node
 					  mm_flags);
 }
 
+/**
+ * xe_ggtt_insert_special_node - Insert a &drm_mm_node into the GGTT
+ * @ggtt: the &xe_ggtt where node will be inserted
+ * @node: the &drm_mm_node to be inserted
+ * @size: size of the node
+ * @align: alignment constrain of the node
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
 int xe_ggtt_insert_special_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
 				u32 size, u32 align)
 {
@@ -402,6 +443,11 @@ int xe_ggtt_insert_special_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
 	return ret;
 }
 
+/**
+ * xe_ggtt_map_bo - Map the BO into GGTT
+ * @ggtt: the &xe_ggtt where node will be mapped
+ * @bo: the &xe_bo to be mapped
+ */
 void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 {
 	u16 cache_mode = bo->flags & XE_BO_FLAG_NEEDS_UC ? XE_CACHE_NONE : XE_CACHE_WB;
@@ -449,17 +495,39 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 	return err;
 }
 
+/**
+ * xe_ggtt_insert_bo_at - Insert BO at a specific GGTT space
+ * @ggtt: the &xe_ggtt where bo will be inserted
+ * @bo: the &xe_bo to be inserted
+ * @start: address where it will be inserted
+ * @end: end of the range where it will be inserted
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
 int xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 			 u64 start, u64 end)
 {
 	return __xe_ggtt_insert_bo_at(ggtt, bo, start, end);
 }
 
+/**
+ * xe_ggtt_insert_bo - Insert BO into GGTT
+ * @ggtt: the &xe_ggtt where bo will be inserted
+ * @bo: the &xe_bo to be inserted
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
 int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 {
 	return __xe_ggtt_insert_bo_at(ggtt, bo, 0, U64_MAX);
 }
 
+/**
+ * xe_ggtt_remove_node - Remove a &drm_mm_node from the GGTT
+ * @ggtt: the &xe_ggtt where node will be removed
+ * @node: the &drm_mm_node to be removed
+ * @invalidate: if node needs invalidation upon removal
+ */
 void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
 			 bool invalidate)
 {
@@ -488,6 +556,11 @@ void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
 	drm_dev_exit(idx);
 }
 
+/**
+ * xe_ggtt_remove_bo - Remove a BO from the GGTT
+ * @ggtt: the &xe_ggtt where node will be removed
+ * @bo: the &xe_bo to be removed
+ */
 void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 {
 	if (XE_WARN_ON(!bo->ggtt_node.size))
@@ -544,6 +617,13 @@ void xe_ggtt_assign(struct xe_ggtt *ggtt, const struct drm_mm_node *node, u16 vf
 }
 #endif
 
+/**
+ * xe_ggtt_dump - Dump GGTT for debug
+ * @ggtt: the &xe_ggtt to be dumped
+ * @p: the &drm_mm_printer helper handle to be used to dump the information
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
 int xe_ggtt_dump(struct xe_ggtt *ggtt, struct drm_printer *p)
 {
 	int err;
diff --git a/drivers/gpu/drm/xe/xe_ggtt_types.h b/drivers/gpu/drm/xe/xe_ggtt_types.h
index 2245d88d8f39..4e2114201b35 100644
--- a/drivers/gpu/drm/xe/xe_ggtt_types.h
+++ b/drivers/gpu/drm/xe/xe_ggtt_types.h
@@ -13,30 +13,48 @@
 struct xe_bo;
 struct xe_gt;
 
+/**
+ * struct xe_ggtt - Main GGTT struct
+ * In general, each tile can contains its own GGTT instance.
+ */
 struct xe_ggtt {
+	/** @tile: Back pointer to tile where this GGTT belongs */
 	struct xe_tile *tile;
-
+	/** @size: Total size of this GGTT */
 	u64 size;
 
 #define XE_GGTT_FLAGS_64K BIT(0)
+	/**
+	 * @flags: Flags for this GGTT
+	 * Acceptable flags:
+	 * - %XE_GGTT_FLAGS_64K - if PTE size is 64K. Otherwise, regular is 4K.
+	 */
 	unsigned int flags;
-
+	/** @scratch: Internal object allocation used as a scratch page */
 	struct xe_bo *scratch;
-
+	/** @lock: Mutex lock to protect GGTT data */
 	struct mutex lock;
-
+	/**
+	 *  @gsm: The iomem pointer to the actual location of the translation
+	 * table located in the GSM for easy PTE manipulation
+	 */
 	u64 __iomem *gsm;
-
+	/** @pt_ops: Page Table operations per platform */
 	const struct xe_ggtt_pt_ops *pt_ops;
-
+	/** @mm: The memory manager used to manage individual GGTT allocations */
 	struct drm_mm mm;
-
 	/** @access_count: counts GGTT writes */
 	unsigned int access_count;
 };
 
+/**
+ * struct xe_ggtt_pt_ops - GGTT Page table operations
+ * Which can vary from platform to platform.
+ */
 struct xe_ggtt_pt_ops {
+	/** @pte_encode_bo: Encode PTE address for a given BO */
 	u64 (*pte_encode_bo)(struct xe_bo *bo, u64 bo_offset, u16 pat_index);
+	/** @ggtt_set_pte: Directly write into GGTT's PTE */
 	void (*ggtt_set_pte)(struct xe_ggtt *ggtt, u64 addr, u64 pte);
 };
 
-- 
2.45.2

