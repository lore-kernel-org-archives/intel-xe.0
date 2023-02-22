Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 776C6C636D6
	for <intel-xe@archiver.kernel.org>; Wed, 22 Feb 2023 23:46:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5567610E470;
	Wed, 22 Feb 2023 23:46:38 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBA0710E461
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Feb 2023 23:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677109595; x=1708645595;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+Zf5dcpNgm7cRiWjaOYS3Y+S/ERa4Ts2ik8SnydIaUA=;
 b=JBCLxGJOYuYkj35SEqhR8lmcX8bWvtUcxZYoxlRu1YjQXl8H87oR21dH
 Ty/QH8thdiTqgu5NvJKrA/hudpsVUvJyO4/iNqTOq+vtGV3yn6L+I9znc
 GS9hPn2K1VTkZBPBKQ3fxYbbj+1MCIM35dhXHyN0DCPdn8qFUjw5tq4wh
 YMfx1He2cQqyHd9OA5Q0r1siLna8zgU+ZjBCF3e8ba8xGaKyvRReCrCzn
 1YVJVTd5nh4Vi17nC6BRLqdtopM69J2MJLuNB6U4huH4KqzpCF9KUJk1h
 eF9/l2MvZ2L3Jmnm3qrOl04WfPPnPyPuZLwUIQOq/W5nRUuFcgb+v9NY9 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="334433509"
X-IronPort-AV: E=Sophos;i="5.97,319,1669104000"; d="scan'208";a="334433509"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2023 15:46:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="672257202"
X-IronPort-AV: E=Sophos;i="5.97,319,1669104000"; d="scan'208";a="672257202"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga002.jf.intel.com with ESMTP; 22 Feb 2023 15:46:34 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 22 Feb 2023 15:46:33 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 22 Feb 2023 15:46:33 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.106)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 22 Feb 2023 15:46:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V+8ua/5Y6Z3Y+NnG+RpBzb72sE9nq4LZsYdf79qLKBmS9YAbSvO/fz5AGX6KlUSSwZ2bXtl1iBGPNldfBLhqsYPg3XaU94yiX93XqvNVT3nWM34O7Uu1gcZgyywhQYTTF+NloSZguo3CS7wwRx4ZMecadYMgZ189P/RQbX9S5usfw9e892dwjn9E0YVquceLbCYss8NveG6dHPX2kyr31mYLQYfWBhm31D8O5lfZQJmtuJMmF6P5jnoOSHSqAS61djGjV3H8XR9YMpHlF6QBfcZtVhUii4v28HOeNSULxScMdFCMZ/852X3D3Y29by9jCdV8tTha9DCjlJY+06bYKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z8WPOplfUZ2kRkPqLHAbfcNEFC5fl2Gtku4FOLnaQg8=;
 b=ZI7Ee1eMSKfYR/XmNqaGzFkyorZGAzsNaJYA//dZ8oxtB1rYq8aDyRucm228hzzANTwOfKotwfmKVBUqWk21ma88qAzEP2bygBFc4/WGnUfDZY8M8NN1o9vo9TPoIl5hkDlD96IYYslCRiJK5bMIpNgYMeJn5vaqlLHPCOuW/ob7b+3sPFeya5sjUiAL8rlVGsZI6PW5+e51TDesPCMEF42TRx2I8D2zB1Pu7eKsTLoZrKhOtPM8EfcXuj4t3/g5hrZyOGGs68c3InHESxHAZAXR+EbVClu6eSGoPhneUvZ+UjQjtNYwbD3jHIpo/N/QOzIeYJ9pOZCgeHpDjBf+7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB4990.namprd11.prod.outlook.com (2603:10b6:a03:2d8::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.19; Wed, 22 Feb
 2023 23:46:31 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8%6]) with mapi id 15.20.6134.019; Wed, 22 Feb 2023
 23:46:31 +0000
Date: Wed, 22 Feb 2023 15:46:27 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <20230222234627.kgzticaf67wfjaks@ldmartin-desk2.jf.intel.com>
X-Patchwork-Hint: comment
References: <20230216231724.2246534-1-matthew.d.roper@intel.com>
 <20230216231724.2246534-6-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230216231724.2246534-6-matthew.d.roper@intel.com>
