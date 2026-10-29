Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E470B606A31A
	for <intel-xe@archiver.kernel.org>; Thu, 29 Oct 2026 11:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SfXEESJk
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BF931121FF;
	Thu, 29 Oct 2026 11:31:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCCB510E4CB;
 Thu, 29 Oct 2026 11:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793273451; x=1824809451;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=kljwcBTWIhpJdOfVUrwoLJ6q2esf8GffPAjAgTFvVnI=;
 b=SfXEESJk+iScIf86sIeZbhCMF1yrao4q0M4c2JSCCI/CYvBWBsBJrEkG
 ICnWMacQtsXiAgKhVfMeyUDf8OfqA3FJ+RmxOhepec2/gqprlzt3exlgL
 pfkqJUNerytsM/aHxu3GZa70nKP5EFvQe5vpG21h3f1PgT4dRTGvYSstg
 eA4576cCizq65A6GC+oBSofwIm8KKdZ1ZvTvKLqcglvDi6+6itZHolSOT
 mz8SLu8YdwIrBo9w1j4MVJCG8wnlGrg1y5QTeCM7TWUyewDd2rNdKJuz7
 RkeDsCZaZ+MgB6VWb/tcxz9lEVnOTgdtkOIZZ2z0XOb/KOUBsYa5eVxys w==;
X-CSE-ConnectionGUID: lXWHt/gHR3eoqNYt8cwnxw==
X-CSE-MsgGUID: hTxKWgweTf2FCnePnsaQiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="2047303"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="2047303"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 04:30:47 -0700
X-CSE-ConnectionGUID: 9U8MnLxkSZOVjTLkcC0Q5Q==
X-CSE-MsgGUID: NYztOZqPSOenz1McOBUgxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5026904"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 04:30:47 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 29 Oct 2026 04:30:47 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 29 Oct 2026 04:30:47 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.49) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 29 Oct 2026 04:30:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TYlO/nNclKCYxp8EKXKQ6BWZ+DtrEyRB6ya9ac3LVWXqXumPgW1jRpWcZbPf9mUlIj55tcMKWhFwS9c0CvSylWzj7rZomPwZ2TVnR0A5SJ74lZMCsHAn0GXXEdH9DK4PWhwSrL0ja/1V7v1aQNn8lAiAlUKGDFi98WXyzT5xq49kvyvYsb/oxyL8vevz1YLl6Qhb2XrAekjisx07RqV7XTVOh1htcH9sQCsxMlTH2akeVggcNv4jwESBj4TcSsq3piUCPbOUpjNG2Z1qSI0Zx+a9PxhRVWXuO/JVR3j8K/lrh6Hva1deQntYgsLPod42+IBOvBb9/w3+vwqCjrZ87g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+t9rxXJX+eW5KxsyfZehOOaXuzeaLOZgBmMrYeV/Zmc=;
 b=t/sXtilhyeyCzB9diPIokEVS1QXEo7tLyY0e6neE5R7YC5LGBbyDsy2qpxRDfML2NLRToeHpCVZ3QcVfhferk5ipa2EkEDOm756Qnr0T82D9kNX9R7GMPYa9SOLtIUqhMhhERvN3Mx4lKL0BPN6KE35r3R9P6rX5LX6cp1GT5phFPLTDlRtkXL1ORfUNBtMSaoFbym2CZDgbWkjJ5oSFO7OhVqd9rAlHG6uem+o3YOqcMRYSB3C2oHyDMByWz1uvj9A+etHQRW8OM3v9kOKSvJD98/OirGHs9lzd7SXcZK5ZF96CfnU1BAhxuvIMouU0CpIA/7ZIn4JO5kAIFgENZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9273.namprd11.prod.outlook.com (2603:10b6:208:573::17)
 by DSWPR11MB9823.namprd11.prod.outlook.com (2603:10b6:8:4e1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 11:30:33 +0000
Received: from IA3PR11MB9273.namprd11.prod.outlook.com
 ([fe80::31a4:58c:e3b5:43fa]) by IA3PR11MB9273.namprd11.prod.outlook.com
 ([fe80::31a4:58c:e3b5:43fa%6]) with mapi id 15.21.0569.007; Thu, 29 Oct 2026
 11:30:33 +0000
From: Imre Deak <imre.deak@intel.com>
To: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
CC: <stable@vger.kernel.org>
Subject: [PATCH 6/6] drm/i915/ptl+: Fix TypeC detection for eDP on port B
Date: Thu, 29 Oct 2026 13:30:17 +0200
Message-ID: <20261029113017.618286-7-imre.deak@intel.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20261029113017.618286-1-imre.deak@intel.com>
References: <20261029113017.618286-1-imre.deak@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV3PEPF0001DC22.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::119) To IA3PR11MB9273.namprd11.prod.outlook.com
 (2603:10b6:208:573::17)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9273:EE_|DSWPR11MB9823:EE_
