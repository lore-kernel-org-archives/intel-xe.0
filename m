Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B84606A327
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 10:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CicVbTPi;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=CAQcYbiA
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AFCD1122A0;
	Thu, 26 Nov 2026 10:08:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AA6F112286;
 Thu, 26 Nov 2026 10:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795687696; x=1827223696;
 h=from:to:subject:date:message-id:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=H4Ay9NfDZyLe1DURGuhATE0lIe0IcY+ABjDFy8Nd2Rc=;
 b=CicVbTPi1q0JW8wWWZf1oFMMk+YUA7W7z24G5kc84zHurkSPfGpo7pEq
 LlE8EN1gOSWzlj+WxV0BitSJuPa4lfiyoCCf0BOKmahvota2Ax0kSPT3P
 kHs3p1HbuXFtVQ1yF7PgGZ3kRhIw7aSkfItwXlySeE1kMXwJgM92dGXtO
 pvJ+dt++K4v8ZPKOpIzy8lOqhi20m5qjIWFwlFSIZXIIgYAsjXeKlAciR
 d4+n6gQ6RkN+1VzgDccODU6DcyJA1czrexsRroRTDPAh8r6gD0/xfhIAE
 BE+oGvQ9n2ZVtdNBQ+zqAkRt1W01EhdUuLWNH/bJK8vq6c31bUbu13TQt w==;
X-CSE-ConnectionGUID: HznjN3MGQVG64P8yIM11xw==
X-CSE-MsgGUID: x1kOlREyTymvBi1/Szh62w==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4677525"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4677525"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 02:08:16 -0800
X-CSE-ConnectionGUID: knQd++NmQaKF751ImmG63A==
X-CSE-MsgGUID: kjIa2LNtTg+iqmv6B14Ikw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; d="scan'208";a="14169308"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa013.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 02:08:15 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 02:08:15 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Thu, 26 Nov 2026 02:08:15 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.47) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 02:08:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o5XQQrmVBG8dO6vB4LX1KTOnXK0q1KGrUIAFAREsphxoxuPFrlWpjYhCPXYBdNifIp0p/8o9OHxdhwSzQG4vX9PygKAKYhntv2JnTCgjWzpLf8qtHVB/dcuPyadJyp7iIRbp7gFHtvna+2e8JS0LN/6u2HefUOqBphVC9uzWP2DD3AhyhThnTzkOtYKBX4cOS3m689b2QWm5KfcnqEQKwJ0924JkGkiUHuGLZ5fBRlhDOZodgqBCj+q5O/nlBpAYS7v8rM/HPNMAltP4L350LikIcpG462OCODVLh9RoHD+pgyGnOO/4uAMpNp6bSKR2MssKvmDEc9jFP9tKXD/HuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ILkS3HxDrsq9Rn4mp9cFFuOA/woRI3b2ZF6g34lcTyE=;
 b=vo+YCc5CNiZDh9xj1z7CDXSq6qj6r66Ff60oz5YBh6Snwx91LETdMCbiVOHSzGBMf4nDy0LwSjAWOsYlWry8r2cqfat5oTEkIX1FSS11wmIygFgZs/WFD8pFfVaYxFwZ1vOY/naR1KIHNd/qmPQG2bT86YqRhNOre38omJMagXaWf/qnpRaQJWFTm1UGZdA9rcHNifY/8TY+KmHvB4Y3A0nyxMtDroUydLiCDTw+jS/VOVSq9y1KGkRAe4lecjip7oprtZg8D+IVBw+kfdvSL7DzrlcHRh43fgQYAGB2gSbrmik7vYI8Be70b9Xcm9P9IZ88bk7wzcVQyzntnqMacA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ILkS3HxDrsq9Rn4mp9cFFuOA/woRI3b2ZF6g34lcTyE=;
 b=CAQcYbiAe4UcLfY7xyryxd9tVMfVOje42Uvla2RbR60Ne1AxIaDm4YhRIZZNEHEAd7NPWbvWj3B4GchrI2RAtr4hIEVrEgQJgcz0RwCWBdXEQ0nEj6eQ8ZkE6fnAUyoY4UxJXBhMM7ribfBlvbrhx1Fvq3+eWTxicuwbSFuCAPs=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9273.namprd11.prod.outlook.com (2603:10b6:208:573::17)
 by CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 10:08:04 +0000