X-ClientProxiedBy: SJ0PR03CA0055.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::30) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB4990:EE_
X-MS-Office365-Filtering-Correlation-Id: 229e9aa9-b35c-443d-f259-08db152f0619
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jsnG7esCSCkUHygyQvdIh21kHCL22vI3w8PG7oG6OwL033La9dvcMwKJoks3RhY9fyog507q7IG5uo7HA3/xy0+/AM9ntVXgqwusFIuznhR2JR9cxxffa88XkL+SVp4KsHFHuwUxaEalT+Sd3bfgfMfel7G8JtDUcOPKc2WYxlLVmQVWMe3cRWb2iaDrFT/i0lsLWWflR4mDweL/gmU4H1ITUGwSKRqJ/AYYWqFyNaaI+X4gE8XVq2J4K4njFivmUPlSaXwJ/cwjCawTFU4DQf4qwePBhUH5dh9FxWS4QuENAiZ+ON8Ah4K5wba4EKGWMz64sGkZBzgWHTAeH5dX7YoNUQhq6q6o1jWJGJQ/2a9TCmk75QnsQs6i4Vpaa7aiamwFC20izGSO3EzPaM4R5sc2LnIj4xgL85UzXVg9Cb2UpjK0QWY95Abgo5P/AcURePpA5TdJlguGeQmt+sbj2D79EW3lqMX2jlFCisX5dkTUrXLt37JBskhOWexrZdSdvtOzoGRRN1oHQUiHMb7gWr2AFdMKBKBcjw/0vvhJoaseesXX7eHh5+L/i0yA3d6oNQZvM1PeyBVBd1tcg6Mdz7zYQxEgeRJVi1i3Ju1PRQOBnaKMc2St1yItFTA/zuTgC7h/R/vxqJGU1Lp2DHs3MA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(136003)(39860400002)(376002)(396003)(346002)(451199018)(6486002)(5660300002)(2906002)(83380400001)(6512007)(1076003)(6506007)(6636002)(86362001)(478600001)(6862004)(41300700001)(6666004)(107886003)(8936002)(38100700002)(26005)(186003)(66556008)(4326008)(316002)(66476007)(8676002)(82960400001)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GG2vkkslP2RLq8H+4KY3O50PI8IAJ5XoE9pxr4oXWDhGGYhxMjCkWNUgmjTN?=
 =?us-ascii?Q?wmZzevFAk2NXyxdLLoUv6yd3FG8wR7hcTKCTFgj92pvhMkNyrtso3QP2aWkc?=
 =?us-ascii?Q?BsOSnyXy3/nQHURM0+UIaEGvn8QhO4460gxWU/595a4BuJNlkc6ECj8bmMuq?=
 =?us-ascii?Q?EljNndzbzCvdpSXdPu1If3kEsrPJhGMaekQ2o5hE2TPHiUiIaMfJLQunCfgv?=
 =?us-ascii?Q?cGbYQKZYAklfiRZpnt+Zms45kfRZk6cwngsRwPWQW0ct35SDGdjhk+dLv/8R?=
 =?us-ascii?Q?dXStW8nsFEhtjI6AYrTXz4+QGkC7ZT97PQf+H+eShC6yCjXtq0M/a7Wh0/b/?=
 =?us-ascii?Q?hnLYvtN03tUVQnfN3N6qGKJwTmrufOZT4Wj0svapYOxCW5Y6jiAHzTBMWMk8?=
 =?us-ascii?Q?WDOIu+tSRgj/qLz4s3zuaWcR0wRRe3IU3ikZP7t6XppDUZBJrSOvmBvA9b2s?=
 =?us-ascii?Q?BKGM3gfrQK+Y7oP1gpg1BRDRZyK2ldesAt2CAagSys2veUBeHy912/3ccNZp?=
 =?us-ascii?Q?0IZHbWTzMgnXEGmewL0+J/CBj5ghd2i3CXTqESHgt3xgA79s2jd6pFipEuHH?=
 =?us-ascii?Q?dH/vS4UlElJdVfi6zhDeHLUw5s78Bbav6v/jn+ecQvkSF8y/2Hpjv3wFgCHh?=
 =?us-ascii?Q?roqVit+Qk+yppXdPEY+qAuy64bOf+xmnOFFFaVArJGo6fckn+Vl28uBHJq8l?=
 =?us-ascii?Q?+67Otdo3JmIHvUxNYjxgJ23KkO8VQPiyp+C9fr1V5y/NFaTjFs6AL0enmoat?=
 =?us-ascii?Q?dUwiidMm9as/+Ngohd2PWePm14IFoMM7N9Te8SFE0aoaBFyNCpkF4OTUZ2v3?=
 =?us-ascii?Q?/aSnL9PEPItOpPmLlBu7m1plsKWzho5NzqXJPcYp9voY0rq/Kzf8MDca/atJ?=
 =?us-ascii?Q?4fgwjwpvRlXvzDDhWJDKiCAWtl/OAgNpkC62m8uQ1TFjklQNRMMxaZsfYOgo?=
 =?us-ascii?Q?nE+7byQY1Nf3E+FWnb5HW7h6YIfRLpksjZo3hJisU/VTUAy2aPuXi2nYZmY9?=
 =?us-ascii?Q?/hadMegMtrBjYBk4cnGHE9IiDIVxV+NMzSvCCxLVPk9HF75hw6aQSA91UE+7?=
 =?us-ascii?Q?uXAfpNQ26LGb1AQE0D4t7Oonn70O31rgQV/+DIsjEQT+lIO5CJr+p3BCdCPq?=
 =?us-ascii?Q?MkdWdOctF6I5XIvs0wwQK6mK7WdUTjeB5Jh1r9NvBtCBpviZ5rvxnJE5+J/l?=
 =?us-ascii?Q?oRGLgQzR7IpPnCErYxwD8XApusvWXVIckRLiN+KctJcWyM2/7UIrznT5BLt9?=
 =?us-ascii?Q?mD64Hk8KS+7PBAfxd5u7F9lOeVOSjR/8Vyl8Rqsn9Hyc/pNICXgRsslS04iN?=
 =?us-ascii?Q?n0IttuBl2j/kOmCcUSrowWrH8UDGKn/ppNnyRxF3+oeOjAwCFYFAM/dgQZK3?=
 =?us-ascii?Q?hD1bRB9ETm+BJUCHrP89coeYsv5FSjpP9YKf+Qz9YMNx/evlH0tDIn15rfTX?=
 =?us-ascii?Q?fJalQt6Enr2eODNyhGFjIZIL9y3Kdf9WCgMf+vGPqLNsY/yh9jWlhgs45H6O?=
 =?us-ascii?Q?Gd9za39m+/ggsAYmwI44MH2zJJGdV7n2u7ttxIIH2TlJ1cpLnhvAzhiq4mNf?=
 =?us-ascii?Q?mJsVwJwtbY5KbRn9duHC+GKn4uAqZZIMH9uMoVCxloU1hBxczkhHvJgIgoQ3?=
 =?us-ascii?Q?yQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 229e9aa9-b35c-443d-f259-08db152f0619
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2023 23:46:31.5567 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZRntESzXX/9mgELxsCeosE+vA26l3GnlrCdNMz0D8GpOeEWL6tpoyciIcFrS5n+soTHShCQY1DIcABoBqq3UR27m23mk8/3Rl8DpLjX+flI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4990
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 5/6] drm/xe/mocs: add MTL mocs
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
Cc: intel-xe@lists.freedesktop.org,
 Philippe Lecluse <philippe.lecluse@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Feb 16, 2023 at 03:17:23PM -0800, Matt Roper wrote:
