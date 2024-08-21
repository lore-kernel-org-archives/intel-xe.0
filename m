Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31C48C52D7C
	for <intel-xe@archiver.kernel.org>; Wed, 21 Aug 2024 19:38:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C022B10E6A8;
	Wed, 21 Aug 2024 19:38:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Do0Fx2zm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EC1610E6A7
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Aug 2024 19:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724269133; x=1755805133;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Qw1MIFZmWoDjikNpo3KUjAdOq2Q9mJbzfmw2/m1JkpI=;
 b=Do0Fx2zmjxnwouMU+H2jzi2AiKnyuhGSzCE/NSgWgAfYHmiFTNG1r6Yl
 mfDdIXIL0cowL4FSGekWCAYBTadqaxH5XwYHu/maIVzkCB3gFShc7PyH0
 DUkVhfz1TO7y6bWdvslZbBzkwlAIHa/Nj4IBPc+fH9k9xagX8JVzNcaEC
 E7PSHsLo8Wo71lzAc7gTWtsgOvA8k3lvj0erImQLxd5Eey5DP0BMFLvQE
 LBzKifYFqugWcqYZUmNGSk5Zfwo/9TpOtFOpPDEvAgYt5z82FnEIg16QR
 CsDGKn7u7SM2q4hvEmu66OReYnUeXV3hVqTBwIs/sO2LQhdbw14dg1sb0 A==;