Received: from IA3PR11MB9273.namprd11.prod.outlook.com
 ([fe80::31a4:58c:e3b5:43fa]) by IA3PR11MB9273.namprd11.prod.outlook.com
 ([fe80::31a4:58c:e3b5:43fa%6]) with mapi id 15.21.0662.001; Thu, 26 Nov 2026
 10:08:04 +0000
From: Imre Deak <imre.deak@intel.com>
To: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
Subject: [PATCH 03/13] drm/i915/nvl+: Add support for remapping logical HPD
 pins to HW pins
Date: Thu, 26 Nov 2026 12:07:43 +0200
Message-ID: <20261126100755.1252635-4-imre.deak@intel.com>
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
X-MS-Office365-Filtering-Correlation-Id: dd937b6a-faee-428b-d350-08df4ba52945
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|10067099003|56012099006|11063799006|261026130827099003|261026135527099003|261026121527099003|261026140227099003|261028144727099003|261022115727099003|261022113327099003|261022105027099003|261022075727099003|261021130227099003|261021123027099003|261021121427099003|261021135927099003|261021133027099003|261102123227099003|261009223027099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: iYQtEdZYn4ImoeVdizJuR2mkJXZat8pjqEpzGxE02KLz+eHHj2KVKP7Nim5EIYEFgAtP0461FHOI322l+ISGDC4/hBCNVOHyBsojNsyFRpVnNAtI9V0c/7jZW+nXUk8ZKsWuec4rvwohsKIyB67HxZMGsavbpmHKKA0/stc/sAsoPWAL1U+rRpwE47vOSdCJJ9RwQYeTu/PEoztIs1YkhhRRcBfpQH//BXAxSMm0vNfXFg/i4v0bIhgshsb4cj6GN5RQO5FL3VqA6sNar8GX+3ks4T64FxEfmU7RTiPaVIUruM23BkOGHzrdXr3lalo53fMTrFn3H6h0EqF3mmPDCf0QTZOWrbgHBlWcZm2mnjUExuw3vmBIALWAqPCAbE9/bwwYZHU+OFLLkEQw11uVM/jnir8diucieJDnpA+GoDHSynE6NSYUqx0zYaO81ux8QV/Yx5KK8sMiXum33qhVQksGfFS9yiwF+rKzQ0N59QX4JracYC1LJGsKRUx9ajFOQE0742Yk7nRt70yo/AreBE/5orhC4OnpG2f1Es1my0eqmGO02PesQusZq2htWCDImdLdkmG8fshbLidAq6+VAMAR5wcU6xRmuXkAcW4/ejwfwXH1qnCtubVLwl8dmANe6CT5wXim0U6MfRQtN/z3dnGnu1RwH7BUXVXlUk3Jwkk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9273.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(10067099003)(56012099006)(11063799006)(261026130827099003)(261026135527099003)(261026121527099003)(261026140227099003)(261028144727099003)(261022115727099003)(261022113327099003)(261022105027099003)(261022075727099003)(261021130227099003)(261021123027099003)(261021121427099003)(261021135927099003)(261021133027099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pAyQKBuToq1JR7G6zgartYJWIX58nuuEtiveHGEkyBP2sSSet9rzJXp1BYvj?=
 =?us-ascii?Q?KTWV+K4zFcKOu84iD9qt7mkNnCgqcT9PLh0wkiCzNNrSuvFCMIAMMOcnf8Mc?=
 =?us-ascii?Q?L7kXxUycJnqxVnEGA4mA0OEYmcN3HMaBJp2o050SSnhUzm+wOIJ1wDd6Nck4?=
 =?us-ascii?Q?HbC9QMa+IGChfOK6vwVcfUrN+n+HSViZfKAOqhJt27uQvlRokSeGmEfZbKtk?=
 =?us-ascii?Q?2pik1joUMhqmQBGZrY5ej1kZNR4vPvHYNThEBUH0WZrvquiciqR/168iQBlA?=
 =?us-ascii?Q?PVH1zf5PDwYnATLtF+7+AbP2REuwE3X3dPEc4n1r+pHWZEnjDttQVTKndrEU?=
 =?us-ascii?Q?f0XrWVfkRb0EzbennPh/JYjdcSu4jB/W8+e3pP/XIAcBn3viKLsIaI5Fb/PW?=
 =?us-ascii?Q?rNoIaQLUTF10dxPDtZEvccGeBO3rZjXpooJyrL/6nWx2Ph6y557236sojeBt?=
 =?us-ascii?Q?YGk+Fd9I5S4KHkktzYQFH+Ei1vzPGbGaj8EARbODZ1LYZ2kqQDTVv1Ym5I3n?=
 =?us-ascii?Q?ooEuWZ+PABS+b+61SzuSRP2/+gtMhOVQLGOQkJUN2256vTdA5VQNN/NVuwBS?=
 =?us-ascii?Q?WYMy/mubZ5VaPg9Mh6gnN9FInBoG4eLmkMJw745GkBUMxqQPn3XANZlgJnIC?=
 =?us-ascii?Q?51F61V8R4Phxq+05SwqbVwZ2O7KbWNIyVOQ0U/CXd3oXnSAUOLDpkPwyzJtF?=
 =?us-ascii?Q?PNngdDxFWloAWq4r+xDTfB4gxdG3pcjlEEbGNyQudDmd/yJ/Wc6DYSLeBCBX?=
 =?us-ascii?Q?9/h0mGUnBBnc/Z4r3HLuFeCv3f5OoIesICnbh6ZxJV70ND3RZPduKDuvVAGt?=
 =?us-ascii?Q?YKgaAb1KX5RADLOyb0vkPKep8a7115Ui7vi0UYstdGE5Y3ZjOJ4fuNlZcPlS?=
 =?us-ascii?Q?7evLadoOYbtxQtE2IYVULtKLf/Njn51cNCVdi6ZSFSDolwyWisJW4Juq8mo9?=
 =?us-ascii?Q?4rT/zJY1pC4fSpFOcTRGXaTP60KxFlKd0CFDOHsDXPg6XoppGazV1AOmudU0?=
 =?us-ascii?Q?ZXg5F/+3UkvnBcIUGlI0FWA3sbFSdD6IMrH7mF7ZLf/aut/bUlI8bwWes1Am?=
 =?us-ascii?Q?PtQekxHgeTeRCbqhZz1yEz43C/T4+yvwMbewJvhKaLheT4g+D5TGeCpTI7lL?=
 =?us-ascii?Q?WK2fwms7SMuYm4BPw3iY29zM0zYIZwx5Bxe0L4GXbL1h9rrUgDf8DOXMSKi+?=
 =?us-ascii?Q?fTchkLp473DnYolb9P1VlN/Zs7n3mWvAKiyLLfS8UeHE/0duMVu9+tT5QVVf?=
 =?us-ascii?Q?XgxOHHZFWqzZdKvcIP8q22k3IIz2wcPCnotuXmLtoCVLqItYSPdeOZQtkX8W?=
 =?us-ascii?Q?SQBCEHKHZglIXhobAG4XsCB84YRVhXAMttQ8PbgUx3y1hks3TopMgqxQUZ3Y?=
 =?us-ascii?Q?IYaps9a2lFWNO/deYAw30rxYKZ0ti+zMxRotiD0bY3+e4a5ugH+aTM8vybMR?=
 =?us-ascii?Q?1NpJ1opo8Nyxs1wVin/2ID798g+cNqWMkngOdu61cLYLCQSrpak/I3tGyhcq?=
 =?us-ascii?Q?2/cqgC1/fLeXgWRYFxDIiReA3AUIEn2WVnkJrVfvRivYpVVY3goyLahPPNUK?=
 =?us-ascii?Q?ZOmuj0DHbtTeMYWkY5q5UPUlKI7mvdUTLCKoGZ2WA66ODEQIprifQnmCYlYQ?=
 =?us-ascii?Q?vUO7WCyT0Q516IbPwa3dqcSloCAJRZ3aJZeCyG2ZUd9xWm6et123s3dV3B5b?=
 =?us-ascii?Q?qhhHPRGsawLYvVWwR/zROU18HY7rK46+PiCTaoopEXDOaPRMg+Zw4uF04O0B?=
 =?us-ascii?Q?ZQMjQuDfeQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: eb7mNtBbT8juRJcOmOZFdjIgB9SFPXlEYCLBSwIcTTVMgdDpBRQLynx+pkbi+rYfpKqg2nWXlyC6rYmCsmZAStmzW1n1SMW86447y5C2YE44WQysytJ49syBiI1qllTkLKSGGBK518YDyrTj/Rl05CXJ2COByhvNUjCg79O8MACa3s/c0TqXZp70q5qXQpuZHpqL375XbK7KwfaksOwH+zud9QFDVvstX9ISAuAzgtiSmnUZGrdzWd9vAeUCixpQFNz/XV5ub/Hu6veMCKGihzVJv0KSdRBNe73bHJXZgHzhz6G/42goGJTacF/nX2FGT+h8jbp5+i2UDafWj5j82Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: dd937b6a-faee-428b-d350-08df4ba52945
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9273.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 10:08:04.6907 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a9SDoL4UHzeiAnH8DpmVxbvMkzQWSbbaVh1Wu/ySi/JjaNSjQqHZ7gbS3G2iAnNiWDTvBwzHSFvJu+agfSrz2Q==
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
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add support for remapping an encoder's logical HPD pin to north and PCH
HW pins. This prepares for moving a legacy port's handling to another
encoder, changing a TC encoder's legacy/alt mode role and its
legacy/DP-alt/TBT-alt HPD sources.

