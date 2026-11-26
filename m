Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A9B606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 10:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CDpscOyx;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=JcIgZJ/A
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AA9C1122B0;
	Thu, 26 Nov 2026 10:08:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 605B311229A;
 Thu, 26 Nov 2026 10:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795687706; x=1827223706;
 h=from:to:subject:date:message-id:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=mBmvyzuOULRXcGKh74DQIFEHH1M5n96mxJju+0pvi2Q=;
 b=CDpscOyxFSDhzh8fFrV6jIBAnnGv1Gkqi7dZ3kCLlT3G9/VqE0EDymNz
 roSE75MbK9gL6IofN0AOeLxy7gUNCyShWiL62GlzyaPFJL+Ess9bYeCLV
 MANbReMKUhSRb82kOcTPZn5mLJRCbirnQ8nPffV6kUSXKybed62dCWlH1
 SxAUZIVl5PHg37YxhlteVotG0SxU+PkNC4WnnuqN4MWZ/+MFtqgFgXmHw
 8QfLC7aVnTotIgw2lrxCWCYaOnEE3Y1HrElUuhnHqPnOHEc29KLTHkMcy
 tL50w3kRnP8cW8LehitmJeywHd4WUMQVhZFstuLRhqpVOkU2qK4L99av5 A==;
X-CSE-ConnectionGUID: 3Kuvdx7yT82aVDBT59jVwA==
X-CSE-MsgGUID: xziV0AgkQoSVNW4k6qtSYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4677543"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4677543"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 02:08:25 -0800
X-CSE-ConnectionGUID: NlmId6k7TpGgYQQVorpsXA==
X-CSE-MsgGUID: ogmgiDZVQbGk7qHQ9zuj4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; d="scan'208";a="14169351"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa013.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 02:08:25 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 02:08:24 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Thu, 26 Nov 2026 02:08:24 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.47) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 02:08:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qGz+KRFrLLGeyTANGTR/WYf0t9QNGwtfPMEugM8yvllNhc+4S1RvJP1gJg/xicpfG0tLCDbnlBvI2y+jUVlUeg1vZrmUkhuQUOTY6SiqfVbq4u46hmMk/eQPMmoghX0Z+ILHaXMGe3s4y4PKL8Fx/LwmYtADcQUI/yz2ayb6qWzOzAGEQqc2//jBsyacJUyewuihIkMcGQEzKfjncgemoEDOEBswq3vHulwLrfarPWd/S2N5S35V6sBdB1dR0KMlAlFpE1WbW13paq09w5VSbDcWihaRN6AI6es+Tcbjyr/OGAELAL7qY2+v6SXwqPkmSci6X8OYUUGfCsqbG2/h7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a4pf10Jli3NMRbr3ojcMs/lDp3STwFFc9dhwZP9s53o=;
 b=KED28HDw6SUgVwwmLQDeFeWfPTfeLEaWX2AE2M7xBFtnjSisVPZLdMCR5leolW6nFF+qO9ZWEyVMXKitiIR88+mhSdKsBQzS0/OZVA1wTw1ea8PAbHn/viKYY+wkG0lK/xFMxqOYWm3opN7cYhJmLoOrlpDi2Wemg10g0RbrCk+kSq+cGRLF6xLc/yNC69JxMRXgLjuMusuizxS2PiBykNldv6M3biInf+JAqPLIW6QBb858Hcdfpvl5BsI0kbUpILqg5SFbXoni9WUKcnEbLqBY/dgA1Vjz2Jho5z3fO9HE5USMxXtjbWsH65K0vACGGEiwikzByrgm+9KfMUaMVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a4pf10Jli3NMRbr3ojcMs/lDp3STwFFc9dhwZP9s53o=;
 b=JcIgZJ/AVdWHN9bSlrgCWfrnYDGk2dJhYpt9jGP8bjEMDoO2p2Qj96YL4QiKn/xTTgsrDbMPiCwbTERl1z8LSWjcpKtsWCOD879I1YAc9rymKKQbaSR/g027RtcDys3u3qe8g1LlcNx0eVUxXXT3yjwU7HUZZx/J0R2zjlnX8sY=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9273.namprd11.prod.outlook.com (2603:10b6:208:573::17)
 by CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 10:08:14 +0000
Received: from IA3PR11MB9273.namprd11.prod.outlook.com
 ([fe80::31a4:58c:e3b5:43fa]) by IA3PR11MB9273.namprd11.prod.outlook.com
 ([fe80::31a4:58c:e3b5:43fa%6]) with mapi id 15.21.0662.001; Thu, 26 Nov 2026
 10:08:14 +0000
