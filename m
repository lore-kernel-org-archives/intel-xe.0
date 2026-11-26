Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02683606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 10:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZKX7FDwz;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=DpU98o8F
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97B851122AA;
	Thu, 26 Nov 2026 10:08:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D721F112284;
 Thu, 26 Nov 2026 10:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795687704; x=1827223704;
 h=from:to:subject:date:message-id:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=p4UXP6iPOhP0wEnFzENS6Reo1VRVraU8ugzPF3s1qPU=;
 b=ZKX7FDwzfeQKBfwUc1SOLUgKKEudU3+epFNRzbXgLD6At2KD5mMJWYKZ
 dsH0w3SQiljpBv4kluuQeonvEIj/Ff7jLwFqpNLYMa+3buYkqwgFmbDDm
 T7Mzy5JYuQkuawiSxoHnZhQQ3TrdSIxQzSLAnJpqdUXLnpVaR5QoYe/QK
 H3EAgI8SJCsyWeBG7UkBhnqXWcZzBSN/OJXE2Ih0VUfHaVGdjZB3KUDvM
 0GmEeXMRR2pALcsXL8m9iHJfa65t2J45qJV4Q5CFTgurmfHiKBNjJHo6S
 pn6lq+QFazKHFHT6cZlBsoeDV1MVxZ1qw1Q4EaMnXNO7QqVBx9C8RB+3A g==;
X-CSE-ConnectionGUID: jqNEdhJLSHW1On5AMusVHg==
X-CSE-MsgGUID: YzwmcsnQSSi2DwFrj8pjoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4434821"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4434821"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 02:08:24 -0800
X-CSE-ConnectionGUID: XJzHKDmuThmWJbAur1wc8w==
X-CSE-MsgGUID: 7w456YRiSXC4pWnbukU2Uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; d="scan'208";a="12432773"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 02:08:23 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 02:08:23 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Thu, 26 Nov 2026 02:08:23 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.47) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 02:08:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WE7UQB3ILeAFfwFCBSWarJtXA59Cfe9YDcM06qslZI6BCO+G2GqtwfpYjMZr/wC1svJkz9u6b1iRb3ex0IKDu/srNi0KZShkzB0eMXduZW2XrknbLDgXkPW227JEFu7LI8Tp59xa+FoHUsZKc6oWBeUbQGyCGIkozT03P0j+l7vZhURaGhBSfxemE9JzHFw4U+C6mmhc9GXPJeNeXOHTCe3yu3vBe8mppUIulqmDo4JNv/+PEXrGWuQ0q8+HeT4wGgcpfgNTCXrXXfhHxOS5Q1vUCTmH9KnIS4966XHAML3iQmfx9J06F5vYKC80yUKartJOveb1JBRvqM50gW04eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ik7aanFlnqLjuJbDu35ldcyW8bbPC951cnaZUADYLwI=;
 b=kstVGpp/VSEhHZOIVeLHpWVA77u/ENlH0xM5GoDB6F+YHl+20beQYd6xjCxc66YzheVPSs++/DcJIaUGhhN7NM24FYWCIqadqbCauV7seBHvkUUtzI3C2KFMY8FwLAJhS4xpxFDm3F1N++c4JxjHZxecIYg5pBfyDKA5BsyLTdcpBfsgQReIfSF44WVr1NJt3a6PxIqqnfmfmOOWIE4OO+Bv0iXeyh7rCaPd4t2p03K9zRyFS8wRho5TB7Dh5sriFuEVTiDd+/9NZjpQD5pk7igXM1XUAti5UBUP8NDoh6NDXbrXNxpMljl9PlgJdWZool2zUoHCZ8z2KgBbNPgliA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ik7aanFlnqLjuJbDu35ldcyW8bbPC951cnaZUADYLwI=;
 b=DpU98o8FJQLl3+bQ4xd+nm7ve4sTp0g44hpxRpUMS5qjLBEhUVCEYIYuuVL1KVr5ylCk6QGuwWa6R/6QJ0ik4QTXpDR3CHHvx0qyVUKs8bVBJd5+RIfSbYMUk8wrNB8vK5DqArkvQr7JucT8QQmIGQQ01HRAS8G3yp8fSeS4EXM=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9273.namprd11.prod.outlook.com (2603:10b6:208:573::17)
 by CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 10:08:10 +0000
