Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31B84C61DA4
	for <intel-xe@archiver.kernel.org>; Fri,  3 Feb 2023 20:28:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FF1E10E08A;
	Fri,  3 Feb 2023 20:28:06 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AD0510E08A
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Feb 2023 20:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675456083; x=1706992083;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=HozzMZ5Db1PpDGwglzPpCfdDyXiFXcjW0yfJrpx882M=;
 b=elZclHfuMloEOCnbwIw9uhe1wXGthwZ1LT1QaaC9/KJEK6dDUZYtkL6q
 h33r13uNjzWt2VO9foqTpSGbOA5K2TFqiG+iVWBPm0joBql2+BWzBjn6Q
 gGxQk7/bxdKASHFxvw7aVmFoetxXyvtYI1TXndyM31nZf0kA63+IAqVTz
 c1Sg+UA9aQb7ytcuqMtVZQKsbv5cwJfiXVxz3QPfSTqGVng5bMxlxdZL7
 HHrIcwva/G2aO3goMg70E8PVWQ8xo9nc+PVmwSAxJLKLDU1t6lwZ5GukP
 bIwy453Wu5ir8ItCRJTNhjCpAP0ySCEghZD6fl3kv79EMYWhLBXRqCjMo Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="327484322"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; d="scan'208";a="327484322"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2023 12:28:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="774450366"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; d="scan'208";a="774450366"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga002.fm.intel.com with ESMTP; 03 Feb 2023 12:28:02 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 3 Feb 2023 12:28:01 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 3 Feb 2023 12:28:01 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 3 Feb 2023 12:28:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jjpoW4CSjwEe0OLbOwtK4MoPkqf0nxfoRY0YiqNVFzMc+H1euOqFcvtJ2tTuimhD/opcouX7hFdySTGpueUMHLgN7qc1UoTKlK6PbHu8xf1Yvt/AChdJnZ4r4PNHHLb+Qy6pSBTU4Z18Kbu/74pwBufBVUlQp6U9DWyz22WkhHh6/+mhFYJ3XWn/GdtJsn5uEF/TfMnyTC08emWIfgHctq0yNY4MARleT6Xzxu+TVeGEKtLk7qEuWkMdFEkupkV1jPiyCaZSwDqnVjEvo+3GB/g/SkdwPkTmNO+/gxyhztvHR6arRr0ckOLXnBbwZRKXaaR/enpX48rsQj5TAdfx8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uqy+lHxlQfCeFpd1p4gZaHoAVoe4HwsJQ+f0hacywHw=;
 b=fccrl5fs+ao1GbnkZiKMA+LqEniAI3Arr14Vx9j7tn9RNqpEExyA8bTMK0EYMpDRh0Di6R6QxCvb1trDFgSE4OjXCXayHQFAdU4ri1gGHTfBh/g6MzDxa/7CKXyma1zyBUZhI0DgjmALqqOIOGJwSynvwOi28XbbdHScRURqPZrNkSWNoTDcB3t4nTnSE3hj6p6r4F4htYDLnkpjZulf37gxYqUP6qywl+pibCnjgdgqmXzvIR0N5WkbqqDz0MluNAeEfrfswwyhCxO+qWZCnGS8pbDmCL2znNjN0t2uhjMw955Pl+fCWT+n9lYioUKKHIIs4ZQ7TFO3bg0pUP4kvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MW3PR11MB4586.namprd11.prod.outlook.com (2603:10b6:303:5e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.31; Fri, 3 Feb
 2023 20:27:59 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158%7]) with mapi id 15.20.6064.022; Fri, 3 Feb 2023
 20:27:59 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Fri, 3 Feb 2023 15:27:39 -0500