From: Imre Deak <imre.deak@intel.com>
To: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
Subject: [PATCH 10/13] drm/i915/ddi_mgr: Keep AUX access consistent with DDI
 pool routes
Date: Thu, 26 Nov 2026 12:07:50 +0200
Message-ID: <20261126100755.1252635-11-imre.deak@intel.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20261126100755.1252635-1-imre.deak@intel.com>
References: <20261126100755.1252635-1-imre.deak@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV3PEPF0001DBA8.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::6e6) To IA3PR11MB9273.namprd11.prod.outlook.com
 (2603:10b6:208:573::17)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9273:EE_|CY5PR11MB6366:EE_
X-MS-Office365-Filtering-Correlation-Id: c0676096-512a-4377-4c1a-08df4ba52ef9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|10067099003|56012099006|11063799006|261026140227099003|261028144727099003|261022105027099003|261022075727099003|261021123027099003|261021121427099003|261102123227099003|261009223027099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: yQfPaCog51gC8rvkTlLMllaYpJ36uVLI2CLhwmUd9xgpxmv5opvu6QWAv6fDtXqafPfMOpBlgEfnPpxM8LZHQ4ujut6aG1AJ2vEnbisEJ45fHnh+mPClsEaEfXoHBs6G4m8uY7IzoIRTmTsXYMN/17ZC0kpbdb0dZge+4yBU+n7dcXhfzkQ41XetbvNzRQut+l6/YqvDs2bUReRSbcvYRYf4nSUQnIV9UpL1mYRIKd1Ox9ao0ggIGyslgIkRKRupRlT9Ch64oOC9mbTZa9/V69jP2u7MOclWXWu2BQe7PSP94ocuvhi3VViXKygusZ59BQfGXtYePRSM7SKgtfI09ppc/tZADLDC9O6nOici0Z+xr7ag2l5BX7+NpdDfrNPvsWd+WpfjMp+yKCO4H/fSNF3xAXXusyosZq4tXh3XUsxyeWuH1Mv8QmU6bzxBfwA00QydGX48Yzy8uAeymjgk3g8XVWT4KTSVCLxs0LasDEwUUfTkcLpm7cENyOinsEiQ/r33QDOwwO1exzMij4tWqHxUMLEHYpCcllAryrPTUyihh6HX996nFpsis5NaU0eDtjRMSLcWetUu/UetY9yY1D54jZYf3EHLMA7VHzL7avOCBEZF3Jcgc8slDktj7NBz/daFtbahNUtig/En2wqflqGW/DVoxKdMEFekm+C8Xbc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9273.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(10067099003)(56012099006)(11063799006)(261026140227099003)(261028144727099003)(261022105027099003)(261022075727099003)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kcMR00gIRfrnk07Kqel5YvE3GCPK+9IeUnNWRavf9WwLjBCAZ/xh35sqct7d?=
 =?us-ascii?Q?HQz5XD+VV4pv1l7u9DigTZ+JcsA5eChEE3TSmJ93/PAZ0zMdr5SiYYaZ7mxY?=
 =?us-ascii?Q?LdpzpYs/cJva3rcW3r0URAnu3iR3u0sEYWJzXJSIwVRh141YuiCLCYWwLu8Q?=
 =?us-ascii?Q?GxBwoaQI8so1RWiIXpV2bTnxV/VIBrum9EhhO30dXxZJElV8hgDcTa4AaI43?=
 =?us-ascii?Q?+6Mxn2AroUVWzQS6vWKOq33SHwbRfJTiixyAOIoyQL9o0OLLtffO/HLhFzQy?=
 =?us-ascii?Q?39TZ4QdjmScZKCxhd1xg36LxFxCn3ORAII5ohSqMbxX23U2OAtdtihEY/lU2?=
 =?us-ascii?Q?f5lzl3iWWXM3QL9kfLYWTFZnj0G+IwyB7wZ5lwNsxHurLiQr4tce/inwnuNv?=
 =?us-ascii?Q?mv2H0RaSyNoy17cxrHqQWjWhbC8oiKSNyfXjxVng8+3hh/OdIKPBrOUnbeHY?=
 =?us-ascii?Q?iu70kX7/UU0yKn+eqipVUmNgXHj+964ZLWsqkDaIvgAXHCxV38jQAC60hhap?=
 =?us-ascii?Q?Oj8+l5T8DMhbNRlM5m3LN3GXrnUb3zasD1f8FN1M6P7edD+Q+EjavysbVAip?=
 =?us-ascii?Q?zz5M75ZSKcEMQujN+dLjsr/fAKzjLpbJs4CveQc2zeQ2gctgjYVHHLICUyJT?=
 =?us-ascii?Q?Ql2dC5RtE0Ig4co7A83daaZaB8KMtlQ8AopmcfPjlOLvIxvGfBJ4v4Lv2eFh?=
 =?us-ascii?Q?TkNlqZ3YNSiWIHngfJAHMKWK2bc7mfZPFSS67NgWiVA4ueZ/gCOvZ98GITo0?=
 =?us-ascii?Q?dsEcqBb94nokl3VmRw1gibV4qHQM36b80d3hIM2YCeH+hOcw3I3i3DQKZNER?=
 =?us-ascii?Q?9eNETxHHYlHtwtzHxoj9JGtROYj8Y/MzihbPrOAl1Upib+vQlS32HzjDKnri?=
 =?us-ascii?Q?RjLbd/wU1dFXWap7vx4VmP90hvkIrQijOLvE0XpdAPZQdeKkY0U/IBibxRK+?=
 =?us-ascii?Q?fYOtg/z/h6haAYWkR+qmBymcOH4xBGfXlBgbz0o/lEKR4ogUNdZdHMqNXuYv?=
 =?us-ascii?Q?us1lZQxP/OfDgZTH8F2SG3GdIofsEWyAxH3ng4cWpzghI4Cl18MsNWzKUjd1?=
 =?us-ascii?Q?6jyVHzp5eByY1C/ZsCH3LxA7INuZSVkC5g9eGI/NXeTi7Sffior87JZt0YX/?=
 =?us-ascii?Q?tgkAxphJH58a+uMDPF8PLM5k+o4ZEZgroNSKkE67wwdBw7yQek+siFBoKDBX?=
 =?us-ascii?Q?f+ttB2a0LvYNoK0DIRXmNXECnHDCE3fBOWblX+ir45mdeSDNrPfelyLQWT5F?=
 =?us-ascii?Q?YpO3tg7IAqBrkTaPcb1HFl2gWV9NGsjl1JfdlZpoDp8BMglosGub+JJxnL2U?=
 =?us-ascii?Q?wDAKtzLn2K+4iqdXNZMyprO5UurYAjHEplsFKSfvk2zPfCK6X24AZeMIFsnA?=
 =?us-ascii?Q?5x05gdJGoyUYskueorbErzz3lsj7UBq7pC1spY0q5r7zHpA4IYeenE9Hg4lD?=
 =?us-ascii?Q?+ZpHBUNXpsnUQkH6UafqvwgpiaSnS0iRoRggk6ZTpKjEHKO5UfE0ca6meCFG?=
 =?us-ascii?Q?ohIxURLZGd3Cf0BInrVUHUpwO8thMqn9XmF7iVKj2poSYxQiPIMRRCd66sSe?=
 =?us-ascii?Q?o3tuaxWvG36FVtrZmzONpVe5MSeMtuUCfkvDq8Fm+0b0MQaOFPFMG0Yhwrz9?=
 =?us-ascii?Q?tdNJUSwn2EcOJBYFVFwG8umUvnZR9sqo3vP9ZTRtkbxkYmfuwxYMbiuO7Wei?=
 =?us-ascii?Q?tTzAy2BapDrtPBNe9ua8/SL79k1mhrjmrgcEs9/ctg7QFPlDeCqcOOQ2X+nJ?=
 =?us-ascii?Q?vpvf4GcuPA=3D=3D?=