Only the legacy PCH mapping needs to select a different HW pin. North
pins retain their identity mapping or have their source disabled.

Limit support to NVL+ for now, leaving a unified approach for later.

Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 .../gpu/drm/i915/display/intel_display_core.h |   4 +
 .../gpu/drm/i915/display/intel_hotplug_irq.c  | 115 ++++++++++++++++--
 .../gpu/drm/i915/display/intel_hotplug_irq.h  |   4 +
 3 files changed, 113 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_core.h b/drivers/gpu/drm/i915/display/intel_display_core.h
index b422d24e21b2d..72183bfee07a3 100644
--- a/drivers/gpu/drm/i915/display/intel_display_core.h
+++ b/drivers/gpu/drm/i915/display/intel_display_core.h
@@ -168,6 +168,10 @@ struct intel_hotplug {
 	struct delayed_work hotplug_work;
 
 	const u32 *hpd, *pch_hpd;
+	/* Mutable hardware sources for stable logical pins on NVL+. */
+	u32 hpd_map[HPD_NUM_PINS], pch_hpd_map[HPD_NUM_PINS];
+	/* Logical to physical PCH pin; HPD_NONE means no south source. */
+	enum hpd_pin pch_pin_map[HPD_NUM_PINS];
 
 	struct {
 		unsigned long last_jiffies;
diff --git a/drivers/gpu/drm/i915/display/intel_hotplug_irq.c b/drivers/gpu/drm/i915/display/intel_hotplug_irq.c
index 81aaf38f1b130..da45eb4775707 100644
--- a/drivers/gpu/drm/i915/display/intel_hotplug_irq.c
+++ b/drivers/gpu/drm/i915/display/intel_hotplug_irq.c
@@ -136,6 +136,14 @@ static const u32 hpd_mtp[HPD_NUM_PINS] = {
 static void intel_hpd_init_pins(struct intel_display *display)
 {
 	struct intel_hotplug *hpd = &display->hotplug;
+	enum hpd_pin pin;
+
+	/*
+	 * NOTE: the pin map is only used by MTL+, but for simplicity init it
+	 * for all platforms.
+	 */
+	for (pin = HPD_NONE; pin < HPD_NUM_PINS; pin++)
+		hpd->pch_pin_map[pin] = pin;
 
 	if (HAS_GMCH(display)) {
 		if (display->platform.g4x || display->platform.valleyview ||
@@ -146,7 +154,14 @@ static void intel_hpd_init_pins(struct intel_display *display)
 		return;
 	}
 
-	if (DISPLAY_VER(display) >= 14)
+	if (DISPLAY_VER(display) >= 35) {
+		/*
+		 * The (north) HPD map is only used by NVL+.
+		 * TODO: Make the mapping logic platform independent.
+		 */
+		memcpy(hpd->hpd_map, hpd_xelpdp, sizeof(hpd->hpd_map));
+		hpd->hpd = hpd->hpd_map;
+	} else if (DISPLAY_VER(display) >= 14)
 		hpd->hpd = hpd_xelpdp;
 	else if (DISPLAY_VER(display) >= 11)
 		hpd->hpd = hpd_gen11;
@@ -165,7 +180,14 @@ static void intel_hpd_init_pins(struct intel_display *display)
 	    (!HAS_PCH_SPLIT(display) || HAS_PCH_NOP(display)))
 		return;
 
-	if (INTEL_PCH_TYPE(display) >= PCH_MTL)
+	if (DISPLAY_VER(display) >= 35) {
+		/*
+		 * The PCH HPD map is only used by NVL+.
+		 * TODO: Make the mapping logic platform independent.
+		 */
+		memcpy(hpd->pch_hpd_map, hpd_mtp, sizeof(hpd->pch_hpd_map));
+		hpd->pch_hpd = hpd->pch_hpd_map;
+	} else if (INTEL_PCH_TYPE(display) >= PCH_MTL)
 		hpd->pch_hpd = hpd_mtp;
 	else if (INTEL_PCH_TYPE(display) >= PCH_DG1)
 		hpd->pch_hpd = hpd_sde_dg1;
@@ -181,6 +203,38 @@ static void intel_hpd_init_pins(struct intel_display *display)
 		MISSING_CASE(INTEL_PCH_TYPE(display));
 }
 
+/*
+ * Remap an encoder's logical TC HPD pin to separate north and PCH HW HPD
+ * pins. The north mapping must be an identity mapping or disable the
+ * source. The PCH mapping may select any TC HW pin or disable the source.
+ * Either source is disabled by mapping it to HPD_NONE.
+ *
+ * TODO: Make the remapping generic and independent of the platform.
+ */
+void intel_hpd_set_pin_sources(struct intel_display *display, enum
+			       hpd_pin logical_pin, enum hpd_pin hw_pin,
+			       enum hpd_pin pch_hw_pin)
+{
+	struct intel_hotplug *hpd = &display->hotplug;
+
+	if (drm_WARN_ON(display->drm, DISPLAY_VER(display) < 35))
+		return;
+
+	if (drm_WARN_ON(display->drm, logical_pin < HPD_PORT_TC1 || logical_pin > HPD_PORT_TC4))
+		return;
+
+	if (drm_WARN_ON(display->drm, hw_pin != HPD_NONE && logical_pin != hw_pin))
+		return;
+
+	if (drm_WARN_ON(display->drm, pch_hw_pin != HPD_NONE &&
+				      (pch_hw_pin < HPD_PORT_TC1 || pch_hw_pin > HPD_PORT_TC4)))
+		return;
+
+	hpd->hpd_map[logical_pin] = hpd_xelpdp[hw_pin];
+	hpd->pch_pin_map[logical_pin] = pch_hw_pin;
+	hpd->pch_hpd_map[logical_pin] = hpd_mtp[pch_hw_pin];
+}
+
 /* For display hotplug interrupt */
 void i915_hotplug_interrupt_update_locked(struct intel_display *display,
 					  u32 mask, u32 bits)
@@ -552,6 +606,28 @@ void xelpdp_pica_irq_handler(struct intel_display *display, u32 iir)
 			"Unexpected DE HPD/AUX interrupt 0x%08x\n", iir);
 }
 
+static void xe3plpd_tc_hpd_pins(struct intel_display *display,
+			      u32 *pin_mask, u32 *long_mask,
+			      u32 trigger, u32 hotplug_reg)
+{
+	enum hpd_pin pin;
+
+	for (pin = HPD_PORT_TC1; pin <= HPD_PORT_TC4; pin++) {
+		enum hpd_pin hw_pin = display->hotplug.pch_pin_map[pin];
+
+		if (!(display->hotplug.pch_hpd[pin] & trigger))
+			continue;
+
+		*pin_mask |= BIT(pin);
+		if (icp_tc_port_hotplug_long_detect(hw_pin, hotplug_reg))
+			*long_mask |= BIT(pin);
+	}
+
+	drm_dbg_kms(display->drm,
+		    "hotplug event received, stat 0x%08x, dig 0x%08x, pins 0x%08x, long 0x%08x\n",
+		    trigger, hotplug_reg, *pin_mask, *long_mask);
+}
+
 void icp_irq_handler(struct intel_display *display, u32 pch_iir)
 {
 	u32 ddi_hotplug_trigger = pch_iir & SDE_DDI_HOTPLUG_MASK_ICP;
@@ -577,10 +653,14 @@ void icp_irq_handler(struct intel_display *display, u32 pch_iir)
 
 		dig_hotplug_reg = intel_de_rmw_fw(display, SHOTPLUG_CTL_TC, 0, 0);
 
-		intel_get_hpd_pins(display, &pin_mask, &long_mask,
-				   tc_hotplug_trigger, dig_hotplug_reg,
-				   display->hotplug.pch_hpd,
-				   icp_tc_port_hotplug_long_detect);
+		if (DISPLAY_VER(display) >= 35)
+			xe3plpd_tc_hpd_pins(display, &pin_mask, &long_mask,
+					   tc_hotplug_trigger, dig_hotplug_reg);
+		else
+			intel_get_hpd_pins(display, &pin_mask, &long_mask,
+					   tc_hotplug_trigger, dig_hotplug_reg,
+					   display->hotplug.pch_hpd,
+					   icp_tc_port_hotplug_long_detect);
 	}
 
 	if (pin_mask)
@@ -994,7 +1074,10 @@ static u32 mtp_tc_hotplug_mask(enum hpd_pin hpd_pin)
 
 static u32 mtp_tc_hotplug_enables(struct intel_encoder *encoder)
 {
-	return mtp_tc_hotplug_mask(encoder->hpd_pin);
+	struct intel_display *display = to_intel_display(encoder);
+	enum hpd_pin hw_pin = display->hotplug.pch_pin_map[encoder->hpd_pin];
+
+	return mtp_tc_hotplug_mask(hw_pin);
 }
 
 static void mtp_ddi_hpd_detection_setup(struct intel_display *display)
@@ -1096,6 +1179,12 @@ static void _xelpdp_pica_hpd_detection_setup(struct intel_display *display,
 	u32 mask = XELPDP_TBT_HOTPLUG_ENABLE |
 		XELPDP_DP_ALT_HOTPLUG_ENABLE;
 
+	/*
+	 * North HPD mappings are either identity mappings or disabled, so the
+	 * logical pin passed here can also be used as the HW pin.
+	 *
+	 * TODO: Unify north and PCH HPD mapping handling.
+	 */
 	if (!is_xelpdp_pica_hpd_pin(hpd_pin))
 		return;
 
@@ -1119,7 +1208,8 @@ static void xelpdp_pica_hpd_detection_setup(struct intel_display *display)
 	BUILD_BUG_ON(BITS_PER_TYPE(available_pins) < HPD_NUM_PINS);
 
 	for_each_intel_encoder(display->drm, encoder)
-		available_pins |= BIT(encoder->hpd_pin);
+		if (display->hotplug.hpd[encoder->hpd_pin])
+			available_pins |= BIT(encoder->hpd_pin);
 
 	for_each_hpd_pin(pin)
 		_xelpdp_pica_hpd_detection_setup(display, pin, available_pins & BIT(pin));
@@ -1127,8 +1217,13 @@ static void xelpdp_pica_hpd_detection_setup(struct intel_display *display)
 
 static void xelpdp_hpd_enable_detection(struct intel_encoder *encoder)
 {
-	xelpdp_pica_hpd_enable_detection(encoder);
-	mtp_hpd_enable_detection(encoder);
+	struct intel_display *display = to_intel_display(encoder);
+
+	if (display->hotplug.hpd[encoder->hpd_pin])
+		xelpdp_pica_hpd_enable_detection(encoder);
+
+	if (display->hotplug.pch_hpd[encoder->hpd_pin])
+		mtp_hpd_enable_detection(encoder);
 }
 
 static void xelpdp_hpd_irq_setup(struct intel_display *display)
diff --git a/drivers/gpu/drm/i915/display/intel_hotplug_irq.h b/drivers/gpu/drm/i915/display/intel_hotplug_irq.h
index 9063bb02a2e9a..9bfa446202b69 100644
--- a/drivers/gpu/drm/i915/display/intel_hotplug_irq.h
+++ b/drivers/gpu/drm/i915/display/intel_hotplug_irq.h
@@ -8,6 +8,7 @@
 
 #include <linux/types.h>
 
+enum hpd_pin;
 struct intel_display;
 struct intel_encoder;
 
@@ -27,6 +28,9 @@ void i915_hotplug_interrupt_update_locked(struct intel_display *display,
 void i915_hotplug_interrupt_update(struct intel_display *display,
 				   u32 mask, u32 bits);
 
+void intel_hpd_set_pin_sources(struct intel_display *display, enum hpd_pin logical_pin,
+			       enum hpd_pin hw_pin, enum hpd_pin pch_hw_pin);
+
 void intel_hpd_enable_detection(struct intel_encoder *encoder);
 void intel_hpd_irq_setup(struct intel_display *display);
 
-- 
2.49.1