Message-ID: <20230203202742.577659-4-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230203202742.577659-1-rodrigo.vivi@intel.com>
References: <20230203202742.577659-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR04CA0034.namprd04.prod.outlook.com
 (2603:10b6:a03:40::47) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MW3PR11MB4586:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f4514d4-0849-421f-3410-08db0625241c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B2Z46QGB6Lbfkci5Q+Irk/zAxEffycscXz8kmKKVhpXCs79NubX3U6Vzlm3NWyVkQ1ZXuCTWNRLZE2J9uS2V5asvR4OIyc0pfSKyevzCAS31pBILSOKEUZ4Pd2b7svqO8jq+gOOAMORGhwCu1PYC9QoeDm6pCUr00DaQrRpIk7w9AK5qB99BaMKmUY1ugMxe56jT7YngLOnhIFibPZXTOPDaN6Sims/1cksn1koF9BYmKsgMalzMc7yQ7WfuaW8ZrDS7K5W0Jc0M2LS+e+Jn7aCJzs+16mTfyU5YCCEkt0bRmkg20Ijl0xhu1IJcxAVWXetfyWWUsqGw66WzmCBGstjv1ACIqfS5RizJa4keHmVN7mAQWEcPZZCoko9lVAKxKkBcQiM3hz88KO4IhHUcIO63aBwuscs1iZTkcfHU7CbLc2egTeGtf6oAR3daz7iFiGqG1CntWBr+4wfRAwdr33HqQG7mh+yhwogsTi6dTV49OGnRHBjezrfXtfDdUOBSTsulX855g3i4YFoIrBuArT/+44ykqz6cqOQ4nI7oxq5/E8jPVtrtivLCZ/RIVTZCdfXcU0hXtsH2Bf4JCnAzL4ON1AddkjoIIWDXRIybXhRL9uSRT9up2qlIp2UhIUoyyeH0pB5N8bbGOSm1E4aJ6w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(39860400002)(376002)(366004)(346002)(136003)(451199018)(2906002)(44832011)(5660300002)(83380400001)(38100700002)(86362001)(82960400001)(8676002)(4326008)(54906003)(316002)(8936002)(2616005)(41300700001)(66946007)(6916009)(66556008)(66476007)(36756003)(26005)(6512007)(1076003)(478600001)(6506007)(6666004)(186003)(107886003)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6ptmooW7hClFDGacS19Q20V3hJFoezvdDjTP4JNZn1d2V3mcKYFekRoWt9Mo?=
 =?us-ascii?Q?Bo3a7P2lnWdIQ+IkOJ2aaADKr7ds+VYSJgEKhnMDfEipVuC/LbGE4zRLb2vo?=
 =?us-ascii?Q?j2ERaMXsdTXUaE/sWoPtq6EGmJnaOMz52XmezBp6+qnuGyyKeUqBn149masX?=
 =?us-ascii?Q?bwBsWF4ybe99/w/dBa+y8ixoWNsjOx8BscrfxrxQn3AlTaOo98He73fq6eVv?=
 =?us-ascii?Q?ZLcwD/d5ERN4T6p+r2F5gyZyI44RSDDfjJVLktZFJL3NfiQnV9KlxHipzTfd?=
 =?us-ascii?Q?Z5ai0YS+Hxg7yZgTsfdgYw221mrBAsQB99ceSTPzHOf76kOkRIpB8tyVYzpI?=
 =?us-ascii?Q?qY2FQtTnWNHSDv1lrhYKVUQ1yhAVqks3xoVRFSS15wNWdsdiWGCfjMlyqzUE?=
 =?us-ascii?Q?IyaTP2rHab/o1bgb2h6fD6wJdAGlbSbbGeEZwSdVN9vlIuviSYCD9ABV8KbC?=
 =?us-ascii?Q?bA/mDDiFG+OqsghqA2TLmDMEldcLqhIM3Shp+Xf0ULxqgiopYa9mpttfYWSI?=
 =?us-ascii?Q?SWahDLPPiGBxLj4XUUAjkISyo5JX+f+peqmWxwyszn+im4DwJ6Y1V0++G3m0?=
 =?us-ascii?Q?xD0b5gkq8J1jh8JiLf0X77/qaPRU9f8LEtrNaD67faaBq9TkxKN3O/11EgeL?=
 =?us-ascii?Q?XZ3z7eFjv/V81WJYdw+8EV7NNY27EXu/8cVfv3W5bUy674JusLuL0zbFj5JE?=
 =?us-ascii?Q?InQ+1DkqXsy0LOOIKap191+G+vSYSPWhTSi9iSrFRS7OdiSGXiArY11xVVnY?=
 =?us-ascii?Q?hK4rBemVSYaxHyRcYMrbIxGP+CA/qChgiqLTuqqG04mK3NCKP0sPpXCFGvAh?=
 =?us-ascii?Q?eqkEhMa2vk7OwISlV7WfoXdRovlg8rhjEyQoqp3wcpwtQ8HaGOJ2c5SqWmlo?=
 =?us-ascii?Q?3+E+RjIvT5aMSPW0Y7Z0wH9qrk0KB2triZty41b8LbkF/zmsuzmthJ0rsSFi?=
 =?us-ascii?Q?DVmrdX3eJqHgejLrrqAKN7S0G0Os1Qz0SNYLfu2XzKHCR3UwWERp7P0qJ1ah?=
 =?us-ascii?Q?9aZQusQs5uKPk+ih2NFMdVZMwoJiVBgbIHMdqQCyuCD65G6UTcaeaN7P3HEa?=
 =?us-ascii?Q?R1e2VMtJOFXLSGFN1d1KSaxGX3WCK1YRBvcikgBbS8LXILc36IKXjEDQyquG?=
 =?us-ascii?Q?MpQWle8A1OGUAblmWOH1EsfdV18us/JPeTy8rNWFimS+OwknpX/+8Vt4aAMe?=
 =?us-ascii?Q?v+QJGOEME9zCiFi+WP9RWCyZxjjvcsUnMXVkUyyQw/q2rGbKQooC4EJGrgap?=
 =?us-ascii?Q?hbpJ3tp609xAeaA2YOb/eazg2NaJrBn1arOwcDt8qp5CfseGhGdrtbR8Lj49?=
 =?us-ascii?Q?Uxz2MaY8g6qS8S1BsQEy4oiXpsxXmMrpNIoCLwu9sN4yoWiRblywzOm5qQ7G?=
 =?us-ascii?Q?Aixt+Ey1anCZuQAGq/+DmchcxLh8/9kCsDcgLlzSkmBdxm9VrYv8DRHJT7D2?=
 =?us-ascii?Q?D/zC+Yzb3J35D+Y2eg7cdCSSbE1zT7GbP4YsE4ATPvpd1mH8mLPgbt8TOKe6?=
 =?us-ascii?Q?j1UoEsBjMMvZ7qaHXNwcrmFaniQSO9IIpw50wju4QJXEO3xkzkf0ErFumKib?=
 =?us-ascii?Q?i7/5wxKtBpmYJYVmOHF1VWNYfhlo4+noWDPsl8TglxZ0vnPTKNezYDdu8Mi3?=
 =?us-ascii?Q?Og=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f4514d4-0849-421f-3410-08db0625241c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2023 20:27:59.4785 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JY98HBDrs5rm6JG4r8EmVepF5FF9nAndJoIBZqWVjZjRpheF9NzX+mnbRiwiKsNmdSXk3fYRgkF1A02XEZQwfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4586
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 3/6] drm/xe: move XE_DISPLAY to the Kconfig
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Mauro Carvalho Chehab <mchehab@kernel.org>