>From: Philippe Lecluse <philippe.lecluse@intel.com>
>
>It was incorrectly using dg2_mocs for now.
>
>v2 (MattR):
> - Use REG_GENMASK/REG_FIELD_PREP for bitfields
> - Add bspec references
>
>Bspec: 45101, 45410, 63882
>Signed-off-by: Philippe Lecluse <philippe.lecluse@intel.com>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>


Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_mocs.c | 69 +++++++++++++++++++++++++++++++++---
> 1 file changed, 65 insertions(+), 4 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
>index 696001f60259..3b48934d99d4 100644
>--- a/drivers/gpu/drm/xe/xe_mocs.c
>+++ b/drivers/gpu/drm/xe/xe_mocs.c
>@@ -62,6 +62,10 @@ struct xe_mocs_info {
> #define L3_GLBGO(value)		((value) << 6)
> #define L3_LKUP(value)		((value) << 7)
>
>+/* Defines for the tables (GLOB_MOCS_0 - GLOB_MOCS_16) */
>+#define _L4_CACHEABILITY	REG_GENMASK(3, 2)
>+#define IG_PAT			REG_BIT(8)
>+
> /* Helper defines */
> #define GEN9_NUM_MOCS_ENTRIES	64  /* 63-64 are reserved, but configured. */
> #define PVC_NUM_MOCS_ENTRIES	3
>@@ -89,6 +93,12 @@ struct xe_mocs_info {
> #define L3_2_RESERVED		_L3_CACHEABILITY(2)
> #define L3_3_WB			_L3_CACHEABILITY(3)
>
>+/* L4 caching options */
>+#define L4_0_WB                 REG_FIELD_PREP(_L4_CACHEABILITY, 0)
>+#define L4_1_WT                 REG_FIELD_PREP(_L4_CACHEABILITY, 1)
>+#define L4_2_RESERVED           REG_FIELD_PREP(_L4_CACHEABILITY, 2)
>+#define L4_3_UC                 REG_FIELD_PREP(_L4_CACHEABILITY, 3)
>+
> #define MOCS_ENTRY(__idx, __control_value, __l3cc_value) \
> 	[__idx] = { \
> 		.control_value = __control_value, \
>@@ -310,6 +320,57 @@ static const struct xe_mocs_entry pvc_mocs_desc[] = {
> 	MOCS_ENTRY(2, 0, L3_3_WB),
> };
>
>+static const struct xe_mocs_entry mtl_mocs_desc[] = {
>+	/* Error - Reserved for Non-Use */
>+	MOCS_ENTRY(0,
>+		   0,
>+		   L3_LKUP(1) | L3_3_WB),
>+	/* Cached - L3 + L4 */
>+	MOCS_ENTRY(1,
>+		   IG_PAT,
>+		   L3_LKUP(1) | L3_3_WB),
>+	/* L4 - GO:L3 */
>+	MOCS_ENTRY(2,
>+		   IG_PAT,
>+		   L3_LKUP(1) | L3_1_UC),
>+	/* Uncached - GO:L3 */
>+	MOCS_ENTRY(3,
>+		   IG_PAT | L4_3_UC,
>+		   L3_LKUP(1) | L3_1_UC),
>+	/* L4 - GO:Mem */
>+	MOCS_ENTRY(4,
>+		   IG_PAT,
>+		   L3_LKUP(1) | L3_GLBGO(1) | L3_1_UC),
>+	/* Uncached - GO:Mem */
>+	MOCS_ENTRY(5,
>+		   IG_PAT | L4_3_UC,
>+		   L3_LKUP(1) | L3_GLBGO(1) | L3_1_UC),
>+	/* L4 - L3:NoLKUP; GO:L3 */
>+	MOCS_ENTRY(6,
>+		   IG_PAT,
>+		   L3_1_UC),
>+	/* Uncached - L3:NoLKUP; GO:L3 */
>+	MOCS_ENTRY(7,
>+		   IG_PAT | L4_3_UC,
>+		   L3_1_UC),
>+	/* L4 - L3:NoLKUP; GO:Mem */
>+	MOCS_ENTRY(8,
>+		   IG_PAT,
>+		   L3_GLBGO(1) | L3_1_UC),
>+	/* Uncached - L3:NoLKUP; GO:Mem */
>+	MOCS_ENTRY(9,
>+		   IG_PAT | L4_3_UC,
>+		   L3_GLBGO(1) | L3_1_UC),
>+	/* Display - L3; L4:WT */
>+	MOCS_ENTRY(14,
>+		   IG_PAT | L4_1_WT,
>+		   L3_LKUP(1) | L3_3_WB),
>+	/* CCS - Non-Displayable */
>+	MOCS_ENTRY(15,
>+		   IG_PAT,
>+		   L3_GLBGO(1) | L3_1_UC),
>+};
>+
> static unsigned int get_mocs_settings(struct xe_device *xe,
> 				      struct xe_mocs_info *info)
> {
>@@ -327,11 +388,11 @@ static unsigned int get_mocs_settings(struct xe_device *xe,
> 		info->unused_entries_index = 2;
> 		break;
> 	case XE_METEORLAKE:
>-		info->size = ARRAY_SIZE(dg2_mocs_desc);
>-		info->table = dg2_mocs_desc;
>+		info->size = ARRAY_SIZE(mtl_mocs_desc);
>+		info->table = mtl_mocs_desc;
> 		info->n_entries = MTL_NUM_MOCS_ENTRIES;
>-		info->uc_index = 1;
>-		info->unused_entries_index = 3;
>+		info->uc_index = 9;
>+		info->unused_entries_index = 1;
> 		break;
> 	case XE_DG2:
> 		if (xe->info.subplatform == XE_SUBPLATFORM_DG2_G10 &&
>-- 
>2.39.1
>