X-MS-Office365-Filtering-Correlation-Id: 13e08aba-54f3-427f-df45-08df35b00b80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|5023799004|56012099006|11063799006|261009223027099003|261022075727099003|261021121427099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: DWmGH3tRox4q31/vGgokrH1CGqct7UR2cS7rDX1eW6jDZmvP1R6UauYGG3celHadEhHFyjm5ORCtrnik4/MJD7pzaujSIHECIoDWE/ziQqoIZaTkwsuguTB89j48u3Oi0nMh37HQJWzhEoChjQLjhbf3Y83XaO4aIVQGzkiuGfz28zj9iYXllNdBicEO7zBJdVjmwHOMuBsf5VfxS7T/yRn+HJMBahKaULoLxDgVbh6dNlDUl1ykVS1zRV5PrAnLbCAhYH2JGrmzZB1agq8pDRzJOAfJw1Z0NdhKBF5jLi3gRoSFbxjZy4QF8whhlbneztEtDz+myDIrviNylQUNP58/OXcaBVKxo5gB+HizTIqg/RJ0SEORW8kA7IGapG5qmfScPjGsle7udiDQC0Y/Q+XM9620oZJQS/9wDVk+/TAHUOsy6zKGBk9huDygWUd0tOIGUX/ERKB/woX8NT52vbgaEqR8SfCEBERGYJIU1Yi/Tko1GzUrwtl+cRpgU41Yu4zN1wPEfqbmEmqTru/tf/u2nMzud6bvxRFxvFIiP5oc2lvdedduy+9FJVby08NOqLIjYkHgkRDBVBn1YaVqKg56m9q7/5MYnz4jSrJUXIs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9273.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(5023799004)(56012099006)(11063799006)(261009223027099003)(261022075727099003)(261021121427099003)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RMVEGaUjY0a8l9YOXbrVnxto+5xDgp+1fPyBBf1wo8MpsT/hL4eWJVlmFiWz?=
 =?us-ascii?Q?V9BOuf0yF6Btjrqc2qaQwG29tggY2RS/WOFoL2OkxAfmYLI8jVUjY0SOaaOO?=
 =?us-ascii?Q?P+IK7/50+Lcd7obtelF6AFlZfj6L0G2r9y0YSx2GXinSMASRkejzdsJYoYmK?=
 =?us-ascii?Q?F19jY4KNYv4PaWZ909SSozgPFIMxdlRdnsHEjdO5Yl4u+RzYicJsYbtlWwrB?=
 =?us-ascii?Q?EHgzldpFGzxi+fxz0hWz8++QXVGE1jvofrbR3zHaRpTWQ+Ab5a8WzcozSmDs?=
 =?us-ascii?Q?KNKrdvi4rNv8sCvZh+KIYgdqq886ERmKN5pgjaOXBd3AlYs/2po0n1/6J29j?=
 =?us-ascii?Q?stOUvE3/7jPzODrSJpoInh3opDpna/WVrIDNBVGt3/qUHzpV8nLmU7BlD+VV?=
 =?us-ascii?Q?VGOZTm3GC/xZ5p+tyPL/uQ7tIFyBEJ/z40OVrLMKxM0tlUwENIl6OINJPaCg?=
 =?us-ascii?Q?jLr0/ob3VLdQP3xLPokvAu0McZ5Stgq6VFA1vPm1MnZ7TnVkYynKZGAZ/vdl?=
 =?us-ascii?Q?l5wYHMFbkUCPMLSoiofehxecfVsV2A3IC0tewCpWhktBMjwB9SJJ6xXgqMsP?=
 =?us-ascii?Q?u0UD2LLOwp/Pu73fLn5PkNI1ZebD2i3mazV920v+jzek7CiIklr63JBst9Mq?=
 =?us-ascii?Q?CLCgo+SGbx4pTWbZAFsjmmtX70LExSmGcUglKYHUT4pkNc1cPr7O0mTMQDFW?=
 =?us-ascii?Q?VqmfGoG4Bt/QmS8r9hzJQhCBMaPLGR1bSTDkQtT5E31r+YZTvC86Q29PRMgC?=
 =?us-ascii?Q?FOOZOkbXcKOHeNdZNm8VtEmWps3oAF2Na6OFzP2UgDm/PEkOoztKclBpp+Wf?=
 =?us-ascii?Q?Hx8BoEOdxgZOUX+RVCKWMZGsyC3nB2QkeGM4Wcy/KDyYy5bDytHgnLMmI58Z?=
 =?us-ascii?Q?yjM7tvf5ffWOuyr/lqNlqyietS6Ly2dD4wMCcnRKF4d4EaBavh98QzaX7qy+?=
 =?us-ascii?Q?J5aSsrDDCN98kFFMsYd7C7e2dPTy5QRe9qzL4uLVhK1tcyNX1MwWHozGzoKF?=
 =?us-ascii?Q?DrEX/eTu/XXOWdK+Ue7pgvIM+bDiUNFEzEtMhGUiwmH/ighnFRu0kAsfJXn0?=
 =?us-ascii?Q?24qYozb/m/FI0D0NTEU9pjZ83EnZM7vzZaZIKBo6Cn/E15mggbR2DrgudIPe?=
 =?us-ascii?Q?/tzh6fPl4RTio+PDXp134tjuiCVYMV0qfbgJ8XmbS/f7DnMVr5/oo6on+XdX?=
 =?us-ascii?Q?xCoua527orEUa/0O8HiQOI3dvGZXbl4xMwqQeS4yizR4NS31hyJdXmEiVGlr?=
 =?us-ascii?Q?Ts8Hva7HDu60anCjtbrUsGJeeqZZALSV49Wxl7nocc9BSbGRzY0+iUtjKPtO?=
 =?us-ascii?Q?DjEgu+Ze5j0U/YYBxcEu+OHaV7d7b8UdI3KDltCN13iEJm/7ysad3DVeRDBL?=
 =?us-ascii?Q?raGRYEuICNZlt94OEUToq8dAq10BzCwdiLhsa29khslBzf7byTHtElzUvpl0?=
 =?us-ascii?Q?ZPWSeHUSRodaLJdPn7sZAH6m/7rueKm+06llbg7MLgnXo3DVNVNNJFfNRfD5?=
 =?us-ascii?Q?8slu3h5fp1s3stXpBZ2W3LhVy4biMs/JsInj1ua/dLS4nVUS+pw9zkjUYBo3?=
 =?us-ascii?Q?SV6jyIgLJp+p6tQ/JP3xPEsoI13CPPuXd5ZL3ggyR2lEBoBmP7IaV26gi+Vc?=
 =?us-ascii?Q?YY+FlXInp20m4Hhfz3TkdAXvfFrzH7Fgr7XlTGslG1t3ffel5o1zGFaWQeTj?=
 =?us-ascii?Q?tQyMvR1RSIM17YSOqANr1oWYwcDXFkipjJSYATBYK5qp10w/e+icEiH6s//B?=
 =?us-ascii?Q?JXmBd9wvGg=3D=3D?=