XE_DISPLAY symbol is not related to debug, but, instead, to a
Xe feature. Move it to the driver's main Kconfig file.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/Kconfig       | 8 ++++++++
 drivers/gpu/drm/xe/Kconfig.debug | 7 -------
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
index 22e47918bfcf..4684e99549d3 100644
--- a/drivers/gpu/drm/xe/Kconfig
+++ b/drivers/gpu/drm/xe/Kconfig
@@ -40,6 +40,14 @@ config DRM_XE
 
 	  If "M" is selected, the module will be called xe.
 
+
+config DRM_XE_DISPLAY
+	bool "Enable display support"
+	depends on DRM_XE && EXPERT
+	default y
+	help
+	  Disable this option only if you want to compile out display support.
+
 config DRM_XE_FORCE_PROBE
 	string "Force probe xe for selected Intel hardware IDs"
 	depends on DRM_XE
diff --git a/drivers/gpu/drm/xe/Kconfig.debug b/drivers/gpu/drm/xe/Kconfig.debug
index 6726caa63acc..9c773dd74cbd 100644
--- a/drivers/gpu/drm/xe/Kconfig.debug
+++ b/drivers/gpu/drm/xe/Kconfig.debug
@@ -95,10 +95,3 @@ config DRM_XE_USERPTR_INVAL_INJECT
 
 	 Recomended for driver developers only.
 	 If in doubt, say "N".
-
-config DRM_XE_DISPLAY
-	bool "Enable display support"
-	depends on DRM_XE && EXPERT
-	default y
-	help
-	  Disable this option only if you want to compile out display support.
-- 
2.39.1