X-CSE-ConnectionGUID: Gpcf4kSATMyhi3mYGOPl2g==
X-CSE-MsgGUID: 4TDkY0WmSg+6FljN0WvyIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="26448907"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="26448907"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 12:38:53 -0700
X-CSE-ConnectionGUID: mf8xQc9LRwuS3zKNE6Skfw==
X-CSE-MsgGUID: 0E397uwMTiCIyhvoOvWxjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="61191307"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Aug 2024 12:38:53 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 21 Aug 2024 12:38:52 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 21 Aug 2024 12:38:52 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 21 Aug 2024 12:38:52 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 21 Aug 2024 12:38:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EewDfIm7A/8CjE03SkTz3uQRzIoc5sB5V1jIuO32tvugWkUPBznUHPA8V68E3oB5aIVD6GYWMKprA258IQyWip2ggLi9mecXCH6QGv8BfALjl1mwJPg01B39oIbEjMUTMZS79viCbKbbmbuhsOdWTq0epNvaqAm6GFuDPM9OOXh3gqvEW5bHD1UZpzwDJwSCH9a/RMLV0UES72k8ARWPHQ+7iONNAr+FUB07UuXyAioEDeDC7Wma2qimBLqs8oNlHWAXOZWkHHGs2rV9z8loYkLPfuxuy3OhkQNiOx0kgKLRCQGBC+baXIqHOvl3iYGjl+yegIKR0rr496yFj8KLRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M9n4zj4tm68dbxIoJLq7qX24KVWzpf68sEZxKyeR4vU=;
 b=kqa0Ij1fR+ALAWxOspQ6AxGI4PSr1eVs1SaTSU8xcar1ctT6qsvUpNDB3/JGcvK+iVPn84tRCoLY1qNKeFaRZf1BW626rWhjq8CI59xtLRO8yoPrmo18eVVaVlomoB3+5yMX8JgAei53QU70yxAqkP9PI8E9LELuSTiEurv0MWffAX+1fkOLY0eBvTsytnkZLbu4GkQSLU+SdOKkTmyqw6kAGdArpJk1MiiuC5QjBJwZamYdkGdsAELpWXIdE22ATSsnEj0tlgb6L6YU+AI0+9DXG1lNLCBvmwsP7o+0alLkoPR0+BpggN/hXLVA6VaWpztaiRn/2asGYp9k6qtblQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by CO1PR11MB5041.namprd11.prod.outlook.com (2603:10b6:303:90::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.18; Wed, 21 Aug
 2024 19:38:50 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7875.019; Wed, 21 Aug 2024
 19:38:50 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <lucas.demarchi@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: [PATCH 03/12] drm/xe: Remove unnecessary drm_mm.h includes
Date: Wed, 21 Aug 2024 15:38:33 -0400
Message-ID: <20240821193842.352557-3-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240821193842.352557-1-rodrigo.vivi@intel.com>
References: <20240821193842.352557-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0273.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::8) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|CO1PR11MB5041:EE_
X-MS-Office365-Filtering-Correlation-Id: b4a50062-13eb-4572-ce43-08dcc218e1ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dH2snNxWf1DOrAcaMJny5m6P0nrbtJyAQ9AVf8/dOYJKs509udlAF6Ea0KzV?=
 =?us-ascii?Q?LV/wkXwD6QMv2Zg7sAD93lsqj/9U0G58RePUqy6VPNyLbW96JJwGH2GpGAas?=
 =?us-ascii?Q?SLNJAPf/r0u/LI42XKH/D7GF5n22chweo0ZBBfrjg2EbiK7MrUsNyJrkRC91?=
 =?us-ascii?Q?WRpGCBbVov/Ku7DZGO9YXAsgZd0DEP3izlhgOUit7i8rKAJEYQkXEfIbQUDH?=
 =?us-ascii?Q?WmZrqMscErMOBFjh9aOFPdMrjMrnn+0glsTy4T9yPiHO4DzS0nwE+IwqqBYz?=
 =?us-ascii?Q?JrBCpPiiiWRXTHwSJmzimvrLsCWLhnbFGNkr2EbVUzAiK+YCSx0TGxeDkZc3?=
 =?us-ascii?Q?eXVqIEn579SGbOAMgVPmHr+pT6L8NiKp6GO/WlBHoVNB5J9lwpHj8SWNRYNz?=
 =?us-ascii?Q?nySrbsQKU2AtcbNmDi1dymMSXS/7h3DiPxjjN9RXJlue2iDs/iWGZSbN+wYL?=
 =?us-ascii?Q?H3ViVNabxJi+Q3ochpQGfS+kiCZ76PsnjubkXajQZiOOtnmYfFIhY7skLhbt?=
 =?us-ascii?Q?rp+RJ08cH//bW+gnuwjcIO/Xucg6D+2LcXXZHGZS8D22VYdUVVNOP/KEDFiH?=
 =?us-ascii?Q?3cCFKijNtn8zFkT1dOdbI4VXCKHJW8QBeN6zhP83TVEz7Fv3IKQRf4ow74Vj?=
 =?us-ascii?Q?QGxIBuEfYdn4vnx9w1LE44o6lPHPeKd46EI9K5FuqbmB9S99J36/lX9/CB5s?=
 =?us-ascii?Q?Ka6USQyDUeFHApjg8p/gNYTGePzKBCCi3F3lZAwQntT9gwJt59ab5Z17rMre?=
 =?us-ascii?Q?CGC4WL9IiuSWO8YXTW9JnG/pqvK5luujxVQn0LDM+GWUayBxluWSime30IuU?=
 =?us-ascii?Q?3UDaXFRFbOUvbPMSZVtq5MkNlbHYYbS+iIMOIG8enYun0GjVNykAymJwSASA?=
 =?us-ascii?Q?6qaHREl5TEE76WBkUrxQ0+EYMJR8FyAN/f4wX5Urx7HUlKtqHGRBYhjYW7Ew?=
 =?us-ascii?Q?BlIR1CjM+d6hq/RYAd11nFgcpT2m2Mi3zC26PEs49IYs/r0Zn3tqheaRUA0i?=
 =?us-ascii?Q?ja2zTNpz6O++pJ9fU53KzikAHqHTk3R63huDbBgQCemJJ/ALCNcTaxRTeR34?=
 =?us-ascii?Q?X0DT+a/TGmnS+EqNk5OQVCD0t0ypt0ikDfDXNpGg/vYGRTC4maAQEfE6Xzg2?=
 =?us-ascii?Q?KZpgdffNgl/HoqXC03xw/tDQdCIAB89IsRF/R4VUEOkxUH37SBQRA1hEdx6y?=
 =?us-ascii?Q?kQTTopYZd9TYAbZo2DMpGOBasxk496i44XApmjNa/apEw4W50Eei8gevIh9w?=
 =?us-ascii?Q?e8vSkETsdmnFEpZzmTMAc+iO6R2z+ghc9i0Ju/dAU8DC8lAwngsfFEz79Xfm?=
 =?us-ascii?Q?pVis4fXNR9AVO5eolLVJ74bjKRAg57saQJzyiiFbb+QzbA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IS5lov4EAOvGH0obnnhlW5N0oUXEU2seNU/5zNRfVbW4rNm2K33iCfkvgUSw?=
 =?us-ascii?Q?XlFvfjsvUfeEB1CvQ7wuJIyzgpsxCz6GS/XKzQaxtbh7wdizi85hUqU7hyfC?=
 =?us-ascii?Q?+0vpWMrwHoz6P+kg+NZyh9D/hRYjHKEFmhKM/rtuLYWF6WjGXW/JJSXvezOs?=
 =?us-ascii?Q?2oQDkqQEjOrTzgTj4QTKTjPfE5gQLtScuxPS1MnYd9Fn1N92i1qEofLQOCQR?=
 =?us-ascii?Q?ZbcONCLIqzYmXxfP8rYvIah/dM0JmaUTt0fiKT4DKad/Nnfu4j4h2BkR2Axw?=
 =?us-ascii?Q?kbSu6FvzTGP9V7kRQJ9l1i4Tfb6n1DOL0pOyEbwNAVCUDJuviHtId5ZVjxTj?=
 =?us-ascii?Q?iXQZQrgo7vS3QOoUNY/Ccl06HgGUZlzQmSlk4LsLr67HeeQqLM0CrNambeRs?=
 =?us-ascii?Q?DCIe0IfTneIuNy72l7IHjQ4cczZNqQpsgLXpgzS+g2fNUmv3qco6EQ3ZkYfB?=
 =?us-ascii?Q?WsCYLC3NIfdh1xcKsyejMzp+1eLLOf6dmpvlCSCLKgoW9w1rNbLn2v1dP+Fs?=
 =?us-ascii?Q?O1dfugApWttu6yrArxJA4J/T+5egBrCtbUUmehid8nTSD2bEO+i2qQEpYa4y?=
 =?us-ascii?Q?xzxbpS/8px6bDn6zEF+Zbx10+pg31s+sM4kOKfNaVmkDKIKGmF6V8us8ZskT?=
 =?us-ascii?Q?E9SSXRloesxNPyzrdY5zw4ouR7OnIZ4dCaLV/LPsOrfhe6VCrmsComs0KmkQ?=
 =?us-ascii?Q?Wc+pfZfh7+sMPavuU5Eh9cWCdczPrDJxsq7XFWf+Tty95blCaVotdTqDa7p+?=
 =?us-ascii?Q?DxYZwDjaBA6SiizdCz6SjU8nYhpTOzPPd1SoAL/4ncjtioUa1RfO47/W6y7m?=
 =?us-ascii?Q?/UsveWKM5eF8eCHxawU1x8+ftqnbkZRX/fW6AT7mMAtCT9two4rIqr87EnIi?=
 =?us-ascii?Q?uPU8lLwoUzXghBwlBPQmn3/0w0EAi1oTJ05dS4Wc8z1uPrZSNLtGvwQPNyt3?=
 =?us-ascii?Q?6RR9FMuk34Obsskn33awXNHE3zMuWXxCHWMAAYKKftjUHIRqtI83Nk08RJqr?=
 =?us-ascii?Q?neI+CsN4DkRRcGbZXQYQfewSvVsOwvWZwQhMDcX6WRKZcFdA9KLtZzgcGEvB?=
 =?us-ascii?Q?FmSmfjTblMNN7B745VH96rUsRJWFO4rRhMTh2Z3SKdhAACobcP7oPhZl/Fmo?=
 =?us-ascii?Q?z/JVgsISFo+er5sTqnMyOArF7xLreMBREXJRE+LuUcEgygQy7x2jhv95d+z6?=
 =?us-ascii?Q?3Z54XnWYZoROEcwicewTuzwBkQh5lnLqcr6MXryvv1eePfB5zY0eq9YUpQPs?=
 =?us-ascii?Q?j6Fo23n4UbCK8Vh8zH7fRk+R//dZMW1g/6jIAp+43n/55NR7ZWXkAbvK3nUu?=
 =?us-ascii?Q?RkLcW3fb/LX+8b37wM/gwEj1WPGJ5caasLw02sQRI7Z7qxouqD+QvDXfm+0T?=
 =?us-ascii?Q?04DoVniKKnd+Q48PfS0fPlc7pd9+7QMBq16LRpoExXjggJQCjlZi6t4FwcbC?=
 =?us-ascii?Q?u48fDkCZ6vP2fT6hnFEMFKhlJagHvWzXxt/rNEP7Ca4HhIB13TlyV1L9P6mg?=
 =?us-ascii?Q?eWOt27Sr766bLu5SyGdjpK3VEj2N93Dz1cPfsy95C1xciK2AC03ttDG4bxWs?=
 =?us-ascii?Q?2K3MEazHzI07JWmLzZWVB/dO7QCKjA6Y1W2OsIa8DfxRqWKrhb92iz10viNv?=
 =?us-ascii?Q?WQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b4a50062-13eb-4572-ce43-08dcc218e1ae
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 19:38:50.4943 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oiwF2vzvA9Wluvha+r1rFD+EaTtlUp6Vh3NR98cqWBcoz6F5mZAwgqqw4fMny5rR8duBUHrA1SdcoMdkB/AwSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5041
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