X-Exchange-RoutingPolicyChecked: GN1K8TS4bb8GtWKitZWEMSUgwYyhn62lkyiZrSCT17k4HzTFAwbWMLyQoXA5rhhcQSeaWMvjCLLJjg6fsY0buYNyQyoyTkdmvqULVSrLufIvvtjAFKCDYWLVwOUcFXEH+ArqzG4Ty5b0BgsHcRghjexIfNLqxhhpa0biLKX80Irn/e+2te/biuNqqAFzz8ikBhZxXewX6zgqPv27H0OyXbLl1BV8lHThB7v4WuXwvN1yD5IPM8Jx6CffHd80RPB8TcwmI8WQqGsg8tC+gsIkojjHyeVZB3KA6O/9iuhGvYbIt/FJU32yHBUYICVfj2nfsWNAZk6zy4WXAAJ0cmYTPw==
X-MS-Exchange-CrossTenant-Network-Message-Id: c0676096-512a-4377-4c1a-08df4ba52ef9
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9273.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 10:08:14.2421 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZJTkIuw/NegpE3WjDPEL0WXdpC3vEfaYpqRFg0I/c0lwh+A3YRBQwcRyiRimeCU6Rw+CvEjtL/tA7zQh1AMTpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6366
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

Select the AUX channel from the VBT entry for the encoder's fixed DDI.
The other VBT parameters follow the physical port through
encoder->devdata. Preserve the DDI's VBT AUX assignment and the existing
platform-default fallback when no channel is specified.

