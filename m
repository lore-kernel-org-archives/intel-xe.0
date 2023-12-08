Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFBDEC10DC1
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 17:13:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CC4E10EAD5;
	Fri,  8 Dec 2023 17:13:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DF8C10EACF
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Dec 2023 17:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702055617; x=1733591617;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=3W2lCMKe1iY+5qNxhhY6EhOALucL5AO5nXnCFVMs4XI=;
 b=OtoAFV/7ZeCPwQBL0c91tZE97UvHWkoaS6M0+mJAlbxM+xqFIwJWdkkC
 ajbNg4nWTSx6V73s4omhiLpYbYgFRNNDP8pFtx1N1THMzzZgk5QWHqeQF
 R4r4JPjTH30oIo8Ew2p0HCQL5pbv6Ue3rHJJ249Cr3wKE62Ihm0KRE5xm
 /6kdlkLHlZhFG7gOTClRBHeo04SMI5SvfK2GVgjcS4AiBN+/CzOLRfevX
 6P2vnm1giE1b4Fdfhyk1b3gzo/bqCx9msuqjP2a2k48IJw5RJcOQ54Xno
 Ho7+N09mDHZtqbFVSwkjZkH5R0XGUS5ED1iG+14HMqfih6ETNVOoF4SZr A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="379430589"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; d="scan'208";a="379430589"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2023 09:13:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="772194888"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; d="scan'208";a="772194888"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Dec 2023 09:13:32 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 8 Dec 2023 09:13:31 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 8 Dec 2023 09:13:31 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 8 Dec 2023 09:13:31 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 8 Dec 2023 09:13:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TSDZbJzSZAdfwizhJN1QXR2m1eqAAvUmgP538aU+0bRn8TBjZxTvheF6Ao91W/A1x8KyUWlvkYsFsjyox6fsjByc7NU94oI4Av+c7mKoJH/heKAauQqmJ+RD5lqr77DXm5tfuO9gs7xoAPNRl+7Abr+uwR9PuoNBxIV4Hkp0ShK6gdoQJQXxN3dKs1MYyohJUn+J9xXloQU/O+exGrTMiLLJviqSTdKUaGFmKtJKFK0zwrW6ZJyk9GMh8YYZW2kezbblLaVoZI1HdRlWnP5WcCVuZXUhL1wUEoqZvc9LT0mX1PxZlgP5yiCXb076Ae7cHegUiWZJL6WnNYlIC8yY/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wZffEUbZpocAUQScFdef0yPDlekQJ5u0yx1LAM5DeS8=;
 b=edsIWITs2iRw7r/LLE8RyX5MurrIOqjqyK7PTXJxkU50Y/n/DAsujadV4wfmomLaTbH9uJXkaJ4nnd18iwafjgEwLVqYO5ethoFOtTp4vmSXtyisT52fh2Cu9Bgppb56Tl3iLLTGCBu1KlyTEseO0ri93iiJMFxa+LPixkFvLFv9kFq8XIUxuZRl5Lm709f+rgBDbx4FNITXmuYH56P8iQtssKqNZJ3ai52LpV8IXj2ELo2kn5xRCwW3IcggxPNiMOc0mn8xDAnYqOgvYlD6FGc+uyCJ8PGEUf1OCgWsl27W8Jyp3ebPyE0bFtg8ln80JD5pVOsjmPPXD6N3iaGbhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MW4PR11MB5934.namprd11.prod.outlook.com (2603:10b6:303:189::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.27; Fri, 8 Dec
 2023 17:13:28 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7068.027; Fri, 8 Dec 2023
 17:13:28 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>, <lucas.demarchi@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <ogabbay@kernel.org>,
 <daniel.vetter@ffwll.ch>, <joonas.lahtinen@linux.intel.com>
Subject: [PATCH 2/3] fixup! drm/xe: Introduce a new DRM driver for Intel GPUs
Date: Fri, 8 Dec 2023 12:11:05 -0500
Message-ID: <20231208171316.901795-3-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231208171316.901795-1-rodrigo.vivi@intel.com>
References: <20231208171316.901795-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0381.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::26) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MW4PR11MB5934:EE_
X-MS-Office365-Filtering-Correlation-Id: ed577457-e328-4e36-04bb-08dbf810feb0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r0fkPPl55gut2Et6FYsyBbTHEY6Rv3Xot/gWvV2ucOu8GaTWwyB8Ljh51GNSLY0+MoonQisWzOjTd+U4vv2fjHY8cSAMUSc36ZwSZ9uARkY8T/tgR2NkXWlbDlkyHERDMCGLhRtL9PkpniDsaN5tjHWcCfJhzX27qQkN0qNS3gnplWuJ41+M0xVHN5SHr7EfwjBL8ToRvSAE5lU0LYlMa4zmZacMXzommOcLiHhpIguhkB2ASTic5fnwolVcptMYe5j46+sGFvmpYrz7SwOEXx5W0FqWcq0IXpa/0nZNWHzftW1XXePZ88mK+urxebKXOMYjf74vBgnu0JwYhD5DtrUvWknfyOtNJOT601HaT8oNctRGnThE9SSGJwDgFAkkXRIsgOrvut5goYQmcOwFf81Eib2bDmRCT9sq94FO8yhibQZgGWpVhGg5MkGIWwVoJPRvqItWkOjc5jc28dLSgQlqzlYPxj1zcZfL65yhuo1mzR5+YDTqV2x1SIM+MmSBqJ2IM6mfybeLSnHMJsqcvF9pTgsDCS0NmmSlnY3wMHhKGSWeNPJgjTcHhbWV63mP
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(396003)(346002)(366004)(376002)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(1076003)(6512007)(2616005)(26005)(82960400001)(8936002)(41300700001)(4326008)(8676002)(6486002)(316002)(83380400001)(44832011)(5660300002)(66556008)(478600001)(2906002)(6506007)(66476007)(66946007)(6666004)(38100700002)(86362001)(36756003)(4744005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Pf1j/5aN08sEa/ZmVrPD5d9eglchzgfuPvc85+hzJexWc01imGiuDvkUHD1X?=
 =?us-ascii?Q?YX0W03xAhbCHy8tyyyDOuXR8yRHULzwxpmrg6Fq6Dl0uZwA3ipR77Xv0Yi5j?=
 =?us-ascii?Q?iPTOHxHQC5KpJOjWg8BtLaHn1usIXoOh1aeqvzYUX648lRm/5fdgKzwXBbeU?=
 =?us-ascii?Q?hFmyodALkq5XIz/2Wm8KATlZA3s55/qzIKyZ9C3+rqRiQzirPl30vwmmfdSF?=
 =?us-ascii?Q?nGDQRs/jJwn/EtfdnLHBhVW32ei35b3NetmvzOJ2isj7uoL3JsVH91kVi0qJ?=
 =?us-ascii?Q?bBmqG+gLQeDcukyvpvv5FFb22ysObrjlxfwuCeqVAUEVjmCQvx8tBZ75AIqS?=
 =?us-ascii?Q?lZsQakmD01nLgpij3hozu13BMJ1RMa0vtL0zAg1dvIfMhx5nmPlGi77d5Np1?=
 =?us-ascii?Q?AQOPICTLcBVdL8tI7MMqY0L5l7O7QQvTaorE1rOcsrjXGjnc23d+Rme8WVqp?=
 =?us-ascii?Q?tZC1EqJw3NmHRli9vUj0KtxGRvtjoWY+yqgp7YElGC14NWF0/+EnQxqMqQcV?=
 =?us-ascii?Q?2D4js4QVTCofAXBZV0eTOMDZjdhjC1oa1BqJS7HLIuNOOHzyBJByrUW8LAcc?=
 =?us-ascii?Q?LqXWs13vKoy/p13uHjle0ckLLqVNUaGW+Q328oOwvv1sPKVE+QxbG3WQuS18?=
 =?us-ascii?Q?T6j3h/AuUaGCi/u7jMgRvzPvdGJ0rCKQjUQDJpYKu57qNHfebsy+Y4i99bH4?=
 =?us-ascii?Q?hFsaIzAUK/qygs8TMzdamHXLME42w8NPAJFOwBligf+VqpUVBt5aSov/6e1y?=
 =?us-ascii?Q?XLjKrNxM6+j00jUFbsXog0YIiRkRYvMcg+IRhF3isBxuNLR8GtRd5UCaK17Y?=
 =?us-ascii?Q?yLYWOdjTPCZTDauNDZ/f4b7BPqEWZ9/pE3oPlj3TJVORWXyB0udkY69pBwBW?=
 =?us-ascii?Q?vppLmSywdsHGPnjktlrNHdE1Q/X1al134AQXs+wHIWaC44h/Zw6Q8gBt/UbL?=
 =?us-ascii?Q?mLu8yb8wmAedH9KioI6jh9YmU+SUaNL7OMJPuty/QjfTGey8bj+Nar2Uksxo?=
 =?us-ascii?Q?pq7MjAMdIILzWFKb9HAGUuEb/aPoTWrGOiDvz/ObFo+x4aESI5nWQIGa+zAd?=
 =?us-ascii?Q?geCi9j1vLgBmi3CoZXjZqkv3v5r7sfpoH64h2u5hWyOvPhy9EsiFt52FGKo1?=
 =?us-ascii?Q?1Mk6b8xLw6eNh7u8NEiE5mnu/A8DjE1hwz41OTZJAxmpYKMMykHZsFyONex/?=
 =?us-ascii?Q?JWIV0ZGrg4XAR/CwdZsi970SffSl5DnEzLakg3cNrxoPwdZ37dWNOrBNY817?=
 =?us-ascii?Q?7OvsUC1B+kk022oo5rl9sROJnk8r1bN4k0HFW0sVdVemDa4iTfvnEx93Igm6?=
 =?us-ascii?Q?Lxa3qQJaawbyesAfKKT/MDJo1V38C3L9l9SMToV2Br46tr6aFaSZJG8JzAKY?=
 =?us-ascii?Q?Y0NE/KO4ekCGVLjAFJNdrVjJuv3baQ8M4x+2eKX34BiuC//ssIDwM87Rq/Nf?=
 =?us-ascii?Q?JPW9pdRvA1Mf1uXnb4P/MrYNhsxzyTBJD7a9i+TvFvF+YxHVyTvCdHjZXS2Y?=
 =?us-ascii?Q?4AiadBSZx04giuQxCON4sX0vGNAZluuzfFrVB33oK422w15V4dXZkO0zwjks?=
 =?us-ascii?Q?c/MZIz8vdffi4n4MCoX/HgyRszOYXol3FdEa0VZVV9QcIjbM5EOY5o/MirWe?=
 =?us-ascii?Q?5Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ed577457-e328-4e36-04bb-08dbf810feb0
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 17:13:28.1153 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KPp2gFTUmkmcnYRv9LbWmGxhWE81yT6ZhZqreJds5mtNwjRoFhli+fnBkgv6gOYsa9oFVkIFhrp/fwu7pUk05w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5934
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 include/drm/xe_pciids.h | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/include/drm/xe_pciids.h b/include/drm/xe_pciids.h
index b1b4e50f5e0e..de1a344737bc 100644
--- a/include/drm/xe_pciids.h
+++ b/include/drm/xe_pciids.h
@@ -182,19 +182,6 @@
 	MACRO__(0x7D67, ## __VA_ARGS__),	\
 	MACRO__(0x7DD5, ## __VA_ARGS__)
 
-/* PVC */
-#define XE_PVC_IDS(MACRO__, ...)		\
-	MACRO__(0x0BD5, ## __VA_ARGS__),	\
-	MACRO__(0x0BD6, ## __VA_ARGS__),	\
-	MACRO__(0x0BD7, ## __VA_ARGS__),	\
-	MACRO__(0x0BD8, ## __VA_ARGS__),	\
-	MACRO__(0x0BD9, ## __VA_ARGS__),	\
-	MACRO__(0x0BDA, ## __VA_ARGS__),	\
-	MACRO__(0x0BDB, ## __VA_ARGS__),	\
-	MACRO__(0x0BE0, ## __VA_ARGS__),	\
-	MACRO__(0x0BE1, ## __VA_ARGS__),	\
-	MACRO__(0x0BE5, ## __VA_ARGS__)
-
 #define XE_LNL_IDS(MACRO__, ...) \
 	MACRO__(0x6420, ## __VA_ARGS__), \
 	MACRO__(0x64A0, ## __VA_ARGS__), \
-- 
2.43.0

