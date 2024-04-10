Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00226C67861
	for <intel-xe@archiver.kernel.org>; Wed, 10 Apr 2024 01:58:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99140113098;
	Wed, 10 Apr 2024 01:58:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JsAq9aA0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C423A113098
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Apr 2024 01:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712714322; x=1744250322;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=zamPHjeQYg+h9x2ixfJFTWSZRHhW39ZDq9H+TMurx70=;
 b=JsAq9aA0MHIm1C8veRd3c30WLCOuJEsHMvQRaVUpmROihvuZ5daItNkd
 MqhMNLP6OIRiWJ+HE+sRsKwZCZnSZmV4oTRpGPHM0HytE7S8rONmY9Bqq
 BHzvJC5gI92ppjpmJaDS0yh2v1YwquBSieNV3B5Eqa1LpPN4Jqslwik4z
 ys01iRU2TWUg7Jhygfi7VcgCaAS97LdZMgcjM0KbdLYPj+qB+x7P8GkV3
 wqocFdeMcu7sDtQPTX+PO3GdbFeapX/iEGQ5HPEN9E/cS3a6W+fE/Q7T8
 hWI7YQAk93Pw8S+fxFpjM2EHH/PA8h86ILX/9wl2hE6AT1ZgBmvgJonco A==;
X-CSE-ConnectionGUID: Am8AFaWHRLyKyYUSE4H9Mw==
X-CSE-MsgGUID: /mUoVoHYTTGY9EYkSTRjKg==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="19485117"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="19485117"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 18:58:41 -0700
X-CSE-ConnectionGUID: eEiCk60wT1OSpMQ3t1tn0Q==
X-CSE-MsgGUID: AqoVboQoT1aGHd6zdN5zEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="25163691"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Apr 2024 18:58:41 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 9 Apr 2024 18:58:40 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 9 Apr 2024 18:58:40 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 9 Apr 2024 18:58:40 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 9 Apr 2024 18:58:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YNDOFZZ9WpS/i464QzRrK2C28YkkUcQKE7ZODDmcS1Q/PMFKSXJU81FM1RntWrl0240iW9CTBCcR/3qByWXmA4B7Zy+NnJT5HqKxH6GZXLMWbqzp+29yLn2zFx8zIYcaaeWWcasy48OSLB6P9B/3xvPRExc7fw9B+LVz4T1ScxRILkoRJUtUNI+T20kOnIbGeXZSPL/dQMz9EIWgmT4eBcUbL+Jlq2KxA57PHpBW482DVNkq6ZZO+f6xqqd4QaGUr6eqfUKPzb5AsC5m+T4yRwr2nrLfU+FpMStWnKHcZyIEerkI+y6Qc7aIiT7SGswfVKHl2zLu2F4EE1SqZptz7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B9RUCpwzoKbQFY0hKMjrQ0kwXdYnG1GotDV+VV+lrTQ=;
 b=JB6QcrRwDQm0PnPO9DULhM4+EcAb0bKR29DyVBcHSChYhmWTTosk+6PJCpQ7b2Tq66CjM+/11jVCYdUZNFWdESvHCvE1XgFc25Grqv0oVo2Ggh86evqKLU1r9XK/rGguyny/RNLc+/YhzioKLohtBQSSvSu9pfFB08FDzViCzIKezD/ywQwLaafA6bWq83T/R+HRm+lOh21ALBqQdXXsjyl+clTlqH+40D1BFKoJDpEFUpx/eGT4KZypG8VqjhobL5ZLXwpjOgu6stWnqTuxLPBAwyxM+uODVpDNorC3qJ2REUaEDx+AjHOiv+8WldFdMVaDfMgPDh6uLlCEs0XZlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB7963.namprd11.prod.outlook.com (2603:10b6:510:246::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7430.46; Wed, 10 Apr
 2024 01:58:39 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7452.019; Wed, 10 Apr 2024
 01:58:39 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Francois Dugast
 <francois.dugast@intel.com>
Subject: [PATCH 2/9] drm/xe: Introduce intel_runtime_pm_get_noresume at
 compat-i915-headers for display
Date: Tue, 9 Apr 2024 21:58:18 -0400
Message-ID: <20240410015826.1093368-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240410015826.1093368-1-rodrigo.vivi@intel.com>
References: <20240410015826.1093368-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0268.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::33) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB7963:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qj93kemso9bWD5zjgLWCv8AGNzLfLPdQEmYes4vrCjcTMLpY34c1oE9UgRFOrmmidmRhiHzWnQmqNM4jjwPTPXci3iERIiyuBfBEgL9v9v/OCYJYIIEyr7shztWUsqVRyO3XHrOIjcmH9zL8u0AcsgqIT4eNDolLKKQsNLOsvRJJ8BL5dOHUJ2b8+soDjgJ5TP/lybAcNXbrNtmq+kN1NUUj1mHFMDSjrxMFj7v7Z7NzQRLsaJ6EZMANAukAz8tdCb7PunZYN0M1neAhT0ponCK+W8y4TqYWbFSynnCTYE3shMWgGmck1+28oCdDiTROC5Ltl5L52LqrVpItzpr12euMY/JvRtQ66Kvdq4gb5Mf/3n7EWyGxiiMhjiMLXBYgIJavKcqFnT0UYuf3BtSyHBUL/AOcPduq5sJvQn+wW/Ru4VkSEy2R1z7kPSRe+2lpH/xHgbxazXMTk2vfm41IcaMMt801gOCNl8ayOofOc0/WmonmZSt/Hd5oAucEkznIKLIvbPX50B/kkwqPgUwo+YpbXbXD/UfO2q+zYHMho+19nckwbD94tU31ZpJirbNNMwq/dh2iAMUJ8Se8Mw91b1Nu8931XetDtk2ha7bb2BAJjyTLALhgWqampEWvFkIyy8NVJtmI9Jg+7w5LtgoPsSmhEQQif/OiSPtw6bx3VbQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?s+HGmPiBol8eEdIADC9iGnORXgjfZlpkXPTWmzz9fKKUM7uYhQHL/oyh/WwT?=
 =?us-ascii?Q?i3b3c1DhRb90LN77H79Nkio45+cebNIArT0vNFOvSkbIwJns6Ucf81bdsD7E?=
 =?us-ascii?Q?pMzNH7SPPAkSuaQpt8DoaUeq9EubME2c+eo9p0wwnEccUh+5Jp1Od9tcTy/p?=
 =?us-ascii?Q?UQDkHikEpNw2RXLRE3zYEjOttx7C5Czjpge9F9OjH0qHBSIbjO2MGEKVtxfs?=
 =?us-ascii?Q?K4HZEGLmltQU3nBc7tmgxfPyJug7HkhIcCsLAXShyydOoQ+4BQ8DXo4VA83I?=
 =?us-ascii?Q?yar4ApOvLXzG25/Y5vzPwaAcsSpDR/W47rben63EvKh6EYDGXWtLX4gmZw3w?=
 =?us-ascii?Q?aoBVc83qLNzM896EvBkKys50Wd8Tsv5ZIHFxzedA7jP94rYkLT2SwOdZgsQL?=
 =?us-ascii?Q?96MvTSSs6+qeqYNnt8rU4qcea+9IG0urlgrtmae2q2jajZBFqq5uVMebgtpI?=
 =?us-ascii?Q?1VktnS6UMHruu9VeG0uhc8C6X0M6kkTktxjacefYkJhN8y6+sA0ZzZeq3WdR?=
 =?us-ascii?Q?Xsezj/LVuFHu8TE5GGqC6lUZs7dSq/RSfG8raqIYYclLWLho++ow9yOKCEo+?=
 =?us-ascii?Q?Co4t75i44of7lmB3E0Ksj67c8iCu25twDsSYtTGXFxXkb9obINC6X58T3uFV?=
 =?us-ascii?Q?DMsYwkUKj9sTfOEouANE/nJtf4WHthJXwpaGno4rExIi1txbOv1v4wT350d+?=
 =?us-ascii?Q?4v3QWk1U+5SOLaFf0/3qQTEaEg2fAxSypVXEAanBJ3Yxb6QmLZGx0yuwvMc7?=
 =?us-ascii?Q?NxN6mqeg/YugLYFhFYvxxYGrD6Knbs4R1foKiifYbXyNVfCKJOvVQvMIPZHc?=
 =?us-ascii?Q?qJYc/BkmU1NqNEKmu5RW2dlMsExCLdJdPWjzQoz2qjgG9wJls46q+k0UAQW8?=
 =?us-ascii?Q?WZyxgLdORfO6yUd8daMpNFpefinybGQLmuulnUnKM51yULMIO6K0ZzjSoOvS?=
 =?us-ascii?Q?WgIjJbWcnY9O5Z2Y6PzjFjjAZk+MM/3PI0a8ZMqQpvZ5JBThl1iLw3kYIANo?=
 =?us-ascii?Q?+yutiCw3iwxVJxYdvbRsqh/zuFUUP3FU6/0uPhT4a1txlITTIcpDJpnEJdN9?=
 =?us-ascii?Q?KTV5MZRQV/rLvJmP/o3xiOdsb/go1ga5hswhWjmhTbhRLAapp4wSmbFb+bGN?=
 =?us-ascii?Q?hRVPYUkQXH+ISJkDJqo3SMRm5dz6gvuE2aiapPP8MFbLfcpMtskhaLS0j/cl?=
 =?us-ascii?Q?mcnqLG4UlV9G2s/lqvzu+cmDISJalNl52GSTN9q7uuJqUmacWOQwQYuZSBg9?=
 =?us-ascii?Q?V30djBDxpxBCTHyXt4Fkh1ayWS0D1McsEqxffQmKHX2Too8qwb7NEeTIdj90?=
 =?us-ascii?Q?52dV/A7Jwi9i/dsJfrmbku2Sdj685QlF5/6v7OhXoSWiDvzd2VZCBCalIJOO?=
 =?us-ascii?Q?NpHog20RQvDlZq1bTFnrTy+iNcbOTyuxV81zXKGSQFk6cxjLUMw7tJWsiuDQ?=
 =?us-ascii?Q?H2afc5S/cUdoT4LJdj8/v8yyM+sTSNBH5jC3IKNYcCkL8Z6kaYnEOIFC/Ama?=
 =?us-ascii?Q?qpPbskgag4MiqG/w+F6U6VF88iNQ6Vevqg1gBVVf+GIidqGiYcOkztxC6H4k?=
 =?us-ascii?Q?J+1MCVlM8VVCZkhLQkQacDYQoqSfYKQcYtgZ1uXKG9wZA6pvHMpWAuA2QYLx?=
 =?us-ascii?Q?7g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 19d327a4-f40c-4d95-b0dd-08dc5901bd6a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2024 01:58:38.9987 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0/3unc1R1mK0pexNbm0kM3zixb5gDJyFZYpDMOcDc2YeIRUEeopYBKtcsgbMxCaMxgusJ4GLuhkbEexdSddY/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7963
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

The i915-display will start using the intel_runtime_pm_noresume.
So we need to add the compat header before it.

Reviewed-by: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
index 484a71cbb807..ffaa4d2f1eed 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
@@ -138,6 +138,14 @@ static inline intel_wakeref_t intel_runtime_pm_get_if_in_use(struct xe_runtime_p
 	return xe_pm_runtime_get_if_in_use(xe);
 }
 
+static inline intel_wakeref_t intel_runtime_pm_get_noresume(struct xe_runtime_pm *pm)
+{
+	struct xe_device *xe = container_of(pm, struct xe_device, runtime_pm);
+
+	xe_pm_runtime_get_noresume(xe);
+	return true;
+}
+
 static inline void intel_runtime_pm_put_unchecked(struct xe_runtime_pm *pm)
 {
 	struct xe_device *xe = container_of(pm, struct xe_device, runtime_pm);
-- 
2.44.0