Reject AUX transfers when an encoder's DDI serves a legacy PHY whose
VBT entry has no DP support, such as an HDMI-only port. The DP connector
registered for possible alt-mode use must not issue AUX transfers to
that legacy port.

Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi_mgr.c | 11 +++++++++++
 drivers/gpu/drm/i915/display/intel_ddi_mgr.h |  1 +
 drivers/gpu/drm/i915/display/intel_dp_aux.c  | 15 ++++++++++++++-
 3 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi_mgr.c b/drivers/gpu/drm/i915/display/intel_ddi_mgr.c
index 58e48a61b8160..236146a37fc34 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi_mgr.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi_mgr.c
@@ -161,6 +161,17 @@ intel_ddi_mgr_get_devdata_for_ddi(struct intel_display *display, enum port ddi)
 	return intel_bios_encoder_data_lookup(display, port);
 }
 
+bool intel_ddi_mgr_aux_available(struct intel_encoder *encoder)
+{
+	struct intel_display *display = to_intel_display(encoder);
+
+	if (!intel_ddi_mgr_is_pool_ddi(display, encoder->port))
+		return true;
+
+	return !intel_ddi_mgr_is_legacy_pool_encoder(encoder) ||
+		intel_bios_encoder_supports_dp(encoder->devdata);
+}
+
 static struct intel_digital_port *connector_dig_port(struct intel_connector *connector)
 {
 	if (intel_attached_encoder(connector))
diff --git a/drivers/gpu/drm/i915/display/intel_ddi_mgr.h b/drivers/gpu/drm/i915/display/intel_ddi_mgr.h
index 887075e019770..db10d0e8b3a97 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi_mgr.h
+++ b/drivers/gpu/drm/i915/display/intel_ddi_mgr.h
@@ -19,6 +19,7 @@ bool intel_ddi_mgr_is_pool_ddi(struct intel_display *display, enum port ddi);
 bool intel_ddi_mgr_pool_supports_hdmi(struct intel_display *display);
 bool intel_ddi_mgr_is_legacy_pool_encoder(struct intel_encoder *encoder);
 bool intel_ddi_mgr_encoder_has_lane_reversal(struct intel_encoder *encoder);
+bool intel_ddi_mgr_aux_available(struct intel_encoder *encoder);
 bool intel_ddi_mgr_connector_available(struct intel_connector *connector);
 u8 intel_ddi_mgr_ddc_pin_for_ddi(struct intel_display *display, enum port ddi);
 const struct intel_bios_encoder_data *
diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux.c b/drivers/gpu/drm/i915/display/intel_dp_aux.c
index 71bcb26240ffa..7d7bbf063be3a 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux.c
@@ -5,6 +5,7 @@
 
 #include <drm/drm_print.h>
 
+#include "intel_ddi_mgr.h"
 #include "intel_de.h"
 #include "intel_display_jiffies.h"
 #include "intel_display_types.h"
@@ -549,6 +550,9 @@ intel_dp_aux_transfer(struct drm_dp_aux *aux, struct drm_dp_aux_msg *msg)
 	u32 flags = intel_dp_aux_xfer_flags(msg);
 	int ret;
 
+	if (!intel_ddi_mgr_aux_available(&dp_to_dig_port(intel_dp)->base))
+		return -ENXIO;
+
 	intel_dp_aux_header(txbuf, msg);
 
 	switch (msg->request & ~DP_AUX_I2C_MOT) {
@@ -933,12 +937,21 @@ get_encoder_by_aux_ch(struct intel_encoder *encoder,
 enum aux_ch intel_dp_aux_ch(struct intel_encoder *encoder)
 {
 	struct intel_display *display = to_intel_display(encoder);
+	const struct intel_bios_encoder_data *devdata = encoder->devdata;
 	struct intel_encoder *other;
 	const char *source;
 	enum aux_ch aux_ch;
 	char buf[AUX_CH_NAME_BUFSIZE];
 
-	aux_ch = intel_bios_dp_aux_ch(encoder->devdata);
+	/*
+	 * VBT parameters come from the PHY-specific encoder->devdata, except
+	 * for the AUX channel, which is tied to the fixed DDI. Use the VBT
+	 * entry for encoder->port to select the AUX channel.
+	 */
+	if (intel_ddi_mgr_is_pool_ddi(display, encoder->port))
+		devdata = intel_bios_encoder_data_lookup(display, encoder->port);
+
+	aux_ch = intel_bios_dp_aux_ch(devdata);
 	source = "VBT";
 
 	if (aux_ch == AUX_CH_NONE) {
-- 
2.49.1