Received: from IA3PR11MB9273.namprd11.prod.outlook.com
 ([fe80::31a4:58c:e3b5:43fa]) by IA3PR11MB9273.namprd11.prod.outlook.com
 ([fe80::31a4:58c:e3b5:43fa%6]) with mapi id 15.21.0662.001; Thu, 26 Nov 2026
 10:08:10 +0000
From: Imre Deak <imre.deak@intel.com>
To: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
Subject: [PATCH 07/13] drm/i915/gmbus: Extract adapter creation and destruction
Date: Thu, 26 Nov 2026 12:07:47 +0200
Message-ID: <20261126100755.1252635-8-imre.deak@intel.com>
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
X-MS-Office365-Filtering-Correlation-Id: f1d95150-6444-4dfb-13bb-08df4ba52c91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|10067099003|56012099006|11063799006|261026121527099003|261026140227099003|261028144727099003|261022105027099003|261022075727099003|261021123027099003|261021121427099003|261102130727099003|261102123227099003|261009223027099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: TzmlobvCtqotMYNeVO5vkxvlYyrbyy7PiKdDufeWtCqLnHinbxYXOfR5U8ffyaNFCVDslX6yCBPt+/u38znjenUrCPKdf78poocqyj6xst48UCWOP+teqRk2o6gWG6CQ6gyYl8+OG1enhzKl39CqxSLmG0GI7JmVJuUDpJezhLWrtBCFobMt78X9AEXRRxbKLDS8AhEVeEnNqRcdyEYORkxkp1eyj6zpOJKlFusKW10/wVmAJ8Zss53hhxMrkfQXU7jjaWcuzEQC1hdrY9Ked8dlP1aQn9x6nza+vwDfY32QAQlRZrA6y78Cyj/IzUJgKROW30MiqsnoQXkQmUfLzPrIgCJPYSKT13P1P0h20WB6Tm/ZMw9N166wx8d1LY+0aW2StHGdYERtvA7cMXvE89hinhydkgH15qeygC9/1ABXwgkbanNFG2N+yNtdwadhqpFs8h4EZtorvOpNZjeeUeVbZbE40vgcOwxIaINd4bSLP3S36mI7Nn3vr03eNBqcB6n9IX5K7NjsoFqIrut6Bppk7dK9VUF11YDC1NKG3Ha9DqWh+9+gJqnmAQG73Kkfih7Gj3gSXcTl0/2V4F30btDmuUrOygNzZTs0XQoCd8kDzKcs6zzdAcBEjz6LjmcgkxW3SDhvKBJoIrnioheTLaCbNy0LUv6nngSqPu44Kqc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9273.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(10067099003)(56012099006)(11063799006)(261026121527099003)(261026140227099003)(261028144727099003)(261022105027099003)(261022075727099003)(261021123027099003)(261021121427099003)(261102130727099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?M8n/7BOYqzreWU6EU2EGkC6vgPnIa34WDN2CL5pRZ6DSvjcc4+bydbmt0t3u?=
 =?us-ascii?Q?eMzW09iC1sw91mHFmqRUQ2FBC09YWaFX/oSOKwJ+BcsBYzGWdnIEvSrKL73P?=
 =?us-ascii?Q?cjS06Q0Bfm5GY5v81D11OnS+/bR8Gt5mgOOamxeHxuMhkEwwlODLL8+UOl/a?=
 =?us-ascii?Q?wR5AOGQF8gWymSg02cACecpPXxQ6gfyXkr/3l3nWanX3osCEzNQguhPUauL9?=
 =?us-ascii?Q?3opejK9Dvfr2dHfkK8o+Rh6HKhB1y6tUaHj1doiaSqxz+P/yIx2uqjWzJ0i1?=
 =?us-ascii?Q?Nom5v0yxroalXWIHevi5KuO9cu9MEZ5OaMt0RWQgfNzRhGVI3ckzwEg3CWO7?=
 =?us-ascii?Q?02hfOP2cnrcvz5EJ/Rhgu0Z5HgiJCUQf68XWDKb2P4FYv/ZrsoCjV7BIFCwN?=
 =?us-ascii?Q?IgAhJSSKUBlT2cXhzAf1xEM8lK2nFbvdKV53gdX9ah8Qon3Dqf/XLyko0i2+?=
 =?us-ascii?Q?GMs9TDKTRLx2CgrhI990V8kuiEcdylojCDTHOzpAd/PTEirUmpxNkQ6a/Rkg?=
 =?us-ascii?Q?pKNT+JOUgSa7Hwnfm1vyTmsScQ1yvZVq+WkHa/W2GOG7DihR9AhAxyuf6EP6?=
 =?us-ascii?Q?bIKcrEuzNf+2VhEOFQ2OobC1iX4IpUw7XhTBreyjhTDh+h2pvqgv8JUeONoG?=
 =?us-ascii?Q?F+asHnV6QNYADbzdn4zj5EzCwQZY4DTbaGg1ovgrPkQb3u2hQaaQMYMWjMoC?=
 =?us-ascii?Q?d48II8sXfsufGozk7Jtk1hDKY5bH17iTtsvRMDXYdRasbywyjKZu+6pU5quB?=
 =?us-ascii?Q?1W/32c9alUcdC20PY6dnQfcm+2pmRFJyjysIvfLwmMHdeUC8vUQ/Ghp3E8ji?=
 =?us-ascii?Q?63kprxCmUER++z0S1mkM5wB0tZQ5xja5fPc82GPHeY8azcAQvFF47XRZWhbP?=
 =?us-ascii?Q?BuQ+u/jrAA54Zjwv5CaOcBAmaRYY3mdbLJxYYepZ2k8dL3rTtN4lMAoycAcF?=
 =?us-ascii?Q?2owzKhzU/S5B894cp2fVjPP3yEP/6lptzczblZQM3Aek79IYWpY2ujaMQbaW?=
 =?us-ascii?Q?YOhXddAAcWMx/+bY2SgGj2MLK99MuXWRi+D0OBwaTOepzEyvGwWKrhbSLSci?=
 =?us-ascii?Q?eLAqT7j2UIM1WmcXec8HdsN9vqO1xkA8/eyfi/htCECfBrjBQ2PQJ8MwwPAi?=
 =?us-ascii?Q?Et2rFugd2FSqbhXBx/gEK4LiZhI+OAtPos66c76uNI79rC8HfGDmDBTMEwXU?=
 =?us-ascii?Q?6u+mKtYaB2MRbEOQFzcMT0uzRqoU5OMZblZ71AakC4Le340qpU+IVYi2o24E?=
 =?us-ascii?Q?NEA0+ApPnoAnmwBeYPJGTmmB7NW3StAs29zrL8PNC3sgP5XsLNP3GCSeb2cf?=
 =?us-ascii?Q?utPbrVJB31i6R6dE9HMXXBMjN61UAP9rR2wc3aCKMUEdsYE72Oc2YyJCyQQn?=
 =?us-ascii?Q?ctGYL5hnk/dTofPDm/wp9U1FdZ6dRHbtFANtGIYOFJ9d+DMs9tm9JX+wdNSo?=
 =?us-ascii?Q?K/MUcQg7qWmN6WrhtqXXzGagPtYDe+zLEvx8/wYM8Rf1fa4FtoCSV166IB64?=
 =?us-ascii?Q?AX69iENIZ8NmWu3C8tWUnnpFa8QqkvdvbQMZhPSHasuc+/xUeQwS/xdoh8rI?=
 =?us-ascii?Q?n8mQaNf8GehKXDPbz6rqLKI8k/x0WP5ZLv+ReXGmFquuWlqlz662D/t9wGdT?=
 =?us-ascii?Q?8LdZRROE5wGw33LtpizlJI/WgA75xZbSBZUmFX7mcQ3qJIt9Gf5F8v3lv/yo?=
 =?us-ascii?Q?6e/I8YG0NGSPN3ROCWxZmA/c2Vd0c0Lwd7EQm7N4MzYJx5oJwTMa9Gcyiydq?=
 =?us-ascii?Q?vKcrxFYX8w=3D=3D?=
X-Exchange-RoutingPolicyChecked: pEwRadEBuaDSQliXbTyLGMtUbbPCDE5+7SCz/MEM8dZC/bGHUAEJE+nDT1t9Z2Lkr1HIbnrabpK9dTRlF7XYWLdnjNiOLuiUIQ0kleGZSpnziIk/2ECf4vPHii2PiWD78cHNi06sNeXszEI+yDyGPGmUPF7zi3l0RuXRe5UbYnM0Ki/KC6SZHr2W4cbjb9lO2VCwl9LaOSSo+DNvDIqrmArUK0qFGg4MWCUiyE3/hSfzxC7wO+le1FUx3MOwuCMSh15MH6kPCUaxIgWzf5qln6xKXOhtZBIW3d+fWL1dsT07lmO/xJaUHtCe20lwu8RoMGM1onWnj0KciSH4HXiO0A==
X-MS-Exchange-CrossTenant-Network-Message-Id: f1d95150-6444-4dfb-13bb-08df4ba52c91
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9273.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 10:08:10.1321 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1qH501bTHSYMgtVEOt+nabXtHX2q7v+x+qXpYaDCC/kyGV6gmgb8s3aSeEblXCSXdjsWievZI/J/WOE4wjMekw==
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

Move allocation, initialization and registration of an adapter into a
helper, and share its teardown.

This allows additional adapters to use the same setup and cleanup paths.

Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_gmbus.c | 113 +++++++++++----------
 1 file changed, 62 insertions(+), 51 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_gmbus.c b/drivers/gpu/drm/i915/display/intel_gmbus.c
index e80822d3e9185..8736b39e1ea62 100644
--- a/drivers/gpu/drm/i915/display/intel_gmbus.c
+++ b/drivers/gpu/drm/i915/display/intel_gmbus.c
@@ -28,6 +28,7 @@
  */
 
 #include <linux/debugfs.h>
+#include <linux/err.h>
 #include <linux/export.h>
 #include <linux/i2c-algo-bit.h>
 #include <linux/i2c.h>
@@ -1013,13 +1014,69 @@ static const struct i2c_lock_operations gmbus_lock_ops = {
 	.unlock_bus =  gmbus_unlock_bus,
 };
 
+static struct intel_gmbus *
+intel_gmbus_create(struct intel_display *display, unsigned int pin)
+{
+	struct pci_dev *pdev = to_pci_dev(display->drm->dev);
+	const struct gmbus_pin *gmbus_pin = get_gmbus_pin(display, pin);
+	struct intel_gmbus *bus;
+	int ret;
+
+	if (!gmbus_pin)
+		return NULL;
+
+	bus = kzalloc_obj(*bus);
+	if (!bus)
+		return ERR_PTR(-ENOMEM);
+
+	bus->adapter.owner = THIS_MODULE;
+	snprintf(bus->adapter.name, sizeof(bus->adapter.name),
+		 "i915 gmbus %s", gmbus_pin->name);
+	bus->adapter.dev.parent = &pdev->dev;
+	bus->display = display;
+	bus->adapter.algo = &gmbus_algorithm;
+	bus->adapter.lock_ops = &gmbus_lock_ops;
+
+	/*
+	 * We wish to retry with bit banging
+	 * after a timed out GMBUS attempt.
+	 */
+	bus->adapter.retries = 1;
+
+	/* By default use a conservative clock rate */
+	bus->reg0 = pin | GMBUS_RATE_100KHZ;
+
+	/* gmbus seems to be broken on i830 */
+	if (display->platform.i830)
+		bus->force_bit = 1;
+
+	intel_gpio_setup(bus, GPIO(display, gmbus_pin->gpio));
+
+	ret = i2c_add_adapter(&bus->adapter);
+	if (ret) {
+		kfree(bus);
+
+		return ERR_PTR(ret);
+	}
+
+	return bus;
+}
+
+static void intel_gmbus_destroy(struct intel_gmbus *bus)
+{
+	if (!bus)
+		return;
+
+	i2c_del_adapter(&bus->adapter);
+	kfree(bus);
+}
+
 /**
  * intel_gmbus_setup - instantiate all Intel i2c GMBuses
  * @display: display device
  */
 int intel_gmbus_setup(struct intel_display *display)
 {
-	struct pci_dev *pdev = to_pci_dev(display->drm->dev);
 	unsigned int pin;
 	int ret;
 
@@ -1036,48 +1093,10 @@ int intel_gmbus_setup(struct intel_display *display)
 	init_waitqueue_head(&display->gmbus.wait_queue);
 
 	for (pin = 0; pin < ARRAY_SIZE(display->gmbus.bus); pin++) {
-		const struct gmbus_pin *gmbus_pin;
-		struct intel_gmbus *bus;
+		struct intel_gmbus *bus = intel_gmbus_create(display, pin);
 
-		gmbus_pin = get_gmbus_pin(display, pin);
-		if (!gmbus_pin)
-			continue;
-
-		bus = kzalloc_obj(*bus);
-		if (!bus) {
-			ret = -ENOMEM;
-			goto err;
-		}
-
-		bus->adapter.owner = THIS_MODULE;
-		snprintf(bus->adapter.name,
-			 sizeof(bus->adapter.name),
-			 "i915 gmbus %s", gmbus_pin->name);
-
-		bus->adapter.dev.parent = &pdev->dev;
-		bus->display = display;
-
-		bus->adapter.algo = &gmbus_algorithm;
-		bus->adapter.lock_ops = &gmbus_lock_ops;
-
-		/*
-		 * We wish to retry with bit banging
-		 * after a timed out GMBUS attempt.
-		 */
-		bus->adapter.retries = 1;
-
-		/* By default use a conservative clock rate */
-		bus->reg0 = pin | GMBUS_RATE_100KHZ;
-
-		/* gmbus seems to be broken on i830 */
-		if (display->platform.i830)
-			bus->force_bit = 1;
-
-		intel_gpio_setup(bus, GPIO(display, gmbus_pin->gpio));
-
-		ret = i2c_add_adapter(&bus->adapter);
-		if (ret) {
-			kfree(bus);
+		if (IS_ERR(bus)) {
+			ret = PTR_ERR(bus);
 			goto err;
 		}
 
@@ -1132,15 +1151,7 @@ void intel_gmbus_teardown(struct intel_display *display)
 	unsigned int pin;
 
 	for (pin = 0; pin < ARRAY_SIZE(display->gmbus.bus); pin++) {
-		struct intel_gmbus *bus;
-
-		bus = display->gmbus.bus[pin];
-		if (!bus)
-			continue;
-
-		i2c_del_adapter(&bus->adapter);
-
-		kfree(bus);
+		intel_gmbus_destroy(display->gmbus.bus[pin]);
 		display->gmbus.bus[pin] = NULL;
 	}
 }
-- 
2.49.1