X-Exchange-RoutingPolicyChecked: NesgVZkHjDrQaNbe80guiuHtmu9wSB3XvRrl8zIplnwz6iicVx6eZ/75NoklJu6xnzsNRvovyVVF3diK/hiCramXosG+IL4Ev+KB58vO7BMVqyq0bwEt92F2k4sBnc/+HVc5GmKdZcBvI8K6vrjhVs5GGgWIoTSfBIUk03M5+sOfwHZB9koRiJmb6KWMstnS4ahFx8UsZobnsEcWOhNAtk3dnzVqbpXnYO5OZAVxy3woq9E8I1YBI4CKDJLU88aee4PelPmejFv/gMkktmcztMQanh6CO5Dpx1BcF5FXCI16DxFEYk3eSFVZyb9ggVhohYq4wGe4kh2PCCtuBElacw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 13e08aba-54f3-427f-df45-08df35b00b80
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9273.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 11:30:33.6597 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CBi4apaLm+ouLD4x5GbUybAqku6D9GzNOO4In7GzhHSx4PuEzq6RrOSoFjZ5iIwrCdEyHRvogwJWl4DLWn2CAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR11MB9823
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On PTL+ platforms with eDP on TypeC, port B's DDI is connected to a C20
TypeC PHY. Identify PHY B as TypeC and map port B to TC_PORT_1 when eDP
TypeC support is enabled.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/9196
CC: stable@vger.kernel.org # 6.14+
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 5e40487e9ab06..10af12846e730 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -1904,6 +1904,11 @@ bool intel_phy_is_combo(struct intel_display *display, enum phy phy)
 		return false;
 }
 
+static bool intel_phy_is_edp_on_tc(struct intel_display *display, enum phy phy)
+{
+	return DISPLAY_RUNTIME_INFO(display)->edp_typec_support && phy == PHY_B;
+}
+
 /*
  * This function returns true if the DDI port respective to the PHY enumeration
  * is a Type-C capable port.
@@ -1924,6 +1929,9 @@ bool intel_phy_is_tc(struct intel_display *display, enum phy phy)
 	if (display->platform.dgfx)
 		return false;
 
+	if (intel_phy_is_edp_on_tc(display, phy))
+		return true;
+
 	if (DISPLAY_VER(display) >= 13)
 		return phy >= PHY_F && phy <= PHY_I;
 	else if (display->platform.tigerlake)
@@ -1974,6 +1982,9 @@ enum phy intel_port_to_phy(struct intel_display *display, enum port port)
  */
 enum tc_port intel_port_to_tc(struct intel_display *display, enum port port)
 {
+	if (intel_phy_is_edp_on_tc(display, intel_port_to_phy(display, port)))
+		return TC_PORT_1;
+
 	if (DISPLAY_VER(display) >= 12)
 		return TC_PORT_1 + port - PORT_TC1;
 	else
-- 
2.49.1