These includes are no longer necessary, and where appropriate
are replaced by the linux/types.h one.

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.h        | 2 +-
 drivers/gpu/drm/xe/xe_res_cursor.h     | 1 -
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c | 1 -
 3 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
index 7929cc2425e8..0109866e398a 100644
--- a/drivers/gpu/drm/xe/xe_migrate.h
+++ b/drivers/gpu/drm/xe/xe_migrate.h
@@ -6,7 +6,7 @@
 #ifndef _XE_MIGRATE_
 #define _XE_MIGRATE_
 
-#include <drm/drm_mm.h>
+#include <linux/types.h>
 
 struct dma_fence;
 struct iosys_map;
diff --git a/drivers/gpu/drm/xe/xe_res_cursor.h b/drivers/gpu/drm/xe/xe_res_cursor.h
index 655af89b31a9..dca374b6521c 100644
--- a/drivers/gpu/drm/xe/xe_res_cursor.h
+++ b/drivers/gpu/drm/xe/xe_res_cursor.h
@@ -26,7 +26,6 @@
 
 #include <linux/scatterlist.h>
 
-#include <drm/drm_mm.h>
 #include <drm/ttm/ttm_placement.h>
 #include <drm/ttm/ttm_range_manager.h>
 #include <drm/ttm/ttm_resource.h>
diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
index f46fd2df84de..f7113cf6109d 100644
--- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
@@ -5,7 +5,6 @@
  */
 
 #include <drm/drm_managed.h>
-#include <drm/drm_mm.h>
 
 #include <drm/ttm/ttm_device.h>
 #include <drm/ttm/ttm_placement.h>
-- 
2.46.0

